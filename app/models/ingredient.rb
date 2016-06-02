class Ingredient < ActiveRecord::Base
  has_many :doses
  validates :name, presence: true
  validates :name, uniqueness: true


end
