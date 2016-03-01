# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Author.create!(first_name: 'Agatha', last_name: 'Christie')
Author.create!(first_name: 'Rabindranath', last_name: 'Tagore')
Author.create!(first_name: 'Nazrul', last_name: 'Islam')
Author.create!(first_name: 'Shamsul', last_name: 'Haque')
Author.create!(first_name: 'Jibonanondo', last_name: 'Dash')
Author.create!(first_name: 'Mujtoba', last_name: 'Ali')

Publisher.create!([
                      {name: 'Anondo'},
                      {name: 'Ononna'},
                      {name: 'Shaikat'},
                      {name: 'Akash'},
                      {name: 'Projapoti'}
                  ])

Book.create!(title: 'Gnuplot in Action', isbn: '978-1-933-98839-9', page_count: 360, price: 66.37,
             description: 'A book on awesome opensource plotting sofeware', published_at: '2010-11-04',
             publisher_id:4,
             book_cover: File.open(File.join(Rails.root, 'app/assets/images/gnupknot.jpg')))