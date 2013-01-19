require "watch"
Watch.new("index.html.haml") do
  system("haml index.html.haml > static/index.html")
end