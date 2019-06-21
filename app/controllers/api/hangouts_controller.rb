class Api::HangoutsController < ApplicationController
  # before_action :authenticate_user

  def index
    @hangouts = Hangout.all
    render 'index.json.jbuilder'
  end

  def create
    # if current_user
      @hangout = Hangout.new(
                             name: params[:name],
                             address: params[:address],
                             category_id: params[:category_id]
                             )

      if @hangout.save
        render 'show.json.jbuilder'
      else
        render json: { errors: @hangout.errors.full_messages }, status: :uprocessable_entity
      end

    # else
    #   render json: {}, status: :unauthorized
    # end
  end

  def show
    @hangout = Hangout.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @hangout = Hangout.find(params[:id])

    @hangout.name = params[:name] || @hangout.name
    @hangout.address = params[:address] || @hangout.address
    @hangout.category_id = params[:category_id] || @hangout.category_id


    if @hangout.save
      render 'show.json.jbuilder'
    else
      render json: { message: @hangout.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @hangout = Hangout.find(params[:id])
    @hangout.destroy
    render json: { message: "Successfully destroyed hangout #{@hangout.name} with id #{@hangout.id}"}
  end
end
