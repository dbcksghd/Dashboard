package main

import (
	"database/sql"
	_ "github.com/go-sql-driver/mysql"
	"github.com/labstack/echo/v4"
	"os"
)

type Dashboard struct {
	Id      int    `json:"id"`
	Title   string `json:"title"`
	Content string `json:"content"`
}

func main() {
	password := os.Getenv("PASSWORD")
	db, err := sql.Open("mysql", "root:"+password+"@tcp(localhost:3306)/dashboard")
	if err != nil {
		panic(err)
	}

	e := echo.New()
	e.POST("/post", func(c echo.Context) error {
		requestBody := new(Dashboard)

		if err = c.Bind(requestBody); err != nil {
			panic(err)
		}
		_, err := db.Exec("INSERT INTO board (title, content) VALUES (?, ?)", requestBody.Title, requestBody.Content)
		if err != nil {
			return c.JSON(500, map[string]string{"error": err.Error()})
		}
		return c.NoContent(201)
	})

	e.GET("/post", func(c echo.Context) error {
		rows, err := db.Query("select * from board")
		if err != nil {
			return c.JSON(500, map[string]string{"error": err.Error()})
		}
		var posts []Dashboard
		for rows.Next() {
			var post Dashboard
			if err := rows.Scan(&post.Id, &post.Title, &post.Content); err != nil {
				return c.JSON(500, map[string]string{"error": err.Error()})
			}
			posts = append(posts, post)
		}
		if err := rows.Err(); err != nil {
			return c.JSON(500, map[string]string{"error": err.Error()})
		}

		return c.JSON(200, posts)
	})

	e.DELETE("/post", func(c echo.Context) error {
		id := c.QueryParam("id")
		_, err := db.Exec("delete from board where id = ?", id)
		if err != nil {
			return c.JSON(500, map[string]string{"error": err.Error()})
		}
		return c.NoContent(201)
	})
	e.Logger.Fatal(e.Start(":8080"))
}
