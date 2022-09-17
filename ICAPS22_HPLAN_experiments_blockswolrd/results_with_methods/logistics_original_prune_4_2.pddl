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
      ?auto_94922 - OBJ
      ?auto_94921 - LOCATION
    )
    :vars
    (
      ?auto_94923 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_94923 ?auto_94921 ) ( IN-TRUCK ?auto_94922 ?auto_94923 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_94922 ?auto_94923 ?auto_94921 )
      ( DELIVER-1PKG-VERIFY ?auto_94922 ?auto_94921 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_94940 - OBJ
      ?auto_94939 - LOCATION
    )
    :vars
    (
      ?auto_94941 - TRUCK
      ?auto_94942 - LOCATION
      ?auto_94943 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_94940 ?auto_94941 ) ( TRUCK-AT ?auto_94941 ?auto_94942 ) ( IN-CITY ?auto_94942 ?auto_94943 ) ( IN-CITY ?auto_94939 ?auto_94943 ) ( not ( = ?auto_94939 ?auto_94942 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_94941 ?auto_94942 ?auto_94939 ?auto_94943 )
      ( DELIVER-1PKG ?auto_94940 ?auto_94939 )
      ( DELIVER-1PKG-VERIFY ?auto_94940 ?auto_94939 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_94966 - OBJ
      ?auto_94965 - LOCATION
    )
    :vars
    (
      ?auto_94967 - TRUCK
      ?auto_94969 - LOCATION
      ?auto_94968 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_94967 ?auto_94969 ) ( IN-CITY ?auto_94969 ?auto_94968 ) ( IN-CITY ?auto_94965 ?auto_94968 ) ( not ( = ?auto_94965 ?auto_94969 ) ) ( OBJ-AT ?auto_94966 ?auto_94969 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_94966 ?auto_94967 ?auto_94969 )
      ( DELIVER-1PKG ?auto_94966 ?auto_94965 )
      ( DELIVER-1PKG-VERIFY ?auto_94966 ?auto_94965 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_94992 - OBJ
      ?auto_94991 - LOCATION
    )
    :vars
    (
      ?auto_94995 - LOCATION
      ?auto_94994 - CITY
      ?auto_94993 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_94995 ?auto_94994 ) ( IN-CITY ?auto_94991 ?auto_94994 ) ( not ( = ?auto_94991 ?auto_94995 ) ) ( OBJ-AT ?auto_94992 ?auto_94995 ) ( TRUCK-AT ?auto_94993 ?auto_94991 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_94993 ?auto_94991 ?auto_94995 ?auto_94994 )
      ( DELIVER-1PKG ?auto_94992 ?auto_94991 )
      ( DELIVER-1PKG-VERIFY ?auto_94992 ?auto_94991 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95135 - OBJ
      ?auto_95136 - OBJ
      ?auto_95134 - LOCATION
    )
    :vars
    (
      ?auto_95137 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95137 ?auto_95134 ) ( IN-TRUCK ?auto_95136 ?auto_95137 ) ( OBJ-AT ?auto_95135 ?auto_95134 ) ( not ( = ?auto_95135 ?auto_95136 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95136 ?auto_95134 )
      ( DELIVER-2PKG-VERIFY ?auto_95135 ?auto_95136 ?auto_95134 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95139 - OBJ
      ?auto_95140 - OBJ
      ?auto_95138 - LOCATION
    )
    :vars
    (
      ?auto_95141 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95141 ?auto_95138 ) ( IN-TRUCK ?auto_95139 ?auto_95141 ) ( OBJ-AT ?auto_95140 ?auto_95138 ) ( not ( = ?auto_95139 ?auto_95140 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95139 ?auto_95138 )
      ( DELIVER-2PKG-VERIFY ?auto_95139 ?auto_95140 ?auto_95138 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95147 - OBJ
      ?auto_95148 - OBJ
      ?auto_95149 - OBJ
      ?auto_95146 - LOCATION
    )
    :vars
    (
      ?auto_95150 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95150 ?auto_95146 ) ( IN-TRUCK ?auto_95149 ?auto_95150 ) ( OBJ-AT ?auto_95147 ?auto_95146 ) ( OBJ-AT ?auto_95148 ?auto_95146 ) ( not ( = ?auto_95147 ?auto_95148 ) ) ( not ( = ?auto_95147 ?auto_95149 ) ) ( not ( = ?auto_95148 ?auto_95149 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95149 ?auto_95146 )
      ( DELIVER-3PKG-VERIFY ?auto_95147 ?auto_95148 ?auto_95149 ?auto_95146 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95152 - OBJ
      ?auto_95153 - OBJ
      ?auto_95154 - OBJ
      ?auto_95151 - LOCATION
    )
    :vars
    (
      ?auto_95155 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95155 ?auto_95151 ) ( IN-TRUCK ?auto_95153 ?auto_95155 ) ( OBJ-AT ?auto_95152 ?auto_95151 ) ( OBJ-AT ?auto_95154 ?auto_95151 ) ( not ( = ?auto_95152 ?auto_95153 ) ) ( not ( = ?auto_95152 ?auto_95154 ) ) ( not ( = ?auto_95153 ?auto_95154 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95153 ?auto_95151 )
      ( DELIVER-3PKG-VERIFY ?auto_95152 ?auto_95153 ?auto_95154 ?auto_95151 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95162 - OBJ
      ?auto_95163 - OBJ
      ?auto_95164 - OBJ
      ?auto_95161 - LOCATION
    )
    :vars
    (
      ?auto_95165 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95165 ?auto_95161 ) ( IN-TRUCK ?auto_95162 ?auto_95165 ) ( OBJ-AT ?auto_95163 ?auto_95161 ) ( OBJ-AT ?auto_95164 ?auto_95161 ) ( not ( = ?auto_95162 ?auto_95163 ) ) ( not ( = ?auto_95162 ?auto_95164 ) ) ( not ( = ?auto_95163 ?auto_95164 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95162 ?auto_95161 )
      ( DELIVER-3PKG-VERIFY ?auto_95162 ?auto_95163 ?auto_95164 ?auto_95161 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95182 - OBJ
      ?auto_95183 - OBJ
      ?auto_95184 - OBJ
      ?auto_95185 - OBJ
      ?auto_95181 - LOCATION
    )
    :vars
    (
      ?auto_95186 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95186 ?auto_95181 ) ( IN-TRUCK ?auto_95185 ?auto_95186 ) ( OBJ-AT ?auto_95182 ?auto_95181 ) ( OBJ-AT ?auto_95183 ?auto_95181 ) ( OBJ-AT ?auto_95184 ?auto_95181 ) ( not ( = ?auto_95182 ?auto_95183 ) ) ( not ( = ?auto_95182 ?auto_95184 ) ) ( not ( = ?auto_95182 ?auto_95185 ) ) ( not ( = ?auto_95183 ?auto_95184 ) ) ( not ( = ?auto_95183 ?auto_95185 ) ) ( not ( = ?auto_95184 ?auto_95185 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95185 ?auto_95181 )
      ( DELIVER-4PKG-VERIFY ?auto_95182 ?auto_95183 ?auto_95184 ?auto_95185 ?auto_95181 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95188 - OBJ
      ?auto_95189 - OBJ
      ?auto_95190 - OBJ
      ?auto_95191 - OBJ
      ?auto_95187 - LOCATION
    )
    :vars
    (
      ?auto_95192 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95192 ?auto_95187 ) ( IN-TRUCK ?auto_95190 ?auto_95192 ) ( OBJ-AT ?auto_95188 ?auto_95187 ) ( OBJ-AT ?auto_95189 ?auto_95187 ) ( OBJ-AT ?auto_95191 ?auto_95187 ) ( not ( = ?auto_95188 ?auto_95189 ) ) ( not ( = ?auto_95188 ?auto_95190 ) ) ( not ( = ?auto_95188 ?auto_95191 ) ) ( not ( = ?auto_95189 ?auto_95190 ) ) ( not ( = ?auto_95189 ?auto_95191 ) ) ( not ( = ?auto_95190 ?auto_95191 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95190 ?auto_95187 )
      ( DELIVER-4PKG-VERIFY ?auto_95188 ?auto_95189 ?auto_95190 ?auto_95191 ?auto_95187 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95200 - OBJ
      ?auto_95201 - OBJ
      ?auto_95202 - OBJ
      ?auto_95203 - OBJ
      ?auto_95199 - LOCATION
    )
    :vars
    (
      ?auto_95204 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95204 ?auto_95199 ) ( IN-TRUCK ?auto_95201 ?auto_95204 ) ( OBJ-AT ?auto_95200 ?auto_95199 ) ( OBJ-AT ?auto_95202 ?auto_95199 ) ( OBJ-AT ?auto_95203 ?auto_95199 ) ( not ( = ?auto_95200 ?auto_95201 ) ) ( not ( = ?auto_95200 ?auto_95202 ) ) ( not ( = ?auto_95200 ?auto_95203 ) ) ( not ( = ?auto_95201 ?auto_95202 ) ) ( not ( = ?auto_95201 ?auto_95203 ) ) ( not ( = ?auto_95202 ?auto_95203 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95201 ?auto_95199 )
      ( DELIVER-4PKG-VERIFY ?auto_95200 ?auto_95201 ?auto_95202 ?auto_95203 ?auto_95199 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95224 - OBJ
      ?auto_95225 - OBJ
      ?auto_95226 - OBJ
      ?auto_95227 - OBJ
      ?auto_95223 - LOCATION
    )
    :vars
    (
      ?auto_95228 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95228 ?auto_95223 ) ( IN-TRUCK ?auto_95224 ?auto_95228 ) ( OBJ-AT ?auto_95225 ?auto_95223 ) ( OBJ-AT ?auto_95226 ?auto_95223 ) ( OBJ-AT ?auto_95227 ?auto_95223 ) ( not ( = ?auto_95224 ?auto_95225 ) ) ( not ( = ?auto_95224 ?auto_95226 ) ) ( not ( = ?auto_95224 ?auto_95227 ) ) ( not ( = ?auto_95225 ?auto_95226 ) ) ( not ( = ?auto_95225 ?auto_95227 ) ) ( not ( = ?auto_95226 ?auto_95227 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95224 ?auto_95223 )
      ( DELIVER-4PKG-VERIFY ?auto_95224 ?auto_95225 ?auto_95226 ?auto_95227 ?auto_95223 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95277 - OBJ
      ?auto_95278 - OBJ
      ?auto_95276 - LOCATION
    )
    :vars
    (
      ?auto_95280 - TRUCK
      ?auto_95281 - LOCATION
      ?auto_95279 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95278 ?auto_95280 ) ( TRUCK-AT ?auto_95280 ?auto_95281 ) ( IN-CITY ?auto_95281 ?auto_95279 ) ( IN-CITY ?auto_95276 ?auto_95279 ) ( not ( = ?auto_95276 ?auto_95281 ) ) ( OBJ-AT ?auto_95277 ?auto_95276 ) ( not ( = ?auto_95277 ?auto_95278 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95278 ?auto_95276 )
      ( DELIVER-2PKG-VERIFY ?auto_95277 ?auto_95278 ?auto_95276 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95283 - OBJ
      ?auto_95284 - OBJ
      ?auto_95282 - LOCATION
    )
    :vars
    (
      ?auto_95287 - TRUCK
      ?auto_95286 - LOCATION
      ?auto_95285 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95283 ?auto_95287 ) ( TRUCK-AT ?auto_95287 ?auto_95286 ) ( IN-CITY ?auto_95286 ?auto_95285 ) ( IN-CITY ?auto_95282 ?auto_95285 ) ( not ( = ?auto_95282 ?auto_95286 ) ) ( OBJ-AT ?auto_95284 ?auto_95282 ) ( not ( = ?auto_95284 ?auto_95283 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95284 ?auto_95283 ?auto_95282 )
      ( DELIVER-2PKG-VERIFY ?auto_95283 ?auto_95284 ?auto_95282 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95296 - OBJ
      ?auto_95297 - OBJ
      ?auto_95298 - OBJ
      ?auto_95295 - LOCATION
    )
    :vars
    (
      ?auto_95301 - TRUCK
      ?auto_95300 - LOCATION
      ?auto_95299 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95298 ?auto_95301 ) ( TRUCK-AT ?auto_95301 ?auto_95300 ) ( IN-CITY ?auto_95300 ?auto_95299 ) ( IN-CITY ?auto_95295 ?auto_95299 ) ( not ( = ?auto_95295 ?auto_95300 ) ) ( OBJ-AT ?auto_95296 ?auto_95295 ) ( not ( = ?auto_95296 ?auto_95298 ) ) ( OBJ-AT ?auto_95297 ?auto_95295 ) ( not ( = ?auto_95296 ?auto_95297 ) ) ( not ( = ?auto_95297 ?auto_95298 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95296 ?auto_95298 ?auto_95295 )
      ( DELIVER-3PKG-VERIFY ?auto_95296 ?auto_95297 ?auto_95298 ?auto_95295 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95303 - OBJ
      ?auto_95304 - OBJ
      ?auto_95305 - OBJ
      ?auto_95302 - LOCATION
    )
    :vars
    (
      ?auto_95308 - TRUCK
      ?auto_95307 - LOCATION
      ?auto_95306 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95304 ?auto_95308 ) ( TRUCK-AT ?auto_95308 ?auto_95307 ) ( IN-CITY ?auto_95307 ?auto_95306 ) ( IN-CITY ?auto_95302 ?auto_95306 ) ( not ( = ?auto_95302 ?auto_95307 ) ) ( OBJ-AT ?auto_95305 ?auto_95302 ) ( not ( = ?auto_95305 ?auto_95304 ) ) ( OBJ-AT ?auto_95303 ?auto_95302 ) ( not ( = ?auto_95303 ?auto_95304 ) ) ( not ( = ?auto_95303 ?auto_95305 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95305 ?auto_95304 ?auto_95302 )
      ( DELIVER-3PKG-VERIFY ?auto_95303 ?auto_95304 ?auto_95305 ?auto_95302 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95317 - OBJ
      ?auto_95318 - OBJ
      ?auto_95319 - OBJ
      ?auto_95316 - LOCATION
    )
    :vars
    (
      ?auto_95322 - TRUCK
      ?auto_95321 - LOCATION
      ?auto_95320 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95317 ?auto_95322 ) ( TRUCK-AT ?auto_95322 ?auto_95321 ) ( IN-CITY ?auto_95321 ?auto_95320 ) ( IN-CITY ?auto_95316 ?auto_95320 ) ( not ( = ?auto_95316 ?auto_95321 ) ) ( OBJ-AT ?auto_95319 ?auto_95316 ) ( not ( = ?auto_95319 ?auto_95317 ) ) ( OBJ-AT ?auto_95318 ?auto_95316 ) ( not ( = ?auto_95317 ?auto_95318 ) ) ( not ( = ?auto_95318 ?auto_95319 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95319 ?auto_95317 ?auto_95316 )
      ( DELIVER-3PKG-VERIFY ?auto_95317 ?auto_95318 ?auto_95319 ?auto_95316 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95346 - OBJ
      ?auto_95347 - OBJ
      ?auto_95348 - OBJ
      ?auto_95349 - OBJ
      ?auto_95345 - LOCATION
    )
    :vars
    (
      ?auto_95352 - TRUCK
      ?auto_95351 - LOCATION
      ?auto_95350 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95349 ?auto_95352 ) ( TRUCK-AT ?auto_95352 ?auto_95351 ) ( IN-CITY ?auto_95351 ?auto_95350 ) ( IN-CITY ?auto_95345 ?auto_95350 ) ( not ( = ?auto_95345 ?auto_95351 ) ) ( OBJ-AT ?auto_95348 ?auto_95345 ) ( not ( = ?auto_95348 ?auto_95349 ) ) ( OBJ-AT ?auto_95346 ?auto_95345 ) ( OBJ-AT ?auto_95347 ?auto_95345 ) ( not ( = ?auto_95346 ?auto_95347 ) ) ( not ( = ?auto_95346 ?auto_95348 ) ) ( not ( = ?auto_95346 ?auto_95349 ) ) ( not ( = ?auto_95347 ?auto_95348 ) ) ( not ( = ?auto_95347 ?auto_95349 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95348 ?auto_95349 ?auto_95345 )
      ( DELIVER-4PKG-VERIFY ?auto_95346 ?auto_95347 ?auto_95348 ?auto_95349 ?auto_95345 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95354 - OBJ
      ?auto_95355 - OBJ
      ?auto_95356 - OBJ
      ?auto_95357 - OBJ
      ?auto_95353 - LOCATION
    )
    :vars
    (
      ?auto_95360 - TRUCK
      ?auto_95359 - LOCATION
      ?auto_95358 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95356 ?auto_95360 ) ( TRUCK-AT ?auto_95360 ?auto_95359 ) ( IN-CITY ?auto_95359 ?auto_95358 ) ( IN-CITY ?auto_95353 ?auto_95358 ) ( not ( = ?auto_95353 ?auto_95359 ) ) ( OBJ-AT ?auto_95355 ?auto_95353 ) ( not ( = ?auto_95355 ?auto_95356 ) ) ( OBJ-AT ?auto_95354 ?auto_95353 ) ( OBJ-AT ?auto_95357 ?auto_95353 ) ( not ( = ?auto_95354 ?auto_95355 ) ) ( not ( = ?auto_95354 ?auto_95356 ) ) ( not ( = ?auto_95354 ?auto_95357 ) ) ( not ( = ?auto_95355 ?auto_95357 ) ) ( not ( = ?auto_95356 ?auto_95357 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95355 ?auto_95356 ?auto_95353 )
      ( DELIVER-4PKG-VERIFY ?auto_95354 ?auto_95355 ?auto_95356 ?auto_95357 ?auto_95353 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95370 - OBJ
      ?auto_95371 - OBJ
      ?auto_95372 - OBJ
      ?auto_95373 - OBJ
      ?auto_95369 - LOCATION
    )
    :vars
    (
      ?auto_95376 - TRUCK
      ?auto_95375 - LOCATION
      ?auto_95374 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95371 ?auto_95376 ) ( TRUCK-AT ?auto_95376 ?auto_95375 ) ( IN-CITY ?auto_95375 ?auto_95374 ) ( IN-CITY ?auto_95369 ?auto_95374 ) ( not ( = ?auto_95369 ?auto_95375 ) ) ( OBJ-AT ?auto_95370 ?auto_95369 ) ( not ( = ?auto_95370 ?auto_95371 ) ) ( OBJ-AT ?auto_95372 ?auto_95369 ) ( OBJ-AT ?auto_95373 ?auto_95369 ) ( not ( = ?auto_95370 ?auto_95372 ) ) ( not ( = ?auto_95370 ?auto_95373 ) ) ( not ( = ?auto_95371 ?auto_95372 ) ) ( not ( = ?auto_95371 ?auto_95373 ) ) ( not ( = ?auto_95372 ?auto_95373 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95370 ?auto_95371 ?auto_95369 )
      ( DELIVER-4PKG-VERIFY ?auto_95370 ?auto_95371 ?auto_95372 ?auto_95373 ?auto_95369 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95402 - OBJ
      ?auto_95403 - OBJ
      ?auto_95404 - OBJ
      ?auto_95405 - OBJ
      ?auto_95401 - LOCATION
    )
    :vars
    (
      ?auto_95408 - TRUCK
      ?auto_95407 - LOCATION
      ?auto_95406 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95402 ?auto_95408 ) ( TRUCK-AT ?auto_95408 ?auto_95407 ) ( IN-CITY ?auto_95407 ?auto_95406 ) ( IN-CITY ?auto_95401 ?auto_95406 ) ( not ( = ?auto_95401 ?auto_95407 ) ) ( OBJ-AT ?auto_95405 ?auto_95401 ) ( not ( = ?auto_95405 ?auto_95402 ) ) ( OBJ-AT ?auto_95403 ?auto_95401 ) ( OBJ-AT ?auto_95404 ?auto_95401 ) ( not ( = ?auto_95402 ?auto_95403 ) ) ( not ( = ?auto_95402 ?auto_95404 ) ) ( not ( = ?auto_95403 ?auto_95404 ) ) ( not ( = ?auto_95403 ?auto_95405 ) ) ( not ( = ?auto_95404 ?auto_95405 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95405 ?auto_95402 ?auto_95401 )
      ( DELIVER-4PKG-VERIFY ?auto_95402 ?auto_95403 ?auto_95404 ?auto_95405 ?auto_95401 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95467 - OBJ
      ?auto_95466 - LOCATION
    )
    :vars
    (
      ?auto_95470 - TRUCK
      ?auto_95469 - LOCATION
      ?auto_95468 - CITY
      ?auto_95471 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95470 ?auto_95469 ) ( IN-CITY ?auto_95469 ?auto_95468 ) ( IN-CITY ?auto_95466 ?auto_95468 ) ( not ( = ?auto_95466 ?auto_95469 ) ) ( OBJ-AT ?auto_95471 ?auto_95466 ) ( not ( = ?auto_95471 ?auto_95467 ) ) ( OBJ-AT ?auto_95467 ?auto_95469 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_95467 ?auto_95470 ?auto_95469 )
      ( DELIVER-2PKG ?auto_95471 ?auto_95467 ?auto_95466 )
      ( DELIVER-1PKG-VERIFY ?auto_95467 ?auto_95466 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95473 - OBJ
      ?auto_95474 - OBJ
      ?auto_95472 - LOCATION
    )
    :vars
    (
      ?auto_95476 - TRUCK
      ?auto_95477 - LOCATION
      ?auto_95475 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95476 ?auto_95477 ) ( IN-CITY ?auto_95477 ?auto_95475 ) ( IN-CITY ?auto_95472 ?auto_95475 ) ( not ( = ?auto_95472 ?auto_95477 ) ) ( OBJ-AT ?auto_95473 ?auto_95472 ) ( not ( = ?auto_95473 ?auto_95474 ) ) ( OBJ-AT ?auto_95474 ?auto_95477 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95474 ?auto_95472 )
      ( DELIVER-2PKG-VERIFY ?auto_95473 ?auto_95474 ?auto_95472 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95479 - OBJ
      ?auto_95480 - OBJ
      ?auto_95478 - LOCATION
    )
    :vars
    (
      ?auto_95482 - TRUCK
      ?auto_95483 - LOCATION
      ?auto_95481 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95482 ?auto_95483 ) ( IN-CITY ?auto_95483 ?auto_95481 ) ( IN-CITY ?auto_95478 ?auto_95481 ) ( not ( = ?auto_95478 ?auto_95483 ) ) ( OBJ-AT ?auto_95480 ?auto_95478 ) ( not ( = ?auto_95480 ?auto_95479 ) ) ( OBJ-AT ?auto_95479 ?auto_95483 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95480 ?auto_95479 ?auto_95478 )
      ( DELIVER-2PKG-VERIFY ?auto_95479 ?auto_95480 ?auto_95478 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95492 - OBJ
      ?auto_95493 - OBJ
      ?auto_95494 - OBJ
      ?auto_95491 - LOCATION
    )
    :vars
    (
      ?auto_95496 - TRUCK
      ?auto_95497 - LOCATION
      ?auto_95495 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95496 ?auto_95497 ) ( IN-CITY ?auto_95497 ?auto_95495 ) ( IN-CITY ?auto_95491 ?auto_95495 ) ( not ( = ?auto_95491 ?auto_95497 ) ) ( OBJ-AT ?auto_95492 ?auto_95491 ) ( not ( = ?auto_95492 ?auto_95494 ) ) ( OBJ-AT ?auto_95494 ?auto_95497 ) ( OBJ-AT ?auto_95493 ?auto_95491 ) ( not ( = ?auto_95492 ?auto_95493 ) ) ( not ( = ?auto_95493 ?auto_95494 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95492 ?auto_95494 ?auto_95491 )
      ( DELIVER-3PKG-VERIFY ?auto_95492 ?auto_95493 ?auto_95494 ?auto_95491 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95499 - OBJ
      ?auto_95500 - OBJ
      ?auto_95501 - OBJ
      ?auto_95498 - LOCATION
    )
    :vars
    (
      ?auto_95503 - TRUCK
      ?auto_95504 - LOCATION
      ?auto_95502 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95503 ?auto_95504 ) ( IN-CITY ?auto_95504 ?auto_95502 ) ( IN-CITY ?auto_95498 ?auto_95502 ) ( not ( = ?auto_95498 ?auto_95504 ) ) ( OBJ-AT ?auto_95501 ?auto_95498 ) ( not ( = ?auto_95501 ?auto_95500 ) ) ( OBJ-AT ?auto_95500 ?auto_95504 ) ( OBJ-AT ?auto_95499 ?auto_95498 ) ( not ( = ?auto_95499 ?auto_95500 ) ) ( not ( = ?auto_95499 ?auto_95501 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95501 ?auto_95500 ?auto_95498 )
      ( DELIVER-3PKG-VERIFY ?auto_95499 ?auto_95500 ?auto_95501 ?auto_95498 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95513 - OBJ
      ?auto_95514 - OBJ
      ?auto_95515 - OBJ
      ?auto_95512 - LOCATION
    )
    :vars
    (
      ?auto_95517 - TRUCK
      ?auto_95518 - LOCATION
      ?auto_95516 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95517 ?auto_95518 ) ( IN-CITY ?auto_95518 ?auto_95516 ) ( IN-CITY ?auto_95512 ?auto_95516 ) ( not ( = ?auto_95512 ?auto_95518 ) ) ( OBJ-AT ?auto_95514 ?auto_95512 ) ( not ( = ?auto_95514 ?auto_95513 ) ) ( OBJ-AT ?auto_95513 ?auto_95518 ) ( OBJ-AT ?auto_95515 ?auto_95512 ) ( not ( = ?auto_95513 ?auto_95515 ) ) ( not ( = ?auto_95514 ?auto_95515 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95514 ?auto_95513 ?auto_95512 )
      ( DELIVER-3PKG-VERIFY ?auto_95513 ?auto_95514 ?auto_95515 ?auto_95512 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95542 - OBJ
      ?auto_95543 - OBJ
      ?auto_95544 - OBJ
      ?auto_95545 - OBJ
      ?auto_95541 - LOCATION
    )
    :vars
    (
      ?auto_95547 - TRUCK
      ?auto_95548 - LOCATION
      ?auto_95546 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95547 ?auto_95548 ) ( IN-CITY ?auto_95548 ?auto_95546 ) ( IN-CITY ?auto_95541 ?auto_95546 ) ( not ( = ?auto_95541 ?auto_95548 ) ) ( OBJ-AT ?auto_95543 ?auto_95541 ) ( not ( = ?auto_95543 ?auto_95545 ) ) ( OBJ-AT ?auto_95545 ?auto_95548 ) ( OBJ-AT ?auto_95542 ?auto_95541 ) ( OBJ-AT ?auto_95544 ?auto_95541 ) ( not ( = ?auto_95542 ?auto_95543 ) ) ( not ( = ?auto_95542 ?auto_95544 ) ) ( not ( = ?auto_95542 ?auto_95545 ) ) ( not ( = ?auto_95543 ?auto_95544 ) ) ( not ( = ?auto_95544 ?auto_95545 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95543 ?auto_95545 ?auto_95541 )
      ( DELIVER-4PKG-VERIFY ?auto_95542 ?auto_95543 ?auto_95544 ?auto_95545 ?auto_95541 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95550 - OBJ
      ?auto_95551 - OBJ
      ?auto_95552 - OBJ
      ?auto_95553 - OBJ
      ?auto_95549 - LOCATION
    )
    :vars
    (
      ?auto_95555 - TRUCK
      ?auto_95556 - LOCATION
      ?auto_95554 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95555 ?auto_95556 ) ( IN-CITY ?auto_95556 ?auto_95554 ) ( IN-CITY ?auto_95549 ?auto_95554 ) ( not ( = ?auto_95549 ?auto_95556 ) ) ( OBJ-AT ?auto_95551 ?auto_95549 ) ( not ( = ?auto_95551 ?auto_95552 ) ) ( OBJ-AT ?auto_95552 ?auto_95556 ) ( OBJ-AT ?auto_95550 ?auto_95549 ) ( OBJ-AT ?auto_95553 ?auto_95549 ) ( not ( = ?auto_95550 ?auto_95551 ) ) ( not ( = ?auto_95550 ?auto_95552 ) ) ( not ( = ?auto_95550 ?auto_95553 ) ) ( not ( = ?auto_95551 ?auto_95553 ) ) ( not ( = ?auto_95552 ?auto_95553 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95551 ?auto_95552 ?auto_95549 )
      ( DELIVER-4PKG-VERIFY ?auto_95550 ?auto_95551 ?auto_95552 ?auto_95553 ?auto_95549 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95566 - OBJ
      ?auto_95567 - OBJ
      ?auto_95568 - OBJ
      ?auto_95569 - OBJ
      ?auto_95565 - LOCATION
    )
    :vars
    (
      ?auto_95571 - TRUCK
      ?auto_95572 - LOCATION
      ?auto_95570 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95571 ?auto_95572 ) ( IN-CITY ?auto_95572 ?auto_95570 ) ( IN-CITY ?auto_95565 ?auto_95570 ) ( not ( = ?auto_95565 ?auto_95572 ) ) ( OBJ-AT ?auto_95569 ?auto_95565 ) ( not ( = ?auto_95569 ?auto_95567 ) ) ( OBJ-AT ?auto_95567 ?auto_95572 ) ( OBJ-AT ?auto_95566 ?auto_95565 ) ( OBJ-AT ?auto_95568 ?auto_95565 ) ( not ( = ?auto_95566 ?auto_95567 ) ) ( not ( = ?auto_95566 ?auto_95568 ) ) ( not ( = ?auto_95566 ?auto_95569 ) ) ( not ( = ?auto_95567 ?auto_95568 ) ) ( not ( = ?auto_95568 ?auto_95569 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95569 ?auto_95567 ?auto_95565 )
      ( DELIVER-4PKG-VERIFY ?auto_95566 ?auto_95567 ?auto_95568 ?auto_95569 ?auto_95565 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95598 - OBJ
      ?auto_95599 - OBJ
      ?auto_95600 - OBJ
      ?auto_95601 - OBJ
      ?auto_95597 - LOCATION
    )
    :vars
    (
      ?auto_95603 - TRUCK
      ?auto_95604 - LOCATION
      ?auto_95602 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95603 ?auto_95604 ) ( IN-CITY ?auto_95604 ?auto_95602 ) ( IN-CITY ?auto_95597 ?auto_95602 ) ( not ( = ?auto_95597 ?auto_95604 ) ) ( OBJ-AT ?auto_95600 ?auto_95597 ) ( not ( = ?auto_95600 ?auto_95598 ) ) ( OBJ-AT ?auto_95598 ?auto_95604 ) ( OBJ-AT ?auto_95599 ?auto_95597 ) ( OBJ-AT ?auto_95601 ?auto_95597 ) ( not ( = ?auto_95598 ?auto_95599 ) ) ( not ( = ?auto_95598 ?auto_95601 ) ) ( not ( = ?auto_95599 ?auto_95600 ) ) ( not ( = ?auto_95599 ?auto_95601 ) ) ( not ( = ?auto_95600 ?auto_95601 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95600 ?auto_95598 ?auto_95597 )
      ( DELIVER-4PKG-VERIFY ?auto_95598 ?auto_95599 ?auto_95600 ?auto_95601 ?auto_95597 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95663 - OBJ
      ?auto_95662 - LOCATION
    )
    :vars
    (
      ?auto_95667 - LOCATION
      ?auto_95665 - CITY
      ?auto_95664 - OBJ
      ?auto_95666 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95667 ?auto_95665 ) ( IN-CITY ?auto_95662 ?auto_95665 ) ( not ( = ?auto_95662 ?auto_95667 ) ) ( OBJ-AT ?auto_95664 ?auto_95662 ) ( not ( = ?auto_95664 ?auto_95663 ) ) ( OBJ-AT ?auto_95663 ?auto_95667 ) ( TRUCK-AT ?auto_95666 ?auto_95662 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_95666 ?auto_95662 ?auto_95667 ?auto_95665 )
      ( DELIVER-2PKG ?auto_95664 ?auto_95663 ?auto_95662 )
      ( DELIVER-1PKG-VERIFY ?auto_95663 ?auto_95662 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95669 - OBJ
      ?auto_95670 - OBJ
      ?auto_95668 - LOCATION
    )
    :vars
    (
      ?auto_95671 - LOCATION
      ?auto_95673 - CITY
      ?auto_95672 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95671 ?auto_95673 ) ( IN-CITY ?auto_95668 ?auto_95673 ) ( not ( = ?auto_95668 ?auto_95671 ) ) ( OBJ-AT ?auto_95669 ?auto_95668 ) ( not ( = ?auto_95669 ?auto_95670 ) ) ( OBJ-AT ?auto_95670 ?auto_95671 ) ( TRUCK-AT ?auto_95672 ?auto_95668 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95670 ?auto_95668 )
      ( DELIVER-2PKG-VERIFY ?auto_95669 ?auto_95670 ?auto_95668 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95675 - OBJ
      ?auto_95676 - OBJ
      ?auto_95674 - LOCATION
    )
    :vars
    (
      ?auto_95679 - LOCATION
      ?auto_95677 - CITY
      ?auto_95678 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95679 ?auto_95677 ) ( IN-CITY ?auto_95674 ?auto_95677 ) ( not ( = ?auto_95674 ?auto_95679 ) ) ( OBJ-AT ?auto_95676 ?auto_95674 ) ( not ( = ?auto_95676 ?auto_95675 ) ) ( OBJ-AT ?auto_95675 ?auto_95679 ) ( TRUCK-AT ?auto_95678 ?auto_95674 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95676 ?auto_95675 ?auto_95674 )
      ( DELIVER-2PKG-VERIFY ?auto_95675 ?auto_95676 ?auto_95674 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95688 - OBJ
      ?auto_95689 - OBJ
      ?auto_95690 - OBJ
      ?auto_95687 - LOCATION
    )
    :vars
    (
      ?auto_95693 - LOCATION
      ?auto_95691 - CITY
      ?auto_95692 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95693 ?auto_95691 ) ( IN-CITY ?auto_95687 ?auto_95691 ) ( not ( = ?auto_95687 ?auto_95693 ) ) ( OBJ-AT ?auto_95688 ?auto_95687 ) ( not ( = ?auto_95688 ?auto_95690 ) ) ( OBJ-AT ?auto_95690 ?auto_95693 ) ( TRUCK-AT ?auto_95692 ?auto_95687 ) ( OBJ-AT ?auto_95689 ?auto_95687 ) ( not ( = ?auto_95688 ?auto_95689 ) ) ( not ( = ?auto_95689 ?auto_95690 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95688 ?auto_95690 ?auto_95687 )
      ( DELIVER-3PKG-VERIFY ?auto_95688 ?auto_95689 ?auto_95690 ?auto_95687 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95695 - OBJ
      ?auto_95696 - OBJ
      ?auto_95697 - OBJ
      ?auto_95694 - LOCATION
    )
    :vars
    (
      ?auto_95700 - LOCATION
      ?auto_95698 - CITY
      ?auto_95699 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95700 ?auto_95698 ) ( IN-CITY ?auto_95694 ?auto_95698 ) ( not ( = ?auto_95694 ?auto_95700 ) ) ( OBJ-AT ?auto_95697 ?auto_95694 ) ( not ( = ?auto_95697 ?auto_95696 ) ) ( OBJ-AT ?auto_95696 ?auto_95700 ) ( TRUCK-AT ?auto_95699 ?auto_95694 ) ( OBJ-AT ?auto_95695 ?auto_95694 ) ( not ( = ?auto_95695 ?auto_95696 ) ) ( not ( = ?auto_95695 ?auto_95697 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95697 ?auto_95696 ?auto_95694 )
      ( DELIVER-3PKG-VERIFY ?auto_95695 ?auto_95696 ?auto_95697 ?auto_95694 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95709 - OBJ
      ?auto_95710 - OBJ
      ?auto_95711 - OBJ
      ?auto_95708 - LOCATION
    )
    :vars
    (
      ?auto_95714 - LOCATION
      ?auto_95712 - CITY
      ?auto_95713 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95714 ?auto_95712 ) ( IN-CITY ?auto_95708 ?auto_95712 ) ( not ( = ?auto_95708 ?auto_95714 ) ) ( OBJ-AT ?auto_95711 ?auto_95708 ) ( not ( = ?auto_95711 ?auto_95709 ) ) ( OBJ-AT ?auto_95709 ?auto_95714 ) ( TRUCK-AT ?auto_95713 ?auto_95708 ) ( OBJ-AT ?auto_95710 ?auto_95708 ) ( not ( = ?auto_95709 ?auto_95710 ) ) ( not ( = ?auto_95710 ?auto_95711 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95711 ?auto_95709 ?auto_95708 )
      ( DELIVER-3PKG-VERIFY ?auto_95709 ?auto_95710 ?auto_95711 ?auto_95708 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95738 - OBJ
      ?auto_95739 - OBJ
      ?auto_95740 - OBJ
      ?auto_95741 - OBJ
      ?auto_95737 - LOCATION
    )
    :vars
    (
      ?auto_95744 - LOCATION
      ?auto_95742 - CITY
      ?auto_95743 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95744 ?auto_95742 ) ( IN-CITY ?auto_95737 ?auto_95742 ) ( not ( = ?auto_95737 ?auto_95744 ) ) ( OBJ-AT ?auto_95738 ?auto_95737 ) ( not ( = ?auto_95738 ?auto_95741 ) ) ( OBJ-AT ?auto_95741 ?auto_95744 ) ( TRUCK-AT ?auto_95743 ?auto_95737 ) ( OBJ-AT ?auto_95739 ?auto_95737 ) ( OBJ-AT ?auto_95740 ?auto_95737 ) ( not ( = ?auto_95738 ?auto_95739 ) ) ( not ( = ?auto_95738 ?auto_95740 ) ) ( not ( = ?auto_95739 ?auto_95740 ) ) ( not ( = ?auto_95739 ?auto_95741 ) ) ( not ( = ?auto_95740 ?auto_95741 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95738 ?auto_95741 ?auto_95737 )
      ( DELIVER-4PKG-VERIFY ?auto_95738 ?auto_95739 ?auto_95740 ?auto_95741 ?auto_95737 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95746 - OBJ
      ?auto_95747 - OBJ
      ?auto_95748 - OBJ
      ?auto_95749 - OBJ
      ?auto_95745 - LOCATION
    )
    :vars
    (
      ?auto_95752 - LOCATION
      ?auto_95750 - CITY
      ?auto_95751 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95752 ?auto_95750 ) ( IN-CITY ?auto_95745 ?auto_95750 ) ( not ( = ?auto_95745 ?auto_95752 ) ) ( OBJ-AT ?auto_95746 ?auto_95745 ) ( not ( = ?auto_95746 ?auto_95748 ) ) ( OBJ-AT ?auto_95748 ?auto_95752 ) ( TRUCK-AT ?auto_95751 ?auto_95745 ) ( OBJ-AT ?auto_95747 ?auto_95745 ) ( OBJ-AT ?auto_95749 ?auto_95745 ) ( not ( = ?auto_95746 ?auto_95747 ) ) ( not ( = ?auto_95746 ?auto_95749 ) ) ( not ( = ?auto_95747 ?auto_95748 ) ) ( not ( = ?auto_95747 ?auto_95749 ) ) ( not ( = ?auto_95748 ?auto_95749 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95746 ?auto_95748 ?auto_95745 )
      ( DELIVER-4PKG-VERIFY ?auto_95746 ?auto_95747 ?auto_95748 ?auto_95749 ?auto_95745 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95762 - OBJ
      ?auto_95763 - OBJ
      ?auto_95764 - OBJ
      ?auto_95765 - OBJ
      ?auto_95761 - LOCATION
    )
    :vars
    (
      ?auto_95768 - LOCATION
      ?auto_95766 - CITY
      ?auto_95767 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95768 ?auto_95766 ) ( IN-CITY ?auto_95761 ?auto_95766 ) ( not ( = ?auto_95761 ?auto_95768 ) ) ( OBJ-AT ?auto_95765 ?auto_95761 ) ( not ( = ?auto_95765 ?auto_95763 ) ) ( OBJ-AT ?auto_95763 ?auto_95768 ) ( TRUCK-AT ?auto_95767 ?auto_95761 ) ( OBJ-AT ?auto_95762 ?auto_95761 ) ( OBJ-AT ?auto_95764 ?auto_95761 ) ( not ( = ?auto_95762 ?auto_95763 ) ) ( not ( = ?auto_95762 ?auto_95764 ) ) ( not ( = ?auto_95762 ?auto_95765 ) ) ( not ( = ?auto_95763 ?auto_95764 ) ) ( not ( = ?auto_95764 ?auto_95765 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95765 ?auto_95763 ?auto_95761 )
      ( DELIVER-4PKG-VERIFY ?auto_95762 ?auto_95763 ?auto_95764 ?auto_95765 ?auto_95761 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95794 - OBJ
      ?auto_95795 - OBJ
      ?auto_95796 - OBJ
      ?auto_95797 - OBJ
      ?auto_95793 - LOCATION
    )
    :vars
    (
      ?auto_95800 - LOCATION
      ?auto_95798 - CITY
      ?auto_95799 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95800 ?auto_95798 ) ( IN-CITY ?auto_95793 ?auto_95798 ) ( not ( = ?auto_95793 ?auto_95800 ) ) ( OBJ-AT ?auto_95796 ?auto_95793 ) ( not ( = ?auto_95796 ?auto_95794 ) ) ( OBJ-AT ?auto_95794 ?auto_95800 ) ( TRUCK-AT ?auto_95799 ?auto_95793 ) ( OBJ-AT ?auto_95795 ?auto_95793 ) ( OBJ-AT ?auto_95797 ?auto_95793 ) ( not ( = ?auto_95794 ?auto_95795 ) ) ( not ( = ?auto_95794 ?auto_95797 ) ) ( not ( = ?auto_95795 ?auto_95796 ) ) ( not ( = ?auto_95795 ?auto_95797 ) ) ( not ( = ?auto_95796 ?auto_95797 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95796 ?auto_95794 ?auto_95793 )
      ( DELIVER-4PKG-VERIFY ?auto_95794 ?auto_95795 ?auto_95796 ?auto_95797 ?auto_95793 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95859 - OBJ
      ?auto_95858 - LOCATION
    )
    :vars
    (
      ?auto_95863 - LOCATION
      ?auto_95860 - CITY
      ?auto_95861 - OBJ
      ?auto_95862 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95863 ?auto_95860 ) ( IN-CITY ?auto_95858 ?auto_95860 ) ( not ( = ?auto_95858 ?auto_95863 ) ) ( not ( = ?auto_95861 ?auto_95859 ) ) ( OBJ-AT ?auto_95859 ?auto_95863 ) ( TRUCK-AT ?auto_95862 ?auto_95858 ) ( IN-TRUCK ?auto_95861 ?auto_95862 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95861 ?auto_95858 )
      ( DELIVER-2PKG ?auto_95861 ?auto_95859 ?auto_95858 )
      ( DELIVER-1PKG-VERIFY ?auto_95859 ?auto_95858 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95865 - OBJ
      ?auto_95866 - OBJ
      ?auto_95864 - LOCATION
    )
    :vars
    (
      ?auto_95867 - LOCATION
      ?auto_95868 - CITY
      ?auto_95869 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95867 ?auto_95868 ) ( IN-CITY ?auto_95864 ?auto_95868 ) ( not ( = ?auto_95864 ?auto_95867 ) ) ( not ( = ?auto_95865 ?auto_95866 ) ) ( OBJ-AT ?auto_95866 ?auto_95867 ) ( TRUCK-AT ?auto_95869 ?auto_95864 ) ( IN-TRUCK ?auto_95865 ?auto_95869 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95866 ?auto_95864 )
      ( DELIVER-2PKG-VERIFY ?auto_95865 ?auto_95866 ?auto_95864 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95871 - OBJ
      ?auto_95872 - OBJ
      ?auto_95870 - LOCATION
    )
    :vars
    (
      ?auto_95873 - LOCATION
      ?auto_95875 - CITY
      ?auto_95874 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95873 ?auto_95875 ) ( IN-CITY ?auto_95870 ?auto_95875 ) ( not ( = ?auto_95870 ?auto_95873 ) ) ( not ( = ?auto_95872 ?auto_95871 ) ) ( OBJ-AT ?auto_95871 ?auto_95873 ) ( TRUCK-AT ?auto_95874 ?auto_95870 ) ( IN-TRUCK ?auto_95872 ?auto_95874 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95872 ?auto_95871 ?auto_95870 )
      ( DELIVER-2PKG-VERIFY ?auto_95871 ?auto_95872 ?auto_95870 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96055 - OBJ
      ?auto_96054 - LOCATION
    )
    :vars
    (
      ?auto_96056 - LOCATION
      ?auto_96058 - CITY
      ?auto_96059 - OBJ
      ?auto_96057 - TRUCK
      ?auto_96060 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96056 ?auto_96058 ) ( IN-CITY ?auto_96054 ?auto_96058 ) ( not ( = ?auto_96054 ?auto_96056 ) ) ( not ( = ?auto_96059 ?auto_96055 ) ) ( OBJ-AT ?auto_96055 ?auto_96056 ) ( IN-TRUCK ?auto_96059 ?auto_96057 ) ( TRUCK-AT ?auto_96057 ?auto_96060 ) ( IN-CITY ?auto_96060 ?auto_96058 ) ( not ( = ?auto_96054 ?auto_96060 ) ) ( not ( = ?auto_96056 ?auto_96060 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_96057 ?auto_96060 ?auto_96054 ?auto_96058 )
      ( DELIVER-2PKG ?auto_96059 ?auto_96055 ?auto_96054 )
      ( DELIVER-1PKG-VERIFY ?auto_96055 ?auto_96054 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96062 - OBJ
      ?auto_96063 - OBJ
      ?auto_96061 - LOCATION
    )
    :vars
    (
      ?auto_96067 - LOCATION
      ?auto_96064 - CITY
      ?auto_96065 - TRUCK
      ?auto_96066 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96067 ?auto_96064 ) ( IN-CITY ?auto_96061 ?auto_96064 ) ( not ( = ?auto_96061 ?auto_96067 ) ) ( not ( = ?auto_96062 ?auto_96063 ) ) ( OBJ-AT ?auto_96063 ?auto_96067 ) ( IN-TRUCK ?auto_96062 ?auto_96065 ) ( TRUCK-AT ?auto_96065 ?auto_96066 ) ( IN-CITY ?auto_96066 ?auto_96064 ) ( not ( = ?auto_96061 ?auto_96066 ) ) ( not ( = ?auto_96067 ?auto_96066 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96063 ?auto_96061 )
      ( DELIVER-2PKG-VERIFY ?auto_96062 ?auto_96063 ?auto_96061 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96069 - OBJ
      ?auto_96070 - OBJ
      ?auto_96068 - LOCATION
    )
    :vars
    (
      ?auto_96073 - LOCATION
      ?auto_96074 - CITY
      ?auto_96072 - TRUCK
      ?auto_96071 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96073 ?auto_96074 ) ( IN-CITY ?auto_96068 ?auto_96074 ) ( not ( = ?auto_96068 ?auto_96073 ) ) ( not ( = ?auto_96070 ?auto_96069 ) ) ( OBJ-AT ?auto_96069 ?auto_96073 ) ( IN-TRUCK ?auto_96070 ?auto_96072 ) ( TRUCK-AT ?auto_96072 ?auto_96071 ) ( IN-CITY ?auto_96071 ?auto_96074 ) ( not ( = ?auto_96068 ?auto_96071 ) ) ( not ( = ?auto_96073 ?auto_96071 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96070 ?auto_96069 ?auto_96068 )
      ( DELIVER-2PKG-VERIFY ?auto_96069 ?auto_96070 ?auto_96068 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96277 - OBJ
      ?auto_96276 - LOCATION
    )
    :vars
    (
      ?auto_96280 - LOCATION
      ?auto_96281 - CITY
      ?auto_96282 - OBJ
      ?auto_96279 - TRUCK
      ?auto_96278 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96280 ?auto_96281 ) ( IN-CITY ?auto_96276 ?auto_96281 ) ( not ( = ?auto_96276 ?auto_96280 ) ) ( not ( = ?auto_96282 ?auto_96277 ) ) ( OBJ-AT ?auto_96277 ?auto_96280 ) ( TRUCK-AT ?auto_96279 ?auto_96278 ) ( IN-CITY ?auto_96278 ?auto_96281 ) ( not ( = ?auto_96276 ?auto_96278 ) ) ( not ( = ?auto_96280 ?auto_96278 ) ) ( OBJ-AT ?auto_96282 ?auto_96278 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_96282 ?auto_96279 ?auto_96278 )
      ( DELIVER-2PKG ?auto_96282 ?auto_96277 ?auto_96276 )
      ( DELIVER-1PKG-VERIFY ?auto_96277 ?auto_96276 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96284 - OBJ
      ?auto_96285 - OBJ
      ?auto_96283 - LOCATION
    )
    :vars
    (
      ?auto_96287 - LOCATION
      ?auto_96286 - CITY
      ?auto_96289 - TRUCK
      ?auto_96288 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96287 ?auto_96286 ) ( IN-CITY ?auto_96283 ?auto_96286 ) ( not ( = ?auto_96283 ?auto_96287 ) ) ( not ( = ?auto_96284 ?auto_96285 ) ) ( OBJ-AT ?auto_96285 ?auto_96287 ) ( TRUCK-AT ?auto_96289 ?auto_96288 ) ( IN-CITY ?auto_96288 ?auto_96286 ) ( not ( = ?auto_96283 ?auto_96288 ) ) ( not ( = ?auto_96287 ?auto_96288 ) ) ( OBJ-AT ?auto_96284 ?auto_96288 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96285 ?auto_96283 )
      ( DELIVER-2PKG-VERIFY ?auto_96284 ?auto_96285 ?auto_96283 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96291 - OBJ
      ?auto_96292 - OBJ
      ?auto_96290 - LOCATION
    )
    :vars
    (
      ?auto_96296 - LOCATION
      ?auto_96293 - CITY
      ?auto_96294 - TRUCK
      ?auto_96295 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96296 ?auto_96293 ) ( IN-CITY ?auto_96290 ?auto_96293 ) ( not ( = ?auto_96290 ?auto_96296 ) ) ( not ( = ?auto_96292 ?auto_96291 ) ) ( OBJ-AT ?auto_96291 ?auto_96296 ) ( TRUCK-AT ?auto_96294 ?auto_96295 ) ( IN-CITY ?auto_96295 ?auto_96293 ) ( not ( = ?auto_96290 ?auto_96295 ) ) ( not ( = ?auto_96296 ?auto_96295 ) ) ( OBJ-AT ?auto_96292 ?auto_96295 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96292 ?auto_96291 ?auto_96290 )
      ( DELIVER-2PKG-VERIFY ?auto_96291 ?auto_96292 ?auto_96290 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97636 - OBJ
      ?auto_97637 - OBJ
      ?auto_97638 - OBJ
      ?auto_97635 - LOCATION
    )
    :vars
    (
      ?auto_97640 - TRUCK
      ?auto_97641 - LOCATION
      ?auto_97639 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97638 ?auto_97640 ) ( TRUCK-AT ?auto_97640 ?auto_97641 ) ( IN-CITY ?auto_97641 ?auto_97639 ) ( IN-CITY ?auto_97635 ?auto_97639 ) ( not ( = ?auto_97635 ?auto_97641 ) ) ( OBJ-AT ?auto_97637 ?auto_97635 ) ( not ( = ?auto_97637 ?auto_97638 ) ) ( OBJ-AT ?auto_97636 ?auto_97635 ) ( not ( = ?auto_97636 ?auto_97637 ) ) ( not ( = ?auto_97636 ?auto_97638 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97637 ?auto_97638 ?auto_97635 )
      ( DELIVER-3PKG-VERIFY ?auto_97636 ?auto_97637 ?auto_97638 ?auto_97635 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97647 - OBJ
      ?auto_97648 - OBJ
      ?auto_97649 - OBJ
      ?auto_97646 - LOCATION
    )
    :vars
    (
      ?auto_97651 - TRUCK
      ?auto_97652 - LOCATION
      ?auto_97650 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97648 ?auto_97651 ) ( TRUCK-AT ?auto_97651 ?auto_97652 ) ( IN-CITY ?auto_97652 ?auto_97650 ) ( IN-CITY ?auto_97646 ?auto_97650 ) ( not ( = ?auto_97646 ?auto_97652 ) ) ( OBJ-AT ?auto_97647 ?auto_97646 ) ( not ( = ?auto_97647 ?auto_97648 ) ) ( OBJ-AT ?auto_97649 ?auto_97646 ) ( not ( = ?auto_97647 ?auto_97649 ) ) ( not ( = ?auto_97648 ?auto_97649 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97647 ?auto_97648 ?auto_97646 )
      ( DELIVER-3PKG-VERIFY ?auto_97647 ?auto_97648 ?auto_97649 ?auto_97646 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97669 - OBJ
      ?auto_97670 - OBJ
      ?auto_97671 - OBJ
      ?auto_97668 - LOCATION
    )
    :vars
    (
      ?auto_97673 - TRUCK
      ?auto_97675 - LOCATION
      ?auto_97672 - CITY
      ?auto_97674 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97671 ?auto_97673 ) ( TRUCK-AT ?auto_97673 ?auto_97675 ) ( IN-CITY ?auto_97675 ?auto_97672 ) ( IN-CITY ?auto_97668 ?auto_97672 ) ( not ( = ?auto_97668 ?auto_97675 ) ) ( OBJ-AT ?auto_97674 ?auto_97668 ) ( not ( = ?auto_97674 ?auto_97671 ) ) ( OBJ-AT ?auto_97669 ?auto_97668 ) ( OBJ-AT ?auto_97670 ?auto_97668 ) ( not ( = ?auto_97669 ?auto_97670 ) ) ( not ( = ?auto_97669 ?auto_97671 ) ) ( not ( = ?auto_97669 ?auto_97674 ) ) ( not ( = ?auto_97670 ?auto_97671 ) ) ( not ( = ?auto_97670 ?auto_97674 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97674 ?auto_97671 ?auto_97668 )
      ( DELIVER-3PKG-VERIFY ?auto_97669 ?auto_97670 ?auto_97671 ?auto_97668 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97681 - OBJ
      ?auto_97682 - OBJ
      ?auto_97683 - OBJ
      ?auto_97680 - LOCATION
    )
    :vars
    (
      ?auto_97685 - TRUCK
      ?auto_97687 - LOCATION
      ?auto_97684 - CITY
      ?auto_97686 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97682 ?auto_97685 ) ( TRUCK-AT ?auto_97685 ?auto_97687 ) ( IN-CITY ?auto_97687 ?auto_97684 ) ( IN-CITY ?auto_97680 ?auto_97684 ) ( not ( = ?auto_97680 ?auto_97687 ) ) ( OBJ-AT ?auto_97686 ?auto_97680 ) ( not ( = ?auto_97686 ?auto_97682 ) ) ( OBJ-AT ?auto_97681 ?auto_97680 ) ( OBJ-AT ?auto_97683 ?auto_97680 ) ( not ( = ?auto_97681 ?auto_97682 ) ) ( not ( = ?auto_97681 ?auto_97683 ) ) ( not ( = ?auto_97681 ?auto_97686 ) ) ( not ( = ?auto_97682 ?auto_97683 ) ) ( not ( = ?auto_97683 ?auto_97686 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97686 ?auto_97682 ?auto_97680 )
      ( DELIVER-3PKG-VERIFY ?auto_97681 ?auto_97682 ?auto_97683 ?auto_97680 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97719 - OBJ
      ?auto_97720 - OBJ
      ?auto_97721 - OBJ
      ?auto_97718 - LOCATION
    )
    :vars
    (
      ?auto_97723 - TRUCK
      ?auto_97725 - LOCATION
      ?auto_97722 - CITY
      ?auto_97724 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97719 ?auto_97723 ) ( TRUCK-AT ?auto_97723 ?auto_97725 ) ( IN-CITY ?auto_97725 ?auto_97722 ) ( IN-CITY ?auto_97718 ?auto_97722 ) ( not ( = ?auto_97718 ?auto_97725 ) ) ( OBJ-AT ?auto_97724 ?auto_97718 ) ( not ( = ?auto_97724 ?auto_97719 ) ) ( OBJ-AT ?auto_97720 ?auto_97718 ) ( OBJ-AT ?auto_97721 ?auto_97718 ) ( not ( = ?auto_97719 ?auto_97720 ) ) ( not ( = ?auto_97719 ?auto_97721 ) ) ( not ( = ?auto_97720 ?auto_97721 ) ) ( not ( = ?auto_97720 ?auto_97724 ) ) ( not ( = ?auto_97721 ?auto_97724 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97724 ?auto_97719 ?auto_97718 )
      ( DELIVER-3PKG-VERIFY ?auto_97719 ?auto_97720 ?auto_97721 ?auto_97718 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_97766 - OBJ
      ?auto_97767 - OBJ
      ?auto_97768 - OBJ
      ?auto_97769 - OBJ
      ?auto_97765 - LOCATION
    )
    :vars
    (
      ?auto_97771 - TRUCK
      ?auto_97772 - LOCATION
      ?auto_97770 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97769 ?auto_97771 ) ( TRUCK-AT ?auto_97771 ?auto_97772 ) ( IN-CITY ?auto_97772 ?auto_97770 ) ( IN-CITY ?auto_97765 ?auto_97770 ) ( not ( = ?auto_97765 ?auto_97772 ) ) ( OBJ-AT ?auto_97767 ?auto_97765 ) ( not ( = ?auto_97767 ?auto_97769 ) ) ( OBJ-AT ?auto_97766 ?auto_97765 ) ( OBJ-AT ?auto_97768 ?auto_97765 ) ( not ( = ?auto_97766 ?auto_97767 ) ) ( not ( = ?auto_97766 ?auto_97768 ) ) ( not ( = ?auto_97766 ?auto_97769 ) ) ( not ( = ?auto_97767 ?auto_97768 ) ) ( not ( = ?auto_97768 ?auto_97769 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97767 ?auto_97769 ?auto_97765 )
      ( DELIVER-4PKG-VERIFY ?auto_97766 ?auto_97767 ?auto_97768 ?auto_97769 ?auto_97765 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_97782 - OBJ
      ?auto_97783 - OBJ
      ?auto_97784 - OBJ
      ?auto_97785 - OBJ
      ?auto_97781 - LOCATION
    )
    :vars
    (
      ?auto_97787 - TRUCK
      ?auto_97788 - LOCATION
      ?auto_97786 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97784 ?auto_97787 ) ( TRUCK-AT ?auto_97787 ?auto_97788 ) ( IN-CITY ?auto_97788 ?auto_97786 ) ( IN-CITY ?auto_97781 ?auto_97786 ) ( not ( = ?auto_97781 ?auto_97788 ) ) ( OBJ-AT ?auto_97782 ?auto_97781 ) ( not ( = ?auto_97782 ?auto_97784 ) ) ( OBJ-AT ?auto_97783 ?auto_97781 ) ( OBJ-AT ?auto_97785 ?auto_97781 ) ( not ( = ?auto_97782 ?auto_97783 ) ) ( not ( = ?auto_97782 ?auto_97785 ) ) ( not ( = ?auto_97783 ?auto_97784 ) ) ( not ( = ?auto_97783 ?auto_97785 ) ) ( not ( = ?auto_97784 ?auto_97785 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97782 ?auto_97784 ?auto_97781 )
      ( DELIVER-4PKG-VERIFY ?auto_97782 ?auto_97783 ?auto_97784 ?auto_97785 ?auto_97781 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_97798 - OBJ
      ?auto_97799 - OBJ
      ?auto_97800 - OBJ
      ?auto_97801 - OBJ
      ?auto_97797 - LOCATION
    )
    :vars
    (
      ?auto_97803 - TRUCK
      ?auto_97804 - LOCATION
      ?auto_97802 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97801 ?auto_97803 ) ( TRUCK-AT ?auto_97803 ?auto_97804 ) ( IN-CITY ?auto_97804 ?auto_97802 ) ( IN-CITY ?auto_97797 ?auto_97802 ) ( not ( = ?auto_97797 ?auto_97804 ) ) ( OBJ-AT ?auto_97798 ?auto_97797 ) ( not ( = ?auto_97798 ?auto_97801 ) ) ( OBJ-AT ?auto_97799 ?auto_97797 ) ( OBJ-AT ?auto_97800 ?auto_97797 ) ( not ( = ?auto_97798 ?auto_97799 ) ) ( not ( = ?auto_97798 ?auto_97800 ) ) ( not ( = ?auto_97799 ?auto_97800 ) ) ( not ( = ?auto_97799 ?auto_97801 ) ) ( not ( = ?auto_97800 ?auto_97801 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97798 ?auto_97801 ?auto_97797 )
      ( DELIVER-4PKG-VERIFY ?auto_97798 ?auto_97799 ?auto_97800 ?auto_97801 ?auto_97797 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_97814 - OBJ
      ?auto_97815 - OBJ
      ?auto_97816 - OBJ
      ?auto_97817 - OBJ
      ?auto_97813 - LOCATION
    )
    :vars
    (
      ?auto_97819 - TRUCK
      ?auto_97820 - LOCATION
      ?auto_97818 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97816 ?auto_97819 ) ( TRUCK-AT ?auto_97819 ?auto_97820 ) ( IN-CITY ?auto_97820 ?auto_97818 ) ( IN-CITY ?auto_97813 ?auto_97818 ) ( not ( = ?auto_97813 ?auto_97820 ) ) ( OBJ-AT ?auto_97817 ?auto_97813 ) ( not ( = ?auto_97817 ?auto_97816 ) ) ( OBJ-AT ?auto_97814 ?auto_97813 ) ( OBJ-AT ?auto_97815 ?auto_97813 ) ( not ( = ?auto_97814 ?auto_97815 ) ) ( not ( = ?auto_97814 ?auto_97816 ) ) ( not ( = ?auto_97814 ?auto_97817 ) ) ( not ( = ?auto_97815 ?auto_97816 ) ) ( not ( = ?auto_97815 ?auto_97817 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97817 ?auto_97816 ?auto_97813 )
      ( DELIVER-4PKG-VERIFY ?auto_97814 ?auto_97815 ?auto_97816 ?auto_97817 ?auto_97813 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_97838 - OBJ
      ?auto_97839 - OBJ
      ?auto_97840 - OBJ
      ?auto_97841 - OBJ
      ?auto_97837 - LOCATION
    )
    :vars
    (
      ?auto_97843 - TRUCK
      ?auto_97844 - LOCATION
      ?auto_97842 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97839 ?auto_97843 ) ( TRUCK-AT ?auto_97843 ?auto_97844 ) ( IN-CITY ?auto_97844 ?auto_97842 ) ( IN-CITY ?auto_97837 ?auto_97842 ) ( not ( = ?auto_97837 ?auto_97844 ) ) ( OBJ-AT ?auto_97841 ?auto_97837 ) ( not ( = ?auto_97841 ?auto_97839 ) ) ( OBJ-AT ?auto_97838 ?auto_97837 ) ( OBJ-AT ?auto_97840 ?auto_97837 ) ( not ( = ?auto_97838 ?auto_97839 ) ) ( not ( = ?auto_97838 ?auto_97840 ) ) ( not ( = ?auto_97838 ?auto_97841 ) ) ( not ( = ?auto_97839 ?auto_97840 ) ) ( not ( = ?auto_97840 ?auto_97841 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97841 ?auto_97839 ?auto_97837 )
      ( DELIVER-4PKG-VERIFY ?auto_97838 ?auto_97839 ?auto_97840 ?auto_97841 ?auto_97837 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_97846 - OBJ
      ?auto_97847 - OBJ
      ?auto_97848 - OBJ
      ?auto_97849 - OBJ
      ?auto_97845 - LOCATION
    )
    :vars
    (
      ?auto_97851 - TRUCK
      ?auto_97852 - LOCATION
      ?auto_97850 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97847 ?auto_97851 ) ( TRUCK-AT ?auto_97851 ?auto_97852 ) ( IN-CITY ?auto_97852 ?auto_97850 ) ( IN-CITY ?auto_97845 ?auto_97850 ) ( not ( = ?auto_97845 ?auto_97852 ) ) ( OBJ-AT ?auto_97848 ?auto_97845 ) ( not ( = ?auto_97848 ?auto_97847 ) ) ( OBJ-AT ?auto_97846 ?auto_97845 ) ( OBJ-AT ?auto_97849 ?auto_97845 ) ( not ( = ?auto_97846 ?auto_97847 ) ) ( not ( = ?auto_97846 ?auto_97848 ) ) ( not ( = ?auto_97846 ?auto_97849 ) ) ( not ( = ?auto_97847 ?auto_97849 ) ) ( not ( = ?auto_97848 ?auto_97849 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97848 ?auto_97847 ?auto_97845 )
      ( DELIVER-4PKG-VERIFY ?auto_97846 ?auto_97847 ?auto_97848 ?auto_97849 ?auto_97845 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_97958 - OBJ
      ?auto_97959 - OBJ
      ?auto_97960 - OBJ
      ?auto_97961 - OBJ
      ?auto_97957 - LOCATION
    )
    :vars
    (
      ?auto_97963 - TRUCK
      ?auto_97965 - LOCATION
      ?auto_97962 - CITY
      ?auto_97964 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97961 ?auto_97963 ) ( TRUCK-AT ?auto_97963 ?auto_97965 ) ( IN-CITY ?auto_97965 ?auto_97962 ) ( IN-CITY ?auto_97957 ?auto_97962 ) ( not ( = ?auto_97957 ?auto_97965 ) ) ( OBJ-AT ?auto_97964 ?auto_97957 ) ( not ( = ?auto_97964 ?auto_97961 ) ) ( OBJ-AT ?auto_97958 ?auto_97957 ) ( OBJ-AT ?auto_97959 ?auto_97957 ) ( OBJ-AT ?auto_97960 ?auto_97957 ) ( not ( = ?auto_97958 ?auto_97959 ) ) ( not ( = ?auto_97958 ?auto_97960 ) ) ( not ( = ?auto_97958 ?auto_97961 ) ) ( not ( = ?auto_97958 ?auto_97964 ) ) ( not ( = ?auto_97959 ?auto_97960 ) ) ( not ( = ?auto_97959 ?auto_97961 ) ) ( not ( = ?auto_97959 ?auto_97964 ) ) ( not ( = ?auto_97960 ?auto_97961 ) ) ( not ( = ?auto_97960 ?auto_97964 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97964 ?auto_97961 ?auto_97957 )
      ( DELIVER-4PKG-VERIFY ?auto_97958 ?auto_97959 ?auto_97960 ?auto_97961 ?auto_97957 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_97975 - OBJ
      ?auto_97976 - OBJ
      ?auto_97977 - OBJ
      ?auto_97978 - OBJ
      ?auto_97974 - LOCATION
    )
    :vars
    (
      ?auto_97980 - TRUCK
      ?auto_97982 - LOCATION
      ?auto_97979 - CITY
      ?auto_97981 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97977 ?auto_97980 ) ( TRUCK-AT ?auto_97980 ?auto_97982 ) ( IN-CITY ?auto_97982 ?auto_97979 ) ( IN-CITY ?auto_97974 ?auto_97979 ) ( not ( = ?auto_97974 ?auto_97982 ) ) ( OBJ-AT ?auto_97981 ?auto_97974 ) ( not ( = ?auto_97981 ?auto_97977 ) ) ( OBJ-AT ?auto_97975 ?auto_97974 ) ( OBJ-AT ?auto_97976 ?auto_97974 ) ( OBJ-AT ?auto_97978 ?auto_97974 ) ( not ( = ?auto_97975 ?auto_97976 ) ) ( not ( = ?auto_97975 ?auto_97977 ) ) ( not ( = ?auto_97975 ?auto_97978 ) ) ( not ( = ?auto_97975 ?auto_97981 ) ) ( not ( = ?auto_97976 ?auto_97977 ) ) ( not ( = ?auto_97976 ?auto_97978 ) ) ( not ( = ?auto_97976 ?auto_97981 ) ) ( not ( = ?auto_97977 ?auto_97978 ) ) ( not ( = ?auto_97978 ?auto_97981 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97981 ?auto_97977 ?auto_97974 )
      ( DELIVER-4PKG-VERIFY ?auto_97975 ?auto_97976 ?auto_97977 ?auto_97978 ?auto_97974 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98025 - OBJ
      ?auto_98026 - OBJ
      ?auto_98027 - OBJ
      ?auto_98028 - OBJ
      ?auto_98024 - LOCATION
    )
    :vars
    (
      ?auto_98030 - TRUCK
      ?auto_98032 - LOCATION
      ?auto_98029 - CITY
      ?auto_98031 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98026 ?auto_98030 ) ( TRUCK-AT ?auto_98030 ?auto_98032 ) ( IN-CITY ?auto_98032 ?auto_98029 ) ( IN-CITY ?auto_98024 ?auto_98029 ) ( not ( = ?auto_98024 ?auto_98032 ) ) ( OBJ-AT ?auto_98031 ?auto_98024 ) ( not ( = ?auto_98031 ?auto_98026 ) ) ( OBJ-AT ?auto_98025 ?auto_98024 ) ( OBJ-AT ?auto_98027 ?auto_98024 ) ( OBJ-AT ?auto_98028 ?auto_98024 ) ( not ( = ?auto_98025 ?auto_98026 ) ) ( not ( = ?auto_98025 ?auto_98027 ) ) ( not ( = ?auto_98025 ?auto_98028 ) ) ( not ( = ?auto_98025 ?auto_98031 ) ) ( not ( = ?auto_98026 ?auto_98027 ) ) ( not ( = ?auto_98026 ?auto_98028 ) ) ( not ( = ?auto_98027 ?auto_98028 ) ) ( not ( = ?auto_98027 ?auto_98031 ) ) ( not ( = ?auto_98028 ?auto_98031 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98031 ?auto_98026 ?auto_98024 )
      ( DELIVER-4PKG-VERIFY ?auto_98025 ?auto_98026 ?auto_98027 ?auto_98028 ?auto_98024 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98069 - OBJ
      ?auto_98070 - OBJ
      ?auto_98071 - OBJ
      ?auto_98072 - OBJ
      ?auto_98068 - LOCATION
    )
    :vars
    (
      ?auto_98074 - TRUCK
      ?auto_98075 - LOCATION
      ?auto_98073 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98069 ?auto_98074 ) ( TRUCK-AT ?auto_98074 ?auto_98075 ) ( IN-CITY ?auto_98075 ?auto_98073 ) ( IN-CITY ?auto_98068 ?auto_98073 ) ( not ( = ?auto_98068 ?auto_98075 ) ) ( OBJ-AT ?auto_98071 ?auto_98068 ) ( not ( = ?auto_98071 ?auto_98069 ) ) ( OBJ-AT ?auto_98070 ?auto_98068 ) ( OBJ-AT ?auto_98072 ?auto_98068 ) ( not ( = ?auto_98069 ?auto_98070 ) ) ( not ( = ?auto_98069 ?auto_98072 ) ) ( not ( = ?auto_98070 ?auto_98071 ) ) ( not ( = ?auto_98070 ?auto_98072 ) ) ( not ( = ?auto_98071 ?auto_98072 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98071 ?auto_98069 ?auto_98068 )
      ( DELIVER-4PKG-VERIFY ?auto_98069 ?auto_98070 ?auto_98071 ?auto_98072 ?auto_98068 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98093 - OBJ
      ?auto_98094 - OBJ
      ?auto_98095 - OBJ
      ?auto_98096 - OBJ
      ?auto_98092 - LOCATION
    )
    :vars
    (
      ?auto_98098 - TRUCK
      ?auto_98099 - LOCATION
      ?auto_98097 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98093 ?auto_98098 ) ( TRUCK-AT ?auto_98098 ?auto_98099 ) ( IN-CITY ?auto_98099 ?auto_98097 ) ( IN-CITY ?auto_98092 ?auto_98097 ) ( not ( = ?auto_98092 ?auto_98099 ) ) ( OBJ-AT ?auto_98094 ?auto_98092 ) ( not ( = ?auto_98094 ?auto_98093 ) ) ( OBJ-AT ?auto_98095 ?auto_98092 ) ( OBJ-AT ?auto_98096 ?auto_98092 ) ( not ( = ?auto_98093 ?auto_98095 ) ) ( not ( = ?auto_98093 ?auto_98096 ) ) ( not ( = ?auto_98094 ?auto_98095 ) ) ( not ( = ?auto_98094 ?auto_98096 ) ) ( not ( = ?auto_98095 ?auto_98096 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98094 ?auto_98093 ?auto_98092 )
      ( DELIVER-4PKG-VERIFY ?auto_98093 ?auto_98094 ?auto_98095 ?auto_98096 ?auto_98092 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98173 - OBJ
      ?auto_98174 - OBJ
      ?auto_98175 - OBJ
      ?auto_98176 - OBJ
      ?auto_98172 - LOCATION
    )
    :vars
    (
      ?auto_98178 - TRUCK
      ?auto_98180 - LOCATION
      ?auto_98177 - CITY
      ?auto_98179 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98173 ?auto_98178 ) ( TRUCK-AT ?auto_98178 ?auto_98180 ) ( IN-CITY ?auto_98180 ?auto_98177 ) ( IN-CITY ?auto_98172 ?auto_98177 ) ( not ( = ?auto_98172 ?auto_98180 ) ) ( OBJ-AT ?auto_98179 ?auto_98172 ) ( not ( = ?auto_98179 ?auto_98173 ) ) ( OBJ-AT ?auto_98174 ?auto_98172 ) ( OBJ-AT ?auto_98175 ?auto_98172 ) ( OBJ-AT ?auto_98176 ?auto_98172 ) ( not ( = ?auto_98173 ?auto_98174 ) ) ( not ( = ?auto_98173 ?auto_98175 ) ) ( not ( = ?auto_98173 ?auto_98176 ) ) ( not ( = ?auto_98174 ?auto_98175 ) ) ( not ( = ?auto_98174 ?auto_98176 ) ) ( not ( = ?auto_98174 ?auto_98179 ) ) ( not ( = ?auto_98175 ?auto_98176 ) ) ( not ( = ?auto_98175 ?auto_98179 ) ) ( not ( = ?auto_98176 ?auto_98179 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98179 ?auto_98173 ?auto_98172 )
      ( DELIVER-4PKG-VERIFY ?auto_98173 ?auto_98174 ?auto_98175 ?auto_98176 ?auto_98172 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98324 - OBJ
      ?auto_98325 - OBJ
      ?auto_98326 - OBJ
      ?auto_98323 - LOCATION
    )
    :vars
    (
      ?auto_98328 - TRUCK
      ?auto_98329 - LOCATION
      ?auto_98327 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98328 ?auto_98329 ) ( IN-CITY ?auto_98329 ?auto_98327 ) ( IN-CITY ?auto_98323 ?auto_98327 ) ( not ( = ?auto_98323 ?auto_98329 ) ) ( OBJ-AT ?auto_98325 ?auto_98323 ) ( not ( = ?auto_98325 ?auto_98326 ) ) ( OBJ-AT ?auto_98326 ?auto_98329 ) ( OBJ-AT ?auto_98324 ?auto_98323 ) ( not ( = ?auto_98324 ?auto_98325 ) ) ( not ( = ?auto_98324 ?auto_98326 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98325 ?auto_98326 ?auto_98323 )
      ( DELIVER-3PKG-VERIFY ?auto_98324 ?auto_98325 ?auto_98326 ?auto_98323 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98335 - OBJ
      ?auto_98336 - OBJ
      ?auto_98337 - OBJ
      ?auto_98334 - LOCATION
    )
    :vars
    (
      ?auto_98339 - TRUCK
      ?auto_98340 - LOCATION
      ?auto_98338 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98339 ?auto_98340 ) ( IN-CITY ?auto_98340 ?auto_98338 ) ( IN-CITY ?auto_98334 ?auto_98338 ) ( not ( = ?auto_98334 ?auto_98340 ) ) ( OBJ-AT ?auto_98335 ?auto_98334 ) ( not ( = ?auto_98335 ?auto_98336 ) ) ( OBJ-AT ?auto_98336 ?auto_98340 ) ( OBJ-AT ?auto_98337 ?auto_98334 ) ( not ( = ?auto_98335 ?auto_98337 ) ) ( not ( = ?auto_98336 ?auto_98337 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98335 ?auto_98336 ?auto_98334 )
      ( DELIVER-3PKG-VERIFY ?auto_98335 ?auto_98336 ?auto_98337 ?auto_98334 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98357 - OBJ
      ?auto_98358 - OBJ
      ?auto_98359 - OBJ
      ?auto_98356 - LOCATION
    )
    :vars
    (
      ?auto_98361 - TRUCK
      ?auto_98362 - LOCATION
      ?auto_98360 - CITY
      ?auto_98363 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98361 ?auto_98362 ) ( IN-CITY ?auto_98362 ?auto_98360 ) ( IN-CITY ?auto_98356 ?auto_98360 ) ( not ( = ?auto_98356 ?auto_98362 ) ) ( OBJ-AT ?auto_98363 ?auto_98356 ) ( not ( = ?auto_98363 ?auto_98359 ) ) ( OBJ-AT ?auto_98359 ?auto_98362 ) ( OBJ-AT ?auto_98357 ?auto_98356 ) ( OBJ-AT ?auto_98358 ?auto_98356 ) ( not ( = ?auto_98357 ?auto_98358 ) ) ( not ( = ?auto_98357 ?auto_98359 ) ) ( not ( = ?auto_98357 ?auto_98363 ) ) ( not ( = ?auto_98358 ?auto_98359 ) ) ( not ( = ?auto_98358 ?auto_98363 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98363 ?auto_98359 ?auto_98356 )
      ( DELIVER-3PKG-VERIFY ?auto_98357 ?auto_98358 ?auto_98359 ?auto_98356 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98369 - OBJ
      ?auto_98370 - OBJ
      ?auto_98371 - OBJ
      ?auto_98368 - LOCATION
    )
    :vars
    (
      ?auto_98373 - TRUCK
      ?auto_98374 - LOCATION
      ?auto_98372 - CITY
      ?auto_98375 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98373 ?auto_98374 ) ( IN-CITY ?auto_98374 ?auto_98372 ) ( IN-CITY ?auto_98368 ?auto_98372 ) ( not ( = ?auto_98368 ?auto_98374 ) ) ( OBJ-AT ?auto_98375 ?auto_98368 ) ( not ( = ?auto_98375 ?auto_98370 ) ) ( OBJ-AT ?auto_98370 ?auto_98374 ) ( OBJ-AT ?auto_98369 ?auto_98368 ) ( OBJ-AT ?auto_98371 ?auto_98368 ) ( not ( = ?auto_98369 ?auto_98370 ) ) ( not ( = ?auto_98369 ?auto_98371 ) ) ( not ( = ?auto_98369 ?auto_98375 ) ) ( not ( = ?auto_98370 ?auto_98371 ) ) ( not ( = ?auto_98371 ?auto_98375 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98375 ?auto_98370 ?auto_98368 )
      ( DELIVER-3PKG-VERIFY ?auto_98369 ?auto_98370 ?auto_98371 ?auto_98368 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98407 - OBJ
      ?auto_98408 - OBJ
      ?auto_98409 - OBJ
      ?auto_98406 - LOCATION
    )
    :vars
    (
      ?auto_98411 - TRUCK
      ?auto_98412 - LOCATION
      ?auto_98410 - CITY
      ?auto_98413 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98411 ?auto_98412 ) ( IN-CITY ?auto_98412 ?auto_98410 ) ( IN-CITY ?auto_98406 ?auto_98410 ) ( not ( = ?auto_98406 ?auto_98412 ) ) ( OBJ-AT ?auto_98413 ?auto_98406 ) ( not ( = ?auto_98413 ?auto_98407 ) ) ( OBJ-AT ?auto_98407 ?auto_98412 ) ( OBJ-AT ?auto_98408 ?auto_98406 ) ( OBJ-AT ?auto_98409 ?auto_98406 ) ( not ( = ?auto_98407 ?auto_98408 ) ) ( not ( = ?auto_98407 ?auto_98409 ) ) ( not ( = ?auto_98408 ?auto_98409 ) ) ( not ( = ?auto_98408 ?auto_98413 ) ) ( not ( = ?auto_98409 ?auto_98413 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98413 ?auto_98407 ?auto_98406 )
      ( DELIVER-3PKG-VERIFY ?auto_98407 ?auto_98408 ?auto_98409 ?auto_98406 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98454 - OBJ
      ?auto_98455 - OBJ
      ?auto_98456 - OBJ
      ?auto_98457 - OBJ
      ?auto_98453 - LOCATION
    )
    :vars
    (
      ?auto_98459 - TRUCK
      ?auto_98460 - LOCATION
      ?auto_98458 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98459 ?auto_98460 ) ( IN-CITY ?auto_98460 ?auto_98458 ) ( IN-CITY ?auto_98453 ?auto_98458 ) ( not ( = ?auto_98453 ?auto_98460 ) ) ( OBJ-AT ?auto_98454 ?auto_98453 ) ( not ( = ?auto_98454 ?auto_98457 ) ) ( OBJ-AT ?auto_98457 ?auto_98460 ) ( OBJ-AT ?auto_98455 ?auto_98453 ) ( OBJ-AT ?auto_98456 ?auto_98453 ) ( not ( = ?auto_98454 ?auto_98455 ) ) ( not ( = ?auto_98454 ?auto_98456 ) ) ( not ( = ?auto_98455 ?auto_98456 ) ) ( not ( = ?auto_98455 ?auto_98457 ) ) ( not ( = ?auto_98456 ?auto_98457 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98454 ?auto_98457 ?auto_98453 )
      ( DELIVER-4PKG-VERIFY ?auto_98454 ?auto_98455 ?auto_98456 ?auto_98457 ?auto_98453 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98462 - OBJ
      ?auto_98463 - OBJ
      ?auto_98464 - OBJ
      ?auto_98465 - OBJ
      ?auto_98461 - LOCATION
    )
    :vars
    (
      ?auto_98467 - TRUCK
      ?auto_98468 - LOCATION
      ?auto_98466 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98467 ?auto_98468 ) ( IN-CITY ?auto_98468 ?auto_98466 ) ( IN-CITY ?auto_98461 ?auto_98466 ) ( not ( = ?auto_98461 ?auto_98468 ) ) ( OBJ-AT ?auto_98465 ?auto_98461 ) ( not ( = ?auto_98465 ?auto_98464 ) ) ( OBJ-AT ?auto_98464 ?auto_98468 ) ( OBJ-AT ?auto_98462 ?auto_98461 ) ( OBJ-AT ?auto_98463 ?auto_98461 ) ( not ( = ?auto_98462 ?auto_98463 ) ) ( not ( = ?auto_98462 ?auto_98464 ) ) ( not ( = ?auto_98462 ?auto_98465 ) ) ( not ( = ?auto_98463 ?auto_98464 ) ) ( not ( = ?auto_98463 ?auto_98465 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98465 ?auto_98464 ?auto_98461 )
      ( DELIVER-4PKG-VERIFY ?auto_98462 ?auto_98463 ?auto_98464 ?auto_98465 ?auto_98461 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98470 - OBJ
      ?auto_98471 - OBJ
      ?auto_98472 - OBJ
      ?auto_98473 - OBJ
      ?auto_98469 - LOCATION
    )
    :vars
    (
      ?auto_98475 - TRUCK
      ?auto_98476 - LOCATION
      ?auto_98474 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98475 ?auto_98476 ) ( IN-CITY ?auto_98476 ?auto_98474 ) ( IN-CITY ?auto_98469 ?auto_98474 ) ( not ( = ?auto_98469 ?auto_98476 ) ) ( OBJ-AT ?auto_98470 ?auto_98469 ) ( not ( = ?auto_98470 ?auto_98472 ) ) ( OBJ-AT ?auto_98472 ?auto_98476 ) ( OBJ-AT ?auto_98471 ?auto_98469 ) ( OBJ-AT ?auto_98473 ?auto_98469 ) ( not ( = ?auto_98470 ?auto_98471 ) ) ( not ( = ?auto_98470 ?auto_98473 ) ) ( not ( = ?auto_98471 ?auto_98472 ) ) ( not ( = ?auto_98471 ?auto_98473 ) ) ( not ( = ?auto_98472 ?auto_98473 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98470 ?auto_98472 ?auto_98469 )
      ( DELIVER-4PKG-VERIFY ?auto_98470 ?auto_98471 ?auto_98472 ?auto_98473 ?auto_98469 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98486 - OBJ
      ?auto_98487 - OBJ
      ?auto_98488 - OBJ
      ?auto_98489 - OBJ
      ?auto_98485 - LOCATION
    )
    :vars
    (
      ?auto_98491 - TRUCK
      ?auto_98492 - LOCATION
      ?auto_98490 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98491 ?auto_98492 ) ( IN-CITY ?auto_98492 ?auto_98490 ) ( IN-CITY ?auto_98485 ?auto_98490 ) ( not ( = ?auto_98485 ?auto_98492 ) ) ( OBJ-AT ?auto_98488 ?auto_98485 ) ( not ( = ?auto_98488 ?auto_98489 ) ) ( OBJ-AT ?auto_98489 ?auto_98492 ) ( OBJ-AT ?auto_98486 ?auto_98485 ) ( OBJ-AT ?auto_98487 ?auto_98485 ) ( not ( = ?auto_98486 ?auto_98487 ) ) ( not ( = ?auto_98486 ?auto_98488 ) ) ( not ( = ?auto_98486 ?auto_98489 ) ) ( not ( = ?auto_98487 ?auto_98488 ) ) ( not ( = ?auto_98487 ?auto_98489 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98488 ?auto_98489 ?auto_98485 )
      ( DELIVER-4PKG-VERIFY ?auto_98486 ?auto_98487 ?auto_98488 ?auto_98489 ?auto_98485 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98534 - OBJ
      ?auto_98535 - OBJ
      ?auto_98536 - OBJ
      ?auto_98537 - OBJ
      ?auto_98533 - LOCATION
    )
    :vars
    (
      ?auto_98539 - TRUCK
      ?auto_98540 - LOCATION
      ?auto_98538 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98539 ?auto_98540 ) ( IN-CITY ?auto_98540 ?auto_98538 ) ( IN-CITY ?auto_98533 ?auto_98538 ) ( not ( = ?auto_98533 ?auto_98540 ) ) ( OBJ-AT ?auto_98534 ?auto_98533 ) ( not ( = ?auto_98534 ?auto_98535 ) ) ( OBJ-AT ?auto_98535 ?auto_98540 ) ( OBJ-AT ?auto_98536 ?auto_98533 ) ( OBJ-AT ?auto_98537 ?auto_98533 ) ( not ( = ?auto_98534 ?auto_98536 ) ) ( not ( = ?auto_98534 ?auto_98537 ) ) ( not ( = ?auto_98535 ?auto_98536 ) ) ( not ( = ?auto_98535 ?auto_98537 ) ) ( not ( = ?auto_98536 ?auto_98537 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98534 ?auto_98535 ?auto_98533 )
      ( DELIVER-4PKG-VERIFY ?auto_98534 ?auto_98535 ?auto_98536 ?auto_98537 ?auto_98533 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98646 - OBJ
      ?auto_98647 - OBJ
      ?auto_98648 - OBJ
      ?auto_98649 - OBJ
      ?auto_98645 - LOCATION
    )
    :vars
    (
      ?auto_98651 - TRUCK
      ?auto_98652 - LOCATION
      ?auto_98650 - CITY
      ?auto_98653 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98651 ?auto_98652 ) ( IN-CITY ?auto_98652 ?auto_98650 ) ( IN-CITY ?auto_98645 ?auto_98650 ) ( not ( = ?auto_98645 ?auto_98652 ) ) ( OBJ-AT ?auto_98653 ?auto_98645 ) ( not ( = ?auto_98653 ?auto_98649 ) ) ( OBJ-AT ?auto_98649 ?auto_98652 ) ( OBJ-AT ?auto_98646 ?auto_98645 ) ( OBJ-AT ?auto_98647 ?auto_98645 ) ( OBJ-AT ?auto_98648 ?auto_98645 ) ( not ( = ?auto_98646 ?auto_98647 ) ) ( not ( = ?auto_98646 ?auto_98648 ) ) ( not ( = ?auto_98646 ?auto_98649 ) ) ( not ( = ?auto_98646 ?auto_98653 ) ) ( not ( = ?auto_98647 ?auto_98648 ) ) ( not ( = ?auto_98647 ?auto_98649 ) ) ( not ( = ?auto_98647 ?auto_98653 ) ) ( not ( = ?auto_98648 ?auto_98649 ) ) ( not ( = ?auto_98648 ?auto_98653 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98653 ?auto_98649 ?auto_98645 )
      ( DELIVER-4PKG-VERIFY ?auto_98646 ?auto_98647 ?auto_98648 ?auto_98649 ?auto_98645 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98663 - OBJ
      ?auto_98664 - OBJ
      ?auto_98665 - OBJ
      ?auto_98666 - OBJ
      ?auto_98662 - LOCATION
    )
    :vars
    (
      ?auto_98668 - TRUCK
      ?auto_98669 - LOCATION
      ?auto_98667 - CITY
      ?auto_98670 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98668 ?auto_98669 ) ( IN-CITY ?auto_98669 ?auto_98667 ) ( IN-CITY ?auto_98662 ?auto_98667 ) ( not ( = ?auto_98662 ?auto_98669 ) ) ( OBJ-AT ?auto_98670 ?auto_98662 ) ( not ( = ?auto_98670 ?auto_98665 ) ) ( OBJ-AT ?auto_98665 ?auto_98669 ) ( OBJ-AT ?auto_98663 ?auto_98662 ) ( OBJ-AT ?auto_98664 ?auto_98662 ) ( OBJ-AT ?auto_98666 ?auto_98662 ) ( not ( = ?auto_98663 ?auto_98664 ) ) ( not ( = ?auto_98663 ?auto_98665 ) ) ( not ( = ?auto_98663 ?auto_98666 ) ) ( not ( = ?auto_98663 ?auto_98670 ) ) ( not ( = ?auto_98664 ?auto_98665 ) ) ( not ( = ?auto_98664 ?auto_98666 ) ) ( not ( = ?auto_98664 ?auto_98670 ) ) ( not ( = ?auto_98665 ?auto_98666 ) ) ( not ( = ?auto_98666 ?auto_98670 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98670 ?auto_98665 ?auto_98662 )
      ( DELIVER-4PKG-VERIFY ?auto_98663 ?auto_98664 ?auto_98665 ?auto_98666 ?auto_98662 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98681 - OBJ
      ?auto_98682 - OBJ
      ?auto_98683 - OBJ
      ?auto_98684 - OBJ
      ?auto_98680 - LOCATION
    )
    :vars
    (
      ?auto_98686 - TRUCK
      ?auto_98687 - LOCATION
      ?auto_98685 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98686 ?auto_98687 ) ( IN-CITY ?auto_98687 ?auto_98685 ) ( IN-CITY ?auto_98680 ?auto_98685 ) ( not ( = ?auto_98680 ?auto_98687 ) ) ( OBJ-AT ?auto_98683 ?auto_98680 ) ( not ( = ?auto_98683 ?auto_98682 ) ) ( OBJ-AT ?auto_98682 ?auto_98687 ) ( OBJ-AT ?auto_98681 ?auto_98680 ) ( OBJ-AT ?auto_98684 ?auto_98680 ) ( not ( = ?auto_98681 ?auto_98682 ) ) ( not ( = ?auto_98681 ?auto_98683 ) ) ( not ( = ?auto_98681 ?auto_98684 ) ) ( not ( = ?auto_98682 ?auto_98684 ) ) ( not ( = ?auto_98683 ?auto_98684 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98683 ?auto_98682 ?auto_98680 )
      ( DELIVER-4PKG-VERIFY ?auto_98681 ?auto_98682 ?auto_98683 ?auto_98684 ?auto_98680 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98713 - OBJ
      ?auto_98714 - OBJ
      ?auto_98715 - OBJ
      ?auto_98716 - OBJ
      ?auto_98712 - LOCATION
    )
    :vars
    (
      ?auto_98718 - TRUCK
      ?auto_98719 - LOCATION
      ?auto_98717 - CITY
      ?auto_98720 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98718 ?auto_98719 ) ( IN-CITY ?auto_98719 ?auto_98717 ) ( IN-CITY ?auto_98712 ?auto_98717 ) ( not ( = ?auto_98712 ?auto_98719 ) ) ( OBJ-AT ?auto_98720 ?auto_98712 ) ( not ( = ?auto_98720 ?auto_98714 ) ) ( OBJ-AT ?auto_98714 ?auto_98719 ) ( OBJ-AT ?auto_98713 ?auto_98712 ) ( OBJ-AT ?auto_98715 ?auto_98712 ) ( OBJ-AT ?auto_98716 ?auto_98712 ) ( not ( = ?auto_98713 ?auto_98714 ) ) ( not ( = ?auto_98713 ?auto_98715 ) ) ( not ( = ?auto_98713 ?auto_98716 ) ) ( not ( = ?auto_98713 ?auto_98720 ) ) ( not ( = ?auto_98714 ?auto_98715 ) ) ( not ( = ?auto_98714 ?auto_98716 ) ) ( not ( = ?auto_98715 ?auto_98716 ) ) ( not ( = ?auto_98715 ?auto_98720 ) ) ( not ( = ?auto_98716 ?auto_98720 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98720 ?auto_98714 ?auto_98712 )
      ( DELIVER-4PKG-VERIFY ?auto_98713 ?auto_98714 ?auto_98715 ?auto_98716 ?auto_98712 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98765 - OBJ
      ?auto_98766 - OBJ
      ?auto_98767 - OBJ
      ?auto_98768 - OBJ
      ?auto_98764 - LOCATION
    )
    :vars
    (
      ?auto_98770 - TRUCK
      ?auto_98771 - LOCATION
      ?auto_98769 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98770 ?auto_98771 ) ( IN-CITY ?auto_98771 ?auto_98769 ) ( IN-CITY ?auto_98764 ?auto_98769 ) ( not ( = ?auto_98764 ?auto_98771 ) ) ( OBJ-AT ?auto_98766 ?auto_98764 ) ( not ( = ?auto_98766 ?auto_98765 ) ) ( OBJ-AT ?auto_98765 ?auto_98771 ) ( OBJ-AT ?auto_98767 ?auto_98764 ) ( OBJ-AT ?auto_98768 ?auto_98764 ) ( not ( = ?auto_98765 ?auto_98767 ) ) ( not ( = ?auto_98765 ?auto_98768 ) ) ( not ( = ?auto_98766 ?auto_98767 ) ) ( not ( = ?auto_98766 ?auto_98768 ) ) ( not ( = ?auto_98767 ?auto_98768 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98766 ?auto_98765 ?auto_98764 )
      ( DELIVER-4PKG-VERIFY ?auto_98765 ?auto_98766 ?auto_98767 ?auto_98768 ?auto_98764 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98781 - OBJ
      ?auto_98782 - OBJ
      ?auto_98783 - OBJ
      ?auto_98784 - OBJ
      ?auto_98780 - LOCATION
    )
    :vars
    (
      ?auto_98786 - TRUCK
      ?auto_98787 - LOCATION
      ?auto_98785 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98786 ?auto_98787 ) ( IN-CITY ?auto_98787 ?auto_98785 ) ( IN-CITY ?auto_98780 ?auto_98785 ) ( not ( = ?auto_98780 ?auto_98787 ) ) ( OBJ-AT ?auto_98784 ?auto_98780 ) ( not ( = ?auto_98784 ?auto_98781 ) ) ( OBJ-AT ?auto_98781 ?auto_98787 ) ( OBJ-AT ?auto_98782 ?auto_98780 ) ( OBJ-AT ?auto_98783 ?auto_98780 ) ( not ( = ?auto_98781 ?auto_98782 ) ) ( not ( = ?auto_98781 ?auto_98783 ) ) ( not ( = ?auto_98782 ?auto_98783 ) ) ( not ( = ?auto_98782 ?auto_98784 ) ) ( not ( = ?auto_98783 ?auto_98784 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98784 ?auto_98781 ?auto_98780 )
      ( DELIVER-4PKG-VERIFY ?auto_98781 ?auto_98782 ?auto_98783 ?auto_98784 ?auto_98780 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98861 - OBJ
      ?auto_98862 - OBJ
      ?auto_98863 - OBJ
      ?auto_98864 - OBJ
      ?auto_98860 - LOCATION
    )
    :vars
    (
      ?auto_98866 - TRUCK
      ?auto_98867 - LOCATION
      ?auto_98865 - CITY
      ?auto_98868 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98866 ?auto_98867 ) ( IN-CITY ?auto_98867 ?auto_98865 ) ( IN-CITY ?auto_98860 ?auto_98865 ) ( not ( = ?auto_98860 ?auto_98867 ) ) ( OBJ-AT ?auto_98868 ?auto_98860 ) ( not ( = ?auto_98868 ?auto_98861 ) ) ( OBJ-AT ?auto_98861 ?auto_98867 ) ( OBJ-AT ?auto_98862 ?auto_98860 ) ( OBJ-AT ?auto_98863 ?auto_98860 ) ( OBJ-AT ?auto_98864 ?auto_98860 ) ( not ( = ?auto_98861 ?auto_98862 ) ) ( not ( = ?auto_98861 ?auto_98863 ) ) ( not ( = ?auto_98861 ?auto_98864 ) ) ( not ( = ?auto_98862 ?auto_98863 ) ) ( not ( = ?auto_98862 ?auto_98864 ) ) ( not ( = ?auto_98862 ?auto_98868 ) ) ( not ( = ?auto_98863 ?auto_98864 ) ) ( not ( = ?auto_98863 ?auto_98868 ) ) ( not ( = ?auto_98864 ?auto_98868 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98868 ?auto_98861 ?auto_98860 )
      ( DELIVER-4PKG-VERIFY ?auto_98861 ?auto_98862 ?auto_98863 ?auto_98864 ?auto_98860 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99012 - OBJ
      ?auto_99013 - OBJ
      ?auto_99014 - OBJ
      ?auto_99011 - LOCATION
    )
    :vars
    (
      ?auto_99015 - LOCATION
      ?auto_99016 - CITY
      ?auto_99017 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99015 ?auto_99016 ) ( IN-CITY ?auto_99011 ?auto_99016 ) ( not ( = ?auto_99011 ?auto_99015 ) ) ( OBJ-AT ?auto_99013 ?auto_99011 ) ( not ( = ?auto_99013 ?auto_99014 ) ) ( OBJ-AT ?auto_99014 ?auto_99015 ) ( TRUCK-AT ?auto_99017 ?auto_99011 ) ( OBJ-AT ?auto_99012 ?auto_99011 ) ( not ( = ?auto_99012 ?auto_99013 ) ) ( not ( = ?auto_99012 ?auto_99014 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99013 ?auto_99014 ?auto_99011 )
      ( DELIVER-3PKG-VERIFY ?auto_99012 ?auto_99013 ?auto_99014 ?auto_99011 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99045 - OBJ
      ?auto_99046 - OBJ
      ?auto_99047 - OBJ
      ?auto_99044 - LOCATION
    )
    :vars
    (
      ?auto_99049 - LOCATION
      ?auto_99050 - CITY
      ?auto_99048 - OBJ
      ?auto_99051 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99049 ?auto_99050 ) ( IN-CITY ?auto_99044 ?auto_99050 ) ( not ( = ?auto_99044 ?auto_99049 ) ) ( OBJ-AT ?auto_99048 ?auto_99044 ) ( not ( = ?auto_99048 ?auto_99047 ) ) ( OBJ-AT ?auto_99047 ?auto_99049 ) ( TRUCK-AT ?auto_99051 ?auto_99044 ) ( OBJ-AT ?auto_99045 ?auto_99044 ) ( OBJ-AT ?auto_99046 ?auto_99044 ) ( not ( = ?auto_99045 ?auto_99046 ) ) ( not ( = ?auto_99045 ?auto_99047 ) ) ( not ( = ?auto_99045 ?auto_99048 ) ) ( not ( = ?auto_99046 ?auto_99047 ) ) ( not ( = ?auto_99046 ?auto_99048 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99048 ?auto_99047 ?auto_99044 )
      ( DELIVER-3PKG-VERIFY ?auto_99045 ?auto_99046 ?auto_99047 ?auto_99044 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99057 - OBJ
      ?auto_99058 - OBJ
      ?auto_99059 - OBJ
      ?auto_99056 - LOCATION
    )
    :vars
    (
      ?auto_99061 - LOCATION
      ?auto_99062 - CITY
      ?auto_99060 - OBJ
      ?auto_99063 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99061 ?auto_99062 ) ( IN-CITY ?auto_99056 ?auto_99062 ) ( not ( = ?auto_99056 ?auto_99061 ) ) ( OBJ-AT ?auto_99060 ?auto_99056 ) ( not ( = ?auto_99060 ?auto_99058 ) ) ( OBJ-AT ?auto_99058 ?auto_99061 ) ( TRUCK-AT ?auto_99063 ?auto_99056 ) ( OBJ-AT ?auto_99057 ?auto_99056 ) ( OBJ-AT ?auto_99059 ?auto_99056 ) ( not ( = ?auto_99057 ?auto_99058 ) ) ( not ( = ?auto_99057 ?auto_99059 ) ) ( not ( = ?auto_99057 ?auto_99060 ) ) ( not ( = ?auto_99058 ?auto_99059 ) ) ( not ( = ?auto_99059 ?auto_99060 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99060 ?auto_99058 ?auto_99056 )
      ( DELIVER-3PKG-VERIFY ?auto_99057 ?auto_99058 ?auto_99059 ?auto_99056 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99095 - OBJ
      ?auto_99096 - OBJ
      ?auto_99097 - OBJ
      ?auto_99094 - LOCATION
    )
    :vars
    (
      ?auto_99099 - LOCATION
      ?auto_99100 - CITY
      ?auto_99098 - OBJ
      ?auto_99101 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99099 ?auto_99100 ) ( IN-CITY ?auto_99094 ?auto_99100 ) ( not ( = ?auto_99094 ?auto_99099 ) ) ( OBJ-AT ?auto_99098 ?auto_99094 ) ( not ( = ?auto_99098 ?auto_99095 ) ) ( OBJ-AT ?auto_99095 ?auto_99099 ) ( TRUCK-AT ?auto_99101 ?auto_99094 ) ( OBJ-AT ?auto_99096 ?auto_99094 ) ( OBJ-AT ?auto_99097 ?auto_99094 ) ( not ( = ?auto_99095 ?auto_99096 ) ) ( not ( = ?auto_99095 ?auto_99097 ) ) ( not ( = ?auto_99096 ?auto_99097 ) ) ( not ( = ?auto_99096 ?auto_99098 ) ) ( not ( = ?auto_99097 ?auto_99098 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99098 ?auto_99095 ?auto_99094 )
      ( DELIVER-3PKG-VERIFY ?auto_99095 ?auto_99096 ?auto_99097 ?auto_99094 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99174 - OBJ
      ?auto_99175 - OBJ
      ?auto_99176 - OBJ
      ?auto_99177 - OBJ
      ?auto_99173 - LOCATION
    )
    :vars
    (
      ?auto_99178 - LOCATION
      ?auto_99179 - CITY
      ?auto_99180 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99178 ?auto_99179 ) ( IN-CITY ?auto_99173 ?auto_99179 ) ( not ( = ?auto_99173 ?auto_99178 ) ) ( OBJ-AT ?auto_99176 ?auto_99173 ) ( not ( = ?auto_99176 ?auto_99177 ) ) ( OBJ-AT ?auto_99177 ?auto_99178 ) ( TRUCK-AT ?auto_99180 ?auto_99173 ) ( OBJ-AT ?auto_99174 ?auto_99173 ) ( OBJ-AT ?auto_99175 ?auto_99173 ) ( not ( = ?auto_99174 ?auto_99175 ) ) ( not ( = ?auto_99174 ?auto_99176 ) ) ( not ( = ?auto_99174 ?auto_99177 ) ) ( not ( = ?auto_99175 ?auto_99176 ) ) ( not ( = ?auto_99175 ?auto_99177 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99176 ?auto_99177 ?auto_99173 )
      ( DELIVER-4PKG-VERIFY ?auto_99174 ?auto_99175 ?auto_99176 ?auto_99177 ?auto_99173 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99214 - OBJ
      ?auto_99215 - OBJ
      ?auto_99216 - OBJ
      ?auto_99217 - OBJ
      ?auto_99213 - LOCATION
    )
    :vars
    (
      ?auto_99218 - LOCATION
      ?auto_99219 - CITY
      ?auto_99220 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99218 ?auto_99219 ) ( IN-CITY ?auto_99213 ?auto_99219 ) ( not ( = ?auto_99213 ?auto_99218 ) ) ( OBJ-AT ?auto_99216 ?auto_99213 ) ( not ( = ?auto_99216 ?auto_99215 ) ) ( OBJ-AT ?auto_99215 ?auto_99218 ) ( TRUCK-AT ?auto_99220 ?auto_99213 ) ( OBJ-AT ?auto_99214 ?auto_99213 ) ( OBJ-AT ?auto_99217 ?auto_99213 ) ( not ( = ?auto_99214 ?auto_99215 ) ) ( not ( = ?auto_99214 ?auto_99216 ) ) ( not ( = ?auto_99214 ?auto_99217 ) ) ( not ( = ?auto_99215 ?auto_99217 ) ) ( not ( = ?auto_99216 ?auto_99217 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99216 ?auto_99215 ?auto_99213 )
      ( DELIVER-4PKG-VERIFY ?auto_99214 ?auto_99215 ?auto_99216 ?auto_99217 ?auto_99213 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99238 - OBJ
      ?auto_99239 - OBJ
      ?auto_99240 - OBJ
      ?auto_99241 - OBJ
      ?auto_99237 - LOCATION
    )
    :vars
    (
      ?auto_99242 - LOCATION
      ?auto_99243 - CITY
      ?auto_99244 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99242 ?auto_99243 ) ( IN-CITY ?auto_99237 ?auto_99243 ) ( not ( = ?auto_99237 ?auto_99242 ) ) ( OBJ-AT ?auto_99238 ?auto_99237 ) ( not ( = ?auto_99238 ?auto_99239 ) ) ( OBJ-AT ?auto_99239 ?auto_99242 ) ( TRUCK-AT ?auto_99244 ?auto_99237 ) ( OBJ-AT ?auto_99240 ?auto_99237 ) ( OBJ-AT ?auto_99241 ?auto_99237 ) ( not ( = ?auto_99238 ?auto_99240 ) ) ( not ( = ?auto_99238 ?auto_99241 ) ) ( not ( = ?auto_99239 ?auto_99240 ) ) ( not ( = ?auto_99239 ?auto_99241 ) ) ( not ( = ?auto_99240 ?auto_99241 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99238 ?auto_99239 ?auto_99237 )
      ( DELIVER-4PKG-VERIFY ?auto_99238 ?auto_99239 ?auto_99240 ?auto_99241 ?auto_99237 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99286 - OBJ
      ?auto_99287 - OBJ
      ?auto_99288 - OBJ
      ?auto_99289 - OBJ
      ?auto_99285 - LOCATION
    )
    :vars
    (
      ?auto_99290 - LOCATION
      ?auto_99291 - CITY
      ?auto_99292 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99290 ?auto_99291 ) ( IN-CITY ?auto_99285 ?auto_99291 ) ( not ( = ?auto_99285 ?auto_99290 ) ) ( OBJ-AT ?auto_99287 ?auto_99285 ) ( not ( = ?auto_99287 ?auto_99289 ) ) ( OBJ-AT ?auto_99289 ?auto_99290 ) ( TRUCK-AT ?auto_99292 ?auto_99285 ) ( OBJ-AT ?auto_99286 ?auto_99285 ) ( OBJ-AT ?auto_99288 ?auto_99285 ) ( not ( = ?auto_99286 ?auto_99287 ) ) ( not ( = ?auto_99286 ?auto_99288 ) ) ( not ( = ?auto_99286 ?auto_99289 ) ) ( not ( = ?auto_99287 ?auto_99288 ) ) ( not ( = ?auto_99288 ?auto_99289 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99287 ?auto_99289 ?auto_99285 )
      ( DELIVER-4PKG-VERIFY ?auto_99286 ?auto_99287 ?auto_99288 ?auto_99289 ?auto_99285 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99302 - OBJ
      ?auto_99303 - OBJ
      ?auto_99304 - OBJ
      ?auto_99305 - OBJ
      ?auto_99301 - LOCATION
    )
    :vars
    (
      ?auto_99306 - LOCATION
      ?auto_99307 - CITY
      ?auto_99308 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99306 ?auto_99307 ) ( IN-CITY ?auto_99301 ?auto_99307 ) ( not ( = ?auto_99301 ?auto_99306 ) ) ( OBJ-AT ?auto_99303 ?auto_99301 ) ( not ( = ?auto_99303 ?auto_99304 ) ) ( OBJ-AT ?auto_99304 ?auto_99306 ) ( TRUCK-AT ?auto_99308 ?auto_99301 ) ( OBJ-AT ?auto_99302 ?auto_99301 ) ( OBJ-AT ?auto_99305 ?auto_99301 ) ( not ( = ?auto_99302 ?auto_99303 ) ) ( not ( = ?auto_99302 ?auto_99304 ) ) ( not ( = ?auto_99302 ?auto_99305 ) ) ( not ( = ?auto_99303 ?auto_99305 ) ) ( not ( = ?auto_99304 ?auto_99305 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99303 ?auto_99304 ?auto_99301 )
      ( DELIVER-4PKG-VERIFY ?auto_99302 ?auto_99303 ?auto_99304 ?auto_99305 ?auto_99301 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99334 - OBJ
      ?auto_99335 - OBJ
      ?auto_99336 - OBJ
      ?auto_99337 - OBJ
      ?auto_99333 - LOCATION
    )
    :vars
    (
      ?auto_99339 - LOCATION
      ?auto_99340 - CITY
      ?auto_99338 - OBJ
      ?auto_99341 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99339 ?auto_99340 ) ( IN-CITY ?auto_99333 ?auto_99340 ) ( not ( = ?auto_99333 ?auto_99339 ) ) ( OBJ-AT ?auto_99338 ?auto_99333 ) ( not ( = ?auto_99338 ?auto_99337 ) ) ( OBJ-AT ?auto_99337 ?auto_99339 ) ( TRUCK-AT ?auto_99341 ?auto_99333 ) ( OBJ-AT ?auto_99334 ?auto_99333 ) ( OBJ-AT ?auto_99335 ?auto_99333 ) ( OBJ-AT ?auto_99336 ?auto_99333 ) ( not ( = ?auto_99334 ?auto_99335 ) ) ( not ( = ?auto_99334 ?auto_99336 ) ) ( not ( = ?auto_99334 ?auto_99337 ) ) ( not ( = ?auto_99334 ?auto_99338 ) ) ( not ( = ?auto_99335 ?auto_99336 ) ) ( not ( = ?auto_99335 ?auto_99337 ) ) ( not ( = ?auto_99335 ?auto_99338 ) ) ( not ( = ?auto_99336 ?auto_99337 ) ) ( not ( = ?auto_99336 ?auto_99338 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99338 ?auto_99337 ?auto_99333 )
      ( DELIVER-4PKG-VERIFY ?auto_99334 ?auto_99335 ?auto_99336 ?auto_99337 ?auto_99333 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99343 - OBJ
      ?auto_99344 - OBJ
      ?auto_99345 - OBJ
      ?auto_99346 - OBJ
      ?auto_99342 - LOCATION
    )
    :vars
    (
      ?auto_99347 - LOCATION
      ?auto_99348 - CITY
      ?auto_99349 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99347 ?auto_99348 ) ( IN-CITY ?auto_99342 ?auto_99348 ) ( not ( = ?auto_99342 ?auto_99347 ) ) ( OBJ-AT ?auto_99346 ?auto_99342 ) ( not ( = ?auto_99346 ?auto_99345 ) ) ( OBJ-AT ?auto_99345 ?auto_99347 ) ( TRUCK-AT ?auto_99349 ?auto_99342 ) ( OBJ-AT ?auto_99343 ?auto_99342 ) ( OBJ-AT ?auto_99344 ?auto_99342 ) ( not ( = ?auto_99343 ?auto_99344 ) ) ( not ( = ?auto_99343 ?auto_99345 ) ) ( not ( = ?auto_99343 ?auto_99346 ) ) ( not ( = ?auto_99344 ?auto_99345 ) ) ( not ( = ?auto_99344 ?auto_99346 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99346 ?auto_99345 ?auto_99342 )
      ( DELIVER-4PKG-VERIFY ?auto_99343 ?auto_99344 ?auto_99345 ?auto_99346 ?auto_99342 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99351 - OBJ
      ?auto_99352 - OBJ
      ?auto_99353 - OBJ
      ?auto_99354 - OBJ
      ?auto_99350 - LOCATION
    )
    :vars
    (
      ?auto_99356 - LOCATION
      ?auto_99357 - CITY
      ?auto_99355 - OBJ
      ?auto_99358 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99356 ?auto_99357 ) ( IN-CITY ?auto_99350 ?auto_99357 ) ( not ( = ?auto_99350 ?auto_99356 ) ) ( OBJ-AT ?auto_99355 ?auto_99350 ) ( not ( = ?auto_99355 ?auto_99353 ) ) ( OBJ-AT ?auto_99353 ?auto_99356 ) ( TRUCK-AT ?auto_99358 ?auto_99350 ) ( OBJ-AT ?auto_99351 ?auto_99350 ) ( OBJ-AT ?auto_99352 ?auto_99350 ) ( OBJ-AT ?auto_99354 ?auto_99350 ) ( not ( = ?auto_99351 ?auto_99352 ) ) ( not ( = ?auto_99351 ?auto_99353 ) ) ( not ( = ?auto_99351 ?auto_99354 ) ) ( not ( = ?auto_99351 ?auto_99355 ) ) ( not ( = ?auto_99352 ?auto_99353 ) ) ( not ( = ?auto_99352 ?auto_99354 ) ) ( not ( = ?auto_99352 ?auto_99355 ) ) ( not ( = ?auto_99353 ?auto_99354 ) ) ( not ( = ?auto_99354 ?auto_99355 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99355 ?auto_99353 ?auto_99350 )
      ( DELIVER-4PKG-VERIFY ?auto_99351 ?auto_99352 ?auto_99353 ?auto_99354 ?auto_99350 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99401 - OBJ
      ?auto_99402 - OBJ
      ?auto_99403 - OBJ
      ?auto_99404 - OBJ
      ?auto_99400 - LOCATION
    )
    :vars
    (
      ?auto_99406 - LOCATION
      ?auto_99407 - CITY
      ?auto_99405 - OBJ
      ?auto_99408 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99406 ?auto_99407 ) ( IN-CITY ?auto_99400 ?auto_99407 ) ( not ( = ?auto_99400 ?auto_99406 ) ) ( OBJ-AT ?auto_99405 ?auto_99400 ) ( not ( = ?auto_99405 ?auto_99402 ) ) ( OBJ-AT ?auto_99402 ?auto_99406 ) ( TRUCK-AT ?auto_99408 ?auto_99400 ) ( OBJ-AT ?auto_99401 ?auto_99400 ) ( OBJ-AT ?auto_99403 ?auto_99400 ) ( OBJ-AT ?auto_99404 ?auto_99400 ) ( not ( = ?auto_99401 ?auto_99402 ) ) ( not ( = ?auto_99401 ?auto_99403 ) ) ( not ( = ?auto_99401 ?auto_99404 ) ) ( not ( = ?auto_99401 ?auto_99405 ) ) ( not ( = ?auto_99402 ?auto_99403 ) ) ( not ( = ?auto_99402 ?auto_99404 ) ) ( not ( = ?auto_99403 ?auto_99404 ) ) ( not ( = ?auto_99403 ?auto_99405 ) ) ( not ( = ?auto_99404 ?auto_99405 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99405 ?auto_99402 ?auto_99400 )
      ( DELIVER-4PKG-VERIFY ?auto_99401 ?auto_99402 ?auto_99403 ?auto_99404 ?auto_99400 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99445 - OBJ
      ?auto_99446 - OBJ
      ?auto_99447 - OBJ
      ?auto_99448 - OBJ
      ?auto_99444 - LOCATION
    )
    :vars
    (
      ?auto_99449 - LOCATION
      ?auto_99450 - CITY
      ?auto_99451 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99449 ?auto_99450 ) ( IN-CITY ?auto_99444 ?auto_99450 ) ( not ( = ?auto_99444 ?auto_99449 ) ) ( OBJ-AT ?auto_99448 ?auto_99444 ) ( not ( = ?auto_99448 ?auto_99445 ) ) ( OBJ-AT ?auto_99445 ?auto_99449 ) ( TRUCK-AT ?auto_99451 ?auto_99444 ) ( OBJ-AT ?auto_99446 ?auto_99444 ) ( OBJ-AT ?auto_99447 ?auto_99444 ) ( not ( = ?auto_99445 ?auto_99446 ) ) ( not ( = ?auto_99445 ?auto_99447 ) ) ( not ( = ?auto_99446 ?auto_99447 ) ) ( not ( = ?auto_99446 ?auto_99448 ) ) ( not ( = ?auto_99447 ?auto_99448 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99448 ?auto_99445 ?auto_99444 )
      ( DELIVER-4PKG-VERIFY ?auto_99445 ?auto_99446 ?auto_99447 ?auto_99448 ?auto_99444 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99469 - OBJ
      ?auto_99470 - OBJ
      ?auto_99471 - OBJ
      ?auto_99472 - OBJ
      ?auto_99468 - LOCATION
    )
    :vars
    (
      ?auto_99473 - LOCATION
      ?auto_99474 - CITY
      ?auto_99475 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99473 ?auto_99474 ) ( IN-CITY ?auto_99468 ?auto_99474 ) ( not ( = ?auto_99468 ?auto_99473 ) ) ( OBJ-AT ?auto_99470 ?auto_99468 ) ( not ( = ?auto_99470 ?auto_99469 ) ) ( OBJ-AT ?auto_99469 ?auto_99473 ) ( TRUCK-AT ?auto_99475 ?auto_99468 ) ( OBJ-AT ?auto_99471 ?auto_99468 ) ( OBJ-AT ?auto_99472 ?auto_99468 ) ( not ( = ?auto_99469 ?auto_99471 ) ) ( not ( = ?auto_99469 ?auto_99472 ) ) ( not ( = ?auto_99470 ?auto_99471 ) ) ( not ( = ?auto_99470 ?auto_99472 ) ) ( not ( = ?auto_99471 ?auto_99472 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99470 ?auto_99469 ?auto_99468 )
      ( DELIVER-4PKG-VERIFY ?auto_99469 ?auto_99470 ?auto_99471 ?auto_99472 ?auto_99468 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99549 - OBJ
      ?auto_99550 - OBJ
      ?auto_99551 - OBJ
      ?auto_99552 - OBJ
      ?auto_99548 - LOCATION
    )
    :vars
    (
      ?auto_99554 - LOCATION
      ?auto_99555 - CITY
      ?auto_99553 - OBJ
      ?auto_99556 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99554 ?auto_99555 ) ( IN-CITY ?auto_99548 ?auto_99555 ) ( not ( = ?auto_99548 ?auto_99554 ) ) ( OBJ-AT ?auto_99553 ?auto_99548 ) ( not ( = ?auto_99553 ?auto_99549 ) ) ( OBJ-AT ?auto_99549 ?auto_99554 ) ( TRUCK-AT ?auto_99556 ?auto_99548 ) ( OBJ-AT ?auto_99550 ?auto_99548 ) ( OBJ-AT ?auto_99551 ?auto_99548 ) ( OBJ-AT ?auto_99552 ?auto_99548 ) ( not ( = ?auto_99549 ?auto_99550 ) ) ( not ( = ?auto_99549 ?auto_99551 ) ) ( not ( = ?auto_99549 ?auto_99552 ) ) ( not ( = ?auto_99550 ?auto_99551 ) ) ( not ( = ?auto_99550 ?auto_99552 ) ) ( not ( = ?auto_99550 ?auto_99553 ) ) ( not ( = ?auto_99551 ?auto_99552 ) ) ( not ( = ?auto_99551 ?auto_99553 ) ) ( not ( = ?auto_99552 ?auto_99553 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99553 ?auto_99549 ?auto_99548 )
      ( DELIVER-4PKG-VERIFY ?auto_99549 ?auto_99550 ?auto_99551 ?auto_99552 ?auto_99548 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99712 - OBJ
      ?auto_99713 - OBJ
      ?auto_99714 - OBJ
      ?auto_99711 - LOCATION
    )
    :vars
    (
      ?auto_99715 - LOCATION
      ?auto_99717 - CITY
      ?auto_99716 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99715 ?auto_99717 ) ( IN-CITY ?auto_99711 ?auto_99717 ) ( not ( = ?auto_99711 ?auto_99715 ) ) ( OBJ-AT ?auto_99712 ?auto_99711 ) ( not ( = ?auto_99712 ?auto_99713 ) ) ( OBJ-AT ?auto_99713 ?auto_99715 ) ( TRUCK-AT ?auto_99716 ?auto_99711 ) ( OBJ-AT ?auto_99714 ?auto_99711 ) ( not ( = ?auto_99712 ?auto_99714 ) ) ( not ( = ?auto_99713 ?auto_99714 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99712 ?auto_99713 ?auto_99711 )
      ( DELIVER-3PKG-VERIFY ?auto_99712 ?auto_99713 ?auto_99714 ?auto_99711 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_100373 - OBJ
      ?auto_100372 - LOCATION
    )
    :vars
    (
      ?auto_100375 - LOCATION
      ?auto_100377 - CITY
      ?auto_100374 - OBJ
      ?auto_100376 - TRUCK
      ?auto_100378 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_100375 ?auto_100377 ) ( IN-CITY ?auto_100372 ?auto_100377 ) ( not ( = ?auto_100372 ?auto_100375 ) ) ( OBJ-AT ?auto_100374 ?auto_100372 ) ( not ( = ?auto_100374 ?auto_100373 ) ) ( OBJ-AT ?auto_100373 ?auto_100375 ) ( TRUCK-AT ?auto_100376 ?auto_100378 ) ( IN-CITY ?auto_100378 ?auto_100377 ) ( not ( = ?auto_100372 ?auto_100378 ) ) ( not ( = ?auto_100375 ?auto_100378 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_100376 ?auto_100378 ?auto_100372 ?auto_100377 )
      ( DELIVER-2PKG ?auto_100374 ?auto_100373 ?auto_100372 )
      ( DELIVER-1PKG-VERIFY ?auto_100373 ?auto_100372 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_100380 - OBJ
      ?auto_100381 - OBJ
      ?auto_100379 - LOCATION
    )
    :vars
    (
      ?auto_100384 - LOCATION
      ?auto_100383 - CITY
      ?auto_100382 - TRUCK
      ?auto_100385 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_100384 ?auto_100383 ) ( IN-CITY ?auto_100379 ?auto_100383 ) ( not ( = ?auto_100379 ?auto_100384 ) ) ( OBJ-AT ?auto_100380 ?auto_100379 ) ( not ( = ?auto_100380 ?auto_100381 ) ) ( OBJ-AT ?auto_100381 ?auto_100384 ) ( TRUCK-AT ?auto_100382 ?auto_100385 ) ( IN-CITY ?auto_100385 ?auto_100383 ) ( not ( = ?auto_100379 ?auto_100385 ) ) ( not ( = ?auto_100384 ?auto_100385 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_100381 ?auto_100379 )
      ( DELIVER-2PKG-VERIFY ?auto_100380 ?auto_100381 ?auto_100379 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_100395 - OBJ
      ?auto_100396 - OBJ
      ?auto_100394 - LOCATION
    )
    :vars
    (
      ?auto_100399 - LOCATION
      ?auto_100397 - CITY
      ?auto_100398 - TRUCK
      ?auto_100400 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_100399 ?auto_100397 ) ( IN-CITY ?auto_100394 ?auto_100397 ) ( not ( = ?auto_100394 ?auto_100399 ) ) ( OBJ-AT ?auto_100396 ?auto_100394 ) ( not ( = ?auto_100396 ?auto_100395 ) ) ( OBJ-AT ?auto_100395 ?auto_100399 ) ( TRUCK-AT ?auto_100398 ?auto_100400 ) ( IN-CITY ?auto_100400 ?auto_100397 ) ( not ( = ?auto_100394 ?auto_100400 ) ) ( not ( = ?auto_100399 ?auto_100400 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100396 ?auto_100395 ?auto_100394 )
      ( DELIVER-2PKG-VERIFY ?auto_100395 ?auto_100396 ?auto_100394 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_100418 - OBJ
      ?auto_100419 - OBJ
      ?auto_100420 - OBJ
      ?auto_100417 - LOCATION
    )
    :vars
    (
      ?auto_100423 - LOCATION
      ?auto_100421 - CITY
      ?auto_100422 - TRUCK
      ?auto_100424 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_100423 ?auto_100421 ) ( IN-CITY ?auto_100417 ?auto_100421 ) ( not ( = ?auto_100417 ?auto_100423 ) ) ( OBJ-AT ?auto_100419 ?auto_100417 ) ( not ( = ?auto_100419 ?auto_100420 ) ) ( OBJ-AT ?auto_100420 ?auto_100423 ) ( TRUCK-AT ?auto_100422 ?auto_100424 ) ( IN-CITY ?auto_100424 ?auto_100421 ) ( not ( = ?auto_100417 ?auto_100424 ) ) ( not ( = ?auto_100423 ?auto_100424 ) ) ( OBJ-AT ?auto_100418 ?auto_100417 ) ( not ( = ?auto_100418 ?auto_100419 ) ) ( not ( = ?auto_100418 ?auto_100420 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100419 ?auto_100420 ?auto_100417 )
      ( DELIVER-3PKG-VERIFY ?auto_100418 ?auto_100419 ?auto_100420 ?auto_100417 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_100434 - OBJ
      ?auto_100435 - OBJ
      ?auto_100436 - OBJ
      ?auto_100433 - LOCATION
    )
    :vars
    (
      ?auto_100439 - LOCATION
      ?auto_100437 - CITY
      ?auto_100438 - TRUCK
      ?auto_100440 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_100439 ?auto_100437 ) ( IN-CITY ?auto_100433 ?auto_100437 ) ( not ( = ?auto_100433 ?auto_100439 ) ) ( OBJ-AT ?auto_100436 ?auto_100433 ) ( not ( = ?auto_100436 ?auto_100435 ) ) ( OBJ-AT ?auto_100435 ?auto_100439 ) ( TRUCK-AT ?auto_100438 ?auto_100440 ) ( IN-CITY ?auto_100440 ?auto_100437 ) ( not ( = ?auto_100433 ?auto_100440 ) ) ( not ( = ?auto_100439 ?auto_100440 ) ) ( OBJ-AT ?auto_100434 ?auto_100433 ) ( not ( = ?auto_100434 ?auto_100435 ) ) ( not ( = ?auto_100434 ?auto_100436 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100436 ?auto_100435 ?auto_100433 )
      ( DELIVER-3PKG-VERIFY ?auto_100434 ?auto_100435 ?auto_100436 ?auto_100433 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_100501 - OBJ
      ?auto_100502 - OBJ
      ?auto_100503 - OBJ
      ?auto_100500 - LOCATION
    )
    :vars
    (
      ?auto_100506 - LOCATION
      ?auto_100504 - CITY
      ?auto_100505 - TRUCK
      ?auto_100507 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_100506 ?auto_100504 ) ( IN-CITY ?auto_100500 ?auto_100504 ) ( not ( = ?auto_100500 ?auto_100506 ) ) ( OBJ-AT ?auto_100503 ?auto_100500 ) ( not ( = ?auto_100503 ?auto_100501 ) ) ( OBJ-AT ?auto_100501 ?auto_100506 ) ( TRUCK-AT ?auto_100505 ?auto_100507 ) ( IN-CITY ?auto_100507 ?auto_100504 ) ( not ( = ?auto_100500 ?auto_100507 ) ) ( not ( = ?auto_100506 ?auto_100507 ) ) ( OBJ-AT ?auto_100502 ?auto_100500 ) ( not ( = ?auto_100501 ?auto_100502 ) ) ( not ( = ?auto_100502 ?auto_100503 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100503 ?auto_100501 ?auto_100500 )
      ( DELIVER-3PKG-VERIFY ?auto_100501 ?auto_100502 ?auto_100503 ?auto_100500 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100577 - OBJ
      ?auto_100578 - OBJ
      ?auto_100579 - OBJ
      ?auto_100580 - OBJ
      ?auto_100576 - LOCATION
    )
    :vars
    (
      ?auto_100583 - LOCATION
      ?auto_100581 - CITY
      ?auto_100582 - TRUCK
      ?auto_100584 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_100583 ?auto_100581 ) ( IN-CITY ?auto_100576 ?auto_100581 ) ( not ( = ?auto_100576 ?auto_100583 ) ) ( OBJ-AT ?auto_100577 ?auto_100576 ) ( not ( = ?auto_100577 ?auto_100580 ) ) ( OBJ-AT ?auto_100580 ?auto_100583 ) ( TRUCK-AT ?auto_100582 ?auto_100584 ) ( IN-CITY ?auto_100584 ?auto_100581 ) ( not ( = ?auto_100576 ?auto_100584 ) ) ( not ( = ?auto_100583 ?auto_100584 ) ) ( OBJ-AT ?auto_100578 ?auto_100576 ) ( OBJ-AT ?auto_100579 ?auto_100576 ) ( not ( = ?auto_100577 ?auto_100578 ) ) ( not ( = ?auto_100577 ?auto_100579 ) ) ( not ( = ?auto_100578 ?auto_100579 ) ) ( not ( = ?auto_100578 ?auto_100580 ) ) ( not ( = ?auto_100579 ?auto_100580 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100577 ?auto_100580 ?auto_100576 )
      ( DELIVER-4PKG-VERIFY ?auto_100577 ?auto_100578 ?auto_100579 ?auto_100580 ?auto_100576 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100595 - OBJ
      ?auto_100596 - OBJ
      ?auto_100597 - OBJ
      ?auto_100598 - OBJ
      ?auto_100594 - LOCATION
    )
    :vars
    (
      ?auto_100601 - LOCATION
      ?auto_100599 - CITY
      ?auto_100600 - TRUCK
      ?auto_100602 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_100601 ?auto_100599 ) ( IN-CITY ?auto_100594 ?auto_100599 ) ( not ( = ?auto_100594 ?auto_100601 ) ) ( OBJ-AT ?auto_100595 ?auto_100594 ) ( not ( = ?auto_100595 ?auto_100597 ) ) ( OBJ-AT ?auto_100597 ?auto_100601 ) ( TRUCK-AT ?auto_100600 ?auto_100602 ) ( IN-CITY ?auto_100602 ?auto_100599 ) ( not ( = ?auto_100594 ?auto_100602 ) ) ( not ( = ?auto_100601 ?auto_100602 ) ) ( OBJ-AT ?auto_100596 ?auto_100594 ) ( OBJ-AT ?auto_100598 ?auto_100594 ) ( not ( = ?auto_100595 ?auto_100596 ) ) ( not ( = ?auto_100595 ?auto_100598 ) ) ( not ( = ?auto_100596 ?auto_100597 ) ) ( not ( = ?auto_100596 ?auto_100598 ) ) ( not ( = ?auto_100597 ?auto_100598 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100595 ?auto_100597 ?auto_100594 )
      ( DELIVER-4PKG-VERIFY ?auto_100595 ?auto_100596 ?auto_100597 ?auto_100598 ?auto_100594 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100667 - OBJ
      ?auto_100668 - OBJ
      ?auto_100669 - OBJ
      ?auto_100670 - OBJ
      ?auto_100666 - LOCATION
    )
    :vars
    (
      ?auto_100673 - LOCATION
      ?auto_100671 - CITY
      ?auto_100672 - TRUCK
      ?auto_100674 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_100673 ?auto_100671 ) ( IN-CITY ?auto_100666 ?auto_100671 ) ( not ( = ?auto_100666 ?auto_100673 ) ) ( OBJ-AT ?auto_100667 ?auto_100666 ) ( not ( = ?auto_100667 ?auto_100668 ) ) ( OBJ-AT ?auto_100668 ?auto_100673 ) ( TRUCK-AT ?auto_100672 ?auto_100674 ) ( IN-CITY ?auto_100674 ?auto_100671 ) ( not ( = ?auto_100666 ?auto_100674 ) ) ( not ( = ?auto_100673 ?auto_100674 ) ) ( OBJ-AT ?auto_100669 ?auto_100666 ) ( OBJ-AT ?auto_100670 ?auto_100666 ) ( not ( = ?auto_100667 ?auto_100669 ) ) ( not ( = ?auto_100667 ?auto_100670 ) ) ( not ( = ?auto_100668 ?auto_100669 ) ) ( not ( = ?auto_100668 ?auto_100670 ) ) ( not ( = ?auto_100669 ?auto_100670 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100667 ?auto_100668 ?auto_100666 )
      ( DELIVER-4PKG-VERIFY ?auto_100667 ?auto_100668 ?auto_100669 ?auto_100670 ?auto_100666 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100926 - OBJ
      ?auto_100927 - OBJ
      ?auto_100928 - OBJ
      ?auto_100929 - OBJ
      ?auto_100925 - LOCATION
    )
    :vars
    (
      ?auto_100932 - LOCATION
      ?auto_100930 - CITY
      ?auto_100931 - TRUCK
      ?auto_100933 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_100932 ?auto_100930 ) ( IN-CITY ?auto_100925 ?auto_100930 ) ( not ( = ?auto_100925 ?auto_100932 ) ) ( OBJ-AT ?auto_100928 ?auto_100925 ) ( not ( = ?auto_100928 ?auto_100926 ) ) ( OBJ-AT ?auto_100926 ?auto_100932 ) ( TRUCK-AT ?auto_100931 ?auto_100933 ) ( IN-CITY ?auto_100933 ?auto_100930 ) ( not ( = ?auto_100925 ?auto_100933 ) ) ( not ( = ?auto_100932 ?auto_100933 ) ) ( OBJ-AT ?auto_100927 ?auto_100925 ) ( OBJ-AT ?auto_100929 ?auto_100925 ) ( not ( = ?auto_100926 ?auto_100927 ) ) ( not ( = ?auto_100926 ?auto_100929 ) ) ( not ( = ?auto_100927 ?auto_100928 ) ) ( not ( = ?auto_100927 ?auto_100929 ) ) ( not ( = ?auto_100928 ?auto_100929 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100928 ?auto_100926 ?auto_100925 )
      ( DELIVER-4PKG-VERIFY ?auto_100926 ?auto_100927 ?auto_100928 ?auto_100929 ?auto_100925 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_101209 - OBJ
      ?auto_101210 - OBJ
      ?auto_101211 - OBJ
      ?auto_101208 - LOCATION
    )
    :vars
    (
      ?auto_101212 - LOCATION
      ?auto_101214 - CITY
      ?auto_101213 - TRUCK
      ?auto_101215 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101212 ?auto_101214 ) ( IN-CITY ?auto_101208 ?auto_101214 ) ( not ( = ?auto_101208 ?auto_101212 ) ) ( OBJ-AT ?auto_101209 ?auto_101208 ) ( not ( = ?auto_101209 ?auto_101211 ) ) ( OBJ-AT ?auto_101211 ?auto_101212 ) ( TRUCK-AT ?auto_101213 ?auto_101215 ) ( IN-CITY ?auto_101215 ?auto_101214 ) ( not ( = ?auto_101208 ?auto_101215 ) ) ( not ( = ?auto_101212 ?auto_101215 ) ) ( OBJ-AT ?auto_101210 ?auto_101208 ) ( not ( = ?auto_101209 ?auto_101210 ) ) ( not ( = ?auto_101210 ?auto_101211 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101209 ?auto_101211 ?auto_101208 )
      ( DELIVER-3PKG-VERIFY ?auto_101209 ?auto_101210 ?auto_101211 ?auto_101208 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_101292 - OBJ
      ?auto_101293 - OBJ
      ?auto_101294 - OBJ
      ?auto_101291 - LOCATION
    )
    :vars
    (
      ?auto_101295 - LOCATION
      ?auto_101297 - CITY
      ?auto_101296 - TRUCK
      ?auto_101298 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101295 ?auto_101297 ) ( IN-CITY ?auto_101291 ?auto_101297 ) ( not ( = ?auto_101291 ?auto_101295 ) ) ( OBJ-AT ?auto_101293 ?auto_101291 ) ( not ( = ?auto_101293 ?auto_101292 ) ) ( OBJ-AT ?auto_101292 ?auto_101295 ) ( TRUCK-AT ?auto_101296 ?auto_101298 ) ( IN-CITY ?auto_101298 ?auto_101297 ) ( not ( = ?auto_101291 ?auto_101298 ) ) ( not ( = ?auto_101295 ?auto_101298 ) ) ( OBJ-AT ?auto_101294 ?auto_101291 ) ( not ( = ?auto_101292 ?auto_101294 ) ) ( not ( = ?auto_101293 ?auto_101294 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101293 ?auto_101292 ?auto_101291 )
      ( DELIVER-3PKG-VERIFY ?auto_101292 ?auto_101293 ?auto_101294 ?auto_101291 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_101717 - OBJ
      ?auto_101718 - OBJ
      ?auto_101719 - OBJ
      ?auto_101720 - OBJ
      ?auto_101716 - LOCATION
    )
    :vars
    (
      ?auto_101721 - LOCATION
      ?auto_101723 - CITY
      ?auto_101722 - TRUCK
      ?auto_101724 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101721 ?auto_101723 ) ( IN-CITY ?auto_101716 ?auto_101723 ) ( not ( = ?auto_101716 ?auto_101721 ) ) ( OBJ-AT ?auto_101718 ?auto_101716 ) ( not ( = ?auto_101718 ?auto_101717 ) ) ( OBJ-AT ?auto_101717 ?auto_101721 ) ( TRUCK-AT ?auto_101722 ?auto_101724 ) ( IN-CITY ?auto_101724 ?auto_101723 ) ( not ( = ?auto_101716 ?auto_101724 ) ) ( not ( = ?auto_101721 ?auto_101724 ) ) ( OBJ-AT ?auto_101719 ?auto_101716 ) ( OBJ-AT ?auto_101720 ?auto_101716 ) ( not ( = ?auto_101717 ?auto_101719 ) ) ( not ( = ?auto_101717 ?auto_101720 ) ) ( not ( = ?auto_101718 ?auto_101719 ) ) ( not ( = ?auto_101718 ?auto_101720 ) ) ( not ( = ?auto_101719 ?auto_101720 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101718 ?auto_101717 ?auto_101716 )
      ( DELIVER-4PKG-VERIFY ?auto_101717 ?auto_101718 ?auto_101719 ?auto_101720 ?auto_101716 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_108062 - OBJ
      ?auto_108063 - OBJ
      ?auto_108064 - OBJ
      ?auto_108061 - LOCATION
    )
    :vars
    (
      ?auto_108065 - TRUCK
      ?auto_108066 - LOCATION
      ?auto_108067 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_108062 ?auto_108065 ) ( TRUCK-AT ?auto_108065 ?auto_108066 ) ( IN-CITY ?auto_108066 ?auto_108067 ) ( IN-CITY ?auto_108061 ?auto_108067 ) ( not ( = ?auto_108061 ?auto_108066 ) ) ( OBJ-AT ?auto_108063 ?auto_108061 ) ( not ( = ?auto_108063 ?auto_108062 ) ) ( OBJ-AT ?auto_108064 ?auto_108061 ) ( not ( = ?auto_108062 ?auto_108064 ) ) ( not ( = ?auto_108063 ?auto_108064 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_108063 ?auto_108062 ?auto_108061 )
      ( DELIVER-3PKG-VERIFY ?auto_108062 ?auto_108063 ?auto_108064 ?auto_108061 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_109710 - OBJ
      ?auto_109711 - OBJ
      ?auto_109712 - OBJ
      ?auto_109709 - LOCATION
    )
    :vars
    (
      ?auto_109715 - TRUCK
      ?auto_109714 - LOCATION
      ?auto_109713 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_109715 ?auto_109714 ) ( IN-CITY ?auto_109714 ?auto_109713 ) ( IN-CITY ?auto_109709 ?auto_109713 ) ( not ( = ?auto_109709 ?auto_109714 ) ) ( OBJ-AT ?auto_109712 ?auto_109709 ) ( not ( = ?auto_109712 ?auto_109710 ) ) ( OBJ-AT ?auto_109710 ?auto_109714 ) ( OBJ-AT ?auto_109711 ?auto_109709 ) ( not ( = ?auto_109710 ?auto_109711 ) ) ( not ( = ?auto_109711 ?auto_109712 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_109712 ?auto_109710 ?auto_109709 )
      ( DELIVER-3PKG-VERIFY ?auto_109710 ?auto_109711 ?auto_109712 ?auto_109709 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_114683 - OBJ
      ?auto_114684 - OBJ
      ?auto_114685 - OBJ
      ?auto_114682 - LOCATION
    )
    :vars
    (
      ?auto_114687 - LOCATION
      ?auto_114686 - CITY
      ?auto_114688 - TRUCK
      ?auto_114689 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_114687 ?auto_114686 ) ( IN-CITY ?auto_114682 ?auto_114686 ) ( not ( = ?auto_114682 ?auto_114687 ) ) ( OBJ-AT ?auto_114683 ?auto_114682 ) ( not ( = ?auto_114683 ?auto_114684 ) ) ( OBJ-AT ?auto_114684 ?auto_114687 ) ( TRUCK-AT ?auto_114688 ?auto_114689 ) ( IN-CITY ?auto_114689 ?auto_114686 ) ( not ( = ?auto_114682 ?auto_114689 ) ) ( not ( = ?auto_114687 ?auto_114689 ) ) ( OBJ-AT ?auto_114685 ?auto_114682 ) ( not ( = ?auto_114683 ?auto_114685 ) ) ( not ( = ?auto_114684 ?auto_114685 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_114683 ?auto_114684 ?auto_114682 )
      ( DELIVER-3PKG-VERIFY ?auto_114683 ?auto_114684 ?auto_114685 ?auto_114682 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_114715 - OBJ
      ?auto_114716 - OBJ
      ?auto_114717 - OBJ
      ?auto_114714 - LOCATION
    )
    :vars
    (
      ?auto_114720 - LOCATION
      ?auto_114718 - CITY
      ?auto_114719 - OBJ
      ?auto_114721 - TRUCK
      ?auto_114722 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_114720 ?auto_114718 ) ( IN-CITY ?auto_114714 ?auto_114718 ) ( not ( = ?auto_114714 ?auto_114720 ) ) ( OBJ-AT ?auto_114719 ?auto_114714 ) ( not ( = ?auto_114719 ?auto_114717 ) ) ( OBJ-AT ?auto_114717 ?auto_114720 ) ( TRUCK-AT ?auto_114721 ?auto_114722 ) ( IN-CITY ?auto_114722 ?auto_114718 ) ( not ( = ?auto_114714 ?auto_114722 ) ) ( not ( = ?auto_114720 ?auto_114722 ) ) ( OBJ-AT ?auto_114715 ?auto_114714 ) ( OBJ-AT ?auto_114716 ?auto_114714 ) ( not ( = ?auto_114715 ?auto_114716 ) ) ( not ( = ?auto_114715 ?auto_114717 ) ) ( not ( = ?auto_114715 ?auto_114719 ) ) ( not ( = ?auto_114716 ?auto_114717 ) ) ( not ( = ?auto_114716 ?auto_114719 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_114719 ?auto_114717 ?auto_114714 )
      ( DELIVER-3PKG-VERIFY ?auto_114715 ?auto_114716 ?auto_114717 ?auto_114714 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_114737 - OBJ
      ?auto_114738 - OBJ
      ?auto_114739 - OBJ
      ?auto_114736 - LOCATION
    )
    :vars
    (
      ?auto_114742 - LOCATION
      ?auto_114740 - CITY
      ?auto_114741 - OBJ
      ?auto_114743 - TRUCK
      ?auto_114744 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_114742 ?auto_114740 ) ( IN-CITY ?auto_114736 ?auto_114740 ) ( not ( = ?auto_114736 ?auto_114742 ) ) ( OBJ-AT ?auto_114741 ?auto_114736 ) ( not ( = ?auto_114741 ?auto_114738 ) ) ( OBJ-AT ?auto_114738 ?auto_114742 ) ( TRUCK-AT ?auto_114743 ?auto_114744 ) ( IN-CITY ?auto_114744 ?auto_114740 ) ( not ( = ?auto_114736 ?auto_114744 ) ) ( not ( = ?auto_114742 ?auto_114744 ) ) ( OBJ-AT ?auto_114737 ?auto_114736 ) ( OBJ-AT ?auto_114739 ?auto_114736 ) ( not ( = ?auto_114737 ?auto_114738 ) ) ( not ( = ?auto_114737 ?auto_114739 ) ) ( not ( = ?auto_114737 ?auto_114741 ) ) ( not ( = ?auto_114738 ?auto_114739 ) ) ( not ( = ?auto_114739 ?auto_114741 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_114741 ?auto_114738 ?auto_114736 )
      ( DELIVER-3PKG-VERIFY ?auto_114737 ?auto_114738 ?auto_114739 ?auto_114736 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_114857 - OBJ
      ?auto_114858 - OBJ
      ?auto_114859 - OBJ
      ?auto_114856 - LOCATION
    )
    :vars
    (
      ?auto_114862 - LOCATION
      ?auto_114860 - CITY
      ?auto_114861 - OBJ
      ?auto_114863 - TRUCK
      ?auto_114864 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_114862 ?auto_114860 ) ( IN-CITY ?auto_114856 ?auto_114860 ) ( not ( = ?auto_114856 ?auto_114862 ) ) ( OBJ-AT ?auto_114861 ?auto_114856 ) ( not ( = ?auto_114861 ?auto_114857 ) ) ( OBJ-AT ?auto_114857 ?auto_114862 ) ( TRUCK-AT ?auto_114863 ?auto_114864 ) ( IN-CITY ?auto_114864 ?auto_114860 ) ( not ( = ?auto_114856 ?auto_114864 ) ) ( not ( = ?auto_114862 ?auto_114864 ) ) ( OBJ-AT ?auto_114858 ?auto_114856 ) ( OBJ-AT ?auto_114859 ?auto_114856 ) ( not ( = ?auto_114857 ?auto_114858 ) ) ( not ( = ?auto_114857 ?auto_114859 ) ) ( not ( = ?auto_114858 ?auto_114859 ) ) ( not ( = ?auto_114858 ?auto_114861 ) ) ( not ( = ?auto_114859 ?auto_114861 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_114861 ?auto_114857 ?auto_114856 )
      ( DELIVER-3PKG-VERIFY ?auto_114857 ?auto_114858 ?auto_114859 ?auto_114856 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_114963 - OBJ
      ?auto_114964 - OBJ
      ?auto_114965 - OBJ
      ?auto_114966 - OBJ
      ?auto_114962 - LOCATION
    )
    :vars
    (
      ?auto_114968 - LOCATION
      ?auto_114967 - CITY
      ?auto_114969 - TRUCK
      ?auto_114970 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_114968 ?auto_114967 ) ( IN-CITY ?auto_114962 ?auto_114967 ) ( not ( = ?auto_114962 ?auto_114968 ) ) ( OBJ-AT ?auto_114964 ?auto_114962 ) ( not ( = ?auto_114964 ?auto_114966 ) ) ( OBJ-AT ?auto_114966 ?auto_114968 ) ( TRUCK-AT ?auto_114969 ?auto_114970 ) ( IN-CITY ?auto_114970 ?auto_114967 ) ( not ( = ?auto_114962 ?auto_114970 ) ) ( not ( = ?auto_114968 ?auto_114970 ) ) ( OBJ-AT ?auto_114963 ?auto_114962 ) ( OBJ-AT ?auto_114965 ?auto_114962 ) ( not ( = ?auto_114963 ?auto_114964 ) ) ( not ( = ?auto_114963 ?auto_114965 ) ) ( not ( = ?auto_114963 ?auto_114966 ) ) ( not ( = ?auto_114964 ?auto_114965 ) ) ( not ( = ?auto_114965 ?auto_114966 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_114964 ?auto_114966 ?auto_114962 )
      ( DELIVER-4PKG-VERIFY ?auto_114963 ?auto_114964 ?auto_114965 ?auto_114966 ?auto_114962 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_114990 - OBJ
      ?auto_114991 - OBJ
      ?auto_114992 - OBJ
      ?auto_114993 - OBJ
      ?auto_114989 - LOCATION
    )
    :vars
    (
      ?auto_114995 - LOCATION
      ?auto_114994 - CITY
      ?auto_114996 - TRUCK
      ?auto_114997 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_114995 ?auto_114994 ) ( IN-CITY ?auto_114989 ?auto_114994 ) ( not ( = ?auto_114989 ?auto_114995 ) ) ( OBJ-AT ?auto_114991 ?auto_114989 ) ( not ( = ?auto_114991 ?auto_114992 ) ) ( OBJ-AT ?auto_114992 ?auto_114995 ) ( TRUCK-AT ?auto_114996 ?auto_114997 ) ( IN-CITY ?auto_114997 ?auto_114994 ) ( not ( = ?auto_114989 ?auto_114997 ) ) ( not ( = ?auto_114995 ?auto_114997 ) ) ( OBJ-AT ?auto_114990 ?auto_114989 ) ( OBJ-AT ?auto_114993 ?auto_114989 ) ( not ( = ?auto_114990 ?auto_114991 ) ) ( not ( = ?auto_114990 ?auto_114992 ) ) ( not ( = ?auto_114990 ?auto_114993 ) ) ( not ( = ?auto_114991 ?auto_114993 ) ) ( not ( = ?auto_114992 ?auto_114993 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_114991 ?auto_114992 ?auto_114989 )
      ( DELIVER-4PKG-VERIFY ?auto_114990 ?auto_114991 ?auto_114992 ?auto_114993 ?auto_114989 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115017 - OBJ
      ?auto_115018 - OBJ
      ?auto_115019 - OBJ
      ?auto_115020 - OBJ
      ?auto_115016 - LOCATION
    )
    :vars
    (
      ?auto_115022 - LOCATION
      ?auto_115021 - CITY
      ?auto_115023 - TRUCK
      ?auto_115024 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115022 ?auto_115021 ) ( IN-CITY ?auto_115016 ?auto_115021 ) ( not ( = ?auto_115016 ?auto_115022 ) ) ( OBJ-AT ?auto_115019 ?auto_115016 ) ( not ( = ?auto_115019 ?auto_115020 ) ) ( OBJ-AT ?auto_115020 ?auto_115022 ) ( TRUCK-AT ?auto_115023 ?auto_115024 ) ( IN-CITY ?auto_115024 ?auto_115021 ) ( not ( = ?auto_115016 ?auto_115024 ) ) ( not ( = ?auto_115022 ?auto_115024 ) ) ( OBJ-AT ?auto_115017 ?auto_115016 ) ( OBJ-AT ?auto_115018 ?auto_115016 ) ( not ( = ?auto_115017 ?auto_115018 ) ) ( not ( = ?auto_115017 ?auto_115019 ) ) ( not ( = ?auto_115017 ?auto_115020 ) ) ( not ( = ?auto_115018 ?auto_115019 ) ) ( not ( = ?auto_115018 ?auto_115020 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115019 ?auto_115020 ?auto_115016 )
      ( DELIVER-4PKG-VERIFY ?auto_115017 ?auto_115018 ?auto_115019 ?auto_115020 ?auto_115016 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115152 - OBJ
      ?auto_115153 - OBJ
      ?auto_115154 - OBJ
      ?auto_115155 - OBJ
      ?auto_115151 - LOCATION
    )
    :vars
    (
      ?auto_115157 - LOCATION
      ?auto_115156 - CITY
      ?auto_115158 - TRUCK
      ?auto_115159 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115157 ?auto_115156 ) ( IN-CITY ?auto_115151 ?auto_115156 ) ( not ( = ?auto_115151 ?auto_115157 ) ) ( OBJ-AT ?auto_115154 ?auto_115151 ) ( not ( = ?auto_115154 ?auto_115153 ) ) ( OBJ-AT ?auto_115153 ?auto_115157 ) ( TRUCK-AT ?auto_115158 ?auto_115159 ) ( IN-CITY ?auto_115159 ?auto_115156 ) ( not ( = ?auto_115151 ?auto_115159 ) ) ( not ( = ?auto_115157 ?auto_115159 ) ) ( OBJ-AT ?auto_115152 ?auto_115151 ) ( OBJ-AT ?auto_115155 ?auto_115151 ) ( not ( = ?auto_115152 ?auto_115153 ) ) ( not ( = ?auto_115152 ?auto_115154 ) ) ( not ( = ?auto_115152 ?auto_115155 ) ) ( not ( = ?auto_115153 ?auto_115155 ) ) ( not ( = ?auto_115154 ?auto_115155 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115154 ?auto_115153 ?auto_115151 )
      ( DELIVER-4PKG-VERIFY ?auto_115152 ?auto_115153 ?auto_115154 ?auto_115155 ?auto_115151 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115359 - OBJ
      ?auto_115360 - OBJ
      ?auto_115361 - OBJ
      ?auto_115362 - OBJ
      ?auto_115358 - LOCATION
    )
    :vars
    (
      ?auto_115365 - LOCATION
      ?auto_115363 - CITY
      ?auto_115364 - OBJ
      ?auto_115366 - TRUCK
      ?auto_115367 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115365 ?auto_115363 ) ( IN-CITY ?auto_115358 ?auto_115363 ) ( not ( = ?auto_115358 ?auto_115365 ) ) ( OBJ-AT ?auto_115364 ?auto_115358 ) ( not ( = ?auto_115364 ?auto_115362 ) ) ( OBJ-AT ?auto_115362 ?auto_115365 ) ( TRUCK-AT ?auto_115366 ?auto_115367 ) ( IN-CITY ?auto_115367 ?auto_115363 ) ( not ( = ?auto_115358 ?auto_115367 ) ) ( not ( = ?auto_115365 ?auto_115367 ) ) ( OBJ-AT ?auto_115359 ?auto_115358 ) ( OBJ-AT ?auto_115360 ?auto_115358 ) ( OBJ-AT ?auto_115361 ?auto_115358 ) ( not ( = ?auto_115359 ?auto_115360 ) ) ( not ( = ?auto_115359 ?auto_115361 ) ) ( not ( = ?auto_115359 ?auto_115362 ) ) ( not ( = ?auto_115359 ?auto_115364 ) ) ( not ( = ?auto_115360 ?auto_115361 ) ) ( not ( = ?auto_115360 ?auto_115362 ) ) ( not ( = ?auto_115360 ?auto_115364 ) ) ( not ( = ?auto_115361 ?auto_115362 ) ) ( not ( = ?auto_115361 ?auto_115364 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115364 ?auto_115362 ?auto_115358 )
      ( DELIVER-4PKG-VERIFY ?auto_115359 ?auto_115360 ?auto_115361 ?auto_115362 ?auto_115358 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115379 - OBJ
      ?auto_115380 - OBJ
      ?auto_115381 - OBJ
      ?auto_115382 - OBJ
      ?auto_115378 - LOCATION
    )
    :vars
    (
      ?auto_115384 - LOCATION
      ?auto_115383 - CITY
      ?auto_115385 - TRUCK
      ?auto_115386 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115384 ?auto_115383 ) ( IN-CITY ?auto_115378 ?auto_115383 ) ( not ( = ?auto_115378 ?auto_115384 ) ) ( OBJ-AT ?auto_115382 ?auto_115378 ) ( not ( = ?auto_115382 ?auto_115381 ) ) ( OBJ-AT ?auto_115381 ?auto_115384 ) ( TRUCK-AT ?auto_115385 ?auto_115386 ) ( IN-CITY ?auto_115386 ?auto_115383 ) ( not ( = ?auto_115378 ?auto_115386 ) ) ( not ( = ?auto_115384 ?auto_115386 ) ) ( OBJ-AT ?auto_115379 ?auto_115378 ) ( OBJ-AT ?auto_115380 ?auto_115378 ) ( not ( = ?auto_115379 ?auto_115380 ) ) ( not ( = ?auto_115379 ?auto_115381 ) ) ( not ( = ?auto_115379 ?auto_115382 ) ) ( not ( = ?auto_115380 ?auto_115381 ) ) ( not ( = ?auto_115380 ?auto_115382 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115382 ?auto_115381 ?auto_115378 )
      ( DELIVER-4PKG-VERIFY ?auto_115379 ?auto_115380 ?auto_115381 ?auto_115382 ?auto_115378 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115388 - OBJ
      ?auto_115389 - OBJ
      ?auto_115390 - OBJ
      ?auto_115391 - OBJ
      ?auto_115387 - LOCATION
    )
    :vars
    (
      ?auto_115394 - LOCATION
      ?auto_115392 - CITY
      ?auto_115393 - OBJ
      ?auto_115395 - TRUCK
      ?auto_115396 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115394 ?auto_115392 ) ( IN-CITY ?auto_115387 ?auto_115392 ) ( not ( = ?auto_115387 ?auto_115394 ) ) ( OBJ-AT ?auto_115393 ?auto_115387 ) ( not ( = ?auto_115393 ?auto_115390 ) ) ( OBJ-AT ?auto_115390 ?auto_115394 ) ( TRUCK-AT ?auto_115395 ?auto_115396 ) ( IN-CITY ?auto_115396 ?auto_115392 ) ( not ( = ?auto_115387 ?auto_115396 ) ) ( not ( = ?auto_115394 ?auto_115396 ) ) ( OBJ-AT ?auto_115388 ?auto_115387 ) ( OBJ-AT ?auto_115389 ?auto_115387 ) ( OBJ-AT ?auto_115391 ?auto_115387 ) ( not ( = ?auto_115388 ?auto_115389 ) ) ( not ( = ?auto_115388 ?auto_115390 ) ) ( not ( = ?auto_115388 ?auto_115391 ) ) ( not ( = ?auto_115388 ?auto_115393 ) ) ( not ( = ?auto_115389 ?auto_115390 ) ) ( not ( = ?auto_115389 ?auto_115391 ) ) ( not ( = ?auto_115389 ?auto_115393 ) ) ( not ( = ?auto_115390 ?auto_115391 ) ) ( not ( = ?auto_115391 ?auto_115393 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115393 ?auto_115390 ?auto_115387 )
      ( DELIVER-4PKG-VERIFY ?auto_115388 ?auto_115389 ?auto_115390 ?auto_115391 ?auto_115387 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115486 - OBJ
      ?auto_115487 - OBJ
      ?auto_115488 - OBJ
      ?auto_115489 - OBJ
      ?auto_115485 - LOCATION
    )
    :vars
    (
      ?auto_115491 - LOCATION
      ?auto_115490 - CITY
      ?auto_115492 - TRUCK
      ?auto_115493 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115491 ?auto_115490 ) ( IN-CITY ?auto_115485 ?auto_115490 ) ( not ( = ?auto_115485 ?auto_115491 ) ) ( OBJ-AT ?auto_115489 ?auto_115485 ) ( not ( = ?auto_115489 ?auto_115487 ) ) ( OBJ-AT ?auto_115487 ?auto_115491 ) ( TRUCK-AT ?auto_115492 ?auto_115493 ) ( IN-CITY ?auto_115493 ?auto_115490 ) ( not ( = ?auto_115485 ?auto_115493 ) ) ( not ( = ?auto_115491 ?auto_115493 ) ) ( OBJ-AT ?auto_115486 ?auto_115485 ) ( OBJ-AT ?auto_115488 ?auto_115485 ) ( not ( = ?auto_115486 ?auto_115487 ) ) ( not ( = ?auto_115486 ?auto_115488 ) ) ( not ( = ?auto_115486 ?auto_115489 ) ) ( not ( = ?auto_115487 ?auto_115488 ) ) ( not ( = ?auto_115488 ?auto_115489 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115489 ?auto_115487 ?auto_115485 )
      ( DELIVER-4PKG-VERIFY ?auto_115486 ?auto_115487 ?auto_115488 ?auto_115489 ?auto_115485 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115531 - OBJ
      ?auto_115532 - OBJ
      ?auto_115533 - OBJ
      ?auto_115534 - OBJ
      ?auto_115530 - LOCATION
    )
    :vars
    (
      ?auto_115537 - LOCATION
      ?auto_115535 - CITY
      ?auto_115536 - OBJ
      ?auto_115538 - TRUCK
      ?auto_115539 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115537 ?auto_115535 ) ( IN-CITY ?auto_115530 ?auto_115535 ) ( not ( = ?auto_115530 ?auto_115537 ) ) ( OBJ-AT ?auto_115536 ?auto_115530 ) ( not ( = ?auto_115536 ?auto_115532 ) ) ( OBJ-AT ?auto_115532 ?auto_115537 ) ( TRUCK-AT ?auto_115538 ?auto_115539 ) ( IN-CITY ?auto_115539 ?auto_115535 ) ( not ( = ?auto_115530 ?auto_115539 ) ) ( not ( = ?auto_115537 ?auto_115539 ) ) ( OBJ-AT ?auto_115531 ?auto_115530 ) ( OBJ-AT ?auto_115533 ?auto_115530 ) ( OBJ-AT ?auto_115534 ?auto_115530 ) ( not ( = ?auto_115531 ?auto_115532 ) ) ( not ( = ?auto_115531 ?auto_115533 ) ) ( not ( = ?auto_115531 ?auto_115534 ) ) ( not ( = ?auto_115531 ?auto_115536 ) ) ( not ( = ?auto_115532 ?auto_115533 ) ) ( not ( = ?auto_115532 ?auto_115534 ) ) ( not ( = ?auto_115533 ?auto_115534 ) ) ( not ( = ?auto_115533 ?auto_115536 ) ) ( not ( = ?auto_115534 ?auto_115536 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115536 ?auto_115532 ?auto_115530 )
      ( DELIVER-4PKG-VERIFY ?auto_115531 ?auto_115532 ?auto_115533 ?auto_115534 ?auto_115530 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_116171 - OBJ
      ?auto_116172 - OBJ
      ?auto_116173 - OBJ
      ?auto_116174 - OBJ
      ?auto_116170 - LOCATION
    )
    :vars
    (
      ?auto_116176 - LOCATION
      ?auto_116175 - CITY
      ?auto_116177 - TRUCK
      ?auto_116178 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_116176 ?auto_116175 ) ( IN-CITY ?auto_116170 ?auto_116175 ) ( not ( = ?auto_116170 ?auto_116176 ) ) ( OBJ-AT ?auto_116174 ?auto_116170 ) ( not ( = ?auto_116174 ?auto_116171 ) ) ( OBJ-AT ?auto_116171 ?auto_116176 ) ( TRUCK-AT ?auto_116177 ?auto_116178 ) ( IN-CITY ?auto_116178 ?auto_116175 ) ( not ( = ?auto_116170 ?auto_116178 ) ) ( not ( = ?auto_116176 ?auto_116178 ) ) ( OBJ-AT ?auto_116172 ?auto_116170 ) ( OBJ-AT ?auto_116173 ?auto_116170 ) ( not ( = ?auto_116171 ?auto_116172 ) ) ( not ( = ?auto_116171 ?auto_116173 ) ) ( not ( = ?auto_116172 ?auto_116173 ) ) ( not ( = ?auto_116172 ?auto_116174 ) ) ( not ( = ?auto_116173 ?auto_116174 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_116174 ?auto_116171 ?auto_116170 )
      ( DELIVER-4PKG-VERIFY ?auto_116171 ?auto_116172 ?auto_116173 ?auto_116174 ?auto_116170 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_116180 - OBJ
      ?auto_116181 - OBJ
      ?auto_116182 - OBJ
      ?auto_116183 - OBJ
      ?auto_116179 - LOCATION
    )
    :vars
    (
      ?auto_116186 - LOCATION
      ?auto_116184 - CITY
      ?auto_116185 - OBJ
      ?auto_116187 - TRUCK
      ?auto_116188 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_116186 ?auto_116184 ) ( IN-CITY ?auto_116179 ?auto_116184 ) ( not ( = ?auto_116179 ?auto_116186 ) ) ( OBJ-AT ?auto_116185 ?auto_116179 ) ( not ( = ?auto_116185 ?auto_116180 ) ) ( OBJ-AT ?auto_116180 ?auto_116186 ) ( TRUCK-AT ?auto_116187 ?auto_116188 ) ( IN-CITY ?auto_116188 ?auto_116184 ) ( not ( = ?auto_116179 ?auto_116188 ) ) ( not ( = ?auto_116186 ?auto_116188 ) ) ( OBJ-AT ?auto_116181 ?auto_116179 ) ( OBJ-AT ?auto_116182 ?auto_116179 ) ( OBJ-AT ?auto_116183 ?auto_116179 ) ( not ( = ?auto_116180 ?auto_116181 ) ) ( not ( = ?auto_116180 ?auto_116182 ) ) ( not ( = ?auto_116180 ?auto_116183 ) ) ( not ( = ?auto_116181 ?auto_116182 ) ) ( not ( = ?auto_116181 ?auto_116183 ) ) ( not ( = ?auto_116181 ?auto_116185 ) ) ( not ( = ?auto_116182 ?auto_116183 ) ) ( not ( = ?auto_116182 ?auto_116185 ) ) ( not ( = ?auto_116183 ?auto_116185 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_116185 ?auto_116180 ?auto_116179 )
      ( DELIVER-4PKG-VERIFY ?auto_116180 ?auto_116181 ?auto_116182 ?auto_116183 ?auto_116179 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_118743 - OBJ
      ?auto_118744 - OBJ
      ?auto_118745 - OBJ
      ?auto_118742 - LOCATION
    )
    :vars
    (
      ?auto_118747 - LOCATION
      ?auto_118746 - CITY
      ?auto_118748 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_118747 ?auto_118746 ) ( IN-CITY ?auto_118742 ?auto_118746 ) ( not ( = ?auto_118742 ?auto_118747 ) ) ( OBJ-AT ?auto_118744 ?auto_118742 ) ( not ( = ?auto_118744 ?auto_118743 ) ) ( OBJ-AT ?auto_118743 ?auto_118747 ) ( TRUCK-AT ?auto_118748 ?auto_118742 ) ( OBJ-AT ?auto_118745 ?auto_118742 ) ( not ( = ?auto_118743 ?auto_118745 ) ) ( not ( = ?auto_118744 ?auto_118745 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_118744 ?auto_118743 ?auto_118742 )
      ( DELIVER-3PKG-VERIFY ?auto_118743 ?auto_118744 ?auto_118745 ?auto_118742 ) )
  )

)

