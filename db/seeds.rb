nba_category = Category.create!(name: 'nba')

warriors = Team.create!(name: 'Golden State Warriors', category: nba_category)
sixers = Team.create!(name: 'Philadelphia 76ers', category: nba_category)
clippers = Team.create!(name: 'Los Angeles Clippers', category: nba_category)
lakers = Team.create!(name: 'Los Angeles Lakers', category: nba_category)

Player.create!(name: 'Stephen Curry', position: 'Point Guard', date_of_birth: '1988-03-14', team: warriors, salary: 48070014, image: 'https://d3m01dthjass88.cloudfront.net/uploads/Stepehen_Curry_11ae724029.png')
Player.create!(name: 'James Harden', position: 'Shooting Guard', date_of_birth: '1989-08-26', team: sixers, salary: 33000000, image: 'https://d3m01dthjass88.cloudfront.net/uploads/Lebron_James_2f3b61f45a.webp')
Player.create!(name: 'John Wall', position: 'Point Guard', date_of_birth: '1990-09-06', team: clippers, salary: 6479000, image: 'https://d3m01dthjass88.cloudfront.net/uploads/Lebron_James_2f3b61f45a.webp')
Player.create!(name: 'LeBron James', position: 'Small Forward', date_of_birth: '1984-12-30', team: lakers, salary: 41000000, image: 'https://d3m01dthjass88.cloudfront.net/uploads/Lebron_James_2f3b61f45a.webp')



