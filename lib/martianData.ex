defmodule MartianData do

	def getResponseFromEndpoint do
		HTTPotion.get "marsweather.ingenology.com/v1/latest/"
	end

	def getDataFromNasa do
		response = getResponseFromEndpoint
		{:ok, response.body}
	end

	def getDataFromFile do
		# File.read! returns the contents of the file instead of a tuple, 
		# http://elixir-lang.org/getting-started/io-and-the-file-system.html
		File.read!("./mars_weather.json") 
	end

	def parseJsonFromFile do
		{:ok, contents} = File.read("./mars_weather.json")
		{:ok, map} = Poison.decode(contents)
		map["report"]
	end   

	def parseJsonFromNasa do
		{:ok, contents} = getDataFromNasa
		{:ok, map} = Poison.decode(contents)
		map["report"]
	end

	def latestSol do
		parseJsonFromNasa["sol"]
	end

	def latestHighTemperature do
		parseJsonFromNasa["max_temp"]
	end

	def getTemperatureHigh do
		parseJsonFromFile["max_temp"]
	end

	def getTemperatureLow do
		parseJsonFromFile["min_temp"]
	end 

	def getTemperatureRange do
		getTemperatureHigh - getTemperatureLow
	end

end
