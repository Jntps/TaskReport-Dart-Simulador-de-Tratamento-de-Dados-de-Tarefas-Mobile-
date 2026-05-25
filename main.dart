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