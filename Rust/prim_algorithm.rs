use std::collections::BinaryHeap;
use std::cmp::Ordering;

#[derive(Copy, Clone, Eq, PartialEq)]
struct Edge {
    node: usize,
    weight: i32,
}

impl Ord for Edge {
    fn cmp(&self, other: &Self) -> Ordering {
        other.weight.cmp(&self.weight)
    }
}

impl PartialOrd for Edge {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}

fn prim(graph: &Vec<Vec<Edge>>, n: usize) -> i32 {
    let mut visited = vec![false; n];
    let mut heap = BinaryHeap::new();
    let mut cost = 0;

    heap.push(Edge { node: 0, weight: 0 });
    while let Some(Edge { node, weight }) = heap.pop() {
        if visited[node] {
            continue;
        }
        visited[node] = true;
        cost += weight;
        for &edge in &graph[node] {
            if !visited[edge.node] {
                heap.push(edge);
            }
        }
    }
    cost
}

fn main() {
    let graph = vec![
        vec![Edge { node: 1, weight: 4 }, Edge { node: 2, weight: 3 }],
        vec![Edge { node: 0, weight: 4 }, Edge { node: 2, weight: 1 }, Edge { node: 3, weight: 2 }],
        vec![Edge { node: 0, weight: 3 }, Edge { node: 1, weight: 1 }, Edge { node: 3, weight: 4 }],
        vec![Edge { node: 1, weight: 2 }, Edge { node: 2, weight: 4 }],
    ];
    println!("Minimum Cost: {}", prim(&graph, 4));
}
