require "test_helper"

class Api::V1::AssertionsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get api_v1_assertions_url, as: :json

    assert_response :ok
    json = response.parsed_body
    # TODO: improve the fixtures and assert more
    assert_equal 2, json.size
  end

  test "create a passed assertion" do
    # TODO: use WebMock to avoid real requests
    url = "nocode.autify.com"
    text = "ai-powered"

    assert_difference "::Assertion.passed.count" do
      post api_v1_assertions_url, params: { url:, text: }, as: :json
    end

    assert_response :created

    json = response.parsed_body
    assert_equal url, json[:url]
    assert_equal text, json[:text]
    assert_equal "PASS", json[:status]
    assert_equal 78, json[:numLinks]
    assert_equal 56, json[:numImages]
  end

  test "create a failed assertion" do
    url = "nocode.autify.com"
    text = "i-will-not-exist"

    assert_difference "::Assertion.failed.count" do
      post api_v1_assertions_url, params: { url:, text: }, as: :json
    end

    assert_response :created

    json = response.parsed_body
    assert_equal url, json[:url]
    assert_equal text, json[:text]
    assert_equal "FAIL", json[:status]
    assert_equal 78, json[:numLinks]
    assert_equal 56, json[:numImages]
  end
end
