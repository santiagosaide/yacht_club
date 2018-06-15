class Family < ApplicationRecord
  # Direct associations

  has_many   :members,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
