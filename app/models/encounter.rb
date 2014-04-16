class Encounter < ActiveRecord::Base
  belongs_to :user
  belongs_to :procedure

  validates :patient_name, presence: true
  validates :insurance_provider, presence: true
  validates :user, presence: true
  validates :procedure, presence: true

  def set_physician_fee
    self.physician_fee = user.dollar_per_rvu * procedure.work_rvu
  end
end
