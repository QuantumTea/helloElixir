defmodule TimeUnitCalculatorTest do
  use ExUnit.Case
  doctest TimeUnitCalculator

  test "can calculate days from today until Christmas this year" do
    year = TimeUnitCalculator.getCurrentYear()
    # build date for Christmas this year
    {:ok, christmasThisYear} = Timex.format(Timex.to_date({year, 12, 25}), "{YYYY}-{M}-{D}")
    result = TimeUnitCalculator.daysFromTodayUntilDate(christmasThisYear)
    IO.puts "\nDays left till Christmas this year: #{result}"
    assert result > 0
  end

 test "can calculate days from today until service anniversary" do
    result = TimeUnitCalculator.daysFromTodayUntilDate("2018-06-03")
    IO.puts "\nDays left till five year anniversary: #{result}"
    assert result <= 69
  end

  test "can calculate days between today and my black belt test" do
    days = TimeUnitCalculator.getDaysBetweenDates( Timex.to_date(Timex.now()) , "2016-05-13")
    IO.puts "\nDays since black belt test: #{days}"
    assert days > 365
  end

  test "can calculate months between today and my black belt test" do
    months = TimeUnitCalculator.getMonthsBetweenDates( Timex.to_date(Timex.now()) , "2016-05-13")
    IO.puts "\nMonths since black belt test: #{months}"
    assert months > 23
  end

  test "can calculate years between today and my black belt test" do
    years = TimeUnitCalculator.getYearsBetweenDates( Timex.to_date(Timex.now()) , "2016-05-13")
    IO.puts "\nYears since black belt test: #{years}"
    assert years >= 1
  end

  test "can calculate days between two dates" do
    assert TimeUnitCalculator.getDaysBetweenDates("2017-02-17", "2017-03-03") == 14
  end

  test "can calculate months between two dates" do
    assert TimeUnitCalculator.getDaysBetweenDates("2017-02-17", "2017-03-03") == 14
  end

  test "can calculate years between two dates" do
    assert TimeUnitCalculator.getDaysBetweenDates("2017-02-17", "2017-03-03") == 14
  end

end
