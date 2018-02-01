class ApplicationController < ActionController::Base
  include CurrentUser

    add_flash_types :error, :success

  protect_from_forgery with: :exception
end
