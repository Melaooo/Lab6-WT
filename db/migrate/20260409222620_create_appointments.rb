class CreateAppointments < ActiveRecord::Migration[8.1]
  def change
    create_table :appointments do |t|
      t.integer :pet_id
      t.integer :vet_id
      t.datetime :date
      t.string :reson
      t.integer :status

      t.timestamps
    end
  end
end
