Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.



select  case 
        -- null means no parent nodes
        when p is null then concat(n, ' Root')
        -- node also found in parent col
        when n in (select distinct p from bst) then concat(n, ' Inner')
        -- not null and not in parent col
        else concat(n, ' Leaf')
    end
from BST
order by n asc


