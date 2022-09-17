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
      ?auto_17008 - OBJ
      ?auto_17007 - LOCATION
    )
    :vars
    (
      ?auto_17009 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_17009 ?auto_17007 ) ( IN-TRUCK ?auto_17008 ?auto_17009 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_17008 ?auto_17009 ?auto_17007 )
      ( DELIVER-1PKG-VERIFY ?auto_17008 ?auto_17007 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_17026 - OBJ
      ?auto_17025 - LOCATION
    )
    :vars
    (
      ?auto_17027 - TRUCK
      ?auto_17028 - LOCATION
      ?auto_17029 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17026 ?auto_17027 ) ( TRUCK-AT ?auto_17027 ?auto_17028 ) ( IN-CITY ?auto_17028 ?auto_17029 ) ( IN-CITY ?auto_17025 ?auto_17029 ) ( not ( = ?auto_17025 ?auto_17028 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_17027 ?auto_17028 ?auto_17025 ?auto_17029 )
      ( DELIVER-1PKG ?auto_17026 ?auto_17025 )
      ( DELIVER-1PKG-VERIFY ?auto_17026 ?auto_17025 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_17052 - OBJ
      ?auto_17051 - LOCATION
    )
    :vars
    (
      ?auto_17053 - TRUCK
      ?auto_17054 - LOCATION
      ?auto_17055 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_17053 ?auto_17054 ) ( IN-CITY ?auto_17054 ?auto_17055 ) ( IN-CITY ?auto_17051 ?auto_17055 ) ( not ( = ?auto_17051 ?auto_17054 ) ) ( OBJ-AT ?auto_17052 ?auto_17054 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_17052 ?auto_17053 ?auto_17054 )
      ( DELIVER-1PKG ?auto_17052 ?auto_17051 )
      ( DELIVER-1PKG-VERIFY ?auto_17052 ?auto_17051 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_17078 - OBJ
      ?auto_17077 - LOCATION
    )
    :vars
    (
      ?auto_17081 - LOCATION
      ?auto_17079 - CITY
      ?auto_17080 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17081 ?auto_17079 ) ( IN-CITY ?auto_17077 ?auto_17079 ) ( not ( = ?auto_17077 ?auto_17081 ) ) ( OBJ-AT ?auto_17078 ?auto_17081 ) ( TRUCK-AT ?auto_17080 ?auto_17077 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_17080 ?auto_17077 ?auto_17081 ?auto_17079 )
      ( DELIVER-1PKG ?auto_17078 ?auto_17077 )
      ( DELIVER-1PKG-VERIFY ?auto_17078 ?auto_17077 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_17218 - OBJ
      ?auto_17217 - LOCATION
    )
    :vars
    (
      ?auto_17219 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_17219 ?auto_17217 ) ( IN-TRUCK ?auto_17218 ?auto_17219 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_17218 ?auto_17219 ?auto_17217 )
      ( DELIVER-1PKG-VERIFY ?auto_17218 ?auto_17217 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_17221 - OBJ
      ?auto_17222 - OBJ
      ?auto_17220 - LOCATION
    )
    :vars
    (
      ?auto_17223 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_17222 ?auto_17221 ) ) ( TRUCK-AT ?auto_17223 ?auto_17220 ) ( IN-TRUCK ?auto_17222 ?auto_17223 ) ( OBJ-AT ?auto_17221 ?auto_17220 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_17222 ?auto_17220 )
      ( DELIVER-2PKG-VERIFY ?auto_17221 ?auto_17222 ?auto_17220 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_17225 - OBJ
      ?auto_17226 - OBJ
      ?auto_17224 - LOCATION
    )
    :vars
    (
      ?auto_17227 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_17226 ?auto_17225 ) ) ( TRUCK-AT ?auto_17227 ?auto_17224 ) ( IN-TRUCK ?auto_17225 ?auto_17227 ) ( OBJ-AT ?auto_17226 ?auto_17224 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_17225 ?auto_17224 )
      ( DELIVER-2PKG-VERIFY ?auto_17225 ?auto_17226 ?auto_17224 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_17358 - OBJ
      ?auto_17357 - LOCATION
    )
    :vars
    (
      ?auto_17359 - TRUCK
      ?auto_17360 - LOCATION
      ?auto_17361 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17358 ?auto_17359 ) ( TRUCK-AT ?auto_17359 ?auto_17360 ) ( IN-CITY ?auto_17360 ?auto_17361 ) ( IN-CITY ?auto_17357 ?auto_17361 ) ( not ( = ?auto_17357 ?auto_17360 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_17359 ?auto_17360 ?auto_17357 ?auto_17361 )
      ( DELIVER-1PKG ?auto_17358 ?auto_17357 )
      ( DELIVER-1PKG-VERIFY ?auto_17358 ?auto_17357 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_17363 - OBJ
      ?auto_17364 - OBJ
      ?auto_17362 - LOCATION
    )
    :vars
    (
      ?auto_17367 - TRUCK
      ?auto_17365 - LOCATION
      ?auto_17366 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_17364 ?auto_17363 ) ) ( IN-TRUCK ?auto_17364 ?auto_17367 ) ( TRUCK-AT ?auto_17367 ?auto_17365 ) ( IN-CITY ?auto_17365 ?auto_17366 ) ( IN-CITY ?auto_17362 ?auto_17366 ) ( not ( = ?auto_17362 ?auto_17365 ) ) ( OBJ-AT ?auto_17363 ?auto_17362 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_17364 ?auto_17362 )
      ( DELIVER-2PKG-VERIFY ?auto_17363 ?auto_17364 ?auto_17362 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_17369 - OBJ
      ?auto_17370 - OBJ
      ?auto_17368 - LOCATION
    )
    :vars
    (
      ?auto_17371 - TRUCK
      ?auto_17372 - LOCATION
      ?auto_17373 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_17370 ?auto_17369 ) ) ( IN-TRUCK ?auto_17369 ?auto_17371 ) ( TRUCK-AT ?auto_17371 ?auto_17372 ) ( IN-CITY ?auto_17372 ?auto_17373 ) ( IN-CITY ?auto_17368 ?auto_17373 ) ( not ( = ?auto_17368 ?auto_17372 ) ) ( OBJ-AT ?auto_17370 ?auto_17368 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17370 ?auto_17369 ?auto_17368 )
      ( DELIVER-2PKG-VERIFY ?auto_17369 ?auto_17370 ?auto_17368 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_17553 - OBJ
      ?auto_17552 - LOCATION
    )
    :vars
    (
      ?auto_17556 - OBJ
      ?auto_17554 - TRUCK
      ?auto_17555 - LOCATION
      ?auto_17557 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_17553 ?auto_17556 ) ) ( TRUCK-AT ?auto_17554 ?auto_17555 ) ( IN-CITY ?auto_17555 ?auto_17557 ) ( IN-CITY ?auto_17552 ?auto_17557 ) ( not ( = ?auto_17552 ?auto_17555 ) ) ( OBJ-AT ?auto_17556 ?auto_17552 ) ( OBJ-AT ?auto_17553 ?auto_17555 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_17553 ?auto_17554 ?auto_17555 )
      ( DELIVER-2PKG ?auto_17556 ?auto_17553 ?auto_17552 )
      ( DELIVER-1PKG-VERIFY ?auto_17553 ?auto_17552 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_17559 - OBJ
      ?auto_17560 - OBJ
      ?auto_17558 - LOCATION
    )
    :vars
    (
      ?auto_17562 - TRUCK
      ?auto_17563 - LOCATION
      ?auto_17561 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_17560 ?auto_17559 ) ) ( TRUCK-AT ?auto_17562 ?auto_17563 ) ( IN-CITY ?auto_17563 ?auto_17561 ) ( IN-CITY ?auto_17558 ?auto_17561 ) ( not ( = ?auto_17558 ?auto_17563 ) ) ( OBJ-AT ?auto_17559 ?auto_17558 ) ( OBJ-AT ?auto_17560 ?auto_17563 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_17560 ?auto_17558 )
      ( DELIVER-2PKG-VERIFY ?auto_17559 ?auto_17560 ?auto_17558 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_17565 - OBJ
      ?auto_17566 - OBJ
      ?auto_17564 - LOCATION
    )
    :vars
    (
      ?auto_17568 - TRUCK
      ?auto_17569 - LOCATION
      ?auto_17567 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_17566 ?auto_17565 ) ) ( TRUCK-AT ?auto_17568 ?auto_17569 ) ( IN-CITY ?auto_17569 ?auto_17567 ) ( IN-CITY ?auto_17564 ?auto_17567 ) ( not ( = ?auto_17564 ?auto_17569 ) ) ( OBJ-AT ?auto_17566 ?auto_17564 ) ( OBJ-AT ?auto_17565 ?auto_17569 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17566 ?auto_17565 ?auto_17564 )
      ( DELIVER-2PKG-VERIFY ?auto_17565 ?auto_17566 ?auto_17564 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_17749 - OBJ
      ?auto_17748 - LOCATION
    )
    :vars
    (
      ?auto_17752 - OBJ
      ?auto_17753 - LOCATION
      ?auto_17750 - CITY
      ?auto_17751 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_17749 ?auto_17752 ) ) ( IN-CITY ?auto_17753 ?auto_17750 ) ( IN-CITY ?auto_17748 ?auto_17750 ) ( not ( = ?auto_17748 ?auto_17753 ) ) ( OBJ-AT ?auto_17752 ?auto_17748 ) ( OBJ-AT ?auto_17749 ?auto_17753 ) ( TRUCK-AT ?auto_17751 ?auto_17748 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_17751 ?auto_17748 ?auto_17753 ?auto_17750 )
      ( DELIVER-2PKG ?auto_17752 ?auto_17749 ?auto_17748 )
      ( DELIVER-1PKG-VERIFY ?auto_17749 ?auto_17748 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_17755 - OBJ
      ?auto_17756 - OBJ
      ?auto_17754 - LOCATION
    )
    :vars
    (
      ?auto_17758 - LOCATION
      ?auto_17759 - CITY
      ?auto_17757 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_17756 ?auto_17755 ) ) ( IN-CITY ?auto_17758 ?auto_17759 ) ( IN-CITY ?auto_17754 ?auto_17759 ) ( not ( = ?auto_17754 ?auto_17758 ) ) ( OBJ-AT ?auto_17755 ?auto_17754 ) ( OBJ-AT ?auto_17756 ?auto_17758 ) ( TRUCK-AT ?auto_17757 ?auto_17754 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_17756 ?auto_17754 )
      ( DELIVER-2PKG-VERIFY ?auto_17755 ?auto_17756 ?auto_17754 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_17761 - OBJ
      ?auto_17762 - OBJ
      ?auto_17760 - LOCATION
    )
    :vars
    (
      ?auto_17765 - LOCATION
      ?auto_17764 - CITY
      ?auto_17763 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_17762 ?auto_17761 ) ) ( IN-CITY ?auto_17765 ?auto_17764 ) ( IN-CITY ?auto_17760 ?auto_17764 ) ( not ( = ?auto_17760 ?auto_17765 ) ) ( OBJ-AT ?auto_17762 ?auto_17760 ) ( OBJ-AT ?auto_17761 ?auto_17765 ) ( TRUCK-AT ?auto_17763 ?auto_17760 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17762 ?auto_17761 ?auto_17760 )
      ( DELIVER-2PKG-VERIFY ?auto_17761 ?auto_17762 ?auto_17760 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_17945 - OBJ
      ?auto_17944 - LOCATION
    )
    :vars
    (
      ?auto_17949 - OBJ
      ?auto_17948 - LOCATION
      ?auto_17947 - CITY
      ?auto_17946 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_17945 ?auto_17949 ) ) ( IN-CITY ?auto_17948 ?auto_17947 ) ( IN-CITY ?auto_17944 ?auto_17947 ) ( not ( = ?auto_17944 ?auto_17948 ) ) ( OBJ-AT ?auto_17945 ?auto_17948 ) ( TRUCK-AT ?auto_17946 ?auto_17944 ) ( IN-TRUCK ?auto_17949 ?auto_17946 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_17949 ?auto_17944 )
      ( DELIVER-2PKG ?auto_17949 ?auto_17945 ?auto_17944 )
      ( DELIVER-1PKG-VERIFY ?auto_17945 ?auto_17944 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_17951 - OBJ
      ?auto_17952 - OBJ
      ?auto_17950 - LOCATION
    )
    :vars
    (
      ?auto_17955 - LOCATION
      ?auto_17953 - CITY
      ?auto_17954 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_17952 ?auto_17951 ) ) ( IN-CITY ?auto_17955 ?auto_17953 ) ( IN-CITY ?auto_17950 ?auto_17953 ) ( not ( = ?auto_17950 ?auto_17955 ) ) ( OBJ-AT ?auto_17952 ?auto_17955 ) ( TRUCK-AT ?auto_17954 ?auto_17950 ) ( IN-TRUCK ?auto_17951 ?auto_17954 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_17952 ?auto_17950 )
      ( DELIVER-2PKG-VERIFY ?auto_17951 ?auto_17952 ?auto_17950 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_17957 - OBJ
      ?auto_17958 - OBJ
      ?auto_17956 - LOCATION
    )
    :vars
    (
      ?auto_17961 - LOCATION
      ?auto_17959 - CITY
      ?auto_17960 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_17958 ?auto_17957 ) ) ( IN-CITY ?auto_17961 ?auto_17959 ) ( IN-CITY ?auto_17956 ?auto_17959 ) ( not ( = ?auto_17956 ?auto_17961 ) ) ( OBJ-AT ?auto_17957 ?auto_17961 ) ( TRUCK-AT ?auto_17960 ?auto_17956 ) ( IN-TRUCK ?auto_17958 ?auto_17960 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17958 ?auto_17957 ?auto_17956 )
      ( DELIVER-2PKG-VERIFY ?auto_17957 ?auto_17958 ?auto_17956 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_18141 - OBJ
      ?auto_18140 - LOCATION
    )
    :vars
    (
      ?auto_18145 - OBJ
      ?auto_18144 - LOCATION
      ?auto_18142 - CITY
      ?auto_18143 - TRUCK
      ?auto_18146 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_18141 ?auto_18145 ) ) ( IN-CITY ?auto_18144 ?auto_18142 ) ( IN-CITY ?auto_18140 ?auto_18142 ) ( not ( = ?auto_18140 ?auto_18144 ) ) ( OBJ-AT ?auto_18141 ?auto_18144 ) ( IN-TRUCK ?auto_18145 ?auto_18143 ) ( TRUCK-AT ?auto_18143 ?auto_18146 ) ( IN-CITY ?auto_18146 ?auto_18142 ) ( not ( = ?auto_18140 ?auto_18146 ) ) ( not ( = ?auto_18144 ?auto_18146 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_18143 ?auto_18146 ?auto_18140 ?auto_18142 )
      ( DELIVER-2PKG ?auto_18145 ?auto_18141 ?auto_18140 )
      ( DELIVER-1PKG-VERIFY ?auto_18141 ?auto_18140 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_18148 - OBJ
      ?auto_18149 - OBJ
      ?auto_18147 - LOCATION
    )
    :vars
    (
      ?auto_18153 - LOCATION
      ?auto_18152 - CITY
      ?auto_18151 - TRUCK
      ?auto_18150 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_18149 ?auto_18148 ) ) ( IN-CITY ?auto_18153 ?auto_18152 ) ( IN-CITY ?auto_18147 ?auto_18152 ) ( not ( = ?auto_18147 ?auto_18153 ) ) ( OBJ-AT ?auto_18149 ?auto_18153 ) ( IN-TRUCK ?auto_18148 ?auto_18151 ) ( TRUCK-AT ?auto_18151 ?auto_18150 ) ( IN-CITY ?auto_18150 ?auto_18152 ) ( not ( = ?auto_18147 ?auto_18150 ) ) ( not ( = ?auto_18153 ?auto_18150 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_18149 ?auto_18147 )
      ( DELIVER-2PKG-VERIFY ?auto_18148 ?auto_18149 ?auto_18147 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_18155 - OBJ
      ?auto_18156 - OBJ
      ?auto_18154 - LOCATION
    )
    :vars
    (
      ?auto_18157 - LOCATION
      ?auto_18160 - CITY
      ?auto_18159 - TRUCK
      ?auto_18158 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_18156 ?auto_18155 ) ) ( IN-CITY ?auto_18157 ?auto_18160 ) ( IN-CITY ?auto_18154 ?auto_18160 ) ( not ( = ?auto_18154 ?auto_18157 ) ) ( OBJ-AT ?auto_18155 ?auto_18157 ) ( IN-TRUCK ?auto_18156 ?auto_18159 ) ( TRUCK-AT ?auto_18159 ?auto_18158 ) ( IN-CITY ?auto_18158 ?auto_18160 ) ( not ( = ?auto_18154 ?auto_18158 ) ) ( not ( = ?auto_18157 ?auto_18158 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18156 ?auto_18155 ?auto_18154 )
      ( DELIVER-2PKG-VERIFY ?auto_18155 ?auto_18156 ?auto_18154 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_18363 - OBJ
      ?auto_18362 - LOCATION
    )
    :vars
    (
      ?auto_18367 - OBJ
      ?auto_18364 - LOCATION
      ?auto_18368 - CITY
      ?auto_18366 - TRUCK
      ?auto_18365 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_18363 ?auto_18367 ) ) ( IN-CITY ?auto_18364 ?auto_18368 ) ( IN-CITY ?auto_18362 ?auto_18368 ) ( not ( = ?auto_18362 ?auto_18364 ) ) ( OBJ-AT ?auto_18363 ?auto_18364 ) ( TRUCK-AT ?auto_18366 ?auto_18365 ) ( IN-CITY ?auto_18365 ?auto_18368 ) ( not ( = ?auto_18362 ?auto_18365 ) ) ( not ( = ?auto_18364 ?auto_18365 ) ) ( OBJ-AT ?auto_18367 ?auto_18365 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_18367 ?auto_18366 ?auto_18365 )
      ( DELIVER-2PKG ?auto_18367 ?auto_18363 ?auto_18362 )
      ( DELIVER-1PKG-VERIFY ?auto_18363 ?auto_18362 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_18370 - OBJ
      ?auto_18371 - OBJ
      ?auto_18369 - LOCATION
    )
    :vars
    (
      ?auto_18375 - LOCATION
      ?auto_18374 - CITY
      ?auto_18373 - TRUCK
      ?auto_18372 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_18371 ?auto_18370 ) ) ( IN-CITY ?auto_18375 ?auto_18374 ) ( IN-CITY ?auto_18369 ?auto_18374 ) ( not ( = ?auto_18369 ?auto_18375 ) ) ( OBJ-AT ?auto_18371 ?auto_18375 ) ( TRUCK-AT ?auto_18373 ?auto_18372 ) ( IN-CITY ?auto_18372 ?auto_18374 ) ( not ( = ?auto_18369 ?auto_18372 ) ) ( not ( = ?auto_18375 ?auto_18372 ) ) ( OBJ-AT ?auto_18370 ?auto_18372 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_18371 ?auto_18369 )
      ( DELIVER-2PKG-VERIFY ?auto_18370 ?auto_18371 ?auto_18369 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_18377 - OBJ
      ?auto_18378 - OBJ
      ?auto_18376 - LOCATION
    )
    :vars
    (
      ?auto_18380 - LOCATION
      ?auto_18382 - CITY
      ?auto_18381 - TRUCK
      ?auto_18379 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_18378 ?auto_18377 ) ) ( IN-CITY ?auto_18380 ?auto_18382 ) ( IN-CITY ?auto_18376 ?auto_18382 ) ( not ( = ?auto_18376 ?auto_18380 ) ) ( OBJ-AT ?auto_18377 ?auto_18380 ) ( TRUCK-AT ?auto_18381 ?auto_18379 ) ( IN-CITY ?auto_18379 ?auto_18382 ) ( not ( = ?auto_18376 ?auto_18379 ) ) ( not ( = ?auto_18380 ?auto_18379 ) ) ( OBJ-AT ?auto_18378 ?auto_18379 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18378 ?auto_18377 ?auto_18376 )
      ( DELIVER-2PKG-VERIFY ?auto_18377 ?auto_18378 ?auto_18376 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_18585 - OBJ
      ?auto_18584 - LOCATION
    )
    :vars
    (
      ?auto_18589 - OBJ
      ?auto_18587 - LOCATION
      ?auto_18590 - CITY
      ?auto_18586 - LOCATION
      ?auto_18588 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_18585 ?auto_18589 ) ) ( IN-CITY ?auto_18587 ?auto_18590 ) ( IN-CITY ?auto_18584 ?auto_18590 ) ( not ( = ?auto_18584 ?auto_18587 ) ) ( OBJ-AT ?auto_18585 ?auto_18587 ) ( IN-CITY ?auto_18586 ?auto_18590 ) ( not ( = ?auto_18584 ?auto_18586 ) ) ( not ( = ?auto_18587 ?auto_18586 ) ) ( OBJ-AT ?auto_18589 ?auto_18586 ) ( TRUCK-AT ?auto_18588 ?auto_18584 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_18588 ?auto_18584 ?auto_18586 ?auto_18590 )
      ( DELIVER-2PKG ?auto_18589 ?auto_18585 ?auto_18584 )
      ( DELIVER-1PKG-VERIFY ?auto_18585 ?auto_18584 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_18592 - OBJ
      ?auto_18593 - OBJ
      ?auto_18591 - LOCATION
    )
    :vars
    (
      ?auto_18597 - LOCATION
      ?auto_18594 - CITY
      ?auto_18595 - LOCATION
      ?auto_18596 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_18593 ?auto_18592 ) ) ( IN-CITY ?auto_18597 ?auto_18594 ) ( IN-CITY ?auto_18591 ?auto_18594 ) ( not ( = ?auto_18591 ?auto_18597 ) ) ( OBJ-AT ?auto_18593 ?auto_18597 ) ( IN-CITY ?auto_18595 ?auto_18594 ) ( not ( = ?auto_18591 ?auto_18595 ) ) ( not ( = ?auto_18597 ?auto_18595 ) ) ( OBJ-AT ?auto_18592 ?auto_18595 ) ( TRUCK-AT ?auto_18596 ?auto_18591 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_18593 ?auto_18591 )
      ( DELIVER-2PKG-VERIFY ?auto_18592 ?auto_18593 ?auto_18591 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_18599 - OBJ
      ?auto_18600 - OBJ
      ?auto_18598 - LOCATION
    )
    :vars
    (
      ?auto_18601 - LOCATION
      ?auto_18603 - CITY
      ?auto_18604 - LOCATION
      ?auto_18602 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_18600 ?auto_18599 ) ) ( IN-CITY ?auto_18601 ?auto_18603 ) ( IN-CITY ?auto_18598 ?auto_18603 ) ( not ( = ?auto_18598 ?auto_18601 ) ) ( OBJ-AT ?auto_18599 ?auto_18601 ) ( IN-CITY ?auto_18604 ?auto_18603 ) ( not ( = ?auto_18598 ?auto_18604 ) ) ( not ( = ?auto_18601 ?auto_18604 ) ) ( OBJ-AT ?auto_18600 ?auto_18604 ) ( TRUCK-AT ?auto_18602 ?auto_18598 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18600 ?auto_18599 ?auto_18598 )
      ( DELIVER-2PKG-VERIFY ?auto_18599 ?auto_18600 ?auto_18598 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_19225 - OBJ
      ?auto_19224 - LOCATION
    )
    :vars
    (
      ?auto_19226 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_19226 ?auto_19224 ) ( IN-TRUCK ?auto_19225 ?auto_19226 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_19225 ?auto_19226 ?auto_19224 )
      ( DELIVER-1PKG-VERIFY ?auto_19225 ?auto_19224 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_19228 - OBJ
      ?auto_19229 - OBJ
      ?auto_19227 - LOCATION
    )
    :vars
    (
      ?auto_19230 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_19229 ?auto_19228 ) ) ( TRUCK-AT ?auto_19230 ?auto_19227 ) ( IN-TRUCK ?auto_19229 ?auto_19230 ) ( OBJ-AT ?auto_19228 ?auto_19227 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_19229 ?auto_19227 )
      ( DELIVER-2PKG-VERIFY ?auto_19228 ?auto_19229 ?auto_19227 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_19232 - OBJ
      ?auto_19233 - OBJ
      ?auto_19231 - LOCATION
    )
    :vars
    (
      ?auto_19234 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_19233 ?auto_19232 ) ) ( TRUCK-AT ?auto_19234 ?auto_19231 ) ( IN-TRUCK ?auto_19233 ?auto_19234 ) ( OBJ-AT ?auto_19232 ?auto_19231 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_19233 ?auto_19231 )
      ( DELIVER-2PKG-VERIFY ?auto_19232 ?auto_19233 ?auto_19231 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_19236 - OBJ
      ?auto_19237 - OBJ
      ?auto_19235 - LOCATION
    )
    :vars
    (
      ?auto_19238 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_19237 ?auto_19236 ) ) ( TRUCK-AT ?auto_19238 ?auto_19235 ) ( IN-TRUCK ?auto_19236 ?auto_19238 ) ( OBJ-AT ?auto_19237 ?auto_19235 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_19236 ?auto_19235 )
      ( DELIVER-2PKG-VERIFY ?auto_19236 ?auto_19237 ?auto_19235 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_19240 - OBJ
      ?auto_19241 - OBJ
      ?auto_19239 - LOCATION
    )
    :vars
    (
      ?auto_19242 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_19241 ?auto_19240 ) ) ( TRUCK-AT ?auto_19242 ?auto_19239 ) ( IN-TRUCK ?auto_19240 ?auto_19242 ) ( OBJ-AT ?auto_19241 ?auto_19239 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_19240 ?auto_19239 )
      ( DELIVER-2PKG-VERIFY ?auto_19240 ?auto_19241 ?auto_19239 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19253 - OBJ
      ?auto_19254 - OBJ
      ?auto_19255 - OBJ
      ?auto_19252 - LOCATION
    )
    :vars
    (
      ?auto_19256 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_19254 ?auto_19253 ) ) ( not ( = ?auto_19255 ?auto_19253 ) ) ( not ( = ?auto_19255 ?auto_19254 ) ) ( TRUCK-AT ?auto_19256 ?auto_19252 ) ( IN-TRUCK ?auto_19255 ?auto_19256 ) ( OBJ-AT ?auto_19253 ?auto_19252 ) ( OBJ-AT ?auto_19254 ?auto_19252 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_19255 ?auto_19252 )
      ( DELIVER-3PKG-VERIFY ?auto_19253 ?auto_19254 ?auto_19255 ?auto_19252 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19263 - OBJ
      ?auto_19264 - OBJ
      ?auto_19265 - OBJ
      ?auto_19262 - LOCATION
    )
    :vars
    (
      ?auto_19266 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_19264 ?auto_19263 ) ) ( not ( = ?auto_19265 ?auto_19263 ) ) ( not ( = ?auto_19265 ?auto_19264 ) ) ( TRUCK-AT ?auto_19266 ?auto_19262 ) ( IN-TRUCK ?auto_19264 ?auto_19266 ) ( OBJ-AT ?auto_19263 ?auto_19262 ) ( OBJ-AT ?auto_19265 ?auto_19262 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_19264 ?auto_19262 )
      ( DELIVER-3PKG-VERIFY ?auto_19263 ?auto_19264 ?auto_19265 ?auto_19262 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19273 - OBJ
      ?auto_19274 - OBJ
      ?auto_19275 - OBJ
      ?auto_19272 - LOCATION
    )
    :vars
    (
      ?auto_19276 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_19274 ?auto_19273 ) ) ( not ( = ?auto_19275 ?auto_19273 ) ) ( not ( = ?auto_19275 ?auto_19274 ) ) ( TRUCK-AT ?auto_19276 ?auto_19272 ) ( IN-TRUCK ?auto_19275 ?auto_19276 ) ( OBJ-AT ?auto_19273 ?auto_19272 ) ( OBJ-AT ?auto_19274 ?auto_19272 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_19275 ?auto_19272 )
      ( DELIVER-3PKG-VERIFY ?auto_19273 ?auto_19274 ?auto_19275 ?auto_19272 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19283 - OBJ
      ?auto_19284 - OBJ
      ?auto_19285 - OBJ
      ?auto_19282 - LOCATION
    )
    :vars
    (
      ?auto_19286 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_19284 ?auto_19283 ) ) ( not ( = ?auto_19285 ?auto_19283 ) ) ( not ( = ?auto_19285 ?auto_19284 ) ) ( TRUCK-AT ?auto_19286 ?auto_19282 ) ( IN-TRUCK ?auto_19284 ?auto_19286 ) ( OBJ-AT ?auto_19283 ?auto_19282 ) ( OBJ-AT ?auto_19285 ?auto_19282 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_19284 ?auto_19282 )
      ( DELIVER-3PKG-VERIFY ?auto_19283 ?auto_19284 ?auto_19285 ?auto_19282 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19303 - OBJ
      ?auto_19304 - OBJ
      ?auto_19305 - OBJ
      ?auto_19302 - LOCATION
    )
    :vars
    (
      ?auto_19306 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_19304 ?auto_19303 ) ) ( not ( = ?auto_19305 ?auto_19303 ) ) ( not ( = ?auto_19305 ?auto_19304 ) ) ( TRUCK-AT ?auto_19306 ?auto_19302 ) ( IN-TRUCK ?auto_19303 ?auto_19306 ) ( OBJ-AT ?auto_19304 ?auto_19302 ) ( OBJ-AT ?auto_19305 ?auto_19302 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_19303 ?auto_19302 )
      ( DELIVER-3PKG-VERIFY ?auto_19303 ?auto_19304 ?auto_19305 ?auto_19302 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19313 - OBJ
      ?auto_19314 - OBJ
      ?auto_19315 - OBJ
      ?auto_19312 - LOCATION
    )
    :vars
    (
      ?auto_19316 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_19314 ?auto_19313 ) ) ( not ( = ?auto_19315 ?auto_19313 ) ) ( not ( = ?auto_19315 ?auto_19314 ) ) ( TRUCK-AT ?auto_19316 ?auto_19312 ) ( IN-TRUCK ?auto_19313 ?auto_19316 ) ( OBJ-AT ?auto_19314 ?auto_19312 ) ( OBJ-AT ?auto_19315 ?auto_19312 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_19313 ?auto_19312 )
      ( DELIVER-3PKG-VERIFY ?auto_19313 ?auto_19314 ?auto_19315 ?auto_19312 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_19733 - OBJ
      ?auto_19732 - LOCATION
    )
    :vars
    (
      ?auto_19734 - TRUCK
      ?auto_19735 - LOCATION
      ?auto_19736 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_19733 ?auto_19734 ) ( TRUCK-AT ?auto_19734 ?auto_19735 ) ( IN-CITY ?auto_19735 ?auto_19736 ) ( IN-CITY ?auto_19732 ?auto_19736 ) ( not ( = ?auto_19732 ?auto_19735 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_19734 ?auto_19735 ?auto_19732 ?auto_19736 )
      ( DELIVER-1PKG ?auto_19733 ?auto_19732 )
      ( DELIVER-1PKG-VERIFY ?auto_19733 ?auto_19732 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_19738 - OBJ
      ?auto_19739 - OBJ
      ?auto_19737 - LOCATION
    )
    :vars
    (
      ?auto_19742 - TRUCK
      ?auto_19741 - LOCATION
      ?auto_19740 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_19739 ?auto_19738 ) ) ( IN-TRUCK ?auto_19739 ?auto_19742 ) ( TRUCK-AT ?auto_19742 ?auto_19741 ) ( IN-CITY ?auto_19741 ?auto_19740 ) ( IN-CITY ?auto_19737 ?auto_19740 ) ( not ( = ?auto_19737 ?auto_19741 ) ) ( OBJ-AT ?auto_19738 ?auto_19737 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_19739 ?auto_19737 )
      ( DELIVER-2PKG-VERIFY ?auto_19738 ?auto_19739 ?auto_19737 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_19744 - OBJ
      ?auto_19745 - OBJ
      ?auto_19743 - LOCATION
    )
    :vars
    (
      ?auto_19749 - OBJ
      ?auto_19748 - TRUCK
      ?auto_19746 - LOCATION
      ?auto_19747 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_19745 ?auto_19744 ) ) ( not ( = ?auto_19745 ?auto_19749 ) ) ( IN-TRUCK ?auto_19745 ?auto_19748 ) ( TRUCK-AT ?auto_19748 ?auto_19746 ) ( IN-CITY ?auto_19746 ?auto_19747 ) ( IN-CITY ?auto_19743 ?auto_19747 ) ( not ( = ?auto_19743 ?auto_19746 ) ) ( OBJ-AT ?auto_19749 ?auto_19743 ) ( OBJ-AT ?auto_19744 ?auto_19743 ) ( not ( = ?auto_19744 ?auto_19749 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19749 ?auto_19745 ?auto_19743 )
      ( DELIVER-2PKG-VERIFY ?auto_19744 ?auto_19745 ?auto_19743 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_19751 - OBJ
      ?auto_19752 - OBJ
      ?auto_19750 - LOCATION
    )
    :vars
    (
      ?auto_19755 - TRUCK
      ?auto_19753 - LOCATION
      ?auto_19754 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_19752 ?auto_19751 ) ) ( IN-TRUCK ?auto_19751 ?auto_19755 ) ( TRUCK-AT ?auto_19755 ?auto_19753 ) ( IN-CITY ?auto_19753 ?auto_19754 ) ( IN-CITY ?auto_19750 ?auto_19754 ) ( not ( = ?auto_19750 ?auto_19753 ) ) ( OBJ-AT ?auto_19752 ?auto_19750 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19752 ?auto_19751 ?auto_19750 )
      ( DELIVER-2PKG-VERIFY ?auto_19751 ?auto_19752 ?auto_19750 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_19757 - OBJ
      ?auto_19758 - OBJ
      ?auto_19756 - LOCATION
    )
    :vars
    (
      ?auto_19762 - OBJ
      ?auto_19761 - TRUCK
      ?auto_19759 - LOCATION
      ?auto_19760 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_19758 ?auto_19757 ) ) ( not ( = ?auto_19757 ?auto_19762 ) ) ( IN-TRUCK ?auto_19757 ?auto_19761 ) ( TRUCK-AT ?auto_19761 ?auto_19759 ) ( IN-CITY ?auto_19759 ?auto_19760 ) ( IN-CITY ?auto_19756 ?auto_19760 ) ( not ( = ?auto_19756 ?auto_19759 ) ) ( OBJ-AT ?auto_19762 ?auto_19756 ) ( OBJ-AT ?auto_19758 ?auto_19756 ) ( not ( = ?auto_19758 ?auto_19762 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19762 ?auto_19757 ?auto_19756 )
      ( DELIVER-2PKG-VERIFY ?auto_19757 ?auto_19758 ?auto_19756 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19778 - OBJ
      ?auto_19779 - OBJ
      ?auto_19780 - OBJ
      ?auto_19777 - LOCATION
    )
    :vars
    (
      ?auto_19783 - TRUCK
      ?auto_19781 - LOCATION
      ?auto_19782 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_19779 ?auto_19778 ) ) ( not ( = ?auto_19780 ?auto_19778 ) ) ( not ( = ?auto_19780 ?auto_19779 ) ) ( IN-TRUCK ?auto_19780 ?auto_19783 ) ( TRUCK-AT ?auto_19783 ?auto_19781 ) ( IN-CITY ?auto_19781 ?auto_19782 ) ( IN-CITY ?auto_19777 ?auto_19782 ) ( not ( = ?auto_19777 ?auto_19781 ) ) ( OBJ-AT ?auto_19778 ?auto_19777 ) ( OBJ-AT ?auto_19779 ?auto_19777 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19778 ?auto_19780 ?auto_19777 )
      ( DELIVER-3PKG-VERIFY ?auto_19778 ?auto_19779 ?auto_19780 ?auto_19777 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19792 - OBJ
      ?auto_19793 - OBJ
      ?auto_19794 - OBJ
      ?auto_19791 - LOCATION
    )
    :vars
    (
      ?auto_19797 - TRUCK
      ?auto_19795 - LOCATION
      ?auto_19796 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_19793 ?auto_19792 ) ) ( not ( = ?auto_19794 ?auto_19792 ) ) ( not ( = ?auto_19794 ?auto_19793 ) ) ( IN-TRUCK ?auto_19793 ?auto_19797 ) ( TRUCK-AT ?auto_19797 ?auto_19795 ) ( IN-CITY ?auto_19795 ?auto_19796 ) ( IN-CITY ?auto_19791 ?auto_19796 ) ( not ( = ?auto_19791 ?auto_19795 ) ) ( OBJ-AT ?auto_19792 ?auto_19791 ) ( OBJ-AT ?auto_19794 ?auto_19791 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19792 ?auto_19793 ?auto_19791 )
      ( DELIVER-3PKG-VERIFY ?auto_19792 ?auto_19793 ?auto_19794 ?auto_19791 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19806 - OBJ
      ?auto_19807 - OBJ
      ?auto_19808 - OBJ
      ?auto_19805 - LOCATION
    )
    :vars
    (
      ?auto_19811 - TRUCK
      ?auto_19809 - LOCATION
      ?auto_19810 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_19807 ?auto_19806 ) ) ( not ( = ?auto_19808 ?auto_19806 ) ) ( not ( = ?auto_19808 ?auto_19807 ) ) ( IN-TRUCK ?auto_19808 ?auto_19811 ) ( TRUCK-AT ?auto_19811 ?auto_19809 ) ( IN-CITY ?auto_19809 ?auto_19810 ) ( IN-CITY ?auto_19805 ?auto_19810 ) ( not ( = ?auto_19805 ?auto_19809 ) ) ( OBJ-AT ?auto_19807 ?auto_19805 ) ( OBJ-AT ?auto_19806 ?auto_19805 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19807 ?auto_19808 ?auto_19805 )
      ( DELIVER-3PKG-VERIFY ?auto_19806 ?auto_19807 ?auto_19808 ?auto_19805 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19821 - OBJ
      ?auto_19822 - OBJ
      ?auto_19823 - OBJ
      ?auto_19820 - LOCATION
    )
    :vars
    (
      ?auto_19826 - TRUCK
      ?auto_19824 - LOCATION
      ?auto_19825 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_19822 ?auto_19821 ) ) ( not ( = ?auto_19823 ?auto_19821 ) ) ( not ( = ?auto_19823 ?auto_19822 ) ) ( IN-TRUCK ?auto_19822 ?auto_19826 ) ( TRUCK-AT ?auto_19826 ?auto_19824 ) ( IN-CITY ?auto_19824 ?auto_19825 ) ( IN-CITY ?auto_19820 ?auto_19825 ) ( not ( = ?auto_19820 ?auto_19824 ) ) ( OBJ-AT ?auto_19823 ?auto_19820 ) ( OBJ-AT ?auto_19821 ?auto_19820 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19823 ?auto_19822 ?auto_19820 )
      ( DELIVER-3PKG-VERIFY ?auto_19821 ?auto_19822 ?auto_19823 ?auto_19820 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19851 - OBJ
      ?auto_19852 - OBJ
      ?auto_19853 - OBJ
      ?auto_19850 - LOCATION
    )
    :vars
    (
      ?auto_19856 - TRUCK
      ?auto_19854 - LOCATION
      ?auto_19855 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_19852 ?auto_19851 ) ) ( not ( = ?auto_19853 ?auto_19851 ) ) ( not ( = ?auto_19853 ?auto_19852 ) ) ( IN-TRUCK ?auto_19851 ?auto_19856 ) ( TRUCK-AT ?auto_19856 ?auto_19854 ) ( IN-CITY ?auto_19854 ?auto_19855 ) ( IN-CITY ?auto_19850 ?auto_19855 ) ( not ( = ?auto_19850 ?auto_19854 ) ) ( OBJ-AT ?auto_19852 ?auto_19850 ) ( OBJ-AT ?auto_19853 ?auto_19850 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19852 ?auto_19851 ?auto_19850 )
      ( DELIVER-3PKG-VERIFY ?auto_19851 ?auto_19852 ?auto_19853 ?auto_19850 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19865 - OBJ
      ?auto_19866 - OBJ
      ?auto_19867 - OBJ
      ?auto_19864 - LOCATION
    )
    :vars
    (
      ?auto_19870 - TRUCK
      ?auto_19868 - LOCATION
      ?auto_19869 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_19866 ?auto_19865 ) ) ( not ( = ?auto_19867 ?auto_19865 ) ) ( not ( = ?auto_19867 ?auto_19866 ) ) ( IN-TRUCK ?auto_19865 ?auto_19870 ) ( TRUCK-AT ?auto_19870 ?auto_19868 ) ( IN-CITY ?auto_19868 ?auto_19869 ) ( IN-CITY ?auto_19864 ?auto_19869 ) ( not ( = ?auto_19864 ?auto_19868 ) ) ( OBJ-AT ?auto_19867 ?auto_19864 ) ( OBJ-AT ?auto_19866 ?auto_19864 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19867 ?auto_19865 ?auto_19864 )
      ( DELIVER-3PKG-VERIFY ?auto_19865 ?auto_19866 ?auto_19867 ?auto_19864 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_20446 - OBJ
      ?auto_20445 - LOCATION
    )
    :vars
    (
      ?auto_20450 - OBJ
      ?auto_20449 - TRUCK
      ?auto_20447 - LOCATION
      ?auto_20448 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_20446 ?auto_20450 ) ) ( TRUCK-AT ?auto_20449 ?auto_20447 ) ( IN-CITY ?auto_20447 ?auto_20448 ) ( IN-CITY ?auto_20445 ?auto_20448 ) ( not ( = ?auto_20445 ?auto_20447 ) ) ( OBJ-AT ?auto_20450 ?auto_20445 ) ( OBJ-AT ?auto_20446 ?auto_20447 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_20446 ?auto_20449 ?auto_20447 )
      ( DELIVER-2PKG ?auto_20450 ?auto_20446 ?auto_20445 )
      ( DELIVER-1PKG-VERIFY ?auto_20446 ?auto_20445 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_20452 - OBJ
      ?auto_20453 - OBJ
      ?auto_20451 - LOCATION
    )
    :vars
    (
      ?auto_20455 - TRUCK
      ?auto_20456 - LOCATION
      ?auto_20454 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_20453 ?auto_20452 ) ) ( TRUCK-AT ?auto_20455 ?auto_20456 ) ( IN-CITY ?auto_20456 ?auto_20454 ) ( IN-CITY ?auto_20451 ?auto_20454 ) ( not ( = ?auto_20451 ?auto_20456 ) ) ( OBJ-AT ?auto_20452 ?auto_20451 ) ( OBJ-AT ?auto_20453 ?auto_20456 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_20453 ?auto_20451 )
      ( DELIVER-2PKG-VERIFY ?auto_20452 ?auto_20453 ?auto_20451 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_20458 - OBJ
      ?auto_20459 - OBJ
      ?auto_20457 - LOCATION
    )
    :vars
    (
      ?auto_20463 - OBJ
      ?auto_20462 - TRUCK
      ?auto_20461 - LOCATION
      ?auto_20460 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_20459 ?auto_20458 ) ) ( not ( = ?auto_20459 ?auto_20463 ) ) ( TRUCK-AT ?auto_20462 ?auto_20461 ) ( IN-CITY ?auto_20461 ?auto_20460 ) ( IN-CITY ?auto_20457 ?auto_20460 ) ( not ( = ?auto_20457 ?auto_20461 ) ) ( OBJ-AT ?auto_20463 ?auto_20457 ) ( OBJ-AT ?auto_20459 ?auto_20461 ) ( OBJ-AT ?auto_20458 ?auto_20457 ) ( not ( = ?auto_20458 ?auto_20463 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20463 ?auto_20459 ?auto_20457 )
      ( DELIVER-2PKG-VERIFY ?auto_20458 ?auto_20459 ?auto_20457 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_20465 - OBJ
      ?auto_20466 - OBJ
      ?auto_20464 - LOCATION
    )
    :vars
    (
      ?auto_20469 - TRUCK
      ?auto_20468 - LOCATION
      ?auto_20467 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_20466 ?auto_20465 ) ) ( TRUCK-AT ?auto_20469 ?auto_20468 ) ( IN-CITY ?auto_20468 ?auto_20467 ) ( IN-CITY ?auto_20464 ?auto_20467 ) ( not ( = ?auto_20464 ?auto_20468 ) ) ( OBJ-AT ?auto_20466 ?auto_20464 ) ( OBJ-AT ?auto_20465 ?auto_20468 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20466 ?auto_20465 ?auto_20464 )
      ( DELIVER-2PKG-VERIFY ?auto_20465 ?auto_20466 ?auto_20464 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_20471 - OBJ
      ?auto_20472 - OBJ
      ?auto_20470 - LOCATION
    )
    :vars
    (
      ?auto_20476 - OBJ
      ?auto_20475 - TRUCK
      ?auto_20474 - LOCATION
      ?auto_20473 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_20472 ?auto_20471 ) ) ( not ( = ?auto_20471 ?auto_20476 ) ) ( TRUCK-AT ?auto_20475 ?auto_20474 ) ( IN-CITY ?auto_20474 ?auto_20473 ) ( IN-CITY ?auto_20470 ?auto_20473 ) ( not ( = ?auto_20470 ?auto_20474 ) ) ( OBJ-AT ?auto_20476 ?auto_20470 ) ( OBJ-AT ?auto_20471 ?auto_20474 ) ( OBJ-AT ?auto_20472 ?auto_20470 ) ( not ( = ?auto_20472 ?auto_20476 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20476 ?auto_20471 ?auto_20470 )
      ( DELIVER-2PKG-VERIFY ?auto_20471 ?auto_20472 ?auto_20470 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_20492 - OBJ
      ?auto_20493 - OBJ
      ?auto_20494 - OBJ
      ?auto_20491 - LOCATION
    )
    :vars
    (
      ?auto_20497 - TRUCK
      ?auto_20496 - LOCATION
      ?auto_20495 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_20493 ?auto_20492 ) ) ( not ( = ?auto_20494 ?auto_20492 ) ) ( not ( = ?auto_20494 ?auto_20493 ) ) ( TRUCK-AT ?auto_20497 ?auto_20496 ) ( IN-CITY ?auto_20496 ?auto_20495 ) ( IN-CITY ?auto_20491 ?auto_20495 ) ( not ( = ?auto_20491 ?auto_20496 ) ) ( OBJ-AT ?auto_20492 ?auto_20491 ) ( OBJ-AT ?auto_20494 ?auto_20496 ) ( OBJ-AT ?auto_20493 ?auto_20491 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20492 ?auto_20494 ?auto_20491 )
      ( DELIVER-3PKG-VERIFY ?auto_20492 ?auto_20493 ?auto_20494 ?auto_20491 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_20506 - OBJ
      ?auto_20507 - OBJ
      ?auto_20508 - OBJ
      ?auto_20505 - LOCATION
    )
    :vars
    (
      ?auto_20511 - TRUCK
      ?auto_20510 - LOCATION
      ?auto_20509 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_20507 ?auto_20506 ) ) ( not ( = ?auto_20508 ?auto_20506 ) ) ( not ( = ?auto_20508 ?auto_20507 ) ) ( TRUCK-AT ?auto_20511 ?auto_20510 ) ( IN-CITY ?auto_20510 ?auto_20509 ) ( IN-CITY ?auto_20505 ?auto_20509 ) ( not ( = ?auto_20505 ?auto_20510 ) ) ( OBJ-AT ?auto_20506 ?auto_20505 ) ( OBJ-AT ?auto_20507 ?auto_20510 ) ( OBJ-AT ?auto_20508 ?auto_20505 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20506 ?auto_20507 ?auto_20505 )
      ( DELIVER-3PKG-VERIFY ?auto_20506 ?auto_20507 ?auto_20508 ?auto_20505 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_20520 - OBJ
      ?auto_20521 - OBJ
      ?auto_20522 - OBJ
      ?auto_20519 - LOCATION
    )
    :vars
    (
      ?auto_20525 - TRUCK
      ?auto_20524 - LOCATION
      ?auto_20523 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_20521 ?auto_20520 ) ) ( not ( = ?auto_20522 ?auto_20520 ) ) ( not ( = ?auto_20522 ?auto_20521 ) ) ( TRUCK-AT ?auto_20525 ?auto_20524 ) ( IN-CITY ?auto_20524 ?auto_20523 ) ( IN-CITY ?auto_20519 ?auto_20523 ) ( not ( = ?auto_20519 ?auto_20524 ) ) ( OBJ-AT ?auto_20521 ?auto_20519 ) ( OBJ-AT ?auto_20522 ?auto_20524 ) ( OBJ-AT ?auto_20520 ?auto_20519 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20521 ?auto_20522 ?auto_20519 )
      ( DELIVER-3PKG-VERIFY ?auto_20520 ?auto_20521 ?auto_20522 ?auto_20519 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_20535 - OBJ
      ?auto_20536 - OBJ
      ?auto_20537 - OBJ
      ?auto_20534 - LOCATION
    )
    :vars
    (
      ?auto_20540 - TRUCK
      ?auto_20539 - LOCATION
      ?auto_20538 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_20536 ?auto_20535 ) ) ( not ( = ?auto_20537 ?auto_20535 ) ) ( not ( = ?auto_20537 ?auto_20536 ) ) ( TRUCK-AT ?auto_20540 ?auto_20539 ) ( IN-CITY ?auto_20539 ?auto_20538 ) ( IN-CITY ?auto_20534 ?auto_20538 ) ( not ( = ?auto_20534 ?auto_20539 ) ) ( OBJ-AT ?auto_20537 ?auto_20534 ) ( OBJ-AT ?auto_20536 ?auto_20539 ) ( OBJ-AT ?auto_20535 ?auto_20534 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20537 ?auto_20536 ?auto_20534 )
      ( DELIVER-3PKG-VERIFY ?auto_20535 ?auto_20536 ?auto_20537 ?auto_20534 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_20565 - OBJ
      ?auto_20566 - OBJ
      ?auto_20567 - OBJ
      ?auto_20564 - LOCATION
    )
    :vars
    (
      ?auto_20570 - TRUCK
      ?auto_20569 - LOCATION
      ?auto_20568 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_20566 ?auto_20565 ) ) ( not ( = ?auto_20567 ?auto_20565 ) ) ( not ( = ?auto_20567 ?auto_20566 ) ) ( TRUCK-AT ?auto_20570 ?auto_20569 ) ( IN-CITY ?auto_20569 ?auto_20568 ) ( IN-CITY ?auto_20564 ?auto_20568 ) ( not ( = ?auto_20564 ?auto_20569 ) ) ( OBJ-AT ?auto_20566 ?auto_20564 ) ( OBJ-AT ?auto_20565 ?auto_20569 ) ( OBJ-AT ?auto_20567 ?auto_20564 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20566 ?auto_20565 ?auto_20564 )
      ( DELIVER-3PKG-VERIFY ?auto_20565 ?auto_20566 ?auto_20567 ?auto_20564 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_20579 - OBJ
      ?auto_20580 - OBJ
      ?auto_20581 - OBJ
      ?auto_20578 - LOCATION
    )
    :vars
    (
      ?auto_20584 - TRUCK
      ?auto_20583 - LOCATION
      ?auto_20582 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_20580 ?auto_20579 ) ) ( not ( = ?auto_20581 ?auto_20579 ) ) ( not ( = ?auto_20581 ?auto_20580 ) ) ( TRUCK-AT ?auto_20584 ?auto_20583 ) ( IN-CITY ?auto_20583 ?auto_20582 ) ( IN-CITY ?auto_20578 ?auto_20582 ) ( not ( = ?auto_20578 ?auto_20583 ) ) ( OBJ-AT ?auto_20581 ?auto_20578 ) ( OBJ-AT ?auto_20579 ?auto_20583 ) ( OBJ-AT ?auto_20580 ?auto_20578 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20581 ?auto_20579 ?auto_20578 )
      ( DELIVER-3PKG-VERIFY ?auto_20579 ?auto_20580 ?auto_20581 ?auto_20578 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_21160 - OBJ
      ?auto_21159 - LOCATION
    )
    :vars
    (
      ?auto_21164 - OBJ
      ?auto_21162 - LOCATION
      ?auto_21161 - CITY
      ?auto_21163 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_21160 ?auto_21164 ) ) ( IN-CITY ?auto_21162 ?auto_21161 ) ( IN-CITY ?auto_21159 ?auto_21161 ) ( not ( = ?auto_21159 ?auto_21162 ) ) ( OBJ-AT ?auto_21164 ?auto_21159 ) ( OBJ-AT ?auto_21160 ?auto_21162 ) ( TRUCK-AT ?auto_21163 ?auto_21159 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_21163 ?auto_21159 ?auto_21162 ?auto_21161 )
      ( DELIVER-2PKG ?auto_21164 ?auto_21160 ?auto_21159 )
      ( DELIVER-1PKG-VERIFY ?auto_21160 ?auto_21159 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_21166 - OBJ
      ?auto_21167 - OBJ
      ?auto_21165 - LOCATION
    )
    :vars
    (
      ?auto_21168 - LOCATION
      ?auto_21170 - CITY
      ?auto_21169 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_21167 ?auto_21166 ) ) ( IN-CITY ?auto_21168 ?auto_21170 ) ( IN-CITY ?auto_21165 ?auto_21170 ) ( not ( = ?auto_21165 ?auto_21168 ) ) ( OBJ-AT ?auto_21166 ?auto_21165 ) ( OBJ-AT ?auto_21167 ?auto_21168 ) ( TRUCK-AT ?auto_21169 ?auto_21165 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_21167 ?auto_21165 )
      ( DELIVER-2PKG-VERIFY ?auto_21166 ?auto_21167 ?auto_21165 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_21172 - OBJ
      ?auto_21173 - OBJ
      ?auto_21171 - LOCATION
    )
    :vars
    (
      ?auto_21177 - OBJ
      ?auto_21175 - LOCATION
      ?auto_21176 - CITY
      ?auto_21174 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_21173 ?auto_21172 ) ) ( not ( = ?auto_21173 ?auto_21177 ) ) ( IN-CITY ?auto_21175 ?auto_21176 ) ( IN-CITY ?auto_21171 ?auto_21176 ) ( not ( = ?auto_21171 ?auto_21175 ) ) ( OBJ-AT ?auto_21177 ?auto_21171 ) ( OBJ-AT ?auto_21173 ?auto_21175 ) ( TRUCK-AT ?auto_21174 ?auto_21171 ) ( OBJ-AT ?auto_21172 ?auto_21171 ) ( not ( = ?auto_21172 ?auto_21177 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21177 ?auto_21173 ?auto_21171 )
      ( DELIVER-2PKG-VERIFY ?auto_21172 ?auto_21173 ?auto_21171 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_21179 - OBJ
      ?auto_21180 - OBJ
      ?auto_21178 - LOCATION
    )
    :vars
    (
      ?auto_21182 - LOCATION
      ?auto_21183 - CITY
      ?auto_21181 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_21180 ?auto_21179 ) ) ( IN-CITY ?auto_21182 ?auto_21183 ) ( IN-CITY ?auto_21178 ?auto_21183 ) ( not ( = ?auto_21178 ?auto_21182 ) ) ( OBJ-AT ?auto_21180 ?auto_21178 ) ( OBJ-AT ?auto_21179 ?auto_21182 ) ( TRUCK-AT ?auto_21181 ?auto_21178 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21180 ?auto_21179 ?auto_21178 )
      ( DELIVER-2PKG-VERIFY ?auto_21179 ?auto_21180 ?auto_21178 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_21185 - OBJ
      ?auto_21186 - OBJ
      ?auto_21184 - LOCATION
    )
    :vars
    (
      ?auto_21190 - OBJ
      ?auto_21188 - LOCATION
      ?auto_21189 - CITY
      ?auto_21187 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_21186 ?auto_21185 ) ) ( not ( = ?auto_21185 ?auto_21190 ) ) ( IN-CITY ?auto_21188 ?auto_21189 ) ( IN-CITY ?auto_21184 ?auto_21189 ) ( not ( = ?auto_21184 ?auto_21188 ) ) ( OBJ-AT ?auto_21190 ?auto_21184 ) ( OBJ-AT ?auto_21185 ?auto_21188 ) ( TRUCK-AT ?auto_21187 ?auto_21184 ) ( OBJ-AT ?auto_21186 ?auto_21184 ) ( not ( = ?auto_21186 ?auto_21190 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21190 ?auto_21185 ?auto_21184 )
      ( DELIVER-2PKG-VERIFY ?auto_21185 ?auto_21186 ?auto_21184 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_21206 - OBJ
      ?auto_21207 - OBJ
      ?auto_21208 - OBJ
      ?auto_21205 - LOCATION
    )
    :vars
    (
      ?auto_21210 - LOCATION
      ?auto_21211 - CITY
      ?auto_21209 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_21207 ?auto_21206 ) ) ( not ( = ?auto_21208 ?auto_21206 ) ) ( not ( = ?auto_21208 ?auto_21207 ) ) ( IN-CITY ?auto_21210 ?auto_21211 ) ( IN-CITY ?auto_21205 ?auto_21211 ) ( not ( = ?auto_21205 ?auto_21210 ) ) ( OBJ-AT ?auto_21206 ?auto_21205 ) ( OBJ-AT ?auto_21208 ?auto_21210 ) ( TRUCK-AT ?auto_21209 ?auto_21205 ) ( OBJ-AT ?auto_21207 ?auto_21205 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21206 ?auto_21208 ?auto_21205 )
      ( DELIVER-3PKG-VERIFY ?auto_21206 ?auto_21207 ?auto_21208 ?auto_21205 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_21220 - OBJ
      ?auto_21221 - OBJ
      ?auto_21222 - OBJ
      ?auto_21219 - LOCATION
    )
    :vars
    (
      ?auto_21224 - LOCATION
      ?auto_21225 - CITY
      ?auto_21223 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_21221 ?auto_21220 ) ) ( not ( = ?auto_21222 ?auto_21220 ) ) ( not ( = ?auto_21222 ?auto_21221 ) ) ( IN-CITY ?auto_21224 ?auto_21225 ) ( IN-CITY ?auto_21219 ?auto_21225 ) ( not ( = ?auto_21219 ?auto_21224 ) ) ( OBJ-AT ?auto_21220 ?auto_21219 ) ( OBJ-AT ?auto_21221 ?auto_21224 ) ( TRUCK-AT ?auto_21223 ?auto_21219 ) ( OBJ-AT ?auto_21222 ?auto_21219 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21220 ?auto_21221 ?auto_21219 )
      ( DELIVER-3PKG-VERIFY ?auto_21220 ?auto_21221 ?auto_21222 ?auto_21219 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_21234 - OBJ
      ?auto_21235 - OBJ
      ?auto_21236 - OBJ
      ?auto_21233 - LOCATION
    )
    :vars
    (
      ?auto_21238 - LOCATION
      ?auto_21239 - CITY
      ?auto_21237 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_21235 ?auto_21234 ) ) ( not ( = ?auto_21236 ?auto_21234 ) ) ( not ( = ?auto_21236 ?auto_21235 ) ) ( IN-CITY ?auto_21238 ?auto_21239 ) ( IN-CITY ?auto_21233 ?auto_21239 ) ( not ( = ?auto_21233 ?auto_21238 ) ) ( OBJ-AT ?auto_21235 ?auto_21233 ) ( OBJ-AT ?auto_21236 ?auto_21238 ) ( TRUCK-AT ?auto_21237 ?auto_21233 ) ( OBJ-AT ?auto_21234 ?auto_21233 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21235 ?auto_21236 ?auto_21233 )
      ( DELIVER-3PKG-VERIFY ?auto_21234 ?auto_21235 ?auto_21236 ?auto_21233 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_21249 - OBJ
      ?auto_21250 - OBJ
      ?auto_21251 - OBJ
      ?auto_21248 - LOCATION
    )
    :vars
    (
      ?auto_21253 - LOCATION
      ?auto_21254 - CITY
      ?auto_21252 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_21250 ?auto_21249 ) ) ( not ( = ?auto_21251 ?auto_21249 ) ) ( not ( = ?auto_21251 ?auto_21250 ) ) ( IN-CITY ?auto_21253 ?auto_21254 ) ( IN-CITY ?auto_21248 ?auto_21254 ) ( not ( = ?auto_21248 ?auto_21253 ) ) ( OBJ-AT ?auto_21251 ?auto_21248 ) ( OBJ-AT ?auto_21250 ?auto_21253 ) ( TRUCK-AT ?auto_21252 ?auto_21248 ) ( OBJ-AT ?auto_21249 ?auto_21248 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21251 ?auto_21250 ?auto_21248 )
      ( DELIVER-3PKG-VERIFY ?auto_21249 ?auto_21250 ?auto_21251 ?auto_21248 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_21279 - OBJ
      ?auto_21280 - OBJ
      ?auto_21281 - OBJ
      ?auto_21278 - LOCATION
    )
    :vars
    (
      ?auto_21283 - LOCATION
      ?auto_21284 - CITY
      ?auto_21282 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_21280 ?auto_21279 ) ) ( not ( = ?auto_21281 ?auto_21279 ) ) ( not ( = ?auto_21281 ?auto_21280 ) ) ( IN-CITY ?auto_21283 ?auto_21284 ) ( IN-CITY ?auto_21278 ?auto_21284 ) ( not ( = ?auto_21278 ?auto_21283 ) ) ( OBJ-AT ?auto_21280 ?auto_21278 ) ( OBJ-AT ?auto_21279 ?auto_21283 ) ( TRUCK-AT ?auto_21282 ?auto_21278 ) ( OBJ-AT ?auto_21281 ?auto_21278 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21280 ?auto_21279 ?auto_21278 )
      ( DELIVER-3PKG-VERIFY ?auto_21279 ?auto_21280 ?auto_21281 ?auto_21278 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_21293 - OBJ
      ?auto_21294 - OBJ
      ?auto_21295 - OBJ
      ?auto_21292 - LOCATION
    )
    :vars
    (
      ?auto_21297 - LOCATION
      ?auto_21298 - CITY
      ?auto_21296 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_21294 ?auto_21293 ) ) ( not ( = ?auto_21295 ?auto_21293 ) ) ( not ( = ?auto_21295 ?auto_21294 ) ) ( IN-CITY ?auto_21297 ?auto_21298 ) ( IN-CITY ?auto_21292 ?auto_21298 ) ( not ( = ?auto_21292 ?auto_21297 ) ) ( OBJ-AT ?auto_21295 ?auto_21292 ) ( OBJ-AT ?auto_21293 ?auto_21297 ) ( TRUCK-AT ?auto_21296 ?auto_21292 ) ( OBJ-AT ?auto_21294 ?auto_21292 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21295 ?auto_21293 ?auto_21292 )
      ( DELIVER-3PKG-VERIFY ?auto_21293 ?auto_21294 ?auto_21295 ?auto_21292 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_21874 - OBJ
      ?auto_21873 - LOCATION
    )
    :vars
    (
      ?auto_21878 - OBJ
      ?auto_21876 - LOCATION
      ?auto_21877 - CITY
      ?auto_21875 - TRUCK
      ?auto_21879 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_21874 ?auto_21878 ) ) ( IN-CITY ?auto_21876 ?auto_21877 ) ( IN-CITY ?auto_21873 ?auto_21877 ) ( not ( = ?auto_21873 ?auto_21876 ) ) ( OBJ-AT ?auto_21878 ?auto_21873 ) ( OBJ-AT ?auto_21874 ?auto_21876 ) ( TRUCK-AT ?auto_21875 ?auto_21873 ) ( not ( = ?auto_21879 ?auto_21878 ) ) ( IN-TRUCK ?auto_21879 ?auto_21875 ) ( not ( = ?auto_21874 ?auto_21879 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21878 ?auto_21879 ?auto_21873 )
      ( DELIVER-2PKG ?auto_21878 ?auto_21874 ?auto_21873 )
      ( DELIVER-1PKG-VERIFY ?auto_21874 ?auto_21873 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_21881 - OBJ
      ?auto_21882 - OBJ
      ?auto_21880 - LOCATION
    )
    :vars
    (
      ?auto_21884 - LOCATION
      ?auto_21883 - CITY
      ?auto_21885 - TRUCK
      ?auto_21886 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_21882 ?auto_21881 ) ) ( IN-CITY ?auto_21884 ?auto_21883 ) ( IN-CITY ?auto_21880 ?auto_21883 ) ( not ( = ?auto_21880 ?auto_21884 ) ) ( OBJ-AT ?auto_21881 ?auto_21880 ) ( OBJ-AT ?auto_21882 ?auto_21884 ) ( TRUCK-AT ?auto_21885 ?auto_21880 ) ( not ( = ?auto_21886 ?auto_21881 ) ) ( IN-TRUCK ?auto_21886 ?auto_21885 ) ( not ( = ?auto_21882 ?auto_21886 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_21882 ?auto_21880 )
      ( DELIVER-2PKG-VERIFY ?auto_21881 ?auto_21882 ?auto_21880 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_21888 - OBJ
      ?auto_21889 - OBJ
      ?auto_21887 - LOCATION
    )
    :vars
    (
      ?auto_21893 - OBJ
      ?auto_21891 - LOCATION
      ?auto_21892 - CITY
      ?auto_21890 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_21889 ?auto_21888 ) ) ( not ( = ?auto_21889 ?auto_21893 ) ) ( IN-CITY ?auto_21891 ?auto_21892 ) ( IN-CITY ?auto_21887 ?auto_21892 ) ( not ( = ?auto_21887 ?auto_21891 ) ) ( OBJ-AT ?auto_21893 ?auto_21887 ) ( OBJ-AT ?auto_21889 ?auto_21891 ) ( TRUCK-AT ?auto_21890 ?auto_21887 ) ( not ( = ?auto_21888 ?auto_21893 ) ) ( IN-TRUCK ?auto_21888 ?auto_21890 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21893 ?auto_21889 ?auto_21887 )
      ( DELIVER-2PKG-VERIFY ?auto_21888 ?auto_21889 ?auto_21887 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_21895 - OBJ
      ?auto_21896 - OBJ
      ?auto_21894 - LOCATION
    )
    :vars
    (
      ?auto_21898 - LOCATION
      ?auto_21900 - CITY
      ?auto_21897 - TRUCK
      ?auto_21899 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_21896 ?auto_21895 ) ) ( IN-CITY ?auto_21898 ?auto_21900 ) ( IN-CITY ?auto_21894 ?auto_21900 ) ( not ( = ?auto_21894 ?auto_21898 ) ) ( OBJ-AT ?auto_21896 ?auto_21894 ) ( OBJ-AT ?auto_21895 ?auto_21898 ) ( TRUCK-AT ?auto_21897 ?auto_21894 ) ( not ( = ?auto_21899 ?auto_21896 ) ) ( IN-TRUCK ?auto_21899 ?auto_21897 ) ( not ( = ?auto_21895 ?auto_21899 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21896 ?auto_21895 ?auto_21894 )
      ( DELIVER-2PKG-VERIFY ?auto_21895 ?auto_21896 ?auto_21894 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_21902 - OBJ
      ?auto_21903 - OBJ
      ?auto_21901 - LOCATION
    )
    :vars
    (
      ?auto_21907 - OBJ
      ?auto_21905 - LOCATION
      ?auto_21906 - CITY
      ?auto_21904 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_21903 ?auto_21902 ) ) ( not ( = ?auto_21902 ?auto_21907 ) ) ( IN-CITY ?auto_21905 ?auto_21906 ) ( IN-CITY ?auto_21901 ?auto_21906 ) ( not ( = ?auto_21901 ?auto_21905 ) ) ( OBJ-AT ?auto_21907 ?auto_21901 ) ( OBJ-AT ?auto_21902 ?auto_21905 ) ( TRUCK-AT ?auto_21904 ?auto_21901 ) ( not ( = ?auto_21903 ?auto_21907 ) ) ( IN-TRUCK ?auto_21903 ?auto_21904 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21907 ?auto_21902 ?auto_21901 )
      ( DELIVER-2PKG-VERIFY ?auto_21902 ?auto_21903 ?auto_21901 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_21925 - OBJ
      ?auto_21926 - OBJ
      ?auto_21927 - OBJ
      ?auto_21924 - LOCATION
    )
    :vars
    (
      ?auto_21929 - LOCATION
      ?auto_21930 - CITY
      ?auto_21928 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_21926 ?auto_21925 ) ) ( not ( = ?auto_21927 ?auto_21925 ) ) ( not ( = ?auto_21927 ?auto_21926 ) ) ( IN-CITY ?auto_21929 ?auto_21930 ) ( IN-CITY ?auto_21924 ?auto_21930 ) ( not ( = ?auto_21924 ?auto_21929 ) ) ( OBJ-AT ?auto_21925 ?auto_21924 ) ( OBJ-AT ?auto_21927 ?auto_21929 ) ( TRUCK-AT ?auto_21928 ?auto_21924 ) ( IN-TRUCK ?auto_21926 ?auto_21928 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21925 ?auto_21927 ?auto_21924 )
      ( DELIVER-3PKG-VERIFY ?auto_21925 ?auto_21926 ?auto_21927 ?auto_21924 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_21940 - OBJ
      ?auto_21941 - OBJ
      ?auto_21942 - OBJ
      ?auto_21939 - LOCATION
    )
    :vars
    (
      ?auto_21944 - LOCATION
      ?auto_21945 - CITY
      ?auto_21943 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_21941 ?auto_21940 ) ) ( not ( = ?auto_21942 ?auto_21940 ) ) ( not ( = ?auto_21942 ?auto_21941 ) ) ( IN-CITY ?auto_21944 ?auto_21945 ) ( IN-CITY ?auto_21939 ?auto_21945 ) ( not ( = ?auto_21939 ?auto_21944 ) ) ( OBJ-AT ?auto_21940 ?auto_21939 ) ( OBJ-AT ?auto_21941 ?auto_21944 ) ( TRUCK-AT ?auto_21943 ?auto_21939 ) ( IN-TRUCK ?auto_21942 ?auto_21943 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21940 ?auto_21941 ?auto_21939 )
      ( DELIVER-3PKG-VERIFY ?auto_21940 ?auto_21941 ?auto_21942 ?auto_21939 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_21955 - OBJ
      ?auto_21956 - OBJ
      ?auto_21957 - OBJ
      ?auto_21954 - LOCATION
    )
    :vars
    (
      ?auto_21959 - LOCATION
      ?auto_21960 - CITY
      ?auto_21958 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_21956 ?auto_21955 ) ) ( not ( = ?auto_21957 ?auto_21955 ) ) ( not ( = ?auto_21957 ?auto_21956 ) ) ( IN-CITY ?auto_21959 ?auto_21960 ) ( IN-CITY ?auto_21954 ?auto_21960 ) ( not ( = ?auto_21954 ?auto_21959 ) ) ( OBJ-AT ?auto_21956 ?auto_21954 ) ( OBJ-AT ?auto_21957 ?auto_21959 ) ( TRUCK-AT ?auto_21958 ?auto_21954 ) ( IN-TRUCK ?auto_21955 ?auto_21958 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21956 ?auto_21957 ?auto_21954 )
      ( DELIVER-3PKG-VERIFY ?auto_21955 ?auto_21956 ?auto_21957 ?auto_21954 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_21970 - OBJ
      ?auto_21971 - OBJ
      ?auto_21972 - OBJ
      ?auto_21969 - LOCATION
    )
    :vars
    (
      ?auto_21974 - LOCATION
      ?auto_21975 - CITY
      ?auto_21973 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_21971 ?auto_21970 ) ) ( not ( = ?auto_21972 ?auto_21970 ) ) ( not ( = ?auto_21972 ?auto_21971 ) ) ( IN-CITY ?auto_21974 ?auto_21975 ) ( IN-CITY ?auto_21969 ?auto_21975 ) ( not ( = ?auto_21969 ?auto_21974 ) ) ( OBJ-AT ?auto_21972 ?auto_21969 ) ( OBJ-AT ?auto_21971 ?auto_21974 ) ( TRUCK-AT ?auto_21973 ?auto_21969 ) ( IN-TRUCK ?auto_21970 ?auto_21973 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21972 ?auto_21971 ?auto_21969 )
      ( DELIVER-3PKG-VERIFY ?auto_21970 ?auto_21971 ?auto_21972 ?auto_21969 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_22001 - OBJ
      ?auto_22002 - OBJ
      ?auto_22003 - OBJ
      ?auto_22000 - LOCATION
    )
    :vars
    (
      ?auto_22005 - LOCATION
      ?auto_22006 - CITY
      ?auto_22004 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_22002 ?auto_22001 ) ) ( not ( = ?auto_22003 ?auto_22001 ) ) ( not ( = ?auto_22003 ?auto_22002 ) ) ( IN-CITY ?auto_22005 ?auto_22006 ) ( IN-CITY ?auto_22000 ?auto_22006 ) ( not ( = ?auto_22000 ?auto_22005 ) ) ( OBJ-AT ?auto_22002 ?auto_22000 ) ( OBJ-AT ?auto_22001 ?auto_22005 ) ( TRUCK-AT ?auto_22004 ?auto_22000 ) ( IN-TRUCK ?auto_22003 ?auto_22004 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_22002 ?auto_22001 ?auto_22000 )
      ( DELIVER-3PKG-VERIFY ?auto_22001 ?auto_22002 ?auto_22003 ?auto_22000 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_22016 - OBJ
      ?auto_22017 - OBJ
      ?auto_22018 - OBJ
      ?auto_22015 - LOCATION
    )
    :vars
    (
      ?auto_22020 - LOCATION
      ?auto_22021 - CITY
      ?auto_22019 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_22017 ?auto_22016 ) ) ( not ( = ?auto_22018 ?auto_22016 ) ) ( not ( = ?auto_22018 ?auto_22017 ) ) ( IN-CITY ?auto_22020 ?auto_22021 ) ( IN-CITY ?auto_22015 ?auto_22021 ) ( not ( = ?auto_22015 ?auto_22020 ) ) ( OBJ-AT ?auto_22018 ?auto_22015 ) ( OBJ-AT ?auto_22016 ?auto_22020 ) ( TRUCK-AT ?auto_22019 ?auto_22015 ) ( IN-TRUCK ?auto_22017 ?auto_22019 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_22018 ?auto_22016 ?auto_22015 )
      ( DELIVER-3PKG-VERIFY ?auto_22016 ?auto_22017 ?auto_22018 ?auto_22015 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_22614 - OBJ
      ?auto_22613 - LOCATION
    )
    :vars
    (
      ?auto_22619 - OBJ
      ?auto_22616 - LOCATION
      ?auto_22618 - CITY
      ?auto_22617 - OBJ
      ?auto_22615 - TRUCK
      ?auto_22620 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_22614 ?auto_22619 ) ) ( IN-CITY ?auto_22616 ?auto_22618 ) ( IN-CITY ?auto_22613 ?auto_22618 ) ( not ( = ?auto_22613 ?auto_22616 ) ) ( OBJ-AT ?auto_22619 ?auto_22613 ) ( OBJ-AT ?auto_22614 ?auto_22616 ) ( not ( = ?auto_22617 ?auto_22619 ) ) ( IN-TRUCK ?auto_22617 ?auto_22615 ) ( not ( = ?auto_22614 ?auto_22617 ) ) ( TRUCK-AT ?auto_22615 ?auto_22620 ) ( IN-CITY ?auto_22620 ?auto_22618 ) ( not ( = ?auto_22613 ?auto_22620 ) ) ( not ( = ?auto_22616 ?auto_22620 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_22615 ?auto_22620 ?auto_22613 ?auto_22618 )
      ( DELIVER-2PKG ?auto_22619 ?auto_22614 ?auto_22613 )
      ( DELIVER-1PKG-VERIFY ?auto_22614 ?auto_22613 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_22622 - OBJ
      ?auto_22623 - OBJ
      ?auto_22621 - LOCATION
    )
    :vars
    (
      ?auto_22624 - LOCATION
      ?auto_22625 - CITY
      ?auto_22626 - OBJ
      ?auto_22627 - TRUCK
      ?auto_22628 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_22623 ?auto_22622 ) ) ( IN-CITY ?auto_22624 ?auto_22625 ) ( IN-CITY ?auto_22621 ?auto_22625 ) ( not ( = ?auto_22621 ?auto_22624 ) ) ( OBJ-AT ?auto_22622 ?auto_22621 ) ( OBJ-AT ?auto_22623 ?auto_22624 ) ( not ( = ?auto_22626 ?auto_22622 ) ) ( IN-TRUCK ?auto_22626 ?auto_22627 ) ( not ( = ?auto_22623 ?auto_22626 ) ) ( TRUCK-AT ?auto_22627 ?auto_22628 ) ( IN-CITY ?auto_22628 ?auto_22625 ) ( not ( = ?auto_22621 ?auto_22628 ) ) ( not ( = ?auto_22624 ?auto_22628 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_22623 ?auto_22621 )
      ( DELIVER-2PKG-VERIFY ?auto_22622 ?auto_22623 ?auto_22621 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_22630 - OBJ
      ?auto_22631 - OBJ
      ?auto_22629 - LOCATION
    )
    :vars
    (
      ?auto_22636 - OBJ
      ?auto_22635 - LOCATION
      ?auto_22633 - CITY
      ?auto_22632 - TRUCK
      ?auto_22634 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_22631 ?auto_22630 ) ) ( not ( = ?auto_22631 ?auto_22636 ) ) ( IN-CITY ?auto_22635 ?auto_22633 ) ( IN-CITY ?auto_22629 ?auto_22633 ) ( not ( = ?auto_22629 ?auto_22635 ) ) ( OBJ-AT ?auto_22636 ?auto_22629 ) ( OBJ-AT ?auto_22631 ?auto_22635 ) ( not ( = ?auto_22630 ?auto_22636 ) ) ( IN-TRUCK ?auto_22630 ?auto_22632 ) ( TRUCK-AT ?auto_22632 ?auto_22634 ) ( IN-CITY ?auto_22634 ?auto_22633 ) ( not ( = ?auto_22629 ?auto_22634 ) ) ( not ( = ?auto_22635 ?auto_22634 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_22636 ?auto_22631 ?auto_22629 )
      ( DELIVER-2PKG-VERIFY ?auto_22630 ?auto_22631 ?auto_22629 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_22638 - OBJ
      ?auto_22639 - OBJ
      ?auto_22637 - LOCATION
    )
    :vars
    (
      ?auto_22644 - LOCATION
      ?auto_22642 - CITY
      ?auto_22640 - OBJ
      ?auto_22641 - TRUCK
      ?auto_22643 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_22639 ?auto_22638 ) ) ( IN-CITY ?auto_22644 ?auto_22642 ) ( IN-CITY ?auto_22637 ?auto_22642 ) ( not ( = ?auto_22637 ?auto_22644 ) ) ( OBJ-AT ?auto_22639 ?auto_22637 ) ( OBJ-AT ?auto_22638 ?auto_22644 ) ( not ( = ?auto_22640 ?auto_22639 ) ) ( IN-TRUCK ?auto_22640 ?auto_22641 ) ( not ( = ?auto_22638 ?auto_22640 ) ) ( TRUCK-AT ?auto_22641 ?auto_22643 ) ( IN-CITY ?auto_22643 ?auto_22642 ) ( not ( = ?auto_22637 ?auto_22643 ) ) ( not ( = ?auto_22644 ?auto_22643 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_22639 ?auto_22638 ?auto_22637 )
      ( DELIVER-2PKG-VERIFY ?auto_22638 ?auto_22639 ?auto_22637 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_22646 - OBJ
      ?auto_22647 - OBJ
      ?auto_22645 - LOCATION
    )
    :vars
    (
      ?auto_22652 - OBJ
      ?auto_22651 - LOCATION
      ?auto_22649 - CITY
      ?auto_22648 - TRUCK
      ?auto_22650 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_22647 ?auto_22646 ) ) ( not ( = ?auto_22646 ?auto_22652 ) ) ( IN-CITY ?auto_22651 ?auto_22649 ) ( IN-CITY ?auto_22645 ?auto_22649 ) ( not ( = ?auto_22645 ?auto_22651 ) ) ( OBJ-AT ?auto_22652 ?auto_22645 ) ( OBJ-AT ?auto_22646 ?auto_22651 ) ( not ( = ?auto_22647 ?auto_22652 ) ) ( IN-TRUCK ?auto_22647 ?auto_22648 ) ( TRUCK-AT ?auto_22648 ?auto_22650 ) ( IN-CITY ?auto_22650 ?auto_22649 ) ( not ( = ?auto_22645 ?auto_22650 ) ) ( not ( = ?auto_22651 ?auto_22650 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_22652 ?auto_22646 ?auto_22645 )
      ( DELIVER-2PKG-VERIFY ?auto_22646 ?auto_22647 ?auto_22645 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_22672 - OBJ
      ?auto_22673 - OBJ
      ?auto_22674 - OBJ
      ?auto_22671 - LOCATION
    )
    :vars
    (
      ?auto_22678 - LOCATION
      ?auto_22676 - CITY
      ?auto_22675 - TRUCK
      ?auto_22677 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_22673 ?auto_22672 ) ) ( not ( = ?auto_22674 ?auto_22672 ) ) ( not ( = ?auto_22674 ?auto_22673 ) ) ( IN-CITY ?auto_22678 ?auto_22676 ) ( IN-CITY ?auto_22671 ?auto_22676 ) ( not ( = ?auto_22671 ?auto_22678 ) ) ( OBJ-AT ?auto_22672 ?auto_22671 ) ( OBJ-AT ?auto_22674 ?auto_22678 ) ( IN-TRUCK ?auto_22673 ?auto_22675 ) ( TRUCK-AT ?auto_22675 ?auto_22677 ) ( IN-CITY ?auto_22677 ?auto_22676 ) ( not ( = ?auto_22671 ?auto_22677 ) ) ( not ( = ?auto_22678 ?auto_22677 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_22672 ?auto_22674 ?auto_22671 )
      ( DELIVER-3PKG-VERIFY ?auto_22672 ?auto_22673 ?auto_22674 ?auto_22671 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_22689 - OBJ
      ?auto_22690 - OBJ
      ?auto_22691 - OBJ
      ?auto_22688 - LOCATION
    )
    :vars
    (
      ?auto_22695 - LOCATION
      ?auto_22693 - CITY
      ?auto_22692 - TRUCK
      ?auto_22694 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_22690 ?auto_22689 ) ) ( not ( = ?auto_22691 ?auto_22689 ) ) ( not ( = ?auto_22691 ?auto_22690 ) ) ( IN-CITY ?auto_22695 ?auto_22693 ) ( IN-CITY ?auto_22688 ?auto_22693 ) ( not ( = ?auto_22688 ?auto_22695 ) ) ( OBJ-AT ?auto_22689 ?auto_22688 ) ( OBJ-AT ?auto_22690 ?auto_22695 ) ( IN-TRUCK ?auto_22691 ?auto_22692 ) ( TRUCK-AT ?auto_22692 ?auto_22694 ) ( IN-CITY ?auto_22694 ?auto_22693 ) ( not ( = ?auto_22688 ?auto_22694 ) ) ( not ( = ?auto_22695 ?auto_22694 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_22689 ?auto_22690 ?auto_22688 )
      ( DELIVER-3PKG-VERIFY ?auto_22689 ?auto_22690 ?auto_22691 ?auto_22688 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_22706 - OBJ
      ?auto_22707 - OBJ
      ?auto_22708 - OBJ
      ?auto_22705 - LOCATION
    )
    :vars
    (
      ?auto_22712 - LOCATION
      ?auto_22710 - CITY
      ?auto_22709 - TRUCK
      ?auto_22711 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_22707 ?auto_22706 ) ) ( not ( = ?auto_22708 ?auto_22706 ) ) ( not ( = ?auto_22708 ?auto_22707 ) ) ( IN-CITY ?auto_22712 ?auto_22710 ) ( IN-CITY ?auto_22705 ?auto_22710 ) ( not ( = ?auto_22705 ?auto_22712 ) ) ( OBJ-AT ?auto_22707 ?auto_22705 ) ( OBJ-AT ?auto_22708 ?auto_22712 ) ( IN-TRUCK ?auto_22706 ?auto_22709 ) ( TRUCK-AT ?auto_22709 ?auto_22711 ) ( IN-CITY ?auto_22711 ?auto_22710 ) ( not ( = ?auto_22705 ?auto_22711 ) ) ( not ( = ?auto_22712 ?auto_22711 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_22707 ?auto_22708 ?auto_22705 )
      ( DELIVER-3PKG-VERIFY ?auto_22706 ?auto_22707 ?auto_22708 ?auto_22705 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_22723 - OBJ
      ?auto_22724 - OBJ
      ?auto_22725 - OBJ
      ?auto_22722 - LOCATION
    )
    :vars
    (
      ?auto_22729 - LOCATION
      ?auto_22727 - CITY
      ?auto_22726 - TRUCK
      ?auto_22728 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_22724 ?auto_22723 ) ) ( not ( = ?auto_22725 ?auto_22723 ) ) ( not ( = ?auto_22725 ?auto_22724 ) ) ( IN-CITY ?auto_22729 ?auto_22727 ) ( IN-CITY ?auto_22722 ?auto_22727 ) ( not ( = ?auto_22722 ?auto_22729 ) ) ( OBJ-AT ?auto_22725 ?auto_22722 ) ( OBJ-AT ?auto_22724 ?auto_22729 ) ( IN-TRUCK ?auto_22723 ?auto_22726 ) ( TRUCK-AT ?auto_22726 ?auto_22728 ) ( IN-CITY ?auto_22728 ?auto_22727 ) ( not ( = ?auto_22722 ?auto_22728 ) ) ( not ( = ?auto_22729 ?auto_22728 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_22725 ?auto_22724 ?auto_22722 )
      ( DELIVER-3PKG-VERIFY ?auto_22723 ?auto_22724 ?auto_22725 ?auto_22722 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_22758 - OBJ
      ?auto_22759 - OBJ
      ?auto_22760 - OBJ
      ?auto_22757 - LOCATION
    )
    :vars
    (
      ?auto_22764 - LOCATION
      ?auto_22762 - CITY
      ?auto_22761 - TRUCK
      ?auto_22763 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_22759 ?auto_22758 ) ) ( not ( = ?auto_22760 ?auto_22758 ) ) ( not ( = ?auto_22760 ?auto_22759 ) ) ( IN-CITY ?auto_22764 ?auto_22762 ) ( IN-CITY ?auto_22757 ?auto_22762 ) ( not ( = ?auto_22757 ?auto_22764 ) ) ( OBJ-AT ?auto_22759 ?auto_22757 ) ( OBJ-AT ?auto_22758 ?auto_22764 ) ( IN-TRUCK ?auto_22760 ?auto_22761 ) ( TRUCK-AT ?auto_22761 ?auto_22763 ) ( IN-CITY ?auto_22763 ?auto_22762 ) ( not ( = ?auto_22757 ?auto_22763 ) ) ( not ( = ?auto_22764 ?auto_22763 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_22759 ?auto_22758 ?auto_22757 )
      ( DELIVER-3PKG-VERIFY ?auto_22758 ?auto_22759 ?auto_22760 ?auto_22757 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_22775 - OBJ
      ?auto_22776 - OBJ
      ?auto_22777 - OBJ
      ?auto_22774 - LOCATION
    )
    :vars
    (
      ?auto_22781 - LOCATION
      ?auto_22779 - CITY
      ?auto_22778 - TRUCK
      ?auto_22780 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_22776 ?auto_22775 ) ) ( not ( = ?auto_22777 ?auto_22775 ) ) ( not ( = ?auto_22777 ?auto_22776 ) ) ( IN-CITY ?auto_22781 ?auto_22779 ) ( IN-CITY ?auto_22774 ?auto_22779 ) ( not ( = ?auto_22774 ?auto_22781 ) ) ( OBJ-AT ?auto_22777 ?auto_22774 ) ( OBJ-AT ?auto_22775 ?auto_22781 ) ( IN-TRUCK ?auto_22776 ?auto_22778 ) ( TRUCK-AT ?auto_22778 ?auto_22780 ) ( IN-CITY ?auto_22780 ?auto_22779 ) ( not ( = ?auto_22774 ?auto_22780 ) ) ( not ( = ?auto_22781 ?auto_22780 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_22777 ?auto_22775 ?auto_22774 )
      ( DELIVER-3PKG-VERIFY ?auto_22775 ?auto_22776 ?auto_22777 ?auto_22774 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_23444 - OBJ
      ?auto_23443 - LOCATION
    )
    :vars
    (
      ?auto_23450 - OBJ
      ?auto_23449 - LOCATION
      ?auto_23447 - CITY
      ?auto_23445 - OBJ
      ?auto_23446 - TRUCK
      ?auto_23448 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_23444 ?auto_23450 ) ) ( IN-CITY ?auto_23449 ?auto_23447 ) ( IN-CITY ?auto_23443 ?auto_23447 ) ( not ( = ?auto_23443 ?auto_23449 ) ) ( OBJ-AT ?auto_23450 ?auto_23443 ) ( OBJ-AT ?auto_23444 ?auto_23449 ) ( not ( = ?auto_23445 ?auto_23450 ) ) ( not ( = ?auto_23444 ?auto_23445 ) ) ( TRUCK-AT ?auto_23446 ?auto_23448 ) ( IN-CITY ?auto_23448 ?auto_23447 ) ( not ( = ?auto_23443 ?auto_23448 ) ) ( not ( = ?auto_23449 ?auto_23448 ) ) ( OBJ-AT ?auto_23445 ?auto_23448 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_23445 ?auto_23446 ?auto_23448 )
      ( DELIVER-2PKG ?auto_23450 ?auto_23444 ?auto_23443 )
      ( DELIVER-1PKG-VERIFY ?auto_23444 ?auto_23443 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_23452 - OBJ
      ?auto_23453 - OBJ
      ?auto_23451 - LOCATION
    )
    :vars
    (
      ?auto_23458 - LOCATION
      ?auto_23456 - CITY
      ?auto_23454 - OBJ
      ?auto_23455 - TRUCK
      ?auto_23457 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_23453 ?auto_23452 ) ) ( IN-CITY ?auto_23458 ?auto_23456 ) ( IN-CITY ?auto_23451 ?auto_23456 ) ( not ( = ?auto_23451 ?auto_23458 ) ) ( OBJ-AT ?auto_23452 ?auto_23451 ) ( OBJ-AT ?auto_23453 ?auto_23458 ) ( not ( = ?auto_23454 ?auto_23452 ) ) ( not ( = ?auto_23453 ?auto_23454 ) ) ( TRUCK-AT ?auto_23455 ?auto_23457 ) ( IN-CITY ?auto_23457 ?auto_23456 ) ( not ( = ?auto_23451 ?auto_23457 ) ) ( not ( = ?auto_23458 ?auto_23457 ) ) ( OBJ-AT ?auto_23454 ?auto_23457 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_23453 ?auto_23451 )
      ( DELIVER-2PKG-VERIFY ?auto_23452 ?auto_23453 ?auto_23451 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_23460 - OBJ
      ?auto_23461 - OBJ
      ?auto_23459 - LOCATION
    )
    :vars
    (
      ?auto_23466 - OBJ
      ?auto_23465 - LOCATION
      ?auto_23462 - CITY
      ?auto_23463 - TRUCK
      ?auto_23464 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_23461 ?auto_23460 ) ) ( not ( = ?auto_23461 ?auto_23466 ) ) ( IN-CITY ?auto_23465 ?auto_23462 ) ( IN-CITY ?auto_23459 ?auto_23462 ) ( not ( = ?auto_23459 ?auto_23465 ) ) ( OBJ-AT ?auto_23466 ?auto_23459 ) ( OBJ-AT ?auto_23461 ?auto_23465 ) ( not ( = ?auto_23460 ?auto_23466 ) ) ( TRUCK-AT ?auto_23463 ?auto_23464 ) ( IN-CITY ?auto_23464 ?auto_23462 ) ( not ( = ?auto_23459 ?auto_23464 ) ) ( not ( = ?auto_23465 ?auto_23464 ) ) ( OBJ-AT ?auto_23460 ?auto_23464 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_23466 ?auto_23461 ?auto_23459 )
      ( DELIVER-2PKG-VERIFY ?auto_23460 ?auto_23461 ?auto_23459 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_23468 - OBJ
      ?auto_23469 - OBJ
      ?auto_23467 - LOCATION
    )
    :vars
    (
      ?auto_23474 - LOCATION
      ?auto_23471 - CITY
      ?auto_23470 - OBJ
      ?auto_23472 - TRUCK
      ?auto_23473 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_23469 ?auto_23468 ) ) ( IN-CITY ?auto_23474 ?auto_23471 ) ( IN-CITY ?auto_23467 ?auto_23471 ) ( not ( = ?auto_23467 ?auto_23474 ) ) ( OBJ-AT ?auto_23469 ?auto_23467 ) ( OBJ-AT ?auto_23468 ?auto_23474 ) ( not ( = ?auto_23470 ?auto_23469 ) ) ( not ( = ?auto_23468 ?auto_23470 ) ) ( TRUCK-AT ?auto_23472 ?auto_23473 ) ( IN-CITY ?auto_23473 ?auto_23471 ) ( not ( = ?auto_23467 ?auto_23473 ) ) ( not ( = ?auto_23474 ?auto_23473 ) ) ( OBJ-AT ?auto_23470 ?auto_23473 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_23469 ?auto_23468 ?auto_23467 )
      ( DELIVER-2PKG-VERIFY ?auto_23468 ?auto_23469 ?auto_23467 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_23476 - OBJ
      ?auto_23477 - OBJ
      ?auto_23475 - LOCATION
    )
    :vars
    (
      ?auto_23482 - OBJ
      ?auto_23481 - LOCATION
      ?auto_23478 - CITY
      ?auto_23479 - TRUCK
      ?auto_23480 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_23477 ?auto_23476 ) ) ( not ( = ?auto_23476 ?auto_23482 ) ) ( IN-CITY ?auto_23481 ?auto_23478 ) ( IN-CITY ?auto_23475 ?auto_23478 ) ( not ( = ?auto_23475 ?auto_23481 ) ) ( OBJ-AT ?auto_23482 ?auto_23475 ) ( OBJ-AT ?auto_23476 ?auto_23481 ) ( not ( = ?auto_23477 ?auto_23482 ) ) ( TRUCK-AT ?auto_23479 ?auto_23480 ) ( IN-CITY ?auto_23480 ?auto_23478 ) ( not ( = ?auto_23475 ?auto_23480 ) ) ( not ( = ?auto_23481 ?auto_23480 ) ) ( OBJ-AT ?auto_23477 ?auto_23480 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_23482 ?auto_23476 ?auto_23475 )
      ( DELIVER-2PKG-VERIFY ?auto_23476 ?auto_23477 ?auto_23475 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_23502 - OBJ
      ?auto_23503 - OBJ
      ?auto_23504 - OBJ
      ?auto_23501 - LOCATION
    )
    :vars
    (
      ?auto_23508 - LOCATION
      ?auto_23505 - CITY
      ?auto_23506 - TRUCK
      ?auto_23507 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_23503 ?auto_23502 ) ) ( not ( = ?auto_23504 ?auto_23502 ) ) ( not ( = ?auto_23504 ?auto_23503 ) ) ( IN-CITY ?auto_23508 ?auto_23505 ) ( IN-CITY ?auto_23501 ?auto_23505 ) ( not ( = ?auto_23501 ?auto_23508 ) ) ( OBJ-AT ?auto_23502 ?auto_23501 ) ( OBJ-AT ?auto_23504 ?auto_23508 ) ( TRUCK-AT ?auto_23506 ?auto_23507 ) ( IN-CITY ?auto_23507 ?auto_23505 ) ( not ( = ?auto_23501 ?auto_23507 ) ) ( not ( = ?auto_23508 ?auto_23507 ) ) ( OBJ-AT ?auto_23503 ?auto_23507 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_23502 ?auto_23504 ?auto_23501 )
      ( DELIVER-3PKG-VERIFY ?auto_23502 ?auto_23503 ?auto_23504 ?auto_23501 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_23519 - OBJ
      ?auto_23520 - OBJ
      ?auto_23521 - OBJ
      ?auto_23518 - LOCATION
    )
    :vars
    (
      ?auto_23525 - LOCATION
      ?auto_23522 - CITY
      ?auto_23523 - TRUCK
      ?auto_23524 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_23520 ?auto_23519 ) ) ( not ( = ?auto_23521 ?auto_23519 ) ) ( not ( = ?auto_23521 ?auto_23520 ) ) ( IN-CITY ?auto_23525 ?auto_23522 ) ( IN-CITY ?auto_23518 ?auto_23522 ) ( not ( = ?auto_23518 ?auto_23525 ) ) ( OBJ-AT ?auto_23519 ?auto_23518 ) ( OBJ-AT ?auto_23520 ?auto_23525 ) ( TRUCK-AT ?auto_23523 ?auto_23524 ) ( IN-CITY ?auto_23524 ?auto_23522 ) ( not ( = ?auto_23518 ?auto_23524 ) ) ( not ( = ?auto_23525 ?auto_23524 ) ) ( OBJ-AT ?auto_23521 ?auto_23524 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_23519 ?auto_23520 ?auto_23518 )
      ( DELIVER-3PKG-VERIFY ?auto_23519 ?auto_23520 ?auto_23521 ?auto_23518 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_23536 - OBJ
      ?auto_23537 - OBJ
      ?auto_23538 - OBJ
      ?auto_23535 - LOCATION
    )
    :vars
    (
      ?auto_23542 - LOCATION
      ?auto_23539 - CITY
      ?auto_23540 - TRUCK
      ?auto_23541 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_23537 ?auto_23536 ) ) ( not ( = ?auto_23538 ?auto_23536 ) ) ( not ( = ?auto_23538 ?auto_23537 ) ) ( IN-CITY ?auto_23542 ?auto_23539 ) ( IN-CITY ?auto_23535 ?auto_23539 ) ( not ( = ?auto_23535 ?auto_23542 ) ) ( OBJ-AT ?auto_23537 ?auto_23535 ) ( OBJ-AT ?auto_23538 ?auto_23542 ) ( TRUCK-AT ?auto_23540 ?auto_23541 ) ( IN-CITY ?auto_23541 ?auto_23539 ) ( not ( = ?auto_23535 ?auto_23541 ) ) ( not ( = ?auto_23542 ?auto_23541 ) ) ( OBJ-AT ?auto_23536 ?auto_23541 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_23537 ?auto_23538 ?auto_23535 )
      ( DELIVER-3PKG-VERIFY ?auto_23536 ?auto_23537 ?auto_23538 ?auto_23535 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_23553 - OBJ
      ?auto_23554 - OBJ
      ?auto_23555 - OBJ
      ?auto_23552 - LOCATION
    )
    :vars
    (
      ?auto_23559 - LOCATION
      ?auto_23556 - CITY
      ?auto_23557 - TRUCK
      ?auto_23558 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_23554 ?auto_23553 ) ) ( not ( = ?auto_23555 ?auto_23553 ) ) ( not ( = ?auto_23555 ?auto_23554 ) ) ( IN-CITY ?auto_23559 ?auto_23556 ) ( IN-CITY ?auto_23552 ?auto_23556 ) ( not ( = ?auto_23552 ?auto_23559 ) ) ( OBJ-AT ?auto_23555 ?auto_23552 ) ( OBJ-AT ?auto_23554 ?auto_23559 ) ( TRUCK-AT ?auto_23557 ?auto_23558 ) ( IN-CITY ?auto_23558 ?auto_23556 ) ( not ( = ?auto_23552 ?auto_23558 ) ) ( not ( = ?auto_23559 ?auto_23558 ) ) ( OBJ-AT ?auto_23553 ?auto_23558 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_23555 ?auto_23554 ?auto_23552 )
      ( DELIVER-3PKG-VERIFY ?auto_23553 ?auto_23554 ?auto_23555 ?auto_23552 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_23588 - OBJ
      ?auto_23589 - OBJ
      ?auto_23590 - OBJ
      ?auto_23587 - LOCATION
    )
    :vars
    (
      ?auto_23594 - LOCATION
      ?auto_23591 - CITY
      ?auto_23592 - TRUCK
      ?auto_23593 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_23589 ?auto_23588 ) ) ( not ( = ?auto_23590 ?auto_23588 ) ) ( not ( = ?auto_23590 ?auto_23589 ) ) ( IN-CITY ?auto_23594 ?auto_23591 ) ( IN-CITY ?auto_23587 ?auto_23591 ) ( not ( = ?auto_23587 ?auto_23594 ) ) ( OBJ-AT ?auto_23589 ?auto_23587 ) ( OBJ-AT ?auto_23588 ?auto_23594 ) ( TRUCK-AT ?auto_23592 ?auto_23593 ) ( IN-CITY ?auto_23593 ?auto_23591 ) ( not ( = ?auto_23587 ?auto_23593 ) ) ( not ( = ?auto_23594 ?auto_23593 ) ) ( OBJ-AT ?auto_23590 ?auto_23593 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_23589 ?auto_23588 ?auto_23587 )
      ( DELIVER-3PKG-VERIFY ?auto_23588 ?auto_23589 ?auto_23590 ?auto_23587 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_23605 - OBJ
      ?auto_23606 - OBJ
      ?auto_23607 - OBJ
      ?auto_23604 - LOCATION
    )
    :vars
    (
      ?auto_23611 - LOCATION
      ?auto_23608 - CITY
      ?auto_23609 - TRUCK
      ?auto_23610 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_23606 ?auto_23605 ) ) ( not ( = ?auto_23607 ?auto_23605 ) ) ( not ( = ?auto_23607 ?auto_23606 ) ) ( IN-CITY ?auto_23611 ?auto_23608 ) ( IN-CITY ?auto_23604 ?auto_23608 ) ( not ( = ?auto_23604 ?auto_23611 ) ) ( OBJ-AT ?auto_23607 ?auto_23604 ) ( OBJ-AT ?auto_23605 ?auto_23611 ) ( TRUCK-AT ?auto_23609 ?auto_23610 ) ( IN-CITY ?auto_23610 ?auto_23608 ) ( not ( = ?auto_23604 ?auto_23610 ) ) ( not ( = ?auto_23611 ?auto_23610 ) ) ( OBJ-AT ?auto_23606 ?auto_23610 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_23607 ?auto_23605 ?auto_23604 )
      ( DELIVER-3PKG-VERIFY ?auto_23605 ?auto_23606 ?auto_23607 ?auto_23604 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_24274 - OBJ
      ?auto_24273 - LOCATION
    )
    :vars
    (
      ?auto_24280 - OBJ
      ?auto_24279 - LOCATION
      ?auto_24276 - CITY
      ?auto_24275 - OBJ
      ?auto_24278 - LOCATION
      ?auto_24277 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_24274 ?auto_24280 ) ) ( IN-CITY ?auto_24279 ?auto_24276 ) ( IN-CITY ?auto_24273 ?auto_24276 ) ( not ( = ?auto_24273 ?auto_24279 ) ) ( OBJ-AT ?auto_24280 ?auto_24273 ) ( OBJ-AT ?auto_24274 ?auto_24279 ) ( not ( = ?auto_24275 ?auto_24280 ) ) ( not ( = ?auto_24274 ?auto_24275 ) ) ( IN-CITY ?auto_24278 ?auto_24276 ) ( not ( = ?auto_24273 ?auto_24278 ) ) ( not ( = ?auto_24279 ?auto_24278 ) ) ( OBJ-AT ?auto_24275 ?auto_24278 ) ( TRUCK-AT ?auto_24277 ?auto_24273 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_24277 ?auto_24273 ?auto_24278 ?auto_24276 )
      ( DELIVER-2PKG ?auto_24280 ?auto_24274 ?auto_24273 )
      ( DELIVER-1PKG-VERIFY ?auto_24274 ?auto_24273 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_24282 - OBJ
      ?auto_24283 - OBJ
      ?auto_24281 - LOCATION
    )
    :vars
    (
      ?auto_24285 - LOCATION
      ?auto_24287 - CITY
      ?auto_24284 - OBJ
      ?auto_24288 - LOCATION
      ?auto_24286 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_24283 ?auto_24282 ) ) ( IN-CITY ?auto_24285 ?auto_24287 ) ( IN-CITY ?auto_24281 ?auto_24287 ) ( not ( = ?auto_24281 ?auto_24285 ) ) ( OBJ-AT ?auto_24282 ?auto_24281 ) ( OBJ-AT ?auto_24283 ?auto_24285 ) ( not ( = ?auto_24284 ?auto_24282 ) ) ( not ( = ?auto_24283 ?auto_24284 ) ) ( IN-CITY ?auto_24288 ?auto_24287 ) ( not ( = ?auto_24281 ?auto_24288 ) ) ( not ( = ?auto_24285 ?auto_24288 ) ) ( OBJ-AT ?auto_24284 ?auto_24288 ) ( TRUCK-AT ?auto_24286 ?auto_24281 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_24283 ?auto_24281 )
      ( DELIVER-2PKG-VERIFY ?auto_24282 ?auto_24283 ?auto_24281 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_24290 - OBJ
      ?auto_24291 - OBJ
      ?auto_24289 - LOCATION
    )
    :vars
    (
      ?auto_24296 - OBJ
      ?auto_24292 - LOCATION
      ?auto_24294 - CITY
      ?auto_24293 - LOCATION
      ?auto_24295 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_24291 ?auto_24290 ) ) ( not ( = ?auto_24291 ?auto_24296 ) ) ( IN-CITY ?auto_24292 ?auto_24294 ) ( IN-CITY ?auto_24289 ?auto_24294 ) ( not ( = ?auto_24289 ?auto_24292 ) ) ( OBJ-AT ?auto_24296 ?auto_24289 ) ( OBJ-AT ?auto_24291 ?auto_24292 ) ( not ( = ?auto_24290 ?auto_24296 ) ) ( IN-CITY ?auto_24293 ?auto_24294 ) ( not ( = ?auto_24289 ?auto_24293 ) ) ( not ( = ?auto_24292 ?auto_24293 ) ) ( OBJ-AT ?auto_24290 ?auto_24293 ) ( TRUCK-AT ?auto_24295 ?auto_24289 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_24296 ?auto_24291 ?auto_24289 )
      ( DELIVER-2PKG-VERIFY ?auto_24290 ?auto_24291 ?auto_24289 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_24298 - OBJ
      ?auto_24299 - OBJ
      ?auto_24297 - LOCATION
    )
    :vars
    (
      ?auto_24300 - LOCATION
      ?auto_24302 - CITY
      ?auto_24304 - OBJ
      ?auto_24301 - LOCATION
      ?auto_24303 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_24299 ?auto_24298 ) ) ( IN-CITY ?auto_24300 ?auto_24302 ) ( IN-CITY ?auto_24297 ?auto_24302 ) ( not ( = ?auto_24297 ?auto_24300 ) ) ( OBJ-AT ?auto_24299 ?auto_24297 ) ( OBJ-AT ?auto_24298 ?auto_24300 ) ( not ( = ?auto_24304 ?auto_24299 ) ) ( not ( = ?auto_24298 ?auto_24304 ) ) ( IN-CITY ?auto_24301 ?auto_24302 ) ( not ( = ?auto_24297 ?auto_24301 ) ) ( not ( = ?auto_24300 ?auto_24301 ) ) ( OBJ-AT ?auto_24304 ?auto_24301 ) ( TRUCK-AT ?auto_24303 ?auto_24297 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_24299 ?auto_24298 ?auto_24297 )
      ( DELIVER-2PKG-VERIFY ?auto_24298 ?auto_24299 ?auto_24297 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_24306 - OBJ
      ?auto_24307 - OBJ
      ?auto_24305 - LOCATION
    )
    :vars
    (
      ?auto_24312 - OBJ
      ?auto_24308 - LOCATION
      ?auto_24310 - CITY
      ?auto_24309 - LOCATION
      ?auto_24311 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_24307 ?auto_24306 ) ) ( not ( = ?auto_24306 ?auto_24312 ) ) ( IN-CITY ?auto_24308 ?auto_24310 ) ( IN-CITY ?auto_24305 ?auto_24310 ) ( not ( = ?auto_24305 ?auto_24308 ) ) ( OBJ-AT ?auto_24312 ?auto_24305 ) ( OBJ-AT ?auto_24306 ?auto_24308 ) ( not ( = ?auto_24307 ?auto_24312 ) ) ( IN-CITY ?auto_24309 ?auto_24310 ) ( not ( = ?auto_24305 ?auto_24309 ) ) ( not ( = ?auto_24308 ?auto_24309 ) ) ( OBJ-AT ?auto_24307 ?auto_24309 ) ( TRUCK-AT ?auto_24311 ?auto_24305 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_24312 ?auto_24306 ?auto_24305 )
      ( DELIVER-2PKG-VERIFY ?auto_24306 ?auto_24307 ?auto_24305 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_24332 - OBJ
      ?auto_24333 - OBJ
      ?auto_24334 - OBJ
      ?auto_24331 - LOCATION
    )
    :vars
    (
      ?auto_24335 - LOCATION
      ?auto_24337 - CITY
      ?auto_24336 - LOCATION
      ?auto_24338 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_24333 ?auto_24332 ) ) ( not ( = ?auto_24334 ?auto_24332 ) ) ( not ( = ?auto_24334 ?auto_24333 ) ) ( IN-CITY ?auto_24335 ?auto_24337 ) ( IN-CITY ?auto_24331 ?auto_24337 ) ( not ( = ?auto_24331 ?auto_24335 ) ) ( OBJ-AT ?auto_24332 ?auto_24331 ) ( OBJ-AT ?auto_24334 ?auto_24335 ) ( IN-CITY ?auto_24336 ?auto_24337 ) ( not ( = ?auto_24331 ?auto_24336 ) ) ( not ( = ?auto_24335 ?auto_24336 ) ) ( OBJ-AT ?auto_24333 ?auto_24336 ) ( TRUCK-AT ?auto_24338 ?auto_24331 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_24332 ?auto_24334 ?auto_24331 )
      ( DELIVER-3PKG-VERIFY ?auto_24332 ?auto_24333 ?auto_24334 ?auto_24331 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_24349 - OBJ
      ?auto_24350 - OBJ
      ?auto_24351 - OBJ
      ?auto_24348 - LOCATION
    )
    :vars
    (
      ?auto_24352 - LOCATION
      ?auto_24354 - CITY
      ?auto_24353 - LOCATION
      ?auto_24355 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_24350 ?auto_24349 ) ) ( not ( = ?auto_24351 ?auto_24349 ) ) ( not ( = ?auto_24351 ?auto_24350 ) ) ( IN-CITY ?auto_24352 ?auto_24354 ) ( IN-CITY ?auto_24348 ?auto_24354 ) ( not ( = ?auto_24348 ?auto_24352 ) ) ( OBJ-AT ?auto_24349 ?auto_24348 ) ( OBJ-AT ?auto_24350 ?auto_24352 ) ( IN-CITY ?auto_24353 ?auto_24354 ) ( not ( = ?auto_24348 ?auto_24353 ) ) ( not ( = ?auto_24352 ?auto_24353 ) ) ( OBJ-AT ?auto_24351 ?auto_24353 ) ( TRUCK-AT ?auto_24355 ?auto_24348 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_24349 ?auto_24350 ?auto_24348 )
      ( DELIVER-3PKG-VERIFY ?auto_24349 ?auto_24350 ?auto_24351 ?auto_24348 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_24366 - OBJ
      ?auto_24367 - OBJ
      ?auto_24368 - OBJ
      ?auto_24365 - LOCATION
    )
    :vars
    (
      ?auto_24369 - LOCATION
      ?auto_24371 - CITY
      ?auto_24370 - LOCATION
      ?auto_24372 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_24367 ?auto_24366 ) ) ( not ( = ?auto_24368 ?auto_24366 ) ) ( not ( = ?auto_24368 ?auto_24367 ) ) ( IN-CITY ?auto_24369 ?auto_24371 ) ( IN-CITY ?auto_24365 ?auto_24371 ) ( not ( = ?auto_24365 ?auto_24369 ) ) ( OBJ-AT ?auto_24367 ?auto_24365 ) ( OBJ-AT ?auto_24368 ?auto_24369 ) ( IN-CITY ?auto_24370 ?auto_24371 ) ( not ( = ?auto_24365 ?auto_24370 ) ) ( not ( = ?auto_24369 ?auto_24370 ) ) ( OBJ-AT ?auto_24366 ?auto_24370 ) ( TRUCK-AT ?auto_24372 ?auto_24365 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_24367 ?auto_24368 ?auto_24365 )
      ( DELIVER-3PKG-VERIFY ?auto_24366 ?auto_24367 ?auto_24368 ?auto_24365 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_24383 - OBJ
      ?auto_24384 - OBJ
      ?auto_24385 - OBJ
      ?auto_24382 - LOCATION
    )
    :vars
    (
      ?auto_24386 - LOCATION
      ?auto_24388 - CITY
      ?auto_24387 - LOCATION
      ?auto_24389 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_24384 ?auto_24383 ) ) ( not ( = ?auto_24385 ?auto_24383 ) ) ( not ( = ?auto_24385 ?auto_24384 ) ) ( IN-CITY ?auto_24386 ?auto_24388 ) ( IN-CITY ?auto_24382 ?auto_24388 ) ( not ( = ?auto_24382 ?auto_24386 ) ) ( OBJ-AT ?auto_24385 ?auto_24382 ) ( OBJ-AT ?auto_24384 ?auto_24386 ) ( IN-CITY ?auto_24387 ?auto_24388 ) ( not ( = ?auto_24382 ?auto_24387 ) ) ( not ( = ?auto_24386 ?auto_24387 ) ) ( OBJ-AT ?auto_24383 ?auto_24387 ) ( TRUCK-AT ?auto_24389 ?auto_24382 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_24385 ?auto_24384 ?auto_24382 )
      ( DELIVER-3PKG-VERIFY ?auto_24383 ?auto_24384 ?auto_24385 ?auto_24382 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_24418 - OBJ
      ?auto_24419 - OBJ
      ?auto_24420 - OBJ
      ?auto_24417 - LOCATION
    )
    :vars
    (
      ?auto_24421 - LOCATION
      ?auto_24423 - CITY
      ?auto_24422 - LOCATION
      ?auto_24424 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_24419 ?auto_24418 ) ) ( not ( = ?auto_24420 ?auto_24418 ) ) ( not ( = ?auto_24420 ?auto_24419 ) ) ( IN-CITY ?auto_24421 ?auto_24423 ) ( IN-CITY ?auto_24417 ?auto_24423 ) ( not ( = ?auto_24417 ?auto_24421 ) ) ( OBJ-AT ?auto_24419 ?auto_24417 ) ( OBJ-AT ?auto_24418 ?auto_24421 ) ( IN-CITY ?auto_24422 ?auto_24423 ) ( not ( = ?auto_24417 ?auto_24422 ) ) ( not ( = ?auto_24421 ?auto_24422 ) ) ( OBJ-AT ?auto_24420 ?auto_24422 ) ( TRUCK-AT ?auto_24424 ?auto_24417 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_24419 ?auto_24418 ?auto_24417 )
      ( DELIVER-3PKG-VERIFY ?auto_24418 ?auto_24419 ?auto_24420 ?auto_24417 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_24435 - OBJ
      ?auto_24436 - OBJ
      ?auto_24437 - OBJ
      ?auto_24434 - LOCATION
    )
    :vars
    (
      ?auto_24438 - LOCATION
      ?auto_24440 - CITY
      ?auto_24439 - LOCATION
      ?auto_24441 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_24436 ?auto_24435 ) ) ( not ( = ?auto_24437 ?auto_24435 ) ) ( not ( = ?auto_24437 ?auto_24436 ) ) ( IN-CITY ?auto_24438 ?auto_24440 ) ( IN-CITY ?auto_24434 ?auto_24440 ) ( not ( = ?auto_24434 ?auto_24438 ) ) ( OBJ-AT ?auto_24437 ?auto_24434 ) ( OBJ-AT ?auto_24435 ?auto_24438 ) ( IN-CITY ?auto_24439 ?auto_24440 ) ( not ( = ?auto_24434 ?auto_24439 ) ) ( not ( = ?auto_24438 ?auto_24439 ) ) ( OBJ-AT ?auto_24436 ?auto_24439 ) ( TRUCK-AT ?auto_24441 ?auto_24434 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_24437 ?auto_24435 ?auto_24434 )
      ( DELIVER-3PKG-VERIFY ?auto_24435 ?auto_24436 ?auto_24437 ?auto_24434 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_25104 - OBJ
      ?auto_25103 - LOCATION
    )
    :vars
    (
      ?auto_25110 - OBJ
      ?auto_25105 - LOCATION
      ?auto_25107 - CITY
      ?auto_25109 - OBJ
      ?auto_25106 - LOCATION
      ?auto_25108 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_25104 ?auto_25110 ) ) ( IN-CITY ?auto_25105 ?auto_25107 ) ( IN-CITY ?auto_25103 ?auto_25107 ) ( not ( = ?auto_25103 ?auto_25105 ) ) ( OBJ-AT ?auto_25104 ?auto_25105 ) ( not ( = ?auto_25109 ?auto_25110 ) ) ( not ( = ?auto_25104 ?auto_25109 ) ) ( IN-CITY ?auto_25106 ?auto_25107 ) ( not ( = ?auto_25103 ?auto_25106 ) ) ( not ( = ?auto_25105 ?auto_25106 ) ) ( OBJ-AT ?auto_25109 ?auto_25106 ) ( TRUCK-AT ?auto_25108 ?auto_25103 ) ( IN-TRUCK ?auto_25110 ?auto_25108 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_25110 ?auto_25103 )
      ( DELIVER-2PKG ?auto_25110 ?auto_25104 ?auto_25103 )
      ( DELIVER-1PKG-VERIFY ?auto_25104 ?auto_25103 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_25112 - OBJ
      ?auto_25113 - OBJ
      ?auto_25111 - LOCATION
    )
    :vars
    (
      ?auto_25114 - LOCATION
      ?auto_25117 - CITY
      ?auto_25115 - OBJ
      ?auto_25118 - LOCATION
      ?auto_25116 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_25113 ?auto_25112 ) ) ( IN-CITY ?auto_25114 ?auto_25117 ) ( IN-CITY ?auto_25111 ?auto_25117 ) ( not ( = ?auto_25111 ?auto_25114 ) ) ( OBJ-AT ?auto_25113 ?auto_25114 ) ( not ( = ?auto_25115 ?auto_25112 ) ) ( not ( = ?auto_25113 ?auto_25115 ) ) ( IN-CITY ?auto_25118 ?auto_25117 ) ( not ( = ?auto_25111 ?auto_25118 ) ) ( not ( = ?auto_25114 ?auto_25118 ) ) ( OBJ-AT ?auto_25115 ?auto_25118 ) ( TRUCK-AT ?auto_25116 ?auto_25111 ) ( IN-TRUCK ?auto_25112 ?auto_25116 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_25113 ?auto_25111 )
      ( DELIVER-2PKG-VERIFY ?auto_25112 ?auto_25113 ?auto_25111 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_25120 - OBJ
      ?auto_25121 - OBJ
      ?auto_25119 - LOCATION
    )
    :vars
    (
      ?auto_25126 - OBJ
      ?auto_25125 - LOCATION
      ?auto_25124 - CITY
      ?auto_25122 - LOCATION
      ?auto_25123 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_25121 ?auto_25120 ) ) ( not ( = ?auto_25121 ?auto_25126 ) ) ( IN-CITY ?auto_25125 ?auto_25124 ) ( IN-CITY ?auto_25119 ?auto_25124 ) ( not ( = ?auto_25119 ?auto_25125 ) ) ( OBJ-AT ?auto_25121 ?auto_25125 ) ( not ( = ?auto_25120 ?auto_25126 ) ) ( IN-CITY ?auto_25122 ?auto_25124 ) ( not ( = ?auto_25119 ?auto_25122 ) ) ( not ( = ?auto_25125 ?auto_25122 ) ) ( OBJ-AT ?auto_25120 ?auto_25122 ) ( TRUCK-AT ?auto_25123 ?auto_25119 ) ( IN-TRUCK ?auto_25126 ?auto_25123 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_25126 ?auto_25121 ?auto_25119 )
      ( DELIVER-2PKG-VERIFY ?auto_25120 ?auto_25121 ?auto_25119 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_25128 - OBJ
      ?auto_25129 - OBJ
      ?auto_25127 - LOCATION
    )
    :vars
    (
      ?auto_25133 - LOCATION
      ?auto_25132 - CITY
      ?auto_25134 - OBJ
      ?auto_25130 - LOCATION
      ?auto_25131 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_25129 ?auto_25128 ) ) ( IN-CITY ?auto_25133 ?auto_25132 ) ( IN-CITY ?auto_25127 ?auto_25132 ) ( not ( = ?auto_25127 ?auto_25133 ) ) ( OBJ-AT ?auto_25128 ?auto_25133 ) ( not ( = ?auto_25134 ?auto_25129 ) ) ( not ( = ?auto_25128 ?auto_25134 ) ) ( IN-CITY ?auto_25130 ?auto_25132 ) ( not ( = ?auto_25127 ?auto_25130 ) ) ( not ( = ?auto_25133 ?auto_25130 ) ) ( OBJ-AT ?auto_25134 ?auto_25130 ) ( TRUCK-AT ?auto_25131 ?auto_25127 ) ( IN-TRUCK ?auto_25129 ?auto_25131 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_25129 ?auto_25128 ?auto_25127 )
      ( DELIVER-2PKG-VERIFY ?auto_25128 ?auto_25129 ?auto_25127 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_25136 - OBJ
      ?auto_25137 - OBJ
      ?auto_25135 - LOCATION
    )
    :vars
    (
      ?auto_25142 - OBJ
      ?auto_25141 - LOCATION
      ?auto_25140 - CITY
      ?auto_25138 - LOCATION
      ?auto_25139 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_25137 ?auto_25136 ) ) ( not ( = ?auto_25136 ?auto_25142 ) ) ( IN-CITY ?auto_25141 ?auto_25140 ) ( IN-CITY ?auto_25135 ?auto_25140 ) ( not ( = ?auto_25135 ?auto_25141 ) ) ( OBJ-AT ?auto_25136 ?auto_25141 ) ( not ( = ?auto_25137 ?auto_25142 ) ) ( IN-CITY ?auto_25138 ?auto_25140 ) ( not ( = ?auto_25135 ?auto_25138 ) ) ( not ( = ?auto_25141 ?auto_25138 ) ) ( OBJ-AT ?auto_25137 ?auto_25138 ) ( TRUCK-AT ?auto_25139 ?auto_25135 ) ( IN-TRUCK ?auto_25142 ?auto_25139 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_25142 ?auto_25136 ?auto_25135 )
      ( DELIVER-2PKG-VERIFY ?auto_25136 ?auto_25137 ?auto_25135 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_25162 - OBJ
      ?auto_25163 - OBJ
      ?auto_25164 - OBJ
      ?auto_25161 - LOCATION
    )
    :vars
    (
      ?auto_25168 - LOCATION
      ?auto_25167 - CITY
      ?auto_25165 - LOCATION
      ?auto_25166 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_25163 ?auto_25162 ) ) ( not ( = ?auto_25164 ?auto_25162 ) ) ( not ( = ?auto_25164 ?auto_25163 ) ) ( IN-CITY ?auto_25168 ?auto_25167 ) ( IN-CITY ?auto_25161 ?auto_25167 ) ( not ( = ?auto_25161 ?auto_25168 ) ) ( OBJ-AT ?auto_25164 ?auto_25168 ) ( IN-CITY ?auto_25165 ?auto_25167 ) ( not ( = ?auto_25161 ?auto_25165 ) ) ( not ( = ?auto_25168 ?auto_25165 ) ) ( OBJ-AT ?auto_25163 ?auto_25165 ) ( TRUCK-AT ?auto_25166 ?auto_25161 ) ( IN-TRUCK ?auto_25162 ?auto_25166 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_25162 ?auto_25164 ?auto_25161 )
      ( DELIVER-3PKG-VERIFY ?auto_25162 ?auto_25163 ?auto_25164 ?auto_25161 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_25179 - OBJ
      ?auto_25180 - OBJ
      ?auto_25181 - OBJ
      ?auto_25178 - LOCATION
    )
    :vars
    (
      ?auto_25185 - LOCATION
      ?auto_25184 - CITY
      ?auto_25182 - LOCATION
      ?auto_25183 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_25180 ?auto_25179 ) ) ( not ( = ?auto_25181 ?auto_25179 ) ) ( not ( = ?auto_25181 ?auto_25180 ) ) ( IN-CITY ?auto_25185 ?auto_25184 ) ( IN-CITY ?auto_25178 ?auto_25184 ) ( not ( = ?auto_25178 ?auto_25185 ) ) ( OBJ-AT ?auto_25180 ?auto_25185 ) ( IN-CITY ?auto_25182 ?auto_25184 ) ( not ( = ?auto_25178 ?auto_25182 ) ) ( not ( = ?auto_25185 ?auto_25182 ) ) ( OBJ-AT ?auto_25181 ?auto_25182 ) ( TRUCK-AT ?auto_25183 ?auto_25178 ) ( IN-TRUCK ?auto_25179 ?auto_25183 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_25179 ?auto_25180 ?auto_25178 )
      ( DELIVER-3PKG-VERIFY ?auto_25179 ?auto_25180 ?auto_25181 ?auto_25178 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_25196 - OBJ
      ?auto_25197 - OBJ
      ?auto_25198 - OBJ
      ?auto_25195 - LOCATION
    )
    :vars
    (
      ?auto_25202 - LOCATION
      ?auto_25201 - CITY
      ?auto_25199 - LOCATION
      ?auto_25200 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_25197 ?auto_25196 ) ) ( not ( = ?auto_25198 ?auto_25196 ) ) ( not ( = ?auto_25198 ?auto_25197 ) ) ( IN-CITY ?auto_25202 ?auto_25201 ) ( IN-CITY ?auto_25195 ?auto_25201 ) ( not ( = ?auto_25195 ?auto_25202 ) ) ( OBJ-AT ?auto_25198 ?auto_25202 ) ( IN-CITY ?auto_25199 ?auto_25201 ) ( not ( = ?auto_25195 ?auto_25199 ) ) ( not ( = ?auto_25202 ?auto_25199 ) ) ( OBJ-AT ?auto_25196 ?auto_25199 ) ( TRUCK-AT ?auto_25200 ?auto_25195 ) ( IN-TRUCK ?auto_25197 ?auto_25200 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_25197 ?auto_25198 ?auto_25195 )
      ( DELIVER-3PKG-VERIFY ?auto_25196 ?auto_25197 ?auto_25198 ?auto_25195 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_25213 - OBJ
      ?auto_25214 - OBJ
      ?auto_25215 - OBJ
      ?auto_25212 - LOCATION
    )
    :vars
    (
      ?auto_25219 - LOCATION
      ?auto_25218 - CITY
      ?auto_25216 - LOCATION
      ?auto_25217 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_25214 ?auto_25213 ) ) ( not ( = ?auto_25215 ?auto_25213 ) ) ( not ( = ?auto_25215 ?auto_25214 ) ) ( IN-CITY ?auto_25219 ?auto_25218 ) ( IN-CITY ?auto_25212 ?auto_25218 ) ( not ( = ?auto_25212 ?auto_25219 ) ) ( OBJ-AT ?auto_25214 ?auto_25219 ) ( IN-CITY ?auto_25216 ?auto_25218 ) ( not ( = ?auto_25212 ?auto_25216 ) ) ( not ( = ?auto_25219 ?auto_25216 ) ) ( OBJ-AT ?auto_25213 ?auto_25216 ) ( TRUCK-AT ?auto_25217 ?auto_25212 ) ( IN-TRUCK ?auto_25215 ?auto_25217 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_25215 ?auto_25214 ?auto_25212 )
      ( DELIVER-3PKG-VERIFY ?auto_25213 ?auto_25214 ?auto_25215 ?auto_25212 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_25248 - OBJ
      ?auto_25249 - OBJ
      ?auto_25250 - OBJ
      ?auto_25247 - LOCATION
    )
    :vars
    (
      ?auto_25254 - LOCATION
      ?auto_25253 - CITY
      ?auto_25251 - LOCATION
      ?auto_25252 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_25249 ?auto_25248 ) ) ( not ( = ?auto_25250 ?auto_25248 ) ) ( not ( = ?auto_25250 ?auto_25249 ) ) ( IN-CITY ?auto_25254 ?auto_25253 ) ( IN-CITY ?auto_25247 ?auto_25253 ) ( not ( = ?auto_25247 ?auto_25254 ) ) ( OBJ-AT ?auto_25248 ?auto_25254 ) ( IN-CITY ?auto_25251 ?auto_25253 ) ( not ( = ?auto_25247 ?auto_25251 ) ) ( not ( = ?auto_25254 ?auto_25251 ) ) ( OBJ-AT ?auto_25250 ?auto_25251 ) ( TRUCK-AT ?auto_25252 ?auto_25247 ) ( IN-TRUCK ?auto_25249 ?auto_25252 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_25249 ?auto_25248 ?auto_25247 )
      ( DELIVER-3PKG-VERIFY ?auto_25248 ?auto_25249 ?auto_25250 ?auto_25247 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_25265 - OBJ
      ?auto_25266 - OBJ
      ?auto_25267 - OBJ
      ?auto_25264 - LOCATION
    )
    :vars
    (
      ?auto_25271 - LOCATION
      ?auto_25270 - CITY
      ?auto_25268 - LOCATION
      ?auto_25269 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_25266 ?auto_25265 ) ) ( not ( = ?auto_25267 ?auto_25265 ) ) ( not ( = ?auto_25267 ?auto_25266 ) ) ( IN-CITY ?auto_25271 ?auto_25270 ) ( IN-CITY ?auto_25264 ?auto_25270 ) ( not ( = ?auto_25264 ?auto_25271 ) ) ( OBJ-AT ?auto_25265 ?auto_25271 ) ( IN-CITY ?auto_25268 ?auto_25270 ) ( not ( = ?auto_25264 ?auto_25268 ) ) ( not ( = ?auto_25271 ?auto_25268 ) ) ( OBJ-AT ?auto_25266 ?auto_25268 ) ( TRUCK-AT ?auto_25269 ?auto_25264 ) ( IN-TRUCK ?auto_25267 ?auto_25269 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_25267 ?auto_25265 ?auto_25264 )
      ( DELIVER-3PKG-VERIFY ?auto_25265 ?auto_25266 ?auto_25267 ?auto_25264 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_25934 - OBJ
      ?auto_25933 - LOCATION
    )
    :vars
    (
      ?auto_25940 - OBJ
      ?auto_25938 - LOCATION
      ?auto_25937 - CITY
      ?auto_25939 - OBJ
      ?auto_25935 - LOCATION
      ?auto_25936 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_25934 ?auto_25940 ) ) ( IN-CITY ?auto_25938 ?auto_25937 ) ( IN-CITY ?auto_25933 ?auto_25937 ) ( not ( = ?auto_25933 ?auto_25938 ) ) ( OBJ-AT ?auto_25934 ?auto_25938 ) ( not ( = ?auto_25939 ?auto_25940 ) ) ( not ( = ?auto_25934 ?auto_25939 ) ) ( IN-CITY ?auto_25935 ?auto_25937 ) ( not ( = ?auto_25933 ?auto_25935 ) ) ( not ( = ?auto_25938 ?auto_25935 ) ) ( OBJ-AT ?auto_25939 ?auto_25935 ) ( IN-TRUCK ?auto_25940 ?auto_25936 ) ( TRUCK-AT ?auto_25936 ?auto_25938 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_25936 ?auto_25938 ?auto_25933 ?auto_25937 )
      ( DELIVER-2PKG ?auto_25940 ?auto_25934 ?auto_25933 )
      ( DELIVER-1PKG-VERIFY ?auto_25934 ?auto_25933 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_25942 - OBJ
      ?auto_25943 - OBJ
      ?auto_25941 - LOCATION
    )
    :vars
    (
      ?auto_25944 - LOCATION
      ?auto_25946 - CITY
      ?auto_25947 - OBJ
      ?auto_25948 - LOCATION
      ?auto_25945 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_25943 ?auto_25942 ) ) ( IN-CITY ?auto_25944 ?auto_25946 ) ( IN-CITY ?auto_25941 ?auto_25946 ) ( not ( = ?auto_25941 ?auto_25944 ) ) ( OBJ-AT ?auto_25943 ?auto_25944 ) ( not ( = ?auto_25947 ?auto_25942 ) ) ( not ( = ?auto_25943 ?auto_25947 ) ) ( IN-CITY ?auto_25948 ?auto_25946 ) ( not ( = ?auto_25941 ?auto_25948 ) ) ( not ( = ?auto_25944 ?auto_25948 ) ) ( OBJ-AT ?auto_25947 ?auto_25948 ) ( IN-TRUCK ?auto_25942 ?auto_25945 ) ( TRUCK-AT ?auto_25945 ?auto_25944 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_25943 ?auto_25941 )
      ( DELIVER-2PKG-VERIFY ?auto_25942 ?auto_25943 ?auto_25941 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_25950 - OBJ
      ?auto_25951 - OBJ
      ?auto_25949 - LOCATION
    )
    :vars
    (
      ?auto_25956 - OBJ
      ?auto_25953 - LOCATION
      ?auto_25952 - CITY
      ?auto_25954 - LOCATION
      ?auto_25955 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_25951 ?auto_25950 ) ) ( not ( = ?auto_25951 ?auto_25956 ) ) ( IN-CITY ?auto_25953 ?auto_25952 ) ( IN-CITY ?auto_25949 ?auto_25952 ) ( not ( = ?auto_25949 ?auto_25953 ) ) ( OBJ-AT ?auto_25951 ?auto_25953 ) ( not ( = ?auto_25950 ?auto_25956 ) ) ( IN-CITY ?auto_25954 ?auto_25952 ) ( not ( = ?auto_25949 ?auto_25954 ) ) ( not ( = ?auto_25953 ?auto_25954 ) ) ( OBJ-AT ?auto_25950 ?auto_25954 ) ( IN-TRUCK ?auto_25956 ?auto_25955 ) ( TRUCK-AT ?auto_25955 ?auto_25953 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_25956 ?auto_25951 ?auto_25949 )
      ( DELIVER-2PKG-VERIFY ?auto_25950 ?auto_25951 ?auto_25949 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_25958 - OBJ
      ?auto_25959 - OBJ
      ?auto_25957 - LOCATION
    )
    :vars
    (
      ?auto_25961 - LOCATION
      ?auto_25960 - CITY
      ?auto_25962 - OBJ
      ?auto_25963 - LOCATION
      ?auto_25964 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_25959 ?auto_25958 ) ) ( IN-CITY ?auto_25961 ?auto_25960 ) ( IN-CITY ?auto_25957 ?auto_25960 ) ( not ( = ?auto_25957 ?auto_25961 ) ) ( OBJ-AT ?auto_25958 ?auto_25961 ) ( not ( = ?auto_25962 ?auto_25959 ) ) ( not ( = ?auto_25958 ?auto_25962 ) ) ( IN-CITY ?auto_25963 ?auto_25960 ) ( not ( = ?auto_25957 ?auto_25963 ) ) ( not ( = ?auto_25961 ?auto_25963 ) ) ( OBJ-AT ?auto_25962 ?auto_25963 ) ( IN-TRUCK ?auto_25959 ?auto_25964 ) ( TRUCK-AT ?auto_25964 ?auto_25961 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_25959 ?auto_25958 ?auto_25957 )
      ( DELIVER-2PKG-VERIFY ?auto_25958 ?auto_25959 ?auto_25957 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_25966 - OBJ
      ?auto_25967 - OBJ
      ?auto_25965 - LOCATION
    )
    :vars
    (
      ?auto_25972 - OBJ
      ?auto_25969 - LOCATION
      ?auto_25968 - CITY
      ?auto_25970 - LOCATION
      ?auto_25971 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_25967 ?auto_25966 ) ) ( not ( = ?auto_25966 ?auto_25972 ) ) ( IN-CITY ?auto_25969 ?auto_25968 ) ( IN-CITY ?auto_25965 ?auto_25968 ) ( not ( = ?auto_25965 ?auto_25969 ) ) ( OBJ-AT ?auto_25966 ?auto_25969 ) ( not ( = ?auto_25967 ?auto_25972 ) ) ( IN-CITY ?auto_25970 ?auto_25968 ) ( not ( = ?auto_25965 ?auto_25970 ) ) ( not ( = ?auto_25969 ?auto_25970 ) ) ( OBJ-AT ?auto_25967 ?auto_25970 ) ( IN-TRUCK ?auto_25972 ?auto_25971 ) ( TRUCK-AT ?auto_25971 ?auto_25969 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_25972 ?auto_25966 ?auto_25965 )
      ( DELIVER-2PKG-VERIFY ?auto_25966 ?auto_25967 ?auto_25965 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_25992 - OBJ
      ?auto_25993 - OBJ
      ?auto_25994 - OBJ
      ?auto_25991 - LOCATION
    )
    :vars
    (
      ?auto_25996 - LOCATION
      ?auto_25995 - CITY
      ?auto_25997 - LOCATION
      ?auto_25998 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_25993 ?auto_25992 ) ) ( not ( = ?auto_25994 ?auto_25992 ) ) ( not ( = ?auto_25994 ?auto_25993 ) ) ( IN-CITY ?auto_25996 ?auto_25995 ) ( IN-CITY ?auto_25991 ?auto_25995 ) ( not ( = ?auto_25991 ?auto_25996 ) ) ( OBJ-AT ?auto_25994 ?auto_25996 ) ( IN-CITY ?auto_25997 ?auto_25995 ) ( not ( = ?auto_25991 ?auto_25997 ) ) ( not ( = ?auto_25996 ?auto_25997 ) ) ( OBJ-AT ?auto_25993 ?auto_25997 ) ( IN-TRUCK ?auto_25992 ?auto_25998 ) ( TRUCK-AT ?auto_25998 ?auto_25996 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_25992 ?auto_25994 ?auto_25991 )
      ( DELIVER-3PKG-VERIFY ?auto_25992 ?auto_25993 ?auto_25994 ?auto_25991 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_26009 - OBJ
      ?auto_26010 - OBJ
      ?auto_26011 - OBJ
      ?auto_26008 - LOCATION
    )
    :vars
    (
      ?auto_26013 - LOCATION
      ?auto_26012 - CITY
      ?auto_26014 - LOCATION
      ?auto_26015 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_26010 ?auto_26009 ) ) ( not ( = ?auto_26011 ?auto_26009 ) ) ( not ( = ?auto_26011 ?auto_26010 ) ) ( IN-CITY ?auto_26013 ?auto_26012 ) ( IN-CITY ?auto_26008 ?auto_26012 ) ( not ( = ?auto_26008 ?auto_26013 ) ) ( OBJ-AT ?auto_26010 ?auto_26013 ) ( IN-CITY ?auto_26014 ?auto_26012 ) ( not ( = ?auto_26008 ?auto_26014 ) ) ( not ( = ?auto_26013 ?auto_26014 ) ) ( OBJ-AT ?auto_26011 ?auto_26014 ) ( IN-TRUCK ?auto_26009 ?auto_26015 ) ( TRUCK-AT ?auto_26015 ?auto_26013 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_26009 ?auto_26010 ?auto_26008 )
      ( DELIVER-3PKG-VERIFY ?auto_26009 ?auto_26010 ?auto_26011 ?auto_26008 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_26026 - OBJ
      ?auto_26027 - OBJ
      ?auto_26028 - OBJ
      ?auto_26025 - LOCATION
    )
    :vars
    (
      ?auto_26030 - LOCATION
      ?auto_26029 - CITY
      ?auto_26031 - LOCATION
      ?auto_26032 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_26027 ?auto_26026 ) ) ( not ( = ?auto_26028 ?auto_26026 ) ) ( not ( = ?auto_26028 ?auto_26027 ) ) ( IN-CITY ?auto_26030 ?auto_26029 ) ( IN-CITY ?auto_26025 ?auto_26029 ) ( not ( = ?auto_26025 ?auto_26030 ) ) ( OBJ-AT ?auto_26028 ?auto_26030 ) ( IN-CITY ?auto_26031 ?auto_26029 ) ( not ( = ?auto_26025 ?auto_26031 ) ) ( not ( = ?auto_26030 ?auto_26031 ) ) ( OBJ-AT ?auto_26026 ?auto_26031 ) ( IN-TRUCK ?auto_26027 ?auto_26032 ) ( TRUCK-AT ?auto_26032 ?auto_26030 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_26027 ?auto_26028 ?auto_26025 )
      ( DELIVER-3PKG-VERIFY ?auto_26026 ?auto_26027 ?auto_26028 ?auto_26025 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_26043 - OBJ
      ?auto_26044 - OBJ
      ?auto_26045 - OBJ
      ?auto_26042 - LOCATION
    )
    :vars
    (
      ?auto_26047 - LOCATION
      ?auto_26046 - CITY
      ?auto_26048 - LOCATION
      ?auto_26049 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_26044 ?auto_26043 ) ) ( not ( = ?auto_26045 ?auto_26043 ) ) ( not ( = ?auto_26045 ?auto_26044 ) ) ( IN-CITY ?auto_26047 ?auto_26046 ) ( IN-CITY ?auto_26042 ?auto_26046 ) ( not ( = ?auto_26042 ?auto_26047 ) ) ( OBJ-AT ?auto_26044 ?auto_26047 ) ( IN-CITY ?auto_26048 ?auto_26046 ) ( not ( = ?auto_26042 ?auto_26048 ) ) ( not ( = ?auto_26047 ?auto_26048 ) ) ( OBJ-AT ?auto_26043 ?auto_26048 ) ( IN-TRUCK ?auto_26045 ?auto_26049 ) ( TRUCK-AT ?auto_26049 ?auto_26047 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_26045 ?auto_26044 ?auto_26042 )
      ( DELIVER-3PKG-VERIFY ?auto_26043 ?auto_26044 ?auto_26045 ?auto_26042 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_26078 - OBJ
      ?auto_26079 - OBJ
      ?auto_26080 - OBJ
      ?auto_26077 - LOCATION
    )
    :vars
    (
      ?auto_26082 - LOCATION
      ?auto_26081 - CITY
      ?auto_26083 - LOCATION
      ?auto_26084 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_26079 ?auto_26078 ) ) ( not ( = ?auto_26080 ?auto_26078 ) ) ( not ( = ?auto_26080 ?auto_26079 ) ) ( IN-CITY ?auto_26082 ?auto_26081 ) ( IN-CITY ?auto_26077 ?auto_26081 ) ( not ( = ?auto_26077 ?auto_26082 ) ) ( OBJ-AT ?auto_26078 ?auto_26082 ) ( IN-CITY ?auto_26083 ?auto_26081 ) ( not ( = ?auto_26077 ?auto_26083 ) ) ( not ( = ?auto_26082 ?auto_26083 ) ) ( OBJ-AT ?auto_26080 ?auto_26083 ) ( IN-TRUCK ?auto_26079 ?auto_26084 ) ( TRUCK-AT ?auto_26084 ?auto_26082 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_26079 ?auto_26078 ?auto_26077 )
      ( DELIVER-3PKG-VERIFY ?auto_26078 ?auto_26079 ?auto_26080 ?auto_26077 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_26095 - OBJ
      ?auto_26096 - OBJ
      ?auto_26097 - OBJ
      ?auto_26094 - LOCATION
    )
    :vars
    (
      ?auto_26099 - LOCATION
      ?auto_26098 - CITY
      ?auto_26100 - LOCATION
      ?auto_26101 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_26096 ?auto_26095 ) ) ( not ( = ?auto_26097 ?auto_26095 ) ) ( not ( = ?auto_26097 ?auto_26096 ) ) ( IN-CITY ?auto_26099 ?auto_26098 ) ( IN-CITY ?auto_26094 ?auto_26098 ) ( not ( = ?auto_26094 ?auto_26099 ) ) ( OBJ-AT ?auto_26095 ?auto_26099 ) ( IN-CITY ?auto_26100 ?auto_26098 ) ( not ( = ?auto_26094 ?auto_26100 ) ) ( not ( = ?auto_26099 ?auto_26100 ) ) ( OBJ-AT ?auto_26096 ?auto_26100 ) ( IN-TRUCK ?auto_26097 ?auto_26101 ) ( TRUCK-AT ?auto_26101 ?auto_26099 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_26097 ?auto_26095 ?auto_26094 )
      ( DELIVER-3PKG-VERIFY ?auto_26095 ?auto_26096 ?auto_26097 ?auto_26094 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_26764 - OBJ
      ?auto_26763 - LOCATION
    )
    :vars
    (
      ?auto_26770 - OBJ
      ?auto_26766 - LOCATION
      ?auto_26765 - CITY
      ?auto_26767 - OBJ
      ?auto_26768 - LOCATION
      ?auto_26769 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_26764 ?auto_26770 ) ) ( IN-CITY ?auto_26766 ?auto_26765 ) ( IN-CITY ?auto_26763 ?auto_26765 ) ( not ( = ?auto_26763 ?auto_26766 ) ) ( OBJ-AT ?auto_26764 ?auto_26766 ) ( not ( = ?auto_26767 ?auto_26770 ) ) ( not ( = ?auto_26764 ?auto_26767 ) ) ( IN-CITY ?auto_26768 ?auto_26765 ) ( not ( = ?auto_26763 ?auto_26768 ) ) ( not ( = ?auto_26766 ?auto_26768 ) ) ( OBJ-AT ?auto_26767 ?auto_26768 ) ( TRUCK-AT ?auto_26769 ?auto_26766 ) ( OBJ-AT ?auto_26770 ?auto_26766 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_26770 ?auto_26769 ?auto_26766 )
      ( DELIVER-2PKG ?auto_26770 ?auto_26764 ?auto_26763 )
      ( DELIVER-1PKG-VERIFY ?auto_26764 ?auto_26763 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_26772 - OBJ
      ?auto_26773 - OBJ
      ?auto_26771 - LOCATION
    )
    :vars
    (
      ?auto_26778 - LOCATION
      ?auto_26777 - CITY
      ?auto_26774 - OBJ
      ?auto_26775 - LOCATION
      ?auto_26776 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_26773 ?auto_26772 ) ) ( IN-CITY ?auto_26778 ?auto_26777 ) ( IN-CITY ?auto_26771 ?auto_26777 ) ( not ( = ?auto_26771 ?auto_26778 ) ) ( OBJ-AT ?auto_26773 ?auto_26778 ) ( not ( = ?auto_26774 ?auto_26772 ) ) ( not ( = ?auto_26773 ?auto_26774 ) ) ( IN-CITY ?auto_26775 ?auto_26777 ) ( not ( = ?auto_26771 ?auto_26775 ) ) ( not ( = ?auto_26778 ?auto_26775 ) ) ( OBJ-AT ?auto_26774 ?auto_26775 ) ( TRUCK-AT ?auto_26776 ?auto_26778 ) ( OBJ-AT ?auto_26772 ?auto_26778 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_26773 ?auto_26771 )
      ( DELIVER-2PKG-VERIFY ?auto_26772 ?auto_26773 ?auto_26771 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_26780 - OBJ
      ?auto_26781 - OBJ
      ?auto_26779 - LOCATION
    )
    :vars
    (
      ?auto_26786 - OBJ
      ?auto_26782 - LOCATION
      ?auto_26785 - CITY
      ?auto_26783 - LOCATION
      ?auto_26784 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_26781 ?auto_26780 ) ) ( not ( = ?auto_26781 ?auto_26786 ) ) ( IN-CITY ?auto_26782 ?auto_26785 ) ( IN-CITY ?auto_26779 ?auto_26785 ) ( not ( = ?auto_26779 ?auto_26782 ) ) ( OBJ-AT ?auto_26781 ?auto_26782 ) ( not ( = ?auto_26780 ?auto_26786 ) ) ( IN-CITY ?auto_26783 ?auto_26785 ) ( not ( = ?auto_26779 ?auto_26783 ) ) ( not ( = ?auto_26782 ?auto_26783 ) ) ( OBJ-AT ?auto_26780 ?auto_26783 ) ( TRUCK-AT ?auto_26784 ?auto_26782 ) ( OBJ-AT ?auto_26786 ?auto_26782 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_26786 ?auto_26781 ?auto_26779 )
      ( DELIVER-2PKG-VERIFY ?auto_26780 ?auto_26781 ?auto_26779 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_26788 - OBJ
      ?auto_26789 - OBJ
      ?auto_26787 - LOCATION
    )
    :vars
    (
      ?auto_26790 - LOCATION
      ?auto_26794 - CITY
      ?auto_26791 - OBJ
      ?auto_26792 - LOCATION
      ?auto_26793 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_26789 ?auto_26788 ) ) ( IN-CITY ?auto_26790 ?auto_26794 ) ( IN-CITY ?auto_26787 ?auto_26794 ) ( not ( = ?auto_26787 ?auto_26790 ) ) ( OBJ-AT ?auto_26788 ?auto_26790 ) ( not ( = ?auto_26791 ?auto_26789 ) ) ( not ( = ?auto_26788 ?auto_26791 ) ) ( IN-CITY ?auto_26792 ?auto_26794 ) ( not ( = ?auto_26787 ?auto_26792 ) ) ( not ( = ?auto_26790 ?auto_26792 ) ) ( OBJ-AT ?auto_26791 ?auto_26792 ) ( TRUCK-AT ?auto_26793 ?auto_26790 ) ( OBJ-AT ?auto_26789 ?auto_26790 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_26789 ?auto_26788 ?auto_26787 )
      ( DELIVER-2PKG-VERIFY ?auto_26788 ?auto_26789 ?auto_26787 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_26796 - OBJ
      ?auto_26797 - OBJ
      ?auto_26795 - LOCATION
    )
    :vars
    (
      ?auto_26802 - OBJ
      ?auto_26798 - LOCATION
      ?auto_26801 - CITY
      ?auto_26799 - LOCATION
      ?auto_26800 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_26797 ?auto_26796 ) ) ( not ( = ?auto_26796 ?auto_26802 ) ) ( IN-CITY ?auto_26798 ?auto_26801 ) ( IN-CITY ?auto_26795 ?auto_26801 ) ( not ( = ?auto_26795 ?auto_26798 ) ) ( OBJ-AT ?auto_26796 ?auto_26798 ) ( not ( = ?auto_26797 ?auto_26802 ) ) ( IN-CITY ?auto_26799 ?auto_26801 ) ( not ( = ?auto_26795 ?auto_26799 ) ) ( not ( = ?auto_26798 ?auto_26799 ) ) ( OBJ-AT ?auto_26797 ?auto_26799 ) ( TRUCK-AT ?auto_26800 ?auto_26798 ) ( OBJ-AT ?auto_26802 ?auto_26798 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_26802 ?auto_26796 ?auto_26795 )
      ( DELIVER-2PKG-VERIFY ?auto_26796 ?auto_26797 ?auto_26795 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_26822 - OBJ
      ?auto_26823 - OBJ
      ?auto_26824 - OBJ
      ?auto_26821 - LOCATION
    )
    :vars
    (
      ?auto_26825 - LOCATION
      ?auto_26828 - CITY
      ?auto_26826 - LOCATION
      ?auto_26827 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_26823 ?auto_26822 ) ) ( not ( = ?auto_26824 ?auto_26822 ) ) ( not ( = ?auto_26824 ?auto_26823 ) ) ( IN-CITY ?auto_26825 ?auto_26828 ) ( IN-CITY ?auto_26821 ?auto_26828 ) ( not ( = ?auto_26821 ?auto_26825 ) ) ( OBJ-AT ?auto_26824 ?auto_26825 ) ( IN-CITY ?auto_26826 ?auto_26828 ) ( not ( = ?auto_26821 ?auto_26826 ) ) ( not ( = ?auto_26825 ?auto_26826 ) ) ( OBJ-AT ?auto_26823 ?auto_26826 ) ( TRUCK-AT ?auto_26827 ?auto_26825 ) ( OBJ-AT ?auto_26822 ?auto_26825 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_26822 ?auto_26824 ?auto_26821 )
      ( DELIVER-3PKG-VERIFY ?auto_26822 ?auto_26823 ?auto_26824 ?auto_26821 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_26839 - OBJ
      ?auto_26840 - OBJ
      ?auto_26841 - OBJ
      ?auto_26838 - LOCATION
    )
    :vars
    (
      ?auto_26842 - LOCATION
      ?auto_26845 - CITY
      ?auto_26843 - LOCATION
      ?auto_26844 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_26840 ?auto_26839 ) ) ( not ( = ?auto_26841 ?auto_26839 ) ) ( not ( = ?auto_26841 ?auto_26840 ) ) ( IN-CITY ?auto_26842 ?auto_26845 ) ( IN-CITY ?auto_26838 ?auto_26845 ) ( not ( = ?auto_26838 ?auto_26842 ) ) ( OBJ-AT ?auto_26840 ?auto_26842 ) ( IN-CITY ?auto_26843 ?auto_26845 ) ( not ( = ?auto_26838 ?auto_26843 ) ) ( not ( = ?auto_26842 ?auto_26843 ) ) ( OBJ-AT ?auto_26841 ?auto_26843 ) ( TRUCK-AT ?auto_26844 ?auto_26842 ) ( OBJ-AT ?auto_26839 ?auto_26842 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_26839 ?auto_26840 ?auto_26838 )
      ( DELIVER-3PKG-VERIFY ?auto_26839 ?auto_26840 ?auto_26841 ?auto_26838 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_26856 - OBJ
      ?auto_26857 - OBJ
      ?auto_26858 - OBJ
      ?auto_26855 - LOCATION
    )
    :vars
    (
      ?auto_26859 - LOCATION
      ?auto_26862 - CITY
      ?auto_26860 - LOCATION
      ?auto_26861 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_26857 ?auto_26856 ) ) ( not ( = ?auto_26858 ?auto_26856 ) ) ( not ( = ?auto_26858 ?auto_26857 ) ) ( IN-CITY ?auto_26859 ?auto_26862 ) ( IN-CITY ?auto_26855 ?auto_26862 ) ( not ( = ?auto_26855 ?auto_26859 ) ) ( OBJ-AT ?auto_26858 ?auto_26859 ) ( IN-CITY ?auto_26860 ?auto_26862 ) ( not ( = ?auto_26855 ?auto_26860 ) ) ( not ( = ?auto_26859 ?auto_26860 ) ) ( OBJ-AT ?auto_26856 ?auto_26860 ) ( TRUCK-AT ?auto_26861 ?auto_26859 ) ( OBJ-AT ?auto_26857 ?auto_26859 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_26857 ?auto_26858 ?auto_26855 )
      ( DELIVER-3PKG-VERIFY ?auto_26856 ?auto_26857 ?auto_26858 ?auto_26855 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_26873 - OBJ
      ?auto_26874 - OBJ
      ?auto_26875 - OBJ
      ?auto_26872 - LOCATION
    )
    :vars
    (
      ?auto_26876 - LOCATION
      ?auto_26879 - CITY
      ?auto_26877 - LOCATION
      ?auto_26878 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_26874 ?auto_26873 ) ) ( not ( = ?auto_26875 ?auto_26873 ) ) ( not ( = ?auto_26875 ?auto_26874 ) ) ( IN-CITY ?auto_26876 ?auto_26879 ) ( IN-CITY ?auto_26872 ?auto_26879 ) ( not ( = ?auto_26872 ?auto_26876 ) ) ( OBJ-AT ?auto_26874 ?auto_26876 ) ( IN-CITY ?auto_26877 ?auto_26879 ) ( not ( = ?auto_26872 ?auto_26877 ) ) ( not ( = ?auto_26876 ?auto_26877 ) ) ( OBJ-AT ?auto_26873 ?auto_26877 ) ( TRUCK-AT ?auto_26878 ?auto_26876 ) ( OBJ-AT ?auto_26875 ?auto_26876 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_26875 ?auto_26874 ?auto_26872 )
      ( DELIVER-3PKG-VERIFY ?auto_26873 ?auto_26874 ?auto_26875 ?auto_26872 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_26908 - OBJ
      ?auto_26909 - OBJ
      ?auto_26910 - OBJ
      ?auto_26907 - LOCATION
    )
    :vars
    (
      ?auto_26911 - LOCATION
      ?auto_26914 - CITY
      ?auto_26912 - LOCATION
      ?auto_26913 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_26909 ?auto_26908 ) ) ( not ( = ?auto_26910 ?auto_26908 ) ) ( not ( = ?auto_26910 ?auto_26909 ) ) ( IN-CITY ?auto_26911 ?auto_26914 ) ( IN-CITY ?auto_26907 ?auto_26914 ) ( not ( = ?auto_26907 ?auto_26911 ) ) ( OBJ-AT ?auto_26908 ?auto_26911 ) ( IN-CITY ?auto_26912 ?auto_26914 ) ( not ( = ?auto_26907 ?auto_26912 ) ) ( not ( = ?auto_26911 ?auto_26912 ) ) ( OBJ-AT ?auto_26910 ?auto_26912 ) ( TRUCK-AT ?auto_26913 ?auto_26911 ) ( OBJ-AT ?auto_26909 ?auto_26911 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_26909 ?auto_26908 ?auto_26907 )
      ( DELIVER-3PKG-VERIFY ?auto_26908 ?auto_26909 ?auto_26910 ?auto_26907 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_26925 - OBJ
      ?auto_26926 - OBJ
      ?auto_26927 - OBJ
      ?auto_26924 - LOCATION
    )
    :vars
    (
      ?auto_26928 - LOCATION
      ?auto_26931 - CITY
      ?auto_26929 - LOCATION
      ?auto_26930 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_26926 ?auto_26925 ) ) ( not ( = ?auto_26927 ?auto_26925 ) ) ( not ( = ?auto_26927 ?auto_26926 ) ) ( IN-CITY ?auto_26928 ?auto_26931 ) ( IN-CITY ?auto_26924 ?auto_26931 ) ( not ( = ?auto_26924 ?auto_26928 ) ) ( OBJ-AT ?auto_26925 ?auto_26928 ) ( IN-CITY ?auto_26929 ?auto_26931 ) ( not ( = ?auto_26924 ?auto_26929 ) ) ( not ( = ?auto_26928 ?auto_26929 ) ) ( OBJ-AT ?auto_26926 ?auto_26929 ) ( TRUCK-AT ?auto_26930 ?auto_26928 ) ( OBJ-AT ?auto_26927 ?auto_26928 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_26927 ?auto_26925 ?auto_26924 )
      ( DELIVER-3PKG-VERIFY ?auto_26925 ?auto_26926 ?auto_26927 ?auto_26924 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_27594 - OBJ
      ?auto_27593 - LOCATION
    )
    :vars
    (
      ?auto_27600 - OBJ
      ?auto_27595 - LOCATION
      ?auto_27599 - CITY
      ?auto_27596 - OBJ
      ?auto_27597 - LOCATION
      ?auto_27598 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_27594 ?auto_27600 ) ) ( IN-CITY ?auto_27595 ?auto_27599 ) ( IN-CITY ?auto_27593 ?auto_27599 ) ( not ( = ?auto_27593 ?auto_27595 ) ) ( OBJ-AT ?auto_27594 ?auto_27595 ) ( not ( = ?auto_27596 ?auto_27600 ) ) ( not ( = ?auto_27594 ?auto_27596 ) ) ( IN-CITY ?auto_27597 ?auto_27599 ) ( not ( = ?auto_27593 ?auto_27597 ) ) ( not ( = ?auto_27595 ?auto_27597 ) ) ( OBJ-AT ?auto_27596 ?auto_27597 ) ( OBJ-AT ?auto_27600 ?auto_27595 ) ( TRUCK-AT ?auto_27598 ?auto_27593 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_27598 ?auto_27593 ?auto_27595 ?auto_27599 )
      ( DELIVER-2PKG ?auto_27600 ?auto_27594 ?auto_27593 )
      ( DELIVER-1PKG-VERIFY ?auto_27594 ?auto_27593 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_27602 - OBJ
      ?auto_27603 - OBJ
      ?auto_27601 - LOCATION
    )
    :vars
    (
      ?auto_27606 - LOCATION
      ?auto_27604 - CITY
      ?auto_27607 - OBJ
      ?auto_27605 - LOCATION
      ?auto_27608 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_27603 ?auto_27602 ) ) ( IN-CITY ?auto_27606 ?auto_27604 ) ( IN-CITY ?auto_27601 ?auto_27604 ) ( not ( = ?auto_27601 ?auto_27606 ) ) ( OBJ-AT ?auto_27603 ?auto_27606 ) ( not ( = ?auto_27607 ?auto_27602 ) ) ( not ( = ?auto_27603 ?auto_27607 ) ) ( IN-CITY ?auto_27605 ?auto_27604 ) ( not ( = ?auto_27601 ?auto_27605 ) ) ( not ( = ?auto_27606 ?auto_27605 ) ) ( OBJ-AT ?auto_27607 ?auto_27605 ) ( OBJ-AT ?auto_27602 ?auto_27606 ) ( TRUCK-AT ?auto_27608 ?auto_27601 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_27603 ?auto_27601 )
      ( DELIVER-2PKG-VERIFY ?auto_27602 ?auto_27603 ?auto_27601 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_27610 - OBJ
      ?auto_27611 - OBJ
      ?auto_27609 - LOCATION
    )
    :vars
    (
      ?auto_27616 - OBJ
      ?auto_27612 - LOCATION
      ?auto_27614 - CITY
      ?auto_27613 - LOCATION
      ?auto_27615 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_27611 ?auto_27610 ) ) ( not ( = ?auto_27611 ?auto_27616 ) ) ( IN-CITY ?auto_27612 ?auto_27614 ) ( IN-CITY ?auto_27609 ?auto_27614 ) ( not ( = ?auto_27609 ?auto_27612 ) ) ( OBJ-AT ?auto_27611 ?auto_27612 ) ( not ( = ?auto_27610 ?auto_27616 ) ) ( IN-CITY ?auto_27613 ?auto_27614 ) ( not ( = ?auto_27609 ?auto_27613 ) ) ( not ( = ?auto_27612 ?auto_27613 ) ) ( OBJ-AT ?auto_27610 ?auto_27613 ) ( OBJ-AT ?auto_27616 ?auto_27612 ) ( TRUCK-AT ?auto_27615 ?auto_27609 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_27616 ?auto_27611 ?auto_27609 )
      ( DELIVER-2PKG-VERIFY ?auto_27610 ?auto_27611 ?auto_27609 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_27618 - OBJ
      ?auto_27619 - OBJ
      ?auto_27617 - LOCATION
    )
    :vars
    (
      ?auto_27621 - LOCATION
      ?auto_27623 - CITY
      ?auto_27620 - OBJ
      ?auto_27622 - LOCATION
      ?auto_27624 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_27619 ?auto_27618 ) ) ( IN-CITY ?auto_27621 ?auto_27623 ) ( IN-CITY ?auto_27617 ?auto_27623 ) ( not ( = ?auto_27617 ?auto_27621 ) ) ( OBJ-AT ?auto_27618 ?auto_27621 ) ( not ( = ?auto_27620 ?auto_27619 ) ) ( not ( = ?auto_27618 ?auto_27620 ) ) ( IN-CITY ?auto_27622 ?auto_27623 ) ( not ( = ?auto_27617 ?auto_27622 ) ) ( not ( = ?auto_27621 ?auto_27622 ) ) ( OBJ-AT ?auto_27620 ?auto_27622 ) ( OBJ-AT ?auto_27619 ?auto_27621 ) ( TRUCK-AT ?auto_27624 ?auto_27617 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_27619 ?auto_27618 ?auto_27617 )
      ( DELIVER-2PKG-VERIFY ?auto_27618 ?auto_27619 ?auto_27617 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_27626 - OBJ
      ?auto_27627 - OBJ
      ?auto_27625 - LOCATION
    )
    :vars
    (
      ?auto_27632 - OBJ
      ?auto_27628 - LOCATION
      ?auto_27630 - CITY
      ?auto_27629 - LOCATION
      ?auto_27631 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_27627 ?auto_27626 ) ) ( not ( = ?auto_27626 ?auto_27632 ) ) ( IN-CITY ?auto_27628 ?auto_27630 ) ( IN-CITY ?auto_27625 ?auto_27630 ) ( not ( = ?auto_27625 ?auto_27628 ) ) ( OBJ-AT ?auto_27626 ?auto_27628 ) ( not ( = ?auto_27627 ?auto_27632 ) ) ( IN-CITY ?auto_27629 ?auto_27630 ) ( not ( = ?auto_27625 ?auto_27629 ) ) ( not ( = ?auto_27628 ?auto_27629 ) ) ( OBJ-AT ?auto_27627 ?auto_27629 ) ( OBJ-AT ?auto_27632 ?auto_27628 ) ( TRUCK-AT ?auto_27631 ?auto_27625 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_27632 ?auto_27626 ?auto_27625 )
      ( DELIVER-2PKG-VERIFY ?auto_27626 ?auto_27627 ?auto_27625 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_27652 - OBJ
      ?auto_27653 - OBJ
      ?auto_27654 - OBJ
      ?auto_27651 - LOCATION
    )
    :vars
    (
      ?auto_27655 - LOCATION
      ?auto_27657 - CITY
      ?auto_27656 - LOCATION
      ?auto_27658 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_27653 ?auto_27652 ) ) ( not ( = ?auto_27654 ?auto_27652 ) ) ( not ( = ?auto_27654 ?auto_27653 ) ) ( IN-CITY ?auto_27655 ?auto_27657 ) ( IN-CITY ?auto_27651 ?auto_27657 ) ( not ( = ?auto_27651 ?auto_27655 ) ) ( OBJ-AT ?auto_27654 ?auto_27655 ) ( IN-CITY ?auto_27656 ?auto_27657 ) ( not ( = ?auto_27651 ?auto_27656 ) ) ( not ( = ?auto_27655 ?auto_27656 ) ) ( OBJ-AT ?auto_27653 ?auto_27656 ) ( OBJ-AT ?auto_27652 ?auto_27655 ) ( TRUCK-AT ?auto_27658 ?auto_27651 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_27652 ?auto_27654 ?auto_27651 )
      ( DELIVER-3PKG-VERIFY ?auto_27652 ?auto_27653 ?auto_27654 ?auto_27651 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_27669 - OBJ
      ?auto_27670 - OBJ
      ?auto_27671 - OBJ
      ?auto_27668 - LOCATION
    )
    :vars
    (
      ?auto_27672 - LOCATION
      ?auto_27674 - CITY
      ?auto_27673 - LOCATION
      ?auto_27675 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_27670 ?auto_27669 ) ) ( not ( = ?auto_27671 ?auto_27669 ) ) ( not ( = ?auto_27671 ?auto_27670 ) ) ( IN-CITY ?auto_27672 ?auto_27674 ) ( IN-CITY ?auto_27668 ?auto_27674 ) ( not ( = ?auto_27668 ?auto_27672 ) ) ( OBJ-AT ?auto_27670 ?auto_27672 ) ( IN-CITY ?auto_27673 ?auto_27674 ) ( not ( = ?auto_27668 ?auto_27673 ) ) ( not ( = ?auto_27672 ?auto_27673 ) ) ( OBJ-AT ?auto_27671 ?auto_27673 ) ( OBJ-AT ?auto_27669 ?auto_27672 ) ( TRUCK-AT ?auto_27675 ?auto_27668 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_27669 ?auto_27670 ?auto_27668 )
      ( DELIVER-3PKG-VERIFY ?auto_27669 ?auto_27670 ?auto_27671 ?auto_27668 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_27686 - OBJ
      ?auto_27687 - OBJ
      ?auto_27688 - OBJ
      ?auto_27685 - LOCATION
    )
    :vars
    (
      ?auto_27689 - LOCATION
      ?auto_27691 - CITY
      ?auto_27690 - LOCATION
      ?auto_27692 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_27687 ?auto_27686 ) ) ( not ( = ?auto_27688 ?auto_27686 ) ) ( not ( = ?auto_27688 ?auto_27687 ) ) ( IN-CITY ?auto_27689 ?auto_27691 ) ( IN-CITY ?auto_27685 ?auto_27691 ) ( not ( = ?auto_27685 ?auto_27689 ) ) ( OBJ-AT ?auto_27688 ?auto_27689 ) ( IN-CITY ?auto_27690 ?auto_27691 ) ( not ( = ?auto_27685 ?auto_27690 ) ) ( not ( = ?auto_27689 ?auto_27690 ) ) ( OBJ-AT ?auto_27686 ?auto_27690 ) ( OBJ-AT ?auto_27687 ?auto_27689 ) ( TRUCK-AT ?auto_27692 ?auto_27685 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_27687 ?auto_27688 ?auto_27685 )
      ( DELIVER-3PKG-VERIFY ?auto_27686 ?auto_27687 ?auto_27688 ?auto_27685 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_27703 - OBJ
      ?auto_27704 - OBJ
      ?auto_27705 - OBJ
      ?auto_27702 - LOCATION
    )
    :vars
    (
      ?auto_27706 - LOCATION
      ?auto_27708 - CITY
      ?auto_27707 - LOCATION
      ?auto_27709 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_27704 ?auto_27703 ) ) ( not ( = ?auto_27705 ?auto_27703 ) ) ( not ( = ?auto_27705 ?auto_27704 ) ) ( IN-CITY ?auto_27706 ?auto_27708 ) ( IN-CITY ?auto_27702 ?auto_27708 ) ( not ( = ?auto_27702 ?auto_27706 ) ) ( OBJ-AT ?auto_27704 ?auto_27706 ) ( IN-CITY ?auto_27707 ?auto_27708 ) ( not ( = ?auto_27702 ?auto_27707 ) ) ( not ( = ?auto_27706 ?auto_27707 ) ) ( OBJ-AT ?auto_27703 ?auto_27707 ) ( OBJ-AT ?auto_27705 ?auto_27706 ) ( TRUCK-AT ?auto_27709 ?auto_27702 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_27705 ?auto_27704 ?auto_27702 )
      ( DELIVER-3PKG-VERIFY ?auto_27703 ?auto_27704 ?auto_27705 ?auto_27702 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_27738 - OBJ
      ?auto_27739 - OBJ
      ?auto_27740 - OBJ
      ?auto_27737 - LOCATION
    )
    :vars
    (
      ?auto_27741 - LOCATION
      ?auto_27743 - CITY
      ?auto_27742 - LOCATION
      ?auto_27744 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_27739 ?auto_27738 ) ) ( not ( = ?auto_27740 ?auto_27738 ) ) ( not ( = ?auto_27740 ?auto_27739 ) ) ( IN-CITY ?auto_27741 ?auto_27743 ) ( IN-CITY ?auto_27737 ?auto_27743 ) ( not ( = ?auto_27737 ?auto_27741 ) ) ( OBJ-AT ?auto_27738 ?auto_27741 ) ( IN-CITY ?auto_27742 ?auto_27743 ) ( not ( = ?auto_27737 ?auto_27742 ) ) ( not ( = ?auto_27741 ?auto_27742 ) ) ( OBJ-AT ?auto_27740 ?auto_27742 ) ( OBJ-AT ?auto_27739 ?auto_27741 ) ( TRUCK-AT ?auto_27744 ?auto_27737 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_27739 ?auto_27738 ?auto_27737 )
      ( DELIVER-3PKG-VERIFY ?auto_27738 ?auto_27739 ?auto_27740 ?auto_27737 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_27755 - OBJ
      ?auto_27756 - OBJ
      ?auto_27757 - OBJ
      ?auto_27754 - LOCATION
    )
    :vars
    (
      ?auto_27758 - LOCATION
      ?auto_27760 - CITY
      ?auto_27759 - LOCATION
      ?auto_27761 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_27756 ?auto_27755 ) ) ( not ( = ?auto_27757 ?auto_27755 ) ) ( not ( = ?auto_27757 ?auto_27756 ) ) ( IN-CITY ?auto_27758 ?auto_27760 ) ( IN-CITY ?auto_27754 ?auto_27760 ) ( not ( = ?auto_27754 ?auto_27758 ) ) ( OBJ-AT ?auto_27755 ?auto_27758 ) ( IN-CITY ?auto_27759 ?auto_27760 ) ( not ( = ?auto_27754 ?auto_27759 ) ) ( not ( = ?auto_27758 ?auto_27759 ) ) ( OBJ-AT ?auto_27756 ?auto_27759 ) ( OBJ-AT ?auto_27757 ?auto_27758 ) ( TRUCK-AT ?auto_27761 ?auto_27754 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_27757 ?auto_27755 ?auto_27754 )
      ( DELIVER-3PKG-VERIFY ?auto_27755 ?auto_27756 ?auto_27757 ?auto_27754 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_29470 - OBJ
      ?auto_29469 - LOCATION
    )
    :vars
    (
      ?auto_29471 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_29471 ?auto_29469 ) ( IN-TRUCK ?auto_29470 ?auto_29471 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_29470 ?auto_29471 ?auto_29469 )
      ( DELIVER-1PKG-VERIFY ?auto_29470 ?auto_29469 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_29473 - OBJ
      ?auto_29474 - OBJ
      ?auto_29472 - LOCATION
    )
    :vars
    (
      ?auto_29475 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29474 ?auto_29473 ) ) ( TRUCK-AT ?auto_29475 ?auto_29472 ) ( IN-TRUCK ?auto_29474 ?auto_29475 ) ( OBJ-AT ?auto_29473 ?auto_29472 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29474 ?auto_29472 )
      ( DELIVER-2PKG-VERIFY ?auto_29473 ?auto_29474 ?auto_29472 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_29477 - OBJ
      ?auto_29478 - OBJ
      ?auto_29476 - LOCATION
    )
    :vars
    (
      ?auto_29479 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29478 ?auto_29477 ) ) ( TRUCK-AT ?auto_29479 ?auto_29476 ) ( IN-TRUCK ?auto_29478 ?auto_29479 ) ( OBJ-AT ?auto_29477 ?auto_29476 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29478 ?auto_29476 )
      ( DELIVER-2PKG-VERIFY ?auto_29477 ?auto_29478 ?auto_29476 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_29481 - OBJ
      ?auto_29482 - OBJ
      ?auto_29480 - LOCATION
    )
    :vars
    (
      ?auto_29483 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29482 ?auto_29481 ) ) ( TRUCK-AT ?auto_29483 ?auto_29480 ) ( IN-TRUCK ?auto_29482 ?auto_29483 ) ( OBJ-AT ?auto_29481 ?auto_29480 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29482 ?auto_29480 )
      ( DELIVER-2PKG-VERIFY ?auto_29481 ?auto_29482 ?auto_29480 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_29485 - OBJ
      ?auto_29486 - OBJ
      ?auto_29484 - LOCATION
    )
    :vars
    (
      ?auto_29487 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29486 ?auto_29485 ) ) ( TRUCK-AT ?auto_29487 ?auto_29484 ) ( IN-TRUCK ?auto_29485 ?auto_29487 ) ( OBJ-AT ?auto_29486 ?auto_29484 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29485 ?auto_29484 )
      ( DELIVER-2PKG-VERIFY ?auto_29485 ?auto_29486 ?auto_29484 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_29489 - OBJ
      ?auto_29490 - OBJ
      ?auto_29488 - LOCATION
    )
    :vars
    (
      ?auto_29491 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29490 ?auto_29489 ) ) ( TRUCK-AT ?auto_29491 ?auto_29488 ) ( IN-TRUCK ?auto_29489 ?auto_29491 ) ( OBJ-AT ?auto_29490 ?auto_29488 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29489 ?auto_29488 )
      ( DELIVER-2PKG-VERIFY ?auto_29489 ?auto_29490 ?auto_29488 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_29493 - OBJ
      ?auto_29494 - OBJ
      ?auto_29492 - LOCATION
    )
    :vars
    (
      ?auto_29495 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29494 ?auto_29493 ) ) ( TRUCK-AT ?auto_29495 ?auto_29492 ) ( IN-TRUCK ?auto_29493 ?auto_29495 ) ( OBJ-AT ?auto_29494 ?auto_29492 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29493 ?auto_29492 )
      ( DELIVER-2PKG-VERIFY ?auto_29493 ?auto_29494 ?auto_29492 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_29506 - OBJ
      ?auto_29507 - OBJ
      ?auto_29508 - OBJ
      ?auto_29505 - LOCATION
    )
    :vars
    (
      ?auto_29509 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29507 ?auto_29506 ) ) ( not ( = ?auto_29508 ?auto_29506 ) ) ( not ( = ?auto_29508 ?auto_29507 ) ) ( TRUCK-AT ?auto_29509 ?auto_29505 ) ( IN-TRUCK ?auto_29508 ?auto_29509 ) ( OBJ-AT ?auto_29506 ?auto_29505 ) ( OBJ-AT ?auto_29507 ?auto_29505 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29508 ?auto_29505 )
      ( DELIVER-3PKG-VERIFY ?auto_29506 ?auto_29507 ?auto_29508 ?auto_29505 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_29511 - OBJ
      ?auto_29512 - OBJ
      ?auto_29513 - OBJ
      ?auto_29510 - LOCATION
    )
    :vars
    (
      ?auto_29514 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29512 ?auto_29511 ) ) ( not ( = ?auto_29513 ?auto_29511 ) ) ( not ( = ?auto_29513 ?auto_29512 ) ) ( TRUCK-AT ?auto_29514 ?auto_29510 ) ( IN-TRUCK ?auto_29513 ?auto_29514 ) ( OBJ-AT ?auto_29511 ?auto_29510 ) ( OBJ-AT ?auto_29512 ?auto_29510 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29513 ?auto_29510 )
      ( DELIVER-3PKG-VERIFY ?auto_29511 ?auto_29512 ?auto_29513 ?auto_29510 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_29521 - OBJ
      ?auto_29522 - OBJ
      ?auto_29523 - OBJ
      ?auto_29520 - LOCATION
    )
    :vars
    (
      ?auto_29524 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29522 ?auto_29521 ) ) ( not ( = ?auto_29523 ?auto_29521 ) ) ( not ( = ?auto_29523 ?auto_29522 ) ) ( TRUCK-AT ?auto_29524 ?auto_29520 ) ( IN-TRUCK ?auto_29522 ?auto_29524 ) ( OBJ-AT ?auto_29521 ?auto_29520 ) ( OBJ-AT ?auto_29523 ?auto_29520 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29522 ?auto_29520 )
      ( DELIVER-3PKG-VERIFY ?auto_29521 ?auto_29522 ?auto_29523 ?auto_29520 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_29526 - OBJ
      ?auto_29527 - OBJ
      ?auto_29528 - OBJ
      ?auto_29525 - LOCATION
    )
    :vars
    (
      ?auto_29529 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29527 ?auto_29526 ) ) ( not ( = ?auto_29528 ?auto_29526 ) ) ( not ( = ?auto_29528 ?auto_29527 ) ) ( TRUCK-AT ?auto_29529 ?auto_29525 ) ( IN-TRUCK ?auto_29527 ?auto_29529 ) ( OBJ-AT ?auto_29526 ?auto_29525 ) ( OBJ-AT ?auto_29528 ?auto_29525 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29527 ?auto_29525 )
      ( DELIVER-3PKG-VERIFY ?auto_29526 ?auto_29527 ?auto_29528 ?auto_29525 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_29536 - OBJ
      ?auto_29537 - OBJ
      ?auto_29538 - OBJ
      ?auto_29535 - LOCATION
    )
    :vars
    (
      ?auto_29539 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29537 ?auto_29536 ) ) ( not ( = ?auto_29538 ?auto_29536 ) ) ( not ( = ?auto_29538 ?auto_29537 ) ) ( TRUCK-AT ?auto_29539 ?auto_29535 ) ( IN-TRUCK ?auto_29538 ?auto_29539 ) ( OBJ-AT ?auto_29536 ?auto_29535 ) ( OBJ-AT ?auto_29537 ?auto_29535 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29538 ?auto_29535 )
      ( DELIVER-3PKG-VERIFY ?auto_29536 ?auto_29537 ?auto_29538 ?auto_29535 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_29546 - OBJ
      ?auto_29547 - OBJ
      ?auto_29548 - OBJ
      ?auto_29545 - LOCATION
    )
    :vars
    (
      ?auto_29549 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29547 ?auto_29546 ) ) ( not ( = ?auto_29548 ?auto_29546 ) ) ( not ( = ?auto_29548 ?auto_29547 ) ) ( TRUCK-AT ?auto_29549 ?auto_29545 ) ( IN-TRUCK ?auto_29548 ?auto_29549 ) ( OBJ-AT ?auto_29546 ?auto_29545 ) ( OBJ-AT ?auto_29547 ?auto_29545 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29548 ?auto_29545 )
      ( DELIVER-3PKG-VERIFY ?auto_29546 ?auto_29547 ?auto_29548 ?auto_29545 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_29551 - OBJ
      ?auto_29552 - OBJ
      ?auto_29553 - OBJ
      ?auto_29550 - LOCATION
    )
    :vars
    (
      ?auto_29554 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29552 ?auto_29551 ) ) ( not ( = ?auto_29553 ?auto_29551 ) ) ( not ( = ?auto_29553 ?auto_29552 ) ) ( TRUCK-AT ?auto_29554 ?auto_29550 ) ( IN-TRUCK ?auto_29552 ?auto_29554 ) ( OBJ-AT ?auto_29551 ?auto_29550 ) ( OBJ-AT ?auto_29553 ?auto_29550 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29552 ?auto_29550 )
      ( DELIVER-3PKG-VERIFY ?auto_29551 ?auto_29552 ?auto_29553 ?auto_29550 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_29561 - OBJ
      ?auto_29562 - OBJ
      ?auto_29563 - OBJ
      ?auto_29560 - LOCATION
    )
    :vars
    (
      ?auto_29564 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29562 ?auto_29561 ) ) ( not ( = ?auto_29563 ?auto_29561 ) ) ( not ( = ?auto_29563 ?auto_29562 ) ) ( TRUCK-AT ?auto_29564 ?auto_29560 ) ( IN-TRUCK ?auto_29562 ?auto_29564 ) ( OBJ-AT ?auto_29561 ?auto_29560 ) ( OBJ-AT ?auto_29563 ?auto_29560 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29562 ?auto_29560 )
      ( DELIVER-3PKG-VERIFY ?auto_29561 ?auto_29562 ?auto_29563 ?auto_29560 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_29571 - OBJ
      ?auto_29572 - OBJ
      ?auto_29573 - OBJ
      ?auto_29570 - LOCATION
    )
    :vars
    (
      ?auto_29574 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29572 ?auto_29571 ) ) ( not ( = ?auto_29573 ?auto_29571 ) ) ( not ( = ?auto_29573 ?auto_29572 ) ) ( TRUCK-AT ?auto_29574 ?auto_29570 ) ( IN-TRUCK ?auto_29573 ?auto_29574 ) ( OBJ-AT ?auto_29571 ?auto_29570 ) ( OBJ-AT ?auto_29572 ?auto_29570 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29573 ?auto_29570 )
      ( DELIVER-3PKG-VERIFY ?auto_29571 ?auto_29572 ?auto_29573 ?auto_29570 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_29576 - OBJ
      ?auto_29577 - OBJ
      ?auto_29578 - OBJ
      ?auto_29575 - LOCATION
    )
    :vars
    (
      ?auto_29579 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29577 ?auto_29576 ) ) ( not ( = ?auto_29578 ?auto_29576 ) ) ( not ( = ?auto_29578 ?auto_29577 ) ) ( TRUCK-AT ?auto_29579 ?auto_29575 ) ( IN-TRUCK ?auto_29578 ?auto_29579 ) ( OBJ-AT ?auto_29576 ?auto_29575 ) ( OBJ-AT ?auto_29577 ?auto_29575 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29578 ?auto_29575 )
      ( DELIVER-3PKG-VERIFY ?auto_29576 ?auto_29577 ?auto_29578 ?auto_29575 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_29586 - OBJ
      ?auto_29587 - OBJ
      ?auto_29588 - OBJ
      ?auto_29585 - LOCATION
    )
    :vars
    (
      ?auto_29589 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29587 ?auto_29586 ) ) ( not ( = ?auto_29588 ?auto_29586 ) ) ( not ( = ?auto_29588 ?auto_29587 ) ) ( TRUCK-AT ?auto_29589 ?auto_29585 ) ( IN-TRUCK ?auto_29587 ?auto_29589 ) ( OBJ-AT ?auto_29586 ?auto_29585 ) ( OBJ-AT ?auto_29588 ?auto_29585 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29587 ?auto_29585 )
      ( DELIVER-3PKG-VERIFY ?auto_29586 ?auto_29587 ?auto_29588 ?auto_29585 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_29591 - OBJ
      ?auto_29592 - OBJ
      ?auto_29593 - OBJ
      ?auto_29590 - LOCATION
    )
    :vars
    (
      ?auto_29594 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29592 ?auto_29591 ) ) ( not ( = ?auto_29593 ?auto_29591 ) ) ( not ( = ?auto_29593 ?auto_29592 ) ) ( TRUCK-AT ?auto_29594 ?auto_29590 ) ( IN-TRUCK ?auto_29592 ?auto_29594 ) ( OBJ-AT ?auto_29591 ?auto_29590 ) ( OBJ-AT ?auto_29593 ?auto_29590 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29592 ?auto_29590 )
      ( DELIVER-3PKG-VERIFY ?auto_29591 ?auto_29592 ?auto_29593 ?auto_29590 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_29611 - OBJ
      ?auto_29612 - OBJ
      ?auto_29613 - OBJ
      ?auto_29610 - LOCATION
    )
    :vars
    (
      ?auto_29614 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29612 ?auto_29611 ) ) ( not ( = ?auto_29613 ?auto_29611 ) ) ( not ( = ?auto_29613 ?auto_29612 ) ) ( TRUCK-AT ?auto_29614 ?auto_29610 ) ( IN-TRUCK ?auto_29611 ?auto_29614 ) ( OBJ-AT ?auto_29612 ?auto_29610 ) ( OBJ-AT ?auto_29613 ?auto_29610 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29611 ?auto_29610 )
      ( DELIVER-3PKG-VERIFY ?auto_29611 ?auto_29612 ?auto_29613 ?auto_29610 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_29616 - OBJ
      ?auto_29617 - OBJ
      ?auto_29618 - OBJ
      ?auto_29615 - LOCATION
    )
    :vars
    (
      ?auto_29619 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29617 ?auto_29616 ) ) ( not ( = ?auto_29618 ?auto_29616 ) ) ( not ( = ?auto_29618 ?auto_29617 ) ) ( TRUCK-AT ?auto_29619 ?auto_29615 ) ( IN-TRUCK ?auto_29616 ?auto_29619 ) ( OBJ-AT ?auto_29617 ?auto_29615 ) ( OBJ-AT ?auto_29618 ?auto_29615 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29616 ?auto_29615 )
      ( DELIVER-3PKG-VERIFY ?auto_29616 ?auto_29617 ?auto_29618 ?auto_29615 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_29626 - OBJ
      ?auto_29627 - OBJ
      ?auto_29628 - OBJ
      ?auto_29625 - LOCATION
    )
    :vars
    (
      ?auto_29629 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29627 ?auto_29626 ) ) ( not ( = ?auto_29628 ?auto_29626 ) ) ( not ( = ?auto_29628 ?auto_29627 ) ) ( TRUCK-AT ?auto_29629 ?auto_29625 ) ( IN-TRUCK ?auto_29626 ?auto_29629 ) ( OBJ-AT ?auto_29627 ?auto_29625 ) ( OBJ-AT ?auto_29628 ?auto_29625 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29626 ?auto_29625 )
      ( DELIVER-3PKG-VERIFY ?auto_29626 ?auto_29627 ?auto_29628 ?auto_29625 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_29636 - OBJ
      ?auto_29637 - OBJ
      ?auto_29638 - OBJ
      ?auto_29635 - LOCATION
    )
    :vars
    (
      ?auto_29639 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29637 ?auto_29636 ) ) ( not ( = ?auto_29638 ?auto_29636 ) ) ( not ( = ?auto_29638 ?auto_29637 ) ) ( TRUCK-AT ?auto_29639 ?auto_29635 ) ( IN-TRUCK ?auto_29636 ?auto_29639 ) ( OBJ-AT ?auto_29637 ?auto_29635 ) ( OBJ-AT ?auto_29638 ?auto_29635 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29636 ?auto_29635 )
      ( DELIVER-3PKG-VERIFY ?auto_29636 ?auto_29637 ?auto_29638 ?auto_29635 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_29646 - OBJ
      ?auto_29647 - OBJ
      ?auto_29648 - OBJ
      ?auto_29645 - LOCATION
    )
    :vars
    (
      ?auto_29649 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29647 ?auto_29646 ) ) ( not ( = ?auto_29648 ?auto_29646 ) ) ( not ( = ?auto_29648 ?auto_29647 ) ) ( TRUCK-AT ?auto_29649 ?auto_29645 ) ( IN-TRUCK ?auto_29646 ?auto_29649 ) ( OBJ-AT ?auto_29647 ?auto_29645 ) ( OBJ-AT ?auto_29648 ?auto_29645 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29646 ?auto_29645 )
      ( DELIVER-3PKG-VERIFY ?auto_29646 ?auto_29647 ?auto_29648 ?auto_29645 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_29651 - OBJ
      ?auto_29652 - OBJ
      ?auto_29653 - OBJ
      ?auto_29650 - LOCATION
    )
    :vars
    (
      ?auto_29654 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29652 ?auto_29651 ) ) ( not ( = ?auto_29653 ?auto_29651 ) ) ( not ( = ?auto_29653 ?auto_29652 ) ) ( TRUCK-AT ?auto_29654 ?auto_29650 ) ( IN-TRUCK ?auto_29651 ?auto_29654 ) ( OBJ-AT ?auto_29652 ?auto_29650 ) ( OBJ-AT ?auto_29653 ?auto_29650 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29651 ?auto_29650 )
      ( DELIVER-3PKG-VERIFY ?auto_29651 ?auto_29652 ?auto_29653 ?auto_29650 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_29740 - OBJ
      ?auto_29741 - OBJ
      ?auto_29742 - OBJ
      ?auto_29743 - OBJ
      ?auto_29739 - LOCATION
    )
    :vars
    (
      ?auto_29744 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29741 ?auto_29740 ) ) ( not ( = ?auto_29742 ?auto_29740 ) ) ( not ( = ?auto_29742 ?auto_29741 ) ) ( not ( = ?auto_29743 ?auto_29740 ) ) ( not ( = ?auto_29743 ?auto_29741 ) ) ( not ( = ?auto_29743 ?auto_29742 ) ) ( TRUCK-AT ?auto_29744 ?auto_29739 ) ( IN-TRUCK ?auto_29743 ?auto_29744 ) ( OBJ-AT ?auto_29740 ?auto_29739 ) ( OBJ-AT ?auto_29741 ?auto_29739 ) ( OBJ-AT ?auto_29742 ?auto_29739 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29743 ?auto_29739 )
      ( DELIVER-4PKG-VERIFY ?auto_29740 ?auto_29741 ?auto_29742 ?auto_29743 ?auto_29739 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_29758 - OBJ
      ?auto_29759 - OBJ
      ?auto_29760 - OBJ
      ?auto_29761 - OBJ
      ?auto_29757 - LOCATION
    )
    :vars
    (
      ?auto_29762 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29759 ?auto_29758 ) ) ( not ( = ?auto_29760 ?auto_29758 ) ) ( not ( = ?auto_29760 ?auto_29759 ) ) ( not ( = ?auto_29761 ?auto_29758 ) ) ( not ( = ?auto_29761 ?auto_29759 ) ) ( not ( = ?auto_29761 ?auto_29760 ) ) ( TRUCK-AT ?auto_29762 ?auto_29757 ) ( IN-TRUCK ?auto_29760 ?auto_29762 ) ( OBJ-AT ?auto_29758 ?auto_29757 ) ( OBJ-AT ?auto_29759 ?auto_29757 ) ( OBJ-AT ?auto_29761 ?auto_29757 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29760 ?auto_29757 )
      ( DELIVER-4PKG-VERIFY ?auto_29758 ?auto_29759 ?auto_29760 ?auto_29761 ?auto_29757 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_29776 - OBJ
      ?auto_29777 - OBJ
      ?auto_29778 - OBJ
      ?auto_29779 - OBJ
      ?auto_29775 - LOCATION
    )
    :vars
    (
      ?auto_29780 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29777 ?auto_29776 ) ) ( not ( = ?auto_29778 ?auto_29776 ) ) ( not ( = ?auto_29778 ?auto_29777 ) ) ( not ( = ?auto_29779 ?auto_29776 ) ) ( not ( = ?auto_29779 ?auto_29777 ) ) ( not ( = ?auto_29779 ?auto_29778 ) ) ( TRUCK-AT ?auto_29780 ?auto_29775 ) ( IN-TRUCK ?auto_29779 ?auto_29780 ) ( OBJ-AT ?auto_29776 ?auto_29775 ) ( OBJ-AT ?auto_29777 ?auto_29775 ) ( OBJ-AT ?auto_29778 ?auto_29775 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29779 ?auto_29775 )
      ( DELIVER-4PKG-VERIFY ?auto_29776 ?auto_29777 ?auto_29778 ?auto_29779 ?auto_29775 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_29794 - OBJ
      ?auto_29795 - OBJ
      ?auto_29796 - OBJ
      ?auto_29797 - OBJ
      ?auto_29793 - LOCATION
    )
    :vars
    (
      ?auto_29798 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29795 ?auto_29794 ) ) ( not ( = ?auto_29796 ?auto_29794 ) ) ( not ( = ?auto_29796 ?auto_29795 ) ) ( not ( = ?auto_29797 ?auto_29794 ) ) ( not ( = ?auto_29797 ?auto_29795 ) ) ( not ( = ?auto_29797 ?auto_29796 ) ) ( TRUCK-AT ?auto_29798 ?auto_29793 ) ( IN-TRUCK ?auto_29796 ?auto_29798 ) ( OBJ-AT ?auto_29794 ?auto_29793 ) ( OBJ-AT ?auto_29795 ?auto_29793 ) ( OBJ-AT ?auto_29797 ?auto_29793 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29796 ?auto_29793 )
      ( DELIVER-4PKG-VERIFY ?auto_29794 ?auto_29795 ?auto_29796 ?auto_29797 ?auto_29793 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_29848 - OBJ
      ?auto_29849 - OBJ
      ?auto_29850 - OBJ
      ?auto_29851 - OBJ
      ?auto_29847 - LOCATION
    )
    :vars
    (
      ?auto_29852 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29849 ?auto_29848 ) ) ( not ( = ?auto_29850 ?auto_29848 ) ) ( not ( = ?auto_29850 ?auto_29849 ) ) ( not ( = ?auto_29851 ?auto_29848 ) ) ( not ( = ?auto_29851 ?auto_29849 ) ) ( not ( = ?auto_29851 ?auto_29850 ) ) ( TRUCK-AT ?auto_29852 ?auto_29847 ) ( IN-TRUCK ?auto_29849 ?auto_29852 ) ( OBJ-AT ?auto_29848 ?auto_29847 ) ( OBJ-AT ?auto_29850 ?auto_29847 ) ( OBJ-AT ?auto_29851 ?auto_29847 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29849 ?auto_29847 )
      ( DELIVER-4PKG-VERIFY ?auto_29848 ?auto_29849 ?auto_29850 ?auto_29851 ?auto_29847 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_29866 - OBJ
      ?auto_29867 - OBJ
      ?auto_29868 - OBJ
      ?auto_29869 - OBJ
      ?auto_29865 - LOCATION
    )
    :vars
    (
      ?auto_29870 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29867 ?auto_29866 ) ) ( not ( = ?auto_29868 ?auto_29866 ) ) ( not ( = ?auto_29868 ?auto_29867 ) ) ( not ( = ?auto_29869 ?auto_29866 ) ) ( not ( = ?auto_29869 ?auto_29867 ) ) ( not ( = ?auto_29869 ?auto_29868 ) ) ( TRUCK-AT ?auto_29870 ?auto_29865 ) ( IN-TRUCK ?auto_29867 ?auto_29870 ) ( OBJ-AT ?auto_29866 ?auto_29865 ) ( OBJ-AT ?auto_29868 ?auto_29865 ) ( OBJ-AT ?auto_29869 ?auto_29865 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29867 ?auto_29865 )
      ( DELIVER-4PKG-VERIFY ?auto_29866 ?auto_29867 ?auto_29868 ?auto_29869 ?auto_29865 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_29920 - OBJ
      ?auto_29921 - OBJ
      ?auto_29922 - OBJ
      ?auto_29923 - OBJ
      ?auto_29919 - LOCATION
    )
    :vars
    (
      ?auto_29924 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29921 ?auto_29920 ) ) ( not ( = ?auto_29922 ?auto_29920 ) ) ( not ( = ?auto_29922 ?auto_29921 ) ) ( not ( = ?auto_29923 ?auto_29920 ) ) ( not ( = ?auto_29923 ?auto_29921 ) ) ( not ( = ?auto_29923 ?auto_29922 ) ) ( TRUCK-AT ?auto_29924 ?auto_29919 ) ( IN-TRUCK ?auto_29923 ?auto_29924 ) ( OBJ-AT ?auto_29920 ?auto_29919 ) ( OBJ-AT ?auto_29921 ?auto_29919 ) ( OBJ-AT ?auto_29922 ?auto_29919 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29923 ?auto_29919 )
      ( DELIVER-4PKG-VERIFY ?auto_29920 ?auto_29921 ?auto_29922 ?auto_29923 ?auto_29919 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_29938 - OBJ
      ?auto_29939 - OBJ
      ?auto_29940 - OBJ
      ?auto_29941 - OBJ
      ?auto_29937 - LOCATION
    )
    :vars
    (
      ?auto_29942 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29939 ?auto_29938 ) ) ( not ( = ?auto_29940 ?auto_29938 ) ) ( not ( = ?auto_29940 ?auto_29939 ) ) ( not ( = ?auto_29941 ?auto_29938 ) ) ( not ( = ?auto_29941 ?auto_29939 ) ) ( not ( = ?auto_29941 ?auto_29940 ) ) ( TRUCK-AT ?auto_29942 ?auto_29937 ) ( IN-TRUCK ?auto_29940 ?auto_29942 ) ( OBJ-AT ?auto_29938 ?auto_29937 ) ( OBJ-AT ?auto_29939 ?auto_29937 ) ( OBJ-AT ?auto_29941 ?auto_29937 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29940 ?auto_29937 )
      ( DELIVER-4PKG-VERIFY ?auto_29938 ?auto_29939 ?auto_29940 ?auto_29941 ?auto_29937 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_29992 - OBJ
      ?auto_29993 - OBJ
      ?auto_29994 - OBJ
      ?auto_29995 - OBJ
      ?auto_29991 - LOCATION
    )
    :vars
    (
      ?auto_29996 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_29993 ?auto_29992 ) ) ( not ( = ?auto_29994 ?auto_29992 ) ) ( not ( = ?auto_29994 ?auto_29993 ) ) ( not ( = ?auto_29995 ?auto_29992 ) ) ( not ( = ?auto_29995 ?auto_29993 ) ) ( not ( = ?auto_29995 ?auto_29994 ) ) ( TRUCK-AT ?auto_29996 ?auto_29991 ) ( IN-TRUCK ?auto_29995 ?auto_29996 ) ( OBJ-AT ?auto_29992 ?auto_29991 ) ( OBJ-AT ?auto_29993 ?auto_29991 ) ( OBJ-AT ?auto_29994 ?auto_29991 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_29995 ?auto_29991 )
      ( DELIVER-4PKG-VERIFY ?auto_29992 ?auto_29993 ?auto_29994 ?auto_29995 ?auto_29991 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30010 - OBJ
      ?auto_30011 - OBJ
      ?auto_30012 - OBJ
      ?auto_30013 - OBJ
      ?auto_30009 - LOCATION
    )
    :vars
    (
      ?auto_30014 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_30011 ?auto_30010 ) ) ( not ( = ?auto_30012 ?auto_30010 ) ) ( not ( = ?auto_30012 ?auto_30011 ) ) ( not ( = ?auto_30013 ?auto_30010 ) ) ( not ( = ?auto_30013 ?auto_30011 ) ) ( not ( = ?auto_30013 ?auto_30012 ) ) ( TRUCK-AT ?auto_30014 ?auto_30009 ) ( IN-TRUCK ?auto_30012 ?auto_30014 ) ( OBJ-AT ?auto_30010 ?auto_30009 ) ( OBJ-AT ?auto_30011 ?auto_30009 ) ( OBJ-AT ?auto_30013 ?auto_30009 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30012 ?auto_30009 )
      ( DELIVER-4PKG-VERIFY ?auto_30010 ?auto_30011 ?auto_30012 ?auto_30013 ?auto_30009 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30046 - OBJ
      ?auto_30047 - OBJ
      ?auto_30048 - OBJ
      ?auto_30049 - OBJ
      ?auto_30045 - LOCATION
    )
    :vars
    (
      ?auto_30050 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_30047 ?auto_30046 ) ) ( not ( = ?auto_30048 ?auto_30046 ) ) ( not ( = ?auto_30048 ?auto_30047 ) ) ( not ( = ?auto_30049 ?auto_30046 ) ) ( not ( = ?auto_30049 ?auto_30047 ) ) ( not ( = ?auto_30049 ?auto_30048 ) ) ( TRUCK-AT ?auto_30050 ?auto_30045 ) ( IN-TRUCK ?auto_30047 ?auto_30050 ) ( OBJ-AT ?auto_30046 ?auto_30045 ) ( OBJ-AT ?auto_30048 ?auto_30045 ) ( OBJ-AT ?auto_30049 ?auto_30045 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30047 ?auto_30045 )
      ( DELIVER-4PKG-VERIFY ?auto_30046 ?auto_30047 ?auto_30048 ?auto_30049 ?auto_30045 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30082 - OBJ
      ?auto_30083 - OBJ
      ?auto_30084 - OBJ
      ?auto_30085 - OBJ
      ?auto_30081 - LOCATION
    )
    :vars
    (
      ?auto_30086 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_30083 ?auto_30082 ) ) ( not ( = ?auto_30084 ?auto_30082 ) ) ( not ( = ?auto_30084 ?auto_30083 ) ) ( not ( = ?auto_30085 ?auto_30082 ) ) ( not ( = ?auto_30085 ?auto_30083 ) ) ( not ( = ?auto_30085 ?auto_30084 ) ) ( TRUCK-AT ?auto_30086 ?auto_30081 ) ( IN-TRUCK ?auto_30083 ?auto_30086 ) ( OBJ-AT ?auto_30082 ?auto_30081 ) ( OBJ-AT ?auto_30084 ?auto_30081 ) ( OBJ-AT ?auto_30085 ?auto_30081 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30083 ?auto_30081 )
      ( DELIVER-4PKG-VERIFY ?auto_30082 ?auto_30083 ?auto_30084 ?auto_30085 ?auto_30081 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30136 - OBJ
      ?auto_30137 - OBJ
      ?auto_30138 - OBJ
      ?auto_30139 - OBJ
      ?auto_30135 - LOCATION
    )
    :vars
    (
      ?auto_30140 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_30137 ?auto_30136 ) ) ( not ( = ?auto_30138 ?auto_30136 ) ) ( not ( = ?auto_30138 ?auto_30137 ) ) ( not ( = ?auto_30139 ?auto_30136 ) ) ( not ( = ?auto_30139 ?auto_30137 ) ) ( not ( = ?auto_30139 ?auto_30138 ) ) ( TRUCK-AT ?auto_30140 ?auto_30135 ) ( IN-TRUCK ?auto_30139 ?auto_30140 ) ( OBJ-AT ?auto_30136 ?auto_30135 ) ( OBJ-AT ?auto_30137 ?auto_30135 ) ( OBJ-AT ?auto_30138 ?auto_30135 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30139 ?auto_30135 )
      ( DELIVER-4PKG-VERIFY ?auto_30136 ?auto_30137 ?auto_30138 ?auto_30139 ?auto_30135 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30154 - OBJ
      ?auto_30155 - OBJ
      ?auto_30156 - OBJ
      ?auto_30157 - OBJ
      ?auto_30153 - LOCATION
    )
    :vars
    (
      ?auto_30158 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_30155 ?auto_30154 ) ) ( not ( = ?auto_30156 ?auto_30154 ) ) ( not ( = ?auto_30156 ?auto_30155 ) ) ( not ( = ?auto_30157 ?auto_30154 ) ) ( not ( = ?auto_30157 ?auto_30155 ) ) ( not ( = ?auto_30157 ?auto_30156 ) ) ( TRUCK-AT ?auto_30158 ?auto_30153 ) ( IN-TRUCK ?auto_30156 ?auto_30158 ) ( OBJ-AT ?auto_30154 ?auto_30153 ) ( OBJ-AT ?auto_30155 ?auto_30153 ) ( OBJ-AT ?auto_30157 ?auto_30153 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30156 ?auto_30153 )
      ( DELIVER-4PKG-VERIFY ?auto_30154 ?auto_30155 ?auto_30156 ?auto_30157 ?auto_30153 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30172 - OBJ
      ?auto_30173 - OBJ
      ?auto_30174 - OBJ
      ?auto_30175 - OBJ
      ?auto_30171 - LOCATION
    )
    :vars
    (
      ?auto_30176 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_30173 ?auto_30172 ) ) ( not ( = ?auto_30174 ?auto_30172 ) ) ( not ( = ?auto_30174 ?auto_30173 ) ) ( not ( = ?auto_30175 ?auto_30172 ) ) ( not ( = ?auto_30175 ?auto_30173 ) ) ( not ( = ?auto_30175 ?auto_30174 ) ) ( TRUCK-AT ?auto_30176 ?auto_30171 ) ( IN-TRUCK ?auto_30175 ?auto_30176 ) ( OBJ-AT ?auto_30172 ?auto_30171 ) ( OBJ-AT ?auto_30173 ?auto_30171 ) ( OBJ-AT ?auto_30174 ?auto_30171 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30175 ?auto_30171 )
      ( DELIVER-4PKG-VERIFY ?auto_30172 ?auto_30173 ?auto_30174 ?auto_30175 ?auto_30171 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30190 - OBJ
      ?auto_30191 - OBJ
      ?auto_30192 - OBJ
      ?auto_30193 - OBJ
      ?auto_30189 - LOCATION
    )
    :vars
    (
      ?auto_30194 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_30191 ?auto_30190 ) ) ( not ( = ?auto_30192 ?auto_30190 ) ) ( not ( = ?auto_30192 ?auto_30191 ) ) ( not ( = ?auto_30193 ?auto_30190 ) ) ( not ( = ?auto_30193 ?auto_30191 ) ) ( not ( = ?auto_30193 ?auto_30192 ) ) ( TRUCK-AT ?auto_30194 ?auto_30189 ) ( IN-TRUCK ?auto_30192 ?auto_30194 ) ( OBJ-AT ?auto_30190 ?auto_30189 ) ( OBJ-AT ?auto_30191 ?auto_30189 ) ( OBJ-AT ?auto_30193 ?auto_30189 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30192 ?auto_30189 )
      ( DELIVER-4PKG-VERIFY ?auto_30190 ?auto_30191 ?auto_30192 ?auto_30193 ?auto_30189 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30262 - OBJ
      ?auto_30263 - OBJ
      ?auto_30264 - OBJ
      ?auto_30265 - OBJ
      ?auto_30261 - LOCATION
    )
    :vars
    (
      ?auto_30266 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_30263 ?auto_30262 ) ) ( not ( = ?auto_30264 ?auto_30262 ) ) ( not ( = ?auto_30264 ?auto_30263 ) ) ( not ( = ?auto_30265 ?auto_30262 ) ) ( not ( = ?auto_30265 ?auto_30263 ) ) ( not ( = ?auto_30265 ?auto_30264 ) ) ( TRUCK-AT ?auto_30266 ?auto_30261 ) ( IN-TRUCK ?auto_30263 ?auto_30266 ) ( OBJ-AT ?auto_30262 ?auto_30261 ) ( OBJ-AT ?auto_30264 ?auto_30261 ) ( OBJ-AT ?auto_30265 ?auto_30261 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30263 ?auto_30261 )
      ( DELIVER-4PKG-VERIFY ?auto_30262 ?auto_30263 ?auto_30264 ?auto_30265 ?auto_30261 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30280 - OBJ
      ?auto_30281 - OBJ
      ?auto_30282 - OBJ
      ?auto_30283 - OBJ
      ?auto_30279 - LOCATION
    )
    :vars
    (
      ?auto_30284 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_30281 ?auto_30280 ) ) ( not ( = ?auto_30282 ?auto_30280 ) ) ( not ( = ?auto_30282 ?auto_30281 ) ) ( not ( = ?auto_30283 ?auto_30280 ) ) ( not ( = ?auto_30283 ?auto_30281 ) ) ( not ( = ?auto_30283 ?auto_30282 ) ) ( TRUCK-AT ?auto_30284 ?auto_30279 ) ( IN-TRUCK ?auto_30281 ?auto_30284 ) ( OBJ-AT ?auto_30280 ?auto_30279 ) ( OBJ-AT ?auto_30282 ?auto_30279 ) ( OBJ-AT ?auto_30283 ?auto_30279 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30281 ?auto_30279 )
      ( DELIVER-4PKG-VERIFY ?auto_30280 ?auto_30281 ?auto_30282 ?auto_30283 ?auto_30279 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30388 - OBJ
      ?auto_30389 - OBJ
      ?auto_30390 - OBJ
      ?auto_30391 - OBJ
      ?auto_30387 - LOCATION
    )
    :vars
    (
      ?auto_30392 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_30389 ?auto_30388 ) ) ( not ( = ?auto_30390 ?auto_30388 ) ) ( not ( = ?auto_30390 ?auto_30389 ) ) ( not ( = ?auto_30391 ?auto_30388 ) ) ( not ( = ?auto_30391 ?auto_30389 ) ) ( not ( = ?auto_30391 ?auto_30390 ) ) ( TRUCK-AT ?auto_30392 ?auto_30387 ) ( IN-TRUCK ?auto_30388 ?auto_30392 ) ( OBJ-AT ?auto_30389 ?auto_30387 ) ( OBJ-AT ?auto_30390 ?auto_30387 ) ( OBJ-AT ?auto_30391 ?auto_30387 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30388 ?auto_30387 )
      ( DELIVER-4PKG-VERIFY ?auto_30388 ?auto_30389 ?auto_30390 ?auto_30391 ?auto_30387 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30406 - OBJ
      ?auto_30407 - OBJ
      ?auto_30408 - OBJ
      ?auto_30409 - OBJ
      ?auto_30405 - LOCATION
    )
    :vars
    (
      ?auto_30410 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_30407 ?auto_30406 ) ) ( not ( = ?auto_30408 ?auto_30406 ) ) ( not ( = ?auto_30408 ?auto_30407 ) ) ( not ( = ?auto_30409 ?auto_30406 ) ) ( not ( = ?auto_30409 ?auto_30407 ) ) ( not ( = ?auto_30409 ?auto_30408 ) ) ( TRUCK-AT ?auto_30410 ?auto_30405 ) ( IN-TRUCK ?auto_30406 ?auto_30410 ) ( OBJ-AT ?auto_30407 ?auto_30405 ) ( OBJ-AT ?auto_30408 ?auto_30405 ) ( OBJ-AT ?auto_30409 ?auto_30405 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30406 ?auto_30405 )
      ( DELIVER-4PKG-VERIFY ?auto_30406 ?auto_30407 ?auto_30408 ?auto_30409 ?auto_30405 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30460 - OBJ
      ?auto_30461 - OBJ
      ?auto_30462 - OBJ
      ?auto_30463 - OBJ
      ?auto_30459 - LOCATION
    )
    :vars
    (
      ?auto_30464 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_30461 ?auto_30460 ) ) ( not ( = ?auto_30462 ?auto_30460 ) ) ( not ( = ?auto_30462 ?auto_30461 ) ) ( not ( = ?auto_30463 ?auto_30460 ) ) ( not ( = ?auto_30463 ?auto_30461 ) ) ( not ( = ?auto_30463 ?auto_30462 ) ) ( TRUCK-AT ?auto_30464 ?auto_30459 ) ( IN-TRUCK ?auto_30460 ?auto_30464 ) ( OBJ-AT ?auto_30461 ?auto_30459 ) ( OBJ-AT ?auto_30462 ?auto_30459 ) ( OBJ-AT ?auto_30463 ?auto_30459 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30460 ?auto_30459 )
      ( DELIVER-4PKG-VERIFY ?auto_30460 ?auto_30461 ?auto_30462 ?auto_30463 ?auto_30459 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30496 - OBJ
      ?auto_30497 - OBJ
      ?auto_30498 - OBJ
      ?auto_30499 - OBJ
      ?auto_30495 - LOCATION
    )
    :vars
    (
      ?auto_30500 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_30497 ?auto_30496 ) ) ( not ( = ?auto_30498 ?auto_30496 ) ) ( not ( = ?auto_30498 ?auto_30497 ) ) ( not ( = ?auto_30499 ?auto_30496 ) ) ( not ( = ?auto_30499 ?auto_30497 ) ) ( not ( = ?auto_30499 ?auto_30498 ) ) ( TRUCK-AT ?auto_30500 ?auto_30495 ) ( IN-TRUCK ?auto_30496 ?auto_30500 ) ( OBJ-AT ?auto_30497 ?auto_30495 ) ( OBJ-AT ?auto_30498 ?auto_30495 ) ( OBJ-AT ?auto_30499 ?auto_30495 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30496 ?auto_30495 )
      ( DELIVER-4PKG-VERIFY ?auto_30496 ?auto_30497 ?auto_30498 ?auto_30499 ?auto_30495 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30550 - OBJ
      ?auto_30551 - OBJ
      ?auto_30552 - OBJ
      ?auto_30553 - OBJ
      ?auto_30549 - LOCATION
    )
    :vars
    (
      ?auto_30554 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_30551 ?auto_30550 ) ) ( not ( = ?auto_30552 ?auto_30550 ) ) ( not ( = ?auto_30552 ?auto_30551 ) ) ( not ( = ?auto_30553 ?auto_30550 ) ) ( not ( = ?auto_30553 ?auto_30551 ) ) ( not ( = ?auto_30553 ?auto_30552 ) ) ( TRUCK-AT ?auto_30554 ?auto_30549 ) ( IN-TRUCK ?auto_30550 ?auto_30554 ) ( OBJ-AT ?auto_30551 ?auto_30549 ) ( OBJ-AT ?auto_30552 ?auto_30549 ) ( OBJ-AT ?auto_30553 ?auto_30549 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30550 ?auto_30549 )
      ( DELIVER-4PKG-VERIFY ?auto_30550 ?auto_30551 ?auto_30552 ?auto_30553 ?auto_30549 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_30568 - OBJ
      ?auto_30569 - OBJ
      ?auto_30570 - OBJ
      ?auto_30571 - OBJ
      ?auto_30567 - LOCATION
    )
    :vars
    (
      ?auto_30572 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_30569 ?auto_30568 ) ) ( not ( = ?auto_30570 ?auto_30568 ) ) ( not ( = ?auto_30570 ?auto_30569 ) ) ( not ( = ?auto_30571 ?auto_30568 ) ) ( not ( = ?auto_30571 ?auto_30569 ) ) ( not ( = ?auto_30571 ?auto_30570 ) ) ( TRUCK-AT ?auto_30572 ?auto_30567 ) ( IN-TRUCK ?auto_30568 ?auto_30572 ) ( OBJ-AT ?auto_30569 ?auto_30567 ) ( OBJ-AT ?auto_30570 ?auto_30567 ) ( OBJ-AT ?auto_30571 ?auto_30567 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30568 ?auto_30567 )
      ( DELIVER-4PKG-VERIFY ?auto_30568 ?auto_30569 ?auto_30570 ?auto_30571 ?auto_30567 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_30736 - OBJ
      ?auto_30735 - LOCATION
    )
    :vars
    (
      ?auto_30737 - TRUCK
      ?auto_30738 - LOCATION
      ?auto_30739 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_30736 ?auto_30737 ) ( TRUCK-AT ?auto_30737 ?auto_30738 ) ( IN-CITY ?auto_30738 ?auto_30739 ) ( IN-CITY ?auto_30735 ?auto_30739 ) ( not ( = ?auto_30735 ?auto_30738 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_30737 ?auto_30738 ?auto_30735 ?auto_30739 )
      ( DELIVER-1PKG ?auto_30736 ?auto_30735 )
      ( DELIVER-1PKG-VERIFY ?auto_30736 ?auto_30735 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_30741 - OBJ
      ?auto_30742 - OBJ
      ?auto_30740 - LOCATION
    )
    :vars
    (
      ?auto_30744 - TRUCK
      ?auto_30743 - LOCATION
      ?auto_30745 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30742 ?auto_30741 ) ) ( IN-TRUCK ?auto_30742 ?auto_30744 ) ( TRUCK-AT ?auto_30744 ?auto_30743 ) ( IN-CITY ?auto_30743 ?auto_30745 ) ( IN-CITY ?auto_30740 ?auto_30745 ) ( not ( = ?auto_30740 ?auto_30743 ) ) ( OBJ-AT ?auto_30741 ?auto_30740 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_30742 ?auto_30740 )
      ( DELIVER-2PKG-VERIFY ?auto_30741 ?auto_30742 ?auto_30740 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_30747 - OBJ
      ?auto_30748 - OBJ
      ?auto_30746 - LOCATION
    )
    :vars
    (
      ?auto_30752 - OBJ
      ?auto_30751 - TRUCK
      ?auto_30750 - LOCATION
      ?auto_30749 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30748 ?auto_30747 ) ) ( not ( = ?auto_30748 ?auto_30752 ) ) ( IN-TRUCK ?auto_30748 ?auto_30751 ) ( TRUCK-AT ?auto_30751 ?auto_30750 ) ( IN-CITY ?auto_30750 ?auto_30749 ) ( IN-CITY ?auto_30746 ?auto_30749 ) ( not ( = ?auto_30746 ?auto_30750 ) ) ( OBJ-AT ?auto_30752 ?auto_30746 ) ( OBJ-AT ?auto_30747 ?auto_30746 ) ( not ( = ?auto_30747 ?auto_30752 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30752 ?auto_30748 ?auto_30746 )
      ( DELIVER-2PKG-VERIFY ?auto_30747 ?auto_30748 ?auto_30746 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_30754 - OBJ
      ?auto_30755 - OBJ
      ?auto_30753 - LOCATION
    )
    :vars
    (
      ?auto_30759 - OBJ
      ?auto_30758 - TRUCK
      ?auto_30757 - LOCATION
      ?auto_30756 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30755 ?auto_30754 ) ) ( not ( = ?auto_30755 ?auto_30759 ) ) ( IN-TRUCK ?auto_30755 ?auto_30758 ) ( TRUCK-AT ?auto_30758 ?auto_30757 ) ( IN-CITY ?auto_30757 ?auto_30756 ) ( IN-CITY ?auto_30753 ?auto_30756 ) ( not ( = ?auto_30753 ?auto_30757 ) ) ( OBJ-AT ?auto_30759 ?auto_30753 ) ( OBJ-AT ?auto_30754 ?auto_30753 ) ( not ( = ?auto_30754 ?auto_30759 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30759 ?auto_30755 ?auto_30753 )
      ( DELIVER-2PKG-VERIFY ?auto_30754 ?auto_30755 ?auto_30753 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_30761 - OBJ
      ?auto_30762 - OBJ
      ?auto_30760 - LOCATION
    )
    :vars
    (
      ?auto_30765 - TRUCK
      ?auto_30764 - LOCATION
      ?auto_30763 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30762 ?auto_30761 ) ) ( IN-TRUCK ?auto_30761 ?auto_30765 ) ( TRUCK-AT ?auto_30765 ?auto_30764 ) ( IN-CITY ?auto_30764 ?auto_30763 ) ( IN-CITY ?auto_30760 ?auto_30763 ) ( not ( = ?auto_30760 ?auto_30764 ) ) ( OBJ-AT ?auto_30762 ?auto_30760 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30762 ?auto_30761 ?auto_30760 )
      ( DELIVER-2PKG-VERIFY ?auto_30761 ?auto_30762 ?auto_30760 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_30767 - OBJ
      ?auto_30768 - OBJ
      ?auto_30766 - LOCATION
    )
    :vars
    (
      ?auto_30772 - OBJ
      ?auto_30771 - TRUCK
      ?auto_30770 - LOCATION
      ?auto_30769 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30768 ?auto_30767 ) ) ( not ( = ?auto_30767 ?auto_30772 ) ) ( IN-TRUCK ?auto_30767 ?auto_30771 ) ( TRUCK-AT ?auto_30771 ?auto_30770 ) ( IN-CITY ?auto_30770 ?auto_30769 ) ( IN-CITY ?auto_30766 ?auto_30769 ) ( not ( = ?auto_30766 ?auto_30770 ) ) ( OBJ-AT ?auto_30772 ?auto_30766 ) ( OBJ-AT ?auto_30768 ?auto_30766 ) ( not ( = ?auto_30768 ?auto_30772 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30772 ?auto_30767 ?auto_30766 )
      ( DELIVER-2PKG-VERIFY ?auto_30767 ?auto_30768 ?auto_30766 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_30774 - OBJ
      ?auto_30775 - OBJ
      ?auto_30773 - LOCATION
    )
    :vars
    (
      ?auto_30779 - OBJ
      ?auto_30778 - TRUCK
      ?auto_30777 - LOCATION
      ?auto_30776 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30775 ?auto_30774 ) ) ( not ( = ?auto_30774 ?auto_30779 ) ) ( IN-TRUCK ?auto_30774 ?auto_30778 ) ( TRUCK-AT ?auto_30778 ?auto_30777 ) ( IN-CITY ?auto_30777 ?auto_30776 ) ( IN-CITY ?auto_30773 ?auto_30776 ) ( not ( = ?auto_30773 ?auto_30777 ) ) ( OBJ-AT ?auto_30779 ?auto_30773 ) ( OBJ-AT ?auto_30775 ?auto_30773 ) ( not ( = ?auto_30775 ?auto_30779 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30779 ?auto_30774 ?auto_30773 )
      ( DELIVER-2PKG-VERIFY ?auto_30774 ?auto_30775 ?auto_30773 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30795 - OBJ
      ?auto_30796 - OBJ
      ?auto_30797 - OBJ
      ?auto_30794 - LOCATION
    )
    :vars
    (
      ?auto_30800 - TRUCK
      ?auto_30799 - LOCATION
      ?auto_30798 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30796 ?auto_30795 ) ) ( not ( = ?auto_30797 ?auto_30795 ) ) ( not ( = ?auto_30797 ?auto_30796 ) ) ( IN-TRUCK ?auto_30797 ?auto_30800 ) ( TRUCK-AT ?auto_30800 ?auto_30799 ) ( IN-CITY ?auto_30799 ?auto_30798 ) ( IN-CITY ?auto_30794 ?auto_30798 ) ( not ( = ?auto_30794 ?auto_30799 ) ) ( OBJ-AT ?auto_30795 ?auto_30794 ) ( OBJ-AT ?auto_30796 ?auto_30794 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30795 ?auto_30797 ?auto_30794 )
      ( DELIVER-3PKG-VERIFY ?auto_30795 ?auto_30796 ?auto_30797 ?auto_30794 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30802 - OBJ
      ?auto_30803 - OBJ
      ?auto_30804 - OBJ
      ?auto_30801 - LOCATION
    )
    :vars
    (
      ?auto_30807 - TRUCK
      ?auto_30806 - LOCATION
      ?auto_30805 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30803 ?auto_30802 ) ) ( not ( = ?auto_30804 ?auto_30802 ) ) ( not ( = ?auto_30804 ?auto_30803 ) ) ( IN-TRUCK ?auto_30804 ?auto_30807 ) ( TRUCK-AT ?auto_30807 ?auto_30806 ) ( IN-CITY ?auto_30806 ?auto_30805 ) ( IN-CITY ?auto_30801 ?auto_30805 ) ( not ( = ?auto_30801 ?auto_30806 ) ) ( OBJ-AT ?auto_30802 ?auto_30801 ) ( OBJ-AT ?auto_30803 ?auto_30801 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30802 ?auto_30804 ?auto_30801 )
      ( DELIVER-3PKG-VERIFY ?auto_30802 ?auto_30803 ?auto_30804 ?auto_30801 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30816 - OBJ
      ?auto_30817 - OBJ
      ?auto_30818 - OBJ
      ?auto_30815 - LOCATION
    )
    :vars
    (
      ?auto_30821 - TRUCK
      ?auto_30820 - LOCATION
      ?auto_30819 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30817 ?auto_30816 ) ) ( not ( = ?auto_30818 ?auto_30816 ) ) ( not ( = ?auto_30818 ?auto_30817 ) ) ( IN-TRUCK ?auto_30817 ?auto_30821 ) ( TRUCK-AT ?auto_30821 ?auto_30820 ) ( IN-CITY ?auto_30820 ?auto_30819 ) ( IN-CITY ?auto_30815 ?auto_30819 ) ( not ( = ?auto_30815 ?auto_30820 ) ) ( OBJ-AT ?auto_30816 ?auto_30815 ) ( OBJ-AT ?auto_30818 ?auto_30815 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30816 ?auto_30817 ?auto_30815 )
      ( DELIVER-3PKG-VERIFY ?auto_30816 ?auto_30817 ?auto_30818 ?auto_30815 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30823 - OBJ
      ?auto_30824 - OBJ
      ?auto_30825 - OBJ
      ?auto_30822 - LOCATION
    )
    :vars
    (
      ?auto_30828 - TRUCK
      ?auto_30827 - LOCATION
      ?auto_30826 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30824 ?auto_30823 ) ) ( not ( = ?auto_30825 ?auto_30823 ) ) ( not ( = ?auto_30825 ?auto_30824 ) ) ( IN-TRUCK ?auto_30824 ?auto_30828 ) ( TRUCK-AT ?auto_30828 ?auto_30827 ) ( IN-CITY ?auto_30827 ?auto_30826 ) ( IN-CITY ?auto_30822 ?auto_30826 ) ( not ( = ?auto_30822 ?auto_30827 ) ) ( OBJ-AT ?auto_30823 ?auto_30822 ) ( OBJ-AT ?auto_30825 ?auto_30822 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30823 ?auto_30824 ?auto_30822 )
      ( DELIVER-3PKG-VERIFY ?auto_30823 ?auto_30824 ?auto_30825 ?auto_30822 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30837 - OBJ
      ?auto_30838 - OBJ
      ?auto_30839 - OBJ
      ?auto_30836 - LOCATION
    )
    :vars
    (
      ?auto_30842 - TRUCK
      ?auto_30841 - LOCATION
      ?auto_30840 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30838 ?auto_30837 ) ) ( not ( = ?auto_30839 ?auto_30837 ) ) ( not ( = ?auto_30839 ?auto_30838 ) ) ( IN-TRUCK ?auto_30839 ?auto_30842 ) ( TRUCK-AT ?auto_30842 ?auto_30841 ) ( IN-CITY ?auto_30841 ?auto_30840 ) ( IN-CITY ?auto_30836 ?auto_30840 ) ( not ( = ?auto_30836 ?auto_30841 ) ) ( OBJ-AT ?auto_30838 ?auto_30836 ) ( OBJ-AT ?auto_30837 ?auto_30836 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30838 ?auto_30839 ?auto_30836 )
      ( DELIVER-3PKG-VERIFY ?auto_30837 ?auto_30838 ?auto_30839 ?auto_30836 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30852 - OBJ
      ?auto_30853 - OBJ
      ?auto_30854 - OBJ
      ?auto_30851 - LOCATION
    )
    :vars
    (
      ?auto_30858 - OBJ
      ?auto_30857 - TRUCK
      ?auto_30856 - LOCATION
      ?auto_30855 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30853 ?auto_30852 ) ) ( not ( = ?auto_30854 ?auto_30852 ) ) ( not ( = ?auto_30854 ?auto_30853 ) ) ( not ( = ?auto_30854 ?auto_30858 ) ) ( IN-TRUCK ?auto_30854 ?auto_30857 ) ( TRUCK-AT ?auto_30857 ?auto_30856 ) ( IN-CITY ?auto_30856 ?auto_30855 ) ( IN-CITY ?auto_30851 ?auto_30855 ) ( not ( = ?auto_30851 ?auto_30856 ) ) ( OBJ-AT ?auto_30858 ?auto_30851 ) ( OBJ-AT ?auto_30852 ?auto_30851 ) ( OBJ-AT ?auto_30853 ?auto_30851 ) ( not ( = ?auto_30852 ?auto_30858 ) ) ( not ( = ?auto_30853 ?auto_30858 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30858 ?auto_30854 ?auto_30851 )
      ( DELIVER-3PKG-VERIFY ?auto_30852 ?auto_30853 ?auto_30854 ?auto_30851 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30860 - OBJ
      ?auto_30861 - OBJ
      ?auto_30862 - OBJ
      ?auto_30859 - LOCATION
    )
    :vars
    (
      ?auto_30865 - TRUCK
      ?auto_30864 - LOCATION
      ?auto_30863 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30861 ?auto_30860 ) ) ( not ( = ?auto_30862 ?auto_30860 ) ) ( not ( = ?auto_30862 ?auto_30861 ) ) ( IN-TRUCK ?auto_30861 ?auto_30865 ) ( TRUCK-AT ?auto_30865 ?auto_30864 ) ( IN-CITY ?auto_30864 ?auto_30863 ) ( IN-CITY ?auto_30859 ?auto_30863 ) ( not ( = ?auto_30859 ?auto_30864 ) ) ( OBJ-AT ?auto_30862 ?auto_30859 ) ( OBJ-AT ?auto_30860 ?auto_30859 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30862 ?auto_30861 ?auto_30859 )
      ( DELIVER-3PKG-VERIFY ?auto_30860 ?auto_30861 ?auto_30862 ?auto_30859 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30875 - OBJ
      ?auto_30876 - OBJ
      ?auto_30877 - OBJ
      ?auto_30874 - LOCATION
    )
    :vars
    (
      ?auto_30881 - OBJ
      ?auto_30880 - TRUCK
      ?auto_30879 - LOCATION
      ?auto_30878 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30876 ?auto_30875 ) ) ( not ( = ?auto_30877 ?auto_30875 ) ) ( not ( = ?auto_30877 ?auto_30876 ) ) ( not ( = ?auto_30876 ?auto_30881 ) ) ( IN-TRUCK ?auto_30876 ?auto_30880 ) ( TRUCK-AT ?auto_30880 ?auto_30879 ) ( IN-CITY ?auto_30879 ?auto_30878 ) ( IN-CITY ?auto_30874 ?auto_30878 ) ( not ( = ?auto_30874 ?auto_30879 ) ) ( OBJ-AT ?auto_30881 ?auto_30874 ) ( OBJ-AT ?auto_30875 ?auto_30874 ) ( OBJ-AT ?auto_30877 ?auto_30874 ) ( not ( = ?auto_30875 ?auto_30881 ) ) ( not ( = ?auto_30877 ?auto_30881 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30881 ?auto_30876 ?auto_30874 )
      ( DELIVER-3PKG-VERIFY ?auto_30875 ?auto_30876 ?auto_30877 ?auto_30874 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30891 - OBJ
      ?auto_30892 - OBJ
      ?auto_30893 - OBJ
      ?auto_30890 - LOCATION
    )
    :vars
    (
      ?auto_30896 - TRUCK
      ?auto_30895 - LOCATION
      ?auto_30894 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30892 ?auto_30891 ) ) ( not ( = ?auto_30893 ?auto_30891 ) ) ( not ( = ?auto_30893 ?auto_30892 ) ) ( IN-TRUCK ?auto_30893 ?auto_30896 ) ( TRUCK-AT ?auto_30896 ?auto_30895 ) ( IN-CITY ?auto_30895 ?auto_30894 ) ( IN-CITY ?auto_30890 ?auto_30894 ) ( not ( = ?auto_30890 ?auto_30895 ) ) ( OBJ-AT ?auto_30892 ?auto_30890 ) ( OBJ-AT ?auto_30891 ?auto_30890 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30892 ?auto_30893 ?auto_30890 )
      ( DELIVER-3PKG-VERIFY ?auto_30891 ?auto_30892 ?auto_30893 ?auto_30890 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30898 - OBJ
      ?auto_30899 - OBJ
      ?auto_30900 - OBJ
      ?auto_30897 - LOCATION
    )
    :vars
    (
      ?auto_30904 - OBJ
      ?auto_30903 - TRUCK
      ?auto_30902 - LOCATION
      ?auto_30901 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30899 ?auto_30898 ) ) ( not ( = ?auto_30900 ?auto_30898 ) ) ( not ( = ?auto_30900 ?auto_30899 ) ) ( not ( = ?auto_30900 ?auto_30904 ) ) ( IN-TRUCK ?auto_30900 ?auto_30903 ) ( TRUCK-AT ?auto_30903 ?auto_30902 ) ( IN-CITY ?auto_30902 ?auto_30901 ) ( IN-CITY ?auto_30897 ?auto_30901 ) ( not ( = ?auto_30897 ?auto_30902 ) ) ( OBJ-AT ?auto_30904 ?auto_30897 ) ( OBJ-AT ?auto_30898 ?auto_30897 ) ( OBJ-AT ?auto_30899 ?auto_30897 ) ( not ( = ?auto_30898 ?auto_30904 ) ) ( not ( = ?auto_30899 ?auto_30904 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30904 ?auto_30900 ?auto_30897 )
      ( DELIVER-3PKG-VERIFY ?auto_30898 ?auto_30899 ?auto_30900 ?auto_30897 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30914 - OBJ
      ?auto_30915 - OBJ
      ?auto_30916 - OBJ
      ?auto_30913 - LOCATION
    )
    :vars
    (
      ?auto_30919 - TRUCK
      ?auto_30918 - LOCATION
      ?auto_30917 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30915 ?auto_30914 ) ) ( not ( = ?auto_30916 ?auto_30914 ) ) ( not ( = ?auto_30916 ?auto_30915 ) ) ( IN-TRUCK ?auto_30915 ?auto_30919 ) ( TRUCK-AT ?auto_30919 ?auto_30918 ) ( IN-CITY ?auto_30918 ?auto_30917 ) ( IN-CITY ?auto_30913 ?auto_30917 ) ( not ( = ?auto_30913 ?auto_30918 ) ) ( OBJ-AT ?auto_30916 ?auto_30913 ) ( OBJ-AT ?auto_30914 ?auto_30913 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30916 ?auto_30915 ?auto_30913 )
      ( DELIVER-3PKG-VERIFY ?auto_30914 ?auto_30915 ?auto_30916 ?auto_30913 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30921 - OBJ
      ?auto_30922 - OBJ
      ?auto_30923 - OBJ
      ?auto_30920 - LOCATION
    )
    :vars
    (
      ?auto_30927 - OBJ
      ?auto_30926 - TRUCK
      ?auto_30925 - LOCATION
      ?auto_30924 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30922 ?auto_30921 ) ) ( not ( = ?auto_30923 ?auto_30921 ) ) ( not ( = ?auto_30923 ?auto_30922 ) ) ( not ( = ?auto_30922 ?auto_30927 ) ) ( IN-TRUCK ?auto_30922 ?auto_30926 ) ( TRUCK-AT ?auto_30926 ?auto_30925 ) ( IN-CITY ?auto_30925 ?auto_30924 ) ( IN-CITY ?auto_30920 ?auto_30924 ) ( not ( = ?auto_30920 ?auto_30925 ) ) ( OBJ-AT ?auto_30927 ?auto_30920 ) ( OBJ-AT ?auto_30921 ?auto_30920 ) ( OBJ-AT ?auto_30923 ?auto_30920 ) ( not ( = ?auto_30921 ?auto_30927 ) ) ( not ( = ?auto_30923 ?auto_30927 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30927 ?auto_30922 ?auto_30920 )
      ( DELIVER-3PKG-VERIFY ?auto_30921 ?auto_30922 ?auto_30923 ?auto_30920 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30952 - OBJ
      ?auto_30953 - OBJ
      ?auto_30954 - OBJ
      ?auto_30951 - LOCATION
    )
    :vars
    (
      ?auto_30957 - TRUCK
      ?auto_30956 - LOCATION
      ?auto_30955 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30953 ?auto_30952 ) ) ( not ( = ?auto_30954 ?auto_30952 ) ) ( not ( = ?auto_30954 ?auto_30953 ) ) ( IN-TRUCK ?auto_30952 ?auto_30957 ) ( TRUCK-AT ?auto_30957 ?auto_30956 ) ( IN-CITY ?auto_30956 ?auto_30955 ) ( IN-CITY ?auto_30951 ?auto_30955 ) ( not ( = ?auto_30951 ?auto_30956 ) ) ( OBJ-AT ?auto_30953 ?auto_30951 ) ( OBJ-AT ?auto_30954 ?auto_30951 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30953 ?auto_30952 ?auto_30951 )
      ( DELIVER-3PKG-VERIFY ?auto_30952 ?auto_30953 ?auto_30954 ?auto_30951 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30959 - OBJ
      ?auto_30960 - OBJ
      ?auto_30961 - OBJ
      ?auto_30958 - LOCATION
    )
    :vars
    (
      ?auto_30964 - TRUCK
      ?auto_30963 - LOCATION
      ?auto_30962 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30960 ?auto_30959 ) ) ( not ( = ?auto_30961 ?auto_30959 ) ) ( not ( = ?auto_30961 ?auto_30960 ) ) ( IN-TRUCK ?auto_30959 ?auto_30964 ) ( TRUCK-AT ?auto_30964 ?auto_30963 ) ( IN-CITY ?auto_30963 ?auto_30962 ) ( IN-CITY ?auto_30958 ?auto_30962 ) ( not ( = ?auto_30958 ?auto_30963 ) ) ( OBJ-AT ?auto_30960 ?auto_30958 ) ( OBJ-AT ?auto_30961 ?auto_30958 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30960 ?auto_30959 ?auto_30958 )
      ( DELIVER-3PKG-VERIFY ?auto_30959 ?auto_30960 ?auto_30961 ?auto_30958 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30973 - OBJ
      ?auto_30974 - OBJ
      ?auto_30975 - OBJ
      ?auto_30972 - LOCATION
    )
    :vars
    (
      ?auto_30978 - TRUCK
      ?auto_30977 - LOCATION
      ?auto_30976 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30974 ?auto_30973 ) ) ( not ( = ?auto_30975 ?auto_30973 ) ) ( not ( = ?auto_30975 ?auto_30974 ) ) ( IN-TRUCK ?auto_30973 ?auto_30978 ) ( TRUCK-AT ?auto_30978 ?auto_30977 ) ( IN-CITY ?auto_30977 ?auto_30976 ) ( IN-CITY ?auto_30972 ?auto_30976 ) ( not ( = ?auto_30972 ?auto_30977 ) ) ( OBJ-AT ?auto_30975 ?auto_30972 ) ( OBJ-AT ?auto_30974 ?auto_30972 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30975 ?auto_30973 ?auto_30972 )
      ( DELIVER-3PKG-VERIFY ?auto_30973 ?auto_30974 ?auto_30975 ?auto_30972 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30988 - OBJ
      ?auto_30989 - OBJ
      ?auto_30990 - OBJ
      ?auto_30987 - LOCATION
    )
    :vars
    (
      ?auto_30994 - OBJ
      ?auto_30993 - TRUCK
      ?auto_30992 - LOCATION
      ?auto_30991 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_30989 ?auto_30988 ) ) ( not ( = ?auto_30990 ?auto_30988 ) ) ( not ( = ?auto_30990 ?auto_30989 ) ) ( not ( = ?auto_30988 ?auto_30994 ) ) ( IN-TRUCK ?auto_30988 ?auto_30993 ) ( TRUCK-AT ?auto_30993 ?auto_30992 ) ( IN-CITY ?auto_30992 ?auto_30991 ) ( IN-CITY ?auto_30987 ?auto_30991 ) ( not ( = ?auto_30987 ?auto_30992 ) ) ( OBJ-AT ?auto_30994 ?auto_30987 ) ( OBJ-AT ?auto_30989 ?auto_30987 ) ( OBJ-AT ?auto_30990 ?auto_30987 ) ( not ( = ?auto_30989 ?auto_30994 ) ) ( not ( = ?auto_30990 ?auto_30994 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30994 ?auto_30988 ?auto_30987 )
      ( DELIVER-3PKG-VERIFY ?auto_30988 ?auto_30989 ?auto_30990 ?auto_30987 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_31004 - OBJ
      ?auto_31005 - OBJ
      ?auto_31006 - OBJ
      ?auto_31003 - LOCATION
    )
    :vars
    (
      ?auto_31009 - TRUCK
      ?auto_31008 - LOCATION
      ?auto_31007 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_31005 ?auto_31004 ) ) ( not ( = ?auto_31006 ?auto_31004 ) ) ( not ( = ?auto_31006 ?auto_31005 ) ) ( IN-TRUCK ?auto_31004 ?auto_31009 ) ( TRUCK-AT ?auto_31009 ?auto_31008 ) ( IN-CITY ?auto_31008 ?auto_31007 ) ( IN-CITY ?auto_31003 ?auto_31007 ) ( not ( = ?auto_31003 ?auto_31008 ) ) ( OBJ-AT ?auto_31006 ?auto_31003 ) ( OBJ-AT ?auto_31005 ?auto_31003 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31006 ?auto_31004 ?auto_31003 )
      ( DELIVER-3PKG-VERIFY ?auto_31004 ?auto_31005 ?auto_31006 ?auto_31003 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_31011 - OBJ
      ?auto_31012 - OBJ
      ?auto_31013 - OBJ
      ?auto_31010 - LOCATION
    )
    :vars
    (
      ?auto_31017 - OBJ
      ?auto_31016 - TRUCK
      ?auto_31015 - LOCATION
      ?auto_31014 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_31012 ?auto_31011 ) ) ( not ( = ?auto_31013 ?auto_31011 ) ) ( not ( = ?auto_31013 ?auto_31012 ) ) ( not ( = ?auto_31011 ?auto_31017 ) ) ( IN-TRUCK ?auto_31011 ?auto_31016 ) ( TRUCK-AT ?auto_31016 ?auto_31015 ) ( IN-CITY ?auto_31015 ?auto_31014 ) ( IN-CITY ?auto_31010 ?auto_31014 ) ( not ( = ?auto_31010 ?auto_31015 ) ) ( OBJ-AT ?auto_31017 ?auto_31010 ) ( OBJ-AT ?auto_31012 ?auto_31010 ) ( OBJ-AT ?auto_31013 ?auto_31010 ) ( not ( = ?auto_31012 ?auto_31017 ) ) ( not ( = ?auto_31013 ?auto_31017 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31017 ?auto_31011 ?auto_31010 )
      ( DELIVER-3PKG-VERIFY ?auto_31011 ?auto_31012 ?auto_31013 ?auto_31010 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31138 - OBJ
      ?auto_31139 - OBJ
      ?auto_31140 - OBJ
      ?auto_31141 - OBJ
      ?auto_31137 - LOCATION
    )
    :vars
    (
      ?auto_31144 - TRUCK
      ?auto_31143 - LOCATION
      ?auto_31142 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_31139 ?auto_31138 ) ) ( not ( = ?auto_31140 ?auto_31138 ) ) ( not ( = ?auto_31140 ?auto_31139 ) ) ( not ( = ?auto_31141 ?auto_31138 ) ) ( not ( = ?auto_31141 ?auto_31139 ) ) ( not ( = ?auto_31141 ?auto_31140 ) ) ( IN-TRUCK ?auto_31141 ?auto_31144 ) ( TRUCK-AT ?auto_31144 ?auto_31143 ) ( IN-CITY ?auto_31143 ?auto_31142 ) ( IN-CITY ?auto_31137 ?auto_31142 ) ( not ( = ?auto_31137 ?auto_31143 ) ) ( OBJ-AT ?auto_31138 ?auto_31137 ) ( OBJ-AT ?auto_31139 ?auto_31137 ) ( OBJ-AT ?auto_31140 ?auto_31137 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31138 ?auto_31141 ?auto_31137 )
      ( DELIVER-4PKG-VERIFY ?auto_31138 ?auto_31139 ?auto_31140 ?auto_31141 ?auto_31137 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31162 - OBJ
      ?auto_31163 - OBJ
      ?auto_31164 - OBJ
      ?auto_31165 - OBJ
      ?auto_31161 - LOCATION
    )
    :vars
    (
      ?auto_31168 - TRUCK
      ?auto_31167 - LOCATION
      ?auto_31166 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_31163 ?auto_31162 ) ) ( not ( = ?auto_31164 ?auto_31162 ) ) ( not ( = ?auto_31164 ?auto_31163 ) ) ( not ( = ?auto_31165 ?auto_31162 ) ) ( not ( = ?auto_31165 ?auto_31163 ) ) ( not ( = ?auto_31165 ?auto_31164 ) ) ( IN-TRUCK ?auto_31164 ?auto_31168 ) ( TRUCK-AT ?auto_31168 ?auto_31167 ) ( IN-CITY ?auto_31167 ?auto_31166 ) ( IN-CITY ?auto_31161 ?auto_31166 ) ( not ( = ?auto_31161 ?auto_31167 ) ) ( OBJ-AT ?auto_31162 ?auto_31161 ) ( OBJ-AT ?auto_31163 ?auto_31161 ) ( OBJ-AT ?auto_31165 ?auto_31161 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31162 ?auto_31164 ?auto_31161 )
      ( DELIVER-4PKG-VERIFY ?auto_31162 ?auto_31163 ?auto_31164 ?auto_31165 ?auto_31161 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31186 - OBJ
      ?auto_31187 - OBJ
      ?auto_31188 - OBJ
      ?auto_31189 - OBJ
      ?auto_31185 - LOCATION
    )
    :vars
    (
      ?auto_31192 - TRUCK
      ?auto_31191 - LOCATION
      ?auto_31190 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_31187 ?auto_31186 ) ) ( not ( = ?auto_31188 ?auto_31186 ) ) ( not ( = ?auto_31188 ?auto_31187 ) ) ( not ( = ?auto_31189 ?auto_31186 ) ) ( not ( = ?auto_31189 ?auto_31187 ) ) ( not ( = ?auto_31189 ?auto_31188 ) ) ( IN-TRUCK ?auto_31189 ?auto_31192 ) ( TRUCK-AT ?auto_31192 ?auto_31191 ) ( IN-CITY ?auto_31191 ?auto_31190 ) ( IN-CITY ?auto_31185 ?auto_31190 ) ( not ( = ?auto_31185 ?auto_31191 ) ) ( OBJ-AT ?auto_31186 ?auto_31185 ) ( OBJ-AT ?auto_31187 ?auto_31185 ) ( OBJ-AT ?auto_31188 ?auto_31185 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31186 ?auto_31189 ?auto_31185 )
      ( DELIVER-4PKG-VERIFY ?auto_31186 ?auto_31187 ?auto_31188 ?auto_31189 ?auto_31185 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31210 - OBJ
      ?auto_31211 - OBJ
      ?auto_31212 - OBJ
      ?auto_31213 - OBJ
      ?auto_31209 - LOCATION
    )
    :vars
    (
      ?auto_31216 - TRUCK
      ?auto_31215 - LOCATION
      ?auto_31214 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_31211 ?auto_31210 ) ) ( not ( = ?auto_31212 ?auto_31210 ) ) ( not ( = ?auto_31212 ?auto_31211 ) ) ( not ( = ?auto_31213 ?auto_31210 ) ) ( not ( = ?auto_31213 ?auto_31211 ) ) ( not ( = ?auto_31213 ?auto_31212 ) ) ( IN-TRUCK ?auto_31212 ?auto_31216 ) ( TRUCK-AT ?auto_31216 ?auto_31215 ) ( IN-CITY ?auto_31215 ?auto_31214 ) ( IN-CITY ?auto_31209 ?auto_31214 ) ( not ( = ?auto_31209 ?auto_31215 ) ) ( OBJ-AT ?auto_31210 ?auto_31209 ) ( OBJ-AT ?auto_31211 ?auto_31209 ) ( OBJ-AT ?auto_31213 ?auto_31209 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31210 ?auto_31212 ?auto_31209 )
      ( DELIVER-4PKG-VERIFY ?auto_31210 ?auto_31211 ?auto_31212 ?auto_31213 ?auto_31209 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31282 - OBJ
      ?auto_31283 - OBJ
      ?auto_31284 - OBJ
      ?auto_31285 - OBJ
      ?auto_31281 - LOCATION
    )
    :vars
    (
      ?auto_31288 - TRUCK
      ?auto_31287 - LOCATION
      ?auto_31286 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_31283 ?auto_31282 ) ) ( not ( = ?auto_31284 ?auto_31282 ) ) ( not ( = ?auto_31284 ?auto_31283 ) ) ( not ( = ?auto_31285 ?auto_31282 ) ) ( not ( = ?auto_31285 ?auto_31283 ) ) ( not ( = ?auto_31285 ?auto_31284 ) ) ( IN-TRUCK ?auto_31283 ?auto_31288 ) ( TRUCK-AT ?auto_31288 ?auto_31287 ) ( IN-CITY ?auto_31287 ?auto_31286 ) ( IN-CITY ?auto_31281 ?auto_31286 ) ( not ( = ?auto_31281 ?auto_31287 ) ) ( OBJ-AT ?auto_31282 ?auto_31281 ) ( OBJ-AT ?auto_31284 ?auto_31281 ) ( OBJ-AT ?auto_31285 ?auto_31281 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31282 ?auto_31283 ?auto_31281 )
      ( DELIVER-4PKG-VERIFY ?auto_31282 ?auto_31283 ?auto_31284 ?auto_31285 ?auto_31281 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31306 - OBJ
      ?auto_31307 - OBJ
      ?auto_31308 - OBJ
      ?auto_31309 - OBJ
      ?auto_31305 - LOCATION
    )
    :vars
    (
      ?auto_31312 - TRUCK
      ?auto_31311 - LOCATION
      ?auto_31310 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_31307 ?auto_31306 ) ) ( not ( = ?auto_31308 ?auto_31306 ) ) ( not ( = ?auto_31308 ?auto_31307 ) ) ( not ( = ?auto_31309 ?auto_31306 ) ) ( not ( = ?auto_31309 ?auto_31307 ) ) ( not ( = ?auto_31309 ?auto_31308 ) ) ( IN-TRUCK ?auto_31307 ?auto_31312 ) ( TRUCK-AT ?auto_31312 ?auto_31311 ) ( IN-CITY ?auto_31311 ?auto_31310 ) ( IN-CITY ?auto_31305 ?auto_31310 ) ( not ( = ?auto_31305 ?auto_31311 ) ) ( OBJ-AT ?auto_31306 ?auto_31305 ) ( OBJ-AT ?auto_31308 ?auto_31305 ) ( OBJ-AT ?auto_31309 ?auto_31305 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31306 ?auto_31307 ?auto_31305 )
      ( DELIVER-4PKG-VERIFY ?auto_31306 ?auto_31307 ?auto_31308 ?auto_31309 ?auto_31305 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31378 - OBJ
      ?auto_31379 - OBJ
      ?auto_31380 - OBJ
      ?auto_31381 - OBJ
      ?auto_31377 - LOCATION
    )
    :vars
    (
      ?auto_31384 - TRUCK
      ?auto_31383 - LOCATION
      ?auto_31382 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_31379 ?auto_31378 ) ) ( not ( = ?auto_31380 ?auto_31378 ) ) ( not ( = ?auto_31380 ?auto_31379 ) ) ( not ( = ?auto_31381 ?auto_31378 ) ) ( not ( = ?auto_31381 ?auto_31379 ) ) ( not ( = ?auto_31381 ?auto_31380 ) ) ( IN-TRUCK ?auto_31381 ?auto_31384 ) ( TRUCK-AT ?auto_31384 ?auto_31383 ) ( IN-CITY ?auto_31383 ?auto_31382 ) ( IN-CITY ?auto_31377 ?auto_31382 ) ( not ( = ?auto_31377 ?auto_31383 ) ) ( OBJ-AT ?auto_31379 ?auto_31377 ) ( OBJ-AT ?auto_31378 ?auto_31377 ) ( OBJ-AT ?auto_31380 ?auto_31377 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31379 ?auto_31381 ?auto_31377 )
      ( DELIVER-4PKG-VERIFY ?auto_31378 ?auto_31379 ?auto_31380 ?auto_31381 ?auto_31377 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31402 - OBJ
      ?auto_31403 - OBJ
      ?auto_31404 - OBJ
      ?auto_31405 - OBJ
      ?auto_31401 - LOCATION
    )
    :vars
    (
      ?auto_31408 - TRUCK
      ?auto_31407 - LOCATION
      ?auto_31406 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_31403 ?auto_31402 ) ) ( not ( = ?auto_31404 ?auto_31402 ) ) ( not ( = ?auto_31404 ?auto_31403 ) ) ( not ( = ?auto_31405 ?auto_31402 ) ) ( not ( = ?auto_31405 ?auto_31403 ) ) ( not ( = ?auto_31405 ?auto_31404 ) ) ( IN-TRUCK ?auto_31404 ?auto_31408 ) ( TRUCK-AT ?auto_31408 ?auto_31407 ) ( IN-CITY ?auto_31407 ?auto_31406 ) ( IN-CITY ?auto_31401 ?auto_31406 ) ( not ( = ?auto_31401 ?auto_31407 ) ) ( OBJ-AT ?auto_31403 ?auto_31401 ) ( OBJ-AT ?auto_31402 ?auto_31401 ) ( OBJ-AT ?auto_31405 ?auto_31401 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31403 ?auto_31404 ?auto_31401 )
      ( DELIVER-4PKG-VERIFY ?auto_31402 ?auto_31403 ?auto_31404 ?auto_31405 ?auto_31401 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31479 - OBJ
      ?auto_31480 - OBJ
      ?auto_31481 - OBJ
      ?auto_31482 - OBJ
      ?auto_31478 - LOCATION
    )
    :vars
    (
      ?auto_31485 - TRUCK
      ?auto_31484 - LOCATION
      ?auto_31483 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_31480 ?auto_31479 ) ) ( not ( = ?auto_31481 ?auto_31479 ) ) ( not ( = ?auto_31481 ?auto_31480 ) ) ( not ( = ?auto_31482 ?auto_31479 ) ) ( not ( = ?auto_31482 ?auto_31480 ) ) ( not ( = ?auto_31482 ?auto_31481 ) ) ( IN-TRUCK ?auto_31482 ?auto_31485 ) ( TRUCK-AT ?auto_31485 ?auto_31484 ) ( IN-CITY ?auto_31484 ?auto_31483 ) ( IN-CITY ?auto_31478 ?auto_31483 ) ( not ( = ?auto_31478 ?auto_31484 ) ) ( OBJ-AT ?auto_31481 ?auto_31478 ) ( OBJ-AT ?auto_31479 ?auto_31478 ) ( OBJ-AT ?auto_31480 ?auto_31478 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31481 ?auto_31482 ?auto_31478 )
      ( DELIVER-4PKG-VERIFY ?auto_31479 ?auto_31480 ?auto_31481 ?auto_31482 ?auto_31478 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31505 - OBJ
      ?auto_31506 - OBJ
      ?auto_31507 - OBJ
      ?auto_31508 - OBJ
      ?auto_31504 - LOCATION
    )
    :vars
    (
      ?auto_31511 - TRUCK
      ?auto_31510 - LOCATION
      ?auto_31509 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_31506 ?auto_31505 ) ) ( not ( = ?auto_31507 ?auto_31505 ) ) ( not ( = ?auto_31507 ?auto_31506 ) ) ( not ( = ?auto_31508 ?auto_31505 ) ) ( not ( = ?auto_31508 ?auto_31506 ) ) ( not ( = ?auto_31508 ?auto_31507 ) ) ( IN-TRUCK ?auto_31507 ?auto_31511 ) ( TRUCK-AT ?auto_31511 ?auto_31510 ) ( IN-CITY ?auto_31510 ?auto_31509 ) ( IN-CITY ?auto_31504 ?auto_31509 ) ( not ( = ?auto_31504 ?auto_31510 ) ) ( OBJ-AT ?auto_31508 ?auto_31504 ) ( OBJ-AT ?auto_31505 ?auto_31504 ) ( OBJ-AT ?auto_31506 ?auto_31504 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31508 ?auto_31507 ?auto_31504 )
      ( DELIVER-4PKG-VERIFY ?auto_31505 ?auto_31506 ?auto_31507 ?auto_31508 ?auto_31504 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31556 - OBJ
      ?auto_31557 - OBJ
      ?auto_31558 - OBJ
      ?auto_31559 - OBJ
      ?auto_31555 - LOCATION
    )
    :vars
    (
      ?auto_31562 - TRUCK
      ?auto_31561 - LOCATION
      ?auto_31560 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_31557 ?auto_31556 ) ) ( not ( = ?auto_31558 ?auto_31556 ) ) ( not ( = ?auto_31558 ?auto_31557 ) ) ( not ( = ?auto_31559 ?auto_31556 ) ) ( not ( = ?auto_31559 ?auto_31557 ) ) ( not ( = ?auto_31559 ?auto_31558 ) ) ( IN-TRUCK ?auto_31557 ?auto_31562 ) ( TRUCK-AT ?auto_31562 ?auto_31561 ) ( IN-CITY ?auto_31561 ?auto_31560 ) ( IN-CITY ?auto_31555 ?auto_31560 ) ( not ( = ?auto_31555 ?auto_31561 ) ) ( OBJ-AT ?auto_31558 ?auto_31555 ) ( OBJ-AT ?auto_31556 ?auto_31555 ) ( OBJ-AT ?auto_31559 ?auto_31555 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31558 ?auto_31557 ?auto_31555 )
      ( DELIVER-4PKG-VERIFY ?auto_31556 ?auto_31557 ?auto_31558 ?auto_31559 ?auto_31555 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31607 - OBJ
      ?auto_31608 - OBJ
      ?auto_31609 - OBJ
      ?auto_31610 - OBJ
      ?auto_31606 - LOCATION
    )
    :vars
    (
      ?auto_31613 - TRUCK
      ?auto_31612 - LOCATION
      ?auto_31611 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_31608 ?auto_31607 ) ) ( not ( = ?auto_31609 ?auto_31607 ) ) ( not ( = ?auto_31609 ?auto_31608 ) ) ( not ( = ?auto_31610 ?auto_31607 ) ) ( not ( = ?auto_31610 ?auto_31608 ) ) ( not ( = ?auto_31610 ?auto_31609 ) ) ( IN-TRUCK ?auto_31608 ?auto_31613 ) ( TRUCK-AT ?auto_31613 ?auto_31612 ) ( IN-CITY ?auto_31612 ?auto_31611 ) ( IN-CITY ?auto_31606 ?auto_31611 ) ( not ( = ?auto_31606 ?auto_31612 ) ) ( OBJ-AT ?auto_31610 ?auto_31606 ) ( OBJ-AT ?auto_31607 ?auto_31606 ) ( OBJ-AT ?auto_31609 ?auto_31606 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31610 ?auto_31608 ?auto_31606 )
      ( DELIVER-4PKG-VERIFY ?auto_31607 ?auto_31608 ?auto_31609 ?auto_31610 ?auto_31606 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31685 - OBJ
      ?auto_31686 - OBJ
      ?auto_31687 - OBJ
      ?auto_31688 - OBJ
      ?auto_31684 - LOCATION
    )
    :vars
    (
      ?auto_31691 - TRUCK
      ?auto_31690 - LOCATION
      ?auto_31689 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_31686 ?auto_31685 ) ) ( not ( = ?auto_31687 ?auto_31685 ) ) ( not ( = ?auto_31687 ?auto_31686 ) ) ( not ( = ?auto_31688 ?auto_31685 ) ) ( not ( = ?auto_31688 ?auto_31686 ) ) ( not ( = ?auto_31688 ?auto_31687 ) ) ( IN-TRUCK ?auto_31688 ?auto_31691 ) ( TRUCK-AT ?auto_31691 ?auto_31690 ) ( IN-CITY ?auto_31690 ?auto_31689 ) ( IN-CITY ?auto_31684 ?auto_31689 ) ( not ( = ?auto_31684 ?auto_31690 ) ) ( OBJ-AT ?auto_31686 ?auto_31684 ) ( OBJ-AT ?auto_31685 ?auto_31684 ) ( OBJ-AT ?auto_31687 ?auto_31684 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31686 ?auto_31688 ?auto_31684 )
      ( DELIVER-4PKG-VERIFY ?auto_31685 ?auto_31686 ?auto_31687 ?auto_31688 ?auto_31684 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31709 - OBJ
      ?auto_31710 - OBJ
      ?auto_31711 - OBJ
      ?auto_31712 - OBJ
      ?auto_31708 - LOCATION
    )
    :vars
    (
      ?auto_31715 - TRUCK
      ?auto_31714 - LOCATION
      ?auto_31713 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_31710 ?auto_31709 ) ) ( not ( = ?auto_31711 ?auto_31709 ) ) ( not ( = ?auto_31711 ?auto_31710 ) ) ( not ( = ?auto_31712 ?auto_31709 ) ) ( not ( = ?auto_31712 ?auto_31710 ) ) ( not ( = ?auto_31712 ?auto_31711 ) ) ( IN-TRUCK ?auto_31711 ?auto_31715 ) ( TRUCK-AT ?auto_31715 ?auto_31714 ) ( IN-CITY ?auto_31714 ?auto_31713 ) ( IN-CITY ?auto_31708 ?auto_31713 ) ( not ( = ?auto_31708 ?auto_31714 ) ) ( OBJ-AT ?auto_31710 ?auto_31708 ) ( OBJ-AT ?auto_31709 ?auto_31708 ) ( OBJ-AT ?auto_31712 ?auto_31708 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31710 ?auto_31711 ?auto_31708 )
      ( DELIVER-4PKG-VERIFY ?auto_31709 ?auto_31710 ?auto_31711 ?auto_31712 ?auto_31708 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31733 - OBJ
      ?auto_31734 - OBJ
      ?auto_31735 - OBJ
      ?auto_31736 - OBJ
      ?auto_31732 - LOCATION
    )
    :vars
    (
      ?auto_31739 - TRUCK
      ?auto_31738 - LOCATION
      ?auto_31737 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_31734 ?auto_31733 ) ) ( not ( = ?auto_31735 ?auto_31733 ) ) ( not ( = ?auto_31735 ?auto_31734 ) ) ( not ( = ?auto_31736 ?auto_31733 ) ) ( not ( = ?auto_31736 ?auto_31734 ) ) ( not ( = ?auto_31736 ?auto_31735 ) ) ( IN-TRUCK ?auto_31736 ?auto_31739 ) ( TRUCK-AT ?auto_31739 ?auto_31738 ) ( IN-CITY ?auto_31738 ?auto_31737 ) ( IN-CITY ?auto_31732 ?auto_31737 ) ( not ( = ?auto_31732 ?auto_31738 ) ) ( OBJ-AT ?auto_31735 ?auto_31732 ) ( OBJ-AT ?auto_31733 ?auto_31732 ) ( OBJ-AT ?auto_31734 ?auto_31732 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31735 ?auto_31736 ?auto_31732 )
      ( DELIVER-4PKG-VERIFY ?auto_31733 ?auto_31734 ?auto_31735 ?auto_31736 ?auto_31732 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31759 - OBJ
      ?auto_31760 - OBJ
      ?auto_31761 - OBJ
      ?auto_31762 - OBJ
      ?auto_31758 - LOCATION
    )
    :vars
    (
      ?auto_31765 - TRUCK
      ?auto_31764 - LOCATION
      ?auto_31763 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_31760 ?auto_31759 ) ) ( not ( = ?auto_31761 ?auto_31759 ) ) ( not ( = ?auto_31761 ?auto_31760 ) ) ( not ( = ?auto_31762 ?auto_31759 ) ) ( not ( = ?auto_31762 ?auto_31760 ) ) ( not ( = ?auto_31762 ?auto_31761 ) ) ( IN-TRUCK ?auto_31761 ?auto_31765 ) ( TRUCK-AT ?auto_31765 ?auto_31764 ) ( IN-CITY ?auto_31764 ?auto_31763 ) ( IN-CITY ?auto_31758 ?auto_31763 ) ( not ( = ?auto_31758 ?auto_31764 ) ) ( OBJ-AT ?auto_31762 ?auto_31758 ) ( OBJ-AT ?auto_31759 ?auto_31758 ) ( OBJ-AT ?auto_31760 ?auto_31758 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31762 ?auto_31761 ?auto_31758 )
      ( DELIVER-4PKG-VERIFY ?auto_31759 ?auto_31760 ?auto_31761 ?auto_31762 ?auto_31758 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31863 - OBJ
      ?auto_31864 - OBJ
      ?auto_31865 - OBJ
      ?auto_31866 - OBJ
      ?auto_31862 - LOCATION
    )
    :vars
    (
      ?auto_31869 - TRUCK
      ?auto_31868 - LOCATION
      ?auto_31867 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_31864 ?auto_31863 ) ) ( not ( = ?auto_31865 ?auto_31863 ) ) ( not ( = ?auto_31865 ?auto_31864 ) ) ( not ( = ?auto_31866 ?auto_31863 ) ) ( not ( = ?auto_31866 ?auto_31864 ) ) ( not ( = ?auto_31866 ?auto_31865 ) ) ( IN-TRUCK ?auto_31864 ?auto_31869 ) ( TRUCK-AT ?auto_31869 ?auto_31868 ) ( IN-CITY ?auto_31868 ?auto_31867 ) ( IN-CITY ?auto_31862 ?auto_31867 ) ( not ( = ?auto_31862 ?auto_31868 ) ) ( OBJ-AT ?auto_31865 ?auto_31862 ) ( OBJ-AT ?auto_31863 ?auto_31862 ) ( OBJ-AT ?auto_31866 ?auto_31862 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31865 ?auto_31864 ?auto_31862 )
      ( DELIVER-4PKG-VERIFY ?auto_31863 ?auto_31864 ?auto_31865 ?auto_31866 ?auto_31862 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_31887 - OBJ
      ?auto_31888 - OBJ
      ?auto_31889 - OBJ
      ?auto_31890 - OBJ
      ?auto_31886 - LOCATION
    )
    :vars
    (
      ?auto_31893 - TRUCK
      ?auto_31892 - LOCATION
      ?auto_31891 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_31888 ?auto_31887 ) ) ( not ( = ?auto_31889 ?auto_31887 ) ) ( not ( = ?auto_31889 ?auto_31888 ) ) ( not ( = ?auto_31890 ?auto_31887 ) ) ( not ( = ?auto_31890 ?auto_31888 ) ) ( not ( = ?auto_31890 ?auto_31889 ) ) ( IN-TRUCK ?auto_31888 ?auto_31893 ) ( TRUCK-AT ?auto_31893 ?auto_31892 ) ( IN-CITY ?auto_31892 ?auto_31891 ) ( IN-CITY ?auto_31886 ?auto_31891 ) ( not ( = ?auto_31886 ?auto_31892 ) ) ( OBJ-AT ?auto_31890 ?auto_31886 ) ( OBJ-AT ?auto_31887 ?auto_31886 ) ( OBJ-AT ?auto_31889 ?auto_31886 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31890 ?auto_31888 ?auto_31886 )
      ( DELIVER-4PKG-VERIFY ?auto_31887 ?auto_31888 ?auto_31889 ?auto_31890 ?auto_31886 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_32040 - OBJ
      ?auto_32041 - OBJ
      ?auto_32042 - OBJ
      ?auto_32043 - OBJ
      ?auto_32039 - LOCATION
    )
    :vars
    (
      ?auto_32046 - TRUCK
      ?auto_32045 - LOCATION
      ?auto_32044 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32041 ?auto_32040 ) ) ( not ( = ?auto_32042 ?auto_32040 ) ) ( not ( = ?auto_32042 ?auto_32041 ) ) ( not ( = ?auto_32043 ?auto_32040 ) ) ( not ( = ?auto_32043 ?auto_32041 ) ) ( not ( = ?auto_32043 ?auto_32042 ) ) ( IN-TRUCK ?auto_32040 ?auto_32046 ) ( TRUCK-AT ?auto_32046 ?auto_32045 ) ( IN-CITY ?auto_32045 ?auto_32044 ) ( IN-CITY ?auto_32039 ?auto_32044 ) ( not ( = ?auto_32039 ?auto_32045 ) ) ( OBJ-AT ?auto_32041 ?auto_32039 ) ( OBJ-AT ?auto_32042 ?auto_32039 ) ( OBJ-AT ?auto_32043 ?auto_32039 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32041 ?auto_32040 ?auto_32039 )
      ( DELIVER-4PKG-VERIFY ?auto_32040 ?auto_32041 ?auto_32042 ?auto_32043 ?auto_32039 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_32064 - OBJ
      ?auto_32065 - OBJ
      ?auto_32066 - OBJ
      ?auto_32067 - OBJ
      ?auto_32063 - LOCATION
    )
    :vars
    (
      ?auto_32070 - TRUCK
      ?auto_32069 - LOCATION
      ?auto_32068 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32065 ?auto_32064 ) ) ( not ( = ?auto_32066 ?auto_32064 ) ) ( not ( = ?auto_32066 ?auto_32065 ) ) ( not ( = ?auto_32067 ?auto_32064 ) ) ( not ( = ?auto_32067 ?auto_32065 ) ) ( not ( = ?auto_32067 ?auto_32066 ) ) ( IN-TRUCK ?auto_32064 ?auto_32070 ) ( TRUCK-AT ?auto_32070 ?auto_32069 ) ( IN-CITY ?auto_32069 ?auto_32068 ) ( IN-CITY ?auto_32063 ?auto_32068 ) ( not ( = ?auto_32063 ?auto_32069 ) ) ( OBJ-AT ?auto_32065 ?auto_32063 ) ( OBJ-AT ?auto_32066 ?auto_32063 ) ( OBJ-AT ?auto_32067 ?auto_32063 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32065 ?auto_32064 ?auto_32063 )
      ( DELIVER-4PKG-VERIFY ?auto_32064 ?auto_32065 ?auto_32066 ?auto_32067 ?auto_32063 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_32136 - OBJ
      ?auto_32137 - OBJ
      ?auto_32138 - OBJ
      ?auto_32139 - OBJ
      ?auto_32135 - LOCATION
    )
    :vars
    (
      ?auto_32142 - TRUCK
      ?auto_32141 - LOCATION
      ?auto_32140 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32137 ?auto_32136 ) ) ( not ( = ?auto_32138 ?auto_32136 ) ) ( not ( = ?auto_32138 ?auto_32137 ) ) ( not ( = ?auto_32139 ?auto_32136 ) ) ( not ( = ?auto_32139 ?auto_32137 ) ) ( not ( = ?auto_32139 ?auto_32138 ) ) ( IN-TRUCK ?auto_32136 ?auto_32142 ) ( TRUCK-AT ?auto_32142 ?auto_32141 ) ( IN-CITY ?auto_32141 ?auto_32140 ) ( IN-CITY ?auto_32135 ?auto_32140 ) ( not ( = ?auto_32135 ?auto_32141 ) ) ( OBJ-AT ?auto_32138 ?auto_32135 ) ( OBJ-AT ?auto_32137 ?auto_32135 ) ( OBJ-AT ?auto_32139 ?auto_32135 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32138 ?auto_32136 ?auto_32135 )
      ( DELIVER-4PKG-VERIFY ?auto_32136 ?auto_32137 ?auto_32138 ?auto_32139 ?auto_32135 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_32187 - OBJ
      ?auto_32188 - OBJ
      ?auto_32189 - OBJ
      ?auto_32190 - OBJ
      ?auto_32186 - LOCATION
    )
    :vars
    (
      ?auto_32193 - TRUCK
      ?auto_32192 - LOCATION
      ?auto_32191 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32188 ?auto_32187 ) ) ( not ( = ?auto_32189 ?auto_32187 ) ) ( not ( = ?auto_32189 ?auto_32188 ) ) ( not ( = ?auto_32190 ?auto_32187 ) ) ( not ( = ?auto_32190 ?auto_32188 ) ) ( not ( = ?auto_32190 ?auto_32189 ) ) ( IN-TRUCK ?auto_32187 ?auto_32193 ) ( TRUCK-AT ?auto_32193 ?auto_32192 ) ( IN-CITY ?auto_32192 ?auto_32191 ) ( IN-CITY ?auto_32186 ?auto_32191 ) ( not ( = ?auto_32186 ?auto_32192 ) ) ( OBJ-AT ?auto_32190 ?auto_32186 ) ( OBJ-AT ?auto_32188 ?auto_32186 ) ( OBJ-AT ?auto_32189 ?auto_32186 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32190 ?auto_32187 ?auto_32186 )
      ( DELIVER-4PKG-VERIFY ?auto_32187 ?auto_32188 ?auto_32189 ?auto_32190 ?auto_32186 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_32265 - OBJ
      ?auto_32266 - OBJ
      ?auto_32267 - OBJ
      ?auto_32268 - OBJ
      ?auto_32264 - LOCATION
    )
    :vars
    (
      ?auto_32271 - TRUCK
      ?auto_32270 - LOCATION
      ?auto_32269 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32266 ?auto_32265 ) ) ( not ( = ?auto_32267 ?auto_32265 ) ) ( not ( = ?auto_32267 ?auto_32266 ) ) ( not ( = ?auto_32268 ?auto_32265 ) ) ( not ( = ?auto_32268 ?auto_32266 ) ) ( not ( = ?auto_32268 ?auto_32267 ) ) ( IN-TRUCK ?auto_32265 ?auto_32271 ) ( TRUCK-AT ?auto_32271 ?auto_32270 ) ( IN-CITY ?auto_32270 ?auto_32269 ) ( IN-CITY ?auto_32264 ?auto_32269 ) ( not ( = ?auto_32264 ?auto_32270 ) ) ( OBJ-AT ?auto_32267 ?auto_32264 ) ( OBJ-AT ?auto_32266 ?auto_32264 ) ( OBJ-AT ?auto_32268 ?auto_32264 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32267 ?auto_32265 ?auto_32264 )
      ( DELIVER-4PKG-VERIFY ?auto_32265 ?auto_32266 ?auto_32267 ?auto_32268 ?auto_32264 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_32289 - OBJ
      ?auto_32290 - OBJ
      ?auto_32291 - OBJ
      ?auto_32292 - OBJ
      ?auto_32288 - LOCATION
    )
    :vars
    (
      ?auto_32295 - TRUCK
      ?auto_32294 - LOCATION
      ?auto_32293 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32290 ?auto_32289 ) ) ( not ( = ?auto_32291 ?auto_32289 ) ) ( not ( = ?auto_32291 ?auto_32290 ) ) ( not ( = ?auto_32292 ?auto_32289 ) ) ( not ( = ?auto_32292 ?auto_32290 ) ) ( not ( = ?auto_32292 ?auto_32291 ) ) ( IN-TRUCK ?auto_32289 ?auto_32295 ) ( TRUCK-AT ?auto_32295 ?auto_32294 ) ( IN-CITY ?auto_32294 ?auto_32293 ) ( IN-CITY ?auto_32288 ?auto_32293 ) ( not ( = ?auto_32288 ?auto_32294 ) ) ( OBJ-AT ?auto_32292 ?auto_32288 ) ( OBJ-AT ?auto_32290 ?auto_32288 ) ( OBJ-AT ?auto_32291 ?auto_32288 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32292 ?auto_32289 ?auto_32288 )
      ( DELIVER-4PKG-VERIFY ?auto_32289 ?auto_32290 ?auto_32291 ?auto_32292 ?auto_32288 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_32531 - OBJ
      ?auto_32530 - LOCATION
    )
    :vars
    (
      ?auto_32535 - OBJ
      ?auto_32534 - TRUCK
      ?auto_32533 - LOCATION
      ?auto_32532 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32531 ?auto_32535 ) ) ( TRUCK-AT ?auto_32534 ?auto_32533 ) ( IN-CITY ?auto_32533 ?auto_32532 ) ( IN-CITY ?auto_32530 ?auto_32532 ) ( not ( = ?auto_32530 ?auto_32533 ) ) ( OBJ-AT ?auto_32535 ?auto_32530 ) ( OBJ-AT ?auto_32531 ?auto_32533 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_32531 ?auto_32534 ?auto_32533 )
      ( DELIVER-2PKG ?auto_32535 ?auto_32531 ?auto_32530 )
      ( DELIVER-1PKG-VERIFY ?auto_32531 ?auto_32530 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_32537 - OBJ
      ?auto_32538 - OBJ
      ?auto_32536 - LOCATION
    )
    :vars
    (
      ?auto_32541 - TRUCK
      ?auto_32540 - LOCATION
      ?auto_32539 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32538 ?auto_32537 ) ) ( TRUCK-AT ?auto_32541 ?auto_32540 ) ( IN-CITY ?auto_32540 ?auto_32539 ) ( IN-CITY ?auto_32536 ?auto_32539 ) ( not ( = ?auto_32536 ?auto_32540 ) ) ( OBJ-AT ?auto_32537 ?auto_32536 ) ( OBJ-AT ?auto_32538 ?auto_32540 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_32538 ?auto_32536 )
      ( DELIVER-2PKG-VERIFY ?auto_32537 ?auto_32538 ?auto_32536 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_32543 - OBJ
      ?auto_32544 - OBJ
      ?auto_32542 - LOCATION
    )
    :vars
    (
      ?auto_32548 - OBJ
      ?auto_32545 - TRUCK
      ?auto_32547 - LOCATION
      ?auto_32546 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32544 ?auto_32543 ) ) ( not ( = ?auto_32544 ?auto_32548 ) ) ( TRUCK-AT ?auto_32545 ?auto_32547 ) ( IN-CITY ?auto_32547 ?auto_32546 ) ( IN-CITY ?auto_32542 ?auto_32546 ) ( not ( = ?auto_32542 ?auto_32547 ) ) ( OBJ-AT ?auto_32548 ?auto_32542 ) ( OBJ-AT ?auto_32544 ?auto_32547 ) ( OBJ-AT ?auto_32543 ?auto_32542 ) ( not ( = ?auto_32543 ?auto_32548 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32548 ?auto_32544 ?auto_32542 )
      ( DELIVER-2PKG-VERIFY ?auto_32543 ?auto_32544 ?auto_32542 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_32550 - OBJ
      ?auto_32551 - OBJ
      ?auto_32549 - LOCATION
    )
    :vars
    (
      ?auto_32555 - OBJ
      ?auto_32552 - TRUCK
      ?auto_32554 - LOCATION
      ?auto_32553 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32551 ?auto_32550 ) ) ( not ( = ?auto_32551 ?auto_32555 ) ) ( TRUCK-AT ?auto_32552 ?auto_32554 ) ( IN-CITY ?auto_32554 ?auto_32553 ) ( IN-CITY ?auto_32549 ?auto_32553 ) ( not ( = ?auto_32549 ?auto_32554 ) ) ( OBJ-AT ?auto_32555 ?auto_32549 ) ( OBJ-AT ?auto_32551 ?auto_32554 ) ( OBJ-AT ?auto_32550 ?auto_32549 ) ( not ( = ?auto_32550 ?auto_32555 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32555 ?auto_32551 ?auto_32549 )
      ( DELIVER-2PKG-VERIFY ?auto_32550 ?auto_32551 ?auto_32549 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_32557 - OBJ
      ?auto_32558 - OBJ
      ?auto_32556 - LOCATION
    )
    :vars
    (
      ?auto_32559 - TRUCK
      ?auto_32561 - LOCATION
      ?auto_32560 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32558 ?auto_32557 ) ) ( TRUCK-AT ?auto_32559 ?auto_32561 ) ( IN-CITY ?auto_32561 ?auto_32560 ) ( IN-CITY ?auto_32556 ?auto_32560 ) ( not ( = ?auto_32556 ?auto_32561 ) ) ( OBJ-AT ?auto_32558 ?auto_32556 ) ( OBJ-AT ?auto_32557 ?auto_32561 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32558 ?auto_32557 ?auto_32556 )
      ( DELIVER-2PKG-VERIFY ?auto_32557 ?auto_32558 ?auto_32556 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_32563 - OBJ
      ?auto_32564 - OBJ
      ?auto_32562 - LOCATION
    )
    :vars
    (
      ?auto_32568 - OBJ
      ?auto_32565 - TRUCK
      ?auto_32567 - LOCATION
      ?auto_32566 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32564 ?auto_32563 ) ) ( not ( = ?auto_32563 ?auto_32568 ) ) ( TRUCK-AT ?auto_32565 ?auto_32567 ) ( IN-CITY ?auto_32567 ?auto_32566 ) ( IN-CITY ?auto_32562 ?auto_32566 ) ( not ( = ?auto_32562 ?auto_32567 ) ) ( OBJ-AT ?auto_32568 ?auto_32562 ) ( OBJ-AT ?auto_32563 ?auto_32567 ) ( OBJ-AT ?auto_32564 ?auto_32562 ) ( not ( = ?auto_32564 ?auto_32568 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32568 ?auto_32563 ?auto_32562 )
      ( DELIVER-2PKG-VERIFY ?auto_32563 ?auto_32564 ?auto_32562 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_32570 - OBJ
      ?auto_32571 - OBJ
      ?auto_32569 - LOCATION
    )
    :vars
    (
      ?auto_32575 - OBJ
      ?auto_32572 - TRUCK
      ?auto_32574 - LOCATION
      ?auto_32573 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32571 ?auto_32570 ) ) ( not ( = ?auto_32570 ?auto_32575 ) ) ( TRUCK-AT ?auto_32572 ?auto_32574 ) ( IN-CITY ?auto_32574 ?auto_32573 ) ( IN-CITY ?auto_32569 ?auto_32573 ) ( not ( = ?auto_32569 ?auto_32574 ) ) ( OBJ-AT ?auto_32575 ?auto_32569 ) ( OBJ-AT ?auto_32570 ?auto_32574 ) ( OBJ-AT ?auto_32571 ?auto_32569 ) ( not ( = ?auto_32571 ?auto_32575 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32575 ?auto_32570 ?auto_32569 )
      ( DELIVER-2PKG-VERIFY ?auto_32570 ?auto_32571 ?auto_32569 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_32591 - OBJ
      ?auto_32592 - OBJ
      ?auto_32593 - OBJ
      ?auto_32590 - LOCATION
    )
    :vars
    (
      ?auto_32594 - TRUCK
      ?auto_32596 - LOCATION
      ?auto_32595 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32592 ?auto_32591 ) ) ( not ( = ?auto_32593 ?auto_32591 ) ) ( not ( = ?auto_32593 ?auto_32592 ) ) ( TRUCK-AT ?auto_32594 ?auto_32596 ) ( IN-CITY ?auto_32596 ?auto_32595 ) ( IN-CITY ?auto_32590 ?auto_32595 ) ( not ( = ?auto_32590 ?auto_32596 ) ) ( OBJ-AT ?auto_32591 ?auto_32590 ) ( OBJ-AT ?auto_32593 ?auto_32596 ) ( OBJ-AT ?auto_32592 ?auto_32590 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32591 ?auto_32593 ?auto_32590 )
      ( DELIVER-3PKG-VERIFY ?auto_32591 ?auto_32592 ?auto_32593 ?auto_32590 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_32598 - OBJ
      ?auto_32599 - OBJ
      ?auto_32600 - OBJ
      ?auto_32597 - LOCATION
    )
    :vars
    (
      ?auto_32601 - TRUCK
      ?auto_32603 - LOCATION
      ?auto_32602 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32599 ?auto_32598 ) ) ( not ( = ?auto_32600 ?auto_32598 ) ) ( not ( = ?auto_32600 ?auto_32599 ) ) ( TRUCK-AT ?auto_32601 ?auto_32603 ) ( IN-CITY ?auto_32603 ?auto_32602 ) ( IN-CITY ?auto_32597 ?auto_32602 ) ( not ( = ?auto_32597 ?auto_32603 ) ) ( OBJ-AT ?auto_32598 ?auto_32597 ) ( OBJ-AT ?auto_32600 ?auto_32603 ) ( OBJ-AT ?auto_32599 ?auto_32597 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32598 ?auto_32600 ?auto_32597 )
      ( DELIVER-3PKG-VERIFY ?auto_32598 ?auto_32599 ?auto_32600 ?auto_32597 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_32612 - OBJ
      ?auto_32613 - OBJ
      ?auto_32614 - OBJ
      ?auto_32611 - LOCATION
    )
    :vars
    (
      ?auto_32615 - TRUCK
      ?auto_32617 - LOCATION
      ?auto_32616 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32613 ?auto_32612 ) ) ( not ( = ?auto_32614 ?auto_32612 ) ) ( not ( = ?auto_32614 ?auto_32613 ) ) ( TRUCK-AT ?auto_32615 ?auto_32617 ) ( IN-CITY ?auto_32617 ?auto_32616 ) ( IN-CITY ?auto_32611 ?auto_32616 ) ( not ( = ?auto_32611 ?auto_32617 ) ) ( OBJ-AT ?auto_32612 ?auto_32611 ) ( OBJ-AT ?auto_32613 ?auto_32617 ) ( OBJ-AT ?auto_32614 ?auto_32611 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32612 ?auto_32613 ?auto_32611 )
      ( DELIVER-3PKG-VERIFY ?auto_32612 ?auto_32613 ?auto_32614 ?auto_32611 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_32619 - OBJ
      ?auto_32620 - OBJ
      ?auto_32621 - OBJ
      ?auto_32618 - LOCATION
    )
    :vars
    (
      ?auto_32622 - TRUCK
      ?auto_32624 - LOCATION
      ?auto_32623 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32620 ?auto_32619 ) ) ( not ( = ?auto_32621 ?auto_32619 ) ) ( not ( = ?auto_32621 ?auto_32620 ) ) ( TRUCK-AT ?auto_32622 ?auto_32624 ) ( IN-CITY ?auto_32624 ?auto_32623 ) ( IN-CITY ?auto_32618 ?auto_32623 ) ( not ( = ?auto_32618 ?auto_32624 ) ) ( OBJ-AT ?auto_32619 ?auto_32618 ) ( OBJ-AT ?auto_32620 ?auto_32624 ) ( OBJ-AT ?auto_32621 ?auto_32618 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32619 ?auto_32620 ?auto_32618 )
      ( DELIVER-3PKG-VERIFY ?auto_32619 ?auto_32620 ?auto_32621 ?auto_32618 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_32633 - OBJ
      ?auto_32634 - OBJ
      ?auto_32635 - OBJ
      ?auto_32632 - LOCATION
    )
    :vars
    (
      ?auto_32636 - TRUCK
      ?auto_32638 - LOCATION
      ?auto_32637 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32634 ?auto_32633 ) ) ( not ( = ?auto_32635 ?auto_32633 ) ) ( not ( = ?auto_32635 ?auto_32634 ) ) ( TRUCK-AT ?auto_32636 ?auto_32638 ) ( IN-CITY ?auto_32638 ?auto_32637 ) ( IN-CITY ?auto_32632 ?auto_32637 ) ( not ( = ?auto_32632 ?auto_32638 ) ) ( OBJ-AT ?auto_32634 ?auto_32632 ) ( OBJ-AT ?auto_32635 ?auto_32638 ) ( OBJ-AT ?auto_32633 ?auto_32632 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32634 ?auto_32635 ?auto_32632 )
      ( DELIVER-3PKG-VERIFY ?auto_32633 ?auto_32634 ?auto_32635 ?auto_32632 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_32648 - OBJ
      ?auto_32649 - OBJ
      ?auto_32650 - OBJ
      ?auto_32647 - LOCATION
    )
    :vars
    (
      ?auto_32654 - OBJ
      ?auto_32651 - TRUCK
      ?auto_32653 - LOCATION
      ?auto_32652 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32649 ?auto_32648 ) ) ( not ( = ?auto_32650 ?auto_32648 ) ) ( not ( = ?auto_32650 ?auto_32649 ) ) ( not ( = ?auto_32650 ?auto_32654 ) ) ( TRUCK-AT ?auto_32651 ?auto_32653 ) ( IN-CITY ?auto_32653 ?auto_32652 ) ( IN-CITY ?auto_32647 ?auto_32652 ) ( not ( = ?auto_32647 ?auto_32653 ) ) ( OBJ-AT ?auto_32654 ?auto_32647 ) ( OBJ-AT ?auto_32650 ?auto_32653 ) ( OBJ-AT ?auto_32648 ?auto_32647 ) ( OBJ-AT ?auto_32649 ?auto_32647 ) ( not ( = ?auto_32648 ?auto_32654 ) ) ( not ( = ?auto_32649 ?auto_32654 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32654 ?auto_32650 ?auto_32647 )
      ( DELIVER-3PKG-VERIFY ?auto_32648 ?auto_32649 ?auto_32650 ?auto_32647 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_32656 - OBJ
      ?auto_32657 - OBJ
      ?auto_32658 - OBJ
      ?auto_32655 - LOCATION
    )
    :vars
    (
      ?auto_32659 - TRUCK
      ?auto_32661 - LOCATION
      ?auto_32660 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32657 ?auto_32656 ) ) ( not ( = ?auto_32658 ?auto_32656 ) ) ( not ( = ?auto_32658 ?auto_32657 ) ) ( TRUCK-AT ?auto_32659 ?auto_32661 ) ( IN-CITY ?auto_32661 ?auto_32660 ) ( IN-CITY ?auto_32655 ?auto_32660 ) ( not ( = ?auto_32655 ?auto_32661 ) ) ( OBJ-AT ?auto_32658 ?auto_32655 ) ( OBJ-AT ?auto_32657 ?auto_32661 ) ( OBJ-AT ?auto_32656 ?auto_32655 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32658 ?auto_32657 ?auto_32655 )
      ( DELIVER-3PKG-VERIFY ?auto_32656 ?auto_32657 ?auto_32658 ?auto_32655 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_32671 - OBJ
      ?auto_32672 - OBJ
      ?auto_32673 - OBJ
      ?auto_32670 - LOCATION
    )
    :vars
    (
      ?auto_32677 - OBJ
      ?auto_32674 - TRUCK
      ?auto_32676 - LOCATION
      ?auto_32675 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32672 ?auto_32671 ) ) ( not ( = ?auto_32673 ?auto_32671 ) ) ( not ( = ?auto_32673 ?auto_32672 ) ) ( not ( = ?auto_32672 ?auto_32677 ) ) ( TRUCK-AT ?auto_32674 ?auto_32676 ) ( IN-CITY ?auto_32676 ?auto_32675 ) ( IN-CITY ?auto_32670 ?auto_32675 ) ( not ( = ?auto_32670 ?auto_32676 ) ) ( OBJ-AT ?auto_32677 ?auto_32670 ) ( OBJ-AT ?auto_32672 ?auto_32676 ) ( OBJ-AT ?auto_32671 ?auto_32670 ) ( OBJ-AT ?auto_32673 ?auto_32670 ) ( not ( = ?auto_32671 ?auto_32677 ) ) ( not ( = ?auto_32673 ?auto_32677 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32677 ?auto_32672 ?auto_32670 )
      ( DELIVER-3PKG-VERIFY ?auto_32671 ?auto_32672 ?auto_32673 ?auto_32670 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_32687 - OBJ
      ?auto_32688 - OBJ
      ?auto_32689 - OBJ
      ?auto_32686 - LOCATION
    )
    :vars
    (
      ?auto_32690 - TRUCK
      ?auto_32692 - LOCATION
      ?auto_32691 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32688 ?auto_32687 ) ) ( not ( = ?auto_32689 ?auto_32687 ) ) ( not ( = ?auto_32689 ?auto_32688 ) ) ( TRUCK-AT ?auto_32690 ?auto_32692 ) ( IN-CITY ?auto_32692 ?auto_32691 ) ( IN-CITY ?auto_32686 ?auto_32691 ) ( not ( = ?auto_32686 ?auto_32692 ) ) ( OBJ-AT ?auto_32688 ?auto_32686 ) ( OBJ-AT ?auto_32689 ?auto_32692 ) ( OBJ-AT ?auto_32687 ?auto_32686 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32688 ?auto_32689 ?auto_32686 )
      ( DELIVER-3PKG-VERIFY ?auto_32687 ?auto_32688 ?auto_32689 ?auto_32686 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_32694 - OBJ
      ?auto_32695 - OBJ
      ?auto_32696 - OBJ
      ?auto_32693 - LOCATION
    )
    :vars
    (
      ?auto_32700 - OBJ
      ?auto_32697 - TRUCK
      ?auto_32699 - LOCATION
      ?auto_32698 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32695 ?auto_32694 ) ) ( not ( = ?auto_32696 ?auto_32694 ) ) ( not ( = ?auto_32696 ?auto_32695 ) ) ( not ( = ?auto_32696 ?auto_32700 ) ) ( TRUCK-AT ?auto_32697 ?auto_32699 ) ( IN-CITY ?auto_32699 ?auto_32698 ) ( IN-CITY ?auto_32693 ?auto_32698 ) ( not ( = ?auto_32693 ?auto_32699 ) ) ( OBJ-AT ?auto_32700 ?auto_32693 ) ( OBJ-AT ?auto_32696 ?auto_32699 ) ( OBJ-AT ?auto_32694 ?auto_32693 ) ( OBJ-AT ?auto_32695 ?auto_32693 ) ( not ( = ?auto_32694 ?auto_32700 ) ) ( not ( = ?auto_32695 ?auto_32700 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32700 ?auto_32696 ?auto_32693 )
      ( DELIVER-3PKG-VERIFY ?auto_32694 ?auto_32695 ?auto_32696 ?auto_32693 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_32710 - OBJ
      ?auto_32711 - OBJ
      ?auto_32712 - OBJ
      ?auto_32709 - LOCATION
    )
    :vars
    (
      ?auto_32713 - TRUCK
      ?auto_32715 - LOCATION
      ?auto_32714 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32711 ?auto_32710 ) ) ( not ( = ?auto_32712 ?auto_32710 ) ) ( not ( = ?auto_32712 ?auto_32711 ) ) ( TRUCK-AT ?auto_32713 ?auto_32715 ) ( IN-CITY ?auto_32715 ?auto_32714 ) ( IN-CITY ?auto_32709 ?auto_32714 ) ( not ( = ?auto_32709 ?auto_32715 ) ) ( OBJ-AT ?auto_32712 ?auto_32709 ) ( OBJ-AT ?auto_32711 ?auto_32715 ) ( OBJ-AT ?auto_32710 ?auto_32709 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32712 ?auto_32711 ?auto_32709 )
      ( DELIVER-3PKG-VERIFY ?auto_32710 ?auto_32711 ?auto_32712 ?auto_32709 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_32717 - OBJ
      ?auto_32718 - OBJ
      ?auto_32719 - OBJ
      ?auto_32716 - LOCATION
    )
    :vars
    (
      ?auto_32723 - OBJ
      ?auto_32720 - TRUCK
      ?auto_32722 - LOCATION
      ?auto_32721 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32718 ?auto_32717 ) ) ( not ( = ?auto_32719 ?auto_32717 ) ) ( not ( = ?auto_32719 ?auto_32718 ) ) ( not ( = ?auto_32718 ?auto_32723 ) ) ( TRUCK-AT ?auto_32720 ?auto_32722 ) ( IN-CITY ?auto_32722 ?auto_32721 ) ( IN-CITY ?auto_32716 ?auto_32721 ) ( not ( = ?auto_32716 ?auto_32722 ) ) ( OBJ-AT ?auto_32723 ?auto_32716 ) ( OBJ-AT ?auto_32718 ?auto_32722 ) ( OBJ-AT ?auto_32717 ?auto_32716 ) ( OBJ-AT ?auto_32719 ?auto_32716 ) ( not ( = ?auto_32717 ?auto_32723 ) ) ( not ( = ?auto_32719 ?auto_32723 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32723 ?auto_32718 ?auto_32716 )
      ( DELIVER-3PKG-VERIFY ?auto_32717 ?auto_32718 ?auto_32719 ?auto_32716 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_32748 - OBJ
      ?auto_32749 - OBJ
      ?auto_32750 - OBJ
      ?auto_32747 - LOCATION
    )
    :vars
    (
      ?auto_32751 - TRUCK
      ?auto_32753 - LOCATION
      ?auto_32752 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32749 ?auto_32748 ) ) ( not ( = ?auto_32750 ?auto_32748 ) ) ( not ( = ?auto_32750 ?auto_32749 ) ) ( TRUCK-AT ?auto_32751 ?auto_32753 ) ( IN-CITY ?auto_32753 ?auto_32752 ) ( IN-CITY ?auto_32747 ?auto_32752 ) ( not ( = ?auto_32747 ?auto_32753 ) ) ( OBJ-AT ?auto_32749 ?auto_32747 ) ( OBJ-AT ?auto_32748 ?auto_32753 ) ( OBJ-AT ?auto_32750 ?auto_32747 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32749 ?auto_32748 ?auto_32747 )
      ( DELIVER-3PKG-VERIFY ?auto_32748 ?auto_32749 ?auto_32750 ?auto_32747 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_32755 - OBJ
      ?auto_32756 - OBJ
      ?auto_32757 - OBJ
      ?auto_32754 - LOCATION
    )
    :vars
    (
      ?auto_32758 - TRUCK
      ?auto_32760 - LOCATION
      ?auto_32759 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32756 ?auto_32755 ) ) ( not ( = ?auto_32757 ?auto_32755 ) ) ( not ( = ?auto_32757 ?auto_32756 ) ) ( TRUCK-AT ?auto_32758 ?auto_32760 ) ( IN-CITY ?auto_32760 ?auto_32759 ) ( IN-CITY ?auto_32754 ?auto_32759 ) ( not ( = ?auto_32754 ?auto_32760 ) ) ( OBJ-AT ?auto_32756 ?auto_32754 ) ( OBJ-AT ?auto_32755 ?auto_32760 ) ( OBJ-AT ?auto_32757 ?auto_32754 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32756 ?auto_32755 ?auto_32754 )
      ( DELIVER-3PKG-VERIFY ?auto_32755 ?auto_32756 ?auto_32757 ?auto_32754 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_32769 - OBJ
      ?auto_32770 - OBJ
      ?auto_32771 - OBJ
      ?auto_32768 - LOCATION
    )
    :vars
    (
      ?auto_32772 - TRUCK
      ?auto_32774 - LOCATION
      ?auto_32773 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32770 ?auto_32769 ) ) ( not ( = ?auto_32771 ?auto_32769 ) ) ( not ( = ?auto_32771 ?auto_32770 ) ) ( TRUCK-AT ?auto_32772 ?auto_32774 ) ( IN-CITY ?auto_32774 ?auto_32773 ) ( IN-CITY ?auto_32768 ?auto_32773 ) ( not ( = ?auto_32768 ?auto_32774 ) ) ( OBJ-AT ?auto_32771 ?auto_32768 ) ( OBJ-AT ?auto_32769 ?auto_32774 ) ( OBJ-AT ?auto_32770 ?auto_32768 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32771 ?auto_32769 ?auto_32768 )
      ( DELIVER-3PKG-VERIFY ?auto_32769 ?auto_32770 ?auto_32771 ?auto_32768 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_32784 - OBJ
      ?auto_32785 - OBJ
      ?auto_32786 - OBJ
      ?auto_32783 - LOCATION
    )
    :vars
    (
      ?auto_32790 - OBJ
      ?auto_32787 - TRUCK
      ?auto_32789 - LOCATION
      ?auto_32788 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32785 ?auto_32784 ) ) ( not ( = ?auto_32786 ?auto_32784 ) ) ( not ( = ?auto_32786 ?auto_32785 ) ) ( not ( = ?auto_32784 ?auto_32790 ) ) ( TRUCK-AT ?auto_32787 ?auto_32789 ) ( IN-CITY ?auto_32789 ?auto_32788 ) ( IN-CITY ?auto_32783 ?auto_32788 ) ( not ( = ?auto_32783 ?auto_32789 ) ) ( OBJ-AT ?auto_32790 ?auto_32783 ) ( OBJ-AT ?auto_32784 ?auto_32789 ) ( OBJ-AT ?auto_32785 ?auto_32783 ) ( OBJ-AT ?auto_32786 ?auto_32783 ) ( not ( = ?auto_32785 ?auto_32790 ) ) ( not ( = ?auto_32786 ?auto_32790 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32790 ?auto_32784 ?auto_32783 )
      ( DELIVER-3PKG-VERIFY ?auto_32784 ?auto_32785 ?auto_32786 ?auto_32783 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_32800 - OBJ
      ?auto_32801 - OBJ
      ?auto_32802 - OBJ
      ?auto_32799 - LOCATION
    )
    :vars
    (
      ?auto_32803 - TRUCK
      ?auto_32805 - LOCATION
      ?auto_32804 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32801 ?auto_32800 ) ) ( not ( = ?auto_32802 ?auto_32800 ) ) ( not ( = ?auto_32802 ?auto_32801 ) ) ( TRUCK-AT ?auto_32803 ?auto_32805 ) ( IN-CITY ?auto_32805 ?auto_32804 ) ( IN-CITY ?auto_32799 ?auto_32804 ) ( not ( = ?auto_32799 ?auto_32805 ) ) ( OBJ-AT ?auto_32802 ?auto_32799 ) ( OBJ-AT ?auto_32800 ?auto_32805 ) ( OBJ-AT ?auto_32801 ?auto_32799 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32802 ?auto_32800 ?auto_32799 )
      ( DELIVER-3PKG-VERIFY ?auto_32800 ?auto_32801 ?auto_32802 ?auto_32799 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_32807 - OBJ
      ?auto_32808 - OBJ
      ?auto_32809 - OBJ
      ?auto_32806 - LOCATION
    )
    :vars
    (
      ?auto_32813 - OBJ
      ?auto_32810 - TRUCK
      ?auto_32812 - LOCATION
      ?auto_32811 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32808 ?auto_32807 ) ) ( not ( = ?auto_32809 ?auto_32807 ) ) ( not ( = ?auto_32809 ?auto_32808 ) ) ( not ( = ?auto_32807 ?auto_32813 ) ) ( TRUCK-AT ?auto_32810 ?auto_32812 ) ( IN-CITY ?auto_32812 ?auto_32811 ) ( IN-CITY ?auto_32806 ?auto_32811 ) ( not ( = ?auto_32806 ?auto_32812 ) ) ( OBJ-AT ?auto_32813 ?auto_32806 ) ( OBJ-AT ?auto_32807 ?auto_32812 ) ( OBJ-AT ?auto_32808 ?auto_32806 ) ( OBJ-AT ?auto_32809 ?auto_32806 ) ( not ( = ?auto_32808 ?auto_32813 ) ) ( not ( = ?auto_32809 ?auto_32813 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32813 ?auto_32807 ?auto_32806 )
      ( DELIVER-3PKG-VERIFY ?auto_32807 ?auto_32808 ?auto_32809 ?auto_32806 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_32934 - OBJ
      ?auto_32935 - OBJ
      ?auto_32936 - OBJ
      ?auto_32937 - OBJ
      ?auto_32933 - LOCATION
    )
    :vars
    (
      ?auto_32938 - TRUCK
      ?auto_32940 - LOCATION
      ?auto_32939 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32935 ?auto_32934 ) ) ( not ( = ?auto_32936 ?auto_32934 ) ) ( not ( = ?auto_32936 ?auto_32935 ) ) ( not ( = ?auto_32937 ?auto_32934 ) ) ( not ( = ?auto_32937 ?auto_32935 ) ) ( not ( = ?auto_32937 ?auto_32936 ) ) ( TRUCK-AT ?auto_32938 ?auto_32940 ) ( IN-CITY ?auto_32940 ?auto_32939 ) ( IN-CITY ?auto_32933 ?auto_32939 ) ( not ( = ?auto_32933 ?auto_32940 ) ) ( OBJ-AT ?auto_32934 ?auto_32933 ) ( OBJ-AT ?auto_32937 ?auto_32940 ) ( OBJ-AT ?auto_32935 ?auto_32933 ) ( OBJ-AT ?auto_32936 ?auto_32933 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32934 ?auto_32937 ?auto_32933 )
      ( DELIVER-4PKG-VERIFY ?auto_32934 ?auto_32935 ?auto_32936 ?auto_32937 ?auto_32933 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_32958 - OBJ
      ?auto_32959 - OBJ
      ?auto_32960 - OBJ
      ?auto_32961 - OBJ
      ?auto_32957 - LOCATION
    )
    :vars
    (
      ?auto_32962 - TRUCK
      ?auto_32964 - LOCATION
      ?auto_32963 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32959 ?auto_32958 ) ) ( not ( = ?auto_32960 ?auto_32958 ) ) ( not ( = ?auto_32960 ?auto_32959 ) ) ( not ( = ?auto_32961 ?auto_32958 ) ) ( not ( = ?auto_32961 ?auto_32959 ) ) ( not ( = ?auto_32961 ?auto_32960 ) ) ( TRUCK-AT ?auto_32962 ?auto_32964 ) ( IN-CITY ?auto_32964 ?auto_32963 ) ( IN-CITY ?auto_32957 ?auto_32963 ) ( not ( = ?auto_32957 ?auto_32964 ) ) ( OBJ-AT ?auto_32958 ?auto_32957 ) ( OBJ-AT ?auto_32960 ?auto_32964 ) ( OBJ-AT ?auto_32959 ?auto_32957 ) ( OBJ-AT ?auto_32961 ?auto_32957 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32958 ?auto_32960 ?auto_32957 )
      ( DELIVER-4PKG-VERIFY ?auto_32958 ?auto_32959 ?auto_32960 ?auto_32961 ?auto_32957 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_32982 - OBJ
      ?auto_32983 - OBJ
      ?auto_32984 - OBJ
      ?auto_32985 - OBJ
      ?auto_32981 - LOCATION
    )
    :vars
    (
      ?auto_32986 - TRUCK
      ?auto_32988 - LOCATION
      ?auto_32987 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_32983 ?auto_32982 ) ) ( not ( = ?auto_32984 ?auto_32982 ) ) ( not ( = ?auto_32984 ?auto_32983 ) ) ( not ( = ?auto_32985 ?auto_32982 ) ) ( not ( = ?auto_32985 ?auto_32983 ) ) ( not ( = ?auto_32985 ?auto_32984 ) ) ( TRUCK-AT ?auto_32986 ?auto_32988 ) ( IN-CITY ?auto_32988 ?auto_32987 ) ( IN-CITY ?auto_32981 ?auto_32987 ) ( not ( = ?auto_32981 ?auto_32988 ) ) ( OBJ-AT ?auto_32982 ?auto_32981 ) ( OBJ-AT ?auto_32985 ?auto_32988 ) ( OBJ-AT ?auto_32983 ?auto_32981 ) ( OBJ-AT ?auto_32984 ?auto_32981 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32982 ?auto_32985 ?auto_32981 )
      ( DELIVER-4PKG-VERIFY ?auto_32982 ?auto_32983 ?auto_32984 ?auto_32985 ?auto_32981 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_33006 - OBJ
      ?auto_33007 - OBJ
      ?auto_33008 - OBJ
      ?auto_33009 - OBJ
      ?auto_33005 - LOCATION
    )
    :vars
    (
      ?auto_33010 - TRUCK
      ?auto_33012 - LOCATION
      ?auto_33011 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_33007 ?auto_33006 ) ) ( not ( = ?auto_33008 ?auto_33006 ) ) ( not ( = ?auto_33008 ?auto_33007 ) ) ( not ( = ?auto_33009 ?auto_33006 ) ) ( not ( = ?auto_33009 ?auto_33007 ) ) ( not ( = ?auto_33009 ?auto_33008 ) ) ( TRUCK-AT ?auto_33010 ?auto_33012 ) ( IN-CITY ?auto_33012 ?auto_33011 ) ( IN-CITY ?auto_33005 ?auto_33011 ) ( not ( = ?auto_33005 ?auto_33012 ) ) ( OBJ-AT ?auto_33006 ?auto_33005 ) ( OBJ-AT ?auto_33008 ?auto_33012 ) ( OBJ-AT ?auto_33007 ?auto_33005 ) ( OBJ-AT ?auto_33009 ?auto_33005 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_33006 ?auto_33008 ?auto_33005 )
      ( DELIVER-4PKG-VERIFY ?auto_33006 ?auto_33007 ?auto_33008 ?auto_33009 ?auto_33005 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_33078 - OBJ
      ?auto_33079 - OBJ
      ?auto_33080 - OBJ
      ?auto_33081 - OBJ
      ?auto_33077 - LOCATION
    )
    :vars
    (
      ?auto_33082 - TRUCK
      ?auto_33084 - LOCATION
      ?auto_33083 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_33079 ?auto_33078 ) ) ( not ( = ?auto_33080 ?auto_33078 ) ) ( not ( = ?auto_33080 ?auto_33079 ) ) ( not ( = ?auto_33081 ?auto_33078 ) ) ( not ( = ?auto_33081 ?auto_33079 ) ) ( not ( = ?auto_33081 ?auto_33080 ) ) ( TRUCK-AT ?auto_33082 ?auto_33084 ) ( IN-CITY ?auto_33084 ?auto_33083 ) ( IN-CITY ?auto_33077 ?auto_33083 ) ( not ( = ?auto_33077 ?auto_33084 ) ) ( OBJ-AT ?auto_33078 ?auto_33077 ) ( OBJ-AT ?auto_33079 ?auto_33084 ) ( OBJ-AT ?auto_33080 ?auto_33077 ) ( OBJ-AT ?auto_33081 ?auto_33077 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_33078 ?auto_33079 ?auto_33077 )
      ( DELIVER-4PKG-VERIFY ?auto_33078 ?auto_33079 ?auto_33080 ?auto_33081 ?auto_33077 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_33102 - OBJ
      ?auto_33103 - OBJ
      ?auto_33104 - OBJ
      ?auto_33105 - OBJ
      ?auto_33101 - LOCATION
    )
    :vars
    (
      ?auto_33106 - TRUCK
      ?auto_33108 - LOCATION
      ?auto_33107 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_33103 ?auto_33102 ) ) ( not ( = ?auto_33104 ?auto_33102 ) ) ( not ( = ?auto_33104 ?auto_33103 ) ) ( not ( = ?auto_33105 ?auto_33102 ) ) ( not ( = ?auto_33105 ?auto_33103 ) ) ( not ( = ?auto_33105 ?auto_33104 ) ) ( TRUCK-AT ?auto_33106 ?auto_33108 ) ( IN-CITY ?auto_33108 ?auto_33107 ) ( IN-CITY ?auto_33101 ?auto_33107 ) ( not ( = ?auto_33101 ?auto_33108 ) ) ( OBJ-AT ?auto_33102 ?auto_33101 ) ( OBJ-AT ?auto_33103 ?auto_33108 ) ( OBJ-AT ?auto_33104 ?auto_33101 ) ( OBJ-AT ?auto_33105 ?auto_33101 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_33102 ?auto_33103 ?auto_33101 )
      ( DELIVER-4PKG-VERIFY ?auto_33102 ?auto_33103 ?auto_33104 ?auto_33105 ?auto_33101 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_33174 - OBJ
      ?auto_33175 - OBJ
      ?auto_33176 - OBJ
      ?auto_33177 - OBJ
      ?auto_33173 - LOCATION
    )
    :vars
    (
      ?auto_33178 - TRUCK
      ?auto_33180 - LOCATION
      ?auto_33179 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_33175 ?auto_33174 ) ) ( not ( = ?auto_33176 ?auto_33174 ) ) ( not ( = ?auto_33176 ?auto_33175 ) ) ( not ( = ?auto_33177 ?auto_33174 ) ) ( not ( = ?auto_33177 ?auto_33175 ) ) ( not ( = ?auto_33177 ?auto_33176 ) ) ( TRUCK-AT ?auto_33178 ?auto_33180 ) ( IN-CITY ?auto_33180 ?auto_33179 ) ( IN-CITY ?auto_33173 ?auto_33179 ) ( not ( = ?auto_33173 ?auto_33180 ) ) ( OBJ-AT ?auto_33175 ?auto_33173 ) ( OBJ-AT ?auto_33177 ?auto_33180 ) ( OBJ-AT ?auto_33174 ?auto_33173 ) ( OBJ-AT ?auto_33176 ?auto_33173 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_33175 ?auto_33177 ?auto_33173 )
      ( DELIVER-4PKG-VERIFY ?auto_33174 ?auto_33175 ?auto_33176 ?auto_33177 ?auto_33173 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_33198 - OBJ
      ?auto_33199 - OBJ
      ?auto_33200 - OBJ
      ?auto_33201 - OBJ
      ?auto_33197 - LOCATION
    )
    :vars
    (
      ?auto_33202 - TRUCK
      ?auto_33204 - LOCATION
      ?auto_33203 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_33199 ?auto_33198 ) ) ( not ( = ?auto_33200 ?auto_33198 ) ) ( not ( = ?auto_33200 ?auto_33199 ) ) ( not ( = ?auto_33201 ?auto_33198 ) ) ( not ( = ?auto_33201 ?auto_33199 ) ) ( not ( = ?auto_33201 ?auto_33200 ) ) ( TRUCK-AT ?auto_33202 ?auto_33204 ) ( IN-CITY ?auto_33204 ?auto_33203 ) ( IN-CITY ?auto_33197 ?auto_33203 ) ( not ( = ?auto_33197 ?auto_33204 ) ) ( OBJ-AT ?auto_33199 ?auto_33197 ) ( OBJ-AT ?auto_33200 ?auto_33204 ) ( OBJ-AT ?auto_33198 ?auto_33197 ) ( OBJ-AT ?auto_33201 ?auto_33197 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_33199 ?auto_33200 ?auto_33197 )
      ( DELIVER-4PKG-VERIFY ?auto_33198 ?auto_33199 ?auto_33200 ?auto_33201 ?auto_33197 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_33275 - OBJ
      ?auto_33276 - OBJ
      ?auto_33277 - OBJ
      ?auto_33278 - OBJ
      ?auto_33274 - LOCATION
    )
    :vars
    (
      ?auto_33279 - TRUCK
      ?auto_33281 - LOCATION
      ?auto_33280 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_33276 ?auto_33275 ) ) ( not ( = ?auto_33277 ?auto_33275 ) ) ( not ( = ?auto_33277 ?auto_33276 ) ) ( not ( = ?auto_33278 ?auto_33275 ) ) ( not ( = ?auto_33278 ?auto_33276 ) ) ( not ( = ?auto_33278 ?auto_33277 ) ) ( TRUCK-AT ?auto_33279 ?auto_33281 ) ( IN-CITY ?auto_33281 ?auto_33280 ) ( IN-CITY ?auto_33274 ?auto_33280 ) ( not ( = ?auto_33274 ?auto_33281 ) ) ( OBJ-AT ?auto_33277 ?auto_33274 ) ( OBJ-AT ?auto_33278 ?auto_33281 ) ( OBJ-AT ?auto_33275 ?auto_33274 ) ( OBJ-AT ?auto_33276 ?auto_33274 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_33277 ?auto_33278 ?auto_33274 )
      ( DELIVER-4PKG-VERIFY ?auto_33275 ?auto_33276 ?auto_33277 ?auto_33278 ?auto_33274 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_33301 - OBJ
      ?auto_33302 - OBJ
      ?auto_33303 - OBJ
      ?auto_33304 - OBJ
      ?auto_33300 - LOCATION
    )
    :vars
    (
      ?auto_33305 - TRUCK
      ?auto_33307 - LOCATION
      ?auto_33306 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_33302 ?auto_33301 ) ) ( not ( = ?auto_33303 ?auto_33301 ) ) ( not ( = ?auto_33303 ?auto_33302 ) ) ( not ( = ?auto_33304 ?auto_33301 ) ) ( not ( = ?auto_33304 ?auto_33302 ) ) ( not ( = ?auto_33304 ?auto_33303 ) ) ( TRUCK-AT ?auto_33305 ?auto_33307 ) ( IN-CITY ?auto_33307 ?auto_33306 ) ( IN-CITY ?auto_33300 ?auto_33306 ) ( not ( = ?auto_33300 ?auto_33307 ) ) ( OBJ-AT ?auto_33304 ?auto_33300 ) ( OBJ-AT ?auto_33303 ?auto_33307 ) ( OBJ-AT ?auto_33301 ?auto_33300 ) ( OBJ-AT ?auto_33302 ?auto_33300 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_33304 ?auto_33303 ?auto_33300 )
      ( DELIVER-4PKG-VERIFY ?auto_33301 ?auto_33302 ?auto_33303 ?auto_33304 ?auto_33300 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_33352 - OBJ
      ?auto_33353 - OBJ
      ?auto_33354 - OBJ
      ?auto_33355 - OBJ
      ?auto_33351 - LOCATION
    )
    :vars
    (
      ?auto_33356 - TRUCK
      ?auto_33358 - LOCATION
      ?auto_33357 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_33353 ?auto_33352 ) ) ( not ( = ?auto_33354 ?auto_33352 ) ) ( not ( = ?auto_33354 ?auto_33353 ) ) ( not ( = ?auto_33355 ?auto_33352 ) ) ( not ( = ?auto_33355 ?auto_33353 ) ) ( not ( = ?auto_33355 ?auto_33354 ) ) ( TRUCK-AT ?auto_33356 ?auto_33358 ) ( IN-CITY ?auto_33358 ?auto_33357 ) ( IN-CITY ?auto_33351 ?auto_33357 ) ( not ( = ?auto_33351 ?auto_33358 ) ) ( OBJ-AT ?auto_33354 ?auto_33351 ) ( OBJ-AT ?auto_33353 ?auto_33358 ) ( OBJ-AT ?auto_33352 ?auto_33351 ) ( OBJ-AT ?auto_33355 ?auto_33351 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_33354 ?auto_33353 ?auto_33351 )
      ( DELIVER-4PKG-VERIFY ?auto_33352 ?auto_33353 ?auto_33354 ?auto_33355 ?auto_33351 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_33403 - OBJ
      ?auto_33404 - OBJ
      ?auto_33405 - OBJ
      ?auto_33406 - OBJ
      ?auto_33402 - LOCATION
    )
    :vars
    (
      ?auto_33407 - TRUCK
      ?auto_33409 - LOCATION
      ?auto_33408 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_33404 ?auto_33403 ) ) ( not ( = ?auto_33405 ?auto_33403 ) ) ( not ( = ?auto_33405 ?auto_33404 ) ) ( not ( = ?auto_33406 ?auto_33403 ) ) ( not ( = ?auto_33406 ?auto_33404 ) ) ( not ( = ?auto_33406 ?auto_33405 ) ) ( TRUCK-AT ?auto_33407 ?auto_33409 ) ( IN-CITY ?auto_33409 ?auto_33408 ) ( IN-CITY ?auto_33402 ?auto_33408 ) ( not ( = ?auto_33402 ?auto_33409 ) ) ( OBJ-AT ?auto_33406 ?auto_33402 ) ( OBJ-AT ?auto_33404 ?auto_33409 ) ( OBJ-AT ?auto_33403 ?auto_33402 ) ( OBJ-AT ?auto_33405 ?auto_33402 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_33406 ?auto_33404 ?auto_33402 )
      ( DELIVER-4PKG-VERIFY ?auto_33403 ?auto_33404 ?auto_33405 ?auto_33406 ?auto_33402 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_33481 - OBJ
      ?auto_33482 - OBJ
      ?auto_33483 - OBJ
      ?auto_33484 - OBJ
      ?auto_33480 - LOCATION
    )
    :vars
    (
      ?auto_33485 - TRUCK
      ?auto_33487 - LOCATION
      ?auto_33486 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_33482 ?auto_33481 ) ) ( not ( = ?auto_33483 ?auto_33481 ) ) ( not ( = ?auto_33483 ?auto_33482 ) ) ( not ( = ?auto_33484 ?auto_33481 ) ) ( not ( = ?auto_33484 ?auto_33482 ) ) ( not ( = ?auto_33484 ?auto_33483 ) ) ( TRUCK-AT ?auto_33485 ?auto_33487 ) ( IN-CITY ?auto_33487 ?auto_33486 ) ( IN-CITY ?auto_33480 ?auto_33486 ) ( not ( = ?auto_33480 ?auto_33487 ) ) ( OBJ-AT ?auto_33482 ?auto_33480 ) ( OBJ-AT ?auto_33484 ?auto_33487 ) ( OBJ-AT ?auto_33481 ?auto_33480 ) ( OBJ-AT ?auto_33483 ?auto_33480 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_33482 ?auto_33484 ?auto_33480 )
      ( DELIVER-4PKG-VERIFY ?auto_33481 ?auto_33482 ?auto_33483 ?auto_33484 ?auto_33480 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_33505 - OBJ
      ?auto_33506 - OBJ
      ?auto_33507 - OBJ
      ?auto_33508 - OBJ
      ?auto_33504 - LOCATION
    )
    :vars
    (
      ?auto_33509 - TRUCK
      ?auto_33511 - LOCATION
      ?auto_33510 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_33506 ?auto_33505 ) ) ( not ( = ?auto_33507 ?auto_33505 ) ) ( not ( = ?auto_33507 ?auto_33506 ) ) ( not ( = ?auto_33508 ?auto_33505 ) ) ( not ( = ?auto_33508 ?auto_33506 ) ) ( not ( = ?auto_33508 ?auto_33507 ) ) ( TRUCK-AT ?auto_33509 ?auto_33511 ) ( IN-CITY ?auto_33511 ?auto_33510 ) ( IN-CITY ?auto_33504 ?auto_33510 ) ( not ( = ?auto_33504 ?auto_33511 ) ) ( OBJ-AT ?auto_33506 ?auto_33504 ) ( OBJ-AT ?auto_33507 ?auto_33511 ) ( OBJ-AT ?auto_33505 ?auto_33504 ) ( OBJ-AT ?auto_33508 ?auto_33504 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_33506 ?auto_33507 ?auto_33504 )
      ( DELIVER-4PKG-VERIFY ?auto_33505 ?auto_33506 ?auto_33507 ?auto_33508 ?auto_33504 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_33529 - OBJ
      ?auto_33530 - OBJ
      ?auto_33531 - OBJ
      ?auto_33532 - OBJ
      ?auto_33528 - LOCATION
    )
    :vars
    (
      ?auto_33533 - TRUCK
      ?auto_33535 - LOCATION
      ?auto_33534 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_33530 ?auto_33529 ) ) ( not ( = ?auto_33531 ?auto_33529 ) ) ( not ( = ?auto_33531 ?auto_33530 ) ) ( not ( = ?auto_33532 ?auto_33529 ) ) ( not ( = ?auto_33532 ?auto_33530 ) ) ( not ( = ?auto_33532 ?auto_33531 ) ) ( TRUCK-AT ?auto_33533 ?auto_33535 ) ( IN-CITY ?auto_33535 ?auto_33534 ) ( IN-CITY ?auto_33528 ?auto_33534 ) ( not ( = ?auto_33528 ?auto_33535 ) ) ( OBJ-AT ?auto_33531 ?auto_33528 ) ( OBJ-AT ?auto_33532 ?auto_33535 ) ( OBJ-AT ?auto_33529 ?auto_33528 ) ( OBJ-AT ?auto_33530 ?auto_33528 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_33531 ?auto_33532 ?auto_33528 )
      ( DELIVER-4PKG-VERIFY ?auto_33529 ?auto_33530 ?auto_33531 ?auto_33532 ?auto_33528 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_33555 - OBJ
      ?auto_33556 - OBJ
      ?auto_33557 - OBJ
      ?auto_33558 - OBJ
      ?auto_33554 - LOCATION
    )
    :vars
    (
      ?auto_33559 - TRUCK
      ?auto_33561 - LOCATION
      ?auto_33560 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_33556 ?auto_33555 ) ) ( not ( = ?auto_33557 ?auto_33555 ) ) ( not ( = ?auto_33557 ?auto_33556 ) ) ( not ( = ?auto_33558 ?auto_33555 ) ) ( not ( = ?auto_33558 ?auto_33556 ) ) ( not ( = ?auto_33558 ?auto_33557 ) ) ( TRUCK-AT ?auto_33559 ?auto_33561 ) ( IN-CITY ?auto_33561 ?auto_33560 ) ( IN-CITY ?auto_33554 ?auto_33560 ) ( not ( = ?auto_33554 ?auto_33561 ) ) ( OBJ-AT ?auto_33558 ?auto_33554 ) ( OBJ-AT ?auto_33557 ?auto_33561 ) ( OBJ-AT ?auto_33555 ?auto_33554 ) ( OBJ-AT ?auto_33556 ?auto_33554 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_33558 ?auto_33557 ?auto_33554 )
      ( DELIVER-4PKG-VERIFY ?auto_33555 ?auto_33556 ?auto_33557 ?auto_33558 ?auto_33554 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_33659 - OBJ
      ?auto_33660 - OBJ
      ?auto_33661 - OBJ
      ?auto_33662 - OBJ
      ?auto_33658 - LOCATION
    )
    :vars
    (
      ?auto_33663 - TRUCK
      ?auto_33665 - LOCATION
      ?auto_33664 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_33660 ?auto_33659 ) ) ( not ( = ?auto_33661 ?auto_33659 ) ) ( not ( = ?auto_33661 ?auto_33660 ) ) ( not ( = ?auto_33662 ?auto_33659 ) ) ( not ( = ?auto_33662 ?auto_33660 ) ) ( not ( = ?auto_33662 ?auto_33661 ) ) ( TRUCK-AT ?auto_33663 ?auto_33665 ) ( IN-CITY ?auto_33665 ?auto_33664 ) ( IN-CITY ?auto_33658 ?auto_33664 ) ( not ( = ?auto_33658 ?auto_33665 ) ) ( OBJ-AT ?auto_33661 ?auto_33658 ) ( OBJ-AT ?auto_33660 ?auto_33665 ) ( OBJ-AT ?auto_33659 ?auto_33658 ) ( OBJ-AT ?auto_33662 ?auto_33658 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_33661 ?auto_33660 ?auto_33658 )
      ( DELIVER-4PKG-VERIFY ?auto_33659 ?auto_33660 ?auto_33661 ?auto_33662 ?auto_33658 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_33683 - OBJ
      ?auto_33684 - OBJ
      ?auto_33685 - OBJ
      ?auto_33686 - OBJ
      ?auto_33682 - LOCATION
    )
    :vars
    (
      ?auto_33687 - TRUCK
      ?auto_33689 - LOCATION
      ?auto_33688 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_33684 ?auto_33683 ) ) ( not ( = ?auto_33685 ?auto_33683 ) ) ( not ( = ?auto_33685 ?auto_33684 ) ) ( not ( = ?auto_33686 ?auto_33683 ) ) ( not ( = ?auto_33686 ?auto_33684 ) ) ( not ( = ?auto_33686 ?auto_33685 ) ) ( TRUCK-AT ?auto_33687 ?auto_33689 ) ( IN-CITY ?auto_33689 ?auto_33688 ) ( IN-CITY ?auto_33682 ?auto_33688 ) ( not ( = ?auto_33682 ?auto_33689 ) ) ( OBJ-AT ?auto_33686 ?auto_33682 ) ( OBJ-AT ?auto_33684 ?auto_33689 ) ( OBJ-AT ?auto_33683 ?auto_33682 ) ( OBJ-AT ?auto_33685 ?auto_33682 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_33686 ?auto_33684 ?auto_33682 )
      ( DELIVER-4PKG-VERIFY ?auto_33683 ?auto_33684 ?auto_33685 ?auto_33686 ?auto_33682 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_33836 - OBJ
      ?auto_33837 - OBJ
      ?auto_33838 - OBJ
      ?auto_33839 - OBJ
      ?auto_33835 - LOCATION
    )
    :vars
    (
      ?auto_33840 - TRUCK
      ?auto_33842 - LOCATION
      ?auto_33841 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_33837 ?auto_33836 ) ) ( not ( = ?auto_33838 ?auto_33836 ) ) ( not ( = ?auto_33838 ?auto_33837 ) ) ( not ( = ?auto_33839 ?auto_33836 ) ) ( not ( = ?auto_33839 ?auto_33837 ) ) ( not ( = ?auto_33839 ?auto_33838 ) ) ( TRUCK-AT ?auto_33840 ?auto_33842 ) ( IN-CITY ?auto_33842 ?auto_33841 ) ( IN-CITY ?auto_33835 ?auto_33841 ) ( not ( = ?auto_33835 ?auto_33842 ) ) ( OBJ-AT ?auto_33837 ?auto_33835 ) ( OBJ-AT ?auto_33836 ?auto_33842 ) ( OBJ-AT ?auto_33838 ?auto_33835 ) ( OBJ-AT ?auto_33839 ?auto_33835 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_33837 ?auto_33836 ?auto_33835 )
      ( DELIVER-4PKG-VERIFY ?auto_33836 ?auto_33837 ?auto_33838 ?auto_33839 ?auto_33835 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_33860 - OBJ
      ?auto_33861 - OBJ
      ?auto_33862 - OBJ
      ?auto_33863 - OBJ
      ?auto_33859 - LOCATION
    )
    :vars
    (
      ?auto_33864 - TRUCK
      ?auto_33866 - LOCATION
      ?auto_33865 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_33861 ?auto_33860 ) ) ( not ( = ?auto_33862 ?auto_33860 ) ) ( not ( = ?auto_33862 ?auto_33861 ) ) ( not ( = ?auto_33863 ?auto_33860 ) ) ( not ( = ?auto_33863 ?auto_33861 ) ) ( not ( = ?auto_33863 ?auto_33862 ) ) ( TRUCK-AT ?auto_33864 ?auto_33866 ) ( IN-CITY ?auto_33866 ?auto_33865 ) ( IN-CITY ?auto_33859 ?auto_33865 ) ( not ( = ?auto_33859 ?auto_33866 ) ) ( OBJ-AT ?auto_33861 ?auto_33859 ) ( OBJ-AT ?auto_33860 ?auto_33866 ) ( OBJ-AT ?auto_33862 ?auto_33859 ) ( OBJ-AT ?auto_33863 ?auto_33859 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_33861 ?auto_33860 ?auto_33859 )
      ( DELIVER-4PKG-VERIFY ?auto_33860 ?auto_33861 ?auto_33862 ?auto_33863 ?auto_33859 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_33932 - OBJ
      ?auto_33933 - OBJ
      ?auto_33934 - OBJ
      ?auto_33935 - OBJ
      ?auto_33931 - LOCATION
    )
    :vars
    (
      ?auto_33936 - TRUCK
      ?auto_33938 - LOCATION
      ?auto_33937 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_33933 ?auto_33932 ) ) ( not ( = ?auto_33934 ?auto_33932 ) ) ( not ( = ?auto_33934 ?auto_33933 ) ) ( not ( = ?auto_33935 ?auto_33932 ) ) ( not ( = ?auto_33935 ?auto_33933 ) ) ( not ( = ?auto_33935 ?auto_33934 ) ) ( TRUCK-AT ?auto_33936 ?auto_33938 ) ( IN-CITY ?auto_33938 ?auto_33937 ) ( IN-CITY ?auto_33931 ?auto_33937 ) ( not ( = ?auto_33931 ?auto_33938 ) ) ( OBJ-AT ?auto_33934 ?auto_33931 ) ( OBJ-AT ?auto_33932 ?auto_33938 ) ( OBJ-AT ?auto_33933 ?auto_33931 ) ( OBJ-AT ?auto_33935 ?auto_33931 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_33934 ?auto_33932 ?auto_33931 )
      ( DELIVER-4PKG-VERIFY ?auto_33932 ?auto_33933 ?auto_33934 ?auto_33935 ?auto_33931 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_33983 - OBJ
      ?auto_33984 - OBJ
      ?auto_33985 - OBJ
      ?auto_33986 - OBJ
      ?auto_33982 - LOCATION
    )
    :vars
    (
      ?auto_33987 - TRUCK
      ?auto_33989 - LOCATION
      ?auto_33988 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_33984 ?auto_33983 ) ) ( not ( = ?auto_33985 ?auto_33983 ) ) ( not ( = ?auto_33985 ?auto_33984 ) ) ( not ( = ?auto_33986 ?auto_33983 ) ) ( not ( = ?auto_33986 ?auto_33984 ) ) ( not ( = ?auto_33986 ?auto_33985 ) ) ( TRUCK-AT ?auto_33987 ?auto_33989 ) ( IN-CITY ?auto_33989 ?auto_33988 ) ( IN-CITY ?auto_33982 ?auto_33988 ) ( not ( = ?auto_33982 ?auto_33989 ) ) ( OBJ-AT ?auto_33986 ?auto_33982 ) ( OBJ-AT ?auto_33983 ?auto_33989 ) ( OBJ-AT ?auto_33984 ?auto_33982 ) ( OBJ-AT ?auto_33985 ?auto_33982 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_33986 ?auto_33983 ?auto_33982 )
      ( DELIVER-4PKG-VERIFY ?auto_33983 ?auto_33984 ?auto_33985 ?auto_33986 ?auto_33982 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_34061 - OBJ
      ?auto_34062 - OBJ
      ?auto_34063 - OBJ
      ?auto_34064 - OBJ
      ?auto_34060 - LOCATION
    )
    :vars
    (
      ?auto_34065 - TRUCK
      ?auto_34067 - LOCATION
      ?auto_34066 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_34062 ?auto_34061 ) ) ( not ( = ?auto_34063 ?auto_34061 ) ) ( not ( = ?auto_34063 ?auto_34062 ) ) ( not ( = ?auto_34064 ?auto_34061 ) ) ( not ( = ?auto_34064 ?auto_34062 ) ) ( not ( = ?auto_34064 ?auto_34063 ) ) ( TRUCK-AT ?auto_34065 ?auto_34067 ) ( IN-CITY ?auto_34067 ?auto_34066 ) ( IN-CITY ?auto_34060 ?auto_34066 ) ( not ( = ?auto_34060 ?auto_34067 ) ) ( OBJ-AT ?auto_34063 ?auto_34060 ) ( OBJ-AT ?auto_34061 ?auto_34067 ) ( OBJ-AT ?auto_34062 ?auto_34060 ) ( OBJ-AT ?auto_34064 ?auto_34060 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34063 ?auto_34061 ?auto_34060 )
      ( DELIVER-4PKG-VERIFY ?auto_34061 ?auto_34062 ?auto_34063 ?auto_34064 ?auto_34060 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_34085 - OBJ
      ?auto_34086 - OBJ
      ?auto_34087 - OBJ
      ?auto_34088 - OBJ
      ?auto_34084 - LOCATION
    )
    :vars
    (
      ?auto_34089 - TRUCK
      ?auto_34091 - LOCATION
      ?auto_34090 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_34086 ?auto_34085 ) ) ( not ( = ?auto_34087 ?auto_34085 ) ) ( not ( = ?auto_34087 ?auto_34086 ) ) ( not ( = ?auto_34088 ?auto_34085 ) ) ( not ( = ?auto_34088 ?auto_34086 ) ) ( not ( = ?auto_34088 ?auto_34087 ) ) ( TRUCK-AT ?auto_34089 ?auto_34091 ) ( IN-CITY ?auto_34091 ?auto_34090 ) ( IN-CITY ?auto_34084 ?auto_34090 ) ( not ( = ?auto_34084 ?auto_34091 ) ) ( OBJ-AT ?auto_34088 ?auto_34084 ) ( OBJ-AT ?auto_34085 ?auto_34091 ) ( OBJ-AT ?auto_34086 ?auto_34084 ) ( OBJ-AT ?auto_34087 ?auto_34084 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34088 ?auto_34085 ?auto_34084 )
      ( DELIVER-4PKG-VERIFY ?auto_34085 ?auto_34086 ?auto_34087 ?auto_34088 ?auto_34084 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_34327 - OBJ
      ?auto_34326 - LOCATION
    )
    :vars
    (
      ?auto_34331 - OBJ
      ?auto_34330 - LOCATION
      ?auto_34329 - CITY
      ?auto_34328 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34327 ?auto_34331 ) ) ( IN-CITY ?auto_34330 ?auto_34329 ) ( IN-CITY ?auto_34326 ?auto_34329 ) ( not ( = ?auto_34326 ?auto_34330 ) ) ( OBJ-AT ?auto_34331 ?auto_34326 ) ( OBJ-AT ?auto_34327 ?auto_34330 ) ( TRUCK-AT ?auto_34328 ?auto_34326 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_34328 ?auto_34326 ?auto_34330 ?auto_34329 )
      ( DELIVER-2PKG ?auto_34331 ?auto_34327 ?auto_34326 )
      ( DELIVER-1PKG-VERIFY ?auto_34327 ?auto_34326 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_34333 - OBJ
      ?auto_34334 - OBJ
      ?auto_34332 - LOCATION
    )
    :vars
    (
      ?auto_34336 - LOCATION
      ?auto_34335 - CITY
      ?auto_34337 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34334 ?auto_34333 ) ) ( IN-CITY ?auto_34336 ?auto_34335 ) ( IN-CITY ?auto_34332 ?auto_34335 ) ( not ( = ?auto_34332 ?auto_34336 ) ) ( OBJ-AT ?auto_34333 ?auto_34332 ) ( OBJ-AT ?auto_34334 ?auto_34336 ) ( TRUCK-AT ?auto_34337 ?auto_34332 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_34334 ?auto_34332 )
      ( DELIVER-2PKG-VERIFY ?auto_34333 ?auto_34334 ?auto_34332 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_34339 - OBJ
      ?auto_34340 - OBJ
      ?auto_34338 - LOCATION
    )
    :vars
    (
      ?auto_34344 - OBJ
      ?auto_34342 - LOCATION
      ?auto_34343 - CITY
      ?auto_34341 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34340 ?auto_34339 ) ) ( not ( = ?auto_34340 ?auto_34344 ) ) ( IN-CITY ?auto_34342 ?auto_34343 ) ( IN-CITY ?auto_34338 ?auto_34343 ) ( not ( = ?auto_34338 ?auto_34342 ) ) ( OBJ-AT ?auto_34344 ?auto_34338 ) ( OBJ-AT ?auto_34340 ?auto_34342 ) ( TRUCK-AT ?auto_34341 ?auto_34338 ) ( OBJ-AT ?auto_34339 ?auto_34338 ) ( not ( = ?auto_34339 ?auto_34344 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34344 ?auto_34340 ?auto_34338 )
      ( DELIVER-2PKG-VERIFY ?auto_34339 ?auto_34340 ?auto_34338 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_34346 - OBJ
      ?auto_34347 - OBJ
      ?auto_34345 - LOCATION
    )
    :vars
    (
      ?auto_34351 - OBJ
      ?auto_34349 - LOCATION
      ?auto_34350 - CITY
      ?auto_34348 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34347 ?auto_34346 ) ) ( not ( = ?auto_34347 ?auto_34351 ) ) ( IN-CITY ?auto_34349 ?auto_34350 ) ( IN-CITY ?auto_34345 ?auto_34350 ) ( not ( = ?auto_34345 ?auto_34349 ) ) ( OBJ-AT ?auto_34351 ?auto_34345 ) ( OBJ-AT ?auto_34347 ?auto_34349 ) ( TRUCK-AT ?auto_34348 ?auto_34345 ) ( OBJ-AT ?auto_34346 ?auto_34345 ) ( not ( = ?auto_34346 ?auto_34351 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34351 ?auto_34347 ?auto_34345 )
      ( DELIVER-2PKG-VERIFY ?auto_34346 ?auto_34347 ?auto_34345 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_34353 - OBJ
      ?auto_34354 - OBJ
      ?auto_34352 - LOCATION
    )
    :vars
    (
      ?auto_34356 - LOCATION
      ?auto_34357 - CITY
      ?auto_34355 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34354 ?auto_34353 ) ) ( IN-CITY ?auto_34356 ?auto_34357 ) ( IN-CITY ?auto_34352 ?auto_34357 ) ( not ( = ?auto_34352 ?auto_34356 ) ) ( OBJ-AT ?auto_34354 ?auto_34352 ) ( OBJ-AT ?auto_34353 ?auto_34356 ) ( TRUCK-AT ?auto_34355 ?auto_34352 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34354 ?auto_34353 ?auto_34352 )
      ( DELIVER-2PKG-VERIFY ?auto_34353 ?auto_34354 ?auto_34352 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_34359 - OBJ
      ?auto_34360 - OBJ
      ?auto_34358 - LOCATION
    )
    :vars
    (
      ?auto_34364 - OBJ
      ?auto_34362 - LOCATION
      ?auto_34363 - CITY
      ?auto_34361 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34360 ?auto_34359 ) ) ( not ( = ?auto_34359 ?auto_34364 ) ) ( IN-CITY ?auto_34362 ?auto_34363 ) ( IN-CITY ?auto_34358 ?auto_34363 ) ( not ( = ?auto_34358 ?auto_34362 ) ) ( OBJ-AT ?auto_34364 ?auto_34358 ) ( OBJ-AT ?auto_34359 ?auto_34362 ) ( TRUCK-AT ?auto_34361 ?auto_34358 ) ( OBJ-AT ?auto_34360 ?auto_34358 ) ( not ( = ?auto_34360 ?auto_34364 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34364 ?auto_34359 ?auto_34358 )
      ( DELIVER-2PKG-VERIFY ?auto_34359 ?auto_34360 ?auto_34358 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_34366 - OBJ
      ?auto_34367 - OBJ
      ?auto_34365 - LOCATION
    )
    :vars
    (
      ?auto_34371 - OBJ
      ?auto_34369 - LOCATION
      ?auto_34370 - CITY
      ?auto_34368 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34367 ?auto_34366 ) ) ( not ( = ?auto_34366 ?auto_34371 ) ) ( IN-CITY ?auto_34369 ?auto_34370 ) ( IN-CITY ?auto_34365 ?auto_34370 ) ( not ( = ?auto_34365 ?auto_34369 ) ) ( OBJ-AT ?auto_34371 ?auto_34365 ) ( OBJ-AT ?auto_34366 ?auto_34369 ) ( TRUCK-AT ?auto_34368 ?auto_34365 ) ( OBJ-AT ?auto_34367 ?auto_34365 ) ( not ( = ?auto_34367 ?auto_34371 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34371 ?auto_34366 ?auto_34365 )
      ( DELIVER-2PKG-VERIFY ?auto_34366 ?auto_34367 ?auto_34365 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34387 - OBJ
      ?auto_34388 - OBJ
      ?auto_34389 - OBJ
      ?auto_34386 - LOCATION
    )
    :vars
    (
      ?auto_34391 - LOCATION
      ?auto_34392 - CITY
      ?auto_34390 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34388 ?auto_34387 ) ) ( not ( = ?auto_34389 ?auto_34387 ) ) ( not ( = ?auto_34389 ?auto_34388 ) ) ( IN-CITY ?auto_34391 ?auto_34392 ) ( IN-CITY ?auto_34386 ?auto_34392 ) ( not ( = ?auto_34386 ?auto_34391 ) ) ( OBJ-AT ?auto_34387 ?auto_34386 ) ( OBJ-AT ?auto_34389 ?auto_34391 ) ( TRUCK-AT ?auto_34390 ?auto_34386 ) ( OBJ-AT ?auto_34388 ?auto_34386 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34387 ?auto_34389 ?auto_34386 )
      ( DELIVER-3PKG-VERIFY ?auto_34387 ?auto_34388 ?auto_34389 ?auto_34386 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34394 - OBJ
      ?auto_34395 - OBJ
      ?auto_34396 - OBJ
      ?auto_34393 - LOCATION
    )
    :vars
    (
      ?auto_34398 - LOCATION
      ?auto_34399 - CITY
      ?auto_34397 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34395 ?auto_34394 ) ) ( not ( = ?auto_34396 ?auto_34394 ) ) ( not ( = ?auto_34396 ?auto_34395 ) ) ( IN-CITY ?auto_34398 ?auto_34399 ) ( IN-CITY ?auto_34393 ?auto_34399 ) ( not ( = ?auto_34393 ?auto_34398 ) ) ( OBJ-AT ?auto_34394 ?auto_34393 ) ( OBJ-AT ?auto_34396 ?auto_34398 ) ( TRUCK-AT ?auto_34397 ?auto_34393 ) ( OBJ-AT ?auto_34395 ?auto_34393 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34394 ?auto_34396 ?auto_34393 )
      ( DELIVER-3PKG-VERIFY ?auto_34394 ?auto_34395 ?auto_34396 ?auto_34393 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34408 - OBJ
      ?auto_34409 - OBJ
      ?auto_34410 - OBJ
      ?auto_34407 - LOCATION
    )
    :vars
    (
      ?auto_34412 - LOCATION
      ?auto_34413 - CITY
      ?auto_34411 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34409 ?auto_34408 ) ) ( not ( = ?auto_34410 ?auto_34408 ) ) ( not ( = ?auto_34410 ?auto_34409 ) ) ( IN-CITY ?auto_34412 ?auto_34413 ) ( IN-CITY ?auto_34407 ?auto_34413 ) ( not ( = ?auto_34407 ?auto_34412 ) ) ( OBJ-AT ?auto_34408 ?auto_34407 ) ( OBJ-AT ?auto_34409 ?auto_34412 ) ( TRUCK-AT ?auto_34411 ?auto_34407 ) ( OBJ-AT ?auto_34410 ?auto_34407 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34408 ?auto_34409 ?auto_34407 )
      ( DELIVER-3PKG-VERIFY ?auto_34408 ?auto_34409 ?auto_34410 ?auto_34407 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34415 - OBJ
      ?auto_34416 - OBJ
      ?auto_34417 - OBJ
      ?auto_34414 - LOCATION
    )
    :vars
    (
      ?auto_34419 - LOCATION
      ?auto_34420 - CITY
      ?auto_34418 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34416 ?auto_34415 ) ) ( not ( = ?auto_34417 ?auto_34415 ) ) ( not ( = ?auto_34417 ?auto_34416 ) ) ( IN-CITY ?auto_34419 ?auto_34420 ) ( IN-CITY ?auto_34414 ?auto_34420 ) ( not ( = ?auto_34414 ?auto_34419 ) ) ( OBJ-AT ?auto_34415 ?auto_34414 ) ( OBJ-AT ?auto_34416 ?auto_34419 ) ( TRUCK-AT ?auto_34418 ?auto_34414 ) ( OBJ-AT ?auto_34417 ?auto_34414 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34415 ?auto_34416 ?auto_34414 )
      ( DELIVER-3PKG-VERIFY ?auto_34415 ?auto_34416 ?auto_34417 ?auto_34414 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34429 - OBJ
      ?auto_34430 - OBJ
      ?auto_34431 - OBJ
      ?auto_34428 - LOCATION
    )
    :vars
    (
      ?auto_34433 - LOCATION
      ?auto_34434 - CITY
      ?auto_34432 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34430 ?auto_34429 ) ) ( not ( = ?auto_34431 ?auto_34429 ) ) ( not ( = ?auto_34431 ?auto_34430 ) ) ( IN-CITY ?auto_34433 ?auto_34434 ) ( IN-CITY ?auto_34428 ?auto_34434 ) ( not ( = ?auto_34428 ?auto_34433 ) ) ( OBJ-AT ?auto_34430 ?auto_34428 ) ( OBJ-AT ?auto_34431 ?auto_34433 ) ( TRUCK-AT ?auto_34432 ?auto_34428 ) ( OBJ-AT ?auto_34429 ?auto_34428 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34430 ?auto_34431 ?auto_34428 )
      ( DELIVER-3PKG-VERIFY ?auto_34429 ?auto_34430 ?auto_34431 ?auto_34428 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34444 - OBJ
      ?auto_34445 - OBJ
      ?auto_34446 - OBJ
      ?auto_34443 - LOCATION
    )
    :vars
    (
      ?auto_34450 - OBJ
      ?auto_34448 - LOCATION
      ?auto_34449 - CITY
      ?auto_34447 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34445 ?auto_34444 ) ) ( not ( = ?auto_34446 ?auto_34444 ) ) ( not ( = ?auto_34446 ?auto_34445 ) ) ( not ( = ?auto_34446 ?auto_34450 ) ) ( IN-CITY ?auto_34448 ?auto_34449 ) ( IN-CITY ?auto_34443 ?auto_34449 ) ( not ( = ?auto_34443 ?auto_34448 ) ) ( OBJ-AT ?auto_34450 ?auto_34443 ) ( OBJ-AT ?auto_34446 ?auto_34448 ) ( TRUCK-AT ?auto_34447 ?auto_34443 ) ( OBJ-AT ?auto_34444 ?auto_34443 ) ( OBJ-AT ?auto_34445 ?auto_34443 ) ( not ( = ?auto_34444 ?auto_34450 ) ) ( not ( = ?auto_34445 ?auto_34450 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34450 ?auto_34446 ?auto_34443 )
      ( DELIVER-3PKG-VERIFY ?auto_34444 ?auto_34445 ?auto_34446 ?auto_34443 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34452 - OBJ
      ?auto_34453 - OBJ
      ?auto_34454 - OBJ
      ?auto_34451 - LOCATION
    )
    :vars
    (
      ?auto_34456 - LOCATION
      ?auto_34457 - CITY
      ?auto_34455 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34453 ?auto_34452 ) ) ( not ( = ?auto_34454 ?auto_34452 ) ) ( not ( = ?auto_34454 ?auto_34453 ) ) ( IN-CITY ?auto_34456 ?auto_34457 ) ( IN-CITY ?auto_34451 ?auto_34457 ) ( not ( = ?auto_34451 ?auto_34456 ) ) ( OBJ-AT ?auto_34454 ?auto_34451 ) ( OBJ-AT ?auto_34453 ?auto_34456 ) ( TRUCK-AT ?auto_34455 ?auto_34451 ) ( OBJ-AT ?auto_34452 ?auto_34451 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34454 ?auto_34453 ?auto_34451 )
      ( DELIVER-3PKG-VERIFY ?auto_34452 ?auto_34453 ?auto_34454 ?auto_34451 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34467 - OBJ
      ?auto_34468 - OBJ
      ?auto_34469 - OBJ
      ?auto_34466 - LOCATION
    )
    :vars
    (
      ?auto_34473 - OBJ
      ?auto_34471 - LOCATION
      ?auto_34472 - CITY
      ?auto_34470 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34468 ?auto_34467 ) ) ( not ( = ?auto_34469 ?auto_34467 ) ) ( not ( = ?auto_34469 ?auto_34468 ) ) ( not ( = ?auto_34468 ?auto_34473 ) ) ( IN-CITY ?auto_34471 ?auto_34472 ) ( IN-CITY ?auto_34466 ?auto_34472 ) ( not ( = ?auto_34466 ?auto_34471 ) ) ( OBJ-AT ?auto_34473 ?auto_34466 ) ( OBJ-AT ?auto_34468 ?auto_34471 ) ( TRUCK-AT ?auto_34470 ?auto_34466 ) ( OBJ-AT ?auto_34467 ?auto_34466 ) ( OBJ-AT ?auto_34469 ?auto_34466 ) ( not ( = ?auto_34467 ?auto_34473 ) ) ( not ( = ?auto_34469 ?auto_34473 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34473 ?auto_34468 ?auto_34466 )
      ( DELIVER-3PKG-VERIFY ?auto_34467 ?auto_34468 ?auto_34469 ?auto_34466 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34483 - OBJ
      ?auto_34484 - OBJ
      ?auto_34485 - OBJ
      ?auto_34482 - LOCATION
    )
    :vars
    (
      ?auto_34487 - LOCATION
      ?auto_34488 - CITY
      ?auto_34486 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34484 ?auto_34483 ) ) ( not ( = ?auto_34485 ?auto_34483 ) ) ( not ( = ?auto_34485 ?auto_34484 ) ) ( IN-CITY ?auto_34487 ?auto_34488 ) ( IN-CITY ?auto_34482 ?auto_34488 ) ( not ( = ?auto_34482 ?auto_34487 ) ) ( OBJ-AT ?auto_34484 ?auto_34482 ) ( OBJ-AT ?auto_34485 ?auto_34487 ) ( TRUCK-AT ?auto_34486 ?auto_34482 ) ( OBJ-AT ?auto_34483 ?auto_34482 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34484 ?auto_34485 ?auto_34482 )
      ( DELIVER-3PKG-VERIFY ?auto_34483 ?auto_34484 ?auto_34485 ?auto_34482 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34490 - OBJ
      ?auto_34491 - OBJ
      ?auto_34492 - OBJ
      ?auto_34489 - LOCATION
    )
    :vars
    (
      ?auto_34496 - OBJ
      ?auto_34494 - LOCATION
      ?auto_34495 - CITY
      ?auto_34493 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34491 ?auto_34490 ) ) ( not ( = ?auto_34492 ?auto_34490 ) ) ( not ( = ?auto_34492 ?auto_34491 ) ) ( not ( = ?auto_34492 ?auto_34496 ) ) ( IN-CITY ?auto_34494 ?auto_34495 ) ( IN-CITY ?auto_34489 ?auto_34495 ) ( not ( = ?auto_34489 ?auto_34494 ) ) ( OBJ-AT ?auto_34496 ?auto_34489 ) ( OBJ-AT ?auto_34492 ?auto_34494 ) ( TRUCK-AT ?auto_34493 ?auto_34489 ) ( OBJ-AT ?auto_34490 ?auto_34489 ) ( OBJ-AT ?auto_34491 ?auto_34489 ) ( not ( = ?auto_34490 ?auto_34496 ) ) ( not ( = ?auto_34491 ?auto_34496 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34496 ?auto_34492 ?auto_34489 )
      ( DELIVER-3PKG-VERIFY ?auto_34490 ?auto_34491 ?auto_34492 ?auto_34489 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34506 - OBJ
      ?auto_34507 - OBJ
      ?auto_34508 - OBJ
      ?auto_34505 - LOCATION
    )
    :vars
    (
      ?auto_34510 - LOCATION
      ?auto_34511 - CITY
      ?auto_34509 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34507 ?auto_34506 ) ) ( not ( = ?auto_34508 ?auto_34506 ) ) ( not ( = ?auto_34508 ?auto_34507 ) ) ( IN-CITY ?auto_34510 ?auto_34511 ) ( IN-CITY ?auto_34505 ?auto_34511 ) ( not ( = ?auto_34505 ?auto_34510 ) ) ( OBJ-AT ?auto_34508 ?auto_34505 ) ( OBJ-AT ?auto_34507 ?auto_34510 ) ( TRUCK-AT ?auto_34509 ?auto_34505 ) ( OBJ-AT ?auto_34506 ?auto_34505 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34508 ?auto_34507 ?auto_34505 )
      ( DELIVER-3PKG-VERIFY ?auto_34506 ?auto_34507 ?auto_34508 ?auto_34505 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34513 - OBJ
      ?auto_34514 - OBJ
      ?auto_34515 - OBJ
      ?auto_34512 - LOCATION
    )
    :vars
    (
      ?auto_34519 - OBJ
      ?auto_34517 - LOCATION
      ?auto_34518 - CITY
      ?auto_34516 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34514 ?auto_34513 ) ) ( not ( = ?auto_34515 ?auto_34513 ) ) ( not ( = ?auto_34515 ?auto_34514 ) ) ( not ( = ?auto_34514 ?auto_34519 ) ) ( IN-CITY ?auto_34517 ?auto_34518 ) ( IN-CITY ?auto_34512 ?auto_34518 ) ( not ( = ?auto_34512 ?auto_34517 ) ) ( OBJ-AT ?auto_34519 ?auto_34512 ) ( OBJ-AT ?auto_34514 ?auto_34517 ) ( TRUCK-AT ?auto_34516 ?auto_34512 ) ( OBJ-AT ?auto_34513 ?auto_34512 ) ( OBJ-AT ?auto_34515 ?auto_34512 ) ( not ( = ?auto_34513 ?auto_34519 ) ) ( not ( = ?auto_34515 ?auto_34519 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34519 ?auto_34514 ?auto_34512 )
      ( DELIVER-3PKG-VERIFY ?auto_34513 ?auto_34514 ?auto_34515 ?auto_34512 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34544 - OBJ
      ?auto_34545 - OBJ
      ?auto_34546 - OBJ
      ?auto_34543 - LOCATION
    )
    :vars
    (
      ?auto_34548 - LOCATION
      ?auto_34549 - CITY
      ?auto_34547 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34545 ?auto_34544 ) ) ( not ( = ?auto_34546 ?auto_34544 ) ) ( not ( = ?auto_34546 ?auto_34545 ) ) ( IN-CITY ?auto_34548 ?auto_34549 ) ( IN-CITY ?auto_34543 ?auto_34549 ) ( not ( = ?auto_34543 ?auto_34548 ) ) ( OBJ-AT ?auto_34545 ?auto_34543 ) ( OBJ-AT ?auto_34544 ?auto_34548 ) ( TRUCK-AT ?auto_34547 ?auto_34543 ) ( OBJ-AT ?auto_34546 ?auto_34543 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34545 ?auto_34544 ?auto_34543 )
      ( DELIVER-3PKG-VERIFY ?auto_34544 ?auto_34545 ?auto_34546 ?auto_34543 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34551 - OBJ
      ?auto_34552 - OBJ
      ?auto_34553 - OBJ
      ?auto_34550 - LOCATION
    )
    :vars
    (
      ?auto_34555 - LOCATION
      ?auto_34556 - CITY
      ?auto_34554 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34552 ?auto_34551 ) ) ( not ( = ?auto_34553 ?auto_34551 ) ) ( not ( = ?auto_34553 ?auto_34552 ) ) ( IN-CITY ?auto_34555 ?auto_34556 ) ( IN-CITY ?auto_34550 ?auto_34556 ) ( not ( = ?auto_34550 ?auto_34555 ) ) ( OBJ-AT ?auto_34552 ?auto_34550 ) ( OBJ-AT ?auto_34551 ?auto_34555 ) ( TRUCK-AT ?auto_34554 ?auto_34550 ) ( OBJ-AT ?auto_34553 ?auto_34550 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34552 ?auto_34551 ?auto_34550 )
      ( DELIVER-3PKG-VERIFY ?auto_34551 ?auto_34552 ?auto_34553 ?auto_34550 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34565 - OBJ
      ?auto_34566 - OBJ
      ?auto_34567 - OBJ
      ?auto_34564 - LOCATION
    )
    :vars
    (
      ?auto_34569 - LOCATION
      ?auto_34570 - CITY
      ?auto_34568 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34566 ?auto_34565 ) ) ( not ( = ?auto_34567 ?auto_34565 ) ) ( not ( = ?auto_34567 ?auto_34566 ) ) ( IN-CITY ?auto_34569 ?auto_34570 ) ( IN-CITY ?auto_34564 ?auto_34570 ) ( not ( = ?auto_34564 ?auto_34569 ) ) ( OBJ-AT ?auto_34567 ?auto_34564 ) ( OBJ-AT ?auto_34565 ?auto_34569 ) ( TRUCK-AT ?auto_34568 ?auto_34564 ) ( OBJ-AT ?auto_34566 ?auto_34564 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34567 ?auto_34565 ?auto_34564 )
      ( DELIVER-3PKG-VERIFY ?auto_34565 ?auto_34566 ?auto_34567 ?auto_34564 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34580 - OBJ
      ?auto_34581 - OBJ
      ?auto_34582 - OBJ
      ?auto_34579 - LOCATION
    )
    :vars
    (
      ?auto_34586 - OBJ
      ?auto_34584 - LOCATION
      ?auto_34585 - CITY
      ?auto_34583 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34581 ?auto_34580 ) ) ( not ( = ?auto_34582 ?auto_34580 ) ) ( not ( = ?auto_34582 ?auto_34581 ) ) ( not ( = ?auto_34580 ?auto_34586 ) ) ( IN-CITY ?auto_34584 ?auto_34585 ) ( IN-CITY ?auto_34579 ?auto_34585 ) ( not ( = ?auto_34579 ?auto_34584 ) ) ( OBJ-AT ?auto_34586 ?auto_34579 ) ( OBJ-AT ?auto_34580 ?auto_34584 ) ( TRUCK-AT ?auto_34583 ?auto_34579 ) ( OBJ-AT ?auto_34581 ?auto_34579 ) ( OBJ-AT ?auto_34582 ?auto_34579 ) ( not ( = ?auto_34581 ?auto_34586 ) ) ( not ( = ?auto_34582 ?auto_34586 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34586 ?auto_34580 ?auto_34579 )
      ( DELIVER-3PKG-VERIFY ?auto_34580 ?auto_34581 ?auto_34582 ?auto_34579 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34596 - OBJ
      ?auto_34597 - OBJ
      ?auto_34598 - OBJ
      ?auto_34595 - LOCATION
    )
    :vars
    (
      ?auto_34600 - LOCATION
      ?auto_34601 - CITY
      ?auto_34599 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34597 ?auto_34596 ) ) ( not ( = ?auto_34598 ?auto_34596 ) ) ( not ( = ?auto_34598 ?auto_34597 ) ) ( IN-CITY ?auto_34600 ?auto_34601 ) ( IN-CITY ?auto_34595 ?auto_34601 ) ( not ( = ?auto_34595 ?auto_34600 ) ) ( OBJ-AT ?auto_34598 ?auto_34595 ) ( OBJ-AT ?auto_34596 ?auto_34600 ) ( TRUCK-AT ?auto_34599 ?auto_34595 ) ( OBJ-AT ?auto_34597 ?auto_34595 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34598 ?auto_34596 ?auto_34595 )
      ( DELIVER-3PKG-VERIFY ?auto_34596 ?auto_34597 ?auto_34598 ?auto_34595 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34603 - OBJ
      ?auto_34604 - OBJ
      ?auto_34605 - OBJ
      ?auto_34602 - LOCATION
    )
    :vars
    (
      ?auto_34609 - OBJ
      ?auto_34607 - LOCATION
      ?auto_34608 - CITY
      ?auto_34606 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34604 ?auto_34603 ) ) ( not ( = ?auto_34605 ?auto_34603 ) ) ( not ( = ?auto_34605 ?auto_34604 ) ) ( not ( = ?auto_34603 ?auto_34609 ) ) ( IN-CITY ?auto_34607 ?auto_34608 ) ( IN-CITY ?auto_34602 ?auto_34608 ) ( not ( = ?auto_34602 ?auto_34607 ) ) ( OBJ-AT ?auto_34609 ?auto_34602 ) ( OBJ-AT ?auto_34603 ?auto_34607 ) ( TRUCK-AT ?auto_34606 ?auto_34602 ) ( OBJ-AT ?auto_34604 ?auto_34602 ) ( OBJ-AT ?auto_34605 ?auto_34602 ) ( not ( = ?auto_34604 ?auto_34609 ) ) ( not ( = ?auto_34605 ?auto_34609 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34609 ?auto_34603 ?auto_34602 )
      ( DELIVER-3PKG-VERIFY ?auto_34603 ?auto_34604 ?auto_34605 ?auto_34602 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_34730 - OBJ
      ?auto_34731 - OBJ
      ?auto_34732 - OBJ
      ?auto_34733 - OBJ
      ?auto_34729 - LOCATION
    )
    :vars
    (
      ?auto_34735 - LOCATION
      ?auto_34736 - CITY
      ?auto_34734 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34731 ?auto_34730 ) ) ( not ( = ?auto_34732 ?auto_34730 ) ) ( not ( = ?auto_34732 ?auto_34731 ) ) ( not ( = ?auto_34733 ?auto_34730 ) ) ( not ( = ?auto_34733 ?auto_34731 ) ) ( not ( = ?auto_34733 ?auto_34732 ) ) ( IN-CITY ?auto_34735 ?auto_34736 ) ( IN-CITY ?auto_34729 ?auto_34736 ) ( not ( = ?auto_34729 ?auto_34735 ) ) ( OBJ-AT ?auto_34730 ?auto_34729 ) ( OBJ-AT ?auto_34733 ?auto_34735 ) ( TRUCK-AT ?auto_34734 ?auto_34729 ) ( OBJ-AT ?auto_34731 ?auto_34729 ) ( OBJ-AT ?auto_34732 ?auto_34729 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34730 ?auto_34733 ?auto_34729 )
      ( DELIVER-4PKG-VERIFY ?auto_34730 ?auto_34731 ?auto_34732 ?auto_34733 ?auto_34729 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_34754 - OBJ
      ?auto_34755 - OBJ
      ?auto_34756 - OBJ
      ?auto_34757 - OBJ
      ?auto_34753 - LOCATION
    )
    :vars
    (
      ?auto_34759 - LOCATION
      ?auto_34760 - CITY
      ?auto_34758 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34755 ?auto_34754 ) ) ( not ( = ?auto_34756 ?auto_34754 ) ) ( not ( = ?auto_34756 ?auto_34755 ) ) ( not ( = ?auto_34757 ?auto_34754 ) ) ( not ( = ?auto_34757 ?auto_34755 ) ) ( not ( = ?auto_34757 ?auto_34756 ) ) ( IN-CITY ?auto_34759 ?auto_34760 ) ( IN-CITY ?auto_34753 ?auto_34760 ) ( not ( = ?auto_34753 ?auto_34759 ) ) ( OBJ-AT ?auto_34754 ?auto_34753 ) ( OBJ-AT ?auto_34756 ?auto_34759 ) ( TRUCK-AT ?auto_34758 ?auto_34753 ) ( OBJ-AT ?auto_34755 ?auto_34753 ) ( OBJ-AT ?auto_34757 ?auto_34753 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34754 ?auto_34756 ?auto_34753 )
      ( DELIVER-4PKG-VERIFY ?auto_34754 ?auto_34755 ?auto_34756 ?auto_34757 ?auto_34753 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_34778 - OBJ
      ?auto_34779 - OBJ
      ?auto_34780 - OBJ
      ?auto_34781 - OBJ
      ?auto_34777 - LOCATION
    )
    :vars
    (
      ?auto_34783 - LOCATION
      ?auto_34784 - CITY
      ?auto_34782 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34779 ?auto_34778 ) ) ( not ( = ?auto_34780 ?auto_34778 ) ) ( not ( = ?auto_34780 ?auto_34779 ) ) ( not ( = ?auto_34781 ?auto_34778 ) ) ( not ( = ?auto_34781 ?auto_34779 ) ) ( not ( = ?auto_34781 ?auto_34780 ) ) ( IN-CITY ?auto_34783 ?auto_34784 ) ( IN-CITY ?auto_34777 ?auto_34784 ) ( not ( = ?auto_34777 ?auto_34783 ) ) ( OBJ-AT ?auto_34778 ?auto_34777 ) ( OBJ-AT ?auto_34781 ?auto_34783 ) ( TRUCK-AT ?auto_34782 ?auto_34777 ) ( OBJ-AT ?auto_34779 ?auto_34777 ) ( OBJ-AT ?auto_34780 ?auto_34777 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34778 ?auto_34781 ?auto_34777 )
      ( DELIVER-4PKG-VERIFY ?auto_34778 ?auto_34779 ?auto_34780 ?auto_34781 ?auto_34777 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_34802 - OBJ
      ?auto_34803 - OBJ
      ?auto_34804 - OBJ
      ?auto_34805 - OBJ
      ?auto_34801 - LOCATION
    )
    :vars
    (
      ?auto_34807 - LOCATION
      ?auto_34808 - CITY
      ?auto_34806 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34803 ?auto_34802 ) ) ( not ( = ?auto_34804 ?auto_34802 ) ) ( not ( = ?auto_34804 ?auto_34803 ) ) ( not ( = ?auto_34805 ?auto_34802 ) ) ( not ( = ?auto_34805 ?auto_34803 ) ) ( not ( = ?auto_34805 ?auto_34804 ) ) ( IN-CITY ?auto_34807 ?auto_34808 ) ( IN-CITY ?auto_34801 ?auto_34808 ) ( not ( = ?auto_34801 ?auto_34807 ) ) ( OBJ-AT ?auto_34802 ?auto_34801 ) ( OBJ-AT ?auto_34804 ?auto_34807 ) ( TRUCK-AT ?auto_34806 ?auto_34801 ) ( OBJ-AT ?auto_34803 ?auto_34801 ) ( OBJ-AT ?auto_34805 ?auto_34801 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34802 ?auto_34804 ?auto_34801 )
      ( DELIVER-4PKG-VERIFY ?auto_34802 ?auto_34803 ?auto_34804 ?auto_34805 ?auto_34801 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_34874 - OBJ
      ?auto_34875 - OBJ
      ?auto_34876 - OBJ
      ?auto_34877 - OBJ
      ?auto_34873 - LOCATION
    )
    :vars
    (
      ?auto_34879 - LOCATION
      ?auto_34880 - CITY
      ?auto_34878 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34875 ?auto_34874 ) ) ( not ( = ?auto_34876 ?auto_34874 ) ) ( not ( = ?auto_34876 ?auto_34875 ) ) ( not ( = ?auto_34877 ?auto_34874 ) ) ( not ( = ?auto_34877 ?auto_34875 ) ) ( not ( = ?auto_34877 ?auto_34876 ) ) ( IN-CITY ?auto_34879 ?auto_34880 ) ( IN-CITY ?auto_34873 ?auto_34880 ) ( not ( = ?auto_34873 ?auto_34879 ) ) ( OBJ-AT ?auto_34874 ?auto_34873 ) ( OBJ-AT ?auto_34875 ?auto_34879 ) ( TRUCK-AT ?auto_34878 ?auto_34873 ) ( OBJ-AT ?auto_34876 ?auto_34873 ) ( OBJ-AT ?auto_34877 ?auto_34873 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34874 ?auto_34875 ?auto_34873 )
      ( DELIVER-4PKG-VERIFY ?auto_34874 ?auto_34875 ?auto_34876 ?auto_34877 ?auto_34873 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_34898 - OBJ
      ?auto_34899 - OBJ
      ?auto_34900 - OBJ
      ?auto_34901 - OBJ
      ?auto_34897 - LOCATION
    )
    :vars
    (
      ?auto_34903 - LOCATION
      ?auto_34904 - CITY
      ?auto_34902 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34899 ?auto_34898 ) ) ( not ( = ?auto_34900 ?auto_34898 ) ) ( not ( = ?auto_34900 ?auto_34899 ) ) ( not ( = ?auto_34901 ?auto_34898 ) ) ( not ( = ?auto_34901 ?auto_34899 ) ) ( not ( = ?auto_34901 ?auto_34900 ) ) ( IN-CITY ?auto_34903 ?auto_34904 ) ( IN-CITY ?auto_34897 ?auto_34904 ) ( not ( = ?auto_34897 ?auto_34903 ) ) ( OBJ-AT ?auto_34898 ?auto_34897 ) ( OBJ-AT ?auto_34899 ?auto_34903 ) ( TRUCK-AT ?auto_34902 ?auto_34897 ) ( OBJ-AT ?auto_34900 ?auto_34897 ) ( OBJ-AT ?auto_34901 ?auto_34897 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34898 ?auto_34899 ?auto_34897 )
      ( DELIVER-4PKG-VERIFY ?auto_34898 ?auto_34899 ?auto_34900 ?auto_34901 ?auto_34897 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_34970 - OBJ
      ?auto_34971 - OBJ
      ?auto_34972 - OBJ
      ?auto_34973 - OBJ
      ?auto_34969 - LOCATION
    )
    :vars
    (
      ?auto_34975 - LOCATION
      ?auto_34976 - CITY
      ?auto_34974 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34971 ?auto_34970 ) ) ( not ( = ?auto_34972 ?auto_34970 ) ) ( not ( = ?auto_34972 ?auto_34971 ) ) ( not ( = ?auto_34973 ?auto_34970 ) ) ( not ( = ?auto_34973 ?auto_34971 ) ) ( not ( = ?auto_34973 ?auto_34972 ) ) ( IN-CITY ?auto_34975 ?auto_34976 ) ( IN-CITY ?auto_34969 ?auto_34976 ) ( not ( = ?auto_34969 ?auto_34975 ) ) ( OBJ-AT ?auto_34971 ?auto_34969 ) ( OBJ-AT ?auto_34973 ?auto_34975 ) ( TRUCK-AT ?auto_34974 ?auto_34969 ) ( OBJ-AT ?auto_34970 ?auto_34969 ) ( OBJ-AT ?auto_34972 ?auto_34969 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34971 ?auto_34973 ?auto_34969 )
      ( DELIVER-4PKG-VERIFY ?auto_34970 ?auto_34971 ?auto_34972 ?auto_34973 ?auto_34969 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_34994 - OBJ
      ?auto_34995 - OBJ
      ?auto_34996 - OBJ
      ?auto_34997 - OBJ
      ?auto_34993 - LOCATION
    )
    :vars
    (
      ?auto_34999 - LOCATION
      ?auto_35000 - CITY
      ?auto_34998 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_34995 ?auto_34994 ) ) ( not ( = ?auto_34996 ?auto_34994 ) ) ( not ( = ?auto_34996 ?auto_34995 ) ) ( not ( = ?auto_34997 ?auto_34994 ) ) ( not ( = ?auto_34997 ?auto_34995 ) ) ( not ( = ?auto_34997 ?auto_34996 ) ) ( IN-CITY ?auto_34999 ?auto_35000 ) ( IN-CITY ?auto_34993 ?auto_35000 ) ( not ( = ?auto_34993 ?auto_34999 ) ) ( OBJ-AT ?auto_34995 ?auto_34993 ) ( OBJ-AT ?auto_34996 ?auto_34999 ) ( TRUCK-AT ?auto_34998 ?auto_34993 ) ( OBJ-AT ?auto_34994 ?auto_34993 ) ( OBJ-AT ?auto_34997 ?auto_34993 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34995 ?auto_34996 ?auto_34993 )
      ( DELIVER-4PKG-VERIFY ?auto_34994 ?auto_34995 ?auto_34996 ?auto_34997 ?auto_34993 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35071 - OBJ
      ?auto_35072 - OBJ
      ?auto_35073 - OBJ
      ?auto_35074 - OBJ
      ?auto_35070 - LOCATION
    )
    :vars
    (
      ?auto_35076 - LOCATION
      ?auto_35077 - CITY
      ?auto_35075 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_35072 ?auto_35071 ) ) ( not ( = ?auto_35073 ?auto_35071 ) ) ( not ( = ?auto_35073 ?auto_35072 ) ) ( not ( = ?auto_35074 ?auto_35071 ) ) ( not ( = ?auto_35074 ?auto_35072 ) ) ( not ( = ?auto_35074 ?auto_35073 ) ) ( IN-CITY ?auto_35076 ?auto_35077 ) ( IN-CITY ?auto_35070 ?auto_35077 ) ( not ( = ?auto_35070 ?auto_35076 ) ) ( OBJ-AT ?auto_35073 ?auto_35070 ) ( OBJ-AT ?auto_35074 ?auto_35076 ) ( TRUCK-AT ?auto_35075 ?auto_35070 ) ( OBJ-AT ?auto_35071 ?auto_35070 ) ( OBJ-AT ?auto_35072 ?auto_35070 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35073 ?auto_35074 ?auto_35070 )
      ( DELIVER-4PKG-VERIFY ?auto_35071 ?auto_35072 ?auto_35073 ?auto_35074 ?auto_35070 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35097 - OBJ
      ?auto_35098 - OBJ
      ?auto_35099 - OBJ
      ?auto_35100 - OBJ
      ?auto_35096 - LOCATION
    )
    :vars
    (
      ?auto_35102 - LOCATION
      ?auto_35103 - CITY
      ?auto_35101 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_35098 ?auto_35097 ) ) ( not ( = ?auto_35099 ?auto_35097 ) ) ( not ( = ?auto_35099 ?auto_35098 ) ) ( not ( = ?auto_35100 ?auto_35097 ) ) ( not ( = ?auto_35100 ?auto_35098 ) ) ( not ( = ?auto_35100 ?auto_35099 ) ) ( IN-CITY ?auto_35102 ?auto_35103 ) ( IN-CITY ?auto_35096 ?auto_35103 ) ( not ( = ?auto_35096 ?auto_35102 ) ) ( OBJ-AT ?auto_35100 ?auto_35096 ) ( OBJ-AT ?auto_35099 ?auto_35102 ) ( TRUCK-AT ?auto_35101 ?auto_35096 ) ( OBJ-AT ?auto_35097 ?auto_35096 ) ( OBJ-AT ?auto_35098 ?auto_35096 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35100 ?auto_35099 ?auto_35096 )
      ( DELIVER-4PKG-VERIFY ?auto_35097 ?auto_35098 ?auto_35099 ?auto_35100 ?auto_35096 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35148 - OBJ
      ?auto_35149 - OBJ
      ?auto_35150 - OBJ
      ?auto_35151 - OBJ
      ?auto_35147 - LOCATION
    )
    :vars
    (
      ?auto_35153 - LOCATION
      ?auto_35154 - CITY
      ?auto_35152 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_35149 ?auto_35148 ) ) ( not ( = ?auto_35150 ?auto_35148 ) ) ( not ( = ?auto_35150 ?auto_35149 ) ) ( not ( = ?auto_35151 ?auto_35148 ) ) ( not ( = ?auto_35151 ?auto_35149 ) ) ( not ( = ?auto_35151 ?auto_35150 ) ) ( IN-CITY ?auto_35153 ?auto_35154 ) ( IN-CITY ?auto_35147 ?auto_35154 ) ( not ( = ?auto_35147 ?auto_35153 ) ) ( OBJ-AT ?auto_35150 ?auto_35147 ) ( OBJ-AT ?auto_35149 ?auto_35153 ) ( TRUCK-AT ?auto_35152 ?auto_35147 ) ( OBJ-AT ?auto_35148 ?auto_35147 ) ( OBJ-AT ?auto_35151 ?auto_35147 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35150 ?auto_35149 ?auto_35147 )
      ( DELIVER-4PKG-VERIFY ?auto_35148 ?auto_35149 ?auto_35150 ?auto_35151 ?auto_35147 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35199 - OBJ
      ?auto_35200 - OBJ
      ?auto_35201 - OBJ
      ?auto_35202 - OBJ
      ?auto_35198 - LOCATION
    )
    :vars
    (
      ?auto_35204 - LOCATION
      ?auto_35205 - CITY
      ?auto_35203 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_35200 ?auto_35199 ) ) ( not ( = ?auto_35201 ?auto_35199 ) ) ( not ( = ?auto_35201 ?auto_35200 ) ) ( not ( = ?auto_35202 ?auto_35199 ) ) ( not ( = ?auto_35202 ?auto_35200 ) ) ( not ( = ?auto_35202 ?auto_35201 ) ) ( IN-CITY ?auto_35204 ?auto_35205 ) ( IN-CITY ?auto_35198 ?auto_35205 ) ( not ( = ?auto_35198 ?auto_35204 ) ) ( OBJ-AT ?auto_35202 ?auto_35198 ) ( OBJ-AT ?auto_35200 ?auto_35204 ) ( TRUCK-AT ?auto_35203 ?auto_35198 ) ( OBJ-AT ?auto_35199 ?auto_35198 ) ( OBJ-AT ?auto_35201 ?auto_35198 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35202 ?auto_35200 ?auto_35198 )
      ( DELIVER-4PKG-VERIFY ?auto_35199 ?auto_35200 ?auto_35201 ?auto_35202 ?auto_35198 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35277 - OBJ
      ?auto_35278 - OBJ
      ?auto_35279 - OBJ
      ?auto_35280 - OBJ
      ?auto_35276 - LOCATION
    )
    :vars
    (
      ?auto_35282 - LOCATION
      ?auto_35283 - CITY
      ?auto_35281 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_35278 ?auto_35277 ) ) ( not ( = ?auto_35279 ?auto_35277 ) ) ( not ( = ?auto_35279 ?auto_35278 ) ) ( not ( = ?auto_35280 ?auto_35277 ) ) ( not ( = ?auto_35280 ?auto_35278 ) ) ( not ( = ?auto_35280 ?auto_35279 ) ) ( IN-CITY ?auto_35282 ?auto_35283 ) ( IN-CITY ?auto_35276 ?auto_35283 ) ( not ( = ?auto_35276 ?auto_35282 ) ) ( OBJ-AT ?auto_35278 ?auto_35276 ) ( OBJ-AT ?auto_35280 ?auto_35282 ) ( TRUCK-AT ?auto_35281 ?auto_35276 ) ( OBJ-AT ?auto_35277 ?auto_35276 ) ( OBJ-AT ?auto_35279 ?auto_35276 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35278 ?auto_35280 ?auto_35276 )
      ( DELIVER-4PKG-VERIFY ?auto_35277 ?auto_35278 ?auto_35279 ?auto_35280 ?auto_35276 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35301 - OBJ
      ?auto_35302 - OBJ
      ?auto_35303 - OBJ
      ?auto_35304 - OBJ
      ?auto_35300 - LOCATION
    )
    :vars
    (
      ?auto_35306 - LOCATION
      ?auto_35307 - CITY
      ?auto_35305 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_35302 ?auto_35301 ) ) ( not ( = ?auto_35303 ?auto_35301 ) ) ( not ( = ?auto_35303 ?auto_35302 ) ) ( not ( = ?auto_35304 ?auto_35301 ) ) ( not ( = ?auto_35304 ?auto_35302 ) ) ( not ( = ?auto_35304 ?auto_35303 ) ) ( IN-CITY ?auto_35306 ?auto_35307 ) ( IN-CITY ?auto_35300 ?auto_35307 ) ( not ( = ?auto_35300 ?auto_35306 ) ) ( OBJ-AT ?auto_35302 ?auto_35300 ) ( OBJ-AT ?auto_35303 ?auto_35306 ) ( TRUCK-AT ?auto_35305 ?auto_35300 ) ( OBJ-AT ?auto_35301 ?auto_35300 ) ( OBJ-AT ?auto_35304 ?auto_35300 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35302 ?auto_35303 ?auto_35300 )
      ( DELIVER-4PKG-VERIFY ?auto_35301 ?auto_35302 ?auto_35303 ?auto_35304 ?auto_35300 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35325 - OBJ
      ?auto_35326 - OBJ
      ?auto_35327 - OBJ
      ?auto_35328 - OBJ
      ?auto_35324 - LOCATION
    )
    :vars
    (
      ?auto_35330 - LOCATION
      ?auto_35331 - CITY
      ?auto_35329 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_35326 ?auto_35325 ) ) ( not ( = ?auto_35327 ?auto_35325 ) ) ( not ( = ?auto_35327 ?auto_35326 ) ) ( not ( = ?auto_35328 ?auto_35325 ) ) ( not ( = ?auto_35328 ?auto_35326 ) ) ( not ( = ?auto_35328 ?auto_35327 ) ) ( IN-CITY ?auto_35330 ?auto_35331 ) ( IN-CITY ?auto_35324 ?auto_35331 ) ( not ( = ?auto_35324 ?auto_35330 ) ) ( OBJ-AT ?auto_35327 ?auto_35324 ) ( OBJ-AT ?auto_35328 ?auto_35330 ) ( TRUCK-AT ?auto_35329 ?auto_35324 ) ( OBJ-AT ?auto_35325 ?auto_35324 ) ( OBJ-AT ?auto_35326 ?auto_35324 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35327 ?auto_35328 ?auto_35324 )
      ( DELIVER-4PKG-VERIFY ?auto_35325 ?auto_35326 ?auto_35327 ?auto_35328 ?auto_35324 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35351 - OBJ
      ?auto_35352 - OBJ
      ?auto_35353 - OBJ
      ?auto_35354 - OBJ
      ?auto_35350 - LOCATION
    )
    :vars
    (
      ?auto_35356 - LOCATION
      ?auto_35357 - CITY
      ?auto_35355 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_35352 ?auto_35351 ) ) ( not ( = ?auto_35353 ?auto_35351 ) ) ( not ( = ?auto_35353 ?auto_35352 ) ) ( not ( = ?auto_35354 ?auto_35351 ) ) ( not ( = ?auto_35354 ?auto_35352 ) ) ( not ( = ?auto_35354 ?auto_35353 ) ) ( IN-CITY ?auto_35356 ?auto_35357 ) ( IN-CITY ?auto_35350 ?auto_35357 ) ( not ( = ?auto_35350 ?auto_35356 ) ) ( OBJ-AT ?auto_35354 ?auto_35350 ) ( OBJ-AT ?auto_35353 ?auto_35356 ) ( TRUCK-AT ?auto_35355 ?auto_35350 ) ( OBJ-AT ?auto_35351 ?auto_35350 ) ( OBJ-AT ?auto_35352 ?auto_35350 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35354 ?auto_35353 ?auto_35350 )
      ( DELIVER-4PKG-VERIFY ?auto_35351 ?auto_35352 ?auto_35353 ?auto_35354 ?auto_35350 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35455 - OBJ
      ?auto_35456 - OBJ
      ?auto_35457 - OBJ
      ?auto_35458 - OBJ
      ?auto_35454 - LOCATION
    )
    :vars
    (
      ?auto_35460 - LOCATION
      ?auto_35461 - CITY
      ?auto_35459 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_35456 ?auto_35455 ) ) ( not ( = ?auto_35457 ?auto_35455 ) ) ( not ( = ?auto_35457 ?auto_35456 ) ) ( not ( = ?auto_35458 ?auto_35455 ) ) ( not ( = ?auto_35458 ?auto_35456 ) ) ( not ( = ?auto_35458 ?auto_35457 ) ) ( IN-CITY ?auto_35460 ?auto_35461 ) ( IN-CITY ?auto_35454 ?auto_35461 ) ( not ( = ?auto_35454 ?auto_35460 ) ) ( OBJ-AT ?auto_35457 ?auto_35454 ) ( OBJ-AT ?auto_35456 ?auto_35460 ) ( TRUCK-AT ?auto_35459 ?auto_35454 ) ( OBJ-AT ?auto_35455 ?auto_35454 ) ( OBJ-AT ?auto_35458 ?auto_35454 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35457 ?auto_35456 ?auto_35454 )
      ( DELIVER-4PKG-VERIFY ?auto_35455 ?auto_35456 ?auto_35457 ?auto_35458 ?auto_35454 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35479 - OBJ
      ?auto_35480 - OBJ
      ?auto_35481 - OBJ
      ?auto_35482 - OBJ
      ?auto_35478 - LOCATION
    )
    :vars
    (
      ?auto_35484 - LOCATION
      ?auto_35485 - CITY
      ?auto_35483 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_35480 ?auto_35479 ) ) ( not ( = ?auto_35481 ?auto_35479 ) ) ( not ( = ?auto_35481 ?auto_35480 ) ) ( not ( = ?auto_35482 ?auto_35479 ) ) ( not ( = ?auto_35482 ?auto_35480 ) ) ( not ( = ?auto_35482 ?auto_35481 ) ) ( IN-CITY ?auto_35484 ?auto_35485 ) ( IN-CITY ?auto_35478 ?auto_35485 ) ( not ( = ?auto_35478 ?auto_35484 ) ) ( OBJ-AT ?auto_35482 ?auto_35478 ) ( OBJ-AT ?auto_35480 ?auto_35484 ) ( TRUCK-AT ?auto_35483 ?auto_35478 ) ( OBJ-AT ?auto_35479 ?auto_35478 ) ( OBJ-AT ?auto_35481 ?auto_35478 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35482 ?auto_35480 ?auto_35478 )
      ( DELIVER-4PKG-VERIFY ?auto_35479 ?auto_35480 ?auto_35481 ?auto_35482 ?auto_35478 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35632 - OBJ
      ?auto_35633 - OBJ
      ?auto_35634 - OBJ
      ?auto_35635 - OBJ
      ?auto_35631 - LOCATION
    )
    :vars
    (
      ?auto_35637 - LOCATION
      ?auto_35638 - CITY
      ?auto_35636 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_35633 ?auto_35632 ) ) ( not ( = ?auto_35634 ?auto_35632 ) ) ( not ( = ?auto_35634 ?auto_35633 ) ) ( not ( = ?auto_35635 ?auto_35632 ) ) ( not ( = ?auto_35635 ?auto_35633 ) ) ( not ( = ?auto_35635 ?auto_35634 ) ) ( IN-CITY ?auto_35637 ?auto_35638 ) ( IN-CITY ?auto_35631 ?auto_35638 ) ( not ( = ?auto_35631 ?auto_35637 ) ) ( OBJ-AT ?auto_35633 ?auto_35631 ) ( OBJ-AT ?auto_35632 ?auto_35637 ) ( TRUCK-AT ?auto_35636 ?auto_35631 ) ( OBJ-AT ?auto_35634 ?auto_35631 ) ( OBJ-AT ?auto_35635 ?auto_35631 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35633 ?auto_35632 ?auto_35631 )
      ( DELIVER-4PKG-VERIFY ?auto_35632 ?auto_35633 ?auto_35634 ?auto_35635 ?auto_35631 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35656 - OBJ
      ?auto_35657 - OBJ
      ?auto_35658 - OBJ
      ?auto_35659 - OBJ
      ?auto_35655 - LOCATION
    )
    :vars
    (
      ?auto_35661 - LOCATION
      ?auto_35662 - CITY
      ?auto_35660 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_35657 ?auto_35656 ) ) ( not ( = ?auto_35658 ?auto_35656 ) ) ( not ( = ?auto_35658 ?auto_35657 ) ) ( not ( = ?auto_35659 ?auto_35656 ) ) ( not ( = ?auto_35659 ?auto_35657 ) ) ( not ( = ?auto_35659 ?auto_35658 ) ) ( IN-CITY ?auto_35661 ?auto_35662 ) ( IN-CITY ?auto_35655 ?auto_35662 ) ( not ( = ?auto_35655 ?auto_35661 ) ) ( OBJ-AT ?auto_35657 ?auto_35655 ) ( OBJ-AT ?auto_35656 ?auto_35661 ) ( TRUCK-AT ?auto_35660 ?auto_35655 ) ( OBJ-AT ?auto_35658 ?auto_35655 ) ( OBJ-AT ?auto_35659 ?auto_35655 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35657 ?auto_35656 ?auto_35655 )
      ( DELIVER-4PKG-VERIFY ?auto_35656 ?auto_35657 ?auto_35658 ?auto_35659 ?auto_35655 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35728 - OBJ
      ?auto_35729 - OBJ
      ?auto_35730 - OBJ
      ?auto_35731 - OBJ
      ?auto_35727 - LOCATION
    )
    :vars
    (
      ?auto_35733 - LOCATION
      ?auto_35734 - CITY
      ?auto_35732 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_35729 ?auto_35728 ) ) ( not ( = ?auto_35730 ?auto_35728 ) ) ( not ( = ?auto_35730 ?auto_35729 ) ) ( not ( = ?auto_35731 ?auto_35728 ) ) ( not ( = ?auto_35731 ?auto_35729 ) ) ( not ( = ?auto_35731 ?auto_35730 ) ) ( IN-CITY ?auto_35733 ?auto_35734 ) ( IN-CITY ?auto_35727 ?auto_35734 ) ( not ( = ?auto_35727 ?auto_35733 ) ) ( OBJ-AT ?auto_35730 ?auto_35727 ) ( OBJ-AT ?auto_35728 ?auto_35733 ) ( TRUCK-AT ?auto_35732 ?auto_35727 ) ( OBJ-AT ?auto_35729 ?auto_35727 ) ( OBJ-AT ?auto_35731 ?auto_35727 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35730 ?auto_35728 ?auto_35727 )
      ( DELIVER-4PKG-VERIFY ?auto_35728 ?auto_35729 ?auto_35730 ?auto_35731 ?auto_35727 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35779 - OBJ
      ?auto_35780 - OBJ
      ?auto_35781 - OBJ
      ?auto_35782 - OBJ
      ?auto_35778 - LOCATION
    )
    :vars
    (
      ?auto_35784 - LOCATION
      ?auto_35785 - CITY
      ?auto_35783 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_35780 ?auto_35779 ) ) ( not ( = ?auto_35781 ?auto_35779 ) ) ( not ( = ?auto_35781 ?auto_35780 ) ) ( not ( = ?auto_35782 ?auto_35779 ) ) ( not ( = ?auto_35782 ?auto_35780 ) ) ( not ( = ?auto_35782 ?auto_35781 ) ) ( IN-CITY ?auto_35784 ?auto_35785 ) ( IN-CITY ?auto_35778 ?auto_35785 ) ( not ( = ?auto_35778 ?auto_35784 ) ) ( OBJ-AT ?auto_35782 ?auto_35778 ) ( OBJ-AT ?auto_35779 ?auto_35784 ) ( TRUCK-AT ?auto_35783 ?auto_35778 ) ( OBJ-AT ?auto_35780 ?auto_35778 ) ( OBJ-AT ?auto_35781 ?auto_35778 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35782 ?auto_35779 ?auto_35778 )
      ( DELIVER-4PKG-VERIFY ?auto_35779 ?auto_35780 ?auto_35781 ?auto_35782 ?auto_35778 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35857 - OBJ
      ?auto_35858 - OBJ
      ?auto_35859 - OBJ
      ?auto_35860 - OBJ
      ?auto_35856 - LOCATION
    )
    :vars
    (
      ?auto_35862 - LOCATION
      ?auto_35863 - CITY
      ?auto_35861 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_35858 ?auto_35857 ) ) ( not ( = ?auto_35859 ?auto_35857 ) ) ( not ( = ?auto_35859 ?auto_35858 ) ) ( not ( = ?auto_35860 ?auto_35857 ) ) ( not ( = ?auto_35860 ?auto_35858 ) ) ( not ( = ?auto_35860 ?auto_35859 ) ) ( IN-CITY ?auto_35862 ?auto_35863 ) ( IN-CITY ?auto_35856 ?auto_35863 ) ( not ( = ?auto_35856 ?auto_35862 ) ) ( OBJ-AT ?auto_35859 ?auto_35856 ) ( OBJ-AT ?auto_35857 ?auto_35862 ) ( TRUCK-AT ?auto_35861 ?auto_35856 ) ( OBJ-AT ?auto_35858 ?auto_35856 ) ( OBJ-AT ?auto_35860 ?auto_35856 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35859 ?auto_35857 ?auto_35856 )
      ( DELIVER-4PKG-VERIFY ?auto_35857 ?auto_35858 ?auto_35859 ?auto_35860 ?auto_35856 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35881 - OBJ
      ?auto_35882 - OBJ
      ?auto_35883 - OBJ
      ?auto_35884 - OBJ
      ?auto_35880 - LOCATION
    )
    :vars
    (
      ?auto_35886 - LOCATION
      ?auto_35887 - CITY
      ?auto_35885 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_35882 ?auto_35881 ) ) ( not ( = ?auto_35883 ?auto_35881 ) ) ( not ( = ?auto_35883 ?auto_35882 ) ) ( not ( = ?auto_35884 ?auto_35881 ) ) ( not ( = ?auto_35884 ?auto_35882 ) ) ( not ( = ?auto_35884 ?auto_35883 ) ) ( IN-CITY ?auto_35886 ?auto_35887 ) ( IN-CITY ?auto_35880 ?auto_35887 ) ( not ( = ?auto_35880 ?auto_35886 ) ) ( OBJ-AT ?auto_35884 ?auto_35880 ) ( OBJ-AT ?auto_35881 ?auto_35886 ) ( TRUCK-AT ?auto_35885 ?auto_35880 ) ( OBJ-AT ?auto_35882 ?auto_35880 ) ( OBJ-AT ?auto_35883 ?auto_35880 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35884 ?auto_35881 ?auto_35880 )
      ( DELIVER-4PKG-VERIFY ?auto_35881 ?auto_35882 ?auto_35883 ?auto_35884 ?auto_35880 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_36123 - OBJ
      ?auto_36122 - LOCATION
    )
    :vars
    (
      ?auto_36127 - OBJ
      ?auto_36125 - LOCATION
      ?auto_36126 - CITY
      ?auto_36124 - TRUCK
      ?auto_36128 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_36123 ?auto_36127 ) ) ( IN-CITY ?auto_36125 ?auto_36126 ) ( IN-CITY ?auto_36122 ?auto_36126 ) ( not ( = ?auto_36122 ?auto_36125 ) ) ( OBJ-AT ?auto_36127 ?auto_36122 ) ( OBJ-AT ?auto_36123 ?auto_36125 ) ( TRUCK-AT ?auto_36124 ?auto_36122 ) ( not ( = ?auto_36128 ?auto_36127 ) ) ( IN-TRUCK ?auto_36128 ?auto_36124 ) ( not ( = ?auto_36123 ?auto_36128 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36127 ?auto_36128 ?auto_36122 )
      ( DELIVER-2PKG ?auto_36127 ?auto_36123 ?auto_36122 )
      ( DELIVER-1PKG-VERIFY ?auto_36123 ?auto_36122 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_36130 - OBJ
      ?auto_36131 - OBJ
      ?auto_36129 - LOCATION
    )
    :vars
    (
      ?auto_36133 - LOCATION
      ?auto_36134 - CITY
      ?auto_36132 - TRUCK
      ?auto_36135 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_36131 ?auto_36130 ) ) ( IN-CITY ?auto_36133 ?auto_36134 ) ( IN-CITY ?auto_36129 ?auto_36134 ) ( not ( = ?auto_36129 ?auto_36133 ) ) ( OBJ-AT ?auto_36130 ?auto_36129 ) ( OBJ-AT ?auto_36131 ?auto_36133 ) ( TRUCK-AT ?auto_36132 ?auto_36129 ) ( not ( = ?auto_36135 ?auto_36130 ) ) ( IN-TRUCK ?auto_36135 ?auto_36132 ) ( not ( = ?auto_36131 ?auto_36135 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_36131 ?auto_36129 )
      ( DELIVER-2PKG-VERIFY ?auto_36130 ?auto_36131 ?auto_36129 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_36137 - OBJ
      ?auto_36138 - OBJ
      ?auto_36136 - LOCATION
    )
    :vars
    (
      ?auto_36143 - OBJ
      ?auto_36142 - LOCATION
      ?auto_36139 - CITY
      ?auto_36141 - TRUCK
      ?auto_36140 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_36138 ?auto_36137 ) ) ( not ( = ?auto_36138 ?auto_36143 ) ) ( IN-CITY ?auto_36142 ?auto_36139 ) ( IN-CITY ?auto_36136 ?auto_36139 ) ( not ( = ?auto_36136 ?auto_36142 ) ) ( OBJ-AT ?auto_36143 ?auto_36136 ) ( OBJ-AT ?auto_36138 ?auto_36142 ) ( TRUCK-AT ?auto_36141 ?auto_36136 ) ( not ( = ?auto_36140 ?auto_36143 ) ) ( IN-TRUCK ?auto_36140 ?auto_36141 ) ( not ( = ?auto_36138 ?auto_36140 ) ) ( OBJ-AT ?auto_36137 ?auto_36136 ) ( not ( = ?auto_36137 ?auto_36143 ) ) ( not ( = ?auto_36137 ?auto_36140 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36143 ?auto_36138 ?auto_36136 )
      ( DELIVER-2PKG-VERIFY ?auto_36137 ?auto_36138 ?auto_36136 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_36145 - OBJ
      ?auto_36146 - OBJ
      ?auto_36144 - LOCATION
    )
    :vars
    (
      ?auto_36150 - OBJ
      ?auto_36149 - LOCATION
      ?auto_36147 - CITY
      ?auto_36148 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36146 ?auto_36145 ) ) ( not ( = ?auto_36146 ?auto_36150 ) ) ( IN-CITY ?auto_36149 ?auto_36147 ) ( IN-CITY ?auto_36144 ?auto_36147 ) ( not ( = ?auto_36144 ?auto_36149 ) ) ( OBJ-AT ?auto_36150 ?auto_36144 ) ( OBJ-AT ?auto_36146 ?auto_36149 ) ( TRUCK-AT ?auto_36148 ?auto_36144 ) ( not ( = ?auto_36145 ?auto_36150 ) ) ( IN-TRUCK ?auto_36145 ?auto_36148 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36150 ?auto_36146 ?auto_36144 )
      ( DELIVER-2PKG-VERIFY ?auto_36145 ?auto_36146 ?auto_36144 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_36152 - OBJ
      ?auto_36153 - OBJ
      ?auto_36151 - LOCATION
    )
    :vars
    (
      ?auto_36157 - LOCATION
      ?auto_36154 - CITY
      ?auto_36156 - TRUCK
      ?auto_36155 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_36153 ?auto_36152 ) ) ( IN-CITY ?auto_36157 ?auto_36154 ) ( IN-CITY ?auto_36151 ?auto_36154 ) ( not ( = ?auto_36151 ?auto_36157 ) ) ( OBJ-AT ?auto_36153 ?auto_36151 ) ( OBJ-AT ?auto_36152 ?auto_36157 ) ( TRUCK-AT ?auto_36156 ?auto_36151 ) ( not ( = ?auto_36155 ?auto_36153 ) ) ( IN-TRUCK ?auto_36155 ?auto_36156 ) ( not ( = ?auto_36152 ?auto_36155 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36153 ?auto_36152 ?auto_36151 )
      ( DELIVER-2PKG-VERIFY ?auto_36152 ?auto_36153 ?auto_36151 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_36159 - OBJ
      ?auto_36160 - OBJ
      ?auto_36158 - LOCATION
    )
    :vars
    (
      ?auto_36165 - OBJ
      ?auto_36164 - LOCATION
      ?auto_36161 - CITY
      ?auto_36163 - TRUCK
      ?auto_36162 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_36160 ?auto_36159 ) ) ( not ( = ?auto_36159 ?auto_36165 ) ) ( IN-CITY ?auto_36164 ?auto_36161 ) ( IN-CITY ?auto_36158 ?auto_36161 ) ( not ( = ?auto_36158 ?auto_36164 ) ) ( OBJ-AT ?auto_36165 ?auto_36158 ) ( OBJ-AT ?auto_36159 ?auto_36164 ) ( TRUCK-AT ?auto_36163 ?auto_36158 ) ( not ( = ?auto_36162 ?auto_36165 ) ) ( IN-TRUCK ?auto_36162 ?auto_36163 ) ( not ( = ?auto_36159 ?auto_36162 ) ) ( OBJ-AT ?auto_36160 ?auto_36158 ) ( not ( = ?auto_36160 ?auto_36165 ) ) ( not ( = ?auto_36160 ?auto_36162 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36165 ?auto_36159 ?auto_36158 )
      ( DELIVER-2PKG-VERIFY ?auto_36159 ?auto_36160 ?auto_36158 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_36167 - OBJ
      ?auto_36168 - OBJ
      ?auto_36166 - LOCATION
    )
    :vars
    (
      ?auto_36172 - OBJ
      ?auto_36171 - LOCATION
      ?auto_36169 - CITY
      ?auto_36170 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36168 ?auto_36167 ) ) ( not ( = ?auto_36167 ?auto_36172 ) ) ( IN-CITY ?auto_36171 ?auto_36169 ) ( IN-CITY ?auto_36166 ?auto_36169 ) ( not ( = ?auto_36166 ?auto_36171 ) ) ( OBJ-AT ?auto_36172 ?auto_36166 ) ( OBJ-AT ?auto_36167 ?auto_36171 ) ( TRUCK-AT ?auto_36170 ?auto_36166 ) ( not ( = ?auto_36168 ?auto_36172 ) ) ( IN-TRUCK ?auto_36168 ?auto_36170 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36172 ?auto_36167 ?auto_36166 )
      ( DELIVER-2PKG-VERIFY ?auto_36167 ?auto_36168 ?auto_36166 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_36190 - OBJ
      ?auto_36191 - OBJ
      ?auto_36192 - OBJ
      ?auto_36189 - LOCATION
    )
    :vars
    (
      ?auto_36196 - LOCATION
      ?auto_36193 - CITY
      ?auto_36195 - TRUCK
      ?auto_36194 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_36191 ?auto_36190 ) ) ( not ( = ?auto_36192 ?auto_36190 ) ) ( not ( = ?auto_36192 ?auto_36191 ) ) ( IN-CITY ?auto_36196 ?auto_36193 ) ( IN-CITY ?auto_36189 ?auto_36193 ) ( not ( = ?auto_36189 ?auto_36196 ) ) ( OBJ-AT ?auto_36190 ?auto_36189 ) ( OBJ-AT ?auto_36192 ?auto_36196 ) ( TRUCK-AT ?auto_36195 ?auto_36189 ) ( not ( = ?auto_36194 ?auto_36190 ) ) ( IN-TRUCK ?auto_36194 ?auto_36195 ) ( not ( = ?auto_36192 ?auto_36194 ) ) ( OBJ-AT ?auto_36191 ?auto_36189 ) ( not ( = ?auto_36191 ?auto_36194 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36190 ?auto_36192 ?auto_36189 )
      ( DELIVER-3PKG-VERIFY ?auto_36190 ?auto_36191 ?auto_36192 ?auto_36189 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_36198 - OBJ
      ?auto_36199 - OBJ
      ?auto_36200 - OBJ
      ?auto_36197 - LOCATION
    )
    :vars
    (
      ?auto_36203 - LOCATION
      ?auto_36201 - CITY
      ?auto_36202 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36199 ?auto_36198 ) ) ( not ( = ?auto_36200 ?auto_36198 ) ) ( not ( = ?auto_36200 ?auto_36199 ) ) ( IN-CITY ?auto_36203 ?auto_36201 ) ( IN-CITY ?auto_36197 ?auto_36201 ) ( not ( = ?auto_36197 ?auto_36203 ) ) ( OBJ-AT ?auto_36198 ?auto_36197 ) ( OBJ-AT ?auto_36200 ?auto_36203 ) ( TRUCK-AT ?auto_36202 ?auto_36197 ) ( IN-TRUCK ?auto_36199 ?auto_36202 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36198 ?auto_36200 ?auto_36197 )
      ( DELIVER-3PKG-VERIFY ?auto_36198 ?auto_36199 ?auto_36200 ?auto_36197 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_36213 - OBJ
      ?auto_36214 - OBJ
      ?auto_36215 - OBJ
      ?auto_36212 - LOCATION
    )
    :vars
    (
      ?auto_36219 - LOCATION
      ?auto_36216 - CITY
      ?auto_36218 - TRUCK
      ?auto_36217 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_36214 ?auto_36213 ) ) ( not ( = ?auto_36215 ?auto_36213 ) ) ( not ( = ?auto_36215 ?auto_36214 ) ) ( IN-CITY ?auto_36219 ?auto_36216 ) ( IN-CITY ?auto_36212 ?auto_36216 ) ( not ( = ?auto_36212 ?auto_36219 ) ) ( OBJ-AT ?auto_36213 ?auto_36212 ) ( OBJ-AT ?auto_36214 ?auto_36219 ) ( TRUCK-AT ?auto_36218 ?auto_36212 ) ( not ( = ?auto_36217 ?auto_36213 ) ) ( IN-TRUCK ?auto_36217 ?auto_36218 ) ( not ( = ?auto_36214 ?auto_36217 ) ) ( OBJ-AT ?auto_36215 ?auto_36212 ) ( not ( = ?auto_36215 ?auto_36217 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36213 ?auto_36214 ?auto_36212 )
      ( DELIVER-3PKG-VERIFY ?auto_36213 ?auto_36214 ?auto_36215 ?auto_36212 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_36221 - OBJ
      ?auto_36222 - OBJ
      ?auto_36223 - OBJ
      ?auto_36220 - LOCATION
    )
    :vars
    (
      ?auto_36226 - LOCATION
      ?auto_36224 - CITY
      ?auto_36225 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36222 ?auto_36221 ) ) ( not ( = ?auto_36223 ?auto_36221 ) ) ( not ( = ?auto_36223 ?auto_36222 ) ) ( IN-CITY ?auto_36226 ?auto_36224 ) ( IN-CITY ?auto_36220 ?auto_36224 ) ( not ( = ?auto_36220 ?auto_36226 ) ) ( OBJ-AT ?auto_36221 ?auto_36220 ) ( OBJ-AT ?auto_36222 ?auto_36226 ) ( TRUCK-AT ?auto_36225 ?auto_36220 ) ( IN-TRUCK ?auto_36223 ?auto_36225 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36221 ?auto_36222 ?auto_36220 )
      ( DELIVER-3PKG-VERIFY ?auto_36221 ?auto_36222 ?auto_36223 ?auto_36220 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_36236 - OBJ
      ?auto_36237 - OBJ
      ?auto_36238 - OBJ
      ?auto_36235 - LOCATION
    )
    :vars
    (
      ?auto_36242 - LOCATION
      ?auto_36239 - CITY
      ?auto_36241 - TRUCK
      ?auto_36240 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_36237 ?auto_36236 ) ) ( not ( = ?auto_36238 ?auto_36236 ) ) ( not ( = ?auto_36238 ?auto_36237 ) ) ( IN-CITY ?auto_36242 ?auto_36239 ) ( IN-CITY ?auto_36235 ?auto_36239 ) ( not ( = ?auto_36235 ?auto_36242 ) ) ( OBJ-AT ?auto_36237 ?auto_36235 ) ( OBJ-AT ?auto_36238 ?auto_36242 ) ( TRUCK-AT ?auto_36241 ?auto_36235 ) ( not ( = ?auto_36240 ?auto_36237 ) ) ( IN-TRUCK ?auto_36240 ?auto_36241 ) ( not ( = ?auto_36238 ?auto_36240 ) ) ( OBJ-AT ?auto_36236 ?auto_36235 ) ( not ( = ?auto_36236 ?auto_36240 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36237 ?auto_36238 ?auto_36235 )
      ( DELIVER-3PKG-VERIFY ?auto_36236 ?auto_36237 ?auto_36238 ?auto_36235 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_36253 - OBJ
      ?auto_36254 - OBJ
      ?auto_36255 - OBJ
      ?auto_36252 - LOCATION
    )
    :vars
    (
      ?auto_36259 - OBJ
      ?auto_36258 - LOCATION
      ?auto_36256 - CITY
      ?auto_36257 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36254 ?auto_36253 ) ) ( not ( = ?auto_36255 ?auto_36253 ) ) ( not ( = ?auto_36255 ?auto_36254 ) ) ( not ( = ?auto_36255 ?auto_36259 ) ) ( IN-CITY ?auto_36258 ?auto_36256 ) ( IN-CITY ?auto_36252 ?auto_36256 ) ( not ( = ?auto_36252 ?auto_36258 ) ) ( OBJ-AT ?auto_36259 ?auto_36252 ) ( OBJ-AT ?auto_36255 ?auto_36258 ) ( TRUCK-AT ?auto_36257 ?auto_36252 ) ( not ( = ?auto_36254 ?auto_36259 ) ) ( IN-TRUCK ?auto_36254 ?auto_36257 ) ( OBJ-AT ?auto_36253 ?auto_36252 ) ( not ( = ?auto_36253 ?auto_36259 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36259 ?auto_36255 ?auto_36252 )
      ( DELIVER-3PKG-VERIFY ?auto_36253 ?auto_36254 ?auto_36255 ?auto_36252 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_36261 - OBJ
      ?auto_36262 - OBJ
      ?auto_36263 - OBJ
      ?auto_36260 - LOCATION
    )
    :vars
    (
      ?auto_36267 - LOCATION
      ?auto_36264 - CITY
      ?auto_36266 - TRUCK
      ?auto_36265 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_36262 ?auto_36261 ) ) ( not ( = ?auto_36263 ?auto_36261 ) ) ( not ( = ?auto_36263 ?auto_36262 ) ) ( IN-CITY ?auto_36267 ?auto_36264 ) ( IN-CITY ?auto_36260 ?auto_36264 ) ( not ( = ?auto_36260 ?auto_36267 ) ) ( OBJ-AT ?auto_36263 ?auto_36260 ) ( OBJ-AT ?auto_36262 ?auto_36267 ) ( TRUCK-AT ?auto_36266 ?auto_36260 ) ( not ( = ?auto_36265 ?auto_36263 ) ) ( IN-TRUCK ?auto_36265 ?auto_36266 ) ( not ( = ?auto_36262 ?auto_36265 ) ) ( OBJ-AT ?auto_36261 ?auto_36260 ) ( not ( = ?auto_36261 ?auto_36265 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36263 ?auto_36262 ?auto_36260 )
      ( DELIVER-3PKG-VERIFY ?auto_36261 ?auto_36262 ?auto_36263 ?auto_36260 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_36278 - OBJ
      ?auto_36279 - OBJ
      ?auto_36280 - OBJ
      ?auto_36277 - LOCATION
    )
    :vars
    (
      ?auto_36284 - OBJ
      ?auto_36283 - LOCATION
      ?auto_36281 - CITY
      ?auto_36282 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36279 ?auto_36278 ) ) ( not ( = ?auto_36280 ?auto_36278 ) ) ( not ( = ?auto_36280 ?auto_36279 ) ) ( not ( = ?auto_36279 ?auto_36284 ) ) ( IN-CITY ?auto_36283 ?auto_36281 ) ( IN-CITY ?auto_36277 ?auto_36281 ) ( not ( = ?auto_36277 ?auto_36283 ) ) ( OBJ-AT ?auto_36284 ?auto_36277 ) ( OBJ-AT ?auto_36279 ?auto_36283 ) ( TRUCK-AT ?auto_36282 ?auto_36277 ) ( not ( = ?auto_36280 ?auto_36284 ) ) ( IN-TRUCK ?auto_36280 ?auto_36282 ) ( OBJ-AT ?auto_36278 ?auto_36277 ) ( not ( = ?auto_36278 ?auto_36284 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36284 ?auto_36279 ?auto_36277 )
      ( DELIVER-3PKG-VERIFY ?auto_36278 ?auto_36279 ?auto_36280 ?auto_36277 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_36295 - OBJ
      ?auto_36296 - OBJ
      ?auto_36297 - OBJ
      ?auto_36294 - LOCATION
    )
    :vars
    (
      ?auto_36300 - LOCATION
      ?auto_36298 - CITY
      ?auto_36299 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36296 ?auto_36295 ) ) ( not ( = ?auto_36297 ?auto_36295 ) ) ( not ( = ?auto_36297 ?auto_36296 ) ) ( IN-CITY ?auto_36300 ?auto_36298 ) ( IN-CITY ?auto_36294 ?auto_36298 ) ( not ( = ?auto_36294 ?auto_36300 ) ) ( OBJ-AT ?auto_36296 ?auto_36294 ) ( OBJ-AT ?auto_36297 ?auto_36300 ) ( TRUCK-AT ?auto_36299 ?auto_36294 ) ( IN-TRUCK ?auto_36295 ?auto_36299 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36296 ?auto_36297 ?auto_36294 )
      ( DELIVER-3PKG-VERIFY ?auto_36295 ?auto_36296 ?auto_36297 ?auto_36294 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_36302 - OBJ
      ?auto_36303 - OBJ
      ?auto_36304 - OBJ
      ?auto_36301 - LOCATION
    )
    :vars
    (
      ?auto_36308 - OBJ
      ?auto_36307 - LOCATION
      ?auto_36305 - CITY
      ?auto_36306 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36303 ?auto_36302 ) ) ( not ( = ?auto_36304 ?auto_36302 ) ) ( not ( = ?auto_36304 ?auto_36303 ) ) ( not ( = ?auto_36304 ?auto_36308 ) ) ( IN-CITY ?auto_36307 ?auto_36305 ) ( IN-CITY ?auto_36301 ?auto_36305 ) ( not ( = ?auto_36301 ?auto_36307 ) ) ( OBJ-AT ?auto_36308 ?auto_36301 ) ( OBJ-AT ?auto_36304 ?auto_36307 ) ( TRUCK-AT ?auto_36306 ?auto_36301 ) ( not ( = ?auto_36302 ?auto_36308 ) ) ( IN-TRUCK ?auto_36302 ?auto_36306 ) ( OBJ-AT ?auto_36303 ?auto_36301 ) ( not ( = ?auto_36303 ?auto_36308 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36308 ?auto_36304 ?auto_36301 )
      ( DELIVER-3PKG-VERIFY ?auto_36302 ?auto_36303 ?auto_36304 ?auto_36301 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_36318 - OBJ
      ?auto_36319 - OBJ
      ?auto_36320 - OBJ
      ?auto_36317 - LOCATION
    )
    :vars
    (
      ?auto_36323 - LOCATION
      ?auto_36321 - CITY
      ?auto_36322 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36319 ?auto_36318 ) ) ( not ( = ?auto_36320 ?auto_36318 ) ) ( not ( = ?auto_36320 ?auto_36319 ) ) ( IN-CITY ?auto_36323 ?auto_36321 ) ( IN-CITY ?auto_36317 ?auto_36321 ) ( not ( = ?auto_36317 ?auto_36323 ) ) ( OBJ-AT ?auto_36320 ?auto_36317 ) ( OBJ-AT ?auto_36319 ?auto_36323 ) ( TRUCK-AT ?auto_36322 ?auto_36317 ) ( IN-TRUCK ?auto_36318 ?auto_36322 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36320 ?auto_36319 ?auto_36317 )
      ( DELIVER-3PKG-VERIFY ?auto_36318 ?auto_36319 ?auto_36320 ?auto_36317 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_36325 - OBJ
      ?auto_36326 - OBJ
      ?auto_36327 - OBJ
      ?auto_36324 - LOCATION
    )
    :vars
    (
      ?auto_36331 - OBJ
      ?auto_36330 - LOCATION
      ?auto_36328 - CITY
      ?auto_36329 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36326 ?auto_36325 ) ) ( not ( = ?auto_36327 ?auto_36325 ) ) ( not ( = ?auto_36327 ?auto_36326 ) ) ( not ( = ?auto_36326 ?auto_36331 ) ) ( IN-CITY ?auto_36330 ?auto_36328 ) ( IN-CITY ?auto_36324 ?auto_36328 ) ( not ( = ?auto_36324 ?auto_36330 ) ) ( OBJ-AT ?auto_36331 ?auto_36324 ) ( OBJ-AT ?auto_36326 ?auto_36330 ) ( TRUCK-AT ?auto_36329 ?auto_36324 ) ( not ( = ?auto_36325 ?auto_36331 ) ) ( IN-TRUCK ?auto_36325 ?auto_36329 ) ( OBJ-AT ?auto_36327 ?auto_36324 ) ( not ( = ?auto_36327 ?auto_36331 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36331 ?auto_36326 ?auto_36324 )
      ( DELIVER-3PKG-VERIFY ?auto_36325 ?auto_36326 ?auto_36327 ?auto_36324 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_36357 - OBJ
      ?auto_36358 - OBJ
      ?auto_36359 - OBJ
      ?auto_36356 - LOCATION
    )
    :vars
    (
      ?auto_36363 - LOCATION
      ?auto_36360 - CITY
      ?auto_36362 - TRUCK
      ?auto_36361 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_36358 ?auto_36357 ) ) ( not ( = ?auto_36359 ?auto_36357 ) ) ( not ( = ?auto_36359 ?auto_36358 ) ) ( IN-CITY ?auto_36363 ?auto_36360 ) ( IN-CITY ?auto_36356 ?auto_36360 ) ( not ( = ?auto_36356 ?auto_36363 ) ) ( OBJ-AT ?auto_36358 ?auto_36356 ) ( OBJ-AT ?auto_36357 ?auto_36363 ) ( TRUCK-AT ?auto_36362 ?auto_36356 ) ( not ( = ?auto_36361 ?auto_36358 ) ) ( IN-TRUCK ?auto_36361 ?auto_36362 ) ( not ( = ?auto_36357 ?auto_36361 ) ) ( OBJ-AT ?auto_36359 ?auto_36356 ) ( not ( = ?auto_36359 ?auto_36361 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36358 ?auto_36357 ?auto_36356 )
      ( DELIVER-3PKG-VERIFY ?auto_36357 ?auto_36358 ?auto_36359 ?auto_36356 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_36365 - OBJ
      ?auto_36366 - OBJ
      ?auto_36367 - OBJ
      ?auto_36364 - LOCATION
    )
    :vars
    (
      ?auto_36370 - LOCATION
      ?auto_36368 - CITY
      ?auto_36369 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36366 ?auto_36365 ) ) ( not ( = ?auto_36367 ?auto_36365 ) ) ( not ( = ?auto_36367 ?auto_36366 ) ) ( IN-CITY ?auto_36370 ?auto_36368 ) ( IN-CITY ?auto_36364 ?auto_36368 ) ( not ( = ?auto_36364 ?auto_36370 ) ) ( OBJ-AT ?auto_36366 ?auto_36364 ) ( OBJ-AT ?auto_36365 ?auto_36370 ) ( TRUCK-AT ?auto_36369 ?auto_36364 ) ( IN-TRUCK ?auto_36367 ?auto_36369 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36366 ?auto_36365 ?auto_36364 )
      ( DELIVER-3PKG-VERIFY ?auto_36365 ?auto_36366 ?auto_36367 ?auto_36364 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_36380 - OBJ
      ?auto_36381 - OBJ
      ?auto_36382 - OBJ
      ?auto_36379 - LOCATION
    )
    :vars
    (
      ?auto_36386 - LOCATION
      ?auto_36383 - CITY
      ?auto_36385 - TRUCK
      ?auto_36384 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_36381 ?auto_36380 ) ) ( not ( = ?auto_36382 ?auto_36380 ) ) ( not ( = ?auto_36382 ?auto_36381 ) ) ( IN-CITY ?auto_36386 ?auto_36383 ) ( IN-CITY ?auto_36379 ?auto_36383 ) ( not ( = ?auto_36379 ?auto_36386 ) ) ( OBJ-AT ?auto_36382 ?auto_36379 ) ( OBJ-AT ?auto_36380 ?auto_36386 ) ( TRUCK-AT ?auto_36385 ?auto_36379 ) ( not ( = ?auto_36384 ?auto_36382 ) ) ( IN-TRUCK ?auto_36384 ?auto_36385 ) ( not ( = ?auto_36380 ?auto_36384 ) ) ( OBJ-AT ?auto_36381 ?auto_36379 ) ( not ( = ?auto_36381 ?auto_36384 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36382 ?auto_36380 ?auto_36379 )
      ( DELIVER-3PKG-VERIFY ?auto_36380 ?auto_36381 ?auto_36382 ?auto_36379 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_36397 - OBJ
      ?auto_36398 - OBJ
      ?auto_36399 - OBJ
      ?auto_36396 - LOCATION
    )
    :vars
    (
      ?auto_36403 - OBJ
      ?auto_36402 - LOCATION
      ?auto_36400 - CITY
      ?auto_36401 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36398 ?auto_36397 ) ) ( not ( = ?auto_36399 ?auto_36397 ) ) ( not ( = ?auto_36399 ?auto_36398 ) ) ( not ( = ?auto_36397 ?auto_36403 ) ) ( IN-CITY ?auto_36402 ?auto_36400 ) ( IN-CITY ?auto_36396 ?auto_36400 ) ( not ( = ?auto_36396 ?auto_36402 ) ) ( OBJ-AT ?auto_36403 ?auto_36396 ) ( OBJ-AT ?auto_36397 ?auto_36402 ) ( TRUCK-AT ?auto_36401 ?auto_36396 ) ( not ( = ?auto_36399 ?auto_36403 ) ) ( IN-TRUCK ?auto_36399 ?auto_36401 ) ( OBJ-AT ?auto_36398 ?auto_36396 ) ( not ( = ?auto_36398 ?auto_36403 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36403 ?auto_36397 ?auto_36396 )
      ( DELIVER-3PKG-VERIFY ?auto_36397 ?auto_36398 ?auto_36399 ?auto_36396 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_36414 - OBJ
      ?auto_36415 - OBJ
      ?auto_36416 - OBJ
      ?auto_36413 - LOCATION
    )
    :vars
    (
      ?auto_36419 - LOCATION
      ?auto_36417 - CITY
      ?auto_36418 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36415 ?auto_36414 ) ) ( not ( = ?auto_36416 ?auto_36414 ) ) ( not ( = ?auto_36416 ?auto_36415 ) ) ( IN-CITY ?auto_36419 ?auto_36417 ) ( IN-CITY ?auto_36413 ?auto_36417 ) ( not ( = ?auto_36413 ?auto_36419 ) ) ( OBJ-AT ?auto_36416 ?auto_36413 ) ( OBJ-AT ?auto_36414 ?auto_36419 ) ( TRUCK-AT ?auto_36418 ?auto_36413 ) ( IN-TRUCK ?auto_36415 ?auto_36418 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36416 ?auto_36414 ?auto_36413 )
      ( DELIVER-3PKG-VERIFY ?auto_36414 ?auto_36415 ?auto_36416 ?auto_36413 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_36421 - OBJ
      ?auto_36422 - OBJ
      ?auto_36423 - OBJ
      ?auto_36420 - LOCATION
    )
    :vars
    (
      ?auto_36427 - OBJ
      ?auto_36426 - LOCATION
      ?auto_36424 - CITY
      ?auto_36425 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36422 ?auto_36421 ) ) ( not ( = ?auto_36423 ?auto_36421 ) ) ( not ( = ?auto_36423 ?auto_36422 ) ) ( not ( = ?auto_36421 ?auto_36427 ) ) ( IN-CITY ?auto_36426 ?auto_36424 ) ( IN-CITY ?auto_36420 ?auto_36424 ) ( not ( = ?auto_36420 ?auto_36426 ) ) ( OBJ-AT ?auto_36427 ?auto_36420 ) ( OBJ-AT ?auto_36421 ?auto_36426 ) ( TRUCK-AT ?auto_36425 ?auto_36420 ) ( not ( = ?auto_36422 ?auto_36427 ) ) ( IN-TRUCK ?auto_36422 ?auto_36425 ) ( OBJ-AT ?auto_36423 ?auto_36420 ) ( not ( = ?auto_36423 ?auto_36427 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36427 ?auto_36421 ?auto_36420 )
      ( DELIVER-3PKG-VERIFY ?auto_36421 ?auto_36422 ?auto_36423 ?auto_36420 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_36558 - OBJ
      ?auto_36559 - OBJ
      ?auto_36560 - OBJ
      ?auto_36561 - OBJ
      ?auto_36557 - LOCATION
    )
    :vars
    (
      ?auto_36564 - LOCATION
      ?auto_36562 - CITY
      ?auto_36563 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36559 ?auto_36558 ) ) ( not ( = ?auto_36560 ?auto_36558 ) ) ( not ( = ?auto_36560 ?auto_36559 ) ) ( not ( = ?auto_36561 ?auto_36558 ) ) ( not ( = ?auto_36561 ?auto_36559 ) ) ( not ( = ?auto_36561 ?auto_36560 ) ) ( IN-CITY ?auto_36564 ?auto_36562 ) ( IN-CITY ?auto_36557 ?auto_36562 ) ( not ( = ?auto_36557 ?auto_36564 ) ) ( OBJ-AT ?auto_36558 ?auto_36557 ) ( OBJ-AT ?auto_36561 ?auto_36564 ) ( TRUCK-AT ?auto_36563 ?auto_36557 ) ( IN-TRUCK ?auto_36560 ?auto_36563 ) ( OBJ-AT ?auto_36559 ?auto_36557 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36558 ?auto_36561 ?auto_36557 )
      ( DELIVER-4PKG-VERIFY ?auto_36558 ?auto_36559 ?auto_36560 ?auto_36561 ?auto_36557 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_36584 - OBJ
      ?auto_36585 - OBJ
      ?auto_36586 - OBJ
      ?auto_36587 - OBJ
      ?auto_36583 - LOCATION
    )
    :vars
    (
      ?auto_36590 - LOCATION
      ?auto_36588 - CITY
      ?auto_36589 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36585 ?auto_36584 ) ) ( not ( = ?auto_36586 ?auto_36584 ) ) ( not ( = ?auto_36586 ?auto_36585 ) ) ( not ( = ?auto_36587 ?auto_36584 ) ) ( not ( = ?auto_36587 ?auto_36585 ) ) ( not ( = ?auto_36587 ?auto_36586 ) ) ( IN-CITY ?auto_36590 ?auto_36588 ) ( IN-CITY ?auto_36583 ?auto_36588 ) ( not ( = ?auto_36583 ?auto_36590 ) ) ( OBJ-AT ?auto_36584 ?auto_36583 ) ( OBJ-AT ?auto_36586 ?auto_36590 ) ( TRUCK-AT ?auto_36589 ?auto_36583 ) ( IN-TRUCK ?auto_36587 ?auto_36589 ) ( OBJ-AT ?auto_36585 ?auto_36583 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36584 ?auto_36586 ?auto_36583 )
      ( DELIVER-4PKG-VERIFY ?auto_36584 ?auto_36585 ?auto_36586 ?auto_36587 ?auto_36583 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_36609 - OBJ
      ?auto_36610 - OBJ
      ?auto_36611 - OBJ
      ?auto_36612 - OBJ
      ?auto_36608 - LOCATION
    )
    :vars
    (
      ?auto_36615 - LOCATION
      ?auto_36613 - CITY
      ?auto_36614 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36610 ?auto_36609 ) ) ( not ( = ?auto_36611 ?auto_36609 ) ) ( not ( = ?auto_36611 ?auto_36610 ) ) ( not ( = ?auto_36612 ?auto_36609 ) ) ( not ( = ?auto_36612 ?auto_36610 ) ) ( not ( = ?auto_36612 ?auto_36611 ) ) ( IN-CITY ?auto_36615 ?auto_36613 ) ( IN-CITY ?auto_36608 ?auto_36613 ) ( not ( = ?auto_36608 ?auto_36615 ) ) ( OBJ-AT ?auto_36609 ?auto_36608 ) ( OBJ-AT ?auto_36612 ?auto_36615 ) ( TRUCK-AT ?auto_36614 ?auto_36608 ) ( IN-TRUCK ?auto_36610 ?auto_36614 ) ( OBJ-AT ?auto_36611 ?auto_36608 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36609 ?auto_36612 ?auto_36608 )
      ( DELIVER-4PKG-VERIFY ?auto_36609 ?auto_36610 ?auto_36611 ?auto_36612 ?auto_36608 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_36633 - OBJ
      ?auto_36634 - OBJ
      ?auto_36635 - OBJ
      ?auto_36636 - OBJ
      ?auto_36632 - LOCATION
    )
    :vars
    (
      ?auto_36639 - LOCATION
      ?auto_36637 - CITY
      ?auto_36638 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36634 ?auto_36633 ) ) ( not ( = ?auto_36635 ?auto_36633 ) ) ( not ( = ?auto_36635 ?auto_36634 ) ) ( not ( = ?auto_36636 ?auto_36633 ) ) ( not ( = ?auto_36636 ?auto_36634 ) ) ( not ( = ?auto_36636 ?auto_36635 ) ) ( IN-CITY ?auto_36639 ?auto_36637 ) ( IN-CITY ?auto_36632 ?auto_36637 ) ( not ( = ?auto_36632 ?auto_36639 ) ) ( OBJ-AT ?auto_36633 ?auto_36632 ) ( OBJ-AT ?auto_36635 ?auto_36639 ) ( TRUCK-AT ?auto_36638 ?auto_36632 ) ( IN-TRUCK ?auto_36634 ?auto_36638 ) ( OBJ-AT ?auto_36636 ?auto_36632 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36633 ?auto_36635 ?auto_36632 )
      ( DELIVER-4PKG-VERIFY ?auto_36633 ?auto_36634 ?auto_36635 ?auto_36636 ?auto_36632 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_36710 - OBJ
      ?auto_36711 - OBJ
      ?auto_36712 - OBJ
      ?auto_36713 - OBJ
      ?auto_36709 - LOCATION
    )
    :vars
    (
      ?auto_36716 - LOCATION
      ?auto_36714 - CITY
      ?auto_36715 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36711 ?auto_36710 ) ) ( not ( = ?auto_36712 ?auto_36710 ) ) ( not ( = ?auto_36712 ?auto_36711 ) ) ( not ( = ?auto_36713 ?auto_36710 ) ) ( not ( = ?auto_36713 ?auto_36711 ) ) ( not ( = ?auto_36713 ?auto_36712 ) ) ( IN-CITY ?auto_36716 ?auto_36714 ) ( IN-CITY ?auto_36709 ?auto_36714 ) ( not ( = ?auto_36709 ?auto_36716 ) ) ( OBJ-AT ?auto_36710 ?auto_36709 ) ( OBJ-AT ?auto_36711 ?auto_36716 ) ( TRUCK-AT ?auto_36715 ?auto_36709 ) ( IN-TRUCK ?auto_36713 ?auto_36715 ) ( OBJ-AT ?auto_36712 ?auto_36709 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36710 ?auto_36711 ?auto_36709 )
      ( DELIVER-4PKG-VERIFY ?auto_36710 ?auto_36711 ?auto_36712 ?auto_36713 ?auto_36709 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_36735 - OBJ
      ?auto_36736 - OBJ
      ?auto_36737 - OBJ
      ?auto_36738 - OBJ
      ?auto_36734 - LOCATION
    )
    :vars
    (
      ?auto_36741 - LOCATION
      ?auto_36739 - CITY
      ?auto_36740 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36736 ?auto_36735 ) ) ( not ( = ?auto_36737 ?auto_36735 ) ) ( not ( = ?auto_36737 ?auto_36736 ) ) ( not ( = ?auto_36738 ?auto_36735 ) ) ( not ( = ?auto_36738 ?auto_36736 ) ) ( not ( = ?auto_36738 ?auto_36737 ) ) ( IN-CITY ?auto_36741 ?auto_36739 ) ( IN-CITY ?auto_36734 ?auto_36739 ) ( not ( = ?auto_36734 ?auto_36741 ) ) ( OBJ-AT ?auto_36735 ?auto_36734 ) ( OBJ-AT ?auto_36736 ?auto_36741 ) ( TRUCK-AT ?auto_36740 ?auto_36734 ) ( IN-TRUCK ?auto_36737 ?auto_36740 ) ( OBJ-AT ?auto_36738 ?auto_36734 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36735 ?auto_36736 ?auto_36734 )
      ( DELIVER-4PKG-VERIFY ?auto_36735 ?auto_36736 ?auto_36737 ?auto_36738 ?auto_36734 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_36812 - OBJ
      ?auto_36813 - OBJ
      ?auto_36814 - OBJ
      ?auto_36815 - OBJ
      ?auto_36811 - LOCATION
    )
    :vars
    (
      ?auto_36818 - LOCATION
      ?auto_36816 - CITY
      ?auto_36817 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36813 ?auto_36812 ) ) ( not ( = ?auto_36814 ?auto_36812 ) ) ( not ( = ?auto_36814 ?auto_36813 ) ) ( not ( = ?auto_36815 ?auto_36812 ) ) ( not ( = ?auto_36815 ?auto_36813 ) ) ( not ( = ?auto_36815 ?auto_36814 ) ) ( IN-CITY ?auto_36818 ?auto_36816 ) ( IN-CITY ?auto_36811 ?auto_36816 ) ( not ( = ?auto_36811 ?auto_36818 ) ) ( OBJ-AT ?auto_36813 ?auto_36811 ) ( OBJ-AT ?auto_36815 ?auto_36818 ) ( TRUCK-AT ?auto_36817 ?auto_36811 ) ( IN-TRUCK ?auto_36814 ?auto_36817 ) ( OBJ-AT ?auto_36812 ?auto_36811 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36813 ?auto_36815 ?auto_36811 )
      ( DELIVER-4PKG-VERIFY ?auto_36812 ?auto_36813 ?auto_36814 ?auto_36815 ?auto_36811 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_36838 - OBJ
      ?auto_36839 - OBJ
      ?auto_36840 - OBJ
      ?auto_36841 - OBJ
      ?auto_36837 - LOCATION
    )
    :vars
    (
      ?auto_36844 - LOCATION
      ?auto_36842 - CITY
      ?auto_36843 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36839 ?auto_36838 ) ) ( not ( = ?auto_36840 ?auto_36838 ) ) ( not ( = ?auto_36840 ?auto_36839 ) ) ( not ( = ?auto_36841 ?auto_36838 ) ) ( not ( = ?auto_36841 ?auto_36839 ) ) ( not ( = ?auto_36841 ?auto_36840 ) ) ( IN-CITY ?auto_36844 ?auto_36842 ) ( IN-CITY ?auto_36837 ?auto_36842 ) ( not ( = ?auto_36837 ?auto_36844 ) ) ( OBJ-AT ?auto_36839 ?auto_36837 ) ( OBJ-AT ?auto_36840 ?auto_36844 ) ( TRUCK-AT ?auto_36843 ?auto_36837 ) ( IN-TRUCK ?auto_36841 ?auto_36843 ) ( OBJ-AT ?auto_36838 ?auto_36837 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36839 ?auto_36840 ?auto_36837 )
      ( DELIVER-4PKG-VERIFY ?auto_36838 ?auto_36839 ?auto_36840 ?auto_36841 ?auto_36837 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_36921 - OBJ
      ?auto_36922 - OBJ
      ?auto_36923 - OBJ
      ?auto_36924 - OBJ
      ?auto_36920 - LOCATION
    )
    :vars
    (
      ?auto_36927 - LOCATION
      ?auto_36925 - CITY
      ?auto_36926 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36922 ?auto_36921 ) ) ( not ( = ?auto_36923 ?auto_36921 ) ) ( not ( = ?auto_36923 ?auto_36922 ) ) ( not ( = ?auto_36924 ?auto_36921 ) ) ( not ( = ?auto_36924 ?auto_36922 ) ) ( not ( = ?auto_36924 ?auto_36923 ) ) ( IN-CITY ?auto_36927 ?auto_36925 ) ( IN-CITY ?auto_36920 ?auto_36925 ) ( not ( = ?auto_36920 ?auto_36927 ) ) ( OBJ-AT ?auto_36923 ?auto_36920 ) ( OBJ-AT ?auto_36924 ?auto_36927 ) ( TRUCK-AT ?auto_36926 ?auto_36920 ) ( IN-TRUCK ?auto_36922 ?auto_36926 ) ( OBJ-AT ?auto_36921 ?auto_36920 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36923 ?auto_36924 ?auto_36920 )
      ( DELIVER-4PKG-VERIFY ?auto_36921 ?auto_36922 ?auto_36923 ?auto_36924 ?auto_36920 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_36947 - OBJ
      ?auto_36948 - OBJ
      ?auto_36949 - OBJ
      ?auto_36950 - OBJ
      ?auto_36946 - LOCATION
    )
    :vars
    (
      ?auto_36953 - LOCATION
      ?auto_36951 - CITY
      ?auto_36952 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_36948 ?auto_36947 ) ) ( not ( = ?auto_36949 ?auto_36947 ) ) ( not ( = ?auto_36949 ?auto_36948 ) ) ( not ( = ?auto_36950 ?auto_36947 ) ) ( not ( = ?auto_36950 ?auto_36948 ) ) ( not ( = ?auto_36950 ?auto_36949 ) ) ( IN-CITY ?auto_36953 ?auto_36951 ) ( IN-CITY ?auto_36946 ?auto_36951 ) ( not ( = ?auto_36946 ?auto_36953 ) ) ( OBJ-AT ?auto_36950 ?auto_36946 ) ( OBJ-AT ?auto_36949 ?auto_36953 ) ( TRUCK-AT ?auto_36952 ?auto_36946 ) ( IN-TRUCK ?auto_36948 ?auto_36952 ) ( OBJ-AT ?auto_36947 ?auto_36946 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36950 ?auto_36949 ?auto_36946 )
      ( DELIVER-4PKG-VERIFY ?auto_36947 ?auto_36948 ?auto_36949 ?auto_36950 ?auto_36946 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_37000 - OBJ
      ?auto_37001 - OBJ
      ?auto_37002 - OBJ
      ?auto_37003 - OBJ
      ?auto_36999 - LOCATION
    )
    :vars
    (
      ?auto_37006 - LOCATION
      ?auto_37004 - CITY
      ?auto_37005 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_37001 ?auto_37000 ) ) ( not ( = ?auto_37002 ?auto_37000 ) ) ( not ( = ?auto_37002 ?auto_37001 ) ) ( not ( = ?auto_37003 ?auto_37000 ) ) ( not ( = ?auto_37003 ?auto_37001 ) ) ( not ( = ?auto_37003 ?auto_37002 ) ) ( IN-CITY ?auto_37006 ?auto_37004 ) ( IN-CITY ?auto_36999 ?auto_37004 ) ( not ( = ?auto_36999 ?auto_37006 ) ) ( OBJ-AT ?auto_37002 ?auto_36999 ) ( OBJ-AT ?auto_37001 ?auto_37006 ) ( TRUCK-AT ?auto_37005 ?auto_36999 ) ( IN-TRUCK ?auto_37003 ?auto_37005 ) ( OBJ-AT ?auto_37000 ?auto_36999 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_37002 ?auto_37001 ?auto_36999 )
      ( DELIVER-4PKG-VERIFY ?auto_37000 ?auto_37001 ?auto_37002 ?auto_37003 ?auto_36999 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_37055 - OBJ
      ?auto_37056 - OBJ
      ?auto_37057 - OBJ
      ?auto_37058 - OBJ
      ?auto_37054 - LOCATION
    )
    :vars
    (
      ?auto_37061 - LOCATION
      ?auto_37059 - CITY
      ?auto_37060 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_37056 ?auto_37055 ) ) ( not ( = ?auto_37057 ?auto_37055 ) ) ( not ( = ?auto_37057 ?auto_37056 ) ) ( not ( = ?auto_37058 ?auto_37055 ) ) ( not ( = ?auto_37058 ?auto_37056 ) ) ( not ( = ?auto_37058 ?auto_37057 ) ) ( IN-CITY ?auto_37061 ?auto_37059 ) ( IN-CITY ?auto_37054 ?auto_37059 ) ( not ( = ?auto_37054 ?auto_37061 ) ) ( OBJ-AT ?auto_37058 ?auto_37054 ) ( OBJ-AT ?auto_37056 ?auto_37061 ) ( TRUCK-AT ?auto_37060 ?auto_37054 ) ( IN-TRUCK ?auto_37057 ?auto_37060 ) ( OBJ-AT ?auto_37055 ?auto_37054 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_37058 ?auto_37056 ?auto_37054 )
      ( DELIVER-4PKG-VERIFY ?auto_37055 ?auto_37056 ?auto_37057 ?auto_37058 ?auto_37054 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_37136 - OBJ
      ?auto_37137 - OBJ
      ?auto_37138 - OBJ
      ?auto_37139 - OBJ
      ?auto_37135 - LOCATION
    )
    :vars
    (
      ?auto_37142 - LOCATION
      ?auto_37140 - CITY
      ?auto_37141 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_37137 ?auto_37136 ) ) ( not ( = ?auto_37138 ?auto_37136 ) ) ( not ( = ?auto_37138 ?auto_37137 ) ) ( not ( = ?auto_37139 ?auto_37136 ) ) ( not ( = ?auto_37139 ?auto_37137 ) ) ( not ( = ?auto_37139 ?auto_37138 ) ) ( IN-CITY ?auto_37142 ?auto_37140 ) ( IN-CITY ?auto_37135 ?auto_37140 ) ( not ( = ?auto_37135 ?auto_37142 ) ) ( OBJ-AT ?auto_37137 ?auto_37135 ) ( OBJ-AT ?auto_37139 ?auto_37142 ) ( TRUCK-AT ?auto_37141 ?auto_37135 ) ( IN-TRUCK ?auto_37136 ?auto_37141 ) ( OBJ-AT ?auto_37138 ?auto_37135 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_37137 ?auto_37139 ?auto_37135 )
      ( DELIVER-4PKG-VERIFY ?auto_37136 ?auto_37137 ?auto_37138 ?auto_37139 ?auto_37135 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_37160 - OBJ
      ?auto_37161 - OBJ
      ?auto_37162 - OBJ
      ?auto_37163 - OBJ
      ?auto_37159 - LOCATION
    )
    :vars
    (
      ?auto_37166 - LOCATION
      ?auto_37164 - CITY
      ?auto_37165 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_37161 ?auto_37160 ) ) ( not ( = ?auto_37162 ?auto_37160 ) ) ( not ( = ?auto_37162 ?auto_37161 ) ) ( not ( = ?auto_37163 ?auto_37160 ) ) ( not ( = ?auto_37163 ?auto_37161 ) ) ( not ( = ?auto_37163 ?auto_37162 ) ) ( IN-CITY ?auto_37166 ?auto_37164 ) ( IN-CITY ?auto_37159 ?auto_37164 ) ( not ( = ?auto_37159 ?auto_37166 ) ) ( OBJ-AT ?auto_37161 ?auto_37159 ) ( OBJ-AT ?auto_37162 ?auto_37166 ) ( TRUCK-AT ?auto_37165 ?auto_37159 ) ( IN-TRUCK ?auto_37160 ?auto_37165 ) ( OBJ-AT ?auto_37163 ?auto_37159 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_37161 ?auto_37162 ?auto_37159 )
      ( DELIVER-4PKG-VERIFY ?auto_37160 ?auto_37161 ?auto_37162 ?auto_37163 ?auto_37159 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_37184 - OBJ
      ?auto_37185 - OBJ
      ?auto_37186 - OBJ
      ?auto_37187 - OBJ
      ?auto_37183 - LOCATION
    )
    :vars
    (
      ?auto_37190 - LOCATION
      ?auto_37188 - CITY
      ?auto_37189 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_37185 ?auto_37184 ) ) ( not ( = ?auto_37186 ?auto_37184 ) ) ( not ( = ?auto_37186 ?auto_37185 ) ) ( not ( = ?auto_37187 ?auto_37184 ) ) ( not ( = ?auto_37187 ?auto_37185 ) ) ( not ( = ?auto_37187 ?auto_37186 ) ) ( IN-CITY ?auto_37190 ?auto_37188 ) ( IN-CITY ?auto_37183 ?auto_37188 ) ( not ( = ?auto_37183 ?auto_37190 ) ) ( OBJ-AT ?auto_37186 ?auto_37183 ) ( OBJ-AT ?auto_37187 ?auto_37190 ) ( TRUCK-AT ?auto_37189 ?auto_37183 ) ( IN-TRUCK ?auto_37184 ?auto_37189 ) ( OBJ-AT ?auto_37185 ?auto_37183 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_37186 ?auto_37187 ?auto_37183 )
      ( DELIVER-4PKG-VERIFY ?auto_37184 ?auto_37185 ?auto_37186 ?auto_37187 ?auto_37183 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_37210 - OBJ
      ?auto_37211 - OBJ
      ?auto_37212 - OBJ
      ?auto_37213 - OBJ
      ?auto_37209 - LOCATION
    )
    :vars
    (
      ?auto_37216 - LOCATION
      ?auto_37214 - CITY
      ?auto_37215 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_37211 ?auto_37210 ) ) ( not ( = ?auto_37212 ?auto_37210 ) ) ( not ( = ?auto_37212 ?auto_37211 ) ) ( not ( = ?auto_37213 ?auto_37210 ) ) ( not ( = ?auto_37213 ?auto_37211 ) ) ( not ( = ?auto_37213 ?auto_37212 ) ) ( IN-CITY ?auto_37216 ?auto_37214 ) ( IN-CITY ?auto_37209 ?auto_37214 ) ( not ( = ?auto_37209 ?auto_37216 ) ) ( OBJ-AT ?auto_37213 ?auto_37209 ) ( OBJ-AT ?auto_37212 ?auto_37216 ) ( TRUCK-AT ?auto_37215 ?auto_37209 ) ( IN-TRUCK ?auto_37210 ?auto_37215 ) ( OBJ-AT ?auto_37211 ?auto_37209 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_37213 ?auto_37212 ?auto_37209 )
      ( DELIVER-4PKG-VERIFY ?auto_37210 ?auto_37211 ?auto_37212 ?auto_37213 ?auto_37209 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_37314 - OBJ
      ?auto_37315 - OBJ
      ?auto_37316 - OBJ
      ?auto_37317 - OBJ
      ?auto_37313 - LOCATION
    )
    :vars
    (
      ?auto_37320 - LOCATION
      ?auto_37318 - CITY
      ?auto_37319 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_37315 ?auto_37314 ) ) ( not ( = ?auto_37316 ?auto_37314 ) ) ( not ( = ?auto_37316 ?auto_37315 ) ) ( not ( = ?auto_37317 ?auto_37314 ) ) ( not ( = ?auto_37317 ?auto_37315 ) ) ( not ( = ?auto_37317 ?auto_37316 ) ) ( IN-CITY ?auto_37320 ?auto_37318 ) ( IN-CITY ?auto_37313 ?auto_37318 ) ( not ( = ?auto_37313 ?auto_37320 ) ) ( OBJ-AT ?auto_37316 ?auto_37313 ) ( OBJ-AT ?auto_37315 ?auto_37320 ) ( TRUCK-AT ?auto_37319 ?auto_37313 ) ( IN-TRUCK ?auto_37314 ?auto_37319 ) ( OBJ-AT ?auto_37317 ?auto_37313 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_37316 ?auto_37315 ?auto_37313 )
      ( DELIVER-4PKG-VERIFY ?auto_37314 ?auto_37315 ?auto_37316 ?auto_37317 ?auto_37313 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_37338 - OBJ
      ?auto_37339 - OBJ
      ?auto_37340 - OBJ
      ?auto_37341 - OBJ
      ?auto_37337 - LOCATION
    )
    :vars
    (
      ?auto_37344 - LOCATION
      ?auto_37342 - CITY
      ?auto_37343 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_37339 ?auto_37338 ) ) ( not ( = ?auto_37340 ?auto_37338 ) ) ( not ( = ?auto_37340 ?auto_37339 ) ) ( not ( = ?auto_37341 ?auto_37338 ) ) ( not ( = ?auto_37341 ?auto_37339 ) ) ( not ( = ?auto_37341 ?auto_37340 ) ) ( IN-CITY ?auto_37344 ?auto_37342 ) ( IN-CITY ?auto_37337 ?auto_37342 ) ( not ( = ?auto_37337 ?auto_37344 ) ) ( OBJ-AT ?auto_37341 ?auto_37337 ) ( OBJ-AT ?auto_37339 ?auto_37344 ) ( TRUCK-AT ?auto_37343 ?auto_37337 ) ( IN-TRUCK ?auto_37338 ?auto_37343 ) ( OBJ-AT ?auto_37340 ?auto_37337 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_37341 ?auto_37339 ?auto_37337 )
      ( DELIVER-4PKG-VERIFY ?auto_37338 ?auto_37339 ?auto_37340 ?auto_37341 ?auto_37337 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_37496 - OBJ
      ?auto_37497 - OBJ
      ?auto_37498 - OBJ
      ?auto_37499 - OBJ
      ?auto_37495 - LOCATION
    )
    :vars
    (
      ?auto_37502 - LOCATION
      ?auto_37500 - CITY
      ?auto_37501 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_37497 ?auto_37496 ) ) ( not ( = ?auto_37498 ?auto_37496 ) ) ( not ( = ?auto_37498 ?auto_37497 ) ) ( not ( = ?auto_37499 ?auto_37496 ) ) ( not ( = ?auto_37499 ?auto_37497 ) ) ( not ( = ?auto_37499 ?auto_37498 ) ) ( IN-CITY ?auto_37502 ?auto_37500 ) ( IN-CITY ?auto_37495 ?auto_37500 ) ( not ( = ?auto_37495 ?auto_37502 ) ) ( OBJ-AT ?auto_37497 ?auto_37495 ) ( OBJ-AT ?auto_37496 ?auto_37502 ) ( TRUCK-AT ?auto_37501 ?auto_37495 ) ( IN-TRUCK ?auto_37499 ?auto_37501 ) ( OBJ-AT ?auto_37498 ?auto_37495 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_37497 ?auto_37496 ?auto_37495 )
      ( DELIVER-4PKG-VERIFY ?auto_37496 ?auto_37497 ?auto_37498 ?auto_37499 ?auto_37495 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_37521 - OBJ
      ?auto_37522 - OBJ
      ?auto_37523 - OBJ
      ?auto_37524 - OBJ
      ?auto_37520 - LOCATION
    )
    :vars
    (
      ?auto_37527 - LOCATION
      ?auto_37525 - CITY
      ?auto_37526 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_37522 ?auto_37521 ) ) ( not ( = ?auto_37523 ?auto_37521 ) ) ( not ( = ?auto_37523 ?auto_37522 ) ) ( not ( = ?auto_37524 ?auto_37521 ) ) ( not ( = ?auto_37524 ?auto_37522 ) ) ( not ( = ?auto_37524 ?auto_37523 ) ) ( IN-CITY ?auto_37527 ?auto_37525 ) ( IN-CITY ?auto_37520 ?auto_37525 ) ( not ( = ?auto_37520 ?auto_37527 ) ) ( OBJ-AT ?auto_37522 ?auto_37520 ) ( OBJ-AT ?auto_37521 ?auto_37527 ) ( TRUCK-AT ?auto_37526 ?auto_37520 ) ( IN-TRUCK ?auto_37523 ?auto_37526 ) ( OBJ-AT ?auto_37524 ?auto_37520 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_37522 ?auto_37521 ?auto_37520 )
      ( DELIVER-4PKG-VERIFY ?auto_37521 ?auto_37522 ?auto_37523 ?auto_37524 ?auto_37520 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_37598 - OBJ
      ?auto_37599 - OBJ
      ?auto_37600 - OBJ
      ?auto_37601 - OBJ
      ?auto_37597 - LOCATION
    )
    :vars
    (
      ?auto_37604 - LOCATION
      ?auto_37602 - CITY
      ?auto_37603 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_37599 ?auto_37598 ) ) ( not ( = ?auto_37600 ?auto_37598 ) ) ( not ( = ?auto_37600 ?auto_37599 ) ) ( not ( = ?auto_37601 ?auto_37598 ) ) ( not ( = ?auto_37601 ?auto_37599 ) ) ( not ( = ?auto_37601 ?auto_37600 ) ) ( IN-CITY ?auto_37604 ?auto_37602 ) ( IN-CITY ?auto_37597 ?auto_37602 ) ( not ( = ?auto_37597 ?auto_37604 ) ) ( OBJ-AT ?auto_37600 ?auto_37597 ) ( OBJ-AT ?auto_37598 ?auto_37604 ) ( TRUCK-AT ?auto_37603 ?auto_37597 ) ( IN-TRUCK ?auto_37601 ?auto_37603 ) ( OBJ-AT ?auto_37599 ?auto_37597 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_37600 ?auto_37598 ?auto_37597 )
      ( DELIVER-4PKG-VERIFY ?auto_37598 ?auto_37599 ?auto_37600 ?auto_37601 ?auto_37597 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_37653 - OBJ
      ?auto_37654 - OBJ
      ?auto_37655 - OBJ
      ?auto_37656 - OBJ
      ?auto_37652 - LOCATION
    )
    :vars
    (
      ?auto_37659 - LOCATION
      ?auto_37657 - CITY
      ?auto_37658 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_37654 ?auto_37653 ) ) ( not ( = ?auto_37655 ?auto_37653 ) ) ( not ( = ?auto_37655 ?auto_37654 ) ) ( not ( = ?auto_37656 ?auto_37653 ) ) ( not ( = ?auto_37656 ?auto_37654 ) ) ( not ( = ?auto_37656 ?auto_37655 ) ) ( IN-CITY ?auto_37659 ?auto_37657 ) ( IN-CITY ?auto_37652 ?auto_37657 ) ( not ( = ?auto_37652 ?auto_37659 ) ) ( OBJ-AT ?auto_37656 ?auto_37652 ) ( OBJ-AT ?auto_37653 ?auto_37659 ) ( TRUCK-AT ?auto_37658 ?auto_37652 ) ( IN-TRUCK ?auto_37655 ?auto_37658 ) ( OBJ-AT ?auto_37654 ?auto_37652 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_37656 ?auto_37653 ?auto_37652 )
      ( DELIVER-4PKG-VERIFY ?auto_37653 ?auto_37654 ?auto_37655 ?auto_37656 ?auto_37652 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_37734 - OBJ
      ?auto_37735 - OBJ
      ?auto_37736 - OBJ
      ?auto_37737 - OBJ
      ?auto_37733 - LOCATION
    )
    :vars
    (
      ?auto_37740 - LOCATION
      ?auto_37738 - CITY
      ?auto_37739 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_37735 ?auto_37734 ) ) ( not ( = ?auto_37736 ?auto_37734 ) ) ( not ( = ?auto_37736 ?auto_37735 ) ) ( not ( = ?auto_37737 ?auto_37734 ) ) ( not ( = ?auto_37737 ?auto_37735 ) ) ( not ( = ?auto_37737 ?auto_37736 ) ) ( IN-CITY ?auto_37740 ?auto_37738 ) ( IN-CITY ?auto_37733 ?auto_37738 ) ( not ( = ?auto_37733 ?auto_37740 ) ) ( OBJ-AT ?auto_37736 ?auto_37733 ) ( OBJ-AT ?auto_37734 ?auto_37740 ) ( TRUCK-AT ?auto_37739 ?auto_37733 ) ( IN-TRUCK ?auto_37735 ?auto_37739 ) ( OBJ-AT ?auto_37737 ?auto_37733 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_37736 ?auto_37734 ?auto_37733 )
      ( DELIVER-4PKG-VERIFY ?auto_37734 ?auto_37735 ?auto_37736 ?auto_37737 ?auto_37733 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_37758 - OBJ
      ?auto_37759 - OBJ
      ?auto_37760 - OBJ
      ?auto_37761 - OBJ
      ?auto_37757 - LOCATION
    )
    :vars
    (
      ?auto_37764 - LOCATION
      ?auto_37762 - CITY
      ?auto_37763 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_37759 ?auto_37758 ) ) ( not ( = ?auto_37760 ?auto_37758 ) ) ( not ( = ?auto_37760 ?auto_37759 ) ) ( not ( = ?auto_37761 ?auto_37758 ) ) ( not ( = ?auto_37761 ?auto_37759 ) ) ( not ( = ?auto_37761 ?auto_37760 ) ) ( IN-CITY ?auto_37764 ?auto_37762 ) ( IN-CITY ?auto_37757 ?auto_37762 ) ( not ( = ?auto_37757 ?auto_37764 ) ) ( OBJ-AT ?auto_37761 ?auto_37757 ) ( OBJ-AT ?auto_37758 ?auto_37764 ) ( TRUCK-AT ?auto_37763 ?auto_37757 ) ( IN-TRUCK ?auto_37759 ?auto_37763 ) ( OBJ-AT ?auto_37760 ?auto_37757 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_37761 ?auto_37758 ?auto_37757 )
      ( DELIVER-4PKG-VERIFY ?auto_37758 ?auto_37759 ?auto_37760 ?auto_37761 ?auto_37757 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_38009 - OBJ
      ?auto_38008 - LOCATION
    )
    :vars
    (
      ?auto_38014 - OBJ
      ?auto_38013 - LOCATION
      ?auto_38010 - CITY
      ?auto_38011 - OBJ
      ?auto_38012 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38009 ?auto_38014 ) ) ( IN-CITY ?auto_38013 ?auto_38010 ) ( IN-CITY ?auto_38008 ?auto_38010 ) ( not ( = ?auto_38008 ?auto_38013 ) ) ( OBJ-AT ?auto_38014 ?auto_38008 ) ( OBJ-AT ?auto_38009 ?auto_38013 ) ( not ( = ?auto_38011 ?auto_38014 ) ) ( IN-TRUCK ?auto_38011 ?auto_38012 ) ( not ( = ?auto_38009 ?auto_38011 ) ) ( TRUCK-AT ?auto_38012 ?auto_38013 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_38012 ?auto_38013 ?auto_38008 ?auto_38010 )
      ( DELIVER-2PKG ?auto_38014 ?auto_38009 ?auto_38008 )
      ( DELIVER-1PKG-VERIFY ?auto_38009 ?auto_38008 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_38016 - OBJ
      ?auto_38017 - OBJ
      ?auto_38015 - LOCATION
    )
    :vars
    (
      ?auto_38020 - LOCATION
      ?auto_38018 - CITY
      ?auto_38021 - OBJ
      ?auto_38019 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38017 ?auto_38016 ) ) ( IN-CITY ?auto_38020 ?auto_38018 ) ( IN-CITY ?auto_38015 ?auto_38018 ) ( not ( = ?auto_38015 ?auto_38020 ) ) ( OBJ-AT ?auto_38016 ?auto_38015 ) ( OBJ-AT ?auto_38017 ?auto_38020 ) ( not ( = ?auto_38021 ?auto_38016 ) ) ( IN-TRUCK ?auto_38021 ?auto_38019 ) ( not ( = ?auto_38017 ?auto_38021 ) ) ( TRUCK-AT ?auto_38019 ?auto_38020 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_38017 ?auto_38015 )
      ( DELIVER-2PKG-VERIFY ?auto_38016 ?auto_38017 ?auto_38015 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_38023 - OBJ
      ?auto_38024 - OBJ
      ?auto_38022 - LOCATION
    )
    :vars
    (
      ?auto_38029 - OBJ
      ?auto_38025 - LOCATION
      ?auto_38028 - CITY
      ?auto_38026 - OBJ
      ?auto_38027 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38024 ?auto_38023 ) ) ( not ( = ?auto_38024 ?auto_38029 ) ) ( IN-CITY ?auto_38025 ?auto_38028 ) ( IN-CITY ?auto_38022 ?auto_38028 ) ( not ( = ?auto_38022 ?auto_38025 ) ) ( OBJ-AT ?auto_38029 ?auto_38022 ) ( OBJ-AT ?auto_38024 ?auto_38025 ) ( not ( = ?auto_38026 ?auto_38029 ) ) ( IN-TRUCK ?auto_38026 ?auto_38027 ) ( not ( = ?auto_38024 ?auto_38026 ) ) ( TRUCK-AT ?auto_38027 ?auto_38025 ) ( OBJ-AT ?auto_38023 ?auto_38022 ) ( not ( = ?auto_38023 ?auto_38029 ) ) ( not ( = ?auto_38023 ?auto_38026 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38029 ?auto_38024 ?auto_38022 )
      ( DELIVER-2PKG-VERIFY ?auto_38023 ?auto_38024 ?auto_38022 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_38031 - OBJ
      ?auto_38032 - OBJ
      ?auto_38030 - LOCATION
    )
    :vars
    (
      ?auto_38036 - OBJ
      ?auto_38033 - LOCATION
      ?auto_38035 - CITY
      ?auto_38034 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38032 ?auto_38031 ) ) ( not ( = ?auto_38032 ?auto_38036 ) ) ( IN-CITY ?auto_38033 ?auto_38035 ) ( IN-CITY ?auto_38030 ?auto_38035 ) ( not ( = ?auto_38030 ?auto_38033 ) ) ( OBJ-AT ?auto_38036 ?auto_38030 ) ( OBJ-AT ?auto_38032 ?auto_38033 ) ( not ( = ?auto_38031 ?auto_38036 ) ) ( IN-TRUCK ?auto_38031 ?auto_38034 ) ( TRUCK-AT ?auto_38034 ?auto_38033 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38036 ?auto_38032 ?auto_38030 )
      ( DELIVER-2PKG-VERIFY ?auto_38031 ?auto_38032 ?auto_38030 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_38038 - OBJ
      ?auto_38039 - OBJ
      ?auto_38037 - LOCATION
    )
    :vars
    (
      ?auto_38040 - LOCATION
      ?auto_38043 - CITY
      ?auto_38041 - OBJ
      ?auto_38042 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38039 ?auto_38038 ) ) ( IN-CITY ?auto_38040 ?auto_38043 ) ( IN-CITY ?auto_38037 ?auto_38043 ) ( not ( = ?auto_38037 ?auto_38040 ) ) ( OBJ-AT ?auto_38039 ?auto_38037 ) ( OBJ-AT ?auto_38038 ?auto_38040 ) ( not ( = ?auto_38041 ?auto_38039 ) ) ( IN-TRUCK ?auto_38041 ?auto_38042 ) ( not ( = ?auto_38038 ?auto_38041 ) ) ( TRUCK-AT ?auto_38042 ?auto_38040 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38039 ?auto_38038 ?auto_38037 )
      ( DELIVER-2PKG-VERIFY ?auto_38038 ?auto_38039 ?auto_38037 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_38045 - OBJ
      ?auto_38046 - OBJ
      ?auto_38044 - LOCATION
    )
    :vars
    (
      ?auto_38051 - OBJ
      ?auto_38047 - LOCATION
      ?auto_38050 - CITY
      ?auto_38048 - OBJ
      ?auto_38049 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38046 ?auto_38045 ) ) ( not ( = ?auto_38045 ?auto_38051 ) ) ( IN-CITY ?auto_38047 ?auto_38050 ) ( IN-CITY ?auto_38044 ?auto_38050 ) ( not ( = ?auto_38044 ?auto_38047 ) ) ( OBJ-AT ?auto_38051 ?auto_38044 ) ( OBJ-AT ?auto_38045 ?auto_38047 ) ( not ( = ?auto_38048 ?auto_38051 ) ) ( IN-TRUCK ?auto_38048 ?auto_38049 ) ( not ( = ?auto_38045 ?auto_38048 ) ) ( TRUCK-AT ?auto_38049 ?auto_38047 ) ( OBJ-AT ?auto_38046 ?auto_38044 ) ( not ( = ?auto_38046 ?auto_38051 ) ) ( not ( = ?auto_38046 ?auto_38048 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38051 ?auto_38045 ?auto_38044 )
      ( DELIVER-2PKG-VERIFY ?auto_38045 ?auto_38046 ?auto_38044 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_38053 - OBJ
      ?auto_38054 - OBJ
      ?auto_38052 - LOCATION
    )
    :vars
    (
      ?auto_38058 - OBJ
      ?auto_38055 - LOCATION
      ?auto_38057 - CITY
      ?auto_38056 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38054 ?auto_38053 ) ) ( not ( = ?auto_38053 ?auto_38058 ) ) ( IN-CITY ?auto_38055 ?auto_38057 ) ( IN-CITY ?auto_38052 ?auto_38057 ) ( not ( = ?auto_38052 ?auto_38055 ) ) ( OBJ-AT ?auto_38058 ?auto_38052 ) ( OBJ-AT ?auto_38053 ?auto_38055 ) ( not ( = ?auto_38054 ?auto_38058 ) ) ( IN-TRUCK ?auto_38054 ?auto_38056 ) ( TRUCK-AT ?auto_38056 ?auto_38055 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38058 ?auto_38053 ?auto_38052 )
      ( DELIVER-2PKG-VERIFY ?auto_38053 ?auto_38054 ?auto_38052 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_38076 - OBJ
      ?auto_38077 - OBJ
      ?auto_38078 - OBJ
      ?auto_38075 - LOCATION
    )
    :vars
    (
      ?auto_38079 - LOCATION
      ?auto_38082 - CITY
      ?auto_38080 - OBJ
      ?auto_38081 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38077 ?auto_38076 ) ) ( not ( = ?auto_38078 ?auto_38076 ) ) ( not ( = ?auto_38078 ?auto_38077 ) ) ( IN-CITY ?auto_38079 ?auto_38082 ) ( IN-CITY ?auto_38075 ?auto_38082 ) ( not ( = ?auto_38075 ?auto_38079 ) ) ( OBJ-AT ?auto_38076 ?auto_38075 ) ( OBJ-AT ?auto_38078 ?auto_38079 ) ( not ( = ?auto_38080 ?auto_38076 ) ) ( IN-TRUCK ?auto_38080 ?auto_38081 ) ( not ( = ?auto_38078 ?auto_38080 ) ) ( TRUCK-AT ?auto_38081 ?auto_38079 ) ( OBJ-AT ?auto_38077 ?auto_38075 ) ( not ( = ?auto_38077 ?auto_38080 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38076 ?auto_38078 ?auto_38075 )
      ( DELIVER-3PKG-VERIFY ?auto_38076 ?auto_38077 ?auto_38078 ?auto_38075 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_38084 - OBJ
      ?auto_38085 - OBJ
      ?auto_38086 - OBJ
      ?auto_38083 - LOCATION
    )
    :vars
    (
      ?auto_38087 - LOCATION
      ?auto_38089 - CITY
      ?auto_38088 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38085 ?auto_38084 ) ) ( not ( = ?auto_38086 ?auto_38084 ) ) ( not ( = ?auto_38086 ?auto_38085 ) ) ( IN-CITY ?auto_38087 ?auto_38089 ) ( IN-CITY ?auto_38083 ?auto_38089 ) ( not ( = ?auto_38083 ?auto_38087 ) ) ( OBJ-AT ?auto_38084 ?auto_38083 ) ( OBJ-AT ?auto_38086 ?auto_38087 ) ( IN-TRUCK ?auto_38085 ?auto_38088 ) ( TRUCK-AT ?auto_38088 ?auto_38087 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38084 ?auto_38086 ?auto_38083 )
      ( DELIVER-3PKG-VERIFY ?auto_38084 ?auto_38085 ?auto_38086 ?auto_38083 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_38099 - OBJ
      ?auto_38100 - OBJ
      ?auto_38101 - OBJ
      ?auto_38098 - LOCATION
    )
    :vars
    (
      ?auto_38102 - LOCATION
      ?auto_38105 - CITY
      ?auto_38103 - OBJ
      ?auto_38104 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38100 ?auto_38099 ) ) ( not ( = ?auto_38101 ?auto_38099 ) ) ( not ( = ?auto_38101 ?auto_38100 ) ) ( IN-CITY ?auto_38102 ?auto_38105 ) ( IN-CITY ?auto_38098 ?auto_38105 ) ( not ( = ?auto_38098 ?auto_38102 ) ) ( OBJ-AT ?auto_38099 ?auto_38098 ) ( OBJ-AT ?auto_38100 ?auto_38102 ) ( not ( = ?auto_38103 ?auto_38099 ) ) ( IN-TRUCK ?auto_38103 ?auto_38104 ) ( not ( = ?auto_38100 ?auto_38103 ) ) ( TRUCK-AT ?auto_38104 ?auto_38102 ) ( OBJ-AT ?auto_38101 ?auto_38098 ) ( not ( = ?auto_38101 ?auto_38103 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38099 ?auto_38100 ?auto_38098 )
      ( DELIVER-3PKG-VERIFY ?auto_38099 ?auto_38100 ?auto_38101 ?auto_38098 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_38107 - OBJ
      ?auto_38108 - OBJ
      ?auto_38109 - OBJ
      ?auto_38106 - LOCATION
    )
    :vars
    (
      ?auto_38110 - LOCATION
      ?auto_38112 - CITY
      ?auto_38111 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38108 ?auto_38107 ) ) ( not ( = ?auto_38109 ?auto_38107 ) ) ( not ( = ?auto_38109 ?auto_38108 ) ) ( IN-CITY ?auto_38110 ?auto_38112 ) ( IN-CITY ?auto_38106 ?auto_38112 ) ( not ( = ?auto_38106 ?auto_38110 ) ) ( OBJ-AT ?auto_38107 ?auto_38106 ) ( OBJ-AT ?auto_38108 ?auto_38110 ) ( IN-TRUCK ?auto_38109 ?auto_38111 ) ( TRUCK-AT ?auto_38111 ?auto_38110 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38107 ?auto_38108 ?auto_38106 )
      ( DELIVER-3PKG-VERIFY ?auto_38107 ?auto_38108 ?auto_38109 ?auto_38106 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_38122 - OBJ
      ?auto_38123 - OBJ
      ?auto_38124 - OBJ
      ?auto_38121 - LOCATION
    )
    :vars
    (
      ?auto_38125 - LOCATION
      ?auto_38128 - CITY
      ?auto_38126 - OBJ
      ?auto_38127 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38123 ?auto_38122 ) ) ( not ( = ?auto_38124 ?auto_38122 ) ) ( not ( = ?auto_38124 ?auto_38123 ) ) ( IN-CITY ?auto_38125 ?auto_38128 ) ( IN-CITY ?auto_38121 ?auto_38128 ) ( not ( = ?auto_38121 ?auto_38125 ) ) ( OBJ-AT ?auto_38123 ?auto_38121 ) ( OBJ-AT ?auto_38124 ?auto_38125 ) ( not ( = ?auto_38126 ?auto_38123 ) ) ( IN-TRUCK ?auto_38126 ?auto_38127 ) ( not ( = ?auto_38124 ?auto_38126 ) ) ( TRUCK-AT ?auto_38127 ?auto_38125 ) ( OBJ-AT ?auto_38122 ?auto_38121 ) ( not ( = ?auto_38122 ?auto_38126 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38123 ?auto_38124 ?auto_38121 )
      ( DELIVER-3PKG-VERIFY ?auto_38122 ?auto_38123 ?auto_38124 ?auto_38121 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_38139 - OBJ
      ?auto_38140 - OBJ
      ?auto_38141 - OBJ
      ?auto_38138 - LOCATION
    )
    :vars
    (
      ?auto_38145 - OBJ
      ?auto_38142 - LOCATION
      ?auto_38144 - CITY
      ?auto_38143 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38140 ?auto_38139 ) ) ( not ( = ?auto_38141 ?auto_38139 ) ) ( not ( = ?auto_38141 ?auto_38140 ) ) ( not ( = ?auto_38141 ?auto_38145 ) ) ( IN-CITY ?auto_38142 ?auto_38144 ) ( IN-CITY ?auto_38138 ?auto_38144 ) ( not ( = ?auto_38138 ?auto_38142 ) ) ( OBJ-AT ?auto_38145 ?auto_38138 ) ( OBJ-AT ?auto_38141 ?auto_38142 ) ( not ( = ?auto_38140 ?auto_38145 ) ) ( IN-TRUCK ?auto_38140 ?auto_38143 ) ( TRUCK-AT ?auto_38143 ?auto_38142 ) ( OBJ-AT ?auto_38139 ?auto_38138 ) ( not ( = ?auto_38139 ?auto_38145 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38145 ?auto_38141 ?auto_38138 )
      ( DELIVER-3PKG-VERIFY ?auto_38139 ?auto_38140 ?auto_38141 ?auto_38138 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_38147 - OBJ
      ?auto_38148 - OBJ
      ?auto_38149 - OBJ
      ?auto_38146 - LOCATION
    )
    :vars
    (
      ?auto_38150 - LOCATION
      ?auto_38153 - CITY
      ?auto_38151 - OBJ
      ?auto_38152 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38148 ?auto_38147 ) ) ( not ( = ?auto_38149 ?auto_38147 ) ) ( not ( = ?auto_38149 ?auto_38148 ) ) ( IN-CITY ?auto_38150 ?auto_38153 ) ( IN-CITY ?auto_38146 ?auto_38153 ) ( not ( = ?auto_38146 ?auto_38150 ) ) ( OBJ-AT ?auto_38149 ?auto_38146 ) ( OBJ-AT ?auto_38148 ?auto_38150 ) ( not ( = ?auto_38151 ?auto_38149 ) ) ( IN-TRUCK ?auto_38151 ?auto_38152 ) ( not ( = ?auto_38148 ?auto_38151 ) ) ( TRUCK-AT ?auto_38152 ?auto_38150 ) ( OBJ-AT ?auto_38147 ?auto_38146 ) ( not ( = ?auto_38147 ?auto_38151 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38149 ?auto_38148 ?auto_38146 )
      ( DELIVER-3PKG-VERIFY ?auto_38147 ?auto_38148 ?auto_38149 ?auto_38146 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_38164 - OBJ
      ?auto_38165 - OBJ
      ?auto_38166 - OBJ
      ?auto_38163 - LOCATION
    )
    :vars
    (
      ?auto_38170 - OBJ
      ?auto_38167 - LOCATION
      ?auto_38169 - CITY
      ?auto_38168 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38165 ?auto_38164 ) ) ( not ( = ?auto_38166 ?auto_38164 ) ) ( not ( = ?auto_38166 ?auto_38165 ) ) ( not ( = ?auto_38165 ?auto_38170 ) ) ( IN-CITY ?auto_38167 ?auto_38169 ) ( IN-CITY ?auto_38163 ?auto_38169 ) ( not ( = ?auto_38163 ?auto_38167 ) ) ( OBJ-AT ?auto_38170 ?auto_38163 ) ( OBJ-AT ?auto_38165 ?auto_38167 ) ( not ( = ?auto_38166 ?auto_38170 ) ) ( IN-TRUCK ?auto_38166 ?auto_38168 ) ( TRUCK-AT ?auto_38168 ?auto_38167 ) ( OBJ-AT ?auto_38164 ?auto_38163 ) ( not ( = ?auto_38164 ?auto_38170 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38170 ?auto_38165 ?auto_38163 )
      ( DELIVER-3PKG-VERIFY ?auto_38164 ?auto_38165 ?auto_38166 ?auto_38163 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_38181 - OBJ
      ?auto_38182 - OBJ
      ?auto_38183 - OBJ
      ?auto_38180 - LOCATION
    )
    :vars
    (
      ?auto_38184 - LOCATION
      ?auto_38186 - CITY
      ?auto_38185 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38182 ?auto_38181 ) ) ( not ( = ?auto_38183 ?auto_38181 ) ) ( not ( = ?auto_38183 ?auto_38182 ) ) ( IN-CITY ?auto_38184 ?auto_38186 ) ( IN-CITY ?auto_38180 ?auto_38186 ) ( not ( = ?auto_38180 ?auto_38184 ) ) ( OBJ-AT ?auto_38182 ?auto_38180 ) ( OBJ-AT ?auto_38183 ?auto_38184 ) ( IN-TRUCK ?auto_38181 ?auto_38185 ) ( TRUCK-AT ?auto_38185 ?auto_38184 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38182 ?auto_38183 ?auto_38180 )
      ( DELIVER-3PKG-VERIFY ?auto_38181 ?auto_38182 ?auto_38183 ?auto_38180 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_38188 - OBJ
      ?auto_38189 - OBJ
      ?auto_38190 - OBJ
      ?auto_38187 - LOCATION
    )
    :vars
    (
      ?auto_38194 - OBJ
      ?auto_38191 - LOCATION
      ?auto_38193 - CITY
      ?auto_38192 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38189 ?auto_38188 ) ) ( not ( = ?auto_38190 ?auto_38188 ) ) ( not ( = ?auto_38190 ?auto_38189 ) ) ( not ( = ?auto_38190 ?auto_38194 ) ) ( IN-CITY ?auto_38191 ?auto_38193 ) ( IN-CITY ?auto_38187 ?auto_38193 ) ( not ( = ?auto_38187 ?auto_38191 ) ) ( OBJ-AT ?auto_38194 ?auto_38187 ) ( OBJ-AT ?auto_38190 ?auto_38191 ) ( not ( = ?auto_38188 ?auto_38194 ) ) ( IN-TRUCK ?auto_38188 ?auto_38192 ) ( TRUCK-AT ?auto_38192 ?auto_38191 ) ( OBJ-AT ?auto_38189 ?auto_38187 ) ( not ( = ?auto_38189 ?auto_38194 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38194 ?auto_38190 ?auto_38187 )
      ( DELIVER-3PKG-VERIFY ?auto_38188 ?auto_38189 ?auto_38190 ?auto_38187 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_38204 - OBJ
      ?auto_38205 - OBJ
      ?auto_38206 - OBJ
      ?auto_38203 - LOCATION
    )
    :vars
    (
      ?auto_38207 - LOCATION
      ?auto_38209 - CITY
      ?auto_38208 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38205 ?auto_38204 ) ) ( not ( = ?auto_38206 ?auto_38204 ) ) ( not ( = ?auto_38206 ?auto_38205 ) ) ( IN-CITY ?auto_38207 ?auto_38209 ) ( IN-CITY ?auto_38203 ?auto_38209 ) ( not ( = ?auto_38203 ?auto_38207 ) ) ( OBJ-AT ?auto_38206 ?auto_38203 ) ( OBJ-AT ?auto_38205 ?auto_38207 ) ( IN-TRUCK ?auto_38204 ?auto_38208 ) ( TRUCK-AT ?auto_38208 ?auto_38207 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38206 ?auto_38205 ?auto_38203 )
      ( DELIVER-3PKG-VERIFY ?auto_38204 ?auto_38205 ?auto_38206 ?auto_38203 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_38211 - OBJ
      ?auto_38212 - OBJ
      ?auto_38213 - OBJ
      ?auto_38210 - LOCATION
    )
    :vars
    (
      ?auto_38217 - OBJ
      ?auto_38214 - LOCATION
      ?auto_38216 - CITY
      ?auto_38215 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38212 ?auto_38211 ) ) ( not ( = ?auto_38213 ?auto_38211 ) ) ( not ( = ?auto_38213 ?auto_38212 ) ) ( not ( = ?auto_38212 ?auto_38217 ) ) ( IN-CITY ?auto_38214 ?auto_38216 ) ( IN-CITY ?auto_38210 ?auto_38216 ) ( not ( = ?auto_38210 ?auto_38214 ) ) ( OBJ-AT ?auto_38217 ?auto_38210 ) ( OBJ-AT ?auto_38212 ?auto_38214 ) ( not ( = ?auto_38211 ?auto_38217 ) ) ( IN-TRUCK ?auto_38211 ?auto_38215 ) ( TRUCK-AT ?auto_38215 ?auto_38214 ) ( OBJ-AT ?auto_38213 ?auto_38210 ) ( not ( = ?auto_38213 ?auto_38217 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38217 ?auto_38212 ?auto_38210 )
      ( DELIVER-3PKG-VERIFY ?auto_38211 ?auto_38212 ?auto_38213 ?auto_38210 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_38243 - OBJ
      ?auto_38244 - OBJ
      ?auto_38245 - OBJ
      ?auto_38242 - LOCATION
    )
    :vars
    (
      ?auto_38246 - LOCATION
      ?auto_38249 - CITY
      ?auto_38247 - OBJ
      ?auto_38248 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38244 ?auto_38243 ) ) ( not ( = ?auto_38245 ?auto_38243 ) ) ( not ( = ?auto_38245 ?auto_38244 ) ) ( IN-CITY ?auto_38246 ?auto_38249 ) ( IN-CITY ?auto_38242 ?auto_38249 ) ( not ( = ?auto_38242 ?auto_38246 ) ) ( OBJ-AT ?auto_38244 ?auto_38242 ) ( OBJ-AT ?auto_38243 ?auto_38246 ) ( not ( = ?auto_38247 ?auto_38244 ) ) ( IN-TRUCK ?auto_38247 ?auto_38248 ) ( not ( = ?auto_38243 ?auto_38247 ) ) ( TRUCK-AT ?auto_38248 ?auto_38246 ) ( OBJ-AT ?auto_38245 ?auto_38242 ) ( not ( = ?auto_38245 ?auto_38247 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38244 ?auto_38243 ?auto_38242 )
      ( DELIVER-3PKG-VERIFY ?auto_38243 ?auto_38244 ?auto_38245 ?auto_38242 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_38251 - OBJ
      ?auto_38252 - OBJ
      ?auto_38253 - OBJ
      ?auto_38250 - LOCATION
    )
    :vars
    (
      ?auto_38254 - LOCATION
      ?auto_38256 - CITY
      ?auto_38255 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38252 ?auto_38251 ) ) ( not ( = ?auto_38253 ?auto_38251 ) ) ( not ( = ?auto_38253 ?auto_38252 ) ) ( IN-CITY ?auto_38254 ?auto_38256 ) ( IN-CITY ?auto_38250 ?auto_38256 ) ( not ( = ?auto_38250 ?auto_38254 ) ) ( OBJ-AT ?auto_38252 ?auto_38250 ) ( OBJ-AT ?auto_38251 ?auto_38254 ) ( IN-TRUCK ?auto_38253 ?auto_38255 ) ( TRUCK-AT ?auto_38255 ?auto_38254 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38252 ?auto_38251 ?auto_38250 )
      ( DELIVER-3PKG-VERIFY ?auto_38251 ?auto_38252 ?auto_38253 ?auto_38250 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_38266 - OBJ
      ?auto_38267 - OBJ
      ?auto_38268 - OBJ
      ?auto_38265 - LOCATION
    )
    :vars
    (
      ?auto_38269 - LOCATION
      ?auto_38272 - CITY
      ?auto_38270 - OBJ
      ?auto_38271 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38267 ?auto_38266 ) ) ( not ( = ?auto_38268 ?auto_38266 ) ) ( not ( = ?auto_38268 ?auto_38267 ) ) ( IN-CITY ?auto_38269 ?auto_38272 ) ( IN-CITY ?auto_38265 ?auto_38272 ) ( not ( = ?auto_38265 ?auto_38269 ) ) ( OBJ-AT ?auto_38268 ?auto_38265 ) ( OBJ-AT ?auto_38266 ?auto_38269 ) ( not ( = ?auto_38270 ?auto_38268 ) ) ( IN-TRUCK ?auto_38270 ?auto_38271 ) ( not ( = ?auto_38266 ?auto_38270 ) ) ( TRUCK-AT ?auto_38271 ?auto_38269 ) ( OBJ-AT ?auto_38267 ?auto_38265 ) ( not ( = ?auto_38267 ?auto_38270 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38268 ?auto_38266 ?auto_38265 )
      ( DELIVER-3PKG-VERIFY ?auto_38266 ?auto_38267 ?auto_38268 ?auto_38265 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_38283 - OBJ
      ?auto_38284 - OBJ
      ?auto_38285 - OBJ
      ?auto_38282 - LOCATION
    )
    :vars
    (
      ?auto_38289 - OBJ
      ?auto_38286 - LOCATION
      ?auto_38288 - CITY
      ?auto_38287 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38284 ?auto_38283 ) ) ( not ( = ?auto_38285 ?auto_38283 ) ) ( not ( = ?auto_38285 ?auto_38284 ) ) ( not ( = ?auto_38283 ?auto_38289 ) ) ( IN-CITY ?auto_38286 ?auto_38288 ) ( IN-CITY ?auto_38282 ?auto_38288 ) ( not ( = ?auto_38282 ?auto_38286 ) ) ( OBJ-AT ?auto_38289 ?auto_38282 ) ( OBJ-AT ?auto_38283 ?auto_38286 ) ( not ( = ?auto_38285 ?auto_38289 ) ) ( IN-TRUCK ?auto_38285 ?auto_38287 ) ( TRUCK-AT ?auto_38287 ?auto_38286 ) ( OBJ-AT ?auto_38284 ?auto_38282 ) ( not ( = ?auto_38284 ?auto_38289 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38289 ?auto_38283 ?auto_38282 )
      ( DELIVER-3PKG-VERIFY ?auto_38283 ?auto_38284 ?auto_38285 ?auto_38282 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_38300 - OBJ
      ?auto_38301 - OBJ
      ?auto_38302 - OBJ
      ?auto_38299 - LOCATION
    )
    :vars
    (
      ?auto_38303 - LOCATION
      ?auto_38305 - CITY
      ?auto_38304 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38301 ?auto_38300 ) ) ( not ( = ?auto_38302 ?auto_38300 ) ) ( not ( = ?auto_38302 ?auto_38301 ) ) ( IN-CITY ?auto_38303 ?auto_38305 ) ( IN-CITY ?auto_38299 ?auto_38305 ) ( not ( = ?auto_38299 ?auto_38303 ) ) ( OBJ-AT ?auto_38302 ?auto_38299 ) ( OBJ-AT ?auto_38300 ?auto_38303 ) ( IN-TRUCK ?auto_38301 ?auto_38304 ) ( TRUCK-AT ?auto_38304 ?auto_38303 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38302 ?auto_38300 ?auto_38299 )
      ( DELIVER-3PKG-VERIFY ?auto_38300 ?auto_38301 ?auto_38302 ?auto_38299 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_38307 - OBJ
      ?auto_38308 - OBJ
      ?auto_38309 - OBJ
      ?auto_38306 - LOCATION
    )
    :vars
    (
      ?auto_38313 - OBJ
      ?auto_38310 - LOCATION
      ?auto_38312 - CITY
      ?auto_38311 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38308 ?auto_38307 ) ) ( not ( = ?auto_38309 ?auto_38307 ) ) ( not ( = ?auto_38309 ?auto_38308 ) ) ( not ( = ?auto_38307 ?auto_38313 ) ) ( IN-CITY ?auto_38310 ?auto_38312 ) ( IN-CITY ?auto_38306 ?auto_38312 ) ( not ( = ?auto_38306 ?auto_38310 ) ) ( OBJ-AT ?auto_38313 ?auto_38306 ) ( OBJ-AT ?auto_38307 ?auto_38310 ) ( not ( = ?auto_38308 ?auto_38313 ) ) ( IN-TRUCK ?auto_38308 ?auto_38311 ) ( TRUCK-AT ?auto_38311 ?auto_38310 ) ( OBJ-AT ?auto_38309 ?auto_38306 ) ( not ( = ?auto_38309 ?auto_38313 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38313 ?auto_38307 ?auto_38306 )
      ( DELIVER-3PKG-VERIFY ?auto_38307 ?auto_38308 ?auto_38309 ?auto_38306 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_38444 - OBJ
      ?auto_38445 - OBJ
      ?auto_38446 - OBJ
      ?auto_38447 - OBJ
      ?auto_38443 - LOCATION
    )
    :vars
    (
      ?auto_38448 - LOCATION
      ?auto_38450 - CITY
      ?auto_38449 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38445 ?auto_38444 ) ) ( not ( = ?auto_38446 ?auto_38444 ) ) ( not ( = ?auto_38446 ?auto_38445 ) ) ( not ( = ?auto_38447 ?auto_38444 ) ) ( not ( = ?auto_38447 ?auto_38445 ) ) ( not ( = ?auto_38447 ?auto_38446 ) ) ( IN-CITY ?auto_38448 ?auto_38450 ) ( IN-CITY ?auto_38443 ?auto_38450 ) ( not ( = ?auto_38443 ?auto_38448 ) ) ( OBJ-AT ?auto_38444 ?auto_38443 ) ( OBJ-AT ?auto_38447 ?auto_38448 ) ( IN-TRUCK ?auto_38446 ?auto_38449 ) ( TRUCK-AT ?auto_38449 ?auto_38448 ) ( OBJ-AT ?auto_38445 ?auto_38443 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38444 ?auto_38447 ?auto_38443 )
      ( DELIVER-4PKG-VERIFY ?auto_38444 ?auto_38445 ?auto_38446 ?auto_38447 ?auto_38443 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_38470 - OBJ
      ?auto_38471 - OBJ
      ?auto_38472 - OBJ
      ?auto_38473 - OBJ
      ?auto_38469 - LOCATION
    )
    :vars
    (
      ?auto_38474 - LOCATION
      ?auto_38476 - CITY
      ?auto_38475 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38471 ?auto_38470 ) ) ( not ( = ?auto_38472 ?auto_38470 ) ) ( not ( = ?auto_38472 ?auto_38471 ) ) ( not ( = ?auto_38473 ?auto_38470 ) ) ( not ( = ?auto_38473 ?auto_38471 ) ) ( not ( = ?auto_38473 ?auto_38472 ) ) ( IN-CITY ?auto_38474 ?auto_38476 ) ( IN-CITY ?auto_38469 ?auto_38476 ) ( not ( = ?auto_38469 ?auto_38474 ) ) ( OBJ-AT ?auto_38470 ?auto_38469 ) ( OBJ-AT ?auto_38472 ?auto_38474 ) ( IN-TRUCK ?auto_38473 ?auto_38475 ) ( TRUCK-AT ?auto_38475 ?auto_38474 ) ( OBJ-AT ?auto_38471 ?auto_38469 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38470 ?auto_38472 ?auto_38469 )
      ( DELIVER-4PKG-VERIFY ?auto_38470 ?auto_38471 ?auto_38472 ?auto_38473 ?auto_38469 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_38495 - OBJ
      ?auto_38496 - OBJ
      ?auto_38497 - OBJ
      ?auto_38498 - OBJ
      ?auto_38494 - LOCATION
    )
    :vars
    (
      ?auto_38499 - LOCATION
      ?auto_38501 - CITY
      ?auto_38500 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38496 ?auto_38495 ) ) ( not ( = ?auto_38497 ?auto_38495 ) ) ( not ( = ?auto_38497 ?auto_38496 ) ) ( not ( = ?auto_38498 ?auto_38495 ) ) ( not ( = ?auto_38498 ?auto_38496 ) ) ( not ( = ?auto_38498 ?auto_38497 ) ) ( IN-CITY ?auto_38499 ?auto_38501 ) ( IN-CITY ?auto_38494 ?auto_38501 ) ( not ( = ?auto_38494 ?auto_38499 ) ) ( OBJ-AT ?auto_38495 ?auto_38494 ) ( OBJ-AT ?auto_38498 ?auto_38499 ) ( IN-TRUCK ?auto_38496 ?auto_38500 ) ( TRUCK-AT ?auto_38500 ?auto_38499 ) ( OBJ-AT ?auto_38497 ?auto_38494 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38495 ?auto_38498 ?auto_38494 )
      ( DELIVER-4PKG-VERIFY ?auto_38495 ?auto_38496 ?auto_38497 ?auto_38498 ?auto_38494 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_38519 - OBJ
      ?auto_38520 - OBJ
      ?auto_38521 - OBJ
      ?auto_38522 - OBJ
      ?auto_38518 - LOCATION
    )
    :vars
    (
      ?auto_38523 - LOCATION
      ?auto_38525 - CITY
      ?auto_38524 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38520 ?auto_38519 ) ) ( not ( = ?auto_38521 ?auto_38519 ) ) ( not ( = ?auto_38521 ?auto_38520 ) ) ( not ( = ?auto_38522 ?auto_38519 ) ) ( not ( = ?auto_38522 ?auto_38520 ) ) ( not ( = ?auto_38522 ?auto_38521 ) ) ( IN-CITY ?auto_38523 ?auto_38525 ) ( IN-CITY ?auto_38518 ?auto_38525 ) ( not ( = ?auto_38518 ?auto_38523 ) ) ( OBJ-AT ?auto_38519 ?auto_38518 ) ( OBJ-AT ?auto_38521 ?auto_38523 ) ( IN-TRUCK ?auto_38520 ?auto_38524 ) ( TRUCK-AT ?auto_38524 ?auto_38523 ) ( OBJ-AT ?auto_38522 ?auto_38518 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38519 ?auto_38521 ?auto_38518 )
      ( DELIVER-4PKG-VERIFY ?auto_38519 ?auto_38520 ?auto_38521 ?auto_38522 ?auto_38518 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_38596 - OBJ
      ?auto_38597 - OBJ
      ?auto_38598 - OBJ
      ?auto_38599 - OBJ
      ?auto_38595 - LOCATION
    )
    :vars
    (
      ?auto_38600 - LOCATION
      ?auto_38602 - CITY
      ?auto_38601 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38597 ?auto_38596 ) ) ( not ( = ?auto_38598 ?auto_38596 ) ) ( not ( = ?auto_38598 ?auto_38597 ) ) ( not ( = ?auto_38599 ?auto_38596 ) ) ( not ( = ?auto_38599 ?auto_38597 ) ) ( not ( = ?auto_38599 ?auto_38598 ) ) ( IN-CITY ?auto_38600 ?auto_38602 ) ( IN-CITY ?auto_38595 ?auto_38602 ) ( not ( = ?auto_38595 ?auto_38600 ) ) ( OBJ-AT ?auto_38596 ?auto_38595 ) ( OBJ-AT ?auto_38597 ?auto_38600 ) ( IN-TRUCK ?auto_38599 ?auto_38601 ) ( TRUCK-AT ?auto_38601 ?auto_38600 ) ( OBJ-AT ?auto_38598 ?auto_38595 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38596 ?auto_38597 ?auto_38595 )
      ( DELIVER-4PKG-VERIFY ?auto_38596 ?auto_38597 ?auto_38598 ?auto_38599 ?auto_38595 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_38621 - OBJ
      ?auto_38622 - OBJ
      ?auto_38623 - OBJ
      ?auto_38624 - OBJ
      ?auto_38620 - LOCATION
    )
    :vars
    (
      ?auto_38625 - LOCATION
      ?auto_38627 - CITY
      ?auto_38626 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38622 ?auto_38621 ) ) ( not ( = ?auto_38623 ?auto_38621 ) ) ( not ( = ?auto_38623 ?auto_38622 ) ) ( not ( = ?auto_38624 ?auto_38621 ) ) ( not ( = ?auto_38624 ?auto_38622 ) ) ( not ( = ?auto_38624 ?auto_38623 ) ) ( IN-CITY ?auto_38625 ?auto_38627 ) ( IN-CITY ?auto_38620 ?auto_38627 ) ( not ( = ?auto_38620 ?auto_38625 ) ) ( OBJ-AT ?auto_38621 ?auto_38620 ) ( OBJ-AT ?auto_38622 ?auto_38625 ) ( IN-TRUCK ?auto_38623 ?auto_38626 ) ( TRUCK-AT ?auto_38626 ?auto_38625 ) ( OBJ-AT ?auto_38624 ?auto_38620 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38621 ?auto_38622 ?auto_38620 )
      ( DELIVER-4PKG-VERIFY ?auto_38621 ?auto_38622 ?auto_38623 ?auto_38624 ?auto_38620 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_38698 - OBJ
      ?auto_38699 - OBJ
      ?auto_38700 - OBJ
      ?auto_38701 - OBJ
      ?auto_38697 - LOCATION
    )
    :vars
    (
      ?auto_38702 - LOCATION
      ?auto_38704 - CITY
      ?auto_38703 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38699 ?auto_38698 ) ) ( not ( = ?auto_38700 ?auto_38698 ) ) ( not ( = ?auto_38700 ?auto_38699 ) ) ( not ( = ?auto_38701 ?auto_38698 ) ) ( not ( = ?auto_38701 ?auto_38699 ) ) ( not ( = ?auto_38701 ?auto_38700 ) ) ( IN-CITY ?auto_38702 ?auto_38704 ) ( IN-CITY ?auto_38697 ?auto_38704 ) ( not ( = ?auto_38697 ?auto_38702 ) ) ( OBJ-AT ?auto_38699 ?auto_38697 ) ( OBJ-AT ?auto_38701 ?auto_38702 ) ( IN-TRUCK ?auto_38700 ?auto_38703 ) ( TRUCK-AT ?auto_38703 ?auto_38702 ) ( OBJ-AT ?auto_38698 ?auto_38697 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38699 ?auto_38701 ?auto_38697 )
      ( DELIVER-4PKG-VERIFY ?auto_38698 ?auto_38699 ?auto_38700 ?auto_38701 ?auto_38697 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_38724 - OBJ
      ?auto_38725 - OBJ
      ?auto_38726 - OBJ
      ?auto_38727 - OBJ
      ?auto_38723 - LOCATION
    )
    :vars
    (
      ?auto_38728 - LOCATION
      ?auto_38730 - CITY
      ?auto_38729 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38725 ?auto_38724 ) ) ( not ( = ?auto_38726 ?auto_38724 ) ) ( not ( = ?auto_38726 ?auto_38725 ) ) ( not ( = ?auto_38727 ?auto_38724 ) ) ( not ( = ?auto_38727 ?auto_38725 ) ) ( not ( = ?auto_38727 ?auto_38726 ) ) ( IN-CITY ?auto_38728 ?auto_38730 ) ( IN-CITY ?auto_38723 ?auto_38730 ) ( not ( = ?auto_38723 ?auto_38728 ) ) ( OBJ-AT ?auto_38725 ?auto_38723 ) ( OBJ-AT ?auto_38726 ?auto_38728 ) ( IN-TRUCK ?auto_38727 ?auto_38729 ) ( TRUCK-AT ?auto_38729 ?auto_38728 ) ( OBJ-AT ?auto_38724 ?auto_38723 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38725 ?auto_38726 ?auto_38723 )
      ( DELIVER-4PKG-VERIFY ?auto_38724 ?auto_38725 ?auto_38726 ?auto_38727 ?auto_38723 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_38807 - OBJ
      ?auto_38808 - OBJ
      ?auto_38809 - OBJ
      ?auto_38810 - OBJ
      ?auto_38806 - LOCATION
    )
    :vars
    (
      ?auto_38811 - LOCATION
      ?auto_38813 - CITY
      ?auto_38812 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38808 ?auto_38807 ) ) ( not ( = ?auto_38809 ?auto_38807 ) ) ( not ( = ?auto_38809 ?auto_38808 ) ) ( not ( = ?auto_38810 ?auto_38807 ) ) ( not ( = ?auto_38810 ?auto_38808 ) ) ( not ( = ?auto_38810 ?auto_38809 ) ) ( IN-CITY ?auto_38811 ?auto_38813 ) ( IN-CITY ?auto_38806 ?auto_38813 ) ( not ( = ?auto_38806 ?auto_38811 ) ) ( OBJ-AT ?auto_38809 ?auto_38806 ) ( OBJ-AT ?auto_38810 ?auto_38811 ) ( IN-TRUCK ?auto_38808 ?auto_38812 ) ( TRUCK-AT ?auto_38812 ?auto_38811 ) ( OBJ-AT ?auto_38807 ?auto_38806 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38809 ?auto_38810 ?auto_38806 )
      ( DELIVER-4PKG-VERIFY ?auto_38807 ?auto_38808 ?auto_38809 ?auto_38810 ?auto_38806 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_38833 - OBJ
      ?auto_38834 - OBJ
      ?auto_38835 - OBJ
      ?auto_38836 - OBJ
      ?auto_38832 - LOCATION
    )
    :vars
    (
      ?auto_38837 - LOCATION
      ?auto_38839 - CITY
      ?auto_38838 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38834 ?auto_38833 ) ) ( not ( = ?auto_38835 ?auto_38833 ) ) ( not ( = ?auto_38835 ?auto_38834 ) ) ( not ( = ?auto_38836 ?auto_38833 ) ) ( not ( = ?auto_38836 ?auto_38834 ) ) ( not ( = ?auto_38836 ?auto_38835 ) ) ( IN-CITY ?auto_38837 ?auto_38839 ) ( IN-CITY ?auto_38832 ?auto_38839 ) ( not ( = ?auto_38832 ?auto_38837 ) ) ( OBJ-AT ?auto_38836 ?auto_38832 ) ( OBJ-AT ?auto_38835 ?auto_38837 ) ( IN-TRUCK ?auto_38834 ?auto_38838 ) ( TRUCK-AT ?auto_38838 ?auto_38837 ) ( OBJ-AT ?auto_38833 ?auto_38832 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38836 ?auto_38835 ?auto_38832 )
      ( DELIVER-4PKG-VERIFY ?auto_38833 ?auto_38834 ?auto_38835 ?auto_38836 ?auto_38832 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_38886 - OBJ
      ?auto_38887 - OBJ
      ?auto_38888 - OBJ
      ?auto_38889 - OBJ
      ?auto_38885 - LOCATION
    )
    :vars
    (
      ?auto_38890 - LOCATION
      ?auto_38892 - CITY
      ?auto_38891 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38887 ?auto_38886 ) ) ( not ( = ?auto_38888 ?auto_38886 ) ) ( not ( = ?auto_38888 ?auto_38887 ) ) ( not ( = ?auto_38889 ?auto_38886 ) ) ( not ( = ?auto_38889 ?auto_38887 ) ) ( not ( = ?auto_38889 ?auto_38888 ) ) ( IN-CITY ?auto_38890 ?auto_38892 ) ( IN-CITY ?auto_38885 ?auto_38892 ) ( not ( = ?auto_38885 ?auto_38890 ) ) ( OBJ-AT ?auto_38888 ?auto_38885 ) ( OBJ-AT ?auto_38887 ?auto_38890 ) ( IN-TRUCK ?auto_38889 ?auto_38891 ) ( TRUCK-AT ?auto_38891 ?auto_38890 ) ( OBJ-AT ?auto_38886 ?auto_38885 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38888 ?auto_38887 ?auto_38885 )
      ( DELIVER-4PKG-VERIFY ?auto_38886 ?auto_38887 ?auto_38888 ?auto_38889 ?auto_38885 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_38941 - OBJ
      ?auto_38942 - OBJ
      ?auto_38943 - OBJ
      ?auto_38944 - OBJ
      ?auto_38940 - LOCATION
    )
    :vars
    (
      ?auto_38945 - LOCATION
      ?auto_38947 - CITY
      ?auto_38946 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_38942 ?auto_38941 ) ) ( not ( = ?auto_38943 ?auto_38941 ) ) ( not ( = ?auto_38943 ?auto_38942 ) ) ( not ( = ?auto_38944 ?auto_38941 ) ) ( not ( = ?auto_38944 ?auto_38942 ) ) ( not ( = ?auto_38944 ?auto_38943 ) ) ( IN-CITY ?auto_38945 ?auto_38947 ) ( IN-CITY ?auto_38940 ?auto_38947 ) ( not ( = ?auto_38940 ?auto_38945 ) ) ( OBJ-AT ?auto_38944 ?auto_38940 ) ( OBJ-AT ?auto_38942 ?auto_38945 ) ( IN-TRUCK ?auto_38943 ?auto_38946 ) ( TRUCK-AT ?auto_38946 ?auto_38945 ) ( OBJ-AT ?auto_38941 ?auto_38940 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_38944 ?auto_38942 ?auto_38940 )
      ( DELIVER-4PKG-VERIFY ?auto_38941 ?auto_38942 ?auto_38943 ?auto_38944 ?auto_38940 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_39022 - OBJ
      ?auto_39023 - OBJ
      ?auto_39024 - OBJ
      ?auto_39025 - OBJ
      ?auto_39021 - LOCATION
    )
    :vars
    (
      ?auto_39026 - LOCATION
      ?auto_39028 - CITY
      ?auto_39027 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39023 ?auto_39022 ) ) ( not ( = ?auto_39024 ?auto_39022 ) ) ( not ( = ?auto_39024 ?auto_39023 ) ) ( not ( = ?auto_39025 ?auto_39022 ) ) ( not ( = ?auto_39025 ?auto_39023 ) ) ( not ( = ?auto_39025 ?auto_39024 ) ) ( IN-CITY ?auto_39026 ?auto_39028 ) ( IN-CITY ?auto_39021 ?auto_39028 ) ( not ( = ?auto_39021 ?auto_39026 ) ) ( OBJ-AT ?auto_39023 ?auto_39021 ) ( OBJ-AT ?auto_39025 ?auto_39026 ) ( IN-TRUCK ?auto_39022 ?auto_39027 ) ( TRUCK-AT ?auto_39027 ?auto_39026 ) ( OBJ-AT ?auto_39024 ?auto_39021 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_39023 ?auto_39025 ?auto_39021 )
      ( DELIVER-4PKG-VERIFY ?auto_39022 ?auto_39023 ?auto_39024 ?auto_39025 ?auto_39021 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_39046 - OBJ
      ?auto_39047 - OBJ
      ?auto_39048 - OBJ
      ?auto_39049 - OBJ
      ?auto_39045 - LOCATION
    )
    :vars
    (
      ?auto_39050 - LOCATION
      ?auto_39052 - CITY
      ?auto_39051 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39047 ?auto_39046 ) ) ( not ( = ?auto_39048 ?auto_39046 ) ) ( not ( = ?auto_39048 ?auto_39047 ) ) ( not ( = ?auto_39049 ?auto_39046 ) ) ( not ( = ?auto_39049 ?auto_39047 ) ) ( not ( = ?auto_39049 ?auto_39048 ) ) ( IN-CITY ?auto_39050 ?auto_39052 ) ( IN-CITY ?auto_39045 ?auto_39052 ) ( not ( = ?auto_39045 ?auto_39050 ) ) ( OBJ-AT ?auto_39047 ?auto_39045 ) ( OBJ-AT ?auto_39048 ?auto_39050 ) ( IN-TRUCK ?auto_39046 ?auto_39051 ) ( TRUCK-AT ?auto_39051 ?auto_39050 ) ( OBJ-AT ?auto_39049 ?auto_39045 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_39047 ?auto_39048 ?auto_39045 )
      ( DELIVER-4PKG-VERIFY ?auto_39046 ?auto_39047 ?auto_39048 ?auto_39049 ?auto_39045 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_39070 - OBJ
      ?auto_39071 - OBJ
      ?auto_39072 - OBJ
      ?auto_39073 - OBJ
      ?auto_39069 - LOCATION
    )
    :vars
    (
      ?auto_39074 - LOCATION
      ?auto_39076 - CITY
      ?auto_39075 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39071 ?auto_39070 ) ) ( not ( = ?auto_39072 ?auto_39070 ) ) ( not ( = ?auto_39072 ?auto_39071 ) ) ( not ( = ?auto_39073 ?auto_39070 ) ) ( not ( = ?auto_39073 ?auto_39071 ) ) ( not ( = ?auto_39073 ?auto_39072 ) ) ( IN-CITY ?auto_39074 ?auto_39076 ) ( IN-CITY ?auto_39069 ?auto_39076 ) ( not ( = ?auto_39069 ?auto_39074 ) ) ( OBJ-AT ?auto_39072 ?auto_39069 ) ( OBJ-AT ?auto_39073 ?auto_39074 ) ( IN-TRUCK ?auto_39070 ?auto_39075 ) ( TRUCK-AT ?auto_39075 ?auto_39074 ) ( OBJ-AT ?auto_39071 ?auto_39069 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_39072 ?auto_39073 ?auto_39069 )
      ( DELIVER-4PKG-VERIFY ?auto_39070 ?auto_39071 ?auto_39072 ?auto_39073 ?auto_39069 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_39096 - OBJ
      ?auto_39097 - OBJ
      ?auto_39098 - OBJ
      ?auto_39099 - OBJ
      ?auto_39095 - LOCATION
    )
    :vars
    (
      ?auto_39100 - LOCATION
      ?auto_39102 - CITY
      ?auto_39101 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39097 ?auto_39096 ) ) ( not ( = ?auto_39098 ?auto_39096 ) ) ( not ( = ?auto_39098 ?auto_39097 ) ) ( not ( = ?auto_39099 ?auto_39096 ) ) ( not ( = ?auto_39099 ?auto_39097 ) ) ( not ( = ?auto_39099 ?auto_39098 ) ) ( IN-CITY ?auto_39100 ?auto_39102 ) ( IN-CITY ?auto_39095 ?auto_39102 ) ( not ( = ?auto_39095 ?auto_39100 ) ) ( OBJ-AT ?auto_39099 ?auto_39095 ) ( OBJ-AT ?auto_39098 ?auto_39100 ) ( IN-TRUCK ?auto_39096 ?auto_39101 ) ( TRUCK-AT ?auto_39101 ?auto_39100 ) ( OBJ-AT ?auto_39097 ?auto_39095 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_39099 ?auto_39098 ?auto_39095 )
      ( DELIVER-4PKG-VERIFY ?auto_39096 ?auto_39097 ?auto_39098 ?auto_39099 ?auto_39095 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_39200 - OBJ
      ?auto_39201 - OBJ
      ?auto_39202 - OBJ
      ?auto_39203 - OBJ
      ?auto_39199 - LOCATION
    )
    :vars
    (
      ?auto_39204 - LOCATION
      ?auto_39206 - CITY
      ?auto_39205 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39201 ?auto_39200 ) ) ( not ( = ?auto_39202 ?auto_39200 ) ) ( not ( = ?auto_39202 ?auto_39201 ) ) ( not ( = ?auto_39203 ?auto_39200 ) ) ( not ( = ?auto_39203 ?auto_39201 ) ) ( not ( = ?auto_39203 ?auto_39202 ) ) ( IN-CITY ?auto_39204 ?auto_39206 ) ( IN-CITY ?auto_39199 ?auto_39206 ) ( not ( = ?auto_39199 ?auto_39204 ) ) ( OBJ-AT ?auto_39202 ?auto_39199 ) ( OBJ-AT ?auto_39201 ?auto_39204 ) ( IN-TRUCK ?auto_39200 ?auto_39205 ) ( TRUCK-AT ?auto_39205 ?auto_39204 ) ( OBJ-AT ?auto_39203 ?auto_39199 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_39202 ?auto_39201 ?auto_39199 )
      ( DELIVER-4PKG-VERIFY ?auto_39200 ?auto_39201 ?auto_39202 ?auto_39203 ?auto_39199 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_39224 - OBJ
      ?auto_39225 - OBJ
      ?auto_39226 - OBJ
      ?auto_39227 - OBJ
      ?auto_39223 - LOCATION
    )
    :vars
    (
      ?auto_39228 - LOCATION
      ?auto_39230 - CITY
      ?auto_39229 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39225 ?auto_39224 ) ) ( not ( = ?auto_39226 ?auto_39224 ) ) ( not ( = ?auto_39226 ?auto_39225 ) ) ( not ( = ?auto_39227 ?auto_39224 ) ) ( not ( = ?auto_39227 ?auto_39225 ) ) ( not ( = ?auto_39227 ?auto_39226 ) ) ( IN-CITY ?auto_39228 ?auto_39230 ) ( IN-CITY ?auto_39223 ?auto_39230 ) ( not ( = ?auto_39223 ?auto_39228 ) ) ( OBJ-AT ?auto_39227 ?auto_39223 ) ( OBJ-AT ?auto_39225 ?auto_39228 ) ( IN-TRUCK ?auto_39224 ?auto_39229 ) ( TRUCK-AT ?auto_39229 ?auto_39228 ) ( OBJ-AT ?auto_39226 ?auto_39223 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_39227 ?auto_39225 ?auto_39223 )
      ( DELIVER-4PKG-VERIFY ?auto_39224 ?auto_39225 ?auto_39226 ?auto_39227 ?auto_39223 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_39382 - OBJ
      ?auto_39383 - OBJ
      ?auto_39384 - OBJ
      ?auto_39385 - OBJ
      ?auto_39381 - LOCATION
    )
    :vars
    (
      ?auto_39386 - LOCATION
      ?auto_39388 - CITY
      ?auto_39387 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39383 ?auto_39382 ) ) ( not ( = ?auto_39384 ?auto_39382 ) ) ( not ( = ?auto_39384 ?auto_39383 ) ) ( not ( = ?auto_39385 ?auto_39382 ) ) ( not ( = ?auto_39385 ?auto_39383 ) ) ( not ( = ?auto_39385 ?auto_39384 ) ) ( IN-CITY ?auto_39386 ?auto_39388 ) ( IN-CITY ?auto_39381 ?auto_39388 ) ( not ( = ?auto_39381 ?auto_39386 ) ) ( OBJ-AT ?auto_39383 ?auto_39381 ) ( OBJ-AT ?auto_39382 ?auto_39386 ) ( IN-TRUCK ?auto_39385 ?auto_39387 ) ( TRUCK-AT ?auto_39387 ?auto_39386 ) ( OBJ-AT ?auto_39384 ?auto_39381 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_39383 ?auto_39382 ?auto_39381 )
      ( DELIVER-4PKG-VERIFY ?auto_39382 ?auto_39383 ?auto_39384 ?auto_39385 ?auto_39381 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_39407 - OBJ
      ?auto_39408 - OBJ
      ?auto_39409 - OBJ
      ?auto_39410 - OBJ
      ?auto_39406 - LOCATION
    )
    :vars
    (
      ?auto_39411 - LOCATION
      ?auto_39413 - CITY
      ?auto_39412 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39408 ?auto_39407 ) ) ( not ( = ?auto_39409 ?auto_39407 ) ) ( not ( = ?auto_39409 ?auto_39408 ) ) ( not ( = ?auto_39410 ?auto_39407 ) ) ( not ( = ?auto_39410 ?auto_39408 ) ) ( not ( = ?auto_39410 ?auto_39409 ) ) ( IN-CITY ?auto_39411 ?auto_39413 ) ( IN-CITY ?auto_39406 ?auto_39413 ) ( not ( = ?auto_39406 ?auto_39411 ) ) ( OBJ-AT ?auto_39408 ?auto_39406 ) ( OBJ-AT ?auto_39407 ?auto_39411 ) ( IN-TRUCK ?auto_39409 ?auto_39412 ) ( TRUCK-AT ?auto_39412 ?auto_39411 ) ( OBJ-AT ?auto_39410 ?auto_39406 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_39408 ?auto_39407 ?auto_39406 )
      ( DELIVER-4PKG-VERIFY ?auto_39407 ?auto_39408 ?auto_39409 ?auto_39410 ?auto_39406 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_39484 - OBJ
      ?auto_39485 - OBJ
      ?auto_39486 - OBJ
      ?auto_39487 - OBJ
      ?auto_39483 - LOCATION
    )
    :vars
    (
      ?auto_39488 - LOCATION
      ?auto_39490 - CITY
      ?auto_39489 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39485 ?auto_39484 ) ) ( not ( = ?auto_39486 ?auto_39484 ) ) ( not ( = ?auto_39486 ?auto_39485 ) ) ( not ( = ?auto_39487 ?auto_39484 ) ) ( not ( = ?auto_39487 ?auto_39485 ) ) ( not ( = ?auto_39487 ?auto_39486 ) ) ( IN-CITY ?auto_39488 ?auto_39490 ) ( IN-CITY ?auto_39483 ?auto_39490 ) ( not ( = ?auto_39483 ?auto_39488 ) ) ( OBJ-AT ?auto_39486 ?auto_39483 ) ( OBJ-AT ?auto_39484 ?auto_39488 ) ( IN-TRUCK ?auto_39487 ?auto_39489 ) ( TRUCK-AT ?auto_39489 ?auto_39488 ) ( OBJ-AT ?auto_39485 ?auto_39483 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_39486 ?auto_39484 ?auto_39483 )
      ( DELIVER-4PKG-VERIFY ?auto_39484 ?auto_39485 ?auto_39486 ?auto_39487 ?auto_39483 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_39539 - OBJ
      ?auto_39540 - OBJ
      ?auto_39541 - OBJ
      ?auto_39542 - OBJ
      ?auto_39538 - LOCATION
    )
    :vars
    (
      ?auto_39543 - LOCATION
      ?auto_39545 - CITY
      ?auto_39544 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39540 ?auto_39539 ) ) ( not ( = ?auto_39541 ?auto_39539 ) ) ( not ( = ?auto_39541 ?auto_39540 ) ) ( not ( = ?auto_39542 ?auto_39539 ) ) ( not ( = ?auto_39542 ?auto_39540 ) ) ( not ( = ?auto_39542 ?auto_39541 ) ) ( IN-CITY ?auto_39543 ?auto_39545 ) ( IN-CITY ?auto_39538 ?auto_39545 ) ( not ( = ?auto_39538 ?auto_39543 ) ) ( OBJ-AT ?auto_39542 ?auto_39538 ) ( OBJ-AT ?auto_39539 ?auto_39543 ) ( IN-TRUCK ?auto_39541 ?auto_39544 ) ( TRUCK-AT ?auto_39544 ?auto_39543 ) ( OBJ-AT ?auto_39540 ?auto_39538 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_39542 ?auto_39539 ?auto_39538 )
      ( DELIVER-4PKG-VERIFY ?auto_39539 ?auto_39540 ?auto_39541 ?auto_39542 ?auto_39538 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_39620 - OBJ
      ?auto_39621 - OBJ
      ?auto_39622 - OBJ
      ?auto_39623 - OBJ
      ?auto_39619 - LOCATION
    )
    :vars
    (
      ?auto_39624 - LOCATION
      ?auto_39626 - CITY
      ?auto_39625 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39621 ?auto_39620 ) ) ( not ( = ?auto_39622 ?auto_39620 ) ) ( not ( = ?auto_39622 ?auto_39621 ) ) ( not ( = ?auto_39623 ?auto_39620 ) ) ( not ( = ?auto_39623 ?auto_39621 ) ) ( not ( = ?auto_39623 ?auto_39622 ) ) ( IN-CITY ?auto_39624 ?auto_39626 ) ( IN-CITY ?auto_39619 ?auto_39626 ) ( not ( = ?auto_39619 ?auto_39624 ) ) ( OBJ-AT ?auto_39622 ?auto_39619 ) ( OBJ-AT ?auto_39620 ?auto_39624 ) ( IN-TRUCK ?auto_39621 ?auto_39625 ) ( TRUCK-AT ?auto_39625 ?auto_39624 ) ( OBJ-AT ?auto_39623 ?auto_39619 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_39622 ?auto_39620 ?auto_39619 )
      ( DELIVER-4PKG-VERIFY ?auto_39620 ?auto_39621 ?auto_39622 ?auto_39623 ?auto_39619 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_39644 - OBJ
      ?auto_39645 - OBJ
      ?auto_39646 - OBJ
      ?auto_39647 - OBJ
      ?auto_39643 - LOCATION
    )
    :vars
    (
      ?auto_39648 - LOCATION
      ?auto_39650 - CITY
      ?auto_39649 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39645 ?auto_39644 ) ) ( not ( = ?auto_39646 ?auto_39644 ) ) ( not ( = ?auto_39646 ?auto_39645 ) ) ( not ( = ?auto_39647 ?auto_39644 ) ) ( not ( = ?auto_39647 ?auto_39645 ) ) ( not ( = ?auto_39647 ?auto_39646 ) ) ( IN-CITY ?auto_39648 ?auto_39650 ) ( IN-CITY ?auto_39643 ?auto_39650 ) ( not ( = ?auto_39643 ?auto_39648 ) ) ( OBJ-AT ?auto_39647 ?auto_39643 ) ( OBJ-AT ?auto_39644 ?auto_39648 ) ( IN-TRUCK ?auto_39645 ?auto_39649 ) ( TRUCK-AT ?auto_39649 ?auto_39648 ) ( OBJ-AT ?auto_39646 ?auto_39643 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_39647 ?auto_39644 ?auto_39643 )
      ( DELIVER-4PKG-VERIFY ?auto_39644 ?auto_39645 ?auto_39646 ?auto_39647 ?auto_39643 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_39895 - OBJ
      ?auto_39894 - LOCATION
    )
    :vars
    (
      ?auto_39900 - OBJ
      ?auto_39896 - LOCATION
      ?auto_39899 - CITY
      ?auto_39897 - OBJ
      ?auto_39898 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39895 ?auto_39900 ) ) ( IN-CITY ?auto_39896 ?auto_39899 ) ( IN-CITY ?auto_39894 ?auto_39899 ) ( not ( = ?auto_39894 ?auto_39896 ) ) ( OBJ-AT ?auto_39900 ?auto_39894 ) ( OBJ-AT ?auto_39895 ?auto_39896 ) ( not ( = ?auto_39897 ?auto_39900 ) ) ( not ( = ?auto_39895 ?auto_39897 ) ) ( TRUCK-AT ?auto_39898 ?auto_39896 ) ( OBJ-AT ?auto_39897 ?auto_39896 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_39897 ?auto_39898 ?auto_39896 )
      ( DELIVER-2PKG ?auto_39900 ?auto_39895 ?auto_39894 )
      ( DELIVER-1PKG-VERIFY ?auto_39895 ?auto_39894 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_39902 - OBJ
      ?auto_39903 - OBJ
      ?auto_39901 - LOCATION
    )
    :vars
    (
      ?auto_39904 - LOCATION
      ?auto_39907 - CITY
      ?auto_39905 - OBJ
      ?auto_39906 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39903 ?auto_39902 ) ) ( IN-CITY ?auto_39904 ?auto_39907 ) ( IN-CITY ?auto_39901 ?auto_39907 ) ( not ( = ?auto_39901 ?auto_39904 ) ) ( OBJ-AT ?auto_39902 ?auto_39901 ) ( OBJ-AT ?auto_39903 ?auto_39904 ) ( not ( = ?auto_39905 ?auto_39902 ) ) ( not ( = ?auto_39903 ?auto_39905 ) ) ( TRUCK-AT ?auto_39906 ?auto_39904 ) ( OBJ-AT ?auto_39905 ?auto_39904 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_39903 ?auto_39901 )
      ( DELIVER-2PKG-VERIFY ?auto_39902 ?auto_39903 ?auto_39901 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_39909 - OBJ
      ?auto_39910 - OBJ
      ?auto_39908 - LOCATION
    )
    :vars
    (
      ?auto_39915 - OBJ
      ?auto_39911 - LOCATION
      ?auto_39912 - CITY
      ?auto_39914 - OBJ
      ?auto_39913 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39910 ?auto_39909 ) ) ( not ( = ?auto_39910 ?auto_39915 ) ) ( IN-CITY ?auto_39911 ?auto_39912 ) ( IN-CITY ?auto_39908 ?auto_39912 ) ( not ( = ?auto_39908 ?auto_39911 ) ) ( OBJ-AT ?auto_39915 ?auto_39908 ) ( OBJ-AT ?auto_39910 ?auto_39911 ) ( not ( = ?auto_39914 ?auto_39915 ) ) ( not ( = ?auto_39910 ?auto_39914 ) ) ( TRUCK-AT ?auto_39913 ?auto_39911 ) ( OBJ-AT ?auto_39914 ?auto_39911 ) ( OBJ-AT ?auto_39909 ?auto_39908 ) ( not ( = ?auto_39909 ?auto_39915 ) ) ( not ( = ?auto_39909 ?auto_39914 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_39915 ?auto_39910 ?auto_39908 )
      ( DELIVER-2PKG-VERIFY ?auto_39909 ?auto_39910 ?auto_39908 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_39917 - OBJ
      ?auto_39918 - OBJ
      ?auto_39916 - LOCATION
    )
    :vars
    (
      ?auto_39922 - OBJ
      ?auto_39919 - LOCATION
      ?auto_39920 - CITY
      ?auto_39921 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39918 ?auto_39917 ) ) ( not ( = ?auto_39918 ?auto_39922 ) ) ( IN-CITY ?auto_39919 ?auto_39920 ) ( IN-CITY ?auto_39916 ?auto_39920 ) ( not ( = ?auto_39916 ?auto_39919 ) ) ( OBJ-AT ?auto_39922 ?auto_39916 ) ( OBJ-AT ?auto_39918 ?auto_39919 ) ( not ( = ?auto_39917 ?auto_39922 ) ) ( TRUCK-AT ?auto_39921 ?auto_39919 ) ( OBJ-AT ?auto_39917 ?auto_39919 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_39922 ?auto_39918 ?auto_39916 )
      ( DELIVER-2PKG-VERIFY ?auto_39917 ?auto_39918 ?auto_39916 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_39924 - OBJ
      ?auto_39925 - OBJ
      ?auto_39923 - LOCATION
    )
    :vars
    (
      ?auto_39926 - LOCATION
      ?auto_39927 - CITY
      ?auto_39929 - OBJ
      ?auto_39928 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39925 ?auto_39924 ) ) ( IN-CITY ?auto_39926 ?auto_39927 ) ( IN-CITY ?auto_39923 ?auto_39927 ) ( not ( = ?auto_39923 ?auto_39926 ) ) ( OBJ-AT ?auto_39925 ?auto_39923 ) ( OBJ-AT ?auto_39924 ?auto_39926 ) ( not ( = ?auto_39929 ?auto_39925 ) ) ( not ( = ?auto_39924 ?auto_39929 ) ) ( TRUCK-AT ?auto_39928 ?auto_39926 ) ( OBJ-AT ?auto_39929 ?auto_39926 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_39925 ?auto_39924 ?auto_39923 )
      ( DELIVER-2PKG-VERIFY ?auto_39924 ?auto_39925 ?auto_39923 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_39931 - OBJ
      ?auto_39932 - OBJ
      ?auto_39930 - LOCATION
    )
    :vars
    (
      ?auto_39937 - OBJ
      ?auto_39933 - LOCATION
      ?auto_39934 - CITY
      ?auto_39936 - OBJ
      ?auto_39935 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39932 ?auto_39931 ) ) ( not ( = ?auto_39931 ?auto_39937 ) ) ( IN-CITY ?auto_39933 ?auto_39934 ) ( IN-CITY ?auto_39930 ?auto_39934 ) ( not ( = ?auto_39930 ?auto_39933 ) ) ( OBJ-AT ?auto_39937 ?auto_39930 ) ( OBJ-AT ?auto_39931 ?auto_39933 ) ( not ( = ?auto_39936 ?auto_39937 ) ) ( not ( = ?auto_39931 ?auto_39936 ) ) ( TRUCK-AT ?auto_39935 ?auto_39933 ) ( OBJ-AT ?auto_39936 ?auto_39933 ) ( OBJ-AT ?auto_39932 ?auto_39930 ) ( not ( = ?auto_39932 ?auto_39937 ) ) ( not ( = ?auto_39932 ?auto_39936 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_39937 ?auto_39931 ?auto_39930 )
      ( DELIVER-2PKG-VERIFY ?auto_39931 ?auto_39932 ?auto_39930 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_39939 - OBJ
      ?auto_39940 - OBJ
      ?auto_39938 - LOCATION
    )
    :vars
    (
      ?auto_39944 - OBJ
      ?auto_39941 - LOCATION
      ?auto_39942 - CITY
      ?auto_39943 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39940 ?auto_39939 ) ) ( not ( = ?auto_39939 ?auto_39944 ) ) ( IN-CITY ?auto_39941 ?auto_39942 ) ( IN-CITY ?auto_39938 ?auto_39942 ) ( not ( = ?auto_39938 ?auto_39941 ) ) ( OBJ-AT ?auto_39944 ?auto_39938 ) ( OBJ-AT ?auto_39939 ?auto_39941 ) ( not ( = ?auto_39940 ?auto_39944 ) ) ( TRUCK-AT ?auto_39943 ?auto_39941 ) ( OBJ-AT ?auto_39940 ?auto_39941 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_39944 ?auto_39939 ?auto_39938 )
      ( DELIVER-2PKG-VERIFY ?auto_39939 ?auto_39940 ?auto_39938 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_39962 - OBJ
      ?auto_39963 - OBJ
      ?auto_39964 - OBJ
      ?auto_39961 - LOCATION
    )
    :vars
    (
      ?auto_39965 - LOCATION
      ?auto_39966 - CITY
      ?auto_39968 - OBJ
      ?auto_39967 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39963 ?auto_39962 ) ) ( not ( = ?auto_39964 ?auto_39962 ) ) ( not ( = ?auto_39964 ?auto_39963 ) ) ( IN-CITY ?auto_39965 ?auto_39966 ) ( IN-CITY ?auto_39961 ?auto_39966 ) ( not ( = ?auto_39961 ?auto_39965 ) ) ( OBJ-AT ?auto_39962 ?auto_39961 ) ( OBJ-AT ?auto_39964 ?auto_39965 ) ( not ( = ?auto_39968 ?auto_39962 ) ) ( not ( = ?auto_39964 ?auto_39968 ) ) ( TRUCK-AT ?auto_39967 ?auto_39965 ) ( OBJ-AT ?auto_39968 ?auto_39965 ) ( OBJ-AT ?auto_39963 ?auto_39961 ) ( not ( = ?auto_39963 ?auto_39968 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_39962 ?auto_39964 ?auto_39961 )
      ( DELIVER-3PKG-VERIFY ?auto_39962 ?auto_39963 ?auto_39964 ?auto_39961 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_39970 - OBJ
      ?auto_39971 - OBJ
      ?auto_39972 - OBJ
      ?auto_39969 - LOCATION
    )
    :vars
    (
      ?auto_39973 - LOCATION
      ?auto_39974 - CITY
      ?auto_39975 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39971 ?auto_39970 ) ) ( not ( = ?auto_39972 ?auto_39970 ) ) ( not ( = ?auto_39972 ?auto_39971 ) ) ( IN-CITY ?auto_39973 ?auto_39974 ) ( IN-CITY ?auto_39969 ?auto_39974 ) ( not ( = ?auto_39969 ?auto_39973 ) ) ( OBJ-AT ?auto_39970 ?auto_39969 ) ( OBJ-AT ?auto_39972 ?auto_39973 ) ( TRUCK-AT ?auto_39975 ?auto_39973 ) ( OBJ-AT ?auto_39971 ?auto_39973 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_39970 ?auto_39972 ?auto_39969 )
      ( DELIVER-3PKG-VERIFY ?auto_39970 ?auto_39971 ?auto_39972 ?auto_39969 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_39985 - OBJ
      ?auto_39986 - OBJ
      ?auto_39987 - OBJ
      ?auto_39984 - LOCATION
    )
    :vars
    (
      ?auto_39988 - LOCATION
      ?auto_39989 - CITY
      ?auto_39991 - OBJ
      ?auto_39990 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39986 ?auto_39985 ) ) ( not ( = ?auto_39987 ?auto_39985 ) ) ( not ( = ?auto_39987 ?auto_39986 ) ) ( IN-CITY ?auto_39988 ?auto_39989 ) ( IN-CITY ?auto_39984 ?auto_39989 ) ( not ( = ?auto_39984 ?auto_39988 ) ) ( OBJ-AT ?auto_39985 ?auto_39984 ) ( OBJ-AT ?auto_39986 ?auto_39988 ) ( not ( = ?auto_39991 ?auto_39985 ) ) ( not ( = ?auto_39986 ?auto_39991 ) ) ( TRUCK-AT ?auto_39990 ?auto_39988 ) ( OBJ-AT ?auto_39991 ?auto_39988 ) ( OBJ-AT ?auto_39987 ?auto_39984 ) ( not ( = ?auto_39987 ?auto_39991 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_39985 ?auto_39986 ?auto_39984 )
      ( DELIVER-3PKG-VERIFY ?auto_39985 ?auto_39986 ?auto_39987 ?auto_39984 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_39993 - OBJ
      ?auto_39994 - OBJ
      ?auto_39995 - OBJ
      ?auto_39992 - LOCATION
    )
    :vars
    (
      ?auto_39996 - LOCATION
      ?auto_39997 - CITY
      ?auto_39998 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_39994 ?auto_39993 ) ) ( not ( = ?auto_39995 ?auto_39993 ) ) ( not ( = ?auto_39995 ?auto_39994 ) ) ( IN-CITY ?auto_39996 ?auto_39997 ) ( IN-CITY ?auto_39992 ?auto_39997 ) ( not ( = ?auto_39992 ?auto_39996 ) ) ( OBJ-AT ?auto_39993 ?auto_39992 ) ( OBJ-AT ?auto_39994 ?auto_39996 ) ( TRUCK-AT ?auto_39998 ?auto_39996 ) ( OBJ-AT ?auto_39995 ?auto_39996 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_39993 ?auto_39994 ?auto_39992 )
      ( DELIVER-3PKG-VERIFY ?auto_39993 ?auto_39994 ?auto_39995 ?auto_39992 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_40008 - OBJ
      ?auto_40009 - OBJ
      ?auto_40010 - OBJ
      ?auto_40007 - LOCATION
    )
    :vars
    (
      ?auto_40011 - LOCATION
      ?auto_40012 - CITY
      ?auto_40014 - OBJ
      ?auto_40013 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40009 ?auto_40008 ) ) ( not ( = ?auto_40010 ?auto_40008 ) ) ( not ( = ?auto_40010 ?auto_40009 ) ) ( IN-CITY ?auto_40011 ?auto_40012 ) ( IN-CITY ?auto_40007 ?auto_40012 ) ( not ( = ?auto_40007 ?auto_40011 ) ) ( OBJ-AT ?auto_40009 ?auto_40007 ) ( OBJ-AT ?auto_40010 ?auto_40011 ) ( not ( = ?auto_40014 ?auto_40009 ) ) ( not ( = ?auto_40010 ?auto_40014 ) ) ( TRUCK-AT ?auto_40013 ?auto_40011 ) ( OBJ-AT ?auto_40014 ?auto_40011 ) ( OBJ-AT ?auto_40008 ?auto_40007 ) ( not ( = ?auto_40008 ?auto_40014 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40009 ?auto_40010 ?auto_40007 )
      ( DELIVER-3PKG-VERIFY ?auto_40008 ?auto_40009 ?auto_40010 ?auto_40007 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_40025 - OBJ
      ?auto_40026 - OBJ
      ?auto_40027 - OBJ
      ?auto_40024 - LOCATION
    )
    :vars
    (
      ?auto_40031 - OBJ
      ?auto_40028 - LOCATION
      ?auto_40029 - CITY
      ?auto_40030 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40026 ?auto_40025 ) ) ( not ( = ?auto_40027 ?auto_40025 ) ) ( not ( = ?auto_40027 ?auto_40026 ) ) ( not ( = ?auto_40027 ?auto_40031 ) ) ( IN-CITY ?auto_40028 ?auto_40029 ) ( IN-CITY ?auto_40024 ?auto_40029 ) ( not ( = ?auto_40024 ?auto_40028 ) ) ( OBJ-AT ?auto_40031 ?auto_40024 ) ( OBJ-AT ?auto_40027 ?auto_40028 ) ( not ( = ?auto_40026 ?auto_40031 ) ) ( TRUCK-AT ?auto_40030 ?auto_40028 ) ( OBJ-AT ?auto_40026 ?auto_40028 ) ( OBJ-AT ?auto_40025 ?auto_40024 ) ( not ( = ?auto_40025 ?auto_40031 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40031 ?auto_40027 ?auto_40024 )
      ( DELIVER-3PKG-VERIFY ?auto_40025 ?auto_40026 ?auto_40027 ?auto_40024 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_40033 - OBJ
      ?auto_40034 - OBJ
      ?auto_40035 - OBJ
      ?auto_40032 - LOCATION
    )
    :vars
    (
      ?auto_40036 - LOCATION
      ?auto_40037 - CITY
      ?auto_40039 - OBJ
      ?auto_40038 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40034 ?auto_40033 ) ) ( not ( = ?auto_40035 ?auto_40033 ) ) ( not ( = ?auto_40035 ?auto_40034 ) ) ( IN-CITY ?auto_40036 ?auto_40037 ) ( IN-CITY ?auto_40032 ?auto_40037 ) ( not ( = ?auto_40032 ?auto_40036 ) ) ( OBJ-AT ?auto_40035 ?auto_40032 ) ( OBJ-AT ?auto_40034 ?auto_40036 ) ( not ( = ?auto_40039 ?auto_40035 ) ) ( not ( = ?auto_40034 ?auto_40039 ) ) ( TRUCK-AT ?auto_40038 ?auto_40036 ) ( OBJ-AT ?auto_40039 ?auto_40036 ) ( OBJ-AT ?auto_40033 ?auto_40032 ) ( not ( = ?auto_40033 ?auto_40039 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40035 ?auto_40034 ?auto_40032 )
      ( DELIVER-3PKG-VERIFY ?auto_40033 ?auto_40034 ?auto_40035 ?auto_40032 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_40050 - OBJ
      ?auto_40051 - OBJ
      ?auto_40052 - OBJ
      ?auto_40049 - LOCATION
    )
    :vars
    (
      ?auto_40056 - OBJ
      ?auto_40053 - LOCATION
      ?auto_40054 - CITY
      ?auto_40055 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40051 ?auto_40050 ) ) ( not ( = ?auto_40052 ?auto_40050 ) ) ( not ( = ?auto_40052 ?auto_40051 ) ) ( not ( = ?auto_40051 ?auto_40056 ) ) ( IN-CITY ?auto_40053 ?auto_40054 ) ( IN-CITY ?auto_40049 ?auto_40054 ) ( not ( = ?auto_40049 ?auto_40053 ) ) ( OBJ-AT ?auto_40056 ?auto_40049 ) ( OBJ-AT ?auto_40051 ?auto_40053 ) ( not ( = ?auto_40052 ?auto_40056 ) ) ( TRUCK-AT ?auto_40055 ?auto_40053 ) ( OBJ-AT ?auto_40052 ?auto_40053 ) ( OBJ-AT ?auto_40050 ?auto_40049 ) ( not ( = ?auto_40050 ?auto_40056 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40056 ?auto_40051 ?auto_40049 )
      ( DELIVER-3PKG-VERIFY ?auto_40050 ?auto_40051 ?auto_40052 ?auto_40049 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_40067 - OBJ
      ?auto_40068 - OBJ
      ?auto_40069 - OBJ
      ?auto_40066 - LOCATION
    )
    :vars
    (
      ?auto_40070 - LOCATION
      ?auto_40071 - CITY
      ?auto_40072 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40068 ?auto_40067 ) ) ( not ( = ?auto_40069 ?auto_40067 ) ) ( not ( = ?auto_40069 ?auto_40068 ) ) ( IN-CITY ?auto_40070 ?auto_40071 ) ( IN-CITY ?auto_40066 ?auto_40071 ) ( not ( = ?auto_40066 ?auto_40070 ) ) ( OBJ-AT ?auto_40068 ?auto_40066 ) ( OBJ-AT ?auto_40069 ?auto_40070 ) ( TRUCK-AT ?auto_40072 ?auto_40070 ) ( OBJ-AT ?auto_40067 ?auto_40070 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40068 ?auto_40069 ?auto_40066 )
      ( DELIVER-3PKG-VERIFY ?auto_40067 ?auto_40068 ?auto_40069 ?auto_40066 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_40074 - OBJ
      ?auto_40075 - OBJ
      ?auto_40076 - OBJ
      ?auto_40073 - LOCATION
    )
    :vars
    (
      ?auto_40080 - OBJ
      ?auto_40077 - LOCATION
      ?auto_40078 - CITY
      ?auto_40079 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40075 ?auto_40074 ) ) ( not ( = ?auto_40076 ?auto_40074 ) ) ( not ( = ?auto_40076 ?auto_40075 ) ) ( not ( = ?auto_40076 ?auto_40080 ) ) ( IN-CITY ?auto_40077 ?auto_40078 ) ( IN-CITY ?auto_40073 ?auto_40078 ) ( not ( = ?auto_40073 ?auto_40077 ) ) ( OBJ-AT ?auto_40080 ?auto_40073 ) ( OBJ-AT ?auto_40076 ?auto_40077 ) ( not ( = ?auto_40074 ?auto_40080 ) ) ( TRUCK-AT ?auto_40079 ?auto_40077 ) ( OBJ-AT ?auto_40074 ?auto_40077 ) ( OBJ-AT ?auto_40075 ?auto_40073 ) ( not ( = ?auto_40075 ?auto_40080 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40080 ?auto_40076 ?auto_40073 )
      ( DELIVER-3PKG-VERIFY ?auto_40074 ?auto_40075 ?auto_40076 ?auto_40073 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_40090 - OBJ
      ?auto_40091 - OBJ
      ?auto_40092 - OBJ
      ?auto_40089 - LOCATION
    )
    :vars
    (
      ?auto_40093 - LOCATION
      ?auto_40094 - CITY
      ?auto_40095 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40091 ?auto_40090 ) ) ( not ( = ?auto_40092 ?auto_40090 ) ) ( not ( = ?auto_40092 ?auto_40091 ) ) ( IN-CITY ?auto_40093 ?auto_40094 ) ( IN-CITY ?auto_40089 ?auto_40094 ) ( not ( = ?auto_40089 ?auto_40093 ) ) ( OBJ-AT ?auto_40092 ?auto_40089 ) ( OBJ-AT ?auto_40091 ?auto_40093 ) ( TRUCK-AT ?auto_40095 ?auto_40093 ) ( OBJ-AT ?auto_40090 ?auto_40093 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40092 ?auto_40091 ?auto_40089 )
      ( DELIVER-3PKG-VERIFY ?auto_40090 ?auto_40091 ?auto_40092 ?auto_40089 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_40097 - OBJ
      ?auto_40098 - OBJ
      ?auto_40099 - OBJ
      ?auto_40096 - LOCATION
    )
    :vars
    (
      ?auto_40103 - OBJ
      ?auto_40100 - LOCATION
      ?auto_40101 - CITY
      ?auto_40102 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40098 ?auto_40097 ) ) ( not ( = ?auto_40099 ?auto_40097 ) ) ( not ( = ?auto_40099 ?auto_40098 ) ) ( not ( = ?auto_40098 ?auto_40103 ) ) ( IN-CITY ?auto_40100 ?auto_40101 ) ( IN-CITY ?auto_40096 ?auto_40101 ) ( not ( = ?auto_40096 ?auto_40100 ) ) ( OBJ-AT ?auto_40103 ?auto_40096 ) ( OBJ-AT ?auto_40098 ?auto_40100 ) ( not ( = ?auto_40097 ?auto_40103 ) ) ( TRUCK-AT ?auto_40102 ?auto_40100 ) ( OBJ-AT ?auto_40097 ?auto_40100 ) ( OBJ-AT ?auto_40099 ?auto_40096 ) ( not ( = ?auto_40099 ?auto_40103 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40103 ?auto_40098 ?auto_40096 )
      ( DELIVER-3PKG-VERIFY ?auto_40097 ?auto_40098 ?auto_40099 ?auto_40096 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_40129 - OBJ
      ?auto_40130 - OBJ
      ?auto_40131 - OBJ
      ?auto_40128 - LOCATION
    )
    :vars
    (
      ?auto_40132 - LOCATION
      ?auto_40133 - CITY
      ?auto_40135 - OBJ
      ?auto_40134 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40130 ?auto_40129 ) ) ( not ( = ?auto_40131 ?auto_40129 ) ) ( not ( = ?auto_40131 ?auto_40130 ) ) ( IN-CITY ?auto_40132 ?auto_40133 ) ( IN-CITY ?auto_40128 ?auto_40133 ) ( not ( = ?auto_40128 ?auto_40132 ) ) ( OBJ-AT ?auto_40130 ?auto_40128 ) ( OBJ-AT ?auto_40129 ?auto_40132 ) ( not ( = ?auto_40135 ?auto_40130 ) ) ( not ( = ?auto_40129 ?auto_40135 ) ) ( TRUCK-AT ?auto_40134 ?auto_40132 ) ( OBJ-AT ?auto_40135 ?auto_40132 ) ( OBJ-AT ?auto_40131 ?auto_40128 ) ( not ( = ?auto_40131 ?auto_40135 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40130 ?auto_40129 ?auto_40128 )
      ( DELIVER-3PKG-VERIFY ?auto_40129 ?auto_40130 ?auto_40131 ?auto_40128 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_40137 - OBJ
      ?auto_40138 - OBJ
      ?auto_40139 - OBJ
      ?auto_40136 - LOCATION
    )
    :vars
    (
      ?auto_40140 - LOCATION
      ?auto_40141 - CITY
      ?auto_40142 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40138 ?auto_40137 ) ) ( not ( = ?auto_40139 ?auto_40137 ) ) ( not ( = ?auto_40139 ?auto_40138 ) ) ( IN-CITY ?auto_40140 ?auto_40141 ) ( IN-CITY ?auto_40136 ?auto_40141 ) ( not ( = ?auto_40136 ?auto_40140 ) ) ( OBJ-AT ?auto_40138 ?auto_40136 ) ( OBJ-AT ?auto_40137 ?auto_40140 ) ( TRUCK-AT ?auto_40142 ?auto_40140 ) ( OBJ-AT ?auto_40139 ?auto_40140 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40138 ?auto_40137 ?auto_40136 )
      ( DELIVER-3PKG-VERIFY ?auto_40137 ?auto_40138 ?auto_40139 ?auto_40136 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_40152 - OBJ
      ?auto_40153 - OBJ
      ?auto_40154 - OBJ
      ?auto_40151 - LOCATION
    )
    :vars
    (
      ?auto_40155 - LOCATION
      ?auto_40156 - CITY
      ?auto_40158 - OBJ
      ?auto_40157 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40153 ?auto_40152 ) ) ( not ( = ?auto_40154 ?auto_40152 ) ) ( not ( = ?auto_40154 ?auto_40153 ) ) ( IN-CITY ?auto_40155 ?auto_40156 ) ( IN-CITY ?auto_40151 ?auto_40156 ) ( not ( = ?auto_40151 ?auto_40155 ) ) ( OBJ-AT ?auto_40154 ?auto_40151 ) ( OBJ-AT ?auto_40152 ?auto_40155 ) ( not ( = ?auto_40158 ?auto_40154 ) ) ( not ( = ?auto_40152 ?auto_40158 ) ) ( TRUCK-AT ?auto_40157 ?auto_40155 ) ( OBJ-AT ?auto_40158 ?auto_40155 ) ( OBJ-AT ?auto_40153 ?auto_40151 ) ( not ( = ?auto_40153 ?auto_40158 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40154 ?auto_40152 ?auto_40151 )
      ( DELIVER-3PKG-VERIFY ?auto_40152 ?auto_40153 ?auto_40154 ?auto_40151 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_40169 - OBJ
      ?auto_40170 - OBJ
      ?auto_40171 - OBJ
      ?auto_40168 - LOCATION
    )
    :vars
    (
      ?auto_40175 - OBJ
      ?auto_40172 - LOCATION
      ?auto_40173 - CITY
      ?auto_40174 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40170 ?auto_40169 ) ) ( not ( = ?auto_40171 ?auto_40169 ) ) ( not ( = ?auto_40171 ?auto_40170 ) ) ( not ( = ?auto_40169 ?auto_40175 ) ) ( IN-CITY ?auto_40172 ?auto_40173 ) ( IN-CITY ?auto_40168 ?auto_40173 ) ( not ( = ?auto_40168 ?auto_40172 ) ) ( OBJ-AT ?auto_40175 ?auto_40168 ) ( OBJ-AT ?auto_40169 ?auto_40172 ) ( not ( = ?auto_40171 ?auto_40175 ) ) ( TRUCK-AT ?auto_40174 ?auto_40172 ) ( OBJ-AT ?auto_40171 ?auto_40172 ) ( OBJ-AT ?auto_40170 ?auto_40168 ) ( not ( = ?auto_40170 ?auto_40175 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40175 ?auto_40169 ?auto_40168 )
      ( DELIVER-3PKG-VERIFY ?auto_40169 ?auto_40170 ?auto_40171 ?auto_40168 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_40186 - OBJ
      ?auto_40187 - OBJ
      ?auto_40188 - OBJ
      ?auto_40185 - LOCATION
    )
    :vars
    (
      ?auto_40189 - LOCATION
      ?auto_40190 - CITY
      ?auto_40191 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40187 ?auto_40186 ) ) ( not ( = ?auto_40188 ?auto_40186 ) ) ( not ( = ?auto_40188 ?auto_40187 ) ) ( IN-CITY ?auto_40189 ?auto_40190 ) ( IN-CITY ?auto_40185 ?auto_40190 ) ( not ( = ?auto_40185 ?auto_40189 ) ) ( OBJ-AT ?auto_40188 ?auto_40185 ) ( OBJ-AT ?auto_40186 ?auto_40189 ) ( TRUCK-AT ?auto_40191 ?auto_40189 ) ( OBJ-AT ?auto_40187 ?auto_40189 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40188 ?auto_40186 ?auto_40185 )
      ( DELIVER-3PKG-VERIFY ?auto_40186 ?auto_40187 ?auto_40188 ?auto_40185 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_40193 - OBJ
      ?auto_40194 - OBJ
      ?auto_40195 - OBJ
      ?auto_40192 - LOCATION
    )
    :vars
    (
      ?auto_40199 - OBJ
      ?auto_40196 - LOCATION
      ?auto_40197 - CITY
      ?auto_40198 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40194 ?auto_40193 ) ) ( not ( = ?auto_40195 ?auto_40193 ) ) ( not ( = ?auto_40195 ?auto_40194 ) ) ( not ( = ?auto_40193 ?auto_40199 ) ) ( IN-CITY ?auto_40196 ?auto_40197 ) ( IN-CITY ?auto_40192 ?auto_40197 ) ( not ( = ?auto_40192 ?auto_40196 ) ) ( OBJ-AT ?auto_40199 ?auto_40192 ) ( OBJ-AT ?auto_40193 ?auto_40196 ) ( not ( = ?auto_40194 ?auto_40199 ) ) ( TRUCK-AT ?auto_40198 ?auto_40196 ) ( OBJ-AT ?auto_40194 ?auto_40196 ) ( OBJ-AT ?auto_40195 ?auto_40192 ) ( not ( = ?auto_40195 ?auto_40199 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40199 ?auto_40193 ?auto_40192 )
      ( DELIVER-3PKG-VERIFY ?auto_40193 ?auto_40194 ?auto_40195 ?auto_40192 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_40330 - OBJ
      ?auto_40331 - OBJ
      ?auto_40332 - OBJ
      ?auto_40333 - OBJ
      ?auto_40329 - LOCATION
    )
    :vars
    (
      ?auto_40334 - LOCATION
      ?auto_40335 - CITY
      ?auto_40336 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40331 ?auto_40330 ) ) ( not ( = ?auto_40332 ?auto_40330 ) ) ( not ( = ?auto_40332 ?auto_40331 ) ) ( not ( = ?auto_40333 ?auto_40330 ) ) ( not ( = ?auto_40333 ?auto_40331 ) ) ( not ( = ?auto_40333 ?auto_40332 ) ) ( IN-CITY ?auto_40334 ?auto_40335 ) ( IN-CITY ?auto_40329 ?auto_40335 ) ( not ( = ?auto_40329 ?auto_40334 ) ) ( OBJ-AT ?auto_40330 ?auto_40329 ) ( OBJ-AT ?auto_40333 ?auto_40334 ) ( TRUCK-AT ?auto_40336 ?auto_40334 ) ( OBJ-AT ?auto_40332 ?auto_40334 ) ( OBJ-AT ?auto_40331 ?auto_40329 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40330 ?auto_40333 ?auto_40329 )
      ( DELIVER-4PKG-VERIFY ?auto_40330 ?auto_40331 ?auto_40332 ?auto_40333 ?auto_40329 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_40356 - OBJ
      ?auto_40357 - OBJ
      ?auto_40358 - OBJ
      ?auto_40359 - OBJ
      ?auto_40355 - LOCATION
    )
    :vars
    (
      ?auto_40360 - LOCATION
      ?auto_40361 - CITY
      ?auto_40362 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40357 ?auto_40356 ) ) ( not ( = ?auto_40358 ?auto_40356 ) ) ( not ( = ?auto_40358 ?auto_40357 ) ) ( not ( = ?auto_40359 ?auto_40356 ) ) ( not ( = ?auto_40359 ?auto_40357 ) ) ( not ( = ?auto_40359 ?auto_40358 ) ) ( IN-CITY ?auto_40360 ?auto_40361 ) ( IN-CITY ?auto_40355 ?auto_40361 ) ( not ( = ?auto_40355 ?auto_40360 ) ) ( OBJ-AT ?auto_40356 ?auto_40355 ) ( OBJ-AT ?auto_40358 ?auto_40360 ) ( TRUCK-AT ?auto_40362 ?auto_40360 ) ( OBJ-AT ?auto_40359 ?auto_40360 ) ( OBJ-AT ?auto_40357 ?auto_40355 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40356 ?auto_40358 ?auto_40355 )
      ( DELIVER-4PKG-VERIFY ?auto_40356 ?auto_40357 ?auto_40358 ?auto_40359 ?auto_40355 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_40381 - OBJ
      ?auto_40382 - OBJ
      ?auto_40383 - OBJ
      ?auto_40384 - OBJ
      ?auto_40380 - LOCATION
    )
    :vars
    (
      ?auto_40385 - LOCATION
      ?auto_40386 - CITY
      ?auto_40387 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40382 ?auto_40381 ) ) ( not ( = ?auto_40383 ?auto_40381 ) ) ( not ( = ?auto_40383 ?auto_40382 ) ) ( not ( = ?auto_40384 ?auto_40381 ) ) ( not ( = ?auto_40384 ?auto_40382 ) ) ( not ( = ?auto_40384 ?auto_40383 ) ) ( IN-CITY ?auto_40385 ?auto_40386 ) ( IN-CITY ?auto_40380 ?auto_40386 ) ( not ( = ?auto_40380 ?auto_40385 ) ) ( OBJ-AT ?auto_40381 ?auto_40380 ) ( OBJ-AT ?auto_40384 ?auto_40385 ) ( TRUCK-AT ?auto_40387 ?auto_40385 ) ( OBJ-AT ?auto_40382 ?auto_40385 ) ( OBJ-AT ?auto_40383 ?auto_40380 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40381 ?auto_40384 ?auto_40380 )
      ( DELIVER-4PKG-VERIFY ?auto_40381 ?auto_40382 ?auto_40383 ?auto_40384 ?auto_40380 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_40405 - OBJ
      ?auto_40406 - OBJ
      ?auto_40407 - OBJ
      ?auto_40408 - OBJ
      ?auto_40404 - LOCATION
    )
    :vars
    (
      ?auto_40409 - LOCATION
      ?auto_40410 - CITY
      ?auto_40411 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40406 ?auto_40405 ) ) ( not ( = ?auto_40407 ?auto_40405 ) ) ( not ( = ?auto_40407 ?auto_40406 ) ) ( not ( = ?auto_40408 ?auto_40405 ) ) ( not ( = ?auto_40408 ?auto_40406 ) ) ( not ( = ?auto_40408 ?auto_40407 ) ) ( IN-CITY ?auto_40409 ?auto_40410 ) ( IN-CITY ?auto_40404 ?auto_40410 ) ( not ( = ?auto_40404 ?auto_40409 ) ) ( OBJ-AT ?auto_40405 ?auto_40404 ) ( OBJ-AT ?auto_40407 ?auto_40409 ) ( TRUCK-AT ?auto_40411 ?auto_40409 ) ( OBJ-AT ?auto_40406 ?auto_40409 ) ( OBJ-AT ?auto_40408 ?auto_40404 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40405 ?auto_40407 ?auto_40404 )
      ( DELIVER-4PKG-VERIFY ?auto_40405 ?auto_40406 ?auto_40407 ?auto_40408 ?auto_40404 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_40482 - OBJ
      ?auto_40483 - OBJ
      ?auto_40484 - OBJ
      ?auto_40485 - OBJ
      ?auto_40481 - LOCATION
    )
    :vars
    (
      ?auto_40486 - LOCATION
      ?auto_40487 - CITY
      ?auto_40488 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40483 ?auto_40482 ) ) ( not ( = ?auto_40484 ?auto_40482 ) ) ( not ( = ?auto_40484 ?auto_40483 ) ) ( not ( = ?auto_40485 ?auto_40482 ) ) ( not ( = ?auto_40485 ?auto_40483 ) ) ( not ( = ?auto_40485 ?auto_40484 ) ) ( IN-CITY ?auto_40486 ?auto_40487 ) ( IN-CITY ?auto_40481 ?auto_40487 ) ( not ( = ?auto_40481 ?auto_40486 ) ) ( OBJ-AT ?auto_40482 ?auto_40481 ) ( OBJ-AT ?auto_40483 ?auto_40486 ) ( TRUCK-AT ?auto_40488 ?auto_40486 ) ( OBJ-AT ?auto_40485 ?auto_40486 ) ( OBJ-AT ?auto_40484 ?auto_40481 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40482 ?auto_40483 ?auto_40481 )
      ( DELIVER-4PKG-VERIFY ?auto_40482 ?auto_40483 ?auto_40484 ?auto_40485 ?auto_40481 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_40507 - OBJ
      ?auto_40508 - OBJ
      ?auto_40509 - OBJ
      ?auto_40510 - OBJ
      ?auto_40506 - LOCATION
    )
    :vars
    (
      ?auto_40511 - LOCATION
      ?auto_40512 - CITY
      ?auto_40513 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40508 ?auto_40507 ) ) ( not ( = ?auto_40509 ?auto_40507 ) ) ( not ( = ?auto_40509 ?auto_40508 ) ) ( not ( = ?auto_40510 ?auto_40507 ) ) ( not ( = ?auto_40510 ?auto_40508 ) ) ( not ( = ?auto_40510 ?auto_40509 ) ) ( IN-CITY ?auto_40511 ?auto_40512 ) ( IN-CITY ?auto_40506 ?auto_40512 ) ( not ( = ?auto_40506 ?auto_40511 ) ) ( OBJ-AT ?auto_40507 ?auto_40506 ) ( OBJ-AT ?auto_40508 ?auto_40511 ) ( TRUCK-AT ?auto_40513 ?auto_40511 ) ( OBJ-AT ?auto_40509 ?auto_40511 ) ( OBJ-AT ?auto_40510 ?auto_40506 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40507 ?auto_40508 ?auto_40506 )
      ( DELIVER-4PKG-VERIFY ?auto_40507 ?auto_40508 ?auto_40509 ?auto_40510 ?auto_40506 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_40584 - OBJ
      ?auto_40585 - OBJ
      ?auto_40586 - OBJ
      ?auto_40587 - OBJ
      ?auto_40583 - LOCATION
    )
    :vars
    (
      ?auto_40588 - LOCATION
      ?auto_40589 - CITY
      ?auto_40590 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40585 ?auto_40584 ) ) ( not ( = ?auto_40586 ?auto_40584 ) ) ( not ( = ?auto_40586 ?auto_40585 ) ) ( not ( = ?auto_40587 ?auto_40584 ) ) ( not ( = ?auto_40587 ?auto_40585 ) ) ( not ( = ?auto_40587 ?auto_40586 ) ) ( IN-CITY ?auto_40588 ?auto_40589 ) ( IN-CITY ?auto_40583 ?auto_40589 ) ( not ( = ?auto_40583 ?auto_40588 ) ) ( OBJ-AT ?auto_40585 ?auto_40583 ) ( OBJ-AT ?auto_40587 ?auto_40588 ) ( TRUCK-AT ?auto_40590 ?auto_40588 ) ( OBJ-AT ?auto_40586 ?auto_40588 ) ( OBJ-AT ?auto_40584 ?auto_40583 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40585 ?auto_40587 ?auto_40583 )
      ( DELIVER-4PKG-VERIFY ?auto_40584 ?auto_40585 ?auto_40586 ?auto_40587 ?auto_40583 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_40610 - OBJ
      ?auto_40611 - OBJ
      ?auto_40612 - OBJ
      ?auto_40613 - OBJ
      ?auto_40609 - LOCATION
    )
    :vars
    (
      ?auto_40614 - LOCATION
      ?auto_40615 - CITY
      ?auto_40616 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40611 ?auto_40610 ) ) ( not ( = ?auto_40612 ?auto_40610 ) ) ( not ( = ?auto_40612 ?auto_40611 ) ) ( not ( = ?auto_40613 ?auto_40610 ) ) ( not ( = ?auto_40613 ?auto_40611 ) ) ( not ( = ?auto_40613 ?auto_40612 ) ) ( IN-CITY ?auto_40614 ?auto_40615 ) ( IN-CITY ?auto_40609 ?auto_40615 ) ( not ( = ?auto_40609 ?auto_40614 ) ) ( OBJ-AT ?auto_40611 ?auto_40609 ) ( OBJ-AT ?auto_40612 ?auto_40614 ) ( TRUCK-AT ?auto_40616 ?auto_40614 ) ( OBJ-AT ?auto_40613 ?auto_40614 ) ( OBJ-AT ?auto_40610 ?auto_40609 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40611 ?auto_40612 ?auto_40609 )
      ( DELIVER-4PKG-VERIFY ?auto_40610 ?auto_40611 ?auto_40612 ?auto_40613 ?auto_40609 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_40693 - OBJ
      ?auto_40694 - OBJ
      ?auto_40695 - OBJ
      ?auto_40696 - OBJ
      ?auto_40692 - LOCATION
    )
    :vars
    (
      ?auto_40697 - LOCATION
      ?auto_40698 - CITY
      ?auto_40699 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40694 ?auto_40693 ) ) ( not ( = ?auto_40695 ?auto_40693 ) ) ( not ( = ?auto_40695 ?auto_40694 ) ) ( not ( = ?auto_40696 ?auto_40693 ) ) ( not ( = ?auto_40696 ?auto_40694 ) ) ( not ( = ?auto_40696 ?auto_40695 ) ) ( IN-CITY ?auto_40697 ?auto_40698 ) ( IN-CITY ?auto_40692 ?auto_40698 ) ( not ( = ?auto_40692 ?auto_40697 ) ) ( OBJ-AT ?auto_40695 ?auto_40692 ) ( OBJ-AT ?auto_40696 ?auto_40697 ) ( TRUCK-AT ?auto_40699 ?auto_40697 ) ( OBJ-AT ?auto_40694 ?auto_40697 ) ( OBJ-AT ?auto_40693 ?auto_40692 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40695 ?auto_40696 ?auto_40692 )
      ( DELIVER-4PKG-VERIFY ?auto_40693 ?auto_40694 ?auto_40695 ?auto_40696 ?auto_40692 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_40719 - OBJ
      ?auto_40720 - OBJ
      ?auto_40721 - OBJ
      ?auto_40722 - OBJ
      ?auto_40718 - LOCATION
    )
    :vars
    (
      ?auto_40723 - LOCATION
      ?auto_40724 - CITY
      ?auto_40725 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40720 ?auto_40719 ) ) ( not ( = ?auto_40721 ?auto_40719 ) ) ( not ( = ?auto_40721 ?auto_40720 ) ) ( not ( = ?auto_40722 ?auto_40719 ) ) ( not ( = ?auto_40722 ?auto_40720 ) ) ( not ( = ?auto_40722 ?auto_40721 ) ) ( IN-CITY ?auto_40723 ?auto_40724 ) ( IN-CITY ?auto_40718 ?auto_40724 ) ( not ( = ?auto_40718 ?auto_40723 ) ) ( OBJ-AT ?auto_40722 ?auto_40718 ) ( OBJ-AT ?auto_40721 ?auto_40723 ) ( TRUCK-AT ?auto_40725 ?auto_40723 ) ( OBJ-AT ?auto_40720 ?auto_40723 ) ( OBJ-AT ?auto_40719 ?auto_40718 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40722 ?auto_40721 ?auto_40718 )
      ( DELIVER-4PKG-VERIFY ?auto_40719 ?auto_40720 ?auto_40721 ?auto_40722 ?auto_40718 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_40772 - OBJ
      ?auto_40773 - OBJ
      ?auto_40774 - OBJ
      ?auto_40775 - OBJ
      ?auto_40771 - LOCATION
    )
    :vars
    (
      ?auto_40776 - LOCATION
      ?auto_40777 - CITY
      ?auto_40778 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40773 ?auto_40772 ) ) ( not ( = ?auto_40774 ?auto_40772 ) ) ( not ( = ?auto_40774 ?auto_40773 ) ) ( not ( = ?auto_40775 ?auto_40772 ) ) ( not ( = ?auto_40775 ?auto_40773 ) ) ( not ( = ?auto_40775 ?auto_40774 ) ) ( IN-CITY ?auto_40776 ?auto_40777 ) ( IN-CITY ?auto_40771 ?auto_40777 ) ( not ( = ?auto_40771 ?auto_40776 ) ) ( OBJ-AT ?auto_40774 ?auto_40771 ) ( OBJ-AT ?auto_40773 ?auto_40776 ) ( TRUCK-AT ?auto_40778 ?auto_40776 ) ( OBJ-AT ?auto_40775 ?auto_40776 ) ( OBJ-AT ?auto_40772 ?auto_40771 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40774 ?auto_40773 ?auto_40771 )
      ( DELIVER-4PKG-VERIFY ?auto_40772 ?auto_40773 ?auto_40774 ?auto_40775 ?auto_40771 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_40827 - OBJ
      ?auto_40828 - OBJ
      ?auto_40829 - OBJ
      ?auto_40830 - OBJ
      ?auto_40826 - LOCATION
    )
    :vars
    (
      ?auto_40831 - LOCATION
      ?auto_40832 - CITY
      ?auto_40833 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40828 ?auto_40827 ) ) ( not ( = ?auto_40829 ?auto_40827 ) ) ( not ( = ?auto_40829 ?auto_40828 ) ) ( not ( = ?auto_40830 ?auto_40827 ) ) ( not ( = ?auto_40830 ?auto_40828 ) ) ( not ( = ?auto_40830 ?auto_40829 ) ) ( IN-CITY ?auto_40831 ?auto_40832 ) ( IN-CITY ?auto_40826 ?auto_40832 ) ( not ( = ?auto_40826 ?auto_40831 ) ) ( OBJ-AT ?auto_40830 ?auto_40826 ) ( OBJ-AT ?auto_40828 ?auto_40831 ) ( TRUCK-AT ?auto_40833 ?auto_40831 ) ( OBJ-AT ?auto_40829 ?auto_40831 ) ( OBJ-AT ?auto_40827 ?auto_40826 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40830 ?auto_40828 ?auto_40826 )
      ( DELIVER-4PKG-VERIFY ?auto_40827 ?auto_40828 ?auto_40829 ?auto_40830 ?auto_40826 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_40908 - OBJ
      ?auto_40909 - OBJ
      ?auto_40910 - OBJ
      ?auto_40911 - OBJ
      ?auto_40907 - LOCATION
    )
    :vars
    (
      ?auto_40912 - LOCATION
      ?auto_40913 - CITY
      ?auto_40914 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40909 ?auto_40908 ) ) ( not ( = ?auto_40910 ?auto_40908 ) ) ( not ( = ?auto_40910 ?auto_40909 ) ) ( not ( = ?auto_40911 ?auto_40908 ) ) ( not ( = ?auto_40911 ?auto_40909 ) ) ( not ( = ?auto_40911 ?auto_40910 ) ) ( IN-CITY ?auto_40912 ?auto_40913 ) ( IN-CITY ?auto_40907 ?auto_40913 ) ( not ( = ?auto_40907 ?auto_40912 ) ) ( OBJ-AT ?auto_40909 ?auto_40907 ) ( OBJ-AT ?auto_40911 ?auto_40912 ) ( TRUCK-AT ?auto_40914 ?auto_40912 ) ( OBJ-AT ?auto_40908 ?auto_40912 ) ( OBJ-AT ?auto_40910 ?auto_40907 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40909 ?auto_40911 ?auto_40907 )
      ( DELIVER-4PKG-VERIFY ?auto_40908 ?auto_40909 ?auto_40910 ?auto_40911 ?auto_40907 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_40932 - OBJ
      ?auto_40933 - OBJ
      ?auto_40934 - OBJ
      ?auto_40935 - OBJ
      ?auto_40931 - LOCATION
    )
    :vars
    (
      ?auto_40936 - LOCATION
      ?auto_40937 - CITY
      ?auto_40938 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40933 ?auto_40932 ) ) ( not ( = ?auto_40934 ?auto_40932 ) ) ( not ( = ?auto_40934 ?auto_40933 ) ) ( not ( = ?auto_40935 ?auto_40932 ) ) ( not ( = ?auto_40935 ?auto_40933 ) ) ( not ( = ?auto_40935 ?auto_40934 ) ) ( IN-CITY ?auto_40936 ?auto_40937 ) ( IN-CITY ?auto_40931 ?auto_40937 ) ( not ( = ?auto_40931 ?auto_40936 ) ) ( OBJ-AT ?auto_40933 ?auto_40931 ) ( OBJ-AT ?auto_40934 ?auto_40936 ) ( TRUCK-AT ?auto_40938 ?auto_40936 ) ( OBJ-AT ?auto_40932 ?auto_40936 ) ( OBJ-AT ?auto_40935 ?auto_40931 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40933 ?auto_40934 ?auto_40931 )
      ( DELIVER-4PKG-VERIFY ?auto_40932 ?auto_40933 ?auto_40934 ?auto_40935 ?auto_40931 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_40956 - OBJ
      ?auto_40957 - OBJ
      ?auto_40958 - OBJ
      ?auto_40959 - OBJ
      ?auto_40955 - LOCATION
    )
    :vars
    (
      ?auto_40960 - LOCATION
      ?auto_40961 - CITY
      ?auto_40962 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40957 ?auto_40956 ) ) ( not ( = ?auto_40958 ?auto_40956 ) ) ( not ( = ?auto_40958 ?auto_40957 ) ) ( not ( = ?auto_40959 ?auto_40956 ) ) ( not ( = ?auto_40959 ?auto_40957 ) ) ( not ( = ?auto_40959 ?auto_40958 ) ) ( IN-CITY ?auto_40960 ?auto_40961 ) ( IN-CITY ?auto_40955 ?auto_40961 ) ( not ( = ?auto_40955 ?auto_40960 ) ) ( OBJ-AT ?auto_40958 ?auto_40955 ) ( OBJ-AT ?auto_40959 ?auto_40960 ) ( TRUCK-AT ?auto_40962 ?auto_40960 ) ( OBJ-AT ?auto_40956 ?auto_40960 ) ( OBJ-AT ?auto_40957 ?auto_40955 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40958 ?auto_40959 ?auto_40955 )
      ( DELIVER-4PKG-VERIFY ?auto_40956 ?auto_40957 ?auto_40958 ?auto_40959 ?auto_40955 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_40982 - OBJ
      ?auto_40983 - OBJ
      ?auto_40984 - OBJ
      ?auto_40985 - OBJ
      ?auto_40981 - LOCATION
    )
    :vars
    (
      ?auto_40986 - LOCATION
      ?auto_40987 - CITY
      ?auto_40988 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_40983 ?auto_40982 ) ) ( not ( = ?auto_40984 ?auto_40982 ) ) ( not ( = ?auto_40984 ?auto_40983 ) ) ( not ( = ?auto_40985 ?auto_40982 ) ) ( not ( = ?auto_40985 ?auto_40983 ) ) ( not ( = ?auto_40985 ?auto_40984 ) ) ( IN-CITY ?auto_40986 ?auto_40987 ) ( IN-CITY ?auto_40981 ?auto_40987 ) ( not ( = ?auto_40981 ?auto_40986 ) ) ( OBJ-AT ?auto_40985 ?auto_40981 ) ( OBJ-AT ?auto_40984 ?auto_40986 ) ( TRUCK-AT ?auto_40988 ?auto_40986 ) ( OBJ-AT ?auto_40982 ?auto_40986 ) ( OBJ-AT ?auto_40983 ?auto_40981 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_40985 ?auto_40984 ?auto_40981 )
      ( DELIVER-4PKG-VERIFY ?auto_40982 ?auto_40983 ?auto_40984 ?auto_40985 ?auto_40981 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_41086 - OBJ
      ?auto_41087 - OBJ
      ?auto_41088 - OBJ
      ?auto_41089 - OBJ
      ?auto_41085 - LOCATION
    )
    :vars
    (
      ?auto_41090 - LOCATION
      ?auto_41091 - CITY
      ?auto_41092 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41087 ?auto_41086 ) ) ( not ( = ?auto_41088 ?auto_41086 ) ) ( not ( = ?auto_41088 ?auto_41087 ) ) ( not ( = ?auto_41089 ?auto_41086 ) ) ( not ( = ?auto_41089 ?auto_41087 ) ) ( not ( = ?auto_41089 ?auto_41088 ) ) ( IN-CITY ?auto_41090 ?auto_41091 ) ( IN-CITY ?auto_41085 ?auto_41091 ) ( not ( = ?auto_41085 ?auto_41090 ) ) ( OBJ-AT ?auto_41088 ?auto_41085 ) ( OBJ-AT ?auto_41087 ?auto_41090 ) ( TRUCK-AT ?auto_41092 ?auto_41090 ) ( OBJ-AT ?auto_41086 ?auto_41090 ) ( OBJ-AT ?auto_41089 ?auto_41085 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41088 ?auto_41087 ?auto_41085 )
      ( DELIVER-4PKG-VERIFY ?auto_41086 ?auto_41087 ?auto_41088 ?auto_41089 ?auto_41085 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_41110 - OBJ
      ?auto_41111 - OBJ
      ?auto_41112 - OBJ
      ?auto_41113 - OBJ
      ?auto_41109 - LOCATION
    )
    :vars
    (
      ?auto_41114 - LOCATION
      ?auto_41115 - CITY
      ?auto_41116 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41111 ?auto_41110 ) ) ( not ( = ?auto_41112 ?auto_41110 ) ) ( not ( = ?auto_41112 ?auto_41111 ) ) ( not ( = ?auto_41113 ?auto_41110 ) ) ( not ( = ?auto_41113 ?auto_41111 ) ) ( not ( = ?auto_41113 ?auto_41112 ) ) ( IN-CITY ?auto_41114 ?auto_41115 ) ( IN-CITY ?auto_41109 ?auto_41115 ) ( not ( = ?auto_41109 ?auto_41114 ) ) ( OBJ-AT ?auto_41113 ?auto_41109 ) ( OBJ-AT ?auto_41111 ?auto_41114 ) ( TRUCK-AT ?auto_41116 ?auto_41114 ) ( OBJ-AT ?auto_41110 ?auto_41114 ) ( OBJ-AT ?auto_41112 ?auto_41109 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41113 ?auto_41111 ?auto_41109 )
      ( DELIVER-4PKG-VERIFY ?auto_41110 ?auto_41111 ?auto_41112 ?auto_41113 ?auto_41109 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_41268 - OBJ
      ?auto_41269 - OBJ
      ?auto_41270 - OBJ
      ?auto_41271 - OBJ
      ?auto_41267 - LOCATION
    )
    :vars
    (
      ?auto_41272 - LOCATION
      ?auto_41273 - CITY
      ?auto_41274 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41269 ?auto_41268 ) ) ( not ( = ?auto_41270 ?auto_41268 ) ) ( not ( = ?auto_41270 ?auto_41269 ) ) ( not ( = ?auto_41271 ?auto_41268 ) ) ( not ( = ?auto_41271 ?auto_41269 ) ) ( not ( = ?auto_41271 ?auto_41270 ) ) ( IN-CITY ?auto_41272 ?auto_41273 ) ( IN-CITY ?auto_41267 ?auto_41273 ) ( not ( = ?auto_41267 ?auto_41272 ) ) ( OBJ-AT ?auto_41269 ?auto_41267 ) ( OBJ-AT ?auto_41268 ?auto_41272 ) ( TRUCK-AT ?auto_41274 ?auto_41272 ) ( OBJ-AT ?auto_41271 ?auto_41272 ) ( OBJ-AT ?auto_41270 ?auto_41267 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41269 ?auto_41268 ?auto_41267 )
      ( DELIVER-4PKG-VERIFY ?auto_41268 ?auto_41269 ?auto_41270 ?auto_41271 ?auto_41267 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_41293 - OBJ
      ?auto_41294 - OBJ
      ?auto_41295 - OBJ
      ?auto_41296 - OBJ
      ?auto_41292 - LOCATION
    )
    :vars
    (
      ?auto_41297 - LOCATION
      ?auto_41298 - CITY
      ?auto_41299 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41294 ?auto_41293 ) ) ( not ( = ?auto_41295 ?auto_41293 ) ) ( not ( = ?auto_41295 ?auto_41294 ) ) ( not ( = ?auto_41296 ?auto_41293 ) ) ( not ( = ?auto_41296 ?auto_41294 ) ) ( not ( = ?auto_41296 ?auto_41295 ) ) ( IN-CITY ?auto_41297 ?auto_41298 ) ( IN-CITY ?auto_41292 ?auto_41298 ) ( not ( = ?auto_41292 ?auto_41297 ) ) ( OBJ-AT ?auto_41294 ?auto_41292 ) ( OBJ-AT ?auto_41293 ?auto_41297 ) ( TRUCK-AT ?auto_41299 ?auto_41297 ) ( OBJ-AT ?auto_41295 ?auto_41297 ) ( OBJ-AT ?auto_41296 ?auto_41292 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41294 ?auto_41293 ?auto_41292 )
      ( DELIVER-4PKG-VERIFY ?auto_41293 ?auto_41294 ?auto_41295 ?auto_41296 ?auto_41292 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_41370 - OBJ
      ?auto_41371 - OBJ
      ?auto_41372 - OBJ
      ?auto_41373 - OBJ
      ?auto_41369 - LOCATION
    )
    :vars
    (
      ?auto_41374 - LOCATION
      ?auto_41375 - CITY
      ?auto_41376 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41371 ?auto_41370 ) ) ( not ( = ?auto_41372 ?auto_41370 ) ) ( not ( = ?auto_41372 ?auto_41371 ) ) ( not ( = ?auto_41373 ?auto_41370 ) ) ( not ( = ?auto_41373 ?auto_41371 ) ) ( not ( = ?auto_41373 ?auto_41372 ) ) ( IN-CITY ?auto_41374 ?auto_41375 ) ( IN-CITY ?auto_41369 ?auto_41375 ) ( not ( = ?auto_41369 ?auto_41374 ) ) ( OBJ-AT ?auto_41372 ?auto_41369 ) ( OBJ-AT ?auto_41370 ?auto_41374 ) ( TRUCK-AT ?auto_41376 ?auto_41374 ) ( OBJ-AT ?auto_41373 ?auto_41374 ) ( OBJ-AT ?auto_41371 ?auto_41369 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41372 ?auto_41370 ?auto_41369 )
      ( DELIVER-4PKG-VERIFY ?auto_41370 ?auto_41371 ?auto_41372 ?auto_41373 ?auto_41369 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_41425 - OBJ
      ?auto_41426 - OBJ
      ?auto_41427 - OBJ
      ?auto_41428 - OBJ
      ?auto_41424 - LOCATION
    )
    :vars
    (
      ?auto_41429 - LOCATION
      ?auto_41430 - CITY
      ?auto_41431 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41426 ?auto_41425 ) ) ( not ( = ?auto_41427 ?auto_41425 ) ) ( not ( = ?auto_41427 ?auto_41426 ) ) ( not ( = ?auto_41428 ?auto_41425 ) ) ( not ( = ?auto_41428 ?auto_41426 ) ) ( not ( = ?auto_41428 ?auto_41427 ) ) ( IN-CITY ?auto_41429 ?auto_41430 ) ( IN-CITY ?auto_41424 ?auto_41430 ) ( not ( = ?auto_41424 ?auto_41429 ) ) ( OBJ-AT ?auto_41428 ?auto_41424 ) ( OBJ-AT ?auto_41425 ?auto_41429 ) ( TRUCK-AT ?auto_41431 ?auto_41429 ) ( OBJ-AT ?auto_41427 ?auto_41429 ) ( OBJ-AT ?auto_41426 ?auto_41424 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41428 ?auto_41425 ?auto_41424 )
      ( DELIVER-4PKG-VERIFY ?auto_41425 ?auto_41426 ?auto_41427 ?auto_41428 ?auto_41424 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_41506 - OBJ
      ?auto_41507 - OBJ
      ?auto_41508 - OBJ
      ?auto_41509 - OBJ
      ?auto_41505 - LOCATION
    )
    :vars
    (
      ?auto_41510 - LOCATION
      ?auto_41511 - CITY
      ?auto_41512 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41507 ?auto_41506 ) ) ( not ( = ?auto_41508 ?auto_41506 ) ) ( not ( = ?auto_41508 ?auto_41507 ) ) ( not ( = ?auto_41509 ?auto_41506 ) ) ( not ( = ?auto_41509 ?auto_41507 ) ) ( not ( = ?auto_41509 ?auto_41508 ) ) ( IN-CITY ?auto_41510 ?auto_41511 ) ( IN-CITY ?auto_41505 ?auto_41511 ) ( not ( = ?auto_41505 ?auto_41510 ) ) ( OBJ-AT ?auto_41508 ?auto_41505 ) ( OBJ-AT ?auto_41506 ?auto_41510 ) ( TRUCK-AT ?auto_41512 ?auto_41510 ) ( OBJ-AT ?auto_41507 ?auto_41510 ) ( OBJ-AT ?auto_41509 ?auto_41505 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41508 ?auto_41506 ?auto_41505 )
      ( DELIVER-4PKG-VERIFY ?auto_41506 ?auto_41507 ?auto_41508 ?auto_41509 ?auto_41505 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_41530 - OBJ
      ?auto_41531 - OBJ
      ?auto_41532 - OBJ
      ?auto_41533 - OBJ
      ?auto_41529 - LOCATION
    )
    :vars
    (
      ?auto_41534 - LOCATION
      ?auto_41535 - CITY
      ?auto_41536 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41531 ?auto_41530 ) ) ( not ( = ?auto_41532 ?auto_41530 ) ) ( not ( = ?auto_41532 ?auto_41531 ) ) ( not ( = ?auto_41533 ?auto_41530 ) ) ( not ( = ?auto_41533 ?auto_41531 ) ) ( not ( = ?auto_41533 ?auto_41532 ) ) ( IN-CITY ?auto_41534 ?auto_41535 ) ( IN-CITY ?auto_41529 ?auto_41535 ) ( not ( = ?auto_41529 ?auto_41534 ) ) ( OBJ-AT ?auto_41533 ?auto_41529 ) ( OBJ-AT ?auto_41530 ?auto_41534 ) ( TRUCK-AT ?auto_41536 ?auto_41534 ) ( OBJ-AT ?auto_41531 ?auto_41534 ) ( OBJ-AT ?auto_41532 ?auto_41529 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41533 ?auto_41530 ?auto_41529 )
      ( DELIVER-4PKG-VERIFY ?auto_41530 ?auto_41531 ?auto_41532 ?auto_41533 ?auto_41529 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_41781 - OBJ
      ?auto_41780 - LOCATION
    )
    :vars
    (
      ?auto_41786 - OBJ
      ?auto_41782 - LOCATION
      ?auto_41783 - CITY
      ?auto_41785 - OBJ
      ?auto_41784 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41781 ?auto_41786 ) ) ( IN-CITY ?auto_41782 ?auto_41783 ) ( IN-CITY ?auto_41780 ?auto_41783 ) ( not ( = ?auto_41780 ?auto_41782 ) ) ( OBJ-AT ?auto_41786 ?auto_41780 ) ( OBJ-AT ?auto_41781 ?auto_41782 ) ( not ( = ?auto_41785 ?auto_41786 ) ) ( not ( = ?auto_41781 ?auto_41785 ) ) ( OBJ-AT ?auto_41785 ?auto_41782 ) ( TRUCK-AT ?auto_41784 ?auto_41780 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_41784 ?auto_41780 ?auto_41782 ?auto_41783 )
      ( DELIVER-2PKG ?auto_41786 ?auto_41781 ?auto_41780 )
      ( DELIVER-1PKG-VERIFY ?auto_41781 ?auto_41780 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_41788 - OBJ
      ?auto_41789 - OBJ
      ?auto_41787 - LOCATION
    )
    :vars
    (
      ?auto_41793 - LOCATION
      ?auto_41790 - CITY
      ?auto_41792 - OBJ
      ?auto_41791 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41789 ?auto_41788 ) ) ( IN-CITY ?auto_41793 ?auto_41790 ) ( IN-CITY ?auto_41787 ?auto_41790 ) ( not ( = ?auto_41787 ?auto_41793 ) ) ( OBJ-AT ?auto_41788 ?auto_41787 ) ( OBJ-AT ?auto_41789 ?auto_41793 ) ( not ( = ?auto_41792 ?auto_41788 ) ) ( not ( = ?auto_41789 ?auto_41792 ) ) ( OBJ-AT ?auto_41792 ?auto_41793 ) ( TRUCK-AT ?auto_41791 ?auto_41787 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_41789 ?auto_41787 )
      ( DELIVER-2PKG-VERIFY ?auto_41788 ?auto_41789 ?auto_41787 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_41795 - OBJ
      ?auto_41796 - OBJ
      ?auto_41794 - LOCATION
    )
    :vars
    (
      ?auto_41801 - OBJ
      ?auto_41799 - LOCATION
      ?auto_41797 - CITY
      ?auto_41798 - OBJ
      ?auto_41800 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41796 ?auto_41795 ) ) ( not ( = ?auto_41796 ?auto_41801 ) ) ( IN-CITY ?auto_41799 ?auto_41797 ) ( IN-CITY ?auto_41794 ?auto_41797 ) ( not ( = ?auto_41794 ?auto_41799 ) ) ( OBJ-AT ?auto_41801 ?auto_41794 ) ( OBJ-AT ?auto_41796 ?auto_41799 ) ( not ( = ?auto_41798 ?auto_41801 ) ) ( not ( = ?auto_41796 ?auto_41798 ) ) ( OBJ-AT ?auto_41798 ?auto_41799 ) ( TRUCK-AT ?auto_41800 ?auto_41794 ) ( OBJ-AT ?auto_41795 ?auto_41794 ) ( not ( = ?auto_41795 ?auto_41801 ) ) ( not ( = ?auto_41795 ?auto_41798 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41801 ?auto_41796 ?auto_41794 )
      ( DELIVER-2PKG-VERIFY ?auto_41795 ?auto_41796 ?auto_41794 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_41803 - OBJ
      ?auto_41804 - OBJ
      ?auto_41802 - LOCATION
    )
    :vars
    (
      ?auto_41808 - OBJ
      ?auto_41806 - LOCATION
      ?auto_41805 - CITY
      ?auto_41807 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41804 ?auto_41803 ) ) ( not ( = ?auto_41804 ?auto_41808 ) ) ( IN-CITY ?auto_41806 ?auto_41805 ) ( IN-CITY ?auto_41802 ?auto_41805 ) ( not ( = ?auto_41802 ?auto_41806 ) ) ( OBJ-AT ?auto_41808 ?auto_41802 ) ( OBJ-AT ?auto_41804 ?auto_41806 ) ( not ( = ?auto_41803 ?auto_41808 ) ) ( OBJ-AT ?auto_41803 ?auto_41806 ) ( TRUCK-AT ?auto_41807 ?auto_41802 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41808 ?auto_41804 ?auto_41802 )
      ( DELIVER-2PKG-VERIFY ?auto_41803 ?auto_41804 ?auto_41802 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_41810 - OBJ
      ?auto_41811 - OBJ
      ?auto_41809 - LOCATION
    )
    :vars
    (
      ?auto_41814 - LOCATION
      ?auto_41812 - CITY
      ?auto_41813 - OBJ
      ?auto_41815 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41811 ?auto_41810 ) ) ( IN-CITY ?auto_41814 ?auto_41812 ) ( IN-CITY ?auto_41809 ?auto_41812 ) ( not ( = ?auto_41809 ?auto_41814 ) ) ( OBJ-AT ?auto_41811 ?auto_41809 ) ( OBJ-AT ?auto_41810 ?auto_41814 ) ( not ( = ?auto_41813 ?auto_41811 ) ) ( not ( = ?auto_41810 ?auto_41813 ) ) ( OBJ-AT ?auto_41813 ?auto_41814 ) ( TRUCK-AT ?auto_41815 ?auto_41809 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41811 ?auto_41810 ?auto_41809 )
      ( DELIVER-2PKG-VERIFY ?auto_41810 ?auto_41811 ?auto_41809 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_41817 - OBJ
      ?auto_41818 - OBJ
      ?auto_41816 - LOCATION
    )
    :vars
    (
      ?auto_41823 - OBJ
      ?auto_41821 - LOCATION
      ?auto_41819 - CITY
      ?auto_41820 - OBJ
      ?auto_41822 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41818 ?auto_41817 ) ) ( not ( = ?auto_41817 ?auto_41823 ) ) ( IN-CITY ?auto_41821 ?auto_41819 ) ( IN-CITY ?auto_41816 ?auto_41819 ) ( not ( = ?auto_41816 ?auto_41821 ) ) ( OBJ-AT ?auto_41823 ?auto_41816 ) ( OBJ-AT ?auto_41817 ?auto_41821 ) ( not ( = ?auto_41820 ?auto_41823 ) ) ( not ( = ?auto_41817 ?auto_41820 ) ) ( OBJ-AT ?auto_41820 ?auto_41821 ) ( TRUCK-AT ?auto_41822 ?auto_41816 ) ( OBJ-AT ?auto_41818 ?auto_41816 ) ( not ( = ?auto_41818 ?auto_41823 ) ) ( not ( = ?auto_41818 ?auto_41820 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41823 ?auto_41817 ?auto_41816 )
      ( DELIVER-2PKG-VERIFY ?auto_41817 ?auto_41818 ?auto_41816 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_41825 - OBJ
      ?auto_41826 - OBJ
      ?auto_41824 - LOCATION
    )
    :vars
    (
      ?auto_41830 - OBJ
      ?auto_41828 - LOCATION
      ?auto_41827 - CITY
      ?auto_41829 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41826 ?auto_41825 ) ) ( not ( = ?auto_41825 ?auto_41830 ) ) ( IN-CITY ?auto_41828 ?auto_41827 ) ( IN-CITY ?auto_41824 ?auto_41827 ) ( not ( = ?auto_41824 ?auto_41828 ) ) ( OBJ-AT ?auto_41830 ?auto_41824 ) ( OBJ-AT ?auto_41825 ?auto_41828 ) ( not ( = ?auto_41826 ?auto_41830 ) ) ( OBJ-AT ?auto_41826 ?auto_41828 ) ( TRUCK-AT ?auto_41829 ?auto_41824 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41830 ?auto_41825 ?auto_41824 )
      ( DELIVER-2PKG-VERIFY ?auto_41825 ?auto_41826 ?auto_41824 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_41848 - OBJ
      ?auto_41849 - OBJ
      ?auto_41850 - OBJ
      ?auto_41847 - LOCATION
    )
    :vars
    (
      ?auto_41853 - LOCATION
      ?auto_41851 - CITY
      ?auto_41852 - OBJ
      ?auto_41854 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41849 ?auto_41848 ) ) ( not ( = ?auto_41850 ?auto_41848 ) ) ( not ( = ?auto_41850 ?auto_41849 ) ) ( IN-CITY ?auto_41853 ?auto_41851 ) ( IN-CITY ?auto_41847 ?auto_41851 ) ( not ( = ?auto_41847 ?auto_41853 ) ) ( OBJ-AT ?auto_41848 ?auto_41847 ) ( OBJ-AT ?auto_41850 ?auto_41853 ) ( not ( = ?auto_41852 ?auto_41848 ) ) ( not ( = ?auto_41850 ?auto_41852 ) ) ( OBJ-AT ?auto_41852 ?auto_41853 ) ( TRUCK-AT ?auto_41854 ?auto_41847 ) ( OBJ-AT ?auto_41849 ?auto_41847 ) ( not ( = ?auto_41849 ?auto_41852 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41848 ?auto_41850 ?auto_41847 )
      ( DELIVER-3PKG-VERIFY ?auto_41848 ?auto_41849 ?auto_41850 ?auto_41847 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_41856 - OBJ
      ?auto_41857 - OBJ
      ?auto_41858 - OBJ
      ?auto_41855 - LOCATION
    )
    :vars
    (
      ?auto_41860 - LOCATION
      ?auto_41859 - CITY
      ?auto_41861 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41857 ?auto_41856 ) ) ( not ( = ?auto_41858 ?auto_41856 ) ) ( not ( = ?auto_41858 ?auto_41857 ) ) ( IN-CITY ?auto_41860 ?auto_41859 ) ( IN-CITY ?auto_41855 ?auto_41859 ) ( not ( = ?auto_41855 ?auto_41860 ) ) ( OBJ-AT ?auto_41856 ?auto_41855 ) ( OBJ-AT ?auto_41858 ?auto_41860 ) ( OBJ-AT ?auto_41857 ?auto_41860 ) ( TRUCK-AT ?auto_41861 ?auto_41855 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41856 ?auto_41858 ?auto_41855 )
      ( DELIVER-3PKG-VERIFY ?auto_41856 ?auto_41857 ?auto_41858 ?auto_41855 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_41871 - OBJ
      ?auto_41872 - OBJ
      ?auto_41873 - OBJ
      ?auto_41870 - LOCATION
    )
    :vars
    (
      ?auto_41876 - LOCATION
      ?auto_41874 - CITY
      ?auto_41875 - OBJ
      ?auto_41877 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41872 ?auto_41871 ) ) ( not ( = ?auto_41873 ?auto_41871 ) ) ( not ( = ?auto_41873 ?auto_41872 ) ) ( IN-CITY ?auto_41876 ?auto_41874 ) ( IN-CITY ?auto_41870 ?auto_41874 ) ( not ( = ?auto_41870 ?auto_41876 ) ) ( OBJ-AT ?auto_41871 ?auto_41870 ) ( OBJ-AT ?auto_41872 ?auto_41876 ) ( not ( = ?auto_41875 ?auto_41871 ) ) ( not ( = ?auto_41872 ?auto_41875 ) ) ( OBJ-AT ?auto_41875 ?auto_41876 ) ( TRUCK-AT ?auto_41877 ?auto_41870 ) ( OBJ-AT ?auto_41873 ?auto_41870 ) ( not ( = ?auto_41873 ?auto_41875 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41871 ?auto_41872 ?auto_41870 )
      ( DELIVER-3PKG-VERIFY ?auto_41871 ?auto_41872 ?auto_41873 ?auto_41870 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_41879 - OBJ
      ?auto_41880 - OBJ
      ?auto_41881 - OBJ
      ?auto_41878 - LOCATION
    )
    :vars
    (
      ?auto_41883 - LOCATION
      ?auto_41882 - CITY
      ?auto_41884 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41880 ?auto_41879 ) ) ( not ( = ?auto_41881 ?auto_41879 ) ) ( not ( = ?auto_41881 ?auto_41880 ) ) ( IN-CITY ?auto_41883 ?auto_41882 ) ( IN-CITY ?auto_41878 ?auto_41882 ) ( not ( = ?auto_41878 ?auto_41883 ) ) ( OBJ-AT ?auto_41879 ?auto_41878 ) ( OBJ-AT ?auto_41880 ?auto_41883 ) ( OBJ-AT ?auto_41881 ?auto_41883 ) ( TRUCK-AT ?auto_41884 ?auto_41878 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41879 ?auto_41880 ?auto_41878 )
      ( DELIVER-3PKG-VERIFY ?auto_41879 ?auto_41880 ?auto_41881 ?auto_41878 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_41894 - OBJ
      ?auto_41895 - OBJ
      ?auto_41896 - OBJ
      ?auto_41893 - LOCATION
    )
    :vars
    (
      ?auto_41899 - LOCATION
      ?auto_41897 - CITY
      ?auto_41898 - OBJ
      ?auto_41900 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41895 ?auto_41894 ) ) ( not ( = ?auto_41896 ?auto_41894 ) ) ( not ( = ?auto_41896 ?auto_41895 ) ) ( IN-CITY ?auto_41899 ?auto_41897 ) ( IN-CITY ?auto_41893 ?auto_41897 ) ( not ( = ?auto_41893 ?auto_41899 ) ) ( OBJ-AT ?auto_41895 ?auto_41893 ) ( OBJ-AT ?auto_41896 ?auto_41899 ) ( not ( = ?auto_41898 ?auto_41895 ) ) ( not ( = ?auto_41896 ?auto_41898 ) ) ( OBJ-AT ?auto_41898 ?auto_41899 ) ( TRUCK-AT ?auto_41900 ?auto_41893 ) ( OBJ-AT ?auto_41894 ?auto_41893 ) ( not ( = ?auto_41894 ?auto_41898 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41895 ?auto_41896 ?auto_41893 )
      ( DELIVER-3PKG-VERIFY ?auto_41894 ?auto_41895 ?auto_41896 ?auto_41893 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_41911 - OBJ
      ?auto_41912 - OBJ
      ?auto_41913 - OBJ
      ?auto_41910 - LOCATION
    )
    :vars
    (
      ?auto_41917 - OBJ
      ?auto_41915 - LOCATION
      ?auto_41914 - CITY
      ?auto_41916 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41912 ?auto_41911 ) ) ( not ( = ?auto_41913 ?auto_41911 ) ) ( not ( = ?auto_41913 ?auto_41912 ) ) ( not ( = ?auto_41913 ?auto_41917 ) ) ( IN-CITY ?auto_41915 ?auto_41914 ) ( IN-CITY ?auto_41910 ?auto_41914 ) ( not ( = ?auto_41910 ?auto_41915 ) ) ( OBJ-AT ?auto_41917 ?auto_41910 ) ( OBJ-AT ?auto_41913 ?auto_41915 ) ( not ( = ?auto_41912 ?auto_41917 ) ) ( OBJ-AT ?auto_41912 ?auto_41915 ) ( TRUCK-AT ?auto_41916 ?auto_41910 ) ( OBJ-AT ?auto_41911 ?auto_41910 ) ( not ( = ?auto_41911 ?auto_41917 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41917 ?auto_41913 ?auto_41910 )
      ( DELIVER-3PKG-VERIFY ?auto_41911 ?auto_41912 ?auto_41913 ?auto_41910 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_41919 - OBJ
      ?auto_41920 - OBJ
      ?auto_41921 - OBJ
      ?auto_41918 - LOCATION
    )
    :vars
    (
      ?auto_41924 - LOCATION
      ?auto_41922 - CITY
      ?auto_41923 - OBJ
      ?auto_41925 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41920 ?auto_41919 ) ) ( not ( = ?auto_41921 ?auto_41919 ) ) ( not ( = ?auto_41921 ?auto_41920 ) ) ( IN-CITY ?auto_41924 ?auto_41922 ) ( IN-CITY ?auto_41918 ?auto_41922 ) ( not ( = ?auto_41918 ?auto_41924 ) ) ( OBJ-AT ?auto_41921 ?auto_41918 ) ( OBJ-AT ?auto_41920 ?auto_41924 ) ( not ( = ?auto_41923 ?auto_41921 ) ) ( not ( = ?auto_41920 ?auto_41923 ) ) ( OBJ-AT ?auto_41923 ?auto_41924 ) ( TRUCK-AT ?auto_41925 ?auto_41918 ) ( OBJ-AT ?auto_41919 ?auto_41918 ) ( not ( = ?auto_41919 ?auto_41923 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41921 ?auto_41920 ?auto_41918 )
      ( DELIVER-3PKG-VERIFY ?auto_41919 ?auto_41920 ?auto_41921 ?auto_41918 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_41936 - OBJ
      ?auto_41937 - OBJ
      ?auto_41938 - OBJ
      ?auto_41935 - LOCATION
    )
    :vars
    (
      ?auto_41942 - OBJ
      ?auto_41940 - LOCATION
      ?auto_41939 - CITY
      ?auto_41941 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41937 ?auto_41936 ) ) ( not ( = ?auto_41938 ?auto_41936 ) ) ( not ( = ?auto_41938 ?auto_41937 ) ) ( not ( = ?auto_41937 ?auto_41942 ) ) ( IN-CITY ?auto_41940 ?auto_41939 ) ( IN-CITY ?auto_41935 ?auto_41939 ) ( not ( = ?auto_41935 ?auto_41940 ) ) ( OBJ-AT ?auto_41942 ?auto_41935 ) ( OBJ-AT ?auto_41937 ?auto_41940 ) ( not ( = ?auto_41938 ?auto_41942 ) ) ( OBJ-AT ?auto_41938 ?auto_41940 ) ( TRUCK-AT ?auto_41941 ?auto_41935 ) ( OBJ-AT ?auto_41936 ?auto_41935 ) ( not ( = ?auto_41936 ?auto_41942 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41942 ?auto_41937 ?auto_41935 )
      ( DELIVER-3PKG-VERIFY ?auto_41936 ?auto_41937 ?auto_41938 ?auto_41935 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_41953 - OBJ
      ?auto_41954 - OBJ
      ?auto_41955 - OBJ
      ?auto_41952 - LOCATION
    )
    :vars
    (
      ?auto_41957 - LOCATION
      ?auto_41956 - CITY
      ?auto_41958 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41954 ?auto_41953 ) ) ( not ( = ?auto_41955 ?auto_41953 ) ) ( not ( = ?auto_41955 ?auto_41954 ) ) ( IN-CITY ?auto_41957 ?auto_41956 ) ( IN-CITY ?auto_41952 ?auto_41956 ) ( not ( = ?auto_41952 ?auto_41957 ) ) ( OBJ-AT ?auto_41954 ?auto_41952 ) ( OBJ-AT ?auto_41955 ?auto_41957 ) ( OBJ-AT ?auto_41953 ?auto_41957 ) ( TRUCK-AT ?auto_41958 ?auto_41952 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41954 ?auto_41955 ?auto_41952 )
      ( DELIVER-3PKG-VERIFY ?auto_41953 ?auto_41954 ?auto_41955 ?auto_41952 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_41960 - OBJ
      ?auto_41961 - OBJ
      ?auto_41962 - OBJ
      ?auto_41959 - LOCATION
    )
    :vars
    (
      ?auto_41966 - OBJ
      ?auto_41964 - LOCATION
      ?auto_41963 - CITY
      ?auto_41965 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41961 ?auto_41960 ) ) ( not ( = ?auto_41962 ?auto_41960 ) ) ( not ( = ?auto_41962 ?auto_41961 ) ) ( not ( = ?auto_41962 ?auto_41966 ) ) ( IN-CITY ?auto_41964 ?auto_41963 ) ( IN-CITY ?auto_41959 ?auto_41963 ) ( not ( = ?auto_41959 ?auto_41964 ) ) ( OBJ-AT ?auto_41966 ?auto_41959 ) ( OBJ-AT ?auto_41962 ?auto_41964 ) ( not ( = ?auto_41960 ?auto_41966 ) ) ( OBJ-AT ?auto_41960 ?auto_41964 ) ( TRUCK-AT ?auto_41965 ?auto_41959 ) ( OBJ-AT ?auto_41961 ?auto_41959 ) ( not ( = ?auto_41961 ?auto_41966 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41966 ?auto_41962 ?auto_41959 )
      ( DELIVER-3PKG-VERIFY ?auto_41960 ?auto_41961 ?auto_41962 ?auto_41959 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_41976 - OBJ
      ?auto_41977 - OBJ
      ?auto_41978 - OBJ
      ?auto_41975 - LOCATION
    )
    :vars
    (
      ?auto_41980 - LOCATION
      ?auto_41979 - CITY
      ?auto_41981 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41977 ?auto_41976 ) ) ( not ( = ?auto_41978 ?auto_41976 ) ) ( not ( = ?auto_41978 ?auto_41977 ) ) ( IN-CITY ?auto_41980 ?auto_41979 ) ( IN-CITY ?auto_41975 ?auto_41979 ) ( not ( = ?auto_41975 ?auto_41980 ) ) ( OBJ-AT ?auto_41978 ?auto_41975 ) ( OBJ-AT ?auto_41977 ?auto_41980 ) ( OBJ-AT ?auto_41976 ?auto_41980 ) ( TRUCK-AT ?auto_41981 ?auto_41975 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41978 ?auto_41977 ?auto_41975 )
      ( DELIVER-3PKG-VERIFY ?auto_41976 ?auto_41977 ?auto_41978 ?auto_41975 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_41983 - OBJ
      ?auto_41984 - OBJ
      ?auto_41985 - OBJ
      ?auto_41982 - LOCATION
    )
    :vars
    (
      ?auto_41989 - OBJ
      ?auto_41987 - LOCATION
      ?auto_41986 - CITY
      ?auto_41988 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_41984 ?auto_41983 ) ) ( not ( = ?auto_41985 ?auto_41983 ) ) ( not ( = ?auto_41985 ?auto_41984 ) ) ( not ( = ?auto_41984 ?auto_41989 ) ) ( IN-CITY ?auto_41987 ?auto_41986 ) ( IN-CITY ?auto_41982 ?auto_41986 ) ( not ( = ?auto_41982 ?auto_41987 ) ) ( OBJ-AT ?auto_41989 ?auto_41982 ) ( OBJ-AT ?auto_41984 ?auto_41987 ) ( not ( = ?auto_41983 ?auto_41989 ) ) ( OBJ-AT ?auto_41983 ?auto_41987 ) ( TRUCK-AT ?auto_41988 ?auto_41982 ) ( OBJ-AT ?auto_41985 ?auto_41982 ) ( not ( = ?auto_41985 ?auto_41989 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_41989 ?auto_41984 ?auto_41982 )
      ( DELIVER-3PKG-VERIFY ?auto_41983 ?auto_41984 ?auto_41985 ?auto_41982 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_42015 - OBJ
      ?auto_42016 - OBJ
      ?auto_42017 - OBJ
      ?auto_42014 - LOCATION
    )
    :vars
    (
      ?auto_42020 - LOCATION
      ?auto_42018 - CITY
      ?auto_42019 - OBJ
      ?auto_42021 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42016 ?auto_42015 ) ) ( not ( = ?auto_42017 ?auto_42015 ) ) ( not ( = ?auto_42017 ?auto_42016 ) ) ( IN-CITY ?auto_42020 ?auto_42018 ) ( IN-CITY ?auto_42014 ?auto_42018 ) ( not ( = ?auto_42014 ?auto_42020 ) ) ( OBJ-AT ?auto_42016 ?auto_42014 ) ( OBJ-AT ?auto_42015 ?auto_42020 ) ( not ( = ?auto_42019 ?auto_42016 ) ) ( not ( = ?auto_42015 ?auto_42019 ) ) ( OBJ-AT ?auto_42019 ?auto_42020 ) ( TRUCK-AT ?auto_42021 ?auto_42014 ) ( OBJ-AT ?auto_42017 ?auto_42014 ) ( not ( = ?auto_42017 ?auto_42019 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42016 ?auto_42015 ?auto_42014 )
      ( DELIVER-3PKG-VERIFY ?auto_42015 ?auto_42016 ?auto_42017 ?auto_42014 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_42023 - OBJ
      ?auto_42024 - OBJ
      ?auto_42025 - OBJ
      ?auto_42022 - LOCATION
    )
    :vars
    (
      ?auto_42027 - LOCATION
      ?auto_42026 - CITY
      ?auto_42028 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42024 ?auto_42023 ) ) ( not ( = ?auto_42025 ?auto_42023 ) ) ( not ( = ?auto_42025 ?auto_42024 ) ) ( IN-CITY ?auto_42027 ?auto_42026 ) ( IN-CITY ?auto_42022 ?auto_42026 ) ( not ( = ?auto_42022 ?auto_42027 ) ) ( OBJ-AT ?auto_42024 ?auto_42022 ) ( OBJ-AT ?auto_42023 ?auto_42027 ) ( OBJ-AT ?auto_42025 ?auto_42027 ) ( TRUCK-AT ?auto_42028 ?auto_42022 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42024 ?auto_42023 ?auto_42022 )
      ( DELIVER-3PKG-VERIFY ?auto_42023 ?auto_42024 ?auto_42025 ?auto_42022 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_42038 - OBJ
      ?auto_42039 - OBJ
      ?auto_42040 - OBJ
      ?auto_42037 - LOCATION
    )
    :vars
    (
      ?auto_42043 - LOCATION
      ?auto_42041 - CITY
      ?auto_42042 - OBJ
      ?auto_42044 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42039 ?auto_42038 ) ) ( not ( = ?auto_42040 ?auto_42038 ) ) ( not ( = ?auto_42040 ?auto_42039 ) ) ( IN-CITY ?auto_42043 ?auto_42041 ) ( IN-CITY ?auto_42037 ?auto_42041 ) ( not ( = ?auto_42037 ?auto_42043 ) ) ( OBJ-AT ?auto_42040 ?auto_42037 ) ( OBJ-AT ?auto_42038 ?auto_42043 ) ( not ( = ?auto_42042 ?auto_42040 ) ) ( not ( = ?auto_42038 ?auto_42042 ) ) ( OBJ-AT ?auto_42042 ?auto_42043 ) ( TRUCK-AT ?auto_42044 ?auto_42037 ) ( OBJ-AT ?auto_42039 ?auto_42037 ) ( not ( = ?auto_42039 ?auto_42042 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42040 ?auto_42038 ?auto_42037 )
      ( DELIVER-3PKG-VERIFY ?auto_42038 ?auto_42039 ?auto_42040 ?auto_42037 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_42055 - OBJ
      ?auto_42056 - OBJ
      ?auto_42057 - OBJ
      ?auto_42054 - LOCATION
    )
    :vars
    (
      ?auto_42061 - OBJ
      ?auto_42059 - LOCATION
      ?auto_42058 - CITY
      ?auto_42060 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42056 ?auto_42055 ) ) ( not ( = ?auto_42057 ?auto_42055 ) ) ( not ( = ?auto_42057 ?auto_42056 ) ) ( not ( = ?auto_42055 ?auto_42061 ) ) ( IN-CITY ?auto_42059 ?auto_42058 ) ( IN-CITY ?auto_42054 ?auto_42058 ) ( not ( = ?auto_42054 ?auto_42059 ) ) ( OBJ-AT ?auto_42061 ?auto_42054 ) ( OBJ-AT ?auto_42055 ?auto_42059 ) ( not ( = ?auto_42057 ?auto_42061 ) ) ( OBJ-AT ?auto_42057 ?auto_42059 ) ( TRUCK-AT ?auto_42060 ?auto_42054 ) ( OBJ-AT ?auto_42056 ?auto_42054 ) ( not ( = ?auto_42056 ?auto_42061 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42061 ?auto_42055 ?auto_42054 )
      ( DELIVER-3PKG-VERIFY ?auto_42055 ?auto_42056 ?auto_42057 ?auto_42054 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_42072 - OBJ
      ?auto_42073 - OBJ
      ?auto_42074 - OBJ
      ?auto_42071 - LOCATION
    )
    :vars
    (
      ?auto_42076 - LOCATION
      ?auto_42075 - CITY
      ?auto_42077 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42073 ?auto_42072 ) ) ( not ( = ?auto_42074 ?auto_42072 ) ) ( not ( = ?auto_42074 ?auto_42073 ) ) ( IN-CITY ?auto_42076 ?auto_42075 ) ( IN-CITY ?auto_42071 ?auto_42075 ) ( not ( = ?auto_42071 ?auto_42076 ) ) ( OBJ-AT ?auto_42074 ?auto_42071 ) ( OBJ-AT ?auto_42072 ?auto_42076 ) ( OBJ-AT ?auto_42073 ?auto_42076 ) ( TRUCK-AT ?auto_42077 ?auto_42071 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42074 ?auto_42072 ?auto_42071 )
      ( DELIVER-3PKG-VERIFY ?auto_42072 ?auto_42073 ?auto_42074 ?auto_42071 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_42079 - OBJ
      ?auto_42080 - OBJ
      ?auto_42081 - OBJ
      ?auto_42078 - LOCATION
    )
    :vars
    (
      ?auto_42085 - OBJ
      ?auto_42083 - LOCATION
      ?auto_42082 - CITY
      ?auto_42084 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42080 ?auto_42079 ) ) ( not ( = ?auto_42081 ?auto_42079 ) ) ( not ( = ?auto_42081 ?auto_42080 ) ) ( not ( = ?auto_42079 ?auto_42085 ) ) ( IN-CITY ?auto_42083 ?auto_42082 ) ( IN-CITY ?auto_42078 ?auto_42082 ) ( not ( = ?auto_42078 ?auto_42083 ) ) ( OBJ-AT ?auto_42085 ?auto_42078 ) ( OBJ-AT ?auto_42079 ?auto_42083 ) ( not ( = ?auto_42080 ?auto_42085 ) ) ( OBJ-AT ?auto_42080 ?auto_42083 ) ( TRUCK-AT ?auto_42084 ?auto_42078 ) ( OBJ-AT ?auto_42081 ?auto_42078 ) ( not ( = ?auto_42081 ?auto_42085 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42085 ?auto_42079 ?auto_42078 )
      ( DELIVER-3PKG-VERIFY ?auto_42079 ?auto_42080 ?auto_42081 ?auto_42078 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42216 - OBJ
      ?auto_42217 - OBJ
      ?auto_42218 - OBJ
      ?auto_42219 - OBJ
      ?auto_42215 - LOCATION
    )
    :vars
    (
      ?auto_42221 - LOCATION
      ?auto_42220 - CITY
      ?auto_42222 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42217 ?auto_42216 ) ) ( not ( = ?auto_42218 ?auto_42216 ) ) ( not ( = ?auto_42218 ?auto_42217 ) ) ( not ( = ?auto_42219 ?auto_42216 ) ) ( not ( = ?auto_42219 ?auto_42217 ) ) ( not ( = ?auto_42219 ?auto_42218 ) ) ( IN-CITY ?auto_42221 ?auto_42220 ) ( IN-CITY ?auto_42215 ?auto_42220 ) ( not ( = ?auto_42215 ?auto_42221 ) ) ( OBJ-AT ?auto_42216 ?auto_42215 ) ( OBJ-AT ?auto_42219 ?auto_42221 ) ( OBJ-AT ?auto_42218 ?auto_42221 ) ( TRUCK-AT ?auto_42222 ?auto_42215 ) ( OBJ-AT ?auto_42217 ?auto_42215 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42216 ?auto_42219 ?auto_42215 )
      ( DELIVER-4PKG-VERIFY ?auto_42216 ?auto_42217 ?auto_42218 ?auto_42219 ?auto_42215 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42242 - OBJ
      ?auto_42243 - OBJ
      ?auto_42244 - OBJ
      ?auto_42245 - OBJ
      ?auto_42241 - LOCATION
    )
    :vars
    (
      ?auto_42247 - LOCATION
      ?auto_42246 - CITY
      ?auto_42248 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42243 ?auto_42242 ) ) ( not ( = ?auto_42244 ?auto_42242 ) ) ( not ( = ?auto_42244 ?auto_42243 ) ) ( not ( = ?auto_42245 ?auto_42242 ) ) ( not ( = ?auto_42245 ?auto_42243 ) ) ( not ( = ?auto_42245 ?auto_42244 ) ) ( IN-CITY ?auto_42247 ?auto_42246 ) ( IN-CITY ?auto_42241 ?auto_42246 ) ( not ( = ?auto_42241 ?auto_42247 ) ) ( OBJ-AT ?auto_42242 ?auto_42241 ) ( OBJ-AT ?auto_42244 ?auto_42247 ) ( OBJ-AT ?auto_42245 ?auto_42247 ) ( TRUCK-AT ?auto_42248 ?auto_42241 ) ( OBJ-AT ?auto_42243 ?auto_42241 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42242 ?auto_42244 ?auto_42241 )
      ( DELIVER-4PKG-VERIFY ?auto_42242 ?auto_42243 ?auto_42244 ?auto_42245 ?auto_42241 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42267 - OBJ
      ?auto_42268 - OBJ
      ?auto_42269 - OBJ
      ?auto_42270 - OBJ
      ?auto_42266 - LOCATION
    )
    :vars
    (
      ?auto_42272 - LOCATION
      ?auto_42271 - CITY
      ?auto_42273 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42268 ?auto_42267 ) ) ( not ( = ?auto_42269 ?auto_42267 ) ) ( not ( = ?auto_42269 ?auto_42268 ) ) ( not ( = ?auto_42270 ?auto_42267 ) ) ( not ( = ?auto_42270 ?auto_42268 ) ) ( not ( = ?auto_42270 ?auto_42269 ) ) ( IN-CITY ?auto_42272 ?auto_42271 ) ( IN-CITY ?auto_42266 ?auto_42271 ) ( not ( = ?auto_42266 ?auto_42272 ) ) ( OBJ-AT ?auto_42267 ?auto_42266 ) ( OBJ-AT ?auto_42270 ?auto_42272 ) ( OBJ-AT ?auto_42268 ?auto_42272 ) ( TRUCK-AT ?auto_42273 ?auto_42266 ) ( OBJ-AT ?auto_42269 ?auto_42266 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42267 ?auto_42270 ?auto_42266 )
      ( DELIVER-4PKG-VERIFY ?auto_42267 ?auto_42268 ?auto_42269 ?auto_42270 ?auto_42266 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42291 - OBJ
      ?auto_42292 - OBJ
      ?auto_42293 - OBJ
      ?auto_42294 - OBJ
      ?auto_42290 - LOCATION
    )
    :vars
    (
      ?auto_42296 - LOCATION
      ?auto_42295 - CITY
      ?auto_42297 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42292 ?auto_42291 ) ) ( not ( = ?auto_42293 ?auto_42291 ) ) ( not ( = ?auto_42293 ?auto_42292 ) ) ( not ( = ?auto_42294 ?auto_42291 ) ) ( not ( = ?auto_42294 ?auto_42292 ) ) ( not ( = ?auto_42294 ?auto_42293 ) ) ( IN-CITY ?auto_42296 ?auto_42295 ) ( IN-CITY ?auto_42290 ?auto_42295 ) ( not ( = ?auto_42290 ?auto_42296 ) ) ( OBJ-AT ?auto_42291 ?auto_42290 ) ( OBJ-AT ?auto_42293 ?auto_42296 ) ( OBJ-AT ?auto_42292 ?auto_42296 ) ( TRUCK-AT ?auto_42297 ?auto_42290 ) ( OBJ-AT ?auto_42294 ?auto_42290 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42291 ?auto_42293 ?auto_42290 )
      ( DELIVER-4PKG-VERIFY ?auto_42291 ?auto_42292 ?auto_42293 ?auto_42294 ?auto_42290 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42368 - OBJ
      ?auto_42369 - OBJ
      ?auto_42370 - OBJ
      ?auto_42371 - OBJ
      ?auto_42367 - LOCATION
    )
    :vars
    (
      ?auto_42373 - LOCATION
      ?auto_42372 - CITY
      ?auto_42374 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42369 ?auto_42368 ) ) ( not ( = ?auto_42370 ?auto_42368 ) ) ( not ( = ?auto_42370 ?auto_42369 ) ) ( not ( = ?auto_42371 ?auto_42368 ) ) ( not ( = ?auto_42371 ?auto_42369 ) ) ( not ( = ?auto_42371 ?auto_42370 ) ) ( IN-CITY ?auto_42373 ?auto_42372 ) ( IN-CITY ?auto_42367 ?auto_42372 ) ( not ( = ?auto_42367 ?auto_42373 ) ) ( OBJ-AT ?auto_42368 ?auto_42367 ) ( OBJ-AT ?auto_42369 ?auto_42373 ) ( OBJ-AT ?auto_42371 ?auto_42373 ) ( TRUCK-AT ?auto_42374 ?auto_42367 ) ( OBJ-AT ?auto_42370 ?auto_42367 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42368 ?auto_42369 ?auto_42367 )
      ( DELIVER-4PKG-VERIFY ?auto_42368 ?auto_42369 ?auto_42370 ?auto_42371 ?auto_42367 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42393 - OBJ
      ?auto_42394 - OBJ
      ?auto_42395 - OBJ
      ?auto_42396 - OBJ
      ?auto_42392 - LOCATION
    )
    :vars
    (
      ?auto_42398 - LOCATION
      ?auto_42397 - CITY
      ?auto_42399 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42394 ?auto_42393 ) ) ( not ( = ?auto_42395 ?auto_42393 ) ) ( not ( = ?auto_42395 ?auto_42394 ) ) ( not ( = ?auto_42396 ?auto_42393 ) ) ( not ( = ?auto_42396 ?auto_42394 ) ) ( not ( = ?auto_42396 ?auto_42395 ) ) ( IN-CITY ?auto_42398 ?auto_42397 ) ( IN-CITY ?auto_42392 ?auto_42397 ) ( not ( = ?auto_42392 ?auto_42398 ) ) ( OBJ-AT ?auto_42393 ?auto_42392 ) ( OBJ-AT ?auto_42394 ?auto_42398 ) ( OBJ-AT ?auto_42395 ?auto_42398 ) ( TRUCK-AT ?auto_42399 ?auto_42392 ) ( OBJ-AT ?auto_42396 ?auto_42392 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42393 ?auto_42394 ?auto_42392 )
      ( DELIVER-4PKG-VERIFY ?auto_42393 ?auto_42394 ?auto_42395 ?auto_42396 ?auto_42392 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42470 - OBJ
      ?auto_42471 - OBJ
      ?auto_42472 - OBJ
      ?auto_42473 - OBJ
      ?auto_42469 - LOCATION
    )
    :vars
    (
      ?auto_42475 - LOCATION
      ?auto_42474 - CITY
      ?auto_42476 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42471 ?auto_42470 ) ) ( not ( = ?auto_42472 ?auto_42470 ) ) ( not ( = ?auto_42472 ?auto_42471 ) ) ( not ( = ?auto_42473 ?auto_42470 ) ) ( not ( = ?auto_42473 ?auto_42471 ) ) ( not ( = ?auto_42473 ?auto_42472 ) ) ( IN-CITY ?auto_42475 ?auto_42474 ) ( IN-CITY ?auto_42469 ?auto_42474 ) ( not ( = ?auto_42469 ?auto_42475 ) ) ( OBJ-AT ?auto_42471 ?auto_42469 ) ( OBJ-AT ?auto_42473 ?auto_42475 ) ( OBJ-AT ?auto_42472 ?auto_42475 ) ( TRUCK-AT ?auto_42476 ?auto_42469 ) ( OBJ-AT ?auto_42470 ?auto_42469 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42471 ?auto_42473 ?auto_42469 )
      ( DELIVER-4PKG-VERIFY ?auto_42470 ?auto_42471 ?auto_42472 ?auto_42473 ?auto_42469 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42496 - OBJ
      ?auto_42497 - OBJ
      ?auto_42498 - OBJ
      ?auto_42499 - OBJ
      ?auto_42495 - LOCATION
    )
    :vars
    (
      ?auto_42501 - LOCATION
      ?auto_42500 - CITY
      ?auto_42502 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42497 ?auto_42496 ) ) ( not ( = ?auto_42498 ?auto_42496 ) ) ( not ( = ?auto_42498 ?auto_42497 ) ) ( not ( = ?auto_42499 ?auto_42496 ) ) ( not ( = ?auto_42499 ?auto_42497 ) ) ( not ( = ?auto_42499 ?auto_42498 ) ) ( IN-CITY ?auto_42501 ?auto_42500 ) ( IN-CITY ?auto_42495 ?auto_42500 ) ( not ( = ?auto_42495 ?auto_42501 ) ) ( OBJ-AT ?auto_42497 ?auto_42495 ) ( OBJ-AT ?auto_42498 ?auto_42501 ) ( OBJ-AT ?auto_42499 ?auto_42501 ) ( TRUCK-AT ?auto_42502 ?auto_42495 ) ( OBJ-AT ?auto_42496 ?auto_42495 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42497 ?auto_42498 ?auto_42495 )
      ( DELIVER-4PKG-VERIFY ?auto_42496 ?auto_42497 ?auto_42498 ?auto_42499 ?auto_42495 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42579 - OBJ
      ?auto_42580 - OBJ
      ?auto_42581 - OBJ
      ?auto_42582 - OBJ
      ?auto_42578 - LOCATION
    )
    :vars
    (
      ?auto_42584 - LOCATION
      ?auto_42583 - CITY
      ?auto_42585 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42580 ?auto_42579 ) ) ( not ( = ?auto_42581 ?auto_42579 ) ) ( not ( = ?auto_42581 ?auto_42580 ) ) ( not ( = ?auto_42582 ?auto_42579 ) ) ( not ( = ?auto_42582 ?auto_42580 ) ) ( not ( = ?auto_42582 ?auto_42581 ) ) ( IN-CITY ?auto_42584 ?auto_42583 ) ( IN-CITY ?auto_42578 ?auto_42583 ) ( not ( = ?auto_42578 ?auto_42584 ) ) ( OBJ-AT ?auto_42581 ?auto_42578 ) ( OBJ-AT ?auto_42582 ?auto_42584 ) ( OBJ-AT ?auto_42580 ?auto_42584 ) ( TRUCK-AT ?auto_42585 ?auto_42578 ) ( OBJ-AT ?auto_42579 ?auto_42578 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42581 ?auto_42582 ?auto_42578 )
      ( DELIVER-4PKG-VERIFY ?auto_42579 ?auto_42580 ?auto_42581 ?auto_42582 ?auto_42578 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42605 - OBJ
      ?auto_42606 - OBJ
      ?auto_42607 - OBJ
      ?auto_42608 - OBJ
      ?auto_42604 - LOCATION
    )
    :vars
    (
      ?auto_42610 - LOCATION
      ?auto_42609 - CITY
      ?auto_42611 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42606 ?auto_42605 ) ) ( not ( = ?auto_42607 ?auto_42605 ) ) ( not ( = ?auto_42607 ?auto_42606 ) ) ( not ( = ?auto_42608 ?auto_42605 ) ) ( not ( = ?auto_42608 ?auto_42606 ) ) ( not ( = ?auto_42608 ?auto_42607 ) ) ( IN-CITY ?auto_42610 ?auto_42609 ) ( IN-CITY ?auto_42604 ?auto_42609 ) ( not ( = ?auto_42604 ?auto_42610 ) ) ( OBJ-AT ?auto_42608 ?auto_42604 ) ( OBJ-AT ?auto_42607 ?auto_42610 ) ( OBJ-AT ?auto_42606 ?auto_42610 ) ( TRUCK-AT ?auto_42611 ?auto_42604 ) ( OBJ-AT ?auto_42605 ?auto_42604 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42608 ?auto_42607 ?auto_42604 )
      ( DELIVER-4PKG-VERIFY ?auto_42605 ?auto_42606 ?auto_42607 ?auto_42608 ?auto_42604 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42658 - OBJ
      ?auto_42659 - OBJ
      ?auto_42660 - OBJ
      ?auto_42661 - OBJ
      ?auto_42657 - LOCATION
    )
    :vars
    (
      ?auto_42663 - LOCATION
      ?auto_42662 - CITY
      ?auto_42664 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42659 ?auto_42658 ) ) ( not ( = ?auto_42660 ?auto_42658 ) ) ( not ( = ?auto_42660 ?auto_42659 ) ) ( not ( = ?auto_42661 ?auto_42658 ) ) ( not ( = ?auto_42661 ?auto_42659 ) ) ( not ( = ?auto_42661 ?auto_42660 ) ) ( IN-CITY ?auto_42663 ?auto_42662 ) ( IN-CITY ?auto_42657 ?auto_42662 ) ( not ( = ?auto_42657 ?auto_42663 ) ) ( OBJ-AT ?auto_42660 ?auto_42657 ) ( OBJ-AT ?auto_42659 ?auto_42663 ) ( OBJ-AT ?auto_42661 ?auto_42663 ) ( TRUCK-AT ?auto_42664 ?auto_42657 ) ( OBJ-AT ?auto_42658 ?auto_42657 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42660 ?auto_42659 ?auto_42657 )
      ( DELIVER-4PKG-VERIFY ?auto_42658 ?auto_42659 ?auto_42660 ?auto_42661 ?auto_42657 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42713 - OBJ
      ?auto_42714 - OBJ
      ?auto_42715 - OBJ
      ?auto_42716 - OBJ
      ?auto_42712 - LOCATION
    )
    :vars
    (
      ?auto_42718 - LOCATION
      ?auto_42717 - CITY
      ?auto_42719 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42714 ?auto_42713 ) ) ( not ( = ?auto_42715 ?auto_42713 ) ) ( not ( = ?auto_42715 ?auto_42714 ) ) ( not ( = ?auto_42716 ?auto_42713 ) ) ( not ( = ?auto_42716 ?auto_42714 ) ) ( not ( = ?auto_42716 ?auto_42715 ) ) ( IN-CITY ?auto_42718 ?auto_42717 ) ( IN-CITY ?auto_42712 ?auto_42717 ) ( not ( = ?auto_42712 ?auto_42718 ) ) ( OBJ-AT ?auto_42716 ?auto_42712 ) ( OBJ-AT ?auto_42714 ?auto_42718 ) ( OBJ-AT ?auto_42715 ?auto_42718 ) ( TRUCK-AT ?auto_42719 ?auto_42712 ) ( OBJ-AT ?auto_42713 ?auto_42712 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42716 ?auto_42714 ?auto_42712 )
      ( DELIVER-4PKG-VERIFY ?auto_42713 ?auto_42714 ?auto_42715 ?auto_42716 ?auto_42712 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42794 - OBJ
      ?auto_42795 - OBJ
      ?auto_42796 - OBJ
      ?auto_42797 - OBJ
      ?auto_42793 - LOCATION
    )
    :vars
    (
      ?auto_42799 - LOCATION
      ?auto_42798 - CITY
      ?auto_42800 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42795 ?auto_42794 ) ) ( not ( = ?auto_42796 ?auto_42794 ) ) ( not ( = ?auto_42796 ?auto_42795 ) ) ( not ( = ?auto_42797 ?auto_42794 ) ) ( not ( = ?auto_42797 ?auto_42795 ) ) ( not ( = ?auto_42797 ?auto_42796 ) ) ( IN-CITY ?auto_42799 ?auto_42798 ) ( IN-CITY ?auto_42793 ?auto_42798 ) ( not ( = ?auto_42793 ?auto_42799 ) ) ( OBJ-AT ?auto_42795 ?auto_42793 ) ( OBJ-AT ?auto_42797 ?auto_42799 ) ( OBJ-AT ?auto_42794 ?auto_42799 ) ( TRUCK-AT ?auto_42800 ?auto_42793 ) ( OBJ-AT ?auto_42796 ?auto_42793 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42795 ?auto_42797 ?auto_42793 )
      ( DELIVER-4PKG-VERIFY ?auto_42794 ?auto_42795 ?auto_42796 ?auto_42797 ?auto_42793 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42818 - OBJ
      ?auto_42819 - OBJ
      ?auto_42820 - OBJ
      ?auto_42821 - OBJ
      ?auto_42817 - LOCATION
    )
    :vars
    (
      ?auto_42823 - LOCATION
      ?auto_42822 - CITY
      ?auto_42824 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42819 ?auto_42818 ) ) ( not ( = ?auto_42820 ?auto_42818 ) ) ( not ( = ?auto_42820 ?auto_42819 ) ) ( not ( = ?auto_42821 ?auto_42818 ) ) ( not ( = ?auto_42821 ?auto_42819 ) ) ( not ( = ?auto_42821 ?auto_42820 ) ) ( IN-CITY ?auto_42823 ?auto_42822 ) ( IN-CITY ?auto_42817 ?auto_42822 ) ( not ( = ?auto_42817 ?auto_42823 ) ) ( OBJ-AT ?auto_42819 ?auto_42817 ) ( OBJ-AT ?auto_42820 ?auto_42823 ) ( OBJ-AT ?auto_42818 ?auto_42823 ) ( TRUCK-AT ?auto_42824 ?auto_42817 ) ( OBJ-AT ?auto_42821 ?auto_42817 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42819 ?auto_42820 ?auto_42817 )
      ( DELIVER-4PKG-VERIFY ?auto_42818 ?auto_42819 ?auto_42820 ?auto_42821 ?auto_42817 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42842 - OBJ
      ?auto_42843 - OBJ
      ?auto_42844 - OBJ
      ?auto_42845 - OBJ
      ?auto_42841 - LOCATION
    )
    :vars
    (
      ?auto_42847 - LOCATION
      ?auto_42846 - CITY
      ?auto_42848 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42843 ?auto_42842 ) ) ( not ( = ?auto_42844 ?auto_42842 ) ) ( not ( = ?auto_42844 ?auto_42843 ) ) ( not ( = ?auto_42845 ?auto_42842 ) ) ( not ( = ?auto_42845 ?auto_42843 ) ) ( not ( = ?auto_42845 ?auto_42844 ) ) ( IN-CITY ?auto_42847 ?auto_42846 ) ( IN-CITY ?auto_42841 ?auto_42846 ) ( not ( = ?auto_42841 ?auto_42847 ) ) ( OBJ-AT ?auto_42844 ?auto_42841 ) ( OBJ-AT ?auto_42845 ?auto_42847 ) ( OBJ-AT ?auto_42842 ?auto_42847 ) ( TRUCK-AT ?auto_42848 ?auto_42841 ) ( OBJ-AT ?auto_42843 ?auto_42841 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42844 ?auto_42845 ?auto_42841 )
      ( DELIVER-4PKG-VERIFY ?auto_42842 ?auto_42843 ?auto_42844 ?auto_42845 ?auto_42841 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42868 - OBJ
      ?auto_42869 - OBJ
      ?auto_42870 - OBJ
      ?auto_42871 - OBJ
      ?auto_42867 - LOCATION
    )
    :vars
    (
      ?auto_42873 - LOCATION
      ?auto_42872 - CITY
      ?auto_42874 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42869 ?auto_42868 ) ) ( not ( = ?auto_42870 ?auto_42868 ) ) ( not ( = ?auto_42870 ?auto_42869 ) ) ( not ( = ?auto_42871 ?auto_42868 ) ) ( not ( = ?auto_42871 ?auto_42869 ) ) ( not ( = ?auto_42871 ?auto_42870 ) ) ( IN-CITY ?auto_42873 ?auto_42872 ) ( IN-CITY ?auto_42867 ?auto_42872 ) ( not ( = ?auto_42867 ?auto_42873 ) ) ( OBJ-AT ?auto_42871 ?auto_42867 ) ( OBJ-AT ?auto_42870 ?auto_42873 ) ( OBJ-AT ?auto_42868 ?auto_42873 ) ( TRUCK-AT ?auto_42874 ?auto_42867 ) ( OBJ-AT ?auto_42869 ?auto_42867 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42871 ?auto_42870 ?auto_42867 )
      ( DELIVER-4PKG-VERIFY ?auto_42868 ?auto_42869 ?auto_42870 ?auto_42871 ?auto_42867 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42972 - OBJ
      ?auto_42973 - OBJ
      ?auto_42974 - OBJ
      ?auto_42975 - OBJ
      ?auto_42971 - LOCATION
    )
    :vars
    (
      ?auto_42977 - LOCATION
      ?auto_42976 - CITY
      ?auto_42978 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42973 ?auto_42972 ) ) ( not ( = ?auto_42974 ?auto_42972 ) ) ( not ( = ?auto_42974 ?auto_42973 ) ) ( not ( = ?auto_42975 ?auto_42972 ) ) ( not ( = ?auto_42975 ?auto_42973 ) ) ( not ( = ?auto_42975 ?auto_42974 ) ) ( IN-CITY ?auto_42977 ?auto_42976 ) ( IN-CITY ?auto_42971 ?auto_42976 ) ( not ( = ?auto_42971 ?auto_42977 ) ) ( OBJ-AT ?auto_42974 ?auto_42971 ) ( OBJ-AT ?auto_42973 ?auto_42977 ) ( OBJ-AT ?auto_42972 ?auto_42977 ) ( TRUCK-AT ?auto_42978 ?auto_42971 ) ( OBJ-AT ?auto_42975 ?auto_42971 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42974 ?auto_42973 ?auto_42971 )
      ( DELIVER-4PKG-VERIFY ?auto_42972 ?auto_42973 ?auto_42974 ?auto_42975 ?auto_42971 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42996 - OBJ
      ?auto_42997 - OBJ
      ?auto_42998 - OBJ
      ?auto_42999 - OBJ
      ?auto_42995 - LOCATION
    )
    :vars
    (
      ?auto_43001 - LOCATION
      ?auto_43000 - CITY
      ?auto_43002 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_42997 ?auto_42996 ) ) ( not ( = ?auto_42998 ?auto_42996 ) ) ( not ( = ?auto_42998 ?auto_42997 ) ) ( not ( = ?auto_42999 ?auto_42996 ) ) ( not ( = ?auto_42999 ?auto_42997 ) ) ( not ( = ?auto_42999 ?auto_42998 ) ) ( IN-CITY ?auto_43001 ?auto_43000 ) ( IN-CITY ?auto_42995 ?auto_43000 ) ( not ( = ?auto_42995 ?auto_43001 ) ) ( OBJ-AT ?auto_42999 ?auto_42995 ) ( OBJ-AT ?auto_42997 ?auto_43001 ) ( OBJ-AT ?auto_42996 ?auto_43001 ) ( TRUCK-AT ?auto_43002 ?auto_42995 ) ( OBJ-AT ?auto_42998 ?auto_42995 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42999 ?auto_42997 ?auto_42995 )
      ( DELIVER-4PKG-VERIFY ?auto_42996 ?auto_42997 ?auto_42998 ?auto_42999 ?auto_42995 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_43154 - OBJ
      ?auto_43155 - OBJ
      ?auto_43156 - OBJ
      ?auto_43157 - OBJ
      ?auto_43153 - LOCATION
    )
    :vars
    (
      ?auto_43159 - LOCATION
      ?auto_43158 - CITY
      ?auto_43160 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_43155 ?auto_43154 ) ) ( not ( = ?auto_43156 ?auto_43154 ) ) ( not ( = ?auto_43156 ?auto_43155 ) ) ( not ( = ?auto_43157 ?auto_43154 ) ) ( not ( = ?auto_43157 ?auto_43155 ) ) ( not ( = ?auto_43157 ?auto_43156 ) ) ( IN-CITY ?auto_43159 ?auto_43158 ) ( IN-CITY ?auto_43153 ?auto_43158 ) ( not ( = ?auto_43153 ?auto_43159 ) ) ( OBJ-AT ?auto_43155 ?auto_43153 ) ( OBJ-AT ?auto_43154 ?auto_43159 ) ( OBJ-AT ?auto_43157 ?auto_43159 ) ( TRUCK-AT ?auto_43160 ?auto_43153 ) ( OBJ-AT ?auto_43156 ?auto_43153 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43155 ?auto_43154 ?auto_43153 )
      ( DELIVER-4PKG-VERIFY ?auto_43154 ?auto_43155 ?auto_43156 ?auto_43157 ?auto_43153 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_43179 - OBJ
      ?auto_43180 - OBJ
      ?auto_43181 - OBJ
      ?auto_43182 - OBJ
      ?auto_43178 - LOCATION
    )
    :vars
    (
      ?auto_43184 - LOCATION
      ?auto_43183 - CITY
      ?auto_43185 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_43180 ?auto_43179 ) ) ( not ( = ?auto_43181 ?auto_43179 ) ) ( not ( = ?auto_43181 ?auto_43180 ) ) ( not ( = ?auto_43182 ?auto_43179 ) ) ( not ( = ?auto_43182 ?auto_43180 ) ) ( not ( = ?auto_43182 ?auto_43181 ) ) ( IN-CITY ?auto_43184 ?auto_43183 ) ( IN-CITY ?auto_43178 ?auto_43183 ) ( not ( = ?auto_43178 ?auto_43184 ) ) ( OBJ-AT ?auto_43180 ?auto_43178 ) ( OBJ-AT ?auto_43179 ?auto_43184 ) ( OBJ-AT ?auto_43181 ?auto_43184 ) ( TRUCK-AT ?auto_43185 ?auto_43178 ) ( OBJ-AT ?auto_43182 ?auto_43178 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43180 ?auto_43179 ?auto_43178 )
      ( DELIVER-4PKG-VERIFY ?auto_43179 ?auto_43180 ?auto_43181 ?auto_43182 ?auto_43178 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_43256 - OBJ
      ?auto_43257 - OBJ
      ?auto_43258 - OBJ
      ?auto_43259 - OBJ
      ?auto_43255 - LOCATION
    )
    :vars
    (
      ?auto_43261 - LOCATION
      ?auto_43260 - CITY
      ?auto_43262 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_43257 ?auto_43256 ) ) ( not ( = ?auto_43258 ?auto_43256 ) ) ( not ( = ?auto_43258 ?auto_43257 ) ) ( not ( = ?auto_43259 ?auto_43256 ) ) ( not ( = ?auto_43259 ?auto_43257 ) ) ( not ( = ?auto_43259 ?auto_43258 ) ) ( IN-CITY ?auto_43261 ?auto_43260 ) ( IN-CITY ?auto_43255 ?auto_43260 ) ( not ( = ?auto_43255 ?auto_43261 ) ) ( OBJ-AT ?auto_43258 ?auto_43255 ) ( OBJ-AT ?auto_43256 ?auto_43261 ) ( OBJ-AT ?auto_43259 ?auto_43261 ) ( TRUCK-AT ?auto_43262 ?auto_43255 ) ( OBJ-AT ?auto_43257 ?auto_43255 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43258 ?auto_43256 ?auto_43255 )
      ( DELIVER-4PKG-VERIFY ?auto_43256 ?auto_43257 ?auto_43258 ?auto_43259 ?auto_43255 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_43311 - OBJ
      ?auto_43312 - OBJ
      ?auto_43313 - OBJ
      ?auto_43314 - OBJ
      ?auto_43310 - LOCATION
    )
    :vars
    (
      ?auto_43316 - LOCATION
      ?auto_43315 - CITY
      ?auto_43317 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_43312 ?auto_43311 ) ) ( not ( = ?auto_43313 ?auto_43311 ) ) ( not ( = ?auto_43313 ?auto_43312 ) ) ( not ( = ?auto_43314 ?auto_43311 ) ) ( not ( = ?auto_43314 ?auto_43312 ) ) ( not ( = ?auto_43314 ?auto_43313 ) ) ( IN-CITY ?auto_43316 ?auto_43315 ) ( IN-CITY ?auto_43310 ?auto_43315 ) ( not ( = ?auto_43310 ?auto_43316 ) ) ( OBJ-AT ?auto_43314 ?auto_43310 ) ( OBJ-AT ?auto_43311 ?auto_43316 ) ( OBJ-AT ?auto_43313 ?auto_43316 ) ( TRUCK-AT ?auto_43317 ?auto_43310 ) ( OBJ-AT ?auto_43312 ?auto_43310 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43314 ?auto_43311 ?auto_43310 )
      ( DELIVER-4PKG-VERIFY ?auto_43311 ?auto_43312 ?auto_43313 ?auto_43314 ?auto_43310 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_43392 - OBJ
      ?auto_43393 - OBJ
      ?auto_43394 - OBJ
      ?auto_43395 - OBJ
      ?auto_43391 - LOCATION
    )
    :vars
    (
      ?auto_43397 - LOCATION
      ?auto_43396 - CITY
      ?auto_43398 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_43393 ?auto_43392 ) ) ( not ( = ?auto_43394 ?auto_43392 ) ) ( not ( = ?auto_43394 ?auto_43393 ) ) ( not ( = ?auto_43395 ?auto_43392 ) ) ( not ( = ?auto_43395 ?auto_43393 ) ) ( not ( = ?auto_43395 ?auto_43394 ) ) ( IN-CITY ?auto_43397 ?auto_43396 ) ( IN-CITY ?auto_43391 ?auto_43396 ) ( not ( = ?auto_43391 ?auto_43397 ) ) ( OBJ-AT ?auto_43394 ?auto_43391 ) ( OBJ-AT ?auto_43392 ?auto_43397 ) ( OBJ-AT ?auto_43393 ?auto_43397 ) ( TRUCK-AT ?auto_43398 ?auto_43391 ) ( OBJ-AT ?auto_43395 ?auto_43391 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43394 ?auto_43392 ?auto_43391 )
      ( DELIVER-4PKG-VERIFY ?auto_43392 ?auto_43393 ?auto_43394 ?auto_43395 ?auto_43391 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_43416 - OBJ
      ?auto_43417 - OBJ
      ?auto_43418 - OBJ
      ?auto_43419 - OBJ
      ?auto_43415 - LOCATION
    )
    :vars
    (
      ?auto_43421 - LOCATION
      ?auto_43420 - CITY
      ?auto_43422 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_43417 ?auto_43416 ) ) ( not ( = ?auto_43418 ?auto_43416 ) ) ( not ( = ?auto_43418 ?auto_43417 ) ) ( not ( = ?auto_43419 ?auto_43416 ) ) ( not ( = ?auto_43419 ?auto_43417 ) ) ( not ( = ?auto_43419 ?auto_43418 ) ) ( IN-CITY ?auto_43421 ?auto_43420 ) ( IN-CITY ?auto_43415 ?auto_43420 ) ( not ( = ?auto_43415 ?auto_43421 ) ) ( OBJ-AT ?auto_43419 ?auto_43415 ) ( OBJ-AT ?auto_43416 ?auto_43421 ) ( OBJ-AT ?auto_43417 ?auto_43421 ) ( TRUCK-AT ?auto_43422 ?auto_43415 ) ( OBJ-AT ?auto_43418 ?auto_43415 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43419 ?auto_43416 ?auto_43415 )
      ( DELIVER-4PKG-VERIFY ?auto_43416 ?auto_43417 ?auto_43418 ?auto_43419 ?auto_43415 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_43667 - OBJ
      ?auto_43666 - LOCATION
    )
    :vars
    (
      ?auto_43672 - OBJ
      ?auto_43670 - LOCATION
      ?auto_43668 - CITY
      ?auto_43669 - OBJ
      ?auto_43671 - TRUCK
      ?auto_43673 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_43667 ?auto_43672 ) ) ( IN-CITY ?auto_43670 ?auto_43668 ) ( IN-CITY ?auto_43666 ?auto_43668 ) ( not ( = ?auto_43666 ?auto_43670 ) ) ( OBJ-AT ?auto_43672 ?auto_43666 ) ( OBJ-AT ?auto_43667 ?auto_43670 ) ( not ( = ?auto_43669 ?auto_43672 ) ) ( not ( = ?auto_43667 ?auto_43669 ) ) ( OBJ-AT ?auto_43669 ?auto_43670 ) ( TRUCK-AT ?auto_43671 ?auto_43666 ) ( not ( = ?auto_43673 ?auto_43672 ) ) ( IN-TRUCK ?auto_43673 ?auto_43671 ) ( not ( = ?auto_43667 ?auto_43673 ) ) ( not ( = ?auto_43669 ?auto_43673 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43672 ?auto_43673 ?auto_43666 )
      ( DELIVER-2PKG ?auto_43672 ?auto_43667 ?auto_43666 )
      ( DELIVER-1PKG-VERIFY ?auto_43667 ?auto_43666 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_43675 - OBJ
      ?auto_43676 - OBJ
      ?auto_43674 - LOCATION
    )
    :vars
    (
      ?auto_43677 - LOCATION
      ?auto_43681 - CITY
      ?auto_43678 - OBJ
      ?auto_43679 - TRUCK
      ?auto_43680 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_43676 ?auto_43675 ) ) ( IN-CITY ?auto_43677 ?auto_43681 ) ( IN-CITY ?auto_43674 ?auto_43681 ) ( not ( = ?auto_43674 ?auto_43677 ) ) ( OBJ-AT ?auto_43675 ?auto_43674 ) ( OBJ-AT ?auto_43676 ?auto_43677 ) ( not ( = ?auto_43678 ?auto_43675 ) ) ( not ( = ?auto_43676 ?auto_43678 ) ) ( OBJ-AT ?auto_43678 ?auto_43677 ) ( TRUCK-AT ?auto_43679 ?auto_43674 ) ( not ( = ?auto_43680 ?auto_43675 ) ) ( IN-TRUCK ?auto_43680 ?auto_43679 ) ( not ( = ?auto_43676 ?auto_43680 ) ) ( not ( = ?auto_43678 ?auto_43680 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_43676 ?auto_43674 )
      ( DELIVER-2PKG-VERIFY ?auto_43675 ?auto_43676 ?auto_43674 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_43683 - OBJ
      ?auto_43684 - OBJ
      ?auto_43682 - LOCATION
    )
    :vars
    (
      ?auto_43689 - OBJ
      ?auto_43685 - LOCATION
      ?auto_43688 - CITY
      ?auto_43687 - OBJ
      ?auto_43686 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_43684 ?auto_43683 ) ) ( not ( = ?auto_43684 ?auto_43689 ) ) ( IN-CITY ?auto_43685 ?auto_43688 ) ( IN-CITY ?auto_43682 ?auto_43688 ) ( not ( = ?auto_43682 ?auto_43685 ) ) ( OBJ-AT ?auto_43689 ?auto_43682 ) ( OBJ-AT ?auto_43684 ?auto_43685 ) ( not ( = ?auto_43687 ?auto_43689 ) ) ( not ( = ?auto_43684 ?auto_43687 ) ) ( OBJ-AT ?auto_43687 ?auto_43685 ) ( TRUCK-AT ?auto_43686 ?auto_43682 ) ( not ( = ?auto_43683 ?auto_43689 ) ) ( IN-TRUCK ?auto_43683 ?auto_43686 ) ( not ( = ?auto_43687 ?auto_43683 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43689 ?auto_43684 ?auto_43682 )
      ( DELIVER-2PKG-VERIFY ?auto_43683 ?auto_43684 ?auto_43682 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_43691 - OBJ
      ?auto_43692 - OBJ
      ?auto_43690 - LOCATION
    )
    :vars
    (
      ?auto_43697 - OBJ
      ?auto_43693 - LOCATION
      ?auto_43695 - CITY
      ?auto_43694 - TRUCK
      ?auto_43696 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_43692 ?auto_43691 ) ) ( not ( = ?auto_43692 ?auto_43697 ) ) ( IN-CITY ?auto_43693 ?auto_43695 ) ( IN-CITY ?auto_43690 ?auto_43695 ) ( not ( = ?auto_43690 ?auto_43693 ) ) ( OBJ-AT ?auto_43697 ?auto_43690 ) ( OBJ-AT ?auto_43692 ?auto_43693 ) ( not ( = ?auto_43691 ?auto_43697 ) ) ( OBJ-AT ?auto_43691 ?auto_43693 ) ( TRUCK-AT ?auto_43694 ?auto_43690 ) ( not ( = ?auto_43696 ?auto_43697 ) ) ( IN-TRUCK ?auto_43696 ?auto_43694 ) ( not ( = ?auto_43692 ?auto_43696 ) ) ( not ( = ?auto_43691 ?auto_43696 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43697 ?auto_43692 ?auto_43690 )
      ( DELIVER-2PKG-VERIFY ?auto_43691 ?auto_43692 ?auto_43690 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_43699 - OBJ
      ?auto_43700 - OBJ
      ?auto_43698 - LOCATION
    )
    :vars
    (
      ?auto_43701 - LOCATION
      ?auto_43704 - CITY
      ?auto_43703 - OBJ
      ?auto_43702 - TRUCK
      ?auto_43705 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_43700 ?auto_43699 ) ) ( IN-CITY ?auto_43701 ?auto_43704 ) ( IN-CITY ?auto_43698 ?auto_43704 ) ( not ( = ?auto_43698 ?auto_43701 ) ) ( OBJ-AT ?auto_43700 ?auto_43698 ) ( OBJ-AT ?auto_43699 ?auto_43701 ) ( not ( = ?auto_43703 ?auto_43700 ) ) ( not ( = ?auto_43699 ?auto_43703 ) ) ( OBJ-AT ?auto_43703 ?auto_43701 ) ( TRUCK-AT ?auto_43702 ?auto_43698 ) ( not ( = ?auto_43705 ?auto_43700 ) ) ( IN-TRUCK ?auto_43705 ?auto_43702 ) ( not ( = ?auto_43699 ?auto_43705 ) ) ( not ( = ?auto_43703 ?auto_43705 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43700 ?auto_43699 ?auto_43698 )
      ( DELIVER-2PKG-VERIFY ?auto_43699 ?auto_43700 ?auto_43698 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_43707 - OBJ
      ?auto_43708 - OBJ
      ?auto_43706 - LOCATION
    )
    :vars
    (
      ?auto_43713 - OBJ
      ?auto_43709 - LOCATION
      ?auto_43712 - CITY
      ?auto_43711 - OBJ
      ?auto_43710 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_43708 ?auto_43707 ) ) ( not ( = ?auto_43707 ?auto_43713 ) ) ( IN-CITY ?auto_43709 ?auto_43712 ) ( IN-CITY ?auto_43706 ?auto_43712 ) ( not ( = ?auto_43706 ?auto_43709 ) ) ( OBJ-AT ?auto_43713 ?auto_43706 ) ( OBJ-AT ?auto_43707 ?auto_43709 ) ( not ( = ?auto_43711 ?auto_43713 ) ) ( not ( = ?auto_43707 ?auto_43711 ) ) ( OBJ-AT ?auto_43711 ?auto_43709 ) ( TRUCK-AT ?auto_43710 ?auto_43706 ) ( not ( = ?auto_43708 ?auto_43713 ) ) ( IN-TRUCK ?auto_43708 ?auto_43710 ) ( not ( = ?auto_43711 ?auto_43708 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43713 ?auto_43707 ?auto_43706 )
      ( DELIVER-2PKG-VERIFY ?auto_43707 ?auto_43708 ?auto_43706 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_43715 - OBJ
      ?auto_43716 - OBJ
      ?auto_43714 - LOCATION
    )
    :vars
    (
      ?auto_43721 - OBJ
      ?auto_43717 - LOCATION
      ?auto_43719 - CITY
      ?auto_43718 - TRUCK
      ?auto_43720 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_43716 ?auto_43715 ) ) ( not ( = ?auto_43715 ?auto_43721 ) ) ( IN-CITY ?auto_43717 ?auto_43719 ) ( IN-CITY ?auto_43714 ?auto_43719 ) ( not ( = ?auto_43714 ?auto_43717 ) ) ( OBJ-AT ?auto_43721 ?auto_43714 ) ( OBJ-AT ?auto_43715 ?auto_43717 ) ( not ( = ?auto_43716 ?auto_43721 ) ) ( OBJ-AT ?auto_43716 ?auto_43717 ) ( TRUCK-AT ?auto_43718 ?auto_43714 ) ( not ( = ?auto_43720 ?auto_43721 ) ) ( IN-TRUCK ?auto_43720 ?auto_43718 ) ( not ( = ?auto_43715 ?auto_43720 ) ) ( not ( = ?auto_43716 ?auto_43720 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43721 ?auto_43715 ?auto_43714 )
      ( DELIVER-2PKG-VERIFY ?auto_43715 ?auto_43716 ?auto_43714 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43741 - OBJ
      ?auto_43742 - OBJ
      ?auto_43743 - OBJ
      ?auto_43740 - LOCATION
    )
    :vars
    (
      ?auto_43744 - LOCATION
      ?auto_43747 - CITY
      ?auto_43746 - OBJ
      ?auto_43745 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_43742 ?auto_43741 ) ) ( not ( = ?auto_43743 ?auto_43741 ) ) ( not ( = ?auto_43743 ?auto_43742 ) ) ( IN-CITY ?auto_43744 ?auto_43747 ) ( IN-CITY ?auto_43740 ?auto_43747 ) ( not ( = ?auto_43740 ?auto_43744 ) ) ( OBJ-AT ?auto_43741 ?auto_43740 ) ( OBJ-AT ?auto_43743 ?auto_43744 ) ( not ( = ?auto_43746 ?auto_43741 ) ) ( not ( = ?auto_43743 ?auto_43746 ) ) ( OBJ-AT ?auto_43746 ?auto_43744 ) ( TRUCK-AT ?auto_43745 ?auto_43740 ) ( IN-TRUCK ?auto_43742 ?auto_43745 ) ( not ( = ?auto_43746 ?auto_43742 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43741 ?auto_43743 ?auto_43740 )
      ( DELIVER-3PKG-VERIFY ?auto_43741 ?auto_43742 ?auto_43743 ?auto_43740 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43749 - OBJ
      ?auto_43750 - OBJ
      ?auto_43751 - OBJ
      ?auto_43748 - LOCATION
    )
    :vars
    (
      ?auto_43752 - LOCATION
      ?auto_43754 - CITY
      ?auto_43753 - TRUCK
      ?auto_43755 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_43750 ?auto_43749 ) ) ( not ( = ?auto_43751 ?auto_43749 ) ) ( not ( = ?auto_43751 ?auto_43750 ) ) ( IN-CITY ?auto_43752 ?auto_43754 ) ( IN-CITY ?auto_43748 ?auto_43754 ) ( not ( = ?auto_43748 ?auto_43752 ) ) ( OBJ-AT ?auto_43749 ?auto_43748 ) ( OBJ-AT ?auto_43751 ?auto_43752 ) ( OBJ-AT ?auto_43750 ?auto_43752 ) ( TRUCK-AT ?auto_43753 ?auto_43748 ) ( not ( = ?auto_43755 ?auto_43749 ) ) ( IN-TRUCK ?auto_43755 ?auto_43753 ) ( not ( = ?auto_43751 ?auto_43755 ) ) ( not ( = ?auto_43750 ?auto_43755 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43749 ?auto_43751 ?auto_43748 )
      ( DELIVER-3PKG-VERIFY ?auto_43749 ?auto_43750 ?auto_43751 ?auto_43748 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43766 - OBJ
      ?auto_43767 - OBJ
      ?auto_43768 - OBJ
      ?auto_43765 - LOCATION
    )
    :vars
    (
      ?auto_43769 - LOCATION
      ?auto_43772 - CITY
      ?auto_43771 - OBJ
      ?auto_43770 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_43767 ?auto_43766 ) ) ( not ( = ?auto_43768 ?auto_43766 ) ) ( not ( = ?auto_43768 ?auto_43767 ) ) ( IN-CITY ?auto_43769 ?auto_43772 ) ( IN-CITY ?auto_43765 ?auto_43772 ) ( not ( = ?auto_43765 ?auto_43769 ) ) ( OBJ-AT ?auto_43766 ?auto_43765 ) ( OBJ-AT ?auto_43767 ?auto_43769 ) ( not ( = ?auto_43771 ?auto_43766 ) ) ( not ( = ?auto_43767 ?auto_43771 ) ) ( OBJ-AT ?auto_43771 ?auto_43769 ) ( TRUCK-AT ?auto_43770 ?auto_43765 ) ( IN-TRUCK ?auto_43768 ?auto_43770 ) ( not ( = ?auto_43771 ?auto_43768 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43766 ?auto_43767 ?auto_43765 )
      ( DELIVER-3PKG-VERIFY ?auto_43766 ?auto_43767 ?auto_43768 ?auto_43765 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43774 - OBJ
      ?auto_43775 - OBJ
      ?auto_43776 - OBJ
      ?auto_43773 - LOCATION
    )
    :vars
    (
      ?auto_43777 - LOCATION
      ?auto_43779 - CITY
      ?auto_43778 - TRUCK
      ?auto_43780 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_43775 ?auto_43774 ) ) ( not ( = ?auto_43776 ?auto_43774 ) ) ( not ( = ?auto_43776 ?auto_43775 ) ) ( IN-CITY ?auto_43777 ?auto_43779 ) ( IN-CITY ?auto_43773 ?auto_43779 ) ( not ( = ?auto_43773 ?auto_43777 ) ) ( OBJ-AT ?auto_43774 ?auto_43773 ) ( OBJ-AT ?auto_43775 ?auto_43777 ) ( OBJ-AT ?auto_43776 ?auto_43777 ) ( TRUCK-AT ?auto_43778 ?auto_43773 ) ( not ( = ?auto_43780 ?auto_43774 ) ) ( IN-TRUCK ?auto_43780 ?auto_43778 ) ( not ( = ?auto_43775 ?auto_43780 ) ) ( not ( = ?auto_43776 ?auto_43780 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43774 ?auto_43775 ?auto_43773 )
      ( DELIVER-3PKG-VERIFY ?auto_43774 ?auto_43775 ?auto_43776 ?auto_43773 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43791 - OBJ
      ?auto_43792 - OBJ
      ?auto_43793 - OBJ
      ?auto_43790 - LOCATION
    )
    :vars
    (
      ?auto_43794 - LOCATION
      ?auto_43797 - CITY
      ?auto_43796 - OBJ
      ?auto_43795 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_43792 ?auto_43791 ) ) ( not ( = ?auto_43793 ?auto_43791 ) ) ( not ( = ?auto_43793 ?auto_43792 ) ) ( IN-CITY ?auto_43794 ?auto_43797 ) ( IN-CITY ?auto_43790 ?auto_43797 ) ( not ( = ?auto_43790 ?auto_43794 ) ) ( OBJ-AT ?auto_43792 ?auto_43790 ) ( OBJ-AT ?auto_43793 ?auto_43794 ) ( not ( = ?auto_43796 ?auto_43792 ) ) ( not ( = ?auto_43793 ?auto_43796 ) ) ( OBJ-AT ?auto_43796 ?auto_43794 ) ( TRUCK-AT ?auto_43795 ?auto_43790 ) ( IN-TRUCK ?auto_43791 ?auto_43795 ) ( not ( = ?auto_43796 ?auto_43791 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43792 ?auto_43793 ?auto_43790 )
      ( DELIVER-3PKG-VERIFY ?auto_43791 ?auto_43792 ?auto_43793 ?auto_43790 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43808 - OBJ
      ?auto_43809 - OBJ
      ?auto_43810 - OBJ
      ?auto_43807 - LOCATION
    )
    :vars
    (
      ?auto_43814 - OBJ
      ?auto_43811 - LOCATION
      ?auto_43813 - CITY
      ?auto_43812 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_43809 ?auto_43808 ) ) ( not ( = ?auto_43810 ?auto_43808 ) ) ( not ( = ?auto_43810 ?auto_43809 ) ) ( not ( = ?auto_43810 ?auto_43814 ) ) ( IN-CITY ?auto_43811 ?auto_43813 ) ( IN-CITY ?auto_43807 ?auto_43813 ) ( not ( = ?auto_43807 ?auto_43811 ) ) ( OBJ-AT ?auto_43814 ?auto_43807 ) ( OBJ-AT ?auto_43810 ?auto_43811 ) ( not ( = ?auto_43809 ?auto_43814 ) ) ( OBJ-AT ?auto_43809 ?auto_43811 ) ( TRUCK-AT ?auto_43812 ?auto_43807 ) ( not ( = ?auto_43808 ?auto_43814 ) ) ( IN-TRUCK ?auto_43808 ?auto_43812 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43814 ?auto_43810 ?auto_43807 )
      ( DELIVER-3PKG-VERIFY ?auto_43808 ?auto_43809 ?auto_43810 ?auto_43807 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43816 - OBJ
      ?auto_43817 - OBJ
      ?auto_43818 - OBJ
      ?auto_43815 - LOCATION
    )
    :vars
    (
      ?auto_43819 - LOCATION
      ?auto_43822 - CITY
      ?auto_43821 - OBJ
      ?auto_43820 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_43817 ?auto_43816 ) ) ( not ( = ?auto_43818 ?auto_43816 ) ) ( not ( = ?auto_43818 ?auto_43817 ) ) ( IN-CITY ?auto_43819 ?auto_43822 ) ( IN-CITY ?auto_43815 ?auto_43822 ) ( not ( = ?auto_43815 ?auto_43819 ) ) ( OBJ-AT ?auto_43818 ?auto_43815 ) ( OBJ-AT ?auto_43817 ?auto_43819 ) ( not ( = ?auto_43821 ?auto_43818 ) ) ( not ( = ?auto_43817 ?auto_43821 ) ) ( OBJ-AT ?auto_43821 ?auto_43819 ) ( TRUCK-AT ?auto_43820 ?auto_43815 ) ( IN-TRUCK ?auto_43816 ?auto_43820 ) ( not ( = ?auto_43821 ?auto_43816 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43818 ?auto_43817 ?auto_43815 )
      ( DELIVER-3PKG-VERIFY ?auto_43816 ?auto_43817 ?auto_43818 ?auto_43815 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43833 - OBJ
      ?auto_43834 - OBJ
      ?auto_43835 - OBJ
      ?auto_43832 - LOCATION
    )
    :vars
    (
      ?auto_43839 - OBJ
      ?auto_43836 - LOCATION
      ?auto_43838 - CITY
      ?auto_43837 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_43834 ?auto_43833 ) ) ( not ( = ?auto_43835 ?auto_43833 ) ) ( not ( = ?auto_43835 ?auto_43834 ) ) ( not ( = ?auto_43834 ?auto_43839 ) ) ( IN-CITY ?auto_43836 ?auto_43838 ) ( IN-CITY ?auto_43832 ?auto_43838 ) ( not ( = ?auto_43832 ?auto_43836 ) ) ( OBJ-AT ?auto_43839 ?auto_43832 ) ( OBJ-AT ?auto_43834 ?auto_43836 ) ( not ( = ?auto_43835 ?auto_43839 ) ) ( OBJ-AT ?auto_43835 ?auto_43836 ) ( TRUCK-AT ?auto_43837 ?auto_43832 ) ( not ( = ?auto_43833 ?auto_43839 ) ) ( IN-TRUCK ?auto_43833 ?auto_43837 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43839 ?auto_43834 ?auto_43832 )
      ( DELIVER-3PKG-VERIFY ?auto_43833 ?auto_43834 ?auto_43835 ?auto_43832 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43850 - OBJ
      ?auto_43851 - OBJ
      ?auto_43852 - OBJ
      ?auto_43849 - LOCATION
    )
    :vars
    (
      ?auto_43853 - LOCATION
      ?auto_43855 - CITY
      ?auto_43854 - TRUCK
      ?auto_43856 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_43851 ?auto_43850 ) ) ( not ( = ?auto_43852 ?auto_43850 ) ) ( not ( = ?auto_43852 ?auto_43851 ) ) ( IN-CITY ?auto_43853 ?auto_43855 ) ( IN-CITY ?auto_43849 ?auto_43855 ) ( not ( = ?auto_43849 ?auto_43853 ) ) ( OBJ-AT ?auto_43851 ?auto_43849 ) ( OBJ-AT ?auto_43852 ?auto_43853 ) ( OBJ-AT ?auto_43850 ?auto_43853 ) ( TRUCK-AT ?auto_43854 ?auto_43849 ) ( not ( = ?auto_43856 ?auto_43851 ) ) ( IN-TRUCK ?auto_43856 ?auto_43854 ) ( not ( = ?auto_43852 ?auto_43856 ) ) ( not ( = ?auto_43850 ?auto_43856 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43851 ?auto_43852 ?auto_43849 )
      ( DELIVER-3PKG-VERIFY ?auto_43850 ?auto_43851 ?auto_43852 ?auto_43849 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43858 - OBJ
      ?auto_43859 - OBJ
      ?auto_43860 - OBJ
      ?auto_43857 - LOCATION
    )
    :vars
    (
      ?auto_43864 - OBJ
      ?auto_43861 - LOCATION
      ?auto_43863 - CITY
      ?auto_43862 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_43859 ?auto_43858 ) ) ( not ( = ?auto_43860 ?auto_43858 ) ) ( not ( = ?auto_43860 ?auto_43859 ) ) ( not ( = ?auto_43860 ?auto_43864 ) ) ( IN-CITY ?auto_43861 ?auto_43863 ) ( IN-CITY ?auto_43857 ?auto_43863 ) ( not ( = ?auto_43857 ?auto_43861 ) ) ( OBJ-AT ?auto_43864 ?auto_43857 ) ( OBJ-AT ?auto_43860 ?auto_43861 ) ( not ( = ?auto_43858 ?auto_43864 ) ) ( OBJ-AT ?auto_43858 ?auto_43861 ) ( TRUCK-AT ?auto_43862 ?auto_43857 ) ( not ( = ?auto_43859 ?auto_43864 ) ) ( IN-TRUCK ?auto_43859 ?auto_43862 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43864 ?auto_43860 ?auto_43857 )
      ( DELIVER-3PKG-VERIFY ?auto_43858 ?auto_43859 ?auto_43860 ?auto_43857 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43875 - OBJ
      ?auto_43876 - OBJ
      ?auto_43877 - OBJ
      ?auto_43874 - LOCATION
    )
    :vars
    (
      ?auto_43878 - LOCATION
      ?auto_43880 - CITY
      ?auto_43879 - TRUCK
      ?auto_43881 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_43876 ?auto_43875 ) ) ( not ( = ?auto_43877 ?auto_43875 ) ) ( not ( = ?auto_43877 ?auto_43876 ) ) ( IN-CITY ?auto_43878 ?auto_43880 ) ( IN-CITY ?auto_43874 ?auto_43880 ) ( not ( = ?auto_43874 ?auto_43878 ) ) ( OBJ-AT ?auto_43877 ?auto_43874 ) ( OBJ-AT ?auto_43876 ?auto_43878 ) ( OBJ-AT ?auto_43875 ?auto_43878 ) ( TRUCK-AT ?auto_43879 ?auto_43874 ) ( not ( = ?auto_43881 ?auto_43877 ) ) ( IN-TRUCK ?auto_43881 ?auto_43879 ) ( not ( = ?auto_43876 ?auto_43881 ) ) ( not ( = ?auto_43875 ?auto_43881 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43877 ?auto_43876 ?auto_43874 )
      ( DELIVER-3PKG-VERIFY ?auto_43875 ?auto_43876 ?auto_43877 ?auto_43874 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43883 - OBJ
      ?auto_43884 - OBJ
      ?auto_43885 - OBJ
      ?auto_43882 - LOCATION
    )
    :vars
    (
      ?auto_43889 - OBJ
      ?auto_43886 - LOCATION
      ?auto_43888 - CITY
      ?auto_43887 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_43884 ?auto_43883 ) ) ( not ( = ?auto_43885 ?auto_43883 ) ) ( not ( = ?auto_43885 ?auto_43884 ) ) ( not ( = ?auto_43884 ?auto_43889 ) ) ( IN-CITY ?auto_43886 ?auto_43888 ) ( IN-CITY ?auto_43882 ?auto_43888 ) ( not ( = ?auto_43882 ?auto_43886 ) ) ( OBJ-AT ?auto_43889 ?auto_43882 ) ( OBJ-AT ?auto_43884 ?auto_43886 ) ( not ( = ?auto_43883 ?auto_43889 ) ) ( OBJ-AT ?auto_43883 ?auto_43886 ) ( TRUCK-AT ?auto_43887 ?auto_43882 ) ( not ( = ?auto_43885 ?auto_43889 ) ) ( IN-TRUCK ?auto_43885 ?auto_43887 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43889 ?auto_43884 ?auto_43882 )
      ( DELIVER-3PKG-VERIFY ?auto_43883 ?auto_43884 ?auto_43885 ?auto_43882 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43918 - OBJ
      ?auto_43919 - OBJ
      ?auto_43920 - OBJ
      ?auto_43917 - LOCATION
    )
    :vars
    (
      ?auto_43921 - LOCATION
      ?auto_43924 - CITY
      ?auto_43923 - OBJ
      ?auto_43922 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_43919 ?auto_43918 ) ) ( not ( = ?auto_43920 ?auto_43918 ) ) ( not ( = ?auto_43920 ?auto_43919 ) ) ( IN-CITY ?auto_43921 ?auto_43924 ) ( IN-CITY ?auto_43917 ?auto_43924 ) ( not ( = ?auto_43917 ?auto_43921 ) ) ( OBJ-AT ?auto_43919 ?auto_43917 ) ( OBJ-AT ?auto_43918 ?auto_43921 ) ( not ( = ?auto_43923 ?auto_43919 ) ) ( not ( = ?auto_43918 ?auto_43923 ) ) ( OBJ-AT ?auto_43923 ?auto_43921 ) ( TRUCK-AT ?auto_43922 ?auto_43917 ) ( IN-TRUCK ?auto_43920 ?auto_43922 ) ( not ( = ?auto_43923 ?auto_43920 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43919 ?auto_43918 ?auto_43917 )
      ( DELIVER-3PKG-VERIFY ?auto_43918 ?auto_43919 ?auto_43920 ?auto_43917 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43926 - OBJ
      ?auto_43927 - OBJ
      ?auto_43928 - OBJ
      ?auto_43925 - LOCATION
    )
    :vars
    (
      ?auto_43929 - LOCATION
      ?auto_43931 - CITY
      ?auto_43930 - TRUCK
      ?auto_43932 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_43927 ?auto_43926 ) ) ( not ( = ?auto_43928 ?auto_43926 ) ) ( not ( = ?auto_43928 ?auto_43927 ) ) ( IN-CITY ?auto_43929 ?auto_43931 ) ( IN-CITY ?auto_43925 ?auto_43931 ) ( not ( = ?auto_43925 ?auto_43929 ) ) ( OBJ-AT ?auto_43927 ?auto_43925 ) ( OBJ-AT ?auto_43926 ?auto_43929 ) ( OBJ-AT ?auto_43928 ?auto_43929 ) ( TRUCK-AT ?auto_43930 ?auto_43925 ) ( not ( = ?auto_43932 ?auto_43927 ) ) ( IN-TRUCK ?auto_43932 ?auto_43930 ) ( not ( = ?auto_43926 ?auto_43932 ) ) ( not ( = ?auto_43928 ?auto_43932 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43927 ?auto_43926 ?auto_43925 )
      ( DELIVER-3PKG-VERIFY ?auto_43926 ?auto_43927 ?auto_43928 ?auto_43925 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43943 - OBJ
      ?auto_43944 - OBJ
      ?auto_43945 - OBJ
      ?auto_43942 - LOCATION
    )
    :vars
    (
      ?auto_43946 - LOCATION
      ?auto_43949 - CITY
      ?auto_43948 - OBJ
      ?auto_43947 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_43944 ?auto_43943 ) ) ( not ( = ?auto_43945 ?auto_43943 ) ) ( not ( = ?auto_43945 ?auto_43944 ) ) ( IN-CITY ?auto_43946 ?auto_43949 ) ( IN-CITY ?auto_43942 ?auto_43949 ) ( not ( = ?auto_43942 ?auto_43946 ) ) ( OBJ-AT ?auto_43945 ?auto_43942 ) ( OBJ-AT ?auto_43943 ?auto_43946 ) ( not ( = ?auto_43948 ?auto_43945 ) ) ( not ( = ?auto_43943 ?auto_43948 ) ) ( OBJ-AT ?auto_43948 ?auto_43946 ) ( TRUCK-AT ?auto_43947 ?auto_43942 ) ( IN-TRUCK ?auto_43944 ?auto_43947 ) ( not ( = ?auto_43948 ?auto_43944 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43945 ?auto_43943 ?auto_43942 )
      ( DELIVER-3PKG-VERIFY ?auto_43943 ?auto_43944 ?auto_43945 ?auto_43942 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43960 - OBJ
      ?auto_43961 - OBJ
      ?auto_43962 - OBJ
      ?auto_43959 - LOCATION
    )
    :vars
    (
      ?auto_43966 - OBJ
      ?auto_43963 - LOCATION
      ?auto_43965 - CITY
      ?auto_43964 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_43961 ?auto_43960 ) ) ( not ( = ?auto_43962 ?auto_43960 ) ) ( not ( = ?auto_43962 ?auto_43961 ) ) ( not ( = ?auto_43960 ?auto_43966 ) ) ( IN-CITY ?auto_43963 ?auto_43965 ) ( IN-CITY ?auto_43959 ?auto_43965 ) ( not ( = ?auto_43959 ?auto_43963 ) ) ( OBJ-AT ?auto_43966 ?auto_43959 ) ( OBJ-AT ?auto_43960 ?auto_43963 ) ( not ( = ?auto_43962 ?auto_43966 ) ) ( OBJ-AT ?auto_43962 ?auto_43963 ) ( TRUCK-AT ?auto_43964 ?auto_43959 ) ( not ( = ?auto_43961 ?auto_43966 ) ) ( IN-TRUCK ?auto_43961 ?auto_43964 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43966 ?auto_43960 ?auto_43959 )
      ( DELIVER-3PKG-VERIFY ?auto_43960 ?auto_43961 ?auto_43962 ?auto_43959 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43977 - OBJ
      ?auto_43978 - OBJ
      ?auto_43979 - OBJ
      ?auto_43976 - LOCATION
    )
    :vars
    (
      ?auto_43980 - LOCATION
      ?auto_43982 - CITY
      ?auto_43981 - TRUCK
      ?auto_43983 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_43978 ?auto_43977 ) ) ( not ( = ?auto_43979 ?auto_43977 ) ) ( not ( = ?auto_43979 ?auto_43978 ) ) ( IN-CITY ?auto_43980 ?auto_43982 ) ( IN-CITY ?auto_43976 ?auto_43982 ) ( not ( = ?auto_43976 ?auto_43980 ) ) ( OBJ-AT ?auto_43979 ?auto_43976 ) ( OBJ-AT ?auto_43977 ?auto_43980 ) ( OBJ-AT ?auto_43978 ?auto_43980 ) ( TRUCK-AT ?auto_43981 ?auto_43976 ) ( not ( = ?auto_43983 ?auto_43979 ) ) ( IN-TRUCK ?auto_43983 ?auto_43981 ) ( not ( = ?auto_43977 ?auto_43983 ) ) ( not ( = ?auto_43978 ?auto_43983 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43979 ?auto_43977 ?auto_43976 )
      ( DELIVER-3PKG-VERIFY ?auto_43977 ?auto_43978 ?auto_43979 ?auto_43976 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43985 - OBJ
      ?auto_43986 - OBJ
      ?auto_43987 - OBJ
      ?auto_43984 - LOCATION
    )
    :vars
    (
      ?auto_43991 - OBJ
      ?auto_43988 - LOCATION
      ?auto_43990 - CITY
      ?auto_43989 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_43986 ?auto_43985 ) ) ( not ( = ?auto_43987 ?auto_43985 ) ) ( not ( = ?auto_43987 ?auto_43986 ) ) ( not ( = ?auto_43985 ?auto_43991 ) ) ( IN-CITY ?auto_43988 ?auto_43990 ) ( IN-CITY ?auto_43984 ?auto_43990 ) ( not ( = ?auto_43984 ?auto_43988 ) ) ( OBJ-AT ?auto_43991 ?auto_43984 ) ( OBJ-AT ?auto_43985 ?auto_43988 ) ( not ( = ?auto_43986 ?auto_43991 ) ) ( OBJ-AT ?auto_43986 ?auto_43988 ) ( TRUCK-AT ?auto_43989 ?auto_43984 ) ( not ( = ?auto_43987 ?auto_43991 ) ) ( IN-TRUCK ?auto_43987 ?auto_43989 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43991 ?auto_43985 ?auto_43984 )
      ( DELIVER-3PKG-VERIFY ?auto_43985 ?auto_43986 ?auto_43987 ?auto_43984 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_44132 - OBJ
      ?auto_44133 - OBJ
      ?auto_44134 - OBJ
      ?auto_44135 - OBJ
      ?auto_44131 - LOCATION
    )
    :vars
    (
      ?auto_44136 - LOCATION
      ?auto_44138 - CITY
      ?auto_44137 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_44133 ?auto_44132 ) ) ( not ( = ?auto_44134 ?auto_44132 ) ) ( not ( = ?auto_44134 ?auto_44133 ) ) ( not ( = ?auto_44135 ?auto_44132 ) ) ( not ( = ?auto_44135 ?auto_44133 ) ) ( not ( = ?auto_44135 ?auto_44134 ) ) ( IN-CITY ?auto_44136 ?auto_44138 ) ( IN-CITY ?auto_44131 ?auto_44138 ) ( not ( = ?auto_44131 ?auto_44136 ) ) ( OBJ-AT ?auto_44132 ?auto_44131 ) ( OBJ-AT ?auto_44135 ?auto_44136 ) ( OBJ-AT ?auto_44134 ?auto_44136 ) ( TRUCK-AT ?auto_44137 ?auto_44131 ) ( IN-TRUCK ?auto_44133 ?auto_44137 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_44132 ?auto_44135 ?auto_44131 )
      ( DELIVER-4PKG-VERIFY ?auto_44132 ?auto_44133 ?auto_44134 ?auto_44135 ?auto_44131 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_44158 - OBJ
      ?auto_44159 - OBJ
      ?auto_44160 - OBJ
      ?auto_44161 - OBJ
      ?auto_44157 - LOCATION
    )
    :vars
    (
      ?auto_44162 - LOCATION
      ?auto_44164 - CITY
      ?auto_44163 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_44159 ?auto_44158 ) ) ( not ( = ?auto_44160 ?auto_44158 ) ) ( not ( = ?auto_44160 ?auto_44159 ) ) ( not ( = ?auto_44161 ?auto_44158 ) ) ( not ( = ?auto_44161 ?auto_44159 ) ) ( not ( = ?auto_44161 ?auto_44160 ) ) ( IN-CITY ?auto_44162 ?auto_44164 ) ( IN-CITY ?auto_44157 ?auto_44164 ) ( not ( = ?auto_44157 ?auto_44162 ) ) ( OBJ-AT ?auto_44158 ?auto_44157 ) ( OBJ-AT ?auto_44160 ?auto_44162 ) ( OBJ-AT ?auto_44161 ?auto_44162 ) ( TRUCK-AT ?auto_44163 ?auto_44157 ) ( IN-TRUCK ?auto_44159 ?auto_44163 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_44158 ?auto_44160 ?auto_44157 )
      ( DELIVER-4PKG-VERIFY ?auto_44158 ?auto_44159 ?auto_44160 ?auto_44161 ?auto_44157 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_44184 - OBJ
      ?auto_44185 - OBJ
      ?auto_44186 - OBJ
      ?auto_44187 - OBJ
      ?auto_44183 - LOCATION
    )
    :vars
    (
      ?auto_44188 - LOCATION
      ?auto_44190 - CITY
      ?auto_44189 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_44185 ?auto_44184 ) ) ( not ( = ?auto_44186 ?auto_44184 ) ) ( not ( = ?auto_44186 ?auto_44185 ) ) ( not ( = ?auto_44187 ?auto_44184 ) ) ( not ( = ?auto_44187 ?auto_44185 ) ) ( not ( = ?auto_44187 ?auto_44186 ) ) ( IN-CITY ?auto_44188 ?auto_44190 ) ( IN-CITY ?auto_44183 ?auto_44190 ) ( not ( = ?auto_44183 ?auto_44188 ) ) ( OBJ-AT ?auto_44184 ?auto_44183 ) ( OBJ-AT ?auto_44187 ?auto_44188 ) ( OBJ-AT ?auto_44185 ?auto_44188 ) ( TRUCK-AT ?auto_44189 ?auto_44183 ) ( IN-TRUCK ?auto_44186 ?auto_44189 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_44184 ?auto_44187 ?auto_44183 )
      ( DELIVER-4PKG-VERIFY ?auto_44184 ?auto_44185 ?auto_44186 ?auto_44187 ?auto_44183 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_44210 - OBJ
      ?auto_44211 - OBJ
      ?auto_44212 - OBJ
      ?auto_44213 - OBJ
      ?auto_44209 - LOCATION
    )
    :vars
    (
      ?auto_44214 - LOCATION
      ?auto_44216 - CITY
      ?auto_44215 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_44211 ?auto_44210 ) ) ( not ( = ?auto_44212 ?auto_44210 ) ) ( not ( = ?auto_44212 ?auto_44211 ) ) ( not ( = ?auto_44213 ?auto_44210 ) ) ( not ( = ?auto_44213 ?auto_44211 ) ) ( not ( = ?auto_44213 ?auto_44212 ) ) ( IN-CITY ?auto_44214 ?auto_44216 ) ( IN-CITY ?auto_44209 ?auto_44216 ) ( not ( = ?auto_44209 ?auto_44214 ) ) ( OBJ-AT ?auto_44210 ?auto_44209 ) ( OBJ-AT ?auto_44212 ?auto_44214 ) ( OBJ-AT ?auto_44211 ?auto_44214 ) ( TRUCK-AT ?auto_44215 ?auto_44209 ) ( IN-TRUCK ?auto_44213 ?auto_44215 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_44210 ?auto_44212 ?auto_44209 )
      ( DELIVER-4PKG-VERIFY ?auto_44210 ?auto_44211 ?auto_44212 ?auto_44213 ?auto_44209 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_44292 - OBJ
      ?auto_44293 - OBJ
      ?auto_44294 - OBJ
      ?auto_44295 - OBJ
      ?auto_44291 - LOCATION
    )
    :vars
    (
      ?auto_44296 - LOCATION
      ?auto_44298 - CITY
      ?auto_44297 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_44293 ?auto_44292 ) ) ( not ( = ?auto_44294 ?auto_44292 ) ) ( not ( = ?auto_44294 ?auto_44293 ) ) ( not ( = ?auto_44295 ?auto_44292 ) ) ( not ( = ?auto_44295 ?auto_44293 ) ) ( not ( = ?auto_44295 ?auto_44294 ) ) ( IN-CITY ?auto_44296 ?auto_44298 ) ( IN-CITY ?auto_44291 ?auto_44298 ) ( not ( = ?auto_44291 ?auto_44296 ) ) ( OBJ-AT ?auto_44292 ?auto_44291 ) ( OBJ-AT ?auto_44293 ?auto_44296 ) ( OBJ-AT ?auto_44295 ?auto_44296 ) ( TRUCK-AT ?auto_44297 ?auto_44291 ) ( IN-TRUCK ?auto_44294 ?auto_44297 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_44292 ?auto_44293 ?auto_44291 )
      ( DELIVER-4PKG-VERIFY ?auto_44292 ?auto_44293 ?auto_44294 ?auto_44295 ?auto_44291 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_44318 - OBJ
      ?auto_44319 - OBJ
      ?auto_44320 - OBJ
      ?auto_44321 - OBJ
      ?auto_44317 - LOCATION
    )
    :vars
    (
      ?auto_44322 - LOCATION
      ?auto_44324 - CITY
      ?auto_44323 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_44319 ?auto_44318 ) ) ( not ( = ?auto_44320 ?auto_44318 ) ) ( not ( = ?auto_44320 ?auto_44319 ) ) ( not ( = ?auto_44321 ?auto_44318 ) ) ( not ( = ?auto_44321 ?auto_44319 ) ) ( not ( = ?auto_44321 ?auto_44320 ) ) ( IN-CITY ?auto_44322 ?auto_44324 ) ( IN-CITY ?auto_44317 ?auto_44324 ) ( not ( = ?auto_44317 ?auto_44322 ) ) ( OBJ-AT ?auto_44318 ?auto_44317 ) ( OBJ-AT ?auto_44319 ?auto_44322 ) ( OBJ-AT ?auto_44320 ?auto_44322 ) ( TRUCK-AT ?auto_44323 ?auto_44317 ) ( IN-TRUCK ?auto_44321 ?auto_44323 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_44318 ?auto_44319 ?auto_44317 )
      ( DELIVER-4PKG-VERIFY ?auto_44318 ?auto_44319 ?auto_44320 ?auto_44321 ?auto_44317 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_44400 - OBJ
      ?auto_44401 - OBJ
      ?auto_44402 - OBJ
      ?auto_44403 - OBJ
      ?auto_44399 - LOCATION
    )
    :vars
    (
      ?auto_44404 - LOCATION
      ?auto_44406 - CITY
      ?auto_44405 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_44401 ?auto_44400 ) ) ( not ( = ?auto_44402 ?auto_44400 ) ) ( not ( = ?auto_44402 ?auto_44401 ) ) ( not ( = ?auto_44403 ?auto_44400 ) ) ( not ( = ?auto_44403 ?auto_44401 ) ) ( not ( = ?auto_44403 ?auto_44402 ) ) ( IN-CITY ?auto_44404 ?auto_44406 ) ( IN-CITY ?auto_44399 ?auto_44406 ) ( not ( = ?auto_44399 ?auto_44404 ) ) ( OBJ-AT ?auto_44401 ?auto_44399 ) ( OBJ-AT ?auto_44403 ?auto_44404 ) ( OBJ-AT ?auto_44402 ?auto_44404 ) ( TRUCK-AT ?auto_44405 ?auto_44399 ) ( IN-TRUCK ?auto_44400 ?auto_44405 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_44401 ?auto_44403 ?auto_44399 )
      ( DELIVER-4PKG-VERIFY ?auto_44400 ?auto_44401 ?auto_44402 ?auto_44403 ?auto_44399 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_44426 - OBJ
      ?auto_44427 - OBJ
      ?auto_44428 - OBJ
      ?auto_44429 - OBJ
      ?auto_44425 - LOCATION
    )
    :vars
    (
      ?auto_44430 - LOCATION
      ?auto_44432 - CITY
      ?auto_44431 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_44427 ?auto_44426 ) ) ( not ( = ?auto_44428 ?auto_44426 ) ) ( not ( = ?auto_44428 ?auto_44427 ) ) ( not ( = ?auto_44429 ?auto_44426 ) ) ( not ( = ?auto_44429 ?auto_44427 ) ) ( not ( = ?auto_44429 ?auto_44428 ) ) ( IN-CITY ?auto_44430 ?auto_44432 ) ( IN-CITY ?auto_44425 ?auto_44432 ) ( not ( = ?auto_44425 ?auto_44430 ) ) ( OBJ-AT ?auto_44427 ?auto_44425 ) ( OBJ-AT ?auto_44428 ?auto_44430 ) ( OBJ-AT ?auto_44429 ?auto_44430 ) ( TRUCK-AT ?auto_44431 ?auto_44425 ) ( IN-TRUCK ?auto_44426 ?auto_44431 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_44427 ?auto_44428 ?auto_44425 )
      ( DELIVER-4PKG-VERIFY ?auto_44426 ?auto_44427 ?auto_44428 ?auto_44429 ?auto_44425 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_44509 - OBJ
      ?auto_44510 - OBJ
      ?auto_44511 - OBJ
      ?auto_44512 - OBJ
      ?auto_44508 - LOCATION
    )
    :vars
    (
      ?auto_44513 - LOCATION
      ?auto_44515 - CITY
      ?auto_44514 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_44510 ?auto_44509 ) ) ( not ( = ?auto_44511 ?auto_44509 ) ) ( not ( = ?auto_44511 ?auto_44510 ) ) ( not ( = ?auto_44512 ?auto_44509 ) ) ( not ( = ?auto_44512 ?auto_44510 ) ) ( not ( = ?auto_44512 ?auto_44511 ) ) ( IN-CITY ?auto_44513 ?auto_44515 ) ( IN-CITY ?auto_44508 ?auto_44515 ) ( not ( = ?auto_44508 ?auto_44513 ) ) ( OBJ-AT ?auto_44511 ?auto_44508 ) ( OBJ-AT ?auto_44512 ?auto_44513 ) ( OBJ-AT ?auto_44510 ?auto_44513 ) ( TRUCK-AT ?auto_44514 ?auto_44508 ) ( IN-TRUCK ?auto_44509 ?auto_44514 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_44511 ?auto_44512 ?auto_44508 )
      ( DELIVER-4PKG-VERIFY ?auto_44509 ?auto_44510 ?auto_44511 ?auto_44512 ?auto_44508 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_44535 - OBJ
      ?auto_44536 - OBJ
      ?auto_44537 - OBJ
      ?auto_44538 - OBJ
      ?auto_44534 - LOCATION
    )
    :vars
    (
      ?auto_44539 - LOCATION
      ?auto_44541 - CITY
      ?auto_44540 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_44536 ?auto_44535 ) ) ( not ( = ?auto_44537 ?auto_44535 ) ) ( not ( = ?auto_44537 ?auto_44536 ) ) ( not ( = ?auto_44538 ?auto_44535 ) ) ( not ( = ?auto_44538 ?auto_44536 ) ) ( not ( = ?auto_44538 ?auto_44537 ) ) ( IN-CITY ?auto_44539 ?auto_44541 ) ( IN-CITY ?auto_44534 ?auto_44541 ) ( not ( = ?auto_44534 ?auto_44539 ) ) ( OBJ-AT ?auto_44538 ?auto_44534 ) ( OBJ-AT ?auto_44537 ?auto_44539 ) ( OBJ-AT ?auto_44536 ?auto_44539 ) ( TRUCK-AT ?auto_44540 ?auto_44534 ) ( IN-TRUCK ?auto_44535 ?auto_44540 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_44538 ?auto_44537 ?auto_44534 )
      ( DELIVER-4PKG-VERIFY ?auto_44535 ?auto_44536 ?auto_44537 ?auto_44538 ?auto_44534 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_44588 - OBJ
      ?auto_44589 - OBJ
      ?auto_44590 - OBJ
      ?auto_44591 - OBJ
      ?auto_44587 - LOCATION
    )
    :vars
    (
      ?auto_44592 - LOCATION
      ?auto_44594 - CITY
      ?auto_44593 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_44589 ?auto_44588 ) ) ( not ( = ?auto_44590 ?auto_44588 ) ) ( not ( = ?auto_44590 ?auto_44589 ) ) ( not ( = ?auto_44591 ?auto_44588 ) ) ( not ( = ?auto_44591 ?auto_44589 ) ) ( not ( = ?auto_44591 ?auto_44590 ) ) ( IN-CITY ?auto_44592 ?auto_44594 ) ( IN-CITY ?auto_44587 ?auto_44594 ) ( not ( = ?auto_44587 ?auto_44592 ) ) ( OBJ-AT ?auto_44590 ?auto_44587 ) ( OBJ-AT ?auto_44589 ?auto_44592 ) ( OBJ-AT ?auto_44591 ?auto_44592 ) ( TRUCK-AT ?auto_44593 ?auto_44587 ) ( IN-TRUCK ?auto_44588 ?auto_44593 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_44590 ?auto_44589 ?auto_44587 )
      ( DELIVER-4PKG-VERIFY ?auto_44588 ?auto_44589 ?auto_44590 ?auto_44591 ?auto_44587 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_44643 - OBJ
      ?auto_44644 - OBJ
      ?auto_44645 - OBJ
      ?auto_44646 - OBJ
      ?auto_44642 - LOCATION
    )
    :vars
    (
      ?auto_44647 - LOCATION
      ?auto_44649 - CITY
      ?auto_44648 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_44644 ?auto_44643 ) ) ( not ( = ?auto_44645 ?auto_44643 ) ) ( not ( = ?auto_44645 ?auto_44644 ) ) ( not ( = ?auto_44646 ?auto_44643 ) ) ( not ( = ?auto_44646 ?auto_44644 ) ) ( not ( = ?auto_44646 ?auto_44645 ) ) ( IN-CITY ?auto_44647 ?auto_44649 ) ( IN-CITY ?auto_44642 ?auto_44649 ) ( not ( = ?auto_44642 ?auto_44647 ) ) ( OBJ-AT ?auto_44646 ?auto_44642 ) ( OBJ-AT ?auto_44644 ?auto_44647 ) ( OBJ-AT ?auto_44645 ?auto_44647 ) ( TRUCK-AT ?auto_44648 ?auto_44642 ) ( IN-TRUCK ?auto_44643 ?auto_44648 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_44646 ?auto_44644 ?auto_44642 )
      ( DELIVER-4PKG-VERIFY ?auto_44643 ?auto_44644 ?auto_44645 ?auto_44646 ?auto_44642 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_44725 - OBJ
      ?auto_44726 - OBJ
      ?auto_44727 - OBJ
      ?auto_44728 - OBJ
      ?auto_44724 - LOCATION
    )
    :vars
    (
      ?auto_44729 - LOCATION
      ?auto_44731 - CITY
      ?auto_44730 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_44726 ?auto_44725 ) ) ( not ( = ?auto_44727 ?auto_44725 ) ) ( not ( = ?auto_44727 ?auto_44726 ) ) ( not ( = ?auto_44728 ?auto_44725 ) ) ( not ( = ?auto_44728 ?auto_44726 ) ) ( not ( = ?auto_44728 ?auto_44727 ) ) ( IN-CITY ?auto_44729 ?auto_44731 ) ( IN-CITY ?auto_44724 ?auto_44731 ) ( not ( = ?auto_44724 ?auto_44729 ) ) ( OBJ-AT ?auto_44726 ?auto_44724 ) ( OBJ-AT ?auto_44728 ?auto_44729 ) ( OBJ-AT ?auto_44725 ?auto_44729 ) ( TRUCK-AT ?auto_44730 ?auto_44724 ) ( IN-TRUCK ?auto_44727 ?auto_44730 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_44726 ?auto_44728 ?auto_44724 )
      ( DELIVER-4PKG-VERIFY ?auto_44725 ?auto_44726 ?auto_44727 ?auto_44728 ?auto_44724 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_44751 - OBJ
      ?auto_44752 - OBJ
      ?auto_44753 - OBJ
      ?auto_44754 - OBJ
      ?auto_44750 - LOCATION
    )
    :vars
    (
      ?auto_44755 - LOCATION
      ?auto_44757 - CITY
      ?auto_44756 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_44752 ?auto_44751 ) ) ( not ( = ?auto_44753 ?auto_44751 ) ) ( not ( = ?auto_44753 ?auto_44752 ) ) ( not ( = ?auto_44754 ?auto_44751 ) ) ( not ( = ?auto_44754 ?auto_44752 ) ) ( not ( = ?auto_44754 ?auto_44753 ) ) ( IN-CITY ?auto_44755 ?auto_44757 ) ( IN-CITY ?auto_44750 ?auto_44757 ) ( not ( = ?auto_44750 ?auto_44755 ) ) ( OBJ-AT ?auto_44752 ?auto_44750 ) ( OBJ-AT ?auto_44753 ?auto_44755 ) ( OBJ-AT ?auto_44751 ?auto_44755 ) ( TRUCK-AT ?auto_44756 ?auto_44750 ) ( IN-TRUCK ?auto_44754 ?auto_44756 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_44752 ?auto_44753 ?auto_44750 )
      ( DELIVER-4PKG-VERIFY ?auto_44751 ?auto_44752 ?auto_44753 ?auto_44754 ?auto_44750 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_44777 - OBJ
      ?auto_44778 - OBJ
      ?auto_44779 - OBJ
      ?auto_44780 - OBJ
      ?auto_44776 - LOCATION
    )
    :vars
    (
      ?auto_44781 - LOCATION
      ?auto_44783 - CITY
      ?auto_44782 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_44778 ?auto_44777 ) ) ( not ( = ?auto_44779 ?auto_44777 ) ) ( not ( = ?auto_44779 ?auto_44778 ) ) ( not ( = ?auto_44780 ?auto_44777 ) ) ( not ( = ?auto_44780 ?auto_44778 ) ) ( not ( = ?auto_44780 ?auto_44779 ) ) ( IN-CITY ?auto_44781 ?auto_44783 ) ( IN-CITY ?auto_44776 ?auto_44783 ) ( not ( = ?auto_44776 ?auto_44781 ) ) ( OBJ-AT ?auto_44779 ?auto_44776 ) ( OBJ-AT ?auto_44780 ?auto_44781 ) ( OBJ-AT ?auto_44777 ?auto_44781 ) ( TRUCK-AT ?auto_44782 ?auto_44776 ) ( IN-TRUCK ?auto_44778 ?auto_44782 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_44779 ?auto_44780 ?auto_44776 )
      ( DELIVER-4PKG-VERIFY ?auto_44777 ?auto_44778 ?auto_44779 ?auto_44780 ?auto_44776 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_44803 - OBJ
      ?auto_44804 - OBJ
      ?auto_44805 - OBJ
      ?auto_44806 - OBJ
      ?auto_44802 - LOCATION
    )
    :vars
    (
      ?auto_44807 - LOCATION
      ?auto_44809 - CITY
      ?auto_44808 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_44804 ?auto_44803 ) ) ( not ( = ?auto_44805 ?auto_44803 ) ) ( not ( = ?auto_44805 ?auto_44804 ) ) ( not ( = ?auto_44806 ?auto_44803 ) ) ( not ( = ?auto_44806 ?auto_44804 ) ) ( not ( = ?auto_44806 ?auto_44805 ) ) ( IN-CITY ?auto_44807 ?auto_44809 ) ( IN-CITY ?auto_44802 ?auto_44809 ) ( not ( = ?auto_44802 ?auto_44807 ) ) ( OBJ-AT ?auto_44806 ?auto_44802 ) ( OBJ-AT ?auto_44805 ?auto_44807 ) ( OBJ-AT ?auto_44803 ?auto_44807 ) ( TRUCK-AT ?auto_44808 ?auto_44802 ) ( IN-TRUCK ?auto_44804 ?auto_44808 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_44806 ?auto_44805 ?auto_44802 )
      ( DELIVER-4PKG-VERIFY ?auto_44803 ?auto_44804 ?auto_44805 ?auto_44806 ?auto_44802 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_44913 - OBJ
      ?auto_44914 - OBJ
      ?auto_44915 - OBJ
      ?auto_44916 - OBJ
      ?auto_44912 - LOCATION
    )
    :vars
    (
      ?auto_44917 - LOCATION
      ?auto_44919 - CITY
      ?auto_44918 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_44914 ?auto_44913 ) ) ( not ( = ?auto_44915 ?auto_44913 ) ) ( not ( = ?auto_44915 ?auto_44914 ) ) ( not ( = ?auto_44916 ?auto_44913 ) ) ( not ( = ?auto_44916 ?auto_44914 ) ) ( not ( = ?auto_44916 ?auto_44915 ) ) ( IN-CITY ?auto_44917 ?auto_44919 ) ( IN-CITY ?auto_44912 ?auto_44919 ) ( not ( = ?auto_44912 ?auto_44917 ) ) ( OBJ-AT ?auto_44915 ?auto_44912 ) ( OBJ-AT ?auto_44914 ?auto_44917 ) ( OBJ-AT ?auto_44913 ?auto_44917 ) ( TRUCK-AT ?auto_44918 ?auto_44912 ) ( IN-TRUCK ?auto_44916 ?auto_44918 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_44915 ?auto_44914 ?auto_44912 )
      ( DELIVER-4PKG-VERIFY ?auto_44913 ?auto_44914 ?auto_44915 ?auto_44916 ?auto_44912 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_44939 - OBJ
      ?auto_44940 - OBJ
      ?auto_44941 - OBJ
      ?auto_44942 - OBJ
      ?auto_44938 - LOCATION
    )
    :vars
    (
      ?auto_44943 - LOCATION
      ?auto_44945 - CITY
      ?auto_44944 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_44940 ?auto_44939 ) ) ( not ( = ?auto_44941 ?auto_44939 ) ) ( not ( = ?auto_44941 ?auto_44940 ) ) ( not ( = ?auto_44942 ?auto_44939 ) ) ( not ( = ?auto_44942 ?auto_44940 ) ) ( not ( = ?auto_44942 ?auto_44941 ) ) ( IN-CITY ?auto_44943 ?auto_44945 ) ( IN-CITY ?auto_44938 ?auto_44945 ) ( not ( = ?auto_44938 ?auto_44943 ) ) ( OBJ-AT ?auto_44942 ?auto_44938 ) ( OBJ-AT ?auto_44940 ?auto_44943 ) ( OBJ-AT ?auto_44939 ?auto_44943 ) ( TRUCK-AT ?auto_44944 ?auto_44938 ) ( IN-TRUCK ?auto_44941 ?auto_44944 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_44942 ?auto_44940 ?auto_44938 )
      ( DELIVER-4PKG-VERIFY ?auto_44939 ?auto_44940 ?auto_44941 ?auto_44942 ?auto_44938 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_45106 - OBJ
      ?auto_45107 - OBJ
      ?auto_45108 - OBJ
      ?auto_45109 - OBJ
      ?auto_45105 - LOCATION
    )
    :vars
    (
      ?auto_45110 - LOCATION
      ?auto_45112 - CITY
      ?auto_45111 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_45107 ?auto_45106 ) ) ( not ( = ?auto_45108 ?auto_45106 ) ) ( not ( = ?auto_45108 ?auto_45107 ) ) ( not ( = ?auto_45109 ?auto_45106 ) ) ( not ( = ?auto_45109 ?auto_45107 ) ) ( not ( = ?auto_45109 ?auto_45108 ) ) ( IN-CITY ?auto_45110 ?auto_45112 ) ( IN-CITY ?auto_45105 ?auto_45112 ) ( not ( = ?auto_45105 ?auto_45110 ) ) ( OBJ-AT ?auto_45107 ?auto_45105 ) ( OBJ-AT ?auto_45106 ?auto_45110 ) ( OBJ-AT ?auto_45109 ?auto_45110 ) ( TRUCK-AT ?auto_45111 ?auto_45105 ) ( IN-TRUCK ?auto_45108 ?auto_45111 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45107 ?auto_45106 ?auto_45105 )
      ( DELIVER-4PKG-VERIFY ?auto_45106 ?auto_45107 ?auto_45108 ?auto_45109 ?auto_45105 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_45132 - OBJ
      ?auto_45133 - OBJ
      ?auto_45134 - OBJ
      ?auto_45135 - OBJ
      ?auto_45131 - LOCATION
    )
    :vars
    (
      ?auto_45136 - LOCATION
      ?auto_45138 - CITY
      ?auto_45137 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_45133 ?auto_45132 ) ) ( not ( = ?auto_45134 ?auto_45132 ) ) ( not ( = ?auto_45134 ?auto_45133 ) ) ( not ( = ?auto_45135 ?auto_45132 ) ) ( not ( = ?auto_45135 ?auto_45133 ) ) ( not ( = ?auto_45135 ?auto_45134 ) ) ( IN-CITY ?auto_45136 ?auto_45138 ) ( IN-CITY ?auto_45131 ?auto_45138 ) ( not ( = ?auto_45131 ?auto_45136 ) ) ( OBJ-AT ?auto_45133 ?auto_45131 ) ( OBJ-AT ?auto_45132 ?auto_45136 ) ( OBJ-AT ?auto_45134 ?auto_45136 ) ( TRUCK-AT ?auto_45137 ?auto_45131 ) ( IN-TRUCK ?auto_45135 ?auto_45137 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45133 ?auto_45132 ?auto_45131 )
      ( DELIVER-4PKG-VERIFY ?auto_45132 ?auto_45133 ?auto_45134 ?auto_45135 ?auto_45131 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_45214 - OBJ
      ?auto_45215 - OBJ
      ?auto_45216 - OBJ
      ?auto_45217 - OBJ
      ?auto_45213 - LOCATION
    )
    :vars
    (
      ?auto_45218 - LOCATION
      ?auto_45220 - CITY
      ?auto_45219 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_45215 ?auto_45214 ) ) ( not ( = ?auto_45216 ?auto_45214 ) ) ( not ( = ?auto_45216 ?auto_45215 ) ) ( not ( = ?auto_45217 ?auto_45214 ) ) ( not ( = ?auto_45217 ?auto_45215 ) ) ( not ( = ?auto_45217 ?auto_45216 ) ) ( IN-CITY ?auto_45218 ?auto_45220 ) ( IN-CITY ?auto_45213 ?auto_45220 ) ( not ( = ?auto_45213 ?auto_45218 ) ) ( OBJ-AT ?auto_45216 ?auto_45213 ) ( OBJ-AT ?auto_45214 ?auto_45218 ) ( OBJ-AT ?auto_45217 ?auto_45218 ) ( TRUCK-AT ?auto_45219 ?auto_45213 ) ( IN-TRUCK ?auto_45215 ?auto_45219 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45216 ?auto_45214 ?auto_45213 )
      ( DELIVER-4PKG-VERIFY ?auto_45214 ?auto_45215 ?auto_45216 ?auto_45217 ?auto_45213 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_45269 - OBJ
      ?auto_45270 - OBJ
      ?auto_45271 - OBJ
      ?auto_45272 - OBJ
      ?auto_45268 - LOCATION
    )
    :vars
    (
      ?auto_45273 - LOCATION
      ?auto_45275 - CITY
      ?auto_45274 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_45270 ?auto_45269 ) ) ( not ( = ?auto_45271 ?auto_45269 ) ) ( not ( = ?auto_45271 ?auto_45270 ) ) ( not ( = ?auto_45272 ?auto_45269 ) ) ( not ( = ?auto_45272 ?auto_45270 ) ) ( not ( = ?auto_45272 ?auto_45271 ) ) ( IN-CITY ?auto_45273 ?auto_45275 ) ( IN-CITY ?auto_45268 ?auto_45275 ) ( not ( = ?auto_45268 ?auto_45273 ) ) ( OBJ-AT ?auto_45272 ?auto_45268 ) ( OBJ-AT ?auto_45269 ?auto_45273 ) ( OBJ-AT ?auto_45271 ?auto_45273 ) ( TRUCK-AT ?auto_45274 ?auto_45268 ) ( IN-TRUCK ?auto_45270 ?auto_45274 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45272 ?auto_45269 ?auto_45268 )
      ( DELIVER-4PKG-VERIFY ?auto_45269 ?auto_45270 ?auto_45271 ?auto_45272 ?auto_45268 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_45351 - OBJ
      ?auto_45352 - OBJ
      ?auto_45353 - OBJ
      ?auto_45354 - OBJ
      ?auto_45350 - LOCATION
    )
    :vars
    (
      ?auto_45355 - LOCATION
      ?auto_45357 - CITY
      ?auto_45356 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_45352 ?auto_45351 ) ) ( not ( = ?auto_45353 ?auto_45351 ) ) ( not ( = ?auto_45353 ?auto_45352 ) ) ( not ( = ?auto_45354 ?auto_45351 ) ) ( not ( = ?auto_45354 ?auto_45352 ) ) ( not ( = ?auto_45354 ?auto_45353 ) ) ( IN-CITY ?auto_45355 ?auto_45357 ) ( IN-CITY ?auto_45350 ?auto_45357 ) ( not ( = ?auto_45350 ?auto_45355 ) ) ( OBJ-AT ?auto_45353 ?auto_45350 ) ( OBJ-AT ?auto_45351 ?auto_45355 ) ( OBJ-AT ?auto_45352 ?auto_45355 ) ( TRUCK-AT ?auto_45356 ?auto_45350 ) ( IN-TRUCK ?auto_45354 ?auto_45356 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45353 ?auto_45351 ?auto_45350 )
      ( DELIVER-4PKG-VERIFY ?auto_45351 ?auto_45352 ?auto_45353 ?auto_45354 ?auto_45350 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_45377 - OBJ
      ?auto_45378 - OBJ
      ?auto_45379 - OBJ
      ?auto_45380 - OBJ
      ?auto_45376 - LOCATION
    )
    :vars
    (
      ?auto_45381 - LOCATION
      ?auto_45383 - CITY
      ?auto_45382 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_45378 ?auto_45377 ) ) ( not ( = ?auto_45379 ?auto_45377 ) ) ( not ( = ?auto_45379 ?auto_45378 ) ) ( not ( = ?auto_45380 ?auto_45377 ) ) ( not ( = ?auto_45380 ?auto_45378 ) ) ( not ( = ?auto_45380 ?auto_45379 ) ) ( IN-CITY ?auto_45381 ?auto_45383 ) ( IN-CITY ?auto_45376 ?auto_45383 ) ( not ( = ?auto_45376 ?auto_45381 ) ) ( OBJ-AT ?auto_45380 ?auto_45376 ) ( OBJ-AT ?auto_45377 ?auto_45381 ) ( OBJ-AT ?auto_45378 ?auto_45381 ) ( TRUCK-AT ?auto_45382 ?auto_45376 ) ( IN-TRUCK ?auto_45379 ?auto_45382 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45380 ?auto_45377 ?auto_45376 )
      ( DELIVER-4PKG-VERIFY ?auto_45377 ?auto_45378 ?auto_45379 ?auto_45380 ?auto_45376 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_45643 - OBJ
      ?auto_45642 - LOCATION
    )
    :vars
    (
      ?auto_45649 - OBJ
      ?auto_45644 - LOCATION
      ?auto_45647 - CITY
      ?auto_45646 - OBJ
      ?auto_45648 - OBJ
      ?auto_45645 - TRUCK
      ?auto_45650 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45643 ?auto_45649 ) ) ( IN-CITY ?auto_45644 ?auto_45647 ) ( IN-CITY ?auto_45642 ?auto_45647 ) ( not ( = ?auto_45642 ?auto_45644 ) ) ( OBJ-AT ?auto_45649 ?auto_45642 ) ( OBJ-AT ?auto_45643 ?auto_45644 ) ( not ( = ?auto_45646 ?auto_45649 ) ) ( not ( = ?auto_45643 ?auto_45646 ) ) ( OBJ-AT ?auto_45646 ?auto_45644 ) ( not ( = ?auto_45648 ?auto_45649 ) ) ( IN-TRUCK ?auto_45648 ?auto_45645 ) ( not ( = ?auto_45643 ?auto_45648 ) ) ( not ( = ?auto_45646 ?auto_45648 ) ) ( TRUCK-AT ?auto_45645 ?auto_45650 ) ( IN-CITY ?auto_45650 ?auto_45647 ) ( not ( = ?auto_45642 ?auto_45650 ) ) ( not ( = ?auto_45644 ?auto_45650 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_45645 ?auto_45650 ?auto_45642 ?auto_45647 )
      ( DELIVER-2PKG ?auto_45649 ?auto_45643 ?auto_45642 )
      ( DELIVER-1PKG-VERIFY ?auto_45643 ?auto_45642 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_45652 - OBJ
      ?auto_45653 - OBJ
      ?auto_45651 - LOCATION
    )
    :vars
    (
      ?auto_45654 - LOCATION
      ?auto_45659 - CITY
      ?auto_45655 - OBJ
      ?auto_45657 - OBJ
      ?auto_45658 - TRUCK
      ?auto_45656 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45653 ?auto_45652 ) ) ( IN-CITY ?auto_45654 ?auto_45659 ) ( IN-CITY ?auto_45651 ?auto_45659 ) ( not ( = ?auto_45651 ?auto_45654 ) ) ( OBJ-AT ?auto_45652 ?auto_45651 ) ( OBJ-AT ?auto_45653 ?auto_45654 ) ( not ( = ?auto_45655 ?auto_45652 ) ) ( not ( = ?auto_45653 ?auto_45655 ) ) ( OBJ-AT ?auto_45655 ?auto_45654 ) ( not ( = ?auto_45657 ?auto_45652 ) ) ( IN-TRUCK ?auto_45657 ?auto_45658 ) ( not ( = ?auto_45653 ?auto_45657 ) ) ( not ( = ?auto_45655 ?auto_45657 ) ) ( TRUCK-AT ?auto_45658 ?auto_45656 ) ( IN-CITY ?auto_45656 ?auto_45659 ) ( not ( = ?auto_45651 ?auto_45656 ) ) ( not ( = ?auto_45654 ?auto_45656 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_45653 ?auto_45651 )
      ( DELIVER-2PKG-VERIFY ?auto_45652 ?auto_45653 ?auto_45651 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_45661 - OBJ
      ?auto_45662 - OBJ
      ?auto_45660 - LOCATION
    )
    :vars
    (
      ?auto_45668 - OBJ
      ?auto_45665 - LOCATION
      ?auto_45666 - CITY
      ?auto_45664 - OBJ
      ?auto_45663 - TRUCK
      ?auto_45667 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45662 ?auto_45661 ) ) ( not ( = ?auto_45662 ?auto_45668 ) ) ( IN-CITY ?auto_45665 ?auto_45666 ) ( IN-CITY ?auto_45660 ?auto_45666 ) ( not ( = ?auto_45660 ?auto_45665 ) ) ( OBJ-AT ?auto_45668 ?auto_45660 ) ( OBJ-AT ?auto_45662 ?auto_45665 ) ( not ( = ?auto_45664 ?auto_45668 ) ) ( not ( = ?auto_45662 ?auto_45664 ) ) ( OBJ-AT ?auto_45664 ?auto_45665 ) ( not ( = ?auto_45661 ?auto_45668 ) ) ( IN-TRUCK ?auto_45661 ?auto_45663 ) ( not ( = ?auto_45664 ?auto_45661 ) ) ( TRUCK-AT ?auto_45663 ?auto_45667 ) ( IN-CITY ?auto_45667 ?auto_45666 ) ( not ( = ?auto_45660 ?auto_45667 ) ) ( not ( = ?auto_45665 ?auto_45667 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45668 ?auto_45662 ?auto_45660 )
      ( DELIVER-2PKG-VERIFY ?auto_45661 ?auto_45662 ?auto_45660 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_45670 - OBJ
      ?auto_45671 - OBJ
      ?auto_45669 - LOCATION
    )
    :vars
    (
      ?auto_45677 - OBJ
      ?auto_45674 - LOCATION
      ?auto_45675 - CITY
      ?auto_45672 - OBJ
      ?auto_45673 - TRUCK
      ?auto_45676 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45671 ?auto_45670 ) ) ( not ( = ?auto_45671 ?auto_45677 ) ) ( IN-CITY ?auto_45674 ?auto_45675 ) ( IN-CITY ?auto_45669 ?auto_45675 ) ( not ( = ?auto_45669 ?auto_45674 ) ) ( OBJ-AT ?auto_45677 ?auto_45669 ) ( OBJ-AT ?auto_45671 ?auto_45674 ) ( not ( = ?auto_45670 ?auto_45677 ) ) ( OBJ-AT ?auto_45670 ?auto_45674 ) ( not ( = ?auto_45672 ?auto_45677 ) ) ( IN-TRUCK ?auto_45672 ?auto_45673 ) ( not ( = ?auto_45671 ?auto_45672 ) ) ( not ( = ?auto_45670 ?auto_45672 ) ) ( TRUCK-AT ?auto_45673 ?auto_45676 ) ( IN-CITY ?auto_45676 ?auto_45675 ) ( not ( = ?auto_45669 ?auto_45676 ) ) ( not ( = ?auto_45674 ?auto_45676 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45677 ?auto_45671 ?auto_45669 )
      ( DELIVER-2PKG-VERIFY ?auto_45670 ?auto_45671 ?auto_45669 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_45679 - OBJ
      ?auto_45680 - OBJ
      ?auto_45678 - LOCATION
    )
    :vars
    (
      ?auto_45684 - LOCATION
      ?auto_45685 - CITY
      ?auto_45683 - OBJ
      ?auto_45681 - OBJ
      ?auto_45682 - TRUCK
      ?auto_45686 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45680 ?auto_45679 ) ) ( IN-CITY ?auto_45684 ?auto_45685 ) ( IN-CITY ?auto_45678 ?auto_45685 ) ( not ( = ?auto_45678 ?auto_45684 ) ) ( OBJ-AT ?auto_45680 ?auto_45678 ) ( OBJ-AT ?auto_45679 ?auto_45684 ) ( not ( = ?auto_45683 ?auto_45680 ) ) ( not ( = ?auto_45679 ?auto_45683 ) ) ( OBJ-AT ?auto_45683 ?auto_45684 ) ( not ( = ?auto_45681 ?auto_45680 ) ) ( IN-TRUCK ?auto_45681 ?auto_45682 ) ( not ( = ?auto_45679 ?auto_45681 ) ) ( not ( = ?auto_45683 ?auto_45681 ) ) ( TRUCK-AT ?auto_45682 ?auto_45686 ) ( IN-CITY ?auto_45686 ?auto_45685 ) ( not ( = ?auto_45678 ?auto_45686 ) ) ( not ( = ?auto_45684 ?auto_45686 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45680 ?auto_45679 ?auto_45678 )
      ( DELIVER-2PKG-VERIFY ?auto_45679 ?auto_45680 ?auto_45678 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_45688 - OBJ
      ?auto_45689 - OBJ
      ?auto_45687 - LOCATION
    )
    :vars
    (
      ?auto_45695 - OBJ
      ?auto_45692 - LOCATION
      ?auto_45693 - CITY
      ?auto_45691 - OBJ
      ?auto_45690 - TRUCK
      ?auto_45694 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45689 ?auto_45688 ) ) ( not ( = ?auto_45688 ?auto_45695 ) ) ( IN-CITY ?auto_45692 ?auto_45693 ) ( IN-CITY ?auto_45687 ?auto_45693 ) ( not ( = ?auto_45687 ?auto_45692 ) ) ( OBJ-AT ?auto_45695 ?auto_45687 ) ( OBJ-AT ?auto_45688 ?auto_45692 ) ( not ( = ?auto_45691 ?auto_45695 ) ) ( not ( = ?auto_45688 ?auto_45691 ) ) ( OBJ-AT ?auto_45691 ?auto_45692 ) ( not ( = ?auto_45689 ?auto_45695 ) ) ( IN-TRUCK ?auto_45689 ?auto_45690 ) ( not ( = ?auto_45691 ?auto_45689 ) ) ( TRUCK-AT ?auto_45690 ?auto_45694 ) ( IN-CITY ?auto_45694 ?auto_45693 ) ( not ( = ?auto_45687 ?auto_45694 ) ) ( not ( = ?auto_45692 ?auto_45694 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45695 ?auto_45688 ?auto_45687 )
      ( DELIVER-2PKG-VERIFY ?auto_45688 ?auto_45689 ?auto_45687 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_45697 - OBJ
      ?auto_45698 - OBJ
      ?auto_45696 - LOCATION
    )
    :vars
    (
      ?auto_45704 - OBJ
      ?auto_45701 - LOCATION
      ?auto_45702 - CITY
      ?auto_45699 - OBJ
      ?auto_45700 - TRUCK
      ?auto_45703 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45698 ?auto_45697 ) ) ( not ( = ?auto_45697 ?auto_45704 ) ) ( IN-CITY ?auto_45701 ?auto_45702 ) ( IN-CITY ?auto_45696 ?auto_45702 ) ( not ( = ?auto_45696 ?auto_45701 ) ) ( OBJ-AT ?auto_45704 ?auto_45696 ) ( OBJ-AT ?auto_45697 ?auto_45701 ) ( not ( = ?auto_45698 ?auto_45704 ) ) ( OBJ-AT ?auto_45698 ?auto_45701 ) ( not ( = ?auto_45699 ?auto_45704 ) ) ( IN-TRUCK ?auto_45699 ?auto_45700 ) ( not ( = ?auto_45697 ?auto_45699 ) ) ( not ( = ?auto_45698 ?auto_45699 ) ) ( TRUCK-AT ?auto_45700 ?auto_45703 ) ( IN-CITY ?auto_45703 ?auto_45702 ) ( not ( = ?auto_45696 ?auto_45703 ) ) ( not ( = ?auto_45701 ?auto_45703 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45704 ?auto_45697 ?auto_45696 )
      ( DELIVER-2PKG-VERIFY ?auto_45697 ?auto_45698 ?auto_45696 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_45726 - OBJ
      ?auto_45727 - OBJ
      ?auto_45728 - OBJ
      ?auto_45725 - LOCATION
    )
    :vars
    (
      ?auto_45731 - LOCATION
      ?auto_45732 - CITY
      ?auto_45730 - OBJ
      ?auto_45729 - TRUCK
      ?auto_45733 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45727 ?auto_45726 ) ) ( not ( = ?auto_45728 ?auto_45726 ) ) ( not ( = ?auto_45728 ?auto_45727 ) ) ( IN-CITY ?auto_45731 ?auto_45732 ) ( IN-CITY ?auto_45725 ?auto_45732 ) ( not ( = ?auto_45725 ?auto_45731 ) ) ( OBJ-AT ?auto_45726 ?auto_45725 ) ( OBJ-AT ?auto_45728 ?auto_45731 ) ( not ( = ?auto_45730 ?auto_45726 ) ) ( not ( = ?auto_45728 ?auto_45730 ) ) ( OBJ-AT ?auto_45730 ?auto_45731 ) ( IN-TRUCK ?auto_45727 ?auto_45729 ) ( not ( = ?auto_45730 ?auto_45727 ) ) ( TRUCK-AT ?auto_45729 ?auto_45733 ) ( IN-CITY ?auto_45733 ?auto_45732 ) ( not ( = ?auto_45725 ?auto_45733 ) ) ( not ( = ?auto_45731 ?auto_45733 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45726 ?auto_45728 ?auto_45725 )
      ( DELIVER-3PKG-VERIFY ?auto_45726 ?auto_45727 ?auto_45728 ?auto_45725 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_45735 - OBJ
      ?auto_45736 - OBJ
      ?auto_45737 - OBJ
      ?auto_45734 - LOCATION
    )
    :vars
    (
      ?auto_45740 - LOCATION
      ?auto_45741 - CITY
      ?auto_45738 - OBJ
      ?auto_45739 - TRUCK
      ?auto_45742 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45736 ?auto_45735 ) ) ( not ( = ?auto_45737 ?auto_45735 ) ) ( not ( = ?auto_45737 ?auto_45736 ) ) ( IN-CITY ?auto_45740 ?auto_45741 ) ( IN-CITY ?auto_45734 ?auto_45741 ) ( not ( = ?auto_45734 ?auto_45740 ) ) ( OBJ-AT ?auto_45735 ?auto_45734 ) ( OBJ-AT ?auto_45737 ?auto_45740 ) ( OBJ-AT ?auto_45736 ?auto_45740 ) ( not ( = ?auto_45738 ?auto_45735 ) ) ( IN-TRUCK ?auto_45738 ?auto_45739 ) ( not ( = ?auto_45737 ?auto_45738 ) ) ( not ( = ?auto_45736 ?auto_45738 ) ) ( TRUCK-AT ?auto_45739 ?auto_45742 ) ( IN-CITY ?auto_45742 ?auto_45741 ) ( not ( = ?auto_45734 ?auto_45742 ) ) ( not ( = ?auto_45740 ?auto_45742 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45735 ?auto_45737 ?auto_45734 )
      ( DELIVER-3PKG-VERIFY ?auto_45735 ?auto_45736 ?auto_45737 ?auto_45734 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_45754 - OBJ
      ?auto_45755 - OBJ
      ?auto_45756 - OBJ
      ?auto_45753 - LOCATION
    )
    :vars
    (
      ?auto_45759 - LOCATION
      ?auto_45760 - CITY
      ?auto_45758 - OBJ
      ?auto_45757 - TRUCK
      ?auto_45761 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45755 ?auto_45754 ) ) ( not ( = ?auto_45756 ?auto_45754 ) ) ( not ( = ?auto_45756 ?auto_45755 ) ) ( IN-CITY ?auto_45759 ?auto_45760 ) ( IN-CITY ?auto_45753 ?auto_45760 ) ( not ( = ?auto_45753 ?auto_45759 ) ) ( OBJ-AT ?auto_45754 ?auto_45753 ) ( OBJ-AT ?auto_45755 ?auto_45759 ) ( not ( = ?auto_45758 ?auto_45754 ) ) ( not ( = ?auto_45755 ?auto_45758 ) ) ( OBJ-AT ?auto_45758 ?auto_45759 ) ( IN-TRUCK ?auto_45756 ?auto_45757 ) ( not ( = ?auto_45758 ?auto_45756 ) ) ( TRUCK-AT ?auto_45757 ?auto_45761 ) ( IN-CITY ?auto_45761 ?auto_45760 ) ( not ( = ?auto_45753 ?auto_45761 ) ) ( not ( = ?auto_45759 ?auto_45761 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45754 ?auto_45755 ?auto_45753 )
      ( DELIVER-3PKG-VERIFY ?auto_45754 ?auto_45755 ?auto_45756 ?auto_45753 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_45763 - OBJ
      ?auto_45764 - OBJ
      ?auto_45765 - OBJ
      ?auto_45762 - LOCATION
    )
    :vars
    (
      ?auto_45768 - LOCATION
      ?auto_45769 - CITY
      ?auto_45766 - OBJ
      ?auto_45767 - TRUCK
      ?auto_45770 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45764 ?auto_45763 ) ) ( not ( = ?auto_45765 ?auto_45763 ) ) ( not ( = ?auto_45765 ?auto_45764 ) ) ( IN-CITY ?auto_45768 ?auto_45769 ) ( IN-CITY ?auto_45762 ?auto_45769 ) ( not ( = ?auto_45762 ?auto_45768 ) ) ( OBJ-AT ?auto_45763 ?auto_45762 ) ( OBJ-AT ?auto_45764 ?auto_45768 ) ( OBJ-AT ?auto_45765 ?auto_45768 ) ( not ( = ?auto_45766 ?auto_45763 ) ) ( IN-TRUCK ?auto_45766 ?auto_45767 ) ( not ( = ?auto_45764 ?auto_45766 ) ) ( not ( = ?auto_45765 ?auto_45766 ) ) ( TRUCK-AT ?auto_45767 ?auto_45770 ) ( IN-CITY ?auto_45770 ?auto_45769 ) ( not ( = ?auto_45762 ?auto_45770 ) ) ( not ( = ?auto_45768 ?auto_45770 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45763 ?auto_45764 ?auto_45762 )
      ( DELIVER-3PKG-VERIFY ?auto_45763 ?auto_45764 ?auto_45765 ?auto_45762 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_45782 - OBJ
      ?auto_45783 - OBJ
      ?auto_45784 - OBJ
      ?auto_45781 - LOCATION
    )
    :vars
    (
      ?auto_45787 - LOCATION
      ?auto_45788 - CITY
      ?auto_45786 - OBJ
      ?auto_45785 - TRUCK
      ?auto_45789 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45783 ?auto_45782 ) ) ( not ( = ?auto_45784 ?auto_45782 ) ) ( not ( = ?auto_45784 ?auto_45783 ) ) ( IN-CITY ?auto_45787 ?auto_45788 ) ( IN-CITY ?auto_45781 ?auto_45788 ) ( not ( = ?auto_45781 ?auto_45787 ) ) ( OBJ-AT ?auto_45783 ?auto_45781 ) ( OBJ-AT ?auto_45784 ?auto_45787 ) ( not ( = ?auto_45786 ?auto_45783 ) ) ( not ( = ?auto_45784 ?auto_45786 ) ) ( OBJ-AT ?auto_45786 ?auto_45787 ) ( IN-TRUCK ?auto_45782 ?auto_45785 ) ( not ( = ?auto_45786 ?auto_45782 ) ) ( TRUCK-AT ?auto_45785 ?auto_45789 ) ( IN-CITY ?auto_45789 ?auto_45788 ) ( not ( = ?auto_45781 ?auto_45789 ) ) ( not ( = ?auto_45787 ?auto_45789 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45783 ?auto_45784 ?auto_45781 )
      ( DELIVER-3PKG-VERIFY ?auto_45782 ?auto_45783 ?auto_45784 ?auto_45781 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_45801 - OBJ
      ?auto_45802 - OBJ
      ?auto_45803 - OBJ
      ?auto_45800 - LOCATION
    )
    :vars
    (
      ?auto_45808 - OBJ
      ?auto_45805 - LOCATION
      ?auto_45806 - CITY
      ?auto_45804 - TRUCK
      ?auto_45807 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45802 ?auto_45801 ) ) ( not ( = ?auto_45803 ?auto_45801 ) ) ( not ( = ?auto_45803 ?auto_45802 ) ) ( not ( = ?auto_45803 ?auto_45808 ) ) ( IN-CITY ?auto_45805 ?auto_45806 ) ( IN-CITY ?auto_45800 ?auto_45806 ) ( not ( = ?auto_45800 ?auto_45805 ) ) ( OBJ-AT ?auto_45808 ?auto_45800 ) ( OBJ-AT ?auto_45803 ?auto_45805 ) ( not ( = ?auto_45802 ?auto_45808 ) ) ( OBJ-AT ?auto_45802 ?auto_45805 ) ( not ( = ?auto_45801 ?auto_45808 ) ) ( IN-TRUCK ?auto_45801 ?auto_45804 ) ( TRUCK-AT ?auto_45804 ?auto_45807 ) ( IN-CITY ?auto_45807 ?auto_45806 ) ( not ( = ?auto_45800 ?auto_45807 ) ) ( not ( = ?auto_45805 ?auto_45807 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45808 ?auto_45803 ?auto_45800 )
      ( DELIVER-3PKG-VERIFY ?auto_45801 ?auto_45802 ?auto_45803 ?auto_45800 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_45810 - OBJ
      ?auto_45811 - OBJ
      ?auto_45812 - OBJ
      ?auto_45809 - LOCATION
    )
    :vars
    (
      ?auto_45815 - LOCATION
      ?auto_45816 - CITY
      ?auto_45814 - OBJ
      ?auto_45813 - TRUCK
      ?auto_45817 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45811 ?auto_45810 ) ) ( not ( = ?auto_45812 ?auto_45810 ) ) ( not ( = ?auto_45812 ?auto_45811 ) ) ( IN-CITY ?auto_45815 ?auto_45816 ) ( IN-CITY ?auto_45809 ?auto_45816 ) ( not ( = ?auto_45809 ?auto_45815 ) ) ( OBJ-AT ?auto_45812 ?auto_45809 ) ( OBJ-AT ?auto_45811 ?auto_45815 ) ( not ( = ?auto_45814 ?auto_45812 ) ) ( not ( = ?auto_45811 ?auto_45814 ) ) ( OBJ-AT ?auto_45814 ?auto_45815 ) ( IN-TRUCK ?auto_45810 ?auto_45813 ) ( not ( = ?auto_45814 ?auto_45810 ) ) ( TRUCK-AT ?auto_45813 ?auto_45817 ) ( IN-CITY ?auto_45817 ?auto_45816 ) ( not ( = ?auto_45809 ?auto_45817 ) ) ( not ( = ?auto_45815 ?auto_45817 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45812 ?auto_45811 ?auto_45809 )
      ( DELIVER-3PKG-VERIFY ?auto_45810 ?auto_45811 ?auto_45812 ?auto_45809 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_45829 - OBJ
      ?auto_45830 - OBJ
      ?auto_45831 - OBJ
      ?auto_45828 - LOCATION
    )
    :vars
    (
      ?auto_45836 - OBJ
      ?auto_45833 - LOCATION
      ?auto_45834 - CITY
      ?auto_45832 - TRUCK
      ?auto_45835 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45830 ?auto_45829 ) ) ( not ( = ?auto_45831 ?auto_45829 ) ) ( not ( = ?auto_45831 ?auto_45830 ) ) ( not ( = ?auto_45830 ?auto_45836 ) ) ( IN-CITY ?auto_45833 ?auto_45834 ) ( IN-CITY ?auto_45828 ?auto_45834 ) ( not ( = ?auto_45828 ?auto_45833 ) ) ( OBJ-AT ?auto_45836 ?auto_45828 ) ( OBJ-AT ?auto_45830 ?auto_45833 ) ( not ( = ?auto_45831 ?auto_45836 ) ) ( OBJ-AT ?auto_45831 ?auto_45833 ) ( not ( = ?auto_45829 ?auto_45836 ) ) ( IN-TRUCK ?auto_45829 ?auto_45832 ) ( TRUCK-AT ?auto_45832 ?auto_45835 ) ( IN-CITY ?auto_45835 ?auto_45834 ) ( not ( = ?auto_45828 ?auto_45835 ) ) ( not ( = ?auto_45833 ?auto_45835 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45836 ?auto_45830 ?auto_45828 )
      ( DELIVER-3PKG-VERIFY ?auto_45829 ?auto_45830 ?auto_45831 ?auto_45828 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_45848 - OBJ
      ?auto_45849 - OBJ
      ?auto_45850 - OBJ
      ?auto_45847 - LOCATION
    )
    :vars
    (
      ?auto_45853 - LOCATION
      ?auto_45854 - CITY
      ?auto_45851 - OBJ
      ?auto_45852 - TRUCK
      ?auto_45855 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45849 ?auto_45848 ) ) ( not ( = ?auto_45850 ?auto_45848 ) ) ( not ( = ?auto_45850 ?auto_45849 ) ) ( IN-CITY ?auto_45853 ?auto_45854 ) ( IN-CITY ?auto_45847 ?auto_45854 ) ( not ( = ?auto_45847 ?auto_45853 ) ) ( OBJ-AT ?auto_45849 ?auto_45847 ) ( OBJ-AT ?auto_45850 ?auto_45853 ) ( OBJ-AT ?auto_45848 ?auto_45853 ) ( not ( = ?auto_45851 ?auto_45849 ) ) ( IN-TRUCK ?auto_45851 ?auto_45852 ) ( not ( = ?auto_45850 ?auto_45851 ) ) ( not ( = ?auto_45848 ?auto_45851 ) ) ( TRUCK-AT ?auto_45852 ?auto_45855 ) ( IN-CITY ?auto_45855 ?auto_45854 ) ( not ( = ?auto_45847 ?auto_45855 ) ) ( not ( = ?auto_45853 ?auto_45855 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45849 ?auto_45850 ?auto_45847 )
      ( DELIVER-3PKG-VERIFY ?auto_45848 ?auto_45849 ?auto_45850 ?auto_45847 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_45857 - OBJ
      ?auto_45858 - OBJ
      ?auto_45859 - OBJ
      ?auto_45856 - LOCATION
    )
    :vars
    (
      ?auto_45864 - OBJ
      ?auto_45861 - LOCATION
      ?auto_45862 - CITY
      ?auto_45860 - TRUCK
      ?auto_45863 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45858 ?auto_45857 ) ) ( not ( = ?auto_45859 ?auto_45857 ) ) ( not ( = ?auto_45859 ?auto_45858 ) ) ( not ( = ?auto_45859 ?auto_45864 ) ) ( IN-CITY ?auto_45861 ?auto_45862 ) ( IN-CITY ?auto_45856 ?auto_45862 ) ( not ( = ?auto_45856 ?auto_45861 ) ) ( OBJ-AT ?auto_45864 ?auto_45856 ) ( OBJ-AT ?auto_45859 ?auto_45861 ) ( not ( = ?auto_45857 ?auto_45864 ) ) ( OBJ-AT ?auto_45857 ?auto_45861 ) ( not ( = ?auto_45858 ?auto_45864 ) ) ( IN-TRUCK ?auto_45858 ?auto_45860 ) ( TRUCK-AT ?auto_45860 ?auto_45863 ) ( IN-CITY ?auto_45863 ?auto_45862 ) ( not ( = ?auto_45856 ?auto_45863 ) ) ( not ( = ?auto_45861 ?auto_45863 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45864 ?auto_45859 ?auto_45856 )
      ( DELIVER-3PKG-VERIFY ?auto_45857 ?auto_45858 ?auto_45859 ?auto_45856 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_45876 - OBJ
      ?auto_45877 - OBJ
      ?auto_45878 - OBJ
      ?auto_45875 - LOCATION
    )
    :vars
    (
      ?auto_45881 - LOCATION
      ?auto_45882 - CITY
      ?auto_45879 - OBJ
      ?auto_45880 - TRUCK
      ?auto_45883 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45877 ?auto_45876 ) ) ( not ( = ?auto_45878 ?auto_45876 ) ) ( not ( = ?auto_45878 ?auto_45877 ) ) ( IN-CITY ?auto_45881 ?auto_45882 ) ( IN-CITY ?auto_45875 ?auto_45882 ) ( not ( = ?auto_45875 ?auto_45881 ) ) ( OBJ-AT ?auto_45878 ?auto_45875 ) ( OBJ-AT ?auto_45877 ?auto_45881 ) ( OBJ-AT ?auto_45876 ?auto_45881 ) ( not ( = ?auto_45879 ?auto_45878 ) ) ( IN-TRUCK ?auto_45879 ?auto_45880 ) ( not ( = ?auto_45877 ?auto_45879 ) ) ( not ( = ?auto_45876 ?auto_45879 ) ) ( TRUCK-AT ?auto_45880 ?auto_45883 ) ( IN-CITY ?auto_45883 ?auto_45882 ) ( not ( = ?auto_45875 ?auto_45883 ) ) ( not ( = ?auto_45881 ?auto_45883 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45878 ?auto_45877 ?auto_45875 )
      ( DELIVER-3PKG-VERIFY ?auto_45876 ?auto_45877 ?auto_45878 ?auto_45875 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_45885 - OBJ
      ?auto_45886 - OBJ
      ?auto_45887 - OBJ
      ?auto_45884 - LOCATION
    )
    :vars
    (
      ?auto_45892 - OBJ
      ?auto_45889 - LOCATION
      ?auto_45890 - CITY
      ?auto_45888 - TRUCK
      ?auto_45891 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45886 ?auto_45885 ) ) ( not ( = ?auto_45887 ?auto_45885 ) ) ( not ( = ?auto_45887 ?auto_45886 ) ) ( not ( = ?auto_45886 ?auto_45892 ) ) ( IN-CITY ?auto_45889 ?auto_45890 ) ( IN-CITY ?auto_45884 ?auto_45890 ) ( not ( = ?auto_45884 ?auto_45889 ) ) ( OBJ-AT ?auto_45892 ?auto_45884 ) ( OBJ-AT ?auto_45886 ?auto_45889 ) ( not ( = ?auto_45885 ?auto_45892 ) ) ( OBJ-AT ?auto_45885 ?auto_45889 ) ( not ( = ?auto_45887 ?auto_45892 ) ) ( IN-TRUCK ?auto_45887 ?auto_45888 ) ( TRUCK-AT ?auto_45888 ?auto_45891 ) ( IN-CITY ?auto_45891 ?auto_45890 ) ( not ( = ?auto_45884 ?auto_45891 ) ) ( not ( = ?auto_45889 ?auto_45891 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45892 ?auto_45886 ?auto_45884 )
      ( DELIVER-3PKG-VERIFY ?auto_45885 ?auto_45886 ?auto_45887 ?auto_45884 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_45924 - OBJ
      ?auto_45925 - OBJ
      ?auto_45926 - OBJ
      ?auto_45923 - LOCATION
    )
    :vars
    (
      ?auto_45929 - LOCATION
      ?auto_45930 - CITY
      ?auto_45928 - OBJ
      ?auto_45927 - TRUCK
      ?auto_45931 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45925 ?auto_45924 ) ) ( not ( = ?auto_45926 ?auto_45924 ) ) ( not ( = ?auto_45926 ?auto_45925 ) ) ( IN-CITY ?auto_45929 ?auto_45930 ) ( IN-CITY ?auto_45923 ?auto_45930 ) ( not ( = ?auto_45923 ?auto_45929 ) ) ( OBJ-AT ?auto_45925 ?auto_45923 ) ( OBJ-AT ?auto_45924 ?auto_45929 ) ( not ( = ?auto_45928 ?auto_45925 ) ) ( not ( = ?auto_45924 ?auto_45928 ) ) ( OBJ-AT ?auto_45928 ?auto_45929 ) ( IN-TRUCK ?auto_45926 ?auto_45927 ) ( not ( = ?auto_45928 ?auto_45926 ) ) ( TRUCK-AT ?auto_45927 ?auto_45931 ) ( IN-CITY ?auto_45931 ?auto_45930 ) ( not ( = ?auto_45923 ?auto_45931 ) ) ( not ( = ?auto_45929 ?auto_45931 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45925 ?auto_45924 ?auto_45923 )
      ( DELIVER-3PKG-VERIFY ?auto_45924 ?auto_45925 ?auto_45926 ?auto_45923 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_45933 - OBJ
      ?auto_45934 - OBJ
      ?auto_45935 - OBJ
      ?auto_45932 - LOCATION
    )
    :vars
    (
      ?auto_45938 - LOCATION
      ?auto_45939 - CITY
      ?auto_45936 - OBJ
      ?auto_45937 - TRUCK
      ?auto_45940 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45934 ?auto_45933 ) ) ( not ( = ?auto_45935 ?auto_45933 ) ) ( not ( = ?auto_45935 ?auto_45934 ) ) ( IN-CITY ?auto_45938 ?auto_45939 ) ( IN-CITY ?auto_45932 ?auto_45939 ) ( not ( = ?auto_45932 ?auto_45938 ) ) ( OBJ-AT ?auto_45934 ?auto_45932 ) ( OBJ-AT ?auto_45933 ?auto_45938 ) ( OBJ-AT ?auto_45935 ?auto_45938 ) ( not ( = ?auto_45936 ?auto_45934 ) ) ( IN-TRUCK ?auto_45936 ?auto_45937 ) ( not ( = ?auto_45933 ?auto_45936 ) ) ( not ( = ?auto_45935 ?auto_45936 ) ) ( TRUCK-AT ?auto_45937 ?auto_45940 ) ( IN-CITY ?auto_45940 ?auto_45939 ) ( not ( = ?auto_45932 ?auto_45940 ) ) ( not ( = ?auto_45938 ?auto_45940 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45934 ?auto_45933 ?auto_45932 )
      ( DELIVER-3PKG-VERIFY ?auto_45933 ?auto_45934 ?auto_45935 ?auto_45932 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_45952 - OBJ
      ?auto_45953 - OBJ
      ?auto_45954 - OBJ
      ?auto_45951 - LOCATION
    )
    :vars
    (
      ?auto_45957 - LOCATION
      ?auto_45958 - CITY
      ?auto_45956 - OBJ
      ?auto_45955 - TRUCK
      ?auto_45959 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45953 ?auto_45952 ) ) ( not ( = ?auto_45954 ?auto_45952 ) ) ( not ( = ?auto_45954 ?auto_45953 ) ) ( IN-CITY ?auto_45957 ?auto_45958 ) ( IN-CITY ?auto_45951 ?auto_45958 ) ( not ( = ?auto_45951 ?auto_45957 ) ) ( OBJ-AT ?auto_45954 ?auto_45951 ) ( OBJ-AT ?auto_45952 ?auto_45957 ) ( not ( = ?auto_45956 ?auto_45954 ) ) ( not ( = ?auto_45952 ?auto_45956 ) ) ( OBJ-AT ?auto_45956 ?auto_45957 ) ( IN-TRUCK ?auto_45953 ?auto_45955 ) ( not ( = ?auto_45956 ?auto_45953 ) ) ( TRUCK-AT ?auto_45955 ?auto_45959 ) ( IN-CITY ?auto_45959 ?auto_45958 ) ( not ( = ?auto_45951 ?auto_45959 ) ) ( not ( = ?auto_45957 ?auto_45959 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45954 ?auto_45952 ?auto_45951 )
      ( DELIVER-3PKG-VERIFY ?auto_45952 ?auto_45953 ?auto_45954 ?auto_45951 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_45971 - OBJ
      ?auto_45972 - OBJ
      ?auto_45973 - OBJ
      ?auto_45970 - LOCATION
    )
    :vars
    (
      ?auto_45978 - OBJ
      ?auto_45975 - LOCATION
      ?auto_45976 - CITY
      ?auto_45974 - TRUCK
      ?auto_45977 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45972 ?auto_45971 ) ) ( not ( = ?auto_45973 ?auto_45971 ) ) ( not ( = ?auto_45973 ?auto_45972 ) ) ( not ( = ?auto_45971 ?auto_45978 ) ) ( IN-CITY ?auto_45975 ?auto_45976 ) ( IN-CITY ?auto_45970 ?auto_45976 ) ( not ( = ?auto_45970 ?auto_45975 ) ) ( OBJ-AT ?auto_45978 ?auto_45970 ) ( OBJ-AT ?auto_45971 ?auto_45975 ) ( not ( = ?auto_45973 ?auto_45978 ) ) ( OBJ-AT ?auto_45973 ?auto_45975 ) ( not ( = ?auto_45972 ?auto_45978 ) ) ( IN-TRUCK ?auto_45972 ?auto_45974 ) ( TRUCK-AT ?auto_45974 ?auto_45977 ) ( IN-CITY ?auto_45977 ?auto_45976 ) ( not ( = ?auto_45970 ?auto_45977 ) ) ( not ( = ?auto_45975 ?auto_45977 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45978 ?auto_45971 ?auto_45970 )
      ( DELIVER-3PKG-VERIFY ?auto_45971 ?auto_45972 ?auto_45973 ?auto_45970 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_45990 - OBJ
      ?auto_45991 - OBJ
      ?auto_45992 - OBJ
      ?auto_45989 - LOCATION
    )
    :vars
    (
      ?auto_45995 - LOCATION
      ?auto_45996 - CITY
      ?auto_45993 - OBJ
      ?auto_45994 - TRUCK
      ?auto_45997 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_45991 ?auto_45990 ) ) ( not ( = ?auto_45992 ?auto_45990 ) ) ( not ( = ?auto_45992 ?auto_45991 ) ) ( IN-CITY ?auto_45995 ?auto_45996 ) ( IN-CITY ?auto_45989 ?auto_45996 ) ( not ( = ?auto_45989 ?auto_45995 ) ) ( OBJ-AT ?auto_45992 ?auto_45989 ) ( OBJ-AT ?auto_45990 ?auto_45995 ) ( OBJ-AT ?auto_45991 ?auto_45995 ) ( not ( = ?auto_45993 ?auto_45992 ) ) ( IN-TRUCK ?auto_45993 ?auto_45994 ) ( not ( = ?auto_45990 ?auto_45993 ) ) ( not ( = ?auto_45991 ?auto_45993 ) ) ( TRUCK-AT ?auto_45994 ?auto_45997 ) ( IN-CITY ?auto_45997 ?auto_45996 ) ( not ( = ?auto_45989 ?auto_45997 ) ) ( not ( = ?auto_45995 ?auto_45997 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_45992 ?auto_45990 ?auto_45989 )
      ( DELIVER-3PKG-VERIFY ?auto_45990 ?auto_45991 ?auto_45992 ?auto_45989 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_45999 - OBJ
      ?auto_46000 - OBJ
      ?auto_46001 - OBJ
      ?auto_45998 - LOCATION
    )
    :vars
    (
      ?auto_46006 - OBJ
      ?auto_46003 - LOCATION
      ?auto_46004 - CITY
      ?auto_46002 - TRUCK
      ?auto_46005 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_46000 ?auto_45999 ) ) ( not ( = ?auto_46001 ?auto_45999 ) ) ( not ( = ?auto_46001 ?auto_46000 ) ) ( not ( = ?auto_45999 ?auto_46006 ) ) ( IN-CITY ?auto_46003 ?auto_46004 ) ( IN-CITY ?auto_45998 ?auto_46004 ) ( not ( = ?auto_45998 ?auto_46003 ) ) ( OBJ-AT ?auto_46006 ?auto_45998 ) ( OBJ-AT ?auto_45999 ?auto_46003 ) ( not ( = ?auto_46000 ?auto_46006 ) ) ( OBJ-AT ?auto_46000 ?auto_46003 ) ( not ( = ?auto_46001 ?auto_46006 ) ) ( IN-TRUCK ?auto_46001 ?auto_46002 ) ( TRUCK-AT ?auto_46002 ?auto_46005 ) ( IN-CITY ?auto_46005 ?auto_46004 ) ( not ( = ?auto_45998 ?auto_46005 ) ) ( not ( = ?auto_46003 ?auto_46005 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_46006 ?auto_45999 ?auto_45998 )
      ( DELIVER-3PKG-VERIFY ?auto_45999 ?auto_46000 ?auto_46001 ?auto_45998 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_46162 - OBJ
      ?auto_46163 - OBJ
      ?auto_46164 - OBJ
      ?auto_46165 - OBJ
      ?auto_46161 - LOCATION
    )
    :vars
    (
      ?auto_46167 - LOCATION
      ?auto_46168 - CITY
      ?auto_46166 - TRUCK
      ?auto_46169 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_46163 ?auto_46162 ) ) ( not ( = ?auto_46164 ?auto_46162 ) ) ( not ( = ?auto_46164 ?auto_46163 ) ) ( not ( = ?auto_46165 ?auto_46162 ) ) ( not ( = ?auto_46165 ?auto_46163 ) ) ( not ( = ?auto_46165 ?auto_46164 ) ) ( IN-CITY ?auto_46167 ?auto_46168 ) ( IN-CITY ?auto_46161 ?auto_46168 ) ( not ( = ?auto_46161 ?auto_46167 ) ) ( OBJ-AT ?auto_46162 ?auto_46161 ) ( OBJ-AT ?auto_46165 ?auto_46167 ) ( OBJ-AT ?auto_46164 ?auto_46167 ) ( IN-TRUCK ?auto_46163 ?auto_46166 ) ( TRUCK-AT ?auto_46166 ?auto_46169 ) ( IN-CITY ?auto_46169 ?auto_46168 ) ( not ( = ?auto_46161 ?auto_46169 ) ) ( not ( = ?auto_46167 ?auto_46169 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_46162 ?auto_46165 ?auto_46161 )
      ( DELIVER-4PKG-VERIFY ?auto_46162 ?auto_46163 ?auto_46164 ?auto_46165 ?auto_46161 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_46191 - OBJ
      ?auto_46192 - OBJ
      ?auto_46193 - OBJ
      ?auto_46194 - OBJ
      ?auto_46190 - LOCATION
    )
    :vars
    (
      ?auto_46196 - LOCATION
      ?auto_46197 - CITY
      ?auto_46195 - TRUCK
      ?auto_46198 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_46192 ?auto_46191 ) ) ( not ( = ?auto_46193 ?auto_46191 ) ) ( not ( = ?auto_46193 ?auto_46192 ) ) ( not ( = ?auto_46194 ?auto_46191 ) ) ( not ( = ?auto_46194 ?auto_46192 ) ) ( not ( = ?auto_46194 ?auto_46193 ) ) ( IN-CITY ?auto_46196 ?auto_46197 ) ( IN-CITY ?auto_46190 ?auto_46197 ) ( not ( = ?auto_46190 ?auto_46196 ) ) ( OBJ-AT ?auto_46191 ?auto_46190 ) ( OBJ-AT ?auto_46193 ?auto_46196 ) ( OBJ-AT ?auto_46194 ?auto_46196 ) ( IN-TRUCK ?auto_46192 ?auto_46195 ) ( TRUCK-AT ?auto_46195 ?auto_46198 ) ( IN-CITY ?auto_46198 ?auto_46197 ) ( not ( = ?auto_46190 ?auto_46198 ) ) ( not ( = ?auto_46196 ?auto_46198 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_46191 ?auto_46193 ?auto_46190 )
      ( DELIVER-4PKG-VERIFY ?auto_46191 ?auto_46192 ?auto_46193 ?auto_46194 ?auto_46190 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_46220 - OBJ
      ?auto_46221 - OBJ
      ?auto_46222 - OBJ
      ?auto_46223 - OBJ
      ?auto_46219 - LOCATION
    )
    :vars
    (
      ?auto_46225 - LOCATION
      ?auto_46226 - CITY
      ?auto_46224 - TRUCK
      ?auto_46227 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_46221 ?auto_46220 ) ) ( not ( = ?auto_46222 ?auto_46220 ) ) ( not ( = ?auto_46222 ?auto_46221 ) ) ( not ( = ?auto_46223 ?auto_46220 ) ) ( not ( = ?auto_46223 ?auto_46221 ) ) ( not ( = ?auto_46223 ?auto_46222 ) ) ( IN-CITY ?auto_46225 ?auto_46226 ) ( IN-CITY ?auto_46219 ?auto_46226 ) ( not ( = ?auto_46219 ?auto_46225 ) ) ( OBJ-AT ?auto_46220 ?auto_46219 ) ( OBJ-AT ?auto_46223 ?auto_46225 ) ( OBJ-AT ?auto_46221 ?auto_46225 ) ( IN-TRUCK ?auto_46222 ?auto_46224 ) ( TRUCK-AT ?auto_46224 ?auto_46227 ) ( IN-CITY ?auto_46227 ?auto_46226 ) ( not ( = ?auto_46219 ?auto_46227 ) ) ( not ( = ?auto_46225 ?auto_46227 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_46220 ?auto_46223 ?auto_46219 )
      ( DELIVER-4PKG-VERIFY ?auto_46220 ?auto_46221 ?auto_46222 ?auto_46223 ?auto_46219 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_46249 - OBJ
      ?auto_46250 - OBJ
      ?auto_46251 - OBJ
      ?auto_46252 - OBJ
      ?auto_46248 - LOCATION
    )
    :vars
    (
      ?auto_46254 - LOCATION
      ?auto_46255 - CITY
      ?auto_46253 - TRUCK
      ?auto_46256 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_46250 ?auto_46249 ) ) ( not ( = ?auto_46251 ?auto_46249 ) ) ( not ( = ?auto_46251 ?auto_46250 ) ) ( not ( = ?auto_46252 ?auto_46249 ) ) ( not ( = ?auto_46252 ?auto_46250 ) ) ( not ( = ?auto_46252 ?auto_46251 ) ) ( IN-CITY ?auto_46254 ?auto_46255 ) ( IN-CITY ?auto_46248 ?auto_46255 ) ( not ( = ?auto_46248 ?auto_46254 ) ) ( OBJ-AT ?auto_46249 ?auto_46248 ) ( OBJ-AT ?auto_46251 ?auto_46254 ) ( OBJ-AT ?auto_46250 ?auto_46254 ) ( IN-TRUCK ?auto_46252 ?auto_46253 ) ( TRUCK-AT ?auto_46253 ?auto_46256 ) ( IN-CITY ?auto_46256 ?auto_46255 ) ( not ( = ?auto_46248 ?auto_46256 ) ) ( not ( = ?auto_46254 ?auto_46256 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_46249 ?auto_46251 ?auto_46248 )
      ( DELIVER-4PKG-VERIFY ?auto_46249 ?auto_46250 ?auto_46251 ?auto_46252 ?auto_46248 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_46340 - OBJ
      ?auto_46341 - OBJ
      ?auto_46342 - OBJ
      ?auto_46343 - OBJ
      ?auto_46339 - LOCATION
    )
    :vars
    (
      ?auto_46345 - LOCATION
      ?auto_46346 - CITY
      ?auto_46344 - TRUCK
      ?auto_46347 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_46341 ?auto_46340 ) ) ( not ( = ?auto_46342 ?auto_46340 ) ) ( not ( = ?auto_46342 ?auto_46341 ) ) ( not ( = ?auto_46343 ?auto_46340 ) ) ( not ( = ?auto_46343 ?auto_46341 ) ) ( not ( = ?auto_46343 ?auto_46342 ) ) ( IN-CITY ?auto_46345 ?auto_46346 ) ( IN-CITY ?auto_46339 ?auto_46346 ) ( not ( = ?auto_46339 ?auto_46345 ) ) ( OBJ-AT ?auto_46340 ?auto_46339 ) ( OBJ-AT ?auto_46341 ?auto_46345 ) ( OBJ-AT ?auto_46343 ?auto_46345 ) ( IN-TRUCK ?auto_46342 ?auto_46344 ) ( TRUCK-AT ?auto_46344 ?auto_46347 ) ( IN-CITY ?auto_46347 ?auto_46346 ) ( not ( = ?auto_46339 ?auto_46347 ) ) ( not ( = ?auto_46345 ?auto_46347 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_46340 ?auto_46341 ?auto_46339 )
      ( DELIVER-4PKG-VERIFY ?auto_46340 ?auto_46341 ?auto_46342 ?auto_46343 ?auto_46339 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_46369 - OBJ
      ?auto_46370 - OBJ
      ?auto_46371 - OBJ
      ?auto_46372 - OBJ
      ?auto_46368 - LOCATION
    )
    :vars
    (
      ?auto_46374 - LOCATION
      ?auto_46375 - CITY
      ?auto_46373 - TRUCK
      ?auto_46376 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_46370 ?auto_46369 ) ) ( not ( = ?auto_46371 ?auto_46369 ) ) ( not ( = ?auto_46371 ?auto_46370 ) ) ( not ( = ?auto_46372 ?auto_46369 ) ) ( not ( = ?auto_46372 ?auto_46370 ) ) ( not ( = ?auto_46372 ?auto_46371 ) ) ( IN-CITY ?auto_46374 ?auto_46375 ) ( IN-CITY ?auto_46368 ?auto_46375 ) ( not ( = ?auto_46368 ?auto_46374 ) ) ( OBJ-AT ?auto_46369 ?auto_46368 ) ( OBJ-AT ?auto_46370 ?auto_46374 ) ( OBJ-AT ?auto_46371 ?auto_46374 ) ( IN-TRUCK ?auto_46372 ?auto_46373 ) ( TRUCK-AT ?auto_46373 ?auto_46376 ) ( IN-CITY ?auto_46376 ?auto_46375 ) ( not ( = ?auto_46368 ?auto_46376 ) ) ( not ( = ?auto_46374 ?auto_46376 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_46369 ?auto_46370 ?auto_46368 )
      ( DELIVER-4PKG-VERIFY ?auto_46369 ?auto_46370 ?auto_46371 ?auto_46372 ?auto_46368 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_46460 - OBJ
      ?auto_46461 - OBJ
      ?auto_46462 - OBJ
      ?auto_46463 - OBJ
      ?auto_46459 - LOCATION
    )
    :vars
    (
      ?auto_46465 - LOCATION
      ?auto_46466 - CITY
      ?auto_46464 - TRUCK
      ?auto_46467 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_46461 ?auto_46460 ) ) ( not ( = ?auto_46462 ?auto_46460 ) ) ( not ( = ?auto_46462 ?auto_46461 ) ) ( not ( = ?auto_46463 ?auto_46460 ) ) ( not ( = ?auto_46463 ?auto_46461 ) ) ( not ( = ?auto_46463 ?auto_46462 ) ) ( IN-CITY ?auto_46465 ?auto_46466 ) ( IN-CITY ?auto_46459 ?auto_46466 ) ( not ( = ?auto_46459 ?auto_46465 ) ) ( OBJ-AT ?auto_46461 ?auto_46459 ) ( OBJ-AT ?auto_46463 ?auto_46465 ) ( OBJ-AT ?auto_46462 ?auto_46465 ) ( IN-TRUCK ?auto_46460 ?auto_46464 ) ( TRUCK-AT ?auto_46464 ?auto_46467 ) ( IN-CITY ?auto_46467 ?auto_46466 ) ( not ( = ?auto_46459 ?auto_46467 ) ) ( not ( = ?auto_46465 ?auto_46467 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_46461 ?auto_46463 ?auto_46459 )
      ( DELIVER-4PKG-VERIFY ?auto_46460 ?auto_46461 ?auto_46462 ?auto_46463 ?auto_46459 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_46489 - OBJ
      ?auto_46490 - OBJ
      ?auto_46491 - OBJ
      ?auto_46492 - OBJ
      ?auto_46488 - LOCATION
    )
    :vars
    (
      ?auto_46494 - LOCATION
      ?auto_46495 - CITY
      ?auto_46493 - TRUCK
      ?auto_46496 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_46490 ?auto_46489 ) ) ( not ( = ?auto_46491 ?auto_46489 ) ) ( not ( = ?auto_46491 ?auto_46490 ) ) ( not ( = ?auto_46492 ?auto_46489 ) ) ( not ( = ?auto_46492 ?auto_46490 ) ) ( not ( = ?auto_46492 ?auto_46491 ) ) ( IN-CITY ?auto_46494 ?auto_46495 ) ( IN-CITY ?auto_46488 ?auto_46495 ) ( not ( = ?auto_46488 ?auto_46494 ) ) ( OBJ-AT ?auto_46490 ?auto_46488 ) ( OBJ-AT ?auto_46491 ?auto_46494 ) ( OBJ-AT ?auto_46492 ?auto_46494 ) ( IN-TRUCK ?auto_46489 ?auto_46493 ) ( TRUCK-AT ?auto_46493 ?auto_46496 ) ( IN-CITY ?auto_46496 ?auto_46495 ) ( not ( = ?auto_46488 ?auto_46496 ) ) ( not ( = ?auto_46494 ?auto_46496 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_46490 ?auto_46491 ?auto_46488 )
      ( DELIVER-4PKG-VERIFY ?auto_46489 ?auto_46490 ?auto_46491 ?auto_46492 ?auto_46488 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_46581 - OBJ
      ?auto_46582 - OBJ
      ?auto_46583 - OBJ
      ?auto_46584 - OBJ
      ?auto_46580 - LOCATION
    )
    :vars
    (
      ?auto_46586 - LOCATION
      ?auto_46587 - CITY
      ?auto_46585 - TRUCK
      ?auto_46588 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_46582 ?auto_46581 ) ) ( not ( = ?auto_46583 ?auto_46581 ) ) ( not ( = ?auto_46583 ?auto_46582 ) ) ( not ( = ?auto_46584 ?auto_46581 ) ) ( not ( = ?auto_46584 ?auto_46582 ) ) ( not ( = ?auto_46584 ?auto_46583 ) ) ( IN-CITY ?auto_46586 ?auto_46587 ) ( IN-CITY ?auto_46580 ?auto_46587 ) ( not ( = ?auto_46580 ?auto_46586 ) ) ( OBJ-AT ?auto_46583 ?auto_46580 ) ( OBJ-AT ?auto_46584 ?auto_46586 ) ( OBJ-AT ?auto_46582 ?auto_46586 ) ( IN-TRUCK ?auto_46581 ?auto_46585 ) ( TRUCK-AT ?auto_46585 ?auto_46588 ) ( IN-CITY ?auto_46588 ?auto_46587 ) ( not ( = ?auto_46580 ?auto_46588 ) ) ( not ( = ?auto_46586 ?auto_46588 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_46583 ?auto_46584 ?auto_46580 )
      ( DELIVER-4PKG-VERIFY ?auto_46581 ?auto_46582 ?auto_46583 ?auto_46584 ?auto_46580 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_46610 - OBJ
      ?auto_46611 - OBJ
      ?auto_46612 - OBJ
      ?auto_46613 - OBJ
      ?auto_46609 - LOCATION
    )
    :vars
    (
      ?auto_46615 - LOCATION
      ?auto_46616 - CITY
      ?auto_46614 - TRUCK
      ?auto_46617 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_46611 ?auto_46610 ) ) ( not ( = ?auto_46612 ?auto_46610 ) ) ( not ( = ?auto_46612 ?auto_46611 ) ) ( not ( = ?auto_46613 ?auto_46610 ) ) ( not ( = ?auto_46613 ?auto_46611 ) ) ( not ( = ?auto_46613 ?auto_46612 ) ) ( IN-CITY ?auto_46615 ?auto_46616 ) ( IN-CITY ?auto_46609 ?auto_46616 ) ( not ( = ?auto_46609 ?auto_46615 ) ) ( OBJ-AT ?auto_46613 ?auto_46609 ) ( OBJ-AT ?auto_46612 ?auto_46615 ) ( OBJ-AT ?auto_46611 ?auto_46615 ) ( IN-TRUCK ?auto_46610 ?auto_46614 ) ( TRUCK-AT ?auto_46614 ?auto_46617 ) ( IN-CITY ?auto_46617 ?auto_46616 ) ( not ( = ?auto_46609 ?auto_46617 ) ) ( not ( = ?auto_46615 ?auto_46617 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_46613 ?auto_46612 ?auto_46609 )
      ( DELIVER-4PKG-VERIFY ?auto_46610 ?auto_46611 ?auto_46612 ?auto_46613 ?auto_46609 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_46669 - OBJ
      ?auto_46670 - OBJ
      ?auto_46671 - OBJ
      ?auto_46672 - OBJ
      ?auto_46668 - LOCATION
    )
    :vars
    (
      ?auto_46674 - LOCATION
      ?auto_46675 - CITY
      ?auto_46673 - TRUCK
      ?auto_46676 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_46670 ?auto_46669 ) ) ( not ( = ?auto_46671 ?auto_46669 ) ) ( not ( = ?auto_46671 ?auto_46670 ) ) ( not ( = ?auto_46672 ?auto_46669 ) ) ( not ( = ?auto_46672 ?auto_46670 ) ) ( not ( = ?auto_46672 ?auto_46671 ) ) ( IN-CITY ?auto_46674 ?auto_46675 ) ( IN-CITY ?auto_46668 ?auto_46675 ) ( not ( = ?auto_46668 ?auto_46674 ) ) ( OBJ-AT ?auto_46671 ?auto_46668 ) ( OBJ-AT ?auto_46670 ?auto_46674 ) ( OBJ-AT ?auto_46672 ?auto_46674 ) ( IN-TRUCK ?auto_46669 ?auto_46673 ) ( TRUCK-AT ?auto_46673 ?auto_46676 ) ( IN-CITY ?auto_46676 ?auto_46675 ) ( not ( = ?auto_46668 ?auto_46676 ) ) ( not ( = ?auto_46674 ?auto_46676 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_46671 ?auto_46670 ?auto_46668 )
      ( DELIVER-4PKG-VERIFY ?auto_46669 ?auto_46670 ?auto_46671 ?auto_46672 ?auto_46668 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_46730 - OBJ
      ?auto_46731 - OBJ
      ?auto_46732 - OBJ
      ?auto_46733 - OBJ
      ?auto_46729 - LOCATION
    )
    :vars
    (
      ?auto_46735 - LOCATION
      ?auto_46736 - CITY
      ?auto_46734 - TRUCK
      ?auto_46737 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_46731 ?auto_46730 ) ) ( not ( = ?auto_46732 ?auto_46730 ) ) ( not ( = ?auto_46732 ?auto_46731 ) ) ( not ( = ?auto_46733 ?auto_46730 ) ) ( not ( = ?auto_46733 ?auto_46731 ) ) ( not ( = ?auto_46733 ?auto_46732 ) ) ( IN-CITY ?auto_46735 ?auto_46736 ) ( IN-CITY ?auto_46729 ?auto_46736 ) ( not ( = ?auto_46729 ?auto_46735 ) ) ( OBJ-AT ?auto_46733 ?auto_46729 ) ( OBJ-AT ?auto_46731 ?auto_46735 ) ( OBJ-AT ?auto_46732 ?auto_46735 ) ( IN-TRUCK ?auto_46730 ?auto_46734 ) ( TRUCK-AT ?auto_46734 ?auto_46737 ) ( IN-CITY ?auto_46737 ?auto_46736 ) ( not ( = ?auto_46729 ?auto_46737 ) ) ( not ( = ?auto_46735 ?auto_46737 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_46733 ?auto_46731 ?auto_46729 )
      ( DELIVER-4PKG-VERIFY ?auto_46730 ?auto_46731 ?auto_46732 ?auto_46733 ?auto_46729 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_46821 - OBJ
      ?auto_46822 - OBJ
      ?auto_46823 - OBJ
      ?auto_46824 - OBJ
      ?auto_46820 - LOCATION
    )
    :vars
    (
      ?auto_46826 - LOCATION
      ?auto_46827 - CITY
      ?auto_46825 - TRUCK
      ?auto_46828 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_46822 ?auto_46821 ) ) ( not ( = ?auto_46823 ?auto_46821 ) ) ( not ( = ?auto_46823 ?auto_46822 ) ) ( not ( = ?auto_46824 ?auto_46821 ) ) ( not ( = ?auto_46824 ?auto_46822 ) ) ( not ( = ?auto_46824 ?auto_46823 ) ) ( IN-CITY ?auto_46826 ?auto_46827 ) ( IN-CITY ?auto_46820 ?auto_46827 ) ( not ( = ?auto_46820 ?auto_46826 ) ) ( OBJ-AT ?auto_46822 ?auto_46820 ) ( OBJ-AT ?auto_46824 ?auto_46826 ) ( OBJ-AT ?auto_46821 ?auto_46826 ) ( IN-TRUCK ?auto_46823 ?auto_46825 ) ( TRUCK-AT ?auto_46825 ?auto_46828 ) ( IN-CITY ?auto_46828 ?auto_46827 ) ( not ( = ?auto_46820 ?auto_46828 ) ) ( not ( = ?auto_46826 ?auto_46828 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_46822 ?auto_46824 ?auto_46820 )
      ( DELIVER-4PKG-VERIFY ?auto_46821 ?auto_46822 ?auto_46823 ?auto_46824 ?auto_46820 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_46850 - OBJ
      ?auto_46851 - OBJ
      ?auto_46852 - OBJ
      ?auto_46853 - OBJ
      ?auto_46849 - LOCATION
    )
    :vars
    (
      ?auto_46855 - LOCATION
      ?auto_46856 - CITY
      ?auto_46854 - TRUCK
      ?auto_46857 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_46851 ?auto_46850 ) ) ( not ( = ?auto_46852 ?auto_46850 ) ) ( not ( = ?auto_46852 ?auto_46851 ) ) ( not ( = ?auto_46853 ?auto_46850 ) ) ( not ( = ?auto_46853 ?auto_46851 ) ) ( not ( = ?auto_46853 ?auto_46852 ) ) ( IN-CITY ?auto_46855 ?auto_46856 ) ( IN-CITY ?auto_46849 ?auto_46856 ) ( not ( = ?auto_46849 ?auto_46855 ) ) ( OBJ-AT ?auto_46851 ?auto_46849 ) ( OBJ-AT ?auto_46852 ?auto_46855 ) ( OBJ-AT ?auto_46850 ?auto_46855 ) ( IN-TRUCK ?auto_46853 ?auto_46854 ) ( TRUCK-AT ?auto_46854 ?auto_46857 ) ( IN-CITY ?auto_46857 ?auto_46856 ) ( not ( = ?auto_46849 ?auto_46857 ) ) ( not ( = ?auto_46855 ?auto_46857 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_46851 ?auto_46852 ?auto_46849 )
      ( DELIVER-4PKG-VERIFY ?auto_46850 ?auto_46851 ?auto_46852 ?auto_46853 ?auto_46849 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_46879 - OBJ
      ?auto_46880 - OBJ
      ?auto_46881 - OBJ
      ?auto_46882 - OBJ
      ?auto_46878 - LOCATION
    )
    :vars
    (
      ?auto_46884 - LOCATION
      ?auto_46885 - CITY
      ?auto_46883 - TRUCK
      ?auto_46886 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_46880 ?auto_46879 ) ) ( not ( = ?auto_46881 ?auto_46879 ) ) ( not ( = ?auto_46881 ?auto_46880 ) ) ( not ( = ?auto_46882 ?auto_46879 ) ) ( not ( = ?auto_46882 ?auto_46880 ) ) ( not ( = ?auto_46882 ?auto_46881 ) ) ( IN-CITY ?auto_46884 ?auto_46885 ) ( IN-CITY ?auto_46878 ?auto_46885 ) ( not ( = ?auto_46878 ?auto_46884 ) ) ( OBJ-AT ?auto_46881 ?auto_46878 ) ( OBJ-AT ?auto_46882 ?auto_46884 ) ( OBJ-AT ?auto_46879 ?auto_46884 ) ( IN-TRUCK ?auto_46880 ?auto_46883 ) ( TRUCK-AT ?auto_46883 ?auto_46886 ) ( IN-CITY ?auto_46886 ?auto_46885 ) ( not ( = ?auto_46878 ?auto_46886 ) ) ( not ( = ?auto_46884 ?auto_46886 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_46881 ?auto_46882 ?auto_46878 )
      ( DELIVER-4PKG-VERIFY ?auto_46879 ?auto_46880 ?auto_46881 ?auto_46882 ?auto_46878 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_46908 - OBJ
      ?auto_46909 - OBJ
      ?auto_46910 - OBJ
      ?auto_46911 - OBJ
      ?auto_46907 - LOCATION
    )
    :vars
    (
      ?auto_46913 - LOCATION
      ?auto_46914 - CITY
      ?auto_46912 - TRUCK
      ?auto_46915 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_46909 ?auto_46908 ) ) ( not ( = ?auto_46910 ?auto_46908 ) ) ( not ( = ?auto_46910 ?auto_46909 ) ) ( not ( = ?auto_46911 ?auto_46908 ) ) ( not ( = ?auto_46911 ?auto_46909 ) ) ( not ( = ?auto_46911 ?auto_46910 ) ) ( IN-CITY ?auto_46913 ?auto_46914 ) ( IN-CITY ?auto_46907 ?auto_46914 ) ( not ( = ?auto_46907 ?auto_46913 ) ) ( OBJ-AT ?auto_46911 ?auto_46907 ) ( OBJ-AT ?auto_46910 ?auto_46913 ) ( OBJ-AT ?auto_46908 ?auto_46913 ) ( IN-TRUCK ?auto_46909 ?auto_46912 ) ( TRUCK-AT ?auto_46912 ?auto_46915 ) ( IN-CITY ?auto_46915 ?auto_46914 ) ( not ( = ?auto_46907 ?auto_46915 ) ) ( not ( = ?auto_46913 ?auto_46915 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_46911 ?auto_46910 ?auto_46907 )
      ( DELIVER-4PKG-VERIFY ?auto_46908 ?auto_46909 ?auto_46910 ?auto_46911 ?auto_46907 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_47030 - OBJ
      ?auto_47031 - OBJ
      ?auto_47032 - OBJ
      ?auto_47033 - OBJ
      ?auto_47029 - LOCATION
    )
    :vars
    (
      ?auto_47035 - LOCATION
      ?auto_47036 - CITY
      ?auto_47034 - TRUCK
      ?auto_47037 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_47031 ?auto_47030 ) ) ( not ( = ?auto_47032 ?auto_47030 ) ) ( not ( = ?auto_47032 ?auto_47031 ) ) ( not ( = ?auto_47033 ?auto_47030 ) ) ( not ( = ?auto_47033 ?auto_47031 ) ) ( not ( = ?auto_47033 ?auto_47032 ) ) ( IN-CITY ?auto_47035 ?auto_47036 ) ( IN-CITY ?auto_47029 ?auto_47036 ) ( not ( = ?auto_47029 ?auto_47035 ) ) ( OBJ-AT ?auto_47032 ?auto_47029 ) ( OBJ-AT ?auto_47031 ?auto_47035 ) ( OBJ-AT ?auto_47030 ?auto_47035 ) ( IN-TRUCK ?auto_47033 ?auto_47034 ) ( TRUCK-AT ?auto_47034 ?auto_47037 ) ( IN-CITY ?auto_47037 ?auto_47036 ) ( not ( = ?auto_47029 ?auto_47037 ) ) ( not ( = ?auto_47035 ?auto_47037 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_47032 ?auto_47031 ?auto_47029 )
      ( DELIVER-4PKG-VERIFY ?auto_47030 ?auto_47031 ?auto_47032 ?auto_47033 ?auto_47029 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_47059 - OBJ
      ?auto_47060 - OBJ
      ?auto_47061 - OBJ
      ?auto_47062 - OBJ
      ?auto_47058 - LOCATION
    )
    :vars
    (
      ?auto_47064 - LOCATION
      ?auto_47065 - CITY
      ?auto_47063 - TRUCK
      ?auto_47066 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_47060 ?auto_47059 ) ) ( not ( = ?auto_47061 ?auto_47059 ) ) ( not ( = ?auto_47061 ?auto_47060 ) ) ( not ( = ?auto_47062 ?auto_47059 ) ) ( not ( = ?auto_47062 ?auto_47060 ) ) ( not ( = ?auto_47062 ?auto_47061 ) ) ( IN-CITY ?auto_47064 ?auto_47065 ) ( IN-CITY ?auto_47058 ?auto_47065 ) ( not ( = ?auto_47058 ?auto_47064 ) ) ( OBJ-AT ?auto_47062 ?auto_47058 ) ( OBJ-AT ?auto_47060 ?auto_47064 ) ( OBJ-AT ?auto_47059 ?auto_47064 ) ( IN-TRUCK ?auto_47061 ?auto_47063 ) ( TRUCK-AT ?auto_47063 ?auto_47066 ) ( IN-CITY ?auto_47066 ?auto_47065 ) ( not ( = ?auto_47058 ?auto_47066 ) ) ( not ( = ?auto_47064 ?auto_47066 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_47062 ?auto_47060 ?auto_47058 )
      ( DELIVER-4PKG-VERIFY ?auto_47059 ?auto_47060 ?auto_47061 ?auto_47062 ?auto_47058 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_47244 - OBJ
      ?auto_47245 - OBJ
      ?auto_47246 - OBJ
      ?auto_47247 - OBJ
      ?auto_47243 - LOCATION
    )
    :vars
    (
      ?auto_47249 - LOCATION
      ?auto_47250 - CITY
      ?auto_47248 - TRUCK
      ?auto_47251 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_47245 ?auto_47244 ) ) ( not ( = ?auto_47246 ?auto_47244 ) ) ( not ( = ?auto_47246 ?auto_47245 ) ) ( not ( = ?auto_47247 ?auto_47244 ) ) ( not ( = ?auto_47247 ?auto_47245 ) ) ( not ( = ?auto_47247 ?auto_47246 ) ) ( IN-CITY ?auto_47249 ?auto_47250 ) ( IN-CITY ?auto_47243 ?auto_47250 ) ( not ( = ?auto_47243 ?auto_47249 ) ) ( OBJ-AT ?auto_47245 ?auto_47243 ) ( OBJ-AT ?auto_47244 ?auto_47249 ) ( OBJ-AT ?auto_47247 ?auto_47249 ) ( IN-TRUCK ?auto_47246 ?auto_47248 ) ( TRUCK-AT ?auto_47248 ?auto_47251 ) ( IN-CITY ?auto_47251 ?auto_47250 ) ( not ( = ?auto_47243 ?auto_47251 ) ) ( not ( = ?auto_47249 ?auto_47251 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_47245 ?auto_47244 ?auto_47243 )
      ( DELIVER-4PKG-VERIFY ?auto_47244 ?auto_47245 ?auto_47246 ?auto_47247 ?auto_47243 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_47273 - OBJ
      ?auto_47274 - OBJ
      ?auto_47275 - OBJ
      ?auto_47276 - OBJ
      ?auto_47272 - LOCATION
    )
    :vars
    (
      ?auto_47278 - LOCATION
      ?auto_47279 - CITY
      ?auto_47277 - TRUCK
      ?auto_47280 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_47274 ?auto_47273 ) ) ( not ( = ?auto_47275 ?auto_47273 ) ) ( not ( = ?auto_47275 ?auto_47274 ) ) ( not ( = ?auto_47276 ?auto_47273 ) ) ( not ( = ?auto_47276 ?auto_47274 ) ) ( not ( = ?auto_47276 ?auto_47275 ) ) ( IN-CITY ?auto_47278 ?auto_47279 ) ( IN-CITY ?auto_47272 ?auto_47279 ) ( not ( = ?auto_47272 ?auto_47278 ) ) ( OBJ-AT ?auto_47274 ?auto_47272 ) ( OBJ-AT ?auto_47273 ?auto_47278 ) ( OBJ-AT ?auto_47275 ?auto_47278 ) ( IN-TRUCK ?auto_47276 ?auto_47277 ) ( TRUCK-AT ?auto_47277 ?auto_47280 ) ( IN-CITY ?auto_47280 ?auto_47279 ) ( not ( = ?auto_47272 ?auto_47280 ) ) ( not ( = ?auto_47278 ?auto_47280 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_47274 ?auto_47273 ?auto_47272 )
      ( DELIVER-4PKG-VERIFY ?auto_47273 ?auto_47274 ?auto_47275 ?auto_47276 ?auto_47272 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_47364 - OBJ
      ?auto_47365 - OBJ
      ?auto_47366 - OBJ
      ?auto_47367 - OBJ
      ?auto_47363 - LOCATION
    )
    :vars
    (
      ?auto_47369 - LOCATION
      ?auto_47370 - CITY
      ?auto_47368 - TRUCK
      ?auto_47371 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_47365 ?auto_47364 ) ) ( not ( = ?auto_47366 ?auto_47364 ) ) ( not ( = ?auto_47366 ?auto_47365 ) ) ( not ( = ?auto_47367 ?auto_47364 ) ) ( not ( = ?auto_47367 ?auto_47365 ) ) ( not ( = ?auto_47367 ?auto_47366 ) ) ( IN-CITY ?auto_47369 ?auto_47370 ) ( IN-CITY ?auto_47363 ?auto_47370 ) ( not ( = ?auto_47363 ?auto_47369 ) ) ( OBJ-AT ?auto_47366 ?auto_47363 ) ( OBJ-AT ?auto_47364 ?auto_47369 ) ( OBJ-AT ?auto_47367 ?auto_47369 ) ( IN-TRUCK ?auto_47365 ?auto_47368 ) ( TRUCK-AT ?auto_47368 ?auto_47371 ) ( IN-CITY ?auto_47371 ?auto_47370 ) ( not ( = ?auto_47363 ?auto_47371 ) ) ( not ( = ?auto_47369 ?auto_47371 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_47366 ?auto_47364 ?auto_47363 )
      ( DELIVER-4PKG-VERIFY ?auto_47364 ?auto_47365 ?auto_47366 ?auto_47367 ?auto_47363 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_47425 - OBJ
      ?auto_47426 - OBJ
      ?auto_47427 - OBJ
      ?auto_47428 - OBJ
      ?auto_47424 - LOCATION
    )
    :vars
    (
      ?auto_47430 - LOCATION
      ?auto_47431 - CITY
      ?auto_47429 - TRUCK
      ?auto_47432 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_47426 ?auto_47425 ) ) ( not ( = ?auto_47427 ?auto_47425 ) ) ( not ( = ?auto_47427 ?auto_47426 ) ) ( not ( = ?auto_47428 ?auto_47425 ) ) ( not ( = ?auto_47428 ?auto_47426 ) ) ( not ( = ?auto_47428 ?auto_47427 ) ) ( IN-CITY ?auto_47430 ?auto_47431 ) ( IN-CITY ?auto_47424 ?auto_47431 ) ( not ( = ?auto_47424 ?auto_47430 ) ) ( OBJ-AT ?auto_47428 ?auto_47424 ) ( OBJ-AT ?auto_47425 ?auto_47430 ) ( OBJ-AT ?auto_47427 ?auto_47430 ) ( IN-TRUCK ?auto_47426 ?auto_47429 ) ( TRUCK-AT ?auto_47429 ?auto_47432 ) ( IN-CITY ?auto_47432 ?auto_47431 ) ( not ( = ?auto_47424 ?auto_47432 ) ) ( not ( = ?auto_47430 ?auto_47432 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_47428 ?auto_47425 ?auto_47424 )
      ( DELIVER-4PKG-VERIFY ?auto_47425 ?auto_47426 ?auto_47427 ?auto_47428 ?auto_47424 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_47516 - OBJ
      ?auto_47517 - OBJ
      ?auto_47518 - OBJ
      ?auto_47519 - OBJ
      ?auto_47515 - LOCATION
    )
    :vars
    (
      ?auto_47521 - LOCATION
      ?auto_47522 - CITY
      ?auto_47520 - TRUCK
      ?auto_47523 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_47517 ?auto_47516 ) ) ( not ( = ?auto_47518 ?auto_47516 ) ) ( not ( = ?auto_47518 ?auto_47517 ) ) ( not ( = ?auto_47519 ?auto_47516 ) ) ( not ( = ?auto_47519 ?auto_47517 ) ) ( not ( = ?auto_47519 ?auto_47518 ) ) ( IN-CITY ?auto_47521 ?auto_47522 ) ( IN-CITY ?auto_47515 ?auto_47522 ) ( not ( = ?auto_47515 ?auto_47521 ) ) ( OBJ-AT ?auto_47518 ?auto_47515 ) ( OBJ-AT ?auto_47516 ?auto_47521 ) ( OBJ-AT ?auto_47517 ?auto_47521 ) ( IN-TRUCK ?auto_47519 ?auto_47520 ) ( TRUCK-AT ?auto_47520 ?auto_47523 ) ( IN-CITY ?auto_47523 ?auto_47522 ) ( not ( = ?auto_47515 ?auto_47523 ) ) ( not ( = ?auto_47521 ?auto_47523 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_47518 ?auto_47516 ?auto_47515 )
      ( DELIVER-4PKG-VERIFY ?auto_47516 ?auto_47517 ?auto_47518 ?auto_47519 ?auto_47515 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_47545 - OBJ
      ?auto_47546 - OBJ
      ?auto_47547 - OBJ
      ?auto_47548 - OBJ
      ?auto_47544 - LOCATION
    )
    :vars
    (
      ?auto_47550 - LOCATION
      ?auto_47551 - CITY
      ?auto_47549 - TRUCK
      ?auto_47552 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_47546 ?auto_47545 ) ) ( not ( = ?auto_47547 ?auto_47545 ) ) ( not ( = ?auto_47547 ?auto_47546 ) ) ( not ( = ?auto_47548 ?auto_47545 ) ) ( not ( = ?auto_47548 ?auto_47546 ) ) ( not ( = ?auto_47548 ?auto_47547 ) ) ( IN-CITY ?auto_47550 ?auto_47551 ) ( IN-CITY ?auto_47544 ?auto_47551 ) ( not ( = ?auto_47544 ?auto_47550 ) ) ( OBJ-AT ?auto_47548 ?auto_47544 ) ( OBJ-AT ?auto_47545 ?auto_47550 ) ( OBJ-AT ?auto_47546 ?auto_47550 ) ( IN-TRUCK ?auto_47547 ?auto_47549 ) ( TRUCK-AT ?auto_47549 ?auto_47552 ) ( IN-CITY ?auto_47552 ?auto_47551 ) ( not ( = ?auto_47544 ?auto_47552 ) ) ( not ( = ?auto_47550 ?auto_47552 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_47548 ?auto_47545 ?auto_47544 )
      ( DELIVER-4PKG-VERIFY ?auto_47545 ?auto_47546 ?auto_47547 ?auto_47548 ?auto_47544 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_47839 - OBJ
      ?auto_47838 - LOCATION
    )
    :vars
    (
      ?auto_47846 - OBJ
      ?auto_47843 - LOCATION
      ?auto_47844 - CITY
      ?auto_47842 - OBJ
      ?auto_47840 - OBJ
      ?auto_47841 - TRUCK
      ?auto_47845 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_47839 ?auto_47846 ) ) ( IN-CITY ?auto_47843 ?auto_47844 ) ( IN-CITY ?auto_47838 ?auto_47844 ) ( not ( = ?auto_47838 ?auto_47843 ) ) ( OBJ-AT ?auto_47846 ?auto_47838 ) ( OBJ-AT ?auto_47839 ?auto_47843 ) ( not ( = ?auto_47842 ?auto_47846 ) ) ( not ( = ?auto_47839 ?auto_47842 ) ) ( OBJ-AT ?auto_47842 ?auto_47843 ) ( not ( = ?auto_47840 ?auto_47846 ) ) ( not ( = ?auto_47839 ?auto_47840 ) ) ( not ( = ?auto_47842 ?auto_47840 ) ) ( TRUCK-AT ?auto_47841 ?auto_47845 ) ( IN-CITY ?auto_47845 ?auto_47844 ) ( not ( = ?auto_47838 ?auto_47845 ) ) ( not ( = ?auto_47843 ?auto_47845 ) ) ( OBJ-AT ?auto_47840 ?auto_47845 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_47840 ?auto_47841 ?auto_47845 )
      ( DELIVER-2PKG ?auto_47846 ?auto_47839 ?auto_47838 )
      ( DELIVER-1PKG-VERIFY ?auto_47839 ?auto_47838 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_47848 - OBJ
      ?auto_47849 - OBJ
      ?auto_47847 - LOCATION
    )
    :vars
    (
      ?auto_47850 - LOCATION
      ?auto_47852 - CITY
      ?auto_47851 - OBJ
      ?auto_47853 - OBJ
      ?auto_47855 - TRUCK
      ?auto_47854 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_47849 ?auto_47848 ) ) ( IN-CITY ?auto_47850 ?auto_47852 ) ( IN-CITY ?auto_47847 ?auto_47852 ) ( not ( = ?auto_47847 ?auto_47850 ) ) ( OBJ-AT ?auto_47848 ?auto_47847 ) ( OBJ-AT ?auto_47849 ?auto_47850 ) ( not ( = ?auto_47851 ?auto_47848 ) ) ( not ( = ?auto_47849 ?auto_47851 ) ) ( OBJ-AT ?auto_47851 ?auto_47850 ) ( not ( = ?auto_47853 ?auto_47848 ) ) ( not ( = ?auto_47849 ?auto_47853 ) ) ( not ( = ?auto_47851 ?auto_47853 ) ) ( TRUCK-AT ?auto_47855 ?auto_47854 ) ( IN-CITY ?auto_47854 ?auto_47852 ) ( not ( = ?auto_47847 ?auto_47854 ) ) ( not ( = ?auto_47850 ?auto_47854 ) ) ( OBJ-AT ?auto_47853 ?auto_47854 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_47849 ?auto_47847 )
      ( DELIVER-2PKG-VERIFY ?auto_47848 ?auto_47849 ?auto_47847 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_47857 - OBJ
      ?auto_47858 - OBJ
      ?auto_47856 - LOCATION
    )
    :vars
    (
      ?auto_47864 - OBJ
      ?auto_47863 - LOCATION
      ?auto_47862 - CITY
      ?auto_47861 - OBJ
      ?auto_47859 - TRUCK
      ?auto_47860 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_47858 ?auto_47857 ) ) ( not ( = ?auto_47858 ?auto_47864 ) ) ( IN-CITY ?auto_47863 ?auto_47862 ) ( IN-CITY ?auto_47856 ?auto_47862 ) ( not ( = ?auto_47856 ?auto_47863 ) ) ( OBJ-AT ?auto_47864 ?auto_47856 ) ( OBJ-AT ?auto_47858 ?auto_47863 ) ( not ( = ?auto_47861 ?auto_47864 ) ) ( not ( = ?auto_47858 ?auto_47861 ) ) ( OBJ-AT ?auto_47861 ?auto_47863 ) ( not ( = ?auto_47857 ?auto_47864 ) ) ( not ( = ?auto_47861 ?auto_47857 ) ) ( TRUCK-AT ?auto_47859 ?auto_47860 ) ( IN-CITY ?auto_47860 ?auto_47862 ) ( not ( = ?auto_47856 ?auto_47860 ) ) ( not ( = ?auto_47863 ?auto_47860 ) ) ( OBJ-AT ?auto_47857 ?auto_47860 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_47864 ?auto_47858 ?auto_47856 )
      ( DELIVER-2PKG-VERIFY ?auto_47857 ?auto_47858 ?auto_47856 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_47866 - OBJ
      ?auto_47867 - OBJ
      ?auto_47865 - LOCATION
    )
    :vars
    (
      ?auto_47873 - OBJ
      ?auto_47872 - LOCATION
      ?auto_47870 - CITY
      ?auto_47871 - OBJ
      ?auto_47868 - TRUCK
      ?auto_47869 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_47867 ?auto_47866 ) ) ( not ( = ?auto_47867 ?auto_47873 ) ) ( IN-CITY ?auto_47872 ?auto_47870 ) ( IN-CITY ?auto_47865 ?auto_47870 ) ( not ( = ?auto_47865 ?auto_47872 ) ) ( OBJ-AT ?auto_47873 ?auto_47865 ) ( OBJ-AT ?auto_47867 ?auto_47872 ) ( not ( = ?auto_47866 ?auto_47873 ) ) ( OBJ-AT ?auto_47866 ?auto_47872 ) ( not ( = ?auto_47871 ?auto_47873 ) ) ( not ( = ?auto_47867 ?auto_47871 ) ) ( not ( = ?auto_47866 ?auto_47871 ) ) ( TRUCK-AT ?auto_47868 ?auto_47869 ) ( IN-CITY ?auto_47869 ?auto_47870 ) ( not ( = ?auto_47865 ?auto_47869 ) ) ( not ( = ?auto_47872 ?auto_47869 ) ) ( OBJ-AT ?auto_47871 ?auto_47869 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_47873 ?auto_47867 ?auto_47865 )
      ( DELIVER-2PKG-VERIFY ?auto_47866 ?auto_47867 ?auto_47865 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_47875 - OBJ
      ?auto_47876 - OBJ
      ?auto_47874 - LOCATION
    )
    :vars
    (
      ?auto_47882 - LOCATION
      ?auto_47880 - CITY
      ?auto_47879 - OBJ
      ?auto_47881 - OBJ
      ?auto_47877 - TRUCK
      ?auto_47878 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_47876 ?auto_47875 ) ) ( IN-CITY ?auto_47882 ?auto_47880 ) ( IN-CITY ?auto_47874 ?auto_47880 ) ( not ( = ?auto_47874 ?auto_47882 ) ) ( OBJ-AT ?auto_47876 ?auto_47874 ) ( OBJ-AT ?auto_47875 ?auto_47882 ) ( not ( = ?auto_47879 ?auto_47876 ) ) ( not ( = ?auto_47875 ?auto_47879 ) ) ( OBJ-AT ?auto_47879 ?auto_47882 ) ( not ( = ?auto_47881 ?auto_47876 ) ) ( not ( = ?auto_47875 ?auto_47881 ) ) ( not ( = ?auto_47879 ?auto_47881 ) ) ( TRUCK-AT ?auto_47877 ?auto_47878 ) ( IN-CITY ?auto_47878 ?auto_47880 ) ( not ( = ?auto_47874 ?auto_47878 ) ) ( not ( = ?auto_47882 ?auto_47878 ) ) ( OBJ-AT ?auto_47881 ?auto_47878 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_47876 ?auto_47875 ?auto_47874 )
      ( DELIVER-2PKG-VERIFY ?auto_47875 ?auto_47876 ?auto_47874 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_47884 - OBJ
      ?auto_47885 - OBJ
      ?auto_47883 - LOCATION
    )
    :vars
    (
      ?auto_47891 - OBJ
      ?auto_47890 - LOCATION
      ?auto_47889 - CITY
      ?auto_47888 - OBJ
      ?auto_47886 - TRUCK
      ?auto_47887 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_47885 ?auto_47884 ) ) ( not ( = ?auto_47884 ?auto_47891 ) ) ( IN-CITY ?auto_47890 ?auto_47889 ) ( IN-CITY ?auto_47883 ?auto_47889 ) ( not ( = ?auto_47883 ?auto_47890 ) ) ( OBJ-AT ?auto_47891 ?auto_47883 ) ( OBJ-AT ?auto_47884 ?auto_47890 ) ( not ( = ?auto_47888 ?auto_47891 ) ) ( not ( = ?auto_47884 ?auto_47888 ) ) ( OBJ-AT ?auto_47888 ?auto_47890 ) ( not ( = ?auto_47885 ?auto_47891 ) ) ( not ( = ?auto_47888 ?auto_47885 ) ) ( TRUCK-AT ?auto_47886 ?auto_47887 ) ( IN-CITY ?auto_47887 ?auto_47889 ) ( not ( = ?auto_47883 ?auto_47887 ) ) ( not ( = ?auto_47890 ?auto_47887 ) ) ( OBJ-AT ?auto_47885 ?auto_47887 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_47891 ?auto_47884 ?auto_47883 )
      ( DELIVER-2PKG-VERIFY ?auto_47884 ?auto_47885 ?auto_47883 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_47893 - OBJ
      ?auto_47894 - OBJ
      ?auto_47892 - LOCATION
    )
    :vars
    (
      ?auto_47900 - OBJ
      ?auto_47899 - LOCATION
      ?auto_47897 - CITY
      ?auto_47898 - OBJ
      ?auto_47895 - TRUCK
      ?auto_47896 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_47894 ?auto_47893 ) ) ( not ( = ?auto_47893 ?auto_47900 ) ) ( IN-CITY ?auto_47899 ?auto_47897 ) ( IN-CITY ?auto_47892 ?auto_47897 ) ( not ( = ?auto_47892 ?auto_47899 ) ) ( OBJ-AT ?auto_47900 ?auto_47892 ) ( OBJ-AT ?auto_47893 ?auto_47899 ) ( not ( = ?auto_47894 ?auto_47900 ) ) ( OBJ-AT ?auto_47894 ?auto_47899 ) ( not ( = ?auto_47898 ?auto_47900 ) ) ( not ( = ?auto_47893 ?auto_47898 ) ) ( not ( = ?auto_47894 ?auto_47898 ) ) ( TRUCK-AT ?auto_47895 ?auto_47896 ) ( IN-CITY ?auto_47896 ?auto_47897 ) ( not ( = ?auto_47892 ?auto_47896 ) ) ( not ( = ?auto_47899 ?auto_47896 ) ) ( OBJ-AT ?auto_47898 ?auto_47896 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_47900 ?auto_47893 ?auto_47892 )
      ( DELIVER-2PKG-VERIFY ?auto_47893 ?auto_47894 ?auto_47892 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_47922 - OBJ
      ?auto_47923 - OBJ
      ?auto_47924 - OBJ
      ?auto_47921 - LOCATION
    )
    :vars
    (
      ?auto_47929 - LOCATION
      ?auto_47928 - CITY
      ?auto_47927 - OBJ
      ?auto_47925 - TRUCK
      ?auto_47926 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_47923 ?auto_47922 ) ) ( not ( = ?auto_47924 ?auto_47922 ) ) ( not ( = ?auto_47924 ?auto_47923 ) ) ( IN-CITY ?auto_47929 ?auto_47928 ) ( IN-CITY ?auto_47921 ?auto_47928 ) ( not ( = ?auto_47921 ?auto_47929 ) ) ( OBJ-AT ?auto_47922 ?auto_47921 ) ( OBJ-AT ?auto_47924 ?auto_47929 ) ( not ( = ?auto_47927 ?auto_47922 ) ) ( not ( = ?auto_47924 ?auto_47927 ) ) ( OBJ-AT ?auto_47927 ?auto_47929 ) ( not ( = ?auto_47927 ?auto_47923 ) ) ( TRUCK-AT ?auto_47925 ?auto_47926 ) ( IN-CITY ?auto_47926 ?auto_47928 ) ( not ( = ?auto_47921 ?auto_47926 ) ) ( not ( = ?auto_47929 ?auto_47926 ) ) ( OBJ-AT ?auto_47923 ?auto_47926 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_47922 ?auto_47924 ?auto_47921 )
      ( DELIVER-3PKG-VERIFY ?auto_47922 ?auto_47923 ?auto_47924 ?auto_47921 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_47931 - OBJ
      ?auto_47932 - OBJ
      ?auto_47933 - OBJ
      ?auto_47930 - LOCATION
    )
    :vars
    (
      ?auto_47938 - LOCATION
      ?auto_47936 - CITY
      ?auto_47937 - OBJ
      ?auto_47934 - TRUCK
      ?auto_47935 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_47932 ?auto_47931 ) ) ( not ( = ?auto_47933 ?auto_47931 ) ) ( not ( = ?auto_47933 ?auto_47932 ) ) ( IN-CITY ?auto_47938 ?auto_47936 ) ( IN-CITY ?auto_47930 ?auto_47936 ) ( not ( = ?auto_47930 ?auto_47938 ) ) ( OBJ-AT ?auto_47931 ?auto_47930 ) ( OBJ-AT ?auto_47933 ?auto_47938 ) ( OBJ-AT ?auto_47932 ?auto_47938 ) ( not ( = ?auto_47937 ?auto_47931 ) ) ( not ( = ?auto_47933 ?auto_47937 ) ) ( not ( = ?auto_47932 ?auto_47937 ) ) ( TRUCK-AT ?auto_47934 ?auto_47935 ) ( IN-CITY ?auto_47935 ?auto_47936 ) ( not ( = ?auto_47930 ?auto_47935 ) ) ( not ( = ?auto_47938 ?auto_47935 ) ) ( OBJ-AT ?auto_47937 ?auto_47935 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_47931 ?auto_47933 ?auto_47930 )
      ( DELIVER-3PKG-VERIFY ?auto_47931 ?auto_47932 ?auto_47933 ?auto_47930 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_47950 - OBJ
      ?auto_47951 - OBJ
      ?auto_47952 - OBJ
      ?auto_47949 - LOCATION
    )
    :vars
    (
      ?auto_47957 - LOCATION
      ?auto_47956 - CITY
      ?auto_47955 - OBJ
      ?auto_47953 - TRUCK
      ?auto_47954 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_47951 ?auto_47950 ) ) ( not ( = ?auto_47952 ?auto_47950 ) ) ( not ( = ?auto_47952 ?auto_47951 ) ) ( IN-CITY ?auto_47957 ?auto_47956 ) ( IN-CITY ?auto_47949 ?auto_47956 ) ( not ( = ?auto_47949 ?auto_47957 ) ) ( OBJ-AT ?auto_47950 ?auto_47949 ) ( OBJ-AT ?auto_47951 ?auto_47957 ) ( not ( = ?auto_47955 ?auto_47950 ) ) ( not ( = ?auto_47951 ?auto_47955 ) ) ( OBJ-AT ?auto_47955 ?auto_47957 ) ( not ( = ?auto_47955 ?auto_47952 ) ) ( TRUCK-AT ?auto_47953 ?auto_47954 ) ( IN-CITY ?auto_47954 ?auto_47956 ) ( not ( = ?auto_47949 ?auto_47954 ) ) ( not ( = ?auto_47957 ?auto_47954 ) ) ( OBJ-AT ?auto_47952 ?auto_47954 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_47950 ?auto_47951 ?auto_47949 )
      ( DELIVER-3PKG-VERIFY ?auto_47950 ?auto_47951 ?auto_47952 ?auto_47949 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_47959 - OBJ
      ?auto_47960 - OBJ
      ?auto_47961 - OBJ
      ?auto_47958 - LOCATION
    )
    :vars
    (
      ?auto_47966 - LOCATION
      ?auto_47964 - CITY
      ?auto_47965 - OBJ
      ?auto_47962 - TRUCK
      ?auto_47963 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_47960 ?auto_47959 ) ) ( not ( = ?auto_47961 ?auto_47959 ) ) ( not ( = ?auto_47961 ?auto_47960 ) ) ( IN-CITY ?auto_47966 ?auto_47964 ) ( IN-CITY ?auto_47958 ?auto_47964 ) ( not ( = ?auto_47958 ?auto_47966 ) ) ( OBJ-AT ?auto_47959 ?auto_47958 ) ( OBJ-AT ?auto_47960 ?auto_47966 ) ( OBJ-AT ?auto_47961 ?auto_47966 ) ( not ( = ?auto_47965 ?auto_47959 ) ) ( not ( = ?auto_47960 ?auto_47965 ) ) ( not ( = ?auto_47961 ?auto_47965 ) ) ( TRUCK-AT ?auto_47962 ?auto_47963 ) ( IN-CITY ?auto_47963 ?auto_47964 ) ( not ( = ?auto_47958 ?auto_47963 ) ) ( not ( = ?auto_47966 ?auto_47963 ) ) ( OBJ-AT ?auto_47965 ?auto_47963 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_47959 ?auto_47960 ?auto_47958 )
      ( DELIVER-3PKG-VERIFY ?auto_47959 ?auto_47960 ?auto_47961 ?auto_47958 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_47978 - OBJ
      ?auto_47979 - OBJ
      ?auto_47980 - OBJ
      ?auto_47977 - LOCATION
    )
    :vars
    (
      ?auto_47985 - LOCATION
      ?auto_47984 - CITY
      ?auto_47983 - OBJ
      ?auto_47981 - TRUCK
      ?auto_47982 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_47979 ?auto_47978 ) ) ( not ( = ?auto_47980 ?auto_47978 ) ) ( not ( = ?auto_47980 ?auto_47979 ) ) ( IN-CITY ?auto_47985 ?auto_47984 ) ( IN-CITY ?auto_47977 ?auto_47984 ) ( not ( = ?auto_47977 ?auto_47985 ) ) ( OBJ-AT ?auto_47979 ?auto_47977 ) ( OBJ-AT ?auto_47980 ?auto_47985 ) ( not ( = ?auto_47983 ?auto_47979 ) ) ( not ( = ?auto_47980 ?auto_47983 ) ) ( OBJ-AT ?auto_47983 ?auto_47985 ) ( not ( = ?auto_47983 ?auto_47978 ) ) ( TRUCK-AT ?auto_47981 ?auto_47982 ) ( IN-CITY ?auto_47982 ?auto_47984 ) ( not ( = ?auto_47977 ?auto_47982 ) ) ( not ( = ?auto_47985 ?auto_47982 ) ) ( OBJ-AT ?auto_47978 ?auto_47982 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_47979 ?auto_47980 ?auto_47977 )
      ( DELIVER-3PKG-VERIFY ?auto_47978 ?auto_47979 ?auto_47980 ?auto_47977 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_47997 - OBJ
      ?auto_47998 - OBJ
      ?auto_47999 - OBJ
      ?auto_47996 - LOCATION
    )
    :vars
    (
      ?auto_48004 - OBJ
      ?auto_48003 - LOCATION
      ?auto_48002 - CITY
      ?auto_48000 - TRUCK
      ?auto_48001 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_47998 ?auto_47997 ) ) ( not ( = ?auto_47999 ?auto_47997 ) ) ( not ( = ?auto_47999 ?auto_47998 ) ) ( not ( = ?auto_47999 ?auto_48004 ) ) ( IN-CITY ?auto_48003 ?auto_48002 ) ( IN-CITY ?auto_47996 ?auto_48002 ) ( not ( = ?auto_47996 ?auto_48003 ) ) ( OBJ-AT ?auto_48004 ?auto_47996 ) ( OBJ-AT ?auto_47999 ?auto_48003 ) ( not ( = ?auto_47998 ?auto_48004 ) ) ( OBJ-AT ?auto_47998 ?auto_48003 ) ( not ( = ?auto_47997 ?auto_48004 ) ) ( TRUCK-AT ?auto_48000 ?auto_48001 ) ( IN-CITY ?auto_48001 ?auto_48002 ) ( not ( = ?auto_47996 ?auto_48001 ) ) ( not ( = ?auto_48003 ?auto_48001 ) ) ( OBJ-AT ?auto_47997 ?auto_48001 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48004 ?auto_47999 ?auto_47996 )
      ( DELIVER-3PKG-VERIFY ?auto_47997 ?auto_47998 ?auto_47999 ?auto_47996 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_48006 - OBJ
      ?auto_48007 - OBJ
      ?auto_48008 - OBJ
      ?auto_48005 - LOCATION
    )
    :vars
    (
      ?auto_48013 - LOCATION
      ?auto_48012 - CITY
      ?auto_48011 - OBJ
      ?auto_48009 - TRUCK
      ?auto_48010 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48007 ?auto_48006 ) ) ( not ( = ?auto_48008 ?auto_48006 ) ) ( not ( = ?auto_48008 ?auto_48007 ) ) ( IN-CITY ?auto_48013 ?auto_48012 ) ( IN-CITY ?auto_48005 ?auto_48012 ) ( not ( = ?auto_48005 ?auto_48013 ) ) ( OBJ-AT ?auto_48008 ?auto_48005 ) ( OBJ-AT ?auto_48007 ?auto_48013 ) ( not ( = ?auto_48011 ?auto_48008 ) ) ( not ( = ?auto_48007 ?auto_48011 ) ) ( OBJ-AT ?auto_48011 ?auto_48013 ) ( not ( = ?auto_48011 ?auto_48006 ) ) ( TRUCK-AT ?auto_48009 ?auto_48010 ) ( IN-CITY ?auto_48010 ?auto_48012 ) ( not ( = ?auto_48005 ?auto_48010 ) ) ( not ( = ?auto_48013 ?auto_48010 ) ) ( OBJ-AT ?auto_48006 ?auto_48010 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48008 ?auto_48007 ?auto_48005 )
      ( DELIVER-3PKG-VERIFY ?auto_48006 ?auto_48007 ?auto_48008 ?auto_48005 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_48025 - OBJ
      ?auto_48026 - OBJ
      ?auto_48027 - OBJ
      ?auto_48024 - LOCATION
    )
    :vars
    (
      ?auto_48032 - OBJ
      ?auto_48031 - LOCATION
      ?auto_48030 - CITY
      ?auto_48028 - TRUCK
      ?auto_48029 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48026 ?auto_48025 ) ) ( not ( = ?auto_48027 ?auto_48025 ) ) ( not ( = ?auto_48027 ?auto_48026 ) ) ( not ( = ?auto_48026 ?auto_48032 ) ) ( IN-CITY ?auto_48031 ?auto_48030 ) ( IN-CITY ?auto_48024 ?auto_48030 ) ( not ( = ?auto_48024 ?auto_48031 ) ) ( OBJ-AT ?auto_48032 ?auto_48024 ) ( OBJ-AT ?auto_48026 ?auto_48031 ) ( not ( = ?auto_48027 ?auto_48032 ) ) ( OBJ-AT ?auto_48027 ?auto_48031 ) ( not ( = ?auto_48025 ?auto_48032 ) ) ( TRUCK-AT ?auto_48028 ?auto_48029 ) ( IN-CITY ?auto_48029 ?auto_48030 ) ( not ( = ?auto_48024 ?auto_48029 ) ) ( not ( = ?auto_48031 ?auto_48029 ) ) ( OBJ-AT ?auto_48025 ?auto_48029 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48032 ?auto_48026 ?auto_48024 )
      ( DELIVER-3PKG-VERIFY ?auto_48025 ?auto_48026 ?auto_48027 ?auto_48024 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_48044 - OBJ
      ?auto_48045 - OBJ
      ?auto_48046 - OBJ
      ?auto_48043 - LOCATION
    )
    :vars
    (
      ?auto_48051 - LOCATION
      ?auto_48049 - CITY
      ?auto_48050 - OBJ
      ?auto_48047 - TRUCK
      ?auto_48048 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48045 ?auto_48044 ) ) ( not ( = ?auto_48046 ?auto_48044 ) ) ( not ( = ?auto_48046 ?auto_48045 ) ) ( IN-CITY ?auto_48051 ?auto_48049 ) ( IN-CITY ?auto_48043 ?auto_48049 ) ( not ( = ?auto_48043 ?auto_48051 ) ) ( OBJ-AT ?auto_48045 ?auto_48043 ) ( OBJ-AT ?auto_48046 ?auto_48051 ) ( OBJ-AT ?auto_48044 ?auto_48051 ) ( not ( = ?auto_48050 ?auto_48045 ) ) ( not ( = ?auto_48046 ?auto_48050 ) ) ( not ( = ?auto_48044 ?auto_48050 ) ) ( TRUCK-AT ?auto_48047 ?auto_48048 ) ( IN-CITY ?auto_48048 ?auto_48049 ) ( not ( = ?auto_48043 ?auto_48048 ) ) ( not ( = ?auto_48051 ?auto_48048 ) ) ( OBJ-AT ?auto_48050 ?auto_48048 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48045 ?auto_48046 ?auto_48043 )
      ( DELIVER-3PKG-VERIFY ?auto_48044 ?auto_48045 ?auto_48046 ?auto_48043 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_48053 - OBJ
      ?auto_48054 - OBJ
      ?auto_48055 - OBJ
      ?auto_48052 - LOCATION
    )
    :vars
    (
      ?auto_48060 - OBJ
      ?auto_48059 - LOCATION
      ?auto_48058 - CITY
      ?auto_48056 - TRUCK
      ?auto_48057 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48054 ?auto_48053 ) ) ( not ( = ?auto_48055 ?auto_48053 ) ) ( not ( = ?auto_48055 ?auto_48054 ) ) ( not ( = ?auto_48055 ?auto_48060 ) ) ( IN-CITY ?auto_48059 ?auto_48058 ) ( IN-CITY ?auto_48052 ?auto_48058 ) ( not ( = ?auto_48052 ?auto_48059 ) ) ( OBJ-AT ?auto_48060 ?auto_48052 ) ( OBJ-AT ?auto_48055 ?auto_48059 ) ( not ( = ?auto_48053 ?auto_48060 ) ) ( OBJ-AT ?auto_48053 ?auto_48059 ) ( not ( = ?auto_48054 ?auto_48060 ) ) ( TRUCK-AT ?auto_48056 ?auto_48057 ) ( IN-CITY ?auto_48057 ?auto_48058 ) ( not ( = ?auto_48052 ?auto_48057 ) ) ( not ( = ?auto_48059 ?auto_48057 ) ) ( OBJ-AT ?auto_48054 ?auto_48057 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48060 ?auto_48055 ?auto_48052 )
      ( DELIVER-3PKG-VERIFY ?auto_48053 ?auto_48054 ?auto_48055 ?auto_48052 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_48072 - OBJ
      ?auto_48073 - OBJ
      ?auto_48074 - OBJ
      ?auto_48071 - LOCATION
    )
    :vars
    (
      ?auto_48079 - LOCATION
      ?auto_48077 - CITY
      ?auto_48078 - OBJ
      ?auto_48075 - TRUCK
      ?auto_48076 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48073 ?auto_48072 ) ) ( not ( = ?auto_48074 ?auto_48072 ) ) ( not ( = ?auto_48074 ?auto_48073 ) ) ( IN-CITY ?auto_48079 ?auto_48077 ) ( IN-CITY ?auto_48071 ?auto_48077 ) ( not ( = ?auto_48071 ?auto_48079 ) ) ( OBJ-AT ?auto_48074 ?auto_48071 ) ( OBJ-AT ?auto_48073 ?auto_48079 ) ( OBJ-AT ?auto_48072 ?auto_48079 ) ( not ( = ?auto_48078 ?auto_48074 ) ) ( not ( = ?auto_48073 ?auto_48078 ) ) ( not ( = ?auto_48072 ?auto_48078 ) ) ( TRUCK-AT ?auto_48075 ?auto_48076 ) ( IN-CITY ?auto_48076 ?auto_48077 ) ( not ( = ?auto_48071 ?auto_48076 ) ) ( not ( = ?auto_48079 ?auto_48076 ) ) ( OBJ-AT ?auto_48078 ?auto_48076 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48074 ?auto_48073 ?auto_48071 )
      ( DELIVER-3PKG-VERIFY ?auto_48072 ?auto_48073 ?auto_48074 ?auto_48071 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_48081 - OBJ
      ?auto_48082 - OBJ
      ?auto_48083 - OBJ
      ?auto_48080 - LOCATION
    )
    :vars
    (
      ?auto_48088 - OBJ
      ?auto_48087 - LOCATION
      ?auto_48086 - CITY
      ?auto_48084 - TRUCK
      ?auto_48085 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48082 ?auto_48081 ) ) ( not ( = ?auto_48083 ?auto_48081 ) ) ( not ( = ?auto_48083 ?auto_48082 ) ) ( not ( = ?auto_48082 ?auto_48088 ) ) ( IN-CITY ?auto_48087 ?auto_48086 ) ( IN-CITY ?auto_48080 ?auto_48086 ) ( not ( = ?auto_48080 ?auto_48087 ) ) ( OBJ-AT ?auto_48088 ?auto_48080 ) ( OBJ-AT ?auto_48082 ?auto_48087 ) ( not ( = ?auto_48081 ?auto_48088 ) ) ( OBJ-AT ?auto_48081 ?auto_48087 ) ( not ( = ?auto_48083 ?auto_48088 ) ) ( TRUCK-AT ?auto_48084 ?auto_48085 ) ( IN-CITY ?auto_48085 ?auto_48086 ) ( not ( = ?auto_48080 ?auto_48085 ) ) ( not ( = ?auto_48087 ?auto_48085 ) ) ( OBJ-AT ?auto_48083 ?auto_48085 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48088 ?auto_48082 ?auto_48080 )
      ( DELIVER-3PKG-VERIFY ?auto_48081 ?auto_48082 ?auto_48083 ?auto_48080 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_48120 - OBJ
      ?auto_48121 - OBJ
      ?auto_48122 - OBJ
      ?auto_48119 - LOCATION
    )
    :vars
    (
      ?auto_48127 - LOCATION
      ?auto_48126 - CITY
      ?auto_48125 - OBJ
      ?auto_48123 - TRUCK
      ?auto_48124 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48121 ?auto_48120 ) ) ( not ( = ?auto_48122 ?auto_48120 ) ) ( not ( = ?auto_48122 ?auto_48121 ) ) ( IN-CITY ?auto_48127 ?auto_48126 ) ( IN-CITY ?auto_48119 ?auto_48126 ) ( not ( = ?auto_48119 ?auto_48127 ) ) ( OBJ-AT ?auto_48121 ?auto_48119 ) ( OBJ-AT ?auto_48120 ?auto_48127 ) ( not ( = ?auto_48125 ?auto_48121 ) ) ( not ( = ?auto_48120 ?auto_48125 ) ) ( OBJ-AT ?auto_48125 ?auto_48127 ) ( not ( = ?auto_48125 ?auto_48122 ) ) ( TRUCK-AT ?auto_48123 ?auto_48124 ) ( IN-CITY ?auto_48124 ?auto_48126 ) ( not ( = ?auto_48119 ?auto_48124 ) ) ( not ( = ?auto_48127 ?auto_48124 ) ) ( OBJ-AT ?auto_48122 ?auto_48124 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48121 ?auto_48120 ?auto_48119 )
      ( DELIVER-3PKG-VERIFY ?auto_48120 ?auto_48121 ?auto_48122 ?auto_48119 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_48129 - OBJ
      ?auto_48130 - OBJ
      ?auto_48131 - OBJ
      ?auto_48128 - LOCATION
    )
    :vars
    (
      ?auto_48136 - LOCATION
      ?auto_48134 - CITY
      ?auto_48135 - OBJ
      ?auto_48132 - TRUCK
      ?auto_48133 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48130 ?auto_48129 ) ) ( not ( = ?auto_48131 ?auto_48129 ) ) ( not ( = ?auto_48131 ?auto_48130 ) ) ( IN-CITY ?auto_48136 ?auto_48134 ) ( IN-CITY ?auto_48128 ?auto_48134 ) ( not ( = ?auto_48128 ?auto_48136 ) ) ( OBJ-AT ?auto_48130 ?auto_48128 ) ( OBJ-AT ?auto_48129 ?auto_48136 ) ( OBJ-AT ?auto_48131 ?auto_48136 ) ( not ( = ?auto_48135 ?auto_48130 ) ) ( not ( = ?auto_48129 ?auto_48135 ) ) ( not ( = ?auto_48131 ?auto_48135 ) ) ( TRUCK-AT ?auto_48132 ?auto_48133 ) ( IN-CITY ?auto_48133 ?auto_48134 ) ( not ( = ?auto_48128 ?auto_48133 ) ) ( not ( = ?auto_48136 ?auto_48133 ) ) ( OBJ-AT ?auto_48135 ?auto_48133 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48130 ?auto_48129 ?auto_48128 )
      ( DELIVER-3PKG-VERIFY ?auto_48129 ?auto_48130 ?auto_48131 ?auto_48128 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_48148 - OBJ
      ?auto_48149 - OBJ
      ?auto_48150 - OBJ
      ?auto_48147 - LOCATION
    )
    :vars
    (
      ?auto_48155 - LOCATION
      ?auto_48154 - CITY
      ?auto_48153 - OBJ
      ?auto_48151 - TRUCK
      ?auto_48152 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48149 ?auto_48148 ) ) ( not ( = ?auto_48150 ?auto_48148 ) ) ( not ( = ?auto_48150 ?auto_48149 ) ) ( IN-CITY ?auto_48155 ?auto_48154 ) ( IN-CITY ?auto_48147 ?auto_48154 ) ( not ( = ?auto_48147 ?auto_48155 ) ) ( OBJ-AT ?auto_48150 ?auto_48147 ) ( OBJ-AT ?auto_48148 ?auto_48155 ) ( not ( = ?auto_48153 ?auto_48150 ) ) ( not ( = ?auto_48148 ?auto_48153 ) ) ( OBJ-AT ?auto_48153 ?auto_48155 ) ( not ( = ?auto_48153 ?auto_48149 ) ) ( TRUCK-AT ?auto_48151 ?auto_48152 ) ( IN-CITY ?auto_48152 ?auto_48154 ) ( not ( = ?auto_48147 ?auto_48152 ) ) ( not ( = ?auto_48155 ?auto_48152 ) ) ( OBJ-AT ?auto_48149 ?auto_48152 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48150 ?auto_48148 ?auto_48147 )
      ( DELIVER-3PKG-VERIFY ?auto_48148 ?auto_48149 ?auto_48150 ?auto_48147 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_48167 - OBJ
      ?auto_48168 - OBJ
      ?auto_48169 - OBJ
      ?auto_48166 - LOCATION
    )
    :vars
    (
      ?auto_48174 - OBJ
      ?auto_48173 - LOCATION
      ?auto_48172 - CITY
      ?auto_48170 - TRUCK
      ?auto_48171 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48168 ?auto_48167 ) ) ( not ( = ?auto_48169 ?auto_48167 ) ) ( not ( = ?auto_48169 ?auto_48168 ) ) ( not ( = ?auto_48167 ?auto_48174 ) ) ( IN-CITY ?auto_48173 ?auto_48172 ) ( IN-CITY ?auto_48166 ?auto_48172 ) ( not ( = ?auto_48166 ?auto_48173 ) ) ( OBJ-AT ?auto_48174 ?auto_48166 ) ( OBJ-AT ?auto_48167 ?auto_48173 ) ( not ( = ?auto_48169 ?auto_48174 ) ) ( OBJ-AT ?auto_48169 ?auto_48173 ) ( not ( = ?auto_48168 ?auto_48174 ) ) ( TRUCK-AT ?auto_48170 ?auto_48171 ) ( IN-CITY ?auto_48171 ?auto_48172 ) ( not ( = ?auto_48166 ?auto_48171 ) ) ( not ( = ?auto_48173 ?auto_48171 ) ) ( OBJ-AT ?auto_48168 ?auto_48171 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48174 ?auto_48167 ?auto_48166 )
      ( DELIVER-3PKG-VERIFY ?auto_48167 ?auto_48168 ?auto_48169 ?auto_48166 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_48186 - OBJ
      ?auto_48187 - OBJ
      ?auto_48188 - OBJ
      ?auto_48185 - LOCATION
    )
    :vars
    (
      ?auto_48193 - LOCATION
      ?auto_48191 - CITY
      ?auto_48192 - OBJ
      ?auto_48189 - TRUCK
      ?auto_48190 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48187 ?auto_48186 ) ) ( not ( = ?auto_48188 ?auto_48186 ) ) ( not ( = ?auto_48188 ?auto_48187 ) ) ( IN-CITY ?auto_48193 ?auto_48191 ) ( IN-CITY ?auto_48185 ?auto_48191 ) ( not ( = ?auto_48185 ?auto_48193 ) ) ( OBJ-AT ?auto_48188 ?auto_48185 ) ( OBJ-AT ?auto_48186 ?auto_48193 ) ( OBJ-AT ?auto_48187 ?auto_48193 ) ( not ( = ?auto_48192 ?auto_48188 ) ) ( not ( = ?auto_48186 ?auto_48192 ) ) ( not ( = ?auto_48187 ?auto_48192 ) ) ( TRUCK-AT ?auto_48189 ?auto_48190 ) ( IN-CITY ?auto_48190 ?auto_48191 ) ( not ( = ?auto_48185 ?auto_48190 ) ) ( not ( = ?auto_48193 ?auto_48190 ) ) ( OBJ-AT ?auto_48192 ?auto_48190 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48188 ?auto_48186 ?auto_48185 )
      ( DELIVER-3PKG-VERIFY ?auto_48186 ?auto_48187 ?auto_48188 ?auto_48185 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_48195 - OBJ
      ?auto_48196 - OBJ
      ?auto_48197 - OBJ
      ?auto_48194 - LOCATION
    )
    :vars
    (
      ?auto_48202 - OBJ
      ?auto_48201 - LOCATION
      ?auto_48200 - CITY
      ?auto_48198 - TRUCK
      ?auto_48199 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48196 ?auto_48195 ) ) ( not ( = ?auto_48197 ?auto_48195 ) ) ( not ( = ?auto_48197 ?auto_48196 ) ) ( not ( = ?auto_48195 ?auto_48202 ) ) ( IN-CITY ?auto_48201 ?auto_48200 ) ( IN-CITY ?auto_48194 ?auto_48200 ) ( not ( = ?auto_48194 ?auto_48201 ) ) ( OBJ-AT ?auto_48202 ?auto_48194 ) ( OBJ-AT ?auto_48195 ?auto_48201 ) ( not ( = ?auto_48196 ?auto_48202 ) ) ( OBJ-AT ?auto_48196 ?auto_48201 ) ( not ( = ?auto_48197 ?auto_48202 ) ) ( TRUCK-AT ?auto_48198 ?auto_48199 ) ( IN-CITY ?auto_48199 ?auto_48200 ) ( not ( = ?auto_48194 ?auto_48199 ) ) ( not ( = ?auto_48201 ?auto_48199 ) ) ( OBJ-AT ?auto_48197 ?auto_48199 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48202 ?auto_48195 ?auto_48194 )
      ( DELIVER-3PKG-VERIFY ?auto_48195 ?auto_48196 ?auto_48197 ?auto_48194 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_48358 - OBJ
      ?auto_48359 - OBJ
      ?auto_48360 - OBJ
      ?auto_48361 - OBJ
      ?auto_48357 - LOCATION
    )
    :vars
    (
      ?auto_48365 - LOCATION
      ?auto_48364 - CITY
      ?auto_48362 - TRUCK
      ?auto_48363 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48359 ?auto_48358 ) ) ( not ( = ?auto_48360 ?auto_48358 ) ) ( not ( = ?auto_48360 ?auto_48359 ) ) ( not ( = ?auto_48361 ?auto_48358 ) ) ( not ( = ?auto_48361 ?auto_48359 ) ) ( not ( = ?auto_48361 ?auto_48360 ) ) ( IN-CITY ?auto_48365 ?auto_48364 ) ( IN-CITY ?auto_48357 ?auto_48364 ) ( not ( = ?auto_48357 ?auto_48365 ) ) ( OBJ-AT ?auto_48358 ?auto_48357 ) ( OBJ-AT ?auto_48361 ?auto_48365 ) ( OBJ-AT ?auto_48360 ?auto_48365 ) ( TRUCK-AT ?auto_48362 ?auto_48363 ) ( IN-CITY ?auto_48363 ?auto_48364 ) ( not ( = ?auto_48357 ?auto_48363 ) ) ( not ( = ?auto_48365 ?auto_48363 ) ) ( OBJ-AT ?auto_48359 ?auto_48363 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48358 ?auto_48361 ?auto_48357 )
      ( DELIVER-4PKG-VERIFY ?auto_48358 ?auto_48359 ?auto_48360 ?auto_48361 ?auto_48357 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_48387 - OBJ
      ?auto_48388 - OBJ
      ?auto_48389 - OBJ
      ?auto_48390 - OBJ
      ?auto_48386 - LOCATION
    )
    :vars
    (
      ?auto_48394 - LOCATION
      ?auto_48393 - CITY
      ?auto_48391 - TRUCK
      ?auto_48392 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48388 ?auto_48387 ) ) ( not ( = ?auto_48389 ?auto_48387 ) ) ( not ( = ?auto_48389 ?auto_48388 ) ) ( not ( = ?auto_48390 ?auto_48387 ) ) ( not ( = ?auto_48390 ?auto_48388 ) ) ( not ( = ?auto_48390 ?auto_48389 ) ) ( IN-CITY ?auto_48394 ?auto_48393 ) ( IN-CITY ?auto_48386 ?auto_48393 ) ( not ( = ?auto_48386 ?auto_48394 ) ) ( OBJ-AT ?auto_48387 ?auto_48386 ) ( OBJ-AT ?auto_48389 ?auto_48394 ) ( OBJ-AT ?auto_48390 ?auto_48394 ) ( TRUCK-AT ?auto_48391 ?auto_48392 ) ( IN-CITY ?auto_48392 ?auto_48393 ) ( not ( = ?auto_48386 ?auto_48392 ) ) ( not ( = ?auto_48394 ?auto_48392 ) ) ( OBJ-AT ?auto_48388 ?auto_48392 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48387 ?auto_48389 ?auto_48386 )
      ( DELIVER-4PKG-VERIFY ?auto_48387 ?auto_48388 ?auto_48389 ?auto_48390 ?auto_48386 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_48416 - OBJ
      ?auto_48417 - OBJ
      ?auto_48418 - OBJ
      ?auto_48419 - OBJ
      ?auto_48415 - LOCATION
    )
    :vars
    (
      ?auto_48423 - LOCATION
      ?auto_48422 - CITY
      ?auto_48420 - TRUCK
      ?auto_48421 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48417 ?auto_48416 ) ) ( not ( = ?auto_48418 ?auto_48416 ) ) ( not ( = ?auto_48418 ?auto_48417 ) ) ( not ( = ?auto_48419 ?auto_48416 ) ) ( not ( = ?auto_48419 ?auto_48417 ) ) ( not ( = ?auto_48419 ?auto_48418 ) ) ( IN-CITY ?auto_48423 ?auto_48422 ) ( IN-CITY ?auto_48415 ?auto_48422 ) ( not ( = ?auto_48415 ?auto_48423 ) ) ( OBJ-AT ?auto_48416 ?auto_48415 ) ( OBJ-AT ?auto_48419 ?auto_48423 ) ( OBJ-AT ?auto_48417 ?auto_48423 ) ( TRUCK-AT ?auto_48420 ?auto_48421 ) ( IN-CITY ?auto_48421 ?auto_48422 ) ( not ( = ?auto_48415 ?auto_48421 ) ) ( not ( = ?auto_48423 ?auto_48421 ) ) ( OBJ-AT ?auto_48418 ?auto_48421 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48416 ?auto_48419 ?auto_48415 )
      ( DELIVER-4PKG-VERIFY ?auto_48416 ?auto_48417 ?auto_48418 ?auto_48419 ?auto_48415 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_48445 - OBJ
      ?auto_48446 - OBJ
      ?auto_48447 - OBJ
      ?auto_48448 - OBJ
      ?auto_48444 - LOCATION
    )
    :vars
    (
      ?auto_48452 - LOCATION
      ?auto_48451 - CITY
      ?auto_48449 - TRUCK
      ?auto_48450 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48446 ?auto_48445 ) ) ( not ( = ?auto_48447 ?auto_48445 ) ) ( not ( = ?auto_48447 ?auto_48446 ) ) ( not ( = ?auto_48448 ?auto_48445 ) ) ( not ( = ?auto_48448 ?auto_48446 ) ) ( not ( = ?auto_48448 ?auto_48447 ) ) ( IN-CITY ?auto_48452 ?auto_48451 ) ( IN-CITY ?auto_48444 ?auto_48451 ) ( not ( = ?auto_48444 ?auto_48452 ) ) ( OBJ-AT ?auto_48445 ?auto_48444 ) ( OBJ-AT ?auto_48447 ?auto_48452 ) ( OBJ-AT ?auto_48446 ?auto_48452 ) ( TRUCK-AT ?auto_48449 ?auto_48450 ) ( IN-CITY ?auto_48450 ?auto_48451 ) ( not ( = ?auto_48444 ?auto_48450 ) ) ( not ( = ?auto_48452 ?auto_48450 ) ) ( OBJ-AT ?auto_48448 ?auto_48450 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48445 ?auto_48447 ?auto_48444 )
      ( DELIVER-4PKG-VERIFY ?auto_48445 ?auto_48446 ?auto_48447 ?auto_48448 ?auto_48444 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_48536 - OBJ
      ?auto_48537 - OBJ
      ?auto_48538 - OBJ
      ?auto_48539 - OBJ
      ?auto_48535 - LOCATION
    )
    :vars
    (
      ?auto_48543 - LOCATION
      ?auto_48542 - CITY
      ?auto_48540 - TRUCK
      ?auto_48541 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48537 ?auto_48536 ) ) ( not ( = ?auto_48538 ?auto_48536 ) ) ( not ( = ?auto_48538 ?auto_48537 ) ) ( not ( = ?auto_48539 ?auto_48536 ) ) ( not ( = ?auto_48539 ?auto_48537 ) ) ( not ( = ?auto_48539 ?auto_48538 ) ) ( IN-CITY ?auto_48543 ?auto_48542 ) ( IN-CITY ?auto_48535 ?auto_48542 ) ( not ( = ?auto_48535 ?auto_48543 ) ) ( OBJ-AT ?auto_48536 ?auto_48535 ) ( OBJ-AT ?auto_48537 ?auto_48543 ) ( OBJ-AT ?auto_48539 ?auto_48543 ) ( TRUCK-AT ?auto_48540 ?auto_48541 ) ( IN-CITY ?auto_48541 ?auto_48542 ) ( not ( = ?auto_48535 ?auto_48541 ) ) ( not ( = ?auto_48543 ?auto_48541 ) ) ( OBJ-AT ?auto_48538 ?auto_48541 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48536 ?auto_48537 ?auto_48535 )
      ( DELIVER-4PKG-VERIFY ?auto_48536 ?auto_48537 ?auto_48538 ?auto_48539 ?auto_48535 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_48565 - OBJ
      ?auto_48566 - OBJ
      ?auto_48567 - OBJ
      ?auto_48568 - OBJ
      ?auto_48564 - LOCATION
    )
    :vars
    (
      ?auto_48572 - LOCATION
      ?auto_48571 - CITY
      ?auto_48569 - TRUCK
      ?auto_48570 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48566 ?auto_48565 ) ) ( not ( = ?auto_48567 ?auto_48565 ) ) ( not ( = ?auto_48567 ?auto_48566 ) ) ( not ( = ?auto_48568 ?auto_48565 ) ) ( not ( = ?auto_48568 ?auto_48566 ) ) ( not ( = ?auto_48568 ?auto_48567 ) ) ( IN-CITY ?auto_48572 ?auto_48571 ) ( IN-CITY ?auto_48564 ?auto_48571 ) ( not ( = ?auto_48564 ?auto_48572 ) ) ( OBJ-AT ?auto_48565 ?auto_48564 ) ( OBJ-AT ?auto_48566 ?auto_48572 ) ( OBJ-AT ?auto_48567 ?auto_48572 ) ( TRUCK-AT ?auto_48569 ?auto_48570 ) ( IN-CITY ?auto_48570 ?auto_48571 ) ( not ( = ?auto_48564 ?auto_48570 ) ) ( not ( = ?auto_48572 ?auto_48570 ) ) ( OBJ-AT ?auto_48568 ?auto_48570 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48565 ?auto_48566 ?auto_48564 )
      ( DELIVER-4PKG-VERIFY ?auto_48565 ?auto_48566 ?auto_48567 ?auto_48568 ?auto_48564 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_48656 - OBJ
      ?auto_48657 - OBJ
      ?auto_48658 - OBJ
      ?auto_48659 - OBJ
      ?auto_48655 - LOCATION
    )
    :vars
    (
      ?auto_48663 - LOCATION
      ?auto_48662 - CITY
      ?auto_48660 - TRUCK
      ?auto_48661 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48657 ?auto_48656 ) ) ( not ( = ?auto_48658 ?auto_48656 ) ) ( not ( = ?auto_48658 ?auto_48657 ) ) ( not ( = ?auto_48659 ?auto_48656 ) ) ( not ( = ?auto_48659 ?auto_48657 ) ) ( not ( = ?auto_48659 ?auto_48658 ) ) ( IN-CITY ?auto_48663 ?auto_48662 ) ( IN-CITY ?auto_48655 ?auto_48662 ) ( not ( = ?auto_48655 ?auto_48663 ) ) ( OBJ-AT ?auto_48657 ?auto_48655 ) ( OBJ-AT ?auto_48659 ?auto_48663 ) ( OBJ-AT ?auto_48658 ?auto_48663 ) ( TRUCK-AT ?auto_48660 ?auto_48661 ) ( IN-CITY ?auto_48661 ?auto_48662 ) ( not ( = ?auto_48655 ?auto_48661 ) ) ( not ( = ?auto_48663 ?auto_48661 ) ) ( OBJ-AT ?auto_48656 ?auto_48661 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48657 ?auto_48659 ?auto_48655 )
      ( DELIVER-4PKG-VERIFY ?auto_48656 ?auto_48657 ?auto_48658 ?auto_48659 ?auto_48655 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_48685 - OBJ
      ?auto_48686 - OBJ
      ?auto_48687 - OBJ
      ?auto_48688 - OBJ
      ?auto_48684 - LOCATION
    )
    :vars
    (
      ?auto_48692 - LOCATION
      ?auto_48691 - CITY
      ?auto_48689 - TRUCK
      ?auto_48690 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48686 ?auto_48685 ) ) ( not ( = ?auto_48687 ?auto_48685 ) ) ( not ( = ?auto_48687 ?auto_48686 ) ) ( not ( = ?auto_48688 ?auto_48685 ) ) ( not ( = ?auto_48688 ?auto_48686 ) ) ( not ( = ?auto_48688 ?auto_48687 ) ) ( IN-CITY ?auto_48692 ?auto_48691 ) ( IN-CITY ?auto_48684 ?auto_48691 ) ( not ( = ?auto_48684 ?auto_48692 ) ) ( OBJ-AT ?auto_48686 ?auto_48684 ) ( OBJ-AT ?auto_48687 ?auto_48692 ) ( OBJ-AT ?auto_48688 ?auto_48692 ) ( TRUCK-AT ?auto_48689 ?auto_48690 ) ( IN-CITY ?auto_48690 ?auto_48691 ) ( not ( = ?auto_48684 ?auto_48690 ) ) ( not ( = ?auto_48692 ?auto_48690 ) ) ( OBJ-AT ?auto_48685 ?auto_48690 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48686 ?auto_48687 ?auto_48684 )
      ( DELIVER-4PKG-VERIFY ?auto_48685 ?auto_48686 ?auto_48687 ?auto_48688 ?auto_48684 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_48777 - OBJ
      ?auto_48778 - OBJ
      ?auto_48779 - OBJ
      ?auto_48780 - OBJ
      ?auto_48776 - LOCATION
    )
    :vars
    (
      ?auto_48784 - LOCATION
      ?auto_48783 - CITY
      ?auto_48781 - TRUCK
      ?auto_48782 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48778 ?auto_48777 ) ) ( not ( = ?auto_48779 ?auto_48777 ) ) ( not ( = ?auto_48779 ?auto_48778 ) ) ( not ( = ?auto_48780 ?auto_48777 ) ) ( not ( = ?auto_48780 ?auto_48778 ) ) ( not ( = ?auto_48780 ?auto_48779 ) ) ( IN-CITY ?auto_48784 ?auto_48783 ) ( IN-CITY ?auto_48776 ?auto_48783 ) ( not ( = ?auto_48776 ?auto_48784 ) ) ( OBJ-AT ?auto_48779 ?auto_48776 ) ( OBJ-AT ?auto_48780 ?auto_48784 ) ( OBJ-AT ?auto_48778 ?auto_48784 ) ( TRUCK-AT ?auto_48781 ?auto_48782 ) ( IN-CITY ?auto_48782 ?auto_48783 ) ( not ( = ?auto_48776 ?auto_48782 ) ) ( not ( = ?auto_48784 ?auto_48782 ) ) ( OBJ-AT ?auto_48777 ?auto_48782 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48779 ?auto_48780 ?auto_48776 )
      ( DELIVER-4PKG-VERIFY ?auto_48777 ?auto_48778 ?auto_48779 ?auto_48780 ?auto_48776 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_48806 - OBJ
      ?auto_48807 - OBJ
      ?auto_48808 - OBJ
      ?auto_48809 - OBJ
      ?auto_48805 - LOCATION
    )
    :vars
    (
      ?auto_48813 - LOCATION
      ?auto_48812 - CITY
      ?auto_48810 - TRUCK
      ?auto_48811 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48807 ?auto_48806 ) ) ( not ( = ?auto_48808 ?auto_48806 ) ) ( not ( = ?auto_48808 ?auto_48807 ) ) ( not ( = ?auto_48809 ?auto_48806 ) ) ( not ( = ?auto_48809 ?auto_48807 ) ) ( not ( = ?auto_48809 ?auto_48808 ) ) ( IN-CITY ?auto_48813 ?auto_48812 ) ( IN-CITY ?auto_48805 ?auto_48812 ) ( not ( = ?auto_48805 ?auto_48813 ) ) ( OBJ-AT ?auto_48809 ?auto_48805 ) ( OBJ-AT ?auto_48808 ?auto_48813 ) ( OBJ-AT ?auto_48807 ?auto_48813 ) ( TRUCK-AT ?auto_48810 ?auto_48811 ) ( IN-CITY ?auto_48811 ?auto_48812 ) ( not ( = ?auto_48805 ?auto_48811 ) ) ( not ( = ?auto_48813 ?auto_48811 ) ) ( OBJ-AT ?auto_48806 ?auto_48811 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48809 ?auto_48808 ?auto_48805 )
      ( DELIVER-4PKG-VERIFY ?auto_48806 ?auto_48807 ?auto_48808 ?auto_48809 ?auto_48805 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_48865 - OBJ
      ?auto_48866 - OBJ
      ?auto_48867 - OBJ
      ?auto_48868 - OBJ
      ?auto_48864 - LOCATION
    )
    :vars
    (
      ?auto_48872 - LOCATION
      ?auto_48871 - CITY
      ?auto_48869 - TRUCK
      ?auto_48870 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48866 ?auto_48865 ) ) ( not ( = ?auto_48867 ?auto_48865 ) ) ( not ( = ?auto_48867 ?auto_48866 ) ) ( not ( = ?auto_48868 ?auto_48865 ) ) ( not ( = ?auto_48868 ?auto_48866 ) ) ( not ( = ?auto_48868 ?auto_48867 ) ) ( IN-CITY ?auto_48872 ?auto_48871 ) ( IN-CITY ?auto_48864 ?auto_48871 ) ( not ( = ?auto_48864 ?auto_48872 ) ) ( OBJ-AT ?auto_48867 ?auto_48864 ) ( OBJ-AT ?auto_48866 ?auto_48872 ) ( OBJ-AT ?auto_48868 ?auto_48872 ) ( TRUCK-AT ?auto_48869 ?auto_48870 ) ( IN-CITY ?auto_48870 ?auto_48871 ) ( not ( = ?auto_48864 ?auto_48870 ) ) ( not ( = ?auto_48872 ?auto_48870 ) ) ( OBJ-AT ?auto_48865 ?auto_48870 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48867 ?auto_48866 ?auto_48864 )
      ( DELIVER-4PKG-VERIFY ?auto_48865 ?auto_48866 ?auto_48867 ?auto_48868 ?auto_48864 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_48926 - OBJ
      ?auto_48927 - OBJ
      ?auto_48928 - OBJ
      ?auto_48929 - OBJ
      ?auto_48925 - LOCATION
    )
    :vars
    (
      ?auto_48933 - LOCATION
      ?auto_48932 - CITY
      ?auto_48930 - TRUCK
      ?auto_48931 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_48927 ?auto_48926 ) ) ( not ( = ?auto_48928 ?auto_48926 ) ) ( not ( = ?auto_48928 ?auto_48927 ) ) ( not ( = ?auto_48929 ?auto_48926 ) ) ( not ( = ?auto_48929 ?auto_48927 ) ) ( not ( = ?auto_48929 ?auto_48928 ) ) ( IN-CITY ?auto_48933 ?auto_48932 ) ( IN-CITY ?auto_48925 ?auto_48932 ) ( not ( = ?auto_48925 ?auto_48933 ) ) ( OBJ-AT ?auto_48929 ?auto_48925 ) ( OBJ-AT ?auto_48927 ?auto_48933 ) ( OBJ-AT ?auto_48928 ?auto_48933 ) ( TRUCK-AT ?auto_48930 ?auto_48931 ) ( IN-CITY ?auto_48931 ?auto_48932 ) ( not ( = ?auto_48925 ?auto_48931 ) ) ( not ( = ?auto_48933 ?auto_48931 ) ) ( OBJ-AT ?auto_48926 ?auto_48931 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48929 ?auto_48927 ?auto_48925 )
      ( DELIVER-4PKG-VERIFY ?auto_48926 ?auto_48927 ?auto_48928 ?auto_48929 ?auto_48925 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_49017 - OBJ
      ?auto_49018 - OBJ
      ?auto_49019 - OBJ
      ?auto_49020 - OBJ
      ?auto_49016 - LOCATION
    )
    :vars
    (
      ?auto_49024 - LOCATION
      ?auto_49023 - CITY
      ?auto_49021 - TRUCK
      ?auto_49022 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_49018 ?auto_49017 ) ) ( not ( = ?auto_49019 ?auto_49017 ) ) ( not ( = ?auto_49019 ?auto_49018 ) ) ( not ( = ?auto_49020 ?auto_49017 ) ) ( not ( = ?auto_49020 ?auto_49018 ) ) ( not ( = ?auto_49020 ?auto_49019 ) ) ( IN-CITY ?auto_49024 ?auto_49023 ) ( IN-CITY ?auto_49016 ?auto_49023 ) ( not ( = ?auto_49016 ?auto_49024 ) ) ( OBJ-AT ?auto_49018 ?auto_49016 ) ( OBJ-AT ?auto_49020 ?auto_49024 ) ( OBJ-AT ?auto_49017 ?auto_49024 ) ( TRUCK-AT ?auto_49021 ?auto_49022 ) ( IN-CITY ?auto_49022 ?auto_49023 ) ( not ( = ?auto_49016 ?auto_49022 ) ) ( not ( = ?auto_49024 ?auto_49022 ) ) ( OBJ-AT ?auto_49019 ?auto_49022 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_49018 ?auto_49020 ?auto_49016 )
      ( DELIVER-4PKG-VERIFY ?auto_49017 ?auto_49018 ?auto_49019 ?auto_49020 ?auto_49016 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_49046 - OBJ
      ?auto_49047 - OBJ
      ?auto_49048 - OBJ
      ?auto_49049 - OBJ
      ?auto_49045 - LOCATION
    )
    :vars
    (
      ?auto_49053 - LOCATION
      ?auto_49052 - CITY
      ?auto_49050 - TRUCK
      ?auto_49051 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_49047 ?auto_49046 ) ) ( not ( = ?auto_49048 ?auto_49046 ) ) ( not ( = ?auto_49048 ?auto_49047 ) ) ( not ( = ?auto_49049 ?auto_49046 ) ) ( not ( = ?auto_49049 ?auto_49047 ) ) ( not ( = ?auto_49049 ?auto_49048 ) ) ( IN-CITY ?auto_49053 ?auto_49052 ) ( IN-CITY ?auto_49045 ?auto_49052 ) ( not ( = ?auto_49045 ?auto_49053 ) ) ( OBJ-AT ?auto_49047 ?auto_49045 ) ( OBJ-AT ?auto_49048 ?auto_49053 ) ( OBJ-AT ?auto_49046 ?auto_49053 ) ( TRUCK-AT ?auto_49050 ?auto_49051 ) ( IN-CITY ?auto_49051 ?auto_49052 ) ( not ( = ?auto_49045 ?auto_49051 ) ) ( not ( = ?auto_49053 ?auto_49051 ) ) ( OBJ-AT ?auto_49049 ?auto_49051 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_49047 ?auto_49048 ?auto_49045 )
      ( DELIVER-4PKG-VERIFY ?auto_49046 ?auto_49047 ?auto_49048 ?auto_49049 ?auto_49045 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_49075 - OBJ
      ?auto_49076 - OBJ
      ?auto_49077 - OBJ
      ?auto_49078 - OBJ
      ?auto_49074 - LOCATION
    )
    :vars
    (
      ?auto_49082 - LOCATION
      ?auto_49081 - CITY
      ?auto_49079 - TRUCK
      ?auto_49080 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_49076 ?auto_49075 ) ) ( not ( = ?auto_49077 ?auto_49075 ) ) ( not ( = ?auto_49077 ?auto_49076 ) ) ( not ( = ?auto_49078 ?auto_49075 ) ) ( not ( = ?auto_49078 ?auto_49076 ) ) ( not ( = ?auto_49078 ?auto_49077 ) ) ( IN-CITY ?auto_49082 ?auto_49081 ) ( IN-CITY ?auto_49074 ?auto_49081 ) ( not ( = ?auto_49074 ?auto_49082 ) ) ( OBJ-AT ?auto_49077 ?auto_49074 ) ( OBJ-AT ?auto_49078 ?auto_49082 ) ( OBJ-AT ?auto_49075 ?auto_49082 ) ( TRUCK-AT ?auto_49079 ?auto_49080 ) ( IN-CITY ?auto_49080 ?auto_49081 ) ( not ( = ?auto_49074 ?auto_49080 ) ) ( not ( = ?auto_49082 ?auto_49080 ) ) ( OBJ-AT ?auto_49076 ?auto_49080 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_49077 ?auto_49078 ?auto_49074 )
      ( DELIVER-4PKG-VERIFY ?auto_49075 ?auto_49076 ?auto_49077 ?auto_49078 ?auto_49074 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_49104 - OBJ
      ?auto_49105 - OBJ
      ?auto_49106 - OBJ
      ?auto_49107 - OBJ
      ?auto_49103 - LOCATION
    )
    :vars
    (
      ?auto_49111 - LOCATION
      ?auto_49110 - CITY
      ?auto_49108 - TRUCK
      ?auto_49109 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_49105 ?auto_49104 ) ) ( not ( = ?auto_49106 ?auto_49104 ) ) ( not ( = ?auto_49106 ?auto_49105 ) ) ( not ( = ?auto_49107 ?auto_49104 ) ) ( not ( = ?auto_49107 ?auto_49105 ) ) ( not ( = ?auto_49107 ?auto_49106 ) ) ( IN-CITY ?auto_49111 ?auto_49110 ) ( IN-CITY ?auto_49103 ?auto_49110 ) ( not ( = ?auto_49103 ?auto_49111 ) ) ( OBJ-AT ?auto_49107 ?auto_49103 ) ( OBJ-AT ?auto_49106 ?auto_49111 ) ( OBJ-AT ?auto_49104 ?auto_49111 ) ( TRUCK-AT ?auto_49108 ?auto_49109 ) ( IN-CITY ?auto_49109 ?auto_49110 ) ( not ( = ?auto_49103 ?auto_49109 ) ) ( not ( = ?auto_49111 ?auto_49109 ) ) ( OBJ-AT ?auto_49105 ?auto_49109 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_49107 ?auto_49106 ?auto_49103 )
      ( DELIVER-4PKG-VERIFY ?auto_49104 ?auto_49105 ?auto_49106 ?auto_49107 ?auto_49103 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_49226 - OBJ
      ?auto_49227 - OBJ
      ?auto_49228 - OBJ
      ?auto_49229 - OBJ
      ?auto_49225 - LOCATION
    )
    :vars
    (
      ?auto_49233 - LOCATION
      ?auto_49232 - CITY
      ?auto_49230 - TRUCK
      ?auto_49231 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_49227 ?auto_49226 ) ) ( not ( = ?auto_49228 ?auto_49226 ) ) ( not ( = ?auto_49228 ?auto_49227 ) ) ( not ( = ?auto_49229 ?auto_49226 ) ) ( not ( = ?auto_49229 ?auto_49227 ) ) ( not ( = ?auto_49229 ?auto_49228 ) ) ( IN-CITY ?auto_49233 ?auto_49232 ) ( IN-CITY ?auto_49225 ?auto_49232 ) ( not ( = ?auto_49225 ?auto_49233 ) ) ( OBJ-AT ?auto_49228 ?auto_49225 ) ( OBJ-AT ?auto_49227 ?auto_49233 ) ( OBJ-AT ?auto_49226 ?auto_49233 ) ( TRUCK-AT ?auto_49230 ?auto_49231 ) ( IN-CITY ?auto_49231 ?auto_49232 ) ( not ( = ?auto_49225 ?auto_49231 ) ) ( not ( = ?auto_49233 ?auto_49231 ) ) ( OBJ-AT ?auto_49229 ?auto_49231 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_49228 ?auto_49227 ?auto_49225 )
      ( DELIVER-4PKG-VERIFY ?auto_49226 ?auto_49227 ?auto_49228 ?auto_49229 ?auto_49225 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_49255 - OBJ
      ?auto_49256 - OBJ
      ?auto_49257 - OBJ
      ?auto_49258 - OBJ
      ?auto_49254 - LOCATION
    )
    :vars
    (
      ?auto_49262 - LOCATION
      ?auto_49261 - CITY
      ?auto_49259 - TRUCK
      ?auto_49260 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_49256 ?auto_49255 ) ) ( not ( = ?auto_49257 ?auto_49255 ) ) ( not ( = ?auto_49257 ?auto_49256 ) ) ( not ( = ?auto_49258 ?auto_49255 ) ) ( not ( = ?auto_49258 ?auto_49256 ) ) ( not ( = ?auto_49258 ?auto_49257 ) ) ( IN-CITY ?auto_49262 ?auto_49261 ) ( IN-CITY ?auto_49254 ?auto_49261 ) ( not ( = ?auto_49254 ?auto_49262 ) ) ( OBJ-AT ?auto_49258 ?auto_49254 ) ( OBJ-AT ?auto_49256 ?auto_49262 ) ( OBJ-AT ?auto_49255 ?auto_49262 ) ( TRUCK-AT ?auto_49259 ?auto_49260 ) ( IN-CITY ?auto_49260 ?auto_49261 ) ( not ( = ?auto_49254 ?auto_49260 ) ) ( not ( = ?auto_49262 ?auto_49260 ) ) ( OBJ-AT ?auto_49257 ?auto_49260 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_49258 ?auto_49256 ?auto_49254 )
      ( DELIVER-4PKG-VERIFY ?auto_49255 ?auto_49256 ?auto_49257 ?auto_49258 ?auto_49254 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_49440 - OBJ
      ?auto_49441 - OBJ
      ?auto_49442 - OBJ
      ?auto_49443 - OBJ
      ?auto_49439 - LOCATION
    )
    :vars
    (
      ?auto_49447 - LOCATION
      ?auto_49446 - CITY
      ?auto_49444 - TRUCK
      ?auto_49445 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_49441 ?auto_49440 ) ) ( not ( = ?auto_49442 ?auto_49440 ) ) ( not ( = ?auto_49442 ?auto_49441 ) ) ( not ( = ?auto_49443 ?auto_49440 ) ) ( not ( = ?auto_49443 ?auto_49441 ) ) ( not ( = ?auto_49443 ?auto_49442 ) ) ( IN-CITY ?auto_49447 ?auto_49446 ) ( IN-CITY ?auto_49439 ?auto_49446 ) ( not ( = ?auto_49439 ?auto_49447 ) ) ( OBJ-AT ?auto_49441 ?auto_49439 ) ( OBJ-AT ?auto_49440 ?auto_49447 ) ( OBJ-AT ?auto_49443 ?auto_49447 ) ( TRUCK-AT ?auto_49444 ?auto_49445 ) ( IN-CITY ?auto_49445 ?auto_49446 ) ( not ( = ?auto_49439 ?auto_49445 ) ) ( not ( = ?auto_49447 ?auto_49445 ) ) ( OBJ-AT ?auto_49442 ?auto_49445 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_49441 ?auto_49440 ?auto_49439 )
      ( DELIVER-4PKG-VERIFY ?auto_49440 ?auto_49441 ?auto_49442 ?auto_49443 ?auto_49439 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_49469 - OBJ
      ?auto_49470 - OBJ
      ?auto_49471 - OBJ
      ?auto_49472 - OBJ
      ?auto_49468 - LOCATION
    )
    :vars
    (
      ?auto_49476 - LOCATION
      ?auto_49475 - CITY
      ?auto_49473 - TRUCK
      ?auto_49474 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_49470 ?auto_49469 ) ) ( not ( = ?auto_49471 ?auto_49469 ) ) ( not ( = ?auto_49471 ?auto_49470 ) ) ( not ( = ?auto_49472 ?auto_49469 ) ) ( not ( = ?auto_49472 ?auto_49470 ) ) ( not ( = ?auto_49472 ?auto_49471 ) ) ( IN-CITY ?auto_49476 ?auto_49475 ) ( IN-CITY ?auto_49468 ?auto_49475 ) ( not ( = ?auto_49468 ?auto_49476 ) ) ( OBJ-AT ?auto_49470 ?auto_49468 ) ( OBJ-AT ?auto_49469 ?auto_49476 ) ( OBJ-AT ?auto_49471 ?auto_49476 ) ( TRUCK-AT ?auto_49473 ?auto_49474 ) ( IN-CITY ?auto_49474 ?auto_49475 ) ( not ( = ?auto_49468 ?auto_49474 ) ) ( not ( = ?auto_49476 ?auto_49474 ) ) ( OBJ-AT ?auto_49472 ?auto_49474 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_49470 ?auto_49469 ?auto_49468 )
      ( DELIVER-4PKG-VERIFY ?auto_49469 ?auto_49470 ?auto_49471 ?auto_49472 ?auto_49468 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_49560 - OBJ
      ?auto_49561 - OBJ
      ?auto_49562 - OBJ
      ?auto_49563 - OBJ
      ?auto_49559 - LOCATION
    )
    :vars
    (
      ?auto_49567 - LOCATION
      ?auto_49566 - CITY
      ?auto_49564 - TRUCK
      ?auto_49565 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_49561 ?auto_49560 ) ) ( not ( = ?auto_49562 ?auto_49560 ) ) ( not ( = ?auto_49562 ?auto_49561 ) ) ( not ( = ?auto_49563 ?auto_49560 ) ) ( not ( = ?auto_49563 ?auto_49561 ) ) ( not ( = ?auto_49563 ?auto_49562 ) ) ( IN-CITY ?auto_49567 ?auto_49566 ) ( IN-CITY ?auto_49559 ?auto_49566 ) ( not ( = ?auto_49559 ?auto_49567 ) ) ( OBJ-AT ?auto_49562 ?auto_49559 ) ( OBJ-AT ?auto_49560 ?auto_49567 ) ( OBJ-AT ?auto_49563 ?auto_49567 ) ( TRUCK-AT ?auto_49564 ?auto_49565 ) ( IN-CITY ?auto_49565 ?auto_49566 ) ( not ( = ?auto_49559 ?auto_49565 ) ) ( not ( = ?auto_49567 ?auto_49565 ) ) ( OBJ-AT ?auto_49561 ?auto_49565 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_49562 ?auto_49560 ?auto_49559 )
      ( DELIVER-4PKG-VERIFY ?auto_49560 ?auto_49561 ?auto_49562 ?auto_49563 ?auto_49559 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_49621 - OBJ
      ?auto_49622 - OBJ
      ?auto_49623 - OBJ
      ?auto_49624 - OBJ
      ?auto_49620 - LOCATION
    )
    :vars
    (
      ?auto_49628 - LOCATION
      ?auto_49627 - CITY
      ?auto_49625 - TRUCK
      ?auto_49626 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_49622 ?auto_49621 ) ) ( not ( = ?auto_49623 ?auto_49621 ) ) ( not ( = ?auto_49623 ?auto_49622 ) ) ( not ( = ?auto_49624 ?auto_49621 ) ) ( not ( = ?auto_49624 ?auto_49622 ) ) ( not ( = ?auto_49624 ?auto_49623 ) ) ( IN-CITY ?auto_49628 ?auto_49627 ) ( IN-CITY ?auto_49620 ?auto_49627 ) ( not ( = ?auto_49620 ?auto_49628 ) ) ( OBJ-AT ?auto_49624 ?auto_49620 ) ( OBJ-AT ?auto_49621 ?auto_49628 ) ( OBJ-AT ?auto_49623 ?auto_49628 ) ( TRUCK-AT ?auto_49625 ?auto_49626 ) ( IN-CITY ?auto_49626 ?auto_49627 ) ( not ( = ?auto_49620 ?auto_49626 ) ) ( not ( = ?auto_49628 ?auto_49626 ) ) ( OBJ-AT ?auto_49622 ?auto_49626 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_49624 ?auto_49621 ?auto_49620 )
      ( DELIVER-4PKG-VERIFY ?auto_49621 ?auto_49622 ?auto_49623 ?auto_49624 ?auto_49620 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_49712 - OBJ
      ?auto_49713 - OBJ
      ?auto_49714 - OBJ
      ?auto_49715 - OBJ
      ?auto_49711 - LOCATION
    )
    :vars
    (
      ?auto_49719 - LOCATION
      ?auto_49718 - CITY
      ?auto_49716 - TRUCK
      ?auto_49717 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_49713 ?auto_49712 ) ) ( not ( = ?auto_49714 ?auto_49712 ) ) ( not ( = ?auto_49714 ?auto_49713 ) ) ( not ( = ?auto_49715 ?auto_49712 ) ) ( not ( = ?auto_49715 ?auto_49713 ) ) ( not ( = ?auto_49715 ?auto_49714 ) ) ( IN-CITY ?auto_49719 ?auto_49718 ) ( IN-CITY ?auto_49711 ?auto_49718 ) ( not ( = ?auto_49711 ?auto_49719 ) ) ( OBJ-AT ?auto_49714 ?auto_49711 ) ( OBJ-AT ?auto_49712 ?auto_49719 ) ( OBJ-AT ?auto_49713 ?auto_49719 ) ( TRUCK-AT ?auto_49716 ?auto_49717 ) ( IN-CITY ?auto_49717 ?auto_49718 ) ( not ( = ?auto_49711 ?auto_49717 ) ) ( not ( = ?auto_49719 ?auto_49717 ) ) ( OBJ-AT ?auto_49715 ?auto_49717 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_49714 ?auto_49712 ?auto_49711 )
      ( DELIVER-4PKG-VERIFY ?auto_49712 ?auto_49713 ?auto_49714 ?auto_49715 ?auto_49711 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_49741 - OBJ
      ?auto_49742 - OBJ
      ?auto_49743 - OBJ
      ?auto_49744 - OBJ
      ?auto_49740 - LOCATION
    )
    :vars
    (
      ?auto_49748 - LOCATION
      ?auto_49747 - CITY
      ?auto_49745 - TRUCK
      ?auto_49746 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_49742 ?auto_49741 ) ) ( not ( = ?auto_49743 ?auto_49741 ) ) ( not ( = ?auto_49743 ?auto_49742 ) ) ( not ( = ?auto_49744 ?auto_49741 ) ) ( not ( = ?auto_49744 ?auto_49742 ) ) ( not ( = ?auto_49744 ?auto_49743 ) ) ( IN-CITY ?auto_49748 ?auto_49747 ) ( IN-CITY ?auto_49740 ?auto_49747 ) ( not ( = ?auto_49740 ?auto_49748 ) ) ( OBJ-AT ?auto_49744 ?auto_49740 ) ( OBJ-AT ?auto_49741 ?auto_49748 ) ( OBJ-AT ?auto_49742 ?auto_49748 ) ( TRUCK-AT ?auto_49745 ?auto_49746 ) ( IN-CITY ?auto_49746 ?auto_49747 ) ( not ( = ?auto_49740 ?auto_49746 ) ) ( not ( = ?auto_49748 ?auto_49746 ) ) ( OBJ-AT ?auto_49743 ?auto_49746 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_49744 ?auto_49741 ?auto_49740 )
      ( DELIVER-4PKG-VERIFY ?auto_49741 ?auto_49742 ?auto_49743 ?auto_49744 ?auto_49740 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_50035 - OBJ
      ?auto_50034 - LOCATION
    )
    :vars
    (
      ?auto_50042 - OBJ
      ?auto_50041 - LOCATION
      ?auto_50039 - CITY
      ?auto_50038 - OBJ
      ?auto_50040 - OBJ
      ?auto_50037 - LOCATION
      ?auto_50036 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50035 ?auto_50042 ) ) ( IN-CITY ?auto_50041 ?auto_50039 ) ( IN-CITY ?auto_50034 ?auto_50039 ) ( not ( = ?auto_50034 ?auto_50041 ) ) ( OBJ-AT ?auto_50042 ?auto_50034 ) ( OBJ-AT ?auto_50035 ?auto_50041 ) ( not ( = ?auto_50038 ?auto_50042 ) ) ( not ( = ?auto_50035 ?auto_50038 ) ) ( OBJ-AT ?auto_50038 ?auto_50041 ) ( not ( = ?auto_50040 ?auto_50042 ) ) ( not ( = ?auto_50035 ?auto_50040 ) ) ( not ( = ?auto_50038 ?auto_50040 ) ) ( IN-CITY ?auto_50037 ?auto_50039 ) ( not ( = ?auto_50034 ?auto_50037 ) ) ( not ( = ?auto_50041 ?auto_50037 ) ) ( OBJ-AT ?auto_50040 ?auto_50037 ) ( TRUCK-AT ?auto_50036 ?auto_50034 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_50036 ?auto_50034 ?auto_50037 ?auto_50039 )
      ( DELIVER-2PKG ?auto_50042 ?auto_50035 ?auto_50034 )
      ( DELIVER-1PKG-VERIFY ?auto_50035 ?auto_50034 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_50044 - OBJ
      ?auto_50045 - OBJ
      ?auto_50043 - LOCATION
    )
    :vars
    (
      ?auto_50050 - LOCATION
      ?auto_50051 - CITY
      ?auto_50048 - OBJ
      ?auto_50046 - OBJ
      ?auto_50047 - LOCATION
      ?auto_50049 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50045 ?auto_50044 ) ) ( IN-CITY ?auto_50050 ?auto_50051 ) ( IN-CITY ?auto_50043 ?auto_50051 ) ( not ( = ?auto_50043 ?auto_50050 ) ) ( OBJ-AT ?auto_50044 ?auto_50043 ) ( OBJ-AT ?auto_50045 ?auto_50050 ) ( not ( = ?auto_50048 ?auto_50044 ) ) ( not ( = ?auto_50045 ?auto_50048 ) ) ( OBJ-AT ?auto_50048 ?auto_50050 ) ( not ( = ?auto_50046 ?auto_50044 ) ) ( not ( = ?auto_50045 ?auto_50046 ) ) ( not ( = ?auto_50048 ?auto_50046 ) ) ( IN-CITY ?auto_50047 ?auto_50051 ) ( not ( = ?auto_50043 ?auto_50047 ) ) ( not ( = ?auto_50050 ?auto_50047 ) ) ( OBJ-AT ?auto_50046 ?auto_50047 ) ( TRUCK-AT ?auto_50049 ?auto_50043 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_50045 ?auto_50043 )
      ( DELIVER-2PKG-VERIFY ?auto_50044 ?auto_50045 ?auto_50043 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_50053 - OBJ
      ?auto_50054 - OBJ
      ?auto_50052 - LOCATION
    )
    :vars
    (
      ?auto_50060 - OBJ
      ?auto_50058 - LOCATION
      ?auto_50056 - CITY
      ?auto_50057 - OBJ
      ?auto_50055 - LOCATION
      ?auto_50059 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50054 ?auto_50053 ) ) ( not ( = ?auto_50054 ?auto_50060 ) ) ( IN-CITY ?auto_50058 ?auto_50056 ) ( IN-CITY ?auto_50052 ?auto_50056 ) ( not ( = ?auto_50052 ?auto_50058 ) ) ( OBJ-AT ?auto_50060 ?auto_50052 ) ( OBJ-AT ?auto_50054 ?auto_50058 ) ( not ( = ?auto_50057 ?auto_50060 ) ) ( not ( = ?auto_50054 ?auto_50057 ) ) ( OBJ-AT ?auto_50057 ?auto_50058 ) ( not ( = ?auto_50053 ?auto_50060 ) ) ( not ( = ?auto_50057 ?auto_50053 ) ) ( IN-CITY ?auto_50055 ?auto_50056 ) ( not ( = ?auto_50052 ?auto_50055 ) ) ( not ( = ?auto_50058 ?auto_50055 ) ) ( OBJ-AT ?auto_50053 ?auto_50055 ) ( TRUCK-AT ?auto_50059 ?auto_50052 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50060 ?auto_50054 ?auto_50052 )
      ( DELIVER-2PKG-VERIFY ?auto_50053 ?auto_50054 ?auto_50052 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_50062 - OBJ
      ?auto_50063 - OBJ
      ?auto_50061 - LOCATION
    )
    :vars
    (
      ?auto_50069 - OBJ
      ?auto_50067 - LOCATION
      ?auto_50065 - CITY
      ?auto_50066 - OBJ
      ?auto_50064 - LOCATION
      ?auto_50068 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50063 ?auto_50062 ) ) ( not ( = ?auto_50063 ?auto_50069 ) ) ( IN-CITY ?auto_50067 ?auto_50065 ) ( IN-CITY ?auto_50061 ?auto_50065 ) ( not ( = ?auto_50061 ?auto_50067 ) ) ( OBJ-AT ?auto_50069 ?auto_50061 ) ( OBJ-AT ?auto_50063 ?auto_50067 ) ( not ( = ?auto_50062 ?auto_50069 ) ) ( OBJ-AT ?auto_50062 ?auto_50067 ) ( not ( = ?auto_50066 ?auto_50069 ) ) ( not ( = ?auto_50063 ?auto_50066 ) ) ( not ( = ?auto_50062 ?auto_50066 ) ) ( IN-CITY ?auto_50064 ?auto_50065 ) ( not ( = ?auto_50061 ?auto_50064 ) ) ( not ( = ?auto_50067 ?auto_50064 ) ) ( OBJ-AT ?auto_50066 ?auto_50064 ) ( TRUCK-AT ?auto_50068 ?auto_50061 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50069 ?auto_50063 ?auto_50061 )
      ( DELIVER-2PKG-VERIFY ?auto_50062 ?auto_50063 ?auto_50061 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_50071 - OBJ
      ?auto_50072 - OBJ
      ?auto_50070 - LOCATION
    )
    :vars
    (
      ?auto_50077 - LOCATION
      ?auto_50074 - CITY
      ?auto_50075 - OBJ
      ?auto_50076 - OBJ
      ?auto_50073 - LOCATION
      ?auto_50078 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50072 ?auto_50071 ) ) ( IN-CITY ?auto_50077 ?auto_50074 ) ( IN-CITY ?auto_50070 ?auto_50074 ) ( not ( = ?auto_50070 ?auto_50077 ) ) ( OBJ-AT ?auto_50072 ?auto_50070 ) ( OBJ-AT ?auto_50071 ?auto_50077 ) ( not ( = ?auto_50075 ?auto_50072 ) ) ( not ( = ?auto_50071 ?auto_50075 ) ) ( OBJ-AT ?auto_50075 ?auto_50077 ) ( not ( = ?auto_50076 ?auto_50072 ) ) ( not ( = ?auto_50071 ?auto_50076 ) ) ( not ( = ?auto_50075 ?auto_50076 ) ) ( IN-CITY ?auto_50073 ?auto_50074 ) ( not ( = ?auto_50070 ?auto_50073 ) ) ( not ( = ?auto_50077 ?auto_50073 ) ) ( OBJ-AT ?auto_50076 ?auto_50073 ) ( TRUCK-AT ?auto_50078 ?auto_50070 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50072 ?auto_50071 ?auto_50070 )
      ( DELIVER-2PKG-VERIFY ?auto_50071 ?auto_50072 ?auto_50070 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_50080 - OBJ
      ?auto_50081 - OBJ
      ?auto_50079 - LOCATION
    )
    :vars
    (
      ?auto_50087 - OBJ
      ?auto_50085 - LOCATION
      ?auto_50083 - CITY
      ?auto_50084 - OBJ
      ?auto_50082 - LOCATION
      ?auto_50086 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50081 ?auto_50080 ) ) ( not ( = ?auto_50080 ?auto_50087 ) ) ( IN-CITY ?auto_50085 ?auto_50083 ) ( IN-CITY ?auto_50079 ?auto_50083 ) ( not ( = ?auto_50079 ?auto_50085 ) ) ( OBJ-AT ?auto_50087 ?auto_50079 ) ( OBJ-AT ?auto_50080 ?auto_50085 ) ( not ( = ?auto_50084 ?auto_50087 ) ) ( not ( = ?auto_50080 ?auto_50084 ) ) ( OBJ-AT ?auto_50084 ?auto_50085 ) ( not ( = ?auto_50081 ?auto_50087 ) ) ( not ( = ?auto_50084 ?auto_50081 ) ) ( IN-CITY ?auto_50082 ?auto_50083 ) ( not ( = ?auto_50079 ?auto_50082 ) ) ( not ( = ?auto_50085 ?auto_50082 ) ) ( OBJ-AT ?auto_50081 ?auto_50082 ) ( TRUCK-AT ?auto_50086 ?auto_50079 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50087 ?auto_50080 ?auto_50079 )
      ( DELIVER-2PKG-VERIFY ?auto_50080 ?auto_50081 ?auto_50079 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_50089 - OBJ
      ?auto_50090 - OBJ
      ?auto_50088 - LOCATION
    )
    :vars
    (
      ?auto_50096 - OBJ
      ?auto_50094 - LOCATION
      ?auto_50092 - CITY
      ?auto_50093 - OBJ
      ?auto_50091 - LOCATION
      ?auto_50095 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50090 ?auto_50089 ) ) ( not ( = ?auto_50089 ?auto_50096 ) ) ( IN-CITY ?auto_50094 ?auto_50092 ) ( IN-CITY ?auto_50088 ?auto_50092 ) ( not ( = ?auto_50088 ?auto_50094 ) ) ( OBJ-AT ?auto_50096 ?auto_50088 ) ( OBJ-AT ?auto_50089 ?auto_50094 ) ( not ( = ?auto_50090 ?auto_50096 ) ) ( OBJ-AT ?auto_50090 ?auto_50094 ) ( not ( = ?auto_50093 ?auto_50096 ) ) ( not ( = ?auto_50089 ?auto_50093 ) ) ( not ( = ?auto_50090 ?auto_50093 ) ) ( IN-CITY ?auto_50091 ?auto_50092 ) ( not ( = ?auto_50088 ?auto_50091 ) ) ( not ( = ?auto_50094 ?auto_50091 ) ) ( OBJ-AT ?auto_50093 ?auto_50091 ) ( TRUCK-AT ?auto_50095 ?auto_50088 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50096 ?auto_50089 ?auto_50088 )
      ( DELIVER-2PKG-VERIFY ?auto_50089 ?auto_50090 ?auto_50088 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_50118 - OBJ
      ?auto_50119 - OBJ
      ?auto_50120 - OBJ
      ?auto_50117 - LOCATION
    )
    :vars
    (
      ?auto_50124 - LOCATION
      ?auto_50122 - CITY
      ?auto_50123 - OBJ
      ?auto_50121 - LOCATION
      ?auto_50125 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50119 ?auto_50118 ) ) ( not ( = ?auto_50120 ?auto_50118 ) ) ( not ( = ?auto_50120 ?auto_50119 ) ) ( IN-CITY ?auto_50124 ?auto_50122 ) ( IN-CITY ?auto_50117 ?auto_50122 ) ( not ( = ?auto_50117 ?auto_50124 ) ) ( OBJ-AT ?auto_50118 ?auto_50117 ) ( OBJ-AT ?auto_50120 ?auto_50124 ) ( not ( = ?auto_50123 ?auto_50118 ) ) ( not ( = ?auto_50120 ?auto_50123 ) ) ( OBJ-AT ?auto_50123 ?auto_50124 ) ( not ( = ?auto_50123 ?auto_50119 ) ) ( IN-CITY ?auto_50121 ?auto_50122 ) ( not ( = ?auto_50117 ?auto_50121 ) ) ( not ( = ?auto_50124 ?auto_50121 ) ) ( OBJ-AT ?auto_50119 ?auto_50121 ) ( TRUCK-AT ?auto_50125 ?auto_50117 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50118 ?auto_50120 ?auto_50117 )
      ( DELIVER-3PKG-VERIFY ?auto_50118 ?auto_50119 ?auto_50120 ?auto_50117 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_50127 - OBJ
      ?auto_50128 - OBJ
      ?auto_50129 - OBJ
      ?auto_50126 - LOCATION
    )
    :vars
    (
      ?auto_50133 - LOCATION
      ?auto_50131 - CITY
      ?auto_50132 - OBJ
      ?auto_50130 - LOCATION
      ?auto_50134 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50128 ?auto_50127 ) ) ( not ( = ?auto_50129 ?auto_50127 ) ) ( not ( = ?auto_50129 ?auto_50128 ) ) ( IN-CITY ?auto_50133 ?auto_50131 ) ( IN-CITY ?auto_50126 ?auto_50131 ) ( not ( = ?auto_50126 ?auto_50133 ) ) ( OBJ-AT ?auto_50127 ?auto_50126 ) ( OBJ-AT ?auto_50129 ?auto_50133 ) ( OBJ-AT ?auto_50128 ?auto_50133 ) ( not ( = ?auto_50132 ?auto_50127 ) ) ( not ( = ?auto_50129 ?auto_50132 ) ) ( not ( = ?auto_50128 ?auto_50132 ) ) ( IN-CITY ?auto_50130 ?auto_50131 ) ( not ( = ?auto_50126 ?auto_50130 ) ) ( not ( = ?auto_50133 ?auto_50130 ) ) ( OBJ-AT ?auto_50132 ?auto_50130 ) ( TRUCK-AT ?auto_50134 ?auto_50126 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50127 ?auto_50129 ?auto_50126 )
      ( DELIVER-3PKG-VERIFY ?auto_50127 ?auto_50128 ?auto_50129 ?auto_50126 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_50146 - OBJ
      ?auto_50147 - OBJ
      ?auto_50148 - OBJ
      ?auto_50145 - LOCATION
    )
    :vars
    (
      ?auto_50152 - LOCATION
      ?auto_50150 - CITY
      ?auto_50151 - OBJ
      ?auto_50149 - LOCATION
      ?auto_50153 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50147 ?auto_50146 ) ) ( not ( = ?auto_50148 ?auto_50146 ) ) ( not ( = ?auto_50148 ?auto_50147 ) ) ( IN-CITY ?auto_50152 ?auto_50150 ) ( IN-CITY ?auto_50145 ?auto_50150 ) ( not ( = ?auto_50145 ?auto_50152 ) ) ( OBJ-AT ?auto_50146 ?auto_50145 ) ( OBJ-AT ?auto_50147 ?auto_50152 ) ( not ( = ?auto_50151 ?auto_50146 ) ) ( not ( = ?auto_50147 ?auto_50151 ) ) ( OBJ-AT ?auto_50151 ?auto_50152 ) ( not ( = ?auto_50151 ?auto_50148 ) ) ( IN-CITY ?auto_50149 ?auto_50150 ) ( not ( = ?auto_50145 ?auto_50149 ) ) ( not ( = ?auto_50152 ?auto_50149 ) ) ( OBJ-AT ?auto_50148 ?auto_50149 ) ( TRUCK-AT ?auto_50153 ?auto_50145 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50146 ?auto_50147 ?auto_50145 )
      ( DELIVER-3PKG-VERIFY ?auto_50146 ?auto_50147 ?auto_50148 ?auto_50145 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_50155 - OBJ
      ?auto_50156 - OBJ
      ?auto_50157 - OBJ
      ?auto_50154 - LOCATION
    )
    :vars
    (
      ?auto_50161 - LOCATION
      ?auto_50159 - CITY
      ?auto_50160 - OBJ
      ?auto_50158 - LOCATION
      ?auto_50162 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50156 ?auto_50155 ) ) ( not ( = ?auto_50157 ?auto_50155 ) ) ( not ( = ?auto_50157 ?auto_50156 ) ) ( IN-CITY ?auto_50161 ?auto_50159 ) ( IN-CITY ?auto_50154 ?auto_50159 ) ( not ( = ?auto_50154 ?auto_50161 ) ) ( OBJ-AT ?auto_50155 ?auto_50154 ) ( OBJ-AT ?auto_50156 ?auto_50161 ) ( OBJ-AT ?auto_50157 ?auto_50161 ) ( not ( = ?auto_50160 ?auto_50155 ) ) ( not ( = ?auto_50156 ?auto_50160 ) ) ( not ( = ?auto_50157 ?auto_50160 ) ) ( IN-CITY ?auto_50158 ?auto_50159 ) ( not ( = ?auto_50154 ?auto_50158 ) ) ( not ( = ?auto_50161 ?auto_50158 ) ) ( OBJ-AT ?auto_50160 ?auto_50158 ) ( TRUCK-AT ?auto_50162 ?auto_50154 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50155 ?auto_50156 ?auto_50154 )
      ( DELIVER-3PKG-VERIFY ?auto_50155 ?auto_50156 ?auto_50157 ?auto_50154 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_50174 - OBJ
      ?auto_50175 - OBJ
      ?auto_50176 - OBJ
      ?auto_50173 - LOCATION
    )
    :vars
    (
      ?auto_50180 - LOCATION
      ?auto_50178 - CITY
      ?auto_50179 - OBJ
      ?auto_50177 - LOCATION
      ?auto_50181 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50175 ?auto_50174 ) ) ( not ( = ?auto_50176 ?auto_50174 ) ) ( not ( = ?auto_50176 ?auto_50175 ) ) ( IN-CITY ?auto_50180 ?auto_50178 ) ( IN-CITY ?auto_50173 ?auto_50178 ) ( not ( = ?auto_50173 ?auto_50180 ) ) ( OBJ-AT ?auto_50175 ?auto_50173 ) ( OBJ-AT ?auto_50176 ?auto_50180 ) ( not ( = ?auto_50179 ?auto_50175 ) ) ( not ( = ?auto_50176 ?auto_50179 ) ) ( OBJ-AT ?auto_50179 ?auto_50180 ) ( not ( = ?auto_50179 ?auto_50174 ) ) ( IN-CITY ?auto_50177 ?auto_50178 ) ( not ( = ?auto_50173 ?auto_50177 ) ) ( not ( = ?auto_50180 ?auto_50177 ) ) ( OBJ-AT ?auto_50174 ?auto_50177 ) ( TRUCK-AT ?auto_50181 ?auto_50173 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50175 ?auto_50176 ?auto_50173 )
      ( DELIVER-3PKG-VERIFY ?auto_50174 ?auto_50175 ?auto_50176 ?auto_50173 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_50193 - OBJ
      ?auto_50194 - OBJ
      ?auto_50195 - OBJ
      ?auto_50192 - LOCATION
    )
    :vars
    (
      ?auto_50200 - OBJ
      ?auto_50198 - LOCATION
      ?auto_50197 - CITY
      ?auto_50196 - LOCATION
      ?auto_50199 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50194 ?auto_50193 ) ) ( not ( = ?auto_50195 ?auto_50193 ) ) ( not ( = ?auto_50195 ?auto_50194 ) ) ( not ( = ?auto_50195 ?auto_50200 ) ) ( IN-CITY ?auto_50198 ?auto_50197 ) ( IN-CITY ?auto_50192 ?auto_50197 ) ( not ( = ?auto_50192 ?auto_50198 ) ) ( OBJ-AT ?auto_50200 ?auto_50192 ) ( OBJ-AT ?auto_50195 ?auto_50198 ) ( not ( = ?auto_50194 ?auto_50200 ) ) ( OBJ-AT ?auto_50194 ?auto_50198 ) ( not ( = ?auto_50193 ?auto_50200 ) ) ( IN-CITY ?auto_50196 ?auto_50197 ) ( not ( = ?auto_50192 ?auto_50196 ) ) ( not ( = ?auto_50198 ?auto_50196 ) ) ( OBJ-AT ?auto_50193 ?auto_50196 ) ( TRUCK-AT ?auto_50199 ?auto_50192 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50200 ?auto_50195 ?auto_50192 )
      ( DELIVER-3PKG-VERIFY ?auto_50193 ?auto_50194 ?auto_50195 ?auto_50192 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_50202 - OBJ
      ?auto_50203 - OBJ
      ?auto_50204 - OBJ
      ?auto_50201 - LOCATION
    )
    :vars
    (
      ?auto_50208 - LOCATION
      ?auto_50206 - CITY
      ?auto_50207 - OBJ
      ?auto_50205 - LOCATION
      ?auto_50209 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50203 ?auto_50202 ) ) ( not ( = ?auto_50204 ?auto_50202 ) ) ( not ( = ?auto_50204 ?auto_50203 ) ) ( IN-CITY ?auto_50208 ?auto_50206 ) ( IN-CITY ?auto_50201 ?auto_50206 ) ( not ( = ?auto_50201 ?auto_50208 ) ) ( OBJ-AT ?auto_50204 ?auto_50201 ) ( OBJ-AT ?auto_50203 ?auto_50208 ) ( not ( = ?auto_50207 ?auto_50204 ) ) ( not ( = ?auto_50203 ?auto_50207 ) ) ( OBJ-AT ?auto_50207 ?auto_50208 ) ( not ( = ?auto_50207 ?auto_50202 ) ) ( IN-CITY ?auto_50205 ?auto_50206 ) ( not ( = ?auto_50201 ?auto_50205 ) ) ( not ( = ?auto_50208 ?auto_50205 ) ) ( OBJ-AT ?auto_50202 ?auto_50205 ) ( TRUCK-AT ?auto_50209 ?auto_50201 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50204 ?auto_50203 ?auto_50201 )
      ( DELIVER-3PKG-VERIFY ?auto_50202 ?auto_50203 ?auto_50204 ?auto_50201 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_50221 - OBJ
      ?auto_50222 - OBJ
      ?auto_50223 - OBJ
      ?auto_50220 - LOCATION
    )
    :vars
    (
      ?auto_50228 - OBJ
      ?auto_50226 - LOCATION
      ?auto_50225 - CITY
      ?auto_50224 - LOCATION
      ?auto_50227 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50222 ?auto_50221 ) ) ( not ( = ?auto_50223 ?auto_50221 ) ) ( not ( = ?auto_50223 ?auto_50222 ) ) ( not ( = ?auto_50222 ?auto_50228 ) ) ( IN-CITY ?auto_50226 ?auto_50225 ) ( IN-CITY ?auto_50220 ?auto_50225 ) ( not ( = ?auto_50220 ?auto_50226 ) ) ( OBJ-AT ?auto_50228 ?auto_50220 ) ( OBJ-AT ?auto_50222 ?auto_50226 ) ( not ( = ?auto_50223 ?auto_50228 ) ) ( OBJ-AT ?auto_50223 ?auto_50226 ) ( not ( = ?auto_50221 ?auto_50228 ) ) ( IN-CITY ?auto_50224 ?auto_50225 ) ( not ( = ?auto_50220 ?auto_50224 ) ) ( not ( = ?auto_50226 ?auto_50224 ) ) ( OBJ-AT ?auto_50221 ?auto_50224 ) ( TRUCK-AT ?auto_50227 ?auto_50220 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50228 ?auto_50222 ?auto_50220 )
      ( DELIVER-3PKG-VERIFY ?auto_50221 ?auto_50222 ?auto_50223 ?auto_50220 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_50240 - OBJ
      ?auto_50241 - OBJ
      ?auto_50242 - OBJ
      ?auto_50239 - LOCATION
    )
    :vars
    (
      ?auto_50246 - LOCATION
      ?auto_50244 - CITY
      ?auto_50245 - OBJ
      ?auto_50243 - LOCATION
      ?auto_50247 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50241 ?auto_50240 ) ) ( not ( = ?auto_50242 ?auto_50240 ) ) ( not ( = ?auto_50242 ?auto_50241 ) ) ( IN-CITY ?auto_50246 ?auto_50244 ) ( IN-CITY ?auto_50239 ?auto_50244 ) ( not ( = ?auto_50239 ?auto_50246 ) ) ( OBJ-AT ?auto_50241 ?auto_50239 ) ( OBJ-AT ?auto_50242 ?auto_50246 ) ( OBJ-AT ?auto_50240 ?auto_50246 ) ( not ( = ?auto_50245 ?auto_50241 ) ) ( not ( = ?auto_50242 ?auto_50245 ) ) ( not ( = ?auto_50240 ?auto_50245 ) ) ( IN-CITY ?auto_50243 ?auto_50244 ) ( not ( = ?auto_50239 ?auto_50243 ) ) ( not ( = ?auto_50246 ?auto_50243 ) ) ( OBJ-AT ?auto_50245 ?auto_50243 ) ( TRUCK-AT ?auto_50247 ?auto_50239 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50241 ?auto_50242 ?auto_50239 )
      ( DELIVER-3PKG-VERIFY ?auto_50240 ?auto_50241 ?auto_50242 ?auto_50239 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_50249 - OBJ
      ?auto_50250 - OBJ
      ?auto_50251 - OBJ
      ?auto_50248 - LOCATION
    )
    :vars
    (
      ?auto_50256 - OBJ
      ?auto_50254 - LOCATION
      ?auto_50253 - CITY
      ?auto_50252 - LOCATION
      ?auto_50255 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50250 ?auto_50249 ) ) ( not ( = ?auto_50251 ?auto_50249 ) ) ( not ( = ?auto_50251 ?auto_50250 ) ) ( not ( = ?auto_50251 ?auto_50256 ) ) ( IN-CITY ?auto_50254 ?auto_50253 ) ( IN-CITY ?auto_50248 ?auto_50253 ) ( not ( = ?auto_50248 ?auto_50254 ) ) ( OBJ-AT ?auto_50256 ?auto_50248 ) ( OBJ-AT ?auto_50251 ?auto_50254 ) ( not ( = ?auto_50249 ?auto_50256 ) ) ( OBJ-AT ?auto_50249 ?auto_50254 ) ( not ( = ?auto_50250 ?auto_50256 ) ) ( IN-CITY ?auto_50252 ?auto_50253 ) ( not ( = ?auto_50248 ?auto_50252 ) ) ( not ( = ?auto_50254 ?auto_50252 ) ) ( OBJ-AT ?auto_50250 ?auto_50252 ) ( TRUCK-AT ?auto_50255 ?auto_50248 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50256 ?auto_50251 ?auto_50248 )
      ( DELIVER-3PKG-VERIFY ?auto_50249 ?auto_50250 ?auto_50251 ?auto_50248 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_50268 - OBJ
      ?auto_50269 - OBJ
      ?auto_50270 - OBJ
      ?auto_50267 - LOCATION
    )
    :vars
    (
      ?auto_50274 - LOCATION
      ?auto_50272 - CITY
      ?auto_50273 - OBJ
      ?auto_50271 - LOCATION
      ?auto_50275 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50269 ?auto_50268 ) ) ( not ( = ?auto_50270 ?auto_50268 ) ) ( not ( = ?auto_50270 ?auto_50269 ) ) ( IN-CITY ?auto_50274 ?auto_50272 ) ( IN-CITY ?auto_50267 ?auto_50272 ) ( not ( = ?auto_50267 ?auto_50274 ) ) ( OBJ-AT ?auto_50270 ?auto_50267 ) ( OBJ-AT ?auto_50269 ?auto_50274 ) ( OBJ-AT ?auto_50268 ?auto_50274 ) ( not ( = ?auto_50273 ?auto_50270 ) ) ( not ( = ?auto_50269 ?auto_50273 ) ) ( not ( = ?auto_50268 ?auto_50273 ) ) ( IN-CITY ?auto_50271 ?auto_50272 ) ( not ( = ?auto_50267 ?auto_50271 ) ) ( not ( = ?auto_50274 ?auto_50271 ) ) ( OBJ-AT ?auto_50273 ?auto_50271 ) ( TRUCK-AT ?auto_50275 ?auto_50267 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50270 ?auto_50269 ?auto_50267 )
      ( DELIVER-3PKG-VERIFY ?auto_50268 ?auto_50269 ?auto_50270 ?auto_50267 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_50277 - OBJ
      ?auto_50278 - OBJ
      ?auto_50279 - OBJ
      ?auto_50276 - LOCATION
    )
    :vars
    (
      ?auto_50284 - OBJ
      ?auto_50282 - LOCATION
      ?auto_50281 - CITY
      ?auto_50280 - LOCATION
      ?auto_50283 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50278 ?auto_50277 ) ) ( not ( = ?auto_50279 ?auto_50277 ) ) ( not ( = ?auto_50279 ?auto_50278 ) ) ( not ( = ?auto_50278 ?auto_50284 ) ) ( IN-CITY ?auto_50282 ?auto_50281 ) ( IN-CITY ?auto_50276 ?auto_50281 ) ( not ( = ?auto_50276 ?auto_50282 ) ) ( OBJ-AT ?auto_50284 ?auto_50276 ) ( OBJ-AT ?auto_50278 ?auto_50282 ) ( not ( = ?auto_50277 ?auto_50284 ) ) ( OBJ-AT ?auto_50277 ?auto_50282 ) ( not ( = ?auto_50279 ?auto_50284 ) ) ( IN-CITY ?auto_50280 ?auto_50281 ) ( not ( = ?auto_50276 ?auto_50280 ) ) ( not ( = ?auto_50282 ?auto_50280 ) ) ( OBJ-AT ?auto_50279 ?auto_50280 ) ( TRUCK-AT ?auto_50283 ?auto_50276 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50284 ?auto_50278 ?auto_50276 )
      ( DELIVER-3PKG-VERIFY ?auto_50277 ?auto_50278 ?auto_50279 ?auto_50276 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_50316 - OBJ
      ?auto_50317 - OBJ
      ?auto_50318 - OBJ
      ?auto_50315 - LOCATION
    )
    :vars
    (
      ?auto_50322 - LOCATION
      ?auto_50320 - CITY
      ?auto_50321 - OBJ
      ?auto_50319 - LOCATION
      ?auto_50323 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50317 ?auto_50316 ) ) ( not ( = ?auto_50318 ?auto_50316 ) ) ( not ( = ?auto_50318 ?auto_50317 ) ) ( IN-CITY ?auto_50322 ?auto_50320 ) ( IN-CITY ?auto_50315 ?auto_50320 ) ( not ( = ?auto_50315 ?auto_50322 ) ) ( OBJ-AT ?auto_50317 ?auto_50315 ) ( OBJ-AT ?auto_50316 ?auto_50322 ) ( not ( = ?auto_50321 ?auto_50317 ) ) ( not ( = ?auto_50316 ?auto_50321 ) ) ( OBJ-AT ?auto_50321 ?auto_50322 ) ( not ( = ?auto_50321 ?auto_50318 ) ) ( IN-CITY ?auto_50319 ?auto_50320 ) ( not ( = ?auto_50315 ?auto_50319 ) ) ( not ( = ?auto_50322 ?auto_50319 ) ) ( OBJ-AT ?auto_50318 ?auto_50319 ) ( TRUCK-AT ?auto_50323 ?auto_50315 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50317 ?auto_50316 ?auto_50315 )
      ( DELIVER-3PKG-VERIFY ?auto_50316 ?auto_50317 ?auto_50318 ?auto_50315 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_50325 - OBJ
      ?auto_50326 - OBJ
      ?auto_50327 - OBJ
      ?auto_50324 - LOCATION
    )
    :vars
    (
      ?auto_50331 - LOCATION
      ?auto_50329 - CITY
      ?auto_50330 - OBJ
      ?auto_50328 - LOCATION
      ?auto_50332 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50326 ?auto_50325 ) ) ( not ( = ?auto_50327 ?auto_50325 ) ) ( not ( = ?auto_50327 ?auto_50326 ) ) ( IN-CITY ?auto_50331 ?auto_50329 ) ( IN-CITY ?auto_50324 ?auto_50329 ) ( not ( = ?auto_50324 ?auto_50331 ) ) ( OBJ-AT ?auto_50326 ?auto_50324 ) ( OBJ-AT ?auto_50325 ?auto_50331 ) ( OBJ-AT ?auto_50327 ?auto_50331 ) ( not ( = ?auto_50330 ?auto_50326 ) ) ( not ( = ?auto_50325 ?auto_50330 ) ) ( not ( = ?auto_50327 ?auto_50330 ) ) ( IN-CITY ?auto_50328 ?auto_50329 ) ( not ( = ?auto_50324 ?auto_50328 ) ) ( not ( = ?auto_50331 ?auto_50328 ) ) ( OBJ-AT ?auto_50330 ?auto_50328 ) ( TRUCK-AT ?auto_50332 ?auto_50324 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50326 ?auto_50325 ?auto_50324 )
      ( DELIVER-3PKG-VERIFY ?auto_50325 ?auto_50326 ?auto_50327 ?auto_50324 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_50344 - OBJ
      ?auto_50345 - OBJ
      ?auto_50346 - OBJ
      ?auto_50343 - LOCATION
    )
    :vars
    (
      ?auto_50350 - LOCATION
      ?auto_50348 - CITY
      ?auto_50349 - OBJ
      ?auto_50347 - LOCATION
      ?auto_50351 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50345 ?auto_50344 ) ) ( not ( = ?auto_50346 ?auto_50344 ) ) ( not ( = ?auto_50346 ?auto_50345 ) ) ( IN-CITY ?auto_50350 ?auto_50348 ) ( IN-CITY ?auto_50343 ?auto_50348 ) ( not ( = ?auto_50343 ?auto_50350 ) ) ( OBJ-AT ?auto_50346 ?auto_50343 ) ( OBJ-AT ?auto_50344 ?auto_50350 ) ( not ( = ?auto_50349 ?auto_50346 ) ) ( not ( = ?auto_50344 ?auto_50349 ) ) ( OBJ-AT ?auto_50349 ?auto_50350 ) ( not ( = ?auto_50349 ?auto_50345 ) ) ( IN-CITY ?auto_50347 ?auto_50348 ) ( not ( = ?auto_50343 ?auto_50347 ) ) ( not ( = ?auto_50350 ?auto_50347 ) ) ( OBJ-AT ?auto_50345 ?auto_50347 ) ( TRUCK-AT ?auto_50351 ?auto_50343 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50346 ?auto_50344 ?auto_50343 )
      ( DELIVER-3PKG-VERIFY ?auto_50344 ?auto_50345 ?auto_50346 ?auto_50343 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_50363 - OBJ
      ?auto_50364 - OBJ
      ?auto_50365 - OBJ
      ?auto_50362 - LOCATION
    )
    :vars
    (
      ?auto_50370 - OBJ
      ?auto_50368 - LOCATION
      ?auto_50367 - CITY
      ?auto_50366 - LOCATION
      ?auto_50369 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50364 ?auto_50363 ) ) ( not ( = ?auto_50365 ?auto_50363 ) ) ( not ( = ?auto_50365 ?auto_50364 ) ) ( not ( = ?auto_50363 ?auto_50370 ) ) ( IN-CITY ?auto_50368 ?auto_50367 ) ( IN-CITY ?auto_50362 ?auto_50367 ) ( not ( = ?auto_50362 ?auto_50368 ) ) ( OBJ-AT ?auto_50370 ?auto_50362 ) ( OBJ-AT ?auto_50363 ?auto_50368 ) ( not ( = ?auto_50365 ?auto_50370 ) ) ( OBJ-AT ?auto_50365 ?auto_50368 ) ( not ( = ?auto_50364 ?auto_50370 ) ) ( IN-CITY ?auto_50366 ?auto_50367 ) ( not ( = ?auto_50362 ?auto_50366 ) ) ( not ( = ?auto_50368 ?auto_50366 ) ) ( OBJ-AT ?auto_50364 ?auto_50366 ) ( TRUCK-AT ?auto_50369 ?auto_50362 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50370 ?auto_50363 ?auto_50362 )
      ( DELIVER-3PKG-VERIFY ?auto_50363 ?auto_50364 ?auto_50365 ?auto_50362 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_50382 - OBJ
      ?auto_50383 - OBJ
      ?auto_50384 - OBJ
      ?auto_50381 - LOCATION
    )
    :vars
    (
      ?auto_50388 - LOCATION
      ?auto_50386 - CITY
      ?auto_50387 - OBJ
      ?auto_50385 - LOCATION
      ?auto_50389 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50383 ?auto_50382 ) ) ( not ( = ?auto_50384 ?auto_50382 ) ) ( not ( = ?auto_50384 ?auto_50383 ) ) ( IN-CITY ?auto_50388 ?auto_50386 ) ( IN-CITY ?auto_50381 ?auto_50386 ) ( not ( = ?auto_50381 ?auto_50388 ) ) ( OBJ-AT ?auto_50384 ?auto_50381 ) ( OBJ-AT ?auto_50382 ?auto_50388 ) ( OBJ-AT ?auto_50383 ?auto_50388 ) ( not ( = ?auto_50387 ?auto_50384 ) ) ( not ( = ?auto_50382 ?auto_50387 ) ) ( not ( = ?auto_50383 ?auto_50387 ) ) ( IN-CITY ?auto_50385 ?auto_50386 ) ( not ( = ?auto_50381 ?auto_50385 ) ) ( not ( = ?auto_50388 ?auto_50385 ) ) ( OBJ-AT ?auto_50387 ?auto_50385 ) ( TRUCK-AT ?auto_50389 ?auto_50381 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50384 ?auto_50382 ?auto_50381 )
      ( DELIVER-3PKG-VERIFY ?auto_50382 ?auto_50383 ?auto_50384 ?auto_50381 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_50391 - OBJ
      ?auto_50392 - OBJ
      ?auto_50393 - OBJ
      ?auto_50390 - LOCATION
    )
    :vars
    (
      ?auto_50398 - OBJ
      ?auto_50396 - LOCATION
      ?auto_50395 - CITY
      ?auto_50394 - LOCATION
      ?auto_50397 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50392 ?auto_50391 ) ) ( not ( = ?auto_50393 ?auto_50391 ) ) ( not ( = ?auto_50393 ?auto_50392 ) ) ( not ( = ?auto_50391 ?auto_50398 ) ) ( IN-CITY ?auto_50396 ?auto_50395 ) ( IN-CITY ?auto_50390 ?auto_50395 ) ( not ( = ?auto_50390 ?auto_50396 ) ) ( OBJ-AT ?auto_50398 ?auto_50390 ) ( OBJ-AT ?auto_50391 ?auto_50396 ) ( not ( = ?auto_50392 ?auto_50398 ) ) ( OBJ-AT ?auto_50392 ?auto_50396 ) ( not ( = ?auto_50393 ?auto_50398 ) ) ( IN-CITY ?auto_50394 ?auto_50395 ) ( not ( = ?auto_50390 ?auto_50394 ) ) ( not ( = ?auto_50396 ?auto_50394 ) ) ( OBJ-AT ?auto_50393 ?auto_50394 ) ( TRUCK-AT ?auto_50397 ?auto_50390 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50398 ?auto_50391 ?auto_50390 )
      ( DELIVER-3PKG-VERIFY ?auto_50391 ?auto_50392 ?auto_50393 ?auto_50390 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_50554 - OBJ
      ?auto_50555 - OBJ
      ?auto_50556 - OBJ
      ?auto_50557 - OBJ
      ?auto_50553 - LOCATION
    )
    :vars
    (
      ?auto_50560 - LOCATION
      ?auto_50559 - CITY
      ?auto_50558 - LOCATION
      ?auto_50561 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50555 ?auto_50554 ) ) ( not ( = ?auto_50556 ?auto_50554 ) ) ( not ( = ?auto_50556 ?auto_50555 ) ) ( not ( = ?auto_50557 ?auto_50554 ) ) ( not ( = ?auto_50557 ?auto_50555 ) ) ( not ( = ?auto_50557 ?auto_50556 ) ) ( IN-CITY ?auto_50560 ?auto_50559 ) ( IN-CITY ?auto_50553 ?auto_50559 ) ( not ( = ?auto_50553 ?auto_50560 ) ) ( OBJ-AT ?auto_50554 ?auto_50553 ) ( OBJ-AT ?auto_50557 ?auto_50560 ) ( OBJ-AT ?auto_50556 ?auto_50560 ) ( IN-CITY ?auto_50558 ?auto_50559 ) ( not ( = ?auto_50553 ?auto_50558 ) ) ( not ( = ?auto_50560 ?auto_50558 ) ) ( OBJ-AT ?auto_50555 ?auto_50558 ) ( TRUCK-AT ?auto_50561 ?auto_50553 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50554 ?auto_50557 ?auto_50553 )
      ( DELIVER-4PKG-VERIFY ?auto_50554 ?auto_50555 ?auto_50556 ?auto_50557 ?auto_50553 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_50583 - OBJ
      ?auto_50584 - OBJ
      ?auto_50585 - OBJ
      ?auto_50586 - OBJ
      ?auto_50582 - LOCATION
    )
    :vars
    (
      ?auto_50589 - LOCATION
      ?auto_50588 - CITY
      ?auto_50587 - LOCATION
      ?auto_50590 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50584 ?auto_50583 ) ) ( not ( = ?auto_50585 ?auto_50583 ) ) ( not ( = ?auto_50585 ?auto_50584 ) ) ( not ( = ?auto_50586 ?auto_50583 ) ) ( not ( = ?auto_50586 ?auto_50584 ) ) ( not ( = ?auto_50586 ?auto_50585 ) ) ( IN-CITY ?auto_50589 ?auto_50588 ) ( IN-CITY ?auto_50582 ?auto_50588 ) ( not ( = ?auto_50582 ?auto_50589 ) ) ( OBJ-AT ?auto_50583 ?auto_50582 ) ( OBJ-AT ?auto_50585 ?auto_50589 ) ( OBJ-AT ?auto_50586 ?auto_50589 ) ( IN-CITY ?auto_50587 ?auto_50588 ) ( not ( = ?auto_50582 ?auto_50587 ) ) ( not ( = ?auto_50589 ?auto_50587 ) ) ( OBJ-AT ?auto_50584 ?auto_50587 ) ( TRUCK-AT ?auto_50590 ?auto_50582 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50583 ?auto_50585 ?auto_50582 )
      ( DELIVER-4PKG-VERIFY ?auto_50583 ?auto_50584 ?auto_50585 ?auto_50586 ?auto_50582 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_50612 - OBJ
      ?auto_50613 - OBJ
      ?auto_50614 - OBJ
      ?auto_50615 - OBJ
      ?auto_50611 - LOCATION
    )
    :vars
    (
      ?auto_50618 - LOCATION
      ?auto_50617 - CITY
      ?auto_50616 - LOCATION
      ?auto_50619 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50613 ?auto_50612 ) ) ( not ( = ?auto_50614 ?auto_50612 ) ) ( not ( = ?auto_50614 ?auto_50613 ) ) ( not ( = ?auto_50615 ?auto_50612 ) ) ( not ( = ?auto_50615 ?auto_50613 ) ) ( not ( = ?auto_50615 ?auto_50614 ) ) ( IN-CITY ?auto_50618 ?auto_50617 ) ( IN-CITY ?auto_50611 ?auto_50617 ) ( not ( = ?auto_50611 ?auto_50618 ) ) ( OBJ-AT ?auto_50612 ?auto_50611 ) ( OBJ-AT ?auto_50615 ?auto_50618 ) ( OBJ-AT ?auto_50613 ?auto_50618 ) ( IN-CITY ?auto_50616 ?auto_50617 ) ( not ( = ?auto_50611 ?auto_50616 ) ) ( not ( = ?auto_50618 ?auto_50616 ) ) ( OBJ-AT ?auto_50614 ?auto_50616 ) ( TRUCK-AT ?auto_50619 ?auto_50611 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50612 ?auto_50615 ?auto_50611 )
      ( DELIVER-4PKG-VERIFY ?auto_50612 ?auto_50613 ?auto_50614 ?auto_50615 ?auto_50611 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_50641 - OBJ
      ?auto_50642 - OBJ
      ?auto_50643 - OBJ
      ?auto_50644 - OBJ
      ?auto_50640 - LOCATION
    )
    :vars
    (
      ?auto_50647 - LOCATION
      ?auto_50646 - CITY
      ?auto_50645 - LOCATION
      ?auto_50648 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50642 ?auto_50641 ) ) ( not ( = ?auto_50643 ?auto_50641 ) ) ( not ( = ?auto_50643 ?auto_50642 ) ) ( not ( = ?auto_50644 ?auto_50641 ) ) ( not ( = ?auto_50644 ?auto_50642 ) ) ( not ( = ?auto_50644 ?auto_50643 ) ) ( IN-CITY ?auto_50647 ?auto_50646 ) ( IN-CITY ?auto_50640 ?auto_50646 ) ( not ( = ?auto_50640 ?auto_50647 ) ) ( OBJ-AT ?auto_50641 ?auto_50640 ) ( OBJ-AT ?auto_50643 ?auto_50647 ) ( OBJ-AT ?auto_50642 ?auto_50647 ) ( IN-CITY ?auto_50645 ?auto_50646 ) ( not ( = ?auto_50640 ?auto_50645 ) ) ( not ( = ?auto_50647 ?auto_50645 ) ) ( OBJ-AT ?auto_50644 ?auto_50645 ) ( TRUCK-AT ?auto_50648 ?auto_50640 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50641 ?auto_50643 ?auto_50640 )
      ( DELIVER-4PKG-VERIFY ?auto_50641 ?auto_50642 ?auto_50643 ?auto_50644 ?auto_50640 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_50732 - OBJ
      ?auto_50733 - OBJ
      ?auto_50734 - OBJ
      ?auto_50735 - OBJ
      ?auto_50731 - LOCATION
    )
    :vars
    (
      ?auto_50738 - LOCATION
      ?auto_50737 - CITY
      ?auto_50736 - LOCATION
      ?auto_50739 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50733 ?auto_50732 ) ) ( not ( = ?auto_50734 ?auto_50732 ) ) ( not ( = ?auto_50734 ?auto_50733 ) ) ( not ( = ?auto_50735 ?auto_50732 ) ) ( not ( = ?auto_50735 ?auto_50733 ) ) ( not ( = ?auto_50735 ?auto_50734 ) ) ( IN-CITY ?auto_50738 ?auto_50737 ) ( IN-CITY ?auto_50731 ?auto_50737 ) ( not ( = ?auto_50731 ?auto_50738 ) ) ( OBJ-AT ?auto_50732 ?auto_50731 ) ( OBJ-AT ?auto_50733 ?auto_50738 ) ( OBJ-AT ?auto_50735 ?auto_50738 ) ( IN-CITY ?auto_50736 ?auto_50737 ) ( not ( = ?auto_50731 ?auto_50736 ) ) ( not ( = ?auto_50738 ?auto_50736 ) ) ( OBJ-AT ?auto_50734 ?auto_50736 ) ( TRUCK-AT ?auto_50739 ?auto_50731 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50732 ?auto_50733 ?auto_50731 )
      ( DELIVER-4PKG-VERIFY ?auto_50732 ?auto_50733 ?auto_50734 ?auto_50735 ?auto_50731 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_50761 - OBJ
      ?auto_50762 - OBJ
      ?auto_50763 - OBJ
      ?auto_50764 - OBJ
      ?auto_50760 - LOCATION
    )
    :vars
    (
      ?auto_50767 - LOCATION
      ?auto_50766 - CITY
      ?auto_50765 - LOCATION
      ?auto_50768 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50762 ?auto_50761 ) ) ( not ( = ?auto_50763 ?auto_50761 ) ) ( not ( = ?auto_50763 ?auto_50762 ) ) ( not ( = ?auto_50764 ?auto_50761 ) ) ( not ( = ?auto_50764 ?auto_50762 ) ) ( not ( = ?auto_50764 ?auto_50763 ) ) ( IN-CITY ?auto_50767 ?auto_50766 ) ( IN-CITY ?auto_50760 ?auto_50766 ) ( not ( = ?auto_50760 ?auto_50767 ) ) ( OBJ-AT ?auto_50761 ?auto_50760 ) ( OBJ-AT ?auto_50762 ?auto_50767 ) ( OBJ-AT ?auto_50763 ?auto_50767 ) ( IN-CITY ?auto_50765 ?auto_50766 ) ( not ( = ?auto_50760 ?auto_50765 ) ) ( not ( = ?auto_50767 ?auto_50765 ) ) ( OBJ-AT ?auto_50764 ?auto_50765 ) ( TRUCK-AT ?auto_50768 ?auto_50760 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50761 ?auto_50762 ?auto_50760 )
      ( DELIVER-4PKG-VERIFY ?auto_50761 ?auto_50762 ?auto_50763 ?auto_50764 ?auto_50760 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_50852 - OBJ
      ?auto_50853 - OBJ
      ?auto_50854 - OBJ
      ?auto_50855 - OBJ
      ?auto_50851 - LOCATION
    )
    :vars
    (
      ?auto_50858 - LOCATION
      ?auto_50857 - CITY
      ?auto_50856 - LOCATION
      ?auto_50859 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50853 ?auto_50852 ) ) ( not ( = ?auto_50854 ?auto_50852 ) ) ( not ( = ?auto_50854 ?auto_50853 ) ) ( not ( = ?auto_50855 ?auto_50852 ) ) ( not ( = ?auto_50855 ?auto_50853 ) ) ( not ( = ?auto_50855 ?auto_50854 ) ) ( IN-CITY ?auto_50858 ?auto_50857 ) ( IN-CITY ?auto_50851 ?auto_50857 ) ( not ( = ?auto_50851 ?auto_50858 ) ) ( OBJ-AT ?auto_50853 ?auto_50851 ) ( OBJ-AT ?auto_50855 ?auto_50858 ) ( OBJ-AT ?auto_50854 ?auto_50858 ) ( IN-CITY ?auto_50856 ?auto_50857 ) ( not ( = ?auto_50851 ?auto_50856 ) ) ( not ( = ?auto_50858 ?auto_50856 ) ) ( OBJ-AT ?auto_50852 ?auto_50856 ) ( TRUCK-AT ?auto_50859 ?auto_50851 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50853 ?auto_50855 ?auto_50851 )
      ( DELIVER-4PKG-VERIFY ?auto_50852 ?auto_50853 ?auto_50854 ?auto_50855 ?auto_50851 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_50881 - OBJ
      ?auto_50882 - OBJ
      ?auto_50883 - OBJ
      ?auto_50884 - OBJ
      ?auto_50880 - LOCATION
    )
    :vars
    (
      ?auto_50887 - LOCATION
      ?auto_50886 - CITY
      ?auto_50885 - LOCATION
      ?auto_50888 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50882 ?auto_50881 ) ) ( not ( = ?auto_50883 ?auto_50881 ) ) ( not ( = ?auto_50883 ?auto_50882 ) ) ( not ( = ?auto_50884 ?auto_50881 ) ) ( not ( = ?auto_50884 ?auto_50882 ) ) ( not ( = ?auto_50884 ?auto_50883 ) ) ( IN-CITY ?auto_50887 ?auto_50886 ) ( IN-CITY ?auto_50880 ?auto_50886 ) ( not ( = ?auto_50880 ?auto_50887 ) ) ( OBJ-AT ?auto_50882 ?auto_50880 ) ( OBJ-AT ?auto_50883 ?auto_50887 ) ( OBJ-AT ?auto_50884 ?auto_50887 ) ( IN-CITY ?auto_50885 ?auto_50886 ) ( not ( = ?auto_50880 ?auto_50885 ) ) ( not ( = ?auto_50887 ?auto_50885 ) ) ( OBJ-AT ?auto_50881 ?auto_50885 ) ( TRUCK-AT ?auto_50888 ?auto_50880 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50882 ?auto_50883 ?auto_50880 )
      ( DELIVER-4PKG-VERIFY ?auto_50881 ?auto_50882 ?auto_50883 ?auto_50884 ?auto_50880 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_50973 - OBJ
      ?auto_50974 - OBJ
      ?auto_50975 - OBJ
      ?auto_50976 - OBJ
      ?auto_50972 - LOCATION
    )
    :vars
    (
      ?auto_50979 - LOCATION
      ?auto_50978 - CITY
      ?auto_50977 - LOCATION
      ?auto_50980 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_50974 ?auto_50973 ) ) ( not ( = ?auto_50975 ?auto_50973 ) ) ( not ( = ?auto_50975 ?auto_50974 ) ) ( not ( = ?auto_50976 ?auto_50973 ) ) ( not ( = ?auto_50976 ?auto_50974 ) ) ( not ( = ?auto_50976 ?auto_50975 ) ) ( IN-CITY ?auto_50979 ?auto_50978 ) ( IN-CITY ?auto_50972 ?auto_50978 ) ( not ( = ?auto_50972 ?auto_50979 ) ) ( OBJ-AT ?auto_50975 ?auto_50972 ) ( OBJ-AT ?auto_50976 ?auto_50979 ) ( OBJ-AT ?auto_50974 ?auto_50979 ) ( IN-CITY ?auto_50977 ?auto_50978 ) ( not ( = ?auto_50972 ?auto_50977 ) ) ( not ( = ?auto_50979 ?auto_50977 ) ) ( OBJ-AT ?auto_50973 ?auto_50977 ) ( TRUCK-AT ?auto_50980 ?auto_50972 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_50975 ?auto_50976 ?auto_50972 )
      ( DELIVER-4PKG-VERIFY ?auto_50973 ?auto_50974 ?auto_50975 ?auto_50976 ?auto_50972 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_51002 - OBJ
      ?auto_51003 - OBJ
      ?auto_51004 - OBJ
      ?auto_51005 - OBJ
      ?auto_51001 - LOCATION
    )
    :vars
    (
      ?auto_51008 - LOCATION
      ?auto_51007 - CITY
      ?auto_51006 - LOCATION
      ?auto_51009 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_51003 ?auto_51002 ) ) ( not ( = ?auto_51004 ?auto_51002 ) ) ( not ( = ?auto_51004 ?auto_51003 ) ) ( not ( = ?auto_51005 ?auto_51002 ) ) ( not ( = ?auto_51005 ?auto_51003 ) ) ( not ( = ?auto_51005 ?auto_51004 ) ) ( IN-CITY ?auto_51008 ?auto_51007 ) ( IN-CITY ?auto_51001 ?auto_51007 ) ( not ( = ?auto_51001 ?auto_51008 ) ) ( OBJ-AT ?auto_51005 ?auto_51001 ) ( OBJ-AT ?auto_51004 ?auto_51008 ) ( OBJ-AT ?auto_51003 ?auto_51008 ) ( IN-CITY ?auto_51006 ?auto_51007 ) ( not ( = ?auto_51001 ?auto_51006 ) ) ( not ( = ?auto_51008 ?auto_51006 ) ) ( OBJ-AT ?auto_51002 ?auto_51006 ) ( TRUCK-AT ?auto_51009 ?auto_51001 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_51005 ?auto_51004 ?auto_51001 )
      ( DELIVER-4PKG-VERIFY ?auto_51002 ?auto_51003 ?auto_51004 ?auto_51005 ?auto_51001 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_51061 - OBJ
      ?auto_51062 - OBJ
      ?auto_51063 - OBJ
      ?auto_51064 - OBJ
      ?auto_51060 - LOCATION
    )
    :vars
    (
      ?auto_51067 - LOCATION
      ?auto_51066 - CITY
      ?auto_51065 - LOCATION
      ?auto_51068 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_51062 ?auto_51061 ) ) ( not ( = ?auto_51063 ?auto_51061 ) ) ( not ( = ?auto_51063 ?auto_51062 ) ) ( not ( = ?auto_51064 ?auto_51061 ) ) ( not ( = ?auto_51064 ?auto_51062 ) ) ( not ( = ?auto_51064 ?auto_51063 ) ) ( IN-CITY ?auto_51067 ?auto_51066 ) ( IN-CITY ?auto_51060 ?auto_51066 ) ( not ( = ?auto_51060 ?auto_51067 ) ) ( OBJ-AT ?auto_51063 ?auto_51060 ) ( OBJ-AT ?auto_51062 ?auto_51067 ) ( OBJ-AT ?auto_51064 ?auto_51067 ) ( IN-CITY ?auto_51065 ?auto_51066 ) ( not ( = ?auto_51060 ?auto_51065 ) ) ( not ( = ?auto_51067 ?auto_51065 ) ) ( OBJ-AT ?auto_51061 ?auto_51065 ) ( TRUCK-AT ?auto_51068 ?auto_51060 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_51063 ?auto_51062 ?auto_51060 )
      ( DELIVER-4PKG-VERIFY ?auto_51061 ?auto_51062 ?auto_51063 ?auto_51064 ?auto_51060 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_51122 - OBJ
      ?auto_51123 - OBJ
      ?auto_51124 - OBJ
      ?auto_51125 - OBJ
      ?auto_51121 - LOCATION
    )
    :vars
    (
      ?auto_51128 - LOCATION
      ?auto_51127 - CITY
      ?auto_51126 - LOCATION
      ?auto_51129 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_51123 ?auto_51122 ) ) ( not ( = ?auto_51124 ?auto_51122 ) ) ( not ( = ?auto_51124 ?auto_51123 ) ) ( not ( = ?auto_51125 ?auto_51122 ) ) ( not ( = ?auto_51125 ?auto_51123 ) ) ( not ( = ?auto_51125 ?auto_51124 ) ) ( IN-CITY ?auto_51128 ?auto_51127 ) ( IN-CITY ?auto_51121 ?auto_51127 ) ( not ( = ?auto_51121 ?auto_51128 ) ) ( OBJ-AT ?auto_51125 ?auto_51121 ) ( OBJ-AT ?auto_51123 ?auto_51128 ) ( OBJ-AT ?auto_51124 ?auto_51128 ) ( IN-CITY ?auto_51126 ?auto_51127 ) ( not ( = ?auto_51121 ?auto_51126 ) ) ( not ( = ?auto_51128 ?auto_51126 ) ) ( OBJ-AT ?auto_51122 ?auto_51126 ) ( TRUCK-AT ?auto_51129 ?auto_51121 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_51125 ?auto_51123 ?auto_51121 )
      ( DELIVER-4PKG-VERIFY ?auto_51122 ?auto_51123 ?auto_51124 ?auto_51125 ?auto_51121 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_51213 - OBJ
      ?auto_51214 - OBJ
      ?auto_51215 - OBJ
      ?auto_51216 - OBJ
      ?auto_51212 - LOCATION
    )
    :vars
    (
      ?auto_51219 - LOCATION
      ?auto_51218 - CITY
      ?auto_51217 - LOCATION
      ?auto_51220 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_51214 ?auto_51213 ) ) ( not ( = ?auto_51215 ?auto_51213 ) ) ( not ( = ?auto_51215 ?auto_51214 ) ) ( not ( = ?auto_51216 ?auto_51213 ) ) ( not ( = ?auto_51216 ?auto_51214 ) ) ( not ( = ?auto_51216 ?auto_51215 ) ) ( IN-CITY ?auto_51219 ?auto_51218 ) ( IN-CITY ?auto_51212 ?auto_51218 ) ( not ( = ?auto_51212 ?auto_51219 ) ) ( OBJ-AT ?auto_51214 ?auto_51212 ) ( OBJ-AT ?auto_51216 ?auto_51219 ) ( OBJ-AT ?auto_51213 ?auto_51219 ) ( IN-CITY ?auto_51217 ?auto_51218 ) ( not ( = ?auto_51212 ?auto_51217 ) ) ( not ( = ?auto_51219 ?auto_51217 ) ) ( OBJ-AT ?auto_51215 ?auto_51217 ) ( TRUCK-AT ?auto_51220 ?auto_51212 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_51214 ?auto_51216 ?auto_51212 )
      ( DELIVER-4PKG-VERIFY ?auto_51213 ?auto_51214 ?auto_51215 ?auto_51216 ?auto_51212 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_51242 - OBJ
      ?auto_51243 - OBJ
      ?auto_51244 - OBJ
      ?auto_51245 - OBJ
      ?auto_51241 - LOCATION
    )
    :vars
    (
      ?auto_51248 - LOCATION
      ?auto_51247 - CITY
      ?auto_51246 - LOCATION
      ?auto_51249 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_51243 ?auto_51242 ) ) ( not ( = ?auto_51244 ?auto_51242 ) ) ( not ( = ?auto_51244 ?auto_51243 ) ) ( not ( = ?auto_51245 ?auto_51242 ) ) ( not ( = ?auto_51245 ?auto_51243 ) ) ( not ( = ?auto_51245 ?auto_51244 ) ) ( IN-CITY ?auto_51248 ?auto_51247 ) ( IN-CITY ?auto_51241 ?auto_51247 ) ( not ( = ?auto_51241 ?auto_51248 ) ) ( OBJ-AT ?auto_51243 ?auto_51241 ) ( OBJ-AT ?auto_51244 ?auto_51248 ) ( OBJ-AT ?auto_51242 ?auto_51248 ) ( IN-CITY ?auto_51246 ?auto_51247 ) ( not ( = ?auto_51241 ?auto_51246 ) ) ( not ( = ?auto_51248 ?auto_51246 ) ) ( OBJ-AT ?auto_51245 ?auto_51246 ) ( TRUCK-AT ?auto_51249 ?auto_51241 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_51243 ?auto_51244 ?auto_51241 )
      ( DELIVER-4PKG-VERIFY ?auto_51242 ?auto_51243 ?auto_51244 ?auto_51245 ?auto_51241 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_51271 - OBJ
      ?auto_51272 - OBJ
      ?auto_51273 - OBJ
      ?auto_51274 - OBJ
      ?auto_51270 - LOCATION
    )
    :vars
    (
      ?auto_51277 - LOCATION
      ?auto_51276 - CITY
      ?auto_51275 - LOCATION
      ?auto_51278 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_51272 ?auto_51271 ) ) ( not ( = ?auto_51273 ?auto_51271 ) ) ( not ( = ?auto_51273 ?auto_51272 ) ) ( not ( = ?auto_51274 ?auto_51271 ) ) ( not ( = ?auto_51274 ?auto_51272 ) ) ( not ( = ?auto_51274 ?auto_51273 ) ) ( IN-CITY ?auto_51277 ?auto_51276 ) ( IN-CITY ?auto_51270 ?auto_51276 ) ( not ( = ?auto_51270 ?auto_51277 ) ) ( OBJ-AT ?auto_51273 ?auto_51270 ) ( OBJ-AT ?auto_51274 ?auto_51277 ) ( OBJ-AT ?auto_51271 ?auto_51277 ) ( IN-CITY ?auto_51275 ?auto_51276 ) ( not ( = ?auto_51270 ?auto_51275 ) ) ( not ( = ?auto_51277 ?auto_51275 ) ) ( OBJ-AT ?auto_51272 ?auto_51275 ) ( TRUCK-AT ?auto_51278 ?auto_51270 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_51273 ?auto_51274 ?auto_51270 )
      ( DELIVER-4PKG-VERIFY ?auto_51271 ?auto_51272 ?auto_51273 ?auto_51274 ?auto_51270 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_51300 - OBJ
      ?auto_51301 - OBJ
      ?auto_51302 - OBJ
      ?auto_51303 - OBJ
      ?auto_51299 - LOCATION
    )
    :vars
    (
      ?auto_51306 - LOCATION
      ?auto_51305 - CITY
      ?auto_51304 - LOCATION
      ?auto_51307 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_51301 ?auto_51300 ) ) ( not ( = ?auto_51302 ?auto_51300 ) ) ( not ( = ?auto_51302 ?auto_51301 ) ) ( not ( = ?auto_51303 ?auto_51300 ) ) ( not ( = ?auto_51303 ?auto_51301 ) ) ( not ( = ?auto_51303 ?auto_51302 ) ) ( IN-CITY ?auto_51306 ?auto_51305 ) ( IN-CITY ?auto_51299 ?auto_51305 ) ( not ( = ?auto_51299 ?auto_51306 ) ) ( OBJ-AT ?auto_51303 ?auto_51299 ) ( OBJ-AT ?auto_51302 ?auto_51306 ) ( OBJ-AT ?auto_51300 ?auto_51306 ) ( IN-CITY ?auto_51304 ?auto_51305 ) ( not ( = ?auto_51299 ?auto_51304 ) ) ( not ( = ?auto_51306 ?auto_51304 ) ) ( OBJ-AT ?auto_51301 ?auto_51304 ) ( TRUCK-AT ?auto_51307 ?auto_51299 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_51303 ?auto_51302 ?auto_51299 )
      ( DELIVER-4PKG-VERIFY ?auto_51300 ?auto_51301 ?auto_51302 ?auto_51303 ?auto_51299 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_51422 - OBJ
      ?auto_51423 - OBJ
      ?auto_51424 - OBJ
      ?auto_51425 - OBJ
      ?auto_51421 - LOCATION
    )
    :vars
    (
      ?auto_51428 - LOCATION
      ?auto_51427 - CITY
      ?auto_51426 - LOCATION
      ?auto_51429 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_51423 ?auto_51422 ) ) ( not ( = ?auto_51424 ?auto_51422 ) ) ( not ( = ?auto_51424 ?auto_51423 ) ) ( not ( = ?auto_51425 ?auto_51422 ) ) ( not ( = ?auto_51425 ?auto_51423 ) ) ( not ( = ?auto_51425 ?auto_51424 ) ) ( IN-CITY ?auto_51428 ?auto_51427 ) ( IN-CITY ?auto_51421 ?auto_51427 ) ( not ( = ?auto_51421 ?auto_51428 ) ) ( OBJ-AT ?auto_51424 ?auto_51421 ) ( OBJ-AT ?auto_51423 ?auto_51428 ) ( OBJ-AT ?auto_51422 ?auto_51428 ) ( IN-CITY ?auto_51426 ?auto_51427 ) ( not ( = ?auto_51421 ?auto_51426 ) ) ( not ( = ?auto_51428 ?auto_51426 ) ) ( OBJ-AT ?auto_51425 ?auto_51426 ) ( TRUCK-AT ?auto_51429 ?auto_51421 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_51424 ?auto_51423 ?auto_51421 )
      ( DELIVER-4PKG-VERIFY ?auto_51422 ?auto_51423 ?auto_51424 ?auto_51425 ?auto_51421 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_51451 - OBJ
      ?auto_51452 - OBJ
      ?auto_51453 - OBJ
      ?auto_51454 - OBJ
      ?auto_51450 - LOCATION
    )
    :vars
    (
      ?auto_51457 - LOCATION
      ?auto_51456 - CITY
      ?auto_51455 - LOCATION
      ?auto_51458 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_51452 ?auto_51451 ) ) ( not ( = ?auto_51453 ?auto_51451 ) ) ( not ( = ?auto_51453 ?auto_51452 ) ) ( not ( = ?auto_51454 ?auto_51451 ) ) ( not ( = ?auto_51454 ?auto_51452 ) ) ( not ( = ?auto_51454 ?auto_51453 ) ) ( IN-CITY ?auto_51457 ?auto_51456 ) ( IN-CITY ?auto_51450 ?auto_51456 ) ( not ( = ?auto_51450 ?auto_51457 ) ) ( OBJ-AT ?auto_51454 ?auto_51450 ) ( OBJ-AT ?auto_51452 ?auto_51457 ) ( OBJ-AT ?auto_51451 ?auto_51457 ) ( IN-CITY ?auto_51455 ?auto_51456 ) ( not ( = ?auto_51450 ?auto_51455 ) ) ( not ( = ?auto_51457 ?auto_51455 ) ) ( OBJ-AT ?auto_51453 ?auto_51455 ) ( TRUCK-AT ?auto_51458 ?auto_51450 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_51454 ?auto_51452 ?auto_51450 )
      ( DELIVER-4PKG-VERIFY ?auto_51451 ?auto_51452 ?auto_51453 ?auto_51454 ?auto_51450 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_51636 - OBJ
      ?auto_51637 - OBJ
      ?auto_51638 - OBJ
      ?auto_51639 - OBJ
      ?auto_51635 - LOCATION
    )
    :vars
    (
      ?auto_51642 - LOCATION
      ?auto_51641 - CITY
      ?auto_51640 - LOCATION
      ?auto_51643 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_51637 ?auto_51636 ) ) ( not ( = ?auto_51638 ?auto_51636 ) ) ( not ( = ?auto_51638 ?auto_51637 ) ) ( not ( = ?auto_51639 ?auto_51636 ) ) ( not ( = ?auto_51639 ?auto_51637 ) ) ( not ( = ?auto_51639 ?auto_51638 ) ) ( IN-CITY ?auto_51642 ?auto_51641 ) ( IN-CITY ?auto_51635 ?auto_51641 ) ( not ( = ?auto_51635 ?auto_51642 ) ) ( OBJ-AT ?auto_51637 ?auto_51635 ) ( OBJ-AT ?auto_51636 ?auto_51642 ) ( OBJ-AT ?auto_51639 ?auto_51642 ) ( IN-CITY ?auto_51640 ?auto_51641 ) ( not ( = ?auto_51635 ?auto_51640 ) ) ( not ( = ?auto_51642 ?auto_51640 ) ) ( OBJ-AT ?auto_51638 ?auto_51640 ) ( TRUCK-AT ?auto_51643 ?auto_51635 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_51637 ?auto_51636 ?auto_51635 )
      ( DELIVER-4PKG-VERIFY ?auto_51636 ?auto_51637 ?auto_51638 ?auto_51639 ?auto_51635 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_51665 - OBJ
      ?auto_51666 - OBJ
      ?auto_51667 - OBJ
      ?auto_51668 - OBJ
      ?auto_51664 - LOCATION
    )
    :vars
    (
      ?auto_51671 - LOCATION
      ?auto_51670 - CITY
      ?auto_51669 - LOCATION
      ?auto_51672 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_51666 ?auto_51665 ) ) ( not ( = ?auto_51667 ?auto_51665 ) ) ( not ( = ?auto_51667 ?auto_51666 ) ) ( not ( = ?auto_51668 ?auto_51665 ) ) ( not ( = ?auto_51668 ?auto_51666 ) ) ( not ( = ?auto_51668 ?auto_51667 ) ) ( IN-CITY ?auto_51671 ?auto_51670 ) ( IN-CITY ?auto_51664 ?auto_51670 ) ( not ( = ?auto_51664 ?auto_51671 ) ) ( OBJ-AT ?auto_51666 ?auto_51664 ) ( OBJ-AT ?auto_51665 ?auto_51671 ) ( OBJ-AT ?auto_51667 ?auto_51671 ) ( IN-CITY ?auto_51669 ?auto_51670 ) ( not ( = ?auto_51664 ?auto_51669 ) ) ( not ( = ?auto_51671 ?auto_51669 ) ) ( OBJ-AT ?auto_51668 ?auto_51669 ) ( TRUCK-AT ?auto_51672 ?auto_51664 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_51666 ?auto_51665 ?auto_51664 )
      ( DELIVER-4PKG-VERIFY ?auto_51665 ?auto_51666 ?auto_51667 ?auto_51668 ?auto_51664 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_51756 - OBJ
      ?auto_51757 - OBJ
      ?auto_51758 - OBJ
      ?auto_51759 - OBJ
      ?auto_51755 - LOCATION
    )
    :vars
    (
      ?auto_51762 - LOCATION
      ?auto_51761 - CITY
      ?auto_51760 - LOCATION
      ?auto_51763 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_51757 ?auto_51756 ) ) ( not ( = ?auto_51758 ?auto_51756 ) ) ( not ( = ?auto_51758 ?auto_51757 ) ) ( not ( = ?auto_51759 ?auto_51756 ) ) ( not ( = ?auto_51759 ?auto_51757 ) ) ( not ( = ?auto_51759 ?auto_51758 ) ) ( IN-CITY ?auto_51762 ?auto_51761 ) ( IN-CITY ?auto_51755 ?auto_51761 ) ( not ( = ?auto_51755 ?auto_51762 ) ) ( OBJ-AT ?auto_51758 ?auto_51755 ) ( OBJ-AT ?auto_51756 ?auto_51762 ) ( OBJ-AT ?auto_51759 ?auto_51762 ) ( IN-CITY ?auto_51760 ?auto_51761 ) ( not ( = ?auto_51755 ?auto_51760 ) ) ( not ( = ?auto_51762 ?auto_51760 ) ) ( OBJ-AT ?auto_51757 ?auto_51760 ) ( TRUCK-AT ?auto_51763 ?auto_51755 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_51758 ?auto_51756 ?auto_51755 )
      ( DELIVER-4PKG-VERIFY ?auto_51756 ?auto_51757 ?auto_51758 ?auto_51759 ?auto_51755 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_51817 - OBJ
      ?auto_51818 - OBJ
      ?auto_51819 - OBJ
      ?auto_51820 - OBJ
      ?auto_51816 - LOCATION
    )
    :vars
    (
      ?auto_51823 - LOCATION
      ?auto_51822 - CITY
      ?auto_51821 - LOCATION
      ?auto_51824 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_51818 ?auto_51817 ) ) ( not ( = ?auto_51819 ?auto_51817 ) ) ( not ( = ?auto_51819 ?auto_51818 ) ) ( not ( = ?auto_51820 ?auto_51817 ) ) ( not ( = ?auto_51820 ?auto_51818 ) ) ( not ( = ?auto_51820 ?auto_51819 ) ) ( IN-CITY ?auto_51823 ?auto_51822 ) ( IN-CITY ?auto_51816 ?auto_51822 ) ( not ( = ?auto_51816 ?auto_51823 ) ) ( OBJ-AT ?auto_51820 ?auto_51816 ) ( OBJ-AT ?auto_51817 ?auto_51823 ) ( OBJ-AT ?auto_51819 ?auto_51823 ) ( IN-CITY ?auto_51821 ?auto_51822 ) ( not ( = ?auto_51816 ?auto_51821 ) ) ( not ( = ?auto_51823 ?auto_51821 ) ) ( OBJ-AT ?auto_51818 ?auto_51821 ) ( TRUCK-AT ?auto_51824 ?auto_51816 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_51820 ?auto_51817 ?auto_51816 )
      ( DELIVER-4PKG-VERIFY ?auto_51817 ?auto_51818 ?auto_51819 ?auto_51820 ?auto_51816 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_51908 - OBJ
      ?auto_51909 - OBJ
      ?auto_51910 - OBJ
      ?auto_51911 - OBJ
      ?auto_51907 - LOCATION
    )
    :vars
    (
      ?auto_51914 - LOCATION
      ?auto_51913 - CITY
      ?auto_51912 - LOCATION
      ?auto_51915 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_51909 ?auto_51908 ) ) ( not ( = ?auto_51910 ?auto_51908 ) ) ( not ( = ?auto_51910 ?auto_51909 ) ) ( not ( = ?auto_51911 ?auto_51908 ) ) ( not ( = ?auto_51911 ?auto_51909 ) ) ( not ( = ?auto_51911 ?auto_51910 ) ) ( IN-CITY ?auto_51914 ?auto_51913 ) ( IN-CITY ?auto_51907 ?auto_51913 ) ( not ( = ?auto_51907 ?auto_51914 ) ) ( OBJ-AT ?auto_51910 ?auto_51907 ) ( OBJ-AT ?auto_51908 ?auto_51914 ) ( OBJ-AT ?auto_51909 ?auto_51914 ) ( IN-CITY ?auto_51912 ?auto_51913 ) ( not ( = ?auto_51907 ?auto_51912 ) ) ( not ( = ?auto_51914 ?auto_51912 ) ) ( OBJ-AT ?auto_51911 ?auto_51912 ) ( TRUCK-AT ?auto_51915 ?auto_51907 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_51910 ?auto_51908 ?auto_51907 )
      ( DELIVER-4PKG-VERIFY ?auto_51908 ?auto_51909 ?auto_51910 ?auto_51911 ?auto_51907 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_51937 - OBJ
      ?auto_51938 - OBJ
      ?auto_51939 - OBJ
      ?auto_51940 - OBJ
      ?auto_51936 - LOCATION
    )
    :vars
    (
      ?auto_51943 - LOCATION
      ?auto_51942 - CITY
      ?auto_51941 - LOCATION
      ?auto_51944 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_51938 ?auto_51937 ) ) ( not ( = ?auto_51939 ?auto_51937 ) ) ( not ( = ?auto_51939 ?auto_51938 ) ) ( not ( = ?auto_51940 ?auto_51937 ) ) ( not ( = ?auto_51940 ?auto_51938 ) ) ( not ( = ?auto_51940 ?auto_51939 ) ) ( IN-CITY ?auto_51943 ?auto_51942 ) ( IN-CITY ?auto_51936 ?auto_51942 ) ( not ( = ?auto_51936 ?auto_51943 ) ) ( OBJ-AT ?auto_51940 ?auto_51936 ) ( OBJ-AT ?auto_51937 ?auto_51943 ) ( OBJ-AT ?auto_51938 ?auto_51943 ) ( IN-CITY ?auto_51941 ?auto_51942 ) ( not ( = ?auto_51936 ?auto_51941 ) ) ( not ( = ?auto_51943 ?auto_51941 ) ) ( OBJ-AT ?auto_51939 ?auto_51941 ) ( TRUCK-AT ?auto_51944 ?auto_51936 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_51940 ?auto_51937 ?auto_51936 )
      ( DELIVER-4PKG-VERIFY ?auto_51937 ?auto_51938 ?auto_51939 ?auto_51940 ?auto_51936 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_52231 - OBJ
      ?auto_52230 - LOCATION
    )
    :vars
    (
      ?auto_52238 - OBJ
      ?auto_52236 - LOCATION
      ?auto_52233 - CITY
      ?auto_52234 - OBJ
      ?auto_52235 - OBJ
      ?auto_52232 - LOCATION
      ?auto_52237 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52231 ?auto_52238 ) ) ( IN-CITY ?auto_52236 ?auto_52233 ) ( IN-CITY ?auto_52230 ?auto_52233 ) ( not ( = ?auto_52230 ?auto_52236 ) ) ( OBJ-AT ?auto_52231 ?auto_52236 ) ( not ( = ?auto_52234 ?auto_52238 ) ) ( not ( = ?auto_52231 ?auto_52234 ) ) ( OBJ-AT ?auto_52234 ?auto_52236 ) ( not ( = ?auto_52235 ?auto_52238 ) ) ( not ( = ?auto_52231 ?auto_52235 ) ) ( not ( = ?auto_52234 ?auto_52235 ) ) ( IN-CITY ?auto_52232 ?auto_52233 ) ( not ( = ?auto_52230 ?auto_52232 ) ) ( not ( = ?auto_52236 ?auto_52232 ) ) ( OBJ-AT ?auto_52235 ?auto_52232 ) ( TRUCK-AT ?auto_52237 ?auto_52230 ) ( IN-TRUCK ?auto_52238 ?auto_52237 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_52238 ?auto_52230 )
      ( DELIVER-2PKG ?auto_52238 ?auto_52231 ?auto_52230 )
      ( DELIVER-1PKG-VERIFY ?auto_52231 ?auto_52230 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_52240 - OBJ
      ?auto_52241 - OBJ
      ?auto_52239 - LOCATION
    )
    :vars
    (
      ?auto_52245 - LOCATION
      ?auto_52243 - CITY
      ?auto_52246 - OBJ
      ?auto_52244 - OBJ
      ?auto_52247 - LOCATION
      ?auto_52242 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52241 ?auto_52240 ) ) ( IN-CITY ?auto_52245 ?auto_52243 ) ( IN-CITY ?auto_52239 ?auto_52243 ) ( not ( = ?auto_52239 ?auto_52245 ) ) ( OBJ-AT ?auto_52241 ?auto_52245 ) ( not ( = ?auto_52246 ?auto_52240 ) ) ( not ( = ?auto_52241 ?auto_52246 ) ) ( OBJ-AT ?auto_52246 ?auto_52245 ) ( not ( = ?auto_52244 ?auto_52240 ) ) ( not ( = ?auto_52241 ?auto_52244 ) ) ( not ( = ?auto_52246 ?auto_52244 ) ) ( IN-CITY ?auto_52247 ?auto_52243 ) ( not ( = ?auto_52239 ?auto_52247 ) ) ( not ( = ?auto_52245 ?auto_52247 ) ) ( OBJ-AT ?auto_52244 ?auto_52247 ) ( TRUCK-AT ?auto_52242 ?auto_52239 ) ( IN-TRUCK ?auto_52240 ?auto_52242 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_52241 ?auto_52239 )
      ( DELIVER-2PKG-VERIFY ?auto_52240 ?auto_52241 ?auto_52239 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_52249 - OBJ
      ?auto_52250 - OBJ
      ?auto_52248 - LOCATION
    )
    :vars
    (
      ?auto_52256 - OBJ
      ?auto_52253 - LOCATION
      ?auto_52255 - CITY
      ?auto_52252 - OBJ
      ?auto_52254 - LOCATION
      ?auto_52251 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52250 ?auto_52249 ) ) ( not ( = ?auto_52250 ?auto_52256 ) ) ( IN-CITY ?auto_52253 ?auto_52255 ) ( IN-CITY ?auto_52248 ?auto_52255 ) ( not ( = ?auto_52248 ?auto_52253 ) ) ( OBJ-AT ?auto_52250 ?auto_52253 ) ( not ( = ?auto_52252 ?auto_52256 ) ) ( not ( = ?auto_52250 ?auto_52252 ) ) ( OBJ-AT ?auto_52252 ?auto_52253 ) ( not ( = ?auto_52249 ?auto_52256 ) ) ( not ( = ?auto_52252 ?auto_52249 ) ) ( IN-CITY ?auto_52254 ?auto_52255 ) ( not ( = ?auto_52248 ?auto_52254 ) ) ( not ( = ?auto_52253 ?auto_52254 ) ) ( OBJ-AT ?auto_52249 ?auto_52254 ) ( TRUCK-AT ?auto_52251 ?auto_52248 ) ( IN-TRUCK ?auto_52256 ?auto_52251 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52256 ?auto_52250 ?auto_52248 )
      ( DELIVER-2PKG-VERIFY ?auto_52249 ?auto_52250 ?auto_52248 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_52258 - OBJ
      ?auto_52259 - OBJ
      ?auto_52257 - LOCATION
    )
    :vars
    (
      ?auto_52265 - OBJ
      ?auto_52262 - LOCATION
      ?auto_52264 - CITY
      ?auto_52260 - OBJ
      ?auto_52263 - LOCATION
      ?auto_52261 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52259 ?auto_52258 ) ) ( not ( = ?auto_52259 ?auto_52265 ) ) ( IN-CITY ?auto_52262 ?auto_52264 ) ( IN-CITY ?auto_52257 ?auto_52264 ) ( not ( = ?auto_52257 ?auto_52262 ) ) ( OBJ-AT ?auto_52259 ?auto_52262 ) ( not ( = ?auto_52258 ?auto_52265 ) ) ( OBJ-AT ?auto_52258 ?auto_52262 ) ( not ( = ?auto_52260 ?auto_52265 ) ) ( not ( = ?auto_52259 ?auto_52260 ) ) ( not ( = ?auto_52258 ?auto_52260 ) ) ( IN-CITY ?auto_52263 ?auto_52264 ) ( not ( = ?auto_52257 ?auto_52263 ) ) ( not ( = ?auto_52262 ?auto_52263 ) ) ( OBJ-AT ?auto_52260 ?auto_52263 ) ( TRUCK-AT ?auto_52261 ?auto_52257 ) ( IN-TRUCK ?auto_52265 ?auto_52261 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52265 ?auto_52259 ?auto_52257 )
      ( DELIVER-2PKG-VERIFY ?auto_52258 ?auto_52259 ?auto_52257 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_52267 - OBJ
      ?auto_52268 - OBJ
      ?auto_52266 - LOCATION
    )
    :vars
    (
      ?auto_52272 - LOCATION
      ?auto_52274 - CITY
      ?auto_52271 - OBJ
      ?auto_52269 - OBJ
      ?auto_52273 - LOCATION
      ?auto_52270 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52268 ?auto_52267 ) ) ( IN-CITY ?auto_52272 ?auto_52274 ) ( IN-CITY ?auto_52266 ?auto_52274 ) ( not ( = ?auto_52266 ?auto_52272 ) ) ( OBJ-AT ?auto_52267 ?auto_52272 ) ( not ( = ?auto_52271 ?auto_52268 ) ) ( not ( = ?auto_52267 ?auto_52271 ) ) ( OBJ-AT ?auto_52271 ?auto_52272 ) ( not ( = ?auto_52269 ?auto_52268 ) ) ( not ( = ?auto_52267 ?auto_52269 ) ) ( not ( = ?auto_52271 ?auto_52269 ) ) ( IN-CITY ?auto_52273 ?auto_52274 ) ( not ( = ?auto_52266 ?auto_52273 ) ) ( not ( = ?auto_52272 ?auto_52273 ) ) ( OBJ-AT ?auto_52269 ?auto_52273 ) ( TRUCK-AT ?auto_52270 ?auto_52266 ) ( IN-TRUCK ?auto_52268 ?auto_52270 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52268 ?auto_52267 ?auto_52266 )
      ( DELIVER-2PKG-VERIFY ?auto_52267 ?auto_52268 ?auto_52266 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_52276 - OBJ
      ?auto_52277 - OBJ
      ?auto_52275 - LOCATION
    )
    :vars
    (
      ?auto_52283 - OBJ
      ?auto_52280 - LOCATION
      ?auto_52282 - CITY
      ?auto_52279 - OBJ
      ?auto_52281 - LOCATION
      ?auto_52278 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52277 ?auto_52276 ) ) ( not ( = ?auto_52276 ?auto_52283 ) ) ( IN-CITY ?auto_52280 ?auto_52282 ) ( IN-CITY ?auto_52275 ?auto_52282 ) ( not ( = ?auto_52275 ?auto_52280 ) ) ( OBJ-AT ?auto_52276 ?auto_52280 ) ( not ( = ?auto_52279 ?auto_52283 ) ) ( not ( = ?auto_52276 ?auto_52279 ) ) ( OBJ-AT ?auto_52279 ?auto_52280 ) ( not ( = ?auto_52277 ?auto_52283 ) ) ( not ( = ?auto_52279 ?auto_52277 ) ) ( IN-CITY ?auto_52281 ?auto_52282 ) ( not ( = ?auto_52275 ?auto_52281 ) ) ( not ( = ?auto_52280 ?auto_52281 ) ) ( OBJ-AT ?auto_52277 ?auto_52281 ) ( TRUCK-AT ?auto_52278 ?auto_52275 ) ( IN-TRUCK ?auto_52283 ?auto_52278 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52283 ?auto_52276 ?auto_52275 )
      ( DELIVER-2PKG-VERIFY ?auto_52276 ?auto_52277 ?auto_52275 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_52285 - OBJ
      ?auto_52286 - OBJ
      ?auto_52284 - LOCATION
    )
    :vars
    (
      ?auto_52292 - OBJ
      ?auto_52289 - LOCATION
      ?auto_52291 - CITY
      ?auto_52287 - OBJ
      ?auto_52290 - LOCATION
      ?auto_52288 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52286 ?auto_52285 ) ) ( not ( = ?auto_52285 ?auto_52292 ) ) ( IN-CITY ?auto_52289 ?auto_52291 ) ( IN-CITY ?auto_52284 ?auto_52291 ) ( not ( = ?auto_52284 ?auto_52289 ) ) ( OBJ-AT ?auto_52285 ?auto_52289 ) ( not ( = ?auto_52286 ?auto_52292 ) ) ( OBJ-AT ?auto_52286 ?auto_52289 ) ( not ( = ?auto_52287 ?auto_52292 ) ) ( not ( = ?auto_52285 ?auto_52287 ) ) ( not ( = ?auto_52286 ?auto_52287 ) ) ( IN-CITY ?auto_52290 ?auto_52291 ) ( not ( = ?auto_52284 ?auto_52290 ) ) ( not ( = ?auto_52289 ?auto_52290 ) ) ( OBJ-AT ?auto_52287 ?auto_52290 ) ( TRUCK-AT ?auto_52288 ?auto_52284 ) ( IN-TRUCK ?auto_52292 ?auto_52288 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52292 ?auto_52285 ?auto_52284 )
      ( DELIVER-2PKG-VERIFY ?auto_52285 ?auto_52286 ?auto_52284 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_52314 - OBJ
      ?auto_52315 - OBJ
      ?auto_52316 - OBJ
      ?auto_52313 - LOCATION
    )
    :vars
    (
      ?auto_52319 - LOCATION
      ?auto_52321 - CITY
      ?auto_52318 - OBJ
      ?auto_52320 - LOCATION
      ?auto_52317 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52315 ?auto_52314 ) ) ( not ( = ?auto_52316 ?auto_52314 ) ) ( not ( = ?auto_52316 ?auto_52315 ) ) ( IN-CITY ?auto_52319 ?auto_52321 ) ( IN-CITY ?auto_52313 ?auto_52321 ) ( not ( = ?auto_52313 ?auto_52319 ) ) ( OBJ-AT ?auto_52316 ?auto_52319 ) ( not ( = ?auto_52318 ?auto_52314 ) ) ( not ( = ?auto_52316 ?auto_52318 ) ) ( OBJ-AT ?auto_52318 ?auto_52319 ) ( not ( = ?auto_52318 ?auto_52315 ) ) ( IN-CITY ?auto_52320 ?auto_52321 ) ( not ( = ?auto_52313 ?auto_52320 ) ) ( not ( = ?auto_52319 ?auto_52320 ) ) ( OBJ-AT ?auto_52315 ?auto_52320 ) ( TRUCK-AT ?auto_52317 ?auto_52313 ) ( IN-TRUCK ?auto_52314 ?auto_52317 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52314 ?auto_52316 ?auto_52313 )
      ( DELIVER-3PKG-VERIFY ?auto_52314 ?auto_52315 ?auto_52316 ?auto_52313 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_52323 - OBJ
      ?auto_52324 - OBJ
      ?auto_52325 - OBJ
      ?auto_52322 - LOCATION
    )
    :vars
    (
      ?auto_52328 - LOCATION
      ?auto_52330 - CITY
      ?auto_52326 - OBJ
      ?auto_52329 - LOCATION
      ?auto_52327 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52324 ?auto_52323 ) ) ( not ( = ?auto_52325 ?auto_52323 ) ) ( not ( = ?auto_52325 ?auto_52324 ) ) ( IN-CITY ?auto_52328 ?auto_52330 ) ( IN-CITY ?auto_52322 ?auto_52330 ) ( not ( = ?auto_52322 ?auto_52328 ) ) ( OBJ-AT ?auto_52325 ?auto_52328 ) ( OBJ-AT ?auto_52324 ?auto_52328 ) ( not ( = ?auto_52326 ?auto_52323 ) ) ( not ( = ?auto_52325 ?auto_52326 ) ) ( not ( = ?auto_52324 ?auto_52326 ) ) ( IN-CITY ?auto_52329 ?auto_52330 ) ( not ( = ?auto_52322 ?auto_52329 ) ) ( not ( = ?auto_52328 ?auto_52329 ) ) ( OBJ-AT ?auto_52326 ?auto_52329 ) ( TRUCK-AT ?auto_52327 ?auto_52322 ) ( IN-TRUCK ?auto_52323 ?auto_52327 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52323 ?auto_52325 ?auto_52322 )
      ( DELIVER-3PKG-VERIFY ?auto_52323 ?auto_52324 ?auto_52325 ?auto_52322 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_52342 - OBJ
      ?auto_52343 - OBJ
      ?auto_52344 - OBJ
      ?auto_52341 - LOCATION
    )
    :vars
    (
      ?auto_52347 - LOCATION
      ?auto_52349 - CITY
      ?auto_52346 - OBJ
      ?auto_52348 - LOCATION
      ?auto_52345 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52343 ?auto_52342 ) ) ( not ( = ?auto_52344 ?auto_52342 ) ) ( not ( = ?auto_52344 ?auto_52343 ) ) ( IN-CITY ?auto_52347 ?auto_52349 ) ( IN-CITY ?auto_52341 ?auto_52349 ) ( not ( = ?auto_52341 ?auto_52347 ) ) ( OBJ-AT ?auto_52343 ?auto_52347 ) ( not ( = ?auto_52346 ?auto_52342 ) ) ( not ( = ?auto_52343 ?auto_52346 ) ) ( OBJ-AT ?auto_52346 ?auto_52347 ) ( not ( = ?auto_52346 ?auto_52344 ) ) ( IN-CITY ?auto_52348 ?auto_52349 ) ( not ( = ?auto_52341 ?auto_52348 ) ) ( not ( = ?auto_52347 ?auto_52348 ) ) ( OBJ-AT ?auto_52344 ?auto_52348 ) ( TRUCK-AT ?auto_52345 ?auto_52341 ) ( IN-TRUCK ?auto_52342 ?auto_52345 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52342 ?auto_52343 ?auto_52341 )
      ( DELIVER-3PKG-VERIFY ?auto_52342 ?auto_52343 ?auto_52344 ?auto_52341 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_52351 - OBJ
      ?auto_52352 - OBJ
      ?auto_52353 - OBJ
      ?auto_52350 - LOCATION
    )
    :vars
    (
      ?auto_52356 - LOCATION
      ?auto_52358 - CITY
      ?auto_52354 - OBJ
      ?auto_52357 - LOCATION
      ?auto_52355 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52352 ?auto_52351 ) ) ( not ( = ?auto_52353 ?auto_52351 ) ) ( not ( = ?auto_52353 ?auto_52352 ) ) ( IN-CITY ?auto_52356 ?auto_52358 ) ( IN-CITY ?auto_52350 ?auto_52358 ) ( not ( = ?auto_52350 ?auto_52356 ) ) ( OBJ-AT ?auto_52352 ?auto_52356 ) ( OBJ-AT ?auto_52353 ?auto_52356 ) ( not ( = ?auto_52354 ?auto_52351 ) ) ( not ( = ?auto_52352 ?auto_52354 ) ) ( not ( = ?auto_52353 ?auto_52354 ) ) ( IN-CITY ?auto_52357 ?auto_52358 ) ( not ( = ?auto_52350 ?auto_52357 ) ) ( not ( = ?auto_52356 ?auto_52357 ) ) ( OBJ-AT ?auto_52354 ?auto_52357 ) ( TRUCK-AT ?auto_52355 ?auto_52350 ) ( IN-TRUCK ?auto_52351 ?auto_52355 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52351 ?auto_52352 ?auto_52350 )
      ( DELIVER-3PKG-VERIFY ?auto_52351 ?auto_52352 ?auto_52353 ?auto_52350 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_52370 - OBJ
      ?auto_52371 - OBJ
      ?auto_52372 - OBJ
      ?auto_52369 - LOCATION
    )
    :vars
    (
      ?auto_52375 - LOCATION
      ?auto_52377 - CITY
      ?auto_52374 - OBJ
      ?auto_52376 - LOCATION
      ?auto_52373 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52371 ?auto_52370 ) ) ( not ( = ?auto_52372 ?auto_52370 ) ) ( not ( = ?auto_52372 ?auto_52371 ) ) ( IN-CITY ?auto_52375 ?auto_52377 ) ( IN-CITY ?auto_52369 ?auto_52377 ) ( not ( = ?auto_52369 ?auto_52375 ) ) ( OBJ-AT ?auto_52372 ?auto_52375 ) ( not ( = ?auto_52374 ?auto_52371 ) ) ( not ( = ?auto_52372 ?auto_52374 ) ) ( OBJ-AT ?auto_52374 ?auto_52375 ) ( not ( = ?auto_52374 ?auto_52370 ) ) ( IN-CITY ?auto_52376 ?auto_52377 ) ( not ( = ?auto_52369 ?auto_52376 ) ) ( not ( = ?auto_52375 ?auto_52376 ) ) ( OBJ-AT ?auto_52370 ?auto_52376 ) ( TRUCK-AT ?auto_52373 ?auto_52369 ) ( IN-TRUCK ?auto_52371 ?auto_52373 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52371 ?auto_52372 ?auto_52369 )
      ( DELIVER-3PKG-VERIFY ?auto_52370 ?auto_52371 ?auto_52372 ?auto_52369 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_52389 - OBJ
      ?auto_52390 - OBJ
      ?auto_52391 - OBJ
      ?auto_52388 - LOCATION
    )
    :vars
    (
      ?auto_52396 - OBJ
      ?auto_52393 - LOCATION
      ?auto_52395 - CITY
      ?auto_52394 - LOCATION
      ?auto_52392 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52390 ?auto_52389 ) ) ( not ( = ?auto_52391 ?auto_52389 ) ) ( not ( = ?auto_52391 ?auto_52390 ) ) ( not ( = ?auto_52391 ?auto_52396 ) ) ( IN-CITY ?auto_52393 ?auto_52395 ) ( IN-CITY ?auto_52388 ?auto_52395 ) ( not ( = ?auto_52388 ?auto_52393 ) ) ( OBJ-AT ?auto_52391 ?auto_52393 ) ( not ( = ?auto_52390 ?auto_52396 ) ) ( OBJ-AT ?auto_52390 ?auto_52393 ) ( not ( = ?auto_52389 ?auto_52396 ) ) ( IN-CITY ?auto_52394 ?auto_52395 ) ( not ( = ?auto_52388 ?auto_52394 ) ) ( not ( = ?auto_52393 ?auto_52394 ) ) ( OBJ-AT ?auto_52389 ?auto_52394 ) ( TRUCK-AT ?auto_52392 ?auto_52388 ) ( IN-TRUCK ?auto_52396 ?auto_52392 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52396 ?auto_52391 ?auto_52388 )
      ( DELIVER-3PKG-VERIFY ?auto_52389 ?auto_52390 ?auto_52391 ?auto_52388 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_52398 - OBJ
      ?auto_52399 - OBJ
      ?auto_52400 - OBJ
      ?auto_52397 - LOCATION
    )
    :vars
    (
      ?auto_52403 - LOCATION
      ?auto_52405 - CITY
      ?auto_52402 - OBJ
      ?auto_52404 - LOCATION
      ?auto_52401 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52399 ?auto_52398 ) ) ( not ( = ?auto_52400 ?auto_52398 ) ) ( not ( = ?auto_52400 ?auto_52399 ) ) ( IN-CITY ?auto_52403 ?auto_52405 ) ( IN-CITY ?auto_52397 ?auto_52405 ) ( not ( = ?auto_52397 ?auto_52403 ) ) ( OBJ-AT ?auto_52399 ?auto_52403 ) ( not ( = ?auto_52402 ?auto_52400 ) ) ( not ( = ?auto_52399 ?auto_52402 ) ) ( OBJ-AT ?auto_52402 ?auto_52403 ) ( not ( = ?auto_52402 ?auto_52398 ) ) ( IN-CITY ?auto_52404 ?auto_52405 ) ( not ( = ?auto_52397 ?auto_52404 ) ) ( not ( = ?auto_52403 ?auto_52404 ) ) ( OBJ-AT ?auto_52398 ?auto_52404 ) ( TRUCK-AT ?auto_52401 ?auto_52397 ) ( IN-TRUCK ?auto_52400 ?auto_52401 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52400 ?auto_52399 ?auto_52397 )
      ( DELIVER-3PKG-VERIFY ?auto_52398 ?auto_52399 ?auto_52400 ?auto_52397 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_52417 - OBJ
      ?auto_52418 - OBJ
      ?auto_52419 - OBJ
      ?auto_52416 - LOCATION
    )
    :vars
    (
      ?auto_52424 - OBJ
      ?auto_52421 - LOCATION
      ?auto_52423 - CITY
      ?auto_52422 - LOCATION
      ?auto_52420 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52418 ?auto_52417 ) ) ( not ( = ?auto_52419 ?auto_52417 ) ) ( not ( = ?auto_52419 ?auto_52418 ) ) ( not ( = ?auto_52418 ?auto_52424 ) ) ( IN-CITY ?auto_52421 ?auto_52423 ) ( IN-CITY ?auto_52416 ?auto_52423 ) ( not ( = ?auto_52416 ?auto_52421 ) ) ( OBJ-AT ?auto_52418 ?auto_52421 ) ( not ( = ?auto_52419 ?auto_52424 ) ) ( OBJ-AT ?auto_52419 ?auto_52421 ) ( not ( = ?auto_52417 ?auto_52424 ) ) ( IN-CITY ?auto_52422 ?auto_52423 ) ( not ( = ?auto_52416 ?auto_52422 ) ) ( not ( = ?auto_52421 ?auto_52422 ) ) ( OBJ-AT ?auto_52417 ?auto_52422 ) ( TRUCK-AT ?auto_52420 ?auto_52416 ) ( IN-TRUCK ?auto_52424 ?auto_52420 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52424 ?auto_52418 ?auto_52416 )
      ( DELIVER-3PKG-VERIFY ?auto_52417 ?auto_52418 ?auto_52419 ?auto_52416 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_52436 - OBJ
      ?auto_52437 - OBJ
      ?auto_52438 - OBJ
      ?auto_52435 - LOCATION
    )
    :vars
    (
      ?auto_52441 - LOCATION
      ?auto_52443 - CITY
      ?auto_52439 - OBJ
      ?auto_52442 - LOCATION
      ?auto_52440 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52437 ?auto_52436 ) ) ( not ( = ?auto_52438 ?auto_52436 ) ) ( not ( = ?auto_52438 ?auto_52437 ) ) ( IN-CITY ?auto_52441 ?auto_52443 ) ( IN-CITY ?auto_52435 ?auto_52443 ) ( not ( = ?auto_52435 ?auto_52441 ) ) ( OBJ-AT ?auto_52438 ?auto_52441 ) ( OBJ-AT ?auto_52436 ?auto_52441 ) ( not ( = ?auto_52439 ?auto_52437 ) ) ( not ( = ?auto_52438 ?auto_52439 ) ) ( not ( = ?auto_52436 ?auto_52439 ) ) ( IN-CITY ?auto_52442 ?auto_52443 ) ( not ( = ?auto_52435 ?auto_52442 ) ) ( not ( = ?auto_52441 ?auto_52442 ) ) ( OBJ-AT ?auto_52439 ?auto_52442 ) ( TRUCK-AT ?auto_52440 ?auto_52435 ) ( IN-TRUCK ?auto_52437 ?auto_52440 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52437 ?auto_52438 ?auto_52435 )
      ( DELIVER-3PKG-VERIFY ?auto_52436 ?auto_52437 ?auto_52438 ?auto_52435 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_52445 - OBJ
      ?auto_52446 - OBJ
      ?auto_52447 - OBJ
      ?auto_52444 - LOCATION
    )
    :vars
    (
      ?auto_52452 - OBJ
      ?auto_52449 - LOCATION
      ?auto_52451 - CITY
      ?auto_52450 - LOCATION
      ?auto_52448 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52446 ?auto_52445 ) ) ( not ( = ?auto_52447 ?auto_52445 ) ) ( not ( = ?auto_52447 ?auto_52446 ) ) ( not ( = ?auto_52447 ?auto_52452 ) ) ( IN-CITY ?auto_52449 ?auto_52451 ) ( IN-CITY ?auto_52444 ?auto_52451 ) ( not ( = ?auto_52444 ?auto_52449 ) ) ( OBJ-AT ?auto_52447 ?auto_52449 ) ( not ( = ?auto_52445 ?auto_52452 ) ) ( OBJ-AT ?auto_52445 ?auto_52449 ) ( not ( = ?auto_52446 ?auto_52452 ) ) ( IN-CITY ?auto_52450 ?auto_52451 ) ( not ( = ?auto_52444 ?auto_52450 ) ) ( not ( = ?auto_52449 ?auto_52450 ) ) ( OBJ-AT ?auto_52446 ?auto_52450 ) ( TRUCK-AT ?auto_52448 ?auto_52444 ) ( IN-TRUCK ?auto_52452 ?auto_52448 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52452 ?auto_52447 ?auto_52444 )
      ( DELIVER-3PKG-VERIFY ?auto_52445 ?auto_52446 ?auto_52447 ?auto_52444 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_52464 - OBJ
      ?auto_52465 - OBJ
      ?auto_52466 - OBJ
      ?auto_52463 - LOCATION
    )
    :vars
    (
      ?auto_52469 - LOCATION
      ?auto_52471 - CITY
      ?auto_52467 - OBJ
      ?auto_52470 - LOCATION
      ?auto_52468 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52465 ?auto_52464 ) ) ( not ( = ?auto_52466 ?auto_52464 ) ) ( not ( = ?auto_52466 ?auto_52465 ) ) ( IN-CITY ?auto_52469 ?auto_52471 ) ( IN-CITY ?auto_52463 ?auto_52471 ) ( not ( = ?auto_52463 ?auto_52469 ) ) ( OBJ-AT ?auto_52465 ?auto_52469 ) ( OBJ-AT ?auto_52464 ?auto_52469 ) ( not ( = ?auto_52467 ?auto_52466 ) ) ( not ( = ?auto_52465 ?auto_52467 ) ) ( not ( = ?auto_52464 ?auto_52467 ) ) ( IN-CITY ?auto_52470 ?auto_52471 ) ( not ( = ?auto_52463 ?auto_52470 ) ) ( not ( = ?auto_52469 ?auto_52470 ) ) ( OBJ-AT ?auto_52467 ?auto_52470 ) ( TRUCK-AT ?auto_52468 ?auto_52463 ) ( IN-TRUCK ?auto_52466 ?auto_52468 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52466 ?auto_52465 ?auto_52463 )
      ( DELIVER-3PKG-VERIFY ?auto_52464 ?auto_52465 ?auto_52466 ?auto_52463 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_52473 - OBJ
      ?auto_52474 - OBJ
      ?auto_52475 - OBJ
      ?auto_52472 - LOCATION
    )
    :vars
    (
      ?auto_52480 - OBJ
      ?auto_52477 - LOCATION
      ?auto_52479 - CITY
      ?auto_52478 - LOCATION
      ?auto_52476 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52474 ?auto_52473 ) ) ( not ( = ?auto_52475 ?auto_52473 ) ) ( not ( = ?auto_52475 ?auto_52474 ) ) ( not ( = ?auto_52474 ?auto_52480 ) ) ( IN-CITY ?auto_52477 ?auto_52479 ) ( IN-CITY ?auto_52472 ?auto_52479 ) ( not ( = ?auto_52472 ?auto_52477 ) ) ( OBJ-AT ?auto_52474 ?auto_52477 ) ( not ( = ?auto_52473 ?auto_52480 ) ) ( OBJ-AT ?auto_52473 ?auto_52477 ) ( not ( = ?auto_52475 ?auto_52480 ) ) ( IN-CITY ?auto_52478 ?auto_52479 ) ( not ( = ?auto_52472 ?auto_52478 ) ) ( not ( = ?auto_52477 ?auto_52478 ) ) ( OBJ-AT ?auto_52475 ?auto_52478 ) ( TRUCK-AT ?auto_52476 ?auto_52472 ) ( IN-TRUCK ?auto_52480 ?auto_52476 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52480 ?auto_52474 ?auto_52472 )
      ( DELIVER-3PKG-VERIFY ?auto_52473 ?auto_52474 ?auto_52475 ?auto_52472 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_52512 - OBJ
      ?auto_52513 - OBJ
      ?auto_52514 - OBJ
      ?auto_52511 - LOCATION
    )
    :vars
    (
      ?auto_52517 - LOCATION
      ?auto_52519 - CITY
      ?auto_52516 - OBJ
      ?auto_52518 - LOCATION
      ?auto_52515 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52513 ?auto_52512 ) ) ( not ( = ?auto_52514 ?auto_52512 ) ) ( not ( = ?auto_52514 ?auto_52513 ) ) ( IN-CITY ?auto_52517 ?auto_52519 ) ( IN-CITY ?auto_52511 ?auto_52519 ) ( not ( = ?auto_52511 ?auto_52517 ) ) ( OBJ-AT ?auto_52512 ?auto_52517 ) ( not ( = ?auto_52516 ?auto_52513 ) ) ( not ( = ?auto_52512 ?auto_52516 ) ) ( OBJ-AT ?auto_52516 ?auto_52517 ) ( not ( = ?auto_52516 ?auto_52514 ) ) ( IN-CITY ?auto_52518 ?auto_52519 ) ( not ( = ?auto_52511 ?auto_52518 ) ) ( not ( = ?auto_52517 ?auto_52518 ) ) ( OBJ-AT ?auto_52514 ?auto_52518 ) ( TRUCK-AT ?auto_52515 ?auto_52511 ) ( IN-TRUCK ?auto_52513 ?auto_52515 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52513 ?auto_52512 ?auto_52511 )
      ( DELIVER-3PKG-VERIFY ?auto_52512 ?auto_52513 ?auto_52514 ?auto_52511 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_52521 - OBJ
      ?auto_52522 - OBJ
      ?auto_52523 - OBJ
      ?auto_52520 - LOCATION
    )
    :vars
    (
      ?auto_52526 - LOCATION
      ?auto_52528 - CITY
      ?auto_52524 - OBJ
      ?auto_52527 - LOCATION
      ?auto_52525 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52522 ?auto_52521 ) ) ( not ( = ?auto_52523 ?auto_52521 ) ) ( not ( = ?auto_52523 ?auto_52522 ) ) ( IN-CITY ?auto_52526 ?auto_52528 ) ( IN-CITY ?auto_52520 ?auto_52528 ) ( not ( = ?auto_52520 ?auto_52526 ) ) ( OBJ-AT ?auto_52521 ?auto_52526 ) ( OBJ-AT ?auto_52523 ?auto_52526 ) ( not ( = ?auto_52524 ?auto_52522 ) ) ( not ( = ?auto_52521 ?auto_52524 ) ) ( not ( = ?auto_52523 ?auto_52524 ) ) ( IN-CITY ?auto_52527 ?auto_52528 ) ( not ( = ?auto_52520 ?auto_52527 ) ) ( not ( = ?auto_52526 ?auto_52527 ) ) ( OBJ-AT ?auto_52524 ?auto_52527 ) ( TRUCK-AT ?auto_52525 ?auto_52520 ) ( IN-TRUCK ?auto_52522 ?auto_52525 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52522 ?auto_52521 ?auto_52520 )
      ( DELIVER-3PKG-VERIFY ?auto_52521 ?auto_52522 ?auto_52523 ?auto_52520 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_52540 - OBJ
      ?auto_52541 - OBJ
      ?auto_52542 - OBJ
      ?auto_52539 - LOCATION
    )
    :vars
    (
      ?auto_52545 - LOCATION
      ?auto_52547 - CITY
      ?auto_52544 - OBJ
      ?auto_52546 - LOCATION
      ?auto_52543 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52541 ?auto_52540 ) ) ( not ( = ?auto_52542 ?auto_52540 ) ) ( not ( = ?auto_52542 ?auto_52541 ) ) ( IN-CITY ?auto_52545 ?auto_52547 ) ( IN-CITY ?auto_52539 ?auto_52547 ) ( not ( = ?auto_52539 ?auto_52545 ) ) ( OBJ-AT ?auto_52540 ?auto_52545 ) ( not ( = ?auto_52544 ?auto_52542 ) ) ( not ( = ?auto_52540 ?auto_52544 ) ) ( OBJ-AT ?auto_52544 ?auto_52545 ) ( not ( = ?auto_52544 ?auto_52541 ) ) ( IN-CITY ?auto_52546 ?auto_52547 ) ( not ( = ?auto_52539 ?auto_52546 ) ) ( not ( = ?auto_52545 ?auto_52546 ) ) ( OBJ-AT ?auto_52541 ?auto_52546 ) ( TRUCK-AT ?auto_52543 ?auto_52539 ) ( IN-TRUCK ?auto_52542 ?auto_52543 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52542 ?auto_52540 ?auto_52539 )
      ( DELIVER-3PKG-VERIFY ?auto_52540 ?auto_52541 ?auto_52542 ?auto_52539 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_52559 - OBJ
      ?auto_52560 - OBJ
      ?auto_52561 - OBJ
      ?auto_52558 - LOCATION
    )
    :vars
    (
      ?auto_52566 - OBJ
      ?auto_52563 - LOCATION
      ?auto_52565 - CITY
      ?auto_52564 - LOCATION
      ?auto_52562 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52560 ?auto_52559 ) ) ( not ( = ?auto_52561 ?auto_52559 ) ) ( not ( = ?auto_52561 ?auto_52560 ) ) ( not ( = ?auto_52559 ?auto_52566 ) ) ( IN-CITY ?auto_52563 ?auto_52565 ) ( IN-CITY ?auto_52558 ?auto_52565 ) ( not ( = ?auto_52558 ?auto_52563 ) ) ( OBJ-AT ?auto_52559 ?auto_52563 ) ( not ( = ?auto_52561 ?auto_52566 ) ) ( OBJ-AT ?auto_52561 ?auto_52563 ) ( not ( = ?auto_52560 ?auto_52566 ) ) ( IN-CITY ?auto_52564 ?auto_52565 ) ( not ( = ?auto_52558 ?auto_52564 ) ) ( not ( = ?auto_52563 ?auto_52564 ) ) ( OBJ-AT ?auto_52560 ?auto_52564 ) ( TRUCK-AT ?auto_52562 ?auto_52558 ) ( IN-TRUCK ?auto_52566 ?auto_52562 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52566 ?auto_52559 ?auto_52558 )
      ( DELIVER-3PKG-VERIFY ?auto_52559 ?auto_52560 ?auto_52561 ?auto_52558 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_52578 - OBJ
      ?auto_52579 - OBJ
      ?auto_52580 - OBJ
      ?auto_52577 - LOCATION
    )
    :vars
    (
      ?auto_52583 - LOCATION
      ?auto_52585 - CITY
      ?auto_52581 - OBJ
      ?auto_52584 - LOCATION
      ?auto_52582 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52579 ?auto_52578 ) ) ( not ( = ?auto_52580 ?auto_52578 ) ) ( not ( = ?auto_52580 ?auto_52579 ) ) ( IN-CITY ?auto_52583 ?auto_52585 ) ( IN-CITY ?auto_52577 ?auto_52585 ) ( not ( = ?auto_52577 ?auto_52583 ) ) ( OBJ-AT ?auto_52578 ?auto_52583 ) ( OBJ-AT ?auto_52579 ?auto_52583 ) ( not ( = ?auto_52581 ?auto_52580 ) ) ( not ( = ?auto_52578 ?auto_52581 ) ) ( not ( = ?auto_52579 ?auto_52581 ) ) ( IN-CITY ?auto_52584 ?auto_52585 ) ( not ( = ?auto_52577 ?auto_52584 ) ) ( not ( = ?auto_52583 ?auto_52584 ) ) ( OBJ-AT ?auto_52581 ?auto_52584 ) ( TRUCK-AT ?auto_52582 ?auto_52577 ) ( IN-TRUCK ?auto_52580 ?auto_52582 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52580 ?auto_52578 ?auto_52577 )
      ( DELIVER-3PKG-VERIFY ?auto_52578 ?auto_52579 ?auto_52580 ?auto_52577 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_52587 - OBJ
      ?auto_52588 - OBJ
      ?auto_52589 - OBJ
      ?auto_52586 - LOCATION
    )
    :vars
    (
      ?auto_52594 - OBJ
      ?auto_52591 - LOCATION
      ?auto_52593 - CITY
      ?auto_52592 - LOCATION
      ?auto_52590 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52588 ?auto_52587 ) ) ( not ( = ?auto_52589 ?auto_52587 ) ) ( not ( = ?auto_52589 ?auto_52588 ) ) ( not ( = ?auto_52587 ?auto_52594 ) ) ( IN-CITY ?auto_52591 ?auto_52593 ) ( IN-CITY ?auto_52586 ?auto_52593 ) ( not ( = ?auto_52586 ?auto_52591 ) ) ( OBJ-AT ?auto_52587 ?auto_52591 ) ( not ( = ?auto_52588 ?auto_52594 ) ) ( OBJ-AT ?auto_52588 ?auto_52591 ) ( not ( = ?auto_52589 ?auto_52594 ) ) ( IN-CITY ?auto_52592 ?auto_52593 ) ( not ( = ?auto_52586 ?auto_52592 ) ) ( not ( = ?auto_52591 ?auto_52592 ) ) ( OBJ-AT ?auto_52589 ?auto_52592 ) ( TRUCK-AT ?auto_52590 ?auto_52586 ) ( IN-TRUCK ?auto_52594 ?auto_52590 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52594 ?auto_52587 ?auto_52586 )
      ( DELIVER-3PKG-VERIFY ?auto_52587 ?auto_52588 ?auto_52589 ?auto_52586 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_52750 - OBJ
      ?auto_52751 - OBJ
      ?auto_52752 - OBJ
      ?auto_52753 - OBJ
      ?auto_52749 - LOCATION
    )
    :vars
    (
      ?auto_52755 - LOCATION
      ?auto_52757 - CITY
      ?auto_52756 - LOCATION
      ?auto_52754 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52751 ?auto_52750 ) ) ( not ( = ?auto_52752 ?auto_52750 ) ) ( not ( = ?auto_52752 ?auto_52751 ) ) ( not ( = ?auto_52753 ?auto_52750 ) ) ( not ( = ?auto_52753 ?auto_52751 ) ) ( not ( = ?auto_52753 ?auto_52752 ) ) ( IN-CITY ?auto_52755 ?auto_52757 ) ( IN-CITY ?auto_52749 ?auto_52757 ) ( not ( = ?auto_52749 ?auto_52755 ) ) ( OBJ-AT ?auto_52753 ?auto_52755 ) ( OBJ-AT ?auto_52752 ?auto_52755 ) ( IN-CITY ?auto_52756 ?auto_52757 ) ( not ( = ?auto_52749 ?auto_52756 ) ) ( not ( = ?auto_52755 ?auto_52756 ) ) ( OBJ-AT ?auto_52751 ?auto_52756 ) ( TRUCK-AT ?auto_52754 ?auto_52749 ) ( IN-TRUCK ?auto_52750 ?auto_52754 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52750 ?auto_52753 ?auto_52749 )
      ( DELIVER-4PKG-VERIFY ?auto_52750 ?auto_52751 ?auto_52752 ?auto_52753 ?auto_52749 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_52779 - OBJ
      ?auto_52780 - OBJ
      ?auto_52781 - OBJ
      ?auto_52782 - OBJ
      ?auto_52778 - LOCATION
    )
    :vars
    (
      ?auto_52784 - LOCATION
      ?auto_52786 - CITY
      ?auto_52785 - LOCATION
      ?auto_52783 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52780 ?auto_52779 ) ) ( not ( = ?auto_52781 ?auto_52779 ) ) ( not ( = ?auto_52781 ?auto_52780 ) ) ( not ( = ?auto_52782 ?auto_52779 ) ) ( not ( = ?auto_52782 ?auto_52780 ) ) ( not ( = ?auto_52782 ?auto_52781 ) ) ( IN-CITY ?auto_52784 ?auto_52786 ) ( IN-CITY ?auto_52778 ?auto_52786 ) ( not ( = ?auto_52778 ?auto_52784 ) ) ( OBJ-AT ?auto_52781 ?auto_52784 ) ( OBJ-AT ?auto_52782 ?auto_52784 ) ( IN-CITY ?auto_52785 ?auto_52786 ) ( not ( = ?auto_52778 ?auto_52785 ) ) ( not ( = ?auto_52784 ?auto_52785 ) ) ( OBJ-AT ?auto_52780 ?auto_52785 ) ( TRUCK-AT ?auto_52783 ?auto_52778 ) ( IN-TRUCK ?auto_52779 ?auto_52783 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52779 ?auto_52781 ?auto_52778 )
      ( DELIVER-4PKG-VERIFY ?auto_52779 ?auto_52780 ?auto_52781 ?auto_52782 ?auto_52778 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_52808 - OBJ
      ?auto_52809 - OBJ
      ?auto_52810 - OBJ
      ?auto_52811 - OBJ
      ?auto_52807 - LOCATION
    )
    :vars
    (
      ?auto_52813 - LOCATION
      ?auto_52815 - CITY
      ?auto_52814 - LOCATION
      ?auto_52812 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52809 ?auto_52808 ) ) ( not ( = ?auto_52810 ?auto_52808 ) ) ( not ( = ?auto_52810 ?auto_52809 ) ) ( not ( = ?auto_52811 ?auto_52808 ) ) ( not ( = ?auto_52811 ?auto_52809 ) ) ( not ( = ?auto_52811 ?auto_52810 ) ) ( IN-CITY ?auto_52813 ?auto_52815 ) ( IN-CITY ?auto_52807 ?auto_52815 ) ( not ( = ?auto_52807 ?auto_52813 ) ) ( OBJ-AT ?auto_52811 ?auto_52813 ) ( OBJ-AT ?auto_52809 ?auto_52813 ) ( IN-CITY ?auto_52814 ?auto_52815 ) ( not ( = ?auto_52807 ?auto_52814 ) ) ( not ( = ?auto_52813 ?auto_52814 ) ) ( OBJ-AT ?auto_52810 ?auto_52814 ) ( TRUCK-AT ?auto_52812 ?auto_52807 ) ( IN-TRUCK ?auto_52808 ?auto_52812 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52808 ?auto_52811 ?auto_52807 )
      ( DELIVER-4PKG-VERIFY ?auto_52808 ?auto_52809 ?auto_52810 ?auto_52811 ?auto_52807 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_52837 - OBJ
      ?auto_52838 - OBJ
      ?auto_52839 - OBJ
      ?auto_52840 - OBJ
      ?auto_52836 - LOCATION
    )
    :vars
    (
      ?auto_52842 - LOCATION
      ?auto_52844 - CITY
      ?auto_52843 - LOCATION
      ?auto_52841 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52838 ?auto_52837 ) ) ( not ( = ?auto_52839 ?auto_52837 ) ) ( not ( = ?auto_52839 ?auto_52838 ) ) ( not ( = ?auto_52840 ?auto_52837 ) ) ( not ( = ?auto_52840 ?auto_52838 ) ) ( not ( = ?auto_52840 ?auto_52839 ) ) ( IN-CITY ?auto_52842 ?auto_52844 ) ( IN-CITY ?auto_52836 ?auto_52844 ) ( not ( = ?auto_52836 ?auto_52842 ) ) ( OBJ-AT ?auto_52839 ?auto_52842 ) ( OBJ-AT ?auto_52838 ?auto_52842 ) ( IN-CITY ?auto_52843 ?auto_52844 ) ( not ( = ?auto_52836 ?auto_52843 ) ) ( not ( = ?auto_52842 ?auto_52843 ) ) ( OBJ-AT ?auto_52840 ?auto_52843 ) ( TRUCK-AT ?auto_52841 ?auto_52836 ) ( IN-TRUCK ?auto_52837 ?auto_52841 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52837 ?auto_52839 ?auto_52836 )
      ( DELIVER-4PKG-VERIFY ?auto_52837 ?auto_52838 ?auto_52839 ?auto_52840 ?auto_52836 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_52928 - OBJ
      ?auto_52929 - OBJ
      ?auto_52930 - OBJ
      ?auto_52931 - OBJ
      ?auto_52927 - LOCATION
    )
    :vars
    (
      ?auto_52933 - LOCATION
      ?auto_52935 - CITY
      ?auto_52934 - LOCATION
      ?auto_52932 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52929 ?auto_52928 ) ) ( not ( = ?auto_52930 ?auto_52928 ) ) ( not ( = ?auto_52930 ?auto_52929 ) ) ( not ( = ?auto_52931 ?auto_52928 ) ) ( not ( = ?auto_52931 ?auto_52929 ) ) ( not ( = ?auto_52931 ?auto_52930 ) ) ( IN-CITY ?auto_52933 ?auto_52935 ) ( IN-CITY ?auto_52927 ?auto_52935 ) ( not ( = ?auto_52927 ?auto_52933 ) ) ( OBJ-AT ?auto_52929 ?auto_52933 ) ( OBJ-AT ?auto_52931 ?auto_52933 ) ( IN-CITY ?auto_52934 ?auto_52935 ) ( not ( = ?auto_52927 ?auto_52934 ) ) ( not ( = ?auto_52933 ?auto_52934 ) ) ( OBJ-AT ?auto_52930 ?auto_52934 ) ( TRUCK-AT ?auto_52932 ?auto_52927 ) ( IN-TRUCK ?auto_52928 ?auto_52932 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52928 ?auto_52929 ?auto_52927 )
      ( DELIVER-4PKG-VERIFY ?auto_52928 ?auto_52929 ?auto_52930 ?auto_52931 ?auto_52927 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_52957 - OBJ
      ?auto_52958 - OBJ
      ?auto_52959 - OBJ
      ?auto_52960 - OBJ
      ?auto_52956 - LOCATION
    )
    :vars
    (
      ?auto_52962 - LOCATION
      ?auto_52964 - CITY
      ?auto_52963 - LOCATION
      ?auto_52961 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_52958 ?auto_52957 ) ) ( not ( = ?auto_52959 ?auto_52957 ) ) ( not ( = ?auto_52959 ?auto_52958 ) ) ( not ( = ?auto_52960 ?auto_52957 ) ) ( not ( = ?auto_52960 ?auto_52958 ) ) ( not ( = ?auto_52960 ?auto_52959 ) ) ( IN-CITY ?auto_52962 ?auto_52964 ) ( IN-CITY ?auto_52956 ?auto_52964 ) ( not ( = ?auto_52956 ?auto_52962 ) ) ( OBJ-AT ?auto_52958 ?auto_52962 ) ( OBJ-AT ?auto_52959 ?auto_52962 ) ( IN-CITY ?auto_52963 ?auto_52964 ) ( not ( = ?auto_52956 ?auto_52963 ) ) ( not ( = ?auto_52962 ?auto_52963 ) ) ( OBJ-AT ?auto_52960 ?auto_52963 ) ( TRUCK-AT ?auto_52961 ?auto_52956 ) ( IN-TRUCK ?auto_52957 ?auto_52961 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_52957 ?auto_52958 ?auto_52956 )
      ( DELIVER-4PKG-VERIFY ?auto_52957 ?auto_52958 ?auto_52959 ?auto_52960 ?auto_52956 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_53048 - OBJ
      ?auto_53049 - OBJ
      ?auto_53050 - OBJ
      ?auto_53051 - OBJ
      ?auto_53047 - LOCATION
    )
    :vars
    (
      ?auto_53053 - LOCATION
      ?auto_53055 - CITY
      ?auto_53054 - LOCATION
      ?auto_53052 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_53049 ?auto_53048 ) ) ( not ( = ?auto_53050 ?auto_53048 ) ) ( not ( = ?auto_53050 ?auto_53049 ) ) ( not ( = ?auto_53051 ?auto_53048 ) ) ( not ( = ?auto_53051 ?auto_53049 ) ) ( not ( = ?auto_53051 ?auto_53050 ) ) ( IN-CITY ?auto_53053 ?auto_53055 ) ( IN-CITY ?auto_53047 ?auto_53055 ) ( not ( = ?auto_53047 ?auto_53053 ) ) ( OBJ-AT ?auto_53051 ?auto_53053 ) ( OBJ-AT ?auto_53050 ?auto_53053 ) ( IN-CITY ?auto_53054 ?auto_53055 ) ( not ( = ?auto_53047 ?auto_53054 ) ) ( not ( = ?auto_53053 ?auto_53054 ) ) ( OBJ-AT ?auto_53048 ?auto_53054 ) ( TRUCK-AT ?auto_53052 ?auto_53047 ) ( IN-TRUCK ?auto_53049 ?auto_53052 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_53049 ?auto_53051 ?auto_53047 )
      ( DELIVER-4PKG-VERIFY ?auto_53048 ?auto_53049 ?auto_53050 ?auto_53051 ?auto_53047 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_53077 - OBJ
      ?auto_53078 - OBJ
      ?auto_53079 - OBJ
      ?auto_53080 - OBJ
      ?auto_53076 - LOCATION
    )
    :vars
    (
      ?auto_53082 - LOCATION
      ?auto_53084 - CITY
      ?auto_53083 - LOCATION
      ?auto_53081 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_53078 ?auto_53077 ) ) ( not ( = ?auto_53079 ?auto_53077 ) ) ( not ( = ?auto_53079 ?auto_53078 ) ) ( not ( = ?auto_53080 ?auto_53077 ) ) ( not ( = ?auto_53080 ?auto_53078 ) ) ( not ( = ?auto_53080 ?auto_53079 ) ) ( IN-CITY ?auto_53082 ?auto_53084 ) ( IN-CITY ?auto_53076 ?auto_53084 ) ( not ( = ?auto_53076 ?auto_53082 ) ) ( OBJ-AT ?auto_53079 ?auto_53082 ) ( OBJ-AT ?auto_53080 ?auto_53082 ) ( IN-CITY ?auto_53083 ?auto_53084 ) ( not ( = ?auto_53076 ?auto_53083 ) ) ( not ( = ?auto_53082 ?auto_53083 ) ) ( OBJ-AT ?auto_53077 ?auto_53083 ) ( TRUCK-AT ?auto_53081 ?auto_53076 ) ( IN-TRUCK ?auto_53078 ?auto_53081 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_53078 ?auto_53079 ?auto_53076 )
      ( DELIVER-4PKG-VERIFY ?auto_53077 ?auto_53078 ?auto_53079 ?auto_53080 ?auto_53076 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_53169 - OBJ
      ?auto_53170 - OBJ
      ?auto_53171 - OBJ
      ?auto_53172 - OBJ
      ?auto_53168 - LOCATION
    )
    :vars
    (
      ?auto_53174 - LOCATION
      ?auto_53176 - CITY
      ?auto_53175 - LOCATION
      ?auto_53173 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_53170 ?auto_53169 ) ) ( not ( = ?auto_53171 ?auto_53169 ) ) ( not ( = ?auto_53171 ?auto_53170 ) ) ( not ( = ?auto_53172 ?auto_53169 ) ) ( not ( = ?auto_53172 ?auto_53170 ) ) ( not ( = ?auto_53172 ?auto_53171 ) ) ( IN-CITY ?auto_53174 ?auto_53176 ) ( IN-CITY ?auto_53168 ?auto_53176 ) ( not ( = ?auto_53168 ?auto_53174 ) ) ( OBJ-AT ?auto_53172 ?auto_53174 ) ( OBJ-AT ?auto_53170 ?auto_53174 ) ( IN-CITY ?auto_53175 ?auto_53176 ) ( not ( = ?auto_53168 ?auto_53175 ) ) ( not ( = ?auto_53174 ?auto_53175 ) ) ( OBJ-AT ?auto_53169 ?auto_53175 ) ( TRUCK-AT ?auto_53173 ?auto_53168 ) ( IN-TRUCK ?auto_53171 ?auto_53173 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_53171 ?auto_53172 ?auto_53168 )
      ( DELIVER-4PKG-VERIFY ?auto_53169 ?auto_53170 ?auto_53171 ?auto_53172 ?auto_53168 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_53198 - OBJ
      ?auto_53199 - OBJ
      ?auto_53200 - OBJ
      ?auto_53201 - OBJ
      ?auto_53197 - LOCATION
    )
    :vars
    (
      ?auto_53203 - LOCATION
      ?auto_53205 - CITY
      ?auto_53204 - LOCATION
      ?auto_53202 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_53199 ?auto_53198 ) ) ( not ( = ?auto_53200 ?auto_53198 ) ) ( not ( = ?auto_53200 ?auto_53199 ) ) ( not ( = ?auto_53201 ?auto_53198 ) ) ( not ( = ?auto_53201 ?auto_53199 ) ) ( not ( = ?auto_53201 ?auto_53200 ) ) ( IN-CITY ?auto_53203 ?auto_53205 ) ( IN-CITY ?auto_53197 ?auto_53205 ) ( not ( = ?auto_53197 ?auto_53203 ) ) ( OBJ-AT ?auto_53200 ?auto_53203 ) ( OBJ-AT ?auto_53199 ?auto_53203 ) ( IN-CITY ?auto_53204 ?auto_53205 ) ( not ( = ?auto_53197 ?auto_53204 ) ) ( not ( = ?auto_53203 ?auto_53204 ) ) ( OBJ-AT ?auto_53198 ?auto_53204 ) ( TRUCK-AT ?auto_53202 ?auto_53197 ) ( IN-TRUCK ?auto_53201 ?auto_53202 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_53201 ?auto_53200 ?auto_53197 )
      ( DELIVER-4PKG-VERIFY ?auto_53198 ?auto_53199 ?auto_53200 ?auto_53201 ?auto_53197 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_53257 - OBJ
      ?auto_53258 - OBJ
      ?auto_53259 - OBJ
      ?auto_53260 - OBJ
      ?auto_53256 - LOCATION
    )
    :vars
    (
      ?auto_53262 - LOCATION
      ?auto_53264 - CITY
      ?auto_53263 - LOCATION
      ?auto_53261 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_53258 ?auto_53257 ) ) ( not ( = ?auto_53259 ?auto_53257 ) ) ( not ( = ?auto_53259 ?auto_53258 ) ) ( not ( = ?auto_53260 ?auto_53257 ) ) ( not ( = ?auto_53260 ?auto_53258 ) ) ( not ( = ?auto_53260 ?auto_53259 ) ) ( IN-CITY ?auto_53262 ?auto_53264 ) ( IN-CITY ?auto_53256 ?auto_53264 ) ( not ( = ?auto_53256 ?auto_53262 ) ) ( OBJ-AT ?auto_53258 ?auto_53262 ) ( OBJ-AT ?auto_53260 ?auto_53262 ) ( IN-CITY ?auto_53263 ?auto_53264 ) ( not ( = ?auto_53256 ?auto_53263 ) ) ( not ( = ?auto_53262 ?auto_53263 ) ) ( OBJ-AT ?auto_53257 ?auto_53263 ) ( TRUCK-AT ?auto_53261 ?auto_53256 ) ( IN-TRUCK ?auto_53259 ?auto_53261 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_53259 ?auto_53258 ?auto_53256 )
      ( DELIVER-4PKG-VERIFY ?auto_53257 ?auto_53258 ?auto_53259 ?auto_53260 ?auto_53256 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_53318 - OBJ
      ?auto_53319 - OBJ
      ?auto_53320 - OBJ
      ?auto_53321 - OBJ
      ?auto_53317 - LOCATION
    )
    :vars
    (
      ?auto_53323 - LOCATION
      ?auto_53325 - CITY
      ?auto_53324 - LOCATION
      ?auto_53322 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_53319 ?auto_53318 ) ) ( not ( = ?auto_53320 ?auto_53318 ) ) ( not ( = ?auto_53320 ?auto_53319 ) ) ( not ( = ?auto_53321 ?auto_53318 ) ) ( not ( = ?auto_53321 ?auto_53319 ) ) ( not ( = ?auto_53321 ?auto_53320 ) ) ( IN-CITY ?auto_53323 ?auto_53325 ) ( IN-CITY ?auto_53317 ?auto_53325 ) ( not ( = ?auto_53317 ?auto_53323 ) ) ( OBJ-AT ?auto_53319 ?auto_53323 ) ( OBJ-AT ?auto_53320 ?auto_53323 ) ( IN-CITY ?auto_53324 ?auto_53325 ) ( not ( = ?auto_53317 ?auto_53324 ) ) ( not ( = ?auto_53323 ?auto_53324 ) ) ( OBJ-AT ?auto_53318 ?auto_53324 ) ( TRUCK-AT ?auto_53322 ?auto_53317 ) ( IN-TRUCK ?auto_53321 ?auto_53322 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_53321 ?auto_53319 ?auto_53317 )
      ( DELIVER-4PKG-VERIFY ?auto_53318 ?auto_53319 ?auto_53320 ?auto_53321 ?auto_53317 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_53409 - OBJ
      ?auto_53410 - OBJ
      ?auto_53411 - OBJ
      ?auto_53412 - OBJ
      ?auto_53408 - LOCATION
    )
    :vars
    (
      ?auto_53414 - LOCATION
      ?auto_53416 - CITY
      ?auto_53415 - LOCATION
      ?auto_53413 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_53410 ?auto_53409 ) ) ( not ( = ?auto_53411 ?auto_53409 ) ) ( not ( = ?auto_53411 ?auto_53410 ) ) ( not ( = ?auto_53412 ?auto_53409 ) ) ( not ( = ?auto_53412 ?auto_53410 ) ) ( not ( = ?auto_53412 ?auto_53411 ) ) ( IN-CITY ?auto_53414 ?auto_53416 ) ( IN-CITY ?auto_53408 ?auto_53416 ) ( not ( = ?auto_53408 ?auto_53414 ) ) ( OBJ-AT ?auto_53412 ?auto_53414 ) ( OBJ-AT ?auto_53409 ?auto_53414 ) ( IN-CITY ?auto_53415 ?auto_53416 ) ( not ( = ?auto_53408 ?auto_53415 ) ) ( not ( = ?auto_53414 ?auto_53415 ) ) ( OBJ-AT ?auto_53411 ?auto_53415 ) ( TRUCK-AT ?auto_53413 ?auto_53408 ) ( IN-TRUCK ?auto_53410 ?auto_53413 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_53410 ?auto_53412 ?auto_53408 )
      ( DELIVER-4PKG-VERIFY ?auto_53409 ?auto_53410 ?auto_53411 ?auto_53412 ?auto_53408 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_53438 - OBJ
      ?auto_53439 - OBJ
      ?auto_53440 - OBJ
      ?auto_53441 - OBJ
      ?auto_53437 - LOCATION
    )
    :vars
    (
      ?auto_53443 - LOCATION
      ?auto_53445 - CITY
      ?auto_53444 - LOCATION
      ?auto_53442 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_53439 ?auto_53438 ) ) ( not ( = ?auto_53440 ?auto_53438 ) ) ( not ( = ?auto_53440 ?auto_53439 ) ) ( not ( = ?auto_53441 ?auto_53438 ) ) ( not ( = ?auto_53441 ?auto_53439 ) ) ( not ( = ?auto_53441 ?auto_53440 ) ) ( IN-CITY ?auto_53443 ?auto_53445 ) ( IN-CITY ?auto_53437 ?auto_53445 ) ( not ( = ?auto_53437 ?auto_53443 ) ) ( OBJ-AT ?auto_53440 ?auto_53443 ) ( OBJ-AT ?auto_53438 ?auto_53443 ) ( IN-CITY ?auto_53444 ?auto_53445 ) ( not ( = ?auto_53437 ?auto_53444 ) ) ( not ( = ?auto_53443 ?auto_53444 ) ) ( OBJ-AT ?auto_53441 ?auto_53444 ) ( TRUCK-AT ?auto_53442 ?auto_53437 ) ( IN-TRUCK ?auto_53439 ?auto_53442 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_53439 ?auto_53440 ?auto_53437 )
      ( DELIVER-4PKG-VERIFY ?auto_53438 ?auto_53439 ?auto_53440 ?auto_53441 ?auto_53437 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_53467 - OBJ
      ?auto_53468 - OBJ
      ?auto_53469 - OBJ
      ?auto_53470 - OBJ
      ?auto_53466 - LOCATION
    )
    :vars
    (
      ?auto_53472 - LOCATION
      ?auto_53474 - CITY
      ?auto_53473 - LOCATION
      ?auto_53471 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_53468 ?auto_53467 ) ) ( not ( = ?auto_53469 ?auto_53467 ) ) ( not ( = ?auto_53469 ?auto_53468 ) ) ( not ( = ?auto_53470 ?auto_53467 ) ) ( not ( = ?auto_53470 ?auto_53468 ) ) ( not ( = ?auto_53470 ?auto_53469 ) ) ( IN-CITY ?auto_53472 ?auto_53474 ) ( IN-CITY ?auto_53466 ?auto_53474 ) ( not ( = ?auto_53466 ?auto_53472 ) ) ( OBJ-AT ?auto_53470 ?auto_53472 ) ( OBJ-AT ?auto_53467 ?auto_53472 ) ( IN-CITY ?auto_53473 ?auto_53474 ) ( not ( = ?auto_53466 ?auto_53473 ) ) ( not ( = ?auto_53472 ?auto_53473 ) ) ( OBJ-AT ?auto_53468 ?auto_53473 ) ( TRUCK-AT ?auto_53471 ?auto_53466 ) ( IN-TRUCK ?auto_53469 ?auto_53471 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_53469 ?auto_53470 ?auto_53466 )
      ( DELIVER-4PKG-VERIFY ?auto_53467 ?auto_53468 ?auto_53469 ?auto_53470 ?auto_53466 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_53496 - OBJ
      ?auto_53497 - OBJ
      ?auto_53498 - OBJ
      ?auto_53499 - OBJ
      ?auto_53495 - LOCATION
    )
    :vars
    (
      ?auto_53501 - LOCATION
      ?auto_53503 - CITY
      ?auto_53502 - LOCATION
      ?auto_53500 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_53497 ?auto_53496 ) ) ( not ( = ?auto_53498 ?auto_53496 ) ) ( not ( = ?auto_53498 ?auto_53497 ) ) ( not ( = ?auto_53499 ?auto_53496 ) ) ( not ( = ?auto_53499 ?auto_53497 ) ) ( not ( = ?auto_53499 ?auto_53498 ) ) ( IN-CITY ?auto_53501 ?auto_53503 ) ( IN-CITY ?auto_53495 ?auto_53503 ) ( not ( = ?auto_53495 ?auto_53501 ) ) ( OBJ-AT ?auto_53498 ?auto_53501 ) ( OBJ-AT ?auto_53496 ?auto_53501 ) ( IN-CITY ?auto_53502 ?auto_53503 ) ( not ( = ?auto_53495 ?auto_53502 ) ) ( not ( = ?auto_53501 ?auto_53502 ) ) ( OBJ-AT ?auto_53497 ?auto_53502 ) ( TRUCK-AT ?auto_53500 ?auto_53495 ) ( IN-TRUCK ?auto_53499 ?auto_53500 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_53499 ?auto_53498 ?auto_53495 )
      ( DELIVER-4PKG-VERIFY ?auto_53496 ?auto_53497 ?auto_53498 ?auto_53499 ?auto_53495 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_53618 - OBJ
      ?auto_53619 - OBJ
      ?auto_53620 - OBJ
      ?auto_53621 - OBJ
      ?auto_53617 - LOCATION
    )
    :vars
    (
      ?auto_53623 - LOCATION
      ?auto_53625 - CITY
      ?auto_53624 - LOCATION
      ?auto_53622 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_53619 ?auto_53618 ) ) ( not ( = ?auto_53620 ?auto_53618 ) ) ( not ( = ?auto_53620 ?auto_53619 ) ) ( not ( = ?auto_53621 ?auto_53618 ) ) ( not ( = ?auto_53621 ?auto_53619 ) ) ( not ( = ?auto_53621 ?auto_53620 ) ) ( IN-CITY ?auto_53623 ?auto_53625 ) ( IN-CITY ?auto_53617 ?auto_53625 ) ( not ( = ?auto_53617 ?auto_53623 ) ) ( OBJ-AT ?auto_53619 ?auto_53623 ) ( OBJ-AT ?auto_53618 ?auto_53623 ) ( IN-CITY ?auto_53624 ?auto_53625 ) ( not ( = ?auto_53617 ?auto_53624 ) ) ( not ( = ?auto_53623 ?auto_53624 ) ) ( OBJ-AT ?auto_53621 ?auto_53624 ) ( TRUCK-AT ?auto_53622 ?auto_53617 ) ( IN-TRUCK ?auto_53620 ?auto_53622 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_53620 ?auto_53619 ?auto_53617 )
      ( DELIVER-4PKG-VERIFY ?auto_53618 ?auto_53619 ?auto_53620 ?auto_53621 ?auto_53617 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_53647 - OBJ
      ?auto_53648 - OBJ
      ?auto_53649 - OBJ
      ?auto_53650 - OBJ
      ?auto_53646 - LOCATION
    )
    :vars
    (
      ?auto_53652 - LOCATION
      ?auto_53654 - CITY
      ?auto_53653 - LOCATION
      ?auto_53651 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_53648 ?auto_53647 ) ) ( not ( = ?auto_53649 ?auto_53647 ) ) ( not ( = ?auto_53649 ?auto_53648 ) ) ( not ( = ?auto_53650 ?auto_53647 ) ) ( not ( = ?auto_53650 ?auto_53648 ) ) ( not ( = ?auto_53650 ?auto_53649 ) ) ( IN-CITY ?auto_53652 ?auto_53654 ) ( IN-CITY ?auto_53646 ?auto_53654 ) ( not ( = ?auto_53646 ?auto_53652 ) ) ( OBJ-AT ?auto_53648 ?auto_53652 ) ( OBJ-AT ?auto_53647 ?auto_53652 ) ( IN-CITY ?auto_53653 ?auto_53654 ) ( not ( = ?auto_53646 ?auto_53653 ) ) ( not ( = ?auto_53652 ?auto_53653 ) ) ( OBJ-AT ?auto_53649 ?auto_53653 ) ( TRUCK-AT ?auto_53651 ?auto_53646 ) ( IN-TRUCK ?auto_53650 ?auto_53651 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_53650 ?auto_53648 ?auto_53646 )
      ( DELIVER-4PKG-VERIFY ?auto_53647 ?auto_53648 ?auto_53649 ?auto_53650 ?auto_53646 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_53832 - OBJ
      ?auto_53833 - OBJ
      ?auto_53834 - OBJ
      ?auto_53835 - OBJ
      ?auto_53831 - LOCATION
    )
    :vars
    (
      ?auto_53837 - LOCATION
      ?auto_53839 - CITY
      ?auto_53838 - LOCATION
      ?auto_53836 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_53833 ?auto_53832 ) ) ( not ( = ?auto_53834 ?auto_53832 ) ) ( not ( = ?auto_53834 ?auto_53833 ) ) ( not ( = ?auto_53835 ?auto_53832 ) ) ( not ( = ?auto_53835 ?auto_53833 ) ) ( not ( = ?auto_53835 ?auto_53834 ) ) ( IN-CITY ?auto_53837 ?auto_53839 ) ( IN-CITY ?auto_53831 ?auto_53839 ) ( not ( = ?auto_53831 ?auto_53837 ) ) ( OBJ-AT ?auto_53832 ?auto_53837 ) ( OBJ-AT ?auto_53835 ?auto_53837 ) ( IN-CITY ?auto_53838 ?auto_53839 ) ( not ( = ?auto_53831 ?auto_53838 ) ) ( not ( = ?auto_53837 ?auto_53838 ) ) ( OBJ-AT ?auto_53834 ?auto_53838 ) ( TRUCK-AT ?auto_53836 ?auto_53831 ) ( IN-TRUCK ?auto_53833 ?auto_53836 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_53833 ?auto_53832 ?auto_53831 )
      ( DELIVER-4PKG-VERIFY ?auto_53832 ?auto_53833 ?auto_53834 ?auto_53835 ?auto_53831 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_53861 - OBJ
      ?auto_53862 - OBJ
      ?auto_53863 - OBJ
      ?auto_53864 - OBJ
      ?auto_53860 - LOCATION
    )
    :vars
    (
      ?auto_53866 - LOCATION
      ?auto_53868 - CITY
      ?auto_53867 - LOCATION
      ?auto_53865 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_53862 ?auto_53861 ) ) ( not ( = ?auto_53863 ?auto_53861 ) ) ( not ( = ?auto_53863 ?auto_53862 ) ) ( not ( = ?auto_53864 ?auto_53861 ) ) ( not ( = ?auto_53864 ?auto_53862 ) ) ( not ( = ?auto_53864 ?auto_53863 ) ) ( IN-CITY ?auto_53866 ?auto_53868 ) ( IN-CITY ?auto_53860 ?auto_53868 ) ( not ( = ?auto_53860 ?auto_53866 ) ) ( OBJ-AT ?auto_53861 ?auto_53866 ) ( OBJ-AT ?auto_53863 ?auto_53866 ) ( IN-CITY ?auto_53867 ?auto_53868 ) ( not ( = ?auto_53860 ?auto_53867 ) ) ( not ( = ?auto_53866 ?auto_53867 ) ) ( OBJ-AT ?auto_53864 ?auto_53867 ) ( TRUCK-AT ?auto_53865 ?auto_53860 ) ( IN-TRUCK ?auto_53862 ?auto_53865 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_53862 ?auto_53861 ?auto_53860 )
      ( DELIVER-4PKG-VERIFY ?auto_53861 ?auto_53862 ?auto_53863 ?auto_53864 ?auto_53860 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_53952 - OBJ
      ?auto_53953 - OBJ
      ?auto_53954 - OBJ
      ?auto_53955 - OBJ
      ?auto_53951 - LOCATION
    )
    :vars
    (
      ?auto_53957 - LOCATION
      ?auto_53959 - CITY
      ?auto_53958 - LOCATION
      ?auto_53956 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_53953 ?auto_53952 ) ) ( not ( = ?auto_53954 ?auto_53952 ) ) ( not ( = ?auto_53954 ?auto_53953 ) ) ( not ( = ?auto_53955 ?auto_53952 ) ) ( not ( = ?auto_53955 ?auto_53953 ) ) ( not ( = ?auto_53955 ?auto_53954 ) ) ( IN-CITY ?auto_53957 ?auto_53959 ) ( IN-CITY ?auto_53951 ?auto_53959 ) ( not ( = ?auto_53951 ?auto_53957 ) ) ( OBJ-AT ?auto_53952 ?auto_53957 ) ( OBJ-AT ?auto_53955 ?auto_53957 ) ( IN-CITY ?auto_53958 ?auto_53959 ) ( not ( = ?auto_53951 ?auto_53958 ) ) ( not ( = ?auto_53957 ?auto_53958 ) ) ( OBJ-AT ?auto_53953 ?auto_53958 ) ( TRUCK-AT ?auto_53956 ?auto_53951 ) ( IN-TRUCK ?auto_53954 ?auto_53956 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_53954 ?auto_53952 ?auto_53951 )
      ( DELIVER-4PKG-VERIFY ?auto_53952 ?auto_53953 ?auto_53954 ?auto_53955 ?auto_53951 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_54013 - OBJ
      ?auto_54014 - OBJ
      ?auto_54015 - OBJ
      ?auto_54016 - OBJ
      ?auto_54012 - LOCATION
    )
    :vars
    (
      ?auto_54018 - LOCATION
      ?auto_54020 - CITY
      ?auto_54019 - LOCATION
      ?auto_54017 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54014 ?auto_54013 ) ) ( not ( = ?auto_54015 ?auto_54013 ) ) ( not ( = ?auto_54015 ?auto_54014 ) ) ( not ( = ?auto_54016 ?auto_54013 ) ) ( not ( = ?auto_54016 ?auto_54014 ) ) ( not ( = ?auto_54016 ?auto_54015 ) ) ( IN-CITY ?auto_54018 ?auto_54020 ) ( IN-CITY ?auto_54012 ?auto_54020 ) ( not ( = ?auto_54012 ?auto_54018 ) ) ( OBJ-AT ?auto_54013 ?auto_54018 ) ( OBJ-AT ?auto_54015 ?auto_54018 ) ( IN-CITY ?auto_54019 ?auto_54020 ) ( not ( = ?auto_54012 ?auto_54019 ) ) ( not ( = ?auto_54018 ?auto_54019 ) ) ( OBJ-AT ?auto_54014 ?auto_54019 ) ( TRUCK-AT ?auto_54017 ?auto_54012 ) ( IN-TRUCK ?auto_54016 ?auto_54017 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54016 ?auto_54013 ?auto_54012 )
      ( DELIVER-4PKG-VERIFY ?auto_54013 ?auto_54014 ?auto_54015 ?auto_54016 ?auto_54012 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_54104 - OBJ
      ?auto_54105 - OBJ
      ?auto_54106 - OBJ
      ?auto_54107 - OBJ
      ?auto_54103 - LOCATION
    )
    :vars
    (
      ?auto_54109 - LOCATION
      ?auto_54111 - CITY
      ?auto_54110 - LOCATION
      ?auto_54108 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54105 ?auto_54104 ) ) ( not ( = ?auto_54106 ?auto_54104 ) ) ( not ( = ?auto_54106 ?auto_54105 ) ) ( not ( = ?auto_54107 ?auto_54104 ) ) ( not ( = ?auto_54107 ?auto_54105 ) ) ( not ( = ?auto_54107 ?auto_54106 ) ) ( IN-CITY ?auto_54109 ?auto_54111 ) ( IN-CITY ?auto_54103 ?auto_54111 ) ( not ( = ?auto_54103 ?auto_54109 ) ) ( OBJ-AT ?auto_54104 ?auto_54109 ) ( OBJ-AT ?auto_54105 ?auto_54109 ) ( IN-CITY ?auto_54110 ?auto_54111 ) ( not ( = ?auto_54103 ?auto_54110 ) ) ( not ( = ?auto_54109 ?auto_54110 ) ) ( OBJ-AT ?auto_54107 ?auto_54110 ) ( TRUCK-AT ?auto_54108 ?auto_54103 ) ( IN-TRUCK ?auto_54106 ?auto_54108 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54106 ?auto_54104 ?auto_54103 )
      ( DELIVER-4PKG-VERIFY ?auto_54104 ?auto_54105 ?auto_54106 ?auto_54107 ?auto_54103 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_54133 - OBJ
      ?auto_54134 - OBJ
      ?auto_54135 - OBJ
      ?auto_54136 - OBJ
      ?auto_54132 - LOCATION
    )
    :vars
    (
      ?auto_54138 - LOCATION
      ?auto_54140 - CITY
      ?auto_54139 - LOCATION
      ?auto_54137 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54134 ?auto_54133 ) ) ( not ( = ?auto_54135 ?auto_54133 ) ) ( not ( = ?auto_54135 ?auto_54134 ) ) ( not ( = ?auto_54136 ?auto_54133 ) ) ( not ( = ?auto_54136 ?auto_54134 ) ) ( not ( = ?auto_54136 ?auto_54135 ) ) ( IN-CITY ?auto_54138 ?auto_54140 ) ( IN-CITY ?auto_54132 ?auto_54140 ) ( not ( = ?auto_54132 ?auto_54138 ) ) ( OBJ-AT ?auto_54133 ?auto_54138 ) ( OBJ-AT ?auto_54134 ?auto_54138 ) ( IN-CITY ?auto_54139 ?auto_54140 ) ( not ( = ?auto_54132 ?auto_54139 ) ) ( not ( = ?auto_54138 ?auto_54139 ) ) ( OBJ-AT ?auto_54135 ?auto_54139 ) ( TRUCK-AT ?auto_54137 ?auto_54132 ) ( IN-TRUCK ?auto_54136 ?auto_54137 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54136 ?auto_54133 ?auto_54132 )
      ( DELIVER-4PKG-VERIFY ?auto_54133 ?auto_54134 ?auto_54135 ?auto_54136 ?auto_54132 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_54427 - OBJ
      ?auto_54426 - LOCATION
    )
    :vars
    (
      ?auto_54434 - OBJ
      ?auto_54431 - LOCATION
      ?auto_54433 - CITY
      ?auto_54430 - OBJ
      ?auto_54428 - OBJ
      ?auto_54432 - LOCATION
      ?auto_54429 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54427 ?auto_54434 ) ) ( IN-CITY ?auto_54431 ?auto_54433 ) ( IN-CITY ?auto_54426 ?auto_54433 ) ( not ( = ?auto_54426 ?auto_54431 ) ) ( OBJ-AT ?auto_54427 ?auto_54431 ) ( not ( = ?auto_54430 ?auto_54434 ) ) ( not ( = ?auto_54427 ?auto_54430 ) ) ( OBJ-AT ?auto_54430 ?auto_54431 ) ( not ( = ?auto_54428 ?auto_54434 ) ) ( not ( = ?auto_54427 ?auto_54428 ) ) ( not ( = ?auto_54430 ?auto_54428 ) ) ( IN-CITY ?auto_54432 ?auto_54433 ) ( not ( = ?auto_54426 ?auto_54432 ) ) ( not ( = ?auto_54431 ?auto_54432 ) ) ( OBJ-AT ?auto_54428 ?auto_54432 ) ( IN-TRUCK ?auto_54434 ?auto_54429 ) ( TRUCK-AT ?auto_54429 ?auto_54431 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_54429 ?auto_54431 ?auto_54426 ?auto_54433 )
      ( DELIVER-2PKG ?auto_54434 ?auto_54427 ?auto_54426 )
      ( DELIVER-1PKG-VERIFY ?auto_54427 ?auto_54426 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_54436 - OBJ
      ?auto_54437 - OBJ
      ?auto_54435 - LOCATION
    )
    :vars
    (
      ?auto_54438 - LOCATION
      ?auto_54443 - CITY
      ?auto_54439 - OBJ
      ?auto_54440 - OBJ
      ?auto_54441 - LOCATION
      ?auto_54442 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54437 ?auto_54436 ) ) ( IN-CITY ?auto_54438 ?auto_54443 ) ( IN-CITY ?auto_54435 ?auto_54443 ) ( not ( = ?auto_54435 ?auto_54438 ) ) ( OBJ-AT ?auto_54437 ?auto_54438 ) ( not ( = ?auto_54439 ?auto_54436 ) ) ( not ( = ?auto_54437 ?auto_54439 ) ) ( OBJ-AT ?auto_54439 ?auto_54438 ) ( not ( = ?auto_54440 ?auto_54436 ) ) ( not ( = ?auto_54437 ?auto_54440 ) ) ( not ( = ?auto_54439 ?auto_54440 ) ) ( IN-CITY ?auto_54441 ?auto_54443 ) ( not ( = ?auto_54435 ?auto_54441 ) ) ( not ( = ?auto_54438 ?auto_54441 ) ) ( OBJ-AT ?auto_54440 ?auto_54441 ) ( IN-TRUCK ?auto_54436 ?auto_54442 ) ( TRUCK-AT ?auto_54442 ?auto_54438 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_54437 ?auto_54435 )
      ( DELIVER-2PKG-VERIFY ?auto_54436 ?auto_54437 ?auto_54435 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_54445 - OBJ
      ?auto_54446 - OBJ
      ?auto_54444 - LOCATION
    )
    :vars
    (
      ?auto_54452 - OBJ
      ?auto_54451 - LOCATION
      ?auto_54447 - CITY
      ?auto_54450 - OBJ
      ?auto_54448 - LOCATION
      ?auto_54449 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54446 ?auto_54445 ) ) ( not ( = ?auto_54446 ?auto_54452 ) ) ( IN-CITY ?auto_54451 ?auto_54447 ) ( IN-CITY ?auto_54444 ?auto_54447 ) ( not ( = ?auto_54444 ?auto_54451 ) ) ( OBJ-AT ?auto_54446 ?auto_54451 ) ( not ( = ?auto_54450 ?auto_54452 ) ) ( not ( = ?auto_54446 ?auto_54450 ) ) ( OBJ-AT ?auto_54450 ?auto_54451 ) ( not ( = ?auto_54445 ?auto_54452 ) ) ( not ( = ?auto_54450 ?auto_54445 ) ) ( IN-CITY ?auto_54448 ?auto_54447 ) ( not ( = ?auto_54444 ?auto_54448 ) ) ( not ( = ?auto_54451 ?auto_54448 ) ) ( OBJ-AT ?auto_54445 ?auto_54448 ) ( IN-TRUCK ?auto_54452 ?auto_54449 ) ( TRUCK-AT ?auto_54449 ?auto_54451 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54452 ?auto_54446 ?auto_54444 )
      ( DELIVER-2PKG-VERIFY ?auto_54445 ?auto_54446 ?auto_54444 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_54454 - OBJ
      ?auto_54455 - OBJ
      ?auto_54453 - LOCATION
    )
    :vars
    (
      ?auto_54461 - OBJ
      ?auto_54459 - LOCATION
      ?auto_54456 - CITY
      ?auto_54460 - OBJ
      ?auto_54457 - LOCATION
      ?auto_54458 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54455 ?auto_54454 ) ) ( not ( = ?auto_54455 ?auto_54461 ) ) ( IN-CITY ?auto_54459 ?auto_54456 ) ( IN-CITY ?auto_54453 ?auto_54456 ) ( not ( = ?auto_54453 ?auto_54459 ) ) ( OBJ-AT ?auto_54455 ?auto_54459 ) ( not ( = ?auto_54454 ?auto_54461 ) ) ( OBJ-AT ?auto_54454 ?auto_54459 ) ( not ( = ?auto_54460 ?auto_54461 ) ) ( not ( = ?auto_54455 ?auto_54460 ) ) ( not ( = ?auto_54454 ?auto_54460 ) ) ( IN-CITY ?auto_54457 ?auto_54456 ) ( not ( = ?auto_54453 ?auto_54457 ) ) ( not ( = ?auto_54459 ?auto_54457 ) ) ( OBJ-AT ?auto_54460 ?auto_54457 ) ( IN-TRUCK ?auto_54461 ?auto_54458 ) ( TRUCK-AT ?auto_54458 ?auto_54459 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54461 ?auto_54455 ?auto_54453 )
      ( DELIVER-2PKG-VERIFY ?auto_54454 ?auto_54455 ?auto_54453 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_54463 - OBJ
      ?auto_54464 - OBJ
      ?auto_54462 - LOCATION
    )
    :vars
    (
      ?auto_54469 - LOCATION
      ?auto_54465 - CITY
      ?auto_54468 - OBJ
      ?auto_54470 - OBJ
      ?auto_54466 - LOCATION
      ?auto_54467 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54464 ?auto_54463 ) ) ( IN-CITY ?auto_54469 ?auto_54465 ) ( IN-CITY ?auto_54462 ?auto_54465 ) ( not ( = ?auto_54462 ?auto_54469 ) ) ( OBJ-AT ?auto_54463 ?auto_54469 ) ( not ( = ?auto_54468 ?auto_54464 ) ) ( not ( = ?auto_54463 ?auto_54468 ) ) ( OBJ-AT ?auto_54468 ?auto_54469 ) ( not ( = ?auto_54470 ?auto_54464 ) ) ( not ( = ?auto_54463 ?auto_54470 ) ) ( not ( = ?auto_54468 ?auto_54470 ) ) ( IN-CITY ?auto_54466 ?auto_54465 ) ( not ( = ?auto_54462 ?auto_54466 ) ) ( not ( = ?auto_54469 ?auto_54466 ) ) ( OBJ-AT ?auto_54470 ?auto_54466 ) ( IN-TRUCK ?auto_54464 ?auto_54467 ) ( TRUCK-AT ?auto_54467 ?auto_54469 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54464 ?auto_54463 ?auto_54462 )
      ( DELIVER-2PKG-VERIFY ?auto_54463 ?auto_54464 ?auto_54462 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_54472 - OBJ
      ?auto_54473 - OBJ
      ?auto_54471 - LOCATION
    )
    :vars
    (
      ?auto_54479 - OBJ
      ?auto_54478 - LOCATION
      ?auto_54474 - CITY
      ?auto_54477 - OBJ
      ?auto_54475 - LOCATION
      ?auto_54476 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54473 ?auto_54472 ) ) ( not ( = ?auto_54472 ?auto_54479 ) ) ( IN-CITY ?auto_54478 ?auto_54474 ) ( IN-CITY ?auto_54471 ?auto_54474 ) ( not ( = ?auto_54471 ?auto_54478 ) ) ( OBJ-AT ?auto_54472 ?auto_54478 ) ( not ( = ?auto_54477 ?auto_54479 ) ) ( not ( = ?auto_54472 ?auto_54477 ) ) ( OBJ-AT ?auto_54477 ?auto_54478 ) ( not ( = ?auto_54473 ?auto_54479 ) ) ( not ( = ?auto_54477 ?auto_54473 ) ) ( IN-CITY ?auto_54475 ?auto_54474 ) ( not ( = ?auto_54471 ?auto_54475 ) ) ( not ( = ?auto_54478 ?auto_54475 ) ) ( OBJ-AT ?auto_54473 ?auto_54475 ) ( IN-TRUCK ?auto_54479 ?auto_54476 ) ( TRUCK-AT ?auto_54476 ?auto_54478 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54479 ?auto_54472 ?auto_54471 )
      ( DELIVER-2PKG-VERIFY ?auto_54472 ?auto_54473 ?auto_54471 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_54481 - OBJ
      ?auto_54482 - OBJ
      ?auto_54480 - LOCATION
    )
    :vars
    (
      ?auto_54488 - OBJ
      ?auto_54486 - LOCATION
      ?auto_54483 - CITY
      ?auto_54487 - OBJ
      ?auto_54484 - LOCATION
      ?auto_54485 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54482 ?auto_54481 ) ) ( not ( = ?auto_54481 ?auto_54488 ) ) ( IN-CITY ?auto_54486 ?auto_54483 ) ( IN-CITY ?auto_54480 ?auto_54483 ) ( not ( = ?auto_54480 ?auto_54486 ) ) ( OBJ-AT ?auto_54481 ?auto_54486 ) ( not ( = ?auto_54482 ?auto_54488 ) ) ( OBJ-AT ?auto_54482 ?auto_54486 ) ( not ( = ?auto_54487 ?auto_54488 ) ) ( not ( = ?auto_54481 ?auto_54487 ) ) ( not ( = ?auto_54482 ?auto_54487 ) ) ( IN-CITY ?auto_54484 ?auto_54483 ) ( not ( = ?auto_54480 ?auto_54484 ) ) ( not ( = ?auto_54486 ?auto_54484 ) ) ( OBJ-AT ?auto_54487 ?auto_54484 ) ( IN-TRUCK ?auto_54488 ?auto_54485 ) ( TRUCK-AT ?auto_54485 ?auto_54486 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54488 ?auto_54481 ?auto_54480 )
      ( DELIVER-2PKG-VERIFY ?auto_54481 ?auto_54482 ?auto_54480 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_54510 - OBJ
      ?auto_54511 - OBJ
      ?auto_54512 - OBJ
      ?auto_54509 - LOCATION
    )
    :vars
    (
      ?auto_54517 - LOCATION
      ?auto_54513 - CITY
      ?auto_54516 - OBJ
      ?auto_54514 - LOCATION
      ?auto_54515 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54511 ?auto_54510 ) ) ( not ( = ?auto_54512 ?auto_54510 ) ) ( not ( = ?auto_54512 ?auto_54511 ) ) ( IN-CITY ?auto_54517 ?auto_54513 ) ( IN-CITY ?auto_54509 ?auto_54513 ) ( not ( = ?auto_54509 ?auto_54517 ) ) ( OBJ-AT ?auto_54512 ?auto_54517 ) ( not ( = ?auto_54516 ?auto_54510 ) ) ( not ( = ?auto_54512 ?auto_54516 ) ) ( OBJ-AT ?auto_54516 ?auto_54517 ) ( not ( = ?auto_54516 ?auto_54511 ) ) ( IN-CITY ?auto_54514 ?auto_54513 ) ( not ( = ?auto_54509 ?auto_54514 ) ) ( not ( = ?auto_54517 ?auto_54514 ) ) ( OBJ-AT ?auto_54511 ?auto_54514 ) ( IN-TRUCK ?auto_54510 ?auto_54515 ) ( TRUCK-AT ?auto_54515 ?auto_54517 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54510 ?auto_54512 ?auto_54509 )
      ( DELIVER-3PKG-VERIFY ?auto_54510 ?auto_54511 ?auto_54512 ?auto_54509 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_54519 - OBJ
      ?auto_54520 - OBJ
      ?auto_54521 - OBJ
      ?auto_54518 - LOCATION
    )
    :vars
    (
      ?auto_54525 - LOCATION
      ?auto_54522 - CITY
      ?auto_54526 - OBJ
      ?auto_54523 - LOCATION
      ?auto_54524 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54520 ?auto_54519 ) ) ( not ( = ?auto_54521 ?auto_54519 ) ) ( not ( = ?auto_54521 ?auto_54520 ) ) ( IN-CITY ?auto_54525 ?auto_54522 ) ( IN-CITY ?auto_54518 ?auto_54522 ) ( not ( = ?auto_54518 ?auto_54525 ) ) ( OBJ-AT ?auto_54521 ?auto_54525 ) ( OBJ-AT ?auto_54520 ?auto_54525 ) ( not ( = ?auto_54526 ?auto_54519 ) ) ( not ( = ?auto_54521 ?auto_54526 ) ) ( not ( = ?auto_54520 ?auto_54526 ) ) ( IN-CITY ?auto_54523 ?auto_54522 ) ( not ( = ?auto_54518 ?auto_54523 ) ) ( not ( = ?auto_54525 ?auto_54523 ) ) ( OBJ-AT ?auto_54526 ?auto_54523 ) ( IN-TRUCK ?auto_54519 ?auto_54524 ) ( TRUCK-AT ?auto_54524 ?auto_54525 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54519 ?auto_54521 ?auto_54518 )
      ( DELIVER-3PKG-VERIFY ?auto_54519 ?auto_54520 ?auto_54521 ?auto_54518 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_54538 - OBJ
      ?auto_54539 - OBJ
      ?auto_54540 - OBJ
      ?auto_54537 - LOCATION
    )
    :vars
    (
      ?auto_54545 - LOCATION
      ?auto_54541 - CITY
      ?auto_54544 - OBJ
      ?auto_54542 - LOCATION
      ?auto_54543 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54539 ?auto_54538 ) ) ( not ( = ?auto_54540 ?auto_54538 ) ) ( not ( = ?auto_54540 ?auto_54539 ) ) ( IN-CITY ?auto_54545 ?auto_54541 ) ( IN-CITY ?auto_54537 ?auto_54541 ) ( not ( = ?auto_54537 ?auto_54545 ) ) ( OBJ-AT ?auto_54539 ?auto_54545 ) ( not ( = ?auto_54544 ?auto_54538 ) ) ( not ( = ?auto_54539 ?auto_54544 ) ) ( OBJ-AT ?auto_54544 ?auto_54545 ) ( not ( = ?auto_54544 ?auto_54540 ) ) ( IN-CITY ?auto_54542 ?auto_54541 ) ( not ( = ?auto_54537 ?auto_54542 ) ) ( not ( = ?auto_54545 ?auto_54542 ) ) ( OBJ-AT ?auto_54540 ?auto_54542 ) ( IN-TRUCK ?auto_54538 ?auto_54543 ) ( TRUCK-AT ?auto_54543 ?auto_54545 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54538 ?auto_54539 ?auto_54537 )
      ( DELIVER-3PKG-VERIFY ?auto_54538 ?auto_54539 ?auto_54540 ?auto_54537 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_54547 - OBJ
      ?auto_54548 - OBJ
      ?auto_54549 - OBJ
      ?auto_54546 - LOCATION
    )
    :vars
    (
      ?auto_54553 - LOCATION
      ?auto_54550 - CITY
      ?auto_54554 - OBJ
      ?auto_54551 - LOCATION
      ?auto_54552 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54548 ?auto_54547 ) ) ( not ( = ?auto_54549 ?auto_54547 ) ) ( not ( = ?auto_54549 ?auto_54548 ) ) ( IN-CITY ?auto_54553 ?auto_54550 ) ( IN-CITY ?auto_54546 ?auto_54550 ) ( not ( = ?auto_54546 ?auto_54553 ) ) ( OBJ-AT ?auto_54548 ?auto_54553 ) ( OBJ-AT ?auto_54549 ?auto_54553 ) ( not ( = ?auto_54554 ?auto_54547 ) ) ( not ( = ?auto_54548 ?auto_54554 ) ) ( not ( = ?auto_54549 ?auto_54554 ) ) ( IN-CITY ?auto_54551 ?auto_54550 ) ( not ( = ?auto_54546 ?auto_54551 ) ) ( not ( = ?auto_54553 ?auto_54551 ) ) ( OBJ-AT ?auto_54554 ?auto_54551 ) ( IN-TRUCK ?auto_54547 ?auto_54552 ) ( TRUCK-AT ?auto_54552 ?auto_54553 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54547 ?auto_54548 ?auto_54546 )
      ( DELIVER-3PKG-VERIFY ?auto_54547 ?auto_54548 ?auto_54549 ?auto_54546 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_54566 - OBJ
      ?auto_54567 - OBJ
      ?auto_54568 - OBJ
      ?auto_54565 - LOCATION
    )
    :vars
    (
      ?auto_54573 - LOCATION
      ?auto_54569 - CITY
      ?auto_54572 - OBJ
      ?auto_54570 - LOCATION
      ?auto_54571 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54567 ?auto_54566 ) ) ( not ( = ?auto_54568 ?auto_54566 ) ) ( not ( = ?auto_54568 ?auto_54567 ) ) ( IN-CITY ?auto_54573 ?auto_54569 ) ( IN-CITY ?auto_54565 ?auto_54569 ) ( not ( = ?auto_54565 ?auto_54573 ) ) ( OBJ-AT ?auto_54568 ?auto_54573 ) ( not ( = ?auto_54572 ?auto_54567 ) ) ( not ( = ?auto_54568 ?auto_54572 ) ) ( OBJ-AT ?auto_54572 ?auto_54573 ) ( not ( = ?auto_54572 ?auto_54566 ) ) ( IN-CITY ?auto_54570 ?auto_54569 ) ( not ( = ?auto_54565 ?auto_54570 ) ) ( not ( = ?auto_54573 ?auto_54570 ) ) ( OBJ-AT ?auto_54566 ?auto_54570 ) ( IN-TRUCK ?auto_54567 ?auto_54571 ) ( TRUCK-AT ?auto_54571 ?auto_54573 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54567 ?auto_54568 ?auto_54565 )
      ( DELIVER-3PKG-VERIFY ?auto_54566 ?auto_54567 ?auto_54568 ?auto_54565 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_54585 - OBJ
      ?auto_54586 - OBJ
      ?auto_54587 - OBJ
      ?auto_54584 - LOCATION
    )
    :vars
    (
      ?auto_54592 - OBJ
      ?auto_54591 - LOCATION
      ?auto_54588 - CITY
      ?auto_54589 - LOCATION
      ?auto_54590 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54586 ?auto_54585 ) ) ( not ( = ?auto_54587 ?auto_54585 ) ) ( not ( = ?auto_54587 ?auto_54586 ) ) ( not ( = ?auto_54587 ?auto_54592 ) ) ( IN-CITY ?auto_54591 ?auto_54588 ) ( IN-CITY ?auto_54584 ?auto_54588 ) ( not ( = ?auto_54584 ?auto_54591 ) ) ( OBJ-AT ?auto_54587 ?auto_54591 ) ( not ( = ?auto_54586 ?auto_54592 ) ) ( OBJ-AT ?auto_54586 ?auto_54591 ) ( not ( = ?auto_54585 ?auto_54592 ) ) ( IN-CITY ?auto_54589 ?auto_54588 ) ( not ( = ?auto_54584 ?auto_54589 ) ) ( not ( = ?auto_54591 ?auto_54589 ) ) ( OBJ-AT ?auto_54585 ?auto_54589 ) ( IN-TRUCK ?auto_54592 ?auto_54590 ) ( TRUCK-AT ?auto_54590 ?auto_54591 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54592 ?auto_54587 ?auto_54584 )
      ( DELIVER-3PKG-VERIFY ?auto_54585 ?auto_54586 ?auto_54587 ?auto_54584 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_54594 - OBJ
      ?auto_54595 - OBJ
      ?auto_54596 - OBJ
      ?auto_54593 - LOCATION
    )
    :vars
    (
      ?auto_54601 - LOCATION
      ?auto_54597 - CITY
      ?auto_54600 - OBJ
      ?auto_54598 - LOCATION
      ?auto_54599 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54595 ?auto_54594 ) ) ( not ( = ?auto_54596 ?auto_54594 ) ) ( not ( = ?auto_54596 ?auto_54595 ) ) ( IN-CITY ?auto_54601 ?auto_54597 ) ( IN-CITY ?auto_54593 ?auto_54597 ) ( not ( = ?auto_54593 ?auto_54601 ) ) ( OBJ-AT ?auto_54595 ?auto_54601 ) ( not ( = ?auto_54600 ?auto_54596 ) ) ( not ( = ?auto_54595 ?auto_54600 ) ) ( OBJ-AT ?auto_54600 ?auto_54601 ) ( not ( = ?auto_54600 ?auto_54594 ) ) ( IN-CITY ?auto_54598 ?auto_54597 ) ( not ( = ?auto_54593 ?auto_54598 ) ) ( not ( = ?auto_54601 ?auto_54598 ) ) ( OBJ-AT ?auto_54594 ?auto_54598 ) ( IN-TRUCK ?auto_54596 ?auto_54599 ) ( TRUCK-AT ?auto_54599 ?auto_54601 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54596 ?auto_54595 ?auto_54593 )
      ( DELIVER-3PKG-VERIFY ?auto_54594 ?auto_54595 ?auto_54596 ?auto_54593 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_54613 - OBJ
      ?auto_54614 - OBJ
      ?auto_54615 - OBJ
      ?auto_54612 - LOCATION
    )
    :vars
    (
      ?auto_54620 - OBJ
      ?auto_54619 - LOCATION
      ?auto_54616 - CITY
      ?auto_54617 - LOCATION
      ?auto_54618 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54614 ?auto_54613 ) ) ( not ( = ?auto_54615 ?auto_54613 ) ) ( not ( = ?auto_54615 ?auto_54614 ) ) ( not ( = ?auto_54614 ?auto_54620 ) ) ( IN-CITY ?auto_54619 ?auto_54616 ) ( IN-CITY ?auto_54612 ?auto_54616 ) ( not ( = ?auto_54612 ?auto_54619 ) ) ( OBJ-AT ?auto_54614 ?auto_54619 ) ( not ( = ?auto_54615 ?auto_54620 ) ) ( OBJ-AT ?auto_54615 ?auto_54619 ) ( not ( = ?auto_54613 ?auto_54620 ) ) ( IN-CITY ?auto_54617 ?auto_54616 ) ( not ( = ?auto_54612 ?auto_54617 ) ) ( not ( = ?auto_54619 ?auto_54617 ) ) ( OBJ-AT ?auto_54613 ?auto_54617 ) ( IN-TRUCK ?auto_54620 ?auto_54618 ) ( TRUCK-AT ?auto_54618 ?auto_54619 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54620 ?auto_54614 ?auto_54612 )
      ( DELIVER-3PKG-VERIFY ?auto_54613 ?auto_54614 ?auto_54615 ?auto_54612 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_54632 - OBJ
      ?auto_54633 - OBJ
      ?auto_54634 - OBJ
      ?auto_54631 - LOCATION
    )
    :vars
    (
      ?auto_54638 - LOCATION
      ?auto_54635 - CITY
      ?auto_54639 - OBJ
      ?auto_54636 - LOCATION
      ?auto_54637 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54633 ?auto_54632 ) ) ( not ( = ?auto_54634 ?auto_54632 ) ) ( not ( = ?auto_54634 ?auto_54633 ) ) ( IN-CITY ?auto_54638 ?auto_54635 ) ( IN-CITY ?auto_54631 ?auto_54635 ) ( not ( = ?auto_54631 ?auto_54638 ) ) ( OBJ-AT ?auto_54634 ?auto_54638 ) ( OBJ-AT ?auto_54632 ?auto_54638 ) ( not ( = ?auto_54639 ?auto_54633 ) ) ( not ( = ?auto_54634 ?auto_54639 ) ) ( not ( = ?auto_54632 ?auto_54639 ) ) ( IN-CITY ?auto_54636 ?auto_54635 ) ( not ( = ?auto_54631 ?auto_54636 ) ) ( not ( = ?auto_54638 ?auto_54636 ) ) ( OBJ-AT ?auto_54639 ?auto_54636 ) ( IN-TRUCK ?auto_54633 ?auto_54637 ) ( TRUCK-AT ?auto_54637 ?auto_54638 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54633 ?auto_54634 ?auto_54631 )
      ( DELIVER-3PKG-VERIFY ?auto_54632 ?auto_54633 ?auto_54634 ?auto_54631 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_54641 - OBJ
      ?auto_54642 - OBJ
      ?auto_54643 - OBJ
      ?auto_54640 - LOCATION
    )
    :vars
    (
      ?auto_54648 - OBJ
      ?auto_54647 - LOCATION
      ?auto_54644 - CITY
      ?auto_54645 - LOCATION
      ?auto_54646 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54642 ?auto_54641 ) ) ( not ( = ?auto_54643 ?auto_54641 ) ) ( not ( = ?auto_54643 ?auto_54642 ) ) ( not ( = ?auto_54643 ?auto_54648 ) ) ( IN-CITY ?auto_54647 ?auto_54644 ) ( IN-CITY ?auto_54640 ?auto_54644 ) ( not ( = ?auto_54640 ?auto_54647 ) ) ( OBJ-AT ?auto_54643 ?auto_54647 ) ( not ( = ?auto_54641 ?auto_54648 ) ) ( OBJ-AT ?auto_54641 ?auto_54647 ) ( not ( = ?auto_54642 ?auto_54648 ) ) ( IN-CITY ?auto_54645 ?auto_54644 ) ( not ( = ?auto_54640 ?auto_54645 ) ) ( not ( = ?auto_54647 ?auto_54645 ) ) ( OBJ-AT ?auto_54642 ?auto_54645 ) ( IN-TRUCK ?auto_54648 ?auto_54646 ) ( TRUCK-AT ?auto_54646 ?auto_54647 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54648 ?auto_54643 ?auto_54640 )
      ( DELIVER-3PKG-VERIFY ?auto_54641 ?auto_54642 ?auto_54643 ?auto_54640 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_54660 - OBJ
      ?auto_54661 - OBJ
      ?auto_54662 - OBJ
      ?auto_54659 - LOCATION
    )
    :vars
    (
      ?auto_54666 - LOCATION
      ?auto_54663 - CITY
      ?auto_54667 - OBJ
      ?auto_54664 - LOCATION
      ?auto_54665 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54661 ?auto_54660 ) ) ( not ( = ?auto_54662 ?auto_54660 ) ) ( not ( = ?auto_54662 ?auto_54661 ) ) ( IN-CITY ?auto_54666 ?auto_54663 ) ( IN-CITY ?auto_54659 ?auto_54663 ) ( not ( = ?auto_54659 ?auto_54666 ) ) ( OBJ-AT ?auto_54661 ?auto_54666 ) ( OBJ-AT ?auto_54660 ?auto_54666 ) ( not ( = ?auto_54667 ?auto_54662 ) ) ( not ( = ?auto_54661 ?auto_54667 ) ) ( not ( = ?auto_54660 ?auto_54667 ) ) ( IN-CITY ?auto_54664 ?auto_54663 ) ( not ( = ?auto_54659 ?auto_54664 ) ) ( not ( = ?auto_54666 ?auto_54664 ) ) ( OBJ-AT ?auto_54667 ?auto_54664 ) ( IN-TRUCK ?auto_54662 ?auto_54665 ) ( TRUCK-AT ?auto_54665 ?auto_54666 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54662 ?auto_54661 ?auto_54659 )
      ( DELIVER-3PKG-VERIFY ?auto_54660 ?auto_54661 ?auto_54662 ?auto_54659 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_54669 - OBJ
      ?auto_54670 - OBJ
      ?auto_54671 - OBJ
      ?auto_54668 - LOCATION
    )
    :vars
    (
      ?auto_54676 - OBJ
      ?auto_54675 - LOCATION
      ?auto_54672 - CITY
      ?auto_54673 - LOCATION
      ?auto_54674 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54670 ?auto_54669 ) ) ( not ( = ?auto_54671 ?auto_54669 ) ) ( not ( = ?auto_54671 ?auto_54670 ) ) ( not ( = ?auto_54670 ?auto_54676 ) ) ( IN-CITY ?auto_54675 ?auto_54672 ) ( IN-CITY ?auto_54668 ?auto_54672 ) ( not ( = ?auto_54668 ?auto_54675 ) ) ( OBJ-AT ?auto_54670 ?auto_54675 ) ( not ( = ?auto_54669 ?auto_54676 ) ) ( OBJ-AT ?auto_54669 ?auto_54675 ) ( not ( = ?auto_54671 ?auto_54676 ) ) ( IN-CITY ?auto_54673 ?auto_54672 ) ( not ( = ?auto_54668 ?auto_54673 ) ) ( not ( = ?auto_54675 ?auto_54673 ) ) ( OBJ-AT ?auto_54671 ?auto_54673 ) ( IN-TRUCK ?auto_54676 ?auto_54674 ) ( TRUCK-AT ?auto_54674 ?auto_54675 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54676 ?auto_54670 ?auto_54668 )
      ( DELIVER-3PKG-VERIFY ?auto_54669 ?auto_54670 ?auto_54671 ?auto_54668 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_54708 - OBJ
      ?auto_54709 - OBJ
      ?auto_54710 - OBJ
      ?auto_54707 - LOCATION
    )
    :vars
    (
      ?auto_54715 - LOCATION
      ?auto_54711 - CITY
      ?auto_54714 - OBJ
      ?auto_54712 - LOCATION
      ?auto_54713 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54709 ?auto_54708 ) ) ( not ( = ?auto_54710 ?auto_54708 ) ) ( not ( = ?auto_54710 ?auto_54709 ) ) ( IN-CITY ?auto_54715 ?auto_54711 ) ( IN-CITY ?auto_54707 ?auto_54711 ) ( not ( = ?auto_54707 ?auto_54715 ) ) ( OBJ-AT ?auto_54708 ?auto_54715 ) ( not ( = ?auto_54714 ?auto_54709 ) ) ( not ( = ?auto_54708 ?auto_54714 ) ) ( OBJ-AT ?auto_54714 ?auto_54715 ) ( not ( = ?auto_54714 ?auto_54710 ) ) ( IN-CITY ?auto_54712 ?auto_54711 ) ( not ( = ?auto_54707 ?auto_54712 ) ) ( not ( = ?auto_54715 ?auto_54712 ) ) ( OBJ-AT ?auto_54710 ?auto_54712 ) ( IN-TRUCK ?auto_54709 ?auto_54713 ) ( TRUCK-AT ?auto_54713 ?auto_54715 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54709 ?auto_54708 ?auto_54707 )
      ( DELIVER-3PKG-VERIFY ?auto_54708 ?auto_54709 ?auto_54710 ?auto_54707 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_54717 - OBJ
      ?auto_54718 - OBJ
      ?auto_54719 - OBJ
      ?auto_54716 - LOCATION
    )
    :vars
    (
      ?auto_54723 - LOCATION
      ?auto_54720 - CITY
      ?auto_54724 - OBJ
      ?auto_54721 - LOCATION
      ?auto_54722 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54718 ?auto_54717 ) ) ( not ( = ?auto_54719 ?auto_54717 ) ) ( not ( = ?auto_54719 ?auto_54718 ) ) ( IN-CITY ?auto_54723 ?auto_54720 ) ( IN-CITY ?auto_54716 ?auto_54720 ) ( not ( = ?auto_54716 ?auto_54723 ) ) ( OBJ-AT ?auto_54717 ?auto_54723 ) ( OBJ-AT ?auto_54719 ?auto_54723 ) ( not ( = ?auto_54724 ?auto_54718 ) ) ( not ( = ?auto_54717 ?auto_54724 ) ) ( not ( = ?auto_54719 ?auto_54724 ) ) ( IN-CITY ?auto_54721 ?auto_54720 ) ( not ( = ?auto_54716 ?auto_54721 ) ) ( not ( = ?auto_54723 ?auto_54721 ) ) ( OBJ-AT ?auto_54724 ?auto_54721 ) ( IN-TRUCK ?auto_54718 ?auto_54722 ) ( TRUCK-AT ?auto_54722 ?auto_54723 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54718 ?auto_54717 ?auto_54716 )
      ( DELIVER-3PKG-VERIFY ?auto_54717 ?auto_54718 ?auto_54719 ?auto_54716 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_54736 - OBJ
      ?auto_54737 - OBJ
      ?auto_54738 - OBJ
      ?auto_54735 - LOCATION
    )
    :vars
    (
      ?auto_54743 - LOCATION
      ?auto_54739 - CITY
      ?auto_54742 - OBJ
      ?auto_54740 - LOCATION
      ?auto_54741 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54737 ?auto_54736 ) ) ( not ( = ?auto_54738 ?auto_54736 ) ) ( not ( = ?auto_54738 ?auto_54737 ) ) ( IN-CITY ?auto_54743 ?auto_54739 ) ( IN-CITY ?auto_54735 ?auto_54739 ) ( not ( = ?auto_54735 ?auto_54743 ) ) ( OBJ-AT ?auto_54736 ?auto_54743 ) ( not ( = ?auto_54742 ?auto_54738 ) ) ( not ( = ?auto_54736 ?auto_54742 ) ) ( OBJ-AT ?auto_54742 ?auto_54743 ) ( not ( = ?auto_54742 ?auto_54737 ) ) ( IN-CITY ?auto_54740 ?auto_54739 ) ( not ( = ?auto_54735 ?auto_54740 ) ) ( not ( = ?auto_54743 ?auto_54740 ) ) ( OBJ-AT ?auto_54737 ?auto_54740 ) ( IN-TRUCK ?auto_54738 ?auto_54741 ) ( TRUCK-AT ?auto_54741 ?auto_54743 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54738 ?auto_54736 ?auto_54735 )
      ( DELIVER-3PKG-VERIFY ?auto_54736 ?auto_54737 ?auto_54738 ?auto_54735 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_54755 - OBJ
      ?auto_54756 - OBJ
      ?auto_54757 - OBJ
      ?auto_54754 - LOCATION
    )
    :vars
    (
      ?auto_54762 - OBJ
      ?auto_54761 - LOCATION
      ?auto_54758 - CITY
      ?auto_54759 - LOCATION
      ?auto_54760 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54756 ?auto_54755 ) ) ( not ( = ?auto_54757 ?auto_54755 ) ) ( not ( = ?auto_54757 ?auto_54756 ) ) ( not ( = ?auto_54755 ?auto_54762 ) ) ( IN-CITY ?auto_54761 ?auto_54758 ) ( IN-CITY ?auto_54754 ?auto_54758 ) ( not ( = ?auto_54754 ?auto_54761 ) ) ( OBJ-AT ?auto_54755 ?auto_54761 ) ( not ( = ?auto_54757 ?auto_54762 ) ) ( OBJ-AT ?auto_54757 ?auto_54761 ) ( not ( = ?auto_54756 ?auto_54762 ) ) ( IN-CITY ?auto_54759 ?auto_54758 ) ( not ( = ?auto_54754 ?auto_54759 ) ) ( not ( = ?auto_54761 ?auto_54759 ) ) ( OBJ-AT ?auto_54756 ?auto_54759 ) ( IN-TRUCK ?auto_54762 ?auto_54760 ) ( TRUCK-AT ?auto_54760 ?auto_54761 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54762 ?auto_54755 ?auto_54754 )
      ( DELIVER-3PKG-VERIFY ?auto_54755 ?auto_54756 ?auto_54757 ?auto_54754 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_54774 - OBJ
      ?auto_54775 - OBJ
      ?auto_54776 - OBJ
      ?auto_54773 - LOCATION
    )
    :vars
    (
      ?auto_54780 - LOCATION
      ?auto_54777 - CITY
      ?auto_54781 - OBJ
      ?auto_54778 - LOCATION
      ?auto_54779 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54775 ?auto_54774 ) ) ( not ( = ?auto_54776 ?auto_54774 ) ) ( not ( = ?auto_54776 ?auto_54775 ) ) ( IN-CITY ?auto_54780 ?auto_54777 ) ( IN-CITY ?auto_54773 ?auto_54777 ) ( not ( = ?auto_54773 ?auto_54780 ) ) ( OBJ-AT ?auto_54774 ?auto_54780 ) ( OBJ-AT ?auto_54775 ?auto_54780 ) ( not ( = ?auto_54781 ?auto_54776 ) ) ( not ( = ?auto_54774 ?auto_54781 ) ) ( not ( = ?auto_54775 ?auto_54781 ) ) ( IN-CITY ?auto_54778 ?auto_54777 ) ( not ( = ?auto_54773 ?auto_54778 ) ) ( not ( = ?auto_54780 ?auto_54778 ) ) ( OBJ-AT ?auto_54781 ?auto_54778 ) ( IN-TRUCK ?auto_54776 ?auto_54779 ) ( TRUCK-AT ?auto_54779 ?auto_54780 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54776 ?auto_54774 ?auto_54773 )
      ( DELIVER-3PKG-VERIFY ?auto_54774 ?auto_54775 ?auto_54776 ?auto_54773 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_54783 - OBJ
      ?auto_54784 - OBJ
      ?auto_54785 - OBJ
      ?auto_54782 - LOCATION
    )
    :vars
    (
      ?auto_54790 - OBJ
      ?auto_54789 - LOCATION
      ?auto_54786 - CITY
      ?auto_54787 - LOCATION
      ?auto_54788 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54784 ?auto_54783 ) ) ( not ( = ?auto_54785 ?auto_54783 ) ) ( not ( = ?auto_54785 ?auto_54784 ) ) ( not ( = ?auto_54783 ?auto_54790 ) ) ( IN-CITY ?auto_54789 ?auto_54786 ) ( IN-CITY ?auto_54782 ?auto_54786 ) ( not ( = ?auto_54782 ?auto_54789 ) ) ( OBJ-AT ?auto_54783 ?auto_54789 ) ( not ( = ?auto_54784 ?auto_54790 ) ) ( OBJ-AT ?auto_54784 ?auto_54789 ) ( not ( = ?auto_54785 ?auto_54790 ) ) ( IN-CITY ?auto_54787 ?auto_54786 ) ( not ( = ?auto_54782 ?auto_54787 ) ) ( not ( = ?auto_54789 ?auto_54787 ) ) ( OBJ-AT ?auto_54785 ?auto_54787 ) ( IN-TRUCK ?auto_54790 ?auto_54788 ) ( TRUCK-AT ?auto_54788 ?auto_54789 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54790 ?auto_54783 ?auto_54782 )
      ( DELIVER-3PKG-VERIFY ?auto_54783 ?auto_54784 ?auto_54785 ?auto_54782 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_54946 - OBJ
      ?auto_54947 - OBJ
      ?auto_54948 - OBJ
      ?auto_54949 - OBJ
      ?auto_54945 - LOCATION
    )
    :vars
    (
      ?auto_54953 - LOCATION
      ?auto_54950 - CITY
      ?auto_54951 - LOCATION
      ?auto_54952 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54947 ?auto_54946 ) ) ( not ( = ?auto_54948 ?auto_54946 ) ) ( not ( = ?auto_54948 ?auto_54947 ) ) ( not ( = ?auto_54949 ?auto_54946 ) ) ( not ( = ?auto_54949 ?auto_54947 ) ) ( not ( = ?auto_54949 ?auto_54948 ) ) ( IN-CITY ?auto_54953 ?auto_54950 ) ( IN-CITY ?auto_54945 ?auto_54950 ) ( not ( = ?auto_54945 ?auto_54953 ) ) ( OBJ-AT ?auto_54949 ?auto_54953 ) ( OBJ-AT ?auto_54948 ?auto_54953 ) ( IN-CITY ?auto_54951 ?auto_54950 ) ( not ( = ?auto_54945 ?auto_54951 ) ) ( not ( = ?auto_54953 ?auto_54951 ) ) ( OBJ-AT ?auto_54947 ?auto_54951 ) ( IN-TRUCK ?auto_54946 ?auto_54952 ) ( TRUCK-AT ?auto_54952 ?auto_54953 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54946 ?auto_54949 ?auto_54945 )
      ( DELIVER-4PKG-VERIFY ?auto_54946 ?auto_54947 ?auto_54948 ?auto_54949 ?auto_54945 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_54975 - OBJ
      ?auto_54976 - OBJ
      ?auto_54977 - OBJ
      ?auto_54978 - OBJ
      ?auto_54974 - LOCATION
    )
    :vars
    (
      ?auto_54982 - LOCATION
      ?auto_54979 - CITY
      ?auto_54980 - LOCATION
      ?auto_54981 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_54976 ?auto_54975 ) ) ( not ( = ?auto_54977 ?auto_54975 ) ) ( not ( = ?auto_54977 ?auto_54976 ) ) ( not ( = ?auto_54978 ?auto_54975 ) ) ( not ( = ?auto_54978 ?auto_54976 ) ) ( not ( = ?auto_54978 ?auto_54977 ) ) ( IN-CITY ?auto_54982 ?auto_54979 ) ( IN-CITY ?auto_54974 ?auto_54979 ) ( not ( = ?auto_54974 ?auto_54982 ) ) ( OBJ-AT ?auto_54977 ?auto_54982 ) ( OBJ-AT ?auto_54978 ?auto_54982 ) ( IN-CITY ?auto_54980 ?auto_54979 ) ( not ( = ?auto_54974 ?auto_54980 ) ) ( not ( = ?auto_54982 ?auto_54980 ) ) ( OBJ-AT ?auto_54976 ?auto_54980 ) ( IN-TRUCK ?auto_54975 ?auto_54981 ) ( TRUCK-AT ?auto_54981 ?auto_54982 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_54975 ?auto_54977 ?auto_54974 )
      ( DELIVER-4PKG-VERIFY ?auto_54975 ?auto_54976 ?auto_54977 ?auto_54978 ?auto_54974 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55004 - OBJ
      ?auto_55005 - OBJ
      ?auto_55006 - OBJ
      ?auto_55007 - OBJ
      ?auto_55003 - LOCATION
    )
    :vars
    (
      ?auto_55011 - LOCATION
      ?auto_55008 - CITY
      ?auto_55009 - LOCATION
      ?auto_55010 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_55005 ?auto_55004 ) ) ( not ( = ?auto_55006 ?auto_55004 ) ) ( not ( = ?auto_55006 ?auto_55005 ) ) ( not ( = ?auto_55007 ?auto_55004 ) ) ( not ( = ?auto_55007 ?auto_55005 ) ) ( not ( = ?auto_55007 ?auto_55006 ) ) ( IN-CITY ?auto_55011 ?auto_55008 ) ( IN-CITY ?auto_55003 ?auto_55008 ) ( not ( = ?auto_55003 ?auto_55011 ) ) ( OBJ-AT ?auto_55007 ?auto_55011 ) ( OBJ-AT ?auto_55005 ?auto_55011 ) ( IN-CITY ?auto_55009 ?auto_55008 ) ( not ( = ?auto_55003 ?auto_55009 ) ) ( not ( = ?auto_55011 ?auto_55009 ) ) ( OBJ-AT ?auto_55006 ?auto_55009 ) ( IN-TRUCK ?auto_55004 ?auto_55010 ) ( TRUCK-AT ?auto_55010 ?auto_55011 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55004 ?auto_55007 ?auto_55003 )
      ( DELIVER-4PKG-VERIFY ?auto_55004 ?auto_55005 ?auto_55006 ?auto_55007 ?auto_55003 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55033 - OBJ
      ?auto_55034 - OBJ
      ?auto_55035 - OBJ
      ?auto_55036 - OBJ
      ?auto_55032 - LOCATION
    )
    :vars
    (
      ?auto_55040 - LOCATION
      ?auto_55037 - CITY
      ?auto_55038 - LOCATION
      ?auto_55039 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_55034 ?auto_55033 ) ) ( not ( = ?auto_55035 ?auto_55033 ) ) ( not ( = ?auto_55035 ?auto_55034 ) ) ( not ( = ?auto_55036 ?auto_55033 ) ) ( not ( = ?auto_55036 ?auto_55034 ) ) ( not ( = ?auto_55036 ?auto_55035 ) ) ( IN-CITY ?auto_55040 ?auto_55037 ) ( IN-CITY ?auto_55032 ?auto_55037 ) ( not ( = ?auto_55032 ?auto_55040 ) ) ( OBJ-AT ?auto_55035 ?auto_55040 ) ( OBJ-AT ?auto_55034 ?auto_55040 ) ( IN-CITY ?auto_55038 ?auto_55037 ) ( not ( = ?auto_55032 ?auto_55038 ) ) ( not ( = ?auto_55040 ?auto_55038 ) ) ( OBJ-AT ?auto_55036 ?auto_55038 ) ( IN-TRUCK ?auto_55033 ?auto_55039 ) ( TRUCK-AT ?auto_55039 ?auto_55040 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55033 ?auto_55035 ?auto_55032 )
      ( DELIVER-4PKG-VERIFY ?auto_55033 ?auto_55034 ?auto_55035 ?auto_55036 ?auto_55032 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55124 - OBJ
      ?auto_55125 - OBJ
      ?auto_55126 - OBJ
      ?auto_55127 - OBJ
      ?auto_55123 - LOCATION
    )
    :vars
    (
      ?auto_55131 - LOCATION
      ?auto_55128 - CITY
      ?auto_55129 - LOCATION
      ?auto_55130 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_55125 ?auto_55124 ) ) ( not ( = ?auto_55126 ?auto_55124 ) ) ( not ( = ?auto_55126 ?auto_55125 ) ) ( not ( = ?auto_55127 ?auto_55124 ) ) ( not ( = ?auto_55127 ?auto_55125 ) ) ( not ( = ?auto_55127 ?auto_55126 ) ) ( IN-CITY ?auto_55131 ?auto_55128 ) ( IN-CITY ?auto_55123 ?auto_55128 ) ( not ( = ?auto_55123 ?auto_55131 ) ) ( OBJ-AT ?auto_55125 ?auto_55131 ) ( OBJ-AT ?auto_55127 ?auto_55131 ) ( IN-CITY ?auto_55129 ?auto_55128 ) ( not ( = ?auto_55123 ?auto_55129 ) ) ( not ( = ?auto_55131 ?auto_55129 ) ) ( OBJ-AT ?auto_55126 ?auto_55129 ) ( IN-TRUCK ?auto_55124 ?auto_55130 ) ( TRUCK-AT ?auto_55130 ?auto_55131 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55124 ?auto_55125 ?auto_55123 )
      ( DELIVER-4PKG-VERIFY ?auto_55124 ?auto_55125 ?auto_55126 ?auto_55127 ?auto_55123 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55153 - OBJ
      ?auto_55154 - OBJ
      ?auto_55155 - OBJ
      ?auto_55156 - OBJ
      ?auto_55152 - LOCATION
    )
    :vars
    (
      ?auto_55160 - LOCATION
      ?auto_55157 - CITY
      ?auto_55158 - LOCATION
      ?auto_55159 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_55154 ?auto_55153 ) ) ( not ( = ?auto_55155 ?auto_55153 ) ) ( not ( = ?auto_55155 ?auto_55154 ) ) ( not ( = ?auto_55156 ?auto_55153 ) ) ( not ( = ?auto_55156 ?auto_55154 ) ) ( not ( = ?auto_55156 ?auto_55155 ) ) ( IN-CITY ?auto_55160 ?auto_55157 ) ( IN-CITY ?auto_55152 ?auto_55157 ) ( not ( = ?auto_55152 ?auto_55160 ) ) ( OBJ-AT ?auto_55154 ?auto_55160 ) ( OBJ-AT ?auto_55155 ?auto_55160 ) ( IN-CITY ?auto_55158 ?auto_55157 ) ( not ( = ?auto_55152 ?auto_55158 ) ) ( not ( = ?auto_55160 ?auto_55158 ) ) ( OBJ-AT ?auto_55156 ?auto_55158 ) ( IN-TRUCK ?auto_55153 ?auto_55159 ) ( TRUCK-AT ?auto_55159 ?auto_55160 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55153 ?auto_55154 ?auto_55152 )
      ( DELIVER-4PKG-VERIFY ?auto_55153 ?auto_55154 ?auto_55155 ?auto_55156 ?auto_55152 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55244 - OBJ
      ?auto_55245 - OBJ
      ?auto_55246 - OBJ
      ?auto_55247 - OBJ
      ?auto_55243 - LOCATION
    )
    :vars
    (
      ?auto_55251 - LOCATION
      ?auto_55248 - CITY
      ?auto_55249 - LOCATION
      ?auto_55250 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_55245 ?auto_55244 ) ) ( not ( = ?auto_55246 ?auto_55244 ) ) ( not ( = ?auto_55246 ?auto_55245 ) ) ( not ( = ?auto_55247 ?auto_55244 ) ) ( not ( = ?auto_55247 ?auto_55245 ) ) ( not ( = ?auto_55247 ?auto_55246 ) ) ( IN-CITY ?auto_55251 ?auto_55248 ) ( IN-CITY ?auto_55243 ?auto_55248 ) ( not ( = ?auto_55243 ?auto_55251 ) ) ( OBJ-AT ?auto_55247 ?auto_55251 ) ( OBJ-AT ?auto_55246 ?auto_55251 ) ( IN-CITY ?auto_55249 ?auto_55248 ) ( not ( = ?auto_55243 ?auto_55249 ) ) ( not ( = ?auto_55251 ?auto_55249 ) ) ( OBJ-AT ?auto_55244 ?auto_55249 ) ( IN-TRUCK ?auto_55245 ?auto_55250 ) ( TRUCK-AT ?auto_55250 ?auto_55251 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55245 ?auto_55247 ?auto_55243 )
      ( DELIVER-4PKG-VERIFY ?auto_55244 ?auto_55245 ?auto_55246 ?auto_55247 ?auto_55243 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55273 - OBJ
      ?auto_55274 - OBJ
      ?auto_55275 - OBJ
      ?auto_55276 - OBJ
      ?auto_55272 - LOCATION
    )
    :vars
    (
      ?auto_55280 - LOCATION
      ?auto_55277 - CITY
      ?auto_55278 - LOCATION
      ?auto_55279 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_55274 ?auto_55273 ) ) ( not ( = ?auto_55275 ?auto_55273 ) ) ( not ( = ?auto_55275 ?auto_55274 ) ) ( not ( = ?auto_55276 ?auto_55273 ) ) ( not ( = ?auto_55276 ?auto_55274 ) ) ( not ( = ?auto_55276 ?auto_55275 ) ) ( IN-CITY ?auto_55280 ?auto_55277 ) ( IN-CITY ?auto_55272 ?auto_55277 ) ( not ( = ?auto_55272 ?auto_55280 ) ) ( OBJ-AT ?auto_55275 ?auto_55280 ) ( OBJ-AT ?auto_55276 ?auto_55280 ) ( IN-CITY ?auto_55278 ?auto_55277 ) ( not ( = ?auto_55272 ?auto_55278 ) ) ( not ( = ?auto_55280 ?auto_55278 ) ) ( OBJ-AT ?auto_55273 ?auto_55278 ) ( IN-TRUCK ?auto_55274 ?auto_55279 ) ( TRUCK-AT ?auto_55279 ?auto_55280 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55274 ?auto_55275 ?auto_55272 )
      ( DELIVER-4PKG-VERIFY ?auto_55273 ?auto_55274 ?auto_55275 ?auto_55276 ?auto_55272 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55365 - OBJ
      ?auto_55366 - OBJ
      ?auto_55367 - OBJ
      ?auto_55368 - OBJ
      ?auto_55364 - LOCATION
    )
    :vars
    (
      ?auto_55372 - LOCATION
      ?auto_55369 - CITY
      ?auto_55370 - LOCATION
      ?auto_55371 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_55366 ?auto_55365 ) ) ( not ( = ?auto_55367 ?auto_55365 ) ) ( not ( = ?auto_55367 ?auto_55366 ) ) ( not ( = ?auto_55368 ?auto_55365 ) ) ( not ( = ?auto_55368 ?auto_55366 ) ) ( not ( = ?auto_55368 ?auto_55367 ) ) ( IN-CITY ?auto_55372 ?auto_55369 ) ( IN-CITY ?auto_55364 ?auto_55369 ) ( not ( = ?auto_55364 ?auto_55372 ) ) ( OBJ-AT ?auto_55368 ?auto_55372 ) ( OBJ-AT ?auto_55366 ?auto_55372 ) ( IN-CITY ?auto_55370 ?auto_55369 ) ( not ( = ?auto_55364 ?auto_55370 ) ) ( not ( = ?auto_55372 ?auto_55370 ) ) ( OBJ-AT ?auto_55365 ?auto_55370 ) ( IN-TRUCK ?auto_55367 ?auto_55371 ) ( TRUCK-AT ?auto_55371 ?auto_55372 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55367 ?auto_55368 ?auto_55364 )
      ( DELIVER-4PKG-VERIFY ?auto_55365 ?auto_55366 ?auto_55367 ?auto_55368 ?auto_55364 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55394 - OBJ
      ?auto_55395 - OBJ
      ?auto_55396 - OBJ
      ?auto_55397 - OBJ
      ?auto_55393 - LOCATION
    )
    :vars
    (
      ?auto_55401 - LOCATION
      ?auto_55398 - CITY
      ?auto_55399 - LOCATION
      ?auto_55400 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_55395 ?auto_55394 ) ) ( not ( = ?auto_55396 ?auto_55394 ) ) ( not ( = ?auto_55396 ?auto_55395 ) ) ( not ( = ?auto_55397 ?auto_55394 ) ) ( not ( = ?auto_55397 ?auto_55395 ) ) ( not ( = ?auto_55397 ?auto_55396 ) ) ( IN-CITY ?auto_55401 ?auto_55398 ) ( IN-CITY ?auto_55393 ?auto_55398 ) ( not ( = ?auto_55393 ?auto_55401 ) ) ( OBJ-AT ?auto_55396 ?auto_55401 ) ( OBJ-AT ?auto_55395 ?auto_55401 ) ( IN-CITY ?auto_55399 ?auto_55398 ) ( not ( = ?auto_55393 ?auto_55399 ) ) ( not ( = ?auto_55401 ?auto_55399 ) ) ( OBJ-AT ?auto_55394 ?auto_55399 ) ( IN-TRUCK ?auto_55397 ?auto_55400 ) ( TRUCK-AT ?auto_55400 ?auto_55401 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55397 ?auto_55396 ?auto_55393 )
      ( DELIVER-4PKG-VERIFY ?auto_55394 ?auto_55395 ?auto_55396 ?auto_55397 ?auto_55393 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55453 - OBJ
      ?auto_55454 - OBJ
      ?auto_55455 - OBJ
      ?auto_55456 - OBJ
      ?auto_55452 - LOCATION
    )
    :vars
    (
      ?auto_55460 - LOCATION
      ?auto_55457 - CITY
      ?auto_55458 - LOCATION
      ?auto_55459 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_55454 ?auto_55453 ) ) ( not ( = ?auto_55455 ?auto_55453 ) ) ( not ( = ?auto_55455 ?auto_55454 ) ) ( not ( = ?auto_55456 ?auto_55453 ) ) ( not ( = ?auto_55456 ?auto_55454 ) ) ( not ( = ?auto_55456 ?auto_55455 ) ) ( IN-CITY ?auto_55460 ?auto_55457 ) ( IN-CITY ?auto_55452 ?auto_55457 ) ( not ( = ?auto_55452 ?auto_55460 ) ) ( OBJ-AT ?auto_55454 ?auto_55460 ) ( OBJ-AT ?auto_55456 ?auto_55460 ) ( IN-CITY ?auto_55458 ?auto_55457 ) ( not ( = ?auto_55452 ?auto_55458 ) ) ( not ( = ?auto_55460 ?auto_55458 ) ) ( OBJ-AT ?auto_55453 ?auto_55458 ) ( IN-TRUCK ?auto_55455 ?auto_55459 ) ( TRUCK-AT ?auto_55459 ?auto_55460 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55455 ?auto_55454 ?auto_55452 )
      ( DELIVER-4PKG-VERIFY ?auto_55453 ?auto_55454 ?auto_55455 ?auto_55456 ?auto_55452 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55514 - OBJ
      ?auto_55515 - OBJ
      ?auto_55516 - OBJ
      ?auto_55517 - OBJ
      ?auto_55513 - LOCATION
    )
    :vars
    (
      ?auto_55521 - LOCATION
      ?auto_55518 - CITY
      ?auto_55519 - LOCATION
      ?auto_55520 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_55515 ?auto_55514 ) ) ( not ( = ?auto_55516 ?auto_55514 ) ) ( not ( = ?auto_55516 ?auto_55515 ) ) ( not ( = ?auto_55517 ?auto_55514 ) ) ( not ( = ?auto_55517 ?auto_55515 ) ) ( not ( = ?auto_55517 ?auto_55516 ) ) ( IN-CITY ?auto_55521 ?auto_55518 ) ( IN-CITY ?auto_55513 ?auto_55518 ) ( not ( = ?auto_55513 ?auto_55521 ) ) ( OBJ-AT ?auto_55515 ?auto_55521 ) ( OBJ-AT ?auto_55516 ?auto_55521 ) ( IN-CITY ?auto_55519 ?auto_55518 ) ( not ( = ?auto_55513 ?auto_55519 ) ) ( not ( = ?auto_55521 ?auto_55519 ) ) ( OBJ-AT ?auto_55514 ?auto_55519 ) ( IN-TRUCK ?auto_55517 ?auto_55520 ) ( TRUCK-AT ?auto_55520 ?auto_55521 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55517 ?auto_55515 ?auto_55513 )
      ( DELIVER-4PKG-VERIFY ?auto_55514 ?auto_55515 ?auto_55516 ?auto_55517 ?auto_55513 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55605 - OBJ
      ?auto_55606 - OBJ
      ?auto_55607 - OBJ
      ?auto_55608 - OBJ
      ?auto_55604 - LOCATION
    )
    :vars
    (
      ?auto_55612 - LOCATION
      ?auto_55609 - CITY
      ?auto_55610 - LOCATION
      ?auto_55611 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_55606 ?auto_55605 ) ) ( not ( = ?auto_55607 ?auto_55605 ) ) ( not ( = ?auto_55607 ?auto_55606 ) ) ( not ( = ?auto_55608 ?auto_55605 ) ) ( not ( = ?auto_55608 ?auto_55606 ) ) ( not ( = ?auto_55608 ?auto_55607 ) ) ( IN-CITY ?auto_55612 ?auto_55609 ) ( IN-CITY ?auto_55604 ?auto_55609 ) ( not ( = ?auto_55604 ?auto_55612 ) ) ( OBJ-AT ?auto_55608 ?auto_55612 ) ( OBJ-AT ?auto_55605 ?auto_55612 ) ( IN-CITY ?auto_55610 ?auto_55609 ) ( not ( = ?auto_55604 ?auto_55610 ) ) ( not ( = ?auto_55612 ?auto_55610 ) ) ( OBJ-AT ?auto_55607 ?auto_55610 ) ( IN-TRUCK ?auto_55606 ?auto_55611 ) ( TRUCK-AT ?auto_55611 ?auto_55612 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55606 ?auto_55608 ?auto_55604 )
      ( DELIVER-4PKG-VERIFY ?auto_55605 ?auto_55606 ?auto_55607 ?auto_55608 ?auto_55604 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55634 - OBJ
      ?auto_55635 - OBJ
      ?auto_55636 - OBJ
      ?auto_55637 - OBJ
      ?auto_55633 - LOCATION
    )
    :vars
    (
      ?auto_55641 - LOCATION
      ?auto_55638 - CITY
      ?auto_55639 - LOCATION
      ?auto_55640 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_55635 ?auto_55634 ) ) ( not ( = ?auto_55636 ?auto_55634 ) ) ( not ( = ?auto_55636 ?auto_55635 ) ) ( not ( = ?auto_55637 ?auto_55634 ) ) ( not ( = ?auto_55637 ?auto_55635 ) ) ( not ( = ?auto_55637 ?auto_55636 ) ) ( IN-CITY ?auto_55641 ?auto_55638 ) ( IN-CITY ?auto_55633 ?auto_55638 ) ( not ( = ?auto_55633 ?auto_55641 ) ) ( OBJ-AT ?auto_55636 ?auto_55641 ) ( OBJ-AT ?auto_55634 ?auto_55641 ) ( IN-CITY ?auto_55639 ?auto_55638 ) ( not ( = ?auto_55633 ?auto_55639 ) ) ( not ( = ?auto_55641 ?auto_55639 ) ) ( OBJ-AT ?auto_55637 ?auto_55639 ) ( IN-TRUCK ?auto_55635 ?auto_55640 ) ( TRUCK-AT ?auto_55640 ?auto_55641 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55635 ?auto_55636 ?auto_55633 )
      ( DELIVER-4PKG-VERIFY ?auto_55634 ?auto_55635 ?auto_55636 ?auto_55637 ?auto_55633 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55663 - OBJ
      ?auto_55664 - OBJ
      ?auto_55665 - OBJ
      ?auto_55666 - OBJ
      ?auto_55662 - LOCATION
    )
    :vars
    (
      ?auto_55670 - LOCATION
      ?auto_55667 - CITY
      ?auto_55668 - LOCATION
      ?auto_55669 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_55664 ?auto_55663 ) ) ( not ( = ?auto_55665 ?auto_55663 ) ) ( not ( = ?auto_55665 ?auto_55664 ) ) ( not ( = ?auto_55666 ?auto_55663 ) ) ( not ( = ?auto_55666 ?auto_55664 ) ) ( not ( = ?auto_55666 ?auto_55665 ) ) ( IN-CITY ?auto_55670 ?auto_55667 ) ( IN-CITY ?auto_55662 ?auto_55667 ) ( not ( = ?auto_55662 ?auto_55670 ) ) ( OBJ-AT ?auto_55666 ?auto_55670 ) ( OBJ-AT ?auto_55663 ?auto_55670 ) ( IN-CITY ?auto_55668 ?auto_55667 ) ( not ( = ?auto_55662 ?auto_55668 ) ) ( not ( = ?auto_55670 ?auto_55668 ) ) ( OBJ-AT ?auto_55664 ?auto_55668 ) ( IN-TRUCK ?auto_55665 ?auto_55669 ) ( TRUCK-AT ?auto_55669 ?auto_55670 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55665 ?auto_55666 ?auto_55662 )
      ( DELIVER-4PKG-VERIFY ?auto_55663 ?auto_55664 ?auto_55665 ?auto_55666 ?auto_55662 ) )
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
      ?auto_55699 - LOCATION
      ?auto_55696 - CITY
      ?auto_55697 - LOCATION
      ?auto_55698 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_55693 ?auto_55692 ) ) ( not ( = ?auto_55694 ?auto_55692 ) ) ( not ( = ?auto_55694 ?auto_55693 ) ) ( not ( = ?auto_55695 ?auto_55692 ) ) ( not ( = ?auto_55695 ?auto_55693 ) ) ( not ( = ?auto_55695 ?auto_55694 ) ) ( IN-CITY ?auto_55699 ?auto_55696 ) ( IN-CITY ?auto_55691 ?auto_55696 ) ( not ( = ?auto_55691 ?auto_55699 ) ) ( OBJ-AT ?auto_55694 ?auto_55699 ) ( OBJ-AT ?auto_55692 ?auto_55699 ) ( IN-CITY ?auto_55697 ?auto_55696 ) ( not ( = ?auto_55691 ?auto_55697 ) ) ( not ( = ?auto_55699 ?auto_55697 ) ) ( OBJ-AT ?auto_55693 ?auto_55697 ) ( IN-TRUCK ?auto_55695 ?auto_55698 ) ( TRUCK-AT ?auto_55698 ?auto_55699 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55695 ?auto_55694 ?auto_55691 )
      ( DELIVER-4PKG-VERIFY ?auto_55692 ?auto_55693 ?auto_55694 ?auto_55695 ?auto_55691 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55814 - OBJ
      ?auto_55815 - OBJ
      ?auto_55816 - OBJ
      ?auto_55817 - OBJ
      ?auto_55813 - LOCATION
    )
    :vars
    (
      ?auto_55821 - LOCATION
      ?auto_55818 - CITY
      ?auto_55819 - LOCATION
      ?auto_55820 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_55815 ?auto_55814 ) ) ( not ( = ?auto_55816 ?auto_55814 ) ) ( not ( = ?auto_55816 ?auto_55815 ) ) ( not ( = ?auto_55817 ?auto_55814 ) ) ( not ( = ?auto_55817 ?auto_55815 ) ) ( not ( = ?auto_55817 ?auto_55816 ) ) ( IN-CITY ?auto_55821 ?auto_55818 ) ( IN-CITY ?auto_55813 ?auto_55818 ) ( not ( = ?auto_55813 ?auto_55821 ) ) ( OBJ-AT ?auto_55815 ?auto_55821 ) ( OBJ-AT ?auto_55814 ?auto_55821 ) ( IN-CITY ?auto_55819 ?auto_55818 ) ( not ( = ?auto_55813 ?auto_55819 ) ) ( not ( = ?auto_55821 ?auto_55819 ) ) ( OBJ-AT ?auto_55817 ?auto_55819 ) ( IN-TRUCK ?auto_55816 ?auto_55820 ) ( TRUCK-AT ?auto_55820 ?auto_55821 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55816 ?auto_55815 ?auto_55813 )
      ( DELIVER-4PKG-VERIFY ?auto_55814 ?auto_55815 ?auto_55816 ?auto_55817 ?auto_55813 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55843 - OBJ
      ?auto_55844 - OBJ
      ?auto_55845 - OBJ
      ?auto_55846 - OBJ
      ?auto_55842 - LOCATION
    )
    :vars
    (
      ?auto_55850 - LOCATION
      ?auto_55847 - CITY
      ?auto_55848 - LOCATION
      ?auto_55849 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_55844 ?auto_55843 ) ) ( not ( = ?auto_55845 ?auto_55843 ) ) ( not ( = ?auto_55845 ?auto_55844 ) ) ( not ( = ?auto_55846 ?auto_55843 ) ) ( not ( = ?auto_55846 ?auto_55844 ) ) ( not ( = ?auto_55846 ?auto_55845 ) ) ( IN-CITY ?auto_55850 ?auto_55847 ) ( IN-CITY ?auto_55842 ?auto_55847 ) ( not ( = ?auto_55842 ?auto_55850 ) ) ( OBJ-AT ?auto_55844 ?auto_55850 ) ( OBJ-AT ?auto_55843 ?auto_55850 ) ( IN-CITY ?auto_55848 ?auto_55847 ) ( not ( = ?auto_55842 ?auto_55848 ) ) ( not ( = ?auto_55850 ?auto_55848 ) ) ( OBJ-AT ?auto_55845 ?auto_55848 ) ( IN-TRUCK ?auto_55846 ?auto_55849 ) ( TRUCK-AT ?auto_55849 ?auto_55850 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55846 ?auto_55844 ?auto_55842 )
      ( DELIVER-4PKG-VERIFY ?auto_55843 ?auto_55844 ?auto_55845 ?auto_55846 ?auto_55842 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_56028 - OBJ
      ?auto_56029 - OBJ
      ?auto_56030 - OBJ
      ?auto_56031 - OBJ
      ?auto_56027 - LOCATION
    )
    :vars
    (
      ?auto_56035 - LOCATION
      ?auto_56032 - CITY
      ?auto_56033 - LOCATION
      ?auto_56034 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56029 ?auto_56028 ) ) ( not ( = ?auto_56030 ?auto_56028 ) ) ( not ( = ?auto_56030 ?auto_56029 ) ) ( not ( = ?auto_56031 ?auto_56028 ) ) ( not ( = ?auto_56031 ?auto_56029 ) ) ( not ( = ?auto_56031 ?auto_56030 ) ) ( IN-CITY ?auto_56035 ?auto_56032 ) ( IN-CITY ?auto_56027 ?auto_56032 ) ( not ( = ?auto_56027 ?auto_56035 ) ) ( OBJ-AT ?auto_56028 ?auto_56035 ) ( OBJ-AT ?auto_56031 ?auto_56035 ) ( IN-CITY ?auto_56033 ?auto_56032 ) ( not ( = ?auto_56027 ?auto_56033 ) ) ( not ( = ?auto_56035 ?auto_56033 ) ) ( OBJ-AT ?auto_56030 ?auto_56033 ) ( IN-TRUCK ?auto_56029 ?auto_56034 ) ( TRUCK-AT ?auto_56034 ?auto_56035 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56029 ?auto_56028 ?auto_56027 )
      ( DELIVER-4PKG-VERIFY ?auto_56028 ?auto_56029 ?auto_56030 ?auto_56031 ?auto_56027 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_56057 - OBJ
      ?auto_56058 - OBJ
      ?auto_56059 - OBJ
      ?auto_56060 - OBJ
      ?auto_56056 - LOCATION
    )
    :vars
    (
      ?auto_56064 - LOCATION
      ?auto_56061 - CITY
      ?auto_56062 - LOCATION
      ?auto_56063 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56058 ?auto_56057 ) ) ( not ( = ?auto_56059 ?auto_56057 ) ) ( not ( = ?auto_56059 ?auto_56058 ) ) ( not ( = ?auto_56060 ?auto_56057 ) ) ( not ( = ?auto_56060 ?auto_56058 ) ) ( not ( = ?auto_56060 ?auto_56059 ) ) ( IN-CITY ?auto_56064 ?auto_56061 ) ( IN-CITY ?auto_56056 ?auto_56061 ) ( not ( = ?auto_56056 ?auto_56064 ) ) ( OBJ-AT ?auto_56057 ?auto_56064 ) ( OBJ-AT ?auto_56059 ?auto_56064 ) ( IN-CITY ?auto_56062 ?auto_56061 ) ( not ( = ?auto_56056 ?auto_56062 ) ) ( not ( = ?auto_56064 ?auto_56062 ) ) ( OBJ-AT ?auto_56060 ?auto_56062 ) ( IN-TRUCK ?auto_56058 ?auto_56063 ) ( TRUCK-AT ?auto_56063 ?auto_56064 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56058 ?auto_56057 ?auto_56056 )
      ( DELIVER-4PKG-VERIFY ?auto_56057 ?auto_56058 ?auto_56059 ?auto_56060 ?auto_56056 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_56148 - OBJ
      ?auto_56149 - OBJ
      ?auto_56150 - OBJ
      ?auto_56151 - OBJ
      ?auto_56147 - LOCATION
    )
    :vars
    (
      ?auto_56155 - LOCATION
      ?auto_56152 - CITY
      ?auto_56153 - LOCATION
      ?auto_56154 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56149 ?auto_56148 ) ) ( not ( = ?auto_56150 ?auto_56148 ) ) ( not ( = ?auto_56150 ?auto_56149 ) ) ( not ( = ?auto_56151 ?auto_56148 ) ) ( not ( = ?auto_56151 ?auto_56149 ) ) ( not ( = ?auto_56151 ?auto_56150 ) ) ( IN-CITY ?auto_56155 ?auto_56152 ) ( IN-CITY ?auto_56147 ?auto_56152 ) ( not ( = ?auto_56147 ?auto_56155 ) ) ( OBJ-AT ?auto_56148 ?auto_56155 ) ( OBJ-AT ?auto_56151 ?auto_56155 ) ( IN-CITY ?auto_56153 ?auto_56152 ) ( not ( = ?auto_56147 ?auto_56153 ) ) ( not ( = ?auto_56155 ?auto_56153 ) ) ( OBJ-AT ?auto_56149 ?auto_56153 ) ( IN-TRUCK ?auto_56150 ?auto_56154 ) ( TRUCK-AT ?auto_56154 ?auto_56155 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56150 ?auto_56148 ?auto_56147 )
      ( DELIVER-4PKG-VERIFY ?auto_56148 ?auto_56149 ?auto_56150 ?auto_56151 ?auto_56147 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_56209 - OBJ
      ?auto_56210 - OBJ
      ?auto_56211 - OBJ
      ?auto_56212 - OBJ
      ?auto_56208 - LOCATION
    )
    :vars
    (
      ?auto_56216 - LOCATION
      ?auto_56213 - CITY
      ?auto_56214 - LOCATION
      ?auto_56215 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56210 ?auto_56209 ) ) ( not ( = ?auto_56211 ?auto_56209 ) ) ( not ( = ?auto_56211 ?auto_56210 ) ) ( not ( = ?auto_56212 ?auto_56209 ) ) ( not ( = ?auto_56212 ?auto_56210 ) ) ( not ( = ?auto_56212 ?auto_56211 ) ) ( IN-CITY ?auto_56216 ?auto_56213 ) ( IN-CITY ?auto_56208 ?auto_56213 ) ( not ( = ?auto_56208 ?auto_56216 ) ) ( OBJ-AT ?auto_56209 ?auto_56216 ) ( OBJ-AT ?auto_56211 ?auto_56216 ) ( IN-CITY ?auto_56214 ?auto_56213 ) ( not ( = ?auto_56208 ?auto_56214 ) ) ( not ( = ?auto_56216 ?auto_56214 ) ) ( OBJ-AT ?auto_56210 ?auto_56214 ) ( IN-TRUCK ?auto_56212 ?auto_56215 ) ( TRUCK-AT ?auto_56215 ?auto_56216 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56212 ?auto_56209 ?auto_56208 )
      ( DELIVER-4PKG-VERIFY ?auto_56209 ?auto_56210 ?auto_56211 ?auto_56212 ?auto_56208 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_56300 - OBJ
      ?auto_56301 - OBJ
      ?auto_56302 - OBJ
      ?auto_56303 - OBJ
      ?auto_56299 - LOCATION
    )
    :vars
    (
      ?auto_56307 - LOCATION
      ?auto_56304 - CITY
      ?auto_56305 - LOCATION
      ?auto_56306 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56301 ?auto_56300 ) ) ( not ( = ?auto_56302 ?auto_56300 ) ) ( not ( = ?auto_56302 ?auto_56301 ) ) ( not ( = ?auto_56303 ?auto_56300 ) ) ( not ( = ?auto_56303 ?auto_56301 ) ) ( not ( = ?auto_56303 ?auto_56302 ) ) ( IN-CITY ?auto_56307 ?auto_56304 ) ( IN-CITY ?auto_56299 ?auto_56304 ) ( not ( = ?auto_56299 ?auto_56307 ) ) ( OBJ-AT ?auto_56300 ?auto_56307 ) ( OBJ-AT ?auto_56301 ?auto_56307 ) ( IN-CITY ?auto_56305 ?auto_56304 ) ( not ( = ?auto_56299 ?auto_56305 ) ) ( not ( = ?auto_56307 ?auto_56305 ) ) ( OBJ-AT ?auto_56303 ?auto_56305 ) ( IN-TRUCK ?auto_56302 ?auto_56306 ) ( TRUCK-AT ?auto_56306 ?auto_56307 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56302 ?auto_56300 ?auto_56299 )
      ( DELIVER-4PKG-VERIFY ?auto_56300 ?auto_56301 ?auto_56302 ?auto_56303 ?auto_56299 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_56329 - OBJ
      ?auto_56330 - OBJ
      ?auto_56331 - OBJ
      ?auto_56332 - OBJ
      ?auto_56328 - LOCATION
    )
    :vars
    (
      ?auto_56336 - LOCATION
      ?auto_56333 - CITY
      ?auto_56334 - LOCATION
      ?auto_56335 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56330 ?auto_56329 ) ) ( not ( = ?auto_56331 ?auto_56329 ) ) ( not ( = ?auto_56331 ?auto_56330 ) ) ( not ( = ?auto_56332 ?auto_56329 ) ) ( not ( = ?auto_56332 ?auto_56330 ) ) ( not ( = ?auto_56332 ?auto_56331 ) ) ( IN-CITY ?auto_56336 ?auto_56333 ) ( IN-CITY ?auto_56328 ?auto_56333 ) ( not ( = ?auto_56328 ?auto_56336 ) ) ( OBJ-AT ?auto_56329 ?auto_56336 ) ( OBJ-AT ?auto_56330 ?auto_56336 ) ( IN-CITY ?auto_56334 ?auto_56333 ) ( not ( = ?auto_56328 ?auto_56334 ) ) ( not ( = ?auto_56336 ?auto_56334 ) ) ( OBJ-AT ?auto_56331 ?auto_56334 ) ( IN-TRUCK ?auto_56332 ?auto_56335 ) ( TRUCK-AT ?auto_56335 ?auto_56336 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56332 ?auto_56329 ?auto_56328 )
      ( DELIVER-4PKG-VERIFY ?auto_56329 ?auto_56330 ?auto_56331 ?auto_56332 ?auto_56328 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56623 - OBJ
      ?auto_56622 - LOCATION
    )
    :vars
    (
      ?auto_56630 - OBJ
      ?auto_56628 - LOCATION
      ?auto_56624 - CITY
      ?auto_56627 - OBJ
      ?auto_56629 - OBJ
      ?auto_56625 - LOCATION
      ?auto_56626 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56623 ?auto_56630 ) ) ( IN-CITY ?auto_56628 ?auto_56624 ) ( IN-CITY ?auto_56622 ?auto_56624 ) ( not ( = ?auto_56622 ?auto_56628 ) ) ( OBJ-AT ?auto_56623 ?auto_56628 ) ( not ( = ?auto_56627 ?auto_56630 ) ) ( not ( = ?auto_56623 ?auto_56627 ) ) ( OBJ-AT ?auto_56627 ?auto_56628 ) ( not ( = ?auto_56629 ?auto_56630 ) ) ( not ( = ?auto_56623 ?auto_56629 ) ) ( not ( = ?auto_56627 ?auto_56629 ) ) ( IN-CITY ?auto_56625 ?auto_56624 ) ( not ( = ?auto_56622 ?auto_56625 ) ) ( not ( = ?auto_56628 ?auto_56625 ) ) ( OBJ-AT ?auto_56629 ?auto_56625 ) ( TRUCK-AT ?auto_56626 ?auto_56628 ) ( OBJ-AT ?auto_56630 ?auto_56628 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_56630 ?auto_56626 ?auto_56628 )
      ( DELIVER-2PKG ?auto_56630 ?auto_56623 ?auto_56622 )
      ( DELIVER-1PKG-VERIFY ?auto_56623 ?auto_56622 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56632 - OBJ
      ?auto_56633 - OBJ
      ?auto_56631 - LOCATION
    )
    :vars
    (
      ?auto_56635 - LOCATION
      ?auto_56636 - CITY
      ?auto_56634 - OBJ
      ?auto_56637 - OBJ
      ?auto_56639 - LOCATION
      ?auto_56638 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56633 ?auto_56632 ) ) ( IN-CITY ?auto_56635 ?auto_56636 ) ( IN-CITY ?auto_56631 ?auto_56636 ) ( not ( = ?auto_56631 ?auto_56635 ) ) ( OBJ-AT ?auto_56633 ?auto_56635 ) ( not ( = ?auto_56634 ?auto_56632 ) ) ( not ( = ?auto_56633 ?auto_56634 ) ) ( OBJ-AT ?auto_56634 ?auto_56635 ) ( not ( = ?auto_56637 ?auto_56632 ) ) ( not ( = ?auto_56633 ?auto_56637 ) ) ( not ( = ?auto_56634 ?auto_56637 ) ) ( IN-CITY ?auto_56639 ?auto_56636 ) ( not ( = ?auto_56631 ?auto_56639 ) ) ( not ( = ?auto_56635 ?auto_56639 ) ) ( OBJ-AT ?auto_56637 ?auto_56639 ) ( TRUCK-AT ?auto_56638 ?auto_56635 ) ( OBJ-AT ?auto_56632 ?auto_56635 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56633 ?auto_56631 )
      ( DELIVER-2PKG-VERIFY ?auto_56632 ?auto_56633 ?auto_56631 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56641 - OBJ
      ?auto_56642 - OBJ
      ?auto_56640 - LOCATION
    )
    :vars
    (
      ?auto_56648 - OBJ
      ?auto_56646 - LOCATION
      ?auto_56643 - CITY
      ?auto_56645 - OBJ
      ?auto_56647 - LOCATION
      ?auto_56644 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56642 ?auto_56641 ) ) ( not ( = ?auto_56642 ?auto_56648 ) ) ( IN-CITY ?auto_56646 ?auto_56643 ) ( IN-CITY ?auto_56640 ?auto_56643 ) ( not ( = ?auto_56640 ?auto_56646 ) ) ( OBJ-AT ?auto_56642 ?auto_56646 ) ( not ( = ?auto_56645 ?auto_56648 ) ) ( not ( = ?auto_56642 ?auto_56645 ) ) ( OBJ-AT ?auto_56645 ?auto_56646 ) ( not ( = ?auto_56641 ?auto_56648 ) ) ( not ( = ?auto_56645 ?auto_56641 ) ) ( IN-CITY ?auto_56647 ?auto_56643 ) ( not ( = ?auto_56640 ?auto_56647 ) ) ( not ( = ?auto_56646 ?auto_56647 ) ) ( OBJ-AT ?auto_56641 ?auto_56647 ) ( TRUCK-AT ?auto_56644 ?auto_56646 ) ( OBJ-AT ?auto_56648 ?auto_56646 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56648 ?auto_56642 ?auto_56640 )
      ( DELIVER-2PKG-VERIFY ?auto_56641 ?auto_56642 ?auto_56640 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56650 - OBJ
      ?auto_56651 - OBJ
      ?auto_56649 - LOCATION
    )
    :vars
    (
      ?auto_56657 - OBJ
      ?auto_56655 - LOCATION
      ?auto_56652 - CITY
      ?auto_56653 - OBJ
      ?auto_56656 - LOCATION
      ?auto_56654 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56651 ?auto_56650 ) ) ( not ( = ?auto_56651 ?auto_56657 ) ) ( IN-CITY ?auto_56655 ?auto_56652 ) ( IN-CITY ?auto_56649 ?auto_56652 ) ( not ( = ?auto_56649 ?auto_56655 ) ) ( OBJ-AT ?auto_56651 ?auto_56655 ) ( not ( = ?auto_56650 ?auto_56657 ) ) ( OBJ-AT ?auto_56650 ?auto_56655 ) ( not ( = ?auto_56653 ?auto_56657 ) ) ( not ( = ?auto_56651 ?auto_56653 ) ) ( not ( = ?auto_56650 ?auto_56653 ) ) ( IN-CITY ?auto_56656 ?auto_56652 ) ( not ( = ?auto_56649 ?auto_56656 ) ) ( not ( = ?auto_56655 ?auto_56656 ) ) ( OBJ-AT ?auto_56653 ?auto_56656 ) ( TRUCK-AT ?auto_56654 ?auto_56655 ) ( OBJ-AT ?auto_56657 ?auto_56655 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56657 ?auto_56651 ?auto_56649 )
      ( DELIVER-2PKG-VERIFY ?auto_56650 ?auto_56651 ?auto_56649 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56659 - OBJ
      ?auto_56660 - OBJ
      ?auto_56658 - LOCATION
    )
    :vars
    (
      ?auto_56665 - LOCATION
      ?auto_56661 - CITY
      ?auto_56664 - OBJ
      ?auto_56662 - OBJ
      ?auto_56666 - LOCATION
      ?auto_56663 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56660 ?auto_56659 ) ) ( IN-CITY ?auto_56665 ?auto_56661 ) ( IN-CITY ?auto_56658 ?auto_56661 ) ( not ( = ?auto_56658 ?auto_56665 ) ) ( OBJ-AT ?auto_56659 ?auto_56665 ) ( not ( = ?auto_56664 ?auto_56660 ) ) ( not ( = ?auto_56659 ?auto_56664 ) ) ( OBJ-AT ?auto_56664 ?auto_56665 ) ( not ( = ?auto_56662 ?auto_56660 ) ) ( not ( = ?auto_56659 ?auto_56662 ) ) ( not ( = ?auto_56664 ?auto_56662 ) ) ( IN-CITY ?auto_56666 ?auto_56661 ) ( not ( = ?auto_56658 ?auto_56666 ) ) ( not ( = ?auto_56665 ?auto_56666 ) ) ( OBJ-AT ?auto_56662 ?auto_56666 ) ( TRUCK-AT ?auto_56663 ?auto_56665 ) ( OBJ-AT ?auto_56660 ?auto_56665 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56660 ?auto_56659 ?auto_56658 )
      ( DELIVER-2PKG-VERIFY ?auto_56659 ?auto_56660 ?auto_56658 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56668 - OBJ
      ?auto_56669 - OBJ
      ?auto_56667 - LOCATION
    )
    :vars
    (
      ?auto_56675 - OBJ
      ?auto_56673 - LOCATION
      ?auto_56670 - CITY
      ?auto_56672 - OBJ
      ?auto_56674 - LOCATION
      ?auto_56671 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56669 ?auto_56668 ) ) ( not ( = ?auto_56668 ?auto_56675 ) ) ( IN-CITY ?auto_56673 ?auto_56670 ) ( IN-CITY ?auto_56667 ?auto_56670 ) ( not ( = ?auto_56667 ?auto_56673 ) ) ( OBJ-AT ?auto_56668 ?auto_56673 ) ( not ( = ?auto_56672 ?auto_56675 ) ) ( not ( = ?auto_56668 ?auto_56672 ) ) ( OBJ-AT ?auto_56672 ?auto_56673 ) ( not ( = ?auto_56669 ?auto_56675 ) ) ( not ( = ?auto_56672 ?auto_56669 ) ) ( IN-CITY ?auto_56674 ?auto_56670 ) ( not ( = ?auto_56667 ?auto_56674 ) ) ( not ( = ?auto_56673 ?auto_56674 ) ) ( OBJ-AT ?auto_56669 ?auto_56674 ) ( TRUCK-AT ?auto_56671 ?auto_56673 ) ( OBJ-AT ?auto_56675 ?auto_56673 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56675 ?auto_56668 ?auto_56667 )
      ( DELIVER-2PKG-VERIFY ?auto_56668 ?auto_56669 ?auto_56667 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56677 - OBJ
      ?auto_56678 - OBJ
      ?auto_56676 - LOCATION
    )
    :vars
    (
      ?auto_56684 - OBJ
      ?auto_56682 - LOCATION
      ?auto_56679 - CITY
      ?auto_56680 - OBJ
      ?auto_56683 - LOCATION
      ?auto_56681 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56678 ?auto_56677 ) ) ( not ( = ?auto_56677 ?auto_56684 ) ) ( IN-CITY ?auto_56682 ?auto_56679 ) ( IN-CITY ?auto_56676 ?auto_56679 ) ( not ( = ?auto_56676 ?auto_56682 ) ) ( OBJ-AT ?auto_56677 ?auto_56682 ) ( not ( = ?auto_56678 ?auto_56684 ) ) ( OBJ-AT ?auto_56678 ?auto_56682 ) ( not ( = ?auto_56680 ?auto_56684 ) ) ( not ( = ?auto_56677 ?auto_56680 ) ) ( not ( = ?auto_56678 ?auto_56680 ) ) ( IN-CITY ?auto_56683 ?auto_56679 ) ( not ( = ?auto_56676 ?auto_56683 ) ) ( not ( = ?auto_56682 ?auto_56683 ) ) ( OBJ-AT ?auto_56680 ?auto_56683 ) ( TRUCK-AT ?auto_56681 ?auto_56682 ) ( OBJ-AT ?auto_56684 ?auto_56682 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56684 ?auto_56677 ?auto_56676 )
      ( DELIVER-2PKG-VERIFY ?auto_56677 ?auto_56678 ?auto_56676 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56706 - OBJ
      ?auto_56707 - OBJ
      ?auto_56708 - OBJ
      ?auto_56705 - LOCATION
    )
    :vars
    (
      ?auto_56712 - LOCATION
      ?auto_56709 - CITY
      ?auto_56711 - OBJ
      ?auto_56713 - LOCATION
      ?auto_56710 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56707 ?auto_56706 ) ) ( not ( = ?auto_56708 ?auto_56706 ) ) ( not ( = ?auto_56708 ?auto_56707 ) ) ( IN-CITY ?auto_56712 ?auto_56709 ) ( IN-CITY ?auto_56705 ?auto_56709 ) ( not ( = ?auto_56705 ?auto_56712 ) ) ( OBJ-AT ?auto_56708 ?auto_56712 ) ( not ( = ?auto_56711 ?auto_56706 ) ) ( not ( = ?auto_56708 ?auto_56711 ) ) ( OBJ-AT ?auto_56711 ?auto_56712 ) ( not ( = ?auto_56711 ?auto_56707 ) ) ( IN-CITY ?auto_56713 ?auto_56709 ) ( not ( = ?auto_56705 ?auto_56713 ) ) ( not ( = ?auto_56712 ?auto_56713 ) ) ( OBJ-AT ?auto_56707 ?auto_56713 ) ( TRUCK-AT ?auto_56710 ?auto_56712 ) ( OBJ-AT ?auto_56706 ?auto_56712 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56706 ?auto_56708 ?auto_56705 )
      ( DELIVER-3PKG-VERIFY ?auto_56706 ?auto_56707 ?auto_56708 ?auto_56705 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56715 - OBJ
      ?auto_56716 - OBJ
      ?auto_56717 - OBJ
      ?auto_56714 - LOCATION
    )
    :vars
    (
      ?auto_56721 - LOCATION
      ?auto_56718 - CITY
      ?auto_56719 - OBJ
      ?auto_56722 - LOCATION
      ?auto_56720 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56716 ?auto_56715 ) ) ( not ( = ?auto_56717 ?auto_56715 ) ) ( not ( = ?auto_56717 ?auto_56716 ) ) ( IN-CITY ?auto_56721 ?auto_56718 ) ( IN-CITY ?auto_56714 ?auto_56718 ) ( not ( = ?auto_56714 ?auto_56721 ) ) ( OBJ-AT ?auto_56717 ?auto_56721 ) ( OBJ-AT ?auto_56716 ?auto_56721 ) ( not ( = ?auto_56719 ?auto_56715 ) ) ( not ( = ?auto_56717 ?auto_56719 ) ) ( not ( = ?auto_56716 ?auto_56719 ) ) ( IN-CITY ?auto_56722 ?auto_56718 ) ( not ( = ?auto_56714 ?auto_56722 ) ) ( not ( = ?auto_56721 ?auto_56722 ) ) ( OBJ-AT ?auto_56719 ?auto_56722 ) ( TRUCK-AT ?auto_56720 ?auto_56721 ) ( OBJ-AT ?auto_56715 ?auto_56721 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56715 ?auto_56717 ?auto_56714 )
      ( DELIVER-3PKG-VERIFY ?auto_56715 ?auto_56716 ?auto_56717 ?auto_56714 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56734 - OBJ
      ?auto_56735 - OBJ
      ?auto_56736 - OBJ
      ?auto_56733 - LOCATION
    )
    :vars
    (
      ?auto_56740 - LOCATION
      ?auto_56737 - CITY
      ?auto_56739 - OBJ
      ?auto_56741 - LOCATION
      ?auto_56738 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56735 ?auto_56734 ) ) ( not ( = ?auto_56736 ?auto_56734 ) ) ( not ( = ?auto_56736 ?auto_56735 ) ) ( IN-CITY ?auto_56740 ?auto_56737 ) ( IN-CITY ?auto_56733 ?auto_56737 ) ( not ( = ?auto_56733 ?auto_56740 ) ) ( OBJ-AT ?auto_56735 ?auto_56740 ) ( not ( = ?auto_56739 ?auto_56734 ) ) ( not ( = ?auto_56735 ?auto_56739 ) ) ( OBJ-AT ?auto_56739 ?auto_56740 ) ( not ( = ?auto_56739 ?auto_56736 ) ) ( IN-CITY ?auto_56741 ?auto_56737 ) ( not ( = ?auto_56733 ?auto_56741 ) ) ( not ( = ?auto_56740 ?auto_56741 ) ) ( OBJ-AT ?auto_56736 ?auto_56741 ) ( TRUCK-AT ?auto_56738 ?auto_56740 ) ( OBJ-AT ?auto_56734 ?auto_56740 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56734 ?auto_56735 ?auto_56733 )
      ( DELIVER-3PKG-VERIFY ?auto_56734 ?auto_56735 ?auto_56736 ?auto_56733 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56743 - OBJ
      ?auto_56744 - OBJ
      ?auto_56745 - OBJ
      ?auto_56742 - LOCATION
    )
    :vars
    (
      ?auto_56749 - LOCATION
      ?auto_56746 - CITY
      ?auto_56747 - OBJ
      ?auto_56750 - LOCATION
      ?auto_56748 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56744 ?auto_56743 ) ) ( not ( = ?auto_56745 ?auto_56743 ) ) ( not ( = ?auto_56745 ?auto_56744 ) ) ( IN-CITY ?auto_56749 ?auto_56746 ) ( IN-CITY ?auto_56742 ?auto_56746 ) ( not ( = ?auto_56742 ?auto_56749 ) ) ( OBJ-AT ?auto_56744 ?auto_56749 ) ( OBJ-AT ?auto_56745 ?auto_56749 ) ( not ( = ?auto_56747 ?auto_56743 ) ) ( not ( = ?auto_56744 ?auto_56747 ) ) ( not ( = ?auto_56745 ?auto_56747 ) ) ( IN-CITY ?auto_56750 ?auto_56746 ) ( not ( = ?auto_56742 ?auto_56750 ) ) ( not ( = ?auto_56749 ?auto_56750 ) ) ( OBJ-AT ?auto_56747 ?auto_56750 ) ( TRUCK-AT ?auto_56748 ?auto_56749 ) ( OBJ-AT ?auto_56743 ?auto_56749 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56743 ?auto_56744 ?auto_56742 )
      ( DELIVER-3PKG-VERIFY ?auto_56743 ?auto_56744 ?auto_56745 ?auto_56742 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56762 - OBJ
      ?auto_56763 - OBJ
      ?auto_56764 - OBJ
      ?auto_56761 - LOCATION
    )
    :vars
    (
      ?auto_56768 - LOCATION
      ?auto_56765 - CITY
      ?auto_56767 - OBJ
      ?auto_56769 - LOCATION
      ?auto_56766 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56763 ?auto_56762 ) ) ( not ( = ?auto_56764 ?auto_56762 ) ) ( not ( = ?auto_56764 ?auto_56763 ) ) ( IN-CITY ?auto_56768 ?auto_56765 ) ( IN-CITY ?auto_56761 ?auto_56765 ) ( not ( = ?auto_56761 ?auto_56768 ) ) ( OBJ-AT ?auto_56764 ?auto_56768 ) ( not ( = ?auto_56767 ?auto_56763 ) ) ( not ( = ?auto_56764 ?auto_56767 ) ) ( OBJ-AT ?auto_56767 ?auto_56768 ) ( not ( = ?auto_56767 ?auto_56762 ) ) ( IN-CITY ?auto_56769 ?auto_56765 ) ( not ( = ?auto_56761 ?auto_56769 ) ) ( not ( = ?auto_56768 ?auto_56769 ) ) ( OBJ-AT ?auto_56762 ?auto_56769 ) ( TRUCK-AT ?auto_56766 ?auto_56768 ) ( OBJ-AT ?auto_56763 ?auto_56768 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56763 ?auto_56764 ?auto_56761 )
      ( DELIVER-3PKG-VERIFY ?auto_56762 ?auto_56763 ?auto_56764 ?auto_56761 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56781 - OBJ
      ?auto_56782 - OBJ
      ?auto_56783 - OBJ
      ?auto_56780 - LOCATION
    )
    :vars
    (
      ?auto_56788 - OBJ
      ?auto_56786 - LOCATION
      ?auto_56784 - CITY
      ?auto_56787 - LOCATION
      ?auto_56785 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56782 ?auto_56781 ) ) ( not ( = ?auto_56783 ?auto_56781 ) ) ( not ( = ?auto_56783 ?auto_56782 ) ) ( not ( = ?auto_56783 ?auto_56788 ) ) ( IN-CITY ?auto_56786 ?auto_56784 ) ( IN-CITY ?auto_56780 ?auto_56784 ) ( not ( = ?auto_56780 ?auto_56786 ) ) ( OBJ-AT ?auto_56783 ?auto_56786 ) ( not ( = ?auto_56782 ?auto_56788 ) ) ( OBJ-AT ?auto_56782 ?auto_56786 ) ( not ( = ?auto_56781 ?auto_56788 ) ) ( IN-CITY ?auto_56787 ?auto_56784 ) ( not ( = ?auto_56780 ?auto_56787 ) ) ( not ( = ?auto_56786 ?auto_56787 ) ) ( OBJ-AT ?auto_56781 ?auto_56787 ) ( TRUCK-AT ?auto_56785 ?auto_56786 ) ( OBJ-AT ?auto_56788 ?auto_56786 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56788 ?auto_56783 ?auto_56780 )
      ( DELIVER-3PKG-VERIFY ?auto_56781 ?auto_56782 ?auto_56783 ?auto_56780 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56790 - OBJ
      ?auto_56791 - OBJ
      ?auto_56792 - OBJ
      ?auto_56789 - LOCATION
    )
    :vars
    (
      ?auto_56796 - LOCATION
      ?auto_56793 - CITY
      ?auto_56795 - OBJ
      ?auto_56797 - LOCATION
      ?auto_56794 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56791 ?auto_56790 ) ) ( not ( = ?auto_56792 ?auto_56790 ) ) ( not ( = ?auto_56792 ?auto_56791 ) ) ( IN-CITY ?auto_56796 ?auto_56793 ) ( IN-CITY ?auto_56789 ?auto_56793 ) ( not ( = ?auto_56789 ?auto_56796 ) ) ( OBJ-AT ?auto_56791 ?auto_56796 ) ( not ( = ?auto_56795 ?auto_56792 ) ) ( not ( = ?auto_56791 ?auto_56795 ) ) ( OBJ-AT ?auto_56795 ?auto_56796 ) ( not ( = ?auto_56795 ?auto_56790 ) ) ( IN-CITY ?auto_56797 ?auto_56793 ) ( not ( = ?auto_56789 ?auto_56797 ) ) ( not ( = ?auto_56796 ?auto_56797 ) ) ( OBJ-AT ?auto_56790 ?auto_56797 ) ( TRUCK-AT ?auto_56794 ?auto_56796 ) ( OBJ-AT ?auto_56792 ?auto_56796 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56792 ?auto_56791 ?auto_56789 )
      ( DELIVER-3PKG-VERIFY ?auto_56790 ?auto_56791 ?auto_56792 ?auto_56789 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56809 - OBJ
      ?auto_56810 - OBJ
      ?auto_56811 - OBJ
      ?auto_56808 - LOCATION
    )
    :vars
    (
      ?auto_56816 - OBJ
      ?auto_56814 - LOCATION
      ?auto_56812 - CITY
      ?auto_56815 - LOCATION
      ?auto_56813 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56810 ?auto_56809 ) ) ( not ( = ?auto_56811 ?auto_56809 ) ) ( not ( = ?auto_56811 ?auto_56810 ) ) ( not ( = ?auto_56810 ?auto_56816 ) ) ( IN-CITY ?auto_56814 ?auto_56812 ) ( IN-CITY ?auto_56808 ?auto_56812 ) ( not ( = ?auto_56808 ?auto_56814 ) ) ( OBJ-AT ?auto_56810 ?auto_56814 ) ( not ( = ?auto_56811 ?auto_56816 ) ) ( OBJ-AT ?auto_56811 ?auto_56814 ) ( not ( = ?auto_56809 ?auto_56816 ) ) ( IN-CITY ?auto_56815 ?auto_56812 ) ( not ( = ?auto_56808 ?auto_56815 ) ) ( not ( = ?auto_56814 ?auto_56815 ) ) ( OBJ-AT ?auto_56809 ?auto_56815 ) ( TRUCK-AT ?auto_56813 ?auto_56814 ) ( OBJ-AT ?auto_56816 ?auto_56814 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56816 ?auto_56810 ?auto_56808 )
      ( DELIVER-3PKG-VERIFY ?auto_56809 ?auto_56810 ?auto_56811 ?auto_56808 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56828 - OBJ
      ?auto_56829 - OBJ
      ?auto_56830 - OBJ
      ?auto_56827 - LOCATION
    )
    :vars
    (
      ?auto_56834 - LOCATION
      ?auto_56831 - CITY
      ?auto_56832 - OBJ
      ?auto_56835 - LOCATION
      ?auto_56833 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56829 ?auto_56828 ) ) ( not ( = ?auto_56830 ?auto_56828 ) ) ( not ( = ?auto_56830 ?auto_56829 ) ) ( IN-CITY ?auto_56834 ?auto_56831 ) ( IN-CITY ?auto_56827 ?auto_56831 ) ( not ( = ?auto_56827 ?auto_56834 ) ) ( OBJ-AT ?auto_56830 ?auto_56834 ) ( OBJ-AT ?auto_56828 ?auto_56834 ) ( not ( = ?auto_56832 ?auto_56829 ) ) ( not ( = ?auto_56830 ?auto_56832 ) ) ( not ( = ?auto_56828 ?auto_56832 ) ) ( IN-CITY ?auto_56835 ?auto_56831 ) ( not ( = ?auto_56827 ?auto_56835 ) ) ( not ( = ?auto_56834 ?auto_56835 ) ) ( OBJ-AT ?auto_56832 ?auto_56835 ) ( TRUCK-AT ?auto_56833 ?auto_56834 ) ( OBJ-AT ?auto_56829 ?auto_56834 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56829 ?auto_56830 ?auto_56827 )
      ( DELIVER-3PKG-VERIFY ?auto_56828 ?auto_56829 ?auto_56830 ?auto_56827 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56837 - OBJ
      ?auto_56838 - OBJ
      ?auto_56839 - OBJ
      ?auto_56836 - LOCATION
    )
    :vars
    (
      ?auto_56844 - OBJ
      ?auto_56842 - LOCATION
      ?auto_56840 - CITY
      ?auto_56843 - LOCATION
      ?auto_56841 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56838 ?auto_56837 ) ) ( not ( = ?auto_56839 ?auto_56837 ) ) ( not ( = ?auto_56839 ?auto_56838 ) ) ( not ( = ?auto_56839 ?auto_56844 ) ) ( IN-CITY ?auto_56842 ?auto_56840 ) ( IN-CITY ?auto_56836 ?auto_56840 ) ( not ( = ?auto_56836 ?auto_56842 ) ) ( OBJ-AT ?auto_56839 ?auto_56842 ) ( not ( = ?auto_56837 ?auto_56844 ) ) ( OBJ-AT ?auto_56837 ?auto_56842 ) ( not ( = ?auto_56838 ?auto_56844 ) ) ( IN-CITY ?auto_56843 ?auto_56840 ) ( not ( = ?auto_56836 ?auto_56843 ) ) ( not ( = ?auto_56842 ?auto_56843 ) ) ( OBJ-AT ?auto_56838 ?auto_56843 ) ( TRUCK-AT ?auto_56841 ?auto_56842 ) ( OBJ-AT ?auto_56844 ?auto_56842 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56844 ?auto_56839 ?auto_56836 )
      ( DELIVER-3PKG-VERIFY ?auto_56837 ?auto_56838 ?auto_56839 ?auto_56836 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56856 - OBJ
      ?auto_56857 - OBJ
      ?auto_56858 - OBJ
      ?auto_56855 - LOCATION
    )
    :vars
    (
      ?auto_56862 - LOCATION
      ?auto_56859 - CITY
      ?auto_56860 - OBJ
      ?auto_56863 - LOCATION
      ?auto_56861 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56857 ?auto_56856 ) ) ( not ( = ?auto_56858 ?auto_56856 ) ) ( not ( = ?auto_56858 ?auto_56857 ) ) ( IN-CITY ?auto_56862 ?auto_56859 ) ( IN-CITY ?auto_56855 ?auto_56859 ) ( not ( = ?auto_56855 ?auto_56862 ) ) ( OBJ-AT ?auto_56857 ?auto_56862 ) ( OBJ-AT ?auto_56856 ?auto_56862 ) ( not ( = ?auto_56860 ?auto_56858 ) ) ( not ( = ?auto_56857 ?auto_56860 ) ) ( not ( = ?auto_56856 ?auto_56860 ) ) ( IN-CITY ?auto_56863 ?auto_56859 ) ( not ( = ?auto_56855 ?auto_56863 ) ) ( not ( = ?auto_56862 ?auto_56863 ) ) ( OBJ-AT ?auto_56860 ?auto_56863 ) ( TRUCK-AT ?auto_56861 ?auto_56862 ) ( OBJ-AT ?auto_56858 ?auto_56862 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56858 ?auto_56857 ?auto_56855 )
      ( DELIVER-3PKG-VERIFY ?auto_56856 ?auto_56857 ?auto_56858 ?auto_56855 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56865 - OBJ
      ?auto_56866 - OBJ
      ?auto_56867 - OBJ
      ?auto_56864 - LOCATION
    )
    :vars
    (
      ?auto_56872 - OBJ
      ?auto_56870 - LOCATION
      ?auto_56868 - CITY
      ?auto_56871 - LOCATION
      ?auto_56869 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56866 ?auto_56865 ) ) ( not ( = ?auto_56867 ?auto_56865 ) ) ( not ( = ?auto_56867 ?auto_56866 ) ) ( not ( = ?auto_56866 ?auto_56872 ) ) ( IN-CITY ?auto_56870 ?auto_56868 ) ( IN-CITY ?auto_56864 ?auto_56868 ) ( not ( = ?auto_56864 ?auto_56870 ) ) ( OBJ-AT ?auto_56866 ?auto_56870 ) ( not ( = ?auto_56865 ?auto_56872 ) ) ( OBJ-AT ?auto_56865 ?auto_56870 ) ( not ( = ?auto_56867 ?auto_56872 ) ) ( IN-CITY ?auto_56871 ?auto_56868 ) ( not ( = ?auto_56864 ?auto_56871 ) ) ( not ( = ?auto_56870 ?auto_56871 ) ) ( OBJ-AT ?auto_56867 ?auto_56871 ) ( TRUCK-AT ?auto_56869 ?auto_56870 ) ( OBJ-AT ?auto_56872 ?auto_56870 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56872 ?auto_56866 ?auto_56864 )
      ( DELIVER-3PKG-VERIFY ?auto_56865 ?auto_56866 ?auto_56867 ?auto_56864 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56904 - OBJ
      ?auto_56905 - OBJ
      ?auto_56906 - OBJ
      ?auto_56903 - LOCATION
    )
    :vars
    (
      ?auto_56910 - LOCATION
      ?auto_56907 - CITY
      ?auto_56909 - OBJ
      ?auto_56911 - LOCATION
      ?auto_56908 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56905 ?auto_56904 ) ) ( not ( = ?auto_56906 ?auto_56904 ) ) ( not ( = ?auto_56906 ?auto_56905 ) ) ( IN-CITY ?auto_56910 ?auto_56907 ) ( IN-CITY ?auto_56903 ?auto_56907 ) ( not ( = ?auto_56903 ?auto_56910 ) ) ( OBJ-AT ?auto_56904 ?auto_56910 ) ( not ( = ?auto_56909 ?auto_56905 ) ) ( not ( = ?auto_56904 ?auto_56909 ) ) ( OBJ-AT ?auto_56909 ?auto_56910 ) ( not ( = ?auto_56909 ?auto_56906 ) ) ( IN-CITY ?auto_56911 ?auto_56907 ) ( not ( = ?auto_56903 ?auto_56911 ) ) ( not ( = ?auto_56910 ?auto_56911 ) ) ( OBJ-AT ?auto_56906 ?auto_56911 ) ( TRUCK-AT ?auto_56908 ?auto_56910 ) ( OBJ-AT ?auto_56905 ?auto_56910 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56905 ?auto_56904 ?auto_56903 )
      ( DELIVER-3PKG-VERIFY ?auto_56904 ?auto_56905 ?auto_56906 ?auto_56903 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56913 - OBJ
      ?auto_56914 - OBJ
      ?auto_56915 - OBJ
      ?auto_56912 - LOCATION
    )
    :vars
    (
      ?auto_56919 - LOCATION
      ?auto_56916 - CITY
      ?auto_56917 - OBJ
      ?auto_56920 - LOCATION
      ?auto_56918 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56914 ?auto_56913 ) ) ( not ( = ?auto_56915 ?auto_56913 ) ) ( not ( = ?auto_56915 ?auto_56914 ) ) ( IN-CITY ?auto_56919 ?auto_56916 ) ( IN-CITY ?auto_56912 ?auto_56916 ) ( not ( = ?auto_56912 ?auto_56919 ) ) ( OBJ-AT ?auto_56913 ?auto_56919 ) ( OBJ-AT ?auto_56915 ?auto_56919 ) ( not ( = ?auto_56917 ?auto_56914 ) ) ( not ( = ?auto_56913 ?auto_56917 ) ) ( not ( = ?auto_56915 ?auto_56917 ) ) ( IN-CITY ?auto_56920 ?auto_56916 ) ( not ( = ?auto_56912 ?auto_56920 ) ) ( not ( = ?auto_56919 ?auto_56920 ) ) ( OBJ-AT ?auto_56917 ?auto_56920 ) ( TRUCK-AT ?auto_56918 ?auto_56919 ) ( OBJ-AT ?auto_56914 ?auto_56919 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56914 ?auto_56913 ?auto_56912 )
      ( DELIVER-3PKG-VERIFY ?auto_56913 ?auto_56914 ?auto_56915 ?auto_56912 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56932 - OBJ
      ?auto_56933 - OBJ
      ?auto_56934 - OBJ
      ?auto_56931 - LOCATION
    )
    :vars
    (
      ?auto_56938 - LOCATION
      ?auto_56935 - CITY
      ?auto_56937 - OBJ
      ?auto_56939 - LOCATION
      ?auto_56936 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56933 ?auto_56932 ) ) ( not ( = ?auto_56934 ?auto_56932 ) ) ( not ( = ?auto_56934 ?auto_56933 ) ) ( IN-CITY ?auto_56938 ?auto_56935 ) ( IN-CITY ?auto_56931 ?auto_56935 ) ( not ( = ?auto_56931 ?auto_56938 ) ) ( OBJ-AT ?auto_56932 ?auto_56938 ) ( not ( = ?auto_56937 ?auto_56934 ) ) ( not ( = ?auto_56932 ?auto_56937 ) ) ( OBJ-AT ?auto_56937 ?auto_56938 ) ( not ( = ?auto_56937 ?auto_56933 ) ) ( IN-CITY ?auto_56939 ?auto_56935 ) ( not ( = ?auto_56931 ?auto_56939 ) ) ( not ( = ?auto_56938 ?auto_56939 ) ) ( OBJ-AT ?auto_56933 ?auto_56939 ) ( TRUCK-AT ?auto_56936 ?auto_56938 ) ( OBJ-AT ?auto_56934 ?auto_56938 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56934 ?auto_56932 ?auto_56931 )
      ( DELIVER-3PKG-VERIFY ?auto_56932 ?auto_56933 ?auto_56934 ?auto_56931 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56951 - OBJ
      ?auto_56952 - OBJ
      ?auto_56953 - OBJ
      ?auto_56950 - LOCATION
    )
    :vars
    (
      ?auto_56958 - OBJ
      ?auto_56956 - LOCATION
      ?auto_56954 - CITY
      ?auto_56957 - LOCATION
      ?auto_56955 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56952 ?auto_56951 ) ) ( not ( = ?auto_56953 ?auto_56951 ) ) ( not ( = ?auto_56953 ?auto_56952 ) ) ( not ( = ?auto_56951 ?auto_56958 ) ) ( IN-CITY ?auto_56956 ?auto_56954 ) ( IN-CITY ?auto_56950 ?auto_56954 ) ( not ( = ?auto_56950 ?auto_56956 ) ) ( OBJ-AT ?auto_56951 ?auto_56956 ) ( not ( = ?auto_56953 ?auto_56958 ) ) ( OBJ-AT ?auto_56953 ?auto_56956 ) ( not ( = ?auto_56952 ?auto_56958 ) ) ( IN-CITY ?auto_56957 ?auto_56954 ) ( not ( = ?auto_56950 ?auto_56957 ) ) ( not ( = ?auto_56956 ?auto_56957 ) ) ( OBJ-AT ?auto_56952 ?auto_56957 ) ( TRUCK-AT ?auto_56955 ?auto_56956 ) ( OBJ-AT ?auto_56958 ?auto_56956 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56958 ?auto_56951 ?auto_56950 )
      ( DELIVER-3PKG-VERIFY ?auto_56951 ?auto_56952 ?auto_56953 ?auto_56950 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56970 - OBJ
      ?auto_56971 - OBJ
      ?auto_56972 - OBJ
      ?auto_56969 - LOCATION
    )
    :vars
    (
      ?auto_56976 - LOCATION
      ?auto_56973 - CITY
      ?auto_56974 - OBJ
      ?auto_56977 - LOCATION
      ?auto_56975 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56971 ?auto_56970 ) ) ( not ( = ?auto_56972 ?auto_56970 ) ) ( not ( = ?auto_56972 ?auto_56971 ) ) ( IN-CITY ?auto_56976 ?auto_56973 ) ( IN-CITY ?auto_56969 ?auto_56973 ) ( not ( = ?auto_56969 ?auto_56976 ) ) ( OBJ-AT ?auto_56970 ?auto_56976 ) ( OBJ-AT ?auto_56971 ?auto_56976 ) ( not ( = ?auto_56974 ?auto_56972 ) ) ( not ( = ?auto_56970 ?auto_56974 ) ) ( not ( = ?auto_56971 ?auto_56974 ) ) ( IN-CITY ?auto_56977 ?auto_56973 ) ( not ( = ?auto_56969 ?auto_56977 ) ) ( not ( = ?auto_56976 ?auto_56977 ) ) ( OBJ-AT ?auto_56974 ?auto_56977 ) ( TRUCK-AT ?auto_56975 ?auto_56976 ) ( OBJ-AT ?auto_56972 ?auto_56976 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56972 ?auto_56970 ?auto_56969 )
      ( DELIVER-3PKG-VERIFY ?auto_56970 ?auto_56971 ?auto_56972 ?auto_56969 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56979 - OBJ
      ?auto_56980 - OBJ
      ?auto_56981 - OBJ
      ?auto_56978 - LOCATION
    )
    :vars
    (
      ?auto_56986 - OBJ
      ?auto_56984 - LOCATION
      ?auto_56982 - CITY
      ?auto_56985 - LOCATION
      ?auto_56983 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_56980 ?auto_56979 ) ) ( not ( = ?auto_56981 ?auto_56979 ) ) ( not ( = ?auto_56981 ?auto_56980 ) ) ( not ( = ?auto_56979 ?auto_56986 ) ) ( IN-CITY ?auto_56984 ?auto_56982 ) ( IN-CITY ?auto_56978 ?auto_56982 ) ( not ( = ?auto_56978 ?auto_56984 ) ) ( OBJ-AT ?auto_56979 ?auto_56984 ) ( not ( = ?auto_56980 ?auto_56986 ) ) ( OBJ-AT ?auto_56980 ?auto_56984 ) ( not ( = ?auto_56981 ?auto_56986 ) ) ( IN-CITY ?auto_56985 ?auto_56982 ) ( not ( = ?auto_56978 ?auto_56985 ) ) ( not ( = ?auto_56984 ?auto_56985 ) ) ( OBJ-AT ?auto_56981 ?auto_56985 ) ( TRUCK-AT ?auto_56983 ?auto_56984 ) ( OBJ-AT ?auto_56986 ?auto_56984 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56986 ?auto_56979 ?auto_56978 )
      ( DELIVER-3PKG-VERIFY ?auto_56979 ?auto_56980 ?auto_56981 ?auto_56978 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57142 - OBJ
      ?auto_57143 - OBJ
      ?auto_57144 - OBJ
      ?auto_57145 - OBJ
      ?auto_57141 - LOCATION
    )
    :vars
    (
      ?auto_57148 - LOCATION
      ?auto_57146 - CITY
      ?auto_57149 - LOCATION
      ?auto_57147 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_57143 ?auto_57142 ) ) ( not ( = ?auto_57144 ?auto_57142 ) ) ( not ( = ?auto_57144 ?auto_57143 ) ) ( not ( = ?auto_57145 ?auto_57142 ) ) ( not ( = ?auto_57145 ?auto_57143 ) ) ( not ( = ?auto_57145 ?auto_57144 ) ) ( IN-CITY ?auto_57148 ?auto_57146 ) ( IN-CITY ?auto_57141 ?auto_57146 ) ( not ( = ?auto_57141 ?auto_57148 ) ) ( OBJ-AT ?auto_57145 ?auto_57148 ) ( OBJ-AT ?auto_57144 ?auto_57148 ) ( IN-CITY ?auto_57149 ?auto_57146 ) ( not ( = ?auto_57141 ?auto_57149 ) ) ( not ( = ?auto_57148 ?auto_57149 ) ) ( OBJ-AT ?auto_57143 ?auto_57149 ) ( TRUCK-AT ?auto_57147 ?auto_57148 ) ( OBJ-AT ?auto_57142 ?auto_57148 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57142 ?auto_57145 ?auto_57141 )
      ( DELIVER-4PKG-VERIFY ?auto_57142 ?auto_57143 ?auto_57144 ?auto_57145 ?auto_57141 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57171 - OBJ
      ?auto_57172 - OBJ
      ?auto_57173 - OBJ
      ?auto_57174 - OBJ
      ?auto_57170 - LOCATION
    )
    :vars
    (
      ?auto_57177 - LOCATION
      ?auto_57175 - CITY
      ?auto_57178 - LOCATION
      ?auto_57176 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_57172 ?auto_57171 ) ) ( not ( = ?auto_57173 ?auto_57171 ) ) ( not ( = ?auto_57173 ?auto_57172 ) ) ( not ( = ?auto_57174 ?auto_57171 ) ) ( not ( = ?auto_57174 ?auto_57172 ) ) ( not ( = ?auto_57174 ?auto_57173 ) ) ( IN-CITY ?auto_57177 ?auto_57175 ) ( IN-CITY ?auto_57170 ?auto_57175 ) ( not ( = ?auto_57170 ?auto_57177 ) ) ( OBJ-AT ?auto_57173 ?auto_57177 ) ( OBJ-AT ?auto_57174 ?auto_57177 ) ( IN-CITY ?auto_57178 ?auto_57175 ) ( not ( = ?auto_57170 ?auto_57178 ) ) ( not ( = ?auto_57177 ?auto_57178 ) ) ( OBJ-AT ?auto_57172 ?auto_57178 ) ( TRUCK-AT ?auto_57176 ?auto_57177 ) ( OBJ-AT ?auto_57171 ?auto_57177 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57171 ?auto_57173 ?auto_57170 )
      ( DELIVER-4PKG-VERIFY ?auto_57171 ?auto_57172 ?auto_57173 ?auto_57174 ?auto_57170 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57200 - OBJ
      ?auto_57201 - OBJ
      ?auto_57202 - OBJ
      ?auto_57203 - OBJ
      ?auto_57199 - LOCATION
    )
    :vars
    (
      ?auto_57206 - LOCATION
      ?auto_57204 - CITY
      ?auto_57207 - LOCATION
      ?auto_57205 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_57201 ?auto_57200 ) ) ( not ( = ?auto_57202 ?auto_57200 ) ) ( not ( = ?auto_57202 ?auto_57201 ) ) ( not ( = ?auto_57203 ?auto_57200 ) ) ( not ( = ?auto_57203 ?auto_57201 ) ) ( not ( = ?auto_57203 ?auto_57202 ) ) ( IN-CITY ?auto_57206 ?auto_57204 ) ( IN-CITY ?auto_57199 ?auto_57204 ) ( not ( = ?auto_57199 ?auto_57206 ) ) ( OBJ-AT ?auto_57203 ?auto_57206 ) ( OBJ-AT ?auto_57201 ?auto_57206 ) ( IN-CITY ?auto_57207 ?auto_57204 ) ( not ( = ?auto_57199 ?auto_57207 ) ) ( not ( = ?auto_57206 ?auto_57207 ) ) ( OBJ-AT ?auto_57202 ?auto_57207 ) ( TRUCK-AT ?auto_57205 ?auto_57206 ) ( OBJ-AT ?auto_57200 ?auto_57206 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57200 ?auto_57203 ?auto_57199 )
      ( DELIVER-4PKG-VERIFY ?auto_57200 ?auto_57201 ?auto_57202 ?auto_57203 ?auto_57199 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57229 - OBJ
      ?auto_57230 - OBJ
      ?auto_57231 - OBJ
      ?auto_57232 - OBJ
      ?auto_57228 - LOCATION
    )
    :vars
    (
      ?auto_57235 - LOCATION
      ?auto_57233 - CITY
      ?auto_57236 - LOCATION
      ?auto_57234 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_57230 ?auto_57229 ) ) ( not ( = ?auto_57231 ?auto_57229 ) ) ( not ( = ?auto_57231 ?auto_57230 ) ) ( not ( = ?auto_57232 ?auto_57229 ) ) ( not ( = ?auto_57232 ?auto_57230 ) ) ( not ( = ?auto_57232 ?auto_57231 ) ) ( IN-CITY ?auto_57235 ?auto_57233 ) ( IN-CITY ?auto_57228 ?auto_57233 ) ( not ( = ?auto_57228 ?auto_57235 ) ) ( OBJ-AT ?auto_57231 ?auto_57235 ) ( OBJ-AT ?auto_57230 ?auto_57235 ) ( IN-CITY ?auto_57236 ?auto_57233 ) ( not ( = ?auto_57228 ?auto_57236 ) ) ( not ( = ?auto_57235 ?auto_57236 ) ) ( OBJ-AT ?auto_57232 ?auto_57236 ) ( TRUCK-AT ?auto_57234 ?auto_57235 ) ( OBJ-AT ?auto_57229 ?auto_57235 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57229 ?auto_57231 ?auto_57228 )
      ( DELIVER-4PKG-VERIFY ?auto_57229 ?auto_57230 ?auto_57231 ?auto_57232 ?auto_57228 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57320 - OBJ
      ?auto_57321 - OBJ
      ?auto_57322 - OBJ
      ?auto_57323 - OBJ
      ?auto_57319 - LOCATION
    )
    :vars
    (
      ?auto_57326 - LOCATION
      ?auto_57324 - CITY
      ?auto_57327 - LOCATION
      ?auto_57325 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_57321 ?auto_57320 ) ) ( not ( = ?auto_57322 ?auto_57320 ) ) ( not ( = ?auto_57322 ?auto_57321 ) ) ( not ( = ?auto_57323 ?auto_57320 ) ) ( not ( = ?auto_57323 ?auto_57321 ) ) ( not ( = ?auto_57323 ?auto_57322 ) ) ( IN-CITY ?auto_57326 ?auto_57324 ) ( IN-CITY ?auto_57319 ?auto_57324 ) ( not ( = ?auto_57319 ?auto_57326 ) ) ( OBJ-AT ?auto_57321 ?auto_57326 ) ( OBJ-AT ?auto_57323 ?auto_57326 ) ( IN-CITY ?auto_57327 ?auto_57324 ) ( not ( = ?auto_57319 ?auto_57327 ) ) ( not ( = ?auto_57326 ?auto_57327 ) ) ( OBJ-AT ?auto_57322 ?auto_57327 ) ( TRUCK-AT ?auto_57325 ?auto_57326 ) ( OBJ-AT ?auto_57320 ?auto_57326 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57320 ?auto_57321 ?auto_57319 )
      ( DELIVER-4PKG-VERIFY ?auto_57320 ?auto_57321 ?auto_57322 ?auto_57323 ?auto_57319 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57349 - OBJ
      ?auto_57350 - OBJ
      ?auto_57351 - OBJ
      ?auto_57352 - OBJ
      ?auto_57348 - LOCATION
    )
    :vars
    (
      ?auto_57355 - LOCATION
      ?auto_57353 - CITY
      ?auto_57356 - LOCATION
      ?auto_57354 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_57350 ?auto_57349 ) ) ( not ( = ?auto_57351 ?auto_57349 ) ) ( not ( = ?auto_57351 ?auto_57350 ) ) ( not ( = ?auto_57352 ?auto_57349 ) ) ( not ( = ?auto_57352 ?auto_57350 ) ) ( not ( = ?auto_57352 ?auto_57351 ) ) ( IN-CITY ?auto_57355 ?auto_57353 ) ( IN-CITY ?auto_57348 ?auto_57353 ) ( not ( = ?auto_57348 ?auto_57355 ) ) ( OBJ-AT ?auto_57350 ?auto_57355 ) ( OBJ-AT ?auto_57351 ?auto_57355 ) ( IN-CITY ?auto_57356 ?auto_57353 ) ( not ( = ?auto_57348 ?auto_57356 ) ) ( not ( = ?auto_57355 ?auto_57356 ) ) ( OBJ-AT ?auto_57352 ?auto_57356 ) ( TRUCK-AT ?auto_57354 ?auto_57355 ) ( OBJ-AT ?auto_57349 ?auto_57355 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57349 ?auto_57350 ?auto_57348 )
      ( DELIVER-4PKG-VERIFY ?auto_57349 ?auto_57350 ?auto_57351 ?auto_57352 ?auto_57348 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57440 - OBJ
      ?auto_57441 - OBJ
      ?auto_57442 - OBJ
      ?auto_57443 - OBJ
      ?auto_57439 - LOCATION
    )
    :vars
    (
      ?auto_57446 - LOCATION
      ?auto_57444 - CITY
      ?auto_57447 - LOCATION
      ?auto_57445 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_57441 ?auto_57440 ) ) ( not ( = ?auto_57442 ?auto_57440 ) ) ( not ( = ?auto_57442 ?auto_57441 ) ) ( not ( = ?auto_57443 ?auto_57440 ) ) ( not ( = ?auto_57443 ?auto_57441 ) ) ( not ( = ?auto_57443 ?auto_57442 ) ) ( IN-CITY ?auto_57446 ?auto_57444 ) ( IN-CITY ?auto_57439 ?auto_57444 ) ( not ( = ?auto_57439 ?auto_57446 ) ) ( OBJ-AT ?auto_57443 ?auto_57446 ) ( OBJ-AT ?auto_57442 ?auto_57446 ) ( IN-CITY ?auto_57447 ?auto_57444 ) ( not ( = ?auto_57439 ?auto_57447 ) ) ( not ( = ?auto_57446 ?auto_57447 ) ) ( OBJ-AT ?auto_57440 ?auto_57447 ) ( TRUCK-AT ?auto_57445 ?auto_57446 ) ( OBJ-AT ?auto_57441 ?auto_57446 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57441 ?auto_57443 ?auto_57439 )
      ( DELIVER-4PKG-VERIFY ?auto_57440 ?auto_57441 ?auto_57442 ?auto_57443 ?auto_57439 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57469 - OBJ
      ?auto_57470 - OBJ
      ?auto_57471 - OBJ
      ?auto_57472 - OBJ
      ?auto_57468 - LOCATION
    )
    :vars
    (
      ?auto_57475 - LOCATION
      ?auto_57473 - CITY
      ?auto_57476 - LOCATION
      ?auto_57474 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_57470 ?auto_57469 ) ) ( not ( = ?auto_57471 ?auto_57469 ) ) ( not ( = ?auto_57471 ?auto_57470 ) ) ( not ( = ?auto_57472 ?auto_57469 ) ) ( not ( = ?auto_57472 ?auto_57470 ) ) ( not ( = ?auto_57472 ?auto_57471 ) ) ( IN-CITY ?auto_57475 ?auto_57473 ) ( IN-CITY ?auto_57468 ?auto_57473 ) ( not ( = ?auto_57468 ?auto_57475 ) ) ( OBJ-AT ?auto_57471 ?auto_57475 ) ( OBJ-AT ?auto_57472 ?auto_57475 ) ( IN-CITY ?auto_57476 ?auto_57473 ) ( not ( = ?auto_57468 ?auto_57476 ) ) ( not ( = ?auto_57475 ?auto_57476 ) ) ( OBJ-AT ?auto_57469 ?auto_57476 ) ( TRUCK-AT ?auto_57474 ?auto_57475 ) ( OBJ-AT ?auto_57470 ?auto_57475 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57470 ?auto_57471 ?auto_57468 )
      ( DELIVER-4PKG-VERIFY ?auto_57469 ?auto_57470 ?auto_57471 ?auto_57472 ?auto_57468 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57561 - OBJ
      ?auto_57562 - OBJ
      ?auto_57563 - OBJ
      ?auto_57564 - OBJ
      ?auto_57560 - LOCATION
    )
    :vars
    (
      ?auto_57567 - LOCATION
      ?auto_57565 - CITY
      ?auto_57568 - LOCATION
      ?auto_57566 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_57562 ?auto_57561 ) ) ( not ( = ?auto_57563 ?auto_57561 ) ) ( not ( = ?auto_57563 ?auto_57562 ) ) ( not ( = ?auto_57564 ?auto_57561 ) ) ( not ( = ?auto_57564 ?auto_57562 ) ) ( not ( = ?auto_57564 ?auto_57563 ) ) ( IN-CITY ?auto_57567 ?auto_57565 ) ( IN-CITY ?auto_57560 ?auto_57565 ) ( not ( = ?auto_57560 ?auto_57567 ) ) ( OBJ-AT ?auto_57564 ?auto_57567 ) ( OBJ-AT ?auto_57562 ?auto_57567 ) ( IN-CITY ?auto_57568 ?auto_57565 ) ( not ( = ?auto_57560 ?auto_57568 ) ) ( not ( = ?auto_57567 ?auto_57568 ) ) ( OBJ-AT ?auto_57561 ?auto_57568 ) ( TRUCK-AT ?auto_57566 ?auto_57567 ) ( OBJ-AT ?auto_57563 ?auto_57567 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57563 ?auto_57564 ?auto_57560 )
      ( DELIVER-4PKG-VERIFY ?auto_57561 ?auto_57562 ?auto_57563 ?auto_57564 ?auto_57560 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57590 - OBJ
      ?auto_57591 - OBJ
      ?auto_57592 - OBJ
      ?auto_57593 - OBJ
      ?auto_57589 - LOCATION
    )
    :vars
    (
      ?auto_57596 - LOCATION
      ?auto_57594 - CITY
      ?auto_57597 - LOCATION
      ?auto_57595 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_57591 ?auto_57590 ) ) ( not ( = ?auto_57592 ?auto_57590 ) ) ( not ( = ?auto_57592 ?auto_57591 ) ) ( not ( = ?auto_57593 ?auto_57590 ) ) ( not ( = ?auto_57593 ?auto_57591 ) ) ( not ( = ?auto_57593 ?auto_57592 ) ) ( IN-CITY ?auto_57596 ?auto_57594 ) ( IN-CITY ?auto_57589 ?auto_57594 ) ( not ( = ?auto_57589 ?auto_57596 ) ) ( OBJ-AT ?auto_57592 ?auto_57596 ) ( OBJ-AT ?auto_57591 ?auto_57596 ) ( IN-CITY ?auto_57597 ?auto_57594 ) ( not ( = ?auto_57589 ?auto_57597 ) ) ( not ( = ?auto_57596 ?auto_57597 ) ) ( OBJ-AT ?auto_57590 ?auto_57597 ) ( TRUCK-AT ?auto_57595 ?auto_57596 ) ( OBJ-AT ?auto_57593 ?auto_57596 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57593 ?auto_57592 ?auto_57589 )
      ( DELIVER-4PKG-VERIFY ?auto_57590 ?auto_57591 ?auto_57592 ?auto_57593 ?auto_57589 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57649 - OBJ
      ?auto_57650 - OBJ
      ?auto_57651 - OBJ
      ?auto_57652 - OBJ
      ?auto_57648 - LOCATION
    )
    :vars
    (
      ?auto_57655 - LOCATION
      ?auto_57653 - CITY
      ?auto_57656 - LOCATION
      ?auto_57654 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_57650 ?auto_57649 ) ) ( not ( = ?auto_57651 ?auto_57649 ) ) ( not ( = ?auto_57651 ?auto_57650 ) ) ( not ( = ?auto_57652 ?auto_57649 ) ) ( not ( = ?auto_57652 ?auto_57650 ) ) ( not ( = ?auto_57652 ?auto_57651 ) ) ( IN-CITY ?auto_57655 ?auto_57653 ) ( IN-CITY ?auto_57648 ?auto_57653 ) ( not ( = ?auto_57648 ?auto_57655 ) ) ( OBJ-AT ?auto_57650 ?auto_57655 ) ( OBJ-AT ?auto_57652 ?auto_57655 ) ( IN-CITY ?auto_57656 ?auto_57653 ) ( not ( = ?auto_57648 ?auto_57656 ) ) ( not ( = ?auto_57655 ?auto_57656 ) ) ( OBJ-AT ?auto_57649 ?auto_57656 ) ( TRUCK-AT ?auto_57654 ?auto_57655 ) ( OBJ-AT ?auto_57651 ?auto_57655 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57651 ?auto_57650 ?auto_57648 )
      ( DELIVER-4PKG-VERIFY ?auto_57649 ?auto_57650 ?auto_57651 ?auto_57652 ?auto_57648 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57710 - OBJ
      ?auto_57711 - OBJ
      ?auto_57712 - OBJ
      ?auto_57713 - OBJ
      ?auto_57709 - LOCATION
    )
    :vars
    (
      ?auto_57716 - LOCATION
      ?auto_57714 - CITY
      ?auto_57717 - LOCATION
      ?auto_57715 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_57711 ?auto_57710 ) ) ( not ( = ?auto_57712 ?auto_57710 ) ) ( not ( = ?auto_57712 ?auto_57711 ) ) ( not ( = ?auto_57713 ?auto_57710 ) ) ( not ( = ?auto_57713 ?auto_57711 ) ) ( not ( = ?auto_57713 ?auto_57712 ) ) ( IN-CITY ?auto_57716 ?auto_57714 ) ( IN-CITY ?auto_57709 ?auto_57714 ) ( not ( = ?auto_57709 ?auto_57716 ) ) ( OBJ-AT ?auto_57711 ?auto_57716 ) ( OBJ-AT ?auto_57712 ?auto_57716 ) ( IN-CITY ?auto_57717 ?auto_57714 ) ( not ( = ?auto_57709 ?auto_57717 ) ) ( not ( = ?auto_57716 ?auto_57717 ) ) ( OBJ-AT ?auto_57710 ?auto_57717 ) ( TRUCK-AT ?auto_57715 ?auto_57716 ) ( OBJ-AT ?auto_57713 ?auto_57716 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57713 ?auto_57711 ?auto_57709 )
      ( DELIVER-4PKG-VERIFY ?auto_57710 ?auto_57711 ?auto_57712 ?auto_57713 ?auto_57709 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57801 - OBJ
      ?auto_57802 - OBJ
      ?auto_57803 - OBJ
      ?auto_57804 - OBJ
      ?auto_57800 - LOCATION
    )
    :vars
    (
      ?auto_57807 - LOCATION
      ?auto_57805 - CITY
      ?auto_57808 - LOCATION
      ?auto_57806 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_57802 ?auto_57801 ) ) ( not ( = ?auto_57803 ?auto_57801 ) ) ( not ( = ?auto_57803 ?auto_57802 ) ) ( not ( = ?auto_57804 ?auto_57801 ) ) ( not ( = ?auto_57804 ?auto_57802 ) ) ( not ( = ?auto_57804 ?auto_57803 ) ) ( IN-CITY ?auto_57807 ?auto_57805 ) ( IN-CITY ?auto_57800 ?auto_57805 ) ( not ( = ?auto_57800 ?auto_57807 ) ) ( OBJ-AT ?auto_57804 ?auto_57807 ) ( OBJ-AT ?auto_57801 ?auto_57807 ) ( IN-CITY ?auto_57808 ?auto_57805 ) ( not ( = ?auto_57800 ?auto_57808 ) ) ( not ( = ?auto_57807 ?auto_57808 ) ) ( OBJ-AT ?auto_57803 ?auto_57808 ) ( TRUCK-AT ?auto_57806 ?auto_57807 ) ( OBJ-AT ?auto_57802 ?auto_57807 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57802 ?auto_57804 ?auto_57800 )
      ( DELIVER-4PKG-VERIFY ?auto_57801 ?auto_57802 ?auto_57803 ?auto_57804 ?auto_57800 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57830 - OBJ
      ?auto_57831 - OBJ
      ?auto_57832 - OBJ
      ?auto_57833 - OBJ
      ?auto_57829 - LOCATION
    )
    :vars
    (
      ?auto_57836 - LOCATION
      ?auto_57834 - CITY
      ?auto_57837 - LOCATION
      ?auto_57835 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_57831 ?auto_57830 ) ) ( not ( = ?auto_57832 ?auto_57830 ) ) ( not ( = ?auto_57832 ?auto_57831 ) ) ( not ( = ?auto_57833 ?auto_57830 ) ) ( not ( = ?auto_57833 ?auto_57831 ) ) ( not ( = ?auto_57833 ?auto_57832 ) ) ( IN-CITY ?auto_57836 ?auto_57834 ) ( IN-CITY ?auto_57829 ?auto_57834 ) ( not ( = ?auto_57829 ?auto_57836 ) ) ( OBJ-AT ?auto_57832 ?auto_57836 ) ( OBJ-AT ?auto_57830 ?auto_57836 ) ( IN-CITY ?auto_57837 ?auto_57834 ) ( not ( = ?auto_57829 ?auto_57837 ) ) ( not ( = ?auto_57836 ?auto_57837 ) ) ( OBJ-AT ?auto_57833 ?auto_57837 ) ( TRUCK-AT ?auto_57835 ?auto_57836 ) ( OBJ-AT ?auto_57831 ?auto_57836 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57831 ?auto_57832 ?auto_57829 )
      ( DELIVER-4PKG-VERIFY ?auto_57830 ?auto_57831 ?auto_57832 ?auto_57833 ?auto_57829 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57859 - OBJ
      ?auto_57860 - OBJ
      ?auto_57861 - OBJ
      ?auto_57862 - OBJ
      ?auto_57858 - LOCATION
    )
    :vars
    (
      ?auto_57865 - LOCATION
      ?auto_57863 - CITY
      ?auto_57866 - LOCATION
      ?auto_57864 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_57860 ?auto_57859 ) ) ( not ( = ?auto_57861 ?auto_57859 ) ) ( not ( = ?auto_57861 ?auto_57860 ) ) ( not ( = ?auto_57862 ?auto_57859 ) ) ( not ( = ?auto_57862 ?auto_57860 ) ) ( not ( = ?auto_57862 ?auto_57861 ) ) ( IN-CITY ?auto_57865 ?auto_57863 ) ( IN-CITY ?auto_57858 ?auto_57863 ) ( not ( = ?auto_57858 ?auto_57865 ) ) ( OBJ-AT ?auto_57862 ?auto_57865 ) ( OBJ-AT ?auto_57859 ?auto_57865 ) ( IN-CITY ?auto_57866 ?auto_57863 ) ( not ( = ?auto_57858 ?auto_57866 ) ) ( not ( = ?auto_57865 ?auto_57866 ) ) ( OBJ-AT ?auto_57860 ?auto_57866 ) ( TRUCK-AT ?auto_57864 ?auto_57865 ) ( OBJ-AT ?auto_57861 ?auto_57865 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57861 ?auto_57862 ?auto_57858 )
      ( DELIVER-4PKG-VERIFY ?auto_57859 ?auto_57860 ?auto_57861 ?auto_57862 ?auto_57858 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57888 - OBJ
      ?auto_57889 - OBJ
      ?auto_57890 - OBJ
      ?auto_57891 - OBJ
      ?auto_57887 - LOCATION
    )
    :vars
    (
      ?auto_57894 - LOCATION
      ?auto_57892 - CITY
      ?auto_57895 - LOCATION
      ?auto_57893 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_57889 ?auto_57888 ) ) ( not ( = ?auto_57890 ?auto_57888 ) ) ( not ( = ?auto_57890 ?auto_57889 ) ) ( not ( = ?auto_57891 ?auto_57888 ) ) ( not ( = ?auto_57891 ?auto_57889 ) ) ( not ( = ?auto_57891 ?auto_57890 ) ) ( IN-CITY ?auto_57894 ?auto_57892 ) ( IN-CITY ?auto_57887 ?auto_57892 ) ( not ( = ?auto_57887 ?auto_57894 ) ) ( OBJ-AT ?auto_57890 ?auto_57894 ) ( OBJ-AT ?auto_57888 ?auto_57894 ) ( IN-CITY ?auto_57895 ?auto_57892 ) ( not ( = ?auto_57887 ?auto_57895 ) ) ( not ( = ?auto_57894 ?auto_57895 ) ) ( OBJ-AT ?auto_57889 ?auto_57895 ) ( TRUCK-AT ?auto_57893 ?auto_57894 ) ( OBJ-AT ?auto_57891 ?auto_57894 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57891 ?auto_57890 ?auto_57887 )
      ( DELIVER-4PKG-VERIFY ?auto_57888 ?auto_57889 ?auto_57890 ?auto_57891 ?auto_57887 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58010 - OBJ
      ?auto_58011 - OBJ
      ?auto_58012 - OBJ
      ?auto_58013 - OBJ
      ?auto_58009 - LOCATION
    )
    :vars
    (
      ?auto_58016 - LOCATION
      ?auto_58014 - CITY
      ?auto_58017 - LOCATION
      ?auto_58015 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58011 ?auto_58010 ) ) ( not ( = ?auto_58012 ?auto_58010 ) ) ( not ( = ?auto_58012 ?auto_58011 ) ) ( not ( = ?auto_58013 ?auto_58010 ) ) ( not ( = ?auto_58013 ?auto_58011 ) ) ( not ( = ?auto_58013 ?auto_58012 ) ) ( IN-CITY ?auto_58016 ?auto_58014 ) ( IN-CITY ?auto_58009 ?auto_58014 ) ( not ( = ?auto_58009 ?auto_58016 ) ) ( OBJ-AT ?auto_58011 ?auto_58016 ) ( OBJ-AT ?auto_58010 ?auto_58016 ) ( IN-CITY ?auto_58017 ?auto_58014 ) ( not ( = ?auto_58009 ?auto_58017 ) ) ( not ( = ?auto_58016 ?auto_58017 ) ) ( OBJ-AT ?auto_58013 ?auto_58017 ) ( TRUCK-AT ?auto_58015 ?auto_58016 ) ( OBJ-AT ?auto_58012 ?auto_58016 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58012 ?auto_58011 ?auto_58009 )
      ( DELIVER-4PKG-VERIFY ?auto_58010 ?auto_58011 ?auto_58012 ?auto_58013 ?auto_58009 ) )
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
      ?auto_58045 - LOCATION
      ?auto_58043 - CITY
      ?auto_58046 - LOCATION
      ?auto_58044 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58040 ?auto_58039 ) ) ( not ( = ?auto_58041 ?auto_58039 ) ) ( not ( = ?auto_58041 ?auto_58040 ) ) ( not ( = ?auto_58042 ?auto_58039 ) ) ( not ( = ?auto_58042 ?auto_58040 ) ) ( not ( = ?auto_58042 ?auto_58041 ) ) ( IN-CITY ?auto_58045 ?auto_58043 ) ( IN-CITY ?auto_58038 ?auto_58043 ) ( not ( = ?auto_58038 ?auto_58045 ) ) ( OBJ-AT ?auto_58040 ?auto_58045 ) ( OBJ-AT ?auto_58039 ?auto_58045 ) ( IN-CITY ?auto_58046 ?auto_58043 ) ( not ( = ?auto_58038 ?auto_58046 ) ) ( not ( = ?auto_58045 ?auto_58046 ) ) ( OBJ-AT ?auto_58041 ?auto_58046 ) ( TRUCK-AT ?auto_58044 ?auto_58045 ) ( OBJ-AT ?auto_58042 ?auto_58045 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58042 ?auto_58040 ?auto_58038 )
      ( DELIVER-4PKG-VERIFY ?auto_58039 ?auto_58040 ?auto_58041 ?auto_58042 ?auto_58038 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58224 - OBJ
      ?auto_58225 - OBJ
      ?auto_58226 - OBJ
      ?auto_58227 - OBJ
      ?auto_58223 - LOCATION
    )
    :vars
    (
      ?auto_58230 - LOCATION
      ?auto_58228 - CITY
      ?auto_58231 - LOCATION
      ?auto_58229 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58225 ?auto_58224 ) ) ( not ( = ?auto_58226 ?auto_58224 ) ) ( not ( = ?auto_58226 ?auto_58225 ) ) ( not ( = ?auto_58227 ?auto_58224 ) ) ( not ( = ?auto_58227 ?auto_58225 ) ) ( not ( = ?auto_58227 ?auto_58226 ) ) ( IN-CITY ?auto_58230 ?auto_58228 ) ( IN-CITY ?auto_58223 ?auto_58228 ) ( not ( = ?auto_58223 ?auto_58230 ) ) ( OBJ-AT ?auto_58224 ?auto_58230 ) ( OBJ-AT ?auto_58227 ?auto_58230 ) ( IN-CITY ?auto_58231 ?auto_58228 ) ( not ( = ?auto_58223 ?auto_58231 ) ) ( not ( = ?auto_58230 ?auto_58231 ) ) ( OBJ-AT ?auto_58226 ?auto_58231 ) ( TRUCK-AT ?auto_58229 ?auto_58230 ) ( OBJ-AT ?auto_58225 ?auto_58230 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58225 ?auto_58224 ?auto_58223 )
      ( DELIVER-4PKG-VERIFY ?auto_58224 ?auto_58225 ?auto_58226 ?auto_58227 ?auto_58223 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58253 - OBJ
      ?auto_58254 - OBJ
      ?auto_58255 - OBJ
      ?auto_58256 - OBJ
      ?auto_58252 - LOCATION
    )
    :vars
    (
      ?auto_58259 - LOCATION
      ?auto_58257 - CITY
      ?auto_58260 - LOCATION
      ?auto_58258 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58254 ?auto_58253 ) ) ( not ( = ?auto_58255 ?auto_58253 ) ) ( not ( = ?auto_58255 ?auto_58254 ) ) ( not ( = ?auto_58256 ?auto_58253 ) ) ( not ( = ?auto_58256 ?auto_58254 ) ) ( not ( = ?auto_58256 ?auto_58255 ) ) ( IN-CITY ?auto_58259 ?auto_58257 ) ( IN-CITY ?auto_58252 ?auto_58257 ) ( not ( = ?auto_58252 ?auto_58259 ) ) ( OBJ-AT ?auto_58253 ?auto_58259 ) ( OBJ-AT ?auto_58255 ?auto_58259 ) ( IN-CITY ?auto_58260 ?auto_58257 ) ( not ( = ?auto_58252 ?auto_58260 ) ) ( not ( = ?auto_58259 ?auto_58260 ) ) ( OBJ-AT ?auto_58256 ?auto_58260 ) ( TRUCK-AT ?auto_58258 ?auto_58259 ) ( OBJ-AT ?auto_58254 ?auto_58259 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58254 ?auto_58253 ?auto_58252 )
      ( DELIVER-4PKG-VERIFY ?auto_58253 ?auto_58254 ?auto_58255 ?auto_58256 ?auto_58252 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58344 - OBJ
      ?auto_58345 - OBJ
      ?auto_58346 - OBJ
      ?auto_58347 - OBJ
      ?auto_58343 - LOCATION
    )
    :vars
    (
      ?auto_58350 - LOCATION
      ?auto_58348 - CITY
      ?auto_58351 - LOCATION
      ?auto_58349 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58345 ?auto_58344 ) ) ( not ( = ?auto_58346 ?auto_58344 ) ) ( not ( = ?auto_58346 ?auto_58345 ) ) ( not ( = ?auto_58347 ?auto_58344 ) ) ( not ( = ?auto_58347 ?auto_58345 ) ) ( not ( = ?auto_58347 ?auto_58346 ) ) ( IN-CITY ?auto_58350 ?auto_58348 ) ( IN-CITY ?auto_58343 ?auto_58348 ) ( not ( = ?auto_58343 ?auto_58350 ) ) ( OBJ-AT ?auto_58344 ?auto_58350 ) ( OBJ-AT ?auto_58347 ?auto_58350 ) ( IN-CITY ?auto_58351 ?auto_58348 ) ( not ( = ?auto_58343 ?auto_58351 ) ) ( not ( = ?auto_58350 ?auto_58351 ) ) ( OBJ-AT ?auto_58345 ?auto_58351 ) ( TRUCK-AT ?auto_58349 ?auto_58350 ) ( OBJ-AT ?auto_58346 ?auto_58350 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58346 ?auto_58344 ?auto_58343 )
      ( DELIVER-4PKG-VERIFY ?auto_58344 ?auto_58345 ?auto_58346 ?auto_58347 ?auto_58343 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58405 - OBJ
      ?auto_58406 - OBJ
      ?auto_58407 - OBJ
      ?auto_58408 - OBJ
      ?auto_58404 - LOCATION
    )
    :vars
    (
      ?auto_58411 - LOCATION
      ?auto_58409 - CITY
      ?auto_58412 - LOCATION
      ?auto_58410 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58406 ?auto_58405 ) ) ( not ( = ?auto_58407 ?auto_58405 ) ) ( not ( = ?auto_58407 ?auto_58406 ) ) ( not ( = ?auto_58408 ?auto_58405 ) ) ( not ( = ?auto_58408 ?auto_58406 ) ) ( not ( = ?auto_58408 ?auto_58407 ) ) ( IN-CITY ?auto_58411 ?auto_58409 ) ( IN-CITY ?auto_58404 ?auto_58409 ) ( not ( = ?auto_58404 ?auto_58411 ) ) ( OBJ-AT ?auto_58405 ?auto_58411 ) ( OBJ-AT ?auto_58407 ?auto_58411 ) ( IN-CITY ?auto_58412 ?auto_58409 ) ( not ( = ?auto_58404 ?auto_58412 ) ) ( not ( = ?auto_58411 ?auto_58412 ) ) ( OBJ-AT ?auto_58406 ?auto_58412 ) ( TRUCK-AT ?auto_58410 ?auto_58411 ) ( OBJ-AT ?auto_58408 ?auto_58411 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58408 ?auto_58405 ?auto_58404 )
      ( DELIVER-4PKG-VERIFY ?auto_58405 ?auto_58406 ?auto_58407 ?auto_58408 ?auto_58404 ) )
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
      ?auto_58502 - LOCATION
      ?auto_58500 - CITY
      ?auto_58503 - LOCATION
      ?auto_58501 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58497 ?auto_58496 ) ) ( not ( = ?auto_58498 ?auto_58496 ) ) ( not ( = ?auto_58498 ?auto_58497 ) ) ( not ( = ?auto_58499 ?auto_58496 ) ) ( not ( = ?auto_58499 ?auto_58497 ) ) ( not ( = ?auto_58499 ?auto_58498 ) ) ( IN-CITY ?auto_58502 ?auto_58500 ) ( IN-CITY ?auto_58495 ?auto_58500 ) ( not ( = ?auto_58495 ?auto_58502 ) ) ( OBJ-AT ?auto_58496 ?auto_58502 ) ( OBJ-AT ?auto_58497 ?auto_58502 ) ( IN-CITY ?auto_58503 ?auto_58500 ) ( not ( = ?auto_58495 ?auto_58503 ) ) ( not ( = ?auto_58502 ?auto_58503 ) ) ( OBJ-AT ?auto_58499 ?auto_58503 ) ( TRUCK-AT ?auto_58501 ?auto_58502 ) ( OBJ-AT ?auto_58498 ?auto_58502 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58498 ?auto_58496 ?auto_58495 )
      ( DELIVER-4PKG-VERIFY ?auto_58496 ?auto_58497 ?auto_58498 ?auto_58499 ?auto_58495 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58525 - OBJ
      ?auto_58526 - OBJ
      ?auto_58527 - OBJ
      ?auto_58528 - OBJ
      ?auto_58524 - LOCATION
    )
    :vars
    (
      ?auto_58531 - LOCATION
      ?auto_58529 - CITY
      ?auto_58532 - LOCATION
      ?auto_58530 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58526 ?auto_58525 ) ) ( not ( = ?auto_58527 ?auto_58525 ) ) ( not ( = ?auto_58527 ?auto_58526 ) ) ( not ( = ?auto_58528 ?auto_58525 ) ) ( not ( = ?auto_58528 ?auto_58526 ) ) ( not ( = ?auto_58528 ?auto_58527 ) ) ( IN-CITY ?auto_58531 ?auto_58529 ) ( IN-CITY ?auto_58524 ?auto_58529 ) ( not ( = ?auto_58524 ?auto_58531 ) ) ( OBJ-AT ?auto_58525 ?auto_58531 ) ( OBJ-AT ?auto_58526 ?auto_58531 ) ( IN-CITY ?auto_58532 ?auto_58529 ) ( not ( = ?auto_58524 ?auto_58532 ) ) ( not ( = ?auto_58531 ?auto_58532 ) ) ( OBJ-AT ?auto_58527 ?auto_58532 ) ( TRUCK-AT ?auto_58530 ?auto_58531 ) ( OBJ-AT ?auto_58528 ?auto_58531 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58528 ?auto_58525 ?auto_58524 )
      ( DELIVER-4PKG-VERIFY ?auto_58525 ?auto_58526 ?auto_58527 ?auto_58528 ?auto_58524 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_58819 - OBJ
      ?auto_58818 - LOCATION
    )
    :vars
    (
      ?auto_58826 - OBJ
      ?auto_58824 - LOCATION
      ?auto_58820 - CITY
      ?auto_58823 - OBJ
      ?auto_58821 - OBJ
      ?auto_58825 - LOCATION
      ?auto_58822 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58819 ?auto_58826 ) ) ( IN-CITY ?auto_58824 ?auto_58820 ) ( IN-CITY ?auto_58818 ?auto_58820 ) ( not ( = ?auto_58818 ?auto_58824 ) ) ( OBJ-AT ?auto_58819 ?auto_58824 ) ( not ( = ?auto_58823 ?auto_58826 ) ) ( not ( = ?auto_58819 ?auto_58823 ) ) ( OBJ-AT ?auto_58823 ?auto_58824 ) ( not ( = ?auto_58821 ?auto_58826 ) ) ( not ( = ?auto_58819 ?auto_58821 ) ) ( not ( = ?auto_58823 ?auto_58821 ) ) ( IN-CITY ?auto_58825 ?auto_58820 ) ( not ( = ?auto_58818 ?auto_58825 ) ) ( not ( = ?auto_58824 ?auto_58825 ) ) ( OBJ-AT ?auto_58821 ?auto_58825 ) ( OBJ-AT ?auto_58826 ?auto_58824 ) ( TRUCK-AT ?auto_58822 ?auto_58818 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_58822 ?auto_58818 ?auto_58824 ?auto_58820 )
      ( DELIVER-2PKG ?auto_58826 ?auto_58819 ?auto_58818 )
      ( DELIVER-1PKG-VERIFY ?auto_58819 ?auto_58818 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_58828 - OBJ
      ?auto_58829 - OBJ
      ?auto_58827 - LOCATION
    )
    :vars
    (
      ?auto_58834 - LOCATION
      ?auto_58831 - CITY
      ?auto_58835 - OBJ
      ?auto_58832 - OBJ
      ?auto_58833 - LOCATION
      ?auto_58830 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58829 ?auto_58828 ) ) ( IN-CITY ?auto_58834 ?auto_58831 ) ( IN-CITY ?auto_58827 ?auto_58831 ) ( not ( = ?auto_58827 ?auto_58834 ) ) ( OBJ-AT ?auto_58829 ?auto_58834 ) ( not ( = ?auto_58835 ?auto_58828 ) ) ( not ( = ?auto_58829 ?auto_58835 ) ) ( OBJ-AT ?auto_58835 ?auto_58834 ) ( not ( = ?auto_58832 ?auto_58828 ) ) ( not ( = ?auto_58829 ?auto_58832 ) ) ( not ( = ?auto_58835 ?auto_58832 ) ) ( IN-CITY ?auto_58833 ?auto_58831 ) ( not ( = ?auto_58827 ?auto_58833 ) ) ( not ( = ?auto_58834 ?auto_58833 ) ) ( OBJ-AT ?auto_58832 ?auto_58833 ) ( OBJ-AT ?auto_58828 ?auto_58834 ) ( TRUCK-AT ?auto_58830 ?auto_58827 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_58829 ?auto_58827 )
      ( DELIVER-2PKG-VERIFY ?auto_58828 ?auto_58829 ?auto_58827 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_58837 - OBJ
      ?auto_58838 - OBJ
      ?auto_58836 - LOCATION
    )
    :vars
    (
      ?auto_58844 - OBJ
      ?auto_58842 - LOCATION
      ?auto_58840 - CITY
      ?auto_58841 - OBJ
      ?auto_58839 - LOCATION
      ?auto_58843 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58838 ?auto_58837 ) ) ( not ( = ?auto_58838 ?auto_58844 ) ) ( IN-CITY ?auto_58842 ?auto_58840 ) ( IN-CITY ?auto_58836 ?auto_58840 ) ( not ( = ?auto_58836 ?auto_58842 ) ) ( OBJ-AT ?auto_58838 ?auto_58842 ) ( not ( = ?auto_58841 ?auto_58844 ) ) ( not ( = ?auto_58838 ?auto_58841 ) ) ( OBJ-AT ?auto_58841 ?auto_58842 ) ( not ( = ?auto_58837 ?auto_58844 ) ) ( not ( = ?auto_58841 ?auto_58837 ) ) ( IN-CITY ?auto_58839 ?auto_58840 ) ( not ( = ?auto_58836 ?auto_58839 ) ) ( not ( = ?auto_58842 ?auto_58839 ) ) ( OBJ-AT ?auto_58837 ?auto_58839 ) ( OBJ-AT ?auto_58844 ?auto_58842 ) ( TRUCK-AT ?auto_58843 ?auto_58836 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58844 ?auto_58838 ?auto_58836 )
      ( DELIVER-2PKG-VERIFY ?auto_58837 ?auto_58838 ?auto_58836 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_58846 - OBJ
      ?auto_58847 - OBJ
      ?auto_58845 - LOCATION
    )
    :vars
    (
      ?auto_58853 - OBJ
      ?auto_58850 - LOCATION
      ?auto_58849 - CITY
      ?auto_58851 - OBJ
      ?auto_58848 - LOCATION
      ?auto_58852 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58847 ?auto_58846 ) ) ( not ( = ?auto_58847 ?auto_58853 ) ) ( IN-CITY ?auto_58850 ?auto_58849 ) ( IN-CITY ?auto_58845 ?auto_58849 ) ( not ( = ?auto_58845 ?auto_58850 ) ) ( OBJ-AT ?auto_58847 ?auto_58850 ) ( not ( = ?auto_58846 ?auto_58853 ) ) ( OBJ-AT ?auto_58846 ?auto_58850 ) ( not ( = ?auto_58851 ?auto_58853 ) ) ( not ( = ?auto_58847 ?auto_58851 ) ) ( not ( = ?auto_58846 ?auto_58851 ) ) ( IN-CITY ?auto_58848 ?auto_58849 ) ( not ( = ?auto_58845 ?auto_58848 ) ) ( not ( = ?auto_58850 ?auto_58848 ) ) ( OBJ-AT ?auto_58851 ?auto_58848 ) ( OBJ-AT ?auto_58853 ?auto_58850 ) ( TRUCK-AT ?auto_58852 ?auto_58845 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58853 ?auto_58847 ?auto_58845 )
      ( DELIVER-2PKG-VERIFY ?auto_58846 ?auto_58847 ?auto_58845 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_58855 - OBJ
      ?auto_58856 - OBJ
      ?auto_58854 - LOCATION
    )
    :vars
    (
      ?auto_58860 - LOCATION
      ?auto_58858 - CITY
      ?auto_58859 - OBJ
      ?auto_58861 - OBJ
      ?auto_58857 - LOCATION
      ?auto_58862 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58856 ?auto_58855 ) ) ( IN-CITY ?auto_58860 ?auto_58858 ) ( IN-CITY ?auto_58854 ?auto_58858 ) ( not ( = ?auto_58854 ?auto_58860 ) ) ( OBJ-AT ?auto_58855 ?auto_58860 ) ( not ( = ?auto_58859 ?auto_58856 ) ) ( not ( = ?auto_58855 ?auto_58859 ) ) ( OBJ-AT ?auto_58859 ?auto_58860 ) ( not ( = ?auto_58861 ?auto_58856 ) ) ( not ( = ?auto_58855 ?auto_58861 ) ) ( not ( = ?auto_58859 ?auto_58861 ) ) ( IN-CITY ?auto_58857 ?auto_58858 ) ( not ( = ?auto_58854 ?auto_58857 ) ) ( not ( = ?auto_58860 ?auto_58857 ) ) ( OBJ-AT ?auto_58861 ?auto_58857 ) ( OBJ-AT ?auto_58856 ?auto_58860 ) ( TRUCK-AT ?auto_58862 ?auto_58854 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58856 ?auto_58855 ?auto_58854 )
      ( DELIVER-2PKG-VERIFY ?auto_58855 ?auto_58856 ?auto_58854 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_58864 - OBJ
      ?auto_58865 - OBJ
      ?auto_58863 - LOCATION
    )
    :vars
    (
      ?auto_58871 - OBJ
      ?auto_58869 - LOCATION
      ?auto_58867 - CITY
      ?auto_58868 - OBJ
      ?auto_58866 - LOCATION
      ?auto_58870 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58865 ?auto_58864 ) ) ( not ( = ?auto_58864 ?auto_58871 ) ) ( IN-CITY ?auto_58869 ?auto_58867 ) ( IN-CITY ?auto_58863 ?auto_58867 ) ( not ( = ?auto_58863 ?auto_58869 ) ) ( OBJ-AT ?auto_58864 ?auto_58869 ) ( not ( = ?auto_58868 ?auto_58871 ) ) ( not ( = ?auto_58864 ?auto_58868 ) ) ( OBJ-AT ?auto_58868 ?auto_58869 ) ( not ( = ?auto_58865 ?auto_58871 ) ) ( not ( = ?auto_58868 ?auto_58865 ) ) ( IN-CITY ?auto_58866 ?auto_58867 ) ( not ( = ?auto_58863 ?auto_58866 ) ) ( not ( = ?auto_58869 ?auto_58866 ) ) ( OBJ-AT ?auto_58865 ?auto_58866 ) ( OBJ-AT ?auto_58871 ?auto_58869 ) ( TRUCK-AT ?auto_58870 ?auto_58863 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58871 ?auto_58864 ?auto_58863 )
      ( DELIVER-2PKG-VERIFY ?auto_58864 ?auto_58865 ?auto_58863 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_58873 - OBJ
      ?auto_58874 - OBJ
      ?auto_58872 - LOCATION
    )
    :vars
    (
      ?auto_58880 - OBJ
      ?auto_58877 - LOCATION
      ?auto_58876 - CITY
      ?auto_58878 - OBJ
      ?auto_58875 - LOCATION
      ?auto_58879 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58874 ?auto_58873 ) ) ( not ( = ?auto_58873 ?auto_58880 ) ) ( IN-CITY ?auto_58877 ?auto_58876 ) ( IN-CITY ?auto_58872 ?auto_58876 ) ( not ( = ?auto_58872 ?auto_58877 ) ) ( OBJ-AT ?auto_58873 ?auto_58877 ) ( not ( = ?auto_58874 ?auto_58880 ) ) ( OBJ-AT ?auto_58874 ?auto_58877 ) ( not ( = ?auto_58878 ?auto_58880 ) ) ( not ( = ?auto_58873 ?auto_58878 ) ) ( not ( = ?auto_58874 ?auto_58878 ) ) ( IN-CITY ?auto_58875 ?auto_58876 ) ( not ( = ?auto_58872 ?auto_58875 ) ) ( not ( = ?auto_58877 ?auto_58875 ) ) ( OBJ-AT ?auto_58878 ?auto_58875 ) ( OBJ-AT ?auto_58880 ?auto_58877 ) ( TRUCK-AT ?auto_58879 ?auto_58872 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58880 ?auto_58873 ?auto_58872 )
      ( DELIVER-2PKG-VERIFY ?auto_58873 ?auto_58874 ?auto_58872 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58902 - OBJ
      ?auto_58903 - OBJ
      ?auto_58904 - OBJ
      ?auto_58901 - LOCATION
    )
    :vars
    (
      ?auto_58908 - LOCATION
      ?auto_58906 - CITY
      ?auto_58907 - OBJ
      ?auto_58905 - LOCATION
      ?auto_58909 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58903 ?auto_58902 ) ) ( not ( = ?auto_58904 ?auto_58902 ) ) ( not ( = ?auto_58904 ?auto_58903 ) ) ( IN-CITY ?auto_58908 ?auto_58906 ) ( IN-CITY ?auto_58901 ?auto_58906 ) ( not ( = ?auto_58901 ?auto_58908 ) ) ( OBJ-AT ?auto_58904 ?auto_58908 ) ( not ( = ?auto_58907 ?auto_58902 ) ) ( not ( = ?auto_58904 ?auto_58907 ) ) ( OBJ-AT ?auto_58907 ?auto_58908 ) ( not ( = ?auto_58907 ?auto_58903 ) ) ( IN-CITY ?auto_58905 ?auto_58906 ) ( not ( = ?auto_58901 ?auto_58905 ) ) ( not ( = ?auto_58908 ?auto_58905 ) ) ( OBJ-AT ?auto_58903 ?auto_58905 ) ( OBJ-AT ?auto_58902 ?auto_58908 ) ( TRUCK-AT ?auto_58909 ?auto_58901 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58902 ?auto_58904 ?auto_58901 )
      ( DELIVER-3PKG-VERIFY ?auto_58902 ?auto_58903 ?auto_58904 ?auto_58901 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58911 - OBJ
      ?auto_58912 - OBJ
      ?auto_58913 - OBJ
      ?auto_58910 - LOCATION
    )
    :vars
    (
      ?auto_58916 - LOCATION
      ?auto_58915 - CITY
      ?auto_58917 - OBJ
      ?auto_58914 - LOCATION
      ?auto_58918 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58912 ?auto_58911 ) ) ( not ( = ?auto_58913 ?auto_58911 ) ) ( not ( = ?auto_58913 ?auto_58912 ) ) ( IN-CITY ?auto_58916 ?auto_58915 ) ( IN-CITY ?auto_58910 ?auto_58915 ) ( not ( = ?auto_58910 ?auto_58916 ) ) ( OBJ-AT ?auto_58913 ?auto_58916 ) ( OBJ-AT ?auto_58912 ?auto_58916 ) ( not ( = ?auto_58917 ?auto_58911 ) ) ( not ( = ?auto_58913 ?auto_58917 ) ) ( not ( = ?auto_58912 ?auto_58917 ) ) ( IN-CITY ?auto_58914 ?auto_58915 ) ( not ( = ?auto_58910 ?auto_58914 ) ) ( not ( = ?auto_58916 ?auto_58914 ) ) ( OBJ-AT ?auto_58917 ?auto_58914 ) ( OBJ-AT ?auto_58911 ?auto_58916 ) ( TRUCK-AT ?auto_58918 ?auto_58910 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58911 ?auto_58913 ?auto_58910 )
      ( DELIVER-3PKG-VERIFY ?auto_58911 ?auto_58912 ?auto_58913 ?auto_58910 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58930 - OBJ
      ?auto_58931 - OBJ
      ?auto_58932 - OBJ
      ?auto_58929 - LOCATION
    )
    :vars
    (
      ?auto_58936 - LOCATION
      ?auto_58934 - CITY
      ?auto_58935 - OBJ
      ?auto_58933 - LOCATION
      ?auto_58937 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58931 ?auto_58930 ) ) ( not ( = ?auto_58932 ?auto_58930 ) ) ( not ( = ?auto_58932 ?auto_58931 ) ) ( IN-CITY ?auto_58936 ?auto_58934 ) ( IN-CITY ?auto_58929 ?auto_58934 ) ( not ( = ?auto_58929 ?auto_58936 ) ) ( OBJ-AT ?auto_58931 ?auto_58936 ) ( not ( = ?auto_58935 ?auto_58930 ) ) ( not ( = ?auto_58931 ?auto_58935 ) ) ( OBJ-AT ?auto_58935 ?auto_58936 ) ( not ( = ?auto_58935 ?auto_58932 ) ) ( IN-CITY ?auto_58933 ?auto_58934 ) ( not ( = ?auto_58929 ?auto_58933 ) ) ( not ( = ?auto_58936 ?auto_58933 ) ) ( OBJ-AT ?auto_58932 ?auto_58933 ) ( OBJ-AT ?auto_58930 ?auto_58936 ) ( TRUCK-AT ?auto_58937 ?auto_58929 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58930 ?auto_58931 ?auto_58929 )
      ( DELIVER-3PKG-VERIFY ?auto_58930 ?auto_58931 ?auto_58932 ?auto_58929 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58939 - OBJ
      ?auto_58940 - OBJ
      ?auto_58941 - OBJ
      ?auto_58938 - LOCATION
    )
    :vars
    (
      ?auto_58944 - LOCATION
      ?auto_58943 - CITY
      ?auto_58945 - OBJ
      ?auto_58942 - LOCATION
      ?auto_58946 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58940 ?auto_58939 ) ) ( not ( = ?auto_58941 ?auto_58939 ) ) ( not ( = ?auto_58941 ?auto_58940 ) ) ( IN-CITY ?auto_58944 ?auto_58943 ) ( IN-CITY ?auto_58938 ?auto_58943 ) ( not ( = ?auto_58938 ?auto_58944 ) ) ( OBJ-AT ?auto_58940 ?auto_58944 ) ( OBJ-AT ?auto_58941 ?auto_58944 ) ( not ( = ?auto_58945 ?auto_58939 ) ) ( not ( = ?auto_58940 ?auto_58945 ) ) ( not ( = ?auto_58941 ?auto_58945 ) ) ( IN-CITY ?auto_58942 ?auto_58943 ) ( not ( = ?auto_58938 ?auto_58942 ) ) ( not ( = ?auto_58944 ?auto_58942 ) ) ( OBJ-AT ?auto_58945 ?auto_58942 ) ( OBJ-AT ?auto_58939 ?auto_58944 ) ( TRUCK-AT ?auto_58946 ?auto_58938 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58939 ?auto_58940 ?auto_58938 )
      ( DELIVER-3PKG-VERIFY ?auto_58939 ?auto_58940 ?auto_58941 ?auto_58938 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58958 - OBJ
      ?auto_58959 - OBJ
      ?auto_58960 - OBJ
      ?auto_58957 - LOCATION
    )
    :vars
    (
      ?auto_58964 - LOCATION
      ?auto_58962 - CITY
      ?auto_58963 - OBJ
      ?auto_58961 - LOCATION
      ?auto_58965 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58959 ?auto_58958 ) ) ( not ( = ?auto_58960 ?auto_58958 ) ) ( not ( = ?auto_58960 ?auto_58959 ) ) ( IN-CITY ?auto_58964 ?auto_58962 ) ( IN-CITY ?auto_58957 ?auto_58962 ) ( not ( = ?auto_58957 ?auto_58964 ) ) ( OBJ-AT ?auto_58960 ?auto_58964 ) ( not ( = ?auto_58963 ?auto_58959 ) ) ( not ( = ?auto_58960 ?auto_58963 ) ) ( OBJ-AT ?auto_58963 ?auto_58964 ) ( not ( = ?auto_58963 ?auto_58958 ) ) ( IN-CITY ?auto_58961 ?auto_58962 ) ( not ( = ?auto_58957 ?auto_58961 ) ) ( not ( = ?auto_58964 ?auto_58961 ) ) ( OBJ-AT ?auto_58958 ?auto_58961 ) ( OBJ-AT ?auto_58959 ?auto_58964 ) ( TRUCK-AT ?auto_58965 ?auto_58957 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58959 ?auto_58960 ?auto_58957 )
      ( DELIVER-3PKG-VERIFY ?auto_58958 ?auto_58959 ?auto_58960 ?auto_58957 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58977 - OBJ
      ?auto_58978 - OBJ
      ?auto_58979 - OBJ
      ?auto_58976 - LOCATION
    )
    :vars
    (
      ?auto_58984 - OBJ
      ?auto_58982 - LOCATION
      ?auto_58981 - CITY
      ?auto_58980 - LOCATION
      ?auto_58983 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58978 ?auto_58977 ) ) ( not ( = ?auto_58979 ?auto_58977 ) ) ( not ( = ?auto_58979 ?auto_58978 ) ) ( not ( = ?auto_58979 ?auto_58984 ) ) ( IN-CITY ?auto_58982 ?auto_58981 ) ( IN-CITY ?auto_58976 ?auto_58981 ) ( not ( = ?auto_58976 ?auto_58982 ) ) ( OBJ-AT ?auto_58979 ?auto_58982 ) ( not ( = ?auto_58978 ?auto_58984 ) ) ( OBJ-AT ?auto_58978 ?auto_58982 ) ( not ( = ?auto_58977 ?auto_58984 ) ) ( IN-CITY ?auto_58980 ?auto_58981 ) ( not ( = ?auto_58976 ?auto_58980 ) ) ( not ( = ?auto_58982 ?auto_58980 ) ) ( OBJ-AT ?auto_58977 ?auto_58980 ) ( OBJ-AT ?auto_58984 ?auto_58982 ) ( TRUCK-AT ?auto_58983 ?auto_58976 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58984 ?auto_58979 ?auto_58976 )
      ( DELIVER-3PKG-VERIFY ?auto_58977 ?auto_58978 ?auto_58979 ?auto_58976 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58986 - OBJ
      ?auto_58987 - OBJ
      ?auto_58988 - OBJ
      ?auto_58985 - LOCATION
    )
    :vars
    (
      ?auto_58992 - LOCATION
      ?auto_58990 - CITY
      ?auto_58991 - OBJ
      ?auto_58989 - LOCATION
      ?auto_58993 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_58987 ?auto_58986 ) ) ( not ( = ?auto_58988 ?auto_58986 ) ) ( not ( = ?auto_58988 ?auto_58987 ) ) ( IN-CITY ?auto_58992 ?auto_58990 ) ( IN-CITY ?auto_58985 ?auto_58990 ) ( not ( = ?auto_58985 ?auto_58992 ) ) ( OBJ-AT ?auto_58987 ?auto_58992 ) ( not ( = ?auto_58991 ?auto_58988 ) ) ( not ( = ?auto_58987 ?auto_58991 ) ) ( OBJ-AT ?auto_58991 ?auto_58992 ) ( not ( = ?auto_58991 ?auto_58986 ) ) ( IN-CITY ?auto_58989 ?auto_58990 ) ( not ( = ?auto_58985 ?auto_58989 ) ) ( not ( = ?auto_58992 ?auto_58989 ) ) ( OBJ-AT ?auto_58986 ?auto_58989 ) ( OBJ-AT ?auto_58988 ?auto_58992 ) ( TRUCK-AT ?auto_58993 ?auto_58985 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58988 ?auto_58987 ?auto_58985 )
      ( DELIVER-3PKG-VERIFY ?auto_58986 ?auto_58987 ?auto_58988 ?auto_58985 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59005 - OBJ
      ?auto_59006 - OBJ
      ?auto_59007 - OBJ
      ?auto_59004 - LOCATION
    )
    :vars
    (
      ?auto_59012 - OBJ
      ?auto_59010 - LOCATION
      ?auto_59009 - CITY
      ?auto_59008 - LOCATION
      ?auto_59011 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59006 ?auto_59005 ) ) ( not ( = ?auto_59007 ?auto_59005 ) ) ( not ( = ?auto_59007 ?auto_59006 ) ) ( not ( = ?auto_59006 ?auto_59012 ) ) ( IN-CITY ?auto_59010 ?auto_59009 ) ( IN-CITY ?auto_59004 ?auto_59009 ) ( not ( = ?auto_59004 ?auto_59010 ) ) ( OBJ-AT ?auto_59006 ?auto_59010 ) ( not ( = ?auto_59007 ?auto_59012 ) ) ( OBJ-AT ?auto_59007 ?auto_59010 ) ( not ( = ?auto_59005 ?auto_59012 ) ) ( IN-CITY ?auto_59008 ?auto_59009 ) ( not ( = ?auto_59004 ?auto_59008 ) ) ( not ( = ?auto_59010 ?auto_59008 ) ) ( OBJ-AT ?auto_59005 ?auto_59008 ) ( OBJ-AT ?auto_59012 ?auto_59010 ) ( TRUCK-AT ?auto_59011 ?auto_59004 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59012 ?auto_59006 ?auto_59004 )
      ( DELIVER-3PKG-VERIFY ?auto_59005 ?auto_59006 ?auto_59007 ?auto_59004 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59024 - OBJ
      ?auto_59025 - OBJ
      ?auto_59026 - OBJ
      ?auto_59023 - LOCATION
    )
    :vars
    (
      ?auto_59029 - LOCATION
      ?auto_59028 - CITY
      ?auto_59030 - OBJ
      ?auto_59027 - LOCATION
      ?auto_59031 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59025 ?auto_59024 ) ) ( not ( = ?auto_59026 ?auto_59024 ) ) ( not ( = ?auto_59026 ?auto_59025 ) ) ( IN-CITY ?auto_59029 ?auto_59028 ) ( IN-CITY ?auto_59023 ?auto_59028 ) ( not ( = ?auto_59023 ?auto_59029 ) ) ( OBJ-AT ?auto_59026 ?auto_59029 ) ( OBJ-AT ?auto_59024 ?auto_59029 ) ( not ( = ?auto_59030 ?auto_59025 ) ) ( not ( = ?auto_59026 ?auto_59030 ) ) ( not ( = ?auto_59024 ?auto_59030 ) ) ( IN-CITY ?auto_59027 ?auto_59028 ) ( not ( = ?auto_59023 ?auto_59027 ) ) ( not ( = ?auto_59029 ?auto_59027 ) ) ( OBJ-AT ?auto_59030 ?auto_59027 ) ( OBJ-AT ?auto_59025 ?auto_59029 ) ( TRUCK-AT ?auto_59031 ?auto_59023 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59025 ?auto_59026 ?auto_59023 )
      ( DELIVER-3PKG-VERIFY ?auto_59024 ?auto_59025 ?auto_59026 ?auto_59023 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59033 - OBJ
      ?auto_59034 - OBJ
      ?auto_59035 - OBJ
      ?auto_59032 - LOCATION
    )
    :vars
    (
      ?auto_59040 - OBJ
      ?auto_59038 - LOCATION
      ?auto_59037 - CITY
      ?auto_59036 - LOCATION
      ?auto_59039 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59034 ?auto_59033 ) ) ( not ( = ?auto_59035 ?auto_59033 ) ) ( not ( = ?auto_59035 ?auto_59034 ) ) ( not ( = ?auto_59035 ?auto_59040 ) ) ( IN-CITY ?auto_59038 ?auto_59037 ) ( IN-CITY ?auto_59032 ?auto_59037 ) ( not ( = ?auto_59032 ?auto_59038 ) ) ( OBJ-AT ?auto_59035 ?auto_59038 ) ( not ( = ?auto_59033 ?auto_59040 ) ) ( OBJ-AT ?auto_59033 ?auto_59038 ) ( not ( = ?auto_59034 ?auto_59040 ) ) ( IN-CITY ?auto_59036 ?auto_59037 ) ( not ( = ?auto_59032 ?auto_59036 ) ) ( not ( = ?auto_59038 ?auto_59036 ) ) ( OBJ-AT ?auto_59034 ?auto_59036 ) ( OBJ-AT ?auto_59040 ?auto_59038 ) ( TRUCK-AT ?auto_59039 ?auto_59032 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59040 ?auto_59035 ?auto_59032 )
      ( DELIVER-3PKG-VERIFY ?auto_59033 ?auto_59034 ?auto_59035 ?auto_59032 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59052 - OBJ
      ?auto_59053 - OBJ
      ?auto_59054 - OBJ
      ?auto_59051 - LOCATION
    )
    :vars
    (
      ?auto_59057 - LOCATION
      ?auto_59056 - CITY
      ?auto_59058 - OBJ
      ?auto_59055 - LOCATION
      ?auto_59059 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59053 ?auto_59052 ) ) ( not ( = ?auto_59054 ?auto_59052 ) ) ( not ( = ?auto_59054 ?auto_59053 ) ) ( IN-CITY ?auto_59057 ?auto_59056 ) ( IN-CITY ?auto_59051 ?auto_59056 ) ( not ( = ?auto_59051 ?auto_59057 ) ) ( OBJ-AT ?auto_59053 ?auto_59057 ) ( OBJ-AT ?auto_59052 ?auto_59057 ) ( not ( = ?auto_59058 ?auto_59054 ) ) ( not ( = ?auto_59053 ?auto_59058 ) ) ( not ( = ?auto_59052 ?auto_59058 ) ) ( IN-CITY ?auto_59055 ?auto_59056 ) ( not ( = ?auto_59051 ?auto_59055 ) ) ( not ( = ?auto_59057 ?auto_59055 ) ) ( OBJ-AT ?auto_59058 ?auto_59055 ) ( OBJ-AT ?auto_59054 ?auto_59057 ) ( TRUCK-AT ?auto_59059 ?auto_59051 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59054 ?auto_59053 ?auto_59051 )
      ( DELIVER-3PKG-VERIFY ?auto_59052 ?auto_59053 ?auto_59054 ?auto_59051 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59061 - OBJ
      ?auto_59062 - OBJ
      ?auto_59063 - OBJ
      ?auto_59060 - LOCATION
    )
    :vars
    (
      ?auto_59068 - OBJ
      ?auto_59066 - LOCATION
      ?auto_59065 - CITY
      ?auto_59064 - LOCATION
      ?auto_59067 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59062 ?auto_59061 ) ) ( not ( = ?auto_59063 ?auto_59061 ) ) ( not ( = ?auto_59063 ?auto_59062 ) ) ( not ( = ?auto_59062 ?auto_59068 ) ) ( IN-CITY ?auto_59066 ?auto_59065 ) ( IN-CITY ?auto_59060 ?auto_59065 ) ( not ( = ?auto_59060 ?auto_59066 ) ) ( OBJ-AT ?auto_59062 ?auto_59066 ) ( not ( = ?auto_59061 ?auto_59068 ) ) ( OBJ-AT ?auto_59061 ?auto_59066 ) ( not ( = ?auto_59063 ?auto_59068 ) ) ( IN-CITY ?auto_59064 ?auto_59065 ) ( not ( = ?auto_59060 ?auto_59064 ) ) ( not ( = ?auto_59066 ?auto_59064 ) ) ( OBJ-AT ?auto_59063 ?auto_59064 ) ( OBJ-AT ?auto_59068 ?auto_59066 ) ( TRUCK-AT ?auto_59067 ?auto_59060 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59068 ?auto_59062 ?auto_59060 )
      ( DELIVER-3PKG-VERIFY ?auto_59061 ?auto_59062 ?auto_59063 ?auto_59060 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59100 - OBJ
      ?auto_59101 - OBJ
      ?auto_59102 - OBJ
      ?auto_59099 - LOCATION
    )
    :vars
    (
      ?auto_59106 - LOCATION
      ?auto_59104 - CITY
      ?auto_59105 - OBJ
      ?auto_59103 - LOCATION
      ?auto_59107 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59101 ?auto_59100 ) ) ( not ( = ?auto_59102 ?auto_59100 ) ) ( not ( = ?auto_59102 ?auto_59101 ) ) ( IN-CITY ?auto_59106 ?auto_59104 ) ( IN-CITY ?auto_59099 ?auto_59104 ) ( not ( = ?auto_59099 ?auto_59106 ) ) ( OBJ-AT ?auto_59100 ?auto_59106 ) ( not ( = ?auto_59105 ?auto_59101 ) ) ( not ( = ?auto_59100 ?auto_59105 ) ) ( OBJ-AT ?auto_59105 ?auto_59106 ) ( not ( = ?auto_59105 ?auto_59102 ) ) ( IN-CITY ?auto_59103 ?auto_59104 ) ( not ( = ?auto_59099 ?auto_59103 ) ) ( not ( = ?auto_59106 ?auto_59103 ) ) ( OBJ-AT ?auto_59102 ?auto_59103 ) ( OBJ-AT ?auto_59101 ?auto_59106 ) ( TRUCK-AT ?auto_59107 ?auto_59099 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59101 ?auto_59100 ?auto_59099 )
      ( DELIVER-3PKG-VERIFY ?auto_59100 ?auto_59101 ?auto_59102 ?auto_59099 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59109 - OBJ
      ?auto_59110 - OBJ
      ?auto_59111 - OBJ
      ?auto_59108 - LOCATION
    )
    :vars
    (
      ?auto_59114 - LOCATION
      ?auto_59113 - CITY
      ?auto_59115 - OBJ
      ?auto_59112 - LOCATION
      ?auto_59116 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59110 ?auto_59109 ) ) ( not ( = ?auto_59111 ?auto_59109 ) ) ( not ( = ?auto_59111 ?auto_59110 ) ) ( IN-CITY ?auto_59114 ?auto_59113 ) ( IN-CITY ?auto_59108 ?auto_59113 ) ( not ( = ?auto_59108 ?auto_59114 ) ) ( OBJ-AT ?auto_59109 ?auto_59114 ) ( OBJ-AT ?auto_59111 ?auto_59114 ) ( not ( = ?auto_59115 ?auto_59110 ) ) ( not ( = ?auto_59109 ?auto_59115 ) ) ( not ( = ?auto_59111 ?auto_59115 ) ) ( IN-CITY ?auto_59112 ?auto_59113 ) ( not ( = ?auto_59108 ?auto_59112 ) ) ( not ( = ?auto_59114 ?auto_59112 ) ) ( OBJ-AT ?auto_59115 ?auto_59112 ) ( OBJ-AT ?auto_59110 ?auto_59114 ) ( TRUCK-AT ?auto_59116 ?auto_59108 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59110 ?auto_59109 ?auto_59108 )
      ( DELIVER-3PKG-VERIFY ?auto_59109 ?auto_59110 ?auto_59111 ?auto_59108 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59128 - OBJ
      ?auto_59129 - OBJ
      ?auto_59130 - OBJ
      ?auto_59127 - LOCATION
    )
    :vars
    (
      ?auto_59134 - LOCATION
      ?auto_59132 - CITY
      ?auto_59133 - OBJ
      ?auto_59131 - LOCATION
      ?auto_59135 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59129 ?auto_59128 ) ) ( not ( = ?auto_59130 ?auto_59128 ) ) ( not ( = ?auto_59130 ?auto_59129 ) ) ( IN-CITY ?auto_59134 ?auto_59132 ) ( IN-CITY ?auto_59127 ?auto_59132 ) ( not ( = ?auto_59127 ?auto_59134 ) ) ( OBJ-AT ?auto_59128 ?auto_59134 ) ( not ( = ?auto_59133 ?auto_59130 ) ) ( not ( = ?auto_59128 ?auto_59133 ) ) ( OBJ-AT ?auto_59133 ?auto_59134 ) ( not ( = ?auto_59133 ?auto_59129 ) ) ( IN-CITY ?auto_59131 ?auto_59132 ) ( not ( = ?auto_59127 ?auto_59131 ) ) ( not ( = ?auto_59134 ?auto_59131 ) ) ( OBJ-AT ?auto_59129 ?auto_59131 ) ( OBJ-AT ?auto_59130 ?auto_59134 ) ( TRUCK-AT ?auto_59135 ?auto_59127 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59130 ?auto_59128 ?auto_59127 )
      ( DELIVER-3PKG-VERIFY ?auto_59128 ?auto_59129 ?auto_59130 ?auto_59127 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59147 - OBJ
      ?auto_59148 - OBJ
      ?auto_59149 - OBJ
      ?auto_59146 - LOCATION
    )
    :vars
    (
      ?auto_59154 - OBJ
      ?auto_59152 - LOCATION
      ?auto_59151 - CITY
      ?auto_59150 - LOCATION
      ?auto_59153 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59148 ?auto_59147 ) ) ( not ( = ?auto_59149 ?auto_59147 ) ) ( not ( = ?auto_59149 ?auto_59148 ) ) ( not ( = ?auto_59147 ?auto_59154 ) ) ( IN-CITY ?auto_59152 ?auto_59151 ) ( IN-CITY ?auto_59146 ?auto_59151 ) ( not ( = ?auto_59146 ?auto_59152 ) ) ( OBJ-AT ?auto_59147 ?auto_59152 ) ( not ( = ?auto_59149 ?auto_59154 ) ) ( OBJ-AT ?auto_59149 ?auto_59152 ) ( not ( = ?auto_59148 ?auto_59154 ) ) ( IN-CITY ?auto_59150 ?auto_59151 ) ( not ( = ?auto_59146 ?auto_59150 ) ) ( not ( = ?auto_59152 ?auto_59150 ) ) ( OBJ-AT ?auto_59148 ?auto_59150 ) ( OBJ-AT ?auto_59154 ?auto_59152 ) ( TRUCK-AT ?auto_59153 ?auto_59146 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59154 ?auto_59147 ?auto_59146 )
      ( DELIVER-3PKG-VERIFY ?auto_59147 ?auto_59148 ?auto_59149 ?auto_59146 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59166 - OBJ
      ?auto_59167 - OBJ
      ?auto_59168 - OBJ
      ?auto_59165 - LOCATION
    )
    :vars
    (
      ?auto_59171 - LOCATION
      ?auto_59170 - CITY
      ?auto_59172 - OBJ
      ?auto_59169 - LOCATION
      ?auto_59173 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59167 ?auto_59166 ) ) ( not ( = ?auto_59168 ?auto_59166 ) ) ( not ( = ?auto_59168 ?auto_59167 ) ) ( IN-CITY ?auto_59171 ?auto_59170 ) ( IN-CITY ?auto_59165 ?auto_59170 ) ( not ( = ?auto_59165 ?auto_59171 ) ) ( OBJ-AT ?auto_59166 ?auto_59171 ) ( OBJ-AT ?auto_59167 ?auto_59171 ) ( not ( = ?auto_59172 ?auto_59168 ) ) ( not ( = ?auto_59166 ?auto_59172 ) ) ( not ( = ?auto_59167 ?auto_59172 ) ) ( IN-CITY ?auto_59169 ?auto_59170 ) ( not ( = ?auto_59165 ?auto_59169 ) ) ( not ( = ?auto_59171 ?auto_59169 ) ) ( OBJ-AT ?auto_59172 ?auto_59169 ) ( OBJ-AT ?auto_59168 ?auto_59171 ) ( TRUCK-AT ?auto_59173 ?auto_59165 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59168 ?auto_59166 ?auto_59165 )
      ( DELIVER-3PKG-VERIFY ?auto_59166 ?auto_59167 ?auto_59168 ?auto_59165 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59175 - OBJ
      ?auto_59176 - OBJ
      ?auto_59177 - OBJ
      ?auto_59174 - LOCATION
    )
    :vars
    (
      ?auto_59182 - OBJ
      ?auto_59180 - LOCATION
      ?auto_59179 - CITY
      ?auto_59178 - LOCATION
      ?auto_59181 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59176 ?auto_59175 ) ) ( not ( = ?auto_59177 ?auto_59175 ) ) ( not ( = ?auto_59177 ?auto_59176 ) ) ( not ( = ?auto_59175 ?auto_59182 ) ) ( IN-CITY ?auto_59180 ?auto_59179 ) ( IN-CITY ?auto_59174 ?auto_59179 ) ( not ( = ?auto_59174 ?auto_59180 ) ) ( OBJ-AT ?auto_59175 ?auto_59180 ) ( not ( = ?auto_59176 ?auto_59182 ) ) ( OBJ-AT ?auto_59176 ?auto_59180 ) ( not ( = ?auto_59177 ?auto_59182 ) ) ( IN-CITY ?auto_59178 ?auto_59179 ) ( not ( = ?auto_59174 ?auto_59178 ) ) ( not ( = ?auto_59180 ?auto_59178 ) ) ( OBJ-AT ?auto_59177 ?auto_59178 ) ( OBJ-AT ?auto_59182 ?auto_59180 ) ( TRUCK-AT ?auto_59181 ?auto_59174 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59182 ?auto_59175 ?auto_59174 )
      ( DELIVER-3PKG-VERIFY ?auto_59175 ?auto_59176 ?auto_59177 ?auto_59174 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59338 - OBJ
      ?auto_59339 - OBJ
      ?auto_59340 - OBJ
      ?auto_59341 - OBJ
      ?auto_59337 - LOCATION
    )
    :vars
    (
      ?auto_59344 - LOCATION
      ?auto_59343 - CITY
      ?auto_59342 - LOCATION
      ?auto_59345 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59339 ?auto_59338 ) ) ( not ( = ?auto_59340 ?auto_59338 ) ) ( not ( = ?auto_59340 ?auto_59339 ) ) ( not ( = ?auto_59341 ?auto_59338 ) ) ( not ( = ?auto_59341 ?auto_59339 ) ) ( not ( = ?auto_59341 ?auto_59340 ) ) ( IN-CITY ?auto_59344 ?auto_59343 ) ( IN-CITY ?auto_59337 ?auto_59343 ) ( not ( = ?auto_59337 ?auto_59344 ) ) ( OBJ-AT ?auto_59341 ?auto_59344 ) ( OBJ-AT ?auto_59340 ?auto_59344 ) ( IN-CITY ?auto_59342 ?auto_59343 ) ( not ( = ?auto_59337 ?auto_59342 ) ) ( not ( = ?auto_59344 ?auto_59342 ) ) ( OBJ-AT ?auto_59339 ?auto_59342 ) ( OBJ-AT ?auto_59338 ?auto_59344 ) ( TRUCK-AT ?auto_59345 ?auto_59337 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59338 ?auto_59341 ?auto_59337 )
      ( DELIVER-4PKG-VERIFY ?auto_59338 ?auto_59339 ?auto_59340 ?auto_59341 ?auto_59337 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59367 - OBJ
      ?auto_59368 - OBJ
      ?auto_59369 - OBJ
      ?auto_59370 - OBJ
      ?auto_59366 - LOCATION
    )
    :vars
    (
      ?auto_59373 - LOCATION
      ?auto_59372 - CITY
      ?auto_59371 - LOCATION
      ?auto_59374 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59368 ?auto_59367 ) ) ( not ( = ?auto_59369 ?auto_59367 ) ) ( not ( = ?auto_59369 ?auto_59368 ) ) ( not ( = ?auto_59370 ?auto_59367 ) ) ( not ( = ?auto_59370 ?auto_59368 ) ) ( not ( = ?auto_59370 ?auto_59369 ) ) ( IN-CITY ?auto_59373 ?auto_59372 ) ( IN-CITY ?auto_59366 ?auto_59372 ) ( not ( = ?auto_59366 ?auto_59373 ) ) ( OBJ-AT ?auto_59369 ?auto_59373 ) ( OBJ-AT ?auto_59370 ?auto_59373 ) ( IN-CITY ?auto_59371 ?auto_59372 ) ( not ( = ?auto_59366 ?auto_59371 ) ) ( not ( = ?auto_59373 ?auto_59371 ) ) ( OBJ-AT ?auto_59368 ?auto_59371 ) ( OBJ-AT ?auto_59367 ?auto_59373 ) ( TRUCK-AT ?auto_59374 ?auto_59366 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59367 ?auto_59369 ?auto_59366 )
      ( DELIVER-4PKG-VERIFY ?auto_59367 ?auto_59368 ?auto_59369 ?auto_59370 ?auto_59366 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59396 - OBJ
      ?auto_59397 - OBJ
      ?auto_59398 - OBJ
      ?auto_59399 - OBJ
      ?auto_59395 - LOCATION
    )
    :vars
    (
      ?auto_59402 - LOCATION
      ?auto_59401 - CITY
      ?auto_59400 - LOCATION
      ?auto_59403 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59397 ?auto_59396 ) ) ( not ( = ?auto_59398 ?auto_59396 ) ) ( not ( = ?auto_59398 ?auto_59397 ) ) ( not ( = ?auto_59399 ?auto_59396 ) ) ( not ( = ?auto_59399 ?auto_59397 ) ) ( not ( = ?auto_59399 ?auto_59398 ) ) ( IN-CITY ?auto_59402 ?auto_59401 ) ( IN-CITY ?auto_59395 ?auto_59401 ) ( not ( = ?auto_59395 ?auto_59402 ) ) ( OBJ-AT ?auto_59399 ?auto_59402 ) ( OBJ-AT ?auto_59397 ?auto_59402 ) ( IN-CITY ?auto_59400 ?auto_59401 ) ( not ( = ?auto_59395 ?auto_59400 ) ) ( not ( = ?auto_59402 ?auto_59400 ) ) ( OBJ-AT ?auto_59398 ?auto_59400 ) ( OBJ-AT ?auto_59396 ?auto_59402 ) ( TRUCK-AT ?auto_59403 ?auto_59395 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59396 ?auto_59399 ?auto_59395 )
      ( DELIVER-4PKG-VERIFY ?auto_59396 ?auto_59397 ?auto_59398 ?auto_59399 ?auto_59395 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59425 - OBJ
      ?auto_59426 - OBJ
      ?auto_59427 - OBJ
      ?auto_59428 - OBJ
      ?auto_59424 - LOCATION
    )
    :vars
    (
      ?auto_59431 - LOCATION
      ?auto_59430 - CITY
      ?auto_59429 - LOCATION
      ?auto_59432 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59426 ?auto_59425 ) ) ( not ( = ?auto_59427 ?auto_59425 ) ) ( not ( = ?auto_59427 ?auto_59426 ) ) ( not ( = ?auto_59428 ?auto_59425 ) ) ( not ( = ?auto_59428 ?auto_59426 ) ) ( not ( = ?auto_59428 ?auto_59427 ) ) ( IN-CITY ?auto_59431 ?auto_59430 ) ( IN-CITY ?auto_59424 ?auto_59430 ) ( not ( = ?auto_59424 ?auto_59431 ) ) ( OBJ-AT ?auto_59427 ?auto_59431 ) ( OBJ-AT ?auto_59426 ?auto_59431 ) ( IN-CITY ?auto_59429 ?auto_59430 ) ( not ( = ?auto_59424 ?auto_59429 ) ) ( not ( = ?auto_59431 ?auto_59429 ) ) ( OBJ-AT ?auto_59428 ?auto_59429 ) ( OBJ-AT ?auto_59425 ?auto_59431 ) ( TRUCK-AT ?auto_59432 ?auto_59424 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59425 ?auto_59427 ?auto_59424 )
      ( DELIVER-4PKG-VERIFY ?auto_59425 ?auto_59426 ?auto_59427 ?auto_59428 ?auto_59424 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59516 - OBJ
      ?auto_59517 - OBJ
      ?auto_59518 - OBJ
      ?auto_59519 - OBJ
      ?auto_59515 - LOCATION
    )
    :vars
    (
      ?auto_59522 - LOCATION
      ?auto_59521 - CITY
      ?auto_59520 - LOCATION
      ?auto_59523 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59517 ?auto_59516 ) ) ( not ( = ?auto_59518 ?auto_59516 ) ) ( not ( = ?auto_59518 ?auto_59517 ) ) ( not ( = ?auto_59519 ?auto_59516 ) ) ( not ( = ?auto_59519 ?auto_59517 ) ) ( not ( = ?auto_59519 ?auto_59518 ) ) ( IN-CITY ?auto_59522 ?auto_59521 ) ( IN-CITY ?auto_59515 ?auto_59521 ) ( not ( = ?auto_59515 ?auto_59522 ) ) ( OBJ-AT ?auto_59517 ?auto_59522 ) ( OBJ-AT ?auto_59519 ?auto_59522 ) ( IN-CITY ?auto_59520 ?auto_59521 ) ( not ( = ?auto_59515 ?auto_59520 ) ) ( not ( = ?auto_59522 ?auto_59520 ) ) ( OBJ-AT ?auto_59518 ?auto_59520 ) ( OBJ-AT ?auto_59516 ?auto_59522 ) ( TRUCK-AT ?auto_59523 ?auto_59515 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59516 ?auto_59517 ?auto_59515 )
      ( DELIVER-4PKG-VERIFY ?auto_59516 ?auto_59517 ?auto_59518 ?auto_59519 ?auto_59515 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59545 - OBJ
      ?auto_59546 - OBJ
      ?auto_59547 - OBJ
      ?auto_59548 - OBJ
      ?auto_59544 - LOCATION
    )
    :vars
    (
      ?auto_59551 - LOCATION
      ?auto_59550 - CITY
      ?auto_59549 - LOCATION
      ?auto_59552 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59546 ?auto_59545 ) ) ( not ( = ?auto_59547 ?auto_59545 ) ) ( not ( = ?auto_59547 ?auto_59546 ) ) ( not ( = ?auto_59548 ?auto_59545 ) ) ( not ( = ?auto_59548 ?auto_59546 ) ) ( not ( = ?auto_59548 ?auto_59547 ) ) ( IN-CITY ?auto_59551 ?auto_59550 ) ( IN-CITY ?auto_59544 ?auto_59550 ) ( not ( = ?auto_59544 ?auto_59551 ) ) ( OBJ-AT ?auto_59546 ?auto_59551 ) ( OBJ-AT ?auto_59547 ?auto_59551 ) ( IN-CITY ?auto_59549 ?auto_59550 ) ( not ( = ?auto_59544 ?auto_59549 ) ) ( not ( = ?auto_59551 ?auto_59549 ) ) ( OBJ-AT ?auto_59548 ?auto_59549 ) ( OBJ-AT ?auto_59545 ?auto_59551 ) ( TRUCK-AT ?auto_59552 ?auto_59544 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59545 ?auto_59546 ?auto_59544 )
      ( DELIVER-4PKG-VERIFY ?auto_59545 ?auto_59546 ?auto_59547 ?auto_59548 ?auto_59544 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59636 - OBJ
      ?auto_59637 - OBJ
      ?auto_59638 - OBJ
      ?auto_59639 - OBJ
      ?auto_59635 - LOCATION
    )
    :vars
    (
      ?auto_59642 - LOCATION
      ?auto_59641 - CITY
      ?auto_59640 - LOCATION
      ?auto_59643 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59637 ?auto_59636 ) ) ( not ( = ?auto_59638 ?auto_59636 ) ) ( not ( = ?auto_59638 ?auto_59637 ) ) ( not ( = ?auto_59639 ?auto_59636 ) ) ( not ( = ?auto_59639 ?auto_59637 ) ) ( not ( = ?auto_59639 ?auto_59638 ) ) ( IN-CITY ?auto_59642 ?auto_59641 ) ( IN-CITY ?auto_59635 ?auto_59641 ) ( not ( = ?auto_59635 ?auto_59642 ) ) ( OBJ-AT ?auto_59639 ?auto_59642 ) ( OBJ-AT ?auto_59638 ?auto_59642 ) ( IN-CITY ?auto_59640 ?auto_59641 ) ( not ( = ?auto_59635 ?auto_59640 ) ) ( not ( = ?auto_59642 ?auto_59640 ) ) ( OBJ-AT ?auto_59636 ?auto_59640 ) ( OBJ-AT ?auto_59637 ?auto_59642 ) ( TRUCK-AT ?auto_59643 ?auto_59635 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59637 ?auto_59639 ?auto_59635 )
      ( DELIVER-4PKG-VERIFY ?auto_59636 ?auto_59637 ?auto_59638 ?auto_59639 ?auto_59635 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59665 - OBJ
      ?auto_59666 - OBJ
      ?auto_59667 - OBJ
      ?auto_59668 - OBJ
      ?auto_59664 - LOCATION
    )
    :vars
    (
      ?auto_59671 - LOCATION
      ?auto_59670 - CITY
      ?auto_59669 - LOCATION
      ?auto_59672 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59666 ?auto_59665 ) ) ( not ( = ?auto_59667 ?auto_59665 ) ) ( not ( = ?auto_59667 ?auto_59666 ) ) ( not ( = ?auto_59668 ?auto_59665 ) ) ( not ( = ?auto_59668 ?auto_59666 ) ) ( not ( = ?auto_59668 ?auto_59667 ) ) ( IN-CITY ?auto_59671 ?auto_59670 ) ( IN-CITY ?auto_59664 ?auto_59670 ) ( not ( = ?auto_59664 ?auto_59671 ) ) ( OBJ-AT ?auto_59667 ?auto_59671 ) ( OBJ-AT ?auto_59668 ?auto_59671 ) ( IN-CITY ?auto_59669 ?auto_59670 ) ( not ( = ?auto_59664 ?auto_59669 ) ) ( not ( = ?auto_59671 ?auto_59669 ) ) ( OBJ-AT ?auto_59665 ?auto_59669 ) ( OBJ-AT ?auto_59666 ?auto_59671 ) ( TRUCK-AT ?auto_59672 ?auto_59664 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59666 ?auto_59667 ?auto_59664 )
      ( DELIVER-4PKG-VERIFY ?auto_59665 ?auto_59666 ?auto_59667 ?auto_59668 ?auto_59664 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59757 - OBJ
      ?auto_59758 - OBJ
      ?auto_59759 - OBJ
      ?auto_59760 - OBJ
      ?auto_59756 - LOCATION
    )
    :vars
    (
      ?auto_59763 - LOCATION
      ?auto_59762 - CITY
      ?auto_59761 - LOCATION
      ?auto_59764 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59758 ?auto_59757 ) ) ( not ( = ?auto_59759 ?auto_59757 ) ) ( not ( = ?auto_59759 ?auto_59758 ) ) ( not ( = ?auto_59760 ?auto_59757 ) ) ( not ( = ?auto_59760 ?auto_59758 ) ) ( not ( = ?auto_59760 ?auto_59759 ) ) ( IN-CITY ?auto_59763 ?auto_59762 ) ( IN-CITY ?auto_59756 ?auto_59762 ) ( not ( = ?auto_59756 ?auto_59763 ) ) ( OBJ-AT ?auto_59760 ?auto_59763 ) ( OBJ-AT ?auto_59758 ?auto_59763 ) ( IN-CITY ?auto_59761 ?auto_59762 ) ( not ( = ?auto_59756 ?auto_59761 ) ) ( not ( = ?auto_59763 ?auto_59761 ) ) ( OBJ-AT ?auto_59757 ?auto_59761 ) ( OBJ-AT ?auto_59759 ?auto_59763 ) ( TRUCK-AT ?auto_59764 ?auto_59756 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59759 ?auto_59760 ?auto_59756 )
      ( DELIVER-4PKG-VERIFY ?auto_59757 ?auto_59758 ?auto_59759 ?auto_59760 ?auto_59756 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59786 - OBJ
      ?auto_59787 - OBJ
      ?auto_59788 - OBJ
      ?auto_59789 - OBJ
      ?auto_59785 - LOCATION
    )
    :vars
    (
      ?auto_59792 - LOCATION
      ?auto_59791 - CITY
      ?auto_59790 - LOCATION
      ?auto_59793 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59787 ?auto_59786 ) ) ( not ( = ?auto_59788 ?auto_59786 ) ) ( not ( = ?auto_59788 ?auto_59787 ) ) ( not ( = ?auto_59789 ?auto_59786 ) ) ( not ( = ?auto_59789 ?auto_59787 ) ) ( not ( = ?auto_59789 ?auto_59788 ) ) ( IN-CITY ?auto_59792 ?auto_59791 ) ( IN-CITY ?auto_59785 ?auto_59791 ) ( not ( = ?auto_59785 ?auto_59792 ) ) ( OBJ-AT ?auto_59788 ?auto_59792 ) ( OBJ-AT ?auto_59787 ?auto_59792 ) ( IN-CITY ?auto_59790 ?auto_59791 ) ( not ( = ?auto_59785 ?auto_59790 ) ) ( not ( = ?auto_59792 ?auto_59790 ) ) ( OBJ-AT ?auto_59786 ?auto_59790 ) ( OBJ-AT ?auto_59789 ?auto_59792 ) ( TRUCK-AT ?auto_59793 ?auto_59785 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59789 ?auto_59788 ?auto_59785 )
      ( DELIVER-4PKG-VERIFY ?auto_59786 ?auto_59787 ?auto_59788 ?auto_59789 ?auto_59785 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59845 - OBJ
      ?auto_59846 - OBJ
      ?auto_59847 - OBJ
      ?auto_59848 - OBJ
      ?auto_59844 - LOCATION
    )
    :vars
    (
      ?auto_59851 - LOCATION
      ?auto_59850 - CITY
      ?auto_59849 - LOCATION
      ?auto_59852 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59846 ?auto_59845 ) ) ( not ( = ?auto_59847 ?auto_59845 ) ) ( not ( = ?auto_59847 ?auto_59846 ) ) ( not ( = ?auto_59848 ?auto_59845 ) ) ( not ( = ?auto_59848 ?auto_59846 ) ) ( not ( = ?auto_59848 ?auto_59847 ) ) ( IN-CITY ?auto_59851 ?auto_59850 ) ( IN-CITY ?auto_59844 ?auto_59850 ) ( not ( = ?auto_59844 ?auto_59851 ) ) ( OBJ-AT ?auto_59846 ?auto_59851 ) ( OBJ-AT ?auto_59848 ?auto_59851 ) ( IN-CITY ?auto_59849 ?auto_59850 ) ( not ( = ?auto_59844 ?auto_59849 ) ) ( not ( = ?auto_59851 ?auto_59849 ) ) ( OBJ-AT ?auto_59845 ?auto_59849 ) ( OBJ-AT ?auto_59847 ?auto_59851 ) ( TRUCK-AT ?auto_59852 ?auto_59844 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59847 ?auto_59846 ?auto_59844 )
      ( DELIVER-4PKG-VERIFY ?auto_59845 ?auto_59846 ?auto_59847 ?auto_59848 ?auto_59844 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59906 - OBJ
      ?auto_59907 - OBJ
      ?auto_59908 - OBJ
      ?auto_59909 - OBJ
      ?auto_59905 - LOCATION
    )
    :vars
    (
      ?auto_59912 - LOCATION
      ?auto_59911 - CITY
      ?auto_59910 - LOCATION
      ?auto_59913 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59907 ?auto_59906 ) ) ( not ( = ?auto_59908 ?auto_59906 ) ) ( not ( = ?auto_59908 ?auto_59907 ) ) ( not ( = ?auto_59909 ?auto_59906 ) ) ( not ( = ?auto_59909 ?auto_59907 ) ) ( not ( = ?auto_59909 ?auto_59908 ) ) ( IN-CITY ?auto_59912 ?auto_59911 ) ( IN-CITY ?auto_59905 ?auto_59911 ) ( not ( = ?auto_59905 ?auto_59912 ) ) ( OBJ-AT ?auto_59907 ?auto_59912 ) ( OBJ-AT ?auto_59908 ?auto_59912 ) ( IN-CITY ?auto_59910 ?auto_59911 ) ( not ( = ?auto_59905 ?auto_59910 ) ) ( not ( = ?auto_59912 ?auto_59910 ) ) ( OBJ-AT ?auto_59906 ?auto_59910 ) ( OBJ-AT ?auto_59909 ?auto_59912 ) ( TRUCK-AT ?auto_59913 ?auto_59905 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59909 ?auto_59907 ?auto_59905 )
      ( DELIVER-4PKG-VERIFY ?auto_59906 ?auto_59907 ?auto_59908 ?auto_59909 ?auto_59905 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59997 - OBJ
      ?auto_59998 - OBJ
      ?auto_59999 - OBJ
      ?auto_60000 - OBJ
      ?auto_59996 - LOCATION
    )
    :vars
    (
      ?auto_60003 - LOCATION
      ?auto_60002 - CITY
      ?auto_60001 - LOCATION
      ?auto_60004 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_59998 ?auto_59997 ) ) ( not ( = ?auto_59999 ?auto_59997 ) ) ( not ( = ?auto_59999 ?auto_59998 ) ) ( not ( = ?auto_60000 ?auto_59997 ) ) ( not ( = ?auto_60000 ?auto_59998 ) ) ( not ( = ?auto_60000 ?auto_59999 ) ) ( IN-CITY ?auto_60003 ?auto_60002 ) ( IN-CITY ?auto_59996 ?auto_60002 ) ( not ( = ?auto_59996 ?auto_60003 ) ) ( OBJ-AT ?auto_60000 ?auto_60003 ) ( OBJ-AT ?auto_59997 ?auto_60003 ) ( IN-CITY ?auto_60001 ?auto_60002 ) ( not ( = ?auto_59996 ?auto_60001 ) ) ( not ( = ?auto_60003 ?auto_60001 ) ) ( OBJ-AT ?auto_59999 ?auto_60001 ) ( OBJ-AT ?auto_59998 ?auto_60003 ) ( TRUCK-AT ?auto_60004 ?auto_59996 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59998 ?auto_60000 ?auto_59996 )
      ( DELIVER-4PKG-VERIFY ?auto_59997 ?auto_59998 ?auto_59999 ?auto_60000 ?auto_59996 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60026 - OBJ
      ?auto_60027 - OBJ
      ?auto_60028 - OBJ
      ?auto_60029 - OBJ
      ?auto_60025 - LOCATION
    )
    :vars
    (
      ?auto_60032 - LOCATION
      ?auto_60031 - CITY
      ?auto_60030 - LOCATION
      ?auto_60033 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_60027 ?auto_60026 ) ) ( not ( = ?auto_60028 ?auto_60026 ) ) ( not ( = ?auto_60028 ?auto_60027 ) ) ( not ( = ?auto_60029 ?auto_60026 ) ) ( not ( = ?auto_60029 ?auto_60027 ) ) ( not ( = ?auto_60029 ?auto_60028 ) ) ( IN-CITY ?auto_60032 ?auto_60031 ) ( IN-CITY ?auto_60025 ?auto_60031 ) ( not ( = ?auto_60025 ?auto_60032 ) ) ( OBJ-AT ?auto_60028 ?auto_60032 ) ( OBJ-AT ?auto_60026 ?auto_60032 ) ( IN-CITY ?auto_60030 ?auto_60031 ) ( not ( = ?auto_60025 ?auto_60030 ) ) ( not ( = ?auto_60032 ?auto_60030 ) ) ( OBJ-AT ?auto_60029 ?auto_60030 ) ( OBJ-AT ?auto_60027 ?auto_60032 ) ( TRUCK-AT ?auto_60033 ?auto_60025 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60027 ?auto_60028 ?auto_60025 )
      ( DELIVER-4PKG-VERIFY ?auto_60026 ?auto_60027 ?auto_60028 ?auto_60029 ?auto_60025 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60055 - OBJ
      ?auto_60056 - OBJ
      ?auto_60057 - OBJ
      ?auto_60058 - OBJ
      ?auto_60054 - LOCATION
    )
    :vars
    (
      ?auto_60061 - LOCATION
      ?auto_60060 - CITY
      ?auto_60059 - LOCATION
      ?auto_60062 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_60056 ?auto_60055 ) ) ( not ( = ?auto_60057 ?auto_60055 ) ) ( not ( = ?auto_60057 ?auto_60056 ) ) ( not ( = ?auto_60058 ?auto_60055 ) ) ( not ( = ?auto_60058 ?auto_60056 ) ) ( not ( = ?auto_60058 ?auto_60057 ) ) ( IN-CITY ?auto_60061 ?auto_60060 ) ( IN-CITY ?auto_60054 ?auto_60060 ) ( not ( = ?auto_60054 ?auto_60061 ) ) ( OBJ-AT ?auto_60058 ?auto_60061 ) ( OBJ-AT ?auto_60055 ?auto_60061 ) ( IN-CITY ?auto_60059 ?auto_60060 ) ( not ( = ?auto_60054 ?auto_60059 ) ) ( not ( = ?auto_60061 ?auto_60059 ) ) ( OBJ-AT ?auto_60056 ?auto_60059 ) ( OBJ-AT ?auto_60057 ?auto_60061 ) ( TRUCK-AT ?auto_60062 ?auto_60054 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60057 ?auto_60058 ?auto_60054 )
      ( DELIVER-4PKG-VERIFY ?auto_60055 ?auto_60056 ?auto_60057 ?auto_60058 ?auto_60054 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60084 - OBJ
      ?auto_60085 - OBJ
      ?auto_60086 - OBJ
      ?auto_60087 - OBJ
      ?auto_60083 - LOCATION
    )
    :vars
    (
      ?auto_60090 - LOCATION
      ?auto_60089 - CITY
      ?auto_60088 - LOCATION
      ?auto_60091 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_60085 ?auto_60084 ) ) ( not ( = ?auto_60086 ?auto_60084 ) ) ( not ( = ?auto_60086 ?auto_60085 ) ) ( not ( = ?auto_60087 ?auto_60084 ) ) ( not ( = ?auto_60087 ?auto_60085 ) ) ( not ( = ?auto_60087 ?auto_60086 ) ) ( IN-CITY ?auto_60090 ?auto_60089 ) ( IN-CITY ?auto_60083 ?auto_60089 ) ( not ( = ?auto_60083 ?auto_60090 ) ) ( OBJ-AT ?auto_60086 ?auto_60090 ) ( OBJ-AT ?auto_60084 ?auto_60090 ) ( IN-CITY ?auto_60088 ?auto_60089 ) ( not ( = ?auto_60083 ?auto_60088 ) ) ( not ( = ?auto_60090 ?auto_60088 ) ) ( OBJ-AT ?auto_60085 ?auto_60088 ) ( OBJ-AT ?auto_60087 ?auto_60090 ) ( TRUCK-AT ?auto_60091 ?auto_60083 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60087 ?auto_60086 ?auto_60083 )
      ( DELIVER-4PKG-VERIFY ?auto_60084 ?auto_60085 ?auto_60086 ?auto_60087 ?auto_60083 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60206 - OBJ
      ?auto_60207 - OBJ
      ?auto_60208 - OBJ
      ?auto_60209 - OBJ
      ?auto_60205 - LOCATION
    )
    :vars
    (
      ?auto_60212 - LOCATION
      ?auto_60211 - CITY
      ?auto_60210 - LOCATION
      ?auto_60213 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_60207 ?auto_60206 ) ) ( not ( = ?auto_60208 ?auto_60206 ) ) ( not ( = ?auto_60208 ?auto_60207 ) ) ( not ( = ?auto_60209 ?auto_60206 ) ) ( not ( = ?auto_60209 ?auto_60207 ) ) ( not ( = ?auto_60209 ?auto_60208 ) ) ( IN-CITY ?auto_60212 ?auto_60211 ) ( IN-CITY ?auto_60205 ?auto_60211 ) ( not ( = ?auto_60205 ?auto_60212 ) ) ( OBJ-AT ?auto_60207 ?auto_60212 ) ( OBJ-AT ?auto_60206 ?auto_60212 ) ( IN-CITY ?auto_60210 ?auto_60211 ) ( not ( = ?auto_60205 ?auto_60210 ) ) ( not ( = ?auto_60212 ?auto_60210 ) ) ( OBJ-AT ?auto_60209 ?auto_60210 ) ( OBJ-AT ?auto_60208 ?auto_60212 ) ( TRUCK-AT ?auto_60213 ?auto_60205 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60208 ?auto_60207 ?auto_60205 )
      ( DELIVER-4PKG-VERIFY ?auto_60206 ?auto_60207 ?auto_60208 ?auto_60209 ?auto_60205 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60235 - OBJ
      ?auto_60236 - OBJ
      ?auto_60237 - OBJ
      ?auto_60238 - OBJ
      ?auto_60234 - LOCATION
    )
    :vars
    (
      ?auto_60241 - LOCATION
      ?auto_60240 - CITY
      ?auto_60239 - LOCATION
      ?auto_60242 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_60236 ?auto_60235 ) ) ( not ( = ?auto_60237 ?auto_60235 ) ) ( not ( = ?auto_60237 ?auto_60236 ) ) ( not ( = ?auto_60238 ?auto_60235 ) ) ( not ( = ?auto_60238 ?auto_60236 ) ) ( not ( = ?auto_60238 ?auto_60237 ) ) ( IN-CITY ?auto_60241 ?auto_60240 ) ( IN-CITY ?auto_60234 ?auto_60240 ) ( not ( = ?auto_60234 ?auto_60241 ) ) ( OBJ-AT ?auto_60236 ?auto_60241 ) ( OBJ-AT ?auto_60235 ?auto_60241 ) ( IN-CITY ?auto_60239 ?auto_60240 ) ( not ( = ?auto_60234 ?auto_60239 ) ) ( not ( = ?auto_60241 ?auto_60239 ) ) ( OBJ-AT ?auto_60237 ?auto_60239 ) ( OBJ-AT ?auto_60238 ?auto_60241 ) ( TRUCK-AT ?auto_60242 ?auto_60234 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60238 ?auto_60236 ?auto_60234 )
      ( DELIVER-4PKG-VERIFY ?auto_60235 ?auto_60236 ?auto_60237 ?auto_60238 ?auto_60234 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60420 - OBJ
      ?auto_60421 - OBJ
      ?auto_60422 - OBJ
      ?auto_60423 - OBJ
      ?auto_60419 - LOCATION
    )
    :vars
    (
      ?auto_60426 - LOCATION
      ?auto_60425 - CITY
      ?auto_60424 - LOCATION
      ?auto_60427 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_60421 ?auto_60420 ) ) ( not ( = ?auto_60422 ?auto_60420 ) ) ( not ( = ?auto_60422 ?auto_60421 ) ) ( not ( = ?auto_60423 ?auto_60420 ) ) ( not ( = ?auto_60423 ?auto_60421 ) ) ( not ( = ?auto_60423 ?auto_60422 ) ) ( IN-CITY ?auto_60426 ?auto_60425 ) ( IN-CITY ?auto_60419 ?auto_60425 ) ( not ( = ?auto_60419 ?auto_60426 ) ) ( OBJ-AT ?auto_60420 ?auto_60426 ) ( OBJ-AT ?auto_60423 ?auto_60426 ) ( IN-CITY ?auto_60424 ?auto_60425 ) ( not ( = ?auto_60419 ?auto_60424 ) ) ( not ( = ?auto_60426 ?auto_60424 ) ) ( OBJ-AT ?auto_60422 ?auto_60424 ) ( OBJ-AT ?auto_60421 ?auto_60426 ) ( TRUCK-AT ?auto_60427 ?auto_60419 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60421 ?auto_60420 ?auto_60419 )
      ( DELIVER-4PKG-VERIFY ?auto_60420 ?auto_60421 ?auto_60422 ?auto_60423 ?auto_60419 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60449 - OBJ
      ?auto_60450 - OBJ
      ?auto_60451 - OBJ
      ?auto_60452 - OBJ
      ?auto_60448 - LOCATION
    )
    :vars
    (
      ?auto_60455 - LOCATION
      ?auto_60454 - CITY
      ?auto_60453 - LOCATION
      ?auto_60456 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_60450 ?auto_60449 ) ) ( not ( = ?auto_60451 ?auto_60449 ) ) ( not ( = ?auto_60451 ?auto_60450 ) ) ( not ( = ?auto_60452 ?auto_60449 ) ) ( not ( = ?auto_60452 ?auto_60450 ) ) ( not ( = ?auto_60452 ?auto_60451 ) ) ( IN-CITY ?auto_60455 ?auto_60454 ) ( IN-CITY ?auto_60448 ?auto_60454 ) ( not ( = ?auto_60448 ?auto_60455 ) ) ( OBJ-AT ?auto_60449 ?auto_60455 ) ( OBJ-AT ?auto_60451 ?auto_60455 ) ( IN-CITY ?auto_60453 ?auto_60454 ) ( not ( = ?auto_60448 ?auto_60453 ) ) ( not ( = ?auto_60455 ?auto_60453 ) ) ( OBJ-AT ?auto_60452 ?auto_60453 ) ( OBJ-AT ?auto_60450 ?auto_60455 ) ( TRUCK-AT ?auto_60456 ?auto_60448 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60450 ?auto_60449 ?auto_60448 )
      ( DELIVER-4PKG-VERIFY ?auto_60449 ?auto_60450 ?auto_60451 ?auto_60452 ?auto_60448 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60540 - OBJ
      ?auto_60541 - OBJ
      ?auto_60542 - OBJ
      ?auto_60543 - OBJ
      ?auto_60539 - LOCATION
    )
    :vars
    (
      ?auto_60546 - LOCATION
      ?auto_60545 - CITY
      ?auto_60544 - LOCATION
      ?auto_60547 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_60541 ?auto_60540 ) ) ( not ( = ?auto_60542 ?auto_60540 ) ) ( not ( = ?auto_60542 ?auto_60541 ) ) ( not ( = ?auto_60543 ?auto_60540 ) ) ( not ( = ?auto_60543 ?auto_60541 ) ) ( not ( = ?auto_60543 ?auto_60542 ) ) ( IN-CITY ?auto_60546 ?auto_60545 ) ( IN-CITY ?auto_60539 ?auto_60545 ) ( not ( = ?auto_60539 ?auto_60546 ) ) ( OBJ-AT ?auto_60540 ?auto_60546 ) ( OBJ-AT ?auto_60543 ?auto_60546 ) ( IN-CITY ?auto_60544 ?auto_60545 ) ( not ( = ?auto_60539 ?auto_60544 ) ) ( not ( = ?auto_60546 ?auto_60544 ) ) ( OBJ-AT ?auto_60541 ?auto_60544 ) ( OBJ-AT ?auto_60542 ?auto_60546 ) ( TRUCK-AT ?auto_60547 ?auto_60539 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60542 ?auto_60540 ?auto_60539 )
      ( DELIVER-4PKG-VERIFY ?auto_60540 ?auto_60541 ?auto_60542 ?auto_60543 ?auto_60539 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60601 - OBJ
      ?auto_60602 - OBJ
      ?auto_60603 - OBJ
      ?auto_60604 - OBJ
      ?auto_60600 - LOCATION
    )
    :vars
    (
      ?auto_60607 - LOCATION
      ?auto_60606 - CITY
      ?auto_60605 - LOCATION
      ?auto_60608 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_60602 ?auto_60601 ) ) ( not ( = ?auto_60603 ?auto_60601 ) ) ( not ( = ?auto_60603 ?auto_60602 ) ) ( not ( = ?auto_60604 ?auto_60601 ) ) ( not ( = ?auto_60604 ?auto_60602 ) ) ( not ( = ?auto_60604 ?auto_60603 ) ) ( IN-CITY ?auto_60607 ?auto_60606 ) ( IN-CITY ?auto_60600 ?auto_60606 ) ( not ( = ?auto_60600 ?auto_60607 ) ) ( OBJ-AT ?auto_60601 ?auto_60607 ) ( OBJ-AT ?auto_60603 ?auto_60607 ) ( IN-CITY ?auto_60605 ?auto_60606 ) ( not ( = ?auto_60600 ?auto_60605 ) ) ( not ( = ?auto_60607 ?auto_60605 ) ) ( OBJ-AT ?auto_60602 ?auto_60605 ) ( OBJ-AT ?auto_60604 ?auto_60607 ) ( TRUCK-AT ?auto_60608 ?auto_60600 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60604 ?auto_60601 ?auto_60600 )
      ( DELIVER-4PKG-VERIFY ?auto_60601 ?auto_60602 ?auto_60603 ?auto_60604 ?auto_60600 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60692 - OBJ
      ?auto_60693 - OBJ
      ?auto_60694 - OBJ
      ?auto_60695 - OBJ
      ?auto_60691 - LOCATION
    )
    :vars
    (
      ?auto_60698 - LOCATION
      ?auto_60697 - CITY
      ?auto_60696 - LOCATION
      ?auto_60699 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_60693 ?auto_60692 ) ) ( not ( = ?auto_60694 ?auto_60692 ) ) ( not ( = ?auto_60694 ?auto_60693 ) ) ( not ( = ?auto_60695 ?auto_60692 ) ) ( not ( = ?auto_60695 ?auto_60693 ) ) ( not ( = ?auto_60695 ?auto_60694 ) ) ( IN-CITY ?auto_60698 ?auto_60697 ) ( IN-CITY ?auto_60691 ?auto_60697 ) ( not ( = ?auto_60691 ?auto_60698 ) ) ( OBJ-AT ?auto_60692 ?auto_60698 ) ( OBJ-AT ?auto_60693 ?auto_60698 ) ( IN-CITY ?auto_60696 ?auto_60697 ) ( not ( = ?auto_60691 ?auto_60696 ) ) ( not ( = ?auto_60698 ?auto_60696 ) ) ( OBJ-AT ?auto_60695 ?auto_60696 ) ( OBJ-AT ?auto_60694 ?auto_60698 ) ( TRUCK-AT ?auto_60699 ?auto_60691 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60694 ?auto_60692 ?auto_60691 )
      ( DELIVER-4PKG-VERIFY ?auto_60692 ?auto_60693 ?auto_60694 ?auto_60695 ?auto_60691 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60721 - OBJ
      ?auto_60722 - OBJ
      ?auto_60723 - OBJ
      ?auto_60724 - OBJ
      ?auto_60720 - LOCATION
    )
    :vars
    (
      ?auto_60727 - LOCATION
      ?auto_60726 - CITY
      ?auto_60725 - LOCATION
      ?auto_60728 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_60722 ?auto_60721 ) ) ( not ( = ?auto_60723 ?auto_60721 ) ) ( not ( = ?auto_60723 ?auto_60722 ) ) ( not ( = ?auto_60724 ?auto_60721 ) ) ( not ( = ?auto_60724 ?auto_60722 ) ) ( not ( = ?auto_60724 ?auto_60723 ) ) ( IN-CITY ?auto_60727 ?auto_60726 ) ( IN-CITY ?auto_60720 ?auto_60726 ) ( not ( = ?auto_60720 ?auto_60727 ) ) ( OBJ-AT ?auto_60721 ?auto_60727 ) ( OBJ-AT ?auto_60722 ?auto_60727 ) ( IN-CITY ?auto_60725 ?auto_60726 ) ( not ( = ?auto_60720 ?auto_60725 ) ) ( not ( = ?auto_60727 ?auto_60725 ) ) ( OBJ-AT ?auto_60723 ?auto_60725 ) ( OBJ-AT ?auto_60724 ?auto_60727 ) ( TRUCK-AT ?auto_60728 ?auto_60720 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60724 ?auto_60721 ?auto_60720 )
      ( DELIVER-4PKG-VERIFY ?auto_60721 ?auto_60722 ?auto_60723 ?auto_60724 ?auto_60720 ) )
  )

)

