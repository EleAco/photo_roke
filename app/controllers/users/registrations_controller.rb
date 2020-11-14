# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @page_name = "新規登録ページ"
    super
  end

  # POST /resource
  def create
    @page_name = "新規登録ページ"
    super
  end

  # GET /resource/edit
  def edit
    @page_name = "プロフィール編集画面"
    super
  end

  # PUT /resource
  def update
    super
    # if account_update_params[:avatar].present?
    #   @user.avatar.attach(account_update_params[:avatar])
    # end
    # @user.update(account_update_params)
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # ende

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile, :avatar])
  end

  # def user_params
  #   params.require(:user)
  #         .permit(:profile, :abatar)
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end
