defmodule Pigpiox.Supervisor do
  @moduledoc false
  use Supervisor

  alias Pigpiox.{Socket, Watcher}

  @spec start_link :: {:ok, pid} | {:error, term}
  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @spec init(:ok) :: {:ok, {:supervisor.sup_flags(), [:supervisor.child_spec()]}}
  def init(:ok) do
    children = [
      {Socket, [name: Socket]},
      {DynamicSupervisor, strategy: :one_for_one, name: Watcher.Supervisor}
    ]

    Supervisor.init(children, strategy: :rest_for_one)
  end
end
