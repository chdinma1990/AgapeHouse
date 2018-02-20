class ApplicationController < ActionController::Base
	require "openssl"
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
end
