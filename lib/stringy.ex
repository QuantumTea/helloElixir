defmodule Stringy do

	def concatenate(valx, valy) do
		# strings are binary arrays in Elixir, test with is_binary(val)
		valx <> valy
	end

	def bottlesOfBeerOnTheWall(bottles) when bottles == 1 do
		"1 bottle of beer on the wall."
	end

	def bottlesOfBeerOnTheWall(bottles) when bottles > 1 do
		numberOfBottles = Integer.to_string(bottles)
		numberOfBottles <> " bottles of beer on the wall."
	end

	def bottlesOfBeerOnTheWall(bottles) when bottles == 0 do
		"No bottles of beer on the wall, go to the store and get some more."
	end

	def bottlesOfBeerOnTheWall(bottles) when bottles < 0 do
		"How can you have a negative number of bottles?"
	end

	# Using guards was tidier and easier than using case
	# def bottlesOfBeerOnTheWall(bottles) do
	# 	case bottles do
	# 		0 -> "No bottles of beer on the wall, go to the store and get some more."
	# 		1 -> "1 bottle of beer on the wall."
	# 		2 -> "2 bottles of beer on the wall."
	# 		_ -> "plenty of bottles here."
	# 	end
	# end
	
	def countTheEs(phrase) do
		result = String.split(phrase, "e")
		Enum.count(result) - 1
	end
end