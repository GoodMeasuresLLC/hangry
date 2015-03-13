module Hangry
  module Parsers
    module NonStandard
      class Epicurious2Parser < SchemaOrgRecipeParser

        def self.can_parse?(html)
          canonical_url_matches_domain?(html, 'epicurious.com') && canonical_url_contains_path?(html,'recipes/member/views')
        end

        def parse_description
          recipe_ast.css("#recipeIntroText").css(".truncatedTextModuleText").first.content
        end

        def parse_ingredients
          # => ingredients are in the #ingredients div, separated by <br>
          ing = []
          recipe_ast.css("#ingredients").children.each do |node|
            next if node.text.strip.blank? || node.text.strip.downcase == "ingredients"
            ing << node.text.strip
          end
          ing
        end

      end
    end
  end
end
