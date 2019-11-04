class Task < ApplicationRecord
  belongs_to :list
  validates :name, :description, presence: true
end
