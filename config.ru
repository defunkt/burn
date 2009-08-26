#!/usr/bin/env ruby

require 'burn'

use Rack::ShowExceptions
run Burn.new
