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


#I THINK this is where the repeat should come in....



#####LOOP starts here

done = people.length
puts "People length: #{people.length}"

loop do 

#Use array.sample to select a random giver, 
#and then array.delete to remove the giver (santa) from the list of givers
santa = givers.sample
givers.delete santa

#now delete santa from the list of recipients (can't give to yourself)
recipients.delete santa  



#then select a random recipient and remove it from the list of recipients (can't get two presents)
opener = recipients.sample
recipients.delete opener

#add the pair to the hash
list[santa] = opener


#now givers is correct (santa removed)
#but recipients needs to have santa added (they haven't got a pressie yet)

recipients << santa

puts "List length: #{list.length}"

break if done == list.length

puts "Santa: #{santa}"
p givers
puts "Opener: #{opener}"
p recipients



end

p list


#OK, I think an option to delete items from the arrays based on what is already in the hash might work better
#I'm ending up with double santa/opener because you can be off the list of recipients
#and still be on the list of givers, and vice versa
#drat











