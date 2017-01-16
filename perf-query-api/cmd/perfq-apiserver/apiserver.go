// perfqapi is the api server for querying the performance results
package main

import (
	"fmt"
	"net/http"
)

func main() {
	fmt.Printf("Starting perfqapi server...")
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8000", nil)
}

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "It works!")
}
