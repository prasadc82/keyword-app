class HomeController < ApplicationController

  def index
    result = { name: :prasadc }
    render json: result
  end
end
