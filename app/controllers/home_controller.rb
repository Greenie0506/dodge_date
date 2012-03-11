class HomeController < ApplicationController
  def index
  end

  def call_me
    @call = Call.new(params[:number])
    @call.make_call

    render text: "Your call has been placed"
  end
end
