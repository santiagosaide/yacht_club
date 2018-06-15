class Owner < ApplicationRecord
  # Direct associations

  belongs_to :vessels,
             :class_name => "Vessel"

  belongs_to :member

  # Indirect associations

  # Validations

end
