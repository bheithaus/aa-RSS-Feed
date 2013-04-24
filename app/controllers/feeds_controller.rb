class FeedsController < ApplicationController
  def index
    @feeds = Feed.all
    @entries = Entry.all

    respond_to do |format|
      format.json { render json: @feeds }
      format.html { render :index }
    end
  end

  def create
    @feed = Feed.new_feed(params[:feed][:url])

    if @feed.save
      render json: @feed
    else
      render json: @feed.errors, status: 422
    end
  end

  def destroy
    @feed = Feed.find(params[:id])

    @feed.delete
    render json: @feed
  end
end
