require 'yaml'

def file_reader_by_line(in_filename) # method for reading file line by line.
  f = File.open(in_filename, 'r')
  f.each_line do |line|
    yield line
  end
  f.close
end

def tsv_parser(in_filename)
  entire_line = [] 	# init var for e/ line read from the original file.
  field = [] 					               # init var for each of the fields per line.
  file_reader_by_line(in_filename) { |new_line| entire_line.push(new_line) }
  entire_line.delete_at(0) 		       # Strips the header of the array.
  entire_line.each { |x| field.push(x.split("\t")) }
  yield field
end

def arr_to_yaml(in_filename = ARGV[0], out_filename = ARGV[1])
  complete_array = []			            # init var for final array of hashes.
  if out_filename .nil? || in_filename.nil?
    puts 'Error: Please input Ruby TSV_to_YAML in_filename out_filename.'
  else
    tsv_parser(in_filename) do |field|
      field.map do |a, b, c, d, e, f|
        temp_arr = {}
        temp_arr[:date] = a.to_s
        temp_arr[:student_id] = b.strip.to_s
        temp_arr[:languages] = c.strip.to_s
        temp_arr[:best_language] = d.strip.to_s
        temp_arr[:app_experience] = e.strip.to_s
        temp_arr[:tech_experience] = f.strip.to_s
        complete_array.push(temp_arr)
      end
    end
    File.open(out_filename, 'w') { |f| f.puts complete_array.to_yaml }
  end
end

arr_to_yaml
