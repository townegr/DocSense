class Patient < ActiveRecord::Base
  validates :name, presence: true

  has_many :users, through: :encounters
  has_many :procedures, through: :encounters
end
