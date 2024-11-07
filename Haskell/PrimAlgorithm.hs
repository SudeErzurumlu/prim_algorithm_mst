import Data.Array
import Data.List
import Data.Maybe

type Edge = (Int, Int, Int) -- (Node1, Node2, Weight)
type Graph = Array Int [(Int, Int)]

prim :: Graph -> Int -> Int
prim graph n = prim' [0] 0
  where
    prim' visited cost
      | length visited == n = cost
      | otherwise = let edges = [(w, v) | u <- visited, (v, w) <- graph ! u, v `notElem` visited]
                        (minW, minV) = minimum edges
                    in prim' (minV : visited) (cost + minW)

graph :: Graph
graph = listArray (0, 3) [[(1, 4), (2, 3)],
                          [(0, 4), (2, 1), (3, 2)],
                          [(0, 3), (1, 1), (3, 4)],
                          [(1, 2), (2, 4)]]

main :: IO ()
main = putStrLn $ "Minimum Cost: " ++ show (prim graph 4)
