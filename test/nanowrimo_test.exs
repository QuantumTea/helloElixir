defmodule NaNoWriMoTest do
  use ExUnit.Case
  doctest NaNoWriMo

  test "Got the XML from the file" do
    # xml = NaNoWriMo.getRegionalXML("usa-missouri-st-louis")
    donations = NaNoWriMo.getRegionalXMLFromFile()
    # IO.puts xml
    #assert(donations == "1315.0")
  end

end
