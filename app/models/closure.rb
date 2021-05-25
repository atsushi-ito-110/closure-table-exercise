class Closure < ApplicationRecord
  belongs_to :comment, class_name: 'Comment', foreign_key: 'ancestor_id'
  # has_many :replies,
  belongs_to :reply,  class_name: 'Comment', foreign_key: 'descendant_id'

  # belongs_to :comment, foreign_key: 'descendant_id'
end
