defmodule OpenApiMeilisearch.Health do
  @moduledoc """
  Provides API endpoint related to health
  """

  @default_client OpenApiMeilisearch.Client

  @doc """
  Get Health

  The health check endpoint enables you to periodically test the health of your Meilisearch instance.
  """
  @spec get_health(opts :: keyword) :: {:ok, OpenApiMeilisearch.HealthResponse.t()} | :error
  def get_health(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {OpenApiMeilisearch.Health, :get_health},
      url: "/health",
      method: :get,
      response: [{200, {OpenApiMeilisearch.HealthResponse, :t}}],
      opts: opts
    })
  end
end
