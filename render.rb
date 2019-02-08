#!/usr/bin/env ruby

require "erb"

Dir["*.erb"].each do |pathname|
  File.write(File.basename(pathname, ".erb"), ERB.new(File.read pathname).result)
end
