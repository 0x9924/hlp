package main

import (
	"golang.org/x/net/html"
	"strings"
	"fmt"
	"strconv"
	"io/ioutil"
	"bytes"
	"os"
	"io"
	"flag"
)

var debug = flag.Bool("d", false, "debug")
func main() {
	flag.Parse()
	byteData, err := ioutil.ReadAll(os.Stdin)
	if err != nil {
		fmt.Fprintf(os.Stderr, "error leyendo stdin: %v", err)
		os.Exit(1)
	}
	for _, arg := range flag.Args() {
		n, err := strconv.Atoi(arg)
		if err != nil {
			fmt.Fprintf(os.Stderr, "error parseando %s\n", arg); os.Exit(1)
		}
		tabla, ntablas, err := htmlEnesimaTabla(byteData, n)
		if err != nil {
			if err == io.EOF {
				fmt.Printf("Solo hay %d tablas.\n", ntablas); os.Exit(1)
			} else {
				fmt.Fprintf(os.Stderr, "error con html: %v\n", err)
				os.Exit(1)
			}
		}
		if len(tabla) == 0 {
			fmt.Printf("La tabla %d es vacía.\n", n)
		} else {
			if (*debug) {
				fmt.Println(tabla)
			} else {
				for _, row := range tabla {
					fmt.Printf("%s\n", strings.Join(row, "\t"))
				}
			}
		}
	}
}
			
func htmlEnesimaTabla (byteData []byte, tablaNumero int) ([][]string, int, error) {
	n := tablaNumero
	ntablas := 0
	z := html.NewTokenizer(bytes.NewReader(byteData))
    tabla := [][]string{}

	enUnaTabla := false
	enUnaCelda := false
	fila := []string{}
	var celda string
    // While have not hit the </html> tag
    for /*z.Token().Data != "html"&&*/ n > 0{
        tt := z.Next()
		switch tt {
		case html.ErrorToken:
			return tabla, ntablas, z.Err()
		case html.StartTagToken:
			switch z.Token().Data {
			case "table":
				enUnaTabla = true; ntablas++
			case "tr":
				fila = []string{}
			case "td":
				enUnaCelda = true
			case "th":
				enUnaCelda = true

			case "script":
				enUnaTabla = false; enUnaCelda = false
			}
		case html.EndTagToken:
			switch z.Token().Data {
			case "table":
				enUnaTabla = false; n--
			case "tr":
				if enUnaTabla && n == 1 {
					tabla = append(tabla, fila)
				} 
			case "td":
				enUnaCelda = false
			case "th":
				enUnaCelda = false

			}
		case html.TextToken:
			if enUnaTabla && enUnaCelda && n == 1 {
				//celda = strings.TrimSpace((string)(z.Text()))
				celda = strings.Join(
					strings.Fields(string(z.Text())), " ")
				if (len(celda) > 0) {
					fila = append(fila,	celda)
				}
			}
		}
	}
	return tabla,ntablas,  nil
}			


