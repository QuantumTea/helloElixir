defmodule RavelryTest do
  use ExUnit.Case
  doctest Ravelry

  test "can read in keys from file" do
    auth = Ravelry.getAuthDataFromFile
    #IO.puts auth.username
    #IO.puts auth.accessKey
    #IO.puts auth.personalKey
    assert auth != nil
  end 

  test "can construct the auth tuple" do
    #IO.inspect (Ravelry.getAuthTuple)
    assert Ravelry.getAuthTuple != nil
  end

  test "can display a returned piece of JSON" do
    response = Ravelry.getRavelryJsonData("/needles/list.json")
    IO.inspect response
    assert String.contains?("Karbonz", response)
  end

  test "can create URL for Get request, given an endpoint" do
    endpoint = "/needles/list.json"
    getRequest = Ravelry.buildRequest(endpoint)
    assert String.contains?(getRequest, endpoint)
  end

 end