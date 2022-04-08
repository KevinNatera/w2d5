class Item
    attr_reader :title, :deadline, :description

    def initialize(title,deadline,description)
        @title = title
        @description = description
        if Item.valid_date?(deadline)
            @deadline = deadline
            true
        else
            raise "Error! Invalid date."
        end
    end


    def title=(new_title)
        @title = new_title
    end
    

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise "Error! Invalid date."
        end
    end


    def description=(new_description)
        @description = new_description
    end


    def self.valid_date?(date_string)
        arr = date_string.split("-")

        if arr.length != 3 || arr[0].length != 4 || arr[1].length != 2 || arr[2].length != 2
            return false
        end

        if arr[1].to_i > 12 || arr[1].to_i < 1 || arr[2].to_i > 31 || arr[2].to_i < 1
            return false
        end

        if arr[1].to_i == 2 && arr[2].to_i > 28
            return false
        end

        true
    end


end



