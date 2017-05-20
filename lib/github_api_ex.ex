defmodule GithubApiEx do
  @moduledoc """
  Documentation for GithubApiEx.
  """

  defstruct [:access_token]
  @type t :: %__MODULE__{}

  @spec configure(access_token :: String.t | nil) :: t | nil
  def configure(nil), do: nil
  def configure(access_token), do: %__MODULE__{access_token: access_token}
end
