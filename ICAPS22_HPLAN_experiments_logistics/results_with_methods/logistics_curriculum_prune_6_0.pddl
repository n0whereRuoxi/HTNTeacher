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

  ( :method DELIVER-6PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_233219 - OBJ
      ?auto_233218 - LOCATION
    )
    :vars
    (
      ?auto_233221 - LOCATION
      ?auto_233222 - CITY
      ?auto_233220 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_233221 ?auto_233222 ) ( IN-CITY ?auto_233218 ?auto_233222 ) ( not ( = ?auto_233218 ?auto_233221 ) ) ( OBJ-AT ?auto_233219 ?auto_233221 ) ( TRUCK-AT ?auto_233220 ?auto_233218 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_233220 ?auto_233218 ?auto_233221 ?auto_233222 )
      ( !LOAD-TRUCK ?auto_233219 ?auto_233220 ?auto_233221 )
      ( !DRIVE-TRUCK ?auto_233220 ?auto_233221 ?auto_233218 ?auto_233222 )
      ( !UNLOAD-TRUCK ?auto_233219 ?auto_233220 ?auto_233218 )
      ( DELIVER-1PKG-VERIFY ?auto_233219 ?auto_233218 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_233240 - OBJ
      ?auto_233241 - OBJ
      ?auto_233239 - LOCATION
    )
    :vars
    (
      ?auto_233242 - LOCATION
      ?auto_233244 - CITY
      ?auto_233245 - LOCATION
      ?auto_233243 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_233242 ?auto_233244 ) ( IN-CITY ?auto_233239 ?auto_233244 ) ( not ( = ?auto_233239 ?auto_233242 ) ) ( OBJ-AT ?auto_233241 ?auto_233242 ) ( IN-CITY ?auto_233245 ?auto_233244 ) ( not ( = ?auto_233239 ?auto_233245 ) ) ( OBJ-AT ?auto_233240 ?auto_233245 ) ( TRUCK-AT ?auto_233243 ?auto_233239 ) ( not ( = ?auto_233240 ?auto_233241 ) ) ( not ( = ?auto_233242 ?auto_233245 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_233240 ?auto_233239 )
      ( DELIVER-1PKG ?auto_233241 ?auto_233239 )
      ( DELIVER-2PKG-VERIFY ?auto_233240 ?auto_233241 ?auto_233239 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_233351 - OBJ
      ?auto_233352 - OBJ
      ?auto_233353 - OBJ
      ?auto_233350 - LOCATION
    )
    :vars
    (
      ?auto_233354 - LOCATION
      ?auto_233356 - CITY
      ?auto_233358 - LOCATION
      ?auto_233357 - LOCATION
      ?auto_233355 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_233354 ?auto_233356 ) ( IN-CITY ?auto_233350 ?auto_233356 ) ( not ( = ?auto_233350 ?auto_233354 ) ) ( OBJ-AT ?auto_233353 ?auto_233354 ) ( IN-CITY ?auto_233358 ?auto_233356 ) ( not ( = ?auto_233350 ?auto_233358 ) ) ( OBJ-AT ?auto_233352 ?auto_233358 ) ( IN-CITY ?auto_233357 ?auto_233356 ) ( not ( = ?auto_233350 ?auto_233357 ) ) ( OBJ-AT ?auto_233351 ?auto_233357 ) ( TRUCK-AT ?auto_233355 ?auto_233350 ) ( not ( = ?auto_233351 ?auto_233352 ) ) ( not ( = ?auto_233358 ?auto_233357 ) ) ( not ( = ?auto_233351 ?auto_233353 ) ) ( not ( = ?auto_233352 ?auto_233353 ) ) ( not ( = ?auto_233354 ?auto_233358 ) ) ( not ( = ?auto_233354 ?auto_233357 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_233351 ?auto_233352 ?auto_233350 )
      ( DELIVER-1PKG ?auto_233353 ?auto_233350 )
      ( DELIVER-3PKG-VERIFY ?auto_233351 ?auto_233352 ?auto_233353 ?auto_233350 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234485 - OBJ
      ?auto_234486 - OBJ
      ?auto_234487 - OBJ
      ?auto_234488 - OBJ
      ?auto_234484 - LOCATION
    )
    :vars
    (
      ?auto_234490 - LOCATION
      ?auto_234489 - CITY
      ?auto_234492 - LOCATION
      ?auto_234493 - LOCATION
      ?auto_234491 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_234490 ?auto_234489 ) ( IN-CITY ?auto_234484 ?auto_234489 ) ( not ( = ?auto_234484 ?auto_234490 ) ) ( OBJ-AT ?auto_234488 ?auto_234490 ) ( IN-CITY ?auto_234492 ?auto_234489 ) ( not ( = ?auto_234484 ?auto_234492 ) ) ( OBJ-AT ?auto_234487 ?auto_234492 ) ( IN-CITY ?auto_234493 ?auto_234489 ) ( not ( = ?auto_234484 ?auto_234493 ) ) ( OBJ-AT ?auto_234486 ?auto_234493 ) ( OBJ-AT ?auto_234485 ?auto_234490 ) ( TRUCK-AT ?auto_234491 ?auto_234484 ) ( not ( = ?auto_234485 ?auto_234486 ) ) ( not ( = ?auto_234493 ?auto_234490 ) ) ( not ( = ?auto_234485 ?auto_234487 ) ) ( not ( = ?auto_234486 ?auto_234487 ) ) ( not ( = ?auto_234492 ?auto_234493 ) ) ( not ( = ?auto_234492 ?auto_234490 ) ) ( not ( = ?auto_234485 ?auto_234488 ) ) ( not ( = ?auto_234486 ?auto_234488 ) ) ( not ( = ?auto_234487 ?auto_234488 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_234485 ?auto_234486 ?auto_234487 ?auto_234484 )
      ( DELIVER-1PKG ?auto_234488 ?auto_234484 )
      ( DELIVER-4PKG-VERIFY ?auto_234485 ?auto_234486 ?auto_234487 ?auto_234488 ?auto_234484 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234517 - OBJ
      ?auto_234518 - OBJ
      ?auto_234519 - OBJ
      ?auto_234520 - OBJ
      ?auto_234516 - LOCATION
    )
    :vars
    (
      ?auto_234525 - LOCATION
      ?auto_234524 - CITY
      ?auto_234522 - LOCATION
      ?auto_234521 - LOCATION
      ?auto_234523 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_234525 ?auto_234524 ) ( IN-CITY ?auto_234516 ?auto_234524 ) ( not ( = ?auto_234516 ?auto_234525 ) ) ( OBJ-AT ?auto_234519 ?auto_234525 ) ( IN-CITY ?auto_234522 ?auto_234524 ) ( not ( = ?auto_234516 ?auto_234522 ) ) ( OBJ-AT ?auto_234520 ?auto_234522 ) ( IN-CITY ?auto_234521 ?auto_234524 ) ( not ( = ?auto_234516 ?auto_234521 ) ) ( OBJ-AT ?auto_234518 ?auto_234521 ) ( OBJ-AT ?auto_234517 ?auto_234525 ) ( TRUCK-AT ?auto_234523 ?auto_234516 ) ( not ( = ?auto_234517 ?auto_234518 ) ) ( not ( = ?auto_234521 ?auto_234525 ) ) ( not ( = ?auto_234517 ?auto_234520 ) ) ( not ( = ?auto_234518 ?auto_234520 ) ) ( not ( = ?auto_234522 ?auto_234521 ) ) ( not ( = ?auto_234522 ?auto_234525 ) ) ( not ( = ?auto_234517 ?auto_234519 ) ) ( not ( = ?auto_234518 ?auto_234519 ) ) ( not ( = ?auto_234520 ?auto_234519 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_234517 ?auto_234518 ?auto_234520 ?auto_234519 ?auto_234516 )
      ( DELIVER-4PKG-VERIFY ?auto_234517 ?auto_234518 ?auto_234519 ?auto_234520 ?auto_234516 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234671 - OBJ
      ?auto_234672 - OBJ
      ?auto_234673 - OBJ
      ?auto_234674 - OBJ
      ?auto_234670 - LOCATION
    )
    :vars
    (
      ?auto_234679 - LOCATION
      ?auto_234677 - CITY
      ?auto_234678 - LOCATION
      ?auto_234676 - LOCATION
      ?auto_234675 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_234679 ?auto_234677 ) ( IN-CITY ?auto_234670 ?auto_234677 ) ( not ( = ?auto_234670 ?auto_234679 ) ) ( OBJ-AT ?auto_234672 ?auto_234679 ) ( IN-CITY ?auto_234678 ?auto_234677 ) ( not ( = ?auto_234670 ?auto_234678 ) ) ( OBJ-AT ?auto_234674 ?auto_234678 ) ( IN-CITY ?auto_234676 ?auto_234677 ) ( not ( = ?auto_234670 ?auto_234676 ) ) ( OBJ-AT ?auto_234673 ?auto_234676 ) ( OBJ-AT ?auto_234671 ?auto_234679 ) ( TRUCK-AT ?auto_234675 ?auto_234670 ) ( not ( = ?auto_234671 ?auto_234673 ) ) ( not ( = ?auto_234676 ?auto_234679 ) ) ( not ( = ?auto_234671 ?auto_234674 ) ) ( not ( = ?auto_234673 ?auto_234674 ) ) ( not ( = ?auto_234678 ?auto_234676 ) ) ( not ( = ?auto_234678 ?auto_234679 ) ) ( not ( = ?auto_234671 ?auto_234672 ) ) ( not ( = ?auto_234673 ?auto_234672 ) ) ( not ( = ?auto_234674 ?auto_234672 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_234671 ?auto_234673 ?auto_234672 ?auto_234674 ?auto_234670 )
      ( DELIVER-4PKG-VERIFY ?auto_234671 ?auto_234672 ?auto_234673 ?auto_234674 ?auto_234670 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234798 - OBJ
      ?auto_234799 - OBJ
      ?auto_234800 - OBJ
      ?auto_234801 - OBJ
      ?auto_234797 - LOCATION
    )
    :vars
    (
      ?auto_234806 - LOCATION
      ?auto_234804 - CITY
      ?auto_234805 - LOCATION
      ?auto_234803 - LOCATION
      ?auto_234802 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_234806 ?auto_234804 ) ( IN-CITY ?auto_234797 ?auto_234804 ) ( not ( = ?auto_234797 ?auto_234806 ) ) ( OBJ-AT ?auto_234801 ?auto_234806 ) ( IN-CITY ?auto_234805 ?auto_234804 ) ( not ( = ?auto_234797 ?auto_234805 ) ) ( OBJ-AT ?auto_234800 ?auto_234805 ) ( IN-CITY ?auto_234803 ?auto_234804 ) ( not ( = ?auto_234797 ?auto_234803 ) ) ( OBJ-AT ?auto_234798 ?auto_234803 ) ( OBJ-AT ?auto_234799 ?auto_234806 ) ( TRUCK-AT ?auto_234802 ?auto_234797 ) ( not ( = ?auto_234799 ?auto_234798 ) ) ( not ( = ?auto_234803 ?auto_234806 ) ) ( not ( = ?auto_234799 ?auto_234800 ) ) ( not ( = ?auto_234798 ?auto_234800 ) ) ( not ( = ?auto_234805 ?auto_234803 ) ) ( not ( = ?auto_234805 ?auto_234806 ) ) ( not ( = ?auto_234799 ?auto_234801 ) ) ( not ( = ?auto_234798 ?auto_234801 ) ) ( not ( = ?auto_234800 ?auto_234801 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_234799 ?auto_234798 ?auto_234801 ?auto_234800 ?auto_234797 )
      ( DELIVER-4PKG-VERIFY ?auto_234798 ?auto_234799 ?auto_234800 ?auto_234801 ?auto_234797 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234830 - OBJ
      ?auto_234831 - OBJ
      ?auto_234832 - OBJ
      ?auto_234833 - OBJ
      ?auto_234829 - LOCATION
    )
    :vars
    (
      ?auto_234838 - LOCATION
      ?auto_234836 - CITY
      ?auto_234837 - LOCATION
      ?auto_234835 - LOCATION
      ?auto_234834 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_234838 ?auto_234836 ) ( IN-CITY ?auto_234829 ?auto_234836 ) ( not ( = ?auto_234829 ?auto_234838 ) ) ( OBJ-AT ?auto_234832 ?auto_234838 ) ( IN-CITY ?auto_234837 ?auto_234836 ) ( not ( = ?auto_234829 ?auto_234837 ) ) ( OBJ-AT ?auto_234833 ?auto_234837 ) ( IN-CITY ?auto_234835 ?auto_234836 ) ( not ( = ?auto_234829 ?auto_234835 ) ) ( OBJ-AT ?auto_234830 ?auto_234835 ) ( OBJ-AT ?auto_234831 ?auto_234838 ) ( TRUCK-AT ?auto_234834 ?auto_234829 ) ( not ( = ?auto_234831 ?auto_234830 ) ) ( not ( = ?auto_234835 ?auto_234838 ) ) ( not ( = ?auto_234831 ?auto_234833 ) ) ( not ( = ?auto_234830 ?auto_234833 ) ) ( not ( = ?auto_234837 ?auto_234835 ) ) ( not ( = ?auto_234837 ?auto_234838 ) ) ( not ( = ?auto_234831 ?auto_234832 ) ) ( not ( = ?auto_234830 ?auto_234832 ) ) ( not ( = ?auto_234833 ?auto_234832 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_234831 ?auto_234830 ?auto_234832 ?auto_234833 ?auto_234829 )
      ( DELIVER-4PKG-VERIFY ?auto_234830 ?auto_234831 ?auto_234832 ?auto_234833 ?auto_234829 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234931 - OBJ
      ?auto_234932 - OBJ
      ?auto_234933 - OBJ
      ?auto_234934 - OBJ
      ?auto_234930 - LOCATION
    )
    :vars
    (
      ?auto_234939 - LOCATION
      ?auto_234937 - CITY
      ?auto_234938 - LOCATION
      ?auto_234936 - LOCATION
      ?auto_234935 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_234939 ?auto_234937 ) ( IN-CITY ?auto_234930 ?auto_234937 ) ( not ( = ?auto_234930 ?auto_234939 ) ) ( OBJ-AT ?auto_234934 ?auto_234939 ) ( IN-CITY ?auto_234938 ?auto_234937 ) ( not ( = ?auto_234930 ?auto_234938 ) ) ( OBJ-AT ?auto_234932 ?auto_234938 ) ( IN-CITY ?auto_234936 ?auto_234937 ) ( not ( = ?auto_234930 ?auto_234936 ) ) ( OBJ-AT ?auto_234931 ?auto_234936 ) ( OBJ-AT ?auto_234933 ?auto_234939 ) ( TRUCK-AT ?auto_234935 ?auto_234930 ) ( not ( = ?auto_234933 ?auto_234931 ) ) ( not ( = ?auto_234936 ?auto_234939 ) ) ( not ( = ?auto_234933 ?auto_234932 ) ) ( not ( = ?auto_234931 ?auto_234932 ) ) ( not ( = ?auto_234938 ?auto_234936 ) ) ( not ( = ?auto_234938 ?auto_234939 ) ) ( not ( = ?auto_234933 ?auto_234934 ) ) ( not ( = ?auto_234931 ?auto_234934 ) ) ( not ( = ?auto_234932 ?auto_234934 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_234933 ?auto_234931 ?auto_234934 ?auto_234932 ?auto_234930 )
      ( DELIVER-4PKG-VERIFY ?auto_234931 ?auto_234932 ?auto_234933 ?auto_234934 ?auto_234930 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_249977 - OBJ
      ?auto_249978 - OBJ
      ?auto_249979 - OBJ
      ?auto_249980 - OBJ
      ?auto_249981 - OBJ
      ?auto_249976 - LOCATION
    )
    :vars
    (
      ?auto_249982 - LOCATION
      ?auto_249983 - CITY
      ?auto_249987 - LOCATION
      ?auto_249986 - LOCATION
      ?auto_249985 - LOCATION
      ?auto_249984 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_249982 ?auto_249983 ) ( IN-CITY ?auto_249976 ?auto_249983 ) ( not ( = ?auto_249976 ?auto_249982 ) ) ( OBJ-AT ?auto_249981 ?auto_249982 ) ( IN-CITY ?auto_249987 ?auto_249983 ) ( not ( = ?auto_249976 ?auto_249987 ) ) ( OBJ-AT ?auto_249980 ?auto_249987 ) ( IN-CITY ?auto_249986 ?auto_249983 ) ( not ( = ?auto_249976 ?auto_249986 ) ) ( OBJ-AT ?auto_249979 ?auto_249986 ) ( IN-CITY ?auto_249985 ?auto_249983 ) ( not ( = ?auto_249976 ?auto_249985 ) ) ( OBJ-AT ?auto_249978 ?auto_249985 ) ( OBJ-AT ?auto_249977 ?auto_249987 ) ( TRUCK-AT ?auto_249984 ?auto_249976 ) ( not ( = ?auto_249977 ?auto_249978 ) ) ( not ( = ?auto_249985 ?auto_249987 ) ) ( not ( = ?auto_249977 ?auto_249979 ) ) ( not ( = ?auto_249978 ?auto_249979 ) ) ( not ( = ?auto_249986 ?auto_249985 ) ) ( not ( = ?auto_249986 ?auto_249987 ) ) ( not ( = ?auto_249977 ?auto_249980 ) ) ( not ( = ?auto_249978 ?auto_249980 ) ) ( not ( = ?auto_249979 ?auto_249980 ) ) ( not ( = ?auto_249977 ?auto_249981 ) ) ( not ( = ?auto_249978 ?auto_249981 ) ) ( not ( = ?auto_249979 ?auto_249981 ) ) ( not ( = ?auto_249980 ?auto_249981 ) ) ( not ( = ?auto_249982 ?auto_249987 ) ) ( not ( = ?auto_249982 ?auto_249986 ) ) ( not ( = ?auto_249982 ?auto_249985 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_249977 ?auto_249978 ?auto_249980 ?auto_249979 ?auto_249976 )
      ( DELIVER-1PKG ?auto_249981 ?auto_249976 )
      ( DELIVER-5PKG-VERIFY ?auto_249977 ?auto_249978 ?auto_249979 ?auto_249980 ?auto_249981 ?auto_249976 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_250028 - OBJ
      ?auto_250029 - OBJ
      ?auto_250030 - OBJ
      ?auto_250031 - OBJ
      ?auto_250032 - OBJ
      ?auto_250027 - LOCATION
    )
    :vars
    (
      ?auto_250037 - LOCATION
      ?auto_250034 - CITY
      ?auto_250038 - LOCATION
      ?auto_250036 - LOCATION
      ?auto_250035 - LOCATION
      ?auto_250033 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_250037 ?auto_250034 ) ( IN-CITY ?auto_250027 ?auto_250034 ) ( not ( = ?auto_250027 ?auto_250037 ) ) ( OBJ-AT ?auto_250031 ?auto_250037 ) ( IN-CITY ?auto_250038 ?auto_250034 ) ( not ( = ?auto_250027 ?auto_250038 ) ) ( OBJ-AT ?auto_250032 ?auto_250038 ) ( IN-CITY ?auto_250036 ?auto_250034 ) ( not ( = ?auto_250027 ?auto_250036 ) ) ( OBJ-AT ?auto_250030 ?auto_250036 ) ( IN-CITY ?auto_250035 ?auto_250034 ) ( not ( = ?auto_250027 ?auto_250035 ) ) ( OBJ-AT ?auto_250029 ?auto_250035 ) ( OBJ-AT ?auto_250028 ?auto_250038 ) ( TRUCK-AT ?auto_250033 ?auto_250027 ) ( not ( = ?auto_250028 ?auto_250029 ) ) ( not ( = ?auto_250035 ?auto_250038 ) ) ( not ( = ?auto_250028 ?auto_250030 ) ) ( not ( = ?auto_250029 ?auto_250030 ) ) ( not ( = ?auto_250036 ?auto_250035 ) ) ( not ( = ?auto_250036 ?auto_250038 ) ) ( not ( = ?auto_250028 ?auto_250032 ) ) ( not ( = ?auto_250029 ?auto_250032 ) ) ( not ( = ?auto_250030 ?auto_250032 ) ) ( not ( = ?auto_250028 ?auto_250031 ) ) ( not ( = ?auto_250029 ?auto_250031 ) ) ( not ( = ?auto_250030 ?auto_250031 ) ) ( not ( = ?auto_250032 ?auto_250031 ) ) ( not ( = ?auto_250037 ?auto_250038 ) ) ( not ( = ?auto_250037 ?auto_250036 ) ) ( not ( = ?auto_250037 ?auto_250035 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_250028 ?auto_250029 ?auto_250030 ?auto_250032 ?auto_250031 ?auto_250027 )
      ( DELIVER-5PKG-VERIFY ?auto_250028 ?auto_250029 ?auto_250030 ?auto_250031 ?auto_250032 ?auto_250027 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_250079 - OBJ
      ?auto_250080 - OBJ
      ?auto_250081 - OBJ
      ?auto_250082 - OBJ
      ?auto_250083 - OBJ
      ?auto_250078 - LOCATION
    )
    :vars
    (
      ?auto_250086 - LOCATION
      ?auto_250089 - CITY
      ?auto_250087 - LOCATION
      ?auto_250088 - LOCATION
      ?auto_250084 - LOCATION
      ?auto_250085 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_250086 ?auto_250089 ) ( IN-CITY ?auto_250078 ?auto_250089 ) ( not ( = ?auto_250078 ?auto_250086 ) ) ( OBJ-AT ?auto_250083 ?auto_250086 ) ( IN-CITY ?auto_250087 ?auto_250089 ) ( not ( = ?auto_250078 ?auto_250087 ) ) ( OBJ-AT ?auto_250081 ?auto_250087 ) ( IN-CITY ?auto_250088 ?auto_250089 ) ( not ( = ?auto_250078 ?auto_250088 ) ) ( OBJ-AT ?auto_250082 ?auto_250088 ) ( IN-CITY ?auto_250084 ?auto_250089 ) ( not ( = ?auto_250078 ?auto_250084 ) ) ( OBJ-AT ?auto_250080 ?auto_250084 ) ( OBJ-AT ?auto_250079 ?auto_250087 ) ( TRUCK-AT ?auto_250085 ?auto_250078 ) ( not ( = ?auto_250079 ?auto_250080 ) ) ( not ( = ?auto_250084 ?auto_250087 ) ) ( not ( = ?auto_250079 ?auto_250082 ) ) ( not ( = ?auto_250080 ?auto_250082 ) ) ( not ( = ?auto_250088 ?auto_250084 ) ) ( not ( = ?auto_250088 ?auto_250087 ) ) ( not ( = ?auto_250079 ?auto_250081 ) ) ( not ( = ?auto_250080 ?auto_250081 ) ) ( not ( = ?auto_250082 ?auto_250081 ) ) ( not ( = ?auto_250079 ?auto_250083 ) ) ( not ( = ?auto_250080 ?auto_250083 ) ) ( not ( = ?auto_250082 ?auto_250083 ) ) ( not ( = ?auto_250081 ?auto_250083 ) ) ( not ( = ?auto_250086 ?auto_250087 ) ) ( not ( = ?auto_250086 ?auto_250088 ) ) ( not ( = ?auto_250086 ?auto_250084 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_250079 ?auto_250080 ?auto_250082 ?auto_250083 ?auto_250081 ?auto_250078 )
      ( DELIVER-5PKG-VERIFY ?auto_250079 ?auto_250080 ?auto_250081 ?auto_250082 ?auto_250083 ?auto_250078 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_251400 - OBJ
      ?auto_251401 - OBJ
      ?auto_251402 - OBJ
      ?auto_251403 - OBJ
      ?auto_251404 - OBJ
      ?auto_251399 - LOCATION
    )
    :vars
    (
      ?auto_251407 - LOCATION
      ?auto_251410 - CITY
      ?auto_251408 - LOCATION
      ?auto_251409 - LOCATION
      ?auto_251405 - LOCATION
      ?auto_251406 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_251407 ?auto_251410 ) ( IN-CITY ?auto_251399 ?auto_251410 ) ( not ( = ?auto_251399 ?auto_251407 ) ) ( OBJ-AT ?auto_251404 ?auto_251407 ) ( IN-CITY ?auto_251408 ?auto_251410 ) ( not ( = ?auto_251399 ?auto_251408 ) ) ( OBJ-AT ?auto_251401 ?auto_251408 ) ( IN-CITY ?auto_251409 ?auto_251410 ) ( not ( = ?auto_251399 ?auto_251409 ) ) ( OBJ-AT ?auto_251403 ?auto_251409 ) ( IN-CITY ?auto_251405 ?auto_251410 ) ( not ( = ?auto_251399 ?auto_251405 ) ) ( OBJ-AT ?auto_251402 ?auto_251405 ) ( OBJ-AT ?auto_251400 ?auto_251408 ) ( TRUCK-AT ?auto_251406 ?auto_251399 ) ( not ( = ?auto_251400 ?auto_251402 ) ) ( not ( = ?auto_251405 ?auto_251408 ) ) ( not ( = ?auto_251400 ?auto_251403 ) ) ( not ( = ?auto_251402 ?auto_251403 ) ) ( not ( = ?auto_251409 ?auto_251405 ) ) ( not ( = ?auto_251409 ?auto_251408 ) ) ( not ( = ?auto_251400 ?auto_251401 ) ) ( not ( = ?auto_251402 ?auto_251401 ) ) ( not ( = ?auto_251403 ?auto_251401 ) ) ( not ( = ?auto_251400 ?auto_251404 ) ) ( not ( = ?auto_251402 ?auto_251404 ) ) ( not ( = ?auto_251403 ?auto_251404 ) ) ( not ( = ?auto_251401 ?auto_251404 ) ) ( not ( = ?auto_251407 ?auto_251408 ) ) ( not ( = ?auto_251407 ?auto_251409 ) ) ( not ( = ?auto_251407 ?auto_251405 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_251400 ?auto_251402 ?auto_251403 ?auto_251404 ?auto_251401 ?auto_251399 )
      ( DELIVER-5PKG-VERIFY ?auto_251400 ?auto_251401 ?auto_251402 ?auto_251403 ?auto_251404 ?auto_251399 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_253967 - OBJ
      ?auto_253968 - OBJ
      ?auto_253969 - OBJ
      ?auto_253970 - OBJ
      ?auto_253971 - OBJ
      ?auto_253966 - LOCATION
    )
    :vars
    (
      ?auto_253974 - LOCATION
      ?auto_253977 - CITY
      ?auto_253975 - LOCATION
      ?auto_253976 - LOCATION
      ?auto_253972 - LOCATION
      ?auto_253973 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_253974 ?auto_253977 ) ( IN-CITY ?auto_253966 ?auto_253977 ) ( not ( = ?auto_253966 ?auto_253974 ) ) ( OBJ-AT ?auto_253971 ?auto_253974 ) ( IN-CITY ?auto_253975 ?auto_253977 ) ( not ( = ?auto_253966 ?auto_253975 ) ) ( OBJ-AT ?auto_253970 ?auto_253975 ) ( IN-CITY ?auto_253976 ?auto_253977 ) ( not ( = ?auto_253966 ?auto_253976 ) ) ( OBJ-AT ?auto_253969 ?auto_253976 ) ( IN-CITY ?auto_253972 ?auto_253977 ) ( not ( = ?auto_253966 ?auto_253972 ) ) ( OBJ-AT ?auto_253967 ?auto_253972 ) ( OBJ-AT ?auto_253968 ?auto_253975 ) ( TRUCK-AT ?auto_253973 ?auto_253966 ) ( not ( = ?auto_253968 ?auto_253967 ) ) ( not ( = ?auto_253972 ?auto_253975 ) ) ( not ( = ?auto_253968 ?auto_253969 ) ) ( not ( = ?auto_253967 ?auto_253969 ) ) ( not ( = ?auto_253976 ?auto_253972 ) ) ( not ( = ?auto_253976 ?auto_253975 ) ) ( not ( = ?auto_253968 ?auto_253970 ) ) ( not ( = ?auto_253967 ?auto_253970 ) ) ( not ( = ?auto_253969 ?auto_253970 ) ) ( not ( = ?auto_253968 ?auto_253971 ) ) ( not ( = ?auto_253967 ?auto_253971 ) ) ( not ( = ?auto_253969 ?auto_253971 ) ) ( not ( = ?auto_253970 ?auto_253971 ) ) ( not ( = ?auto_253974 ?auto_253975 ) ) ( not ( = ?auto_253974 ?auto_253976 ) ) ( not ( = ?auto_253974 ?auto_253972 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_253968 ?auto_253967 ?auto_253969 ?auto_253971 ?auto_253970 ?auto_253966 )
      ( DELIVER-5PKG-VERIFY ?auto_253967 ?auto_253968 ?auto_253969 ?auto_253970 ?auto_253971 ?auto_253966 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_254018 - OBJ
      ?auto_254019 - OBJ
      ?auto_254020 - OBJ
      ?auto_254021 - OBJ
      ?auto_254022 - OBJ
      ?auto_254017 - LOCATION
    )
    :vars
    (
      ?auto_254025 - LOCATION
      ?auto_254028 - CITY
      ?auto_254026 - LOCATION
      ?auto_254027 - LOCATION
      ?auto_254023 - LOCATION
      ?auto_254024 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_254025 ?auto_254028 ) ( IN-CITY ?auto_254017 ?auto_254028 ) ( not ( = ?auto_254017 ?auto_254025 ) ) ( OBJ-AT ?auto_254021 ?auto_254025 ) ( IN-CITY ?auto_254026 ?auto_254028 ) ( not ( = ?auto_254017 ?auto_254026 ) ) ( OBJ-AT ?auto_254022 ?auto_254026 ) ( IN-CITY ?auto_254027 ?auto_254028 ) ( not ( = ?auto_254017 ?auto_254027 ) ) ( OBJ-AT ?auto_254020 ?auto_254027 ) ( IN-CITY ?auto_254023 ?auto_254028 ) ( not ( = ?auto_254017 ?auto_254023 ) ) ( OBJ-AT ?auto_254018 ?auto_254023 ) ( OBJ-AT ?auto_254019 ?auto_254026 ) ( TRUCK-AT ?auto_254024 ?auto_254017 ) ( not ( = ?auto_254019 ?auto_254018 ) ) ( not ( = ?auto_254023 ?auto_254026 ) ) ( not ( = ?auto_254019 ?auto_254020 ) ) ( not ( = ?auto_254018 ?auto_254020 ) ) ( not ( = ?auto_254027 ?auto_254023 ) ) ( not ( = ?auto_254027 ?auto_254026 ) ) ( not ( = ?auto_254019 ?auto_254022 ) ) ( not ( = ?auto_254018 ?auto_254022 ) ) ( not ( = ?auto_254020 ?auto_254022 ) ) ( not ( = ?auto_254019 ?auto_254021 ) ) ( not ( = ?auto_254018 ?auto_254021 ) ) ( not ( = ?auto_254020 ?auto_254021 ) ) ( not ( = ?auto_254022 ?auto_254021 ) ) ( not ( = ?auto_254025 ?auto_254026 ) ) ( not ( = ?auto_254025 ?auto_254027 ) ) ( not ( = ?auto_254025 ?auto_254023 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_254019 ?auto_254018 ?auto_254020 ?auto_254021 ?auto_254022 ?auto_254017 )
      ( DELIVER-5PKG-VERIFY ?auto_254018 ?auto_254019 ?auto_254020 ?auto_254021 ?auto_254022 ?auto_254017 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_254069 - OBJ
      ?auto_254070 - OBJ
      ?auto_254071 - OBJ
      ?auto_254072 - OBJ
      ?auto_254073 - OBJ
      ?auto_254068 - LOCATION
    )
    :vars
    (
      ?auto_254076 - LOCATION
      ?auto_254079 - CITY
      ?auto_254077 - LOCATION
      ?auto_254078 - LOCATION
      ?auto_254074 - LOCATION
      ?auto_254075 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_254076 ?auto_254079 ) ( IN-CITY ?auto_254068 ?auto_254079 ) ( not ( = ?auto_254068 ?auto_254076 ) ) ( OBJ-AT ?auto_254073 ?auto_254076 ) ( IN-CITY ?auto_254077 ?auto_254079 ) ( not ( = ?auto_254068 ?auto_254077 ) ) ( OBJ-AT ?auto_254071 ?auto_254077 ) ( IN-CITY ?auto_254078 ?auto_254079 ) ( not ( = ?auto_254068 ?auto_254078 ) ) ( OBJ-AT ?auto_254072 ?auto_254078 ) ( IN-CITY ?auto_254074 ?auto_254079 ) ( not ( = ?auto_254068 ?auto_254074 ) ) ( OBJ-AT ?auto_254069 ?auto_254074 ) ( OBJ-AT ?auto_254070 ?auto_254077 ) ( TRUCK-AT ?auto_254075 ?auto_254068 ) ( not ( = ?auto_254070 ?auto_254069 ) ) ( not ( = ?auto_254074 ?auto_254077 ) ) ( not ( = ?auto_254070 ?auto_254072 ) ) ( not ( = ?auto_254069 ?auto_254072 ) ) ( not ( = ?auto_254078 ?auto_254074 ) ) ( not ( = ?auto_254078 ?auto_254077 ) ) ( not ( = ?auto_254070 ?auto_254071 ) ) ( not ( = ?auto_254069 ?auto_254071 ) ) ( not ( = ?auto_254072 ?auto_254071 ) ) ( not ( = ?auto_254070 ?auto_254073 ) ) ( not ( = ?auto_254069 ?auto_254073 ) ) ( not ( = ?auto_254072 ?auto_254073 ) ) ( not ( = ?auto_254071 ?auto_254073 ) ) ( not ( = ?auto_254076 ?auto_254077 ) ) ( not ( = ?auto_254076 ?auto_254078 ) ) ( not ( = ?auto_254076 ?auto_254074 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_254070 ?auto_254069 ?auto_254072 ?auto_254073 ?auto_254071 ?auto_254068 )
      ( DELIVER-5PKG-VERIFY ?auto_254069 ?auto_254070 ?auto_254071 ?auto_254072 ?auto_254073 ?auto_254068 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_255354 - OBJ
      ?auto_255355 - OBJ
      ?auto_255356 - OBJ
      ?auto_255357 - OBJ
      ?auto_255358 - OBJ
      ?auto_255353 - LOCATION
    )
    :vars
    (
      ?auto_255361 - LOCATION
      ?auto_255364 - CITY
      ?auto_255362 - LOCATION
      ?auto_255363 - LOCATION
      ?auto_255359 - LOCATION
      ?auto_255360 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_255361 ?auto_255364 ) ( IN-CITY ?auto_255353 ?auto_255364 ) ( not ( = ?auto_255353 ?auto_255361 ) ) ( OBJ-AT ?auto_255358 ?auto_255361 ) ( IN-CITY ?auto_255362 ?auto_255364 ) ( not ( = ?auto_255353 ?auto_255362 ) ) ( OBJ-AT ?auto_255357 ?auto_255362 ) ( IN-CITY ?auto_255363 ?auto_255364 ) ( not ( = ?auto_255353 ?auto_255363 ) ) ( OBJ-AT ?auto_255355 ?auto_255363 ) ( IN-CITY ?auto_255359 ?auto_255364 ) ( not ( = ?auto_255353 ?auto_255359 ) ) ( OBJ-AT ?auto_255354 ?auto_255359 ) ( OBJ-AT ?auto_255356 ?auto_255362 ) ( TRUCK-AT ?auto_255360 ?auto_255353 ) ( not ( = ?auto_255356 ?auto_255354 ) ) ( not ( = ?auto_255359 ?auto_255362 ) ) ( not ( = ?auto_255356 ?auto_255355 ) ) ( not ( = ?auto_255354 ?auto_255355 ) ) ( not ( = ?auto_255363 ?auto_255359 ) ) ( not ( = ?auto_255363 ?auto_255362 ) ) ( not ( = ?auto_255356 ?auto_255357 ) ) ( not ( = ?auto_255354 ?auto_255357 ) ) ( not ( = ?auto_255355 ?auto_255357 ) ) ( not ( = ?auto_255356 ?auto_255358 ) ) ( not ( = ?auto_255354 ?auto_255358 ) ) ( not ( = ?auto_255355 ?auto_255358 ) ) ( not ( = ?auto_255357 ?auto_255358 ) ) ( not ( = ?auto_255361 ?auto_255362 ) ) ( not ( = ?auto_255361 ?auto_255363 ) ) ( not ( = ?auto_255361 ?auto_255359 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_255356 ?auto_255354 ?auto_255355 ?auto_255358 ?auto_255357 ?auto_255353 )
      ( DELIVER-5PKG-VERIFY ?auto_255354 ?auto_255355 ?auto_255356 ?auto_255357 ?auto_255358 ?auto_255353 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_255405 - OBJ
      ?auto_255406 - OBJ
      ?auto_255407 - OBJ
      ?auto_255408 - OBJ
      ?auto_255409 - OBJ
      ?auto_255404 - LOCATION
    )
    :vars
    (
      ?auto_255412 - LOCATION
      ?auto_255415 - CITY
      ?auto_255413 - LOCATION
      ?auto_255414 - LOCATION
      ?auto_255410 - LOCATION
      ?auto_255411 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_255412 ?auto_255415 ) ( IN-CITY ?auto_255404 ?auto_255415 ) ( not ( = ?auto_255404 ?auto_255412 ) ) ( OBJ-AT ?auto_255408 ?auto_255412 ) ( IN-CITY ?auto_255413 ?auto_255415 ) ( not ( = ?auto_255404 ?auto_255413 ) ) ( OBJ-AT ?auto_255409 ?auto_255413 ) ( IN-CITY ?auto_255414 ?auto_255415 ) ( not ( = ?auto_255404 ?auto_255414 ) ) ( OBJ-AT ?auto_255406 ?auto_255414 ) ( IN-CITY ?auto_255410 ?auto_255415 ) ( not ( = ?auto_255404 ?auto_255410 ) ) ( OBJ-AT ?auto_255405 ?auto_255410 ) ( OBJ-AT ?auto_255407 ?auto_255413 ) ( TRUCK-AT ?auto_255411 ?auto_255404 ) ( not ( = ?auto_255407 ?auto_255405 ) ) ( not ( = ?auto_255410 ?auto_255413 ) ) ( not ( = ?auto_255407 ?auto_255406 ) ) ( not ( = ?auto_255405 ?auto_255406 ) ) ( not ( = ?auto_255414 ?auto_255410 ) ) ( not ( = ?auto_255414 ?auto_255413 ) ) ( not ( = ?auto_255407 ?auto_255409 ) ) ( not ( = ?auto_255405 ?auto_255409 ) ) ( not ( = ?auto_255406 ?auto_255409 ) ) ( not ( = ?auto_255407 ?auto_255408 ) ) ( not ( = ?auto_255405 ?auto_255408 ) ) ( not ( = ?auto_255406 ?auto_255408 ) ) ( not ( = ?auto_255409 ?auto_255408 ) ) ( not ( = ?auto_255412 ?auto_255413 ) ) ( not ( = ?auto_255412 ?auto_255414 ) ) ( not ( = ?auto_255412 ?auto_255410 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_255407 ?auto_255405 ?auto_255406 ?auto_255408 ?auto_255409 ?auto_255404 )
      ( DELIVER-5PKG-VERIFY ?auto_255405 ?auto_255406 ?auto_255407 ?auto_255408 ?auto_255409 ?auto_255404 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_255816 - OBJ
      ?auto_255817 - OBJ
      ?auto_255818 - OBJ
      ?auto_255819 - OBJ
      ?auto_255820 - OBJ
      ?auto_255815 - LOCATION
    )
    :vars
    (
      ?auto_255823 - LOCATION
      ?auto_255826 - CITY
      ?auto_255824 - LOCATION
      ?auto_255825 - LOCATION
      ?auto_255821 - LOCATION
      ?auto_255822 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_255823 ?auto_255826 ) ( IN-CITY ?auto_255815 ?auto_255826 ) ( not ( = ?auto_255815 ?auto_255823 ) ) ( OBJ-AT ?auto_255818 ?auto_255823 ) ( IN-CITY ?auto_255824 ?auto_255826 ) ( not ( = ?auto_255815 ?auto_255824 ) ) ( OBJ-AT ?auto_255820 ?auto_255824 ) ( IN-CITY ?auto_255825 ?auto_255826 ) ( not ( = ?auto_255815 ?auto_255825 ) ) ( OBJ-AT ?auto_255817 ?auto_255825 ) ( IN-CITY ?auto_255821 ?auto_255826 ) ( not ( = ?auto_255815 ?auto_255821 ) ) ( OBJ-AT ?auto_255816 ?auto_255821 ) ( OBJ-AT ?auto_255819 ?auto_255824 ) ( TRUCK-AT ?auto_255822 ?auto_255815 ) ( not ( = ?auto_255819 ?auto_255816 ) ) ( not ( = ?auto_255821 ?auto_255824 ) ) ( not ( = ?auto_255819 ?auto_255817 ) ) ( not ( = ?auto_255816 ?auto_255817 ) ) ( not ( = ?auto_255825 ?auto_255821 ) ) ( not ( = ?auto_255825 ?auto_255824 ) ) ( not ( = ?auto_255819 ?auto_255820 ) ) ( not ( = ?auto_255816 ?auto_255820 ) ) ( not ( = ?auto_255817 ?auto_255820 ) ) ( not ( = ?auto_255819 ?auto_255818 ) ) ( not ( = ?auto_255816 ?auto_255818 ) ) ( not ( = ?auto_255817 ?auto_255818 ) ) ( not ( = ?auto_255820 ?auto_255818 ) ) ( not ( = ?auto_255823 ?auto_255824 ) ) ( not ( = ?auto_255823 ?auto_255825 ) ) ( not ( = ?auto_255823 ?auto_255821 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_255819 ?auto_255816 ?auto_255817 ?auto_255818 ?auto_255820 ?auto_255815 )
      ( DELIVER-5PKG-VERIFY ?auto_255816 ?auto_255817 ?auto_255818 ?auto_255819 ?auto_255820 ?auto_255815 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_507221 - OBJ
      ?auto_507222 - OBJ
      ?auto_507223 - OBJ
      ?auto_507224 - OBJ
      ?auto_507225 - OBJ
      ?auto_507226 - OBJ
      ?auto_507220 - LOCATION
    )
    :vars
    (
      ?auto_507227 - LOCATION
      ?auto_507228 - CITY
      ?auto_507230 - LOCATION
      ?auto_507231 - LOCATION
      ?auto_507232 - LOCATION
      ?auto_507229 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_507227 ?auto_507228 ) ( IN-CITY ?auto_507220 ?auto_507228 ) ( not ( = ?auto_507220 ?auto_507227 ) ) ( OBJ-AT ?auto_507226 ?auto_507227 ) ( IN-CITY ?auto_507230 ?auto_507228 ) ( not ( = ?auto_507220 ?auto_507230 ) ) ( OBJ-AT ?auto_507225 ?auto_507230 ) ( IN-CITY ?auto_507231 ?auto_507228 ) ( not ( = ?auto_507220 ?auto_507231 ) ) ( OBJ-AT ?auto_507224 ?auto_507231 ) ( IN-CITY ?auto_507232 ?auto_507228 ) ( not ( = ?auto_507220 ?auto_507232 ) ) ( OBJ-AT ?auto_507223 ?auto_507232 ) ( OBJ-AT ?auto_507222 ?auto_507227 ) ( OBJ-AT ?auto_507221 ?auto_507231 ) ( TRUCK-AT ?auto_507229 ?auto_507220 ) ( not ( = ?auto_507221 ?auto_507222 ) ) ( not ( = ?auto_507227 ?auto_507231 ) ) ( not ( = ?auto_507221 ?auto_507223 ) ) ( not ( = ?auto_507222 ?auto_507223 ) ) ( not ( = ?auto_507232 ?auto_507227 ) ) ( not ( = ?auto_507232 ?auto_507231 ) ) ( not ( = ?auto_507221 ?auto_507224 ) ) ( not ( = ?auto_507222 ?auto_507224 ) ) ( not ( = ?auto_507223 ?auto_507224 ) ) ( not ( = ?auto_507221 ?auto_507225 ) ) ( not ( = ?auto_507222 ?auto_507225 ) ) ( not ( = ?auto_507223 ?auto_507225 ) ) ( not ( = ?auto_507224 ?auto_507225 ) ) ( not ( = ?auto_507230 ?auto_507231 ) ) ( not ( = ?auto_507230 ?auto_507232 ) ) ( not ( = ?auto_507230 ?auto_507227 ) ) ( not ( = ?auto_507221 ?auto_507226 ) ) ( not ( = ?auto_507222 ?auto_507226 ) ) ( not ( = ?auto_507223 ?auto_507226 ) ) ( not ( = ?auto_507224 ?auto_507226 ) ) ( not ( = ?auto_507225 ?auto_507226 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_507221 ?auto_507222 ?auto_507223 ?auto_507225 ?auto_507224 ?auto_507220 )
      ( DELIVER-1PKG ?auto_507226 ?auto_507220 )
      ( DELIVER-6PKG-VERIFY ?auto_507221 ?auto_507222 ?auto_507223 ?auto_507224 ?auto_507225 ?auto_507226 ?auto_507220 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_507290 - OBJ
      ?auto_507291 - OBJ
      ?auto_507292 - OBJ
      ?auto_507293 - OBJ
      ?auto_507294 - OBJ
      ?auto_507295 - OBJ
      ?auto_507289 - LOCATION
    )
    :vars
    (
      ?auto_507296 - LOCATION
      ?auto_507299 - CITY
      ?auto_507298 - LOCATION
      ?auto_507300 - LOCATION
      ?auto_507297 - LOCATION
      ?auto_507301 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_507296 ?auto_507299 ) ( IN-CITY ?auto_507289 ?auto_507299 ) ( not ( = ?auto_507289 ?auto_507296 ) ) ( OBJ-AT ?auto_507294 ?auto_507296 ) ( IN-CITY ?auto_507298 ?auto_507299 ) ( not ( = ?auto_507289 ?auto_507298 ) ) ( OBJ-AT ?auto_507295 ?auto_507298 ) ( IN-CITY ?auto_507300 ?auto_507299 ) ( not ( = ?auto_507289 ?auto_507300 ) ) ( OBJ-AT ?auto_507293 ?auto_507300 ) ( IN-CITY ?auto_507297 ?auto_507299 ) ( not ( = ?auto_507289 ?auto_507297 ) ) ( OBJ-AT ?auto_507292 ?auto_507297 ) ( OBJ-AT ?auto_507291 ?auto_507296 ) ( OBJ-AT ?auto_507290 ?auto_507300 ) ( TRUCK-AT ?auto_507301 ?auto_507289 ) ( not ( = ?auto_507290 ?auto_507291 ) ) ( not ( = ?auto_507296 ?auto_507300 ) ) ( not ( = ?auto_507290 ?auto_507292 ) ) ( not ( = ?auto_507291 ?auto_507292 ) ) ( not ( = ?auto_507297 ?auto_507296 ) ) ( not ( = ?auto_507297 ?auto_507300 ) ) ( not ( = ?auto_507290 ?auto_507293 ) ) ( not ( = ?auto_507291 ?auto_507293 ) ) ( not ( = ?auto_507292 ?auto_507293 ) ) ( not ( = ?auto_507290 ?auto_507295 ) ) ( not ( = ?auto_507291 ?auto_507295 ) ) ( not ( = ?auto_507292 ?auto_507295 ) ) ( not ( = ?auto_507293 ?auto_507295 ) ) ( not ( = ?auto_507298 ?auto_507300 ) ) ( not ( = ?auto_507298 ?auto_507297 ) ) ( not ( = ?auto_507298 ?auto_507296 ) ) ( not ( = ?auto_507290 ?auto_507294 ) ) ( not ( = ?auto_507291 ?auto_507294 ) ) ( not ( = ?auto_507292 ?auto_507294 ) ) ( not ( = ?auto_507293 ?auto_507294 ) ) ( not ( = ?auto_507295 ?auto_507294 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_507290 ?auto_507291 ?auto_507292 ?auto_507293 ?auto_507295 ?auto_507294 ?auto_507289 )
      ( DELIVER-6PKG-VERIFY ?auto_507290 ?auto_507291 ?auto_507292 ?auto_507293 ?auto_507294 ?auto_507295 ?auto_507289 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_507359 - OBJ
      ?auto_507360 - OBJ
      ?auto_507361 - OBJ
      ?auto_507362 - OBJ
      ?auto_507363 - OBJ
      ?auto_507364 - OBJ
      ?auto_507358 - LOCATION
    )
    :vars
    (
      ?auto_507367 - LOCATION
      ?auto_507368 - CITY
      ?auto_507369 - LOCATION
      ?auto_507366 - LOCATION
      ?auto_507370 - LOCATION
      ?auto_507365 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_507367 ?auto_507368 ) ( IN-CITY ?auto_507358 ?auto_507368 ) ( not ( = ?auto_507358 ?auto_507367 ) ) ( OBJ-AT ?auto_507364 ?auto_507367 ) ( IN-CITY ?auto_507369 ?auto_507368 ) ( not ( = ?auto_507358 ?auto_507369 ) ) ( OBJ-AT ?auto_507362 ?auto_507369 ) ( IN-CITY ?auto_507366 ?auto_507368 ) ( not ( = ?auto_507358 ?auto_507366 ) ) ( OBJ-AT ?auto_507363 ?auto_507366 ) ( IN-CITY ?auto_507370 ?auto_507368 ) ( not ( = ?auto_507358 ?auto_507370 ) ) ( OBJ-AT ?auto_507361 ?auto_507370 ) ( OBJ-AT ?auto_507360 ?auto_507367 ) ( OBJ-AT ?auto_507359 ?auto_507366 ) ( TRUCK-AT ?auto_507365 ?auto_507358 ) ( not ( = ?auto_507359 ?auto_507360 ) ) ( not ( = ?auto_507367 ?auto_507366 ) ) ( not ( = ?auto_507359 ?auto_507361 ) ) ( not ( = ?auto_507360 ?auto_507361 ) ) ( not ( = ?auto_507370 ?auto_507367 ) ) ( not ( = ?auto_507370 ?auto_507366 ) ) ( not ( = ?auto_507359 ?auto_507363 ) ) ( not ( = ?auto_507360 ?auto_507363 ) ) ( not ( = ?auto_507361 ?auto_507363 ) ) ( not ( = ?auto_507359 ?auto_507362 ) ) ( not ( = ?auto_507360 ?auto_507362 ) ) ( not ( = ?auto_507361 ?auto_507362 ) ) ( not ( = ?auto_507363 ?auto_507362 ) ) ( not ( = ?auto_507369 ?auto_507366 ) ) ( not ( = ?auto_507369 ?auto_507370 ) ) ( not ( = ?auto_507369 ?auto_507367 ) ) ( not ( = ?auto_507359 ?auto_507364 ) ) ( not ( = ?auto_507360 ?auto_507364 ) ) ( not ( = ?auto_507361 ?auto_507364 ) ) ( not ( = ?auto_507363 ?auto_507364 ) ) ( not ( = ?auto_507362 ?auto_507364 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_507359 ?auto_507360 ?auto_507361 ?auto_507363 ?auto_507364 ?auto_507362 ?auto_507358 )
      ( DELIVER-6PKG-VERIFY ?auto_507359 ?auto_507360 ?auto_507361 ?auto_507362 ?auto_507363 ?auto_507364 ?auto_507358 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_507428 - OBJ
      ?auto_507429 - OBJ
      ?auto_507430 - OBJ
      ?auto_507431 - OBJ
      ?auto_507432 - OBJ
      ?auto_507433 - OBJ
      ?auto_507427 - LOCATION
    )
    :vars
    (
      ?auto_507436 - LOCATION
      ?auto_507437 - CITY
      ?auto_507438 - LOCATION
      ?auto_507435 - LOCATION
      ?auto_507439 - LOCATION
      ?auto_507434 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_507436 ?auto_507437 ) ( IN-CITY ?auto_507427 ?auto_507437 ) ( not ( = ?auto_507427 ?auto_507436 ) ) ( OBJ-AT ?auto_507432 ?auto_507436 ) ( IN-CITY ?auto_507438 ?auto_507437 ) ( not ( = ?auto_507427 ?auto_507438 ) ) ( OBJ-AT ?auto_507431 ?auto_507438 ) ( IN-CITY ?auto_507435 ?auto_507437 ) ( not ( = ?auto_507427 ?auto_507435 ) ) ( OBJ-AT ?auto_507433 ?auto_507435 ) ( IN-CITY ?auto_507439 ?auto_507437 ) ( not ( = ?auto_507427 ?auto_507439 ) ) ( OBJ-AT ?auto_507430 ?auto_507439 ) ( OBJ-AT ?auto_507429 ?auto_507436 ) ( OBJ-AT ?auto_507428 ?auto_507435 ) ( TRUCK-AT ?auto_507434 ?auto_507427 ) ( not ( = ?auto_507428 ?auto_507429 ) ) ( not ( = ?auto_507436 ?auto_507435 ) ) ( not ( = ?auto_507428 ?auto_507430 ) ) ( not ( = ?auto_507429 ?auto_507430 ) ) ( not ( = ?auto_507439 ?auto_507436 ) ) ( not ( = ?auto_507439 ?auto_507435 ) ) ( not ( = ?auto_507428 ?auto_507433 ) ) ( not ( = ?auto_507429 ?auto_507433 ) ) ( not ( = ?auto_507430 ?auto_507433 ) ) ( not ( = ?auto_507428 ?auto_507431 ) ) ( not ( = ?auto_507429 ?auto_507431 ) ) ( not ( = ?auto_507430 ?auto_507431 ) ) ( not ( = ?auto_507433 ?auto_507431 ) ) ( not ( = ?auto_507438 ?auto_507435 ) ) ( not ( = ?auto_507438 ?auto_507439 ) ) ( not ( = ?auto_507438 ?auto_507436 ) ) ( not ( = ?auto_507428 ?auto_507432 ) ) ( not ( = ?auto_507429 ?auto_507432 ) ) ( not ( = ?auto_507430 ?auto_507432 ) ) ( not ( = ?auto_507433 ?auto_507432 ) ) ( not ( = ?auto_507431 ?auto_507432 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_507428 ?auto_507429 ?auto_507430 ?auto_507433 ?auto_507432 ?auto_507431 ?auto_507427 )
      ( DELIVER-6PKG-VERIFY ?auto_507428 ?auto_507429 ?auto_507430 ?auto_507431 ?auto_507432 ?auto_507433 ?auto_507427 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_507789 - OBJ
      ?auto_507790 - OBJ
      ?auto_507791 - OBJ
      ?auto_507792 - OBJ
      ?auto_507793 - OBJ
      ?auto_507794 - OBJ
      ?auto_507788 - LOCATION
    )
    :vars
    (
      ?auto_507797 - LOCATION
      ?auto_507798 - CITY
      ?auto_507799 - LOCATION
      ?auto_507796 - LOCATION
      ?auto_507800 - LOCATION
      ?auto_507795 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_507797 ?auto_507798 ) ( IN-CITY ?auto_507788 ?auto_507798 ) ( not ( = ?auto_507788 ?auto_507797 ) ) ( OBJ-AT ?auto_507792 ?auto_507797 ) ( IN-CITY ?auto_507799 ?auto_507798 ) ( not ( = ?auto_507788 ?auto_507799 ) ) ( OBJ-AT ?auto_507794 ?auto_507799 ) ( IN-CITY ?auto_507796 ?auto_507798 ) ( not ( = ?auto_507788 ?auto_507796 ) ) ( OBJ-AT ?auto_507793 ?auto_507796 ) ( IN-CITY ?auto_507800 ?auto_507798 ) ( not ( = ?auto_507788 ?auto_507800 ) ) ( OBJ-AT ?auto_507791 ?auto_507800 ) ( OBJ-AT ?auto_507790 ?auto_507797 ) ( OBJ-AT ?auto_507789 ?auto_507796 ) ( TRUCK-AT ?auto_507795 ?auto_507788 ) ( not ( = ?auto_507789 ?auto_507790 ) ) ( not ( = ?auto_507797 ?auto_507796 ) ) ( not ( = ?auto_507789 ?auto_507791 ) ) ( not ( = ?auto_507790 ?auto_507791 ) ) ( not ( = ?auto_507800 ?auto_507797 ) ) ( not ( = ?auto_507800 ?auto_507796 ) ) ( not ( = ?auto_507789 ?auto_507793 ) ) ( not ( = ?auto_507790 ?auto_507793 ) ) ( not ( = ?auto_507791 ?auto_507793 ) ) ( not ( = ?auto_507789 ?auto_507794 ) ) ( not ( = ?auto_507790 ?auto_507794 ) ) ( not ( = ?auto_507791 ?auto_507794 ) ) ( not ( = ?auto_507793 ?auto_507794 ) ) ( not ( = ?auto_507799 ?auto_507796 ) ) ( not ( = ?auto_507799 ?auto_507800 ) ) ( not ( = ?auto_507799 ?auto_507797 ) ) ( not ( = ?auto_507789 ?auto_507792 ) ) ( not ( = ?auto_507790 ?auto_507792 ) ) ( not ( = ?auto_507791 ?auto_507792 ) ) ( not ( = ?auto_507793 ?auto_507792 ) ) ( not ( = ?auto_507794 ?auto_507792 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_507789 ?auto_507790 ?auto_507791 ?auto_507793 ?auto_507792 ?auto_507794 ?auto_507788 )
      ( DELIVER-6PKG-VERIFY ?auto_507789 ?auto_507790 ?auto_507791 ?auto_507792 ?auto_507793 ?auto_507794 ?auto_507788 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_507858 - OBJ
      ?auto_507859 - OBJ
      ?auto_507860 - OBJ
      ?auto_507861 - OBJ
      ?auto_507862 - OBJ
      ?auto_507863 - OBJ
      ?auto_507857 - LOCATION
    )
    :vars
    (
      ?auto_507866 - LOCATION
      ?auto_507867 - CITY
      ?auto_507868 - LOCATION
      ?auto_507865 - LOCATION
      ?auto_507869 - LOCATION
      ?auto_507864 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_507866 ?auto_507867 ) ( IN-CITY ?auto_507857 ?auto_507867 ) ( not ( = ?auto_507857 ?auto_507866 ) ) ( OBJ-AT ?auto_507861 ?auto_507866 ) ( IN-CITY ?auto_507868 ?auto_507867 ) ( not ( = ?auto_507857 ?auto_507868 ) ) ( OBJ-AT ?auto_507862 ?auto_507868 ) ( IN-CITY ?auto_507865 ?auto_507867 ) ( not ( = ?auto_507857 ?auto_507865 ) ) ( OBJ-AT ?auto_507863 ?auto_507865 ) ( IN-CITY ?auto_507869 ?auto_507867 ) ( not ( = ?auto_507857 ?auto_507869 ) ) ( OBJ-AT ?auto_507860 ?auto_507869 ) ( OBJ-AT ?auto_507859 ?auto_507866 ) ( OBJ-AT ?auto_507858 ?auto_507865 ) ( TRUCK-AT ?auto_507864 ?auto_507857 ) ( not ( = ?auto_507858 ?auto_507859 ) ) ( not ( = ?auto_507866 ?auto_507865 ) ) ( not ( = ?auto_507858 ?auto_507860 ) ) ( not ( = ?auto_507859 ?auto_507860 ) ) ( not ( = ?auto_507869 ?auto_507866 ) ) ( not ( = ?auto_507869 ?auto_507865 ) ) ( not ( = ?auto_507858 ?auto_507863 ) ) ( not ( = ?auto_507859 ?auto_507863 ) ) ( not ( = ?auto_507860 ?auto_507863 ) ) ( not ( = ?auto_507858 ?auto_507862 ) ) ( not ( = ?auto_507859 ?auto_507862 ) ) ( not ( = ?auto_507860 ?auto_507862 ) ) ( not ( = ?auto_507863 ?auto_507862 ) ) ( not ( = ?auto_507868 ?auto_507865 ) ) ( not ( = ?auto_507868 ?auto_507869 ) ) ( not ( = ?auto_507868 ?auto_507866 ) ) ( not ( = ?auto_507858 ?auto_507861 ) ) ( not ( = ?auto_507859 ?auto_507861 ) ) ( not ( = ?auto_507860 ?auto_507861 ) ) ( not ( = ?auto_507863 ?auto_507861 ) ) ( not ( = ?auto_507862 ?auto_507861 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_507858 ?auto_507859 ?auto_507860 ?auto_507863 ?auto_507861 ?auto_507862 ?auto_507857 )
      ( DELIVER-6PKG-VERIFY ?auto_507858 ?auto_507859 ?auto_507860 ?auto_507861 ?auto_507862 ?auto_507863 ?auto_507857 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_508365 - OBJ
      ?auto_508366 - OBJ
      ?auto_508367 - OBJ
      ?auto_508368 - OBJ
      ?auto_508369 - OBJ
      ?auto_508370 - OBJ
      ?auto_508364 - LOCATION
    )
    :vars
    (
      ?auto_508373 - LOCATION
      ?auto_508374 - CITY
      ?auto_508375 - LOCATION
      ?auto_508372 - LOCATION
      ?auto_508376 - LOCATION
      ?auto_508371 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_508373 ?auto_508374 ) ( IN-CITY ?auto_508364 ?auto_508374 ) ( not ( = ?auto_508364 ?auto_508373 ) ) ( OBJ-AT ?auto_508370 ?auto_508373 ) ( IN-CITY ?auto_508375 ?auto_508374 ) ( not ( = ?auto_508364 ?auto_508375 ) ) ( OBJ-AT ?auto_508369 ?auto_508375 ) ( IN-CITY ?auto_508372 ?auto_508374 ) ( not ( = ?auto_508364 ?auto_508372 ) ) ( OBJ-AT ?auto_508367 ?auto_508372 ) ( IN-CITY ?auto_508376 ?auto_508374 ) ( not ( = ?auto_508364 ?auto_508376 ) ) ( OBJ-AT ?auto_508368 ?auto_508376 ) ( OBJ-AT ?auto_508366 ?auto_508373 ) ( OBJ-AT ?auto_508365 ?auto_508372 ) ( TRUCK-AT ?auto_508371 ?auto_508364 ) ( not ( = ?auto_508365 ?auto_508366 ) ) ( not ( = ?auto_508373 ?auto_508372 ) ) ( not ( = ?auto_508365 ?auto_508368 ) ) ( not ( = ?auto_508366 ?auto_508368 ) ) ( not ( = ?auto_508376 ?auto_508373 ) ) ( not ( = ?auto_508376 ?auto_508372 ) ) ( not ( = ?auto_508365 ?auto_508367 ) ) ( not ( = ?auto_508366 ?auto_508367 ) ) ( not ( = ?auto_508368 ?auto_508367 ) ) ( not ( = ?auto_508365 ?auto_508369 ) ) ( not ( = ?auto_508366 ?auto_508369 ) ) ( not ( = ?auto_508368 ?auto_508369 ) ) ( not ( = ?auto_508367 ?auto_508369 ) ) ( not ( = ?auto_508375 ?auto_508372 ) ) ( not ( = ?auto_508375 ?auto_508376 ) ) ( not ( = ?auto_508375 ?auto_508373 ) ) ( not ( = ?auto_508365 ?auto_508370 ) ) ( not ( = ?auto_508366 ?auto_508370 ) ) ( not ( = ?auto_508368 ?auto_508370 ) ) ( not ( = ?auto_508367 ?auto_508370 ) ) ( not ( = ?auto_508369 ?auto_508370 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_508365 ?auto_508366 ?auto_508368 ?auto_508367 ?auto_508370 ?auto_508369 ?auto_508364 )
      ( DELIVER-6PKG-VERIFY ?auto_508365 ?auto_508366 ?auto_508367 ?auto_508368 ?auto_508369 ?auto_508370 ?auto_508364 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_508434 - OBJ
      ?auto_508435 - OBJ
      ?auto_508436 - OBJ
      ?auto_508437 - OBJ
      ?auto_508438 - OBJ
      ?auto_508439 - OBJ
      ?auto_508433 - LOCATION
    )
    :vars
    (
      ?auto_508442 - LOCATION
      ?auto_508443 - CITY
      ?auto_508444 - LOCATION
      ?auto_508441 - LOCATION
      ?auto_508445 - LOCATION
      ?auto_508440 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_508442 ?auto_508443 ) ( IN-CITY ?auto_508433 ?auto_508443 ) ( not ( = ?auto_508433 ?auto_508442 ) ) ( OBJ-AT ?auto_508438 ?auto_508442 ) ( IN-CITY ?auto_508444 ?auto_508443 ) ( not ( = ?auto_508433 ?auto_508444 ) ) ( OBJ-AT ?auto_508439 ?auto_508444 ) ( IN-CITY ?auto_508441 ?auto_508443 ) ( not ( = ?auto_508433 ?auto_508441 ) ) ( OBJ-AT ?auto_508436 ?auto_508441 ) ( IN-CITY ?auto_508445 ?auto_508443 ) ( not ( = ?auto_508433 ?auto_508445 ) ) ( OBJ-AT ?auto_508437 ?auto_508445 ) ( OBJ-AT ?auto_508435 ?auto_508442 ) ( OBJ-AT ?auto_508434 ?auto_508441 ) ( TRUCK-AT ?auto_508440 ?auto_508433 ) ( not ( = ?auto_508434 ?auto_508435 ) ) ( not ( = ?auto_508442 ?auto_508441 ) ) ( not ( = ?auto_508434 ?auto_508437 ) ) ( not ( = ?auto_508435 ?auto_508437 ) ) ( not ( = ?auto_508445 ?auto_508442 ) ) ( not ( = ?auto_508445 ?auto_508441 ) ) ( not ( = ?auto_508434 ?auto_508436 ) ) ( not ( = ?auto_508435 ?auto_508436 ) ) ( not ( = ?auto_508437 ?auto_508436 ) ) ( not ( = ?auto_508434 ?auto_508439 ) ) ( not ( = ?auto_508435 ?auto_508439 ) ) ( not ( = ?auto_508437 ?auto_508439 ) ) ( not ( = ?auto_508436 ?auto_508439 ) ) ( not ( = ?auto_508444 ?auto_508441 ) ) ( not ( = ?auto_508444 ?auto_508445 ) ) ( not ( = ?auto_508444 ?auto_508442 ) ) ( not ( = ?auto_508434 ?auto_508438 ) ) ( not ( = ?auto_508435 ?auto_508438 ) ) ( not ( = ?auto_508437 ?auto_508438 ) ) ( not ( = ?auto_508436 ?auto_508438 ) ) ( not ( = ?auto_508439 ?auto_508438 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_508434 ?auto_508435 ?auto_508437 ?auto_508436 ?auto_508438 ?auto_508439 ?auto_508433 )
      ( DELIVER-6PKG-VERIFY ?auto_508434 ?auto_508435 ?auto_508436 ?auto_508437 ?auto_508438 ?auto_508439 ?auto_508433 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_508994 - OBJ
      ?auto_508995 - OBJ
      ?auto_508996 - OBJ
      ?auto_508997 - OBJ
      ?auto_508998 - OBJ
      ?auto_508999 - OBJ
      ?auto_508993 - LOCATION
    )
    :vars
    (
      ?auto_509002 - LOCATION
      ?auto_509003 - CITY
      ?auto_509004 - LOCATION
      ?auto_509001 - LOCATION
      ?auto_509005 - LOCATION
      ?auto_509000 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_509002 ?auto_509003 ) ( IN-CITY ?auto_508993 ?auto_509003 ) ( not ( = ?auto_508993 ?auto_509002 ) ) ( OBJ-AT ?auto_508997 ?auto_509002 ) ( IN-CITY ?auto_509004 ?auto_509003 ) ( not ( = ?auto_508993 ?auto_509004 ) ) ( OBJ-AT ?auto_508999 ?auto_509004 ) ( IN-CITY ?auto_509001 ?auto_509003 ) ( not ( = ?auto_508993 ?auto_509001 ) ) ( OBJ-AT ?auto_508996 ?auto_509001 ) ( IN-CITY ?auto_509005 ?auto_509003 ) ( not ( = ?auto_508993 ?auto_509005 ) ) ( OBJ-AT ?auto_508998 ?auto_509005 ) ( OBJ-AT ?auto_508995 ?auto_509002 ) ( OBJ-AT ?auto_508994 ?auto_509001 ) ( TRUCK-AT ?auto_509000 ?auto_508993 ) ( not ( = ?auto_508994 ?auto_508995 ) ) ( not ( = ?auto_509002 ?auto_509001 ) ) ( not ( = ?auto_508994 ?auto_508998 ) ) ( not ( = ?auto_508995 ?auto_508998 ) ) ( not ( = ?auto_509005 ?auto_509002 ) ) ( not ( = ?auto_509005 ?auto_509001 ) ) ( not ( = ?auto_508994 ?auto_508996 ) ) ( not ( = ?auto_508995 ?auto_508996 ) ) ( not ( = ?auto_508998 ?auto_508996 ) ) ( not ( = ?auto_508994 ?auto_508999 ) ) ( not ( = ?auto_508995 ?auto_508999 ) ) ( not ( = ?auto_508998 ?auto_508999 ) ) ( not ( = ?auto_508996 ?auto_508999 ) ) ( not ( = ?auto_509004 ?auto_509001 ) ) ( not ( = ?auto_509004 ?auto_509005 ) ) ( not ( = ?auto_509004 ?auto_509002 ) ) ( not ( = ?auto_508994 ?auto_508997 ) ) ( not ( = ?auto_508995 ?auto_508997 ) ) ( not ( = ?auto_508998 ?auto_508997 ) ) ( not ( = ?auto_508996 ?auto_508997 ) ) ( not ( = ?auto_508999 ?auto_508997 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_508994 ?auto_508995 ?auto_508998 ?auto_508996 ?auto_508997 ?auto_508999 ?auto_508993 )
      ( DELIVER-6PKG-VERIFY ?auto_508994 ?auto_508995 ?auto_508996 ?auto_508997 ?auto_508998 ?auto_508999 ?auto_508993 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_511949 - OBJ
      ?auto_511950 - OBJ
      ?auto_511951 - OBJ
      ?auto_511952 - OBJ
      ?auto_511953 - OBJ
      ?auto_511954 - OBJ
      ?auto_511948 - LOCATION
    )
    :vars
    (
      ?auto_511957 - LOCATION
      ?auto_511958 - CITY
      ?auto_511959 - LOCATION
      ?auto_511956 - LOCATION
      ?auto_511960 - LOCATION
      ?auto_511955 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_511957 ?auto_511958 ) ( IN-CITY ?auto_511948 ?auto_511958 ) ( not ( = ?auto_511948 ?auto_511957 ) ) ( OBJ-AT ?auto_511951 ?auto_511957 ) ( IN-CITY ?auto_511959 ?auto_511958 ) ( not ( = ?auto_511948 ?auto_511959 ) ) ( OBJ-AT ?auto_511954 ?auto_511959 ) ( IN-CITY ?auto_511956 ?auto_511958 ) ( not ( = ?auto_511948 ?auto_511956 ) ) ( OBJ-AT ?auto_511953 ?auto_511956 ) ( IN-CITY ?auto_511960 ?auto_511958 ) ( not ( = ?auto_511948 ?auto_511960 ) ) ( OBJ-AT ?auto_511952 ?auto_511960 ) ( OBJ-AT ?auto_511950 ?auto_511957 ) ( OBJ-AT ?auto_511949 ?auto_511956 ) ( TRUCK-AT ?auto_511955 ?auto_511948 ) ( not ( = ?auto_511949 ?auto_511950 ) ) ( not ( = ?auto_511957 ?auto_511956 ) ) ( not ( = ?auto_511949 ?auto_511952 ) ) ( not ( = ?auto_511950 ?auto_511952 ) ) ( not ( = ?auto_511960 ?auto_511957 ) ) ( not ( = ?auto_511960 ?auto_511956 ) ) ( not ( = ?auto_511949 ?auto_511953 ) ) ( not ( = ?auto_511950 ?auto_511953 ) ) ( not ( = ?auto_511952 ?auto_511953 ) ) ( not ( = ?auto_511949 ?auto_511954 ) ) ( not ( = ?auto_511950 ?auto_511954 ) ) ( not ( = ?auto_511952 ?auto_511954 ) ) ( not ( = ?auto_511953 ?auto_511954 ) ) ( not ( = ?auto_511959 ?auto_511956 ) ) ( not ( = ?auto_511959 ?auto_511960 ) ) ( not ( = ?auto_511959 ?auto_511957 ) ) ( not ( = ?auto_511949 ?auto_511951 ) ) ( not ( = ?auto_511950 ?auto_511951 ) ) ( not ( = ?auto_511952 ?auto_511951 ) ) ( not ( = ?auto_511953 ?auto_511951 ) ) ( not ( = ?auto_511954 ?auto_511951 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_511949 ?auto_511950 ?auto_511952 ?auto_511953 ?auto_511951 ?auto_511954 ?auto_511948 )
      ( DELIVER-6PKG-VERIFY ?auto_511949 ?auto_511950 ?auto_511951 ?auto_511952 ?auto_511953 ?auto_511954 ?auto_511948 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_512018 - OBJ
      ?auto_512019 - OBJ
      ?auto_512020 - OBJ
      ?auto_512021 - OBJ
      ?auto_512022 - OBJ
      ?auto_512023 - OBJ
      ?auto_512017 - LOCATION
    )
    :vars
    (
      ?auto_512026 - LOCATION
      ?auto_512027 - CITY
      ?auto_512028 - LOCATION
      ?auto_512025 - LOCATION
      ?auto_512029 - LOCATION
      ?auto_512024 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_512026 ?auto_512027 ) ( IN-CITY ?auto_512017 ?auto_512027 ) ( not ( = ?auto_512017 ?auto_512026 ) ) ( OBJ-AT ?auto_512020 ?auto_512026 ) ( IN-CITY ?auto_512028 ?auto_512027 ) ( not ( = ?auto_512017 ?auto_512028 ) ) ( OBJ-AT ?auto_512022 ?auto_512028 ) ( IN-CITY ?auto_512025 ?auto_512027 ) ( not ( = ?auto_512017 ?auto_512025 ) ) ( OBJ-AT ?auto_512023 ?auto_512025 ) ( IN-CITY ?auto_512029 ?auto_512027 ) ( not ( = ?auto_512017 ?auto_512029 ) ) ( OBJ-AT ?auto_512021 ?auto_512029 ) ( OBJ-AT ?auto_512019 ?auto_512026 ) ( OBJ-AT ?auto_512018 ?auto_512025 ) ( TRUCK-AT ?auto_512024 ?auto_512017 ) ( not ( = ?auto_512018 ?auto_512019 ) ) ( not ( = ?auto_512026 ?auto_512025 ) ) ( not ( = ?auto_512018 ?auto_512021 ) ) ( not ( = ?auto_512019 ?auto_512021 ) ) ( not ( = ?auto_512029 ?auto_512026 ) ) ( not ( = ?auto_512029 ?auto_512025 ) ) ( not ( = ?auto_512018 ?auto_512023 ) ) ( not ( = ?auto_512019 ?auto_512023 ) ) ( not ( = ?auto_512021 ?auto_512023 ) ) ( not ( = ?auto_512018 ?auto_512022 ) ) ( not ( = ?auto_512019 ?auto_512022 ) ) ( not ( = ?auto_512021 ?auto_512022 ) ) ( not ( = ?auto_512023 ?auto_512022 ) ) ( not ( = ?auto_512028 ?auto_512025 ) ) ( not ( = ?auto_512028 ?auto_512029 ) ) ( not ( = ?auto_512028 ?auto_512026 ) ) ( not ( = ?auto_512018 ?auto_512020 ) ) ( not ( = ?auto_512019 ?auto_512020 ) ) ( not ( = ?auto_512021 ?auto_512020 ) ) ( not ( = ?auto_512023 ?auto_512020 ) ) ( not ( = ?auto_512022 ?auto_512020 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_512018 ?auto_512019 ?auto_512021 ?auto_512023 ?auto_512020 ?auto_512022 ?auto_512017 )
      ( DELIVER-6PKG-VERIFY ?auto_512018 ?auto_512019 ?auto_512020 ?auto_512021 ?auto_512022 ?auto_512023 ?auto_512017 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_512379 - OBJ
      ?auto_512380 - OBJ
      ?auto_512381 - OBJ
      ?auto_512382 - OBJ
      ?auto_512383 - OBJ
      ?auto_512384 - OBJ
      ?auto_512378 - LOCATION
    )
    :vars
    (
      ?auto_512387 - LOCATION
      ?auto_512388 - CITY
      ?auto_512389 - LOCATION
      ?auto_512386 - LOCATION
      ?auto_512390 - LOCATION
      ?auto_512385 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_512387 ?auto_512388 ) ( IN-CITY ?auto_512378 ?auto_512388 ) ( not ( = ?auto_512378 ?auto_512387 ) ) ( OBJ-AT ?auto_512381 ?auto_512387 ) ( IN-CITY ?auto_512389 ?auto_512388 ) ( not ( = ?auto_512378 ?auto_512389 ) ) ( OBJ-AT ?auto_512384 ?auto_512389 ) ( IN-CITY ?auto_512386 ?auto_512388 ) ( not ( = ?auto_512378 ?auto_512386 ) ) ( OBJ-AT ?auto_512382 ?auto_512386 ) ( IN-CITY ?auto_512390 ?auto_512388 ) ( not ( = ?auto_512378 ?auto_512390 ) ) ( OBJ-AT ?auto_512383 ?auto_512390 ) ( OBJ-AT ?auto_512380 ?auto_512387 ) ( OBJ-AT ?auto_512379 ?auto_512386 ) ( TRUCK-AT ?auto_512385 ?auto_512378 ) ( not ( = ?auto_512379 ?auto_512380 ) ) ( not ( = ?auto_512387 ?auto_512386 ) ) ( not ( = ?auto_512379 ?auto_512383 ) ) ( not ( = ?auto_512380 ?auto_512383 ) ) ( not ( = ?auto_512390 ?auto_512387 ) ) ( not ( = ?auto_512390 ?auto_512386 ) ) ( not ( = ?auto_512379 ?auto_512382 ) ) ( not ( = ?auto_512380 ?auto_512382 ) ) ( not ( = ?auto_512383 ?auto_512382 ) ) ( not ( = ?auto_512379 ?auto_512384 ) ) ( not ( = ?auto_512380 ?auto_512384 ) ) ( not ( = ?auto_512383 ?auto_512384 ) ) ( not ( = ?auto_512382 ?auto_512384 ) ) ( not ( = ?auto_512389 ?auto_512386 ) ) ( not ( = ?auto_512389 ?auto_512390 ) ) ( not ( = ?auto_512389 ?auto_512387 ) ) ( not ( = ?auto_512379 ?auto_512381 ) ) ( not ( = ?auto_512380 ?auto_512381 ) ) ( not ( = ?auto_512383 ?auto_512381 ) ) ( not ( = ?auto_512382 ?auto_512381 ) ) ( not ( = ?auto_512384 ?auto_512381 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_512379 ?auto_512380 ?auto_512383 ?auto_512382 ?auto_512381 ?auto_512384 ?auto_512378 )
      ( DELIVER-6PKG-VERIFY ?auto_512379 ?auto_512380 ?auto_512381 ?auto_512382 ?auto_512383 ?auto_512384 ?auto_512378 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_515613 - OBJ
      ?auto_515614 - OBJ
      ?auto_515615 - OBJ
      ?auto_515616 - OBJ
      ?auto_515617 - OBJ
      ?auto_515618 - OBJ
      ?auto_515612 - LOCATION
    )
    :vars
    (
      ?auto_515621 - LOCATION
      ?auto_515622 - CITY
      ?auto_515623 - LOCATION
      ?auto_515620 - LOCATION
      ?auto_515624 - LOCATION
      ?auto_515619 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_515621 ?auto_515622 ) ( IN-CITY ?auto_515612 ?auto_515622 ) ( not ( = ?auto_515612 ?auto_515621 ) ) ( OBJ-AT ?auto_515618 ?auto_515621 ) ( IN-CITY ?auto_515623 ?auto_515622 ) ( not ( = ?auto_515612 ?auto_515623 ) ) ( OBJ-AT ?auto_515617 ?auto_515623 ) ( IN-CITY ?auto_515620 ?auto_515622 ) ( not ( = ?auto_515612 ?auto_515620 ) ) ( OBJ-AT ?auto_515616 ?auto_515620 ) ( IN-CITY ?auto_515624 ?auto_515622 ) ( not ( = ?auto_515612 ?auto_515624 ) ) ( OBJ-AT ?auto_515614 ?auto_515624 ) ( OBJ-AT ?auto_515615 ?auto_515621 ) ( OBJ-AT ?auto_515613 ?auto_515620 ) ( TRUCK-AT ?auto_515619 ?auto_515612 ) ( not ( = ?auto_515613 ?auto_515615 ) ) ( not ( = ?auto_515621 ?auto_515620 ) ) ( not ( = ?auto_515613 ?auto_515614 ) ) ( not ( = ?auto_515615 ?auto_515614 ) ) ( not ( = ?auto_515624 ?auto_515621 ) ) ( not ( = ?auto_515624 ?auto_515620 ) ) ( not ( = ?auto_515613 ?auto_515616 ) ) ( not ( = ?auto_515615 ?auto_515616 ) ) ( not ( = ?auto_515614 ?auto_515616 ) ) ( not ( = ?auto_515613 ?auto_515617 ) ) ( not ( = ?auto_515615 ?auto_515617 ) ) ( not ( = ?auto_515614 ?auto_515617 ) ) ( not ( = ?auto_515616 ?auto_515617 ) ) ( not ( = ?auto_515623 ?auto_515620 ) ) ( not ( = ?auto_515623 ?auto_515624 ) ) ( not ( = ?auto_515623 ?auto_515621 ) ) ( not ( = ?auto_515613 ?auto_515618 ) ) ( not ( = ?auto_515615 ?auto_515618 ) ) ( not ( = ?auto_515614 ?auto_515618 ) ) ( not ( = ?auto_515616 ?auto_515618 ) ) ( not ( = ?auto_515617 ?auto_515618 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_515613 ?auto_515615 ?auto_515614 ?auto_515616 ?auto_515618 ?auto_515617 ?auto_515612 )
      ( DELIVER-6PKG-VERIFY ?auto_515613 ?auto_515614 ?auto_515615 ?auto_515616 ?auto_515617 ?auto_515618 ?auto_515612 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_515682 - OBJ
      ?auto_515683 - OBJ
      ?auto_515684 - OBJ
      ?auto_515685 - OBJ
      ?auto_515686 - OBJ
      ?auto_515687 - OBJ
      ?auto_515681 - LOCATION
    )
    :vars
    (
      ?auto_515690 - LOCATION
      ?auto_515691 - CITY
      ?auto_515692 - LOCATION
      ?auto_515689 - LOCATION
      ?auto_515693 - LOCATION
      ?auto_515688 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_515690 ?auto_515691 ) ( IN-CITY ?auto_515681 ?auto_515691 ) ( not ( = ?auto_515681 ?auto_515690 ) ) ( OBJ-AT ?auto_515686 ?auto_515690 ) ( IN-CITY ?auto_515692 ?auto_515691 ) ( not ( = ?auto_515681 ?auto_515692 ) ) ( OBJ-AT ?auto_515687 ?auto_515692 ) ( IN-CITY ?auto_515689 ?auto_515691 ) ( not ( = ?auto_515681 ?auto_515689 ) ) ( OBJ-AT ?auto_515685 ?auto_515689 ) ( IN-CITY ?auto_515693 ?auto_515691 ) ( not ( = ?auto_515681 ?auto_515693 ) ) ( OBJ-AT ?auto_515683 ?auto_515693 ) ( OBJ-AT ?auto_515684 ?auto_515690 ) ( OBJ-AT ?auto_515682 ?auto_515689 ) ( TRUCK-AT ?auto_515688 ?auto_515681 ) ( not ( = ?auto_515682 ?auto_515684 ) ) ( not ( = ?auto_515690 ?auto_515689 ) ) ( not ( = ?auto_515682 ?auto_515683 ) ) ( not ( = ?auto_515684 ?auto_515683 ) ) ( not ( = ?auto_515693 ?auto_515690 ) ) ( not ( = ?auto_515693 ?auto_515689 ) ) ( not ( = ?auto_515682 ?auto_515685 ) ) ( not ( = ?auto_515684 ?auto_515685 ) ) ( not ( = ?auto_515683 ?auto_515685 ) ) ( not ( = ?auto_515682 ?auto_515687 ) ) ( not ( = ?auto_515684 ?auto_515687 ) ) ( not ( = ?auto_515683 ?auto_515687 ) ) ( not ( = ?auto_515685 ?auto_515687 ) ) ( not ( = ?auto_515692 ?auto_515689 ) ) ( not ( = ?auto_515692 ?auto_515693 ) ) ( not ( = ?auto_515692 ?auto_515690 ) ) ( not ( = ?auto_515682 ?auto_515686 ) ) ( not ( = ?auto_515684 ?auto_515686 ) ) ( not ( = ?auto_515683 ?auto_515686 ) ) ( not ( = ?auto_515685 ?auto_515686 ) ) ( not ( = ?auto_515687 ?auto_515686 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_515682 ?auto_515684 ?auto_515683 ?auto_515685 ?auto_515686 ?auto_515687 ?auto_515681 )
      ( DELIVER-6PKG-VERIFY ?auto_515682 ?auto_515683 ?auto_515684 ?auto_515685 ?auto_515686 ?auto_515687 ?auto_515681 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_515751 - OBJ
      ?auto_515752 - OBJ
      ?auto_515753 - OBJ
      ?auto_515754 - OBJ
      ?auto_515755 - OBJ
      ?auto_515756 - OBJ
      ?auto_515750 - LOCATION
    )
    :vars
    (
      ?auto_515759 - LOCATION
      ?auto_515760 - CITY
      ?auto_515761 - LOCATION
      ?auto_515758 - LOCATION
      ?auto_515762 - LOCATION
      ?auto_515757 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_515759 ?auto_515760 ) ( IN-CITY ?auto_515750 ?auto_515760 ) ( not ( = ?auto_515750 ?auto_515759 ) ) ( OBJ-AT ?auto_515756 ?auto_515759 ) ( IN-CITY ?auto_515761 ?auto_515760 ) ( not ( = ?auto_515750 ?auto_515761 ) ) ( OBJ-AT ?auto_515754 ?auto_515761 ) ( IN-CITY ?auto_515758 ?auto_515760 ) ( not ( = ?auto_515750 ?auto_515758 ) ) ( OBJ-AT ?auto_515755 ?auto_515758 ) ( IN-CITY ?auto_515762 ?auto_515760 ) ( not ( = ?auto_515750 ?auto_515762 ) ) ( OBJ-AT ?auto_515752 ?auto_515762 ) ( OBJ-AT ?auto_515753 ?auto_515759 ) ( OBJ-AT ?auto_515751 ?auto_515758 ) ( TRUCK-AT ?auto_515757 ?auto_515750 ) ( not ( = ?auto_515751 ?auto_515753 ) ) ( not ( = ?auto_515759 ?auto_515758 ) ) ( not ( = ?auto_515751 ?auto_515752 ) ) ( not ( = ?auto_515753 ?auto_515752 ) ) ( not ( = ?auto_515762 ?auto_515759 ) ) ( not ( = ?auto_515762 ?auto_515758 ) ) ( not ( = ?auto_515751 ?auto_515755 ) ) ( not ( = ?auto_515753 ?auto_515755 ) ) ( not ( = ?auto_515752 ?auto_515755 ) ) ( not ( = ?auto_515751 ?auto_515754 ) ) ( not ( = ?auto_515753 ?auto_515754 ) ) ( not ( = ?auto_515752 ?auto_515754 ) ) ( not ( = ?auto_515755 ?auto_515754 ) ) ( not ( = ?auto_515761 ?auto_515758 ) ) ( not ( = ?auto_515761 ?auto_515762 ) ) ( not ( = ?auto_515761 ?auto_515759 ) ) ( not ( = ?auto_515751 ?auto_515756 ) ) ( not ( = ?auto_515753 ?auto_515756 ) ) ( not ( = ?auto_515752 ?auto_515756 ) ) ( not ( = ?auto_515755 ?auto_515756 ) ) ( not ( = ?auto_515754 ?auto_515756 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_515751 ?auto_515753 ?auto_515752 ?auto_515755 ?auto_515756 ?auto_515754 ?auto_515750 )
      ( DELIVER-6PKG-VERIFY ?auto_515751 ?auto_515752 ?auto_515753 ?auto_515754 ?auto_515755 ?auto_515756 ?auto_515750 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_515820 - OBJ
      ?auto_515821 - OBJ
      ?auto_515822 - OBJ
      ?auto_515823 - OBJ
      ?auto_515824 - OBJ
      ?auto_515825 - OBJ
      ?auto_515819 - LOCATION
    )
    :vars
    (
      ?auto_515828 - LOCATION
      ?auto_515829 - CITY
      ?auto_515830 - LOCATION
      ?auto_515827 - LOCATION
      ?auto_515831 - LOCATION
      ?auto_515826 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_515828 ?auto_515829 ) ( IN-CITY ?auto_515819 ?auto_515829 ) ( not ( = ?auto_515819 ?auto_515828 ) ) ( OBJ-AT ?auto_515824 ?auto_515828 ) ( IN-CITY ?auto_515830 ?auto_515829 ) ( not ( = ?auto_515819 ?auto_515830 ) ) ( OBJ-AT ?auto_515823 ?auto_515830 ) ( IN-CITY ?auto_515827 ?auto_515829 ) ( not ( = ?auto_515819 ?auto_515827 ) ) ( OBJ-AT ?auto_515825 ?auto_515827 ) ( IN-CITY ?auto_515831 ?auto_515829 ) ( not ( = ?auto_515819 ?auto_515831 ) ) ( OBJ-AT ?auto_515821 ?auto_515831 ) ( OBJ-AT ?auto_515822 ?auto_515828 ) ( OBJ-AT ?auto_515820 ?auto_515827 ) ( TRUCK-AT ?auto_515826 ?auto_515819 ) ( not ( = ?auto_515820 ?auto_515822 ) ) ( not ( = ?auto_515828 ?auto_515827 ) ) ( not ( = ?auto_515820 ?auto_515821 ) ) ( not ( = ?auto_515822 ?auto_515821 ) ) ( not ( = ?auto_515831 ?auto_515828 ) ) ( not ( = ?auto_515831 ?auto_515827 ) ) ( not ( = ?auto_515820 ?auto_515825 ) ) ( not ( = ?auto_515822 ?auto_515825 ) ) ( not ( = ?auto_515821 ?auto_515825 ) ) ( not ( = ?auto_515820 ?auto_515823 ) ) ( not ( = ?auto_515822 ?auto_515823 ) ) ( not ( = ?auto_515821 ?auto_515823 ) ) ( not ( = ?auto_515825 ?auto_515823 ) ) ( not ( = ?auto_515830 ?auto_515827 ) ) ( not ( = ?auto_515830 ?auto_515831 ) ) ( not ( = ?auto_515830 ?auto_515828 ) ) ( not ( = ?auto_515820 ?auto_515824 ) ) ( not ( = ?auto_515822 ?auto_515824 ) ) ( not ( = ?auto_515821 ?auto_515824 ) ) ( not ( = ?auto_515825 ?auto_515824 ) ) ( not ( = ?auto_515823 ?auto_515824 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_515820 ?auto_515822 ?auto_515821 ?auto_515825 ?auto_515824 ?auto_515823 ?auto_515819 )
      ( DELIVER-6PKG-VERIFY ?auto_515820 ?auto_515821 ?auto_515822 ?auto_515823 ?auto_515824 ?auto_515825 ?auto_515819 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_516181 - OBJ
      ?auto_516182 - OBJ
      ?auto_516183 - OBJ
      ?auto_516184 - OBJ
      ?auto_516185 - OBJ
      ?auto_516186 - OBJ
      ?auto_516180 - LOCATION
    )
    :vars
    (
      ?auto_516189 - LOCATION
      ?auto_516190 - CITY
      ?auto_516191 - LOCATION
      ?auto_516188 - LOCATION
      ?auto_516192 - LOCATION
      ?auto_516187 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_516189 ?auto_516190 ) ( IN-CITY ?auto_516180 ?auto_516190 ) ( not ( = ?auto_516180 ?auto_516189 ) ) ( OBJ-AT ?auto_516184 ?auto_516189 ) ( IN-CITY ?auto_516191 ?auto_516190 ) ( not ( = ?auto_516180 ?auto_516191 ) ) ( OBJ-AT ?auto_516186 ?auto_516191 ) ( IN-CITY ?auto_516188 ?auto_516190 ) ( not ( = ?auto_516180 ?auto_516188 ) ) ( OBJ-AT ?auto_516185 ?auto_516188 ) ( IN-CITY ?auto_516192 ?auto_516190 ) ( not ( = ?auto_516180 ?auto_516192 ) ) ( OBJ-AT ?auto_516182 ?auto_516192 ) ( OBJ-AT ?auto_516183 ?auto_516189 ) ( OBJ-AT ?auto_516181 ?auto_516188 ) ( TRUCK-AT ?auto_516187 ?auto_516180 ) ( not ( = ?auto_516181 ?auto_516183 ) ) ( not ( = ?auto_516189 ?auto_516188 ) ) ( not ( = ?auto_516181 ?auto_516182 ) ) ( not ( = ?auto_516183 ?auto_516182 ) ) ( not ( = ?auto_516192 ?auto_516189 ) ) ( not ( = ?auto_516192 ?auto_516188 ) ) ( not ( = ?auto_516181 ?auto_516185 ) ) ( not ( = ?auto_516183 ?auto_516185 ) ) ( not ( = ?auto_516182 ?auto_516185 ) ) ( not ( = ?auto_516181 ?auto_516186 ) ) ( not ( = ?auto_516183 ?auto_516186 ) ) ( not ( = ?auto_516182 ?auto_516186 ) ) ( not ( = ?auto_516185 ?auto_516186 ) ) ( not ( = ?auto_516191 ?auto_516188 ) ) ( not ( = ?auto_516191 ?auto_516192 ) ) ( not ( = ?auto_516191 ?auto_516189 ) ) ( not ( = ?auto_516181 ?auto_516184 ) ) ( not ( = ?auto_516183 ?auto_516184 ) ) ( not ( = ?auto_516182 ?auto_516184 ) ) ( not ( = ?auto_516185 ?auto_516184 ) ) ( not ( = ?auto_516186 ?auto_516184 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_516181 ?auto_516183 ?auto_516182 ?auto_516185 ?auto_516184 ?auto_516186 ?auto_516180 )
      ( DELIVER-6PKG-VERIFY ?auto_516181 ?auto_516182 ?auto_516183 ?auto_516184 ?auto_516185 ?auto_516186 ?auto_516180 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_516250 - OBJ
      ?auto_516251 - OBJ
      ?auto_516252 - OBJ
      ?auto_516253 - OBJ
      ?auto_516254 - OBJ
      ?auto_516255 - OBJ
      ?auto_516249 - LOCATION
    )
    :vars
    (
      ?auto_516258 - LOCATION
      ?auto_516259 - CITY
      ?auto_516260 - LOCATION
      ?auto_516257 - LOCATION
      ?auto_516261 - LOCATION
      ?auto_516256 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_516258 ?auto_516259 ) ( IN-CITY ?auto_516249 ?auto_516259 ) ( not ( = ?auto_516249 ?auto_516258 ) ) ( OBJ-AT ?auto_516253 ?auto_516258 ) ( IN-CITY ?auto_516260 ?auto_516259 ) ( not ( = ?auto_516249 ?auto_516260 ) ) ( OBJ-AT ?auto_516254 ?auto_516260 ) ( IN-CITY ?auto_516257 ?auto_516259 ) ( not ( = ?auto_516249 ?auto_516257 ) ) ( OBJ-AT ?auto_516255 ?auto_516257 ) ( IN-CITY ?auto_516261 ?auto_516259 ) ( not ( = ?auto_516249 ?auto_516261 ) ) ( OBJ-AT ?auto_516251 ?auto_516261 ) ( OBJ-AT ?auto_516252 ?auto_516258 ) ( OBJ-AT ?auto_516250 ?auto_516257 ) ( TRUCK-AT ?auto_516256 ?auto_516249 ) ( not ( = ?auto_516250 ?auto_516252 ) ) ( not ( = ?auto_516258 ?auto_516257 ) ) ( not ( = ?auto_516250 ?auto_516251 ) ) ( not ( = ?auto_516252 ?auto_516251 ) ) ( not ( = ?auto_516261 ?auto_516258 ) ) ( not ( = ?auto_516261 ?auto_516257 ) ) ( not ( = ?auto_516250 ?auto_516255 ) ) ( not ( = ?auto_516252 ?auto_516255 ) ) ( not ( = ?auto_516251 ?auto_516255 ) ) ( not ( = ?auto_516250 ?auto_516254 ) ) ( not ( = ?auto_516252 ?auto_516254 ) ) ( not ( = ?auto_516251 ?auto_516254 ) ) ( not ( = ?auto_516255 ?auto_516254 ) ) ( not ( = ?auto_516260 ?auto_516257 ) ) ( not ( = ?auto_516260 ?auto_516261 ) ) ( not ( = ?auto_516260 ?auto_516258 ) ) ( not ( = ?auto_516250 ?auto_516253 ) ) ( not ( = ?auto_516252 ?auto_516253 ) ) ( not ( = ?auto_516251 ?auto_516253 ) ) ( not ( = ?auto_516255 ?auto_516253 ) ) ( not ( = ?auto_516254 ?auto_516253 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_516250 ?auto_516252 ?auto_516251 ?auto_516255 ?auto_516253 ?auto_516254 ?auto_516249 )
      ( DELIVER-6PKG-VERIFY ?auto_516250 ?auto_516251 ?auto_516252 ?auto_516253 ?auto_516254 ?auto_516255 ?auto_516249 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_517962 - OBJ
      ?auto_517963 - OBJ
      ?auto_517964 - OBJ
      ?auto_517965 - OBJ
      ?auto_517966 - OBJ
      ?auto_517967 - OBJ
      ?auto_517961 - LOCATION
    )
    :vars
    (
      ?auto_517970 - LOCATION
      ?auto_517971 - CITY
      ?auto_517972 - LOCATION
      ?auto_517969 - LOCATION
      ?auto_517973 - LOCATION
      ?auto_517968 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_517970 ?auto_517971 ) ( IN-CITY ?auto_517961 ?auto_517971 ) ( not ( = ?auto_517961 ?auto_517970 ) ) ( OBJ-AT ?auto_517967 ?auto_517970 ) ( IN-CITY ?auto_517972 ?auto_517971 ) ( not ( = ?auto_517961 ?auto_517972 ) ) ( OBJ-AT ?auto_517966 ?auto_517972 ) ( IN-CITY ?auto_517969 ?auto_517971 ) ( not ( = ?auto_517961 ?auto_517969 ) ) ( OBJ-AT ?auto_517964 ?auto_517969 ) ( IN-CITY ?auto_517973 ?auto_517971 ) ( not ( = ?auto_517961 ?auto_517973 ) ) ( OBJ-AT ?auto_517963 ?auto_517973 ) ( OBJ-AT ?auto_517965 ?auto_517970 ) ( OBJ-AT ?auto_517962 ?auto_517969 ) ( TRUCK-AT ?auto_517968 ?auto_517961 ) ( not ( = ?auto_517962 ?auto_517965 ) ) ( not ( = ?auto_517970 ?auto_517969 ) ) ( not ( = ?auto_517962 ?auto_517963 ) ) ( not ( = ?auto_517965 ?auto_517963 ) ) ( not ( = ?auto_517973 ?auto_517970 ) ) ( not ( = ?auto_517973 ?auto_517969 ) ) ( not ( = ?auto_517962 ?auto_517964 ) ) ( not ( = ?auto_517965 ?auto_517964 ) ) ( not ( = ?auto_517963 ?auto_517964 ) ) ( not ( = ?auto_517962 ?auto_517966 ) ) ( not ( = ?auto_517965 ?auto_517966 ) ) ( not ( = ?auto_517963 ?auto_517966 ) ) ( not ( = ?auto_517964 ?auto_517966 ) ) ( not ( = ?auto_517972 ?auto_517969 ) ) ( not ( = ?auto_517972 ?auto_517973 ) ) ( not ( = ?auto_517972 ?auto_517970 ) ) ( not ( = ?auto_517962 ?auto_517967 ) ) ( not ( = ?auto_517965 ?auto_517967 ) ) ( not ( = ?auto_517963 ?auto_517967 ) ) ( not ( = ?auto_517964 ?auto_517967 ) ) ( not ( = ?auto_517966 ?auto_517967 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_517962 ?auto_517965 ?auto_517963 ?auto_517964 ?auto_517967 ?auto_517966 ?auto_517961 )
      ( DELIVER-6PKG-VERIFY ?auto_517962 ?auto_517963 ?auto_517964 ?auto_517965 ?auto_517966 ?auto_517967 ?auto_517961 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_518031 - OBJ
      ?auto_518032 - OBJ
      ?auto_518033 - OBJ
      ?auto_518034 - OBJ
      ?auto_518035 - OBJ
      ?auto_518036 - OBJ
      ?auto_518030 - LOCATION
    )
    :vars
    (
      ?auto_518039 - LOCATION
      ?auto_518040 - CITY
      ?auto_518041 - LOCATION
      ?auto_518038 - LOCATION
      ?auto_518042 - LOCATION
      ?auto_518037 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_518039 ?auto_518040 ) ( IN-CITY ?auto_518030 ?auto_518040 ) ( not ( = ?auto_518030 ?auto_518039 ) ) ( OBJ-AT ?auto_518035 ?auto_518039 ) ( IN-CITY ?auto_518041 ?auto_518040 ) ( not ( = ?auto_518030 ?auto_518041 ) ) ( OBJ-AT ?auto_518036 ?auto_518041 ) ( IN-CITY ?auto_518038 ?auto_518040 ) ( not ( = ?auto_518030 ?auto_518038 ) ) ( OBJ-AT ?auto_518033 ?auto_518038 ) ( IN-CITY ?auto_518042 ?auto_518040 ) ( not ( = ?auto_518030 ?auto_518042 ) ) ( OBJ-AT ?auto_518032 ?auto_518042 ) ( OBJ-AT ?auto_518034 ?auto_518039 ) ( OBJ-AT ?auto_518031 ?auto_518038 ) ( TRUCK-AT ?auto_518037 ?auto_518030 ) ( not ( = ?auto_518031 ?auto_518034 ) ) ( not ( = ?auto_518039 ?auto_518038 ) ) ( not ( = ?auto_518031 ?auto_518032 ) ) ( not ( = ?auto_518034 ?auto_518032 ) ) ( not ( = ?auto_518042 ?auto_518039 ) ) ( not ( = ?auto_518042 ?auto_518038 ) ) ( not ( = ?auto_518031 ?auto_518033 ) ) ( not ( = ?auto_518034 ?auto_518033 ) ) ( not ( = ?auto_518032 ?auto_518033 ) ) ( not ( = ?auto_518031 ?auto_518036 ) ) ( not ( = ?auto_518034 ?auto_518036 ) ) ( not ( = ?auto_518032 ?auto_518036 ) ) ( not ( = ?auto_518033 ?auto_518036 ) ) ( not ( = ?auto_518041 ?auto_518038 ) ) ( not ( = ?auto_518041 ?auto_518042 ) ) ( not ( = ?auto_518041 ?auto_518039 ) ) ( not ( = ?auto_518031 ?auto_518035 ) ) ( not ( = ?auto_518034 ?auto_518035 ) ) ( not ( = ?auto_518032 ?auto_518035 ) ) ( not ( = ?auto_518033 ?auto_518035 ) ) ( not ( = ?auto_518036 ?auto_518035 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_518031 ?auto_518034 ?auto_518032 ?auto_518033 ?auto_518035 ?auto_518036 ?auto_518030 )
      ( DELIVER-6PKG-VERIFY ?auto_518031 ?auto_518032 ?auto_518033 ?auto_518034 ?auto_518035 ?auto_518036 ?auto_518030 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_518394 - OBJ
      ?auto_518395 - OBJ
      ?auto_518396 - OBJ
      ?auto_518397 - OBJ
      ?auto_518398 - OBJ
      ?auto_518399 - OBJ
      ?auto_518393 - LOCATION
    )
    :vars
    (
      ?auto_518402 - LOCATION
      ?auto_518403 - CITY
      ?auto_518404 - LOCATION
      ?auto_518401 - LOCATION
      ?auto_518405 - LOCATION
      ?auto_518400 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_518402 ?auto_518403 ) ( IN-CITY ?auto_518393 ?auto_518403 ) ( not ( = ?auto_518393 ?auto_518402 ) ) ( OBJ-AT ?auto_518399 ?auto_518402 ) ( IN-CITY ?auto_518404 ?auto_518403 ) ( not ( = ?auto_518393 ?auto_518404 ) ) ( OBJ-AT ?auto_518397 ?auto_518404 ) ( IN-CITY ?auto_518401 ?auto_518403 ) ( not ( = ?auto_518393 ?auto_518401 ) ) ( OBJ-AT ?auto_518396 ?auto_518401 ) ( IN-CITY ?auto_518405 ?auto_518403 ) ( not ( = ?auto_518393 ?auto_518405 ) ) ( OBJ-AT ?auto_518395 ?auto_518405 ) ( OBJ-AT ?auto_518398 ?auto_518402 ) ( OBJ-AT ?auto_518394 ?auto_518401 ) ( TRUCK-AT ?auto_518400 ?auto_518393 ) ( not ( = ?auto_518394 ?auto_518398 ) ) ( not ( = ?auto_518402 ?auto_518401 ) ) ( not ( = ?auto_518394 ?auto_518395 ) ) ( not ( = ?auto_518398 ?auto_518395 ) ) ( not ( = ?auto_518405 ?auto_518402 ) ) ( not ( = ?auto_518405 ?auto_518401 ) ) ( not ( = ?auto_518394 ?auto_518396 ) ) ( not ( = ?auto_518398 ?auto_518396 ) ) ( not ( = ?auto_518395 ?auto_518396 ) ) ( not ( = ?auto_518394 ?auto_518397 ) ) ( not ( = ?auto_518398 ?auto_518397 ) ) ( not ( = ?auto_518395 ?auto_518397 ) ) ( not ( = ?auto_518396 ?auto_518397 ) ) ( not ( = ?auto_518404 ?auto_518401 ) ) ( not ( = ?auto_518404 ?auto_518405 ) ) ( not ( = ?auto_518404 ?auto_518402 ) ) ( not ( = ?auto_518394 ?auto_518399 ) ) ( not ( = ?auto_518398 ?auto_518399 ) ) ( not ( = ?auto_518395 ?auto_518399 ) ) ( not ( = ?auto_518396 ?auto_518399 ) ) ( not ( = ?auto_518397 ?auto_518399 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_518394 ?auto_518398 ?auto_518395 ?auto_518396 ?auto_518399 ?auto_518397 ?auto_518393 )
      ( DELIVER-6PKG-VERIFY ?auto_518394 ?auto_518395 ?auto_518396 ?auto_518397 ?auto_518398 ?auto_518399 ?auto_518393 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_519235 - OBJ
      ?auto_519236 - OBJ
      ?auto_519237 - OBJ
      ?auto_519238 - OBJ
      ?auto_519239 - OBJ
      ?auto_519240 - OBJ
      ?auto_519234 - LOCATION
    )
    :vars
    (
      ?auto_519243 - LOCATION
      ?auto_519244 - CITY
      ?auto_519245 - LOCATION
      ?auto_519242 - LOCATION
      ?auto_519246 - LOCATION
      ?auto_519241 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_519243 ?auto_519244 ) ( IN-CITY ?auto_519234 ?auto_519244 ) ( not ( = ?auto_519234 ?auto_519243 ) ) ( OBJ-AT ?auto_519240 ?auto_519243 ) ( IN-CITY ?auto_519245 ?auto_519244 ) ( not ( = ?auto_519234 ?auto_519245 ) ) ( OBJ-AT ?auto_519237 ?auto_519245 ) ( IN-CITY ?auto_519242 ?auto_519244 ) ( not ( = ?auto_519234 ?auto_519242 ) ) ( OBJ-AT ?auto_519239 ?auto_519242 ) ( IN-CITY ?auto_519246 ?auto_519244 ) ( not ( = ?auto_519234 ?auto_519246 ) ) ( OBJ-AT ?auto_519236 ?auto_519246 ) ( OBJ-AT ?auto_519238 ?auto_519243 ) ( OBJ-AT ?auto_519235 ?auto_519242 ) ( TRUCK-AT ?auto_519241 ?auto_519234 ) ( not ( = ?auto_519235 ?auto_519238 ) ) ( not ( = ?auto_519243 ?auto_519242 ) ) ( not ( = ?auto_519235 ?auto_519236 ) ) ( not ( = ?auto_519238 ?auto_519236 ) ) ( not ( = ?auto_519246 ?auto_519243 ) ) ( not ( = ?auto_519246 ?auto_519242 ) ) ( not ( = ?auto_519235 ?auto_519239 ) ) ( not ( = ?auto_519238 ?auto_519239 ) ) ( not ( = ?auto_519236 ?auto_519239 ) ) ( not ( = ?auto_519235 ?auto_519237 ) ) ( not ( = ?auto_519238 ?auto_519237 ) ) ( not ( = ?auto_519236 ?auto_519237 ) ) ( not ( = ?auto_519239 ?auto_519237 ) ) ( not ( = ?auto_519245 ?auto_519242 ) ) ( not ( = ?auto_519245 ?auto_519246 ) ) ( not ( = ?auto_519245 ?auto_519243 ) ) ( not ( = ?auto_519235 ?auto_519240 ) ) ( not ( = ?auto_519238 ?auto_519240 ) ) ( not ( = ?auto_519236 ?auto_519240 ) ) ( not ( = ?auto_519239 ?auto_519240 ) ) ( not ( = ?auto_519237 ?auto_519240 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_519235 ?auto_519238 ?auto_519236 ?auto_519239 ?auto_519240 ?auto_519237 ?auto_519234 )
      ( DELIVER-6PKG-VERIFY ?auto_519235 ?auto_519236 ?auto_519237 ?auto_519238 ?auto_519239 ?auto_519240 ?auto_519234 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_519304 - OBJ
      ?auto_519305 - OBJ
      ?auto_519306 - OBJ
      ?auto_519307 - OBJ
      ?auto_519308 - OBJ
      ?auto_519309 - OBJ
      ?auto_519303 - LOCATION
    )
    :vars
    (
      ?auto_519312 - LOCATION
      ?auto_519313 - CITY
      ?auto_519314 - LOCATION
      ?auto_519311 - LOCATION
      ?auto_519315 - LOCATION
      ?auto_519310 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_519312 ?auto_519313 ) ( IN-CITY ?auto_519303 ?auto_519313 ) ( not ( = ?auto_519303 ?auto_519312 ) ) ( OBJ-AT ?auto_519308 ?auto_519312 ) ( IN-CITY ?auto_519314 ?auto_519313 ) ( not ( = ?auto_519303 ?auto_519314 ) ) ( OBJ-AT ?auto_519306 ?auto_519314 ) ( IN-CITY ?auto_519311 ?auto_519313 ) ( not ( = ?auto_519303 ?auto_519311 ) ) ( OBJ-AT ?auto_519309 ?auto_519311 ) ( IN-CITY ?auto_519315 ?auto_519313 ) ( not ( = ?auto_519303 ?auto_519315 ) ) ( OBJ-AT ?auto_519305 ?auto_519315 ) ( OBJ-AT ?auto_519307 ?auto_519312 ) ( OBJ-AT ?auto_519304 ?auto_519311 ) ( TRUCK-AT ?auto_519310 ?auto_519303 ) ( not ( = ?auto_519304 ?auto_519307 ) ) ( not ( = ?auto_519312 ?auto_519311 ) ) ( not ( = ?auto_519304 ?auto_519305 ) ) ( not ( = ?auto_519307 ?auto_519305 ) ) ( not ( = ?auto_519315 ?auto_519312 ) ) ( not ( = ?auto_519315 ?auto_519311 ) ) ( not ( = ?auto_519304 ?auto_519309 ) ) ( not ( = ?auto_519307 ?auto_519309 ) ) ( not ( = ?auto_519305 ?auto_519309 ) ) ( not ( = ?auto_519304 ?auto_519306 ) ) ( not ( = ?auto_519307 ?auto_519306 ) ) ( not ( = ?auto_519305 ?auto_519306 ) ) ( not ( = ?auto_519309 ?auto_519306 ) ) ( not ( = ?auto_519314 ?auto_519311 ) ) ( not ( = ?auto_519314 ?auto_519315 ) ) ( not ( = ?auto_519314 ?auto_519312 ) ) ( not ( = ?auto_519304 ?auto_519308 ) ) ( not ( = ?auto_519307 ?auto_519308 ) ) ( not ( = ?auto_519305 ?auto_519308 ) ) ( not ( = ?auto_519309 ?auto_519308 ) ) ( not ( = ?auto_519306 ?auto_519308 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_519304 ?auto_519307 ?auto_519305 ?auto_519309 ?auto_519308 ?auto_519306 ?auto_519303 )
      ( DELIVER-6PKG-VERIFY ?auto_519304 ?auto_519305 ?auto_519306 ?auto_519307 ?auto_519308 ?auto_519309 ?auto_519303 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_519520 - OBJ
      ?auto_519521 - OBJ
      ?auto_519522 - OBJ
      ?auto_519523 - OBJ
      ?auto_519524 - OBJ
      ?auto_519525 - OBJ
      ?auto_519519 - LOCATION
    )
    :vars
    (
      ?auto_519528 - LOCATION
      ?auto_519529 - CITY
      ?auto_519530 - LOCATION
      ?auto_519527 - LOCATION
      ?auto_519531 - LOCATION
      ?auto_519526 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_519528 ?auto_519529 ) ( IN-CITY ?auto_519519 ?auto_519529 ) ( not ( = ?auto_519519 ?auto_519528 ) ) ( OBJ-AT ?auto_519525 ?auto_519528 ) ( IN-CITY ?auto_519530 ?auto_519529 ) ( not ( = ?auto_519519 ?auto_519530 ) ) ( OBJ-AT ?auto_519522 ?auto_519530 ) ( IN-CITY ?auto_519527 ?auto_519529 ) ( not ( = ?auto_519519 ?auto_519527 ) ) ( OBJ-AT ?auto_519523 ?auto_519527 ) ( IN-CITY ?auto_519531 ?auto_519529 ) ( not ( = ?auto_519519 ?auto_519531 ) ) ( OBJ-AT ?auto_519521 ?auto_519531 ) ( OBJ-AT ?auto_519524 ?auto_519528 ) ( OBJ-AT ?auto_519520 ?auto_519527 ) ( TRUCK-AT ?auto_519526 ?auto_519519 ) ( not ( = ?auto_519520 ?auto_519524 ) ) ( not ( = ?auto_519528 ?auto_519527 ) ) ( not ( = ?auto_519520 ?auto_519521 ) ) ( not ( = ?auto_519524 ?auto_519521 ) ) ( not ( = ?auto_519531 ?auto_519528 ) ) ( not ( = ?auto_519531 ?auto_519527 ) ) ( not ( = ?auto_519520 ?auto_519523 ) ) ( not ( = ?auto_519524 ?auto_519523 ) ) ( not ( = ?auto_519521 ?auto_519523 ) ) ( not ( = ?auto_519520 ?auto_519522 ) ) ( not ( = ?auto_519524 ?auto_519522 ) ) ( not ( = ?auto_519521 ?auto_519522 ) ) ( not ( = ?auto_519523 ?auto_519522 ) ) ( not ( = ?auto_519530 ?auto_519527 ) ) ( not ( = ?auto_519530 ?auto_519531 ) ) ( not ( = ?auto_519530 ?auto_519528 ) ) ( not ( = ?auto_519520 ?auto_519525 ) ) ( not ( = ?auto_519524 ?auto_519525 ) ) ( not ( = ?auto_519521 ?auto_519525 ) ) ( not ( = ?auto_519523 ?auto_519525 ) ) ( not ( = ?auto_519522 ?auto_519525 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_519520 ?auto_519524 ?auto_519521 ?auto_519523 ?auto_519525 ?auto_519522 ?auto_519519 )
      ( DELIVER-6PKG-VERIFY ?auto_519520 ?auto_519521 ?auto_519522 ?auto_519523 ?auto_519524 ?auto_519525 ?auto_519519 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_525210 - OBJ
      ?auto_525211 - OBJ
      ?auto_525212 - OBJ
      ?auto_525213 - OBJ
      ?auto_525214 - OBJ
      ?auto_525215 - OBJ
      ?auto_525209 - LOCATION
    )
    :vars
    (
      ?auto_525218 - LOCATION
      ?auto_525219 - CITY
      ?auto_525220 - LOCATION
      ?auto_525217 - LOCATION
      ?auto_525221 - LOCATION
      ?auto_525216 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_525218 ?auto_525219 ) ( IN-CITY ?auto_525209 ?auto_525219 ) ( not ( = ?auto_525209 ?auto_525218 ) ) ( OBJ-AT ?auto_525215 ?auto_525218 ) ( IN-CITY ?auto_525220 ?auto_525219 ) ( not ( = ?auto_525209 ?auto_525220 ) ) ( OBJ-AT ?auto_525214 ?auto_525220 ) ( IN-CITY ?auto_525217 ?auto_525219 ) ( not ( = ?auto_525209 ?auto_525217 ) ) ( OBJ-AT ?auto_525211 ?auto_525217 ) ( IN-CITY ?auto_525221 ?auto_525219 ) ( not ( = ?auto_525209 ?auto_525221 ) ) ( OBJ-AT ?auto_525213 ?auto_525221 ) ( OBJ-AT ?auto_525212 ?auto_525218 ) ( OBJ-AT ?auto_525210 ?auto_525217 ) ( TRUCK-AT ?auto_525216 ?auto_525209 ) ( not ( = ?auto_525210 ?auto_525212 ) ) ( not ( = ?auto_525218 ?auto_525217 ) ) ( not ( = ?auto_525210 ?auto_525213 ) ) ( not ( = ?auto_525212 ?auto_525213 ) ) ( not ( = ?auto_525221 ?auto_525218 ) ) ( not ( = ?auto_525221 ?auto_525217 ) ) ( not ( = ?auto_525210 ?auto_525211 ) ) ( not ( = ?auto_525212 ?auto_525211 ) ) ( not ( = ?auto_525213 ?auto_525211 ) ) ( not ( = ?auto_525210 ?auto_525214 ) ) ( not ( = ?auto_525212 ?auto_525214 ) ) ( not ( = ?auto_525213 ?auto_525214 ) ) ( not ( = ?auto_525211 ?auto_525214 ) ) ( not ( = ?auto_525220 ?auto_525217 ) ) ( not ( = ?auto_525220 ?auto_525221 ) ) ( not ( = ?auto_525220 ?auto_525218 ) ) ( not ( = ?auto_525210 ?auto_525215 ) ) ( not ( = ?auto_525212 ?auto_525215 ) ) ( not ( = ?auto_525213 ?auto_525215 ) ) ( not ( = ?auto_525211 ?auto_525215 ) ) ( not ( = ?auto_525214 ?auto_525215 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_525210 ?auto_525212 ?auto_525213 ?auto_525211 ?auto_525215 ?auto_525214 ?auto_525209 )
      ( DELIVER-6PKG-VERIFY ?auto_525210 ?auto_525211 ?auto_525212 ?auto_525213 ?auto_525214 ?auto_525215 ?auto_525209 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_525279 - OBJ
      ?auto_525280 - OBJ
      ?auto_525281 - OBJ
      ?auto_525282 - OBJ
      ?auto_525283 - OBJ
      ?auto_525284 - OBJ
      ?auto_525278 - LOCATION
    )
    :vars
    (
      ?auto_525287 - LOCATION
      ?auto_525288 - CITY
      ?auto_525289 - LOCATION
      ?auto_525286 - LOCATION
      ?auto_525290 - LOCATION
      ?auto_525285 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_525287 ?auto_525288 ) ( IN-CITY ?auto_525278 ?auto_525288 ) ( not ( = ?auto_525278 ?auto_525287 ) ) ( OBJ-AT ?auto_525283 ?auto_525287 ) ( IN-CITY ?auto_525289 ?auto_525288 ) ( not ( = ?auto_525278 ?auto_525289 ) ) ( OBJ-AT ?auto_525284 ?auto_525289 ) ( IN-CITY ?auto_525286 ?auto_525288 ) ( not ( = ?auto_525278 ?auto_525286 ) ) ( OBJ-AT ?auto_525280 ?auto_525286 ) ( IN-CITY ?auto_525290 ?auto_525288 ) ( not ( = ?auto_525278 ?auto_525290 ) ) ( OBJ-AT ?auto_525282 ?auto_525290 ) ( OBJ-AT ?auto_525281 ?auto_525287 ) ( OBJ-AT ?auto_525279 ?auto_525286 ) ( TRUCK-AT ?auto_525285 ?auto_525278 ) ( not ( = ?auto_525279 ?auto_525281 ) ) ( not ( = ?auto_525287 ?auto_525286 ) ) ( not ( = ?auto_525279 ?auto_525282 ) ) ( not ( = ?auto_525281 ?auto_525282 ) ) ( not ( = ?auto_525290 ?auto_525287 ) ) ( not ( = ?auto_525290 ?auto_525286 ) ) ( not ( = ?auto_525279 ?auto_525280 ) ) ( not ( = ?auto_525281 ?auto_525280 ) ) ( not ( = ?auto_525282 ?auto_525280 ) ) ( not ( = ?auto_525279 ?auto_525284 ) ) ( not ( = ?auto_525281 ?auto_525284 ) ) ( not ( = ?auto_525282 ?auto_525284 ) ) ( not ( = ?auto_525280 ?auto_525284 ) ) ( not ( = ?auto_525289 ?auto_525286 ) ) ( not ( = ?auto_525289 ?auto_525290 ) ) ( not ( = ?auto_525289 ?auto_525287 ) ) ( not ( = ?auto_525279 ?auto_525283 ) ) ( not ( = ?auto_525281 ?auto_525283 ) ) ( not ( = ?auto_525282 ?auto_525283 ) ) ( not ( = ?auto_525280 ?auto_525283 ) ) ( not ( = ?auto_525284 ?auto_525283 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_525279 ?auto_525281 ?auto_525282 ?auto_525280 ?auto_525283 ?auto_525284 ?auto_525278 )
      ( DELIVER-6PKG-VERIFY ?auto_525279 ?auto_525280 ?auto_525281 ?auto_525282 ?auto_525283 ?auto_525284 ?auto_525278 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_525839 - OBJ
      ?auto_525840 - OBJ
      ?auto_525841 - OBJ
      ?auto_525842 - OBJ
      ?auto_525843 - OBJ
      ?auto_525844 - OBJ
      ?auto_525838 - LOCATION
    )
    :vars
    (
      ?auto_525847 - LOCATION
      ?auto_525848 - CITY
      ?auto_525849 - LOCATION
      ?auto_525846 - LOCATION
      ?auto_525850 - LOCATION
      ?auto_525845 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_525847 ?auto_525848 ) ( IN-CITY ?auto_525838 ?auto_525848 ) ( not ( = ?auto_525838 ?auto_525847 ) ) ( OBJ-AT ?auto_525842 ?auto_525847 ) ( IN-CITY ?auto_525849 ?auto_525848 ) ( not ( = ?auto_525838 ?auto_525849 ) ) ( OBJ-AT ?auto_525844 ?auto_525849 ) ( IN-CITY ?auto_525846 ?auto_525848 ) ( not ( = ?auto_525838 ?auto_525846 ) ) ( OBJ-AT ?auto_525840 ?auto_525846 ) ( IN-CITY ?auto_525850 ?auto_525848 ) ( not ( = ?auto_525838 ?auto_525850 ) ) ( OBJ-AT ?auto_525843 ?auto_525850 ) ( OBJ-AT ?auto_525841 ?auto_525847 ) ( OBJ-AT ?auto_525839 ?auto_525846 ) ( TRUCK-AT ?auto_525845 ?auto_525838 ) ( not ( = ?auto_525839 ?auto_525841 ) ) ( not ( = ?auto_525847 ?auto_525846 ) ) ( not ( = ?auto_525839 ?auto_525843 ) ) ( not ( = ?auto_525841 ?auto_525843 ) ) ( not ( = ?auto_525850 ?auto_525847 ) ) ( not ( = ?auto_525850 ?auto_525846 ) ) ( not ( = ?auto_525839 ?auto_525840 ) ) ( not ( = ?auto_525841 ?auto_525840 ) ) ( not ( = ?auto_525843 ?auto_525840 ) ) ( not ( = ?auto_525839 ?auto_525844 ) ) ( not ( = ?auto_525841 ?auto_525844 ) ) ( not ( = ?auto_525843 ?auto_525844 ) ) ( not ( = ?auto_525840 ?auto_525844 ) ) ( not ( = ?auto_525849 ?auto_525846 ) ) ( not ( = ?auto_525849 ?auto_525850 ) ) ( not ( = ?auto_525849 ?auto_525847 ) ) ( not ( = ?auto_525839 ?auto_525842 ) ) ( not ( = ?auto_525841 ?auto_525842 ) ) ( not ( = ?auto_525843 ?auto_525842 ) ) ( not ( = ?auto_525840 ?auto_525842 ) ) ( not ( = ?auto_525844 ?auto_525842 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_525839 ?auto_525841 ?auto_525843 ?auto_525840 ?auto_525842 ?auto_525844 ?auto_525838 )
      ( DELIVER-6PKG-VERIFY ?auto_525839 ?auto_525840 ?auto_525841 ?auto_525842 ?auto_525843 ?auto_525844 ?auto_525838 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_526336 - OBJ
      ?auto_526337 - OBJ
      ?auto_526338 - OBJ
      ?auto_526339 - OBJ
      ?auto_526340 - OBJ
      ?auto_526341 - OBJ
      ?auto_526335 - LOCATION
    )
    :vars
    (
      ?auto_526344 - LOCATION
      ?auto_526345 - CITY
      ?auto_526346 - LOCATION
      ?auto_526343 - LOCATION
      ?auto_526347 - LOCATION
      ?auto_526342 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_526344 ?auto_526345 ) ( IN-CITY ?auto_526335 ?auto_526345 ) ( not ( = ?auto_526335 ?auto_526344 ) ) ( OBJ-AT ?auto_526341 ?auto_526344 ) ( IN-CITY ?auto_526346 ?auto_526345 ) ( not ( = ?auto_526335 ?auto_526346 ) ) ( OBJ-AT ?auto_526340 ?auto_526346 ) ( IN-CITY ?auto_526343 ?auto_526345 ) ( not ( = ?auto_526335 ?auto_526343 ) ) ( OBJ-AT ?auto_526337 ?auto_526343 ) ( IN-CITY ?auto_526347 ?auto_526345 ) ( not ( = ?auto_526335 ?auto_526347 ) ) ( OBJ-AT ?auto_526338 ?auto_526347 ) ( OBJ-AT ?auto_526339 ?auto_526344 ) ( OBJ-AT ?auto_526336 ?auto_526343 ) ( TRUCK-AT ?auto_526342 ?auto_526335 ) ( not ( = ?auto_526336 ?auto_526339 ) ) ( not ( = ?auto_526344 ?auto_526343 ) ) ( not ( = ?auto_526336 ?auto_526338 ) ) ( not ( = ?auto_526339 ?auto_526338 ) ) ( not ( = ?auto_526347 ?auto_526344 ) ) ( not ( = ?auto_526347 ?auto_526343 ) ) ( not ( = ?auto_526336 ?auto_526337 ) ) ( not ( = ?auto_526339 ?auto_526337 ) ) ( not ( = ?auto_526338 ?auto_526337 ) ) ( not ( = ?auto_526336 ?auto_526340 ) ) ( not ( = ?auto_526339 ?auto_526340 ) ) ( not ( = ?auto_526338 ?auto_526340 ) ) ( not ( = ?auto_526337 ?auto_526340 ) ) ( not ( = ?auto_526346 ?auto_526343 ) ) ( not ( = ?auto_526346 ?auto_526347 ) ) ( not ( = ?auto_526346 ?auto_526344 ) ) ( not ( = ?auto_526336 ?auto_526341 ) ) ( not ( = ?auto_526339 ?auto_526341 ) ) ( not ( = ?auto_526338 ?auto_526341 ) ) ( not ( = ?auto_526337 ?auto_526341 ) ) ( not ( = ?auto_526340 ?auto_526341 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_526336 ?auto_526339 ?auto_526338 ?auto_526337 ?auto_526341 ?auto_526340 ?auto_526335 )
      ( DELIVER-6PKG-VERIFY ?auto_526336 ?auto_526337 ?auto_526338 ?auto_526339 ?auto_526340 ?auto_526341 ?auto_526335 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_526405 - OBJ
      ?auto_526406 - OBJ
      ?auto_526407 - OBJ
      ?auto_526408 - OBJ
      ?auto_526409 - OBJ
      ?auto_526410 - OBJ
      ?auto_526404 - LOCATION
    )
    :vars
    (
      ?auto_526413 - LOCATION
      ?auto_526414 - CITY
      ?auto_526415 - LOCATION
      ?auto_526412 - LOCATION
      ?auto_526416 - LOCATION
      ?auto_526411 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_526413 ?auto_526414 ) ( IN-CITY ?auto_526404 ?auto_526414 ) ( not ( = ?auto_526404 ?auto_526413 ) ) ( OBJ-AT ?auto_526409 ?auto_526413 ) ( IN-CITY ?auto_526415 ?auto_526414 ) ( not ( = ?auto_526404 ?auto_526415 ) ) ( OBJ-AT ?auto_526410 ?auto_526415 ) ( IN-CITY ?auto_526412 ?auto_526414 ) ( not ( = ?auto_526404 ?auto_526412 ) ) ( OBJ-AT ?auto_526406 ?auto_526412 ) ( IN-CITY ?auto_526416 ?auto_526414 ) ( not ( = ?auto_526404 ?auto_526416 ) ) ( OBJ-AT ?auto_526407 ?auto_526416 ) ( OBJ-AT ?auto_526408 ?auto_526413 ) ( OBJ-AT ?auto_526405 ?auto_526412 ) ( TRUCK-AT ?auto_526411 ?auto_526404 ) ( not ( = ?auto_526405 ?auto_526408 ) ) ( not ( = ?auto_526413 ?auto_526412 ) ) ( not ( = ?auto_526405 ?auto_526407 ) ) ( not ( = ?auto_526408 ?auto_526407 ) ) ( not ( = ?auto_526416 ?auto_526413 ) ) ( not ( = ?auto_526416 ?auto_526412 ) ) ( not ( = ?auto_526405 ?auto_526406 ) ) ( not ( = ?auto_526408 ?auto_526406 ) ) ( not ( = ?auto_526407 ?auto_526406 ) ) ( not ( = ?auto_526405 ?auto_526410 ) ) ( not ( = ?auto_526408 ?auto_526410 ) ) ( not ( = ?auto_526407 ?auto_526410 ) ) ( not ( = ?auto_526406 ?auto_526410 ) ) ( not ( = ?auto_526415 ?auto_526412 ) ) ( not ( = ?auto_526415 ?auto_526416 ) ) ( not ( = ?auto_526415 ?auto_526413 ) ) ( not ( = ?auto_526405 ?auto_526409 ) ) ( not ( = ?auto_526408 ?auto_526409 ) ) ( not ( = ?auto_526407 ?auto_526409 ) ) ( not ( = ?auto_526406 ?auto_526409 ) ) ( not ( = ?auto_526410 ?auto_526409 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_526405 ?auto_526408 ?auto_526407 ?auto_526406 ?auto_526409 ?auto_526410 ?auto_526404 )
      ( DELIVER-6PKG-VERIFY ?auto_526405 ?auto_526406 ?auto_526407 ?auto_526408 ?auto_526409 ?auto_526410 ?auto_526404 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_526768 - OBJ
      ?auto_526769 - OBJ
      ?auto_526770 - OBJ
      ?auto_526771 - OBJ
      ?auto_526772 - OBJ
      ?auto_526773 - OBJ
      ?auto_526767 - LOCATION
    )
    :vars
    (
      ?auto_526776 - LOCATION
      ?auto_526777 - CITY
      ?auto_526778 - LOCATION
      ?auto_526775 - LOCATION
      ?auto_526779 - LOCATION
      ?auto_526774 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_526776 ?auto_526777 ) ( IN-CITY ?auto_526767 ?auto_526777 ) ( not ( = ?auto_526767 ?auto_526776 ) ) ( OBJ-AT ?auto_526773 ?auto_526776 ) ( IN-CITY ?auto_526778 ?auto_526777 ) ( not ( = ?auto_526767 ?auto_526778 ) ) ( OBJ-AT ?auto_526771 ?auto_526778 ) ( IN-CITY ?auto_526775 ?auto_526777 ) ( not ( = ?auto_526767 ?auto_526775 ) ) ( OBJ-AT ?auto_526769 ?auto_526775 ) ( IN-CITY ?auto_526779 ?auto_526777 ) ( not ( = ?auto_526767 ?auto_526779 ) ) ( OBJ-AT ?auto_526770 ?auto_526779 ) ( OBJ-AT ?auto_526772 ?auto_526776 ) ( OBJ-AT ?auto_526768 ?auto_526775 ) ( TRUCK-AT ?auto_526774 ?auto_526767 ) ( not ( = ?auto_526768 ?auto_526772 ) ) ( not ( = ?auto_526776 ?auto_526775 ) ) ( not ( = ?auto_526768 ?auto_526770 ) ) ( not ( = ?auto_526772 ?auto_526770 ) ) ( not ( = ?auto_526779 ?auto_526776 ) ) ( not ( = ?auto_526779 ?auto_526775 ) ) ( not ( = ?auto_526768 ?auto_526769 ) ) ( not ( = ?auto_526772 ?auto_526769 ) ) ( not ( = ?auto_526770 ?auto_526769 ) ) ( not ( = ?auto_526768 ?auto_526771 ) ) ( not ( = ?auto_526772 ?auto_526771 ) ) ( not ( = ?auto_526770 ?auto_526771 ) ) ( not ( = ?auto_526769 ?auto_526771 ) ) ( not ( = ?auto_526778 ?auto_526775 ) ) ( not ( = ?auto_526778 ?auto_526779 ) ) ( not ( = ?auto_526778 ?auto_526776 ) ) ( not ( = ?auto_526768 ?auto_526773 ) ) ( not ( = ?auto_526772 ?auto_526773 ) ) ( not ( = ?auto_526770 ?auto_526773 ) ) ( not ( = ?auto_526769 ?auto_526773 ) ) ( not ( = ?auto_526771 ?auto_526773 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_526768 ?auto_526772 ?auto_526770 ?auto_526769 ?auto_526773 ?auto_526771 ?auto_526767 )
      ( DELIVER-6PKG-VERIFY ?auto_526768 ?auto_526769 ?auto_526770 ?auto_526771 ?auto_526772 ?auto_526773 ?auto_526767 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_632130 - OBJ
      ?auto_632131 - OBJ
      ?auto_632132 - OBJ
      ?auto_632133 - OBJ
      ?auto_632134 - OBJ
      ?auto_632135 - OBJ
      ?auto_632129 - LOCATION
    )
    :vars
    (
      ?auto_632138 - LOCATION
      ?auto_632139 - CITY
      ?auto_632140 - LOCATION
      ?auto_632137 - LOCATION
      ?auto_632141 - LOCATION
      ?auto_632136 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_632138 ?auto_632139 ) ( IN-CITY ?auto_632129 ?auto_632139 ) ( not ( = ?auto_632129 ?auto_632138 ) ) ( OBJ-AT ?auto_632135 ?auto_632138 ) ( IN-CITY ?auto_632140 ?auto_632139 ) ( not ( = ?auto_632129 ?auto_632140 ) ) ( OBJ-AT ?auto_632134 ?auto_632140 ) ( IN-CITY ?auto_632137 ?auto_632139 ) ( not ( = ?auto_632129 ?auto_632137 ) ) ( OBJ-AT ?auto_632133 ?auto_632137 ) ( IN-CITY ?auto_632141 ?auto_632139 ) ( not ( = ?auto_632129 ?auto_632141 ) ) ( OBJ-AT ?auto_632130 ?auto_632141 ) ( OBJ-AT ?auto_632132 ?auto_632138 ) ( OBJ-AT ?auto_632131 ?auto_632137 ) ( TRUCK-AT ?auto_632136 ?auto_632129 ) ( not ( = ?auto_632131 ?auto_632132 ) ) ( not ( = ?auto_632138 ?auto_632137 ) ) ( not ( = ?auto_632131 ?auto_632130 ) ) ( not ( = ?auto_632132 ?auto_632130 ) ) ( not ( = ?auto_632141 ?auto_632138 ) ) ( not ( = ?auto_632141 ?auto_632137 ) ) ( not ( = ?auto_632131 ?auto_632133 ) ) ( not ( = ?auto_632132 ?auto_632133 ) ) ( not ( = ?auto_632130 ?auto_632133 ) ) ( not ( = ?auto_632131 ?auto_632134 ) ) ( not ( = ?auto_632132 ?auto_632134 ) ) ( not ( = ?auto_632130 ?auto_632134 ) ) ( not ( = ?auto_632133 ?auto_632134 ) ) ( not ( = ?auto_632140 ?auto_632137 ) ) ( not ( = ?auto_632140 ?auto_632141 ) ) ( not ( = ?auto_632140 ?auto_632138 ) ) ( not ( = ?auto_632131 ?auto_632135 ) ) ( not ( = ?auto_632132 ?auto_632135 ) ) ( not ( = ?auto_632130 ?auto_632135 ) ) ( not ( = ?auto_632133 ?auto_632135 ) ) ( not ( = ?auto_632134 ?auto_632135 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_632131 ?auto_632132 ?auto_632130 ?auto_632133 ?auto_632135 ?auto_632134 ?auto_632129 )
      ( DELIVER-6PKG-VERIFY ?auto_632130 ?auto_632131 ?auto_632132 ?auto_632133 ?auto_632134 ?auto_632135 ?auto_632129 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_632199 - OBJ
      ?auto_632200 - OBJ
      ?auto_632201 - OBJ
      ?auto_632202 - OBJ
      ?auto_632203 - OBJ
      ?auto_632204 - OBJ
      ?auto_632198 - LOCATION
    )
    :vars
    (
      ?auto_632207 - LOCATION
      ?auto_632208 - CITY
      ?auto_632209 - LOCATION
      ?auto_632206 - LOCATION
      ?auto_632210 - LOCATION
      ?auto_632205 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_632207 ?auto_632208 ) ( IN-CITY ?auto_632198 ?auto_632208 ) ( not ( = ?auto_632198 ?auto_632207 ) ) ( OBJ-AT ?auto_632203 ?auto_632207 ) ( IN-CITY ?auto_632209 ?auto_632208 ) ( not ( = ?auto_632198 ?auto_632209 ) ) ( OBJ-AT ?auto_632204 ?auto_632209 ) ( IN-CITY ?auto_632206 ?auto_632208 ) ( not ( = ?auto_632198 ?auto_632206 ) ) ( OBJ-AT ?auto_632202 ?auto_632206 ) ( IN-CITY ?auto_632210 ?auto_632208 ) ( not ( = ?auto_632198 ?auto_632210 ) ) ( OBJ-AT ?auto_632199 ?auto_632210 ) ( OBJ-AT ?auto_632201 ?auto_632207 ) ( OBJ-AT ?auto_632200 ?auto_632206 ) ( TRUCK-AT ?auto_632205 ?auto_632198 ) ( not ( = ?auto_632200 ?auto_632201 ) ) ( not ( = ?auto_632207 ?auto_632206 ) ) ( not ( = ?auto_632200 ?auto_632199 ) ) ( not ( = ?auto_632201 ?auto_632199 ) ) ( not ( = ?auto_632210 ?auto_632207 ) ) ( not ( = ?auto_632210 ?auto_632206 ) ) ( not ( = ?auto_632200 ?auto_632202 ) ) ( not ( = ?auto_632201 ?auto_632202 ) ) ( not ( = ?auto_632199 ?auto_632202 ) ) ( not ( = ?auto_632200 ?auto_632204 ) ) ( not ( = ?auto_632201 ?auto_632204 ) ) ( not ( = ?auto_632199 ?auto_632204 ) ) ( not ( = ?auto_632202 ?auto_632204 ) ) ( not ( = ?auto_632209 ?auto_632206 ) ) ( not ( = ?auto_632209 ?auto_632210 ) ) ( not ( = ?auto_632209 ?auto_632207 ) ) ( not ( = ?auto_632200 ?auto_632203 ) ) ( not ( = ?auto_632201 ?auto_632203 ) ) ( not ( = ?auto_632199 ?auto_632203 ) ) ( not ( = ?auto_632202 ?auto_632203 ) ) ( not ( = ?auto_632204 ?auto_632203 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_632200 ?auto_632201 ?auto_632199 ?auto_632202 ?auto_632203 ?auto_632204 ?auto_632198 )
      ( DELIVER-6PKG-VERIFY ?auto_632199 ?auto_632200 ?auto_632201 ?auto_632202 ?auto_632203 ?auto_632204 ?auto_632198 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_632268 - OBJ
      ?auto_632269 - OBJ
      ?auto_632270 - OBJ
      ?auto_632271 - OBJ
      ?auto_632272 - OBJ
      ?auto_632273 - OBJ
      ?auto_632267 - LOCATION
    )
    :vars
    (
      ?auto_632276 - LOCATION
      ?auto_632277 - CITY
      ?auto_632278 - LOCATION
      ?auto_632275 - LOCATION
      ?auto_632279 - LOCATION
      ?auto_632274 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_632276 ?auto_632277 ) ( IN-CITY ?auto_632267 ?auto_632277 ) ( not ( = ?auto_632267 ?auto_632276 ) ) ( OBJ-AT ?auto_632273 ?auto_632276 ) ( IN-CITY ?auto_632278 ?auto_632277 ) ( not ( = ?auto_632267 ?auto_632278 ) ) ( OBJ-AT ?auto_632271 ?auto_632278 ) ( IN-CITY ?auto_632275 ?auto_632277 ) ( not ( = ?auto_632267 ?auto_632275 ) ) ( OBJ-AT ?auto_632272 ?auto_632275 ) ( IN-CITY ?auto_632279 ?auto_632277 ) ( not ( = ?auto_632267 ?auto_632279 ) ) ( OBJ-AT ?auto_632268 ?auto_632279 ) ( OBJ-AT ?auto_632270 ?auto_632276 ) ( OBJ-AT ?auto_632269 ?auto_632275 ) ( TRUCK-AT ?auto_632274 ?auto_632267 ) ( not ( = ?auto_632269 ?auto_632270 ) ) ( not ( = ?auto_632276 ?auto_632275 ) ) ( not ( = ?auto_632269 ?auto_632268 ) ) ( not ( = ?auto_632270 ?auto_632268 ) ) ( not ( = ?auto_632279 ?auto_632276 ) ) ( not ( = ?auto_632279 ?auto_632275 ) ) ( not ( = ?auto_632269 ?auto_632272 ) ) ( not ( = ?auto_632270 ?auto_632272 ) ) ( not ( = ?auto_632268 ?auto_632272 ) ) ( not ( = ?auto_632269 ?auto_632271 ) ) ( not ( = ?auto_632270 ?auto_632271 ) ) ( not ( = ?auto_632268 ?auto_632271 ) ) ( not ( = ?auto_632272 ?auto_632271 ) ) ( not ( = ?auto_632278 ?auto_632275 ) ) ( not ( = ?auto_632278 ?auto_632279 ) ) ( not ( = ?auto_632278 ?auto_632276 ) ) ( not ( = ?auto_632269 ?auto_632273 ) ) ( not ( = ?auto_632270 ?auto_632273 ) ) ( not ( = ?auto_632268 ?auto_632273 ) ) ( not ( = ?auto_632272 ?auto_632273 ) ) ( not ( = ?auto_632271 ?auto_632273 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_632269 ?auto_632270 ?auto_632268 ?auto_632272 ?auto_632273 ?auto_632271 ?auto_632267 )
      ( DELIVER-6PKG-VERIFY ?auto_632268 ?auto_632269 ?auto_632270 ?auto_632271 ?auto_632272 ?auto_632273 ?auto_632267 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_632337 - OBJ
      ?auto_632338 - OBJ
      ?auto_632339 - OBJ
      ?auto_632340 - OBJ
      ?auto_632341 - OBJ
      ?auto_632342 - OBJ
      ?auto_632336 - LOCATION
    )
    :vars
    (
      ?auto_632345 - LOCATION
      ?auto_632346 - CITY
      ?auto_632347 - LOCATION
      ?auto_632344 - LOCATION
      ?auto_632348 - LOCATION
      ?auto_632343 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_632345 ?auto_632346 ) ( IN-CITY ?auto_632336 ?auto_632346 ) ( not ( = ?auto_632336 ?auto_632345 ) ) ( OBJ-AT ?auto_632341 ?auto_632345 ) ( IN-CITY ?auto_632347 ?auto_632346 ) ( not ( = ?auto_632336 ?auto_632347 ) ) ( OBJ-AT ?auto_632340 ?auto_632347 ) ( IN-CITY ?auto_632344 ?auto_632346 ) ( not ( = ?auto_632336 ?auto_632344 ) ) ( OBJ-AT ?auto_632342 ?auto_632344 ) ( IN-CITY ?auto_632348 ?auto_632346 ) ( not ( = ?auto_632336 ?auto_632348 ) ) ( OBJ-AT ?auto_632337 ?auto_632348 ) ( OBJ-AT ?auto_632339 ?auto_632345 ) ( OBJ-AT ?auto_632338 ?auto_632344 ) ( TRUCK-AT ?auto_632343 ?auto_632336 ) ( not ( = ?auto_632338 ?auto_632339 ) ) ( not ( = ?auto_632345 ?auto_632344 ) ) ( not ( = ?auto_632338 ?auto_632337 ) ) ( not ( = ?auto_632339 ?auto_632337 ) ) ( not ( = ?auto_632348 ?auto_632345 ) ) ( not ( = ?auto_632348 ?auto_632344 ) ) ( not ( = ?auto_632338 ?auto_632342 ) ) ( not ( = ?auto_632339 ?auto_632342 ) ) ( not ( = ?auto_632337 ?auto_632342 ) ) ( not ( = ?auto_632338 ?auto_632340 ) ) ( not ( = ?auto_632339 ?auto_632340 ) ) ( not ( = ?auto_632337 ?auto_632340 ) ) ( not ( = ?auto_632342 ?auto_632340 ) ) ( not ( = ?auto_632347 ?auto_632344 ) ) ( not ( = ?auto_632347 ?auto_632348 ) ) ( not ( = ?auto_632347 ?auto_632345 ) ) ( not ( = ?auto_632338 ?auto_632341 ) ) ( not ( = ?auto_632339 ?auto_632341 ) ) ( not ( = ?auto_632337 ?auto_632341 ) ) ( not ( = ?auto_632342 ?auto_632341 ) ) ( not ( = ?auto_632340 ?auto_632341 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_632338 ?auto_632339 ?auto_632337 ?auto_632342 ?auto_632341 ?auto_632340 ?auto_632336 )
      ( DELIVER-6PKG-VERIFY ?auto_632337 ?auto_632338 ?auto_632339 ?auto_632340 ?auto_632341 ?auto_632342 ?auto_632336 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_632698 - OBJ
      ?auto_632699 - OBJ
      ?auto_632700 - OBJ
      ?auto_632701 - OBJ
      ?auto_632702 - OBJ
      ?auto_632703 - OBJ
      ?auto_632697 - LOCATION
    )
    :vars
    (
      ?auto_632706 - LOCATION
      ?auto_632707 - CITY
      ?auto_632708 - LOCATION
      ?auto_632705 - LOCATION
      ?auto_632709 - LOCATION
      ?auto_632704 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_632706 ?auto_632707 ) ( IN-CITY ?auto_632697 ?auto_632707 ) ( not ( = ?auto_632697 ?auto_632706 ) ) ( OBJ-AT ?auto_632701 ?auto_632706 ) ( IN-CITY ?auto_632708 ?auto_632707 ) ( not ( = ?auto_632697 ?auto_632708 ) ) ( OBJ-AT ?auto_632703 ?auto_632708 ) ( IN-CITY ?auto_632705 ?auto_632707 ) ( not ( = ?auto_632697 ?auto_632705 ) ) ( OBJ-AT ?auto_632702 ?auto_632705 ) ( IN-CITY ?auto_632709 ?auto_632707 ) ( not ( = ?auto_632697 ?auto_632709 ) ) ( OBJ-AT ?auto_632698 ?auto_632709 ) ( OBJ-AT ?auto_632700 ?auto_632706 ) ( OBJ-AT ?auto_632699 ?auto_632705 ) ( TRUCK-AT ?auto_632704 ?auto_632697 ) ( not ( = ?auto_632699 ?auto_632700 ) ) ( not ( = ?auto_632706 ?auto_632705 ) ) ( not ( = ?auto_632699 ?auto_632698 ) ) ( not ( = ?auto_632700 ?auto_632698 ) ) ( not ( = ?auto_632709 ?auto_632706 ) ) ( not ( = ?auto_632709 ?auto_632705 ) ) ( not ( = ?auto_632699 ?auto_632702 ) ) ( not ( = ?auto_632700 ?auto_632702 ) ) ( not ( = ?auto_632698 ?auto_632702 ) ) ( not ( = ?auto_632699 ?auto_632703 ) ) ( not ( = ?auto_632700 ?auto_632703 ) ) ( not ( = ?auto_632698 ?auto_632703 ) ) ( not ( = ?auto_632702 ?auto_632703 ) ) ( not ( = ?auto_632708 ?auto_632705 ) ) ( not ( = ?auto_632708 ?auto_632709 ) ) ( not ( = ?auto_632708 ?auto_632706 ) ) ( not ( = ?auto_632699 ?auto_632701 ) ) ( not ( = ?auto_632700 ?auto_632701 ) ) ( not ( = ?auto_632698 ?auto_632701 ) ) ( not ( = ?auto_632702 ?auto_632701 ) ) ( not ( = ?auto_632703 ?auto_632701 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_632699 ?auto_632700 ?auto_632698 ?auto_632702 ?auto_632701 ?auto_632703 ?auto_632697 )
      ( DELIVER-6PKG-VERIFY ?auto_632698 ?auto_632699 ?auto_632700 ?auto_632701 ?auto_632702 ?auto_632703 ?auto_632697 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_632767 - OBJ
      ?auto_632768 - OBJ
      ?auto_632769 - OBJ
      ?auto_632770 - OBJ
      ?auto_632771 - OBJ
      ?auto_632772 - OBJ
      ?auto_632766 - LOCATION
    )
    :vars
    (
      ?auto_632775 - LOCATION
      ?auto_632776 - CITY
      ?auto_632777 - LOCATION
      ?auto_632774 - LOCATION
      ?auto_632778 - LOCATION
      ?auto_632773 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_632775 ?auto_632776 ) ( IN-CITY ?auto_632766 ?auto_632776 ) ( not ( = ?auto_632766 ?auto_632775 ) ) ( OBJ-AT ?auto_632770 ?auto_632775 ) ( IN-CITY ?auto_632777 ?auto_632776 ) ( not ( = ?auto_632766 ?auto_632777 ) ) ( OBJ-AT ?auto_632771 ?auto_632777 ) ( IN-CITY ?auto_632774 ?auto_632776 ) ( not ( = ?auto_632766 ?auto_632774 ) ) ( OBJ-AT ?auto_632772 ?auto_632774 ) ( IN-CITY ?auto_632778 ?auto_632776 ) ( not ( = ?auto_632766 ?auto_632778 ) ) ( OBJ-AT ?auto_632767 ?auto_632778 ) ( OBJ-AT ?auto_632769 ?auto_632775 ) ( OBJ-AT ?auto_632768 ?auto_632774 ) ( TRUCK-AT ?auto_632773 ?auto_632766 ) ( not ( = ?auto_632768 ?auto_632769 ) ) ( not ( = ?auto_632775 ?auto_632774 ) ) ( not ( = ?auto_632768 ?auto_632767 ) ) ( not ( = ?auto_632769 ?auto_632767 ) ) ( not ( = ?auto_632778 ?auto_632775 ) ) ( not ( = ?auto_632778 ?auto_632774 ) ) ( not ( = ?auto_632768 ?auto_632772 ) ) ( not ( = ?auto_632769 ?auto_632772 ) ) ( not ( = ?auto_632767 ?auto_632772 ) ) ( not ( = ?auto_632768 ?auto_632771 ) ) ( not ( = ?auto_632769 ?auto_632771 ) ) ( not ( = ?auto_632767 ?auto_632771 ) ) ( not ( = ?auto_632772 ?auto_632771 ) ) ( not ( = ?auto_632777 ?auto_632774 ) ) ( not ( = ?auto_632777 ?auto_632778 ) ) ( not ( = ?auto_632777 ?auto_632775 ) ) ( not ( = ?auto_632768 ?auto_632770 ) ) ( not ( = ?auto_632769 ?auto_632770 ) ) ( not ( = ?auto_632767 ?auto_632770 ) ) ( not ( = ?auto_632772 ?auto_632770 ) ) ( not ( = ?auto_632771 ?auto_632770 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_632768 ?auto_632769 ?auto_632767 ?auto_632772 ?auto_632770 ?auto_632771 ?auto_632766 )
      ( DELIVER-6PKG-VERIFY ?auto_632767 ?auto_632768 ?auto_632769 ?auto_632770 ?auto_632771 ?auto_632772 ?auto_632766 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_634479 - OBJ
      ?auto_634480 - OBJ
      ?auto_634481 - OBJ
      ?auto_634482 - OBJ
      ?auto_634483 - OBJ
      ?auto_634484 - OBJ
      ?auto_634478 - LOCATION
    )
    :vars
    (
      ?auto_634487 - LOCATION
      ?auto_634488 - CITY
      ?auto_634489 - LOCATION
      ?auto_634486 - LOCATION
      ?auto_634490 - LOCATION
      ?auto_634485 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_634487 ?auto_634488 ) ( IN-CITY ?auto_634478 ?auto_634488 ) ( not ( = ?auto_634478 ?auto_634487 ) ) ( OBJ-AT ?auto_634484 ?auto_634487 ) ( IN-CITY ?auto_634489 ?auto_634488 ) ( not ( = ?auto_634478 ?auto_634489 ) ) ( OBJ-AT ?auto_634483 ?auto_634489 ) ( IN-CITY ?auto_634486 ?auto_634488 ) ( not ( = ?auto_634478 ?auto_634486 ) ) ( OBJ-AT ?auto_634481 ?auto_634486 ) ( IN-CITY ?auto_634490 ?auto_634488 ) ( not ( = ?auto_634478 ?auto_634490 ) ) ( OBJ-AT ?auto_634479 ?auto_634490 ) ( OBJ-AT ?auto_634482 ?auto_634487 ) ( OBJ-AT ?auto_634480 ?auto_634486 ) ( TRUCK-AT ?auto_634485 ?auto_634478 ) ( not ( = ?auto_634480 ?auto_634482 ) ) ( not ( = ?auto_634487 ?auto_634486 ) ) ( not ( = ?auto_634480 ?auto_634479 ) ) ( not ( = ?auto_634482 ?auto_634479 ) ) ( not ( = ?auto_634490 ?auto_634487 ) ) ( not ( = ?auto_634490 ?auto_634486 ) ) ( not ( = ?auto_634480 ?auto_634481 ) ) ( not ( = ?auto_634482 ?auto_634481 ) ) ( not ( = ?auto_634479 ?auto_634481 ) ) ( not ( = ?auto_634480 ?auto_634483 ) ) ( not ( = ?auto_634482 ?auto_634483 ) ) ( not ( = ?auto_634479 ?auto_634483 ) ) ( not ( = ?auto_634481 ?auto_634483 ) ) ( not ( = ?auto_634489 ?auto_634486 ) ) ( not ( = ?auto_634489 ?auto_634490 ) ) ( not ( = ?auto_634489 ?auto_634487 ) ) ( not ( = ?auto_634480 ?auto_634484 ) ) ( not ( = ?auto_634482 ?auto_634484 ) ) ( not ( = ?auto_634479 ?auto_634484 ) ) ( not ( = ?auto_634481 ?auto_634484 ) ) ( not ( = ?auto_634483 ?auto_634484 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_634480 ?auto_634482 ?auto_634479 ?auto_634481 ?auto_634484 ?auto_634483 ?auto_634478 )
      ( DELIVER-6PKG-VERIFY ?auto_634479 ?auto_634480 ?auto_634481 ?auto_634482 ?auto_634483 ?auto_634484 ?auto_634478 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_634548 - OBJ
      ?auto_634549 - OBJ
      ?auto_634550 - OBJ
      ?auto_634551 - OBJ
      ?auto_634552 - OBJ
      ?auto_634553 - OBJ
      ?auto_634547 - LOCATION
    )
    :vars
    (
      ?auto_634556 - LOCATION
      ?auto_634557 - CITY
      ?auto_634558 - LOCATION
      ?auto_634555 - LOCATION
      ?auto_634559 - LOCATION
      ?auto_634554 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_634556 ?auto_634557 ) ( IN-CITY ?auto_634547 ?auto_634557 ) ( not ( = ?auto_634547 ?auto_634556 ) ) ( OBJ-AT ?auto_634552 ?auto_634556 ) ( IN-CITY ?auto_634558 ?auto_634557 ) ( not ( = ?auto_634547 ?auto_634558 ) ) ( OBJ-AT ?auto_634553 ?auto_634558 ) ( IN-CITY ?auto_634555 ?auto_634557 ) ( not ( = ?auto_634547 ?auto_634555 ) ) ( OBJ-AT ?auto_634550 ?auto_634555 ) ( IN-CITY ?auto_634559 ?auto_634557 ) ( not ( = ?auto_634547 ?auto_634559 ) ) ( OBJ-AT ?auto_634548 ?auto_634559 ) ( OBJ-AT ?auto_634551 ?auto_634556 ) ( OBJ-AT ?auto_634549 ?auto_634555 ) ( TRUCK-AT ?auto_634554 ?auto_634547 ) ( not ( = ?auto_634549 ?auto_634551 ) ) ( not ( = ?auto_634556 ?auto_634555 ) ) ( not ( = ?auto_634549 ?auto_634548 ) ) ( not ( = ?auto_634551 ?auto_634548 ) ) ( not ( = ?auto_634559 ?auto_634556 ) ) ( not ( = ?auto_634559 ?auto_634555 ) ) ( not ( = ?auto_634549 ?auto_634550 ) ) ( not ( = ?auto_634551 ?auto_634550 ) ) ( not ( = ?auto_634548 ?auto_634550 ) ) ( not ( = ?auto_634549 ?auto_634553 ) ) ( not ( = ?auto_634551 ?auto_634553 ) ) ( not ( = ?auto_634548 ?auto_634553 ) ) ( not ( = ?auto_634550 ?auto_634553 ) ) ( not ( = ?auto_634558 ?auto_634555 ) ) ( not ( = ?auto_634558 ?auto_634559 ) ) ( not ( = ?auto_634558 ?auto_634556 ) ) ( not ( = ?auto_634549 ?auto_634552 ) ) ( not ( = ?auto_634551 ?auto_634552 ) ) ( not ( = ?auto_634548 ?auto_634552 ) ) ( not ( = ?auto_634550 ?auto_634552 ) ) ( not ( = ?auto_634553 ?auto_634552 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_634549 ?auto_634551 ?auto_634548 ?auto_634550 ?auto_634552 ?auto_634553 ?auto_634547 )
      ( DELIVER-6PKG-VERIFY ?auto_634548 ?auto_634549 ?auto_634550 ?auto_634551 ?auto_634552 ?auto_634553 ?auto_634547 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_634911 - OBJ
      ?auto_634912 - OBJ
      ?auto_634913 - OBJ
      ?auto_634914 - OBJ
      ?auto_634915 - OBJ
      ?auto_634916 - OBJ
      ?auto_634910 - LOCATION
    )
    :vars
    (
      ?auto_634919 - LOCATION
      ?auto_634920 - CITY
      ?auto_634921 - LOCATION
      ?auto_634918 - LOCATION
      ?auto_634922 - LOCATION
      ?auto_634917 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_634919 ?auto_634920 ) ( IN-CITY ?auto_634910 ?auto_634920 ) ( not ( = ?auto_634910 ?auto_634919 ) ) ( OBJ-AT ?auto_634916 ?auto_634919 ) ( IN-CITY ?auto_634921 ?auto_634920 ) ( not ( = ?auto_634910 ?auto_634921 ) ) ( OBJ-AT ?auto_634914 ?auto_634921 ) ( IN-CITY ?auto_634918 ?auto_634920 ) ( not ( = ?auto_634910 ?auto_634918 ) ) ( OBJ-AT ?auto_634913 ?auto_634918 ) ( IN-CITY ?auto_634922 ?auto_634920 ) ( not ( = ?auto_634910 ?auto_634922 ) ) ( OBJ-AT ?auto_634911 ?auto_634922 ) ( OBJ-AT ?auto_634915 ?auto_634919 ) ( OBJ-AT ?auto_634912 ?auto_634918 ) ( TRUCK-AT ?auto_634917 ?auto_634910 ) ( not ( = ?auto_634912 ?auto_634915 ) ) ( not ( = ?auto_634919 ?auto_634918 ) ) ( not ( = ?auto_634912 ?auto_634911 ) ) ( not ( = ?auto_634915 ?auto_634911 ) ) ( not ( = ?auto_634922 ?auto_634919 ) ) ( not ( = ?auto_634922 ?auto_634918 ) ) ( not ( = ?auto_634912 ?auto_634913 ) ) ( not ( = ?auto_634915 ?auto_634913 ) ) ( not ( = ?auto_634911 ?auto_634913 ) ) ( not ( = ?auto_634912 ?auto_634914 ) ) ( not ( = ?auto_634915 ?auto_634914 ) ) ( not ( = ?auto_634911 ?auto_634914 ) ) ( not ( = ?auto_634913 ?auto_634914 ) ) ( not ( = ?auto_634921 ?auto_634918 ) ) ( not ( = ?auto_634921 ?auto_634922 ) ) ( not ( = ?auto_634921 ?auto_634919 ) ) ( not ( = ?auto_634912 ?auto_634916 ) ) ( not ( = ?auto_634915 ?auto_634916 ) ) ( not ( = ?auto_634911 ?auto_634916 ) ) ( not ( = ?auto_634913 ?auto_634916 ) ) ( not ( = ?auto_634914 ?auto_634916 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_634912 ?auto_634915 ?auto_634911 ?auto_634913 ?auto_634916 ?auto_634914 ?auto_634910 )
      ( DELIVER-6PKG-VERIFY ?auto_634911 ?auto_634912 ?auto_634913 ?auto_634914 ?auto_634915 ?auto_634916 ?auto_634910 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_635752 - OBJ
      ?auto_635753 - OBJ
      ?auto_635754 - OBJ
      ?auto_635755 - OBJ
      ?auto_635756 - OBJ
      ?auto_635757 - OBJ
      ?auto_635751 - LOCATION
    )
    :vars
    (
      ?auto_635760 - LOCATION
      ?auto_635761 - CITY
      ?auto_635762 - LOCATION
      ?auto_635759 - LOCATION
      ?auto_635763 - LOCATION
      ?auto_635758 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_635760 ?auto_635761 ) ( IN-CITY ?auto_635751 ?auto_635761 ) ( not ( = ?auto_635751 ?auto_635760 ) ) ( OBJ-AT ?auto_635757 ?auto_635760 ) ( IN-CITY ?auto_635762 ?auto_635761 ) ( not ( = ?auto_635751 ?auto_635762 ) ) ( OBJ-AT ?auto_635754 ?auto_635762 ) ( IN-CITY ?auto_635759 ?auto_635761 ) ( not ( = ?auto_635751 ?auto_635759 ) ) ( OBJ-AT ?auto_635756 ?auto_635759 ) ( IN-CITY ?auto_635763 ?auto_635761 ) ( not ( = ?auto_635751 ?auto_635763 ) ) ( OBJ-AT ?auto_635752 ?auto_635763 ) ( OBJ-AT ?auto_635755 ?auto_635760 ) ( OBJ-AT ?auto_635753 ?auto_635759 ) ( TRUCK-AT ?auto_635758 ?auto_635751 ) ( not ( = ?auto_635753 ?auto_635755 ) ) ( not ( = ?auto_635760 ?auto_635759 ) ) ( not ( = ?auto_635753 ?auto_635752 ) ) ( not ( = ?auto_635755 ?auto_635752 ) ) ( not ( = ?auto_635763 ?auto_635760 ) ) ( not ( = ?auto_635763 ?auto_635759 ) ) ( not ( = ?auto_635753 ?auto_635756 ) ) ( not ( = ?auto_635755 ?auto_635756 ) ) ( not ( = ?auto_635752 ?auto_635756 ) ) ( not ( = ?auto_635753 ?auto_635754 ) ) ( not ( = ?auto_635755 ?auto_635754 ) ) ( not ( = ?auto_635752 ?auto_635754 ) ) ( not ( = ?auto_635756 ?auto_635754 ) ) ( not ( = ?auto_635762 ?auto_635759 ) ) ( not ( = ?auto_635762 ?auto_635763 ) ) ( not ( = ?auto_635762 ?auto_635760 ) ) ( not ( = ?auto_635753 ?auto_635757 ) ) ( not ( = ?auto_635755 ?auto_635757 ) ) ( not ( = ?auto_635752 ?auto_635757 ) ) ( not ( = ?auto_635756 ?auto_635757 ) ) ( not ( = ?auto_635754 ?auto_635757 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_635753 ?auto_635755 ?auto_635752 ?auto_635756 ?auto_635757 ?auto_635754 ?auto_635751 )
      ( DELIVER-6PKG-VERIFY ?auto_635752 ?auto_635753 ?auto_635754 ?auto_635755 ?auto_635756 ?auto_635757 ?auto_635751 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_635821 - OBJ
      ?auto_635822 - OBJ
      ?auto_635823 - OBJ
      ?auto_635824 - OBJ
      ?auto_635825 - OBJ
      ?auto_635826 - OBJ
      ?auto_635820 - LOCATION
    )
    :vars
    (
      ?auto_635829 - LOCATION
      ?auto_635830 - CITY
      ?auto_635831 - LOCATION
      ?auto_635828 - LOCATION
      ?auto_635832 - LOCATION
      ?auto_635827 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_635829 ?auto_635830 ) ( IN-CITY ?auto_635820 ?auto_635830 ) ( not ( = ?auto_635820 ?auto_635829 ) ) ( OBJ-AT ?auto_635825 ?auto_635829 ) ( IN-CITY ?auto_635831 ?auto_635830 ) ( not ( = ?auto_635820 ?auto_635831 ) ) ( OBJ-AT ?auto_635823 ?auto_635831 ) ( IN-CITY ?auto_635828 ?auto_635830 ) ( not ( = ?auto_635820 ?auto_635828 ) ) ( OBJ-AT ?auto_635826 ?auto_635828 ) ( IN-CITY ?auto_635832 ?auto_635830 ) ( not ( = ?auto_635820 ?auto_635832 ) ) ( OBJ-AT ?auto_635821 ?auto_635832 ) ( OBJ-AT ?auto_635824 ?auto_635829 ) ( OBJ-AT ?auto_635822 ?auto_635828 ) ( TRUCK-AT ?auto_635827 ?auto_635820 ) ( not ( = ?auto_635822 ?auto_635824 ) ) ( not ( = ?auto_635829 ?auto_635828 ) ) ( not ( = ?auto_635822 ?auto_635821 ) ) ( not ( = ?auto_635824 ?auto_635821 ) ) ( not ( = ?auto_635832 ?auto_635829 ) ) ( not ( = ?auto_635832 ?auto_635828 ) ) ( not ( = ?auto_635822 ?auto_635826 ) ) ( not ( = ?auto_635824 ?auto_635826 ) ) ( not ( = ?auto_635821 ?auto_635826 ) ) ( not ( = ?auto_635822 ?auto_635823 ) ) ( not ( = ?auto_635824 ?auto_635823 ) ) ( not ( = ?auto_635821 ?auto_635823 ) ) ( not ( = ?auto_635826 ?auto_635823 ) ) ( not ( = ?auto_635831 ?auto_635828 ) ) ( not ( = ?auto_635831 ?auto_635832 ) ) ( not ( = ?auto_635831 ?auto_635829 ) ) ( not ( = ?auto_635822 ?auto_635825 ) ) ( not ( = ?auto_635824 ?auto_635825 ) ) ( not ( = ?auto_635821 ?auto_635825 ) ) ( not ( = ?auto_635826 ?auto_635825 ) ) ( not ( = ?auto_635823 ?auto_635825 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_635822 ?auto_635824 ?auto_635821 ?auto_635826 ?auto_635825 ?auto_635823 ?auto_635820 )
      ( DELIVER-6PKG-VERIFY ?auto_635821 ?auto_635822 ?auto_635823 ?auto_635824 ?auto_635825 ?auto_635826 ?auto_635820 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_636037 - OBJ
      ?auto_636038 - OBJ
      ?auto_636039 - OBJ
      ?auto_636040 - OBJ
      ?auto_636041 - OBJ
      ?auto_636042 - OBJ
      ?auto_636036 - LOCATION
    )
    :vars
    (
      ?auto_636045 - LOCATION
      ?auto_636046 - CITY
      ?auto_636047 - LOCATION
      ?auto_636044 - LOCATION
      ?auto_636048 - LOCATION
      ?auto_636043 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_636045 ?auto_636046 ) ( IN-CITY ?auto_636036 ?auto_636046 ) ( not ( = ?auto_636036 ?auto_636045 ) ) ( OBJ-AT ?auto_636042 ?auto_636045 ) ( IN-CITY ?auto_636047 ?auto_636046 ) ( not ( = ?auto_636036 ?auto_636047 ) ) ( OBJ-AT ?auto_636039 ?auto_636047 ) ( IN-CITY ?auto_636044 ?auto_636046 ) ( not ( = ?auto_636036 ?auto_636044 ) ) ( OBJ-AT ?auto_636040 ?auto_636044 ) ( IN-CITY ?auto_636048 ?auto_636046 ) ( not ( = ?auto_636036 ?auto_636048 ) ) ( OBJ-AT ?auto_636037 ?auto_636048 ) ( OBJ-AT ?auto_636041 ?auto_636045 ) ( OBJ-AT ?auto_636038 ?auto_636044 ) ( TRUCK-AT ?auto_636043 ?auto_636036 ) ( not ( = ?auto_636038 ?auto_636041 ) ) ( not ( = ?auto_636045 ?auto_636044 ) ) ( not ( = ?auto_636038 ?auto_636037 ) ) ( not ( = ?auto_636041 ?auto_636037 ) ) ( not ( = ?auto_636048 ?auto_636045 ) ) ( not ( = ?auto_636048 ?auto_636044 ) ) ( not ( = ?auto_636038 ?auto_636040 ) ) ( not ( = ?auto_636041 ?auto_636040 ) ) ( not ( = ?auto_636037 ?auto_636040 ) ) ( not ( = ?auto_636038 ?auto_636039 ) ) ( not ( = ?auto_636041 ?auto_636039 ) ) ( not ( = ?auto_636037 ?auto_636039 ) ) ( not ( = ?auto_636040 ?auto_636039 ) ) ( not ( = ?auto_636047 ?auto_636044 ) ) ( not ( = ?auto_636047 ?auto_636048 ) ) ( not ( = ?auto_636047 ?auto_636045 ) ) ( not ( = ?auto_636038 ?auto_636042 ) ) ( not ( = ?auto_636041 ?auto_636042 ) ) ( not ( = ?auto_636037 ?auto_636042 ) ) ( not ( = ?auto_636040 ?auto_636042 ) ) ( not ( = ?auto_636039 ?auto_636042 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_636038 ?auto_636041 ?auto_636037 ?auto_636040 ?auto_636042 ?auto_636039 ?auto_636036 )
      ( DELIVER-6PKG-VERIFY ?auto_636037 ?auto_636038 ?auto_636039 ?auto_636040 ?auto_636041 ?auto_636042 ?auto_636036 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_669757 - OBJ
      ?auto_669758 - OBJ
      ?auto_669759 - OBJ
      ?auto_669760 - OBJ
      ?auto_669761 - OBJ
      ?auto_669762 - OBJ
      ?auto_669756 - LOCATION
    )
    :vars
    (
      ?auto_669765 - LOCATION
      ?auto_669766 - CITY
      ?auto_669767 - LOCATION
      ?auto_669764 - LOCATION
      ?auto_669768 - LOCATION
      ?auto_669763 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_669765 ?auto_669766 ) ( IN-CITY ?auto_669756 ?auto_669766 ) ( not ( = ?auto_669756 ?auto_669765 ) ) ( OBJ-AT ?auto_669762 ?auto_669765 ) ( IN-CITY ?auto_669767 ?auto_669766 ) ( not ( = ?auto_669756 ?auto_669767 ) ) ( OBJ-AT ?auto_669758 ?auto_669767 ) ( IN-CITY ?auto_669764 ?auto_669766 ) ( not ( = ?auto_669756 ?auto_669764 ) ) ( OBJ-AT ?auto_669761 ?auto_669764 ) ( IN-CITY ?auto_669768 ?auto_669766 ) ( not ( = ?auto_669756 ?auto_669768 ) ) ( OBJ-AT ?auto_669757 ?auto_669768 ) ( OBJ-AT ?auto_669760 ?auto_669765 ) ( OBJ-AT ?auto_669759 ?auto_669764 ) ( TRUCK-AT ?auto_669763 ?auto_669756 ) ( not ( = ?auto_669759 ?auto_669760 ) ) ( not ( = ?auto_669765 ?auto_669764 ) ) ( not ( = ?auto_669759 ?auto_669757 ) ) ( not ( = ?auto_669760 ?auto_669757 ) ) ( not ( = ?auto_669768 ?auto_669765 ) ) ( not ( = ?auto_669768 ?auto_669764 ) ) ( not ( = ?auto_669759 ?auto_669761 ) ) ( not ( = ?auto_669760 ?auto_669761 ) ) ( not ( = ?auto_669757 ?auto_669761 ) ) ( not ( = ?auto_669759 ?auto_669758 ) ) ( not ( = ?auto_669760 ?auto_669758 ) ) ( not ( = ?auto_669757 ?auto_669758 ) ) ( not ( = ?auto_669761 ?auto_669758 ) ) ( not ( = ?auto_669767 ?auto_669764 ) ) ( not ( = ?auto_669767 ?auto_669768 ) ) ( not ( = ?auto_669767 ?auto_669765 ) ) ( not ( = ?auto_669759 ?auto_669762 ) ) ( not ( = ?auto_669760 ?auto_669762 ) ) ( not ( = ?auto_669757 ?auto_669762 ) ) ( not ( = ?auto_669761 ?auto_669762 ) ) ( not ( = ?auto_669758 ?auto_669762 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_669759 ?auto_669760 ?auto_669757 ?auto_669761 ?auto_669762 ?auto_669758 ?auto_669756 )
      ( DELIVER-6PKG-VERIFY ?auto_669757 ?auto_669758 ?auto_669759 ?auto_669760 ?auto_669761 ?auto_669762 ?auto_669756 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_669826 - OBJ
      ?auto_669827 - OBJ
      ?auto_669828 - OBJ
      ?auto_669829 - OBJ
      ?auto_669830 - OBJ
      ?auto_669831 - OBJ
      ?auto_669825 - LOCATION
    )
    :vars
    (
      ?auto_669834 - LOCATION
      ?auto_669835 - CITY
      ?auto_669836 - LOCATION
      ?auto_669833 - LOCATION
      ?auto_669837 - LOCATION
      ?auto_669832 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_669834 ?auto_669835 ) ( IN-CITY ?auto_669825 ?auto_669835 ) ( not ( = ?auto_669825 ?auto_669834 ) ) ( OBJ-AT ?auto_669830 ?auto_669834 ) ( IN-CITY ?auto_669836 ?auto_669835 ) ( not ( = ?auto_669825 ?auto_669836 ) ) ( OBJ-AT ?auto_669827 ?auto_669836 ) ( IN-CITY ?auto_669833 ?auto_669835 ) ( not ( = ?auto_669825 ?auto_669833 ) ) ( OBJ-AT ?auto_669831 ?auto_669833 ) ( IN-CITY ?auto_669837 ?auto_669835 ) ( not ( = ?auto_669825 ?auto_669837 ) ) ( OBJ-AT ?auto_669826 ?auto_669837 ) ( OBJ-AT ?auto_669829 ?auto_669834 ) ( OBJ-AT ?auto_669828 ?auto_669833 ) ( TRUCK-AT ?auto_669832 ?auto_669825 ) ( not ( = ?auto_669828 ?auto_669829 ) ) ( not ( = ?auto_669834 ?auto_669833 ) ) ( not ( = ?auto_669828 ?auto_669826 ) ) ( not ( = ?auto_669829 ?auto_669826 ) ) ( not ( = ?auto_669837 ?auto_669834 ) ) ( not ( = ?auto_669837 ?auto_669833 ) ) ( not ( = ?auto_669828 ?auto_669831 ) ) ( not ( = ?auto_669829 ?auto_669831 ) ) ( not ( = ?auto_669826 ?auto_669831 ) ) ( not ( = ?auto_669828 ?auto_669827 ) ) ( not ( = ?auto_669829 ?auto_669827 ) ) ( not ( = ?auto_669826 ?auto_669827 ) ) ( not ( = ?auto_669831 ?auto_669827 ) ) ( not ( = ?auto_669836 ?auto_669833 ) ) ( not ( = ?auto_669836 ?auto_669837 ) ) ( not ( = ?auto_669836 ?auto_669834 ) ) ( not ( = ?auto_669828 ?auto_669830 ) ) ( not ( = ?auto_669829 ?auto_669830 ) ) ( not ( = ?auto_669826 ?auto_669830 ) ) ( not ( = ?auto_669831 ?auto_669830 ) ) ( not ( = ?auto_669827 ?auto_669830 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_669828 ?auto_669829 ?auto_669826 ?auto_669831 ?auto_669830 ?auto_669827 ?auto_669825 )
      ( DELIVER-6PKG-VERIFY ?auto_669826 ?auto_669827 ?auto_669828 ?auto_669829 ?auto_669830 ?auto_669831 ?auto_669825 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_670042 - OBJ
      ?auto_670043 - OBJ
      ?auto_670044 - OBJ
      ?auto_670045 - OBJ
      ?auto_670046 - OBJ
      ?auto_670047 - OBJ
      ?auto_670041 - LOCATION
    )
    :vars
    (
      ?auto_670050 - LOCATION
      ?auto_670051 - CITY
      ?auto_670052 - LOCATION
      ?auto_670049 - LOCATION
      ?auto_670053 - LOCATION
      ?auto_670048 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_670050 ?auto_670051 ) ( IN-CITY ?auto_670041 ?auto_670051 ) ( not ( = ?auto_670041 ?auto_670050 ) ) ( OBJ-AT ?auto_670047 ?auto_670050 ) ( IN-CITY ?auto_670052 ?auto_670051 ) ( not ( = ?auto_670041 ?auto_670052 ) ) ( OBJ-AT ?auto_670043 ?auto_670052 ) ( IN-CITY ?auto_670049 ?auto_670051 ) ( not ( = ?auto_670041 ?auto_670049 ) ) ( OBJ-AT ?auto_670045 ?auto_670049 ) ( IN-CITY ?auto_670053 ?auto_670051 ) ( not ( = ?auto_670041 ?auto_670053 ) ) ( OBJ-AT ?auto_670042 ?auto_670053 ) ( OBJ-AT ?auto_670046 ?auto_670050 ) ( OBJ-AT ?auto_670044 ?auto_670049 ) ( TRUCK-AT ?auto_670048 ?auto_670041 ) ( not ( = ?auto_670044 ?auto_670046 ) ) ( not ( = ?auto_670050 ?auto_670049 ) ) ( not ( = ?auto_670044 ?auto_670042 ) ) ( not ( = ?auto_670046 ?auto_670042 ) ) ( not ( = ?auto_670053 ?auto_670050 ) ) ( not ( = ?auto_670053 ?auto_670049 ) ) ( not ( = ?auto_670044 ?auto_670045 ) ) ( not ( = ?auto_670046 ?auto_670045 ) ) ( not ( = ?auto_670042 ?auto_670045 ) ) ( not ( = ?auto_670044 ?auto_670043 ) ) ( not ( = ?auto_670046 ?auto_670043 ) ) ( not ( = ?auto_670042 ?auto_670043 ) ) ( not ( = ?auto_670045 ?auto_670043 ) ) ( not ( = ?auto_670052 ?auto_670049 ) ) ( not ( = ?auto_670052 ?auto_670053 ) ) ( not ( = ?auto_670052 ?auto_670050 ) ) ( not ( = ?auto_670044 ?auto_670047 ) ) ( not ( = ?auto_670046 ?auto_670047 ) ) ( not ( = ?auto_670042 ?auto_670047 ) ) ( not ( = ?auto_670045 ?auto_670047 ) ) ( not ( = ?auto_670043 ?auto_670047 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_670044 ?auto_670046 ?auto_670042 ?auto_670045 ?auto_670047 ?auto_670043 ?auto_670041 )
      ( DELIVER-6PKG-VERIFY ?auto_670042 ?auto_670043 ?auto_670044 ?auto_670045 ?auto_670046 ?auto_670047 ?auto_670041 ) )
  )

)

