require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
new_startup = Startup.new("test_name", "test_founder", "test_domain")
new_startup2 = Startup.new("test_name2", "test_founder2", "test_domain")
rich_vc = VentureCapitalist.new("richy", 2000000000)
poor_vc = VentureCapitalist.new("poory", 200)
middle_vc = VentureCapitalist.new("middleclass", 200000)
new_startup2.sign_contract(rich_vc, "seed", 150545)
new_startup2.sign_contract(rich_vc, "seed", 213291)
new_startup2.sign_contract(poor_vc, "seed", 11)
new_startup.sign_contract(poor_vc, "seed", 11000)
new_startup2.sign_contract(middle_vc, "seed", 50000)
poor_vc.offer_contract(new_startup, "a", 45)
rich_vc.offer_contract(new_startup, "a", 4505)
middle_vc.offer_contract(new_startup2, "b", 455)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line
