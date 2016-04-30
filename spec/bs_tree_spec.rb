require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

Given.use_natural_assertions

describe AVLTree::BSTree do
  Given(:node) { AVLTree::Node.new(1) }

  context 'initialize a BS Tree with a null root' do
    Then { subject.root == nil }
  end

  context 'initialize a BS Tree with a root node' do
    Given(:subject) { AVLTree::BSTree.new(node) }
    Then { subject.root == node }
  end

  context 'number of nodes in a tree' do
    When {
      subject.insert_item(1)
      subject.insert_item(2)
      subject.insert_item(3)
    }
    When(:result) { subject.number_of_nodes }
    Then { result == 3 }
  end

  context 'depth of the tree' do
    When {
      subject.insert_item(1)
      subject.insert_item(2)
      subject.insert_item(3)
    }
    When(:result) { subject.depth_of_tree }
    Then { result == 2 }
  end

  context 'adding items to the tree' do

    context 'add a single item to the tree' do
      When(:result) { subject.insert_item(1) }
      Then { result.data == 1 }
    end

    context 'add multiple items to the tree' do
      When(:result) { 
        subject.insert_item(1)
        subject.insert_item(2)
        subject.insert_item(3)
        subject.insert_item(4)
        subject.insert_item(5)
      }
      Then { result.right.data == 2 }
    end

    context 'adding duplicates should be ignored' do
      When(:result) { 
        subject.insert_item(1)
        subject.insert_item(1)        
      }
      Then { result.data == 1}
    end
  end

  context 'removing items from the tree' do
    When {                      
      subject.insert_item(3)    # Visulisation:
      subject.insert_item(2)    #       3
      subject.insert_item(1)    #     /   \
      subject.insert_item(5)    #    2     5
      subject.insert_item(4)    #   /     / \
      subject.insert_item(6)    #  1     4   6 
    }

    context 'removing a leaf node' do
      When(:result) { subject.remove_item(1) }
      Then { result.left.left == nil }
    end

    context 'removing from a node with a left leaf' do
      When(:result) { subject.remove_item(2) }
      Then { result.left.data == 1 }
    end

    context 'removing from a node with a right leaf' do
      When(:result) { subject.remove_item(6) }
      Then { result.right.right == nil }
    end

    context 'removing from a node with two leaves' do
      When(:result) { subject.remove_item(5) }
      Then { result.right.right == nil }
      And { result.right.left.data == 4 }
    end
  end
end