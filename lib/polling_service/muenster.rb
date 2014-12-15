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
      doc = Nokogiri::HTML(fill_form(street, nr))
      wahl = doc.search("#content_mitte div p")
      wahlbezirk_text = wahl.first.children[4].text.strip
      bezirk = wahlbezirk_text.split(" ")
      bezirk[0].gsub(/\D*/,"").strip
    end
  end
end
