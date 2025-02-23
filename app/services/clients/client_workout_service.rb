# frozen_string_literal: true

module Clients
  class ClientWorkoutService
    def initialize(client)
      @client = client
    end

    def last_workout_session
      workout_session_query.where.not(finished_at: nil).first
    end

    def current_workout_session
      workout_session_query.where(finished_at: nil).first
    end

    def next_workout
      current_session = workout_session_query.where(finished_at: nil).first
      return next_workout_from_session(current_session) if current_session

      last_session = workout_session_query.where.not(finished_at: nil).first
      return first_workout_from_first_sheet unless last_session

      next_workout_from_session(last_session)
    end

    private

    def workout_session_query
      @client.workout_sessions
        .joins(workout: :workout_sheet)
        .order(started_at: :desc)
        .select("workout_sessions.*, workouts.name AS workout_name, workout_sheets.title AS sheet_name")
    end

    def first_workout_from_first_sheet
      @client.workout_sheets
        .joins(:worouts)
        .order("workouts.position")
        .select("workouts.*, workout_sheets.title AS sheet_name")
        .first&.workouts&.first
    end

    def next_workout_from_session(session)
      active_sheet = session.workout.workout_sheet
      workouts = active_sheet.workouts.order(:position).to_a
      current_index = workouts.index(session.workout)
      next_index = (current_index + 1) % workouts.count
      workouts[next_index]
    end
  end
end
