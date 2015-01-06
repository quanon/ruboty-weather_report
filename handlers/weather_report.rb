require 'ruboty/weather_report/actions/weather_report'

module Ruboty
  module Handlers
    class WeatherReport < Base
      on(
        /天気 (?<city>.*?)\z/,
        name: 'weather',
        description: 'Show weather condition of the city'
      )

      def fizzbuzz(message)
        Ruboty::WeatherReport::Actions::WeatherReport.new(message).call
      end
    end
  end
end
