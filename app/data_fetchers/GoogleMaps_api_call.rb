class GoogleMapsApi

  attr_reader :url, :location_data

  # example url:
  # "http://charts.spotify.com/api/tracks/most_streamed/us/weekly/latest"
  
  def initialize(url)
    @url = url
    @location_data = JSON.load(open(url))
    binding.pry
  end


  # def find_stores
  #   stores = []
  #   all_stores = @location_data["location"]
  #   all_stores.each do |store|
  #     song_url = song["track_url"]
  #     songs << ExampleModel.new(song_url)
  #   end
  #   songs
  # end

end
