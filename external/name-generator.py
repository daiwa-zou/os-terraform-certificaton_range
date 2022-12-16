import json, time, random

numbers = []
for x in range(9):
    numbers.append(str(random.randint(0, 9)))

fixed_name = "machine"
num = ''.join(numbers)
result = {
  "name": "{0}-{1}".format(fixed_name, num),
}

print(json.dumps(result))