package main
import (
 	"fmt"
	"bufio"
	"os"
	// "golang.org/x/net/html"
)

func main() {
	reader := bufio.NewReader(os.Stdin)
	fmt.Println(reader.ReadString('\n'))
//	fmt.Printf(os.Stdin)
	// _, err := html.Parse(os.Stdin)
	// if err != nil {
	// 	fmt.Fprintf(os.Stderr, "findlinks: %v\n", err)
	// 	os.Exit(1)
	// }
	//
}
