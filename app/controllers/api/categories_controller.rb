class Api::CategoriesController < ApplicationController

  def index
    @categories = Category.all 
    render 'index.json.jbuilder'
  end

  def create
    @category = Category.new(
                             name: params[:name]
                             )
    if @category.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
    end  
  end

  def show
    @category = Category.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @category = Category.find(params[:id])

    @category.name = params[:name] || @category.name

    if @category.save
      render 'show.json.jbuilder'
    else
      render json: { message: @category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    render json: { message: "Successfully destroyed category #{@category.name} with id #{@category.id}"}
  end
end
