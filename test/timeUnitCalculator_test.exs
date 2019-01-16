defmodule TimeUnitCalculatorTest do
  use ExUnit.Case
  doctest TimeUnitCalculator

  test "can calculate days from today until Christmas this year" do
    year = TimeUnitCalculator.getCurrentYear()
    assert year = 2018
    christmasThisYear = Integer.to_string(year) <> "-12-25"
    result = TimeUnitCalculator.daysFromTodayUntilDate(christmasThisYear)
    IO.puts "\nDays left till Christmas this year: #{result}"
    assert result > 0
  end

  test "can calculate days between today and my black belt test" do
    thisDay = TimeUnitCalculator.convertToDateFormat( Timex.today() )
    IO.inspect(thisDay)
    blackBeltTestDay = TimeUnitCalculator.convertToDateFormat("2016-05-13")
    IO.inspect(blackBeltTestDay)
    days = TimeUnitCalculator.getDaysBetweenDates( TimeUnitCalculator.getCurrentDay(), blackBeltTestDay)
    # IO.puts "\nDays since black belt test: #{days}"
    IO.inspect(days)
    assert days = 365
  end

end
