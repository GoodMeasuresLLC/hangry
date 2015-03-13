module Hangry
  module Parsers
    module NonStandard
      class Epicurious2Parser < SchemaOrgRecipeParser

        def self.can_parse?(html)
          canonical_url_matches_domain?(html, 'epicurious.com') && canonical_url_contains_path?(html,'recipes/member/views')
        end

        def parse_ingredients
          recipe_ast.css(".ingredient").map(&:content)
        end

        def parse_instructions
          node_with_itemprop("recipeInstructions").css(">p").map(&:content).join("\n")
        end

      end
    end
  end
end
