module Arachnid
  module Reader

    def extract_link_from_substring(substring, link_definitions)
      link_definitions.each do |link_definition|

        # If we are able to extract a substring between our two link definitions,
        # return that substring
        # Otherwise continue
        if link = /#{link_definition[0]}(.*?)#{link_definition[1]}/.match substring

          # link will equal a matchdata object, so we use link[1]
          # to access the actual match results
          return link[1]
        else
          next
        end
      end

      # If we get through ever link definition, our substring was not a link,
      # so we return false
      false
    end

    # Our reader is responsible for parsing text, typically html. We will focus on finding tags,
    # counting the occurances of tags, and also finding links that match the base url, or other provided params

    # Module responsible for finding tags and counting occurances in html
    module Tagger

    end

    class Node
    end

    # Base class to be used a central interface to be inherited
    class Base

      include ::Reader

      LINK_MARKERS = ["href=\""]

      attr_reader :links

      def initialize(link_markers = [])

        # We will store all links found in the text
        @links = []

        # Link markers are used to determine what is considered a "link"
        # in html, this would be defined as ["href=\"", "\""]
        @link_markers = link_markers
      end

      def link_definitions
        # If the user has defined their own markers, use those
        # Otherwise, use the constant by default
        @link_markers.empty? LINK_MARKERS : @link_markers
      end

      # Find the closing carat. Returns either a new Node object or false
      def find_closing_carat

      end

      # Method to parse html
      def find_links(html)
        i = 0
        while i < html.length

          # If we get to an opening carrat, we want to return a Node object for quicker
          # parsing
          # We also want to keep track of the indentation level
          if html[i] == "<"

            # We will skip ahead to the closing carat, and then analyze that node object
            find_closing_carat

          else
            next
          end
        end
      end
    end

    # Method to parse plain text, or to parse html that would not be parsed
    # correctly by our html specific parser
    def parse_text(text)

    end

  end
end