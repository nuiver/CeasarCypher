$alphabet_string = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

# Method ceasar_cipher(string) creates a new encrypted string and a key with a number (shift)

def ceasar_cipher(txt)
	shift = rand (1..10_000)
	encrypted_string = String.new
	txt.split('').each do | d | 
		if $alphabet_string.include? d 			
			new_index = ( $alphabet_string.index(d) + shift )% 62
			encrypted_string << $alphabet_string[new_index]
		else
			encrypted_string << d
		end
	end
	puts "The encrypted string is:"
	puts encrypted_string
	puts "The key for this code is: #{shift}"
end

# Method CeasarDecipher(string, shift) decipher gives the original string back.

def ceasar_decipher(code_text, key)
	if key > 62
		key = key % 62
	end
	deciphered_string = String.new
	code_text.split('').each do | d | 
		if $alphabet_string.include? d
			original_index = $alphabet_string.index(d) - key
			if  original_index < 0
				original_index += 62
			end
			deciphered_string << $alphabet_string[original_index]
		else
			deciphered_string << d
		end
	end
	puts deciphered_string
end

puts "Type your text:"
input_text = gets.chomp
ceasar_cipher(input_text)

puts "Type your code:"
input_code = gets.chomp
puts "Type the key:"
input_key = gets.chomp.to_i
ceasar_decipher(input_code, input_key)