require "test_helper"

class OwnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @owner = owners(:one)
  end

  test "should get index" do
    get owners_url
    assert_response :success
  end

  test "should show owner" do
    get owner_url(@owner)
    assert_response :success
  end

  test "should create owner" do
    assert_difference("Owner.count") do
      post owners_url, params: {
        owner: {
          first_name: "John",
          last_name: "Doe",
          email: "john#{SecureRandom.hex(4)}@mail.com",
          phone: "123456789"
        }
      }
    end

    assert_redirected_to owner_url(Owner.last)
    assert_not_nil flash[:notice]
  end

  test "should not create invalid owner" do
    post owners_url, params: {
      owner: { first_name: "", email: "" }
    }

    assert_response :unprocessable_entity
  end

  test "should update owner" do
    patch owner_url(@owner), params: {
      owner: { first_name: "Updated" }
    }

    assert_redirected_to owner_url(@owner)
  end

  test "should destroy owner" do
    assert_difference("Owner.count", -1) do
      delete owner_url(@owner)
    end

    assert_redirected_to owners_url
  end
end