defmodule MartianData do

	def getDataFromNasa do
		# poke the endpoint
		HTTPotion.get "marsweather.ingenology.com/v1/latest/"
	end

	def getDataFromFile do
		File.read!("mars_weather.json")
	end

	def getTemperature do
		# IO.inspect (Poison.Parser.parse getDataFromNasa)
	end

	def getSolLength do
				
	end

end
