require 'openssl'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class GooglemapsCLI

  def call
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
    search_term = input.gsub(" ",'+')

    puts "Your search term was #{search_term}, I am searching..."
    #If needed, subsitute spaces for + signs, idk how url's work
    url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{search_term}&key=AIzaSyA2D6EI1AHQ4DuO9gG2A55WtFN38BESLb4" #in progress
    spot_address = GoogleMapsApi.new(url)
    addresses = spot_address.return_location 
    
    puts "Here are your top 4 results:"
    addresses.each do |data|
      puts data
    end

    #call pick a num method. and call open on this method.
  end

  def help
    puts "Type 'exit' to exit"
    puts "Input place name with location. For ex: macys in new york"
  end

end

