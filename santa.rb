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

#Part 3: DONE BUT REFACTORING TO DO
#a way to link a name, clan and wishlist for each participant

####################

#Part 4:
#create an input/output interface so that you can accept data from users
#and a way to edit the list

#WORKING THOUGHTS HERE
#once a person has been added, output to screen
#and add to the displayed list each time you add a person
#find a way to edit a person if you've made a mistake

#give a choice of clan/team/family from those already entered, or 0 to add a new one

#data storage - YAML? need to learn about it and this seems like a good excuse
#at the moment I'm not storing anything which is good for DPA but means no editing after entry






#####################

class Person

	attr_accessor(:pname, :clan, :wishlist)

	def initialize(pname, clan, wishlist)
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
		"Person Name: #{pname}, Clan: #{clan}, Wishlist: #{wishlist}"
	end


	def inspect
		#means I can get the person name output rather than the entire object,
		#which makes reading the output a lot easier
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

def clans_list
	#access the array of all clan names
	Person.output_clans
end


def clanspeople(cname)
	#access the members of the class who belong to a particular clan
	Person.clan_members(cname)
end



def fill_array(target_array, source_array, counter = 0)
	#create an array of each clan's members, and add that array to tribes (the target_array)
	#target_array ||=[] - why doesn't this work if I don't initialize 'tribes' outside the method?
	while counter < source_array.length do
		clan0 = clanspeople(source_array[counter])
		counter +=1
		target_array << clan0.shuffle!
	end
	target_array
end

#list method works with passing just the array name but I want to be able to set the sort_by option
#at run time and when I try adding the clan and pname fields to the arguments it doesn't work!
def list(array)
	#access and output the array of all the Person class instances sorted by clan and name
	array.sort_by! {|array_item| [array_item.clan, array_item.pname] }
	array.each {|array_item| puts array_item.details}
end

#***************
#trying again to get clan and pname to be arguments of the method, rather than hard coded
#STUCK!

#puts "testing list method with three arguments"
#def list_args(array, sorter1, sorter2)
#	array.sort_by! {|array_item| [array_item.sorter1, array_item.sorter2]}
#end
#p list(participants, clan, pname)

#***************


def new_participant(pname, clan, wishlist)
	#create a new instance of Person class with desired attributes
	a1 = Person.new(pname, clan, wishlist)
end


def participants
	#access all members of the Person class
	participants = Person.output_members
end


def set_offset(people_count, min_offset, max_offset)
	#work out the offset you are going to use when you rotate the array to minimise matching within tribes
	#care: if there is only one tribe you need to allow for random offsets within that tribe
	#this will need to be tidied up - not sure if it will work when there is only one tribe!
	if min_offset == people_count
		offset = rand(1..min_offset)
	elsif max_offset <= min_offset #check this logic - need a test for this!!!!!!!
		offset = min_offset
	else
		offset = rand(min_offset..max_offset)
	end
end

#END OF PROGRAM METHODS

#START OF ACTUAL CODE

#create some sample people and give them different clan attributes
#create a list of the clans used / people created as each person is created

#this is a shortcut to save me typing everything in
#eventually this should probably be a csv / YAML data store?
#and the input will write to this each time a new person is added?

#####



#Working out how to add a participant via the command line:
reqs = ["full name", "clan/team/family", "wishlist"]
attributes = []
everyone = []

reqs.each do |attr|
	puts "Please enter the participant's #{attr}: "
	puts "(If this does not apply, please press 'enter'.)"
  attributes << gets.chomp
end


test_person = new_participant(attributes[0], attributes[1], attributes[2])
test_person.add
list(participants)




#####


everyone = [["a1", "a"], ["b2", "b"], ["c3", "c"], ["b1", "b"], ["a2", "a"], ["b3", "b", "chocolate"], ["c1", "c", "whisky"], ["c2", "c"]]

everyone.each do |person|
	a1 = new_participant(person[0], person[1]||="no clan given", person[2]||="Anything under £10.")
  #does this work because ruby is forgiving?
	a1.add
	#this outputs the 'participants' array and the 'clans' array
end


#access and output the array of all the Person class instances
#allows the organiser to check for erros
list(participants)

#access the array of all clan names (no need to output)
clans_list

#create an array of arrays, where each internal array contains the members of a single clan
tribes = []
fill_array(tribes, clans_list)

#sort tribes by size (biggest last):
sorted_tribes = tribes.sort_by(&:length)

#list of all participants, in randomly ordered tribes
people = sorted_tribes.flatten

#generate settings for rotation to minimise giving within clans
#can I turn this into a method?????
people_count = people.length
min_offset = sorted_tribes[-1].length
max_offset = people.length - min_offset

#actually work out the offset for rotation
offset = set_offset(people_count, min_offset, max_offset)

#recipients are generated by rotating the array by the offset so that everyone gets a non-self partner
recipients = people.rotate(offset)

#create a giver<->recipient reference list
list = Hash[people.zip recipients]

puts "Giver:Recipient pairs"
p list
puts "Offset:"
p offset










#extension  - part 5:
#nake a single page website where you can add name, clan, email, wishlist and
#the result is emailed to all the participants (i.e. each receives their recipient and the recipient's wishlist)
#you'll still need an organiser, so the website won't store any user data once the emails
#have been sent, as otherwise DPA gets involved???
#need to check what is needed for processing of user information
#NB with the new data protection rules, you need explicit permission to even PROCESS data????














