usage = "Usage: ruby #{$0} <path to strings.xml>"
if ARGV.size != 1
  puts usage
  exit
end


strs = {}
data = File.open(ARGV.first, "r").read
data.scan(/<\s*string\s*(.+?)>(.+?)<\s*\/string\s*>/im) do |atts,data|
  if (atts =~ /name\s*=\s*["'](.*?)["']/i)
    strs[$1] = {:atts => atts, :data => data}
  else
    raise Exception, "Bad string: #{atts} => #{data}"
  end
end


prev_prefix = ""

puts %Q{<?xml version="1.0" encoding="utf-8"?>}
puts "<resources>"
for s in strs.keys.sort{|a,b| a.downcase <=> b.downcase}
  atts, data = strs[s][:atts], strs[s][:data]

  prefix = s.split("_").first
  if (prefix == s)
    if (prefix =~ /^([A-Za-z][a-z]+)[A-Z]/)
      prefix = $1
    end
  end

  if (prefix != prev_prefix)
    puts ""
    prev_prefix = prefix
  end

  puts "  <string #{atts}>#{data}</string>"
end
puts ""
puts "</resources>"