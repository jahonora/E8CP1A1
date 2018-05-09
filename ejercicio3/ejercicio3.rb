
def method1(file)
	
	lines = file.readlines.count
end
file = File.open("peliculas.txt", "r")
puts method1(file)
file.close


def method2(file, palabra)
	num = 0
	data = file.readlines.map{|w| w.chomp}
	data.each{|d| num += 1 if d.include?(palabra)}
	num
end
file = File.open("peliculas.txt", "r")
palabra = "Guerra"
puts method2(file, palabra)
file.close