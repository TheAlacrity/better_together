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
    @images = Image.all
    render 'index.json.jbuilder'
  end

  def show
    
  end

  def update
    
  end

  def destroy
    
  end
end
