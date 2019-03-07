require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = []
    page = Nokogiri::HTML(open(index_url))

    section = page.css("div.student-card")

    section.collect do |items|
      student_hash = {:name => items.css("h4.student-name").text,
                      :location => items.css("p.student-location").text,
                      :profile_url => items.css("a").attribute("href").value}
      students << student_hash
    end
    students
  end

  def self.scrape_profile_page(profile_url)

  end

end
