defmodule ItalianGeolocations.LogIp do

  def init(_), do: nil

  def call(conn, _) do
    remote_ip =
      conn.remote_ip
      |> Tuple.to_list
      |> Enum.join(".")

    Logger.metadata([ip: remote_ip])
    conn
  end

end