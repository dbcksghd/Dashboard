package main

import (
	"github.com/dgrijalva/jwt-go/v4"
	_ "github.com/go-sql-driver/mysql"
	"github.com/labstack/echo/v4"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"os"
)

type Feed struct {
	Id      int    `json:"id"`
	Title   string `json:"title"`
	Content string `json:"content"`
}

type Comment struct {
	gorm.Model
	Id        int    `json:"id"`
	PostId    int    `json:"postId"`
	WriteTime string `json:"writeTime"`
	Comment   string `json:"comment"`
}

type User struct {
	gorm.Model
	Id       string `json:"id"`
	Password string `json:"password"`
	Name     string `json:"name"`
}

type TokenClaims struct {
	gorm.Model
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

	e := echo.New()
	//e.POST("/feed", func(c echo.Context) error {
	//	requestBody := new(Feed)
	//	authToken := c.Request().Header.Get("Authorization")
	//	err = verifyToken(db, authToken)
	//	if err != nil {
	//		fmt.Println(err)
	//		return c.NoContent(401)
	//	}
	//	if err = c.Bind(requestBody); err != nil {
	//		panic(err)
	//	}
	//	db.Table("feed").Create(&requestBody)
	//	//_, err = db.Exec("INSERT INTO feed (title, content) VALUES (?, ?)", requestBody.Title, requestBody.Content)
	//	if err != nil {
	//		return c.JSON(500, map[string]string{"error": err.Error()})
	//	}
	//	return c.NoContent(201)
	//})

	e.GET("/feed", func(c echo.Context) error {
		//authToken := c.Request().Header.Get("Authorization")
		//err = verifyToken(db, authToken)
		//if err != nil {
		//	fmt.Println(err)
		//	return c.NoContent(401)
		//}

		//rows, err := db.Query("select * from feed order by id desc ")
		if err != nil {
			return c.JSON(500, map[string]string{"error": err.Error()})
		}
		var feeds []Feed
		result := db.Table("feed").Find(&feeds)
		if result.Error != nil {
			return c.JSON(500, map[string]string{"error": result.Error.Error()})
		}
		if len(feeds) == 0 {
			return c.NoContent(204)
		}
		return c.JSON(200, feeds)
	})

	e.PATCH("/feed", func(c echo.Context) error {
		//authToken := c.Request().Header.Get("Authorization")
		//err = verifyToken(db, authToken)
		//if err != nil {
		//	fmt.Println(err)
		//	return c.NoContent(401)
		//}
		requestBody := new(Feed)
		if err = c.Bind(requestBody); err != nil {
			panic(err)
		}
		result := db.Table("feed").Save(&requestBody)
		if result.Error != nil {
			return c.JSON(500, map[string]string{"error": result.Error.Error()})
		}
		return c.NoContent(201)
	})
	//
	//e.DELETE("/feed", func(c echo.Context) error {
	//	authToken := c.Request().Header.Get("Authorization")
	//	err = verifyToken(db, authToken)
	//	if err != nil {
	//		fmt.Println(err)
	//		return c.NoContent(401)
	//	}
	//	id := c.QueryParam("id")
	//	_, err := db.Exec("delete from feed where id = ?", id)
	//	if err != nil {
	//		return c.JSON(500, map[string]string{"error": err.Error()})
	//	}
	//	return c.NoContent(201)
	//})
	//
	//e.POST("/comment", func(c echo.Context) error {
	//	authToken := c.Request().Header.Get("Authorization")
	//	err = verifyToken(db, authToken)
	//	if err != nil {
	//		fmt.Println(err)
	//		return c.NoContent(401)
	//	}
	//	requestBody := new(Comment)
	//	if err = c.Bind(requestBody); err != nil {
	//		panic(err)
	//	}
	//	_, err := db.Exec("INSERT INTO comment (postId, comment, writeTime) VALUES (?, ?, ?)",
	//		requestBody.PostId, requestBody.Comment, requestBody.WriteTime)
	//	if err != nil {
	//		return c.JSON(500, map[string]string{"error": err.Error()})
	//	}
	//	return c.NoContent(201)
	//})
	//
	//e.GET("/comment", func(c echo.Context) error {
	//	authToken := c.Request().Header.Get("Authorization")
	//	err = verifyToken(db, authToken)
	//	if err != nil {
	//		fmt.Println(err)
	//		return c.NoContent(401)
	//	}
	//	postId := c.QueryParam("postId")
	//	rows, err := db.Query("select * from comment where postId = ? order by id desc", postId)
	//	if err != nil {
	//		return c.JSON(500, map[string]string{"error": err.Error()})
	//	}
	//	var comments []Comment
	//	for rows.Next() {
	//		var comment Comment
	//		if err := rows.Scan(&comment.Id, &comment.PostId, &comment.Comment, &comment.WriteTime); err != nil {
	//			return c.JSON(500, map[string]string{"error": err.Error()})
	//		}
	//		comments = append(comments, comment)
	//	}
	//	if err := rows.Err(); err != nil {
	//		return c.JSON(500, map[string]string{"error": err.Error()})
	//	}
	//	if len(comments) == 0 {
	//		return c.NoContent(204)
	//	}
	//
	//	return c.JSON(200, comments)
	//})
	//
	//e.POST("/sign-up", func(c echo.Context) error {
	//	requestBody := new(User)
	//
	//	if err = c.Bind(requestBody); err != nil {
	//		panic(err)
	//	}
	//	_, err = db.Exec("insert into user (id, password, name) values (?, ?, ?)",
	//		requestBody.Id, requestBody.Password, requestBody.Name)
	//	if err != nil {
	//		return c.NoContent(409)
	//	}
	//	return c.NoContent(200)
	//})
	//
	//e.POST("/sign-in", func(c echo.Context) error {
	//	requestBody := new(User)
	//	if err = c.Bind(requestBody); err != nil {
	//		panic(err)
	//	}
	//	err = db.QueryRow("SELECT * from user WHERE id = ? and password = ?", requestBody.Id, requestBody.Password).
	//		Scan(&requestBody.Id, &requestBody.Password, &requestBody.Name)
	//	if err != nil {
	//		return c.NoContent(500)
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
	//		panic(err)
	//	}
	//	err = verifyToken(db, requestBody.RefreshToken)
	//	if err != nil {
	//		return c.NoContent(500)
	//	}
	//	token, err := jwt.ParseWithClaims(requestBody.RefreshToken, &TokenClaims{}, func(token *jwt.Token) (interface{}, error) {
	//		return []byte("qlalfzl"), nil
	//	})
	//	if !token.Valid || err != nil {
	//		return errors.New("토큰이 만료됨")
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
//	var user User
//	err = db.QueryRow("select id from user where id = ?", claims.Id).Scan(&user.Id)
//	if err != nil {
//		return err
//	}
//	if claims.Id != user.Id {
//		return errors.New("토큰 클레임 부분이 안맞는게 있음")
//	}
//	return nil
//}
