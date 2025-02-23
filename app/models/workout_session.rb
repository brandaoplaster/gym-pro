# frozen_string_literal: true

class WorkoutSession < ApplicationRecord
  belongs_to :user
  belongs_to :workout

  validates :started_at, presence: true
end
