module AVLTree  
  class BSTree

    attr_reader :root

    def initialize(root = nil)
      @root = root  
    end

    # Starts the search for the insertion at the root of
    # the tree. Set the new root at the end if it has changed.
    def insert_item(item)
      @root = add_to_tree(item, @root)      
    end

    # Starts the search for the deletion at the root of
    # the tree. Set the new root at the end if it has changed.
    def remove_item(item)
      @root = remove_from_tree(item, @root)
    end

    # Starts the count at the root node.
    def number_of_nodes
      node_count(@root)
    end

    # Starts the count of the depth at the root node.
    def depth_of_tree
      tree_depth(@root, 0)
    end

    private

    # If the current node is null then a new Node object is created and item
    # is passed in as a constructor. If item is smaller than the data stored
    # in the current node then :add_to_tree is called recursively to traverse
    # the left-sub tree until the node is null. The same thing happens if the 
    # item is larger, but the right sub-tree is traversed. If item is neither
    # larger nor smaller then it must be equal, in which case an error will be
    # raised to inform the user of duplication.
    def add_to_tree(item, node)
      if node.nil?
        return Node.new(item)
      elsif compare(item, node.data) < 0
        node.left = add_to_tree(item, node.left)
      elsif compare(item, node.data) > 0
        node.right = add_to_tree(item, node.right)
      else
        puts 'Duplicate entry. Skipping: %s' % item
      end
      return node
    end

    # If the current node is null then the tree is empty or the item isn't in it. 
    # If item is smaller or larger than current node like above, if it's neither then
    # it must be equal so checks are made to see how many children that node has. If
    # it has two then a the value of the node is swapped with the value of the
    # smallest item in it's right-sub tree, then removeItem is called again but this time
    # on the value in the right sub-tree. If the node has less than two children
    # another check is made: if the left child is not null, the value of the node is 
    # equal to that value, otherwise it's equal to the value of the right child.
    def remove_from_tree(item, node)
      return if node.nil?      
      if compare(item, node.data) < 0
        node.left = remove_from_tree(item, node.left)
      elsif compare(item, node.data) > 0
        node.right = remove_from_tree(item, node.right)
      elsif node.left && node.right
        node.data = least_item(node.right).data
        node.right = remove_from_tree(node.data, node.right)
      else
        node = node.left ? node.left : node.right
      end
      return node
    end

    # Comparison of two objects. Will return -1 if item_one is less than item_two, 0 if
    # they are equal, and 1 if item_one is greater than item_two. First checks if object
    # has it's own comparison logic, if not, uses core Ruby comparision.
    def compare(item_one, item_two)
      begin
        item_one.compare_to(item_two)
      rescue NoMethodError
        item_one <=> item_two
      end
    end

    # Recursively finds the lowest item in a nodes left subtree.
    def least_item(node)
      return unless node
      return node unless node.left
      least_item(node.left)
    end

    # Traverses the tree and returns the sum of the nodes.
    def node_count(node)
      node.nil? ? 0 : 1 + node_count(node.left) + node_count(node.right)
    end

    # Traverses the tree and calculates the depth of the longest sub-tree
    def tree_depth(node, depth)
      node.nil? ? 0 : depth + max(height(node.left), height(node.right))
    end

    # Calculates the height of the node using it's leaves. Initial check to see if
    # node is nil which means it has a height of 0.
    def height(node)
      node.nil? ? 0 : 1 + max(height(node.left), height(node.right))
    end

    # Converts parameters to an Array then calls Enumerable#max on them to return
    # the largest element.
    def max(*values)
      values.max
    end
  end
end