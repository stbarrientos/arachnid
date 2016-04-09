require 'uri'
require 'curb'

module Arachnid
  module Fetcher

    # The focus is on speed of reading, we want to be able to perform a GET as quickly and reliably
    # as possible

    # The fetcher engine is the actual rest client responsible for grabbing the html
    module Engine

      GET_METHODS = [:get_from_web, :get_from_file]

      # Returns the html body of a GET request
      def get_from_web(url)
        Curl::Easy.perform( sanitize_url(url) ).body_str
      end

      # Returns the body of a file
      def get_from_file(path)
        file_lines = []
        File.foreach { |l| file_lines << l }
        file_lines.join
      end

      # Make sure the url passed is parseable
      def sanitize_url(url)
        URI(url).to_s
      end
    end
  end
end