# frozen_string_literal: true

class WorkoutSheet < ApplicationRecord
  belongs_to :user
  has_many :workouts
end
