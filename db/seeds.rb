VERB = %w(Water Walk Finish Download Feed Disinfect Deliver Wash)
NOUN = %w(kids dog cat parents homework laundry movies)

Task.destroy_all

10.times do
  name = [VERB.sample, NOUN.sample].join(' ')
  puts "Adding '#{name}'"
  Task.create!(
    name: name,
    completed: rand(3) % 3 == 0
  )
end
