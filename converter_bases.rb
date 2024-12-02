require_relative "conversor.rb"

conversor = Conversor.new

print "Digite a: "
a = gets.chomp
print "Digite a base de a: "
base_a = gets.chomp.to_i
print "Digite a base de destino: "
base_y = gets.chomp.to_i

resultado = conversor.converter_com_float a, base_a, base_y

puts "#{a} na base #{base_a} é igual a #{resultado} na base #{base_y}"