class PurchasesController < ApplicationController
	def index
		@purchases = Purchase.all
	end

	def new
		@purchase = Purchase.new
		# authorize @purchase
	end
end
