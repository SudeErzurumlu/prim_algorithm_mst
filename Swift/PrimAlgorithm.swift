import Foundation

struct Edge {
    let node: Int
    let weight: Int
}

func prim(graph: [Int: [Edge]], n: Int) -> Int {
    var visited = Array(repeating: false, count: n)
    var cost = 0
    visited[0] = true

    for _ in 1..<n {
        var minWeight = Int.max
        var nextNode = -1
        for u in 0..<n where visited[u] {
            for edge in graph[u]! where !visited[edge.node] && edge.weight < minWeight {
                minWeight = edge.weight
                nextNode = edge.node
            }
        }
        if nextNode != -1 {
            visited[nextNode] = true
            cost += minWeight
        }
    }
    return cost
}

let graph: [Int: [Edge]] = [
    0: [Edge(node: 1, weight: 4), Edge(node: 2, weight: 3)],
    1: [Edge(node: 0, weight: 4), Edge(node: 2, weight: 1), Edge(node: 3, weight: 2)],
    2: [Edge(node: 0, weight: 3), Edge(node: 1, weight: 1), Edge(node: 3, weight: 4)],
    3: [Edge(node: 1, weight: 2), Edge(node: 2, weight: 4)]
]

print("Minimum Cost: \(prim(graph: graph, n: 4))")
