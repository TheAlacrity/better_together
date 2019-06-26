class Api::RequestsController < ApplicationController
  
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
end
