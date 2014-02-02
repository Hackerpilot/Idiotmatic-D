import std.stdio;

// Why have one syntax when you can have two?
alias int counterType;
alias numberType = float;
// Guess what this does
alias int[string] rectangleArray[];
string results[];
string[] errors;

int stuff[20 < 30];
// Not sure why this won't compile, the language spec says I can use an
// assignExpression inside the brackets
// int stuff2["string literal?"];
int moreStuff[string];
int[] a, b;

// Error: multiple declarations must have the same type, not int[] and int[]
// Because obviously int[] and int[] are not the same type
// int c[], d[];

union HasAnInvariant
{
	// Language spec doesn't allow invariants here, but who cares?
	invariant()
	{
		assert (x > 0);
	}
	int x;

	new (size_t t, double y) in { assert(y < 20); } body { return cast(void*) new int[20].ptr; }
}

void foo(alias fun = a => a)(string[] args)
{

}

// How do you declare an array again?
void main(string args[])
{
	// Extra comma for the lulz
	mixin("foo")(args,);
	switch (args[1])
	{
	// We can put all sorts of stuff inside switches, so why not...
	switch (args[2])
	{
		default:
			break;
	}
	writeln("starting");
	case "--count":
		break;
	default:
		break;
	}
}
