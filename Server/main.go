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
			return c.NoContent(500)
		}
		return c.NoContent(201)
	})
	e.Logger.Fatal(e.Start(":8080"))
}
