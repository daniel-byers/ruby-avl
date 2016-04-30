module AVLTree
  class BSTreeTraversal

    def pre_order_array(root_node, attribute = nil)
      pre_order(root_node, attribute, [])
    end

    def pre_order_string(root_node, attribute = nil)
      pre_order(root_node, attribute, []).join(', ')
    end

    def in_order_array(root_node, attribute = nil)
      in_order(root_node, attribute, [])
    end

    def in_order_string(root_node, attribute = nil)
      in_order(root_node, attribute, []).join(', ')    
    end

    def post_order_array(root_node, attribute = nil)
      post_order(root_node, attribute, [])
    end

    def post_order_string(root_node, attribute = nil)
      post_order(root_node, attribute, []).join(', ')
    end

    private

    # The idea of preorder traversal is that we visit the nodes in the order root-left-right,
    # meaning for any subtree in the path, root is processed as the node is visited, left node 
    # is visited second, followed by right node.
    # If attribute is set then it is called as a method on the data stored
    # in the node, and that value is added to the array. If not, the data is added.
    def pre_order(node, attribute, node_list)
      unless node.nil?
        node_list << (attribute ? node.data.send(attribute) : node.data)
        pre_order(node.left, attribute, node_list)
        pre_order(node.right, attribute, node_list)
      end
      return node_list
    end

    # The idea of inorder traversal is that we visit the nodes in the order left-root-right,
    # meaning for any subtree in the path, left node must be visited first followed by root
    # and right node. Prints the values in ascending order.
    # If attribute is set then it is called as a method on the data stored
    # in the node, and that value is added to the array. If not, the data is added.
    def in_order(node, attribute, node_list)
      unless node.nil?
        in_order(node.left, attribute, node_list)
        node_list << (attribute ? node.data.send(attribute) : node.data)
        in_order(node.right, attribute, node_list)
      end
      return node_list
    end

    # The idea of postorder traversal is that we visit the nodes in the order left-right-root,
    # meaning for any subtree in the path, left node must be visited first, followed by the
    # right node, and root is not processed until the children are.
    # If attribute is set then it is called as a method on the data stored
    # in the node, and that value is added to the array. If not, the data is added.
    def post_order(node, attribute, node_list)
      unless node.nil?
        post_order(node.left, attribute, node_list)
        post_order(node.right, attribute, node_list)
        node_list << (attribute ? node.data.send(attribute) : node.data)
      end
      return node_list
    end
  end
end