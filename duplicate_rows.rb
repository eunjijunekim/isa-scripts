#!/usr/bin/env ruby
input_file = ARGV[0]
input = input_file.split(".")[0]

File.open(input+"_duplicated.txt", "w") do |out|
	File.open(input_file,'r') do |file|
		1.times {out << file.gets}
		file.each do |line|
			out <<line
			out <<line
		end
	end
end


#end


