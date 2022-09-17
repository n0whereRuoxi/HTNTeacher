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
      ?auto_144557 - OBJ
      ?auto_144556 - LOCATION
    )
    :vars
    (
      ?auto_144559 - LOCATION
      ?auto_144560 - CITY
      ?auto_144558 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144559 ?auto_144560 ) ( IN-CITY ?auto_144556 ?auto_144560 ) ( not ( = ?auto_144556 ?auto_144559 ) ) ( OBJ-AT ?auto_144557 ?auto_144559 ) ( TRUCK-AT ?auto_144558 ?auto_144556 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_144558 ?auto_144556 ?auto_144559 ?auto_144560 )
      ( !LOAD-TRUCK ?auto_144557 ?auto_144558 ?auto_144559 )
      ( !DRIVE-TRUCK ?auto_144558 ?auto_144559 ?auto_144556 ?auto_144560 )
      ( !UNLOAD-TRUCK ?auto_144557 ?auto_144558 ?auto_144556 )
      ( DELIVER-1PKG-VERIFY ?auto_144557 ?auto_144556 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_144578 - OBJ
      ?auto_144579 - OBJ
      ?auto_144577 - LOCATION
    )
    :vars
    (
      ?auto_144580 - LOCATION
      ?auto_144582 - CITY
      ?auto_144583 - LOCATION
      ?auto_144581 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144580 ?auto_144582 ) ( IN-CITY ?auto_144577 ?auto_144582 ) ( not ( = ?auto_144577 ?auto_144580 ) ) ( OBJ-AT ?auto_144579 ?auto_144580 ) ( IN-CITY ?auto_144583 ?auto_144582 ) ( not ( = ?auto_144577 ?auto_144583 ) ) ( OBJ-AT ?auto_144578 ?auto_144583 ) ( TRUCK-AT ?auto_144581 ?auto_144577 ) ( not ( = ?auto_144578 ?auto_144579 ) ) ( not ( = ?auto_144580 ?auto_144583 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_144578 ?auto_144577 )
      ( DELIVER-1PKG ?auto_144579 ?auto_144577 )
      ( DELIVER-2PKG-VERIFY ?auto_144578 ?auto_144579 ?auto_144577 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_144689 - OBJ
      ?auto_144690 - OBJ
      ?auto_144691 - OBJ
      ?auto_144688 - LOCATION
    )
    :vars
    (
      ?auto_144694 - LOCATION
      ?auto_144692 - CITY
      ?auto_144696 - LOCATION
      ?auto_144695 - LOCATION
      ?auto_144693 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144694 ?auto_144692 ) ( IN-CITY ?auto_144688 ?auto_144692 ) ( not ( = ?auto_144688 ?auto_144694 ) ) ( OBJ-AT ?auto_144691 ?auto_144694 ) ( IN-CITY ?auto_144696 ?auto_144692 ) ( not ( = ?auto_144688 ?auto_144696 ) ) ( OBJ-AT ?auto_144690 ?auto_144696 ) ( IN-CITY ?auto_144695 ?auto_144692 ) ( not ( = ?auto_144688 ?auto_144695 ) ) ( OBJ-AT ?auto_144689 ?auto_144695 ) ( TRUCK-AT ?auto_144693 ?auto_144688 ) ( not ( = ?auto_144689 ?auto_144690 ) ) ( not ( = ?auto_144696 ?auto_144695 ) ) ( not ( = ?auto_144689 ?auto_144691 ) ) ( not ( = ?auto_144690 ?auto_144691 ) ) ( not ( = ?auto_144694 ?auto_144696 ) ) ( not ( = ?auto_144694 ?auto_144695 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_144689 ?auto_144690 ?auto_144688 )
      ( DELIVER-1PKG ?auto_144691 ?auto_144688 )
      ( DELIVER-3PKG-VERIFY ?auto_144689 ?auto_144690 ?auto_144691 ?auto_144688 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_145832 - OBJ
      ?auto_145833 - OBJ
      ?auto_145834 - OBJ
      ?auto_145835 - OBJ
      ?auto_145831 - LOCATION
    )
    :vars
    (
      ?auto_145837 - LOCATION
      ?auto_145836 - CITY
      ?auto_145840 - LOCATION
      ?auto_145841 - LOCATION
      ?auto_145839 - LOCATION
      ?auto_145838 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_145837 ?auto_145836 ) ( IN-CITY ?auto_145831 ?auto_145836 ) ( not ( = ?auto_145831 ?auto_145837 ) ) ( OBJ-AT ?auto_145835 ?auto_145837 ) ( IN-CITY ?auto_145840 ?auto_145836 ) ( not ( = ?auto_145831 ?auto_145840 ) ) ( OBJ-AT ?auto_145834 ?auto_145840 ) ( IN-CITY ?auto_145841 ?auto_145836 ) ( not ( = ?auto_145831 ?auto_145841 ) ) ( OBJ-AT ?auto_145833 ?auto_145841 ) ( IN-CITY ?auto_145839 ?auto_145836 ) ( not ( = ?auto_145831 ?auto_145839 ) ) ( OBJ-AT ?auto_145832 ?auto_145839 ) ( TRUCK-AT ?auto_145838 ?auto_145831 ) ( not ( = ?auto_145832 ?auto_145833 ) ) ( not ( = ?auto_145841 ?auto_145839 ) ) ( not ( = ?auto_145832 ?auto_145834 ) ) ( not ( = ?auto_145833 ?auto_145834 ) ) ( not ( = ?auto_145840 ?auto_145841 ) ) ( not ( = ?auto_145840 ?auto_145839 ) ) ( not ( = ?auto_145832 ?auto_145835 ) ) ( not ( = ?auto_145833 ?auto_145835 ) ) ( not ( = ?auto_145834 ?auto_145835 ) ) ( not ( = ?auto_145837 ?auto_145840 ) ) ( not ( = ?auto_145837 ?auto_145841 ) ) ( not ( = ?auto_145837 ?auto_145839 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_145832 ?auto_145833 ?auto_145834 ?auto_145831 )
      ( DELIVER-1PKG ?auto_145835 ?auto_145831 )
      ( DELIVER-4PKG-VERIFY ?auto_145832 ?auto_145833 ?auto_145834 ?auto_145835 ?auto_145831 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_161442 - OBJ
      ?auto_161443 - OBJ
      ?auto_161444 - OBJ
      ?auto_161445 - OBJ
      ?auto_161446 - OBJ
      ?auto_161441 - LOCATION
    )
    :vars
    (
      ?auto_161448 - LOCATION
      ?auto_161449 - CITY
      ?auto_161452 - LOCATION
      ?auto_161450 - LOCATION
      ?auto_161451 - LOCATION
      ?auto_161447 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_161448 ?auto_161449 ) ( IN-CITY ?auto_161441 ?auto_161449 ) ( not ( = ?auto_161441 ?auto_161448 ) ) ( OBJ-AT ?auto_161446 ?auto_161448 ) ( IN-CITY ?auto_161452 ?auto_161449 ) ( not ( = ?auto_161441 ?auto_161452 ) ) ( OBJ-AT ?auto_161445 ?auto_161452 ) ( IN-CITY ?auto_161450 ?auto_161449 ) ( not ( = ?auto_161441 ?auto_161450 ) ) ( OBJ-AT ?auto_161444 ?auto_161450 ) ( OBJ-AT ?auto_161443 ?auto_161448 ) ( IN-CITY ?auto_161451 ?auto_161449 ) ( not ( = ?auto_161441 ?auto_161451 ) ) ( OBJ-AT ?auto_161442 ?auto_161451 ) ( TRUCK-AT ?auto_161447 ?auto_161441 ) ( not ( = ?auto_161442 ?auto_161443 ) ) ( not ( = ?auto_161448 ?auto_161451 ) ) ( not ( = ?auto_161442 ?auto_161444 ) ) ( not ( = ?auto_161443 ?auto_161444 ) ) ( not ( = ?auto_161450 ?auto_161448 ) ) ( not ( = ?auto_161450 ?auto_161451 ) ) ( not ( = ?auto_161442 ?auto_161445 ) ) ( not ( = ?auto_161443 ?auto_161445 ) ) ( not ( = ?auto_161444 ?auto_161445 ) ) ( not ( = ?auto_161452 ?auto_161450 ) ) ( not ( = ?auto_161452 ?auto_161448 ) ) ( not ( = ?auto_161452 ?auto_161451 ) ) ( not ( = ?auto_161442 ?auto_161446 ) ) ( not ( = ?auto_161443 ?auto_161446 ) ) ( not ( = ?auto_161444 ?auto_161446 ) ) ( not ( = ?auto_161445 ?auto_161446 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_161442 ?auto_161443 ?auto_161444 ?auto_161445 ?auto_161441 )
      ( DELIVER-1PKG ?auto_161446 ?auto_161441 )
      ( DELIVER-5PKG-VERIFY ?auto_161442 ?auto_161443 ?auto_161444 ?auto_161445 ?auto_161446 ?auto_161441 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_161493 - OBJ
      ?auto_161494 - OBJ
      ?auto_161495 - OBJ
      ?auto_161496 - OBJ
      ?auto_161497 - OBJ
      ?auto_161492 - LOCATION
    )
    :vars
    (
      ?auto_161500 - LOCATION
      ?auto_161498 - CITY
      ?auto_161499 - LOCATION
      ?auto_161502 - LOCATION
      ?auto_161503 - LOCATION
      ?auto_161501 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_161500 ?auto_161498 ) ( IN-CITY ?auto_161492 ?auto_161498 ) ( not ( = ?auto_161492 ?auto_161500 ) ) ( OBJ-AT ?auto_161496 ?auto_161500 ) ( IN-CITY ?auto_161499 ?auto_161498 ) ( not ( = ?auto_161492 ?auto_161499 ) ) ( OBJ-AT ?auto_161497 ?auto_161499 ) ( IN-CITY ?auto_161502 ?auto_161498 ) ( not ( = ?auto_161492 ?auto_161502 ) ) ( OBJ-AT ?auto_161495 ?auto_161502 ) ( OBJ-AT ?auto_161494 ?auto_161500 ) ( IN-CITY ?auto_161503 ?auto_161498 ) ( not ( = ?auto_161492 ?auto_161503 ) ) ( OBJ-AT ?auto_161493 ?auto_161503 ) ( TRUCK-AT ?auto_161501 ?auto_161492 ) ( not ( = ?auto_161493 ?auto_161494 ) ) ( not ( = ?auto_161500 ?auto_161503 ) ) ( not ( = ?auto_161493 ?auto_161495 ) ) ( not ( = ?auto_161494 ?auto_161495 ) ) ( not ( = ?auto_161502 ?auto_161500 ) ) ( not ( = ?auto_161502 ?auto_161503 ) ) ( not ( = ?auto_161493 ?auto_161497 ) ) ( not ( = ?auto_161494 ?auto_161497 ) ) ( not ( = ?auto_161495 ?auto_161497 ) ) ( not ( = ?auto_161499 ?auto_161502 ) ) ( not ( = ?auto_161499 ?auto_161500 ) ) ( not ( = ?auto_161499 ?auto_161503 ) ) ( not ( = ?auto_161493 ?auto_161496 ) ) ( not ( = ?auto_161494 ?auto_161496 ) ) ( not ( = ?auto_161495 ?auto_161496 ) ) ( not ( = ?auto_161497 ?auto_161496 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_161493 ?auto_161494 ?auto_161495 ?auto_161497 ?auto_161496 ?auto_161492 )
      ( DELIVER-5PKG-VERIFY ?auto_161493 ?auto_161494 ?auto_161495 ?auto_161496 ?auto_161497 ?auto_161492 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_161796 - OBJ
      ?auto_161797 - OBJ
      ?auto_161798 - OBJ
      ?auto_161799 - OBJ
      ?auto_161800 - OBJ
      ?auto_161795 - LOCATION
    )
    :vars
    (
      ?auto_161801 - LOCATION
      ?auto_161802 - CITY
      ?auto_161806 - LOCATION
      ?auto_161804 - LOCATION
      ?auto_161803 - LOCATION
      ?auto_161805 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_161801 ?auto_161802 ) ( IN-CITY ?auto_161795 ?auto_161802 ) ( not ( = ?auto_161795 ?auto_161801 ) ) ( OBJ-AT ?auto_161798 ?auto_161801 ) ( IN-CITY ?auto_161806 ?auto_161802 ) ( not ( = ?auto_161795 ?auto_161806 ) ) ( OBJ-AT ?auto_161800 ?auto_161806 ) ( IN-CITY ?auto_161804 ?auto_161802 ) ( not ( = ?auto_161795 ?auto_161804 ) ) ( OBJ-AT ?auto_161799 ?auto_161804 ) ( OBJ-AT ?auto_161797 ?auto_161801 ) ( IN-CITY ?auto_161803 ?auto_161802 ) ( not ( = ?auto_161795 ?auto_161803 ) ) ( OBJ-AT ?auto_161796 ?auto_161803 ) ( TRUCK-AT ?auto_161805 ?auto_161795 ) ( not ( = ?auto_161796 ?auto_161797 ) ) ( not ( = ?auto_161801 ?auto_161803 ) ) ( not ( = ?auto_161796 ?auto_161799 ) ) ( not ( = ?auto_161797 ?auto_161799 ) ) ( not ( = ?auto_161804 ?auto_161801 ) ) ( not ( = ?auto_161804 ?auto_161803 ) ) ( not ( = ?auto_161796 ?auto_161800 ) ) ( not ( = ?auto_161797 ?auto_161800 ) ) ( not ( = ?auto_161799 ?auto_161800 ) ) ( not ( = ?auto_161806 ?auto_161804 ) ) ( not ( = ?auto_161806 ?auto_161801 ) ) ( not ( = ?auto_161806 ?auto_161803 ) ) ( not ( = ?auto_161796 ?auto_161798 ) ) ( not ( = ?auto_161797 ?auto_161798 ) ) ( not ( = ?auto_161799 ?auto_161798 ) ) ( not ( = ?auto_161800 ?auto_161798 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_161796 ?auto_161797 ?auto_161799 ?auto_161798 ?auto_161800 ?auto_161795 )
      ( DELIVER-5PKG-VERIFY ?auto_161796 ?auto_161797 ?auto_161798 ?auto_161799 ?auto_161800 ?auto_161795 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_162108 - OBJ
      ?auto_162109 - OBJ
      ?auto_162110 - OBJ
      ?auto_162111 - OBJ
      ?auto_162112 - OBJ
      ?auto_162107 - LOCATION
    )
    :vars
    (
      ?auto_162113 - LOCATION
      ?auto_162114 - CITY
      ?auto_162118 - LOCATION
      ?auto_162116 - LOCATION
      ?auto_162115 - LOCATION
      ?auto_162117 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_162113 ?auto_162114 ) ( IN-CITY ?auto_162107 ?auto_162114 ) ( not ( = ?auto_162107 ?auto_162113 ) ) ( OBJ-AT ?auto_162112 ?auto_162113 ) ( IN-CITY ?auto_162118 ?auto_162114 ) ( not ( = ?auto_162107 ?auto_162118 ) ) ( OBJ-AT ?auto_162111 ?auto_162118 ) ( IN-CITY ?auto_162116 ?auto_162114 ) ( not ( = ?auto_162107 ?auto_162116 ) ) ( OBJ-AT ?auto_162109 ?auto_162116 ) ( OBJ-AT ?auto_162110 ?auto_162113 ) ( IN-CITY ?auto_162115 ?auto_162114 ) ( not ( = ?auto_162107 ?auto_162115 ) ) ( OBJ-AT ?auto_162108 ?auto_162115 ) ( TRUCK-AT ?auto_162117 ?auto_162107 ) ( not ( = ?auto_162108 ?auto_162110 ) ) ( not ( = ?auto_162113 ?auto_162115 ) ) ( not ( = ?auto_162108 ?auto_162109 ) ) ( not ( = ?auto_162110 ?auto_162109 ) ) ( not ( = ?auto_162116 ?auto_162113 ) ) ( not ( = ?auto_162116 ?auto_162115 ) ) ( not ( = ?auto_162108 ?auto_162111 ) ) ( not ( = ?auto_162110 ?auto_162111 ) ) ( not ( = ?auto_162109 ?auto_162111 ) ) ( not ( = ?auto_162118 ?auto_162116 ) ) ( not ( = ?auto_162118 ?auto_162113 ) ) ( not ( = ?auto_162118 ?auto_162115 ) ) ( not ( = ?auto_162108 ?auto_162112 ) ) ( not ( = ?auto_162110 ?auto_162112 ) ) ( not ( = ?auto_162109 ?auto_162112 ) ) ( not ( = ?auto_162111 ?auto_162112 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_162108 ?auto_162110 ?auto_162109 ?auto_162112 ?auto_162111 ?auto_162107 )
      ( DELIVER-5PKG-VERIFY ?auto_162108 ?auto_162109 ?auto_162110 ?auto_162111 ?auto_162112 ?auto_162107 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_162159 - OBJ
      ?auto_162160 - OBJ
      ?auto_162161 - OBJ
      ?auto_162162 - OBJ
      ?auto_162163 - OBJ
      ?auto_162158 - LOCATION
    )
    :vars
    (
      ?auto_162164 - LOCATION
      ?auto_162165 - CITY
      ?auto_162169 - LOCATION
      ?auto_162167 - LOCATION
      ?auto_162166 - LOCATION
      ?auto_162168 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_162164 ?auto_162165 ) ( IN-CITY ?auto_162158 ?auto_162165 ) ( not ( = ?auto_162158 ?auto_162164 ) ) ( OBJ-AT ?auto_162162 ?auto_162164 ) ( IN-CITY ?auto_162169 ?auto_162165 ) ( not ( = ?auto_162158 ?auto_162169 ) ) ( OBJ-AT ?auto_162163 ?auto_162169 ) ( IN-CITY ?auto_162167 ?auto_162165 ) ( not ( = ?auto_162158 ?auto_162167 ) ) ( OBJ-AT ?auto_162160 ?auto_162167 ) ( OBJ-AT ?auto_162161 ?auto_162164 ) ( IN-CITY ?auto_162166 ?auto_162165 ) ( not ( = ?auto_162158 ?auto_162166 ) ) ( OBJ-AT ?auto_162159 ?auto_162166 ) ( TRUCK-AT ?auto_162168 ?auto_162158 ) ( not ( = ?auto_162159 ?auto_162161 ) ) ( not ( = ?auto_162164 ?auto_162166 ) ) ( not ( = ?auto_162159 ?auto_162160 ) ) ( not ( = ?auto_162161 ?auto_162160 ) ) ( not ( = ?auto_162167 ?auto_162164 ) ) ( not ( = ?auto_162167 ?auto_162166 ) ) ( not ( = ?auto_162159 ?auto_162163 ) ) ( not ( = ?auto_162161 ?auto_162163 ) ) ( not ( = ?auto_162160 ?auto_162163 ) ) ( not ( = ?auto_162169 ?auto_162167 ) ) ( not ( = ?auto_162169 ?auto_162164 ) ) ( not ( = ?auto_162169 ?auto_162166 ) ) ( not ( = ?auto_162159 ?auto_162162 ) ) ( not ( = ?auto_162161 ?auto_162162 ) ) ( not ( = ?auto_162160 ?auto_162162 ) ) ( not ( = ?auto_162163 ?auto_162162 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_162159 ?auto_162161 ?auto_162160 ?auto_162162 ?auto_162163 ?auto_162158 )
      ( DELIVER-5PKG-VERIFY ?auto_162159 ?auto_162160 ?auto_162161 ?auto_162162 ?auto_162163 ?auto_162158 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_162319 - OBJ
      ?auto_162320 - OBJ
      ?auto_162321 - OBJ
      ?auto_162322 - OBJ
      ?auto_162323 - OBJ
      ?auto_162318 - LOCATION
    )
    :vars
    (
      ?auto_162324 - LOCATION
      ?auto_162325 - CITY
      ?auto_162329 - LOCATION
      ?auto_162327 - LOCATION
      ?auto_162326 - LOCATION
      ?auto_162328 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_162324 ?auto_162325 ) ( IN-CITY ?auto_162318 ?auto_162325 ) ( not ( = ?auto_162318 ?auto_162324 ) ) ( OBJ-AT ?auto_162323 ?auto_162324 ) ( IN-CITY ?auto_162329 ?auto_162325 ) ( not ( = ?auto_162318 ?auto_162329 ) ) ( OBJ-AT ?auto_162321 ?auto_162329 ) ( IN-CITY ?auto_162327 ?auto_162325 ) ( not ( = ?auto_162318 ?auto_162327 ) ) ( OBJ-AT ?auto_162320 ?auto_162327 ) ( OBJ-AT ?auto_162322 ?auto_162324 ) ( IN-CITY ?auto_162326 ?auto_162325 ) ( not ( = ?auto_162318 ?auto_162326 ) ) ( OBJ-AT ?auto_162319 ?auto_162326 ) ( TRUCK-AT ?auto_162328 ?auto_162318 ) ( not ( = ?auto_162319 ?auto_162322 ) ) ( not ( = ?auto_162324 ?auto_162326 ) ) ( not ( = ?auto_162319 ?auto_162320 ) ) ( not ( = ?auto_162322 ?auto_162320 ) ) ( not ( = ?auto_162327 ?auto_162324 ) ) ( not ( = ?auto_162327 ?auto_162326 ) ) ( not ( = ?auto_162319 ?auto_162321 ) ) ( not ( = ?auto_162322 ?auto_162321 ) ) ( not ( = ?auto_162320 ?auto_162321 ) ) ( not ( = ?auto_162329 ?auto_162327 ) ) ( not ( = ?auto_162329 ?auto_162324 ) ) ( not ( = ?auto_162329 ?auto_162326 ) ) ( not ( = ?auto_162319 ?auto_162323 ) ) ( not ( = ?auto_162322 ?auto_162323 ) ) ( not ( = ?auto_162320 ?auto_162323 ) ) ( not ( = ?auto_162321 ?auto_162323 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_162319 ?auto_162322 ?auto_162320 ?auto_162323 ?auto_162321 ?auto_162318 )
      ( DELIVER-5PKG-VERIFY ?auto_162319 ?auto_162320 ?auto_162321 ?auto_162322 ?auto_162323 ?auto_162318 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165444 - OBJ
      ?auto_165445 - OBJ
      ?auto_165446 - OBJ
      ?auto_165447 - OBJ
      ?auto_165448 - OBJ
      ?auto_165443 - LOCATION
    )
    :vars
    (
      ?auto_165449 - LOCATION
      ?auto_165450 - CITY
      ?auto_165454 - LOCATION
      ?auto_165452 - LOCATION
      ?auto_165451 - LOCATION
      ?auto_165453 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165449 ?auto_165450 ) ( IN-CITY ?auto_165443 ?auto_165450 ) ( not ( = ?auto_165443 ?auto_165449 ) ) ( OBJ-AT ?auto_165448 ?auto_165449 ) ( IN-CITY ?auto_165454 ?auto_165450 ) ( not ( = ?auto_165443 ?auto_165454 ) ) ( OBJ-AT ?auto_165447 ?auto_165454 ) ( IN-CITY ?auto_165452 ?auto_165450 ) ( not ( = ?auto_165443 ?auto_165452 ) ) ( OBJ-AT ?auto_165446 ?auto_165452 ) ( OBJ-AT ?auto_165444 ?auto_165449 ) ( IN-CITY ?auto_165451 ?auto_165450 ) ( not ( = ?auto_165443 ?auto_165451 ) ) ( OBJ-AT ?auto_165445 ?auto_165451 ) ( TRUCK-AT ?auto_165453 ?auto_165443 ) ( not ( = ?auto_165445 ?auto_165444 ) ) ( not ( = ?auto_165449 ?auto_165451 ) ) ( not ( = ?auto_165445 ?auto_165446 ) ) ( not ( = ?auto_165444 ?auto_165446 ) ) ( not ( = ?auto_165452 ?auto_165449 ) ) ( not ( = ?auto_165452 ?auto_165451 ) ) ( not ( = ?auto_165445 ?auto_165447 ) ) ( not ( = ?auto_165444 ?auto_165447 ) ) ( not ( = ?auto_165446 ?auto_165447 ) ) ( not ( = ?auto_165454 ?auto_165452 ) ) ( not ( = ?auto_165454 ?auto_165449 ) ) ( not ( = ?auto_165454 ?auto_165451 ) ) ( not ( = ?auto_165445 ?auto_165448 ) ) ( not ( = ?auto_165444 ?auto_165448 ) ) ( not ( = ?auto_165446 ?auto_165448 ) ) ( not ( = ?auto_165447 ?auto_165448 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_165445 ?auto_165444 ?auto_165446 ?auto_165448 ?auto_165447 ?auto_165443 )
      ( DELIVER-5PKG-VERIFY ?auto_165444 ?auto_165445 ?auto_165446 ?auto_165447 ?auto_165448 ?auto_165443 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165495 - OBJ
      ?auto_165496 - OBJ
      ?auto_165497 - OBJ
      ?auto_165498 - OBJ
      ?auto_165499 - OBJ
      ?auto_165494 - LOCATION
    )
    :vars
    (
      ?auto_165500 - LOCATION
      ?auto_165501 - CITY
      ?auto_165505 - LOCATION
      ?auto_165503 - LOCATION
      ?auto_165502 - LOCATION
      ?auto_165504 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165500 ?auto_165501 ) ( IN-CITY ?auto_165494 ?auto_165501 ) ( not ( = ?auto_165494 ?auto_165500 ) ) ( OBJ-AT ?auto_165498 ?auto_165500 ) ( IN-CITY ?auto_165505 ?auto_165501 ) ( not ( = ?auto_165494 ?auto_165505 ) ) ( OBJ-AT ?auto_165499 ?auto_165505 ) ( IN-CITY ?auto_165503 ?auto_165501 ) ( not ( = ?auto_165494 ?auto_165503 ) ) ( OBJ-AT ?auto_165497 ?auto_165503 ) ( OBJ-AT ?auto_165495 ?auto_165500 ) ( IN-CITY ?auto_165502 ?auto_165501 ) ( not ( = ?auto_165494 ?auto_165502 ) ) ( OBJ-AT ?auto_165496 ?auto_165502 ) ( TRUCK-AT ?auto_165504 ?auto_165494 ) ( not ( = ?auto_165496 ?auto_165495 ) ) ( not ( = ?auto_165500 ?auto_165502 ) ) ( not ( = ?auto_165496 ?auto_165497 ) ) ( not ( = ?auto_165495 ?auto_165497 ) ) ( not ( = ?auto_165503 ?auto_165500 ) ) ( not ( = ?auto_165503 ?auto_165502 ) ) ( not ( = ?auto_165496 ?auto_165499 ) ) ( not ( = ?auto_165495 ?auto_165499 ) ) ( not ( = ?auto_165497 ?auto_165499 ) ) ( not ( = ?auto_165505 ?auto_165503 ) ) ( not ( = ?auto_165505 ?auto_165500 ) ) ( not ( = ?auto_165505 ?auto_165502 ) ) ( not ( = ?auto_165496 ?auto_165498 ) ) ( not ( = ?auto_165495 ?auto_165498 ) ) ( not ( = ?auto_165497 ?auto_165498 ) ) ( not ( = ?auto_165499 ?auto_165498 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_165496 ?auto_165495 ?auto_165497 ?auto_165498 ?auto_165499 ?auto_165494 )
      ( DELIVER-5PKG-VERIFY ?auto_165495 ?auto_165496 ?auto_165497 ?auto_165498 ?auto_165499 ?auto_165494 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165798 - OBJ
      ?auto_165799 - OBJ
      ?auto_165800 - OBJ
      ?auto_165801 - OBJ
      ?auto_165802 - OBJ
      ?auto_165797 - LOCATION
    )
    :vars
    (
      ?auto_165803 - LOCATION
      ?auto_165804 - CITY
      ?auto_165808 - LOCATION
      ?auto_165806 - LOCATION
      ?auto_165805 - LOCATION
      ?auto_165807 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165803 ?auto_165804 ) ( IN-CITY ?auto_165797 ?auto_165804 ) ( not ( = ?auto_165797 ?auto_165803 ) ) ( OBJ-AT ?auto_165800 ?auto_165803 ) ( IN-CITY ?auto_165808 ?auto_165804 ) ( not ( = ?auto_165797 ?auto_165808 ) ) ( OBJ-AT ?auto_165802 ?auto_165808 ) ( IN-CITY ?auto_165806 ?auto_165804 ) ( not ( = ?auto_165797 ?auto_165806 ) ) ( OBJ-AT ?auto_165801 ?auto_165806 ) ( OBJ-AT ?auto_165798 ?auto_165803 ) ( IN-CITY ?auto_165805 ?auto_165804 ) ( not ( = ?auto_165797 ?auto_165805 ) ) ( OBJ-AT ?auto_165799 ?auto_165805 ) ( TRUCK-AT ?auto_165807 ?auto_165797 ) ( not ( = ?auto_165799 ?auto_165798 ) ) ( not ( = ?auto_165803 ?auto_165805 ) ) ( not ( = ?auto_165799 ?auto_165801 ) ) ( not ( = ?auto_165798 ?auto_165801 ) ) ( not ( = ?auto_165806 ?auto_165803 ) ) ( not ( = ?auto_165806 ?auto_165805 ) ) ( not ( = ?auto_165799 ?auto_165802 ) ) ( not ( = ?auto_165798 ?auto_165802 ) ) ( not ( = ?auto_165801 ?auto_165802 ) ) ( not ( = ?auto_165808 ?auto_165806 ) ) ( not ( = ?auto_165808 ?auto_165803 ) ) ( not ( = ?auto_165808 ?auto_165805 ) ) ( not ( = ?auto_165799 ?auto_165800 ) ) ( not ( = ?auto_165798 ?auto_165800 ) ) ( not ( = ?auto_165801 ?auto_165800 ) ) ( not ( = ?auto_165802 ?auto_165800 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_165799 ?auto_165798 ?auto_165801 ?auto_165800 ?auto_165802 ?auto_165797 )
      ( DELIVER-5PKG-VERIFY ?auto_165798 ?auto_165799 ?auto_165800 ?auto_165801 ?auto_165802 ?auto_165797 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_168507 - OBJ
      ?auto_168508 - OBJ
      ?auto_168509 - OBJ
      ?auto_168510 - OBJ
      ?auto_168511 - OBJ
      ?auto_168506 - LOCATION
    )
    :vars
    (
      ?auto_168512 - LOCATION
      ?auto_168513 - CITY
      ?auto_168517 - LOCATION
      ?auto_168515 - LOCATION
      ?auto_168514 - LOCATION
      ?auto_168516 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_168512 ?auto_168513 ) ( IN-CITY ?auto_168506 ?auto_168513 ) ( not ( = ?auto_168506 ?auto_168512 ) ) ( OBJ-AT ?auto_168508 ?auto_168512 ) ( IN-CITY ?auto_168517 ?auto_168513 ) ( not ( = ?auto_168506 ?auto_168517 ) ) ( OBJ-AT ?auto_168511 ?auto_168517 ) ( IN-CITY ?auto_168515 ?auto_168513 ) ( not ( = ?auto_168506 ?auto_168515 ) ) ( OBJ-AT ?auto_168510 ?auto_168515 ) ( OBJ-AT ?auto_168507 ?auto_168512 ) ( IN-CITY ?auto_168514 ?auto_168513 ) ( not ( = ?auto_168506 ?auto_168514 ) ) ( OBJ-AT ?auto_168509 ?auto_168514 ) ( TRUCK-AT ?auto_168516 ?auto_168506 ) ( not ( = ?auto_168509 ?auto_168507 ) ) ( not ( = ?auto_168512 ?auto_168514 ) ) ( not ( = ?auto_168509 ?auto_168510 ) ) ( not ( = ?auto_168507 ?auto_168510 ) ) ( not ( = ?auto_168515 ?auto_168512 ) ) ( not ( = ?auto_168515 ?auto_168514 ) ) ( not ( = ?auto_168509 ?auto_168511 ) ) ( not ( = ?auto_168507 ?auto_168511 ) ) ( not ( = ?auto_168510 ?auto_168511 ) ) ( not ( = ?auto_168517 ?auto_168515 ) ) ( not ( = ?auto_168517 ?auto_168512 ) ) ( not ( = ?auto_168517 ?auto_168514 ) ) ( not ( = ?auto_168509 ?auto_168508 ) ) ( not ( = ?auto_168507 ?auto_168508 ) ) ( not ( = ?auto_168510 ?auto_168508 ) ) ( not ( = ?auto_168511 ?auto_168508 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_168509 ?auto_168507 ?auto_168510 ?auto_168508 ?auto_168511 ?auto_168506 )
      ( DELIVER-5PKG-VERIFY ?auto_168507 ?auto_168508 ?auto_168509 ?auto_168510 ?auto_168511 ?auto_168506 ) )
  )

)

