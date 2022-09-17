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
      ?auto_1586407 - OBJ
      ?auto_1586408 - LOCATION
    )
    :vars
    (
      ?auto_1586409 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1586409 ?auto_1586408 ) ( IN-TRUCK ?auto_1586407 ?auto_1586409 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1586407 ?auto_1586409 ?auto_1586408 )
      ( DELIVER-1PKG-VERIFY ?auto_1586407 ?auto_1586408 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1586432 - OBJ
      ?auto_1586433 - LOCATION
    )
    :vars
    (
      ?auto_1586434 - TRUCK
      ?auto_1586435 - LOCATION
      ?auto_1586436 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1586432 ?auto_1586434 ) ( TRUCK-AT ?auto_1586434 ?auto_1586435 ) ( IN-CITY ?auto_1586435 ?auto_1586436 ) ( IN-CITY ?auto_1586433 ?auto_1586436 ) ( not ( = ?auto_1586433 ?auto_1586435 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1586434 ?auto_1586435 ?auto_1586433 ?auto_1586436 )
      ( DELIVER-1PKG ?auto_1586432 ?auto_1586433 )
      ( DELIVER-1PKG-VERIFY ?auto_1586432 ?auto_1586433 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1586467 - OBJ
      ?auto_1586468 - LOCATION
    )
    :vars
    (
      ?auto_1586471 - TRUCK
      ?auto_1586469 - LOCATION
      ?auto_1586470 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1586471 ?auto_1586469 ) ( IN-CITY ?auto_1586469 ?auto_1586470 ) ( IN-CITY ?auto_1586468 ?auto_1586470 ) ( not ( = ?auto_1586468 ?auto_1586469 ) ) ( OBJ-AT ?auto_1586467 ?auto_1586469 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1586467 ?auto_1586471 ?auto_1586469 )
      ( DELIVER-1PKG ?auto_1586467 ?auto_1586468 )
      ( DELIVER-1PKG-VERIFY ?auto_1586467 ?auto_1586468 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1586502 - OBJ
      ?auto_1586503 - LOCATION
    )
    :vars
    (
      ?auto_1586505 - LOCATION
      ?auto_1586504 - CITY
      ?auto_1586506 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1586505 ?auto_1586504 ) ( IN-CITY ?auto_1586503 ?auto_1586504 ) ( not ( = ?auto_1586503 ?auto_1586505 ) ) ( OBJ-AT ?auto_1586502 ?auto_1586505 ) ( TRUCK-AT ?auto_1586506 ?auto_1586503 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1586506 ?auto_1586503 ?auto_1586505 ?auto_1586504 )
      ( DELIVER-1PKG ?auto_1586502 ?auto_1586503 )
      ( DELIVER-1PKG-VERIFY ?auto_1586502 ?auto_1586503 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1586840 - OBJ
      ?auto_1586842 - OBJ
      ?auto_1586841 - LOCATION
    )
    :vars
    (
      ?auto_1586843 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1586842 ?auto_1586840 ) ( TRUCK-AT ?auto_1586843 ?auto_1586841 ) ( IN-TRUCK ?auto_1586842 ?auto_1586843 ) ( OBJ-AT ?auto_1586840 ?auto_1586841 ) ( not ( = ?auto_1586840 ?auto_1586842 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1586842 ?auto_1586841 )
      ( DELIVER-2PKG-VERIFY ?auto_1586840 ?auto_1586842 ?auto_1586841 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1587199 - OBJ
      ?auto_1587201 - OBJ
      ?auto_1587200 - LOCATION
    )
    :vars
    (
      ?auto_1587203 - TRUCK
      ?auto_1587202 - LOCATION
      ?auto_1587204 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1587201 ?auto_1587199 ) ( IN-TRUCK ?auto_1587201 ?auto_1587203 ) ( TRUCK-AT ?auto_1587203 ?auto_1587202 ) ( IN-CITY ?auto_1587202 ?auto_1587204 ) ( IN-CITY ?auto_1587200 ?auto_1587204 ) ( not ( = ?auto_1587200 ?auto_1587202 ) ) ( OBJ-AT ?auto_1587199 ?auto_1587200 ) ( not ( = ?auto_1587199 ?auto_1587201 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1587201 ?auto_1587200 )
      ( DELIVER-2PKG-VERIFY ?auto_1587199 ?auto_1587201 ?auto_1587200 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1587669 - OBJ
      ?auto_1587670 - LOCATION
    )
    :vars
    (
      ?auto_1587673 - OBJ
      ?auto_1587674 - TRUCK
      ?auto_1587672 - LOCATION
      ?auto_1587671 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1587669 ?auto_1587673 ) ( TRUCK-AT ?auto_1587674 ?auto_1587672 ) ( IN-CITY ?auto_1587672 ?auto_1587671 ) ( IN-CITY ?auto_1587670 ?auto_1587671 ) ( not ( = ?auto_1587670 ?auto_1587672 ) ) ( OBJ-AT ?auto_1587673 ?auto_1587670 ) ( not ( = ?auto_1587673 ?auto_1587669 ) ) ( OBJ-AT ?auto_1587669 ?auto_1587672 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1587669 ?auto_1587674 ?auto_1587672 )
      ( DELIVER-2PKG ?auto_1587673 ?auto_1587669 ?auto_1587670 )
      ( DELIVER-1PKG-VERIFY ?auto_1587669 ?auto_1587670 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1587675 - OBJ
      ?auto_1587677 - OBJ
      ?auto_1587676 - LOCATION
    )
    :vars
    (
      ?auto_1587679 - TRUCK
      ?auto_1587678 - LOCATION
      ?auto_1587680 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1587677 ?auto_1587675 ) ( TRUCK-AT ?auto_1587679 ?auto_1587678 ) ( IN-CITY ?auto_1587678 ?auto_1587680 ) ( IN-CITY ?auto_1587676 ?auto_1587680 ) ( not ( = ?auto_1587676 ?auto_1587678 ) ) ( OBJ-AT ?auto_1587675 ?auto_1587676 ) ( not ( = ?auto_1587675 ?auto_1587677 ) ) ( OBJ-AT ?auto_1587677 ?auto_1587678 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1587677 ?auto_1587676 )
      ( DELIVER-2PKG-VERIFY ?auto_1587675 ?auto_1587677 ?auto_1587676 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1588145 - OBJ
      ?auto_1588146 - LOCATION
    )
    :vars
    (
      ?auto_1588147 - OBJ
      ?auto_1588148 - LOCATION
      ?auto_1588149 - CITY
      ?auto_1588150 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1588145 ?auto_1588147 ) ( IN-CITY ?auto_1588148 ?auto_1588149 ) ( IN-CITY ?auto_1588146 ?auto_1588149 ) ( not ( = ?auto_1588146 ?auto_1588148 ) ) ( OBJ-AT ?auto_1588147 ?auto_1588146 ) ( not ( = ?auto_1588147 ?auto_1588145 ) ) ( OBJ-AT ?auto_1588145 ?auto_1588148 ) ( TRUCK-AT ?auto_1588150 ?auto_1588146 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1588150 ?auto_1588146 ?auto_1588148 ?auto_1588149 )
      ( DELIVER-2PKG ?auto_1588147 ?auto_1588145 ?auto_1588146 )
      ( DELIVER-1PKG-VERIFY ?auto_1588145 ?auto_1588146 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1588151 - OBJ
      ?auto_1588153 - OBJ
      ?auto_1588152 - LOCATION
    )
    :vars
    (
      ?auto_1588156 - LOCATION
      ?auto_1588154 - CITY
      ?auto_1588155 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1588153 ?auto_1588151 ) ( IN-CITY ?auto_1588156 ?auto_1588154 ) ( IN-CITY ?auto_1588152 ?auto_1588154 ) ( not ( = ?auto_1588152 ?auto_1588156 ) ) ( OBJ-AT ?auto_1588151 ?auto_1588152 ) ( not ( = ?auto_1588151 ?auto_1588153 ) ) ( OBJ-AT ?auto_1588153 ?auto_1588156 ) ( TRUCK-AT ?auto_1588155 ?auto_1588152 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1588153 ?auto_1588152 )
      ( DELIVER-2PKG-VERIFY ?auto_1588151 ?auto_1588153 ?auto_1588152 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1588621 - OBJ
      ?auto_1588622 - LOCATION
    )
    :vars
    (
      ?auto_1588624 - OBJ
      ?auto_1588625 - LOCATION
      ?auto_1588626 - CITY
      ?auto_1588623 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1588621 ?auto_1588624 ) ( IN-CITY ?auto_1588625 ?auto_1588626 ) ( IN-CITY ?auto_1588622 ?auto_1588626 ) ( not ( = ?auto_1588622 ?auto_1588625 ) ) ( not ( = ?auto_1588624 ?auto_1588621 ) ) ( OBJ-AT ?auto_1588621 ?auto_1588625 ) ( TRUCK-AT ?auto_1588623 ?auto_1588622 ) ( IN-TRUCK ?auto_1588624 ?auto_1588623 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1588624 ?auto_1588622 )
      ( DELIVER-2PKG ?auto_1588624 ?auto_1588621 ?auto_1588622 )
      ( DELIVER-1PKG-VERIFY ?auto_1588621 ?auto_1588622 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1588627 - OBJ
      ?auto_1588629 - OBJ
      ?auto_1588628 - LOCATION
    )
    :vars
    (
      ?auto_1588630 - LOCATION
      ?auto_1588631 - CITY
      ?auto_1588632 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1588629 ?auto_1588627 ) ( IN-CITY ?auto_1588630 ?auto_1588631 ) ( IN-CITY ?auto_1588628 ?auto_1588631 ) ( not ( = ?auto_1588628 ?auto_1588630 ) ) ( not ( = ?auto_1588627 ?auto_1588629 ) ) ( OBJ-AT ?auto_1588629 ?auto_1588630 ) ( TRUCK-AT ?auto_1588632 ?auto_1588628 ) ( IN-TRUCK ?auto_1588627 ?auto_1588632 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1588629 ?auto_1588628 )
      ( DELIVER-2PKG-VERIFY ?auto_1588627 ?auto_1588629 ?auto_1588628 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1589097 - OBJ
      ?auto_1589098 - LOCATION
    )
    :vars
    (
      ?auto_1589099 - OBJ
      ?auto_1589100 - LOCATION
      ?auto_1589101 - CITY
      ?auto_1589102 - TRUCK
      ?auto_1589103 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1589097 ?auto_1589099 ) ( IN-CITY ?auto_1589100 ?auto_1589101 ) ( IN-CITY ?auto_1589098 ?auto_1589101 ) ( not ( = ?auto_1589098 ?auto_1589100 ) ) ( not ( = ?auto_1589099 ?auto_1589097 ) ) ( OBJ-AT ?auto_1589097 ?auto_1589100 ) ( IN-TRUCK ?auto_1589099 ?auto_1589102 ) ( TRUCK-AT ?auto_1589102 ?auto_1589103 ) ( IN-CITY ?auto_1589103 ?auto_1589101 ) ( not ( = ?auto_1589098 ?auto_1589103 ) ) ( not ( = ?auto_1589100 ?auto_1589103 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1589102 ?auto_1589103 ?auto_1589098 ?auto_1589101 )
      ( DELIVER-2PKG ?auto_1589099 ?auto_1589097 ?auto_1589098 )
      ( DELIVER-1PKG-VERIFY ?auto_1589097 ?auto_1589098 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1589104 - OBJ
      ?auto_1589106 - OBJ
      ?auto_1589105 - LOCATION
    )
    :vars
    (
      ?auto_1589108 - LOCATION
      ?auto_1589109 - CITY
      ?auto_1589110 - TRUCK
      ?auto_1589107 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1589106 ?auto_1589104 ) ( IN-CITY ?auto_1589108 ?auto_1589109 ) ( IN-CITY ?auto_1589105 ?auto_1589109 ) ( not ( = ?auto_1589105 ?auto_1589108 ) ) ( not ( = ?auto_1589104 ?auto_1589106 ) ) ( OBJ-AT ?auto_1589106 ?auto_1589108 ) ( IN-TRUCK ?auto_1589104 ?auto_1589110 ) ( TRUCK-AT ?auto_1589110 ?auto_1589107 ) ( IN-CITY ?auto_1589107 ?auto_1589109 ) ( not ( = ?auto_1589105 ?auto_1589107 ) ) ( not ( = ?auto_1589108 ?auto_1589107 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1589106 ?auto_1589105 )
      ( DELIVER-2PKG-VERIFY ?auto_1589104 ?auto_1589106 ?auto_1589105 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1589630 - OBJ
      ?auto_1589631 - LOCATION
    )
    :vars
    (
      ?auto_1589633 - OBJ
      ?auto_1589632 - LOCATION
      ?auto_1589635 - CITY
      ?auto_1589634 - TRUCK
      ?auto_1589636 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1589630 ?auto_1589633 ) ( IN-CITY ?auto_1589632 ?auto_1589635 ) ( IN-CITY ?auto_1589631 ?auto_1589635 ) ( not ( = ?auto_1589631 ?auto_1589632 ) ) ( not ( = ?auto_1589633 ?auto_1589630 ) ) ( OBJ-AT ?auto_1589630 ?auto_1589632 ) ( TRUCK-AT ?auto_1589634 ?auto_1589636 ) ( IN-CITY ?auto_1589636 ?auto_1589635 ) ( not ( = ?auto_1589631 ?auto_1589636 ) ) ( not ( = ?auto_1589632 ?auto_1589636 ) ) ( OBJ-AT ?auto_1589633 ?auto_1589636 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1589633 ?auto_1589634 ?auto_1589636 )
      ( DELIVER-2PKG ?auto_1589633 ?auto_1589630 ?auto_1589631 )
      ( DELIVER-1PKG-VERIFY ?auto_1589630 ?auto_1589631 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1589637 - OBJ
      ?auto_1589639 - OBJ
      ?auto_1589638 - LOCATION
    )
    :vars
    (
      ?auto_1589640 - LOCATION
      ?auto_1589643 - CITY
      ?auto_1589642 - TRUCK
      ?auto_1589641 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1589639 ?auto_1589637 ) ( IN-CITY ?auto_1589640 ?auto_1589643 ) ( IN-CITY ?auto_1589638 ?auto_1589643 ) ( not ( = ?auto_1589638 ?auto_1589640 ) ) ( not ( = ?auto_1589637 ?auto_1589639 ) ) ( OBJ-AT ?auto_1589639 ?auto_1589640 ) ( TRUCK-AT ?auto_1589642 ?auto_1589641 ) ( IN-CITY ?auto_1589641 ?auto_1589643 ) ( not ( = ?auto_1589638 ?auto_1589641 ) ) ( not ( = ?auto_1589640 ?auto_1589641 ) ) ( OBJ-AT ?auto_1589637 ?auto_1589641 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1589639 ?auto_1589638 )
      ( DELIVER-2PKG-VERIFY ?auto_1589637 ?auto_1589639 ?auto_1589638 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1592342 - OBJ
      ?auto_1592344 - OBJ
      ?auto_1592345 - OBJ
      ?auto_1592343 - LOCATION
    )
    :vars
    (
      ?auto_1592346 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1592344 ?auto_1592342 ) ( GREATER-THAN ?auto_1592345 ?auto_1592342 ) ( GREATER-THAN ?auto_1592345 ?auto_1592344 ) ( TRUCK-AT ?auto_1592346 ?auto_1592343 ) ( IN-TRUCK ?auto_1592345 ?auto_1592346 ) ( OBJ-AT ?auto_1592342 ?auto_1592343 ) ( OBJ-AT ?auto_1592344 ?auto_1592343 ) ( not ( = ?auto_1592342 ?auto_1592344 ) ) ( not ( = ?auto_1592342 ?auto_1592345 ) ) ( not ( = ?auto_1592344 ?auto_1592345 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1592345 ?auto_1592343 )
      ( DELIVER-3PKG-VERIFY ?auto_1592342 ?auto_1592344 ?auto_1592345 ?auto_1592343 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1594340 - OBJ
      ?auto_1594342 - OBJ
      ?auto_1594343 - OBJ
      ?auto_1594341 - LOCATION
    )
    :vars
    (
      ?auto_1594345 - TRUCK
      ?auto_1594346 - LOCATION
      ?auto_1594344 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1594342 ?auto_1594340 ) ( GREATER-THAN ?auto_1594343 ?auto_1594340 ) ( GREATER-THAN ?auto_1594343 ?auto_1594342 ) ( IN-TRUCK ?auto_1594343 ?auto_1594345 ) ( TRUCK-AT ?auto_1594345 ?auto_1594346 ) ( IN-CITY ?auto_1594346 ?auto_1594344 ) ( IN-CITY ?auto_1594341 ?auto_1594344 ) ( not ( = ?auto_1594341 ?auto_1594346 ) ) ( OBJ-AT ?auto_1594340 ?auto_1594341 ) ( not ( = ?auto_1594340 ?auto_1594343 ) ) ( OBJ-AT ?auto_1594342 ?auto_1594341 ) ( not ( = ?auto_1594340 ?auto_1594342 ) ) ( not ( = ?auto_1594342 ?auto_1594343 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1594340 ?auto_1594343 ?auto_1594341 )
      ( DELIVER-3PKG-VERIFY ?auto_1594340 ?auto_1594342 ?auto_1594343 ?auto_1594341 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1596980 - OBJ
      ?auto_1596982 - OBJ
      ?auto_1596983 - OBJ
      ?auto_1596981 - LOCATION
    )
    :vars
    (
      ?auto_1596984 - TRUCK
      ?auto_1596986 - LOCATION
      ?auto_1596985 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1596982 ?auto_1596980 ) ( GREATER-THAN ?auto_1596983 ?auto_1596980 ) ( GREATER-THAN ?auto_1596983 ?auto_1596982 ) ( TRUCK-AT ?auto_1596984 ?auto_1596986 ) ( IN-CITY ?auto_1596986 ?auto_1596985 ) ( IN-CITY ?auto_1596981 ?auto_1596985 ) ( not ( = ?auto_1596981 ?auto_1596986 ) ) ( OBJ-AT ?auto_1596980 ?auto_1596981 ) ( not ( = ?auto_1596980 ?auto_1596983 ) ) ( OBJ-AT ?auto_1596983 ?auto_1596986 ) ( OBJ-AT ?auto_1596982 ?auto_1596981 ) ( not ( = ?auto_1596980 ?auto_1596982 ) ) ( not ( = ?auto_1596982 ?auto_1596983 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1596980 ?auto_1596983 ?auto_1596981 )
      ( DELIVER-3PKG-VERIFY ?auto_1596980 ?auto_1596982 ?auto_1596983 ?auto_1596981 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1599620 - OBJ
      ?auto_1599622 - OBJ
      ?auto_1599623 - OBJ
      ?auto_1599621 - LOCATION
    )
    :vars
    (
      ?auto_1599625 - LOCATION
      ?auto_1599626 - CITY
      ?auto_1599624 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1599622 ?auto_1599620 ) ( GREATER-THAN ?auto_1599623 ?auto_1599620 ) ( GREATER-THAN ?auto_1599623 ?auto_1599622 ) ( IN-CITY ?auto_1599625 ?auto_1599626 ) ( IN-CITY ?auto_1599621 ?auto_1599626 ) ( not ( = ?auto_1599621 ?auto_1599625 ) ) ( OBJ-AT ?auto_1599620 ?auto_1599621 ) ( not ( = ?auto_1599620 ?auto_1599623 ) ) ( OBJ-AT ?auto_1599623 ?auto_1599625 ) ( TRUCK-AT ?auto_1599624 ?auto_1599621 ) ( OBJ-AT ?auto_1599622 ?auto_1599621 ) ( not ( = ?auto_1599620 ?auto_1599622 ) ) ( not ( = ?auto_1599622 ?auto_1599623 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1599620 ?auto_1599623 ?auto_1599621 )
      ( DELIVER-3PKG-VERIFY ?auto_1599620 ?auto_1599622 ?auto_1599623 ?auto_1599621 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1604855 - OBJ
      ?auto_1604856 - LOCATION
    )
    :vars
    (
      ?auto_1604859 - OBJ
      ?auto_1604858 - LOCATION
      ?auto_1604860 - CITY
      ?auto_1604857 - TRUCK
      ?auto_1604861 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1604855 ?auto_1604859 ) ( IN-CITY ?auto_1604858 ?auto_1604860 ) ( IN-CITY ?auto_1604856 ?auto_1604860 ) ( not ( = ?auto_1604856 ?auto_1604858 ) ) ( OBJ-AT ?auto_1604859 ?auto_1604856 ) ( not ( = ?auto_1604859 ?auto_1604855 ) ) ( OBJ-AT ?auto_1604855 ?auto_1604858 ) ( TRUCK-AT ?auto_1604857 ?auto_1604861 ) ( IN-CITY ?auto_1604861 ?auto_1604860 ) ( not ( = ?auto_1604856 ?auto_1604861 ) ) ( not ( = ?auto_1604858 ?auto_1604861 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1604857 ?auto_1604861 ?auto_1604856 ?auto_1604860 )
      ( DELIVER-2PKG ?auto_1604859 ?auto_1604855 ?auto_1604856 )
      ( DELIVER-1PKG-VERIFY ?auto_1604855 ?auto_1604856 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1604862 - OBJ
      ?auto_1604864 - OBJ
      ?auto_1604863 - LOCATION
    )
    :vars
    (
      ?auto_1604866 - LOCATION
      ?auto_1604868 - CITY
      ?auto_1604865 - TRUCK
      ?auto_1604867 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1604864 ?auto_1604862 ) ( IN-CITY ?auto_1604866 ?auto_1604868 ) ( IN-CITY ?auto_1604863 ?auto_1604868 ) ( not ( = ?auto_1604863 ?auto_1604866 ) ) ( OBJ-AT ?auto_1604862 ?auto_1604863 ) ( not ( = ?auto_1604862 ?auto_1604864 ) ) ( OBJ-AT ?auto_1604864 ?auto_1604866 ) ( TRUCK-AT ?auto_1604865 ?auto_1604867 ) ( IN-CITY ?auto_1604867 ?auto_1604868 ) ( not ( = ?auto_1604863 ?auto_1604867 ) ) ( not ( = ?auto_1604866 ?auto_1604867 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1604864 ?auto_1604863 )
      ( DELIVER-2PKG-VERIFY ?auto_1604862 ?auto_1604864 ?auto_1604863 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1630464 - OBJ
      ?auto_1630466 - OBJ
      ?auto_1630467 - OBJ
      ?auto_1630468 - OBJ
      ?auto_1630465 - LOCATION
    )
    :vars
    (
      ?auto_1630469 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1630466 ?auto_1630464 ) ( GREATER-THAN ?auto_1630467 ?auto_1630464 ) ( GREATER-THAN ?auto_1630467 ?auto_1630466 ) ( GREATER-THAN ?auto_1630468 ?auto_1630464 ) ( GREATER-THAN ?auto_1630468 ?auto_1630466 ) ( GREATER-THAN ?auto_1630468 ?auto_1630467 ) ( TRUCK-AT ?auto_1630469 ?auto_1630465 ) ( IN-TRUCK ?auto_1630468 ?auto_1630469 ) ( OBJ-AT ?auto_1630464 ?auto_1630465 ) ( OBJ-AT ?auto_1630466 ?auto_1630465 ) ( OBJ-AT ?auto_1630467 ?auto_1630465 ) ( not ( = ?auto_1630464 ?auto_1630466 ) ) ( not ( = ?auto_1630464 ?auto_1630467 ) ) ( not ( = ?auto_1630464 ?auto_1630468 ) ) ( not ( = ?auto_1630466 ?auto_1630467 ) ) ( not ( = ?auto_1630466 ?auto_1630468 ) ) ( not ( = ?auto_1630467 ?auto_1630468 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1630468 ?auto_1630465 )
      ( DELIVER-4PKG-VERIFY ?auto_1630464 ?auto_1630466 ?auto_1630467 ?auto_1630468 ?auto_1630465 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1637314 - OBJ
      ?auto_1637316 - OBJ
      ?auto_1637317 - OBJ
      ?auto_1637318 - OBJ
      ?auto_1637315 - LOCATION
    )
    :vars
    (
      ?auto_1637320 - TRUCK
      ?auto_1637319 - LOCATION
      ?auto_1637321 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1637316 ?auto_1637314 ) ( GREATER-THAN ?auto_1637317 ?auto_1637314 ) ( GREATER-THAN ?auto_1637317 ?auto_1637316 ) ( GREATER-THAN ?auto_1637318 ?auto_1637314 ) ( GREATER-THAN ?auto_1637318 ?auto_1637316 ) ( GREATER-THAN ?auto_1637318 ?auto_1637317 ) ( IN-TRUCK ?auto_1637318 ?auto_1637320 ) ( TRUCK-AT ?auto_1637320 ?auto_1637319 ) ( IN-CITY ?auto_1637319 ?auto_1637321 ) ( IN-CITY ?auto_1637315 ?auto_1637321 ) ( not ( = ?auto_1637315 ?auto_1637319 ) ) ( OBJ-AT ?auto_1637314 ?auto_1637315 ) ( not ( = ?auto_1637314 ?auto_1637318 ) ) ( OBJ-AT ?auto_1637316 ?auto_1637315 ) ( OBJ-AT ?auto_1637317 ?auto_1637315 ) ( not ( = ?auto_1637314 ?auto_1637316 ) ) ( not ( = ?auto_1637314 ?auto_1637317 ) ) ( not ( = ?auto_1637316 ?auto_1637317 ) ) ( not ( = ?auto_1637316 ?auto_1637318 ) ) ( not ( = ?auto_1637317 ?auto_1637318 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1637314 ?auto_1637318 ?auto_1637315 )
      ( DELIVER-4PKG-VERIFY ?auto_1637314 ?auto_1637316 ?auto_1637317 ?auto_1637318 ?auto_1637315 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1646335 - OBJ
      ?auto_1646337 - OBJ
      ?auto_1646338 - OBJ
      ?auto_1646339 - OBJ
      ?auto_1646336 - LOCATION
    )
    :vars
    (
      ?auto_1646340 - TRUCK
      ?auto_1646341 - LOCATION
      ?auto_1646342 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1646337 ?auto_1646335 ) ( GREATER-THAN ?auto_1646338 ?auto_1646335 ) ( GREATER-THAN ?auto_1646338 ?auto_1646337 ) ( GREATER-THAN ?auto_1646339 ?auto_1646335 ) ( GREATER-THAN ?auto_1646339 ?auto_1646337 ) ( GREATER-THAN ?auto_1646339 ?auto_1646338 ) ( TRUCK-AT ?auto_1646340 ?auto_1646341 ) ( IN-CITY ?auto_1646341 ?auto_1646342 ) ( IN-CITY ?auto_1646336 ?auto_1646342 ) ( not ( = ?auto_1646336 ?auto_1646341 ) ) ( OBJ-AT ?auto_1646335 ?auto_1646336 ) ( not ( = ?auto_1646335 ?auto_1646339 ) ) ( OBJ-AT ?auto_1646339 ?auto_1646341 ) ( OBJ-AT ?auto_1646337 ?auto_1646336 ) ( OBJ-AT ?auto_1646338 ?auto_1646336 ) ( not ( = ?auto_1646335 ?auto_1646337 ) ) ( not ( = ?auto_1646335 ?auto_1646338 ) ) ( not ( = ?auto_1646337 ?auto_1646338 ) ) ( not ( = ?auto_1646337 ?auto_1646339 ) ) ( not ( = ?auto_1646338 ?auto_1646339 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1646335 ?auto_1646339 ?auto_1646336 )
      ( DELIVER-4PKG-VERIFY ?auto_1646335 ?auto_1646337 ?auto_1646338 ?auto_1646339 ?auto_1646336 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1655356 - OBJ
      ?auto_1655358 - OBJ
      ?auto_1655359 - OBJ
      ?auto_1655360 - OBJ
      ?auto_1655357 - LOCATION
    )
    :vars
    (
      ?auto_1655363 - LOCATION
      ?auto_1655361 - CITY
      ?auto_1655362 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1655358 ?auto_1655356 ) ( GREATER-THAN ?auto_1655359 ?auto_1655356 ) ( GREATER-THAN ?auto_1655359 ?auto_1655358 ) ( GREATER-THAN ?auto_1655360 ?auto_1655356 ) ( GREATER-THAN ?auto_1655360 ?auto_1655358 ) ( GREATER-THAN ?auto_1655360 ?auto_1655359 ) ( IN-CITY ?auto_1655363 ?auto_1655361 ) ( IN-CITY ?auto_1655357 ?auto_1655361 ) ( not ( = ?auto_1655357 ?auto_1655363 ) ) ( OBJ-AT ?auto_1655356 ?auto_1655357 ) ( not ( = ?auto_1655356 ?auto_1655360 ) ) ( OBJ-AT ?auto_1655360 ?auto_1655363 ) ( TRUCK-AT ?auto_1655362 ?auto_1655357 ) ( OBJ-AT ?auto_1655358 ?auto_1655357 ) ( OBJ-AT ?auto_1655359 ?auto_1655357 ) ( not ( = ?auto_1655356 ?auto_1655358 ) ) ( not ( = ?auto_1655356 ?auto_1655359 ) ) ( not ( = ?auto_1655358 ?auto_1655359 ) ) ( not ( = ?auto_1655358 ?auto_1655360 ) ) ( not ( = ?auto_1655359 ?auto_1655360 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1655356 ?auto_1655360 ?auto_1655357 )
      ( DELIVER-4PKG-VERIFY ?auto_1655356 ?auto_1655358 ?auto_1655359 ?auto_1655360 ?auto_1655357 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1673075 - OBJ
      ?auto_1673077 - OBJ
      ?auto_1673078 - OBJ
      ?auto_1673076 - LOCATION
    )
    :vars
    (
      ?auto_1673082 - LOCATION
      ?auto_1673079 - CITY
      ?auto_1673080 - TRUCK
      ?auto_1673081 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1673077 ?auto_1673075 ) ( GREATER-THAN ?auto_1673078 ?auto_1673075 ) ( GREATER-THAN ?auto_1673078 ?auto_1673077 ) ( IN-CITY ?auto_1673082 ?auto_1673079 ) ( IN-CITY ?auto_1673076 ?auto_1673079 ) ( not ( = ?auto_1673076 ?auto_1673082 ) ) ( OBJ-AT ?auto_1673075 ?auto_1673076 ) ( not ( = ?auto_1673075 ?auto_1673078 ) ) ( OBJ-AT ?auto_1673078 ?auto_1673082 ) ( TRUCK-AT ?auto_1673080 ?auto_1673081 ) ( IN-CITY ?auto_1673081 ?auto_1673079 ) ( not ( = ?auto_1673076 ?auto_1673081 ) ) ( not ( = ?auto_1673082 ?auto_1673081 ) ) ( OBJ-AT ?auto_1673077 ?auto_1673076 ) ( not ( = ?auto_1673075 ?auto_1673077 ) ) ( not ( = ?auto_1673077 ?auto_1673078 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1673075 ?auto_1673078 ?auto_1673076 )
      ( DELIVER-3PKG-VERIFY ?auto_1673075 ?auto_1673077 ?auto_1673078 ?auto_1673076 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1795860 - OBJ
      ?auto_1795862 - OBJ
      ?auto_1795863 - OBJ
      ?auto_1795864 - OBJ
      ?auto_1795865 - OBJ
      ?auto_1795861 - LOCATION
    )
    :vars
    (
      ?auto_1795866 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1795862 ?auto_1795860 ) ( GREATER-THAN ?auto_1795863 ?auto_1795860 ) ( GREATER-THAN ?auto_1795863 ?auto_1795862 ) ( GREATER-THAN ?auto_1795864 ?auto_1795860 ) ( GREATER-THAN ?auto_1795864 ?auto_1795862 ) ( GREATER-THAN ?auto_1795864 ?auto_1795863 ) ( GREATER-THAN ?auto_1795865 ?auto_1795860 ) ( GREATER-THAN ?auto_1795865 ?auto_1795862 ) ( GREATER-THAN ?auto_1795865 ?auto_1795863 ) ( GREATER-THAN ?auto_1795865 ?auto_1795864 ) ( TRUCK-AT ?auto_1795866 ?auto_1795861 ) ( IN-TRUCK ?auto_1795865 ?auto_1795866 ) ( OBJ-AT ?auto_1795860 ?auto_1795861 ) ( OBJ-AT ?auto_1795862 ?auto_1795861 ) ( OBJ-AT ?auto_1795863 ?auto_1795861 ) ( OBJ-AT ?auto_1795864 ?auto_1795861 ) ( not ( = ?auto_1795860 ?auto_1795862 ) ) ( not ( = ?auto_1795860 ?auto_1795863 ) ) ( not ( = ?auto_1795860 ?auto_1795864 ) ) ( not ( = ?auto_1795860 ?auto_1795865 ) ) ( not ( = ?auto_1795862 ?auto_1795863 ) ) ( not ( = ?auto_1795862 ?auto_1795864 ) ) ( not ( = ?auto_1795862 ?auto_1795865 ) ) ( not ( = ?auto_1795863 ?auto_1795864 ) ) ( not ( = ?auto_1795863 ?auto_1795865 ) ) ( not ( = ?auto_1795864 ?auto_1795865 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1795865 ?auto_1795861 )
      ( DELIVER-5PKG-VERIFY ?auto_1795860 ?auto_1795862 ?auto_1795863 ?auto_1795864 ?auto_1795865 ?auto_1795861 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1814348 - OBJ
      ?auto_1814350 - OBJ
      ?auto_1814351 - OBJ
      ?auto_1814352 - OBJ
      ?auto_1814353 - OBJ
      ?auto_1814349 - LOCATION
    )
    :vars
    (
      ?auto_1814356 - TRUCK
      ?auto_1814354 - LOCATION
      ?auto_1814355 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1814350 ?auto_1814348 ) ( GREATER-THAN ?auto_1814351 ?auto_1814348 ) ( GREATER-THAN ?auto_1814351 ?auto_1814350 ) ( GREATER-THAN ?auto_1814352 ?auto_1814348 ) ( GREATER-THAN ?auto_1814352 ?auto_1814350 ) ( GREATER-THAN ?auto_1814352 ?auto_1814351 ) ( GREATER-THAN ?auto_1814353 ?auto_1814348 ) ( GREATER-THAN ?auto_1814353 ?auto_1814350 ) ( GREATER-THAN ?auto_1814353 ?auto_1814351 ) ( GREATER-THAN ?auto_1814353 ?auto_1814352 ) ( IN-TRUCK ?auto_1814353 ?auto_1814356 ) ( TRUCK-AT ?auto_1814356 ?auto_1814354 ) ( IN-CITY ?auto_1814354 ?auto_1814355 ) ( IN-CITY ?auto_1814349 ?auto_1814355 ) ( not ( = ?auto_1814349 ?auto_1814354 ) ) ( OBJ-AT ?auto_1814348 ?auto_1814349 ) ( not ( = ?auto_1814348 ?auto_1814353 ) ) ( OBJ-AT ?auto_1814350 ?auto_1814349 ) ( OBJ-AT ?auto_1814351 ?auto_1814349 ) ( OBJ-AT ?auto_1814352 ?auto_1814349 ) ( not ( = ?auto_1814348 ?auto_1814350 ) ) ( not ( = ?auto_1814348 ?auto_1814351 ) ) ( not ( = ?auto_1814348 ?auto_1814352 ) ) ( not ( = ?auto_1814350 ?auto_1814351 ) ) ( not ( = ?auto_1814350 ?auto_1814352 ) ) ( not ( = ?auto_1814350 ?auto_1814353 ) ) ( not ( = ?auto_1814351 ?auto_1814352 ) ) ( not ( = ?auto_1814351 ?auto_1814353 ) ) ( not ( = ?auto_1814352 ?auto_1814353 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1814348 ?auto_1814353 ?auto_1814349 )
      ( DELIVER-5PKG-VERIFY ?auto_1814348 ?auto_1814350 ?auto_1814351 ?auto_1814352 ?auto_1814353 ?auto_1814349 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1837656 - OBJ
      ?auto_1837658 - OBJ
      ?auto_1837659 - OBJ
      ?auto_1837660 - OBJ
      ?auto_1837661 - OBJ
      ?auto_1837657 - LOCATION
    )
    :vars
    (
      ?auto_1837662 - TRUCK
      ?auto_1837664 - LOCATION
      ?auto_1837663 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1837658 ?auto_1837656 ) ( GREATER-THAN ?auto_1837659 ?auto_1837656 ) ( GREATER-THAN ?auto_1837659 ?auto_1837658 ) ( GREATER-THAN ?auto_1837660 ?auto_1837656 ) ( GREATER-THAN ?auto_1837660 ?auto_1837658 ) ( GREATER-THAN ?auto_1837660 ?auto_1837659 ) ( GREATER-THAN ?auto_1837661 ?auto_1837656 ) ( GREATER-THAN ?auto_1837661 ?auto_1837658 ) ( GREATER-THAN ?auto_1837661 ?auto_1837659 ) ( GREATER-THAN ?auto_1837661 ?auto_1837660 ) ( TRUCK-AT ?auto_1837662 ?auto_1837664 ) ( IN-CITY ?auto_1837664 ?auto_1837663 ) ( IN-CITY ?auto_1837657 ?auto_1837663 ) ( not ( = ?auto_1837657 ?auto_1837664 ) ) ( OBJ-AT ?auto_1837656 ?auto_1837657 ) ( not ( = ?auto_1837656 ?auto_1837661 ) ) ( OBJ-AT ?auto_1837661 ?auto_1837664 ) ( OBJ-AT ?auto_1837658 ?auto_1837657 ) ( OBJ-AT ?auto_1837659 ?auto_1837657 ) ( OBJ-AT ?auto_1837660 ?auto_1837657 ) ( not ( = ?auto_1837656 ?auto_1837658 ) ) ( not ( = ?auto_1837656 ?auto_1837659 ) ) ( not ( = ?auto_1837656 ?auto_1837660 ) ) ( not ( = ?auto_1837658 ?auto_1837659 ) ) ( not ( = ?auto_1837658 ?auto_1837660 ) ) ( not ( = ?auto_1837658 ?auto_1837661 ) ) ( not ( = ?auto_1837659 ?auto_1837660 ) ) ( not ( = ?auto_1837659 ?auto_1837661 ) ) ( not ( = ?auto_1837660 ?auto_1837661 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1837656 ?auto_1837661 ?auto_1837657 )
      ( DELIVER-5PKG-VERIFY ?auto_1837656 ?auto_1837658 ?auto_1837659 ?auto_1837660 ?auto_1837661 ?auto_1837657 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1860964 - OBJ
      ?auto_1860966 - OBJ
      ?auto_1860967 - OBJ
      ?auto_1860968 - OBJ
      ?auto_1860969 - OBJ
      ?auto_1860965 - LOCATION
    )
    :vars
    (
      ?auto_1860970 - LOCATION
      ?auto_1860972 - CITY
      ?auto_1860971 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1860966 ?auto_1860964 ) ( GREATER-THAN ?auto_1860967 ?auto_1860964 ) ( GREATER-THAN ?auto_1860967 ?auto_1860966 ) ( GREATER-THAN ?auto_1860968 ?auto_1860964 ) ( GREATER-THAN ?auto_1860968 ?auto_1860966 ) ( GREATER-THAN ?auto_1860968 ?auto_1860967 ) ( GREATER-THAN ?auto_1860969 ?auto_1860964 ) ( GREATER-THAN ?auto_1860969 ?auto_1860966 ) ( GREATER-THAN ?auto_1860969 ?auto_1860967 ) ( GREATER-THAN ?auto_1860969 ?auto_1860968 ) ( IN-CITY ?auto_1860970 ?auto_1860972 ) ( IN-CITY ?auto_1860965 ?auto_1860972 ) ( not ( = ?auto_1860965 ?auto_1860970 ) ) ( OBJ-AT ?auto_1860964 ?auto_1860965 ) ( not ( = ?auto_1860964 ?auto_1860969 ) ) ( OBJ-AT ?auto_1860969 ?auto_1860970 ) ( TRUCK-AT ?auto_1860971 ?auto_1860965 ) ( OBJ-AT ?auto_1860966 ?auto_1860965 ) ( OBJ-AT ?auto_1860967 ?auto_1860965 ) ( OBJ-AT ?auto_1860968 ?auto_1860965 ) ( not ( = ?auto_1860964 ?auto_1860966 ) ) ( not ( = ?auto_1860964 ?auto_1860967 ) ) ( not ( = ?auto_1860964 ?auto_1860968 ) ) ( not ( = ?auto_1860966 ?auto_1860967 ) ) ( not ( = ?auto_1860966 ?auto_1860968 ) ) ( not ( = ?auto_1860966 ?auto_1860969 ) ) ( not ( = ?auto_1860967 ?auto_1860968 ) ) ( not ( = ?auto_1860967 ?auto_1860969 ) ) ( not ( = ?auto_1860968 ?auto_1860969 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1860964 ?auto_1860969 ?auto_1860965 )
      ( DELIVER-5PKG-VERIFY ?auto_1860964 ?auto_1860966 ?auto_1860967 ?auto_1860968 ?auto_1860969 ?auto_1860965 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1903918 - OBJ
      ?auto_1903920 - OBJ
      ?auto_1903921 - OBJ
      ?auto_1903922 - OBJ
      ?auto_1903919 - LOCATION
    )
    :vars
    (
      ?auto_1903926 - LOCATION
      ?auto_1903925 - CITY
      ?auto_1903923 - TRUCK
      ?auto_1903924 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1903920 ?auto_1903918 ) ( GREATER-THAN ?auto_1903921 ?auto_1903918 ) ( GREATER-THAN ?auto_1903921 ?auto_1903920 ) ( GREATER-THAN ?auto_1903922 ?auto_1903918 ) ( GREATER-THAN ?auto_1903922 ?auto_1903920 ) ( GREATER-THAN ?auto_1903922 ?auto_1903921 ) ( IN-CITY ?auto_1903926 ?auto_1903925 ) ( IN-CITY ?auto_1903919 ?auto_1903925 ) ( not ( = ?auto_1903919 ?auto_1903926 ) ) ( OBJ-AT ?auto_1903918 ?auto_1903919 ) ( not ( = ?auto_1903918 ?auto_1903922 ) ) ( OBJ-AT ?auto_1903922 ?auto_1903926 ) ( TRUCK-AT ?auto_1903923 ?auto_1903924 ) ( IN-CITY ?auto_1903924 ?auto_1903925 ) ( not ( = ?auto_1903919 ?auto_1903924 ) ) ( not ( = ?auto_1903926 ?auto_1903924 ) ) ( OBJ-AT ?auto_1903920 ?auto_1903919 ) ( OBJ-AT ?auto_1903921 ?auto_1903919 ) ( not ( = ?auto_1903918 ?auto_1903920 ) ) ( not ( = ?auto_1903918 ?auto_1903921 ) ) ( not ( = ?auto_1903920 ?auto_1903921 ) ) ( not ( = ?auto_1903920 ?auto_1903922 ) ) ( not ( = ?auto_1903921 ?auto_1903922 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1903918 ?auto_1903922 ?auto_1903919 )
      ( DELIVER-4PKG-VERIFY ?auto_1903918 ?auto_1903920 ?auto_1903921 ?auto_1903922 ?auto_1903919 ) )
  )

)

