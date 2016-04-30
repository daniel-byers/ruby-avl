require_relative 'bs_tree'
module AVLTree
  class AVLTree < BSTree::BSTree

    # Public interfaces implemented in superclass

    private

    # Calls superclass (BSTree) method passing in parameters
    # recieved from caller. Passes in the returned value of
    # BSTree#add_to_tree to :rebalance and returns final result.
    def add_to_tree(item, node)
      return rebalance(super(item, node))
    end

    # Calls superclass (BSTree) method passing in parameters
    # recieved from caller. Passes in the returned value of
    # BSTree#remove_from_tree to :rebalance and returns final
    # result.
    def remove_from_tree(item, node)    
      return rebalance(super(item, node))
    end

    # Checks the balance factor of the node and rotates the tree
    # if inbalanced in any way. Balance algorithm:
    # IF tree is right heavy
    #   IF tree's right subtree is left heavy (Right Left Case)
    #      Perform Double Left rotation
    #   ELSE (Right Right Case)
    #      Perform Single Left rotation
    # ELSE IF tree is left heavy
    #   IF tree's left subtree is right heavy (Left Right Case)
    #      Perform Double Right rotation
    #   ELSE (Left Left Case)
    #      Perform Single Right rotation
    # END IF
    def rebalance(node)
      if balance_factor(node) >= 2
        if (balance_factor(node.left) < 0)
          return double_rotate_right(node)
        else
          return rotate_right(node)
        end
      elsif balance_factor(node) <= -2
        if (balance_factor(node.right) > 0)
          return double_rotate_left(node)
        else
          return rotate_left(node)
        end
      else
        return node
      end
    end

    # Node becomes the left subtree of it's right subtree.
    def rotate_left(node)
      new_node = node.right
      node.right = new_node.left
      new_node.left = node
      return new_node
    end

    # Right rotation performed on node's right subtree before
    # node is rotated left.
    def double_rotate_left(node)
      node.right = rotate_right(node.right)
      return rotate_left(node)
    end

    # Node becomes the right subtree of it's left subtree.
    def rotate_right(node)
      new_node = node.left
      node.left = new_node.right
      new_node.right = node
      return new_node
    end

    # Left rotation performed on node's left subtree before
    # node is rotated right.
    def double_rotate_right(node)
      node.left = rotate_left(node.left)
      return rotate_right(node)    
    end

    # Calculates the height of the left subtree, then subtracts the height of the
    # right subtree to produce the balance factor for the node.
    def balance_factor(node)
      node.nil? ? 0 : (height(node.left) - height(node.right))
    end
  end
end