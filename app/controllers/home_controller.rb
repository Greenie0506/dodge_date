class HomeController < ApplicationController
  def index
  end

  def call_me
    @call = Call.new(params[:number])
    render text: ""
  end
end
