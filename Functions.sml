fun greaterOf(x, y) = if x > y then x
	else y;

fun get(L:'a list, i) = List.nth(L, i);
fun length(L) = List.length(L);

fun contain(L, x) = 
	if L = [] then false
	else if hd(L) = x then true
	else contain(tl(L), x);

fun add(L, x) =
	if L = [] then [x]
	else hd(L)::add(tl(L), x);

fun remove(L, i) =
	if i = 0 then tl(L) 
	else hd(L)::remove(tl(L), i - 1);

fun insert(L, x, i) =
	if i = 0 then x::tl(L)
	else hd(L)::insert(tl(L), x, i - 1);

fun count(L, x) = 
	if L = [] then 0
	else if hd(L) = x then 1 + count(tl(L), x)
	else count(tl(L), x);

fun max(L) = if tl(L) = [] then hd(L)
	else greaterOf(hd(L), max(tl(L)));

fun char(x:string) = hd(explode(x));

fun listConcat(x:''a lst, y:''a list) = 
	if x = [] then y
	else hd(x)::concat(tl(x), y);

fun strConcat(x:string, y:string) = implode(explode(x)@explode(y));

fun strNHelper(x:string, n:int) =
	if n = 0 then []
	else char(x)::strNHelper(x, n - 1); 

fun strN(x:string, n:int) = implode(strNHelper(x, n));

fun last(L) = 
	if tl(L) = [] then hd(L)
	else last(tl(L));

fun kth(L, K) = 
	if K = 0 then hd(L)
	else kth(tl(L), K - 1);

fun reverse(L) =
	if L = [] then []
	else reverse(tl(L))@[hd(L)];

fun power(X, N) = 
	if N = 0 then 1
	else X*power(X, N - 1);

fun removeLast(L) = 
	if tl(L) = [] then []
	else hd(L)::removeLast(tl(L));

fun palindrome(L) = 
	L = reverse(L);

fun flat(L) = 
	if L = [] then []
	else hd(L)@flat(tl(L));

fun compress(L) = 
	if L = [] then []
	else if tl(L) = [] then [hd(L)]
	else if hd(L) = hd(tl(L)) then compress(tl(L))
	else hd(L)::compress(tl(L)); 

fun packHelper(Element, Package, L) = 
	if L = [] then []
	else if hd(L) = Element then packHelper(Element, Element::Package, tl(L))
	else Package::packHelper(hd(L), [hd(L)], tl(L));
	
fun pack(L) = 
	if L = [] then []
	else packHelper(hd(L), [hd(L)], tl(L));

fun encodeHelper(L) =  
	if L=[] then []  
	else (length(hd(L)),hd(hd(L)))::encodeHelper(tl(L));
	
fun encode(L) =  encodeHelper(pack(L));