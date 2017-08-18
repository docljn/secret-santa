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
		@pname = pname
		@clan = clan
		@wishlist = wishlist 
	end

	def inspect
		"#{@pname}"
	end

	def input_person
	end

	def output_person
	end

end


#create some sample people:
a1 = Person.new("a1")
a2 = Person.new("a2")
a3 = Person.new("a3")

b1 = Person.new("b1")
b2 = Person.new("b2")
b3 = Person.new("b3")

c1 = Person.new("c1")
c2 = Person.new("c2")




#create arrays using your new people
a = [a1,a2,a3]
b = [b1,b2,b3]
c = [c1,c2]




#create several arrays, one for each tribe:
#a = ["a1", "a2", "a3"] 
#b = ["b1", "b2", "b3"]
#c = ["c1", "c2"]


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
elsif if max_offset <= min_offset 
	offset = min_offset
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
#the output will be blind, so that if you type in your name, you are given 
#the option to type in/edit your wishlist, and then given
#the name of your recipient and their current wishlist














