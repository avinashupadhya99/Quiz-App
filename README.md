# README

This project was developed using Rails 5.1.7 and ruby 2.3.3p222 (2016-11-21 revision 56859) [i386-mingw32].

- Requires nodeJS for javascript execution on Windows.
- MySQL as the database running on localhost
- Name of the database should be quiz_app_developement for developement.

- Create database using db:schema:load or rails db:migrate(slower)

# Database Schema

## Categories
##### name, string

## Quizzes
##### name, string
##### timestamps

## Questions
##### question, string
##### score, integer
##### quiz_id => quiz.id

## Options
##### opt name, string
##### is_answer, boolean
##### question_id => question.id

## Quiz Categories
##### quiz_id => quiz.id
##### category_id => category.id

## User
##### username, string
##### email, email
##### password, password

## Submission
##### score, integer
##### timestamps
##### quiz_id => quiz.id
##### user_id => user.id

## Quest Submission
##### option, string
##### question_id, integer
##### submission_id => submission.id
