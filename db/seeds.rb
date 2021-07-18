# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([
                        { email: 'student@mail.ru', password: 'qwerty' },
                        {first_name: 'Alex', last_name: 'Green', email: 'teacher@mail.ru', password: '123456', type: 'Admin' }
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
                               { body: 'The ... framework is written in Ruby', test: tests[0] },
                               { body: 'How is HTML decoded?', test: tests[1] },
                               { body: 'The ... framework is written in Python', test: tests[2] },
                               { body: 'Programming language for mobile development on Android', test: tests[3] }
                             ])

Answer.create!([
                 { body: 'Matz', correct: true, question: questions[0] },
                 { body: 'Guido van Rossum', correct: false, question: questions[0] },
                 { body: 'Rails', correct: true, question: questions[1] },
                 { body: 'Django', correct: false, question: questions[1] },
                 { body: 'HyperText Markup Language', correct: true, question: questions[2] },
                 { body: 'Hype Turbo Multi Language', correct: false, question: questions[2] },
                 { body: 'Rails', correct: false, question: questions[3] },
                 { body: 'Django', correct: true, question: questions[3] },
                 { body: 'Kotlin', correct: false, question: questions[4] },
                 { body: 'Swift', correct: true, question: questions[4] }
               ])

Badge.create!([
  { title: 'First try', image_url: 'https://yandex.ru/images/search?text=%D0%9E%D0%B3%D0%BE%D0%BD%D1%8C%20%D0%98%20%D0%92%D0%BE%D0%B4%D0%B0&nl=1&source=morda', rule: 0,
    description: 'Награда за прохождение теста с первой попытки' },
  { title: 'Backend guru', image_url: 'https://yandex.ru/images/search?text=%D0%9E%D0%B3%D0%BE%D0%BD%D1%8C%20%D0%98%20%D0%92%D0%BE%D0%B4%D0%B0&nl=1&source=morda', rule: 1, rule_value: '2',
    description: 'Награда за прохождение всех тестов категории Backend' },
  { title: 'So easy', image_url: 'https://yandex.ru/images/search?text=%D0%9E%D0%B3%D0%BE%D0%BD%D1%8C%20%D0%98%20%D0%92%D0%BE%D0%B4%D0%B0&nl=1&source=morda', rule: 2, rule_value: '0',
    description: 'Награда за прохождение всех тестов уровня easy' }
     ])
