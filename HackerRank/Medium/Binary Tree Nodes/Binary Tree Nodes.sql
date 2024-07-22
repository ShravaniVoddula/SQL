Select  N, ( Case 
         When (P IS NULL) then "Root"
         When (N NOT IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL)) then "Leaf"
         else "Inner" 
    End )as Nodetype
from BST
Order by N ASC;
