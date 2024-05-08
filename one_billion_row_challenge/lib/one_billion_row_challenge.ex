defmodule OneBillionRowChallenge do
  @moduledoc """
  Documentation for `OneBillionRowChallenge`.
  """
  def test_processes do
    # spawn
    # spawn_link
    # spawn_monitor
    # OTP -> Open Telecom Platform
    # GenServer
    # GenStage
    # GenEvent
    # Supervisor
    # Application
    parentPID = self()

    spawn(fn ->
      IO.puts("Enter a message:")
      message = IO.read(:line)
      IO.puts("Sending message: #{message}")
      send(parentPID, {:message, message})
    end)

    receive do
      {:message, message} ->
        IO.puts("Received: #{message}")

      {:command, command, parameters} ->
        IO.puts("Ejecutando comando #{command}")
    after
      5_000 ->
        IO.puts("Se te acabó el tiempo")
    end
  end
end
