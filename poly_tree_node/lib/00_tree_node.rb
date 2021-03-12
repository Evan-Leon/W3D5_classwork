require "byebug"
class PolyTreeNode
    attr_reader :parent, :children, :value
    attr_writer :children
    
    def initialize(value = nil)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        
        if !parent.nil?
            parent.children.delete(self)
        end
        if !parent_node.nil?
            @parent = parent_node
            if !parent_node.children.include?(self) 
                parent_node.children << self 
            end
        else  
            @parent = nil
        end
    end

    def add_child(child_node)
         child_node.parent = self
    end

    def remove_child(child_node)
        if children.include?(child_node)
            child_node.parent = nil
        else  
            raise "node is not a child!"
        end
    end

    def dfs(target_value)
        if target_value == self.value
            return value
        else
            self.children.each do |child|
               rec_call = child.dfs(target_value)
               if !rec_call.nil? && child.value == target_value
                    return child.value
               elsif !child.children.empty?
                    child.children.dfs(target_value)
               end
            end
            return nil
        end

    end
end