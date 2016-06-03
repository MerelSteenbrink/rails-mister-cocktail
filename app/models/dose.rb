class Dose < ActiveRecord::Base
  belongs_to :cocktail
  belongs_to :ingredient



  validates :description, presence: true

  validates :cocktail, presence: true
  validates :cocktail, uniqueness: { scope: :ingredient_id, message: :"Sorry, already exists" }

  validates :ingredient, presence: true


end
