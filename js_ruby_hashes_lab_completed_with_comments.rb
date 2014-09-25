require 'date'

# Given this hash as an example of person's employment info.
alice_jones = {
  name: 'Alice Jones',
  dob: Date.new(1977,6, 23),
  address: {
    street: '502 Main St.',
    city: 'Newton',
    state: 'MA',
    zip_code: '01345'
  },
  employment_history: [
                       {
                         name: "Whoatemycereal.com",
                         title: "Rails Developer",
                         contact: '978 867-5309',
                         manager: "Gonzo Smith",
                         start_date:  Date.new(2013,12,20),
                         end_date:  Date.new(2014,6, 25),
                         yearly_salary: 75_000
                       },
                       {
                         name: "Dunkin Donuts",
                         title: "Donut Maker",
                         contact: '978 453-5680',
                         manager: "Joe Conway",
                         start_date:  Date.new(2011,8,13),
                         end_date:  Date.new(2013,1, 3),
                         yearly_salary: 16_000
                       },
                       {
                         name: "Google",
                         title: "CEO",
                         contact: '413 958-8909',
                         manager: "God Himself",
                         start_date:  Date.new(2008,3,1),
                         end_date:  Date.new(2011,1, 9),
                         yearly_salary: 5_450_000
                       }

                      ]
}

# Show the first company Alice worked for.
# NOTE: The companies in employment_history are ordered by
# by most to least recent jobs.


puts "The first company Alice worked for."
puts alice_jones[:employment_history].first[:name]
# First, we are putting the statement, "The first company Alice worked for."  Afterwards, we are calling the alice_jones hash, inside the brackets is the symbol :employment_history and we are calling the first method on that with the index of :name which will return the first company name she worked for.


# Show the last company Alice worked for.
puts "The last company Alice worked for."
puts alice_jones[:employment_history].last[:name]
# We are calling alice_jones, and then we are calling the symbol :employment_history, then attaching the .last method along with the symbol :name to get the last company Alice worked for.


# Show the most recent job's manager.
puts "Most recent manager's name/number"
puts alice_jones[:employment_history].first[:manager]
# We are calling alice_jones, inside of alice jones we are asking for the :employment_history symbol, using .first to choose the first one, then the symbol :manager

# Change this managers name and show it.
alice_jones[:employment_history].first[:manager] = "Bob Barker"
puts "Most recent manager's new name is....."
puts alice_jones[:employment_history].first[:manager]
# first we are calling alice_jones, inside we are calling the first :employment_history symbol using .first and then calling the :manager symbol which has been changed above by calling it and then assigning it a new name.

#  Show the Alice's street address
puts "Alice's street address"
puts alice_jones[:address][:street]
# Here we are putting by calling alice_jones, inside of alice_jones we are calling the :address symbol then calling the :street symbol


# Change the name of the most recent company alice worked for. And
# change her position to "Javascript Developer"
alice_jones[:employment_history].first[:title] = "Javascript Developer"
puts "New position/title"
puts alice_jones[:employment_history].first[:title]
# calling alice_jones and inside that we are calling the :employment history symbol.....the first one using the .first method and then calling the title using the title symbol and setting that to the new value.....we then put the new information.....we call alice_jones.....we then call the symbol :employment_history...the first one using the .first method, and then calling the title using the :title method.

# Git instructions:



