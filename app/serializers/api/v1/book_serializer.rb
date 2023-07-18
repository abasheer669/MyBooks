class Api::V1::BookSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title , :body, :price ,:author, :genre, :isbn
end
