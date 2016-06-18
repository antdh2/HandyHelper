class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @offers = Offer.all
  end

  def show
  end

  def new
    @offer = Offer.new
    @task = Task.find(params[:task_id])
  end

  def edit
  end

  def create
    @offer = Offer.new(offer_params)
    # this finds the task from the URL
    @task = Task.find(params[:task_id])
    # this makes @seller equal to the current tasks user
    @seller = @task.user

    # now to set information in the offer database

    # set task_id equal to the current task id
    @offer.task_id = @task.id
    # set buyer_id equal to the current logged in user id
    @offer.buyer_id = current_user.id
    # finally set seller id equal to tasks creator user id
    @offer.seller_id = @seller.id


    respond_to do |format|
      if @offer.save
        format.html { redirect_to root_url, notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { redirect_to new_task_offer_path(@task), alert: 'Something was wrong with the price' }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:price, :status, :is_accepted)
    end
end
