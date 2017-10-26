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
end
