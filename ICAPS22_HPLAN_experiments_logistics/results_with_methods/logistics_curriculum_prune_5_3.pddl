( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
    ( GREATER-THAN ?p - OBJ ?q - OBJ )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_148701 - OBJ
      ?auto_148700 - LOCATION
    )
    :vars
    (
      ?auto_148703 - LOCATION
      ?auto_148704 - CITY
      ?auto_148702 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148703 ?auto_148704 ) ( IN-CITY ?auto_148700 ?auto_148704 ) ( not ( = ?auto_148700 ?auto_148703 ) ) ( OBJ-AT ?auto_148701 ?auto_148703 ) ( TRUCK-AT ?auto_148702 ?auto_148700 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_148702 ?auto_148700 ?auto_148703 ?auto_148704 )
      ( !LOAD-TRUCK ?auto_148701 ?auto_148702 ?auto_148703 )
      ( !DRIVE-TRUCK ?auto_148702 ?auto_148703 ?auto_148700 ?auto_148704 )
      ( !UNLOAD-TRUCK ?auto_148701 ?auto_148702 ?auto_148700 )
      ( DELIVER-1PKG-VERIFY ?auto_148701 ?auto_148700 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_148722 - OBJ
      ?auto_148723 - OBJ
      ?auto_148721 - LOCATION
    )
    :vars
    (
      ?auto_148725 - LOCATION
      ?auto_148726 - CITY
      ?auto_148727 - LOCATION
      ?auto_148724 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148725 ?auto_148726 ) ( IN-CITY ?auto_148721 ?auto_148726 ) ( not ( = ?auto_148721 ?auto_148725 ) ) ( OBJ-AT ?auto_148723 ?auto_148725 ) ( IN-CITY ?auto_148727 ?auto_148726 ) ( not ( = ?auto_148721 ?auto_148727 ) ) ( OBJ-AT ?auto_148722 ?auto_148727 ) ( TRUCK-AT ?auto_148724 ?auto_148721 ) ( not ( = ?auto_148722 ?auto_148723 ) ) ( not ( = ?auto_148725 ?auto_148727 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_148722 ?auto_148721 )
      ( DELIVER-1PKG ?auto_148723 ?auto_148721 )
      ( DELIVER-2PKG-VERIFY ?auto_148722 ?auto_148723 ?auto_148721 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_148832 - OBJ
      ?auto_148833 - OBJ
      ?auto_148834 - OBJ
      ?auto_148831 - LOCATION
    )
    :vars
    (
      ?auto_148836 - LOCATION
      ?auto_148835 - CITY
      ?auto_148838 - LOCATION
      ?auto_148837 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148836 ?auto_148835 ) ( IN-CITY ?auto_148831 ?auto_148835 ) ( not ( = ?auto_148831 ?auto_148836 ) ) ( OBJ-AT ?auto_148834 ?auto_148836 ) ( IN-CITY ?auto_148838 ?auto_148835 ) ( not ( = ?auto_148831 ?auto_148838 ) ) ( OBJ-AT ?auto_148833 ?auto_148838 ) ( OBJ-AT ?auto_148832 ?auto_148836 ) ( TRUCK-AT ?auto_148837 ?auto_148831 ) ( not ( = ?auto_148832 ?auto_148833 ) ) ( not ( = ?auto_148838 ?auto_148836 ) ) ( not ( = ?auto_148832 ?auto_148834 ) ) ( not ( = ?auto_148833 ?auto_148834 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_148832 ?auto_148833 ?auto_148831 )
      ( DELIVER-1PKG ?auto_148834 ?auto_148831 )
      ( DELIVER-3PKG-VERIFY ?auto_148832 ?auto_148833 ?auto_148834 ?auto_148831 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_148849 - OBJ
      ?auto_148850 - OBJ
      ?auto_148851 - OBJ
      ?auto_148848 - LOCATION
    )
    :vars
    (
      ?auto_148852 - LOCATION
      ?auto_148854 - CITY
      ?auto_148855 - LOCATION
      ?auto_148853 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148852 ?auto_148854 ) ( IN-CITY ?auto_148848 ?auto_148854 ) ( not ( = ?auto_148848 ?auto_148852 ) ) ( OBJ-AT ?auto_148850 ?auto_148852 ) ( IN-CITY ?auto_148855 ?auto_148854 ) ( not ( = ?auto_148848 ?auto_148855 ) ) ( OBJ-AT ?auto_148851 ?auto_148855 ) ( OBJ-AT ?auto_148849 ?auto_148852 ) ( TRUCK-AT ?auto_148853 ?auto_148848 ) ( not ( = ?auto_148849 ?auto_148851 ) ) ( not ( = ?auto_148855 ?auto_148852 ) ) ( not ( = ?auto_148849 ?auto_148850 ) ) ( not ( = ?auto_148851 ?auto_148850 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_148849 ?auto_148851 ?auto_148850 ?auto_148848 )
      ( DELIVER-3PKG-VERIFY ?auto_148849 ?auto_148850 ?auto_148851 ?auto_148848 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_148866 - OBJ
      ?auto_148867 - OBJ
      ?auto_148868 - OBJ
      ?auto_148865 - LOCATION
    )
    :vars
    (
      ?auto_148872 - LOCATION
      ?auto_148869 - CITY
      ?auto_148870 - LOCATION
      ?auto_148871 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148872 ?auto_148869 ) ( IN-CITY ?auto_148865 ?auto_148869 ) ( not ( = ?auto_148865 ?auto_148872 ) ) ( OBJ-AT ?auto_148868 ?auto_148872 ) ( IN-CITY ?auto_148870 ?auto_148869 ) ( not ( = ?auto_148865 ?auto_148870 ) ) ( OBJ-AT ?auto_148866 ?auto_148870 ) ( OBJ-AT ?auto_148867 ?auto_148872 ) ( TRUCK-AT ?auto_148871 ?auto_148865 ) ( not ( = ?auto_148867 ?auto_148866 ) ) ( not ( = ?auto_148870 ?auto_148872 ) ) ( not ( = ?auto_148867 ?auto_148868 ) ) ( not ( = ?auto_148866 ?auto_148868 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_148867 ?auto_148868 ?auto_148866 ?auto_148865 )
      ( DELIVER-3PKG-VERIFY ?auto_148866 ?auto_148867 ?auto_148868 ?auto_148865 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149952 - OBJ
      ?auto_149953 - OBJ
      ?auto_149954 - OBJ
      ?auto_149955 - OBJ
      ?auto_149951 - LOCATION
    )
    :vars
    (
      ?auto_149958 - LOCATION
      ?auto_149957 - CITY
      ?auto_149959 - LOCATION
      ?auto_149956 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149958 ?auto_149957 ) ( IN-CITY ?auto_149951 ?auto_149957 ) ( not ( = ?auto_149951 ?auto_149958 ) ) ( OBJ-AT ?auto_149955 ?auto_149958 ) ( IN-CITY ?auto_149959 ?auto_149957 ) ( not ( = ?auto_149951 ?auto_149959 ) ) ( OBJ-AT ?auto_149954 ?auto_149959 ) ( OBJ-AT ?auto_149953 ?auto_149958 ) ( OBJ-AT ?auto_149952 ?auto_149959 ) ( TRUCK-AT ?auto_149956 ?auto_149951 ) ( not ( = ?auto_149952 ?auto_149953 ) ) ( not ( = ?auto_149958 ?auto_149959 ) ) ( not ( = ?auto_149952 ?auto_149954 ) ) ( not ( = ?auto_149953 ?auto_149954 ) ) ( not ( = ?auto_149952 ?auto_149955 ) ) ( not ( = ?auto_149953 ?auto_149955 ) ) ( not ( = ?auto_149954 ?auto_149955 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_149952 ?auto_149954 ?auto_149953 ?auto_149951 )
      ( DELIVER-1PKG ?auto_149955 ?auto_149951 )
      ( DELIVER-4PKG-VERIFY ?auto_149952 ?auto_149953 ?auto_149954 ?auto_149955 ?auto_149951 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149981 - OBJ
      ?auto_149982 - OBJ
      ?auto_149983 - OBJ
      ?auto_149984 - OBJ
      ?auto_149980 - LOCATION
    )
    :vars
    (
      ?auto_149987 - LOCATION
      ?auto_149985 - CITY
      ?auto_149986 - LOCATION
      ?auto_149988 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149987 ?auto_149985 ) ( IN-CITY ?auto_149980 ?auto_149985 ) ( not ( = ?auto_149980 ?auto_149987 ) ) ( OBJ-AT ?auto_149983 ?auto_149987 ) ( IN-CITY ?auto_149986 ?auto_149985 ) ( not ( = ?auto_149980 ?auto_149986 ) ) ( OBJ-AT ?auto_149984 ?auto_149986 ) ( OBJ-AT ?auto_149982 ?auto_149987 ) ( OBJ-AT ?auto_149981 ?auto_149986 ) ( TRUCK-AT ?auto_149988 ?auto_149980 ) ( not ( = ?auto_149981 ?auto_149982 ) ) ( not ( = ?auto_149987 ?auto_149986 ) ) ( not ( = ?auto_149981 ?auto_149984 ) ) ( not ( = ?auto_149982 ?auto_149984 ) ) ( not ( = ?auto_149981 ?auto_149983 ) ) ( not ( = ?auto_149982 ?auto_149983 ) ) ( not ( = ?auto_149984 ?auto_149983 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149981 ?auto_149982 ?auto_149984 ?auto_149983 ?auto_149980 )
      ( DELIVER-4PKG-VERIFY ?auto_149981 ?auto_149982 ?auto_149983 ?auto_149984 ?auto_149980 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_150010 - OBJ
      ?auto_150011 - OBJ
      ?auto_150012 - OBJ
      ?auto_150013 - OBJ
      ?auto_150009 - LOCATION
    )
    :vars
    (
      ?auto_150014 - LOCATION
      ?auto_150015 - CITY
      ?auto_150016 - LOCATION
      ?auto_150017 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_150014 ?auto_150015 ) ( IN-CITY ?auto_150009 ?auto_150015 ) ( not ( = ?auto_150009 ?auto_150014 ) ) ( OBJ-AT ?auto_150013 ?auto_150014 ) ( IN-CITY ?auto_150016 ?auto_150015 ) ( not ( = ?auto_150009 ?auto_150016 ) ) ( OBJ-AT ?auto_150011 ?auto_150016 ) ( OBJ-AT ?auto_150012 ?auto_150014 ) ( OBJ-AT ?auto_150010 ?auto_150016 ) ( TRUCK-AT ?auto_150017 ?auto_150009 ) ( not ( = ?auto_150010 ?auto_150012 ) ) ( not ( = ?auto_150014 ?auto_150016 ) ) ( not ( = ?auto_150010 ?auto_150011 ) ) ( not ( = ?auto_150012 ?auto_150011 ) ) ( not ( = ?auto_150010 ?auto_150013 ) ) ( not ( = ?auto_150012 ?auto_150013 ) ) ( not ( = ?auto_150011 ?auto_150013 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_150010 ?auto_150012 ?auto_150013 ?auto_150011 ?auto_150009 )
      ( DELIVER-4PKG-VERIFY ?auto_150010 ?auto_150011 ?auto_150012 ?auto_150013 ?auto_150009 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165120 - OBJ
      ?auto_165121 - OBJ
      ?auto_165122 - OBJ
      ?auto_165123 - OBJ
      ?auto_165124 - OBJ
      ?auto_165119 - LOCATION
    )
    :vars
    (
      ?auto_165127 - LOCATION
      ?auto_165125 - CITY
      ?auto_165128 - LOCATION
      ?auto_165126 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165127 ?auto_165125 ) ( IN-CITY ?auto_165119 ?auto_165125 ) ( not ( = ?auto_165119 ?auto_165127 ) ) ( OBJ-AT ?auto_165124 ?auto_165127 ) ( OBJ-AT ?auto_165123 ?auto_165127 ) ( IN-CITY ?auto_165128 ?auto_165125 ) ( not ( = ?auto_165119 ?auto_165128 ) ) ( OBJ-AT ?auto_165122 ?auto_165128 ) ( OBJ-AT ?auto_165121 ?auto_165127 ) ( OBJ-AT ?auto_165120 ?auto_165128 ) ( TRUCK-AT ?auto_165126 ?auto_165119 ) ( not ( = ?auto_165120 ?auto_165121 ) ) ( not ( = ?auto_165127 ?auto_165128 ) ) ( not ( = ?auto_165120 ?auto_165122 ) ) ( not ( = ?auto_165121 ?auto_165122 ) ) ( not ( = ?auto_165120 ?auto_165123 ) ) ( not ( = ?auto_165121 ?auto_165123 ) ) ( not ( = ?auto_165122 ?auto_165123 ) ) ( not ( = ?auto_165120 ?auto_165124 ) ) ( not ( = ?auto_165121 ?auto_165124 ) ) ( not ( = ?auto_165122 ?auto_165124 ) ) ( not ( = ?auto_165123 ?auto_165124 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_165120 ?auto_165121 ?auto_165123 ?auto_165122 ?auto_165119 )
      ( DELIVER-1PKG ?auto_165124 ?auto_165119 )
      ( DELIVER-5PKG-VERIFY ?auto_165120 ?auto_165121 ?auto_165122 ?auto_165123 ?auto_165124 ?auto_165119 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165202 - OBJ
      ?auto_165203 - OBJ
      ?auto_165204 - OBJ
      ?auto_165205 - OBJ
      ?auto_165206 - OBJ
      ?auto_165201 - LOCATION
    )
    :vars
    (
      ?auto_165209 - LOCATION
      ?auto_165210 - CITY
      ?auto_165208 - LOCATION
      ?auto_165207 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165209 ?auto_165210 ) ( IN-CITY ?auto_165201 ?auto_165210 ) ( not ( = ?auto_165201 ?auto_165209 ) ) ( OBJ-AT ?auto_165206 ?auto_165209 ) ( OBJ-AT ?auto_165204 ?auto_165209 ) ( IN-CITY ?auto_165208 ?auto_165210 ) ( not ( = ?auto_165201 ?auto_165208 ) ) ( OBJ-AT ?auto_165205 ?auto_165208 ) ( OBJ-AT ?auto_165203 ?auto_165209 ) ( OBJ-AT ?auto_165202 ?auto_165208 ) ( TRUCK-AT ?auto_165207 ?auto_165201 ) ( not ( = ?auto_165202 ?auto_165203 ) ) ( not ( = ?auto_165209 ?auto_165208 ) ) ( not ( = ?auto_165202 ?auto_165205 ) ) ( not ( = ?auto_165203 ?auto_165205 ) ) ( not ( = ?auto_165202 ?auto_165204 ) ) ( not ( = ?auto_165203 ?auto_165204 ) ) ( not ( = ?auto_165205 ?auto_165204 ) ) ( not ( = ?auto_165202 ?auto_165206 ) ) ( not ( = ?auto_165203 ?auto_165206 ) ) ( not ( = ?auto_165205 ?auto_165206 ) ) ( not ( = ?auto_165204 ?auto_165206 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_165202 ?auto_165203 ?auto_165205 ?auto_165204 ?auto_165206 ?auto_165201 )
      ( DELIVER-5PKG-VERIFY ?auto_165202 ?auto_165203 ?auto_165204 ?auto_165205 ?auto_165206 ?auto_165201 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165245 - OBJ
      ?auto_165246 - OBJ
      ?auto_165247 - OBJ
      ?auto_165248 - OBJ
      ?auto_165249 - OBJ
      ?auto_165244 - LOCATION
    )
    :vars
    (
      ?auto_165251 - LOCATION
      ?auto_165252 - CITY
      ?auto_165253 - LOCATION
      ?auto_165250 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165251 ?auto_165252 ) ( IN-CITY ?auto_165244 ?auto_165252 ) ( not ( = ?auto_165244 ?auto_165251 ) ) ( OBJ-AT ?auto_165248 ?auto_165251 ) ( OBJ-AT ?auto_165247 ?auto_165251 ) ( IN-CITY ?auto_165253 ?auto_165252 ) ( not ( = ?auto_165244 ?auto_165253 ) ) ( OBJ-AT ?auto_165249 ?auto_165253 ) ( OBJ-AT ?auto_165246 ?auto_165251 ) ( OBJ-AT ?auto_165245 ?auto_165253 ) ( TRUCK-AT ?auto_165250 ?auto_165244 ) ( not ( = ?auto_165245 ?auto_165246 ) ) ( not ( = ?auto_165251 ?auto_165253 ) ) ( not ( = ?auto_165245 ?auto_165249 ) ) ( not ( = ?auto_165246 ?auto_165249 ) ) ( not ( = ?auto_165245 ?auto_165247 ) ) ( not ( = ?auto_165246 ?auto_165247 ) ) ( not ( = ?auto_165249 ?auto_165247 ) ) ( not ( = ?auto_165245 ?auto_165248 ) ) ( not ( = ?auto_165246 ?auto_165248 ) ) ( not ( = ?auto_165249 ?auto_165248 ) ) ( not ( = ?auto_165247 ?auto_165248 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_165245 ?auto_165246 ?auto_165247 ?auto_165249 ?auto_165248 ?auto_165244 )
      ( DELIVER-5PKG-VERIFY ?auto_165245 ?auto_165246 ?auto_165247 ?auto_165248 ?auto_165249 ?auto_165244 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165688 - OBJ
      ?auto_165689 - OBJ
      ?auto_165690 - OBJ
      ?auto_165691 - OBJ
      ?auto_165692 - OBJ
      ?auto_165687 - LOCATION
    )
    :vars
    (
      ?auto_165694 - LOCATION
      ?auto_165695 - CITY
      ?auto_165696 - LOCATION
      ?auto_165693 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165694 ?auto_165695 ) ( IN-CITY ?auto_165687 ?auto_165695 ) ( not ( = ?auto_165687 ?auto_165694 ) ) ( OBJ-AT ?auto_165692 ?auto_165694 ) ( OBJ-AT ?auto_165691 ?auto_165694 ) ( IN-CITY ?auto_165696 ?auto_165695 ) ( not ( = ?auto_165687 ?auto_165696 ) ) ( OBJ-AT ?auto_165689 ?auto_165696 ) ( OBJ-AT ?auto_165690 ?auto_165694 ) ( OBJ-AT ?auto_165688 ?auto_165696 ) ( TRUCK-AT ?auto_165693 ?auto_165687 ) ( not ( = ?auto_165688 ?auto_165690 ) ) ( not ( = ?auto_165694 ?auto_165696 ) ) ( not ( = ?auto_165688 ?auto_165689 ) ) ( not ( = ?auto_165690 ?auto_165689 ) ) ( not ( = ?auto_165688 ?auto_165691 ) ) ( not ( = ?auto_165690 ?auto_165691 ) ) ( not ( = ?auto_165689 ?auto_165691 ) ) ( not ( = ?auto_165688 ?auto_165692 ) ) ( not ( = ?auto_165690 ?auto_165692 ) ) ( not ( = ?auto_165689 ?auto_165692 ) ) ( not ( = ?auto_165691 ?auto_165692 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_165688 ?auto_165690 ?auto_165691 ?auto_165689 ?auto_165692 ?auto_165687 )
      ( DELIVER-5PKG-VERIFY ?auto_165688 ?auto_165689 ?auto_165690 ?auto_165691 ?auto_165692 ?auto_165687 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_168534 - OBJ
      ?auto_168535 - OBJ
      ?auto_168536 - OBJ
      ?auto_168537 - OBJ
      ?auto_168538 - OBJ
      ?auto_168533 - LOCATION
    )
    :vars
    (
      ?auto_168540 - LOCATION
      ?auto_168541 - CITY
      ?auto_168542 - LOCATION
      ?auto_168539 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_168540 ?auto_168541 ) ( IN-CITY ?auto_168533 ?auto_168541 ) ( not ( = ?auto_168533 ?auto_168540 ) ) ( OBJ-AT ?auto_168538 ?auto_168540 ) ( OBJ-AT ?auto_168537 ?auto_168540 ) ( IN-CITY ?auto_168542 ?auto_168541 ) ( not ( = ?auto_168533 ?auto_168542 ) ) ( OBJ-AT ?auto_168536 ?auto_168542 ) ( OBJ-AT ?auto_168534 ?auto_168540 ) ( OBJ-AT ?auto_168535 ?auto_168542 ) ( TRUCK-AT ?auto_168539 ?auto_168533 ) ( not ( = ?auto_168535 ?auto_168534 ) ) ( not ( = ?auto_168540 ?auto_168542 ) ) ( not ( = ?auto_168535 ?auto_168536 ) ) ( not ( = ?auto_168534 ?auto_168536 ) ) ( not ( = ?auto_168535 ?auto_168537 ) ) ( not ( = ?auto_168534 ?auto_168537 ) ) ( not ( = ?auto_168536 ?auto_168537 ) ) ( not ( = ?auto_168535 ?auto_168538 ) ) ( not ( = ?auto_168534 ?auto_168538 ) ) ( not ( = ?auto_168536 ?auto_168538 ) ) ( not ( = ?auto_168537 ?auto_168538 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_168535 ?auto_168534 ?auto_168537 ?auto_168536 ?auto_168538 ?auto_168533 )
      ( DELIVER-5PKG-VERIFY ?auto_168534 ?auto_168535 ?auto_168536 ?auto_168537 ?auto_168538 ?auto_168533 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_168616 - OBJ
      ?auto_168617 - OBJ
      ?auto_168618 - OBJ
      ?auto_168619 - OBJ
      ?auto_168620 - OBJ
      ?auto_168615 - LOCATION
    )
    :vars
    (
      ?auto_168622 - LOCATION
      ?auto_168623 - CITY
      ?auto_168624 - LOCATION
      ?auto_168621 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_168622 ?auto_168623 ) ( IN-CITY ?auto_168615 ?auto_168623 ) ( not ( = ?auto_168615 ?auto_168622 ) ) ( OBJ-AT ?auto_168620 ?auto_168622 ) ( OBJ-AT ?auto_168618 ?auto_168622 ) ( IN-CITY ?auto_168624 ?auto_168623 ) ( not ( = ?auto_168615 ?auto_168624 ) ) ( OBJ-AT ?auto_168619 ?auto_168624 ) ( OBJ-AT ?auto_168616 ?auto_168622 ) ( OBJ-AT ?auto_168617 ?auto_168624 ) ( TRUCK-AT ?auto_168621 ?auto_168615 ) ( not ( = ?auto_168617 ?auto_168616 ) ) ( not ( = ?auto_168622 ?auto_168624 ) ) ( not ( = ?auto_168617 ?auto_168619 ) ) ( not ( = ?auto_168616 ?auto_168619 ) ) ( not ( = ?auto_168617 ?auto_168618 ) ) ( not ( = ?auto_168616 ?auto_168618 ) ) ( not ( = ?auto_168619 ?auto_168618 ) ) ( not ( = ?auto_168617 ?auto_168620 ) ) ( not ( = ?auto_168616 ?auto_168620 ) ) ( not ( = ?auto_168619 ?auto_168620 ) ) ( not ( = ?auto_168618 ?auto_168620 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_168617 ?auto_168616 ?auto_168618 ?auto_168619 ?auto_168620 ?auto_168615 )
      ( DELIVER-5PKG-VERIFY ?auto_168616 ?auto_168617 ?auto_168618 ?auto_168619 ?auto_168620 ?auto_168615 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_168659 - OBJ
      ?auto_168660 - OBJ
      ?auto_168661 - OBJ
      ?auto_168662 - OBJ
      ?auto_168663 - OBJ
      ?auto_168658 - LOCATION
    )
    :vars
    (
      ?auto_168665 - LOCATION
      ?auto_168666 - CITY
      ?auto_168667 - LOCATION
      ?auto_168664 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_168665 ?auto_168666 ) ( IN-CITY ?auto_168658 ?auto_168666 ) ( not ( = ?auto_168658 ?auto_168665 ) ) ( OBJ-AT ?auto_168662 ?auto_168665 ) ( OBJ-AT ?auto_168661 ?auto_168665 ) ( IN-CITY ?auto_168667 ?auto_168666 ) ( not ( = ?auto_168658 ?auto_168667 ) ) ( OBJ-AT ?auto_168663 ?auto_168667 ) ( OBJ-AT ?auto_168659 ?auto_168665 ) ( OBJ-AT ?auto_168660 ?auto_168667 ) ( TRUCK-AT ?auto_168664 ?auto_168658 ) ( not ( = ?auto_168660 ?auto_168659 ) ) ( not ( = ?auto_168665 ?auto_168667 ) ) ( not ( = ?auto_168660 ?auto_168663 ) ) ( not ( = ?auto_168659 ?auto_168663 ) ) ( not ( = ?auto_168660 ?auto_168661 ) ) ( not ( = ?auto_168659 ?auto_168661 ) ) ( not ( = ?auto_168663 ?auto_168661 ) ) ( not ( = ?auto_168660 ?auto_168662 ) ) ( not ( = ?auto_168659 ?auto_168662 ) ) ( not ( = ?auto_168663 ?auto_168662 ) ) ( not ( = ?auto_168661 ?auto_168662 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_168660 ?auto_168659 ?auto_168661 ?auto_168663 ?auto_168662 ?auto_168658 )
      ( DELIVER-5PKG-VERIFY ?auto_168659 ?auto_168660 ?auto_168661 ?auto_168662 ?auto_168663 ?auto_168658 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170368 - OBJ
      ?auto_170369 - OBJ
      ?auto_170370 - OBJ
      ?auto_170371 - OBJ
      ?auto_170372 - OBJ
      ?auto_170367 - LOCATION
    )
    :vars
    (
      ?auto_170374 - LOCATION
      ?auto_170375 - CITY
      ?auto_170376 - LOCATION
      ?auto_170373 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170374 ?auto_170375 ) ( IN-CITY ?auto_170367 ?auto_170375 ) ( not ( = ?auto_170367 ?auto_170374 ) ) ( OBJ-AT ?auto_170372 ?auto_170374 ) ( OBJ-AT ?auto_170369 ?auto_170374 ) ( IN-CITY ?auto_170376 ?auto_170375 ) ( not ( = ?auto_170367 ?auto_170376 ) ) ( OBJ-AT ?auto_170371 ?auto_170376 ) ( OBJ-AT ?auto_170368 ?auto_170374 ) ( OBJ-AT ?auto_170370 ?auto_170376 ) ( TRUCK-AT ?auto_170373 ?auto_170367 ) ( not ( = ?auto_170370 ?auto_170368 ) ) ( not ( = ?auto_170374 ?auto_170376 ) ) ( not ( = ?auto_170370 ?auto_170371 ) ) ( not ( = ?auto_170368 ?auto_170371 ) ) ( not ( = ?auto_170370 ?auto_170369 ) ) ( not ( = ?auto_170368 ?auto_170369 ) ) ( not ( = ?auto_170371 ?auto_170369 ) ) ( not ( = ?auto_170370 ?auto_170372 ) ) ( not ( = ?auto_170368 ?auto_170372 ) ) ( not ( = ?auto_170371 ?auto_170372 ) ) ( not ( = ?auto_170369 ?auto_170372 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170370 ?auto_170368 ?auto_170369 ?auto_170371 ?auto_170372 ?auto_170367 )
      ( DELIVER-5PKG-VERIFY ?auto_170368 ?auto_170369 ?auto_170370 ?auto_170371 ?auto_170372 ?auto_170367 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170411 - OBJ
      ?auto_170412 - OBJ
      ?auto_170413 - OBJ
      ?auto_170414 - OBJ
      ?auto_170415 - OBJ
      ?auto_170410 - LOCATION
    )
    :vars
    (
      ?auto_170417 - LOCATION
      ?auto_170418 - CITY
      ?auto_170419 - LOCATION
      ?auto_170416 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170417 ?auto_170418 ) ( IN-CITY ?auto_170410 ?auto_170418 ) ( not ( = ?auto_170410 ?auto_170417 ) ) ( OBJ-AT ?auto_170414 ?auto_170417 ) ( OBJ-AT ?auto_170412 ?auto_170417 ) ( IN-CITY ?auto_170419 ?auto_170418 ) ( not ( = ?auto_170410 ?auto_170419 ) ) ( OBJ-AT ?auto_170415 ?auto_170419 ) ( OBJ-AT ?auto_170411 ?auto_170417 ) ( OBJ-AT ?auto_170413 ?auto_170419 ) ( TRUCK-AT ?auto_170416 ?auto_170410 ) ( not ( = ?auto_170413 ?auto_170411 ) ) ( not ( = ?auto_170417 ?auto_170419 ) ) ( not ( = ?auto_170413 ?auto_170415 ) ) ( not ( = ?auto_170411 ?auto_170415 ) ) ( not ( = ?auto_170413 ?auto_170412 ) ) ( not ( = ?auto_170411 ?auto_170412 ) ) ( not ( = ?auto_170415 ?auto_170412 ) ) ( not ( = ?auto_170413 ?auto_170414 ) ) ( not ( = ?auto_170411 ?auto_170414 ) ) ( not ( = ?auto_170415 ?auto_170414 ) ) ( not ( = ?auto_170412 ?auto_170414 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170413 ?auto_170411 ?auto_170412 ?auto_170415 ?auto_170414 ?auto_170410 )
      ( DELIVER-5PKG-VERIFY ?auto_170411 ?auto_170412 ?auto_170413 ?auto_170414 ?auto_170415 ?auto_170410 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170762 - OBJ
      ?auto_170763 - OBJ
      ?auto_170764 - OBJ
      ?auto_170765 - OBJ
      ?auto_170766 - OBJ
      ?auto_170761 - LOCATION
    )
    :vars
    (
      ?auto_170768 - LOCATION
      ?auto_170769 - CITY
      ?auto_170770 - LOCATION
      ?auto_170767 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170768 ?auto_170769 ) ( IN-CITY ?auto_170761 ?auto_170769 ) ( not ( = ?auto_170761 ?auto_170768 ) ) ( OBJ-AT ?auto_170764 ?auto_170768 ) ( OBJ-AT ?auto_170763 ?auto_170768 ) ( IN-CITY ?auto_170770 ?auto_170769 ) ( not ( = ?auto_170761 ?auto_170770 ) ) ( OBJ-AT ?auto_170766 ?auto_170770 ) ( OBJ-AT ?auto_170762 ?auto_170768 ) ( OBJ-AT ?auto_170765 ?auto_170770 ) ( TRUCK-AT ?auto_170767 ?auto_170761 ) ( not ( = ?auto_170765 ?auto_170762 ) ) ( not ( = ?auto_170768 ?auto_170770 ) ) ( not ( = ?auto_170765 ?auto_170766 ) ) ( not ( = ?auto_170762 ?auto_170766 ) ) ( not ( = ?auto_170765 ?auto_170763 ) ) ( not ( = ?auto_170762 ?auto_170763 ) ) ( not ( = ?auto_170766 ?auto_170763 ) ) ( not ( = ?auto_170765 ?auto_170764 ) ) ( not ( = ?auto_170762 ?auto_170764 ) ) ( not ( = ?auto_170766 ?auto_170764 ) ) ( not ( = ?auto_170763 ?auto_170764 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170765 ?auto_170762 ?auto_170763 ?auto_170766 ?auto_170764 ?auto_170761 )
      ( DELIVER-5PKG-VERIFY ?auto_170762 ?auto_170763 ?auto_170764 ?auto_170765 ?auto_170766 ?auto_170761 ) )
  )

)

