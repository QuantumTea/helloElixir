defmodule StringysTest do
  use ExUnit.Case
  doctest Stringy

  test "can concatenate strings" do
    assert Stringy.concatenate("hello", " world!") == "hello world!"
  end

  test "can count bottles of beer on the wall" do
    assert Stringy.bottlesOfBeerOnTheWall(1) == "1 bottle of beer on the wall."
    assert Stringy.bottlesOfBeerOnTheWall(0) == "No bottles of beer on the wall, go to the store and get some more."
    assert Stringy.bottlesOfBeerOnTheWall(23) == "23 bottles of beer on the wall."
    assert Stringy.bottlesOfBeerOnTheWall(47) == "some other number of bottles here."
  end

  test "can count the number of e's in a given phrase" do
    assert Stringy.countTheEs("The quick brown fox jumps over the lazy dog") == 3
  end
  
end
