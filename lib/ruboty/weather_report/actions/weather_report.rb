module Ruboty
  module WeatherReport
    module Actions
      class WeatherReport < Ruboty::Actions::Base
        def call
          message.reply(weather_report)
        end

        private

        def weather_report
          client = Client.new(message[:city])
          client.reports.join("\n\n")
        end
      end
    end
  end
end
