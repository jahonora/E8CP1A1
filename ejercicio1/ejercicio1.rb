
def method1(s1, s2)
	file = File.new("index1.html", "w")
	string1 = "<p>#{s1}</p>"
	string2 = "<p>#{s2}</p>"
	file.puts(string1)
	file.puts(string2)
	file.close
	return nil
end
method1("BIENVENIDO AL SITIO WEB", "INICIO | QUIENES SOMOS |CONTACTO")

def method2(s1, s2, arr = nil)
	file = File.new("index2.html", "w")
	string1 = "<p>#{s1}</p>"
	string2 = "<p>#{s2}</p>"
	file.puts(string1)
	file.puts(string2)
	if arr
		file.puts("<ul>")
		arr.each{|e| file.puts("<li>#{e}</li>")}
		file.puts("</ul>")
	end
	file.close
	return nil
end

arr2 = ["INICIO", "QUIENES SOMOS", "CONTACTO"]

method2("BIENVENIDO AL SITIO WEB", "MENU", arr2)

def method3(s1, s2, arr = nil, bc = "white")
	file = File.new("index3.html", "w")
	string1 = "<p style=\"background-color:#{bc}\">#{s1}</p>"
	string2 = "<p style=\"background-color:#{bc}\">#{s2}</p>"
	file.puts(string1)
	file.puts(string2)
	if arr
		file.puts("<ul>")
		arr.each{|e| file.puts("<li>#{e}</li>")}
		file.puts("</ul>")
	end
	file.close
	return nil
end

arr3 = ["INICIO", "QUIENES SOMOS", "CONTACTO"]

method3("BIENVENIDO AL SITIO WEB", "MENU", arr3, "blue")