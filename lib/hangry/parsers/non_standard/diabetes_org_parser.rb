module Hangry
  module Parsers
    module NonStandard
      class DiabetesOrgParser < RecipeParser

        def self.can_parse?(html)
          canonical_url_matches_domain?(html, 'diabetes.org')
        end

        def self.root_selector
          '.recipe-summary'
        end

        def self.nutrition_selector
          '.nutritional_info_content'
        end

        def node_with_class(klass)
          nodes_with_class(klass).first || NullObject.new
        end

        def nodes_with_class(klass)
          recipe_ast.css(".#{klass}")
        end

        def parse_cook_time
          #parse_duration(
          #  value(title_value_for_css_class(:cookTime)) ||
          #  value(title_value_for_css_class(:cooktime))
          #)
          nil
        end

        def parse_description
          node_with_class(:recipe_col_2).content
        end

        def parse_image_url
          nil
        end

        def parse_author
          nil
        end

        def parse_ingredients
          nodes_with_class(:ingredient).map { |ingredient_node|
            # Instead of calling content on the node itself,
            # join together the content of the nodes' children.
            # This is to support BigOven's janky usage of spans with margin-lefts...
            ingredient_node.children.map { |c| c.content }.join(' ')
          }.map { |ingredient|
            ingredient
          }.reject(&:blank?)
        end

        def parse_instructions
          nodes_with_class(:instructions).map(&:content).join("\n")
        end

        def parse_name
          recipe_ast.css("h1").first.content.strip
        end

        def parse_nutrition
          nil
        end

        def parse_prep_time
          #parse_duration(
          #  value(title_value_for_css_class(:prepTime)) ||
          #  value(title_value_for_css_class(:preptime))
          #)
          nil
        end

        def parse_published_date
          #TODO
        end

        def parse_total_time
          #parse_duration(
          #  value(title_value_for_css_class(:duration)) ||
          #  value(title_value_for_css_class(:totalTime))
          #)
          nil
        end

        def parse_yield
          recipe_ast.css(".recipe-serves").first.content.strip
        end


      end
    end
  end
end
