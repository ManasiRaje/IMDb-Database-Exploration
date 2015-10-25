
import re
print "It works!"

ap_filename = "pagerank_ids.txt"
count = 1
actor_pagerank = {}
with open(ap_filename) as f:
    for line in f:
        if(True):
            #print "LINE: " + line
            res = re.split(r'\t+',line)
            temp = res[1]
            res[1] = temp[:len(temp)-2]
            actor_pagerank[count] = float(res[1])
            #print res
        count += 1 

#print actor_pagerank
print "Read all actor-pageranks"
print "~~~~~~"

actor_name_filename = "Actors_Names.txt"
actor_name = {}
count = 1
with open(actor_name_filename) as f:
    for line in f:
        if(True):
            actor_name[line.strip()] = count
        count += 1

print "Read all actor-names"
print "~~~~~~"


movie_list = {}

movies_actors_filename = "outmoviesless5.txt"
count = 1
#opening the file that we need to qrite to
f2 = open("movie_top5ratings.txt","w")
with open(movies_actors_filename) as f:
    for line in f:
        if True:
            res = re.split(r'\t+',line)
            temp = res[len(res) -1]
            res[len(res) -1] = temp[:len(temp)-2]
            pr_list = []
            for actor in res:
                if actor in actor_name:
                    #print actor + " --- " + str(actor_name[actor])
                    #print "------ " + str(actor_pagerank[actor_name[actor]])
                    pr_list.append(actor_pagerank[actor_name[actor]])
            pr_list.sort(reverse = True)
            line2 = str(res[0]) + "\t"
            for i in range(0,5):
                line2 += str(pr_list[i]) +"\t"
            line2 += "\n"
            f2.write(line2)
            #print pr_list
            #print line2
        count += 1

f2.close()
print "written the top 5 pageranks of ALL movies to file!"
print "~~~~~"


