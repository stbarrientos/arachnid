require 'rest-client'
# require_relative 'database'

class Spider

  def initialize(url)
    @url = url
  end

  def get_html
    RestClient.get @url
  end

  # General Approach: compare every word in html to every word in tags
  # We can skip over all html elements, (anything between <>), which will make parsing much quicker
  # We dont' have to compare every character, just compare every word. We are going to split the words by spaces.
  def get_tags(html, tags)
    discovered_tags = []
    i = 0
    while i < html.length

      #If we hit a space, we are going to get the whole word (up to the next space), and compare it with the tags array
      if html[i] == " "
        x = 1
        while true

          # Once we have found the ending position of the word, we check to see if it is one of our tags
          # If it is, we add it to the discovered tags array
          if !(/[a-zA-Z]+/.match html[i + x])
            word = html[(i + 1)..(i + x - 1)].downcase
            if tags.include? word
              discovered_tags << word
              tags.delete word
              return discovered_tags if tags.empty?
            end
            i += x
            break
          end
          x += 1
        end

      # If we get to an opening html tag, we are going to skip straight to the end of the html tag
      elsif html[i] == "<"
        x = 1
        while true

          # Once we find the end of the html tag, skip to that position
          if html[i + x] == ">"
            i += x
            break
          end
          x += 1
        end

      else
        i += 1
        next
      end
    end

    discovered_tags
  end

  def get_links(html)
    hrefs = []
    i = 0
    while i < html.length
      begin
        if html[i..(i+4)] == "href="
          j = i + 6
          link = ""
          while html[j] != "\"" && html[j] != "'" && j < html.length
            link += html[j]
            j += 1
          end
          hrefs << link
          puts "Added new link"
          i = j
        else
          i += 1
        end
      rescue => e
        puts "Rescued #{e}"
      end
    end
    # hrefs
    hrefs.each { |h| get_a_tags get_html(h) }
  end
end




# main
s = Spider.new("https://en.wikipedia.org/wiki/Megadeth")
html = s.get_html
puts s.get_tags(html, ["megadeth"])




