require "test_helper"

class PaymentInfosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get payment_infos_new_url
    assert_response :success
  end
end
