defmodule TimeUnitCalculator do

	def daysFromTodayUntilDate(dateString) do
		{:ok, endDate} = convertToDateFormat(dateString)
		{:ok, startDate} = convertToDateFormat( Date.to_string(Timex.today()) )
		calculateDaysBetween(endDate, startDate)
	end

	def getDaysBetweenDates(date1, date2) do
		calculateDaysBetween(date1, date2)
	end

	defp calculateDaysBetween(startDate, endDate) do
		Timex.diff(startDate, endDate, :days)
	end

	def convertToDateFormat(testDate) do
		Timex.Parse.DateTime.Parser.parse(testDate, "{ISOdate}")
	end

	def getCurrentYear() do
		getYear(Timex.today)
	end

	def getCurrentDay() do
		(Timex.today).day
	end

	def getYear(date) do
		date.year
	end
end
