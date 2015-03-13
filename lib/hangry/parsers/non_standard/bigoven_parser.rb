module Hangry
  module Parsers
    module NonStandard
      class BigOvenParser < DataVocabularyRecipeParser

        def self.can_parse?(html)
          canonical_url_matches_domain?(html, 'bigoven.com')
        end

        def parse_ingredients
          ing = []
          nodes_with_itemprop(:ingredients).each do |i|
            ing << i.content.strip 
          end
          ing
        end

      end
    end
  end
end

