class User < ApplicationRecord
  validates :uid,
    presence: true,
    uniqueness: { scope: [:platform] }

  validates :platform, presence: true
end
