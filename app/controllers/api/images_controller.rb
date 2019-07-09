class Api::ImagesController < ApplicationController
  def index
    @images = Image.all
    render 'index.json.jbuilder'  
  end

  def create
    @image = Image.new(
                       user_id: params[:user_id],
                       file: params[:file]
                       )
    @image.save
    render json: {message: "you did it!"}
  end

  def show
    @hangout = Hangout.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    
  end

  def destroy
    @image = Image.find(params[:id])
    if @image.destroy
      render json: { message: "Successfully destroyed image"}
    end
  end
end
