require "test_helper"

class VetTest < ActiveSupport::TestCase
  def setup
    @vet = Vet.new(
      first_name: "Juan",
      last_name: "López",
      email: "vet@test.com",
      phone: "111111111",
      specialization: "General"
    )
  end

  test "should be valid" do
    assert @vet.valid?
  end

  test "should not save without first_name" do
    @vet.first_name = nil
    assert_not @vet.valid?
  end

  test "should not save without last_name" do
    @vet.last_name = nil
    assert_not @vet.valid?
  end

  test "should not save without email" do
    @vet.email = nil
    assert_not @vet.valid?
  end

  test "should not allow invalid email format" do
    @vet.email = "invalid"
    assert_not @vet.valid?
  end

  test "should not allow duplicate email" do
    @vet.save!
    duplicate = @vet.dup
    assert_not duplicate.valid?
  end

  test "should not save without specialization" do
    @vet.specialization = nil
    assert_not @vet.valid?
  end
end