package main

import (
    "fmt"
    "log"
    "net/http"
)

func main() {
    http.HandleFunc("/api/hello", helloHandler)
    fmt.Println("Server starting on port 8080...")
    log.Fatal(http.ListenAndServe(":8080", nil))
}

func helloHandler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello from the Go backend!")
}
