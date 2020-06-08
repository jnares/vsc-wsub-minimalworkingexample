#!/usr/bin/env python3

import sys

with open(sys.argv[1], 'r') as f_in:
    name=""
    content=""
    for line in f_in:
        if '.'in line:
#            print(line)
#            print("name="+ name)
            if len(name) > 0:
                with open(name,'w') as f_out:
                    f_out.write(content)
                    f_out.close()
            name=line.strip()
            content=""
        else:
            content += line
    with open(name,'w') as f_out:
        f_out.write(content)
        f_out.close()

