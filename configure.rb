#!/usr/bin/env ruby

$current_dir = File.dirname(File.expand_path(__FILE__))
Dir[File.join($current_dir, "setup/*rb")].each do |file|
	require_relative(file)
end

module_name = ARGV[0]
module_template_dir = ARGV[1]
Project::ModuleConfigurator.new(module_name, module_template_dir).run