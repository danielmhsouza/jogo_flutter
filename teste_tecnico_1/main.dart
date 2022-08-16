import 'dart:io';

void main() {
  print('entre com um numero: ');
  String? entrada = stdin.readLineSync();
  int resultado = somatoria(int.parse(entrada!));
  print(
      '\nA somatória dos números multiplos de 3 e 5, até o número que escolheu, é: ${resultado}');
}

int somatoria(int entrada) {
  int numeros_validos = 0;
  for (int i = 0; i < entrada; i++) {
    if (i % 3 == 0 || i % 5 == 0) {
      print(i);
      numeros_validos += i;
    }
  }
  return numeros_validos;
}
