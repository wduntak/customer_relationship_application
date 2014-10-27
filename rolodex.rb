class Rolodex
	attr_reader :contacts

	@@index = 1000

	def initialize
		@contacts = []
	end

	def add_contact(contact)
		contact.id = @@index
		@@index += 1
		@contacts << contact
	end

	def find_name(name)
		@contacts.rindex {|contact| (contact.first_name == name[0]) && (contact.last_name == name[1])}
	end

	def display_one(name)
		show = @contacts[find_name(name)]
		if show
			puts "#{show.first_name} #{show.last_name}:" 
			puts "E-mail: <#{show.email}>"
			puts "ID: #{show.id}"
			puts "Note: #{show.note}"
		else
			puts "Unable to find contact"
		end
	end

	def display_attribute(name, attribute)
		show = @contacts[find_name(name)]
		case attribute
		when 1 then puts "#{show.first_name} #{show.last_name}: <#{show.email}>"
		when 2 then puts "#{show.first_name} #{show.last_name}: #{show.note}"
		when 3 then puts "#{show.first_name} #{show.last_name}: #{show.id}"
		when 4 then puts "Returning to menu..."
		else
			puts "Invalid entry"
		end
	end

	def modify_contact(name, attribute, value)
		case attribute
		when 1 then @contacts[find_name(name)].first_name = value
		when 2 then @contacts[find_name(name)].last_name = value
		when 3 then @contacts[find_name(name)].email = value
		when 4 then @contacts[find_name(name)].note = value
		when 5 then @contacts[find_name(name)].id = value
		end
	end

	def delete_contact(name)
		@contacts.delete_at(find_name(name))
	end

end