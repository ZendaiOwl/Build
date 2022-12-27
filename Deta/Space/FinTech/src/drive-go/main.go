package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", indexPage)
		http.ListenAndServe(":8000", nil)
}

func indexPage(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w,"Hello there!")
}
