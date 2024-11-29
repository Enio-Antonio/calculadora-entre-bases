class Conversor
    def converter_base numero, base_x, base_y
        letras = {"a" => 10, "b" => 11, "c" => 12, "d" => 13, "e" => 14, "f" => 15, "g" => 16, "h" => 17, "i" => 18, 
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
            resultado = resto.to_s + resultado
            decimal = decimal / base_y
        end

        return resultado
    end

    def converter_com_float numero, base_x, base_y
        numero = numero.to_s
        
        if numero.include?(".") && base_x == 10 then
            num = numero.split "."
            decimal = ("0." + num[1]).to_f
            decimal_binario = String.new
        
            controle_while = 0
        
            while decimal != 1 
                decimal = base_y * decimal
                if decimal < 1 
                    decimal_binario += decimal.to_i.to_s
                else
                    decimal_binario += decimal.to_i.to_s
                    decimal = decimal % 1
                end
        
                controle_while += 1
                if controle_while > 5
                    break
                end
            end
        
            antes_virgula = converter_base num[0], base_x, base_y
        
            return antes_virgula + "." + decimal_binario

        elsif numero.include?(".")  && base_x != 10 then
            num = numero.split "."
            decimal = num[1]
            resultado = 0.0
        
            antes_virgula = converter_base(num[0], base_x, base_y)
        
            for i in 0...decimal.length
                resultado += (converter_base(decimal[i], base_x, 10).to_f) * (base_x ** -(i + 1))
            end 
        
            resultado_print = resultado.to_s.split(".")
        
            return antes_virgula + "." + resultado_print[1]

        else
            return converter_base numero, base_x, base_y
        end
    end

end