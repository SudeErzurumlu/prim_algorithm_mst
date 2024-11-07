import sys

# Function to find the vertex with the minimum key value
def min_key(key, included_set, V):
    min_val = sys.maxsize
    min_index = -1
    for v in range(V):
        if not included_set[v] and key[v] < min_val:
            min_val = key[v]
            min_index = v
    return min_index

# Prim's Algorithm to find MST
def prim_mst(graph, V):
    parent = [-1] * V  # Array to store the MST
    key = [sys.maxsize] * V  # Key values to pick the minimum weight edge
    included_set = [False] * V  # To track vertices included in MST
    
    key[0] = 0  # Start with the first vertex
    
    for _ in range(V - 1):
        u = min_key(key, included_set, V)
        included_set[u] = True
        
        # Update key values and parent of adjacent vertices
        for v in range(V):
            if graph[u][v] and not included_set[v] and graph[u][v] < key[v]:
                key[v] = graph[u][v]
                parent[v] = u
    
    # Print the resulting MST
    print("Edge \tWeight")
    for i in range(1, V):
        print(f"{parent[i]} - {i} \t{graph[i][parent[i]]}")

# Example Usage
graph = [
    [0, 2, 0, 6, 0],
    [2, 0, 3, 8, 5],
    [0, 3, 0, 0, 7],
    [6, 8, 0, 0, 9],
    [0, 5, 7, 9, 0]
]

V = 5
prim_mst(graph, V)
