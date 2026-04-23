require "test_helper"

class OwnerTest < ActiveSupport::TestCase
  def setup
    @owner = Owner.new(
      first_name: "Tomás",
      last_name: "Melin",
      email: "test@test.com",
      phone: "123456789",
      address: "Santiago"
    )
  end

  test "should be valid" do
    assert @owner.valid?
  end

  test "should not save without first_name" do
    @owner.first_name = nil
    assert_not @owner.valid?
    assert_includes @owner.errors[:first_name], "can't be blank"
  end

  test "should not save without last_name" do
    @owner.last_name = nil
    assert_not @owner.valid?
    assert_includes @owner.errors[:last_name], "can't be blank"
  end

  test "should not save without email" do
    @owner.email = nil
    assert_not @owner.valid?
    assert_includes @owner.errors[:email], "can't be blank"
  end

  test "should not allow invalid email format" do
    @owner.email = "invalid_email"
    assert_not @owner.valid?
  end

  test "should not allow duplicate email" do
    @owner.save!
    duplicate = @owner.dup
    assert_not duplicate.valid?
    assert_includes duplicate.errors[:email], "has already been taken"
  end

  test "should not save without phone" do
    @owner.phone = nil
    assert_not @owner.valid?
    assert_includes @owner.errors[:phone], "can't be blank"
  end
end