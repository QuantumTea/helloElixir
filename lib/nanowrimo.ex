defmodule NaNoWriMo do
	import SweetXml

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
		donations = xml |> xpath(~x"//wcregion/donations/text()") # `sigil_x` for (x)path
		donors = xml |> xpath(~x"//wcregion/numdonors/text()") # `sigil_x` for (x)path
		totalWordsWritten = xml |> xpath(~x"//wcregion/region_wordcount/text()") # `sigil_x` for (x)path
		totalPeople = xml |> xpath(~x"//wcregion/numparticipants/text()") # `sigil_x` for (x)path
		
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
		# get all the wcentry/wc elements
		# deliver the totals, you can dump it in the spreadsheet later
	end

end