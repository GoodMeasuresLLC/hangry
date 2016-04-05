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

        # => They broke the description tagging
        #def parse_description
        #  recipe_ast.css(".expert-content-text").first.content.strip
        #end

        def parse_instructions
          node_with_itemprop("recipeInstructions").search('//p/text()[not(preceding-sibling::strong)]').text
        end

        def parse_prep_time
          node_with_itemprop("recipeTimes.prepTime").next.text
        end

        def parse_total_time
          node_with_itemprop("recipeTimes.totalTime").next.text
        end

        def parse_published_date
          node_with_itemprop("dateModified").text
        end

      end
    end
  end
end

