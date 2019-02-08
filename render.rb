#!/usr/bin/env ruby

require "erb"
require "yaml"
require "ostruct"

# render top level templates
Dir["*.erb"].each do |fullpath|
  puts "rendering #{fullpath}"
  dirname = File.dirname fullpath
  filename = File.basename fullpath, ".erb"
  File.write(File.join(dirname, filename), ERB.new(File.read fullpath).result)
end

# render challenges using the challenges/base.html.erb template
Dir["challenges/*.yaml"].each do |fullpath|
  puts "rendering #{fullpath}"
  dirname = File.dirname fullpath
  filename = File.basename fullpath, ".yaml"
  yaml_data = YAML::load_file fullpath
  out_filename = File.join(dirname, filename) + ".html"
  File.write(out_filename, ERB.new(File.read "challenges/base.html.erb").result(OpenStruct.new(yaml_data).instance_eval { binding }))
end
