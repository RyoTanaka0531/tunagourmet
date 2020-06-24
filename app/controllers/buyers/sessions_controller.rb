# frozen_string_literal: true

class Buyers::SessionsController < Devise::SessionsController
  before_action :reject_buyer, only: [:create]
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

  def reject_buyer
    @buyer = Buyer.find_by(email: params[:buyer][:email].downcase)
    if @buyer
      if (@buyer.valid_password?(params[:buyer][:password]) && (@buyer.active_for_authentication? == false))
        flash[:alert] = "退会済みのユーザーです。"
        redirect_to new_buyer_session_path
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
