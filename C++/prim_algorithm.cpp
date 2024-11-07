#include <iostream>
#include <vector>
#include <climits>

using namespace std;

// Utility function to find the vertex with the minimum key value
int minKey(vector<int>& key, vector<bool>& includedSet, int V) {
    int min = INT_MAX, minIndex;
    for (int v = 0; v < V; v++) {
        if (!includedSet[v] && key[v] < min) {
            min = key[v];
            minIndex = v;
        }
    }
    return minIndex;
}

// Prim's Algorithm to find MST
void primMST(vector<vector<int>>& graph, int V) {
    vector<int> parent(V, -1); // Array to store the MST
    vector<int> key(V, INT_MAX); // Key values to pick the minimum weight edge
    vector<bool> includedSet(V, false); // To track vertices included in MST
    
    key[0] = 0;  // Start with the first vertex
    
    for (int count = 0; count < V - 1; count++) {
        int u = minKey(key, includedSet, V);
        includedSet[u] = true;
        
        // Update key values and parent of adjacent vertices
        for (int v = 0; v < V; v++) {
            if (graph[u][v] && !includedSet[v] && graph[u][v] < key[v]) {
                key[v] = graph[u][v];
                parent[v] = u;
            }
        }
    }
    
    // Print the resulting MST
    cout << "Edge \tWeight\n";
    for (int i = 1; i < V; i++) {
        cout << parent[i] << " - " << i << "\t" << graph[i][parent[i]] << endl;
    }
}

int main() {
    int V = 5;
    vector<vector<int>> graph = {
        {0, 2, 0, 6, 0},
        {2, 0, 3, 8, 5},
        {0, 3, 0, 0, 7},
        {6, 8, 0, 0, 9},
        {0, 5, 7, 9, 0}
    };
    
    primMST(graph, V);
    return 0;
}
