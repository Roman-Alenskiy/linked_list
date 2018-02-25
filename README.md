# Linked list
This is implementation of Linked list on Ruby


# Notes:

### Clasess:

+ LinkedList class, which will represent the full list.
+ Node class, containing a @value and @next_node attrs.


### Methods:

+ #append adds a new node to the end of the list
+ #prepend adds a new node to the start of the list
+ #size returns the total number of nodes in the list
+ #head returns the first node in the list
+ #tail returns the last node in the list
+ #at returns the node at the given index
+ #pop removes the last element from the list
+ #contains? returns true if the passed in value is in the list and otherwise returns false.
+ #find returns the index of the node containing data, or nil if not found.
+ #to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( data ) -> ( data ) -> ( data ) -> nil
+ #insert_at that inserts the node at the given index
+ #remove_at that removes the node at the given index

### Auxiliary methods:

+ #push_first_value for #append, #prepend
+ #find_appropriate_node for #at, #insert_at, #remove_at
