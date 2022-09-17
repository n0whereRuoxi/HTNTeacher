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
      ?auto_20742 - OBJ
      ?auto_20743 - LOCATION
    )
    :vars
    (
      ?auto_20744 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_20744 ?auto_20743 ) ( IN-TRUCK ?auto_20742 ?auto_20744 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_20742 ?auto_20744 ?auto_20743 )
      ( DELIVER-1PKG-VERIFY ?auto_20742 ?auto_20743 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_20760 - OBJ
      ?auto_20761 - LOCATION
    )
    :vars
    (
      ?auto_20762 - TRUCK
      ?auto_20766 - LOCATION
      ?auto_20767 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_20760 ?auto_20762 ) ( TRUCK-AT ?auto_20762 ?auto_20766 ) ( IN-CITY ?auto_20766 ?auto_20767 ) ( IN-CITY ?auto_20761 ?auto_20767 ) ( not ( = ?auto_20761 ?auto_20766 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_20762 ?auto_20766 ?auto_20761 ?auto_20767 )
      ( DELIVER-1PKG ?auto_20760 ?auto_20761 )
      ( DELIVER-1PKG-VERIFY ?auto_20760 ?auto_20761 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_20786 - OBJ
      ?auto_20787 - LOCATION
    )
    :vars
    (
      ?auto_20790 - TRUCK
      ?auto_20792 - LOCATION
      ?auto_20788 - CITY
      ?auto_20794 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_20790 ?auto_20792 ) ( IN-CITY ?auto_20792 ?auto_20788 ) ( IN-CITY ?auto_20787 ?auto_20788 ) ( not ( = ?auto_20787 ?auto_20792 ) ) ( TRUCK-AT ?auto_20790 ?auto_20794 ) ( OBJ-AT ?auto_20786 ?auto_20794 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_20786 ?auto_20790 ?auto_20794 )
      ( DELIVER-1PKG ?auto_20786 ?auto_20787 )
      ( DELIVER-1PKG-VERIFY ?auto_20786 ?auto_20787 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_20815 - OBJ
      ?auto_20816 - LOCATION
    )
    :vars
    (
      ?auto_20820 - LOCATION
      ?auto_20821 - CITY
      ?auto_20817 - TRUCK
      ?auto_20824 - LOCATION
      ?auto_20825 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_20820 ?auto_20821 ) ( IN-CITY ?auto_20816 ?auto_20821 ) ( not ( = ?auto_20816 ?auto_20820 ) ) ( OBJ-AT ?auto_20815 ?auto_20820 ) ( TRUCK-AT ?auto_20817 ?auto_20824 ) ( IN-CITY ?auto_20824 ?auto_20825 ) ( IN-CITY ?auto_20820 ?auto_20825 ) ( not ( = ?auto_20820 ?auto_20824 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_20817 ?auto_20824 ?auto_20820 ?auto_20825 )
      ( DELIVER-1PKG ?auto_20815 ?auto_20816 )
      ( DELIVER-1PKG-VERIFY ?auto_20815 ?auto_20816 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_20892 - OBJ
      ?auto_20894 - OBJ
      ?auto_20893 - LOCATION
    )
    :vars
    (
      ?auto_20895 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_20894 ?auto_20892 ) ( TRUCK-AT ?auto_20895 ?auto_20893 ) ( IN-TRUCK ?auto_20894 ?auto_20895 ) ( OBJ-AT ?auto_20892 ?auto_20893 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_20894 ?auto_20893 )
      ( DELIVER-2PKG-VERIFY ?auto_20892 ?auto_20894 ?auto_20893 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_20968 - OBJ
      ?auto_20970 - OBJ
      ?auto_20969 - LOCATION
    )
    :vars
    (
      ?auto_20972 - TRUCK
      ?auto_20975 - LOCATION
      ?auto_20971 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_20970 ?auto_20968 ) ( IN-TRUCK ?auto_20970 ?auto_20972 ) ( TRUCK-AT ?auto_20972 ?auto_20975 ) ( IN-CITY ?auto_20975 ?auto_20971 ) ( IN-CITY ?auto_20969 ?auto_20971 ) ( not ( = ?auto_20969 ?auto_20975 ) ) ( OBJ-AT ?auto_20968 ?auto_20969 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_20970 ?auto_20969 )
      ( DELIVER-2PKG-VERIFY ?auto_20968 ?auto_20970 ?auto_20969 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_21064 - OBJ
      ?auto_21065 - LOCATION
    )
    :vars
    (
      ?auto_21071 - OBJ
      ?auto_21070 - TRUCK
      ?auto_21068 - LOCATION
      ?auto_21069 - CITY
      ?auto_21073 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_21064 ?auto_21071 ) ( TRUCK-AT ?auto_21070 ?auto_21068 ) ( IN-CITY ?auto_21068 ?auto_21069 ) ( IN-CITY ?auto_21065 ?auto_21069 ) ( not ( = ?auto_21065 ?auto_21068 ) ) ( OBJ-AT ?auto_21071 ?auto_21065 ) ( TRUCK-AT ?auto_21070 ?auto_21073 ) ( OBJ-AT ?auto_21064 ?auto_21073 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_21064 ?auto_21070 ?auto_21073 )
      ( DELIVER-2PKG ?auto_21071 ?auto_21064 ?auto_21065 )
      ( DELIVER-1PKG-VERIFY ?auto_21064 ?auto_21065 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_21075 - OBJ
      ?auto_21077 - OBJ
      ?auto_21076 - LOCATION
    )
    :vars
    (
      ?auto_21082 - OBJ
      ?auto_21078 - TRUCK
      ?auto_21080 - LOCATION
      ?auto_21083 - CITY
      ?auto_21081 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_21077 ?auto_21075 ) ( GREATER-THAN ?auto_21077 ?auto_21082 ) ( TRUCK-AT ?auto_21078 ?auto_21080 ) ( IN-CITY ?auto_21080 ?auto_21083 ) ( IN-CITY ?auto_21076 ?auto_21083 ) ( not ( = ?auto_21076 ?auto_21080 ) ) ( OBJ-AT ?auto_21082 ?auto_21076 ) ( TRUCK-AT ?auto_21078 ?auto_21081 ) ( OBJ-AT ?auto_21077 ?auto_21081 ) ( OBJ-AT ?auto_21075 ?auto_21076 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_21077 ?auto_21076 )
      ( DELIVER-2PKG-VERIFY ?auto_21075 ?auto_21077 ?auto_21076 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_21191 - OBJ
      ?auto_21192 - LOCATION
    )
    :vars
    (
      ?auto_21198 - OBJ
      ?auto_21199 - OBJ
      ?auto_21200 - LOCATION
      ?auto_21196 - CITY
      ?auto_21195 - TRUCK
      ?auto_21202 - LOCATION
      ?auto_21203 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_21191 ?auto_21198 ) ( GREATER-THAN ?auto_21191 ?auto_21199 ) ( IN-CITY ?auto_21200 ?auto_21196 ) ( IN-CITY ?auto_21192 ?auto_21196 ) ( not ( = ?auto_21192 ?auto_21200 ) ) ( OBJ-AT ?auto_21199 ?auto_21192 ) ( OBJ-AT ?auto_21191 ?auto_21200 ) ( OBJ-AT ?auto_21198 ?auto_21192 ) ( TRUCK-AT ?auto_21195 ?auto_21202 ) ( IN-CITY ?auto_21202 ?auto_21203 ) ( IN-CITY ?auto_21200 ?auto_21203 ) ( not ( = ?auto_21200 ?auto_21202 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_21195 ?auto_21202 ?auto_21200 ?auto_21203 )
      ( DELIVER-2PKG ?auto_21198 ?auto_21191 ?auto_21192 )
      ( DELIVER-1PKG-VERIFY ?auto_21191 ?auto_21192 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_21205 - OBJ
      ?auto_21207 - OBJ
      ?auto_21206 - LOCATION
    )
    :vars
    (
      ?auto_21208 - OBJ
      ?auto_21211 - OBJ
      ?auto_21216 - LOCATION
      ?auto_21215 - CITY
      ?auto_21214 - TRUCK
      ?auto_21210 - LOCATION
      ?auto_21209 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_21207 ?auto_21205 ) ( GREATER-THAN ?auto_21207 ?auto_21208 ) ( GREATER-THAN ?auto_21207 ?auto_21211 ) ( IN-CITY ?auto_21216 ?auto_21215 ) ( IN-CITY ?auto_21206 ?auto_21215 ) ( not ( = ?auto_21206 ?auto_21216 ) ) ( OBJ-AT ?auto_21211 ?auto_21206 ) ( OBJ-AT ?auto_21207 ?auto_21216 ) ( OBJ-AT ?auto_21208 ?auto_21206 ) ( TRUCK-AT ?auto_21214 ?auto_21210 ) ( IN-CITY ?auto_21210 ?auto_21209 ) ( IN-CITY ?auto_21216 ?auto_21209 ) ( not ( = ?auto_21216 ?auto_21210 ) ) ( OBJ-AT ?auto_21205 ?auto_21206 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_21207 ?auto_21206 )
      ( DELIVER-2PKG-VERIFY ?auto_21205 ?auto_21207 ?auto_21206 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_21341 - OBJ
      ?auto_21342 - LOCATION
    )
    :vars
    (
      ?auto_21350 - OBJ
      ?auto_21347 - LOCATION
      ?auto_21343 - CITY
      ?auto_21352 - TRUCK
      ?auto_21349 - LOCATION
      ?auto_21344 - CITY
      ?auto_21353 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_21341 ?auto_21350 ) ( IN-CITY ?auto_21347 ?auto_21343 ) ( IN-CITY ?auto_21342 ?auto_21343 ) ( not ( = ?auto_21342 ?auto_21347 ) ) ( OBJ-AT ?auto_21341 ?auto_21347 ) ( TRUCK-AT ?auto_21352 ?auto_21349 ) ( IN-CITY ?auto_21349 ?auto_21344 ) ( IN-CITY ?auto_21347 ?auto_21344 ) ( not ( = ?auto_21347 ?auto_21349 ) ) ( TRUCK-AT ?auto_21353 ?auto_21342 ) ( IN-TRUCK ?auto_21350 ?auto_21353 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_21350 ?auto_21342 )
      ( DELIVER-2PKG ?auto_21350 ?auto_21341 ?auto_21342 )
      ( DELIVER-1PKG-VERIFY ?auto_21341 ?auto_21342 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_21356 - OBJ
      ?auto_21358 - OBJ
      ?auto_21357 - LOCATION
    )
    :vars
    (
      ?auto_21366 - LOCATION
      ?auto_21363 - CITY
      ?auto_21364 - TRUCK
      ?auto_21362 - LOCATION
      ?auto_21365 - CITY
      ?auto_21361 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_21358 ?auto_21356 ) ( IN-CITY ?auto_21366 ?auto_21363 ) ( IN-CITY ?auto_21357 ?auto_21363 ) ( not ( = ?auto_21357 ?auto_21366 ) ) ( OBJ-AT ?auto_21358 ?auto_21366 ) ( TRUCK-AT ?auto_21364 ?auto_21362 ) ( IN-CITY ?auto_21362 ?auto_21365 ) ( IN-CITY ?auto_21366 ?auto_21365 ) ( not ( = ?auto_21366 ?auto_21362 ) ) ( TRUCK-AT ?auto_21361 ?auto_21357 ) ( IN-TRUCK ?auto_21356 ?auto_21361 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_21358 ?auto_21357 )
      ( DELIVER-2PKG-VERIFY ?auto_21356 ?auto_21358 ?auto_21357 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_21483 - OBJ
      ?auto_21484 - LOCATION
    )
    :vars
    (
      ?auto_21487 - OBJ
      ?auto_21489 - LOCATION
      ?auto_21493 - CITY
      ?auto_21486 - CITY
      ?auto_21485 - TRUCK
      ?auto_21495 - LOCATION
      ?auto_21496 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_21483 ?auto_21487 ) ( IN-CITY ?auto_21489 ?auto_21493 ) ( IN-CITY ?auto_21484 ?auto_21493 ) ( not ( = ?auto_21484 ?auto_21489 ) ) ( OBJ-AT ?auto_21483 ?auto_21489 ) ( IN-CITY ?auto_21484 ?auto_21486 ) ( IN-CITY ?auto_21489 ?auto_21486 ) ( IN-TRUCK ?auto_21487 ?auto_21485 ) ( TRUCK-AT ?auto_21485 ?auto_21495 ) ( IN-CITY ?auto_21495 ?auto_21496 ) ( IN-CITY ?auto_21484 ?auto_21496 ) ( not ( = ?auto_21484 ?auto_21495 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_21485 ?auto_21495 ?auto_21484 ?auto_21496 )
      ( DELIVER-2PKG ?auto_21487 ?auto_21483 ?auto_21484 )
      ( DELIVER-1PKG-VERIFY ?auto_21483 ?auto_21484 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_21498 - OBJ
      ?auto_21500 - OBJ
      ?auto_21499 - LOCATION
    )
    :vars
    (
      ?auto_21509 - LOCATION
      ?auto_21504 - CITY
      ?auto_21503 - CITY
      ?auto_21502 - TRUCK
      ?auto_21506 - LOCATION
      ?auto_21507 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_21500 ?auto_21498 ) ( IN-CITY ?auto_21509 ?auto_21504 ) ( IN-CITY ?auto_21499 ?auto_21504 ) ( not ( = ?auto_21499 ?auto_21509 ) ) ( OBJ-AT ?auto_21500 ?auto_21509 ) ( IN-CITY ?auto_21499 ?auto_21503 ) ( IN-CITY ?auto_21509 ?auto_21503 ) ( IN-TRUCK ?auto_21498 ?auto_21502 ) ( TRUCK-AT ?auto_21502 ?auto_21506 ) ( IN-CITY ?auto_21506 ?auto_21507 ) ( IN-CITY ?auto_21499 ?auto_21507 ) ( not ( = ?auto_21499 ?auto_21506 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_21500 ?auto_21499 )
      ( DELIVER-2PKG-VERIFY ?auto_21498 ?auto_21500 ?auto_21499 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_21625 - OBJ
      ?auto_21626 - LOCATION
    )
    :vars
    (
      ?auto_21630 - OBJ
      ?auto_21627 - LOCATION
      ?auto_21635 - CITY
      ?auto_21634 - CITY
      ?auto_21629 - TRUCK
      ?auto_21633 - LOCATION
      ?auto_21628 - CITY
      ?auto_21637 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_21625 ?auto_21630 ) ( IN-CITY ?auto_21627 ?auto_21635 ) ( IN-CITY ?auto_21626 ?auto_21635 ) ( not ( = ?auto_21626 ?auto_21627 ) ) ( OBJ-AT ?auto_21625 ?auto_21627 ) ( IN-CITY ?auto_21626 ?auto_21634 ) ( IN-CITY ?auto_21627 ?auto_21634 ) ( TRUCK-AT ?auto_21629 ?auto_21633 ) ( IN-CITY ?auto_21633 ?auto_21628 ) ( IN-CITY ?auto_21626 ?auto_21628 ) ( not ( = ?auto_21626 ?auto_21633 ) ) ( TRUCK-AT ?auto_21629 ?auto_21637 ) ( OBJ-AT ?auto_21630 ?auto_21637 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_21630 ?auto_21629 ?auto_21637 )
      ( DELIVER-2PKG ?auto_21630 ?auto_21625 ?auto_21626 )
      ( DELIVER-1PKG-VERIFY ?auto_21625 ?auto_21626 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_21639 - OBJ
      ?auto_21641 - OBJ
      ?auto_21640 - LOCATION
    )
    :vars
    (
      ?auto_21650 - LOCATION
      ?auto_21651 - CITY
      ?auto_21648 - CITY
      ?auto_21645 - TRUCK
      ?auto_21646 - LOCATION
      ?auto_21647 - CITY
      ?auto_21644 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_21641 ?auto_21639 ) ( IN-CITY ?auto_21650 ?auto_21651 ) ( IN-CITY ?auto_21640 ?auto_21651 ) ( not ( = ?auto_21640 ?auto_21650 ) ) ( OBJ-AT ?auto_21641 ?auto_21650 ) ( IN-CITY ?auto_21640 ?auto_21648 ) ( IN-CITY ?auto_21650 ?auto_21648 ) ( TRUCK-AT ?auto_21645 ?auto_21646 ) ( IN-CITY ?auto_21646 ?auto_21647 ) ( IN-CITY ?auto_21640 ?auto_21647 ) ( not ( = ?auto_21640 ?auto_21646 ) ) ( TRUCK-AT ?auto_21645 ?auto_21644 ) ( OBJ-AT ?auto_21639 ?auto_21644 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_21641 ?auto_21640 )
      ( DELIVER-2PKG-VERIFY ?auto_21639 ?auto_21641 ?auto_21640 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_22017 - OBJ
      ?auto_22019 - OBJ
      ?auto_22020 - OBJ
      ?auto_22018 - LOCATION
    )
    :vars
    (
      ?auto_22022 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_22019 ?auto_22017 ) ( GREATER-THAN ?auto_22020 ?auto_22017 ) ( GREATER-THAN ?auto_22020 ?auto_22019 ) ( TRUCK-AT ?auto_22022 ?auto_22018 ) ( IN-TRUCK ?auto_22020 ?auto_22022 ) ( OBJ-AT ?auto_22017 ?auto_22018 ) ( OBJ-AT ?auto_22019 ?auto_22018 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_22020 ?auto_22018 )
      ( DELIVER-3PKG-VERIFY ?auto_22017 ?auto_22019 ?auto_22020 ?auto_22018 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_22200 - OBJ
      ?auto_22202 - OBJ
      ?auto_22203 - OBJ
      ?auto_22201 - LOCATION
    )
    :vars
    (
      ?auto_22207 - OBJ
      ?auto_22205 - TRUCK
      ?auto_22204 - LOCATION
      ?auto_22209 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_22202 ?auto_22200 ) ( GREATER-THAN ?auto_22203 ?auto_22200 ) ( GREATER-THAN ?auto_22203 ?auto_22202 ) ( GREATER-THAN ?auto_22203 ?auto_22207 ) ( IN-TRUCK ?auto_22203 ?auto_22205 ) ( TRUCK-AT ?auto_22205 ?auto_22204 ) ( IN-CITY ?auto_22204 ?auto_22209 ) ( IN-CITY ?auto_22201 ?auto_22209 ) ( not ( = ?auto_22201 ?auto_22204 ) ) ( OBJ-AT ?auto_22207 ?auto_22201 ) ( OBJ-AT ?auto_22200 ?auto_22201 ) ( OBJ-AT ?auto_22202 ?auto_22201 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_22207 ?auto_22203 ?auto_22201 )
      ( DELIVER-3PKG-VERIFY ?auto_22200 ?auto_22202 ?auto_22203 ?auto_22201 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_22449 - OBJ
      ?auto_22451 - OBJ
      ?auto_22452 - OBJ
      ?auto_22450 - LOCATION
    )
    :vars
    (
      ?auto_22454 - OBJ
      ?auto_22455 - OBJ
      ?auto_22456 - TRUCK
      ?auto_22460 - LOCATION
      ?auto_22459 - CITY
      ?auto_22458 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_22451 ?auto_22449 ) ( GREATER-THAN ?auto_22452 ?auto_22449 ) ( GREATER-THAN ?auto_22452 ?auto_22451 ) ( GREATER-THAN ?auto_22452 ?auto_22454 ) ( GREATER-THAN ?auto_22452 ?auto_22455 ) ( TRUCK-AT ?auto_22456 ?auto_22460 ) ( IN-CITY ?auto_22460 ?auto_22459 ) ( IN-CITY ?auto_22450 ?auto_22459 ) ( not ( = ?auto_22450 ?auto_22460 ) ) ( OBJ-AT ?auto_22455 ?auto_22450 ) ( TRUCK-AT ?auto_22456 ?auto_22458 ) ( OBJ-AT ?auto_22452 ?auto_22458 ) ( OBJ-AT ?auto_22454 ?auto_22450 ) ( OBJ-AT ?auto_22449 ?auto_22450 ) ( OBJ-AT ?auto_22451 ?auto_22450 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_22454 ?auto_22452 ?auto_22450 )
      ( DELIVER-3PKG-VERIFY ?auto_22449 ?auto_22451 ?auto_22452 ?auto_22450 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_22747 - OBJ
      ?auto_22749 - OBJ
      ?auto_22750 - OBJ
      ?auto_22748 - LOCATION
    )
    :vars
    (
      ?auto_22754 - OBJ
      ?auto_22759 - OBJ
      ?auto_22752 - OBJ
      ?auto_22758 - LOCATION
      ?auto_22756 - CITY
      ?auto_22751 - TRUCK
      ?auto_22757 - LOCATION
      ?auto_22760 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_22749 ?auto_22747 ) ( GREATER-THAN ?auto_22750 ?auto_22747 ) ( GREATER-THAN ?auto_22750 ?auto_22749 ) ( GREATER-THAN ?auto_22750 ?auto_22754 ) ( GREATER-THAN ?auto_22750 ?auto_22759 ) ( GREATER-THAN ?auto_22750 ?auto_22752 ) ( IN-CITY ?auto_22758 ?auto_22756 ) ( IN-CITY ?auto_22748 ?auto_22756 ) ( not ( = ?auto_22748 ?auto_22758 ) ) ( OBJ-AT ?auto_22752 ?auto_22748 ) ( OBJ-AT ?auto_22750 ?auto_22758 ) ( OBJ-AT ?auto_22759 ?auto_22748 ) ( TRUCK-AT ?auto_22751 ?auto_22757 ) ( IN-CITY ?auto_22757 ?auto_22760 ) ( IN-CITY ?auto_22758 ?auto_22760 ) ( not ( = ?auto_22758 ?auto_22757 ) ) ( OBJ-AT ?auto_22754 ?auto_22748 ) ( OBJ-AT ?auto_22747 ?auto_22748 ) ( OBJ-AT ?auto_22749 ?auto_22748 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_22754 ?auto_22750 ?auto_22748 )
      ( DELIVER-3PKG-VERIFY ?auto_22747 ?auto_22749 ?auto_22750 ?auto_22748 ) )
  )

)

