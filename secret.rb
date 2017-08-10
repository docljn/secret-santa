#AIM

#Part 1: Done and in branch "master"
#Write a secret santa program to ensure that each person gives a gift to one other
#and each person receives a gift from one other

#extension - Part 2:  - new branch created
#if the people are in groups (families/teams etc, ensure that most gifts cross groups)


#WORKING IDEAS HERE
#could create more than one array, each with a family name, to separate out families
#maybe test first with A = ["a1", "a2", "a3"]; B = ["b1", "b2", "b3"]
#then add C = ["c1", "c2"] to get mismatch in group sizes

#input (part3) would ask people to select which group they were part of, or to add a new group if not there?

#difficult bit is going to be selecting from all other families so no pattern and no internal gifts

#maybe start with one group as santas and the rest as recipients, and allocate randomly as with original idea.
#once no santas left in original group, move onto next family/group of santas; 


#MAYBE new recipients = (original recipient list) - (already received) - (new santas)
#URK this is getting complicated!

#still need a list of people who have already given/received to remove from the list
#need to test what happens if groups/families are different sizes





#create a list of people (an array) 
people = ["John", "Lorna", "Frances", "Bine"]

#create a giver<->recipient reference list (a hash) ready to use
list = Hash.new


#PROCESS FOR GENERATING PAIRS
#1: use the list of people to create a scratch list identical to the people: givers and recipients
#can't just make them equal as then you've modified both!!!!!

givers = people[0..-1]
recipients = people[0..-1]

#Also create two empty arrays to store the names you've used so that you don't use them again.
given = []
received = []
done = people.length

loop do 

	#remove anyone who has already given a present from your list of potential santas
	santas = givers - given
	#Use array.sample to select a random giver
	santa = santas.sample
	#add the giver to the list of people who have given presents
	given << santa


	#remove anyone who has already received a present from your list of potential openers
	openers = recipients - received
	#delete santa from the list of recipients (can't give to yourself) 
	openers.delete santa
	#select a random recipient 
	opener = openers.sample
	#add the recipient to the list of people who have got presents
	received << opener


	#add the pair to the hash
	list[opener] = santa


break if done == list.length


end

	p list






#extension  - Part 3: 
#create an input so that you can edit the list / save wishlists etc to file/database

#extension  - part 4: 
#the output will be blind, so that if you type in your name, you are given 
#the option to type in your wishlist, and then given
#the name of your recipient and their wishlist














