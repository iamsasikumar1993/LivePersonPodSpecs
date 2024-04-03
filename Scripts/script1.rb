#!/usr/bin/env ruby
# frozen_string_literal: true

require 'cocoapods'
source = Pod::Source.new('Specs')
pods = source.pods
STDERR.puts pods

File.open("all_pods.txt", 'w') do |file|
  pods.each do |pod|
    file.puts pod
  end
end
STDERR.puts "Total pod count: #{pods.count}"

#deprecated_podspecs = Dir['Specs/*/*.podspec.json'].sort.select do |podspec_path|
#  podspec = Pod::Specification.from_file(podspec_path)
##  podspec.deprecated?
#end
#puts deprecated_podspecs
#
#File.open("deprecated_podspecs.txt", 'w') do |file|
#  deprecated_podspecs.each do |podspec_path|
#    file.puts podspec_path
#  end
#end
#STDERR.puts "Deprecated podspec count: #{deprecated_podspecs.count}"
