# frozen_string_literal: true

class Workout < ApplicationRecord
  belongs_to :workout_sheet
  has_many :exercise_sets, dependent: :destroy
  has_many :exercises, through: :exercise_sets

  accepts_nested_attributes_for :exercise_sets, allow_destroy: true
end
