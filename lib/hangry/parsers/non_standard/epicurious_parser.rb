module Hangry
  module Parsers
    module NonStandard
      class EpicuriousParser < SchemaOrgRecipeParser

        def self.can_parse?(html)
          canonical_url_matches_domain?(html, 'epicurious.com') && canonical_url_contains_path?(html,'recipes/food/views')
        end

        def parse_prep_time
          recipe_ast.css(".active-time").last.content
        end

        def parse_total_time
          recipe_ast.css(".total-time").last.content
        end

        def parse_ingredients
          recipe_ast.css(".ingredient").map(&:content)
        end

        def parse_instructions
          recipe_ast.css(".preparation-step").map(&:content).join("\n")
        end

      end
    end
  end
end
