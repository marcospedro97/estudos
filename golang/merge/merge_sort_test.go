package main

import (
	"sort"
	"testing"
)

func TestMergeSort(t *testing.T) {
	var s = []int{2, 4, 3, 1, 5, 7, 6}
	s = mergeSort(s)
	if sort.IntsAreSorted(s) {
		t.Logf("Success")
	} else {
		t.Errorf("Failed")
	}
}
