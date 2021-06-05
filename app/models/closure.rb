class Closure < ApplicationRecord
  belongs_to :comment, foreign_key: 'ancestor_id'
  belongs_to :reply,  class_name: 'Comment', foreign_key: 'descendant_id'
end
