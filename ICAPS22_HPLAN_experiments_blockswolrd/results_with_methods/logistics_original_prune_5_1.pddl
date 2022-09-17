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
      ?auto_892728 - OBJ
      ?auto_892727 - LOCATION
    )
    :vars
    (
      ?auto_892729 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_892729 ?auto_892727 ) ( IN-TRUCK ?auto_892728 ?auto_892729 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_892728 ?auto_892729 ?auto_892727 )
      ( DELIVER-1PKG-VERIFY ?auto_892728 ?auto_892727 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_892753 - OBJ
      ?auto_892752 - LOCATION
    )
    :vars
    (
      ?auto_892754 - TRUCK
      ?auto_892755 - LOCATION
      ?auto_892756 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_892753 ?auto_892754 ) ( TRUCK-AT ?auto_892754 ?auto_892755 ) ( IN-CITY ?auto_892755 ?auto_892756 ) ( IN-CITY ?auto_892752 ?auto_892756 ) ( not ( = ?auto_892752 ?auto_892755 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_892754 ?auto_892755 ?auto_892752 ?auto_892756 )
      ( DELIVER-1PKG ?auto_892753 ?auto_892752 )
      ( DELIVER-1PKG-VERIFY ?auto_892753 ?auto_892752 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_892788 - OBJ
      ?auto_892787 - LOCATION
    )
    :vars
    (
      ?auto_892790 - TRUCK
      ?auto_892789 - LOCATION
      ?auto_892791 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_892790 ?auto_892789 ) ( IN-CITY ?auto_892789 ?auto_892791 ) ( IN-CITY ?auto_892787 ?auto_892791 ) ( not ( = ?auto_892787 ?auto_892789 ) ) ( OBJ-AT ?auto_892788 ?auto_892789 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_892788 ?auto_892790 ?auto_892789 )
      ( DELIVER-1PKG ?auto_892788 ?auto_892787 )
      ( DELIVER-1PKG-VERIFY ?auto_892788 ?auto_892787 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_892823 - OBJ
      ?auto_892822 - LOCATION
    )
    :vars
    (
      ?auto_892826 - LOCATION
      ?auto_892824 - CITY
      ?auto_892825 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_892826 ?auto_892824 ) ( IN-CITY ?auto_892822 ?auto_892824 ) ( not ( = ?auto_892822 ?auto_892826 ) ) ( OBJ-AT ?auto_892823 ?auto_892826 ) ( TRUCK-AT ?auto_892825 ?auto_892822 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_892825 ?auto_892822 ?auto_892826 ?auto_892824 )
      ( DELIVER-1PKG ?auto_892823 ?auto_892822 )
      ( DELIVER-1PKG-VERIFY ?auto_892823 ?auto_892822 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_893161 - OBJ
      ?auto_893162 - OBJ
      ?auto_893160 - LOCATION
    )
    :vars
    (
      ?auto_893163 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_893163 ?auto_893160 ) ( IN-TRUCK ?auto_893162 ?auto_893163 ) ( OBJ-AT ?auto_893161 ?auto_893160 ) ( not ( = ?auto_893161 ?auto_893162 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_893162 ?auto_893160 )
      ( DELIVER-2PKG-VERIFY ?auto_893161 ?auto_893162 ?auto_893160 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_893165 - OBJ
      ?auto_893166 - OBJ
      ?auto_893164 - LOCATION
    )
    :vars
    (
      ?auto_893167 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_893167 ?auto_893164 ) ( IN-TRUCK ?auto_893165 ?auto_893167 ) ( OBJ-AT ?auto_893166 ?auto_893164 ) ( not ( = ?auto_893165 ?auto_893166 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_893165 ?auto_893164 )
      ( DELIVER-2PKG-VERIFY ?auto_893165 ?auto_893166 ?auto_893164 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_893173 - OBJ
      ?auto_893174 - OBJ
      ?auto_893175 - OBJ
      ?auto_893172 - LOCATION
    )
    :vars
    (
      ?auto_893176 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_893176 ?auto_893172 ) ( IN-TRUCK ?auto_893175 ?auto_893176 ) ( OBJ-AT ?auto_893173 ?auto_893172 ) ( OBJ-AT ?auto_893174 ?auto_893172 ) ( not ( = ?auto_893173 ?auto_893174 ) ) ( not ( = ?auto_893173 ?auto_893175 ) ) ( not ( = ?auto_893174 ?auto_893175 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_893175 ?auto_893172 )
      ( DELIVER-3PKG-VERIFY ?auto_893173 ?auto_893174 ?auto_893175 ?auto_893172 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_893178 - OBJ
      ?auto_893179 - OBJ
      ?auto_893180 - OBJ
      ?auto_893177 - LOCATION
    )
    :vars
    (
      ?auto_893181 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_893181 ?auto_893177 ) ( IN-TRUCK ?auto_893179 ?auto_893181 ) ( OBJ-AT ?auto_893178 ?auto_893177 ) ( OBJ-AT ?auto_893180 ?auto_893177 ) ( not ( = ?auto_893178 ?auto_893179 ) ) ( not ( = ?auto_893178 ?auto_893180 ) ) ( not ( = ?auto_893179 ?auto_893180 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_893179 ?auto_893177 )
      ( DELIVER-3PKG-VERIFY ?auto_893178 ?auto_893179 ?auto_893180 ?auto_893177 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_893188 - OBJ
      ?auto_893189 - OBJ
      ?auto_893190 - OBJ
      ?auto_893187 - LOCATION
    )
    :vars
    (
      ?auto_893191 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_893191 ?auto_893187 ) ( IN-TRUCK ?auto_893188 ?auto_893191 ) ( OBJ-AT ?auto_893189 ?auto_893187 ) ( OBJ-AT ?auto_893190 ?auto_893187 ) ( not ( = ?auto_893188 ?auto_893189 ) ) ( not ( = ?auto_893188 ?auto_893190 ) ) ( not ( = ?auto_893189 ?auto_893190 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_893188 ?auto_893187 )
      ( DELIVER-3PKG-VERIFY ?auto_893188 ?auto_893189 ?auto_893190 ?auto_893187 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_893208 - OBJ
      ?auto_893209 - OBJ
      ?auto_893210 - OBJ
      ?auto_893211 - OBJ
      ?auto_893207 - LOCATION
    )
    :vars
    (
      ?auto_893212 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_893212 ?auto_893207 ) ( IN-TRUCK ?auto_893211 ?auto_893212 ) ( OBJ-AT ?auto_893208 ?auto_893207 ) ( OBJ-AT ?auto_893209 ?auto_893207 ) ( OBJ-AT ?auto_893210 ?auto_893207 ) ( not ( = ?auto_893208 ?auto_893209 ) ) ( not ( = ?auto_893208 ?auto_893210 ) ) ( not ( = ?auto_893208 ?auto_893211 ) ) ( not ( = ?auto_893209 ?auto_893210 ) ) ( not ( = ?auto_893209 ?auto_893211 ) ) ( not ( = ?auto_893210 ?auto_893211 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_893211 ?auto_893207 )
      ( DELIVER-4PKG-VERIFY ?auto_893208 ?auto_893209 ?auto_893210 ?auto_893211 ?auto_893207 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_893214 - OBJ
      ?auto_893215 - OBJ
      ?auto_893216 - OBJ
      ?auto_893217 - OBJ
      ?auto_893213 - LOCATION
    )
    :vars
    (
      ?auto_893218 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_893218 ?auto_893213 ) ( IN-TRUCK ?auto_893216 ?auto_893218 ) ( OBJ-AT ?auto_893214 ?auto_893213 ) ( OBJ-AT ?auto_893215 ?auto_893213 ) ( OBJ-AT ?auto_893217 ?auto_893213 ) ( not ( = ?auto_893214 ?auto_893215 ) ) ( not ( = ?auto_893214 ?auto_893216 ) ) ( not ( = ?auto_893214 ?auto_893217 ) ) ( not ( = ?auto_893215 ?auto_893216 ) ) ( not ( = ?auto_893215 ?auto_893217 ) ) ( not ( = ?auto_893216 ?auto_893217 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_893216 ?auto_893213 )
      ( DELIVER-4PKG-VERIFY ?auto_893214 ?auto_893215 ?auto_893216 ?auto_893217 ?auto_893213 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_893226 - OBJ
      ?auto_893227 - OBJ
      ?auto_893228 - OBJ
      ?auto_893229 - OBJ
      ?auto_893225 - LOCATION
    )
    :vars
    (
      ?auto_893230 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_893230 ?auto_893225 ) ( IN-TRUCK ?auto_893227 ?auto_893230 ) ( OBJ-AT ?auto_893226 ?auto_893225 ) ( OBJ-AT ?auto_893228 ?auto_893225 ) ( OBJ-AT ?auto_893229 ?auto_893225 ) ( not ( = ?auto_893226 ?auto_893227 ) ) ( not ( = ?auto_893226 ?auto_893228 ) ) ( not ( = ?auto_893226 ?auto_893229 ) ) ( not ( = ?auto_893227 ?auto_893228 ) ) ( not ( = ?auto_893227 ?auto_893229 ) ) ( not ( = ?auto_893228 ?auto_893229 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_893227 ?auto_893225 )
      ( DELIVER-4PKG-VERIFY ?auto_893226 ?auto_893227 ?auto_893228 ?auto_893229 ?auto_893225 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_893250 - OBJ
      ?auto_893251 - OBJ
      ?auto_893252 - OBJ
      ?auto_893253 - OBJ
      ?auto_893249 - LOCATION
    )
    :vars
    (
      ?auto_893254 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_893254 ?auto_893249 ) ( IN-TRUCK ?auto_893250 ?auto_893254 ) ( OBJ-AT ?auto_893251 ?auto_893249 ) ( OBJ-AT ?auto_893252 ?auto_893249 ) ( OBJ-AT ?auto_893253 ?auto_893249 ) ( not ( = ?auto_893250 ?auto_893251 ) ) ( not ( = ?auto_893250 ?auto_893252 ) ) ( not ( = ?auto_893250 ?auto_893253 ) ) ( not ( = ?auto_893251 ?auto_893252 ) ) ( not ( = ?auto_893251 ?auto_893253 ) ) ( not ( = ?auto_893252 ?auto_893253 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_893250 ?auto_893249 )
      ( DELIVER-4PKG-VERIFY ?auto_893250 ?auto_893251 ?auto_893252 ?auto_893253 ?auto_893249 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_893298 - OBJ
      ?auto_893299 - OBJ
      ?auto_893300 - OBJ
      ?auto_893301 - OBJ
      ?auto_893302 - OBJ
      ?auto_893297 - LOCATION
    )
    :vars
    (
      ?auto_893303 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_893303 ?auto_893297 ) ( IN-TRUCK ?auto_893302 ?auto_893303 ) ( OBJ-AT ?auto_893298 ?auto_893297 ) ( OBJ-AT ?auto_893299 ?auto_893297 ) ( OBJ-AT ?auto_893300 ?auto_893297 ) ( OBJ-AT ?auto_893301 ?auto_893297 ) ( not ( = ?auto_893298 ?auto_893299 ) ) ( not ( = ?auto_893298 ?auto_893300 ) ) ( not ( = ?auto_893298 ?auto_893301 ) ) ( not ( = ?auto_893298 ?auto_893302 ) ) ( not ( = ?auto_893299 ?auto_893300 ) ) ( not ( = ?auto_893299 ?auto_893301 ) ) ( not ( = ?auto_893299 ?auto_893302 ) ) ( not ( = ?auto_893300 ?auto_893301 ) ) ( not ( = ?auto_893300 ?auto_893302 ) ) ( not ( = ?auto_893301 ?auto_893302 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_893302 ?auto_893297 )
      ( DELIVER-5PKG-VERIFY ?auto_893298 ?auto_893299 ?auto_893300 ?auto_893301 ?auto_893302 ?auto_893297 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_893305 - OBJ
      ?auto_893306 - OBJ
      ?auto_893307 - OBJ
      ?auto_893308 - OBJ
      ?auto_893309 - OBJ
      ?auto_893304 - LOCATION
    )
    :vars
    (
      ?auto_893310 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_893310 ?auto_893304 ) ( IN-TRUCK ?auto_893308 ?auto_893310 ) ( OBJ-AT ?auto_893305 ?auto_893304 ) ( OBJ-AT ?auto_893306 ?auto_893304 ) ( OBJ-AT ?auto_893307 ?auto_893304 ) ( OBJ-AT ?auto_893309 ?auto_893304 ) ( not ( = ?auto_893305 ?auto_893306 ) ) ( not ( = ?auto_893305 ?auto_893307 ) ) ( not ( = ?auto_893305 ?auto_893308 ) ) ( not ( = ?auto_893305 ?auto_893309 ) ) ( not ( = ?auto_893306 ?auto_893307 ) ) ( not ( = ?auto_893306 ?auto_893308 ) ) ( not ( = ?auto_893306 ?auto_893309 ) ) ( not ( = ?auto_893307 ?auto_893308 ) ) ( not ( = ?auto_893307 ?auto_893309 ) ) ( not ( = ?auto_893308 ?auto_893309 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_893308 ?auto_893304 )
      ( DELIVER-5PKG-VERIFY ?auto_893305 ?auto_893306 ?auto_893307 ?auto_893308 ?auto_893309 ?auto_893304 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_893319 - OBJ
      ?auto_893320 - OBJ
      ?auto_893321 - OBJ
      ?auto_893322 - OBJ
      ?auto_893323 - OBJ
      ?auto_893318 - LOCATION
    )
    :vars
    (
      ?auto_893324 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_893324 ?auto_893318 ) ( IN-TRUCK ?auto_893321 ?auto_893324 ) ( OBJ-AT ?auto_893319 ?auto_893318 ) ( OBJ-AT ?auto_893320 ?auto_893318 ) ( OBJ-AT ?auto_893322 ?auto_893318 ) ( OBJ-AT ?auto_893323 ?auto_893318 ) ( not ( = ?auto_893319 ?auto_893320 ) ) ( not ( = ?auto_893319 ?auto_893321 ) ) ( not ( = ?auto_893319 ?auto_893322 ) ) ( not ( = ?auto_893319 ?auto_893323 ) ) ( not ( = ?auto_893320 ?auto_893321 ) ) ( not ( = ?auto_893320 ?auto_893322 ) ) ( not ( = ?auto_893320 ?auto_893323 ) ) ( not ( = ?auto_893321 ?auto_893322 ) ) ( not ( = ?auto_893321 ?auto_893323 ) ) ( not ( = ?auto_893322 ?auto_893323 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_893321 ?auto_893318 )
      ( DELIVER-5PKG-VERIFY ?auto_893319 ?auto_893320 ?auto_893321 ?auto_893322 ?auto_893323 ?auto_893318 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_893347 - OBJ
      ?auto_893348 - OBJ
      ?auto_893349 - OBJ
      ?auto_893350 - OBJ
      ?auto_893351 - OBJ
      ?auto_893346 - LOCATION
    )
    :vars
    (
      ?auto_893352 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_893352 ?auto_893346 ) ( IN-TRUCK ?auto_893348 ?auto_893352 ) ( OBJ-AT ?auto_893347 ?auto_893346 ) ( OBJ-AT ?auto_893349 ?auto_893346 ) ( OBJ-AT ?auto_893350 ?auto_893346 ) ( OBJ-AT ?auto_893351 ?auto_893346 ) ( not ( = ?auto_893347 ?auto_893348 ) ) ( not ( = ?auto_893347 ?auto_893349 ) ) ( not ( = ?auto_893347 ?auto_893350 ) ) ( not ( = ?auto_893347 ?auto_893351 ) ) ( not ( = ?auto_893348 ?auto_893349 ) ) ( not ( = ?auto_893348 ?auto_893350 ) ) ( not ( = ?auto_893348 ?auto_893351 ) ) ( not ( = ?auto_893349 ?auto_893350 ) ) ( not ( = ?auto_893349 ?auto_893351 ) ) ( not ( = ?auto_893350 ?auto_893351 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_893348 ?auto_893346 )
      ( DELIVER-5PKG-VERIFY ?auto_893347 ?auto_893348 ?auto_893349 ?auto_893350 ?auto_893351 ?auto_893346 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_893403 - OBJ
      ?auto_893404 - OBJ
      ?auto_893405 - OBJ
      ?auto_893406 - OBJ
      ?auto_893407 - OBJ
      ?auto_893402 - LOCATION
    )
    :vars
    (
      ?auto_893408 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_893408 ?auto_893402 ) ( IN-TRUCK ?auto_893403 ?auto_893408 ) ( OBJ-AT ?auto_893404 ?auto_893402 ) ( OBJ-AT ?auto_893405 ?auto_893402 ) ( OBJ-AT ?auto_893406 ?auto_893402 ) ( OBJ-AT ?auto_893407 ?auto_893402 ) ( not ( = ?auto_893403 ?auto_893404 ) ) ( not ( = ?auto_893403 ?auto_893405 ) ) ( not ( = ?auto_893403 ?auto_893406 ) ) ( not ( = ?auto_893403 ?auto_893407 ) ) ( not ( = ?auto_893404 ?auto_893405 ) ) ( not ( = ?auto_893404 ?auto_893406 ) ) ( not ( = ?auto_893404 ?auto_893407 ) ) ( not ( = ?auto_893405 ?auto_893406 ) ) ( not ( = ?auto_893405 ?auto_893407 ) ) ( not ( = ?auto_893406 ?auto_893407 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_893403 ?auto_893402 )
      ( DELIVER-5PKG-VERIFY ?auto_893403 ?auto_893404 ?auto_893405 ?auto_893406 ?auto_893407 ?auto_893402 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_893520 - OBJ
      ?auto_893521 - OBJ
      ?auto_893519 - LOCATION
    )
    :vars
    (
      ?auto_893523 - TRUCK
      ?auto_893524 - LOCATION
      ?auto_893522 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_893521 ?auto_893523 ) ( TRUCK-AT ?auto_893523 ?auto_893524 ) ( IN-CITY ?auto_893524 ?auto_893522 ) ( IN-CITY ?auto_893519 ?auto_893522 ) ( not ( = ?auto_893519 ?auto_893524 ) ) ( OBJ-AT ?auto_893520 ?auto_893519 ) ( not ( = ?auto_893520 ?auto_893521 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_893521 ?auto_893519 )
      ( DELIVER-2PKG-VERIFY ?auto_893520 ?auto_893521 ?auto_893519 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_893526 - OBJ
      ?auto_893527 - OBJ
      ?auto_893525 - LOCATION
    )
    :vars
    (
      ?auto_893530 - TRUCK
      ?auto_893528 - LOCATION
      ?auto_893529 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_893526 ?auto_893530 ) ( TRUCK-AT ?auto_893530 ?auto_893528 ) ( IN-CITY ?auto_893528 ?auto_893529 ) ( IN-CITY ?auto_893525 ?auto_893529 ) ( not ( = ?auto_893525 ?auto_893528 ) ) ( OBJ-AT ?auto_893527 ?auto_893525 ) ( not ( = ?auto_893527 ?auto_893526 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_893527 ?auto_893526 ?auto_893525 )
      ( DELIVER-2PKG-VERIFY ?auto_893526 ?auto_893527 ?auto_893525 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_893539 - OBJ
      ?auto_893540 - OBJ
      ?auto_893541 - OBJ
      ?auto_893538 - LOCATION
    )
    :vars
    (
      ?auto_893544 - TRUCK
      ?auto_893542 - LOCATION
      ?auto_893543 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_893541 ?auto_893544 ) ( TRUCK-AT ?auto_893544 ?auto_893542 ) ( IN-CITY ?auto_893542 ?auto_893543 ) ( IN-CITY ?auto_893538 ?auto_893543 ) ( not ( = ?auto_893538 ?auto_893542 ) ) ( OBJ-AT ?auto_893540 ?auto_893538 ) ( not ( = ?auto_893540 ?auto_893541 ) ) ( OBJ-AT ?auto_893539 ?auto_893538 ) ( not ( = ?auto_893539 ?auto_893540 ) ) ( not ( = ?auto_893539 ?auto_893541 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_893540 ?auto_893541 ?auto_893538 )
      ( DELIVER-3PKG-VERIFY ?auto_893539 ?auto_893540 ?auto_893541 ?auto_893538 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_893546 - OBJ
      ?auto_893547 - OBJ
      ?auto_893548 - OBJ
      ?auto_893545 - LOCATION
    )
    :vars
    (
      ?auto_893551 - TRUCK
      ?auto_893549 - LOCATION
      ?auto_893550 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_893547 ?auto_893551 ) ( TRUCK-AT ?auto_893551 ?auto_893549 ) ( IN-CITY ?auto_893549 ?auto_893550 ) ( IN-CITY ?auto_893545 ?auto_893550 ) ( not ( = ?auto_893545 ?auto_893549 ) ) ( OBJ-AT ?auto_893548 ?auto_893545 ) ( not ( = ?auto_893548 ?auto_893547 ) ) ( OBJ-AT ?auto_893546 ?auto_893545 ) ( not ( = ?auto_893546 ?auto_893547 ) ) ( not ( = ?auto_893546 ?auto_893548 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_893548 ?auto_893547 ?auto_893545 )
      ( DELIVER-3PKG-VERIFY ?auto_893546 ?auto_893547 ?auto_893548 ?auto_893545 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_893560 - OBJ
      ?auto_893561 - OBJ
      ?auto_893562 - OBJ
      ?auto_893559 - LOCATION
    )
    :vars
    (
      ?auto_893565 - TRUCK
      ?auto_893563 - LOCATION
      ?auto_893564 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_893560 ?auto_893565 ) ( TRUCK-AT ?auto_893565 ?auto_893563 ) ( IN-CITY ?auto_893563 ?auto_893564 ) ( IN-CITY ?auto_893559 ?auto_893564 ) ( not ( = ?auto_893559 ?auto_893563 ) ) ( OBJ-AT ?auto_893562 ?auto_893559 ) ( not ( = ?auto_893562 ?auto_893560 ) ) ( OBJ-AT ?auto_893561 ?auto_893559 ) ( not ( = ?auto_893560 ?auto_893561 ) ) ( not ( = ?auto_893561 ?auto_893562 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_893562 ?auto_893560 ?auto_893559 )
      ( DELIVER-3PKG-VERIFY ?auto_893560 ?auto_893561 ?auto_893562 ?auto_893559 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_893589 - OBJ
      ?auto_893590 - OBJ
      ?auto_893591 - OBJ
      ?auto_893592 - OBJ
      ?auto_893588 - LOCATION
    )
    :vars
    (
      ?auto_893595 - TRUCK
      ?auto_893593 - LOCATION
      ?auto_893594 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_893592 ?auto_893595 ) ( TRUCK-AT ?auto_893595 ?auto_893593 ) ( IN-CITY ?auto_893593 ?auto_893594 ) ( IN-CITY ?auto_893588 ?auto_893594 ) ( not ( = ?auto_893588 ?auto_893593 ) ) ( OBJ-AT ?auto_893590 ?auto_893588 ) ( not ( = ?auto_893590 ?auto_893592 ) ) ( OBJ-AT ?auto_893589 ?auto_893588 ) ( OBJ-AT ?auto_893591 ?auto_893588 ) ( not ( = ?auto_893589 ?auto_893590 ) ) ( not ( = ?auto_893589 ?auto_893591 ) ) ( not ( = ?auto_893589 ?auto_893592 ) ) ( not ( = ?auto_893590 ?auto_893591 ) ) ( not ( = ?auto_893591 ?auto_893592 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_893590 ?auto_893592 ?auto_893588 )
      ( DELIVER-4PKG-VERIFY ?auto_893589 ?auto_893590 ?auto_893591 ?auto_893592 ?auto_893588 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_893597 - OBJ
      ?auto_893598 - OBJ
      ?auto_893599 - OBJ
      ?auto_893600 - OBJ
      ?auto_893596 - LOCATION
    )
    :vars
    (
      ?auto_893603 - TRUCK
      ?auto_893601 - LOCATION
      ?auto_893602 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_893599 ?auto_893603 ) ( TRUCK-AT ?auto_893603 ?auto_893601 ) ( IN-CITY ?auto_893601 ?auto_893602 ) ( IN-CITY ?auto_893596 ?auto_893602 ) ( not ( = ?auto_893596 ?auto_893601 ) ) ( OBJ-AT ?auto_893600 ?auto_893596 ) ( not ( = ?auto_893600 ?auto_893599 ) ) ( OBJ-AT ?auto_893597 ?auto_893596 ) ( OBJ-AT ?auto_893598 ?auto_893596 ) ( not ( = ?auto_893597 ?auto_893598 ) ) ( not ( = ?auto_893597 ?auto_893599 ) ) ( not ( = ?auto_893597 ?auto_893600 ) ) ( not ( = ?auto_893598 ?auto_893599 ) ) ( not ( = ?auto_893598 ?auto_893600 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_893600 ?auto_893599 ?auto_893596 )
      ( DELIVER-4PKG-VERIFY ?auto_893597 ?auto_893598 ?auto_893599 ?auto_893600 ?auto_893596 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_893613 - OBJ
      ?auto_893614 - OBJ
      ?auto_893615 - OBJ
      ?auto_893616 - OBJ
      ?auto_893612 - LOCATION
    )
    :vars
    (
      ?auto_893619 - TRUCK
      ?auto_893617 - LOCATION
      ?auto_893618 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_893614 ?auto_893619 ) ( TRUCK-AT ?auto_893619 ?auto_893617 ) ( IN-CITY ?auto_893617 ?auto_893618 ) ( IN-CITY ?auto_893612 ?auto_893618 ) ( not ( = ?auto_893612 ?auto_893617 ) ) ( OBJ-AT ?auto_893613 ?auto_893612 ) ( not ( = ?auto_893613 ?auto_893614 ) ) ( OBJ-AT ?auto_893615 ?auto_893612 ) ( OBJ-AT ?auto_893616 ?auto_893612 ) ( not ( = ?auto_893613 ?auto_893615 ) ) ( not ( = ?auto_893613 ?auto_893616 ) ) ( not ( = ?auto_893614 ?auto_893615 ) ) ( not ( = ?auto_893614 ?auto_893616 ) ) ( not ( = ?auto_893615 ?auto_893616 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_893613 ?auto_893614 ?auto_893612 )
      ( DELIVER-4PKG-VERIFY ?auto_893613 ?auto_893614 ?auto_893615 ?auto_893616 ?auto_893612 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_893645 - OBJ
      ?auto_893646 - OBJ
      ?auto_893647 - OBJ
      ?auto_893648 - OBJ
      ?auto_893644 - LOCATION
    )
    :vars
    (
      ?auto_893651 - TRUCK
      ?auto_893649 - LOCATION
      ?auto_893650 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_893645 ?auto_893651 ) ( TRUCK-AT ?auto_893651 ?auto_893649 ) ( IN-CITY ?auto_893649 ?auto_893650 ) ( IN-CITY ?auto_893644 ?auto_893650 ) ( not ( = ?auto_893644 ?auto_893649 ) ) ( OBJ-AT ?auto_893648 ?auto_893644 ) ( not ( = ?auto_893648 ?auto_893645 ) ) ( OBJ-AT ?auto_893646 ?auto_893644 ) ( OBJ-AT ?auto_893647 ?auto_893644 ) ( not ( = ?auto_893645 ?auto_893646 ) ) ( not ( = ?auto_893645 ?auto_893647 ) ) ( not ( = ?auto_893646 ?auto_893647 ) ) ( not ( = ?auto_893646 ?auto_893648 ) ) ( not ( = ?auto_893647 ?auto_893648 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_893648 ?auto_893645 ?auto_893644 )
      ( DELIVER-4PKG-VERIFY ?auto_893645 ?auto_893646 ?auto_893647 ?auto_893648 ?auto_893644 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_893710 - OBJ
      ?auto_893711 - OBJ
      ?auto_893712 - OBJ
      ?auto_893713 - OBJ
      ?auto_893714 - OBJ
      ?auto_893709 - LOCATION
    )
    :vars
    (
      ?auto_893717 - TRUCK
      ?auto_893715 - LOCATION
      ?auto_893716 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_893714 ?auto_893717 ) ( TRUCK-AT ?auto_893717 ?auto_893715 ) ( IN-CITY ?auto_893715 ?auto_893716 ) ( IN-CITY ?auto_893709 ?auto_893716 ) ( not ( = ?auto_893709 ?auto_893715 ) ) ( OBJ-AT ?auto_893713 ?auto_893709 ) ( not ( = ?auto_893713 ?auto_893714 ) ) ( OBJ-AT ?auto_893710 ?auto_893709 ) ( OBJ-AT ?auto_893711 ?auto_893709 ) ( OBJ-AT ?auto_893712 ?auto_893709 ) ( not ( = ?auto_893710 ?auto_893711 ) ) ( not ( = ?auto_893710 ?auto_893712 ) ) ( not ( = ?auto_893710 ?auto_893713 ) ) ( not ( = ?auto_893710 ?auto_893714 ) ) ( not ( = ?auto_893711 ?auto_893712 ) ) ( not ( = ?auto_893711 ?auto_893713 ) ) ( not ( = ?auto_893711 ?auto_893714 ) ) ( not ( = ?auto_893712 ?auto_893713 ) ) ( not ( = ?auto_893712 ?auto_893714 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_893713 ?auto_893714 ?auto_893709 )
      ( DELIVER-5PKG-VERIFY ?auto_893710 ?auto_893711 ?auto_893712 ?auto_893713 ?auto_893714 ?auto_893709 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_893719 - OBJ
      ?auto_893720 - OBJ
      ?auto_893721 - OBJ
      ?auto_893722 - OBJ
      ?auto_893723 - OBJ
      ?auto_893718 - LOCATION
    )
    :vars
    (
      ?auto_893726 - TRUCK
      ?auto_893724 - LOCATION
      ?auto_893725 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_893722 ?auto_893726 ) ( TRUCK-AT ?auto_893726 ?auto_893724 ) ( IN-CITY ?auto_893724 ?auto_893725 ) ( IN-CITY ?auto_893718 ?auto_893725 ) ( not ( = ?auto_893718 ?auto_893724 ) ) ( OBJ-AT ?auto_893720 ?auto_893718 ) ( not ( = ?auto_893720 ?auto_893722 ) ) ( OBJ-AT ?auto_893719 ?auto_893718 ) ( OBJ-AT ?auto_893721 ?auto_893718 ) ( OBJ-AT ?auto_893723 ?auto_893718 ) ( not ( = ?auto_893719 ?auto_893720 ) ) ( not ( = ?auto_893719 ?auto_893721 ) ) ( not ( = ?auto_893719 ?auto_893722 ) ) ( not ( = ?auto_893719 ?auto_893723 ) ) ( not ( = ?auto_893720 ?auto_893721 ) ) ( not ( = ?auto_893720 ?auto_893723 ) ) ( not ( = ?auto_893721 ?auto_893722 ) ) ( not ( = ?auto_893721 ?auto_893723 ) ) ( not ( = ?auto_893722 ?auto_893723 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_893720 ?auto_893722 ?auto_893718 )
      ( DELIVER-5PKG-VERIFY ?auto_893719 ?auto_893720 ?auto_893721 ?auto_893722 ?auto_893723 ?auto_893718 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_893737 - OBJ
      ?auto_893738 - OBJ
      ?auto_893739 - OBJ
      ?auto_893740 - OBJ
      ?auto_893741 - OBJ
      ?auto_893736 - LOCATION
    )
    :vars
    (
      ?auto_893744 - TRUCK
      ?auto_893742 - LOCATION
      ?auto_893743 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_893739 ?auto_893744 ) ( TRUCK-AT ?auto_893744 ?auto_893742 ) ( IN-CITY ?auto_893742 ?auto_893743 ) ( IN-CITY ?auto_893736 ?auto_893743 ) ( not ( = ?auto_893736 ?auto_893742 ) ) ( OBJ-AT ?auto_893740 ?auto_893736 ) ( not ( = ?auto_893740 ?auto_893739 ) ) ( OBJ-AT ?auto_893737 ?auto_893736 ) ( OBJ-AT ?auto_893738 ?auto_893736 ) ( OBJ-AT ?auto_893741 ?auto_893736 ) ( not ( = ?auto_893737 ?auto_893738 ) ) ( not ( = ?auto_893737 ?auto_893739 ) ) ( not ( = ?auto_893737 ?auto_893740 ) ) ( not ( = ?auto_893737 ?auto_893741 ) ) ( not ( = ?auto_893738 ?auto_893739 ) ) ( not ( = ?auto_893738 ?auto_893740 ) ) ( not ( = ?auto_893738 ?auto_893741 ) ) ( not ( = ?auto_893739 ?auto_893741 ) ) ( not ( = ?auto_893740 ?auto_893741 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_893740 ?auto_893739 ?auto_893736 )
      ( DELIVER-5PKG-VERIFY ?auto_893737 ?auto_893738 ?auto_893739 ?auto_893740 ?auto_893741 ?auto_893736 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_893773 - OBJ
      ?auto_893774 - OBJ
      ?auto_893775 - OBJ
      ?auto_893776 - OBJ
      ?auto_893777 - OBJ
      ?auto_893772 - LOCATION
    )
    :vars
    (
      ?auto_893780 - TRUCK
      ?auto_893778 - LOCATION
      ?auto_893779 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_893774 ?auto_893780 ) ( TRUCK-AT ?auto_893780 ?auto_893778 ) ( IN-CITY ?auto_893778 ?auto_893779 ) ( IN-CITY ?auto_893772 ?auto_893779 ) ( not ( = ?auto_893772 ?auto_893778 ) ) ( OBJ-AT ?auto_893777 ?auto_893772 ) ( not ( = ?auto_893777 ?auto_893774 ) ) ( OBJ-AT ?auto_893773 ?auto_893772 ) ( OBJ-AT ?auto_893775 ?auto_893772 ) ( OBJ-AT ?auto_893776 ?auto_893772 ) ( not ( = ?auto_893773 ?auto_893774 ) ) ( not ( = ?auto_893773 ?auto_893775 ) ) ( not ( = ?auto_893773 ?auto_893776 ) ) ( not ( = ?auto_893773 ?auto_893777 ) ) ( not ( = ?auto_893774 ?auto_893775 ) ) ( not ( = ?auto_893774 ?auto_893776 ) ) ( not ( = ?auto_893775 ?auto_893776 ) ) ( not ( = ?auto_893775 ?auto_893777 ) ) ( not ( = ?auto_893776 ?auto_893777 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_893777 ?auto_893774 ?auto_893772 )
      ( DELIVER-5PKG-VERIFY ?auto_893773 ?auto_893774 ?auto_893775 ?auto_893776 ?auto_893777 ?auto_893772 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_893845 - OBJ
      ?auto_893846 - OBJ
      ?auto_893847 - OBJ
      ?auto_893848 - OBJ
      ?auto_893849 - OBJ
      ?auto_893844 - LOCATION
    )
    :vars
    (
      ?auto_893852 - TRUCK
      ?auto_893850 - LOCATION
      ?auto_893851 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_893845 ?auto_893852 ) ( TRUCK-AT ?auto_893852 ?auto_893850 ) ( IN-CITY ?auto_893850 ?auto_893851 ) ( IN-CITY ?auto_893844 ?auto_893851 ) ( not ( = ?auto_893844 ?auto_893850 ) ) ( OBJ-AT ?auto_893848 ?auto_893844 ) ( not ( = ?auto_893848 ?auto_893845 ) ) ( OBJ-AT ?auto_893846 ?auto_893844 ) ( OBJ-AT ?auto_893847 ?auto_893844 ) ( OBJ-AT ?auto_893849 ?auto_893844 ) ( not ( = ?auto_893845 ?auto_893846 ) ) ( not ( = ?auto_893845 ?auto_893847 ) ) ( not ( = ?auto_893845 ?auto_893849 ) ) ( not ( = ?auto_893846 ?auto_893847 ) ) ( not ( = ?auto_893846 ?auto_893848 ) ) ( not ( = ?auto_893846 ?auto_893849 ) ) ( not ( = ?auto_893847 ?auto_893848 ) ) ( not ( = ?auto_893847 ?auto_893849 ) ) ( not ( = ?auto_893848 ?auto_893849 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_893848 ?auto_893845 ?auto_893844 )
      ( DELIVER-5PKG-VERIFY ?auto_893845 ?auto_893846 ?auto_893847 ?auto_893848 ?auto_893849 ?auto_893844 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_893990 - OBJ
      ?auto_893989 - LOCATION
    )
    :vars
    (
      ?auto_893993 - TRUCK
      ?auto_893991 - LOCATION
      ?auto_893992 - CITY
      ?auto_893994 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_893993 ?auto_893991 ) ( IN-CITY ?auto_893991 ?auto_893992 ) ( IN-CITY ?auto_893989 ?auto_893992 ) ( not ( = ?auto_893989 ?auto_893991 ) ) ( OBJ-AT ?auto_893994 ?auto_893989 ) ( not ( = ?auto_893994 ?auto_893990 ) ) ( OBJ-AT ?auto_893990 ?auto_893991 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_893990 ?auto_893993 ?auto_893991 )
      ( DELIVER-2PKG ?auto_893994 ?auto_893990 ?auto_893989 )
      ( DELIVER-1PKG-VERIFY ?auto_893990 ?auto_893989 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_893996 - OBJ
      ?auto_893997 - OBJ
      ?auto_893995 - LOCATION
    )
    :vars
    (
      ?auto_894000 - TRUCK
      ?auto_893999 - LOCATION
      ?auto_893998 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_894000 ?auto_893999 ) ( IN-CITY ?auto_893999 ?auto_893998 ) ( IN-CITY ?auto_893995 ?auto_893998 ) ( not ( = ?auto_893995 ?auto_893999 ) ) ( OBJ-AT ?auto_893996 ?auto_893995 ) ( not ( = ?auto_893996 ?auto_893997 ) ) ( OBJ-AT ?auto_893997 ?auto_893999 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_893997 ?auto_893995 )
      ( DELIVER-2PKG-VERIFY ?auto_893996 ?auto_893997 ?auto_893995 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_894002 - OBJ
      ?auto_894003 - OBJ
      ?auto_894001 - LOCATION
    )
    :vars
    (
      ?auto_894006 - TRUCK
      ?auto_894004 - LOCATION
      ?auto_894005 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_894006 ?auto_894004 ) ( IN-CITY ?auto_894004 ?auto_894005 ) ( IN-CITY ?auto_894001 ?auto_894005 ) ( not ( = ?auto_894001 ?auto_894004 ) ) ( OBJ-AT ?auto_894003 ?auto_894001 ) ( not ( = ?auto_894003 ?auto_894002 ) ) ( OBJ-AT ?auto_894002 ?auto_894004 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894003 ?auto_894002 ?auto_894001 )
      ( DELIVER-2PKG-VERIFY ?auto_894002 ?auto_894003 ?auto_894001 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_894015 - OBJ
      ?auto_894016 - OBJ
      ?auto_894017 - OBJ
      ?auto_894014 - LOCATION
    )
    :vars
    (
      ?auto_894020 - TRUCK
      ?auto_894018 - LOCATION
      ?auto_894019 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_894020 ?auto_894018 ) ( IN-CITY ?auto_894018 ?auto_894019 ) ( IN-CITY ?auto_894014 ?auto_894019 ) ( not ( = ?auto_894014 ?auto_894018 ) ) ( OBJ-AT ?auto_894015 ?auto_894014 ) ( not ( = ?auto_894015 ?auto_894017 ) ) ( OBJ-AT ?auto_894017 ?auto_894018 ) ( OBJ-AT ?auto_894016 ?auto_894014 ) ( not ( = ?auto_894015 ?auto_894016 ) ) ( not ( = ?auto_894016 ?auto_894017 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894015 ?auto_894017 ?auto_894014 )
      ( DELIVER-3PKG-VERIFY ?auto_894015 ?auto_894016 ?auto_894017 ?auto_894014 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_894022 - OBJ
      ?auto_894023 - OBJ
      ?auto_894024 - OBJ
      ?auto_894021 - LOCATION
    )
    :vars
    (
      ?auto_894027 - TRUCK
      ?auto_894025 - LOCATION
      ?auto_894026 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_894027 ?auto_894025 ) ( IN-CITY ?auto_894025 ?auto_894026 ) ( IN-CITY ?auto_894021 ?auto_894026 ) ( not ( = ?auto_894021 ?auto_894025 ) ) ( OBJ-AT ?auto_894022 ?auto_894021 ) ( not ( = ?auto_894022 ?auto_894023 ) ) ( OBJ-AT ?auto_894023 ?auto_894025 ) ( OBJ-AT ?auto_894024 ?auto_894021 ) ( not ( = ?auto_894022 ?auto_894024 ) ) ( not ( = ?auto_894023 ?auto_894024 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894022 ?auto_894023 ?auto_894021 )
      ( DELIVER-3PKG-VERIFY ?auto_894022 ?auto_894023 ?auto_894024 ?auto_894021 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_894036 - OBJ
      ?auto_894037 - OBJ
      ?auto_894038 - OBJ
      ?auto_894035 - LOCATION
    )
    :vars
    (
      ?auto_894041 - TRUCK
      ?auto_894039 - LOCATION
      ?auto_894040 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_894041 ?auto_894039 ) ( IN-CITY ?auto_894039 ?auto_894040 ) ( IN-CITY ?auto_894035 ?auto_894040 ) ( not ( = ?auto_894035 ?auto_894039 ) ) ( OBJ-AT ?auto_894037 ?auto_894035 ) ( not ( = ?auto_894037 ?auto_894036 ) ) ( OBJ-AT ?auto_894036 ?auto_894039 ) ( OBJ-AT ?auto_894038 ?auto_894035 ) ( not ( = ?auto_894036 ?auto_894038 ) ) ( not ( = ?auto_894037 ?auto_894038 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894037 ?auto_894036 ?auto_894035 )
      ( DELIVER-3PKG-VERIFY ?auto_894036 ?auto_894037 ?auto_894038 ?auto_894035 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_894065 - OBJ
      ?auto_894066 - OBJ
      ?auto_894067 - OBJ
      ?auto_894068 - OBJ
      ?auto_894064 - LOCATION
    )
    :vars
    (
      ?auto_894071 - TRUCK
      ?auto_894069 - LOCATION
      ?auto_894070 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_894071 ?auto_894069 ) ( IN-CITY ?auto_894069 ?auto_894070 ) ( IN-CITY ?auto_894064 ?auto_894070 ) ( not ( = ?auto_894064 ?auto_894069 ) ) ( OBJ-AT ?auto_894066 ?auto_894064 ) ( not ( = ?auto_894066 ?auto_894068 ) ) ( OBJ-AT ?auto_894068 ?auto_894069 ) ( OBJ-AT ?auto_894065 ?auto_894064 ) ( OBJ-AT ?auto_894067 ?auto_894064 ) ( not ( = ?auto_894065 ?auto_894066 ) ) ( not ( = ?auto_894065 ?auto_894067 ) ) ( not ( = ?auto_894065 ?auto_894068 ) ) ( not ( = ?auto_894066 ?auto_894067 ) ) ( not ( = ?auto_894067 ?auto_894068 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894066 ?auto_894068 ?auto_894064 )
      ( DELIVER-4PKG-VERIFY ?auto_894065 ?auto_894066 ?auto_894067 ?auto_894068 ?auto_894064 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_894073 - OBJ
      ?auto_894074 - OBJ
      ?auto_894075 - OBJ
      ?auto_894076 - OBJ
      ?auto_894072 - LOCATION
    )
    :vars
    (
      ?auto_894079 - TRUCK
      ?auto_894077 - LOCATION
      ?auto_894078 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_894079 ?auto_894077 ) ( IN-CITY ?auto_894077 ?auto_894078 ) ( IN-CITY ?auto_894072 ?auto_894078 ) ( not ( = ?auto_894072 ?auto_894077 ) ) ( OBJ-AT ?auto_894076 ?auto_894072 ) ( not ( = ?auto_894076 ?auto_894075 ) ) ( OBJ-AT ?auto_894075 ?auto_894077 ) ( OBJ-AT ?auto_894073 ?auto_894072 ) ( OBJ-AT ?auto_894074 ?auto_894072 ) ( not ( = ?auto_894073 ?auto_894074 ) ) ( not ( = ?auto_894073 ?auto_894075 ) ) ( not ( = ?auto_894073 ?auto_894076 ) ) ( not ( = ?auto_894074 ?auto_894075 ) ) ( not ( = ?auto_894074 ?auto_894076 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894076 ?auto_894075 ?auto_894072 )
      ( DELIVER-4PKG-VERIFY ?auto_894073 ?auto_894074 ?auto_894075 ?auto_894076 ?auto_894072 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_894089 - OBJ
      ?auto_894090 - OBJ
      ?auto_894091 - OBJ
      ?auto_894092 - OBJ
      ?auto_894088 - LOCATION
    )
    :vars
    (
      ?auto_894095 - TRUCK
      ?auto_894093 - LOCATION
      ?auto_894094 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_894095 ?auto_894093 ) ( IN-CITY ?auto_894093 ?auto_894094 ) ( IN-CITY ?auto_894088 ?auto_894094 ) ( not ( = ?auto_894088 ?auto_894093 ) ) ( OBJ-AT ?auto_894092 ?auto_894088 ) ( not ( = ?auto_894092 ?auto_894090 ) ) ( OBJ-AT ?auto_894090 ?auto_894093 ) ( OBJ-AT ?auto_894089 ?auto_894088 ) ( OBJ-AT ?auto_894091 ?auto_894088 ) ( not ( = ?auto_894089 ?auto_894090 ) ) ( not ( = ?auto_894089 ?auto_894091 ) ) ( not ( = ?auto_894089 ?auto_894092 ) ) ( not ( = ?auto_894090 ?auto_894091 ) ) ( not ( = ?auto_894091 ?auto_894092 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894092 ?auto_894090 ?auto_894088 )
      ( DELIVER-4PKG-VERIFY ?auto_894089 ?auto_894090 ?auto_894091 ?auto_894092 ?auto_894088 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_894121 - OBJ
      ?auto_894122 - OBJ
      ?auto_894123 - OBJ
      ?auto_894124 - OBJ
      ?auto_894120 - LOCATION
    )
    :vars
    (
      ?auto_894127 - TRUCK
      ?auto_894125 - LOCATION
      ?auto_894126 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_894127 ?auto_894125 ) ( IN-CITY ?auto_894125 ?auto_894126 ) ( IN-CITY ?auto_894120 ?auto_894126 ) ( not ( = ?auto_894120 ?auto_894125 ) ) ( OBJ-AT ?auto_894124 ?auto_894120 ) ( not ( = ?auto_894124 ?auto_894121 ) ) ( OBJ-AT ?auto_894121 ?auto_894125 ) ( OBJ-AT ?auto_894122 ?auto_894120 ) ( OBJ-AT ?auto_894123 ?auto_894120 ) ( not ( = ?auto_894121 ?auto_894122 ) ) ( not ( = ?auto_894121 ?auto_894123 ) ) ( not ( = ?auto_894122 ?auto_894123 ) ) ( not ( = ?auto_894122 ?auto_894124 ) ) ( not ( = ?auto_894123 ?auto_894124 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894124 ?auto_894121 ?auto_894120 )
      ( DELIVER-4PKG-VERIFY ?auto_894121 ?auto_894122 ?auto_894123 ?auto_894124 ?auto_894120 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_894186 - OBJ
      ?auto_894187 - OBJ
      ?auto_894188 - OBJ
      ?auto_894189 - OBJ
      ?auto_894190 - OBJ
      ?auto_894185 - LOCATION
    )
    :vars
    (
      ?auto_894193 - TRUCK
      ?auto_894191 - LOCATION
      ?auto_894192 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_894193 ?auto_894191 ) ( IN-CITY ?auto_894191 ?auto_894192 ) ( IN-CITY ?auto_894185 ?auto_894192 ) ( not ( = ?auto_894185 ?auto_894191 ) ) ( OBJ-AT ?auto_894188 ?auto_894185 ) ( not ( = ?auto_894188 ?auto_894190 ) ) ( OBJ-AT ?auto_894190 ?auto_894191 ) ( OBJ-AT ?auto_894186 ?auto_894185 ) ( OBJ-AT ?auto_894187 ?auto_894185 ) ( OBJ-AT ?auto_894189 ?auto_894185 ) ( not ( = ?auto_894186 ?auto_894187 ) ) ( not ( = ?auto_894186 ?auto_894188 ) ) ( not ( = ?auto_894186 ?auto_894189 ) ) ( not ( = ?auto_894186 ?auto_894190 ) ) ( not ( = ?auto_894187 ?auto_894188 ) ) ( not ( = ?auto_894187 ?auto_894189 ) ) ( not ( = ?auto_894187 ?auto_894190 ) ) ( not ( = ?auto_894188 ?auto_894189 ) ) ( not ( = ?auto_894189 ?auto_894190 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894188 ?auto_894190 ?auto_894185 )
      ( DELIVER-5PKG-VERIFY ?auto_894186 ?auto_894187 ?auto_894188 ?auto_894189 ?auto_894190 ?auto_894185 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_894195 - OBJ
      ?auto_894196 - OBJ
      ?auto_894197 - OBJ
      ?auto_894198 - OBJ
      ?auto_894199 - OBJ
      ?auto_894194 - LOCATION
    )
    :vars
    (
      ?auto_894202 - TRUCK
      ?auto_894200 - LOCATION
      ?auto_894201 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_894202 ?auto_894200 ) ( IN-CITY ?auto_894200 ?auto_894201 ) ( IN-CITY ?auto_894194 ?auto_894201 ) ( not ( = ?auto_894194 ?auto_894200 ) ) ( OBJ-AT ?auto_894195 ?auto_894194 ) ( not ( = ?auto_894195 ?auto_894198 ) ) ( OBJ-AT ?auto_894198 ?auto_894200 ) ( OBJ-AT ?auto_894196 ?auto_894194 ) ( OBJ-AT ?auto_894197 ?auto_894194 ) ( OBJ-AT ?auto_894199 ?auto_894194 ) ( not ( = ?auto_894195 ?auto_894196 ) ) ( not ( = ?auto_894195 ?auto_894197 ) ) ( not ( = ?auto_894195 ?auto_894199 ) ) ( not ( = ?auto_894196 ?auto_894197 ) ) ( not ( = ?auto_894196 ?auto_894198 ) ) ( not ( = ?auto_894196 ?auto_894199 ) ) ( not ( = ?auto_894197 ?auto_894198 ) ) ( not ( = ?auto_894197 ?auto_894199 ) ) ( not ( = ?auto_894198 ?auto_894199 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894195 ?auto_894198 ?auto_894194 )
      ( DELIVER-5PKG-VERIFY ?auto_894195 ?auto_894196 ?auto_894197 ?auto_894198 ?auto_894199 ?auto_894194 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_894213 - OBJ
      ?auto_894214 - OBJ
      ?auto_894215 - OBJ
      ?auto_894216 - OBJ
      ?auto_894217 - OBJ
      ?auto_894212 - LOCATION
    )
    :vars
    (
      ?auto_894220 - TRUCK
      ?auto_894218 - LOCATION
      ?auto_894219 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_894220 ?auto_894218 ) ( IN-CITY ?auto_894218 ?auto_894219 ) ( IN-CITY ?auto_894212 ?auto_894219 ) ( not ( = ?auto_894212 ?auto_894218 ) ) ( OBJ-AT ?auto_894214 ?auto_894212 ) ( not ( = ?auto_894214 ?auto_894215 ) ) ( OBJ-AT ?auto_894215 ?auto_894218 ) ( OBJ-AT ?auto_894213 ?auto_894212 ) ( OBJ-AT ?auto_894216 ?auto_894212 ) ( OBJ-AT ?auto_894217 ?auto_894212 ) ( not ( = ?auto_894213 ?auto_894214 ) ) ( not ( = ?auto_894213 ?auto_894215 ) ) ( not ( = ?auto_894213 ?auto_894216 ) ) ( not ( = ?auto_894213 ?auto_894217 ) ) ( not ( = ?auto_894214 ?auto_894216 ) ) ( not ( = ?auto_894214 ?auto_894217 ) ) ( not ( = ?auto_894215 ?auto_894216 ) ) ( not ( = ?auto_894215 ?auto_894217 ) ) ( not ( = ?auto_894216 ?auto_894217 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894214 ?auto_894215 ?auto_894212 )
      ( DELIVER-5PKG-VERIFY ?auto_894213 ?auto_894214 ?auto_894215 ?auto_894216 ?auto_894217 ?auto_894212 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_894249 - OBJ
      ?auto_894250 - OBJ
      ?auto_894251 - OBJ
      ?auto_894252 - OBJ
      ?auto_894253 - OBJ
      ?auto_894248 - LOCATION
    )
    :vars
    (
      ?auto_894256 - TRUCK
      ?auto_894254 - LOCATION
      ?auto_894255 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_894256 ?auto_894254 ) ( IN-CITY ?auto_894254 ?auto_894255 ) ( IN-CITY ?auto_894248 ?auto_894255 ) ( not ( = ?auto_894248 ?auto_894254 ) ) ( OBJ-AT ?auto_894249 ?auto_894248 ) ( not ( = ?auto_894249 ?auto_894250 ) ) ( OBJ-AT ?auto_894250 ?auto_894254 ) ( OBJ-AT ?auto_894251 ?auto_894248 ) ( OBJ-AT ?auto_894252 ?auto_894248 ) ( OBJ-AT ?auto_894253 ?auto_894248 ) ( not ( = ?auto_894249 ?auto_894251 ) ) ( not ( = ?auto_894249 ?auto_894252 ) ) ( not ( = ?auto_894249 ?auto_894253 ) ) ( not ( = ?auto_894250 ?auto_894251 ) ) ( not ( = ?auto_894250 ?auto_894252 ) ) ( not ( = ?auto_894250 ?auto_894253 ) ) ( not ( = ?auto_894251 ?auto_894252 ) ) ( not ( = ?auto_894251 ?auto_894253 ) ) ( not ( = ?auto_894252 ?auto_894253 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894249 ?auto_894250 ?auto_894248 )
      ( DELIVER-5PKG-VERIFY ?auto_894249 ?auto_894250 ?auto_894251 ?auto_894252 ?auto_894253 ?auto_894248 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_894321 - OBJ
      ?auto_894322 - OBJ
      ?auto_894323 - OBJ
      ?auto_894324 - OBJ
      ?auto_894325 - OBJ
      ?auto_894320 - LOCATION
    )
    :vars
    (
      ?auto_894328 - TRUCK
      ?auto_894326 - LOCATION
      ?auto_894327 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_894328 ?auto_894326 ) ( IN-CITY ?auto_894326 ?auto_894327 ) ( IN-CITY ?auto_894320 ?auto_894327 ) ( not ( = ?auto_894320 ?auto_894326 ) ) ( OBJ-AT ?auto_894323 ?auto_894320 ) ( not ( = ?auto_894323 ?auto_894321 ) ) ( OBJ-AT ?auto_894321 ?auto_894326 ) ( OBJ-AT ?auto_894322 ?auto_894320 ) ( OBJ-AT ?auto_894324 ?auto_894320 ) ( OBJ-AT ?auto_894325 ?auto_894320 ) ( not ( = ?auto_894321 ?auto_894322 ) ) ( not ( = ?auto_894321 ?auto_894324 ) ) ( not ( = ?auto_894321 ?auto_894325 ) ) ( not ( = ?auto_894322 ?auto_894323 ) ) ( not ( = ?auto_894322 ?auto_894324 ) ) ( not ( = ?auto_894322 ?auto_894325 ) ) ( not ( = ?auto_894323 ?auto_894324 ) ) ( not ( = ?auto_894323 ?auto_894325 ) ) ( not ( = ?auto_894324 ?auto_894325 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894323 ?auto_894321 ?auto_894320 )
      ( DELIVER-5PKG-VERIFY ?auto_894321 ?auto_894322 ?auto_894323 ?auto_894324 ?auto_894325 ?auto_894320 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_894466 - OBJ
      ?auto_894465 - LOCATION
    )
    :vars
    (
      ?auto_894467 - LOCATION
      ?auto_894468 - CITY
      ?auto_894470 - OBJ
      ?auto_894469 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_894467 ?auto_894468 ) ( IN-CITY ?auto_894465 ?auto_894468 ) ( not ( = ?auto_894465 ?auto_894467 ) ) ( OBJ-AT ?auto_894470 ?auto_894465 ) ( not ( = ?auto_894470 ?auto_894466 ) ) ( OBJ-AT ?auto_894466 ?auto_894467 ) ( TRUCK-AT ?auto_894469 ?auto_894465 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_894469 ?auto_894465 ?auto_894467 ?auto_894468 )
      ( DELIVER-2PKG ?auto_894470 ?auto_894466 ?auto_894465 )
      ( DELIVER-1PKG-VERIFY ?auto_894466 ?auto_894465 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_894472 - OBJ
      ?auto_894473 - OBJ
      ?auto_894471 - LOCATION
    )
    :vars
    (
      ?auto_894475 - LOCATION
      ?auto_894476 - CITY
      ?auto_894474 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_894475 ?auto_894476 ) ( IN-CITY ?auto_894471 ?auto_894476 ) ( not ( = ?auto_894471 ?auto_894475 ) ) ( OBJ-AT ?auto_894472 ?auto_894471 ) ( not ( = ?auto_894472 ?auto_894473 ) ) ( OBJ-AT ?auto_894473 ?auto_894475 ) ( TRUCK-AT ?auto_894474 ?auto_894471 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_894473 ?auto_894471 )
      ( DELIVER-2PKG-VERIFY ?auto_894472 ?auto_894473 ?auto_894471 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_894478 - OBJ
      ?auto_894479 - OBJ
      ?auto_894477 - LOCATION
    )
    :vars
    (
      ?auto_894482 - LOCATION
      ?auto_894481 - CITY
      ?auto_894480 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_894482 ?auto_894481 ) ( IN-CITY ?auto_894477 ?auto_894481 ) ( not ( = ?auto_894477 ?auto_894482 ) ) ( OBJ-AT ?auto_894479 ?auto_894477 ) ( not ( = ?auto_894479 ?auto_894478 ) ) ( OBJ-AT ?auto_894478 ?auto_894482 ) ( TRUCK-AT ?auto_894480 ?auto_894477 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894479 ?auto_894478 ?auto_894477 )
      ( DELIVER-2PKG-VERIFY ?auto_894478 ?auto_894479 ?auto_894477 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_894491 - OBJ
      ?auto_894492 - OBJ
      ?auto_894493 - OBJ
      ?auto_894490 - LOCATION
    )
    :vars
    (
      ?auto_894496 - LOCATION
      ?auto_894495 - CITY
      ?auto_894494 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_894496 ?auto_894495 ) ( IN-CITY ?auto_894490 ?auto_894495 ) ( not ( = ?auto_894490 ?auto_894496 ) ) ( OBJ-AT ?auto_894492 ?auto_894490 ) ( not ( = ?auto_894492 ?auto_894493 ) ) ( OBJ-AT ?auto_894493 ?auto_894496 ) ( TRUCK-AT ?auto_894494 ?auto_894490 ) ( OBJ-AT ?auto_894491 ?auto_894490 ) ( not ( = ?auto_894491 ?auto_894492 ) ) ( not ( = ?auto_894491 ?auto_894493 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894492 ?auto_894493 ?auto_894490 )
      ( DELIVER-3PKG-VERIFY ?auto_894491 ?auto_894492 ?auto_894493 ?auto_894490 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_894498 - OBJ
      ?auto_894499 - OBJ
      ?auto_894500 - OBJ
      ?auto_894497 - LOCATION
    )
    :vars
    (
      ?auto_894503 - LOCATION
      ?auto_894502 - CITY
      ?auto_894501 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_894503 ?auto_894502 ) ( IN-CITY ?auto_894497 ?auto_894502 ) ( not ( = ?auto_894497 ?auto_894503 ) ) ( OBJ-AT ?auto_894500 ?auto_894497 ) ( not ( = ?auto_894500 ?auto_894499 ) ) ( OBJ-AT ?auto_894499 ?auto_894503 ) ( TRUCK-AT ?auto_894501 ?auto_894497 ) ( OBJ-AT ?auto_894498 ?auto_894497 ) ( not ( = ?auto_894498 ?auto_894499 ) ) ( not ( = ?auto_894498 ?auto_894500 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894500 ?auto_894499 ?auto_894497 )
      ( DELIVER-3PKG-VERIFY ?auto_894498 ?auto_894499 ?auto_894500 ?auto_894497 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_894512 - OBJ
      ?auto_894513 - OBJ
      ?auto_894514 - OBJ
      ?auto_894511 - LOCATION
    )
    :vars
    (
      ?auto_894517 - LOCATION
      ?auto_894516 - CITY
      ?auto_894515 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_894517 ?auto_894516 ) ( IN-CITY ?auto_894511 ?auto_894516 ) ( not ( = ?auto_894511 ?auto_894517 ) ) ( OBJ-AT ?auto_894513 ?auto_894511 ) ( not ( = ?auto_894513 ?auto_894512 ) ) ( OBJ-AT ?auto_894512 ?auto_894517 ) ( TRUCK-AT ?auto_894515 ?auto_894511 ) ( OBJ-AT ?auto_894514 ?auto_894511 ) ( not ( = ?auto_894512 ?auto_894514 ) ) ( not ( = ?auto_894513 ?auto_894514 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894513 ?auto_894512 ?auto_894511 )
      ( DELIVER-3PKG-VERIFY ?auto_894512 ?auto_894513 ?auto_894514 ?auto_894511 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_894541 - OBJ
      ?auto_894542 - OBJ
      ?auto_894543 - OBJ
      ?auto_894544 - OBJ
      ?auto_894540 - LOCATION
    )
    :vars
    (
      ?auto_894547 - LOCATION
      ?auto_894546 - CITY
      ?auto_894545 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_894547 ?auto_894546 ) ( IN-CITY ?auto_894540 ?auto_894546 ) ( not ( = ?auto_894540 ?auto_894547 ) ) ( OBJ-AT ?auto_894543 ?auto_894540 ) ( not ( = ?auto_894543 ?auto_894544 ) ) ( OBJ-AT ?auto_894544 ?auto_894547 ) ( TRUCK-AT ?auto_894545 ?auto_894540 ) ( OBJ-AT ?auto_894541 ?auto_894540 ) ( OBJ-AT ?auto_894542 ?auto_894540 ) ( not ( = ?auto_894541 ?auto_894542 ) ) ( not ( = ?auto_894541 ?auto_894543 ) ) ( not ( = ?auto_894541 ?auto_894544 ) ) ( not ( = ?auto_894542 ?auto_894543 ) ) ( not ( = ?auto_894542 ?auto_894544 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894543 ?auto_894544 ?auto_894540 )
      ( DELIVER-4PKG-VERIFY ?auto_894541 ?auto_894542 ?auto_894543 ?auto_894544 ?auto_894540 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_894549 - OBJ
      ?auto_894550 - OBJ
      ?auto_894551 - OBJ
      ?auto_894552 - OBJ
      ?auto_894548 - LOCATION
    )
    :vars
    (
      ?auto_894555 - LOCATION
      ?auto_894554 - CITY
      ?auto_894553 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_894555 ?auto_894554 ) ( IN-CITY ?auto_894548 ?auto_894554 ) ( not ( = ?auto_894548 ?auto_894555 ) ) ( OBJ-AT ?auto_894549 ?auto_894548 ) ( not ( = ?auto_894549 ?auto_894551 ) ) ( OBJ-AT ?auto_894551 ?auto_894555 ) ( TRUCK-AT ?auto_894553 ?auto_894548 ) ( OBJ-AT ?auto_894550 ?auto_894548 ) ( OBJ-AT ?auto_894552 ?auto_894548 ) ( not ( = ?auto_894549 ?auto_894550 ) ) ( not ( = ?auto_894549 ?auto_894552 ) ) ( not ( = ?auto_894550 ?auto_894551 ) ) ( not ( = ?auto_894550 ?auto_894552 ) ) ( not ( = ?auto_894551 ?auto_894552 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894549 ?auto_894551 ?auto_894548 )
      ( DELIVER-4PKG-VERIFY ?auto_894549 ?auto_894550 ?auto_894551 ?auto_894552 ?auto_894548 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_894565 - OBJ
      ?auto_894566 - OBJ
      ?auto_894567 - OBJ
      ?auto_894568 - OBJ
      ?auto_894564 - LOCATION
    )
    :vars
    (
      ?auto_894571 - LOCATION
      ?auto_894570 - CITY
      ?auto_894569 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_894571 ?auto_894570 ) ( IN-CITY ?auto_894564 ?auto_894570 ) ( not ( = ?auto_894564 ?auto_894571 ) ) ( OBJ-AT ?auto_894568 ?auto_894564 ) ( not ( = ?auto_894568 ?auto_894566 ) ) ( OBJ-AT ?auto_894566 ?auto_894571 ) ( TRUCK-AT ?auto_894569 ?auto_894564 ) ( OBJ-AT ?auto_894565 ?auto_894564 ) ( OBJ-AT ?auto_894567 ?auto_894564 ) ( not ( = ?auto_894565 ?auto_894566 ) ) ( not ( = ?auto_894565 ?auto_894567 ) ) ( not ( = ?auto_894565 ?auto_894568 ) ) ( not ( = ?auto_894566 ?auto_894567 ) ) ( not ( = ?auto_894567 ?auto_894568 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894568 ?auto_894566 ?auto_894564 )
      ( DELIVER-4PKG-VERIFY ?auto_894565 ?auto_894566 ?auto_894567 ?auto_894568 ?auto_894564 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_894597 - OBJ
      ?auto_894598 - OBJ
      ?auto_894599 - OBJ
      ?auto_894600 - OBJ
      ?auto_894596 - LOCATION
    )
    :vars
    (
      ?auto_894603 - LOCATION
      ?auto_894602 - CITY
      ?auto_894601 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_894603 ?auto_894602 ) ( IN-CITY ?auto_894596 ?auto_894602 ) ( not ( = ?auto_894596 ?auto_894603 ) ) ( OBJ-AT ?auto_894600 ?auto_894596 ) ( not ( = ?auto_894600 ?auto_894597 ) ) ( OBJ-AT ?auto_894597 ?auto_894603 ) ( TRUCK-AT ?auto_894601 ?auto_894596 ) ( OBJ-AT ?auto_894598 ?auto_894596 ) ( OBJ-AT ?auto_894599 ?auto_894596 ) ( not ( = ?auto_894597 ?auto_894598 ) ) ( not ( = ?auto_894597 ?auto_894599 ) ) ( not ( = ?auto_894598 ?auto_894599 ) ) ( not ( = ?auto_894598 ?auto_894600 ) ) ( not ( = ?auto_894599 ?auto_894600 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894600 ?auto_894597 ?auto_894596 )
      ( DELIVER-4PKG-VERIFY ?auto_894597 ?auto_894598 ?auto_894599 ?auto_894600 ?auto_894596 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_894662 - OBJ
      ?auto_894663 - OBJ
      ?auto_894664 - OBJ
      ?auto_894665 - OBJ
      ?auto_894666 - OBJ
      ?auto_894661 - LOCATION
    )
    :vars
    (
      ?auto_894669 - LOCATION
      ?auto_894668 - CITY
      ?auto_894667 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_894669 ?auto_894668 ) ( IN-CITY ?auto_894661 ?auto_894668 ) ( not ( = ?auto_894661 ?auto_894669 ) ) ( OBJ-AT ?auto_894663 ?auto_894661 ) ( not ( = ?auto_894663 ?auto_894666 ) ) ( OBJ-AT ?auto_894666 ?auto_894669 ) ( TRUCK-AT ?auto_894667 ?auto_894661 ) ( OBJ-AT ?auto_894662 ?auto_894661 ) ( OBJ-AT ?auto_894664 ?auto_894661 ) ( OBJ-AT ?auto_894665 ?auto_894661 ) ( not ( = ?auto_894662 ?auto_894663 ) ) ( not ( = ?auto_894662 ?auto_894664 ) ) ( not ( = ?auto_894662 ?auto_894665 ) ) ( not ( = ?auto_894662 ?auto_894666 ) ) ( not ( = ?auto_894663 ?auto_894664 ) ) ( not ( = ?auto_894663 ?auto_894665 ) ) ( not ( = ?auto_894664 ?auto_894665 ) ) ( not ( = ?auto_894664 ?auto_894666 ) ) ( not ( = ?auto_894665 ?auto_894666 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894663 ?auto_894666 ?auto_894661 )
      ( DELIVER-5PKG-VERIFY ?auto_894662 ?auto_894663 ?auto_894664 ?auto_894665 ?auto_894666 ?auto_894661 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_894671 - OBJ
      ?auto_894672 - OBJ
      ?auto_894673 - OBJ
      ?auto_894674 - OBJ
      ?auto_894675 - OBJ
      ?auto_894670 - LOCATION
    )
    :vars
    (
      ?auto_894678 - LOCATION
      ?auto_894677 - CITY
      ?auto_894676 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_894678 ?auto_894677 ) ( IN-CITY ?auto_894670 ?auto_894677 ) ( not ( = ?auto_894670 ?auto_894678 ) ) ( OBJ-AT ?auto_894673 ?auto_894670 ) ( not ( = ?auto_894673 ?auto_894674 ) ) ( OBJ-AT ?auto_894674 ?auto_894678 ) ( TRUCK-AT ?auto_894676 ?auto_894670 ) ( OBJ-AT ?auto_894671 ?auto_894670 ) ( OBJ-AT ?auto_894672 ?auto_894670 ) ( OBJ-AT ?auto_894675 ?auto_894670 ) ( not ( = ?auto_894671 ?auto_894672 ) ) ( not ( = ?auto_894671 ?auto_894673 ) ) ( not ( = ?auto_894671 ?auto_894674 ) ) ( not ( = ?auto_894671 ?auto_894675 ) ) ( not ( = ?auto_894672 ?auto_894673 ) ) ( not ( = ?auto_894672 ?auto_894674 ) ) ( not ( = ?auto_894672 ?auto_894675 ) ) ( not ( = ?auto_894673 ?auto_894675 ) ) ( not ( = ?auto_894674 ?auto_894675 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894673 ?auto_894674 ?auto_894670 )
      ( DELIVER-5PKG-VERIFY ?auto_894671 ?auto_894672 ?auto_894673 ?auto_894674 ?auto_894675 ?auto_894670 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_894689 - OBJ
      ?auto_894690 - OBJ
      ?auto_894691 - OBJ
      ?auto_894692 - OBJ
      ?auto_894693 - OBJ
      ?auto_894688 - LOCATION
    )
    :vars
    (
      ?auto_894696 - LOCATION
      ?auto_894695 - CITY
      ?auto_894694 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_894696 ?auto_894695 ) ( IN-CITY ?auto_894688 ?auto_894695 ) ( not ( = ?auto_894688 ?auto_894696 ) ) ( OBJ-AT ?auto_894690 ?auto_894688 ) ( not ( = ?auto_894690 ?auto_894691 ) ) ( OBJ-AT ?auto_894691 ?auto_894696 ) ( TRUCK-AT ?auto_894694 ?auto_894688 ) ( OBJ-AT ?auto_894689 ?auto_894688 ) ( OBJ-AT ?auto_894692 ?auto_894688 ) ( OBJ-AT ?auto_894693 ?auto_894688 ) ( not ( = ?auto_894689 ?auto_894690 ) ) ( not ( = ?auto_894689 ?auto_894691 ) ) ( not ( = ?auto_894689 ?auto_894692 ) ) ( not ( = ?auto_894689 ?auto_894693 ) ) ( not ( = ?auto_894690 ?auto_894692 ) ) ( not ( = ?auto_894690 ?auto_894693 ) ) ( not ( = ?auto_894691 ?auto_894692 ) ) ( not ( = ?auto_894691 ?auto_894693 ) ) ( not ( = ?auto_894692 ?auto_894693 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894690 ?auto_894691 ?auto_894688 )
      ( DELIVER-5PKG-VERIFY ?auto_894689 ?auto_894690 ?auto_894691 ?auto_894692 ?auto_894693 ?auto_894688 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_894725 - OBJ
      ?auto_894726 - OBJ
      ?auto_894727 - OBJ
      ?auto_894728 - OBJ
      ?auto_894729 - OBJ
      ?auto_894724 - LOCATION
    )
    :vars
    (
      ?auto_894732 - LOCATION
      ?auto_894731 - CITY
      ?auto_894730 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_894732 ?auto_894731 ) ( IN-CITY ?auto_894724 ?auto_894731 ) ( not ( = ?auto_894724 ?auto_894732 ) ) ( OBJ-AT ?auto_894728 ?auto_894724 ) ( not ( = ?auto_894728 ?auto_894726 ) ) ( OBJ-AT ?auto_894726 ?auto_894732 ) ( TRUCK-AT ?auto_894730 ?auto_894724 ) ( OBJ-AT ?auto_894725 ?auto_894724 ) ( OBJ-AT ?auto_894727 ?auto_894724 ) ( OBJ-AT ?auto_894729 ?auto_894724 ) ( not ( = ?auto_894725 ?auto_894726 ) ) ( not ( = ?auto_894725 ?auto_894727 ) ) ( not ( = ?auto_894725 ?auto_894728 ) ) ( not ( = ?auto_894725 ?auto_894729 ) ) ( not ( = ?auto_894726 ?auto_894727 ) ) ( not ( = ?auto_894726 ?auto_894729 ) ) ( not ( = ?auto_894727 ?auto_894728 ) ) ( not ( = ?auto_894727 ?auto_894729 ) ) ( not ( = ?auto_894728 ?auto_894729 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894728 ?auto_894726 ?auto_894724 )
      ( DELIVER-5PKG-VERIFY ?auto_894725 ?auto_894726 ?auto_894727 ?auto_894728 ?auto_894729 ?auto_894724 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_894797 - OBJ
      ?auto_894798 - OBJ
      ?auto_894799 - OBJ
      ?auto_894800 - OBJ
      ?auto_894801 - OBJ
      ?auto_894796 - LOCATION
    )
    :vars
    (
      ?auto_894804 - LOCATION
      ?auto_894803 - CITY
      ?auto_894802 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_894804 ?auto_894803 ) ( IN-CITY ?auto_894796 ?auto_894803 ) ( not ( = ?auto_894796 ?auto_894804 ) ) ( OBJ-AT ?auto_894801 ?auto_894796 ) ( not ( = ?auto_894801 ?auto_894797 ) ) ( OBJ-AT ?auto_894797 ?auto_894804 ) ( TRUCK-AT ?auto_894802 ?auto_894796 ) ( OBJ-AT ?auto_894798 ?auto_894796 ) ( OBJ-AT ?auto_894799 ?auto_894796 ) ( OBJ-AT ?auto_894800 ?auto_894796 ) ( not ( = ?auto_894797 ?auto_894798 ) ) ( not ( = ?auto_894797 ?auto_894799 ) ) ( not ( = ?auto_894797 ?auto_894800 ) ) ( not ( = ?auto_894798 ?auto_894799 ) ) ( not ( = ?auto_894798 ?auto_894800 ) ) ( not ( = ?auto_894798 ?auto_894801 ) ) ( not ( = ?auto_894799 ?auto_894800 ) ) ( not ( = ?auto_894799 ?auto_894801 ) ) ( not ( = ?auto_894800 ?auto_894801 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894801 ?auto_894797 ?auto_894796 )
      ( DELIVER-5PKG-VERIFY ?auto_894797 ?auto_894798 ?auto_894799 ?auto_894800 ?auto_894801 ?auto_894796 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_894942 - OBJ
      ?auto_894941 - LOCATION
    )
    :vars
    (
      ?auto_894946 - LOCATION
      ?auto_894944 - CITY
      ?auto_894945 - OBJ
      ?auto_894943 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_894946 ?auto_894944 ) ( IN-CITY ?auto_894941 ?auto_894944 ) ( not ( = ?auto_894941 ?auto_894946 ) ) ( not ( = ?auto_894945 ?auto_894942 ) ) ( OBJ-AT ?auto_894942 ?auto_894946 ) ( TRUCK-AT ?auto_894943 ?auto_894941 ) ( IN-TRUCK ?auto_894945 ?auto_894943 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_894945 ?auto_894941 )
      ( DELIVER-2PKG ?auto_894945 ?auto_894942 ?auto_894941 )
      ( DELIVER-1PKG-VERIFY ?auto_894942 ?auto_894941 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_894948 - OBJ
      ?auto_894949 - OBJ
      ?auto_894947 - LOCATION
    )
    :vars
    (
      ?auto_894951 - LOCATION
      ?auto_894950 - CITY
      ?auto_894952 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_894951 ?auto_894950 ) ( IN-CITY ?auto_894947 ?auto_894950 ) ( not ( = ?auto_894947 ?auto_894951 ) ) ( not ( = ?auto_894948 ?auto_894949 ) ) ( OBJ-AT ?auto_894949 ?auto_894951 ) ( TRUCK-AT ?auto_894952 ?auto_894947 ) ( IN-TRUCK ?auto_894948 ?auto_894952 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_894949 ?auto_894947 )
      ( DELIVER-2PKG-VERIFY ?auto_894948 ?auto_894949 ?auto_894947 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_894954 - OBJ
      ?auto_894955 - OBJ
      ?auto_894953 - LOCATION
    )
    :vars
    (
      ?auto_894958 - LOCATION
      ?auto_894956 - CITY
      ?auto_894957 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_894958 ?auto_894956 ) ( IN-CITY ?auto_894953 ?auto_894956 ) ( not ( = ?auto_894953 ?auto_894958 ) ) ( not ( = ?auto_894955 ?auto_894954 ) ) ( OBJ-AT ?auto_894954 ?auto_894958 ) ( TRUCK-AT ?auto_894957 ?auto_894953 ) ( IN-TRUCK ?auto_894955 ?auto_894957 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894955 ?auto_894954 ?auto_894953 )
      ( DELIVER-2PKG-VERIFY ?auto_894954 ?auto_894955 ?auto_894953 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_895418 - OBJ
      ?auto_895417 - LOCATION
    )
    :vars
    (
      ?auto_895421 - LOCATION
      ?auto_895419 - CITY
      ?auto_895422 - OBJ
      ?auto_895420 - TRUCK
      ?auto_895423 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_895421 ?auto_895419 ) ( IN-CITY ?auto_895417 ?auto_895419 ) ( not ( = ?auto_895417 ?auto_895421 ) ) ( not ( = ?auto_895422 ?auto_895418 ) ) ( OBJ-AT ?auto_895418 ?auto_895421 ) ( IN-TRUCK ?auto_895422 ?auto_895420 ) ( TRUCK-AT ?auto_895420 ?auto_895423 ) ( IN-CITY ?auto_895423 ?auto_895419 ) ( not ( = ?auto_895417 ?auto_895423 ) ) ( not ( = ?auto_895421 ?auto_895423 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_895420 ?auto_895423 ?auto_895417 ?auto_895419 )
      ( DELIVER-2PKG ?auto_895422 ?auto_895418 ?auto_895417 )
      ( DELIVER-1PKG-VERIFY ?auto_895418 ?auto_895417 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_895425 - OBJ
      ?auto_895426 - OBJ
      ?auto_895424 - LOCATION
    )
    :vars
    (
      ?auto_895429 - LOCATION
      ?auto_895428 - CITY
      ?auto_895427 - TRUCK
      ?auto_895430 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_895429 ?auto_895428 ) ( IN-CITY ?auto_895424 ?auto_895428 ) ( not ( = ?auto_895424 ?auto_895429 ) ) ( not ( = ?auto_895425 ?auto_895426 ) ) ( OBJ-AT ?auto_895426 ?auto_895429 ) ( IN-TRUCK ?auto_895425 ?auto_895427 ) ( TRUCK-AT ?auto_895427 ?auto_895430 ) ( IN-CITY ?auto_895430 ?auto_895428 ) ( not ( = ?auto_895424 ?auto_895430 ) ) ( not ( = ?auto_895429 ?auto_895430 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_895426 ?auto_895424 )
      ( DELIVER-2PKG-VERIFY ?auto_895425 ?auto_895426 ?auto_895424 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_895432 - OBJ
      ?auto_895433 - OBJ
      ?auto_895431 - LOCATION
    )
    :vars
    (
      ?auto_895435 - LOCATION
      ?auto_895436 - CITY
      ?auto_895434 - TRUCK
      ?auto_895437 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_895435 ?auto_895436 ) ( IN-CITY ?auto_895431 ?auto_895436 ) ( not ( = ?auto_895431 ?auto_895435 ) ) ( not ( = ?auto_895433 ?auto_895432 ) ) ( OBJ-AT ?auto_895432 ?auto_895435 ) ( IN-TRUCK ?auto_895433 ?auto_895434 ) ( TRUCK-AT ?auto_895434 ?auto_895437 ) ( IN-CITY ?auto_895437 ?auto_895436 ) ( not ( = ?auto_895431 ?auto_895437 ) ) ( not ( = ?auto_895435 ?auto_895437 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_895433 ?auto_895432 ?auto_895431 )
      ( DELIVER-2PKG-VERIFY ?auto_895432 ?auto_895433 ?auto_895431 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_895951 - OBJ
      ?auto_895950 - LOCATION
    )
    :vars
    (
      ?auto_895954 - LOCATION
      ?auto_895955 - CITY
      ?auto_895953 - OBJ
      ?auto_895952 - TRUCK
      ?auto_895956 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_895954 ?auto_895955 ) ( IN-CITY ?auto_895950 ?auto_895955 ) ( not ( = ?auto_895950 ?auto_895954 ) ) ( not ( = ?auto_895953 ?auto_895951 ) ) ( OBJ-AT ?auto_895951 ?auto_895954 ) ( TRUCK-AT ?auto_895952 ?auto_895956 ) ( IN-CITY ?auto_895956 ?auto_895955 ) ( not ( = ?auto_895950 ?auto_895956 ) ) ( not ( = ?auto_895954 ?auto_895956 ) ) ( OBJ-AT ?auto_895953 ?auto_895956 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_895953 ?auto_895952 ?auto_895956 )
      ( DELIVER-2PKG ?auto_895953 ?auto_895951 ?auto_895950 )
      ( DELIVER-1PKG-VERIFY ?auto_895951 ?auto_895950 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_895958 - OBJ
      ?auto_895959 - OBJ
      ?auto_895957 - LOCATION
    )
    :vars
    (
      ?auto_895963 - LOCATION
      ?auto_895962 - CITY
      ?auto_895960 - TRUCK
      ?auto_895961 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_895963 ?auto_895962 ) ( IN-CITY ?auto_895957 ?auto_895962 ) ( not ( = ?auto_895957 ?auto_895963 ) ) ( not ( = ?auto_895958 ?auto_895959 ) ) ( OBJ-AT ?auto_895959 ?auto_895963 ) ( TRUCK-AT ?auto_895960 ?auto_895961 ) ( IN-CITY ?auto_895961 ?auto_895962 ) ( not ( = ?auto_895957 ?auto_895961 ) ) ( not ( = ?auto_895963 ?auto_895961 ) ) ( OBJ-AT ?auto_895958 ?auto_895961 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_895959 ?auto_895957 )
      ( DELIVER-2PKG-VERIFY ?auto_895958 ?auto_895959 ?auto_895957 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_895965 - OBJ
      ?auto_895966 - OBJ
      ?auto_895964 - LOCATION
    )
    :vars
    (
      ?auto_895968 - LOCATION
      ?auto_895970 - CITY
      ?auto_895969 - TRUCK
      ?auto_895967 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_895968 ?auto_895970 ) ( IN-CITY ?auto_895964 ?auto_895970 ) ( not ( = ?auto_895964 ?auto_895968 ) ) ( not ( = ?auto_895966 ?auto_895965 ) ) ( OBJ-AT ?auto_895965 ?auto_895968 ) ( TRUCK-AT ?auto_895969 ?auto_895967 ) ( IN-CITY ?auto_895967 ?auto_895970 ) ( not ( = ?auto_895964 ?auto_895967 ) ) ( not ( = ?auto_895968 ?auto_895967 ) ) ( OBJ-AT ?auto_895966 ?auto_895967 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_895966 ?auto_895965 ?auto_895964 )
      ( DELIVER-2PKG-VERIFY ?auto_895965 ?auto_895966 ?auto_895964 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_900654 - OBJ
      ?auto_900655 - OBJ
      ?auto_900656 - OBJ
      ?auto_900653 - LOCATION
    )
    :vars
    (
      ?auto_900657 - TRUCK
      ?auto_900658 - LOCATION
      ?auto_900659 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_900655 ?auto_900657 ) ( TRUCK-AT ?auto_900657 ?auto_900658 ) ( IN-CITY ?auto_900658 ?auto_900659 ) ( IN-CITY ?auto_900653 ?auto_900659 ) ( not ( = ?auto_900653 ?auto_900658 ) ) ( OBJ-AT ?auto_900654 ?auto_900653 ) ( not ( = ?auto_900654 ?auto_900655 ) ) ( OBJ-AT ?auto_900656 ?auto_900653 ) ( not ( = ?auto_900654 ?auto_900656 ) ) ( not ( = ?auto_900655 ?auto_900656 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_900654 ?auto_900655 ?auto_900653 )
      ( DELIVER-3PKG-VERIFY ?auto_900654 ?auto_900655 ?auto_900656 ?auto_900653 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_900676 - OBJ
      ?auto_900677 - OBJ
      ?auto_900678 - OBJ
      ?auto_900675 - LOCATION
    )
    :vars
    (
      ?auto_900680 - TRUCK
      ?auto_900681 - LOCATION
      ?auto_900682 - CITY
      ?auto_900679 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_900678 ?auto_900680 ) ( TRUCK-AT ?auto_900680 ?auto_900681 ) ( IN-CITY ?auto_900681 ?auto_900682 ) ( IN-CITY ?auto_900675 ?auto_900682 ) ( not ( = ?auto_900675 ?auto_900681 ) ) ( OBJ-AT ?auto_900679 ?auto_900675 ) ( not ( = ?auto_900679 ?auto_900678 ) ) ( OBJ-AT ?auto_900676 ?auto_900675 ) ( OBJ-AT ?auto_900677 ?auto_900675 ) ( not ( = ?auto_900676 ?auto_900677 ) ) ( not ( = ?auto_900676 ?auto_900678 ) ) ( not ( = ?auto_900676 ?auto_900679 ) ) ( not ( = ?auto_900677 ?auto_900678 ) ) ( not ( = ?auto_900677 ?auto_900679 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_900679 ?auto_900678 ?auto_900675 )
      ( DELIVER-3PKG-VERIFY ?auto_900676 ?auto_900677 ?auto_900678 ?auto_900675 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_900688 - OBJ
      ?auto_900689 - OBJ
      ?auto_900690 - OBJ
      ?auto_900687 - LOCATION
    )
    :vars
    (
      ?auto_900692 - TRUCK
      ?auto_900693 - LOCATION
      ?auto_900694 - CITY
      ?auto_900691 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_900689 ?auto_900692 ) ( TRUCK-AT ?auto_900692 ?auto_900693 ) ( IN-CITY ?auto_900693 ?auto_900694 ) ( IN-CITY ?auto_900687 ?auto_900694 ) ( not ( = ?auto_900687 ?auto_900693 ) ) ( OBJ-AT ?auto_900691 ?auto_900687 ) ( not ( = ?auto_900691 ?auto_900689 ) ) ( OBJ-AT ?auto_900688 ?auto_900687 ) ( OBJ-AT ?auto_900690 ?auto_900687 ) ( not ( = ?auto_900688 ?auto_900689 ) ) ( not ( = ?auto_900688 ?auto_900690 ) ) ( not ( = ?auto_900688 ?auto_900691 ) ) ( not ( = ?auto_900689 ?auto_900690 ) ) ( not ( = ?auto_900690 ?auto_900691 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_900691 ?auto_900689 ?auto_900687 )
      ( DELIVER-3PKG-VERIFY ?auto_900688 ?auto_900689 ?auto_900690 ?auto_900687 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_900704 - OBJ
      ?auto_900705 - OBJ
      ?auto_900706 - OBJ
      ?auto_900703 - LOCATION
    )
    :vars
    (
      ?auto_900707 - TRUCK
      ?auto_900708 - LOCATION
      ?auto_900709 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_900704 ?auto_900707 ) ( TRUCK-AT ?auto_900707 ?auto_900708 ) ( IN-CITY ?auto_900708 ?auto_900709 ) ( IN-CITY ?auto_900703 ?auto_900709 ) ( not ( = ?auto_900703 ?auto_900708 ) ) ( OBJ-AT ?auto_900705 ?auto_900703 ) ( not ( = ?auto_900705 ?auto_900704 ) ) ( OBJ-AT ?auto_900706 ?auto_900703 ) ( not ( = ?auto_900704 ?auto_900706 ) ) ( not ( = ?auto_900705 ?auto_900706 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_900705 ?auto_900704 ?auto_900703 )
      ( DELIVER-3PKG-VERIFY ?auto_900704 ?auto_900705 ?auto_900706 ?auto_900703 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_900726 - OBJ
      ?auto_900727 - OBJ
      ?auto_900728 - OBJ
      ?auto_900725 - LOCATION
    )
    :vars
    (
      ?auto_900730 - TRUCK
      ?auto_900731 - LOCATION
      ?auto_900732 - CITY
      ?auto_900729 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_900726 ?auto_900730 ) ( TRUCK-AT ?auto_900730 ?auto_900731 ) ( IN-CITY ?auto_900731 ?auto_900732 ) ( IN-CITY ?auto_900725 ?auto_900732 ) ( not ( = ?auto_900725 ?auto_900731 ) ) ( OBJ-AT ?auto_900729 ?auto_900725 ) ( not ( = ?auto_900729 ?auto_900726 ) ) ( OBJ-AT ?auto_900727 ?auto_900725 ) ( OBJ-AT ?auto_900728 ?auto_900725 ) ( not ( = ?auto_900726 ?auto_900727 ) ) ( not ( = ?auto_900726 ?auto_900728 ) ) ( not ( = ?auto_900727 ?auto_900728 ) ) ( not ( = ?auto_900727 ?auto_900729 ) ) ( not ( = ?auto_900728 ?auto_900729 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_900729 ?auto_900726 ?auto_900725 )
      ( DELIVER-3PKG-VERIFY ?auto_900726 ?auto_900727 ?auto_900728 ?auto_900725 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_900773 - OBJ
      ?auto_900774 - OBJ
      ?auto_900775 - OBJ
      ?auto_900776 - OBJ
      ?auto_900772 - LOCATION
    )
    :vars
    (
      ?auto_900777 - TRUCK
      ?auto_900778 - LOCATION
      ?auto_900779 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_900776 ?auto_900777 ) ( TRUCK-AT ?auto_900777 ?auto_900778 ) ( IN-CITY ?auto_900778 ?auto_900779 ) ( IN-CITY ?auto_900772 ?auto_900779 ) ( not ( = ?auto_900772 ?auto_900778 ) ) ( OBJ-AT ?auto_900773 ?auto_900772 ) ( not ( = ?auto_900773 ?auto_900776 ) ) ( OBJ-AT ?auto_900774 ?auto_900772 ) ( OBJ-AT ?auto_900775 ?auto_900772 ) ( not ( = ?auto_900773 ?auto_900774 ) ) ( not ( = ?auto_900773 ?auto_900775 ) ) ( not ( = ?auto_900774 ?auto_900775 ) ) ( not ( = ?auto_900774 ?auto_900776 ) ) ( not ( = ?auto_900775 ?auto_900776 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_900773 ?auto_900776 ?auto_900772 )
      ( DELIVER-4PKG-VERIFY ?auto_900773 ?auto_900774 ?auto_900775 ?auto_900776 ?auto_900772 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_900781 - OBJ
      ?auto_900782 - OBJ
      ?auto_900783 - OBJ
      ?auto_900784 - OBJ
      ?auto_900780 - LOCATION
    )
    :vars
    (
      ?auto_900785 - TRUCK
      ?auto_900786 - LOCATION
      ?auto_900787 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_900783 ?auto_900785 ) ( TRUCK-AT ?auto_900785 ?auto_900786 ) ( IN-CITY ?auto_900786 ?auto_900787 ) ( IN-CITY ?auto_900780 ?auto_900787 ) ( not ( = ?auto_900780 ?auto_900786 ) ) ( OBJ-AT ?auto_900781 ?auto_900780 ) ( not ( = ?auto_900781 ?auto_900783 ) ) ( OBJ-AT ?auto_900782 ?auto_900780 ) ( OBJ-AT ?auto_900784 ?auto_900780 ) ( not ( = ?auto_900781 ?auto_900782 ) ) ( not ( = ?auto_900781 ?auto_900784 ) ) ( not ( = ?auto_900782 ?auto_900783 ) ) ( not ( = ?auto_900782 ?auto_900784 ) ) ( not ( = ?auto_900783 ?auto_900784 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_900781 ?auto_900783 ?auto_900780 )
      ( DELIVER-4PKG-VERIFY ?auto_900781 ?auto_900782 ?auto_900783 ?auto_900784 ?auto_900780 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_900805 - OBJ
      ?auto_900806 - OBJ
      ?auto_900807 - OBJ
      ?auto_900808 - OBJ
      ?auto_900804 - LOCATION
    )
    :vars
    (
      ?auto_900809 - TRUCK
      ?auto_900810 - LOCATION
      ?auto_900811 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_900808 ?auto_900809 ) ( TRUCK-AT ?auto_900809 ?auto_900810 ) ( IN-CITY ?auto_900810 ?auto_900811 ) ( IN-CITY ?auto_900804 ?auto_900811 ) ( not ( = ?auto_900804 ?auto_900810 ) ) ( OBJ-AT ?auto_900807 ?auto_900804 ) ( not ( = ?auto_900807 ?auto_900808 ) ) ( OBJ-AT ?auto_900805 ?auto_900804 ) ( OBJ-AT ?auto_900806 ?auto_900804 ) ( not ( = ?auto_900805 ?auto_900806 ) ) ( not ( = ?auto_900805 ?auto_900807 ) ) ( not ( = ?auto_900805 ?auto_900808 ) ) ( not ( = ?auto_900806 ?auto_900807 ) ) ( not ( = ?auto_900806 ?auto_900808 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_900807 ?auto_900808 ?auto_900804 )
      ( DELIVER-4PKG-VERIFY ?auto_900805 ?auto_900806 ?auto_900807 ?auto_900808 ?auto_900804 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_900845 - OBJ
      ?auto_900846 - OBJ
      ?auto_900847 - OBJ
      ?auto_900848 - OBJ
      ?auto_900844 - LOCATION
    )
    :vars
    (
      ?auto_900849 - TRUCK
      ?auto_900850 - LOCATION
      ?auto_900851 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_900846 ?auto_900849 ) ( TRUCK-AT ?auto_900849 ?auto_900850 ) ( IN-CITY ?auto_900850 ?auto_900851 ) ( IN-CITY ?auto_900844 ?auto_900851 ) ( not ( = ?auto_900844 ?auto_900850 ) ) ( OBJ-AT ?auto_900847 ?auto_900844 ) ( not ( = ?auto_900847 ?auto_900846 ) ) ( OBJ-AT ?auto_900845 ?auto_900844 ) ( OBJ-AT ?auto_900848 ?auto_900844 ) ( not ( = ?auto_900845 ?auto_900846 ) ) ( not ( = ?auto_900845 ?auto_900847 ) ) ( not ( = ?auto_900845 ?auto_900848 ) ) ( not ( = ?auto_900846 ?auto_900848 ) ) ( not ( = ?auto_900847 ?auto_900848 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_900847 ?auto_900846 ?auto_900844 )
      ( DELIVER-4PKG-VERIFY ?auto_900845 ?auto_900846 ?auto_900847 ?auto_900848 ?auto_900844 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_900941 - OBJ
      ?auto_900942 - OBJ
      ?auto_900943 - OBJ
      ?auto_900944 - OBJ
      ?auto_900940 - LOCATION
    )
    :vars
    (
      ?auto_900945 - TRUCK
      ?auto_900946 - LOCATION
      ?auto_900947 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_900943 ?auto_900945 ) ( TRUCK-AT ?auto_900945 ?auto_900946 ) ( IN-CITY ?auto_900946 ?auto_900947 ) ( IN-CITY ?auto_900940 ?auto_900947 ) ( not ( = ?auto_900940 ?auto_900946 ) ) ( OBJ-AT ?auto_900942 ?auto_900940 ) ( not ( = ?auto_900942 ?auto_900943 ) ) ( OBJ-AT ?auto_900941 ?auto_900940 ) ( OBJ-AT ?auto_900944 ?auto_900940 ) ( not ( = ?auto_900941 ?auto_900942 ) ) ( not ( = ?auto_900941 ?auto_900943 ) ) ( not ( = ?auto_900941 ?auto_900944 ) ) ( not ( = ?auto_900942 ?auto_900944 ) ) ( not ( = ?auto_900943 ?auto_900944 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_900942 ?auto_900943 ?auto_900940 )
      ( DELIVER-4PKG-VERIFY ?auto_900941 ?auto_900942 ?auto_900943 ?auto_900944 ?auto_900940 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_900965 - OBJ
      ?auto_900966 - OBJ
      ?auto_900967 - OBJ
      ?auto_900968 - OBJ
      ?auto_900964 - LOCATION
    )
    :vars
    (
      ?auto_900970 - TRUCK
      ?auto_900971 - LOCATION
      ?auto_900972 - CITY
      ?auto_900969 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_900968 ?auto_900970 ) ( TRUCK-AT ?auto_900970 ?auto_900971 ) ( IN-CITY ?auto_900971 ?auto_900972 ) ( IN-CITY ?auto_900964 ?auto_900972 ) ( not ( = ?auto_900964 ?auto_900971 ) ) ( OBJ-AT ?auto_900969 ?auto_900964 ) ( not ( = ?auto_900969 ?auto_900968 ) ) ( OBJ-AT ?auto_900965 ?auto_900964 ) ( OBJ-AT ?auto_900966 ?auto_900964 ) ( OBJ-AT ?auto_900967 ?auto_900964 ) ( not ( = ?auto_900965 ?auto_900966 ) ) ( not ( = ?auto_900965 ?auto_900967 ) ) ( not ( = ?auto_900965 ?auto_900968 ) ) ( not ( = ?auto_900965 ?auto_900969 ) ) ( not ( = ?auto_900966 ?auto_900967 ) ) ( not ( = ?auto_900966 ?auto_900968 ) ) ( not ( = ?auto_900966 ?auto_900969 ) ) ( not ( = ?auto_900967 ?auto_900968 ) ) ( not ( = ?auto_900967 ?auto_900969 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_900969 ?auto_900968 ?auto_900964 )
      ( DELIVER-4PKG-VERIFY ?auto_900965 ?auto_900966 ?auto_900967 ?auto_900968 ?auto_900964 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_900982 - OBJ
      ?auto_900983 - OBJ
      ?auto_900984 - OBJ
      ?auto_900985 - OBJ
      ?auto_900981 - LOCATION
    )
    :vars
    (
      ?auto_900987 - TRUCK
      ?auto_900988 - LOCATION
      ?auto_900989 - CITY
      ?auto_900986 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_900984 ?auto_900987 ) ( TRUCK-AT ?auto_900987 ?auto_900988 ) ( IN-CITY ?auto_900988 ?auto_900989 ) ( IN-CITY ?auto_900981 ?auto_900989 ) ( not ( = ?auto_900981 ?auto_900988 ) ) ( OBJ-AT ?auto_900986 ?auto_900981 ) ( not ( = ?auto_900986 ?auto_900984 ) ) ( OBJ-AT ?auto_900982 ?auto_900981 ) ( OBJ-AT ?auto_900983 ?auto_900981 ) ( OBJ-AT ?auto_900985 ?auto_900981 ) ( not ( = ?auto_900982 ?auto_900983 ) ) ( not ( = ?auto_900982 ?auto_900984 ) ) ( not ( = ?auto_900982 ?auto_900985 ) ) ( not ( = ?auto_900982 ?auto_900986 ) ) ( not ( = ?auto_900983 ?auto_900984 ) ) ( not ( = ?auto_900983 ?auto_900985 ) ) ( not ( = ?auto_900983 ?auto_900986 ) ) ( not ( = ?auto_900984 ?auto_900985 ) ) ( not ( = ?auto_900985 ?auto_900986 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_900986 ?auto_900984 ?auto_900981 )
      ( DELIVER-4PKG-VERIFY ?auto_900982 ?auto_900983 ?auto_900984 ?auto_900985 ?auto_900981 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_901000 - OBJ
      ?auto_901001 - OBJ
      ?auto_901002 - OBJ
      ?auto_901003 - OBJ
      ?auto_900999 - LOCATION
    )
    :vars
    (
      ?auto_901004 - TRUCK
      ?auto_901005 - LOCATION
      ?auto_901006 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_901001 ?auto_901004 ) ( TRUCK-AT ?auto_901004 ?auto_901005 ) ( IN-CITY ?auto_901005 ?auto_901006 ) ( IN-CITY ?auto_900999 ?auto_901006 ) ( not ( = ?auto_900999 ?auto_901005 ) ) ( OBJ-AT ?auto_901003 ?auto_900999 ) ( not ( = ?auto_901003 ?auto_901001 ) ) ( OBJ-AT ?auto_901000 ?auto_900999 ) ( OBJ-AT ?auto_901002 ?auto_900999 ) ( not ( = ?auto_901000 ?auto_901001 ) ) ( not ( = ?auto_901000 ?auto_901002 ) ) ( not ( = ?auto_901000 ?auto_901003 ) ) ( not ( = ?auto_901001 ?auto_901002 ) ) ( not ( = ?auto_901002 ?auto_901003 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_901003 ?auto_901001 ?auto_900999 )
      ( DELIVER-4PKG-VERIFY ?auto_901000 ?auto_901001 ?auto_901002 ?auto_901003 ?auto_900999 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_901032 - OBJ
      ?auto_901033 - OBJ
      ?auto_901034 - OBJ
      ?auto_901035 - OBJ
      ?auto_901031 - LOCATION
    )
    :vars
    (
      ?auto_901037 - TRUCK
      ?auto_901038 - LOCATION
      ?auto_901039 - CITY
      ?auto_901036 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_901033 ?auto_901037 ) ( TRUCK-AT ?auto_901037 ?auto_901038 ) ( IN-CITY ?auto_901038 ?auto_901039 ) ( IN-CITY ?auto_901031 ?auto_901039 ) ( not ( = ?auto_901031 ?auto_901038 ) ) ( OBJ-AT ?auto_901036 ?auto_901031 ) ( not ( = ?auto_901036 ?auto_901033 ) ) ( OBJ-AT ?auto_901032 ?auto_901031 ) ( OBJ-AT ?auto_901034 ?auto_901031 ) ( OBJ-AT ?auto_901035 ?auto_901031 ) ( not ( = ?auto_901032 ?auto_901033 ) ) ( not ( = ?auto_901032 ?auto_901034 ) ) ( not ( = ?auto_901032 ?auto_901035 ) ) ( not ( = ?auto_901032 ?auto_901036 ) ) ( not ( = ?auto_901033 ?auto_901034 ) ) ( not ( = ?auto_901033 ?auto_901035 ) ) ( not ( = ?auto_901034 ?auto_901035 ) ) ( not ( = ?auto_901034 ?auto_901036 ) ) ( not ( = ?auto_901035 ?auto_901036 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_901036 ?auto_901033 ?auto_901031 )
      ( DELIVER-4PKG-VERIFY ?auto_901032 ?auto_901033 ?auto_901034 ?auto_901035 ?auto_901031 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_901076 - OBJ
      ?auto_901077 - OBJ
      ?auto_901078 - OBJ
      ?auto_901079 - OBJ
      ?auto_901075 - LOCATION
    )
    :vars
    (
      ?auto_901080 - TRUCK
      ?auto_901081 - LOCATION
      ?auto_901082 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_901076 ?auto_901080 ) ( TRUCK-AT ?auto_901080 ?auto_901081 ) ( IN-CITY ?auto_901081 ?auto_901082 ) ( IN-CITY ?auto_901075 ?auto_901082 ) ( not ( = ?auto_901075 ?auto_901081 ) ) ( OBJ-AT ?auto_901077 ?auto_901075 ) ( not ( = ?auto_901077 ?auto_901076 ) ) ( OBJ-AT ?auto_901078 ?auto_901075 ) ( OBJ-AT ?auto_901079 ?auto_901075 ) ( not ( = ?auto_901076 ?auto_901078 ) ) ( not ( = ?auto_901076 ?auto_901079 ) ) ( not ( = ?auto_901077 ?auto_901078 ) ) ( not ( = ?auto_901077 ?auto_901079 ) ) ( not ( = ?auto_901078 ?auto_901079 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_901077 ?auto_901076 ?auto_901075 )
      ( DELIVER-4PKG-VERIFY ?auto_901076 ?auto_901077 ?auto_901078 ?auto_901079 ?auto_901075 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_901148 - OBJ
      ?auto_901149 - OBJ
      ?auto_901150 - OBJ
      ?auto_901151 - OBJ
      ?auto_901147 - LOCATION
    )
    :vars
    (
      ?auto_901152 - TRUCK
      ?auto_901153 - LOCATION
      ?auto_901154 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_901148 ?auto_901152 ) ( TRUCK-AT ?auto_901152 ?auto_901153 ) ( IN-CITY ?auto_901153 ?auto_901154 ) ( IN-CITY ?auto_901147 ?auto_901154 ) ( not ( = ?auto_901147 ?auto_901153 ) ) ( OBJ-AT ?auto_901150 ?auto_901147 ) ( not ( = ?auto_901150 ?auto_901148 ) ) ( OBJ-AT ?auto_901149 ?auto_901147 ) ( OBJ-AT ?auto_901151 ?auto_901147 ) ( not ( = ?auto_901148 ?auto_901149 ) ) ( not ( = ?auto_901148 ?auto_901151 ) ) ( not ( = ?auto_901149 ?auto_901150 ) ) ( not ( = ?auto_901149 ?auto_901151 ) ) ( not ( = ?auto_901150 ?auto_901151 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_901150 ?auto_901148 ?auto_901147 )
      ( DELIVER-4PKG-VERIFY ?auto_901148 ?auto_901149 ?auto_901150 ?auto_901151 ?auto_901147 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_901180 - OBJ
      ?auto_901181 - OBJ
      ?auto_901182 - OBJ
      ?auto_901183 - OBJ
      ?auto_901179 - LOCATION
    )
    :vars
    (
      ?auto_901185 - TRUCK
      ?auto_901186 - LOCATION
      ?auto_901187 - CITY
      ?auto_901184 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_901180 ?auto_901185 ) ( TRUCK-AT ?auto_901185 ?auto_901186 ) ( IN-CITY ?auto_901186 ?auto_901187 ) ( IN-CITY ?auto_901179 ?auto_901187 ) ( not ( = ?auto_901179 ?auto_901186 ) ) ( OBJ-AT ?auto_901184 ?auto_901179 ) ( not ( = ?auto_901184 ?auto_901180 ) ) ( OBJ-AT ?auto_901181 ?auto_901179 ) ( OBJ-AT ?auto_901182 ?auto_901179 ) ( OBJ-AT ?auto_901183 ?auto_901179 ) ( not ( = ?auto_901180 ?auto_901181 ) ) ( not ( = ?auto_901180 ?auto_901182 ) ) ( not ( = ?auto_901180 ?auto_901183 ) ) ( not ( = ?auto_901181 ?auto_901182 ) ) ( not ( = ?auto_901181 ?auto_901183 ) ) ( not ( = ?auto_901181 ?auto_901184 ) ) ( not ( = ?auto_901182 ?auto_901183 ) ) ( not ( = ?auto_901182 ?auto_901184 ) ) ( not ( = ?auto_901183 ?auto_901184 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_901184 ?auto_901180 ?auto_901179 )
      ( DELIVER-4PKG-VERIFY ?auto_901180 ?auto_901181 ?auto_901182 ?auto_901183 ?auto_901179 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_901300 - OBJ
      ?auto_901301 - OBJ
      ?auto_901302 - OBJ
      ?auto_901303 - OBJ
      ?auto_901304 - OBJ
      ?auto_901299 - LOCATION
    )
    :vars
    (
      ?auto_901305 - TRUCK
      ?auto_901306 - LOCATION
      ?auto_901307 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_901304 ?auto_901305 ) ( TRUCK-AT ?auto_901305 ?auto_901306 ) ( IN-CITY ?auto_901306 ?auto_901307 ) ( IN-CITY ?auto_901299 ?auto_901307 ) ( not ( = ?auto_901299 ?auto_901306 ) ) ( OBJ-AT ?auto_901301 ?auto_901299 ) ( not ( = ?auto_901301 ?auto_901304 ) ) ( OBJ-AT ?auto_901300 ?auto_901299 ) ( OBJ-AT ?auto_901302 ?auto_901299 ) ( OBJ-AT ?auto_901303 ?auto_901299 ) ( not ( = ?auto_901300 ?auto_901301 ) ) ( not ( = ?auto_901300 ?auto_901302 ) ) ( not ( = ?auto_901300 ?auto_901303 ) ) ( not ( = ?auto_901300 ?auto_901304 ) ) ( not ( = ?auto_901301 ?auto_901302 ) ) ( not ( = ?auto_901301 ?auto_901303 ) ) ( not ( = ?auto_901302 ?auto_901303 ) ) ( not ( = ?auto_901302 ?auto_901304 ) ) ( not ( = ?auto_901303 ?auto_901304 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_901301 ?auto_901304 ?auto_901299 )
      ( DELIVER-5PKG-VERIFY ?auto_901300 ?auto_901301 ?auto_901302 ?auto_901303 ?auto_901304 ?auto_901299 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_901318 - OBJ
      ?auto_901319 - OBJ
      ?auto_901320 - OBJ
      ?auto_901321 - OBJ
      ?auto_901322 - OBJ
      ?auto_901317 - LOCATION
    )
    :vars
    (
      ?auto_901323 - TRUCK
      ?auto_901324 - LOCATION
      ?auto_901325 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_901321 ?auto_901323 ) ( TRUCK-AT ?auto_901323 ?auto_901324 ) ( IN-CITY ?auto_901324 ?auto_901325 ) ( IN-CITY ?auto_901317 ?auto_901325 ) ( not ( = ?auto_901317 ?auto_901324 ) ) ( OBJ-AT ?auto_901322 ?auto_901317 ) ( not ( = ?auto_901322 ?auto_901321 ) ) ( OBJ-AT ?auto_901318 ?auto_901317 ) ( OBJ-AT ?auto_901319 ?auto_901317 ) ( OBJ-AT ?auto_901320 ?auto_901317 ) ( not ( = ?auto_901318 ?auto_901319 ) ) ( not ( = ?auto_901318 ?auto_901320 ) ) ( not ( = ?auto_901318 ?auto_901321 ) ) ( not ( = ?auto_901318 ?auto_901322 ) ) ( not ( = ?auto_901319 ?auto_901320 ) ) ( not ( = ?auto_901319 ?auto_901321 ) ) ( not ( = ?auto_901319 ?auto_901322 ) ) ( not ( = ?auto_901320 ?auto_901321 ) ) ( not ( = ?auto_901320 ?auto_901322 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_901322 ?auto_901321 ?auto_901317 )
      ( DELIVER-5PKG-VERIFY ?auto_901318 ?auto_901319 ?auto_901320 ?auto_901321 ?auto_901322 ?auto_901317 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_901327 - OBJ
      ?auto_901328 - OBJ
      ?auto_901329 - OBJ
      ?auto_901330 - OBJ
      ?auto_901331 - OBJ
      ?auto_901326 - LOCATION
    )
    :vars
    (
      ?auto_901332 - TRUCK
      ?auto_901333 - LOCATION
      ?auto_901334 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_901330 ?auto_901332 ) ( TRUCK-AT ?auto_901332 ?auto_901333 ) ( IN-CITY ?auto_901333 ?auto_901334 ) ( IN-CITY ?auto_901326 ?auto_901334 ) ( not ( = ?auto_901326 ?auto_901333 ) ) ( OBJ-AT ?auto_901327 ?auto_901326 ) ( not ( = ?auto_901327 ?auto_901330 ) ) ( OBJ-AT ?auto_901328 ?auto_901326 ) ( OBJ-AT ?auto_901329 ?auto_901326 ) ( OBJ-AT ?auto_901331 ?auto_901326 ) ( not ( = ?auto_901327 ?auto_901328 ) ) ( not ( = ?auto_901327 ?auto_901329 ) ) ( not ( = ?auto_901327 ?auto_901331 ) ) ( not ( = ?auto_901328 ?auto_901329 ) ) ( not ( = ?auto_901328 ?auto_901330 ) ) ( not ( = ?auto_901328 ?auto_901331 ) ) ( not ( = ?auto_901329 ?auto_901330 ) ) ( not ( = ?auto_901329 ?auto_901331 ) ) ( not ( = ?auto_901330 ?auto_901331 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_901327 ?auto_901330 ?auto_901326 )
      ( DELIVER-5PKG-VERIFY ?auto_901327 ?auto_901328 ?auto_901329 ?auto_901330 ?auto_901331 ?auto_901326 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_901354 - OBJ
      ?auto_901355 - OBJ
      ?auto_901356 - OBJ
      ?auto_901357 - OBJ
      ?auto_901358 - OBJ
      ?auto_901353 - LOCATION
    )
    :vars
    (
      ?auto_901359 - TRUCK
      ?auto_901360 - LOCATION
      ?auto_901361 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_901358 ?auto_901359 ) ( TRUCK-AT ?auto_901359 ?auto_901360 ) ( IN-CITY ?auto_901360 ?auto_901361 ) ( IN-CITY ?auto_901353 ?auto_901361 ) ( not ( = ?auto_901353 ?auto_901360 ) ) ( OBJ-AT ?auto_901354 ?auto_901353 ) ( not ( = ?auto_901354 ?auto_901358 ) ) ( OBJ-AT ?auto_901355 ?auto_901353 ) ( OBJ-AT ?auto_901356 ?auto_901353 ) ( OBJ-AT ?auto_901357 ?auto_901353 ) ( not ( = ?auto_901354 ?auto_901355 ) ) ( not ( = ?auto_901354 ?auto_901356 ) ) ( not ( = ?auto_901354 ?auto_901357 ) ) ( not ( = ?auto_901355 ?auto_901356 ) ) ( not ( = ?auto_901355 ?auto_901357 ) ) ( not ( = ?auto_901355 ?auto_901358 ) ) ( not ( = ?auto_901356 ?auto_901357 ) ) ( not ( = ?auto_901356 ?auto_901358 ) ) ( not ( = ?auto_901357 ?auto_901358 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_901354 ?auto_901358 ?auto_901353 )
      ( DELIVER-5PKG-VERIFY ?auto_901354 ?auto_901355 ?auto_901356 ?auto_901357 ?auto_901358 ?auto_901353 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_901390 - OBJ
      ?auto_901391 - OBJ
      ?auto_901392 - OBJ
      ?auto_901393 - OBJ
      ?auto_901394 - OBJ
      ?auto_901389 - LOCATION
    )
    :vars
    (
      ?auto_901395 - TRUCK
      ?auto_901396 - LOCATION
      ?auto_901397 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_901392 ?auto_901395 ) ( TRUCK-AT ?auto_901395 ?auto_901396 ) ( IN-CITY ?auto_901396 ?auto_901397 ) ( IN-CITY ?auto_901389 ?auto_901397 ) ( not ( = ?auto_901389 ?auto_901396 ) ) ( OBJ-AT ?auto_901390 ?auto_901389 ) ( not ( = ?auto_901390 ?auto_901392 ) ) ( OBJ-AT ?auto_901391 ?auto_901389 ) ( OBJ-AT ?auto_901393 ?auto_901389 ) ( OBJ-AT ?auto_901394 ?auto_901389 ) ( not ( = ?auto_901390 ?auto_901391 ) ) ( not ( = ?auto_901390 ?auto_901393 ) ) ( not ( = ?auto_901390 ?auto_901394 ) ) ( not ( = ?auto_901391 ?auto_901392 ) ) ( not ( = ?auto_901391 ?auto_901393 ) ) ( not ( = ?auto_901391 ?auto_901394 ) ) ( not ( = ?auto_901392 ?auto_901393 ) ) ( not ( = ?auto_901392 ?auto_901394 ) ) ( not ( = ?auto_901393 ?auto_901394 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_901390 ?auto_901392 ?auto_901389 )
      ( DELIVER-5PKG-VERIFY ?auto_901390 ?auto_901391 ?auto_901392 ?auto_901393 ?auto_901394 ?auto_901389 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_901417 - OBJ
      ?auto_901418 - OBJ
      ?auto_901419 - OBJ
      ?auto_901420 - OBJ
      ?auto_901421 - OBJ
      ?auto_901416 - LOCATION
    )
    :vars
    (
      ?auto_901422 - TRUCK
      ?auto_901423 - LOCATION
      ?auto_901424 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_901419 ?auto_901422 ) ( TRUCK-AT ?auto_901422 ?auto_901423 ) ( IN-CITY ?auto_901423 ?auto_901424 ) ( IN-CITY ?auto_901416 ?auto_901424 ) ( not ( = ?auto_901416 ?auto_901423 ) ) ( OBJ-AT ?auto_901418 ?auto_901416 ) ( not ( = ?auto_901418 ?auto_901419 ) ) ( OBJ-AT ?auto_901417 ?auto_901416 ) ( OBJ-AT ?auto_901420 ?auto_901416 ) ( OBJ-AT ?auto_901421 ?auto_901416 ) ( not ( = ?auto_901417 ?auto_901418 ) ) ( not ( = ?auto_901417 ?auto_901419 ) ) ( not ( = ?auto_901417 ?auto_901420 ) ) ( not ( = ?auto_901417 ?auto_901421 ) ) ( not ( = ?auto_901418 ?auto_901420 ) ) ( not ( = ?auto_901418 ?auto_901421 ) ) ( not ( = ?auto_901419 ?auto_901420 ) ) ( not ( = ?auto_901419 ?auto_901421 ) ) ( not ( = ?auto_901420 ?auto_901421 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_901418 ?auto_901419 ?auto_901416 )
      ( DELIVER-5PKG-VERIFY ?auto_901417 ?auto_901418 ?auto_901419 ?auto_901420 ?auto_901421 ?auto_901416 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_901561 - OBJ
      ?auto_901562 - OBJ
      ?auto_901563 - OBJ
      ?auto_901564 - OBJ
      ?auto_901565 - OBJ
      ?auto_901560 - LOCATION
    )
    :vars
    (
      ?auto_901566 - TRUCK
      ?auto_901567 - LOCATION
      ?auto_901568 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_901563 ?auto_901566 ) ( TRUCK-AT ?auto_901566 ?auto_901567 ) ( IN-CITY ?auto_901567 ?auto_901568 ) ( IN-CITY ?auto_901560 ?auto_901568 ) ( not ( = ?auto_901560 ?auto_901567 ) ) ( OBJ-AT ?auto_901565 ?auto_901560 ) ( not ( = ?auto_901565 ?auto_901563 ) ) ( OBJ-AT ?auto_901561 ?auto_901560 ) ( OBJ-AT ?auto_901562 ?auto_901560 ) ( OBJ-AT ?auto_901564 ?auto_901560 ) ( not ( = ?auto_901561 ?auto_901562 ) ) ( not ( = ?auto_901561 ?auto_901563 ) ) ( not ( = ?auto_901561 ?auto_901564 ) ) ( not ( = ?auto_901561 ?auto_901565 ) ) ( not ( = ?auto_901562 ?auto_901563 ) ) ( not ( = ?auto_901562 ?auto_901564 ) ) ( not ( = ?auto_901562 ?auto_901565 ) ) ( not ( = ?auto_901563 ?auto_901564 ) ) ( not ( = ?auto_901564 ?auto_901565 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_901565 ?auto_901563 ?auto_901560 )
      ( DELIVER-5PKG-VERIFY ?auto_901561 ?auto_901562 ?auto_901563 ?auto_901564 ?auto_901565 ?auto_901560 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_901642 - OBJ
      ?auto_901643 - OBJ
      ?auto_901644 - OBJ
      ?auto_901645 - OBJ
      ?auto_901646 - OBJ
      ?auto_901641 - LOCATION
    )
    :vars
    (
      ?auto_901647 - TRUCK
      ?auto_901648 - LOCATION
      ?auto_901649 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_901643 ?auto_901647 ) ( TRUCK-AT ?auto_901647 ?auto_901648 ) ( IN-CITY ?auto_901648 ?auto_901649 ) ( IN-CITY ?auto_901641 ?auto_901649 ) ( not ( = ?auto_901641 ?auto_901648 ) ) ( OBJ-AT ?auto_901642 ?auto_901641 ) ( not ( = ?auto_901642 ?auto_901643 ) ) ( OBJ-AT ?auto_901644 ?auto_901641 ) ( OBJ-AT ?auto_901645 ?auto_901641 ) ( OBJ-AT ?auto_901646 ?auto_901641 ) ( not ( = ?auto_901642 ?auto_901644 ) ) ( not ( = ?auto_901642 ?auto_901645 ) ) ( not ( = ?auto_901642 ?auto_901646 ) ) ( not ( = ?auto_901643 ?auto_901644 ) ) ( not ( = ?auto_901643 ?auto_901645 ) ) ( not ( = ?auto_901643 ?auto_901646 ) ) ( not ( = ?auto_901644 ?auto_901645 ) ) ( not ( = ?auto_901644 ?auto_901646 ) ) ( not ( = ?auto_901645 ?auto_901646 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_901642 ?auto_901643 ?auto_901641 )
      ( DELIVER-5PKG-VERIFY ?auto_901642 ?auto_901643 ?auto_901644 ?auto_901645 ?auto_901646 ?auto_901641 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_901651 - OBJ
      ?auto_901652 - OBJ
      ?auto_901653 - OBJ
      ?auto_901654 - OBJ
      ?auto_901655 - OBJ
      ?auto_901650 - LOCATION
    )
    :vars
    (
      ?auto_901656 - TRUCK
      ?auto_901657 - LOCATION
      ?auto_901658 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_901652 ?auto_901656 ) ( TRUCK-AT ?auto_901656 ?auto_901657 ) ( IN-CITY ?auto_901657 ?auto_901658 ) ( IN-CITY ?auto_901650 ?auto_901658 ) ( not ( = ?auto_901650 ?auto_901657 ) ) ( OBJ-AT ?auto_901654 ?auto_901650 ) ( not ( = ?auto_901654 ?auto_901652 ) ) ( OBJ-AT ?auto_901651 ?auto_901650 ) ( OBJ-AT ?auto_901653 ?auto_901650 ) ( OBJ-AT ?auto_901655 ?auto_901650 ) ( not ( = ?auto_901651 ?auto_901652 ) ) ( not ( = ?auto_901651 ?auto_901653 ) ) ( not ( = ?auto_901651 ?auto_901654 ) ) ( not ( = ?auto_901651 ?auto_901655 ) ) ( not ( = ?auto_901652 ?auto_901653 ) ) ( not ( = ?auto_901652 ?auto_901655 ) ) ( not ( = ?auto_901653 ?auto_901654 ) ) ( not ( = ?auto_901653 ?auto_901655 ) ) ( not ( = ?auto_901654 ?auto_901655 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_901654 ?auto_901652 ?auto_901650 )
      ( DELIVER-5PKG-VERIFY ?auto_901651 ?auto_901652 ?auto_901653 ?auto_901654 ?auto_901655 ?auto_901650 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_901678 - OBJ
      ?auto_901679 - OBJ
      ?auto_901680 - OBJ
      ?auto_901681 - OBJ
      ?auto_901682 - OBJ
      ?auto_901677 - LOCATION
    )
    :vars
    (
      ?auto_901683 - TRUCK
      ?auto_901684 - LOCATION
      ?auto_901685 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_901679 ?auto_901683 ) ( TRUCK-AT ?auto_901683 ?auto_901684 ) ( IN-CITY ?auto_901684 ?auto_901685 ) ( IN-CITY ?auto_901677 ?auto_901685 ) ( not ( = ?auto_901677 ?auto_901684 ) ) ( OBJ-AT ?auto_901680 ?auto_901677 ) ( not ( = ?auto_901680 ?auto_901679 ) ) ( OBJ-AT ?auto_901678 ?auto_901677 ) ( OBJ-AT ?auto_901681 ?auto_901677 ) ( OBJ-AT ?auto_901682 ?auto_901677 ) ( not ( = ?auto_901678 ?auto_901679 ) ) ( not ( = ?auto_901678 ?auto_901680 ) ) ( not ( = ?auto_901678 ?auto_901681 ) ) ( not ( = ?auto_901678 ?auto_901682 ) ) ( not ( = ?auto_901679 ?auto_901681 ) ) ( not ( = ?auto_901679 ?auto_901682 ) ) ( not ( = ?auto_901680 ?auto_901681 ) ) ( not ( = ?auto_901680 ?auto_901682 ) ) ( not ( = ?auto_901681 ?auto_901682 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_901680 ?auto_901679 ?auto_901677 )
      ( DELIVER-5PKG-VERIFY ?auto_901678 ?auto_901679 ?auto_901680 ?auto_901681 ?auto_901682 ?auto_901677 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_901894 - OBJ
      ?auto_901895 - OBJ
      ?auto_901896 - OBJ
      ?auto_901897 - OBJ
      ?auto_901898 - OBJ
      ?auto_901893 - LOCATION
    )
    :vars
    (
      ?auto_901899 - TRUCK
      ?auto_901900 - LOCATION
      ?auto_901901 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_901898 ?auto_901899 ) ( TRUCK-AT ?auto_901899 ?auto_901900 ) ( IN-CITY ?auto_901900 ?auto_901901 ) ( IN-CITY ?auto_901893 ?auto_901901 ) ( not ( = ?auto_901893 ?auto_901900 ) ) ( OBJ-AT ?auto_901896 ?auto_901893 ) ( not ( = ?auto_901896 ?auto_901898 ) ) ( OBJ-AT ?auto_901894 ?auto_901893 ) ( OBJ-AT ?auto_901895 ?auto_901893 ) ( OBJ-AT ?auto_901897 ?auto_901893 ) ( not ( = ?auto_901894 ?auto_901895 ) ) ( not ( = ?auto_901894 ?auto_901896 ) ) ( not ( = ?auto_901894 ?auto_901897 ) ) ( not ( = ?auto_901894 ?auto_901898 ) ) ( not ( = ?auto_901895 ?auto_901896 ) ) ( not ( = ?auto_901895 ?auto_901897 ) ) ( not ( = ?auto_901895 ?auto_901898 ) ) ( not ( = ?auto_901896 ?auto_901897 ) ) ( not ( = ?auto_901897 ?auto_901898 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_901896 ?auto_901898 ?auto_901893 )
      ( DELIVER-5PKG-VERIFY ?auto_901894 ?auto_901895 ?auto_901896 ?auto_901897 ?auto_901898 ?auto_901893 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_901912 - OBJ
      ?auto_901913 - OBJ
      ?auto_901914 - OBJ
      ?auto_901915 - OBJ
      ?auto_901916 - OBJ
      ?auto_901911 - LOCATION
    )
    :vars
    (
      ?auto_901917 - TRUCK
      ?auto_901918 - LOCATION
      ?auto_901919 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_901915 ?auto_901917 ) ( TRUCK-AT ?auto_901917 ?auto_901918 ) ( IN-CITY ?auto_901918 ?auto_901919 ) ( IN-CITY ?auto_901911 ?auto_901919 ) ( not ( = ?auto_901911 ?auto_901918 ) ) ( OBJ-AT ?auto_901914 ?auto_901911 ) ( not ( = ?auto_901914 ?auto_901915 ) ) ( OBJ-AT ?auto_901912 ?auto_901911 ) ( OBJ-AT ?auto_901913 ?auto_901911 ) ( OBJ-AT ?auto_901916 ?auto_901911 ) ( not ( = ?auto_901912 ?auto_901913 ) ) ( not ( = ?auto_901912 ?auto_901914 ) ) ( not ( = ?auto_901912 ?auto_901915 ) ) ( not ( = ?auto_901912 ?auto_901916 ) ) ( not ( = ?auto_901913 ?auto_901914 ) ) ( not ( = ?auto_901913 ?auto_901915 ) ) ( not ( = ?auto_901913 ?auto_901916 ) ) ( not ( = ?auto_901914 ?auto_901916 ) ) ( not ( = ?auto_901915 ?auto_901916 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_901914 ?auto_901915 ?auto_901911 )
      ( DELIVER-5PKG-VERIFY ?auto_901912 ?auto_901913 ?auto_901914 ?auto_901915 ?auto_901916 ?auto_901911 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_902110 - OBJ
      ?auto_902111 - OBJ
      ?auto_902112 - OBJ
      ?auto_902113 - OBJ
      ?auto_902114 - OBJ
      ?auto_902109 - LOCATION
    )
    :vars
    (
      ?auto_902116 - TRUCK
      ?auto_902117 - LOCATION
      ?auto_902118 - CITY
      ?auto_902115 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_902114 ?auto_902116 ) ( TRUCK-AT ?auto_902116 ?auto_902117 ) ( IN-CITY ?auto_902117 ?auto_902118 ) ( IN-CITY ?auto_902109 ?auto_902118 ) ( not ( = ?auto_902109 ?auto_902117 ) ) ( OBJ-AT ?auto_902115 ?auto_902109 ) ( not ( = ?auto_902115 ?auto_902114 ) ) ( OBJ-AT ?auto_902110 ?auto_902109 ) ( OBJ-AT ?auto_902111 ?auto_902109 ) ( OBJ-AT ?auto_902112 ?auto_902109 ) ( OBJ-AT ?auto_902113 ?auto_902109 ) ( not ( = ?auto_902110 ?auto_902111 ) ) ( not ( = ?auto_902110 ?auto_902112 ) ) ( not ( = ?auto_902110 ?auto_902113 ) ) ( not ( = ?auto_902110 ?auto_902114 ) ) ( not ( = ?auto_902110 ?auto_902115 ) ) ( not ( = ?auto_902111 ?auto_902112 ) ) ( not ( = ?auto_902111 ?auto_902113 ) ) ( not ( = ?auto_902111 ?auto_902114 ) ) ( not ( = ?auto_902111 ?auto_902115 ) ) ( not ( = ?auto_902112 ?auto_902113 ) ) ( not ( = ?auto_902112 ?auto_902114 ) ) ( not ( = ?auto_902112 ?auto_902115 ) ) ( not ( = ?auto_902113 ?auto_902114 ) ) ( not ( = ?auto_902113 ?auto_902115 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_902115 ?auto_902114 ?auto_902109 )
      ( DELIVER-5PKG-VERIFY ?auto_902110 ?auto_902111 ?auto_902112 ?auto_902113 ?auto_902114 ?auto_902109 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_902129 - OBJ
      ?auto_902130 - OBJ
      ?auto_902131 - OBJ
      ?auto_902132 - OBJ
      ?auto_902133 - OBJ
      ?auto_902128 - LOCATION
    )
    :vars
    (
      ?auto_902135 - TRUCK
      ?auto_902136 - LOCATION
      ?auto_902137 - CITY
      ?auto_902134 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_902132 ?auto_902135 ) ( TRUCK-AT ?auto_902135 ?auto_902136 ) ( IN-CITY ?auto_902136 ?auto_902137 ) ( IN-CITY ?auto_902128 ?auto_902137 ) ( not ( = ?auto_902128 ?auto_902136 ) ) ( OBJ-AT ?auto_902134 ?auto_902128 ) ( not ( = ?auto_902134 ?auto_902132 ) ) ( OBJ-AT ?auto_902129 ?auto_902128 ) ( OBJ-AT ?auto_902130 ?auto_902128 ) ( OBJ-AT ?auto_902131 ?auto_902128 ) ( OBJ-AT ?auto_902133 ?auto_902128 ) ( not ( = ?auto_902129 ?auto_902130 ) ) ( not ( = ?auto_902129 ?auto_902131 ) ) ( not ( = ?auto_902129 ?auto_902132 ) ) ( not ( = ?auto_902129 ?auto_902133 ) ) ( not ( = ?auto_902129 ?auto_902134 ) ) ( not ( = ?auto_902130 ?auto_902131 ) ) ( not ( = ?auto_902130 ?auto_902132 ) ) ( not ( = ?auto_902130 ?auto_902133 ) ) ( not ( = ?auto_902130 ?auto_902134 ) ) ( not ( = ?auto_902131 ?auto_902132 ) ) ( not ( = ?auto_902131 ?auto_902133 ) ) ( not ( = ?auto_902131 ?auto_902134 ) ) ( not ( = ?auto_902132 ?auto_902133 ) ) ( not ( = ?auto_902133 ?auto_902134 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_902134 ?auto_902132 ?auto_902128 )
      ( DELIVER-5PKG-VERIFY ?auto_902129 ?auto_902130 ?auto_902131 ?auto_902132 ?auto_902133 ?auto_902128 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_902185 - OBJ
      ?auto_902186 - OBJ
      ?auto_902187 - OBJ
      ?auto_902188 - OBJ
      ?auto_902189 - OBJ
      ?auto_902184 - LOCATION
    )
    :vars
    (
      ?auto_902191 - TRUCK
      ?auto_902192 - LOCATION
      ?auto_902193 - CITY
      ?auto_902190 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_902187 ?auto_902191 ) ( TRUCK-AT ?auto_902191 ?auto_902192 ) ( IN-CITY ?auto_902192 ?auto_902193 ) ( IN-CITY ?auto_902184 ?auto_902193 ) ( not ( = ?auto_902184 ?auto_902192 ) ) ( OBJ-AT ?auto_902190 ?auto_902184 ) ( not ( = ?auto_902190 ?auto_902187 ) ) ( OBJ-AT ?auto_902185 ?auto_902184 ) ( OBJ-AT ?auto_902186 ?auto_902184 ) ( OBJ-AT ?auto_902188 ?auto_902184 ) ( OBJ-AT ?auto_902189 ?auto_902184 ) ( not ( = ?auto_902185 ?auto_902186 ) ) ( not ( = ?auto_902185 ?auto_902187 ) ) ( not ( = ?auto_902185 ?auto_902188 ) ) ( not ( = ?auto_902185 ?auto_902189 ) ) ( not ( = ?auto_902185 ?auto_902190 ) ) ( not ( = ?auto_902186 ?auto_902187 ) ) ( not ( = ?auto_902186 ?auto_902188 ) ) ( not ( = ?auto_902186 ?auto_902189 ) ) ( not ( = ?auto_902186 ?auto_902190 ) ) ( not ( = ?auto_902187 ?auto_902188 ) ) ( not ( = ?auto_902187 ?auto_902189 ) ) ( not ( = ?auto_902188 ?auto_902189 ) ) ( not ( = ?auto_902188 ?auto_902190 ) ) ( not ( = ?auto_902189 ?auto_902190 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_902190 ?auto_902187 ?auto_902184 )
      ( DELIVER-5PKG-VERIFY ?auto_902185 ?auto_902186 ?auto_902187 ?auto_902188 ?auto_902189 ?auto_902184 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_902351 - OBJ
      ?auto_902352 - OBJ
      ?auto_902353 - OBJ
      ?auto_902354 - OBJ
      ?auto_902355 - OBJ
      ?auto_902350 - LOCATION
    )
    :vars
    (
      ?auto_902357 - TRUCK
      ?auto_902358 - LOCATION
      ?auto_902359 - CITY
      ?auto_902356 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_902352 ?auto_902357 ) ( TRUCK-AT ?auto_902357 ?auto_902358 ) ( IN-CITY ?auto_902358 ?auto_902359 ) ( IN-CITY ?auto_902350 ?auto_902359 ) ( not ( = ?auto_902350 ?auto_902358 ) ) ( OBJ-AT ?auto_902356 ?auto_902350 ) ( not ( = ?auto_902356 ?auto_902352 ) ) ( OBJ-AT ?auto_902351 ?auto_902350 ) ( OBJ-AT ?auto_902353 ?auto_902350 ) ( OBJ-AT ?auto_902354 ?auto_902350 ) ( OBJ-AT ?auto_902355 ?auto_902350 ) ( not ( = ?auto_902351 ?auto_902352 ) ) ( not ( = ?auto_902351 ?auto_902353 ) ) ( not ( = ?auto_902351 ?auto_902354 ) ) ( not ( = ?auto_902351 ?auto_902355 ) ) ( not ( = ?auto_902351 ?auto_902356 ) ) ( not ( = ?auto_902352 ?auto_902353 ) ) ( not ( = ?auto_902352 ?auto_902354 ) ) ( not ( = ?auto_902352 ?auto_902355 ) ) ( not ( = ?auto_902353 ?auto_902354 ) ) ( not ( = ?auto_902353 ?auto_902355 ) ) ( not ( = ?auto_902353 ?auto_902356 ) ) ( not ( = ?auto_902354 ?auto_902355 ) ) ( not ( = ?auto_902354 ?auto_902356 ) ) ( not ( = ?auto_902355 ?auto_902356 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_902356 ?auto_902352 ?auto_902350 )
      ( DELIVER-5PKG-VERIFY ?auto_902351 ?auto_902352 ?auto_902353 ?auto_902354 ?auto_902355 ?auto_902350 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_902485 - OBJ
      ?auto_902486 - OBJ
      ?auto_902487 - OBJ
      ?auto_902488 - OBJ
      ?auto_902489 - OBJ
      ?auto_902484 - LOCATION
    )
    :vars
    (
      ?auto_902490 - TRUCK
      ?auto_902491 - LOCATION
      ?auto_902492 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_902485 ?auto_902490 ) ( TRUCK-AT ?auto_902490 ?auto_902491 ) ( IN-CITY ?auto_902491 ?auto_902492 ) ( IN-CITY ?auto_902484 ?auto_902492 ) ( not ( = ?auto_902484 ?auto_902491 ) ) ( OBJ-AT ?auto_902486 ?auto_902484 ) ( not ( = ?auto_902486 ?auto_902485 ) ) ( OBJ-AT ?auto_902487 ?auto_902484 ) ( OBJ-AT ?auto_902488 ?auto_902484 ) ( OBJ-AT ?auto_902489 ?auto_902484 ) ( not ( = ?auto_902485 ?auto_902487 ) ) ( not ( = ?auto_902485 ?auto_902488 ) ) ( not ( = ?auto_902485 ?auto_902489 ) ) ( not ( = ?auto_902486 ?auto_902487 ) ) ( not ( = ?auto_902486 ?auto_902488 ) ) ( not ( = ?auto_902486 ?auto_902489 ) ) ( not ( = ?auto_902487 ?auto_902488 ) ) ( not ( = ?auto_902487 ?auto_902489 ) ) ( not ( = ?auto_902488 ?auto_902489 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_902486 ?auto_902485 ?auto_902484 )
      ( DELIVER-5PKG-VERIFY ?auto_902485 ?auto_902486 ?auto_902487 ?auto_902488 ?auto_902489 ?auto_902484 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_902512 - OBJ
      ?auto_902513 - OBJ
      ?auto_902514 - OBJ
      ?auto_902515 - OBJ
      ?auto_902516 - OBJ
      ?auto_902511 - LOCATION
    )
    :vars
    (
      ?auto_902517 - TRUCK
      ?auto_902518 - LOCATION
      ?auto_902519 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_902512 ?auto_902517 ) ( TRUCK-AT ?auto_902517 ?auto_902518 ) ( IN-CITY ?auto_902518 ?auto_902519 ) ( IN-CITY ?auto_902511 ?auto_902519 ) ( not ( = ?auto_902511 ?auto_902518 ) ) ( OBJ-AT ?auto_902514 ?auto_902511 ) ( not ( = ?auto_902514 ?auto_902512 ) ) ( OBJ-AT ?auto_902513 ?auto_902511 ) ( OBJ-AT ?auto_902515 ?auto_902511 ) ( OBJ-AT ?auto_902516 ?auto_902511 ) ( not ( = ?auto_902512 ?auto_902513 ) ) ( not ( = ?auto_902512 ?auto_902515 ) ) ( not ( = ?auto_902512 ?auto_902516 ) ) ( not ( = ?auto_902513 ?auto_902514 ) ) ( not ( = ?auto_902513 ?auto_902515 ) ) ( not ( = ?auto_902513 ?auto_902516 ) ) ( not ( = ?auto_902514 ?auto_902515 ) ) ( not ( = ?auto_902514 ?auto_902516 ) ) ( not ( = ?auto_902515 ?auto_902516 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_902514 ?auto_902512 ?auto_902511 )
      ( DELIVER-5PKG-VERIFY ?auto_902512 ?auto_902513 ?auto_902514 ?auto_902515 ?auto_902516 ?auto_902511 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_902593 - OBJ
      ?auto_902594 - OBJ
      ?auto_902595 - OBJ
      ?auto_902596 - OBJ
      ?auto_902597 - OBJ
      ?auto_902592 - LOCATION
    )
    :vars
    (
      ?auto_902598 - TRUCK
      ?auto_902599 - LOCATION
      ?auto_902600 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_902593 ?auto_902598 ) ( TRUCK-AT ?auto_902598 ?auto_902599 ) ( IN-CITY ?auto_902599 ?auto_902600 ) ( IN-CITY ?auto_902592 ?auto_902600 ) ( not ( = ?auto_902592 ?auto_902599 ) ) ( OBJ-AT ?auto_902597 ?auto_902592 ) ( not ( = ?auto_902597 ?auto_902593 ) ) ( OBJ-AT ?auto_902594 ?auto_902592 ) ( OBJ-AT ?auto_902595 ?auto_902592 ) ( OBJ-AT ?auto_902596 ?auto_902592 ) ( not ( = ?auto_902593 ?auto_902594 ) ) ( not ( = ?auto_902593 ?auto_902595 ) ) ( not ( = ?auto_902593 ?auto_902596 ) ) ( not ( = ?auto_902594 ?auto_902595 ) ) ( not ( = ?auto_902594 ?auto_902596 ) ) ( not ( = ?auto_902594 ?auto_902597 ) ) ( not ( = ?auto_902595 ?auto_902596 ) ) ( not ( = ?auto_902595 ?auto_902597 ) ) ( not ( = ?auto_902596 ?auto_902597 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_902597 ?auto_902593 ?auto_902592 )
      ( DELIVER-5PKG-VERIFY ?auto_902593 ?auto_902594 ?auto_902595 ?auto_902596 ?auto_902597 ?auto_902592 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_902845 - OBJ
      ?auto_902846 - OBJ
      ?auto_902847 - OBJ
      ?auto_902848 - OBJ
      ?auto_902849 - OBJ
      ?auto_902844 - LOCATION
    )
    :vars
    (
      ?auto_902851 - TRUCK
      ?auto_902852 - LOCATION
      ?auto_902853 - CITY
      ?auto_902850 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_902845 ?auto_902851 ) ( TRUCK-AT ?auto_902851 ?auto_902852 ) ( IN-CITY ?auto_902852 ?auto_902853 ) ( IN-CITY ?auto_902844 ?auto_902853 ) ( not ( = ?auto_902844 ?auto_902852 ) ) ( OBJ-AT ?auto_902850 ?auto_902844 ) ( not ( = ?auto_902850 ?auto_902845 ) ) ( OBJ-AT ?auto_902846 ?auto_902844 ) ( OBJ-AT ?auto_902847 ?auto_902844 ) ( OBJ-AT ?auto_902848 ?auto_902844 ) ( OBJ-AT ?auto_902849 ?auto_902844 ) ( not ( = ?auto_902845 ?auto_902846 ) ) ( not ( = ?auto_902845 ?auto_902847 ) ) ( not ( = ?auto_902845 ?auto_902848 ) ) ( not ( = ?auto_902845 ?auto_902849 ) ) ( not ( = ?auto_902846 ?auto_902847 ) ) ( not ( = ?auto_902846 ?auto_902848 ) ) ( not ( = ?auto_902846 ?auto_902849 ) ) ( not ( = ?auto_902846 ?auto_902850 ) ) ( not ( = ?auto_902847 ?auto_902848 ) ) ( not ( = ?auto_902847 ?auto_902849 ) ) ( not ( = ?auto_902847 ?auto_902850 ) ) ( not ( = ?auto_902848 ?auto_902849 ) ) ( not ( = ?auto_902848 ?auto_902850 ) ) ( not ( = ?auto_902849 ?auto_902850 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_902850 ?auto_902845 ?auto_902844 )
      ( DELIVER-5PKG-VERIFY ?auto_902845 ?auto_902846 ?auto_902847 ?auto_902848 ?auto_902849 ?auto_902844 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_903261 - OBJ
      ?auto_903262 - OBJ
      ?auto_903263 - OBJ
      ?auto_903260 - LOCATION
    )
    :vars
    (
      ?auto_903266 - TRUCK
      ?auto_903265 - LOCATION
      ?auto_903264 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_903266 ?auto_903265 ) ( IN-CITY ?auto_903265 ?auto_903264 ) ( IN-CITY ?auto_903260 ?auto_903264 ) ( not ( = ?auto_903260 ?auto_903265 ) ) ( OBJ-AT ?auto_903262 ?auto_903260 ) ( not ( = ?auto_903262 ?auto_903263 ) ) ( OBJ-AT ?auto_903263 ?auto_903265 ) ( OBJ-AT ?auto_903261 ?auto_903260 ) ( not ( = ?auto_903261 ?auto_903262 ) ) ( not ( = ?auto_903261 ?auto_903263 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_903262 ?auto_903263 ?auto_903260 )
      ( DELIVER-3PKG-VERIFY ?auto_903261 ?auto_903262 ?auto_903263 ?auto_903260 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_903272 - OBJ
      ?auto_903273 - OBJ
      ?auto_903274 - OBJ
      ?auto_903271 - LOCATION
    )
    :vars
    (
      ?auto_903277 - TRUCK
      ?auto_903276 - LOCATION
      ?auto_903275 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_903277 ?auto_903276 ) ( IN-CITY ?auto_903276 ?auto_903275 ) ( IN-CITY ?auto_903271 ?auto_903275 ) ( not ( = ?auto_903271 ?auto_903276 ) ) ( OBJ-AT ?auto_903274 ?auto_903271 ) ( not ( = ?auto_903274 ?auto_903273 ) ) ( OBJ-AT ?auto_903273 ?auto_903276 ) ( OBJ-AT ?auto_903272 ?auto_903271 ) ( not ( = ?auto_903272 ?auto_903273 ) ) ( not ( = ?auto_903272 ?auto_903274 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_903274 ?auto_903273 ?auto_903271 )
      ( DELIVER-3PKG-VERIFY ?auto_903272 ?auto_903273 ?auto_903274 ?auto_903271 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_903294 - OBJ
      ?auto_903295 - OBJ
      ?auto_903296 - OBJ
      ?auto_903293 - LOCATION
    )
    :vars
    (
      ?auto_903300 - TRUCK
      ?auto_903299 - LOCATION
      ?auto_903298 - CITY
      ?auto_903297 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_903300 ?auto_903299 ) ( IN-CITY ?auto_903299 ?auto_903298 ) ( IN-CITY ?auto_903293 ?auto_903298 ) ( not ( = ?auto_903293 ?auto_903299 ) ) ( OBJ-AT ?auto_903297 ?auto_903293 ) ( not ( = ?auto_903297 ?auto_903296 ) ) ( OBJ-AT ?auto_903296 ?auto_903299 ) ( OBJ-AT ?auto_903294 ?auto_903293 ) ( OBJ-AT ?auto_903295 ?auto_903293 ) ( not ( = ?auto_903294 ?auto_903295 ) ) ( not ( = ?auto_903294 ?auto_903296 ) ) ( not ( = ?auto_903294 ?auto_903297 ) ) ( not ( = ?auto_903295 ?auto_903296 ) ) ( not ( = ?auto_903295 ?auto_903297 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_903297 ?auto_903296 ?auto_903293 )
      ( DELIVER-3PKG-VERIFY ?auto_903294 ?auto_903295 ?auto_903296 ?auto_903293 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_903306 - OBJ
      ?auto_903307 - OBJ
      ?auto_903308 - OBJ
      ?auto_903305 - LOCATION
    )
    :vars
    (
      ?auto_903312 - TRUCK
      ?auto_903311 - LOCATION
      ?auto_903310 - CITY
      ?auto_903309 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_903312 ?auto_903311 ) ( IN-CITY ?auto_903311 ?auto_903310 ) ( IN-CITY ?auto_903305 ?auto_903310 ) ( not ( = ?auto_903305 ?auto_903311 ) ) ( OBJ-AT ?auto_903309 ?auto_903305 ) ( not ( = ?auto_903309 ?auto_903307 ) ) ( OBJ-AT ?auto_903307 ?auto_903311 ) ( OBJ-AT ?auto_903306 ?auto_903305 ) ( OBJ-AT ?auto_903308 ?auto_903305 ) ( not ( = ?auto_903306 ?auto_903307 ) ) ( not ( = ?auto_903306 ?auto_903308 ) ) ( not ( = ?auto_903306 ?auto_903309 ) ) ( not ( = ?auto_903307 ?auto_903308 ) ) ( not ( = ?auto_903308 ?auto_903309 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_903309 ?auto_903307 ?auto_903305 )
      ( DELIVER-3PKG-VERIFY ?auto_903306 ?auto_903307 ?auto_903308 ?auto_903305 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_903344 - OBJ
      ?auto_903345 - OBJ
      ?auto_903346 - OBJ
      ?auto_903343 - LOCATION
    )
    :vars
    (
      ?auto_903350 - TRUCK
      ?auto_903349 - LOCATION
      ?auto_903348 - CITY
      ?auto_903347 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_903350 ?auto_903349 ) ( IN-CITY ?auto_903349 ?auto_903348 ) ( IN-CITY ?auto_903343 ?auto_903348 ) ( not ( = ?auto_903343 ?auto_903349 ) ) ( OBJ-AT ?auto_903347 ?auto_903343 ) ( not ( = ?auto_903347 ?auto_903344 ) ) ( OBJ-AT ?auto_903344 ?auto_903349 ) ( OBJ-AT ?auto_903345 ?auto_903343 ) ( OBJ-AT ?auto_903346 ?auto_903343 ) ( not ( = ?auto_903344 ?auto_903345 ) ) ( not ( = ?auto_903344 ?auto_903346 ) ) ( not ( = ?auto_903345 ?auto_903346 ) ) ( not ( = ?auto_903345 ?auto_903347 ) ) ( not ( = ?auto_903346 ?auto_903347 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_903347 ?auto_903344 ?auto_903343 )
      ( DELIVER-3PKG-VERIFY ?auto_903344 ?auto_903345 ?auto_903346 ?auto_903343 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_903383 - OBJ
      ?auto_903384 - OBJ
      ?auto_903385 - OBJ
      ?auto_903386 - OBJ
      ?auto_903382 - LOCATION
    )
    :vars
    (
      ?auto_903389 - TRUCK
      ?auto_903388 - LOCATION
      ?auto_903387 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_903389 ?auto_903388 ) ( IN-CITY ?auto_903388 ?auto_903387 ) ( IN-CITY ?auto_903382 ?auto_903387 ) ( not ( = ?auto_903382 ?auto_903388 ) ) ( OBJ-AT ?auto_903385 ?auto_903382 ) ( not ( = ?auto_903385 ?auto_903386 ) ) ( OBJ-AT ?auto_903386 ?auto_903388 ) ( OBJ-AT ?auto_903383 ?auto_903382 ) ( OBJ-AT ?auto_903384 ?auto_903382 ) ( not ( = ?auto_903383 ?auto_903384 ) ) ( not ( = ?auto_903383 ?auto_903385 ) ) ( not ( = ?auto_903383 ?auto_903386 ) ) ( not ( = ?auto_903384 ?auto_903385 ) ) ( not ( = ?auto_903384 ?auto_903386 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_903385 ?auto_903386 ?auto_903382 )
      ( DELIVER-4PKG-VERIFY ?auto_903383 ?auto_903384 ?auto_903385 ?auto_903386 ?auto_903382 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_903391 - OBJ
      ?auto_903392 - OBJ
      ?auto_903393 - OBJ
      ?auto_903394 - OBJ
      ?auto_903390 - LOCATION
    )
    :vars
    (
      ?auto_903397 - TRUCK
      ?auto_903396 - LOCATION
      ?auto_903395 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_903397 ?auto_903396 ) ( IN-CITY ?auto_903396 ?auto_903395 ) ( IN-CITY ?auto_903390 ?auto_903395 ) ( not ( = ?auto_903390 ?auto_903396 ) ) ( OBJ-AT ?auto_903391 ?auto_903390 ) ( not ( = ?auto_903391 ?auto_903394 ) ) ( OBJ-AT ?auto_903394 ?auto_903396 ) ( OBJ-AT ?auto_903392 ?auto_903390 ) ( OBJ-AT ?auto_903393 ?auto_903390 ) ( not ( = ?auto_903391 ?auto_903392 ) ) ( not ( = ?auto_903391 ?auto_903393 ) ) ( not ( = ?auto_903392 ?auto_903393 ) ) ( not ( = ?auto_903392 ?auto_903394 ) ) ( not ( = ?auto_903393 ?auto_903394 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_903391 ?auto_903394 ?auto_903390 )
      ( DELIVER-4PKG-VERIFY ?auto_903391 ?auto_903392 ?auto_903393 ?auto_903394 ?auto_903390 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_903407 - OBJ
      ?auto_903408 - OBJ
      ?auto_903409 - OBJ
      ?auto_903410 - OBJ
      ?auto_903406 - LOCATION
    )
    :vars
    (
      ?auto_903413 - TRUCK
      ?auto_903412 - LOCATION
      ?auto_903411 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_903413 ?auto_903412 ) ( IN-CITY ?auto_903412 ?auto_903411 ) ( IN-CITY ?auto_903406 ?auto_903411 ) ( not ( = ?auto_903406 ?auto_903412 ) ) ( OBJ-AT ?auto_903407 ?auto_903406 ) ( not ( = ?auto_903407 ?auto_903409 ) ) ( OBJ-AT ?auto_903409 ?auto_903412 ) ( OBJ-AT ?auto_903408 ?auto_903406 ) ( OBJ-AT ?auto_903410 ?auto_903406 ) ( not ( = ?auto_903407 ?auto_903408 ) ) ( not ( = ?auto_903407 ?auto_903410 ) ) ( not ( = ?auto_903408 ?auto_903409 ) ) ( not ( = ?auto_903408 ?auto_903410 ) ) ( not ( = ?auto_903409 ?auto_903410 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_903407 ?auto_903409 ?auto_903406 )
      ( DELIVER-4PKG-VERIFY ?auto_903407 ?auto_903408 ?auto_903409 ?auto_903410 ?auto_903406 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_903463 - OBJ
      ?auto_903464 - OBJ
      ?auto_903465 - OBJ
      ?auto_903466 - OBJ
      ?auto_903462 - LOCATION
    )
    :vars
    (
      ?auto_903469 - TRUCK
      ?auto_903468 - LOCATION
      ?auto_903467 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_903469 ?auto_903468 ) ( IN-CITY ?auto_903468 ?auto_903467 ) ( IN-CITY ?auto_903462 ?auto_903467 ) ( not ( = ?auto_903462 ?auto_903468 ) ) ( OBJ-AT ?auto_903465 ?auto_903462 ) ( not ( = ?auto_903465 ?auto_903464 ) ) ( OBJ-AT ?auto_903464 ?auto_903468 ) ( OBJ-AT ?auto_903463 ?auto_903462 ) ( OBJ-AT ?auto_903466 ?auto_903462 ) ( not ( = ?auto_903463 ?auto_903464 ) ) ( not ( = ?auto_903463 ?auto_903465 ) ) ( not ( = ?auto_903463 ?auto_903466 ) ) ( not ( = ?auto_903464 ?auto_903466 ) ) ( not ( = ?auto_903465 ?auto_903466 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_903465 ?auto_903464 ?auto_903462 )
      ( DELIVER-4PKG-VERIFY ?auto_903463 ?auto_903464 ?auto_903465 ?auto_903466 ?auto_903462 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_903487 - OBJ
      ?auto_903488 - OBJ
      ?auto_903489 - OBJ
      ?auto_903490 - OBJ
      ?auto_903486 - LOCATION
    )
    :vars
    (
      ?auto_903493 - TRUCK
      ?auto_903492 - LOCATION
      ?auto_903491 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_903493 ?auto_903492 ) ( IN-CITY ?auto_903492 ?auto_903491 ) ( IN-CITY ?auto_903486 ?auto_903491 ) ( not ( = ?auto_903486 ?auto_903492 ) ) ( OBJ-AT ?auto_903487 ?auto_903486 ) ( not ( = ?auto_903487 ?auto_903488 ) ) ( OBJ-AT ?auto_903488 ?auto_903492 ) ( OBJ-AT ?auto_903489 ?auto_903486 ) ( OBJ-AT ?auto_903490 ?auto_903486 ) ( not ( = ?auto_903487 ?auto_903489 ) ) ( not ( = ?auto_903487 ?auto_903490 ) ) ( not ( = ?auto_903488 ?auto_903489 ) ) ( not ( = ?auto_903488 ?auto_903490 ) ) ( not ( = ?auto_903489 ?auto_903490 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_903487 ?auto_903488 ?auto_903486 )
      ( DELIVER-4PKG-VERIFY ?auto_903487 ?auto_903488 ?auto_903489 ?auto_903490 ?auto_903486 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_903551 - OBJ
      ?auto_903552 - OBJ
      ?auto_903553 - OBJ
      ?auto_903554 - OBJ
      ?auto_903550 - LOCATION
    )
    :vars
    (
      ?auto_903557 - TRUCK
      ?auto_903556 - LOCATION
      ?auto_903555 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_903557 ?auto_903556 ) ( IN-CITY ?auto_903556 ?auto_903555 ) ( IN-CITY ?auto_903550 ?auto_903555 ) ( not ( = ?auto_903550 ?auto_903556 ) ) ( OBJ-AT ?auto_903552 ?auto_903550 ) ( not ( = ?auto_903552 ?auto_903553 ) ) ( OBJ-AT ?auto_903553 ?auto_903556 ) ( OBJ-AT ?auto_903551 ?auto_903550 ) ( OBJ-AT ?auto_903554 ?auto_903550 ) ( not ( = ?auto_903551 ?auto_903552 ) ) ( not ( = ?auto_903551 ?auto_903553 ) ) ( not ( = ?auto_903551 ?auto_903554 ) ) ( not ( = ?auto_903552 ?auto_903554 ) ) ( not ( = ?auto_903553 ?auto_903554 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_903552 ?auto_903553 ?auto_903550 )
      ( DELIVER-4PKG-VERIFY ?auto_903551 ?auto_903552 ?auto_903553 ?auto_903554 ?auto_903550 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_903583 - OBJ
      ?auto_903584 - OBJ
      ?auto_903585 - OBJ
      ?auto_903586 - OBJ
      ?auto_903582 - LOCATION
    )
    :vars
    (
      ?auto_903590 - TRUCK
      ?auto_903589 - LOCATION
      ?auto_903588 - CITY
      ?auto_903587 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_903590 ?auto_903589 ) ( IN-CITY ?auto_903589 ?auto_903588 ) ( IN-CITY ?auto_903582 ?auto_903588 ) ( not ( = ?auto_903582 ?auto_903589 ) ) ( OBJ-AT ?auto_903587 ?auto_903582 ) ( not ( = ?auto_903587 ?auto_903586 ) ) ( OBJ-AT ?auto_903586 ?auto_903589 ) ( OBJ-AT ?auto_903583 ?auto_903582 ) ( OBJ-AT ?auto_903584 ?auto_903582 ) ( OBJ-AT ?auto_903585 ?auto_903582 ) ( not ( = ?auto_903583 ?auto_903584 ) ) ( not ( = ?auto_903583 ?auto_903585 ) ) ( not ( = ?auto_903583 ?auto_903586 ) ) ( not ( = ?auto_903583 ?auto_903587 ) ) ( not ( = ?auto_903584 ?auto_903585 ) ) ( not ( = ?auto_903584 ?auto_903586 ) ) ( not ( = ?auto_903584 ?auto_903587 ) ) ( not ( = ?auto_903585 ?auto_903586 ) ) ( not ( = ?auto_903585 ?auto_903587 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_903587 ?auto_903586 ?auto_903582 )
      ( DELIVER-4PKG-VERIFY ?auto_903583 ?auto_903584 ?auto_903585 ?auto_903586 ?auto_903582 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_903600 - OBJ
      ?auto_903601 - OBJ
      ?auto_903602 - OBJ
      ?auto_903603 - OBJ
      ?auto_903599 - LOCATION
    )
    :vars
    (
      ?auto_903607 - TRUCK
      ?auto_903606 - LOCATION
      ?auto_903605 - CITY
      ?auto_903604 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_903607 ?auto_903606 ) ( IN-CITY ?auto_903606 ?auto_903605 ) ( IN-CITY ?auto_903599 ?auto_903605 ) ( not ( = ?auto_903599 ?auto_903606 ) ) ( OBJ-AT ?auto_903604 ?auto_903599 ) ( not ( = ?auto_903604 ?auto_903602 ) ) ( OBJ-AT ?auto_903602 ?auto_903606 ) ( OBJ-AT ?auto_903600 ?auto_903599 ) ( OBJ-AT ?auto_903601 ?auto_903599 ) ( OBJ-AT ?auto_903603 ?auto_903599 ) ( not ( = ?auto_903600 ?auto_903601 ) ) ( not ( = ?auto_903600 ?auto_903602 ) ) ( not ( = ?auto_903600 ?auto_903603 ) ) ( not ( = ?auto_903600 ?auto_903604 ) ) ( not ( = ?auto_903601 ?auto_903602 ) ) ( not ( = ?auto_903601 ?auto_903603 ) ) ( not ( = ?auto_903601 ?auto_903604 ) ) ( not ( = ?auto_903602 ?auto_903603 ) ) ( not ( = ?auto_903603 ?auto_903604 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_903604 ?auto_903602 ?auto_903599 )
      ( DELIVER-4PKG-VERIFY ?auto_903600 ?auto_903601 ?auto_903602 ?auto_903603 ?auto_903599 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_903650 - OBJ
      ?auto_903651 - OBJ
      ?auto_903652 - OBJ
      ?auto_903653 - OBJ
      ?auto_903649 - LOCATION
    )
    :vars
    (
      ?auto_903657 - TRUCK
      ?auto_903656 - LOCATION
      ?auto_903655 - CITY
      ?auto_903654 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_903657 ?auto_903656 ) ( IN-CITY ?auto_903656 ?auto_903655 ) ( IN-CITY ?auto_903649 ?auto_903655 ) ( not ( = ?auto_903649 ?auto_903656 ) ) ( OBJ-AT ?auto_903654 ?auto_903649 ) ( not ( = ?auto_903654 ?auto_903651 ) ) ( OBJ-AT ?auto_903651 ?auto_903656 ) ( OBJ-AT ?auto_903650 ?auto_903649 ) ( OBJ-AT ?auto_903652 ?auto_903649 ) ( OBJ-AT ?auto_903653 ?auto_903649 ) ( not ( = ?auto_903650 ?auto_903651 ) ) ( not ( = ?auto_903650 ?auto_903652 ) ) ( not ( = ?auto_903650 ?auto_903653 ) ) ( not ( = ?auto_903650 ?auto_903654 ) ) ( not ( = ?auto_903651 ?auto_903652 ) ) ( not ( = ?auto_903651 ?auto_903653 ) ) ( not ( = ?auto_903652 ?auto_903653 ) ) ( not ( = ?auto_903652 ?auto_903654 ) ) ( not ( = ?auto_903653 ?auto_903654 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_903654 ?auto_903651 ?auto_903649 )
      ( DELIVER-4PKG-VERIFY ?auto_903650 ?auto_903651 ?auto_903652 ?auto_903653 ?auto_903649 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_903694 - OBJ
      ?auto_903695 - OBJ
      ?auto_903696 - OBJ
      ?auto_903697 - OBJ
      ?auto_903693 - LOCATION
    )
    :vars
    (
      ?auto_903700 - TRUCK
      ?auto_903699 - LOCATION
      ?auto_903698 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_903700 ?auto_903699 ) ( IN-CITY ?auto_903699 ?auto_903698 ) ( IN-CITY ?auto_903693 ?auto_903698 ) ( not ( = ?auto_903693 ?auto_903699 ) ) ( OBJ-AT ?auto_903696 ?auto_903693 ) ( not ( = ?auto_903696 ?auto_903694 ) ) ( OBJ-AT ?auto_903694 ?auto_903699 ) ( OBJ-AT ?auto_903695 ?auto_903693 ) ( OBJ-AT ?auto_903697 ?auto_903693 ) ( not ( = ?auto_903694 ?auto_903695 ) ) ( not ( = ?auto_903694 ?auto_903697 ) ) ( not ( = ?auto_903695 ?auto_903696 ) ) ( not ( = ?auto_903695 ?auto_903697 ) ) ( not ( = ?auto_903696 ?auto_903697 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_903696 ?auto_903694 ?auto_903693 )
      ( DELIVER-4PKG-VERIFY ?auto_903694 ?auto_903695 ?auto_903696 ?auto_903697 ?auto_903693 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_903718 - OBJ
      ?auto_903719 - OBJ
      ?auto_903720 - OBJ
      ?auto_903721 - OBJ
      ?auto_903717 - LOCATION
    )
    :vars
    (
      ?auto_903724 - TRUCK
      ?auto_903723 - LOCATION
      ?auto_903722 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_903724 ?auto_903723 ) ( IN-CITY ?auto_903723 ?auto_903722 ) ( IN-CITY ?auto_903717 ?auto_903722 ) ( not ( = ?auto_903717 ?auto_903723 ) ) ( OBJ-AT ?auto_903719 ?auto_903717 ) ( not ( = ?auto_903719 ?auto_903718 ) ) ( OBJ-AT ?auto_903718 ?auto_903723 ) ( OBJ-AT ?auto_903720 ?auto_903717 ) ( OBJ-AT ?auto_903721 ?auto_903717 ) ( not ( = ?auto_903718 ?auto_903720 ) ) ( not ( = ?auto_903718 ?auto_903721 ) ) ( not ( = ?auto_903719 ?auto_903720 ) ) ( not ( = ?auto_903719 ?auto_903721 ) ) ( not ( = ?auto_903720 ?auto_903721 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_903719 ?auto_903718 ?auto_903717 )
      ( DELIVER-4PKG-VERIFY ?auto_903718 ?auto_903719 ?auto_903720 ?auto_903721 ?auto_903717 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_903798 - OBJ
      ?auto_903799 - OBJ
      ?auto_903800 - OBJ
      ?auto_903801 - OBJ
      ?auto_903797 - LOCATION
    )
    :vars
    (
      ?auto_903805 - TRUCK
      ?auto_903804 - LOCATION
      ?auto_903803 - CITY
      ?auto_903802 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_903805 ?auto_903804 ) ( IN-CITY ?auto_903804 ?auto_903803 ) ( IN-CITY ?auto_903797 ?auto_903803 ) ( not ( = ?auto_903797 ?auto_903804 ) ) ( OBJ-AT ?auto_903802 ?auto_903797 ) ( not ( = ?auto_903802 ?auto_903798 ) ) ( OBJ-AT ?auto_903798 ?auto_903804 ) ( OBJ-AT ?auto_903799 ?auto_903797 ) ( OBJ-AT ?auto_903800 ?auto_903797 ) ( OBJ-AT ?auto_903801 ?auto_903797 ) ( not ( = ?auto_903798 ?auto_903799 ) ) ( not ( = ?auto_903798 ?auto_903800 ) ) ( not ( = ?auto_903798 ?auto_903801 ) ) ( not ( = ?auto_903799 ?auto_903800 ) ) ( not ( = ?auto_903799 ?auto_903801 ) ) ( not ( = ?auto_903799 ?auto_903802 ) ) ( not ( = ?auto_903800 ?auto_903801 ) ) ( not ( = ?auto_903800 ?auto_903802 ) ) ( not ( = ?auto_903801 ?auto_903802 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_903802 ?auto_903798 ?auto_903797 )
      ( DELIVER-4PKG-VERIFY ?auto_903798 ?auto_903799 ?auto_903800 ?auto_903801 ?auto_903797 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_903918 - OBJ
      ?auto_903919 - OBJ
      ?auto_903920 - OBJ
      ?auto_903921 - OBJ
      ?auto_903922 - OBJ
      ?auto_903917 - LOCATION
    )
    :vars
    (
      ?auto_903925 - TRUCK
      ?auto_903924 - LOCATION
      ?auto_903923 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_903925 ?auto_903924 ) ( IN-CITY ?auto_903924 ?auto_903923 ) ( IN-CITY ?auto_903917 ?auto_903923 ) ( not ( = ?auto_903917 ?auto_903924 ) ) ( OBJ-AT ?auto_903921 ?auto_903917 ) ( not ( = ?auto_903921 ?auto_903922 ) ) ( OBJ-AT ?auto_903922 ?auto_903924 ) ( OBJ-AT ?auto_903918 ?auto_903917 ) ( OBJ-AT ?auto_903919 ?auto_903917 ) ( OBJ-AT ?auto_903920 ?auto_903917 ) ( not ( = ?auto_903918 ?auto_903919 ) ) ( not ( = ?auto_903918 ?auto_903920 ) ) ( not ( = ?auto_903918 ?auto_903921 ) ) ( not ( = ?auto_903918 ?auto_903922 ) ) ( not ( = ?auto_903919 ?auto_903920 ) ) ( not ( = ?auto_903919 ?auto_903921 ) ) ( not ( = ?auto_903919 ?auto_903922 ) ) ( not ( = ?auto_903920 ?auto_903921 ) ) ( not ( = ?auto_903920 ?auto_903922 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_903921 ?auto_903922 ?auto_903917 )
      ( DELIVER-5PKG-VERIFY ?auto_903918 ?auto_903919 ?auto_903920 ?auto_903921 ?auto_903922 ?auto_903917 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_903963 - OBJ
      ?auto_903964 - OBJ
      ?auto_903965 - OBJ
      ?auto_903966 - OBJ
      ?auto_903967 - OBJ
      ?auto_903962 - LOCATION
    )
    :vars
    (
      ?auto_903970 - TRUCK
      ?auto_903969 - LOCATION
      ?auto_903968 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_903970 ?auto_903969 ) ( IN-CITY ?auto_903969 ?auto_903968 ) ( IN-CITY ?auto_903962 ?auto_903968 ) ( not ( = ?auto_903962 ?auto_903969 ) ) ( OBJ-AT ?auto_903963 ?auto_903962 ) ( not ( = ?auto_903963 ?auto_903967 ) ) ( OBJ-AT ?auto_903967 ?auto_903969 ) ( OBJ-AT ?auto_903964 ?auto_903962 ) ( OBJ-AT ?auto_903965 ?auto_903962 ) ( OBJ-AT ?auto_903966 ?auto_903962 ) ( not ( = ?auto_903963 ?auto_903964 ) ) ( not ( = ?auto_903963 ?auto_903965 ) ) ( not ( = ?auto_903963 ?auto_903966 ) ) ( not ( = ?auto_903964 ?auto_903965 ) ) ( not ( = ?auto_903964 ?auto_903966 ) ) ( not ( = ?auto_903964 ?auto_903967 ) ) ( not ( = ?auto_903965 ?auto_903966 ) ) ( not ( = ?auto_903965 ?auto_903967 ) ) ( not ( = ?auto_903966 ?auto_903967 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_903963 ?auto_903967 ?auto_903962 )
      ( DELIVER-5PKG-VERIFY ?auto_903963 ?auto_903964 ?auto_903965 ?auto_903966 ?auto_903967 ?auto_903962 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_904035 - OBJ
      ?auto_904036 - OBJ
      ?auto_904037 - OBJ
      ?auto_904038 - OBJ
      ?auto_904039 - OBJ
      ?auto_904034 - LOCATION
    )
    :vars
    (
      ?auto_904042 - TRUCK
      ?auto_904041 - LOCATION
      ?auto_904040 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_904042 ?auto_904041 ) ( IN-CITY ?auto_904041 ?auto_904040 ) ( IN-CITY ?auto_904034 ?auto_904040 ) ( not ( = ?auto_904034 ?auto_904041 ) ) ( OBJ-AT ?auto_904039 ?auto_904034 ) ( not ( = ?auto_904039 ?auto_904037 ) ) ( OBJ-AT ?auto_904037 ?auto_904041 ) ( OBJ-AT ?auto_904035 ?auto_904034 ) ( OBJ-AT ?auto_904036 ?auto_904034 ) ( OBJ-AT ?auto_904038 ?auto_904034 ) ( not ( = ?auto_904035 ?auto_904036 ) ) ( not ( = ?auto_904035 ?auto_904037 ) ) ( not ( = ?auto_904035 ?auto_904038 ) ) ( not ( = ?auto_904035 ?auto_904039 ) ) ( not ( = ?auto_904036 ?auto_904037 ) ) ( not ( = ?auto_904036 ?auto_904038 ) ) ( not ( = ?auto_904036 ?auto_904039 ) ) ( not ( = ?auto_904037 ?auto_904038 ) ) ( not ( = ?auto_904038 ?auto_904039 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_904039 ?auto_904037 ?auto_904034 )
      ( DELIVER-5PKG-VERIFY ?auto_904035 ?auto_904036 ?auto_904037 ?auto_904038 ?auto_904039 ?auto_904034 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_904044 - OBJ
      ?auto_904045 - OBJ
      ?auto_904046 - OBJ
      ?auto_904047 - OBJ
      ?auto_904048 - OBJ
      ?auto_904043 - LOCATION
    )
    :vars
    (
      ?auto_904051 - TRUCK
      ?auto_904050 - LOCATION
      ?auto_904049 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_904051 ?auto_904050 ) ( IN-CITY ?auto_904050 ?auto_904049 ) ( IN-CITY ?auto_904043 ?auto_904049 ) ( not ( = ?auto_904043 ?auto_904050 ) ) ( OBJ-AT ?auto_904044 ?auto_904043 ) ( not ( = ?auto_904044 ?auto_904046 ) ) ( OBJ-AT ?auto_904046 ?auto_904050 ) ( OBJ-AT ?auto_904045 ?auto_904043 ) ( OBJ-AT ?auto_904047 ?auto_904043 ) ( OBJ-AT ?auto_904048 ?auto_904043 ) ( not ( = ?auto_904044 ?auto_904045 ) ) ( not ( = ?auto_904044 ?auto_904047 ) ) ( not ( = ?auto_904044 ?auto_904048 ) ) ( not ( = ?auto_904045 ?auto_904046 ) ) ( not ( = ?auto_904045 ?auto_904047 ) ) ( not ( = ?auto_904045 ?auto_904048 ) ) ( not ( = ?auto_904046 ?auto_904047 ) ) ( not ( = ?auto_904046 ?auto_904048 ) ) ( not ( = ?auto_904047 ?auto_904048 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_904044 ?auto_904046 ?auto_904043 )
      ( DELIVER-5PKG-VERIFY ?auto_904044 ?auto_904045 ?auto_904046 ?auto_904047 ?auto_904048 ?auto_904043 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_904107 - OBJ
      ?auto_904108 - OBJ
      ?auto_904109 - OBJ
      ?auto_904110 - OBJ
      ?auto_904111 - OBJ
      ?auto_904106 - LOCATION
    )
    :vars
    (
      ?auto_904114 - TRUCK
      ?auto_904113 - LOCATION
      ?auto_904112 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_904114 ?auto_904113 ) ( IN-CITY ?auto_904113 ?auto_904112 ) ( IN-CITY ?auto_904106 ?auto_904112 ) ( not ( = ?auto_904106 ?auto_904113 ) ) ( OBJ-AT ?auto_904111 ?auto_904106 ) ( not ( = ?auto_904111 ?auto_904110 ) ) ( OBJ-AT ?auto_904110 ?auto_904113 ) ( OBJ-AT ?auto_904107 ?auto_904106 ) ( OBJ-AT ?auto_904108 ?auto_904106 ) ( OBJ-AT ?auto_904109 ?auto_904106 ) ( not ( = ?auto_904107 ?auto_904108 ) ) ( not ( = ?auto_904107 ?auto_904109 ) ) ( not ( = ?auto_904107 ?auto_904110 ) ) ( not ( = ?auto_904107 ?auto_904111 ) ) ( not ( = ?auto_904108 ?auto_904109 ) ) ( not ( = ?auto_904108 ?auto_904110 ) ) ( not ( = ?auto_904108 ?auto_904111 ) ) ( not ( = ?auto_904109 ?auto_904110 ) ) ( not ( = ?auto_904109 ?auto_904111 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_904111 ?auto_904110 ?auto_904106 )
      ( DELIVER-5PKG-VERIFY ?auto_904107 ?auto_904108 ?auto_904109 ?auto_904110 ?auto_904111 ?auto_904106 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_904116 - OBJ
      ?auto_904117 - OBJ
      ?auto_904118 - OBJ
      ?auto_904119 - OBJ
      ?auto_904120 - OBJ
      ?auto_904115 - LOCATION
    )
    :vars
    (
      ?auto_904123 - TRUCK
      ?auto_904122 - LOCATION
      ?auto_904121 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_904123 ?auto_904122 ) ( IN-CITY ?auto_904122 ?auto_904121 ) ( IN-CITY ?auto_904115 ?auto_904121 ) ( not ( = ?auto_904115 ?auto_904122 ) ) ( OBJ-AT ?auto_904118 ?auto_904115 ) ( not ( = ?auto_904118 ?auto_904119 ) ) ( OBJ-AT ?auto_904119 ?auto_904122 ) ( OBJ-AT ?auto_904116 ?auto_904115 ) ( OBJ-AT ?auto_904117 ?auto_904115 ) ( OBJ-AT ?auto_904120 ?auto_904115 ) ( not ( = ?auto_904116 ?auto_904117 ) ) ( not ( = ?auto_904116 ?auto_904118 ) ) ( not ( = ?auto_904116 ?auto_904119 ) ) ( not ( = ?auto_904116 ?auto_904120 ) ) ( not ( = ?auto_904117 ?auto_904118 ) ) ( not ( = ?auto_904117 ?auto_904119 ) ) ( not ( = ?auto_904117 ?auto_904120 ) ) ( not ( = ?auto_904118 ?auto_904120 ) ) ( not ( = ?auto_904119 ?auto_904120 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_904118 ?auto_904119 ?auto_904115 )
      ( DELIVER-5PKG-VERIFY ?auto_904116 ?auto_904117 ?auto_904118 ?auto_904119 ?auto_904120 ?auto_904115 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_904179 - OBJ
      ?auto_904180 - OBJ
      ?auto_904181 - OBJ
      ?auto_904182 - OBJ
      ?auto_904183 - OBJ
      ?auto_904178 - LOCATION
    )
    :vars
    (
      ?auto_904186 - TRUCK
      ?auto_904185 - LOCATION
      ?auto_904184 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_904186 ?auto_904185 ) ( IN-CITY ?auto_904185 ?auto_904184 ) ( IN-CITY ?auto_904178 ?auto_904184 ) ( not ( = ?auto_904178 ?auto_904185 ) ) ( OBJ-AT ?auto_904182 ?auto_904178 ) ( not ( = ?auto_904182 ?auto_904181 ) ) ( OBJ-AT ?auto_904181 ?auto_904185 ) ( OBJ-AT ?auto_904179 ?auto_904178 ) ( OBJ-AT ?auto_904180 ?auto_904178 ) ( OBJ-AT ?auto_904183 ?auto_904178 ) ( not ( = ?auto_904179 ?auto_904180 ) ) ( not ( = ?auto_904179 ?auto_904181 ) ) ( not ( = ?auto_904179 ?auto_904182 ) ) ( not ( = ?auto_904179 ?auto_904183 ) ) ( not ( = ?auto_904180 ?auto_904181 ) ) ( not ( = ?auto_904180 ?auto_904182 ) ) ( not ( = ?auto_904180 ?auto_904183 ) ) ( not ( = ?auto_904181 ?auto_904183 ) ) ( not ( = ?auto_904182 ?auto_904183 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_904182 ?auto_904181 ?auto_904178 )
      ( DELIVER-5PKG-VERIFY ?auto_904179 ?auto_904180 ?auto_904181 ?auto_904182 ?auto_904183 ?auto_904178 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_904341 - OBJ
      ?auto_904342 - OBJ
      ?auto_904343 - OBJ
      ?auto_904344 - OBJ
      ?auto_904345 - OBJ
      ?auto_904340 - LOCATION
    )
    :vars
    (
      ?auto_904348 - TRUCK
      ?auto_904347 - LOCATION
      ?auto_904346 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_904348 ?auto_904347 ) ( IN-CITY ?auto_904347 ?auto_904346 ) ( IN-CITY ?auto_904340 ?auto_904346 ) ( not ( = ?auto_904340 ?auto_904347 ) ) ( OBJ-AT ?auto_904345 ?auto_904340 ) ( not ( = ?auto_904345 ?auto_904342 ) ) ( OBJ-AT ?auto_904342 ?auto_904347 ) ( OBJ-AT ?auto_904341 ?auto_904340 ) ( OBJ-AT ?auto_904343 ?auto_904340 ) ( OBJ-AT ?auto_904344 ?auto_904340 ) ( not ( = ?auto_904341 ?auto_904342 ) ) ( not ( = ?auto_904341 ?auto_904343 ) ) ( not ( = ?auto_904341 ?auto_904344 ) ) ( not ( = ?auto_904341 ?auto_904345 ) ) ( not ( = ?auto_904342 ?auto_904343 ) ) ( not ( = ?auto_904342 ?auto_904344 ) ) ( not ( = ?auto_904343 ?auto_904344 ) ) ( not ( = ?auto_904343 ?auto_904345 ) ) ( not ( = ?auto_904344 ?auto_904345 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_904345 ?auto_904342 ?auto_904340 )
      ( DELIVER-5PKG-VERIFY ?auto_904341 ?auto_904342 ?auto_904343 ?auto_904344 ?auto_904345 ?auto_904340 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_904521 - OBJ
      ?auto_904522 - OBJ
      ?auto_904523 - OBJ
      ?auto_904524 - OBJ
      ?auto_904525 - OBJ
      ?auto_904520 - LOCATION
    )
    :vars
    (
      ?auto_904528 - TRUCK
      ?auto_904527 - LOCATION
      ?auto_904526 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_904528 ?auto_904527 ) ( IN-CITY ?auto_904527 ?auto_904526 ) ( IN-CITY ?auto_904520 ?auto_904526 ) ( not ( = ?auto_904520 ?auto_904527 ) ) ( OBJ-AT ?auto_904522 ?auto_904520 ) ( not ( = ?auto_904522 ?auto_904524 ) ) ( OBJ-AT ?auto_904524 ?auto_904527 ) ( OBJ-AT ?auto_904521 ?auto_904520 ) ( OBJ-AT ?auto_904523 ?auto_904520 ) ( OBJ-AT ?auto_904525 ?auto_904520 ) ( not ( = ?auto_904521 ?auto_904522 ) ) ( not ( = ?auto_904521 ?auto_904523 ) ) ( not ( = ?auto_904521 ?auto_904524 ) ) ( not ( = ?auto_904521 ?auto_904525 ) ) ( not ( = ?auto_904522 ?auto_904523 ) ) ( not ( = ?auto_904522 ?auto_904525 ) ) ( not ( = ?auto_904523 ?auto_904524 ) ) ( not ( = ?auto_904523 ?auto_904525 ) ) ( not ( = ?auto_904524 ?auto_904525 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_904522 ?auto_904524 ?auto_904520 )
      ( DELIVER-5PKG-VERIFY ?auto_904521 ?auto_904522 ?auto_904523 ?auto_904524 ?auto_904525 ?auto_904520 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_904548 - OBJ
      ?auto_904549 - OBJ
      ?auto_904550 - OBJ
      ?auto_904551 - OBJ
      ?auto_904552 - OBJ
      ?auto_904547 - LOCATION
    )
    :vars
    (
      ?auto_904555 - TRUCK
      ?auto_904554 - LOCATION
      ?auto_904553 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_904555 ?auto_904554 ) ( IN-CITY ?auto_904554 ?auto_904553 ) ( IN-CITY ?auto_904547 ?auto_904553 ) ( not ( = ?auto_904547 ?auto_904554 ) ) ( OBJ-AT ?auto_904549 ?auto_904547 ) ( not ( = ?auto_904549 ?auto_904552 ) ) ( OBJ-AT ?auto_904552 ?auto_904554 ) ( OBJ-AT ?auto_904548 ?auto_904547 ) ( OBJ-AT ?auto_904550 ?auto_904547 ) ( OBJ-AT ?auto_904551 ?auto_904547 ) ( not ( = ?auto_904548 ?auto_904549 ) ) ( not ( = ?auto_904548 ?auto_904550 ) ) ( not ( = ?auto_904548 ?auto_904551 ) ) ( not ( = ?auto_904548 ?auto_904552 ) ) ( not ( = ?auto_904549 ?auto_904550 ) ) ( not ( = ?auto_904549 ?auto_904551 ) ) ( not ( = ?auto_904550 ?auto_904551 ) ) ( not ( = ?auto_904550 ?auto_904552 ) ) ( not ( = ?auto_904551 ?auto_904552 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_904549 ?auto_904552 ?auto_904547 )
      ( DELIVER-5PKG-VERIFY ?auto_904548 ?auto_904549 ?auto_904550 ?auto_904551 ?auto_904552 ?auto_904547 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_904728 - OBJ
      ?auto_904729 - OBJ
      ?auto_904730 - OBJ
      ?auto_904731 - OBJ
      ?auto_904732 - OBJ
      ?auto_904727 - LOCATION
    )
    :vars
    (
      ?auto_904736 - TRUCK
      ?auto_904735 - LOCATION
      ?auto_904734 - CITY
      ?auto_904733 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_904736 ?auto_904735 ) ( IN-CITY ?auto_904735 ?auto_904734 ) ( IN-CITY ?auto_904727 ?auto_904734 ) ( not ( = ?auto_904727 ?auto_904735 ) ) ( OBJ-AT ?auto_904733 ?auto_904727 ) ( not ( = ?auto_904733 ?auto_904732 ) ) ( OBJ-AT ?auto_904732 ?auto_904735 ) ( OBJ-AT ?auto_904728 ?auto_904727 ) ( OBJ-AT ?auto_904729 ?auto_904727 ) ( OBJ-AT ?auto_904730 ?auto_904727 ) ( OBJ-AT ?auto_904731 ?auto_904727 ) ( not ( = ?auto_904728 ?auto_904729 ) ) ( not ( = ?auto_904728 ?auto_904730 ) ) ( not ( = ?auto_904728 ?auto_904731 ) ) ( not ( = ?auto_904728 ?auto_904732 ) ) ( not ( = ?auto_904728 ?auto_904733 ) ) ( not ( = ?auto_904729 ?auto_904730 ) ) ( not ( = ?auto_904729 ?auto_904731 ) ) ( not ( = ?auto_904729 ?auto_904732 ) ) ( not ( = ?auto_904729 ?auto_904733 ) ) ( not ( = ?auto_904730 ?auto_904731 ) ) ( not ( = ?auto_904730 ?auto_904732 ) ) ( not ( = ?auto_904730 ?auto_904733 ) ) ( not ( = ?auto_904731 ?auto_904732 ) ) ( not ( = ?auto_904731 ?auto_904733 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_904733 ?auto_904732 ?auto_904727 )
      ( DELIVER-5PKG-VERIFY ?auto_904728 ?auto_904729 ?auto_904730 ?auto_904731 ?auto_904732 ?auto_904727 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_904747 - OBJ
      ?auto_904748 - OBJ
      ?auto_904749 - OBJ
      ?auto_904750 - OBJ
      ?auto_904751 - OBJ
      ?auto_904746 - LOCATION
    )
    :vars
    (
      ?auto_904755 - TRUCK
      ?auto_904754 - LOCATION
      ?auto_904753 - CITY
      ?auto_904752 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_904755 ?auto_904754 ) ( IN-CITY ?auto_904754 ?auto_904753 ) ( IN-CITY ?auto_904746 ?auto_904753 ) ( not ( = ?auto_904746 ?auto_904754 ) ) ( OBJ-AT ?auto_904752 ?auto_904746 ) ( not ( = ?auto_904752 ?auto_904750 ) ) ( OBJ-AT ?auto_904750 ?auto_904754 ) ( OBJ-AT ?auto_904747 ?auto_904746 ) ( OBJ-AT ?auto_904748 ?auto_904746 ) ( OBJ-AT ?auto_904749 ?auto_904746 ) ( OBJ-AT ?auto_904751 ?auto_904746 ) ( not ( = ?auto_904747 ?auto_904748 ) ) ( not ( = ?auto_904747 ?auto_904749 ) ) ( not ( = ?auto_904747 ?auto_904750 ) ) ( not ( = ?auto_904747 ?auto_904751 ) ) ( not ( = ?auto_904747 ?auto_904752 ) ) ( not ( = ?auto_904748 ?auto_904749 ) ) ( not ( = ?auto_904748 ?auto_904750 ) ) ( not ( = ?auto_904748 ?auto_904751 ) ) ( not ( = ?auto_904748 ?auto_904752 ) ) ( not ( = ?auto_904749 ?auto_904750 ) ) ( not ( = ?auto_904749 ?auto_904751 ) ) ( not ( = ?auto_904749 ?auto_904752 ) ) ( not ( = ?auto_904750 ?auto_904751 ) ) ( not ( = ?auto_904751 ?auto_904752 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_904752 ?auto_904750 ?auto_904746 )
      ( DELIVER-5PKG-VERIFY ?auto_904747 ?auto_904748 ?auto_904749 ?auto_904750 ?auto_904751 ?auto_904746 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_904803 - OBJ
      ?auto_904804 - OBJ
      ?auto_904805 - OBJ
      ?auto_904806 - OBJ
      ?auto_904807 - OBJ
      ?auto_904802 - LOCATION
    )
    :vars
    (
      ?auto_904811 - TRUCK
      ?auto_904810 - LOCATION
      ?auto_904809 - CITY
      ?auto_904808 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_904811 ?auto_904810 ) ( IN-CITY ?auto_904810 ?auto_904809 ) ( IN-CITY ?auto_904802 ?auto_904809 ) ( not ( = ?auto_904802 ?auto_904810 ) ) ( OBJ-AT ?auto_904808 ?auto_904802 ) ( not ( = ?auto_904808 ?auto_904805 ) ) ( OBJ-AT ?auto_904805 ?auto_904810 ) ( OBJ-AT ?auto_904803 ?auto_904802 ) ( OBJ-AT ?auto_904804 ?auto_904802 ) ( OBJ-AT ?auto_904806 ?auto_904802 ) ( OBJ-AT ?auto_904807 ?auto_904802 ) ( not ( = ?auto_904803 ?auto_904804 ) ) ( not ( = ?auto_904803 ?auto_904805 ) ) ( not ( = ?auto_904803 ?auto_904806 ) ) ( not ( = ?auto_904803 ?auto_904807 ) ) ( not ( = ?auto_904803 ?auto_904808 ) ) ( not ( = ?auto_904804 ?auto_904805 ) ) ( not ( = ?auto_904804 ?auto_904806 ) ) ( not ( = ?auto_904804 ?auto_904807 ) ) ( not ( = ?auto_904804 ?auto_904808 ) ) ( not ( = ?auto_904805 ?auto_904806 ) ) ( not ( = ?auto_904805 ?auto_904807 ) ) ( not ( = ?auto_904806 ?auto_904807 ) ) ( not ( = ?auto_904806 ?auto_904808 ) ) ( not ( = ?auto_904807 ?auto_904808 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_904808 ?auto_904805 ?auto_904802 )
      ( DELIVER-5PKG-VERIFY ?auto_904803 ?auto_904804 ?auto_904805 ?auto_904806 ?auto_904807 ?auto_904802 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_904852 - OBJ
      ?auto_904853 - OBJ
      ?auto_904854 - OBJ
      ?auto_904855 - OBJ
      ?auto_904856 - OBJ
      ?auto_904851 - LOCATION
    )
    :vars
    (
      ?auto_904859 - TRUCK
      ?auto_904858 - LOCATION
      ?auto_904857 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_904859 ?auto_904858 ) ( IN-CITY ?auto_904858 ?auto_904857 ) ( IN-CITY ?auto_904851 ?auto_904857 ) ( not ( = ?auto_904851 ?auto_904858 ) ) ( OBJ-AT ?auto_904854 ?auto_904851 ) ( not ( = ?auto_904854 ?auto_904853 ) ) ( OBJ-AT ?auto_904853 ?auto_904858 ) ( OBJ-AT ?auto_904852 ?auto_904851 ) ( OBJ-AT ?auto_904855 ?auto_904851 ) ( OBJ-AT ?auto_904856 ?auto_904851 ) ( not ( = ?auto_904852 ?auto_904853 ) ) ( not ( = ?auto_904852 ?auto_904854 ) ) ( not ( = ?auto_904852 ?auto_904855 ) ) ( not ( = ?auto_904852 ?auto_904856 ) ) ( not ( = ?auto_904853 ?auto_904855 ) ) ( not ( = ?auto_904853 ?auto_904856 ) ) ( not ( = ?auto_904854 ?auto_904855 ) ) ( not ( = ?auto_904854 ?auto_904856 ) ) ( not ( = ?auto_904855 ?auto_904856 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_904854 ?auto_904853 ?auto_904851 )
      ( DELIVER-5PKG-VERIFY ?auto_904852 ?auto_904853 ?auto_904854 ?auto_904855 ?auto_904856 ?auto_904851 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_904942 - OBJ
      ?auto_904943 - OBJ
      ?auto_904944 - OBJ
      ?auto_904945 - OBJ
      ?auto_904946 - OBJ
      ?auto_904941 - LOCATION
    )
    :vars
    (
      ?auto_904949 - TRUCK
      ?auto_904948 - LOCATION
      ?auto_904947 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_904949 ?auto_904948 ) ( IN-CITY ?auto_904948 ?auto_904947 ) ( IN-CITY ?auto_904941 ?auto_904947 ) ( not ( = ?auto_904941 ?auto_904948 ) ) ( OBJ-AT ?auto_904945 ?auto_904941 ) ( not ( = ?auto_904945 ?auto_904943 ) ) ( OBJ-AT ?auto_904943 ?auto_904948 ) ( OBJ-AT ?auto_904942 ?auto_904941 ) ( OBJ-AT ?auto_904944 ?auto_904941 ) ( OBJ-AT ?auto_904946 ?auto_904941 ) ( not ( = ?auto_904942 ?auto_904943 ) ) ( not ( = ?auto_904942 ?auto_904944 ) ) ( not ( = ?auto_904942 ?auto_904945 ) ) ( not ( = ?auto_904942 ?auto_904946 ) ) ( not ( = ?auto_904943 ?auto_904944 ) ) ( not ( = ?auto_904943 ?auto_904946 ) ) ( not ( = ?auto_904944 ?auto_904945 ) ) ( not ( = ?auto_904944 ?auto_904946 ) ) ( not ( = ?auto_904945 ?auto_904946 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_904945 ?auto_904943 ?auto_904941 )
      ( DELIVER-5PKG-VERIFY ?auto_904942 ?auto_904943 ?auto_904944 ?auto_904945 ?auto_904946 ?auto_904941 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_904969 - OBJ
      ?auto_904970 - OBJ
      ?auto_904971 - OBJ
      ?auto_904972 - OBJ
      ?auto_904973 - OBJ
      ?auto_904968 - LOCATION
    )
    :vars
    (
      ?auto_904977 - TRUCK
      ?auto_904976 - LOCATION
      ?auto_904975 - CITY
      ?auto_904974 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_904977 ?auto_904976 ) ( IN-CITY ?auto_904976 ?auto_904975 ) ( IN-CITY ?auto_904968 ?auto_904975 ) ( not ( = ?auto_904968 ?auto_904976 ) ) ( OBJ-AT ?auto_904974 ?auto_904968 ) ( not ( = ?auto_904974 ?auto_904970 ) ) ( OBJ-AT ?auto_904970 ?auto_904976 ) ( OBJ-AT ?auto_904969 ?auto_904968 ) ( OBJ-AT ?auto_904971 ?auto_904968 ) ( OBJ-AT ?auto_904972 ?auto_904968 ) ( OBJ-AT ?auto_904973 ?auto_904968 ) ( not ( = ?auto_904969 ?auto_904970 ) ) ( not ( = ?auto_904969 ?auto_904971 ) ) ( not ( = ?auto_904969 ?auto_904972 ) ) ( not ( = ?auto_904969 ?auto_904973 ) ) ( not ( = ?auto_904969 ?auto_904974 ) ) ( not ( = ?auto_904970 ?auto_904971 ) ) ( not ( = ?auto_904970 ?auto_904972 ) ) ( not ( = ?auto_904970 ?auto_904973 ) ) ( not ( = ?auto_904971 ?auto_904972 ) ) ( not ( = ?auto_904971 ?auto_904973 ) ) ( not ( = ?auto_904971 ?auto_904974 ) ) ( not ( = ?auto_904972 ?auto_904973 ) ) ( not ( = ?auto_904972 ?auto_904974 ) ) ( not ( = ?auto_904973 ?auto_904974 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_904974 ?auto_904970 ?auto_904968 )
      ( DELIVER-5PKG-VERIFY ?auto_904969 ?auto_904970 ?auto_904971 ?auto_904972 ?auto_904973 ?auto_904968 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_905103 - OBJ
      ?auto_905104 - OBJ
      ?auto_905105 - OBJ
      ?auto_905106 - OBJ
      ?auto_905107 - OBJ
      ?auto_905102 - LOCATION
    )
    :vars
    (
      ?auto_905110 - TRUCK
      ?auto_905109 - LOCATION
      ?auto_905108 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_905110 ?auto_905109 ) ( IN-CITY ?auto_905109 ?auto_905108 ) ( IN-CITY ?auto_905102 ?auto_905108 ) ( not ( = ?auto_905102 ?auto_905109 ) ) ( OBJ-AT ?auto_905106 ?auto_905102 ) ( not ( = ?auto_905106 ?auto_905103 ) ) ( OBJ-AT ?auto_905103 ?auto_905109 ) ( OBJ-AT ?auto_905104 ?auto_905102 ) ( OBJ-AT ?auto_905105 ?auto_905102 ) ( OBJ-AT ?auto_905107 ?auto_905102 ) ( not ( = ?auto_905103 ?auto_905104 ) ) ( not ( = ?auto_905103 ?auto_905105 ) ) ( not ( = ?auto_905103 ?auto_905107 ) ) ( not ( = ?auto_905104 ?auto_905105 ) ) ( not ( = ?auto_905104 ?auto_905106 ) ) ( not ( = ?auto_905104 ?auto_905107 ) ) ( not ( = ?auto_905105 ?auto_905106 ) ) ( not ( = ?auto_905105 ?auto_905107 ) ) ( not ( = ?auto_905106 ?auto_905107 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_905106 ?auto_905103 ?auto_905102 )
      ( DELIVER-5PKG-VERIFY ?auto_905103 ?auto_905104 ?auto_905105 ?auto_905106 ?auto_905107 ?auto_905102 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_905130 - OBJ
      ?auto_905131 - OBJ
      ?auto_905132 - OBJ
      ?auto_905133 - OBJ
      ?auto_905134 - OBJ
      ?auto_905129 - LOCATION
    )
    :vars
    (
      ?auto_905137 - TRUCK
      ?auto_905136 - LOCATION
      ?auto_905135 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_905137 ?auto_905136 ) ( IN-CITY ?auto_905136 ?auto_905135 ) ( IN-CITY ?auto_905129 ?auto_905135 ) ( not ( = ?auto_905129 ?auto_905136 ) ) ( OBJ-AT ?auto_905131 ?auto_905129 ) ( not ( = ?auto_905131 ?auto_905130 ) ) ( OBJ-AT ?auto_905130 ?auto_905136 ) ( OBJ-AT ?auto_905132 ?auto_905129 ) ( OBJ-AT ?auto_905133 ?auto_905129 ) ( OBJ-AT ?auto_905134 ?auto_905129 ) ( not ( = ?auto_905130 ?auto_905132 ) ) ( not ( = ?auto_905130 ?auto_905133 ) ) ( not ( = ?auto_905130 ?auto_905134 ) ) ( not ( = ?auto_905131 ?auto_905132 ) ) ( not ( = ?auto_905131 ?auto_905133 ) ) ( not ( = ?auto_905131 ?auto_905134 ) ) ( not ( = ?auto_905132 ?auto_905133 ) ) ( not ( = ?auto_905132 ?auto_905134 ) ) ( not ( = ?auto_905133 ?auto_905134 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_905131 ?auto_905130 ?auto_905129 )
      ( DELIVER-5PKG-VERIFY ?auto_905130 ?auto_905131 ?auto_905132 ?auto_905133 ?auto_905134 ?auto_905129 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_905373 - OBJ
      ?auto_905374 - OBJ
      ?auto_905375 - OBJ
      ?auto_905376 - OBJ
      ?auto_905377 - OBJ
      ?auto_905372 - LOCATION
    )
    :vars
    (
      ?auto_905380 - TRUCK
      ?auto_905379 - LOCATION
      ?auto_905378 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_905380 ?auto_905379 ) ( IN-CITY ?auto_905379 ?auto_905378 ) ( IN-CITY ?auto_905372 ?auto_905378 ) ( not ( = ?auto_905372 ?auto_905379 ) ) ( OBJ-AT ?auto_905377 ?auto_905372 ) ( not ( = ?auto_905377 ?auto_905373 ) ) ( OBJ-AT ?auto_905373 ?auto_905379 ) ( OBJ-AT ?auto_905374 ?auto_905372 ) ( OBJ-AT ?auto_905375 ?auto_905372 ) ( OBJ-AT ?auto_905376 ?auto_905372 ) ( not ( = ?auto_905373 ?auto_905374 ) ) ( not ( = ?auto_905373 ?auto_905375 ) ) ( not ( = ?auto_905373 ?auto_905376 ) ) ( not ( = ?auto_905374 ?auto_905375 ) ) ( not ( = ?auto_905374 ?auto_905376 ) ) ( not ( = ?auto_905374 ?auto_905377 ) ) ( not ( = ?auto_905375 ?auto_905376 ) ) ( not ( = ?auto_905375 ?auto_905377 ) ) ( not ( = ?auto_905376 ?auto_905377 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_905377 ?auto_905373 ?auto_905372 )
      ( DELIVER-5PKG-VERIFY ?auto_905373 ?auto_905374 ?auto_905375 ?auto_905376 ?auto_905377 ?auto_905372 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_905463 - OBJ
      ?auto_905464 - OBJ
      ?auto_905465 - OBJ
      ?auto_905466 - OBJ
      ?auto_905467 - OBJ
      ?auto_905462 - LOCATION
    )
    :vars
    (
      ?auto_905471 - TRUCK
      ?auto_905470 - LOCATION
      ?auto_905469 - CITY
      ?auto_905468 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_905471 ?auto_905470 ) ( IN-CITY ?auto_905470 ?auto_905469 ) ( IN-CITY ?auto_905462 ?auto_905469 ) ( not ( = ?auto_905462 ?auto_905470 ) ) ( OBJ-AT ?auto_905468 ?auto_905462 ) ( not ( = ?auto_905468 ?auto_905463 ) ) ( OBJ-AT ?auto_905463 ?auto_905470 ) ( OBJ-AT ?auto_905464 ?auto_905462 ) ( OBJ-AT ?auto_905465 ?auto_905462 ) ( OBJ-AT ?auto_905466 ?auto_905462 ) ( OBJ-AT ?auto_905467 ?auto_905462 ) ( not ( = ?auto_905463 ?auto_905464 ) ) ( not ( = ?auto_905463 ?auto_905465 ) ) ( not ( = ?auto_905463 ?auto_905466 ) ) ( not ( = ?auto_905463 ?auto_905467 ) ) ( not ( = ?auto_905464 ?auto_905465 ) ) ( not ( = ?auto_905464 ?auto_905466 ) ) ( not ( = ?auto_905464 ?auto_905467 ) ) ( not ( = ?auto_905464 ?auto_905468 ) ) ( not ( = ?auto_905465 ?auto_905466 ) ) ( not ( = ?auto_905465 ?auto_905467 ) ) ( not ( = ?auto_905465 ?auto_905468 ) ) ( not ( = ?auto_905466 ?auto_905467 ) ) ( not ( = ?auto_905466 ?auto_905468 ) ) ( not ( = ?auto_905467 ?auto_905468 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_905468 ?auto_905463 ?auto_905462 )
      ( DELIVER-5PKG-VERIFY ?auto_905463 ?auto_905464 ?auto_905465 ?auto_905466 ?auto_905467 ?auto_905462 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_905879 - OBJ
      ?auto_905880 - OBJ
      ?auto_905881 - OBJ
      ?auto_905878 - LOCATION
    )
    :vars
    (
      ?auto_905882 - LOCATION
      ?auto_905883 - CITY
      ?auto_905884 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_905882 ?auto_905883 ) ( IN-CITY ?auto_905878 ?auto_905883 ) ( not ( = ?auto_905878 ?auto_905882 ) ) ( OBJ-AT ?auto_905879 ?auto_905878 ) ( not ( = ?auto_905879 ?auto_905881 ) ) ( OBJ-AT ?auto_905881 ?auto_905882 ) ( TRUCK-AT ?auto_905884 ?auto_905878 ) ( OBJ-AT ?auto_905880 ?auto_905878 ) ( not ( = ?auto_905879 ?auto_905880 ) ) ( not ( = ?auto_905880 ?auto_905881 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_905879 ?auto_905881 ?auto_905878 )
      ( DELIVER-3PKG-VERIFY ?auto_905879 ?auto_905880 ?auto_905881 ?auto_905878 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_905912 - OBJ
      ?auto_905913 - OBJ
      ?auto_905914 - OBJ
      ?auto_905911 - LOCATION
    )
    :vars
    (
      ?auto_905915 - LOCATION
      ?auto_905916 - CITY
      ?auto_905918 - OBJ
      ?auto_905917 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_905915 ?auto_905916 ) ( IN-CITY ?auto_905911 ?auto_905916 ) ( not ( = ?auto_905911 ?auto_905915 ) ) ( OBJ-AT ?auto_905918 ?auto_905911 ) ( not ( = ?auto_905918 ?auto_905914 ) ) ( OBJ-AT ?auto_905914 ?auto_905915 ) ( TRUCK-AT ?auto_905917 ?auto_905911 ) ( OBJ-AT ?auto_905912 ?auto_905911 ) ( OBJ-AT ?auto_905913 ?auto_905911 ) ( not ( = ?auto_905912 ?auto_905913 ) ) ( not ( = ?auto_905912 ?auto_905914 ) ) ( not ( = ?auto_905912 ?auto_905918 ) ) ( not ( = ?auto_905913 ?auto_905914 ) ) ( not ( = ?auto_905913 ?auto_905918 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_905918 ?auto_905914 ?auto_905911 )
      ( DELIVER-3PKG-VERIFY ?auto_905912 ?auto_905913 ?auto_905914 ?auto_905911 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_905924 - OBJ
      ?auto_905925 - OBJ
      ?auto_905926 - OBJ
      ?auto_905923 - LOCATION
    )
    :vars
    (
      ?auto_905927 - LOCATION
      ?auto_905928 - CITY
      ?auto_905930 - OBJ
      ?auto_905929 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_905927 ?auto_905928 ) ( IN-CITY ?auto_905923 ?auto_905928 ) ( not ( = ?auto_905923 ?auto_905927 ) ) ( OBJ-AT ?auto_905930 ?auto_905923 ) ( not ( = ?auto_905930 ?auto_905925 ) ) ( OBJ-AT ?auto_905925 ?auto_905927 ) ( TRUCK-AT ?auto_905929 ?auto_905923 ) ( OBJ-AT ?auto_905924 ?auto_905923 ) ( OBJ-AT ?auto_905926 ?auto_905923 ) ( not ( = ?auto_905924 ?auto_905925 ) ) ( not ( = ?auto_905924 ?auto_905926 ) ) ( not ( = ?auto_905924 ?auto_905930 ) ) ( not ( = ?auto_905925 ?auto_905926 ) ) ( not ( = ?auto_905926 ?auto_905930 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_905930 ?auto_905925 ?auto_905923 )
      ( DELIVER-3PKG-VERIFY ?auto_905924 ?auto_905925 ?auto_905926 ?auto_905923 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_905962 - OBJ
      ?auto_905963 - OBJ
      ?auto_905964 - OBJ
      ?auto_905961 - LOCATION
    )
    :vars
    (
      ?auto_905965 - LOCATION
      ?auto_905966 - CITY
      ?auto_905968 - OBJ
      ?auto_905967 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_905965 ?auto_905966 ) ( IN-CITY ?auto_905961 ?auto_905966 ) ( not ( = ?auto_905961 ?auto_905965 ) ) ( OBJ-AT ?auto_905968 ?auto_905961 ) ( not ( = ?auto_905968 ?auto_905962 ) ) ( OBJ-AT ?auto_905962 ?auto_905965 ) ( TRUCK-AT ?auto_905967 ?auto_905961 ) ( OBJ-AT ?auto_905963 ?auto_905961 ) ( OBJ-AT ?auto_905964 ?auto_905961 ) ( not ( = ?auto_905962 ?auto_905963 ) ) ( not ( = ?auto_905962 ?auto_905964 ) ) ( not ( = ?auto_905963 ?auto_905964 ) ) ( not ( = ?auto_905963 ?auto_905968 ) ) ( not ( = ?auto_905964 ?auto_905968 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_905968 ?auto_905962 ?auto_905961 )
      ( DELIVER-3PKG-VERIFY ?auto_905962 ?auto_905963 ?auto_905964 ?auto_905961 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_906001 - OBJ
      ?auto_906002 - OBJ
      ?auto_906003 - OBJ
      ?auto_906004 - OBJ
      ?auto_906000 - LOCATION
    )
    :vars
    (
      ?auto_906005 - LOCATION
      ?auto_906006 - CITY
      ?auto_906007 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906005 ?auto_906006 ) ( IN-CITY ?auto_906000 ?auto_906006 ) ( not ( = ?auto_906000 ?auto_906005 ) ) ( OBJ-AT ?auto_906001 ?auto_906000 ) ( not ( = ?auto_906001 ?auto_906004 ) ) ( OBJ-AT ?auto_906004 ?auto_906005 ) ( TRUCK-AT ?auto_906007 ?auto_906000 ) ( OBJ-AT ?auto_906002 ?auto_906000 ) ( OBJ-AT ?auto_906003 ?auto_906000 ) ( not ( = ?auto_906001 ?auto_906002 ) ) ( not ( = ?auto_906001 ?auto_906003 ) ) ( not ( = ?auto_906002 ?auto_906003 ) ) ( not ( = ?auto_906002 ?auto_906004 ) ) ( not ( = ?auto_906003 ?auto_906004 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906001 ?auto_906004 ?auto_906000 )
      ( DELIVER-4PKG-VERIFY ?auto_906001 ?auto_906002 ?auto_906003 ?auto_906004 ?auto_906000 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_906009 - OBJ
      ?auto_906010 - OBJ
      ?auto_906011 - OBJ
      ?auto_906012 - OBJ
      ?auto_906008 - LOCATION
    )
    :vars
    (
      ?auto_906013 - LOCATION
      ?auto_906014 - CITY
      ?auto_906015 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906013 ?auto_906014 ) ( IN-CITY ?auto_906008 ?auto_906014 ) ( not ( = ?auto_906008 ?auto_906013 ) ) ( OBJ-AT ?auto_906010 ?auto_906008 ) ( not ( = ?auto_906010 ?auto_906012 ) ) ( OBJ-AT ?auto_906012 ?auto_906013 ) ( TRUCK-AT ?auto_906015 ?auto_906008 ) ( OBJ-AT ?auto_906009 ?auto_906008 ) ( OBJ-AT ?auto_906011 ?auto_906008 ) ( not ( = ?auto_906009 ?auto_906010 ) ) ( not ( = ?auto_906009 ?auto_906011 ) ) ( not ( = ?auto_906009 ?auto_906012 ) ) ( not ( = ?auto_906010 ?auto_906011 ) ) ( not ( = ?auto_906011 ?auto_906012 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906010 ?auto_906012 ?auto_906008 )
      ( DELIVER-4PKG-VERIFY ?auto_906009 ?auto_906010 ?auto_906011 ?auto_906012 ?auto_906008 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_906017 - OBJ
      ?auto_906018 - OBJ
      ?auto_906019 - OBJ
      ?auto_906020 - OBJ
      ?auto_906016 - LOCATION
    )
    :vars
    (
      ?auto_906021 - LOCATION
      ?auto_906022 - CITY
      ?auto_906023 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906021 ?auto_906022 ) ( IN-CITY ?auto_906016 ?auto_906022 ) ( not ( = ?auto_906016 ?auto_906021 ) ) ( OBJ-AT ?auto_906020 ?auto_906016 ) ( not ( = ?auto_906020 ?auto_906019 ) ) ( OBJ-AT ?auto_906019 ?auto_906021 ) ( TRUCK-AT ?auto_906023 ?auto_906016 ) ( OBJ-AT ?auto_906017 ?auto_906016 ) ( OBJ-AT ?auto_906018 ?auto_906016 ) ( not ( = ?auto_906017 ?auto_906018 ) ) ( not ( = ?auto_906017 ?auto_906019 ) ) ( not ( = ?auto_906017 ?auto_906020 ) ) ( not ( = ?auto_906018 ?auto_906019 ) ) ( not ( = ?auto_906018 ?auto_906020 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906020 ?auto_906019 ?auto_906016 )
      ( DELIVER-4PKG-VERIFY ?auto_906017 ?auto_906018 ?auto_906019 ?auto_906020 ?auto_906016 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_906081 - OBJ
      ?auto_906082 - OBJ
      ?auto_906083 - OBJ
      ?auto_906084 - OBJ
      ?auto_906080 - LOCATION
    )
    :vars
    (
      ?auto_906085 - LOCATION
      ?auto_906086 - CITY
      ?auto_906087 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906085 ?auto_906086 ) ( IN-CITY ?auto_906080 ?auto_906086 ) ( not ( = ?auto_906080 ?auto_906085 ) ) ( OBJ-AT ?auto_906081 ?auto_906080 ) ( not ( = ?auto_906081 ?auto_906082 ) ) ( OBJ-AT ?auto_906082 ?auto_906085 ) ( TRUCK-AT ?auto_906087 ?auto_906080 ) ( OBJ-AT ?auto_906083 ?auto_906080 ) ( OBJ-AT ?auto_906084 ?auto_906080 ) ( not ( = ?auto_906081 ?auto_906083 ) ) ( not ( = ?auto_906081 ?auto_906084 ) ) ( not ( = ?auto_906082 ?auto_906083 ) ) ( not ( = ?auto_906082 ?auto_906084 ) ) ( not ( = ?auto_906083 ?auto_906084 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906081 ?auto_906082 ?auto_906080 )
      ( DELIVER-4PKG-VERIFY ?auto_906081 ?auto_906082 ?auto_906083 ?auto_906084 ?auto_906080 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_906169 - OBJ
      ?auto_906170 - OBJ
      ?auto_906171 - OBJ
      ?auto_906172 - OBJ
      ?auto_906168 - LOCATION
    )
    :vars
    (
      ?auto_906173 - LOCATION
      ?auto_906174 - CITY
      ?auto_906175 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906173 ?auto_906174 ) ( IN-CITY ?auto_906168 ?auto_906174 ) ( not ( = ?auto_906168 ?auto_906173 ) ) ( OBJ-AT ?auto_906170 ?auto_906168 ) ( not ( = ?auto_906170 ?auto_906171 ) ) ( OBJ-AT ?auto_906171 ?auto_906173 ) ( TRUCK-AT ?auto_906175 ?auto_906168 ) ( OBJ-AT ?auto_906169 ?auto_906168 ) ( OBJ-AT ?auto_906172 ?auto_906168 ) ( not ( = ?auto_906169 ?auto_906170 ) ) ( not ( = ?auto_906169 ?auto_906171 ) ) ( not ( = ?auto_906169 ?auto_906172 ) ) ( not ( = ?auto_906170 ?auto_906172 ) ) ( not ( = ?auto_906171 ?auto_906172 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906170 ?auto_906171 ?auto_906168 )
      ( DELIVER-4PKG-VERIFY ?auto_906169 ?auto_906170 ?auto_906171 ?auto_906172 ?auto_906168 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_906201 - OBJ
      ?auto_906202 - OBJ
      ?auto_906203 - OBJ
      ?auto_906204 - OBJ
      ?auto_906200 - LOCATION
    )
    :vars
    (
      ?auto_906205 - LOCATION
      ?auto_906206 - CITY
      ?auto_906208 - OBJ
      ?auto_906207 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906205 ?auto_906206 ) ( IN-CITY ?auto_906200 ?auto_906206 ) ( not ( = ?auto_906200 ?auto_906205 ) ) ( OBJ-AT ?auto_906208 ?auto_906200 ) ( not ( = ?auto_906208 ?auto_906204 ) ) ( OBJ-AT ?auto_906204 ?auto_906205 ) ( TRUCK-AT ?auto_906207 ?auto_906200 ) ( OBJ-AT ?auto_906201 ?auto_906200 ) ( OBJ-AT ?auto_906202 ?auto_906200 ) ( OBJ-AT ?auto_906203 ?auto_906200 ) ( not ( = ?auto_906201 ?auto_906202 ) ) ( not ( = ?auto_906201 ?auto_906203 ) ) ( not ( = ?auto_906201 ?auto_906204 ) ) ( not ( = ?auto_906201 ?auto_906208 ) ) ( not ( = ?auto_906202 ?auto_906203 ) ) ( not ( = ?auto_906202 ?auto_906204 ) ) ( not ( = ?auto_906202 ?auto_906208 ) ) ( not ( = ?auto_906203 ?auto_906204 ) ) ( not ( = ?auto_906203 ?auto_906208 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906208 ?auto_906204 ?auto_906200 )
      ( DELIVER-4PKG-VERIFY ?auto_906201 ?auto_906202 ?auto_906203 ?auto_906204 ?auto_906200 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_906218 - OBJ
      ?auto_906219 - OBJ
      ?auto_906220 - OBJ
      ?auto_906221 - OBJ
      ?auto_906217 - LOCATION
    )
    :vars
    (
      ?auto_906222 - LOCATION
      ?auto_906223 - CITY
      ?auto_906225 - OBJ
      ?auto_906224 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906222 ?auto_906223 ) ( IN-CITY ?auto_906217 ?auto_906223 ) ( not ( = ?auto_906217 ?auto_906222 ) ) ( OBJ-AT ?auto_906225 ?auto_906217 ) ( not ( = ?auto_906225 ?auto_906220 ) ) ( OBJ-AT ?auto_906220 ?auto_906222 ) ( TRUCK-AT ?auto_906224 ?auto_906217 ) ( OBJ-AT ?auto_906218 ?auto_906217 ) ( OBJ-AT ?auto_906219 ?auto_906217 ) ( OBJ-AT ?auto_906221 ?auto_906217 ) ( not ( = ?auto_906218 ?auto_906219 ) ) ( not ( = ?auto_906218 ?auto_906220 ) ) ( not ( = ?auto_906218 ?auto_906221 ) ) ( not ( = ?auto_906218 ?auto_906225 ) ) ( not ( = ?auto_906219 ?auto_906220 ) ) ( not ( = ?auto_906219 ?auto_906221 ) ) ( not ( = ?auto_906219 ?auto_906225 ) ) ( not ( = ?auto_906220 ?auto_906221 ) ) ( not ( = ?auto_906221 ?auto_906225 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906225 ?auto_906220 ?auto_906217 )
      ( DELIVER-4PKG-VERIFY ?auto_906218 ?auto_906219 ?auto_906220 ?auto_906221 ?auto_906217 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_906244 - OBJ
      ?auto_906245 - OBJ
      ?auto_906246 - OBJ
      ?auto_906247 - OBJ
      ?auto_906243 - LOCATION
    )
    :vars
    (
      ?auto_906248 - LOCATION
      ?auto_906249 - CITY
      ?auto_906250 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906248 ?auto_906249 ) ( IN-CITY ?auto_906243 ?auto_906249 ) ( not ( = ?auto_906243 ?auto_906248 ) ) ( OBJ-AT ?auto_906246 ?auto_906243 ) ( not ( = ?auto_906246 ?auto_906245 ) ) ( OBJ-AT ?auto_906245 ?auto_906248 ) ( TRUCK-AT ?auto_906250 ?auto_906243 ) ( OBJ-AT ?auto_906244 ?auto_906243 ) ( OBJ-AT ?auto_906247 ?auto_906243 ) ( not ( = ?auto_906244 ?auto_906245 ) ) ( not ( = ?auto_906244 ?auto_906246 ) ) ( not ( = ?auto_906244 ?auto_906247 ) ) ( not ( = ?auto_906245 ?auto_906247 ) ) ( not ( = ?auto_906246 ?auto_906247 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906246 ?auto_906245 ?auto_906243 )
      ( DELIVER-4PKG-VERIFY ?auto_906244 ?auto_906245 ?auto_906246 ?auto_906247 ?auto_906243 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_906268 - OBJ
      ?auto_906269 - OBJ
      ?auto_906270 - OBJ
      ?auto_906271 - OBJ
      ?auto_906267 - LOCATION
    )
    :vars
    (
      ?auto_906272 - LOCATION
      ?auto_906273 - CITY
      ?auto_906275 - OBJ
      ?auto_906274 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906272 ?auto_906273 ) ( IN-CITY ?auto_906267 ?auto_906273 ) ( not ( = ?auto_906267 ?auto_906272 ) ) ( OBJ-AT ?auto_906275 ?auto_906267 ) ( not ( = ?auto_906275 ?auto_906269 ) ) ( OBJ-AT ?auto_906269 ?auto_906272 ) ( TRUCK-AT ?auto_906274 ?auto_906267 ) ( OBJ-AT ?auto_906268 ?auto_906267 ) ( OBJ-AT ?auto_906270 ?auto_906267 ) ( OBJ-AT ?auto_906271 ?auto_906267 ) ( not ( = ?auto_906268 ?auto_906269 ) ) ( not ( = ?auto_906268 ?auto_906270 ) ) ( not ( = ?auto_906268 ?auto_906271 ) ) ( not ( = ?auto_906268 ?auto_906275 ) ) ( not ( = ?auto_906269 ?auto_906270 ) ) ( not ( = ?auto_906269 ?auto_906271 ) ) ( not ( = ?auto_906270 ?auto_906271 ) ) ( not ( = ?auto_906270 ?auto_906275 ) ) ( not ( = ?auto_906271 ?auto_906275 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906275 ?auto_906269 ?auto_906267 )
      ( DELIVER-4PKG-VERIFY ?auto_906268 ?auto_906269 ?auto_906270 ?auto_906271 ?auto_906267 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_906312 - OBJ
      ?auto_906313 - OBJ
      ?auto_906314 - OBJ
      ?auto_906315 - OBJ
      ?auto_906311 - LOCATION
    )
    :vars
    (
      ?auto_906316 - LOCATION
      ?auto_906317 - CITY
      ?auto_906318 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906316 ?auto_906317 ) ( IN-CITY ?auto_906311 ?auto_906317 ) ( not ( = ?auto_906311 ?auto_906316 ) ) ( OBJ-AT ?auto_906314 ?auto_906311 ) ( not ( = ?auto_906314 ?auto_906312 ) ) ( OBJ-AT ?auto_906312 ?auto_906316 ) ( TRUCK-AT ?auto_906318 ?auto_906311 ) ( OBJ-AT ?auto_906313 ?auto_906311 ) ( OBJ-AT ?auto_906315 ?auto_906311 ) ( not ( = ?auto_906312 ?auto_906313 ) ) ( not ( = ?auto_906312 ?auto_906315 ) ) ( not ( = ?auto_906313 ?auto_906314 ) ) ( not ( = ?auto_906313 ?auto_906315 ) ) ( not ( = ?auto_906314 ?auto_906315 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906314 ?auto_906312 ?auto_906311 )
      ( DELIVER-4PKG-VERIFY ?auto_906312 ?auto_906313 ?auto_906314 ?auto_906315 ?auto_906311 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_906344 - OBJ
      ?auto_906345 - OBJ
      ?auto_906346 - OBJ
      ?auto_906347 - OBJ
      ?auto_906343 - LOCATION
    )
    :vars
    (
      ?auto_906348 - LOCATION
      ?auto_906349 - CITY
      ?auto_906350 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906348 ?auto_906349 ) ( IN-CITY ?auto_906343 ?auto_906349 ) ( not ( = ?auto_906343 ?auto_906348 ) ) ( OBJ-AT ?auto_906345 ?auto_906343 ) ( not ( = ?auto_906345 ?auto_906344 ) ) ( OBJ-AT ?auto_906344 ?auto_906348 ) ( TRUCK-AT ?auto_906350 ?auto_906343 ) ( OBJ-AT ?auto_906346 ?auto_906343 ) ( OBJ-AT ?auto_906347 ?auto_906343 ) ( not ( = ?auto_906344 ?auto_906346 ) ) ( not ( = ?auto_906344 ?auto_906347 ) ) ( not ( = ?auto_906345 ?auto_906346 ) ) ( not ( = ?auto_906345 ?auto_906347 ) ) ( not ( = ?auto_906346 ?auto_906347 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906345 ?auto_906344 ?auto_906343 )
      ( DELIVER-4PKG-VERIFY ?auto_906344 ?auto_906345 ?auto_906346 ?auto_906347 ?auto_906343 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_906416 - OBJ
      ?auto_906417 - OBJ
      ?auto_906418 - OBJ
      ?auto_906419 - OBJ
      ?auto_906415 - LOCATION
    )
    :vars
    (
      ?auto_906420 - LOCATION
      ?auto_906421 - CITY
      ?auto_906423 - OBJ
      ?auto_906422 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906420 ?auto_906421 ) ( IN-CITY ?auto_906415 ?auto_906421 ) ( not ( = ?auto_906415 ?auto_906420 ) ) ( OBJ-AT ?auto_906423 ?auto_906415 ) ( not ( = ?auto_906423 ?auto_906416 ) ) ( OBJ-AT ?auto_906416 ?auto_906420 ) ( TRUCK-AT ?auto_906422 ?auto_906415 ) ( OBJ-AT ?auto_906417 ?auto_906415 ) ( OBJ-AT ?auto_906418 ?auto_906415 ) ( OBJ-AT ?auto_906419 ?auto_906415 ) ( not ( = ?auto_906416 ?auto_906417 ) ) ( not ( = ?auto_906416 ?auto_906418 ) ) ( not ( = ?auto_906416 ?auto_906419 ) ) ( not ( = ?auto_906417 ?auto_906418 ) ) ( not ( = ?auto_906417 ?auto_906419 ) ) ( not ( = ?auto_906417 ?auto_906423 ) ) ( not ( = ?auto_906418 ?auto_906419 ) ) ( not ( = ?auto_906418 ?auto_906423 ) ) ( not ( = ?auto_906419 ?auto_906423 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906423 ?auto_906416 ?auto_906415 )
      ( DELIVER-4PKG-VERIFY ?auto_906416 ?auto_906417 ?auto_906418 ?auto_906419 ?auto_906415 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_906536 - OBJ
      ?auto_906537 - OBJ
      ?auto_906538 - OBJ
      ?auto_906539 - OBJ
      ?auto_906540 - OBJ
      ?auto_906535 - LOCATION
    )
    :vars
    (
      ?auto_906541 - LOCATION
      ?auto_906542 - CITY
      ?auto_906543 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906541 ?auto_906542 ) ( IN-CITY ?auto_906535 ?auto_906542 ) ( not ( = ?auto_906535 ?auto_906541 ) ) ( OBJ-AT ?auto_906539 ?auto_906535 ) ( not ( = ?auto_906539 ?auto_906540 ) ) ( OBJ-AT ?auto_906540 ?auto_906541 ) ( TRUCK-AT ?auto_906543 ?auto_906535 ) ( OBJ-AT ?auto_906536 ?auto_906535 ) ( OBJ-AT ?auto_906537 ?auto_906535 ) ( OBJ-AT ?auto_906538 ?auto_906535 ) ( not ( = ?auto_906536 ?auto_906537 ) ) ( not ( = ?auto_906536 ?auto_906538 ) ) ( not ( = ?auto_906536 ?auto_906539 ) ) ( not ( = ?auto_906536 ?auto_906540 ) ) ( not ( = ?auto_906537 ?auto_906538 ) ) ( not ( = ?auto_906537 ?auto_906539 ) ) ( not ( = ?auto_906537 ?auto_906540 ) ) ( not ( = ?auto_906538 ?auto_906539 ) ) ( not ( = ?auto_906538 ?auto_906540 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906539 ?auto_906540 ?auto_906535 )
      ( DELIVER-5PKG-VERIFY ?auto_906536 ?auto_906537 ?auto_906538 ?auto_906539 ?auto_906540 ?auto_906535 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_906545 - OBJ
      ?auto_906546 - OBJ
      ?auto_906547 - OBJ
      ?auto_906548 - OBJ
      ?auto_906549 - OBJ
      ?auto_906544 - LOCATION
    )
    :vars
    (
      ?auto_906550 - LOCATION
      ?auto_906551 - CITY
      ?auto_906552 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906550 ?auto_906551 ) ( IN-CITY ?auto_906544 ?auto_906551 ) ( not ( = ?auto_906544 ?auto_906550 ) ) ( OBJ-AT ?auto_906547 ?auto_906544 ) ( not ( = ?auto_906547 ?auto_906549 ) ) ( OBJ-AT ?auto_906549 ?auto_906550 ) ( TRUCK-AT ?auto_906552 ?auto_906544 ) ( OBJ-AT ?auto_906545 ?auto_906544 ) ( OBJ-AT ?auto_906546 ?auto_906544 ) ( OBJ-AT ?auto_906548 ?auto_906544 ) ( not ( = ?auto_906545 ?auto_906546 ) ) ( not ( = ?auto_906545 ?auto_906547 ) ) ( not ( = ?auto_906545 ?auto_906548 ) ) ( not ( = ?auto_906545 ?auto_906549 ) ) ( not ( = ?auto_906546 ?auto_906547 ) ) ( not ( = ?auto_906546 ?auto_906548 ) ) ( not ( = ?auto_906546 ?auto_906549 ) ) ( not ( = ?auto_906547 ?auto_906548 ) ) ( not ( = ?auto_906548 ?auto_906549 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906547 ?auto_906549 ?auto_906544 )
      ( DELIVER-5PKG-VERIFY ?auto_906545 ?auto_906546 ?auto_906547 ?auto_906548 ?auto_906549 ?auto_906544 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_906554 - OBJ
      ?auto_906555 - OBJ
      ?auto_906556 - OBJ
      ?auto_906557 - OBJ
      ?auto_906558 - OBJ
      ?auto_906553 - LOCATION
    )
    :vars
    (
      ?auto_906559 - LOCATION
      ?auto_906560 - CITY
      ?auto_906561 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906559 ?auto_906560 ) ( IN-CITY ?auto_906553 ?auto_906560 ) ( not ( = ?auto_906553 ?auto_906559 ) ) ( OBJ-AT ?auto_906558 ?auto_906553 ) ( not ( = ?auto_906558 ?auto_906557 ) ) ( OBJ-AT ?auto_906557 ?auto_906559 ) ( TRUCK-AT ?auto_906561 ?auto_906553 ) ( OBJ-AT ?auto_906554 ?auto_906553 ) ( OBJ-AT ?auto_906555 ?auto_906553 ) ( OBJ-AT ?auto_906556 ?auto_906553 ) ( not ( = ?auto_906554 ?auto_906555 ) ) ( not ( = ?auto_906554 ?auto_906556 ) ) ( not ( = ?auto_906554 ?auto_906557 ) ) ( not ( = ?auto_906554 ?auto_906558 ) ) ( not ( = ?auto_906555 ?auto_906556 ) ) ( not ( = ?auto_906555 ?auto_906557 ) ) ( not ( = ?auto_906555 ?auto_906558 ) ) ( not ( = ?auto_906556 ?auto_906557 ) ) ( not ( = ?auto_906556 ?auto_906558 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906558 ?auto_906557 ?auto_906553 )
      ( DELIVER-5PKG-VERIFY ?auto_906554 ?auto_906555 ?auto_906556 ?auto_906557 ?auto_906558 ?auto_906553 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_906581 - OBJ
      ?auto_906582 - OBJ
      ?auto_906583 - OBJ
      ?auto_906584 - OBJ
      ?auto_906585 - OBJ
      ?auto_906580 - LOCATION
    )
    :vars
    (
      ?auto_906586 - LOCATION
      ?auto_906587 - CITY
      ?auto_906588 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906586 ?auto_906587 ) ( IN-CITY ?auto_906580 ?auto_906587 ) ( not ( = ?auto_906580 ?auto_906586 ) ) ( OBJ-AT ?auto_906581 ?auto_906580 ) ( not ( = ?auto_906581 ?auto_906585 ) ) ( OBJ-AT ?auto_906585 ?auto_906586 ) ( TRUCK-AT ?auto_906588 ?auto_906580 ) ( OBJ-AT ?auto_906582 ?auto_906580 ) ( OBJ-AT ?auto_906583 ?auto_906580 ) ( OBJ-AT ?auto_906584 ?auto_906580 ) ( not ( = ?auto_906581 ?auto_906582 ) ) ( not ( = ?auto_906581 ?auto_906583 ) ) ( not ( = ?auto_906581 ?auto_906584 ) ) ( not ( = ?auto_906582 ?auto_906583 ) ) ( not ( = ?auto_906582 ?auto_906584 ) ) ( not ( = ?auto_906582 ?auto_906585 ) ) ( not ( = ?auto_906583 ?auto_906584 ) ) ( not ( = ?auto_906583 ?auto_906585 ) ) ( not ( = ?auto_906584 ?auto_906585 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906581 ?auto_906585 ?auto_906580 )
      ( DELIVER-5PKG-VERIFY ?auto_906581 ?auto_906582 ?auto_906583 ?auto_906584 ?auto_906585 ?auto_906580 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_906599 - OBJ
      ?auto_906600 - OBJ
      ?auto_906601 - OBJ
      ?auto_906602 - OBJ
      ?auto_906603 - OBJ
      ?auto_906598 - LOCATION
    )
    :vars
    (
      ?auto_906604 - LOCATION
      ?auto_906605 - CITY
      ?auto_906606 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906604 ?auto_906605 ) ( IN-CITY ?auto_906598 ?auto_906605 ) ( not ( = ?auto_906598 ?auto_906604 ) ) ( OBJ-AT ?auto_906600 ?auto_906598 ) ( not ( = ?auto_906600 ?auto_906602 ) ) ( OBJ-AT ?auto_906602 ?auto_906604 ) ( TRUCK-AT ?auto_906606 ?auto_906598 ) ( OBJ-AT ?auto_906599 ?auto_906598 ) ( OBJ-AT ?auto_906601 ?auto_906598 ) ( OBJ-AT ?auto_906603 ?auto_906598 ) ( not ( = ?auto_906599 ?auto_906600 ) ) ( not ( = ?auto_906599 ?auto_906601 ) ) ( not ( = ?auto_906599 ?auto_906602 ) ) ( not ( = ?auto_906599 ?auto_906603 ) ) ( not ( = ?auto_906600 ?auto_906601 ) ) ( not ( = ?auto_906600 ?auto_906603 ) ) ( not ( = ?auto_906601 ?auto_906602 ) ) ( not ( = ?auto_906601 ?auto_906603 ) ) ( not ( = ?auto_906602 ?auto_906603 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906600 ?auto_906602 ?auto_906598 )
      ( DELIVER-5PKG-VERIFY ?auto_906599 ?auto_906600 ?auto_906601 ?auto_906602 ?auto_906603 ?auto_906598 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_906608 - OBJ
      ?auto_906609 - OBJ
      ?auto_906610 - OBJ
      ?auto_906611 - OBJ
      ?auto_906612 - OBJ
      ?auto_906607 - LOCATION
    )
    :vars
    (
      ?auto_906613 - LOCATION
      ?auto_906614 - CITY
      ?auto_906615 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906613 ?auto_906614 ) ( IN-CITY ?auto_906607 ?auto_906614 ) ( not ( = ?auto_906607 ?auto_906613 ) ) ( OBJ-AT ?auto_906608 ?auto_906607 ) ( not ( = ?auto_906608 ?auto_906611 ) ) ( OBJ-AT ?auto_906611 ?auto_906613 ) ( TRUCK-AT ?auto_906615 ?auto_906607 ) ( OBJ-AT ?auto_906609 ?auto_906607 ) ( OBJ-AT ?auto_906610 ?auto_906607 ) ( OBJ-AT ?auto_906612 ?auto_906607 ) ( not ( = ?auto_906608 ?auto_906609 ) ) ( not ( = ?auto_906608 ?auto_906610 ) ) ( not ( = ?auto_906608 ?auto_906612 ) ) ( not ( = ?auto_906609 ?auto_906610 ) ) ( not ( = ?auto_906609 ?auto_906611 ) ) ( not ( = ?auto_906609 ?auto_906612 ) ) ( not ( = ?auto_906610 ?auto_906611 ) ) ( not ( = ?auto_906610 ?auto_906612 ) ) ( not ( = ?auto_906611 ?auto_906612 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906608 ?auto_906611 ?auto_906607 )
      ( DELIVER-5PKG-VERIFY ?auto_906608 ?auto_906609 ?auto_906610 ?auto_906611 ?auto_906612 ?auto_906607 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_906626 - OBJ
      ?auto_906627 - OBJ
      ?auto_906628 - OBJ
      ?auto_906629 - OBJ
      ?auto_906630 - OBJ
      ?auto_906625 - LOCATION
    )
    :vars
    (
      ?auto_906631 - LOCATION
      ?auto_906632 - CITY
      ?auto_906633 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906631 ?auto_906632 ) ( IN-CITY ?auto_906625 ?auto_906632 ) ( not ( = ?auto_906625 ?auto_906631 ) ) ( OBJ-AT ?auto_906630 ?auto_906625 ) ( not ( = ?auto_906630 ?auto_906628 ) ) ( OBJ-AT ?auto_906628 ?auto_906631 ) ( TRUCK-AT ?auto_906633 ?auto_906625 ) ( OBJ-AT ?auto_906626 ?auto_906625 ) ( OBJ-AT ?auto_906627 ?auto_906625 ) ( OBJ-AT ?auto_906629 ?auto_906625 ) ( not ( = ?auto_906626 ?auto_906627 ) ) ( not ( = ?auto_906626 ?auto_906628 ) ) ( not ( = ?auto_906626 ?auto_906629 ) ) ( not ( = ?auto_906626 ?auto_906630 ) ) ( not ( = ?auto_906627 ?auto_906628 ) ) ( not ( = ?auto_906627 ?auto_906629 ) ) ( not ( = ?auto_906627 ?auto_906630 ) ) ( not ( = ?auto_906628 ?auto_906629 ) ) ( not ( = ?auto_906629 ?auto_906630 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906630 ?auto_906628 ?auto_906625 )
      ( DELIVER-5PKG-VERIFY ?auto_906626 ?auto_906627 ?auto_906628 ?auto_906629 ?auto_906630 ?auto_906625 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_906635 - OBJ
      ?auto_906636 - OBJ
      ?auto_906637 - OBJ
      ?auto_906638 - OBJ
      ?auto_906639 - OBJ
      ?auto_906634 - LOCATION
    )
    :vars
    (
      ?auto_906640 - LOCATION
      ?auto_906641 - CITY
      ?auto_906642 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906640 ?auto_906641 ) ( IN-CITY ?auto_906634 ?auto_906641 ) ( not ( = ?auto_906634 ?auto_906640 ) ) ( OBJ-AT ?auto_906638 ?auto_906634 ) ( not ( = ?auto_906638 ?auto_906637 ) ) ( OBJ-AT ?auto_906637 ?auto_906640 ) ( TRUCK-AT ?auto_906642 ?auto_906634 ) ( OBJ-AT ?auto_906635 ?auto_906634 ) ( OBJ-AT ?auto_906636 ?auto_906634 ) ( OBJ-AT ?auto_906639 ?auto_906634 ) ( not ( = ?auto_906635 ?auto_906636 ) ) ( not ( = ?auto_906635 ?auto_906637 ) ) ( not ( = ?auto_906635 ?auto_906638 ) ) ( not ( = ?auto_906635 ?auto_906639 ) ) ( not ( = ?auto_906636 ?auto_906637 ) ) ( not ( = ?auto_906636 ?auto_906638 ) ) ( not ( = ?auto_906636 ?auto_906639 ) ) ( not ( = ?auto_906637 ?auto_906639 ) ) ( not ( = ?auto_906638 ?auto_906639 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906638 ?auto_906637 ?auto_906634 )
      ( DELIVER-5PKG-VERIFY ?auto_906635 ?auto_906636 ?auto_906637 ?auto_906638 ?auto_906639 ?auto_906634 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_906653 - OBJ
      ?auto_906654 - OBJ
      ?auto_906655 - OBJ
      ?auto_906656 - OBJ
      ?auto_906657 - OBJ
      ?auto_906652 - LOCATION
    )
    :vars
    (
      ?auto_906658 - LOCATION
      ?auto_906659 - CITY
      ?auto_906660 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906658 ?auto_906659 ) ( IN-CITY ?auto_906652 ?auto_906659 ) ( not ( = ?auto_906652 ?auto_906658 ) ) ( OBJ-AT ?auto_906653 ?auto_906652 ) ( not ( = ?auto_906653 ?auto_906655 ) ) ( OBJ-AT ?auto_906655 ?auto_906658 ) ( TRUCK-AT ?auto_906660 ?auto_906652 ) ( OBJ-AT ?auto_906654 ?auto_906652 ) ( OBJ-AT ?auto_906656 ?auto_906652 ) ( OBJ-AT ?auto_906657 ?auto_906652 ) ( not ( = ?auto_906653 ?auto_906654 ) ) ( not ( = ?auto_906653 ?auto_906656 ) ) ( not ( = ?auto_906653 ?auto_906657 ) ) ( not ( = ?auto_906654 ?auto_906655 ) ) ( not ( = ?auto_906654 ?auto_906656 ) ) ( not ( = ?auto_906654 ?auto_906657 ) ) ( not ( = ?auto_906655 ?auto_906656 ) ) ( not ( = ?auto_906655 ?auto_906657 ) ) ( not ( = ?auto_906656 ?auto_906657 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906653 ?auto_906655 ?auto_906652 )
      ( DELIVER-5PKG-VERIFY ?auto_906653 ?auto_906654 ?auto_906655 ?auto_906656 ?auto_906657 ?auto_906652 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_906878 - OBJ
      ?auto_906879 - OBJ
      ?auto_906880 - OBJ
      ?auto_906881 - OBJ
      ?auto_906882 - OBJ
      ?auto_906877 - LOCATION
    )
    :vars
    (
      ?auto_906883 - LOCATION
      ?auto_906884 - CITY
      ?auto_906885 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906883 ?auto_906884 ) ( IN-CITY ?auto_906877 ?auto_906884 ) ( not ( = ?auto_906877 ?auto_906883 ) ) ( OBJ-AT ?auto_906882 ?auto_906877 ) ( not ( = ?auto_906882 ?auto_906879 ) ) ( OBJ-AT ?auto_906879 ?auto_906883 ) ( TRUCK-AT ?auto_906885 ?auto_906877 ) ( OBJ-AT ?auto_906878 ?auto_906877 ) ( OBJ-AT ?auto_906880 ?auto_906877 ) ( OBJ-AT ?auto_906881 ?auto_906877 ) ( not ( = ?auto_906878 ?auto_906879 ) ) ( not ( = ?auto_906878 ?auto_906880 ) ) ( not ( = ?auto_906878 ?auto_906881 ) ) ( not ( = ?auto_906878 ?auto_906882 ) ) ( not ( = ?auto_906879 ?auto_906880 ) ) ( not ( = ?auto_906879 ?auto_906881 ) ) ( not ( = ?auto_906880 ?auto_906881 ) ) ( not ( = ?auto_906880 ?auto_906882 ) ) ( not ( = ?auto_906881 ?auto_906882 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906882 ?auto_906879 ?auto_906877 )
      ( DELIVER-5PKG-VERIFY ?auto_906878 ?auto_906879 ?auto_906880 ?auto_906881 ?auto_906882 ?auto_906877 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_906887 - OBJ
      ?auto_906888 - OBJ
      ?auto_906889 - OBJ
      ?auto_906890 - OBJ
      ?auto_906891 - OBJ
      ?auto_906886 - LOCATION
    )
    :vars
    (
      ?auto_906892 - LOCATION
      ?auto_906893 - CITY
      ?auto_906894 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906892 ?auto_906893 ) ( IN-CITY ?auto_906886 ?auto_906893 ) ( not ( = ?auto_906886 ?auto_906892 ) ) ( OBJ-AT ?auto_906889 ?auto_906886 ) ( not ( = ?auto_906889 ?auto_906888 ) ) ( OBJ-AT ?auto_906888 ?auto_906892 ) ( TRUCK-AT ?auto_906894 ?auto_906886 ) ( OBJ-AT ?auto_906887 ?auto_906886 ) ( OBJ-AT ?auto_906890 ?auto_906886 ) ( OBJ-AT ?auto_906891 ?auto_906886 ) ( not ( = ?auto_906887 ?auto_906888 ) ) ( not ( = ?auto_906887 ?auto_906889 ) ) ( not ( = ?auto_906887 ?auto_906890 ) ) ( not ( = ?auto_906887 ?auto_906891 ) ) ( not ( = ?auto_906888 ?auto_906890 ) ) ( not ( = ?auto_906888 ?auto_906891 ) ) ( not ( = ?auto_906889 ?auto_906890 ) ) ( not ( = ?auto_906889 ?auto_906891 ) ) ( not ( = ?auto_906890 ?auto_906891 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906889 ?auto_906888 ?auto_906886 )
      ( DELIVER-5PKG-VERIFY ?auto_906887 ?auto_906888 ?auto_906889 ?auto_906890 ?auto_906891 ?auto_906886 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_906968 - OBJ
      ?auto_906969 - OBJ
      ?auto_906970 - OBJ
      ?auto_906971 - OBJ
      ?auto_906972 - OBJ
      ?auto_906967 - LOCATION
    )
    :vars
    (
      ?auto_906973 - LOCATION
      ?auto_906974 - CITY
      ?auto_906975 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906973 ?auto_906974 ) ( IN-CITY ?auto_906967 ?auto_906974 ) ( not ( = ?auto_906967 ?auto_906973 ) ) ( OBJ-AT ?auto_906968 ?auto_906967 ) ( not ( = ?auto_906968 ?auto_906969 ) ) ( OBJ-AT ?auto_906969 ?auto_906973 ) ( TRUCK-AT ?auto_906975 ?auto_906967 ) ( OBJ-AT ?auto_906970 ?auto_906967 ) ( OBJ-AT ?auto_906971 ?auto_906967 ) ( OBJ-AT ?auto_906972 ?auto_906967 ) ( not ( = ?auto_906968 ?auto_906970 ) ) ( not ( = ?auto_906968 ?auto_906971 ) ) ( not ( = ?auto_906968 ?auto_906972 ) ) ( not ( = ?auto_906969 ?auto_906970 ) ) ( not ( = ?auto_906969 ?auto_906971 ) ) ( not ( = ?auto_906969 ?auto_906972 ) ) ( not ( = ?auto_906970 ?auto_906971 ) ) ( not ( = ?auto_906970 ?auto_906972 ) ) ( not ( = ?auto_906971 ?auto_906972 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906968 ?auto_906969 ?auto_906967 )
      ( DELIVER-5PKG-VERIFY ?auto_906968 ?auto_906969 ?auto_906970 ?auto_906971 ?auto_906972 ?auto_906967 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_907346 - OBJ
      ?auto_907347 - OBJ
      ?auto_907348 - OBJ
      ?auto_907349 - OBJ
      ?auto_907350 - OBJ
      ?auto_907345 - LOCATION
    )
    :vars
    (
      ?auto_907351 - LOCATION
      ?auto_907352 - CITY
      ?auto_907354 - OBJ
      ?auto_907353 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_907351 ?auto_907352 ) ( IN-CITY ?auto_907345 ?auto_907352 ) ( not ( = ?auto_907345 ?auto_907351 ) ) ( OBJ-AT ?auto_907354 ?auto_907345 ) ( not ( = ?auto_907354 ?auto_907350 ) ) ( OBJ-AT ?auto_907350 ?auto_907351 ) ( TRUCK-AT ?auto_907353 ?auto_907345 ) ( OBJ-AT ?auto_907346 ?auto_907345 ) ( OBJ-AT ?auto_907347 ?auto_907345 ) ( OBJ-AT ?auto_907348 ?auto_907345 ) ( OBJ-AT ?auto_907349 ?auto_907345 ) ( not ( = ?auto_907346 ?auto_907347 ) ) ( not ( = ?auto_907346 ?auto_907348 ) ) ( not ( = ?auto_907346 ?auto_907349 ) ) ( not ( = ?auto_907346 ?auto_907350 ) ) ( not ( = ?auto_907346 ?auto_907354 ) ) ( not ( = ?auto_907347 ?auto_907348 ) ) ( not ( = ?auto_907347 ?auto_907349 ) ) ( not ( = ?auto_907347 ?auto_907350 ) ) ( not ( = ?auto_907347 ?auto_907354 ) ) ( not ( = ?auto_907348 ?auto_907349 ) ) ( not ( = ?auto_907348 ?auto_907350 ) ) ( not ( = ?auto_907348 ?auto_907354 ) ) ( not ( = ?auto_907349 ?auto_907350 ) ) ( not ( = ?auto_907349 ?auto_907354 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_907354 ?auto_907350 ?auto_907345 )
      ( DELIVER-5PKG-VERIFY ?auto_907346 ?auto_907347 ?auto_907348 ?auto_907349 ?auto_907350 ?auto_907345 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_907365 - OBJ
      ?auto_907366 - OBJ
      ?auto_907367 - OBJ
      ?auto_907368 - OBJ
      ?auto_907369 - OBJ
      ?auto_907364 - LOCATION
    )
    :vars
    (
      ?auto_907370 - LOCATION
      ?auto_907371 - CITY
      ?auto_907373 - OBJ
      ?auto_907372 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_907370 ?auto_907371 ) ( IN-CITY ?auto_907364 ?auto_907371 ) ( not ( = ?auto_907364 ?auto_907370 ) ) ( OBJ-AT ?auto_907373 ?auto_907364 ) ( not ( = ?auto_907373 ?auto_907368 ) ) ( OBJ-AT ?auto_907368 ?auto_907370 ) ( TRUCK-AT ?auto_907372 ?auto_907364 ) ( OBJ-AT ?auto_907365 ?auto_907364 ) ( OBJ-AT ?auto_907366 ?auto_907364 ) ( OBJ-AT ?auto_907367 ?auto_907364 ) ( OBJ-AT ?auto_907369 ?auto_907364 ) ( not ( = ?auto_907365 ?auto_907366 ) ) ( not ( = ?auto_907365 ?auto_907367 ) ) ( not ( = ?auto_907365 ?auto_907368 ) ) ( not ( = ?auto_907365 ?auto_907369 ) ) ( not ( = ?auto_907365 ?auto_907373 ) ) ( not ( = ?auto_907366 ?auto_907367 ) ) ( not ( = ?auto_907366 ?auto_907368 ) ) ( not ( = ?auto_907366 ?auto_907369 ) ) ( not ( = ?auto_907366 ?auto_907373 ) ) ( not ( = ?auto_907367 ?auto_907368 ) ) ( not ( = ?auto_907367 ?auto_907369 ) ) ( not ( = ?auto_907367 ?auto_907373 ) ) ( not ( = ?auto_907368 ?auto_907369 ) ) ( not ( = ?auto_907369 ?auto_907373 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_907373 ?auto_907368 ?auto_907364 )
      ( DELIVER-5PKG-VERIFY ?auto_907365 ?auto_907366 ?auto_907367 ?auto_907368 ?auto_907369 ?auto_907364 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_907421 - OBJ
      ?auto_907422 - OBJ
      ?auto_907423 - OBJ
      ?auto_907424 - OBJ
      ?auto_907425 - OBJ
      ?auto_907420 - LOCATION
    )
    :vars
    (
      ?auto_907426 - LOCATION
      ?auto_907427 - CITY
      ?auto_907429 - OBJ
      ?auto_907428 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_907426 ?auto_907427 ) ( IN-CITY ?auto_907420 ?auto_907427 ) ( not ( = ?auto_907420 ?auto_907426 ) ) ( OBJ-AT ?auto_907429 ?auto_907420 ) ( not ( = ?auto_907429 ?auto_907423 ) ) ( OBJ-AT ?auto_907423 ?auto_907426 ) ( TRUCK-AT ?auto_907428 ?auto_907420 ) ( OBJ-AT ?auto_907421 ?auto_907420 ) ( OBJ-AT ?auto_907422 ?auto_907420 ) ( OBJ-AT ?auto_907424 ?auto_907420 ) ( OBJ-AT ?auto_907425 ?auto_907420 ) ( not ( = ?auto_907421 ?auto_907422 ) ) ( not ( = ?auto_907421 ?auto_907423 ) ) ( not ( = ?auto_907421 ?auto_907424 ) ) ( not ( = ?auto_907421 ?auto_907425 ) ) ( not ( = ?auto_907421 ?auto_907429 ) ) ( not ( = ?auto_907422 ?auto_907423 ) ) ( not ( = ?auto_907422 ?auto_907424 ) ) ( not ( = ?auto_907422 ?auto_907425 ) ) ( not ( = ?auto_907422 ?auto_907429 ) ) ( not ( = ?auto_907423 ?auto_907424 ) ) ( not ( = ?auto_907423 ?auto_907425 ) ) ( not ( = ?auto_907424 ?auto_907425 ) ) ( not ( = ?auto_907424 ?auto_907429 ) ) ( not ( = ?auto_907425 ?auto_907429 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_907429 ?auto_907423 ?auto_907420 )
      ( DELIVER-5PKG-VERIFY ?auto_907421 ?auto_907422 ?auto_907423 ?auto_907424 ?auto_907425 ?auto_907420 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_907587 - OBJ
      ?auto_907588 - OBJ
      ?auto_907589 - OBJ
      ?auto_907590 - OBJ
      ?auto_907591 - OBJ
      ?auto_907586 - LOCATION
    )
    :vars
    (
      ?auto_907592 - LOCATION
      ?auto_907593 - CITY
      ?auto_907595 - OBJ
      ?auto_907594 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_907592 ?auto_907593 ) ( IN-CITY ?auto_907586 ?auto_907593 ) ( not ( = ?auto_907586 ?auto_907592 ) ) ( OBJ-AT ?auto_907595 ?auto_907586 ) ( not ( = ?auto_907595 ?auto_907588 ) ) ( OBJ-AT ?auto_907588 ?auto_907592 ) ( TRUCK-AT ?auto_907594 ?auto_907586 ) ( OBJ-AT ?auto_907587 ?auto_907586 ) ( OBJ-AT ?auto_907589 ?auto_907586 ) ( OBJ-AT ?auto_907590 ?auto_907586 ) ( OBJ-AT ?auto_907591 ?auto_907586 ) ( not ( = ?auto_907587 ?auto_907588 ) ) ( not ( = ?auto_907587 ?auto_907589 ) ) ( not ( = ?auto_907587 ?auto_907590 ) ) ( not ( = ?auto_907587 ?auto_907591 ) ) ( not ( = ?auto_907587 ?auto_907595 ) ) ( not ( = ?auto_907588 ?auto_907589 ) ) ( not ( = ?auto_907588 ?auto_907590 ) ) ( not ( = ?auto_907588 ?auto_907591 ) ) ( not ( = ?auto_907589 ?auto_907590 ) ) ( not ( = ?auto_907589 ?auto_907591 ) ) ( not ( = ?auto_907589 ?auto_907595 ) ) ( not ( = ?auto_907590 ?auto_907591 ) ) ( not ( = ?auto_907590 ?auto_907595 ) ) ( not ( = ?auto_907591 ?auto_907595 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_907595 ?auto_907588 ?auto_907586 )
      ( DELIVER-5PKG-VERIFY ?auto_907587 ?auto_907588 ?auto_907589 ?auto_907590 ?auto_907591 ?auto_907586 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_907721 - OBJ
      ?auto_907722 - OBJ
      ?auto_907723 - OBJ
      ?auto_907724 - OBJ
      ?auto_907725 - OBJ
      ?auto_907720 - LOCATION
    )
    :vars
    (
      ?auto_907726 - LOCATION
      ?auto_907727 - CITY
      ?auto_907728 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_907726 ?auto_907727 ) ( IN-CITY ?auto_907720 ?auto_907727 ) ( not ( = ?auto_907720 ?auto_907726 ) ) ( OBJ-AT ?auto_907724 ?auto_907720 ) ( not ( = ?auto_907724 ?auto_907721 ) ) ( OBJ-AT ?auto_907721 ?auto_907726 ) ( TRUCK-AT ?auto_907728 ?auto_907720 ) ( OBJ-AT ?auto_907722 ?auto_907720 ) ( OBJ-AT ?auto_907723 ?auto_907720 ) ( OBJ-AT ?auto_907725 ?auto_907720 ) ( not ( = ?auto_907721 ?auto_907722 ) ) ( not ( = ?auto_907721 ?auto_907723 ) ) ( not ( = ?auto_907721 ?auto_907725 ) ) ( not ( = ?auto_907722 ?auto_907723 ) ) ( not ( = ?auto_907722 ?auto_907724 ) ) ( not ( = ?auto_907722 ?auto_907725 ) ) ( not ( = ?auto_907723 ?auto_907724 ) ) ( not ( = ?auto_907723 ?auto_907725 ) ) ( not ( = ?auto_907724 ?auto_907725 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_907724 ?auto_907721 ?auto_907720 )
      ( DELIVER-5PKG-VERIFY ?auto_907721 ?auto_907722 ?auto_907723 ?auto_907724 ?auto_907725 ?auto_907720 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_907748 - OBJ
      ?auto_907749 - OBJ
      ?auto_907750 - OBJ
      ?auto_907751 - OBJ
      ?auto_907752 - OBJ
      ?auto_907747 - LOCATION
    )
    :vars
    (
      ?auto_907753 - LOCATION
      ?auto_907754 - CITY
      ?auto_907755 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_907753 ?auto_907754 ) ( IN-CITY ?auto_907747 ?auto_907754 ) ( not ( = ?auto_907747 ?auto_907753 ) ) ( OBJ-AT ?auto_907749 ?auto_907747 ) ( not ( = ?auto_907749 ?auto_907748 ) ) ( OBJ-AT ?auto_907748 ?auto_907753 ) ( TRUCK-AT ?auto_907755 ?auto_907747 ) ( OBJ-AT ?auto_907750 ?auto_907747 ) ( OBJ-AT ?auto_907751 ?auto_907747 ) ( OBJ-AT ?auto_907752 ?auto_907747 ) ( not ( = ?auto_907748 ?auto_907750 ) ) ( not ( = ?auto_907748 ?auto_907751 ) ) ( not ( = ?auto_907748 ?auto_907752 ) ) ( not ( = ?auto_907749 ?auto_907750 ) ) ( not ( = ?auto_907749 ?auto_907751 ) ) ( not ( = ?auto_907749 ?auto_907752 ) ) ( not ( = ?auto_907750 ?auto_907751 ) ) ( not ( = ?auto_907750 ?auto_907752 ) ) ( not ( = ?auto_907751 ?auto_907752 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_907749 ?auto_907748 ?auto_907747 )
      ( DELIVER-5PKG-VERIFY ?auto_907748 ?auto_907749 ?auto_907750 ?auto_907751 ?auto_907752 ?auto_907747 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_907757 - OBJ
      ?auto_907758 - OBJ
      ?auto_907759 - OBJ
      ?auto_907760 - OBJ
      ?auto_907761 - OBJ
      ?auto_907756 - LOCATION
    )
    :vars
    (
      ?auto_907762 - LOCATION
      ?auto_907763 - CITY
      ?auto_907764 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_907762 ?auto_907763 ) ( IN-CITY ?auto_907756 ?auto_907763 ) ( not ( = ?auto_907756 ?auto_907762 ) ) ( OBJ-AT ?auto_907759 ?auto_907756 ) ( not ( = ?auto_907759 ?auto_907757 ) ) ( OBJ-AT ?auto_907757 ?auto_907762 ) ( TRUCK-AT ?auto_907764 ?auto_907756 ) ( OBJ-AT ?auto_907758 ?auto_907756 ) ( OBJ-AT ?auto_907760 ?auto_907756 ) ( OBJ-AT ?auto_907761 ?auto_907756 ) ( not ( = ?auto_907757 ?auto_907758 ) ) ( not ( = ?auto_907757 ?auto_907760 ) ) ( not ( = ?auto_907757 ?auto_907761 ) ) ( not ( = ?auto_907758 ?auto_907759 ) ) ( not ( = ?auto_907758 ?auto_907760 ) ) ( not ( = ?auto_907758 ?auto_907761 ) ) ( not ( = ?auto_907759 ?auto_907760 ) ) ( not ( = ?auto_907759 ?auto_907761 ) ) ( not ( = ?auto_907760 ?auto_907761 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_907759 ?auto_907757 ?auto_907756 )
      ( DELIVER-5PKG-VERIFY ?auto_907757 ?auto_907758 ?auto_907759 ?auto_907760 ?auto_907761 ?auto_907756 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_908081 - OBJ
      ?auto_908082 - OBJ
      ?auto_908083 - OBJ
      ?auto_908084 - OBJ
      ?auto_908085 - OBJ
      ?auto_908080 - LOCATION
    )
    :vars
    (
      ?auto_908086 - LOCATION
      ?auto_908087 - CITY
      ?auto_908089 - OBJ
      ?auto_908088 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_908086 ?auto_908087 ) ( IN-CITY ?auto_908080 ?auto_908087 ) ( not ( = ?auto_908080 ?auto_908086 ) ) ( OBJ-AT ?auto_908089 ?auto_908080 ) ( not ( = ?auto_908089 ?auto_908081 ) ) ( OBJ-AT ?auto_908081 ?auto_908086 ) ( TRUCK-AT ?auto_908088 ?auto_908080 ) ( OBJ-AT ?auto_908082 ?auto_908080 ) ( OBJ-AT ?auto_908083 ?auto_908080 ) ( OBJ-AT ?auto_908084 ?auto_908080 ) ( OBJ-AT ?auto_908085 ?auto_908080 ) ( not ( = ?auto_908081 ?auto_908082 ) ) ( not ( = ?auto_908081 ?auto_908083 ) ) ( not ( = ?auto_908081 ?auto_908084 ) ) ( not ( = ?auto_908081 ?auto_908085 ) ) ( not ( = ?auto_908082 ?auto_908083 ) ) ( not ( = ?auto_908082 ?auto_908084 ) ) ( not ( = ?auto_908082 ?auto_908085 ) ) ( not ( = ?auto_908082 ?auto_908089 ) ) ( not ( = ?auto_908083 ?auto_908084 ) ) ( not ( = ?auto_908083 ?auto_908085 ) ) ( not ( = ?auto_908083 ?auto_908089 ) ) ( not ( = ?auto_908084 ?auto_908085 ) ) ( not ( = ?auto_908084 ?auto_908089 ) ) ( not ( = ?auto_908085 ?auto_908089 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_908089 ?auto_908081 ?auto_908080 )
      ( DELIVER-5PKG-VERIFY ?auto_908081 ?auto_908082 ?auto_908083 ?auto_908084 ?auto_908085 ?auto_908080 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_908568 - OBJ
      ?auto_908569 - OBJ
      ?auto_908570 - OBJ
      ?auto_908567 - LOCATION
    )
    :vars
    (
      ?auto_908572 - LOCATION
      ?auto_908571 - CITY
      ?auto_908573 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_908572 ?auto_908571 ) ( IN-CITY ?auto_908567 ?auto_908571 ) ( not ( = ?auto_908567 ?auto_908572 ) ) ( OBJ-AT ?auto_908570 ?auto_908567 ) ( not ( = ?auto_908570 ?auto_908568 ) ) ( OBJ-AT ?auto_908568 ?auto_908572 ) ( TRUCK-AT ?auto_908573 ?auto_908567 ) ( OBJ-AT ?auto_908569 ?auto_908567 ) ( not ( = ?auto_908568 ?auto_908569 ) ) ( not ( = ?auto_908569 ?auto_908570 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_908570 ?auto_908568 ?auto_908567 )
      ( DELIVER-3PKG-VERIFY ?auto_908568 ?auto_908569 ?auto_908570 ?auto_908567 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_911100 - OBJ
      ?auto_911099 - LOCATION
    )
    :vars
    (
      ?auto_911103 - LOCATION
      ?auto_911102 - CITY
      ?auto_911101 - OBJ
      ?auto_911104 - TRUCK
      ?auto_911105 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_911103 ?auto_911102 ) ( IN-CITY ?auto_911099 ?auto_911102 ) ( not ( = ?auto_911099 ?auto_911103 ) ) ( OBJ-AT ?auto_911101 ?auto_911099 ) ( not ( = ?auto_911101 ?auto_911100 ) ) ( OBJ-AT ?auto_911100 ?auto_911103 ) ( TRUCK-AT ?auto_911104 ?auto_911105 ) ( IN-CITY ?auto_911105 ?auto_911102 ) ( not ( = ?auto_911099 ?auto_911105 ) ) ( not ( = ?auto_911103 ?auto_911105 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_911104 ?auto_911105 ?auto_911099 ?auto_911102 )
      ( DELIVER-2PKG ?auto_911101 ?auto_911100 ?auto_911099 )
      ( DELIVER-1PKG-VERIFY ?auto_911100 ?auto_911099 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_911107 - OBJ
      ?auto_911108 - OBJ
      ?auto_911106 - LOCATION
    )
    :vars
    (
      ?auto_911111 - LOCATION
      ?auto_911109 - CITY
      ?auto_911110 - TRUCK
      ?auto_911112 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_911111 ?auto_911109 ) ( IN-CITY ?auto_911106 ?auto_911109 ) ( not ( = ?auto_911106 ?auto_911111 ) ) ( OBJ-AT ?auto_911107 ?auto_911106 ) ( not ( = ?auto_911107 ?auto_911108 ) ) ( OBJ-AT ?auto_911108 ?auto_911111 ) ( TRUCK-AT ?auto_911110 ?auto_911112 ) ( IN-CITY ?auto_911112 ?auto_911109 ) ( not ( = ?auto_911106 ?auto_911112 ) ) ( not ( = ?auto_911111 ?auto_911112 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_911108 ?auto_911106 )
      ( DELIVER-2PKG-VERIFY ?auto_911107 ?auto_911108 ?auto_911106 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_911122 - OBJ
      ?auto_911123 - OBJ
      ?auto_911121 - LOCATION
    )
    :vars
    (
      ?auto_911126 - LOCATION
      ?auto_911125 - CITY
      ?auto_911124 - TRUCK
      ?auto_911127 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_911126 ?auto_911125 ) ( IN-CITY ?auto_911121 ?auto_911125 ) ( not ( = ?auto_911121 ?auto_911126 ) ) ( OBJ-AT ?auto_911123 ?auto_911121 ) ( not ( = ?auto_911123 ?auto_911122 ) ) ( OBJ-AT ?auto_911122 ?auto_911126 ) ( TRUCK-AT ?auto_911124 ?auto_911127 ) ( IN-CITY ?auto_911127 ?auto_911125 ) ( not ( = ?auto_911121 ?auto_911127 ) ) ( not ( = ?auto_911126 ?auto_911127 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_911123 ?auto_911122 ?auto_911121 )
      ( DELIVER-2PKG-VERIFY ?auto_911122 ?auto_911123 ?auto_911121 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_911145 - OBJ
      ?auto_911146 - OBJ
      ?auto_911147 - OBJ
      ?auto_911144 - LOCATION
    )
    :vars
    (
      ?auto_911150 - LOCATION
      ?auto_911149 - CITY
      ?auto_911148 - TRUCK
      ?auto_911151 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_911150 ?auto_911149 ) ( IN-CITY ?auto_911144 ?auto_911149 ) ( not ( = ?auto_911144 ?auto_911150 ) ) ( OBJ-AT ?auto_911145 ?auto_911144 ) ( not ( = ?auto_911145 ?auto_911147 ) ) ( OBJ-AT ?auto_911147 ?auto_911150 ) ( TRUCK-AT ?auto_911148 ?auto_911151 ) ( IN-CITY ?auto_911151 ?auto_911149 ) ( not ( = ?auto_911144 ?auto_911151 ) ) ( not ( = ?auto_911150 ?auto_911151 ) ) ( OBJ-AT ?auto_911146 ?auto_911144 ) ( not ( = ?auto_911145 ?auto_911146 ) ) ( not ( = ?auto_911146 ?auto_911147 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_911145 ?auto_911147 ?auto_911144 )
      ( DELIVER-3PKG-VERIFY ?auto_911145 ?auto_911146 ?auto_911147 ?auto_911144 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_911161 - OBJ
      ?auto_911162 - OBJ
      ?auto_911163 - OBJ
      ?auto_911160 - LOCATION
    )
    :vars
    (
      ?auto_911166 - LOCATION
      ?auto_911165 - CITY
      ?auto_911164 - TRUCK
      ?auto_911167 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_911166 ?auto_911165 ) ( IN-CITY ?auto_911160 ?auto_911165 ) ( not ( = ?auto_911160 ?auto_911166 ) ) ( OBJ-AT ?auto_911163 ?auto_911160 ) ( not ( = ?auto_911163 ?auto_911162 ) ) ( OBJ-AT ?auto_911162 ?auto_911166 ) ( TRUCK-AT ?auto_911164 ?auto_911167 ) ( IN-CITY ?auto_911167 ?auto_911165 ) ( not ( = ?auto_911160 ?auto_911167 ) ) ( not ( = ?auto_911166 ?auto_911167 ) ) ( OBJ-AT ?auto_911161 ?auto_911160 ) ( not ( = ?auto_911161 ?auto_911162 ) ) ( not ( = ?auto_911161 ?auto_911163 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_911163 ?auto_911162 ?auto_911160 )
      ( DELIVER-3PKG-VERIFY ?auto_911161 ?auto_911162 ?auto_911163 ?auto_911160 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_911228 - OBJ
      ?auto_911229 - OBJ
      ?auto_911230 - OBJ
      ?auto_911227 - LOCATION
    )
    :vars
    (
      ?auto_911233 - LOCATION
      ?auto_911232 - CITY
      ?auto_911231 - TRUCK
      ?auto_911234 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_911233 ?auto_911232 ) ( IN-CITY ?auto_911227 ?auto_911232 ) ( not ( = ?auto_911227 ?auto_911233 ) ) ( OBJ-AT ?auto_911230 ?auto_911227 ) ( not ( = ?auto_911230 ?auto_911228 ) ) ( OBJ-AT ?auto_911228 ?auto_911233 ) ( TRUCK-AT ?auto_911231 ?auto_911234 ) ( IN-CITY ?auto_911234 ?auto_911232 ) ( not ( = ?auto_911227 ?auto_911234 ) ) ( not ( = ?auto_911233 ?auto_911234 ) ) ( OBJ-AT ?auto_911229 ?auto_911227 ) ( not ( = ?auto_911228 ?auto_911229 ) ) ( not ( = ?auto_911229 ?auto_911230 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_911230 ?auto_911228 ?auto_911227 )
      ( DELIVER-3PKG-VERIFY ?auto_911228 ?auto_911229 ?auto_911230 ?auto_911227 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_911304 - OBJ
      ?auto_911305 - OBJ
      ?auto_911306 - OBJ
      ?auto_911307 - OBJ
      ?auto_911303 - LOCATION
    )
    :vars
    (
      ?auto_911310 - LOCATION
      ?auto_911309 - CITY
      ?auto_911308 - TRUCK
      ?auto_911311 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_911310 ?auto_911309 ) ( IN-CITY ?auto_911303 ?auto_911309 ) ( not ( = ?auto_911303 ?auto_911310 ) ) ( OBJ-AT ?auto_911305 ?auto_911303 ) ( not ( = ?auto_911305 ?auto_911307 ) ) ( OBJ-AT ?auto_911307 ?auto_911310 ) ( TRUCK-AT ?auto_911308 ?auto_911311 ) ( IN-CITY ?auto_911311 ?auto_911309 ) ( not ( = ?auto_911303 ?auto_911311 ) ) ( not ( = ?auto_911310 ?auto_911311 ) ) ( OBJ-AT ?auto_911304 ?auto_911303 ) ( OBJ-AT ?auto_911306 ?auto_911303 ) ( not ( = ?auto_911304 ?auto_911305 ) ) ( not ( = ?auto_911304 ?auto_911306 ) ) ( not ( = ?auto_911304 ?auto_911307 ) ) ( not ( = ?auto_911305 ?auto_911306 ) ) ( not ( = ?auto_911306 ?auto_911307 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_911305 ?auto_911307 ?auto_911303 )
      ( DELIVER-4PKG-VERIFY ?auto_911304 ?auto_911305 ?auto_911306 ?auto_911307 ?auto_911303 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_911322 - OBJ
      ?auto_911323 - OBJ
      ?auto_911324 - OBJ
      ?auto_911325 - OBJ
      ?auto_911321 - LOCATION
    )
    :vars
    (
      ?auto_911328 - LOCATION
      ?auto_911327 - CITY
      ?auto_911326 - TRUCK
      ?auto_911329 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_911328 ?auto_911327 ) ( IN-CITY ?auto_911321 ?auto_911327 ) ( not ( = ?auto_911321 ?auto_911328 ) ) ( OBJ-AT ?auto_911322 ?auto_911321 ) ( not ( = ?auto_911322 ?auto_911324 ) ) ( OBJ-AT ?auto_911324 ?auto_911328 ) ( TRUCK-AT ?auto_911326 ?auto_911329 ) ( IN-CITY ?auto_911329 ?auto_911327 ) ( not ( = ?auto_911321 ?auto_911329 ) ) ( not ( = ?auto_911328 ?auto_911329 ) ) ( OBJ-AT ?auto_911323 ?auto_911321 ) ( OBJ-AT ?auto_911325 ?auto_911321 ) ( not ( = ?auto_911322 ?auto_911323 ) ) ( not ( = ?auto_911322 ?auto_911325 ) ) ( not ( = ?auto_911323 ?auto_911324 ) ) ( not ( = ?auto_911323 ?auto_911325 ) ) ( not ( = ?auto_911324 ?auto_911325 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_911322 ?auto_911324 ?auto_911321 )
      ( DELIVER-4PKG-VERIFY ?auto_911322 ?auto_911323 ?auto_911324 ?auto_911325 ?auto_911321 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_911394 - OBJ
      ?auto_911395 - OBJ
      ?auto_911396 - OBJ
      ?auto_911397 - OBJ
      ?auto_911393 - LOCATION
    )
    :vars
    (
      ?auto_911400 - LOCATION
      ?auto_911399 - CITY
      ?auto_911398 - TRUCK
      ?auto_911401 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_911400 ?auto_911399 ) ( IN-CITY ?auto_911393 ?auto_911399 ) ( not ( = ?auto_911393 ?auto_911400 ) ) ( OBJ-AT ?auto_911396 ?auto_911393 ) ( not ( = ?auto_911396 ?auto_911395 ) ) ( OBJ-AT ?auto_911395 ?auto_911400 ) ( TRUCK-AT ?auto_911398 ?auto_911401 ) ( IN-CITY ?auto_911401 ?auto_911399 ) ( not ( = ?auto_911393 ?auto_911401 ) ) ( not ( = ?auto_911400 ?auto_911401 ) ) ( OBJ-AT ?auto_911394 ?auto_911393 ) ( OBJ-AT ?auto_911397 ?auto_911393 ) ( not ( = ?auto_911394 ?auto_911395 ) ) ( not ( = ?auto_911394 ?auto_911396 ) ) ( not ( = ?auto_911394 ?auto_911397 ) ) ( not ( = ?auto_911395 ?auto_911397 ) ) ( not ( = ?auto_911396 ?auto_911397 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_911396 ?auto_911395 ?auto_911393 )
      ( DELIVER-4PKG-VERIFY ?auto_911394 ?auto_911395 ?auto_911396 ?auto_911397 ?auto_911393 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_911653 - OBJ
      ?auto_911654 - OBJ
      ?auto_911655 - OBJ
      ?auto_911656 - OBJ
      ?auto_911652 - LOCATION
    )
    :vars
    (
      ?auto_911659 - LOCATION
      ?auto_911658 - CITY
      ?auto_911657 - TRUCK
      ?auto_911660 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_911659 ?auto_911658 ) ( IN-CITY ?auto_911652 ?auto_911658 ) ( not ( = ?auto_911652 ?auto_911659 ) ) ( OBJ-AT ?auto_911655 ?auto_911652 ) ( not ( = ?auto_911655 ?auto_911653 ) ) ( OBJ-AT ?auto_911653 ?auto_911659 ) ( TRUCK-AT ?auto_911657 ?auto_911660 ) ( IN-CITY ?auto_911660 ?auto_911658 ) ( not ( = ?auto_911652 ?auto_911660 ) ) ( not ( = ?auto_911659 ?auto_911660 ) ) ( OBJ-AT ?auto_911654 ?auto_911652 ) ( OBJ-AT ?auto_911656 ?auto_911652 ) ( not ( = ?auto_911653 ?auto_911654 ) ) ( not ( = ?auto_911653 ?auto_911656 ) ) ( not ( = ?auto_911654 ?auto_911655 ) ) ( not ( = ?auto_911654 ?auto_911656 ) ) ( not ( = ?auto_911655 ?auto_911656 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_911655 ?auto_911653 ?auto_911652 )
      ( DELIVER-4PKG-VERIFY ?auto_911653 ?auto_911654 ?auto_911655 ?auto_911656 ?auto_911652 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_911904 - OBJ
      ?auto_911905 - OBJ
      ?auto_911906 - OBJ
      ?auto_911907 - OBJ
      ?auto_911908 - OBJ
      ?auto_911903 - LOCATION
    )
    :vars
    (
      ?auto_911911 - LOCATION
      ?auto_911910 - CITY
      ?auto_911909 - TRUCK
      ?auto_911912 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_911911 ?auto_911910 ) ( IN-CITY ?auto_911903 ?auto_911910 ) ( not ( = ?auto_911903 ?auto_911911 ) ) ( OBJ-AT ?auto_911904 ?auto_911903 ) ( not ( = ?auto_911904 ?auto_911908 ) ) ( OBJ-AT ?auto_911908 ?auto_911911 ) ( TRUCK-AT ?auto_911909 ?auto_911912 ) ( IN-CITY ?auto_911912 ?auto_911910 ) ( not ( = ?auto_911903 ?auto_911912 ) ) ( not ( = ?auto_911911 ?auto_911912 ) ) ( OBJ-AT ?auto_911905 ?auto_911903 ) ( OBJ-AT ?auto_911906 ?auto_911903 ) ( OBJ-AT ?auto_911907 ?auto_911903 ) ( not ( = ?auto_911904 ?auto_911905 ) ) ( not ( = ?auto_911904 ?auto_911906 ) ) ( not ( = ?auto_911904 ?auto_911907 ) ) ( not ( = ?auto_911905 ?auto_911906 ) ) ( not ( = ?auto_911905 ?auto_911907 ) ) ( not ( = ?auto_911905 ?auto_911908 ) ) ( not ( = ?auto_911906 ?auto_911907 ) ) ( not ( = ?auto_911906 ?auto_911908 ) ) ( not ( = ?auto_911907 ?auto_911908 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_911904 ?auto_911908 ?auto_911903 )
      ( DELIVER-5PKG-VERIFY ?auto_911904 ?auto_911905 ?auto_911906 ?auto_911907 ?auto_911908 ?auto_911903 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_911924 - OBJ
      ?auto_911925 - OBJ
      ?auto_911926 - OBJ
      ?auto_911927 - OBJ
      ?auto_911928 - OBJ
      ?auto_911923 - LOCATION
    )
    :vars
    (
      ?auto_911931 - LOCATION
      ?auto_911930 - CITY
      ?auto_911929 - TRUCK
      ?auto_911932 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_911931 ?auto_911930 ) ( IN-CITY ?auto_911923 ?auto_911930 ) ( not ( = ?auto_911923 ?auto_911931 ) ) ( OBJ-AT ?auto_911924 ?auto_911923 ) ( not ( = ?auto_911924 ?auto_911927 ) ) ( OBJ-AT ?auto_911927 ?auto_911931 ) ( TRUCK-AT ?auto_911929 ?auto_911932 ) ( IN-CITY ?auto_911932 ?auto_911930 ) ( not ( = ?auto_911923 ?auto_911932 ) ) ( not ( = ?auto_911931 ?auto_911932 ) ) ( OBJ-AT ?auto_911925 ?auto_911923 ) ( OBJ-AT ?auto_911926 ?auto_911923 ) ( OBJ-AT ?auto_911928 ?auto_911923 ) ( not ( = ?auto_911924 ?auto_911925 ) ) ( not ( = ?auto_911924 ?auto_911926 ) ) ( not ( = ?auto_911924 ?auto_911928 ) ) ( not ( = ?auto_911925 ?auto_911926 ) ) ( not ( = ?auto_911925 ?auto_911927 ) ) ( not ( = ?auto_911925 ?auto_911928 ) ) ( not ( = ?auto_911926 ?auto_911927 ) ) ( not ( = ?auto_911926 ?auto_911928 ) ) ( not ( = ?auto_911927 ?auto_911928 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_911924 ?auto_911927 ?auto_911923 )
      ( DELIVER-5PKG-VERIFY ?auto_911924 ?auto_911925 ?auto_911926 ?auto_911927 ?auto_911928 ?auto_911923 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_912004 - OBJ
      ?auto_912005 - OBJ
      ?auto_912006 - OBJ
      ?auto_912007 - OBJ
      ?auto_912008 - OBJ
      ?auto_912003 - LOCATION
    )
    :vars
    (
      ?auto_912011 - LOCATION
      ?auto_912010 - CITY
      ?auto_912009 - TRUCK
      ?auto_912012 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_912011 ?auto_912010 ) ( IN-CITY ?auto_912003 ?auto_912010 ) ( not ( = ?auto_912003 ?auto_912011 ) ) ( OBJ-AT ?auto_912004 ?auto_912003 ) ( not ( = ?auto_912004 ?auto_912006 ) ) ( OBJ-AT ?auto_912006 ?auto_912011 ) ( TRUCK-AT ?auto_912009 ?auto_912012 ) ( IN-CITY ?auto_912012 ?auto_912010 ) ( not ( = ?auto_912003 ?auto_912012 ) ) ( not ( = ?auto_912011 ?auto_912012 ) ) ( OBJ-AT ?auto_912005 ?auto_912003 ) ( OBJ-AT ?auto_912007 ?auto_912003 ) ( OBJ-AT ?auto_912008 ?auto_912003 ) ( not ( = ?auto_912004 ?auto_912005 ) ) ( not ( = ?auto_912004 ?auto_912007 ) ) ( not ( = ?auto_912004 ?auto_912008 ) ) ( not ( = ?auto_912005 ?auto_912006 ) ) ( not ( = ?auto_912005 ?auto_912007 ) ) ( not ( = ?auto_912005 ?auto_912008 ) ) ( not ( = ?auto_912006 ?auto_912007 ) ) ( not ( = ?auto_912006 ?auto_912008 ) ) ( not ( = ?auto_912007 ?auto_912008 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_912004 ?auto_912006 ?auto_912003 )
      ( DELIVER-5PKG-VERIFY ?auto_912004 ?auto_912005 ?auto_912006 ?auto_912007 ?auto_912008 ?auto_912003 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_912284 - OBJ
      ?auto_912285 - OBJ
      ?auto_912286 - OBJ
      ?auto_912287 - OBJ
      ?auto_912288 - OBJ
      ?auto_912283 - LOCATION
    )
    :vars
    (
      ?auto_912291 - LOCATION
      ?auto_912290 - CITY
      ?auto_912289 - TRUCK
      ?auto_912292 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_912291 ?auto_912290 ) ( IN-CITY ?auto_912283 ?auto_912290 ) ( not ( = ?auto_912283 ?auto_912291 ) ) ( OBJ-AT ?auto_912284 ?auto_912283 ) ( not ( = ?auto_912284 ?auto_912285 ) ) ( OBJ-AT ?auto_912285 ?auto_912291 ) ( TRUCK-AT ?auto_912289 ?auto_912292 ) ( IN-CITY ?auto_912292 ?auto_912290 ) ( not ( = ?auto_912283 ?auto_912292 ) ) ( not ( = ?auto_912291 ?auto_912292 ) ) ( OBJ-AT ?auto_912286 ?auto_912283 ) ( OBJ-AT ?auto_912287 ?auto_912283 ) ( OBJ-AT ?auto_912288 ?auto_912283 ) ( not ( = ?auto_912284 ?auto_912286 ) ) ( not ( = ?auto_912284 ?auto_912287 ) ) ( not ( = ?auto_912284 ?auto_912288 ) ) ( not ( = ?auto_912285 ?auto_912286 ) ) ( not ( = ?auto_912285 ?auto_912287 ) ) ( not ( = ?auto_912285 ?auto_912288 ) ) ( not ( = ?auto_912286 ?auto_912287 ) ) ( not ( = ?auto_912286 ?auto_912288 ) ) ( not ( = ?auto_912287 ?auto_912288 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_912284 ?auto_912285 ?auto_912283 )
      ( DELIVER-5PKG-VERIFY ?auto_912284 ?auto_912285 ?auto_912286 ?auto_912287 ?auto_912288 ?auto_912283 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_913219 - OBJ
      ?auto_913220 - OBJ
      ?auto_913221 - OBJ
      ?auto_913222 - OBJ
      ?auto_913223 - OBJ
      ?auto_913218 - LOCATION
    )
    :vars
    (
      ?auto_913226 - LOCATION
      ?auto_913225 - CITY
      ?auto_913224 - TRUCK
      ?auto_913227 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_913226 ?auto_913225 ) ( IN-CITY ?auto_913218 ?auto_913225 ) ( not ( = ?auto_913218 ?auto_913226 ) ) ( OBJ-AT ?auto_913221 ?auto_913218 ) ( not ( = ?auto_913221 ?auto_913219 ) ) ( OBJ-AT ?auto_913219 ?auto_913226 ) ( TRUCK-AT ?auto_913224 ?auto_913227 ) ( IN-CITY ?auto_913227 ?auto_913225 ) ( not ( = ?auto_913218 ?auto_913227 ) ) ( not ( = ?auto_913226 ?auto_913227 ) ) ( OBJ-AT ?auto_913220 ?auto_913218 ) ( OBJ-AT ?auto_913222 ?auto_913218 ) ( OBJ-AT ?auto_913223 ?auto_913218 ) ( not ( = ?auto_913219 ?auto_913220 ) ) ( not ( = ?auto_913219 ?auto_913222 ) ) ( not ( = ?auto_913219 ?auto_913223 ) ) ( not ( = ?auto_913220 ?auto_913221 ) ) ( not ( = ?auto_913220 ?auto_913222 ) ) ( not ( = ?auto_913220 ?auto_913223 ) ) ( not ( = ?auto_913221 ?auto_913222 ) ) ( not ( = ?auto_913221 ?auto_913223 ) ) ( not ( = ?auto_913222 ?auto_913223 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_913221 ?auto_913219 ?auto_913218 )
      ( DELIVER-5PKG-VERIFY ?auto_913219 ?auto_913220 ?auto_913221 ?auto_913222 ?auto_913223 ?auto_913218 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_914236 - OBJ
      ?auto_914237 - OBJ
      ?auto_914238 - OBJ
      ?auto_914239 - OBJ
      ?auto_914235 - LOCATION
    )
    :vars
    (
      ?auto_914242 - LOCATION
      ?auto_914240 - CITY
      ?auto_914241 - TRUCK
      ?auto_914243 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_914242 ?auto_914240 ) ( IN-CITY ?auto_914235 ?auto_914240 ) ( not ( = ?auto_914235 ?auto_914242 ) ) ( OBJ-AT ?auto_914236 ?auto_914235 ) ( not ( = ?auto_914236 ?auto_914239 ) ) ( OBJ-AT ?auto_914239 ?auto_914242 ) ( TRUCK-AT ?auto_914241 ?auto_914243 ) ( IN-CITY ?auto_914243 ?auto_914240 ) ( not ( = ?auto_914235 ?auto_914243 ) ) ( not ( = ?auto_914242 ?auto_914243 ) ) ( OBJ-AT ?auto_914237 ?auto_914235 ) ( OBJ-AT ?auto_914238 ?auto_914235 ) ( not ( = ?auto_914236 ?auto_914237 ) ) ( not ( = ?auto_914236 ?auto_914238 ) ) ( not ( = ?auto_914237 ?auto_914238 ) ) ( not ( = ?auto_914237 ?auto_914239 ) ) ( not ( = ?auto_914238 ?auto_914239 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_914236 ?auto_914239 ?auto_914235 )
      ( DELIVER-4PKG-VERIFY ?auto_914236 ?auto_914237 ?auto_914238 ?auto_914239 ?auto_914235 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_914254 - OBJ
      ?auto_914255 - OBJ
      ?auto_914256 - OBJ
      ?auto_914257 - OBJ
      ?auto_914253 - LOCATION
    )
    :vars
    (
      ?auto_914260 - LOCATION
      ?auto_914258 - CITY
      ?auto_914259 - TRUCK
      ?auto_914261 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_914260 ?auto_914258 ) ( IN-CITY ?auto_914253 ?auto_914258 ) ( not ( = ?auto_914253 ?auto_914260 ) ) ( OBJ-AT ?auto_914257 ?auto_914253 ) ( not ( = ?auto_914257 ?auto_914256 ) ) ( OBJ-AT ?auto_914256 ?auto_914260 ) ( TRUCK-AT ?auto_914259 ?auto_914261 ) ( IN-CITY ?auto_914261 ?auto_914258 ) ( not ( = ?auto_914253 ?auto_914261 ) ) ( not ( = ?auto_914260 ?auto_914261 ) ) ( OBJ-AT ?auto_914254 ?auto_914253 ) ( OBJ-AT ?auto_914255 ?auto_914253 ) ( not ( = ?auto_914254 ?auto_914255 ) ) ( not ( = ?auto_914254 ?auto_914256 ) ) ( not ( = ?auto_914254 ?auto_914257 ) ) ( not ( = ?auto_914255 ?auto_914256 ) ) ( not ( = ?auto_914255 ?auto_914257 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_914257 ?auto_914256 ?auto_914253 )
      ( DELIVER-4PKG-VERIFY ?auto_914254 ?auto_914255 ?auto_914256 ?auto_914257 ?auto_914253 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_914326 - OBJ
      ?auto_914327 - OBJ
      ?auto_914328 - OBJ
      ?auto_914329 - OBJ
      ?auto_914325 - LOCATION
    )
    :vars
    (
      ?auto_914332 - LOCATION
      ?auto_914330 - CITY
      ?auto_914331 - TRUCK
      ?auto_914333 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_914332 ?auto_914330 ) ( IN-CITY ?auto_914325 ?auto_914330 ) ( not ( = ?auto_914325 ?auto_914332 ) ) ( OBJ-AT ?auto_914326 ?auto_914325 ) ( not ( = ?auto_914326 ?auto_914327 ) ) ( OBJ-AT ?auto_914327 ?auto_914332 ) ( TRUCK-AT ?auto_914331 ?auto_914333 ) ( IN-CITY ?auto_914333 ?auto_914330 ) ( not ( = ?auto_914325 ?auto_914333 ) ) ( not ( = ?auto_914332 ?auto_914333 ) ) ( OBJ-AT ?auto_914328 ?auto_914325 ) ( OBJ-AT ?auto_914329 ?auto_914325 ) ( not ( = ?auto_914326 ?auto_914328 ) ) ( not ( = ?auto_914326 ?auto_914329 ) ) ( not ( = ?auto_914327 ?auto_914328 ) ) ( not ( = ?auto_914327 ?auto_914329 ) ) ( not ( = ?auto_914328 ?auto_914329 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_914326 ?auto_914327 ?auto_914325 )
      ( DELIVER-4PKG-VERIFY ?auto_914326 ?auto_914327 ?auto_914328 ?auto_914329 ?auto_914325 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_914836 - OBJ
      ?auto_914837 - OBJ
      ?auto_914838 - OBJ
      ?auto_914839 - OBJ
      ?auto_914840 - OBJ
      ?auto_914835 - LOCATION
    )
    :vars
    (
      ?auto_914843 - LOCATION
      ?auto_914841 - CITY
      ?auto_914842 - TRUCK
      ?auto_914844 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_914843 ?auto_914841 ) ( IN-CITY ?auto_914835 ?auto_914841 ) ( not ( = ?auto_914835 ?auto_914843 ) ) ( OBJ-AT ?auto_914837 ?auto_914835 ) ( not ( = ?auto_914837 ?auto_914840 ) ) ( OBJ-AT ?auto_914840 ?auto_914843 ) ( TRUCK-AT ?auto_914842 ?auto_914844 ) ( IN-CITY ?auto_914844 ?auto_914841 ) ( not ( = ?auto_914835 ?auto_914844 ) ) ( not ( = ?auto_914843 ?auto_914844 ) ) ( OBJ-AT ?auto_914836 ?auto_914835 ) ( OBJ-AT ?auto_914838 ?auto_914835 ) ( OBJ-AT ?auto_914839 ?auto_914835 ) ( not ( = ?auto_914836 ?auto_914837 ) ) ( not ( = ?auto_914836 ?auto_914838 ) ) ( not ( = ?auto_914836 ?auto_914839 ) ) ( not ( = ?auto_914836 ?auto_914840 ) ) ( not ( = ?auto_914837 ?auto_914838 ) ) ( not ( = ?auto_914837 ?auto_914839 ) ) ( not ( = ?auto_914838 ?auto_914839 ) ) ( not ( = ?auto_914838 ?auto_914840 ) ) ( not ( = ?auto_914839 ?auto_914840 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_914837 ?auto_914840 ?auto_914835 )
      ( DELIVER-5PKG-VERIFY ?auto_914836 ?auto_914837 ?auto_914838 ?auto_914839 ?auto_914840 ?auto_914835 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_914936 - OBJ
      ?auto_914937 - OBJ
      ?auto_914938 - OBJ
      ?auto_914939 - OBJ
      ?auto_914940 - OBJ
      ?auto_914935 - LOCATION
    )
    :vars
    (
      ?auto_914943 - LOCATION
      ?auto_914941 - CITY
      ?auto_914942 - TRUCK
      ?auto_914944 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_914943 ?auto_914941 ) ( IN-CITY ?auto_914935 ?auto_914941 ) ( not ( = ?auto_914935 ?auto_914943 ) ) ( OBJ-AT ?auto_914940 ?auto_914935 ) ( not ( = ?auto_914940 ?auto_914938 ) ) ( OBJ-AT ?auto_914938 ?auto_914943 ) ( TRUCK-AT ?auto_914942 ?auto_914944 ) ( IN-CITY ?auto_914944 ?auto_914941 ) ( not ( = ?auto_914935 ?auto_914944 ) ) ( not ( = ?auto_914943 ?auto_914944 ) ) ( OBJ-AT ?auto_914936 ?auto_914935 ) ( OBJ-AT ?auto_914937 ?auto_914935 ) ( OBJ-AT ?auto_914939 ?auto_914935 ) ( not ( = ?auto_914936 ?auto_914937 ) ) ( not ( = ?auto_914936 ?auto_914938 ) ) ( not ( = ?auto_914936 ?auto_914939 ) ) ( not ( = ?auto_914936 ?auto_914940 ) ) ( not ( = ?auto_914937 ?auto_914938 ) ) ( not ( = ?auto_914937 ?auto_914939 ) ) ( not ( = ?auto_914937 ?auto_914940 ) ) ( not ( = ?auto_914938 ?auto_914939 ) ) ( not ( = ?auto_914939 ?auto_914940 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_914940 ?auto_914938 ?auto_914935 )
      ( DELIVER-5PKG-VERIFY ?auto_914936 ?auto_914937 ?auto_914938 ?auto_914939 ?auto_914940 ?auto_914935 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_952153 - OBJ
      ?auto_952154 - OBJ
      ?auto_952155 - OBJ
      ?auto_952152 - LOCATION
    )
    :vars
    (
      ?auto_952157 - TRUCK
      ?auto_952156 - LOCATION
      ?auto_952158 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_952157 ?auto_952156 ) ( IN-CITY ?auto_952156 ?auto_952158 ) ( IN-CITY ?auto_952152 ?auto_952158 ) ( not ( = ?auto_952152 ?auto_952156 ) ) ( OBJ-AT ?auto_952155 ?auto_952152 ) ( not ( = ?auto_952155 ?auto_952153 ) ) ( OBJ-AT ?auto_952153 ?auto_952156 ) ( OBJ-AT ?auto_952154 ?auto_952152 ) ( not ( = ?auto_952153 ?auto_952154 ) ) ( not ( = ?auto_952154 ?auto_952155 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_952155 ?auto_952153 ?auto_952152 )
      ( DELIVER-3PKG-VERIFY ?auto_952153 ?auto_952154 ?auto_952155 ?auto_952152 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_978826 - OBJ
      ?auto_978827 - OBJ
      ?auto_978828 - OBJ
      ?auto_978825 - LOCATION
    )
    :vars
    (
      ?auto_978830 - LOCATION
      ?auto_978832 - CITY
      ?auto_978831 - TRUCK
      ?auto_978829 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_978830 ?auto_978832 ) ( IN-CITY ?auto_978825 ?auto_978832 ) ( not ( = ?auto_978825 ?auto_978830 ) ) ( OBJ-AT ?auto_978827 ?auto_978825 ) ( not ( = ?auto_978827 ?auto_978828 ) ) ( OBJ-AT ?auto_978828 ?auto_978830 ) ( TRUCK-AT ?auto_978831 ?auto_978829 ) ( IN-CITY ?auto_978829 ?auto_978832 ) ( not ( = ?auto_978825 ?auto_978829 ) ) ( not ( = ?auto_978830 ?auto_978829 ) ) ( OBJ-AT ?auto_978826 ?auto_978825 ) ( not ( = ?auto_978826 ?auto_978827 ) ) ( not ( = ?auto_978826 ?auto_978828 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_978827 ?auto_978828 ?auto_978825 )
      ( DELIVER-3PKG-VERIFY ?auto_978826 ?auto_978827 ?auto_978828 ?auto_978825 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_978846 - OBJ
      ?auto_978847 - OBJ
      ?auto_978848 - OBJ
      ?auto_978845 - LOCATION
    )
    :vars
    (
      ?auto_978850 - LOCATION
      ?auto_978852 - CITY
      ?auto_978851 - TRUCK
      ?auto_978849 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_978850 ?auto_978852 ) ( IN-CITY ?auto_978845 ?auto_978852 ) ( not ( = ?auto_978845 ?auto_978850 ) ) ( OBJ-AT ?auto_978846 ?auto_978845 ) ( not ( = ?auto_978846 ?auto_978847 ) ) ( OBJ-AT ?auto_978847 ?auto_978850 ) ( TRUCK-AT ?auto_978851 ?auto_978849 ) ( IN-CITY ?auto_978849 ?auto_978852 ) ( not ( = ?auto_978845 ?auto_978849 ) ) ( not ( = ?auto_978850 ?auto_978849 ) ) ( OBJ-AT ?auto_978848 ?auto_978845 ) ( not ( = ?auto_978846 ?auto_978848 ) ) ( not ( = ?auto_978847 ?auto_978848 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_978846 ?auto_978847 ?auto_978845 )
      ( DELIVER-3PKG-VERIFY ?auto_978846 ?auto_978847 ?auto_978848 ?auto_978845 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_978878 - OBJ
      ?auto_978879 - OBJ
      ?auto_978880 - OBJ
      ?auto_978877 - LOCATION
    )
    :vars
    (
      ?auto_978883 - LOCATION
      ?auto_978885 - CITY
      ?auto_978882 - OBJ
      ?auto_978884 - TRUCK
      ?auto_978881 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_978883 ?auto_978885 ) ( IN-CITY ?auto_978877 ?auto_978885 ) ( not ( = ?auto_978877 ?auto_978883 ) ) ( OBJ-AT ?auto_978882 ?auto_978877 ) ( not ( = ?auto_978882 ?auto_978880 ) ) ( OBJ-AT ?auto_978880 ?auto_978883 ) ( TRUCK-AT ?auto_978884 ?auto_978881 ) ( IN-CITY ?auto_978881 ?auto_978885 ) ( not ( = ?auto_978877 ?auto_978881 ) ) ( not ( = ?auto_978883 ?auto_978881 ) ) ( OBJ-AT ?auto_978878 ?auto_978877 ) ( OBJ-AT ?auto_978879 ?auto_978877 ) ( not ( = ?auto_978878 ?auto_978879 ) ) ( not ( = ?auto_978878 ?auto_978880 ) ) ( not ( = ?auto_978878 ?auto_978882 ) ) ( not ( = ?auto_978879 ?auto_978880 ) ) ( not ( = ?auto_978879 ?auto_978882 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_978882 ?auto_978880 ?auto_978877 )
      ( DELIVER-3PKG-VERIFY ?auto_978878 ?auto_978879 ?auto_978880 ?auto_978877 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_978900 - OBJ
      ?auto_978901 - OBJ
      ?auto_978902 - OBJ
      ?auto_978899 - LOCATION
    )
    :vars
    (
      ?auto_978905 - LOCATION
      ?auto_978907 - CITY
      ?auto_978904 - OBJ
      ?auto_978906 - TRUCK
      ?auto_978903 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_978905 ?auto_978907 ) ( IN-CITY ?auto_978899 ?auto_978907 ) ( not ( = ?auto_978899 ?auto_978905 ) ) ( OBJ-AT ?auto_978904 ?auto_978899 ) ( not ( = ?auto_978904 ?auto_978901 ) ) ( OBJ-AT ?auto_978901 ?auto_978905 ) ( TRUCK-AT ?auto_978906 ?auto_978903 ) ( IN-CITY ?auto_978903 ?auto_978907 ) ( not ( = ?auto_978899 ?auto_978903 ) ) ( not ( = ?auto_978905 ?auto_978903 ) ) ( OBJ-AT ?auto_978900 ?auto_978899 ) ( OBJ-AT ?auto_978902 ?auto_978899 ) ( not ( = ?auto_978900 ?auto_978901 ) ) ( not ( = ?auto_978900 ?auto_978902 ) ) ( not ( = ?auto_978900 ?auto_978904 ) ) ( not ( = ?auto_978901 ?auto_978902 ) ) ( not ( = ?auto_978902 ?auto_978904 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_978904 ?auto_978901 ?auto_978899 )
      ( DELIVER-3PKG-VERIFY ?auto_978900 ?auto_978901 ?auto_978902 ?auto_978899 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_979020 - OBJ
      ?auto_979021 - OBJ
      ?auto_979022 - OBJ
      ?auto_979019 - LOCATION
    )
    :vars
    (
      ?auto_979025 - LOCATION
      ?auto_979027 - CITY
      ?auto_979024 - OBJ
      ?auto_979026 - TRUCK
      ?auto_979023 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_979025 ?auto_979027 ) ( IN-CITY ?auto_979019 ?auto_979027 ) ( not ( = ?auto_979019 ?auto_979025 ) ) ( OBJ-AT ?auto_979024 ?auto_979019 ) ( not ( = ?auto_979024 ?auto_979020 ) ) ( OBJ-AT ?auto_979020 ?auto_979025 ) ( TRUCK-AT ?auto_979026 ?auto_979023 ) ( IN-CITY ?auto_979023 ?auto_979027 ) ( not ( = ?auto_979019 ?auto_979023 ) ) ( not ( = ?auto_979025 ?auto_979023 ) ) ( OBJ-AT ?auto_979021 ?auto_979019 ) ( OBJ-AT ?auto_979022 ?auto_979019 ) ( not ( = ?auto_979020 ?auto_979021 ) ) ( not ( = ?auto_979020 ?auto_979022 ) ) ( not ( = ?auto_979021 ?auto_979022 ) ) ( not ( = ?auto_979021 ?auto_979024 ) ) ( not ( = ?auto_979022 ?auto_979024 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_979024 ?auto_979020 ?auto_979019 )
      ( DELIVER-3PKG-VERIFY ?auto_979020 ?auto_979021 ?auto_979022 ?auto_979019 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_979153 - OBJ
      ?auto_979154 - OBJ
      ?auto_979155 - OBJ
      ?auto_979156 - OBJ
      ?auto_979152 - LOCATION
    )
    :vars
    (
      ?auto_979158 - LOCATION
      ?auto_979160 - CITY
      ?auto_979159 - TRUCK
      ?auto_979157 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_979158 ?auto_979160 ) ( IN-CITY ?auto_979152 ?auto_979160 ) ( not ( = ?auto_979152 ?auto_979158 ) ) ( OBJ-AT ?auto_979154 ?auto_979152 ) ( not ( = ?auto_979154 ?auto_979155 ) ) ( OBJ-AT ?auto_979155 ?auto_979158 ) ( TRUCK-AT ?auto_979159 ?auto_979157 ) ( IN-CITY ?auto_979157 ?auto_979160 ) ( not ( = ?auto_979152 ?auto_979157 ) ) ( not ( = ?auto_979158 ?auto_979157 ) ) ( OBJ-AT ?auto_979153 ?auto_979152 ) ( OBJ-AT ?auto_979156 ?auto_979152 ) ( not ( = ?auto_979153 ?auto_979154 ) ) ( not ( = ?auto_979153 ?auto_979155 ) ) ( not ( = ?auto_979153 ?auto_979156 ) ) ( not ( = ?auto_979154 ?auto_979156 ) ) ( not ( = ?auto_979155 ?auto_979156 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_979154 ?auto_979155 ?auto_979152 )
      ( DELIVER-4PKG-VERIFY ?auto_979153 ?auto_979154 ?auto_979155 ?auto_979156 ?auto_979152 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_979180 - OBJ
      ?auto_979181 - OBJ
      ?auto_979182 - OBJ
      ?auto_979183 - OBJ
      ?auto_979179 - LOCATION
    )
    :vars
    (
      ?auto_979185 - LOCATION
      ?auto_979187 - CITY
      ?auto_979186 - TRUCK
      ?auto_979184 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_979185 ?auto_979187 ) ( IN-CITY ?auto_979179 ?auto_979187 ) ( not ( = ?auto_979179 ?auto_979185 ) ) ( OBJ-AT ?auto_979182 ?auto_979179 ) ( not ( = ?auto_979182 ?auto_979183 ) ) ( OBJ-AT ?auto_979183 ?auto_979185 ) ( TRUCK-AT ?auto_979186 ?auto_979184 ) ( IN-CITY ?auto_979184 ?auto_979187 ) ( not ( = ?auto_979179 ?auto_979184 ) ) ( not ( = ?auto_979185 ?auto_979184 ) ) ( OBJ-AT ?auto_979180 ?auto_979179 ) ( OBJ-AT ?auto_979181 ?auto_979179 ) ( not ( = ?auto_979180 ?auto_979181 ) ) ( not ( = ?auto_979180 ?auto_979182 ) ) ( not ( = ?auto_979180 ?auto_979183 ) ) ( not ( = ?auto_979181 ?auto_979182 ) ) ( not ( = ?auto_979181 ?auto_979183 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_979182 ?auto_979183 ?auto_979179 )
      ( DELIVER-4PKG-VERIFY ?auto_979180 ?auto_979181 ?auto_979182 ?auto_979183 ?auto_979179 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_979522 - OBJ
      ?auto_979523 - OBJ
      ?auto_979524 - OBJ
      ?auto_979525 - OBJ
      ?auto_979521 - LOCATION
    )
    :vars
    (
      ?auto_979528 - LOCATION
      ?auto_979530 - CITY
      ?auto_979527 - OBJ
      ?auto_979529 - TRUCK
      ?auto_979526 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_979528 ?auto_979530 ) ( IN-CITY ?auto_979521 ?auto_979530 ) ( not ( = ?auto_979521 ?auto_979528 ) ) ( OBJ-AT ?auto_979527 ?auto_979521 ) ( not ( = ?auto_979527 ?auto_979525 ) ) ( OBJ-AT ?auto_979525 ?auto_979528 ) ( TRUCK-AT ?auto_979529 ?auto_979526 ) ( IN-CITY ?auto_979526 ?auto_979530 ) ( not ( = ?auto_979521 ?auto_979526 ) ) ( not ( = ?auto_979528 ?auto_979526 ) ) ( OBJ-AT ?auto_979522 ?auto_979521 ) ( OBJ-AT ?auto_979523 ?auto_979521 ) ( OBJ-AT ?auto_979524 ?auto_979521 ) ( not ( = ?auto_979522 ?auto_979523 ) ) ( not ( = ?auto_979522 ?auto_979524 ) ) ( not ( = ?auto_979522 ?auto_979525 ) ) ( not ( = ?auto_979522 ?auto_979527 ) ) ( not ( = ?auto_979523 ?auto_979524 ) ) ( not ( = ?auto_979523 ?auto_979525 ) ) ( not ( = ?auto_979523 ?auto_979527 ) ) ( not ( = ?auto_979524 ?auto_979525 ) ) ( not ( = ?auto_979524 ?auto_979527 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_979527 ?auto_979525 ?auto_979521 )
      ( DELIVER-4PKG-VERIFY ?auto_979522 ?auto_979523 ?auto_979524 ?auto_979525 ?auto_979521 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_979551 - OBJ
      ?auto_979552 - OBJ
      ?auto_979553 - OBJ
      ?auto_979554 - OBJ
      ?auto_979550 - LOCATION
    )
    :vars
    (
      ?auto_979557 - LOCATION
      ?auto_979559 - CITY
      ?auto_979556 - OBJ
      ?auto_979558 - TRUCK
      ?auto_979555 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_979557 ?auto_979559 ) ( IN-CITY ?auto_979550 ?auto_979559 ) ( not ( = ?auto_979550 ?auto_979557 ) ) ( OBJ-AT ?auto_979556 ?auto_979550 ) ( not ( = ?auto_979556 ?auto_979553 ) ) ( OBJ-AT ?auto_979553 ?auto_979557 ) ( TRUCK-AT ?auto_979558 ?auto_979555 ) ( IN-CITY ?auto_979555 ?auto_979559 ) ( not ( = ?auto_979550 ?auto_979555 ) ) ( not ( = ?auto_979557 ?auto_979555 ) ) ( OBJ-AT ?auto_979551 ?auto_979550 ) ( OBJ-AT ?auto_979552 ?auto_979550 ) ( OBJ-AT ?auto_979554 ?auto_979550 ) ( not ( = ?auto_979551 ?auto_979552 ) ) ( not ( = ?auto_979551 ?auto_979553 ) ) ( not ( = ?auto_979551 ?auto_979554 ) ) ( not ( = ?auto_979551 ?auto_979556 ) ) ( not ( = ?auto_979552 ?auto_979553 ) ) ( not ( = ?auto_979552 ?auto_979554 ) ) ( not ( = ?auto_979552 ?auto_979556 ) ) ( not ( = ?auto_979553 ?auto_979554 ) ) ( not ( = ?auto_979554 ?auto_979556 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_979556 ?auto_979553 ?auto_979550 )
      ( DELIVER-4PKG-VERIFY ?auto_979551 ?auto_979552 ?auto_979553 ?auto_979554 ?auto_979550 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_979685 - OBJ
      ?auto_979686 - OBJ
      ?auto_979687 - OBJ
      ?auto_979688 - OBJ
      ?auto_979684 - LOCATION
    )
    :vars
    (
      ?auto_979690 - LOCATION
      ?auto_979692 - CITY
      ?auto_979691 - TRUCK
      ?auto_979689 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_979690 ?auto_979692 ) ( IN-CITY ?auto_979684 ?auto_979692 ) ( not ( = ?auto_979684 ?auto_979690 ) ) ( OBJ-AT ?auto_979688 ?auto_979684 ) ( not ( = ?auto_979688 ?auto_979686 ) ) ( OBJ-AT ?auto_979686 ?auto_979690 ) ( TRUCK-AT ?auto_979691 ?auto_979689 ) ( IN-CITY ?auto_979689 ?auto_979692 ) ( not ( = ?auto_979684 ?auto_979689 ) ) ( not ( = ?auto_979690 ?auto_979689 ) ) ( OBJ-AT ?auto_979685 ?auto_979684 ) ( OBJ-AT ?auto_979687 ?auto_979684 ) ( not ( = ?auto_979685 ?auto_979686 ) ) ( not ( = ?auto_979685 ?auto_979687 ) ) ( not ( = ?auto_979685 ?auto_979688 ) ) ( not ( = ?auto_979686 ?auto_979687 ) ) ( not ( = ?auto_979687 ?auto_979688 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_979688 ?auto_979686 ?auto_979684 )
      ( DELIVER-4PKG-VERIFY ?auto_979685 ?auto_979686 ?auto_979687 ?auto_979688 ?auto_979684 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_979694 - OBJ
      ?auto_979695 - OBJ
      ?auto_979696 - OBJ
      ?auto_979697 - OBJ
      ?auto_979693 - LOCATION
    )
    :vars
    (
      ?auto_979700 - LOCATION
      ?auto_979702 - CITY
      ?auto_979699 - OBJ
      ?auto_979701 - TRUCK
      ?auto_979698 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_979700 ?auto_979702 ) ( IN-CITY ?auto_979693 ?auto_979702 ) ( not ( = ?auto_979693 ?auto_979700 ) ) ( OBJ-AT ?auto_979699 ?auto_979693 ) ( not ( = ?auto_979699 ?auto_979695 ) ) ( OBJ-AT ?auto_979695 ?auto_979700 ) ( TRUCK-AT ?auto_979701 ?auto_979698 ) ( IN-CITY ?auto_979698 ?auto_979702 ) ( not ( = ?auto_979693 ?auto_979698 ) ) ( not ( = ?auto_979700 ?auto_979698 ) ) ( OBJ-AT ?auto_979694 ?auto_979693 ) ( OBJ-AT ?auto_979696 ?auto_979693 ) ( OBJ-AT ?auto_979697 ?auto_979693 ) ( not ( = ?auto_979694 ?auto_979695 ) ) ( not ( = ?auto_979694 ?auto_979696 ) ) ( not ( = ?auto_979694 ?auto_979697 ) ) ( not ( = ?auto_979694 ?auto_979699 ) ) ( not ( = ?auto_979695 ?auto_979696 ) ) ( not ( = ?auto_979695 ?auto_979697 ) ) ( not ( = ?auto_979696 ?auto_979697 ) ) ( not ( = ?auto_979696 ?auto_979699 ) ) ( not ( = ?auto_979697 ?auto_979699 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_979699 ?auto_979695 ?auto_979693 )
      ( DELIVER-4PKG-VERIFY ?auto_979694 ?auto_979695 ?auto_979696 ?auto_979697 ?auto_979693 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_980190 - OBJ
      ?auto_980191 - OBJ
      ?auto_980192 - OBJ
      ?auto_980193 - OBJ
      ?auto_980189 - LOCATION
    )
    :vars
    (
      ?auto_980195 - LOCATION
      ?auto_980197 - CITY
      ?auto_980196 - TRUCK
      ?auto_980194 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_980195 ?auto_980197 ) ( IN-CITY ?auto_980189 ?auto_980197 ) ( not ( = ?auto_980189 ?auto_980195 ) ) ( OBJ-AT ?auto_980191 ?auto_980189 ) ( not ( = ?auto_980191 ?auto_980190 ) ) ( OBJ-AT ?auto_980190 ?auto_980195 ) ( TRUCK-AT ?auto_980196 ?auto_980194 ) ( IN-CITY ?auto_980194 ?auto_980197 ) ( not ( = ?auto_980189 ?auto_980194 ) ) ( not ( = ?auto_980195 ?auto_980194 ) ) ( OBJ-AT ?auto_980192 ?auto_980189 ) ( OBJ-AT ?auto_980193 ?auto_980189 ) ( not ( = ?auto_980190 ?auto_980192 ) ) ( not ( = ?auto_980190 ?auto_980193 ) ) ( not ( = ?auto_980191 ?auto_980192 ) ) ( not ( = ?auto_980191 ?auto_980193 ) ) ( not ( = ?auto_980192 ?auto_980193 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_980191 ?auto_980190 ?auto_980189 )
      ( DELIVER-4PKG-VERIFY ?auto_980190 ?auto_980191 ?auto_980192 ?auto_980193 ?auto_980189 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_980298 - OBJ
      ?auto_980299 - OBJ
      ?auto_980300 - OBJ
      ?auto_980301 - OBJ
      ?auto_980297 - LOCATION
    )
    :vars
    (
      ?auto_980303 - LOCATION
      ?auto_980305 - CITY
      ?auto_980304 - TRUCK
      ?auto_980302 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_980303 ?auto_980305 ) ( IN-CITY ?auto_980297 ?auto_980305 ) ( not ( = ?auto_980297 ?auto_980303 ) ) ( OBJ-AT ?auto_980301 ?auto_980297 ) ( not ( = ?auto_980301 ?auto_980298 ) ) ( OBJ-AT ?auto_980298 ?auto_980303 ) ( TRUCK-AT ?auto_980304 ?auto_980302 ) ( IN-CITY ?auto_980302 ?auto_980305 ) ( not ( = ?auto_980297 ?auto_980302 ) ) ( not ( = ?auto_980303 ?auto_980302 ) ) ( OBJ-AT ?auto_980299 ?auto_980297 ) ( OBJ-AT ?auto_980300 ?auto_980297 ) ( not ( = ?auto_980298 ?auto_980299 ) ) ( not ( = ?auto_980298 ?auto_980300 ) ) ( not ( = ?auto_980299 ?auto_980300 ) ) ( not ( = ?auto_980299 ?auto_980301 ) ) ( not ( = ?auto_980300 ?auto_980301 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_980301 ?auto_980298 ?auto_980297 )
      ( DELIVER-4PKG-VERIFY ?auto_980298 ?auto_980299 ?auto_980300 ?auto_980301 ?auto_980297 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_980343 - OBJ
      ?auto_980344 - OBJ
      ?auto_980345 - OBJ
      ?auto_980346 - OBJ
      ?auto_980342 - LOCATION
    )
    :vars
    (
      ?auto_980349 - LOCATION
      ?auto_980351 - CITY
      ?auto_980348 - OBJ
      ?auto_980350 - TRUCK
      ?auto_980347 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_980349 ?auto_980351 ) ( IN-CITY ?auto_980342 ?auto_980351 ) ( not ( = ?auto_980342 ?auto_980349 ) ) ( OBJ-AT ?auto_980348 ?auto_980342 ) ( not ( = ?auto_980348 ?auto_980343 ) ) ( OBJ-AT ?auto_980343 ?auto_980349 ) ( TRUCK-AT ?auto_980350 ?auto_980347 ) ( IN-CITY ?auto_980347 ?auto_980351 ) ( not ( = ?auto_980342 ?auto_980347 ) ) ( not ( = ?auto_980349 ?auto_980347 ) ) ( OBJ-AT ?auto_980344 ?auto_980342 ) ( OBJ-AT ?auto_980345 ?auto_980342 ) ( OBJ-AT ?auto_980346 ?auto_980342 ) ( not ( = ?auto_980343 ?auto_980344 ) ) ( not ( = ?auto_980343 ?auto_980345 ) ) ( not ( = ?auto_980343 ?auto_980346 ) ) ( not ( = ?auto_980344 ?auto_980345 ) ) ( not ( = ?auto_980344 ?auto_980346 ) ) ( not ( = ?auto_980344 ?auto_980348 ) ) ( not ( = ?auto_980345 ?auto_980346 ) ) ( not ( = ?auto_980345 ?auto_980348 ) ) ( not ( = ?auto_980346 ?auto_980348 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_980348 ?auto_980343 ?auto_980342 )
      ( DELIVER-4PKG-VERIFY ?auto_980343 ?auto_980344 ?auto_980345 ?auto_980346 ?auto_980342 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_980767 - OBJ
      ?auto_980768 - OBJ
      ?auto_980769 - OBJ
      ?auto_980770 - OBJ
      ?auto_980771 - OBJ
      ?auto_980766 - LOCATION
    )
    :vars
    (
      ?auto_980773 - LOCATION
      ?auto_980775 - CITY
      ?auto_980774 - TRUCK
      ?auto_980772 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_980773 ?auto_980775 ) ( IN-CITY ?auto_980766 ?auto_980775 ) ( not ( = ?auto_980766 ?auto_980773 ) ) ( OBJ-AT ?auto_980769 ?auto_980766 ) ( not ( = ?auto_980769 ?auto_980771 ) ) ( OBJ-AT ?auto_980771 ?auto_980773 ) ( TRUCK-AT ?auto_980774 ?auto_980772 ) ( IN-CITY ?auto_980772 ?auto_980775 ) ( not ( = ?auto_980766 ?auto_980772 ) ) ( not ( = ?auto_980773 ?auto_980772 ) ) ( OBJ-AT ?auto_980767 ?auto_980766 ) ( OBJ-AT ?auto_980768 ?auto_980766 ) ( OBJ-AT ?auto_980770 ?auto_980766 ) ( not ( = ?auto_980767 ?auto_980768 ) ) ( not ( = ?auto_980767 ?auto_980769 ) ) ( not ( = ?auto_980767 ?auto_980770 ) ) ( not ( = ?auto_980767 ?auto_980771 ) ) ( not ( = ?auto_980768 ?auto_980769 ) ) ( not ( = ?auto_980768 ?auto_980770 ) ) ( not ( = ?auto_980768 ?auto_980771 ) ) ( not ( = ?auto_980769 ?auto_980770 ) ) ( not ( = ?auto_980770 ?auto_980771 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_980769 ?auto_980771 ?auto_980766 )
      ( DELIVER-5PKG-VERIFY ?auto_980767 ?auto_980768 ?auto_980769 ?auto_980770 ?auto_980771 ?auto_980766 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_980787 - OBJ
      ?auto_980788 - OBJ
      ?auto_980789 - OBJ
      ?auto_980790 - OBJ
      ?auto_980791 - OBJ
      ?auto_980786 - LOCATION
    )
    :vars
    (
      ?auto_980793 - LOCATION
      ?auto_980795 - CITY
      ?auto_980794 - TRUCK
      ?auto_980792 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_980793 ?auto_980795 ) ( IN-CITY ?auto_980786 ?auto_980795 ) ( not ( = ?auto_980786 ?auto_980793 ) ) ( OBJ-AT ?auto_980788 ?auto_980786 ) ( not ( = ?auto_980788 ?auto_980790 ) ) ( OBJ-AT ?auto_980790 ?auto_980793 ) ( TRUCK-AT ?auto_980794 ?auto_980792 ) ( IN-CITY ?auto_980792 ?auto_980795 ) ( not ( = ?auto_980786 ?auto_980792 ) ) ( not ( = ?auto_980793 ?auto_980792 ) ) ( OBJ-AT ?auto_980787 ?auto_980786 ) ( OBJ-AT ?auto_980789 ?auto_980786 ) ( OBJ-AT ?auto_980791 ?auto_980786 ) ( not ( = ?auto_980787 ?auto_980788 ) ) ( not ( = ?auto_980787 ?auto_980789 ) ) ( not ( = ?auto_980787 ?auto_980790 ) ) ( not ( = ?auto_980787 ?auto_980791 ) ) ( not ( = ?auto_980788 ?auto_980789 ) ) ( not ( = ?auto_980788 ?auto_980791 ) ) ( not ( = ?auto_980789 ?auto_980790 ) ) ( not ( = ?auto_980789 ?auto_980791 ) ) ( not ( = ?auto_980790 ?auto_980791 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_980788 ?auto_980790 ?auto_980786 )
      ( DELIVER-5PKG-VERIFY ?auto_980787 ?auto_980788 ?auto_980789 ?auto_980790 ?auto_980791 ?auto_980786 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_980797 - OBJ
      ?auto_980798 - OBJ
      ?auto_980799 - OBJ
      ?auto_980800 - OBJ
      ?auto_980801 - OBJ
      ?auto_980796 - LOCATION
    )
    :vars
    (
      ?auto_980803 - LOCATION
      ?auto_980805 - CITY
      ?auto_980804 - TRUCK
      ?auto_980802 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_980803 ?auto_980805 ) ( IN-CITY ?auto_980796 ?auto_980805 ) ( not ( = ?auto_980796 ?auto_980803 ) ) ( OBJ-AT ?auto_980799 ?auto_980796 ) ( not ( = ?auto_980799 ?auto_980800 ) ) ( OBJ-AT ?auto_980800 ?auto_980803 ) ( TRUCK-AT ?auto_980804 ?auto_980802 ) ( IN-CITY ?auto_980802 ?auto_980805 ) ( not ( = ?auto_980796 ?auto_980802 ) ) ( not ( = ?auto_980803 ?auto_980802 ) ) ( OBJ-AT ?auto_980797 ?auto_980796 ) ( OBJ-AT ?auto_980798 ?auto_980796 ) ( OBJ-AT ?auto_980801 ?auto_980796 ) ( not ( = ?auto_980797 ?auto_980798 ) ) ( not ( = ?auto_980797 ?auto_980799 ) ) ( not ( = ?auto_980797 ?auto_980800 ) ) ( not ( = ?auto_980797 ?auto_980801 ) ) ( not ( = ?auto_980798 ?auto_980799 ) ) ( not ( = ?auto_980798 ?auto_980800 ) ) ( not ( = ?auto_980798 ?auto_980801 ) ) ( not ( = ?auto_980799 ?auto_980801 ) ) ( not ( = ?auto_980800 ?auto_980801 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_980799 ?auto_980800 ?auto_980796 )
      ( DELIVER-5PKG-VERIFY ?auto_980797 ?auto_980798 ?auto_980799 ?auto_980800 ?auto_980801 ?auto_980796 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_980827 - OBJ
      ?auto_980828 - OBJ
      ?auto_980829 - OBJ
      ?auto_980830 - OBJ
      ?auto_980831 - OBJ
      ?auto_980826 - LOCATION
    )
    :vars
    (
      ?auto_980833 - LOCATION
      ?auto_980835 - CITY
      ?auto_980834 - TRUCK
      ?auto_980832 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_980833 ?auto_980835 ) ( IN-CITY ?auto_980826 ?auto_980835 ) ( not ( = ?auto_980826 ?auto_980833 ) ) ( OBJ-AT ?auto_980830 ?auto_980826 ) ( not ( = ?auto_980830 ?auto_980831 ) ) ( OBJ-AT ?auto_980831 ?auto_980833 ) ( TRUCK-AT ?auto_980834 ?auto_980832 ) ( IN-CITY ?auto_980832 ?auto_980835 ) ( not ( = ?auto_980826 ?auto_980832 ) ) ( not ( = ?auto_980833 ?auto_980832 ) ) ( OBJ-AT ?auto_980827 ?auto_980826 ) ( OBJ-AT ?auto_980828 ?auto_980826 ) ( OBJ-AT ?auto_980829 ?auto_980826 ) ( not ( = ?auto_980827 ?auto_980828 ) ) ( not ( = ?auto_980827 ?auto_980829 ) ) ( not ( = ?auto_980827 ?auto_980830 ) ) ( not ( = ?auto_980827 ?auto_980831 ) ) ( not ( = ?auto_980828 ?auto_980829 ) ) ( not ( = ?auto_980828 ?auto_980830 ) ) ( not ( = ?auto_980828 ?auto_980831 ) ) ( not ( = ?auto_980829 ?auto_980830 ) ) ( not ( = ?auto_980829 ?auto_980831 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_980830 ?auto_980831 ?auto_980826 )
      ( DELIVER-5PKG-VERIFY ?auto_980827 ?auto_980828 ?auto_980829 ?auto_980830 ?auto_980831 ?auto_980826 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_980977 - OBJ
      ?auto_980978 - OBJ
      ?auto_980979 - OBJ
      ?auto_980980 - OBJ
      ?auto_980981 - OBJ
      ?auto_980976 - LOCATION
    )
    :vars
    (
      ?auto_980983 - LOCATION
      ?auto_980985 - CITY
      ?auto_980984 - TRUCK
      ?auto_980982 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_980983 ?auto_980985 ) ( IN-CITY ?auto_980976 ?auto_980985 ) ( not ( = ?auto_980976 ?auto_980983 ) ) ( OBJ-AT ?auto_980980 ?auto_980976 ) ( not ( = ?auto_980980 ?auto_980979 ) ) ( OBJ-AT ?auto_980979 ?auto_980983 ) ( TRUCK-AT ?auto_980984 ?auto_980982 ) ( IN-CITY ?auto_980982 ?auto_980985 ) ( not ( = ?auto_980976 ?auto_980982 ) ) ( not ( = ?auto_980983 ?auto_980982 ) ) ( OBJ-AT ?auto_980977 ?auto_980976 ) ( OBJ-AT ?auto_980978 ?auto_980976 ) ( OBJ-AT ?auto_980981 ?auto_980976 ) ( not ( = ?auto_980977 ?auto_980978 ) ) ( not ( = ?auto_980977 ?auto_980979 ) ) ( not ( = ?auto_980977 ?auto_980980 ) ) ( not ( = ?auto_980977 ?auto_980981 ) ) ( not ( = ?auto_980978 ?auto_980979 ) ) ( not ( = ?auto_980978 ?auto_980980 ) ) ( not ( = ?auto_980978 ?auto_980981 ) ) ( not ( = ?auto_980979 ?auto_980981 ) ) ( not ( = ?auto_980980 ?auto_980981 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_980980 ?auto_980979 ?auto_980976 )
      ( DELIVER-5PKG-VERIFY ?auto_980977 ?auto_980978 ?auto_980979 ?auto_980980 ?auto_980981 ?auto_980976 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_981017 - OBJ
      ?auto_981018 - OBJ
      ?auto_981019 - OBJ
      ?auto_981020 - OBJ
      ?auto_981021 - OBJ
      ?auto_981016 - LOCATION
    )
    :vars
    (
      ?auto_981023 - LOCATION
      ?auto_981025 - CITY
      ?auto_981024 - TRUCK
      ?auto_981022 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_981023 ?auto_981025 ) ( IN-CITY ?auto_981016 ?auto_981025 ) ( not ( = ?auto_981016 ?auto_981023 ) ) ( OBJ-AT ?auto_981018 ?auto_981016 ) ( not ( = ?auto_981018 ?auto_981019 ) ) ( OBJ-AT ?auto_981019 ?auto_981023 ) ( TRUCK-AT ?auto_981024 ?auto_981022 ) ( IN-CITY ?auto_981022 ?auto_981025 ) ( not ( = ?auto_981016 ?auto_981022 ) ) ( not ( = ?auto_981023 ?auto_981022 ) ) ( OBJ-AT ?auto_981017 ?auto_981016 ) ( OBJ-AT ?auto_981020 ?auto_981016 ) ( OBJ-AT ?auto_981021 ?auto_981016 ) ( not ( = ?auto_981017 ?auto_981018 ) ) ( not ( = ?auto_981017 ?auto_981019 ) ) ( not ( = ?auto_981017 ?auto_981020 ) ) ( not ( = ?auto_981017 ?auto_981021 ) ) ( not ( = ?auto_981018 ?auto_981020 ) ) ( not ( = ?auto_981018 ?auto_981021 ) ) ( not ( = ?auto_981019 ?auto_981020 ) ) ( not ( = ?auto_981019 ?auto_981021 ) ) ( not ( = ?auto_981020 ?auto_981021 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_981018 ?auto_981019 ?auto_981016 )
      ( DELIVER-5PKG-VERIFY ?auto_981017 ?auto_981018 ?auto_981019 ?auto_981020 ?auto_981021 ?auto_981016 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_981227 - OBJ
      ?auto_981228 - OBJ
      ?auto_981229 - OBJ
      ?auto_981230 - OBJ
      ?auto_981231 - OBJ
      ?auto_981226 - LOCATION
    )
    :vars
    (
      ?auto_981233 - LOCATION
      ?auto_981235 - CITY
      ?auto_981234 - TRUCK
      ?auto_981232 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_981233 ?auto_981235 ) ( IN-CITY ?auto_981226 ?auto_981235 ) ( not ( = ?auto_981226 ?auto_981233 ) ) ( OBJ-AT ?auto_981231 ?auto_981226 ) ( not ( = ?auto_981231 ?auto_981230 ) ) ( OBJ-AT ?auto_981230 ?auto_981233 ) ( TRUCK-AT ?auto_981234 ?auto_981232 ) ( IN-CITY ?auto_981232 ?auto_981235 ) ( not ( = ?auto_981226 ?auto_981232 ) ) ( not ( = ?auto_981233 ?auto_981232 ) ) ( OBJ-AT ?auto_981227 ?auto_981226 ) ( OBJ-AT ?auto_981228 ?auto_981226 ) ( OBJ-AT ?auto_981229 ?auto_981226 ) ( not ( = ?auto_981227 ?auto_981228 ) ) ( not ( = ?auto_981227 ?auto_981229 ) ) ( not ( = ?auto_981227 ?auto_981230 ) ) ( not ( = ?auto_981227 ?auto_981231 ) ) ( not ( = ?auto_981228 ?auto_981229 ) ) ( not ( = ?auto_981228 ?auto_981230 ) ) ( not ( = ?auto_981228 ?auto_981231 ) ) ( not ( = ?auto_981229 ?auto_981230 ) ) ( not ( = ?auto_981229 ?auto_981231 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_981231 ?auto_981230 ?auto_981226 )
      ( DELIVER-5PKG-VERIFY ?auto_981227 ?auto_981228 ?auto_981229 ?auto_981230 ?auto_981231 ?auto_981226 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_981877 - OBJ
      ?auto_981878 - OBJ
      ?auto_981879 - OBJ
      ?auto_981880 - OBJ
      ?auto_981881 - OBJ
      ?auto_981876 - LOCATION
    )
    :vars
    (
      ?auto_981883 - LOCATION
      ?auto_981885 - CITY
      ?auto_981884 - TRUCK
      ?auto_981882 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_981883 ?auto_981885 ) ( IN-CITY ?auto_981876 ?auto_981885 ) ( not ( = ?auto_981876 ?auto_981883 ) ) ( OBJ-AT ?auto_981879 ?auto_981876 ) ( not ( = ?auto_981879 ?auto_981878 ) ) ( OBJ-AT ?auto_981878 ?auto_981883 ) ( TRUCK-AT ?auto_981884 ?auto_981882 ) ( IN-CITY ?auto_981882 ?auto_981885 ) ( not ( = ?auto_981876 ?auto_981882 ) ) ( not ( = ?auto_981883 ?auto_981882 ) ) ( OBJ-AT ?auto_981877 ?auto_981876 ) ( OBJ-AT ?auto_981880 ?auto_981876 ) ( OBJ-AT ?auto_981881 ?auto_981876 ) ( not ( = ?auto_981877 ?auto_981878 ) ) ( not ( = ?auto_981877 ?auto_981879 ) ) ( not ( = ?auto_981877 ?auto_981880 ) ) ( not ( = ?auto_981877 ?auto_981881 ) ) ( not ( = ?auto_981878 ?auto_981880 ) ) ( not ( = ?auto_981878 ?auto_981881 ) ) ( not ( = ?auto_981879 ?auto_981880 ) ) ( not ( = ?auto_981879 ?auto_981881 ) ) ( not ( = ?auto_981880 ?auto_981881 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_981879 ?auto_981878 ?auto_981876 )
      ( DELIVER-5PKG-VERIFY ?auto_981877 ?auto_981878 ?auto_981879 ?auto_981880 ?auto_981881 ?auto_981876 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_982037 - OBJ
      ?auto_982038 - OBJ
      ?auto_982039 - OBJ
      ?auto_982040 - OBJ
      ?auto_982041 - OBJ
      ?auto_982036 - LOCATION
    )
    :vars
    (
      ?auto_982043 - LOCATION
      ?auto_982045 - CITY
      ?auto_982044 - TRUCK
      ?auto_982042 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_982043 ?auto_982045 ) ( IN-CITY ?auto_982036 ?auto_982045 ) ( not ( = ?auto_982036 ?auto_982043 ) ) ( OBJ-AT ?auto_982040 ?auto_982036 ) ( not ( = ?auto_982040 ?auto_982038 ) ) ( OBJ-AT ?auto_982038 ?auto_982043 ) ( TRUCK-AT ?auto_982044 ?auto_982042 ) ( IN-CITY ?auto_982042 ?auto_982045 ) ( not ( = ?auto_982036 ?auto_982042 ) ) ( not ( = ?auto_982043 ?auto_982042 ) ) ( OBJ-AT ?auto_982037 ?auto_982036 ) ( OBJ-AT ?auto_982039 ?auto_982036 ) ( OBJ-AT ?auto_982041 ?auto_982036 ) ( not ( = ?auto_982037 ?auto_982038 ) ) ( not ( = ?auto_982037 ?auto_982039 ) ) ( not ( = ?auto_982037 ?auto_982040 ) ) ( not ( = ?auto_982037 ?auto_982041 ) ) ( not ( = ?auto_982038 ?auto_982039 ) ) ( not ( = ?auto_982038 ?auto_982041 ) ) ( not ( = ?auto_982039 ?auto_982040 ) ) ( not ( = ?auto_982039 ?auto_982041 ) ) ( not ( = ?auto_982040 ?auto_982041 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_982040 ?auto_982038 ?auto_982036 )
      ( DELIVER-5PKG-VERIFY ?auto_982037 ?auto_982038 ?auto_982039 ?auto_982040 ?auto_982041 ?auto_982036 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_982957 - OBJ
      ?auto_982958 - OBJ
      ?auto_982959 - OBJ
      ?auto_982960 - OBJ
      ?auto_982961 - OBJ
      ?auto_982956 - LOCATION
    )
    :vars
    (
      ?auto_982964 - LOCATION
      ?auto_982966 - CITY
      ?auto_982963 - OBJ
      ?auto_982965 - TRUCK
      ?auto_982962 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_982964 ?auto_982966 ) ( IN-CITY ?auto_982956 ?auto_982966 ) ( not ( = ?auto_982956 ?auto_982964 ) ) ( OBJ-AT ?auto_982963 ?auto_982956 ) ( not ( = ?auto_982963 ?auto_982961 ) ) ( OBJ-AT ?auto_982961 ?auto_982964 ) ( TRUCK-AT ?auto_982965 ?auto_982962 ) ( IN-CITY ?auto_982962 ?auto_982966 ) ( not ( = ?auto_982956 ?auto_982962 ) ) ( not ( = ?auto_982964 ?auto_982962 ) ) ( OBJ-AT ?auto_982957 ?auto_982956 ) ( OBJ-AT ?auto_982958 ?auto_982956 ) ( OBJ-AT ?auto_982959 ?auto_982956 ) ( OBJ-AT ?auto_982960 ?auto_982956 ) ( not ( = ?auto_982957 ?auto_982958 ) ) ( not ( = ?auto_982957 ?auto_982959 ) ) ( not ( = ?auto_982957 ?auto_982960 ) ) ( not ( = ?auto_982957 ?auto_982961 ) ) ( not ( = ?auto_982957 ?auto_982963 ) ) ( not ( = ?auto_982958 ?auto_982959 ) ) ( not ( = ?auto_982958 ?auto_982960 ) ) ( not ( = ?auto_982958 ?auto_982961 ) ) ( not ( = ?auto_982958 ?auto_982963 ) ) ( not ( = ?auto_982959 ?auto_982960 ) ) ( not ( = ?auto_982959 ?auto_982961 ) ) ( not ( = ?auto_982959 ?auto_982963 ) ) ( not ( = ?auto_982960 ?auto_982961 ) ) ( not ( = ?auto_982960 ?auto_982963 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_982963 ?auto_982961 ?auto_982956 )
      ( DELIVER-5PKG-VERIFY ?auto_982957 ?auto_982958 ?auto_982959 ?auto_982960 ?auto_982961 ?auto_982956 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_982989 - OBJ
      ?auto_982990 - OBJ
      ?auto_982991 - OBJ
      ?auto_982992 - OBJ
      ?auto_982993 - OBJ
      ?auto_982988 - LOCATION
    )
    :vars
    (
      ?auto_982996 - LOCATION
      ?auto_982998 - CITY
      ?auto_982995 - OBJ
      ?auto_982997 - TRUCK
      ?auto_982994 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_982996 ?auto_982998 ) ( IN-CITY ?auto_982988 ?auto_982998 ) ( not ( = ?auto_982988 ?auto_982996 ) ) ( OBJ-AT ?auto_982995 ?auto_982988 ) ( not ( = ?auto_982995 ?auto_982992 ) ) ( OBJ-AT ?auto_982992 ?auto_982996 ) ( TRUCK-AT ?auto_982997 ?auto_982994 ) ( IN-CITY ?auto_982994 ?auto_982998 ) ( not ( = ?auto_982988 ?auto_982994 ) ) ( not ( = ?auto_982996 ?auto_982994 ) ) ( OBJ-AT ?auto_982989 ?auto_982988 ) ( OBJ-AT ?auto_982990 ?auto_982988 ) ( OBJ-AT ?auto_982991 ?auto_982988 ) ( OBJ-AT ?auto_982993 ?auto_982988 ) ( not ( = ?auto_982989 ?auto_982990 ) ) ( not ( = ?auto_982989 ?auto_982991 ) ) ( not ( = ?auto_982989 ?auto_982992 ) ) ( not ( = ?auto_982989 ?auto_982993 ) ) ( not ( = ?auto_982989 ?auto_982995 ) ) ( not ( = ?auto_982990 ?auto_982991 ) ) ( not ( = ?auto_982990 ?auto_982992 ) ) ( not ( = ?auto_982990 ?auto_982993 ) ) ( not ( = ?auto_982990 ?auto_982995 ) ) ( not ( = ?auto_982991 ?auto_982992 ) ) ( not ( = ?auto_982991 ?auto_982993 ) ) ( not ( = ?auto_982991 ?auto_982995 ) ) ( not ( = ?auto_982992 ?auto_982993 ) ) ( not ( = ?auto_982993 ?auto_982995 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_982995 ?auto_982992 ?auto_982988 )
      ( DELIVER-5PKG-VERIFY ?auto_982989 ?auto_982990 ?auto_982991 ?auto_982992 ?auto_982993 ?auto_982988 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_983147 - OBJ
      ?auto_983148 - OBJ
      ?auto_983149 - OBJ
      ?auto_983150 - OBJ
      ?auto_983151 - OBJ
      ?auto_983146 - LOCATION
    )
    :vars
    (
      ?auto_983154 - LOCATION
      ?auto_983156 - CITY
      ?auto_983153 - OBJ
      ?auto_983155 - TRUCK
      ?auto_983152 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_983154 ?auto_983156 ) ( IN-CITY ?auto_983146 ?auto_983156 ) ( not ( = ?auto_983146 ?auto_983154 ) ) ( OBJ-AT ?auto_983153 ?auto_983146 ) ( not ( = ?auto_983153 ?auto_983149 ) ) ( OBJ-AT ?auto_983149 ?auto_983154 ) ( TRUCK-AT ?auto_983155 ?auto_983152 ) ( IN-CITY ?auto_983152 ?auto_983156 ) ( not ( = ?auto_983146 ?auto_983152 ) ) ( not ( = ?auto_983154 ?auto_983152 ) ) ( OBJ-AT ?auto_983147 ?auto_983146 ) ( OBJ-AT ?auto_983148 ?auto_983146 ) ( OBJ-AT ?auto_983150 ?auto_983146 ) ( OBJ-AT ?auto_983151 ?auto_983146 ) ( not ( = ?auto_983147 ?auto_983148 ) ) ( not ( = ?auto_983147 ?auto_983149 ) ) ( not ( = ?auto_983147 ?auto_983150 ) ) ( not ( = ?auto_983147 ?auto_983151 ) ) ( not ( = ?auto_983147 ?auto_983153 ) ) ( not ( = ?auto_983148 ?auto_983149 ) ) ( not ( = ?auto_983148 ?auto_983150 ) ) ( not ( = ?auto_983148 ?auto_983151 ) ) ( not ( = ?auto_983148 ?auto_983153 ) ) ( not ( = ?auto_983149 ?auto_983150 ) ) ( not ( = ?auto_983149 ?auto_983151 ) ) ( not ( = ?auto_983150 ?auto_983151 ) ) ( not ( = ?auto_983150 ?auto_983153 ) ) ( not ( = ?auto_983151 ?auto_983153 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_983153 ?auto_983149 ?auto_983146 )
      ( DELIVER-5PKG-VERIFY ?auto_983147 ?auto_983148 ?auto_983149 ?auto_983150 ?auto_983151 ?auto_983146 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_983695 - OBJ
      ?auto_983696 - OBJ
      ?auto_983697 - OBJ
      ?auto_983698 - OBJ
      ?auto_983699 - OBJ
      ?auto_983694 - LOCATION
    )
    :vars
    (
      ?auto_983701 - LOCATION
      ?auto_983703 - CITY
      ?auto_983702 - TRUCK
      ?auto_983700 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_983701 ?auto_983703 ) ( IN-CITY ?auto_983694 ?auto_983703 ) ( not ( = ?auto_983694 ?auto_983701 ) ) ( OBJ-AT ?auto_983699 ?auto_983694 ) ( not ( = ?auto_983699 ?auto_983696 ) ) ( OBJ-AT ?auto_983696 ?auto_983701 ) ( TRUCK-AT ?auto_983702 ?auto_983700 ) ( IN-CITY ?auto_983700 ?auto_983703 ) ( not ( = ?auto_983694 ?auto_983700 ) ) ( not ( = ?auto_983701 ?auto_983700 ) ) ( OBJ-AT ?auto_983695 ?auto_983694 ) ( OBJ-AT ?auto_983697 ?auto_983694 ) ( OBJ-AT ?auto_983698 ?auto_983694 ) ( not ( = ?auto_983695 ?auto_983696 ) ) ( not ( = ?auto_983695 ?auto_983697 ) ) ( not ( = ?auto_983695 ?auto_983698 ) ) ( not ( = ?auto_983695 ?auto_983699 ) ) ( not ( = ?auto_983696 ?auto_983697 ) ) ( not ( = ?auto_983696 ?auto_983698 ) ) ( not ( = ?auto_983697 ?auto_983698 ) ) ( not ( = ?auto_983697 ?auto_983699 ) ) ( not ( = ?auto_983698 ?auto_983699 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_983699 ?auto_983696 ?auto_983694 )
      ( DELIVER-5PKG-VERIFY ?auto_983695 ?auto_983696 ?auto_983697 ?auto_983698 ?auto_983699 ?auto_983694 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_983865 - OBJ
      ?auto_983866 - OBJ
      ?auto_983867 - OBJ
      ?auto_983868 - OBJ
      ?auto_983869 - OBJ
      ?auto_983864 - LOCATION
    )
    :vars
    (
      ?auto_983872 - LOCATION
      ?auto_983874 - CITY
      ?auto_983871 - OBJ
      ?auto_983873 - TRUCK
      ?auto_983870 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_983872 ?auto_983874 ) ( IN-CITY ?auto_983864 ?auto_983874 ) ( not ( = ?auto_983864 ?auto_983872 ) ) ( OBJ-AT ?auto_983871 ?auto_983864 ) ( not ( = ?auto_983871 ?auto_983866 ) ) ( OBJ-AT ?auto_983866 ?auto_983872 ) ( TRUCK-AT ?auto_983873 ?auto_983870 ) ( IN-CITY ?auto_983870 ?auto_983874 ) ( not ( = ?auto_983864 ?auto_983870 ) ) ( not ( = ?auto_983872 ?auto_983870 ) ) ( OBJ-AT ?auto_983865 ?auto_983864 ) ( OBJ-AT ?auto_983867 ?auto_983864 ) ( OBJ-AT ?auto_983868 ?auto_983864 ) ( OBJ-AT ?auto_983869 ?auto_983864 ) ( not ( = ?auto_983865 ?auto_983866 ) ) ( not ( = ?auto_983865 ?auto_983867 ) ) ( not ( = ?auto_983865 ?auto_983868 ) ) ( not ( = ?auto_983865 ?auto_983869 ) ) ( not ( = ?auto_983865 ?auto_983871 ) ) ( not ( = ?auto_983866 ?auto_983867 ) ) ( not ( = ?auto_983866 ?auto_983868 ) ) ( not ( = ?auto_983866 ?auto_983869 ) ) ( not ( = ?auto_983867 ?auto_983868 ) ) ( not ( = ?auto_983867 ?auto_983869 ) ) ( not ( = ?auto_983867 ?auto_983871 ) ) ( not ( = ?auto_983868 ?auto_983869 ) ) ( not ( = ?auto_983868 ?auto_983871 ) ) ( not ( = ?auto_983869 ?auto_983871 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_983871 ?auto_983866 ?auto_983864 )
      ( DELIVER-5PKG-VERIFY ?auto_983865 ?auto_983866 ?auto_983867 ?auto_983868 ?auto_983869 ?auto_983864 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_986177 - OBJ
      ?auto_986178 - OBJ
      ?auto_986179 - OBJ
      ?auto_986180 - OBJ
      ?auto_986181 - OBJ
      ?auto_986176 - LOCATION
    )
    :vars
    (
      ?auto_986183 - LOCATION
      ?auto_986185 - CITY
      ?auto_986184 - TRUCK
      ?auto_986182 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_986183 ?auto_986185 ) ( IN-CITY ?auto_986176 ?auto_986185 ) ( not ( = ?auto_986176 ?auto_986183 ) ) ( OBJ-AT ?auto_986178 ?auto_986176 ) ( not ( = ?auto_986178 ?auto_986177 ) ) ( OBJ-AT ?auto_986177 ?auto_986183 ) ( TRUCK-AT ?auto_986184 ?auto_986182 ) ( IN-CITY ?auto_986182 ?auto_986185 ) ( not ( = ?auto_986176 ?auto_986182 ) ) ( not ( = ?auto_986183 ?auto_986182 ) ) ( OBJ-AT ?auto_986179 ?auto_986176 ) ( OBJ-AT ?auto_986180 ?auto_986176 ) ( OBJ-AT ?auto_986181 ?auto_986176 ) ( not ( = ?auto_986177 ?auto_986179 ) ) ( not ( = ?auto_986177 ?auto_986180 ) ) ( not ( = ?auto_986177 ?auto_986181 ) ) ( not ( = ?auto_986178 ?auto_986179 ) ) ( not ( = ?auto_986178 ?auto_986180 ) ) ( not ( = ?auto_986178 ?auto_986181 ) ) ( not ( = ?auto_986179 ?auto_986180 ) ) ( not ( = ?auto_986179 ?auto_986181 ) ) ( not ( = ?auto_986180 ?auto_986181 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_986178 ?auto_986177 ?auto_986176 )
      ( DELIVER-5PKG-VERIFY ?auto_986177 ?auto_986178 ?auto_986179 ?auto_986180 ?auto_986181 ?auto_986176 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_986297 - OBJ
      ?auto_986298 - OBJ
      ?auto_986299 - OBJ
      ?auto_986300 - OBJ
      ?auto_986301 - OBJ
      ?auto_986296 - LOCATION
    )
    :vars
    (
      ?auto_986303 - LOCATION
      ?auto_986305 - CITY
      ?auto_986304 - TRUCK
      ?auto_986302 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_986303 ?auto_986305 ) ( IN-CITY ?auto_986296 ?auto_986305 ) ( not ( = ?auto_986296 ?auto_986303 ) ) ( OBJ-AT ?auto_986301 ?auto_986296 ) ( not ( = ?auto_986301 ?auto_986297 ) ) ( OBJ-AT ?auto_986297 ?auto_986303 ) ( TRUCK-AT ?auto_986304 ?auto_986302 ) ( IN-CITY ?auto_986302 ?auto_986305 ) ( not ( = ?auto_986296 ?auto_986302 ) ) ( not ( = ?auto_986303 ?auto_986302 ) ) ( OBJ-AT ?auto_986298 ?auto_986296 ) ( OBJ-AT ?auto_986299 ?auto_986296 ) ( OBJ-AT ?auto_986300 ?auto_986296 ) ( not ( = ?auto_986297 ?auto_986298 ) ) ( not ( = ?auto_986297 ?auto_986299 ) ) ( not ( = ?auto_986297 ?auto_986300 ) ) ( not ( = ?auto_986298 ?auto_986299 ) ) ( not ( = ?auto_986298 ?auto_986300 ) ) ( not ( = ?auto_986298 ?auto_986301 ) ) ( not ( = ?auto_986299 ?auto_986300 ) ) ( not ( = ?auto_986299 ?auto_986301 ) ) ( not ( = ?auto_986300 ?auto_986301 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_986301 ?auto_986297 ?auto_986296 )
      ( DELIVER-5PKG-VERIFY ?auto_986297 ?auto_986298 ?auto_986299 ?auto_986300 ?auto_986301 ?auto_986296 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_986947 - OBJ
      ?auto_986948 - OBJ
      ?auto_986949 - OBJ
      ?auto_986950 - OBJ
      ?auto_986951 - OBJ
      ?auto_986946 - LOCATION
    )
    :vars
    (
      ?auto_986953 - LOCATION
      ?auto_986955 - CITY
      ?auto_986954 - TRUCK
      ?auto_986952 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_986953 ?auto_986955 ) ( IN-CITY ?auto_986946 ?auto_986955 ) ( not ( = ?auto_986946 ?auto_986953 ) ) ( OBJ-AT ?auto_986950 ?auto_986946 ) ( not ( = ?auto_986950 ?auto_986947 ) ) ( OBJ-AT ?auto_986947 ?auto_986953 ) ( TRUCK-AT ?auto_986954 ?auto_986952 ) ( IN-CITY ?auto_986952 ?auto_986955 ) ( not ( = ?auto_986946 ?auto_986952 ) ) ( not ( = ?auto_986953 ?auto_986952 ) ) ( OBJ-AT ?auto_986948 ?auto_986946 ) ( OBJ-AT ?auto_986949 ?auto_986946 ) ( OBJ-AT ?auto_986951 ?auto_986946 ) ( not ( = ?auto_986947 ?auto_986948 ) ) ( not ( = ?auto_986947 ?auto_986949 ) ) ( not ( = ?auto_986947 ?auto_986951 ) ) ( not ( = ?auto_986948 ?auto_986949 ) ) ( not ( = ?auto_986948 ?auto_986950 ) ) ( not ( = ?auto_986948 ?auto_986951 ) ) ( not ( = ?auto_986949 ?auto_986950 ) ) ( not ( = ?auto_986949 ?auto_986951 ) ) ( not ( = ?auto_986950 ?auto_986951 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_986950 ?auto_986947 ?auto_986946 )
      ( DELIVER-5PKG-VERIFY ?auto_986947 ?auto_986948 ?auto_986949 ?auto_986950 ?auto_986951 ?auto_986946 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_986987 - OBJ
      ?auto_986988 - OBJ
      ?auto_986989 - OBJ
      ?auto_986990 - OBJ
      ?auto_986991 - OBJ
      ?auto_986986 - LOCATION
    )
    :vars
    (
      ?auto_986994 - LOCATION
      ?auto_986996 - CITY
      ?auto_986993 - OBJ
      ?auto_986995 - TRUCK
      ?auto_986992 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_986994 ?auto_986996 ) ( IN-CITY ?auto_986986 ?auto_986996 ) ( not ( = ?auto_986986 ?auto_986994 ) ) ( OBJ-AT ?auto_986993 ?auto_986986 ) ( not ( = ?auto_986993 ?auto_986987 ) ) ( OBJ-AT ?auto_986987 ?auto_986994 ) ( TRUCK-AT ?auto_986995 ?auto_986992 ) ( IN-CITY ?auto_986992 ?auto_986996 ) ( not ( = ?auto_986986 ?auto_986992 ) ) ( not ( = ?auto_986994 ?auto_986992 ) ) ( OBJ-AT ?auto_986988 ?auto_986986 ) ( OBJ-AT ?auto_986989 ?auto_986986 ) ( OBJ-AT ?auto_986990 ?auto_986986 ) ( OBJ-AT ?auto_986991 ?auto_986986 ) ( not ( = ?auto_986987 ?auto_986988 ) ) ( not ( = ?auto_986987 ?auto_986989 ) ) ( not ( = ?auto_986987 ?auto_986990 ) ) ( not ( = ?auto_986987 ?auto_986991 ) ) ( not ( = ?auto_986988 ?auto_986989 ) ) ( not ( = ?auto_986988 ?auto_986990 ) ) ( not ( = ?auto_986988 ?auto_986991 ) ) ( not ( = ?auto_986988 ?auto_986993 ) ) ( not ( = ?auto_986989 ?auto_986990 ) ) ( not ( = ?auto_986989 ?auto_986991 ) ) ( not ( = ?auto_986989 ?auto_986993 ) ) ( not ( = ?auto_986990 ?auto_986991 ) ) ( not ( = ?auto_986990 ?auto_986993 ) ) ( not ( = ?auto_986991 ?auto_986993 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_986993 ?auto_986987 ?auto_986986 )
      ( DELIVER-5PKG-VERIFY ?auto_986987 ?auto_986988 ?auto_986989 ?auto_986990 ?auto_986991 ?auto_986986 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_988978 - OBJ
      ?auto_988979 - OBJ
      ?auto_988980 - OBJ
      ?auto_988977 - LOCATION
    )
    :vars
    (
      ?auto_988984 - LOCATION
      ?auto_988983 - CITY
      ?auto_988981 - TRUCK
      ?auto_988982 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_988984 ?auto_988983 ) ( IN-CITY ?auto_988977 ?auto_988983 ) ( not ( = ?auto_988977 ?auto_988984 ) ) ( OBJ-AT ?auto_988979 ?auto_988977 ) ( not ( = ?auto_988979 ?auto_988978 ) ) ( OBJ-AT ?auto_988978 ?auto_988984 ) ( TRUCK-AT ?auto_988981 ?auto_988982 ) ( IN-CITY ?auto_988982 ?auto_988983 ) ( not ( = ?auto_988977 ?auto_988982 ) ) ( not ( = ?auto_988984 ?auto_988982 ) ) ( OBJ-AT ?auto_988980 ?auto_988977 ) ( not ( = ?auto_988978 ?auto_988980 ) ) ( not ( = ?auto_988979 ?auto_988980 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_988979 ?auto_988978 ?auto_988977 )
      ( DELIVER-3PKG-VERIFY ?auto_988978 ?auto_988979 ?auto_988980 ?auto_988977 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1036906 - OBJ
      ?auto_1036907 - OBJ
      ?auto_1036908 - OBJ
      ?auto_1036905 - LOCATION
    )
    :vars
    (
      ?auto_1036911 - LOCATION
      ?auto_1036909 - CITY
      ?auto_1036910 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1036911 ?auto_1036909 ) ( IN-CITY ?auto_1036905 ?auto_1036909 ) ( not ( = ?auto_1036905 ?auto_1036911 ) ) ( OBJ-AT ?auto_1036906 ?auto_1036905 ) ( not ( = ?auto_1036906 ?auto_1036907 ) ) ( OBJ-AT ?auto_1036907 ?auto_1036911 ) ( TRUCK-AT ?auto_1036910 ?auto_1036905 ) ( OBJ-AT ?auto_1036908 ?auto_1036905 ) ( not ( = ?auto_1036906 ?auto_1036908 ) ) ( not ( = ?auto_1036907 ?auto_1036908 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1036906 ?auto_1036907 ?auto_1036905 )
      ( DELIVER-3PKG-VERIFY ?auto_1036906 ?auto_1036907 ?auto_1036908 ?auto_1036905 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1115447 - OBJ
      ?auto_1115448 - OBJ
      ?auto_1115449 - OBJ
      ?auto_1115446 - LOCATION
    )
    :vars
    (
      ?auto_1115450 - TRUCK
      ?auto_1115452 - LOCATION
      ?auto_1115451 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1115449 ?auto_1115450 ) ( TRUCK-AT ?auto_1115450 ?auto_1115452 ) ( IN-CITY ?auto_1115452 ?auto_1115451 ) ( IN-CITY ?auto_1115446 ?auto_1115451 ) ( not ( = ?auto_1115446 ?auto_1115452 ) ) ( OBJ-AT ?auto_1115447 ?auto_1115446 ) ( not ( = ?auto_1115447 ?auto_1115449 ) ) ( OBJ-AT ?auto_1115448 ?auto_1115446 ) ( not ( = ?auto_1115447 ?auto_1115448 ) ) ( not ( = ?auto_1115448 ?auto_1115449 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1115447 ?auto_1115449 ?auto_1115446 )
      ( DELIVER-3PKG-VERIFY ?auto_1115447 ?auto_1115448 ?auto_1115449 ?auto_1115446 ) )
  )

)

