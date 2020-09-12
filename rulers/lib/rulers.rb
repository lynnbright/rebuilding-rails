require "rulers/version"
require "rulers/routing"
require "rulers/util"
require "rulers/dependencies"

module Rulers
  class Application
    def call(env)
      if env["PATH_INFO"] == '/favicon.ico'
        [404, {"Content-type" => "text/html"}, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)

      begin
        raise RuntimeError, "It's bad request!"
      rescue RuntimeError => error
        puts "it's a bad request!!"
      end

      [200, {'Content-Type' => 'text/html'}, [text]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
