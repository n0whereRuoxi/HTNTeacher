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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_582 - OBJ
      ?auto_583 - LOCATION
    )
    :vars
    (
      ?auto_592 - LOCATION
      ?auto_589 - CITY
      ?auto_584 - TRUCK
      ?auto_595 - LOCATION
      ?auto_596 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_592 ?auto_589 ) ( IN-CITY ?auto_583 ?auto_589 ) ( not ( = ?auto_583 ?auto_592 ) ) ( OBJ-AT ?auto_582 ?auto_592 ) ( TRUCK-AT ?auto_584 ?auto_595 ) ( IN-CITY ?auto_595 ?auto_596 ) ( IN-CITY ?auto_592 ?auto_596 ) ( not ( = ?auto_592 ?auto_595 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_584 ?auto_595 ?auto_592 ?auto_596 )
      ( !LOAD-TRUCK ?auto_582 ?auto_584 ?auto_592 )
      ( !DRIVE-TRUCK ?auto_584 ?auto_592 ?auto_583 ?auto_589 )
      ( !UNLOAD-TRUCK ?auto_582 ?auto_584 ?auto_583 )
      ( DELIVER-1PKG-VERIFY ?auto_582 ?auto_583 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_619 - OBJ
      ?auto_621 - OBJ
      ?auto_628 - LOCATION
    )
    :vars
    (
      ?auto_627 - LOCATION
      ?auto_625 - CITY
      ?auto_624 - CITY
      ?auto_634 - LOCATION
      ?auto_633 - CITY
      ?auto_623 - TRUCK
      ?auto_635 - LOCATION
      ?auto_630 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_621 ?auto_619 ) ( IN-CITY ?auto_627 ?auto_625 ) ( IN-CITY ?auto_628 ?auto_625 ) ( not ( = ?auto_628 ?auto_627 ) ) ( OBJ-AT ?auto_621 ?auto_627 ) ( IN-CITY ?auto_628 ?auto_624 ) ( IN-CITY ?auto_627 ?auto_624 ) ( IN-CITY ?auto_634 ?auto_633 ) ( IN-CITY ?auto_628 ?auto_633 ) ( not ( = ?auto_628 ?auto_634 ) ) ( OBJ-AT ?auto_619 ?auto_634 ) ( TRUCK-AT ?auto_623 ?auto_635 ) ( IN-CITY ?auto_635 ?auto_630 ) ( IN-CITY ?auto_634 ?auto_630 ) ( not ( = ?auto_634 ?auto_635 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_619 ?auto_628 )
      ( DELIVER-1PKG ?auto_621 ?auto_628 )
      ( DELIVER-2PKG-VERIFY ?auto_619 ?auto_621 ?auto_628 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_658 - OBJ
      ?auto_660 - OBJ
      ?auto_661 - OBJ
      ?auto_664 - LOCATION
    )
    :vars
    (
      ?auto_668 - LOCATION
      ?auto_665 - CITY
      ?auto_666 - CITY
      ?auto_678 - LOCATION
      ?auto_669 - CITY
      ?auto_670 - CITY
      ?auto_675 - LOCATION
      ?auto_674 - CITY
      ?auto_663 - TRUCK
      ?auto_676 - LOCATION
      ?auto_673 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_660 ?auto_658 ) ( GREATER-THAN ?auto_661 ?auto_658 ) ( GREATER-THAN ?auto_661 ?auto_660 ) ( IN-CITY ?auto_668 ?auto_665 ) ( IN-CITY ?auto_664 ?auto_665 ) ( not ( = ?auto_664 ?auto_668 ) ) ( OBJ-AT ?auto_661 ?auto_668 ) ( IN-CITY ?auto_664 ?auto_666 ) ( IN-CITY ?auto_668 ?auto_666 ) ( IN-CITY ?auto_678 ?auto_669 ) ( IN-CITY ?auto_664 ?auto_669 ) ( not ( = ?auto_664 ?auto_678 ) ) ( OBJ-AT ?auto_660 ?auto_678 ) ( IN-CITY ?auto_664 ?auto_670 ) ( IN-CITY ?auto_678 ?auto_670 ) ( IN-CITY ?auto_675 ?auto_674 ) ( IN-CITY ?auto_664 ?auto_674 ) ( not ( = ?auto_664 ?auto_675 ) ) ( OBJ-AT ?auto_658 ?auto_675 ) ( TRUCK-AT ?auto_663 ?auto_676 ) ( IN-CITY ?auto_676 ?auto_673 ) ( IN-CITY ?auto_675 ?auto_673 ) ( not ( = ?auto_675 ?auto_676 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_658 ?auto_660 ?auto_664 )
      ( DELIVER-1PKG ?auto_661 ?auto_664 )
      ( DELIVER-3PKG-VERIFY ?auto_658 ?auto_660 ?auto_661 ?auto_664 ) )
  )

)

