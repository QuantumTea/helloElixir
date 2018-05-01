defmodule NaNoWriMo do
	import SweetXml # library for XML operations

	def getRegionalXML(regionstring) do
		url = "https://nanowrimo.org/wordcount_api/wcregion/" <> regionstring
		HTTPotion.request(:get, url)
	end

	def getDonationsSoFar(regionstring) do
		response = getRegionalXML(regionstring)
		response.body |> xpath(~x"//wcregion/donations/text()")
	end

	def parseUsefulData(regionstring) do
		response = getRegionalXML(regionstring)

		donations = response.body |> xpath(~x"//wcregion/donations/text()")
		donors = response.body |> xpath(~x"//wcregion/numdonors/text()") 
		totalWordsWritten = response.body |> xpath(~x"//wcregion/region_wordcount/text()") 
		totalPeople = response.body |> xpath(~x"//wcregion/numparticipants/text()") 
		
		IO.puts("\n NaNoWriMo Region: #{regionstring}")
		IO.puts(" Donations: #{donations}")
		IO.puts(" Halos: #{donors}")
		IO.puts(" Word count: #{totalWordsWritten}")
		IO.puts(" People: #{totalPeople}")
	end

	def parseRegionHistory(regionstring) do
		url = "https://nanowrimo.org/wordcount_api/wcregionhist/" <> regionstring
		response = HTTPotion.request(:get, url)

		history = response.body |> xpath(~x"//wcregion/wordcounts/wcentry/max/text()"l) # `l` stands for (l)ist
		IO.puts("\nRegion history")
		Enum.each(history, fn(x) -> IO.puts(x) end)
		history
	end

end