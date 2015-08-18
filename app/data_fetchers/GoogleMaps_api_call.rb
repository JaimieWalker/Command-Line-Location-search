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
    address = []
    count = 0
    @location_data["results"].each do |data|
      data.each do |key, value|
        if key == "formatted_address"
          count += 1
          address << value
        end

        if count == 4
          return address
        end
      end
    end
  end
end
