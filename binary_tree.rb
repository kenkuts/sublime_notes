Binary Tree:===============================

In a binary tree each node can have at most 2 children.
A node with out a child is called a leaf child and they both have a child of null.
A node cannot have more than 2 children

	0
   / \
  0   0	  #=> has a right node child and a null right child.
 / \   \
0   0   0 #=> Leaf Nodes



 Strict/Proper Binary Tree:===============================
 Each node can have either 2 or 0 children.

 	 0
   /   \
  0     0	 
 / \   / \
0   0 0   0 #=> Leaf Nodes



Complete Binary Tree:===============================
All levels except possibly the last are completely filled and all nodes are left as possible.
		     0
		   /   \
		  0     0	 
		 / \     
		0   0    
	   / \	
	  0   0


Root node in a tree is L-0, etc.

 	 0		#=> L1
   /   \
  0     0	#=> L2
 / \   / \
0   0 0   0 #=> L3

Max no of nodes at level i = 2^i
if i = 0 = 2^0 == 1 no of max nodes
if i = 0 = 2^1 == 2 no of max nodes
if i = 0 = 2^2 == 4 no of max nodes


Prefect Binary Tree:
All Levels are completely filled.

		      0  
		   /    \
		  0      0	 
		 / \    / \
		0   0  0   0
 
Maximum no of nodes in a tree with height 
h = 2^0 + 2^1 + .... + 2^h
  = 2^(h+1)- 1
  = 2^(no of levels) - 1

So if h = 3
2^(3+1) - 1 = 2^(4) - 1
16 - 1 = 15 maximum no ofnodes in a perfect binary tree.

What if we need to get the height of n nodes?
n = no of nodes.
n = 2^(h+1) - 1
  = 2^(h+1) = (n+1)
  = h = log(2)(n+1) - 1
if n = 15 = log(2)(16) - 1
log(2)(16) = 4 - 1 = 3
h = 3



















