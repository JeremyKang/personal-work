def print_up_to_but_not_including(up_to_number, increment):
    i = 0
    numbers = []

    while i < up_to_number:
        print "At the top i is %d" % i
        numbers.append(i)

        i += increment
        print "Numbers now: ", numbers
        print "At the bottom i is %d" % i

    print "The numbers: "

    for num in numbers:
        print num

print_up_to_but_not_including(100, 5)