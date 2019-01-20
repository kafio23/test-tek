class PurchasesController < ApplicationController
	def index
		@purchases = Purchase.all
	end

	def new
		@purchase = Purchase.new
		# authorize @purchase
	end

	def create
		@purchase = Purchase.new(purchase_params)
		respond_to do |format|
			if @purchase.save
				format.html { redirect_to request.referrer, notice: "El Pedido-#{@purchase.id} se creó correctamente." }
        format.js
			else
				format.html { redirect_to request.referrer, alert: "Ocurrió un error: #{@purchase.errors}" }
        format.js
			end
		end
	end

	private
		def purchase_params
			params.require(:purchase).permit(:description, :category, :image, :user_id,
				:status, :delivery_date, :reception_date)
		end
end
