def test_var_args(farg, *args):
    print "formal args:", farg

    for arg in args:
        print "another arg:", arg

test_var_args(1, "two", 3)