class Patient < ActiveRecord::Base
  attr_accessible :currentMedication, :dateOfBirth, :email, :emergencyContactNumber, :emergencyContactPerson, :existingDiagnoses, :firstName, :lastName, :mailingAddress, :phoneNumber, :sex, :therapist_id
  belongs_to :therapist

end
