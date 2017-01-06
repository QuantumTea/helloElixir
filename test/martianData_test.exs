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

  test "can get current temperature on Mars" do
    val = MartianData.getTemperature
  end

  test "can get current Sol length on Mars" do
    # a Martian day is called a Sol
    val = MartianData.getSolLength
  end

end
