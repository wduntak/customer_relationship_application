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
		puts " [1] Add a contact \n [2] Modify a contact \n [3] Display all contacts \n [4] Display one contact \n [5] Display an attribute \n [6] Delete an account \n [7] Exit \n Enter a number:"
	end

	def main_menu
		puts "Welcome to #{@name}"

		while true
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
	end

	def display_all_contacts
		@rolodex.contacts.each do |contact|
			puts "#{contact.first_name} #{contact.last_name} <#{contact.email}> - #{contact.id}"
		end
	end
	
	puts ""

	def display_one_contact
		print "Enter your first name: "
		first_name = gets.chomp 
		puts "#{@rolodex.contacts.first_name}"
	end

	def modify_contact
		check_user_id
		puts "What is your ID number?"
		user_ID = gets.chomp
	end


	def check_user_id
		puts "Do you have an ID number?"
		puts "[1] Yes"
		puts "[2] No"

		choice = gets.chomp.to_i

		if choice == 1

			return

		elsif choice == 2

			puts "What is your last name?"
			name_input = gets.chomp
			
			@rolodex.contacts[last_name].each do |contact|

				if contact == name_input

					puts "#{contact.first_name} #{contact.id}"
				
				else

					"#{name_input} was not found!"
				end
			end
		else
			puts "This is not an option"
		end


	end




end


crm = CRM.new("Bitmaker Labs CRM")
crm.main_menu
