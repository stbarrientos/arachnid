require_relative "engine.rb"

module Arachnid
  module Fetcher
    # This module is responsible for grabbing the html from a web page

    # The focus is on speed of reading, we want to be able to perform a GET as quickly and reliably
    # as possible

    class Base

      # All functionality that we want people to be able to port into project will go here, nothing that we want
      # to save for other classes / modules to get from the Digester module

      include Engine

      # There is no point in allowing the user to set the body, so we won't
      # Allow the user to read the url of the instance, setter defined below
    	attr_reader :body, :url

      # Initialized as so:
      # Arachnid::Fetcher::Base.new("http://www.google.com")
      # Which will return the hhtml body from that url
      def initialize(url)
      	@url = url
      	@body = get(@url)
      	@body
      end

      # When setting a new URL on an instance, immediately fetch a new body and update
      # the instance variables
      def url=(new_url)
        @url = new_url
        @body = get(@url)
        @body
      end

    end

  end
end