# frozen_string_literal: true

module Backoffice
  class ExercisesController < BackofficeApplication
    before_action :set_exercise, only: %i[show edit update destroy]

    def index
      @exercises = Exercise.all
    end

    def show
    end

    def new
      @exercise = Exercise.new
    end

    def create
      @exercise = Exercise.new(exercise_params)
      if @exercise.save
        flash[:notice] = "Exercise was successfully created."
        redirect_to backoffice_exercises_path
      else
        flash[:error] = "Failed to create exercise. Please check the form for errors."
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @exercise.update(exercise_params)
        flash[:notice] = "Exercise was successfully updated."
        redirect_to backoffice_exercises_path
      else
        flash[:error] = "Failed to update exercise. Please check the form for errors."
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if @exercise.destroy
        flash[:notice] = "Exercise was successfully destroyed."
      else
        flash[:error] = "Failed to destroy exercise."
      end
      redirect_to backoffice_exercises_path
    end

    private

    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    def exercise_params
      params.require(:exercise).permit(:name, :description)
    end
  end
end
