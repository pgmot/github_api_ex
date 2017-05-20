defmodule GithubApiEx do
  @moduledoc """
  Documentation for GithubApiEx.
  """

  defstruct [:access_token]
  @type t :: %__MODULE__{}

  @end_point "https://api.github.com"

  @spec configure(access_token :: String.t | nil) :: t | nil
  def configure(nil), do: nil
  def configure(access_token), do: %__MODULE__{access_token: access_token}

  @spec zen() :: String.t
  def zen() do
    case HTTPoison.get(build_url("/zen")) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
      _ ->
        ""
    end
  end

  # private

  @spec build_url(path :: String.t) :: String.t
  defp build_url(path) do
    URI.merge(@end_point, path) |> URI.to_string()
  end
end
