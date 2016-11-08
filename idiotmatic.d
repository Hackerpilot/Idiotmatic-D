import std.stdio;

// Why have one syntax when you can have two?
alias int counterType;
alias numberType = float;
string[] errors(T) = ["WHEEEE"];

// Not sure why this won't compile, the language spec says I can use an
// assignExpression inside the brackets
// int stuff2["string literal?"];

// Error: multiple declarations must have the same type, not int[] and int[]
// Because obviously int[] and int[] are not the same type
// int c[], d[];

// I have no idea.
alias extern(Windows) void* fnRtlAllocateHeap(void* HeapHandle, uint Flags, size_t Size) nothrow;

union HasAnInvariant
{
	int x;

	new (size_t t, double y) in { assert(y < 20); } body { return cast(void*) new int[20].ptr; }
}

class Alpha
{
	class Bravo : this // This what?
	{
	}
}

void foo(alias fun = a => a)(string[] args)
{

}

template nonsense(foo, bar) {} // A template. Nothing strange here.
enum W(bar) = nonense!("foo", bar); // New syntax from DIP42.
alias X(bar) = nonense!("foo", bar); // enum, alias, whatever. Keywords are interchangeable, right?
auto Y(bar) = nonense!("foo", bar); // Can't leave out auto...
const Z(bar) = nonense!("foo", bar); // Sure. Why not. Const too.
immutable Z(bar) = nonense!("foo", bar); // Doesn't even conflict with the other Z.
static Z(bar) = nonense!("foo", bar); // I've got a fever and the only cure is more symbols with the same name.
string A(T) = "A", B(T) = "B";
double w(alias t) = 1.0f;

struct q {struct r { struct s{ this(string[]) {}} }}
// Unfortunately DMD's parser is not a bad enough dude to save this syntax, but
// it is perfectly legal according to the grammar spec.
/+const .q.r.s * ([5 .. 10] t [int]) = .q.r.s(), o = ["a" ~ "b"];+/

// Compiler doesn't like this either...
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
}

void classy()
{
	scope (success) class SomeClass { int a; int b; }
	scope (failure) class OtherClass { int c; int d; }
}

void funWithUfcsAndPropertySyntax() {
	import std.typecons : tuple;
	"%s %s".writefln = ("foo".tuple = "bar").expand;
}


void main(string[] args)
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

	for ({};)
		writeln("Infinite loops are fun");
}
