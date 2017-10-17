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

	def numberOfFridayThirteenths(year) do
		# There are twelve 13ths in the year, and January == 1
		thirteenthCheck(year, 1, 0)
	end

	def numberOfFridayThirteenths() do
		# If the year was not specified, go with the current year
		year = Timex.Parse.DateTime.Parser.parse(Timex.today, "{year}")
		numberOfFridayThirteenths(year)
	end 

	def thirteenthCheck(year, month, thirteenths) when month < 13 do
		testMonth = Timex.to_date( {year, month, 13} )
		IO.puts testMonth

		if ( ( testMonth |> Elixir.Timex.weekday ) == 5 ) do
			thirteenthCheck(year, (month + 1), (thirteenths + 1) )
		:else 
			thirteenthCheck(year, (month + 1) , thirteenths)
		end

		thirteenths
	end

	def thirteenthCheck(year, month, thirteenths) when month == 13 do
		thirteenths
	end

end