defmodule HelloElixirTest do
  use ExUnit.Case
  doctest HelloElixir

  test "can multiply" do
    assert HelloElixir.multiply(2, 3) == 6
  end

  test "can square" do
    assert HelloElixir.square(9) == 81
  end

  test "can calculate a cube root" do
    assert HelloElixir.cuberoot(27) == 3
  end

  test "can concatenate strings" do
    assert HelloElixir.concat("hello", " world!") == "hello world!"
  end

  test "can calculate a factorial" do
    # The factorial of 4 == 4 * 3 * 2 * 1 == 24
    assert HelloElixir.factorial(21) == 51090942171709440000
  end

  test "can calculate days from today until Christmas" do
    IO.inspect HelloElixir.daysUntilDate("2017-12-25")
  end

  test "can calculate days between two dates" do
    assert HelloElixir.daysBetweenDates("2017-02-17", "2017-03-03") == 14
  end
  
end
