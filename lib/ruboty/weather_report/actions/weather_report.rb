module Ruboty
  module WeatherReport
    module Actions
      class WeatherReport < Ruboty::Actions::Base
        def call
          message.reply(weather_report)
        end

        private

        def weather_report
          'weather'
        end
      end
    end
  end
end
