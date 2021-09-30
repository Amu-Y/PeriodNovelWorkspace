class Workspace < ApplicationRecord

  belongs_to :user
  has_many :novels, dependent: :destroy
  has_many :words, dependent: :destroy

  validates :noveltitle, presence: true
  validates :overview, presence: true
end
