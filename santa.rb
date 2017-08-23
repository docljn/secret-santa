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
	#that sets everything at initialization i.e. Person.new
	#I also want to shove the 'clan' into an array of clans at this stage HOW??

	def inspect
		"#{@pname}"
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



#create some sample people:
#and give them different clan attributes based on symbols
#this will eventually be done as part of accepting user data

a1 = Person.new("a1", "a")
a2 = Person.new("a2", "a")
a3 = Person.new("a3", "a")
a4 = Person.new("a4", "a")

b1 = Person.new("b1", "b")
b2 = Person.new("b2", "b")
b3 = Person.new("b3", "b")

c1 = Person.new("c1", "c")
c2 = Person.new("c2", "c")

#put them all in one array (this will eventually be done as part of creating Person.new)
participants = [a1, a2, a3, a4, b1, b2, b3, c1, c2]
p participants

#put all the clans into an array so you know what you've got
#(this will eventually bedone as part of creating Person.new)

clans = ["a", "b", "c"]



#number_clans = clans.length

#select from participants so you have an array for each clan:
#but how to set variable names on the fly - 
#I won't know how many clans there are going to be








#create arrays using your new People instances - 
#this is what the above method is supposed to do
a = [a1,a2,a3,a4]

b = [b1,b2,b3]

c = [c1,c2]




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
#the output will be blind, so that if you type in your name, you are given 
#the option to type in/edit your wishlist, and then given
#the name of your recipient and their current wishlist














