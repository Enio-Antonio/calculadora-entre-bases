require_relative "conversor.rb"

print "Digite a: "
a = gets.chomp
print "Digite a base de a: "
base_a = gets.chomp.to_i
print "Digite b: "
b = gets.chomp
print "Digite a base de b: "
base_b = gets.chomp.to_i

print "Digite a base de destino: "
base_destino = gets.chomp.to_i

conversor = Conversor.new

print "Digite 0 para soma e 1 para multiplicação: "
operacao = gets.chomp.to_i

if operacao == 0 
    resultado = conversor.converter_com_float(a, base_a, 10).to_f + conversor.converter_com_float(b, base_b, 10).to_f

    resultado_base_destino = conversor.converter_com_float resultado, 10, base_destino

    puts "Resultado na base #{base_destino}: #{resultado_base_destino}"
else
    resultado = conversor.converter_com_float(a, base_a, 10).to_f * conversor.converter_com_float(b, base_b, 10).to_f

    resultado_base_destino = conversor.converter_com_float resultado, 10, base_destino

    puts "Resultado na base #{base_destino}: #{resultado_base_destino}"
end