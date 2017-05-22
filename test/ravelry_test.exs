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
    needles = Ravelry.buildRequest("/needles/list.json")
    # assemble basic auth header with un = access key and pwd = personal key

  end

  test "can create URL for Get request, given an endpoint" do
    endpoint = "/needles/list.json"
    getRequest = Ravelry.buildRequest(endpoint)
    assert String.contains?(getRequest, endpoint)
  end

 end