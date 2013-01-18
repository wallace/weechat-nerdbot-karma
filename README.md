Description
-----------

Allows weechat users to bestow karma in campfire chatrooms, [nerdbot-style](https://github.com/bignerdranch/nerdbot/blob/master/scripts/karma.coffee).

Installation 
------------

Using system ruby

    $ sudo gem install weechat
    $ curl https://raw.github.com/wallace/weechat-nerdbot-karma/master/nerdbot_karma.rb > ~/.weechat/ruby/autoload/nerdbot_karma.rb

Usage
-----

From within weechat in the core buffer

    $ /help karma
    $ /karma user_nick karma_amount_as_integer
