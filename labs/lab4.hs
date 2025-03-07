data Tree = EmptyTree | Node Integer Tree Tree deriving (Show, Eq, Ord)
insertElement x EmptyTree = Node x EmptyTree EmptyTree -- BASE CASE
insertElement x (Node a left right) = if x == a -- DO NOTHING
 then (Node x left right)
 else if x < a -- INSERT TO LEFT
 then (Node a (insertElement x left) right)
 else -- INSERT TO RIGHT
 Node a left (insertElement x right)
-----------------------------------------------------------------------------------------------------------
--inserting a list to a Tree

inserter []= EmptyTree
inserter (x:xs)= insertElement x (inserter xs )
-----------------------------------------------------------------------------------------------------------
--finding the minimum value in the tree

minofTree (Node a EmptyTree _)= a
minofTree (Node a left right)= (minofTree  left) 

-----------------------------------------------------------------------------------------------------------

--Write a Haskell function that checks if a given Tree is empty or not.

isemptyTree EmptyTree = True
isemptyTree (Node a left right)=False

-----------------------------------------------------------------------------------------------------------
--search for element
searchtree _ EmptyTree =  False       --if the tree is empty idc about the value
searchtree x (Node a left right)= if a==x then True 
								  else if x < a -- search for the left side
								  then (searchtree x left)
								  else -- search for the right side
								  (searchtree x right)
