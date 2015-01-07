module Ruboty
  module Handlers
    class WeatherReport < Base
      on(
        /天気 (?<city>.*?)\z/,
        name: 'weather_report',
        description: 'Show weather condition of the city'
      )

      def weather_report(message)
        Ruboty::WeatherReport::Actions::WeatherReport.new(message).call
      end
    end
  end
end
