class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :status, :user_id
end
