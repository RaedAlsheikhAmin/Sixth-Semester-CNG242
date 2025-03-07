-- Raed Alsheikh Amin – 2528271
-- I read and accept the submission rules and the extra rules specified 
--https://learnyouahaskell.com/zippers this is an extra resource that I used to learn, and the links provided at the end of the worksheets
--in each question. This is my own work that is done by myself only.

--type strong is provided for all functions for better understanding how to process during writing the function and what should be the output.


--data type that will represent the tree with infinite children that will be included in a list of trees
--each Node will store (name, employee) numberofchildren [children] and it goes like that
--or it will be Empty tree if there is no children
data UniTree = EmptyTree | Node ([Char] , Integer) Integer [UniTree]  deriving(Show, Ord, Eq)



-- unitree function
--a function to build the tree using a list of tuples and a list of integers for children.
unitree :: [(String, Integer)] -> [Integer] -> UniTree-- it will take a list of tuples represented as (string, int) and another int as parameter and return Unitree data type
unitree [] _ = EmptyTree -- if the list of tuples is empty
unitree _ []= EmptyTree-- if the children list is empty
unitree ((name, emp):restnames) (numchildren:restchildren) | numchildren>0 = Node (name, emp) numchildren (helper restnames restchildren numchildren)--if the parent has children then we keep calling the helper function to add the children to the list.
														   | numchildren==0 = Node (name,emp) numchildren [EmptyTree] --if the parent doesn't have children that means we will just return the parent and ignore the rest of the list

-- Helper function
-- it has some condtions to check which statements to execute according to the given input.
-- It takes three parameters:
--
-- 1. List of tuples where each tuple contains a string (node name) and an integer (employee number).
-- 2. List of integers representing the number of children for each node.
-- 3. Integer representing the number of children for the previous node.
--
-- It returns a list of UniTree representing the children of a node.

helper :: [(String, Integer)] -> [Integer] -> Integer -> [UniTree]-- it get a list of (name,empnum) list of children and a num of children in the previous node.
helper [] _ _ = []
helper _ [] _ = []
helper ((name, emp):restnames) (numchildren:restchildren) childforpreviousnode
    | childforpreviousnode > 0 && numchildren == 0 = 
        [Node (name, emp) numchildren [EmptyTree]] ++ helper restnames restchildren (childforpreviousnode - 1)
    | childforpreviousnode > 0 && numchildren == 1 =
        [Node (name, emp) numchildren (helper restnames restchildren numchildren)] ++
        helper (tail restnames) (tail restchildren) (head (tail restchildren))
    | childforpreviousnode > 0 && numchildren /= 0 =
        [Node (name, emp) numchildren (helper restnames restchildren numchildren)]
    | otherwise =
        [Node (name, emp) numchildren [EmptyTree]]
		
		
--section size function: which will mainly use map to use the function on the entire children list.
sectionsize :: UniTree -> String -> Integer--it will take a unitree data type and the targetedname to return the number of employes in the targeted name and its children
sectionsize EmptyTree _ = 0
sectionsize (Node (name, emp) _ children) targetname
    | name == targetname = emp + sum (map sumemployeesinsection children) -- If the node matches the target name, add its employee count to the sum of its children
    | otherwise = sum (map (sectionsizehelper targetname) children) --Otherwise, recursively call 'sectionsizehelper' on its children and sum the results

--helper function
sectionsizehelper :: String -> UniTree -> Integer
sectionsizehelper targetname (Node (name, emp) _ children)
    | name == targetname = emp + sum (map sumemployeesinsection children)-- If the current node matches the target name, add its employee count to the sum of its children
    | otherwise = sectionsize (Node (name, 0) 0 children) targetname-- Otherwise, recursively call 'sectionsize' on the current node with the target name

sumemployeesinsection :: UniTree -> Integer
sumemployeesinsection EmptyTree = 0 -- If the current node is empty, return 0
sumemployeesinsection (Node (_, emp) _ children) = emp + sum (map sumemployeesinsection children) -- Otherwise, sum the employee count of the current node with the sum of employee counts of its children


--manage entity function: which will mainly flatten the lists to be able to check the parent.
managingentity :: UniTree -> String -> String
managingentity EmptyTree _ = "The Tree is Empty, Please check your input!"-- If the tree is empty, return a message indicating an empty tree
managingentity (Node (parentname, _) _ children) targetchild
    | parentname == targetchild = "This is the root of the tree. No parent for it." -- If the parent name matches the target child's name, return a message indicating it's the root of the tree
    | otherwise = case findparentchild parentname children targetchild of
                    "" -> foldr (\child accumulator -> accumulator ++ managingentity child targetchild) "" children -- If the parent of the target child is not found, recursively call 'managingentity' on each child node and concatenate the results
                    parent -> parent -- If the parent of the target child is found, return the parent's name
					

