package main

import (
	"fmt"
	"testing"
)

func TestPrimes(t *testing.T) {
	p := primes(200)
	fmt.Println(p)
	if p[0] != 2 || p[len(p)-1] != 197 {
		t.Errorf("Failed")
	} else {
		t.Logf("Success")
	}
}
