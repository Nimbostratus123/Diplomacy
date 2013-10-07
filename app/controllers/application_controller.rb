class ApplicationController < ActionController::Base
  protect_from_forgery
	include SessionsHelper
	include ApplicationHelper
	include UsersHelper
	include PagesHelper
	include UnitsHelper
	include MessagesHelper
end
