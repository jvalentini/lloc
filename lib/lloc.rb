class Lloc < Thor

  desc "count", "Counts logical lines of code, ignoring things like php tags, include statements, class and function declarations, and standalone brackets"
  option :showlines, :type => :boolean, :aliases => "-s", :desc => "Display the source lines of code counted"

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
  end

end
