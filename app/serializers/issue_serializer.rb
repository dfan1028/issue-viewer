class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :number, :remote_created_at, :description
end
