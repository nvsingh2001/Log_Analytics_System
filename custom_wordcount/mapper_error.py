#!/usr/bin/env python3
import sys
import re

pattern = re.compile(r'(\S+) \S+ \S+ \[(.*?)\] "(\S+) (\S+) (\S+)" (\d{3}) (\S+)')

for line in sys.stdin:
    match = pattern.match(line)

    if not match:
        continue

    ip, time, method, endpoint, protocol, status, size = match.groups()

    try:
        status = int(status)

        if status >= 400:
            parts = endpoint.split("/")
            if len(parts) > 2:
                endpoint_group = "/" + "/".join(parts[1:3])
            else:
                endpoint_group = endpoint

            print(f"STATUS_{status}_ENDPOINT_{endpoint_group}\t1", flush=True)

    except:
        continue
