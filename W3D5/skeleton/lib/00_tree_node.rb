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

    def add_child(node)
        node.parent = self unless self.children.include?(node)
    end

    def remove_child(node)
        raise "Not a child" unless self.children.include?(node)
        node.parent = nil
    end

    def dfs(target)
        if self.value == target
        self.children.each do |node|
            current_node = dfs(node)
        end
    end

    def bfs

    end
end