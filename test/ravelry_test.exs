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

  test "can successfully retrieve a JSON file from endpoint with authentication" do
    response = Ravelry.getRavelryJsonData("/needles/list.json")
    #IO.inspect(response)
    refute response = nil
    assert HTTPotion.Response.success?(response)
    assert response.status_code == 200
    assert String.contains?(response.body, "Blackthorn")
    refute String.contains?(response.body, "Merino")
  end

 end
