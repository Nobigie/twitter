== README

Tuto twitter http://ruby.railstutorial.org/chapters/static-pages#top

Important commands

bundle exec rake test:prepare -> rake db:migrate RAILS_ENV=test
User.create(name: "Victor Debost", email: "vdebost@gmail.com", password: "22121985", password_confirmation: "22121985")



Question a Seb ->
Javascript bootstrap pourquoi ça marche pas ?
Password length (allow_nil: true ????)
Pourquoi tester le format de l'email de User Valide quand on a testé si il etait invalide ?
Expliquer les tests sur le mot de passe de User ? (à partir de when password doesn't match confirmation)
Quelle REGEX pour les emails sans .. ? dans les tests et dans le modèle User ?
C'est quoi REST Achitecture ? vs. REST api ?
Users vs. User vs. :users vs. @user
Helper vs. controller. Les helpers sont ils accessibles depuis tous les controllers et toutes les views?
