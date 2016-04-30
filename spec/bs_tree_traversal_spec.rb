require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

Given.use_natural_assertions

describe BSTreeTraversal::BSTreeTraversal do
  # Given returns the last node of the AVL Tree instead of the tree object itself.
  # In production, avl_tree.root would need to be passed into the traversal methods.
  Given(:avl_tree) {
    avl_tree = AVLTree::AVLTree.new
    avl_tree.insert_item(30)    # Visulisation: 
    avl_tree.insert_item(10)    #     23
    avl_tree.insert_item(23)    #    /  \
    avl_tree.insert_item(55)    #  10   47
    avl_tree.insert_item(47)    #  /   /  \
    avl_tree.insert_item(7)     # 7   30  55
  }

  context 'AVL Tree pre order' do
    context 'as array' do
      When(:result) { subject.pre_order_array(avl_tree) }
      Then { result == [23, 10, 7, 47, 30, 55] }
    end

    context 'as string' do
      When(:result) { subject.pre_order_string(avl_tree) }
      Then { result == '23, 10, 7, 47, 30, 55' }
    end

    context 'with certain attribute' do
      When(:result) { subject.pre_order_string(avl_tree, :even) }
      Then { result = 'False, True, False, False, True, False' }
    end
  end

  context 'AVL Tree in order' do
    context 'as array' do
      When(:result) { subject.in_order_array(avl_tree) }
      Then { result == [7, 10, 23, 30, 47, 55] }
    end

    context 'as string' do
      When(:result) { subject.in_order_string(avl_tree) }
      Then { result == '7, 10, 23, 30, 47, 55' }
    end

    context 'with certain attribute' do
      When(:result) { subject.in_order_string(avl_tree, :even) }
      Then { result = 'False, True, False, True, False, False' }
    end
  end

  context 'AVL Tree post order' do
    context 'as array' do
      When(:result) { subject.post_order_array(avl_tree) }
      Then { result == [7, 10, 30, 55, 47, 23] }
    end

    context 'as string' do
      When(:result) { subject.post_order_string(avl_tree) }
      Then { result == '7, 10, 30, 55, 47, 23' }
    end

    context 'with certain attribute' do
      When(:result) { subject.post_order_string(avl_tree, :even) }
      Then { result = 'False, True, True, False, False, False' }
    end
  end
end