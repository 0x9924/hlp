package main

import (
	"fmt"
	"os"
	"net/http"
	"golang.org/x/net/html"
)


// busca links dada una url, y agregar la parte faltante si es relativo
func main() {
	// url params
	for _, url := range os.Args[1:] {
		//links, err := findLinks(url)
		// if err != nil {
		// 	fmt.Fprintf(os.Stderr, "findlinks: %v\n", err) ; continue
		// }
		printLinks(url)
		// for _, link := range links {
		// 	fmt.Println(link)
		// }
	}
}

func printLinks(url string) {
	resp, err := http.Get(url)
	if err != nil { return nil, err }
	if resp.StatusCode != http.StatusOK {
		resp.Body.Close()
		fmt.Fprintf(os.Stderr, "getting %s: %s", url, resp.Status); os.Exit(1)
		//return nil, fmt.Errorf("getting %s: %s", url, resp.Status)
	}
	doc, err := html.Parse(resp.Body)
	resp.Body.Close()
	if err != nil {
		return nil, fmt.Errorf("parsing %s as HTML: %v", url, err)
	}

	mapa := make(map[string]bool)
	visit(nil, doc, resp, &mapa)
	for l, _ := range mapa {
		fmt.Println(l)
	}
	return nil, nil
}

func visit0(links []string, n *html.Node, resp *http.Response) []string {
	if n.Type == html.ElementNode && n.Data == "a" {
		for _, a := range n.Attr {
			if a.Key == "href" {
				link, err := resp.Request.URL.Parse(a.Val)
				if err== nil {
					links = append(links, link.String())
				}
			}
		}
	}
	for c := n.FirstChild; c != nil; c = c.NextSibling {
		links = visit(links, c, resp)
	}
	return links
}

func visit(links []string, n *html.Node, resp *http.Response, mapa *map[string]bool) {
	if n.Type == html.ElementNode && n.Data == "a" {
		for _, a := range n.Attr {
			if a.Key == "href" {
				link, err := resp.Request.URL.Parse(a.Val)
				if err== nil {
					(*mapa)[link.String()] = true
				}
			}
		}
	}
	for c := n.FirstChild; c != nil; c = c.NextSibling {
		visit2(links, c, resp, mapa)
	}
}
