defmodule Bowfish do

	@moduledoc """
		A fun, positional pipe operator, for when the first arg just won't cut it.
    Pipes an expr into function args by replacing the first instance of ":_"
	"""

  @doc ~S"""
  Pipes the expr into the reserved position.

  ## Examples

      iex> import Bowfish
      nil

      fn x -> x + 1 end 
      >>> Enum.map([1, 2, 3], :_)

  """
  defmacro left >>> right do
  	bowfish(left, right)
  end

  def bowfish(expr, {call, line, args} = call_args) when is_list(args) do
  	case Enum.find_index(args, fn x -> x == :_ end) do
      nil -> raise ArgumentError, "Unable to determine index of ':_'"
      idx -> Macro.pipe(expr, {call, line, List.delete_at(args, idx)}, idx)
    end
  end

  def bowfish(_) do
    raise ArgumentError, "cannot pipe to a function that doesn't expect a list of args"
  end
end
