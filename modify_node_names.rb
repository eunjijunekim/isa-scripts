#!/usr/bin/env ruby

if (ARGV.length != 3) or (@ARGV == '-h')
	puts "Usage: ruby add_node_name.rb <input_file> <string_to_add> <column_num>\n
		<input_file> : input isa txt file
		<string_to_add> : string to add to the node name
		<column_num> : column number\n"
else
	input_file = ARGV[0]
	string_to_add = ARGV[1]
	column_num = ARGV[2]
	input = input_file.split(".")[0]
	column = column_num.to_i - 1
	
	first_line = open(input_file).gets
	first_entry = first_line.split("\t")[0].tr('"','')
	
	File.open(input_file, "r+") do |file|
		out = ""
		file.each do |line|
			first_item = line.split("\t")[0].tr('"', '')
			if first_item == first_entry 
				out << line
				#total_col = line.split("\t")
				#puts total_col[column]
				#puts total_col.index("Sample Name")
			else
				node_name = line.split("\t")[column].tr('"', '')
				#sample_name = line.split("\t")[0].tr('"','').split[0]
				#puts sample_name
				## edit name
				#puts node_name
				#node_name_split = node_name.split("/")
				#node_name_size = node_name_split.size
				#puts node_name_size
				#if node_name_size == 3
				#	new_node_name_1 = node_name.split("_")[1]
				#	new_node_name_2 = node_name.split("_")[2]
				#	#new_node_name = new_node_name_1 + "_" + new_node_name_2
				#else
				#	new_node_name_1 = node_name.split("_")[1]
				#	new_node_name_2 = node_name.split("_")[2]
				#	new_node_name_3 = node_name.split("_")[3]
				#	#new_node_name = new_node_name_1 + "_" + new_node_name_2 + "_" + new_node_name_3
				#end
				
				#new_node_name = new_node_name_1 + "_" + new_node_name_2 + new_node_name_3
				#puts new_node_name
				#puts string_to_add

				## to remove
				#node_name = node_name.split(" ")[0]
				#new_node_name =  node_name

				## to add string before the name
				#new_node_name =  string_to_add + " " + node_name
				#puts new_node_name
				
				## to add string after the name
				new_node_name = node_name + " " + string_to_add
				#puts node_name
				#puts line.split("\t")[column]
				
				##common
				line[line.split("\t")[column]] = new_node_name
				out << line
			end
		end
		file.pos = 0
		file.puts out
	end
end
