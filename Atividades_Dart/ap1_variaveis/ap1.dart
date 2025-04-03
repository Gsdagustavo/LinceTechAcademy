void main() {

  // instancia uma variavel string com o valor "Daniel" e outra com o valor "Gustavo"
  // concatenado com o valor da primeira variavel
  String sobrenome = "Daniel";
  String nome = "Gustavo " + sobrenome;

  // mostra a variavel nome
  print('Nome completo: $nome');

  // cria uma variavel do tipo int contendo o valor 16 e uma variavel string que
  // pode conter o valor 'maior' ou 'menor' dependendo do valor da primeira variavel
  int idade = 16;
  String maiorIdade = (idade >= 18) ? 'maior' : 'menor';

  // imprime o valor da variavel 'idade' com o valor da variavel 'maiorIdade',
  // dizendo ao usuario se a pessoa e maior ou menor de idade
  print('Idade: $idade (${maiorIdade} de idade)');

  // cria a variavel 'ativo' com o valor true
  bool ativo = true;

  // cria uma variavel string que pode receber o valor 'Ativo' ou 'Inativo' a
  // depender da variavel 'ativo', e mostra a situacao
  String situacao = (ativo) ? 'Ativo' : 'Inativo';
  print('Situacao: $situacao');

  // cria a variavel peso e mostra o seu valor com duas casas decimais
  double peso = 65.56;
  print('Peso: ${peso.toStringAsFixed(2)}');

  // cria a variavel nullable 'nacionalidade', com o valor 'Brasileiro' e mostra..
  // se a nacionalidade foi informada (non null) ou nao (null)
  String? nacionalidade = 'Brasileiro';
  print('Nacionalidade: ' + (nacionalidade == null ? 'Nao Informada' : nacionalidade));
}