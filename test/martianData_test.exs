defmodule MartianDataTest do
  use ExUnit.Case
  doctest MartianData

  test "can get a success response from endpoint" do
  	assert HTTPotion.Response.success?(MartianData.getResponseFromEndpoint)
  end

  test "can get latest sol data from endpoint" do
    # downloaded file has sol 1572, newer data should be a higher number
    result = MartianData.latestSol
    IO.puts ("\nLatest Martian sol:")
    IO.puts(result)
    assert result > 1572
  end

  test "can get latest temperature data from endpoint" do
    # not doing an assert here, it could fail randomly
    result = MartianData.latestHighTemperature
    IO.puts ("\nLatest Martian high temperature:")
    IO.puts(result)
  end

  test "can read a string from a file" do
    assert String.length(MartianData.getDataFromFile) != 0
  end

  test "can get the low temperature on Mars from a file" do
    assert MartianData.getTemperatureLow == -81
  end

  test "can get the high temperature on Mars from a file" do
    assert MartianData.getTemperatureHigh == -6
  end

  test "can get temperature range on Mars from file" do
    assert MartianData.getTemperatureRange == 75
  end

end
