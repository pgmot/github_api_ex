defmodule GithubApiExTest do
  use ExUnit.Case
  doctest GithubApiEx

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
end
