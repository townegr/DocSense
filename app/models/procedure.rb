class Procedure < ActiveRecord::Base
  validates :description, presence: true
  validates :code, presence: true
  validates :work_rvu, presence: true

  has_many :encounters
  has_many :users, through: :encounters
end
