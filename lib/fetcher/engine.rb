require 'uri'
require 'curb'

module Arachnid
  module Fetcher

    # The focus is on speed of reading, we want to be able to perform a GET as quickly and reliably
    # as possible

    # The fetcher engine is the actual rest client responsible for grabbing the html
    module Engine

      # Returns the html body of a GET request
      def get(url)
        Curl::Easy.perform( sanitize_url(url) ).body_str
      end

      # Make sure the url passed is parseable
      def sanitize_url(url)
        URI(url).to_s
      end
    end
  end
end