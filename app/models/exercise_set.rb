# frozen_string_literal: true

class ExerciseSet < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise

  validates :sets, numericality: { only_integer: true, greater_than: 0 }
  validates :reps, numericality: { only_integer: true, greater_than: 0 }
end
