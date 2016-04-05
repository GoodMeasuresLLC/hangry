module Hangry
  module Parsers
    module NonStandard
      class JamieOliverParser < SchemaOrgRecipeParser

        def self.can_parse?(html)
          html.include?('jamieoliver.com')
        end

        def parse_author
          "Jamie Oliver"
        end

        def parse_ingredients 
          recipe_ast.css(".ingred-list").css("li").map(&:content)
        end

        def parse_yield
          recipe_ast.css(".serves").css(".detail_desc").first.next.text.strip
        end

      end
    end
  end
end