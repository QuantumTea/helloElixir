defmodule NaNoWriMo do

	# poke the endpoint
	# save the XML somewhere
	# strip out the useful parts of the XML
	# save a JSON file

	def getRegionalXML(regionstring) do
		url = "https://nanowrimo.org/wordcount_api/wcregion/" <> regionstring
		{:ok, contents} = HTTPotion.get url
		parseXML(contents)
	end

	def getRegionalXMLFromFile() do
		{:ok, contents} = File.read("./res/nanowrimo_region.xml")
		parseXML(contents)
	end	

	def parseXML(contents) do
		# this is XML, not JSON, stop using Poison
		{:ok, map} = Poison.decode(contents)
		map["wcregion"] 
	end

	def buildJSONstringForTodaysStats() do

	end

end