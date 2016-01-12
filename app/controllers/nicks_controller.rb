class NicksController < ApplicationController
  def index
  end

  def create
    nick = Nick.generate
    render json: nick
  end
end
