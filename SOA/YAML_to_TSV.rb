require 'yaml'

def yaml_to_arr(in_filename = ARGV[0], out_filename = ARGV[1])
    complete_array = []
    arr_of_hash = YAML::load(File.read(in_filename))
    arr_of_hash.each do |hash|
      temp_arr = []
      temp_arr.push (hash[:date] << "\t")
      temp_arr.push (hash[:student_id] << "\t")
      temp_arr.push (hash[:languages] << "\t")
      temp_arr.push (hash[:best_language] << "\t")
      temp_arr.push (hash[:app_experience] << "\t")
      temp_arr.push (hash[:tech_experience] << "\n")
      complete_array.push(temp_arr)
    end
    File.open(out_filename, 'w') do |file|
      file.puts "date\t student_id\t languages\t best_language\t app_experience\t tech_experience\n"
      complete_array.each do |student|
        student.each do |header|
          file.print header
        end
      end
    end
end

yaml_to_arr
