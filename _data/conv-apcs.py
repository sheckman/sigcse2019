#note from 2018 webmaster (josh hug): I have no idea what this is, sorry, it was here when I got here.
import csv

def get_last (ls):
  return ls[1]

ls = []
with open("apcs.tsv") as tsv:
  for line in csv.reader(tsv, dialect="excel-tab"):
    ls.append(line)
    
  ordered = sorted(ls, key = get_last)

  
  for line in ordered:
    first   = line[0]
    last    = line[1]
    inst    = line[3]
    email   = line[2]
    
    print "  - name: {0} {1}".format(first, last)
    print "    inst: {0}".format(inst)
    print "    email: {0}".format(email)
    print