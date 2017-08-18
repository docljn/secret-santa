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

#WORKING IDEAS HERE

#Part 3:
#a way to link a name, tribe and wishlist
#data storage - YAML? need to learn about it and this seems like a good excuse
#start thinking about classes?
#person(name, clan, wishlist)??

class Person 

	attr_reader :name :tribe 
	attr_accessor :wishlist 

	def initialize(name, tribe, wishlist) #but I want to get user input to create these, HOW.
		@name = name
		@tribe = tribe
		@wishlist = wishlist 
	end

	def output_person

	end


end

def user_input(arg)
	p "Please enter your #{arg}: "
	arg = gets.chomp
	arg
end







#create several arrays, one for each tribe:
a = ["a1", "a2", "a3"] 
b = ["b1", "b2", "b3"]
c = ["c1", "c2"]


#shuffle the members of each tribe to give a random order
#AND sort tribes by size (biggest last): 

tribes = [a.shuffle,b.shuffle,c.shuffle] 
sorted_tribes = tribes.sort_by(&:length)

largest_tribe = sorted_tribes[-1]

#list of all participants, in randomly ordered tribes
people = sorted_tribes.flatten 



#work out the offset range you are going to use when you rotate the array to minimise matching within tribes
people_count = people.length

min_offset = sorted_tribes[-1].length
max_offset = people.length - min_offset

if max_offset <= min_offset 
	offset = min_offset
else
	offset = rand(min_offset..max_offset)
end

recipients = people.rotate(offset)

#create a giver<->recipient reference list 
list = Hash[people.zip recipients]


p list
p offset 







#extension  - Part 4: 
#create an input so that you can edit the list / save wishlists etc to file/database
#input would ask people to select which group they were part of, or to add a new group if not there?


#extension  - part 5: 
#the output will be blind, so that if you type in your name, you are given 
#the option to type in/edit your wishlist, and then given
#the name of your recipient and their current wishlist














