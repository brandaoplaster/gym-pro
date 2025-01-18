class WorkoutsController < ApplicationController
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
      redirect_to workouts_path, notice: "Workout sheet was successfully created."
    else
      render :new
    end
  end

  def edit
    @workout_sheets = WorkoutSheet.all
  end

  def update
    if @workout.update(workout_params)
      redirect_to workouts_path, notice: "Workout sheet was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @workout.destroy
    redirect_to workouts_url, notice: "Workout sheet was successfully destroyed."
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:name, :workout_sheet_id)
  end
end
