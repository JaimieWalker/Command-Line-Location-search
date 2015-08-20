class GoogleMapsModel

  attr_reader :location_data
  
  def initialize(location_data)
    @location_data = location_data
  end

  def return_location
    @google_url = []
    @address = []
    count = 0
    @location_data["results"].each_with_index do |data, index|
      data.each do |key, value|
        if key == "formatted_address"
          count += 1
          lat = data["geometry"]["location"]["lat"]
          lng = data["geometry"]["location"]["lng"]
          @google_url << "https://www.google.com/maps/search/#{lat},#{lng}"
          @address << "#{index + 1}. #{value}"
        end

        if count == 4
          # binding.pry
         return @address
        end
      end
    end
  end

  def pick_a_num
    puts "What location would you like to view?"
    index = gets.chomp
  

    #Pick a num returns latitude and longitude in a format that can just be added to the url 
    #Should probably be changed to maps_url, so we can just call open on this method
    case index 
      when "1"
        `open #{@google_url[0]}`
      when "2"
        `open #{@google_url[1]}`
      when "3"
        `open #{@google_url[2]}`
      when "4"
        `open #{@google_url[3]}`
      else
        puts "Invalid number, search again"
    end
  end

end
