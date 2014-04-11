class Procedure < ActiveRecord::Base
  validates :code, numericality: { only_integer: true }
  validates :description, presence: true
  validates_format_of :work_rvu, :with => /\d{0,10}\.\d{2}/

  has_many :users, through: :encounters
  has_many :patients, through: :encounters
end
