require 'test_helper'

class DeliveryPersonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get delivery_persons_index_url
    assert_response :success
  end

end
