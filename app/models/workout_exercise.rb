# frozen_string_literal: true

class WorkoutExercise < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise
end
