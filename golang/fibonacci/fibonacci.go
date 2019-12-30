package main

var s = []int{1, 1}

func principal(n int) []int {
	_ = fibonacci(n)
	return s
}

func fibonacci(n int) int {
	if n <= 2 {
		return 0
	}
	r := s[len(s)-1] + s[len(s)-2]
	s = append(s, r)
	if len(s) < n {
		fibonacci(n)
	}
	return r
}
