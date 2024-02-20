// ignore_for_file: unnecessary_const, depend_on_referenced_packages, library_private_types_in_public_api

import 'package:chap_chap/articles/webview.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:html_unescape/html_unescape.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../MizzUp_Code/MizzUp_icon_button.dart';
import '../MizzUp_Code/MizzUp_theme.dart';
import '../MizzUp_Code/MizzUp_toggle_icon.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;

class PageDeArticleWidget extends StatefulWidget {
  const PageDeArticleWidget({
    Key? key,
    this.detailArticle,
  }) : super(key: key);

  final ArticlesRecord? detailArticle;
  @override
  _PageDeArticleWidgetState createState() => _PageDeArticleWidgetState();
}

class _PageDeArticleWidgetState extends State<PageDeArticleWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

/*
String supprimerParagraphe(String html) {
  final document = dom.Document.html(html);
  final idList = ['2f83219', 'e30a751', 'e5a0e45', '6f577b68', '1870a01a', '7417037f', '29364313'];
  idList.forEach((id) => document.querySelector('class="elementor-section elementor-top-section elementor-element elementor-element-')?.remove());
  
  // Supprimer la deuxième image
  final images = document.querySelectorAll('.elementor-image img');
  if (images.length > 1) {
    images[1].remove();
  }
  
  return document.outerHtml;
} 
*/

  String supprimerParagraphe(String html) {
    final document = dom.Document.html(html);

    // Supprimer les 2 premières sections
    final sections = document.querySelectorAll('.elementor-section');
    if (sections.length > 1) {
      sections[0].remove();
      sections[1].remove();
      sections[2].remove();
      sections[3].remove();
    }

    // Supprimer les 6 dernières sections
    if (sections.length > 7) {
      for (var i = sections.length - 7; i < sections.length; i++) {
        sections[i].remove();
      }
    }




    return document.outerHtml;
  }

  String htmlAvecScript = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: StreamBuilder<ArticlesRecord?>(
        stream: ArticlesRecord.getDocument(widget.detailArticle!.reference!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return const Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: const CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            );
          }
          final columnArticlesRecord = snapshot.data!;
          htmlAvecScript =
              supprimerParagraphe(columnArticlesRecord.description!);
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: const Radius.circular(20),
                          topLeft: Radius.circular(0),
                          topRight: const Radius.circular(0),
                        ),
                        child: Image.network(
                          columnArticlesRecord.imagePrincipale!,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 40, 20, 0),
                        child: StreamBuilder<UsersRecord?>(
                          stream:
                              UsersRecord.getDocument(currentUserReference!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return const Center(
                                child: SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            }
                            final rowUsersRecord = snapshot.data!;
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MizzUpIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 40,
                                  fillColor: MizzUpTheme.secondaryColor,
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: MizzUpTheme.tertiaryColor,
                                    size: 20,
                                  ),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: const BoxDecoration(
                                        color: MizzUpTheme.secondaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: ToggleIcon(
                                        onPressed: () async {
                                          final favorisArticlesElement =
                                              columnArticlesRecord.reference;
                                          final favorisArticlesUpdate =
                                              rowUsersRecord.favorisArticles!
                                                      .contains(
                                                          favorisArticlesElement)
                                                  ? FieldValue.arrayRemove(
                                                      [favorisArticlesElement])
                                                  : FieldValue.arrayUnion(
                                                      [favorisArticlesElement]);
                                          final usersUpdateData = {
                                            'favorisArticles':
                                                favorisArticlesUpdate,
                                          };
                                          await rowUsersRecord.reference!
                                              .update(usersUpdateData);
                                        },
                                        value: rowUsersRecord.favorisArticles!
                                            .contains(
                                                columnArticlesRecord.reference),
                                        onIcon: const Icon(
                                          Icons.favorite_sharp,
                                          color: MizzUpTheme.primaryColor,
                                          size: 20,
                                        ),
                                        offIcon: const Icon(
                                          Icons.favorite_border,
                                          color: MizzUpTheme.primaryColor,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                    child: Html(data: '<div style="text-align: center; color: #844631;"><strong>' + HtmlUnescape().convert(columnArticlesRecord.titre!) + '</strong></div>')
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.0), // ajustez le padding selon vos besoins
                  color: Colors.white, // ajustez la couleur selon vos besoins
                  child: HtmlWidget(
                    htmlAvecScript,
                    onTapUrl: (String? url) async {
                      if (url != null) {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebviewWidget(url: url)),
                        );
                        return true;
                      }
                      return false;
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

/*
  String monHtml =
      '''<div data-elementor-type="wp-post" data-elementor-id="11220" class="elementor elementor-11220">
        <div class="elementor-inner">
            <div class="elementor-section-wrap">
                <section
                    class="elementor-section elementor-top-section elementor-element elementor-element-2f83219 elementor-section-stretched elementor-section-boxed elementor-section-height-default elementor-section-height-default"
                    data-id="2f83219" data-element_type="section"
                    data-settings="{&quot;background_background&quot;:&quot;classic&quot;,&quot;stretch_section&quot;:&quot;section-stretched&quot;}">
                    <div class="elementor-container elementor-column-gap-default">
                        <div class="elementor-row">
                            <div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-1ac41ebb"
                                data-id="1ac41ebb" data-element_type="column">
                                <div class="elementor-column-wrap elementor-element-populated">
                                    <div class="elementor-widget-wrap">
                                        <div class="elementor-element elementor-element-7b9f526d elementor-widget elementor-widget-heading"
                                            data-id="7b9f526d" data-element_type="widget"
                                            data-widget_type="heading.default">
                                            <div class="elementor-widget-container">
                                                <h2 class="elementor-heading-title elementor-size-default"><br>LE BLOG
                                                </h2>
                                            </div>
                                        </div>
                                        <div class="elementor-element elementor-element-36ca3d94 elementor-nav-menu__align-center elementor-nav-menu--dropdown-tablet elementor-nav-menu__text-align-aside elementor-nav-menu--toggle elementor-nav-menu--burger elementor-widget elementor-widget-nav-menu"
                                            data-id="36ca3d94" data-element_type="widget"
                                            data-settings="{&quot;layout&quot;:&quot;horizontal&quot;,&quot;submenu_icon&quot;:{&quot;value&quot;:&quot;&lt;i class=\&quot;fas fa-caret-down\&quot;&gt;&lt;\/i&gt;&quot;,&quot;library&quot;:&quot;fa-solid&quot;},&quot;toggle&quot;:&quot;burger&quot;}"
                                            data-widget_type="nav-menu.default">
                                            <div class="elementor-widget-container">
                                                <nav
                                                    class="elementor-nav-menu--main elementor-nav-menu__container elementor-nav-menu--layout-horizontal e--pointer-background e--animation-fade">
                                                    <ul id="menu-1-36ca3d94" class="elementor-nav-menu">
                                                        <li
                                                            class="menu-item menu-item-type-post_type menu-item-object-page menu-item-12420">
                                                            <a href="https://chapchap.io/blog/"
                                                                class="elementor-item">TOUT</a></li>
                                                        <li
                                                            class="menu-item menu-item-type-post_type menu-item-object-page menu-item-13272">
                                                            <a href="https://chapchap.io/astuces-conseils/"
                                                                class="elementor-item">ASTUCES &#038; CONSEILS</a></li>
                                                        <li
                                                            class="menu-item menu-item-type-post_type menu-item-object-page menu-item-13271">
                                                            <a href="https://chapchap.io/blog-zoom-produits-ingredients/"
                                                                class="elementor-item">ZOOM PRODUITS &#038;
                                                                INGRÉDIENTS</a></li>
                                                        <li
                                                            class="menu-item menu-item-type-post_type menu-item-object-page menu-item-13279">
                                                            <a href="https://chapchap.io/blog-chit-chat/"
                                                                class="elementor-item">CHIT CHAT</a></li>
                                                    </ul>
                                                </nav>
                                                <div class="elementor-menu-toggle" role="button" tabindex="0"
                                                    aria-label="Menu Toggle" aria-expanded="false"> <i
                                                        aria-hidden="true" role="presentation"
                                                        class="elementor-menu-toggle__icon--open eicon-menu-bar"></i><i
                                                        aria-hidden="true" role="presentation"
                                                        class="elementor-menu-toggle__icon--close eicon-close"></i>
                                                    <span class="elementor-screen-only">Menu</span> </div>
                                                <nav class="elementor-nav-menu--dropdown elementor-nav-menu__container"
                                                    aria-hidden="true">
                                                    <ul id="menu-2-36ca3d94" class="elementor-nav-menu">
                                                        <li
                                                            class="menu-item menu-item-type-post_type menu-item-object-page menu-item-12420">
                                                            <a href="https://chapchap.io/blog/" class="elementor-item"
                                                                tabindex="-1">TOUT</a></li>
                                                        <li
                                                            class="menu-item menu-item-type-post_type menu-item-object-page menu-item-13272">
                                                            <a href="https://chapchap.io/astuces-conseils/"
                                                                class="elementor-item" tabindex="-1">ASTUCES &#038;
                                                                CONSEILS</a></li>
                                                        <li
                                                            class="menu-item menu-item-type-post_type menu-item-object-page menu-item-13271">
                                                            <a href="https://chapchap.io/blog-zoom-produits-ingredients/"
                                                                class="elementor-item" tabindex="-1">ZOOM PRODUITS
                                                                &#038; INGRÉDIENTS</a></li>
                                                        <li
                                                            class="menu-item menu-item-type-post_type menu-item-object-page menu-item-13279">
                                                            <a href="https://chapchap.io/blog-chit-chat/"
                                                                class="elementor-item" tabindex="-1">CHIT CHAT</a></li>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                        <div class="elementor-element elementor-element-1cf4a3e elementor-widget elementor-widget-spacer"
                                            data-id="1cf4a3e" data-element_type="widget"
                                            data-widget_type="spacer.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-spacer">
                                                    <div class="elementor-spacer-inner"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section
                    class="elementor-section elementor-top-section elementor-element elementor-element-e30a751 elementor-section-full_width elementor-section-stretched elementor-section-height-default elementor-section-height-default"
                    data-id="e30a751" data-element_type="section"
                    data-settings="{&quot;stretch_section&quot;:&quot;section-stretched&quot;}">
                    <div class="elementor-container elementor-column-gap-no">
                        <div class="elementor-row">
                            <div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-f92522a"
                                data-id="f92522a" data-element_type="column">
                                <div class="elementor-column-wrap elementor-element-populated">
                                    <div class="elementor-widget-wrap">
                                        <div class="elementor-element elementor-element-c567dfe elementor-widget elementor-widget-image"
                                            data-id="c567dfe" data-element_type="widget"
                                            data-widget_type="image.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-image"> <img decoding="async" width="768"
                                                        height="300"
                                                        src="https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Blog-cover-2.png?fit=768%2C300&amp;ssl=1"
                                                        class="attachment-medium_large size-medium_large wp-image-12961"
                                                        alt="Prendre soin de ses cheveux avec les poudres - Chap Chap"
                                                        loading="lazy"
                                                        srcset="https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Blog-cover-2.png?w=768&amp;ssl=1 768w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Blog-cover-2.png?resize=300%2C117&amp;ssl=1 300w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Blog-cover-2.png?resize=600%2C234&amp;ssl=1 600w"
                                                        sizes="(max-width: 768px) 100vw, 768px" /> </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section
                    class="elementor-section elementor-top-section elementor-element elementor-element-23d3df2 elementor-section-stretched elementor-section-boxed elementor-section-height-default elementor-section-height-default"
                    data-id="23d3df2" data-element_type="section"
                    data-settings="{&quot;stretch_section&quot;:&quot;section-stretched&quot;}">
                    <div class="elementor-container elementor-column-gap-default">
                        <div class="elementor-row">
                            <div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-7caca45"
                                data-id="7caca45" data-element_type="column">
                                <div class="elementor-column-wrap elementor-element-populated">
                                    <div class="elementor-widget-wrap"> </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section
                    class="elementor-section elementor-top-section elementor-element elementor-element-e5a0e45 elementor-section-full_width elementor-section-stretched elementor-section-height-default elementor-section-height-default"
                    data-id="e5a0e45" data-element_type="section"
                    data-settings="{&quot;stretch_section&quot;:&quot;section-stretched&quot;}">
                    <div class="elementor-container elementor-column-gap-default">
                        <div class="elementor-row">
                            <div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-b5429b2"
                                data-id="b5429b2" data-element_type="column">
                                <div class="elementor-column-wrap elementor-element-populated">
                                    <div class="elementor-widget-wrap">
                                        <div class="elementor-element elementor-element-9d142b1 elementor-align-center elementor-widget elementor-widget-post-info"
                                            data-id="9d142b1" data-element_type="widget"
                                            data-widget_type="post-info.default">
                                            <div class="elementor-widget-container">
                                                <ul
                                                    class="elementor-inline-items elementor-icon-list-items elementor-post-info">
                                                    <li class="elementor-icon-list-item elementor-repeater-item-1c9b31d elementor-inline-item"
                                                        itemprop="about"> <span class="elementor-icon-list-icon"> <i
                                                                aria-hidden="true" class="fas fa-tags"></i> </span>
                                                        <span
                                                            class="elementor-icon-list-text elementor-post-info__item elementor-post-info__item--type-terms">
                                                            <span class="elementor-post-info__terms-list"> <a
                                                                    href="https://chapchap.io/category/astuces-conseils/"
                                                                    class="elementor-post-info__terms-list-item">Astuces
                                                                    &amp; conseils</a> </span> </span> </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section
                    class="elementor-section elementor-top-section elementor-element elementor-element-ba7fc0c elementor-section-full_width elementor-section-stretched elementor-section-height-default elementor-section-height-default"
                    data-id="ba7fc0c" data-element_type="section"
                    data-settings="{&quot;stretch_section&quot;:&quot;section-stretched&quot;}">
                    <div class="elementor-container elementor-column-gap-default">
                        <div class="elementor-row">
                            <div class="elementor-column elementor-col-25 elementor-top-column elementor-element elementor-element-b4b588d"
                                data-id="b4b588d" data-element_type="column">
                                <div class="elementor-column-wrap">
                                    <div class="elementor-widget-wrap"> </div>
                                </div>
                            </div>
                            <div class="elementor-column elementor-col-50 elementor-top-column elementor-element elementor-element-cc550f8"
                                data-id="cc550f8" data-element_type="column">
                                <div class="elementor-column-wrap elementor-element-populated">
                                    <div class="elementor-widget-wrap">
                                        <div class="elementor-element elementor-element-708eeb7 elementor-widget elementor-widget-text-editor"
                                            data-id="708eeb7" data-element_type="widget"
                                            data-widget_type="text-editor.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-text-editor elementor-clearfix">
                                                    <p><span style="font-weight: 400;">Comme on aime souvent le dire :
                                                            les poudres c’est la vie ! Elles ont tellement de bienfaits
                                                            pour les cheveux qu’une fois essayées il est difficile de
                                                            s’en passer </span></p>
                                                    <h5><span style="color: #b77e65;"><b>Comment utiliser les poudres
                                                                ayurvédiques ?</b></span></h5>
                                                    <p>Il existe plusieurs façons de les utiliser ! Les 2 façons les
                                                        plus courantes sont : le Shampoing végétal (no-poo) et le masque
                                                        capillaire. Les poudres lavantes les plus connues sont les
                                                        poudres de <span style="color: #b77e65;"><a
                                                                style="color: #b77e65;"
                                                                href="https://www.aroma-zone.com/info/fiche-technique/poudre-ayurvedique-sidr-bio-aroma-zone#ae5"><strong>Sidr</strong></a></span>,<a
                                                            href="https://www.aroma-zone.com/info/fiche-technique/shampooing-vegetal-shikakai-aroma-zone#ae5"><strong><span
                                                                    style="color: #b77e65;">
                                                                    Shikakaï</span></strong></a> et <strong><span
                                                                style="color: #b77e65;"><a style="color: #b77e65;"
                                                                    href="https://www.aroma-zone.com/info/fiche-technique/poudre-ayurvedique-reetha-aroma-zone#ae5">Reetha</a>
                                                            </span></strong>(appelé aussi Ritha).</p>
                                                    <p><b>Pour réaliser un shampoing végétal voici les différentes
                                                            étapes à suivre :</b></p>
                                                    <ol>
                                                        <li style="list-style-type: none;">
                                                            <ol>
                                                                <li><span style="font-weight: 400;"><strong>Mélanger une
                                                                            ou plusieurs poudres de plantes lavantes
                                                                            avec de l’eau tiède</strong> ensemble
                                                                        jusqu’à obtention d’un mélange homogène. La
                                                                        texture doit avoir l’épaisseur d’un yaourt.
                                                                        Facultatif : Mixer à l’aide d’un batteur
                                                                        électrique (avec embouts en plastique) pour
                                                                        obtenir une texture plus facile à
                                                                        appliquer.</span></li>
                                                                <li><span style="font-weight: 400;"><strong>Mouiller ses
                                                                            cheveux, appliquer le mélange des racines
                                                                            jusqu’aux pointes</strong>. Finir par un
                                                                        massage du cuir chevelu.</span></li>
                                                                <li><span style="font-weight: 400;"><strong>Laisser
                                                                            poser entre 5 et 30 minutes</strong> (ou
                                                                        plus) et rincer abondamment.</span></li>
                                                                <li><span style="font-weight: 400;"><strong>Poursuivre
                                                                            ensuite avec un après shampoing</strong> ou
                                                                        la routine de coiffage habituelle</span></li>
                                                            </ol>
                                                        </li>
                                                    </ol>
                                                    <p><span style="font-weight: 400;">Si tu souhaites optimiser les
                                                            bienfaits de ton shampoing végétal, tu peux également les
                                                            mélanger avec d’autres poudres de plantes et des ingrédients
                                                            hydratants (Par exemple : Miel, Sirop d’agave, Mélasse,
                                                            Glycérine, Aloe Vera, Gel de lin etc.) </span></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="elementor-column elementor-col-25 elementor-top-column elementor-element elementor-element-d385af5"
                                data-id="d385af5" data-element_type="column">
                                <div class="elementor-column-wrap">
                                    <div class="elementor-widget-wrap"> </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section
                    class="elementor-section elementor-top-section elementor-element elementor-element-e002883 elementor-section-full_width elementor-section-stretched elementor-section-height-default elementor-section-height-default"
                    data-id="e002883" data-element_type="section"
                    data-settings="{&quot;stretch_section&quot;:&quot;section-stretched&quot;}">
                    <div class="elementor-container elementor-column-gap-default">
                        <div class="elementor-row">
                            <div class="elementor-column elementor-col-25 elementor-top-column elementor-element elementor-element-13218ed"
                                data-id="13218ed" data-element_type="column">
                                <div class="elementor-column-wrap">
                                    <div class="elementor-widget-wrap"> </div>
                                </div>
                            </div>
                            <div class="elementor-column elementor-col-50 elementor-top-column elementor-element elementor-element-e501902"
                                data-id="e501902" data-element_type="column">
                                <div class="elementor-column-wrap elementor-element-populated">
                                    <div class="elementor-widget-wrap">
                                        <div class="elementor-element elementor-element-d90ab45 elementor-widget elementor-widget-text-editor"
                                            data-id="d90ab45" data-element_type="widget"
                                            data-widget_type="text-editor.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-text-editor elementor-clearfix">
                                                    <p><b style="color: #b77e65;">Quelles poudres de plantes choisir
                                                            ?</b><span style="color: #b77e65;"> </span></p>
                                                    <p><span style="font-weight: 400;">Pour réaliser un masque
                                                            capillaire, il te suffit de suivre le même principe :
                                                            mélanger les poudres de ton choix avec de l’eau et un ou
                                                            plusieurs ingrédients hydratants</span><b>. </b><span
                                                            style="font-weight: 400;">Il faudra ensuite laisser poser
                                                            ton soin des racines jusqu’aux pointes pour une durée de 30
                                                            minutes et plus si affinités.</span></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="elementor-element elementor-element-0f60426 elementor-widget elementor-widget-text-editor"
                                            data-id="0f60426" data-element_type="widget"
                                            data-widget_type="text-editor.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-text-editor elementor-clearfix">
                                                    <p><b>Pour te simplifier la vie, nous avons répertorié les plus
                                                            connues en fonction de leurs bienfaits dans notre <span
                                                                style="color: #b77e65;"><a style="color: #b77e65;"
                                                                    href="https://chapchap.io/ebook-naturel-gratuit/">Ebook
                                                                    gratuit &#8211; le naturel à portée de
                                                                    main</a></span></b></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="elementor-column elementor-col-25 elementor-top-column elementor-element elementor-element-6356ff6"
                                data-id="6356ff6" data-element_type="column">
                                <div class="elementor-column-wrap">
                                    <div class="elementor-widget-wrap"> </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section
                    class="elementor-section elementor-top-section elementor-element elementor-element-af618c9 elementor-section-stretched elementor-hidden-desktop elementor-hidden-tablet elementor-section-boxed elementor-section-height-default elementor-section-height-default"
                    data-id="af618c9" data-element_type="section"
                    data-settings="{&quot;stretch_section&quot;:&quot;section-stretched&quot;}">
                    <div class="elementor-container elementor-column-gap-default">
                        <div class="elementor-row">
                            <div class="elementor-column elementor-col-33 elementor-top-column elementor-element elementor-element-5dc8cf8"
                                data-id="5dc8cf8" data-element_type="column">
                                <div class="elementor-column-wrap">
                                    <div class="elementor-widget-wrap"> </div>
                                </div>
                            </div>
                            <div class="elementor-column elementor-col-33 elementor-top-column elementor-element elementor-element-34fb0b9"
                                data-id="34fb0b9" data-element_type="column">
                                <div class="elementor-column-wrap elementor-element-populated">
                                    <div class="elementor-widget-wrap">
                                        <div class="elementor-element elementor-element-1314cf8 elementor-widget elementor-widget-image"
                                            data-id="1314cf8" data-element_type="widget"
                                            data-widget_type="image.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-image"> <a
                                                        href="https://www.instagram.com/chapchap.app/"> <img
                                                            decoding="async" width="1024" height="1024"
                                                            src="https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?fit=1024%2C1024&amp;ssl=1"
                                                            class="attachment-large size-large wp-image-12863" alt=""
                                                            loading="lazy"
                                                            srcset="https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?w=1024&amp;ssl=1 1024w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?resize=300%2C300&amp;ssl=1 300w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?resize=150%2C150&amp;ssl=1 150w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?resize=768%2C768&amp;ssl=1 768w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?resize=650%2C650&amp;ssl=1 650w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?resize=600%2C600&amp;ssl=1 600w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?resize=100%2C100&amp;ssl=1 100w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?w=500&amp;ssl=1 500w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?w=450&amp;ssl=1 450w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?w=375&amp;ssl=1 375w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?w=355&amp;ssl=1 355w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?w=345&amp;ssl=1 345w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?w=330&amp;ssl=1 330w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?w=350&amp;ssl=1 350w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?w=800&amp;ssl=1 800w"
                                                            sizes="(max-width: 1024px) 100vw, 1024px" /> </a> </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="elementor-column elementor-col-33 elementor-top-column elementor-element elementor-element-96cdda2"
                                data-id="96cdda2" data-element_type="column">
                                <div class="elementor-column-wrap">
                                    <div class="elementor-widget-wrap"> </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section
                    class="elementor-section elementor-top-section elementor-element elementor-element-e4b16b5 elementor-section-stretched elementor-hidden-mobile elementor-section-boxed elementor-section-height-default elementor-section-height-default"
                    data-id="e4b16b5" data-element_type="section"
                    data-settings="{&quot;stretch_section&quot;:&quot;section-stretched&quot;}">
                    <div class="elementor-container elementor-column-gap-default">
                        <div class="elementor-row">
                            <div class="elementor-column elementor-col-33 elementor-top-column elementor-element elementor-element-c25a69d"
                                data-id="c25a69d" data-element_type="column">
                                <div class="elementor-column-wrap">
                                    <div class="elementor-widget-wrap"> </div>
                                </div>
                            </div>
                            <div class="elementor-column elementor-col-33 elementor-top-column elementor-element elementor-element-3d6b643"
                                data-id="3d6b643" data-element_type="column">
                                <div class="elementor-column-wrap elementor-element-populated">
                                    <div class="elementor-widget-wrap">
                                        <div class="elementor-element elementor-element-26ead3b elementor-widget elementor-widget-image"
                                            data-id="26ead3b" data-element_type="widget"
                                            data-widget_type="image.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-image"> <a
                                                        href="https://www.instagram.com/chapchap.app/"> <img
                                                            decoding="async" width="1024" height="1024"
                                                            src="https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?fit=1024%2C1024&amp;ssl=1"
                                                            class="attachment-large size-large wp-image-12863" alt=""
                                                            loading="lazy"
                                                            srcset="https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?w=1024&amp;ssl=1 1024w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?resize=300%2C300&amp;ssl=1 300w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?resize=150%2C150&amp;ssl=1 150w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?resize=768%2C768&amp;ssl=1 768w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?resize=650%2C650&amp;ssl=1 650w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?resize=600%2C600&amp;ssl=1 600w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?resize=100%2C100&amp;ssl=1 100w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?w=500&amp;ssl=1 500w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?w=450&amp;ssl=1 450w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?w=375&amp;ssl=1 375w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?w=355&amp;ssl=1 355w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?w=345&amp;ssl=1 345w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?w=330&amp;ssl=1 330w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?w=350&amp;ssl=1 350w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/02/Signatures-blog-petite-1024-×-1024-px.png?w=800&amp;ssl=1 800w"
                                                            sizes="(max-width: 1024px) 100vw, 1024px" /> </a> </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="elementor-column elementor-col-33 elementor-top-column elementor-element elementor-element-a53e277"
                                data-id="a53e277" data-element_type="column">
                                <div class="elementor-column-wrap">
                                    <div class="elementor-widget-wrap"> </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section
                    class="elementor-section elementor-top-section elementor-element elementor-element-6f577b68 elementor-section-boxed elementor-section-height-default elementor-section-height-default"
                    data-id="6f577b68" data-element_type="section"
                    data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
                    <div class="elementor-container elementor-column-gap-default">
                        <div class="elementor-row">
                            <div class="elementor-column elementor-col-33 elementor-top-column elementor-element elementor-element-2d6af35b"
                                data-id="2d6af35b" data-element_type="column">
                                <div class="elementor-column-wrap">
                                    <div class="elementor-widget-wrap"> </div>
                                </div>
                            </div>
                            <div class="elementor-column elementor-col-33 elementor-top-column elementor-element elementor-element-3ffad8f"
                                data-id="3ffad8f" data-element_type="column">
                                <div class="elementor-column-wrap elementor-element-populated">
                                    <div class="elementor-widget-wrap">
                                        <div class="elementor-element elementor-element-443ba114 elementor-widget elementor-widget-text-editor"
                                            data-id="443ba114" data-element_type="widget"
                                            data-widget_type="text-editor.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-text-editor elementor-clearfix">
                                                    <p><a href="http://www.chapchap.io"><img decoding="async"
                                                                loading="lazy" class="alignnone wp-image-9417"
                                                                src="https://i0.wp.com/chapchap.io/wp-content/uploads/2021/09/Chap-Chap-APPLE-TOUCH-SITE-192PX.png?resize=65%2C65&#038;ssl=1"
                                                                alt="" width="65" height="65" data-recalc-dims="1"
                                                                srcset="https://i0.wp.com/chapchap.io/wp-content/uploads/2021/09/Chap-Chap-APPLE-TOUCH-SITE-192PX.png?w=192&amp;ssl=1 192w, https://i0.wp.com/chapchap.io/wp-content/uploads/2021/09/Chap-Chap-APPLE-TOUCH-SITE-192PX.png?resize=150%2C150&amp;ssl=1 150w, https://i0.wp.com/chapchap.io/wp-content/uploads/2021/09/Chap-Chap-APPLE-TOUCH-SITE-192PX.png?resize=100%2C100&amp;ssl=1 100w, https://i0.wp.com/chapchap.io/wp-content/uploads/2021/09/Chap-Chap-APPLE-TOUCH-SITE-192PX.png?w=50&amp;ssl=1 50w"
                                                                sizes="(max-width: 65px) 100vw, 65px" /></a></p>
                                                    <p>L&#8217;application pour prendre soin de ses cheveux
                                                        naturellement et simplement !</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="elementor-column elementor-col-33 elementor-top-column elementor-element elementor-element-61a33ea8"
                                data-id="61a33ea8" data-element_type="column">
                                <div class="elementor-column-wrap elementor-element-populated">
                                    <div class="elementor-widget-wrap">
                                        <div class="elementor-element elementor-element-75e5cbb elementor-hidden-desktop elementor-hidden-tablet elementor-widget elementor-widget-image"
                                            data-id="75e5cbb" data-element_type="widget"
                                            data-widget_type="image.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-image"> <a href="https://chapchap0.web.app"> <img
                                                            decoding="async" width="1024" height="149"
                                                            src="https://i0.wp.com/chapchap.io/wp-content/uploads/2021/12/LOGO-STORE-1239-x-180-px-1.png?fit=1024%2C149&amp;ssl=1"
                                                            class="attachment-large size-large wp-image-10779"
                                                            alt="Nous contacter - Télécharger Chap Chap" loading="lazy"
                                                            srcset="https://i0.wp.com/chapchap.io/wp-content/uploads/2021/12/LOGO-STORE-1239-x-180-px-1.png?w=1239&amp;ssl=1 1239w, https://i0.wp.com/chapchap.io/wp-content/uploads/2021/12/LOGO-STORE-1239-x-180-px-1.png?resize=300%2C44&amp;ssl=1 300w, https://i0.wp.com/chapchap.io/wp-content/uploads/2021/12/LOGO-STORE-1239-x-180-px-1.png?resize=1024%2C149&amp;ssl=1 1024w, https://i0.wp.com/chapchap.io/wp-content/uploads/2021/12/LOGO-STORE-1239-x-180-px-1.png?resize=768%2C112&amp;ssl=1 768w, https://i0.wp.com/chapchap.io/wp-content/uploads/2021/12/LOGO-STORE-1239-x-180-px-1.png?resize=600%2C87&amp;ssl=1 600w"
                                                            sizes="(max-width: 1024px) 100vw, 1024px" /> </a> </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section
                    class="elementor-section elementor-top-section elementor-element elementor-element-1870a01a elementor-hidden-mobile elementor-section-boxed elementor-section-height-default elementor-section-height-default"
                    data-id="1870a01a" data-element_type="section"
                    data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
                    <div class="elementor-container elementor-column-gap-default">
                        <div class="elementor-row">
                            <div class="elementor-column elementor-col-25 elementor-top-column elementor-element elementor-element-7ecb0d19"
                                data-id="7ecb0d19" data-element_type="column">
                                <div class="elementor-column-wrap">
                                    <div class="elementor-widget-wrap"> </div>
                                </div>
                            </div>
                            <div class="elementor-column elementor-col-25 elementor-top-column elementor-element elementor-element-8bb8cdd"
                                data-id="8bb8cdd" data-element_type="column">
                                <div class="elementor-column-wrap elementor-element-populated">
                                    <div class="elementor-widget-wrap">
                                        <section
                                            class="elementor-section elementor-inner-section elementor-element elementor-element-69304513 elementor-section-boxed elementor-section-height-default elementor-section-height-default"
                                            data-id="69304513" data-element_type="section">
                                            <div class="elementor-container elementor-column-gap-default">
                                                <div class="elementor-row">
                                                    <div class="elementor-column elementor-col-50 elementor-inner-column elementor-element elementor-element-1d277287"
                                                        data-id="1d277287" data-element_type="column">
                                                        <div class="elementor-column-wrap elementor-element-populated">
                                                            <div class="elementor-widget-wrap">
                                                                <div class="elementor-element elementor-element-6447b1f8 elementor-widget elementor-widget-image"
                                                                    data-id="6447b1f8" data-element_type="widget"
                                                                    data-widget_type="image.default">
                                                                    <div class="elementor-widget-container">
                                                                        <div class="elementor-image"> <a
                                                                                href="https://apps.apple.com/fr/app/chap-chap-suivi-capillaire/id1612303752">
                                                                                <img decoding="async" width="1024"
                                                                                    height="322"
                                                                                    src="https://i0.wp.com/chapchap.io/wp-content/uploads/2022/08/2880px-Download_on_the_App_Store_Badge_FRCA_RGB_blk.svg.png?fit=1024%2C322&amp;ssl=1"
                                                                                    class="attachment-large size-large wp-image-12614"
                                                                                    alt="" loading="lazy"
                                                                                    srcset="https://i0.wp.com/chapchap.io/wp-content/uploads/2022/08/2880px-Download_on_the_App_Store_Badge_FRCA_RGB_blk.svg.png?w=2880&amp;ssl=1 2880w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/08/2880px-Download_on_the_App_Store_Badge_FRCA_RGB_blk.svg.png?resize=300%2C94&amp;ssl=1 300w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/08/2880px-Download_on_the_App_Store_Badge_FRCA_RGB_blk.svg.png?resize=1024%2C322&amp;ssl=1 1024w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/08/2880px-Download_on_the_App_Store_Badge_FRCA_RGB_blk.svg.png?resize=768%2C242&amp;ssl=1 768w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/08/2880px-Download_on_the_App_Store_Badge_FRCA_RGB_blk.svg.png?resize=1536%2C484&amp;ssl=1 1536w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/08/2880px-Download_on_the_App_Store_Badge_FRCA_RGB_blk.svg.png?resize=2048%2C645&amp;ssl=1 2048w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/08/2880px-Download_on_the_App_Store_Badge_FRCA_RGB_blk.svg.png?resize=600%2C189&amp;ssl=1 600w"
                                                                                    sizes="(max-width: 1024px) 100vw, 1024px" />
                                                                            </a> </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="elementor-column elementor-col-50 elementor-inner-column elementor-element elementor-element-6237c9a4"
                                                        data-id="6237c9a4" data-element_type="column">
                                                        <div class="elementor-column-wrap elementor-element-populated">
                                                            <div class="elementor-widget-wrap">
                                                                <div class="elementor-element elementor-element-374d01d2 elementor-widget elementor-widget-image"
                                                                    data-id="374d01d2" data-element_type="widget"
                                                                    data-widget_type="image.default">
                                                                    <div class="elementor-widget-container">
                                                                        <div class="elementor-image"> <a
                                                                                href="https://play.google.com/store/apps/details?id=fr.mizzup.chapchap">
                                                                                <img decoding="async" width="190"
                                                                                    height="190"
                                                                                    src="https://i0.wp.com/chapchap.io/wp-content/uploads/2022/08/Google_Play_Store_badge_FR.svg.png?fit=190%2C190&amp;ssl=1"
                                                                                    class="attachment-large size-large wp-image-12615"
                                                                                    alt="" loading="lazy"
                                                                                    srcset="https://i0.wp.com/chapchap.io/wp-content/uploads/2022/08/Google_Play_Store_badge_FR.svg.png?resize=150%2C150&amp;ssl=1 150w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/08/Google_Play_Store_badge_FR.svg.png?resize=100%2C100&amp;ssl=1 100w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/08/Google_Play_Store_badge_FR.svg.png?zoom=2&amp;resize=190%2C190&amp;ssl=1 380w, https://i0.wp.com/chapchap.io/wp-content/uploads/2022/08/Google_Play_Store_badge_FR.svg.png?zoom=3&amp;resize=190%2C190&amp;ssl=1 570w"
                                                                                    sizes="(max-width: 190px) 100vw, 190px" />
                                                                            </a> </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>
                                    </div>
                                </div>
                            </div>
                            <div class="elementor-column elementor-col-25 elementor-top-column elementor-element elementor-element-7add7027"
                                data-id="7add7027" data-element_type="column">
                                <div class="elementor-column-wrap">
                                    <div class="elementor-widget-wrap"> </div>
                                </div>
                            </div>
                            <div class="elementor-column elementor-col-25 elementor-top-column elementor-element elementor-element-2eb42fba"
                                data-id="2eb42fba" data-element_type="column">
                                <div class="elementor-column-wrap">
                                    <div class="elementor-widget-wrap"> </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section
                    class="elementor-section elementor-top-section elementor-element elementor-element-7417037f elementor-hidden-desktop elementor-hidden-tablet elementor-section-boxed elementor-section-height-default elementor-section-height-default"
                    data-id="7417037f" data-element_type="section"
                    data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
                    <div class="elementor-container elementor-column-gap-default">
                        <div class="elementor-row">
                            <div class="elementor-column elementor-col-50 elementor-top-column elementor-element elementor-element-7d3ad29d"
                                data-id="7d3ad29d" data-element_type="column">
                                <div class="elementor-column-wrap elementor-element-populated">
                                    <div class="elementor-widget-wrap">
                                        <div class="elementor-element elementor-element-7e3d40b7 elementor-shape-rounded elementor-grid-0 e-grid-align-center elementor-widget elementor-widget-social-icons"
                                            data-id="7e3d40b7" data-element_type="widget"
                                            data-widget_type="social-icons.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-social-icons-wrapper elementor-grid"> <span
                                                        class="elementor-grid-item"> <a
                                                            class="elementor-icon elementor-social-icon elementor-social-icon-instagram elementor-repeater-item-be93274"
                                                            href="http://www.instagram.com/chapchap.app"
                                                            target="_blank"> <span
                                                                class="elementor-screen-only">Instagram</span> <i
                                                                class="fab fa-instagram"></i> </a> </span> <span
                                                        class="elementor-grid-item"> <a
                                                            class="elementor-icon elementor-social-icon elementor-social-icon-tiktok elementor-repeater-item-c209ecd"
                                                            href="http://www.tiktok.com/chapchap.app" target="_blank">
                                                            <span class="elementor-screen-only">Tiktok</span> <i
                                                                class="fab fa-tiktok"></i> </a> </span> <span
                                                        class="elementor-grid-item"> <a
                                                            class="elementor-icon elementor-social-icon elementor-social-icon-pinterest-p elementor-repeater-item-9ca79ed"
                                                            href="http://www.pinterest.com/chapchap.app"
                                                            target="_blank"> <span
                                                                class="elementor-screen-only">Pinterest-p</span> <i
                                                                class="fab fa-pinterest-p"></i> </a> </span> <span
                                                        class="elementor-grid-item"> <a
                                                            class="elementor-icon elementor-social-icon elementor-social-icon-linkedin elementor-repeater-item-af0baa3"
                                                            href="https://www.linkedin.com/company/chap-chap"
                                                            target="_blank"> <span
                                                                class="elementor-screen-only">Linkedin</span> <i
                                                                class="fab fa-linkedin"></i> </a> </span> </div>
                                            </div>
                                        </div>
                                        <div class="elementor-element elementor-element-19fe4b87 elementor-widget elementor-widget-text-editor"
                                            data-id="19fe4b87" data-element_type="widget"
                                            data-widget_type="text-editor.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-text-editor elementor-clearfix">
                                                    <p><a href="https://chapchap.io/nous-contacter/">Nous contacter</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="elementor-column elementor-col-50 elementor-top-column elementor-element elementor-element-21ec105b"
                                data-id="21ec105b" data-element_type="column">
                                <div class="elementor-column-wrap">
                                    <div class="elementor-widget-wrap"> </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section
                    class="elementor-section elementor-top-section elementor-element elementor-element-29364313 elementor-section-boxed elementor-section-height-default elementor-section-height-default"
                    data-id="29364313" data-element_type="section"
                    data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
                    <div class="elementor-container elementor-column-gap-default">
                        <div class="elementor-row">
                            <div class="elementor-column elementor-col-33 elementor-top-column elementor-element elementor-element-620a95fc"
                                data-id="620a95fc" data-element_type="column">
                                <div class="elementor-column-wrap elementor-element-populated">
                                    <div class="elementor-widget-wrap">
                                        <div class="elementor-element elementor-element-1624a6be elementor-widget elementor-widget-text-editor"
                                            data-id="1624a6be" data-element_type="widget"
                                            data-widget_type="text-editor.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-text-editor elementor-clearfix">
                                                    <p><strong>Informations légales </strong></p>
                                                    <p><a
                                                            href="https://chapchap.io/wp-content/uploads/2022/03/CGU-CHAP-CHAP.pdf">CGU</a>
                                                    </p>
                                                    <p><a
                                                            href="https://chapchap.io/wp-content/uploads/2022/01/Politique-de-confidentialite%CC%81-Chap-Chap-S.A.S.docx-1.pdf"><span
                                                                style="letter-spacing: 0px;">Confidentialité</span></a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="elementor-column elementor-col-33 elementor-top-column elementor-element elementor-element-4eb6ece7 elementor-hidden-mobile"
                                data-id="4eb6ece7" data-element_type="column">
                                <div class="elementor-column-wrap elementor-element-populated">
                                    <div class="elementor-widget-wrap">
                                        <div class="elementor-element elementor-element-678a402a elementor-shape-rounded elementor-grid-0 e-grid-align-center elementor-widget elementor-widget-social-icons"
                                            data-id="678a402a" data-element_type="widget"
                                            data-widget_type="social-icons.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-social-icons-wrapper elementor-grid"> <span
                                                        class="elementor-grid-item"> <a
                                                            class="elementor-icon elementor-social-icon elementor-social-icon-instagram elementor-repeater-item-be93274"
                                                            href="http://www.instagram.com/chapchap.app"
                                                            target="_blank"> <span
                                                                class="elementor-screen-only">Instagram</span> <i
                                                                class="fab fa-instagram"></i> </a> </span> <span
                                                        class="elementor-grid-item"> <a
                                                            class="elementor-icon elementor-social-icon elementor-social-icon-tiktok elementor-repeater-item-c209ecd"
                                                            href="http://www.tiktok.com/chapchap.app" target="_blank">
                                                            <span class="elementor-screen-only">Tiktok</span> <i
                                                                class="fab fa-tiktok"></i> </a> </span> <span
                                                        class="elementor-grid-item"> <a
                                                            class="elementor-icon elementor-social-icon elementor-social-icon-pinterest-p elementor-repeater-item-9ca79ed"
                                                            href="http://www.pinterest.com/chapchap.app"
                                                            target="_blank"> <span
                                                                class="elementor-screen-only">Pinterest-p</span> <i
                                                                class="fab fa-pinterest-p"></i> </a> </span> <span
                                                        class="elementor-grid-item"> <a
                                                            class="elementor-icon elementor-social-icon elementor-social-icon-linkedin elementor-repeater-item-af0baa3"
                                                            href="https://www.linkedin.com/company/chap-chap"
                                                            target="_blank"> <span
                                                                class="elementor-screen-only">Linkedin</span> <i
                                                                class="fab fa-linkedin"></i> </a> </span> </div>
                                            </div>
                                        </div>
                                        <div class="elementor-element elementor-element-2a044ec8 elementor-widget elementor-widget-text-editor"
                                            data-id="2a044ec8" data-element_type="widget"
                                            data-widget_type="text-editor.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-text-editor elementor-clearfix">
                                                    <p><a href="https://chapchap.io/nous-contacter/">Nous contacter</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="elementor-column elementor-col-33 elementor-top-column elementor-element elementor-element-8322e7b"
                                data-id="8322e7b" data-element_type="column">
                                <div class="elementor-column-wrap elementor-element-populated">
                                    <div class="elementor-widget-wrap">
                                        <div class="elementor-element elementor-element-20f7183c elementor-widget elementor-widget-text-editor"
                                            data-id="20f7183c" data-element_type="widget"
                                            data-widget_type="text-editor.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-text-editor elementor-clearfix">
                                                    <p><strong>À propos</strong></p>
                                                    <p><a href="http://chapchap.io">Accueil</a></p>
                                                    <p><a href="https://chapchap.io/concept/">Notre concept </a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>''';
}
*/
}
