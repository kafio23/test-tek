class Api::V1::PurchasesController < ApplicationController
	# before_action :set_article, only: [:show, :update, :destroy]
	def index
		@purchase = Purchase.all
		render json: @purchase
	end
	
	def show
	end
  #   # GET /articles/1
  #   def show
  #    render json: @article
  #   end
  #   # POST /articles
  #   def create
  #    @article = Article.new(article_params)
  #    if @article.save
  #     render json: @article, status: :created, location:        api_v1_article_url(@article)
  #    else
  #     render json: @article.errors, status: :unprocessable_entity
  #    end
  #   end
  #   # PATCH/PUT /articles/1
  #   def update
  #    if @article.update(article_params)
  #     render json: @article
  #    else
  #     render json: @article.errors, status: :unprocessable_entity
  #    end
  #   end
  #  # DELETE /articles/1
  #   def destroy
  #    @article.destroy
  #   end
  #   private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_article
  #    @article = Article.find(params[:id])
  #   end
  #   # Only allow a trusted parameter “white list” through.
  #   def article_params
  #   params.require(:article).permit(:title, :content, :slug)
  #   end
end