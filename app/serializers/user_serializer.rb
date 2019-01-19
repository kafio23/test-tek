class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :role, :last_sign_in_at, :last_sign_in_ip
end