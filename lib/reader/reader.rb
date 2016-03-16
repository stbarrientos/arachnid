module Arachnid
  module Reader

    # Our reader will be responsible for parsing text, typically html. We will focus on finding tags,
    # counting the occurances of tags, and also finding links that match the base url, or other provided params

    # Base class to be used a central interface to be inherited
    class Base
    end

    # Class responsible for finding tags and counting occurances in html
    class Tagger
    end

    # Module level function to parse html
    def parse
    end

  end
end