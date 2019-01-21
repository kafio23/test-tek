class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :status, :user_id, :user
  
  private
  def user
      UserSerializer.new(object.users).attributes
  end
end
