class Vessel < ApplicationRecord
  # Direct associations

  has_one    :docking_space,
             :foreign_key => "vessell_id",
             :dependent => :destroy

  has_many   :owners,
             :foreign_key => "vessels_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
