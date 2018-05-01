defmodule NaNoWriMoTest do
  use ExUnit.Case
  doctest NaNoWriMo

  test "Get the regional XML file from NaNoWriMo" do
    response = NaNoWriMo.getRegionalXML("usa-missouri-st-louis")
    assert response != nil
    assert HTTPotion.Response.success?(response)
    assert response.status_code == 200
    assert String.contains?(response.body, "USA :: Missouri :: St. Louis")
    refute String.contains?(response.body, "USA :: California :: East Bay")
  end

  test "Get the donation amount for region from NaNoWriMo" do
    donations = NaNoWriMo.getDonationsSoFar("usa-missouri-st-louis")
    assert(donations >= '1390.0')
  end

  test "Get the useful info from the region XML file" do
    NaNoWriMo.parseUsefulData("usa-missouri-st-louis")
  end

  test "Get the regional word count history from NaNoWriMo" do
    history = NaNoWriMo.parseRegionHistory("usa-missouri-st-louis")
    {:ok, dayNumber} = Timex.format(Timex.today, "{D}")
    IO.inspect(dayNumber)
    # should be one entry for every day so far in this month
    # this will only work for November
    # assert(Enum.count(history) == String.to_integer(dayNumber)) 
  end

end
