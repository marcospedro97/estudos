package main

import (
	"fmt"
	"sort"
	"strings"
)

func isAnagram(s string, t string) {
	sList := strings.Split(s, "")
	tList := strings.Split(t, "")
	sort.Strings(sList)
	sort.Strings(tList)
	s = strings.Join(sList, "")
	t = strings.Join(tList, "")
	fmt.Println(s == t)
}
