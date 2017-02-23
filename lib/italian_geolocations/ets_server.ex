defmodule ItalianGeolocations.EtsServer do
  @moduledoc """
    A module providing an in-memory database using an ETS table.
    ItalianGeolocations.EtsServer uses the GenServer behavior
    It initializes and populates an ets_table named :coordinate_comuni
    with records (as tuples) containing the name of italian cities and their coordinates.
    The first element of the record tuple is the downcased city name, which is used
    to lookup city's data by matching it with the downcased request's parameter.
  """
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
      {:not_found} -> {:error, :not_found, comune}
      {:found, result} -> {:ok, result}
    end
  end

  defp lookup(comune) do
    case GenServer.call(__MODULE__, {:lookup, comune}) do
      [] -> {:not_found}
      [{_key, name, lat, lng}] -> {:found, %{name: name, lat: lat, lng: lng}}
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
    [_header | rows ] =
      File.read!(@data_file)
      |> String.split("\n")

    parseAndInsert(rows, ets_table_name)
  end

  defp parseAndInsert([], _ets_table_name), do: { :ok }
  defp parseAndInsert(rows, ets_table_name) do
    [current | remaining] = rows
    entry = String.split(current, ",")
    ets_record = {
      String.downcase(Enum.at(entry, 0)), # downcased city name as the table key
      Enum.at(entry, 0),                  # actual city name with appropriate casing
      Enum.at(entry, 1),                  # latitude
      Enum.at(entry, 2),                  # longitude
    }

    :ets.insert(ets_table_name, ets_record)
    parseAndInsert(remaining, ets_table_name)
  end


  def handle_call({:lookup, comune}, _from, state) do

    # downcase the query parameter to match downcased keys in ets_table
    searched_comune = String.downcase(comune)

    %{ets_table_name: ets_table_name} = state
    result = :ets.lookup(ets_table_name, searched_comune)

    {:reply, result, state}
  end



end
