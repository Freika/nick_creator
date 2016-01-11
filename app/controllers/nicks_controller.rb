class NicksController < ApplicationController
  def index
  end

  def create
    render text: Nick.generate
  end
end
