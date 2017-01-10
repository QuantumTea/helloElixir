defmodule MartianData do

	def getDataFromNasa do
		HTTPotion.get "marsweather.ingenology.com/v1/latest/"
	end

	def getDataFromFile do
		File.read!("./mars_weather.json") 
	end

	def parseJSON do
		{:ok, contents} = File.read("./mars_weather.json")
		{:ok, map} = Poison.decode(contents)
		map["report"]
	end   

	def getTemperatureHigh do
		parseJSON["max_temp"]
	end

	def getTemperatureLow do
		parseJSON["min_temp"]
	end

	def getTemperatureRange do
		getTemperatureHigh - getTemperatureLow
	end

end
