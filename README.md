# GardenHelper

Welcome to GardenHelper, a fun and useful CLI application for garden planning and growing. Use this app to access individual plant square-foot gardening spacing guides, as well as plotting out your dream garden based on available space in your plot. Using the square foot gardening method, you can maximize your available space. Your spring and autumn garden planning just got much easier! 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'garden_helper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install garden_helper

## Usage

This gem comes with a list of vegetables, herbs, and fruit spacing guides included. You may see the entire list by inputting the command "list plants" or "list all plants". You can also lookup a particular plant's spacing needs with the command "lookup a plant" and putting in the plant you're looking for. 

To view all garden plots use the command "view plots" or "list plots". To make a new plot, use "new plot" and then name your new garden plot and input the available space in square feet. You can then add plants to this plot or remove using the "edit plot" command and the space left will adjust accordingly. At any time you can view your plots using "lookup a plot" or delete a plot using "delete plot". 

To exit simply use the command "exit" or "quit".  

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cc-gellert/Garden-Helper-.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
