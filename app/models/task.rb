class Task < ActiveRecord::Base
  validates :description, presence: true
  validates :user_id, presence: true
end