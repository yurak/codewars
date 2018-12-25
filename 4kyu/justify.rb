def justify(text, width)
  lines_array(text, width)
    .map { |line| line.join(' ') }
    .join("\n")
end

def count_spaces(width, line)
  width - line.join(' ').length
end

def enough_space_for_word?(width, line, word)
  count_spaces(width, line) > word.length
end

def line_has_words?(line)
  line.count > 1
end

def lines_array(text, width)
  text.split.reduce([[]]) do |lines, word|
    line = lines.last

    if enough_space_for_word?(width, line, word)
      line << word
    else
      if line_has_words?(line)
        count_spaces(width, line).times do |i|
          add_spaces_to_line(line, i)
        end
      end

      lines << [word]
    end
    lines
  end
end

def add_spaces_to_line(words, i)
  words[i % (words.count - 1)] += ' '
end
