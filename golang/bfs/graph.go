package main

import "errors"

type Node struct {
	Value int
	Data  int
	Left  *Node
	Right *Node
}

func (n *Node) Insert(value, data int) error {
	if n == nil {
		return errors.New("Can't work with nil tree")
	}
	switch {
	case value == n.Value:
		return nil

	case value < n.Value:
		if n.Left == nil {
			n.Left = &Node{Value: value, Data: data}
		}
	}
}
