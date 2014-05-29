# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jessica = Ticket.create(sender_name: 'Jessica',
              sender_email: 'jessy@mail.com',
              subject: 'I have a trouble with site',
              body: 'Hello, I can register at site.com and there is some error, please help',
              department_id: 1,
              code: 'ABC123DEF456',
              status_id: 1)
jessica.responses.create(body: 'Sorry site is working I just forgot to turn on wi-fi :)')

robert = Ticket.create(sender_name: 'Robert',
              sender_email: 'robert@mail.com',
              subject: 'I am looking for hosting to my web site',
              body: 'Do you know a good hosting for web-site?',
              department_id: 1,
              code: 'XWZ789DEF456',
              status_id: 1)
jessica.responses.create(body: '..it should work with ruby and mongodb')
