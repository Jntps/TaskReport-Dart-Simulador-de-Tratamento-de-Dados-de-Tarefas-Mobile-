class ItemTrabalho {
  int id;
  String titulo;

ItemTrabalho({
  required this.id,
  required this.titulo,
});

  void exibirResumo() {
    print('ID: $id, Título: $titulo');
  }
 } 

class Tarefa extends ItemTrabalho {
  String responsavel;
  String status;
  String prioridade;
      
  // Encapsulamento: atributo privado
  double _valor;
  int horas;

  Tarefa({
    required int id,
    required String titulo,
    required this.responsavel,
    required this.status,
    required this.prioridade,
    required double valor, // Recebe o valor no construtor
    required this.horas,
  }) : _valor = valor, // Atribui ao campo privado
        super(id: id, titulo: titulo); // O Super envia id e titulo para a classe pai

        // Getter para permitir a leitura do valor protegido
        double get valor => _valor;

        // Polimorfismo: reescrevendo o método da classe pai
        @override
        void exibirResumo() {
          print('Tarefa $id: $titulo | Status: $status | Valor: R\$ $_valor');
        }
}     

// Converte "R$ 120,00" para 120.00 (RF04)
double converterValor(dynamic valor) {
  if (valor == null) {
    return 0.0; // Retorna 0.0 se o valor for nulo
  }
  String valorTexto = valor.toString();
  valorTexto = valorTexto.replaceAll('R\$ ', ''); // Remove o símbolo do Real
  valorTexto = valorTexto.replaceAll(' ', ''); // Remove espaços em branco
  valorTexto = valorTexto.replaceAll(',', '.'); // Troca vírgula por ponto 

  return double.tryParse(valorTexto) ?? 0.0; // Tenta converter para double, retorna 0.0 se falhar
}

// Converte "2" para 2 (RF05)
int converterHoras(dynamic horas) {
  if (horas == null) {
    return 0; // Retorna 0 se horas for nulo
}
return int.tryParse(horas.toString().trim()) ?? 0; // Tenta converter para int, retorna 0 se falhar 
}

Tarefa coonverterMapParaTarefa(Map<String, dynamic> item) {
  return Tarefa(
    id: item['id'] ?? 0,
    titulo: (item['titulo'] ?? 'Sem título').toString().trim(), // Garantindo que seja uma string e removendo espaços
    responsavel: (item['responsavel'] ?? 'Não informado').toString().trim(),
    status: (item['status'] ?? 'Sem Status').toString().trim(),
    prioridade: (item['prioridade'] ?? 'Sem Prioridade').toString().trim(),
    valor: converterValor(item['valor']), // Converte o valor usando a função de conversão
    horas: converterHoras(item['horas']), // Converte as horas usando a função de conversão
  );
}

