# frozen_string_literal: true

module Backoffice
  class UsersController < BackofficeApplication
    before_action :set_user, only: %i[show edit update destroy]

    def index
      @users = User.all
    end

    def show
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = "User was successfully created."
        redirect_to backoffice_users_path
      else
        flash[:error] = "Failed to create user. Please check the form for errors."
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @user.update(user_params)
        flash[:notice] = "User was successfully updated."
        redirect_to backoffice_users_path
      else
        flash[:error] = "Failed to update user. Please check the form for errors."
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if @user.destroy
        flash[:notice] = "User was successfully destroyed."
      else
        flash[:error] = "Failed to destroy user."
      end
      redirect_to backoffice_users_path
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :birth_date, :gender, :password, :password_confirmation, :email)
    end
  end
end
