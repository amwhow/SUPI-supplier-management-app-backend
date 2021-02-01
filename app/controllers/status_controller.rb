class StatusController < ApplicationController
  before_action :authenticate_user

  def index
    render status: :ok
  end
end
