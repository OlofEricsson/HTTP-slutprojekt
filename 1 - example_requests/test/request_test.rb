require_relative 'spec_helper'
require_relative '../lib/request'

class RequestTest < Minitest::Test

  def test_parses_http_method_from_simple_get
    skip "not used"
    request_string = File.read('../get-index.request.txt')
    request = Request.new(request_string)

    assert_equal 'GET', request.method
  end

  def test_parses_resource_from_simple_get
    skip "not used"
    request_string = File.read('../get-index.request.txt')
    request = Request.new(request_string)

    assert_equal '/', request.resource
  end

  def test_parses_version_from_simple_get
    skip "not used"
    request_string = File.read('../get-index.request.txt')
    request = Request.new(request_string)

    assert_equal 'HTTP/1.1', request.version
  end


  def test_parses_http_method_from_simple_get
    request_string = File.read('../get-fruits-with-filter.request.txt')
    request = Request.new(request_string)

    assert_equal 'GET', request.method
  end

  def test_parses_resource_from_simple_get
    request_string = File.read('../get-fruits-with-filter.request.txt')
    request = Request.new(request_string)

    assert_equal '/fruits?type=bananas&minrating=4', request.resource
  end

  def test_parses_params_from_simple_get
    request_hash = File.read('../get-fruits-with-filter.request.txt')
    request = Request.new(request_hash)
    check_hash = {'type' => 'bananas', 'minrating' => '4'}

    assert_equal check_hash, request.params
  end

  def test_parses_version_from_simple_get
    request_string = File.read('../post-login.request.txt')
    request = Request.new(request_string)

    assert_equal 'HTTP/1.1', request.version
  end

  def test_parses_headers_from_simple_get
    request_hash = File.read('../get-fruits-with-filter.request.txt')
    request = Request.new(request_hash)
    check_hash = {'Host' => 'fruits.com', 'User-Agent' => 'ExampleBrowser/1.0', 'Accept-Encoding' => 'gzip, deflate', 'Accept' => '*/*'}

    assert_equal check_hash, request.headers
  end

end