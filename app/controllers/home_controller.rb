require 'nokogiri'
require 'open-uri'

class HomeController < ApplicationController
  def index
    @ranking = [ ]
    doc = Nokogiri::HTML(open("https://www.naver.com").read)
    doc.css('.ah_roll .ah_roll_area ul li').each do |element|
      @ranking << {
        rank: element.css('span.ah_r').text,
        keywork: element.css('span.ah_k').text
      }
    end
  end
end
