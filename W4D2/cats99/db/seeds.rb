# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all

cat1 = Cat.new(birth_date: '2015-01-20',color: 'brown',name: 'mittens',sex: 'M',description: 'the cat')
cat2 = Cat.new(birth_date: '2015-01-20',color: 'brown',name: 'mittens',sex: 'M',description: 'the cat')
cat3 = Cat.new(birth_date: '2015-01-20',color: 'brown',name: 'mittens',sex: 'M',description: 'the cat')
cat4 = Cat.new(birth_date: '2015-01-20',color: 'brown',name: 'mittens',sex: 'M',description: 'the cat')
cat5 = Cat.new(birth_date: '2015-01-20',color: 'brown',name: 'mittens',sex: 'M',description: 'the cat')
cat6 = Cat.new(birth_date: '2015-01-20',color: 'brown',name: 'mittens',sex: 'M',description: 'the cat')
cat7 = Cat.new(birth_date: '2015-01-20',color: 'black',name: 'mittens',sex: 'M',description: 'the cat')
cat8 = Cat.new(birth_date: '2015-06-20',color: 'brown',name: 'mittens',sex: 'M',description: 'the cat')
cat9 = Cat.new(birth_date: '2015-03-20',color: 'brown',name: 'mittens',sex: 'M',description: 'the cat')
cat10 = Cat.new(birth_date: '2016-01-20',color: 'brown',name: 'mittens',sex: 'M',description: 'the cat')


cat1.save
cat2.save
cat3.save
cat4.save
cat5.save
cat6.save
cat7.save
cat8.save
cat9.save
cat10.save

rental1 = CatRentalRequest.new(cat_id: cat1.id, status: 'good condition', start_date: '2015-01-20', end_date: '2015-01-25')
rental1.save
rental2 = CatRentalRequest.new(cat_id: cat2.id, status: 'good condition', start_date: '2015-01-20', end_date: '2015-01-25')
rental2.save

rental3 = CatRentalRequest.new(cat_id: cat3.id, status: 'good condition', start_date: '2015-01-20', end_date: '2015-01-25')
rental3.save

rental4 = CatRentalRequest.new(cat_id: cat4.id, status: 'good condition', start_date: '2015-01-20', end_date: '2015-01-25')
rental4.save




# class CreateCatRentalRequests < ActiveRecord::Migration[5.1]
#   def change
#     create_table :cat_rental_requests do |t|
#       t.integer :cat_id, null: false
#       t.date :start_date, null: false
#       t.date :end_date, null: false
#       t.string :status, null: false
#
#       t.timestamps
#     end
#     add_index :cat_rental_requests, :cat_id
#   end
# end
