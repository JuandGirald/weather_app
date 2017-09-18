# Class used to consume the openweather API
# get the current weather of a selected city, country
class OpenWeatherApi
  include HTTParty
  base_uri 'api.openweathermap.org/data/2.5/weather'

  def initialize(city, country = '')
    @options = { query: { q: "#{city},#{country}",
                          APIKEY: api_key,
                          units: 'metric' } }
    @data = {}
  end

  # parse and get response data from the weather API
  def call
    @data = parse_response(self.class.get('', @options))
  end

  def weather_data
    @data
  end
  def weather_metrics
    @data['weather'].first
  end

  def main_data
    @data['main']
  end

  private
    def parse_response(data)
      data.parsed_response
    end

    def api_key
      ENV['OPEN_WEATHER_KEY'] 
    end
end
