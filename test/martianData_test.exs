defmodule MartianDataTest do
  use ExUnit.Case
  doctest MartianData

  test "can get a response from endpoint" do
  	assert HTTPotion.Response.success?(MartianData.getDataFromNasa)
  end

  test "can get current temperature on Mars" do
  end

  test "can get current Sol length on Mars" do
  end

end
