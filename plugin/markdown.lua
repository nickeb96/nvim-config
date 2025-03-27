
local PORT = 8000


local HTML_TEMPLATE = [[
<html>
  <head>
    <meta charset="utf-8" />
    <title>%s</title>
    <style>
      %s
    </style>
  </head>
  <body>
    <main>
      %s
    </main>
  </body>
</html>
]]


local CSS = [[
body {
  font-family: sans-serif;
  color: #c5c8c6;
  background: #1d1f21;
}
main {
  margin: 0 10%;
}
h1 {
  margin-top: 2.5em;
}
h2 {
  margin-top: 2em;
}
h3 {
  margin-top: 1.5em;
}
h4, h5, h6 {
  margin-top: 1em;
}
ul, ol {
  padding-left: 30px;
}
ul>li, ol>li {
  padding-left: 10px;
}
blockquote {
  margin-left: 20px;
  border-radius: 8px;
  padding: 8px;
  background-color: #2b2d2f;
}
blockquote>* {
  margin: 0px;
}
pre {
  margin: 10px 20px;
}
:link {
  color: #8ea0f3;
}
:visited {
  color: #af6cec;
}
]]


local function get_buffer_content()
  local num_lines = vim.api.nvim_buf_line_count(0)
  return vim.api.nvim_buf_get_lines(0, 0, num_lines, false)
end


local function convert_buffer()
  local lines = get_buffer_content()
  local job = vim.system(
    {"pulldown-cmark", "-SFLPHT"},
    {stdin=lines, text=true}
  )
  local result = job:wait()
  return string.format(
    HTML_TEMPLATE,
    "Markdown Viewer",
    CSS,
    result.stdout
  )
end


local function server_respond(client, response)
  local lines = {
    string.format("HTTP/1.1 %d %s", response.code, response.message),
    "Accept: text/html",
    "Accept-Encoding: identity",
    "Content-Type: text/html",
  }
  local raw_response
  if response.body then
    table.insert(lines, "Content-Length: "..#response.body)
    raw_response = table.concat(lines, "\r\n").."\r\n\r\n"..response.body
  else
    raw_response = table.concat(lines, "\r\n").."\r\n\r\n"
  end
  client:write(raw_response)
  client:shutdown()
  client:close()
end


local function server_parse_request(request)
  local lines = {}
  local line_start = 1
  local start_of_body = nil
  while true do
    local line_end, next_line = string.find(request, "\r\n", line_start)
    line_end = line_end and line_end - 1 or #request
    if line_start > line_end then
      start_of_body = next_line + 1
      break
    end
    table.insert(lines, request:sub(line_start, line_end))
    if next_line == nil then
      break
    else
      line_start = next_line + 1
    end
  end
  local temp = {}
  for s in lines[1]:gmatch("([^%s]+)") do
    table.insert(temp, s)
  end
  local method, path, version = unpack(temp)
  -- if version ~= "HTTP/1.0" then
  --   error("HTTP version 1.0 expected")
  -- end
  local headers = {}
  for i = 2, #lines do
    local iter = lines[i]:gmatch("([^:]+)")
    headers[iter():gsub("%s+", "")] = iter():gsub("%s+", "")
  end
  return {
    method = method,
    path = path,
    headers = headers,
    body = request:sub(start_of_body),
  }
end


local function server_handle_request(client, raw_request)
  local request = server_parse_request(raw_request)
  if request.method == "GET" and request.path == "/" then
    server_respond(client, {
      code = 200,
      message = "OK",
      body = convert_buffer(),
    })
  else
    server_respond(client, {
      code = 404,
      message = "Not Found",
    })
  end
end


local function make_a_server()
  local server = vim.uv.new_tcp()
  server:bind("127.0.0.1", PORT)
  server:listen(128, function(bind_error)
    local client = vim.uv.new_tcp()
    server:accept(client)
    client:read_start(vim.schedule_wrap(function(read_error, chunk)
      if read_error then
        return
      end
      server_handle_request(client, chunk)
    end))
  end)
end


local function markdown_view(options)
  make_a_server()
  if not options.bang then
    local job = vim.system(
      {"open", "http://127.0.0.1:"..PORT.."/"}
    )
    job:wait()
  else
    print("TCP server listening at 127.0.0.1 port "..PORT)
  end
end


vim.api.nvim_create_user_command("Md", markdown_view, {bang = true})


