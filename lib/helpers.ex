defmodule Helpers do
  def run do
    routes = [
      {"/", MyBlog.Handler, []},
      {"/:filename", MyBlog.Handler, []},
      {"/static/[...]", :cowboy_static, {:priv_dir, :my_blog, "static_files"}}
    ]

    dispatch = :cowboy_router.compile([{:_, routes}])

    opts = [port: 8000]
    env = [dispatch: dispatch]

    {:ok, _pid} = :cowboy.start_http(:http, 100, opts, [env: env])
  end
end
