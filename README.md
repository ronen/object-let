# object-let

[![Gem Version](https://badge.fury.io/rb/object-let.svg)](https://badge.fury.io/rb/object-let)
[![Build Status](https://secure.travis-ci.org/ronen/object-let.png)](http://travis-ci.org/ronen/object-let)
[![Dependency Status](https://gemnasium.com/ronen/object-let.png)](https://gemnasium.com/ronen/object-let)


Defines `Object#let`, which simply yields the object and returns the result.
This idiom, familiar to Lisp programmers, can be handy to eliminate the need
for an intermediate variable when you need to use the result of a computation
multiple times.

For example, without `let`, you might write:

```ruby
biggest = my_things.find_biggest
bounds = Bound.new(:width => biggest.width, :height => biggest.height)
```

with `let`, this could be:

```ruby
bounds = my_things.find_biggest.let { |biggest|
    Bound.new(:width => biggest.width, :height => biggest.height)
}
```

Stylistically, as well in terms of lexical scoping (for ruby >= 1.9), this idiom
can make clear that the intermediate result is of no importance outside the
block.

You can also think of this as analogous to "map" in a method chain, but for a
single value rather than for an enumerable.  Compare:

```ruby
array_of_items = thingy.item_names.map { |name| Item.new(:name => name) }
just_one_item  = thingy.item_name.let  { |name| Item.new(:name => name) }
```

# See also

Discussion at http://www.opensourcery.com/blog/zack-hobson/objectlet-ruby-0

Alternative implementation at http://ick.rubyforge.org/inside.html

The "let" gem (https://rubygems.org/gems/let) provides a module that can be
included in a class to define memoizing accessors.  That gem and this one are
compatible.

## Installation

Install via:

    % gem install object-let

or in your Gemfile:

    gem "object-let"
    
## Compatibility

The gem is tested on ruby 1.8.7, 1.9.3, 2.0.0, and 2.2.3

## History

    * 0.1.0 - Add `Object#let_if`
    * 0.0.1 - Initial version

## Copyright

Released under the MIT License.  See LICENSE for details.


