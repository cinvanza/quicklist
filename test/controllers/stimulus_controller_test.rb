require "test_helper"

class StimulusControllerTest < ActionDispatch::IntegrationTest
  test "should get dictionary" do
    get stimulus_dictionary_url
    assert_response :success
  end
end
