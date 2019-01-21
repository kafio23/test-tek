class Api::V1::PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :update, :destroy]
  before_action :authenticate_request!
  
  # GET /api/v1/purchases
	def index
		@purchases = Purchase.all
		@purchases = current_user.purchases unless current_user.admin?
		render json: @purchases
  end
	
  # GET /api/v1/purchases/1
  def show
    render json: @purchase
  end

  # POST /api/v1/purchases
  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user_id = current_user.id
    @purchase.user = current_user
    if current_user.admin?
      @user = User.find(purchase_params[:user_id])
      @purchase.user_id = @user.id
      @purchase.user = @user
    end

    if @purchase.save
      render json: @purchase, status: :created, location: api_v1_purchase_url(@purchase)
    else
      render json: @purchase.errors, status: :unprocessable_entity
    end
  end
  #   # PATCH/PUT /purchases/1
  #   def update
  #    if @purchase.update(purchase_params)
  #     render json: @purchase
  #    else
  #     render json: @purchase.errors, status: :unprocessable_entity
  #    end
  #   end
  #  # DELETE /purchases/1
  #   def destroy
  #    @purchase.destroy
  #   end
  private
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    def purchase_params
      params.require(:purchase).permit(:description, :user_id) # if params[:purchase]
    end
end