void main() {
  // Base de dados simulada vinda do documento do projeto
  final List<Map<String, dynamic>> dadosTarefas = [
    {
      'id': 1,
      'titulo': 'Corrigir bug login',
      'responsavel': 'Ana',
      'status': 'concluida',
      'prioridade': 'alta',
      'valor': 'R\$ 120,00',
      'horas': '2',
    },
    {
      'id': 2,
      'titulo': 'Criar tela de perfil',
      'responsavel': 'Bruno',
      'status': 'em andamento',
      'prioridade': 'media',
      'valor': 'R\$ 250,50',
      'horas': '5',
    },
    {
      'id': 3,
      'titulo': null,
      'responsavel': 'Carla',
      'status': 'pendente',
      'prioridade': 'baixa',
      'valor': 'R\$ 80,00',
      'horas': null,
    },
    {
      'id': 4,
      'titulo': 'Ajustar navegação', // Aspa corrigida aqui
      'responsavel': null,
      'status': 'concluida',
      'prioridade': 'alta',
      'valor': 'R\$ 150,75',
      'horas': '3',
    },
    {
      'id': 5,
      'titulo': 'Revisar regras de negócio',
      'responsavel': 'Daniel',
      'status': 'cancelada',
      'prioridade': 'media',
      'valor': 'R\$ 0,00',
      'horas': '0',
    },
    {
      'id': 6,
      'titulo': 'Implementar validação de dados',
      'responsavel': 'Eduarda',
      'status': 'concluida',
      'prioridade': 'alta',
      'valor': 'R\$ 200,00',
      'horas': '4',
    },
    {
      'id': 7,
      'titulo': 'Organizar documentação',
      'responsavel': 'Felipe',
      'status': 'pendente',
      'prioridade': 'baixa',
      'valor': 'R\$ 90,00',
      'horas': '2',
    }
  ];

  print('Estrutura inicial rodando com sucesso! Total de tarefas na lista: ${dadosTarefas.length}');
  // 1. Processamento: Transformando a lista bruta em uma lista de objetos Tarefa limpos
  List<Tarefa> listaTarefas = dadosTarefas.map((item) => coonverterMapParaTarefa(item)).toList();
  // 2. RF06: Exibir todas as tarefas convertidas
  print('\n--- Tarefas Processadas ---');
  for (var tarefa in listaTarefas) {
    tarefa.exibirResumo();
  }

// MÓDULO DE RELATÓRIOS E CÁLCULOS (RF07 a RF15)

// RF07: Exibir tarefas com status "concluida"

var tarefasConcluidas = listaTarefas.where((t) => t.status == 'concluida');
var tarefasPendentes = listaTarefas.where((t) => t.status == 'pendente');
var tarefasEmAndamento = listaTarefas.where((t) => t.status == 'em andamento');
var tarefasCanceladas = listaTarefas.where((t) => t.status == 'cancelada');

// RF08: Somar valores das tarefas concluídas

double totalConcluidas = tarefasConcluidas.fold(0.0, (soma, t) => soma + t.valor);

// RF09: calcular média de valor das tarefas pendentes

double mediaPendentes = 0.0;
if (tarefasPendentes.isNotEmpty) {
  double somaPendentes =tarefasPendentes.fold(0.0, (soma, t) => soma + t.valor);
  mediaPendentes = somaPendentes / tarefasPendentes.length;
}

// RF10: Calcular total de horas por status usando map

Map<String, int> horasPorStatus = {};
for (var t in listaTarefas) {
  horasPorStatus[t.status] = (horasPorStatus[t.status] ?? 0) + t.horas;
}

  // RF11: Indentificar tarefas com dados incompletos (título, responsável ou horas ausentes)

  var tarefasIncompletas = listaTarefas.where((t) => t.titulo == 'Sem título' || t.responsavel == 'Não informado' || t.horas == 0);

  // RF12 Exibir status únicos usando Set

  Set<String> statusUnicos = listaTarefas.map((t) => t.status).toSet();

  // RF15: gerar relatório final

  print('   RELATÓRIO FINAL   ');
  print('Total de tarefas analisadas: ${listaTarefas.length}');
  print('Tarefas concluídas: ${tarefasConcluidas.length}');
  print('Tarefas pendentes: ${tarefasPendentes.length}');
  print('Tarefas em andamento: ${tarefasEmAndamento.length}');
  print('Tarefas canceladas: ${tarefasCanceladas.length}');
  print('Valor total das tarefas concluídas: R\$ ${totalConcluidas.toStringAsFixed(2)}');

  if (tarefasPendentes.isNotEmpty) {
    print('Valor médio das tarefas pendentes: R\$ ${mediaPendentes.toStringAsFixed(2)}');
  } else {
    print('Não há tarefas pendentes para calcular a média de valor.');
  } 

  print('/nTotal de horas por status:');
  horasPorStatus.forEach((status, horas) {
    print('- $status: $horas horas');
  });

  print('\nStatus encontrados (usando Set):');
  for (var status in statusUnicos) {
    print('- $status');
  }

  print ('\nTarefas com dados incompletos:');
  for (var t in tarefasIncompletas) {
    List<String> problemas = [];
    if (t.titulo == 'Sem Título') problemas.add('Título ausente');
    if (t.responsavel == 'Não Informado') problemas.add('Responsável ausente'); 
    if (t.horas == 0) problemas.add('Horas ausentes/invalidas');    

    print('ID ${t.id}: ${problemas.join(" ou ")}');
  }
}