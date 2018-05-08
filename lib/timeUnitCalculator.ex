defmodule TimeUnitCalculator do

	def getTodaysDate() do
		today = Timex.to_date(Timex.now())
		{:ok, todaysDate} = Timex.Parse.DateTime.Parser.parse(today, "{ISOdate}")
		todaysDate
	end

	def getCurrentYear() do
		getYear(Timex.today)
	end

	def getYear(date) do
		date.year
	end

	def daysFromTodayUntilDate(dateString) do
		startDate = getTodaysDate()
		{:ok, endDate} = Timex.Parse.DateTime.Parser.parse(dateString, "{ISOdate}")
		getTimeUnitBetweenDates(startDate, endDate, :days)
	end

	def getTimeUnitBetweenDates(date1, date2, :unit) do
		{:ok, startDate} = Timex.Parse.DateTime.Parser.parse(date1, "{ISOdate}")
		{:ok, endDate} = Timex.Parse.DateTime.Parser.parse(date2, "{ISOdate}")
		timeUnitBetweenDates(startDate, endDate, :unit)
	end

	def getDaysBetweenDates(startDate, endDate) do
		timeUnitBetweenDates(startDate, endDate, :days)
	end

	def getMonthsBetweenDates(startDate, endDate) do
		getTimeUnitBetweenDates(startDate, endDate, :months)
	end

	def getYearsBetweenDates(startDate, endDate) do
		getTimeUnitBetweenDates(startDate, endDate, :years)
	end

	defp timeUnitBetweenDates(startDate, endDate, timeUnit) do
		Timex.diff(endDate, startDate, timeUnit)
	end

end
