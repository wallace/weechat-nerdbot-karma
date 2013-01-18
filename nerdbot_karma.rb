# https://github.com/wallace/weechat-nerdbot-karma
#
# Installation 
# Use system ruby
# sudo gem install weechat
# 
# curl https://raw.github.com/wallace/weechat-nerdbot-karma/master/nerdbot_karma.rb > ~/.weechat/ruby/autoload/nerdbot_karma.rb
require 'rubygems'
require 'weechat'
include Weechat

def weechat_init
  Weechat.register("nerdbot_karma",
                   "Jonathan Wallace",
                   "0.0.1",
                   "GPL3",
                   "Weechat Camper_van Nerdbot Karma Script",
                   "0.0.5",
                   "Allows weechat users to bestow karma in campfire chatrooms, nerdbot-style")

  add_command

  return Weechat::WEECHAT_RC_OK
end

def add_command
  Weechat.hook_command("karma", "Allows weechat users to bestow karma in campfire chatrooms, nerdbot-style", 
                       "someones_irc_nick amount_as_integer",
                       "",
                       "",
                       "bestow_karma", "")
end

# Returns a string representing the suffix to provide to hubot to update modify
# a person's karma
def convert_karma_amount_to_suffix(karma_amount)
  case
  when 0 == karma_amount ||
       1 == karma_amount
    "++"
  when karma_amount > 0
    "+=#{karma_amount}"
  when -1 == karma_amount
    "--"
  when karma_amount < 0
    "-=#{karma_amount.abs}"
  end
end

# Converts an IRC nick to a campfire nick
def convert_irc_to_campfire_nick(nick)
  nick.tr('_', ' ')
end

def bestow_karma(data, buffer, msg)
  return Weechat::WEECHAT_RC_OK if msg.empty?

  nick, karma_amount = msg.split(' ')

  nick   = convert_irc_to_campfire_nick(nick)
  suffix = convert_karma_amount_to_suffix(karma_amount.to_i)

  Weechat.command(Weechat.current_buffer, ":#{nick}:#{suffix}")

  return Weechat::WEECHAT_RC_OK
end
