class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :email
      t.string :firstName
      t.string :lastName
      t.string :sex
      t.string :dateOfBirth
      t.string :phoneNumber
      t.string :mailingAddress
      t.string :emergencyContactPerson
      t.string :emergencyContactNumber
      t.string :existingDiagnoses
      t.string :currentMedication
      t.integer :therapist_id

      t.timestamps
    end
  end
end
