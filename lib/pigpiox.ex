defmodule Pigpiox do
  @moduledoc """
  Pigpiox is an Elixir wrapper around the [pigpio daemon](http://abyz.co.uk/rpi/pigpio/index.html).
  """
  @spec start_link() :: {:ok, pid} | {:error, any}
  def start_link do
    Pigpiox.Supervisor.start_link()
  end
end
