defmodule NaNoWriMoTest do
  use ExUnit.Case
  doctest NaNoWriMo

  test "Got the XML from the endpoint" do
    xml = NaNoWriMo.getRegionalXML("usa-missouri-st-louis")
    assert String.contains?(xml.body, "USA :: Missouri :: St. Louis")
  end

end
