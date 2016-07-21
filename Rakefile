require "bundler/gem_tasks"

desc "Clean the Termbox library build files"
task :clean do
  system 'cd ext && make clean'
end

desc "Compile the Termbox library"
task :compile do
  system 'cd ext && make all'
end
