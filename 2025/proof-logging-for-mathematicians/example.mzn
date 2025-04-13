enum Shifts = { Day, Night, Off };
enum Days = anon_enum(14); enum Workers = anon_enum(11);
int: day_c = 4; int: night_c = 2;

array[Days, Workers] of var Shifts: a;

constraint forall (d in Days) (sum(w in Workers)(a[d, w] == Day) = day_c);
constraint forall (d in Days) (sum(w in Workers)(a[d, w] == Night) = night_c);
constraint forall (w in Workers)(regular([a[d, w] | d in Days],
    "(Off|(Day{1,5} Off)|(Night{1,2} Off))* (Day{1,5}|Night{1,2}|Off)"));

solve satisfy;

output [ join(" ", [format_justify_string(-5, show(a[d, w])) | d in Days
    ]) ++ "\n" | w in Workers];

