class ApplicationController < ActionController::Base
  protect_from_forgery
  def request_ip
     request.ip
  end
end
