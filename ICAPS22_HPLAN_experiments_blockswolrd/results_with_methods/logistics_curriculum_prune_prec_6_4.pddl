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
      ?auto_3068834 - OBJ
      ?auto_3068833 - LOCATION
    )
    :vars
    (
      ?auto_3068836 - LOCATION
      ?auto_3068837 - CITY
      ?auto_3068835 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3068836 ?auto_3068837 ) ( IN-CITY ?auto_3068833 ?auto_3068837 ) ( not ( = ?auto_3068833 ?auto_3068836 ) ) ( OBJ-AT ?auto_3068834 ?auto_3068836 ) ( TRUCK-AT ?auto_3068835 ?auto_3068833 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3068835 ?auto_3068833 ?auto_3068836 ?auto_3068837 )
      ( !LOAD-TRUCK ?auto_3068834 ?auto_3068835 ?auto_3068836 )
      ( !DRIVE-TRUCK ?auto_3068835 ?auto_3068836 ?auto_3068833 ?auto_3068837 )
      ( !UNLOAD-TRUCK ?auto_3068834 ?auto_3068835 ?auto_3068833 )
      ( DELIVER-1PKG-VERIFY ?auto_3068834 ?auto_3068833 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3068855 - OBJ
      ?auto_3068856 - OBJ
      ?auto_3068854 - LOCATION
    )
    :vars
    (
      ?auto_3068857 - LOCATION
      ?auto_3068858 - CITY
      ?auto_3068860 - LOCATION
      ?auto_3068859 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3068857 ?auto_3068858 ) ( IN-CITY ?auto_3068854 ?auto_3068858 ) ( not ( = ?auto_3068854 ?auto_3068857 ) ) ( OBJ-AT ?auto_3068856 ?auto_3068857 ) ( IN-CITY ?auto_3068860 ?auto_3068858 ) ( not ( = ?auto_3068854 ?auto_3068860 ) ) ( OBJ-AT ?auto_3068855 ?auto_3068860 ) ( TRUCK-AT ?auto_3068859 ?auto_3068854 ) ( not ( = ?auto_3068855 ?auto_3068856 ) ) ( not ( = ?auto_3068857 ?auto_3068860 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3068855 ?auto_3068854 )
      ( DELIVER-1PKG ?auto_3068856 ?auto_3068854 )
      ( DELIVER-2PKG-VERIFY ?auto_3068855 ?auto_3068856 ?auto_3068854 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3068965 - OBJ
      ?auto_3068966 - OBJ
      ?auto_3068967 - OBJ
      ?auto_3068964 - LOCATION
    )
    :vars
    (
      ?auto_3068970 - LOCATION
      ?auto_3068969 - CITY
      ?auto_3068971 - LOCATION
      ?auto_3068968 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3068970 ?auto_3068969 ) ( IN-CITY ?auto_3068964 ?auto_3068969 ) ( not ( = ?auto_3068964 ?auto_3068970 ) ) ( OBJ-AT ?auto_3068967 ?auto_3068970 ) ( IN-CITY ?auto_3068971 ?auto_3068969 ) ( not ( = ?auto_3068964 ?auto_3068971 ) ) ( OBJ-AT ?auto_3068966 ?auto_3068971 ) ( OBJ-AT ?auto_3068965 ?auto_3068970 ) ( TRUCK-AT ?auto_3068968 ?auto_3068964 ) ( not ( = ?auto_3068965 ?auto_3068966 ) ) ( not ( = ?auto_3068971 ?auto_3068970 ) ) ( not ( = ?auto_3068965 ?auto_3068967 ) ) ( not ( = ?auto_3068966 ?auto_3068967 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3068965 ?auto_3068966 ?auto_3068964 )
      ( DELIVER-1PKG ?auto_3068967 ?auto_3068964 )
      ( DELIVER-3PKG-VERIFY ?auto_3068965 ?auto_3068966 ?auto_3068967 ?auto_3068964 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3068982 - OBJ
      ?auto_3068983 - OBJ
      ?auto_3068984 - OBJ
      ?auto_3068981 - LOCATION
    )
    :vars
    (
      ?auto_3068986 - LOCATION
      ?auto_3068985 - CITY
      ?auto_3068988 - LOCATION
      ?auto_3068987 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3068986 ?auto_3068985 ) ( IN-CITY ?auto_3068981 ?auto_3068985 ) ( not ( = ?auto_3068981 ?auto_3068986 ) ) ( OBJ-AT ?auto_3068983 ?auto_3068986 ) ( IN-CITY ?auto_3068988 ?auto_3068985 ) ( not ( = ?auto_3068981 ?auto_3068988 ) ) ( OBJ-AT ?auto_3068984 ?auto_3068988 ) ( OBJ-AT ?auto_3068982 ?auto_3068986 ) ( TRUCK-AT ?auto_3068987 ?auto_3068981 ) ( not ( = ?auto_3068982 ?auto_3068984 ) ) ( not ( = ?auto_3068988 ?auto_3068986 ) ) ( not ( = ?auto_3068982 ?auto_3068983 ) ) ( not ( = ?auto_3068984 ?auto_3068983 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_3068982 ?auto_3068984 ?auto_3068983 ?auto_3068981 )
      ( DELIVER-3PKG-VERIFY ?auto_3068982 ?auto_3068983 ?auto_3068984 ?auto_3068981 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3068999 - OBJ
      ?auto_3069000 - OBJ
      ?auto_3069001 - OBJ
      ?auto_3068998 - LOCATION
    )
    :vars
    (
      ?auto_3069003 - LOCATION
      ?auto_3069002 - CITY
      ?auto_3069004 - LOCATION
      ?auto_3069005 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3069003 ?auto_3069002 ) ( IN-CITY ?auto_3068998 ?auto_3069002 ) ( not ( = ?auto_3068998 ?auto_3069003 ) ) ( OBJ-AT ?auto_3069001 ?auto_3069003 ) ( IN-CITY ?auto_3069004 ?auto_3069002 ) ( not ( = ?auto_3068998 ?auto_3069004 ) ) ( OBJ-AT ?auto_3068999 ?auto_3069004 ) ( OBJ-AT ?auto_3069000 ?auto_3069003 ) ( TRUCK-AT ?auto_3069005 ?auto_3068998 ) ( not ( = ?auto_3069000 ?auto_3068999 ) ) ( not ( = ?auto_3069004 ?auto_3069003 ) ) ( not ( = ?auto_3069000 ?auto_3069001 ) ) ( not ( = ?auto_3068999 ?auto_3069001 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_3069000 ?auto_3069001 ?auto_3068999 ?auto_3068998 )
      ( DELIVER-3PKG-VERIFY ?auto_3068999 ?auto_3069000 ?auto_3069001 ?auto_3068998 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3070085 - OBJ
      ?auto_3070086 - OBJ
      ?auto_3070087 - OBJ
      ?auto_3070088 - OBJ
      ?auto_3070084 - LOCATION
    )
    :vars
    (
      ?auto_3070091 - LOCATION
      ?auto_3070090 - CITY
      ?auto_3070092 - LOCATION
      ?auto_3070089 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3070091 ?auto_3070090 ) ( IN-CITY ?auto_3070084 ?auto_3070090 ) ( not ( = ?auto_3070084 ?auto_3070091 ) ) ( OBJ-AT ?auto_3070088 ?auto_3070091 ) ( IN-CITY ?auto_3070092 ?auto_3070090 ) ( not ( = ?auto_3070084 ?auto_3070092 ) ) ( OBJ-AT ?auto_3070087 ?auto_3070092 ) ( OBJ-AT ?auto_3070086 ?auto_3070091 ) ( OBJ-AT ?auto_3070085 ?auto_3070092 ) ( TRUCK-AT ?auto_3070089 ?auto_3070084 ) ( not ( = ?auto_3070085 ?auto_3070086 ) ) ( not ( = ?auto_3070091 ?auto_3070092 ) ) ( not ( = ?auto_3070085 ?auto_3070087 ) ) ( not ( = ?auto_3070086 ?auto_3070087 ) ) ( not ( = ?auto_3070085 ?auto_3070088 ) ) ( not ( = ?auto_3070086 ?auto_3070088 ) ) ( not ( = ?auto_3070087 ?auto_3070088 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_3070085 ?auto_3070087 ?auto_3070086 ?auto_3070084 )
      ( DELIVER-1PKG ?auto_3070088 ?auto_3070084 )
      ( DELIVER-4PKG-VERIFY ?auto_3070085 ?auto_3070086 ?auto_3070087 ?auto_3070088 ?auto_3070084 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3070114 - OBJ
      ?auto_3070115 - OBJ
      ?auto_3070116 - OBJ
      ?auto_3070117 - OBJ
      ?auto_3070113 - LOCATION
    )
    :vars
    (
      ?auto_3070118 - LOCATION
      ?auto_3070119 - CITY
      ?auto_3070120 - LOCATION
      ?auto_3070121 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3070118 ?auto_3070119 ) ( IN-CITY ?auto_3070113 ?auto_3070119 ) ( not ( = ?auto_3070113 ?auto_3070118 ) ) ( OBJ-AT ?auto_3070116 ?auto_3070118 ) ( IN-CITY ?auto_3070120 ?auto_3070119 ) ( not ( = ?auto_3070113 ?auto_3070120 ) ) ( OBJ-AT ?auto_3070117 ?auto_3070120 ) ( OBJ-AT ?auto_3070115 ?auto_3070118 ) ( OBJ-AT ?auto_3070114 ?auto_3070120 ) ( TRUCK-AT ?auto_3070121 ?auto_3070113 ) ( not ( = ?auto_3070114 ?auto_3070115 ) ) ( not ( = ?auto_3070118 ?auto_3070120 ) ) ( not ( = ?auto_3070114 ?auto_3070117 ) ) ( not ( = ?auto_3070115 ?auto_3070117 ) ) ( not ( = ?auto_3070114 ?auto_3070116 ) ) ( not ( = ?auto_3070115 ?auto_3070116 ) ) ( not ( = ?auto_3070117 ?auto_3070116 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3070114 ?auto_3070115 ?auto_3070117 ?auto_3070116 ?auto_3070113 )
      ( DELIVER-4PKG-VERIFY ?auto_3070114 ?auto_3070115 ?auto_3070116 ?auto_3070117 ?auto_3070113 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3070143 - OBJ
      ?auto_3070144 - OBJ
      ?auto_3070145 - OBJ
      ?auto_3070146 - OBJ
      ?auto_3070142 - LOCATION
    )
    :vars
    (
      ?auto_3070148 - LOCATION
      ?auto_3070149 - CITY
      ?auto_3070147 - LOCATION
      ?auto_3070150 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3070148 ?auto_3070149 ) ( IN-CITY ?auto_3070142 ?auto_3070149 ) ( not ( = ?auto_3070142 ?auto_3070148 ) ) ( OBJ-AT ?auto_3070146 ?auto_3070148 ) ( IN-CITY ?auto_3070147 ?auto_3070149 ) ( not ( = ?auto_3070142 ?auto_3070147 ) ) ( OBJ-AT ?auto_3070144 ?auto_3070147 ) ( OBJ-AT ?auto_3070145 ?auto_3070148 ) ( OBJ-AT ?auto_3070143 ?auto_3070147 ) ( TRUCK-AT ?auto_3070150 ?auto_3070142 ) ( not ( = ?auto_3070143 ?auto_3070145 ) ) ( not ( = ?auto_3070148 ?auto_3070147 ) ) ( not ( = ?auto_3070143 ?auto_3070144 ) ) ( not ( = ?auto_3070145 ?auto_3070144 ) ) ( not ( = ?auto_3070143 ?auto_3070146 ) ) ( not ( = ?auto_3070145 ?auto_3070146 ) ) ( not ( = ?auto_3070144 ?auto_3070146 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3070143 ?auto_3070145 ?auto_3070146 ?auto_3070144 ?auto_3070142 )
      ( DELIVER-4PKG-VERIFY ?auto_3070143 ?auto_3070144 ?auto_3070145 ?auto_3070146 ?auto_3070142 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3085253 - OBJ
      ?auto_3085254 - OBJ
      ?auto_3085255 - OBJ
      ?auto_3085256 - OBJ
      ?auto_3085257 - OBJ
      ?auto_3085252 - LOCATION
    )
    :vars
    (
      ?auto_3085259 - LOCATION
      ?auto_3085258 - CITY
      ?auto_3085261 - LOCATION
      ?auto_3085260 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3085259 ?auto_3085258 ) ( IN-CITY ?auto_3085252 ?auto_3085258 ) ( not ( = ?auto_3085252 ?auto_3085259 ) ) ( OBJ-AT ?auto_3085257 ?auto_3085259 ) ( IN-CITY ?auto_3085261 ?auto_3085258 ) ( not ( = ?auto_3085252 ?auto_3085261 ) ) ( OBJ-AT ?auto_3085256 ?auto_3085261 ) ( OBJ-AT ?auto_3085255 ?auto_3085259 ) ( OBJ-AT ?auto_3085254 ?auto_3085261 ) ( OBJ-AT ?auto_3085253 ?auto_3085259 ) ( TRUCK-AT ?auto_3085260 ?auto_3085252 ) ( not ( = ?auto_3085253 ?auto_3085254 ) ) ( not ( = ?auto_3085261 ?auto_3085259 ) ) ( not ( = ?auto_3085253 ?auto_3085255 ) ) ( not ( = ?auto_3085254 ?auto_3085255 ) ) ( not ( = ?auto_3085253 ?auto_3085256 ) ) ( not ( = ?auto_3085254 ?auto_3085256 ) ) ( not ( = ?auto_3085255 ?auto_3085256 ) ) ( not ( = ?auto_3085253 ?auto_3085257 ) ) ( not ( = ?auto_3085254 ?auto_3085257 ) ) ( not ( = ?auto_3085255 ?auto_3085257 ) ) ( not ( = ?auto_3085256 ?auto_3085257 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3085253 ?auto_3085254 ?auto_3085256 ?auto_3085255 ?auto_3085252 )
      ( DELIVER-1PKG ?auto_3085257 ?auto_3085252 )
      ( DELIVER-5PKG-VERIFY ?auto_3085253 ?auto_3085254 ?auto_3085255 ?auto_3085256 ?auto_3085257 ?auto_3085252 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3085296 - OBJ
      ?auto_3085297 - OBJ
      ?auto_3085298 - OBJ
      ?auto_3085299 - OBJ
      ?auto_3085300 - OBJ
      ?auto_3085295 - LOCATION
    )
    :vars
    (
      ?auto_3085301 - LOCATION
      ?auto_3085304 - CITY
      ?auto_3085302 - LOCATION
      ?auto_3085303 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3085301 ?auto_3085304 ) ( IN-CITY ?auto_3085295 ?auto_3085304 ) ( not ( = ?auto_3085295 ?auto_3085301 ) ) ( OBJ-AT ?auto_3085299 ?auto_3085301 ) ( IN-CITY ?auto_3085302 ?auto_3085304 ) ( not ( = ?auto_3085295 ?auto_3085302 ) ) ( OBJ-AT ?auto_3085300 ?auto_3085302 ) ( OBJ-AT ?auto_3085298 ?auto_3085301 ) ( OBJ-AT ?auto_3085297 ?auto_3085302 ) ( OBJ-AT ?auto_3085296 ?auto_3085301 ) ( TRUCK-AT ?auto_3085303 ?auto_3085295 ) ( not ( = ?auto_3085296 ?auto_3085297 ) ) ( not ( = ?auto_3085302 ?auto_3085301 ) ) ( not ( = ?auto_3085296 ?auto_3085298 ) ) ( not ( = ?auto_3085297 ?auto_3085298 ) ) ( not ( = ?auto_3085296 ?auto_3085300 ) ) ( not ( = ?auto_3085297 ?auto_3085300 ) ) ( not ( = ?auto_3085298 ?auto_3085300 ) ) ( not ( = ?auto_3085296 ?auto_3085299 ) ) ( not ( = ?auto_3085297 ?auto_3085299 ) ) ( not ( = ?auto_3085298 ?auto_3085299 ) ) ( not ( = ?auto_3085300 ?auto_3085299 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3085296 ?auto_3085297 ?auto_3085298 ?auto_3085300 ?auto_3085299 ?auto_3085295 )
      ( DELIVER-5PKG-VERIFY ?auto_3085296 ?auto_3085297 ?auto_3085298 ?auto_3085299 ?auto_3085300 ?auto_3085295 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3085339 - OBJ
      ?auto_3085340 - OBJ
      ?auto_3085341 - OBJ
      ?auto_3085342 - OBJ
      ?auto_3085343 - OBJ
      ?auto_3085338 - LOCATION
    )
    :vars
    (
      ?auto_3085344 - LOCATION
      ?auto_3085345 - CITY
      ?auto_3085346 - LOCATION
      ?auto_3085347 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3085344 ?auto_3085345 ) ( IN-CITY ?auto_3085338 ?auto_3085345 ) ( not ( = ?auto_3085338 ?auto_3085344 ) ) ( OBJ-AT ?auto_3085343 ?auto_3085344 ) ( IN-CITY ?auto_3085346 ?auto_3085345 ) ( not ( = ?auto_3085338 ?auto_3085346 ) ) ( OBJ-AT ?auto_3085341 ?auto_3085346 ) ( OBJ-AT ?auto_3085342 ?auto_3085344 ) ( OBJ-AT ?auto_3085340 ?auto_3085346 ) ( OBJ-AT ?auto_3085339 ?auto_3085344 ) ( TRUCK-AT ?auto_3085347 ?auto_3085338 ) ( not ( = ?auto_3085339 ?auto_3085340 ) ) ( not ( = ?auto_3085346 ?auto_3085344 ) ) ( not ( = ?auto_3085339 ?auto_3085342 ) ) ( not ( = ?auto_3085340 ?auto_3085342 ) ) ( not ( = ?auto_3085339 ?auto_3085341 ) ) ( not ( = ?auto_3085340 ?auto_3085341 ) ) ( not ( = ?auto_3085342 ?auto_3085341 ) ) ( not ( = ?auto_3085339 ?auto_3085343 ) ) ( not ( = ?auto_3085340 ?auto_3085343 ) ) ( not ( = ?auto_3085342 ?auto_3085343 ) ) ( not ( = ?auto_3085341 ?auto_3085343 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3085339 ?auto_3085340 ?auto_3085342 ?auto_3085343 ?auto_3085341 ?auto_3085338 )
      ( DELIVER-5PKG-VERIFY ?auto_3085339 ?auto_3085340 ?auto_3085341 ?auto_3085342 ?auto_3085343 ?auto_3085338 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3085821 - OBJ
      ?auto_3085822 - OBJ
      ?auto_3085823 - OBJ
      ?auto_3085824 - OBJ
      ?auto_3085825 - OBJ
      ?auto_3085820 - LOCATION
    )
    :vars
    (
      ?auto_3085826 - LOCATION
      ?auto_3085827 - CITY
      ?auto_3085828 - LOCATION
      ?auto_3085829 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3085826 ?auto_3085827 ) ( IN-CITY ?auto_3085820 ?auto_3085827 ) ( not ( = ?auto_3085820 ?auto_3085826 ) ) ( OBJ-AT ?auto_3085825 ?auto_3085826 ) ( IN-CITY ?auto_3085828 ?auto_3085827 ) ( not ( = ?auto_3085820 ?auto_3085828 ) ) ( OBJ-AT ?auto_3085824 ?auto_3085828 ) ( OBJ-AT ?auto_3085822 ?auto_3085826 ) ( OBJ-AT ?auto_3085823 ?auto_3085828 ) ( OBJ-AT ?auto_3085821 ?auto_3085826 ) ( TRUCK-AT ?auto_3085829 ?auto_3085820 ) ( not ( = ?auto_3085821 ?auto_3085823 ) ) ( not ( = ?auto_3085828 ?auto_3085826 ) ) ( not ( = ?auto_3085821 ?auto_3085822 ) ) ( not ( = ?auto_3085823 ?auto_3085822 ) ) ( not ( = ?auto_3085821 ?auto_3085824 ) ) ( not ( = ?auto_3085823 ?auto_3085824 ) ) ( not ( = ?auto_3085822 ?auto_3085824 ) ) ( not ( = ?auto_3085821 ?auto_3085825 ) ) ( not ( = ?auto_3085823 ?auto_3085825 ) ) ( not ( = ?auto_3085822 ?auto_3085825 ) ) ( not ( = ?auto_3085824 ?auto_3085825 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3085821 ?auto_3085823 ?auto_3085822 ?auto_3085825 ?auto_3085824 ?auto_3085820 )
      ( DELIVER-5PKG-VERIFY ?auto_3085821 ?auto_3085822 ?auto_3085823 ?auto_3085824 ?auto_3085825 ?auto_3085820 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3085864 - OBJ
      ?auto_3085865 - OBJ
      ?auto_3085866 - OBJ
      ?auto_3085867 - OBJ
      ?auto_3085868 - OBJ
      ?auto_3085863 - LOCATION
    )
    :vars
    (
      ?auto_3085869 - LOCATION
      ?auto_3085870 - CITY
      ?auto_3085871 - LOCATION
      ?auto_3085872 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3085869 ?auto_3085870 ) ( IN-CITY ?auto_3085863 ?auto_3085870 ) ( not ( = ?auto_3085863 ?auto_3085869 ) ) ( OBJ-AT ?auto_3085867 ?auto_3085869 ) ( IN-CITY ?auto_3085871 ?auto_3085870 ) ( not ( = ?auto_3085863 ?auto_3085871 ) ) ( OBJ-AT ?auto_3085868 ?auto_3085871 ) ( OBJ-AT ?auto_3085865 ?auto_3085869 ) ( OBJ-AT ?auto_3085866 ?auto_3085871 ) ( OBJ-AT ?auto_3085864 ?auto_3085869 ) ( TRUCK-AT ?auto_3085872 ?auto_3085863 ) ( not ( = ?auto_3085864 ?auto_3085866 ) ) ( not ( = ?auto_3085871 ?auto_3085869 ) ) ( not ( = ?auto_3085864 ?auto_3085865 ) ) ( not ( = ?auto_3085866 ?auto_3085865 ) ) ( not ( = ?auto_3085864 ?auto_3085868 ) ) ( not ( = ?auto_3085866 ?auto_3085868 ) ) ( not ( = ?auto_3085865 ?auto_3085868 ) ) ( not ( = ?auto_3085864 ?auto_3085867 ) ) ( not ( = ?auto_3085866 ?auto_3085867 ) ) ( not ( = ?auto_3085865 ?auto_3085867 ) ) ( not ( = ?auto_3085868 ?auto_3085867 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3085864 ?auto_3085866 ?auto_3085865 ?auto_3085867 ?auto_3085868 ?auto_3085863 )
      ( DELIVER-5PKG-VERIFY ?auto_3085864 ?auto_3085865 ?auto_3085866 ?auto_3085867 ?auto_3085868 ?auto_3085863 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3086169 - OBJ
      ?auto_3086170 - OBJ
      ?auto_3086171 - OBJ
      ?auto_3086172 - OBJ
      ?auto_3086173 - OBJ
      ?auto_3086168 - LOCATION
    )
    :vars
    (
      ?auto_3086174 - LOCATION
      ?auto_3086175 - CITY
      ?auto_3086176 - LOCATION
      ?auto_3086177 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3086174 ?auto_3086175 ) ( IN-CITY ?auto_3086168 ?auto_3086175 ) ( not ( = ?auto_3086168 ?auto_3086174 ) ) ( OBJ-AT ?auto_3086171 ?auto_3086174 ) ( IN-CITY ?auto_3086176 ?auto_3086175 ) ( not ( = ?auto_3086168 ?auto_3086176 ) ) ( OBJ-AT ?auto_3086173 ?auto_3086176 ) ( OBJ-AT ?auto_3086170 ?auto_3086174 ) ( OBJ-AT ?auto_3086172 ?auto_3086176 ) ( OBJ-AT ?auto_3086169 ?auto_3086174 ) ( TRUCK-AT ?auto_3086177 ?auto_3086168 ) ( not ( = ?auto_3086169 ?auto_3086172 ) ) ( not ( = ?auto_3086176 ?auto_3086174 ) ) ( not ( = ?auto_3086169 ?auto_3086170 ) ) ( not ( = ?auto_3086172 ?auto_3086170 ) ) ( not ( = ?auto_3086169 ?auto_3086173 ) ) ( not ( = ?auto_3086172 ?auto_3086173 ) ) ( not ( = ?auto_3086170 ?auto_3086173 ) ) ( not ( = ?auto_3086169 ?auto_3086171 ) ) ( not ( = ?auto_3086172 ?auto_3086171 ) ) ( not ( = ?auto_3086170 ?auto_3086171 ) ) ( not ( = ?auto_3086173 ?auto_3086171 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3086169 ?auto_3086172 ?auto_3086170 ?auto_3086171 ?auto_3086173 ?auto_3086168 )
      ( DELIVER-5PKG-VERIFY ?auto_3086169 ?auto_3086170 ?auto_3086171 ?auto_3086172 ?auto_3086173 ?auto_3086168 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3088675 - OBJ
      ?auto_3088676 - OBJ
      ?auto_3088677 - OBJ
      ?auto_3088678 - OBJ
      ?auto_3088679 - OBJ
      ?auto_3088674 - LOCATION
    )
    :vars
    (
      ?auto_3088680 - LOCATION
      ?auto_3088681 - CITY
      ?auto_3088682 - LOCATION
      ?auto_3088683 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3088680 ?auto_3088681 ) ( IN-CITY ?auto_3088674 ?auto_3088681 ) ( not ( = ?auto_3088674 ?auto_3088680 ) ) ( OBJ-AT ?auto_3088679 ?auto_3088680 ) ( IN-CITY ?auto_3088682 ?auto_3088681 ) ( not ( = ?auto_3088674 ?auto_3088682 ) ) ( OBJ-AT ?auto_3088678 ?auto_3088682 ) ( OBJ-AT ?auto_3088677 ?auto_3088680 ) ( OBJ-AT ?auto_3088675 ?auto_3088682 ) ( OBJ-AT ?auto_3088676 ?auto_3088680 ) ( TRUCK-AT ?auto_3088683 ?auto_3088674 ) ( not ( = ?auto_3088676 ?auto_3088675 ) ) ( not ( = ?auto_3088682 ?auto_3088680 ) ) ( not ( = ?auto_3088676 ?auto_3088677 ) ) ( not ( = ?auto_3088675 ?auto_3088677 ) ) ( not ( = ?auto_3088676 ?auto_3088678 ) ) ( not ( = ?auto_3088675 ?auto_3088678 ) ) ( not ( = ?auto_3088677 ?auto_3088678 ) ) ( not ( = ?auto_3088676 ?auto_3088679 ) ) ( not ( = ?auto_3088675 ?auto_3088679 ) ) ( not ( = ?auto_3088677 ?auto_3088679 ) ) ( not ( = ?auto_3088678 ?auto_3088679 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3088676 ?auto_3088675 ?auto_3088677 ?auto_3088679 ?auto_3088678 ?auto_3088674 )
      ( DELIVER-5PKG-VERIFY ?auto_3088675 ?auto_3088676 ?auto_3088677 ?auto_3088678 ?auto_3088679 ?auto_3088674 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3088718 - OBJ
      ?auto_3088719 - OBJ
      ?auto_3088720 - OBJ
      ?auto_3088721 - OBJ
      ?auto_3088722 - OBJ
      ?auto_3088717 - LOCATION
    )
    :vars
    (
      ?auto_3088723 - LOCATION
      ?auto_3088724 - CITY
      ?auto_3088725 - LOCATION
      ?auto_3088726 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3088723 ?auto_3088724 ) ( IN-CITY ?auto_3088717 ?auto_3088724 ) ( not ( = ?auto_3088717 ?auto_3088723 ) ) ( OBJ-AT ?auto_3088721 ?auto_3088723 ) ( IN-CITY ?auto_3088725 ?auto_3088724 ) ( not ( = ?auto_3088717 ?auto_3088725 ) ) ( OBJ-AT ?auto_3088722 ?auto_3088725 ) ( OBJ-AT ?auto_3088720 ?auto_3088723 ) ( OBJ-AT ?auto_3088718 ?auto_3088725 ) ( OBJ-AT ?auto_3088719 ?auto_3088723 ) ( TRUCK-AT ?auto_3088726 ?auto_3088717 ) ( not ( = ?auto_3088719 ?auto_3088718 ) ) ( not ( = ?auto_3088725 ?auto_3088723 ) ) ( not ( = ?auto_3088719 ?auto_3088720 ) ) ( not ( = ?auto_3088718 ?auto_3088720 ) ) ( not ( = ?auto_3088719 ?auto_3088722 ) ) ( not ( = ?auto_3088718 ?auto_3088722 ) ) ( not ( = ?auto_3088720 ?auto_3088722 ) ) ( not ( = ?auto_3088719 ?auto_3088721 ) ) ( not ( = ?auto_3088718 ?auto_3088721 ) ) ( not ( = ?auto_3088720 ?auto_3088721 ) ) ( not ( = ?auto_3088722 ?auto_3088721 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3088719 ?auto_3088718 ?auto_3088720 ?auto_3088721 ?auto_3088722 ?auto_3088717 )
      ( DELIVER-5PKG-VERIFY ?auto_3088718 ?auto_3088719 ?auto_3088720 ?auto_3088721 ?auto_3088722 ?auto_3088717 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3088761 - OBJ
      ?auto_3088762 - OBJ
      ?auto_3088763 - OBJ
      ?auto_3088764 - OBJ
      ?auto_3088765 - OBJ
      ?auto_3088760 - LOCATION
    )
    :vars
    (
      ?auto_3088766 - LOCATION
      ?auto_3088767 - CITY
      ?auto_3088768 - LOCATION
      ?auto_3088769 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3088766 ?auto_3088767 ) ( IN-CITY ?auto_3088760 ?auto_3088767 ) ( not ( = ?auto_3088760 ?auto_3088766 ) ) ( OBJ-AT ?auto_3088765 ?auto_3088766 ) ( IN-CITY ?auto_3088768 ?auto_3088767 ) ( not ( = ?auto_3088760 ?auto_3088768 ) ) ( OBJ-AT ?auto_3088763 ?auto_3088768 ) ( OBJ-AT ?auto_3088764 ?auto_3088766 ) ( OBJ-AT ?auto_3088761 ?auto_3088768 ) ( OBJ-AT ?auto_3088762 ?auto_3088766 ) ( TRUCK-AT ?auto_3088769 ?auto_3088760 ) ( not ( = ?auto_3088762 ?auto_3088761 ) ) ( not ( = ?auto_3088768 ?auto_3088766 ) ) ( not ( = ?auto_3088762 ?auto_3088764 ) ) ( not ( = ?auto_3088761 ?auto_3088764 ) ) ( not ( = ?auto_3088762 ?auto_3088763 ) ) ( not ( = ?auto_3088761 ?auto_3088763 ) ) ( not ( = ?auto_3088764 ?auto_3088763 ) ) ( not ( = ?auto_3088762 ?auto_3088765 ) ) ( not ( = ?auto_3088761 ?auto_3088765 ) ) ( not ( = ?auto_3088764 ?auto_3088765 ) ) ( not ( = ?auto_3088763 ?auto_3088765 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3088762 ?auto_3088761 ?auto_3088764 ?auto_3088765 ?auto_3088763 ?auto_3088760 )
      ( DELIVER-5PKG-VERIFY ?auto_3088761 ?auto_3088762 ?auto_3088763 ?auto_3088764 ?auto_3088765 ?auto_3088760 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3090509 - OBJ
      ?auto_3090510 - OBJ
      ?auto_3090511 - OBJ
      ?auto_3090512 - OBJ
      ?auto_3090513 - OBJ
      ?auto_3090508 - LOCATION
    )
    :vars
    (
      ?auto_3090514 - LOCATION
      ?auto_3090515 - CITY
      ?auto_3090516 - LOCATION
      ?auto_3090517 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3090514 ?auto_3090515 ) ( IN-CITY ?auto_3090508 ?auto_3090515 ) ( not ( = ?auto_3090508 ?auto_3090514 ) ) ( OBJ-AT ?auto_3090513 ?auto_3090514 ) ( IN-CITY ?auto_3090516 ?auto_3090515 ) ( not ( = ?auto_3090508 ?auto_3090516 ) ) ( OBJ-AT ?auto_3090510 ?auto_3090516 ) ( OBJ-AT ?auto_3090512 ?auto_3090514 ) ( OBJ-AT ?auto_3090509 ?auto_3090516 ) ( OBJ-AT ?auto_3090511 ?auto_3090514 ) ( TRUCK-AT ?auto_3090517 ?auto_3090508 ) ( not ( = ?auto_3090511 ?auto_3090509 ) ) ( not ( = ?auto_3090516 ?auto_3090514 ) ) ( not ( = ?auto_3090511 ?auto_3090512 ) ) ( not ( = ?auto_3090509 ?auto_3090512 ) ) ( not ( = ?auto_3090511 ?auto_3090510 ) ) ( not ( = ?auto_3090509 ?auto_3090510 ) ) ( not ( = ?auto_3090512 ?auto_3090510 ) ) ( not ( = ?auto_3090511 ?auto_3090513 ) ) ( not ( = ?auto_3090509 ?auto_3090513 ) ) ( not ( = ?auto_3090512 ?auto_3090513 ) ) ( not ( = ?auto_3090510 ?auto_3090513 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3090511 ?auto_3090509 ?auto_3090512 ?auto_3090513 ?auto_3090510 ?auto_3090508 )
      ( DELIVER-5PKG-VERIFY ?auto_3090509 ?auto_3090510 ?auto_3090511 ?auto_3090512 ?auto_3090513 ?auto_3090508 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3336899 - OBJ
      ?auto_3336900 - OBJ
      ?auto_3336901 - OBJ
      ?auto_3336902 - OBJ
      ?auto_3336903 - OBJ
      ?auto_3336904 - OBJ
      ?auto_3336898 - LOCATION
    )
    :vars
    (
      ?auto_3336905 - LOCATION
      ?auto_3336906 - CITY
      ?auto_3336908 - LOCATION
      ?auto_3336907 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3336905 ?auto_3336906 ) ( IN-CITY ?auto_3336898 ?auto_3336906 ) ( not ( = ?auto_3336898 ?auto_3336905 ) ) ( OBJ-AT ?auto_3336904 ?auto_3336905 ) ( IN-CITY ?auto_3336908 ?auto_3336906 ) ( not ( = ?auto_3336898 ?auto_3336908 ) ) ( OBJ-AT ?auto_3336903 ?auto_3336908 ) ( OBJ-AT ?auto_3336902 ?auto_3336905 ) ( OBJ-AT ?auto_3336901 ?auto_3336908 ) ( OBJ-AT ?auto_3336900 ?auto_3336905 ) ( OBJ-AT ?auto_3336899 ?auto_3336908 ) ( TRUCK-AT ?auto_3336907 ?auto_3336898 ) ( not ( = ?auto_3336899 ?auto_3336900 ) ) ( not ( = ?auto_3336905 ?auto_3336908 ) ) ( not ( = ?auto_3336899 ?auto_3336901 ) ) ( not ( = ?auto_3336900 ?auto_3336901 ) ) ( not ( = ?auto_3336899 ?auto_3336902 ) ) ( not ( = ?auto_3336900 ?auto_3336902 ) ) ( not ( = ?auto_3336901 ?auto_3336902 ) ) ( not ( = ?auto_3336899 ?auto_3336903 ) ) ( not ( = ?auto_3336900 ?auto_3336903 ) ) ( not ( = ?auto_3336901 ?auto_3336903 ) ) ( not ( = ?auto_3336902 ?auto_3336903 ) ) ( not ( = ?auto_3336899 ?auto_3336904 ) ) ( not ( = ?auto_3336900 ?auto_3336904 ) ) ( not ( = ?auto_3336901 ?auto_3336904 ) ) ( not ( = ?auto_3336902 ?auto_3336904 ) ) ( not ( = ?auto_3336903 ?auto_3336904 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3336899 ?auto_3336900 ?auto_3336901 ?auto_3336903 ?auto_3336902 ?auto_3336898 )
      ( DELIVER-1PKG ?auto_3336904 ?auto_3336898 )
      ( DELIVER-6PKG-VERIFY ?auto_3336899 ?auto_3336900 ?auto_3336901 ?auto_3336902 ?auto_3336903 ?auto_3336904 ?auto_3336898 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3336958 - OBJ
      ?auto_3336959 - OBJ
      ?auto_3336960 - OBJ
      ?auto_3336961 - OBJ
      ?auto_3336962 - OBJ
      ?auto_3336963 - OBJ
      ?auto_3336957 - LOCATION
    )
    :vars
    (
      ?auto_3336965 - LOCATION
      ?auto_3336966 - CITY
      ?auto_3336964 - LOCATION
      ?auto_3336967 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3336965 ?auto_3336966 ) ( IN-CITY ?auto_3336957 ?auto_3336966 ) ( not ( = ?auto_3336957 ?auto_3336965 ) ) ( OBJ-AT ?auto_3336962 ?auto_3336965 ) ( IN-CITY ?auto_3336964 ?auto_3336966 ) ( not ( = ?auto_3336957 ?auto_3336964 ) ) ( OBJ-AT ?auto_3336963 ?auto_3336964 ) ( OBJ-AT ?auto_3336961 ?auto_3336965 ) ( OBJ-AT ?auto_3336960 ?auto_3336964 ) ( OBJ-AT ?auto_3336959 ?auto_3336965 ) ( OBJ-AT ?auto_3336958 ?auto_3336964 ) ( TRUCK-AT ?auto_3336967 ?auto_3336957 ) ( not ( = ?auto_3336958 ?auto_3336959 ) ) ( not ( = ?auto_3336965 ?auto_3336964 ) ) ( not ( = ?auto_3336958 ?auto_3336960 ) ) ( not ( = ?auto_3336959 ?auto_3336960 ) ) ( not ( = ?auto_3336958 ?auto_3336961 ) ) ( not ( = ?auto_3336959 ?auto_3336961 ) ) ( not ( = ?auto_3336960 ?auto_3336961 ) ) ( not ( = ?auto_3336958 ?auto_3336963 ) ) ( not ( = ?auto_3336959 ?auto_3336963 ) ) ( not ( = ?auto_3336960 ?auto_3336963 ) ) ( not ( = ?auto_3336961 ?auto_3336963 ) ) ( not ( = ?auto_3336958 ?auto_3336962 ) ) ( not ( = ?auto_3336959 ?auto_3336962 ) ) ( not ( = ?auto_3336960 ?auto_3336962 ) ) ( not ( = ?auto_3336961 ?auto_3336962 ) ) ( not ( = ?auto_3336963 ?auto_3336962 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3336958 ?auto_3336959 ?auto_3336960 ?auto_3336961 ?auto_3336963 ?auto_3336962 ?auto_3336957 )
      ( DELIVER-6PKG-VERIFY ?auto_3336958 ?auto_3336959 ?auto_3336960 ?auto_3336961 ?auto_3336962 ?auto_3336963 ?auto_3336957 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3337017 - OBJ
      ?auto_3337018 - OBJ
      ?auto_3337019 - OBJ
      ?auto_3337020 - OBJ
      ?auto_3337021 - OBJ
      ?auto_3337022 - OBJ
      ?auto_3337016 - LOCATION
    )
    :vars
    (
      ?auto_3337026 - LOCATION
      ?auto_3337024 - CITY
      ?auto_3337025 - LOCATION
      ?auto_3337023 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3337026 ?auto_3337024 ) ( IN-CITY ?auto_3337016 ?auto_3337024 ) ( not ( = ?auto_3337016 ?auto_3337026 ) ) ( OBJ-AT ?auto_3337022 ?auto_3337026 ) ( IN-CITY ?auto_3337025 ?auto_3337024 ) ( not ( = ?auto_3337016 ?auto_3337025 ) ) ( OBJ-AT ?auto_3337020 ?auto_3337025 ) ( OBJ-AT ?auto_3337021 ?auto_3337026 ) ( OBJ-AT ?auto_3337019 ?auto_3337025 ) ( OBJ-AT ?auto_3337018 ?auto_3337026 ) ( OBJ-AT ?auto_3337017 ?auto_3337025 ) ( TRUCK-AT ?auto_3337023 ?auto_3337016 ) ( not ( = ?auto_3337017 ?auto_3337018 ) ) ( not ( = ?auto_3337026 ?auto_3337025 ) ) ( not ( = ?auto_3337017 ?auto_3337019 ) ) ( not ( = ?auto_3337018 ?auto_3337019 ) ) ( not ( = ?auto_3337017 ?auto_3337021 ) ) ( not ( = ?auto_3337018 ?auto_3337021 ) ) ( not ( = ?auto_3337019 ?auto_3337021 ) ) ( not ( = ?auto_3337017 ?auto_3337020 ) ) ( not ( = ?auto_3337018 ?auto_3337020 ) ) ( not ( = ?auto_3337019 ?auto_3337020 ) ) ( not ( = ?auto_3337021 ?auto_3337020 ) ) ( not ( = ?auto_3337017 ?auto_3337022 ) ) ( not ( = ?auto_3337018 ?auto_3337022 ) ) ( not ( = ?auto_3337019 ?auto_3337022 ) ) ( not ( = ?auto_3337021 ?auto_3337022 ) ) ( not ( = ?auto_3337020 ?auto_3337022 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3337017 ?auto_3337018 ?auto_3337019 ?auto_3337021 ?auto_3337022 ?auto_3337020 ?auto_3337016 )
      ( DELIVER-6PKG-VERIFY ?auto_3337017 ?auto_3337018 ?auto_3337019 ?auto_3337020 ?auto_3337021 ?auto_3337022 ?auto_3337016 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3337871 - OBJ
      ?auto_3337872 - OBJ
      ?auto_3337873 - OBJ
      ?auto_3337874 - OBJ
      ?auto_3337875 - OBJ
      ?auto_3337876 - OBJ
      ?auto_3337870 - LOCATION
    )
    :vars
    (
      ?auto_3337880 - LOCATION
      ?auto_3337878 - CITY
      ?auto_3337879 - LOCATION
      ?auto_3337877 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3337880 ?auto_3337878 ) ( IN-CITY ?auto_3337870 ?auto_3337878 ) ( not ( = ?auto_3337870 ?auto_3337880 ) ) ( OBJ-AT ?auto_3337876 ?auto_3337880 ) ( IN-CITY ?auto_3337879 ?auto_3337878 ) ( not ( = ?auto_3337870 ?auto_3337879 ) ) ( OBJ-AT ?auto_3337875 ?auto_3337879 ) ( OBJ-AT ?auto_3337873 ?auto_3337880 ) ( OBJ-AT ?auto_3337874 ?auto_3337879 ) ( OBJ-AT ?auto_3337872 ?auto_3337880 ) ( OBJ-AT ?auto_3337871 ?auto_3337879 ) ( TRUCK-AT ?auto_3337877 ?auto_3337870 ) ( not ( = ?auto_3337871 ?auto_3337872 ) ) ( not ( = ?auto_3337880 ?auto_3337879 ) ) ( not ( = ?auto_3337871 ?auto_3337874 ) ) ( not ( = ?auto_3337872 ?auto_3337874 ) ) ( not ( = ?auto_3337871 ?auto_3337873 ) ) ( not ( = ?auto_3337872 ?auto_3337873 ) ) ( not ( = ?auto_3337874 ?auto_3337873 ) ) ( not ( = ?auto_3337871 ?auto_3337875 ) ) ( not ( = ?auto_3337872 ?auto_3337875 ) ) ( not ( = ?auto_3337874 ?auto_3337875 ) ) ( not ( = ?auto_3337873 ?auto_3337875 ) ) ( not ( = ?auto_3337871 ?auto_3337876 ) ) ( not ( = ?auto_3337872 ?auto_3337876 ) ) ( not ( = ?auto_3337874 ?auto_3337876 ) ) ( not ( = ?auto_3337873 ?auto_3337876 ) ) ( not ( = ?auto_3337875 ?auto_3337876 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3337871 ?auto_3337872 ?auto_3337874 ?auto_3337873 ?auto_3337876 ?auto_3337875 ?auto_3337870 )
      ( DELIVER-6PKG-VERIFY ?auto_3337871 ?auto_3337872 ?auto_3337873 ?auto_3337874 ?auto_3337875 ?auto_3337876 ?auto_3337870 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3337930 - OBJ
      ?auto_3337931 - OBJ
      ?auto_3337932 - OBJ
      ?auto_3337933 - OBJ
      ?auto_3337934 - OBJ
      ?auto_3337935 - OBJ
      ?auto_3337929 - LOCATION
    )
    :vars
    (
      ?auto_3337939 - LOCATION
      ?auto_3337937 - CITY
      ?auto_3337938 - LOCATION
      ?auto_3337936 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3337939 ?auto_3337937 ) ( IN-CITY ?auto_3337929 ?auto_3337937 ) ( not ( = ?auto_3337929 ?auto_3337939 ) ) ( OBJ-AT ?auto_3337934 ?auto_3337939 ) ( IN-CITY ?auto_3337938 ?auto_3337937 ) ( not ( = ?auto_3337929 ?auto_3337938 ) ) ( OBJ-AT ?auto_3337935 ?auto_3337938 ) ( OBJ-AT ?auto_3337932 ?auto_3337939 ) ( OBJ-AT ?auto_3337933 ?auto_3337938 ) ( OBJ-AT ?auto_3337931 ?auto_3337939 ) ( OBJ-AT ?auto_3337930 ?auto_3337938 ) ( TRUCK-AT ?auto_3337936 ?auto_3337929 ) ( not ( = ?auto_3337930 ?auto_3337931 ) ) ( not ( = ?auto_3337939 ?auto_3337938 ) ) ( not ( = ?auto_3337930 ?auto_3337933 ) ) ( not ( = ?auto_3337931 ?auto_3337933 ) ) ( not ( = ?auto_3337930 ?auto_3337932 ) ) ( not ( = ?auto_3337931 ?auto_3337932 ) ) ( not ( = ?auto_3337933 ?auto_3337932 ) ) ( not ( = ?auto_3337930 ?auto_3337935 ) ) ( not ( = ?auto_3337931 ?auto_3337935 ) ) ( not ( = ?auto_3337933 ?auto_3337935 ) ) ( not ( = ?auto_3337932 ?auto_3337935 ) ) ( not ( = ?auto_3337930 ?auto_3337934 ) ) ( not ( = ?auto_3337931 ?auto_3337934 ) ) ( not ( = ?auto_3337933 ?auto_3337934 ) ) ( not ( = ?auto_3337932 ?auto_3337934 ) ) ( not ( = ?auto_3337935 ?auto_3337934 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3337930 ?auto_3337931 ?auto_3337933 ?auto_3337932 ?auto_3337934 ?auto_3337935 ?auto_3337929 )
      ( DELIVER-6PKG-VERIFY ?auto_3337930 ?auto_3337931 ?auto_3337932 ?auto_3337933 ?auto_3337934 ?auto_3337935 ?auto_3337929 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3338414 - OBJ
      ?auto_3338415 - OBJ
      ?auto_3338416 - OBJ
      ?auto_3338417 - OBJ
      ?auto_3338418 - OBJ
      ?auto_3338419 - OBJ
      ?auto_3338413 - LOCATION
    )
    :vars
    (
      ?auto_3338423 - LOCATION
      ?auto_3338421 - CITY
      ?auto_3338422 - LOCATION
      ?auto_3338420 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3338423 ?auto_3338421 ) ( IN-CITY ?auto_3338413 ?auto_3338421 ) ( not ( = ?auto_3338413 ?auto_3338423 ) ) ( OBJ-AT ?auto_3338417 ?auto_3338423 ) ( IN-CITY ?auto_3338422 ?auto_3338421 ) ( not ( = ?auto_3338413 ?auto_3338422 ) ) ( OBJ-AT ?auto_3338419 ?auto_3338422 ) ( OBJ-AT ?auto_3338416 ?auto_3338423 ) ( OBJ-AT ?auto_3338418 ?auto_3338422 ) ( OBJ-AT ?auto_3338415 ?auto_3338423 ) ( OBJ-AT ?auto_3338414 ?auto_3338422 ) ( TRUCK-AT ?auto_3338420 ?auto_3338413 ) ( not ( = ?auto_3338414 ?auto_3338415 ) ) ( not ( = ?auto_3338423 ?auto_3338422 ) ) ( not ( = ?auto_3338414 ?auto_3338418 ) ) ( not ( = ?auto_3338415 ?auto_3338418 ) ) ( not ( = ?auto_3338414 ?auto_3338416 ) ) ( not ( = ?auto_3338415 ?auto_3338416 ) ) ( not ( = ?auto_3338418 ?auto_3338416 ) ) ( not ( = ?auto_3338414 ?auto_3338419 ) ) ( not ( = ?auto_3338415 ?auto_3338419 ) ) ( not ( = ?auto_3338418 ?auto_3338419 ) ) ( not ( = ?auto_3338416 ?auto_3338419 ) ) ( not ( = ?auto_3338414 ?auto_3338417 ) ) ( not ( = ?auto_3338415 ?auto_3338417 ) ) ( not ( = ?auto_3338418 ?auto_3338417 ) ) ( not ( = ?auto_3338416 ?auto_3338417 ) ) ( not ( = ?auto_3338419 ?auto_3338417 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3338414 ?auto_3338415 ?auto_3338418 ?auto_3338416 ?auto_3338417 ?auto_3338419 ?auto_3338413 )
      ( DELIVER-6PKG-VERIFY ?auto_3338414 ?auto_3338415 ?auto_3338416 ?auto_3338417 ?auto_3338418 ?auto_3338419 ?auto_3338413 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3344131 - OBJ
      ?auto_3344132 - OBJ
      ?auto_3344133 - OBJ
      ?auto_3344134 - OBJ
      ?auto_3344135 - OBJ
      ?auto_3344136 - OBJ
      ?auto_3344130 - LOCATION
    )
    :vars
    (
      ?auto_3344140 - LOCATION
      ?auto_3344138 - CITY
      ?auto_3344139 - LOCATION
      ?auto_3344137 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3344140 ?auto_3344138 ) ( IN-CITY ?auto_3344130 ?auto_3344138 ) ( not ( = ?auto_3344130 ?auto_3344140 ) ) ( OBJ-AT ?auto_3344136 ?auto_3344140 ) ( IN-CITY ?auto_3344139 ?auto_3344138 ) ( not ( = ?auto_3344130 ?auto_3344139 ) ) ( OBJ-AT ?auto_3344135 ?auto_3344139 ) ( OBJ-AT ?auto_3344134 ?auto_3344140 ) ( OBJ-AT ?auto_3344132 ?auto_3344139 ) ( OBJ-AT ?auto_3344133 ?auto_3344140 ) ( OBJ-AT ?auto_3344131 ?auto_3344139 ) ( TRUCK-AT ?auto_3344137 ?auto_3344130 ) ( not ( = ?auto_3344131 ?auto_3344133 ) ) ( not ( = ?auto_3344140 ?auto_3344139 ) ) ( not ( = ?auto_3344131 ?auto_3344132 ) ) ( not ( = ?auto_3344133 ?auto_3344132 ) ) ( not ( = ?auto_3344131 ?auto_3344134 ) ) ( not ( = ?auto_3344133 ?auto_3344134 ) ) ( not ( = ?auto_3344132 ?auto_3344134 ) ) ( not ( = ?auto_3344131 ?auto_3344135 ) ) ( not ( = ?auto_3344133 ?auto_3344135 ) ) ( not ( = ?auto_3344132 ?auto_3344135 ) ) ( not ( = ?auto_3344134 ?auto_3344135 ) ) ( not ( = ?auto_3344131 ?auto_3344136 ) ) ( not ( = ?auto_3344133 ?auto_3344136 ) ) ( not ( = ?auto_3344132 ?auto_3344136 ) ) ( not ( = ?auto_3344134 ?auto_3344136 ) ) ( not ( = ?auto_3344135 ?auto_3344136 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3344131 ?auto_3344133 ?auto_3344132 ?auto_3344134 ?auto_3344136 ?auto_3344135 ?auto_3344130 )
      ( DELIVER-6PKG-VERIFY ?auto_3344131 ?auto_3344132 ?auto_3344133 ?auto_3344134 ?auto_3344135 ?auto_3344136 ?auto_3344130 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3344190 - OBJ
      ?auto_3344191 - OBJ
      ?auto_3344192 - OBJ
      ?auto_3344193 - OBJ
      ?auto_3344194 - OBJ
      ?auto_3344195 - OBJ
      ?auto_3344189 - LOCATION
    )
    :vars
    (
      ?auto_3344199 - LOCATION
      ?auto_3344197 - CITY
      ?auto_3344198 - LOCATION
      ?auto_3344196 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3344199 ?auto_3344197 ) ( IN-CITY ?auto_3344189 ?auto_3344197 ) ( not ( = ?auto_3344189 ?auto_3344199 ) ) ( OBJ-AT ?auto_3344194 ?auto_3344199 ) ( IN-CITY ?auto_3344198 ?auto_3344197 ) ( not ( = ?auto_3344189 ?auto_3344198 ) ) ( OBJ-AT ?auto_3344195 ?auto_3344198 ) ( OBJ-AT ?auto_3344193 ?auto_3344199 ) ( OBJ-AT ?auto_3344191 ?auto_3344198 ) ( OBJ-AT ?auto_3344192 ?auto_3344199 ) ( OBJ-AT ?auto_3344190 ?auto_3344198 ) ( TRUCK-AT ?auto_3344196 ?auto_3344189 ) ( not ( = ?auto_3344190 ?auto_3344192 ) ) ( not ( = ?auto_3344199 ?auto_3344198 ) ) ( not ( = ?auto_3344190 ?auto_3344191 ) ) ( not ( = ?auto_3344192 ?auto_3344191 ) ) ( not ( = ?auto_3344190 ?auto_3344193 ) ) ( not ( = ?auto_3344192 ?auto_3344193 ) ) ( not ( = ?auto_3344191 ?auto_3344193 ) ) ( not ( = ?auto_3344190 ?auto_3344195 ) ) ( not ( = ?auto_3344192 ?auto_3344195 ) ) ( not ( = ?auto_3344191 ?auto_3344195 ) ) ( not ( = ?auto_3344193 ?auto_3344195 ) ) ( not ( = ?auto_3344190 ?auto_3344194 ) ) ( not ( = ?auto_3344192 ?auto_3344194 ) ) ( not ( = ?auto_3344191 ?auto_3344194 ) ) ( not ( = ?auto_3344193 ?auto_3344194 ) ) ( not ( = ?auto_3344195 ?auto_3344194 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3344190 ?auto_3344192 ?auto_3344191 ?auto_3344193 ?auto_3344194 ?auto_3344195 ?auto_3344189 )
      ( DELIVER-6PKG-VERIFY ?auto_3344190 ?auto_3344191 ?auto_3344192 ?auto_3344193 ?auto_3344194 ?auto_3344195 ?auto_3344189 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3344249 - OBJ
      ?auto_3344250 - OBJ
      ?auto_3344251 - OBJ
      ?auto_3344252 - OBJ
      ?auto_3344253 - OBJ
      ?auto_3344254 - OBJ
      ?auto_3344248 - LOCATION
    )
    :vars
    (
      ?auto_3344258 - LOCATION
      ?auto_3344256 - CITY
      ?auto_3344257 - LOCATION
      ?auto_3344255 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3344258 ?auto_3344256 ) ( IN-CITY ?auto_3344248 ?auto_3344256 ) ( not ( = ?auto_3344248 ?auto_3344258 ) ) ( OBJ-AT ?auto_3344254 ?auto_3344258 ) ( IN-CITY ?auto_3344257 ?auto_3344256 ) ( not ( = ?auto_3344248 ?auto_3344257 ) ) ( OBJ-AT ?auto_3344252 ?auto_3344257 ) ( OBJ-AT ?auto_3344253 ?auto_3344258 ) ( OBJ-AT ?auto_3344250 ?auto_3344257 ) ( OBJ-AT ?auto_3344251 ?auto_3344258 ) ( OBJ-AT ?auto_3344249 ?auto_3344257 ) ( TRUCK-AT ?auto_3344255 ?auto_3344248 ) ( not ( = ?auto_3344249 ?auto_3344251 ) ) ( not ( = ?auto_3344258 ?auto_3344257 ) ) ( not ( = ?auto_3344249 ?auto_3344250 ) ) ( not ( = ?auto_3344251 ?auto_3344250 ) ) ( not ( = ?auto_3344249 ?auto_3344253 ) ) ( not ( = ?auto_3344251 ?auto_3344253 ) ) ( not ( = ?auto_3344250 ?auto_3344253 ) ) ( not ( = ?auto_3344249 ?auto_3344252 ) ) ( not ( = ?auto_3344251 ?auto_3344252 ) ) ( not ( = ?auto_3344250 ?auto_3344252 ) ) ( not ( = ?auto_3344253 ?auto_3344252 ) ) ( not ( = ?auto_3344249 ?auto_3344254 ) ) ( not ( = ?auto_3344251 ?auto_3344254 ) ) ( not ( = ?auto_3344250 ?auto_3344254 ) ) ( not ( = ?auto_3344253 ?auto_3344254 ) ) ( not ( = ?auto_3344252 ?auto_3344254 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3344249 ?auto_3344251 ?auto_3344250 ?auto_3344253 ?auto_3344254 ?auto_3344252 ?auto_3344248 )
      ( DELIVER-6PKG-VERIFY ?auto_3344249 ?auto_3344250 ?auto_3344251 ?auto_3344252 ?auto_3344253 ?auto_3344254 ?auto_3344248 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3347235 - OBJ
      ?auto_3347236 - OBJ
      ?auto_3347237 - OBJ
      ?auto_3347238 - OBJ
      ?auto_3347239 - OBJ
      ?auto_3347240 - OBJ
      ?auto_3347234 - LOCATION
    )
    :vars
    (
      ?auto_3347244 - LOCATION
      ?auto_3347242 - CITY
      ?auto_3347243 - LOCATION
      ?auto_3347241 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3347244 ?auto_3347242 ) ( IN-CITY ?auto_3347234 ?auto_3347242 ) ( not ( = ?auto_3347234 ?auto_3347244 ) ) ( OBJ-AT ?auto_3347240 ?auto_3347244 ) ( IN-CITY ?auto_3347243 ?auto_3347242 ) ( not ( = ?auto_3347234 ?auto_3347243 ) ) ( OBJ-AT ?auto_3347237 ?auto_3347243 ) ( OBJ-AT ?auto_3347239 ?auto_3347244 ) ( OBJ-AT ?auto_3347236 ?auto_3347243 ) ( OBJ-AT ?auto_3347238 ?auto_3347244 ) ( OBJ-AT ?auto_3347235 ?auto_3347243 ) ( TRUCK-AT ?auto_3347241 ?auto_3347234 ) ( not ( = ?auto_3347235 ?auto_3347238 ) ) ( not ( = ?auto_3347244 ?auto_3347243 ) ) ( not ( = ?auto_3347235 ?auto_3347236 ) ) ( not ( = ?auto_3347238 ?auto_3347236 ) ) ( not ( = ?auto_3347235 ?auto_3347239 ) ) ( not ( = ?auto_3347238 ?auto_3347239 ) ) ( not ( = ?auto_3347236 ?auto_3347239 ) ) ( not ( = ?auto_3347235 ?auto_3347237 ) ) ( not ( = ?auto_3347238 ?auto_3347237 ) ) ( not ( = ?auto_3347236 ?auto_3347237 ) ) ( not ( = ?auto_3347239 ?auto_3347237 ) ) ( not ( = ?auto_3347235 ?auto_3347240 ) ) ( not ( = ?auto_3347238 ?auto_3347240 ) ) ( not ( = ?auto_3347236 ?auto_3347240 ) ) ( not ( = ?auto_3347239 ?auto_3347240 ) ) ( not ( = ?auto_3347237 ?auto_3347240 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3347235 ?auto_3347238 ?auto_3347236 ?auto_3347239 ?auto_3347240 ?auto_3347237 ?auto_3347234 )
      ( DELIVER-6PKG-VERIFY ?auto_3347235 ?auto_3347236 ?auto_3347237 ?auto_3347238 ?auto_3347239 ?auto_3347240 ?auto_3347234 ) )
  )

)

