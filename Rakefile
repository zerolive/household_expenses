task default: %w[test]

task :test do
  sh "rspec"
end

task :up do
  sh "rackup -o 0.0.0.0 -p 6001"
end
