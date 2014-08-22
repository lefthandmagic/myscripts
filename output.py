import sys
import fileinput

filename = sys.argv[1]
start_offset = filename.split('-')[3]
current_byte_offset = int(start_offset)
for line in fileinput.input([filename]):
	linesize = len(line)
	current_byte_offset = current_byte_offset + linesize + 9
	print "current byte offset: %s " % (current_byte_offset)
