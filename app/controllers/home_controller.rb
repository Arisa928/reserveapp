class HomeController < ApplicationController
  def top
  end
  
  before_action :set_search

  def set_search
    @q = Room.ransack(params[:q])
    @results = @q.result

    @tokyo = Room.ransack(q: "tokyo")
    @tokyo_results = @tokyo.result
  end

  def index
    @q = Room.ransack(params[:q])
    @rooms = Room.all


  end
end
