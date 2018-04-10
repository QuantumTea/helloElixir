defmodule MartianData do

	def getResponseFromEndpoint do
		# old MAAS endpoint
		# HTTPotion.get "marsweather.ingenology.com/v1/latest/"
		HTTPotion.get "api.maas2.jiinxt.com/"
		# getting a connection refused here
	end

	defp getDataFromNasa do
		response = getResponseFromEndpoint()
		{:ok, response.body}
	end

	def getDataFromFile do
		# File.read! returns the contents of the file instead of a tuple, 
		# http://elixir-lang.org/getting-started/io-and-the-file-system.html
		File.read!("./res/mars_weather.json") 
	end

	def parseJsonFromFile do
		{:ok, contents} = File.read("./res/mars_weather.json")
		{:ok, map} = Poison.decode(contents)
		# this was needed for the old MAAS API json file
		# map["report"]
		map
	end   

	def parseJsonFromNasa do
		{:ok, contents} = getDataFromNasa()
		{:ok, map} = Poison.decode(contents)
		# this was needed for the old MAAS API json file
		# map["report"]
		map
	end

	def latestSol do
		parseJsonFromNasa()["sol"]
	end

	def latestHighTemperature do
		 parseJsonFromNasa()["max_temp"]
	end

	def getTemperatureHigh do
		parseJsonFromFile()["max_temp"]
	end

	def getTemperatureLow do
		parseJsonFromFile()["min_temp"]
	end 

	def getTemperatureRange do
		getTemperatureHigh() - getTemperatureLow()
	end

end
