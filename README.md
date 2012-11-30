# TagifyString

This gem is a fancy wrapper for string#parameterize from Active support.  It is written so that a number of projects that I work on can consistently operate on strings the way that is needed so that global changes can be simple.  As the functionality may grow a lot (in a backward-compatible way), it's best to examine lib/tagify_string/core_ext.rb.  At present this adds 'tagify(options={})' and 'tagify!(options={})' to the standard Ruby string.

## Installation

Add this line to your application's Gemfile:

    gem 'tagify_string'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tagify_string

## Usage

    $ "a b".tagify

or, to change the string

    $ "a b".tagify!

Both versions of tagify take an options param:

    $ "a b".tagify(:sep => "+", :upcase => false)

..will give you "a+b".  Refer to lib/tagify_string/core_ext.rb for all of the options.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
