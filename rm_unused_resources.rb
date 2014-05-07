usage = "Usage: ruby #{$0} <lint xml export file> <path to $PROJECT_DIR>"
if ARGV.size != 2
  puts usage
  exit
end

strs = {}
data = File.open(ARGV.first, "r").read
puts data

data.scan(/<file>file:\/\/\$PROJECT_DIR\$(.+?)<\/file>/im) do |fn|
  full_fn = File.join(ARGV.last, fn.first)
  puts "deleted #{full_fn}"
  File.delete(full_fn)
end





