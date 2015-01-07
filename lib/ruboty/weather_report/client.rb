require 'uri'
require 'net/http'
require 'json'

module Ruboty
  module WeatherReport
    class Client # Ruboty::WeatherReport::Client
      URL = 'http://weather.livedoor.com/forecast/webservice/json/v1'

      def initialize(city_name)
        @city_name = city_name
      end

      def reports
        forecasts.map(&:report)
      end

      private

      def forecasts
        @forecasts ||= begin
          return [] if api_data.nil?

          api_data['forecasts'].map do |forecast|
            temperature = forecast['temperature']

            Forecast.new(
              date: Date.parse(forecast['date']),
              date_label: forecast['dateLabel'],
              weather: forecast['telop'],
              min: temperature['min'] ? temperature['min']['celsius'] : nil,
              max: temperature['max'] ? temperature['max']['celsius'] : nil
            )
          end
        end
      end

      def api_data
        return nil if city_code.nil?

        @api_data ||= begin
          uri = URI("#{URL}?city=#{city_code}")
          body = Net::HTTP.get(uri)
          JSON.parse(body)
        end
      end

      def city_code
        @coty_code ||= City.code(@city_name)
      end
    end
  end
end
