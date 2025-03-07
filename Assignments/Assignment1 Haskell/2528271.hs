-- Raed Alsheikh Amin – 2528271
-- I read and accept the submission rules and the extra rules specified in each question. This is my own work that is done by myself only.


--this is my definition of data familytree which will take name childnum (birth,death) and create tree out of it, maximum 3 nodes(it would be easier if it was [familytree])

data FamilyTree = EmptyTree | Node [Char] Integer (Integer,Integer) FamilyTree FamilyTree FamilyTree deriving(Show, Ord, Eq)


familytree :: [String] -> [Integer] -> [(Integer, Integer)] -> FamilyTree --that it will take list of strings and integers and tuples and return a tree from type FamilyTree
familytree [] [] [] = EmptyTree--if the lists are empty that means there is no tree so we refere to EmptyTree
familytree (name : names) (numChildren : children) ((birth, death) : dates)-- defining the input for the familytree function.
  | numChildren > 3 = error "A parent can have at most three children, check your input please"--if number of children is bigger than three, that will violate the rule for my tri-array that i am creating( still if it was [familytree] it would be easier)
  | otherwise = Node name numChildren (birth, death) leftTree middleTree rightTree--in this case we will call the tree with the first thing of the lists and we call three subfunctions to help to build the tree.
  where--for this part I am using take and drop that I make sure I will use the number of children maximum 3 times.
    leftTree = familytree (take (fromIntegral numChildren) names) (take (fromIntegral numChildren) children) (take (fromIntegral numChildren) dates)
    middleTree = familytree (drop (fromIntegral numChildren) $ take (2 * fromIntegral numChildren) names) (drop (fromIntegral numChildren) $ take (2 * fromIntegral numChildren) children) (drop (fromIntegral numChildren) $ take (2 * fromIntegral numChildren) dates)
    rightTree = familytree (drop (2 * fromIntegral numChildren) names) (drop (2 * fromIntegral numChildren) children) (drop (2 * fromIntegral numChildren) dates)
	
	
	
	
--this is the sample run that I used in this assignment.

mytree= familytree names children years

names =  ["Nikolaus1", "Jacob I", "Nikolaus2", "Nikolaus I", "Johann I", "Nikolaus II", "Daniel", "Johann II", "Johann III", "Jacob II"]

children = [3, 0, 1, 0, 3, 0, 0, 2, 0, 0]

years = [(1623, 1708), (1654, 1705), (1662, 1716), (1687, 1759), (1667, 1748), (1695, 1726), (1700, 1782), (1710, 1790), (1746, 1807), (1759, 1789)]

  

search :: String -> FamilyTree -> Bool --specifiying the input and the output of the function.(string,tree)->bool
search _ EmptyTree = False--it will check the tree, if it is empty it will return False, No matter what the name argument is.
search name (Node n _ _ leftTree middleTree rightTree) = --using recursive to traverse the entire tree searching for the name
  if n == name--if the parent is the targeted name we just return True.
    then True
    else search name leftTree || search name middleTree || search name rightTree--we go left right or middle and we stop when we find the name, otherwise we have to traverse the enitre tree.
	
	

parent :: String -> FamilyTree -> String--this function will take (string,tree)-> string
parent _ EmptyTree = "The tree is Empty" --if the tree is empty without checking the argument of the name.
parent name (Node n _ _ leftTree middleTree rightTree)--calling the function recursively until we find the parent.
  | n == name = "No Parent"--if the root is the targeted name that means no parent for it
  | ifoundthenamein leftTree = getparent leftTree
  | ifoundthenamein middleTree = getparent middleTree
  | ifoundthenamein rightTree = getparent rightTree
  | otherwise = "Not found"
  where--helper functions, the first one will find the name and check in which subtree, the second one will match with the parent and return the name of the parent.
    ifoundthenamein tree = search name tree 
    getparent (Node parentName _ _ _ _ _) = parentName
	
	

siblings :: String -> FamilyTree -> [String] --(string,tree)->[string] , it will return list of names.
siblings name EmptyTree = [] --if the tree is empty, it will return empty list.
--siblings name (Node n numChildren _ leftTree middleTree rightTree)-- we will consider the targeted name and the name and number of children.( need to be completed later but i couldn't find a way to solve it)
		  
		  
lifespan :: FamilyTree -> Integer--this will take the tree and return an integer calculated from death-birth
lifespan EmptyTree = 0--base case
lifespan (Node _ _ (birth, death) leftTree middleTree rightTree) = death - birth--considering only the argument of (birth,death)

avglifetime :: FamilyTree -> Double--taking a tree and return a double.
avglifetime tree = all_life_time / fromIntegral number_of_nodes--our function will return the average using helper functions.
  where
    (all_life_time, number_of_nodes) = sumofdata tree
    
    sumofdata EmptyTree = (0, 0)--we set sumofdata to (0,0) as our base case, that means if the tree is empty, there is no life time, neither nodes.
    sumofdata (Node _ _ (birth, death) leftTree middleTree rightTree) = --this function will mainly consider the (birth,death).
      (lifeSpan + totalLifeTimeLeft + totalLifeTimeMiddle + totalLifeTimeRight, 1 + numNodesLeft + numNodesMiddle + numNodesRight)--the 1 is coming from the root, and then recursively we start counting the nodes.
      where
        lifeSpan = fromIntegral (death - birth)--changing the type of it that we can use it. and then we start calling the subtrees recursively that we count the number of nodes and we sum them all. considering the lifespan of each family member as well.
        (totalLifeTimeLeft, numNodesLeft) = sumofdata leftTree
        (totalLifeTimeMiddle, numNodesMiddle) = sumofdata middleTree
        (totalLifeTimeRight, numNodesRight) = sumofdata rightTree
