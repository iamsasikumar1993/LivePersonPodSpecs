#!/usr/bin/env ruby
# frozen_string_literal: true

require 'cocoapods'
require 'fileutils'
require 'json'


if Dir.exist?('Specs')
    FileUtils.remove_dir('Specs')
end

Dir.mkdir 'Specs'
Dir['LPMessagingSDK/*'].each do |path|
    
    podspec_json_string = %x(pod ipc spec "LPMessagingSDK/#{File.basename(path)}/LPMessagingSDK.podspec")
    podspec_json = JSON.parse(podspec_json_string)
    pretty_str = JSON.pretty_unparse(podspec_json)
    spec_dir = "Specs/" + File.basename(path)
    spec_path = spec_dir + "/LPMessagingSDK.podspec.json"
    Dir.mkdir spec_dir
    output = File.open(spec_path,"w" )
    output << pretty_str
    output.close
end
