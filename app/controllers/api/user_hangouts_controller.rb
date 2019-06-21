class Api::UserHangoutsController < ApplicationController
  def index
    @user_hangouts = UserHangout.all
    render 'index.json.jbuilder'
  end

  def create
    @user_hangout = UserHangout.new(
                                    user_id: params[:user_id],
                                    hangout_id: params[:hangout_id]
                                    )
    if @user_hangout.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @user_hangout.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @user_hangout = UserHangout.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @user_hangout = UserHangout.find(params[:id])

    @user_hangout.user_id = params[:user_id] || @user_hangout.user_id
    @user_hangout.hangout_id = params[:user_id] || @user_hangout.hangout_id

    if @user_hangout.save
      render 'show.json.jbuilder'
    else
      render json: { message: @user_hangout.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user_hangout = UserHangout.find(params[:id])
    @user_hangout.destroy
    render json: { message: "Successfully destroyed user_hangout with id #{@user_hangout.id}"}
  end
end
