class CallController < ApplicationController
  def index
    render :new
  end

  def create
    if @call.nil?
      @call = Call.create!(number: params[:call][:number])
      @call.delay(run_at: params[:call][:time]).make_call
      render :show
    else
      logger.debug "Your call is nill"
    end
  end

  def show
  end

  def voice
    render :file => 'public/voice.txt', :content_type => 'text/xml', :layout => false
  end
end
