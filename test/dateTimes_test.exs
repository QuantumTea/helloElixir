defmodule DateTimesTest do
  use ExUnit.Case
  doctest DateTimes

  test "can calculate days from today until Christmas 2017" do
    result = DateTimes.daysFromTodayUntilDate("2017-12-25")
    IO.puts "\nDays left till Christmas 2017:" 
    IO.puts result
    assert result != 0
  end

  test "can calculate days between two dates" do
    assert DateTimes.daysBetweenDates("2017-02-17", "2017-03-03") == 14
  end

  test "can tell if given month/year has a Friday 13th" do
    assert DateTimes.hasFriday13th(12, 2019) == :true
    assert DateTimes.hasFriday13th(11, 2019) == :false
  end

  test "can count number of Friday 13ths in a given year" do
    # every year has between one and three Friday 13ths
    # January and October 2017
    assert (DateTimes.numberOfFridayThirteenths(2017) == 2)
    # October 2000
    assert (DateTimes.numberOfFridayThirteenths(2000) == 1)
    # February, March, and November 2015
    assert (DateTimes.numberOfFridayThirteenths(2015) == 3)
  end

  test "can tell you if a given year is a leap year" do
    assert (DateTimes.isLeapYear(2000) == :true)
    assert (DateTimes.isLeapYear(2017) == :false)
    assert (DateTimes.isLeapYear(2020) == :true)
  end

end
