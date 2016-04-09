require 'rspec'
require_relative '../lib/fetcher/fetcher.rb'

RSpec.describe Arachnid::Fetcher::Base do
  
  web_fetcher = Arachnid::Fetcher::Base.new("www.google.com", :get_from_web)
  file_fetcher = Arachnid::Fetcher::Base.new("dummy_file.txt", :get_from_file)

  context "with web request" do

    it "initializes with the correct method" do
      expect(web_fetcher.get_method).to eq :get_from_web
    end

    it "returns the body of the target url" do
      page_contents = Curl::Easy.perform("www.google.com").body_str
      expect(web_fetcher.get).to eq page_contents
    end

  end

  context "with file request" do

    it "initializes with the correct method" do
      expect(file_fetcher.get_method).to eq :get_from_file
    end

    it "fails if unknown get method is specified" do

    end

    it "returns the body of the target file" do
      file_contents = File.read("dummy_file")
      expect(file_fetcher.get).to eq file_contents
    end

  end  
end