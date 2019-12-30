package main

func quicksort(a []int, l int, h int) []int {
	if l < h {
		p := partition(a, l, h)
		quicksort(a, l, p-1)
		quicksort(a, p+1, h)
	}
	return a
}

func partition(a []int, l int, h int) int {
	p := a[h]
	i := (l - 1)
	for j := l; j <= h; j++ {
		if a[j] < p {
			i++
			a[i], a[j] = a[j], a[i]
		}
	}
	a[i+1], a[h] = a[h], a[i+1]
	return i + 1
}
