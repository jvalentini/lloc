class Lloc < Thor

  desc "count", "Counts logical lines of code, ignoring things like php tags, include statements, class and function declarations, and standalone brackets"
  method_option :showlines, :type => :boolean, :aliases => "-s", :desc => "Display the source lines of code"

  def count(file)
    counter = 0
    File.open(file, 'r') do |f|
      f.each_line do |line|
        match = false
        match = true if line.match /^\s*((\<\?php\b)|\?\>\s*$)/
        match = true if line.match /^\s*\b((include|require)(_once)?)\b/i
        match = true if line.match /^\s*\b(abstract\b\s+)?class\b/i
        match = true if line.match /^\s*\b(abstract\b\s+)?((public|protected|private)\b\s+)?(static\b\s+)?(function)\b/i
        match = true if line.match /^\s*[{}]/i

        unless match
          counter += 1
          puts line if options[:showlines]
        end
      end
    end
    puts counter
    # invoke :count_tags
    # invoke :count_includes
    # invoke :count_requires
    # invoke :count_classes
    # invoke :count_functions
    # invoke :count_brackets
  end

  # desc "count_tags", "Removes php tags"
  # def count_tags()
  #   puts "I will count php tags"
  # end

  # desc "count_includes", "Removes include statements"
  # def count_includes()
  #   puts "I will count includes"
  # end

  # desc "count_requires", "Removes require statements"
  # def count_requires()
  #   puts "I will count requires"
  # end

  # desc "count_classes", "Removes class declaration"
  # def count_classes()
  #   puts "I will count classes"
  # end

  # desc "count_functions", "Removes function declaration"
  # def count_functions()
  #   puts "I will count functions"
  # end

  # desc "count_brackets", "Removes standalone brackets on a single line"
  # def count_brackets()
  #   puts "I will count brackets"
  # end

end
