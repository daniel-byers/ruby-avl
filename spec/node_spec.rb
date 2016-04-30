require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

Given.use_natural_assertions

describe Node::Node do
  context 'should initialize a new node' do
    Given(:node) { Node::Node.new('test string') }
    Then  { node.data == 'test string' }
    And   { node.left == nil}
    And   { node.right == nil}
  end
end