# Hangry

Parses microformatted recipe HTML into a plain-old-ruby Recipe object.

Currently supported microformats:
- http://schema.org/Recipe
- http://data-vocabulary.org/Recipe
- http://microformats.org/wiki/hrecipe

## Pieces of Flair
- [![Build Status](https://travis-ci.org/GoodMeasuresLLC/hangry.png?branch=master)](http://travis-ci.org/GoodMeasuresLLC/hangry)
- [![Code Climate](https://codeclimate.com/github/GoodMeasuresLLC/hangry.png)](https://codeclimate.com/github/GoodMeasuresLLC/hangry)

## Installation

Add this line to your application's Gemfile:

    gem 'hangry'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hangry

## Usage

```ruby
require 'open-uri'
recipe_url = "http://www.foodnetwork.com/recipes/rachael-ray/spinach-and-mushroom-stuffed-chicken-breasts-recipe/index.html"
recipe_html_string = open(recipe_url).read

require 'hangry'
recipe = Hangry.parse(recipe_html_string)
recipe.author         # "Rachel Ray"
recipe.cook_time      # 20
recipe.description    # nil
recipe.image_url      # "http://img.foodnetwork.com/FOOD/2008/08/13/av-rachael-ray.jpg"
recipe.ingredients    # ["4 boneless, skinless chicken breasts, 6 ounces", "Large plastic food storage bags or waxed paper", "1 package, 10 ounces, frozen chopped spinach", "2 tablespoons butter", "12 small mushroom caps, crimini or button", "2 cloves garlic, cracked", "1 small shallot, quartered", "Salt and freshly ground black pepper", "1 cup part skim ricotta cheese", "1/2 cup grated Parmigiano or Romano, a couple of handfuls", "1/2 teaspoon fresh grated or ground nutmeg", "Toothpicks", "2 tablespoons extra-virgin olive oil", "2 tablespoons butter", "2 tablespoons flour", "1/2 cup white wine", "1 cup chicken broth"]
recipe.instructions   # "Place breasts in the center of a plastic food storage..."
recipe.name           # "Spinach and Mushroom Stuffed Chicken Breasts"
recipe.prep_time      # 15
recipe.published_date # #<Date: 2013-02-06 >
recipe.total_time     # 35
recipe.yield          # "4 servings"
# etc..
```

[Live demo](http://hangryingreedytest.herokuapp.com/)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
