require_relative "item.rb"

class List
    def initialize(label)
        @label = label
        @items = []
    end

    def label
        @label
    end

    def label=(new_label)
        @label = new_label
    end

    def add_item(title, deadline, description = "")
        if !Item.valid_date?(deadline)
            return false
        else
            @items << Item.new(title, deadline, description)
            return true
        end
    end

    def size
        @items.length
    end

    def toggle_item(index)
        puts "Toggling at: " + index.to_s
        @items[index].toggle
        
    end

    def valid_index?(index)
        if index >= 0 && index < @items.size
            return true
        else
            return false
        end
    end

    def swap(index_1, index_2)
        if self.valid_index?(index_1) && self.valid_index?(index_2)
            hold = @items[index_1]
            @items[index_1] = @items[index_2]
            @items[index_2] = hold
            return true
        else
            return false
        end
    end

    def [](index)
        if !self.valid_index?(index)
            return nil
        else
            return @items[index]
        end
    end

    def priority
        return @items[0]
    end

    def print
        puts "-------------------------------------------------------"
        puts "        " + self.label 
        puts "------------------------------------------------------"
        puts "Index" + " | " + " Item " + " | " + "Deadline" + " | " + "Done (T/F"
        puts "------------------------------------------"
        @items.each_with_index do |item, i|
            puts i.to_s + "    | "+ item.title+ "  |  "+ item.deadline + " | "+ item.done.to_s
        end
        puts "------------------------------------------"
    end

    def print_full_item(index)
        if self.valid_index?(index)
            puts "------------------------------------------"
            puts @items[index].title + "            " + @items[index].deadline
            puts @items[index].description + "      " + @items[index].done.to_s 
            puts "------------------------------------------"
        end
    end

    def print_priority
        self.print_full_item(0)
    end

    def remove_item(index)
        @items.delete_at(index)
    end

    def purge
        i = 0
        while i < @items.length - 1
            if @items[i].done
                @items.delete_at(i)
            else
                i+=1
            end
        end
    end

    def up(index, amount=1)
        if self.valid_index?(index)
            item = @items[index]
            val = index - amount
            if index - amount < 0
                val = 0
            end
            @items.delete_at(index)
            @items.insert(val, item)
            return true
        else
            return false
        end
    end

    def down(index, amount=1)
        if self.valid_index?(index)
            item = @items[index]
            val = index + amount
            if index + amount > @items.length - 1
                val = @items.length - 1
            end
            @items.delete_at(index)
            @items.insert(val, item)
            return true
        else
            return false
        end
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline}
    end
end
