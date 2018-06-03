package main

import (
	"errors"
	"fmt"
	"log"
	"strconv"
)

// Node is a unit of LinkedList
type Node struct {
	next *Node
	prev *Node
	val  string
}

// LinkedList of Nodes
type LinkedList struct {
	head   *Node
	tail   *Node
	length int
}

func (list *LinkedList) removeNode(val string) (*LinkedList, error) {
	cursor := list.tail

	if list.length == 0 {
		return list, nil
	}

	for cursor.val != "" {
		if cursor.val == val {
			// remove the node
			if cursor.val == list.tail.val {
				// Remove tail
			}

			if cursor.val == list.head.val {
				// Remove head
			}

			cursor.prev.next = cursor.next
			cursor.next.prev = cursor.prev
			list.length--
			return list, nil
		}

		cursor = cursor.next
	}

	return list, errors.New("Could not find node with that value")
}

func (list *LinkedList) addNode(val string) (*LinkedList, error) {
	newNode := new(Node)
	newNode.val = val

	if val == "" {
		return nil, errors.New("Cannot have an empty value")
	}

	if list.tail == nil {
		list.head = newNode
		list.tail = newNode
		list.length++
		return list, nil
	}

	prevHead := list.head
	prevHead.next = newNode
	list.head = newNode
	list.head.prev = prevHead
	list.length++
	return list, nil
}

func (list *LinkedList) print() {
	cursor := list.tail
	for cursor != nil {
		fmt.Print(cursor.val + " -> ")
		cursor = cursor.next
	}
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

	_, err = list.addNode("tenth")
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

	list.removeNode("tenth")

	fmt.Println("---------------------------------------")
	list.print()
	fmt.Println(" *")
	fmt.Println("---------------------------------------")
	fmt.Println("Tail: " + list.tail.val)
	fmt.Println("Head: " + list.head.val)
	fmt.Println("Length: " + strconv.Itoa(list.length))
	fmt.Println("---------------------------------------")
}
