# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([
                       {first_name: 'Alex', last_name: 'Green', email: 'teacher@mail.ru', password: '123456', type: 'Admin' },
                       { email: 'student@mail.ru', password: 'qwerty' }
                     ])

categories = Category.create!([
                                { title: 'Frontend' },
                                { title: 'Backend' },
                                { title: 'Mobile' }
                              ])

tests = Test.create!([
                       { title: 'Ruby', level: 2, category: categories[1], author: users[0] },
                       { title: 'HTML', level: 1, category: categories[0], author: users[1] },
                       { title: 'Python', level: 3, category: categories[1], author: users[0] },
                       { title: 'Swift', level: 3, category: categories[2], author: users[1] }
                     ])

questions = Question.create!([
                               { body: 'Who is the creator of Ruby?', test: tests[0] },
                               { body: 'How is HTML decoded?', test: tests[1] },
                               { body: 'The ... framework is written in Python', test: tests[2] },
                               { body: 'Programming language for mobile development on Android', test: tests[3] }
                             ])

Answer.create!([
                 { body: 'Matz', correct: true, question: questions[0] },
                 { body: 'Guido van Rossum', correct: false, question: questions[0] },
                 { body: 'HyperText Markup Language', correct: true, question: questions[1] },
                 { body: 'Hype Turbo Multi Language', correct: false, question: questions[1] },
                 { body: 'Rails', correct: true, question: questions[2] },
                 { body: 'Django', correct: false, question: questions[2] },
                 { body: 'Kotlin', correct: true, question: questions[3] },
                 { body: 'Swift', correct: false, question: questions[3] }
               ])

PassedTest.create!([
                     { user: users[0], test: tests[0] },
                     { user: users[0], test: tests[1] },
                     { user: users[0], test: tests[2] },
                     { user: users[1], test: tests[0] },
                     { user: users[1], test: tests[1] },
                     { user: users[0], test: tests[3] },
                     { user: users[1], test: tests[3] }
                   ])
