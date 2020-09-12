$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "controllers")

require 'rulers'
require 'quotes_controller'
require 'home_controller'

module BestQuotes
  class Application < Rulers::Application
  end
end
