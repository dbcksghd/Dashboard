package main

import (
	"database/sql"
	"github.com/dgrijalva/jwt-go/v4"
	_ "github.com/go-sql-driver/mysql"
	"github.com/labstack/echo/v4"
	"os"
	"time"
)

type Feed struct {
	Id      int    `json:"id"`
	Title   string `json:"title"`
	Content string `json:"content"`
}

type Comment struct {
	Id        int    `json:"id"`
	PostId    int    `json:"postId"`
	WriteTime string `json:"writeTime"`
	Comment   string `json:"comment"`
}

type User struct {
	Id       string `json:"id"`
	Password string `json:"password"`
	Name     string `json:"name"`
}

type TokenClaims struct {
	Id   string `json:"id"`
	Name string `json:"name"`
	jwt.StandardClaims
}

func main() {
	password := os.Getenv("PASSWORD")
	db, err := sql.Open("mysql", "root:"+password+"@tcp(localhost:3306)/dashboard")
	if err != nil {
		panic(err)
	}

	e := echo.New()
	e.POST("/post", func(c echo.Context) error {
		requestBody := new(Feed)
		authToken := c.Request().Header.Get("Authorization")
		if authToken == "" {
			return c.NoContent(403)
		}
		
		if err = c.Bind(requestBody); err != nil {
			panic(err)
		}
		_, err := db.Exec("INSERT INTO feed (title, content) VALUES (?, ?)", requestBody.Title, requestBody.Content)
		if err != nil {
			return c.JSON(500, map[string]string{"error": err.Error()})
		}
		return c.NoContent(201)
	})

	e.GET("/post", func(c echo.Context) error {
		rows, err := db.Query("select * from feed order by id desc ")
		if err != nil {
			return c.JSON(500, map[string]string{"error": err.Error()})
		}
		var feeds []Feed
		for rows.Next() {
			var feed Feed
			if err := rows.Scan(&feed.Id, &feed.Title, &feed.Content); err != nil {
				return c.JSON(500, map[string]string{"error": err.Error()})
			}
			feeds = append(feeds, feed)
		}
		if err := rows.Err(); err != nil {
			return c.JSON(500, map[string]string{"error": err.Error()})
		}
		if len(feeds) == 0 {
			return c.NoContent(204)
		}

		return c.JSON(200, feeds)
	})

	e.PATCH("/post", func(c echo.Context) error {
		requestBody := new(Feed)
		if err = c.Bind(requestBody); err != nil {
			panic(err)
		}
		_, err := db.Exec("update feed set title = ?, content = ? where id = ?", requestBody.Title, requestBody.Content, requestBody.Id)
		if err != nil {
			return c.JSON(500, map[string]string{"error": err.Error()})
		}
		return c.NoContent(201)
	})

	e.DELETE("/post", func(c echo.Context) error {
		id := c.QueryParam("id")
		_, err := db.Exec("delete from feed where id = ?", id)
		if err != nil {
			return c.JSON(500, map[string]string{"error": err.Error()})
		}
		return c.NoContent(201)
	})

	e.POST("/comment", func(c echo.Context) error {
		requestBody := new(Comment)

		if err = c.Bind(requestBody); err != nil {
			panic(err)
		}

		_, err := db.Exec("INSERT INTO comment (postId, comment, writeTime) VALUES (?, ?, ?)",
			requestBody.PostId, requestBody.Comment, requestBody.WriteTime)
		if err != nil {
			return c.JSON(500, map[string]string{"error": err.Error()})
		}
		return c.NoContent(201)
	})

	e.GET("/comment", func(c echo.Context) error {
		postId := c.QueryParam("postId")
		rows, err := db.Query("select * from comment where postId = ? order by id desc", postId)
		if err != nil {
			return c.JSON(500, map[string]string{"error": err.Error()})
		}
		var comments []Comment
		for rows.Next() {
			var comment Comment
			if err := rows.Scan(&comment.Id, &comment.PostId, &comment.Comment, &comment.WriteTime); err != nil {
				return c.JSON(500, map[string]string{"error": err.Error()})
			}
			comments = append(comments, comment)
		}
		if err := rows.Err(); err != nil {
			return c.JSON(500, map[string]string{"error": err.Error()})
		}
		if len(comments) == 0 {
			return c.NoContent(204)
		}

		return c.JSON(200, comments)
	})

	e.POST("/sign-up", func(c echo.Context) error {
		requestBody := new(User)

		if err = c.Bind(requestBody); err != nil {
			panic(err)
		}
		_, err = db.Exec("insert into user (id, password, name) values (?, ?, ?)",
			requestBody.Id, requestBody.Password, requestBody.Name)
		if err != nil {
			return c.NoContent(409)
		}
		return c.NoContent(200)
	})

	e.POST("/sign-in", func(c echo.Context) error {
		requestBody := new(User)
		if err = c.Bind(requestBody); err != nil {
			panic(err)
		}
		err = db.QueryRow("SELECT * from user WHERE id = ? AND password = ?", requestBody.Id, requestBody.Password).
			Scan(&requestBody.Id, &requestBody.Password, &requestBody.Name)
		if err != nil {
			return c.NoContent(500)
		}
		tc := TokenClaims{
			Id:   requestBody.Id,
			Name: requestBody.Name,
			StandardClaims: jwt.StandardClaims{
				ExpiresAt: jwt.At(time.Now().Add(time.Hour * 2)),
			},
		}
		tcToken := jwt.NewWithClaims(jwt.SigningMethodHS256, &tc)
		accessToken, err := tcToken.SignedString([]byte("qlalfzl"))
		if err != nil {
			panic(err)
		}
		rf := TokenClaims{
			Id:   requestBody.Id,
			Name: requestBody.Name,
			StandardClaims: jwt.StandardClaims{
				ExpiresAt: jwt.At(time.Now().Add(time.Hour * 120)),
			},
		}
		rfToken := jwt.NewWithClaims(jwt.SigningMethodHS256, &rf)
		refreshToken, err := rfToken.SignedString([]byte("qlalfzl"))
		if err != nil {
			panic(err)
		}
		return c.JSON(200, map[string]interface{}{
			"accessToken":  accessToken,
			"refreshToken": refreshToken,
		})
	})
	e.Logger.Fatal(e.Start(":8080"))
}
