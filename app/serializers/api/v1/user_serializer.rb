class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email
  
end
