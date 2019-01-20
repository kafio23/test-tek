class PurchasesController < ApplicationController
	before_action :set_purchase, only: [:show]

	def index
		@purchases = Purchase.all
	end

	def new
		@purchase = Purchase.new
		# authorize @purchase
	end

	def create
		@purchase = Purchase.new(purchase_params)
    if @purchase.save
      redirect_to purchase_path(@purchase), notice: "El Pedido-#{@purchase.id} se creó correctamente."
    else
      render :new, alert: 'Error en:'
    end
	end

	def show
	end

	private
		def set_purchase
			@purchase = Purchase.find(params[:id])
		end

		def purchase_params
			params.require(:purchase).permit(:description, :category, :image, :user_id,
				:status, :delivery_date, :reception_date)
		end
end
