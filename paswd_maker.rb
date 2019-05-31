$string = ARGV[0]
$min_range = ARGV[1]
$max_range = ARGV[2]
$pass_list_name = ARGV[3]

if ARGV.length < 4 then
	puts "Usage:"
	puts "	ruby scrip.rb chars min_range max_range pass_list_name"
	puts "	ruby pass_gen.rb admin 3 5 test.txt"
	exit()
end
#puts "#{$string}:#{$min_range}:#{$max_range}" || ,[]" 
@data = $string.split("")
$file = File.open($pass_list_name, "w")
for len in ($min_range.to_i..$max_range.to_i) do 
	@permuts = @data.repeated_permutation(len).to_a
	for @i in @permuts do 
		@pass = "#{@i}"
		$paswds = "#{@pass}".to_s
		$paswds = $paswds.tr!(",[]\" ", "")
		$paswds = $paswds + "\n"
		$file.write("#{$paswds}")
	end
end
$file.close
puts "#{$pass_list_name} Generated"
get_file_info = File.open($pass_list_name, "r")
puts "#{get_file_info.readlines.size} Passwords"
puts "#{File.size?(get_file_info)} Bytes"