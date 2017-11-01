defmodule NaNoWriMo do
	import SweetXml # library for XML operations

	def getRegionalXML(regionstring) do
		url = "https://nanowrimo.org/wordcount_api/wcregion/" <> regionstring
		response = HTTPotion.request(:get, url)
		parseUsefulData(response.body, regionstring)
	end

	def getRegionalXMLFromFile() do
		{:ok, contents} = File.read("./res/nanowrimo_region.xml")
		parseDonationsFromFile(contents)
	end	

	def parseDonationsFromFile(xml) do
		xml |> xpath(~x"//wcregion/donations/text()") # `sigil_x` for (x)path
	end

	def parseUsefulData(xml, regionstring) do
		donations = xml |> xpath(~x"//wcregion/donations/text()") 
		donors = xml |> xpath(~x"//wcregion/numdonors/text()") 
		totalWordsWritten = xml |> xpath(~x"//wcregion/region_wordcount/text()") 
		totalPeople = xml |> xpath(~x"//wcregion/numparticipants/text()") 
		
		IO.puts("\n NaNoWriMo Region: #{regionstring}")
		IO.puts(" Donations: #{donations}")
		IO.puts(" Halos: #{donors}")
		IO.puts(" Word count: #{totalWordsWritten}")
		IO.puts(" People: #{totalPeople}")

		donations
	end

	def getRegionalWordcountHistoryFromFile() do
		{:ok, contents} = File.read("./res/nanowrimo_region_history.xml")
		parseRegionHistoryFromFile(contents)
	end

	def getRegionalWordcountHistory(regionstring) do
		url = "https://nanowrimo.org/wordcount_api/wcregionhist/" <> regionstring
		response = HTTPotion.request(:get, url)
		# IO.puts response
		parseRegionHistory(response.body)
	end

	def parseRegionHistoryFromFile(xml) do
		# get all the wc elements
		history = xml |> xpath(~x"//wordcounts/wcentry/wc/text()"l) # `l` stands for (l)ist
		IO.puts("\n")
		Enum.each(history, fn(x) -> IO.puts(x) end)
		history
	end

	def parseRegionHistory(xml) do
		history = xml |> xpath(~x"//wcregion/wordcounts/wcentry/max/text()"l) # `l` stands for (l)ist
		IO.puts("\nRegion history")
		Enum.each(history, fn(x) -> IO.puts(x) end)
		history
	end

	def getRegionalRank() do
		response = HTTPotion.request(:get, "https://nanowrimo.org/en/word_count_scoreboard")

		#scoreboard = response.body |> xpath(~x"//table/tbody/tr[2]/td[2]/a/text()"l) 
		# scoreboard = response.body |> xpath(~x"table/tbody/tr", a: [~x"./td/a/text()"] )
		# lines above are failing to find the list of regions

		# get the index of the St Louis one
		# Enum.count(scoreboard)
		response.body.text
	end

end