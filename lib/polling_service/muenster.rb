require 'scraperwiki'
require 'nokogiri'

module PollingService
  class Muenster
    URL = "http://geo.stadt-muenster.de/gdm/kommunalwahl/dbi.pl"
    def initialize()
      html = ScraperWiki.scrape(URL)
      doc = Nokogiri::HTML(html)
      @form = doc.search("#content_mitte form").first
    end
    def fill_form(street, nr)
      params = {}
      @form.search("input").each do |input|
        params[input["name"]] = input["value"]
      end
      params["STRASSE"] = street
      params["HSNR"] = nr
      params["dbtable"] = "WAHLK14"
      params["modus"] = "i_suche2"
      action ||= @form["action"]
      ScraperWiki.scrape(action,params)
    end
    def find(street, nr)
      @wahl ||= Nokogiri::HTML(fill_form(street, nr)).search("#content_mitte div p")
    end

    def wahlbezirk
      number_from_text(@wahl.first.children[4].text.strip)
    end

    def stimmbezirk
      number_from_text(@wahl.first.children[12].text.strip)
    end

    def number_from_text(text)
      text.gsub(/\D*/,"").strip
    end
  end
end
