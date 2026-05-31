# TaskReport Dart - Simulador de Tratamento de Dados de Tarefas Mobile

## 📋 Sobre o Projeto
O **TaskReport Dart** é um aplicativo desenvolvido em Dart puro que simula um cenário real do cotidiano de uma pessoa desenvolvedora mobile: o recebimento, higienização, tratamento e análise de dados brutos ("sujos") simulando o retorno de uma API de gerenciamento de tarefas. 

O sistema recebe uma lista estruturada como `List<Map<String, dynamic>>` contendo diversas inconsistências comuns (como campos nulos, espaços em branco adicionais e valores monetários em formato de texto), converte esses dados em objetos fortemente tipados através de conceitos de Programação Orientada a Objetos (POO) e gera um relatório analítico consolidado no console.

---

## 🎯 Objetivos de Aprendizagem e Prática
Este projeto foi desenvolvido com o propósito de consolidar e demonstrar os principais conceitos do **Módulo 01 (Semana 07)** do curso de Desenvolvimento Mobile, incluindo:
* **Lógica de Programação & Sintaxe Básica em Dart:** Declaração de variáveis, inferência de tipo e uso de funções globais.
* **Estruturas de Controle e Condicionais:** Estruturas `if-else` para validação de dados e tratamento de contingências.
* **Estruturas de Repetição:** Laços `for` e `for-in` para iteração e exibição de dados de coleções.
* **Manipulação Avançada de Coleções:** Uso e manipulação de `List`, `Map` (chave/valor dinâmico) e `Set` (garantia de elementos únicos).
* **Métodos de Coleção Avançados (High-Order Functions):** Aplicação prática de métodos como `.map()`, `.where()` (filtros) e `.fold()` (acumulador/redução matemática).
* **Programação Orientada a Objetos (POO):**
  * **Modelagem de Classes e Objetos:** Criação da classe base e instanciamento de objetos estruturados.
  * **Encapsulamento:** Utilização de atributos privados (`_valor`) protegidos por métodos de leitura específicos (`getter`).
  * **Herança:** Extensão de funcionalidades da classe pai (`ItemTrabalho`) para a classe filha (`Tarefa`) via palavra-chave `extends` e inicialização por `super()`.
  * **Polimorfismo:** Sobrescrita de métodos comportamentais utilizando a anotação `@override`.
* **Metodologias e Ferramentas de Desenvolvimento:** Organização do fluxo de trabalho através de quadro Kanban e controle de versão profissional via Git/GitHub utilizando o fluxo do GitFlow simplificado.

---

## 🛠️ Tecnologias e Ferramentas Utilizadas
* **Linguagem:** [Dart]
* **Ambiente de Desenvolvimento:** Visual Studio Code (VS Code)
* **Controle de Versão:** Git & GitHub (Fluxo GitFlow)
* **Organização de Projetos:** Quadro Kanban

---

## 🔗 Links Importantes do Projeto
* **Repositório Público no GitHub:** https://github.com/Jntps/TaskReport-Dart-Simulador-de-Tratamento-de-Dados-de-Tarefas-Mobile-
* **Quadro Kanban de Organização:** https://trello.com/invite/b/6a14d240f2c7e5eaec0833a1/ATTI17e2c1b0f10826a75275798b5d7204b378DD3B6D/taskreport-dart
* **Vídeo de Apresentação e Demonstração:** https://www.loom.com/share/00e3222981b54de4a27ef33f30197d9d

---

## 📂 Estrutura de Pastas do Projeto
A organização do repositório segue estritamente as boas práticas e os requisitos mínimos exigidos:

taskreport-dart/
│
├── main.dart               # Arquivo principal contendo a execução, classes e algoritmos
├── README.md               # Documentação completa do projeto (este arquivo)
│
└── planejamento/
    └── tarefas-kanban.md   # Registro textual complementar do planejamento das tarefas