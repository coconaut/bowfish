# Bowfish

A fun, positional pipe operator >>> for when piping to the first arg just won't cut it.

Bowfish is implemented as a macro. It makes use of the Macro.pipe function called by the standard Elixir forward pipe operator.

## Usage

```elixir
import Bowfish

# --- a trivial example ---
"bowfish" >>> String.upcase(:_)
# "BOWFISH"

# --- piping to functions ---
defmodule Test do
  def div(a, b), do: a / b
end

4 >>> Test.div(1, :_)
# 0.25

# --- using with an anonymous function ---
add = fn (a, b) -> a + b end

5 >>> add.(1, :_)
# 6

# --- using in a chain ---
add = fn (a, b, c) -> a + b + c end

1 >>> add.(1, 0, :_) >>> Integer.to_string(16, :_)
# "10000"

# --- using with the forward pipe operator ---
add = fn (a, b, c) -> a + b + c end

2 
>>> add.(1, :_, 40) 
|> Integer.to_string() 
|> String.codepoints()
>>> Enum.concat(:_, ["2","1"])
|> Enum.reverse()
# ["1","2","3","4"]
```

## Installation

(NOT YET IN HEX!)

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add bowfish to your list of dependencies in `mix.exs`:

        def deps do
          [{:bowfish, "~> 0.0.1"}]
        end

  2. Import bowfish in your module.

## Never stop piping...

