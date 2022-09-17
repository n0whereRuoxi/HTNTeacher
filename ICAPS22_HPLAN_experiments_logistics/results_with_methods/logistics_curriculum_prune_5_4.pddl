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
      ?auto_187854 - OBJ
      ?auto_187853 - LOCATION
    )
    :vars
    (
      ?auto_187856 - LOCATION
      ?auto_187857 - CITY
      ?auto_187855 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187856 ?auto_187857 ) ( IN-CITY ?auto_187853 ?auto_187857 ) ( not ( = ?auto_187853 ?auto_187856 ) ) ( OBJ-AT ?auto_187854 ?auto_187856 ) ( TRUCK-AT ?auto_187855 ?auto_187853 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_187855 ?auto_187853 ?auto_187856 ?auto_187857 )
      ( !LOAD-TRUCK ?auto_187854 ?auto_187855 ?auto_187856 )
      ( !DRIVE-TRUCK ?auto_187855 ?auto_187856 ?auto_187853 ?auto_187857 )
      ( !UNLOAD-TRUCK ?auto_187854 ?auto_187855 ?auto_187853 )
      ( DELIVER-1PKG-VERIFY ?auto_187854 ?auto_187853 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_187875 - OBJ
      ?auto_187876 - OBJ
      ?auto_187874 - LOCATION
    )
    :vars
    (
      ?auto_187877 - LOCATION
      ?auto_187878 - CITY
      ?auto_187880 - LOCATION
      ?auto_187879 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187877 ?auto_187878 ) ( IN-CITY ?auto_187874 ?auto_187878 ) ( not ( = ?auto_187874 ?auto_187877 ) ) ( OBJ-AT ?auto_187876 ?auto_187877 ) ( IN-CITY ?auto_187880 ?auto_187878 ) ( not ( = ?auto_187874 ?auto_187880 ) ) ( OBJ-AT ?auto_187875 ?auto_187880 ) ( TRUCK-AT ?auto_187879 ?auto_187874 ) ( not ( = ?auto_187875 ?auto_187876 ) ) ( not ( = ?auto_187877 ?auto_187880 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_187875 ?auto_187874 )
      ( DELIVER-1PKG ?auto_187876 ?auto_187874 )
      ( DELIVER-2PKG-VERIFY ?auto_187875 ?auto_187876 ?auto_187874 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_187986 - OBJ
      ?auto_187987 - OBJ
      ?auto_187988 - OBJ
      ?auto_187985 - LOCATION
    )
    :vars
    (
      ?auto_187989 - LOCATION
      ?auto_187990 - CITY
      ?auto_187993 - LOCATION
      ?auto_187992 - LOCATION
      ?auto_187991 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187989 ?auto_187990 ) ( IN-CITY ?auto_187985 ?auto_187990 ) ( not ( = ?auto_187985 ?auto_187989 ) ) ( OBJ-AT ?auto_187988 ?auto_187989 ) ( IN-CITY ?auto_187993 ?auto_187990 ) ( not ( = ?auto_187985 ?auto_187993 ) ) ( OBJ-AT ?auto_187987 ?auto_187993 ) ( IN-CITY ?auto_187992 ?auto_187990 ) ( not ( = ?auto_187985 ?auto_187992 ) ) ( OBJ-AT ?auto_187986 ?auto_187992 ) ( TRUCK-AT ?auto_187991 ?auto_187985 ) ( not ( = ?auto_187986 ?auto_187987 ) ) ( not ( = ?auto_187993 ?auto_187992 ) ) ( not ( = ?auto_187986 ?auto_187988 ) ) ( not ( = ?auto_187987 ?auto_187988 ) ) ( not ( = ?auto_187989 ?auto_187993 ) ) ( not ( = ?auto_187989 ?auto_187992 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_187986 ?auto_187987 ?auto_187985 )
      ( DELIVER-1PKG ?auto_187988 ?auto_187985 )
      ( DELIVER-3PKG-VERIFY ?auto_187986 ?auto_187987 ?auto_187988 ?auto_187985 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_189129 - OBJ
      ?auto_189130 - OBJ
      ?auto_189131 - OBJ
      ?auto_189132 - OBJ
      ?auto_189128 - LOCATION
    )
    :vars
    (
      ?auto_189133 - LOCATION
      ?auto_189134 - CITY
      ?auto_189138 - LOCATION
      ?auto_189137 - LOCATION
      ?auto_189136 - LOCATION
      ?auto_189135 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_189133 ?auto_189134 ) ( IN-CITY ?auto_189128 ?auto_189134 ) ( not ( = ?auto_189128 ?auto_189133 ) ) ( OBJ-AT ?auto_189132 ?auto_189133 ) ( IN-CITY ?auto_189138 ?auto_189134 ) ( not ( = ?auto_189128 ?auto_189138 ) ) ( OBJ-AT ?auto_189131 ?auto_189138 ) ( IN-CITY ?auto_189137 ?auto_189134 ) ( not ( = ?auto_189128 ?auto_189137 ) ) ( OBJ-AT ?auto_189130 ?auto_189137 ) ( IN-CITY ?auto_189136 ?auto_189134 ) ( not ( = ?auto_189128 ?auto_189136 ) ) ( OBJ-AT ?auto_189129 ?auto_189136 ) ( TRUCK-AT ?auto_189135 ?auto_189128 ) ( not ( = ?auto_189129 ?auto_189130 ) ) ( not ( = ?auto_189137 ?auto_189136 ) ) ( not ( = ?auto_189129 ?auto_189131 ) ) ( not ( = ?auto_189130 ?auto_189131 ) ) ( not ( = ?auto_189138 ?auto_189137 ) ) ( not ( = ?auto_189138 ?auto_189136 ) ) ( not ( = ?auto_189129 ?auto_189132 ) ) ( not ( = ?auto_189130 ?auto_189132 ) ) ( not ( = ?auto_189131 ?auto_189132 ) ) ( not ( = ?auto_189133 ?auto_189138 ) ) ( not ( = ?auto_189133 ?auto_189137 ) ) ( not ( = ?auto_189133 ?auto_189136 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_189129 ?auto_189130 ?auto_189131 ?auto_189128 )
      ( DELIVER-1PKG ?auto_189132 ?auto_189128 )
      ( DELIVER-4PKG-VERIFY ?auto_189129 ?auto_189130 ?auto_189131 ?auto_189132 ?auto_189128 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_204821 - OBJ
      ?auto_204822 - OBJ
      ?auto_204823 - OBJ
      ?auto_204824 - OBJ
      ?auto_204825 - OBJ
      ?auto_204820 - LOCATION
    )
    :vars
    (
      ?auto_204826 - LOCATION
      ?auto_204827 - CITY
      ?auto_204830 - LOCATION
      ?auto_204831 - LOCATION
      ?auto_204832 - LOCATION
      ?auto_204829 - LOCATION
      ?auto_204828 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_204826 ?auto_204827 ) ( IN-CITY ?auto_204820 ?auto_204827 ) ( not ( = ?auto_204820 ?auto_204826 ) ) ( OBJ-AT ?auto_204825 ?auto_204826 ) ( IN-CITY ?auto_204830 ?auto_204827 ) ( not ( = ?auto_204820 ?auto_204830 ) ) ( OBJ-AT ?auto_204824 ?auto_204830 ) ( IN-CITY ?auto_204831 ?auto_204827 ) ( not ( = ?auto_204820 ?auto_204831 ) ) ( OBJ-AT ?auto_204823 ?auto_204831 ) ( IN-CITY ?auto_204832 ?auto_204827 ) ( not ( = ?auto_204820 ?auto_204832 ) ) ( OBJ-AT ?auto_204822 ?auto_204832 ) ( IN-CITY ?auto_204829 ?auto_204827 ) ( not ( = ?auto_204820 ?auto_204829 ) ) ( OBJ-AT ?auto_204821 ?auto_204829 ) ( TRUCK-AT ?auto_204828 ?auto_204820 ) ( not ( = ?auto_204821 ?auto_204822 ) ) ( not ( = ?auto_204832 ?auto_204829 ) ) ( not ( = ?auto_204821 ?auto_204823 ) ) ( not ( = ?auto_204822 ?auto_204823 ) ) ( not ( = ?auto_204831 ?auto_204832 ) ) ( not ( = ?auto_204831 ?auto_204829 ) ) ( not ( = ?auto_204821 ?auto_204824 ) ) ( not ( = ?auto_204822 ?auto_204824 ) ) ( not ( = ?auto_204823 ?auto_204824 ) ) ( not ( = ?auto_204830 ?auto_204831 ) ) ( not ( = ?auto_204830 ?auto_204832 ) ) ( not ( = ?auto_204830 ?auto_204829 ) ) ( not ( = ?auto_204821 ?auto_204825 ) ) ( not ( = ?auto_204822 ?auto_204825 ) ) ( not ( = ?auto_204823 ?auto_204825 ) ) ( not ( = ?auto_204824 ?auto_204825 ) ) ( not ( = ?auto_204826 ?auto_204830 ) ) ( not ( = ?auto_204826 ?auto_204831 ) ) ( not ( = ?auto_204826 ?auto_204832 ) ) ( not ( = ?auto_204826 ?auto_204829 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_204821 ?auto_204822 ?auto_204823 ?auto_204824 ?auto_204820 )
      ( DELIVER-1PKG ?auto_204825 ?auto_204820 )
      ( DELIVER-5PKG-VERIFY ?auto_204821 ?auto_204822 ?auto_204823 ?auto_204824 ?auto_204825 ?auto_204820 ) )
  )

)

