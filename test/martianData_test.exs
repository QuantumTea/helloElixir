defmodule MartianDataTest do
  use ExUnit.Case
  doctest MartianData

  test "can get a success response from endpoint" do
  	assert HTTPotion.Response.success?(MartianData.getDataFromNasa)
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
