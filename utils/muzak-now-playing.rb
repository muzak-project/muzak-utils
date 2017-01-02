#!/usr/bin/env ruby

require "muzak"
require "json"

def now_playing
  json = JSON.parse(`muzak-cmd now-playing`)

  unless json["response"]["error"]
    json["response"]["data"]["playing"]
  end
end

# don't bother printing if it's nil or empty
puts now_playing unless now_playing&.empty?
