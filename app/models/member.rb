class Member < ApplicationRecord
  # Direct associations

  belongs_to :family

  has_many   :owners,
             :dependent => :destroy

  # Indirect associations

  has_many   :vessels,
             :through => :owners,
             :source => :vessels

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
