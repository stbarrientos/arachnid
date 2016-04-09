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
    	attr_reader :body, :path, :get_method
      attr_writer :path

      # Initialized as so:
      # Arachnid::Fetcher::Base.new("http://www.google.com")
      # Which will return the hhtml body from that url
      def initialize(path, get_method = :get_from_web)
        raise "Unknown Get Method Specified: #{get_method}" unless GET_METHODS.include? get_method
      	@path = path
        @get_method = get_method
      end

      def get
        @body = send(@method, @path)
      end

    end

  end
end