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
      ?auto_905292 - OBJ
      ?auto_905293 - LOCATION
    )
    :vars
    (
      ?auto_905294 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_905294 ?auto_905293 ) ( IN-TRUCK ?auto_905292 ?auto_905294 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_905292 ?auto_905294 ?auto_905293 )
      ( DELIVER-1PKG-VERIFY ?auto_905292 ?auto_905293 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_905317 - OBJ
      ?auto_905318 - LOCATION
    )
    :vars
    (
      ?auto_905319 - TRUCK
      ?auto_905320 - LOCATION
      ?auto_905321 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_905317 ?auto_905319 ) ( TRUCK-AT ?auto_905319 ?auto_905320 ) ( IN-CITY ?auto_905320 ?auto_905321 ) ( IN-CITY ?auto_905318 ?auto_905321 ) ( not ( = ?auto_905318 ?auto_905320 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_905319 ?auto_905320 ?auto_905318 ?auto_905321 )
      ( DELIVER-1PKG ?auto_905317 ?auto_905318 )
      ( DELIVER-1PKG-VERIFY ?auto_905317 ?auto_905318 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_905352 - OBJ
      ?auto_905353 - LOCATION
    )
    :vars
    (
      ?auto_905356 - TRUCK
      ?auto_905355 - LOCATION
      ?auto_905354 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_905356 ?auto_905355 ) ( IN-CITY ?auto_905355 ?auto_905354 ) ( IN-CITY ?auto_905353 ?auto_905354 ) ( not ( = ?auto_905353 ?auto_905355 ) ) ( OBJ-AT ?auto_905352 ?auto_905355 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_905352 ?auto_905356 ?auto_905355 )
      ( DELIVER-1PKG ?auto_905352 ?auto_905353 )
      ( DELIVER-1PKG-VERIFY ?auto_905352 ?auto_905353 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_905387 - OBJ
      ?auto_905388 - LOCATION
    )
    :vars
    (
      ?auto_905390 - LOCATION
      ?auto_905389 - CITY
      ?auto_905391 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_905390 ?auto_905389 ) ( IN-CITY ?auto_905388 ?auto_905389 ) ( not ( = ?auto_905388 ?auto_905390 ) ) ( OBJ-AT ?auto_905387 ?auto_905390 ) ( TRUCK-AT ?auto_905391 ?auto_905388 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_905391 ?auto_905388 ?auto_905390 ?auto_905389 )
      ( DELIVER-1PKG ?auto_905387 ?auto_905388 )
      ( DELIVER-1PKG-VERIFY ?auto_905387 ?auto_905388 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_905725 - OBJ
      ?auto_905727 - OBJ
      ?auto_905726 - LOCATION
    )
    :vars
    (
      ?auto_905728 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_905727 ?auto_905725 ) ( TRUCK-AT ?auto_905728 ?auto_905726 ) ( IN-TRUCK ?auto_905727 ?auto_905728 ) ( OBJ-AT ?auto_905725 ?auto_905726 ) ( not ( = ?auto_905725 ?auto_905727 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_905727 ?auto_905726 )
      ( DELIVER-2PKG-VERIFY ?auto_905725 ?auto_905727 ?auto_905726 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_906084 - OBJ
      ?auto_906086 - OBJ
      ?auto_906085 - LOCATION
    )
    :vars
    (
      ?auto_906087 - TRUCK
      ?auto_906089 - LOCATION
      ?auto_906088 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_906086 ?auto_906084 ) ( IN-TRUCK ?auto_906086 ?auto_906087 ) ( TRUCK-AT ?auto_906087 ?auto_906089 ) ( IN-CITY ?auto_906089 ?auto_906088 ) ( IN-CITY ?auto_906085 ?auto_906088 ) ( not ( = ?auto_906085 ?auto_906089 ) ) ( OBJ-AT ?auto_906084 ?auto_906085 ) ( not ( = ?auto_906084 ?auto_906086 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_906086 ?auto_906085 )
      ( DELIVER-2PKG-VERIFY ?auto_906084 ?auto_906086 ?auto_906085 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_906554 - OBJ
      ?auto_906555 - LOCATION
    )
    :vars
    (
      ?auto_906559 - OBJ
      ?auto_906558 - TRUCK
      ?auto_906557 - LOCATION
      ?auto_906556 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_906554 ?auto_906559 ) ( TRUCK-AT ?auto_906558 ?auto_906557 ) ( IN-CITY ?auto_906557 ?auto_906556 ) ( IN-CITY ?auto_906555 ?auto_906556 ) ( not ( = ?auto_906555 ?auto_906557 ) ) ( OBJ-AT ?auto_906559 ?auto_906555 ) ( not ( = ?auto_906559 ?auto_906554 ) ) ( OBJ-AT ?auto_906554 ?auto_906557 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_906554 ?auto_906558 ?auto_906557 )
      ( DELIVER-2PKG ?auto_906559 ?auto_906554 ?auto_906555 )
      ( DELIVER-1PKG-VERIFY ?auto_906554 ?auto_906555 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_906560 - OBJ
      ?auto_906562 - OBJ
      ?auto_906561 - LOCATION
    )
    :vars
    (
      ?auto_906564 - TRUCK
      ?auto_906563 - LOCATION
      ?auto_906565 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_906562 ?auto_906560 ) ( TRUCK-AT ?auto_906564 ?auto_906563 ) ( IN-CITY ?auto_906563 ?auto_906565 ) ( IN-CITY ?auto_906561 ?auto_906565 ) ( not ( = ?auto_906561 ?auto_906563 ) ) ( OBJ-AT ?auto_906560 ?auto_906561 ) ( not ( = ?auto_906560 ?auto_906562 ) ) ( OBJ-AT ?auto_906562 ?auto_906563 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_906562 ?auto_906561 )
      ( DELIVER-2PKG-VERIFY ?auto_906560 ?auto_906562 ?auto_906561 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_907030 - OBJ
      ?auto_907031 - LOCATION
    )
    :vars
    (
      ?auto_907035 - OBJ
      ?auto_907032 - LOCATION
      ?auto_907034 - CITY
      ?auto_907033 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_907030 ?auto_907035 ) ( IN-CITY ?auto_907032 ?auto_907034 ) ( IN-CITY ?auto_907031 ?auto_907034 ) ( not ( = ?auto_907031 ?auto_907032 ) ) ( OBJ-AT ?auto_907035 ?auto_907031 ) ( not ( = ?auto_907035 ?auto_907030 ) ) ( OBJ-AT ?auto_907030 ?auto_907032 ) ( TRUCK-AT ?auto_907033 ?auto_907031 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_907033 ?auto_907031 ?auto_907032 ?auto_907034 )
      ( DELIVER-2PKG ?auto_907035 ?auto_907030 ?auto_907031 )
      ( DELIVER-1PKG-VERIFY ?auto_907030 ?auto_907031 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_907036 - OBJ
      ?auto_907038 - OBJ
      ?auto_907037 - LOCATION
    )
    :vars
    (
      ?auto_907039 - LOCATION
      ?auto_907041 - CITY
      ?auto_907040 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_907038 ?auto_907036 ) ( IN-CITY ?auto_907039 ?auto_907041 ) ( IN-CITY ?auto_907037 ?auto_907041 ) ( not ( = ?auto_907037 ?auto_907039 ) ) ( OBJ-AT ?auto_907036 ?auto_907037 ) ( not ( = ?auto_907036 ?auto_907038 ) ) ( OBJ-AT ?auto_907038 ?auto_907039 ) ( TRUCK-AT ?auto_907040 ?auto_907037 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_907038 ?auto_907037 )
      ( DELIVER-2PKG-VERIFY ?auto_907036 ?auto_907038 ?auto_907037 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_907506 - OBJ
      ?auto_907507 - LOCATION
    )
    :vars
    (
      ?auto_907508 - OBJ
      ?auto_907511 - LOCATION
      ?auto_907510 - CITY
      ?auto_907509 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_907506 ?auto_907508 ) ( IN-CITY ?auto_907511 ?auto_907510 ) ( IN-CITY ?auto_907507 ?auto_907510 ) ( not ( = ?auto_907507 ?auto_907511 ) ) ( not ( = ?auto_907508 ?auto_907506 ) ) ( OBJ-AT ?auto_907506 ?auto_907511 ) ( TRUCK-AT ?auto_907509 ?auto_907507 ) ( IN-TRUCK ?auto_907508 ?auto_907509 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_907508 ?auto_907507 )
      ( DELIVER-2PKG ?auto_907508 ?auto_907506 ?auto_907507 )
      ( DELIVER-1PKG-VERIFY ?auto_907506 ?auto_907507 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_907512 - OBJ
      ?auto_907514 - OBJ
      ?auto_907513 - LOCATION
    )
    :vars
    (
      ?auto_907516 - LOCATION
      ?auto_907515 - CITY
      ?auto_907517 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_907514 ?auto_907512 ) ( IN-CITY ?auto_907516 ?auto_907515 ) ( IN-CITY ?auto_907513 ?auto_907515 ) ( not ( = ?auto_907513 ?auto_907516 ) ) ( not ( = ?auto_907512 ?auto_907514 ) ) ( OBJ-AT ?auto_907514 ?auto_907516 ) ( TRUCK-AT ?auto_907517 ?auto_907513 ) ( IN-TRUCK ?auto_907512 ?auto_907517 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_907514 ?auto_907513 )
      ( DELIVER-2PKG-VERIFY ?auto_907512 ?auto_907514 ?auto_907513 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_907982 - OBJ
      ?auto_907983 - LOCATION
    )
    :vars
    (
      ?auto_907984 - OBJ
      ?auto_907987 - LOCATION
      ?auto_907985 - CITY
      ?auto_907986 - TRUCK
      ?auto_907988 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_907982 ?auto_907984 ) ( IN-CITY ?auto_907987 ?auto_907985 ) ( IN-CITY ?auto_907983 ?auto_907985 ) ( not ( = ?auto_907983 ?auto_907987 ) ) ( not ( = ?auto_907984 ?auto_907982 ) ) ( OBJ-AT ?auto_907982 ?auto_907987 ) ( IN-TRUCK ?auto_907984 ?auto_907986 ) ( TRUCK-AT ?auto_907986 ?auto_907988 ) ( IN-CITY ?auto_907988 ?auto_907985 ) ( not ( = ?auto_907983 ?auto_907988 ) ) ( not ( = ?auto_907987 ?auto_907988 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_907986 ?auto_907988 ?auto_907983 ?auto_907985 )
      ( DELIVER-2PKG ?auto_907984 ?auto_907982 ?auto_907983 )
      ( DELIVER-1PKG-VERIFY ?auto_907982 ?auto_907983 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_907989 - OBJ
      ?auto_907991 - OBJ
      ?auto_907990 - LOCATION
    )
    :vars
    (
      ?auto_907992 - LOCATION
      ?auto_907993 - CITY
      ?auto_907994 - TRUCK
      ?auto_907995 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_907991 ?auto_907989 ) ( IN-CITY ?auto_907992 ?auto_907993 ) ( IN-CITY ?auto_907990 ?auto_907993 ) ( not ( = ?auto_907990 ?auto_907992 ) ) ( not ( = ?auto_907989 ?auto_907991 ) ) ( OBJ-AT ?auto_907991 ?auto_907992 ) ( IN-TRUCK ?auto_907989 ?auto_907994 ) ( TRUCK-AT ?auto_907994 ?auto_907995 ) ( IN-CITY ?auto_907995 ?auto_907993 ) ( not ( = ?auto_907990 ?auto_907995 ) ) ( not ( = ?auto_907992 ?auto_907995 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_907991 ?auto_907990 )
      ( DELIVER-2PKG-VERIFY ?auto_907989 ?auto_907991 ?auto_907990 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_908515 - OBJ
      ?auto_908516 - LOCATION
    )
    :vars
    (
      ?auto_908517 - OBJ
      ?auto_908519 - LOCATION
      ?auto_908518 - CITY
      ?auto_908520 - TRUCK
      ?auto_908521 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_908515 ?auto_908517 ) ( IN-CITY ?auto_908519 ?auto_908518 ) ( IN-CITY ?auto_908516 ?auto_908518 ) ( not ( = ?auto_908516 ?auto_908519 ) ) ( not ( = ?auto_908517 ?auto_908515 ) ) ( OBJ-AT ?auto_908515 ?auto_908519 ) ( TRUCK-AT ?auto_908520 ?auto_908521 ) ( IN-CITY ?auto_908521 ?auto_908518 ) ( not ( = ?auto_908516 ?auto_908521 ) ) ( not ( = ?auto_908519 ?auto_908521 ) ) ( OBJ-AT ?auto_908517 ?auto_908521 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_908517 ?auto_908520 ?auto_908521 )
      ( DELIVER-2PKG ?auto_908517 ?auto_908515 ?auto_908516 )
      ( DELIVER-1PKG-VERIFY ?auto_908515 ?auto_908516 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_908522 - OBJ
      ?auto_908524 - OBJ
      ?auto_908523 - LOCATION
    )
    :vars
    (
      ?auto_908527 - LOCATION
      ?auto_908528 - CITY
      ?auto_908525 - TRUCK
      ?auto_908526 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_908524 ?auto_908522 ) ( IN-CITY ?auto_908527 ?auto_908528 ) ( IN-CITY ?auto_908523 ?auto_908528 ) ( not ( = ?auto_908523 ?auto_908527 ) ) ( not ( = ?auto_908522 ?auto_908524 ) ) ( OBJ-AT ?auto_908524 ?auto_908527 ) ( TRUCK-AT ?auto_908525 ?auto_908526 ) ( IN-CITY ?auto_908526 ?auto_908528 ) ( not ( = ?auto_908523 ?auto_908526 ) ) ( not ( = ?auto_908527 ?auto_908526 ) ) ( OBJ-AT ?auto_908522 ?auto_908526 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_908524 ?auto_908523 )
      ( DELIVER-2PKG-VERIFY ?auto_908522 ?auto_908524 ?auto_908523 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_911227 - OBJ
      ?auto_911229 - OBJ
      ?auto_911230 - OBJ
      ?auto_911228 - LOCATION
    )
    :vars
    (
      ?auto_911231 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_911229 ?auto_911227 ) ( GREATER-THAN ?auto_911230 ?auto_911227 ) ( GREATER-THAN ?auto_911230 ?auto_911229 ) ( TRUCK-AT ?auto_911231 ?auto_911228 ) ( IN-TRUCK ?auto_911230 ?auto_911231 ) ( OBJ-AT ?auto_911227 ?auto_911228 ) ( OBJ-AT ?auto_911229 ?auto_911228 ) ( not ( = ?auto_911227 ?auto_911229 ) ) ( not ( = ?auto_911227 ?auto_911230 ) ) ( not ( = ?auto_911229 ?auto_911230 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_911230 ?auto_911228 )
      ( DELIVER-3PKG-VERIFY ?auto_911227 ?auto_911229 ?auto_911230 ?auto_911228 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_913225 - OBJ
      ?auto_913227 - OBJ
      ?auto_913228 - OBJ
      ?auto_913226 - LOCATION
    )
    :vars
    (
      ?auto_913230 - TRUCK
      ?auto_913229 - LOCATION
      ?auto_913231 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_913227 ?auto_913225 ) ( GREATER-THAN ?auto_913228 ?auto_913225 ) ( GREATER-THAN ?auto_913228 ?auto_913227 ) ( IN-TRUCK ?auto_913228 ?auto_913230 ) ( TRUCK-AT ?auto_913230 ?auto_913229 ) ( IN-CITY ?auto_913229 ?auto_913231 ) ( IN-CITY ?auto_913226 ?auto_913231 ) ( not ( = ?auto_913226 ?auto_913229 ) ) ( OBJ-AT ?auto_913225 ?auto_913226 ) ( not ( = ?auto_913225 ?auto_913228 ) ) ( OBJ-AT ?auto_913227 ?auto_913226 ) ( not ( = ?auto_913225 ?auto_913227 ) ) ( not ( = ?auto_913227 ?auto_913228 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_913225 ?auto_913228 ?auto_913226 )
      ( DELIVER-3PKG-VERIFY ?auto_913225 ?auto_913227 ?auto_913228 ?auto_913226 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_915865 - OBJ
      ?auto_915867 - OBJ
      ?auto_915868 - OBJ
      ?auto_915866 - LOCATION
    )
    :vars
    (
      ?auto_915870 - TRUCK
      ?auto_915869 - LOCATION
      ?auto_915871 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_915867 ?auto_915865 ) ( GREATER-THAN ?auto_915868 ?auto_915865 ) ( GREATER-THAN ?auto_915868 ?auto_915867 ) ( TRUCK-AT ?auto_915870 ?auto_915869 ) ( IN-CITY ?auto_915869 ?auto_915871 ) ( IN-CITY ?auto_915866 ?auto_915871 ) ( not ( = ?auto_915866 ?auto_915869 ) ) ( OBJ-AT ?auto_915865 ?auto_915866 ) ( not ( = ?auto_915865 ?auto_915868 ) ) ( OBJ-AT ?auto_915868 ?auto_915869 ) ( OBJ-AT ?auto_915867 ?auto_915866 ) ( not ( = ?auto_915865 ?auto_915867 ) ) ( not ( = ?auto_915867 ?auto_915868 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_915865 ?auto_915868 ?auto_915866 )
      ( DELIVER-3PKG-VERIFY ?auto_915865 ?auto_915867 ?auto_915868 ?auto_915866 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_918505 - OBJ
      ?auto_918507 - OBJ
      ?auto_918508 - OBJ
      ?auto_918506 - LOCATION
    )
    :vars
    (
      ?auto_918509 - LOCATION
      ?auto_918510 - CITY
      ?auto_918511 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_918507 ?auto_918505 ) ( GREATER-THAN ?auto_918508 ?auto_918505 ) ( GREATER-THAN ?auto_918508 ?auto_918507 ) ( IN-CITY ?auto_918509 ?auto_918510 ) ( IN-CITY ?auto_918506 ?auto_918510 ) ( not ( = ?auto_918506 ?auto_918509 ) ) ( OBJ-AT ?auto_918505 ?auto_918506 ) ( not ( = ?auto_918505 ?auto_918508 ) ) ( OBJ-AT ?auto_918508 ?auto_918509 ) ( TRUCK-AT ?auto_918511 ?auto_918506 ) ( OBJ-AT ?auto_918507 ?auto_918506 ) ( not ( = ?auto_918505 ?auto_918507 ) ) ( not ( = ?auto_918507 ?auto_918508 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_918505 ?auto_918508 ?auto_918506 )
      ( DELIVER-3PKG-VERIFY ?auto_918505 ?auto_918507 ?auto_918508 ?auto_918506 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_923740 - OBJ
      ?auto_923741 - LOCATION
    )
    :vars
    (
      ?auto_923742 - OBJ
      ?auto_923743 - LOCATION
      ?auto_923744 - CITY
      ?auto_923745 - TRUCK
      ?auto_923746 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_923740 ?auto_923742 ) ( IN-CITY ?auto_923743 ?auto_923744 ) ( IN-CITY ?auto_923741 ?auto_923744 ) ( not ( = ?auto_923741 ?auto_923743 ) ) ( OBJ-AT ?auto_923742 ?auto_923741 ) ( not ( = ?auto_923742 ?auto_923740 ) ) ( OBJ-AT ?auto_923740 ?auto_923743 ) ( TRUCK-AT ?auto_923745 ?auto_923746 ) ( IN-CITY ?auto_923746 ?auto_923744 ) ( not ( = ?auto_923741 ?auto_923746 ) ) ( not ( = ?auto_923743 ?auto_923746 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_923745 ?auto_923746 ?auto_923741 ?auto_923744 )
      ( DELIVER-2PKG ?auto_923742 ?auto_923740 ?auto_923741 )
      ( DELIVER-1PKG-VERIFY ?auto_923740 ?auto_923741 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_923747 - OBJ
      ?auto_923749 - OBJ
      ?auto_923748 - LOCATION
    )
    :vars
    (
      ?auto_923750 - LOCATION
      ?auto_923753 - CITY
      ?auto_923751 - TRUCK
      ?auto_923752 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_923749 ?auto_923747 ) ( IN-CITY ?auto_923750 ?auto_923753 ) ( IN-CITY ?auto_923748 ?auto_923753 ) ( not ( = ?auto_923748 ?auto_923750 ) ) ( OBJ-AT ?auto_923747 ?auto_923748 ) ( not ( = ?auto_923747 ?auto_923749 ) ) ( OBJ-AT ?auto_923749 ?auto_923750 ) ( TRUCK-AT ?auto_923751 ?auto_923752 ) ( IN-CITY ?auto_923752 ?auto_923753 ) ( not ( = ?auto_923748 ?auto_923752 ) ) ( not ( = ?auto_923750 ?auto_923752 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_923749 ?auto_923748 )
      ( DELIVER-2PKG-VERIFY ?auto_923747 ?auto_923749 ?auto_923748 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_949349 - OBJ
      ?auto_949351 - OBJ
      ?auto_949352 - OBJ
      ?auto_949353 - OBJ
      ?auto_949350 - LOCATION
    )
    :vars
    (
      ?auto_949354 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_949351 ?auto_949349 ) ( GREATER-THAN ?auto_949352 ?auto_949349 ) ( GREATER-THAN ?auto_949352 ?auto_949351 ) ( GREATER-THAN ?auto_949353 ?auto_949349 ) ( GREATER-THAN ?auto_949353 ?auto_949351 ) ( GREATER-THAN ?auto_949353 ?auto_949352 ) ( TRUCK-AT ?auto_949354 ?auto_949350 ) ( IN-TRUCK ?auto_949353 ?auto_949354 ) ( OBJ-AT ?auto_949349 ?auto_949350 ) ( OBJ-AT ?auto_949351 ?auto_949350 ) ( OBJ-AT ?auto_949352 ?auto_949350 ) ( not ( = ?auto_949349 ?auto_949351 ) ) ( not ( = ?auto_949349 ?auto_949352 ) ) ( not ( = ?auto_949349 ?auto_949353 ) ) ( not ( = ?auto_949351 ?auto_949352 ) ) ( not ( = ?auto_949351 ?auto_949353 ) ) ( not ( = ?auto_949352 ?auto_949353 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_949353 ?auto_949350 )
      ( DELIVER-4PKG-VERIFY ?auto_949349 ?auto_949351 ?auto_949352 ?auto_949353 ?auto_949350 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_956199 - OBJ
      ?auto_956201 - OBJ
      ?auto_956202 - OBJ
      ?auto_956203 - OBJ
      ?auto_956200 - LOCATION
    )
    :vars
    (
      ?auto_956204 - TRUCK
      ?auto_956206 - LOCATION
      ?auto_956205 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_956201 ?auto_956199 ) ( GREATER-THAN ?auto_956202 ?auto_956199 ) ( GREATER-THAN ?auto_956202 ?auto_956201 ) ( GREATER-THAN ?auto_956203 ?auto_956199 ) ( GREATER-THAN ?auto_956203 ?auto_956201 ) ( GREATER-THAN ?auto_956203 ?auto_956202 ) ( IN-TRUCK ?auto_956203 ?auto_956204 ) ( TRUCK-AT ?auto_956204 ?auto_956206 ) ( IN-CITY ?auto_956206 ?auto_956205 ) ( IN-CITY ?auto_956200 ?auto_956205 ) ( not ( = ?auto_956200 ?auto_956206 ) ) ( OBJ-AT ?auto_956199 ?auto_956200 ) ( not ( = ?auto_956199 ?auto_956203 ) ) ( OBJ-AT ?auto_956201 ?auto_956200 ) ( OBJ-AT ?auto_956202 ?auto_956200 ) ( not ( = ?auto_956199 ?auto_956201 ) ) ( not ( = ?auto_956199 ?auto_956202 ) ) ( not ( = ?auto_956201 ?auto_956202 ) ) ( not ( = ?auto_956201 ?auto_956203 ) ) ( not ( = ?auto_956202 ?auto_956203 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_956199 ?auto_956203 ?auto_956200 )
      ( DELIVER-4PKG-VERIFY ?auto_956199 ?auto_956201 ?auto_956202 ?auto_956203 ?auto_956200 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_965220 - OBJ
      ?auto_965222 - OBJ
      ?auto_965223 - OBJ
      ?auto_965224 - OBJ
      ?auto_965221 - LOCATION
    )
    :vars
    (
      ?auto_965227 - TRUCK
      ?auto_965225 - LOCATION
      ?auto_965226 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_965222 ?auto_965220 ) ( GREATER-THAN ?auto_965223 ?auto_965220 ) ( GREATER-THAN ?auto_965223 ?auto_965222 ) ( GREATER-THAN ?auto_965224 ?auto_965220 ) ( GREATER-THAN ?auto_965224 ?auto_965222 ) ( GREATER-THAN ?auto_965224 ?auto_965223 ) ( TRUCK-AT ?auto_965227 ?auto_965225 ) ( IN-CITY ?auto_965225 ?auto_965226 ) ( IN-CITY ?auto_965221 ?auto_965226 ) ( not ( = ?auto_965221 ?auto_965225 ) ) ( OBJ-AT ?auto_965220 ?auto_965221 ) ( not ( = ?auto_965220 ?auto_965224 ) ) ( OBJ-AT ?auto_965224 ?auto_965225 ) ( OBJ-AT ?auto_965222 ?auto_965221 ) ( OBJ-AT ?auto_965223 ?auto_965221 ) ( not ( = ?auto_965220 ?auto_965222 ) ) ( not ( = ?auto_965220 ?auto_965223 ) ) ( not ( = ?auto_965222 ?auto_965223 ) ) ( not ( = ?auto_965222 ?auto_965224 ) ) ( not ( = ?auto_965223 ?auto_965224 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_965220 ?auto_965224 ?auto_965221 )
      ( DELIVER-4PKG-VERIFY ?auto_965220 ?auto_965222 ?auto_965223 ?auto_965224 ?auto_965221 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_974241 - OBJ
      ?auto_974243 - OBJ
      ?auto_974244 - OBJ
      ?auto_974245 - OBJ
      ?auto_974242 - LOCATION
    )
    :vars
    (
      ?auto_974246 - LOCATION
      ?auto_974248 - CITY
      ?auto_974247 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_974243 ?auto_974241 ) ( GREATER-THAN ?auto_974244 ?auto_974241 ) ( GREATER-THAN ?auto_974244 ?auto_974243 ) ( GREATER-THAN ?auto_974245 ?auto_974241 ) ( GREATER-THAN ?auto_974245 ?auto_974243 ) ( GREATER-THAN ?auto_974245 ?auto_974244 ) ( IN-CITY ?auto_974246 ?auto_974248 ) ( IN-CITY ?auto_974242 ?auto_974248 ) ( not ( = ?auto_974242 ?auto_974246 ) ) ( OBJ-AT ?auto_974241 ?auto_974242 ) ( not ( = ?auto_974241 ?auto_974245 ) ) ( OBJ-AT ?auto_974245 ?auto_974246 ) ( TRUCK-AT ?auto_974247 ?auto_974242 ) ( OBJ-AT ?auto_974243 ?auto_974242 ) ( OBJ-AT ?auto_974244 ?auto_974242 ) ( not ( = ?auto_974241 ?auto_974243 ) ) ( not ( = ?auto_974241 ?auto_974244 ) ) ( not ( = ?auto_974243 ?auto_974244 ) ) ( not ( = ?auto_974243 ?auto_974245 ) ) ( not ( = ?auto_974244 ?auto_974245 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_974241 ?auto_974245 ?auto_974242 )
      ( DELIVER-4PKG-VERIFY ?auto_974241 ?auto_974243 ?auto_974244 ?auto_974245 ?auto_974242 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_991960 - OBJ
      ?auto_991962 - OBJ
      ?auto_991963 - OBJ
      ?auto_991961 - LOCATION
    )
    :vars
    (
      ?auto_991967 - LOCATION
      ?auto_991966 - CITY
      ?auto_991964 - TRUCK
      ?auto_991965 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_991962 ?auto_991960 ) ( GREATER-THAN ?auto_991963 ?auto_991960 ) ( GREATER-THAN ?auto_991963 ?auto_991962 ) ( IN-CITY ?auto_991967 ?auto_991966 ) ( IN-CITY ?auto_991961 ?auto_991966 ) ( not ( = ?auto_991961 ?auto_991967 ) ) ( OBJ-AT ?auto_991960 ?auto_991961 ) ( not ( = ?auto_991960 ?auto_991963 ) ) ( OBJ-AT ?auto_991963 ?auto_991967 ) ( TRUCK-AT ?auto_991964 ?auto_991965 ) ( IN-CITY ?auto_991965 ?auto_991966 ) ( not ( = ?auto_991961 ?auto_991965 ) ) ( not ( = ?auto_991967 ?auto_991965 ) ) ( OBJ-AT ?auto_991962 ?auto_991961 ) ( not ( = ?auto_991960 ?auto_991962 ) ) ( not ( = ?auto_991962 ?auto_991963 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_991960 ?auto_991963 ?auto_991961 )
      ( DELIVER-3PKG-VERIFY ?auto_991960 ?auto_991962 ?auto_991963 ?auto_991961 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1114745 - OBJ
      ?auto_1114747 - OBJ
      ?auto_1114748 - OBJ
      ?auto_1114749 - OBJ
      ?auto_1114750 - OBJ
      ?auto_1114746 - LOCATION
    )
    :vars
    (
      ?auto_1114751 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1114747 ?auto_1114745 ) ( GREATER-THAN ?auto_1114748 ?auto_1114745 ) ( GREATER-THAN ?auto_1114748 ?auto_1114747 ) ( GREATER-THAN ?auto_1114749 ?auto_1114745 ) ( GREATER-THAN ?auto_1114749 ?auto_1114747 ) ( GREATER-THAN ?auto_1114749 ?auto_1114748 ) ( GREATER-THAN ?auto_1114750 ?auto_1114745 ) ( GREATER-THAN ?auto_1114750 ?auto_1114747 ) ( GREATER-THAN ?auto_1114750 ?auto_1114748 ) ( GREATER-THAN ?auto_1114750 ?auto_1114749 ) ( TRUCK-AT ?auto_1114751 ?auto_1114746 ) ( IN-TRUCK ?auto_1114750 ?auto_1114751 ) ( OBJ-AT ?auto_1114745 ?auto_1114746 ) ( OBJ-AT ?auto_1114747 ?auto_1114746 ) ( OBJ-AT ?auto_1114748 ?auto_1114746 ) ( OBJ-AT ?auto_1114749 ?auto_1114746 ) ( not ( = ?auto_1114745 ?auto_1114747 ) ) ( not ( = ?auto_1114745 ?auto_1114748 ) ) ( not ( = ?auto_1114745 ?auto_1114749 ) ) ( not ( = ?auto_1114745 ?auto_1114750 ) ) ( not ( = ?auto_1114747 ?auto_1114748 ) ) ( not ( = ?auto_1114747 ?auto_1114749 ) ) ( not ( = ?auto_1114747 ?auto_1114750 ) ) ( not ( = ?auto_1114748 ?auto_1114749 ) ) ( not ( = ?auto_1114748 ?auto_1114750 ) ) ( not ( = ?auto_1114749 ?auto_1114750 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1114750 ?auto_1114746 )
      ( DELIVER-5PKG-VERIFY ?auto_1114745 ?auto_1114747 ?auto_1114748 ?auto_1114749 ?auto_1114750 ?auto_1114746 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1133233 - OBJ
      ?auto_1133235 - OBJ
      ?auto_1133236 - OBJ
      ?auto_1133237 - OBJ
      ?auto_1133238 - OBJ
      ?auto_1133234 - LOCATION
    )
    :vars
    (
      ?auto_1133241 - TRUCK
      ?auto_1133239 - LOCATION
      ?auto_1133240 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1133235 ?auto_1133233 ) ( GREATER-THAN ?auto_1133236 ?auto_1133233 ) ( GREATER-THAN ?auto_1133236 ?auto_1133235 ) ( GREATER-THAN ?auto_1133237 ?auto_1133233 ) ( GREATER-THAN ?auto_1133237 ?auto_1133235 ) ( GREATER-THAN ?auto_1133237 ?auto_1133236 ) ( GREATER-THAN ?auto_1133238 ?auto_1133233 ) ( GREATER-THAN ?auto_1133238 ?auto_1133235 ) ( GREATER-THAN ?auto_1133238 ?auto_1133236 ) ( GREATER-THAN ?auto_1133238 ?auto_1133237 ) ( IN-TRUCK ?auto_1133238 ?auto_1133241 ) ( TRUCK-AT ?auto_1133241 ?auto_1133239 ) ( IN-CITY ?auto_1133239 ?auto_1133240 ) ( IN-CITY ?auto_1133234 ?auto_1133240 ) ( not ( = ?auto_1133234 ?auto_1133239 ) ) ( OBJ-AT ?auto_1133233 ?auto_1133234 ) ( not ( = ?auto_1133233 ?auto_1133238 ) ) ( OBJ-AT ?auto_1133235 ?auto_1133234 ) ( OBJ-AT ?auto_1133236 ?auto_1133234 ) ( OBJ-AT ?auto_1133237 ?auto_1133234 ) ( not ( = ?auto_1133233 ?auto_1133235 ) ) ( not ( = ?auto_1133233 ?auto_1133236 ) ) ( not ( = ?auto_1133233 ?auto_1133237 ) ) ( not ( = ?auto_1133235 ?auto_1133236 ) ) ( not ( = ?auto_1133235 ?auto_1133237 ) ) ( not ( = ?auto_1133235 ?auto_1133238 ) ) ( not ( = ?auto_1133236 ?auto_1133237 ) ) ( not ( = ?auto_1133236 ?auto_1133238 ) ) ( not ( = ?auto_1133237 ?auto_1133238 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1133233 ?auto_1133238 ?auto_1133234 )
      ( DELIVER-5PKG-VERIFY ?auto_1133233 ?auto_1133235 ?auto_1133236 ?auto_1133237 ?auto_1133238 ?auto_1133234 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1156541 - OBJ
      ?auto_1156543 - OBJ
      ?auto_1156544 - OBJ
      ?auto_1156545 - OBJ
      ?auto_1156546 - OBJ
      ?auto_1156542 - LOCATION
    )
    :vars
    (
      ?auto_1156547 - TRUCK
      ?auto_1156549 - LOCATION
      ?auto_1156548 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1156543 ?auto_1156541 ) ( GREATER-THAN ?auto_1156544 ?auto_1156541 ) ( GREATER-THAN ?auto_1156544 ?auto_1156543 ) ( GREATER-THAN ?auto_1156545 ?auto_1156541 ) ( GREATER-THAN ?auto_1156545 ?auto_1156543 ) ( GREATER-THAN ?auto_1156545 ?auto_1156544 ) ( GREATER-THAN ?auto_1156546 ?auto_1156541 ) ( GREATER-THAN ?auto_1156546 ?auto_1156543 ) ( GREATER-THAN ?auto_1156546 ?auto_1156544 ) ( GREATER-THAN ?auto_1156546 ?auto_1156545 ) ( TRUCK-AT ?auto_1156547 ?auto_1156549 ) ( IN-CITY ?auto_1156549 ?auto_1156548 ) ( IN-CITY ?auto_1156542 ?auto_1156548 ) ( not ( = ?auto_1156542 ?auto_1156549 ) ) ( OBJ-AT ?auto_1156541 ?auto_1156542 ) ( not ( = ?auto_1156541 ?auto_1156546 ) ) ( OBJ-AT ?auto_1156546 ?auto_1156549 ) ( OBJ-AT ?auto_1156543 ?auto_1156542 ) ( OBJ-AT ?auto_1156544 ?auto_1156542 ) ( OBJ-AT ?auto_1156545 ?auto_1156542 ) ( not ( = ?auto_1156541 ?auto_1156543 ) ) ( not ( = ?auto_1156541 ?auto_1156544 ) ) ( not ( = ?auto_1156541 ?auto_1156545 ) ) ( not ( = ?auto_1156543 ?auto_1156544 ) ) ( not ( = ?auto_1156543 ?auto_1156545 ) ) ( not ( = ?auto_1156543 ?auto_1156546 ) ) ( not ( = ?auto_1156544 ?auto_1156545 ) ) ( not ( = ?auto_1156544 ?auto_1156546 ) ) ( not ( = ?auto_1156545 ?auto_1156546 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1156541 ?auto_1156546 ?auto_1156542 )
      ( DELIVER-5PKG-VERIFY ?auto_1156541 ?auto_1156543 ?auto_1156544 ?auto_1156545 ?auto_1156546 ?auto_1156542 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1179849 - OBJ
      ?auto_1179851 - OBJ
      ?auto_1179852 - OBJ
      ?auto_1179853 - OBJ
      ?auto_1179854 - OBJ
      ?auto_1179850 - LOCATION
    )
    :vars
    (
      ?auto_1179855 - LOCATION
      ?auto_1179857 - CITY
      ?auto_1179856 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1179851 ?auto_1179849 ) ( GREATER-THAN ?auto_1179852 ?auto_1179849 ) ( GREATER-THAN ?auto_1179852 ?auto_1179851 ) ( GREATER-THAN ?auto_1179853 ?auto_1179849 ) ( GREATER-THAN ?auto_1179853 ?auto_1179851 ) ( GREATER-THAN ?auto_1179853 ?auto_1179852 ) ( GREATER-THAN ?auto_1179854 ?auto_1179849 ) ( GREATER-THAN ?auto_1179854 ?auto_1179851 ) ( GREATER-THAN ?auto_1179854 ?auto_1179852 ) ( GREATER-THAN ?auto_1179854 ?auto_1179853 ) ( IN-CITY ?auto_1179855 ?auto_1179857 ) ( IN-CITY ?auto_1179850 ?auto_1179857 ) ( not ( = ?auto_1179850 ?auto_1179855 ) ) ( OBJ-AT ?auto_1179849 ?auto_1179850 ) ( not ( = ?auto_1179849 ?auto_1179854 ) ) ( OBJ-AT ?auto_1179854 ?auto_1179855 ) ( TRUCK-AT ?auto_1179856 ?auto_1179850 ) ( OBJ-AT ?auto_1179851 ?auto_1179850 ) ( OBJ-AT ?auto_1179852 ?auto_1179850 ) ( OBJ-AT ?auto_1179853 ?auto_1179850 ) ( not ( = ?auto_1179849 ?auto_1179851 ) ) ( not ( = ?auto_1179849 ?auto_1179852 ) ) ( not ( = ?auto_1179849 ?auto_1179853 ) ) ( not ( = ?auto_1179851 ?auto_1179852 ) ) ( not ( = ?auto_1179851 ?auto_1179853 ) ) ( not ( = ?auto_1179851 ?auto_1179854 ) ) ( not ( = ?auto_1179852 ?auto_1179853 ) ) ( not ( = ?auto_1179852 ?auto_1179854 ) ) ( not ( = ?auto_1179853 ?auto_1179854 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1179849 ?auto_1179854 ?auto_1179850 )
      ( DELIVER-5PKG-VERIFY ?auto_1179849 ?auto_1179851 ?auto_1179852 ?auto_1179853 ?auto_1179854 ?auto_1179850 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1222803 - OBJ
      ?auto_1222805 - OBJ
      ?auto_1222806 - OBJ
      ?auto_1222807 - OBJ
      ?auto_1222804 - LOCATION
    )
    :vars
    (
      ?auto_1222811 - LOCATION
      ?auto_1222808 - CITY
      ?auto_1222809 - TRUCK
      ?auto_1222810 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1222805 ?auto_1222803 ) ( GREATER-THAN ?auto_1222806 ?auto_1222803 ) ( GREATER-THAN ?auto_1222806 ?auto_1222805 ) ( GREATER-THAN ?auto_1222807 ?auto_1222803 ) ( GREATER-THAN ?auto_1222807 ?auto_1222805 ) ( GREATER-THAN ?auto_1222807 ?auto_1222806 ) ( IN-CITY ?auto_1222811 ?auto_1222808 ) ( IN-CITY ?auto_1222804 ?auto_1222808 ) ( not ( = ?auto_1222804 ?auto_1222811 ) ) ( OBJ-AT ?auto_1222803 ?auto_1222804 ) ( not ( = ?auto_1222803 ?auto_1222807 ) ) ( OBJ-AT ?auto_1222807 ?auto_1222811 ) ( TRUCK-AT ?auto_1222809 ?auto_1222810 ) ( IN-CITY ?auto_1222810 ?auto_1222808 ) ( not ( = ?auto_1222804 ?auto_1222810 ) ) ( not ( = ?auto_1222811 ?auto_1222810 ) ) ( OBJ-AT ?auto_1222805 ?auto_1222804 ) ( OBJ-AT ?auto_1222806 ?auto_1222804 ) ( not ( = ?auto_1222803 ?auto_1222805 ) ) ( not ( = ?auto_1222803 ?auto_1222806 ) ) ( not ( = ?auto_1222805 ?auto_1222806 ) ) ( not ( = ?auto_1222805 ?auto_1222807 ) ) ( not ( = ?auto_1222806 ?auto_1222807 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1222803 ?auto_1222807 ?auto_1222804 )
      ( DELIVER-4PKG-VERIFY ?auto_1222803 ?auto_1222805 ?auto_1222806 ?auto_1222807 ?auto_1222804 ) )
  )

)

