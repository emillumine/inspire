# A PROPOS

Inspire est un projet personnel ayant pour principale vocation la mise en pratique et l'amélioration de mes connaissances en ruby et rails.
Le projet n'est pas hébergé en ligne pour le moment et est toujours en développement.

## L'IDEE

Inspire permet de publier et archiver des recommandations (au sens de critiques positives) de lectures/films/musiques/... pour donner de l'inspiration aux autres & s'inspirer des recommandations des autres.

## CATEGORIES DE RECOMMANDATIONS

- Ce que je lis (livres, articles, journaux, blogs...) // ReadingRecommendation :heavy_check_mark:
- Ce que je regarde (vidéos, films, séries, chaînes...) // WatchingRecommendation :heavy_check_mark:
- Ce que j'écoute (musiques : chanson/album/artiste, podcasts, radios, audiobooks) // ListeningRecommendation
- Ce que je cuisine (recettes) // CookingRecommendation
- Où je vais (bonnes adresses de : restos, cafés, lieux touristiques...) // GoingRecommendation
- (?) Ce que j'utilise (app, programmes ?)
- (?) Ce que je fais (DIY, activités)
- (?) A quoi je joue (jeux vidéos, jeux de société)
- Inclassables // OtherRecommendation

Chaque catégorie est une classe héritant de la classe mère Recommendation > [Single Table Inheritance](http://guides.rubyonrails.org/association_basics.html)

## ACTIONS

Basique :
- voir les recommandations (affichage par catégorie = entrée principale sur le site) :heavy_check_mark:
- s'inscrire / se connecter (pour l'instant un seul utilisateur, moi ?)(gem Devise) :heavy_check_mark:
- écrire, enregistrer comme brouillon et poster une nouvelle recommandation :heavy_check_mark:
- supprimer une recommandation
- (?) éditer une recommandation (est-ce que je veux vraiment qu'on puisse éditer une fois publiée ?)

Avancé :
- "approuver" une recommandation d'un tiers (thumbs-up) (= système de like)
- voir combien de fois une recommandation a été approuvée et par qui
- voir toutes les recommandations d'un utilisateur (affichage par user)
- s'abonner au flux d'un utilisateur
- voir son flux d'abonnements (où n'apparaissent que les recommandations postées par les users auxquels on est abonné)(+ activité ? du style "machin a approuvé telle recommandation")
- définir/modifier un profil utilisateur (avatar, mini-bio)
- afficher un profil utilisateur (avec la liste de ses recommandations et de ses thumbs-ups)

Encore plus avancé :
- s'abonner uniquement à certaines catégories d'un utilisateur (par exemple si je veux voir les recettes de cet utilisateur, mais pas ses lectures, j'ai la possibilité de m'abonner uniquement à sa catégorie cuisine)
- être notifié par mail des nouvelles recommandations auxquelles on est abonné
- marquer une recommmandation comme favori (ou à faire plus tard ?)
- voir la liste des recommandations favories/à faire plus tard (wish list)
- (?) rechercher une recommandation par mot-clé
- (?) pinger un user pour lui faire (ou lui faire suivre) une reco particulière (à mieux définir)

## COMPOSANTS D'UNE RECOMMANDATION

- type (reading, watching...) :heavy_check_mark:
- titre // title :heavy_check_mark:
- contenu // content :heavy_check_mark: > WYSIWYG ? regarder du côté de la gem CKEditor :clock1:
- auteur // user_id :heavy_check_mark:
- date publication // published_at :heavy_check_mark:
- état publié // published :heavy_check_mark:
- nb de thumbs-ups et liste
- (?) Adresse/url (où trouver l'objet de la recommandation. Physique ou url)
- (?) Public cible (à qui je recommande)
- (?) Sous catégorie / tags
- (?) Durée
- (?) Langue
