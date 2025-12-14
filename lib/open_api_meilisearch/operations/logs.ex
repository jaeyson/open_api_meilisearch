defmodule OpenApiMeilisearch.Logs do
  @moduledoc """
  Provides API endpoints related to logs
  """

  @default_client OpenApiMeilisearch.Client

  @doc """
  Stop retrieving logs

  Call this route to make the engine stops sending logs through the `POST /logs/stream` route.
  """
  @spec cancel_logs(opts :: keyword) :: :ok | {:error, OpenApiMeilisearch.ResponseError.t()}
  def cancel_logs(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {OpenApiMeilisearch.Logs, :cancel_logs},
      url: "/logs/stream",
      method: :delete,
      response: [{204, :null}, {401, {OpenApiMeilisearch.ResponseError, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieve logs

  Stream logs over HTTP. The format of the logs depends on the configuration specified in the payload.
  The logs are sent as multi-part, and the stream never stops, so make sure your clients correctly handle that.
  To make the server stop sending you logs, you can call the `DELETE /logs/stream` route.

  There can only be one listener at a timeand an error will be returned if you call this route while it's being used by another client.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec get_logs(body :: OpenApiMeilisearch.GetLogs.t(), opts :: keyword) ::
          {:ok, String.t()} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def get_logs(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenApiMeilisearch.Logs, :get_logs},
      url: "/logs/stream",
      body: body,
      method: :post,
      request: [{"application/json", {OpenApiMeilisearch.GetLogs, :t}}],
      response: [
        {200, :string},
        {400, {OpenApiMeilisearch.ResponseError, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update target of the console logs

  This route lets you specify at runtime the level of the console logs outputted on stderr.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_stderr_target(body :: OpenApiMeilisearch.UpdateStderrLogs.t(), opts :: keyword) ::
          :ok | {:error, OpenApiMeilisearch.ResponseError.t()}
  def update_stderr_target(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenApiMeilisearch.Logs, :update_stderr_target},
      url: "/logs/stderr",
      body: body,
      method: :post,
      request: [{"application/json", {OpenApiMeilisearch.UpdateStderrLogs, :t}}],
      response: [{204, :null}, {401, {OpenApiMeilisearch.ResponseError, :t}}],
      opts: opts
    })
  end
end
