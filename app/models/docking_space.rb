class DockingSpace < ApplicationRecord
  # Direct associations

  belongs_to :vessell,
             :class_name => "Vessel"

  # Indirect associations

  # Validations

end
