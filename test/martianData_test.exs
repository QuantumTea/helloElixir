defmodule MartianDataTest do
  use ExUnit.Case
  doctest MartianData

  test "can get a success response from endpoint" do
    response = MartianData.getDataFromNasa
  	assert HTTPotion.Response.success?(response)
  end

  test "can read string from a file" do
    response = MartianData.getDataFromFile
    assert String.length(response) != 0
  end

  test "can get the low temperature on Mars from a file" do
    val = MartianData.getTemperatureLow
    assert val == -81
  end

  test "can get the high temperature on Mars from a file" do
    val = MartianData.getTemperatureHigh
    assert val == -6
  end

end
