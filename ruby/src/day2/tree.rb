class Tree
  attr_accessor :name, :children

  def initialize(name_or_hash_def, children = [])
    if name_or_hash_def.is_a?(Hash)
      # If Hash was passed as a first argument then we need to convert it to Tree class instances.
      converted_tree = convert_tree_hash_node(name_or_hash_def)[0]
      @name = converted_tree.name
      @children = converted_tree.children
    elsif name_or_hash_def.is_a?(String)
      # If String was passed as a first argument then just assign it to this instance's name.
      @name = name_or_hash_def
      @children = children
    end
  end

  def visit_all(&block)
    visit(&block)
    children.each { |c| c.visit_all(&block) }
  end

  def visit(&block)
    block.call(self)
  end

  # This method converts Hash to Tree class instances.
  # Originally I wrote this solution in JavaScript when I first read the exercise contents.
  # You can find it here: https://gist.github.com/kraftdorian/85706acd62b36f83ed74903df56bcd10
  def convert_tree_hash_node(node)
    childNodes = node.keys.map { |k| Tree.new(k) }
    childNodes.each { |c| c.children = convert_tree_hash_node(node[c.name]) }
    childNodes
  end
end

tree = Tree.new('Tree root', [
  Tree.new('Nested item at level 1', [
    Tree.new('Nested item at level 2')
  ])
])

hash_tree = Tree.new({ 'Hash tree root' => {
  'Nested hash item at level 1' => {
    'Nested hash item at level 2' => {}
  }
}})

tree.visit_all { |n| puts n.name }
puts

hash_tree.visit_all { |n| puts n.name }