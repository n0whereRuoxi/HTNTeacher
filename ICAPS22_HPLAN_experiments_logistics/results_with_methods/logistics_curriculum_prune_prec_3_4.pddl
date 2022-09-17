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
      ?auto_682 - OBJ
      ?auto_683 - LOCATION
    )
    :vars
    (
      ?auto_692 - LOCATION
      ?auto_689 - CITY
      ?auto_684 - TRUCK
      ?auto_695 - LOCATION
      ?auto_696 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_692 ?auto_689 ) ( IN-CITY ?auto_683 ?auto_689 ) ( not ( = ?auto_683 ?auto_692 ) ) ( OBJ-AT ?auto_682 ?auto_692 ) ( TRUCK-AT ?auto_684 ?auto_695 ) ( IN-CITY ?auto_695 ?auto_696 ) ( IN-CITY ?auto_692 ?auto_696 ) ( not ( = ?auto_692 ?auto_695 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_684 ?auto_695 ?auto_692 ?auto_696 )
      ( !LOAD-TRUCK ?auto_682 ?auto_684 ?auto_692 )
      ( !DRIVE-TRUCK ?auto_684 ?auto_692 ?auto_683 ?auto_689 )
      ( !UNLOAD-TRUCK ?auto_682 ?auto_684 ?auto_683 )
      ( DELIVER-1PKG-VERIFY ?auto_682 ?auto_683 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_719 - OBJ
      ?auto_721 - OBJ
      ?auto_723 - LOCATION
    )
    :vars
    (
      ?auto_727 - LOCATION
      ?auto_724 - CITY
      ?auto_728 - CITY
      ?auto_732 - LOCATION
      ?auto_729 - CITY
      ?auto_722 - TRUCK
      ?auto_734 - LOCATION
      ?auto_731 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_721 ?auto_719 ) ( IN-CITY ?auto_727 ?auto_724 ) ( IN-CITY ?auto_723 ?auto_724 ) ( not ( = ?auto_723 ?auto_727 ) ) ( OBJ-AT ?auto_721 ?auto_727 ) ( IN-CITY ?auto_723 ?auto_728 ) ( IN-CITY ?auto_727 ?auto_728 ) ( IN-CITY ?auto_732 ?auto_729 ) ( IN-CITY ?auto_723 ?auto_729 ) ( not ( = ?auto_723 ?auto_732 ) ) ( OBJ-AT ?auto_719 ?auto_732 ) ( TRUCK-AT ?auto_722 ?auto_734 ) ( IN-CITY ?auto_734 ?auto_731 ) ( IN-CITY ?auto_732 ?auto_731 ) ( not ( = ?auto_732 ?auto_734 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_719 ?auto_723 )
      ( DELIVER-1PKG ?auto_721 ?auto_723 )
      ( DELIVER-2PKG-VERIFY ?auto_719 ?auto_721 ?auto_723 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_758 - OBJ
      ?auto_760 - OBJ
      ?auto_761 - OBJ
      ?auto_766 - LOCATION
    )
    :vars
    (
      ?auto_768 - LOCATION
      ?auto_763 - CITY
      ?auto_762 - CITY
      ?auto_778 - LOCATION
      ?auto_775 - CITY
      ?auto_777 - CITY
      ?auto_773 - LOCATION
      ?auto_770 - CITY
      ?auto_767 - TRUCK
      ?auto_771 - LOCATION
      ?auto_769 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_760 ?auto_758 ) ( GREATER-THAN ?auto_761 ?auto_758 ) ( GREATER-THAN ?auto_761 ?auto_760 ) ( IN-CITY ?auto_768 ?auto_763 ) ( IN-CITY ?auto_766 ?auto_763 ) ( not ( = ?auto_766 ?auto_768 ) ) ( OBJ-AT ?auto_761 ?auto_768 ) ( IN-CITY ?auto_766 ?auto_762 ) ( IN-CITY ?auto_768 ?auto_762 ) ( IN-CITY ?auto_778 ?auto_775 ) ( IN-CITY ?auto_766 ?auto_775 ) ( not ( = ?auto_766 ?auto_778 ) ) ( OBJ-AT ?auto_760 ?auto_778 ) ( IN-CITY ?auto_766 ?auto_777 ) ( IN-CITY ?auto_778 ?auto_777 ) ( IN-CITY ?auto_773 ?auto_770 ) ( IN-CITY ?auto_766 ?auto_770 ) ( not ( = ?auto_766 ?auto_773 ) ) ( OBJ-AT ?auto_758 ?auto_773 ) ( TRUCK-AT ?auto_767 ?auto_771 ) ( IN-CITY ?auto_771 ?auto_769 ) ( IN-CITY ?auto_773 ?auto_769 ) ( not ( = ?auto_773 ?auto_771 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_758 ?auto_760 ?auto_766 )
      ( DELIVER-1PKG ?auto_761 ?auto_766 )
      ( DELIVER-3PKG-VERIFY ?auto_758 ?auto_760 ?auto_761 ?auto_766 ) )
  )

)

