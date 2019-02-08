#!/usr/bin/env ruby

require "erb"

Dir["**/*.erb"].each do |fullpath|
  dirname = File.dirname fullpath
  filename = File.basename fullpath, ".erb"
  File.write(File.join(dirname, filename), ERB.new(File.read fullpath).result)
end
