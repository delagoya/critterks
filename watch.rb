require "watchr"
watch('(.*\.html).haml')  {|md| system("haml -r 'coffee-filter' #{md[1]}.haml > static/#{md[1]}")}
