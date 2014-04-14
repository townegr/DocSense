class Procedure < ActiveRecord::Base
  validates :description, presence: true
  #include regex or validation for code for (5) letters/digits
  validates :patient_name, presence: true
  validates :code, presence: true
  validates :work_rvu, presence: true
  # validates_format_of :work_rvu, :with => /\d{0,10}\.\d{2}/

  has_many :encounters
  has_many :users, through: :encounters
end
