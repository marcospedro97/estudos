package main

import (
	"sort"
	"testing"
)

func TestQuicksort(t *testing.T) {
	a := []int{0, 2, 1, 3, 5, 4, 6, 9, 7, 8}
	h := (len(a) - 1)
	r := quicksort(a, 0, h)
	if sort.IntsAreSorted(r) {
		t.Log("Success")
	} else {
		t.Errorf("Not Sorted")
	}
}
