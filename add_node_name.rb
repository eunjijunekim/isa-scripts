#!/usr/bin/env ruby
input_file = ARGV[0]
string_to_add = ARGV[1]
column_num = ARGV[2]
input = input_file.split(".")[0]
column = column_num.to_i - 1

File.open(input_file, "r+") do |file|
	out = ""
	first_entry = "Source Name"
	file.each do |line| 
		first_item = line.split("\t")[0].tr('"', '')
		if first_item == first_entry 
			out << line
		else
			column = column_num.to_i - 1
			node_name = line.split("\t")[column].tr('"', '')
			new_node_name = string_to_add + " " + node_name
			out << line.gsub!(node_name, new_node_name)
		end
	end
	file.pos = 0
	file.puts out
end
