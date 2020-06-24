# frozen_string_literal: true

class Producers::SessionsController < Devise::SessionsController
  before_action :reject_producer, only: [:create]

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def reject_producer
    @producer = Producer.find_by(email: params[:producer][:email].downcase)
    if @producer
      if (@producer.valid_password?(params[:producer][:password]) && (@producer.active_for_authentication? == false))
        flash[:alert] = "退会済みのユーザーです。"
        redirect_to new_producer_session_path
      end
    else
      flash[:alert] = "必須項目を入力してください。"
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
