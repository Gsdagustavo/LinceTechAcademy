void main() {
  funcaoA(funcaoB);
}

void funcaoA(void outraFuncao()) {
  print('funcao a');

  print('chamando a funcao B');
  outraFuncao();
}

void funcaoB() {
  print('funcao b');
}