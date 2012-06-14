class CallController < ApplicationController
  def index
  end

  def create
    @call = Call.create!(number: params[:number])
    @call.delay(run_at: Call::CALL_TIMES[params[:time]]).make_call

    render text: "Your call has been placed"
  end
end
