package main

import (
	"testing"
)

func TestPrincipal(t *testing.T) {
	f := principal(10)
	if f[0] != 1 || f[len(f)-1] != 55 {
		t.Errorf("FAILED")
	}
	if f[0] == 1 && f[len(f)-1] == 55 {
		t.Logf("Success")
	}
	f = principal(2)
	if f[0] != 1 || f[len(f)-1] != 55 {
		t.Errorf("FAILED")
	}
	if f[0] == 1 && f[len(f)-1] == 55 {
		t.Logf("Success")
	}
}
