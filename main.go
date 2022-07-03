package main

import (
	"fmt"
	"net/http"
	"time"
)

func main() {
	go func() {
		t := time.NewTicker(10 * time.Second)
		for {
			<-t.C
			fmt.Println("hello ", time.Now())
		}
	}()

	http.ListenAndServe(":8080", nil)
}
