# encoding: UTF-8
require 'hangry'
require 'rspec/its'

describe Hangry do

  context "diabetes.org recipe" do
    let(:html) { File.read("spec/fixtures/hrecipe/diabetes.org.html") }
    subject { Hangry.parse(html.encode!("UTF-8", 'binary', :invalid => :replace, :undef => :replace, :replace => '')) }

    its(:author) { should == nil }
    its(:canonical_url) { should == "http://www.diabetes.org/mfa-recipes/recipes/2017-01-carrot-ginger-soup-with-parsley.html" }
    its(:cook_time) { should == nil }
    its(:description) { should == "Carrots are one of those inexpensive root vegetables that often show up grated in salads. Though carrot ginger soup has become a popular combination over the years, this version is especially tasty because the carrots are roasted until caramelized. It adds a layer of flavor that you would not otherwise get were you to simply boil the carrots." }
    its(:image_url) { should == nil }
    its(:ingredients) {
      should == [
        "2 c. flour",
        "1/2 c. powdered sugar",
        "1 packet True Lemon, divided (optional)",
        "1 c. butter",
        "4 eggs, well beaten",
        "2 c. sugar",
        "1/3 c. freshly squeezed lemon juice",
        "2-3 drops pure lemon oil (optional)",
        "1/2 tsp. baking powder",
        "1/4 c. flour",
        "Grated rind of 1 lemon (optional)"
      ]
    }
    its(:name) { should == "Carrot Ginger Soup with Parsley" }
    its(:nutrition) do
      should == {
        calories: nil,
        cholesterol: nil,
        fiber: nil,
        protein: nil,
        saturated_fat: nil,
        sodium: nil,
        sugar: nil,
        total_carbohydrates: nil,
        total_fat: nil,
        trans_fat: nil,
        unsaturated_fat: nil
      }
    end

    its(:instructions) {
      instructions = <<-EOS
Mix first 3 ingredients using half of the True Lemon packet (optional). Using a pastry blender or two knives, cut in butter as you would when making pie crust until it resembles coarse crumbs.Press crumb mixture into a 9 x 13 inch pan. Bake in a preheated 350F oven for 15-20 minutes.Combine the remaining ingredients (and the other half of the True Lemon packet) to make the lemon filling.Pour over crust and bake for 25 minutes at 350F or until lightly golden on top. Sprinkle with powdered sugar when cool.Cut into bars.
      EOS
      should == instructions.strip
    }

    its(:prep_time) { should == nil }
    its(:published_date) { should == nil }
    its(:total_time) { should == nil }
    its(:yield) { should == "This Recipe Serves 8" }

  end

end



