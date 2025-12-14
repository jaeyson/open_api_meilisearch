defmodule OpenApiMeilisearch.Tasks do
  @moduledoc """
  Provides API endpoints related to tasks
  """

  @default_client OpenApiMeilisearch.Client

  @doc """
  Cancel tasks

  Cancel enqueued and/or processing [tasks](https://www.meilisearch.com/docs/learn/async/asynchronous_operations)

  ## Options

    * `uids`: Permits to filter tasks by their uid. By default, when the `uids` query parameter is not set, all task uids are returned. It's possible to specify several uids by separating them with the `,` character.
    * `batchUids`: Lets you filter tasks by their `batchUid`.
    * `canceledBy`: Permits to filter tasks using the uid of the task that canceled them. It's possible to specify several task uids by separating them with the `,` character.
    * `types`: Permits to filter tasks by their related type. By default, when `types` query parameter is not set, all task types are returned. It's possible to specify several types by separating them with the `,` character.
    * `statuses`: Permits to filter tasks by their status. By default, when `statuses` query parameter is not set, all task statuses are returned. It's possible to specify several statuses by separating them with the `,` character.
    * `indexUids`: Permits to filter tasks by their related index. By default, when `indexUids` query parameter is not set, the tasks of all the indexes are returned. It is possible to specify several indexes by separating them with the `,` character.
    * `afterEnqueuedAt`: Permits to filter tasks based on their enqueuedAt time. Matches tasks enqueued after the given date. Supports RFC 3339 date format.
    * `beforeEnqueuedAt`: Permits to filter tasks based on their enqueuedAt time. Matches tasks enqueued before the given date. Supports RFC 3339 date format.
    * `afterStartedAt`: Permits to filter tasks based on their startedAt time. Matches tasks started after the given date. Supports RFC 3339 date format.
    * `beforeStartedAt`: Permits to filter tasks based on their startedAt time. Matches tasks started before the given date. Supports RFC 3339 date format.
    * `afterFinishedAt`: Permits to filter tasks based on their finishedAt time. Matches tasks finished after the given date. Supports RFC 3339 date format.
    * `beforeFinishedAt`: Permits to filter tasks based on their finishedAt time. Matches tasks finished before the given date. Supports RFC 3339 date format.

  """
  @spec cancel_tasks(opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def cancel_tasks(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :afterEnqueuedAt,
        :afterFinishedAt,
        :afterStartedAt,
        :batchUids,
        :beforeEnqueuedAt,
        :beforeFinishedAt,
        :beforeStartedAt,
        :canceledBy,
        :indexUids,
        :statuses,
        :types,
        :uids
      ])

    client.request(%{
      args: [],
      call: {OpenApiMeilisearch.Tasks, :cancel_tasks},
      url: "/tasks/cancel",
      method: :post,
      query: query,
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {400, {OpenApiMeilisearch.ResponseError, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}},
        {404, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete tasks

  Delete [tasks](https://docs.meilisearch.com/learn/advanced/asynchronous_operations.html) on filter

  ## Options

    * `uids`: Permits to filter tasks by their uid. By default, when the `uids` query parameter is not set, all task uids are returned. It's possible to specify several uids by separating them with the `,` character.
    * `batchUids`: Lets you filter tasks by their `batchUid`.
    * `canceledBy`: Permits to filter tasks using the uid of the task that canceled them. It's possible to specify several task uids by separating them with the `,` character.
    * `types`: Permits to filter tasks by their related type. By default, when `types` query parameter is not set, all task types are returned. It's possible to specify several types by separating them with the `,` character.
    * `statuses`: Permits to filter tasks by their status. By default, when `statuses` query parameter is not set, all task statuses are returned. It's possible to specify several statuses by separating them with the `,` character.
    * `indexUids`: Permits to filter tasks by their related index. By default, when `indexUids` query parameter is not set, the tasks of all the indexes are returned. It is possible to specify several indexes by separating them with the `,` character.
    * `afterEnqueuedAt`: Permits to filter tasks based on their enqueuedAt time. Matches tasks enqueued after the given date. Supports RFC 3339 date format.
    * `beforeEnqueuedAt`: Permits to filter tasks based on their enqueuedAt time. Matches tasks enqueued before the given date. Supports RFC 3339 date format.
    * `afterStartedAt`: Permits to filter tasks based on their startedAt time. Matches tasks started after the given date. Supports RFC 3339 date format.
    * `beforeStartedAt`: Permits to filter tasks based on their startedAt time. Matches tasks started before the given date. Supports RFC 3339 date format.
    * `afterFinishedAt`: Permits to filter tasks based on their finishedAt time. Matches tasks finished after the given date. Supports RFC 3339 date format.
    * `beforeFinishedAt`: Permits to filter tasks based on their finishedAt time. Matches tasks finished before the given date. Supports RFC 3339 date format.

  """
  @spec delete_tasks(opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def delete_tasks(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :afterEnqueuedAt,
        :afterFinishedAt,
        :afterStartedAt,
        :batchUids,
        :beforeEnqueuedAt,
        :beforeFinishedAt,
        :beforeStartedAt,
        :canceledBy,
        :indexUids,
        :statuses,
        :types,
        :uids
      ])

    client.request(%{
      args: [],
      call: {OpenApiMeilisearch.Tasks, :delete_tasks},
      url: "/tasks",
      method: :delete,
      query: query,
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {400, {OpenApiMeilisearch.ResponseError, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}},
        {404, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a task

  Get a [task](https://www.meilisearch.com/docs/learn/async/asynchronous_operations)
  """
  @spec get_task(taskUid :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.TaskView.t()} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def get_task(taskUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [taskUid: taskUid],
      call: {OpenApiMeilisearch.Tasks, :get_task},
      url: "/tasks/#{taskUid}",
      method: :get,
      response: [
        {200, {OpenApiMeilisearch.TaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}},
        {404, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get all tasks

  Get all [tasks](https://docs.meilisearch.com/learn/advanced/asynchronous_operations.html)

  ## Options

    * `limit`: Maximum number of results to return.
    * `from`: Fetch the next set of results from the given uid.
    * `reverse`: The order you want to retrieve the objects.
    * `batchUids`: Permits to filter tasks by their batch uid. By default, when the `batchUids` query parameter is not set, all task uids are returned. It's possible to specify several batch uids by separating them with the `,` character.
    * `uids`: Permits to filter tasks by their uid. By default, when the uids query parameter is not set, all task uids are returned. It's possible to specify several uids by separating them with the `,` character.
    * `canceledBy`: Permits to filter tasks using the uid of the task that canceled them. It's possible to specify several task uids by separating them with the `,` character.
    * `types`: Permits to filter tasks by their related type. By default, when `types` query parameter is not set, all task types are returned. It's possible to specify several types by separating them with the `,` character.
    * `statuses`: Permits to filter tasks by their status. By default, when `statuses` query parameter is not set, all task statuses are returned. It's possible to specify several statuses by separating them with the `,` character.
    * `indexUids`: Permits to filter tasks by their related index. By default, when `indexUids` query parameter is not set, the tasks of all the indexes are returned. It is possible to specify several indexes by separating them with the `,` character.
    * `afterEnqueuedAt`: Permits to filter tasks based on their enqueuedAt time. Matches tasks enqueued after the given date. Supports RFC 3339 date format.
    * `beforeEnqueuedAt`: Permits to filter tasks based on their enqueuedAt time. Matches tasks enqueued before the given date. Supports RFC 3339 date format.
    * `afterStartedAt`: Permits to filter tasks based on their startedAt time. Matches tasks started after the given date. Supports RFC 3339 date format.
    * `beforeStartedAt`: Permits to filter tasks based on their startedAt time. Matches tasks started before the given date. Supports RFC 3339 date format.
    * `afterFinishedAt`: Permits to filter tasks based on their finishedAt time. Matches tasks finished after the given date. Supports RFC 3339 date format.
    * `beforeFinishedAt`: Permits to filter tasks based on their finishedAt time. Matches tasks finished before the given date. Supports RFC 3339 date format.

  """
  @spec get_tasks(opts :: keyword) ::
          {:ok, OpenApiMeilisearch.AllTasks.t()} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def get_tasks(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :afterEnqueuedAt,
        :afterFinishedAt,
        :afterStartedAt,
        :batchUids,
        :beforeEnqueuedAt,
        :beforeFinishedAt,
        :beforeStartedAt,
        :canceledBy,
        :from,
        :indexUids,
        :limit,
        :reverse,
        :statuses,
        :types,
        :uids
      ])

    client.request(%{
      args: [],
      call: {OpenApiMeilisearch.Tasks, :get_tasks},
      url: "/tasks",
      method: :get,
      query: query,
      response: [
        {200, {OpenApiMeilisearch.AllTasks, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end
end
