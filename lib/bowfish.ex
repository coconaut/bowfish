defmodule Bowfish do

	@moduledoc """
		A fun, positional pipe operator, for when the first arg just won't cut it.
    Pipes an expr into function args by replacing the first instance of ":_"
	"""

  @doc ~S"""
  Pipes the expr into the reserved position.

  ## Examples

      # a trivial example -> you'd really just use "|>" here
      iex> import Bowfish
      iex> "bowfish" >>> String.upcase(:_)
      "BOWFISH"

      # piping to functions
      iex> defmodule Test do
      iex>   def div(a, b), do: a / b
      iex> end
      iex> import Bowfish
      iex> 4 >>> Test.div(1, :_)
      0.25

      # using with an anonymous function
      iex> import Bowfish
      iex> add = fn (a, b) -> a + b end
      iex> 5 >>> add.(1, :_)
      6

      # using in a chain
      iex> import Bowfish
      iex> add = fn (a, b, c) -> a + b + c end
      iex> 1 >>> add.(1, 0, :_) >>> Integer.to_string(16, :_)
      "10000"

      # using with the forward pipe operator
      iex> import Bowfish
      iex> add = fn (a, b, c) -> a + b + c end
      iex> 2 
      iex> >>> add.(1, :_, 40) 
      iex> |> Integer.to_string() 
      iex> |> String.codepoints()
      iex> |> Enum.reverse()
      iex> >>> Enum.concat(["1","2"], :_)
      ["1","2","3","4"]
  """
  defmacro left >>> right do
  	bowfish(left, right)
  end

  def bowfish(expr, {call, line, args}) when is_list(args) do
  	case Enum.find_index(args, fn x -> x == :_ end) do
      nil -> raise ArgumentError, "unable to determine index of ':_'"
      idx -> Macro.pipe(expr, {call, line, List.delete_at(args, idx)}, idx)
    end
  end

  def bowfish(expr, _) do
    raise ArgumentError, "cannot pipe to a function that doesn't expect a list of args"
  end
end
