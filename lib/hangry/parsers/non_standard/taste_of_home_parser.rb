module Hangry
  module Parsers
    module NonStandard
      class TasteOfHomeParser < SchemaOrgRecipeParser

        def self.can_parse?(html)
          canonical_url_matches_domain?(html, 'tasteofhome.com')
        end

        #def nodes_with_class(klass)
        #  super.reject { |node|
        #    # Taste of Home has nested elements with the 'ingredient' class.
        #    # So reject all nodes with a child that has the same class.
        #    node.css(".#{klass}").any?
        #  }
        #end

        def parse_yield
          #puts node_with_itemprop(:recipeyield).inspect
          100
          #value(node_with_itemprop(:recipeYield)['content']) ||
          #value(node_with_itemprop(:recipeYield).content) ||
          #NullObject.new
        end

      end
    end
  end
end

