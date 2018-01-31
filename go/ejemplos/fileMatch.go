package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"strings"
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
	fmt.Println()
	for _, arg :=  range os.Args[1:] {
		
		fmt.Printf("está %33q? %v\n", arg, binSearch(arg, files))
	}

}

func binSearch(f string, fs []os.FileInfo) bool {
	desde := 0
	hasta := len(fs)
	
	var med int
	for desde + 1 < hasta {
		med = (desde + hasta) /2
		comp := strings.Compare(f, fs[med].Name())
		if comp == 0 {
			return true
		} else if comp > 0 {
			desde = med
		} else {
			hasta = med
		}
	}
	return false

}
