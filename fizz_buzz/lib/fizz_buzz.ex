defmodule FizzBuzz do
  def build(file_name) do
    # file = File.read(file_name)
    # IO.inspect(file)

    # {:ok, file} = file = File.read(file_name)

    #case File.read(file_name) do
    #  {:ok, result} -> result
    #  {:error, reason} -> reason
    #end

    # file = File.read(file_name)
    # handle_file_read(file)

    file_name
    |> File.read()
    |> handle_file_read()

    # última linha da função sempre é retornado
    # file
  end

  # pattern matching direto no parametro da função
  def handle_file_read({:ok, result}) do
    # list = String.split(result, ",") # "1,2,3" -> ["1","2","3"]
    # Enum.map(list, fn number -> String.to_integer(number) end)
    result
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end
  def handle_file_read({:error, reason}), do: "Error reading the file: #{reason}"
end
