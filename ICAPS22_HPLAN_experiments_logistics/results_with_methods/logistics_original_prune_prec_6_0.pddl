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
      ?auto_3627090 - OBJ
      ?auto_3627091 - LOCATION
    )
    :vars
    (
      ?auto_3627092 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3627092 ?auto_3627091 ) ( IN-TRUCK ?auto_3627090 ?auto_3627092 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_3627090 ?auto_3627092 ?auto_3627091 )
      ( DELIVER-1PKG-VERIFY ?auto_3627090 ?auto_3627091 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3627123 - OBJ
      ?auto_3627124 - LOCATION
    )
    :vars
    (
      ?auto_3627125 - TRUCK
      ?auto_3627126 - LOCATION
      ?auto_3627127 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_3627123 ?auto_3627125 ) ( TRUCK-AT ?auto_3627125 ?auto_3627126 ) ( IN-CITY ?auto_3627126 ?auto_3627127 ) ( IN-CITY ?auto_3627124 ?auto_3627127 ) ( not ( = ?auto_3627124 ?auto_3627126 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3627125 ?auto_3627126 ?auto_3627124 ?auto_3627127 )
      ( DELIVER-1PKG ?auto_3627123 ?auto_3627124 )
      ( DELIVER-1PKG-VERIFY ?auto_3627123 ?auto_3627124 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3627168 - OBJ
      ?auto_3627169 - LOCATION
    )
    :vars
    (
      ?auto_3627171 - TRUCK
      ?auto_3627172 - LOCATION
      ?auto_3627170 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3627171 ?auto_3627172 ) ( IN-CITY ?auto_3627172 ?auto_3627170 ) ( IN-CITY ?auto_3627169 ?auto_3627170 ) ( not ( = ?auto_3627169 ?auto_3627172 ) ) ( OBJ-AT ?auto_3627168 ?auto_3627172 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3627168 ?auto_3627171 ?auto_3627172 )
      ( DELIVER-1PKG ?auto_3627168 ?auto_3627169 )
      ( DELIVER-1PKG-VERIFY ?auto_3627168 ?auto_3627169 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3627213 - OBJ
      ?auto_3627214 - LOCATION
    )
    :vars
    (
      ?auto_3627217 - LOCATION
      ?auto_3627215 - CITY
      ?auto_3627216 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3627217 ?auto_3627215 ) ( IN-CITY ?auto_3627214 ?auto_3627215 ) ( not ( = ?auto_3627214 ?auto_3627217 ) ) ( OBJ-AT ?auto_3627213 ?auto_3627217 ) ( TRUCK-AT ?auto_3627216 ?auto_3627214 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3627216 ?auto_3627214 ?auto_3627217 ?auto_3627215 )
      ( DELIVER-1PKG ?auto_3627213 ?auto_3627214 )
      ( DELIVER-1PKG-VERIFY ?auto_3627213 ?auto_3627214 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3628002 - OBJ
      ?auto_3628004 - OBJ
      ?auto_3628003 - LOCATION
    )
    :vars
    (
      ?auto_3628005 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3628004 ?auto_3628002 ) ( TRUCK-AT ?auto_3628005 ?auto_3628003 ) ( IN-TRUCK ?auto_3628004 ?auto_3628005 ) ( OBJ-AT ?auto_3628002 ?auto_3628003 ) ( not ( = ?auto_3628002 ?auto_3628004 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3628004 ?auto_3628003 )
      ( DELIVER-2PKG-VERIFY ?auto_3628002 ?auto_3628004 ?auto_3628003 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3628865 - OBJ
      ?auto_3628867 - OBJ
      ?auto_3628866 - LOCATION
    )
    :vars
    (
      ?auto_3628870 - TRUCK
      ?auto_3628868 - LOCATION
      ?auto_3628869 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3628867 ?auto_3628865 ) ( IN-TRUCK ?auto_3628867 ?auto_3628870 ) ( TRUCK-AT ?auto_3628870 ?auto_3628868 ) ( IN-CITY ?auto_3628868 ?auto_3628869 ) ( IN-CITY ?auto_3628866 ?auto_3628869 ) ( not ( = ?auto_3628866 ?auto_3628868 ) ) ( OBJ-AT ?auto_3628865 ?auto_3628866 ) ( not ( = ?auto_3628865 ?auto_3628867 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3628867 ?auto_3628866 )
      ( DELIVER-2PKG-VERIFY ?auto_3628865 ?auto_3628867 ?auto_3628866 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3629966 - OBJ
      ?auto_3629967 - LOCATION
    )
    :vars
    (
      ?auto_3629969 - OBJ
      ?auto_3629968 - TRUCK
      ?auto_3629970 - LOCATION
      ?auto_3629971 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3629966 ?auto_3629969 ) ( TRUCK-AT ?auto_3629968 ?auto_3629970 ) ( IN-CITY ?auto_3629970 ?auto_3629971 ) ( IN-CITY ?auto_3629967 ?auto_3629971 ) ( not ( = ?auto_3629967 ?auto_3629970 ) ) ( OBJ-AT ?auto_3629969 ?auto_3629967 ) ( not ( = ?auto_3629969 ?auto_3629966 ) ) ( OBJ-AT ?auto_3629966 ?auto_3629970 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3629966 ?auto_3629968 ?auto_3629970 )
      ( DELIVER-2PKG ?auto_3629969 ?auto_3629966 ?auto_3629967 )
      ( DELIVER-1PKG-VERIFY ?auto_3629966 ?auto_3629967 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3629972 - OBJ
      ?auto_3629974 - OBJ
      ?auto_3629973 - LOCATION
    )
    :vars
    (
      ?auto_3629975 - TRUCK
      ?auto_3629977 - LOCATION
      ?auto_3629976 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3629974 ?auto_3629972 ) ( TRUCK-AT ?auto_3629975 ?auto_3629977 ) ( IN-CITY ?auto_3629977 ?auto_3629976 ) ( IN-CITY ?auto_3629973 ?auto_3629976 ) ( not ( = ?auto_3629973 ?auto_3629977 ) ) ( OBJ-AT ?auto_3629972 ?auto_3629973 ) ( not ( = ?auto_3629972 ?auto_3629974 ) ) ( OBJ-AT ?auto_3629974 ?auto_3629977 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3629974 ?auto_3629973 )
      ( DELIVER-2PKG-VERIFY ?auto_3629972 ?auto_3629974 ?auto_3629973 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3631073 - OBJ
      ?auto_3631074 - LOCATION
    )
    :vars
    (
      ?auto_3631077 - OBJ
      ?auto_3631075 - LOCATION
      ?auto_3631076 - CITY
      ?auto_3631078 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3631073 ?auto_3631077 ) ( IN-CITY ?auto_3631075 ?auto_3631076 ) ( IN-CITY ?auto_3631074 ?auto_3631076 ) ( not ( = ?auto_3631074 ?auto_3631075 ) ) ( OBJ-AT ?auto_3631077 ?auto_3631074 ) ( not ( = ?auto_3631077 ?auto_3631073 ) ) ( OBJ-AT ?auto_3631073 ?auto_3631075 ) ( TRUCK-AT ?auto_3631078 ?auto_3631074 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3631078 ?auto_3631074 ?auto_3631075 ?auto_3631076 )
      ( DELIVER-2PKG ?auto_3631077 ?auto_3631073 ?auto_3631074 )
      ( DELIVER-1PKG-VERIFY ?auto_3631073 ?auto_3631074 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3631079 - OBJ
      ?auto_3631081 - OBJ
      ?auto_3631080 - LOCATION
    )
    :vars
    (
      ?auto_3631082 - LOCATION
      ?auto_3631083 - CITY
      ?auto_3631084 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3631081 ?auto_3631079 ) ( IN-CITY ?auto_3631082 ?auto_3631083 ) ( IN-CITY ?auto_3631080 ?auto_3631083 ) ( not ( = ?auto_3631080 ?auto_3631082 ) ) ( OBJ-AT ?auto_3631079 ?auto_3631080 ) ( not ( = ?auto_3631079 ?auto_3631081 ) ) ( OBJ-AT ?auto_3631081 ?auto_3631082 ) ( TRUCK-AT ?auto_3631084 ?auto_3631080 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3631081 ?auto_3631080 )
      ( DELIVER-2PKG-VERIFY ?auto_3631079 ?auto_3631081 ?auto_3631080 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3632180 - OBJ
      ?auto_3632181 - LOCATION
    )
    :vars
    (
      ?auto_3632185 - OBJ
      ?auto_3632182 - LOCATION
      ?auto_3632184 - CITY
      ?auto_3632183 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3632180 ?auto_3632185 ) ( IN-CITY ?auto_3632182 ?auto_3632184 ) ( IN-CITY ?auto_3632181 ?auto_3632184 ) ( not ( = ?auto_3632181 ?auto_3632182 ) ) ( not ( = ?auto_3632185 ?auto_3632180 ) ) ( OBJ-AT ?auto_3632180 ?auto_3632182 ) ( TRUCK-AT ?auto_3632183 ?auto_3632181 ) ( IN-TRUCK ?auto_3632185 ?auto_3632183 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3632185 ?auto_3632181 )
      ( DELIVER-2PKG ?auto_3632185 ?auto_3632180 ?auto_3632181 )
      ( DELIVER-1PKG-VERIFY ?auto_3632180 ?auto_3632181 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3632186 - OBJ
      ?auto_3632188 - OBJ
      ?auto_3632187 - LOCATION
    )
    :vars
    (
      ?auto_3632189 - LOCATION
      ?auto_3632190 - CITY
      ?auto_3632191 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3632188 ?auto_3632186 ) ( IN-CITY ?auto_3632189 ?auto_3632190 ) ( IN-CITY ?auto_3632187 ?auto_3632190 ) ( not ( = ?auto_3632187 ?auto_3632189 ) ) ( not ( = ?auto_3632186 ?auto_3632188 ) ) ( OBJ-AT ?auto_3632188 ?auto_3632189 ) ( TRUCK-AT ?auto_3632191 ?auto_3632187 ) ( IN-TRUCK ?auto_3632186 ?auto_3632191 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3632188 ?auto_3632187 )
      ( DELIVER-2PKG-VERIFY ?auto_3632186 ?auto_3632188 ?auto_3632187 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3633287 - OBJ
      ?auto_3633288 - LOCATION
    )
    :vars
    (
      ?auto_3633292 - OBJ
      ?auto_3633290 - LOCATION
      ?auto_3633291 - CITY
      ?auto_3633289 - TRUCK
      ?auto_3633293 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3633287 ?auto_3633292 ) ( IN-CITY ?auto_3633290 ?auto_3633291 ) ( IN-CITY ?auto_3633288 ?auto_3633291 ) ( not ( = ?auto_3633288 ?auto_3633290 ) ) ( not ( = ?auto_3633292 ?auto_3633287 ) ) ( OBJ-AT ?auto_3633287 ?auto_3633290 ) ( IN-TRUCK ?auto_3633292 ?auto_3633289 ) ( TRUCK-AT ?auto_3633289 ?auto_3633293 ) ( IN-CITY ?auto_3633293 ?auto_3633291 ) ( not ( = ?auto_3633288 ?auto_3633293 ) ) ( not ( = ?auto_3633290 ?auto_3633293 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3633289 ?auto_3633293 ?auto_3633288 ?auto_3633291 )
      ( DELIVER-2PKG ?auto_3633292 ?auto_3633287 ?auto_3633288 )
      ( DELIVER-1PKG-VERIFY ?auto_3633287 ?auto_3633288 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3633294 - OBJ
      ?auto_3633296 - OBJ
      ?auto_3633295 - LOCATION
    )
    :vars
    (
      ?auto_3633299 - LOCATION
      ?auto_3633297 - CITY
      ?auto_3633298 - TRUCK
      ?auto_3633300 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3633296 ?auto_3633294 ) ( IN-CITY ?auto_3633299 ?auto_3633297 ) ( IN-CITY ?auto_3633295 ?auto_3633297 ) ( not ( = ?auto_3633295 ?auto_3633299 ) ) ( not ( = ?auto_3633294 ?auto_3633296 ) ) ( OBJ-AT ?auto_3633296 ?auto_3633299 ) ( IN-TRUCK ?auto_3633294 ?auto_3633298 ) ( TRUCK-AT ?auto_3633298 ?auto_3633300 ) ( IN-CITY ?auto_3633300 ?auto_3633297 ) ( not ( = ?auto_3633295 ?auto_3633300 ) ) ( not ( = ?auto_3633299 ?auto_3633300 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3633296 ?auto_3633295 )
      ( DELIVER-2PKG-VERIFY ?auto_3633294 ?auto_3633296 ?auto_3633295 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3634514 - OBJ
      ?auto_3634515 - LOCATION
    )
    :vars
    (
      ?auto_3634520 - OBJ
      ?auto_3634516 - LOCATION
      ?auto_3634518 - CITY
      ?auto_3634517 - TRUCK
      ?auto_3634519 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3634514 ?auto_3634520 ) ( IN-CITY ?auto_3634516 ?auto_3634518 ) ( IN-CITY ?auto_3634515 ?auto_3634518 ) ( not ( = ?auto_3634515 ?auto_3634516 ) ) ( not ( = ?auto_3634520 ?auto_3634514 ) ) ( OBJ-AT ?auto_3634514 ?auto_3634516 ) ( TRUCK-AT ?auto_3634517 ?auto_3634519 ) ( IN-CITY ?auto_3634519 ?auto_3634518 ) ( not ( = ?auto_3634515 ?auto_3634519 ) ) ( not ( = ?auto_3634516 ?auto_3634519 ) ) ( OBJ-AT ?auto_3634520 ?auto_3634519 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3634520 ?auto_3634517 ?auto_3634519 )
      ( DELIVER-2PKG ?auto_3634520 ?auto_3634514 ?auto_3634515 )
      ( DELIVER-1PKG-VERIFY ?auto_3634514 ?auto_3634515 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3634521 - OBJ
      ?auto_3634523 - OBJ
      ?auto_3634522 - LOCATION
    )
    :vars
    (
      ?auto_3634525 - LOCATION
      ?auto_3634526 - CITY
      ?auto_3634527 - TRUCK
      ?auto_3634524 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3634523 ?auto_3634521 ) ( IN-CITY ?auto_3634525 ?auto_3634526 ) ( IN-CITY ?auto_3634522 ?auto_3634526 ) ( not ( = ?auto_3634522 ?auto_3634525 ) ) ( not ( = ?auto_3634521 ?auto_3634523 ) ) ( OBJ-AT ?auto_3634523 ?auto_3634525 ) ( TRUCK-AT ?auto_3634527 ?auto_3634524 ) ( IN-CITY ?auto_3634524 ?auto_3634526 ) ( not ( = ?auto_3634522 ?auto_3634524 ) ) ( not ( = ?auto_3634525 ?auto_3634524 ) ) ( OBJ-AT ?auto_3634521 ?auto_3634524 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3634523 ?auto_3634522 )
      ( DELIVER-2PKG-VERIFY ?auto_3634521 ?auto_3634523 ?auto_3634522 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3643205 - OBJ
      ?auto_3643207 - OBJ
      ?auto_3643208 - OBJ
      ?auto_3643206 - LOCATION
    )
    :vars
    (
      ?auto_3643209 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3643207 ?auto_3643205 ) ( GREATER-THAN ?auto_3643208 ?auto_3643205 ) ( GREATER-THAN ?auto_3643208 ?auto_3643207 ) ( TRUCK-AT ?auto_3643209 ?auto_3643206 ) ( IN-TRUCK ?auto_3643208 ?auto_3643209 ) ( OBJ-AT ?auto_3643205 ?auto_3643206 ) ( OBJ-AT ?auto_3643207 ?auto_3643206 ) ( not ( = ?auto_3643205 ?auto_3643207 ) ) ( not ( = ?auto_3643205 ?auto_3643208 ) ) ( not ( = ?auto_3643207 ?auto_3643208 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3643208 ?auto_3643206 )
      ( DELIVER-3PKG-VERIFY ?auto_3643205 ?auto_3643207 ?auto_3643208 ?auto_3643206 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3650523 - OBJ
      ?auto_3650525 - OBJ
      ?auto_3650526 - OBJ
      ?auto_3650524 - LOCATION
    )
    :vars
    (
      ?auto_3650528 - TRUCK
      ?auto_3650529 - LOCATION
      ?auto_3650527 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3650525 ?auto_3650523 ) ( GREATER-THAN ?auto_3650526 ?auto_3650523 ) ( GREATER-THAN ?auto_3650526 ?auto_3650525 ) ( IN-TRUCK ?auto_3650526 ?auto_3650528 ) ( TRUCK-AT ?auto_3650528 ?auto_3650529 ) ( IN-CITY ?auto_3650529 ?auto_3650527 ) ( IN-CITY ?auto_3650524 ?auto_3650527 ) ( not ( = ?auto_3650524 ?auto_3650529 ) ) ( OBJ-AT ?auto_3650523 ?auto_3650524 ) ( not ( = ?auto_3650523 ?auto_3650526 ) ) ( OBJ-AT ?auto_3650525 ?auto_3650524 ) ( not ( = ?auto_3650523 ?auto_3650525 ) ) ( not ( = ?auto_3650525 ?auto_3650526 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3650523 ?auto_3650526 ?auto_3650524 )
      ( DELIVER-3PKG-VERIFY ?auto_3650523 ?auto_3650525 ?auto_3650526 ?auto_3650524 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3659876 - OBJ
      ?auto_3659878 - OBJ
      ?auto_3659879 - OBJ
      ?auto_3659877 - LOCATION
    )
    :vars
    (
      ?auto_3659880 - TRUCK
      ?auto_3659882 - LOCATION
      ?auto_3659881 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3659878 ?auto_3659876 ) ( GREATER-THAN ?auto_3659879 ?auto_3659876 ) ( GREATER-THAN ?auto_3659879 ?auto_3659878 ) ( TRUCK-AT ?auto_3659880 ?auto_3659882 ) ( IN-CITY ?auto_3659882 ?auto_3659881 ) ( IN-CITY ?auto_3659877 ?auto_3659881 ) ( not ( = ?auto_3659877 ?auto_3659882 ) ) ( OBJ-AT ?auto_3659876 ?auto_3659877 ) ( not ( = ?auto_3659876 ?auto_3659879 ) ) ( OBJ-AT ?auto_3659879 ?auto_3659882 ) ( OBJ-AT ?auto_3659878 ?auto_3659877 ) ( not ( = ?auto_3659876 ?auto_3659878 ) ) ( not ( = ?auto_3659878 ?auto_3659879 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3659876 ?auto_3659879 ?auto_3659877 )
      ( DELIVER-3PKG-VERIFY ?auto_3659876 ?auto_3659878 ?auto_3659879 ?auto_3659877 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3669229 - OBJ
      ?auto_3669231 - OBJ
      ?auto_3669232 - OBJ
      ?auto_3669230 - LOCATION
    )
    :vars
    (
      ?auto_3669234 - LOCATION
      ?auto_3669235 - CITY
      ?auto_3669233 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3669231 ?auto_3669229 ) ( GREATER-THAN ?auto_3669232 ?auto_3669229 ) ( GREATER-THAN ?auto_3669232 ?auto_3669231 ) ( IN-CITY ?auto_3669234 ?auto_3669235 ) ( IN-CITY ?auto_3669230 ?auto_3669235 ) ( not ( = ?auto_3669230 ?auto_3669234 ) ) ( OBJ-AT ?auto_3669229 ?auto_3669230 ) ( not ( = ?auto_3669229 ?auto_3669232 ) ) ( OBJ-AT ?auto_3669232 ?auto_3669234 ) ( TRUCK-AT ?auto_3669233 ?auto_3669230 ) ( OBJ-AT ?auto_3669231 ?auto_3669230 ) ( not ( = ?auto_3669229 ?auto_3669231 ) ) ( not ( = ?auto_3669231 ?auto_3669232 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3669229 ?auto_3669232 ?auto_3669230 )
      ( DELIVER-3PKG-VERIFY ?auto_3669229 ?auto_3669231 ?auto_3669232 ?auto_3669230 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3687890 - OBJ
      ?auto_3687891 - LOCATION
    )
    :vars
    (
      ?auto_3687893 - OBJ
      ?auto_3687895 - LOCATION
      ?auto_3687894 - CITY
      ?auto_3687892 - TRUCK
      ?auto_3687896 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3687890 ?auto_3687893 ) ( IN-CITY ?auto_3687895 ?auto_3687894 ) ( IN-CITY ?auto_3687891 ?auto_3687894 ) ( not ( = ?auto_3687891 ?auto_3687895 ) ) ( OBJ-AT ?auto_3687893 ?auto_3687891 ) ( not ( = ?auto_3687893 ?auto_3687890 ) ) ( OBJ-AT ?auto_3687890 ?auto_3687895 ) ( TRUCK-AT ?auto_3687892 ?auto_3687896 ) ( IN-CITY ?auto_3687896 ?auto_3687894 ) ( not ( = ?auto_3687891 ?auto_3687896 ) ) ( not ( = ?auto_3687895 ?auto_3687896 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3687892 ?auto_3687896 ?auto_3687891 ?auto_3687894 )
      ( DELIVER-2PKG ?auto_3687893 ?auto_3687890 ?auto_3687891 )
      ( DELIVER-1PKG-VERIFY ?auto_3687890 ?auto_3687891 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3687897 - OBJ
      ?auto_3687899 - OBJ
      ?auto_3687898 - LOCATION
    )
    :vars
    (
      ?auto_3687903 - LOCATION
      ?auto_3687900 - CITY
      ?auto_3687902 - TRUCK
      ?auto_3687901 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3687899 ?auto_3687897 ) ( IN-CITY ?auto_3687903 ?auto_3687900 ) ( IN-CITY ?auto_3687898 ?auto_3687900 ) ( not ( = ?auto_3687898 ?auto_3687903 ) ) ( OBJ-AT ?auto_3687897 ?auto_3687898 ) ( not ( = ?auto_3687897 ?auto_3687899 ) ) ( OBJ-AT ?auto_3687899 ?auto_3687903 ) ( TRUCK-AT ?auto_3687902 ?auto_3687901 ) ( IN-CITY ?auto_3687901 ?auto_3687900 ) ( not ( = ?auto_3687898 ?auto_3687901 ) ) ( not ( = ?auto_3687903 ?auto_3687901 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3687899 ?auto_3687898 )
      ( DELIVER-2PKG-VERIFY ?auto_3687897 ?auto_3687899 ?auto_3687898 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3786656 - OBJ
      ?auto_3786658 - OBJ
      ?auto_3786659 - OBJ
      ?auto_3786660 - OBJ
      ?auto_3786657 - LOCATION
    )
    :vars
    (
      ?auto_3786661 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3786658 ?auto_3786656 ) ( GREATER-THAN ?auto_3786659 ?auto_3786656 ) ( GREATER-THAN ?auto_3786659 ?auto_3786658 ) ( GREATER-THAN ?auto_3786660 ?auto_3786656 ) ( GREATER-THAN ?auto_3786660 ?auto_3786658 ) ( GREATER-THAN ?auto_3786660 ?auto_3786659 ) ( TRUCK-AT ?auto_3786661 ?auto_3786657 ) ( IN-TRUCK ?auto_3786660 ?auto_3786661 ) ( OBJ-AT ?auto_3786656 ?auto_3786657 ) ( OBJ-AT ?auto_3786658 ?auto_3786657 ) ( OBJ-AT ?auto_3786659 ?auto_3786657 ) ( not ( = ?auto_3786656 ?auto_3786658 ) ) ( not ( = ?auto_3786656 ?auto_3786659 ) ) ( not ( = ?auto_3786656 ?auto_3786660 ) ) ( not ( = ?auto_3786658 ?auto_3786659 ) ) ( not ( = ?auto_3786658 ?auto_3786660 ) ) ( not ( = ?auto_3786659 ?auto_3786660 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3786660 ?auto_3786657 )
      ( DELIVER-4PKG-VERIFY ?auto_3786656 ?auto_3786658 ?auto_3786659 ?auto_3786660 ?auto_3786657 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3820442 - OBJ
      ?auto_3820444 - OBJ
      ?auto_3820445 - OBJ
      ?auto_3820446 - OBJ
      ?auto_3820443 - LOCATION
    )
    :vars
    (
      ?auto_3820448 - TRUCK
      ?auto_3820449 - LOCATION
      ?auto_3820447 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3820444 ?auto_3820442 ) ( GREATER-THAN ?auto_3820445 ?auto_3820442 ) ( GREATER-THAN ?auto_3820445 ?auto_3820444 ) ( GREATER-THAN ?auto_3820446 ?auto_3820442 ) ( GREATER-THAN ?auto_3820446 ?auto_3820444 ) ( GREATER-THAN ?auto_3820446 ?auto_3820445 ) ( IN-TRUCK ?auto_3820446 ?auto_3820448 ) ( TRUCK-AT ?auto_3820448 ?auto_3820449 ) ( IN-CITY ?auto_3820449 ?auto_3820447 ) ( IN-CITY ?auto_3820443 ?auto_3820447 ) ( not ( = ?auto_3820443 ?auto_3820449 ) ) ( OBJ-AT ?auto_3820442 ?auto_3820443 ) ( not ( = ?auto_3820442 ?auto_3820446 ) ) ( OBJ-AT ?auto_3820444 ?auto_3820443 ) ( OBJ-AT ?auto_3820445 ?auto_3820443 ) ( not ( = ?auto_3820442 ?auto_3820444 ) ) ( not ( = ?auto_3820442 ?auto_3820445 ) ) ( not ( = ?auto_3820444 ?auto_3820445 ) ) ( not ( = ?auto_3820444 ?auto_3820446 ) ) ( not ( = ?auto_3820445 ?auto_3820446 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3820442 ?auto_3820446 ?auto_3820443 )
      ( DELIVER-4PKG-VERIFY ?auto_3820442 ?auto_3820444 ?auto_3820445 ?auto_3820446 ?auto_3820443 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3863798 - OBJ
      ?auto_3863800 - OBJ
      ?auto_3863801 - OBJ
      ?auto_3863802 - OBJ
      ?auto_3863799 - LOCATION
    )
    :vars
    (
      ?auto_3863803 - TRUCK
      ?auto_3863804 - LOCATION
      ?auto_3863805 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3863800 ?auto_3863798 ) ( GREATER-THAN ?auto_3863801 ?auto_3863798 ) ( GREATER-THAN ?auto_3863801 ?auto_3863800 ) ( GREATER-THAN ?auto_3863802 ?auto_3863798 ) ( GREATER-THAN ?auto_3863802 ?auto_3863800 ) ( GREATER-THAN ?auto_3863802 ?auto_3863801 ) ( TRUCK-AT ?auto_3863803 ?auto_3863804 ) ( IN-CITY ?auto_3863804 ?auto_3863805 ) ( IN-CITY ?auto_3863799 ?auto_3863805 ) ( not ( = ?auto_3863799 ?auto_3863804 ) ) ( OBJ-AT ?auto_3863798 ?auto_3863799 ) ( not ( = ?auto_3863798 ?auto_3863802 ) ) ( OBJ-AT ?auto_3863802 ?auto_3863804 ) ( OBJ-AT ?auto_3863800 ?auto_3863799 ) ( OBJ-AT ?auto_3863801 ?auto_3863799 ) ( not ( = ?auto_3863798 ?auto_3863800 ) ) ( not ( = ?auto_3863798 ?auto_3863801 ) ) ( not ( = ?auto_3863800 ?auto_3863801 ) ) ( not ( = ?auto_3863800 ?auto_3863802 ) ) ( not ( = ?auto_3863801 ?auto_3863802 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3863798 ?auto_3863802 ?auto_3863799 )
      ( DELIVER-4PKG-VERIFY ?auto_3863798 ?auto_3863800 ?auto_3863801 ?auto_3863802 ?auto_3863799 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3907154 - OBJ
      ?auto_3907156 - OBJ
      ?auto_3907157 - OBJ
      ?auto_3907158 - OBJ
      ?auto_3907155 - LOCATION
    )
    :vars
    (
      ?auto_3907161 - LOCATION
      ?auto_3907160 - CITY
      ?auto_3907159 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3907156 ?auto_3907154 ) ( GREATER-THAN ?auto_3907157 ?auto_3907154 ) ( GREATER-THAN ?auto_3907157 ?auto_3907156 ) ( GREATER-THAN ?auto_3907158 ?auto_3907154 ) ( GREATER-THAN ?auto_3907158 ?auto_3907156 ) ( GREATER-THAN ?auto_3907158 ?auto_3907157 ) ( IN-CITY ?auto_3907161 ?auto_3907160 ) ( IN-CITY ?auto_3907155 ?auto_3907160 ) ( not ( = ?auto_3907155 ?auto_3907161 ) ) ( OBJ-AT ?auto_3907154 ?auto_3907155 ) ( not ( = ?auto_3907154 ?auto_3907158 ) ) ( OBJ-AT ?auto_3907158 ?auto_3907161 ) ( TRUCK-AT ?auto_3907159 ?auto_3907155 ) ( OBJ-AT ?auto_3907156 ?auto_3907155 ) ( OBJ-AT ?auto_3907157 ?auto_3907155 ) ( not ( = ?auto_3907154 ?auto_3907156 ) ) ( not ( = ?auto_3907154 ?auto_3907157 ) ) ( not ( = ?auto_3907156 ?auto_3907157 ) ) ( not ( = ?auto_3907156 ?auto_3907158 ) ) ( not ( = ?auto_3907157 ?auto_3907158 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3907154 ?auto_3907158 ?auto_3907155 )
      ( DELIVER-4PKG-VERIFY ?auto_3907154 ?auto_3907156 ?auto_3907157 ?auto_3907158 ?auto_3907155 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3993543 - OBJ
      ?auto_3993545 - OBJ
      ?auto_3993546 - OBJ
      ?auto_3993544 - LOCATION
    )
    :vars
    (
      ?auto_3993549 - LOCATION
      ?auto_3993547 - CITY
      ?auto_3993548 - TRUCK
      ?auto_3993550 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3993545 ?auto_3993543 ) ( GREATER-THAN ?auto_3993546 ?auto_3993543 ) ( GREATER-THAN ?auto_3993546 ?auto_3993545 ) ( IN-CITY ?auto_3993549 ?auto_3993547 ) ( IN-CITY ?auto_3993544 ?auto_3993547 ) ( not ( = ?auto_3993544 ?auto_3993549 ) ) ( OBJ-AT ?auto_3993543 ?auto_3993544 ) ( not ( = ?auto_3993543 ?auto_3993546 ) ) ( OBJ-AT ?auto_3993546 ?auto_3993549 ) ( TRUCK-AT ?auto_3993548 ?auto_3993550 ) ( IN-CITY ?auto_3993550 ?auto_3993547 ) ( not ( = ?auto_3993544 ?auto_3993550 ) ) ( not ( = ?auto_3993549 ?auto_3993550 ) ) ( OBJ-AT ?auto_3993545 ?auto_3993544 ) ( not ( = ?auto_3993543 ?auto_3993545 ) ) ( not ( = ?auto_3993545 ?auto_3993546 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3993543 ?auto_3993546 ?auto_3993544 )
      ( DELIVER-3PKG-VERIFY ?auto_3993543 ?auto_3993545 ?auto_3993546 ?auto_3993544 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4357843 - OBJ
      ?auto_4357844 - LOCATION
    )
    :vars
    (
      ?auto_4357848 - OBJ
      ?auto_4357846 - LOCATION
      ?auto_4357847 - CITY
      ?auto_4357845 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4357843 ?auto_4357848 ) ( IN-CITY ?auto_4357846 ?auto_4357847 ) ( IN-CITY ?auto_4357844 ?auto_4357847 ) ( not ( = ?auto_4357844 ?auto_4357846 ) ) ( not ( = ?auto_4357848 ?auto_4357843 ) ) ( OBJ-AT ?auto_4357843 ?auto_4357846 ) ( IN-TRUCK ?auto_4357848 ?auto_4357845 ) ( TRUCK-AT ?auto_4357845 ?auto_4357846 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4357845 ?auto_4357846 ?auto_4357844 ?auto_4357847 )
      ( DELIVER-2PKG ?auto_4357848 ?auto_4357843 ?auto_4357844 )
      ( DELIVER-1PKG-VERIFY ?auto_4357843 ?auto_4357844 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4357849 - OBJ
      ?auto_4357851 - OBJ
      ?auto_4357850 - LOCATION
    )
    :vars
    (
      ?auto_4357853 - LOCATION
      ?auto_4357852 - CITY
      ?auto_4357854 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4357851 ?auto_4357849 ) ( IN-CITY ?auto_4357853 ?auto_4357852 ) ( IN-CITY ?auto_4357850 ?auto_4357852 ) ( not ( = ?auto_4357850 ?auto_4357853 ) ) ( not ( = ?auto_4357849 ?auto_4357851 ) ) ( OBJ-AT ?auto_4357851 ?auto_4357853 ) ( IN-TRUCK ?auto_4357849 ?auto_4357854 ) ( TRUCK-AT ?auto_4357854 ?auto_4357853 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4357851 ?auto_4357850 )
      ( DELIVER-2PKG-VERIFY ?auto_4357849 ?auto_4357851 ?auto_4357850 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_4584566 - OBJ
      ?auto_4584568 - OBJ
      ?auto_4584569 - OBJ
      ?auto_4584570 - OBJ
      ?auto_4584571 - OBJ
      ?auto_4584567 - LOCATION
    )
    :vars
    (
      ?auto_4584572 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4584568 ?auto_4584566 ) ( GREATER-THAN ?auto_4584569 ?auto_4584566 ) ( GREATER-THAN ?auto_4584569 ?auto_4584568 ) ( GREATER-THAN ?auto_4584570 ?auto_4584566 ) ( GREATER-THAN ?auto_4584570 ?auto_4584568 ) ( GREATER-THAN ?auto_4584570 ?auto_4584569 ) ( GREATER-THAN ?auto_4584571 ?auto_4584566 ) ( GREATER-THAN ?auto_4584571 ?auto_4584568 ) ( GREATER-THAN ?auto_4584571 ?auto_4584569 ) ( GREATER-THAN ?auto_4584571 ?auto_4584570 ) ( TRUCK-AT ?auto_4584572 ?auto_4584567 ) ( IN-TRUCK ?auto_4584571 ?auto_4584572 ) ( OBJ-AT ?auto_4584566 ?auto_4584567 ) ( OBJ-AT ?auto_4584568 ?auto_4584567 ) ( OBJ-AT ?auto_4584569 ?auto_4584567 ) ( OBJ-AT ?auto_4584570 ?auto_4584567 ) ( not ( = ?auto_4584566 ?auto_4584568 ) ) ( not ( = ?auto_4584566 ?auto_4584569 ) ) ( not ( = ?auto_4584566 ?auto_4584570 ) ) ( not ( = ?auto_4584566 ?auto_4584571 ) ) ( not ( = ?auto_4584568 ?auto_4584569 ) ) ( not ( = ?auto_4584568 ?auto_4584570 ) ) ( not ( = ?auto_4584568 ?auto_4584571 ) ) ( not ( = ?auto_4584569 ?auto_4584570 ) ) ( not ( = ?auto_4584569 ?auto_4584571 ) ) ( not ( = ?auto_4584570 ?auto_4584571 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4584571 ?auto_4584567 )
      ( DELIVER-5PKG-VERIFY ?auto_4584566 ?auto_4584568 ?auto_4584569 ?auto_4584570 ?auto_4584571 ?auto_4584567 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_4695286 - OBJ
      ?auto_4695288 - OBJ
      ?auto_4695289 - OBJ
      ?auto_4695290 - OBJ
      ?auto_4695291 - OBJ
      ?auto_4695287 - LOCATION
    )
    :vars
    (
      ?auto_4695293 - TRUCK
      ?auto_4695294 - LOCATION
      ?auto_4695292 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4695288 ?auto_4695286 ) ( GREATER-THAN ?auto_4695289 ?auto_4695286 ) ( GREATER-THAN ?auto_4695289 ?auto_4695288 ) ( GREATER-THAN ?auto_4695290 ?auto_4695286 ) ( GREATER-THAN ?auto_4695290 ?auto_4695288 ) ( GREATER-THAN ?auto_4695290 ?auto_4695289 ) ( GREATER-THAN ?auto_4695291 ?auto_4695286 ) ( GREATER-THAN ?auto_4695291 ?auto_4695288 ) ( GREATER-THAN ?auto_4695291 ?auto_4695289 ) ( GREATER-THAN ?auto_4695291 ?auto_4695290 ) ( IN-TRUCK ?auto_4695291 ?auto_4695293 ) ( TRUCK-AT ?auto_4695293 ?auto_4695294 ) ( IN-CITY ?auto_4695294 ?auto_4695292 ) ( IN-CITY ?auto_4695287 ?auto_4695292 ) ( not ( = ?auto_4695287 ?auto_4695294 ) ) ( OBJ-AT ?auto_4695286 ?auto_4695287 ) ( not ( = ?auto_4695286 ?auto_4695291 ) ) ( OBJ-AT ?auto_4695288 ?auto_4695287 ) ( OBJ-AT ?auto_4695289 ?auto_4695287 ) ( OBJ-AT ?auto_4695290 ?auto_4695287 ) ( not ( = ?auto_4695286 ?auto_4695288 ) ) ( not ( = ?auto_4695286 ?auto_4695289 ) ) ( not ( = ?auto_4695286 ?auto_4695290 ) ) ( not ( = ?auto_4695288 ?auto_4695289 ) ) ( not ( = ?auto_4695288 ?auto_4695290 ) ) ( not ( = ?auto_4695288 ?auto_4695291 ) ) ( not ( = ?auto_4695289 ?auto_4695290 ) ) ( not ( = ?auto_4695289 ?auto_4695291 ) ) ( not ( = ?auto_4695290 ?auto_4695291 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4695286 ?auto_4695291 ?auto_4695287 )
      ( DELIVER-5PKG-VERIFY ?auto_4695286 ?auto_4695288 ?auto_4695289 ?auto_4695290 ?auto_4695291 ?auto_4695287 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_4837251 - OBJ
      ?auto_4837253 - OBJ
      ?auto_4837254 - OBJ
      ?auto_4837255 - OBJ
      ?auto_4837256 - OBJ
      ?auto_4837252 - LOCATION
    )
    :vars
    (
      ?auto_4837259 - TRUCK
      ?auto_4837257 - LOCATION
      ?auto_4837258 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4837253 ?auto_4837251 ) ( GREATER-THAN ?auto_4837254 ?auto_4837251 ) ( GREATER-THAN ?auto_4837254 ?auto_4837253 ) ( GREATER-THAN ?auto_4837255 ?auto_4837251 ) ( GREATER-THAN ?auto_4837255 ?auto_4837253 ) ( GREATER-THAN ?auto_4837255 ?auto_4837254 ) ( GREATER-THAN ?auto_4837256 ?auto_4837251 ) ( GREATER-THAN ?auto_4837256 ?auto_4837253 ) ( GREATER-THAN ?auto_4837256 ?auto_4837254 ) ( GREATER-THAN ?auto_4837256 ?auto_4837255 ) ( TRUCK-AT ?auto_4837259 ?auto_4837257 ) ( IN-CITY ?auto_4837257 ?auto_4837258 ) ( IN-CITY ?auto_4837252 ?auto_4837258 ) ( not ( = ?auto_4837252 ?auto_4837257 ) ) ( OBJ-AT ?auto_4837251 ?auto_4837252 ) ( not ( = ?auto_4837251 ?auto_4837256 ) ) ( OBJ-AT ?auto_4837256 ?auto_4837257 ) ( OBJ-AT ?auto_4837253 ?auto_4837252 ) ( OBJ-AT ?auto_4837254 ?auto_4837252 ) ( OBJ-AT ?auto_4837255 ?auto_4837252 ) ( not ( = ?auto_4837251 ?auto_4837253 ) ) ( not ( = ?auto_4837251 ?auto_4837254 ) ) ( not ( = ?auto_4837251 ?auto_4837255 ) ) ( not ( = ?auto_4837253 ?auto_4837254 ) ) ( not ( = ?auto_4837253 ?auto_4837255 ) ) ( not ( = ?auto_4837253 ?auto_4837256 ) ) ( not ( = ?auto_4837254 ?auto_4837255 ) ) ( not ( = ?auto_4837254 ?auto_4837256 ) ) ( not ( = ?auto_4837255 ?auto_4837256 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4837251 ?auto_4837256 ?auto_4837252 )
      ( DELIVER-5PKG-VERIFY ?auto_4837251 ?auto_4837253 ?auto_4837254 ?auto_4837255 ?auto_4837256 ?auto_4837252 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_4979216 - OBJ
      ?auto_4979218 - OBJ
      ?auto_4979219 - OBJ
      ?auto_4979220 - OBJ
      ?auto_4979221 - OBJ
      ?auto_4979217 - LOCATION
    )
    :vars
    (
      ?auto_4979224 - LOCATION
      ?auto_4979222 - CITY
      ?auto_4979223 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4979218 ?auto_4979216 ) ( GREATER-THAN ?auto_4979219 ?auto_4979216 ) ( GREATER-THAN ?auto_4979219 ?auto_4979218 ) ( GREATER-THAN ?auto_4979220 ?auto_4979216 ) ( GREATER-THAN ?auto_4979220 ?auto_4979218 ) ( GREATER-THAN ?auto_4979220 ?auto_4979219 ) ( GREATER-THAN ?auto_4979221 ?auto_4979216 ) ( GREATER-THAN ?auto_4979221 ?auto_4979218 ) ( GREATER-THAN ?auto_4979221 ?auto_4979219 ) ( GREATER-THAN ?auto_4979221 ?auto_4979220 ) ( IN-CITY ?auto_4979224 ?auto_4979222 ) ( IN-CITY ?auto_4979217 ?auto_4979222 ) ( not ( = ?auto_4979217 ?auto_4979224 ) ) ( OBJ-AT ?auto_4979216 ?auto_4979217 ) ( not ( = ?auto_4979216 ?auto_4979221 ) ) ( OBJ-AT ?auto_4979221 ?auto_4979224 ) ( TRUCK-AT ?auto_4979223 ?auto_4979217 ) ( OBJ-AT ?auto_4979218 ?auto_4979217 ) ( OBJ-AT ?auto_4979219 ?auto_4979217 ) ( OBJ-AT ?auto_4979220 ?auto_4979217 ) ( not ( = ?auto_4979216 ?auto_4979218 ) ) ( not ( = ?auto_4979216 ?auto_4979219 ) ) ( not ( = ?auto_4979216 ?auto_4979220 ) ) ( not ( = ?auto_4979218 ?auto_4979219 ) ) ( not ( = ?auto_4979218 ?auto_4979220 ) ) ( not ( = ?auto_4979218 ?auto_4979221 ) ) ( not ( = ?auto_4979219 ?auto_4979220 ) ) ( not ( = ?auto_4979219 ?auto_4979221 ) ) ( not ( = ?auto_4979220 ?auto_4979221 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4979216 ?auto_4979221 ?auto_4979217 )
      ( DELIVER-5PKG-VERIFY ?auto_4979216 ?auto_4979218 ?auto_4979219 ?auto_4979220 ?auto_4979221 ?auto_4979217 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5259484 - OBJ
      ?auto_5259486 - OBJ
      ?auto_5259487 - OBJ
      ?auto_5259488 - OBJ
      ?auto_5259485 - LOCATION
    )
    :vars
    (
      ?auto_5259492 - LOCATION
      ?auto_5259490 - CITY
      ?auto_5259489 - TRUCK
      ?auto_5259491 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_5259486 ?auto_5259484 ) ( GREATER-THAN ?auto_5259487 ?auto_5259484 ) ( GREATER-THAN ?auto_5259487 ?auto_5259486 ) ( GREATER-THAN ?auto_5259488 ?auto_5259484 ) ( GREATER-THAN ?auto_5259488 ?auto_5259486 ) ( GREATER-THAN ?auto_5259488 ?auto_5259487 ) ( IN-CITY ?auto_5259492 ?auto_5259490 ) ( IN-CITY ?auto_5259485 ?auto_5259490 ) ( not ( = ?auto_5259485 ?auto_5259492 ) ) ( OBJ-AT ?auto_5259484 ?auto_5259485 ) ( not ( = ?auto_5259484 ?auto_5259488 ) ) ( OBJ-AT ?auto_5259488 ?auto_5259492 ) ( TRUCK-AT ?auto_5259489 ?auto_5259491 ) ( IN-CITY ?auto_5259491 ?auto_5259490 ) ( not ( = ?auto_5259485 ?auto_5259491 ) ) ( not ( = ?auto_5259492 ?auto_5259491 ) ) ( OBJ-AT ?auto_5259486 ?auto_5259485 ) ( OBJ-AT ?auto_5259487 ?auto_5259485 ) ( not ( = ?auto_5259484 ?auto_5259486 ) ) ( not ( = ?auto_5259484 ?auto_5259487 ) ) ( not ( = ?auto_5259486 ?auto_5259487 ) ) ( not ( = ?auto_5259486 ?auto_5259488 ) ) ( not ( = ?auto_5259487 ?auto_5259488 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5259484 ?auto_5259488 ?auto_5259485 )
      ( DELIVER-4PKG-VERIFY ?auto_5259484 ?auto_5259486 ?auto_5259487 ?auto_5259488 ?auto_5259485 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_7789913 - OBJ
      ?auto_7789915 - OBJ
      ?auto_7789916 - OBJ
      ?auto_7789917 - OBJ
      ?auto_7789918 - OBJ
      ?auto_7789919 - OBJ
      ?auto_7789914 - LOCATION
    )
    :vars
    (
      ?auto_7789920 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_7789915 ?auto_7789913 ) ( GREATER-THAN ?auto_7789916 ?auto_7789913 ) ( GREATER-THAN ?auto_7789916 ?auto_7789915 ) ( GREATER-THAN ?auto_7789917 ?auto_7789913 ) ( GREATER-THAN ?auto_7789917 ?auto_7789915 ) ( GREATER-THAN ?auto_7789917 ?auto_7789916 ) ( GREATER-THAN ?auto_7789918 ?auto_7789913 ) ( GREATER-THAN ?auto_7789918 ?auto_7789915 ) ( GREATER-THAN ?auto_7789918 ?auto_7789916 ) ( GREATER-THAN ?auto_7789918 ?auto_7789917 ) ( GREATER-THAN ?auto_7789919 ?auto_7789913 ) ( GREATER-THAN ?auto_7789919 ?auto_7789915 ) ( GREATER-THAN ?auto_7789919 ?auto_7789916 ) ( GREATER-THAN ?auto_7789919 ?auto_7789917 ) ( GREATER-THAN ?auto_7789919 ?auto_7789918 ) ( TRUCK-AT ?auto_7789920 ?auto_7789914 ) ( IN-TRUCK ?auto_7789919 ?auto_7789920 ) ( OBJ-AT ?auto_7789913 ?auto_7789914 ) ( OBJ-AT ?auto_7789915 ?auto_7789914 ) ( OBJ-AT ?auto_7789916 ?auto_7789914 ) ( OBJ-AT ?auto_7789917 ?auto_7789914 ) ( OBJ-AT ?auto_7789918 ?auto_7789914 ) ( not ( = ?auto_7789913 ?auto_7789915 ) ) ( not ( = ?auto_7789913 ?auto_7789916 ) ) ( not ( = ?auto_7789913 ?auto_7789917 ) ) ( not ( = ?auto_7789913 ?auto_7789918 ) ) ( not ( = ?auto_7789913 ?auto_7789919 ) ) ( not ( = ?auto_7789915 ?auto_7789916 ) ) ( not ( = ?auto_7789915 ?auto_7789917 ) ) ( not ( = ?auto_7789915 ?auto_7789918 ) ) ( not ( = ?auto_7789915 ?auto_7789919 ) ) ( not ( = ?auto_7789916 ?auto_7789917 ) ) ( not ( = ?auto_7789916 ?auto_7789918 ) ) ( not ( = ?auto_7789916 ?auto_7789919 ) ) ( not ( = ?auto_7789917 ?auto_7789918 ) ) ( not ( = ?auto_7789917 ?auto_7789919 ) ) ( not ( = ?auto_7789918 ?auto_7789919 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7789919 ?auto_7789914 )
      ( DELIVER-6PKG-VERIFY ?auto_7789913 ?auto_7789915 ?auto_7789916 ?auto_7789917 ?auto_7789918 ?auto_7789919 ?auto_7789914 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_8090323 - OBJ
      ?auto_8090325 - OBJ
      ?auto_8090326 - OBJ
      ?auto_8090327 - OBJ
      ?auto_8090328 - OBJ
      ?auto_8090329 - OBJ
      ?auto_8090324 - LOCATION
    )
    :vars
    (
      ?auto_8090332 - TRUCK
      ?auto_8090331 - LOCATION
      ?auto_8090330 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8090325 ?auto_8090323 ) ( GREATER-THAN ?auto_8090326 ?auto_8090323 ) ( GREATER-THAN ?auto_8090326 ?auto_8090325 ) ( GREATER-THAN ?auto_8090327 ?auto_8090323 ) ( GREATER-THAN ?auto_8090327 ?auto_8090325 ) ( GREATER-THAN ?auto_8090327 ?auto_8090326 ) ( GREATER-THAN ?auto_8090328 ?auto_8090323 ) ( GREATER-THAN ?auto_8090328 ?auto_8090325 ) ( GREATER-THAN ?auto_8090328 ?auto_8090326 ) ( GREATER-THAN ?auto_8090328 ?auto_8090327 ) ( GREATER-THAN ?auto_8090329 ?auto_8090323 ) ( GREATER-THAN ?auto_8090329 ?auto_8090325 ) ( GREATER-THAN ?auto_8090329 ?auto_8090326 ) ( GREATER-THAN ?auto_8090329 ?auto_8090327 ) ( GREATER-THAN ?auto_8090329 ?auto_8090328 ) ( IN-TRUCK ?auto_8090329 ?auto_8090332 ) ( TRUCK-AT ?auto_8090332 ?auto_8090331 ) ( IN-CITY ?auto_8090331 ?auto_8090330 ) ( IN-CITY ?auto_8090324 ?auto_8090330 ) ( not ( = ?auto_8090324 ?auto_8090331 ) ) ( OBJ-AT ?auto_8090323 ?auto_8090324 ) ( not ( = ?auto_8090323 ?auto_8090329 ) ) ( OBJ-AT ?auto_8090325 ?auto_8090324 ) ( OBJ-AT ?auto_8090326 ?auto_8090324 ) ( OBJ-AT ?auto_8090327 ?auto_8090324 ) ( OBJ-AT ?auto_8090328 ?auto_8090324 ) ( not ( = ?auto_8090323 ?auto_8090325 ) ) ( not ( = ?auto_8090323 ?auto_8090326 ) ) ( not ( = ?auto_8090323 ?auto_8090327 ) ) ( not ( = ?auto_8090323 ?auto_8090328 ) ) ( not ( = ?auto_8090325 ?auto_8090326 ) ) ( not ( = ?auto_8090325 ?auto_8090327 ) ) ( not ( = ?auto_8090325 ?auto_8090328 ) ) ( not ( = ?auto_8090325 ?auto_8090329 ) ) ( not ( = ?auto_8090326 ?auto_8090327 ) ) ( not ( = ?auto_8090326 ?auto_8090328 ) ) ( not ( = ?auto_8090326 ?auto_8090329 ) ) ( not ( = ?auto_8090327 ?auto_8090328 ) ) ( not ( = ?auto_8090327 ?auto_8090329 ) ) ( not ( = ?auto_8090328 ?auto_8090329 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8090323 ?auto_8090329 ?auto_8090324 )
      ( DELIVER-6PKG-VERIFY ?auto_8090323 ?auto_8090325 ?auto_8090326 ?auto_8090327 ?auto_8090328 ?auto_8090329 ?auto_8090324 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_8462545 - OBJ
      ?auto_8462547 - OBJ
      ?auto_8462548 - OBJ
      ?auto_8462549 - OBJ
      ?auto_8462550 - OBJ
      ?auto_8462551 - OBJ
      ?auto_8462546 - LOCATION
    )
    :vars
    (
      ?auto_8462554 - TRUCK
      ?auto_8462553 - LOCATION
      ?auto_8462552 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8462547 ?auto_8462545 ) ( GREATER-THAN ?auto_8462548 ?auto_8462545 ) ( GREATER-THAN ?auto_8462548 ?auto_8462547 ) ( GREATER-THAN ?auto_8462549 ?auto_8462545 ) ( GREATER-THAN ?auto_8462549 ?auto_8462547 ) ( GREATER-THAN ?auto_8462549 ?auto_8462548 ) ( GREATER-THAN ?auto_8462550 ?auto_8462545 ) ( GREATER-THAN ?auto_8462550 ?auto_8462547 ) ( GREATER-THAN ?auto_8462550 ?auto_8462548 ) ( GREATER-THAN ?auto_8462550 ?auto_8462549 ) ( GREATER-THAN ?auto_8462551 ?auto_8462545 ) ( GREATER-THAN ?auto_8462551 ?auto_8462547 ) ( GREATER-THAN ?auto_8462551 ?auto_8462548 ) ( GREATER-THAN ?auto_8462551 ?auto_8462549 ) ( GREATER-THAN ?auto_8462551 ?auto_8462550 ) ( TRUCK-AT ?auto_8462554 ?auto_8462553 ) ( IN-CITY ?auto_8462553 ?auto_8462552 ) ( IN-CITY ?auto_8462546 ?auto_8462552 ) ( not ( = ?auto_8462546 ?auto_8462553 ) ) ( OBJ-AT ?auto_8462545 ?auto_8462546 ) ( not ( = ?auto_8462545 ?auto_8462551 ) ) ( OBJ-AT ?auto_8462551 ?auto_8462553 ) ( OBJ-AT ?auto_8462547 ?auto_8462546 ) ( OBJ-AT ?auto_8462548 ?auto_8462546 ) ( OBJ-AT ?auto_8462549 ?auto_8462546 ) ( OBJ-AT ?auto_8462550 ?auto_8462546 ) ( not ( = ?auto_8462545 ?auto_8462547 ) ) ( not ( = ?auto_8462545 ?auto_8462548 ) ) ( not ( = ?auto_8462545 ?auto_8462549 ) ) ( not ( = ?auto_8462545 ?auto_8462550 ) ) ( not ( = ?auto_8462547 ?auto_8462548 ) ) ( not ( = ?auto_8462547 ?auto_8462549 ) ) ( not ( = ?auto_8462547 ?auto_8462550 ) ) ( not ( = ?auto_8462547 ?auto_8462551 ) ) ( not ( = ?auto_8462548 ?auto_8462549 ) ) ( not ( = ?auto_8462548 ?auto_8462550 ) ) ( not ( = ?auto_8462548 ?auto_8462551 ) ) ( not ( = ?auto_8462549 ?auto_8462550 ) ) ( not ( = ?auto_8462549 ?auto_8462551 ) ) ( not ( = ?auto_8462550 ?auto_8462551 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8462545 ?auto_8462551 ?auto_8462546 )
      ( DELIVER-6PKG-VERIFY ?auto_8462545 ?auto_8462547 ?auto_8462548 ?auto_8462549 ?auto_8462550 ?auto_8462551 ?auto_8462546 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_8834767 - OBJ
      ?auto_8834769 - OBJ
      ?auto_8834770 - OBJ
      ?auto_8834771 - OBJ
      ?auto_8834772 - OBJ
      ?auto_8834773 - OBJ
      ?auto_8834768 - LOCATION
    )
    :vars
    (
      ?auto_8834776 - LOCATION
      ?auto_8834775 - CITY
      ?auto_8834774 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8834769 ?auto_8834767 ) ( GREATER-THAN ?auto_8834770 ?auto_8834767 ) ( GREATER-THAN ?auto_8834770 ?auto_8834769 ) ( GREATER-THAN ?auto_8834771 ?auto_8834767 ) ( GREATER-THAN ?auto_8834771 ?auto_8834769 ) ( GREATER-THAN ?auto_8834771 ?auto_8834770 ) ( GREATER-THAN ?auto_8834772 ?auto_8834767 ) ( GREATER-THAN ?auto_8834772 ?auto_8834769 ) ( GREATER-THAN ?auto_8834772 ?auto_8834770 ) ( GREATER-THAN ?auto_8834772 ?auto_8834771 ) ( GREATER-THAN ?auto_8834773 ?auto_8834767 ) ( GREATER-THAN ?auto_8834773 ?auto_8834769 ) ( GREATER-THAN ?auto_8834773 ?auto_8834770 ) ( GREATER-THAN ?auto_8834773 ?auto_8834771 ) ( GREATER-THAN ?auto_8834773 ?auto_8834772 ) ( IN-CITY ?auto_8834776 ?auto_8834775 ) ( IN-CITY ?auto_8834768 ?auto_8834775 ) ( not ( = ?auto_8834768 ?auto_8834776 ) ) ( OBJ-AT ?auto_8834767 ?auto_8834768 ) ( not ( = ?auto_8834767 ?auto_8834773 ) ) ( OBJ-AT ?auto_8834773 ?auto_8834776 ) ( TRUCK-AT ?auto_8834774 ?auto_8834768 ) ( OBJ-AT ?auto_8834769 ?auto_8834768 ) ( OBJ-AT ?auto_8834770 ?auto_8834768 ) ( OBJ-AT ?auto_8834771 ?auto_8834768 ) ( OBJ-AT ?auto_8834772 ?auto_8834768 ) ( not ( = ?auto_8834767 ?auto_8834769 ) ) ( not ( = ?auto_8834767 ?auto_8834770 ) ) ( not ( = ?auto_8834767 ?auto_8834771 ) ) ( not ( = ?auto_8834767 ?auto_8834772 ) ) ( not ( = ?auto_8834769 ?auto_8834770 ) ) ( not ( = ?auto_8834769 ?auto_8834771 ) ) ( not ( = ?auto_8834769 ?auto_8834772 ) ) ( not ( = ?auto_8834769 ?auto_8834773 ) ) ( not ( = ?auto_8834770 ?auto_8834771 ) ) ( not ( = ?auto_8834770 ?auto_8834772 ) ) ( not ( = ?auto_8834770 ?auto_8834773 ) ) ( not ( = ?auto_8834771 ?auto_8834772 ) ) ( not ( = ?auto_8834771 ?auto_8834773 ) ) ( not ( = ?auto_8834772 ?auto_8834773 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8834767 ?auto_8834773 ?auto_8834768 )
      ( DELIVER-6PKG-VERIFY ?auto_8834767 ?auto_8834769 ?auto_8834770 ?auto_8834771 ?auto_8834772 ?auto_8834773 ?auto_8834768 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9528364 - OBJ
      ?auto_9528366 - OBJ
      ?auto_9528367 - OBJ
      ?auto_9528368 - OBJ
      ?auto_9528369 - OBJ
      ?auto_9528365 - LOCATION
    )
    :vars
    (
      ?auto_9528370 - LOCATION
      ?auto_9528372 - CITY
      ?auto_9528371 - TRUCK
      ?auto_9528373 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9528366 ?auto_9528364 ) ( GREATER-THAN ?auto_9528367 ?auto_9528364 ) ( GREATER-THAN ?auto_9528367 ?auto_9528366 ) ( GREATER-THAN ?auto_9528368 ?auto_9528364 ) ( GREATER-THAN ?auto_9528368 ?auto_9528366 ) ( GREATER-THAN ?auto_9528368 ?auto_9528367 ) ( GREATER-THAN ?auto_9528369 ?auto_9528364 ) ( GREATER-THAN ?auto_9528369 ?auto_9528366 ) ( GREATER-THAN ?auto_9528369 ?auto_9528367 ) ( GREATER-THAN ?auto_9528369 ?auto_9528368 ) ( IN-CITY ?auto_9528370 ?auto_9528372 ) ( IN-CITY ?auto_9528365 ?auto_9528372 ) ( not ( = ?auto_9528365 ?auto_9528370 ) ) ( OBJ-AT ?auto_9528364 ?auto_9528365 ) ( not ( = ?auto_9528364 ?auto_9528369 ) ) ( OBJ-AT ?auto_9528369 ?auto_9528370 ) ( TRUCK-AT ?auto_9528371 ?auto_9528373 ) ( IN-CITY ?auto_9528373 ?auto_9528372 ) ( not ( = ?auto_9528365 ?auto_9528373 ) ) ( not ( = ?auto_9528370 ?auto_9528373 ) ) ( OBJ-AT ?auto_9528366 ?auto_9528365 ) ( OBJ-AT ?auto_9528367 ?auto_9528365 ) ( OBJ-AT ?auto_9528368 ?auto_9528365 ) ( not ( = ?auto_9528364 ?auto_9528366 ) ) ( not ( = ?auto_9528364 ?auto_9528367 ) ) ( not ( = ?auto_9528364 ?auto_9528368 ) ) ( not ( = ?auto_9528366 ?auto_9528367 ) ) ( not ( = ?auto_9528366 ?auto_9528368 ) ) ( not ( = ?auto_9528366 ?auto_9528369 ) ) ( not ( = ?auto_9528367 ?auto_9528368 ) ) ( not ( = ?auto_9528367 ?auto_9528369 ) ) ( not ( = ?auto_9528368 ?auto_9528369 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9528364 ?auto_9528369 ?auto_9528365 )
      ( DELIVER-5PKG-VERIFY ?auto_9528364 ?auto_9528366 ?auto_9528367 ?auto_9528368 ?auto_9528369 ?auto_9528365 ) )
  )

)