--helper function
-- It takes three parameters:
-- 1. String representing the parent's name.
-- 2. List of UniTree representing the children nodes.
-- 3. String representing the target child's name.
-- It returns a String representing the name of the immediate section responsible for managing the target child.	
findparentchild :: String -> [UniTree] -> String -> String
findparentchild _ [] _ = "" -- If the list of children nodes is empty, return an empty string indicating the target child's parent is not found
findparentchild parentname ((Node (childname, _) _ _) : restoftree) targetchild
    | childname == targetchild = parentname -- If the current child's name matches the target child's name, return the parent's name
    | otherwise = findparentchild parentname restoftree targetchild -- Otherwise, recursively call 'findparentchild' on the remaining children nodes
	
	
--manage list function: 
-- It takes two parameters:
-- 1. UniTree representing the root of the tree.
-- 2. String representing the target child's name.
-- It returns a list of Strings representing the path from the target child to the root of the tree.


managelist :: UniTree -> String -> [String]
managelist tree targetchild = case findancestors tree targetchild of
								[] -> [] -- If no ancestors are found, return an empty list.
								ancestors -> reverse (init ancestors) -- Otherwise, reverse the list of ancestors to get the path from the root to the target child.
								
								
--helper function:
-- It takes two parameters:
-- 1. UniTree representing the current node in the tree.
-- 2. String representing the target child's name.
-- It returns a list of Strings representing the path from the current node to the root of the tree.

findancestors :: UniTree -> String -> [String]
findancestors EmptyTree _ = [] -- Base case: If the current node is EmptyTree, return an empty list since there are no ancestors.
findancestors (Node (name, _) _ children) targetchild
    | name == targetchild = [name] -- If the current node's name matches the target child's name, it's an ancestor. Return a list containing the target child's name.
    | otherwise = case findancestorsfromchildren children targetchild of -- Otherwise, recursively call 'findancestorsfromchildren' on the current node's children.
                    [] -> [] -- If no ancestors are found in children, return an empty list
                    ancestors -> name : ancestors -- Otherwise, prepend the current node's name to the list of ancestors.

--second helper function:
-- It takes two parameters:
-- 1. List of UniTree representing the children nodes.
-- 2. String representing the target child's name.
-- It returns a list of Strings representing the path from the target child to the root of the tree.

findancestorsfromchildren :: [UniTree] -> String -> [String]
findancestorsfromchildren [] _ = [] -- Base case: If the list of children is empty, return an empty list since there are no more nodes to search for ancestors.
findancestorsfromchildren (child : rest) targetchild = case findancestors child targetchild of -- Recursively search for ancestors in the remaining children nodes. If ancestors are found, return the list of ancestors. Otherwise, continue searching in the rest of the children nodes.
														[] -> findancestorsfromchildren rest targetchild -- If no ancestors are found in the current child, continue searching in the rest of the children.
														ancestors -> ancestors -- If ancestors are found, return them.
		
		
		
		



--test all the code with provided sampleruns

nameandemp = [ ("Rectorate", 2), ("General Secretary", 6), ("Social Sciences", 2), ("Economics", 4), ("Political Science", 5), ("Education", 2) , ("Pre School", 3) , ("Foreign Languages", 4) , ("Engineering", 4), ("Computer Engineering", 10) , ("Mechanical Engineering", 5), ("Electrical Engineering", 6)]
children = [3, 0, 3, 0, 0, 2, 0, 0, 3, 0, 0, 0]
desiredotoutput=Node ("Rectorate",2) 3 [Node ("General Secretary",6) 0 [],Node ("Social Sciences",2) 3 [Node ("Economics",4) 0 [],Node ("Political Science",5) 0 [],Node ("Education",2) 2 [Node ("Pre School",3) 0 [],Node ("Foreign Languages",4) 0 []]],Node ("Engineering",4) 3 [Node ("Computer Engineering",10) 0 [],Node ("Mechanical Engineering",5) 0 [],Node ("Electrical Engineering",6) 0 []]]

testtreeconstruction= unitree nameandemp children


testsectionsize1= sectionsize desiredotoutput "Education"
testsectionsize2= sectionsize desiredotoutput "Engineering"

testmanagingEntity= managingentity desiredotoutput "Education"


testmanagelist=managelist desiredotoutput "Pre School"