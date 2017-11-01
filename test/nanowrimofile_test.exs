defmodule NaNoWriMoTest do
  use ExUnit.Case
  doctest NaNoWriMoFile

  test "Get the XML from the file" do
   donations = NaNoWriMoFile.getRegionalXMLFromFile()
   assert(donations == '1315.0')
  end

  test "Get the regional word count history from file" do
    history = NaNoWriMoFile.getRegionalWordcountHistoryFromFile()
    assert(Enum.count(history) == 5) 
    # OR use this version
    assert(Kernel.length(history) == 5)
  end

end
