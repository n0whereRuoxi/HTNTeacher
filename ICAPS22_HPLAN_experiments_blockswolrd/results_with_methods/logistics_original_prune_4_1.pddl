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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_54868 - OBJ
      ?auto_54867 - LOCATION
    )
    :vars
    (
      ?auto_54869 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_54869 ?auto_54867 ) ( IN-TRUCK ?auto_54868 ?auto_54869 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_54868 ?auto_54869 ?auto_54867 )
      ( DELIVER-1PKG-VERIFY ?auto_54868 ?auto_54867 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_54886 - OBJ
      ?auto_54885 - LOCATION
    )
    :vars
    (
      ?auto_54887 - TRUCK
      ?auto_54888 - LOCATION
      ?auto_54889 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_54886 ?auto_54887 ) ( TRUCK-AT ?auto_54887 ?auto_54888 ) ( IN-CITY ?auto_54888 ?auto_54889 ) ( IN-CITY ?auto_54885 ?auto_54889 ) ( not ( = ?auto_54885 ?auto_54888 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_54887 ?auto_54888 ?auto_54885 ?auto_54889 )
      ( DELIVER-1PKG ?auto_54886 ?auto_54885 )
      ( DELIVER-1PKG-VERIFY ?auto_54886 ?auto_54885 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_54912 - OBJ
      ?auto_54911 - LOCATION
    )
    :vars
    (
      ?auto_54914 - TRUCK
      ?auto_54913 - LOCATION
      ?auto_54915 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_54914 ?auto_54913 ) ( IN-CITY ?auto_54913 ?auto_54915 ) ( IN-CITY ?auto_54911 ?auto_54915 ) ( not ( = ?auto_54911 ?auto_54913 ) ) ( OBJ-AT ?auto_54912 ?auto_54913 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_54912 ?auto_54914 ?auto_54913 )
      ( DELIVER-1PKG ?auto_54912 ?auto_54911 )
      ( DELIVER-1PKG-VERIFY ?auto_54912 ?auto_54911 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_54938 - OBJ
      ?auto_54937 - LOCATION
    )
    :vars
    (
      ?auto_54941 - LOCATION
      ?auto_54940 - CITY
      ?auto_54939 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_54941 ?auto_54940 ) ( IN-CITY ?auto_54937 ?auto_54940 ) ( not ( = ?auto_54937 ?auto_54941 ) ) ( OBJ-AT ?auto_54938 ?auto_54941 ) ( TRUCK-AT ?auto_54939 ?auto_54937 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_54939 ?auto_54937 ?auto_54941 ?auto_54940 )
      ( DELIVER-1PKG ?auto_54938 ?auto_54937 )
      ( DELIVER-1PKG-VERIFY ?auto_54938 ?auto_54937 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55081 - OBJ
      ?auto_55082 - OBJ
      ?auto_55080 - LOCATION
    )
    :vars
    (
      ?auto_55083 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55083 ?auto_55080 ) ( IN-TRUCK ?auto_55082 ?auto_55083 ) ( OBJ-AT ?auto_55081 ?auto_55080 ) ( not ( = ?auto_55081 ?auto_55082 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55082 ?auto_55080 )
      ( DELIVER-2PKG-VERIFY ?auto_55081 ?auto_55082 ?auto_55080 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55085 - OBJ
      ?auto_55086 - OBJ
      ?auto_55084 - LOCATION
    )
    :vars
    (
      ?auto_55087 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55087 ?auto_55084 ) ( IN-TRUCK ?auto_55085 ?auto_55087 ) ( OBJ-AT ?auto_55086 ?auto_55084 ) ( not ( = ?auto_55085 ?auto_55086 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55085 ?auto_55084 )
      ( DELIVER-2PKG-VERIFY ?auto_55085 ?auto_55086 ?auto_55084 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55093 - OBJ
      ?auto_55094 - OBJ
      ?auto_55095 - OBJ
      ?auto_55092 - LOCATION
    )
    :vars
    (
      ?auto_55096 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55096 ?auto_55092 ) ( IN-TRUCK ?auto_55095 ?auto_55096 ) ( OBJ-AT ?auto_55093 ?auto_55092 ) ( OBJ-AT ?auto_55094 ?auto_55092 ) ( not ( = ?auto_55093 ?auto_55094 ) ) ( not ( = ?auto_55093 ?auto_55095 ) ) ( not ( = ?auto_55094 ?auto_55095 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55095 ?auto_55092 )
      ( DELIVER-3PKG-VERIFY ?auto_55093 ?auto_55094 ?auto_55095 ?auto_55092 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55098 - OBJ
      ?auto_55099 - OBJ
      ?auto_55100 - OBJ
      ?auto_55097 - LOCATION
    )
    :vars
    (
      ?auto_55101 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55101 ?auto_55097 ) ( IN-TRUCK ?auto_55099 ?auto_55101 ) ( OBJ-AT ?auto_55098 ?auto_55097 ) ( OBJ-AT ?auto_55100 ?auto_55097 ) ( not ( = ?auto_55098 ?auto_55099 ) ) ( not ( = ?auto_55098 ?auto_55100 ) ) ( not ( = ?auto_55099 ?auto_55100 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55099 ?auto_55097 )
      ( DELIVER-3PKG-VERIFY ?auto_55098 ?auto_55099 ?auto_55100 ?auto_55097 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55108 - OBJ
      ?auto_55109 - OBJ
      ?auto_55110 - OBJ
      ?auto_55107 - LOCATION
    )
    :vars
    (
      ?auto_55111 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55111 ?auto_55107 ) ( IN-TRUCK ?auto_55108 ?auto_55111 ) ( OBJ-AT ?auto_55109 ?auto_55107 ) ( OBJ-AT ?auto_55110 ?auto_55107 ) ( not ( = ?auto_55108 ?auto_55109 ) ) ( not ( = ?auto_55108 ?auto_55110 ) ) ( not ( = ?auto_55109 ?auto_55110 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55108 ?auto_55107 )
      ( DELIVER-3PKG-VERIFY ?auto_55108 ?auto_55109 ?auto_55110 ?auto_55107 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55128 - OBJ
      ?auto_55129 - OBJ
      ?auto_55130 - OBJ
      ?auto_55131 - OBJ
      ?auto_55127 - LOCATION
    )
    :vars
    (
      ?auto_55132 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55132 ?auto_55127 ) ( IN-TRUCK ?auto_55131 ?auto_55132 ) ( OBJ-AT ?auto_55128 ?auto_55127 ) ( OBJ-AT ?auto_55129 ?auto_55127 ) ( OBJ-AT ?auto_55130 ?auto_55127 ) ( not ( = ?auto_55128 ?auto_55129 ) ) ( not ( = ?auto_55128 ?auto_55130 ) ) ( not ( = ?auto_55128 ?auto_55131 ) ) ( not ( = ?auto_55129 ?auto_55130 ) ) ( not ( = ?auto_55129 ?auto_55131 ) ) ( not ( = ?auto_55130 ?auto_55131 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55131 ?auto_55127 )
      ( DELIVER-4PKG-VERIFY ?auto_55128 ?auto_55129 ?auto_55130 ?auto_55131 ?auto_55127 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55134 - OBJ
      ?auto_55135 - OBJ
      ?auto_55136 - OBJ
      ?auto_55137 - OBJ
      ?auto_55133 - LOCATION
    )
    :vars
    (
      ?auto_55138 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55138 ?auto_55133 ) ( IN-TRUCK ?auto_55136 ?auto_55138 ) ( OBJ-AT ?auto_55134 ?auto_55133 ) ( OBJ-AT ?auto_55135 ?auto_55133 ) ( OBJ-AT ?auto_55137 ?auto_55133 ) ( not ( = ?auto_55134 ?auto_55135 ) ) ( not ( = ?auto_55134 ?auto_55136 ) ) ( not ( = ?auto_55134 ?auto_55137 ) ) ( not ( = ?auto_55135 ?auto_55136 ) ) ( not ( = ?auto_55135 ?auto_55137 ) ) ( not ( = ?auto_55136 ?auto_55137 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55136 ?auto_55133 )
      ( DELIVER-4PKG-VERIFY ?auto_55134 ?auto_55135 ?auto_55136 ?auto_55137 ?auto_55133 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55146 - OBJ
      ?auto_55147 - OBJ
      ?auto_55148 - OBJ
      ?auto_55149 - OBJ
      ?auto_55145 - LOCATION
    )
    :vars
    (
      ?auto_55150 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55150 ?auto_55145 ) ( IN-TRUCK ?auto_55147 ?auto_55150 ) ( OBJ-AT ?auto_55146 ?auto_55145 ) ( OBJ-AT ?auto_55148 ?auto_55145 ) ( OBJ-AT ?auto_55149 ?auto_55145 ) ( not ( = ?auto_55146 ?auto_55147 ) ) ( not ( = ?auto_55146 ?auto_55148 ) ) ( not ( = ?auto_55146 ?auto_55149 ) ) ( not ( = ?auto_55147 ?auto_55148 ) ) ( not ( = ?auto_55147 ?auto_55149 ) ) ( not ( = ?auto_55148 ?auto_55149 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55147 ?auto_55145 )
      ( DELIVER-4PKG-VERIFY ?auto_55146 ?auto_55147 ?auto_55148 ?auto_55149 ?auto_55145 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55170 - OBJ
      ?auto_55171 - OBJ
      ?auto_55172 - OBJ
      ?auto_55173 - OBJ
      ?auto_55169 - LOCATION
    )
    :vars
    (
      ?auto_55174 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55174 ?auto_55169 ) ( IN-TRUCK ?auto_55170 ?auto_55174 ) ( OBJ-AT ?auto_55171 ?auto_55169 ) ( OBJ-AT ?auto_55172 ?auto_55169 ) ( OBJ-AT ?auto_55173 ?auto_55169 ) ( not ( = ?auto_55170 ?auto_55171 ) ) ( not ( = ?auto_55170 ?auto_55172 ) ) ( not ( = ?auto_55170 ?auto_55173 ) ) ( not ( = ?auto_55171 ?auto_55172 ) ) ( not ( = ?auto_55171 ?auto_55173 ) ) ( not ( = ?auto_55172 ?auto_55173 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55170 ?auto_55169 )
      ( DELIVER-4PKG-VERIFY ?auto_55170 ?auto_55171 ?auto_55172 ?auto_55173 ?auto_55169 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55223 - OBJ
      ?auto_55224 - OBJ
      ?auto_55222 - LOCATION
    )
    :vars
    (
      ?auto_55227 - TRUCK
      ?auto_55225 - LOCATION
      ?auto_55226 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55224 ?auto_55227 ) ( TRUCK-AT ?auto_55227 ?auto_55225 ) ( IN-CITY ?auto_55225 ?auto_55226 ) ( IN-CITY ?auto_55222 ?auto_55226 ) ( not ( = ?auto_55222 ?auto_55225 ) ) ( OBJ-AT ?auto_55223 ?auto_55222 ) ( not ( = ?auto_55223 ?auto_55224 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55224 ?auto_55222 )
      ( DELIVER-2PKG-VERIFY ?auto_55223 ?auto_55224 ?auto_55222 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55229 - OBJ
      ?auto_55230 - OBJ
      ?auto_55228 - LOCATION
    )
    :vars
    (
      ?auto_55231 - TRUCK
      ?auto_55232 - LOCATION
      ?auto_55233 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55229 ?auto_55231 ) ( TRUCK-AT ?auto_55231 ?auto_55232 ) ( IN-CITY ?auto_55232 ?auto_55233 ) ( IN-CITY ?auto_55228 ?auto_55233 ) ( not ( = ?auto_55228 ?auto_55232 ) ) ( OBJ-AT ?auto_55230 ?auto_55228 ) ( not ( = ?auto_55230 ?auto_55229 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55230 ?auto_55229 ?auto_55228 )
      ( DELIVER-2PKG-VERIFY ?auto_55229 ?auto_55230 ?auto_55228 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55242 - OBJ
      ?auto_55243 - OBJ
      ?auto_55244 - OBJ
      ?auto_55241 - LOCATION
    )
    :vars
    (
      ?auto_55245 - TRUCK
      ?auto_55246 - LOCATION
      ?auto_55247 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55244 ?auto_55245 ) ( TRUCK-AT ?auto_55245 ?auto_55246 ) ( IN-CITY ?auto_55246 ?auto_55247 ) ( IN-CITY ?auto_55241 ?auto_55247 ) ( not ( = ?auto_55241 ?auto_55246 ) ) ( OBJ-AT ?auto_55243 ?auto_55241 ) ( not ( = ?auto_55243 ?auto_55244 ) ) ( OBJ-AT ?auto_55242 ?auto_55241 ) ( not ( = ?auto_55242 ?auto_55243 ) ) ( not ( = ?auto_55242 ?auto_55244 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55243 ?auto_55244 ?auto_55241 )
      ( DELIVER-3PKG-VERIFY ?auto_55242 ?auto_55243 ?auto_55244 ?auto_55241 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55249 - OBJ
      ?auto_55250 - OBJ
      ?auto_55251 - OBJ
      ?auto_55248 - LOCATION
    )
    :vars
    (
      ?auto_55252 - TRUCK
      ?auto_55253 - LOCATION
      ?auto_55254 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55250 ?auto_55252 ) ( TRUCK-AT ?auto_55252 ?auto_55253 ) ( IN-CITY ?auto_55253 ?auto_55254 ) ( IN-CITY ?auto_55248 ?auto_55254 ) ( not ( = ?auto_55248 ?auto_55253 ) ) ( OBJ-AT ?auto_55251 ?auto_55248 ) ( not ( = ?auto_55251 ?auto_55250 ) ) ( OBJ-AT ?auto_55249 ?auto_55248 ) ( not ( = ?auto_55249 ?auto_55250 ) ) ( not ( = ?auto_55249 ?auto_55251 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55251 ?auto_55250 ?auto_55248 )
      ( DELIVER-3PKG-VERIFY ?auto_55249 ?auto_55250 ?auto_55251 ?auto_55248 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55263 - OBJ
      ?auto_55264 - OBJ
      ?auto_55265 - OBJ
      ?auto_55262 - LOCATION
    )
    :vars
    (
      ?auto_55266 - TRUCK
      ?auto_55267 - LOCATION
      ?auto_55268 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55263 ?auto_55266 ) ( TRUCK-AT ?auto_55266 ?auto_55267 ) ( IN-CITY ?auto_55267 ?auto_55268 ) ( IN-CITY ?auto_55262 ?auto_55268 ) ( not ( = ?auto_55262 ?auto_55267 ) ) ( OBJ-AT ?auto_55264 ?auto_55262 ) ( not ( = ?auto_55264 ?auto_55263 ) ) ( OBJ-AT ?auto_55265 ?auto_55262 ) ( not ( = ?auto_55263 ?auto_55265 ) ) ( not ( = ?auto_55264 ?auto_55265 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55264 ?auto_55263 ?auto_55262 )
      ( DELIVER-3PKG-VERIFY ?auto_55263 ?auto_55264 ?auto_55265 ?auto_55262 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55292 - OBJ
      ?auto_55293 - OBJ
      ?auto_55294 - OBJ
      ?auto_55295 - OBJ
      ?auto_55291 - LOCATION
    )
    :vars
    (
      ?auto_55296 - TRUCK
      ?auto_55297 - LOCATION
      ?auto_55298 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55295 ?auto_55296 ) ( TRUCK-AT ?auto_55296 ?auto_55297 ) ( IN-CITY ?auto_55297 ?auto_55298 ) ( IN-CITY ?auto_55291 ?auto_55298 ) ( not ( = ?auto_55291 ?auto_55297 ) ) ( OBJ-AT ?auto_55294 ?auto_55291 ) ( not ( = ?auto_55294 ?auto_55295 ) ) ( OBJ-AT ?auto_55292 ?auto_55291 ) ( OBJ-AT ?auto_55293 ?auto_55291 ) ( not ( = ?auto_55292 ?auto_55293 ) ) ( not ( = ?auto_55292 ?auto_55294 ) ) ( not ( = ?auto_55292 ?auto_55295 ) ) ( not ( = ?auto_55293 ?auto_55294 ) ) ( not ( = ?auto_55293 ?auto_55295 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55294 ?auto_55295 ?auto_55291 )
      ( DELIVER-4PKG-VERIFY ?auto_55292 ?auto_55293 ?auto_55294 ?auto_55295 ?auto_55291 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55300 - OBJ
      ?auto_55301 - OBJ
      ?auto_55302 - OBJ
      ?auto_55303 - OBJ
      ?auto_55299 - LOCATION
    )
    :vars
    (
      ?auto_55304 - TRUCK
      ?auto_55305 - LOCATION
      ?auto_55306 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55302 ?auto_55304 ) ( TRUCK-AT ?auto_55304 ?auto_55305 ) ( IN-CITY ?auto_55305 ?auto_55306 ) ( IN-CITY ?auto_55299 ?auto_55306 ) ( not ( = ?auto_55299 ?auto_55305 ) ) ( OBJ-AT ?auto_55300 ?auto_55299 ) ( not ( = ?auto_55300 ?auto_55302 ) ) ( OBJ-AT ?auto_55301 ?auto_55299 ) ( OBJ-AT ?auto_55303 ?auto_55299 ) ( not ( = ?auto_55300 ?auto_55301 ) ) ( not ( = ?auto_55300 ?auto_55303 ) ) ( not ( = ?auto_55301 ?auto_55302 ) ) ( not ( = ?auto_55301 ?auto_55303 ) ) ( not ( = ?auto_55302 ?auto_55303 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55300 ?auto_55302 ?auto_55299 )
      ( DELIVER-4PKG-VERIFY ?auto_55300 ?auto_55301 ?auto_55302 ?auto_55303 ?auto_55299 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55316 - OBJ
      ?auto_55317 - OBJ
      ?auto_55318 - OBJ
      ?auto_55319 - OBJ
      ?auto_55315 - LOCATION
    )
    :vars
    (
      ?auto_55320 - TRUCK
      ?auto_55321 - LOCATION
      ?auto_55322 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55317 ?auto_55320 ) ( TRUCK-AT ?auto_55320 ?auto_55321 ) ( IN-CITY ?auto_55321 ?auto_55322 ) ( IN-CITY ?auto_55315 ?auto_55322 ) ( not ( = ?auto_55315 ?auto_55321 ) ) ( OBJ-AT ?auto_55318 ?auto_55315 ) ( not ( = ?auto_55318 ?auto_55317 ) ) ( OBJ-AT ?auto_55316 ?auto_55315 ) ( OBJ-AT ?auto_55319 ?auto_55315 ) ( not ( = ?auto_55316 ?auto_55317 ) ) ( not ( = ?auto_55316 ?auto_55318 ) ) ( not ( = ?auto_55316 ?auto_55319 ) ) ( not ( = ?auto_55317 ?auto_55319 ) ) ( not ( = ?auto_55318 ?auto_55319 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55318 ?auto_55317 ?auto_55315 )
      ( DELIVER-4PKG-VERIFY ?auto_55316 ?auto_55317 ?auto_55318 ?auto_55319 ?auto_55315 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55348 - OBJ
      ?auto_55349 - OBJ
      ?auto_55350 - OBJ
      ?auto_55351 - OBJ
      ?auto_55347 - LOCATION
    )
    :vars
    (
      ?auto_55352 - TRUCK
      ?auto_55353 - LOCATION
      ?auto_55354 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55348 ?auto_55352 ) ( TRUCK-AT ?auto_55352 ?auto_55353 ) ( IN-CITY ?auto_55353 ?auto_55354 ) ( IN-CITY ?auto_55347 ?auto_55354 ) ( not ( = ?auto_55347 ?auto_55353 ) ) ( OBJ-AT ?auto_55351 ?auto_55347 ) ( not ( = ?auto_55351 ?auto_55348 ) ) ( OBJ-AT ?auto_55349 ?auto_55347 ) ( OBJ-AT ?auto_55350 ?auto_55347 ) ( not ( = ?auto_55348 ?auto_55349 ) ) ( not ( = ?auto_55348 ?auto_55350 ) ) ( not ( = ?auto_55349 ?auto_55350 ) ) ( not ( = ?auto_55349 ?auto_55351 ) ) ( not ( = ?auto_55350 ?auto_55351 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55351 ?auto_55348 ?auto_55347 )
      ( DELIVER-4PKG-VERIFY ?auto_55348 ?auto_55349 ?auto_55350 ?auto_55351 ?auto_55347 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55413 - OBJ
      ?auto_55412 - LOCATION
    )
    :vars
    (
      ?auto_55414 - TRUCK
      ?auto_55415 - LOCATION
      ?auto_55416 - CITY
      ?auto_55417 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55414 ?auto_55415 ) ( IN-CITY ?auto_55415 ?auto_55416 ) ( IN-CITY ?auto_55412 ?auto_55416 ) ( not ( = ?auto_55412 ?auto_55415 ) ) ( OBJ-AT ?auto_55417 ?auto_55412 ) ( not ( = ?auto_55417 ?auto_55413 ) ) ( OBJ-AT ?auto_55413 ?auto_55415 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_55413 ?auto_55414 ?auto_55415 )
      ( DELIVER-2PKG ?auto_55417 ?auto_55413 ?auto_55412 )
      ( DELIVER-1PKG-VERIFY ?auto_55413 ?auto_55412 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55419 - OBJ
      ?auto_55420 - OBJ
      ?auto_55418 - LOCATION
    )
    :vars
    (
      ?auto_55423 - TRUCK
      ?auto_55421 - LOCATION
      ?auto_55422 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55423 ?auto_55421 ) ( IN-CITY ?auto_55421 ?auto_55422 ) ( IN-CITY ?auto_55418 ?auto_55422 ) ( not ( = ?auto_55418 ?auto_55421 ) ) ( OBJ-AT ?auto_55419 ?auto_55418 ) ( not ( = ?auto_55419 ?auto_55420 ) ) ( OBJ-AT ?auto_55420 ?auto_55421 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55420 ?auto_55418 )
      ( DELIVER-2PKG-VERIFY ?auto_55419 ?auto_55420 ?auto_55418 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55425 - OBJ
      ?auto_55426 - OBJ
      ?auto_55424 - LOCATION
    )
    :vars
    (
      ?auto_55427 - TRUCK
      ?auto_55428 - LOCATION
      ?auto_55429 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55427 ?auto_55428 ) ( IN-CITY ?auto_55428 ?auto_55429 ) ( IN-CITY ?auto_55424 ?auto_55429 ) ( not ( = ?auto_55424 ?auto_55428 ) ) ( OBJ-AT ?auto_55426 ?auto_55424 ) ( not ( = ?auto_55426 ?auto_55425 ) ) ( OBJ-AT ?auto_55425 ?auto_55428 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55426 ?auto_55425 ?auto_55424 )
      ( DELIVER-2PKG-VERIFY ?auto_55425 ?auto_55426 ?auto_55424 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55438 - OBJ
      ?auto_55439 - OBJ
      ?auto_55440 - OBJ
      ?auto_55437 - LOCATION
    )
    :vars
    (
      ?auto_55441 - TRUCK
      ?auto_55442 - LOCATION
      ?auto_55443 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55441 ?auto_55442 ) ( IN-CITY ?auto_55442 ?auto_55443 ) ( IN-CITY ?auto_55437 ?auto_55443 ) ( not ( = ?auto_55437 ?auto_55442 ) ) ( OBJ-AT ?auto_55439 ?auto_55437 ) ( not ( = ?auto_55439 ?auto_55440 ) ) ( OBJ-AT ?auto_55440 ?auto_55442 ) ( OBJ-AT ?auto_55438 ?auto_55437 ) ( not ( = ?auto_55438 ?auto_55439 ) ) ( not ( = ?auto_55438 ?auto_55440 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55439 ?auto_55440 ?auto_55437 )
      ( DELIVER-3PKG-VERIFY ?auto_55438 ?auto_55439 ?auto_55440 ?auto_55437 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55445 - OBJ
      ?auto_55446 - OBJ
      ?auto_55447 - OBJ
      ?auto_55444 - LOCATION
    )
    :vars
    (
      ?auto_55448 - TRUCK
      ?auto_55449 - LOCATION
      ?auto_55450 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55448 ?auto_55449 ) ( IN-CITY ?auto_55449 ?auto_55450 ) ( IN-CITY ?auto_55444 ?auto_55450 ) ( not ( = ?auto_55444 ?auto_55449 ) ) ( OBJ-AT ?auto_55447 ?auto_55444 ) ( not ( = ?auto_55447 ?auto_55446 ) ) ( OBJ-AT ?auto_55446 ?auto_55449 ) ( OBJ-AT ?auto_55445 ?auto_55444 ) ( not ( = ?auto_55445 ?auto_55446 ) ) ( not ( = ?auto_55445 ?auto_55447 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55447 ?auto_55446 ?auto_55444 )
      ( DELIVER-3PKG-VERIFY ?auto_55445 ?auto_55446 ?auto_55447 ?auto_55444 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55459 - OBJ
      ?auto_55460 - OBJ
      ?auto_55461 - OBJ
      ?auto_55458 - LOCATION
    )
    :vars
    (
      ?auto_55462 - TRUCK
      ?auto_55463 - LOCATION
      ?auto_55464 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55462 ?auto_55463 ) ( IN-CITY ?auto_55463 ?auto_55464 ) ( IN-CITY ?auto_55458 ?auto_55464 ) ( not ( = ?auto_55458 ?auto_55463 ) ) ( OBJ-AT ?auto_55460 ?auto_55458 ) ( not ( = ?auto_55460 ?auto_55459 ) ) ( OBJ-AT ?auto_55459 ?auto_55463 ) ( OBJ-AT ?auto_55461 ?auto_55458 ) ( not ( = ?auto_55459 ?auto_55461 ) ) ( not ( = ?auto_55460 ?auto_55461 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55460 ?auto_55459 ?auto_55458 )
      ( DELIVER-3PKG-VERIFY ?auto_55459 ?auto_55460 ?auto_55461 ?auto_55458 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55488 - OBJ
      ?auto_55489 - OBJ
      ?auto_55490 - OBJ
      ?auto_55491 - OBJ
      ?auto_55487 - LOCATION
    )
    :vars
    (
      ?auto_55492 - TRUCK
      ?auto_55493 - LOCATION
      ?auto_55494 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55492 ?auto_55493 ) ( IN-CITY ?auto_55493 ?auto_55494 ) ( IN-CITY ?auto_55487 ?auto_55494 ) ( not ( = ?auto_55487 ?auto_55493 ) ) ( OBJ-AT ?auto_55490 ?auto_55487 ) ( not ( = ?auto_55490 ?auto_55491 ) ) ( OBJ-AT ?auto_55491 ?auto_55493 ) ( OBJ-AT ?auto_55488 ?auto_55487 ) ( OBJ-AT ?auto_55489 ?auto_55487 ) ( not ( = ?auto_55488 ?auto_55489 ) ) ( not ( = ?auto_55488 ?auto_55490 ) ) ( not ( = ?auto_55488 ?auto_55491 ) ) ( not ( = ?auto_55489 ?auto_55490 ) ) ( not ( = ?auto_55489 ?auto_55491 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55490 ?auto_55491 ?auto_55487 )
      ( DELIVER-4PKG-VERIFY ?auto_55488 ?auto_55489 ?auto_55490 ?auto_55491 ?auto_55487 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55496 - OBJ
      ?auto_55497 - OBJ
      ?auto_55498 - OBJ
      ?auto_55499 - OBJ
      ?auto_55495 - LOCATION
    )
    :vars
    (
      ?auto_55500 - TRUCK
      ?auto_55501 - LOCATION
      ?auto_55502 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55500 ?auto_55501 ) ( IN-CITY ?auto_55501 ?auto_55502 ) ( IN-CITY ?auto_55495 ?auto_55502 ) ( not ( = ?auto_55495 ?auto_55501 ) ) ( OBJ-AT ?auto_55497 ?auto_55495 ) ( not ( = ?auto_55497 ?auto_55498 ) ) ( OBJ-AT ?auto_55498 ?auto_55501 ) ( OBJ-AT ?auto_55496 ?auto_55495 ) ( OBJ-AT ?auto_55499 ?auto_55495 ) ( not ( = ?auto_55496 ?auto_55497 ) ) ( not ( = ?auto_55496 ?auto_55498 ) ) ( not ( = ?auto_55496 ?auto_55499 ) ) ( not ( = ?auto_55497 ?auto_55499 ) ) ( not ( = ?auto_55498 ?auto_55499 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55497 ?auto_55498 ?auto_55495 )
      ( DELIVER-4PKG-VERIFY ?auto_55496 ?auto_55497 ?auto_55498 ?auto_55499 ?auto_55495 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55512 - OBJ
      ?auto_55513 - OBJ
      ?auto_55514 - OBJ
      ?auto_55515 - OBJ
      ?auto_55511 - LOCATION
    )
    :vars
    (
      ?auto_55516 - TRUCK
      ?auto_55517 - LOCATION
      ?auto_55518 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55516 ?auto_55517 ) ( IN-CITY ?auto_55517 ?auto_55518 ) ( IN-CITY ?auto_55511 ?auto_55518 ) ( not ( = ?auto_55511 ?auto_55517 ) ) ( OBJ-AT ?auto_55514 ?auto_55511 ) ( not ( = ?auto_55514 ?auto_55513 ) ) ( OBJ-AT ?auto_55513 ?auto_55517 ) ( OBJ-AT ?auto_55512 ?auto_55511 ) ( OBJ-AT ?auto_55515 ?auto_55511 ) ( not ( = ?auto_55512 ?auto_55513 ) ) ( not ( = ?auto_55512 ?auto_55514 ) ) ( not ( = ?auto_55512 ?auto_55515 ) ) ( not ( = ?auto_55513 ?auto_55515 ) ) ( not ( = ?auto_55514 ?auto_55515 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55514 ?auto_55513 ?auto_55511 )
      ( DELIVER-4PKG-VERIFY ?auto_55512 ?auto_55513 ?auto_55514 ?auto_55515 ?auto_55511 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55544 - OBJ
      ?auto_55545 - OBJ
      ?auto_55546 - OBJ
      ?auto_55547 - OBJ
      ?auto_55543 - LOCATION
    )
    :vars
    (
      ?auto_55548 - TRUCK
      ?auto_55549 - LOCATION
      ?auto_55550 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55548 ?auto_55549 ) ( IN-CITY ?auto_55549 ?auto_55550 ) ( IN-CITY ?auto_55543 ?auto_55550 ) ( not ( = ?auto_55543 ?auto_55549 ) ) ( OBJ-AT ?auto_55547 ?auto_55543 ) ( not ( = ?auto_55547 ?auto_55544 ) ) ( OBJ-AT ?auto_55544 ?auto_55549 ) ( OBJ-AT ?auto_55545 ?auto_55543 ) ( OBJ-AT ?auto_55546 ?auto_55543 ) ( not ( = ?auto_55544 ?auto_55545 ) ) ( not ( = ?auto_55544 ?auto_55546 ) ) ( not ( = ?auto_55545 ?auto_55546 ) ) ( not ( = ?auto_55545 ?auto_55547 ) ) ( not ( = ?auto_55546 ?auto_55547 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55547 ?auto_55544 ?auto_55543 )
      ( DELIVER-4PKG-VERIFY ?auto_55544 ?auto_55545 ?auto_55546 ?auto_55547 ?auto_55543 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55609 - OBJ
      ?auto_55608 - LOCATION
    )
    :vars
    (
      ?auto_55612 - LOCATION
      ?auto_55613 - CITY
      ?auto_55610 - OBJ
      ?auto_55611 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55612 ?auto_55613 ) ( IN-CITY ?auto_55608 ?auto_55613 ) ( not ( = ?auto_55608 ?auto_55612 ) ) ( OBJ-AT ?auto_55610 ?auto_55608 ) ( not ( = ?auto_55610 ?auto_55609 ) ) ( OBJ-AT ?auto_55609 ?auto_55612 ) ( TRUCK-AT ?auto_55611 ?auto_55608 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_55611 ?auto_55608 ?auto_55612 ?auto_55613 )
      ( DELIVER-2PKG ?auto_55610 ?auto_55609 ?auto_55608 )
      ( DELIVER-1PKG-VERIFY ?auto_55609 ?auto_55608 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55615 - OBJ
      ?auto_55616 - OBJ
      ?auto_55614 - LOCATION
    )
    :vars
    (
      ?auto_55617 - LOCATION
      ?auto_55618 - CITY
      ?auto_55619 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55617 ?auto_55618 ) ( IN-CITY ?auto_55614 ?auto_55618 ) ( not ( = ?auto_55614 ?auto_55617 ) ) ( OBJ-AT ?auto_55615 ?auto_55614 ) ( not ( = ?auto_55615 ?auto_55616 ) ) ( OBJ-AT ?auto_55616 ?auto_55617 ) ( TRUCK-AT ?auto_55619 ?auto_55614 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55616 ?auto_55614 )
      ( DELIVER-2PKG-VERIFY ?auto_55615 ?auto_55616 ?auto_55614 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55621 - OBJ
      ?auto_55622 - OBJ
      ?auto_55620 - LOCATION
    )
    :vars
    (
      ?auto_55624 - LOCATION
      ?auto_55625 - CITY
      ?auto_55623 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55624 ?auto_55625 ) ( IN-CITY ?auto_55620 ?auto_55625 ) ( not ( = ?auto_55620 ?auto_55624 ) ) ( OBJ-AT ?auto_55622 ?auto_55620 ) ( not ( = ?auto_55622 ?auto_55621 ) ) ( OBJ-AT ?auto_55621 ?auto_55624 ) ( TRUCK-AT ?auto_55623 ?auto_55620 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55622 ?auto_55621 ?auto_55620 )
      ( DELIVER-2PKG-VERIFY ?auto_55621 ?auto_55622 ?auto_55620 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55634 - OBJ
      ?auto_55635 - OBJ
      ?auto_55636 - OBJ
      ?auto_55633 - LOCATION
    )
    :vars
    (
      ?auto_55638 - LOCATION
      ?auto_55639 - CITY
      ?auto_55637 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55638 ?auto_55639 ) ( IN-CITY ?auto_55633 ?auto_55639 ) ( not ( = ?auto_55633 ?auto_55638 ) ) ( OBJ-AT ?auto_55635 ?auto_55633 ) ( not ( = ?auto_55635 ?auto_55636 ) ) ( OBJ-AT ?auto_55636 ?auto_55638 ) ( TRUCK-AT ?auto_55637 ?auto_55633 ) ( OBJ-AT ?auto_55634 ?auto_55633 ) ( not ( = ?auto_55634 ?auto_55635 ) ) ( not ( = ?auto_55634 ?auto_55636 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55635 ?auto_55636 ?auto_55633 )
      ( DELIVER-3PKG-VERIFY ?auto_55634 ?auto_55635 ?auto_55636 ?auto_55633 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55641 - OBJ
      ?auto_55642 - OBJ
      ?auto_55643 - OBJ
      ?auto_55640 - LOCATION
    )
    :vars
    (
      ?auto_55645 - LOCATION
      ?auto_55646 - CITY
      ?auto_55644 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55645 ?auto_55646 ) ( IN-CITY ?auto_55640 ?auto_55646 ) ( not ( = ?auto_55640 ?auto_55645 ) ) ( OBJ-AT ?auto_55641 ?auto_55640 ) ( not ( = ?auto_55641 ?auto_55642 ) ) ( OBJ-AT ?auto_55642 ?auto_55645 ) ( TRUCK-AT ?auto_55644 ?auto_55640 ) ( OBJ-AT ?auto_55643 ?auto_55640 ) ( not ( = ?auto_55641 ?auto_55643 ) ) ( not ( = ?auto_55642 ?auto_55643 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55641 ?auto_55642 ?auto_55640 )
      ( DELIVER-3PKG-VERIFY ?auto_55641 ?auto_55642 ?auto_55643 ?auto_55640 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55655 - OBJ
      ?auto_55656 - OBJ
      ?auto_55657 - OBJ
      ?auto_55654 - LOCATION
    )
    :vars
    (
      ?auto_55659 - LOCATION
      ?auto_55660 - CITY
      ?auto_55658 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55659 ?auto_55660 ) ( IN-CITY ?auto_55654 ?auto_55660 ) ( not ( = ?auto_55654 ?auto_55659 ) ) ( OBJ-AT ?auto_55657 ?auto_55654 ) ( not ( = ?auto_55657 ?auto_55655 ) ) ( OBJ-AT ?auto_55655 ?auto_55659 ) ( TRUCK-AT ?auto_55658 ?auto_55654 ) ( OBJ-AT ?auto_55656 ?auto_55654 ) ( not ( = ?auto_55655 ?auto_55656 ) ) ( not ( = ?auto_55656 ?auto_55657 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55657 ?auto_55655 ?auto_55654 )
      ( DELIVER-3PKG-VERIFY ?auto_55655 ?auto_55656 ?auto_55657 ?auto_55654 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55684 - OBJ
      ?auto_55685 - OBJ
      ?auto_55686 - OBJ
      ?auto_55687 - OBJ
      ?auto_55683 - LOCATION
    )
    :vars
    (
      ?auto_55689 - LOCATION
      ?auto_55690 - CITY
      ?auto_55688 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55689 ?auto_55690 ) ( IN-CITY ?auto_55683 ?auto_55690 ) ( not ( = ?auto_55683 ?auto_55689 ) ) ( OBJ-AT ?auto_55686 ?auto_55683 ) ( not ( = ?auto_55686 ?auto_55687 ) ) ( OBJ-AT ?auto_55687 ?auto_55689 ) ( TRUCK-AT ?auto_55688 ?auto_55683 ) ( OBJ-AT ?auto_55684 ?auto_55683 ) ( OBJ-AT ?auto_55685 ?auto_55683 ) ( not ( = ?auto_55684 ?auto_55685 ) ) ( not ( = ?auto_55684 ?auto_55686 ) ) ( not ( = ?auto_55684 ?auto_55687 ) ) ( not ( = ?auto_55685 ?auto_55686 ) ) ( not ( = ?auto_55685 ?auto_55687 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55686 ?auto_55687 ?auto_55683 )
      ( DELIVER-4PKG-VERIFY ?auto_55684 ?auto_55685 ?auto_55686 ?auto_55687 ?auto_55683 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55692 - OBJ
      ?auto_55693 - OBJ
      ?auto_55694 - OBJ
      ?auto_55695 - OBJ
      ?auto_55691 - LOCATION
    )
    :vars
    (
      ?auto_55697 - LOCATION
      ?auto_55698 - CITY
      ?auto_55696 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55697 ?auto_55698 ) ( IN-CITY ?auto_55691 ?auto_55698 ) ( not ( = ?auto_55691 ?auto_55697 ) ) ( OBJ-AT ?auto_55692 ?auto_55691 ) ( not ( = ?auto_55692 ?auto_55694 ) ) ( OBJ-AT ?auto_55694 ?auto_55697 ) ( TRUCK-AT ?auto_55696 ?auto_55691 ) ( OBJ-AT ?auto_55693 ?auto_55691 ) ( OBJ-AT ?auto_55695 ?auto_55691 ) ( not ( = ?auto_55692 ?auto_55693 ) ) ( not ( = ?auto_55692 ?auto_55695 ) ) ( not ( = ?auto_55693 ?auto_55694 ) ) ( not ( = ?auto_55693 ?auto_55695 ) ) ( not ( = ?auto_55694 ?auto_55695 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55692 ?auto_55694 ?auto_55691 )
      ( DELIVER-4PKG-VERIFY ?auto_55692 ?auto_55693 ?auto_55694 ?auto_55695 ?auto_55691 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55708 - OBJ
      ?auto_55709 - OBJ
      ?auto_55710 - OBJ
      ?auto_55711 - OBJ
      ?auto_55707 - LOCATION
    )
    :vars
    (
      ?auto_55713 - LOCATION
      ?auto_55714 - CITY
      ?auto_55712 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55713 ?auto_55714 ) ( IN-CITY ?auto_55707 ?auto_55714 ) ( not ( = ?auto_55707 ?auto_55713 ) ) ( OBJ-AT ?auto_55710 ?auto_55707 ) ( not ( = ?auto_55710 ?auto_55709 ) ) ( OBJ-AT ?auto_55709 ?auto_55713 ) ( TRUCK-AT ?auto_55712 ?auto_55707 ) ( OBJ-AT ?auto_55708 ?auto_55707 ) ( OBJ-AT ?auto_55711 ?auto_55707 ) ( not ( = ?auto_55708 ?auto_55709 ) ) ( not ( = ?auto_55708 ?auto_55710 ) ) ( not ( = ?auto_55708 ?auto_55711 ) ) ( not ( = ?auto_55709 ?auto_55711 ) ) ( not ( = ?auto_55710 ?auto_55711 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55710 ?auto_55709 ?auto_55707 )
      ( DELIVER-4PKG-VERIFY ?auto_55708 ?auto_55709 ?auto_55710 ?auto_55711 ?auto_55707 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55740 - OBJ
      ?auto_55741 - OBJ
      ?auto_55742 - OBJ
      ?auto_55743 - OBJ
      ?auto_55739 - LOCATION
    )
    :vars
    (
      ?auto_55745 - LOCATION
      ?auto_55746 - CITY
      ?auto_55744 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55745 ?auto_55746 ) ( IN-CITY ?auto_55739 ?auto_55746 ) ( not ( = ?auto_55739 ?auto_55745 ) ) ( OBJ-AT ?auto_55741 ?auto_55739 ) ( not ( = ?auto_55741 ?auto_55740 ) ) ( OBJ-AT ?auto_55740 ?auto_55745 ) ( TRUCK-AT ?auto_55744 ?auto_55739 ) ( OBJ-AT ?auto_55742 ?auto_55739 ) ( OBJ-AT ?auto_55743 ?auto_55739 ) ( not ( = ?auto_55740 ?auto_55742 ) ) ( not ( = ?auto_55740 ?auto_55743 ) ) ( not ( = ?auto_55741 ?auto_55742 ) ) ( not ( = ?auto_55741 ?auto_55743 ) ) ( not ( = ?auto_55742 ?auto_55743 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55741 ?auto_55740 ?auto_55739 )
      ( DELIVER-4PKG-VERIFY ?auto_55740 ?auto_55741 ?auto_55742 ?auto_55743 ?auto_55739 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55805 - OBJ
      ?auto_55804 - LOCATION
    )
    :vars
    (
      ?auto_55807 - LOCATION
      ?auto_55808 - CITY
      ?auto_55809 - OBJ
      ?auto_55806 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55807 ?auto_55808 ) ( IN-CITY ?auto_55804 ?auto_55808 ) ( not ( = ?auto_55804 ?auto_55807 ) ) ( not ( = ?auto_55809 ?auto_55805 ) ) ( OBJ-AT ?auto_55805 ?auto_55807 ) ( TRUCK-AT ?auto_55806 ?auto_55804 ) ( IN-TRUCK ?auto_55809 ?auto_55806 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55809 ?auto_55804 )
      ( DELIVER-2PKG ?auto_55809 ?auto_55805 ?auto_55804 )
      ( DELIVER-1PKG-VERIFY ?auto_55805 ?auto_55804 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55811 - OBJ
      ?auto_55812 - OBJ
      ?auto_55810 - LOCATION
    )
    :vars
    (
      ?auto_55813 - LOCATION
      ?auto_55815 - CITY
      ?auto_55814 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55813 ?auto_55815 ) ( IN-CITY ?auto_55810 ?auto_55815 ) ( not ( = ?auto_55810 ?auto_55813 ) ) ( not ( = ?auto_55811 ?auto_55812 ) ) ( OBJ-AT ?auto_55812 ?auto_55813 ) ( TRUCK-AT ?auto_55814 ?auto_55810 ) ( IN-TRUCK ?auto_55811 ?auto_55814 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55812 ?auto_55810 )
      ( DELIVER-2PKG-VERIFY ?auto_55811 ?auto_55812 ?auto_55810 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55817 - OBJ
      ?auto_55818 - OBJ
      ?auto_55816 - LOCATION
    )
    :vars
    (
      ?auto_55821 - LOCATION
      ?auto_55819 - CITY
      ?auto_55820 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55821 ?auto_55819 ) ( IN-CITY ?auto_55816 ?auto_55819 ) ( not ( = ?auto_55816 ?auto_55821 ) ) ( not ( = ?auto_55818 ?auto_55817 ) ) ( OBJ-AT ?auto_55817 ?auto_55821 ) ( TRUCK-AT ?auto_55820 ?auto_55816 ) ( IN-TRUCK ?auto_55818 ?auto_55820 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55818 ?auto_55817 ?auto_55816 )
      ( DELIVER-2PKG-VERIFY ?auto_55817 ?auto_55818 ?auto_55816 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56001 - OBJ
      ?auto_56000 - LOCATION
    )
    :vars
    (
      ?auto_56005 - LOCATION
      ?auto_56002 - CITY
      ?auto_56004 - OBJ
      ?auto_56003 - TRUCK
      ?auto_56006 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_56005 ?auto_56002 ) ( IN-CITY ?auto_56000 ?auto_56002 ) ( not ( = ?auto_56000 ?auto_56005 ) ) ( not ( = ?auto_56004 ?auto_56001 ) ) ( OBJ-AT ?auto_56001 ?auto_56005 ) ( IN-TRUCK ?auto_56004 ?auto_56003 ) ( TRUCK-AT ?auto_56003 ?auto_56006 ) ( IN-CITY ?auto_56006 ?auto_56002 ) ( not ( = ?auto_56000 ?auto_56006 ) ) ( not ( = ?auto_56005 ?auto_56006 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_56003 ?auto_56006 ?auto_56000 ?auto_56002 )
      ( DELIVER-2PKG ?auto_56004 ?auto_56001 ?auto_56000 )
      ( DELIVER-1PKG-VERIFY ?auto_56001 ?auto_56000 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56008 - OBJ
      ?auto_56009 - OBJ
      ?auto_56007 - LOCATION
    )
    :vars
    (
      ?auto_56011 - LOCATION
      ?auto_56012 - CITY
      ?auto_56013 - TRUCK
      ?auto_56010 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_56011 ?auto_56012 ) ( IN-CITY ?auto_56007 ?auto_56012 ) ( not ( = ?auto_56007 ?auto_56011 ) ) ( not ( = ?auto_56008 ?auto_56009 ) ) ( OBJ-AT ?auto_56009 ?auto_56011 ) ( IN-TRUCK ?auto_56008 ?auto_56013 ) ( TRUCK-AT ?auto_56013 ?auto_56010 ) ( IN-CITY ?auto_56010 ?auto_56012 ) ( not ( = ?auto_56007 ?auto_56010 ) ) ( not ( = ?auto_56011 ?auto_56010 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56009 ?auto_56007 )
      ( DELIVER-2PKG-VERIFY ?auto_56008 ?auto_56009 ?auto_56007 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56015 - OBJ
      ?auto_56016 - OBJ
      ?auto_56014 - LOCATION
    )
    :vars
    (
      ?auto_56020 - LOCATION
      ?auto_56019 - CITY
      ?auto_56018 - TRUCK
      ?auto_56017 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_56020 ?auto_56019 ) ( IN-CITY ?auto_56014 ?auto_56019 ) ( not ( = ?auto_56014 ?auto_56020 ) ) ( not ( = ?auto_56016 ?auto_56015 ) ) ( OBJ-AT ?auto_56015 ?auto_56020 ) ( IN-TRUCK ?auto_56016 ?auto_56018 ) ( TRUCK-AT ?auto_56018 ?auto_56017 ) ( IN-CITY ?auto_56017 ?auto_56019 ) ( not ( = ?auto_56014 ?auto_56017 ) ) ( not ( = ?auto_56020 ?auto_56017 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56016 ?auto_56015 ?auto_56014 )
      ( DELIVER-2PKG-VERIFY ?auto_56015 ?auto_56016 ?auto_56014 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56223 - OBJ
      ?auto_56222 - LOCATION
    )
    :vars
    (
      ?auto_56227 - LOCATION
      ?auto_56226 - CITY
      ?auto_56228 - OBJ
      ?auto_56225 - TRUCK
      ?auto_56224 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_56227 ?auto_56226 ) ( IN-CITY ?auto_56222 ?auto_56226 ) ( not ( = ?auto_56222 ?auto_56227 ) ) ( not ( = ?auto_56228 ?auto_56223 ) ) ( OBJ-AT ?auto_56223 ?auto_56227 ) ( TRUCK-AT ?auto_56225 ?auto_56224 ) ( IN-CITY ?auto_56224 ?auto_56226 ) ( not ( = ?auto_56222 ?auto_56224 ) ) ( not ( = ?auto_56227 ?auto_56224 ) ) ( OBJ-AT ?auto_56228 ?auto_56224 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_56228 ?auto_56225 ?auto_56224 )
      ( DELIVER-2PKG ?auto_56228 ?auto_56223 ?auto_56222 )
      ( DELIVER-1PKG-VERIFY ?auto_56223 ?auto_56222 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56230 - OBJ
      ?auto_56231 - OBJ
      ?auto_56229 - LOCATION
    )
    :vars
    (
      ?auto_56235 - LOCATION
      ?auto_56233 - CITY
      ?auto_56232 - TRUCK
      ?auto_56234 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_56235 ?auto_56233 ) ( IN-CITY ?auto_56229 ?auto_56233 ) ( not ( = ?auto_56229 ?auto_56235 ) ) ( not ( = ?auto_56230 ?auto_56231 ) ) ( OBJ-AT ?auto_56231 ?auto_56235 ) ( TRUCK-AT ?auto_56232 ?auto_56234 ) ( IN-CITY ?auto_56234 ?auto_56233 ) ( not ( = ?auto_56229 ?auto_56234 ) ) ( not ( = ?auto_56235 ?auto_56234 ) ) ( OBJ-AT ?auto_56230 ?auto_56234 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56231 ?auto_56229 )
      ( DELIVER-2PKG-VERIFY ?auto_56230 ?auto_56231 ?auto_56229 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56237 - OBJ
      ?auto_56238 - OBJ
      ?auto_56236 - LOCATION
    )
    :vars
    (
      ?auto_56239 - LOCATION
      ?auto_56241 - CITY
      ?auto_56240 - TRUCK
      ?auto_56242 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_56239 ?auto_56241 ) ( IN-CITY ?auto_56236 ?auto_56241 ) ( not ( = ?auto_56236 ?auto_56239 ) ) ( not ( = ?auto_56238 ?auto_56237 ) ) ( OBJ-AT ?auto_56237 ?auto_56239 ) ( TRUCK-AT ?auto_56240 ?auto_56242 ) ( IN-CITY ?auto_56242 ?auto_56241 ) ( not ( = ?auto_56236 ?auto_56242 ) ) ( not ( = ?auto_56239 ?auto_56242 ) ) ( OBJ-AT ?auto_56238 ?auto_56242 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56238 ?auto_56237 ?auto_56236 )
      ( DELIVER-2PKG-VERIFY ?auto_56237 ?auto_56238 ?auto_56236 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57593 - OBJ
      ?auto_57594 - OBJ
      ?auto_57595 - OBJ
      ?auto_57592 - LOCATION
    )
    :vars
    (
      ?auto_57596 - TRUCK
      ?auto_57598 - LOCATION
      ?auto_57597 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57594 ?auto_57596 ) ( TRUCK-AT ?auto_57596 ?auto_57598 ) ( IN-CITY ?auto_57598 ?auto_57597 ) ( IN-CITY ?auto_57592 ?auto_57597 ) ( not ( = ?auto_57592 ?auto_57598 ) ) ( OBJ-AT ?auto_57593 ?auto_57592 ) ( not ( = ?auto_57593 ?auto_57594 ) ) ( OBJ-AT ?auto_57595 ?auto_57592 ) ( not ( = ?auto_57593 ?auto_57595 ) ) ( not ( = ?auto_57594 ?auto_57595 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57593 ?auto_57594 ?auto_57592 )
      ( DELIVER-3PKG-VERIFY ?auto_57593 ?auto_57594 ?auto_57595 ?auto_57592 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57615 - OBJ
      ?auto_57616 - OBJ
      ?auto_57617 - OBJ
      ?auto_57614 - LOCATION
    )
    :vars
    (
      ?auto_57619 - TRUCK
      ?auto_57621 - LOCATION
      ?auto_57620 - CITY
      ?auto_57618 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57617 ?auto_57619 ) ( TRUCK-AT ?auto_57619 ?auto_57621 ) ( IN-CITY ?auto_57621 ?auto_57620 ) ( IN-CITY ?auto_57614 ?auto_57620 ) ( not ( = ?auto_57614 ?auto_57621 ) ) ( OBJ-AT ?auto_57618 ?auto_57614 ) ( not ( = ?auto_57618 ?auto_57617 ) ) ( OBJ-AT ?auto_57615 ?auto_57614 ) ( OBJ-AT ?auto_57616 ?auto_57614 ) ( not ( = ?auto_57615 ?auto_57616 ) ) ( not ( = ?auto_57615 ?auto_57617 ) ) ( not ( = ?auto_57615 ?auto_57618 ) ) ( not ( = ?auto_57616 ?auto_57617 ) ) ( not ( = ?auto_57616 ?auto_57618 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57618 ?auto_57617 ?auto_57614 )
      ( DELIVER-3PKG-VERIFY ?auto_57615 ?auto_57616 ?auto_57617 ?auto_57614 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57627 - OBJ
      ?auto_57628 - OBJ
      ?auto_57629 - OBJ
      ?auto_57626 - LOCATION
    )
    :vars
    (
      ?auto_57631 - TRUCK
      ?auto_57633 - LOCATION
      ?auto_57632 - CITY
      ?auto_57630 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57628 ?auto_57631 ) ( TRUCK-AT ?auto_57631 ?auto_57633 ) ( IN-CITY ?auto_57633 ?auto_57632 ) ( IN-CITY ?auto_57626 ?auto_57632 ) ( not ( = ?auto_57626 ?auto_57633 ) ) ( OBJ-AT ?auto_57630 ?auto_57626 ) ( not ( = ?auto_57630 ?auto_57628 ) ) ( OBJ-AT ?auto_57627 ?auto_57626 ) ( OBJ-AT ?auto_57629 ?auto_57626 ) ( not ( = ?auto_57627 ?auto_57628 ) ) ( not ( = ?auto_57627 ?auto_57629 ) ) ( not ( = ?auto_57627 ?auto_57630 ) ) ( not ( = ?auto_57628 ?auto_57629 ) ) ( not ( = ?auto_57629 ?auto_57630 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57630 ?auto_57628 ?auto_57626 )
      ( DELIVER-3PKG-VERIFY ?auto_57627 ?auto_57628 ?auto_57629 ?auto_57626 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57665 - OBJ
      ?auto_57666 - OBJ
      ?auto_57667 - OBJ
      ?auto_57664 - LOCATION
    )
    :vars
    (
      ?auto_57669 - TRUCK
      ?auto_57671 - LOCATION
      ?auto_57670 - CITY
      ?auto_57668 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57665 ?auto_57669 ) ( TRUCK-AT ?auto_57669 ?auto_57671 ) ( IN-CITY ?auto_57671 ?auto_57670 ) ( IN-CITY ?auto_57664 ?auto_57670 ) ( not ( = ?auto_57664 ?auto_57671 ) ) ( OBJ-AT ?auto_57668 ?auto_57664 ) ( not ( = ?auto_57668 ?auto_57665 ) ) ( OBJ-AT ?auto_57666 ?auto_57664 ) ( OBJ-AT ?auto_57667 ?auto_57664 ) ( not ( = ?auto_57665 ?auto_57666 ) ) ( not ( = ?auto_57665 ?auto_57667 ) ) ( not ( = ?auto_57666 ?auto_57667 ) ) ( not ( = ?auto_57666 ?auto_57668 ) ) ( not ( = ?auto_57667 ?auto_57668 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57668 ?auto_57665 ?auto_57664 )
      ( DELIVER-3PKG-VERIFY ?auto_57665 ?auto_57666 ?auto_57667 ?auto_57664 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57712 - OBJ
      ?auto_57713 - OBJ
      ?auto_57714 - OBJ
      ?auto_57715 - OBJ
      ?auto_57711 - LOCATION
    )
    :vars
    (
      ?auto_57716 - TRUCK
      ?auto_57718 - LOCATION
      ?auto_57717 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57715 ?auto_57716 ) ( TRUCK-AT ?auto_57716 ?auto_57718 ) ( IN-CITY ?auto_57718 ?auto_57717 ) ( IN-CITY ?auto_57711 ?auto_57717 ) ( not ( = ?auto_57711 ?auto_57718 ) ) ( OBJ-AT ?auto_57713 ?auto_57711 ) ( not ( = ?auto_57713 ?auto_57715 ) ) ( OBJ-AT ?auto_57712 ?auto_57711 ) ( OBJ-AT ?auto_57714 ?auto_57711 ) ( not ( = ?auto_57712 ?auto_57713 ) ) ( not ( = ?auto_57712 ?auto_57714 ) ) ( not ( = ?auto_57712 ?auto_57715 ) ) ( not ( = ?auto_57713 ?auto_57714 ) ) ( not ( = ?auto_57714 ?auto_57715 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57713 ?auto_57715 ?auto_57711 )
      ( DELIVER-4PKG-VERIFY ?auto_57712 ?auto_57713 ?auto_57714 ?auto_57715 ?auto_57711 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57720 - OBJ
      ?auto_57721 - OBJ
      ?auto_57722 - OBJ
      ?auto_57723 - OBJ
      ?auto_57719 - LOCATION
    )
    :vars
    (
      ?auto_57724 - TRUCK
      ?auto_57726 - LOCATION
      ?auto_57725 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57722 ?auto_57724 ) ( TRUCK-AT ?auto_57724 ?auto_57726 ) ( IN-CITY ?auto_57726 ?auto_57725 ) ( IN-CITY ?auto_57719 ?auto_57725 ) ( not ( = ?auto_57719 ?auto_57726 ) ) ( OBJ-AT ?auto_57723 ?auto_57719 ) ( not ( = ?auto_57723 ?auto_57722 ) ) ( OBJ-AT ?auto_57720 ?auto_57719 ) ( OBJ-AT ?auto_57721 ?auto_57719 ) ( not ( = ?auto_57720 ?auto_57721 ) ) ( not ( = ?auto_57720 ?auto_57722 ) ) ( not ( = ?auto_57720 ?auto_57723 ) ) ( not ( = ?auto_57721 ?auto_57722 ) ) ( not ( = ?auto_57721 ?auto_57723 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57723 ?auto_57722 ?auto_57719 )
      ( DELIVER-4PKG-VERIFY ?auto_57720 ?auto_57721 ?auto_57722 ?auto_57723 ?auto_57719 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57744 - OBJ
      ?auto_57745 - OBJ
      ?auto_57746 - OBJ
      ?auto_57747 - OBJ
      ?auto_57743 - LOCATION
    )
    :vars
    (
      ?auto_57748 - TRUCK
      ?auto_57750 - LOCATION
      ?auto_57749 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57747 ?auto_57748 ) ( TRUCK-AT ?auto_57748 ?auto_57750 ) ( IN-CITY ?auto_57750 ?auto_57749 ) ( IN-CITY ?auto_57743 ?auto_57749 ) ( not ( = ?auto_57743 ?auto_57750 ) ) ( OBJ-AT ?auto_57744 ?auto_57743 ) ( not ( = ?auto_57744 ?auto_57747 ) ) ( OBJ-AT ?auto_57745 ?auto_57743 ) ( OBJ-AT ?auto_57746 ?auto_57743 ) ( not ( = ?auto_57744 ?auto_57745 ) ) ( not ( = ?auto_57744 ?auto_57746 ) ) ( not ( = ?auto_57745 ?auto_57746 ) ) ( not ( = ?auto_57745 ?auto_57747 ) ) ( not ( = ?auto_57746 ?auto_57747 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57744 ?auto_57747 ?auto_57743 )
      ( DELIVER-4PKG-VERIFY ?auto_57744 ?auto_57745 ?auto_57746 ?auto_57747 ?auto_57743 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57792 - OBJ
      ?auto_57793 - OBJ
      ?auto_57794 - OBJ
      ?auto_57795 - OBJ
      ?auto_57791 - LOCATION
    )
    :vars
    (
      ?auto_57796 - TRUCK
      ?auto_57798 - LOCATION
      ?auto_57797 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57793 ?auto_57796 ) ( TRUCK-AT ?auto_57796 ?auto_57798 ) ( IN-CITY ?auto_57798 ?auto_57797 ) ( IN-CITY ?auto_57791 ?auto_57797 ) ( not ( = ?auto_57791 ?auto_57798 ) ) ( OBJ-AT ?auto_57792 ?auto_57791 ) ( not ( = ?auto_57792 ?auto_57793 ) ) ( OBJ-AT ?auto_57794 ?auto_57791 ) ( OBJ-AT ?auto_57795 ?auto_57791 ) ( not ( = ?auto_57792 ?auto_57794 ) ) ( not ( = ?auto_57792 ?auto_57795 ) ) ( not ( = ?auto_57793 ?auto_57794 ) ) ( not ( = ?auto_57793 ?auto_57795 ) ) ( not ( = ?auto_57794 ?auto_57795 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57792 ?auto_57793 ?auto_57791 )
      ( DELIVER-4PKG-VERIFY ?auto_57792 ?auto_57793 ?auto_57794 ?auto_57795 ?auto_57791 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57872 - OBJ
      ?auto_57873 - OBJ
      ?auto_57874 - OBJ
      ?auto_57875 - OBJ
      ?auto_57871 - LOCATION
    )
    :vars
    (
      ?auto_57876 - TRUCK
      ?auto_57878 - LOCATION
      ?auto_57877 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57874 ?auto_57876 ) ( TRUCK-AT ?auto_57876 ?auto_57878 ) ( IN-CITY ?auto_57878 ?auto_57877 ) ( IN-CITY ?auto_57871 ?auto_57877 ) ( not ( = ?auto_57871 ?auto_57878 ) ) ( OBJ-AT ?auto_57873 ?auto_57871 ) ( not ( = ?auto_57873 ?auto_57874 ) ) ( OBJ-AT ?auto_57872 ?auto_57871 ) ( OBJ-AT ?auto_57875 ?auto_57871 ) ( not ( = ?auto_57872 ?auto_57873 ) ) ( not ( = ?auto_57872 ?auto_57874 ) ) ( not ( = ?auto_57872 ?auto_57875 ) ) ( not ( = ?auto_57873 ?auto_57875 ) ) ( not ( = ?auto_57874 ?auto_57875 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57873 ?auto_57874 ?auto_57871 )
      ( DELIVER-4PKG-VERIFY ?auto_57872 ?auto_57873 ?auto_57874 ?auto_57875 ?auto_57871 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57904 - OBJ
      ?auto_57905 - OBJ
      ?auto_57906 - OBJ
      ?auto_57907 - OBJ
      ?auto_57903 - LOCATION
    )
    :vars
    (
      ?auto_57909 - TRUCK
      ?auto_57911 - LOCATION
      ?auto_57910 - CITY
      ?auto_57908 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57907 ?auto_57909 ) ( TRUCK-AT ?auto_57909 ?auto_57911 ) ( IN-CITY ?auto_57911 ?auto_57910 ) ( IN-CITY ?auto_57903 ?auto_57910 ) ( not ( = ?auto_57903 ?auto_57911 ) ) ( OBJ-AT ?auto_57908 ?auto_57903 ) ( not ( = ?auto_57908 ?auto_57907 ) ) ( OBJ-AT ?auto_57904 ?auto_57903 ) ( OBJ-AT ?auto_57905 ?auto_57903 ) ( OBJ-AT ?auto_57906 ?auto_57903 ) ( not ( = ?auto_57904 ?auto_57905 ) ) ( not ( = ?auto_57904 ?auto_57906 ) ) ( not ( = ?auto_57904 ?auto_57907 ) ) ( not ( = ?auto_57904 ?auto_57908 ) ) ( not ( = ?auto_57905 ?auto_57906 ) ) ( not ( = ?auto_57905 ?auto_57907 ) ) ( not ( = ?auto_57905 ?auto_57908 ) ) ( not ( = ?auto_57906 ?auto_57907 ) ) ( not ( = ?auto_57906 ?auto_57908 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57908 ?auto_57907 ?auto_57903 )
      ( DELIVER-4PKG-VERIFY ?auto_57904 ?auto_57905 ?auto_57906 ?auto_57907 ?auto_57903 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57921 - OBJ
      ?auto_57922 - OBJ
      ?auto_57923 - OBJ
      ?auto_57924 - OBJ
      ?auto_57920 - LOCATION
    )
    :vars
    (
      ?auto_57926 - TRUCK
      ?auto_57928 - LOCATION
      ?auto_57927 - CITY
      ?auto_57925 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57923 ?auto_57926 ) ( TRUCK-AT ?auto_57926 ?auto_57928 ) ( IN-CITY ?auto_57928 ?auto_57927 ) ( IN-CITY ?auto_57920 ?auto_57927 ) ( not ( = ?auto_57920 ?auto_57928 ) ) ( OBJ-AT ?auto_57925 ?auto_57920 ) ( not ( = ?auto_57925 ?auto_57923 ) ) ( OBJ-AT ?auto_57921 ?auto_57920 ) ( OBJ-AT ?auto_57922 ?auto_57920 ) ( OBJ-AT ?auto_57924 ?auto_57920 ) ( not ( = ?auto_57921 ?auto_57922 ) ) ( not ( = ?auto_57921 ?auto_57923 ) ) ( not ( = ?auto_57921 ?auto_57924 ) ) ( not ( = ?auto_57921 ?auto_57925 ) ) ( not ( = ?auto_57922 ?auto_57923 ) ) ( not ( = ?auto_57922 ?auto_57924 ) ) ( not ( = ?auto_57922 ?auto_57925 ) ) ( not ( = ?auto_57923 ?auto_57924 ) ) ( not ( = ?auto_57924 ?auto_57925 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57925 ?auto_57923 ?auto_57920 )
      ( DELIVER-4PKG-VERIFY ?auto_57921 ?auto_57922 ?auto_57923 ?auto_57924 ?auto_57920 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57963 - OBJ
      ?auto_57964 - OBJ
      ?auto_57965 - OBJ
      ?auto_57966 - OBJ
      ?auto_57962 - LOCATION
    )
    :vars
    (
      ?auto_57967 - TRUCK
      ?auto_57969 - LOCATION
      ?auto_57968 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57964 ?auto_57967 ) ( TRUCK-AT ?auto_57967 ?auto_57969 ) ( IN-CITY ?auto_57969 ?auto_57968 ) ( IN-CITY ?auto_57962 ?auto_57968 ) ( not ( = ?auto_57962 ?auto_57969 ) ) ( OBJ-AT ?auto_57966 ?auto_57962 ) ( not ( = ?auto_57966 ?auto_57964 ) ) ( OBJ-AT ?auto_57963 ?auto_57962 ) ( OBJ-AT ?auto_57965 ?auto_57962 ) ( not ( = ?auto_57963 ?auto_57964 ) ) ( not ( = ?auto_57963 ?auto_57965 ) ) ( not ( = ?auto_57963 ?auto_57966 ) ) ( not ( = ?auto_57964 ?auto_57965 ) ) ( not ( = ?auto_57965 ?auto_57966 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57966 ?auto_57964 ?auto_57962 )
      ( DELIVER-4PKG-VERIFY ?auto_57963 ?auto_57964 ?auto_57965 ?auto_57966 ?auto_57962 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57971 - OBJ
      ?auto_57972 - OBJ
      ?auto_57973 - OBJ
      ?auto_57974 - OBJ
      ?auto_57970 - LOCATION
    )
    :vars
    (
      ?auto_57976 - TRUCK
      ?auto_57978 - LOCATION
      ?auto_57977 - CITY
      ?auto_57975 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57972 ?auto_57976 ) ( TRUCK-AT ?auto_57976 ?auto_57978 ) ( IN-CITY ?auto_57978 ?auto_57977 ) ( IN-CITY ?auto_57970 ?auto_57977 ) ( not ( = ?auto_57970 ?auto_57978 ) ) ( OBJ-AT ?auto_57975 ?auto_57970 ) ( not ( = ?auto_57975 ?auto_57972 ) ) ( OBJ-AT ?auto_57971 ?auto_57970 ) ( OBJ-AT ?auto_57973 ?auto_57970 ) ( OBJ-AT ?auto_57974 ?auto_57970 ) ( not ( = ?auto_57971 ?auto_57972 ) ) ( not ( = ?auto_57971 ?auto_57973 ) ) ( not ( = ?auto_57971 ?auto_57974 ) ) ( not ( = ?auto_57971 ?auto_57975 ) ) ( not ( = ?auto_57972 ?auto_57973 ) ) ( not ( = ?auto_57972 ?auto_57974 ) ) ( not ( = ?auto_57973 ?auto_57974 ) ) ( not ( = ?auto_57973 ?auto_57975 ) ) ( not ( = ?auto_57974 ?auto_57975 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57975 ?auto_57972 ?auto_57970 )
      ( DELIVER-4PKG-VERIFY ?auto_57971 ?auto_57972 ?auto_57973 ?auto_57974 ?auto_57970 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58023 - OBJ
      ?auto_58024 - OBJ
      ?auto_58025 - OBJ
      ?auto_58026 - OBJ
      ?auto_58022 - LOCATION
    )
    :vars
    (
      ?auto_58027 - TRUCK
      ?auto_58029 - LOCATION
      ?auto_58028 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58023 ?auto_58027 ) ( TRUCK-AT ?auto_58027 ?auto_58029 ) ( IN-CITY ?auto_58029 ?auto_58028 ) ( IN-CITY ?auto_58022 ?auto_58028 ) ( not ( = ?auto_58022 ?auto_58029 ) ) ( OBJ-AT ?auto_58025 ?auto_58022 ) ( not ( = ?auto_58025 ?auto_58023 ) ) ( OBJ-AT ?auto_58024 ?auto_58022 ) ( OBJ-AT ?auto_58026 ?auto_58022 ) ( not ( = ?auto_58023 ?auto_58024 ) ) ( not ( = ?auto_58023 ?auto_58026 ) ) ( not ( = ?auto_58024 ?auto_58025 ) ) ( not ( = ?auto_58024 ?auto_58026 ) ) ( not ( = ?auto_58025 ?auto_58026 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58025 ?auto_58023 ?auto_58022 )
      ( DELIVER-4PKG-VERIFY ?auto_58023 ?auto_58024 ?auto_58025 ?auto_58026 ?auto_58022 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58039 - OBJ
      ?auto_58040 - OBJ
      ?auto_58041 - OBJ
      ?auto_58042 - OBJ
      ?auto_58038 - LOCATION
    )
    :vars
    (
      ?auto_58043 - TRUCK
      ?auto_58045 - LOCATION
      ?auto_58044 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58039 ?auto_58043 ) ( TRUCK-AT ?auto_58043 ?auto_58045 ) ( IN-CITY ?auto_58045 ?auto_58044 ) ( IN-CITY ?auto_58038 ?auto_58044 ) ( not ( = ?auto_58038 ?auto_58045 ) ) ( OBJ-AT ?auto_58040 ?auto_58038 ) ( not ( = ?auto_58040 ?auto_58039 ) ) ( OBJ-AT ?auto_58041 ?auto_58038 ) ( OBJ-AT ?auto_58042 ?auto_58038 ) ( not ( = ?auto_58039 ?auto_58041 ) ) ( not ( = ?auto_58039 ?auto_58042 ) ) ( not ( = ?auto_58040 ?auto_58041 ) ) ( not ( = ?auto_58040 ?auto_58042 ) ) ( not ( = ?auto_58041 ?auto_58042 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58040 ?auto_58039 ?auto_58038 )
      ( DELIVER-4PKG-VERIFY ?auto_58039 ?auto_58040 ?auto_58041 ?auto_58042 ?auto_58038 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58119 - OBJ
      ?auto_58120 - OBJ
      ?auto_58121 - OBJ
      ?auto_58122 - OBJ
      ?auto_58118 - LOCATION
    )
    :vars
    (
      ?auto_58124 - TRUCK
      ?auto_58126 - LOCATION
      ?auto_58125 - CITY
      ?auto_58123 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58119 ?auto_58124 ) ( TRUCK-AT ?auto_58124 ?auto_58126 ) ( IN-CITY ?auto_58126 ?auto_58125 ) ( IN-CITY ?auto_58118 ?auto_58125 ) ( not ( = ?auto_58118 ?auto_58126 ) ) ( OBJ-AT ?auto_58123 ?auto_58118 ) ( not ( = ?auto_58123 ?auto_58119 ) ) ( OBJ-AT ?auto_58120 ?auto_58118 ) ( OBJ-AT ?auto_58121 ?auto_58118 ) ( OBJ-AT ?auto_58122 ?auto_58118 ) ( not ( = ?auto_58119 ?auto_58120 ) ) ( not ( = ?auto_58119 ?auto_58121 ) ) ( not ( = ?auto_58119 ?auto_58122 ) ) ( not ( = ?auto_58120 ?auto_58121 ) ) ( not ( = ?auto_58120 ?auto_58122 ) ) ( not ( = ?auto_58120 ?auto_58123 ) ) ( not ( = ?auto_58121 ?auto_58122 ) ) ( not ( = ?auto_58121 ?auto_58123 ) ) ( not ( = ?auto_58122 ?auto_58123 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58123 ?auto_58119 ?auto_58118 )
      ( DELIVER-4PKG-VERIFY ?auto_58119 ?auto_58120 ?auto_58121 ?auto_58122 ?auto_58118 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58281 - OBJ
      ?auto_58282 - OBJ
      ?auto_58283 - OBJ
      ?auto_58280 - LOCATION
    )
    :vars
    (
      ?auto_58284 - TRUCK
      ?auto_58286 - LOCATION
      ?auto_58285 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58284 ?auto_58286 ) ( IN-CITY ?auto_58286 ?auto_58285 ) ( IN-CITY ?auto_58280 ?auto_58285 ) ( not ( = ?auto_58280 ?auto_58286 ) ) ( OBJ-AT ?auto_58281 ?auto_58280 ) ( not ( = ?auto_58281 ?auto_58282 ) ) ( OBJ-AT ?auto_58282 ?auto_58286 ) ( OBJ-AT ?auto_58283 ?auto_58280 ) ( not ( = ?auto_58281 ?auto_58283 ) ) ( not ( = ?auto_58282 ?auto_58283 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58281 ?auto_58282 ?auto_58280 )
      ( DELIVER-3PKG-VERIFY ?auto_58281 ?auto_58282 ?auto_58283 ?auto_58280 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58303 - OBJ
      ?auto_58304 - OBJ
      ?auto_58305 - OBJ
      ?auto_58302 - LOCATION
    )
    :vars
    (
      ?auto_58306 - TRUCK
      ?auto_58309 - LOCATION
      ?auto_58308 - CITY
      ?auto_58307 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58306 ?auto_58309 ) ( IN-CITY ?auto_58309 ?auto_58308 ) ( IN-CITY ?auto_58302 ?auto_58308 ) ( not ( = ?auto_58302 ?auto_58309 ) ) ( OBJ-AT ?auto_58307 ?auto_58302 ) ( not ( = ?auto_58307 ?auto_58305 ) ) ( OBJ-AT ?auto_58305 ?auto_58309 ) ( OBJ-AT ?auto_58303 ?auto_58302 ) ( OBJ-AT ?auto_58304 ?auto_58302 ) ( not ( = ?auto_58303 ?auto_58304 ) ) ( not ( = ?auto_58303 ?auto_58305 ) ) ( not ( = ?auto_58303 ?auto_58307 ) ) ( not ( = ?auto_58304 ?auto_58305 ) ) ( not ( = ?auto_58304 ?auto_58307 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58307 ?auto_58305 ?auto_58302 )
      ( DELIVER-3PKG-VERIFY ?auto_58303 ?auto_58304 ?auto_58305 ?auto_58302 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58315 - OBJ
      ?auto_58316 - OBJ
      ?auto_58317 - OBJ
      ?auto_58314 - LOCATION
    )
    :vars
    (
      ?auto_58318 - TRUCK
      ?auto_58321 - LOCATION
      ?auto_58320 - CITY
      ?auto_58319 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58318 ?auto_58321 ) ( IN-CITY ?auto_58321 ?auto_58320 ) ( IN-CITY ?auto_58314 ?auto_58320 ) ( not ( = ?auto_58314 ?auto_58321 ) ) ( OBJ-AT ?auto_58319 ?auto_58314 ) ( not ( = ?auto_58319 ?auto_58316 ) ) ( OBJ-AT ?auto_58316 ?auto_58321 ) ( OBJ-AT ?auto_58315 ?auto_58314 ) ( OBJ-AT ?auto_58317 ?auto_58314 ) ( not ( = ?auto_58315 ?auto_58316 ) ) ( not ( = ?auto_58315 ?auto_58317 ) ) ( not ( = ?auto_58315 ?auto_58319 ) ) ( not ( = ?auto_58316 ?auto_58317 ) ) ( not ( = ?auto_58317 ?auto_58319 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58319 ?auto_58316 ?auto_58314 )
      ( DELIVER-3PKG-VERIFY ?auto_58315 ?auto_58316 ?auto_58317 ?auto_58314 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58331 - OBJ
      ?auto_58332 - OBJ
      ?auto_58333 - OBJ
      ?auto_58330 - LOCATION
    )
    :vars
    (
      ?auto_58334 - TRUCK
      ?auto_58336 - LOCATION
      ?auto_58335 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58334 ?auto_58336 ) ( IN-CITY ?auto_58336 ?auto_58335 ) ( IN-CITY ?auto_58330 ?auto_58335 ) ( not ( = ?auto_58330 ?auto_58336 ) ) ( OBJ-AT ?auto_58333 ?auto_58330 ) ( not ( = ?auto_58333 ?auto_58331 ) ) ( OBJ-AT ?auto_58331 ?auto_58336 ) ( OBJ-AT ?auto_58332 ?auto_58330 ) ( not ( = ?auto_58331 ?auto_58332 ) ) ( not ( = ?auto_58332 ?auto_58333 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58333 ?auto_58331 ?auto_58330 )
      ( DELIVER-3PKG-VERIFY ?auto_58331 ?auto_58332 ?auto_58333 ?auto_58330 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58353 - OBJ
      ?auto_58354 - OBJ
      ?auto_58355 - OBJ
      ?auto_58352 - LOCATION
    )
    :vars
    (
      ?auto_58356 - TRUCK
      ?auto_58359 - LOCATION
      ?auto_58358 - CITY
      ?auto_58357 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58356 ?auto_58359 ) ( IN-CITY ?auto_58359 ?auto_58358 ) ( IN-CITY ?auto_58352 ?auto_58358 ) ( not ( = ?auto_58352 ?auto_58359 ) ) ( OBJ-AT ?auto_58357 ?auto_58352 ) ( not ( = ?auto_58357 ?auto_58353 ) ) ( OBJ-AT ?auto_58353 ?auto_58359 ) ( OBJ-AT ?auto_58354 ?auto_58352 ) ( OBJ-AT ?auto_58355 ?auto_58352 ) ( not ( = ?auto_58353 ?auto_58354 ) ) ( not ( = ?auto_58353 ?auto_58355 ) ) ( not ( = ?auto_58354 ?auto_58355 ) ) ( not ( = ?auto_58354 ?auto_58357 ) ) ( not ( = ?auto_58355 ?auto_58357 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58357 ?auto_58353 ?auto_58352 )
      ( DELIVER-3PKG-VERIFY ?auto_58353 ?auto_58354 ?auto_58355 ?auto_58352 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58400 - OBJ
      ?auto_58401 - OBJ
      ?auto_58402 - OBJ
      ?auto_58403 - OBJ
      ?auto_58399 - LOCATION
    )
    :vars
    (
      ?auto_58404 - TRUCK
      ?auto_58406 - LOCATION
      ?auto_58405 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58404 ?auto_58406 ) ( IN-CITY ?auto_58406 ?auto_58405 ) ( IN-CITY ?auto_58399 ?auto_58405 ) ( not ( = ?auto_58399 ?auto_58406 ) ) ( OBJ-AT ?auto_58400 ?auto_58399 ) ( not ( = ?auto_58400 ?auto_58403 ) ) ( OBJ-AT ?auto_58403 ?auto_58406 ) ( OBJ-AT ?auto_58401 ?auto_58399 ) ( OBJ-AT ?auto_58402 ?auto_58399 ) ( not ( = ?auto_58400 ?auto_58401 ) ) ( not ( = ?auto_58400 ?auto_58402 ) ) ( not ( = ?auto_58401 ?auto_58402 ) ) ( not ( = ?auto_58401 ?auto_58403 ) ) ( not ( = ?auto_58402 ?auto_58403 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58400 ?auto_58403 ?auto_58399 )
      ( DELIVER-4PKG-VERIFY ?auto_58400 ?auto_58401 ?auto_58402 ?auto_58403 ?auto_58399 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58416 - OBJ
      ?auto_58417 - OBJ
      ?auto_58418 - OBJ
      ?auto_58419 - OBJ
      ?auto_58415 - LOCATION
    )
    :vars
    (
      ?auto_58420 - TRUCK
      ?auto_58422 - LOCATION
      ?auto_58421 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58420 ?auto_58422 ) ( IN-CITY ?auto_58422 ?auto_58421 ) ( IN-CITY ?auto_58415 ?auto_58421 ) ( not ( = ?auto_58415 ?auto_58422 ) ) ( OBJ-AT ?auto_58416 ?auto_58415 ) ( not ( = ?auto_58416 ?auto_58418 ) ) ( OBJ-AT ?auto_58418 ?auto_58422 ) ( OBJ-AT ?auto_58417 ?auto_58415 ) ( OBJ-AT ?auto_58419 ?auto_58415 ) ( not ( = ?auto_58416 ?auto_58417 ) ) ( not ( = ?auto_58416 ?auto_58419 ) ) ( not ( = ?auto_58417 ?auto_58418 ) ) ( not ( = ?auto_58417 ?auto_58419 ) ) ( not ( = ?auto_58418 ?auto_58419 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58416 ?auto_58418 ?auto_58415 )
      ( DELIVER-4PKG-VERIFY ?auto_58416 ?auto_58417 ?auto_58418 ?auto_58419 ?auto_58415 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58472 - OBJ
      ?auto_58473 - OBJ
      ?auto_58474 - OBJ
      ?auto_58475 - OBJ
      ?auto_58471 - LOCATION
    )
    :vars
    (
      ?auto_58476 - TRUCK
      ?auto_58478 - LOCATION
      ?auto_58477 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58476 ?auto_58478 ) ( IN-CITY ?auto_58478 ?auto_58477 ) ( IN-CITY ?auto_58471 ?auto_58477 ) ( not ( = ?auto_58471 ?auto_58478 ) ) ( OBJ-AT ?auto_58472 ?auto_58471 ) ( not ( = ?auto_58472 ?auto_58473 ) ) ( OBJ-AT ?auto_58473 ?auto_58478 ) ( OBJ-AT ?auto_58474 ?auto_58471 ) ( OBJ-AT ?auto_58475 ?auto_58471 ) ( not ( = ?auto_58472 ?auto_58474 ) ) ( not ( = ?auto_58472 ?auto_58475 ) ) ( not ( = ?auto_58473 ?auto_58474 ) ) ( not ( = ?auto_58473 ?auto_58475 ) ) ( not ( = ?auto_58474 ?auto_58475 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58472 ?auto_58473 ?auto_58471 )
      ( DELIVER-4PKG-VERIFY ?auto_58472 ?auto_58473 ?auto_58474 ?auto_58475 ?auto_58471 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58496 - OBJ
      ?auto_58497 - OBJ
      ?auto_58498 - OBJ
      ?auto_58499 - OBJ
      ?auto_58495 - LOCATION
    )
    :vars
    (
      ?auto_58500 - TRUCK
      ?auto_58502 - LOCATION
      ?auto_58501 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58500 ?auto_58502 ) ( IN-CITY ?auto_58502 ?auto_58501 ) ( IN-CITY ?auto_58495 ?auto_58501 ) ( not ( = ?auto_58495 ?auto_58502 ) ) ( OBJ-AT ?auto_58499 ?auto_58495 ) ( not ( = ?auto_58499 ?auto_58497 ) ) ( OBJ-AT ?auto_58497 ?auto_58502 ) ( OBJ-AT ?auto_58496 ?auto_58495 ) ( OBJ-AT ?auto_58498 ?auto_58495 ) ( not ( = ?auto_58496 ?auto_58497 ) ) ( not ( = ?auto_58496 ?auto_58498 ) ) ( not ( = ?auto_58496 ?auto_58499 ) ) ( not ( = ?auto_58497 ?auto_58498 ) ) ( not ( = ?auto_58498 ?auto_58499 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58499 ?auto_58497 ?auto_58495 )
      ( DELIVER-4PKG-VERIFY ?auto_58496 ?auto_58497 ?auto_58498 ?auto_58499 ?auto_58495 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58544 - OBJ
      ?auto_58545 - OBJ
      ?auto_58546 - OBJ
      ?auto_58547 - OBJ
      ?auto_58543 - LOCATION
    )
    :vars
    (
      ?auto_58548 - TRUCK
      ?auto_58550 - LOCATION
      ?auto_58549 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58548 ?auto_58550 ) ( IN-CITY ?auto_58550 ?auto_58549 ) ( IN-CITY ?auto_58543 ?auto_58549 ) ( not ( = ?auto_58543 ?auto_58550 ) ) ( OBJ-AT ?auto_58545 ?auto_58543 ) ( not ( = ?auto_58545 ?auto_58547 ) ) ( OBJ-AT ?auto_58547 ?auto_58550 ) ( OBJ-AT ?auto_58544 ?auto_58543 ) ( OBJ-AT ?auto_58546 ?auto_58543 ) ( not ( = ?auto_58544 ?auto_58545 ) ) ( not ( = ?auto_58544 ?auto_58546 ) ) ( not ( = ?auto_58544 ?auto_58547 ) ) ( not ( = ?auto_58545 ?auto_58546 ) ) ( not ( = ?auto_58546 ?auto_58547 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58545 ?auto_58547 ?auto_58543 )
      ( DELIVER-4PKG-VERIFY ?auto_58544 ?auto_58545 ?auto_58546 ?auto_58547 ?auto_58543 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58592 - OBJ
      ?auto_58593 - OBJ
      ?auto_58594 - OBJ
      ?auto_58595 - OBJ
      ?auto_58591 - LOCATION
    )
    :vars
    (
      ?auto_58596 - TRUCK
      ?auto_58599 - LOCATION
      ?auto_58598 - CITY
      ?auto_58597 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58596 ?auto_58599 ) ( IN-CITY ?auto_58599 ?auto_58598 ) ( IN-CITY ?auto_58591 ?auto_58598 ) ( not ( = ?auto_58591 ?auto_58599 ) ) ( OBJ-AT ?auto_58597 ?auto_58591 ) ( not ( = ?auto_58597 ?auto_58595 ) ) ( OBJ-AT ?auto_58595 ?auto_58599 ) ( OBJ-AT ?auto_58592 ?auto_58591 ) ( OBJ-AT ?auto_58593 ?auto_58591 ) ( OBJ-AT ?auto_58594 ?auto_58591 ) ( not ( = ?auto_58592 ?auto_58593 ) ) ( not ( = ?auto_58592 ?auto_58594 ) ) ( not ( = ?auto_58592 ?auto_58595 ) ) ( not ( = ?auto_58592 ?auto_58597 ) ) ( not ( = ?auto_58593 ?auto_58594 ) ) ( not ( = ?auto_58593 ?auto_58595 ) ) ( not ( = ?auto_58593 ?auto_58597 ) ) ( not ( = ?auto_58594 ?auto_58595 ) ) ( not ( = ?auto_58594 ?auto_58597 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58597 ?auto_58595 ?auto_58591 )
      ( DELIVER-4PKG-VERIFY ?auto_58592 ?auto_58593 ?auto_58594 ?auto_58595 ?auto_58591 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58601 - OBJ
      ?auto_58602 - OBJ
      ?auto_58603 - OBJ
      ?auto_58604 - OBJ
      ?auto_58600 - LOCATION
    )
    :vars
    (
      ?auto_58605 - TRUCK
      ?auto_58607 - LOCATION
      ?auto_58606 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58605 ?auto_58607 ) ( IN-CITY ?auto_58607 ?auto_58606 ) ( IN-CITY ?auto_58600 ?auto_58606 ) ( not ( = ?auto_58600 ?auto_58607 ) ) ( OBJ-AT ?auto_58604 ?auto_58600 ) ( not ( = ?auto_58604 ?auto_58603 ) ) ( OBJ-AT ?auto_58603 ?auto_58607 ) ( OBJ-AT ?auto_58601 ?auto_58600 ) ( OBJ-AT ?auto_58602 ?auto_58600 ) ( not ( = ?auto_58601 ?auto_58602 ) ) ( not ( = ?auto_58601 ?auto_58603 ) ) ( not ( = ?auto_58601 ?auto_58604 ) ) ( not ( = ?auto_58602 ?auto_58603 ) ) ( not ( = ?auto_58602 ?auto_58604 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58604 ?auto_58603 ?auto_58600 )
      ( DELIVER-4PKG-VERIFY ?auto_58601 ?auto_58602 ?auto_58603 ?auto_58604 ?auto_58600 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58609 - OBJ
      ?auto_58610 - OBJ
      ?auto_58611 - OBJ
      ?auto_58612 - OBJ
      ?auto_58608 - LOCATION
    )
    :vars
    (
      ?auto_58613 - TRUCK
      ?auto_58616 - LOCATION
      ?auto_58615 - CITY
      ?auto_58614 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58613 ?auto_58616 ) ( IN-CITY ?auto_58616 ?auto_58615 ) ( IN-CITY ?auto_58608 ?auto_58615 ) ( not ( = ?auto_58608 ?auto_58616 ) ) ( OBJ-AT ?auto_58614 ?auto_58608 ) ( not ( = ?auto_58614 ?auto_58611 ) ) ( OBJ-AT ?auto_58611 ?auto_58616 ) ( OBJ-AT ?auto_58609 ?auto_58608 ) ( OBJ-AT ?auto_58610 ?auto_58608 ) ( OBJ-AT ?auto_58612 ?auto_58608 ) ( not ( = ?auto_58609 ?auto_58610 ) ) ( not ( = ?auto_58609 ?auto_58611 ) ) ( not ( = ?auto_58609 ?auto_58612 ) ) ( not ( = ?auto_58609 ?auto_58614 ) ) ( not ( = ?auto_58610 ?auto_58611 ) ) ( not ( = ?auto_58610 ?auto_58612 ) ) ( not ( = ?auto_58610 ?auto_58614 ) ) ( not ( = ?auto_58611 ?auto_58612 ) ) ( not ( = ?auto_58612 ?auto_58614 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58614 ?auto_58611 ?auto_58608 )
      ( DELIVER-4PKG-VERIFY ?auto_58609 ?auto_58610 ?auto_58611 ?auto_58612 ?auto_58608 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58659 - OBJ
      ?auto_58660 - OBJ
      ?auto_58661 - OBJ
      ?auto_58662 - OBJ
      ?auto_58658 - LOCATION
    )
    :vars
    (
      ?auto_58663 - TRUCK
      ?auto_58666 - LOCATION
      ?auto_58665 - CITY
      ?auto_58664 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58663 ?auto_58666 ) ( IN-CITY ?auto_58666 ?auto_58665 ) ( IN-CITY ?auto_58658 ?auto_58665 ) ( not ( = ?auto_58658 ?auto_58666 ) ) ( OBJ-AT ?auto_58664 ?auto_58658 ) ( not ( = ?auto_58664 ?auto_58660 ) ) ( OBJ-AT ?auto_58660 ?auto_58666 ) ( OBJ-AT ?auto_58659 ?auto_58658 ) ( OBJ-AT ?auto_58661 ?auto_58658 ) ( OBJ-AT ?auto_58662 ?auto_58658 ) ( not ( = ?auto_58659 ?auto_58660 ) ) ( not ( = ?auto_58659 ?auto_58661 ) ) ( not ( = ?auto_58659 ?auto_58662 ) ) ( not ( = ?auto_58659 ?auto_58664 ) ) ( not ( = ?auto_58660 ?auto_58661 ) ) ( not ( = ?auto_58660 ?auto_58662 ) ) ( not ( = ?auto_58661 ?auto_58662 ) ) ( not ( = ?auto_58661 ?auto_58664 ) ) ( not ( = ?auto_58662 ?auto_58664 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58664 ?auto_58660 ?auto_58658 )
      ( DELIVER-4PKG-VERIFY ?auto_58659 ?auto_58660 ?auto_58661 ?auto_58662 ?auto_58658 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58703 - OBJ
      ?auto_58704 - OBJ
      ?auto_58705 - OBJ
      ?auto_58706 - OBJ
      ?auto_58702 - LOCATION
    )
    :vars
    (
      ?auto_58707 - TRUCK
      ?auto_58709 - LOCATION
      ?auto_58708 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58707 ?auto_58709 ) ( IN-CITY ?auto_58709 ?auto_58708 ) ( IN-CITY ?auto_58702 ?auto_58708 ) ( not ( = ?auto_58702 ?auto_58709 ) ) ( OBJ-AT ?auto_58704 ?auto_58702 ) ( not ( = ?auto_58704 ?auto_58703 ) ) ( OBJ-AT ?auto_58703 ?auto_58709 ) ( OBJ-AT ?auto_58705 ?auto_58702 ) ( OBJ-AT ?auto_58706 ?auto_58702 ) ( not ( = ?auto_58703 ?auto_58705 ) ) ( not ( = ?auto_58703 ?auto_58706 ) ) ( not ( = ?auto_58704 ?auto_58705 ) ) ( not ( = ?auto_58704 ?auto_58706 ) ) ( not ( = ?auto_58705 ?auto_58706 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58704 ?auto_58703 ?auto_58702 )
      ( DELIVER-4PKG-VERIFY ?auto_58703 ?auto_58704 ?auto_58705 ?auto_58706 ?auto_58702 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58711 - OBJ
      ?auto_58712 - OBJ
      ?auto_58713 - OBJ
      ?auto_58714 - OBJ
      ?auto_58710 - LOCATION
    )
    :vars
    (
      ?auto_58715 - TRUCK
      ?auto_58717 - LOCATION
      ?auto_58716 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58715 ?auto_58717 ) ( IN-CITY ?auto_58717 ?auto_58716 ) ( IN-CITY ?auto_58710 ?auto_58716 ) ( not ( = ?auto_58710 ?auto_58717 ) ) ( OBJ-AT ?auto_58713 ?auto_58710 ) ( not ( = ?auto_58713 ?auto_58711 ) ) ( OBJ-AT ?auto_58711 ?auto_58717 ) ( OBJ-AT ?auto_58712 ?auto_58710 ) ( OBJ-AT ?auto_58714 ?auto_58710 ) ( not ( = ?auto_58711 ?auto_58712 ) ) ( not ( = ?auto_58711 ?auto_58714 ) ) ( not ( = ?auto_58712 ?auto_58713 ) ) ( not ( = ?auto_58712 ?auto_58714 ) ) ( not ( = ?auto_58713 ?auto_58714 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58713 ?auto_58711 ?auto_58710 )
      ( DELIVER-4PKG-VERIFY ?auto_58711 ?auto_58712 ?auto_58713 ?auto_58714 ?auto_58710 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58807 - OBJ
      ?auto_58808 - OBJ
      ?auto_58809 - OBJ
      ?auto_58810 - OBJ
      ?auto_58806 - LOCATION
    )
    :vars
    (
      ?auto_58811 - TRUCK
      ?auto_58814 - LOCATION
      ?auto_58813 - CITY
      ?auto_58812 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58811 ?auto_58814 ) ( IN-CITY ?auto_58814 ?auto_58813 ) ( IN-CITY ?auto_58806 ?auto_58813 ) ( not ( = ?auto_58806 ?auto_58814 ) ) ( OBJ-AT ?auto_58812 ?auto_58806 ) ( not ( = ?auto_58812 ?auto_58807 ) ) ( OBJ-AT ?auto_58807 ?auto_58814 ) ( OBJ-AT ?auto_58808 ?auto_58806 ) ( OBJ-AT ?auto_58809 ?auto_58806 ) ( OBJ-AT ?auto_58810 ?auto_58806 ) ( not ( = ?auto_58807 ?auto_58808 ) ) ( not ( = ?auto_58807 ?auto_58809 ) ) ( not ( = ?auto_58807 ?auto_58810 ) ) ( not ( = ?auto_58808 ?auto_58809 ) ) ( not ( = ?auto_58808 ?auto_58810 ) ) ( not ( = ?auto_58808 ?auto_58812 ) ) ( not ( = ?auto_58809 ?auto_58810 ) ) ( not ( = ?auto_58809 ?auto_58812 ) ) ( not ( = ?auto_58810 ?auto_58812 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58812 ?auto_58807 ?auto_58806 )
      ( DELIVER-4PKG-VERIFY ?auto_58807 ?auto_58808 ?auto_58809 ?auto_58810 ?auto_58806 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58991 - OBJ
      ?auto_58992 - OBJ
      ?auto_58993 - OBJ
      ?auto_58990 - LOCATION
    )
    :vars
    (
      ?auto_58997 - LOCATION
      ?auto_58994 - CITY
      ?auto_58996 - OBJ
      ?auto_58995 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_58997 ?auto_58994 ) ( IN-CITY ?auto_58990 ?auto_58994 ) ( not ( = ?auto_58990 ?auto_58997 ) ) ( OBJ-AT ?auto_58996 ?auto_58990 ) ( not ( = ?auto_58996 ?auto_58993 ) ) ( OBJ-AT ?auto_58993 ?auto_58997 ) ( TRUCK-AT ?auto_58995 ?auto_58990 ) ( OBJ-AT ?auto_58991 ?auto_58990 ) ( OBJ-AT ?auto_58992 ?auto_58990 ) ( not ( = ?auto_58991 ?auto_58992 ) ) ( not ( = ?auto_58991 ?auto_58993 ) ) ( not ( = ?auto_58991 ?auto_58996 ) ) ( not ( = ?auto_58992 ?auto_58993 ) ) ( not ( = ?auto_58992 ?auto_58996 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58996 ?auto_58993 ?auto_58990 )
      ( DELIVER-3PKG-VERIFY ?auto_58991 ?auto_58992 ?auto_58993 ?auto_58990 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59003 - OBJ
      ?auto_59004 - OBJ
      ?auto_59005 - OBJ
      ?auto_59002 - LOCATION
    )
    :vars
    (
      ?auto_59009 - LOCATION
      ?auto_59006 - CITY
      ?auto_59008 - OBJ
      ?auto_59007 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59009 ?auto_59006 ) ( IN-CITY ?auto_59002 ?auto_59006 ) ( not ( = ?auto_59002 ?auto_59009 ) ) ( OBJ-AT ?auto_59008 ?auto_59002 ) ( not ( = ?auto_59008 ?auto_59004 ) ) ( OBJ-AT ?auto_59004 ?auto_59009 ) ( TRUCK-AT ?auto_59007 ?auto_59002 ) ( OBJ-AT ?auto_59003 ?auto_59002 ) ( OBJ-AT ?auto_59005 ?auto_59002 ) ( not ( = ?auto_59003 ?auto_59004 ) ) ( not ( = ?auto_59003 ?auto_59005 ) ) ( not ( = ?auto_59003 ?auto_59008 ) ) ( not ( = ?auto_59004 ?auto_59005 ) ) ( not ( = ?auto_59005 ?auto_59008 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59008 ?auto_59004 ?auto_59002 )
      ( DELIVER-3PKG-VERIFY ?auto_59003 ?auto_59004 ?auto_59005 ?auto_59002 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59019 - OBJ
      ?auto_59020 - OBJ
      ?auto_59021 - OBJ
      ?auto_59018 - LOCATION
    )
    :vars
    (
      ?auto_59024 - LOCATION
      ?auto_59022 - CITY
      ?auto_59023 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59024 ?auto_59022 ) ( IN-CITY ?auto_59018 ?auto_59022 ) ( not ( = ?auto_59018 ?auto_59024 ) ) ( OBJ-AT ?auto_59020 ?auto_59018 ) ( not ( = ?auto_59020 ?auto_59019 ) ) ( OBJ-AT ?auto_59019 ?auto_59024 ) ( TRUCK-AT ?auto_59023 ?auto_59018 ) ( OBJ-AT ?auto_59021 ?auto_59018 ) ( not ( = ?auto_59019 ?auto_59021 ) ) ( not ( = ?auto_59020 ?auto_59021 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59020 ?auto_59019 ?auto_59018 )
      ( DELIVER-3PKG-VERIFY ?auto_59019 ?auto_59020 ?auto_59021 ?auto_59018 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59041 - OBJ
      ?auto_59042 - OBJ
      ?auto_59043 - OBJ
      ?auto_59040 - LOCATION
    )
    :vars
    (
      ?auto_59047 - LOCATION
      ?auto_59044 - CITY
      ?auto_59046 - OBJ
      ?auto_59045 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59047 ?auto_59044 ) ( IN-CITY ?auto_59040 ?auto_59044 ) ( not ( = ?auto_59040 ?auto_59047 ) ) ( OBJ-AT ?auto_59046 ?auto_59040 ) ( not ( = ?auto_59046 ?auto_59041 ) ) ( OBJ-AT ?auto_59041 ?auto_59047 ) ( TRUCK-AT ?auto_59045 ?auto_59040 ) ( OBJ-AT ?auto_59042 ?auto_59040 ) ( OBJ-AT ?auto_59043 ?auto_59040 ) ( not ( = ?auto_59041 ?auto_59042 ) ) ( not ( = ?auto_59041 ?auto_59043 ) ) ( not ( = ?auto_59042 ?auto_59043 ) ) ( not ( = ?auto_59042 ?auto_59046 ) ) ( not ( = ?auto_59043 ?auto_59046 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59046 ?auto_59041 ?auto_59040 )
      ( DELIVER-3PKG-VERIFY ?auto_59041 ?auto_59042 ?auto_59043 ?auto_59040 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59080 - OBJ
      ?auto_59081 - OBJ
      ?auto_59082 - OBJ
      ?auto_59083 - OBJ
      ?auto_59079 - LOCATION
    )
    :vars
    (
      ?auto_59086 - LOCATION
      ?auto_59084 - CITY
      ?auto_59085 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59086 ?auto_59084 ) ( IN-CITY ?auto_59079 ?auto_59084 ) ( not ( = ?auto_59079 ?auto_59086 ) ) ( OBJ-AT ?auto_59080 ?auto_59079 ) ( not ( = ?auto_59080 ?auto_59083 ) ) ( OBJ-AT ?auto_59083 ?auto_59086 ) ( TRUCK-AT ?auto_59085 ?auto_59079 ) ( OBJ-AT ?auto_59081 ?auto_59079 ) ( OBJ-AT ?auto_59082 ?auto_59079 ) ( not ( = ?auto_59080 ?auto_59081 ) ) ( not ( = ?auto_59080 ?auto_59082 ) ) ( not ( = ?auto_59081 ?auto_59082 ) ) ( not ( = ?auto_59081 ?auto_59083 ) ) ( not ( = ?auto_59082 ?auto_59083 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59080 ?auto_59083 ?auto_59079 )
      ( DELIVER-4PKG-VERIFY ?auto_59080 ?auto_59081 ?auto_59082 ?auto_59083 ?auto_59079 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59168 - OBJ
      ?auto_59169 - OBJ
      ?auto_59170 - OBJ
      ?auto_59171 - OBJ
      ?auto_59167 - LOCATION
    )
    :vars
    (
      ?auto_59174 - LOCATION
      ?auto_59172 - CITY
      ?auto_59173 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59174 ?auto_59172 ) ( IN-CITY ?auto_59167 ?auto_59172 ) ( not ( = ?auto_59167 ?auto_59174 ) ) ( OBJ-AT ?auto_59168 ?auto_59167 ) ( not ( = ?auto_59168 ?auto_59169 ) ) ( OBJ-AT ?auto_59169 ?auto_59174 ) ( TRUCK-AT ?auto_59173 ?auto_59167 ) ( OBJ-AT ?auto_59170 ?auto_59167 ) ( OBJ-AT ?auto_59171 ?auto_59167 ) ( not ( = ?auto_59168 ?auto_59170 ) ) ( not ( = ?auto_59168 ?auto_59171 ) ) ( not ( = ?auto_59169 ?auto_59170 ) ) ( not ( = ?auto_59169 ?auto_59171 ) ) ( not ( = ?auto_59170 ?auto_59171 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59168 ?auto_59169 ?auto_59167 )
      ( DELIVER-4PKG-VERIFY ?auto_59168 ?auto_59169 ?auto_59170 ?auto_59171 ?auto_59167 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59240 - OBJ
      ?auto_59241 - OBJ
      ?auto_59242 - OBJ
      ?auto_59243 - OBJ
      ?auto_59239 - LOCATION
    )
    :vars
    (
      ?auto_59246 - LOCATION
      ?auto_59244 - CITY
      ?auto_59245 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59246 ?auto_59244 ) ( IN-CITY ?auto_59239 ?auto_59244 ) ( not ( = ?auto_59239 ?auto_59246 ) ) ( OBJ-AT ?auto_59241 ?auto_59239 ) ( not ( = ?auto_59241 ?auto_59243 ) ) ( OBJ-AT ?auto_59243 ?auto_59246 ) ( TRUCK-AT ?auto_59245 ?auto_59239 ) ( OBJ-AT ?auto_59240 ?auto_59239 ) ( OBJ-AT ?auto_59242 ?auto_59239 ) ( not ( = ?auto_59240 ?auto_59241 ) ) ( not ( = ?auto_59240 ?auto_59242 ) ) ( not ( = ?auto_59240 ?auto_59243 ) ) ( not ( = ?auto_59241 ?auto_59242 ) ) ( not ( = ?auto_59242 ?auto_59243 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59241 ?auto_59243 ?auto_59239 )
      ( DELIVER-4PKG-VERIFY ?auto_59240 ?auto_59241 ?auto_59242 ?auto_59243 ?auto_59239 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59248 - OBJ
      ?auto_59249 - OBJ
      ?auto_59250 - OBJ
      ?auto_59251 - OBJ
      ?auto_59247 - LOCATION
    )
    :vars
    (
      ?auto_59254 - LOCATION
      ?auto_59252 - CITY
      ?auto_59253 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59254 ?auto_59252 ) ( IN-CITY ?auto_59247 ?auto_59252 ) ( not ( = ?auto_59247 ?auto_59254 ) ) ( OBJ-AT ?auto_59251 ?auto_59247 ) ( not ( = ?auto_59251 ?auto_59250 ) ) ( OBJ-AT ?auto_59250 ?auto_59254 ) ( TRUCK-AT ?auto_59253 ?auto_59247 ) ( OBJ-AT ?auto_59248 ?auto_59247 ) ( OBJ-AT ?auto_59249 ?auto_59247 ) ( not ( = ?auto_59248 ?auto_59249 ) ) ( not ( = ?auto_59248 ?auto_59250 ) ) ( not ( = ?auto_59248 ?auto_59251 ) ) ( not ( = ?auto_59249 ?auto_59250 ) ) ( not ( = ?auto_59249 ?auto_59251 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59251 ?auto_59250 ?auto_59247 )
      ( DELIVER-4PKG-VERIFY ?auto_59248 ?auto_59249 ?auto_59250 ?auto_59251 ?auto_59247 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59256 - OBJ
      ?auto_59257 - OBJ
      ?auto_59258 - OBJ
      ?auto_59259 - OBJ
      ?auto_59255 - LOCATION
    )
    :vars
    (
      ?auto_59262 - LOCATION
      ?auto_59260 - CITY
      ?auto_59261 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59262 ?auto_59260 ) ( IN-CITY ?auto_59255 ?auto_59260 ) ( not ( = ?auto_59255 ?auto_59262 ) ) ( OBJ-AT ?auto_59257 ?auto_59255 ) ( not ( = ?auto_59257 ?auto_59258 ) ) ( OBJ-AT ?auto_59258 ?auto_59262 ) ( TRUCK-AT ?auto_59261 ?auto_59255 ) ( OBJ-AT ?auto_59256 ?auto_59255 ) ( OBJ-AT ?auto_59259 ?auto_59255 ) ( not ( = ?auto_59256 ?auto_59257 ) ) ( not ( = ?auto_59256 ?auto_59258 ) ) ( not ( = ?auto_59256 ?auto_59259 ) ) ( not ( = ?auto_59257 ?auto_59259 ) ) ( not ( = ?auto_59258 ?auto_59259 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59257 ?auto_59258 ?auto_59255 )
      ( DELIVER-4PKG-VERIFY ?auto_59256 ?auto_59257 ?auto_59258 ?auto_59259 ?auto_59255 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59280 - OBJ
      ?auto_59281 - OBJ
      ?auto_59282 - OBJ
      ?auto_59283 - OBJ
      ?auto_59279 - LOCATION
    )
    :vars
    (
      ?auto_59287 - LOCATION
      ?auto_59284 - CITY
      ?auto_59286 - OBJ
      ?auto_59285 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59287 ?auto_59284 ) ( IN-CITY ?auto_59279 ?auto_59284 ) ( not ( = ?auto_59279 ?auto_59287 ) ) ( OBJ-AT ?auto_59286 ?auto_59279 ) ( not ( = ?auto_59286 ?auto_59283 ) ) ( OBJ-AT ?auto_59283 ?auto_59287 ) ( TRUCK-AT ?auto_59285 ?auto_59279 ) ( OBJ-AT ?auto_59280 ?auto_59279 ) ( OBJ-AT ?auto_59281 ?auto_59279 ) ( OBJ-AT ?auto_59282 ?auto_59279 ) ( not ( = ?auto_59280 ?auto_59281 ) ) ( not ( = ?auto_59280 ?auto_59282 ) ) ( not ( = ?auto_59280 ?auto_59283 ) ) ( not ( = ?auto_59280 ?auto_59286 ) ) ( not ( = ?auto_59281 ?auto_59282 ) ) ( not ( = ?auto_59281 ?auto_59283 ) ) ( not ( = ?auto_59281 ?auto_59286 ) ) ( not ( = ?auto_59282 ?auto_59283 ) ) ( not ( = ?auto_59282 ?auto_59286 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59286 ?auto_59283 ?auto_59279 )
      ( DELIVER-4PKG-VERIFY ?auto_59280 ?auto_59281 ?auto_59282 ?auto_59283 ?auto_59279 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59297 - OBJ
      ?auto_59298 - OBJ
      ?auto_59299 - OBJ
      ?auto_59300 - OBJ
      ?auto_59296 - LOCATION
    )
    :vars
    (
      ?auto_59304 - LOCATION
      ?auto_59301 - CITY
      ?auto_59303 - OBJ
      ?auto_59302 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59304 ?auto_59301 ) ( IN-CITY ?auto_59296 ?auto_59301 ) ( not ( = ?auto_59296 ?auto_59304 ) ) ( OBJ-AT ?auto_59303 ?auto_59296 ) ( not ( = ?auto_59303 ?auto_59299 ) ) ( OBJ-AT ?auto_59299 ?auto_59304 ) ( TRUCK-AT ?auto_59302 ?auto_59296 ) ( OBJ-AT ?auto_59297 ?auto_59296 ) ( OBJ-AT ?auto_59298 ?auto_59296 ) ( OBJ-AT ?auto_59300 ?auto_59296 ) ( not ( = ?auto_59297 ?auto_59298 ) ) ( not ( = ?auto_59297 ?auto_59299 ) ) ( not ( = ?auto_59297 ?auto_59300 ) ) ( not ( = ?auto_59297 ?auto_59303 ) ) ( not ( = ?auto_59298 ?auto_59299 ) ) ( not ( = ?auto_59298 ?auto_59300 ) ) ( not ( = ?auto_59298 ?auto_59303 ) ) ( not ( = ?auto_59299 ?auto_59300 ) ) ( not ( = ?auto_59300 ?auto_59303 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59303 ?auto_59299 ?auto_59296 )
      ( DELIVER-4PKG-VERIFY ?auto_59297 ?auto_59298 ?auto_59299 ?auto_59300 ?auto_59296 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59339 - OBJ
      ?auto_59340 - OBJ
      ?auto_59341 - OBJ
      ?auto_59342 - OBJ
      ?auto_59338 - LOCATION
    )
    :vars
    (
      ?auto_59345 - LOCATION
      ?auto_59343 - CITY
      ?auto_59344 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59345 ?auto_59343 ) ( IN-CITY ?auto_59338 ?auto_59343 ) ( not ( = ?auto_59338 ?auto_59345 ) ) ( OBJ-AT ?auto_59342 ?auto_59338 ) ( not ( = ?auto_59342 ?auto_59340 ) ) ( OBJ-AT ?auto_59340 ?auto_59345 ) ( TRUCK-AT ?auto_59344 ?auto_59338 ) ( OBJ-AT ?auto_59339 ?auto_59338 ) ( OBJ-AT ?auto_59341 ?auto_59338 ) ( not ( = ?auto_59339 ?auto_59340 ) ) ( not ( = ?auto_59339 ?auto_59341 ) ) ( not ( = ?auto_59339 ?auto_59342 ) ) ( not ( = ?auto_59340 ?auto_59341 ) ) ( not ( = ?auto_59341 ?auto_59342 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59342 ?auto_59340 ?auto_59338 )
      ( DELIVER-4PKG-VERIFY ?auto_59339 ?auto_59340 ?auto_59341 ?auto_59342 ?auto_59338 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59347 - OBJ
      ?auto_59348 - OBJ
      ?auto_59349 - OBJ
      ?auto_59350 - OBJ
      ?auto_59346 - LOCATION
    )
    :vars
    (
      ?auto_59354 - LOCATION
      ?auto_59351 - CITY
      ?auto_59353 - OBJ
      ?auto_59352 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59354 ?auto_59351 ) ( IN-CITY ?auto_59346 ?auto_59351 ) ( not ( = ?auto_59346 ?auto_59354 ) ) ( OBJ-AT ?auto_59353 ?auto_59346 ) ( not ( = ?auto_59353 ?auto_59348 ) ) ( OBJ-AT ?auto_59348 ?auto_59354 ) ( TRUCK-AT ?auto_59352 ?auto_59346 ) ( OBJ-AT ?auto_59347 ?auto_59346 ) ( OBJ-AT ?auto_59349 ?auto_59346 ) ( OBJ-AT ?auto_59350 ?auto_59346 ) ( not ( = ?auto_59347 ?auto_59348 ) ) ( not ( = ?auto_59347 ?auto_59349 ) ) ( not ( = ?auto_59347 ?auto_59350 ) ) ( not ( = ?auto_59347 ?auto_59353 ) ) ( not ( = ?auto_59348 ?auto_59349 ) ) ( not ( = ?auto_59348 ?auto_59350 ) ) ( not ( = ?auto_59349 ?auto_59350 ) ) ( not ( = ?auto_59349 ?auto_59353 ) ) ( not ( = ?auto_59350 ?auto_59353 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59353 ?auto_59348 ?auto_59346 )
      ( DELIVER-4PKG-VERIFY ?auto_59347 ?auto_59348 ?auto_59349 ?auto_59350 ?auto_59346 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59391 - OBJ
      ?auto_59392 - OBJ
      ?auto_59393 - OBJ
      ?auto_59394 - OBJ
      ?auto_59390 - LOCATION
    )
    :vars
    (
      ?auto_59397 - LOCATION
      ?auto_59395 - CITY
      ?auto_59396 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59397 ?auto_59395 ) ( IN-CITY ?auto_59390 ?auto_59395 ) ( not ( = ?auto_59390 ?auto_59397 ) ) ( OBJ-AT ?auto_59393 ?auto_59390 ) ( not ( = ?auto_59393 ?auto_59391 ) ) ( OBJ-AT ?auto_59391 ?auto_59397 ) ( TRUCK-AT ?auto_59396 ?auto_59390 ) ( OBJ-AT ?auto_59392 ?auto_59390 ) ( OBJ-AT ?auto_59394 ?auto_59390 ) ( not ( = ?auto_59391 ?auto_59392 ) ) ( not ( = ?auto_59391 ?auto_59394 ) ) ( not ( = ?auto_59392 ?auto_59393 ) ) ( not ( = ?auto_59392 ?auto_59394 ) ) ( not ( = ?auto_59393 ?auto_59394 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59393 ?auto_59391 ?auto_59390 )
      ( DELIVER-4PKG-VERIFY ?auto_59391 ?auto_59392 ?auto_59393 ?auto_59394 ?auto_59390 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59415 - OBJ
      ?auto_59416 - OBJ
      ?auto_59417 - OBJ
      ?auto_59418 - OBJ
      ?auto_59414 - LOCATION
    )
    :vars
    (
      ?auto_59421 - LOCATION
      ?auto_59419 - CITY
      ?auto_59420 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59421 ?auto_59419 ) ( IN-CITY ?auto_59414 ?auto_59419 ) ( not ( = ?auto_59414 ?auto_59421 ) ) ( OBJ-AT ?auto_59418 ?auto_59414 ) ( not ( = ?auto_59418 ?auto_59415 ) ) ( OBJ-AT ?auto_59415 ?auto_59421 ) ( TRUCK-AT ?auto_59420 ?auto_59414 ) ( OBJ-AT ?auto_59416 ?auto_59414 ) ( OBJ-AT ?auto_59417 ?auto_59414 ) ( not ( = ?auto_59415 ?auto_59416 ) ) ( not ( = ?auto_59415 ?auto_59417 ) ) ( not ( = ?auto_59416 ?auto_59417 ) ) ( not ( = ?auto_59416 ?auto_59418 ) ) ( not ( = ?auto_59417 ?auto_59418 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59418 ?auto_59415 ?auto_59414 )
      ( DELIVER-4PKG-VERIFY ?auto_59415 ?auto_59416 ?auto_59417 ?auto_59418 ?auto_59414 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59495 - OBJ
      ?auto_59496 - OBJ
      ?auto_59497 - OBJ
      ?auto_59498 - OBJ
      ?auto_59494 - LOCATION
    )
    :vars
    (
      ?auto_59502 - LOCATION
      ?auto_59499 - CITY
      ?auto_59501 - OBJ
      ?auto_59500 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59502 ?auto_59499 ) ( IN-CITY ?auto_59494 ?auto_59499 ) ( not ( = ?auto_59494 ?auto_59502 ) ) ( OBJ-AT ?auto_59501 ?auto_59494 ) ( not ( = ?auto_59501 ?auto_59495 ) ) ( OBJ-AT ?auto_59495 ?auto_59502 ) ( TRUCK-AT ?auto_59500 ?auto_59494 ) ( OBJ-AT ?auto_59496 ?auto_59494 ) ( OBJ-AT ?auto_59497 ?auto_59494 ) ( OBJ-AT ?auto_59498 ?auto_59494 ) ( not ( = ?auto_59495 ?auto_59496 ) ) ( not ( = ?auto_59495 ?auto_59497 ) ) ( not ( = ?auto_59495 ?auto_59498 ) ) ( not ( = ?auto_59496 ?auto_59497 ) ) ( not ( = ?auto_59496 ?auto_59498 ) ) ( not ( = ?auto_59496 ?auto_59501 ) ) ( not ( = ?auto_59497 ?auto_59498 ) ) ( not ( = ?auto_59497 ?auto_59501 ) ) ( not ( = ?auto_59498 ?auto_59501 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59501 ?auto_59495 ?auto_59494 )
      ( DELIVER-4PKG-VERIFY ?auto_59495 ?auto_59496 ?auto_59497 ?auto_59498 ?auto_59494 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59644 - OBJ
      ?auto_59645 - OBJ
      ?auto_59646 - OBJ
      ?auto_59643 - LOCATION
    )
    :vars
    (
      ?auto_59648 - LOCATION
      ?auto_59647 - CITY
      ?auto_59649 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59648 ?auto_59647 ) ( IN-CITY ?auto_59643 ?auto_59647 ) ( not ( = ?auto_59643 ?auto_59648 ) ) ( OBJ-AT ?auto_59644 ?auto_59643 ) ( not ( = ?auto_59644 ?auto_59646 ) ) ( OBJ-AT ?auto_59646 ?auto_59648 ) ( TRUCK-AT ?auto_59649 ?auto_59643 ) ( OBJ-AT ?auto_59645 ?auto_59643 ) ( not ( = ?auto_59644 ?auto_59645 ) ) ( not ( = ?auto_59645 ?auto_59646 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59644 ?auto_59646 ?auto_59643 )
      ( DELIVER-3PKG-VERIFY ?auto_59644 ?auto_59645 ?auto_59646 ?auto_59643 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_60319 - OBJ
      ?auto_60318 - LOCATION
    )
    :vars
    (
      ?auto_60321 - LOCATION
      ?auto_60320 - CITY
      ?auto_60322 - OBJ
      ?auto_60323 - TRUCK
      ?auto_60324 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60321 ?auto_60320 ) ( IN-CITY ?auto_60318 ?auto_60320 ) ( not ( = ?auto_60318 ?auto_60321 ) ) ( OBJ-AT ?auto_60322 ?auto_60318 ) ( not ( = ?auto_60322 ?auto_60319 ) ) ( OBJ-AT ?auto_60319 ?auto_60321 ) ( TRUCK-AT ?auto_60323 ?auto_60324 ) ( IN-CITY ?auto_60324 ?auto_60320 ) ( not ( = ?auto_60318 ?auto_60324 ) ) ( not ( = ?auto_60321 ?auto_60324 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_60323 ?auto_60324 ?auto_60318 ?auto_60320 )
      ( DELIVER-2PKG ?auto_60322 ?auto_60319 ?auto_60318 )
      ( DELIVER-1PKG-VERIFY ?auto_60319 ?auto_60318 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_60326 - OBJ
      ?auto_60327 - OBJ
      ?auto_60325 - LOCATION
    )
    :vars
    (
      ?auto_60330 - LOCATION
      ?auto_60331 - CITY
      ?auto_60328 - TRUCK
      ?auto_60329 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60330 ?auto_60331 ) ( IN-CITY ?auto_60325 ?auto_60331 ) ( not ( = ?auto_60325 ?auto_60330 ) ) ( OBJ-AT ?auto_60326 ?auto_60325 ) ( not ( = ?auto_60326 ?auto_60327 ) ) ( OBJ-AT ?auto_60327 ?auto_60330 ) ( TRUCK-AT ?auto_60328 ?auto_60329 ) ( IN-CITY ?auto_60329 ?auto_60331 ) ( not ( = ?auto_60325 ?auto_60329 ) ) ( not ( = ?auto_60330 ?auto_60329 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_60327 ?auto_60325 )
      ( DELIVER-2PKG-VERIFY ?auto_60326 ?auto_60327 ?auto_60325 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_60341 - OBJ
      ?auto_60342 - OBJ
      ?auto_60340 - LOCATION
    )
    :vars
    (
      ?auto_60343 - LOCATION
      ?auto_60346 - CITY
      ?auto_60345 - TRUCK
      ?auto_60344 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60343 ?auto_60346 ) ( IN-CITY ?auto_60340 ?auto_60346 ) ( not ( = ?auto_60340 ?auto_60343 ) ) ( OBJ-AT ?auto_60342 ?auto_60340 ) ( not ( = ?auto_60342 ?auto_60341 ) ) ( OBJ-AT ?auto_60341 ?auto_60343 ) ( TRUCK-AT ?auto_60345 ?auto_60344 ) ( IN-CITY ?auto_60344 ?auto_60346 ) ( not ( = ?auto_60340 ?auto_60344 ) ) ( not ( = ?auto_60343 ?auto_60344 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60342 ?auto_60341 ?auto_60340 )
      ( DELIVER-2PKG-VERIFY ?auto_60341 ?auto_60342 ?auto_60340 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60364 - OBJ
      ?auto_60365 - OBJ
      ?auto_60366 - OBJ
      ?auto_60363 - LOCATION
    )
    :vars
    (
      ?auto_60367 - LOCATION
      ?auto_60370 - CITY
      ?auto_60369 - TRUCK
      ?auto_60368 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60367 ?auto_60370 ) ( IN-CITY ?auto_60363 ?auto_60370 ) ( not ( = ?auto_60363 ?auto_60367 ) ) ( OBJ-AT ?auto_60365 ?auto_60363 ) ( not ( = ?auto_60365 ?auto_60366 ) ) ( OBJ-AT ?auto_60366 ?auto_60367 ) ( TRUCK-AT ?auto_60369 ?auto_60368 ) ( IN-CITY ?auto_60368 ?auto_60370 ) ( not ( = ?auto_60363 ?auto_60368 ) ) ( not ( = ?auto_60367 ?auto_60368 ) ) ( OBJ-AT ?auto_60364 ?auto_60363 ) ( not ( = ?auto_60364 ?auto_60365 ) ) ( not ( = ?auto_60364 ?auto_60366 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60365 ?auto_60366 ?auto_60363 )
      ( DELIVER-3PKG-VERIFY ?auto_60364 ?auto_60365 ?auto_60366 ?auto_60363 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60380 - OBJ
      ?auto_60381 - OBJ
      ?auto_60382 - OBJ
      ?auto_60379 - LOCATION
    )
    :vars
    (
      ?auto_60383 - LOCATION
      ?auto_60386 - CITY
      ?auto_60385 - TRUCK
      ?auto_60384 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60383 ?auto_60386 ) ( IN-CITY ?auto_60379 ?auto_60386 ) ( not ( = ?auto_60379 ?auto_60383 ) ) ( OBJ-AT ?auto_60382 ?auto_60379 ) ( not ( = ?auto_60382 ?auto_60381 ) ) ( OBJ-AT ?auto_60381 ?auto_60383 ) ( TRUCK-AT ?auto_60385 ?auto_60384 ) ( IN-CITY ?auto_60384 ?auto_60386 ) ( not ( = ?auto_60379 ?auto_60384 ) ) ( not ( = ?auto_60383 ?auto_60384 ) ) ( OBJ-AT ?auto_60380 ?auto_60379 ) ( not ( = ?auto_60380 ?auto_60381 ) ) ( not ( = ?auto_60380 ?auto_60382 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60382 ?auto_60381 ?auto_60379 )
      ( DELIVER-3PKG-VERIFY ?auto_60380 ?auto_60381 ?auto_60382 ?auto_60379 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60447 - OBJ
      ?auto_60448 - OBJ
      ?auto_60449 - OBJ
      ?auto_60446 - LOCATION
    )
    :vars
    (
      ?auto_60450 - LOCATION
      ?auto_60453 - CITY
      ?auto_60452 - TRUCK
      ?auto_60451 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60450 ?auto_60453 ) ( IN-CITY ?auto_60446 ?auto_60453 ) ( not ( = ?auto_60446 ?auto_60450 ) ) ( OBJ-AT ?auto_60449 ?auto_60446 ) ( not ( = ?auto_60449 ?auto_60447 ) ) ( OBJ-AT ?auto_60447 ?auto_60450 ) ( TRUCK-AT ?auto_60452 ?auto_60451 ) ( IN-CITY ?auto_60451 ?auto_60453 ) ( not ( = ?auto_60446 ?auto_60451 ) ) ( not ( = ?auto_60450 ?auto_60451 ) ) ( OBJ-AT ?auto_60448 ?auto_60446 ) ( not ( = ?auto_60447 ?auto_60448 ) ) ( not ( = ?auto_60448 ?auto_60449 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60449 ?auto_60447 ?auto_60446 )
      ( DELIVER-3PKG-VERIFY ?auto_60447 ?auto_60448 ?auto_60449 ?auto_60446 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60523 - OBJ
      ?auto_60524 - OBJ
      ?auto_60525 - OBJ
      ?auto_60526 - OBJ
      ?auto_60522 - LOCATION
    )
    :vars
    (
      ?auto_60527 - LOCATION
      ?auto_60530 - CITY
      ?auto_60529 - TRUCK
      ?auto_60528 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60527 ?auto_60530 ) ( IN-CITY ?auto_60522 ?auto_60530 ) ( not ( = ?auto_60522 ?auto_60527 ) ) ( OBJ-AT ?auto_60523 ?auto_60522 ) ( not ( = ?auto_60523 ?auto_60526 ) ) ( OBJ-AT ?auto_60526 ?auto_60527 ) ( TRUCK-AT ?auto_60529 ?auto_60528 ) ( IN-CITY ?auto_60528 ?auto_60530 ) ( not ( = ?auto_60522 ?auto_60528 ) ) ( not ( = ?auto_60527 ?auto_60528 ) ) ( OBJ-AT ?auto_60524 ?auto_60522 ) ( OBJ-AT ?auto_60525 ?auto_60522 ) ( not ( = ?auto_60523 ?auto_60524 ) ) ( not ( = ?auto_60523 ?auto_60525 ) ) ( not ( = ?auto_60524 ?auto_60525 ) ) ( not ( = ?auto_60524 ?auto_60526 ) ) ( not ( = ?auto_60525 ?auto_60526 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60523 ?auto_60526 ?auto_60522 )
      ( DELIVER-4PKG-VERIFY ?auto_60523 ?auto_60524 ?auto_60525 ?auto_60526 ?auto_60522 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60541 - OBJ
      ?auto_60542 - OBJ
      ?auto_60543 - OBJ
      ?auto_60544 - OBJ
      ?auto_60540 - LOCATION
    )
    :vars
    (
      ?auto_60545 - LOCATION
      ?auto_60548 - CITY
      ?auto_60547 - TRUCK
      ?auto_60546 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60545 ?auto_60548 ) ( IN-CITY ?auto_60540 ?auto_60548 ) ( not ( = ?auto_60540 ?auto_60545 ) ) ( OBJ-AT ?auto_60541 ?auto_60540 ) ( not ( = ?auto_60541 ?auto_60543 ) ) ( OBJ-AT ?auto_60543 ?auto_60545 ) ( TRUCK-AT ?auto_60547 ?auto_60546 ) ( IN-CITY ?auto_60546 ?auto_60548 ) ( not ( = ?auto_60540 ?auto_60546 ) ) ( not ( = ?auto_60545 ?auto_60546 ) ) ( OBJ-AT ?auto_60542 ?auto_60540 ) ( OBJ-AT ?auto_60544 ?auto_60540 ) ( not ( = ?auto_60541 ?auto_60542 ) ) ( not ( = ?auto_60541 ?auto_60544 ) ) ( not ( = ?auto_60542 ?auto_60543 ) ) ( not ( = ?auto_60542 ?auto_60544 ) ) ( not ( = ?auto_60543 ?auto_60544 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60541 ?auto_60543 ?auto_60540 )
      ( DELIVER-4PKG-VERIFY ?auto_60541 ?auto_60542 ?auto_60543 ?auto_60544 ?auto_60540 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60613 - OBJ
      ?auto_60614 - OBJ
      ?auto_60615 - OBJ
      ?auto_60616 - OBJ
      ?auto_60612 - LOCATION
    )
    :vars
    (
      ?auto_60617 - LOCATION
      ?auto_60620 - CITY
      ?auto_60619 - TRUCK
      ?auto_60618 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60617 ?auto_60620 ) ( IN-CITY ?auto_60612 ?auto_60620 ) ( not ( = ?auto_60612 ?auto_60617 ) ) ( OBJ-AT ?auto_60613 ?auto_60612 ) ( not ( = ?auto_60613 ?auto_60614 ) ) ( OBJ-AT ?auto_60614 ?auto_60617 ) ( TRUCK-AT ?auto_60619 ?auto_60618 ) ( IN-CITY ?auto_60618 ?auto_60620 ) ( not ( = ?auto_60612 ?auto_60618 ) ) ( not ( = ?auto_60617 ?auto_60618 ) ) ( OBJ-AT ?auto_60615 ?auto_60612 ) ( OBJ-AT ?auto_60616 ?auto_60612 ) ( not ( = ?auto_60613 ?auto_60615 ) ) ( not ( = ?auto_60613 ?auto_60616 ) ) ( not ( = ?auto_60614 ?auto_60615 ) ) ( not ( = ?auto_60614 ?auto_60616 ) ) ( not ( = ?auto_60615 ?auto_60616 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60613 ?auto_60614 ?auto_60612 )
      ( DELIVER-4PKG-VERIFY ?auto_60613 ?auto_60614 ?auto_60615 ?auto_60616 ?auto_60612 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60872 - OBJ
      ?auto_60873 - OBJ
      ?auto_60874 - OBJ
      ?auto_60875 - OBJ
      ?auto_60871 - LOCATION
    )
    :vars
    (
      ?auto_60876 - LOCATION
      ?auto_60879 - CITY
      ?auto_60878 - TRUCK
      ?auto_60877 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60876 ?auto_60879 ) ( IN-CITY ?auto_60871 ?auto_60879 ) ( not ( = ?auto_60871 ?auto_60876 ) ) ( OBJ-AT ?auto_60874 ?auto_60871 ) ( not ( = ?auto_60874 ?auto_60872 ) ) ( OBJ-AT ?auto_60872 ?auto_60876 ) ( TRUCK-AT ?auto_60878 ?auto_60877 ) ( IN-CITY ?auto_60877 ?auto_60879 ) ( not ( = ?auto_60871 ?auto_60877 ) ) ( not ( = ?auto_60876 ?auto_60877 ) ) ( OBJ-AT ?auto_60873 ?auto_60871 ) ( OBJ-AT ?auto_60875 ?auto_60871 ) ( not ( = ?auto_60872 ?auto_60873 ) ) ( not ( = ?auto_60872 ?auto_60875 ) ) ( not ( = ?auto_60873 ?auto_60874 ) ) ( not ( = ?auto_60873 ?auto_60875 ) ) ( not ( = ?auto_60874 ?auto_60875 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60874 ?auto_60872 ?auto_60871 )
      ( DELIVER-4PKG-VERIFY ?auto_60872 ?auto_60873 ?auto_60874 ?auto_60875 ?auto_60871 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_61155 - OBJ
      ?auto_61156 - OBJ
      ?auto_61157 - OBJ
      ?auto_61154 - LOCATION
    )
    :vars
    (
      ?auto_61160 - LOCATION
      ?auto_61161 - CITY
      ?auto_61158 - TRUCK
      ?auto_61159 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61160 ?auto_61161 ) ( IN-CITY ?auto_61154 ?auto_61161 ) ( not ( = ?auto_61154 ?auto_61160 ) ) ( OBJ-AT ?auto_61155 ?auto_61154 ) ( not ( = ?auto_61155 ?auto_61157 ) ) ( OBJ-AT ?auto_61157 ?auto_61160 ) ( TRUCK-AT ?auto_61158 ?auto_61159 ) ( IN-CITY ?auto_61159 ?auto_61161 ) ( not ( = ?auto_61154 ?auto_61159 ) ) ( not ( = ?auto_61160 ?auto_61159 ) ) ( OBJ-AT ?auto_61156 ?auto_61154 ) ( not ( = ?auto_61155 ?auto_61156 ) ) ( not ( = ?auto_61156 ?auto_61157 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61155 ?auto_61157 ?auto_61154 )
      ( DELIVER-3PKG-VERIFY ?auto_61155 ?auto_61156 ?auto_61157 ?auto_61154 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_61238 - OBJ
      ?auto_61239 - OBJ
      ?auto_61240 - OBJ
      ?auto_61237 - LOCATION
    )
    :vars
    (
      ?auto_61243 - LOCATION
      ?auto_61244 - CITY
      ?auto_61241 - TRUCK
      ?auto_61242 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61243 ?auto_61244 ) ( IN-CITY ?auto_61237 ?auto_61244 ) ( not ( = ?auto_61237 ?auto_61243 ) ) ( OBJ-AT ?auto_61239 ?auto_61237 ) ( not ( = ?auto_61239 ?auto_61238 ) ) ( OBJ-AT ?auto_61238 ?auto_61243 ) ( TRUCK-AT ?auto_61241 ?auto_61242 ) ( IN-CITY ?auto_61242 ?auto_61244 ) ( not ( = ?auto_61237 ?auto_61242 ) ) ( not ( = ?auto_61243 ?auto_61242 ) ) ( OBJ-AT ?auto_61240 ?auto_61237 ) ( not ( = ?auto_61238 ?auto_61240 ) ) ( not ( = ?auto_61239 ?auto_61240 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61239 ?auto_61238 ?auto_61237 )
      ( DELIVER-3PKG-VERIFY ?auto_61238 ?auto_61239 ?auto_61240 ?auto_61237 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_61957 - OBJ
      ?auto_61958 - OBJ
      ?auto_61959 - OBJ
      ?auto_61956 - LOCATION
    )
    :vars
    (
      ?auto_61961 - LOCATION
      ?auto_61960 - CITY
      ?auto_61962 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61961 ?auto_61960 ) ( IN-CITY ?auto_61956 ?auto_61960 ) ( not ( = ?auto_61956 ?auto_61961 ) ) ( OBJ-AT ?auto_61959 ?auto_61956 ) ( not ( = ?auto_61959 ?auto_61958 ) ) ( OBJ-AT ?auto_61958 ?auto_61961 ) ( TRUCK-AT ?auto_61962 ?auto_61956 ) ( OBJ-AT ?auto_61957 ?auto_61956 ) ( not ( = ?auto_61957 ?auto_61958 ) ) ( not ( = ?auto_61957 ?auto_61959 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61959 ?auto_61958 ?auto_61956 )
      ( DELIVER-3PKG-VERIFY ?auto_61957 ?auto_61958 ?auto_61959 ?auto_61956 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_69539 - OBJ
      ?auto_69540 - OBJ
      ?auto_69541 - OBJ
      ?auto_69538 - LOCATION
    )
    :vars
    (
      ?auto_69544 - TRUCK
      ?auto_69543 - LOCATION
      ?auto_69542 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_69544 ?auto_69543 ) ( IN-CITY ?auto_69543 ?auto_69542 ) ( IN-CITY ?auto_69538 ?auto_69542 ) ( not ( = ?auto_69538 ?auto_69543 ) ) ( OBJ-AT ?auto_69539 ?auto_69538 ) ( not ( = ?auto_69539 ?auto_69541 ) ) ( OBJ-AT ?auto_69541 ?auto_69543 ) ( OBJ-AT ?auto_69540 ?auto_69538 ) ( not ( = ?auto_69539 ?auto_69540 ) ) ( not ( = ?auto_69540 ?auto_69541 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_69539 ?auto_69541 ?auto_69538 )
      ( DELIVER-3PKG-VERIFY ?auto_69539 ?auto_69540 ?auto_69541 ?auto_69538 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_74629 - OBJ
      ?auto_74630 - OBJ
      ?auto_74631 - OBJ
      ?auto_74628 - LOCATION
    )
    :vars
    (
      ?auto_74633 - LOCATION
      ?auto_74632 - CITY
      ?auto_74634 - TRUCK
      ?auto_74635 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_74633 ?auto_74632 ) ( IN-CITY ?auto_74628 ?auto_74632 ) ( not ( = ?auto_74628 ?auto_74633 ) ) ( OBJ-AT ?auto_74629 ?auto_74628 ) ( not ( = ?auto_74629 ?auto_74630 ) ) ( OBJ-AT ?auto_74630 ?auto_74633 ) ( TRUCK-AT ?auto_74634 ?auto_74635 ) ( IN-CITY ?auto_74635 ?auto_74632 ) ( not ( = ?auto_74628 ?auto_74635 ) ) ( not ( = ?auto_74633 ?auto_74635 ) ) ( OBJ-AT ?auto_74631 ?auto_74628 ) ( not ( = ?auto_74629 ?auto_74631 ) ) ( not ( = ?auto_74630 ?auto_74631 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_74629 ?auto_74630 ?auto_74628 )
      ( DELIVER-3PKG-VERIFY ?auto_74629 ?auto_74630 ?auto_74631 ?auto_74628 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_74661 - OBJ
      ?auto_74662 - OBJ
      ?auto_74663 - OBJ
      ?auto_74660 - LOCATION
    )
    :vars
    (
      ?auto_74666 - LOCATION
      ?auto_74664 - CITY
      ?auto_74665 - OBJ
      ?auto_74667 - TRUCK
      ?auto_74668 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_74666 ?auto_74664 ) ( IN-CITY ?auto_74660 ?auto_74664 ) ( not ( = ?auto_74660 ?auto_74666 ) ) ( OBJ-AT ?auto_74665 ?auto_74660 ) ( not ( = ?auto_74665 ?auto_74663 ) ) ( OBJ-AT ?auto_74663 ?auto_74666 ) ( TRUCK-AT ?auto_74667 ?auto_74668 ) ( IN-CITY ?auto_74668 ?auto_74664 ) ( not ( = ?auto_74660 ?auto_74668 ) ) ( not ( = ?auto_74666 ?auto_74668 ) ) ( OBJ-AT ?auto_74661 ?auto_74660 ) ( OBJ-AT ?auto_74662 ?auto_74660 ) ( not ( = ?auto_74661 ?auto_74662 ) ) ( not ( = ?auto_74661 ?auto_74663 ) ) ( not ( = ?auto_74661 ?auto_74665 ) ) ( not ( = ?auto_74662 ?auto_74663 ) ) ( not ( = ?auto_74662 ?auto_74665 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_74665 ?auto_74663 ?auto_74660 )
      ( DELIVER-3PKG-VERIFY ?auto_74661 ?auto_74662 ?auto_74663 ?auto_74660 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_74683 - OBJ
      ?auto_74684 - OBJ
      ?auto_74685 - OBJ
      ?auto_74682 - LOCATION
    )
    :vars
    (
      ?auto_74688 - LOCATION
      ?auto_74686 - CITY
      ?auto_74687 - OBJ
      ?auto_74689 - TRUCK
      ?auto_74690 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_74688 ?auto_74686 ) ( IN-CITY ?auto_74682 ?auto_74686 ) ( not ( = ?auto_74682 ?auto_74688 ) ) ( OBJ-AT ?auto_74687 ?auto_74682 ) ( not ( = ?auto_74687 ?auto_74684 ) ) ( OBJ-AT ?auto_74684 ?auto_74688 ) ( TRUCK-AT ?auto_74689 ?auto_74690 ) ( IN-CITY ?auto_74690 ?auto_74686 ) ( not ( = ?auto_74682 ?auto_74690 ) ) ( not ( = ?auto_74688 ?auto_74690 ) ) ( OBJ-AT ?auto_74683 ?auto_74682 ) ( OBJ-AT ?auto_74685 ?auto_74682 ) ( not ( = ?auto_74683 ?auto_74684 ) ) ( not ( = ?auto_74683 ?auto_74685 ) ) ( not ( = ?auto_74683 ?auto_74687 ) ) ( not ( = ?auto_74684 ?auto_74685 ) ) ( not ( = ?auto_74685 ?auto_74687 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_74687 ?auto_74684 ?auto_74682 )
      ( DELIVER-3PKG-VERIFY ?auto_74683 ?auto_74684 ?auto_74685 ?auto_74682 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_74803 - OBJ
      ?auto_74804 - OBJ
      ?auto_74805 - OBJ
      ?auto_74802 - LOCATION
    )
    :vars
    (
      ?auto_74808 - LOCATION
      ?auto_74806 - CITY
      ?auto_74807 - OBJ
      ?auto_74809 - TRUCK
      ?auto_74810 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_74808 ?auto_74806 ) ( IN-CITY ?auto_74802 ?auto_74806 ) ( not ( = ?auto_74802 ?auto_74808 ) ) ( OBJ-AT ?auto_74807 ?auto_74802 ) ( not ( = ?auto_74807 ?auto_74803 ) ) ( OBJ-AT ?auto_74803 ?auto_74808 ) ( TRUCK-AT ?auto_74809 ?auto_74810 ) ( IN-CITY ?auto_74810 ?auto_74806 ) ( not ( = ?auto_74802 ?auto_74810 ) ) ( not ( = ?auto_74808 ?auto_74810 ) ) ( OBJ-AT ?auto_74804 ?auto_74802 ) ( OBJ-AT ?auto_74805 ?auto_74802 ) ( not ( = ?auto_74803 ?auto_74804 ) ) ( not ( = ?auto_74803 ?auto_74805 ) ) ( not ( = ?auto_74804 ?auto_74805 ) ) ( not ( = ?auto_74804 ?auto_74807 ) ) ( not ( = ?auto_74805 ?auto_74807 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_74807 ?auto_74803 ?auto_74802 )
      ( DELIVER-3PKG-VERIFY ?auto_74803 ?auto_74804 ?auto_74805 ?auto_74802 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74909 - OBJ
      ?auto_74910 - OBJ
      ?auto_74911 - OBJ
      ?auto_74912 - OBJ
      ?auto_74908 - LOCATION
    )
    :vars
    (
      ?auto_74914 - LOCATION
      ?auto_74913 - CITY
      ?auto_74915 - TRUCK
      ?auto_74916 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_74914 ?auto_74913 ) ( IN-CITY ?auto_74908 ?auto_74913 ) ( not ( = ?auto_74908 ?auto_74914 ) ) ( OBJ-AT ?auto_74910 ?auto_74908 ) ( not ( = ?auto_74910 ?auto_74912 ) ) ( OBJ-AT ?auto_74912 ?auto_74914 ) ( TRUCK-AT ?auto_74915 ?auto_74916 ) ( IN-CITY ?auto_74916 ?auto_74913 ) ( not ( = ?auto_74908 ?auto_74916 ) ) ( not ( = ?auto_74914 ?auto_74916 ) ) ( OBJ-AT ?auto_74909 ?auto_74908 ) ( OBJ-AT ?auto_74911 ?auto_74908 ) ( not ( = ?auto_74909 ?auto_74910 ) ) ( not ( = ?auto_74909 ?auto_74911 ) ) ( not ( = ?auto_74909 ?auto_74912 ) ) ( not ( = ?auto_74910 ?auto_74911 ) ) ( not ( = ?auto_74911 ?auto_74912 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_74910 ?auto_74912 ?auto_74908 )
      ( DELIVER-4PKG-VERIFY ?auto_74909 ?auto_74910 ?auto_74911 ?auto_74912 ?auto_74908 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74936 - OBJ
      ?auto_74937 - OBJ
      ?auto_74938 - OBJ
      ?auto_74939 - OBJ
      ?auto_74935 - LOCATION
    )
    :vars
    (
      ?auto_74941 - LOCATION
      ?auto_74940 - CITY
      ?auto_74942 - TRUCK
      ?auto_74943 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_74941 ?auto_74940 ) ( IN-CITY ?auto_74935 ?auto_74940 ) ( not ( = ?auto_74935 ?auto_74941 ) ) ( OBJ-AT ?auto_74937 ?auto_74935 ) ( not ( = ?auto_74937 ?auto_74938 ) ) ( OBJ-AT ?auto_74938 ?auto_74941 ) ( TRUCK-AT ?auto_74942 ?auto_74943 ) ( IN-CITY ?auto_74943 ?auto_74940 ) ( not ( = ?auto_74935 ?auto_74943 ) ) ( not ( = ?auto_74941 ?auto_74943 ) ) ( OBJ-AT ?auto_74936 ?auto_74935 ) ( OBJ-AT ?auto_74939 ?auto_74935 ) ( not ( = ?auto_74936 ?auto_74937 ) ) ( not ( = ?auto_74936 ?auto_74938 ) ) ( not ( = ?auto_74936 ?auto_74939 ) ) ( not ( = ?auto_74937 ?auto_74939 ) ) ( not ( = ?auto_74938 ?auto_74939 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_74937 ?auto_74938 ?auto_74935 )
      ( DELIVER-4PKG-VERIFY ?auto_74936 ?auto_74937 ?auto_74938 ?auto_74939 ?auto_74935 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74963 - OBJ
      ?auto_74964 - OBJ
      ?auto_74965 - OBJ
      ?auto_74966 - OBJ
      ?auto_74962 - LOCATION
    )
    :vars
    (
      ?auto_74968 - LOCATION
      ?auto_74967 - CITY
      ?auto_74969 - TRUCK
      ?auto_74970 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_74968 ?auto_74967 ) ( IN-CITY ?auto_74962 ?auto_74967 ) ( not ( = ?auto_74962 ?auto_74968 ) ) ( OBJ-AT ?auto_74965 ?auto_74962 ) ( not ( = ?auto_74965 ?auto_74966 ) ) ( OBJ-AT ?auto_74966 ?auto_74968 ) ( TRUCK-AT ?auto_74969 ?auto_74970 ) ( IN-CITY ?auto_74970 ?auto_74967 ) ( not ( = ?auto_74962 ?auto_74970 ) ) ( not ( = ?auto_74968 ?auto_74970 ) ) ( OBJ-AT ?auto_74963 ?auto_74962 ) ( OBJ-AT ?auto_74964 ?auto_74962 ) ( not ( = ?auto_74963 ?auto_74964 ) ) ( not ( = ?auto_74963 ?auto_74965 ) ) ( not ( = ?auto_74963 ?auto_74966 ) ) ( not ( = ?auto_74964 ?auto_74965 ) ) ( not ( = ?auto_74964 ?auto_74966 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_74965 ?auto_74966 ?auto_74962 )
      ( DELIVER-4PKG-VERIFY ?auto_74963 ?auto_74964 ?auto_74965 ?auto_74966 ?auto_74962 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75098 - OBJ
      ?auto_75099 - OBJ
      ?auto_75100 - OBJ
      ?auto_75101 - OBJ
      ?auto_75097 - LOCATION
    )
    :vars
    (
      ?auto_75103 - LOCATION
      ?auto_75102 - CITY
      ?auto_75104 - TRUCK
      ?auto_75105 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75103 ?auto_75102 ) ( IN-CITY ?auto_75097 ?auto_75102 ) ( not ( = ?auto_75097 ?auto_75103 ) ) ( OBJ-AT ?auto_75100 ?auto_75097 ) ( not ( = ?auto_75100 ?auto_75099 ) ) ( OBJ-AT ?auto_75099 ?auto_75103 ) ( TRUCK-AT ?auto_75104 ?auto_75105 ) ( IN-CITY ?auto_75105 ?auto_75102 ) ( not ( = ?auto_75097 ?auto_75105 ) ) ( not ( = ?auto_75103 ?auto_75105 ) ) ( OBJ-AT ?auto_75098 ?auto_75097 ) ( OBJ-AT ?auto_75101 ?auto_75097 ) ( not ( = ?auto_75098 ?auto_75099 ) ) ( not ( = ?auto_75098 ?auto_75100 ) ) ( not ( = ?auto_75098 ?auto_75101 ) ) ( not ( = ?auto_75099 ?auto_75101 ) ) ( not ( = ?auto_75100 ?auto_75101 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75100 ?auto_75099 ?auto_75097 )
      ( DELIVER-4PKG-VERIFY ?auto_75098 ?auto_75099 ?auto_75100 ?auto_75101 ?auto_75097 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75305 - OBJ
      ?auto_75306 - OBJ
      ?auto_75307 - OBJ
      ?auto_75308 - OBJ
      ?auto_75304 - LOCATION
    )
    :vars
    (
      ?auto_75311 - LOCATION
      ?auto_75309 - CITY
      ?auto_75310 - OBJ
      ?auto_75312 - TRUCK
      ?auto_75313 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75311 ?auto_75309 ) ( IN-CITY ?auto_75304 ?auto_75309 ) ( not ( = ?auto_75304 ?auto_75311 ) ) ( OBJ-AT ?auto_75310 ?auto_75304 ) ( not ( = ?auto_75310 ?auto_75308 ) ) ( OBJ-AT ?auto_75308 ?auto_75311 ) ( TRUCK-AT ?auto_75312 ?auto_75313 ) ( IN-CITY ?auto_75313 ?auto_75309 ) ( not ( = ?auto_75304 ?auto_75313 ) ) ( not ( = ?auto_75311 ?auto_75313 ) ) ( OBJ-AT ?auto_75305 ?auto_75304 ) ( OBJ-AT ?auto_75306 ?auto_75304 ) ( OBJ-AT ?auto_75307 ?auto_75304 ) ( not ( = ?auto_75305 ?auto_75306 ) ) ( not ( = ?auto_75305 ?auto_75307 ) ) ( not ( = ?auto_75305 ?auto_75308 ) ) ( not ( = ?auto_75305 ?auto_75310 ) ) ( not ( = ?auto_75306 ?auto_75307 ) ) ( not ( = ?auto_75306 ?auto_75308 ) ) ( not ( = ?auto_75306 ?auto_75310 ) ) ( not ( = ?auto_75307 ?auto_75308 ) ) ( not ( = ?auto_75307 ?auto_75310 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75310 ?auto_75308 ?auto_75304 )
      ( DELIVER-4PKG-VERIFY ?auto_75305 ?auto_75306 ?auto_75307 ?auto_75308 ?auto_75304 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75325 - OBJ
      ?auto_75326 - OBJ
      ?auto_75327 - OBJ
      ?auto_75328 - OBJ
      ?auto_75324 - LOCATION
    )
    :vars
    (
      ?auto_75330 - LOCATION
      ?auto_75329 - CITY
      ?auto_75331 - TRUCK
      ?auto_75332 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75330 ?auto_75329 ) ( IN-CITY ?auto_75324 ?auto_75329 ) ( not ( = ?auto_75324 ?auto_75330 ) ) ( OBJ-AT ?auto_75328 ?auto_75324 ) ( not ( = ?auto_75328 ?auto_75327 ) ) ( OBJ-AT ?auto_75327 ?auto_75330 ) ( TRUCK-AT ?auto_75331 ?auto_75332 ) ( IN-CITY ?auto_75332 ?auto_75329 ) ( not ( = ?auto_75324 ?auto_75332 ) ) ( not ( = ?auto_75330 ?auto_75332 ) ) ( OBJ-AT ?auto_75325 ?auto_75324 ) ( OBJ-AT ?auto_75326 ?auto_75324 ) ( not ( = ?auto_75325 ?auto_75326 ) ) ( not ( = ?auto_75325 ?auto_75327 ) ) ( not ( = ?auto_75325 ?auto_75328 ) ) ( not ( = ?auto_75326 ?auto_75327 ) ) ( not ( = ?auto_75326 ?auto_75328 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75328 ?auto_75327 ?auto_75324 )
      ( DELIVER-4PKG-VERIFY ?auto_75325 ?auto_75326 ?auto_75327 ?auto_75328 ?auto_75324 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75334 - OBJ
      ?auto_75335 - OBJ
      ?auto_75336 - OBJ
      ?auto_75337 - OBJ
      ?auto_75333 - LOCATION
    )
    :vars
    (
      ?auto_75340 - LOCATION
      ?auto_75338 - CITY
      ?auto_75339 - OBJ
      ?auto_75341 - TRUCK
      ?auto_75342 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75340 ?auto_75338 ) ( IN-CITY ?auto_75333 ?auto_75338 ) ( not ( = ?auto_75333 ?auto_75340 ) ) ( OBJ-AT ?auto_75339 ?auto_75333 ) ( not ( = ?auto_75339 ?auto_75336 ) ) ( OBJ-AT ?auto_75336 ?auto_75340 ) ( TRUCK-AT ?auto_75341 ?auto_75342 ) ( IN-CITY ?auto_75342 ?auto_75338 ) ( not ( = ?auto_75333 ?auto_75342 ) ) ( not ( = ?auto_75340 ?auto_75342 ) ) ( OBJ-AT ?auto_75334 ?auto_75333 ) ( OBJ-AT ?auto_75335 ?auto_75333 ) ( OBJ-AT ?auto_75337 ?auto_75333 ) ( not ( = ?auto_75334 ?auto_75335 ) ) ( not ( = ?auto_75334 ?auto_75336 ) ) ( not ( = ?auto_75334 ?auto_75337 ) ) ( not ( = ?auto_75334 ?auto_75339 ) ) ( not ( = ?auto_75335 ?auto_75336 ) ) ( not ( = ?auto_75335 ?auto_75337 ) ) ( not ( = ?auto_75335 ?auto_75339 ) ) ( not ( = ?auto_75336 ?auto_75337 ) ) ( not ( = ?auto_75337 ?auto_75339 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75339 ?auto_75336 ?auto_75333 )
      ( DELIVER-4PKG-VERIFY ?auto_75334 ?auto_75335 ?auto_75336 ?auto_75337 ?auto_75333 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75432 - OBJ
      ?auto_75433 - OBJ
      ?auto_75434 - OBJ
      ?auto_75435 - OBJ
      ?auto_75431 - LOCATION
    )
    :vars
    (
      ?auto_75437 - LOCATION
      ?auto_75436 - CITY
      ?auto_75438 - TRUCK
      ?auto_75439 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75437 ?auto_75436 ) ( IN-CITY ?auto_75431 ?auto_75436 ) ( not ( = ?auto_75431 ?auto_75437 ) ) ( OBJ-AT ?auto_75435 ?auto_75431 ) ( not ( = ?auto_75435 ?auto_75433 ) ) ( OBJ-AT ?auto_75433 ?auto_75437 ) ( TRUCK-AT ?auto_75438 ?auto_75439 ) ( IN-CITY ?auto_75439 ?auto_75436 ) ( not ( = ?auto_75431 ?auto_75439 ) ) ( not ( = ?auto_75437 ?auto_75439 ) ) ( OBJ-AT ?auto_75432 ?auto_75431 ) ( OBJ-AT ?auto_75434 ?auto_75431 ) ( not ( = ?auto_75432 ?auto_75433 ) ) ( not ( = ?auto_75432 ?auto_75434 ) ) ( not ( = ?auto_75432 ?auto_75435 ) ) ( not ( = ?auto_75433 ?auto_75434 ) ) ( not ( = ?auto_75434 ?auto_75435 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75435 ?auto_75433 ?auto_75431 )
      ( DELIVER-4PKG-VERIFY ?auto_75432 ?auto_75433 ?auto_75434 ?auto_75435 ?auto_75431 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75477 - OBJ
      ?auto_75478 - OBJ
      ?auto_75479 - OBJ
      ?auto_75480 - OBJ
      ?auto_75476 - LOCATION
    )
    :vars
    (
      ?auto_75483 - LOCATION
      ?auto_75481 - CITY
      ?auto_75482 - OBJ
      ?auto_75484 - TRUCK
      ?auto_75485 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75483 ?auto_75481 ) ( IN-CITY ?auto_75476 ?auto_75481 ) ( not ( = ?auto_75476 ?auto_75483 ) ) ( OBJ-AT ?auto_75482 ?auto_75476 ) ( not ( = ?auto_75482 ?auto_75478 ) ) ( OBJ-AT ?auto_75478 ?auto_75483 ) ( TRUCK-AT ?auto_75484 ?auto_75485 ) ( IN-CITY ?auto_75485 ?auto_75481 ) ( not ( = ?auto_75476 ?auto_75485 ) ) ( not ( = ?auto_75483 ?auto_75485 ) ) ( OBJ-AT ?auto_75477 ?auto_75476 ) ( OBJ-AT ?auto_75479 ?auto_75476 ) ( OBJ-AT ?auto_75480 ?auto_75476 ) ( not ( = ?auto_75477 ?auto_75478 ) ) ( not ( = ?auto_75477 ?auto_75479 ) ) ( not ( = ?auto_75477 ?auto_75480 ) ) ( not ( = ?auto_75477 ?auto_75482 ) ) ( not ( = ?auto_75478 ?auto_75479 ) ) ( not ( = ?auto_75478 ?auto_75480 ) ) ( not ( = ?auto_75479 ?auto_75480 ) ) ( not ( = ?auto_75479 ?auto_75482 ) ) ( not ( = ?auto_75480 ?auto_75482 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75482 ?auto_75478 ?auto_75476 )
      ( DELIVER-4PKG-VERIFY ?auto_75477 ?auto_75478 ?auto_75479 ?auto_75480 ?auto_75476 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75973 - OBJ
      ?auto_75974 - OBJ
      ?auto_75975 - OBJ
      ?auto_75976 - OBJ
      ?auto_75972 - LOCATION
    )
    :vars
    (
      ?auto_75978 - LOCATION
      ?auto_75977 - CITY
      ?auto_75979 - TRUCK
      ?auto_75980 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75978 ?auto_75977 ) ( IN-CITY ?auto_75972 ?auto_75977 ) ( not ( = ?auto_75972 ?auto_75978 ) ) ( OBJ-AT ?auto_75974 ?auto_75972 ) ( not ( = ?auto_75974 ?auto_75973 ) ) ( OBJ-AT ?auto_75973 ?auto_75978 ) ( TRUCK-AT ?auto_75979 ?auto_75980 ) ( IN-CITY ?auto_75980 ?auto_75977 ) ( not ( = ?auto_75972 ?auto_75980 ) ) ( not ( = ?auto_75978 ?auto_75980 ) ) ( OBJ-AT ?auto_75975 ?auto_75972 ) ( OBJ-AT ?auto_75976 ?auto_75972 ) ( not ( = ?auto_75973 ?auto_75975 ) ) ( not ( = ?auto_75973 ?auto_75976 ) ) ( not ( = ?auto_75974 ?auto_75975 ) ) ( not ( = ?auto_75974 ?auto_75976 ) ) ( not ( = ?auto_75975 ?auto_75976 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75974 ?auto_75973 ?auto_75972 )
      ( DELIVER-4PKG-VERIFY ?auto_75973 ?auto_75974 ?auto_75975 ?auto_75976 ?auto_75972 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76117 - OBJ
      ?auto_76118 - OBJ
      ?auto_76119 - OBJ
      ?auto_76120 - OBJ
      ?auto_76116 - LOCATION
    )
    :vars
    (
      ?auto_76122 - LOCATION
      ?auto_76121 - CITY
      ?auto_76123 - TRUCK
      ?auto_76124 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_76122 ?auto_76121 ) ( IN-CITY ?auto_76116 ?auto_76121 ) ( not ( = ?auto_76116 ?auto_76122 ) ) ( OBJ-AT ?auto_76120 ?auto_76116 ) ( not ( = ?auto_76120 ?auto_76117 ) ) ( OBJ-AT ?auto_76117 ?auto_76122 ) ( TRUCK-AT ?auto_76123 ?auto_76124 ) ( IN-CITY ?auto_76124 ?auto_76121 ) ( not ( = ?auto_76116 ?auto_76124 ) ) ( not ( = ?auto_76122 ?auto_76124 ) ) ( OBJ-AT ?auto_76118 ?auto_76116 ) ( OBJ-AT ?auto_76119 ?auto_76116 ) ( not ( = ?auto_76117 ?auto_76118 ) ) ( not ( = ?auto_76117 ?auto_76119 ) ) ( not ( = ?auto_76118 ?auto_76119 ) ) ( not ( = ?auto_76118 ?auto_76120 ) ) ( not ( = ?auto_76119 ?auto_76120 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76120 ?auto_76117 ?auto_76116 )
      ( DELIVER-4PKG-VERIFY ?auto_76117 ?auto_76118 ?auto_76119 ?auto_76120 ?auto_76116 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76126 - OBJ
      ?auto_76127 - OBJ
      ?auto_76128 - OBJ
      ?auto_76129 - OBJ
      ?auto_76125 - LOCATION
    )
    :vars
    (
      ?auto_76132 - LOCATION
      ?auto_76130 - CITY
      ?auto_76131 - OBJ
      ?auto_76133 - TRUCK
      ?auto_76134 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_76132 ?auto_76130 ) ( IN-CITY ?auto_76125 ?auto_76130 ) ( not ( = ?auto_76125 ?auto_76132 ) ) ( OBJ-AT ?auto_76131 ?auto_76125 ) ( not ( = ?auto_76131 ?auto_76126 ) ) ( OBJ-AT ?auto_76126 ?auto_76132 ) ( TRUCK-AT ?auto_76133 ?auto_76134 ) ( IN-CITY ?auto_76134 ?auto_76130 ) ( not ( = ?auto_76125 ?auto_76134 ) ) ( not ( = ?auto_76132 ?auto_76134 ) ) ( OBJ-AT ?auto_76127 ?auto_76125 ) ( OBJ-AT ?auto_76128 ?auto_76125 ) ( OBJ-AT ?auto_76129 ?auto_76125 ) ( not ( = ?auto_76126 ?auto_76127 ) ) ( not ( = ?auto_76126 ?auto_76128 ) ) ( not ( = ?auto_76126 ?auto_76129 ) ) ( not ( = ?auto_76127 ?auto_76128 ) ) ( not ( = ?auto_76127 ?auto_76129 ) ) ( not ( = ?auto_76127 ?auto_76131 ) ) ( not ( = ?auto_76128 ?auto_76129 ) ) ( not ( = ?auto_76128 ?auto_76131 ) ) ( not ( = ?auto_76129 ?auto_76131 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76131 ?auto_76126 ?auto_76125 )
      ( DELIVER-4PKG-VERIFY ?auto_76126 ?auto_76127 ?auto_76128 ?auto_76129 ?auto_76125 ) )
  )

)

