class LocationsController < ApplicationController
 
  # GET /locations/1
  # GET /locations/1.json
  def show
    @saved_locations = Location.find_all_by_user_id(params[:user_id])
    @user = User.find_by_id(params[:user_id])
    
    @location = Location.find(params[:id])
    media = Instagram.media_search(@location.latitude.to_s, @location.longitude.to_s)
    @pictures = media.data

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(:address => params[:address], :user_id => params[:user_id])    

    respond_to do |format|
       if @location.save
        format.html { redirect_to user_location_path( @location.user_id , @location.id), notice: 'Location was successfully created.' }
        format.json { render json: @location, status: :created, location: @location }
       else
         format.html { redirect_to user_path, notice: "The location could not be created." }
         format.json { render json: @location.errors, status: :unprocessable_entity }
       end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to user_path }
      format.json { head :no_content }
    end
  end


  # # GET /locations
  # # GET /locations.json
  # def index
  #   @locations = Location.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @locations }
  #   end
  # end

  # GET /locations/new
  # GET /locations/new.json
  # def new
  #   @location = Location.new
  #   @users = User.all

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @location }
  #   end
  # end

  # # GET /locations/1/edit
  # def edit
  #   @location = Location.find(params[:id])
  # end

 

  # PUT /locations/1
  # PUT /locations/1.json
  # def update
  #   @location = Location.find(params[:id])

  #   respond_to do |format|
  #     if @location.update_attributes(params[:location])
  #       format.html { redirect_to @location, notice: 'Location was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @location.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

end
