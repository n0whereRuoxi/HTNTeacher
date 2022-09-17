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
      ?auto_30050012 - OBJ
      ?auto_30050013 - LOCATION
    )
    :vars
    (
      ?auto_30050014 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_30050014 ?auto_30050013 ) ( IN-TRUCK ?auto_30050012 ?auto_30050014 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_30050012 ?auto_30050014 ?auto_30050013 )
      ( DELIVER-1PKG-VERIFY ?auto_30050012 ?auto_30050013 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_30050045 - OBJ
      ?auto_30050046 - LOCATION
    )
    :vars
    (
      ?auto_30050047 - TRUCK
      ?auto_30050048 - LOCATION
      ?auto_30050049 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_30050045 ?auto_30050047 ) ( TRUCK-AT ?auto_30050047 ?auto_30050048 ) ( IN-CITY ?auto_30050048 ?auto_30050049 ) ( IN-CITY ?auto_30050046 ?auto_30050049 ) ( not ( = ?auto_30050046 ?auto_30050048 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_30050047 ?auto_30050048 ?auto_30050046 ?auto_30050049 )
      ( DELIVER-1PKG ?auto_30050045 ?auto_30050046 )
      ( DELIVER-1PKG-VERIFY ?auto_30050045 ?auto_30050046 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_30050090 - OBJ
      ?auto_30050091 - LOCATION
    )
    :vars
    (
      ?auto_30050094 - TRUCK
      ?auto_30050092 - LOCATION
      ?auto_30050093 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_30050094 ?auto_30050092 ) ( IN-CITY ?auto_30050092 ?auto_30050093 ) ( IN-CITY ?auto_30050091 ?auto_30050093 ) ( not ( = ?auto_30050091 ?auto_30050092 ) ) ( OBJ-AT ?auto_30050090 ?auto_30050092 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_30050090 ?auto_30050094 ?auto_30050092 )
      ( DELIVER-1PKG ?auto_30050090 ?auto_30050091 )
      ( DELIVER-1PKG-VERIFY ?auto_30050090 ?auto_30050091 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_30050135 - OBJ
      ?auto_30050136 - LOCATION
    )
    :vars
    (
      ?auto_30050139 - LOCATION
      ?auto_30050138 - CITY
      ?auto_30050137 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_30050139 ?auto_30050138 ) ( IN-CITY ?auto_30050136 ?auto_30050138 ) ( not ( = ?auto_30050136 ?auto_30050139 ) ) ( OBJ-AT ?auto_30050135 ?auto_30050139 ) ( TRUCK-AT ?auto_30050137 ?auto_30050136 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_30050137 ?auto_30050136 ?auto_30050139 ?auto_30050138 )
      ( DELIVER-1PKG ?auto_30050135 ?auto_30050136 )
      ( DELIVER-1PKG-VERIFY ?auto_30050135 ?auto_30050136 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_30050924 - OBJ
      ?auto_30050926 - OBJ
      ?auto_30050925 - LOCATION
    )
    :vars
    (
      ?auto_30050927 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30050926 ?auto_30050924 ) ( TRUCK-AT ?auto_30050927 ?auto_30050925 ) ( IN-TRUCK ?auto_30050926 ?auto_30050927 ) ( OBJ-AT ?auto_30050924 ?auto_30050925 ) ( not ( = ?auto_30050924 ?auto_30050926 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30050926 ?auto_30050925 )
      ( DELIVER-2PKG-VERIFY ?auto_30050924 ?auto_30050926 ?auto_30050925 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_30051787 - OBJ
      ?auto_30051789 - OBJ
      ?auto_30051788 - LOCATION
    )
    :vars
    (
      ?auto_30051792 - TRUCK
      ?auto_30051790 - LOCATION
      ?auto_30051791 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30051789 ?auto_30051787 ) ( IN-TRUCK ?auto_30051789 ?auto_30051792 ) ( TRUCK-AT ?auto_30051792 ?auto_30051790 ) ( IN-CITY ?auto_30051790 ?auto_30051791 ) ( IN-CITY ?auto_30051788 ?auto_30051791 ) ( not ( = ?auto_30051788 ?auto_30051790 ) ) ( OBJ-AT ?auto_30051787 ?auto_30051788 ) ( not ( = ?auto_30051787 ?auto_30051789 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30051789 ?auto_30051788 )
      ( DELIVER-2PKG-VERIFY ?auto_30051787 ?auto_30051789 ?auto_30051788 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_30052888 - OBJ
      ?auto_30052889 - LOCATION
    )
    :vars
    (
      ?auto_30052893 - OBJ
      ?auto_30052890 - TRUCK
      ?auto_30052892 - LOCATION
      ?auto_30052891 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30052888 ?auto_30052893 ) ( TRUCK-AT ?auto_30052890 ?auto_30052892 ) ( IN-CITY ?auto_30052892 ?auto_30052891 ) ( IN-CITY ?auto_30052889 ?auto_30052891 ) ( not ( = ?auto_30052889 ?auto_30052892 ) ) ( OBJ-AT ?auto_30052893 ?auto_30052889 ) ( not ( = ?auto_30052893 ?auto_30052888 ) ) ( OBJ-AT ?auto_30052888 ?auto_30052892 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_30052888 ?auto_30052890 ?auto_30052892 )
      ( DELIVER-2PKG ?auto_30052893 ?auto_30052888 ?auto_30052889 )
      ( DELIVER-1PKG-VERIFY ?auto_30052888 ?auto_30052889 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_30052894 - OBJ
      ?auto_30052896 - OBJ
      ?auto_30052895 - LOCATION
    )
    :vars
    (
      ?auto_30052897 - TRUCK
      ?auto_30052899 - LOCATION
      ?auto_30052898 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30052896 ?auto_30052894 ) ( TRUCK-AT ?auto_30052897 ?auto_30052899 ) ( IN-CITY ?auto_30052899 ?auto_30052898 ) ( IN-CITY ?auto_30052895 ?auto_30052898 ) ( not ( = ?auto_30052895 ?auto_30052899 ) ) ( OBJ-AT ?auto_30052894 ?auto_30052895 ) ( not ( = ?auto_30052894 ?auto_30052896 ) ) ( OBJ-AT ?auto_30052896 ?auto_30052899 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30052896 ?auto_30052895 )
      ( DELIVER-2PKG-VERIFY ?auto_30052894 ?auto_30052896 ?auto_30052895 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_30053995 - OBJ
      ?auto_30053996 - LOCATION
    )
    :vars
    (
      ?auto_30053999 - OBJ
      ?auto_30053998 - LOCATION
      ?auto_30053997 - CITY
      ?auto_30054000 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30053995 ?auto_30053999 ) ( IN-CITY ?auto_30053998 ?auto_30053997 ) ( IN-CITY ?auto_30053996 ?auto_30053997 ) ( not ( = ?auto_30053996 ?auto_30053998 ) ) ( OBJ-AT ?auto_30053999 ?auto_30053996 ) ( not ( = ?auto_30053999 ?auto_30053995 ) ) ( OBJ-AT ?auto_30053995 ?auto_30053998 ) ( TRUCK-AT ?auto_30054000 ?auto_30053996 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_30054000 ?auto_30053996 ?auto_30053998 ?auto_30053997 )
      ( DELIVER-2PKG ?auto_30053999 ?auto_30053995 ?auto_30053996 )
      ( DELIVER-1PKG-VERIFY ?auto_30053995 ?auto_30053996 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_30054001 - OBJ
      ?auto_30054003 - OBJ
      ?auto_30054002 - LOCATION
    )
    :vars
    (
      ?auto_30054006 - LOCATION
      ?auto_30054004 - CITY
      ?auto_30054005 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30054003 ?auto_30054001 ) ( IN-CITY ?auto_30054006 ?auto_30054004 ) ( IN-CITY ?auto_30054002 ?auto_30054004 ) ( not ( = ?auto_30054002 ?auto_30054006 ) ) ( OBJ-AT ?auto_30054001 ?auto_30054002 ) ( not ( = ?auto_30054001 ?auto_30054003 ) ) ( OBJ-AT ?auto_30054003 ?auto_30054006 ) ( TRUCK-AT ?auto_30054005 ?auto_30054002 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30054003 ?auto_30054002 )
      ( DELIVER-2PKG-VERIFY ?auto_30054001 ?auto_30054003 ?auto_30054002 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_30055102 - OBJ
      ?auto_30055103 - LOCATION
    )
    :vars
    (
      ?auto_30055106 - OBJ
      ?auto_30055107 - LOCATION
      ?auto_30055105 - CITY
      ?auto_30055104 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30055102 ?auto_30055106 ) ( IN-CITY ?auto_30055107 ?auto_30055105 ) ( IN-CITY ?auto_30055103 ?auto_30055105 ) ( not ( = ?auto_30055103 ?auto_30055107 ) ) ( not ( = ?auto_30055106 ?auto_30055102 ) ) ( OBJ-AT ?auto_30055102 ?auto_30055107 ) ( TRUCK-AT ?auto_30055104 ?auto_30055103 ) ( IN-TRUCK ?auto_30055106 ?auto_30055104 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30055106 ?auto_30055103 )
      ( DELIVER-2PKG ?auto_30055106 ?auto_30055102 ?auto_30055103 )
      ( DELIVER-1PKG-VERIFY ?auto_30055102 ?auto_30055103 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_30055108 - OBJ
      ?auto_30055110 - OBJ
      ?auto_30055109 - LOCATION
    )
    :vars
    (
      ?auto_30055112 - LOCATION
      ?auto_30055111 - CITY
      ?auto_30055113 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30055110 ?auto_30055108 ) ( IN-CITY ?auto_30055112 ?auto_30055111 ) ( IN-CITY ?auto_30055109 ?auto_30055111 ) ( not ( = ?auto_30055109 ?auto_30055112 ) ) ( not ( = ?auto_30055108 ?auto_30055110 ) ) ( OBJ-AT ?auto_30055110 ?auto_30055112 ) ( TRUCK-AT ?auto_30055113 ?auto_30055109 ) ( IN-TRUCK ?auto_30055108 ?auto_30055113 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30055110 ?auto_30055109 )
      ( DELIVER-2PKG-VERIFY ?auto_30055108 ?auto_30055110 ?auto_30055109 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_30056209 - OBJ
      ?auto_30056210 - LOCATION
    )
    :vars
    (
      ?auto_30056214 - OBJ
      ?auto_30056212 - LOCATION
      ?auto_30056213 - CITY
      ?auto_30056211 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30056209 ?auto_30056214 ) ( IN-CITY ?auto_30056212 ?auto_30056213 ) ( IN-CITY ?auto_30056210 ?auto_30056213 ) ( not ( = ?auto_30056210 ?auto_30056212 ) ) ( not ( = ?auto_30056214 ?auto_30056209 ) ) ( OBJ-AT ?auto_30056209 ?auto_30056212 ) ( IN-TRUCK ?auto_30056214 ?auto_30056211 ) ( TRUCK-AT ?auto_30056211 ?auto_30056212 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_30056211 ?auto_30056212 ?auto_30056210 ?auto_30056213 )
      ( DELIVER-2PKG ?auto_30056214 ?auto_30056209 ?auto_30056210 )
      ( DELIVER-1PKG-VERIFY ?auto_30056209 ?auto_30056210 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_30056215 - OBJ
      ?auto_30056217 - OBJ
      ?auto_30056216 - LOCATION
    )
    :vars
    (
      ?auto_30056220 - LOCATION
      ?auto_30056218 - CITY
      ?auto_30056219 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30056217 ?auto_30056215 ) ( IN-CITY ?auto_30056220 ?auto_30056218 ) ( IN-CITY ?auto_30056216 ?auto_30056218 ) ( not ( = ?auto_30056216 ?auto_30056220 ) ) ( not ( = ?auto_30056215 ?auto_30056217 ) ) ( OBJ-AT ?auto_30056217 ?auto_30056220 ) ( IN-TRUCK ?auto_30056215 ?auto_30056219 ) ( TRUCK-AT ?auto_30056219 ?auto_30056220 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30056217 ?auto_30056216 )
      ( DELIVER-2PKG-VERIFY ?auto_30056215 ?auto_30056217 ?auto_30056216 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30065878 - OBJ
      ?auto_30065880 - OBJ
      ?auto_30065881 - OBJ
      ?auto_30065879 - LOCATION
    )
    :vars
    (
      ?auto_30065882 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30065880 ?auto_30065878 ) ( GREATER-THAN ?auto_30065881 ?auto_30065878 ) ( GREATER-THAN ?auto_30065881 ?auto_30065880 ) ( TRUCK-AT ?auto_30065882 ?auto_30065879 ) ( IN-TRUCK ?auto_30065881 ?auto_30065882 ) ( OBJ-AT ?auto_30065878 ?auto_30065879 ) ( OBJ-AT ?auto_30065880 ?auto_30065879 ) ( not ( = ?auto_30065878 ?auto_30065880 ) ) ( not ( = ?auto_30065878 ?auto_30065881 ) ) ( not ( = ?auto_30065880 ?auto_30065881 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30065881 ?auto_30065879 )
      ( DELIVER-3PKG-VERIFY ?auto_30065878 ?auto_30065880 ?auto_30065881 ?auto_30065879 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30073196 - OBJ
      ?auto_30073198 - OBJ
      ?auto_30073199 - OBJ
      ?auto_30073197 - LOCATION
    )
    :vars
    (
      ?auto_30073201 - TRUCK
      ?auto_30073202 - LOCATION
      ?auto_30073200 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30073198 ?auto_30073196 ) ( GREATER-THAN ?auto_30073199 ?auto_30073196 ) ( GREATER-THAN ?auto_30073199 ?auto_30073198 ) ( IN-TRUCK ?auto_30073199 ?auto_30073201 ) ( TRUCK-AT ?auto_30073201 ?auto_30073202 ) ( IN-CITY ?auto_30073202 ?auto_30073200 ) ( IN-CITY ?auto_30073197 ?auto_30073200 ) ( not ( = ?auto_30073197 ?auto_30073202 ) ) ( OBJ-AT ?auto_30073196 ?auto_30073197 ) ( not ( = ?auto_30073196 ?auto_30073199 ) ) ( OBJ-AT ?auto_30073198 ?auto_30073197 ) ( not ( = ?auto_30073196 ?auto_30073198 ) ) ( not ( = ?auto_30073198 ?auto_30073199 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30073196 ?auto_30073199 ?auto_30073197 )
      ( DELIVER-3PKG-VERIFY ?auto_30073196 ?auto_30073198 ?auto_30073199 ?auto_30073197 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30082549 - OBJ
      ?auto_30082551 - OBJ
      ?auto_30082552 - OBJ
      ?auto_30082550 - LOCATION
    )
    :vars
    (
      ?auto_30082554 - TRUCK
      ?auto_30082555 - LOCATION
      ?auto_30082553 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30082551 ?auto_30082549 ) ( GREATER-THAN ?auto_30082552 ?auto_30082549 ) ( GREATER-THAN ?auto_30082552 ?auto_30082551 ) ( TRUCK-AT ?auto_30082554 ?auto_30082555 ) ( IN-CITY ?auto_30082555 ?auto_30082553 ) ( IN-CITY ?auto_30082550 ?auto_30082553 ) ( not ( = ?auto_30082550 ?auto_30082555 ) ) ( OBJ-AT ?auto_30082549 ?auto_30082550 ) ( not ( = ?auto_30082549 ?auto_30082552 ) ) ( OBJ-AT ?auto_30082552 ?auto_30082555 ) ( OBJ-AT ?auto_30082551 ?auto_30082550 ) ( not ( = ?auto_30082549 ?auto_30082551 ) ) ( not ( = ?auto_30082551 ?auto_30082552 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30082549 ?auto_30082552 ?auto_30082550 )
      ( DELIVER-3PKG-VERIFY ?auto_30082549 ?auto_30082551 ?auto_30082552 ?auto_30082550 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30091902 - OBJ
      ?auto_30091904 - OBJ
      ?auto_30091905 - OBJ
      ?auto_30091903 - LOCATION
    )
    :vars
    (
      ?auto_30091907 - LOCATION
      ?auto_30091906 - CITY
      ?auto_30091908 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30091904 ?auto_30091902 ) ( GREATER-THAN ?auto_30091905 ?auto_30091902 ) ( GREATER-THAN ?auto_30091905 ?auto_30091904 ) ( IN-CITY ?auto_30091907 ?auto_30091906 ) ( IN-CITY ?auto_30091903 ?auto_30091906 ) ( not ( = ?auto_30091903 ?auto_30091907 ) ) ( OBJ-AT ?auto_30091902 ?auto_30091903 ) ( not ( = ?auto_30091902 ?auto_30091905 ) ) ( OBJ-AT ?auto_30091905 ?auto_30091907 ) ( TRUCK-AT ?auto_30091908 ?auto_30091903 ) ( OBJ-AT ?auto_30091904 ?auto_30091903 ) ( not ( = ?auto_30091902 ?auto_30091904 ) ) ( not ( = ?auto_30091904 ?auto_30091905 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30091902 ?auto_30091905 ?auto_30091903 )
      ( DELIVER-3PKG-VERIFY ?auto_30091902 ?auto_30091904 ?auto_30091905 ?auto_30091903 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_30110563 - OBJ
      ?auto_30110564 - LOCATION
    )
    :vars
    (
      ?auto_30110568 - OBJ
      ?auto_30110565 - LOCATION
      ?auto_30110566 - CITY
      ?auto_30110567 - TRUCK
      ?auto_30110569 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30110563 ?auto_30110568 ) ( IN-CITY ?auto_30110565 ?auto_30110566 ) ( IN-CITY ?auto_30110564 ?auto_30110566 ) ( not ( = ?auto_30110564 ?auto_30110565 ) ) ( OBJ-AT ?auto_30110568 ?auto_30110564 ) ( not ( = ?auto_30110568 ?auto_30110563 ) ) ( OBJ-AT ?auto_30110563 ?auto_30110565 ) ( TRUCK-AT ?auto_30110567 ?auto_30110569 ) ( IN-CITY ?auto_30110569 ?auto_30110566 ) ( not ( = ?auto_30110564 ?auto_30110569 ) ) ( not ( = ?auto_30110565 ?auto_30110569 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_30110567 ?auto_30110569 ?auto_30110564 ?auto_30110566 )
      ( DELIVER-2PKG ?auto_30110568 ?auto_30110563 ?auto_30110564 )
      ( DELIVER-1PKG-VERIFY ?auto_30110563 ?auto_30110564 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_30110570 - OBJ
      ?auto_30110572 - OBJ
      ?auto_30110571 - LOCATION
    )
    :vars
    (
      ?auto_30110575 - LOCATION
      ?auto_30110573 - CITY
      ?auto_30110576 - TRUCK
      ?auto_30110574 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30110572 ?auto_30110570 ) ( IN-CITY ?auto_30110575 ?auto_30110573 ) ( IN-CITY ?auto_30110571 ?auto_30110573 ) ( not ( = ?auto_30110571 ?auto_30110575 ) ) ( OBJ-AT ?auto_30110570 ?auto_30110571 ) ( not ( = ?auto_30110570 ?auto_30110572 ) ) ( OBJ-AT ?auto_30110572 ?auto_30110575 ) ( TRUCK-AT ?auto_30110576 ?auto_30110574 ) ( IN-CITY ?auto_30110574 ?auto_30110573 ) ( not ( = ?auto_30110571 ?auto_30110574 ) ) ( not ( = ?auto_30110575 ?auto_30110574 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30110572 ?auto_30110571 )
      ( DELIVER-2PKG-VERIFY ?auto_30110570 ?auto_30110572 ?auto_30110571 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_30149900 - OBJ
      ?auto_30149901 - LOCATION
    )
    :vars
    (
      ?auto_30149903 - OBJ
      ?auto_30149905 - LOCATION
      ?auto_30149902 - CITY
      ?auto_30149904 - TRUCK
      ?auto_30149906 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30149900 ?auto_30149903 ) ( IN-CITY ?auto_30149905 ?auto_30149902 ) ( IN-CITY ?auto_30149901 ?auto_30149902 ) ( not ( = ?auto_30149901 ?auto_30149905 ) ) ( not ( = ?auto_30149903 ?auto_30149900 ) ) ( OBJ-AT ?auto_30149900 ?auto_30149905 ) ( IN-TRUCK ?auto_30149903 ?auto_30149904 ) ( TRUCK-AT ?auto_30149904 ?auto_30149906 ) ( IN-CITY ?auto_30149906 ?auto_30149902 ) ( not ( = ?auto_30149901 ?auto_30149906 ) ) ( not ( = ?auto_30149905 ?auto_30149906 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_30149904 ?auto_30149906 ?auto_30149901 ?auto_30149902 )
      ( DELIVER-2PKG ?auto_30149903 ?auto_30149900 ?auto_30149901 )
      ( DELIVER-1PKG-VERIFY ?auto_30149900 ?auto_30149901 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_30149907 - OBJ
      ?auto_30149909 - OBJ
      ?auto_30149908 - LOCATION
    )
    :vars
    (
      ?auto_30149913 - LOCATION
      ?auto_30149911 - CITY
      ?auto_30149912 - TRUCK
      ?auto_30149910 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30149909 ?auto_30149907 ) ( IN-CITY ?auto_30149913 ?auto_30149911 ) ( IN-CITY ?auto_30149908 ?auto_30149911 ) ( not ( = ?auto_30149908 ?auto_30149913 ) ) ( not ( = ?auto_30149907 ?auto_30149909 ) ) ( OBJ-AT ?auto_30149909 ?auto_30149913 ) ( IN-TRUCK ?auto_30149907 ?auto_30149912 ) ( TRUCK-AT ?auto_30149912 ?auto_30149910 ) ( IN-CITY ?auto_30149910 ?auto_30149911 ) ( not ( = ?auto_30149908 ?auto_30149910 ) ) ( not ( = ?auto_30149913 ?auto_30149910 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30149909 ?auto_30149908 )
      ( DELIVER-2PKG-VERIFY ?auto_30149907 ?auto_30149909 ?auto_30149908 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_30160223 - OBJ
      ?auto_30160224 - LOCATION
    )
    :vars
    (
      ?auto_30160228 - OBJ
      ?auto_30160226 - LOCATION
      ?auto_30160227 - CITY
      ?auto_30160225 - TRUCK
      ?auto_30160229 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30160223 ?auto_30160228 ) ( IN-CITY ?auto_30160226 ?auto_30160227 ) ( IN-CITY ?auto_30160224 ?auto_30160227 ) ( not ( = ?auto_30160224 ?auto_30160226 ) ) ( not ( = ?auto_30160228 ?auto_30160223 ) ) ( OBJ-AT ?auto_30160223 ?auto_30160226 ) ( TRUCK-AT ?auto_30160225 ?auto_30160229 ) ( IN-CITY ?auto_30160229 ?auto_30160227 ) ( not ( = ?auto_30160224 ?auto_30160229 ) ) ( not ( = ?auto_30160226 ?auto_30160229 ) ) ( OBJ-AT ?auto_30160228 ?auto_30160229 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_30160228 ?auto_30160225 ?auto_30160229 )
      ( DELIVER-2PKG ?auto_30160228 ?auto_30160223 ?auto_30160224 )
      ( DELIVER-1PKG-VERIFY ?auto_30160223 ?auto_30160224 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_30160230 - OBJ
      ?auto_30160232 - OBJ
      ?auto_30160231 - LOCATION
    )
    :vars
    (
      ?auto_30160235 - LOCATION
      ?auto_30160234 - CITY
      ?auto_30160233 - TRUCK
      ?auto_30160236 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30160232 ?auto_30160230 ) ( IN-CITY ?auto_30160235 ?auto_30160234 ) ( IN-CITY ?auto_30160231 ?auto_30160234 ) ( not ( = ?auto_30160231 ?auto_30160235 ) ) ( not ( = ?auto_30160230 ?auto_30160232 ) ) ( OBJ-AT ?auto_30160232 ?auto_30160235 ) ( TRUCK-AT ?auto_30160233 ?auto_30160236 ) ( IN-CITY ?auto_30160236 ?auto_30160234 ) ( not ( = ?auto_30160231 ?auto_30160236 ) ) ( not ( = ?auto_30160235 ?auto_30160236 ) ) ( OBJ-AT ?auto_30160230 ?auto_30160236 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30160232 ?auto_30160231 )
      ( DELIVER-2PKG-VERIFY ?auto_30160230 ?auto_30160232 ?auto_30160231 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30209342 - OBJ
      ?auto_30209344 - OBJ
      ?auto_30209345 - OBJ
      ?auto_30209346 - OBJ
      ?auto_30209343 - LOCATION
    )
    :vars
    (
      ?auto_30209347 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30209344 ?auto_30209342 ) ( GREATER-THAN ?auto_30209345 ?auto_30209342 ) ( GREATER-THAN ?auto_30209345 ?auto_30209344 ) ( GREATER-THAN ?auto_30209346 ?auto_30209342 ) ( GREATER-THAN ?auto_30209346 ?auto_30209344 ) ( GREATER-THAN ?auto_30209346 ?auto_30209345 ) ( TRUCK-AT ?auto_30209347 ?auto_30209343 ) ( IN-TRUCK ?auto_30209346 ?auto_30209347 ) ( OBJ-AT ?auto_30209342 ?auto_30209343 ) ( OBJ-AT ?auto_30209344 ?auto_30209343 ) ( OBJ-AT ?auto_30209345 ?auto_30209343 ) ( not ( = ?auto_30209342 ?auto_30209344 ) ) ( not ( = ?auto_30209342 ?auto_30209345 ) ) ( not ( = ?auto_30209342 ?auto_30209346 ) ) ( not ( = ?auto_30209344 ?auto_30209345 ) ) ( not ( = ?auto_30209344 ?auto_30209346 ) ) ( not ( = ?auto_30209345 ?auto_30209346 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30209346 ?auto_30209343 )
      ( DELIVER-4PKG-VERIFY ?auto_30209342 ?auto_30209344 ?auto_30209345 ?auto_30209346 ?auto_30209343 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30243128 - OBJ
      ?auto_30243130 - OBJ
      ?auto_30243131 - OBJ
      ?auto_30243132 - OBJ
      ?auto_30243129 - LOCATION
    )
    :vars
    (
      ?auto_30243133 - TRUCK
      ?auto_30243134 - LOCATION
      ?auto_30243135 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30243130 ?auto_30243128 ) ( GREATER-THAN ?auto_30243131 ?auto_30243128 ) ( GREATER-THAN ?auto_30243131 ?auto_30243130 ) ( GREATER-THAN ?auto_30243132 ?auto_30243128 ) ( GREATER-THAN ?auto_30243132 ?auto_30243130 ) ( GREATER-THAN ?auto_30243132 ?auto_30243131 ) ( IN-TRUCK ?auto_30243132 ?auto_30243133 ) ( TRUCK-AT ?auto_30243133 ?auto_30243134 ) ( IN-CITY ?auto_30243134 ?auto_30243135 ) ( IN-CITY ?auto_30243129 ?auto_30243135 ) ( not ( = ?auto_30243129 ?auto_30243134 ) ) ( OBJ-AT ?auto_30243128 ?auto_30243129 ) ( not ( = ?auto_30243128 ?auto_30243132 ) ) ( OBJ-AT ?auto_30243130 ?auto_30243129 ) ( OBJ-AT ?auto_30243131 ?auto_30243129 ) ( not ( = ?auto_30243128 ?auto_30243130 ) ) ( not ( = ?auto_30243128 ?auto_30243131 ) ) ( not ( = ?auto_30243130 ?auto_30243131 ) ) ( not ( = ?auto_30243130 ?auto_30243132 ) ) ( not ( = ?auto_30243131 ?auto_30243132 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30243128 ?auto_30243132 ?auto_30243129 )
      ( DELIVER-4PKG-VERIFY ?auto_30243128 ?auto_30243130 ?auto_30243131 ?auto_30243132 ?auto_30243129 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30286484 - OBJ
      ?auto_30286486 - OBJ
      ?auto_30286487 - OBJ
      ?auto_30286488 - OBJ
      ?auto_30286485 - LOCATION
    )
    :vars
    (
      ?auto_30286489 - TRUCK
      ?auto_30286490 - LOCATION
      ?auto_30286491 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30286486 ?auto_30286484 ) ( GREATER-THAN ?auto_30286487 ?auto_30286484 ) ( GREATER-THAN ?auto_30286487 ?auto_30286486 ) ( GREATER-THAN ?auto_30286488 ?auto_30286484 ) ( GREATER-THAN ?auto_30286488 ?auto_30286486 ) ( GREATER-THAN ?auto_30286488 ?auto_30286487 ) ( TRUCK-AT ?auto_30286489 ?auto_30286490 ) ( IN-CITY ?auto_30286490 ?auto_30286491 ) ( IN-CITY ?auto_30286485 ?auto_30286491 ) ( not ( = ?auto_30286485 ?auto_30286490 ) ) ( OBJ-AT ?auto_30286484 ?auto_30286485 ) ( not ( = ?auto_30286484 ?auto_30286488 ) ) ( OBJ-AT ?auto_30286488 ?auto_30286490 ) ( OBJ-AT ?auto_30286486 ?auto_30286485 ) ( OBJ-AT ?auto_30286487 ?auto_30286485 ) ( not ( = ?auto_30286484 ?auto_30286486 ) ) ( not ( = ?auto_30286484 ?auto_30286487 ) ) ( not ( = ?auto_30286486 ?auto_30286487 ) ) ( not ( = ?auto_30286486 ?auto_30286488 ) ) ( not ( = ?auto_30286487 ?auto_30286488 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30286484 ?auto_30286488 ?auto_30286485 )
      ( DELIVER-4PKG-VERIFY ?auto_30286484 ?auto_30286486 ?auto_30286487 ?auto_30286488 ?auto_30286485 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30329840 - OBJ
      ?auto_30329842 - OBJ
      ?auto_30329843 - OBJ
      ?auto_30329844 - OBJ
      ?auto_30329841 - LOCATION
    )
    :vars
    (
      ?auto_30329845 - LOCATION
      ?auto_30329847 - CITY
      ?auto_30329846 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30329842 ?auto_30329840 ) ( GREATER-THAN ?auto_30329843 ?auto_30329840 ) ( GREATER-THAN ?auto_30329843 ?auto_30329842 ) ( GREATER-THAN ?auto_30329844 ?auto_30329840 ) ( GREATER-THAN ?auto_30329844 ?auto_30329842 ) ( GREATER-THAN ?auto_30329844 ?auto_30329843 ) ( IN-CITY ?auto_30329845 ?auto_30329847 ) ( IN-CITY ?auto_30329841 ?auto_30329847 ) ( not ( = ?auto_30329841 ?auto_30329845 ) ) ( OBJ-AT ?auto_30329840 ?auto_30329841 ) ( not ( = ?auto_30329840 ?auto_30329844 ) ) ( OBJ-AT ?auto_30329844 ?auto_30329845 ) ( TRUCK-AT ?auto_30329846 ?auto_30329841 ) ( OBJ-AT ?auto_30329842 ?auto_30329841 ) ( OBJ-AT ?auto_30329843 ?auto_30329841 ) ( not ( = ?auto_30329840 ?auto_30329842 ) ) ( not ( = ?auto_30329840 ?auto_30329843 ) ) ( not ( = ?auto_30329842 ?auto_30329843 ) ) ( not ( = ?auto_30329842 ?auto_30329844 ) ) ( not ( = ?auto_30329843 ?auto_30329844 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30329840 ?auto_30329844 ?auto_30329841 )
      ( DELIVER-4PKG-VERIFY ?auto_30329840 ?auto_30329842 ?auto_30329843 ?auto_30329844 ?auto_30329841 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30416229 - OBJ
      ?auto_30416231 - OBJ
      ?auto_30416232 - OBJ
      ?auto_30416230 - LOCATION
    )
    :vars
    (
      ?auto_30416233 - LOCATION
      ?auto_30416235 - CITY
      ?auto_30416236 - TRUCK
      ?auto_30416234 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_30416231 ?auto_30416229 ) ( GREATER-THAN ?auto_30416232 ?auto_30416229 ) ( GREATER-THAN ?auto_30416232 ?auto_30416231 ) ( IN-CITY ?auto_30416233 ?auto_30416235 ) ( IN-CITY ?auto_30416230 ?auto_30416235 ) ( not ( = ?auto_30416230 ?auto_30416233 ) ) ( OBJ-AT ?auto_30416229 ?auto_30416230 ) ( not ( = ?auto_30416229 ?auto_30416232 ) ) ( OBJ-AT ?auto_30416232 ?auto_30416233 ) ( TRUCK-AT ?auto_30416236 ?auto_30416234 ) ( IN-CITY ?auto_30416234 ?auto_30416235 ) ( not ( = ?auto_30416230 ?auto_30416234 ) ) ( not ( = ?auto_30416233 ?auto_30416234 ) ) ( OBJ-AT ?auto_30416231 ?auto_30416230 ) ( not ( = ?auto_30416229 ?auto_30416231 ) ) ( not ( = ?auto_30416231 ?auto_30416232 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30416229 ?auto_30416232 ?auto_30416230 )
      ( DELIVER-3PKG-VERIFY ?auto_30416229 ?auto_30416231 ?auto_30416232 ?auto_30416230 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_31016934 - OBJ
      ?auto_31016936 - OBJ
      ?auto_31016937 - OBJ
      ?auto_31016938 - OBJ
      ?auto_31016939 - OBJ
      ?auto_31016935 - LOCATION
    )
    :vars
    (
      ?auto_31016940 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_31016936 ?auto_31016934 ) ( GREATER-THAN ?auto_31016937 ?auto_31016934 ) ( GREATER-THAN ?auto_31016937 ?auto_31016936 ) ( GREATER-THAN ?auto_31016938 ?auto_31016934 ) ( GREATER-THAN ?auto_31016938 ?auto_31016936 ) ( GREATER-THAN ?auto_31016938 ?auto_31016937 ) ( GREATER-THAN ?auto_31016939 ?auto_31016934 ) ( GREATER-THAN ?auto_31016939 ?auto_31016936 ) ( GREATER-THAN ?auto_31016939 ?auto_31016937 ) ( GREATER-THAN ?auto_31016939 ?auto_31016938 ) ( TRUCK-AT ?auto_31016940 ?auto_31016935 ) ( IN-TRUCK ?auto_31016939 ?auto_31016940 ) ( OBJ-AT ?auto_31016934 ?auto_31016935 ) ( OBJ-AT ?auto_31016936 ?auto_31016935 ) ( OBJ-AT ?auto_31016937 ?auto_31016935 ) ( OBJ-AT ?auto_31016938 ?auto_31016935 ) ( not ( = ?auto_31016934 ?auto_31016936 ) ) ( not ( = ?auto_31016934 ?auto_31016937 ) ) ( not ( = ?auto_31016934 ?auto_31016938 ) ) ( not ( = ?auto_31016934 ?auto_31016939 ) ) ( not ( = ?auto_31016936 ?auto_31016937 ) ) ( not ( = ?auto_31016936 ?auto_31016938 ) ) ( not ( = ?auto_31016936 ?auto_31016939 ) ) ( not ( = ?auto_31016937 ?auto_31016938 ) ) ( not ( = ?auto_31016937 ?auto_31016939 ) ) ( not ( = ?auto_31016938 ?auto_31016939 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_31016939 ?auto_31016935 )
      ( DELIVER-5PKG-VERIFY ?auto_31016934 ?auto_31016936 ?auto_31016937 ?auto_31016938 ?auto_31016939 ?auto_31016935 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_31127654 - OBJ
      ?auto_31127656 - OBJ
      ?auto_31127657 - OBJ
      ?auto_31127658 - OBJ
      ?auto_31127659 - OBJ
      ?auto_31127655 - LOCATION
    )
    :vars
    (
      ?auto_31127662 - TRUCK
      ?auto_31127660 - LOCATION
      ?auto_31127661 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_31127656 ?auto_31127654 ) ( GREATER-THAN ?auto_31127657 ?auto_31127654 ) ( GREATER-THAN ?auto_31127657 ?auto_31127656 ) ( GREATER-THAN ?auto_31127658 ?auto_31127654 ) ( GREATER-THAN ?auto_31127658 ?auto_31127656 ) ( GREATER-THAN ?auto_31127658 ?auto_31127657 ) ( GREATER-THAN ?auto_31127659 ?auto_31127654 ) ( GREATER-THAN ?auto_31127659 ?auto_31127656 ) ( GREATER-THAN ?auto_31127659 ?auto_31127657 ) ( GREATER-THAN ?auto_31127659 ?auto_31127658 ) ( IN-TRUCK ?auto_31127659 ?auto_31127662 ) ( TRUCK-AT ?auto_31127662 ?auto_31127660 ) ( IN-CITY ?auto_31127660 ?auto_31127661 ) ( IN-CITY ?auto_31127655 ?auto_31127661 ) ( not ( = ?auto_31127655 ?auto_31127660 ) ) ( OBJ-AT ?auto_31127654 ?auto_31127655 ) ( not ( = ?auto_31127654 ?auto_31127659 ) ) ( OBJ-AT ?auto_31127656 ?auto_31127655 ) ( OBJ-AT ?auto_31127657 ?auto_31127655 ) ( OBJ-AT ?auto_31127658 ?auto_31127655 ) ( not ( = ?auto_31127654 ?auto_31127656 ) ) ( not ( = ?auto_31127654 ?auto_31127657 ) ) ( not ( = ?auto_31127654 ?auto_31127658 ) ) ( not ( = ?auto_31127656 ?auto_31127657 ) ) ( not ( = ?auto_31127656 ?auto_31127658 ) ) ( not ( = ?auto_31127656 ?auto_31127659 ) ) ( not ( = ?auto_31127657 ?auto_31127658 ) ) ( not ( = ?auto_31127657 ?auto_31127659 ) ) ( not ( = ?auto_31127658 ?auto_31127659 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31127654 ?auto_31127659 ?auto_31127655 )
      ( DELIVER-5PKG-VERIFY ?auto_31127654 ?auto_31127656 ?auto_31127657 ?auto_31127658 ?auto_31127659 ?auto_31127655 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_31269619 - OBJ
      ?auto_31269621 - OBJ
      ?auto_31269622 - OBJ
      ?auto_31269623 - OBJ
      ?auto_31269624 - OBJ
      ?auto_31269620 - LOCATION
    )
    :vars
    (
      ?auto_31269627 - TRUCK
      ?auto_31269626 - LOCATION
      ?auto_31269625 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_31269621 ?auto_31269619 ) ( GREATER-THAN ?auto_31269622 ?auto_31269619 ) ( GREATER-THAN ?auto_31269622 ?auto_31269621 ) ( GREATER-THAN ?auto_31269623 ?auto_31269619 ) ( GREATER-THAN ?auto_31269623 ?auto_31269621 ) ( GREATER-THAN ?auto_31269623 ?auto_31269622 ) ( GREATER-THAN ?auto_31269624 ?auto_31269619 ) ( GREATER-THAN ?auto_31269624 ?auto_31269621 ) ( GREATER-THAN ?auto_31269624 ?auto_31269622 ) ( GREATER-THAN ?auto_31269624 ?auto_31269623 ) ( TRUCK-AT ?auto_31269627 ?auto_31269626 ) ( IN-CITY ?auto_31269626 ?auto_31269625 ) ( IN-CITY ?auto_31269620 ?auto_31269625 ) ( not ( = ?auto_31269620 ?auto_31269626 ) ) ( OBJ-AT ?auto_31269619 ?auto_31269620 ) ( not ( = ?auto_31269619 ?auto_31269624 ) ) ( OBJ-AT ?auto_31269624 ?auto_31269626 ) ( OBJ-AT ?auto_31269621 ?auto_31269620 ) ( OBJ-AT ?auto_31269622 ?auto_31269620 ) ( OBJ-AT ?auto_31269623 ?auto_31269620 ) ( not ( = ?auto_31269619 ?auto_31269621 ) ) ( not ( = ?auto_31269619 ?auto_31269622 ) ) ( not ( = ?auto_31269619 ?auto_31269623 ) ) ( not ( = ?auto_31269621 ?auto_31269622 ) ) ( not ( = ?auto_31269621 ?auto_31269623 ) ) ( not ( = ?auto_31269621 ?auto_31269624 ) ) ( not ( = ?auto_31269622 ?auto_31269623 ) ) ( not ( = ?auto_31269622 ?auto_31269624 ) ) ( not ( = ?auto_31269623 ?auto_31269624 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31269619 ?auto_31269624 ?auto_31269620 )
      ( DELIVER-5PKG-VERIFY ?auto_31269619 ?auto_31269621 ?auto_31269622 ?auto_31269623 ?auto_31269624 ?auto_31269620 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_31411584 - OBJ
      ?auto_31411586 - OBJ
      ?auto_31411587 - OBJ
      ?auto_31411588 - OBJ
      ?auto_31411589 - OBJ
      ?auto_31411585 - LOCATION
    )
    :vars
    (
      ?auto_31411590 - LOCATION
      ?auto_31411591 - CITY
      ?auto_31411592 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_31411586 ?auto_31411584 ) ( GREATER-THAN ?auto_31411587 ?auto_31411584 ) ( GREATER-THAN ?auto_31411587 ?auto_31411586 ) ( GREATER-THAN ?auto_31411588 ?auto_31411584 ) ( GREATER-THAN ?auto_31411588 ?auto_31411586 ) ( GREATER-THAN ?auto_31411588 ?auto_31411587 ) ( GREATER-THAN ?auto_31411589 ?auto_31411584 ) ( GREATER-THAN ?auto_31411589 ?auto_31411586 ) ( GREATER-THAN ?auto_31411589 ?auto_31411587 ) ( GREATER-THAN ?auto_31411589 ?auto_31411588 ) ( IN-CITY ?auto_31411590 ?auto_31411591 ) ( IN-CITY ?auto_31411585 ?auto_31411591 ) ( not ( = ?auto_31411585 ?auto_31411590 ) ) ( OBJ-AT ?auto_31411584 ?auto_31411585 ) ( not ( = ?auto_31411584 ?auto_31411589 ) ) ( OBJ-AT ?auto_31411589 ?auto_31411590 ) ( TRUCK-AT ?auto_31411592 ?auto_31411585 ) ( OBJ-AT ?auto_31411586 ?auto_31411585 ) ( OBJ-AT ?auto_31411587 ?auto_31411585 ) ( OBJ-AT ?auto_31411588 ?auto_31411585 ) ( not ( = ?auto_31411584 ?auto_31411586 ) ) ( not ( = ?auto_31411584 ?auto_31411587 ) ) ( not ( = ?auto_31411584 ?auto_31411588 ) ) ( not ( = ?auto_31411586 ?auto_31411587 ) ) ( not ( = ?auto_31411586 ?auto_31411588 ) ) ( not ( = ?auto_31411586 ?auto_31411589 ) ) ( not ( = ?auto_31411587 ?auto_31411588 ) ) ( not ( = ?auto_31411587 ?auto_31411589 ) ) ( not ( = ?auto_31411588 ?auto_31411589 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31411584 ?auto_31411589 ?auto_31411585 )
      ( DELIVER-5PKG-VERIFY ?auto_31411584 ?auto_31411586 ?auto_31411587 ?auto_31411588 ?auto_31411589 ?auto_31411585 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31691852 - OBJ
      ?auto_31691854 - OBJ
      ?auto_31691855 - OBJ
      ?auto_31691856 - OBJ
      ?auto_31691853 - LOCATION
    )
    :vars
    (
      ?auto_31691857 - LOCATION
      ?auto_31691859 - CITY
      ?auto_31691858 - TRUCK
      ?auto_31691860 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_31691854 ?auto_31691852 ) ( GREATER-THAN ?auto_31691855 ?auto_31691852 ) ( GREATER-THAN ?auto_31691855 ?auto_31691854 ) ( GREATER-THAN ?auto_31691856 ?auto_31691852 ) ( GREATER-THAN ?auto_31691856 ?auto_31691854 ) ( GREATER-THAN ?auto_31691856 ?auto_31691855 ) ( IN-CITY ?auto_31691857 ?auto_31691859 ) ( IN-CITY ?auto_31691853 ?auto_31691859 ) ( not ( = ?auto_31691853 ?auto_31691857 ) ) ( OBJ-AT ?auto_31691852 ?auto_31691853 ) ( not ( = ?auto_31691852 ?auto_31691856 ) ) ( OBJ-AT ?auto_31691856 ?auto_31691857 ) ( TRUCK-AT ?auto_31691858 ?auto_31691860 ) ( IN-CITY ?auto_31691860 ?auto_31691859 ) ( not ( = ?auto_31691853 ?auto_31691860 ) ) ( not ( = ?auto_31691857 ?auto_31691860 ) ) ( OBJ-AT ?auto_31691854 ?auto_31691853 ) ( OBJ-AT ?auto_31691855 ?auto_31691853 ) ( not ( = ?auto_31691852 ?auto_31691854 ) ) ( not ( = ?auto_31691852 ?auto_31691855 ) ) ( not ( = ?auto_31691854 ?auto_31691855 ) ) ( not ( = ?auto_31691854 ?auto_31691856 ) ) ( not ( = ?auto_31691855 ?auto_31691856 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31691852 ?auto_31691856 ?auto_31691853 )
      ( DELIVER-4PKG-VERIFY ?auto_31691852 ?auto_31691854 ?auto_31691855 ?auto_31691856 ?auto_31691853 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_34161650 - OBJ
      ?auto_34161652 - OBJ
      ?auto_34161653 - OBJ
      ?auto_34161654 - OBJ
      ?auto_34161655 - OBJ
      ?auto_34161656 - OBJ
      ?auto_34161651 - LOCATION
    )
    :vars
    (
      ?auto_34161657 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_34161652 ?auto_34161650 ) ( GREATER-THAN ?auto_34161653 ?auto_34161650 ) ( GREATER-THAN ?auto_34161653 ?auto_34161652 ) ( GREATER-THAN ?auto_34161654 ?auto_34161650 ) ( GREATER-THAN ?auto_34161654 ?auto_34161652 ) ( GREATER-THAN ?auto_34161654 ?auto_34161653 ) ( GREATER-THAN ?auto_34161655 ?auto_34161650 ) ( GREATER-THAN ?auto_34161655 ?auto_34161652 ) ( GREATER-THAN ?auto_34161655 ?auto_34161653 ) ( GREATER-THAN ?auto_34161655 ?auto_34161654 ) ( GREATER-THAN ?auto_34161656 ?auto_34161650 ) ( GREATER-THAN ?auto_34161656 ?auto_34161652 ) ( GREATER-THAN ?auto_34161656 ?auto_34161653 ) ( GREATER-THAN ?auto_34161656 ?auto_34161654 ) ( GREATER-THAN ?auto_34161656 ?auto_34161655 ) ( TRUCK-AT ?auto_34161657 ?auto_34161651 ) ( IN-TRUCK ?auto_34161656 ?auto_34161657 ) ( OBJ-AT ?auto_34161650 ?auto_34161651 ) ( OBJ-AT ?auto_34161652 ?auto_34161651 ) ( OBJ-AT ?auto_34161653 ?auto_34161651 ) ( OBJ-AT ?auto_34161654 ?auto_34161651 ) ( OBJ-AT ?auto_34161655 ?auto_34161651 ) ( not ( = ?auto_34161650 ?auto_34161652 ) ) ( not ( = ?auto_34161650 ?auto_34161653 ) ) ( not ( = ?auto_34161650 ?auto_34161654 ) ) ( not ( = ?auto_34161650 ?auto_34161655 ) ) ( not ( = ?auto_34161650 ?auto_34161656 ) ) ( not ( = ?auto_34161652 ?auto_34161653 ) ) ( not ( = ?auto_34161652 ?auto_34161654 ) ) ( not ( = ?auto_34161652 ?auto_34161655 ) ) ( not ( = ?auto_34161652 ?auto_34161656 ) ) ( not ( = ?auto_34161653 ?auto_34161654 ) ) ( not ( = ?auto_34161653 ?auto_34161655 ) ) ( not ( = ?auto_34161653 ?auto_34161656 ) ) ( not ( = ?auto_34161654 ?auto_34161655 ) ) ( not ( = ?auto_34161654 ?auto_34161656 ) ) ( not ( = ?auto_34161655 ?auto_34161656 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_34161656 ?auto_34161651 )
      ( DELIVER-6PKG-VERIFY ?auto_34161650 ?auto_34161652 ?auto_34161653 ?auto_34161654 ?auto_34161655 ?auto_34161656 ?auto_34161651 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_34462060 - OBJ
      ?auto_34462062 - OBJ
      ?auto_34462063 - OBJ
      ?auto_34462064 - OBJ
      ?auto_34462065 - OBJ
      ?auto_34462066 - OBJ
      ?auto_34462061 - LOCATION
    )
    :vars
    (
      ?auto_34462069 - TRUCK
      ?auto_34462068 - LOCATION
      ?auto_34462067 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_34462062 ?auto_34462060 ) ( GREATER-THAN ?auto_34462063 ?auto_34462060 ) ( GREATER-THAN ?auto_34462063 ?auto_34462062 ) ( GREATER-THAN ?auto_34462064 ?auto_34462060 ) ( GREATER-THAN ?auto_34462064 ?auto_34462062 ) ( GREATER-THAN ?auto_34462064 ?auto_34462063 ) ( GREATER-THAN ?auto_34462065 ?auto_34462060 ) ( GREATER-THAN ?auto_34462065 ?auto_34462062 ) ( GREATER-THAN ?auto_34462065 ?auto_34462063 ) ( GREATER-THAN ?auto_34462065 ?auto_34462064 ) ( GREATER-THAN ?auto_34462066 ?auto_34462060 ) ( GREATER-THAN ?auto_34462066 ?auto_34462062 ) ( GREATER-THAN ?auto_34462066 ?auto_34462063 ) ( GREATER-THAN ?auto_34462066 ?auto_34462064 ) ( GREATER-THAN ?auto_34462066 ?auto_34462065 ) ( IN-TRUCK ?auto_34462066 ?auto_34462069 ) ( TRUCK-AT ?auto_34462069 ?auto_34462068 ) ( IN-CITY ?auto_34462068 ?auto_34462067 ) ( IN-CITY ?auto_34462061 ?auto_34462067 ) ( not ( = ?auto_34462061 ?auto_34462068 ) ) ( OBJ-AT ?auto_34462060 ?auto_34462061 ) ( not ( = ?auto_34462060 ?auto_34462066 ) ) ( OBJ-AT ?auto_34462062 ?auto_34462061 ) ( OBJ-AT ?auto_34462063 ?auto_34462061 ) ( OBJ-AT ?auto_34462064 ?auto_34462061 ) ( OBJ-AT ?auto_34462065 ?auto_34462061 ) ( not ( = ?auto_34462060 ?auto_34462062 ) ) ( not ( = ?auto_34462060 ?auto_34462063 ) ) ( not ( = ?auto_34462060 ?auto_34462064 ) ) ( not ( = ?auto_34462060 ?auto_34462065 ) ) ( not ( = ?auto_34462062 ?auto_34462063 ) ) ( not ( = ?auto_34462062 ?auto_34462064 ) ) ( not ( = ?auto_34462062 ?auto_34462065 ) ) ( not ( = ?auto_34462062 ?auto_34462066 ) ) ( not ( = ?auto_34462063 ?auto_34462064 ) ) ( not ( = ?auto_34462063 ?auto_34462065 ) ) ( not ( = ?auto_34462063 ?auto_34462066 ) ) ( not ( = ?auto_34462064 ?auto_34462065 ) ) ( not ( = ?auto_34462064 ?auto_34462066 ) ) ( not ( = ?auto_34462065 ?auto_34462066 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34462060 ?auto_34462066 ?auto_34462061 )
      ( DELIVER-6PKG-VERIFY ?auto_34462060 ?auto_34462062 ?auto_34462063 ?auto_34462064 ?auto_34462065 ?auto_34462066 ?auto_34462061 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_34834282 - OBJ
      ?auto_34834284 - OBJ
      ?auto_34834285 - OBJ
      ?auto_34834286 - OBJ
      ?auto_34834287 - OBJ
      ?auto_34834288 - OBJ
      ?auto_34834283 - LOCATION
    )
    :vars
    (
      ?auto_34834291 - TRUCK
      ?auto_34834290 - LOCATION
      ?auto_34834289 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_34834284 ?auto_34834282 ) ( GREATER-THAN ?auto_34834285 ?auto_34834282 ) ( GREATER-THAN ?auto_34834285 ?auto_34834284 ) ( GREATER-THAN ?auto_34834286 ?auto_34834282 ) ( GREATER-THAN ?auto_34834286 ?auto_34834284 ) ( GREATER-THAN ?auto_34834286 ?auto_34834285 ) ( GREATER-THAN ?auto_34834287 ?auto_34834282 ) ( GREATER-THAN ?auto_34834287 ?auto_34834284 ) ( GREATER-THAN ?auto_34834287 ?auto_34834285 ) ( GREATER-THAN ?auto_34834287 ?auto_34834286 ) ( GREATER-THAN ?auto_34834288 ?auto_34834282 ) ( GREATER-THAN ?auto_34834288 ?auto_34834284 ) ( GREATER-THAN ?auto_34834288 ?auto_34834285 ) ( GREATER-THAN ?auto_34834288 ?auto_34834286 ) ( GREATER-THAN ?auto_34834288 ?auto_34834287 ) ( TRUCK-AT ?auto_34834291 ?auto_34834290 ) ( IN-CITY ?auto_34834290 ?auto_34834289 ) ( IN-CITY ?auto_34834283 ?auto_34834289 ) ( not ( = ?auto_34834283 ?auto_34834290 ) ) ( OBJ-AT ?auto_34834282 ?auto_34834283 ) ( not ( = ?auto_34834282 ?auto_34834288 ) ) ( OBJ-AT ?auto_34834288 ?auto_34834290 ) ( OBJ-AT ?auto_34834284 ?auto_34834283 ) ( OBJ-AT ?auto_34834285 ?auto_34834283 ) ( OBJ-AT ?auto_34834286 ?auto_34834283 ) ( OBJ-AT ?auto_34834287 ?auto_34834283 ) ( not ( = ?auto_34834282 ?auto_34834284 ) ) ( not ( = ?auto_34834282 ?auto_34834285 ) ) ( not ( = ?auto_34834282 ?auto_34834286 ) ) ( not ( = ?auto_34834282 ?auto_34834287 ) ) ( not ( = ?auto_34834284 ?auto_34834285 ) ) ( not ( = ?auto_34834284 ?auto_34834286 ) ) ( not ( = ?auto_34834284 ?auto_34834287 ) ) ( not ( = ?auto_34834284 ?auto_34834288 ) ) ( not ( = ?auto_34834285 ?auto_34834286 ) ) ( not ( = ?auto_34834285 ?auto_34834287 ) ) ( not ( = ?auto_34834285 ?auto_34834288 ) ) ( not ( = ?auto_34834286 ?auto_34834287 ) ) ( not ( = ?auto_34834286 ?auto_34834288 ) ) ( not ( = ?auto_34834287 ?auto_34834288 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34834282 ?auto_34834288 ?auto_34834283 )
      ( DELIVER-6PKG-VERIFY ?auto_34834282 ?auto_34834284 ?auto_34834285 ?auto_34834286 ?auto_34834287 ?auto_34834288 ?auto_34834283 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_35206504 - OBJ
      ?auto_35206506 - OBJ
      ?auto_35206507 - OBJ
      ?auto_35206508 - OBJ
      ?auto_35206509 - OBJ
      ?auto_35206510 - OBJ
      ?auto_35206505 - LOCATION
    )
    :vars
    (
      ?auto_35206513 - LOCATION
      ?auto_35206512 - CITY
      ?auto_35206511 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_35206506 ?auto_35206504 ) ( GREATER-THAN ?auto_35206507 ?auto_35206504 ) ( GREATER-THAN ?auto_35206507 ?auto_35206506 ) ( GREATER-THAN ?auto_35206508 ?auto_35206504 ) ( GREATER-THAN ?auto_35206508 ?auto_35206506 ) ( GREATER-THAN ?auto_35206508 ?auto_35206507 ) ( GREATER-THAN ?auto_35206509 ?auto_35206504 ) ( GREATER-THAN ?auto_35206509 ?auto_35206506 ) ( GREATER-THAN ?auto_35206509 ?auto_35206507 ) ( GREATER-THAN ?auto_35206509 ?auto_35206508 ) ( GREATER-THAN ?auto_35206510 ?auto_35206504 ) ( GREATER-THAN ?auto_35206510 ?auto_35206506 ) ( GREATER-THAN ?auto_35206510 ?auto_35206507 ) ( GREATER-THAN ?auto_35206510 ?auto_35206508 ) ( GREATER-THAN ?auto_35206510 ?auto_35206509 ) ( IN-CITY ?auto_35206513 ?auto_35206512 ) ( IN-CITY ?auto_35206505 ?auto_35206512 ) ( not ( = ?auto_35206505 ?auto_35206513 ) ) ( OBJ-AT ?auto_35206504 ?auto_35206505 ) ( not ( = ?auto_35206504 ?auto_35206510 ) ) ( OBJ-AT ?auto_35206510 ?auto_35206513 ) ( TRUCK-AT ?auto_35206511 ?auto_35206505 ) ( OBJ-AT ?auto_35206506 ?auto_35206505 ) ( OBJ-AT ?auto_35206507 ?auto_35206505 ) ( OBJ-AT ?auto_35206508 ?auto_35206505 ) ( OBJ-AT ?auto_35206509 ?auto_35206505 ) ( not ( = ?auto_35206504 ?auto_35206506 ) ) ( not ( = ?auto_35206504 ?auto_35206507 ) ) ( not ( = ?auto_35206504 ?auto_35206508 ) ) ( not ( = ?auto_35206504 ?auto_35206509 ) ) ( not ( = ?auto_35206506 ?auto_35206507 ) ) ( not ( = ?auto_35206506 ?auto_35206508 ) ) ( not ( = ?auto_35206506 ?auto_35206509 ) ) ( not ( = ?auto_35206506 ?auto_35206510 ) ) ( not ( = ?auto_35206507 ?auto_35206508 ) ) ( not ( = ?auto_35206507 ?auto_35206509 ) ) ( not ( = ?auto_35206507 ?auto_35206510 ) ) ( not ( = ?auto_35206508 ?auto_35206509 ) ) ( not ( = ?auto_35206508 ?auto_35206510 ) ) ( not ( = ?auto_35206509 ?auto_35206510 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35206504 ?auto_35206510 ?auto_35206505 )
      ( DELIVER-6PKG-VERIFY ?auto_35206504 ?auto_35206506 ?auto_35206507 ?auto_35206508 ?auto_35206509 ?auto_35206510 ?auto_35206505 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35900101 - OBJ
      ?auto_35900103 - OBJ
      ?auto_35900104 - OBJ
      ?auto_35900105 - OBJ
      ?auto_35900106 - OBJ
      ?auto_35900102 - LOCATION
    )
    :vars
    (
      ?auto_35900107 - LOCATION
      ?auto_35900108 - CITY
      ?auto_35900109 - TRUCK
      ?auto_35900110 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_35900103 ?auto_35900101 ) ( GREATER-THAN ?auto_35900104 ?auto_35900101 ) ( GREATER-THAN ?auto_35900104 ?auto_35900103 ) ( GREATER-THAN ?auto_35900105 ?auto_35900101 ) ( GREATER-THAN ?auto_35900105 ?auto_35900103 ) ( GREATER-THAN ?auto_35900105 ?auto_35900104 ) ( GREATER-THAN ?auto_35900106 ?auto_35900101 ) ( GREATER-THAN ?auto_35900106 ?auto_35900103 ) ( GREATER-THAN ?auto_35900106 ?auto_35900104 ) ( GREATER-THAN ?auto_35900106 ?auto_35900105 ) ( IN-CITY ?auto_35900107 ?auto_35900108 ) ( IN-CITY ?auto_35900102 ?auto_35900108 ) ( not ( = ?auto_35900102 ?auto_35900107 ) ) ( OBJ-AT ?auto_35900101 ?auto_35900102 ) ( not ( = ?auto_35900101 ?auto_35900106 ) ) ( OBJ-AT ?auto_35900106 ?auto_35900107 ) ( TRUCK-AT ?auto_35900109 ?auto_35900110 ) ( IN-CITY ?auto_35900110 ?auto_35900108 ) ( not ( = ?auto_35900102 ?auto_35900110 ) ) ( not ( = ?auto_35900107 ?auto_35900110 ) ) ( OBJ-AT ?auto_35900103 ?auto_35900102 ) ( OBJ-AT ?auto_35900104 ?auto_35900102 ) ( OBJ-AT ?auto_35900105 ?auto_35900102 ) ( not ( = ?auto_35900101 ?auto_35900103 ) ) ( not ( = ?auto_35900101 ?auto_35900104 ) ) ( not ( = ?auto_35900101 ?auto_35900105 ) ) ( not ( = ?auto_35900103 ?auto_35900104 ) ) ( not ( = ?auto_35900103 ?auto_35900105 ) ) ( not ( = ?auto_35900103 ?auto_35900106 ) ) ( not ( = ?auto_35900104 ?auto_35900105 ) ) ( not ( = ?auto_35900104 ?auto_35900106 ) ) ( not ( = ?auto_35900105 ?auto_35900106 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35900101 ?auto_35900106 ?auto_35900102 )
      ( DELIVER-5PKG-VERIFY ?auto_35900101 ?auto_35900103 ?auto_35900104 ?auto_35900105 ?auto_35900106 ?auto_35900102 ) )
  )

)

