# frozen_string_literal: true

module Clients
  module UserHelper
    def get_age(birth_date)
      today = Date.today
      age = today.year - birth_date.year
      age -= 1 if birthday_future?(birth_date, today)
      age
    end

    private

    def birthday_future?(birth_date, today)
      birth_date.strftime("%m%d") > today.strftime("%m%d")
    end
  end
end
