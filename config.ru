require "bundler/setup"
require_relative "./shop"

use Rack::MethodOverride
run Shop::App.new
