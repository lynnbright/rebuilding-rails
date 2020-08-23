require_relative "test_helper"

class TestApp < Rulers::Application
end

class RulersAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/"

    assert last_response.ok?
    body = last_response.body
    assert body["Hello"]
  end

  def test_response_is_ok_for_other_paths
    get '/other_paths'

    assert last_response.ok?
    assert_equal last_response.body, 'Hello from Ruby on Rulers!'
  end
end
