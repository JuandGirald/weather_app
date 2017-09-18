class StaticPagesController < ApplicationController
  def home
    if params[:random] || params[:city]
      if params[:random]
       response = OpenWeatherApi.new(Random.city)
      elsif params[:city] || params[:country]
        response = OpenWeatherApi.new(params[:city], params[:country])
      end

      # call openweather API
      response.call

      if response.errors.blank?
        @weather_data = response.weather_data
        @metrics_weather = response.weather_metrics
        @main_weather = response.main_data
      else 
        @errors = response.errors.messages
      end
    end
  end
end
