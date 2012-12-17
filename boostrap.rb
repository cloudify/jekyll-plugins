module Bootstrap
  module Filters
    def bslead(input)
      "<span class=\"lead\">#{input}</span>"
    end

    def bswell(input)
      "<div class=\"well\">#{input}</div>"
    end

    def bspagehead(input)
      "<div class=\"page-header\">#{input}</div>"
    end
  end
end

Liquid::Template.register_filter(Bootstrap::Filters)

module Bootstrap
  class Table < Liquid::Block
    def initialize(tag_name, markup, tokens)
      super
      @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :tables => true)
      @css_classes = markup.split(/\s+/).map { |s| "table-#{s}" }.push('table').join(' ')
    end

    def render(context)
      content = @markdown.render(super)
      content.sub(/\<table/, "<table class=\"#{@css_classes}\"")
    end
  end
end

Liquid::Template.register_tag('bstable', Bootstrap::Table)

# module Bootstrap
#   class LeadParagraph < Liquid::Block
#     def initialize(tag_name, markup, tokens)
#       super
#     end

#     def render(context)
#       "<span class=\"lead\">#{super}</span>"
#     end
#   end
# end
