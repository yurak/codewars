def valid_parentheses(string)
  #delete all symbols
  string = string.delete('^()')

  while string.gsub!("()",''); end
  string == ''
end
