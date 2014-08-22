from tempfile import NamedTemporaryFile
import os
import subprocess
import fileinput
import random
import time

def get_lines():
    for line in fileinput.input():
        yield line

tmpfile = NamedTemporaryFile(delete=False,
                                     prefix="/tmp/test_%s_"
                                            % (os.getpid()))
print tmpfile.name
file_line_count = 0
with open(tmpfile.name, 'wb') as tmpfile_handle:
    proc = subprocess.Popen(['pigz', '-p', '2', '-c', '-6'],
                                    stdin=subprocess.PIPE,
                                    stdout=tmpfile_handle)

    for line in get_lines():
        file_line_count += 1
        proc.stdin.write(str(line) + "\n")
    
    proc.stdin.close()
    rc = proc.wait()

    if rc:
        print "error"      
        os.unlink(tmpfile.name)
    print "file line count %s" %(file_line_count)



