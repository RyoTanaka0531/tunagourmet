class Producer::ProducersController < ApplicationController
  def show
    @producer = Producer.find(params[:id])
  end

  def create
    @producer = Producer.new(producer_params)
    @producer.save
    redirect_to root_path
  end

  def edit
    @producer = Producer.find(params[:id])
  end

  def update
    @producer = Producer.find(params[:id])
    @producer.update(producer_params)
    redirect_to producer_path(@producer.id)
  end

  # 退会ページへ遷移
  def quit
    @producer = Producer.find(params[:id])
  end

  def index
    @producers = Producer.all
  end

  private
  def producer_params
    params.require(:producer).permit(:name, :kana_name, :company_name, :kana_company_name, :phone_number, :postcode, :address, :hp, :description)
  end
end
