=begin

ITERATIVE MODEL:

(Initial) 
-> Planning -> Requirement -> Analysis&Design -> Implementation -> 
(Deployment) 
->Testing -> Evaluation -> (Back to Planning) ->

*Trello.com (Website to plan programs)
*Pivotaltraker.com (Website to organize tasks for programs)
*Notational Velocity (Note program)

USER STORIES:

-Stating the different functionality of your program without being
technical.  At a high-level what does the program do?  An explanation
for user to understand what the program will do.

ie.
"As a user... I should be able to... So that...."

"As a user, I should be able to create a contact or account"
"As a user, I should be able to remove an account"
"As a user, I should be able to modify an account"
"As a user, I should be able to search for a name"

PRIORITIZE:

-Must Have
-Should Have
-Could Have
-Won't Have

---------------------------------
=end

require_relative './contact.rb' 
require_relative './rolodex.rb'

class CRM

	attr_reader :name 

	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
	end

	def print_main_menu
		puts " [1] Add a contact \n [2] Modify a contact \n [3] Display all contacts \n [4] Display one contact \n [5] Display an attribute \n [6] Delete an account \n [7] Exit \n \n Enter a number:"
	end

	def main_menu
		puts "Welcome to #{@name}"

		while true
			puts " "
			print_main_menu
			input = gets.chomp.to_i
			return if input == 7
			choose_option(input)
		end
	end

	def choose_option(option)
		case option
		when 1 then add_contact
		when 2 then modify_contact
		when 3 then display_all_contacts
		when 4 then display_one_contact
		when 5 then display_attribute
		when 6 then delete_contact
		else
			puts "Invalid option. Try again!"
			return
		end

	end

	def add_contact
		print "Enter First Name: "
		first_name = gets.chomp

		print "Enter Last Name: "
		last_name = gets.chomp
		
		print "Enter E-mail Address: "
		email = gets.chomp
		
		print "Enter a Note: "
		note = gets.chomp
		
		contact = Contact.new(first_name, last_name, email, note)

		@rolodex.add_contact(contact)

		puts " "

		puts "Entry has been added to the rolodex!"
	end

	def display_all_contacts
		puts "Printing Rolodex..."
		puts " "
		@rolodex.contacts.each do |contact|
			puts "#{contact.first_name} #{contact.last_name} <#{contact.email}> - #{contact.id}\n"
			puts " "
		end
	end
	
	puts ""

	def display_one_contact
		print "Enter the first and last name of the contact that you would like to be displayed: "
		name = gets.chomp.split
		@rolodex.display_one(name)
	end

	def display_attribute
		puts "Enter the first and last name of contact:"
		name = gets.chomp.split
		puts "Which attribute would you like displayed?"
		puts "[1] E-mail"
		puts "[2] Note"
		puts "[3] ID"
		puts "[4] Quit"
		selection = gets.chomp.to_i
		@rolodex.display_attribute(name, selection)
	end

	def print_modify_menu
		puts "What would you like to modify?"
		puts "[1] First Name \n[2] Last Name \n[3] Email\n[4] Note\n[5] Quit"
	end

	def modify_contact
		print "Enter the first and last name of the contact you wish to modify: "
		name = gets.chomp.split 
		puts "Would you like to modify an attribute of #{name[0]} #{name[1]}? (Enter Yes or No):"
		confirm_input = gets.chomp.downcase
		if confirm_input == "yes"
			puts "[1] First name"
			puts "[2] Last name"
			puts "[3] Email"
			puts "[4] Note"
			puts "[5] ID" 
			print "Enter a contact attribute to be modified: "
			selection = gets.chomp.to_i
			print "Enter modification: "
			value = gets.chomp
			@rolodex.modify_contact(name, selection, value)
		else
			puts "Returning to Menu..."
		end
	end


	def delete_contact
		print "Enter the first and last name you would like to delete from the Rolodex: "
		name = gets.chomp.split
		@rolodex.delete_contact(name)
	end

end

crm = CRM.new("Bitmaker Labs CRM")
crm.main_menu
