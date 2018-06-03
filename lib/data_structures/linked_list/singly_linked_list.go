package main

import (
	"fmt"
	"log"
)

// Node is a unit of LinkedList
type Node struct {
	next *Node
	prev *Node
	val  string
}

// LinkedList of Nodes
type LinkedList struct {
	head *Node
	tail *Node
}

func (list *LinkedList) addNode(val string) (*LinkedList, error) {
	newNode := new(Node)
	newNode.val = val

	if list.tail == nil {
		list.head = newNode
		list.tail = newNode
		return list, nil
	}

	prevHead := list.head
	prevHead.next = newNode
	list.head = newNode
	list.head.prev = prevHead
	return list, nil
}

func main() {
	list := new(LinkedList)

	_, err := list.addNode("first")
	if err != nil {
		log.Fatal("Could not create new node", err)
	}

	_, err = list.addNode("second")
	if err != nil {
		log.Fatal("Could not create new node", err)
	}

	_, err = list.addNode("third")
	if err != nil {
		log.Fatal("Could not create new node", err)
	}

	_, err = list.addNode("forth")
	if err != nil {
		log.Fatal("Could not create new node", err)
	}

	fmt.Println("Tail: " + list.tail.val)
	fmt.Println(list.tail.next.val)
	fmt.Println(list.tail.next.next.val)
	fmt.Println("Head: " + list.head.val)
}
