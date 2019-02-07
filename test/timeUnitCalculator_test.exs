defmodule TimeUnitCalculatorTest do
  use ExUnit.Case
  doctest TimeUnitCalculator

  test "can calculate days from today until Christmas this year" do
    christmasThisYear = Integer.to_string( TimeUnitCalculator.getCurrentYear() ) <> "-12-25"
    result = TimeUnitCalculator.daysFromTodayUntilDate(christmasThisYear)
    IO.puts "\nDays left till Christmas this year: #{result}"
    assert result > 0
  end

  test "can calculate days between 2nd degree black and my black belt test" do
    secondBlackBelt = TimeUnitCalculator.convertToDateFormat("2018-08-20")
    blackBeltTestDay = TimeUnitCalculator.convertToDateFormat("2016-05-13")
    # IO.puts "\nPromotion to second black: #{secondBlackBelt}"
    # IO.puts "\nBlack belt test: #{blackBeltTestDay}"
    days = TimeUnitCalculator.getDaysBetweenDates( blackBeltTestDay, secondBlackBelt)
    months = TimeUnitCalculator.getMonthsBetweenDates( blackBeltTestDay, secondBlackBelt)
    years = TimeUnitCalculator.getYearsBetweenDates( blackBeltTestDay, secondBlackBelt)
    IO.puts "\nDays between 1st and 2nd degree black belt: #{days}"
    IO.puts "Months between 1st and 2nd degree black belt: #{months}"
    IO.puts "Years between 1st and 2nd degree black belt: #{years}"
    assert days > 365


  end

end
