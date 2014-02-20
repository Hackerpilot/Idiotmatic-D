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


template nonsense(foo, bar) {} // A template. Nothing strange here.
enum X(bar) = nonense!("foo", bar); // New syntax from DIP42.
alias Y(bar) = nonense!("foo", bar); // enum, alias, whatever. Keywords are interchangable, right?

struct q {struct r { struct s{ this(string[]) {}} }}
// Unfortunately DMD's parser is not a bad enough dude to save this syntax, but
// it is perfectly legal according to the grammar spec.
/+const .q.r.s * ([5 .. 10] t [int]) = .q.r.s(), o = ["a" ~ "b"];+/

// Uncomment this to cause an ICE
/+void doThings[](T)(T j, T k,) if (T == int);+/

// Parser rejects this valid declaration
/+void[] (doThings[int]) foo body { return []; }+/

void doThings()
{
	try writeln("test");
	catch (Exception)
	{
		// Huh. Doesn't the spec require giving a name to the exception?
	}
	// It doesn't like this for some reason...
	/+catch (stdout).writeln("failed");+/
	// Try this instead?
	catch stdout.writeln("failed");
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

    // Lambdas, lambdas everywhere!
    (() => (){})()();
}
