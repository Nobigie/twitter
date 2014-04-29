== README

Questions SEB:

Comment render la bonne vue pour générer les erreurs dans le create micropost ?

J'en suis au 10.3.3 - les erreurs de microposts ne s'affichent pas


Tuto twitter http://ruby.railstutorial.org/chapters/static-pages#top

Important commands
  rails new myapp --database=postgresql
  bundle exec rake test:prepare -> rake db:migrate RAILS_ENV=test
  User.create(name: "Victor Debost", email: "vdebost@gmail.com", password: "22121985", password_confirmation: "22121985")



Question a Seb ->
Javascript bootstrap pourquoi ça marche pas ? Bootstrap dépends de JQuery

Pourquoi tester le format de l'email de User Valide quand on a testé si il etait invalide ? Test inutile. Devise gère toute l'autentification pour les users.

Users (existe pas) vs. User (classe) vs. :users (Symbole qui n'a rien avoir avec User) vs. @user  (variable d'instance)
Helper vs. controller. Les helpers sont ils accessibles depuis tous les controllers et toutes les views?



Majuscule avec CamelCase => classe.
class User
end

class Voiture
end

minuscule => variable en snake case
user    = User.new
voiture = Voiture.new


class FrenchPerson
end

sebastien_saunier = FrenchPerson.new


# Variable d'instance. Elle est dispo dans un controlleur
class User
  def initialize(name)
    @name = name
  end

  def say_hello
    # "Hello, my name is " + @name.upcase #PasBien
    "Hello, my name is #{@name.upcase}" #Bien
  end
end

user = User.new("Sebastien")
user.name  # VA LEVER UNE EXCEPTION
puts user.say_hello

0  # Variable

titi = "toto"

1  # Fixnum
"test"  # String
:test   # Symbol


# Dictionnaire clé => valeur  (type: Hash)
victor = {
  "age" => 29,
  "prenom" => "Victor",
  "nom" => "Debost"
}
#Equivalent à
victor = {
  :age => 29,
  :prenom => "Victor",
  :nom => "Debost"
}
#Equivalent à (best en ruby)
victor = {
  age: 29,
  prenom: "Victor",
  nom: "Debost"
}


puts victor[:age]
puts victor[:prenom]

class Person
  attr_reader :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def say_hello
    "Hello, my name is #{first_name} #{last_name}"
  end
end


person = Person.new("Victor", "Debost", 29)
puts person.age
puts person.say_hello






REST, => Resource

Exemple de resource: User

CREATE un user
READ   un user
UPDATE un user
DELETE un user

=> CRUD

class UsersController
  # REST => 7 methodes, resource :user dans le routes.rb

  # GET /users
  def index
  end

  # GET /users/:id
  def show
  end

  # GET /users/new, affiche le formulaire de creation d'une ressource
  def new
  end

  # POST /users, recoit la requete de soumission du formulaire de /users/new
  def create
  end

  # GET /users/:id/edit, affihe le formulaire d'edition d'une ressource existante
  def edit
  end

  # PUT/PATCH /users/:id, recoit la requete de modification de /users/:id/edit
  def udpate
  end

  # DELETE /users/:id, supprime le suer
  def destroy
  end

end


Verbes HTTP


Quelle différence y a t il entre user.tweets.create(arg) et user.tweets.build(arg) ? C'est quoi user.tweets.create!(arg)
- tweet = user.tweets.build(arg) ça crée un tweet en memoire, et ca lui set user_id correctement. Il n'est pas sauvegardé en base, il faut appeler tweet.save ensuite.
- Si tu appelles tweet.save!, ça va lever une exception si il y a une erreur de validation sur le tweet. tweet.save va fail silently si il y a une erreur (c'est ça la différence entre les méthodes save et save!). Tu peux regarder si un tweet est valide en appelant tweet.valid? qui renvoie un booléen
- user.tweets.create(arg), ça crée un tweet en mémoire et aussitot ca le sauvegarde en base (equivalent build + save)
- user.tweets.create!(arg), c'est l'equivalent de build + save!