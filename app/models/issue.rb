class Issue < ApplicationRecord
  belongs_to :repository

  validates :repository_id, :remote_id, presence: true
end
