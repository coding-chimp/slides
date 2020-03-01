class HomeController < ApplicationController
  def index
    slides_markdown = <<-MARKDOWN
      # Slide 1

      * foo
      * bar

      ```ruby
        def foo
          puts "bar"
        end
      ```

      ---

      # Slide 2

      ---

      # Slide 3
    MARKDOWN
    slides = slides_markdown.split("---").map { |slide| Markd.to_html(slide) }

    render("index.slang")
  end
end
