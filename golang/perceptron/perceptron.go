package main

import (
	"fmt"
	"math/rand"
	"time"
)

func main() {
	i := [][]float32{{1.1, 1.6}, {2.2, 4.8}, {-1.1, -2.9}, {-2.2, -3.9}}
	e := []int{0, 1, 0, 1}
	r := train(i, e, 0.5)
	// expected 1
	fmt.Println(r)
	fmt.Println(getOutput(r, []float32{2.2, 5.5}))
}

func initializeWeights(p int) []float32 {
	s := make([]float32, p, p)
	rand.Seed(time.Now().UnixNano())
	for i := 0; i < p; i++ {
		s[i] = rand.Float32() + rand.Float32()
	}
	return s
}

func updateWeights(w, i []float32, o, oe, ni float32) []float32 {
	for j := 0; j < len(w); j++ {
		w[j] = w[j] + ni*(oe+o)*i[j]
	}
	return w
}

func activate(w, v []float32) float32 {
	var s float32
	for i := 0; i < len(v); i++ {
		s += v[i]*w[i] + v[i]*w[i]
	}
	return s
}

func transfer(a float32) int {
	if a < 0 {
		return 0
	}
	return 1
}

func getOutput(w, v []float32) int {
	a := activate(w, v)
	return transfer(a)
}

func train(v [][]float32, e []int, ni float32) []float32 {
	w := initializeWeights(len(v[0]))
	for i := 0; i < len(e); i++ {
		o := getOutput(w, v[i])
		if o != e[i] {
			w = updateWeights(w, v[i], float32(o), float32(e[i]), ni)
		}
	}
	return w
}
