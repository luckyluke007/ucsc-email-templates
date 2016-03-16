require 'premailer'

module Jekyll
  class Site

    #declare plugin properties 
    #safe true
    #priority :low
    # create an alias for the overriden site::write method
    alias orig_write write

    # we override the site::write method
    def write

      # first call the overriden write method,
      # in order to be sure to find generated css
      orig_write

      # layout name we are looking for in pages/post front matter
      # this can come from site config
      @layout   = 'default'

      # this the css that will be inlined
      # this can come from site config
      @css_path = 'assets/main.css'

      # look for generated css file content
      @cssPages = pages.select{ |page|
        page.destination(dest).include? @css_path
      }

      # look again in pages and posts
      # to generate inlinedcontent with premailer
      inlinedcontent = [posts, pages].flatten.select{ |page_or_post|
        page_or_post.data['layout'] == @layout
      }

      inlinedcontent.each do |inlinedcontent|

        inlinedcontent.output = Premailer.new(
            inlinedcontent.output,
            {
                # declare that we pass page html as a string not an url
                :with_html_string => true,
                # also pass css content as a string
                :css_string       => @cssPages.join,
            }
        ).to_inline_css;

        # rewrite the content with inlined css
        inlinedcontent.write(destination)

      end
    end
  end
end