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
|> Enum.reverse()
>>> Enum.concat(["1","2"], :_)
# ["1","2","3","4"]
```

## Installation

Available in hex. The package can be installed as:

  1. Add bowfish to your list of dependencies in `mix.exs`:

        def deps do
          [{:bowfish, "~> 0.1.0"}]
        end

  2. Import bowfish in your module.

## License

This really doesn't merit one... but in case that's some kind of sticking point: MIT.

## Never stop piping... never stop...

