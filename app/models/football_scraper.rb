
# http://sports-ak.espn.go.com/nfl/schedule
#
# Scrapes the abovementioned website for all NFL games during the
# 2013 season.
class FootballScraper < Scraper

  # scrapes the website
  # returns an array of hashes with scheduling data for all NFL games in 2013
  def scrape
    results = []
    date = ''
    skip_row = false
    page.css('table.tablehead').each do |table|
      table.css('tr').each do |row|
        # If row is a header, skip it. If the week displays stats, it already happened;
        # no need to scrape then.
        if row.text.include? 'HI'
          skip_row = true
          next
        end

        # skip the stats row after the header
        if skip_row
          skip_row = false
          next
        end

        next  if row.text.include?('Week') || row.text.include?('Bye')

        # save the date
        if row.children.text =~ /^THU, |^SAT, |^SUN, |^MON, /i
          date = row.children[0].text
          next
        end

        data = {
          :name     => row.children[0].text ,
          :time     => row.children[2].text ,
          :channel  => row.children[4].text ,
          :venue    => row.children[7].text ,
          :datetime => DateTime.parse( "#{date} #{row.children[2].text}")
        }
        results << data
      end
    end
    results
  end
end