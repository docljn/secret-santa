#AIM

#Part 1: DONE
#Write a secret santa program to ensure that each person gives a gift to one other
#and each person receives a gift from one other

#original method had a major flaw: you can end up with an odd man out at the end by chance.

#rethinking the basic approach.
#use .rotate method along with .shuffle method for arrays, and then pair up entire group.

####################

#Part 2: DONE
#if the people are in groups (families/teams etc, ensure that most gifts cross groups)

####################

#Part 3:
#a way to link a name, clan and wishlist
#data storage - YAML? need to learn about it and this seems like a good excuse

#WORKING IDEAS HERE

#start thinking about classes?
#Person(name, clan, wishlist)??
#a way to select people by clan
#how to find out what the clans are?

#but I want to get user input to create a person, HOW.

class Person

	attr_accessor(:pname, :clan, :wishlist)

	def initialize(pname, clan = "main", wishlist = "anything under £10")
		@@clans ||= []
		@@members ||= []
		@pname = pname
		@clan = clan
		@wishlist = wishlist
	end


	def add
		collect
		clan_collect
	end




	def clan_collect
		unless @@clans.include?(clan)
		@@clans << clan
		end
	end


	def collect
	@@members << self
	end


	def details
		"clan: #{clan}, pname: #{pname}, wishlist: #{wishlist}"
	end


	def inspect
		"#{@pname}"
	end


	def self.clan_members(clan_name)
		@@members.select {|person| person.clan == clan_name}
	end


	def self.output_clans
		@@clans
	end


	def self.output_members
		@@members
	end




end

#maybe a clan class,
#or would I be better off with a hash? that way I don't need to worry about names?
class Clan
	attr_accessor(:cname, :cmember)

	def initialize(cname = "main")
		@cname = cname
		@cmember = cmember
	end

	def inspect
		"#{@cname}"
	end

end


#METHODS BELONGING TO THE PROGRAM NOT THE CLASS!





#create some sample people and give them different clan attributes
#****this will eventually be done as part of accepting user data****
#****I also need to know how to create class instance variable names at runtime****
#create a list of the clans used / people created as each person is created


a1 = Person.new("a1", "a")
a1.add

a2 = Person.new("a2", "a")
a2.add

a3 = Person.new("a3", "a")
a3.add

b1 = Person.new("b1", "b")
b1.add

b2 = Person.new("b2", "b")
b2.add

b3 = Person.new("b3", "b")
b3.add

c1 = Person.new("c1", "c")
c1.add

c2 = Person.new("c2", "c")
c2.add


#access the array of all the Person class instances
#not sure if I'll need this in the end....
#commenting out output list while debugging to save scrolling
participants = Person.output_members

#puts "Full list of participant details."
#participants.each do |person|
#	puts person.details
#end


#access the array of all clan names
clans = Person.output_clans
puts "clans: #{clans}"


#create an array of each clan's members

a = Person.clan_members("a")
b = Person.clan_members("b")
c = Person.clan_members("c")

#but I want to create all three (or however many) using a loop










#shuffle the members of each tribe to give a random order
#AND sort tribes by size (biggest last):

tribes = [a.shuffle,b.shuffle,c.shuffle]
sorted_tribes = tribes.sort_by(&:length)

largest_tribe = sorted_tribes[-1]

#list of all participants, in randomly ordered tribes
people = sorted_tribes.flatten



#work out the offset range you are going to use when you rotate the array to minimise matching within tribes
#care: if there is only one tribe you need to allow for random offsets within that tribe
#this will need to be tidied up - not sure if it will work when there is only one tribe!
people_count = people.length

min_offset = sorted_tribes[-1].length
max_offset = people.length - min_offset

if min_offset == people_count
	offset = rand(1..min_offset)
elsif if max_offset <= min_offset #check this logic - need a test for this!!!!!!!
	offset = min_offset           #not at all sure this will work as designed when ==
else
	offset = rand(min_offset..max_offset)
end

recipients = people.rotate(offset)

#create a giver<->recipient reference list
list = Hash[people.zip recipients]


p list
p offset

end





#extension  - Part 4:
#create an input so that you can edit the list
#input would ask people to select which group they were part of, or to add a new group if not there?

#def user_input(arg)
#	puts "Please enter your #{arg}: "
#	arg = gets.chomp
#	arg
#end


#extension  - part 5:
#nake a single page website where you can add name, clan, email, wishlist and
#the result is emailed to all the participants
#you'll still need an organiser, so the website won't store any user data once the emails
#have been sent, as otherwise DPA gets involved???














