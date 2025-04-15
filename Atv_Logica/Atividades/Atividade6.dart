import 'dart:io';

import '../Util/Input.dart';
import 'Atividade5.dart';

void main() {
  // pede ao usuario para inserir os numeros
  stdout.write('Insira o cateto A: ');
  double catetoA = Input.getDoubleInput();

  stdout.write('Insira o cateto B: ');
  double catetoB = Input.getDoubleInput();

  double somaCatetos = ((catetoA * catetoA) + (catetoB * catetoB));
  double hipotenusa = calcularHipotenusa(somaCatetos);

  print('Hipotenusa: $hipotenusa');
}

double calcularHipotenusa(double somaCatetos) {
  const double precisao = 0.0000000001;

  return raizQuadrada(somaCatetos, precisao);
}