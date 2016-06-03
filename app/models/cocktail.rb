class Cocktail < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses


  validates :name, presence: true
  validates :name, uniqueness: true

end
