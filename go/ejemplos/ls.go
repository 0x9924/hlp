package main

import (
	"fmt"
	"io/ioutil"
	"log"
)

func main() {
	files, err := ioutil.ReadDir(".")
	if err != nil {
		log.Fatal(err)
	}

	for i, file := range files {
		fmt.Printf("%33v\t ", file.Name())
		if i % 2 == 0 { fmt.Println() }
	}

	l := len(files)
	fmt.Println("Hay ", l, "archovos")
}
