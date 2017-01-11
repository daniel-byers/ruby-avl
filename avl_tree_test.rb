require 'csv'
require 'awesome_print'
require 'ruby-avl'

class Country
  attr_reader :name, :gdp_growth, :inflation, :trade_balance, :hdi_ranking, :main_trade_partners

  def initialize(**options)
    options.each { |key, value| instance_variable_set(:"@#{key}", value) }
  end

  def compare_to(country_two)
    self.name <=> country_two.name
  end
end

avl_tree = AVLTree::AVLTree.new

CSV.foreach('countries.csv', headers: :first_row) { |row| avl_tree.insert_item Country.new(name: row[0], gdp_growth: row[1], inflation: row[2], trade_balance: row[3], hdi_ranking: row[4], main_trade_partners: row[5].gsub(/(\[|\])/, '').split(';')) }

ap AVLTree::BSTreeTraversal.new.pre_order_string(avl_tree.root, :name)