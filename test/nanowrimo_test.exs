defmodule NaNoWriMoTest do
  use ExUnit.Case
  doctest NaNoWriMo

  test "Get the XML from the file" do
    donations = NaNoWriMo.getRegionalXMLFromFile()
    assert(donations == '1315.0')
  end

  test "Get the current XML from NaNoWriMo" do
    donations = NaNoWriMo.getRegionalXML("usa-missouri-st-louis")
    assert(donations == '1315.0')
  end

  test "Get the regional word count history from file" do
    history = NaNoWriMo.getRegionalWordcountHistoryFromFile()
    # should be 5 entries in the list
    # assert(Kernel.length(history) == 5) # this works for lists

    assert(Enum.count(history) == 5) # using Enum over list
  end

  test "Get regional rank from file" do
    rank = NaNoWriMo.getRegionalRank("USA :: Missouri :: St. Louis")
    assert(rank == 1)
  end

end
