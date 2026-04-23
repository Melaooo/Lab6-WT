require "test_helper"

class AppointmentTest < ActiveSupport::TestCase
  def setup
    @owner = Owner.create!(first_name: "Test", last_name: "Owner", email: "a@a.com", phone: "123", address: "x")
    @pet = Pet.create!(name: "Firulais", species: "dog", date_of_birth: Date.new(2020,1,1), weight: 10, owner: @owner)
    @vet = Vet.create!(first_name: "Doc", last_name: "Vet", email: "vet@vet.com", phone: "111", specialization: "General")

    @appointment = Appointment.new(
      date: Time.now,
      reason: "Check",
      status: :scheduled,
      pet: @pet,
      vet: @vet
    )
  end

  test "should be valid" do
    assert @appointment.valid?
  end

  test "should not save without date" do
    @appointment.date = nil
    assert_not @appointment.valid?
  end

  test "should not save without reason" do
    @appointment.reason = nil
    assert_not @appointment.valid?
  end

  test "should not save without pet" do
    @appointment.pet = nil
    assert_not @appointment.valid?
  end

  test "should not save without vet" do
    @appointment.vet = nil
    assert_not @appointment.valid?
  end

  test "should not save without status" do
    @appointment.status = nil
    assert_not @appointment.valid?
  end
end