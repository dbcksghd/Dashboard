package main

import (
	"database/sql"
	"encoding/json"
	_ "github.com/go-sql-driver/mysql"
	"github.com/labstack/echo/v4"
	"io/ioutil"
	"os"
)

type Dashboard struct {
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
	e.POST("/newpost", func(c echo.Context) error {
		var jsonData Dashboard
		requestBody, err := ioutil.ReadAll(c.Request().Body)
		if err != nil {panic(err)}

		err = json.Unmarshal(requestBody, &jsonData)
		if err != nil {
			panic(err)
		}
		newPost := Dashboard{Title: jsonData.Title, Content: jsonData.Content}
		_, err = db.Exec("INSERT INTO board (title, content) VALUES (?, ?)", newPost.Title, newPost.Content)
		if err != nil {
			return c.NoContent(500)
		}
		return c.NoContent(201)
	})
	e.Logger.Fatal(e.Start(":8080"))
}
