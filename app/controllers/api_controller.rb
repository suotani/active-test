class ApiController < ApplicationController
  protect_from_forgery
  skip_before_action :verify_authenticity_token
end