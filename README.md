# object-let

[<img src="https://gemnasium.com/ronen/object-let.png" alt="Dependency Status"
/>](https://gemnasium.com/ronen/object-let)

Defines `Object#let`, which simply yields the object and returns the result.
This idiom, familiar to Lisp programmers, can be handy to eliminate the need
for an intermediate variable when you need to use the result of a computation
multiple times.

For example, without `let`, you might write:

    biggest = my_things.find_biggest
    bounds = Bound.new(:width => biggest.width, :height => biggest.height)

with `let`, this could be:

    bounds = my_things.find_biggest.let { |biggest|
      Bound.new(:width => biggest.width, :height => biggest.height)
    }

Stylistically, as well in terms of lexical scoping (for ruby 1.9), this idiom
can make clear that the intermediate result is of no importance outside the
block.

You can also think of this as analogous to "map" in a method chain, but for a
single value rather than for an enumerable.  Compare:

    array_of_items = thingy.item_names.map{ |name| Item.new(:name => name) }
    just_one_item  = thingy.item_name.let { |name| Item.new(:name => name) }

`Object#let_if` behaves like `Object#let` except that it only yields if the
object is truthy; otherwise it returns nil.  So, modifying the above example:

    bounds = my_things.find_biggest.let_if { |biggest|
      Bound.new(:width => biggest.width, :height => biggest.height)
    }

`bounds` will be nil if `find_biggest` returns nil.

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

## History

    * 0.1.0 - Add <tt>Object#left_if</tt>
    * 0.0.1 - Initial version

## Copyright

Released under the MIT License.  See LICENSE for details.

