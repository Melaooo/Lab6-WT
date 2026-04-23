require "test_helper"

class PetTest < ActiveSupport::TestCase
  def setup
    @owner = Owner.create!(
      first_name: "Test",
      last_name: "Owner",
      email: "owner@test.com",
      phone: "123456789",
      address: "Chile"
    )

    @pet = Pet.new(
      name: "Firulais",
      species: "dog",
      date_of_birth: Date.new(2020, 1, 1),
      weight: 10,
      owner: @owner
    )
  end

  test "should be valid" do
    assert @pet.valid?
  end

  test "should not save without name" do
    @pet.name = nil
    assert_not @pet.valid?
    assert_includes @pet.errors[:name], "can't be blank"
  end

  test "should not save without species" do
    @pet.species = nil
    assert_not @pet.valid?
    assert_includes @pet.errors[:species], "can't be blank"
  end

  test "should not allow invalid species" do
    @pet.species = "dragon"
    assert_not @pet.valid?
  end

  test "should not allow future date_of_birth" do
    @pet.date_of_birth = Date.today + 1
    assert_not @pet.valid?
  end

  test "should not allow weight <= 0" do
    @pet.weight = 0
    assert_not @pet.valid?
  end

  test "should not save without owner" do
    @pet.owner = nil
    assert_not @pet.valid?
  end
end