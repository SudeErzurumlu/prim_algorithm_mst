package main

import (
	"fmt"
	"math"
)

type Edge struct {
	node   int
	weight int
}

func prim(graph map[int][]Edge, n int) int {
	visited := make([]bool, n)
	cost := 0
	visited[0] = true

	for i := 1; i < n; i++ {
		minWeight := math.MaxInt32
		node := -1
		for u := 0; u < n; u++ {
			if visited[u] {
				for _, edge := range graph[u] {
					if !visited[edge.node] && edge.weight < minWeight {
						minWeight = edge.weight
						node = edge.node
					}
				}
			}
		}
		if node != -1 {
			visited[node] = true
			cost += minWeight
		}
	}
	return cost
}

func main() {
	graph := map[int][]Edge{
		0: {{1, 4}, {2, 3}},
		1: {{0, 4}, {2, 1}, {3, 2}},
		2: {{0, 3}, {1, 1}, {3, 4}},
		3: {{1, 2}, {2, 4}},
	}
	fmt.Println("Minimum Cost: ", prim(graph, 4))
}
