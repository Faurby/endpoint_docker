package main

import (
	"fmt"
	"time"
)

func main() {
	for {
		fmt.Println("Hello world!")
		time.Sleep(1 * time.Second)
	}
}
