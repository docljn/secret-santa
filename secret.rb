#AIM
#Write a secret santa program to ensure that each person gives a gift to one other
#and each person receives a gift from one other

#extension: create an input so that you can edit the list

#extension: the output will be blind, so that if you type in your name, you are given 
#the option to type in your wishlist, and then given
#the name of your recipient and their wishlist

#extension: if the people are in groups (families/teams etc, ensure that most gifts cross groups)


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


#I THINK this is where the repeat should come in....



#####LOOP starts here

done = people.length

loop do 

	#remove anyone who has already given a present from your list of potential santas
	santas = givers - given
	puts "Santas: #{santas}"

	#Use array.sample to select a random giver
	santa = santas.sample
	#add the giver to the list of people who have given presents
	given << santa

	

	#remove anyone who has already received a present from your list of potential recipients
	openers = recipients - received
	puts "Openers: #{openers}"
	#and delete santa from the list of recipients (can't give to yourself) 
	openers.delete santa
	#then select a random recipient 
	opener = openers.sample
	#and add the recipient to the list of people who have got presents
	received << opener



	#add the pair to the hash
	list[opener] = santa


break if done == list.length


end

	p list













