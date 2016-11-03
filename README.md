# Ruby AVL

An implementation of the Adelson-Velsky and Landis self-balancing binary search tree written in Ruby.

***

## Usage

The AVL Tree allows any object to be placed into a Node. However, comparison of the objects needs to be done on an attribute, otherwise the tree won't be able to judge which sub-tree to put the object in. This is done easily by implementing the method #compare_to on your object:

    class Person
      attr_accessor :name

      def compare_to(other_person)
        this.name <=> other_person.name
      end
    end

In the above example, a Person object can be added to the tree and it will be balanced on the lexicographical comparison of their name with another Person object's name attribute. This allows you to have more complex trees.

If you just want to build a tree from simple data types (Fixnum, String, etc.) that can already be compared. You don't need to implement this method.

***

To use the AVL Tree is simple, first initialise it:

    avl_tree = AVLTree::AVLTree.new

Then add the data:

    avl_tree.insert_item(1)
    avl_tree.insert_item(2)
    avl_tree.insert_item(3)

Remove data if necessary:

    avl_tree.remove_item(3)

***

To traverse the tree and return the structural information: use one of the traversals. Pass in the root of the AVL Tree as the first parameter. This will return a string representing the nodes in the tree:

    AVLTree::BSTreeTraversal.new.pre_order_string(avl_tree.root)
    AVLTree::BSTreeTraversal.new.in_order_string(avl_tree.root)
    AVLTree::BSTreeTraversal.new.post_order_string(avl_tree.root)

This will return an Array with each element representing a node in the tree:

    AVLTree::BSTreeTraversal.new.pre_order_array(avl_tree.root)
    AVLTree::BSTreeTraversal.new.in_order_array(avl_tree.root)
    AVLTree::BSTreeTraversal.new.post_order_array(avl_tree.root)


An optional parameter can be passed into this function to print out an attribute of the data in the node, instead of the node itself. Obviously, the attribute needs to exist on the object:

    AVLTree::BSTreeTraversal.new.pre_order_string(avl_tree.root, :name)
    AVLTree::BSTreeTraversal.new.pre_order_array(avl_tree.root, :name)