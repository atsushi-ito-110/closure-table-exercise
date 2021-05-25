class Comment < ApplicationRecord
  validates :body, presence: true
  has_many :closures, foreign_key: 'ancestor_id'
  has_many :replies, through: :closures, source: :reply
end
