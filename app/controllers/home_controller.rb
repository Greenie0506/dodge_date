class HomeController < ApplicationController
  def voice
    render :file => 'public/voice.txt', :content_type => 'text/xml', :layout => false
  end
end
