class Review < ActiveRecord::Base
  belongs_to :restaurant

  validates :rating, presence: true, numericality:{only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :body, presence: true
  validates :restaurant_id, presence: true, numericality: {only_integer: true}

end
