# encoding: UTF-8
require 'hangry'
require 'rspec/its'

describe Hangry do

  context "jamieoliver.com recipe" do
    let(:html) { File.read("spec/fixtures/hrecipe/jamieoliver.com.html") }
    subject { Hangry.parse(html) }

    it "should use the correct parser" do
      expect(Hangry::ParserClassSelecter.new(html).parser_class).to eq(Hangry::Parsers::NonStandard::JamieOliverParser)
    end

    its(:author) { should == "Jamie Oliver" }
    its(:canonical_url) { should == nil }
    its(:cook_time) { should == nil }
    its(:description) { should == '“The fine marbling of fat through the pork shoulder makes this pork fillet recipe amazingly juicy ”' }
    its(:image_url) { should == 'http://cdn.jamieoliver.com/recipe-database/oldImages/335_448/360_1_1438787789.jpg' }
    its(:ingredients) {
      should == [
        "4 higher-welfare pork neck fillet steaks",
        "olive oil",
        "2 cloves garlic , peeled and crushed",
        "1 handful fresh sage leaves , chopped",
        "sea salt",
        "freshly ground black pepper",
        "1 lemon"
      ]
    }
    its(:name) { should == "Neck fillet steak" }
    its(:nutrition) do
      should == {
        calories: "280",
        cholesterol: nil,
        fiber: nil,
        protein: "31.8g",
        saturated_fat: "5.3g",
        sodium: nil,
        sugar: "0.1g",
        total_carbohydrates: "0.8g",
        total_fat: "16.5g",
        trans_fat: nil,
        unsaturated_fat: nil
      }
    end

    its(:instructions) {
      instructions = <<-EOS
Method\nGet your griddle pan on a high heat and let it get screaming hot. Lay the steaks out on a chopping board and drizzle a little olive oil over each one. Sprinkle over the garlic, sage, a good sprinkling of salt and lots of ground black pepper. Grate the zest of the lemon onto the steaks, then cut the lemon in two and squeeze one of the halves over them as well. Rub this marinade into both sides of each steak with your fingers so they are evenly oiled and seasoned.\nPlace the steaks on your griddle or in a hot frying-pan (they make a bit of smoke, so get your fan on!). Make sure you don’t have too many in the pan at one time – there should be a gap between the steaks and they shouldn’t be touching each other at all, so if your pan isn’t big enough, cook in batches.\nTurn the steaks over after two minutes, then turn every minute until they’ve had 8 minutes cooking time in total. Squeeze the other half of the lemon over the cooked steaks and let them sizzle for a moment, then lift them out of the pan with tongs to a plate to rest for a minute before serving. Absolutely delicious served with some oven-baked jacket potato wedges, a lovely green salad and some hot chilli sauce.\nTip
      EOS
      should == instructions.strip
    }

    its(:prep_time) { should == nil }
    its(:published_date) { should == nil }
    its(:total_time) { should == 20 }
    its(:yield) { should == "4" }

  end

end


