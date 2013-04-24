class EntriesController < ApplicationController
  respond_to :json

  def index
    if params.include?(:feed_id)
      @entries = Entry.all
      #where("feed_id = ?", params[:id])
    end
    render :json => @entries
  end
end
