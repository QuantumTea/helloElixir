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
    assert HelloElixir.concatenate("hello", " world!") == "hello world!"
  end

  test "can calculate a factorial" do
    # The factorial of 4 == 4 * 3 * 2 * 1 == 24
    assert HelloElixir.factorial(21) == 51090942171709440000
  end

  test "can calculate days from today until Christmas 2017" do
    result = HelloElixir.daysFromTodayUntilDate("2017-12-25")
    IO.puts "\nDays left till Christmas this year:" 
    IO.puts result
    assert result != 0
  end

  test "can calculate days between two dates" do
    assert HelloElixir.daysBetweenDates("2017-02-17", "2017-03-03") == 14
  end

  test "can count number of Friday 13ths in 2017" do
    # January 2017 and October 2017
    assert (HelloElixir.numberOfFridayThirteenths() == 2)
  end

  test "can count number of Friday 13ths in 2000" do
    # October 2000
    assert (HelloElixir.numberOfFridayThirteenths(2000) == 1)
  end  

end
