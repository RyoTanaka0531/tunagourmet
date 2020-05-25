class Producer::ProducersController < ApplicationController
  def show
  end

  def create
    @producer = Producer.new(producer_params)
    @producer.save
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def quit
  end

  def index
  end

  private
  def producer_params
    params.require(:producer).permit(:email)
  end
end
