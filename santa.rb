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



#METHODS BELONGING TO THE PROGRAM NOT THE CLASS!
def clanspeople(cname)
	Person.clan_members(cname)
end

def new_participant(pname, clan, wishlist = "")
	a1 = Person.new(pname, clan, wishlist)
end

def participants
	participants = Person.output_members
end


#work out the offset range you are going to use when you rotate the array to minimise matching within tribes
#care: if there is only one tribe you need to allow for random offsets within that tribe
#this will need to be tidied up - not sure if it will work when there is only one tribe!
def set_offset(people_count, min_offset, max_offset)
	if min_offset == people_count
	offset = rand(1..min_offset)
	elsif max_offset <= min_offset #check this logic - need a test for this!!!!!!!
		offset = min_offset
	else
		offset = rand(min_offset..max_offset)
	end
end

#create some sample people and give them different clan attributes
#create a list of the clans used / people created as each person is created
#you can then reuse the variable name every time you need to add someone to the list.
a1 = new_participant("a1", "a")
a1.add

a1 = new_participant("a2", "a")
a1.add

a1 = new_participant("a3", "a")
a1.add

a1 = new_participant("b1", "b")
a1.add

a1 = new_participant("b2", "b")
a1.add

a1 = new_participant("b3", "b")
a1.add

a1 = new_participant("c1", "c")
a1.add

a1 = new_participant("d1", "d")
a1.add

a1 = new_participant("e1", "e")
a1.add

a1 = new_participant("e2", "e")
a1.add


#THINK ABOUT a method to do this by passing an array of arrays into it? Or data possibly from YAML or csv?
#**********

#**********


#access the array of all the Person class instances
#not sure if I'll need this in the end....

puts "Full list of participant details."
participants.sort_by!{|person| [person.clan, person.pname]}
participants.each do |person|
	puts person.details
end

#I'd like to turn this into a method like "list" if possible?
#***************

#***************




#access the array of all clan names
#probably worth putting this in a separate method??
clans = Person.output_clans
puts "clans: #{clans}"

#*********

#*********


#create an array of each clan's members, and add that array to tribes


tribes = []
clan_number = 0
while clan_number < clans.length do
	clan0 = clanspeople(clans[clan_number])
	tribes << clan0.shuffle!
	clan_number +=1
end

#again, I'd like to turn this into a method if possible?
#*********************

#*********************


#sort tribes by size (biggest last):

sorted_tribes = tribes.sort_by(&:length)

largest_tribe = sorted_tribes[-1]

#list of all participants, in randomly ordered tribes
people = sorted_tribes.flatten



people_count = people.length

min_offset = sorted_tribes[-1].length
max_offset = people.length - min_offset

offset = set_offset(people_count, min_offset, max_offset)



recipients = people.rotate(offset)

#create a giver<->recipient reference list
list = Hash[people.zip recipients]


p list
p offset




#extension  - Part 4:
#create an input so that you can edit the list

#WORKING THOUGHTS HERE

#data storage - YAML? need to learn about it and this seems like a good excuse
#at the moment I'm not storing anything which is good for DPA but means no editing after entry
#I want to get user input to create a person, HOW.

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


#NB with the new data protection rules, you need explicit permission to even PROCESS data????














