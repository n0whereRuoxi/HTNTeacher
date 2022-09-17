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
      ?auto_233359 - OBJ
      ?auto_233358 - LOCATION
    )
    :vars
    (
      ?auto_233361 - LOCATION
      ?auto_233362 - CITY
      ?auto_233360 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_233361 ?auto_233362 ) ( IN-CITY ?auto_233358 ?auto_233362 ) ( not ( = ?auto_233358 ?auto_233361 ) ) ( OBJ-AT ?auto_233359 ?auto_233361 ) ( TRUCK-AT ?auto_233360 ?auto_233358 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_233360 ?auto_233358 ?auto_233361 ?auto_233362 )
      ( !LOAD-TRUCK ?auto_233359 ?auto_233360 ?auto_233361 )
      ( !DRIVE-TRUCK ?auto_233360 ?auto_233361 ?auto_233358 ?auto_233362 )
      ( !UNLOAD-TRUCK ?auto_233359 ?auto_233360 ?auto_233358 )
      ( DELIVER-1PKG-VERIFY ?auto_233359 ?auto_233358 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_233380 - OBJ
      ?auto_233381 - OBJ
      ?auto_233379 - LOCATION
    )
    :vars
    (
      ?auto_233382 - LOCATION
      ?auto_233383 - CITY
      ?auto_233385 - LOCATION
      ?auto_233384 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_233382 ?auto_233383 ) ( IN-CITY ?auto_233379 ?auto_233383 ) ( not ( = ?auto_233379 ?auto_233382 ) ) ( OBJ-AT ?auto_233381 ?auto_233382 ) ( IN-CITY ?auto_233385 ?auto_233383 ) ( not ( = ?auto_233379 ?auto_233385 ) ) ( OBJ-AT ?auto_233380 ?auto_233385 ) ( TRUCK-AT ?auto_233384 ?auto_233379 ) ( not ( = ?auto_233380 ?auto_233381 ) ) ( not ( = ?auto_233382 ?auto_233385 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_233380 ?auto_233379 )
      ( DELIVER-1PKG ?auto_233381 ?auto_233379 )
      ( DELIVER-2PKG-VERIFY ?auto_233380 ?auto_233381 ?auto_233379 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_233490 - OBJ
      ?auto_233491 - OBJ
      ?auto_233492 - OBJ
      ?auto_233489 - LOCATION
    )
    :vars
    (
      ?auto_233493 - LOCATION
      ?auto_233494 - CITY
      ?auto_233496 - LOCATION
      ?auto_233495 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_233493 ?auto_233494 ) ( IN-CITY ?auto_233489 ?auto_233494 ) ( not ( = ?auto_233489 ?auto_233493 ) ) ( OBJ-AT ?auto_233492 ?auto_233493 ) ( IN-CITY ?auto_233496 ?auto_233494 ) ( not ( = ?auto_233489 ?auto_233496 ) ) ( OBJ-AT ?auto_233491 ?auto_233496 ) ( OBJ-AT ?auto_233490 ?auto_233493 ) ( TRUCK-AT ?auto_233495 ?auto_233489 ) ( not ( = ?auto_233490 ?auto_233491 ) ) ( not ( = ?auto_233496 ?auto_233493 ) ) ( not ( = ?auto_233490 ?auto_233492 ) ) ( not ( = ?auto_233491 ?auto_233492 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_233490 ?auto_233491 ?auto_233489 )
      ( DELIVER-1PKG ?auto_233492 ?auto_233489 )
      ( DELIVER-3PKG-VERIFY ?auto_233490 ?auto_233491 ?auto_233492 ?auto_233489 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_233507 - OBJ
      ?auto_233508 - OBJ
      ?auto_233509 - OBJ
      ?auto_233506 - LOCATION
    )
    :vars
    (
      ?auto_233510 - LOCATION
      ?auto_233511 - CITY
      ?auto_233513 - LOCATION
      ?auto_233512 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_233510 ?auto_233511 ) ( IN-CITY ?auto_233506 ?auto_233511 ) ( not ( = ?auto_233506 ?auto_233510 ) ) ( OBJ-AT ?auto_233508 ?auto_233510 ) ( IN-CITY ?auto_233513 ?auto_233511 ) ( not ( = ?auto_233506 ?auto_233513 ) ) ( OBJ-AT ?auto_233509 ?auto_233513 ) ( OBJ-AT ?auto_233507 ?auto_233510 ) ( TRUCK-AT ?auto_233512 ?auto_233506 ) ( not ( = ?auto_233507 ?auto_233509 ) ) ( not ( = ?auto_233513 ?auto_233510 ) ) ( not ( = ?auto_233507 ?auto_233508 ) ) ( not ( = ?auto_233509 ?auto_233508 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_233507 ?auto_233509 ?auto_233508 ?auto_233506 )
      ( DELIVER-3PKG-VERIFY ?auto_233507 ?auto_233508 ?auto_233509 ?auto_233506 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_233524 - OBJ
      ?auto_233525 - OBJ
      ?auto_233526 - OBJ
      ?auto_233523 - LOCATION
    )
    :vars
    (
      ?auto_233530 - LOCATION
      ?auto_233529 - CITY
      ?auto_233527 - LOCATION
      ?auto_233528 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_233530 ?auto_233529 ) ( IN-CITY ?auto_233523 ?auto_233529 ) ( not ( = ?auto_233523 ?auto_233530 ) ) ( OBJ-AT ?auto_233526 ?auto_233530 ) ( IN-CITY ?auto_233527 ?auto_233529 ) ( not ( = ?auto_233523 ?auto_233527 ) ) ( OBJ-AT ?auto_233524 ?auto_233527 ) ( OBJ-AT ?auto_233525 ?auto_233530 ) ( TRUCK-AT ?auto_233528 ?auto_233523 ) ( not ( = ?auto_233525 ?auto_233524 ) ) ( not ( = ?auto_233527 ?auto_233530 ) ) ( not ( = ?auto_233525 ?auto_233526 ) ) ( not ( = ?auto_233524 ?auto_233526 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_233525 ?auto_233526 ?auto_233524 ?auto_233523 )
      ( DELIVER-3PKG-VERIFY ?auto_233524 ?auto_233525 ?auto_233526 ?auto_233523 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234610 - OBJ
      ?auto_234611 - OBJ
      ?auto_234612 - OBJ
      ?auto_234613 - OBJ
      ?auto_234609 - LOCATION
    )
    :vars
    (
      ?auto_234614 - LOCATION
      ?auto_234616 - CITY
      ?auto_234617 - LOCATION
      ?auto_234615 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_234614 ?auto_234616 ) ( IN-CITY ?auto_234609 ?auto_234616 ) ( not ( = ?auto_234609 ?auto_234614 ) ) ( OBJ-AT ?auto_234613 ?auto_234614 ) ( OBJ-AT ?auto_234612 ?auto_234614 ) ( IN-CITY ?auto_234617 ?auto_234616 ) ( not ( = ?auto_234609 ?auto_234617 ) ) ( OBJ-AT ?auto_234611 ?auto_234617 ) ( OBJ-AT ?auto_234610 ?auto_234614 ) ( TRUCK-AT ?auto_234615 ?auto_234609 ) ( not ( = ?auto_234610 ?auto_234611 ) ) ( not ( = ?auto_234617 ?auto_234614 ) ) ( not ( = ?auto_234610 ?auto_234612 ) ) ( not ( = ?auto_234611 ?auto_234612 ) ) ( not ( = ?auto_234610 ?auto_234613 ) ) ( not ( = ?auto_234611 ?auto_234613 ) ) ( not ( = ?auto_234612 ?auto_234613 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_234610 ?auto_234612 ?auto_234611 ?auto_234609 )
      ( DELIVER-1PKG ?auto_234613 ?auto_234609 )
      ( DELIVER-4PKG-VERIFY ?auto_234610 ?auto_234611 ?auto_234612 ?auto_234613 ?auto_234609 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234664 - OBJ
      ?auto_234665 - OBJ
      ?auto_234666 - OBJ
      ?auto_234667 - OBJ
      ?auto_234663 - LOCATION
    )
    :vars
    (
      ?auto_234670 - LOCATION
      ?auto_234671 - CITY
      ?auto_234669 - LOCATION
      ?auto_234668 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_234670 ?auto_234671 ) ( IN-CITY ?auto_234663 ?auto_234671 ) ( not ( = ?auto_234663 ?auto_234670 ) ) ( OBJ-AT ?auto_234667 ?auto_234670 ) ( OBJ-AT ?auto_234665 ?auto_234670 ) ( IN-CITY ?auto_234669 ?auto_234671 ) ( not ( = ?auto_234663 ?auto_234669 ) ) ( OBJ-AT ?auto_234666 ?auto_234669 ) ( OBJ-AT ?auto_234664 ?auto_234670 ) ( TRUCK-AT ?auto_234668 ?auto_234663 ) ( not ( = ?auto_234664 ?auto_234666 ) ) ( not ( = ?auto_234669 ?auto_234670 ) ) ( not ( = ?auto_234664 ?auto_234665 ) ) ( not ( = ?auto_234666 ?auto_234665 ) ) ( not ( = ?auto_234664 ?auto_234667 ) ) ( not ( = ?auto_234666 ?auto_234667 ) ) ( not ( = ?auto_234665 ?auto_234667 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_234664 ?auto_234666 ?auto_234665 ?auto_234667 ?auto_234663 )
      ( DELIVER-4PKG-VERIFY ?auto_234664 ?auto_234665 ?auto_234666 ?auto_234667 ?auto_234663 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234693 - OBJ
      ?auto_234694 - OBJ
      ?auto_234695 - OBJ
      ?auto_234696 - OBJ
      ?auto_234692 - LOCATION
    )
    :vars
    (
      ?auto_234699 - LOCATION
      ?auto_234698 - CITY
      ?auto_234700 - LOCATION
      ?auto_234697 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_234699 ?auto_234698 ) ( IN-CITY ?auto_234692 ?auto_234698 ) ( not ( = ?auto_234692 ?auto_234699 ) ) ( OBJ-AT ?auto_234695 ?auto_234699 ) ( OBJ-AT ?auto_234694 ?auto_234699 ) ( IN-CITY ?auto_234700 ?auto_234698 ) ( not ( = ?auto_234692 ?auto_234700 ) ) ( OBJ-AT ?auto_234696 ?auto_234700 ) ( OBJ-AT ?auto_234693 ?auto_234699 ) ( TRUCK-AT ?auto_234697 ?auto_234692 ) ( not ( = ?auto_234693 ?auto_234696 ) ) ( not ( = ?auto_234700 ?auto_234699 ) ) ( not ( = ?auto_234693 ?auto_234694 ) ) ( not ( = ?auto_234696 ?auto_234694 ) ) ( not ( = ?auto_234693 ?auto_234695 ) ) ( not ( = ?auto_234696 ?auto_234695 ) ) ( not ( = ?auto_234694 ?auto_234695 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_234693 ?auto_234694 ?auto_234696 ?auto_234695 ?auto_234692 )
      ( DELIVER-4PKG-VERIFY ?auto_234693 ?auto_234694 ?auto_234695 ?auto_234696 ?auto_234692 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234896 - OBJ
      ?auto_234897 - OBJ
      ?auto_234898 - OBJ
      ?auto_234899 - OBJ
      ?auto_234895 - LOCATION
    )
    :vars
    (
      ?auto_234902 - LOCATION
      ?auto_234901 - CITY
      ?auto_234903 - LOCATION
      ?auto_234900 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_234902 ?auto_234901 ) ( IN-CITY ?auto_234895 ?auto_234901 ) ( not ( = ?auto_234895 ?auto_234902 ) ) ( OBJ-AT ?auto_234899 ?auto_234902 ) ( OBJ-AT ?auto_234898 ?auto_234902 ) ( IN-CITY ?auto_234903 ?auto_234901 ) ( not ( = ?auto_234895 ?auto_234903 ) ) ( OBJ-AT ?auto_234896 ?auto_234903 ) ( OBJ-AT ?auto_234897 ?auto_234902 ) ( TRUCK-AT ?auto_234900 ?auto_234895 ) ( not ( = ?auto_234897 ?auto_234896 ) ) ( not ( = ?auto_234903 ?auto_234902 ) ) ( not ( = ?auto_234897 ?auto_234898 ) ) ( not ( = ?auto_234896 ?auto_234898 ) ) ( not ( = ?auto_234897 ?auto_234899 ) ) ( not ( = ?auto_234896 ?auto_234899 ) ) ( not ( = ?auto_234898 ?auto_234899 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_234897 ?auto_234898 ?auto_234896 ?auto_234899 ?auto_234895 )
      ( DELIVER-4PKG-VERIFY ?auto_234896 ?auto_234897 ?auto_234898 ?auto_234899 ?auto_234895 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_249864 - OBJ
      ?auto_249865 - OBJ
      ?auto_249866 - OBJ
      ?auto_249867 - OBJ
      ?auto_249868 - OBJ
      ?auto_249863 - LOCATION
    )
    :vars
    (
      ?auto_249870 - LOCATION
      ?auto_249869 - CITY
      ?auto_249872 - LOCATION
      ?auto_249873 - LOCATION
      ?auto_249871 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_249870 ?auto_249869 ) ( IN-CITY ?auto_249863 ?auto_249869 ) ( not ( = ?auto_249863 ?auto_249870 ) ) ( OBJ-AT ?auto_249868 ?auto_249870 ) ( IN-CITY ?auto_249872 ?auto_249869 ) ( not ( = ?auto_249863 ?auto_249872 ) ) ( OBJ-AT ?auto_249867 ?auto_249872 ) ( OBJ-AT ?auto_249866 ?auto_249872 ) ( IN-CITY ?auto_249873 ?auto_249869 ) ( not ( = ?auto_249863 ?auto_249873 ) ) ( OBJ-AT ?auto_249865 ?auto_249873 ) ( OBJ-AT ?auto_249864 ?auto_249872 ) ( TRUCK-AT ?auto_249871 ?auto_249863 ) ( not ( = ?auto_249864 ?auto_249865 ) ) ( not ( = ?auto_249873 ?auto_249872 ) ) ( not ( = ?auto_249864 ?auto_249866 ) ) ( not ( = ?auto_249865 ?auto_249866 ) ) ( not ( = ?auto_249864 ?auto_249867 ) ) ( not ( = ?auto_249865 ?auto_249867 ) ) ( not ( = ?auto_249866 ?auto_249867 ) ) ( not ( = ?auto_249864 ?auto_249868 ) ) ( not ( = ?auto_249865 ?auto_249868 ) ) ( not ( = ?auto_249866 ?auto_249868 ) ) ( not ( = ?auto_249867 ?auto_249868 ) ) ( not ( = ?auto_249870 ?auto_249872 ) ) ( not ( = ?auto_249870 ?auto_249873 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_249864 ?auto_249866 ?auto_249865 ?auto_249867 ?auto_249863 )
      ( DELIVER-1PKG ?auto_249868 ?auto_249863 )
      ( DELIVER-5PKG-VERIFY ?auto_249864 ?auto_249865 ?auto_249866 ?auto_249867 ?auto_249868 ?auto_249863 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_249911 - OBJ
      ?auto_249912 - OBJ
      ?auto_249913 - OBJ
      ?auto_249914 - OBJ
      ?auto_249915 - OBJ
      ?auto_249910 - LOCATION
    )
    :vars
    (
      ?auto_249919 - LOCATION
      ?auto_249917 - CITY
      ?auto_249920 - LOCATION
      ?auto_249916 - LOCATION
      ?auto_249918 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_249919 ?auto_249917 ) ( IN-CITY ?auto_249910 ?auto_249917 ) ( not ( = ?auto_249910 ?auto_249919 ) ) ( OBJ-AT ?auto_249914 ?auto_249919 ) ( IN-CITY ?auto_249920 ?auto_249917 ) ( not ( = ?auto_249910 ?auto_249920 ) ) ( OBJ-AT ?auto_249915 ?auto_249920 ) ( OBJ-AT ?auto_249913 ?auto_249920 ) ( IN-CITY ?auto_249916 ?auto_249917 ) ( not ( = ?auto_249910 ?auto_249916 ) ) ( OBJ-AT ?auto_249912 ?auto_249916 ) ( OBJ-AT ?auto_249911 ?auto_249920 ) ( TRUCK-AT ?auto_249918 ?auto_249910 ) ( not ( = ?auto_249911 ?auto_249912 ) ) ( not ( = ?auto_249916 ?auto_249920 ) ) ( not ( = ?auto_249911 ?auto_249913 ) ) ( not ( = ?auto_249912 ?auto_249913 ) ) ( not ( = ?auto_249911 ?auto_249915 ) ) ( not ( = ?auto_249912 ?auto_249915 ) ) ( not ( = ?auto_249913 ?auto_249915 ) ) ( not ( = ?auto_249911 ?auto_249914 ) ) ( not ( = ?auto_249912 ?auto_249914 ) ) ( not ( = ?auto_249913 ?auto_249914 ) ) ( not ( = ?auto_249915 ?auto_249914 ) ) ( not ( = ?auto_249919 ?auto_249920 ) ) ( not ( = ?auto_249919 ?auto_249916 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_249911 ?auto_249912 ?auto_249913 ?auto_249915 ?auto_249914 ?auto_249910 )
      ( DELIVER-5PKG-VERIFY ?auto_249911 ?auto_249912 ?auto_249913 ?auto_249914 ?auto_249915 ?auto_249910 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_250192 - OBJ
      ?auto_250193 - OBJ
      ?auto_250194 - OBJ
      ?auto_250195 - OBJ
      ?auto_250196 - OBJ
      ?auto_250191 - LOCATION
    )
    :vars
    (
      ?auto_250197 - LOCATION
      ?auto_250200 - CITY
      ?auto_250201 - LOCATION
      ?auto_250199 - LOCATION
      ?auto_250198 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_250197 ?auto_250200 ) ( IN-CITY ?auto_250191 ?auto_250200 ) ( not ( = ?auto_250191 ?auto_250197 ) ) ( OBJ-AT ?auto_250194 ?auto_250197 ) ( IN-CITY ?auto_250201 ?auto_250200 ) ( not ( = ?auto_250191 ?auto_250201 ) ) ( OBJ-AT ?auto_250196 ?auto_250201 ) ( OBJ-AT ?auto_250195 ?auto_250201 ) ( IN-CITY ?auto_250199 ?auto_250200 ) ( not ( = ?auto_250191 ?auto_250199 ) ) ( OBJ-AT ?auto_250193 ?auto_250199 ) ( OBJ-AT ?auto_250192 ?auto_250201 ) ( TRUCK-AT ?auto_250198 ?auto_250191 ) ( not ( = ?auto_250192 ?auto_250193 ) ) ( not ( = ?auto_250199 ?auto_250201 ) ) ( not ( = ?auto_250192 ?auto_250195 ) ) ( not ( = ?auto_250193 ?auto_250195 ) ) ( not ( = ?auto_250192 ?auto_250196 ) ) ( not ( = ?auto_250193 ?auto_250196 ) ) ( not ( = ?auto_250195 ?auto_250196 ) ) ( not ( = ?auto_250192 ?auto_250194 ) ) ( not ( = ?auto_250193 ?auto_250194 ) ) ( not ( = ?auto_250195 ?auto_250194 ) ) ( not ( = ?auto_250196 ?auto_250194 ) ) ( not ( = ?auto_250197 ?auto_250201 ) ) ( not ( = ?auto_250197 ?auto_250199 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_250192 ?auto_250193 ?auto_250195 ?auto_250194 ?auto_250196 ?auto_250191 )
      ( DELIVER-5PKG-VERIFY ?auto_250192 ?auto_250193 ?auto_250194 ?auto_250195 ?auto_250196 ?auto_250191 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_250481 - OBJ
      ?auto_250482 - OBJ
      ?auto_250483 - OBJ
      ?auto_250484 - OBJ
      ?auto_250485 - OBJ
      ?auto_250480 - LOCATION
    )
    :vars
    (
      ?auto_250486 - LOCATION
      ?auto_250489 - CITY
      ?auto_250490 - LOCATION
      ?auto_250488 - LOCATION
      ?auto_250487 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_250486 ?auto_250489 ) ( IN-CITY ?auto_250480 ?auto_250489 ) ( not ( = ?auto_250480 ?auto_250486 ) ) ( OBJ-AT ?auto_250485 ?auto_250486 ) ( IN-CITY ?auto_250490 ?auto_250489 ) ( not ( = ?auto_250480 ?auto_250490 ) ) ( OBJ-AT ?auto_250484 ?auto_250490 ) ( OBJ-AT ?auto_250482 ?auto_250490 ) ( IN-CITY ?auto_250488 ?auto_250489 ) ( not ( = ?auto_250480 ?auto_250488 ) ) ( OBJ-AT ?auto_250483 ?auto_250488 ) ( OBJ-AT ?auto_250481 ?auto_250490 ) ( TRUCK-AT ?auto_250487 ?auto_250480 ) ( not ( = ?auto_250481 ?auto_250483 ) ) ( not ( = ?auto_250488 ?auto_250490 ) ) ( not ( = ?auto_250481 ?auto_250482 ) ) ( not ( = ?auto_250483 ?auto_250482 ) ) ( not ( = ?auto_250481 ?auto_250484 ) ) ( not ( = ?auto_250483 ?auto_250484 ) ) ( not ( = ?auto_250482 ?auto_250484 ) ) ( not ( = ?auto_250481 ?auto_250485 ) ) ( not ( = ?auto_250483 ?auto_250485 ) ) ( not ( = ?auto_250482 ?auto_250485 ) ) ( not ( = ?auto_250484 ?auto_250485 ) ) ( not ( = ?auto_250486 ?auto_250490 ) ) ( not ( = ?auto_250486 ?auto_250488 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_250481 ?auto_250483 ?auto_250482 ?auto_250485 ?auto_250484 ?auto_250480 )
      ( DELIVER-5PKG-VERIFY ?auto_250481 ?auto_250482 ?auto_250483 ?auto_250484 ?auto_250485 ?auto_250480 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_250528 - OBJ
      ?auto_250529 - OBJ
      ?auto_250530 - OBJ
      ?auto_250531 - OBJ
      ?auto_250532 - OBJ
      ?auto_250527 - LOCATION
    )
    :vars
    (
      ?auto_250533 - LOCATION
      ?auto_250536 - CITY
      ?auto_250537 - LOCATION
      ?auto_250535 - LOCATION
      ?auto_250534 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_250533 ?auto_250536 ) ( IN-CITY ?auto_250527 ?auto_250536 ) ( not ( = ?auto_250527 ?auto_250533 ) ) ( OBJ-AT ?auto_250531 ?auto_250533 ) ( IN-CITY ?auto_250537 ?auto_250536 ) ( not ( = ?auto_250527 ?auto_250537 ) ) ( OBJ-AT ?auto_250532 ?auto_250537 ) ( OBJ-AT ?auto_250529 ?auto_250537 ) ( IN-CITY ?auto_250535 ?auto_250536 ) ( not ( = ?auto_250527 ?auto_250535 ) ) ( OBJ-AT ?auto_250530 ?auto_250535 ) ( OBJ-AT ?auto_250528 ?auto_250537 ) ( TRUCK-AT ?auto_250534 ?auto_250527 ) ( not ( = ?auto_250528 ?auto_250530 ) ) ( not ( = ?auto_250535 ?auto_250537 ) ) ( not ( = ?auto_250528 ?auto_250529 ) ) ( not ( = ?auto_250530 ?auto_250529 ) ) ( not ( = ?auto_250528 ?auto_250532 ) ) ( not ( = ?auto_250530 ?auto_250532 ) ) ( not ( = ?auto_250529 ?auto_250532 ) ) ( not ( = ?auto_250528 ?auto_250531 ) ) ( not ( = ?auto_250530 ?auto_250531 ) ) ( not ( = ?auto_250529 ?auto_250531 ) ) ( not ( = ?auto_250532 ?auto_250531 ) ) ( not ( = ?auto_250533 ?auto_250537 ) ) ( not ( = ?auto_250533 ?auto_250535 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_250528 ?auto_250530 ?auto_250529 ?auto_250531 ?auto_250532 ?auto_250527 )
      ( DELIVER-5PKG-VERIFY ?auto_250528 ?auto_250529 ?auto_250530 ?auto_250531 ?auto_250532 ?auto_250527 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_250676 - OBJ
      ?auto_250677 - OBJ
      ?auto_250678 - OBJ
      ?auto_250679 - OBJ
      ?auto_250680 - OBJ
      ?auto_250675 - LOCATION
    )
    :vars
    (
      ?auto_250681 - LOCATION
      ?auto_250684 - CITY
      ?auto_250685 - LOCATION
      ?auto_250683 - LOCATION
      ?auto_250682 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_250681 ?auto_250684 ) ( IN-CITY ?auto_250675 ?auto_250684 ) ( not ( = ?auto_250675 ?auto_250681 ) ) ( OBJ-AT ?auto_250680 ?auto_250681 ) ( IN-CITY ?auto_250685 ?auto_250684 ) ( not ( = ?auto_250675 ?auto_250685 ) ) ( OBJ-AT ?auto_250678 ?auto_250685 ) ( OBJ-AT ?auto_250677 ?auto_250685 ) ( IN-CITY ?auto_250683 ?auto_250684 ) ( not ( = ?auto_250675 ?auto_250683 ) ) ( OBJ-AT ?auto_250679 ?auto_250683 ) ( OBJ-AT ?auto_250676 ?auto_250685 ) ( TRUCK-AT ?auto_250682 ?auto_250675 ) ( not ( = ?auto_250676 ?auto_250679 ) ) ( not ( = ?auto_250683 ?auto_250685 ) ) ( not ( = ?auto_250676 ?auto_250677 ) ) ( not ( = ?auto_250679 ?auto_250677 ) ) ( not ( = ?auto_250676 ?auto_250678 ) ) ( not ( = ?auto_250679 ?auto_250678 ) ) ( not ( = ?auto_250677 ?auto_250678 ) ) ( not ( = ?auto_250676 ?auto_250680 ) ) ( not ( = ?auto_250679 ?auto_250680 ) ) ( not ( = ?auto_250677 ?auto_250680 ) ) ( not ( = ?auto_250678 ?auto_250680 ) ) ( not ( = ?auto_250681 ?auto_250685 ) ) ( not ( = ?auto_250681 ?auto_250683 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_250676 ?auto_250679 ?auto_250677 ?auto_250680 ?auto_250678 ?auto_250675 )
      ( DELIVER-5PKG-VERIFY ?auto_250676 ?auto_250677 ?auto_250678 ?auto_250679 ?auto_250680 ?auto_250675 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_253576 - OBJ
      ?auto_253577 - OBJ
      ?auto_253578 - OBJ
      ?auto_253579 - OBJ
      ?auto_253580 - OBJ
      ?auto_253575 - LOCATION
    )
    :vars
    (
      ?auto_253581 - LOCATION
      ?auto_253584 - CITY
      ?auto_253585 - LOCATION
      ?auto_253583 - LOCATION
      ?auto_253582 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_253581 ?auto_253584 ) ( IN-CITY ?auto_253575 ?auto_253584 ) ( not ( = ?auto_253575 ?auto_253581 ) ) ( OBJ-AT ?auto_253580 ?auto_253581 ) ( IN-CITY ?auto_253585 ?auto_253584 ) ( not ( = ?auto_253575 ?auto_253585 ) ) ( OBJ-AT ?auto_253579 ?auto_253585 ) ( OBJ-AT ?auto_253578 ?auto_253585 ) ( IN-CITY ?auto_253583 ?auto_253584 ) ( not ( = ?auto_253575 ?auto_253583 ) ) ( OBJ-AT ?auto_253576 ?auto_253583 ) ( OBJ-AT ?auto_253577 ?auto_253585 ) ( TRUCK-AT ?auto_253582 ?auto_253575 ) ( not ( = ?auto_253577 ?auto_253576 ) ) ( not ( = ?auto_253583 ?auto_253585 ) ) ( not ( = ?auto_253577 ?auto_253578 ) ) ( not ( = ?auto_253576 ?auto_253578 ) ) ( not ( = ?auto_253577 ?auto_253579 ) ) ( not ( = ?auto_253576 ?auto_253579 ) ) ( not ( = ?auto_253578 ?auto_253579 ) ) ( not ( = ?auto_253577 ?auto_253580 ) ) ( not ( = ?auto_253576 ?auto_253580 ) ) ( not ( = ?auto_253578 ?auto_253580 ) ) ( not ( = ?auto_253579 ?auto_253580 ) ) ( not ( = ?auto_253581 ?auto_253585 ) ) ( not ( = ?auto_253581 ?auto_253583 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_253577 ?auto_253576 ?auto_253578 ?auto_253580 ?auto_253579 ?auto_253575 )
      ( DELIVER-5PKG-VERIFY ?auto_253576 ?auto_253577 ?auto_253578 ?auto_253579 ?auto_253580 ?auto_253575 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_253623 - OBJ
      ?auto_253624 - OBJ
      ?auto_253625 - OBJ
      ?auto_253626 - OBJ
      ?auto_253627 - OBJ
      ?auto_253622 - LOCATION
    )
    :vars
    (
      ?auto_253628 - LOCATION
      ?auto_253631 - CITY
      ?auto_253632 - LOCATION
      ?auto_253630 - LOCATION
      ?auto_253629 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_253628 ?auto_253631 ) ( IN-CITY ?auto_253622 ?auto_253631 ) ( not ( = ?auto_253622 ?auto_253628 ) ) ( OBJ-AT ?auto_253626 ?auto_253628 ) ( IN-CITY ?auto_253632 ?auto_253631 ) ( not ( = ?auto_253622 ?auto_253632 ) ) ( OBJ-AT ?auto_253627 ?auto_253632 ) ( OBJ-AT ?auto_253625 ?auto_253632 ) ( IN-CITY ?auto_253630 ?auto_253631 ) ( not ( = ?auto_253622 ?auto_253630 ) ) ( OBJ-AT ?auto_253623 ?auto_253630 ) ( OBJ-AT ?auto_253624 ?auto_253632 ) ( TRUCK-AT ?auto_253629 ?auto_253622 ) ( not ( = ?auto_253624 ?auto_253623 ) ) ( not ( = ?auto_253630 ?auto_253632 ) ) ( not ( = ?auto_253624 ?auto_253625 ) ) ( not ( = ?auto_253623 ?auto_253625 ) ) ( not ( = ?auto_253624 ?auto_253627 ) ) ( not ( = ?auto_253623 ?auto_253627 ) ) ( not ( = ?auto_253625 ?auto_253627 ) ) ( not ( = ?auto_253624 ?auto_253626 ) ) ( not ( = ?auto_253623 ?auto_253626 ) ) ( not ( = ?auto_253625 ?auto_253626 ) ) ( not ( = ?auto_253627 ?auto_253626 ) ) ( not ( = ?auto_253628 ?auto_253632 ) ) ( not ( = ?auto_253628 ?auto_253630 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_253624 ?auto_253623 ?auto_253625 ?auto_253626 ?auto_253627 ?auto_253622 )
      ( DELIVER-5PKG-VERIFY ?auto_253623 ?auto_253624 ?auto_253625 ?auto_253626 ?auto_253627 ?auto_253622 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_253904 - OBJ
      ?auto_253905 - OBJ
      ?auto_253906 - OBJ
      ?auto_253907 - OBJ
      ?auto_253908 - OBJ
      ?auto_253903 - LOCATION
    )
    :vars
    (
      ?auto_253909 - LOCATION
      ?auto_253912 - CITY
      ?auto_253913 - LOCATION
      ?auto_253911 - LOCATION
      ?auto_253910 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_253909 ?auto_253912 ) ( IN-CITY ?auto_253903 ?auto_253912 ) ( not ( = ?auto_253903 ?auto_253909 ) ) ( OBJ-AT ?auto_253906 ?auto_253909 ) ( IN-CITY ?auto_253913 ?auto_253912 ) ( not ( = ?auto_253903 ?auto_253913 ) ) ( OBJ-AT ?auto_253908 ?auto_253913 ) ( OBJ-AT ?auto_253907 ?auto_253913 ) ( IN-CITY ?auto_253911 ?auto_253912 ) ( not ( = ?auto_253903 ?auto_253911 ) ) ( OBJ-AT ?auto_253904 ?auto_253911 ) ( OBJ-AT ?auto_253905 ?auto_253913 ) ( TRUCK-AT ?auto_253910 ?auto_253903 ) ( not ( = ?auto_253905 ?auto_253904 ) ) ( not ( = ?auto_253911 ?auto_253913 ) ) ( not ( = ?auto_253905 ?auto_253907 ) ) ( not ( = ?auto_253904 ?auto_253907 ) ) ( not ( = ?auto_253905 ?auto_253908 ) ) ( not ( = ?auto_253904 ?auto_253908 ) ) ( not ( = ?auto_253907 ?auto_253908 ) ) ( not ( = ?auto_253905 ?auto_253906 ) ) ( not ( = ?auto_253904 ?auto_253906 ) ) ( not ( = ?auto_253907 ?auto_253906 ) ) ( not ( = ?auto_253908 ?auto_253906 ) ) ( not ( = ?auto_253909 ?auto_253913 ) ) ( not ( = ?auto_253909 ?auto_253911 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_253905 ?auto_253904 ?auto_253907 ?auto_253906 ?auto_253908 ?auto_253903 )
      ( DELIVER-5PKG-VERIFY ?auto_253904 ?auto_253905 ?auto_253906 ?auto_253907 ?auto_253908 ?auto_253903 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_256418 - OBJ
      ?auto_256419 - OBJ
      ?auto_256420 - OBJ
      ?auto_256421 - OBJ
      ?auto_256422 - OBJ
      ?auto_256417 - LOCATION
    )
    :vars
    (
      ?auto_256423 - LOCATION
      ?auto_256426 - CITY
      ?auto_256427 - LOCATION
      ?auto_256425 - LOCATION
      ?auto_256424 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_256423 ?auto_256426 ) ( IN-CITY ?auto_256417 ?auto_256426 ) ( not ( = ?auto_256417 ?auto_256423 ) ) ( OBJ-AT ?auto_256419 ?auto_256423 ) ( IN-CITY ?auto_256427 ?auto_256426 ) ( not ( = ?auto_256417 ?auto_256427 ) ) ( OBJ-AT ?auto_256422 ?auto_256427 ) ( OBJ-AT ?auto_256421 ?auto_256427 ) ( IN-CITY ?auto_256425 ?auto_256426 ) ( not ( = ?auto_256417 ?auto_256425 ) ) ( OBJ-AT ?auto_256418 ?auto_256425 ) ( OBJ-AT ?auto_256420 ?auto_256427 ) ( TRUCK-AT ?auto_256424 ?auto_256417 ) ( not ( = ?auto_256420 ?auto_256418 ) ) ( not ( = ?auto_256425 ?auto_256427 ) ) ( not ( = ?auto_256420 ?auto_256421 ) ) ( not ( = ?auto_256418 ?auto_256421 ) ) ( not ( = ?auto_256420 ?auto_256422 ) ) ( not ( = ?auto_256418 ?auto_256422 ) ) ( not ( = ?auto_256421 ?auto_256422 ) ) ( not ( = ?auto_256420 ?auto_256419 ) ) ( not ( = ?auto_256418 ?auto_256419 ) ) ( not ( = ?auto_256421 ?auto_256419 ) ) ( not ( = ?auto_256422 ?auto_256419 ) ) ( not ( = ?auto_256423 ?auto_256427 ) ) ( not ( = ?auto_256423 ?auto_256425 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_256420 ?auto_256418 ?auto_256421 ?auto_256419 ?auto_256422 ?auto_256417 )
      ( DELIVER-5PKG-VERIFY ?auto_256418 ?auto_256419 ?auto_256420 ?auto_256421 ?auto_256422 ?auto_256417 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_505199 - OBJ
      ?auto_505200 - OBJ
      ?auto_505201 - OBJ
      ?auto_505202 - OBJ
      ?auto_505203 - OBJ
      ?auto_505204 - OBJ
      ?auto_505198 - LOCATION
    )
    :vars
    (
      ?auto_505207 - LOCATION
      ?auto_505206 - CITY
      ?auto_505208 - LOCATION
      ?auto_505210 - LOCATION
      ?auto_505209 - LOCATION
      ?auto_505205 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_505207 ?auto_505206 ) ( IN-CITY ?auto_505198 ?auto_505206 ) ( not ( = ?auto_505198 ?auto_505207 ) ) ( OBJ-AT ?auto_505204 ?auto_505207 ) ( IN-CITY ?auto_505208 ?auto_505206 ) ( not ( = ?auto_505198 ?auto_505208 ) ) ( OBJ-AT ?auto_505203 ?auto_505208 ) ( IN-CITY ?auto_505210 ?auto_505206 ) ( not ( = ?auto_505198 ?auto_505210 ) ) ( OBJ-AT ?auto_505202 ?auto_505210 ) ( OBJ-AT ?auto_505201 ?auto_505210 ) ( IN-CITY ?auto_505209 ?auto_505206 ) ( not ( = ?auto_505198 ?auto_505209 ) ) ( OBJ-AT ?auto_505200 ?auto_505209 ) ( OBJ-AT ?auto_505199 ?auto_505210 ) ( TRUCK-AT ?auto_505205 ?auto_505198 ) ( not ( = ?auto_505199 ?auto_505200 ) ) ( not ( = ?auto_505209 ?auto_505210 ) ) ( not ( = ?auto_505199 ?auto_505201 ) ) ( not ( = ?auto_505200 ?auto_505201 ) ) ( not ( = ?auto_505199 ?auto_505202 ) ) ( not ( = ?auto_505200 ?auto_505202 ) ) ( not ( = ?auto_505201 ?auto_505202 ) ) ( not ( = ?auto_505199 ?auto_505203 ) ) ( not ( = ?auto_505200 ?auto_505203 ) ) ( not ( = ?auto_505201 ?auto_505203 ) ) ( not ( = ?auto_505202 ?auto_505203 ) ) ( not ( = ?auto_505208 ?auto_505210 ) ) ( not ( = ?auto_505208 ?auto_505209 ) ) ( not ( = ?auto_505199 ?auto_505204 ) ) ( not ( = ?auto_505200 ?auto_505204 ) ) ( not ( = ?auto_505201 ?auto_505204 ) ) ( not ( = ?auto_505202 ?auto_505204 ) ) ( not ( = ?auto_505203 ?auto_505204 ) ) ( not ( = ?auto_505207 ?auto_505208 ) ) ( not ( = ?auto_505207 ?auto_505210 ) ) ( not ( = ?auto_505207 ?auto_505209 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_505199 ?auto_505200 ?auto_505201 ?auto_505203 ?auto_505202 ?auto_505198 )
      ( DELIVER-1PKG ?auto_505204 ?auto_505198 )
      ( DELIVER-6PKG-VERIFY ?auto_505199 ?auto_505200 ?auto_505201 ?auto_505202 ?auto_505203 ?auto_505204 ?auto_505198 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_505331 - OBJ
      ?auto_505332 - OBJ
      ?auto_505333 - OBJ
      ?auto_505334 - OBJ
      ?auto_505335 - OBJ
      ?auto_505336 - OBJ
      ?auto_505330 - LOCATION
    )
    :vars
    (
      ?auto_505339 - LOCATION
      ?auto_505342 - CITY
      ?auto_505338 - LOCATION
      ?auto_505340 - LOCATION
      ?auto_505341 - LOCATION
      ?auto_505337 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_505339 ?auto_505342 ) ( IN-CITY ?auto_505330 ?auto_505342 ) ( not ( = ?auto_505330 ?auto_505339 ) ) ( OBJ-AT ?auto_505336 ?auto_505339 ) ( IN-CITY ?auto_505338 ?auto_505342 ) ( not ( = ?auto_505330 ?auto_505338 ) ) ( OBJ-AT ?auto_505334 ?auto_505338 ) ( IN-CITY ?auto_505340 ?auto_505342 ) ( not ( = ?auto_505330 ?auto_505340 ) ) ( OBJ-AT ?auto_505335 ?auto_505340 ) ( OBJ-AT ?auto_505333 ?auto_505340 ) ( IN-CITY ?auto_505341 ?auto_505342 ) ( not ( = ?auto_505330 ?auto_505341 ) ) ( OBJ-AT ?auto_505332 ?auto_505341 ) ( OBJ-AT ?auto_505331 ?auto_505340 ) ( TRUCK-AT ?auto_505337 ?auto_505330 ) ( not ( = ?auto_505331 ?auto_505332 ) ) ( not ( = ?auto_505341 ?auto_505340 ) ) ( not ( = ?auto_505331 ?auto_505333 ) ) ( not ( = ?auto_505332 ?auto_505333 ) ) ( not ( = ?auto_505331 ?auto_505335 ) ) ( not ( = ?auto_505332 ?auto_505335 ) ) ( not ( = ?auto_505333 ?auto_505335 ) ) ( not ( = ?auto_505331 ?auto_505334 ) ) ( not ( = ?auto_505332 ?auto_505334 ) ) ( not ( = ?auto_505333 ?auto_505334 ) ) ( not ( = ?auto_505335 ?auto_505334 ) ) ( not ( = ?auto_505338 ?auto_505340 ) ) ( not ( = ?auto_505338 ?auto_505341 ) ) ( not ( = ?auto_505331 ?auto_505336 ) ) ( not ( = ?auto_505332 ?auto_505336 ) ) ( not ( = ?auto_505333 ?auto_505336 ) ) ( not ( = ?auto_505335 ?auto_505336 ) ) ( not ( = ?auto_505334 ?auto_505336 ) ) ( not ( = ?auto_505339 ?auto_505338 ) ) ( not ( = ?auto_505339 ?auto_505340 ) ) ( not ( = ?auto_505339 ?auto_505341 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_505331 ?auto_505332 ?auto_505333 ?auto_505335 ?auto_505334 ?auto_505336 ?auto_505330 )
      ( DELIVER-6PKG-VERIFY ?auto_505331 ?auto_505332 ?auto_505333 ?auto_505334 ?auto_505335 ?auto_505336 ?auto_505330 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_505400 - OBJ
      ?auto_505401 - OBJ
      ?auto_505402 - OBJ
      ?auto_505403 - OBJ
      ?auto_505404 - OBJ
      ?auto_505405 - OBJ
      ?auto_505399 - LOCATION
    )
    :vars
    (
      ?auto_505406 - LOCATION
      ?auto_505407 - CITY
      ?auto_505409 - LOCATION
      ?auto_505408 - LOCATION
      ?auto_505411 - LOCATION
      ?auto_505410 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_505406 ?auto_505407 ) ( IN-CITY ?auto_505399 ?auto_505407 ) ( not ( = ?auto_505399 ?auto_505406 ) ) ( OBJ-AT ?auto_505404 ?auto_505406 ) ( IN-CITY ?auto_505409 ?auto_505407 ) ( not ( = ?auto_505399 ?auto_505409 ) ) ( OBJ-AT ?auto_505403 ?auto_505409 ) ( IN-CITY ?auto_505408 ?auto_505407 ) ( not ( = ?auto_505399 ?auto_505408 ) ) ( OBJ-AT ?auto_505405 ?auto_505408 ) ( OBJ-AT ?auto_505402 ?auto_505408 ) ( IN-CITY ?auto_505411 ?auto_505407 ) ( not ( = ?auto_505399 ?auto_505411 ) ) ( OBJ-AT ?auto_505401 ?auto_505411 ) ( OBJ-AT ?auto_505400 ?auto_505408 ) ( TRUCK-AT ?auto_505410 ?auto_505399 ) ( not ( = ?auto_505400 ?auto_505401 ) ) ( not ( = ?auto_505411 ?auto_505408 ) ) ( not ( = ?auto_505400 ?auto_505402 ) ) ( not ( = ?auto_505401 ?auto_505402 ) ) ( not ( = ?auto_505400 ?auto_505405 ) ) ( not ( = ?auto_505401 ?auto_505405 ) ) ( not ( = ?auto_505402 ?auto_505405 ) ) ( not ( = ?auto_505400 ?auto_505403 ) ) ( not ( = ?auto_505401 ?auto_505403 ) ) ( not ( = ?auto_505402 ?auto_505403 ) ) ( not ( = ?auto_505405 ?auto_505403 ) ) ( not ( = ?auto_505409 ?auto_505408 ) ) ( not ( = ?auto_505409 ?auto_505411 ) ) ( not ( = ?auto_505400 ?auto_505404 ) ) ( not ( = ?auto_505401 ?auto_505404 ) ) ( not ( = ?auto_505402 ?auto_505404 ) ) ( not ( = ?auto_505405 ?auto_505404 ) ) ( not ( = ?auto_505403 ?auto_505404 ) ) ( not ( = ?auto_505406 ?auto_505409 ) ) ( not ( = ?auto_505406 ?auto_505408 ) ) ( not ( = ?auto_505406 ?auto_505411 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_505400 ?auto_505401 ?auto_505402 ?auto_505403 ?auto_505405 ?auto_505404 ?auto_505399 )
      ( DELIVER-6PKG-VERIFY ?auto_505400 ?auto_505401 ?auto_505402 ?auto_505403 ?auto_505404 ?auto_505405 ?auto_505399 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_507580 - OBJ
      ?auto_507581 - OBJ
      ?auto_507582 - OBJ
      ?auto_507583 - OBJ
      ?auto_507584 - OBJ
      ?auto_507585 - OBJ
      ?auto_507579 - LOCATION
    )
    :vars
    (
      ?auto_507586 - LOCATION
      ?auto_507587 - CITY
      ?auto_507589 - LOCATION
      ?auto_507588 - LOCATION
      ?auto_507591 - LOCATION
      ?auto_507590 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_507586 ?auto_507587 ) ( IN-CITY ?auto_507579 ?auto_507587 ) ( not ( = ?auto_507579 ?auto_507586 ) ) ( OBJ-AT ?auto_507585 ?auto_507586 ) ( IN-CITY ?auto_507589 ?auto_507587 ) ( not ( = ?auto_507579 ?auto_507589 ) ) ( OBJ-AT ?auto_507582 ?auto_507589 ) ( IN-CITY ?auto_507588 ?auto_507587 ) ( not ( = ?auto_507579 ?auto_507588 ) ) ( OBJ-AT ?auto_507584 ?auto_507588 ) ( OBJ-AT ?auto_507583 ?auto_507588 ) ( IN-CITY ?auto_507591 ?auto_507587 ) ( not ( = ?auto_507579 ?auto_507591 ) ) ( OBJ-AT ?auto_507581 ?auto_507591 ) ( OBJ-AT ?auto_507580 ?auto_507588 ) ( TRUCK-AT ?auto_507590 ?auto_507579 ) ( not ( = ?auto_507580 ?auto_507581 ) ) ( not ( = ?auto_507591 ?auto_507588 ) ) ( not ( = ?auto_507580 ?auto_507583 ) ) ( not ( = ?auto_507581 ?auto_507583 ) ) ( not ( = ?auto_507580 ?auto_507584 ) ) ( not ( = ?auto_507581 ?auto_507584 ) ) ( not ( = ?auto_507583 ?auto_507584 ) ) ( not ( = ?auto_507580 ?auto_507582 ) ) ( not ( = ?auto_507581 ?auto_507582 ) ) ( not ( = ?auto_507583 ?auto_507582 ) ) ( not ( = ?auto_507584 ?auto_507582 ) ) ( not ( = ?auto_507589 ?auto_507588 ) ) ( not ( = ?auto_507589 ?auto_507591 ) ) ( not ( = ?auto_507580 ?auto_507585 ) ) ( not ( = ?auto_507581 ?auto_507585 ) ) ( not ( = ?auto_507583 ?auto_507585 ) ) ( not ( = ?auto_507584 ?auto_507585 ) ) ( not ( = ?auto_507582 ?auto_507585 ) ) ( not ( = ?auto_507586 ?auto_507589 ) ) ( not ( = ?auto_507586 ?auto_507588 ) ) ( not ( = ?auto_507586 ?auto_507591 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_507580 ?auto_507581 ?auto_507583 ?auto_507582 ?auto_507584 ?auto_507585 ?auto_507579 )
      ( DELIVER-6PKG-VERIFY ?auto_507580 ?auto_507581 ?auto_507582 ?auto_507583 ?auto_507584 ?auto_507585 ?auto_507579 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_507649 - OBJ
      ?auto_507650 - OBJ
      ?auto_507651 - OBJ
      ?auto_507652 - OBJ
      ?auto_507653 - OBJ
      ?auto_507654 - OBJ
      ?auto_507648 - LOCATION
    )
    :vars
    (
      ?auto_507655 - LOCATION
      ?auto_507656 - CITY
      ?auto_507658 - LOCATION
      ?auto_507657 - LOCATION
      ?auto_507660 - LOCATION
      ?auto_507659 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_507655 ?auto_507656 ) ( IN-CITY ?auto_507648 ?auto_507656 ) ( not ( = ?auto_507648 ?auto_507655 ) ) ( OBJ-AT ?auto_507653 ?auto_507655 ) ( IN-CITY ?auto_507658 ?auto_507656 ) ( not ( = ?auto_507648 ?auto_507658 ) ) ( OBJ-AT ?auto_507651 ?auto_507658 ) ( IN-CITY ?auto_507657 ?auto_507656 ) ( not ( = ?auto_507648 ?auto_507657 ) ) ( OBJ-AT ?auto_507654 ?auto_507657 ) ( OBJ-AT ?auto_507652 ?auto_507657 ) ( IN-CITY ?auto_507660 ?auto_507656 ) ( not ( = ?auto_507648 ?auto_507660 ) ) ( OBJ-AT ?auto_507650 ?auto_507660 ) ( OBJ-AT ?auto_507649 ?auto_507657 ) ( TRUCK-AT ?auto_507659 ?auto_507648 ) ( not ( = ?auto_507649 ?auto_507650 ) ) ( not ( = ?auto_507660 ?auto_507657 ) ) ( not ( = ?auto_507649 ?auto_507652 ) ) ( not ( = ?auto_507650 ?auto_507652 ) ) ( not ( = ?auto_507649 ?auto_507654 ) ) ( not ( = ?auto_507650 ?auto_507654 ) ) ( not ( = ?auto_507652 ?auto_507654 ) ) ( not ( = ?auto_507649 ?auto_507651 ) ) ( not ( = ?auto_507650 ?auto_507651 ) ) ( not ( = ?auto_507652 ?auto_507651 ) ) ( not ( = ?auto_507654 ?auto_507651 ) ) ( not ( = ?auto_507658 ?auto_507657 ) ) ( not ( = ?auto_507658 ?auto_507660 ) ) ( not ( = ?auto_507649 ?auto_507653 ) ) ( not ( = ?auto_507650 ?auto_507653 ) ) ( not ( = ?auto_507652 ?auto_507653 ) ) ( not ( = ?auto_507654 ?auto_507653 ) ) ( not ( = ?auto_507651 ?auto_507653 ) ) ( not ( = ?auto_507655 ?auto_507658 ) ) ( not ( = ?auto_507655 ?auto_507657 ) ) ( not ( = ?auto_507655 ?auto_507660 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_507649 ?auto_507650 ?auto_507652 ?auto_507651 ?auto_507654 ?auto_507653 ?auto_507648 )
      ( DELIVER-6PKG-VERIFY ?auto_507649 ?auto_507650 ?auto_507651 ?auto_507652 ?auto_507653 ?auto_507654 ?auto_507648 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_508209 - OBJ
      ?auto_508210 - OBJ
      ?auto_508211 - OBJ
      ?auto_508212 - OBJ
      ?auto_508213 - OBJ
      ?auto_508214 - OBJ
      ?auto_508208 - LOCATION
    )
    :vars
    (
      ?auto_508215 - LOCATION
      ?auto_508216 - CITY
      ?auto_508218 - LOCATION
      ?auto_508217 - LOCATION
      ?auto_508220 - LOCATION
      ?auto_508219 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_508215 ?auto_508216 ) ( IN-CITY ?auto_508208 ?auto_508216 ) ( not ( = ?auto_508208 ?auto_508215 ) ) ( OBJ-AT ?auto_508212 ?auto_508215 ) ( IN-CITY ?auto_508218 ?auto_508216 ) ( not ( = ?auto_508208 ?auto_508218 ) ) ( OBJ-AT ?auto_508211 ?auto_508218 ) ( IN-CITY ?auto_508217 ?auto_508216 ) ( not ( = ?auto_508208 ?auto_508217 ) ) ( OBJ-AT ?auto_508214 ?auto_508217 ) ( OBJ-AT ?auto_508213 ?auto_508217 ) ( IN-CITY ?auto_508220 ?auto_508216 ) ( not ( = ?auto_508208 ?auto_508220 ) ) ( OBJ-AT ?auto_508210 ?auto_508220 ) ( OBJ-AT ?auto_508209 ?auto_508217 ) ( TRUCK-AT ?auto_508219 ?auto_508208 ) ( not ( = ?auto_508209 ?auto_508210 ) ) ( not ( = ?auto_508220 ?auto_508217 ) ) ( not ( = ?auto_508209 ?auto_508213 ) ) ( not ( = ?auto_508210 ?auto_508213 ) ) ( not ( = ?auto_508209 ?auto_508214 ) ) ( not ( = ?auto_508210 ?auto_508214 ) ) ( not ( = ?auto_508213 ?auto_508214 ) ) ( not ( = ?auto_508209 ?auto_508211 ) ) ( not ( = ?auto_508210 ?auto_508211 ) ) ( not ( = ?auto_508213 ?auto_508211 ) ) ( not ( = ?auto_508214 ?auto_508211 ) ) ( not ( = ?auto_508218 ?auto_508217 ) ) ( not ( = ?auto_508218 ?auto_508220 ) ) ( not ( = ?auto_508209 ?auto_508212 ) ) ( not ( = ?auto_508210 ?auto_508212 ) ) ( not ( = ?auto_508213 ?auto_508212 ) ) ( not ( = ?auto_508214 ?auto_508212 ) ) ( not ( = ?auto_508211 ?auto_508212 ) ) ( not ( = ?auto_508215 ?auto_508218 ) ) ( not ( = ?auto_508215 ?auto_508217 ) ) ( not ( = ?auto_508215 ?auto_508220 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_508209 ?auto_508210 ?auto_508213 ?auto_508211 ?auto_508214 ?auto_508212 ?auto_508208 )
      ( DELIVER-6PKG-VERIFY ?auto_508209 ?auto_508210 ?auto_508211 ?auto_508212 ?auto_508213 ?auto_508214 ?auto_508208 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_513555 - OBJ
      ?auto_513556 - OBJ
      ?auto_513557 - OBJ
      ?auto_513558 - OBJ
      ?auto_513559 - OBJ
      ?auto_513560 - OBJ
      ?auto_513554 - LOCATION
    )
    :vars
    (
      ?auto_513561 - LOCATION
      ?auto_513562 - CITY
      ?auto_513564 - LOCATION
      ?auto_513563 - LOCATION
      ?auto_513566 - LOCATION
      ?auto_513565 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_513561 ?auto_513562 ) ( IN-CITY ?auto_513554 ?auto_513562 ) ( not ( = ?auto_513554 ?auto_513561 ) ) ( OBJ-AT ?auto_513560 ?auto_513561 ) ( IN-CITY ?auto_513564 ?auto_513562 ) ( not ( = ?auto_513554 ?auto_513564 ) ) ( OBJ-AT ?auto_513559 ?auto_513564 ) ( IN-CITY ?auto_513563 ?auto_513562 ) ( not ( = ?auto_513554 ?auto_513563 ) ) ( OBJ-AT ?auto_513558 ?auto_513563 ) ( OBJ-AT ?auto_513556 ?auto_513563 ) ( IN-CITY ?auto_513566 ?auto_513562 ) ( not ( = ?auto_513554 ?auto_513566 ) ) ( OBJ-AT ?auto_513557 ?auto_513566 ) ( OBJ-AT ?auto_513555 ?auto_513563 ) ( TRUCK-AT ?auto_513565 ?auto_513554 ) ( not ( = ?auto_513555 ?auto_513557 ) ) ( not ( = ?auto_513566 ?auto_513563 ) ) ( not ( = ?auto_513555 ?auto_513556 ) ) ( not ( = ?auto_513557 ?auto_513556 ) ) ( not ( = ?auto_513555 ?auto_513558 ) ) ( not ( = ?auto_513557 ?auto_513558 ) ) ( not ( = ?auto_513556 ?auto_513558 ) ) ( not ( = ?auto_513555 ?auto_513559 ) ) ( not ( = ?auto_513557 ?auto_513559 ) ) ( not ( = ?auto_513556 ?auto_513559 ) ) ( not ( = ?auto_513558 ?auto_513559 ) ) ( not ( = ?auto_513564 ?auto_513563 ) ) ( not ( = ?auto_513564 ?auto_513566 ) ) ( not ( = ?auto_513555 ?auto_513560 ) ) ( not ( = ?auto_513557 ?auto_513560 ) ) ( not ( = ?auto_513556 ?auto_513560 ) ) ( not ( = ?auto_513558 ?auto_513560 ) ) ( not ( = ?auto_513559 ?auto_513560 ) ) ( not ( = ?auto_513561 ?auto_513564 ) ) ( not ( = ?auto_513561 ?auto_513563 ) ) ( not ( = ?auto_513561 ?auto_513566 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_513555 ?auto_513557 ?auto_513556 ?auto_513559 ?auto_513558 ?auto_513560 ?auto_513554 )
      ( DELIVER-6PKG-VERIFY ?auto_513555 ?auto_513556 ?auto_513557 ?auto_513558 ?auto_513559 ?auto_513560 ?auto_513554 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_513687 - OBJ
      ?auto_513688 - OBJ
      ?auto_513689 - OBJ
      ?auto_513690 - OBJ
      ?auto_513691 - OBJ
      ?auto_513692 - OBJ
      ?auto_513686 - LOCATION
    )
    :vars
    (
      ?auto_513693 - LOCATION
      ?auto_513694 - CITY
      ?auto_513696 - LOCATION
      ?auto_513695 - LOCATION
      ?auto_513698 - LOCATION
      ?auto_513697 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_513693 ?auto_513694 ) ( IN-CITY ?auto_513686 ?auto_513694 ) ( not ( = ?auto_513686 ?auto_513693 ) ) ( OBJ-AT ?auto_513692 ?auto_513693 ) ( IN-CITY ?auto_513696 ?auto_513694 ) ( not ( = ?auto_513686 ?auto_513696 ) ) ( OBJ-AT ?auto_513690 ?auto_513696 ) ( IN-CITY ?auto_513695 ?auto_513694 ) ( not ( = ?auto_513686 ?auto_513695 ) ) ( OBJ-AT ?auto_513691 ?auto_513695 ) ( OBJ-AT ?auto_513688 ?auto_513695 ) ( IN-CITY ?auto_513698 ?auto_513694 ) ( not ( = ?auto_513686 ?auto_513698 ) ) ( OBJ-AT ?auto_513689 ?auto_513698 ) ( OBJ-AT ?auto_513687 ?auto_513695 ) ( TRUCK-AT ?auto_513697 ?auto_513686 ) ( not ( = ?auto_513687 ?auto_513689 ) ) ( not ( = ?auto_513698 ?auto_513695 ) ) ( not ( = ?auto_513687 ?auto_513688 ) ) ( not ( = ?auto_513689 ?auto_513688 ) ) ( not ( = ?auto_513687 ?auto_513691 ) ) ( not ( = ?auto_513689 ?auto_513691 ) ) ( not ( = ?auto_513688 ?auto_513691 ) ) ( not ( = ?auto_513687 ?auto_513690 ) ) ( not ( = ?auto_513689 ?auto_513690 ) ) ( not ( = ?auto_513688 ?auto_513690 ) ) ( not ( = ?auto_513691 ?auto_513690 ) ) ( not ( = ?auto_513696 ?auto_513695 ) ) ( not ( = ?auto_513696 ?auto_513698 ) ) ( not ( = ?auto_513687 ?auto_513692 ) ) ( not ( = ?auto_513689 ?auto_513692 ) ) ( not ( = ?auto_513688 ?auto_513692 ) ) ( not ( = ?auto_513691 ?auto_513692 ) ) ( not ( = ?auto_513690 ?auto_513692 ) ) ( not ( = ?auto_513693 ?auto_513696 ) ) ( not ( = ?auto_513693 ?auto_513695 ) ) ( not ( = ?auto_513693 ?auto_513698 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_513687 ?auto_513689 ?auto_513688 ?auto_513690 ?auto_513691 ?auto_513692 ?auto_513686 )
      ( DELIVER-6PKG-VERIFY ?auto_513687 ?auto_513688 ?auto_513689 ?auto_513690 ?auto_513691 ?auto_513692 ?auto_513686 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_513756 - OBJ
      ?auto_513757 - OBJ
      ?auto_513758 - OBJ
      ?auto_513759 - OBJ
      ?auto_513760 - OBJ
      ?auto_513761 - OBJ
      ?auto_513755 - LOCATION
    )
    :vars
    (
      ?auto_513762 - LOCATION
      ?auto_513763 - CITY
      ?auto_513765 - LOCATION
      ?auto_513764 - LOCATION
      ?auto_513767 - LOCATION
      ?auto_513766 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_513762 ?auto_513763 ) ( IN-CITY ?auto_513755 ?auto_513763 ) ( not ( = ?auto_513755 ?auto_513762 ) ) ( OBJ-AT ?auto_513760 ?auto_513762 ) ( IN-CITY ?auto_513765 ?auto_513763 ) ( not ( = ?auto_513755 ?auto_513765 ) ) ( OBJ-AT ?auto_513759 ?auto_513765 ) ( IN-CITY ?auto_513764 ?auto_513763 ) ( not ( = ?auto_513755 ?auto_513764 ) ) ( OBJ-AT ?auto_513761 ?auto_513764 ) ( OBJ-AT ?auto_513757 ?auto_513764 ) ( IN-CITY ?auto_513767 ?auto_513763 ) ( not ( = ?auto_513755 ?auto_513767 ) ) ( OBJ-AT ?auto_513758 ?auto_513767 ) ( OBJ-AT ?auto_513756 ?auto_513764 ) ( TRUCK-AT ?auto_513766 ?auto_513755 ) ( not ( = ?auto_513756 ?auto_513758 ) ) ( not ( = ?auto_513767 ?auto_513764 ) ) ( not ( = ?auto_513756 ?auto_513757 ) ) ( not ( = ?auto_513758 ?auto_513757 ) ) ( not ( = ?auto_513756 ?auto_513761 ) ) ( not ( = ?auto_513758 ?auto_513761 ) ) ( not ( = ?auto_513757 ?auto_513761 ) ) ( not ( = ?auto_513756 ?auto_513759 ) ) ( not ( = ?auto_513758 ?auto_513759 ) ) ( not ( = ?auto_513757 ?auto_513759 ) ) ( not ( = ?auto_513761 ?auto_513759 ) ) ( not ( = ?auto_513765 ?auto_513764 ) ) ( not ( = ?auto_513765 ?auto_513767 ) ) ( not ( = ?auto_513756 ?auto_513760 ) ) ( not ( = ?auto_513758 ?auto_513760 ) ) ( not ( = ?auto_513757 ?auto_513760 ) ) ( not ( = ?auto_513761 ?auto_513760 ) ) ( not ( = ?auto_513759 ?auto_513760 ) ) ( not ( = ?auto_513762 ?auto_513765 ) ) ( not ( = ?auto_513762 ?auto_513764 ) ) ( not ( = ?auto_513762 ?auto_513767 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_513756 ?auto_513758 ?auto_513757 ?auto_513759 ?auto_513761 ?auto_513760 ?auto_513755 )
      ( DELIVER-6PKG-VERIFY ?auto_513756 ?auto_513757 ?auto_513758 ?auto_513759 ?auto_513760 ?auto_513761 ?auto_513755 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_515886 - OBJ
      ?auto_515887 - OBJ
      ?auto_515888 - OBJ
      ?auto_515889 - OBJ
      ?auto_515890 - OBJ
      ?auto_515891 - OBJ
      ?auto_515885 - LOCATION
    )
    :vars
    (
      ?auto_515892 - LOCATION
      ?auto_515893 - CITY
      ?auto_515895 - LOCATION
      ?auto_515894 - LOCATION
      ?auto_515897 - LOCATION
      ?auto_515896 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_515892 ?auto_515893 ) ( IN-CITY ?auto_515885 ?auto_515893 ) ( not ( = ?auto_515885 ?auto_515892 ) ) ( OBJ-AT ?auto_515891 ?auto_515892 ) ( IN-CITY ?auto_515895 ?auto_515893 ) ( not ( = ?auto_515885 ?auto_515895 ) ) ( OBJ-AT ?auto_515890 ?auto_515895 ) ( IN-CITY ?auto_515894 ?auto_515893 ) ( not ( = ?auto_515885 ?auto_515894 ) ) ( OBJ-AT ?auto_515888 ?auto_515894 ) ( OBJ-AT ?auto_515887 ?auto_515894 ) ( IN-CITY ?auto_515897 ?auto_515893 ) ( not ( = ?auto_515885 ?auto_515897 ) ) ( OBJ-AT ?auto_515889 ?auto_515897 ) ( OBJ-AT ?auto_515886 ?auto_515894 ) ( TRUCK-AT ?auto_515896 ?auto_515885 ) ( not ( = ?auto_515886 ?auto_515889 ) ) ( not ( = ?auto_515897 ?auto_515894 ) ) ( not ( = ?auto_515886 ?auto_515887 ) ) ( not ( = ?auto_515889 ?auto_515887 ) ) ( not ( = ?auto_515886 ?auto_515888 ) ) ( not ( = ?auto_515889 ?auto_515888 ) ) ( not ( = ?auto_515887 ?auto_515888 ) ) ( not ( = ?auto_515886 ?auto_515890 ) ) ( not ( = ?auto_515889 ?auto_515890 ) ) ( not ( = ?auto_515887 ?auto_515890 ) ) ( not ( = ?auto_515888 ?auto_515890 ) ) ( not ( = ?auto_515895 ?auto_515894 ) ) ( not ( = ?auto_515895 ?auto_515897 ) ) ( not ( = ?auto_515886 ?auto_515891 ) ) ( not ( = ?auto_515889 ?auto_515891 ) ) ( not ( = ?auto_515887 ?auto_515891 ) ) ( not ( = ?auto_515888 ?auto_515891 ) ) ( not ( = ?auto_515890 ?auto_515891 ) ) ( not ( = ?auto_515892 ?auto_515895 ) ) ( not ( = ?auto_515892 ?auto_515894 ) ) ( not ( = ?auto_515892 ?auto_515897 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_515886 ?auto_515889 ?auto_515887 ?auto_515890 ?auto_515888 ?auto_515891 ?auto_515885 )
      ( DELIVER-6PKG-VERIFY ?auto_515886 ?auto_515887 ?auto_515888 ?auto_515889 ?auto_515890 ?auto_515891 ?auto_515885 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_563207 - OBJ
      ?auto_563208 - OBJ
      ?auto_563209 - OBJ
      ?auto_563210 - OBJ
      ?auto_563211 - OBJ
      ?auto_563212 - OBJ
      ?auto_563206 - LOCATION
    )
    :vars
    (
      ?auto_563213 - LOCATION
      ?auto_563214 - CITY
      ?auto_563216 - LOCATION
      ?auto_563215 - LOCATION
      ?auto_563218 - LOCATION
      ?auto_563217 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_563213 ?auto_563214 ) ( IN-CITY ?auto_563206 ?auto_563214 ) ( not ( = ?auto_563206 ?auto_563213 ) ) ( OBJ-AT ?auto_563212 ?auto_563213 ) ( IN-CITY ?auto_563216 ?auto_563214 ) ( not ( = ?auto_563206 ?auto_563216 ) ) ( OBJ-AT ?auto_563211 ?auto_563216 ) ( IN-CITY ?auto_563215 ?auto_563214 ) ( not ( = ?auto_563206 ?auto_563215 ) ) ( OBJ-AT ?auto_563210 ?auto_563215 ) ( OBJ-AT ?auto_563209 ?auto_563215 ) ( IN-CITY ?auto_563218 ?auto_563214 ) ( not ( = ?auto_563206 ?auto_563218 ) ) ( OBJ-AT ?auto_563207 ?auto_563218 ) ( OBJ-AT ?auto_563208 ?auto_563215 ) ( TRUCK-AT ?auto_563217 ?auto_563206 ) ( not ( = ?auto_563208 ?auto_563207 ) ) ( not ( = ?auto_563218 ?auto_563215 ) ) ( not ( = ?auto_563208 ?auto_563209 ) ) ( not ( = ?auto_563207 ?auto_563209 ) ) ( not ( = ?auto_563208 ?auto_563210 ) ) ( not ( = ?auto_563207 ?auto_563210 ) ) ( not ( = ?auto_563209 ?auto_563210 ) ) ( not ( = ?auto_563208 ?auto_563211 ) ) ( not ( = ?auto_563207 ?auto_563211 ) ) ( not ( = ?auto_563209 ?auto_563211 ) ) ( not ( = ?auto_563210 ?auto_563211 ) ) ( not ( = ?auto_563216 ?auto_563215 ) ) ( not ( = ?auto_563216 ?auto_563218 ) ) ( not ( = ?auto_563208 ?auto_563212 ) ) ( not ( = ?auto_563207 ?auto_563212 ) ) ( not ( = ?auto_563209 ?auto_563212 ) ) ( not ( = ?auto_563210 ?auto_563212 ) ) ( not ( = ?auto_563211 ?auto_563212 ) ) ( not ( = ?auto_563213 ?auto_563216 ) ) ( not ( = ?auto_563213 ?auto_563215 ) ) ( not ( = ?auto_563213 ?auto_563218 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_563208 ?auto_563207 ?auto_563209 ?auto_563211 ?auto_563210 ?auto_563212 ?auto_563206 )
      ( DELIVER-6PKG-VERIFY ?auto_563207 ?auto_563208 ?auto_563209 ?auto_563210 ?auto_563211 ?auto_563212 ?auto_563206 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_563339 - OBJ
      ?auto_563340 - OBJ
      ?auto_563341 - OBJ
      ?auto_563342 - OBJ
      ?auto_563343 - OBJ
      ?auto_563344 - OBJ
      ?auto_563338 - LOCATION
    )
    :vars
    (
      ?auto_563345 - LOCATION
      ?auto_563346 - CITY
      ?auto_563348 - LOCATION
      ?auto_563347 - LOCATION
      ?auto_563350 - LOCATION
      ?auto_563349 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_563345 ?auto_563346 ) ( IN-CITY ?auto_563338 ?auto_563346 ) ( not ( = ?auto_563338 ?auto_563345 ) ) ( OBJ-AT ?auto_563344 ?auto_563345 ) ( IN-CITY ?auto_563348 ?auto_563346 ) ( not ( = ?auto_563338 ?auto_563348 ) ) ( OBJ-AT ?auto_563342 ?auto_563348 ) ( IN-CITY ?auto_563347 ?auto_563346 ) ( not ( = ?auto_563338 ?auto_563347 ) ) ( OBJ-AT ?auto_563343 ?auto_563347 ) ( OBJ-AT ?auto_563341 ?auto_563347 ) ( IN-CITY ?auto_563350 ?auto_563346 ) ( not ( = ?auto_563338 ?auto_563350 ) ) ( OBJ-AT ?auto_563339 ?auto_563350 ) ( OBJ-AT ?auto_563340 ?auto_563347 ) ( TRUCK-AT ?auto_563349 ?auto_563338 ) ( not ( = ?auto_563340 ?auto_563339 ) ) ( not ( = ?auto_563350 ?auto_563347 ) ) ( not ( = ?auto_563340 ?auto_563341 ) ) ( not ( = ?auto_563339 ?auto_563341 ) ) ( not ( = ?auto_563340 ?auto_563343 ) ) ( not ( = ?auto_563339 ?auto_563343 ) ) ( not ( = ?auto_563341 ?auto_563343 ) ) ( not ( = ?auto_563340 ?auto_563342 ) ) ( not ( = ?auto_563339 ?auto_563342 ) ) ( not ( = ?auto_563341 ?auto_563342 ) ) ( not ( = ?auto_563343 ?auto_563342 ) ) ( not ( = ?auto_563348 ?auto_563347 ) ) ( not ( = ?auto_563348 ?auto_563350 ) ) ( not ( = ?auto_563340 ?auto_563344 ) ) ( not ( = ?auto_563339 ?auto_563344 ) ) ( not ( = ?auto_563341 ?auto_563344 ) ) ( not ( = ?auto_563343 ?auto_563344 ) ) ( not ( = ?auto_563342 ?auto_563344 ) ) ( not ( = ?auto_563345 ?auto_563348 ) ) ( not ( = ?auto_563345 ?auto_563347 ) ) ( not ( = ?auto_563345 ?auto_563350 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_563340 ?auto_563339 ?auto_563341 ?auto_563342 ?auto_563343 ?auto_563344 ?auto_563338 )
      ( DELIVER-6PKG-VERIFY ?auto_563339 ?auto_563340 ?auto_563341 ?auto_563342 ?auto_563343 ?auto_563344 ?auto_563338 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_563408 - OBJ
      ?auto_563409 - OBJ
      ?auto_563410 - OBJ
      ?auto_563411 - OBJ
      ?auto_563412 - OBJ
      ?auto_563413 - OBJ
      ?auto_563407 - LOCATION
    )
    :vars
    (
      ?auto_563414 - LOCATION
      ?auto_563415 - CITY
      ?auto_563417 - LOCATION
      ?auto_563416 - LOCATION
      ?auto_563419 - LOCATION
      ?auto_563418 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_563414 ?auto_563415 ) ( IN-CITY ?auto_563407 ?auto_563415 ) ( not ( = ?auto_563407 ?auto_563414 ) ) ( OBJ-AT ?auto_563412 ?auto_563414 ) ( IN-CITY ?auto_563417 ?auto_563415 ) ( not ( = ?auto_563407 ?auto_563417 ) ) ( OBJ-AT ?auto_563411 ?auto_563417 ) ( IN-CITY ?auto_563416 ?auto_563415 ) ( not ( = ?auto_563407 ?auto_563416 ) ) ( OBJ-AT ?auto_563413 ?auto_563416 ) ( OBJ-AT ?auto_563410 ?auto_563416 ) ( IN-CITY ?auto_563419 ?auto_563415 ) ( not ( = ?auto_563407 ?auto_563419 ) ) ( OBJ-AT ?auto_563408 ?auto_563419 ) ( OBJ-AT ?auto_563409 ?auto_563416 ) ( TRUCK-AT ?auto_563418 ?auto_563407 ) ( not ( = ?auto_563409 ?auto_563408 ) ) ( not ( = ?auto_563419 ?auto_563416 ) ) ( not ( = ?auto_563409 ?auto_563410 ) ) ( not ( = ?auto_563408 ?auto_563410 ) ) ( not ( = ?auto_563409 ?auto_563413 ) ) ( not ( = ?auto_563408 ?auto_563413 ) ) ( not ( = ?auto_563410 ?auto_563413 ) ) ( not ( = ?auto_563409 ?auto_563411 ) ) ( not ( = ?auto_563408 ?auto_563411 ) ) ( not ( = ?auto_563410 ?auto_563411 ) ) ( not ( = ?auto_563413 ?auto_563411 ) ) ( not ( = ?auto_563417 ?auto_563416 ) ) ( not ( = ?auto_563417 ?auto_563419 ) ) ( not ( = ?auto_563409 ?auto_563412 ) ) ( not ( = ?auto_563408 ?auto_563412 ) ) ( not ( = ?auto_563410 ?auto_563412 ) ) ( not ( = ?auto_563413 ?auto_563412 ) ) ( not ( = ?auto_563411 ?auto_563412 ) ) ( not ( = ?auto_563414 ?auto_563417 ) ) ( not ( = ?auto_563414 ?auto_563416 ) ) ( not ( = ?auto_563414 ?auto_563419 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_563409 ?auto_563408 ?auto_563410 ?auto_563411 ?auto_563413 ?auto_563412 ?auto_563407 )
      ( DELIVER-6PKG-VERIFY ?auto_563408 ?auto_563409 ?auto_563410 ?auto_563411 ?auto_563412 ?auto_563413 ?auto_563407 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_565588 - OBJ
      ?auto_565589 - OBJ
      ?auto_565590 - OBJ
      ?auto_565591 - OBJ
      ?auto_565592 - OBJ
      ?auto_565593 - OBJ
      ?auto_565587 - LOCATION
    )
    :vars
    (
      ?auto_565594 - LOCATION
      ?auto_565595 - CITY
      ?auto_565597 - LOCATION
      ?auto_565596 - LOCATION
      ?auto_565599 - LOCATION
      ?auto_565598 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_565594 ?auto_565595 ) ( IN-CITY ?auto_565587 ?auto_565595 ) ( not ( = ?auto_565587 ?auto_565594 ) ) ( OBJ-AT ?auto_565593 ?auto_565594 ) ( IN-CITY ?auto_565597 ?auto_565595 ) ( not ( = ?auto_565587 ?auto_565597 ) ) ( OBJ-AT ?auto_565590 ?auto_565597 ) ( IN-CITY ?auto_565596 ?auto_565595 ) ( not ( = ?auto_565587 ?auto_565596 ) ) ( OBJ-AT ?auto_565592 ?auto_565596 ) ( OBJ-AT ?auto_565591 ?auto_565596 ) ( IN-CITY ?auto_565599 ?auto_565595 ) ( not ( = ?auto_565587 ?auto_565599 ) ) ( OBJ-AT ?auto_565588 ?auto_565599 ) ( OBJ-AT ?auto_565589 ?auto_565596 ) ( TRUCK-AT ?auto_565598 ?auto_565587 ) ( not ( = ?auto_565589 ?auto_565588 ) ) ( not ( = ?auto_565599 ?auto_565596 ) ) ( not ( = ?auto_565589 ?auto_565591 ) ) ( not ( = ?auto_565588 ?auto_565591 ) ) ( not ( = ?auto_565589 ?auto_565592 ) ) ( not ( = ?auto_565588 ?auto_565592 ) ) ( not ( = ?auto_565591 ?auto_565592 ) ) ( not ( = ?auto_565589 ?auto_565590 ) ) ( not ( = ?auto_565588 ?auto_565590 ) ) ( not ( = ?auto_565591 ?auto_565590 ) ) ( not ( = ?auto_565592 ?auto_565590 ) ) ( not ( = ?auto_565597 ?auto_565596 ) ) ( not ( = ?auto_565597 ?auto_565599 ) ) ( not ( = ?auto_565589 ?auto_565593 ) ) ( not ( = ?auto_565588 ?auto_565593 ) ) ( not ( = ?auto_565591 ?auto_565593 ) ) ( not ( = ?auto_565592 ?auto_565593 ) ) ( not ( = ?auto_565590 ?auto_565593 ) ) ( not ( = ?auto_565594 ?auto_565597 ) ) ( not ( = ?auto_565594 ?auto_565596 ) ) ( not ( = ?auto_565594 ?auto_565599 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_565589 ?auto_565588 ?auto_565591 ?auto_565590 ?auto_565592 ?auto_565593 ?auto_565587 )
      ( DELIVER-6PKG-VERIFY ?auto_565588 ?auto_565589 ?auto_565590 ?auto_565591 ?auto_565592 ?auto_565593 ?auto_565587 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_565657 - OBJ
      ?auto_565658 - OBJ
      ?auto_565659 - OBJ
      ?auto_565660 - OBJ
      ?auto_565661 - OBJ
      ?auto_565662 - OBJ
      ?auto_565656 - LOCATION
    )
    :vars
    (
      ?auto_565663 - LOCATION
      ?auto_565664 - CITY
      ?auto_565666 - LOCATION
      ?auto_565665 - LOCATION
      ?auto_565668 - LOCATION
      ?auto_565667 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_565663 ?auto_565664 ) ( IN-CITY ?auto_565656 ?auto_565664 ) ( not ( = ?auto_565656 ?auto_565663 ) ) ( OBJ-AT ?auto_565661 ?auto_565663 ) ( IN-CITY ?auto_565666 ?auto_565664 ) ( not ( = ?auto_565656 ?auto_565666 ) ) ( OBJ-AT ?auto_565659 ?auto_565666 ) ( IN-CITY ?auto_565665 ?auto_565664 ) ( not ( = ?auto_565656 ?auto_565665 ) ) ( OBJ-AT ?auto_565662 ?auto_565665 ) ( OBJ-AT ?auto_565660 ?auto_565665 ) ( IN-CITY ?auto_565668 ?auto_565664 ) ( not ( = ?auto_565656 ?auto_565668 ) ) ( OBJ-AT ?auto_565657 ?auto_565668 ) ( OBJ-AT ?auto_565658 ?auto_565665 ) ( TRUCK-AT ?auto_565667 ?auto_565656 ) ( not ( = ?auto_565658 ?auto_565657 ) ) ( not ( = ?auto_565668 ?auto_565665 ) ) ( not ( = ?auto_565658 ?auto_565660 ) ) ( not ( = ?auto_565657 ?auto_565660 ) ) ( not ( = ?auto_565658 ?auto_565662 ) ) ( not ( = ?auto_565657 ?auto_565662 ) ) ( not ( = ?auto_565660 ?auto_565662 ) ) ( not ( = ?auto_565658 ?auto_565659 ) ) ( not ( = ?auto_565657 ?auto_565659 ) ) ( not ( = ?auto_565660 ?auto_565659 ) ) ( not ( = ?auto_565662 ?auto_565659 ) ) ( not ( = ?auto_565666 ?auto_565665 ) ) ( not ( = ?auto_565666 ?auto_565668 ) ) ( not ( = ?auto_565658 ?auto_565661 ) ) ( not ( = ?auto_565657 ?auto_565661 ) ) ( not ( = ?auto_565660 ?auto_565661 ) ) ( not ( = ?auto_565662 ?auto_565661 ) ) ( not ( = ?auto_565659 ?auto_565661 ) ) ( not ( = ?auto_565663 ?auto_565666 ) ) ( not ( = ?auto_565663 ?auto_565665 ) ) ( not ( = ?auto_565663 ?auto_565668 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_565658 ?auto_565657 ?auto_565660 ?auto_565659 ?auto_565662 ?auto_565661 ?auto_565656 )
      ( DELIVER-6PKG-VERIFY ?auto_565657 ?auto_565658 ?auto_565659 ?auto_565660 ?auto_565661 ?auto_565662 ?auto_565656 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_566217 - OBJ
      ?auto_566218 - OBJ
      ?auto_566219 - OBJ
      ?auto_566220 - OBJ
      ?auto_566221 - OBJ
      ?auto_566222 - OBJ
      ?auto_566216 - LOCATION
    )
    :vars
    (
      ?auto_566223 - LOCATION
      ?auto_566224 - CITY
      ?auto_566226 - LOCATION
      ?auto_566225 - LOCATION
      ?auto_566228 - LOCATION
      ?auto_566227 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_566223 ?auto_566224 ) ( IN-CITY ?auto_566216 ?auto_566224 ) ( not ( = ?auto_566216 ?auto_566223 ) ) ( OBJ-AT ?auto_566220 ?auto_566223 ) ( IN-CITY ?auto_566226 ?auto_566224 ) ( not ( = ?auto_566216 ?auto_566226 ) ) ( OBJ-AT ?auto_566219 ?auto_566226 ) ( IN-CITY ?auto_566225 ?auto_566224 ) ( not ( = ?auto_566216 ?auto_566225 ) ) ( OBJ-AT ?auto_566222 ?auto_566225 ) ( OBJ-AT ?auto_566221 ?auto_566225 ) ( IN-CITY ?auto_566228 ?auto_566224 ) ( not ( = ?auto_566216 ?auto_566228 ) ) ( OBJ-AT ?auto_566217 ?auto_566228 ) ( OBJ-AT ?auto_566218 ?auto_566225 ) ( TRUCK-AT ?auto_566227 ?auto_566216 ) ( not ( = ?auto_566218 ?auto_566217 ) ) ( not ( = ?auto_566228 ?auto_566225 ) ) ( not ( = ?auto_566218 ?auto_566221 ) ) ( not ( = ?auto_566217 ?auto_566221 ) ) ( not ( = ?auto_566218 ?auto_566222 ) ) ( not ( = ?auto_566217 ?auto_566222 ) ) ( not ( = ?auto_566221 ?auto_566222 ) ) ( not ( = ?auto_566218 ?auto_566219 ) ) ( not ( = ?auto_566217 ?auto_566219 ) ) ( not ( = ?auto_566221 ?auto_566219 ) ) ( not ( = ?auto_566222 ?auto_566219 ) ) ( not ( = ?auto_566226 ?auto_566225 ) ) ( not ( = ?auto_566226 ?auto_566228 ) ) ( not ( = ?auto_566218 ?auto_566220 ) ) ( not ( = ?auto_566217 ?auto_566220 ) ) ( not ( = ?auto_566221 ?auto_566220 ) ) ( not ( = ?auto_566222 ?auto_566220 ) ) ( not ( = ?auto_566219 ?auto_566220 ) ) ( not ( = ?auto_566223 ?auto_566226 ) ) ( not ( = ?auto_566223 ?auto_566225 ) ) ( not ( = ?auto_566223 ?auto_566228 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_566218 ?auto_566217 ?auto_566221 ?auto_566219 ?auto_566222 ?auto_566220 ?auto_566216 )
      ( DELIVER-6PKG-VERIFY ?auto_566217 ?auto_566218 ?auto_566219 ?auto_566220 ?auto_566221 ?auto_566222 ?auto_566216 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_599593 - OBJ
      ?auto_599594 - OBJ
      ?auto_599595 - OBJ
      ?auto_599596 - OBJ
      ?auto_599597 - OBJ
      ?auto_599598 - OBJ
      ?auto_599592 - LOCATION
    )
    :vars
    (
      ?auto_599599 - LOCATION
      ?auto_599600 - CITY
      ?auto_599602 - LOCATION
      ?auto_599601 - LOCATION
      ?auto_599604 - LOCATION
      ?auto_599603 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_599599 ?auto_599600 ) ( IN-CITY ?auto_599592 ?auto_599600 ) ( not ( = ?auto_599592 ?auto_599599 ) ) ( OBJ-AT ?auto_599598 ?auto_599599 ) ( IN-CITY ?auto_599602 ?auto_599600 ) ( not ( = ?auto_599592 ?auto_599602 ) ) ( OBJ-AT ?auto_599594 ?auto_599602 ) ( IN-CITY ?auto_599601 ?auto_599600 ) ( not ( = ?auto_599592 ?auto_599601 ) ) ( OBJ-AT ?auto_599597 ?auto_599601 ) ( OBJ-AT ?auto_599596 ?auto_599601 ) ( IN-CITY ?auto_599604 ?auto_599600 ) ( not ( = ?auto_599592 ?auto_599604 ) ) ( OBJ-AT ?auto_599593 ?auto_599604 ) ( OBJ-AT ?auto_599595 ?auto_599601 ) ( TRUCK-AT ?auto_599603 ?auto_599592 ) ( not ( = ?auto_599595 ?auto_599593 ) ) ( not ( = ?auto_599604 ?auto_599601 ) ) ( not ( = ?auto_599595 ?auto_599596 ) ) ( not ( = ?auto_599593 ?auto_599596 ) ) ( not ( = ?auto_599595 ?auto_599597 ) ) ( not ( = ?auto_599593 ?auto_599597 ) ) ( not ( = ?auto_599596 ?auto_599597 ) ) ( not ( = ?auto_599595 ?auto_599594 ) ) ( not ( = ?auto_599593 ?auto_599594 ) ) ( not ( = ?auto_599596 ?auto_599594 ) ) ( not ( = ?auto_599597 ?auto_599594 ) ) ( not ( = ?auto_599602 ?auto_599601 ) ) ( not ( = ?auto_599602 ?auto_599604 ) ) ( not ( = ?auto_599595 ?auto_599598 ) ) ( not ( = ?auto_599593 ?auto_599598 ) ) ( not ( = ?auto_599596 ?auto_599598 ) ) ( not ( = ?auto_599597 ?auto_599598 ) ) ( not ( = ?auto_599594 ?auto_599598 ) ) ( not ( = ?auto_599599 ?auto_599602 ) ) ( not ( = ?auto_599599 ?auto_599601 ) ) ( not ( = ?auto_599599 ?auto_599604 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_599595 ?auto_599593 ?auto_599596 ?auto_599594 ?auto_599597 ?auto_599598 ?auto_599592 )
      ( DELIVER-6PKG-VERIFY ?auto_599593 ?auto_599594 ?auto_599595 ?auto_599596 ?auto_599597 ?auto_599598 ?auto_599592 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_599662 - OBJ
      ?auto_599663 - OBJ
      ?auto_599664 - OBJ
      ?auto_599665 - OBJ
      ?auto_599666 - OBJ
      ?auto_599667 - OBJ
      ?auto_599661 - LOCATION
    )
    :vars
    (
      ?auto_599668 - LOCATION
      ?auto_599669 - CITY
      ?auto_599671 - LOCATION
      ?auto_599670 - LOCATION
      ?auto_599673 - LOCATION
      ?auto_599672 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_599668 ?auto_599669 ) ( IN-CITY ?auto_599661 ?auto_599669 ) ( not ( = ?auto_599661 ?auto_599668 ) ) ( OBJ-AT ?auto_599666 ?auto_599668 ) ( IN-CITY ?auto_599671 ?auto_599669 ) ( not ( = ?auto_599661 ?auto_599671 ) ) ( OBJ-AT ?auto_599663 ?auto_599671 ) ( IN-CITY ?auto_599670 ?auto_599669 ) ( not ( = ?auto_599661 ?auto_599670 ) ) ( OBJ-AT ?auto_599667 ?auto_599670 ) ( OBJ-AT ?auto_599665 ?auto_599670 ) ( IN-CITY ?auto_599673 ?auto_599669 ) ( not ( = ?auto_599661 ?auto_599673 ) ) ( OBJ-AT ?auto_599662 ?auto_599673 ) ( OBJ-AT ?auto_599664 ?auto_599670 ) ( TRUCK-AT ?auto_599672 ?auto_599661 ) ( not ( = ?auto_599664 ?auto_599662 ) ) ( not ( = ?auto_599673 ?auto_599670 ) ) ( not ( = ?auto_599664 ?auto_599665 ) ) ( not ( = ?auto_599662 ?auto_599665 ) ) ( not ( = ?auto_599664 ?auto_599667 ) ) ( not ( = ?auto_599662 ?auto_599667 ) ) ( not ( = ?auto_599665 ?auto_599667 ) ) ( not ( = ?auto_599664 ?auto_599663 ) ) ( not ( = ?auto_599662 ?auto_599663 ) ) ( not ( = ?auto_599665 ?auto_599663 ) ) ( not ( = ?auto_599667 ?auto_599663 ) ) ( not ( = ?auto_599671 ?auto_599670 ) ) ( not ( = ?auto_599671 ?auto_599673 ) ) ( not ( = ?auto_599664 ?auto_599666 ) ) ( not ( = ?auto_599662 ?auto_599666 ) ) ( not ( = ?auto_599665 ?auto_599666 ) ) ( not ( = ?auto_599667 ?auto_599666 ) ) ( not ( = ?auto_599663 ?auto_599666 ) ) ( not ( = ?auto_599668 ?auto_599671 ) ) ( not ( = ?auto_599668 ?auto_599670 ) ) ( not ( = ?auto_599668 ?auto_599673 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_599664 ?auto_599662 ?auto_599665 ?auto_599663 ?auto_599667 ?auto_599666 ?auto_599661 )
      ( DELIVER-6PKG-VERIFY ?auto_599662 ?auto_599663 ?auto_599664 ?auto_599665 ?auto_599666 ?auto_599667 ?auto_599661 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_600222 - OBJ
      ?auto_600223 - OBJ
      ?auto_600224 - OBJ
      ?auto_600225 - OBJ
      ?auto_600226 - OBJ
      ?auto_600227 - OBJ
      ?auto_600221 - LOCATION
    )
    :vars
    (
      ?auto_600228 - LOCATION
      ?auto_600229 - CITY
      ?auto_600231 - LOCATION
      ?auto_600230 - LOCATION
      ?auto_600233 - LOCATION
      ?auto_600232 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_600228 ?auto_600229 ) ( IN-CITY ?auto_600221 ?auto_600229 ) ( not ( = ?auto_600221 ?auto_600228 ) ) ( OBJ-AT ?auto_600225 ?auto_600228 ) ( IN-CITY ?auto_600231 ?auto_600229 ) ( not ( = ?auto_600221 ?auto_600231 ) ) ( OBJ-AT ?auto_600223 ?auto_600231 ) ( IN-CITY ?auto_600230 ?auto_600229 ) ( not ( = ?auto_600221 ?auto_600230 ) ) ( OBJ-AT ?auto_600227 ?auto_600230 ) ( OBJ-AT ?auto_600226 ?auto_600230 ) ( IN-CITY ?auto_600233 ?auto_600229 ) ( not ( = ?auto_600221 ?auto_600233 ) ) ( OBJ-AT ?auto_600222 ?auto_600233 ) ( OBJ-AT ?auto_600224 ?auto_600230 ) ( TRUCK-AT ?auto_600232 ?auto_600221 ) ( not ( = ?auto_600224 ?auto_600222 ) ) ( not ( = ?auto_600233 ?auto_600230 ) ) ( not ( = ?auto_600224 ?auto_600226 ) ) ( not ( = ?auto_600222 ?auto_600226 ) ) ( not ( = ?auto_600224 ?auto_600227 ) ) ( not ( = ?auto_600222 ?auto_600227 ) ) ( not ( = ?auto_600226 ?auto_600227 ) ) ( not ( = ?auto_600224 ?auto_600223 ) ) ( not ( = ?auto_600222 ?auto_600223 ) ) ( not ( = ?auto_600226 ?auto_600223 ) ) ( not ( = ?auto_600227 ?auto_600223 ) ) ( not ( = ?auto_600231 ?auto_600230 ) ) ( not ( = ?auto_600231 ?auto_600233 ) ) ( not ( = ?auto_600224 ?auto_600225 ) ) ( not ( = ?auto_600222 ?auto_600225 ) ) ( not ( = ?auto_600226 ?auto_600225 ) ) ( not ( = ?auto_600227 ?auto_600225 ) ) ( not ( = ?auto_600223 ?auto_600225 ) ) ( not ( = ?auto_600228 ?auto_600231 ) ) ( not ( = ?auto_600228 ?auto_600230 ) ) ( not ( = ?auto_600228 ?auto_600233 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_600224 ?auto_600222 ?auto_600226 ?auto_600223 ?auto_600227 ?auto_600225 ?auto_600221 )
      ( DELIVER-6PKG-VERIFY ?auto_600222 ?auto_600223 ?auto_600224 ?auto_600225 ?auto_600226 ?auto_600227 ?auto_600221 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_606004 - OBJ
      ?auto_606005 - OBJ
      ?auto_606006 - OBJ
      ?auto_606007 - OBJ
      ?auto_606008 - OBJ
      ?auto_606009 - OBJ
      ?auto_606003 - LOCATION
    )
    :vars
    (
      ?auto_606010 - LOCATION
      ?auto_606011 - CITY
      ?auto_606013 - LOCATION
      ?auto_606012 - LOCATION
      ?auto_606015 - LOCATION
      ?auto_606014 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_606010 ?auto_606011 ) ( IN-CITY ?auto_606003 ?auto_606011 ) ( not ( = ?auto_606003 ?auto_606010 ) ) ( OBJ-AT ?auto_606006 ?auto_606010 ) ( IN-CITY ?auto_606013 ?auto_606011 ) ( not ( = ?auto_606003 ?auto_606013 ) ) ( OBJ-AT ?auto_606005 ?auto_606013 ) ( IN-CITY ?auto_606012 ?auto_606011 ) ( not ( = ?auto_606003 ?auto_606012 ) ) ( OBJ-AT ?auto_606009 ?auto_606012 ) ( OBJ-AT ?auto_606008 ?auto_606012 ) ( IN-CITY ?auto_606015 ?auto_606011 ) ( not ( = ?auto_606003 ?auto_606015 ) ) ( OBJ-AT ?auto_606004 ?auto_606015 ) ( OBJ-AT ?auto_606007 ?auto_606012 ) ( TRUCK-AT ?auto_606014 ?auto_606003 ) ( not ( = ?auto_606007 ?auto_606004 ) ) ( not ( = ?auto_606015 ?auto_606012 ) ) ( not ( = ?auto_606007 ?auto_606008 ) ) ( not ( = ?auto_606004 ?auto_606008 ) ) ( not ( = ?auto_606007 ?auto_606009 ) ) ( not ( = ?auto_606004 ?auto_606009 ) ) ( not ( = ?auto_606008 ?auto_606009 ) ) ( not ( = ?auto_606007 ?auto_606005 ) ) ( not ( = ?auto_606004 ?auto_606005 ) ) ( not ( = ?auto_606008 ?auto_606005 ) ) ( not ( = ?auto_606009 ?auto_606005 ) ) ( not ( = ?auto_606013 ?auto_606012 ) ) ( not ( = ?auto_606013 ?auto_606015 ) ) ( not ( = ?auto_606007 ?auto_606006 ) ) ( not ( = ?auto_606004 ?auto_606006 ) ) ( not ( = ?auto_606008 ?auto_606006 ) ) ( not ( = ?auto_606009 ?auto_606006 ) ) ( not ( = ?auto_606005 ?auto_606006 ) ) ( not ( = ?auto_606010 ?auto_606013 ) ) ( not ( = ?auto_606010 ?auto_606012 ) ) ( not ( = ?auto_606010 ?auto_606015 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_606007 ?auto_606004 ?auto_606008 ?auto_606005 ?auto_606009 ?auto_606006 ?auto_606003 )
      ( DELIVER-6PKG-VERIFY ?auto_606004 ?auto_606005 ?auto_606006 ?auto_606007 ?auto_606008 ?auto_606009 ?auto_606003 ) )
  )

)

