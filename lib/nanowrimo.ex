defmodule NaNoWriMo do
	import SweetXml

	def getRegionalXML(regionstring) do
		url = "https://nanowrimo.org/wordcount_api/wcregion/" <> regionstring
		{:ok, response} = HTTPotion.request(:get, url)
		parseXML(response.body)
	end

	def getRegionalXMLFromFile() do
		{:ok, contents} = File.read("./res/nanowrimo_region.xml")
		parseXML(contents)
	end	

	def parseXML(xml) do
		result = xml |> xpath(~x"//wcregion/donations/text()") # `sigil_x` for (x)path
		IO.puts("\n donations: #{result}")
		result
	end

end