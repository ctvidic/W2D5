require_relative "list.rb"


class TodoBoard
    def initialize(label)
        # @list = List.new(label)
        @list = {}
    end

    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')
        case cmd
        when 'mklist'
             @list[*args] = List.new(*args)
        when 'ls'
            @list.each_key do |key|
                puts key.to_s
            end
        when 'showall'
            @list.each do |k,v|
                v.print
            end 
        when 'mktodo'
            x = *args
            b = x[1..-1]
            print b
            @list[x[0]].add_item(*b)
        when 'up'
            x = *args
            if x.length == 2
                @list[x[0]].up(x[1].to_i)
            else
                @list[x[0]].up(x[1].to_i,x[2].to_i)
            end
        when 'down'
            x = *args
            if x.length == 2
                @list[x[0]].down(x[1].to_i)
            else
                @list[x[0]].down(x[1].to_i,x[2].to_i)
            end
        when 'swap'
            x = *args
            @list[x[0]].swap(x[1].to_i,x[2].to_i)
        when 'sort'
            @list[*args].sort_by_date!
        when 'priority'
            @list[*args].print_priority
        when 'quit'
            return false
        when 'print'
            x = *args
            if x.length == 1
                @list[*args].print
            else
                @list[x[0]].print_full_item(x[1].to_i)
            end
        when 'toggle'
            x = *args
            @list[x[0]].toggle_item(x[1].to_i)
        when  'rm'
            x = *args
            @list[x[0]].remove_item(x[1].to_i)
        when 'purge'
            x = *args
            @list[x[0]].purge
        when 'sort'
            x = *args
            @list[x[0]].sort
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run
        while self.get_command
            puts "Command successful"
        end
    end

end