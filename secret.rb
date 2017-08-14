#AIM

#Part 1: Done and in branch "master"
#Write a secret santa program to ensure that each person gives a gift to one other
#and each person receives a gift from one other

#extension - Part 2:  - new branch created
#if the people are in groups (families/teams etc, ensure that most gifts cross groups)


#WORKING IDEAS HERE
#could create more than one array, each with a family name, to separate out families
#maybe test first with a = ["a1", "a2", "a3"]; b = ["b1", "b2", "b3"]
#then add C = ["c1", "c2"] to get mismatch in group sizes

#OR start thinking about objects instead:
#person(name, clan, wishlist)??
#and what about writing methods so that they can be reused.
#that might mean a whole rewrite though....

#difficult bit is going to be selecting from all other families so no pattern and no internal gifts

#maybe start with one group as santas and the rest as recipients, and allocate randomly as with original idea.
#once no santas left in original group, move onto next family/group of santas; 


#MAYBE new recipients = (original recipient list) - (already received) - (new santas)
#URK this is getting complicated!

#still need a list of people who have already given/received to remove from the list
#need to test what happens if groups/families are different sizes





#create a list of people (an array) 
people = ["John", "Lorna", "Frances", "Bine"]

#use the list of people to create a scratch list identical to the people: givers and recipients
#can't just make them equal as then you've modified both!!!!!
#givers = people[0..-1]
#recipients = people[0..-1]
#this is probably where you would mess about and make the split for
#different tribes??



#create a giver<->recipient reference list (a hash) ready to use
list = Hash.new

#Also create two empty arrays to store the names you've used so that you don't use them again.
given = []
received = []
done = people.length

#def choose_santa(people,given)
	#givers = people[0..-1]
	#p givers
	#santas = givers - given
	#p santas
	#santa = santas.sample
	#p santa
#end

#def choose_opener(people,received)
#	recipients = people[0..-1]
#	p recipients
#	openers = recipients - received
#	p openers
#	openers.delete santa
#	p openers
#	opener = openers.sample
#	p opener
#end

def choose(available, used)
	to_choose_from = available - used
	chosen = to_choose_from.sample
	chosen
end

loop do 
	santa = choose(people, given)

	#ensure that santa is removed from the list of potential recipients
	#but only for each time through the loop
	#so they are still available for the next iteration
	recipients = people[0..-1]
	recipients.delete santa
	opener = choose(recipients, received)
	
	#add the pair to the hash
	list[opener] = santa
	#and remove from available people of each type
	given << santa
	received << opener

	
	break if done == list.length


	end

p list

#this has one major failing, which is that you can end up with an
#odd man out at the end by chance
#and I don't know how to solve that




#extension  - Part 3: 
#create an input so that you can edit the list / save wishlists etc to file/database
#input (part3) would ask people to select which group they were part of, or to add a new group if not there?

#extension  - part 4: 
#the output will be blind, so that if you type in your name, you are given 
#the option to type in your wishlist, and then given
#the name of your recipient and their wishlist














