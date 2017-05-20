defmodule GithubApiExTest do
  use ExUnit.Case
  doctest GithubApiEx

  import Mock

  describe "configure" do
    test "set access_token" do
      github = GithubApiEx.configure("access_token")

      assert(github.access_token == "access_token")
    end

    test "set nil" do
      github = GithubApiEx.configure(nil)

      assert(is_nil(github))
    end
  end

  describe "zen" do
    test "ok" do
      with_mock HTTPoison, [get: fn(_url) -> {:ok, %HTTPoison.Response{status_code: 200, body: "zenzen"}} end] do
        zen = GithubApiEx.zen

        assert called HTTPoison.get("https://api.github.com/zen")
        assert zen == "zenzen"
      end
    end

    test "ng" do
      with_mock HTTPoison, [get: fn(_url) -> {:error, %HTTPoison.Error{reason: :not}} end] do
        zen = GithubApiEx.zen

        assert called HTTPoison.get("https://api.github.com/zen")
        assert zen == ""
      end
    end
  end
end
