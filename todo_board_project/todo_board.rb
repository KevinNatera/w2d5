require 'byebug'
require_relative './list.rb'
require_relative './item.rb'

class TodoBoard
    attr_reader :list 
    def initialize(label)
        @list = List.new(label)
    end


    def get_command
        puts "Enter a command:"
      command, *args = gets.chomp.split(" ")

      case command  
      when "mktodo"
        @list.add_item(args[0],args[1],args[2])
        true
      when "up"
        @list.up(args[0].to_i,args[1].to_i)
        true
      when "down"
        @list.down(args[0].to_i,args[1].to_i)
        true
      when "swap"
        @list.swap(args[0].to_i,args[1].to_i)
        true
      when "sort"
        @list.sort_by_date!
        true
      when "priority"
        @list.print_priority
        true
      when "print"
        if args[0] == nil
            @list.print
            true 
        else
            @list.print_full_item(args[0].to_i)
            true
        end
      when "quit"
        false
      else 
        puts "Error, invalid command."
      end
    end
    

    def run 
        if self.get_command != false
            self.run
        else
            "Error, invalid input."
        end
    end
end

b = TodoBoard.new("todoboii")

b.list.add_item("ONE","2042-12-03","grjin")
b.list.add_item("TWO4fwoo","1113-07-01","44r2in")
b.list.add_item("THREE7hjf","1113-07-02","fswewew")
b.list.add_item("FOUR7hjf","8883-07-06","fswewew")
b.list.add_item("FIVE7hjf","1893-09-02","fswewew")

b.list.print

b.run

