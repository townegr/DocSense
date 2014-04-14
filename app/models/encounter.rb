class Encounter < ActiveRecord::Base
  belongs_to :user
  belongs_to :procedure

  validates :user, presence: true
  validates :procedure, presence: true
end
