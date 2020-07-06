package main

import "fmt"

func main() {
	s := []int{0, 1, 3, 4, 5, 6, 7, 8, 9, 10}
	n := 2
	fmt.Println(binary(n, s))
}

func binary(n int, s []int) int {
	l := 0
	h := len(s) - 1
	for l < h {
		m := (h + l) / 2
		if s[m] == n {
			return m
		}
		if s[m] > n {
			h = m - 1
		}
		if s[m] < n {
			l = m + 1
		}
	}
	return l
}
