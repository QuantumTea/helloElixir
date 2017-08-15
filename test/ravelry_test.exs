defmodule RavelryTest do
  use ExUnit.Case
  doctest Ravelry

  test "can read in keys from file" do
    auth = Ravelry.getAuthDataFromFile
    assert auth.username != nil
    assert auth.accessKey != nil
    assert auth.personalKey != nil
  end 

  test "can create URL for Get request, given an endpoint" do
    endpoint = "/needles/list.json"
    getRequest = Ravelry.buildRequest(endpoint)
    assert String.contains?(getRequest, endpoint)
  end

  test "can display a returned piece of JSON" do
    {:ok, response} = Ravelry.getRavelryJsonData("/needles/list.json")
    IO.inspect response.body
    assert response.body != nil
  end

 end
