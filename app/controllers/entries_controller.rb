class EntriesController < ApplicationController

  def new
    @place = Place.find_by({ "id" => params["place_id"] })
    @entry = Entry.new
  end
  
  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["date"] = params["date"]
    @entry["place_id"] = params["place_id"]  # pulled from hidden field
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end