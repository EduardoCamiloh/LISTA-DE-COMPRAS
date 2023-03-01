import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Item {
  final String name;
  bool checked;

  Item({required this.name, this.checked = false});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'] as String,
      checked: json['checked'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'checked': checked};
  }
}

class ListController extends GetxController {
  List<Item> marketitems = [
    Item(
      name: 'Arroz',
    ),
    Item(
      name: 'Feijão',
    ),
    Item(
      name: 'Açúcar',
    ),
    Item(
      name: 'Aveia em flocos',
    ),
    Item(
      name: 'Caldo de carne',
    ),
    Item(
      name: 'Ovos',
    ),
    Item(
      name: 'Caldo de galinha',
    ),
    Item(
      name: 'Caldo de legumes',
    ),
    Item(
      name: 'Catchup',
    ),
    Item(name: 'Extrato de tomate,'),
    Item(
      name: 'Gelatina em pó',
    ),
    Item(
      name: 'Iogurte de frutas',
    ),
    Item(
      name: 'Leite de coco',
    ),
    Item(
      name: 'Leite fermentado',
    ),
    Item(
      name: 'Macarrão instantâneo',
    ),
    Item(
      name: 'Massa de lasanha',
    ),
    Item(
      name: 'Óleo',
    ),
    Item(
      name: 'Sal',
    ),
    Item(
      name: 'Suco de frutas',
    ),
    Item(
      name: 'Adoçante',
    ),
    Item(
      name: 'Azeite',
    ),
    Item(
      name: 'Vinagre',
    ),
    Item(
      name: 'Bebida láctea',
    ),
    Item(
      name: 'Cereal',
    ),
    Item(
      name: 'Creme de leite',
    ),
    Item(
      name: 'Fermento biológico',
    ),
    Item(
      name: 'Geleia',
    ),
    Item(
      name: 'Iogurte natural',
    ),
    Item(
      name: 'Leite desnatado',
    ),
    Item(
      name: 'Leite integral',
    ),
    Item(
      name: 'Maionese',
    ),
    Item(
      name: 'Molho de tomate',
    ),
    Item(
      name: 'Sal grosso',
    ),
    Item(
      name: 'Torradas',
    ),
    Item(
      name: 'Barras de cereal',
    ),
    Item(
      name: 'Chá em saquinho',
    ),
    Item(
      name: 'Fermento em pó',
    ),
    Item(
      name: 'Granola',
    ),
    Item(
      name: 'Pão',
    ),
    Item(
      name: 'Leite condensado',
    ),
    Item(
      name: 'Leite em pó',
    ),
    Item(
      name: 'Macarrão',
    ),
    Item(
      name: 'Maisena',
    ),
    Item(
      name: 'Mostarda',
    ),
    Item(
      name: 'Polpa de tomate',
    ),
    Item(
      name: 'Sopa',
    ),
    Item(
      name: 'Massa de bolo',
    ),
    Item(
      name: 'Biscoito',
    ),
    Item(
      name: 'Café',
    ),
    Item(
      name: 'Farinha de rosca',
    ),
    Item(
      name: 'Farinha de mandioca ',
    ),
    Item(
      name: 'Farinha de trigo',
    ),
    Item(
      name: 'Farinha de milho',
    ),
    Item(
      name: 'Lentilha',
    ),
    Item(
      name: 'Fubá',
    ),
    Item(
      name: 'Soja',
    ),
    Item(
      name: 'Farofa',
    ),
    Item(
      name: 'Grão de bico',
    ),
    Item(
      name: 'Achocolatado em pó',
    ),
    Item(
      name: 'Azeitonas',
    ),
    Item(
      name: 'Palmito',
    ),
    Item(
      name: 'Aspargo',
    ),
    Item(
      name: 'Champignon',
    ),
    Item(
      name: 'Atum',
    ),
    Item(
      name: 'Ervilha',
    ),
    Item(
      name: 'Milho',
    ),
    Item(
      name: 'Suco de saquinho',
    ),
    Item(
      name: 'Almôndegas',
    ),
    Item(
      name: 'Margarina',
    ),
    Item(
      name: 'Requeijão',
    ),
    Item(
      name: 'Gordura vegetal',
    ),
    Item(
      name: 'Queijo mozarela',
    ),
    Item(
      name: 'Queijo branco',
    ),
    Item(
      name: 'Queijo parmesão ralado',
    ),
    Item(
      name: 'Carne bovina',
    ),
    Item(
      name: 'Filé de peixe',
    ),
    Item(
      name: 'Linguiça',
    ),
    Item(
      name: 'Frango',
    ),
    Item(
      name: 'Peito de frango',
    ),
    Item(
      name: 'Empanados',
    ),
    Item(
      name: 'Hambúrguer',
    ),
    Item(
      name: 'Peixe',
    ),
    Item(
      name: 'Danone',
    ),
    Item(
      name: 'Abacate',
    ),
    Item(
      name: 'Abobrinha',
    ),
    Item(
      name: 'Frutas',
    ),
    Item(
      name: 'Alface',
    ),
    Item(
      name: 'Banana',
    ),
    Item(
      name: 'Berinjela',
    ),
    Item(
      name: 'Caju',
    ),
    Item(
      name: 'Couve-flor',
    ),
    Item(
      name: 'Chicória',
    ),
    Item(
      name: 'Goiaba',
    ),
    Item(
      name: 'Abacaxi',
    ),
    Item(
      name: 'Açafrão',
    ),
    Item(
      name: 'Aipo',
    ),
    Item(
      name: 'Alho',
    ),
    Item(
      name: 'Batata doce',
    ),
    Item(
      name: 'Beterraba',
    ),
    Item(
      name: 'Cebola',
    ),
    Item(
      name: 'Chuchu',
    ),
    Item(name: 'Espinafre'),
    Item(
      name: 'Hortelã',
    ),
    Item(
      name: 'Abóbora',
    ),
    Item(
      name: 'Acelga',
    ),
    Item(
      name: 'Alecrim',
    ),
    Item(
      name: 'Ameixa',
    ),
    Item(
      name: 'Pessego',
    ),
    Item(
      name: 'Batata inglesa',
    ),
    Item(
      name: 'Brócolis',
    ),
    Item(
      name: 'Cenoura',
    ),
    Item(
      name: 'Jerimum',
    ),
    Item(
      name: 'Kiwi',
    ),
    Item(
      name: 'Laranja',
    ),
    Item(
      name: 'Mamão',
    ),
    Item(
      name: 'Maracujá',
    ),
    Item(
      name: 'Pepino',
    ),
    Item(name: 'Quiabo,'),
    Item(
      name: 'Salsa',
    ),
    Item(
      name: 'Uvas',
    ),
    Item(
      name: 'Limão',
    ),
    Item(
      name: 'Manga',
    ),
    Item(
      name: 'Melancia',
    ),
    Item(
      name: 'Morango',
    ),
    Item(
      name: 'Goiaba',
    ),
    Item(
      name: 'Pera',
    ),
    Item(
      name: 'Repolho',
    ),
    Item(
      name: 'Salsinha',
    ),
    Item(
      name: 'Vagem',
    ),
    Item(
      name: 'Maçã',
    ),
    Item(
      name: 'Manjericão',
    ),
    Item(
      name: 'Melão',
    ),
    Item(
      name: 'Nabo',
    ),
    Item(
      name: 'Pimentão',
    ),
    Item(
      name: 'Rúcula',
    ),
    Item(
      name: 'Tomate',
    ),
    Item(
      name: 'Copos descartáveis',
    ),
    Item(
      name: 'Papel manteiga',
    ),
    Item(
      name: 'Pano de chão',
    ),
    Item(
      name: 'Potes descartáveis',
    ),
    Item(
      name: 'Rodo',
    ),
    Item(
      name: 'Fósforos',
    ),
    Item(
      name: 'Papel alumínio',
    ),
    Item(
      name: 'Ração',
    ),
    Item(
      name: 'Papel toalha',
    ),
    Item(
      name: 'Papel toalha',
    ),
    Item(
      name: 'Prendedor de roupa',
    ),
    Item(
      name: 'Vassoura',
    ),
    Item(
      name: 'Lâmpada',
    ),
    Item(
      name: 'Papel filme',
    ),
    Item(
      name: 'Pilhas',
    ),
    Item(
      name: 'Velas',
    ),
    Item(
      name: 'Absorvente',
    ),
    Item(
      name: 'Álcool',
    ),
    Item(
      name: 'Antisséptico bucal',
    ),
    Item(
      name: 'Cotonete',
    ),
    Item(
      name: 'Desinfetante',
    ),
    Item(
      name: 'Esponja',
    ),
    Item(
      name: 'Gel',
    ),
    Item(
      name: 'Inseticida',
    ),
    Item(
      name: 'Lenço de papel',
    ),
    Item(
      name: 'Palha de aço',
    ),
    Item(
      name: 'Papel higiênico',
    ),
    Item(
      name: 'Protetor solar',
    ),
    Item(
      name: 'Sabonete',
    ),
    Item(
      name: 'Condicionador',
    ),
    Item(
      name: 'Shampoo',
    ),
    Item(
      name: 'Acetona',
    ),
    Item(
      name: 'Algodão',
    ),
    Item(
      name: 'Aparelho de barbear',
    ),
    Item(
      name: 'Creme de barbear',
    ),
    Item(
      name: 'Desodorante',
    ),
    Item(
      name: 'Escova de cabelo',
    ),
    Item(
      name: 'Fio dental',
    ),
    Item(
      name: 'Guardanapos',
    ),
    Item(
      name: 'Lâmina de barbear',
    ),
    Item(
      name: 'Limpa-vidros',
    ),
    Item(
      name: 'Palito de dente',
    ),
    Item(
      name: 'Pente',
    ),
    Item(
      name: 'Sabão em pó',
    ),
    Item(
      name: 'Saco de lixo',
    ),
    Item(
      name: 'Talco',
    ),
    Item(
      name: 'Água sanitária',
    ),
    Item(
      name: 'Amaciante',
    ),
    Item(
      name: 'Creme dental',
    ),
    Item(
      name: 'Desodorizador de ambiente',
    ),
    Item(
      name: 'Escova de dente',
    ),
    Item(
      name: 'Hidratante',
    ),
    Item(
      name: 'Detergente',
    ),
    Item(
      name: 'Pano de limpeza',
    ),
    Item(
      name: 'Sabão em pedra',
    ),
    Item(
      name: 'Bolachas',
    ),
    Item(
      name: 'Pão de forma',
    ),
    Item(
      name: 'Bolo',
    ),
    Item(
      name: 'Chocolate',
    ),
    Item(
      name: 'Salgadinho',
    ),
    Item(
      name: 'Pimenta',
    ),
    Item(
      name: 'Louro',
    ),
    Item(
      name: 'Canela',
    ),
    Item(
      name: 'Curry',
    ),
    Item(
      name: 'Bicarbonato de sódio',
    ),
    Item(
      name: 'Noz-moscada',
    ),
    Item(
      name: 'Cravo da índia',
    ),
    Item(name: 'Cerveja'),
    Item(
      name: 'Refrigerante',
    ),
    Item(
      name: 'Água',
    ),
    Item(
      name: 'Suco',
    ),
    Item(
      name: 'Vinho',
    ),
    Item(
      name: 'Sabão em pedra',
    ),
    Item(
      name: 'Pipoca',
    ),
  ];

  List<Item> filteredItems = [];

  @override
  void onInit() {
    super.onInit();
    loadList();
  }

  //carregar lista
  Future<void> loadList() async {
    final prefs = await SharedPreferences.getInstance();
    final itemsJson = prefs.getString('items');
    if (itemsJson != null) {
      final itemsData = jsonDecode(itemsJson) as List<dynamic>;
      marketitems = itemsData
          .map((itemData) => Item.fromJson(itemData as Map<String, dynamic>))
          .toList();
      filteredItems = marketitems;
      update();
    }
  }

  Future<void> saveList() async {
    final prefs = await SharedPreferences.getInstance();
    final itemsJson =
        jsonEncode(marketitems.map((item) => item.toJson()).toList());
    await prefs.setString('items', itemsJson);
    update();
  }

  //pesquisa de itens
  void searchItems(String query) {
    if (query.isEmpty) {
      // Se a consulta estiver vazia, mostrar todos os itens
      filteredItems = List.from(marketitems);
    } else {
      // Filtrar itens com base na consulta
      filteredItems = marketitems.where((item) {
        return item.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    update();
  }
}
