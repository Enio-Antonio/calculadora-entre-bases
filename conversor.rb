class Conversor
    def converter_base numero, base_x, base_y
        letras = {"a" => 10, "b" => 11, "c" => 12, "d" => 13, "e" => 14, "f" => 15, "g" => 16, "h" => 17, "i" => 18, "j" => 19, 
        "k" => 20, "l" => 21, "m" => 22, "o" => 24, "p" => 25, "q" => 26, "r" => 27, "s" => 28, "t" => 29, "u" => 30, "v" => 31, 
        "w" => 32, "x" => 33, "y" => 34, "z" => 35}

        decimal = 0
        numero = numero.to_s
        potencia = numero.length - 1

        contador = 0

        for i in 0...numero.length do
            if letras.keys.include? numero[contador] then
                numero[contador] = letras[numero[contador].to_s].to_s
                decimal += (numero[contador] + numero[contador + 1]).to_i * base_x**potencia    
                contador += 1
            else 
                decimal += numero[contador].to_i * base_x**potencia
            end

            contador += 1
            potencia -= 1
        end

        resultado = ""

        while decimal > 0 do
            resto = decimal % base_y
            if resto >= 10 then
                letras.each do |letra, numero| 
                    resto = letra if numero == resto
                end
            end
            resultado = resto.to_s + resultado
            decimal = decimal / base_y
        end

        return resultado
    end

    def converter_com_float numero, base_x, base_y
        numero = numero.to_s
        letras = {"a" => 10, "b" => 11, "c" => 12, "d" => 13, "e" => 14, "f" => 15, "g" => 16, "h" => 17, "i" => 18, "j" => 19,
        "k" => 20, "l" => 21, "m" => 22, "o" => 24, "p" => 25, "q" => 26, "r" => 27, "s" => 28, "t" => 29, "u" => 30, "v" => 31, 
        "w" => 32, "x" => 33, "y" => 34, "z" => 35}

        if numero.include?(".") then
            num = numero.split "."
            decimal = num[1]
            resultado = 0.0
        
            antes_virgula = converter_base(num[0], base_x, base_y)
        
            for i in 0...decimal.length
                resultado += (converter_base(decimal[i], base_x, 10).to_f) * (base_x ** -(i + 1))
            end 

            resultado_print = String.new

            for i in 0...10 do
                resultado = resultado * base_y
                valor = resultado.to_i
                if valor > 9 then
                    letras.each do |letra, numero|
                        resultado_print += letra if numero == valor
                    end
                else 
                    resultado_print += valor.to_s
                end

                resultado -= valor
            end
        
            return antes_virgula + "." + resultado_print

        else
            return converter_base numero, base_x, base_y
        end
    end

end