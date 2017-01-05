defmodule MartianData do

	def getDataFromNasa do
		# poke the endpoint
		HTTPotion.get "marsweather.ingenology.com/v1/latest/"
	end

	def getMartianTemperature do	

	end

	def getMartianSolLength do
		
	end

end
