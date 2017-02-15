defmodule ItalianGeolocations.EtsServer do
  use GenServer

  @data_file "data/coordinate_comuni.csv"

  # Client API

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, [
      {:ets_table_name, :coordinate_comuni}
    ], opts)
  end

  def fetch(comune) do
    case lookup(comune) do
      {:not_found} -> {:error, :not_found}
      {:found, result} -> {:ok, result}
    end
  end

  defp lookup(comune) do
    case GenServer.call(__MODULE__, {:lookup, comune}) do
      [] -> {:not_found}
      [{comune, lat, lng}] -> {:found, %{comune: comune, lat: lat, lng: lng}}
    end
  end


  # Server API

  def init(args) do
    [{:ets_table_name, ets_table_name}] = args

    :ets.new(ets_table_name, [:named_table, :set, :private])

    populate(ets_table_name)

    {:ok, %{ets_table_name: ets_table_name}}
  end

  defp populate(ets_table_name) do
    [_header | rows ] = File.read!(@data_file)
    |> String.split("\n")

    parseAndInsert(rows, ets_table_name)
  end

  defp parseAndInsert(rows, ets_table_name) do
    case rows do
      [] -> {:ok}

      _ ->
        [current | remaining] = rows
        ets_entry =
          current
          |> String.split(",")
          |> List.to_tuple()

        :ets.insert(ets_table_name, ets_entry)
        parseAndInsert(remaining, ets_table_name)
    end
  end


  def handle_call({:lookup, comune}, _from, state) do
    %{ets_table_name: ets_table_name} = state
    result = :ets.lookup(ets_table_name, comune)
    {:reply, result, state}
  end



end
