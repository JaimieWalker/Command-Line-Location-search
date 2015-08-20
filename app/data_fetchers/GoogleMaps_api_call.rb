class GoogleMapsApi

  attr_reader :url, :location_data
  # example url:
  # "http://charts.spotify.com/api/tracks/most_streamed/us/weekly/latest"
  
  def initialize(url)
    @url = url
    @location_data = JSON.load(open(url,{OpenSSL::SSL::VERIFY_PEER => OpenSSL::SSL::VERIFY_NONE}))
    # binding.pry
  end

end
