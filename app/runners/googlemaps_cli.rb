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
    search_term = input.split(" ")[0]
    puts "Your search term was #{search_term}, I am searching..."
    url = "https://maps.googleapis.com/maps/api/place/search/json?location=-33.88471,151.218237&types=#{search_term}&radius=100&sensor=true&key=AIzaSyA2D6EI1AHQ4DuO9gG2A55WtFN38BESLb4" #in progress
    # tweet = ExampleScraper.new(url).example_method.sample
    # puts "Thank you for your patience. I found this on Twitter:"
    # puts tweet.example
  end

  def help
    puts "Type 'exit' to exit"
    puts "Input destination name, restaurant name, shopping area, or area."
  end

end

