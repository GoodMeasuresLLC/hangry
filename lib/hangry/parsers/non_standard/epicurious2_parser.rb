module Hangry
  module Parsers
    module NonStandard
      class Epicurious2Parser < SchemaOrgRecipeParser

        def self.can_parse?(html)
          canonical_url_matches_domain?(html, 'epicurious.com') && canonical_url_contains_path?(html,'recipes/member/views')
        end

        def parse_author
          recipe_ast.css(".author").first.content
        end

        def parse_description
          recipe_ast.css('[itemprop = "description"]').first.content
        end

        def parse_ingredients
          nodes_with_itemprop(:ingredients).map do |i|
            i.content.strip
          end
        end

      end
    end
  end
end
