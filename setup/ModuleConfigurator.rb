require 'fileutils'
require 'find'

module Project

	class ModuleConfigurator

        attr_reader :module_name
        attr_reader :module_template_dir
        attr_reader :placeholder

		def initialize(module_name, module_template_dir)
			@module_name = module_name
			@module_template_dir = module_template_dir
			@placeholder = "_MODULE_"
		end
		
		def run

			createModuleDir
			rename_template_files
			replace_variables_in_files

		end

		def createModuleDir

			Dir.mkdir(@module_name)
			FileUtils.cp_r(Dir['templates/'+@module_template_dir+'/*'], @module_name)

		end

		def rename_template_files
			Find.find(@module_name) do |path|
				if File.file?(path)
					if path.include? @placeholder
						replacedName = path.gsub(@placeholder, @module_name)
						File.rename(path, replacedName)	
					end
				end
			end
		end

		def replace_variables_in_files
			Find.find(@module_name) do |path|
				if File.file?(path)
					text = File.read(path)
					text.gsub!(@placeholder, @module_name)
					text.gsub!("${YEAR}", year)
					text.gsub!("${DATE}", date)
					File.open(path, "w") { |file| file.puts text }
				end
			end
		end

		def year
			Time.now.year.to_s
		end

		def date
			Time.now.strftime "%m/%d/%Y"
		end
	end

end