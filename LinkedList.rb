class Node
    attr_accessor :value, :next_node

    def initialize(value = nil, next_node = nil)
        @value =  value
        @next_node = next_node
    end

end

class LinkedList
    attr_accessor :head, :tail

    def initialize
        @head = nil
        @tail = nil
    end

    def push_first_value(value)
        node = Node.new(value)
        @head = node
        @tail = node
    end
        
    def append(value)
        node = Node.new(value)
        if @head.nil?
            push_first_value(value)
        else
            @tail.next_node = node
            @tail = node
        end
    end

    def prepend(value)
        if @head.nil?
            push_first_value(value)
        else
            pointer = @head
            @head = Node.new(value, pointer)
        end
    end

    def size
        amount = 0
        node = @head
        until node.nil?
            amount += 1
            node = node.next_node
        end
        amount
    end

    def head
        @head.value
    end

    def tail
        @tail.value
    end

    def at(index)
        if (/^\d$/ === index.to_s) && (index < self.size)
            current_index = 0
            node = @head
            until current_index == index
                current_index += 1
                node = node.next_node
            end
            node.value
        else
            return "Incorrect index!"
        end
    end

    def pop
        current_index = 1
        node = @head
        until current_index == self.size - 1 # (self.size - 1) == index of penultimate element
            current_index += 1
            node = node.next_node
        end
        @tail = node
        @tail.next_node = nil
    end

    def contains?(value)
        node = @head
        until node.nil?
            return true if node.value == value
            node = node.next_node
        end
        false
    end

    def find(value)
        node = @head
        index = 0
        until node.nil?
            return index if node.value == value
            index += 1
            node = node.next_node
        end
        false
    end

    def to_s
        node = @head
        string = ""
        until node.nil?
            string += "( #{node.value} ) -> "
            node = node.next_node
        end
        string + "nil"
    end

    def insert_at(value, index)
        if (/^\d$/ === index.to_s) && (index < self.size)
            node = @head
            current_index = 0
            until current_index == index
                current_index += 1
                node = node.next_node
            end
            
            if node == @head
                prepend(value)
            elsif node == @tail
                node.next_node = Node.new(node.value)
                @tail = node.next_node # without this string .append dont work correctly after using .insert_at on tail
                node.value = value
            else
                node.next_node = Node.new(node.value, node.next_node)
                node.value = value
            end
        else
            return puts "Incorrect index!"
        end
    end

end

# =================
#       TESTS
# =================
list = LinkedList.new
list.to_s # => nil

list.append("a")
list.append(2)
list.append(3)
list.prepend(10)

puts list.size # => 4
puts list.head # => 10
puts list.tail # => 3
puts list.at(1) # => "a"
puts list.to_s # => ( 10 ) -> ( a ) -> ( 2 ) -> ( 3 ) -> nil
puts list.contains?(3) # => true
puts list.find("a") # => 1

list.pop
puts list.to_s # => ( 10 ) -> ( a ) -> ( 2 ) -> nil
puts list.contains?(3) # => false
puts list.find(3) # => false

list.pop
puts list.to_s # => ( 10 ) -> ( a ) -> nil

puts list.find(10) # => 0
puts list.find(1) # => false

list.insert_at(23, 1)
puts list.to_s # => ( 10 ) -> ( 23 ) -> ( a ) -> nil
list.insert_at(69, 2)
puts list.to_s # => ( 10 ) -> ( 23 ) -> ( 69 ) -> ( a ) -> nil
list.insert_at("b", 0)
puts list.to_s # => ( b ) -> ( 10 ) -> ( 23 ) -> ( 69 ) -> ( a ) -> nil
list.append(16)
list.prepend("c")
puts list.to_s # => ( c ) -> ( b ) -> ( 10 ) -> ( 23 ) -> ( 69 ) -> ( a ) -> ( 16 ) -> nil