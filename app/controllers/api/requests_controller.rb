class Api::RequestsController < ApplicationController
  before_action :authenticate_user
  
  def index
    @requests = Request.all
    render 'index.json.jbuilder'
  end

  def create
    request = Request.find_by(requester_id: params[:requester_id], requestee_id: params[:requestee_id]) || 
              Request.find_by(requester_id: params[:requestee_id], requestee_id: params[:requester_id])

    if request && request.pending? && params[:approval] == "true"
      request.confirmed!
    elsif request && request.status == nil
      request.pending!
    elsif !request
      request = Request.new(
                            requester_id: params[:requester_id], 
                            requestee_id: params[:requestee_id]
                            )
      request.save
      request.pending! if params[:approval] == "true"
    end

    request.denied! if params[:approval] == "false"

    render json: {status: request.status}
  end

  def show
    @requests = Request.find(params[:id])
    render 'show.json.jbuilder'
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    render json: { message: "Successfully destroyed request with id #{@request.id}"}
  end

  def reset_demo
    Message.destroy_all
    Request.destroy_all


    user_1 = User.find_by(email: "geralt@gmail.com")
    user_2 = User.find_by(email: "yen@gmail.com")
    user_3 = User.find_by(email: "ciri@gmail.com")
    user_4 = User.find_by(email: "jeff@gmail.com")
    user_5 = User.find_by(email: "sessions@gmail.com")
    user_6 = User.find_by(email: "zane@gmail.com")
    user_7 = User.find_by(email: "simon@gmail.com")
    user_8 = User.find_by(email: "shannon@gmail.com")
    user_9 = User.find_by(email: "tommie@gmail.com")
    user_10 = User.find_by(email: "malcolm@gmail.com")
    user_11 = User.find_by(email: "bret@gmail.com")
    user_13 = User.find_by(email: "william@gmail.com")
    user_14 = User.find_by(email: "scott@gmail.com")
    user_15 = User.find_by(email: "wilbur@gmail.com")


    Request.create!([
      {status: "pending", requestee_id: user_1.id, requester_id: user_4.id},
      {status: "pending", requestee_id: user_1.id, requester_id: user_5.id},
      {status: "pending", requestee_id: user_1.id, requester_id: user_6.id},
      {status: "pending", requestee_id: user_1.id, requester_id: user_7.id},
      {status: "pending", requestee_id: user_1.id, requester_id: user_8.id},
      {status: "pending", requestee_id: user_1.id, requester_id: user_9.id},
      {status: "pending", requestee_id: user_1.id, requester_id: user_13.id},
      {status: "pending", requestee_id: user_1.id, requester_id: user_14.id},
      {status: "pending", requestee_id: user_1.id, requester_id: user_15.id},
      
      {status: "pending", requestee_id: user_2.id, requester_id: user_5.id},
      {status: "pending", requestee_id: user_2.id, requester_id: user_6.id},
      {status: "pending", requestee_id: user_2.id, requester_id: user_7.id},
      {status: "pending", requestee_id: user_2.id, requester_id: user_8.id},
      {status: "pending", requestee_id: user_2.id, requester_id: user_9.id},
      {status: "pending", requestee_id: user_2.id, requester_id: user_10.id},
      {status: "pending", requestee_id: user_2.id, requester_id: user_11.id},

      {status: "pending", requestee_id: user_3.id, requester_id: user_4.id},
      {status: "pending", requestee_id: user_3.id, requester_id: user_5.id},
      {status: "pending", requestee_id: user_3.id, requester_id: user_6.id},
      {status: "pending", requestee_id: user_3.id, requester_id: user_7.id},
      {status: "pending", requestee_id: user_3.id, requester_id: user_8.id},
      {status: "pending", requestee_id: user_3.id, requester_id: user_9.id},
      {status: "pending", requestee_id: user_3.id, requester_id: user_13.id},
      {status: "pending", requestee_id: user_3.id, requester_id: user_14.id},
      {status: "pending", requestee_id: user_3.id, requester_id: user_15.id}
    ])

    render json: {message: "reset requests and messages"}
  end
end
