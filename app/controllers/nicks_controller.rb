class NicksController < ApplicationController
  def index
  end

  def create
    nick = Nick.generate_nord(params[:game], params[:race], params[:sex])
    render json: nick
  end
end
