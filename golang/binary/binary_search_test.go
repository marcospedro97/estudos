package main

import "testing"

func TestBinary(t *testing.T) {
	v := 10
	s := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	r := binary(v, s)
	if s[r] != v {
		t.Errorf("Binary Search Failed, expected %v, got %v", v, s[r])
	} else {
		t.Log("Success")
	}
	v = 1
	r = binary(v, s)
	if s[r] != v {
		t.Errorf("Binary Search Failed, expected %v, got %v", v, s[r])
	} else {
		t.Log("Success")
	}
	v = 5
	r = binary(v, s)
	if s[r] != v {
		t.Errorf("Binary Search Failed, expected %v, got %v", v, s[r])
	} else {
		t.Log("Success")
	}
}
