require "test_helper"

class TreatmentTest < ActiveSupport::TestCase
  def setup
    @owner = Owner.create!(first_name: "Test", last_name: "Owner", email: "x@x.com", phone: "123", address: "x")
    @pet = Pet.create!(name: "Firulais", species: "dog", date_of_birth: Date.new(2020,1,1), weight: 10, owner: @owner)
    @vet = Vet.create!(first_name: "Doc", last_name: "Vet", email: "vet2@vet.com", phone: "111", specialization: "General")
    @appointment = Appointment.create!(date: Time.now, reason: "Check", status: "scheduled", pet: @pet, vet: @vet)

    @treatment = Treatment.new(
      name: "Vaccination",
      administered_at: Time.now,
      appointment: @appointment
    )
  end

  test "should be valid" do
    assert @treatment.valid?
  end

  test "should not save without name" do
    @treatment.name = nil
    assert_not @treatment.valid?
  end

  test "should not save without administered_at" do
    @treatment.administered_at = nil
    assert_not @treatment.valid?
  end

  test "should not save without appointment" do
    @treatment.appointment = nil
    assert_not @treatment.valid?
  end
end