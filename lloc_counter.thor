class Lloc < Thor
  package_name "LLOC Counter"

  desc "strip", "Remove include statements, class and function declarations, standalone brackets on a single line"
  def strip(file)
    puts "I wil strip everything"
    File.read(file) do |l|
      puts "YES"
    end
    invoke :strip_includes
    invoke :strip_requires
    invoke :strip_classes
    invoke :strip_functions
    invoke :strip_brackets
  end

  desc "strip_includes", "Removes include statements"
  def strip_includes
    puts "I will strip includes"
  end

  desc "strip_requires", "Removes require statements"
  def strip_requires
    puts "I will strip requires"
  end

  desc "strip_classes", "Removes class declaration"
  def strip_classes
    puts "I will strip classes"
  end

  desc "strip_functions", "Removes function declaration"
  def strip_functions
    puts "I will strip functions"
  end

  desc "strip_brackets", "Removes standalone brackets on a single line"
  def strip_brackets
    puts "I will strip brackets"
  end

end
