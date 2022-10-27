# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create([
    { name: 'Abraha', photo: 'https://unsplash.com/photos/zNN6ubHmruI', bio: 'Developer from Ethiopia.', posts_counter: 1},
    { name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 2 },
    { name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Artist from Poland.', posts_counter: 3 }
  ])

Post.create([
    { user_id: 1, title: 'Hello1', text: 'This is my first post', comments_counter: 1, likes_counter: 1 },
    { user_id: 2, title: 'Holla1', text: 'This is my second post', comments_counter: 2, likes_counter: 2 },
    { user_id: 3, title: 'Bonjur1', text: 'This is my third post', comments_counter: 3, likes_counter: 3 },
    { user_id: 1, title: 'Hello2', text: 'This is my fourth post', comments_counter: 4, likes_counter: 4 },
    { user_id: 2, title: 'Holla2', text: 'This is my fifth post', comments_counter: 5, likes_counter: 5 },
    { user_id: 3, title: 'Bonjur2', text: 'This is my sixth post', comments_counter: 6, likes_counter: 6 }
  ])

Comment.create([
       { post_id: 1, user_id: 1, text: 'comment 1' },
       { post_id: 1, user_id: 2, text: 'comment 2' },
       { post_id: 1, user_id: 3, text: 'comment 3' },
       { post_id: 1, user_id: 1, text: 'comment 4' },
       { post_id: 1, user_id: 2, text: 'comment 5' },
       { post_id: 1, user_id: 3, text: 'comment 6' },
       { post_id: 1, user_id: 1, text: 'comment 7' },
       { post_id: 1, user_id: 2, text: 'comment 8' },
       { post_id: 1, user_id: 3, text: 'comment 9' }
     ])