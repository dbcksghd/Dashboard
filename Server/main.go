package main

import (
	userPresentation "Server/domain/auth/presentation"
	userRepository "Server/domain/auth/repository"
	userService "Server/domain/auth/service"
	commentPresentation "Server/domain/comment/presentation"
	commentRepository "Server/domain/comment/repository"
	commentService "Server/domain/comment/service"
	feedPresentation "Server/domain/feed/presentation"
	feedRepository "Server/domain/feed/repository"
	feedService "Server/domain/feed/service"
	"github.com/dgrijalva/jwt-go/v4"
	_ "github.com/go-sql-driver/mysql"
	"github.com/labstack/echo/v4"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"os"
)

type TokenClaims struct {
	Id   string `json:"id"`
	Name string `json:"name"`
	jwt.StandardClaims
}

func main() {
	password := os.Getenv("PASSWORD")
	dsn := "root:" + password + "@tcp(localhost:3306)/dashboard"
	db, err := gorm.Open(mysql.Open(dsn))
	if err != nil {
		panic(err)
	}

	feedRepo := feedRepository.NewFeedRepository(db)
	feedServ := feedService.NewFeedService(*feedRepo)
	feedCont := feedPresentation.NewFeedController(*feedServ)
	feedHandler := feedPresentation.NewFeedHandler(*feedCont)

	commentRepo := commentRepository.NewCommentRepository(db)
	commentServ := commentService.NewCommentService(*commentRepo)
	commentCont := commentPresentation.NewCommentController(*commentServ)
	commentHandler := commentPresentation.NewCommentHandler(*commentCont)

	userRepo := userRepository.NewAuthRepository(db)
	userServ := userService.NewUserService(*userRepo)
	userCont := userPresentation.NewAuthController(*userServ)
	userHandler := userPresentation.NewAuthHandler(*userCont)

	e := echo.New()

	feedHandler.FeedRoutes(e)
	commentHandler.CommentRoutes(e)
	userHandler.UserRoutes(e)
	//
	//e.POST("/sign-up", func(c echo.Context) error {
	//	requestBody := new(User)
	//
	//	if err = c.Bind(requestBody); err != nil {
	//		return c.JSON(500, map[string]string{"error": err.Error()})
	//	}
	//	result := db.Create(&requestBody)
	//	if result.Error != nil {
	//		return c.JSON(500, map[string]string{"error": result.Error.Error()})
	//	}
	//	return c.NoContent(200)
	//})
	//
	//e.POST("/sign-in", func(c echo.Context) error {
	//	requestBody := new(User)
	//	if err = c.Bind(requestBody); err != nil {
	//		return c.JSON(500, map[string]string{"error": err.Error()})
	//	}
	//	result := db.Table("auth").Find(&requestBody, "id = ? and password = ?", requestBody.Id, &requestBody.Password)
	//	if result.Error != nil {
	//		return c.JSON(500, map[string]string{"error": result.Error.Error()})
	//	}
	//	tc := TokenClaims{
	//		Id: requestBody.Id,
	//		StandardClaims: jwt.StandardClaims{
	//			ExpiresAt: jwt.At(time.Now().Add(time.Hour * 2)),
	//		},
	//	}
	//	tcToken := jwt.NewWithClaims(jwt.SigningMethodHS256, &tc)
	//	accessToken, err := tcToken.SignedString([]byte("qlalfzl"))
	//	if err != nil {
	//		panic(err)
	//	}
	//	rf := TokenClaims{
	//		Id: requestBody.Id,
	//		StandardClaims: jwt.StandardClaims{
	//			ExpiresAt: jwt.At(time.Now().Add(time.Hour * 120)),
	//		},
	//	}
	//	rfToken := jwt.NewWithClaims(jwt.SigningMethodHS256, &rf)
	//	refreshToken, err := rfToken.SignedString([]byte("qlalfzl"))
	//	if err != nil {
	//		panic(err)
	//	}
	//	return c.JSON(200, map[string]interface{}{
	//		"access_token":  accessToken,
	//		"refresh_token": refreshToken,
	//	})
	//})
	//
	//e.GET("/check-refresh-token", func(c echo.Context) error {
	//	type a struct {
	//		RefreshToken string `json:"refresh_token"`
	//	}
	//	requestBody := new(a)
	//	if err = c.Bind(requestBody); err != nil {
	//		return c.JSON(500, map[string]string{"error": err.Error()})
	//	}
	//	err = verifyToken(db, requestBody.RefreshToken)
	//	if err != nil {
	//		return c.JSON(500, map[string]string{"error": err.Error()})
	//	}
	//	token, err := jwt.ParseWithClaims(requestBody.RefreshToken, &TokenClaims{}, func(token *jwt.Token) (interface{}, error) {
	//		return []byte("qlalfzl"), nil
	//	})
	//	if !token.Valid || err != nil {
	//		return c.JSON(500, map[string]string{"error": err.Error()})
	//	}
	//	claims, _ := token.Claims.(*TokenClaims)
	//	tc := TokenClaims{
	//		Id: claims.Id,
	//		StandardClaims: jwt.StandardClaims{
	//			ExpiresAt: jwt.At(time.Now().Add(time.Hour * 2)),
	//		},
	//	}
	//	tcToken := jwt.NewWithClaims(jwt.SigningMethodHS256, &tc)
	//	accessToken, _ := tcToken.SignedString([]byte("qlalfzl"))
	//	return c.JSON(200, map[string]interface{}{
	//		"access_token": accessToken,
	//	})
	//})

	e.Logger.Fatal(e.Start(":8080"))
}

//func verifyToken(db *gorm.DB, authToken string) error {
//	if authToken == "" {
//		return errors.New("토큰이 비었음")
//	}
//	tokenString := strings.TrimPrefix(authToken, "Bearer ")
//	token, err := jwt.ParseWithClaims(tokenString, &TokenClaims{}, func(token *jwt.Token) (interface{}, error) {
//		return []byte("qlalfzl"), nil
//	})
//	if !token.Valid || err != nil {
//		return errors.New("토큰이 만료됨")
//	}
//	claims, ok := token.Claims.(*TokenClaims)
//	if !ok {
//		return errors.New("토큰 파싱이 안됨")
//	}
//	var auth User
//	result := db.Table("auth").Select("id").Where("id = ?", claims.Id).Find(&auth)
//	if result.Error != nil {
//		return result.Error
//	}
//	if claims.Id != auth.Id {
//		return errors.New("토큰 클레임 부분이 안맞는게 있음")
//	}
//	return nil
//}
