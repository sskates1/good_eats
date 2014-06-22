class Restraunt < ActiveRecord::Base
  belongs_to :television_show

  validates :rating, presence: true
  validates :body, presence: true
  validates :restraunt_id, presence: true, numericality: {only_integer: true}

end
