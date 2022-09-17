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
      ?auto_1030 - OBJ
      ?auto_1029 - LOCATION
    )
    :vars
    (
      ?auto_1032 - LOCATION
      ?auto_1033 - CITY
      ?auto_1031 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1032 ?auto_1033 ) ( IN-CITY ?auto_1029 ?auto_1033 ) ( not ( = ?auto_1029 ?auto_1032 ) ) ( OBJ-AT ?auto_1030 ?auto_1032 ) ( TRUCK-AT ?auto_1031 ?auto_1029 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1031 ?auto_1029 ?auto_1032 ?auto_1033 )
      ( !LOAD-TRUCK ?auto_1030 ?auto_1031 ?auto_1032 )
      ( !DRIVE-TRUCK ?auto_1031 ?auto_1032 ?auto_1029 ?auto_1033 )
      ( !UNLOAD-TRUCK ?auto_1030 ?auto_1031 ?auto_1029 )
      ( DELIVER-1PKG-VERIFY ?auto_1030 ?auto_1029 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1051 - OBJ
      ?auto_1052 - OBJ
      ?auto_1050 - LOCATION
    )
    :vars
    (
      ?auto_1053 - LOCATION
      ?auto_1055 - CITY
      ?auto_1056 - LOCATION
      ?auto_1054 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1053 ?auto_1055 ) ( IN-CITY ?auto_1050 ?auto_1055 ) ( not ( = ?auto_1050 ?auto_1053 ) ) ( OBJ-AT ?auto_1052 ?auto_1053 ) ( IN-CITY ?auto_1056 ?auto_1055 ) ( not ( = ?auto_1050 ?auto_1056 ) ) ( OBJ-AT ?auto_1051 ?auto_1056 ) ( TRUCK-AT ?auto_1054 ?auto_1050 ) ( not ( = ?auto_1051 ?auto_1052 ) ) ( not ( = ?auto_1053 ?auto_1056 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1051 ?auto_1050 )
      ( DELIVER-1PKG ?auto_1052 ?auto_1050 )
      ( DELIVER-2PKG-VERIFY ?auto_1051 ?auto_1052 ?auto_1050 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1161 - OBJ
      ?auto_1162 - OBJ
      ?auto_1163 - OBJ
      ?auto_1160 - LOCATION
    )
    :vars
    (
      ?auto_1164 - LOCATION
      ?auto_1166 - CITY
      ?auto_1167 - LOCATION
      ?auto_1165 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1164 ?auto_1166 ) ( IN-CITY ?auto_1160 ?auto_1166 ) ( not ( = ?auto_1160 ?auto_1164 ) ) ( OBJ-AT ?auto_1163 ?auto_1164 ) ( OBJ-AT ?auto_1162 ?auto_1164 ) ( IN-CITY ?auto_1167 ?auto_1166 ) ( not ( = ?auto_1160 ?auto_1167 ) ) ( OBJ-AT ?auto_1161 ?auto_1167 ) ( TRUCK-AT ?auto_1165 ?auto_1160 ) ( not ( = ?auto_1161 ?auto_1162 ) ) ( not ( = ?auto_1164 ?auto_1167 ) ) ( not ( = ?auto_1161 ?auto_1163 ) ) ( not ( = ?auto_1162 ?auto_1163 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1161 ?auto_1162 ?auto_1160 )
      ( DELIVER-1PKG ?auto_1163 ?auto_1160 )
      ( DELIVER-3PKG-VERIFY ?auto_1161 ?auto_1162 ?auto_1163 ?auto_1160 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1191 - OBJ
      ?auto_1192 - OBJ
      ?auto_1193 - OBJ
      ?auto_1190 - LOCATION
    )
    :vars
    (
      ?auto_1194 - LOCATION
      ?auto_1195 - CITY
      ?auto_1197 - LOCATION
      ?auto_1196 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1194 ?auto_1195 ) ( IN-CITY ?auto_1190 ?auto_1195 ) ( not ( = ?auto_1190 ?auto_1194 ) ) ( OBJ-AT ?auto_1193 ?auto_1194 ) ( OBJ-AT ?auto_1191 ?auto_1194 ) ( IN-CITY ?auto_1197 ?auto_1195 ) ( not ( = ?auto_1190 ?auto_1197 ) ) ( OBJ-AT ?auto_1192 ?auto_1197 ) ( TRUCK-AT ?auto_1196 ?auto_1190 ) ( not ( = ?auto_1192 ?auto_1191 ) ) ( not ( = ?auto_1194 ?auto_1197 ) ) ( not ( = ?auto_1192 ?auto_1193 ) ) ( not ( = ?auto_1191 ?auto_1193 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1192 ?auto_1191 ?auto_1193 ?auto_1190 )
      ( DELIVER-3PKG-VERIFY ?auto_1191 ?auto_1192 ?auto_1193 ?auto_1190 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1208 - OBJ
      ?auto_1209 - OBJ
      ?auto_1210 - OBJ
      ?auto_1207 - LOCATION
    )
    :vars
    (
      ?auto_1214 - LOCATION
      ?auto_1211 - CITY
      ?auto_1212 - LOCATION
      ?auto_1213 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1214 ?auto_1211 ) ( IN-CITY ?auto_1207 ?auto_1211 ) ( not ( = ?auto_1207 ?auto_1214 ) ) ( OBJ-AT ?auto_1209 ?auto_1214 ) ( OBJ-AT ?auto_1208 ?auto_1214 ) ( IN-CITY ?auto_1212 ?auto_1211 ) ( not ( = ?auto_1207 ?auto_1212 ) ) ( OBJ-AT ?auto_1210 ?auto_1212 ) ( TRUCK-AT ?auto_1213 ?auto_1207 ) ( not ( = ?auto_1210 ?auto_1208 ) ) ( not ( = ?auto_1214 ?auto_1212 ) ) ( not ( = ?auto_1210 ?auto_1209 ) ) ( not ( = ?auto_1208 ?auto_1209 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1208 ?auto_1210 ?auto_1209 ?auto_1207 )
      ( DELIVER-3PKG-VERIFY ?auto_1208 ?auto_1209 ?auto_1210 ?auto_1207 ) )
  )

)

