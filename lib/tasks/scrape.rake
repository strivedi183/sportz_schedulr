namespace :scrape do
  task  :all      => :football

  # Each NFL game on ESPN is an 'Event', each home stadium a 'Venue'
  task  :football => :environment do
    puts "Scraping ESPN for football schedule and venue data..."
    fb     = FootballScraper.new 'http://sports-ak.espn.go.com/nfl/schedule'
    events = fb.scrape
    events.each do |e|
      home = e[:name].split(' at ')[-1].strip
      begin
        result = Geocoder.search("#{e[:venue]}, #{home}").first
        result = Geocoder.search(e[:venue]).first if result.nil?
      rescue
        puts "Error. Retrying..."
        puts result
        retry
      end
      unless result.nil?
        lat = result.data['geometry']['location']['lat']
        lng = result.data['geometry']['location']['lng']
      end
      Venue.find_or_create_by_name :name => e[:venue], :lat => lat, :lng => lng
      Event.find_or_create_by_name :name => e[:name], :date => e[:datetime]
    end
  end
end