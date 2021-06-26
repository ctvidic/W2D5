class Item
    def self.valid_date?(date_string)
        splitString = date_string.split("-")
        numbers = (0..9).to_a
        if splitString[0].length != 4
            return false
        else 
            splitString[0].each_char do |char|
                if !numbers.include?(char.to_i)
                    return false
                end
            end
        end
        if splitString[1].length != 2 || splitString[1].to_i > 12 || splitString[1].to_i < 1
            return false
        else 
            splitString[1].each_char do |char|
                if !numbers.include?(char.to_i)
                    return false
                end
            end
        end

        if splitString[2].length != 2 || splitString[2].to_i > 31 || splitString[2].to_i < 1
            return false
        else 
            splitString[2].each_char do |char|
                if !numbers.include?(char.to_i)
                    return false
                end
            end
        end

        return true
    end

    def initialize(title, deadline, description)
        @done = false
        @title = title
        if !Item.valid_date?(deadline)
            raise 'Not a valid date'
        end
        @deadline = deadline
        @description = description
    end

    def title
        @title
    end

    def done
        @done
    end
    def toggle 
        if @done == false
            @done = true
        else
            @done = false
        end
        @done
    end

    

    def title=(new_title)
        @title = new_title
    end

    def deadline
        @deadline
    end

    def deadline=(new_deadline)
        if !Item.valid_date?(new_deadline)
            raise 'Not a valid deadline'
        else
            @deadline = new_deadline
        end
    end

    def description
        @description 
    end

    def description=(new_description)
        @description = new_description
    end
end