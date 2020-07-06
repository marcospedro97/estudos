package main

import (
	"math"
)

func primes(f int) []int {
	var x, y, n int
	sqrt := math.Sqrt(float64(f))
	s := make([]bool, f)
	for x = 1; float64(x) <= sqrt; x++ {
		for y = 1; float64(y) <= sqrt; y++ {
			n = 4*(x*x) + y*y
			if n <= f && (n%12 == 1 || n%12 == 5) {
				s[n] = !s[n]
			}
			n = 3*(x*x) + y*y
			if n <= f && n%12 == 7 {
				s[n] = !s[n]
			}
			n = 3*(x*x) - y*y
			if x > y && n <= f && n%12 == 11 {
				s[n] = !s[n]
			}
		}
	}
	for n = 5; float64(n) <= sqrt; n++ {
		if s[n] {
			s[y] = false
		}
	}
	s[2] = true
	s[3] = true
	primes := make([]int, 0, 1270606)
	for x = 0; x < len(s)-1; x++ {
		if s[x] {
			primes = append(primes, x)
		}
	}
	return primes
}
