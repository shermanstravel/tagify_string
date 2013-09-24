require "bundler/gem_tasks"

desc "Open an interactive session preloaded with this gem's code"
task :console do
  if gem_available?("pry")
    sh "pry -I lib -r tagify_string.rb"
  else
    sh "irb -rubygems -I lib -r tagify_string.rb"
  end
end

#
# Determins if a gem is available at the current runtime
#
def gem_available?(name)
  Gem::Specification.find_by_name(name)
rescue Gem::LoadError
  false
rescue
  Gem.available?(name) #for backwards compatibility
end