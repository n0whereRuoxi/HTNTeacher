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
      ?auto_754 - OBJ
      ?auto_753 - LOCATION
    )
    :vars
    (
      ?auto_756 - LOCATION
      ?auto_757 - CITY
      ?auto_755 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_756 ?auto_757 ) ( IN-CITY ?auto_753 ?auto_757 ) ( not ( = ?auto_753 ?auto_756 ) ) ( OBJ-AT ?auto_754 ?auto_756 ) ( TRUCK-AT ?auto_755 ?auto_753 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_755 ?auto_753 ?auto_756 ?auto_757 )
      ( !LOAD-TRUCK ?auto_754 ?auto_755 ?auto_756 )
      ( !DRIVE-TRUCK ?auto_755 ?auto_756 ?auto_753 ?auto_757 )
      ( !UNLOAD-TRUCK ?auto_754 ?auto_755 ?auto_753 )
      ( DELIVER-1PKG-VERIFY ?auto_754 ?auto_753 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_775 - OBJ
      ?auto_776 - OBJ
      ?auto_774 - LOCATION
    )
    :vars
    (
      ?auto_778 - LOCATION
      ?auto_777 - CITY
      ?auto_779 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_778 ?auto_777 ) ( IN-CITY ?auto_774 ?auto_777 ) ( not ( = ?auto_774 ?auto_778 ) ) ( OBJ-AT ?auto_776 ?auto_778 ) ( OBJ-AT ?auto_775 ?auto_778 ) ( TRUCK-AT ?auto_779 ?auto_774 ) ( not ( = ?auto_775 ?auto_776 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_775 ?auto_774 )
      ( DELIVER-1PKG ?auto_776 ?auto_774 )
      ( DELIVER-2PKG-VERIFY ?auto_775 ?auto_776 ?auto_774 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_883 - OBJ
      ?auto_884 - OBJ
      ?auto_885 - OBJ
      ?auto_882 - LOCATION
    )
    :vars
    (
      ?auto_887 - LOCATION
      ?auto_888 - CITY
      ?auto_889 - LOCATION
      ?auto_886 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_887 ?auto_888 ) ( IN-CITY ?auto_882 ?auto_888 ) ( not ( = ?auto_882 ?auto_887 ) ) ( OBJ-AT ?auto_885 ?auto_887 ) ( IN-CITY ?auto_889 ?auto_888 ) ( not ( = ?auto_882 ?auto_889 ) ) ( OBJ-AT ?auto_884 ?auto_889 ) ( OBJ-AT ?auto_883 ?auto_889 ) ( TRUCK-AT ?auto_886 ?auto_882 ) ( not ( = ?auto_883 ?auto_884 ) ) ( not ( = ?auto_883 ?auto_885 ) ) ( not ( = ?auto_884 ?auto_885 ) ) ( not ( = ?auto_887 ?auto_889 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_883 ?auto_884 ?auto_882 )
      ( DELIVER-1PKG ?auto_885 ?auto_882 )
      ( DELIVER-3PKG-VERIFY ?auto_883 ?auto_884 ?auto_885 ?auto_882 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_900 - OBJ
      ?auto_901 - OBJ
      ?auto_902 - OBJ
      ?auto_899 - LOCATION
    )
    :vars
    (
      ?auto_904 - LOCATION
      ?auto_903 - CITY
      ?auto_906 - LOCATION
      ?auto_905 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_904 ?auto_903 ) ( IN-CITY ?auto_899 ?auto_903 ) ( not ( = ?auto_899 ?auto_904 ) ) ( OBJ-AT ?auto_901 ?auto_904 ) ( IN-CITY ?auto_906 ?auto_903 ) ( not ( = ?auto_899 ?auto_906 ) ) ( OBJ-AT ?auto_902 ?auto_906 ) ( OBJ-AT ?auto_900 ?auto_906 ) ( TRUCK-AT ?auto_905 ?auto_899 ) ( not ( = ?auto_900 ?auto_902 ) ) ( not ( = ?auto_900 ?auto_901 ) ) ( not ( = ?auto_902 ?auto_901 ) ) ( not ( = ?auto_904 ?auto_906 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_900 ?auto_902 ?auto_901 ?auto_899 )
      ( DELIVER-3PKG-VERIFY ?auto_900 ?auto_901 ?auto_902 ?auto_899 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_961 - OBJ
      ?auto_962 - OBJ
      ?auto_963 - OBJ
      ?auto_960 - LOCATION
    )
    :vars
    (
      ?auto_964 - LOCATION
      ?auto_965 - CITY
      ?auto_967 - LOCATION
      ?auto_966 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_964 ?auto_965 ) ( IN-CITY ?auto_960 ?auto_965 ) ( not ( = ?auto_960 ?auto_964 ) ) ( OBJ-AT ?auto_961 ?auto_964 ) ( IN-CITY ?auto_967 ?auto_965 ) ( not ( = ?auto_960 ?auto_967 ) ) ( OBJ-AT ?auto_963 ?auto_967 ) ( OBJ-AT ?auto_962 ?auto_967 ) ( TRUCK-AT ?auto_966 ?auto_960 ) ( not ( = ?auto_962 ?auto_963 ) ) ( not ( = ?auto_962 ?auto_961 ) ) ( not ( = ?auto_963 ?auto_961 ) ) ( not ( = ?auto_964 ?auto_967 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_962 ?auto_961 ?auto_963 ?auto_960 )
      ( DELIVER-3PKG-VERIFY ?auto_961 ?auto_962 ?auto_963 ?auto_960 ) )
  )

)

