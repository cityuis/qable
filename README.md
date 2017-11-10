# Qable

Qable is a acceptance testing framework based in Cucumber/Capybara with
Page Object Model DSL and multi-browser support.


## Installation

Install it yourself as:

    $ gem install qable

## Usage

Create a new project:

    $ qable myapp

Run the tests in the new project:

    $ cd myapp
    $ bundle exec rake

Read more about how to use Qable in the [project's README](https://github.com/ableco/qable/blob/master/lib/qable/generators/app/templates/README.md).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ableco/qable.

## Copyright

Copyright (c) 2017 Able.co. See LICENSE for further details.
