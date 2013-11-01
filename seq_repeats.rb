#!/usr/bin/env ruby
input_file = ARGV[0]
input = input_file.split(".")[0]
repeated_sample_names = ARGV[1]
repeats = repeated_sample_names.split(',')
#puts repeats

File.open(input+"_repeats.txt", "w") do |out|
	File.open(input_file,'r') do |file|
		1.times {out << file.gets}
		file.each do |line|
			sample_name = line.split("\t")[0].tr('"', '')
			for i in 0 .. repeats.count-1
				if repeats[i] == sample_name
					out << line
				end
			end
			out <<line
		end
	end
end