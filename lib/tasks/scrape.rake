namespace :scrape do
  task  :all      => :football

  task  :football => :environment do
    fb     = FootballScraper.new 'http://sports-ak.espn.go.com/nfl/schedule'
    events = fb.scrape
    events.each do |e|
      home = e[:name].split(' at ')[-1].strip
      begin
        result = Geocoder.search("#{e[:venue]}, #{home}").first
        result = Geocoder.search(e[:venue]).first if result.nil?
      rescue
        retry
      end
      unless result.nil?
        lat = result.data['geometry']['location']['lat']
        lng = result.data['geometry']['location']['lng']
      end
      venue = Venue.find_or_create_by_name :name => e[:venue], :lat => lat, :lng => lng
      event = Event.find_or_create_by_name :name => e[:name], :date => e[:datetime]
    end
  end
end