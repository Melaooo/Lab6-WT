require "test_helper"

class TreatmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appointment = appointments(:one)
    @treatment = treatments(:one)
  end

  test "should create treatment" do
    assert_difference("Treatment.count") do
      post appointment_treatments_url(@appointment), params: {
        treatment: {
          name: "Vaccine",
          administered_at: Time.now
        }
      }
    end

    assert_redirected_to appointment_url(@appointment)
  end

  test "should not create invalid treatment" do
    post appointment_treatments_url(@appointment), params: {
      treatment: { name: "" }
    }

    assert_response :unprocessable_entity
  end

  test "should update treatment" do
    patch appointment_treatment_url(@appointment, @treatment), params: {
      treatment: { name: "Updated" }
    }

    assert_redirected_to appointment_url(@appointment)
  end

  test "should destroy treatment" do
    assert_difference("Treatment.count", -1) do
      delete appointment_treatment_url(@appointment, @treatment)
    end

    assert_redirected_to appointment_url(@appointment)
  end
end