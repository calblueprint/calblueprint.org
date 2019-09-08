require 'fileutils'

desc "Runs simulation of comparisons algorithm to find best parameters"
namespace :comparisons do 
    task :simulate do
        sh %{ python3 #{Rails.root.join 'lib', 'comparisons', 'sim.py'} }
    end
end
