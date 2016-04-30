require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

Given.use_natural_assertions

describe AVLTree::AVLTree do
    Given(:node) { AVLTree::Node.new(25) }

  context 'initialize a AVL Tree with a null root' do
    Then { subject.root == nil }
  end

  context 'initialize a AVL Tree with a root node' do
    Given(:subject) { AVLTree::AVLTree.new(node) }
    Then { subject.root == node }
  end

  context 'adding to AVL Tree with rebalancing' do

    context 'left rotation' do
      When(:result) { 
        subject.insert_item(25)
        subject.insert_item(50)
        subject.insert_item(100)
      }
      Then { result.data == 50 }
    end

    context 'double left rotation' do
      When(:result) {
        subject.insert_item(25)
        subject.insert_item(50)
        subject.insert_item(100)
        subject.insert_item(80)
        subject.insert_item(70)
        subject.insert_item(57)
      }
      Then { result.data == 70 }
    end

    context 'right rotation' do
      When(:result) {
        subject.insert_item(25)
        subject.insert_item(18)
        subject.insert_item(7)
      }
      Then { result.data == 18 }
    end

    context 'double right rotation' do
      When(:result) { 
        subject.insert_item(25)
        subject.insert_item(18)
        subject.insert_item(7)        
        subject.insert_item(13)        
        subject.insert_item(12)
        subject.insert_item(17)
      }
      Then { result.data == 13 }
    end

    context 'no rotation' do
      When(:result) {  
        subject.insert_item(25)      
        subject.insert_item(20)
        subject.insert_item(30)
      }
      Then { result.data == 25 }
    end
  end

  context 'removing from tree with rebalancing' do
                                                    
    When {                                          
      subject.insert_item(25)                      
      subject.insert_item(50)                      
      subject.insert_item(100)                     
      subject.insert_item(80)    #     Visulisation:
      subject.insert_item(70)    #          70
      subject.insert_item(57)    #       /       \
      subject.insert_item(72)    #     50         80
      subject.insert_item(77)    #   /   \       /   \            
      subject.insert_item(94)    #  25    57    72    100           
      subject.insert_item(63)    #   \     \     \    /
      subject.insert_item(30)    #   30    63    77  94            
    }

    context 'left rotation' do
      When(:result) { 
        subject.remove_item(25)
        subject.remove_item(30)
      }
      Then { result.left.data == 57 }
    end

    context 'right rotation' do
      When(:result) {     
        subject.insert_item(20)
        subject.remove_item(30)
        subject.remove_item(57)
        subject.remove_item(63)
      }
      Then { result.left.data == 25 }
    end

    context 'double left rotation rotation' do
      When(:result) {
        subject.remove_item(72)
        subject.remove_item(77)
      }
      Then { result.right.data == 94 }
    end

    context 'double right rotation' do
      When(:result) { 
        subject.remove_item(100)
        subject.remove_item(94)
      }
      Then { result.right.data == 77 }
    end
  end
end