# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([
                       { email: 'teacher@mail.ru', password: '123' },
                       { email: 'student@mail.ru', password: 'qwe' }
                     ])

categories = Category.create!([
                                { title: 'Frontend' },
                                { title: 'Backend' },
                                { title: 'Mobile' }
                              ])

tests = Test.create!([
                       { title: 'Ruby', level: 2, category_id: categories[1].id, author_id: users[0].id },
                       { title: 'HTML', level: 1, category_id: categories[0].id, author_id: users[1].id },
                       { title: 'Python', level: 3, category_id: categories[1].id, author_id: users[0].id },
                       { title: 'Swift', level: 3, category_id: categories[2].id, author_id: users[1].id }
                     ])

questions = Question.create!([
                               { body: 'Who is the creator of Ruby?', test_id: tests[0].id },
                               { body: 'How is HTML decoded?', test_id: tests[1].id },
                               { body: 'The ... framework is written in Python', test_id: tests[2].id },
                               { body: 'Programming language for mobile development on Android',
                                 test_id: tests[3].id }
                             ])

answers = Answer.create!([
                           { body: 'Matz', correct: true, question_id: questions[0].id },
                           { body: 'Guido van Rossum', correct: false, question_id: questions[0].id },
                           { body: 'HyperText Markup Language', correct: true, question_id: questions[1].id },
                           { body: 'Hype Turbo Multi Language', correct: false, question_id: questions[1].id },
                           { body: 'Rails', correct: true, question_id: questions[2].id },
                           { body: 'Django', correct: false, question_id: questions[2].id },
                           { body: 'Kotlin', correct: true, question_id: questions[3].id },
                           { body: 'Swift', correct: false, question_id: questions[3].id }
                         ])

passed_tests = PassedTest.create!([
                                    { user_id: users[0].id, test_id: tests[0].id },
                                    { user_id: users[0].id, test_id: tests[1].id },
                                    { user_id: users[0].id, test_id: tests[2].id },
                                    { user_id: users[1].id, test_id: tests[0].id },
                                    { user_id: users[1].id, test_id: tests[1].id },
                                    { user_id: users[0].id, test_id: tests[3].id },
                                    { user_id: users[0].id, test_id: tests[4].id },
                                    { user_id: users[1].id, test_id: tests[3].id }
                                  ])
