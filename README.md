# Modularize

Dynamically create Ruby module hierarchies

```ruby
Modulize.create('Animals::Cats::Bombay')
```

is the equivelent to:

```ruby
module Animals
  module Cats
    module Bombay
    end
  end
end
```

## But Why?

In [RestPack](https://github.com/restpack), I want to create some modules at load time so that I don't need to nest class definitions in module namespaces. I want to be able to do this:

```ruby
module Commands::Groups::Invitation
  class Create
    ..
  end
end
```

instead of this:

```ruby
module Commands
  module Groups
    module Invitation
      class Create
        ..
      end
    end
  end
end
```

Watch a video of the gem creation: http://www.youtube.com/watch?v=JR3tlXae73k

## Installation

Add this line to your application's Gemfile:

    gem 'modularize'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install modularize

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
