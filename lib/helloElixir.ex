defmodule HelloElixir do

	def multiply(valx, valy) do
		# use IO.inspect to output values to the terminal
		# IO.inspect(valx)
		valx * valy
	end

	def square(val) do
		# calling the function above
		multiply(val, val)
	end

	def cuberoot(val) do
		# using an underlying Erlang math library
		:math.pow(val, 1/3)
	end 

	def concatenate(valx, valy) do
		# strings are binary arrays in Elixir, test with is_binary(val)
		valx <> valy
	end

	def factorial(val) do
		factorial val, 1
	end

	# private function only accessible in this file when val > 1
	defp factorial(val, sum) when val > 1 do
		factorial (val - 1), sum * val
	end

	defp factorial(val, sum) when val == 1 do
		sum
	end

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

	def numberOfFridayThirteenths(year) do
		# Twelve 13ths in the year, count which are on Fridays
		# Months are a 1-based list, January == 1
		testYear = Timex.to_date( {year, 1, 13})
		# Check day for each 13th
		
		# Returns a five if the 13th is a Friday
		IO.puts ( Timex.to_date( {year, 1, 13}) |> Elixir.Timex.weekday )
		# not finished writing code, force test to fail
		7
	end

	def numberOfFridayThirteenths() do
		# If no year was specified, go with current year
		year = Timex.Parse.DateTime.Parser.parse(Timex.today, "{year}")
		numberOfFridayThirteenths(year)
	end 

end
