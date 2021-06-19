defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "build_list/1" do
    test "when valid file given, returns the converted list" do
      assert {:ok, [1, 2, :fizz, 4, :buzz, :fizz, 7, 8, :fizz, :buzz, :fizzbuzz, :buzz]} =
               FizzBuzz.build_list("numbers.txt")
    end

    test "when file doesnt exists, returns error" do
      assert {:error, _reason} = FizzBuzz.build_list("invalid.txt")
    end

    test "when number % 3 is zero returns fizz" do
      assert {:ok, [:fizz]} = FizzBuzz.build_list("3.txt")
    end

    test "when number % 5 is zero returns fizz" do
      assert {:ok, [:buzz]} = FizzBuzz.build_list("5.txt")
    end

    test "when number % 3 == 0 and number % 5 == zero returns fizz" do
      assert {:ok, [:fizzbuzz]} = FizzBuzz.build_list("15.txt")
    end
  end
end
