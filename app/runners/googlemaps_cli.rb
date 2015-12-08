require 'openssl'
require 'open-uri'
require 'geocoder'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class GooglemapsCLI

  def call
    system 'clear'
    puts "Please enter a destination. Ex: restaurant name or clothing store"
    run
  end
    
  def get_user_input
    gets.chomp.strip
  end

  def run
    print "New search keyword or help/exit: "
    input = get_user_input
    if input == "help"
      help
    elsif input == "exit"
      exit
    else
      search(input)
    end
    run
  end

  def search(input)
    remote_ip = open('http://whatismyip.akamai.com').read
    current_location_info = Geocoder.search(remote_ip)
    lat = current_location_info[0].latitude
    lng = current_location_info[0].longitude
  system 'clear'
    search_term = input.gsub(" ",'+')
    

    puts "Your search term was #{search_term}, I am searching..."
    #If needed, subsitute spaces for + signs, idk how url's work
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lng}&radius=1600&keyword=#{search_term}&key=<InsertKey>" #in progress
    # binding.pry
    spot_address = GoogleMapsApi.new(url)
    new_stuff = GoogleMapsModel.new(spot_address.location_data)
    addresses = new_stuff.return_location 
    
    puts "Here are your top 7 results:"
    puts ""
    addresses.each do |data|
      puts data
      
    end
      new_stuff.pick_a_num
    #call pick a num method. and call open on this method.
  end

  def help
    puts "Type 'exit' to exit"
    puts "Input place name with location. For ex: macys in new york"
  end



end

