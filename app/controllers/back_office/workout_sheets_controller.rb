module BackOffice
  class WorkoutSheetsController < ApplicationController
    before_action :set_workout_sheet, only: %i[show edit update destroy]

    def index
      @workout_sheets = WorkoutSheet.all
    end

    def show
    end

    def new
      @users = User.all
      @workout_sheet = WorkoutSheet.new
    end

    def create
      @workout_sheet = WorkoutSheet.new(workout_sheet_params)
      if @workout_sheet.save
        redirect_to workout_sheets_path, notice: "Workout sheet was successfully created."
      else
        render :new
      end
    end

    def edit
      @users = User.all
    end

    def update
      if @workout_sheet.update(workout_sheet_params)
        redirect_to workout_sheets_path, notice: "Workout sheet was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      @workout_sheet.destroy
      redirect_to workout_sheets_url, notice: "Workout sheet was successfully destroyed."
    end

    private

    def set_workout_sheet
      @workout_sheet = WorkoutSheet.find(params[:id])
    end

    def workout_sheet_params
      params.require(:workout_sheet).permit(:title, :user_id)
    end
  end
end
