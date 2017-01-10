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

  test "can get latest low temperature on Mars" do
    val = MartianData.getTemperatureLow
    assert val == -81
  end

  test "can get latest high temperature on Mars" do
    val = MartianData.getTemperatureHigh
    assert val == -6
  end

end
