defmodule ItalianGeolocations.LogIp do
  @moduledoc """
    A module plug that adds the requests' remote ip to the logger file backend
  """

  def init(_), do: {:ok}

  def call(conn, _) do
    remote_ip =
      conn.remote_ip
      |> Tuple.to_list
      |> Enum.join(".")

    Logger.metadata([ip: remote_ip])
    conn
  end

end