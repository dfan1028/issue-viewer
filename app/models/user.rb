class User < ApplicationRecord
  validates :uid,
    presence: true,
    uniqueness: { scope: [:platform] }

  validates :platform, presence: true

  has_many :repositories, dependent: :destroy
  has_many :issues, through: :repositories

  after_create :import_data

  private

  def import_data
    case platform
    when 'github'
      GithubService::Repository.new(self).import_data!
    end
  end
end
