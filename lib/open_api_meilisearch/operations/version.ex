defmodule OpenApiMeilisearch.Version do
  @moduledoc """
  Provides API endpoint related to version
  """

  @default_client OpenApiMeilisearch.Client

  @doc """
  Get version

  Current version of Meilisearch.
  """
  @spec get_version(opts :: keyword) ::
          {:ok, OpenApiMeilisearch.VersionResponse.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def get_version(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {OpenApiMeilisearch.Version, :get_version},
      url: "/version",
      method: :get,
      response: [
        {200, {OpenApiMeilisearch.VersionResponse, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end
end
