import java.util.Arrays;

public class PrimAlgorithm {
    
    // Function to find the vertex with the minimum key value
    public static int minKey(int[] key, boolean[] includedSet, int V) {
        int min = Integer.MAX_VALUE, minIndex = -1;
        for (int v = 0; v < V; v++) {
            if (!includedSet[v] && key[v] < min) {
                min = key[v];
                minIndex = v;
            }
        }
        return minIndex;
    }
    
    // Prim's Algorithm to find MST
    public static void primMST(int[][] graph, int V) {
        int[] parent = new int[V];  // Array to store the MST
        int[] key = new int[V];     // Key values to pick the minimum weight edge
        boolean[] includedSet = new boolean[V]; // To track vertices included in MST
        
        Arrays.fill(key, Integer.MAX_VALUE);
        key[0] = 0;  // Start with the first vertex
        
        Arrays.fill(parent, -1);
        
        for (int count = 0; count < V - 1; count++) {
            int u = minKey(key, includedSet, V);
            includedSet[u] = true;
            
            // Update key values and parent of adjacent vertices
            for (int v = 0; v < V; v++) {
                if (graph[u][v] != 0 && !includedSet[v] && graph[u][v] < key[v]) {
                    key[v] = graph[u][v];
                    parent[v] = u;
                }
            }
        }
        
        // Print the resulting MST
        System.out.println("Edge \tWeight");
        for (int i = 1; i < V; i++) {
            System.out.println(parent[i] + " - " + i + "\t" + graph[i][parent[i]]);
        }
    }
    
    public static void main(String[] args) {
        int V = 5;
        int[][] graph = {
            {0, 2, 0, 6, 0},
            {2, 0, 3, 8, 5},
            {0, 3, 0, 0, 7},
            {6, 8, 0, 0, 9},
            {0, 5, 7, 9, 0}
        };
        
        primMST(graph, V);
    }
}
