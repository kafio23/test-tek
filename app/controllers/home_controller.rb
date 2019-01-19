class HomeController < ApplicationController
  # before_action :authenticate_request!
  
  def index
  end

  def test
    render json: {'logged_in' => true}
  end
end
