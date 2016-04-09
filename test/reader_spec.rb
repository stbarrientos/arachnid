require 'rspec'
require_relative '../lib/reader/reader.rb'

RSpec.describe Arachnid::Reader::Base do

  context "with plain text" do
    it "parses plain text" do
    end

    it "raises error on blank text" do
    end
  end

  context "with html" do
    it "parses valid html" do
    end

    it "raises error on invalid html" do
    end
  end
end