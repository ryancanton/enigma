require 'simplecov'
SimpleCov.start do
  add_filter "./spec/"
end
require './lib/enigma.rb'
