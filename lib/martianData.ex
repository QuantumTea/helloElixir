defmodule MartianData do

	def getResponseFromEndpoint do
		# MAAS endpoint went dark
		# HTTPotion.get "marsweather.ingenology.com/v1/latest/"
		# new endpoint is HTTPS, not HTTP
		HTTPotion.get "https://api.maas2.jiinxt.com/"
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
		# MAAS API json file
		# map["report"]
		map
	end

	def parseJsonFromNasa do
		{:ok, contents} = getDataFromNasa()
		{:ok, map} = Poison.decode(contents)
		map
	end

	def getCurrentSolFromEndpoint do
		parseJsonFromNasa()["sol"]
	end

	def getTemperatureHighFromEndpoint do
		parseJsonFromNasa()["max_temp"]
	end

	def getTemperatureHighFromFile do
		parseJsonFromFile()["max_temp"]
	end

	def getTemperatureLowFromFile do
		parseJsonFromFile()["min_temp"]
	end

	def getTemperatureRangeFromFile do
		getTemperatureHighFromFile() - getTemperatureLowFromFile()
	end

end
