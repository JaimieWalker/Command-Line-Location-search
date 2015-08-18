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
    #grab the ip and convert it to a location 
    search_term = input.gsub(" ",'+')

    puts "Your search term was #{search_term}, I am searching..."
    #If needed, subsitute spaces for + signs, idk how url's work
    url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{search_term}&key=AIzaSyA2D6EI1AHQ4DuO9gG2A55WtFN38BESLb4" #in progress
    GoogleMapsApi.new(url)
    
    #We instantiate the GoogleMapsApi class and stuff here.



    # tweet = ExampleScraper.new(url).example_method.sample
    # puts "Thank you for your patience. I found this on Twitter:"
    # puts tweet.example
  end

  def help
    puts "Type 'exit' to exit"
    puts "Input destination name, restaurant name, shopping area, or area."
  end

end

