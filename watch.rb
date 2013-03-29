require "watchr"
watch('(.*\.html).haml')  {|md| system("haml #{md[1]}.haml > static/#{md[1]}")}
