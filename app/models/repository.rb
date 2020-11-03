class Repository < ApplicationRecord
  belongs_to :user
  has_many :issues, dependent: :destroy

  validates :full_name, :remote_id, :user_id, presence: true
end
