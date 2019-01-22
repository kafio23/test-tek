class PurchasesController < ApplicationController
	include SessionsHelper
	before_action :set_purchase, only: [:show, :edit, :update, :destroy]

	def index
		if logged_in?
			if current_user.admin?
				@purchases = Purchase.all.order(:id)
			else
				@purchases = Purchase.where(user_id: current_user.id).order(:id)
			end
		end
	end

	def list
		@purchases = Purchase.all
	end

	def new
		@purchase = Purchase.new
		# authorize @purchase
	end

	def edit
	end

	def update
		if @purchase.update purchase_params
			redirect_to purchase_path(@purchase), notice: "El Pedido ##{@purchase.id} se modificó correctamente."
		else
			render :edit, alert: 'Error en:'
		end
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

	def destroy
		if @purchase.destroy
			redirect_to purchases_path, notice: "Pedido ##{@purchase.id} eliminado."
		else
			redirect_to purchases_path, notice: "No se puede eliminar Pedido ##{@purchase.id}"
		end
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
