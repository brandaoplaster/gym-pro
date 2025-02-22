# frozen_string_literal: true

module Backoffice
  class WorkoutsController < BackofficeApplication
    before_action :set_workout, only: %i[show edit update destroy]

    def index
      @workouts = Workout.all
    end

    def show
    end

    def new
      @workout_sheets = WorkoutSheet.all
      @workout = Workout.new
    end

    def create
      @workout = Workout.new(workout_params)
      if @workout.save
        flash[:notice] = "Workout sheet was successfully created."
        redirect_to backoffice_workouts_path
      else
        flash[:error] = "Failed to create workout. Please check the form for errors."
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @workout_sheets = WorkoutSheet.all
    end

    def update
      if @workout.update(workout_params)
        flash[:notice] = "Workout sheet was successfully updated."
        redirect_to backoffice_workouts_path
      else
        lash[:error] = "Failed to update workout. Please check the form for errors."
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if @workout.destroy
        flash[:notice] = "Workout was successfully destroyed."
      else
        flash[:error] = "Failed to destroy exercise."
      end
      redirect_to backoffice_workouts_path
    end

    private

    def set_workout
      @workout = Workout.find(params[:id])
    end

    def workout_params
      params.require(:workout).permit(:name, :workout_sheet_id,
        exercise_sets_attributes: [:id, :exercise_id, :sets, :reps, :_destroy])
    end
  end
end
