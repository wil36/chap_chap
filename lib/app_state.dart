import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _recettes = prefs.getStringList('ff_gel')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _recettes;
  }

  late SharedPreferences prefs;

 

  List<dynamic> _recettes = [
    jsonDecode(
        """ { "0Q7EZVbYrICCxJdHgrDE": {
      "Gommage": false,
      "create_time": {
        "__time__": "2022-01-03T18:37:03.526Z"
      },
      "description": "Cette recette est adaptée à tous les types de cheveux.Elle est idéale pour nourrir, fortifier et apporter de la brillance",
      "dureePrepa": 15,
      "eauRincage": false,
      "etapes": "<bold>Étape 1/5</boldCasser l’oeuf et séparer séparer le blanc (bol 1)du jaune (bol 2<bold>Étape 2/5</boldDans le bol 1, battre le jaune et y ajouter le mielet l’huil<bold>Étape 3/5</boldDans le bol 2, monter le blanc de l’œuf en neigà l’aide d’un batteu<bold>Étape 4/5</boldIncorporer délicatement le blanc d’œuf montéen neige dans le bol 2. Remuer très délicatementpour garder la structure « neigeuse <bold>Étape 5/5</boldLaisser poser 2h minimum sur cheveux, avande passer au shampoing",
      "gel": false,
      "isUp": false,
      "leaveIn": false,
      "listeIngredients": "🥚 1 oeu🍯 1 cuillère à soupe de mie🫒 1 cuillère à soupe d’<link href='https://www.aroma-zone.com/info/fiche-technique/huile-vegetale-olive-bio-aroma-zone#ae5'>Huille d’olive</link",
      "masqueHydratant": false,
      "masqueNourissant": true,
      "masqueProteine": false,
      "nbIngredients": 0,
      "niveauDifficulte": "Facile",
      "photoPrincipale": "assets/nourissant/19.jpeg",
      "shampoing": false,
      "sprayLotion": false,
      "titre": "Masque nourrissant « Ile flottante »",
      "userCreate": {
        "__ref__": "users/3G6FnWOi0VUxafamR834tP4l6my1"
      },
      "__collections__": {}
    },
    "0ohGeFQSOX92U17KsQan": {
      "Gommage": false,
      "create_time": {
        "__time__": "2021-12-31T18:12:56.161Z"
      },
      "description": "Cette recette est adaptée aux cheveux texturés. Elle permet d’apporter de l’hydratation et de définir les boucles. Elle se conserve 3 jours au frais mais tu peux prolonger sa durée de conservation à 3 mois en ajoutant du cosgard.",
      "dureePrepa": 10,
      "eauRincage": false,
      "etapes": "<bold>Étape 1/5</boldDans un bol, verser l’eau puis ajouter la gommeCarraghénane en mélangeant simultanément de façon à éviter au maximum la formation de grumeau<bold>Étape 2/5</boldFaire chauffer le mélange au bain-marie afin de faire fondre   les grumeaux de la gomme carraghénane puis retirer du fe<bold>Étape 3/5</boldLaisser refroidir, ajouter le cosgard. Bien mélanger<bold>Étape 4/5</boldTransférer la préparation dans un contenant de 100 m<bold>Étape 5/5</boldAppliquer sur cheveux mouillés après la routine de lavage",
      "gel": true,
      "isUp": false,
      "leaveIn": false,
      "listeIngredients": "💧1½ verre d’ea🥄1,5 gr de <link href='https://www.aroma-zone.com/info/fiche-technique/actif-cosmetique-proteines-soie-hydrolysees-aroma-zone#ae5'>Protéine de soie</linkFacultatif  💦 19 gouttes de <link href='https://www.aroma-zone.com/info/fiche-technique/conservateur-cosgard-aroma-zone#ae5'>Cosgard</link",
      "masqueHydratant": false,
      "masqueNourissant": false,
      "masqueProteine": false,
      "nbIngredients": 3,
      "niveauDifficulte": "Facile",
      "photoPrincipale": "assets/gel/3.jpg",
      "shampoing": false,
      "sprayLotion": false,
      "titre": "Silicone végétal",
      "userCreate": {
        "__ref__": "users/3G6FnWOi0VUxafamR834tP4l6my1"
      },
      "__collections__": {}
    }
    
  }""")
  ];
  List<dynamic> get recettes => _recettes;
  set gel(List<dynamic> _value) {
    _recettes = _value;
    prefs.setStringList('ff_gel', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToGel(dynamic _value) {
    _recettes.add(_value);
    prefs.setStringList('ff_gel', _recettes.map((x) => jsonEncode(x)).toList());
  }

  void removeFromGel(dynamic _value) {
    _recettes.remove(_value);
    prefs.setStringList('ff_gel', _recettes.map((x) => jsonEncode(x)).toList());
  }
}

