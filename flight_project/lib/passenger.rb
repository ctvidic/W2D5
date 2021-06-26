class Passenger
    # attr_writer :name
    # attr_accessor :flight_numbers
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def name
        @name
    end

    def has_flight?(string)
        if @flight_numbers.include?(string.upcase)
            return true
        else 
            return false
        end
    end

    def add_flight(string)
        if !self.has_flight?(string)
            @flight_numbers << string.upcase
        end
    end



end