require 'colorize'

file = "productos.txt"
$data = []
def readfile(file)
	f = File.open(file, "r")
	products = f.readlines
	f.close
	data_file = []
	products.map do |w|
		data_file << parse_products(*w.chomp.split(", "))
	end


	data_file
end
def parse_products(name, store1, store2, store3)
	products = {}
	products[name.to_sym] = [store1, store2, store3]
	products
end

def product_stock(name)
	msg = ""
	finder = false
	$data.each do |p|
		if p[name.to_sym]
			finder = true
			puts "Producto encontrado!".green
			p[name.to_sym].each_with_index{ |s, i| msg += "Stock en tienda#{i+1}: #{s}\n" }
		end
	end
	if finder
		puts "#{msg}".green
	else
		puts "Producto NO encontrado".red
	end
end

def NR_products()
	nr_p = ""
	finder = false
	$data.each do |p|
		keys = p.keys
		arr = p.values
		arr.each do |v| 
			puts v
			if v.include?("NR")
				nr_p += "#{keys[0].to_s}, " 
				finder = true 
				break
			end
		end
	end
	if finder
		puts "Los productos no registrados son: #{nr_p}".green
	else
		puts "No existen productos no registrados".red
	end

end

def check_products_stocks(num)
	msg = ""
	finder = false
	$data.each do |p|
		keys = p.keys
		values = p.values.flatten
		p_num = 0
		values.each{|v| p_num += v.to_i}
		msg += "#{keys[0]}: #{p_num}, " if p_num < num
	end
	puts "Los productos con su stock total más bajos que #{num} son: #{msg}".green
end

def add_product(file, product)
	f = File.open(file, "a"){|f| f.puts "#{product}"}
end

def get_stock_by_product()
	msg = ""
	$data.each do |p|
		keys = p.keys
		values = p.values.flatten
		p_num = 0
		values.each{|v| p_num += v.to_i}
		msg += "#{keys[0]}: #{p_num}, "
	end
	puts "El stock total de cada producto es: #{msg}".green
end

def get_stock_by_store()
	msg = ""
	store1 = 0
	store2 = 0
	store3 = 0
	$data.each do |p|
		keys = p.keys
		values = p.values.flatten
		store1 += values[0].to_i if values[0].to_i
		store2 += values[1].to_i if values[1].to_i
		store3 += values[2].to_i if values[2].to_i
	end
	puts 	"El stock total de cada tienda es: 
			 Tienda1: #{store1}
			 Tienda2: #{store2}
			 Tienda3: #{store3}".green
end

def get_all_stock()
	msg = ""
	store1 = 0
	store2 = 0
	store3 = 0
	$data.each do |p|
		keys = p.keys
		values = p.values.flatten
		store1 += values[0].to_i if values[0].to_i
		store2 += values[1].to_i if values[1].to_i
		store3 += values[2].to_i if values[2].to_i
	end

	puts 	"El stock total entre todas las tiendas es: #{store1+store2+store3}".green
end

puts $data
menu = "Menu de opciones:
		1. Productos Existentes
		2. Consultar stock de cierto producto
		3. Consultar productos no registrados en la bodega
		4. Consultar productos con stock total menor al ingresado por el usuario
		5. Registrar un nuevo producto
		6. Salir"
submenu = 	"Submenu de opciones:
			a. Mostrar la existencia total por producto
			b. Mostrar la existencia total por tienda
			c. Mostrar la existencia total en todas las tiendas
			d. Volver al menu principal"
option = 0

puts "BIENVENIDOS AL MANEJADOR DE PRODUCTOS"
while option != 6
	$data = readfile(file)
	puts $data
	suboption = ""
	puts "#{menu}".blue
	print "Por favor ingrese una opcion valida:".yellow
	option = gets.chomp.to_i

	case option
	when 1
		while suboption != "d"
			puts "#{submenu}".blue
			print "Por favor ingrese una opcion valida:".yellow
			suboption = gets.chomp
			case suboption
			when "a"
				get_stock_by_product()
			when "b"
				get_stock_by_store()
			when "c"
				get_all_stock()
			end
			puts "Opcion invalida".red if !suboption.include?("a") && !suboption.include?("b") && !suboption.include?("c") && !suboption.include?("d")
			
		end
	when 2
		print "Por favor ingrese el nombre del producto: ".yellow
		input = gets.chomp
		product_stock(input)
	when 3
		puts "Mostrando productos no registrados".yellow
		NR_products()
	when 4
		print "Por favor ingrese el stock con el que desea comparar: ".yellow
		input = gets.chomp.to_i
		check_products_stocks(input)
	when 5
		print "Por favor ingrese el producto que desea agregar (respete el formato: Producto, stock1, stock2, stock3): ".yellow
		input = gets.chomp
		add_product(file, input)
	end
	puts "Opcion invalida".red if option > 6 || option < 1

end



















