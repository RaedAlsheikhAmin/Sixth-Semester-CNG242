-- Raed Alsheikh Amin – 2528271
-- I read and accept the submission rules and the extra rules specified in each question. This is my own work that is done by myself only.

--data FamilyTree a = Leaf a | Node (FamilyTree a) (FamilyTree a) (FamilyTree a)
--data FamilyTree = child String (Int, Int) | Node (FamilyTree) (FamilyTree) (FamilyTree)
data FamilyTree = EmptyTree | Node [Char] Integer (Integer,Integer) FamilyTree FamilyTree FamilyTree deriving(Show, Ord, Eq)

--this code should be modified for the children.
{-createFamilyTree :: [String] -> [Integer] -> [(Integer, Integer)] -> FamilyTree
createFamilyTree [] [] [] = EmptyTree
createFamilyTree (name:names) (numChildren:children) ((birth,death):dates) = Node name numChildren (birth, death) leftTree middleTree rightTree
  where
    leftTree = createFamilyTree names children dates
    middleTree = createFamilyTree names children dates
    rightTree = createFamilyTree names children dates
createFamilyTree _ _ _ = error "Invalid input lists"-}--this works for me but as infinte tree


{-createFamilyTree :: [String] -> [Integer] -> [(Integer, Integer)] -> FamilyTree
createFamilyTree [] [] [] = EmptyTree
createFamilyTree (name:names) (numChildren:children) ((birth,death):dates) = Node name numChildren (birth, death) childTrees
    where
        childTrees = replicate (fromIntegral numChildren) ( createFamilyTree names children dates)-- you can use $ instead of the second bracket
createFamilyTree _ _ _ = error "Invalid input lists"-}


{-createFamilyTree :: [String] -> [Integer] -> [(Integer, Integer)] -> FamilyTree
createFamilyTree [] [] [] = EmptyTree
createFamilyTree (name:names) (numChildren:children) ((birth,death):dates) = Node name numChildren (birth, death) childTrees
  where
    childTrees = take (fromIntegral numChildren) $ repeat $ createFamilyTree names children dates
createFamilyTree _ _ _ = error "Invalid input lists"-}



{-createFamilyTree :: [String] -> [Integer] -> [(Integer, Integer)] -> FamilyTree
createFamilyTree [] [] [] = EmptyTree
createFamilyTree (name:names) (numChildren:children) ((birth,death):dates) = Node name numChildren (birth, death) childrenTrees
  where
    childrenTrees = replicate (fromIntegral numChildren) childTree
    childTree = createFamilyTree names children dates
createFamilyTree _ _ _ = error "Invalid input lists"-}


{-createFamilyTree :: [String] -> [Integer] -> [(Integer, Integer)] -> FamilyTree
createFamilyTree [] [] [] = EmptyTree
createFamilyTree (name:names) (numChildren:children) ((birth,death):dates)
    | numChildren > 3 = error "A node can have at most 3 children"
    | otherwise      = Node name numChildren (birth, death) leftTree middleTree rightTree
  where
    leftChildren  = take (fromIntegral numChildren) names
    middleChildren = drop (fromIntegral numChildren) $ take (2*fromIntegral numChildren) names
    rightChildren = drop (2*fromIntegral numChildren) $ take (3*fromIntegral numChildren) names

    leftTree  = createFamilyTree leftChildren  (take (fromIntegral numChildren) children) (take (fromIntegral numChildren) dates)
    middleTree = createFamilyTree middleChildren (drop (fromIntegral numChildren) $ take (2*fromIntegral numChildren) children) (drop (fromIntegral numChildren) $ take (2*fromIntegral numChildren) dates)
    rightTree = createFamilyTree rightChildren (drop (2*fromIntegral numChildren) children) (drop (2*fromIntegral numChildren) dates)
createFamilyTree _ _ _ = error "Invalid input lists"-}

createFamilyTree :: [String] -> [Integer] -> [(Integer, Integer)] -> FamilyTree
createFamilyTree [] [] [] = EmptyTree
createFamilyTree (name : names) (numChildren : children) ((birth, death) : dates)
  | numChildren > 3 = error "A node can have at most three children"
  | otherwise = Node name numChildren (birth, death) leftTree middleTree rightTree
  where
    leftTree = createFamilyTree (take (fromIntegral numChildren) names) (take (fromIntegral numChildren) children) (take (fromIntegral numChildren) dates)
    middleTree = createFamilyTree (drop (fromIntegral numChildren) $ take (2 * fromIntegral numChildren) names) (drop (fromIntegral numChildren) $ take (2 * fromIntegral numChildren) children) (drop (fromIntegral numChildren) $ take (2 * fromIntegral numChildren) dates)
    rightTree = createFamilyTree (drop (2 * fromIntegral numChildren) names) (drop (2 * fromIntegral numChildren) children) (drop (2 * fromIntegral numChildren) dates)
createFamilyTree _ _ _ = error "Invalid input lists"

mytree= createFamilyTree names children years

