class Word < ApplicationRecord
  
  belongs_to :workspace
  
  validates :word, presence: true
  validates :commentary, presence: true
end
