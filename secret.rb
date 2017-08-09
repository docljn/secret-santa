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

#1: use the list of people to create a scratch list identical to the people: givers
#can't just make them equal as then you've modified both!!!!!

givers = people[0..-1]


#I THINK this is where the repeat should come in....
#maybe repeat until the length of the hash is equal to the length of people?


#Use array.sample to select a random giver, 
#and then array.delete to remove them from the list of givers
santa = givers.sample
givers.delete santa

#now duplicate the santa list to give a list of potential recipients (can't be santa!!)
#then select a random recipient
recipients = givers[0..-1]
opener = recipients.sample

#add the pair to the hash
list[santa]=opener

#now givers is correct (one giver removed)
#but recipients needs to have opener removed and santa added
recipients.delete opener
recipients << santa








