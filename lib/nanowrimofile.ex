defmodule NaNoWriMoFile do
	import SweetXml # library for XML operations

	def getRegionalXMLFromFile() do
		{:ok, contents} = File.read("./res/nanowrimo_region.xml")
		parseDonationsFromFile(contents)
	end	

	def parseDonationsFromFile(xml) do
		xml |> xpath(~x"//wcregion/donations/text()") # `sigil_x` for (x)path
	end

	def getRegionalWordcountHistoryFromFile() do
		{:ok, contents} = File.read("./res/nanowrimo_region_history.xml")
		parseRegionHistoryFromFile(contents)
	end

	def parseRegionHistoryFromFile(xml) do
		history = xml |> xpath(~x"//wordcounts/wcentry/wc/text()"l) # `l` stands for (l)ist
		IO.puts("\n")
		Enum.each(history, fn(x) -> IO.puts(x) end)
		history
	end

end