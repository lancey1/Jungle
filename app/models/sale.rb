class Sale < ActiveRecord::Base
  def self.active
    Sale.where("starts_on <= ? AND ends_on >= ?", Date.current, Date.current)
  end
  def finished?
    ends_on < Date.current
  end
  def upcoming?
    starts_on > Date.current
  end
  def active?
    !finished? && !upcoming?
  end
end