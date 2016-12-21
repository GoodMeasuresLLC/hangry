module Hangry
  module Parsers
    module NonStandard
      class FoodComParser < SchemaOrgRecipeParser

        def self.can_parse?(html)
          canonical_url_matches_domain?(html, 'food.com')
        end

        # => script type='application/ld+json'

        def parse_yield
          recipe_ast.search("script type='application/ld+json'")
        end

      end
    end
  end
end