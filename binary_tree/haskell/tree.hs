data Tree a = EmptyTree | Node a (Tree a) (Tree a)

main = do
    let tree = EmptyTree << 10 << 1 << 20 << 2 << 2 << 5 << 3 << 12 << 7 << 6 << 9 << 11 << 8
    let array = toArray tree
    apply_ print tree
    putStrLn $ show array

(<<) :: (Ord a) => Tree a -> a -> Tree a
(<<) EmptyTree value = Node value EmptyTree EmptyTree
(<<) (Node value left right) newValue = if newValue < value 
    then Node value (left << newValue) right
    else Node value left (right << newValue)

apply_ :: (Monad m) => (a->m b) -> Tree a -> m ()
apply_ f EmptyTree = return ()
apply_ f (Node value left right) = do
    apply_ f left
    f value
    apply_ f right

printTree :: (Show a) => Tree a -> IO ()
printTree EmptyTree = return ()
printTree (Node value left right) = do
    printTree left
    putStrLn $ show value
    printTree right

toArray :: Tree a -> [a]
toArray EmptyTree = []
toArray (Node value left right) = toArray left ++ value : toArray right
