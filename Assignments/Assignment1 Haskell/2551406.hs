{-data UniversityTree = EmptyTree | Node ([Char], Int) [UniversityTree] deriving (Show, Eq, Ord)

unitree :: [([Char], Int)] -> [Int] -> [UniversityTree]
unitree [] [] = []
unitree ((name, emp):ns) (childrenCount:cs) =
  let children = createChildren childrenCount
  in Node (name, emp) children : unitree ns cs

createChildren :: Int -> [UniversityTree]
createChildren 0 = []
createChildren n = EmptyTree : createChildren (n - 1)-}


{-data UniversityTree = EmptyTree | Node ([Char], Int) [UniversityTree] deriving (Show, Eq, Ord)

-- Define unitree function
unitree :: [([Char], Int)] -> [Int] -> [UniversityTree]
unitree [] [] = []
unitree ((name, emp):ns) (childrenCount:cs) =
  let children = [EmptyTree | _ <- take childrenCount (repeat ())]
  in Node (name, emp) children : unitree ns cs-}


{-data UniversityTree = EmptyTree | Node ([Char], Int) [UniversityTree] deriving (Show, Eq, Ord)

unitree :: [([Char], Int)] -> [Int] -> [UniversityTree]
unitree [] [] = []
unitree ((name, emp):ns) (childrenCount:cs) =
  let children = createChildren childrenCount
  in Node (name, emp) children : unitree ns cs

createChildren :: Int -> [UniversityTree]
createChildren n = replicate n EmptyTree-}

{-data UniversityTree = EmptyTree | Node ([Char], Int) [UniversityTree] deriving (Show, Eq, Ord)
unitree :: [(String, Int)] -> [Int] -> [UniversityTree]
unitree [] [] = []
unitree ((name, emp):ns) (childrenCount:cs) =
  let children = createChildren ((name, emp):ns) childrenCount
  in Node (name, emp) children : unitree ns cs
  
createChildren :: [(String, Int)] -> Int -> [UniversityTree]
createChildren ((name, emp):ns) n = [Node (name, emp) [] | _ <- [1..n]]-}


{-data UniversityTree = EmptyTree | Node ([Char], Int) [UniversityTree] deriving (Show, Eq, Ord)

unitree :: [(String, Int)] -> [Int] -> [UniversityTree]
unitree [] [] = []
unitree ((name, emp):ns) (childrenCount:cs) =
  let children = createChildren ((name, emp):ns) childrenCount
  in Node (name, emp) children : unitree ns cs

createChildren :: [(String, Int)] -> Int -> [UniversityTree]
createChildren [] _ = []
createChildren ((name, emp):ns) n =
  let childNames = take n (map fst ns)
      childNodes = map (\name -> Node (name, 0) []) childNames
  in childNodes ++ createChildren ns (n - length childNames)-}
  
----the best so far
{-data UniversityTree = EmptyTree | Node (String, Int) [UniversityTree] deriving (Show, Eq, Ord)

unitree :: [(String, Int)] -> [Int] -> UniversityTree
unitree [] [] = EmptyTree
unitree ((name, emp):ns) (childrenCount:cs) =
  let children = createChildren ns cs childrenCount
  in Node (name, emp) children

createChildren :: [(String, Int)] -> [Int] -> Int -> [UniversityTree]
createChildren _ _ 0 = []
createChildren ns cs count =
  let (currentLevel, next) = splitAt count ns
      currentChildren = map (\(name, emp) -> Node (name, emp) []) currentLevel
  in currentChildren ++ createNestedChildren next cs

createNestedChildren :: [(String, Int)] -> [Int] -> [UniversityTree]
createNestedChildren [] _ = []
createNestedChildren ns (count:cs) =
  let (currentLevel, next) = splitAt count ns
      currentChildren = map (\(name, emp) -> Node (name, emp) []) currentLevel
  in currentChildren ++ createNestedChildren next cs-}
  
{-data UniversityTree = EmptyTree | Node (String, Int) [UniversityTree] deriving (Show, Eq, Ord)

unitree :: [(String, Int)] -> [Int] -> UniversityTree
unitree [] _ = EmptyTree
unitree ns counts = Node (head ns) (createChildren (tail ns) counts)

createChildren :: [(String, Int)] -> [Int] -> [UniversityTree]
createChildren [] _ = []
createChildren ns [] = []
createChildren ns (c:cs) =
    let (currentLevel, nextLevels) = splitAt c ns
        currentChildren = map (\(name, emp) -> Node (name, emp) []) currentLevel
    in currentChildren ++ createChildren nextLevels cs-}


data UniversityTree = EmptyTree | Node (String, Int) [UniversityTree] deriving (Show, Eq, Ord)

unitree :: [(String, Int)] -> [Int] -> UniversityTree
unitree [] _ = EmptyTree
unitree ((name, emp):ns) counts = Node (name, emp) (createChildren ns counts)

createChildren :: [(String, Int)] -> [Int] -> [UniversityTree]
createChildren [] _ = []
createChildren _ [] = []
createChildren ns (c:cs) =
  let
    (current, remaining) = (take c ns, drop c ns)
    children = map (\(name, emp) -> Node (name, emp) []) current
    nextChildren = createChildren remaining cs
  in
    children ++ nextChildren
	

-- sectionsize :: UniversityTree -> String -> Int
-- sectionsize tree sectionName = countEmployees (findSection tree sectionName)

-- findSection :: UniversityTree -> String -> UniversityTree
-- findSection EmptyTree _ = EmptyTree
-- findSection (Node (name, _) children) sectionName
    -- | name == sectionName = Node (name, 0) children
    -- | otherwise = case filter (/= EmptyTree) (map (\child -> findSection child sectionName) children) of
                    -- [] -> EmptyTree
                    -- (x:_) -> x

-- countEmployees :: UniversityTree -> Int
-- countEmployees EmptyTree = 0
-- countEmployees (Node (_, emp) children) = emp + sum (map countEmployees children)





--x = unitree [("Rectorate", 2), ("General Secretary", 6), ("Social Sciences", 2)][2, 0, 0]

x = unitree [("Rectorate", 2), ("General Secretary", 6), ("Social Sciences", 2), ("Economics", 4), ("Political Science", 5), ("Education", 2), ("Pre School", 3), ("Foreign Languages", 4), ("Engineering", 4), ("Computer Engineering", 10), ("Mechanical Engineering", 5), ("Electrical Enginering", 6)][3, 0, 3, 0, 0, 2, 0, 0, 3, 0, 0, 0]
