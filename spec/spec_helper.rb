ENV["RACK_ENV"] = "test"

require "bundler/setup"
Bundler.require :default, :test
set :root, Dir.pwd
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

require "capybara/rspec"
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require "./app"

RSpec.configure do |config|
  config.after(:each) do
    Ingredient.all.each do |d|
      d.destroy
    end
    Tag.all.each do |d|
      d.destroy
    end
    Recipe.all.each do |d|
      d.destroy
    end
  end
end
