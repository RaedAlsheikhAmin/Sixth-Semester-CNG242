data UniTree = EmptyTree | Node ([Char] , Integer) Integer [UniTree]  deriving(Show, Ord, Eq)


-- unitree :: [(String, Integer)] -> [Integer] -> UniTree 
-- unitree [] [] = EmptyTree
-- unitree ((name, count):restNames) (numChildren:restChildren)
  -- | count < 0 = error "Number of employees cannot be negative"
  -- | otherwise = Node (name, count) numChildren subtrees
  -- where
    -- subtrees = replicate (fromIntegral numChildren) (unitree restNames restChildren)
	
-- --Unitree function
-- unitree :: [(String, Integer)] -> [Integer] -> UniTree
-- unitree [] _ = EmptyTree
-- unitree _ []= EmptyTree
-- unitree ((name, emp):restNames) (numChildren:restChildren) | numChildren>0 =
    -- Node (name, emp) numChildren (helper restNames restChildren numChildren)
    -- -- if the parent has children then we keep calling the helper function
    -- -- to add the children to the list.
  -- | numChildren==0 =
    -- Node (name,emp) numChildren [EmptyTree]
    -- -- if the parent doesn't have children that means we will just return
    -- -- the parent and ignore the rest of the list

-- -- Helper function
-- helper :: [(String, Integer)] -> [Integer] -> Integer -> [UniTree]
-- helper [] _ _ = []
-- helper _ [] _ = []
-- helper ((name, emp):restNames) (numChildren:restChildren) x
    -- | x > 0 && numChildren == 0 =
        -- [Node (name, emp) numChildren [EmptyTree]] ++ helper restNames restChildren (x - 1)
    -- | x > 0 && numChildren == 1 =
        -- [Node (name, emp) numChildren (helper restNames restChildren numChildren)]
        -- ++ helper (tail restNames) (tail restChildren) (x - 1)
    -- | x > 0 && numChildren /= 0 =
        -- [Node (name, emp) numChildren (helper restNames restChildren numChildren)]
    -- | otherwise =
        -- [Node (name, emp) numChildren [EmptyTree]]
		
		
		
		
		--a version that considers all the nodes
		-- -- Unitree function
-- unitree :: [(String, Integer)] -> [Integer] -> UniTree
-- unitree [] _ = EmptyTree
-- unitree _ []= EmptyTree
-- unitree ((name, emp):restNames) (numChildren:restChildren) | numChildren>0 = Node (name, emp) numChildren (helper restNames restChildren numChildren)
    -- -- if the parent has children then we keep calling the helper function to add the children to the list.
  -- | otherwise = Node (name, emp) numChildren [EmptyTree]
    -- -- if the parent doesn't have children that means we will just return the parent and ignore the rest of the list

-- -- Helper function
-- helper :: [(String, Integer)] -> [Integer] -> Integer -> [UniTree]
-- helper [] _ _ = []
-- helper _ [] _ = []
-- helper ((name, emp):restNames) (numChildren:restChildren) x
    -- | x > 0 && numChildren == 0 =
        -- [Node (name, emp) numChildren [EmptyTree]] ++ helper restNames restChildren (x - 1)
    -- | x > 0 && numChildren == 1 =
        -- [Node (name, emp) numChildren (helper restNames restChildren numChildren)]
    -- | x > 0 && numChildren /= 0 =
        -- [Node (name, emp) numChildren (helper restNames restChildren numChildren)]
    -- | otherwise =
        -- [Node (name, emp) numChildren (helper restNames restChildren 0)]
		
		
nameandemp = [ ("Rectorate", 2), ("General Secretary", 6), ("Social Sciences", 2), ("Economics", 4), ("Political Science", 5), ("Education", 2) , ("Pre School", 3) , ("Foreign Languages", 4) , ("Engineering", 4), ("Computer Engineering", 10) , ("Mechanical Engineering", 5), ("Electrical Engineering", 6)]
children = [3, 0, 3, 0, 0, 2, 0, 0, 3, 0, 0, 0]
desiredotoutput=Node ("Rectorate",2) 3 [Node ("General Secretary",6) 0 [],Node ("Social Sciences",2) 3 [Node ("Economics",4) 0 [],Node ("Political Science",5) 0 [],Node ("Education",2) 2 [Node ("Pre School",3) 0 [],Node ("Foreign Languages",4) 0 []]],Node ("Engineering",4) 3 [Node ("Computer Engineering",10) 0 [],Node ("Mechanical Engineering",5) 0 [],Node ("Electrical Engineering",6) 0 []]]


