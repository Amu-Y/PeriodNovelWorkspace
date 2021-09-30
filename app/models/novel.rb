class Novel < ApplicationRecord

  belongs_to :workspace

  validates :chapter, presence: true
  validates :novelbody, presence: true
end
