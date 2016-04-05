module Hangry
  module Parsers
    module NonStandard
      class HomeCookingParser < SchemaOrgRecipeParser
        def self.can_parse?(html)
          !CanonicalUrlParser.new(html).canonical_url.nil? && CanonicalUrlParser.new(html).canonical_url.include?('homecooking.about.com')
        end

        def parse_description
          recipe_ast.css(".expert-content-text").first.content.strip
        end

        def parse_name
          recipe_ast.css(".article-header").css("h1").first.content.strip
        end

        def parse_prep_time
          node_with_itemprop("recipeTimes.prepTime").next.text
        end

        def parse_total_time
          node_with_itemprop("recipeTimes.totalTime").next.text
        end

      end
    end
  end
end