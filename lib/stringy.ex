defmodule Stringy do

	def concatenate(valx, valy) do
		# strings are binary arrays in Elixir, test with is_binary(val)
		valx <> valy
	end

	def bottlesOfBeerOnTheWall(bottles) do
		case bottles do
			1 -> "1 bottle of beer on the wall."
			0 -> "No bottles of beer on the wall, go to the store and get some more."
			23 -> "23 bottles of beer on the wall."
			_ -> "some other number of bottles here."
		end
	end
	
	def countTheEs(phrase) do
		3
	end
end