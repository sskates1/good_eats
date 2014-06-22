class Restraunt < ActiveRecord::Base
  has_many :television_show

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true


end
