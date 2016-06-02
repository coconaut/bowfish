# Bowfish

A fun, positional pipe operator, for when the first arg just won't cut it.
Bowfish, or >>>, is implemented as a macro.
It makes use of the Macro.pipe function called by the standard forward pipe operator (|>)

## Installation

(NOT YET IN HEX!)

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add bowfish to your list of dependencies in `mix.exs`:

        def deps do
          [{:bowfish, "~> 0.0.1"}]
        end

  2. Ensure bowfish is started before your application:

        def application do
          [applications: [:bowfish]]
        end