{-createFamilyTree :: [String] -> [Integer] -> [(Integer, Integer)] -> FamilyTree
createFamilyTree [] [] [] = EmptyTree
createFamilyTree (name:names) (numChildren:children) ((birth,death):dates)
  | numChildren > 3 = error "Each parent can have at most 3 children"
  | numChildren == 0 = Node name numChildren (birth, death) EmptyTree EmptyTree EmptyTree
  | numChildren == 1 = Node name numChildren (birth, death) (createFamilyTree names children dates) EmptyTree EmptyTree
  | numChildren == 2 = Node name numChildren (birth, death) (createFamilyTree (take 1 names) (take 1 children) (take 1 dates))
                                                         (createFamilyTree (drop 1 names) (drop 1 children) (drop 1 dates))
                                                         EmptyTree
  | numChildren == 3 = Node name numChildren (birth, death) (createFamilyTree (take 1 names) (take 1 children) (take 1 dates))
                                                         (createFamilyTree (take 1 $ drop 1 names) (take 1 $ drop 1 children) (take 1 $ drop 1 dates))
                                                         (createFamilyTree (drop 2 names) (drop 2 children) (drop 2 dates))
  | otherwise = error "Invalid number of children"
createFamilyTree _ _ _ = error "Invalid input lists"-}


{-createFamilyTree :: [String] -> [Integer] -> [(Integer, Integer)] -> FamilyTree
createFamilyTree [] [] [] = EmptyTree
createFamilyTree (name:names) (numChildren:children) ((birth,death):dates)
    | numChildren == 0 = Node name numChildren (birth,death) EmptyTree EmptyTree EmptyTree
    | numChildren == 1 = Node name numChildren (birth,death) (createFamilyTree names children dates) EmptyTree EmptyTree
    | numChildren == 2 = Node name numChildren (birth,death) (createFamilyTree names (take 2 children) (take 2 dates)) (createFamilyTree (drop 2 names) (drop 2 children) (drop 2 dates)) EmptyTree
    | numChildren == 3 = Node name numChildren (birth,death) (createFamilyTree names (take 2 children) (take 2 dates)) (createFamilyTree (take 1 (drop 2 names)) (take 1 (drop 2 children)) (take 1 (drop 2 dates))) (createFamilyTree (drop 3 names) (drop 3 children) (drop 3 dates))
createFamilyTree _ _ _ = error "Invalid input lists"-}

names =  ["Nikolaus1", "Jacob I", "Nikolaus2", "Nikolaus I", "Johann I", "Nikolaus II", "Daniel", "Johann II", "Johann III", "Jacob II"]

children = [3, 0, 1, 0, 3, 0, 0, 2, 0, 0]

years = [(1623, 1708), (1654, 1705), (1662, 1716), (1687, 1759), (1667, 1748), (1695, 1726), (1700, 1782), (1710, 1790), (1746, 1807), (1759, 1789)]

{-createFamilyTree :: [String] -> [Integer] -> [(Integer, Integer)] -> FamilyTree
createFamilyTree [] [] [] = EmptyTree
createFamilyTree (name:names) (numChildren:children) ((birth,death):dates)
  | numChildren == 0 = Node name numChildren (birth, death) EmptyTree EmptyTree EmptyTree
  | numChildren == 1 = Node name numChildren (birth, death) (createFamilyTree names children dates) EmptyTree EmptyTree
  | numChildren == 2 = Node name numChildren (birth, death) (createFamilyTree names children dates) (createFamilyTree (tail names) (tail children) dates) EmptyTree
  | numChildren == 3 = Node name numChildren (birth, death) (createFamilyTree names children dates) (createFamilyTree (tail names) (tail children) dates) (createFamilyTree (tail $ tail names) (tail $ tail children) dates)
createFamilyTree _ _ _ = error "Invalid input lists"-}

{-searchFamilyTree :: FamilyTree -> String -> Bool
searchFamilyTree EmptyTree _ = False
searchFamilyTree (Node name _ _ leftTree middleTree rightTree) targetName
  | name == targetName = True
  | otherwise = searchFamilyTree leftTree targetName || searchFamilyTree middleTree targetName || searchFamilyTree rightTree targetName-}
  
searchName :: String -> FamilyTree -> Bool
searchName _ EmptyTree = False
searchName name (Node n _ _ leftTree middleTree rightTree) =
  if n == name
    then True
    else searchName name leftTree || searchName name middleTree || searchName name rightTree
	
	

findParent :: String -> FamilyTree -> String
findParent name EmptyTree = "Not Found"
findParent name (Node n _ _ leftTree middleTree rightTree)
  | n == name = "No Parent"
  | searchName name leftTree = n
  | searchName name middleTree = n
  | searchName name rightTree = n
  | otherwise = "Not Found"


siblings :: String -> FamilyTree -> [String]
siblings name EmptyTree = []
siblings name (Node n numChildren _ leftTree middleTree rightTree)
    | n == name = getNames leftTree ++ getNames middleTree ++ getNames rightTree
    | otherwise = siblings name leftTree ++ siblings name middleTree ++ siblings name rightTree
    where getNames EmptyTree = []
          getNames (Node n _ _ _ _ _) = [n]
		  
		  
avglifetime :: FamilyTree -> Double
avglifetime EmptyTree = 0.0
avglifetime (Node _ _ (birth, death) leftTree middleTree rightTree) =
    (fromIntegral (death - birth) / 2.0) + (avglifetime leftTree) + (avglifetime middleTree) + (avglifetime rightTree)







  


























