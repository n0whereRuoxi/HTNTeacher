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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135884 - OBJ
      ?auto_135883 - LOCATION
    )
    :vars
    (
      ?auto_135885 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135885 ?auto_135883 ) ( IN-TRUCK ?auto_135884 ?auto_135885 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_135884 ?auto_135885 ?auto_135883 )
      ( DELIVER-1PKG-VERIFY ?auto_135884 ?auto_135883 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135902 - OBJ
      ?auto_135901 - LOCATION
    )
    :vars
    (
      ?auto_135903 - TRUCK
      ?auto_135904 - LOCATION
      ?auto_135905 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135902 ?auto_135903 ) ( TRUCK-AT ?auto_135903 ?auto_135904 ) ( IN-CITY ?auto_135904 ?auto_135905 ) ( IN-CITY ?auto_135901 ?auto_135905 ) ( not ( = ?auto_135901 ?auto_135904 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_135903 ?auto_135904 ?auto_135901 ?auto_135905 )
      ( DELIVER-1PKG ?auto_135902 ?auto_135901 )
      ( DELIVER-1PKG-VERIFY ?auto_135902 ?auto_135901 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135928 - OBJ
      ?auto_135927 - LOCATION
    )
    :vars
    (
      ?auto_135931 - TRUCK
      ?auto_135930 - LOCATION
      ?auto_135929 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135931 ?auto_135930 ) ( IN-CITY ?auto_135930 ?auto_135929 ) ( IN-CITY ?auto_135927 ?auto_135929 ) ( not ( = ?auto_135927 ?auto_135930 ) ) ( OBJ-AT ?auto_135928 ?auto_135930 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_135928 ?auto_135931 ?auto_135930 )
      ( DELIVER-1PKG ?auto_135928 ?auto_135927 )
      ( DELIVER-1PKG-VERIFY ?auto_135928 ?auto_135927 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135954 - OBJ
      ?auto_135953 - LOCATION
    )
    :vars
    (
      ?auto_135955 - LOCATION
      ?auto_135957 - CITY
      ?auto_135956 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135955 ?auto_135957 ) ( IN-CITY ?auto_135953 ?auto_135957 ) ( not ( = ?auto_135953 ?auto_135955 ) ) ( OBJ-AT ?auto_135954 ?auto_135955 ) ( TRUCK-AT ?auto_135956 ?auto_135953 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_135956 ?auto_135953 ?auto_135955 ?auto_135957 )
      ( DELIVER-1PKG ?auto_135954 ?auto_135953 )
      ( DELIVER-1PKG-VERIFY ?auto_135954 ?auto_135953 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136097 - OBJ
      ?auto_136098 - OBJ
      ?auto_136096 - LOCATION
    )
    :vars
    (
      ?auto_136099 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_136098 ?auto_136097 ) ) ( TRUCK-AT ?auto_136099 ?auto_136096 ) ( IN-TRUCK ?auto_136098 ?auto_136099 ) ( OBJ-AT ?auto_136097 ?auto_136096 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136098 ?auto_136096 )
      ( DELIVER-2PKG-VERIFY ?auto_136097 ?auto_136098 ?auto_136096 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136101 - OBJ
      ?auto_136102 - OBJ
      ?auto_136100 - LOCATION
    )
    :vars
    (
      ?auto_136103 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_136102 ?auto_136101 ) ) ( TRUCK-AT ?auto_136103 ?auto_136100 ) ( IN-TRUCK ?auto_136101 ?auto_136103 ) ( OBJ-AT ?auto_136102 ?auto_136100 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136101 ?auto_136100 )
      ( DELIVER-2PKG-VERIFY ?auto_136101 ?auto_136102 ?auto_136100 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136239 - OBJ
      ?auto_136240 - OBJ
      ?auto_136238 - LOCATION
    )
    :vars
    (
      ?auto_136241 - TRUCK
      ?auto_136242 - LOCATION
      ?auto_136243 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_136240 ?auto_136239 ) ) ( IN-TRUCK ?auto_136240 ?auto_136241 ) ( TRUCK-AT ?auto_136241 ?auto_136242 ) ( IN-CITY ?auto_136242 ?auto_136243 ) ( IN-CITY ?auto_136238 ?auto_136243 ) ( not ( = ?auto_136238 ?auto_136242 ) ) ( OBJ-AT ?auto_136239 ?auto_136238 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136240 ?auto_136238 )
      ( DELIVER-2PKG-VERIFY ?auto_136239 ?auto_136240 ?auto_136238 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136245 - OBJ
      ?auto_136246 - OBJ
      ?auto_136244 - LOCATION
    )
    :vars
    (
      ?auto_136249 - TRUCK
      ?auto_136248 - LOCATION
      ?auto_136247 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_136246 ?auto_136245 ) ) ( IN-TRUCK ?auto_136245 ?auto_136249 ) ( TRUCK-AT ?auto_136249 ?auto_136248 ) ( IN-CITY ?auto_136248 ?auto_136247 ) ( IN-CITY ?auto_136244 ?auto_136247 ) ( not ( = ?auto_136244 ?auto_136248 ) ) ( OBJ-AT ?auto_136246 ?auto_136244 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136246 ?auto_136245 ?auto_136244 )
      ( DELIVER-2PKG-VERIFY ?auto_136245 ?auto_136246 ?auto_136244 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_136429 - OBJ
      ?auto_136428 - LOCATION
    )
    :vars
    (
      ?auto_136432 - OBJ
      ?auto_136433 - TRUCK
      ?auto_136431 - LOCATION
      ?auto_136430 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_136429 ?auto_136432 ) ) ( TRUCK-AT ?auto_136433 ?auto_136431 ) ( IN-CITY ?auto_136431 ?auto_136430 ) ( IN-CITY ?auto_136428 ?auto_136430 ) ( not ( = ?auto_136428 ?auto_136431 ) ) ( OBJ-AT ?auto_136432 ?auto_136428 ) ( OBJ-AT ?auto_136429 ?auto_136431 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_136429 ?auto_136433 ?auto_136431 )
      ( DELIVER-2PKG ?auto_136432 ?auto_136429 ?auto_136428 )
      ( DELIVER-1PKG-VERIFY ?auto_136429 ?auto_136428 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136435 - OBJ
      ?auto_136436 - OBJ
      ?auto_136434 - LOCATION
    )
    :vars
    (
      ?auto_136437 - TRUCK
      ?auto_136439 - LOCATION
      ?auto_136438 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_136436 ?auto_136435 ) ) ( TRUCK-AT ?auto_136437 ?auto_136439 ) ( IN-CITY ?auto_136439 ?auto_136438 ) ( IN-CITY ?auto_136434 ?auto_136438 ) ( not ( = ?auto_136434 ?auto_136439 ) ) ( OBJ-AT ?auto_136435 ?auto_136434 ) ( OBJ-AT ?auto_136436 ?auto_136439 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136436 ?auto_136434 )
      ( DELIVER-2PKG-VERIFY ?auto_136435 ?auto_136436 ?auto_136434 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136441 - OBJ
      ?auto_136442 - OBJ
      ?auto_136440 - LOCATION
    )
    :vars
    (
      ?auto_136443 - TRUCK
      ?auto_136445 - LOCATION
      ?auto_136444 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_136442 ?auto_136441 ) ) ( TRUCK-AT ?auto_136443 ?auto_136445 ) ( IN-CITY ?auto_136445 ?auto_136444 ) ( IN-CITY ?auto_136440 ?auto_136444 ) ( not ( = ?auto_136440 ?auto_136445 ) ) ( OBJ-AT ?auto_136442 ?auto_136440 ) ( OBJ-AT ?auto_136441 ?auto_136445 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136442 ?auto_136441 ?auto_136440 )
      ( DELIVER-2PKG-VERIFY ?auto_136441 ?auto_136442 ?auto_136440 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_136625 - OBJ
      ?auto_136624 - LOCATION
    )
    :vars
    (
      ?auto_136627 - OBJ
      ?auto_136629 - LOCATION
      ?auto_136628 - CITY
      ?auto_136626 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_136625 ?auto_136627 ) ) ( IN-CITY ?auto_136629 ?auto_136628 ) ( IN-CITY ?auto_136624 ?auto_136628 ) ( not ( = ?auto_136624 ?auto_136629 ) ) ( OBJ-AT ?auto_136627 ?auto_136624 ) ( OBJ-AT ?auto_136625 ?auto_136629 ) ( TRUCK-AT ?auto_136626 ?auto_136624 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_136626 ?auto_136624 ?auto_136629 ?auto_136628 )
      ( DELIVER-2PKG ?auto_136627 ?auto_136625 ?auto_136624 )
      ( DELIVER-1PKG-VERIFY ?auto_136625 ?auto_136624 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136631 - OBJ
      ?auto_136632 - OBJ
      ?auto_136630 - LOCATION
    )
    :vars
    (
      ?auto_136635 - LOCATION
      ?auto_136634 - CITY
      ?auto_136633 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_136632 ?auto_136631 ) ) ( IN-CITY ?auto_136635 ?auto_136634 ) ( IN-CITY ?auto_136630 ?auto_136634 ) ( not ( = ?auto_136630 ?auto_136635 ) ) ( OBJ-AT ?auto_136631 ?auto_136630 ) ( OBJ-AT ?auto_136632 ?auto_136635 ) ( TRUCK-AT ?auto_136633 ?auto_136630 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136632 ?auto_136630 )
      ( DELIVER-2PKG-VERIFY ?auto_136631 ?auto_136632 ?auto_136630 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136637 - OBJ
      ?auto_136638 - OBJ
      ?auto_136636 - LOCATION
    )
    :vars
    (
      ?auto_136639 - LOCATION
      ?auto_136640 - CITY
      ?auto_136641 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_136638 ?auto_136637 ) ) ( IN-CITY ?auto_136639 ?auto_136640 ) ( IN-CITY ?auto_136636 ?auto_136640 ) ( not ( = ?auto_136636 ?auto_136639 ) ) ( OBJ-AT ?auto_136638 ?auto_136636 ) ( OBJ-AT ?auto_136637 ?auto_136639 ) ( TRUCK-AT ?auto_136641 ?auto_136636 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136638 ?auto_136637 ?auto_136636 )
      ( DELIVER-2PKG-VERIFY ?auto_136637 ?auto_136638 ?auto_136636 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_136821 - OBJ
      ?auto_136820 - LOCATION
    )
    :vars
    (
      ?auto_136825 - OBJ
      ?auto_136822 - LOCATION
      ?auto_136823 - CITY
      ?auto_136824 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_136821 ?auto_136825 ) ) ( IN-CITY ?auto_136822 ?auto_136823 ) ( IN-CITY ?auto_136820 ?auto_136823 ) ( not ( = ?auto_136820 ?auto_136822 ) ) ( OBJ-AT ?auto_136821 ?auto_136822 ) ( TRUCK-AT ?auto_136824 ?auto_136820 ) ( IN-TRUCK ?auto_136825 ?auto_136824 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136825 ?auto_136820 )
      ( DELIVER-2PKG ?auto_136825 ?auto_136821 ?auto_136820 )
      ( DELIVER-1PKG-VERIFY ?auto_136821 ?auto_136820 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136827 - OBJ
      ?auto_136828 - OBJ
      ?auto_136826 - LOCATION
    )
    :vars
    (
      ?auto_136830 - LOCATION
      ?auto_136831 - CITY
      ?auto_136829 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_136828 ?auto_136827 ) ) ( IN-CITY ?auto_136830 ?auto_136831 ) ( IN-CITY ?auto_136826 ?auto_136831 ) ( not ( = ?auto_136826 ?auto_136830 ) ) ( OBJ-AT ?auto_136828 ?auto_136830 ) ( TRUCK-AT ?auto_136829 ?auto_136826 ) ( IN-TRUCK ?auto_136827 ?auto_136829 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136828 ?auto_136826 )
      ( DELIVER-2PKG-VERIFY ?auto_136827 ?auto_136828 ?auto_136826 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136833 - OBJ
      ?auto_136834 - OBJ
      ?auto_136832 - LOCATION
    )
    :vars
    (
      ?auto_136836 - LOCATION
      ?auto_136835 - CITY
      ?auto_136837 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_136834 ?auto_136833 ) ) ( IN-CITY ?auto_136836 ?auto_136835 ) ( IN-CITY ?auto_136832 ?auto_136835 ) ( not ( = ?auto_136832 ?auto_136836 ) ) ( OBJ-AT ?auto_136833 ?auto_136836 ) ( TRUCK-AT ?auto_136837 ?auto_136832 ) ( IN-TRUCK ?auto_136834 ?auto_136837 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136834 ?auto_136833 ?auto_136832 )
      ( DELIVER-2PKG-VERIFY ?auto_136833 ?auto_136834 ?auto_136832 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_137017 - OBJ
      ?auto_137016 - LOCATION
    )
    :vars
    (
      ?auto_137021 - OBJ
      ?auto_137019 - LOCATION
      ?auto_137018 - CITY
      ?auto_137020 - TRUCK
      ?auto_137022 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_137017 ?auto_137021 ) ) ( IN-CITY ?auto_137019 ?auto_137018 ) ( IN-CITY ?auto_137016 ?auto_137018 ) ( not ( = ?auto_137016 ?auto_137019 ) ) ( OBJ-AT ?auto_137017 ?auto_137019 ) ( IN-TRUCK ?auto_137021 ?auto_137020 ) ( TRUCK-AT ?auto_137020 ?auto_137022 ) ( IN-CITY ?auto_137022 ?auto_137018 ) ( not ( = ?auto_137016 ?auto_137022 ) ) ( not ( = ?auto_137019 ?auto_137022 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_137020 ?auto_137022 ?auto_137016 ?auto_137018 )
      ( DELIVER-2PKG ?auto_137021 ?auto_137017 ?auto_137016 )
      ( DELIVER-1PKG-VERIFY ?auto_137017 ?auto_137016 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_137024 - OBJ
      ?auto_137025 - OBJ
      ?auto_137023 - LOCATION
    )
    :vars
    (
      ?auto_137027 - LOCATION
      ?auto_137026 - CITY
      ?auto_137028 - TRUCK
      ?auto_137029 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_137025 ?auto_137024 ) ) ( IN-CITY ?auto_137027 ?auto_137026 ) ( IN-CITY ?auto_137023 ?auto_137026 ) ( not ( = ?auto_137023 ?auto_137027 ) ) ( OBJ-AT ?auto_137025 ?auto_137027 ) ( IN-TRUCK ?auto_137024 ?auto_137028 ) ( TRUCK-AT ?auto_137028 ?auto_137029 ) ( IN-CITY ?auto_137029 ?auto_137026 ) ( not ( = ?auto_137023 ?auto_137029 ) ) ( not ( = ?auto_137027 ?auto_137029 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_137025 ?auto_137023 )
      ( DELIVER-2PKG-VERIFY ?auto_137024 ?auto_137025 ?auto_137023 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_137031 - OBJ
      ?auto_137032 - OBJ
      ?auto_137030 - LOCATION
    )
    :vars
    (
      ?auto_137036 - LOCATION
      ?auto_137035 - CITY
      ?auto_137034 - TRUCK
      ?auto_137033 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_137032 ?auto_137031 ) ) ( IN-CITY ?auto_137036 ?auto_137035 ) ( IN-CITY ?auto_137030 ?auto_137035 ) ( not ( = ?auto_137030 ?auto_137036 ) ) ( OBJ-AT ?auto_137031 ?auto_137036 ) ( IN-TRUCK ?auto_137032 ?auto_137034 ) ( TRUCK-AT ?auto_137034 ?auto_137033 ) ( IN-CITY ?auto_137033 ?auto_137035 ) ( not ( = ?auto_137030 ?auto_137033 ) ) ( not ( = ?auto_137036 ?auto_137033 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137032 ?auto_137031 ?auto_137030 )
      ( DELIVER-2PKG-VERIFY ?auto_137031 ?auto_137032 ?auto_137030 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_137239 - OBJ
      ?auto_137238 - LOCATION
    )
    :vars
    (
      ?auto_137242 - OBJ
      ?auto_137244 - LOCATION
      ?auto_137243 - CITY
      ?auto_137241 - TRUCK
      ?auto_137240 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_137239 ?auto_137242 ) ) ( IN-CITY ?auto_137244 ?auto_137243 ) ( IN-CITY ?auto_137238 ?auto_137243 ) ( not ( = ?auto_137238 ?auto_137244 ) ) ( OBJ-AT ?auto_137239 ?auto_137244 ) ( TRUCK-AT ?auto_137241 ?auto_137240 ) ( IN-CITY ?auto_137240 ?auto_137243 ) ( not ( = ?auto_137238 ?auto_137240 ) ) ( not ( = ?auto_137244 ?auto_137240 ) ) ( OBJ-AT ?auto_137242 ?auto_137240 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_137242 ?auto_137241 ?auto_137240 )
      ( DELIVER-2PKG ?auto_137242 ?auto_137239 ?auto_137238 )
      ( DELIVER-1PKG-VERIFY ?auto_137239 ?auto_137238 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_137246 - OBJ
      ?auto_137247 - OBJ
      ?auto_137245 - LOCATION
    )
    :vars
    (
      ?auto_137249 - LOCATION
      ?auto_137251 - CITY
      ?auto_137248 - TRUCK
      ?auto_137250 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_137247 ?auto_137246 ) ) ( IN-CITY ?auto_137249 ?auto_137251 ) ( IN-CITY ?auto_137245 ?auto_137251 ) ( not ( = ?auto_137245 ?auto_137249 ) ) ( OBJ-AT ?auto_137247 ?auto_137249 ) ( TRUCK-AT ?auto_137248 ?auto_137250 ) ( IN-CITY ?auto_137250 ?auto_137251 ) ( not ( = ?auto_137245 ?auto_137250 ) ) ( not ( = ?auto_137249 ?auto_137250 ) ) ( OBJ-AT ?auto_137246 ?auto_137250 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_137247 ?auto_137245 )
      ( DELIVER-2PKG-VERIFY ?auto_137246 ?auto_137247 ?auto_137245 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_137253 - OBJ
      ?auto_137254 - OBJ
      ?auto_137252 - LOCATION
    )
    :vars
    (
      ?auto_137256 - LOCATION
      ?auto_137258 - CITY
      ?auto_137255 - TRUCK
      ?auto_137257 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_137254 ?auto_137253 ) ) ( IN-CITY ?auto_137256 ?auto_137258 ) ( IN-CITY ?auto_137252 ?auto_137258 ) ( not ( = ?auto_137252 ?auto_137256 ) ) ( OBJ-AT ?auto_137253 ?auto_137256 ) ( TRUCK-AT ?auto_137255 ?auto_137257 ) ( IN-CITY ?auto_137257 ?auto_137258 ) ( not ( = ?auto_137252 ?auto_137257 ) ) ( not ( = ?auto_137256 ?auto_137257 ) ) ( OBJ-AT ?auto_137254 ?auto_137257 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137254 ?auto_137253 ?auto_137252 )
      ( DELIVER-2PKG-VERIFY ?auto_137253 ?auto_137254 ?auto_137252 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138094 - OBJ
      ?auto_138095 - OBJ
      ?auto_138096 - OBJ
      ?auto_138093 - LOCATION
    )
    :vars
    (
      ?auto_138097 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_138095 ?auto_138094 ) ) ( not ( = ?auto_138096 ?auto_138094 ) ) ( not ( = ?auto_138096 ?auto_138095 ) ) ( TRUCK-AT ?auto_138097 ?auto_138093 ) ( IN-TRUCK ?auto_138096 ?auto_138097 ) ( OBJ-AT ?auto_138094 ?auto_138093 ) ( OBJ-AT ?auto_138095 ?auto_138093 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_138096 ?auto_138093 )
      ( DELIVER-3PKG-VERIFY ?auto_138094 ?auto_138095 ?auto_138096 ?auto_138093 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138104 - OBJ
      ?auto_138105 - OBJ
      ?auto_138106 - OBJ
      ?auto_138103 - LOCATION
    )
    :vars
    (
      ?auto_138107 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_138105 ?auto_138104 ) ) ( not ( = ?auto_138106 ?auto_138104 ) ) ( not ( = ?auto_138106 ?auto_138105 ) ) ( TRUCK-AT ?auto_138107 ?auto_138103 ) ( IN-TRUCK ?auto_138105 ?auto_138107 ) ( OBJ-AT ?auto_138104 ?auto_138103 ) ( OBJ-AT ?auto_138106 ?auto_138103 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_138105 ?auto_138103 )
      ( DELIVER-3PKG-VERIFY ?auto_138104 ?auto_138105 ?auto_138106 ?auto_138103 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138142 - OBJ
      ?auto_138143 - OBJ
      ?auto_138144 - OBJ
      ?auto_138141 - LOCATION
    )
    :vars
    (
      ?auto_138145 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_138143 ?auto_138142 ) ) ( not ( = ?auto_138144 ?auto_138142 ) ) ( not ( = ?auto_138144 ?auto_138143 ) ) ( TRUCK-AT ?auto_138145 ?auto_138141 ) ( IN-TRUCK ?auto_138142 ?auto_138145 ) ( OBJ-AT ?auto_138143 ?auto_138141 ) ( OBJ-AT ?auto_138144 ?auto_138141 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_138142 ?auto_138141 )
      ( DELIVER-3PKG-VERIFY ?auto_138142 ?auto_138143 ?auto_138144 ?auto_138141 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138608 - OBJ
      ?auto_138609 - OBJ
      ?auto_138610 - OBJ
      ?auto_138607 - LOCATION
    )
    :vars
    (
      ?auto_138612 - TRUCK
      ?auto_138613 - LOCATION
      ?auto_138611 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_138609 ?auto_138608 ) ) ( not ( = ?auto_138610 ?auto_138608 ) ) ( not ( = ?auto_138610 ?auto_138609 ) ) ( IN-TRUCK ?auto_138610 ?auto_138612 ) ( TRUCK-AT ?auto_138612 ?auto_138613 ) ( IN-CITY ?auto_138613 ?auto_138611 ) ( IN-CITY ?auto_138607 ?auto_138611 ) ( not ( = ?auto_138607 ?auto_138613 ) ) ( OBJ-AT ?auto_138608 ?auto_138607 ) ( OBJ-AT ?auto_138609 ?auto_138607 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138608 ?auto_138610 ?auto_138607 )
      ( DELIVER-3PKG-VERIFY ?auto_138608 ?auto_138609 ?auto_138610 ?auto_138607 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138622 - OBJ
      ?auto_138623 - OBJ
      ?auto_138624 - OBJ
      ?auto_138621 - LOCATION
    )
    :vars
    (
      ?auto_138626 - TRUCK
      ?auto_138627 - LOCATION
      ?auto_138625 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_138623 ?auto_138622 ) ) ( not ( = ?auto_138624 ?auto_138622 ) ) ( not ( = ?auto_138624 ?auto_138623 ) ) ( IN-TRUCK ?auto_138623 ?auto_138626 ) ( TRUCK-AT ?auto_138626 ?auto_138627 ) ( IN-CITY ?auto_138627 ?auto_138625 ) ( IN-CITY ?auto_138621 ?auto_138625 ) ( not ( = ?auto_138621 ?auto_138627 ) ) ( OBJ-AT ?auto_138622 ?auto_138621 ) ( OBJ-AT ?auto_138624 ?auto_138621 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138622 ?auto_138623 ?auto_138621 )
      ( DELIVER-3PKG-VERIFY ?auto_138622 ?auto_138623 ?auto_138624 ?auto_138621 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138675 - OBJ
      ?auto_138676 - OBJ
      ?auto_138677 - OBJ
      ?auto_138674 - LOCATION
    )
    :vars
    (
      ?auto_138679 - TRUCK
      ?auto_138680 - LOCATION
      ?auto_138678 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_138676 ?auto_138675 ) ) ( not ( = ?auto_138677 ?auto_138675 ) ) ( not ( = ?auto_138677 ?auto_138676 ) ) ( IN-TRUCK ?auto_138675 ?auto_138679 ) ( TRUCK-AT ?auto_138679 ?auto_138680 ) ( IN-CITY ?auto_138680 ?auto_138678 ) ( IN-CITY ?auto_138674 ?auto_138678 ) ( not ( = ?auto_138674 ?auto_138680 ) ) ( OBJ-AT ?auto_138676 ?auto_138674 ) ( OBJ-AT ?auto_138677 ?auto_138674 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138676 ?auto_138675 ?auto_138674 )
      ( DELIVER-3PKG-VERIFY ?auto_138675 ?auto_138676 ?auto_138677 ?auto_138674 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139305 - OBJ
      ?auto_139306 - OBJ
      ?auto_139307 - OBJ
      ?auto_139304 - LOCATION
    )
    :vars
    (
      ?auto_139310 - TRUCK
      ?auto_139308 - LOCATION
      ?auto_139309 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_139306 ?auto_139305 ) ) ( not ( = ?auto_139307 ?auto_139305 ) ) ( not ( = ?auto_139307 ?auto_139306 ) ) ( TRUCK-AT ?auto_139310 ?auto_139308 ) ( IN-CITY ?auto_139308 ?auto_139309 ) ( IN-CITY ?auto_139304 ?auto_139309 ) ( not ( = ?auto_139304 ?auto_139308 ) ) ( OBJ-AT ?auto_139305 ?auto_139304 ) ( OBJ-AT ?auto_139307 ?auto_139308 ) ( OBJ-AT ?auto_139306 ?auto_139304 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139305 ?auto_139307 ?auto_139304 )
      ( DELIVER-3PKG-VERIFY ?auto_139305 ?auto_139306 ?auto_139307 ?auto_139304 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139319 - OBJ
      ?auto_139320 - OBJ
      ?auto_139321 - OBJ
      ?auto_139318 - LOCATION
    )
    :vars
    (
      ?auto_139324 - TRUCK
      ?auto_139322 - LOCATION
      ?auto_139323 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_139320 ?auto_139319 ) ) ( not ( = ?auto_139321 ?auto_139319 ) ) ( not ( = ?auto_139321 ?auto_139320 ) ) ( TRUCK-AT ?auto_139324 ?auto_139322 ) ( IN-CITY ?auto_139322 ?auto_139323 ) ( IN-CITY ?auto_139318 ?auto_139323 ) ( not ( = ?auto_139318 ?auto_139322 ) ) ( OBJ-AT ?auto_139319 ?auto_139318 ) ( OBJ-AT ?auto_139320 ?auto_139322 ) ( OBJ-AT ?auto_139321 ?auto_139318 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139319 ?auto_139320 ?auto_139318 )
      ( DELIVER-3PKG-VERIFY ?auto_139319 ?auto_139320 ?auto_139321 ?auto_139318 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139372 - OBJ
      ?auto_139373 - OBJ
      ?auto_139374 - OBJ
      ?auto_139371 - LOCATION
    )
    :vars
    (
      ?auto_139377 - TRUCK
      ?auto_139375 - LOCATION
      ?auto_139376 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_139373 ?auto_139372 ) ) ( not ( = ?auto_139374 ?auto_139372 ) ) ( not ( = ?auto_139374 ?auto_139373 ) ) ( TRUCK-AT ?auto_139377 ?auto_139375 ) ( IN-CITY ?auto_139375 ?auto_139376 ) ( IN-CITY ?auto_139371 ?auto_139376 ) ( not ( = ?auto_139371 ?auto_139375 ) ) ( OBJ-AT ?auto_139373 ?auto_139371 ) ( OBJ-AT ?auto_139372 ?auto_139375 ) ( OBJ-AT ?auto_139374 ?auto_139371 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139373 ?auto_139372 ?auto_139371 )
      ( DELIVER-3PKG-VERIFY ?auto_139372 ?auto_139373 ?auto_139374 ?auto_139371 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_140002 - OBJ
      ?auto_140003 - OBJ
      ?auto_140004 - OBJ
      ?auto_140001 - LOCATION
    )
    :vars
    (
      ?auto_140005 - LOCATION
      ?auto_140006 - CITY
      ?auto_140007 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_140003 ?auto_140002 ) ) ( not ( = ?auto_140004 ?auto_140002 ) ) ( not ( = ?auto_140004 ?auto_140003 ) ) ( IN-CITY ?auto_140005 ?auto_140006 ) ( IN-CITY ?auto_140001 ?auto_140006 ) ( not ( = ?auto_140001 ?auto_140005 ) ) ( OBJ-AT ?auto_140002 ?auto_140001 ) ( OBJ-AT ?auto_140004 ?auto_140005 ) ( TRUCK-AT ?auto_140007 ?auto_140001 ) ( OBJ-AT ?auto_140003 ?auto_140001 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140002 ?auto_140004 ?auto_140001 )
      ( DELIVER-3PKG-VERIFY ?auto_140002 ?auto_140003 ?auto_140004 ?auto_140001 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_140016 - OBJ
      ?auto_140017 - OBJ
      ?auto_140018 - OBJ
      ?auto_140015 - LOCATION
    )
    :vars
    (
      ?auto_140019 - LOCATION
      ?auto_140020 - CITY
      ?auto_140021 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_140017 ?auto_140016 ) ) ( not ( = ?auto_140018 ?auto_140016 ) ) ( not ( = ?auto_140018 ?auto_140017 ) ) ( IN-CITY ?auto_140019 ?auto_140020 ) ( IN-CITY ?auto_140015 ?auto_140020 ) ( not ( = ?auto_140015 ?auto_140019 ) ) ( OBJ-AT ?auto_140016 ?auto_140015 ) ( OBJ-AT ?auto_140017 ?auto_140019 ) ( TRUCK-AT ?auto_140021 ?auto_140015 ) ( OBJ-AT ?auto_140018 ?auto_140015 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140016 ?auto_140017 ?auto_140015 )
      ( DELIVER-3PKG-VERIFY ?auto_140016 ?auto_140017 ?auto_140018 ?auto_140015 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_140069 - OBJ
      ?auto_140070 - OBJ
      ?auto_140071 - OBJ
      ?auto_140068 - LOCATION
    )
    :vars
    (
      ?auto_140072 - LOCATION
      ?auto_140073 - CITY
      ?auto_140074 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_140070 ?auto_140069 ) ) ( not ( = ?auto_140071 ?auto_140069 ) ) ( not ( = ?auto_140071 ?auto_140070 ) ) ( IN-CITY ?auto_140072 ?auto_140073 ) ( IN-CITY ?auto_140068 ?auto_140073 ) ( not ( = ?auto_140068 ?auto_140072 ) ) ( OBJ-AT ?auto_140070 ?auto_140068 ) ( OBJ-AT ?auto_140069 ?auto_140072 ) ( TRUCK-AT ?auto_140074 ?auto_140068 ) ( OBJ-AT ?auto_140071 ?auto_140068 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140070 ?auto_140069 ?auto_140068 )
      ( DELIVER-3PKG-VERIFY ?auto_140069 ?auto_140070 ?auto_140071 ?auto_140068 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_141365 - OBJ
      ?auto_141364 - LOCATION
    )
    :vars
    (
      ?auto_141369 - OBJ
      ?auto_141366 - LOCATION
      ?auto_141367 - CITY
      ?auto_141368 - TRUCK
      ?auto_141370 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_141365 ?auto_141369 ) ) ( IN-CITY ?auto_141366 ?auto_141367 ) ( IN-CITY ?auto_141364 ?auto_141367 ) ( not ( = ?auto_141364 ?auto_141366 ) ) ( OBJ-AT ?auto_141369 ?auto_141364 ) ( OBJ-AT ?auto_141365 ?auto_141366 ) ( TRUCK-AT ?auto_141368 ?auto_141370 ) ( IN-CITY ?auto_141370 ?auto_141367 ) ( not ( = ?auto_141364 ?auto_141370 ) ) ( not ( = ?auto_141366 ?auto_141370 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_141368 ?auto_141370 ?auto_141364 ?auto_141367 )
      ( DELIVER-2PKG ?auto_141369 ?auto_141365 ?auto_141364 )
      ( DELIVER-1PKG-VERIFY ?auto_141365 ?auto_141364 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_141372 - OBJ
      ?auto_141373 - OBJ
      ?auto_141371 - LOCATION
    )
    :vars
    (
      ?auto_141377 - LOCATION
      ?auto_141374 - CITY
      ?auto_141376 - TRUCK
      ?auto_141375 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_141373 ?auto_141372 ) ) ( IN-CITY ?auto_141377 ?auto_141374 ) ( IN-CITY ?auto_141371 ?auto_141374 ) ( not ( = ?auto_141371 ?auto_141377 ) ) ( OBJ-AT ?auto_141372 ?auto_141371 ) ( OBJ-AT ?auto_141373 ?auto_141377 ) ( TRUCK-AT ?auto_141376 ?auto_141375 ) ( IN-CITY ?auto_141375 ?auto_141374 ) ( not ( = ?auto_141371 ?auto_141375 ) ) ( not ( = ?auto_141377 ?auto_141375 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_141373 ?auto_141371 )
      ( DELIVER-2PKG-VERIFY ?auto_141372 ?auto_141373 ?auto_141371 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_141387 - OBJ
      ?auto_141388 - OBJ
      ?auto_141386 - LOCATION
    )
    :vars
    (
      ?auto_141391 - LOCATION
      ?auto_141390 - CITY
      ?auto_141389 - TRUCK
      ?auto_141392 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_141388 ?auto_141387 ) ) ( IN-CITY ?auto_141391 ?auto_141390 ) ( IN-CITY ?auto_141386 ?auto_141390 ) ( not ( = ?auto_141386 ?auto_141391 ) ) ( OBJ-AT ?auto_141388 ?auto_141386 ) ( OBJ-AT ?auto_141387 ?auto_141391 ) ( TRUCK-AT ?auto_141389 ?auto_141392 ) ( IN-CITY ?auto_141392 ?auto_141390 ) ( not ( = ?auto_141386 ?auto_141392 ) ) ( not ( = ?auto_141391 ?auto_141392 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141388 ?auto_141387 ?auto_141386 )
      ( DELIVER-2PKG-VERIFY ?auto_141387 ?auto_141388 ?auto_141386 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_144368 - OBJ
      ?auto_144367 - LOCATION
    )
    :vars
    (
      ?auto_144372 - OBJ
      ?auto_144369 - LOCATION
      ?auto_144370 - CITY
      ?auto_144371 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_144368 ?auto_144372 ) ) ( IN-CITY ?auto_144369 ?auto_144370 ) ( IN-CITY ?auto_144367 ?auto_144370 ) ( not ( = ?auto_144367 ?auto_144369 ) ) ( OBJ-AT ?auto_144368 ?auto_144369 ) ( IN-TRUCK ?auto_144372 ?auto_144371 ) ( TRUCK-AT ?auto_144371 ?auto_144369 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_144371 ?auto_144369 ?auto_144367 ?auto_144370 )
      ( DELIVER-2PKG ?auto_144372 ?auto_144368 ?auto_144367 )
      ( DELIVER-1PKG-VERIFY ?auto_144368 ?auto_144367 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_144374 - OBJ
      ?auto_144375 - OBJ
      ?auto_144373 - LOCATION
    )
    :vars
    (
      ?auto_144376 - LOCATION
      ?auto_144378 - CITY
      ?auto_144377 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_144375 ?auto_144374 ) ) ( IN-CITY ?auto_144376 ?auto_144378 ) ( IN-CITY ?auto_144373 ?auto_144378 ) ( not ( = ?auto_144373 ?auto_144376 ) ) ( OBJ-AT ?auto_144375 ?auto_144376 ) ( IN-TRUCK ?auto_144374 ?auto_144377 ) ( TRUCK-AT ?auto_144377 ?auto_144376 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_144375 ?auto_144373 )
      ( DELIVER-2PKG-VERIFY ?auto_144374 ?auto_144375 ?auto_144373 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_144387 - OBJ
      ?auto_144388 - OBJ
      ?auto_144386 - LOCATION
    )
    :vars
    (
      ?auto_144389 - LOCATION
      ?auto_144391 - CITY
      ?auto_144390 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_144388 ?auto_144387 ) ) ( IN-CITY ?auto_144389 ?auto_144391 ) ( IN-CITY ?auto_144386 ?auto_144391 ) ( not ( = ?auto_144386 ?auto_144389 ) ) ( OBJ-AT ?auto_144387 ?auto_144389 ) ( IN-TRUCK ?auto_144388 ?auto_144390 ) ( TRUCK-AT ?auto_144390 ?auto_144389 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_144388 ?auto_144387 ?auto_144386 )
      ( DELIVER-2PKG-VERIFY ?auto_144387 ?auto_144388 ?auto_144386 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_147853 - OBJ
      ?auto_147854 - OBJ
      ?auto_147855 - OBJ
      ?auto_147856 - OBJ
      ?auto_147852 - LOCATION
    )
    :vars
    (
      ?auto_147857 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_147854 ?auto_147853 ) ) ( not ( = ?auto_147855 ?auto_147853 ) ) ( not ( = ?auto_147855 ?auto_147854 ) ) ( not ( = ?auto_147856 ?auto_147853 ) ) ( not ( = ?auto_147856 ?auto_147854 ) ) ( not ( = ?auto_147856 ?auto_147855 ) ) ( TRUCK-AT ?auto_147857 ?auto_147852 ) ( IN-TRUCK ?auto_147856 ?auto_147857 ) ( OBJ-AT ?auto_147853 ?auto_147852 ) ( OBJ-AT ?auto_147854 ?auto_147852 ) ( OBJ-AT ?auto_147855 ?auto_147852 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_147856 ?auto_147852 )
      ( DELIVER-4PKG-VERIFY ?auto_147853 ?auto_147854 ?auto_147855 ?auto_147856 ?auto_147852 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_147871 - OBJ
      ?auto_147872 - OBJ
      ?auto_147873 - OBJ
      ?auto_147874 - OBJ
      ?auto_147870 - LOCATION
    )
    :vars
    (
      ?auto_147875 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_147872 ?auto_147871 ) ) ( not ( = ?auto_147873 ?auto_147871 ) ) ( not ( = ?auto_147873 ?auto_147872 ) ) ( not ( = ?auto_147874 ?auto_147871 ) ) ( not ( = ?auto_147874 ?auto_147872 ) ) ( not ( = ?auto_147874 ?auto_147873 ) ) ( TRUCK-AT ?auto_147875 ?auto_147870 ) ( IN-TRUCK ?auto_147873 ?auto_147875 ) ( OBJ-AT ?auto_147871 ?auto_147870 ) ( OBJ-AT ?auto_147872 ?auto_147870 ) ( OBJ-AT ?auto_147874 ?auto_147870 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_147873 ?auto_147870 )
      ( DELIVER-4PKG-VERIFY ?auto_147871 ?auto_147872 ?auto_147873 ?auto_147874 ?auto_147870 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_147959 - OBJ
      ?auto_147960 - OBJ
      ?auto_147961 - OBJ
      ?auto_147962 - OBJ
      ?auto_147958 - LOCATION
    )
    :vars
    (
      ?auto_147963 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_147960 ?auto_147959 ) ) ( not ( = ?auto_147961 ?auto_147959 ) ) ( not ( = ?auto_147961 ?auto_147960 ) ) ( not ( = ?auto_147962 ?auto_147959 ) ) ( not ( = ?auto_147962 ?auto_147960 ) ) ( not ( = ?auto_147962 ?auto_147961 ) ) ( TRUCK-AT ?auto_147963 ?auto_147958 ) ( IN-TRUCK ?auto_147960 ?auto_147963 ) ( OBJ-AT ?auto_147959 ?auto_147958 ) ( OBJ-AT ?auto_147961 ?auto_147958 ) ( OBJ-AT ?auto_147962 ?auto_147958 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_147960 ?auto_147958 )
      ( DELIVER-4PKG-VERIFY ?auto_147959 ?auto_147960 ?auto_147961 ?auto_147962 ?auto_147958 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_148486 - OBJ
      ?auto_148487 - OBJ
      ?auto_148488 - OBJ
      ?auto_148489 - OBJ
      ?auto_148485 - LOCATION
    )
    :vars
    (
      ?auto_148490 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_148487 ?auto_148486 ) ) ( not ( = ?auto_148488 ?auto_148486 ) ) ( not ( = ?auto_148488 ?auto_148487 ) ) ( not ( = ?auto_148489 ?auto_148486 ) ) ( not ( = ?auto_148489 ?auto_148487 ) ) ( not ( = ?auto_148489 ?auto_148488 ) ) ( TRUCK-AT ?auto_148490 ?auto_148485 ) ( IN-TRUCK ?auto_148486 ?auto_148490 ) ( OBJ-AT ?auto_148487 ?auto_148485 ) ( OBJ-AT ?auto_148488 ?auto_148485 ) ( OBJ-AT ?auto_148489 ?auto_148485 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_148486 ?auto_148485 )
      ( DELIVER-4PKG-VERIFY ?auto_148486 ?auto_148487 ?auto_148488 ?auto_148489 ?auto_148485 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149164 - OBJ
      ?auto_149165 - OBJ
      ?auto_149166 - OBJ
      ?auto_149167 - OBJ
      ?auto_149163 - LOCATION
    )
    :vars
    (
      ?auto_149168 - TRUCK
      ?auto_149170 - LOCATION
      ?auto_149169 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_149165 ?auto_149164 ) ) ( not ( = ?auto_149166 ?auto_149164 ) ) ( not ( = ?auto_149166 ?auto_149165 ) ) ( not ( = ?auto_149167 ?auto_149164 ) ) ( not ( = ?auto_149167 ?auto_149165 ) ) ( not ( = ?auto_149167 ?auto_149166 ) ) ( IN-TRUCK ?auto_149167 ?auto_149168 ) ( TRUCK-AT ?auto_149168 ?auto_149170 ) ( IN-CITY ?auto_149170 ?auto_149169 ) ( IN-CITY ?auto_149163 ?auto_149169 ) ( not ( = ?auto_149163 ?auto_149170 ) ) ( OBJ-AT ?auto_149164 ?auto_149163 ) ( OBJ-AT ?auto_149165 ?auto_149163 ) ( OBJ-AT ?auto_149166 ?auto_149163 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_149164 ?auto_149167 ?auto_149163 )
      ( DELIVER-4PKG-VERIFY ?auto_149164 ?auto_149165 ?auto_149166 ?auto_149167 ?auto_149163 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149188 - OBJ
      ?auto_149189 - OBJ
      ?auto_149190 - OBJ
      ?auto_149191 - OBJ
      ?auto_149187 - LOCATION
    )
    :vars
    (
      ?auto_149192 - TRUCK
      ?auto_149194 - LOCATION
      ?auto_149193 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_149189 ?auto_149188 ) ) ( not ( = ?auto_149190 ?auto_149188 ) ) ( not ( = ?auto_149190 ?auto_149189 ) ) ( not ( = ?auto_149191 ?auto_149188 ) ) ( not ( = ?auto_149191 ?auto_149189 ) ) ( not ( = ?auto_149191 ?auto_149190 ) ) ( IN-TRUCK ?auto_149190 ?auto_149192 ) ( TRUCK-AT ?auto_149192 ?auto_149194 ) ( IN-CITY ?auto_149194 ?auto_149193 ) ( IN-CITY ?auto_149187 ?auto_149193 ) ( not ( = ?auto_149187 ?auto_149194 ) ) ( OBJ-AT ?auto_149188 ?auto_149187 ) ( OBJ-AT ?auto_149189 ?auto_149187 ) ( OBJ-AT ?auto_149191 ?auto_149187 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_149188 ?auto_149190 ?auto_149187 )
      ( DELIVER-4PKG-VERIFY ?auto_149188 ?auto_149189 ?auto_149190 ?auto_149191 ?auto_149187 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149302 - OBJ
      ?auto_149303 - OBJ
      ?auto_149304 - OBJ
      ?auto_149305 - OBJ
      ?auto_149301 - LOCATION
    )
    :vars
    (
      ?auto_149306 - TRUCK
      ?auto_149308 - LOCATION
      ?auto_149307 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_149303 ?auto_149302 ) ) ( not ( = ?auto_149304 ?auto_149302 ) ) ( not ( = ?auto_149304 ?auto_149303 ) ) ( not ( = ?auto_149305 ?auto_149302 ) ) ( not ( = ?auto_149305 ?auto_149303 ) ) ( not ( = ?auto_149305 ?auto_149304 ) ) ( IN-TRUCK ?auto_149303 ?auto_149306 ) ( TRUCK-AT ?auto_149306 ?auto_149308 ) ( IN-CITY ?auto_149308 ?auto_149307 ) ( IN-CITY ?auto_149301 ?auto_149307 ) ( not ( = ?auto_149301 ?auto_149308 ) ) ( OBJ-AT ?auto_149302 ?auto_149301 ) ( OBJ-AT ?auto_149304 ?auto_149301 ) ( OBJ-AT ?auto_149305 ?auto_149301 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_149302 ?auto_149303 ?auto_149301 )
      ( DELIVER-4PKG-VERIFY ?auto_149302 ?auto_149303 ?auto_149304 ?auto_149305 ?auto_149301 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_150021 - OBJ
      ?auto_150022 - OBJ
      ?auto_150023 - OBJ
      ?auto_150024 - OBJ
      ?auto_150020 - LOCATION
    )
    :vars
    (
      ?auto_150025 - TRUCK
      ?auto_150027 - LOCATION
      ?auto_150026 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_150022 ?auto_150021 ) ) ( not ( = ?auto_150023 ?auto_150021 ) ) ( not ( = ?auto_150023 ?auto_150022 ) ) ( not ( = ?auto_150024 ?auto_150021 ) ) ( not ( = ?auto_150024 ?auto_150022 ) ) ( not ( = ?auto_150024 ?auto_150023 ) ) ( IN-TRUCK ?auto_150021 ?auto_150025 ) ( TRUCK-AT ?auto_150025 ?auto_150027 ) ( IN-CITY ?auto_150027 ?auto_150026 ) ( IN-CITY ?auto_150020 ?auto_150026 ) ( not ( = ?auto_150020 ?auto_150027 ) ) ( OBJ-AT ?auto_150022 ?auto_150020 ) ( OBJ-AT ?auto_150023 ?auto_150020 ) ( OBJ-AT ?auto_150024 ?auto_150020 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_150022 ?auto_150021 ?auto_150020 )
      ( DELIVER-4PKG-VERIFY ?auto_150021 ?auto_150022 ?auto_150023 ?auto_150024 ?auto_150020 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_150833 - OBJ
      ?auto_150834 - OBJ
      ?auto_150835 - OBJ
      ?auto_150836 - OBJ
      ?auto_150832 - LOCATION
    )
    :vars
    (
      ?auto_150839 - TRUCK
      ?auto_150837 - LOCATION
      ?auto_150838 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_150834 ?auto_150833 ) ) ( not ( = ?auto_150835 ?auto_150833 ) ) ( not ( = ?auto_150835 ?auto_150834 ) ) ( not ( = ?auto_150836 ?auto_150833 ) ) ( not ( = ?auto_150836 ?auto_150834 ) ) ( not ( = ?auto_150836 ?auto_150835 ) ) ( TRUCK-AT ?auto_150839 ?auto_150837 ) ( IN-CITY ?auto_150837 ?auto_150838 ) ( IN-CITY ?auto_150832 ?auto_150838 ) ( not ( = ?auto_150832 ?auto_150837 ) ) ( OBJ-AT ?auto_150833 ?auto_150832 ) ( OBJ-AT ?auto_150836 ?auto_150837 ) ( OBJ-AT ?auto_150834 ?auto_150832 ) ( OBJ-AT ?auto_150835 ?auto_150832 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_150833 ?auto_150836 ?auto_150832 )
      ( DELIVER-4PKG-VERIFY ?auto_150833 ?auto_150834 ?auto_150835 ?auto_150836 ?auto_150832 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_150857 - OBJ
      ?auto_150858 - OBJ
      ?auto_150859 - OBJ
      ?auto_150860 - OBJ
      ?auto_150856 - LOCATION
    )
    :vars
    (
      ?auto_150863 - TRUCK
      ?auto_150861 - LOCATION
      ?auto_150862 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_150858 ?auto_150857 ) ) ( not ( = ?auto_150859 ?auto_150857 ) ) ( not ( = ?auto_150859 ?auto_150858 ) ) ( not ( = ?auto_150860 ?auto_150857 ) ) ( not ( = ?auto_150860 ?auto_150858 ) ) ( not ( = ?auto_150860 ?auto_150859 ) ) ( TRUCK-AT ?auto_150863 ?auto_150861 ) ( IN-CITY ?auto_150861 ?auto_150862 ) ( IN-CITY ?auto_150856 ?auto_150862 ) ( not ( = ?auto_150856 ?auto_150861 ) ) ( OBJ-AT ?auto_150857 ?auto_150856 ) ( OBJ-AT ?auto_150859 ?auto_150861 ) ( OBJ-AT ?auto_150858 ?auto_150856 ) ( OBJ-AT ?auto_150860 ?auto_150856 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_150857 ?auto_150859 ?auto_150856 )
      ( DELIVER-4PKG-VERIFY ?auto_150857 ?auto_150858 ?auto_150859 ?auto_150860 ?auto_150856 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_150971 - OBJ
      ?auto_150972 - OBJ
      ?auto_150973 - OBJ
      ?auto_150974 - OBJ
      ?auto_150970 - LOCATION
    )
    :vars
    (
      ?auto_150977 - TRUCK
      ?auto_150975 - LOCATION
      ?auto_150976 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_150972 ?auto_150971 ) ) ( not ( = ?auto_150973 ?auto_150971 ) ) ( not ( = ?auto_150973 ?auto_150972 ) ) ( not ( = ?auto_150974 ?auto_150971 ) ) ( not ( = ?auto_150974 ?auto_150972 ) ) ( not ( = ?auto_150974 ?auto_150973 ) ) ( TRUCK-AT ?auto_150977 ?auto_150975 ) ( IN-CITY ?auto_150975 ?auto_150976 ) ( IN-CITY ?auto_150970 ?auto_150976 ) ( not ( = ?auto_150970 ?auto_150975 ) ) ( OBJ-AT ?auto_150971 ?auto_150970 ) ( OBJ-AT ?auto_150972 ?auto_150975 ) ( OBJ-AT ?auto_150973 ?auto_150970 ) ( OBJ-AT ?auto_150974 ?auto_150970 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_150971 ?auto_150972 ?auto_150970 )
      ( DELIVER-4PKG-VERIFY ?auto_150971 ?auto_150972 ?auto_150973 ?auto_150974 ?auto_150970 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_151690 - OBJ
      ?auto_151691 - OBJ
      ?auto_151692 - OBJ
      ?auto_151693 - OBJ
      ?auto_151689 - LOCATION
    )
    :vars
    (
      ?auto_151696 - TRUCK
      ?auto_151694 - LOCATION
      ?auto_151695 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_151691 ?auto_151690 ) ) ( not ( = ?auto_151692 ?auto_151690 ) ) ( not ( = ?auto_151692 ?auto_151691 ) ) ( not ( = ?auto_151693 ?auto_151690 ) ) ( not ( = ?auto_151693 ?auto_151691 ) ) ( not ( = ?auto_151693 ?auto_151692 ) ) ( TRUCK-AT ?auto_151696 ?auto_151694 ) ( IN-CITY ?auto_151694 ?auto_151695 ) ( IN-CITY ?auto_151689 ?auto_151695 ) ( not ( = ?auto_151689 ?auto_151694 ) ) ( OBJ-AT ?auto_151691 ?auto_151689 ) ( OBJ-AT ?auto_151690 ?auto_151694 ) ( OBJ-AT ?auto_151692 ?auto_151689 ) ( OBJ-AT ?auto_151693 ?auto_151689 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_151691 ?auto_151690 ?auto_151689 )
      ( DELIVER-4PKG-VERIFY ?auto_151690 ?auto_151691 ?auto_151692 ?auto_151693 ?auto_151689 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_152502 - OBJ
      ?auto_152503 - OBJ
      ?auto_152504 - OBJ
      ?auto_152505 - OBJ
      ?auto_152501 - LOCATION
    )
    :vars
    (
      ?auto_152506 - LOCATION
      ?auto_152507 - CITY
      ?auto_152508 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_152503 ?auto_152502 ) ) ( not ( = ?auto_152504 ?auto_152502 ) ) ( not ( = ?auto_152504 ?auto_152503 ) ) ( not ( = ?auto_152505 ?auto_152502 ) ) ( not ( = ?auto_152505 ?auto_152503 ) ) ( not ( = ?auto_152505 ?auto_152504 ) ) ( IN-CITY ?auto_152506 ?auto_152507 ) ( IN-CITY ?auto_152501 ?auto_152507 ) ( not ( = ?auto_152501 ?auto_152506 ) ) ( OBJ-AT ?auto_152502 ?auto_152501 ) ( OBJ-AT ?auto_152505 ?auto_152506 ) ( TRUCK-AT ?auto_152508 ?auto_152501 ) ( OBJ-AT ?auto_152503 ?auto_152501 ) ( OBJ-AT ?auto_152504 ?auto_152501 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_152502 ?auto_152505 ?auto_152501 )
      ( DELIVER-4PKG-VERIFY ?auto_152502 ?auto_152503 ?auto_152504 ?auto_152505 ?auto_152501 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_152526 - OBJ
      ?auto_152527 - OBJ
      ?auto_152528 - OBJ
      ?auto_152529 - OBJ
      ?auto_152525 - LOCATION
    )
    :vars
    (
      ?auto_152530 - LOCATION
      ?auto_152531 - CITY
      ?auto_152532 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_152527 ?auto_152526 ) ) ( not ( = ?auto_152528 ?auto_152526 ) ) ( not ( = ?auto_152528 ?auto_152527 ) ) ( not ( = ?auto_152529 ?auto_152526 ) ) ( not ( = ?auto_152529 ?auto_152527 ) ) ( not ( = ?auto_152529 ?auto_152528 ) ) ( IN-CITY ?auto_152530 ?auto_152531 ) ( IN-CITY ?auto_152525 ?auto_152531 ) ( not ( = ?auto_152525 ?auto_152530 ) ) ( OBJ-AT ?auto_152526 ?auto_152525 ) ( OBJ-AT ?auto_152528 ?auto_152530 ) ( TRUCK-AT ?auto_152532 ?auto_152525 ) ( OBJ-AT ?auto_152527 ?auto_152525 ) ( OBJ-AT ?auto_152529 ?auto_152525 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_152526 ?auto_152528 ?auto_152525 )
      ( DELIVER-4PKG-VERIFY ?auto_152526 ?auto_152527 ?auto_152528 ?auto_152529 ?auto_152525 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_152640 - OBJ
      ?auto_152641 - OBJ
      ?auto_152642 - OBJ
      ?auto_152643 - OBJ
      ?auto_152639 - LOCATION
    )
    :vars
    (
      ?auto_152644 - LOCATION
      ?auto_152645 - CITY
      ?auto_152646 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_152641 ?auto_152640 ) ) ( not ( = ?auto_152642 ?auto_152640 ) ) ( not ( = ?auto_152642 ?auto_152641 ) ) ( not ( = ?auto_152643 ?auto_152640 ) ) ( not ( = ?auto_152643 ?auto_152641 ) ) ( not ( = ?auto_152643 ?auto_152642 ) ) ( IN-CITY ?auto_152644 ?auto_152645 ) ( IN-CITY ?auto_152639 ?auto_152645 ) ( not ( = ?auto_152639 ?auto_152644 ) ) ( OBJ-AT ?auto_152640 ?auto_152639 ) ( OBJ-AT ?auto_152641 ?auto_152644 ) ( TRUCK-AT ?auto_152646 ?auto_152639 ) ( OBJ-AT ?auto_152642 ?auto_152639 ) ( OBJ-AT ?auto_152643 ?auto_152639 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_152640 ?auto_152641 ?auto_152639 )
      ( DELIVER-4PKG-VERIFY ?auto_152640 ?auto_152641 ?auto_152642 ?auto_152643 ?auto_152639 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_153359 - OBJ
      ?auto_153360 - OBJ
      ?auto_153361 - OBJ
      ?auto_153362 - OBJ
      ?auto_153358 - LOCATION
    )
    :vars
    (
      ?auto_153363 - LOCATION
      ?auto_153364 - CITY
      ?auto_153365 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_153360 ?auto_153359 ) ) ( not ( = ?auto_153361 ?auto_153359 ) ) ( not ( = ?auto_153361 ?auto_153360 ) ) ( not ( = ?auto_153362 ?auto_153359 ) ) ( not ( = ?auto_153362 ?auto_153360 ) ) ( not ( = ?auto_153362 ?auto_153361 ) ) ( IN-CITY ?auto_153363 ?auto_153364 ) ( IN-CITY ?auto_153358 ?auto_153364 ) ( not ( = ?auto_153358 ?auto_153363 ) ) ( OBJ-AT ?auto_153360 ?auto_153358 ) ( OBJ-AT ?auto_153359 ?auto_153363 ) ( TRUCK-AT ?auto_153365 ?auto_153358 ) ( OBJ-AT ?auto_153361 ?auto_153358 ) ( OBJ-AT ?auto_153362 ?auto_153358 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_153360 ?auto_153359 ?auto_153358 )
      ( DELIVER-4PKG-VERIFY ?auto_153359 ?auto_153360 ?auto_153361 ?auto_153362 ?auto_153358 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_155654 - OBJ
      ?auto_155655 - OBJ
      ?auto_155656 - OBJ
      ?auto_155653 - LOCATION
    )
    :vars
    (
      ?auto_155659 - LOCATION
      ?auto_155660 - CITY
      ?auto_155658 - TRUCK
      ?auto_155657 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_155655 ?auto_155654 ) ) ( not ( = ?auto_155656 ?auto_155654 ) ) ( not ( = ?auto_155656 ?auto_155655 ) ) ( IN-CITY ?auto_155659 ?auto_155660 ) ( IN-CITY ?auto_155653 ?auto_155660 ) ( not ( = ?auto_155653 ?auto_155659 ) ) ( OBJ-AT ?auto_155654 ?auto_155653 ) ( OBJ-AT ?auto_155656 ?auto_155659 ) ( TRUCK-AT ?auto_155658 ?auto_155657 ) ( IN-CITY ?auto_155657 ?auto_155660 ) ( not ( = ?auto_155653 ?auto_155657 ) ) ( not ( = ?auto_155659 ?auto_155657 ) ) ( OBJ-AT ?auto_155655 ?auto_155653 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155654 ?auto_155656 ?auto_155653 )
      ( DELIVER-3PKG-VERIFY ?auto_155654 ?auto_155655 ?auto_155656 ?auto_155653 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_155678 - OBJ
      ?auto_155679 - OBJ
      ?auto_155680 - OBJ
      ?auto_155677 - LOCATION
    )
    :vars
    (
      ?auto_155683 - LOCATION
      ?auto_155684 - CITY
      ?auto_155682 - TRUCK
      ?auto_155681 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_155679 ?auto_155678 ) ) ( not ( = ?auto_155680 ?auto_155678 ) ) ( not ( = ?auto_155680 ?auto_155679 ) ) ( IN-CITY ?auto_155683 ?auto_155684 ) ( IN-CITY ?auto_155677 ?auto_155684 ) ( not ( = ?auto_155677 ?auto_155683 ) ) ( OBJ-AT ?auto_155678 ?auto_155677 ) ( OBJ-AT ?auto_155679 ?auto_155683 ) ( TRUCK-AT ?auto_155682 ?auto_155681 ) ( IN-CITY ?auto_155681 ?auto_155684 ) ( not ( = ?auto_155677 ?auto_155681 ) ) ( not ( = ?auto_155683 ?auto_155681 ) ) ( OBJ-AT ?auto_155680 ?auto_155677 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155678 ?auto_155679 ?auto_155677 )
      ( DELIVER-3PKG-VERIFY ?auto_155678 ?auto_155679 ?auto_155680 ?auto_155677 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_155824 - OBJ
      ?auto_155825 - OBJ
      ?auto_155826 - OBJ
      ?auto_155823 - LOCATION
    )
    :vars
    (
      ?auto_155829 - LOCATION
      ?auto_155830 - CITY
      ?auto_155828 - TRUCK
      ?auto_155827 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_155825 ?auto_155824 ) ) ( not ( = ?auto_155826 ?auto_155824 ) ) ( not ( = ?auto_155826 ?auto_155825 ) ) ( IN-CITY ?auto_155829 ?auto_155830 ) ( IN-CITY ?auto_155823 ?auto_155830 ) ( not ( = ?auto_155823 ?auto_155829 ) ) ( OBJ-AT ?auto_155825 ?auto_155823 ) ( OBJ-AT ?auto_155824 ?auto_155829 ) ( TRUCK-AT ?auto_155828 ?auto_155827 ) ( IN-CITY ?auto_155827 ?auto_155830 ) ( not ( = ?auto_155823 ?auto_155827 ) ) ( not ( = ?auto_155829 ?auto_155827 ) ) ( OBJ-AT ?auto_155826 ?auto_155823 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155825 ?auto_155824 ?auto_155823 )
      ( DELIVER-3PKG-VERIFY ?auto_155824 ?auto_155825 ?auto_155826 ?auto_155823 ) )
  )

)

