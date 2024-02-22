def stylesheets_full_list
  # Load the existing stylesheets while appending the custom one
  super + %w([ css/oblong.css ])
end
