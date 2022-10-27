import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modal/Article.dart';
import '../../modal/Contact.dart';
import '../../provider/ArticleModal.dart';

class ContactSlectionner extends StatelessWidget {
  const ContactSlectionner({Key? key, required this.contact}) : super(key: key);

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home, color: Colors.white),
        title: Text("Contact"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              child: Image(
                image: AssetImage('/images/contact.png'),
                height: 50,
              ),
            ),
            Text('${contact.name}', style: TextStyle(fontSize: 10)),
            Text(
              'tel: ${contact.tel} N°Siret: ${contact.siret}',
              style: TextStyle(fontSize: 10),
            ),
            Text('Vendu'),
            Container(
              height: 170,
              margin: EdgeInsets.all(10),
              child: Consumer<ArticleModal>(
                  builder: (context, articleModal, child) {
                    List<Article> articles = articleModal.articles;
                    return ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        Article currentArticle = articles[index];
                        return Card(
                          elevation: 20,
                          margin: EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: ListTile(
                            leading: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 64,
                                minHeight: 44,
                                maxWidth: 64,
                                maxHeight: 64,
                              ),
                              child: Image.asset(currentArticle.image,
                                  fit: BoxFit.cover),
                            ),
                            title: Text(currentArticle.nom),
                            subtitle: (currentArticle.quantite >= 4)
                                ? Text("En stock")
                                : (currentArticle.quantite < 4 &&
                                currentArticle.quantite > 1)
                                ? Text(
                                "${currentArticle.quantite} exemplaires restants")
                                : (currentArticle.quantite == 1)
                                ? Text("1 exemplaire restant")
                                : Text("Stock épuisé"),
                            trailing: Text("${currentArticle.prix} €"),
                          ),
                        );
                      },
                    );
                  }),
            ),
            Text('Acheter'),
            Container(
              margin: EdgeInsets.all(10),
              height: 200,
              child: Consumer<ArticleModal>(
                  builder: (context, articleModal, child) {
                    List<Article> articles = articleModal.articles;
                    return ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        Article currentArticle = articles[index];
                        return Card(
                          elevation: 20,
                          margin: EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: ListTile(
                            leading: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 64,
                                minHeight: 44,
                                maxWidth: 64,
                                maxHeight: 64,
                              ),
                              child: Image.asset(currentArticle.image,
                                  fit: BoxFit.cover),
                            ),
                            title: Text(currentArticle.nom),
                            subtitle: (currentArticle.quantite >= 4)
                                ? Text("En stock")
                                : (currentArticle.quantite < 4 &&
                                currentArticle.quantite > 1)
                                ? Text(
                                "${currentArticle.quantite} exemplaires restants")
                                : (currentArticle.quantite == 1)
                                ? Text("1 exemplaire restant")
                                : Text("Stock épuisé"),
                            trailing: Text("${currentArticle.prix} €"),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
        /*
        child:  */
      ),
    );
  }
}