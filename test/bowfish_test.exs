defmodule BowfishTest do
  use ExUnit.Case
  doctest Bowfish

  test "bowfish" do
  	assert Bowfish.bowfish(5, quote(do: foo(1, :_))) == quote(do: foo(1, 5))
  	assert Bowfish.bowfish(5, quote(do: foo(:_, 1))) == quote(do: foo(5, 1))
  	assert Bowfish.bowfish(5, quote(do: foo(1, :_, 2))) == quote(do: foo(1, 5, 2))
  end

  test "bowfish raises error on bad args" do
  	assert_raise ArgumentError, ~r"cannot pipe to a function that doesn't expect a list of args", fn ->
      Bowfish.bowfish(1, 2)
    end

    assert_raise ArgumentError, ~r"cannot pipe to a function that doesn't expect a list of args", fn ->
      Bowfish.bowfish(1, {:ok})
    end

    assert_raise ArgumentError, ~r"cannot pipe to a function that doesn't expect a list of args", fn ->
      Bowfish.bowfish(1, :ok)
    end
  end

  test "bowfish errors when :_ not present" do
  	assert_raise ArgumentError, ~r"unable to determine index of ':_'", fn ->
			Bowfish.bowfish(5, quote(do: foo(1, 2)))
		end
  end
end
