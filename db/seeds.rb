# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
first_author = User.create(email: 'author@mail.com', password: 'password', name: 'Author Authorsson')
second_author = User.create(email: 'second_author@mail.com', password: 'password', name: 'Sven Svensson')
first_user = User.create(email: 'user@mail.com', password: 'password', name: 'User Usersson')
second_user = User.create(email: 'another_user@mail.com', password: 'password', name: 'Second-User Secondsson')

Article.create([{ title: 'This is an article', lead: 'With a very interesting lead', body: 'And the most interesting content you ever read!', author_id: first_author.id },
                { title: 'Serializers make your life easier', lead: 'There is a new thing coming your way', body: 'Active model serializers are very cool and way better than jbuilder', author_id: first_author.id },
                { title: 'Rollercoasters are fun', lead: 'You do not think about it that often', body: 'But they are really cool and very fun to ride', author_id: second_author.id },
                { title: 'Breaking news!', lead: 'Ice cream cures everything!', body: 'The new cure for everything is ice cream', author_id: first_author.id }])

Comment.create([{ body: 'WOW! I had no idea!!', user_id: first_user.id, article_id: 4 },
               { body: 'This article suckss!!', user_id: second_user.id, article_id: 1 },
               { body: 'This does not make sense to me at all', user_id: second_author.id, article_id: 4 },
               { body: 'I really agree! They are so much fun', user_id: second_user.id, article_id: 3 }])