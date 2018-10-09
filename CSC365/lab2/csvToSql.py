import sys

# CONVERTS CSV FILES TO INDIVIDUAL MYSQL INSERT STATEMENTS

if len(sys.argv) != 4:
    print("USAGE: python csvToMySQL inFile table outFile")
        # inFile :
        # table : db table name
        # outFile : desired name of the output file
    exit()


outFile = open(sys.argv[3] , "w")

insertStatement = "INSERT INTO {} VALUES ".format(sys.argv[2])

with open(sys.argv[1]) as f:
    next(f) # skip header (column names)
    for line in f:
        values = "({});\n".format(line.rstrip())
        outFile.write(insertStatement + values)
