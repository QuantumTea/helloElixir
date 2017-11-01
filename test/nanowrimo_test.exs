defmodule NaNoWriMoTest do
  use ExUnit.Case
  doctest NaNoWriMo

  # test "Get the XML from the file" do
    # donations = NaNoWriMo.getRegionalXMLFromFile()
    # assert(donations == '1315.0')
  # end

  test "Get the donation amount for region from NaNoWriMo" do
    donations = NaNoWriMo.getRegionalXML("usa-missouri-st-louis")
    assert(donations >= '1335.0')
  end

  # test "Get the regional word count history from file" do
    # history = NaNoWriMo.getRegionalWordcountHistoryFromFile()
    # assert(Enum.count(history) == 5) 
    # alternative to the above statement is
    # assert(Kernel.length(history) == 5)
  # end

  test "Get the regional word count history from NaNoWriMo" do
    history = NaNoWriMo.getRegionalWordcountHistory("usa-missouri-st-louis")
    # dayNumber = Timex.Parse.DateTime.Parser.parse(Timex.today, "{D}")
    # IO.puts ("Day number: #{dayNumber}")
    # should be an entry for every day so far in this month
    # this will only work for November
    assert(Enum.count(history) == 1) 
  end
  
  # test "Get regional rank from file" do
   # rank = NaNoWriMo.getRegionalRank("USA :: Missouri :: St. Louis")
   # assert String.contains?(rank, "USA :: Missouri :: St. Louis")
  # end

end
