defmodule HelloElixir do

	def multiply(valx, valy) do
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

	def hasFriday13th(month, year) do
		result = Timex.to_date( {year, month, 13} ) |> Elixir.Timex.weekday

		cond do
			result == 5 -> :true
			result != 5 -> :false
		end
	end

	def numberOfFridayThirteenths(year) do
		# there HAS to be a better way of doing this
		results = [ { hasFriday13th(1, year) },
					{ hasFriday13th(2, year) }, 
					{ hasFriday13th(3, year) },
					{ hasFriday13th(4, year) },
					{ hasFriday13th(5, year) }, 
					{ hasFriday13th(6, year) },
					{ hasFriday13th(7, year) },
					{ hasFriday13th(8, year) }, 
					{ hasFriday13th(9, year) },
					{ hasFriday13th(10, year) },
					{ hasFriday13th(11, year) }, 
					{ hasFriday13th(12, year) }, ]
		IO.puts results
		# count number of trues, return month numbers/names in an array?
		13
	end

	def numberOfFridayThirteenths() do
		# If the year was not specified, go with the current year
		year = Timex.Parse.DateTime.Parser.parse(Timex.today, "{year}")
		numberOfFridayThirteenths(year)
	end 
end