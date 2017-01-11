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

	def concat(valx, valy) do
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
		Timex.diff(endDate, Timex.today, :days)
	end

	def daysBetweenDates(date1, date2) do
		{:ok, startDate} = Timex.Parse.DateTime.Parser.parse(date1, "{ISOdate}")
		{:ok, endDate} = Timex.Parse.DateTime.Parser.parse(date2, "{ISOdate}")
		Timex.diff(endDate, startDate, :days)
	end

end
