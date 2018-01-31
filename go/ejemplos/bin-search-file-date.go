package main
import (
	"fmt"
	"os"
	"time"
)

func main () {
	if len(os.Args) != 3 {
		fmt.Println("./main file date")
		os.Exit(1)
	}

	file, err := os.Open(os.Args[1])
	if err != nil {
		fmt.Printf("archivo incorrecto: %s\n", os.Args[1])
		os.Exit(1)
	}

	date, err := time.Parse("2/1/06", os.Args[2])
	if err != nil { panic(err)	}
	
	fmt.Println(date)
	
	fi, err := file.Stat()
	if err != nil { panic(err) }

	var desde int64 = 0
	hasta := fi.Size()
	med := (hasta + desde)/2
	bufi := make([]byte, 1)
	bufDia := make([]byte, 10)
	
	for desde + 1 < hasta { 
		_, err := file.Seek(med, 0)
		if err != nil { panic (err) }

		i, err := file.Read(bufi); i++
		if err != nil { panic (err) }

		
		for bufi[0] != '\n' {
			//fmt.Printf("char: %c\n", bufi[0])
			i, err := file.Read(bufi)
			if err != nil { panic (err) }
			i++
		}
		lenBufDia, err := file.Read(bufDia);
		if lenBufDia != len(bufDia) {
			fmt.Println("no se pudo leer fecha")
			os.Exit(1)
		}
		
		if  err != nil { panic (err) }

		dateRead, err := time.Parse("02.01.2006", string(bufDia))
		if err != nil { panic(err)	}
		fmt.Println(dateRead)

		diff := date.Sub(dateRead) // diff > 0 <=> date > dateRead
		
		if diff == 0 {
			fmt.Printf("encontre: %q\n", string(bufDia))
			break
		} else if diff < 0 {
			// esta ordenado al reves
			desde = med
		} else {
			hasta = med
		}
		med = (hasta + desde)/2

		//fmt.Printf("desde: %d\thasta: %d\n", desde, hasta)
	}
	

	
}
