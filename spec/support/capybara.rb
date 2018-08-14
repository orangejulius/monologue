require 'capybara/rails'
require 'capybara/dsl'

RSpec.configure do |c|
  c.include Capybara::DSL, file_path: /\bspec\/request\//
end
