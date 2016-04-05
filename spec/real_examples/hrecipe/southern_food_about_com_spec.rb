# encoding: UTF-8
require 'hangry'
require 'rspec/its'

describe Hangry do

  context "southernfood.about.com recipe" do
    let(:html) { File.read("spec/fixtures/hrecipe/southernfood.about.com.html") }
    subject { Hangry.parse(html) }

    it "should use the correct parser" do
      expect(Hangry::ParserClassSelecter.new(html).parser_class).to eq(Hangry::Parsers::NonStandard::SouthernFoodParser)
    end

    its(:author) { should == "Diana Rattray" }
    its(:canonical_url) { should == "http://southernfood.about.com/od/collardgreens/r/Kale-Saute-Recipe.htm" }
    its(:cook_time) { should == 13 }
    its(:description) { should == "" }
    its(:image_url) { should == "http://f.tqn.com/y/southernfood/1/W/r/Q/3/kale-saute-2.jpg" }
    its(:ingredients) {
      should == [
        "1 pound kale, large stems removed, chopped, or use frozen chopped kale",
        "2 teaspoons extra virgin olive oil",
        "1/2 cup finely chopped purple onion",
        "1 medium clove garlic, pressed",
        "1 or 2 hot peppers, minced, or 1 heaping tablespoon Portuguese crushed red peppers from a jar*",
        "3 tablespoons red wine vinegar",
        "1 tomato, chopped",
        "1/2 teaspoon salt, or to taste",
        "pepper, to taste"
      ]
    }
    its(:name) { should == "Sauteed Kale With Garlic and Peppers" }
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
This kale recipe is nutritious and delicious, and it's very easy to prepare and cook. There's very little fat in the recipe, and it can be reduced even further by using and a little broth to saute the onion. I used the Portuguese hot crushed red peppers (wet, from jar) in this dish, but feel free to use fresh minced hot peppers for heat. Alternatively, chopped sweet red bell peppers can be used. To cook the kale, bring a pot of to a boil. Add the chopped kale and boil for 10 to 15 minutes, or until stem portions are tender. Or, follow directions on the package if using frozen kale.Heat olive oil in a large  or  over medium heat; cook onion until just tender.Add the garlic and cook, stirring, for 1 minute.Add crushed red peppers, kale, and vinegar; cook, stirring, for 1 minute longer.Add chopped tomato, salt, and pepper; heat through.Serves 4 to 6.* Portuguese style wet crushed hot red peppers might be found in the ethnic or Spanish section. I found Pastene in my area, but if you can't find the crushed peppers, use any fresh hot chile pepper, finely chopped. Or use sweet bell peppers.\nFollow us:
      EOS
      should == instructions.strip
    }

    its(:prep_time) { should == "12 minutes" }
    its(:published_date) { should == "February 17, 2016" }
    its(:total_time) { should == "25 minutes" }
    its(:yield) { should == "Serves 4 to 6" }

  end

end

