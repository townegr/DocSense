class Encounter < ActiveRecord::Base
  belongs_to :patient
  belongs_to :user
  belongs_to :procedure

  validates :patient, presence: true
  validates :user, presence: true
  validates :procedure, presence: true
end
