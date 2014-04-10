class Schedule < ActiveRecord::Base
  def after_initialize
    self.day ||= Date.today if new_record?
  end
end
