defmodule DateTimes do

	def daysFromTodayUntilDate(dateString) do
		{:ok, endDate} = Timex.Parse.DateTime.Parser.parse(dateString, "{ISOdate}")
		daysBetween(Timex.today, endDate)
	end

	def daysBetweenDates(date1, date2) do
		{:ok, startDate} = Timex.Parse.DateTime.Parser.parse(date1, "{ISOdate}")
		{:ok, endDate} = Timex.Parse.DateTime.Parser.parse(date2, "{ISOdate}")
		daysBetween(startDate, endDate)
	end

	defp daysBetween(first, second) do
		Timex.diff(second, first, :days)
	end

	def getCurrentYear() do
		getYear(Timex.today)
	end

	def getYear(date) do
		date.year
	end

	def hasFriday13th(month, year) do
		result = Timex.to_date( {year, month, 13} ) |> Elixir.Timex.weekday

		cond do
			result == 5 -> :true
			result != 5 -> :false
		end
	end

	def numberOfFridayThirteenths(year) do
		# redo with Enum,
		# also redo with recursion, see which is better/more readable

		# there HAS to be a better way of doing this
		months = [ { Timex.format!( {year, 1, 13}, "{Mfull}"), hasFriday13th(1, year) },
					{ Timex.format!( {year, 2, 13}, "{Mfull}"), hasFriday13th(2, year) },
					{ Timex.format!( {year, 3, 13}, "{Mfull}"), hasFriday13th(3, year) },
					{ Timex.format!( {year, 4, 13}, "{Mfull}"), hasFriday13th(4, year) },
					{ Timex.format!( {year, 5, 13}, "{Mfull}"), hasFriday13th(5, year) },
					{ Timex.format!( {year, 6, 13}, "{Mfull}"), hasFriday13th(6, year) },
					{ Timex.format!( {year, 7, 13}, "{Mfull}"), hasFriday13th(7, year) },
					{ Timex.format!( {year, 8, 13}, "{Mfull}"), hasFriday13th(8, year) },
					{ Timex.format!( {year, 9, 13}, "{Mfull}"), hasFriday13th(9, year) },
					{ Timex.format!( {year, 10, 13}, "{Mfull}"), hasFriday13th(10, year) },
					{ Timex.format!( {year, 11, 13}, "{Mfull}"), hasFriday13th(11, year) },
					{ Timex.format!( {year, 12, 13}, "{Mfull}"), hasFriday13th(12, year) }, ]

		# extract out all the elements where the second item in the tuple (index 1) is true
		filtered = Enum.filter(months, fn(x) -> elem(x, 1) end)

		# month names from the filtered list
		months = ( Enum.map(filtered, fn(x) -> elem(x, 0) end) )
		IO.puts("\nMonths in #{year} with a Friday 13th:")
		Enum.each(months, fn(x) -> IO.puts(x) end)

		# pass back the number of trues
		Enum.count(filtered)
	end

	def numberOfFridayThirteenths() do
		# If the year was not specified, go with the current year
		now = Timex.to_date(Timex.now())
		{:ok, year} = Timex.Parse.DateTime.Parser.parse(now, "{year}")
		numberOfFridayThirteenths( String.to_integer(year) )
	end

	def isLeapYear(test_year) do
		Timex.is_leap?(test_year)
	end
end
