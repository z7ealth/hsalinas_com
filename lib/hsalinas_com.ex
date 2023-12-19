defmodule HsalinasCom do
  use Phoenix.Component

  @output_dir "./dist"

  def index(assigns) do
    ~H"""
    <.layout>
      <h1>Jason's Personal website!!</h1>
    </.layout>
    """
  end

  def layout(assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>HTML 5 Boilerplate</title>
        <link rel="stylesheet" href="./assets/app.css" />
        <script type="text/javascript" src="./assets/app.js" />
      </head>
      <body>
        <div class="flex w-screen h-screen bg-slate-900">
          <%= render_slot(@inner_block) %>
        </div>
      </body>
    </html>
    """
  end

  def build() do
    File.mkdir_p!(@output_dir)
    render_file("index.html", index([]))

    :ok
  end

  def render_file(path, rendered) do
    safe = Phoenix.HTML.Safe.to_iodata(rendered)
    output = Path.join([@output_dir, path])
    File.write!(output, safe)
  end
end
