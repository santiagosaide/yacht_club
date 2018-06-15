class Vessel < ApplicationRecord
  # Direct associations

  has_many   :owners,
             :foreign_key => "vessels_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
