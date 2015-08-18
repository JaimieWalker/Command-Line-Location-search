class GoogleMapsApi

  attr_reader :url, :location_data

  # example url:
  # "http://charts.spotify.com/api/tracks/most_streamed/us/weekly/latest"
  
  def initialize(url)
    @url = url
    @location_data = JSON.load(open(url,{OpenSSL::SSL::VERIFY_PEER => OpenSSL::SSL::VERIFY_NONE}))
    # binding.pry
  end


  def return_location
    @address = []
    @location_arr = []
    count = 0
    @location_data["results"].each_with_index do |data, index|
      data.each do |key, value|
        if key == "formatted_address"
          count += 1
          @location_arr << data["geometry"]["location"]
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
    index.gets.chomp

    #Pick a num returns latitude and longitude in a format that can just be added to the url 
    #Should probably be changed to maps_url, so we can just call open on this method
    case index 
    when 1
      "https://www.google.com/maps/search/#{@location_arr[0]}"
    when 2
      "https://www.google.com/maps/search/#{@location_arr[1]}"
    when 3
      "https://www.google.com/maps/search/#{@location_arr[2}"
    when 4
      "https://www.google.com/maps/search/#{@location_arr[3]}"
    end
  end
end
