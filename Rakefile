task default: %w[test]

task :test do
  sh "rspec --tag system"
  sh "rspec --tag ~system"
end

task :ci do
  sh "rspec --tag ~no_ci"
end

task :up do
  sh "rackup -o 0.0.0.0 -p 6001"
end
