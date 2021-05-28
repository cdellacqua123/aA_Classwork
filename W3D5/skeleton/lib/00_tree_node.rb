class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        if self.parent
            self.parent.children.delete(self)
        end
        @parent = node
        if !self.parent.nil?
            node.children << self unless node.children.include?(self)
        end
    end

end