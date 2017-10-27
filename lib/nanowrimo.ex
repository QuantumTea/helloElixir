defmodule NaNoWriMo do
	import SweetXml # library for XML operations

	def getRegionalXML(regionstring) do
		url = "https://nanowrimo.org/wordcount_api/wcregion/" <> regionstring
		response = HTTPotion.request(:get, url)
		parseOutUsefulData(response.body)
	end

	def getRegionalXMLFromFile() do
		{:ok, contents} = File.read("./res/nanowrimo_region.xml")
		parseDonationsFromFile(contents)
	end	

	def parseDonationsFromFile(xml) do
		xml |> xpath(~x"//wcregion/donations/text()") # `sigil_x` for (x)path
	end

	def parseOutUsefulData(xml) do
		donations = xml |> xpath(~x"//wcregion/donations/text()") 
		donors = xml |> xpath(~x"//wcregion/numdonors/text()") 
		totalWordsWritten = xml |> xpath(~x"//wcregion/region_wordcount/text()") 
		totalPeople = xml |> xpath(~x"//wcregion/numparticipants/text()") 
		
		IO.puts("\n donations: #{donations}")
		IO.puts(" halos: #{donors}")
		IO.puts(" word count: #{totalWordsWritten}")
		IO.puts(" people: #{totalPeople}")

		donations
	end

	def getRegionalWordcountHistoryFromFile() do
		{:ok, contents} = File.read("./res/nanowrimo_region_history.xml")
		parseRegionHistoryFromFile(contents)
	end

	def parseRegionHistoryFromFile(xml) do
		# get all the wc elements
		history = xml |> xpath(~x"//wordcounts/wcentry/wc/text()"l) # `l` stands for (l)ist
		Enum.each(history, fn(x) -> IO.puts(x) end)
		history
	end

end