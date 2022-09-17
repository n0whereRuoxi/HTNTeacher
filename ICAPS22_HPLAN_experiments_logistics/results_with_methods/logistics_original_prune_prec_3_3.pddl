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
      ?auto_16092 - OBJ
      ?auto_16093 - LOCATION
    )
    :vars
    (
      ?auto_16094 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_16094 ?auto_16093 ) ( IN-TRUCK ?auto_16092 ?auto_16094 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_16092 ?auto_16094 ?auto_16093 )
      ( DELIVER-1PKG-VERIFY ?auto_16092 ?auto_16093 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16110 - OBJ
      ?auto_16111 - LOCATION
    )
    :vars
    (
      ?auto_16113 - TRUCK
      ?auto_16116 - LOCATION
      ?auto_16117 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_16110 ?auto_16113 ) ( TRUCK-AT ?auto_16113 ?auto_16116 ) ( IN-CITY ?auto_16116 ?auto_16117 ) ( IN-CITY ?auto_16111 ?auto_16117 ) ( not ( = ?auto_16111 ?auto_16116 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16113 ?auto_16116 ?auto_16111 ?auto_16117 )
      ( DELIVER-1PKG ?auto_16110 ?auto_16111 )
      ( DELIVER-1PKG-VERIFY ?auto_16110 ?auto_16111 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16136 - OBJ
      ?auto_16137 - LOCATION
    )
    :vars
    (
      ?auto_16138 - TRUCK
      ?auto_16139 - LOCATION
      ?auto_16140 - CITY
      ?auto_16144 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_16138 ?auto_16139 ) ( IN-CITY ?auto_16139 ?auto_16140 ) ( IN-CITY ?auto_16137 ?auto_16140 ) ( not ( = ?auto_16137 ?auto_16139 ) ) ( TRUCK-AT ?auto_16138 ?auto_16144 ) ( OBJ-AT ?auto_16136 ?auto_16144 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_16136 ?auto_16138 ?auto_16144 )
      ( DELIVER-1PKG ?auto_16136 ?auto_16137 )
      ( DELIVER-1PKG-VERIFY ?auto_16136 ?auto_16137 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16165 - OBJ
      ?auto_16166 - LOCATION
    )
    :vars
    (
      ?auto_16170 - LOCATION
      ?auto_16171 - CITY
      ?auto_16168 - TRUCK
      ?auto_16174 - LOCATION
      ?auto_16175 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_16170 ?auto_16171 ) ( IN-CITY ?auto_16166 ?auto_16171 ) ( not ( = ?auto_16166 ?auto_16170 ) ) ( OBJ-AT ?auto_16165 ?auto_16170 ) ( TRUCK-AT ?auto_16168 ?auto_16174 ) ( IN-CITY ?auto_16174 ?auto_16175 ) ( IN-CITY ?auto_16170 ?auto_16175 ) ( not ( = ?auto_16170 ?auto_16174 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16168 ?auto_16174 ?auto_16170 ?auto_16175 )
      ( DELIVER-1PKG ?auto_16165 ?auto_16166 )
      ( DELIVER-1PKG-VERIFY ?auto_16165 ?auto_16166 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16242 - OBJ
      ?auto_16244 - OBJ
      ?auto_16243 - LOCATION
    )
    :vars
    (
      ?auto_16246 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16244 ?auto_16242 ) ( TRUCK-AT ?auto_16246 ?auto_16243 ) ( IN-TRUCK ?auto_16244 ?auto_16246 ) ( OBJ-AT ?auto_16242 ?auto_16243 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16244 ?auto_16243 )
      ( DELIVER-2PKG-VERIFY ?auto_16242 ?auto_16244 ?auto_16243 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16318 - OBJ
      ?auto_16320 - OBJ
      ?auto_16319 - LOCATION
    )
    :vars
    (
      ?auto_16321 - TRUCK
      ?auto_16322 - LOCATION
      ?auto_16324 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16320 ?auto_16318 ) ( IN-TRUCK ?auto_16320 ?auto_16321 ) ( TRUCK-AT ?auto_16321 ?auto_16322 ) ( IN-CITY ?auto_16322 ?auto_16324 ) ( IN-CITY ?auto_16319 ?auto_16324 ) ( not ( = ?auto_16319 ?auto_16322 ) ) ( OBJ-AT ?auto_16318 ?auto_16319 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16320 ?auto_16319 )
      ( DELIVER-2PKG-VERIFY ?auto_16318 ?auto_16320 ?auto_16319 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16414 - OBJ
      ?auto_16415 - LOCATION
    )
    :vars
    (
      ?auto_16420 - OBJ
      ?auto_16418 - TRUCK
      ?auto_16417 - LOCATION
      ?auto_16416 - CITY
      ?auto_16423 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16414 ?auto_16420 ) ( TRUCK-AT ?auto_16418 ?auto_16417 ) ( IN-CITY ?auto_16417 ?auto_16416 ) ( IN-CITY ?auto_16415 ?auto_16416 ) ( not ( = ?auto_16415 ?auto_16417 ) ) ( OBJ-AT ?auto_16420 ?auto_16415 ) ( TRUCK-AT ?auto_16418 ?auto_16423 ) ( OBJ-AT ?auto_16414 ?auto_16423 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_16414 ?auto_16418 ?auto_16423 )
      ( DELIVER-2PKG ?auto_16420 ?auto_16414 ?auto_16415 )
      ( DELIVER-1PKG-VERIFY ?auto_16414 ?auto_16415 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16425 - OBJ
      ?auto_16427 - OBJ
      ?auto_16426 - LOCATION
    )
    :vars
    (
      ?auto_16430 - OBJ
      ?auto_16432 - TRUCK
      ?auto_16433 - LOCATION
      ?auto_16434 - CITY
      ?auto_16428 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16427 ?auto_16425 ) ( GREATER-THAN ?auto_16427 ?auto_16430 ) ( TRUCK-AT ?auto_16432 ?auto_16433 ) ( IN-CITY ?auto_16433 ?auto_16434 ) ( IN-CITY ?auto_16426 ?auto_16434 ) ( not ( = ?auto_16426 ?auto_16433 ) ) ( OBJ-AT ?auto_16430 ?auto_16426 ) ( TRUCK-AT ?auto_16432 ?auto_16428 ) ( OBJ-AT ?auto_16427 ?auto_16428 ) ( OBJ-AT ?auto_16425 ?auto_16426 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16427 ?auto_16426 )
      ( DELIVER-2PKG-VERIFY ?auto_16425 ?auto_16427 ?auto_16426 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16541 - OBJ
      ?auto_16542 - LOCATION
    )
    :vars
    (
      ?auto_16550 - OBJ
      ?auto_16548 - OBJ
      ?auto_16545 - LOCATION
      ?auto_16543 - CITY
      ?auto_16544 - TRUCK
      ?auto_16552 - LOCATION
      ?auto_16553 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16541 ?auto_16550 ) ( GREATER-THAN ?auto_16541 ?auto_16548 ) ( IN-CITY ?auto_16545 ?auto_16543 ) ( IN-CITY ?auto_16542 ?auto_16543 ) ( not ( = ?auto_16542 ?auto_16545 ) ) ( OBJ-AT ?auto_16548 ?auto_16542 ) ( OBJ-AT ?auto_16541 ?auto_16545 ) ( OBJ-AT ?auto_16550 ?auto_16542 ) ( TRUCK-AT ?auto_16544 ?auto_16552 ) ( IN-CITY ?auto_16552 ?auto_16553 ) ( IN-CITY ?auto_16545 ?auto_16553 ) ( not ( = ?auto_16545 ?auto_16552 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16544 ?auto_16552 ?auto_16545 ?auto_16553 )
      ( DELIVER-2PKG ?auto_16550 ?auto_16541 ?auto_16542 )
      ( DELIVER-1PKG-VERIFY ?auto_16541 ?auto_16542 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16555 - OBJ
      ?auto_16557 - OBJ
      ?auto_16556 - LOCATION
    )
    :vars
    (
      ?auto_16565 - OBJ
      ?auto_16558 - OBJ
      ?auto_16563 - LOCATION
      ?auto_16566 - CITY
      ?auto_16560 - TRUCK
      ?auto_16559 - LOCATION
      ?auto_16562 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16557 ?auto_16555 ) ( GREATER-THAN ?auto_16557 ?auto_16565 ) ( GREATER-THAN ?auto_16557 ?auto_16558 ) ( IN-CITY ?auto_16563 ?auto_16566 ) ( IN-CITY ?auto_16556 ?auto_16566 ) ( not ( = ?auto_16556 ?auto_16563 ) ) ( OBJ-AT ?auto_16558 ?auto_16556 ) ( OBJ-AT ?auto_16557 ?auto_16563 ) ( OBJ-AT ?auto_16565 ?auto_16556 ) ( TRUCK-AT ?auto_16560 ?auto_16559 ) ( IN-CITY ?auto_16559 ?auto_16562 ) ( IN-CITY ?auto_16563 ?auto_16562 ) ( not ( = ?auto_16563 ?auto_16559 ) ) ( OBJ-AT ?auto_16555 ?auto_16556 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16557 ?auto_16556 )
      ( DELIVER-2PKG-VERIFY ?auto_16555 ?auto_16557 ?auto_16556 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16691 - OBJ
      ?auto_16692 - LOCATION
    )
    :vars
    (
      ?auto_16702 - OBJ
      ?auto_16694 - LOCATION
      ?auto_16697 - CITY
      ?auto_16698 - TRUCK
      ?auto_16701 - LOCATION
      ?auto_16695 - CITY
      ?auto_16704 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16691 ?auto_16702 ) ( IN-CITY ?auto_16694 ?auto_16697 ) ( IN-CITY ?auto_16692 ?auto_16697 ) ( not ( = ?auto_16692 ?auto_16694 ) ) ( OBJ-AT ?auto_16691 ?auto_16694 ) ( TRUCK-AT ?auto_16698 ?auto_16701 ) ( IN-CITY ?auto_16701 ?auto_16695 ) ( IN-CITY ?auto_16694 ?auto_16695 ) ( not ( = ?auto_16694 ?auto_16701 ) ) ( TRUCK-AT ?auto_16704 ?auto_16692 ) ( IN-TRUCK ?auto_16702 ?auto_16704 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16702 ?auto_16692 )
      ( DELIVER-2PKG ?auto_16702 ?auto_16691 ?auto_16692 )
      ( DELIVER-1PKG-VERIFY ?auto_16691 ?auto_16692 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16706 - OBJ
      ?auto_16708 - OBJ
      ?auto_16707 - LOCATION
    )
    :vars
    (
      ?auto_16714 - LOCATION
      ?auto_16709 - CITY
      ?auto_16711 - TRUCK
      ?auto_16715 - LOCATION
      ?auto_16712 - CITY
      ?auto_16710 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16708 ?auto_16706 ) ( IN-CITY ?auto_16714 ?auto_16709 ) ( IN-CITY ?auto_16707 ?auto_16709 ) ( not ( = ?auto_16707 ?auto_16714 ) ) ( OBJ-AT ?auto_16708 ?auto_16714 ) ( TRUCK-AT ?auto_16711 ?auto_16715 ) ( IN-CITY ?auto_16715 ?auto_16712 ) ( IN-CITY ?auto_16714 ?auto_16712 ) ( not ( = ?auto_16714 ?auto_16715 ) ) ( TRUCK-AT ?auto_16710 ?auto_16707 ) ( IN-TRUCK ?auto_16706 ?auto_16710 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16708 ?auto_16707 )
      ( DELIVER-2PKG-VERIFY ?auto_16706 ?auto_16708 ?auto_16707 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16833 - OBJ
      ?auto_16834 - LOCATION
    )
    :vars
    (
      ?auto_16837 - OBJ
      ?auto_16842 - LOCATION
      ?auto_16835 - CITY
      ?auto_16839 - CITY
      ?auto_16840 - TRUCK
      ?auto_16845 - LOCATION
      ?auto_16846 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16833 ?auto_16837 ) ( IN-CITY ?auto_16842 ?auto_16835 ) ( IN-CITY ?auto_16834 ?auto_16835 ) ( not ( = ?auto_16834 ?auto_16842 ) ) ( OBJ-AT ?auto_16833 ?auto_16842 ) ( IN-CITY ?auto_16834 ?auto_16839 ) ( IN-CITY ?auto_16842 ?auto_16839 ) ( IN-TRUCK ?auto_16837 ?auto_16840 ) ( TRUCK-AT ?auto_16840 ?auto_16845 ) ( IN-CITY ?auto_16845 ?auto_16846 ) ( IN-CITY ?auto_16834 ?auto_16846 ) ( not ( = ?auto_16834 ?auto_16845 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16840 ?auto_16845 ?auto_16834 ?auto_16846 )
      ( DELIVER-2PKG ?auto_16837 ?auto_16833 ?auto_16834 )
      ( DELIVER-1PKG-VERIFY ?auto_16833 ?auto_16834 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16848 - OBJ
      ?auto_16850 - OBJ
      ?auto_16849 - LOCATION
    )
    :vars
    (
      ?auto_16856 - LOCATION
      ?auto_16859 - CITY
      ?auto_16855 - CITY
      ?auto_16853 - TRUCK
      ?auto_16852 - LOCATION
      ?auto_16854 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16850 ?auto_16848 ) ( IN-CITY ?auto_16856 ?auto_16859 ) ( IN-CITY ?auto_16849 ?auto_16859 ) ( not ( = ?auto_16849 ?auto_16856 ) ) ( OBJ-AT ?auto_16850 ?auto_16856 ) ( IN-CITY ?auto_16849 ?auto_16855 ) ( IN-CITY ?auto_16856 ?auto_16855 ) ( IN-TRUCK ?auto_16848 ?auto_16853 ) ( TRUCK-AT ?auto_16853 ?auto_16852 ) ( IN-CITY ?auto_16852 ?auto_16854 ) ( IN-CITY ?auto_16849 ?auto_16854 ) ( not ( = ?auto_16849 ?auto_16852 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16850 ?auto_16849 )
      ( DELIVER-2PKG-VERIFY ?auto_16848 ?auto_16850 ?auto_16849 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16975 - OBJ
      ?auto_16976 - LOCATION
    )
    :vars
    (
      ?auto_16985 - OBJ
      ?auto_16980 - LOCATION
      ?auto_16977 - CITY
      ?auto_16983 - CITY
      ?auto_16984 - TRUCK
      ?auto_16981 - LOCATION
      ?auto_16982 - CITY
      ?auto_16987 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16975 ?auto_16985 ) ( IN-CITY ?auto_16980 ?auto_16977 ) ( IN-CITY ?auto_16976 ?auto_16977 ) ( not ( = ?auto_16976 ?auto_16980 ) ) ( OBJ-AT ?auto_16975 ?auto_16980 ) ( IN-CITY ?auto_16976 ?auto_16983 ) ( IN-CITY ?auto_16980 ?auto_16983 ) ( TRUCK-AT ?auto_16984 ?auto_16981 ) ( IN-CITY ?auto_16981 ?auto_16982 ) ( IN-CITY ?auto_16976 ?auto_16982 ) ( not ( = ?auto_16976 ?auto_16981 ) ) ( TRUCK-AT ?auto_16984 ?auto_16987 ) ( OBJ-AT ?auto_16985 ?auto_16987 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_16985 ?auto_16984 ?auto_16987 )
      ( DELIVER-2PKG ?auto_16985 ?auto_16975 ?auto_16976 )
      ( DELIVER-1PKG-VERIFY ?auto_16975 ?auto_16976 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16989 - OBJ
      ?auto_16991 - OBJ
      ?auto_16990 - LOCATION
    )
    :vars
    (
      ?auto_16993 - LOCATION
      ?auto_16997 - CITY
      ?auto_16995 - CITY
      ?auto_17001 - TRUCK
      ?auto_16996 - LOCATION
      ?auto_16992 - CITY
      ?auto_16994 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_16991 ?auto_16989 ) ( IN-CITY ?auto_16993 ?auto_16997 ) ( IN-CITY ?auto_16990 ?auto_16997 ) ( not ( = ?auto_16990 ?auto_16993 ) ) ( OBJ-AT ?auto_16991 ?auto_16993 ) ( IN-CITY ?auto_16990 ?auto_16995 ) ( IN-CITY ?auto_16993 ?auto_16995 ) ( TRUCK-AT ?auto_17001 ?auto_16996 ) ( IN-CITY ?auto_16996 ?auto_16992 ) ( IN-CITY ?auto_16990 ?auto_16992 ) ( not ( = ?auto_16990 ?auto_16996 ) ) ( TRUCK-AT ?auto_17001 ?auto_16994 ) ( OBJ-AT ?auto_16989 ?auto_16994 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16991 ?auto_16990 )
      ( DELIVER-2PKG-VERIFY ?auto_16989 ?auto_16991 ?auto_16990 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17367 - OBJ
      ?auto_17369 - OBJ
      ?auto_17370 - OBJ
      ?auto_17368 - LOCATION
    )
    :vars
    (
      ?auto_17372 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_17369 ?auto_17367 ) ( GREATER-THAN ?auto_17370 ?auto_17367 ) ( GREATER-THAN ?auto_17370 ?auto_17369 ) ( TRUCK-AT ?auto_17372 ?auto_17368 ) ( IN-TRUCK ?auto_17370 ?auto_17372 ) ( OBJ-AT ?auto_17367 ?auto_17368 ) ( OBJ-AT ?auto_17369 ?auto_17368 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_17370 ?auto_17368 )
      ( DELIVER-3PKG-VERIFY ?auto_17367 ?auto_17369 ?auto_17370 ?auto_17368 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17550 - OBJ
      ?auto_17552 - OBJ
      ?auto_17553 - OBJ
      ?auto_17551 - LOCATION
    )
    :vars
    (
      ?auto_17557 - OBJ
      ?auto_17555 - TRUCK
      ?auto_17554 - LOCATION
      ?auto_17559 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_17552 ?auto_17550 ) ( GREATER-THAN ?auto_17553 ?auto_17550 ) ( GREATER-THAN ?auto_17553 ?auto_17552 ) ( GREATER-THAN ?auto_17553 ?auto_17557 ) ( IN-TRUCK ?auto_17553 ?auto_17555 ) ( TRUCK-AT ?auto_17555 ?auto_17554 ) ( IN-CITY ?auto_17554 ?auto_17559 ) ( IN-CITY ?auto_17551 ?auto_17559 ) ( not ( = ?auto_17551 ?auto_17554 ) ) ( OBJ-AT ?auto_17557 ?auto_17551 ) ( OBJ-AT ?auto_17550 ?auto_17551 ) ( OBJ-AT ?auto_17552 ?auto_17551 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17557 ?auto_17553 ?auto_17551 )
      ( DELIVER-3PKG-VERIFY ?auto_17550 ?auto_17552 ?auto_17553 ?auto_17551 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17799 - OBJ
      ?auto_17801 - OBJ
      ?auto_17802 - OBJ
      ?auto_17800 - LOCATION
    )
    :vars
    (
      ?auto_17804 - OBJ
      ?auto_17809 - OBJ
      ?auto_17806 - TRUCK
      ?auto_17805 - LOCATION
      ?auto_17808 - CITY
      ?auto_17810 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_17801 ?auto_17799 ) ( GREATER-THAN ?auto_17802 ?auto_17799 ) ( GREATER-THAN ?auto_17802 ?auto_17801 ) ( GREATER-THAN ?auto_17802 ?auto_17804 ) ( GREATER-THAN ?auto_17802 ?auto_17809 ) ( TRUCK-AT ?auto_17806 ?auto_17805 ) ( IN-CITY ?auto_17805 ?auto_17808 ) ( IN-CITY ?auto_17800 ?auto_17808 ) ( not ( = ?auto_17800 ?auto_17805 ) ) ( OBJ-AT ?auto_17809 ?auto_17800 ) ( TRUCK-AT ?auto_17806 ?auto_17810 ) ( OBJ-AT ?auto_17802 ?auto_17810 ) ( OBJ-AT ?auto_17804 ?auto_17800 ) ( OBJ-AT ?auto_17799 ?auto_17800 ) ( OBJ-AT ?auto_17801 ?auto_17800 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17804 ?auto_17802 ?auto_17800 )
      ( DELIVER-3PKG-VERIFY ?auto_17799 ?auto_17801 ?auto_17802 ?auto_17800 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18097 - OBJ
      ?auto_18099 - OBJ
      ?auto_18100 - OBJ
      ?auto_18098 - LOCATION
    )
    :vars
    (
      ?auto_18104 - OBJ
      ?auto_18109 - OBJ
      ?auto_18108 - OBJ
      ?auto_18106 - LOCATION
      ?auto_18102 - CITY
      ?auto_18101 - TRUCK
      ?auto_18107 - LOCATION
      ?auto_18110 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_18099 ?auto_18097 ) ( GREATER-THAN ?auto_18100 ?auto_18097 ) ( GREATER-THAN ?auto_18100 ?auto_18099 ) ( GREATER-THAN ?auto_18100 ?auto_18104 ) ( GREATER-THAN ?auto_18100 ?auto_18109 ) ( GREATER-THAN ?auto_18100 ?auto_18108 ) ( IN-CITY ?auto_18106 ?auto_18102 ) ( IN-CITY ?auto_18098 ?auto_18102 ) ( not ( = ?auto_18098 ?auto_18106 ) ) ( OBJ-AT ?auto_18108 ?auto_18098 ) ( OBJ-AT ?auto_18100 ?auto_18106 ) ( OBJ-AT ?auto_18109 ?auto_18098 ) ( TRUCK-AT ?auto_18101 ?auto_18107 ) ( IN-CITY ?auto_18107 ?auto_18110 ) ( IN-CITY ?auto_18106 ?auto_18110 ) ( not ( = ?auto_18106 ?auto_18107 ) ) ( OBJ-AT ?auto_18104 ?auto_18098 ) ( OBJ-AT ?auto_18097 ?auto_18098 ) ( OBJ-AT ?auto_18099 ?auto_18098 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18104 ?auto_18100 ?auto_18098 )
      ( DELIVER-3PKG-VERIFY ?auto_18097 ?auto_18099 ?auto_18100 ?auto_18098 ) )
  )

)

