#!/usr/bin/env ruby
# frozen_string_literal: true

require 'cocoapods'

deprecated_podspecs = Dir['Specs/*/*.podspec.json'].sort.select do |podspec_path|
  podspec = Pod::Specification.from_file(podspec_path)
  podspec.deprecated?
end
puts deprecated_podspecs
