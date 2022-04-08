require_relative './item.rb'

class List
    attr_reader :label

    def initialize(label)
        @label = label
        @items = []
    end


    def label=(new_label)   
        @label = new_label
    end


    def add_item(title,deadline,description)

        if Item.valid_date?(deadline)
            item = Item.new(title,deadline,description)
            @items << item
            true
        else
            false
        end
    end


    def size
        @items.length
    end


    def valid_index?(index)
         if index < 0
            false
         elsif index > @items.length - 1
            false
         else
            true
         end
    end


    def swap(index_1,index_2)

        if self.valid_index?(index_1) && self.valid_index?(index_2)
            @items[index_1],@items[index_2] = @items[index_2],@items[index_1]
            true
        else
            false
        end
    end


    def [](index)

        if valid_index?(index)
            @items[index]
        else
            nil
        end
    end


    def priority
        @items[0]
    end


    def print
       puts "-".ljust(50,"-")
       puts " ".ljust(22) + @label.upcase
       puts "-".ljust(50,"-")
       puts "   Index" + "   |" + " ".ljust(10) +   "Item" + " ".ljust(10) + "|   Deadline"
       puts "-".ljust(50,"-")
       @items.each_with_index do |item,i|
        puts "    #{i}" + "".ljust(3) + "   |  #{item.title.ljust(22)}" + "|   #{item.deadline}"
        puts "-".ljust(50,"-")
       end
       true
    end

    def print_full_item(index)
        if self.valid_index?(index)
            item = @items[index]
            puts "-".ljust(50,"-")
            puts item.title.ljust(35) + item.deadline
            puts item.description
            puts "-".ljust(50,"-")
        else 
            false
        end
    end


    def print_priority
        self.print_full_item(0)
    end


    def up(index,*amount)
        i = amount[0] 

        if !self.valid_index?(index)
            false 
        end

        if amount == nil
            i = 1
        end
        
       
        (0...i).each do |idx|
            trueIdx = index - idx
            if self.valid_index?(trueIdx) && self.valid_index?(trueIdx - 1)
                @items[trueIdx],@items[trueIdx - 1] = @items[trueIdx - 1],@items[trueIdx]
            end
        end
        true
    end

    def down(index,*amount)
        i = amount[0] 

        if !self.valid_index?(index)
            false 
        end

        if amount == nil
            i = 1
        end
        
       
        (0...i).each do |idx|
            trueIdx = index + idx
            if self.valid_index?(trueIdx) && self.valid_index?(trueIdx + 1)
                @items[trueIdx],@items[trueIdx + 1] = @items[trueIdx + 1],@items[trueIdx]
            end
        end
        true
    end


    def sort_by_date!

        @items.sort_by! do |item|
            date = item.deadline.split("-")
            [date[0], date[1],date[2]]
        end 
    end
end


