
*Obs 1: Útil para qualquer sistema de login ou cadastro, além de outros como caixas de busca e muitos outros*

### ✅ **TextField**

**1. O que é um widget TextField em Flutter e para que ele serve?**  
É um campo de entrada de texto que permite ao usuário digitar informações, como nomes, senhas, números etc.

*Obs 2: É um pouco parecido com o JTextField do Java Swing. Tenho péssimas experiências com essa library*

**2. Como posso obter o valor digitado pelo usuário em um TextField?**  
Usando um `TextEditingController`. Exemplo:

```dart
final controller = TextEditingController();

TextField(controller: controller);

// Acessar valor:
String texto = controller.text;
```

---

*Obs 3: o TextFormField é uma versão mais "parruda" em comparação ao TextField padrão, fornecendo suporte para métodos de validação personalizados*

### 🔁 **TextField vs TextFormField**

**3. Qual a diferença entre um TextField e um TextFormField?**  
- `TextField`: mais simples, usado para entrada básica de texto.  
- `TextFormField`: possui suporte nativo para **validação**, ideal para uso com `Form`.

---

*Obs 4: É interessante ver todos os parâmetros de um Widget (CTRl + Espaço, já me salvou muitas vezes). Isso dá um escopo geral do que o widget pode fornecer e amplia a capacidade do programador de criar elementos mais interessantes*

### ⚙️ **Parâmetros importantes do TextField**

**4. Quais parâmetros importantes do TextField?**  
- `controller`: controla o valor.
- `decoration`: personaliza aparência.
- `keyboardType`: tipo de teclado (ex: texto, número).
- `obscureText`: esconde o texto (útil para senhas).
- `onChanged`: callback quando o texto muda.
- `style`: estilo do texto.
- `maxLines`: número de linhas.

---

*Obs 5: Útil em qualquer situação onde a informação digitada pelo usuário é crítica, como em sistemas de login e sign in, entre outros*

### ✔️ **Validação**

**5. O que significa validar um campo de texto em Flutter?**  
Verificar se o valor digitado está correto (ex: se não está vazio, se é um e-mail válido, etc). Isso geralmente é feito com o `TextFormField` e o widget `Form`.

---

*Obs 6: Geralmente, se a base de dados das contas dos usuários estiverem localizadas em um servidor/banco de dados externo, será necessário usar assincronicidade para recuperar e escrever os dados*

### ⚖️ **Validação síncrona vs assíncrona**

**6. Qual a diferença entre validação síncrona e assíncrona?**  
- **Síncrona**: ocorre imediatamente (ex: verificar se o campo está vazio).
- **Assíncrona**: depende de uma operação futura (ex: verificar com um servidor se um e-mail já está cadastrado).

---

*Obs 7: Úteis para formulários de validação, como o clássico "concordo com os termos de uso..."*

### ✅ **CheckBox**

**7. O que é um widget CheckBox em Flutter e para que ele serve?**  
É um quadradinho que o usuário pode marcar ou desmarcar. Serve para escolhas do tipo **sim/não**, **ligado/desligado**, etc.

*Obs 8: É possível deixar o checkbox mais "bonitinho" com esses valores*

**8. Como posso alterar a cor e a forma de um CheckBox?**
- Cor: `activeColor`, `checkColor`
- Forma: Usando `CheckboxTheme` com `shape`, ou diretamente com `MaterialStateProperty`

Exemplo:

```dart
Checkbox(
  value: true,
  onChanged: (value) {},
  activeColor: Colors.green,
  checkColor: Colors.white,
)
```

---

*Obs 9: A primeira coisa que eu pensei sobre a aplicabilidade desse widget é para fazer provas online (minha mente está consumida)*

### 🔘 **Radio**

**9. O que é um widget Radio em Flutter e qual sua aplicabilidade?**  
É usado para selecionar **uma única opção** entre várias. Exemplo clássico: selecionar o gênero, ou uma das opções de resposta.

*Obs 10: Novamente, é possível customizar os widgets para deixá-los com uma cara mais "atraente" em questão de UX/UI*

**10. Como posso alterar a cor e a forma de um Rádio?**  
- Cor: `activeColor`
- Forma: com `RadioTheme` e `shape`

Exemplo:

```dart
Radio(
  value: 'A',
  groupValue: 'A',
  onChanged: (value) {},
  activeColor: Colors.orange,
)
```