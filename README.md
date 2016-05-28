# Ruby AVL

An implementation of the Adelson-Velsky and Landis self-balancing binary search tree written in Ruby.

## Usage

To use the AVL Tree is simple, first just initialise it:
    avl_tree = AVLTree::AVLTree.new

Then add the data:
		avl_tree.insert_item(1)
		avl_tree.insert_item(2)
		avl_tree.insert_item(3)

Remove data if necessary:
		avl_tree.remove_item(3)

To traverse the tree and print out the information, use one of the traversals. Pass in the root of the AVL Tree as the first parameter:
		AVLTree::BSTreeTraversal.new.pre_order_string(avl_tree.root)
		AVLTree::BSTreeTraversal.new.in_order_string(avl_tree.root)
		AVLTree::BSTreeTraversal.new.post_order_string(avl_tree.root)

This will print out the data in the tree. An optional parameter can be passed into this function to print out an attribute of the data in the node, instead of the node itself:
		AVLTree::BSTreeTraversal.new.pre_order_string(avl_tree.root, :name)