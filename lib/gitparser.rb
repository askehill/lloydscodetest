require "gitparser/version"
require 'nokogiri'
require 'date'

require 'chronic'
module Gitparser

  class Parse

    def parse_git_html(filename, age_in_days)

      git_html = Nokogiri::HTML(File.read(filename))
      old_repos = Array.new()
      git_html.xpath('//*[contains(@class,\'age\')]').each do |ra|
        modified = Chronic.parse(ra.text)
        now = Time.now
        max_age = (now - (age_in_days * 60 * 60 * 24))
        if modified < max_age
            old_repos <<  {"#{ra.xpath('../../td[@class=\'left\']//a').text}" => ra.text}
        end
      end
      old_repos
    end
  end
end
