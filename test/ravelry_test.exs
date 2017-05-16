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

  test "can log in to Ravelry and get user profile" do
  	
  end

 end