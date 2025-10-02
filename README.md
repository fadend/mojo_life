This pretty closely follows the code from the tutorial in https://docs.modular.com/mojo/manual/get-started.

I've tried to avoid building up strings with catenation (though I have to admit to not yet doing any timing to see if this actually makes a difference).

Similarly, for lists, have tried to be careful about reserving capacity in advance to avoid potential quadratic behavior (but it probably doesn't matter?).

Had fun using https://github.com/Textualize/rich for output. Fun to see the drama unfolding in the terminal.
