class Board < ApplicationRecord
  after_create :lists_default
  belongs_to :user
  has_many :lists, dependent: :destroy
  validates :name, presence: true

  def lists_default
    List.create!(board_id: self.id, name: "TO DO")
    List.create!(board_id: self.id, name: "DOING")
    List.create!(board_id: self.id, name: "DONE")
  end
  
end
