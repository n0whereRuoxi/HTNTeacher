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
      ?auto_16871123 - OBJ
      ?auto_16871124 - LOCATION
    )
    :vars
    (
      ?auto_16871125 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_16871125 ?auto_16871124 ) ( IN-TRUCK ?auto_16871123 ?auto_16871125 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_16871123 ?auto_16871125 ?auto_16871124 )
      ( DELIVER-1PKG-VERIFY ?auto_16871123 ?auto_16871124 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16871156 - OBJ
      ?auto_16871157 - LOCATION
    )
    :vars
    (
      ?auto_16871158 - TRUCK
      ?auto_16871159 - LOCATION
      ?auto_16871160 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_16871156 ?auto_16871158 ) ( TRUCK-AT ?auto_16871158 ?auto_16871159 ) ( IN-CITY ?auto_16871159 ?auto_16871160 ) ( IN-CITY ?auto_16871157 ?auto_16871160 ) ( not ( = ?auto_16871157 ?auto_16871159 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16871158 ?auto_16871159 ?auto_16871157 ?auto_16871160 )
      ( DELIVER-1PKG ?auto_16871156 ?auto_16871157 )
      ( DELIVER-1PKG-VERIFY ?auto_16871156 ?auto_16871157 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16871201 - OBJ
      ?auto_16871202 - LOCATION
    )
    :vars
    (
      ?auto_16871204 - TRUCK
      ?auto_16871205 - LOCATION
      ?auto_16871203 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_16871204 ?auto_16871205 ) ( IN-CITY ?auto_16871205 ?auto_16871203 ) ( IN-CITY ?auto_16871202 ?auto_16871203 ) ( not ( = ?auto_16871202 ?auto_16871205 ) ) ( OBJ-AT ?auto_16871201 ?auto_16871205 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_16871201 ?auto_16871204 ?auto_16871205 )
      ( DELIVER-1PKG ?auto_16871201 ?auto_16871202 )
      ( DELIVER-1PKG-VERIFY ?auto_16871201 ?auto_16871202 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16871246 - OBJ
      ?auto_16871247 - LOCATION
    )
    :vars
    (
      ?auto_16871250 - LOCATION
      ?auto_16871249 - CITY
      ?auto_16871248 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16871250 ?auto_16871249 ) ( IN-CITY ?auto_16871247 ?auto_16871249 ) ( not ( = ?auto_16871247 ?auto_16871250 ) ) ( OBJ-AT ?auto_16871246 ?auto_16871250 ) ( TRUCK-AT ?auto_16871248 ?auto_16871247 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16871248 ?auto_16871247 ?auto_16871250 ?auto_16871249 )
      ( DELIVER-1PKG ?auto_16871246 ?auto_16871247 )
      ( DELIVER-1PKG-VERIFY ?auto_16871246 ?auto_16871247 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16872035 - OBJ
      ?auto_16872037 - OBJ
      ?auto_16872036 - LOCATION
    )
    :vars
    (
      ?auto_16872038 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16872037 ?auto_16872035 ) ( TRUCK-AT ?auto_16872038 ?auto_16872036 ) ( IN-TRUCK ?auto_16872037 ?auto_16872038 ) ( OBJ-AT ?auto_16872035 ?auto_16872036 ) ( not ( = ?auto_16872035 ?auto_16872037 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16872037 ?auto_16872036 )
      ( DELIVER-2PKG-VERIFY ?auto_16872035 ?auto_16872037 ?auto_16872036 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16872898 - OBJ
      ?auto_16872900 - OBJ
      ?auto_16872899 - LOCATION
    )
    :vars
    (
      ?auto_16872901 - TRUCK
      ?auto_16872902 - LOCATION
      ?auto_16872903 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16872900 ?auto_16872898 ) ( IN-TRUCK ?auto_16872900 ?auto_16872901 ) ( TRUCK-AT ?auto_16872901 ?auto_16872902 ) ( IN-CITY ?auto_16872902 ?auto_16872903 ) ( IN-CITY ?auto_16872899 ?auto_16872903 ) ( not ( = ?auto_16872899 ?auto_16872902 ) ) ( OBJ-AT ?auto_16872898 ?auto_16872899 ) ( not ( = ?auto_16872898 ?auto_16872900 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16872900 ?auto_16872899 )
      ( DELIVER-2PKG-VERIFY ?auto_16872898 ?auto_16872900 ?auto_16872899 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16873999 - OBJ
      ?auto_16874000 - LOCATION
    )
    :vars
    (
      ?auto_16874004 - OBJ
      ?auto_16874002 - TRUCK
      ?auto_16874003 - LOCATION
      ?auto_16874001 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16873999 ?auto_16874004 ) ( TRUCK-AT ?auto_16874002 ?auto_16874003 ) ( IN-CITY ?auto_16874003 ?auto_16874001 ) ( IN-CITY ?auto_16874000 ?auto_16874001 ) ( not ( = ?auto_16874000 ?auto_16874003 ) ) ( OBJ-AT ?auto_16874004 ?auto_16874000 ) ( not ( = ?auto_16874004 ?auto_16873999 ) ) ( OBJ-AT ?auto_16873999 ?auto_16874003 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_16873999 ?auto_16874002 ?auto_16874003 )
      ( DELIVER-2PKG ?auto_16874004 ?auto_16873999 ?auto_16874000 )
      ( DELIVER-1PKG-VERIFY ?auto_16873999 ?auto_16874000 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16874005 - OBJ
      ?auto_16874007 - OBJ
      ?auto_16874006 - LOCATION
    )
    :vars
    (
      ?auto_16874008 - TRUCK
      ?auto_16874009 - LOCATION
      ?auto_16874010 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16874007 ?auto_16874005 ) ( TRUCK-AT ?auto_16874008 ?auto_16874009 ) ( IN-CITY ?auto_16874009 ?auto_16874010 ) ( IN-CITY ?auto_16874006 ?auto_16874010 ) ( not ( = ?auto_16874006 ?auto_16874009 ) ) ( OBJ-AT ?auto_16874005 ?auto_16874006 ) ( not ( = ?auto_16874005 ?auto_16874007 ) ) ( OBJ-AT ?auto_16874007 ?auto_16874009 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16874007 ?auto_16874006 )
      ( DELIVER-2PKG-VERIFY ?auto_16874005 ?auto_16874007 ?auto_16874006 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16875106 - OBJ
      ?auto_16875107 - LOCATION
    )
    :vars
    (
      ?auto_16875109 - OBJ
      ?auto_16875108 - LOCATION
      ?auto_16875111 - CITY
      ?auto_16875110 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16875106 ?auto_16875109 ) ( IN-CITY ?auto_16875108 ?auto_16875111 ) ( IN-CITY ?auto_16875107 ?auto_16875111 ) ( not ( = ?auto_16875107 ?auto_16875108 ) ) ( OBJ-AT ?auto_16875109 ?auto_16875107 ) ( not ( = ?auto_16875109 ?auto_16875106 ) ) ( OBJ-AT ?auto_16875106 ?auto_16875108 ) ( TRUCK-AT ?auto_16875110 ?auto_16875107 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16875110 ?auto_16875107 ?auto_16875108 ?auto_16875111 )
      ( DELIVER-2PKG ?auto_16875109 ?auto_16875106 ?auto_16875107 )
      ( DELIVER-1PKG-VERIFY ?auto_16875106 ?auto_16875107 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16875112 - OBJ
      ?auto_16875114 - OBJ
      ?auto_16875113 - LOCATION
    )
    :vars
    (
      ?auto_16875116 - LOCATION
      ?auto_16875117 - CITY
      ?auto_16875115 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16875114 ?auto_16875112 ) ( IN-CITY ?auto_16875116 ?auto_16875117 ) ( IN-CITY ?auto_16875113 ?auto_16875117 ) ( not ( = ?auto_16875113 ?auto_16875116 ) ) ( OBJ-AT ?auto_16875112 ?auto_16875113 ) ( not ( = ?auto_16875112 ?auto_16875114 ) ) ( OBJ-AT ?auto_16875114 ?auto_16875116 ) ( TRUCK-AT ?auto_16875115 ?auto_16875113 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16875114 ?auto_16875113 )
      ( DELIVER-2PKG-VERIFY ?auto_16875112 ?auto_16875114 ?auto_16875113 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16876213 - OBJ
      ?auto_16876214 - LOCATION
    )
    :vars
    (
      ?auto_16876215 - OBJ
      ?auto_16876216 - LOCATION
      ?auto_16876217 - CITY
      ?auto_16876218 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16876213 ?auto_16876215 ) ( IN-CITY ?auto_16876216 ?auto_16876217 ) ( IN-CITY ?auto_16876214 ?auto_16876217 ) ( not ( = ?auto_16876214 ?auto_16876216 ) ) ( not ( = ?auto_16876215 ?auto_16876213 ) ) ( OBJ-AT ?auto_16876213 ?auto_16876216 ) ( TRUCK-AT ?auto_16876218 ?auto_16876214 ) ( IN-TRUCK ?auto_16876215 ?auto_16876218 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16876215 ?auto_16876214 )
      ( DELIVER-2PKG ?auto_16876215 ?auto_16876213 ?auto_16876214 )
      ( DELIVER-1PKG-VERIFY ?auto_16876213 ?auto_16876214 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16876219 - OBJ
      ?auto_16876221 - OBJ
      ?auto_16876220 - LOCATION
    )
    :vars
    (
      ?auto_16876222 - LOCATION
      ?auto_16876224 - CITY
      ?auto_16876223 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16876221 ?auto_16876219 ) ( IN-CITY ?auto_16876222 ?auto_16876224 ) ( IN-CITY ?auto_16876220 ?auto_16876224 ) ( not ( = ?auto_16876220 ?auto_16876222 ) ) ( not ( = ?auto_16876219 ?auto_16876221 ) ) ( OBJ-AT ?auto_16876221 ?auto_16876222 ) ( TRUCK-AT ?auto_16876223 ?auto_16876220 ) ( IN-TRUCK ?auto_16876219 ?auto_16876223 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16876221 ?auto_16876220 )
      ( DELIVER-2PKG-VERIFY ?auto_16876219 ?auto_16876221 ?auto_16876220 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16877320 - OBJ
      ?auto_16877321 - LOCATION
    )
    :vars
    (
      ?auto_16877322 - OBJ
      ?auto_16877324 - LOCATION
      ?auto_16877323 - CITY
      ?auto_16877325 - TRUCK
      ?auto_16877326 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16877320 ?auto_16877322 ) ( IN-CITY ?auto_16877324 ?auto_16877323 ) ( IN-CITY ?auto_16877321 ?auto_16877323 ) ( not ( = ?auto_16877321 ?auto_16877324 ) ) ( not ( = ?auto_16877322 ?auto_16877320 ) ) ( OBJ-AT ?auto_16877320 ?auto_16877324 ) ( IN-TRUCK ?auto_16877322 ?auto_16877325 ) ( TRUCK-AT ?auto_16877325 ?auto_16877326 ) ( IN-CITY ?auto_16877326 ?auto_16877323 ) ( not ( = ?auto_16877321 ?auto_16877326 ) ) ( not ( = ?auto_16877324 ?auto_16877326 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16877325 ?auto_16877326 ?auto_16877321 ?auto_16877323 )
      ( DELIVER-2PKG ?auto_16877322 ?auto_16877320 ?auto_16877321 )
      ( DELIVER-1PKG-VERIFY ?auto_16877320 ?auto_16877321 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16877327 - OBJ
      ?auto_16877329 - OBJ
      ?auto_16877328 - LOCATION
    )
    :vars
    (
      ?auto_16877331 - LOCATION
      ?auto_16877333 - CITY
      ?auto_16877330 - TRUCK
      ?auto_16877332 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16877329 ?auto_16877327 ) ( IN-CITY ?auto_16877331 ?auto_16877333 ) ( IN-CITY ?auto_16877328 ?auto_16877333 ) ( not ( = ?auto_16877328 ?auto_16877331 ) ) ( not ( = ?auto_16877327 ?auto_16877329 ) ) ( OBJ-AT ?auto_16877329 ?auto_16877331 ) ( IN-TRUCK ?auto_16877327 ?auto_16877330 ) ( TRUCK-AT ?auto_16877330 ?auto_16877332 ) ( IN-CITY ?auto_16877332 ?auto_16877333 ) ( not ( = ?auto_16877328 ?auto_16877332 ) ) ( not ( = ?auto_16877331 ?auto_16877332 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16877329 ?auto_16877328 )
      ( DELIVER-2PKG-VERIFY ?auto_16877327 ?auto_16877329 ?auto_16877328 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16878547 - OBJ
      ?auto_16878548 - LOCATION
    )
    :vars
    (
      ?auto_16878549 - OBJ
      ?auto_16878551 - LOCATION
      ?auto_16878550 - CITY
      ?auto_16878553 - TRUCK
      ?auto_16878552 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16878547 ?auto_16878549 ) ( IN-CITY ?auto_16878551 ?auto_16878550 ) ( IN-CITY ?auto_16878548 ?auto_16878550 ) ( not ( = ?auto_16878548 ?auto_16878551 ) ) ( not ( = ?auto_16878549 ?auto_16878547 ) ) ( OBJ-AT ?auto_16878547 ?auto_16878551 ) ( TRUCK-AT ?auto_16878553 ?auto_16878552 ) ( IN-CITY ?auto_16878552 ?auto_16878550 ) ( not ( = ?auto_16878548 ?auto_16878552 ) ) ( not ( = ?auto_16878551 ?auto_16878552 ) ) ( OBJ-AT ?auto_16878549 ?auto_16878552 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_16878549 ?auto_16878553 ?auto_16878552 )
      ( DELIVER-2PKG ?auto_16878549 ?auto_16878547 ?auto_16878548 )
      ( DELIVER-1PKG-VERIFY ?auto_16878547 ?auto_16878548 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16878554 - OBJ
      ?auto_16878556 - OBJ
      ?auto_16878555 - LOCATION
    )
    :vars
    (
      ?auto_16878559 - LOCATION
      ?auto_16878557 - CITY
      ?auto_16878560 - TRUCK
      ?auto_16878558 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16878556 ?auto_16878554 ) ( IN-CITY ?auto_16878559 ?auto_16878557 ) ( IN-CITY ?auto_16878555 ?auto_16878557 ) ( not ( = ?auto_16878555 ?auto_16878559 ) ) ( not ( = ?auto_16878554 ?auto_16878556 ) ) ( OBJ-AT ?auto_16878556 ?auto_16878559 ) ( TRUCK-AT ?auto_16878560 ?auto_16878558 ) ( IN-CITY ?auto_16878558 ?auto_16878557 ) ( not ( = ?auto_16878555 ?auto_16878558 ) ) ( not ( = ?auto_16878559 ?auto_16878558 ) ) ( OBJ-AT ?auto_16878554 ?auto_16878558 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16878556 ?auto_16878555 )
      ( DELIVER-2PKG-VERIFY ?auto_16878554 ?auto_16878556 ?auto_16878555 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16887238 - OBJ
      ?auto_16887240 - OBJ
      ?auto_16887241 - OBJ
      ?auto_16887239 - LOCATION
    )
    :vars
    (
      ?auto_16887242 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16887240 ?auto_16887238 ) ( GREATER-THAN ?auto_16887241 ?auto_16887238 ) ( GREATER-THAN ?auto_16887241 ?auto_16887240 ) ( TRUCK-AT ?auto_16887242 ?auto_16887239 ) ( IN-TRUCK ?auto_16887241 ?auto_16887242 ) ( OBJ-AT ?auto_16887238 ?auto_16887239 ) ( OBJ-AT ?auto_16887240 ?auto_16887239 ) ( not ( = ?auto_16887238 ?auto_16887240 ) ) ( not ( = ?auto_16887238 ?auto_16887241 ) ) ( not ( = ?auto_16887240 ?auto_16887241 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16887241 ?auto_16887239 )
      ( DELIVER-3PKG-VERIFY ?auto_16887238 ?auto_16887240 ?auto_16887241 ?auto_16887239 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16894556 - OBJ
      ?auto_16894558 - OBJ
      ?auto_16894559 - OBJ
      ?auto_16894557 - LOCATION
    )
    :vars
    (
      ?auto_16894561 - TRUCK
      ?auto_16894562 - LOCATION
      ?auto_16894560 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16894558 ?auto_16894556 ) ( GREATER-THAN ?auto_16894559 ?auto_16894556 ) ( GREATER-THAN ?auto_16894559 ?auto_16894558 ) ( IN-TRUCK ?auto_16894559 ?auto_16894561 ) ( TRUCK-AT ?auto_16894561 ?auto_16894562 ) ( IN-CITY ?auto_16894562 ?auto_16894560 ) ( IN-CITY ?auto_16894557 ?auto_16894560 ) ( not ( = ?auto_16894557 ?auto_16894562 ) ) ( OBJ-AT ?auto_16894556 ?auto_16894557 ) ( not ( = ?auto_16894556 ?auto_16894559 ) ) ( OBJ-AT ?auto_16894558 ?auto_16894557 ) ( not ( = ?auto_16894556 ?auto_16894558 ) ) ( not ( = ?auto_16894558 ?auto_16894559 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16894556 ?auto_16894559 ?auto_16894557 )
      ( DELIVER-3PKG-VERIFY ?auto_16894556 ?auto_16894558 ?auto_16894559 ?auto_16894557 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16903909 - OBJ
      ?auto_16903911 - OBJ
      ?auto_16903912 - OBJ
      ?auto_16903910 - LOCATION
    )
    :vars
    (
      ?auto_16903914 - TRUCK
      ?auto_16903915 - LOCATION
      ?auto_16903913 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16903911 ?auto_16903909 ) ( GREATER-THAN ?auto_16903912 ?auto_16903909 ) ( GREATER-THAN ?auto_16903912 ?auto_16903911 ) ( TRUCK-AT ?auto_16903914 ?auto_16903915 ) ( IN-CITY ?auto_16903915 ?auto_16903913 ) ( IN-CITY ?auto_16903910 ?auto_16903913 ) ( not ( = ?auto_16903910 ?auto_16903915 ) ) ( OBJ-AT ?auto_16903909 ?auto_16903910 ) ( not ( = ?auto_16903909 ?auto_16903912 ) ) ( OBJ-AT ?auto_16903912 ?auto_16903915 ) ( OBJ-AT ?auto_16903911 ?auto_16903910 ) ( not ( = ?auto_16903909 ?auto_16903911 ) ) ( not ( = ?auto_16903911 ?auto_16903912 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16903909 ?auto_16903912 ?auto_16903910 )
      ( DELIVER-3PKG-VERIFY ?auto_16903909 ?auto_16903911 ?auto_16903912 ?auto_16903910 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16913262 - OBJ
      ?auto_16913264 - OBJ
      ?auto_16913265 - OBJ
      ?auto_16913263 - LOCATION
    )
    :vars
    (
      ?auto_16913267 - LOCATION
      ?auto_16913268 - CITY
      ?auto_16913266 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16913264 ?auto_16913262 ) ( GREATER-THAN ?auto_16913265 ?auto_16913262 ) ( GREATER-THAN ?auto_16913265 ?auto_16913264 ) ( IN-CITY ?auto_16913267 ?auto_16913268 ) ( IN-CITY ?auto_16913263 ?auto_16913268 ) ( not ( = ?auto_16913263 ?auto_16913267 ) ) ( OBJ-AT ?auto_16913262 ?auto_16913263 ) ( not ( = ?auto_16913262 ?auto_16913265 ) ) ( OBJ-AT ?auto_16913265 ?auto_16913267 ) ( TRUCK-AT ?auto_16913266 ?auto_16913263 ) ( OBJ-AT ?auto_16913264 ?auto_16913263 ) ( not ( = ?auto_16913262 ?auto_16913264 ) ) ( not ( = ?auto_16913264 ?auto_16913265 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16913262 ?auto_16913265 ?auto_16913263 )
      ( DELIVER-3PKG-VERIFY ?auto_16913262 ?auto_16913264 ?auto_16913265 ?auto_16913263 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17028752 - OBJ
      ?auto_17028754 - OBJ
      ?auto_17028755 - OBJ
      ?auto_17028756 - OBJ
      ?auto_17028753 - LOCATION
    )
    :vars
    (
      ?auto_17028757 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_17028754 ?auto_17028752 ) ( GREATER-THAN ?auto_17028755 ?auto_17028752 ) ( GREATER-THAN ?auto_17028755 ?auto_17028754 ) ( GREATER-THAN ?auto_17028756 ?auto_17028752 ) ( GREATER-THAN ?auto_17028756 ?auto_17028754 ) ( GREATER-THAN ?auto_17028756 ?auto_17028755 ) ( TRUCK-AT ?auto_17028757 ?auto_17028753 ) ( IN-TRUCK ?auto_17028756 ?auto_17028757 ) ( OBJ-AT ?auto_17028752 ?auto_17028753 ) ( OBJ-AT ?auto_17028754 ?auto_17028753 ) ( OBJ-AT ?auto_17028755 ?auto_17028753 ) ( not ( = ?auto_17028752 ?auto_17028754 ) ) ( not ( = ?auto_17028752 ?auto_17028755 ) ) ( not ( = ?auto_17028752 ?auto_17028756 ) ) ( not ( = ?auto_17028754 ?auto_17028755 ) ) ( not ( = ?auto_17028754 ?auto_17028756 ) ) ( not ( = ?auto_17028755 ?auto_17028756 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_17028756 ?auto_17028753 )
      ( DELIVER-4PKG-VERIFY ?auto_17028752 ?auto_17028754 ?auto_17028755 ?auto_17028756 ?auto_17028753 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17062538 - OBJ
      ?auto_17062540 - OBJ
      ?auto_17062541 - OBJ
      ?auto_17062542 - OBJ
      ?auto_17062539 - LOCATION
    )
    :vars
    (
      ?auto_17062544 - TRUCK
      ?auto_17062543 - LOCATION
      ?auto_17062545 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_17062540 ?auto_17062538 ) ( GREATER-THAN ?auto_17062541 ?auto_17062538 ) ( GREATER-THAN ?auto_17062541 ?auto_17062540 ) ( GREATER-THAN ?auto_17062542 ?auto_17062538 ) ( GREATER-THAN ?auto_17062542 ?auto_17062540 ) ( GREATER-THAN ?auto_17062542 ?auto_17062541 ) ( IN-TRUCK ?auto_17062542 ?auto_17062544 ) ( TRUCK-AT ?auto_17062544 ?auto_17062543 ) ( IN-CITY ?auto_17062543 ?auto_17062545 ) ( IN-CITY ?auto_17062539 ?auto_17062545 ) ( not ( = ?auto_17062539 ?auto_17062543 ) ) ( OBJ-AT ?auto_17062538 ?auto_17062539 ) ( not ( = ?auto_17062538 ?auto_17062542 ) ) ( OBJ-AT ?auto_17062540 ?auto_17062539 ) ( OBJ-AT ?auto_17062541 ?auto_17062539 ) ( not ( = ?auto_17062538 ?auto_17062540 ) ) ( not ( = ?auto_17062538 ?auto_17062541 ) ) ( not ( = ?auto_17062540 ?auto_17062541 ) ) ( not ( = ?auto_17062540 ?auto_17062542 ) ) ( not ( = ?auto_17062541 ?auto_17062542 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17062538 ?auto_17062542 ?auto_17062539 )
      ( DELIVER-4PKG-VERIFY ?auto_17062538 ?auto_17062540 ?auto_17062541 ?auto_17062542 ?auto_17062539 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17105894 - OBJ
      ?auto_17105896 - OBJ
      ?auto_17105897 - OBJ
      ?auto_17105898 - OBJ
      ?auto_17105895 - LOCATION
    )
    :vars
    (
      ?auto_17105900 - TRUCK
      ?auto_17105901 - LOCATION
      ?auto_17105899 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_17105896 ?auto_17105894 ) ( GREATER-THAN ?auto_17105897 ?auto_17105894 ) ( GREATER-THAN ?auto_17105897 ?auto_17105896 ) ( GREATER-THAN ?auto_17105898 ?auto_17105894 ) ( GREATER-THAN ?auto_17105898 ?auto_17105896 ) ( GREATER-THAN ?auto_17105898 ?auto_17105897 ) ( TRUCK-AT ?auto_17105900 ?auto_17105901 ) ( IN-CITY ?auto_17105901 ?auto_17105899 ) ( IN-CITY ?auto_17105895 ?auto_17105899 ) ( not ( = ?auto_17105895 ?auto_17105901 ) ) ( OBJ-AT ?auto_17105894 ?auto_17105895 ) ( not ( = ?auto_17105894 ?auto_17105898 ) ) ( OBJ-AT ?auto_17105898 ?auto_17105901 ) ( OBJ-AT ?auto_17105896 ?auto_17105895 ) ( OBJ-AT ?auto_17105897 ?auto_17105895 ) ( not ( = ?auto_17105894 ?auto_17105896 ) ) ( not ( = ?auto_17105894 ?auto_17105897 ) ) ( not ( = ?auto_17105896 ?auto_17105897 ) ) ( not ( = ?auto_17105896 ?auto_17105898 ) ) ( not ( = ?auto_17105897 ?auto_17105898 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17105894 ?auto_17105898 ?auto_17105895 )
      ( DELIVER-4PKG-VERIFY ?auto_17105894 ?auto_17105896 ?auto_17105897 ?auto_17105898 ?auto_17105895 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17149250 - OBJ
      ?auto_17149252 - OBJ
      ?auto_17149253 - OBJ
      ?auto_17149254 - OBJ
      ?auto_17149251 - LOCATION
    )
    :vars
    (
      ?auto_17149255 - LOCATION
      ?auto_17149256 - CITY
      ?auto_17149257 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_17149252 ?auto_17149250 ) ( GREATER-THAN ?auto_17149253 ?auto_17149250 ) ( GREATER-THAN ?auto_17149253 ?auto_17149252 ) ( GREATER-THAN ?auto_17149254 ?auto_17149250 ) ( GREATER-THAN ?auto_17149254 ?auto_17149252 ) ( GREATER-THAN ?auto_17149254 ?auto_17149253 ) ( IN-CITY ?auto_17149255 ?auto_17149256 ) ( IN-CITY ?auto_17149251 ?auto_17149256 ) ( not ( = ?auto_17149251 ?auto_17149255 ) ) ( OBJ-AT ?auto_17149250 ?auto_17149251 ) ( not ( = ?auto_17149250 ?auto_17149254 ) ) ( OBJ-AT ?auto_17149254 ?auto_17149255 ) ( TRUCK-AT ?auto_17149257 ?auto_17149251 ) ( OBJ-AT ?auto_17149252 ?auto_17149251 ) ( OBJ-AT ?auto_17149253 ?auto_17149251 ) ( not ( = ?auto_17149250 ?auto_17149252 ) ) ( not ( = ?auto_17149250 ?auto_17149253 ) ) ( not ( = ?auto_17149252 ?auto_17149253 ) ) ( not ( = ?auto_17149252 ?auto_17149254 ) ) ( not ( = ?auto_17149253 ?auto_17149254 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17149250 ?auto_17149254 ?auto_17149251 )
      ( DELIVER-4PKG-VERIFY ?auto_17149250 ?auto_17149252 ?auto_17149253 ?auto_17149254 ?auto_17149251 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_17235575 - OBJ
      ?auto_17235576 - LOCATION
    )
    :vars
    (
      ?auto_17235579 - OBJ
      ?auto_17235577 - LOCATION
      ?auto_17235578 - CITY
      ?auto_17235580 - TRUCK
      ?auto_17235581 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_17235575 ?auto_17235579 ) ( IN-CITY ?auto_17235577 ?auto_17235578 ) ( IN-CITY ?auto_17235576 ?auto_17235578 ) ( not ( = ?auto_17235576 ?auto_17235577 ) ) ( OBJ-AT ?auto_17235579 ?auto_17235576 ) ( not ( = ?auto_17235579 ?auto_17235575 ) ) ( OBJ-AT ?auto_17235575 ?auto_17235577 ) ( TRUCK-AT ?auto_17235580 ?auto_17235581 ) ( IN-CITY ?auto_17235581 ?auto_17235578 ) ( not ( = ?auto_17235576 ?auto_17235581 ) ) ( not ( = ?auto_17235577 ?auto_17235581 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_17235580 ?auto_17235581 ?auto_17235576 ?auto_17235578 )
      ( DELIVER-2PKG ?auto_17235579 ?auto_17235575 ?auto_17235576 )
      ( DELIVER-1PKG-VERIFY ?auto_17235575 ?auto_17235576 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_17235582 - OBJ
      ?auto_17235584 - OBJ
      ?auto_17235583 - LOCATION
    )
    :vars
    (
      ?auto_17235588 - LOCATION
      ?auto_17235586 - CITY
      ?auto_17235587 - TRUCK
      ?auto_17235585 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_17235584 ?auto_17235582 ) ( IN-CITY ?auto_17235588 ?auto_17235586 ) ( IN-CITY ?auto_17235583 ?auto_17235586 ) ( not ( = ?auto_17235583 ?auto_17235588 ) ) ( OBJ-AT ?auto_17235582 ?auto_17235583 ) ( not ( = ?auto_17235582 ?auto_17235584 ) ) ( OBJ-AT ?auto_17235584 ?auto_17235588 ) ( TRUCK-AT ?auto_17235587 ?auto_17235585 ) ( IN-CITY ?auto_17235585 ?auto_17235586 ) ( not ( = ?auto_17235583 ?auto_17235585 ) ) ( not ( = ?auto_17235588 ?auto_17235585 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_17235584 ?auto_17235583 )
      ( DELIVER-2PKG-VERIFY ?auto_17235582 ?auto_17235584 ?auto_17235583 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17235639 - OBJ
      ?auto_17235641 - OBJ
      ?auto_17235642 - OBJ
      ?auto_17235640 - LOCATION
    )
    :vars
    (
      ?auto_17235644 - LOCATION
      ?auto_17235645 - CITY
      ?auto_17235643 - TRUCK
      ?auto_17235646 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_17235641 ?auto_17235639 ) ( GREATER-THAN ?auto_17235642 ?auto_17235639 ) ( GREATER-THAN ?auto_17235642 ?auto_17235641 ) ( IN-CITY ?auto_17235644 ?auto_17235645 ) ( IN-CITY ?auto_17235640 ?auto_17235645 ) ( not ( = ?auto_17235640 ?auto_17235644 ) ) ( OBJ-AT ?auto_17235639 ?auto_17235640 ) ( not ( = ?auto_17235639 ?auto_17235642 ) ) ( OBJ-AT ?auto_17235642 ?auto_17235644 ) ( TRUCK-AT ?auto_17235643 ?auto_17235646 ) ( IN-CITY ?auto_17235646 ?auto_17235645 ) ( not ( = ?auto_17235640 ?auto_17235646 ) ) ( not ( = ?auto_17235644 ?auto_17235646 ) ) ( OBJ-AT ?auto_17235641 ?auto_17235640 ) ( not ( = ?auto_17235639 ?auto_17235641 ) ) ( not ( = ?auto_17235641 ?auto_17235642 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17235639 ?auto_17235642 ?auto_17235640 )
      ( DELIVER-3PKG-VERIFY ?auto_17235639 ?auto_17235641 ?auto_17235642 ?auto_17235640 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_17836349 - OBJ
      ?auto_17836351 - OBJ
      ?auto_17836352 - OBJ
      ?auto_17836353 - OBJ
      ?auto_17836354 - OBJ
      ?auto_17836350 - LOCATION
    )
    :vars
    (
      ?auto_17836355 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_17836351 ?auto_17836349 ) ( GREATER-THAN ?auto_17836352 ?auto_17836349 ) ( GREATER-THAN ?auto_17836352 ?auto_17836351 ) ( GREATER-THAN ?auto_17836353 ?auto_17836349 ) ( GREATER-THAN ?auto_17836353 ?auto_17836351 ) ( GREATER-THAN ?auto_17836353 ?auto_17836352 ) ( GREATER-THAN ?auto_17836354 ?auto_17836349 ) ( GREATER-THAN ?auto_17836354 ?auto_17836351 ) ( GREATER-THAN ?auto_17836354 ?auto_17836352 ) ( GREATER-THAN ?auto_17836354 ?auto_17836353 ) ( TRUCK-AT ?auto_17836355 ?auto_17836350 ) ( IN-TRUCK ?auto_17836354 ?auto_17836355 ) ( OBJ-AT ?auto_17836349 ?auto_17836350 ) ( OBJ-AT ?auto_17836351 ?auto_17836350 ) ( OBJ-AT ?auto_17836352 ?auto_17836350 ) ( OBJ-AT ?auto_17836353 ?auto_17836350 ) ( not ( = ?auto_17836349 ?auto_17836351 ) ) ( not ( = ?auto_17836349 ?auto_17836352 ) ) ( not ( = ?auto_17836349 ?auto_17836353 ) ) ( not ( = ?auto_17836349 ?auto_17836354 ) ) ( not ( = ?auto_17836351 ?auto_17836352 ) ) ( not ( = ?auto_17836351 ?auto_17836353 ) ) ( not ( = ?auto_17836351 ?auto_17836354 ) ) ( not ( = ?auto_17836352 ?auto_17836353 ) ) ( not ( = ?auto_17836352 ?auto_17836354 ) ) ( not ( = ?auto_17836353 ?auto_17836354 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_17836354 ?auto_17836350 )
      ( DELIVER-5PKG-VERIFY ?auto_17836349 ?auto_17836351 ?auto_17836352 ?auto_17836353 ?auto_17836354 ?auto_17836350 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_17947069 - OBJ
      ?auto_17947071 - OBJ
      ?auto_17947072 - OBJ
      ?auto_17947073 - OBJ
      ?auto_17947074 - OBJ
      ?auto_17947070 - LOCATION
    )
    :vars
    (
      ?auto_17947076 - TRUCK
      ?auto_17947077 - LOCATION
      ?auto_17947075 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_17947071 ?auto_17947069 ) ( GREATER-THAN ?auto_17947072 ?auto_17947069 ) ( GREATER-THAN ?auto_17947072 ?auto_17947071 ) ( GREATER-THAN ?auto_17947073 ?auto_17947069 ) ( GREATER-THAN ?auto_17947073 ?auto_17947071 ) ( GREATER-THAN ?auto_17947073 ?auto_17947072 ) ( GREATER-THAN ?auto_17947074 ?auto_17947069 ) ( GREATER-THAN ?auto_17947074 ?auto_17947071 ) ( GREATER-THAN ?auto_17947074 ?auto_17947072 ) ( GREATER-THAN ?auto_17947074 ?auto_17947073 ) ( IN-TRUCK ?auto_17947074 ?auto_17947076 ) ( TRUCK-AT ?auto_17947076 ?auto_17947077 ) ( IN-CITY ?auto_17947077 ?auto_17947075 ) ( IN-CITY ?auto_17947070 ?auto_17947075 ) ( not ( = ?auto_17947070 ?auto_17947077 ) ) ( OBJ-AT ?auto_17947069 ?auto_17947070 ) ( not ( = ?auto_17947069 ?auto_17947074 ) ) ( OBJ-AT ?auto_17947071 ?auto_17947070 ) ( OBJ-AT ?auto_17947072 ?auto_17947070 ) ( OBJ-AT ?auto_17947073 ?auto_17947070 ) ( not ( = ?auto_17947069 ?auto_17947071 ) ) ( not ( = ?auto_17947069 ?auto_17947072 ) ) ( not ( = ?auto_17947069 ?auto_17947073 ) ) ( not ( = ?auto_17947071 ?auto_17947072 ) ) ( not ( = ?auto_17947071 ?auto_17947073 ) ) ( not ( = ?auto_17947071 ?auto_17947074 ) ) ( not ( = ?auto_17947072 ?auto_17947073 ) ) ( not ( = ?auto_17947072 ?auto_17947074 ) ) ( not ( = ?auto_17947073 ?auto_17947074 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17947069 ?auto_17947074 ?auto_17947070 )
      ( DELIVER-5PKG-VERIFY ?auto_17947069 ?auto_17947071 ?auto_17947072 ?auto_17947073 ?auto_17947074 ?auto_17947070 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_18089034 - OBJ
      ?auto_18089036 - OBJ
      ?auto_18089037 - OBJ
      ?auto_18089038 - OBJ
      ?auto_18089039 - OBJ
      ?auto_18089035 - LOCATION
    )
    :vars
    (
      ?auto_18089042 - TRUCK
      ?auto_18089041 - LOCATION
      ?auto_18089040 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_18089036 ?auto_18089034 ) ( GREATER-THAN ?auto_18089037 ?auto_18089034 ) ( GREATER-THAN ?auto_18089037 ?auto_18089036 ) ( GREATER-THAN ?auto_18089038 ?auto_18089034 ) ( GREATER-THAN ?auto_18089038 ?auto_18089036 ) ( GREATER-THAN ?auto_18089038 ?auto_18089037 ) ( GREATER-THAN ?auto_18089039 ?auto_18089034 ) ( GREATER-THAN ?auto_18089039 ?auto_18089036 ) ( GREATER-THAN ?auto_18089039 ?auto_18089037 ) ( GREATER-THAN ?auto_18089039 ?auto_18089038 ) ( TRUCK-AT ?auto_18089042 ?auto_18089041 ) ( IN-CITY ?auto_18089041 ?auto_18089040 ) ( IN-CITY ?auto_18089035 ?auto_18089040 ) ( not ( = ?auto_18089035 ?auto_18089041 ) ) ( OBJ-AT ?auto_18089034 ?auto_18089035 ) ( not ( = ?auto_18089034 ?auto_18089039 ) ) ( OBJ-AT ?auto_18089039 ?auto_18089041 ) ( OBJ-AT ?auto_18089036 ?auto_18089035 ) ( OBJ-AT ?auto_18089037 ?auto_18089035 ) ( OBJ-AT ?auto_18089038 ?auto_18089035 ) ( not ( = ?auto_18089034 ?auto_18089036 ) ) ( not ( = ?auto_18089034 ?auto_18089037 ) ) ( not ( = ?auto_18089034 ?auto_18089038 ) ) ( not ( = ?auto_18089036 ?auto_18089037 ) ) ( not ( = ?auto_18089036 ?auto_18089038 ) ) ( not ( = ?auto_18089036 ?auto_18089039 ) ) ( not ( = ?auto_18089037 ?auto_18089038 ) ) ( not ( = ?auto_18089037 ?auto_18089039 ) ) ( not ( = ?auto_18089038 ?auto_18089039 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18089034 ?auto_18089039 ?auto_18089035 )
      ( DELIVER-5PKG-VERIFY ?auto_18089034 ?auto_18089036 ?auto_18089037 ?auto_18089038 ?auto_18089039 ?auto_18089035 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_18230999 - OBJ
      ?auto_18231001 - OBJ
      ?auto_18231002 - OBJ
      ?auto_18231003 - OBJ
      ?auto_18231004 - OBJ
      ?auto_18231000 - LOCATION
    )
    :vars
    (
      ?auto_18231006 - LOCATION
      ?auto_18231007 - CITY
      ?auto_18231005 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_18231001 ?auto_18230999 ) ( GREATER-THAN ?auto_18231002 ?auto_18230999 ) ( GREATER-THAN ?auto_18231002 ?auto_18231001 ) ( GREATER-THAN ?auto_18231003 ?auto_18230999 ) ( GREATER-THAN ?auto_18231003 ?auto_18231001 ) ( GREATER-THAN ?auto_18231003 ?auto_18231002 ) ( GREATER-THAN ?auto_18231004 ?auto_18230999 ) ( GREATER-THAN ?auto_18231004 ?auto_18231001 ) ( GREATER-THAN ?auto_18231004 ?auto_18231002 ) ( GREATER-THAN ?auto_18231004 ?auto_18231003 ) ( IN-CITY ?auto_18231006 ?auto_18231007 ) ( IN-CITY ?auto_18231000 ?auto_18231007 ) ( not ( = ?auto_18231000 ?auto_18231006 ) ) ( OBJ-AT ?auto_18230999 ?auto_18231000 ) ( not ( = ?auto_18230999 ?auto_18231004 ) ) ( OBJ-AT ?auto_18231004 ?auto_18231006 ) ( TRUCK-AT ?auto_18231005 ?auto_18231000 ) ( OBJ-AT ?auto_18231001 ?auto_18231000 ) ( OBJ-AT ?auto_18231002 ?auto_18231000 ) ( OBJ-AT ?auto_18231003 ?auto_18231000 ) ( not ( = ?auto_18230999 ?auto_18231001 ) ) ( not ( = ?auto_18230999 ?auto_18231002 ) ) ( not ( = ?auto_18230999 ?auto_18231003 ) ) ( not ( = ?auto_18231001 ?auto_18231002 ) ) ( not ( = ?auto_18231001 ?auto_18231003 ) ) ( not ( = ?auto_18231001 ?auto_18231004 ) ) ( not ( = ?auto_18231002 ?auto_18231003 ) ) ( not ( = ?auto_18231002 ?auto_18231004 ) ) ( not ( = ?auto_18231003 ?auto_18231004 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18230999 ?auto_18231004 ?auto_18231000 )
      ( DELIVER-5PKG-VERIFY ?auto_18230999 ?auto_18231001 ?auto_18231002 ?auto_18231003 ?auto_18231004 ?auto_18231000 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18511267 - OBJ
      ?auto_18511269 - OBJ
      ?auto_18511270 - OBJ
      ?auto_18511271 - OBJ
      ?auto_18511268 - LOCATION
    )
    :vars
    (
      ?auto_18511275 - LOCATION
      ?auto_18511273 - CITY
      ?auto_18511272 - TRUCK
      ?auto_18511274 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_18511269 ?auto_18511267 ) ( GREATER-THAN ?auto_18511270 ?auto_18511267 ) ( GREATER-THAN ?auto_18511270 ?auto_18511269 ) ( GREATER-THAN ?auto_18511271 ?auto_18511267 ) ( GREATER-THAN ?auto_18511271 ?auto_18511269 ) ( GREATER-THAN ?auto_18511271 ?auto_18511270 ) ( IN-CITY ?auto_18511275 ?auto_18511273 ) ( IN-CITY ?auto_18511268 ?auto_18511273 ) ( not ( = ?auto_18511268 ?auto_18511275 ) ) ( OBJ-AT ?auto_18511267 ?auto_18511268 ) ( not ( = ?auto_18511267 ?auto_18511271 ) ) ( OBJ-AT ?auto_18511271 ?auto_18511275 ) ( TRUCK-AT ?auto_18511272 ?auto_18511274 ) ( IN-CITY ?auto_18511274 ?auto_18511273 ) ( not ( = ?auto_18511268 ?auto_18511274 ) ) ( not ( = ?auto_18511275 ?auto_18511274 ) ) ( OBJ-AT ?auto_18511269 ?auto_18511268 ) ( OBJ-AT ?auto_18511270 ?auto_18511268 ) ( not ( = ?auto_18511267 ?auto_18511269 ) ) ( not ( = ?auto_18511267 ?auto_18511270 ) ) ( not ( = ?auto_18511269 ?auto_18511270 ) ) ( not ( = ?auto_18511269 ?auto_18511271 ) ) ( not ( = ?auto_18511270 ?auto_18511271 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18511267 ?auto_18511271 ?auto_18511268 )
      ( DELIVER-4PKG-VERIFY ?auto_18511267 ?auto_18511269 ?auto_18511270 ?auto_18511271 ?auto_18511268 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_21041701 - OBJ
      ?auto_21041703 - OBJ
      ?auto_21041704 - OBJ
      ?auto_21041705 - OBJ
      ?auto_21041706 - OBJ
      ?auto_21041707 - OBJ
      ?auto_21041702 - LOCATION
    )
    :vars
    (
      ?auto_21041708 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_21041703 ?auto_21041701 ) ( GREATER-THAN ?auto_21041704 ?auto_21041701 ) ( GREATER-THAN ?auto_21041704 ?auto_21041703 ) ( GREATER-THAN ?auto_21041705 ?auto_21041701 ) ( GREATER-THAN ?auto_21041705 ?auto_21041703 ) ( GREATER-THAN ?auto_21041705 ?auto_21041704 ) ( GREATER-THAN ?auto_21041706 ?auto_21041701 ) ( GREATER-THAN ?auto_21041706 ?auto_21041703 ) ( GREATER-THAN ?auto_21041706 ?auto_21041704 ) ( GREATER-THAN ?auto_21041706 ?auto_21041705 ) ( GREATER-THAN ?auto_21041707 ?auto_21041701 ) ( GREATER-THAN ?auto_21041707 ?auto_21041703 ) ( GREATER-THAN ?auto_21041707 ?auto_21041704 ) ( GREATER-THAN ?auto_21041707 ?auto_21041705 ) ( GREATER-THAN ?auto_21041707 ?auto_21041706 ) ( TRUCK-AT ?auto_21041708 ?auto_21041702 ) ( IN-TRUCK ?auto_21041707 ?auto_21041708 ) ( OBJ-AT ?auto_21041701 ?auto_21041702 ) ( OBJ-AT ?auto_21041703 ?auto_21041702 ) ( OBJ-AT ?auto_21041704 ?auto_21041702 ) ( OBJ-AT ?auto_21041705 ?auto_21041702 ) ( OBJ-AT ?auto_21041706 ?auto_21041702 ) ( not ( = ?auto_21041701 ?auto_21041703 ) ) ( not ( = ?auto_21041701 ?auto_21041704 ) ) ( not ( = ?auto_21041701 ?auto_21041705 ) ) ( not ( = ?auto_21041701 ?auto_21041706 ) ) ( not ( = ?auto_21041701 ?auto_21041707 ) ) ( not ( = ?auto_21041703 ?auto_21041704 ) ) ( not ( = ?auto_21041703 ?auto_21041705 ) ) ( not ( = ?auto_21041703 ?auto_21041706 ) ) ( not ( = ?auto_21041703 ?auto_21041707 ) ) ( not ( = ?auto_21041704 ?auto_21041705 ) ) ( not ( = ?auto_21041704 ?auto_21041706 ) ) ( not ( = ?auto_21041704 ?auto_21041707 ) ) ( not ( = ?auto_21041705 ?auto_21041706 ) ) ( not ( = ?auto_21041705 ?auto_21041707 ) ) ( not ( = ?auto_21041706 ?auto_21041707 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_21041707 ?auto_21041702 )
      ( DELIVER-6PKG-VERIFY ?auto_21041701 ?auto_21041703 ?auto_21041704 ?auto_21041705 ?auto_21041706 ?auto_21041707 ?auto_21041702 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_21342111 - OBJ
      ?auto_21342113 - OBJ
      ?auto_21342114 - OBJ
      ?auto_21342115 - OBJ
      ?auto_21342116 - OBJ
      ?auto_21342117 - OBJ
      ?auto_21342112 - LOCATION
    )
    :vars
    (
      ?auto_21342120 - TRUCK
      ?auto_21342119 - LOCATION
      ?auto_21342118 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_21342113 ?auto_21342111 ) ( GREATER-THAN ?auto_21342114 ?auto_21342111 ) ( GREATER-THAN ?auto_21342114 ?auto_21342113 ) ( GREATER-THAN ?auto_21342115 ?auto_21342111 ) ( GREATER-THAN ?auto_21342115 ?auto_21342113 ) ( GREATER-THAN ?auto_21342115 ?auto_21342114 ) ( GREATER-THAN ?auto_21342116 ?auto_21342111 ) ( GREATER-THAN ?auto_21342116 ?auto_21342113 ) ( GREATER-THAN ?auto_21342116 ?auto_21342114 ) ( GREATER-THAN ?auto_21342116 ?auto_21342115 ) ( GREATER-THAN ?auto_21342117 ?auto_21342111 ) ( GREATER-THAN ?auto_21342117 ?auto_21342113 ) ( GREATER-THAN ?auto_21342117 ?auto_21342114 ) ( GREATER-THAN ?auto_21342117 ?auto_21342115 ) ( GREATER-THAN ?auto_21342117 ?auto_21342116 ) ( IN-TRUCK ?auto_21342117 ?auto_21342120 ) ( TRUCK-AT ?auto_21342120 ?auto_21342119 ) ( IN-CITY ?auto_21342119 ?auto_21342118 ) ( IN-CITY ?auto_21342112 ?auto_21342118 ) ( not ( = ?auto_21342112 ?auto_21342119 ) ) ( OBJ-AT ?auto_21342111 ?auto_21342112 ) ( not ( = ?auto_21342111 ?auto_21342117 ) ) ( OBJ-AT ?auto_21342113 ?auto_21342112 ) ( OBJ-AT ?auto_21342114 ?auto_21342112 ) ( OBJ-AT ?auto_21342115 ?auto_21342112 ) ( OBJ-AT ?auto_21342116 ?auto_21342112 ) ( not ( = ?auto_21342111 ?auto_21342113 ) ) ( not ( = ?auto_21342111 ?auto_21342114 ) ) ( not ( = ?auto_21342111 ?auto_21342115 ) ) ( not ( = ?auto_21342111 ?auto_21342116 ) ) ( not ( = ?auto_21342113 ?auto_21342114 ) ) ( not ( = ?auto_21342113 ?auto_21342115 ) ) ( not ( = ?auto_21342113 ?auto_21342116 ) ) ( not ( = ?auto_21342113 ?auto_21342117 ) ) ( not ( = ?auto_21342114 ?auto_21342115 ) ) ( not ( = ?auto_21342114 ?auto_21342116 ) ) ( not ( = ?auto_21342114 ?auto_21342117 ) ) ( not ( = ?auto_21342115 ?auto_21342116 ) ) ( not ( = ?auto_21342115 ?auto_21342117 ) ) ( not ( = ?auto_21342116 ?auto_21342117 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21342111 ?auto_21342117 ?auto_21342112 )
      ( DELIVER-6PKG-VERIFY ?auto_21342111 ?auto_21342113 ?auto_21342114 ?auto_21342115 ?auto_21342116 ?auto_21342117 ?auto_21342112 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_21714333 - OBJ
      ?auto_21714335 - OBJ
      ?auto_21714336 - OBJ
      ?auto_21714337 - OBJ
      ?auto_21714338 - OBJ
      ?auto_21714339 - OBJ
      ?auto_21714334 - LOCATION
    )
    :vars
    (
      ?auto_21714342 - TRUCK
      ?auto_21714341 - LOCATION
      ?auto_21714340 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_21714335 ?auto_21714333 ) ( GREATER-THAN ?auto_21714336 ?auto_21714333 ) ( GREATER-THAN ?auto_21714336 ?auto_21714335 ) ( GREATER-THAN ?auto_21714337 ?auto_21714333 ) ( GREATER-THAN ?auto_21714337 ?auto_21714335 ) ( GREATER-THAN ?auto_21714337 ?auto_21714336 ) ( GREATER-THAN ?auto_21714338 ?auto_21714333 ) ( GREATER-THAN ?auto_21714338 ?auto_21714335 ) ( GREATER-THAN ?auto_21714338 ?auto_21714336 ) ( GREATER-THAN ?auto_21714338 ?auto_21714337 ) ( GREATER-THAN ?auto_21714339 ?auto_21714333 ) ( GREATER-THAN ?auto_21714339 ?auto_21714335 ) ( GREATER-THAN ?auto_21714339 ?auto_21714336 ) ( GREATER-THAN ?auto_21714339 ?auto_21714337 ) ( GREATER-THAN ?auto_21714339 ?auto_21714338 ) ( TRUCK-AT ?auto_21714342 ?auto_21714341 ) ( IN-CITY ?auto_21714341 ?auto_21714340 ) ( IN-CITY ?auto_21714334 ?auto_21714340 ) ( not ( = ?auto_21714334 ?auto_21714341 ) ) ( OBJ-AT ?auto_21714333 ?auto_21714334 ) ( not ( = ?auto_21714333 ?auto_21714339 ) ) ( OBJ-AT ?auto_21714339 ?auto_21714341 ) ( OBJ-AT ?auto_21714335 ?auto_21714334 ) ( OBJ-AT ?auto_21714336 ?auto_21714334 ) ( OBJ-AT ?auto_21714337 ?auto_21714334 ) ( OBJ-AT ?auto_21714338 ?auto_21714334 ) ( not ( = ?auto_21714333 ?auto_21714335 ) ) ( not ( = ?auto_21714333 ?auto_21714336 ) ) ( not ( = ?auto_21714333 ?auto_21714337 ) ) ( not ( = ?auto_21714333 ?auto_21714338 ) ) ( not ( = ?auto_21714335 ?auto_21714336 ) ) ( not ( = ?auto_21714335 ?auto_21714337 ) ) ( not ( = ?auto_21714335 ?auto_21714338 ) ) ( not ( = ?auto_21714335 ?auto_21714339 ) ) ( not ( = ?auto_21714336 ?auto_21714337 ) ) ( not ( = ?auto_21714336 ?auto_21714338 ) ) ( not ( = ?auto_21714336 ?auto_21714339 ) ) ( not ( = ?auto_21714337 ?auto_21714338 ) ) ( not ( = ?auto_21714337 ?auto_21714339 ) ) ( not ( = ?auto_21714338 ?auto_21714339 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21714333 ?auto_21714339 ?auto_21714334 )
      ( DELIVER-6PKG-VERIFY ?auto_21714333 ?auto_21714335 ?auto_21714336 ?auto_21714337 ?auto_21714338 ?auto_21714339 ?auto_21714334 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_22086555 - OBJ
      ?auto_22086557 - OBJ
      ?auto_22086558 - OBJ
      ?auto_22086559 - OBJ
      ?auto_22086560 - OBJ
      ?auto_22086561 - OBJ
      ?auto_22086556 - LOCATION
    )
    :vars
    (
      ?auto_22086564 - LOCATION
      ?auto_22086563 - CITY
      ?auto_22086562 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_22086557 ?auto_22086555 ) ( GREATER-THAN ?auto_22086558 ?auto_22086555 ) ( GREATER-THAN ?auto_22086558 ?auto_22086557 ) ( GREATER-THAN ?auto_22086559 ?auto_22086555 ) ( GREATER-THAN ?auto_22086559 ?auto_22086557 ) ( GREATER-THAN ?auto_22086559 ?auto_22086558 ) ( GREATER-THAN ?auto_22086560 ?auto_22086555 ) ( GREATER-THAN ?auto_22086560 ?auto_22086557 ) ( GREATER-THAN ?auto_22086560 ?auto_22086558 ) ( GREATER-THAN ?auto_22086560 ?auto_22086559 ) ( GREATER-THAN ?auto_22086561 ?auto_22086555 ) ( GREATER-THAN ?auto_22086561 ?auto_22086557 ) ( GREATER-THAN ?auto_22086561 ?auto_22086558 ) ( GREATER-THAN ?auto_22086561 ?auto_22086559 ) ( GREATER-THAN ?auto_22086561 ?auto_22086560 ) ( IN-CITY ?auto_22086564 ?auto_22086563 ) ( IN-CITY ?auto_22086556 ?auto_22086563 ) ( not ( = ?auto_22086556 ?auto_22086564 ) ) ( OBJ-AT ?auto_22086555 ?auto_22086556 ) ( not ( = ?auto_22086555 ?auto_22086561 ) ) ( OBJ-AT ?auto_22086561 ?auto_22086564 ) ( TRUCK-AT ?auto_22086562 ?auto_22086556 ) ( OBJ-AT ?auto_22086557 ?auto_22086556 ) ( OBJ-AT ?auto_22086558 ?auto_22086556 ) ( OBJ-AT ?auto_22086559 ?auto_22086556 ) ( OBJ-AT ?auto_22086560 ?auto_22086556 ) ( not ( = ?auto_22086555 ?auto_22086557 ) ) ( not ( = ?auto_22086555 ?auto_22086558 ) ) ( not ( = ?auto_22086555 ?auto_22086559 ) ) ( not ( = ?auto_22086555 ?auto_22086560 ) ) ( not ( = ?auto_22086557 ?auto_22086558 ) ) ( not ( = ?auto_22086557 ?auto_22086559 ) ) ( not ( = ?auto_22086557 ?auto_22086560 ) ) ( not ( = ?auto_22086557 ?auto_22086561 ) ) ( not ( = ?auto_22086558 ?auto_22086559 ) ) ( not ( = ?auto_22086558 ?auto_22086560 ) ) ( not ( = ?auto_22086558 ?auto_22086561 ) ) ( not ( = ?auto_22086559 ?auto_22086560 ) ) ( not ( = ?auto_22086559 ?auto_22086561 ) ) ( not ( = ?auto_22086560 ?auto_22086561 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_22086555 ?auto_22086561 ?auto_22086556 )
      ( DELIVER-6PKG-VERIFY ?auto_22086555 ?auto_22086557 ?auto_22086558 ?auto_22086559 ?auto_22086560 ?auto_22086561 ?auto_22086556 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_22780152 - OBJ
      ?auto_22780154 - OBJ
      ?auto_22780155 - OBJ
      ?auto_22780156 - OBJ
      ?auto_22780157 - OBJ
      ?auto_22780153 - LOCATION
    )
    :vars
    (
      ?auto_22780158 - LOCATION
      ?auto_22780159 - CITY
      ?auto_22780160 - TRUCK
      ?auto_22780161 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_22780154 ?auto_22780152 ) ( GREATER-THAN ?auto_22780155 ?auto_22780152 ) ( GREATER-THAN ?auto_22780155 ?auto_22780154 ) ( GREATER-THAN ?auto_22780156 ?auto_22780152 ) ( GREATER-THAN ?auto_22780156 ?auto_22780154 ) ( GREATER-THAN ?auto_22780156 ?auto_22780155 ) ( GREATER-THAN ?auto_22780157 ?auto_22780152 ) ( GREATER-THAN ?auto_22780157 ?auto_22780154 ) ( GREATER-THAN ?auto_22780157 ?auto_22780155 ) ( GREATER-THAN ?auto_22780157 ?auto_22780156 ) ( IN-CITY ?auto_22780158 ?auto_22780159 ) ( IN-CITY ?auto_22780153 ?auto_22780159 ) ( not ( = ?auto_22780153 ?auto_22780158 ) ) ( OBJ-AT ?auto_22780152 ?auto_22780153 ) ( not ( = ?auto_22780152 ?auto_22780157 ) ) ( OBJ-AT ?auto_22780157 ?auto_22780158 ) ( TRUCK-AT ?auto_22780160 ?auto_22780161 ) ( IN-CITY ?auto_22780161 ?auto_22780159 ) ( not ( = ?auto_22780153 ?auto_22780161 ) ) ( not ( = ?auto_22780158 ?auto_22780161 ) ) ( OBJ-AT ?auto_22780154 ?auto_22780153 ) ( OBJ-AT ?auto_22780155 ?auto_22780153 ) ( OBJ-AT ?auto_22780156 ?auto_22780153 ) ( not ( = ?auto_22780152 ?auto_22780154 ) ) ( not ( = ?auto_22780152 ?auto_22780155 ) ) ( not ( = ?auto_22780152 ?auto_22780156 ) ) ( not ( = ?auto_22780154 ?auto_22780155 ) ) ( not ( = ?auto_22780154 ?auto_22780156 ) ) ( not ( = ?auto_22780154 ?auto_22780157 ) ) ( not ( = ?auto_22780155 ?auto_22780156 ) ) ( not ( = ?auto_22780155 ?auto_22780157 ) ) ( not ( = ?auto_22780156 ?auto_22780157 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_22780152 ?auto_22780157 ?auto_22780153 )
      ( DELIVER-5PKG-VERIFY ?auto_22780152 ?auto_22780154 ?auto_22780155 ?auto_22780156 ?auto_22780157 ?auto_22780153 ) )
  )

)

