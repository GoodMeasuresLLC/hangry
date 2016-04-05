module Hangry
  module Parsers
    module NonStandard
      class SouthernFoodParser < SchemaOrgRecipeParser

        def self.can_parse?(html)
          !CanonicalUrlParser.new(html).canonical_url.nil? && CanonicalUrlParser.new(html).canonical_url.include?('southernfood.about.com')
        end

        def parse_name
          recipe_ast.css(".article-header").first.content.strip
        end

        def parse_description
          recipe_ast.css(".expert-content-text").first.content.strip
        end

        def parse_instructions
          node_with_itemprop("recipeInstructions").remove.css(">strong").css(">p").map(&:content).join("\n")
        end

      end
    end
  end
end

