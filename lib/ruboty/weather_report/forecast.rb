require 'active_support'
require 'active_support/core_ext'

module Ruboty
  module WeatherReport
    class Forecast
      WEATHER_AND_EMOJI = {
        '時々'  => ':left_right_arrow:',
        'のち'  => ':arrow_right:',
        '晴れ?' => ':sunny:',
        '曇り?' => ':cloud:',
        '雨'    => ':umbrella:',
        '雷'    => ':zap:',
        '雪'    => ':snowflake:'
      }.freeze

      def initialize(date:, date_label:, weather:, min:, max:)
        @date = date
        @date_label = date_label
        @weather = weather
        @min = min
        @max = max
      end

      def report
        messages = []

        messages << "#{@date_label} #{formated_date} の天気予報です。"
        messages << "天気: #{emoji_weather}"

        if has_temperature?
          messages << "最低気温: #{@min}度"
          messages << "最高気温: #{@max}度"
        end

        messages.join("\n")
      end

      private

      def has_temperature?
        @min && @max
      end

      def emoji_weather
        @weather2emoji ||= WEATHER_AND_EMOJI.inject(@weather) do |weather, (name, emoji)|
          weather.gsub(/#{name}/, emoji)
        end
      end

      def formated_date
        @formated_date ||= begin
          wdays = %w(日 月 火 水 木 金 土)
          @date.strftime("%Y/%m/%d (#{wdays[@date.wday]})")
        end
      end
    end
  end
end
