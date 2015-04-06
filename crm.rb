require_relative "contact"
require_relative "rolodex"

class CRM

	def initialize(name)
	  @name = name
	  @rolodex=Rolodex.new
  end

	def print_main_menu
	  puts "\n[1] Add a new contact"
	  puts "[2] Modify an existing contact"
	  puts "[3] Delete a contact"
	  puts "[4] Display all the contacts"
	  puts "[5] Display a contact"
	  puts "[6] Display by attribute"
	  puts "[7] Exit"
	  puts "\nEnter a number: "
	end

	def main_menu
	  print_main_menu
	  user_selected = gets.to_i
	  call_option(user_selected)
	end

	def call_option(user_selected)
	  @rolodex.add(add_new_contact) if user_selected == 1
	  @rolodex.modify_contact if user_selected == 2
	  @rolodex.delete_contact if user_selected == 3
	  @rolodex.display_all if user_selected == 4
	  @rolodex.display_contact if user_selected == 5
	  @rolodex.display_attribute if user_selected == 6
	  return false if user_selected == 7

	  return true
	end

	def add_new_contact
	  print "Enter First Name: "
	  first_name = gets.chomp
	  print "Enter Last Name: "
	  last_name = gets.chomp
	  print "Enter Email Address: "
	  email = gets.chomp
	  print "Enter a Note: "
	  note = gets.chomp
	  contact = Contact.new(first_name, last_name, email, note)
	end


	def self.run(name)
    crm = CRM.new(name)
    while crm.main_menu
    end
 	end

end

def clear_screen
	puts "\e[H\e[2J"
end

CRM.run("my CRM")



