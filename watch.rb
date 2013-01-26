require "watch"
Watch.new("*.html.haml") do
  system("haml index.html.haml > static/index.html")
  system("haml lab.html.haml > static/lab.html")
end