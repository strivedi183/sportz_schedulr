class Scraper
  attr_accessor :page

  def initialize(url)
    @page = _prepare_page url
  end

  private
  def _prepare_page(url)
    i = 0
    begin
      Nokogiri::HTML( HTTParty.get(url) )
    rescue
      if i < 5
        i += 1
        retry
      else
        "Error: Could not connect to site"
      end
    end
  end
end