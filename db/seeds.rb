# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Flight.delete_all
Airport.delete_all

airport_codes = %w[YYC YUL YYZ YVR YHZ YWG YEG YYT]

airport_codes.each do |code|
  Airport.create(code: code)
end

15.times do
  da_id = Airport.order(Arel.sql('RANDOM()')).first.id
  aa_id = Airport.order(Arel.sql('RANDOM()')).where('id != ?', da_id).first.id
  d_time = rand(1.year).seconds.from_now
  duration = rand(30..240)
  Flight.create(departure_airport_id: da_id, arrival_airport_id: aa_id, departure_time: d_time, flight_duration: duration)
end
