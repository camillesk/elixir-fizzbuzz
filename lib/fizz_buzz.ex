defmodule FizzBuzz do
  @moduledoc """
  `FizzBuzz` module.
  """

  def build_list(file_name) do
    file_name
    |> File.read()
    |> handle_file_result()
  end

  defp handle_file_result({:ok, file}) do
    result =
      file
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate_numbers/1)

    {:ok, result}
  end

  defp handle_file_result({:error, reason}), do: {:error, "Error reading file: #{reason}"}

  defp convert_and_evaluate_numbers(elem) do
    elem
    |> String.to_integer()
    |> evaluate_number()
  end

  defp evaluate_number(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluate_number(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_number(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_number(number), do: number
end
