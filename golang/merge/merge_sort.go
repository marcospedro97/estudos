package main

func merge(a []int, b []int) (r []int) {
	r = make([]int, len(a)+len(b))
	i, j := 0, 0
	for i < len(a) && j < len(b) {
		if a[i] <= b[j] {
			r[i+j] = a[i]
			i++
		} else {
			r[i+j] = b[j]
			j++
		}
	}
	for i < len(a) {
		r[i+j] = a[i]
		i++
	}
	for j < len(b) {
		r[i+j] = b[j]
		j++
	}
	return
}

func mergeSort(i []int) []int {
	if len(i) < 2 {
		return i
	}
	m := len(i) / 2
	a := mergeSort(i[:m])
	b := mergeSort(i[m:])
	return merge(a, b)
}
