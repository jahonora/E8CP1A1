
def method()
	file = File.open("peliculas.txt", "r")

	lines = file.readlines.count
end
puts method()