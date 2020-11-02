class User < ApplicationRecord
  validates :uid,
    presence: true,
    uniqueness: { scope: [:platform] }

  validates :platform, presence: true

  has_many :repositories, dependent: :destroy
  has_many :issues, through: :repositories
end
