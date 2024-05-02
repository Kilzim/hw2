# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Movie.destroy_all
Cast.destroy_all
Studio.destroy_all
Actor.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

# Commands executed in terminal to create models:
# rails generate model Movie 
# rails generate model Studio
# rails generate model Actor
# rails generate model Cast 

# Modify the models under db/migrate:

# Movies
# class CreateMovies < ActiveRecord::Migration[7.1]
#   def change
#     create_table :movies do |t|
#       t.string "title"
#       t.integer "year"
#       t.string "mpaa_rating"
#       t.string "studio"
#       t.timestamps
#     end
#   end
# end

# Studios
# class CreateStudios < ActiveRecord::Migration[7.1]
#   def change
#     create_table :studios do |t|
#       t.string "name"
#       t.timestamps
#     end
#   end
# end

# Actors
# class CreateActors < ActiveRecord::Migration[7.1]
#   def change
#     create_table :actors do |t|
#       t.string "name"
#       t.timestamps
#     end
#   end
# end

# Casts
# class CreateCasts < ActiveRecord::Migration[7.1]
#   def change
#     create_table :casts do |t|
#       t.string "movie"
#       t.string "actor"
#       t.string "role"
#       t.timestamps
#     end
#   end
# end

# Migrate the databases, command executed in Terminal:

# rails db:migrate

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# Add the studio to the database

new_studio = Studio.new
new_studio["name"] = "Warner Bros."
new_studio.save

# Add the movies to the database
new_movie = Movie.new
new_movie["title"] = "Batman Begins"
new_movie["year"] = "2005"
new_movie["mpaa_rating"] = "PG-13"
new_movie["studio"] = new_studio["name"]
new_movie.save

new_movie2 = Movie.new
new_movie2["title"] = "The Dark Knight"
new_movie2["year"] = "2008"
new_movie2["mpaa_rating"] = "PG-13"
new_movie2["studio"] = new_studio["name"]
new_movie2.save

new_movie3 = Movie.new
new_movie3["title"] = "The Dark Knight Rises"
new_movie3["year"] = "2012"
new_movie3["mpaa_rating"] = "PG-13"
new_movie3["studio"] = new_studio["name"]
new_movie3.save

# Add the actors to the database

new_actor = Actor.new
new_actor["name"] = "Christian Bale"
new_actor.save

new_actor2 = Actor.new
new_actor2["name"] = "Michael Caine"
new_actor2.save

new_actor3 = Actor.new
new_actor3["name"] = "Liam Neeson"
new_actor3.save

new_actor4 = Actor.new
new_actor4["name"] = "Katie Holmes"
new_actor4.save

new_actor5 = Actor.new
new_actor5["name"] = "Gary Oldman"
new_actor5.save

new_actor6 = Actor.new
new_actor6["name"] = "Heath Ledger"
new_actor6.save

new_actor7 = Actor.new
new_actor7["name"] = "Aaron Eckhart"
new_actor7.save

new_actor8 = Actor.new
new_actor8["name"] = "Maggie Gyllenhaal"
new_actor8.save

new_actor9 = Actor.new
new_actor9["name"] = "Tom Hardy"
new_actor9.save

new_actor10 = Actor.new
new_actor10["name"] = "Joseph Gordon Levit"
new_actor10.save

new_actor11 = Actor.new
new_actor11["name"] = "Anne Hathaway"
new_actor11.save

# Add the cast to the database

new_cast = Cast.new
new_cast["movie"] = new_movie["title"]
new_cast["actor"] = new_actor["name"]
new_cast["role"] = "Bruce Wayne"
new_cast.save

new_cast2 = Cast.new
new_cast2["movie"] = new_movie["title"]
new_cast2["actor"] = new_actor2["name"]
new_cast2["role"] = "Alfred"
new_cast2.save

new_cast3 = Cast.new
new_cast3["movie"] = new_movie["title"]
new_cast3["actor"] = new_actor3["name"]
new_cast3["role"] = "Ra's Al Ghul"
new_cast3.save

new_cast4 = Cast.new
new_cast4["movie"] = new_movie["title"]
new_cast4["actor"] = new_actor4["name"]
new_cast4["role"] = "Rachel Dawes"
new_cast4.save

new_cast5 = Cast.new
new_cast5["movie"] = new_movie["title"]
new_cast5["actor"] = new_actor5["name"]
new_cast5["role"] = "Comissioner Gordon"
new_cast5.save

new_cast6 = Cast.new
new_cast6["movie"] = new_movie2["title"]
new_cast6["actor"] = new_actor["name"]
new_cast6["role"] = "Bruce Wayne"
new_cast6.save

new_cast7 = Cast.new
new_cast7["movie"] = new_movie2["title"]
new_cast7["actor"] = new_actor2["name"]
new_cast7["role"] = "Alfred"
new_cast7.save

new_cast8 = Cast.new
new_cast8["movie"] = new_movie2["title"]
new_cast8["actor"] = new_actor6["name"]
new_cast8["role"] = "Joker"
new_cast8.save

new_cast9 = Cast.new
new_cast9["movie"] = new_movie2["title"]
new_cast9["actor"] = new_actor7["name"]
new_cast9["role"] = "Harvey Dent"
new_cast9.save

new_cast10 = Cast.new
new_cast10["movie"] = new_movie2["title"]
new_cast10["actor"] = new_actor8["name"]
new_cast10["role"] = "Rachel Dawes"
new_cast10.save

new_cast11 = Cast.new
new_cast11["movie"] = new_movie3["title"]
new_cast11["actor"] = new_actor["name"]
new_cast11["role"] = "Bruce Wayne"
new_cast11.save

new_cast12 = Cast.new
new_cast12["movie"] = new_movie3["title"]
new_cast12["actor"] = new_actor5["name"]
new_cast12["role"] = "Commissioner Gordon"
new_cast12.save

new_cast13 = Cast.new
new_cast13["movie"] = new_movie3["title"]
new_cast13["actor"] = new_actor9["name"]
new_cast13["role"] = "Bane"
new_cast13.save

new_cast14 = Cast.new
new_cast14["movie"] = new_movie3["title"]
new_cast14["actor"] = new_actor10["name"]
new_cast14["role"] = "John Blake"
new_cast14.save

new_cast15 = Cast.new
new_cast15["movie"] = new_movie3["title"]
new_cast15["actor"] = new_actor11["name"]
new_cast15["role"] = "Selina Kyle"
new_cast15.save

# Prints a header for the movies output
puts ""
puts "============================================================================"
puts ""
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

movies = Movie.all
for movie in movies
  puts "#{movie.title.ljust(25)} #{movie.year} #{movie.mpaa_rating.ljust(10)} #{movie.studio}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

casts = Cast.all
for cast in casts
  puts "#{cast.movie.ljust(25)} #{cast.actor.ljust(25)} #{cast.role}"
end

# I googled, how to get a better formating of the output. That is how I came across the .ljust

puts ""
puts "============================================================================"
puts ""