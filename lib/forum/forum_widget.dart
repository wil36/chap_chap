// ignore_for_file: avoid_print, unnecessary_statements
import 'package:chap_chap/forum/Models/forum_model.dart';
import 'package:chap_chap/forum/detail_forum_widget.dart';
import 'package:chap_chap/notification/notification_widget.dart';
import 'package:chap_chap/profil/profil_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForumWidget extends StatefulWidget {
  const ForumWidget({Key? key}) : super(key: key);

  @override
  _ForumWidgetState createState() => _ForumWidgetState();
}

class _ForumWidgetState extends State<ForumWidget> {
  ScrollController scrollController = new ScrollController();

  List<ForumModel> items = [];
  bool isLoading = true;

  Future<List<ForumModel>> getForumData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('forum').get();
    List<ForumModel> forumList = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      ForumModel forum = ForumModel.fromJson(data);
      forum.id = doc.id;
      return forum;
    }).toList();
    print('hello');
    print(forumList);
    return forumList;
  }

  @override
  void initState() {
    super.initState();
    getForumData().then((value) {
      setState(() {
        items = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: MizzUpTheme.tertiaryColor,
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 40, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MizzUpIconButton(
                    borderColor: MizzUpTheme.secondaryColor,
                    borderRadius: 20,
                    buttonSize: 40,
                    fillColor: MizzUpTheme.secondaryColor,
                    icon: const FaIcon(
                      FontAwesomeIcons.bell,
                      color: MizzUpTheme.primaryColor,
                      size: 20,
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationWidget(),
                        ),
                      );
                    },
                  ),
                  MizzUpIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 40,
                    fillColor: MizzUpTheme.secondaryColor,
                    icon: const FaIcon(
                      FontAwesomeIcons.user,
                      color: MizzUpTheme.primaryColor,
                      size: 20,
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilWidget(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 5, 20, 10),
                    child: GestureDetector(
                      onTap: () async {
                        // Récupère la référence de la collection "users"
                        final usersCollection =
                            FirebaseFirestore.instance.collection('users');
                        print(usersCollection);

// Récupère la référence de la collection "likes"
                        final likesCollection =
                            FirebaseFirestore.instance.collection('likes');
                        print(likesCollection);

                        await addLikesFromUsers(
                            usersCollection, likesCollection);
                      },
                      child: Text(
                        'Bonjour $currentUserDisplayName',
                        textAlign: TextAlign.start,
                        style: MizzUpTheme.title1.override(
                          fontFamily: 'IBM',
                          color: Colors.white,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
                    child: Text(
                      'Bienvenue dans ton appli Chap Chap, l\'application pour prendre soin de tes cheveux sans te prendre la tête',
                      style: MizzUpTheme.bodyText1.override(
                        fontFamily: 'IBM',
                        color: Colors.white,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Align(
                  alignment: const AlignmentDirectional(-0.8, 0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 1,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: scrollController,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Forum",
                            style: MizzUpTheme.subtitle1,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Material(
                              borderRadius: BorderRadius.circular(18.0),
                              color: Colors.white,
                              shadowColor: MizzUpTheme.secondaryColor,
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "<< Seul on va plus-vite, ensemble, on va plus loin. >>",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'IBM',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Quoi de mieux qu’un forum pour s’entraider tous ensemble ? Ici, on échange dans la bienveillance, le respect et toujours dans la bonne humeur 🤎",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'IBM',
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          isLoading
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: MizzUpTheme.primaryColor,
                                    ),
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  width: double.infinity,
                                  height: MediaQuery.of(context).size.height,
                                  child: GridView(
                                    physics: NeverScrollableScrollPhysics(),
                                    controller: scrollController,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount:
                                                2, // Nombre de colonnes
                                            crossAxisSpacing:
                                                10, // Espacement horizontal
                                            mainAxisSpacing: 10
                                            // childAspectRatio:
                                            //     1.5, // Ratio de l'aspect des cellules
                                            ),
                                    children: items
                                        .map((item) => _buildItem(item))
                                        .toList(),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }

  // Définit une fonction asynchrone pour récupérer les favoris de chaque utilisateur
  Future<void> addLikesFromUsers(usersCollection, likesCollection) async {
    // Récupère tous les documents de la collection "users"
    final usersSnapshots = await usersCollection.get();

    // Pour chaque document d'utilisateur
    for (final userSnapshot in usersSnapshots.docs) {
      // Récupère le champ "favorisRecettes" sous forme de liste
      if (userSnapshot.data()['favorisRecettes'] == null) {
        continue;
      }
      final favorisRecettes =
          List<DocumentReference>.from(userSnapshot.data()['favorisRecettes']);

      // Divise la liste de favoris en lots de moins de 500 éléments
      final recetteBatches = <List<DocumentReference>>[];
      while (favorisRecettes.isNotEmpty) {
        recetteBatches.add(favorisRecettes.take(500).toList());
        favorisRecettes.removeRange(0, min(500, favorisRecettes.length));
      }

      // Crée un nouveau batch pour les opérations à réaliser pour ce user
      final batch = FirebaseFirestore.instance.batch();

      // Pour chaque lot de favoris de recettes
      for (final recetteBatch in recetteBatches) {
        // Crée un nouveau document dans la collection "likes"
        final likeDocument = likesCollection.doc();

        // Convertit la liste de DocumentReference en une liste de Map pour le batch
        final recettesData = recetteBatch.map((ref) => {'ref': ref}).toList();

        // Ajoute les champs "recette_id" et "user_id" au nouveau document
        batch.set(
          likeDocument,
          {
            'recette_id': FieldValue.arrayUnion(recettesData),
            'user_id': userSnapshot.reference,
          },
        );
      }

      // Exécute le batch pour ajouter les documents de "likes" pour ce user
      await batch.commit();
    }
  }

  Widget _buildItem(ForumModel item) {
    return GestureDetector(
      onTap: () {
        // Redirection vers une page de contenu
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailForumWidget(
              forumModel: item,
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.2,
        height: MediaQuery.of(context).size.width / 2.2,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Card(
          elevation: 2,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  padding: EdgeInsets.only(bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      item.photo,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width / 3.3,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  item.titre,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: 'IBM',
                    color: MizzUpTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
