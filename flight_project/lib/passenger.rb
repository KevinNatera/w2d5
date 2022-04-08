class Passenger
    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = []
    end


    def has_flight?(flightNum)
          @flight_numbers.include?(flightNum.upcase)
    end


    def add_flight(flightNum)
        if !has_flight?(flightNum)
            @flight_numbers << flightNum.upcase
        end
    end
end