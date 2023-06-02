[![Build Status](https://travis-ci.org/godjo/dota2-static.svg?branch=master)](https://travis-ci.org/ya-kmet/dota2-static)
[![GitHub version](https://badge.fury.io/gh/ya-kmet%2Fdota2-static.svg)](http://badge.fury.io/gh/ya-kmet%2Fdota2-static)

# Dota2::Static

This gem provides Dota 2 ingame static data and images for Rails applications.

All data are collected using Dotabuff repositories [d2vpk](https://github.com/dotabuff/d2vpk) and
[dota-econ-leagues](https://github.com/dotabuff/dota-econ-leagues) and updated automatically shortly after dotabuff
commits changes. All images are downloaded from Steam CDNs, except leagues images that are taken from Dota 2 client
files.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dota2-static', :git => 'git@github.com:godjo/dota2-static.git'
```

And then execute:

    $ bundle

## Usage

### Heroes

```ruby
Dota2::Static::Hero.all               # => [Dota2::Static::Hero]
hero = Dota2::Static::Hero.find(14)   # => Single hero by id
hero.name                             # => "Pudge"
hero.internal_name                    # => "pudge"
hero.abilities                        # => [Dota2::Static::Ability]
image_tag hero.image                  # => HTML image tag for 256x144 version
```

### Abilities

```ruby
Dota2::Static::Ability.all                  # => [Dota2::Static::Ability]
ability = Dota2::Static::Ability.find(5602) # => Single ability by id
ability.name                                # => "Remote Mines"
ability.internal_name                       # => "techies_remote_mines"
ability.type                                # => "DOTA_ABILITY_TYPE_ULTIMATE"
ability.ultimate?                           # => boolean
image_tag ability.image                     # => HTML image tag for 85x64 image
```

### Items

```ruby
Dota2::Static::Item.all               # => [Dota2::Static::Item]
item = Dota2::Static::Item.find(108)  # => Single item by id
item.name                             # => "Aghanim's Scepter"
item.internal_name                    # => "ultimate_scepter"
image_tag item.image                  # => HTML image tag for 85x64 image
```

### Leagues

```ruby
Dota2::Static::League.all                  # => [Dota2::Static::League]
league = Dota2::Static::League.find(2418)  # => Single league by id
league.name                                # => "SLTV Star Series Season 12 Ticket"
league.description                         # => "Top teams from all over the world are competing for a place at LAN Finals."
league.tournament_url                      # => "http://dota2.starladder.tv/"
image_tag league.image                     # => HTML image tag for 256x170 version
image_tag league.image_banner              # => HTML image tag for 255x101 version
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/godjo/dota2-static.

## License

The source code is under MIT license. The content is © Valve Corporation.
