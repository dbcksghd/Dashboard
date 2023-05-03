package main

import (
	"database/sql"
	_ "github.com/go-sql-driver/mysql"
	"os"
)

type Dashboard struct {
	Id      int    `json:"id"`
	Title   string `json:"title"`
	Content string `json:"content"`
}

func main() {
	password := os.Getenv("PASSWORD")
	_, err := sql.Open("mysql", "root:"+password+"@tcp(localhost:3306)/dashboard")
	if err != nil {
		panic(err)
	}

}
