defmodule NaNoWriMo do
	import SweetXml

	def getRegionalXML(regionstring) do
		url = "https://nanowrimo.org/wordcount_api/wcregion/" <> regionstring
		{:ok, response} = HTTPotion.request(:get, url)
		parseXMLFromEndpoint(response.body)
	end

	def getRegionalXMLFromFile() do
		{:ok, contents} = File.read("./res/nanowrimo_region.xml")
		parseXMLFromFile(contents)
	end	

	def parseXMLFromFile(xml) do
		result = xml |> xpath(~x"//wcregion/donations/text()") # `sigil_x` for (x)path
		IO.puts("\n donations from file: #{result}")
		result
	end

	def parseXMLFromEndpoint(xml) do
		IO.puts("\n response body\n #{xml}")
		# works for the file, not for the live endpoint
		result = xml |> xpath(~x"//wcregion/donations/text()") # `sigil_x` for (x)path
		IO.puts("\n donations from endpoint: #{result}")
		#result
	end
end