class Character < ApplicationRecord
  belongs_to :game
  validates_presence_of :name
  # validates_inclusion_of :power, in: %w(flying jumping teleport invisible)
end
