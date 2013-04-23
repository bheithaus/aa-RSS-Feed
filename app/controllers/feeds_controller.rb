class FeedsController < ApplicationController
  def index
    @feeds = Feed.all

    respond_to do |format|
      format.json { render json: @feeds }
      format.html { render :index }
    end
  end

  def create
    @feed = Feed.new(params[:feed])

    if @feed.save
      render json: @feed
    else
      render json: @feed.errors, status: 422
    end
  end
end
