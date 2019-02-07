defmodule TimeUnitCalculator do

	def daysFromTodayUntilDate(dateString) do
		endDate = convertToDateFormat(dateString)
		startDate = convertToDateFormat( Date.to_string(Timex.today()) )
		getDaysBetweenDates(startDate, endDate)
	end

	def getDaysBetweenDates(startDate, endDate) do
		Timex.diff(endDate, startDate, :days)
	end

	def getMonthsBetweenDates(startDate, endDate) do
		Timex.diff(endDate, startDate, :months)
	end

	def getYearsBetweenDates(startDate, endDate) do
		Timex.diff(endDate, startDate, :years)
	end

	def convertToDateFormat(testDate) do
		{:ok, result} = Timex.Parse.DateTime.Parser.parse(testDate, "{ISOdate}")
		result
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
