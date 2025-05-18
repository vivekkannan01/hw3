class PlacesController < ApplicationController

  def index
    # find all Place rows
    @places = Place.all
    # render places/index view
  end

  def show
    # find a Place
    @place = Place.find_by({"id" => params["id"]})
    # Get all entries for this place
    @entries = Entry.where({"place_id" => @place["id"]})
 
    # render places/show view with details about Company
  end

  def new
    # render view with new Place form
    @place = Place.new
  end

  def create
    
    # start with a new Place
    @place = Place.new
    
    # assign user-entered form data to Place's columns
    @place["name"] = params["name"]
   
    # save Place row
    @place.save

    # redirect user
    redirect_to "/places"
  end 

end
