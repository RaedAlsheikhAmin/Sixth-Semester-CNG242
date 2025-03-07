--question 1
data ThreeDshapes= Cube Float | Cylinder Float Float deriving(Show,Ord,Eq)
volumy (Cube x)= x*x*x
volumy (Cylinder x y)= 3.14 * x *x *y
spacy (Cube x)= 6*x*x*x
spacy (Cylinder x y)= 2 * 3.14 * x * y+ 2*3.14*x*x

--question 2
data ThreeDshapes a b = Cube a | Cylinder a b deriving(Show,Ord,Eq)
volumy (Cube x)= x*x*x
volumy (Cylinder x y)= 3.14 * x *x *y
spacy (Cube x)= 6*x*x*x
spacy (Cylinder x y)= 2 * 3.14 * x * y+ 2*3.14*x*x

-- question 3
(\x y-> x+y)

-- question 4
(\x xs-> x++xs)