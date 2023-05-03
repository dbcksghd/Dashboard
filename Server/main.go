package main

import (
	"database/sql"
	_ "github.com/go-sql-driver/mysql"
	"log"
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

	newPost := Dashboard{Title: "what", Content: "뭐라고??"}
	_, err = db.Exec("INSERT INTO board (title, content) VALUES (?, ?)", newPost.Title, newPost.Content)
	if err != nil {
		log.Fatalln(err)
	}
}
