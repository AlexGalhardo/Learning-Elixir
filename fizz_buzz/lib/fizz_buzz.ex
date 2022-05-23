defmodule FizzBuzz do
  def build(file_name) do
    # file = File.read(file_name)
    # IO.inspect(file)

    # {:ok, file} = file = File.read(file_name)

    # case File.read(file_name) do
    #  {:ok, result} -> result
    #  {:error, reason} -> reason
    # end

    # file = File.read(file_name)
    # handle_file_read(file)

    file_name
    |> File.read()
    |> handle_file_read()

    # última linha da função sempre é retornado
    # file
  end

  # pattern matching direto no parametro da função
  defp handle_file_read({:ok, result}) do
    # list = String.split(result, ",") # "1,2,3" -> ["1","2","3"]
    # Enum.map(list, fn number -> String.to_integer(number) end)
    result =
      result
      |> String.split(",")
      # |> Enum.map(&String.to_integer/1)
      |> Enum.map(&convert_and_evaluate_numbers/1)

    {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convert_and_evaluate_numbers(element) do
    # number = String.to_integer(element)
    # evaluate_numbers(number)
    element
    |> String.to_integer()
    |> evaluate_numbers()
  end

  # defp -> são funções privadas que o usuário não possui acesso

  defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_numbers(number), do: number
end
