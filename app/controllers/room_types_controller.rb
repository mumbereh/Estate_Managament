class RoomTypesController < ApplicationController
    def index
      @room_types = RoomType.all
    end
  
    def show
      @room_type = RoomType.find(params[:id])
    end
  
    def new
      @room_type = RoomType.new
    end
  
    def create
      @room_type = RoomType.new(room_type_params)
      if @room_type.save
        redirect_to room_types_path, notice: 'Room type was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @room_type = RoomType.find(params[:id])
    end
  
    def update
      @room_type = RoomType.find(params[:id])
      if @room_type.update(room_type_params)
        redirect_to room_types_path, notice: 'Room type was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @room_type = RoomType.find(params[:id])
      @room_type.destroy
      redirect_to room_types_path, notice: 'Room type was successfully destroyed.'
    end
  
    private
  
    def room_type_params
      params.require(:room_type).permit(:code, :status_name, :description)
    end
  end
  