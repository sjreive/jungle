class Admin::SalesController < ApplicationController

  def index
    @sales =  Sale.order(id: :desc).all
  end

  def new
    @sale = Sale.new 
  end

end
