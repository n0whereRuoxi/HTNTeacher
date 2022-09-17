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
      ?auto_11390 - OBJ
      ?auto_11391 - LOCATION
    )
    :vars
    (
      ?auto_11392 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11392 ?auto_11391 ) ( IN-TRUCK ?auto_11390 ?auto_11392 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_11390 ?auto_11392 ?auto_11391 )
      ( DELIVER-1PKG-VERIFY ?auto_11390 ?auto_11391 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11408 - OBJ
      ?auto_11409 - LOCATION
    )
    :vars
    (
      ?auto_11410 - TRUCK
      ?auto_11414 - LOCATION
      ?auto_11415 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11408 ?auto_11410 ) ( TRUCK-AT ?auto_11410 ?auto_11414 ) ( IN-CITY ?auto_11414 ?auto_11415 ) ( IN-CITY ?auto_11409 ?auto_11415 ) ( not ( = ?auto_11409 ?auto_11414 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11410 ?auto_11414 ?auto_11409 ?auto_11415 )
      ( DELIVER-1PKG ?auto_11408 ?auto_11409 )
      ( DELIVER-1PKG-VERIFY ?auto_11408 ?auto_11409 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11434 - OBJ
      ?auto_11435 - LOCATION
    )
    :vars
    (
      ?auto_11438 - TRUCK
      ?auto_11440 - LOCATION
      ?auto_11439 - CITY
      ?auto_11442 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11438 ?auto_11440 ) ( IN-CITY ?auto_11440 ?auto_11439 ) ( IN-CITY ?auto_11435 ?auto_11439 ) ( not ( = ?auto_11435 ?auto_11440 ) ) ( TRUCK-AT ?auto_11438 ?auto_11442 ) ( OBJ-AT ?auto_11434 ?auto_11442 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11434 ?auto_11438 ?auto_11442 )
      ( DELIVER-1PKG ?auto_11434 ?auto_11435 )
      ( DELIVER-1PKG-VERIFY ?auto_11434 ?auto_11435 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11463 - OBJ
      ?auto_11464 - LOCATION
    )
    :vars
    (
      ?auto_11466 - LOCATION
      ?auto_11469 - CITY
      ?auto_11467 - TRUCK
      ?auto_11472 - LOCATION
      ?auto_11473 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_11466 ?auto_11469 ) ( IN-CITY ?auto_11464 ?auto_11469 ) ( not ( = ?auto_11464 ?auto_11466 ) ) ( OBJ-AT ?auto_11463 ?auto_11466 ) ( TRUCK-AT ?auto_11467 ?auto_11472 ) ( IN-CITY ?auto_11472 ?auto_11473 ) ( IN-CITY ?auto_11466 ?auto_11473 ) ( not ( = ?auto_11466 ?auto_11472 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11467 ?auto_11472 ?auto_11466 ?auto_11473 )
      ( DELIVER-1PKG ?auto_11463 ?auto_11464 )
      ( DELIVER-1PKG-VERIFY ?auto_11463 ?auto_11464 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11540 - OBJ
      ?auto_11542 - OBJ
      ?auto_11541 - LOCATION
    )
    :vars
    (
      ?auto_11544 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11542 ?auto_11540 ) ( TRUCK-AT ?auto_11544 ?auto_11541 ) ( IN-TRUCK ?auto_11542 ?auto_11544 ) ( OBJ-AT ?auto_11540 ?auto_11541 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11542 ?auto_11541 )
      ( DELIVER-2PKG-VERIFY ?auto_11540 ?auto_11542 ?auto_11541 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11616 - OBJ
      ?auto_11618 - OBJ
      ?auto_11617 - LOCATION
    )
    :vars
    (
      ?auto_11621 - TRUCK
      ?auto_11622 - LOCATION
      ?auto_11620 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11618 ?auto_11616 ) ( IN-TRUCK ?auto_11618 ?auto_11621 ) ( TRUCK-AT ?auto_11621 ?auto_11622 ) ( IN-CITY ?auto_11622 ?auto_11620 ) ( IN-CITY ?auto_11617 ?auto_11620 ) ( not ( = ?auto_11617 ?auto_11622 ) ) ( OBJ-AT ?auto_11616 ?auto_11617 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11618 ?auto_11617 )
      ( DELIVER-2PKG-VERIFY ?auto_11616 ?auto_11618 ?auto_11617 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11712 - OBJ
      ?auto_11713 - LOCATION
    )
    :vars
    (
      ?auto_11718 - OBJ
      ?auto_11716 - TRUCK
      ?auto_11719 - LOCATION
      ?auto_11715 - CITY
      ?auto_11721 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11712 ?auto_11718 ) ( TRUCK-AT ?auto_11716 ?auto_11719 ) ( IN-CITY ?auto_11719 ?auto_11715 ) ( IN-CITY ?auto_11713 ?auto_11715 ) ( not ( = ?auto_11713 ?auto_11719 ) ) ( OBJ-AT ?auto_11718 ?auto_11713 ) ( TRUCK-AT ?auto_11716 ?auto_11721 ) ( OBJ-AT ?auto_11712 ?auto_11721 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11712 ?auto_11716 ?auto_11721 )
      ( DELIVER-2PKG ?auto_11718 ?auto_11712 ?auto_11713 )
      ( DELIVER-1PKG-VERIFY ?auto_11712 ?auto_11713 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11723 - OBJ
      ?auto_11725 - OBJ
      ?auto_11724 - LOCATION
    )
    :vars
    (
      ?auto_11726 - OBJ
      ?auto_11730 - TRUCK
      ?auto_11727 - LOCATION
      ?auto_11732 - CITY
      ?auto_11728 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11725 ?auto_11723 ) ( GREATER-THAN ?auto_11725 ?auto_11726 ) ( TRUCK-AT ?auto_11730 ?auto_11727 ) ( IN-CITY ?auto_11727 ?auto_11732 ) ( IN-CITY ?auto_11724 ?auto_11732 ) ( not ( = ?auto_11724 ?auto_11727 ) ) ( OBJ-AT ?auto_11726 ?auto_11724 ) ( TRUCK-AT ?auto_11730 ?auto_11728 ) ( OBJ-AT ?auto_11725 ?auto_11728 ) ( OBJ-AT ?auto_11723 ?auto_11724 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11725 ?auto_11724 )
      ( DELIVER-2PKG-VERIFY ?auto_11723 ?auto_11725 ?auto_11724 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11839 - OBJ
      ?auto_11840 - LOCATION
    )
    :vars
    (
      ?auto_11846 - OBJ
      ?auto_11843 - OBJ
      ?auto_11847 - LOCATION
      ?auto_11841 - CITY
      ?auto_11842 - TRUCK
      ?auto_11850 - LOCATION
      ?auto_11851 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11839 ?auto_11846 ) ( GREATER-THAN ?auto_11839 ?auto_11843 ) ( IN-CITY ?auto_11847 ?auto_11841 ) ( IN-CITY ?auto_11840 ?auto_11841 ) ( not ( = ?auto_11840 ?auto_11847 ) ) ( OBJ-AT ?auto_11843 ?auto_11840 ) ( OBJ-AT ?auto_11839 ?auto_11847 ) ( OBJ-AT ?auto_11846 ?auto_11840 ) ( TRUCK-AT ?auto_11842 ?auto_11850 ) ( IN-CITY ?auto_11850 ?auto_11851 ) ( IN-CITY ?auto_11847 ?auto_11851 ) ( not ( = ?auto_11847 ?auto_11850 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11842 ?auto_11850 ?auto_11847 ?auto_11851 )
      ( DELIVER-2PKG ?auto_11846 ?auto_11839 ?auto_11840 )
      ( DELIVER-1PKG-VERIFY ?auto_11839 ?auto_11840 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11853 - OBJ
      ?auto_11855 - OBJ
      ?auto_11854 - LOCATION
    )
    :vars
    (
      ?auto_11860 - OBJ
      ?auto_11864 - OBJ
      ?auto_11857 - LOCATION
      ?auto_11859 - CITY
      ?auto_11858 - TRUCK
      ?auto_11861 - LOCATION
      ?auto_11862 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11855 ?auto_11853 ) ( GREATER-THAN ?auto_11855 ?auto_11860 ) ( GREATER-THAN ?auto_11855 ?auto_11864 ) ( IN-CITY ?auto_11857 ?auto_11859 ) ( IN-CITY ?auto_11854 ?auto_11859 ) ( not ( = ?auto_11854 ?auto_11857 ) ) ( OBJ-AT ?auto_11864 ?auto_11854 ) ( OBJ-AT ?auto_11855 ?auto_11857 ) ( OBJ-AT ?auto_11860 ?auto_11854 ) ( TRUCK-AT ?auto_11858 ?auto_11861 ) ( IN-CITY ?auto_11861 ?auto_11862 ) ( IN-CITY ?auto_11857 ?auto_11862 ) ( not ( = ?auto_11857 ?auto_11861 ) ) ( OBJ-AT ?auto_11853 ?auto_11854 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11855 ?auto_11854 )
      ( DELIVER-2PKG-VERIFY ?auto_11853 ?auto_11855 ?auto_11854 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11989 - OBJ
      ?auto_11990 - LOCATION
    )
    :vars
    (
      ?auto_11997 - OBJ
      ?auto_11995 - LOCATION
      ?auto_11994 - CITY
      ?auto_11993 - TRUCK
      ?auto_11992 - LOCATION
      ?auto_11999 - CITY
      ?auto_12001 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11989 ?auto_11997 ) ( IN-CITY ?auto_11995 ?auto_11994 ) ( IN-CITY ?auto_11990 ?auto_11994 ) ( not ( = ?auto_11990 ?auto_11995 ) ) ( OBJ-AT ?auto_11989 ?auto_11995 ) ( TRUCK-AT ?auto_11993 ?auto_11992 ) ( IN-CITY ?auto_11992 ?auto_11999 ) ( IN-CITY ?auto_11995 ?auto_11999 ) ( not ( = ?auto_11995 ?auto_11992 ) ) ( TRUCK-AT ?auto_12001 ?auto_11990 ) ( IN-TRUCK ?auto_11997 ?auto_12001 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11997 ?auto_11990 )
      ( DELIVER-2PKG ?auto_11997 ?auto_11989 ?auto_11990 )
      ( DELIVER-1PKG-VERIFY ?auto_11989 ?auto_11990 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12004 - OBJ
      ?auto_12006 - OBJ
      ?auto_12005 - LOCATION
    )
    :vars
    (
      ?auto_12009 - LOCATION
      ?auto_12015 - CITY
      ?auto_12011 - TRUCK
      ?auto_12014 - LOCATION
      ?auto_12012 - CITY
      ?auto_12008 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12006 ?auto_12004 ) ( IN-CITY ?auto_12009 ?auto_12015 ) ( IN-CITY ?auto_12005 ?auto_12015 ) ( not ( = ?auto_12005 ?auto_12009 ) ) ( OBJ-AT ?auto_12006 ?auto_12009 ) ( TRUCK-AT ?auto_12011 ?auto_12014 ) ( IN-CITY ?auto_12014 ?auto_12012 ) ( IN-CITY ?auto_12009 ?auto_12012 ) ( not ( = ?auto_12009 ?auto_12014 ) ) ( TRUCK-AT ?auto_12008 ?auto_12005 ) ( IN-TRUCK ?auto_12004 ?auto_12008 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12006 ?auto_12005 )
      ( DELIVER-2PKG-VERIFY ?auto_12004 ?auto_12006 ?auto_12005 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12131 - OBJ
      ?auto_12132 - LOCATION
    )
    :vars
    (
      ?auto_12138 - OBJ
      ?auto_12141 - LOCATION
      ?auto_12140 - CITY
      ?auto_12135 - CITY
      ?auto_12134 - TRUCK
      ?auto_12143 - LOCATION
      ?auto_12144 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12131 ?auto_12138 ) ( IN-CITY ?auto_12141 ?auto_12140 ) ( IN-CITY ?auto_12132 ?auto_12140 ) ( not ( = ?auto_12132 ?auto_12141 ) ) ( OBJ-AT ?auto_12131 ?auto_12141 ) ( IN-CITY ?auto_12132 ?auto_12135 ) ( IN-CITY ?auto_12141 ?auto_12135 ) ( IN-TRUCK ?auto_12138 ?auto_12134 ) ( TRUCK-AT ?auto_12134 ?auto_12143 ) ( IN-CITY ?auto_12143 ?auto_12144 ) ( IN-CITY ?auto_12132 ?auto_12144 ) ( not ( = ?auto_12132 ?auto_12143 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12134 ?auto_12143 ?auto_12132 ?auto_12144 )
      ( DELIVER-2PKG ?auto_12138 ?auto_12131 ?auto_12132 )
      ( DELIVER-1PKG-VERIFY ?auto_12131 ?auto_12132 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12146 - OBJ
      ?auto_12148 - OBJ
      ?auto_12147 - LOCATION
    )
    :vars
    (
      ?auto_12157 - LOCATION
      ?auto_12155 - CITY
      ?auto_12156 - CITY
      ?auto_12150 - TRUCK
      ?auto_12154 - LOCATION
      ?auto_12153 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12148 ?auto_12146 ) ( IN-CITY ?auto_12157 ?auto_12155 ) ( IN-CITY ?auto_12147 ?auto_12155 ) ( not ( = ?auto_12147 ?auto_12157 ) ) ( OBJ-AT ?auto_12148 ?auto_12157 ) ( IN-CITY ?auto_12147 ?auto_12156 ) ( IN-CITY ?auto_12157 ?auto_12156 ) ( IN-TRUCK ?auto_12146 ?auto_12150 ) ( TRUCK-AT ?auto_12150 ?auto_12154 ) ( IN-CITY ?auto_12154 ?auto_12153 ) ( IN-CITY ?auto_12147 ?auto_12153 ) ( not ( = ?auto_12147 ?auto_12154 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12148 ?auto_12147 )
      ( DELIVER-2PKG-VERIFY ?auto_12146 ?auto_12148 ?auto_12147 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12613 - OBJ
      ?auto_12615 - OBJ
      ?auto_12616 - OBJ
      ?auto_12614 - LOCATION
    )
    :vars
    (
      ?auto_12618 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12615 ?auto_12613 ) ( GREATER-THAN ?auto_12616 ?auto_12613 ) ( GREATER-THAN ?auto_12616 ?auto_12615 ) ( TRUCK-AT ?auto_12618 ?auto_12614 ) ( IN-TRUCK ?auto_12616 ?auto_12618 ) ( OBJ-AT ?auto_12613 ?auto_12614 ) ( OBJ-AT ?auto_12615 ?auto_12614 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12616 ?auto_12614 )
      ( DELIVER-3PKG-VERIFY ?auto_12613 ?auto_12615 ?auto_12616 ?auto_12614 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12796 - OBJ
      ?auto_12798 - OBJ
      ?auto_12799 - OBJ
      ?auto_12797 - LOCATION
    )
    :vars
    (
      ?auto_12803 - OBJ
      ?auto_12801 - TRUCK
      ?auto_12800 - LOCATION
      ?auto_12805 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_12798 ?auto_12796 ) ( GREATER-THAN ?auto_12799 ?auto_12796 ) ( GREATER-THAN ?auto_12799 ?auto_12798 ) ( GREATER-THAN ?auto_12799 ?auto_12803 ) ( IN-TRUCK ?auto_12799 ?auto_12801 ) ( TRUCK-AT ?auto_12801 ?auto_12800 ) ( IN-CITY ?auto_12800 ?auto_12805 ) ( IN-CITY ?auto_12797 ?auto_12805 ) ( not ( = ?auto_12797 ?auto_12800 ) ) ( OBJ-AT ?auto_12803 ?auto_12797 ) ( OBJ-AT ?auto_12796 ?auto_12797 ) ( OBJ-AT ?auto_12798 ?auto_12797 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12803 ?auto_12799 ?auto_12797 )
      ( DELIVER-3PKG-VERIFY ?auto_12796 ?auto_12798 ?auto_12799 ?auto_12797 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13045 - OBJ
      ?auto_13047 - OBJ
      ?auto_13048 - OBJ
      ?auto_13046 - LOCATION
    )
    :vars
    (
      ?auto_13050 - OBJ
      ?auto_13055 - OBJ
      ?auto_13052 - TRUCK
      ?auto_13051 - LOCATION
      ?auto_13054 - CITY
      ?auto_13056 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13047 ?auto_13045 ) ( GREATER-THAN ?auto_13048 ?auto_13045 ) ( GREATER-THAN ?auto_13048 ?auto_13047 ) ( GREATER-THAN ?auto_13048 ?auto_13050 ) ( GREATER-THAN ?auto_13048 ?auto_13055 ) ( TRUCK-AT ?auto_13052 ?auto_13051 ) ( IN-CITY ?auto_13051 ?auto_13054 ) ( IN-CITY ?auto_13046 ?auto_13054 ) ( not ( = ?auto_13046 ?auto_13051 ) ) ( OBJ-AT ?auto_13055 ?auto_13046 ) ( TRUCK-AT ?auto_13052 ?auto_13056 ) ( OBJ-AT ?auto_13048 ?auto_13056 ) ( OBJ-AT ?auto_13050 ?auto_13046 ) ( OBJ-AT ?auto_13045 ?auto_13046 ) ( OBJ-AT ?auto_13047 ?auto_13046 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13050 ?auto_13048 ?auto_13046 )
      ( DELIVER-3PKG-VERIFY ?auto_13045 ?auto_13047 ?auto_13048 ?auto_13046 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13343 - OBJ
      ?auto_13345 - OBJ
      ?auto_13346 - OBJ
      ?auto_13344 - LOCATION
    )
    :vars
    (
      ?auto_13350 - OBJ
      ?auto_13355 - OBJ
      ?auto_13354 - OBJ
      ?auto_13352 - LOCATION
      ?auto_13348 - CITY
      ?auto_13347 - TRUCK
      ?auto_13353 - LOCATION
      ?auto_13356 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13345 ?auto_13343 ) ( GREATER-THAN ?auto_13346 ?auto_13343 ) ( GREATER-THAN ?auto_13346 ?auto_13345 ) ( GREATER-THAN ?auto_13346 ?auto_13350 ) ( GREATER-THAN ?auto_13346 ?auto_13355 ) ( GREATER-THAN ?auto_13346 ?auto_13354 ) ( IN-CITY ?auto_13352 ?auto_13348 ) ( IN-CITY ?auto_13344 ?auto_13348 ) ( not ( = ?auto_13344 ?auto_13352 ) ) ( OBJ-AT ?auto_13354 ?auto_13344 ) ( OBJ-AT ?auto_13346 ?auto_13352 ) ( OBJ-AT ?auto_13355 ?auto_13344 ) ( TRUCK-AT ?auto_13347 ?auto_13353 ) ( IN-CITY ?auto_13353 ?auto_13356 ) ( IN-CITY ?auto_13352 ?auto_13356 ) ( not ( = ?auto_13352 ?auto_13353 ) ) ( OBJ-AT ?auto_13350 ?auto_13344 ) ( OBJ-AT ?auto_13343 ?auto_13344 ) ( OBJ-AT ?auto_13345 ?auto_13344 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13350 ?auto_13346 ?auto_13344 )
      ( DELIVER-3PKG-VERIFY ?auto_13343 ?auto_13345 ?auto_13346 ?auto_13344 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15487 - OBJ
      ?auto_15488 - LOCATION
    )
    :vars
    (
      ?auto_15492 - OBJ
      ?auto_15496 - LOCATION
      ?auto_15493 - CITY
      ?auto_15497 - CITY
      ?auto_15491 - TRUCK
      ?auto_15495 - LOCATION
      ?auto_15490 - CITY
      ?auto_15499 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15487 ?auto_15492 ) ( IN-CITY ?auto_15496 ?auto_15493 ) ( IN-CITY ?auto_15488 ?auto_15493 ) ( not ( = ?auto_15488 ?auto_15496 ) ) ( OBJ-AT ?auto_15487 ?auto_15496 ) ( IN-CITY ?auto_15488 ?auto_15497 ) ( IN-CITY ?auto_15496 ?auto_15497 ) ( TRUCK-AT ?auto_15491 ?auto_15495 ) ( IN-CITY ?auto_15495 ?auto_15490 ) ( IN-CITY ?auto_15488 ?auto_15490 ) ( not ( = ?auto_15488 ?auto_15495 ) ) ( TRUCK-AT ?auto_15491 ?auto_15499 ) ( OBJ-AT ?auto_15492 ?auto_15499 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15492 ?auto_15491 ?auto_15499 )
      ( DELIVER-2PKG ?auto_15492 ?auto_15487 ?auto_15488 )
      ( DELIVER-1PKG-VERIFY ?auto_15487 ?auto_15488 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15501 - OBJ
      ?auto_15503 - OBJ
      ?auto_15502 - LOCATION
    )
    :vars
    (
      ?auto_15505 - LOCATION
      ?auto_15507 - CITY
      ?auto_15511 - CITY
      ?auto_15508 - TRUCK
      ?auto_15506 - LOCATION
      ?auto_15509 - CITY
      ?auto_15513 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15503 ?auto_15501 ) ( IN-CITY ?auto_15505 ?auto_15507 ) ( IN-CITY ?auto_15502 ?auto_15507 ) ( not ( = ?auto_15502 ?auto_15505 ) ) ( OBJ-AT ?auto_15503 ?auto_15505 ) ( IN-CITY ?auto_15502 ?auto_15511 ) ( IN-CITY ?auto_15505 ?auto_15511 ) ( TRUCK-AT ?auto_15508 ?auto_15506 ) ( IN-CITY ?auto_15506 ?auto_15509 ) ( IN-CITY ?auto_15502 ?auto_15509 ) ( not ( = ?auto_15502 ?auto_15506 ) ) ( TRUCK-AT ?auto_15508 ?auto_15513 ) ( OBJ-AT ?auto_15501 ?auto_15513 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15503 ?auto_15502 )
      ( DELIVER-2PKG-VERIFY ?auto_15501 ?auto_15503 ?auto_15502 ) )
  )

)

