# frozen_string_literal: true

module Clients
  class HomeController < ClientApplication
    def index
      workout_service = Clients::ClientWorkoutService.new(current_client)
      @last_workout_session = workout_service.last_workout_session
      @current_workout_session = workout_service.current_workout_session
      @next_workout = workout_service.next_workout
    end
  end
end
