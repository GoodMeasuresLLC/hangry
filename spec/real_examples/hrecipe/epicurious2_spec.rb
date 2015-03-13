require 'hangry'
require "rspec/its"

describe Hangry do

  context "epicurious.com recipe format #2" do
    let(:html) { File.read("spec/fixtures/hrecipe/epicurious2.html") }
    subject { Hangry.parse(html) }

    it "should use the correct parser" do
      expect(Hangry::ParserClassSelecter.new(html).parser_class).to eq(Hangry::Parsers::NonStandard::Epicurious2Parser)
    end
    
    its(:author) { should == "Same" }
    its(:canonical_url) { should == "http://www.epicurious.com/recipes/member/views/curry-goat-50118923" }
    its(:cook_time) { should == nil }
    its(:description) { should == "This is one of the best curry goat recipes I've tried. What makes it unique from others is the lime juice that gets rubbed on the meat. The taste remains on the meat throughout the simmering and adds just the right zing. I think the best recipes are those that don't need much modification and this one was great as written. It produces a stew with a good consistency...not too thick or thin, and with tons of flavor." }
    its(:prep_time) { should == nil }
    its(:total_time) { should == nil }
    its(:image_url) { should == nil }
    its(:ingredients) {
      should == [
        '2 pounds goat meat (or lamb) without bones',
        '1 lime, juiced',
        '1 tablespoon salt',
        '1 teaspoon freshly ground black pepper',
        '1 Scotch bonnet pepper (any color), seeded and minced',
        '1/2 teaspoon dried thyme',
        '1/2 teaspoon ground allspice (dry pimento berries)',
        '3 tablespoons curry powder',
        '2 whole scallions, sliced',
        '1 onion, sliced',
        '3 cloves garlic, minced',
        '1/4 cup vegetable oil',
        '3 tomatoes, diced',
        '1/2 cup coconut milk (optional)',
        '3 cups water',
      ]
    }

    its(:instructions) do
      # hmm... preserving newlines for Epicurious instructions gives us some crappy results...
      instructions = <<-eos
Preparation\nRinse goat meat well, rub lime juice over it (from 1/2 whole lime), place meat in a bowl, then add salt, black pepper, Scotch bonnet, thyme, allspice, curry powder, scallions, onion and garlic. Leave to marinate for at least 2 hours in the refrigerator, longer would be ideal. Heat the oil in a skillet until it is very hot, and saute the meat until golden brown. Then add the marinade, tomatoes and coconut milk, if using, and simmer for approximately 3 more minutes. Add water, reduce heat and allow to simmer for 2 to 3 hours stirring occasionally until meat is tender.Instead of simmering for 2-3 hours you can cook goat in a a Pressure Cooker for ~40-45 minutes      
      eos
      should == instructions.strip
    end

    its(:name) { should == "curry goat" }
    its(:published_date) { should == nil }
    its(:yield) { should == "3 People" }

  end

end




