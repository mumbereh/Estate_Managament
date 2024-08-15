require "test_helper"

class MobilePaymentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get mobile_payments_new_url
    assert_response :success
  end

  test "should get create" do
    get mobile_payments_create_url
    assert_response :success
  end

  test "should get callback" do
    get mobile_payments_callback_url
    assert_response :success
  end
end
