# require "rubygems"

class GitSmart
end

require "./core_ext/*"
require "./git-smart/*"
require "./commands/*"
# %w[core_ext git-smart commands].each { |dir|
#   Dir.glob(File.join(File.dirname(__FILE__), dir, "**", "*.cr")) { |f| require f.to_s }
# }
