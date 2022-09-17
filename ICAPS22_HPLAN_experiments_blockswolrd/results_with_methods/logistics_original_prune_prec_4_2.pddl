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
      ?auto_95284 - OBJ
      ?auto_95283 - LOCATION
    )
    :vars
    (
      ?auto_95285 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95285 ?auto_95283 ) ( IN-TRUCK ?auto_95284 ?auto_95285 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_95284 ?auto_95285 ?auto_95283 )
      ( DELIVER-1PKG-VERIFY ?auto_95284 ?auto_95283 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95302 - OBJ
      ?auto_95301 - LOCATION
    )
    :vars
    (
      ?auto_95303 - TRUCK
      ?auto_95304 - LOCATION
      ?auto_95305 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95302 ?auto_95303 ) ( TRUCK-AT ?auto_95303 ?auto_95304 ) ( IN-CITY ?auto_95304 ?auto_95305 ) ( IN-CITY ?auto_95301 ?auto_95305 ) ( not ( = ?auto_95301 ?auto_95304 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_95303 ?auto_95304 ?auto_95301 ?auto_95305 )
      ( DELIVER-1PKG ?auto_95302 ?auto_95301 )
      ( DELIVER-1PKG-VERIFY ?auto_95302 ?auto_95301 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95328 - OBJ
      ?auto_95327 - LOCATION
    )
    :vars
    (
      ?auto_95330 - TRUCK
      ?auto_95329 - LOCATION
      ?auto_95331 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95330 ?auto_95329 ) ( IN-CITY ?auto_95329 ?auto_95331 ) ( IN-CITY ?auto_95327 ?auto_95331 ) ( not ( = ?auto_95327 ?auto_95329 ) ) ( OBJ-AT ?auto_95328 ?auto_95329 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_95328 ?auto_95330 ?auto_95329 )
      ( DELIVER-1PKG ?auto_95328 ?auto_95327 )
      ( DELIVER-1PKG-VERIFY ?auto_95328 ?auto_95327 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95354 - OBJ
      ?auto_95353 - LOCATION
    )
    :vars
    (
      ?auto_95357 - LOCATION
      ?auto_95356 - CITY
      ?auto_95355 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95357 ?auto_95356 ) ( IN-CITY ?auto_95353 ?auto_95356 ) ( not ( = ?auto_95353 ?auto_95357 ) ) ( OBJ-AT ?auto_95354 ?auto_95357 ) ( TRUCK-AT ?auto_95355 ?auto_95353 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_95355 ?auto_95353 ?auto_95357 ?auto_95356 )
      ( DELIVER-1PKG ?auto_95354 ?auto_95353 )
      ( DELIVER-1PKG-VERIFY ?auto_95354 ?auto_95353 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95497 - OBJ
      ?auto_95498 - OBJ
      ?auto_95496 - LOCATION
    )
    :vars
    (
      ?auto_95499 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95498 ?auto_95497 ) ) ( TRUCK-AT ?auto_95499 ?auto_95496 ) ( IN-TRUCK ?auto_95498 ?auto_95499 ) ( OBJ-AT ?auto_95497 ?auto_95496 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95498 ?auto_95496 )
      ( DELIVER-2PKG-VERIFY ?auto_95497 ?auto_95498 ?auto_95496 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95501 - OBJ
      ?auto_95502 - OBJ
      ?auto_95500 - LOCATION
    )
    :vars
    (
      ?auto_95503 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95502 ?auto_95501 ) ) ( TRUCK-AT ?auto_95503 ?auto_95500 ) ( IN-TRUCK ?auto_95501 ?auto_95503 ) ( OBJ-AT ?auto_95502 ?auto_95500 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95501 ?auto_95500 )
      ( DELIVER-2PKG-VERIFY ?auto_95501 ?auto_95502 ?auto_95500 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95639 - OBJ
      ?auto_95640 - OBJ
      ?auto_95638 - LOCATION
    )
    :vars
    (
      ?auto_95643 - TRUCK
      ?auto_95641 - LOCATION
      ?auto_95642 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_95640 ?auto_95639 ) ) ( IN-TRUCK ?auto_95640 ?auto_95643 ) ( TRUCK-AT ?auto_95643 ?auto_95641 ) ( IN-CITY ?auto_95641 ?auto_95642 ) ( IN-CITY ?auto_95638 ?auto_95642 ) ( not ( = ?auto_95638 ?auto_95641 ) ) ( OBJ-AT ?auto_95639 ?auto_95638 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95640 ?auto_95638 )
      ( DELIVER-2PKG-VERIFY ?auto_95639 ?auto_95640 ?auto_95638 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95645 - OBJ
      ?auto_95646 - OBJ
      ?auto_95644 - LOCATION
    )
    :vars
    (
      ?auto_95647 - TRUCK
      ?auto_95648 - LOCATION
      ?auto_95649 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_95646 ?auto_95645 ) ) ( IN-TRUCK ?auto_95645 ?auto_95647 ) ( TRUCK-AT ?auto_95647 ?auto_95648 ) ( IN-CITY ?auto_95648 ?auto_95649 ) ( IN-CITY ?auto_95644 ?auto_95649 ) ( not ( = ?auto_95644 ?auto_95648 ) ) ( OBJ-AT ?auto_95646 ?auto_95644 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95646 ?auto_95645 ?auto_95644 )
      ( DELIVER-2PKG-VERIFY ?auto_95645 ?auto_95646 ?auto_95644 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95829 - OBJ
      ?auto_95828 - LOCATION
    )
    :vars
    (
      ?auto_95833 - OBJ
      ?auto_95830 - TRUCK
      ?auto_95831 - LOCATION
      ?auto_95832 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_95829 ?auto_95833 ) ) ( TRUCK-AT ?auto_95830 ?auto_95831 ) ( IN-CITY ?auto_95831 ?auto_95832 ) ( IN-CITY ?auto_95828 ?auto_95832 ) ( not ( = ?auto_95828 ?auto_95831 ) ) ( OBJ-AT ?auto_95833 ?auto_95828 ) ( OBJ-AT ?auto_95829 ?auto_95831 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_95829 ?auto_95830 ?auto_95831 )
      ( DELIVER-2PKG ?auto_95833 ?auto_95829 ?auto_95828 )
      ( DELIVER-1PKG-VERIFY ?auto_95829 ?auto_95828 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95835 - OBJ
      ?auto_95836 - OBJ
      ?auto_95834 - LOCATION
    )
    :vars
    (
      ?auto_95838 - TRUCK
      ?auto_95839 - LOCATION
      ?auto_95837 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_95836 ?auto_95835 ) ) ( TRUCK-AT ?auto_95838 ?auto_95839 ) ( IN-CITY ?auto_95839 ?auto_95837 ) ( IN-CITY ?auto_95834 ?auto_95837 ) ( not ( = ?auto_95834 ?auto_95839 ) ) ( OBJ-AT ?auto_95835 ?auto_95834 ) ( OBJ-AT ?auto_95836 ?auto_95839 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95836 ?auto_95834 )
      ( DELIVER-2PKG-VERIFY ?auto_95835 ?auto_95836 ?auto_95834 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95841 - OBJ
      ?auto_95842 - OBJ
      ?auto_95840 - LOCATION
    )
    :vars
    (
      ?auto_95845 - TRUCK
      ?auto_95844 - LOCATION
      ?auto_95843 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_95842 ?auto_95841 ) ) ( TRUCK-AT ?auto_95845 ?auto_95844 ) ( IN-CITY ?auto_95844 ?auto_95843 ) ( IN-CITY ?auto_95840 ?auto_95843 ) ( not ( = ?auto_95840 ?auto_95844 ) ) ( OBJ-AT ?auto_95842 ?auto_95840 ) ( OBJ-AT ?auto_95841 ?auto_95844 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95842 ?auto_95841 ?auto_95840 )
      ( DELIVER-2PKG-VERIFY ?auto_95841 ?auto_95842 ?auto_95840 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96025 - OBJ
      ?auto_96024 - LOCATION
    )
    :vars
    (
      ?auto_96026 - OBJ
      ?auto_96028 - LOCATION
      ?auto_96027 - CITY
      ?auto_96029 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96025 ?auto_96026 ) ) ( IN-CITY ?auto_96028 ?auto_96027 ) ( IN-CITY ?auto_96024 ?auto_96027 ) ( not ( = ?auto_96024 ?auto_96028 ) ) ( OBJ-AT ?auto_96026 ?auto_96024 ) ( OBJ-AT ?auto_96025 ?auto_96028 ) ( TRUCK-AT ?auto_96029 ?auto_96024 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_96029 ?auto_96024 ?auto_96028 ?auto_96027 )
      ( DELIVER-2PKG ?auto_96026 ?auto_96025 ?auto_96024 )
      ( DELIVER-1PKG-VERIFY ?auto_96025 ?auto_96024 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96031 - OBJ
      ?auto_96032 - OBJ
      ?auto_96030 - LOCATION
    )
    :vars
    (
      ?auto_96034 - LOCATION
      ?auto_96035 - CITY
      ?auto_96033 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96032 ?auto_96031 ) ) ( IN-CITY ?auto_96034 ?auto_96035 ) ( IN-CITY ?auto_96030 ?auto_96035 ) ( not ( = ?auto_96030 ?auto_96034 ) ) ( OBJ-AT ?auto_96031 ?auto_96030 ) ( OBJ-AT ?auto_96032 ?auto_96034 ) ( TRUCK-AT ?auto_96033 ?auto_96030 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96032 ?auto_96030 )
      ( DELIVER-2PKG-VERIFY ?auto_96031 ?auto_96032 ?auto_96030 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96037 - OBJ
      ?auto_96038 - OBJ
      ?auto_96036 - LOCATION
    )
    :vars
    (
      ?auto_96039 - LOCATION
      ?auto_96041 - CITY
      ?auto_96040 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96038 ?auto_96037 ) ) ( IN-CITY ?auto_96039 ?auto_96041 ) ( IN-CITY ?auto_96036 ?auto_96041 ) ( not ( = ?auto_96036 ?auto_96039 ) ) ( OBJ-AT ?auto_96038 ?auto_96036 ) ( OBJ-AT ?auto_96037 ?auto_96039 ) ( TRUCK-AT ?auto_96040 ?auto_96036 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96038 ?auto_96037 ?auto_96036 )
      ( DELIVER-2PKG-VERIFY ?auto_96037 ?auto_96038 ?auto_96036 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96221 - OBJ
      ?auto_96220 - LOCATION
    )
    :vars
    (
      ?auto_96225 - OBJ
      ?auto_96222 - LOCATION
      ?auto_96224 - CITY
      ?auto_96223 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96221 ?auto_96225 ) ) ( IN-CITY ?auto_96222 ?auto_96224 ) ( IN-CITY ?auto_96220 ?auto_96224 ) ( not ( = ?auto_96220 ?auto_96222 ) ) ( OBJ-AT ?auto_96221 ?auto_96222 ) ( TRUCK-AT ?auto_96223 ?auto_96220 ) ( IN-TRUCK ?auto_96225 ?auto_96223 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96225 ?auto_96220 )
      ( DELIVER-2PKG ?auto_96225 ?auto_96221 ?auto_96220 )
      ( DELIVER-1PKG-VERIFY ?auto_96221 ?auto_96220 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96227 - OBJ
      ?auto_96228 - OBJ
      ?auto_96226 - LOCATION
    )
    :vars
    (
      ?auto_96231 - LOCATION
      ?auto_96230 - CITY
      ?auto_96229 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96228 ?auto_96227 ) ) ( IN-CITY ?auto_96231 ?auto_96230 ) ( IN-CITY ?auto_96226 ?auto_96230 ) ( not ( = ?auto_96226 ?auto_96231 ) ) ( OBJ-AT ?auto_96228 ?auto_96231 ) ( TRUCK-AT ?auto_96229 ?auto_96226 ) ( IN-TRUCK ?auto_96227 ?auto_96229 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96228 ?auto_96226 )
      ( DELIVER-2PKG-VERIFY ?auto_96227 ?auto_96228 ?auto_96226 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96233 - OBJ
      ?auto_96234 - OBJ
      ?auto_96232 - LOCATION
    )
    :vars
    (
      ?auto_96235 - LOCATION
      ?auto_96236 - CITY
      ?auto_96237 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96234 ?auto_96233 ) ) ( IN-CITY ?auto_96235 ?auto_96236 ) ( IN-CITY ?auto_96232 ?auto_96236 ) ( not ( = ?auto_96232 ?auto_96235 ) ) ( OBJ-AT ?auto_96233 ?auto_96235 ) ( TRUCK-AT ?auto_96237 ?auto_96232 ) ( IN-TRUCK ?auto_96234 ?auto_96237 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96234 ?auto_96233 ?auto_96232 )
      ( DELIVER-2PKG-VERIFY ?auto_96233 ?auto_96234 ?auto_96232 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96417 - OBJ
      ?auto_96416 - LOCATION
    )
    :vars
    (
      ?auto_96418 - OBJ
      ?auto_96419 - LOCATION
      ?auto_96420 - CITY
      ?auto_96421 - TRUCK
      ?auto_96422 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_96417 ?auto_96418 ) ) ( IN-CITY ?auto_96419 ?auto_96420 ) ( IN-CITY ?auto_96416 ?auto_96420 ) ( not ( = ?auto_96416 ?auto_96419 ) ) ( OBJ-AT ?auto_96417 ?auto_96419 ) ( IN-TRUCK ?auto_96418 ?auto_96421 ) ( TRUCK-AT ?auto_96421 ?auto_96422 ) ( IN-CITY ?auto_96422 ?auto_96420 ) ( not ( = ?auto_96416 ?auto_96422 ) ) ( not ( = ?auto_96419 ?auto_96422 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_96421 ?auto_96422 ?auto_96416 ?auto_96420 )
      ( DELIVER-2PKG ?auto_96418 ?auto_96417 ?auto_96416 )
      ( DELIVER-1PKG-VERIFY ?auto_96417 ?auto_96416 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96424 - OBJ
      ?auto_96425 - OBJ
      ?auto_96423 - LOCATION
    )
    :vars
    (
      ?auto_96427 - LOCATION
      ?auto_96426 - CITY
      ?auto_96428 - TRUCK
      ?auto_96429 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_96425 ?auto_96424 ) ) ( IN-CITY ?auto_96427 ?auto_96426 ) ( IN-CITY ?auto_96423 ?auto_96426 ) ( not ( = ?auto_96423 ?auto_96427 ) ) ( OBJ-AT ?auto_96425 ?auto_96427 ) ( IN-TRUCK ?auto_96424 ?auto_96428 ) ( TRUCK-AT ?auto_96428 ?auto_96429 ) ( IN-CITY ?auto_96429 ?auto_96426 ) ( not ( = ?auto_96423 ?auto_96429 ) ) ( not ( = ?auto_96427 ?auto_96429 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96425 ?auto_96423 )
      ( DELIVER-2PKG-VERIFY ?auto_96424 ?auto_96425 ?auto_96423 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96431 - OBJ
      ?auto_96432 - OBJ
      ?auto_96430 - LOCATION
    )
    :vars
    (
      ?auto_96435 - LOCATION
      ?auto_96434 - CITY
      ?auto_96436 - TRUCK
      ?auto_96433 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_96432 ?auto_96431 ) ) ( IN-CITY ?auto_96435 ?auto_96434 ) ( IN-CITY ?auto_96430 ?auto_96434 ) ( not ( = ?auto_96430 ?auto_96435 ) ) ( OBJ-AT ?auto_96431 ?auto_96435 ) ( IN-TRUCK ?auto_96432 ?auto_96436 ) ( TRUCK-AT ?auto_96436 ?auto_96433 ) ( IN-CITY ?auto_96433 ?auto_96434 ) ( not ( = ?auto_96430 ?auto_96433 ) ) ( not ( = ?auto_96435 ?auto_96433 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96432 ?auto_96431 ?auto_96430 )
      ( DELIVER-2PKG-VERIFY ?auto_96431 ?auto_96432 ?auto_96430 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96639 - OBJ
      ?auto_96638 - LOCATION
    )
    :vars
    (
      ?auto_96640 - OBJ
      ?auto_96643 - LOCATION
      ?auto_96642 - CITY
      ?auto_96644 - TRUCK
      ?auto_96641 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_96639 ?auto_96640 ) ) ( IN-CITY ?auto_96643 ?auto_96642 ) ( IN-CITY ?auto_96638 ?auto_96642 ) ( not ( = ?auto_96638 ?auto_96643 ) ) ( OBJ-AT ?auto_96639 ?auto_96643 ) ( TRUCK-AT ?auto_96644 ?auto_96641 ) ( IN-CITY ?auto_96641 ?auto_96642 ) ( not ( = ?auto_96638 ?auto_96641 ) ) ( not ( = ?auto_96643 ?auto_96641 ) ) ( OBJ-AT ?auto_96640 ?auto_96641 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_96640 ?auto_96644 ?auto_96641 )
      ( DELIVER-2PKG ?auto_96640 ?auto_96639 ?auto_96638 )
      ( DELIVER-1PKG-VERIFY ?auto_96639 ?auto_96638 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96646 - OBJ
      ?auto_96647 - OBJ
      ?auto_96645 - LOCATION
    )
    :vars
    (
      ?auto_96648 - LOCATION
      ?auto_96651 - CITY
      ?auto_96649 - TRUCK
      ?auto_96650 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_96647 ?auto_96646 ) ) ( IN-CITY ?auto_96648 ?auto_96651 ) ( IN-CITY ?auto_96645 ?auto_96651 ) ( not ( = ?auto_96645 ?auto_96648 ) ) ( OBJ-AT ?auto_96647 ?auto_96648 ) ( TRUCK-AT ?auto_96649 ?auto_96650 ) ( IN-CITY ?auto_96650 ?auto_96651 ) ( not ( = ?auto_96645 ?auto_96650 ) ) ( not ( = ?auto_96648 ?auto_96650 ) ) ( OBJ-AT ?auto_96646 ?auto_96650 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96647 ?auto_96645 )
      ( DELIVER-2PKG-VERIFY ?auto_96646 ?auto_96647 ?auto_96645 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96653 - OBJ
      ?auto_96654 - OBJ
      ?auto_96652 - LOCATION
    )
    :vars
    (
      ?auto_96657 - LOCATION
      ?auto_96655 - CITY
      ?auto_96656 - TRUCK
      ?auto_96658 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_96654 ?auto_96653 ) ) ( IN-CITY ?auto_96657 ?auto_96655 ) ( IN-CITY ?auto_96652 ?auto_96655 ) ( not ( = ?auto_96652 ?auto_96657 ) ) ( OBJ-AT ?auto_96653 ?auto_96657 ) ( TRUCK-AT ?auto_96656 ?auto_96658 ) ( IN-CITY ?auto_96658 ?auto_96655 ) ( not ( = ?auto_96652 ?auto_96658 ) ) ( not ( = ?auto_96657 ?auto_96658 ) ) ( OBJ-AT ?auto_96654 ?auto_96658 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96654 ?auto_96653 ?auto_96652 )
      ( DELIVER-2PKG-VERIFY ?auto_96653 ?auto_96654 ?auto_96652 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97494 - OBJ
      ?auto_97495 - OBJ
      ?auto_97496 - OBJ
      ?auto_97493 - LOCATION
    )
    :vars
    (
      ?auto_97497 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97495 ?auto_97494 ) ) ( not ( = ?auto_97496 ?auto_97494 ) ) ( not ( = ?auto_97496 ?auto_97495 ) ) ( TRUCK-AT ?auto_97497 ?auto_97493 ) ( IN-TRUCK ?auto_97496 ?auto_97497 ) ( OBJ-AT ?auto_97494 ?auto_97493 ) ( OBJ-AT ?auto_97495 ?auto_97493 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_97496 ?auto_97493 )
      ( DELIVER-3PKG-VERIFY ?auto_97494 ?auto_97495 ?auto_97496 ?auto_97493 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97504 - OBJ
      ?auto_97505 - OBJ
      ?auto_97506 - OBJ
      ?auto_97503 - LOCATION
    )
    :vars
    (
      ?auto_97507 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97505 ?auto_97504 ) ) ( not ( = ?auto_97506 ?auto_97504 ) ) ( not ( = ?auto_97506 ?auto_97505 ) ) ( TRUCK-AT ?auto_97507 ?auto_97503 ) ( IN-TRUCK ?auto_97505 ?auto_97507 ) ( OBJ-AT ?auto_97504 ?auto_97503 ) ( OBJ-AT ?auto_97506 ?auto_97503 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_97505 ?auto_97503 )
      ( DELIVER-3PKG-VERIFY ?auto_97504 ?auto_97505 ?auto_97506 ?auto_97503 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97542 - OBJ
      ?auto_97543 - OBJ
      ?auto_97544 - OBJ
      ?auto_97541 - LOCATION
    )
    :vars
    (
      ?auto_97545 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97543 ?auto_97542 ) ) ( not ( = ?auto_97544 ?auto_97542 ) ) ( not ( = ?auto_97544 ?auto_97543 ) ) ( TRUCK-AT ?auto_97545 ?auto_97541 ) ( IN-TRUCK ?auto_97542 ?auto_97545 ) ( OBJ-AT ?auto_97543 ?auto_97541 ) ( OBJ-AT ?auto_97544 ?auto_97541 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_97542 ?auto_97541 )
      ( DELIVER-3PKG-VERIFY ?auto_97542 ?auto_97543 ?auto_97544 ?auto_97541 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98008 - OBJ
      ?auto_98009 - OBJ
      ?auto_98010 - OBJ
      ?auto_98007 - LOCATION
    )
    :vars
    (
      ?auto_98013 - TRUCK
      ?auto_98012 - LOCATION
      ?auto_98011 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_98009 ?auto_98008 ) ) ( not ( = ?auto_98010 ?auto_98008 ) ) ( not ( = ?auto_98010 ?auto_98009 ) ) ( IN-TRUCK ?auto_98010 ?auto_98013 ) ( TRUCK-AT ?auto_98013 ?auto_98012 ) ( IN-CITY ?auto_98012 ?auto_98011 ) ( IN-CITY ?auto_98007 ?auto_98011 ) ( not ( = ?auto_98007 ?auto_98012 ) ) ( OBJ-AT ?auto_98008 ?auto_98007 ) ( OBJ-AT ?auto_98009 ?auto_98007 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98008 ?auto_98010 ?auto_98007 )
      ( DELIVER-3PKG-VERIFY ?auto_98008 ?auto_98009 ?auto_98010 ?auto_98007 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98022 - OBJ
      ?auto_98023 - OBJ
      ?auto_98024 - OBJ
      ?auto_98021 - LOCATION
    )
    :vars
    (
      ?auto_98027 - TRUCK
      ?auto_98026 - LOCATION
      ?auto_98025 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_98023 ?auto_98022 ) ) ( not ( = ?auto_98024 ?auto_98022 ) ) ( not ( = ?auto_98024 ?auto_98023 ) ) ( IN-TRUCK ?auto_98023 ?auto_98027 ) ( TRUCK-AT ?auto_98027 ?auto_98026 ) ( IN-CITY ?auto_98026 ?auto_98025 ) ( IN-CITY ?auto_98021 ?auto_98025 ) ( not ( = ?auto_98021 ?auto_98026 ) ) ( OBJ-AT ?auto_98022 ?auto_98021 ) ( OBJ-AT ?auto_98024 ?auto_98021 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98022 ?auto_98023 ?auto_98021 )
      ( DELIVER-3PKG-VERIFY ?auto_98022 ?auto_98023 ?auto_98024 ?auto_98021 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98075 - OBJ
      ?auto_98076 - OBJ
      ?auto_98077 - OBJ
      ?auto_98074 - LOCATION
    )
    :vars
    (
      ?auto_98080 - TRUCK
      ?auto_98079 - LOCATION
      ?auto_98078 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_98076 ?auto_98075 ) ) ( not ( = ?auto_98077 ?auto_98075 ) ) ( not ( = ?auto_98077 ?auto_98076 ) ) ( IN-TRUCK ?auto_98075 ?auto_98080 ) ( TRUCK-AT ?auto_98080 ?auto_98079 ) ( IN-CITY ?auto_98079 ?auto_98078 ) ( IN-CITY ?auto_98074 ?auto_98078 ) ( not ( = ?auto_98074 ?auto_98079 ) ) ( OBJ-AT ?auto_98076 ?auto_98074 ) ( OBJ-AT ?auto_98077 ?auto_98074 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98076 ?auto_98075 ?auto_98074 )
      ( DELIVER-3PKG-VERIFY ?auto_98075 ?auto_98076 ?auto_98077 ?auto_98074 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98705 - OBJ
      ?auto_98706 - OBJ
      ?auto_98707 - OBJ
      ?auto_98704 - LOCATION
    )
    :vars
    (
      ?auto_98710 - TRUCK
      ?auto_98708 - LOCATION
      ?auto_98709 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_98706 ?auto_98705 ) ) ( not ( = ?auto_98707 ?auto_98705 ) ) ( not ( = ?auto_98707 ?auto_98706 ) ) ( TRUCK-AT ?auto_98710 ?auto_98708 ) ( IN-CITY ?auto_98708 ?auto_98709 ) ( IN-CITY ?auto_98704 ?auto_98709 ) ( not ( = ?auto_98704 ?auto_98708 ) ) ( OBJ-AT ?auto_98705 ?auto_98704 ) ( OBJ-AT ?auto_98707 ?auto_98708 ) ( OBJ-AT ?auto_98706 ?auto_98704 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98705 ?auto_98707 ?auto_98704 )
      ( DELIVER-3PKG-VERIFY ?auto_98705 ?auto_98706 ?auto_98707 ?auto_98704 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98719 - OBJ
      ?auto_98720 - OBJ
      ?auto_98721 - OBJ
      ?auto_98718 - LOCATION
    )
    :vars
    (
      ?auto_98724 - TRUCK
      ?auto_98722 - LOCATION
      ?auto_98723 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_98720 ?auto_98719 ) ) ( not ( = ?auto_98721 ?auto_98719 ) ) ( not ( = ?auto_98721 ?auto_98720 ) ) ( TRUCK-AT ?auto_98724 ?auto_98722 ) ( IN-CITY ?auto_98722 ?auto_98723 ) ( IN-CITY ?auto_98718 ?auto_98723 ) ( not ( = ?auto_98718 ?auto_98722 ) ) ( OBJ-AT ?auto_98719 ?auto_98718 ) ( OBJ-AT ?auto_98720 ?auto_98722 ) ( OBJ-AT ?auto_98721 ?auto_98718 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98719 ?auto_98720 ?auto_98718 )
      ( DELIVER-3PKG-VERIFY ?auto_98719 ?auto_98720 ?auto_98721 ?auto_98718 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98772 - OBJ
      ?auto_98773 - OBJ
      ?auto_98774 - OBJ
      ?auto_98771 - LOCATION
    )
    :vars
    (
      ?auto_98777 - TRUCK
      ?auto_98775 - LOCATION
      ?auto_98776 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_98773 ?auto_98772 ) ) ( not ( = ?auto_98774 ?auto_98772 ) ) ( not ( = ?auto_98774 ?auto_98773 ) ) ( TRUCK-AT ?auto_98777 ?auto_98775 ) ( IN-CITY ?auto_98775 ?auto_98776 ) ( IN-CITY ?auto_98771 ?auto_98776 ) ( not ( = ?auto_98771 ?auto_98775 ) ) ( OBJ-AT ?auto_98773 ?auto_98771 ) ( OBJ-AT ?auto_98772 ?auto_98775 ) ( OBJ-AT ?auto_98774 ?auto_98771 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98773 ?auto_98772 ?auto_98771 )
      ( DELIVER-3PKG-VERIFY ?auto_98772 ?auto_98773 ?auto_98774 ?auto_98771 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99402 - OBJ
      ?auto_99403 - OBJ
      ?auto_99404 - OBJ
      ?auto_99401 - LOCATION
    )
    :vars
    (
      ?auto_99405 - LOCATION
      ?auto_99407 - CITY
      ?auto_99406 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_99403 ?auto_99402 ) ) ( not ( = ?auto_99404 ?auto_99402 ) ) ( not ( = ?auto_99404 ?auto_99403 ) ) ( IN-CITY ?auto_99405 ?auto_99407 ) ( IN-CITY ?auto_99401 ?auto_99407 ) ( not ( = ?auto_99401 ?auto_99405 ) ) ( OBJ-AT ?auto_99402 ?auto_99401 ) ( OBJ-AT ?auto_99404 ?auto_99405 ) ( TRUCK-AT ?auto_99406 ?auto_99401 ) ( OBJ-AT ?auto_99403 ?auto_99401 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99402 ?auto_99404 ?auto_99401 )
      ( DELIVER-3PKG-VERIFY ?auto_99402 ?auto_99403 ?auto_99404 ?auto_99401 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99416 - OBJ
      ?auto_99417 - OBJ
      ?auto_99418 - OBJ
      ?auto_99415 - LOCATION
    )
    :vars
    (
      ?auto_99419 - LOCATION
      ?auto_99421 - CITY
      ?auto_99420 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_99417 ?auto_99416 ) ) ( not ( = ?auto_99418 ?auto_99416 ) ) ( not ( = ?auto_99418 ?auto_99417 ) ) ( IN-CITY ?auto_99419 ?auto_99421 ) ( IN-CITY ?auto_99415 ?auto_99421 ) ( not ( = ?auto_99415 ?auto_99419 ) ) ( OBJ-AT ?auto_99416 ?auto_99415 ) ( OBJ-AT ?auto_99417 ?auto_99419 ) ( TRUCK-AT ?auto_99420 ?auto_99415 ) ( OBJ-AT ?auto_99418 ?auto_99415 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99416 ?auto_99417 ?auto_99415 )
      ( DELIVER-3PKG-VERIFY ?auto_99416 ?auto_99417 ?auto_99418 ?auto_99415 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99469 - OBJ
      ?auto_99470 - OBJ
      ?auto_99471 - OBJ
      ?auto_99468 - LOCATION
    )
    :vars
    (
      ?auto_99472 - LOCATION
      ?auto_99474 - CITY
      ?auto_99473 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_99470 ?auto_99469 ) ) ( not ( = ?auto_99471 ?auto_99469 ) ) ( not ( = ?auto_99471 ?auto_99470 ) ) ( IN-CITY ?auto_99472 ?auto_99474 ) ( IN-CITY ?auto_99468 ?auto_99474 ) ( not ( = ?auto_99468 ?auto_99472 ) ) ( OBJ-AT ?auto_99470 ?auto_99468 ) ( OBJ-AT ?auto_99469 ?auto_99472 ) ( TRUCK-AT ?auto_99473 ?auto_99468 ) ( OBJ-AT ?auto_99471 ?auto_99468 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99470 ?auto_99469 ?auto_99468 )
      ( DELIVER-3PKG-VERIFY ?auto_99469 ?auto_99470 ?auto_99471 ?auto_99468 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_100765 - OBJ
      ?auto_100764 - LOCATION
    )
    :vars
    (
      ?auto_100767 - OBJ
      ?auto_100768 - LOCATION
      ?auto_100766 - CITY
      ?auto_100769 - TRUCK
      ?auto_100770 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_100765 ?auto_100767 ) ) ( IN-CITY ?auto_100768 ?auto_100766 ) ( IN-CITY ?auto_100764 ?auto_100766 ) ( not ( = ?auto_100764 ?auto_100768 ) ) ( OBJ-AT ?auto_100767 ?auto_100764 ) ( OBJ-AT ?auto_100765 ?auto_100768 ) ( TRUCK-AT ?auto_100769 ?auto_100770 ) ( IN-CITY ?auto_100770 ?auto_100766 ) ( not ( = ?auto_100764 ?auto_100770 ) ) ( not ( = ?auto_100768 ?auto_100770 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_100769 ?auto_100770 ?auto_100764 ?auto_100766 )
      ( DELIVER-2PKG ?auto_100767 ?auto_100765 ?auto_100764 )
      ( DELIVER-1PKG-VERIFY ?auto_100765 ?auto_100764 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_100772 - OBJ
      ?auto_100773 - OBJ
      ?auto_100771 - LOCATION
    )
    :vars
    (
      ?auto_100776 - LOCATION
      ?auto_100775 - CITY
      ?auto_100777 - TRUCK
      ?auto_100774 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_100773 ?auto_100772 ) ) ( IN-CITY ?auto_100776 ?auto_100775 ) ( IN-CITY ?auto_100771 ?auto_100775 ) ( not ( = ?auto_100771 ?auto_100776 ) ) ( OBJ-AT ?auto_100772 ?auto_100771 ) ( OBJ-AT ?auto_100773 ?auto_100776 ) ( TRUCK-AT ?auto_100777 ?auto_100774 ) ( IN-CITY ?auto_100774 ?auto_100775 ) ( not ( = ?auto_100771 ?auto_100774 ) ) ( not ( = ?auto_100776 ?auto_100774 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_100773 ?auto_100771 )
      ( DELIVER-2PKG-VERIFY ?auto_100772 ?auto_100773 ?auto_100771 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_100787 - OBJ
      ?auto_100788 - OBJ
      ?auto_100786 - LOCATION
    )
    :vars
    (
      ?auto_100789 - LOCATION
      ?auto_100792 - CITY
      ?auto_100790 - TRUCK
      ?auto_100791 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_100788 ?auto_100787 ) ) ( IN-CITY ?auto_100789 ?auto_100792 ) ( IN-CITY ?auto_100786 ?auto_100792 ) ( not ( = ?auto_100786 ?auto_100789 ) ) ( OBJ-AT ?auto_100788 ?auto_100786 ) ( OBJ-AT ?auto_100787 ?auto_100789 ) ( TRUCK-AT ?auto_100790 ?auto_100791 ) ( IN-CITY ?auto_100791 ?auto_100792 ) ( not ( = ?auto_100786 ?auto_100791 ) ) ( not ( = ?auto_100789 ?auto_100791 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100788 ?auto_100787 ?auto_100786 )
      ( DELIVER-2PKG-VERIFY ?auto_100787 ?auto_100788 ?auto_100786 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_107332 - OBJ
      ?auto_107333 - OBJ
      ?auto_107334 - OBJ
      ?auto_107335 - OBJ
      ?auto_107331 - LOCATION
    )
    :vars
    (
      ?auto_107336 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_107333 ?auto_107332 ) ) ( not ( = ?auto_107334 ?auto_107332 ) ) ( not ( = ?auto_107334 ?auto_107333 ) ) ( not ( = ?auto_107335 ?auto_107332 ) ) ( not ( = ?auto_107335 ?auto_107333 ) ) ( not ( = ?auto_107335 ?auto_107334 ) ) ( TRUCK-AT ?auto_107336 ?auto_107331 ) ( IN-TRUCK ?auto_107335 ?auto_107336 ) ( OBJ-AT ?auto_107332 ?auto_107331 ) ( OBJ-AT ?auto_107333 ?auto_107331 ) ( OBJ-AT ?auto_107334 ?auto_107331 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_107335 ?auto_107331 )
      ( DELIVER-4PKG-VERIFY ?auto_107332 ?auto_107333 ?auto_107334 ?auto_107335 ?auto_107331 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_107350 - OBJ
      ?auto_107351 - OBJ
      ?auto_107352 - OBJ
      ?auto_107353 - OBJ
      ?auto_107349 - LOCATION
    )
    :vars
    (
      ?auto_107354 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_107351 ?auto_107350 ) ) ( not ( = ?auto_107352 ?auto_107350 ) ) ( not ( = ?auto_107352 ?auto_107351 ) ) ( not ( = ?auto_107353 ?auto_107350 ) ) ( not ( = ?auto_107353 ?auto_107351 ) ) ( not ( = ?auto_107353 ?auto_107352 ) ) ( TRUCK-AT ?auto_107354 ?auto_107349 ) ( IN-TRUCK ?auto_107352 ?auto_107354 ) ( OBJ-AT ?auto_107350 ?auto_107349 ) ( OBJ-AT ?auto_107351 ?auto_107349 ) ( OBJ-AT ?auto_107353 ?auto_107349 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_107352 ?auto_107349 )
      ( DELIVER-4PKG-VERIFY ?auto_107350 ?auto_107351 ?auto_107352 ?auto_107353 ?auto_107349 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_107438 - OBJ
      ?auto_107439 - OBJ
      ?auto_107440 - OBJ
      ?auto_107441 - OBJ
      ?auto_107437 - LOCATION
    )
    :vars
    (
      ?auto_107442 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_107439 ?auto_107438 ) ) ( not ( = ?auto_107440 ?auto_107438 ) ) ( not ( = ?auto_107440 ?auto_107439 ) ) ( not ( = ?auto_107441 ?auto_107438 ) ) ( not ( = ?auto_107441 ?auto_107439 ) ) ( not ( = ?auto_107441 ?auto_107440 ) ) ( TRUCK-AT ?auto_107442 ?auto_107437 ) ( IN-TRUCK ?auto_107439 ?auto_107442 ) ( OBJ-AT ?auto_107438 ?auto_107437 ) ( OBJ-AT ?auto_107440 ?auto_107437 ) ( OBJ-AT ?auto_107441 ?auto_107437 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_107439 ?auto_107437 )
      ( DELIVER-4PKG-VERIFY ?auto_107438 ?auto_107439 ?auto_107440 ?auto_107441 ?auto_107437 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_107965 - OBJ
      ?auto_107966 - OBJ
      ?auto_107967 - OBJ
      ?auto_107968 - OBJ
      ?auto_107964 - LOCATION
    )
    :vars
    (
      ?auto_107969 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_107966 ?auto_107965 ) ) ( not ( = ?auto_107967 ?auto_107965 ) ) ( not ( = ?auto_107967 ?auto_107966 ) ) ( not ( = ?auto_107968 ?auto_107965 ) ) ( not ( = ?auto_107968 ?auto_107966 ) ) ( not ( = ?auto_107968 ?auto_107967 ) ) ( TRUCK-AT ?auto_107969 ?auto_107964 ) ( IN-TRUCK ?auto_107965 ?auto_107969 ) ( OBJ-AT ?auto_107966 ?auto_107964 ) ( OBJ-AT ?auto_107967 ?auto_107964 ) ( OBJ-AT ?auto_107968 ?auto_107964 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_107965 ?auto_107964 )
      ( DELIVER-4PKG-VERIFY ?auto_107965 ?auto_107966 ?auto_107967 ?auto_107968 ?auto_107964 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_108643 - OBJ
      ?auto_108644 - OBJ
      ?auto_108645 - OBJ
      ?auto_108646 - OBJ
      ?auto_108642 - LOCATION
    )
    :vars
    (
      ?auto_108647 - TRUCK
      ?auto_108649 - LOCATION
      ?auto_108648 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_108644 ?auto_108643 ) ) ( not ( = ?auto_108645 ?auto_108643 ) ) ( not ( = ?auto_108645 ?auto_108644 ) ) ( not ( = ?auto_108646 ?auto_108643 ) ) ( not ( = ?auto_108646 ?auto_108644 ) ) ( not ( = ?auto_108646 ?auto_108645 ) ) ( IN-TRUCK ?auto_108646 ?auto_108647 ) ( TRUCK-AT ?auto_108647 ?auto_108649 ) ( IN-CITY ?auto_108649 ?auto_108648 ) ( IN-CITY ?auto_108642 ?auto_108648 ) ( not ( = ?auto_108642 ?auto_108649 ) ) ( OBJ-AT ?auto_108643 ?auto_108642 ) ( OBJ-AT ?auto_108644 ?auto_108642 ) ( OBJ-AT ?auto_108645 ?auto_108642 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_108643 ?auto_108646 ?auto_108642 )
      ( DELIVER-4PKG-VERIFY ?auto_108643 ?auto_108644 ?auto_108645 ?auto_108646 ?auto_108642 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_108667 - OBJ
      ?auto_108668 - OBJ
      ?auto_108669 - OBJ
      ?auto_108670 - OBJ
      ?auto_108666 - LOCATION
    )
    :vars
    (
      ?auto_108671 - TRUCK
      ?auto_108673 - LOCATION
      ?auto_108672 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_108668 ?auto_108667 ) ) ( not ( = ?auto_108669 ?auto_108667 ) ) ( not ( = ?auto_108669 ?auto_108668 ) ) ( not ( = ?auto_108670 ?auto_108667 ) ) ( not ( = ?auto_108670 ?auto_108668 ) ) ( not ( = ?auto_108670 ?auto_108669 ) ) ( IN-TRUCK ?auto_108669 ?auto_108671 ) ( TRUCK-AT ?auto_108671 ?auto_108673 ) ( IN-CITY ?auto_108673 ?auto_108672 ) ( IN-CITY ?auto_108666 ?auto_108672 ) ( not ( = ?auto_108666 ?auto_108673 ) ) ( OBJ-AT ?auto_108667 ?auto_108666 ) ( OBJ-AT ?auto_108668 ?auto_108666 ) ( OBJ-AT ?auto_108670 ?auto_108666 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_108667 ?auto_108669 ?auto_108666 )
      ( DELIVER-4PKG-VERIFY ?auto_108667 ?auto_108668 ?auto_108669 ?auto_108670 ?auto_108666 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_108781 - OBJ
      ?auto_108782 - OBJ
      ?auto_108783 - OBJ
      ?auto_108784 - OBJ
      ?auto_108780 - LOCATION
    )
    :vars
    (
      ?auto_108785 - TRUCK
      ?auto_108787 - LOCATION
      ?auto_108786 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_108782 ?auto_108781 ) ) ( not ( = ?auto_108783 ?auto_108781 ) ) ( not ( = ?auto_108783 ?auto_108782 ) ) ( not ( = ?auto_108784 ?auto_108781 ) ) ( not ( = ?auto_108784 ?auto_108782 ) ) ( not ( = ?auto_108784 ?auto_108783 ) ) ( IN-TRUCK ?auto_108782 ?auto_108785 ) ( TRUCK-AT ?auto_108785 ?auto_108787 ) ( IN-CITY ?auto_108787 ?auto_108786 ) ( IN-CITY ?auto_108780 ?auto_108786 ) ( not ( = ?auto_108780 ?auto_108787 ) ) ( OBJ-AT ?auto_108781 ?auto_108780 ) ( OBJ-AT ?auto_108783 ?auto_108780 ) ( OBJ-AT ?auto_108784 ?auto_108780 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_108781 ?auto_108782 ?auto_108780 )
      ( DELIVER-4PKG-VERIFY ?auto_108781 ?auto_108782 ?auto_108783 ?auto_108784 ?auto_108780 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_109500 - OBJ
      ?auto_109501 - OBJ
      ?auto_109502 - OBJ
      ?auto_109503 - OBJ
      ?auto_109499 - LOCATION
    )
    :vars
    (
      ?auto_109504 - TRUCK
      ?auto_109506 - LOCATION
      ?auto_109505 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_109501 ?auto_109500 ) ) ( not ( = ?auto_109502 ?auto_109500 ) ) ( not ( = ?auto_109502 ?auto_109501 ) ) ( not ( = ?auto_109503 ?auto_109500 ) ) ( not ( = ?auto_109503 ?auto_109501 ) ) ( not ( = ?auto_109503 ?auto_109502 ) ) ( IN-TRUCK ?auto_109500 ?auto_109504 ) ( TRUCK-AT ?auto_109504 ?auto_109506 ) ( IN-CITY ?auto_109506 ?auto_109505 ) ( IN-CITY ?auto_109499 ?auto_109505 ) ( not ( = ?auto_109499 ?auto_109506 ) ) ( OBJ-AT ?auto_109501 ?auto_109499 ) ( OBJ-AT ?auto_109502 ?auto_109499 ) ( OBJ-AT ?auto_109503 ?auto_109499 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_109501 ?auto_109500 ?auto_109499 )
      ( DELIVER-4PKG-VERIFY ?auto_109500 ?auto_109501 ?auto_109502 ?auto_109503 ?auto_109499 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_110312 - OBJ
      ?auto_110313 - OBJ
      ?auto_110314 - OBJ
      ?auto_110315 - OBJ
      ?auto_110311 - LOCATION
    )
    :vars
    (
      ?auto_110317 - TRUCK
      ?auto_110316 - LOCATION
      ?auto_110318 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_110313 ?auto_110312 ) ) ( not ( = ?auto_110314 ?auto_110312 ) ) ( not ( = ?auto_110314 ?auto_110313 ) ) ( not ( = ?auto_110315 ?auto_110312 ) ) ( not ( = ?auto_110315 ?auto_110313 ) ) ( not ( = ?auto_110315 ?auto_110314 ) ) ( TRUCK-AT ?auto_110317 ?auto_110316 ) ( IN-CITY ?auto_110316 ?auto_110318 ) ( IN-CITY ?auto_110311 ?auto_110318 ) ( not ( = ?auto_110311 ?auto_110316 ) ) ( OBJ-AT ?auto_110312 ?auto_110311 ) ( OBJ-AT ?auto_110315 ?auto_110316 ) ( OBJ-AT ?auto_110313 ?auto_110311 ) ( OBJ-AT ?auto_110314 ?auto_110311 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_110312 ?auto_110315 ?auto_110311 )
      ( DELIVER-4PKG-VERIFY ?auto_110312 ?auto_110313 ?auto_110314 ?auto_110315 ?auto_110311 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_110336 - OBJ
      ?auto_110337 - OBJ
      ?auto_110338 - OBJ
      ?auto_110339 - OBJ
      ?auto_110335 - LOCATION
    )
    :vars
    (
      ?auto_110341 - TRUCK
      ?auto_110340 - LOCATION
      ?auto_110342 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_110337 ?auto_110336 ) ) ( not ( = ?auto_110338 ?auto_110336 ) ) ( not ( = ?auto_110338 ?auto_110337 ) ) ( not ( = ?auto_110339 ?auto_110336 ) ) ( not ( = ?auto_110339 ?auto_110337 ) ) ( not ( = ?auto_110339 ?auto_110338 ) ) ( TRUCK-AT ?auto_110341 ?auto_110340 ) ( IN-CITY ?auto_110340 ?auto_110342 ) ( IN-CITY ?auto_110335 ?auto_110342 ) ( not ( = ?auto_110335 ?auto_110340 ) ) ( OBJ-AT ?auto_110336 ?auto_110335 ) ( OBJ-AT ?auto_110338 ?auto_110340 ) ( OBJ-AT ?auto_110337 ?auto_110335 ) ( OBJ-AT ?auto_110339 ?auto_110335 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_110336 ?auto_110338 ?auto_110335 )
      ( DELIVER-4PKG-VERIFY ?auto_110336 ?auto_110337 ?auto_110338 ?auto_110339 ?auto_110335 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_110450 - OBJ
      ?auto_110451 - OBJ
      ?auto_110452 - OBJ
      ?auto_110453 - OBJ
      ?auto_110449 - LOCATION
    )
    :vars
    (
      ?auto_110455 - TRUCK
      ?auto_110454 - LOCATION
      ?auto_110456 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_110451 ?auto_110450 ) ) ( not ( = ?auto_110452 ?auto_110450 ) ) ( not ( = ?auto_110452 ?auto_110451 ) ) ( not ( = ?auto_110453 ?auto_110450 ) ) ( not ( = ?auto_110453 ?auto_110451 ) ) ( not ( = ?auto_110453 ?auto_110452 ) ) ( TRUCK-AT ?auto_110455 ?auto_110454 ) ( IN-CITY ?auto_110454 ?auto_110456 ) ( IN-CITY ?auto_110449 ?auto_110456 ) ( not ( = ?auto_110449 ?auto_110454 ) ) ( OBJ-AT ?auto_110450 ?auto_110449 ) ( OBJ-AT ?auto_110451 ?auto_110454 ) ( OBJ-AT ?auto_110452 ?auto_110449 ) ( OBJ-AT ?auto_110453 ?auto_110449 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_110450 ?auto_110451 ?auto_110449 )
      ( DELIVER-4PKG-VERIFY ?auto_110450 ?auto_110451 ?auto_110452 ?auto_110453 ?auto_110449 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_111169 - OBJ
      ?auto_111170 - OBJ
      ?auto_111171 - OBJ
      ?auto_111172 - OBJ
      ?auto_111168 - LOCATION
    )
    :vars
    (
      ?auto_111174 - TRUCK
      ?auto_111173 - LOCATION
      ?auto_111175 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_111170 ?auto_111169 ) ) ( not ( = ?auto_111171 ?auto_111169 ) ) ( not ( = ?auto_111171 ?auto_111170 ) ) ( not ( = ?auto_111172 ?auto_111169 ) ) ( not ( = ?auto_111172 ?auto_111170 ) ) ( not ( = ?auto_111172 ?auto_111171 ) ) ( TRUCK-AT ?auto_111174 ?auto_111173 ) ( IN-CITY ?auto_111173 ?auto_111175 ) ( IN-CITY ?auto_111168 ?auto_111175 ) ( not ( = ?auto_111168 ?auto_111173 ) ) ( OBJ-AT ?auto_111170 ?auto_111168 ) ( OBJ-AT ?auto_111169 ?auto_111173 ) ( OBJ-AT ?auto_111171 ?auto_111168 ) ( OBJ-AT ?auto_111172 ?auto_111168 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_111170 ?auto_111169 ?auto_111168 )
      ( DELIVER-4PKG-VERIFY ?auto_111169 ?auto_111170 ?auto_111171 ?auto_111172 ?auto_111168 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_111981 - OBJ
      ?auto_111982 - OBJ
      ?auto_111983 - OBJ
      ?auto_111984 - OBJ
      ?auto_111980 - LOCATION
    )
    :vars
    (
      ?auto_111985 - LOCATION
      ?auto_111987 - CITY
      ?auto_111986 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_111982 ?auto_111981 ) ) ( not ( = ?auto_111983 ?auto_111981 ) ) ( not ( = ?auto_111983 ?auto_111982 ) ) ( not ( = ?auto_111984 ?auto_111981 ) ) ( not ( = ?auto_111984 ?auto_111982 ) ) ( not ( = ?auto_111984 ?auto_111983 ) ) ( IN-CITY ?auto_111985 ?auto_111987 ) ( IN-CITY ?auto_111980 ?auto_111987 ) ( not ( = ?auto_111980 ?auto_111985 ) ) ( OBJ-AT ?auto_111981 ?auto_111980 ) ( OBJ-AT ?auto_111984 ?auto_111985 ) ( TRUCK-AT ?auto_111986 ?auto_111980 ) ( OBJ-AT ?auto_111982 ?auto_111980 ) ( OBJ-AT ?auto_111983 ?auto_111980 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_111981 ?auto_111984 ?auto_111980 )
      ( DELIVER-4PKG-VERIFY ?auto_111981 ?auto_111982 ?auto_111983 ?auto_111984 ?auto_111980 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_112005 - OBJ
      ?auto_112006 - OBJ
      ?auto_112007 - OBJ
      ?auto_112008 - OBJ
      ?auto_112004 - LOCATION
    )
    :vars
    (
      ?auto_112009 - LOCATION
      ?auto_112011 - CITY
      ?auto_112010 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_112006 ?auto_112005 ) ) ( not ( = ?auto_112007 ?auto_112005 ) ) ( not ( = ?auto_112007 ?auto_112006 ) ) ( not ( = ?auto_112008 ?auto_112005 ) ) ( not ( = ?auto_112008 ?auto_112006 ) ) ( not ( = ?auto_112008 ?auto_112007 ) ) ( IN-CITY ?auto_112009 ?auto_112011 ) ( IN-CITY ?auto_112004 ?auto_112011 ) ( not ( = ?auto_112004 ?auto_112009 ) ) ( OBJ-AT ?auto_112005 ?auto_112004 ) ( OBJ-AT ?auto_112007 ?auto_112009 ) ( TRUCK-AT ?auto_112010 ?auto_112004 ) ( OBJ-AT ?auto_112006 ?auto_112004 ) ( OBJ-AT ?auto_112008 ?auto_112004 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_112005 ?auto_112007 ?auto_112004 )
      ( DELIVER-4PKG-VERIFY ?auto_112005 ?auto_112006 ?auto_112007 ?auto_112008 ?auto_112004 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_112119 - OBJ
      ?auto_112120 - OBJ
      ?auto_112121 - OBJ
      ?auto_112122 - OBJ
      ?auto_112118 - LOCATION
    )
    :vars
    (
      ?auto_112123 - LOCATION
      ?auto_112125 - CITY
      ?auto_112124 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_112120 ?auto_112119 ) ) ( not ( = ?auto_112121 ?auto_112119 ) ) ( not ( = ?auto_112121 ?auto_112120 ) ) ( not ( = ?auto_112122 ?auto_112119 ) ) ( not ( = ?auto_112122 ?auto_112120 ) ) ( not ( = ?auto_112122 ?auto_112121 ) ) ( IN-CITY ?auto_112123 ?auto_112125 ) ( IN-CITY ?auto_112118 ?auto_112125 ) ( not ( = ?auto_112118 ?auto_112123 ) ) ( OBJ-AT ?auto_112119 ?auto_112118 ) ( OBJ-AT ?auto_112120 ?auto_112123 ) ( TRUCK-AT ?auto_112124 ?auto_112118 ) ( OBJ-AT ?auto_112121 ?auto_112118 ) ( OBJ-AT ?auto_112122 ?auto_112118 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_112119 ?auto_112120 ?auto_112118 )
      ( DELIVER-4PKG-VERIFY ?auto_112119 ?auto_112120 ?auto_112121 ?auto_112122 ?auto_112118 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_112838 - OBJ
      ?auto_112839 - OBJ
      ?auto_112840 - OBJ
      ?auto_112841 - OBJ
      ?auto_112837 - LOCATION
    )
    :vars
    (
      ?auto_112842 - LOCATION
      ?auto_112844 - CITY
      ?auto_112843 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_112839 ?auto_112838 ) ) ( not ( = ?auto_112840 ?auto_112838 ) ) ( not ( = ?auto_112840 ?auto_112839 ) ) ( not ( = ?auto_112841 ?auto_112838 ) ) ( not ( = ?auto_112841 ?auto_112839 ) ) ( not ( = ?auto_112841 ?auto_112840 ) ) ( IN-CITY ?auto_112842 ?auto_112844 ) ( IN-CITY ?auto_112837 ?auto_112844 ) ( not ( = ?auto_112837 ?auto_112842 ) ) ( OBJ-AT ?auto_112839 ?auto_112837 ) ( OBJ-AT ?auto_112838 ?auto_112842 ) ( TRUCK-AT ?auto_112843 ?auto_112837 ) ( OBJ-AT ?auto_112840 ?auto_112837 ) ( OBJ-AT ?auto_112841 ?auto_112837 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_112839 ?auto_112838 ?auto_112837 )
      ( DELIVER-4PKG-VERIFY ?auto_112838 ?auto_112839 ?auto_112840 ?auto_112841 ?auto_112837 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_115133 - OBJ
      ?auto_115134 - OBJ
      ?auto_115135 - OBJ
      ?auto_115132 - LOCATION
    )
    :vars
    (
      ?auto_115138 - LOCATION
      ?auto_115137 - CITY
      ?auto_115139 - TRUCK
      ?auto_115136 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_115134 ?auto_115133 ) ) ( not ( = ?auto_115135 ?auto_115133 ) ) ( not ( = ?auto_115135 ?auto_115134 ) ) ( IN-CITY ?auto_115138 ?auto_115137 ) ( IN-CITY ?auto_115132 ?auto_115137 ) ( not ( = ?auto_115132 ?auto_115138 ) ) ( OBJ-AT ?auto_115133 ?auto_115132 ) ( OBJ-AT ?auto_115135 ?auto_115138 ) ( TRUCK-AT ?auto_115139 ?auto_115136 ) ( IN-CITY ?auto_115136 ?auto_115137 ) ( not ( = ?auto_115132 ?auto_115136 ) ) ( not ( = ?auto_115138 ?auto_115136 ) ) ( OBJ-AT ?auto_115134 ?auto_115132 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115133 ?auto_115135 ?auto_115132 )
      ( DELIVER-3PKG-VERIFY ?auto_115133 ?auto_115134 ?auto_115135 ?auto_115132 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_115157 - OBJ
      ?auto_115158 - OBJ
      ?auto_115159 - OBJ
      ?auto_115156 - LOCATION
    )
    :vars
    (
      ?auto_115162 - LOCATION
      ?auto_115161 - CITY
      ?auto_115163 - TRUCK
      ?auto_115160 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_115158 ?auto_115157 ) ) ( not ( = ?auto_115159 ?auto_115157 ) ) ( not ( = ?auto_115159 ?auto_115158 ) ) ( IN-CITY ?auto_115162 ?auto_115161 ) ( IN-CITY ?auto_115156 ?auto_115161 ) ( not ( = ?auto_115156 ?auto_115162 ) ) ( OBJ-AT ?auto_115157 ?auto_115156 ) ( OBJ-AT ?auto_115158 ?auto_115162 ) ( TRUCK-AT ?auto_115163 ?auto_115160 ) ( IN-CITY ?auto_115160 ?auto_115161 ) ( not ( = ?auto_115156 ?auto_115160 ) ) ( not ( = ?auto_115162 ?auto_115160 ) ) ( OBJ-AT ?auto_115159 ?auto_115156 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115157 ?auto_115158 ?auto_115156 )
      ( DELIVER-3PKG-VERIFY ?auto_115157 ?auto_115158 ?auto_115159 ?auto_115156 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_115303 - OBJ
      ?auto_115304 - OBJ
      ?auto_115305 - OBJ
      ?auto_115302 - LOCATION
    )
    :vars
    (
      ?auto_115308 - LOCATION
      ?auto_115307 - CITY
      ?auto_115309 - TRUCK
      ?auto_115306 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_115304 ?auto_115303 ) ) ( not ( = ?auto_115305 ?auto_115303 ) ) ( not ( = ?auto_115305 ?auto_115304 ) ) ( IN-CITY ?auto_115308 ?auto_115307 ) ( IN-CITY ?auto_115302 ?auto_115307 ) ( not ( = ?auto_115302 ?auto_115308 ) ) ( OBJ-AT ?auto_115304 ?auto_115302 ) ( OBJ-AT ?auto_115303 ?auto_115308 ) ( TRUCK-AT ?auto_115309 ?auto_115306 ) ( IN-CITY ?auto_115306 ?auto_115307 ) ( not ( = ?auto_115302 ?auto_115306 ) ) ( not ( = ?auto_115308 ?auto_115306 ) ) ( OBJ-AT ?auto_115305 ?auto_115302 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115304 ?auto_115303 ?auto_115302 )
      ( DELIVER-3PKG-VERIFY ?auto_115303 ?auto_115304 ?auto_115305 ?auto_115302 ) )
  )

)

