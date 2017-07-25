puts "Statuses...\n"
Status.create(id: 'waiting_for_staff_response', name: 'Waiting for Staff Response', kind: :opened)
Status.create(id: 'waiting_for_customer',       name: 'Waiting for Customer',       kind: :opened)
Status.create(id: 'on_hold',                    name: 'On Hold',                    kind: :on_hold)
Status.create(id: 'cancelled',                  name: 'Cancelled',                  kind: :closed)
Status.create(id: 'completed',                  name: 'Completed',                  kind: :closed)

puts "Managers...\n"
[
  {
    username: 'Vasyan',
    password: 'test'
  },
  {
    username: 'Andriy',
    password: 'test'
  }
].each do |manager|
  Manager.create(username: manager[:username], password: manager[:password])
  puts "\tusername: #{manager[:username]}, password: #{manager[:password]}\n"
end
