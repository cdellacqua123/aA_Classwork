class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        return nil if node == nil
        @parent = node.parent
        node.children.each do |ele|
            @children << ele
        end
    end

end