-- unitree [] [] = EmptyTree
-- unitree ((name, count):restNames) (numChildren:restChildren)
  -- | count < 0 = error "Number of employees cannot be negative"
  -- | otherwise = Node (name, count) numChildren subtrees
  -- where
    -- (childNames, remainingNames) = splitAt (fromIntegral numChildren) restNames
    -- (childCounts, remainingCounts) = splitAt (fromIntegral numChildren) restChildren
    -- subtrees = zipWith unitree (chunksOf 1 childNames) (chunksOf 1 childCounts) ++ [unitree remainingNames remainingCounts]

-- chunksOf :: Int -> [a] -> [[a]]
-- chunksOf _ [] = []
-- chunksOf n xs = take n xs : chunksOf n (drop n xs)



--very correct version needs to be debugged
-- Unitree function
unitree :: [(String, Integer)] -> [Integer] -> UniTree
unitree [] _ = EmptyTree 
unitree _ []= EmptyTree
unitree ((name, emp):restNames) (numChildren:restChildren) | numChildren>0 = Node (name, emp) numChildren (helper restNames restChildren numChildren)--if the parent has children then we keep calling the helper function to add the children to the list.
														   | numChildren==0 = Node (name,emp) numChildren [EmptyTree] --if the parent doesn't have children that means we will just return the parent and ignore the rest of the list

-- Helper function
helper :: [(String, Integer)] -> [Integer] -> Integer -> [UniTree]
helper [] _ _ = []
helper _ [] _ = []
helper ((name, emp):restNames) (numChildren:restChildren) x
    | x > 0 && numChildren == 0 =
        [Node (name, emp) numChildren [EmptyTree]] ++ helper restNames restChildren (x - 1)
    | x > 0 && numChildren == 1 =
        [Node (name, emp) numChildren (helper restNames restChildren numChildren)] ++
        helper (tail restNames) (tail restChildren) (head (tail restChildren))
    | x > 0 && numChildren /= 0 =
        [Node (name, emp) numChildren (helper restNames restChildren numChildren)]
    | otherwise =
        [Node (name, emp) numChildren [EmptyTree]]
		

sectionSize :: UniTree -> String -> Integer
sectionSize EmptyTree _ = 0
sectionSize (Node (name, emp) _ children) targetName
    | name == targetName = emp + sum (map sumEmployeesInSection children)
    | otherwise = sum (map (sectionSizeHelper targetName) children)

sectionSizeHelper :: String -> UniTree -> Integer
sectionSizeHelper targetName (Node (name, emp) _ children)
    | name == targetName = emp + sum (map sumEmployeesInSection children)
    | otherwise = sectionSize (Node (name, 0) 0 children) targetName

sumEmployeesInSection :: UniTree -> Integer
sumEmployeesInSection EmptyTree = 0
sumEmployeesInSection (Node (_, emp) _ children) = emp + sum (map sumEmployeesInSection children)


--extra helper function I wrote to check if i have the name or not.
searchTree :: UniTree -> String -> Bool
searchTree EmptyTree _ = False
searchTree (Node (name, _) _ children) targetName
    | name == targetName = True
    | otherwise = foldr (\child acc -> acc || searchTree child targetName) False children
	
	
managingEntity :: UniTree -> String -> String
managingEntity EmptyTree _ = "The Tree is Empty, Please check your input!"
managingEntity (Node (parentName, _) _ children) targetChild
    | parentName == targetChild = "This is the root of the tree. No parent for it."
    | otherwise = case findParentChild parentName children targetChild of
                    "" -> foldr (\child acc -> acc ++ managingEntity child targetChild) "" children
                    parent -> parent

findParentChild :: String -> [UniTree] -> String -> String
findParentChild _ [] _ = ""
findParentChild parentName ((Node (childName, _) _ _) : rest) targetChild
    | childName == targetChild = parentName
    | otherwise = findParentChild parentName rest targetChild
	
	
	
managelist :: UniTree -> String -> [String]
managelist tree targetChild =
    case findAncestors tree targetChild of
        [] -> []
        ancestors -> reverse (init ancestors)

findAncestors :: UniTree -> String -> [String]
findAncestors EmptyTree _ = []
findAncestors (Node (name, _) _ children) targetChild
    | name == targetChild = [name]
    | otherwise = case findAncestorsFromChildren children targetChild of
                    [] -> []
                    ancestors -> name : ancestors

findAncestorsFromChildren :: [UniTree] -> String -> [String]
findAncestorsFromChildren [] _ = []
findAncestorsFromChildren (child : rest) targetChild =
    case findAncestors child targetChild of
        [] -> findAncestorsFromChildren rest targetChild
        ancestors -> ancestors


	

	



		

		
		