class PolyTreeNode
    attr_reader :parent, :children, :value
    attr_writer :children
    
    def initialize(value = nil)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        # parent_node ||= raise "not valid parent"
        if !parent.nil?
            parent.children.delete(self)
        end

        @parent = parent_node
        if !parent_node.children.include?(self)
            parent_node.children << self 
        end
    end

    def children
        #change
    end

end