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
      ?auto_893658 - OBJ
      ?auto_893657 - LOCATION
    )
    :vars
    (
      ?auto_893659 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_893659 ?auto_893657 ) ( IN-TRUCK ?auto_893658 ?auto_893659 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_893658 ?auto_893659 ?auto_893657 )
      ( DELIVER-1PKG-VERIFY ?auto_893658 ?auto_893657 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_893683 - OBJ
      ?auto_893682 - LOCATION
    )
    :vars
    (
      ?auto_893684 - TRUCK
      ?auto_893685 - LOCATION
      ?auto_893686 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_893683 ?auto_893684 ) ( TRUCK-AT ?auto_893684 ?auto_893685 ) ( IN-CITY ?auto_893685 ?auto_893686 ) ( IN-CITY ?auto_893682 ?auto_893686 ) ( not ( = ?auto_893682 ?auto_893685 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_893684 ?auto_893685 ?auto_893682 ?auto_893686 )
      ( DELIVER-1PKG ?auto_893683 ?auto_893682 )
      ( DELIVER-1PKG-VERIFY ?auto_893683 ?auto_893682 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_893718 - OBJ
      ?auto_893717 - LOCATION
    )
    :vars
    (
      ?auto_893719 - TRUCK
      ?auto_893720 - LOCATION
      ?auto_893721 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_893719 ?auto_893720 ) ( IN-CITY ?auto_893720 ?auto_893721 ) ( IN-CITY ?auto_893717 ?auto_893721 ) ( not ( = ?auto_893717 ?auto_893720 ) ) ( OBJ-AT ?auto_893718 ?auto_893720 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_893718 ?auto_893719 ?auto_893720 )
      ( DELIVER-1PKG ?auto_893718 ?auto_893717 )
      ( DELIVER-1PKG-VERIFY ?auto_893718 ?auto_893717 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_893753 - OBJ
      ?auto_893752 - LOCATION
    )
    :vars
    (
      ?auto_893754 - LOCATION
      ?auto_893756 - CITY
      ?auto_893755 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_893754 ?auto_893756 ) ( IN-CITY ?auto_893752 ?auto_893756 ) ( not ( = ?auto_893752 ?auto_893754 ) ) ( OBJ-AT ?auto_893753 ?auto_893754 ) ( TRUCK-AT ?auto_893755 ?auto_893752 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_893755 ?auto_893752 ?auto_893754 ?auto_893756 )
      ( DELIVER-1PKG ?auto_893753 ?auto_893752 )
      ( DELIVER-1PKG-VERIFY ?auto_893753 ?auto_893752 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_894091 - OBJ
      ?auto_894092 - OBJ
      ?auto_894090 - LOCATION
    )
    :vars
    (
      ?auto_894093 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_894092 ?auto_894091 ) ) ( TRUCK-AT ?auto_894093 ?auto_894090 ) ( IN-TRUCK ?auto_894092 ?auto_894093 ) ( OBJ-AT ?auto_894091 ?auto_894090 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_894092 ?auto_894090 )
      ( DELIVER-2PKG-VERIFY ?auto_894091 ?auto_894092 ?auto_894090 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_894095 - OBJ
      ?auto_894096 - OBJ
      ?auto_894094 - LOCATION
    )
    :vars
    (
      ?auto_894097 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_894096 ?auto_894095 ) ) ( TRUCK-AT ?auto_894097 ?auto_894094 ) ( IN-TRUCK ?auto_894095 ?auto_894097 ) ( OBJ-AT ?auto_894096 ?auto_894094 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_894095 ?auto_894094 )
      ( DELIVER-2PKG-VERIFY ?auto_894095 ?auto_894096 ?auto_894094 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_894450 - OBJ
      ?auto_894451 - OBJ
      ?auto_894449 - LOCATION
    )
    :vars
    (
      ?auto_894453 - TRUCK
      ?auto_894454 - LOCATION
      ?auto_894452 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_894451 ?auto_894450 ) ) ( IN-TRUCK ?auto_894451 ?auto_894453 ) ( TRUCK-AT ?auto_894453 ?auto_894454 ) ( IN-CITY ?auto_894454 ?auto_894452 ) ( IN-CITY ?auto_894449 ?auto_894452 ) ( not ( = ?auto_894449 ?auto_894454 ) ) ( OBJ-AT ?auto_894450 ?auto_894449 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_894451 ?auto_894449 )
      ( DELIVER-2PKG-VERIFY ?auto_894450 ?auto_894451 ?auto_894449 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_894456 - OBJ
      ?auto_894457 - OBJ
      ?auto_894455 - LOCATION
    )
    :vars
    (
      ?auto_894458 - TRUCK
      ?auto_894459 - LOCATION
      ?auto_894460 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_894457 ?auto_894456 ) ) ( IN-TRUCK ?auto_894456 ?auto_894458 ) ( TRUCK-AT ?auto_894458 ?auto_894459 ) ( IN-CITY ?auto_894459 ?auto_894460 ) ( IN-CITY ?auto_894455 ?auto_894460 ) ( not ( = ?auto_894455 ?auto_894459 ) ) ( OBJ-AT ?auto_894457 ?auto_894455 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894457 ?auto_894456 ?auto_894455 )
      ( DELIVER-2PKG-VERIFY ?auto_894456 ?auto_894457 ?auto_894455 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_894920 - OBJ
      ?auto_894919 - LOCATION
    )
    :vars
    (
      ?auto_894924 - OBJ
      ?auto_894921 - TRUCK
      ?auto_894922 - LOCATION
      ?auto_894923 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_894920 ?auto_894924 ) ) ( TRUCK-AT ?auto_894921 ?auto_894922 ) ( IN-CITY ?auto_894922 ?auto_894923 ) ( IN-CITY ?auto_894919 ?auto_894923 ) ( not ( = ?auto_894919 ?auto_894922 ) ) ( OBJ-AT ?auto_894924 ?auto_894919 ) ( OBJ-AT ?auto_894920 ?auto_894922 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_894920 ?auto_894921 ?auto_894922 )
      ( DELIVER-2PKG ?auto_894924 ?auto_894920 ?auto_894919 )
      ( DELIVER-1PKG-VERIFY ?auto_894920 ?auto_894919 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_894926 - OBJ
      ?auto_894927 - OBJ
      ?auto_894925 - LOCATION
    )
    :vars
    (
      ?auto_894929 - TRUCK
      ?auto_894930 - LOCATION
      ?auto_894928 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_894927 ?auto_894926 ) ) ( TRUCK-AT ?auto_894929 ?auto_894930 ) ( IN-CITY ?auto_894930 ?auto_894928 ) ( IN-CITY ?auto_894925 ?auto_894928 ) ( not ( = ?auto_894925 ?auto_894930 ) ) ( OBJ-AT ?auto_894926 ?auto_894925 ) ( OBJ-AT ?auto_894927 ?auto_894930 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_894927 ?auto_894925 )
      ( DELIVER-2PKG-VERIFY ?auto_894926 ?auto_894927 ?auto_894925 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_894932 - OBJ
      ?auto_894933 - OBJ
      ?auto_894931 - LOCATION
    )
    :vars
    (
      ?auto_894935 - TRUCK
      ?auto_894934 - LOCATION
      ?auto_894936 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_894933 ?auto_894932 ) ) ( TRUCK-AT ?auto_894935 ?auto_894934 ) ( IN-CITY ?auto_894934 ?auto_894936 ) ( IN-CITY ?auto_894931 ?auto_894936 ) ( not ( = ?auto_894931 ?auto_894934 ) ) ( OBJ-AT ?auto_894933 ?auto_894931 ) ( OBJ-AT ?auto_894932 ?auto_894934 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_894933 ?auto_894932 ?auto_894931 )
      ( DELIVER-2PKG-VERIFY ?auto_894932 ?auto_894933 ?auto_894931 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_895396 - OBJ
      ?auto_895395 - LOCATION
    )
    :vars
    (
      ?auto_895400 - OBJ
      ?auto_895397 - LOCATION
      ?auto_895399 - CITY
      ?auto_895398 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_895396 ?auto_895400 ) ) ( IN-CITY ?auto_895397 ?auto_895399 ) ( IN-CITY ?auto_895395 ?auto_895399 ) ( not ( = ?auto_895395 ?auto_895397 ) ) ( OBJ-AT ?auto_895400 ?auto_895395 ) ( OBJ-AT ?auto_895396 ?auto_895397 ) ( TRUCK-AT ?auto_895398 ?auto_895395 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_895398 ?auto_895395 ?auto_895397 ?auto_895399 )
      ( DELIVER-2PKG ?auto_895400 ?auto_895396 ?auto_895395 )
      ( DELIVER-1PKG-VERIFY ?auto_895396 ?auto_895395 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_895402 - OBJ
      ?auto_895403 - OBJ
      ?auto_895401 - LOCATION
    )
    :vars
    (
      ?auto_895406 - LOCATION
      ?auto_895404 - CITY
      ?auto_895405 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_895403 ?auto_895402 ) ) ( IN-CITY ?auto_895406 ?auto_895404 ) ( IN-CITY ?auto_895401 ?auto_895404 ) ( not ( = ?auto_895401 ?auto_895406 ) ) ( OBJ-AT ?auto_895402 ?auto_895401 ) ( OBJ-AT ?auto_895403 ?auto_895406 ) ( TRUCK-AT ?auto_895405 ?auto_895401 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_895403 ?auto_895401 )
      ( DELIVER-2PKG-VERIFY ?auto_895402 ?auto_895403 ?auto_895401 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_895408 - OBJ
      ?auto_895409 - OBJ
      ?auto_895407 - LOCATION
    )
    :vars
    (
      ?auto_895411 - LOCATION
      ?auto_895412 - CITY
      ?auto_895410 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_895409 ?auto_895408 ) ) ( IN-CITY ?auto_895411 ?auto_895412 ) ( IN-CITY ?auto_895407 ?auto_895412 ) ( not ( = ?auto_895407 ?auto_895411 ) ) ( OBJ-AT ?auto_895409 ?auto_895407 ) ( OBJ-AT ?auto_895408 ?auto_895411 ) ( TRUCK-AT ?auto_895410 ?auto_895407 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_895409 ?auto_895408 ?auto_895407 )
      ( DELIVER-2PKG-VERIFY ?auto_895408 ?auto_895409 ?auto_895407 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_895872 - OBJ
      ?auto_895871 - LOCATION
    )
    :vars
    (
      ?auto_895873 - OBJ
      ?auto_895875 - LOCATION
      ?auto_895876 - CITY
      ?auto_895874 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_895872 ?auto_895873 ) ) ( IN-CITY ?auto_895875 ?auto_895876 ) ( IN-CITY ?auto_895871 ?auto_895876 ) ( not ( = ?auto_895871 ?auto_895875 ) ) ( OBJ-AT ?auto_895872 ?auto_895875 ) ( TRUCK-AT ?auto_895874 ?auto_895871 ) ( IN-TRUCK ?auto_895873 ?auto_895874 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_895873 ?auto_895871 )
      ( DELIVER-2PKG ?auto_895873 ?auto_895872 ?auto_895871 )
      ( DELIVER-1PKG-VERIFY ?auto_895872 ?auto_895871 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_895878 - OBJ
      ?auto_895879 - OBJ
      ?auto_895877 - LOCATION
    )
    :vars
    (
      ?auto_895881 - LOCATION
      ?auto_895880 - CITY
      ?auto_895882 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_895879 ?auto_895878 ) ) ( IN-CITY ?auto_895881 ?auto_895880 ) ( IN-CITY ?auto_895877 ?auto_895880 ) ( not ( = ?auto_895877 ?auto_895881 ) ) ( OBJ-AT ?auto_895879 ?auto_895881 ) ( TRUCK-AT ?auto_895882 ?auto_895877 ) ( IN-TRUCK ?auto_895878 ?auto_895882 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_895879 ?auto_895877 )
      ( DELIVER-2PKG-VERIFY ?auto_895878 ?auto_895879 ?auto_895877 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_895884 - OBJ
      ?auto_895885 - OBJ
      ?auto_895883 - LOCATION
    )
    :vars
    (
      ?auto_895887 - LOCATION
      ?auto_895888 - CITY
      ?auto_895886 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_895885 ?auto_895884 ) ) ( IN-CITY ?auto_895887 ?auto_895888 ) ( IN-CITY ?auto_895883 ?auto_895888 ) ( not ( = ?auto_895883 ?auto_895887 ) ) ( OBJ-AT ?auto_895884 ?auto_895887 ) ( TRUCK-AT ?auto_895886 ?auto_895883 ) ( IN-TRUCK ?auto_895885 ?auto_895886 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_895885 ?auto_895884 ?auto_895883 )
      ( DELIVER-2PKG-VERIFY ?auto_895884 ?auto_895885 ?auto_895883 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_896348 - OBJ
      ?auto_896347 - LOCATION
    )
    :vars
    (
      ?auto_896351 - OBJ
      ?auto_896350 - LOCATION
      ?auto_896352 - CITY
      ?auto_896349 - TRUCK
      ?auto_896353 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_896348 ?auto_896351 ) ) ( IN-CITY ?auto_896350 ?auto_896352 ) ( IN-CITY ?auto_896347 ?auto_896352 ) ( not ( = ?auto_896347 ?auto_896350 ) ) ( OBJ-AT ?auto_896348 ?auto_896350 ) ( IN-TRUCK ?auto_896351 ?auto_896349 ) ( TRUCK-AT ?auto_896349 ?auto_896353 ) ( IN-CITY ?auto_896353 ?auto_896352 ) ( not ( = ?auto_896347 ?auto_896353 ) ) ( not ( = ?auto_896350 ?auto_896353 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_896349 ?auto_896353 ?auto_896347 ?auto_896352 )
      ( DELIVER-2PKG ?auto_896351 ?auto_896348 ?auto_896347 )
      ( DELIVER-1PKG-VERIFY ?auto_896348 ?auto_896347 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_896355 - OBJ
      ?auto_896356 - OBJ
      ?auto_896354 - LOCATION
    )
    :vars
    (
      ?auto_896359 - LOCATION
      ?auto_896357 - CITY
      ?auto_896360 - TRUCK
      ?auto_896358 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_896356 ?auto_896355 ) ) ( IN-CITY ?auto_896359 ?auto_896357 ) ( IN-CITY ?auto_896354 ?auto_896357 ) ( not ( = ?auto_896354 ?auto_896359 ) ) ( OBJ-AT ?auto_896356 ?auto_896359 ) ( IN-TRUCK ?auto_896355 ?auto_896360 ) ( TRUCK-AT ?auto_896360 ?auto_896358 ) ( IN-CITY ?auto_896358 ?auto_896357 ) ( not ( = ?auto_896354 ?auto_896358 ) ) ( not ( = ?auto_896359 ?auto_896358 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_896356 ?auto_896354 )
      ( DELIVER-2PKG-VERIFY ?auto_896355 ?auto_896356 ?auto_896354 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_896362 - OBJ
      ?auto_896363 - OBJ
      ?auto_896361 - LOCATION
    )
    :vars
    (
      ?auto_896364 - LOCATION
      ?auto_896366 - CITY
      ?auto_896365 - TRUCK
      ?auto_896367 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_896363 ?auto_896362 ) ) ( IN-CITY ?auto_896364 ?auto_896366 ) ( IN-CITY ?auto_896361 ?auto_896366 ) ( not ( = ?auto_896361 ?auto_896364 ) ) ( OBJ-AT ?auto_896362 ?auto_896364 ) ( IN-TRUCK ?auto_896363 ?auto_896365 ) ( TRUCK-AT ?auto_896365 ?auto_896367 ) ( IN-CITY ?auto_896367 ?auto_896366 ) ( not ( = ?auto_896361 ?auto_896367 ) ) ( not ( = ?auto_896364 ?auto_896367 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_896363 ?auto_896362 ?auto_896361 )
      ( DELIVER-2PKG-VERIFY ?auto_896362 ?auto_896363 ?auto_896361 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_896881 - OBJ
      ?auto_896880 - LOCATION
    )
    :vars
    (
      ?auto_896885 - OBJ
      ?auto_896882 - LOCATION
      ?auto_896884 - CITY
      ?auto_896883 - TRUCK
      ?auto_896886 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_896881 ?auto_896885 ) ) ( IN-CITY ?auto_896882 ?auto_896884 ) ( IN-CITY ?auto_896880 ?auto_896884 ) ( not ( = ?auto_896880 ?auto_896882 ) ) ( OBJ-AT ?auto_896881 ?auto_896882 ) ( TRUCK-AT ?auto_896883 ?auto_896886 ) ( IN-CITY ?auto_896886 ?auto_896884 ) ( not ( = ?auto_896880 ?auto_896886 ) ) ( not ( = ?auto_896882 ?auto_896886 ) ) ( OBJ-AT ?auto_896885 ?auto_896886 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_896885 ?auto_896883 ?auto_896886 )
      ( DELIVER-2PKG ?auto_896885 ?auto_896881 ?auto_896880 )
      ( DELIVER-1PKG-VERIFY ?auto_896881 ?auto_896880 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_896888 - OBJ
      ?auto_896889 - OBJ
      ?auto_896887 - LOCATION
    )
    :vars
    (
      ?auto_896892 - LOCATION
      ?auto_896890 - CITY
      ?auto_896891 - TRUCK
      ?auto_896893 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_896889 ?auto_896888 ) ) ( IN-CITY ?auto_896892 ?auto_896890 ) ( IN-CITY ?auto_896887 ?auto_896890 ) ( not ( = ?auto_896887 ?auto_896892 ) ) ( OBJ-AT ?auto_896889 ?auto_896892 ) ( TRUCK-AT ?auto_896891 ?auto_896893 ) ( IN-CITY ?auto_896893 ?auto_896890 ) ( not ( = ?auto_896887 ?auto_896893 ) ) ( not ( = ?auto_896892 ?auto_896893 ) ) ( OBJ-AT ?auto_896888 ?auto_896893 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_896889 ?auto_896887 )
      ( DELIVER-2PKG-VERIFY ?auto_896888 ?auto_896889 ?auto_896887 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_896895 - OBJ
      ?auto_896896 - OBJ
      ?auto_896894 - LOCATION
    )
    :vars
    (
      ?auto_896900 - LOCATION
      ?auto_896897 - CITY
      ?auto_896898 - TRUCK
      ?auto_896899 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_896896 ?auto_896895 ) ) ( IN-CITY ?auto_896900 ?auto_896897 ) ( IN-CITY ?auto_896894 ?auto_896897 ) ( not ( = ?auto_896894 ?auto_896900 ) ) ( OBJ-AT ?auto_896895 ?auto_896900 ) ( TRUCK-AT ?auto_896898 ?auto_896899 ) ( IN-CITY ?auto_896899 ?auto_896897 ) ( not ( = ?auto_896894 ?auto_896899 ) ) ( not ( = ?auto_896900 ?auto_896899 ) ) ( OBJ-AT ?auto_896896 ?auto_896899 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_896896 ?auto_896895 ?auto_896894 )
      ( DELIVER-2PKG-VERIFY ?auto_896895 ?auto_896896 ?auto_896894 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_899592 - OBJ
      ?auto_899593 - OBJ
      ?auto_899594 - OBJ
      ?auto_899591 - LOCATION
    )
    :vars
    (
      ?auto_899595 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_899593 ?auto_899592 ) ) ( not ( = ?auto_899594 ?auto_899592 ) ) ( not ( = ?auto_899594 ?auto_899593 ) ) ( TRUCK-AT ?auto_899595 ?auto_899591 ) ( IN-TRUCK ?auto_899594 ?auto_899595 ) ( OBJ-AT ?auto_899592 ?auto_899591 ) ( OBJ-AT ?auto_899593 ?auto_899591 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_899594 ?auto_899591 )
      ( DELIVER-3PKG-VERIFY ?auto_899592 ?auto_899593 ?auto_899594 ?auto_899591 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_899602 - OBJ
      ?auto_899603 - OBJ
      ?auto_899604 - OBJ
      ?auto_899601 - LOCATION
    )
    :vars
    (
      ?auto_899605 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_899603 ?auto_899602 ) ) ( not ( = ?auto_899604 ?auto_899602 ) ) ( not ( = ?auto_899604 ?auto_899603 ) ) ( TRUCK-AT ?auto_899605 ?auto_899601 ) ( IN-TRUCK ?auto_899603 ?auto_899605 ) ( OBJ-AT ?auto_899602 ?auto_899601 ) ( OBJ-AT ?auto_899604 ?auto_899601 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_899603 ?auto_899601 )
      ( DELIVER-3PKG-VERIFY ?auto_899602 ?auto_899603 ?auto_899604 ?auto_899601 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_899640 - OBJ
      ?auto_899641 - OBJ
      ?auto_899642 - OBJ
      ?auto_899639 - LOCATION
    )
    :vars
    (
      ?auto_899643 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_899641 ?auto_899640 ) ) ( not ( = ?auto_899642 ?auto_899640 ) ) ( not ( = ?auto_899642 ?auto_899641 ) ) ( TRUCK-AT ?auto_899643 ?auto_899639 ) ( IN-TRUCK ?auto_899640 ?auto_899643 ) ( OBJ-AT ?auto_899641 ?auto_899639 ) ( OBJ-AT ?auto_899642 ?auto_899639 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_899640 ?auto_899639 )
      ( DELIVER-3PKG-VERIFY ?auto_899640 ?auto_899641 ?auto_899642 ?auto_899639 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_901583 - OBJ
      ?auto_901584 - OBJ
      ?auto_901585 - OBJ
      ?auto_901582 - LOCATION
    )
    :vars
    (
      ?auto_901587 - TRUCK
      ?auto_901588 - LOCATION
      ?auto_901586 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_901584 ?auto_901583 ) ) ( not ( = ?auto_901585 ?auto_901583 ) ) ( not ( = ?auto_901585 ?auto_901584 ) ) ( IN-TRUCK ?auto_901585 ?auto_901587 ) ( TRUCK-AT ?auto_901587 ?auto_901588 ) ( IN-CITY ?auto_901588 ?auto_901586 ) ( IN-CITY ?auto_901582 ?auto_901586 ) ( not ( = ?auto_901582 ?auto_901588 ) ) ( OBJ-AT ?auto_901583 ?auto_901582 ) ( OBJ-AT ?auto_901584 ?auto_901582 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_901583 ?auto_901585 ?auto_901582 )
      ( DELIVER-3PKG-VERIFY ?auto_901583 ?auto_901584 ?auto_901585 ?auto_901582 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_901597 - OBJ
      ?auto_901598 - OBJ
      ?auto_901599 - OBJ
      ?auto_901596 - LOCATION
    )
    :vars
    (
      ?auto_901601 - TRUCK
      ?auto_901602 - LOCATION
      ?auto_901600 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_901598 ?auto_901597 ) ) ( not ( = ?auto_901599 ?auto_901597 ) ) ( not ( = ?auto_901599 ?auto_901598 ) ) ( IN-TRUCK ?auto_901598 ?auto_901601 ) ( TRUCK-AT ?auto_901601 ?auto_901602 ) ( IN-CITY ?auto_901602 ?auto_901600 ) ( IN-CITY ?auto_901596 ?auto_901600 ) ( not ( = ?auto_901596 ?auto_901602 ) ) ( OBJ-AT ?auto_901597 ?auto_901596 ) ( OBJ-AT ?auto_901599 ?auto_901596 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_901597 ?auto_901598 ?auto_901596 )
      ( DELIVER-3PKG-VERIFY ?auto_901597 ?auto_901598 ?auto_901599 ?auto_901596 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_901650 - OBJ
      ?auto_901651 - OBJ
      ?auto_901652 - OBJ
      ?auto_901649 - LOCATION
    )
    :vars
    (
      ?auto_901654 - TRUCK
      ?auto_901655 - LOCATION
      ?auto_901653 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_901651 ?auto_901650 ) ) ( not ( = ?auto_901652 ?auto_901650 ) ) ( not ( = ?auto_901652 ?auto_901651 ) ) ( IN-TRUCK ?auto_901650 ?auto_901654 ) ( TRUCK-AT ?auto_901654 ?auto_901655 ) ( IN-CITY ?auto_901655 ?auto_901653 ) ( IN-CITY ?auto_901649 ?auto_901653 ) ( not ( = ?auto_901649 ?auto_901655 ) ) ( OBJ-AT ?auto_901651 ?auto_901649 ) ( OBJ-AT ?auto_901652 ?auto_901649 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_901651 ?auto_901650 ?auto_901649 )
      ( DELIVER-3PKG-VERIFY ?auto_901650 ?auto_901651 ?auto_901652 ?auto_901649 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_904210 - OBJ
      ?auto_904211 - OBJ
      ?auto_904212 - OBJ
      ?auto_904209 - LOCATION
    )
    :vars
    (
      ?auto_904213 - TRUCK
      ?auto_904215 - LOCATION
      ?auto_904214 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_904211 ?auto_904210 ) ) ( not ( = ?auto_904212 ?auto_904210 ) ) ( not ( = ?auto_904212 ?auto_904211 ) ) ( TRUCK-AT ?auto_904213 ?auto_904215 ) ( IN-CITY ?auto_904215 ?auto_904214 ) ( IN-CITY ?auto_904209 ?auto_904214 ) ( not ( = ?auto_904209 ?auto_904215 ) ) ( OBJ-AT ?auto_904210 ?auto_904209 ) ( OBJ-AT ?auto_904212 ?auto_904215 ) ( OBJ-AT ?auto_904211 ?auto_904209 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_904210 ?auto_904212 ?auto_904209 )
      ( DELIVER-3PKG-VERIFY ?auto_904210 ?auto_904211 ?auto_904212 ?auto_904209 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_904224 - OBJ
      ?auto_904225 - OBJ
      ?auto_904226 - OBJ
      ?auto_904223 - LOCATION
    )
    :vars
    (
      ?auto_904227 - TRUCK
      ?auto_904229 - LOCATION
      ?auto_904228 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_904225 ?auto_904224 ) ) ( not ( = ?auto_904226 ?auto_904224 ) ) ( not ( = ?auto_904226 ?auto_904225 ) ) ( TRUCK-AT ?auto_904227 ?auto_904229 ) ( IN-CITY ?auto_904229 ?auto_904228 ) ( IN-CITY ?auto_904223 ?auto_904228 ) ( not ( = ?auto_904223 ?auto_904229 ) ) ( OBJ-AT ?auto_904224 ?auto_904223 ) ( OBJ-AT ?auto_904225 ?auto_904229 ) ( OBJ-AT ?auto_904226 ?auto_904223 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_904224 ?auto_904225 ?auto_904223 )
      ( DELIVER-3PKG-VERIFY ?auto_904224 ?auto_904225 ?auto_904226 ?auto_904223 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_904277 - OBJ
      ?auto_904278 - OBJ
      ?auto_904279 - OBJ
      ?auto_904276 - LOCATION
    )
    :vars
    (
      ?auto_904280 - TRUCK
      ?auto_904282 - LOCATION
      ?auto_904281 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_904278 ?auto_904277 ) ) ( not ( = ?auto_904279 ?auto_904277 ) ) ( not ( = ?auto_904279 ?auto_904278 ) ) ( TRUCK-AT ?auto_904280 ?auto_904282 ) ( IN-CITY ?auto_904282 ?auto_904281 ) ( IN-CITY ?auto_904276 ?auto_904281 ) ( not ( = ?auto_904276 ?auto_904282 ) ) ( OBJ-AT ?auto_904278 ?auto_904276 ) ( OBJ-AT ?auto_904277 ?auto_904282 ) ( OBJ-AT ?auto_904279 ?auto_904276 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_904278 ?auto_904277 ?auto_904276 )
      ( DELIVER-3PKG-VERIFY ?auto_904277 ?auto_904278 ?auto_904279 ?auto_904276 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_906837 - OBJ
      ?auto_906838 - OBJ
      ?auto_906839 - OBJ
      ?auto_906836 - LOCATION
    )
    :vars
    (
      ?auto_906842 - LOCATION
      ?auto_906841 - CITY
      ?auto_906840 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_906838 ?auto_906837 ) ) ( not ( = ?auto_906839 ?auto_906837 ) ) ( not ( = ?auto_906839 ?auto_906838 ) ) ( IN-CITY ?auto_906842 ?auto_906841 ) ( IN-CITY ?auto_906836 ?auto_906841 ) ( not ( = ?auto_906836 ?auto_906842 ) ) ( OBJ-AT ?auto_906837 ?auto_906836 ) ( OBJ-AT ?auto_906839 ?auto_906842 ) ( TRUCK-AT ?auto_906840 ?auto_906836 ) ( OBJ-AT ?auto_906838 ?auto_906836 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906837 ?auto_906839 ?auto_906836 )
      ( DELIVER-3PKG-VERIFY ?auto_906837 ?auto_906838 ?auto_906839 ?auto_906836 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_906851 - OBJ
      ?auto_906852 - OBJ
      ?auto_906853 - OBJ
      ?auto_906850 - LOCATION
    )
    :vars
    (
      ?auto_906856 - LOCATION
      ?auto_906855 - CITY
      ?auto_906854 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_906852 ?auto_906851 ) ) ( not ( = ?auto_906853 ?auto_906851 ) ) ( not ( = ?auto_906853 ?auto_906852 ) ) ( IN-CITY ?auto_906856 ?auto_906855 ) ( IN-CITY ?auto_906850 ?auto_906855 ) ( not ( = ?auto_906850 ?auto_906856 ) ) ( OBJ-AT ?auto_906851 ?auto_906850 ) ( OBJ-AT ?auto_906852 ?auto_906856 ) ( TRUCK-AT ?auto_906854 ?auto_906850 ) ( OBJ-AT ?auto_906853 ?auto_906850 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906851 ?auto_906852 ?auto_906850 )
      ( DELIVER-3PKG-VERIFY ?auto_906851 ?auto_906852 ?auto_906853 ?auto_906850 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_906904 - OBJ
      ?auto_906905 - OBJ
      ?auto_906906 - OBJ
      ?auto_906903 - LOCATION
    )
    :vars
    (
      ?auto_906909 - LOCATION
      ?auto_906908 - CITY
      ?auto_906907 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_906905 ?auto_906904 ) ) ( not ( = ?auto_906906 ?auto_906904 ) ) ( not ( = ?auto_906906 ?auto_906905 ) ) ( IN-CITY ?auto_906909 ?auto_906908 ) ( IN-CITY ?auto_906903 ?auto_906908 ) ( not ( = ?auto_906903 ?auto_906909 ) ) ( OBJ-AT ?auto_906905 ?auto_906903 ) ( OBJ-AT ?auto_906904 ?auto_906909 ) ( TRUCK-AT ?auto_906907 ?auto_906903 ) ( OBJ-AT ?auto_906906 ?auto_906903 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_906905 ?auto_906904 ?auto_906903 )
      ( DELIVER-3PKG-VERIFY ?auto_906904 ?auto_906905 ?auto_906906 ?auto_906903 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_912060 - OBJ
      ?auto_912059 - LOCATION
    )
    :vars
    (
      ?auto_912063 - OBJ
      ?auto_912061 - LOCATION
      ?auto_912064 - CITY
      ?auto_912062 - TRUCK
      ?auto_912065 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_912060 ?auto_912063 ) ) ( IN-CITY ?auto_912061 ?auto_912064 ) ( IN-CITY ?auto_912059 ?auto_912064 ) ( not ( = ?auto_912059 ?auto_912061 ) ) ( OBJ-AT ?auto_912063 ?auto_912059 ) ( OBJ-AT ?auto_912060 ?auto_912061 ) ( TRUCK-AT ?auto_912062 ?auto_912065 ) ( IN-CITY ?auto_912065 ?auto_912064 ) ( not ( = ?auto_912059 ?auto_912065 ) ) ( not ( = ?auto_912061 ?auto_912065 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_912062 ?auto_912065 ?auto_912059 ?auto_912064 )
      ( DELIVER-2PKG ?auto_912063 ?auto_912060 ?auto_912059 )
      ( DELIVER-1PKG-VERIFY ?auto_912060 ?auto_912059 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_912067 - OBJ
      ?auto_912068 - OBJ
      ?auto_912066 - LOCATION
    )
    :vars
    (
      ?auto_912070 - LOCATION
      ?auto_912071 - CITY
      ?auto_912072 - TRUCK
      ?auto_912069 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_912068 ?auto_912067 ) ) ( IN-CITY ?auto_912070 ?auto_912071 ) ( IN-CITY ?auto_912066 ?auto_912071 ) ( not ( = ?auto_912066 ?auto_912070 ) ) ( OBJ-AT ?auto_912067 ?auto_912066 ) ( OBJ-AT ?auto_912068 ?auto_912070 ) ( TRUCK-AT ?auto_912072 ?auto_912069 ) ( IN-CITY ?auto_912069 ?auto_912071 ) ( not ( = ?auto_912066 ?auto_912069 ) ) ( not ( = ?auto_912070 ?auto_912069 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_912068 ?auto_912066 )
      ( DELIVER-2PKG-VERIFY ?auto_912067 ?auto_912068 ?auto_912066 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_912082 - OBJ
      ?auto_912083 - OBJ
      ?auto_912081 - LOCATION
    )
    :vars
    (
      ?auto_912085 - LOCATION
      ?auto_912087 - CITY
      ?auto_912086 - TRUCK
      ?auto_912084 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_912083 ?auto_912082 ) ) ( IN-CITY ?auto_912085 ?auto_912087 ) ( IN-CITY ?auto_912081 ?auto_912087 ) ( not ( = ?auto_912081 ?auto_912085 ) ) ( OBJ-AT ?auto_912083 ?auto_912081 ) ( OBJ-AT ?auto_912082 ?auto_912085 ) ( TRUCK-AT ?auto_912086 ?auto_912084 ) ( IN-CITY ?auto_912084 ?auto_912087 ) ( not ( = ?auto_912081 ?auto_912084 ) ) ( not ( = ?auto_912085 ?auto_912084 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_912083 ?auto_912082 ?auto_912081 )
      ( DELIVER-2PKG-VERIFY ?auto_912082 ?auto_912083 ?auto_912081 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_937636 - OBJ
      ?auto_937637 - OBJ
      ?auto_937638 - OBJ
      ?auto_937639 - OBJ
      ?auto_937635 - LOCATION
    )
    :vars
    (
      ?auto_937640 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_937637 ?auto_937636 ) ) ( not ( = ?auto_937638 ?auto_937636 ) ) ( not ( = ?auto_937638 ?auto_937637 ) ) ( not ( = ?auto_937639 ?auto_937636 ) ) ( not ( = ?auto_937639 ?auto_937637 ) ) ( not ( = ?auto_937639 ?auto_937638 ) ) ( TRUCK-AT ?auto_937640 ?auto_937635 ) ( IN-TRUCK ?auto_937639 ?auto_937640 ) ( OBJ-AT ?auto_937636 ?auto_937635 ) ( OBJ-AT ?auto_937637 ?auto_937635 ) ( OBJ-AT ?auto_937638 ?auto_937635 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_937639 ?auto_937635 )
      ( DELIVER-4PKG-VERIFY ?auto_937636 ?auto_937637 ?auto_937638 ?auto_937639 ?auto_937635 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_937654 - OBJ
      ?auto_937655 - OBJ
      ?auto_937656 - OBJ
      ?auto_937657 - OBJ
      ?auto_937653 - LOCATION
    )
    :vars
    (
      ?auto_937658 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_937655 ?auto_937654 ) ) ( not ( = ?auto_937656 ?auto_937654 ) ) ( not ( = ?auto_937656 ?auto_937655 ) ) ( not ( = ?auto_937657 ?auto_937654 ) ) ( not ( = ?auto_937657 ?auto_937655 ) ) ( not ( = ?auto_937657 ?auto_937656 ) ) ( TRUCK-AT ?auto_937658 ?auto_937653 ) ( IN-TRUCK ?auto_937656 ?auto_937658 ) ( OBJ-AT ?auto_937654 ?auto_937653 ) ( OBJ-AT ?auto_937655 ?auto_937653 ) ( OBJ-AT ?auto_937657 ?auto_937653 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_937656 ?auto_937653 )
      ( DELIVER-4PKG-VERIFY ?auto_937654 ?auto_937655 ?auto_937656 ?auto_937657 ?auto_937653 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_937742 - OBJ
      ?auto_937743 - OBJ
      ?auto_937744 - OBJ
      ?auto_937745 - OBJ
      ?auto_937741 - LOCATION
    )
    :vars
    (
      ?auto_937746 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_937743 ?auto_937742 ) ) ( not ( = ?auto_937744 ?auto_937742 ) ) ( not ( = ?auto_937744 ?auto_937743 ) ) ( not ( = ?auto_937745 ?auto_937742 ) ) ( not ( = ?auto_937745 ?auto_937743 ) ) ( not ( = ?auto_937745 ?auto_937744 ) ) ( TRUCK-AT ?auto_937746 ?auto_937741 ) ( IN-TRUCK ?auto_937743 ?auto_937746 ) ( OBJ-AT ?auto_937742 ?auto_937741 ) ( OBJ-AT ?auto_937744 ?auto_937741 ) ( OBJ-AT ?auto_937745 ?auto_937741 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_937743 ?auto_937741 )
      ( DELIVER-4PKG-VERIFY ?auto_937742 ?auto_937743 ?auto_937744 ?auto_937745 ?auto_937741 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_938269 - OBJ
      ?auto_938270 - OBJ
      ?auto_938271 - OBJ
      ?auto_938272 - OBJ
      ?auto_938268 - LOCATION
    )
    :vars
    (
      ?auto_938273 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_938270 ?auto_938269 ) ) ( not ( = ?auto_938271 ?auto_938269 ) ) ( not ( = ?auto_938271 ?auto_938270 ) ) ( not ( = ?auto_938272 ?auto_938269 ) ) ( not ( = ?auto_938272 ?auto_938270 ) ) ( not ( = ?auto_938272 ?auto_938271 ) ) ( TRUCK-AT ?auto_938273 ?auto_938268 ) ( IN-TRUCK ?auto_938269 ?auto_938273 ) ( OBJ-AT ?auto_938270 ?auto_938268 ) ( OBJ-AT ?auto_938271 ?auto_938268 ) ( OBJ-AT ?auto_938272 ?auto_938268 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_938269 ?auto_938268 )
      ( DELIVER-4PKG-VERIFY ?auto_938269 ?auto_938270 ?auto_938271 ?auto_938272 ?auto_938268 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_944414 - OBJ
      ?auto_944415 - OBJ
      ?auto_944416 - OBJ
      ?auto_944417 - OBJ
      ?auto_944413 - LOCATION
    )
    :vars
    (
      ?auto_944418 - TRUCK
      ?auto_944419 - LOCATION
      ?auto_944420 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_944415 ?auto_944414 ) ) ( not ( = ?auto_944416 ?auto_944414 ) ) ( not ( = ?auto_944416 ?auto_944415 ) ) ( not ( = ?auto_944417 ?auto_944414 ) ) ( not ( = ?auto_944417 ?auto_944415 ) ) ( not ( = ?auto_944417 ?auto_944416 ) ) ( IN-TRUCK ?auto_944417 ?auto_944418 ) ( TRUCK-AT ?auto_944418 ?auto_944419 ) ( IN-CITY ?auto_944419 ?auto_944420 ) ( IN-CITY ?auto_944413 ?auto_944420 ) ( not ( = ?auto_944413 ?auto_944419 ) ) ( OBJ-AT ?auto_944414 ?auto_944413 ) ( OBJ-AT ?auto_944415 ?auto_944413 ) ( OBJ-AT ?auto_944416 ?auto_944413 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_944414 ?auto_944417 ?auto_944413 )
      ( DELIVER-4PKG-VERIFY ?auto_944414 ?auto_944415 ?auto_944416 ?auto_944417 ?auto_944413 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_944438 - OBJ
      ?auto_944439 - OBJ
      ?auto_944440 - OBJ
      ?auto_944441 - OBJ
      ?auto_944437 - LOCATION
    )
    :vars
    (
      ?auto_944442 - TRUCK
      ?auto_944443 - LOCATION
      ?auto_944444 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_944439 ?auto_944438 ) ) ( not ( = ?auto_944440 ?auto_944438 ) ) ( not ( = ?auto_944440 ?auto_944439 ) ) ( not ( = ?auto_944441 ?auto_944438 ) ) ( not ( = ?auto_944441 ?auto_944439 ) ) ( not ( = ?auto_944441 ?auto_944440 ) ) ( IN-TRUCK ?auto_944440 ?auto_944442 ) ( TRUCK-AT ?auto_944442 ?auto_944443 ) ( IN-CITY ?auto_944443 ?auto_944444 ) ( IN-CITY ?auto_944437 ?auto_944444 ) ( not ( = ?auto_944437 ?auto_944443 ) ) ( OBJ-AT ?auto_944438 ?auto_944437 ) ( OBJ-AT ?auto_944439 ?auto_944437 ) ( OBJ-AT ?auto_944441 ?auto_944437 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_944438 ?auto_944440 ?auto_944437 )
      ( DELIVER-4PKG-VERIFY ?auto_944438 ?auto_944439 ?auto_944440 ?auto_944441 ?auto_944437 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_944552 - OBJ
      ?auto_944553 - OBJ
      ?auto_944554 - OBJ
      ?auto_944555 - OBJ
      ?auto_944551 - LOCATION
    )
    :vars
    (
      ?auto_944556 - TRUCK
      ?auto_944557 - LOCATION
      ?auto_944558 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_944553 ?auto_944552 ) ) ( not ( = ?auto_944554 ?auto_944552 ) ) ( not ( = ?auto_944554 ?auto_944553 ) ) ( not ( = ?auto_944555 ?auto_944552 ) ) ( not ( = ?auto_944555 ?auto_944553 ) ) ( not ( = ?auto_944555 ?auto_944554 ) ) ( IN-TRUCK ?auto_944553 ?auto_944556 ) ( TRUCK-AT ?auto_944556 ?auto_944557 ) ( IN-CITY ?auto_944557 ?auto_944558 ) ( IN-CITY ?auto_944551 ?auto_944558 ) ( not ( = ?auto_944551 ?auto_944557 ) ) ( OBJ-AT ?auto_944552 ?auto_944551 ) ( OBJ-AT ?auto_944554 ?auto_944551 ) ( OBJ-AT ?auto_944555 ?auto_944551 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_944552 ?auto_944553 ?auto_944551 )
      ( DELIVER-4PKG-VERIFY ?auto_944552 ?auto_944553 ?auto_944554 ?auto_944555 ?auto_944551 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_945271 - OBJ
      ?auto_945272 - OBJ
      ?auto_945273 - OBJ
      ?auto_945274 - OBJ
      ?auto_945270 - LOCATION
    )
    :vars
    (
      ?auto_945275 - TRUCK
      ?auto_945276 - LOCATION
      ?auto_945277 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_945272 ?auto_945271 ) ) ( not ( = ?auto_945273 ?auto_945271 ) ) ( not ( = ?auto_945273 ?auto_945272 ) ) ( not ( = ?auto_945274 ?auto_945271 ) ) ( not ( = ?auto_945274 ?auto_945272 ) ) ( not ( = ?auto_945274 ?auto_945273 ) ) ( IN-TRUCK ?auto_945271 ?auto_945275 ) ( TRUCK-AT ?auto_945275 ?auto_945276 ) ( IN-CITY ?auto_945276 ?auto_945277 ) ( IN-CITY ?auto_945270 ?auto_945277 ) ( not ( = ?auto_945270 ?auto_945276 ) ) ( OBJ-AT ?auto_945272 ?auto_945270 ) ( OBJ-AT ?auto_945273 ?auto_945270 ) ( OBJ-AT ?auto_945274 ?auto_945270 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_945272 ?auto_945271 ?auto_945270 )
      ( DELIVER-4PKG-VERIFY ?auto_945271 ?auto_945272 ?auto_945273 ?auto_945274 ?auto_945270 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_953323 - OBJ
      ?auto_953324 - OBJ
      ?auto_953325 - OBJ
      ?auto_953326 - OBJ
      ?auto_953322 - LOCATION
    )
    :vars
    (
      ?auto_953328 - TRUCK
      ?auto_953329 - LOCATION
      ?auto_953327 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_953324 ?auto_953323 ) ) ( not ( = ?auto_953325 ?auto_953323 ) ) ( not ( = ?auto_953325 ?auto_953324 ) ) ( not ( = ?auto_953326 ?auto_953323 ) ) ( not ( = ?auto_953326 ?auto_953324 ) ) ( not ( = ?auto_953326 ?auto_953325 ) ) ( TRUCK-AT ?auto_953328 ?auto_953329 ) ( IN-CITY ?auto_953329 ?auto_953327 ) ( IN-CITY ?auto_953322 ?auto_953327 ) ( not ( = ?auto_953322 ?auto_953329 ) ) ( OBJ-AT ?auto_953323 ?auto_953322 ) ( OBJ-AT ?auto_953326 ?auto_953329 ) ( OBJ-AT ?auto_953324 ?auto_953322 ) ( OBJ-AT ?auto_953325 ?auto_953322 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_953323 ?auto_953326 ?auto_953322 )
      ( DELIVER-4PKG-VERIFY ?auto_953323 ?auto_953324 ?auto_953325 ?auto_953326 ?auto_953322 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_953347 - OBJ
      ?auto_953348 - OBJ
      ?auto_953349 - OBJ
      ?auto_953350 - OBJ
      ?auto_953346 - LOCATION
    )
    :vars
    (
      ?auto_953352 - TRUCK
      ?auto_953353 - LOCATION
      ?auto_953351 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_953348 ?auto_953347 ) ) ( not ( = ?auto_953349 ?auto_953347 ) ) ( not ( = ?auto_953349 ?auto_953348 ) ) ( not ( = ?auto_953350 ?auto_953347 ) ) ( not ( = ?auto_953350 ?auto_953348 ) ) ( not ( = ?auto_953350 ?auto_953349 ) ) ( TRUCK-AT ?auto_953352 ?auto_953353 ) ( IN-CITY ?auto_953353 ?auto_953351 ) ( IN-CITY ?auto_953346 ?auto_953351 ) ( not ( = ?auto_953346 ?auto_953353 ) ) ( OBJ-AT ?auto_953347 ?auto_953346 ) ( OBJ-AT ?auto_953349 ?auto_953353 ) ( OBJ-AT ?auto_953348 ?auto_953346 ) ( OBJ-AT ?auto_953350 ?auto_953346 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_953347 ?auto_953349 ?auto_953346 )
      ( DELIVER-4PKG-VERIFY ?auto_953347 ?auto_953348 ?auto_953349 ?auto_953350 ?auto_953346 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_953461 - OBJ
      ?auto_953462 - OBJ
      ?auto_953463 - OBJ
      ?auto_953464 - OBJ
      ?auto_953460 - LOCATION
    )
    :vars
    (
      ?auto_953466 - TRUCK
      ?auto_953467 - LOCATION
      ?auto_953465 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_953462 ?auto_953461 ) ) ( not ( = ?auto_953463 ?auto_953461 ) ) ( not ( = ?auto_953463 ?auto_953462 ) ) ( not ( = ?auto_953464 ?auto_953461 ) ) ( not ( = ?auto_953464 ?auto_953462 ) ) ( not ( = ?auto_953464 ?auto_953463 ) ) ( TRUCK-AT ?auto_953466 ?auto_953467 ) ( IN-CITY ?auto_953467 ?auto_953465 ) ( IN-CITY ?auto_953460 ?auto_953465 ) ( not ( = ?auto_953460 ?auto_953467 ) ) ( OBJ-AT ?auto_953461 ?auto_953460 ) ( OBJ-AT ?auto_953462 ?auto_953467 ) ( OBJ-AT ?auto_953463 ?auto_953460 ) ( OBJ-AT ?auto_953464 ?auto_953460 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_953461 ?auto_953462 ?auto_953460 )
      ( DELIVER-4PKG-VERIFY ?auto_953461 ?auto_953462 ?auto_953463 ?auto_953464 ?auto_953460 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_954180 - OBJ
      ?auto_954181 - OBJ
      ?auto_954182 - OBJ
      ?auto_954183 - OBJ
      ?auto_954179 - LOCATION
    )
    :vars
    (
      ?auto_954185 - TRUCK
      ?auto_954186 - LOCATION
      ?auto_954184 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_954181 ?auto_954180 ) ) ( not ( = ?auto_954182 ?auto_954180 ) ) ( not ( = ?auto_954182 ?auto_954181 ) ) ( not ( = ?auto_954183 ?auto_954180 ) ) ( not ( = ?auto_954183 ?auto_954181 ) ) ( not ( = ?auto_954183 ?auto_954182 ) ) ( TRUCK-AT ?auto_954185 ?auto_954186 ) ( IN-CITY ?auto_954186 ?auto_954184 ) ( IN-CITY ?auto_954179 ?auto_954184 ) ( not ( = ?auto_954179 ?auto_954186 ) ) ( OBJ-AT ?auto_954181 ?auto_954179 ) ( OBJ-AT ?auto_954180 ?auto_954186 ) ( OBJ-AT ?auto_954182 ?auto_954179 ) ( OBJ-AT ?auto_954183 ?auto_954179 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_954181 ?auto_954180 ?auto_954179 )
      ( DELIVER-4PKG-VERIFY ?auto_954180 ?auto_954181 ?auto_954182 ?auto_954183 ?auto_954179 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_962232 - OBJ
      ?auto_962233 - OBJ
      ?auto_962234 - OBJ
      ?auto_962235 - OBJ
      ?auto_962231 - LOCATION
    )
    :vars
    (
      ?auto_962237 - LOCATION
      ?auto_962238 - CITY
      ?auto_962236 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_962233 ?auto_962232 ) ) ( not ( = ?auto_962234 ?auto_962232 ) ) ( not ( = ?auto_962234 ?auto_962233 ) ) ( not ( = ?auto_962235 ?auto_962232 ) ) ( not ( = ?auto_962235 ?auto_962233 ) ) ( not ( = ?auto_962235 ?auto_962234 ) ) ( IN-CITY ?auto_962237 ?auto_962238 ) ( IN-CITY ?auto_962231 ?auto_962238 ) ( not ( = ?auto_962231 ?auto_962237 ) ) ( OBJ-AT ?auto_962232 ?auto_962231 ) ( OBJ-AT ?auto_962235 ?auto_962237 ) ( TRUCK-AT ?auto_962236 ?auto_962231 ) ( OBJ-AT ?auto_962233 ?auto_962231 ) ( OBJ-AT ?auto_962234 ?auto_962231 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_962232 ?auto_962235 ?auto_962231 )
      ( DELIVER-4PKG-VERIFY ?auto_962232 ?auto_962233 ?auto_962234 ?auto_962235 ?auto_962231 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_962256 - OBJ
      ?auto_962257 - OBJ
      ?auto_962258 - OBJ
      ?auto_962259 - OBJ
      ?auto_962255 - LOCATION
    )
    :vars
    (
      ?auto_962261 - LOCATION
      ?auto_962262 - CITY
      ?auto_962260 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_962257 ?auto_962256 ) ) ( not ( = ?auto_962258 ?auto_962256 ) ) ( not ( = ?auto_962258 ?auto_962257 ) ) ( not ( = ?auto_962259 ?auto_962256 ) ) ( not ( = ?auto_962259 ?auto_962257 ) ) ( not ( = ?auto_962259 ?auto_962258 ) ) ( IN-CITY ?auto_962261 ?auto_962262 ) ( IN-CITY ?auto_962255 ?auto_962262 ) ( not ( = ?auto_962255 ?auto_962261 ) ) ( OBJ-AT ?auto_962256 ?auto_962255 ) ( OBJ-AT ?auto_962258 ?auto_962261 ) ( TRUCK-AT ?auto_962260 ?auto_962255 ) ( OBJ-AT ?auto_962257 ?auto_962255 ) ( OBJ-AT ?auto_962259 ?auto_962255 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_962256 ?auto_962258 ?auto_962255 )
      ( DELIVER-4PKG-VERIFY ?auto_962256 ?auto_962257 ?auto_962258 ?auto_962259 ?auto_962255 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_962370 - OBJ
      ?auto_962371 - OBJ
      ?auto_962372 - OBJ
      ?auto_962373 - OBJ
      ?auto_962369 - LOCATION
    )
    :vars
    (
      ?auto_962375 - LOCATION
      ?auto_962376 - CITY
      ?auto_962374 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_962371 ?auto_962370 ) ) ( not ( = ?auto_962372 ?auto_962370 ) ) ( not ( = ?auto_962372 ?auto_962371 ) ) ( not ( = ?auto_962373 ?auto_962370 ) ) ( not ( = ?auto_962373 ?auto_962371 ) ) ( not ( = ?auto_962373 ?auto_962372 ) ) ( IN-CITY ?auto_962375 ?auto_962376 ) ( IN-CITY ?auto_962369 ?auto_962376 ) ( not ( = ?auto_962369 ?auto_962375 ) ) ( OBJ-AT ?auto_962370 ?auto_962369 ) ( OBJ-AT ?auto_962371 ?auto_962375 ) ( TRUCK-AT ?auto_962374 ?auto_962369 ) ( OBJ-AT ?auto_962372 ?auto_962369 ) ( OBJ-AT ?auto_962373 ?auto_962369 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_962370 ?auto_962371 ?auto_962369 )
      ( DELIVER-4PKG-VERIFY ?auto_962370 ?auto_962371 ?auto_962372 ?auto_962373 ?auto_962369 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_963089 - OBJ
      ?auto_963090 - OBJ
      ?auto_963091 - OBJ
      ?auto_963092 - OBJ
      ?auto_963088 - LOCATION
    )
    :vars
    (
      ?auto_963094 - LOCATION
      ?auto_963095 - CITY
      ?auto_963093 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_963090 ?auto_963089 ) ) ( not ( = ?auto_963091 ?auto_963089 ) ) ( not ( = ?auto_963091 ?auto_963090 ) ) ( not ( = ?auto_963092 ?auto_963089 ) ) ( not ( = ?auto_963092 ?auto_963090 ) ) ( not ( = ?auto_963092 ?auto_963091 ) ) ( IN-CITY ?auto_963094 ?auto_963095 ) ( IN-CITY ?auto_963088 ?auto_963095 ) ( not ( = ?auto_963088 ?auto_963094 ) ) ( OBJ-AT ?auto_963090 ?auto_963088 ) ( OBJ-AT ?auto_963089 ?auto_963094 ) ( TRUCK-AT ?auto_963093 ?auto_963088 ) ( OBJ-AT ?auto_963091 ?auto_963088 ) ( OBJ-AT ?auto_963092 ?auto_963088 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_963090 ?auto_963089 ?auto_963088 )
      ( DELIVER-4PKG-VERIFY ?auto_963089 ?auto_963090 ?auto_963091 ?auto_963092 ?auto_963088 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_979864 - OBJ
      ?auto_979865 - OBJ
      ?auto_979866 - OBJ
      ?auto_979863 - LOCATION
    )
    :vars
    (
      ?auto_979867 - LOCATION
      ?auto_979868 - CITY
      ?auto_979870 - TRUCK
      ?auto_979869 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_979865 ?auto_979864 ) ) ( not ( = ?auto_979866 ?auto_979864 ) ) ( not ( = ?auto_979866 ?auto_979865 ) ) ( IN-CITY ?auto_979867 ?auto_979868 ) ( IN-CITY ?auto_979863 ?auto_979868 ) ( not ( = ?auto_979863 ?auto_979867 ) ) ( OBJ-AT ?auto_979864 ?auto_979863 ) ( OBJ-AT ?auto_979866 ?auto_979867 ) ( TRUCK-AT ?auto_979870 ?auto_979869 ) ( IN-CITY ?auto_979869 ?auto_979868 ) ( not ( = ?auto_979863 ?auto_979869 ) ) ( not ( = ?auto_979867 ?auto_979869 ) ) ( OBJ-AT ?auto_979865 ?auto_979863 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_979864 ?auto_979866 ?auto_979863 )
      ( DELIVER-3PKG-VERIFY ?auto_979864 ?auto_979865 ?auto_979866 ?auto_979863 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_979888 - OBJ
      ?auto_979889 - OBJ
      ?auto_979890 - OBJ
      ?auto_979887 - LOCATION
    )
    :vars
    (
      ?auto_979891 - LOCATION
      ?auto_979892 - CITY
      ?auto_979894 - TRUCK
      ?auto_979893 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_979889 ?auto_979888 ) ) ( not ( = ?auto_979890 ?auto_979888 ) ) ( not ( = ?auto_979890 ?auto_979889 ) ) ( IN-CITY ?auto_979891 ?auto_979892 ) ( IN-CITY ?auto_979887 ?auto_979892 ) ( not ( = ?auto_979887 ?auto_979891 ) ) ( OBJ-AT ?auto_979888 ?auto_979887 ) ( OBJ-AT ?auto_979889 ?auto_979891 ) ( TRUCK-AT ?auto_979894 ?auto_979893 ) ( IN-CITY ?auto_979893 ?auto_979892 ) ( not ( = ?auto_979887 ?auto_979893 ) ) ( not ( = ?auto_979891 ?auto_979893 ) ) ( OBJ-AT ?auto_979890 ?auto_979887 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_979888 ?auto_979889 ?auto_979887 )
      ( DELIVER-3PKG-VERIFY ?auto_979888 ?auto_979889 ?auto_979890 ?auto_979887 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_980034 - OBJ
      ?auto_980035 - OBJ
      ?auto_980036 - OBJ
      ?auto_980033 - LOCATION
    )
    :vars
    (
      ?auto_980037 - LOCATION
      ?auto_980038 - CITY
      ?auto_980040 - TRUCK
      ?auto_980039 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_980035 ?auto_980034 ) ) ( not ( = ?auto_980036 ?auto_980034 ) ) ( not ( = ?auto_980036 ?auto_980035 ) ) ( IN-CITY ?auto_980037 ?auto_980038 ) ( IN-CITY ?auto_980033 ?auto_980038 ) ( not ( = ?auto_980033 ?auto_980037 ) ) ( OBJ-AT ?auto_980035 ?auto_980033 ) ( OBJ-AT ?auto_980034 ?auto_980037 ) ( TRUCK-AT ?auto_980040 ?auto_980039 ) ( IN-CITY ?auto_980039 ?auto_980038 ) ( not ( = ?auto_980033 ?auto_980039 ) ) ( not ( = ?auto_980037 ?auto_980039 ) ) ( OBJ-AT ?auto_980036 ?auto_980033 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_980035 ?auto_980034 ?auto_980033 )
      ( DELIVER-3PKG-VERIFY ?auto_980034 ?auto_980035 ?auto_980036 ?auto_980033 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1102441 - OBJ
      ?auto_1102442 - OBJ
      ?auto_1102443 - OBJ
      ?auto_1102444 - OBJ
      ?auto_1102445 - OBJ
      ?auto_1102440 - LOCATION
    )
    :vars
    (
      ?auto_1102446 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1102442 ?auto_1102441 ) ) ( not ( = ?auto_1102443 ?auto_1102441 ) ) ( not ( = ?auto_1102443 ?auto_1102442 ) ) ( not ( = ?auto_1102444 ?auto_1102441 ) ) ( not ( = ?auto_1102444 ?auto_1102442 ) ) ( not ( = ?auto_1102444 ?auto_1102443 ) ) ( not ( = ?auto_1102445 ?auto_1102441 ) ) ( not ( = ?auto_1102445 ?auto_1102442 ) ) ( not ( = ?auto_1102445 ?auto_1102443 ) ) ( not ( = ?auto_1102445 ?auto_1102444 ) ) ( TRUCK-AT ?auto_1102446 ?auto_1102440 ) ( IN-TRUCK ?auto_1102445 ?auto_1102446 ) ( OBJ-AT ?auto_1102441 ?auto_1102440 ) ( OBJ-AT ?auto_1102442 ?auto_1102440 ) ( OBJ-AT ?auto_1102443 ?auto_1102440 ) ( OBJ-AT ?auto_1102444 ?auto_1102440 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1102445 ?auto_1102440 )
      ( DELIVER-5PKG-VERIFY ?auto_1102441 ?auto_1102442 ?auto_1102443 ?auto_1102444 ?auto_1102445 ?auto_1102440 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1102469 - OBJ
      ?auto_1102470 - OBJ
      ?auto_1102471 - OBJ
      ?auto_1102472 - OBJ
      ?auto_1102473 - OBJ
      ?auto_1102468 - LOCATION
    )
    :vars
    (
      ?auto_1102474 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1102470 ?auto_1102469 ) ) ( not ( = ?auto_1102471 ?auto_1102469 ) ) ( not ( = ?auto_1102471 ?auto_1102470 ) ) ( not ( = ?auto_1102472 ?auto_1102469 ) ) ( not ( = ?auto_1102472 ?auto_1102470 ) ) ( not ( = ?auto_1102472 ?auto_1102471 ) ) ( not ( = ?auto_1102473 ?auto_1102469 ) ) ( not ( = ?auto_1102473 ?auto_1102470 ) ) ( not ( = ?auto_1102473 ?auto_1102471 ) ) ( not ( = ?auto_1102473 ?auto_1102472 ) ) ( TRUCK-AT ?auto_1102474 ?auto_1102468 ) ( IN-TRUCK ?auto_1102472 ?auto_1102474 ) ( OBJ-AT ?auto_1102469 ?auto_1102468 ) ( OBJ-AT ?auto_1102470 ?auto_1102468 ) ( OBJ-AT ?auto_1102471 ?auto_1102468 ) ( OBJ-AT ?auto_1102473 ?auto_1102468 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1102472 ?auto_1102468 )
      ( DELIVER-5PKG-VERIFY ?auto_1102469 ?auto_1102470 ?auto_1102471 ?auto_1102472 ?auto_1102473 ?auto_1102468 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1102635 - OBJ
      ?auto_1102636 - OBJ
      ?auto_1102637 - OBJ
      ?auto_1102638 - OBJ
      ?auto_1102639 - OBJ
      ?auto_1102634 - LOCATION
    )
    :vars
    (
      ?auto_1102640 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1102636 ?auto_1102635 ) ) ( not ( = ?auto_1102637 ?auto_1102635 ) ) ( not ( = ?auto_1102637 ?auto_1102636 ) ) ( not ( = ?auto_1102638 ?auto_1102635 ) ) ( not ( = ?auto_1102638 ?auto_1102636 ) ) ( not ( = ?auto_1102638 ?auto_1102637 ) ) ( not ( = ?auto_1102639 ?auto_1102635 ) ) ( not ( = ?auto_1102639 ?auto_1102636 ) ) ( not ( = ?auto_1102639 ?auto_1102637 ) ) ( not ( = ?auto_1102639 ?auto_1102638 ) ) ( TRUCK-AT ?auto_1102640 ?auto_1102634 ) ( IN-TRUCK ?auto_1102637 ?auto_1102640 ) ( OBJ-AT ?auto_1102635 ?auto_1102634 ) ( OBJ-AT ?auto_1102636 ?auto_1102634 ) ( OBJ-AT ?auto_1102638 ?auto_1102634 ) ( OBJ-AT ?auto_1102639 ?auto_1102634 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1102637 ?auto_1102634 )
      ( DELIVER-5PKG-VERIFY ?auto_1102635 ?auto_1102636 ?auto_1102637 ?auto_1102638 ?auto_1102639 ?auto_1102634 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1103826 - OBJ
      ?auto_1103827 - OBJ
      ?auto_1103828 - OBJ
      ?auto_1103829 - OBJ
      ?auto_1103830 - OBJ
      ?auto_1103825 - LOCATION
    )
    :vars
    (
      ?auto_1103831 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1103827 ?auto_1103826 ) ) ( not ( = ?auto_1103828 ?auto_1103826 ) ) ( not ( = ?auto_1103828 ?auto_1103827 ) ) ( not ( = ?auto_1103829 ?auto_1103826 ) ) ( not ( = ?auto_1103829 ?auto_1103827 ) ) ( not ( = ?auto_1103829 ?auto_1103828 ) ) ( not ( = ?auto_1103830 ?auto_1103826 ) ) ( not ( = ?auto_1103830 ?auto_1103827 ) ) ( not ( = ?auto_1103830 ?auto_1103828 ) ) ( not ( = ?auto_1103830 ?auto_1103829 ) ) ( TRUCK-AT ?auto_1103831 ?auto_1103825 ) ( IN-TRUCK ?auto_1103827 ?auto_1103831 ) ( OBJ-AT ?auto_1103826 ?auto_1103825 ) ( OBJ-AT ?auto_1103828 ?auto_1103825 ) ( OBJ-AT ?auto_1103829 ?auto_1103825 ) ( OBJ-AT ?auto_1103830 ?auto_1103825 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1103827 ?auto_1103825 )
      ( DELIVER-5PKG-VERIFY ?auto_1103826 ?auto_1103827 ?auto_1103828 ?auto_1103829 ?auto_1103830 ?auto_1103825 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1112373 - OBJ
      ?auto_1112374 - OBJ
      ?auto_1112375 - OBJ
      ?auto_1112376 - OBJ
      ?auto_1112377 - OBJ
      ?auto_1112372 - LOCATION
    )
    :vars
    (
      ?auto_1112378 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1112374 ?auto_1112373 ) ) ( not ( = ?auto_1112375 ?auto_1112373 ) ) ( not ( = ?auto_1112375 ?auto_1112374 ) ) ( not ( = ?auto_1112376 ?auto_1112373 ) ) ( not ( = ?auto_1112376 ?auto_1112374 ) ) ( not ( = ?auto_1112376 ?auto_1112375 ) ) ( not ( = ?auto_1112377 ?auto_1112373 ) ) ( not ( = ?auto_1112377 ?auto_1112374 ) ) ( not ( = ?auto_1112377 ?auto_1112375 ) ) ( not ( = ?auto_1112377 ?auto_1112376 ) ) ( TRUCK-AT ?auto_1112378 ?auto_1112372 ) ( IN-TRUCK ?auto_1112373 ?auto_1112378 ) ( OBJ-AT ?auto_1112374 ?auto_1112372 ) ( OBJ-AT ?auto_1112375 ?auto_1112372 ) ( OBJ-AT ?auto_1112376 ?auto_1112372 ) ( OBJ-AT ?auto_1112377 ?auto_1112372 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1112373 ?auto_1112372 )
      ( DELIVER-5PKG-VERIFY ?auto_1112373 ?auto_1112374 ?auto_1112375 ?auto_1112376 ?auto_1112377 ?auto_1112372 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1120413 - OBJ
      ?auto_1120414 - OBJ
      ?auto_1120415 - OBJ
      ?auto_1120416 - OBJ
      ?auto_1120417 - OBJ
      ?auto_1120412 - LOCATION
    )
    :vars
    (
      ?auto_1120418 - TRUCK
      ?auto_1120419 - LOCATION
      ?auto_1120420 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1120414 ?auto_1120413 ) ) ( not ( = ?auto_1120415 ?auto_1120413 ) ) ( not ( = ?auto_1120415 ?auto_1120414 ) ) ( not ( = ?auto_1120416 ?auto_1120413 ) ) ( not ( = ?auto_1120416 ?auto_1120414 ) ) ( not ( = ?auto_1120416 ?auto_1120415 ) ) ( not ( = ?auto_1120417 ?auto_1120413 ) ) ( not ( = ?auto_1120417 ?auto_1120414 ) ) ( not ( = ?auto_1120417 ?auto_1120415 ) ) ( not ( = ?auto_1120417 ?auto_1120416 ) ) ( IN-TRUCK ?auto_1120417 ?auto_1120418 ) ( TRUCK-AT ?auto_1120418 ?auto_1120419 ) ( IN-CITY ?auto_1120419 ?auto_1120420 ) ( IN-CITY ?auto_1120412 ?auto_1120420 ) ( not ( = ?auto_1120412 ?auto_1120419 ) ) ( OBJ-AT ?auto_1120413 ?auto_1120412 ) ( OBJ-AT ?auto_1120414 ?auto_1120412 ) ( OBJ-AT ?auto_1120415 ?auto_1120412 ) ( OBJ-AT ?auto_1120416 ?auto_1120412 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1120413 ?auto_1120417 ?auto_1120412 )
      ( DELIVER-5PKG-VERIFY ?auto_1120413 ?auto_1120414 ?auto_1120415 ?auto_1120416 ?auto_1120417 ?auto_1120412 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1120449 - OBJ
      ?auto_1120450 - OBJ
      ?auto_1120451 - OBJ
      ?auto_1120452 - OBJ
      ?auto_1120453 - OBJ
      ?auto_1120448 - LOCATION
    )
    :vars
    (
      ?auto_1120454 - TRUCK
      ?auto_1120455 - LOCATION
      ?auto_1120456 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1120450 ?auto_1120449 ) ) ( not ( = ?auto_1120451 ?auto_1120449 ) ) ( not ( = ?auto_1120451 ?auto_1120450 ) ) ( not ( = ?auto_1120452 ?auto_1120449 ) ) ( not ( = ?auto_1120452 ?auto_1120450 ) ) ( not ( = ?auto_1120452 ?auto_1120451 ) ) ( not ( = ?auto_1120453 ?auto_1120449 ) ) ( not ( = ?auto_1120453 ?auto_1120450 ) ) ( not ( = ?auto_1120453 ?auto_1120451 ) ) ( not ( = ?auto_1120453 ?auto_1120452 ) ) ( IN-TRUCK ?auto_1120452 ?auto_1120454 ) ( TRUCK-AT ?auto_1120454 ?auto_1120455 ) ( IN-CITY ?auto_1120455 ?auto_1120456 ) ( IN-CITY ?auto_1120448 ?auto_1120456 ) ( not ( = ?auto_1120448 ?auto_1120455 ) ) ( OBJ-AT ?auto_1120449 ?auto_1120448 ) ( OBJ-AT ?auto_1120450 ?auto_1120448 ) ( OBJ-AT ?auto_1120451 ?auto_1120448 ) ( OBJ-AT ?auto_1120453 ?auto_1120448 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1120449 ?auto_1120452 ?auto_1120448 )
      ( DELIVER-5PKG-VERIFY ?auto_1120449 ?auto_1120450 ?auto_1120451 ?auto_1120452 ?auto_1120453 ?auto_1120448 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1120659 - OBJ
      ?auto_1120660 - OBJ
      ?auto_1120661 - OBJ
      ?auto_1120662 - OBJ
      ?auto_1120663 - OBJ
      ?auto_1120658 - LOCATION
    )
    :vars
    (
      ?auto_1120664 - TRUCK
      ?auto_1120665 - LOCATION
      ?auto_1120666 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1120660 ?auto_1120659 ) ) ( not ( = ?auto_1120661 ?auto_1120659 ) ) ( not ( = ?auto_1120661 ?auto_1120660 ) ) ( not ( = ?auto_1120662 ?auto_1120659 ) ) ( not ( = ?auto_1120662 ?auto_1120660 ) ) ( not ( = ?auto_1120662 ?auto_1120661 ) ) ( not ( = ?auto_1120663 ?auto_1120659 ) ) ( not ( = ?auto_1120663 ?auto_1120660 ) ) ( not ( = ?auto_1120663 ?auto_1120661 ) ) ( not ( = ?auto_1120663 ?auto_1120662 ) ) ( IN-TRUCK ?auto_1120661 ?auto_1120664 ) ( TRUCK-AT ?auto_1120664 ?auto_1120665 ) ( IN-CITY ?auto_1120665 ?auto_1120666 ) ( IN-CITY ?auto_1120658 ?auto_1120666 ) ( not ( = ?auto_1120658 ?auto_1120665 ) ) ( OBJ-AT ?auto_1120659 ?auto_1120658 ) ( OBJ-AT ?auto_1120660 ?auto_1120658 ) ( OBJ-AT ?auto_1120662 ?auto_1120658 ) ( OBJ-AT ?auto_1120663 ?auto_1120658 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1120659 ?auto_1120661 ?auto_1120658 )
      ( DELIVER-5PKG-VERIFY ?auto_1120659 ?auto_1120660 ?auto_1120661 ?auto_1120662 ?auto_1120663 ?auto_1120658 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1122168 - OBJ
      ?auto_1122169 - OBJ
      ?auto_1122170 - OBJ
      ?auto_1122171 - OBJ
      ?auto_1122172 - OBJ
      ?auto_1122167 - LOCATION
    )
    :vars
    (
      ?auto_1122173 - TRUCK
      ?auto_1122174 - LOCATION
      ?auto_1122175 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1122169 ?auto_1122168 ) ) ( not ( = ?auto_1122170 ?auto_1122168 ) ) ( not ( = ?auto_1122170 ?auto_1122169 ) ) ( not ( = ?auto_1122171 ?auto_1122168 ) ) ( not ( = ?auto_1122171 ?auto_1122169 ) ) ( not ( = ?auto_1122171 ?auto_1122170 ) ) ( not ( = ?auto_1122172 ?auto_1122168 ) ) ( not ( = ?auto_1122172 ?auto_1122169 ) ) ( not ( = ?auto_1122172 ?auto_1122170 ) ) ( not ( = ?auto_1122172 ?auto_1122171 ) ) ( IN-TRUCK ?auto_1122169 ?auto_1122173 ) ( TRUCK-AT ?auto_1122173 ?auto_1122174 ) ( IN-CITY ?auto_1122174 ?auto_1122175 ) ( IN-CITY ?auto_1122167 ?auto_1122175 ) ( not ( = ?auto_1122167 ?auto_1122174 ) ) ( OBJ-AT ?auto_1122168 ?auto_1122167 ) ( OBJ-AT ?auto_1122170 ?auto_1122167 ) ( OBJ-AT ?auto_1122171 ?auto_1122167 ) ( OBJ-AT ?auto_1122172 ?auto_1122167 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1122168 ?auto_1122169 ?auto_1122167 )
      ( DELIVER-5PKG-VERIFY ?auto_1122168 ?auto_1122169 ?auto_1122170 ?auto_1122171 ?auto_1122172 ?auto_1122167 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1133550 - OBJ
      ?auto_1133551 - OBJ
      ?auto_1133552 - OBJ
      ?auto_1133553 - OBJ
      ?auto_1133554 - OBJ
      ?auto_1133549 - LOCATION
    )
    :vars
    (
      ?auto_1133555 - TRUCK
      ?auto_1133556 - LOCATION
      ?auto_1133557 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1133551 ?auto_1133550 ) ) ( not ( = ?auto_1133552 ?auto_1133550 ) ) ( not ( = ?auto_1133552 ?auto_1133551 ) ) ( not ( = ?auto_1133553 ?auto_1133550 ) ) ( not ( = ?auto_1133553 ?auto_1133551 ) ) ( not ( = ?auto_1133553 ?auto_1133552 ) ) ( not ( = ?auto_1133554 ?auto_1133550 ) ) ( not ( = ?auto_1133554 ?auto_1133551 ) ) ( not ( = ?auto_1133554 ?auto_1133552 ) ) ( not ( = ?auto_1133554 ?auto_1133553 ) ) ( IN-TRUCK ?auto_1133550 ?auto_1133555 ) ( TRUCK-AT ?auto_1133555 ?auto_1133556 ) ( IN-CITY ?auto_1133556 ?auto_1133557 ) ( IN-CITY ?auto_1133549 ?auto_1133557 ) ( not ( = ?auto_1133549 ?auto_1133556 ) ) ( OBJ-AT ?auto_1133551 ?auto_1133549 ) ( OBJ-AT ?auto_1133552 ?auto_1133549 ) ( OBJ-AT ?auto_1133553 ?auto_1133549 ) ( OBJ-AT ?auto_1133554 ?auto_1133549 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1133551 ?auto_1133550 ?auto_1133549 )
      ( DELIVER-5PKG-VERIFY ?auto_1133550 ?auto_1133551 ?auto_1133552 ?auto_1133553 ?auto_1133554 ?auto_1133549 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1142975 - OBJ
      ?auto_1142976 - OBJ
      ?auto_1142977 - OBJ
      ?auto_1142978 - OBJ
      ?auto_1142979 - OBJ
      ?auto_1142974 - LOCATION
    )
    :vars
    (
      ?auto_1142980 - TRUCK
      ?auto_1142981 - LOCATION
      ?auto_1142982 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1142976 ?auto_1142975 ) ) ( not ( = ?auto_1142977 ?auto_1142975 ) ) ( not ( = ?auto_1142977 ?auto_1142976 ) ) ( not ( = ?auto_1142978 ?auto_1142975 ) ) ( not ( = ?auto_1142978 ?auto_1142976 ) ) ( not ( = ?auto_1142978 ?auto_1142977 ) ) ( not ( = ?auto_1142979 ?auto_1142975 ) ) ( not ( = ?auto_1142979 ?auto_1142976 ) ) ( not ( = ?auto_1142979 ?auto_1142977 ) ) ( not ( = ?auto_1142979 ?auto_1142978 ) ) ( TRUCK-AT ?auto_1142980 ?auto_1142981 ) ( IN-CITY ?auto_1142981 ?auto_1142982 ) ( IN-CITY ?auto_1142974 ?auto_1142982 ) ( not ( = ?auto_1142974 ?auto_1142981 ) ) ( OBJ-AT ?auto_1142975 ?auto_1142974 ) ( OBJ-AT ?auto_1142979 ?auto_1142981 ) ( OBJ-AT ?auto_1142976 ?auto_1142974 ) ( OBJ-AT ?auto_1142977 ?auto_1142974 ) ( OBJ-AT ?auto_1142978 ?auto_1142974 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1142975 ?auto_1142979 ?auto_1142974 )
      ( DELIVER-5PKG-VERIFY ?auto_1142975 ?auto_1142976 ?auto_1142977 ?auto_1142978 ?auto_1142979 ?auto_1142974 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1143011 - OBJ
      ?auto_1143012 - OBJ
      ?auto_1143013 - OBJ
      ?auto_1143014 - OBJ
      ?auto_1143015 - OBJ
      ?auto_1143010 - LOCATION
    )
    :vars
    (
      ?auto_1143016 - TRUCK
      ?auto_1143017 - LOCATION
      ?auto_1143018 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1143012 ?auto_1143011 ) ) ( not ( = ?auto_1143013 ?auto_1143011 ) ) ( not ( = ?auto_1143013 ?auto_1143012 ) ) ( not ( = ?auto_1143014 ?auto_1143011 ) ) ( not ( = ?auto_1143014 ?auto_1143012 ) ) ( not ( = ?auto_1143014 ?auto_1143013 ) ) ( not ( = ?auto_1143015 ?auto_1143011 ) ) ( not ( = ?auto_1143015 ?auto_1143012 ) ) ( not ( = ?auto_1143015 ?auto_1143013 ) ) ( not ( = ?auto_1143015 ?auto_1143014 ) ) ( TRUCK-AT ?auto_1143016 ?auto_1143017 ) ( IN-CITY ?auto_1143017 ?auto_1143018 ) ( IN-CITY ?auto_1143010 ?auto_1143018 ) ( not ( = ?auto_1143010 ?auto_1143017 ) ) ( OBJ-AT ?auto_1143011 ?auto_1143010 ) ( OBJ-AT ?auto_1143014 ?auto_1143017 ) ( OBJ-AT ?auto_1143012 ?auto_1143010 ) ( OBJ-AT ?auto_1143013 ?auto_1143010 ) ( OBJ-AT ?auto_1143015 ?auto_1143010 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1143011 ?auto_1143014 ?auto_1143010 )
      ( DELIVER-5PKG-VERIFY ?auto_1143011 ?auto_1143012 ?auto_1143013 ?auto_1143014 ?auto_1143015 ?auto_1143010 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1143221 - OBJ
      ?auto_1143222 - OBJ
      ?auto_1143223 - OBJ
      ?auto_1143224 - OBJ
      ?auto_1143225 - OBJ
      ?auto_1143220 - LOCATION
    )
    :vars
    (
      ?auto_1143226 - TRUCK
      ?auto_1143227 - LOCATION
      ?auto_1143228 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1143222 ?auto_1143221 ) ) ( not ( = ?auto_1143223 ?auto_1143221 ) ) ( not ( = ?auto_1143223 ?auto_1143222 ) ) ( not ( = ?auto_1143224 ?auto_1143221 ) ) ( not ( = ?auto_1143224 ?auto_1143222 ) ) ( not ( = ?auto_1143224 ?auto_1143223 ) ) ( not ( = ?auto_1143225 ?auto_1143221 ) ) ( not ( = ?auto_1143225 ?auto_1143222 ) ) ( not ( = ?auto_1143225 ?auto_1143223 ) ) ( not ( = ?auto_1143225 ?auto_1143224 ) ) ( TRUCK-AT ?auto_1143226 ?auto_1143227 ) ( IN-CITY ?auto_1143227 ?auto_1143228 ) ( IN-CITY ?auto_1143220 ?auto_1143228 ) ( not ( = ?auto_1143220 ?auto_1143227 ) ) ( OBJ-AT ?auto_1143221 ?auto_1143220 ) ( OBJ-AT ?auto_1143223 ?auto_1143227 ) ( OBJ-AT ?auto_1143222 ?auto_1143220 ) ( OBJ-AT ?auto_1143224 ?auto_1143220 ) ( OBJ-AT ?auto_1143225 ?auto_1143220 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1143221 ?auto_1143223 ?auto_1143220 )
      ( DELIVER-5PKG-VERIFY ?auto_1143221 ?auto_1143222 ?auto_1143223 ?auto_1143224 ?auto_1143225 ?auto_1143220 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1144730 - OBJ
      ?auto_1144731 - OBJ
      ?auto_1144732 - OBJ
      ?auto_1144733 - OBJ
      ?auto_1144734 - OBJ
      ?auto_1144729 - LOCATION
    )
    :vars
    (
      ?auto_1144735 - TRUCK
      ?auto_1144736 - LOCATION
      ?auto_1144737 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1144731 ?auto_1144730 ) ) ( not ( = ?auto_1144732 ?auto_1144730 ) ) ( not ( = ?auto_1144732 ?auto_1144731 ) ) ( not ( = ?auto_1144733 ?auto_1144730 ) ) ( not ( = ?auto_1144733 ?auto_1144731 ) ) ( not ( = ?auto_1144733 ?auto_1144732 ) ) ( not ( = ?auto_1144734 ?auto_1144730 ) ) ( not ( = ?auto_1144734 ?auto_1144731 ) ) ( not ( = ?auto_1144734 ?auto_1144732 ) ) ( not ( = ?auto_1144734 ?auto_1144733 ) ) ( TRUCK-AT ?auto_1144735 ?auto_1144736 ) ( IN-CITY ?auto_1144736 ?auto_1144737 ) ( IN-CITY ?auto_1144729 ?auto_1144737 ) ( not ( = ?auto_1144729 ?auto_1144736 ) ) ( OBJ-AT ?auto_1144730 ?auto_1144729 ) ( OBJ-AT ?auto_1144731 ?auto_1144736 ) ( OBJ-AT ?auto_1144732 ?auto_1144729 ) ( OBJ-AT ?auto_1144733 ?auto_1144729 ) ( OBJ-AT ?auto_1144734 ?auto_1144729 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1144730 ?auto_1144731 ?auto_1144729 )
      ( DELIVER-5PKG-VERIFY ?auto_1144730 ?auto_1144731 ?auto_1144732 ?auto_1144733 ?auto_1144734 ?auto_1144729 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1156112 - OBJ
      ?auto_1156113 - OBJ
      ?auto_1156114 - OBJ
      ?auto_1156115 - OBJ
      ?auto_1156116 - OBJ
      ?auto_1156111 - LOCATION
    )
    :vars
    (
      ?auto_1156117 - TRUCK
      ?auto_1156118 - LOCATION
      ?auto_1156119 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1156113 ?auto_1156112 ) ) ( not ( = ?auto_1156114 ?auto_1156112 ) ) ( not ( = ?auto_1156114 ?auto_1156113 ) ) ( not ( = ?auto_1156115 ?auto_1156112 ) ) ( not ( = ?auto_1156115 ?auto_1156113 ) ) ( not ( = ?auto_1156115 ?auto_1156114 ) ) ( not ( = ?auto_1156116 ?auto_1156112 ) ) ( not ( = ?auto_1156116 ?auto_1156113 ) ) ( not ( = ?auto_1156116 ?auto_1156114 ) ) ( not ( = ?auto_1156116 ?auto_1156115 ) ) ( TRUCK-AT ?auto_1156117 ?auto_1156118 ) ( IN-CITY ?auto_1156118 ?auto_1156119 ) ( IN-CITY ?auto_1156111 ?auto_1156119 ) ( not ( = ?auto_1156111 ?auto_1156118 ) ) ( OBJ-AT ?auto_1156113 ?auto_1156111 ) ( OBJ-AT ?auto_1156112 ?auto_1156118 ) ( OBJ-AT ?auto_1156114 ?auto_1156111 ) ( OBJ-AT ?auto_1156115 ?auto_1156111 ) ( OBJ-AT ?auto_1156116 ?auto_1156111 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1156113 ?auto_1156112 ?auto_1156111 )
      ( DELIVER-5PKG-VERIFY ?auto_1156112 ?auto_1156113 ?auto_1156114 ?auto_1156115 ?auto_1156116 ?auto_1156111 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1165537 - OBJ
      ?auto_1165538 - OBJ
      ?auto_1165539 - OBJ
      ?auto_1165540 - OBJ
      ?auto_1165541 - OBJ
      ?auto_1165536 - LOCATION
    )
    :vars
    (
      ?auto_1165543 - LOCATION
      ?auto_1165544 - CITY
      ?auto_1165542 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1165538 ?auto_1165537 ) ) ( not ( = ?auto_1165539 ?auto_1165537 ) ) ( not ( = ?auto_1165539 ?auto_1165538 ) ) ( not ( = ?auto_1165540 ?auto_1165537 ) ) ( not ( = ?auto_1165540 ?auto_1165538 ) ) ( not ( = ?auto_1165540 ?auto_1165539 ) ) ( not ( = ?auto_1165541 ?auto_1165537 ) ) ( not ( = ?auto_1165541 ?auto_1165538 ) ) ( not ( = ?auto_1165541 ?auto_1165539 ) ) ( not ( = ?auto_1165541 ?auto_1165540 ) ) ( IN-CITY ?auto_1165543 ?auto_1165544 ) ( IN-CITY ?auto_1165536 ?auto_1165544 ) ( not ( = ?auto_1165536 ?auto_1165543 ) ) ( OBJ-AT ?auto_1165537 ?auto_1165536 ) ( OBJ-AT ?auto_1165541 ?auto_1165543 ) ( TRUCK-AT ?auto_1165542 ?auto_1165536 ) ( OBJ-AT ?auto_1165538 ?auto_1165536 ) ( OBJ-AT ?auto_1165539 ?auto_1165536 ) ( OBJ-AT ?auto_1165540 ?auto_1165536 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1165537 ?auto_1165541 ?auto_1165536 )
      ( DELIVER-5PKG-VERIFY ?auto_1165537 ?auto_1165538 ?auto_1165539 ?auto_1165540 ?auto_1165541 ?auto_1165536 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1165573 - OBJ
      ?auto_1165574 - OBJ
      ?auto_1165575 - OBJ
      ?auto_1165576 - OBJ
      ?auto_1165577 - OBJ
      ?auto_1165572 - LOCATION
    )
    :vars
    (
      ?auto_1165579 - LOCATION
      ?auto_1165580 - CITY
      ?auto_1165578 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1165574 ?auto_1165573 ) ) ( not ( = ?auto_1165575 ?auto_1165573 ) ) ( not ( = ?auto_1165575 ?auto_1165574 ) ) ( not ( = ?auto_1165576 ?auto_1165573 ) ) ( not ( = ?auto_1165576 ?auto_1165574 ) ) ( not ( = ?auto_1165576 ?auto_1165575 ) ) ( not ( = ?auto_1165577 ?auto_1165573 ) ) ( not ( = ?auto_1165577 ?auto_1165574 ) ) ( not ( = ?auto_1165577 ?auto_1165575 ) ) ( not ( = ?auto_1165577 ?auto_1165576 ) ) ( IN-CITY ?auto_1165579 ?auto_1165580 ) ( IN-CITY ?auto_1165572 ?auto_1165580 ) ( not ( = ?auto_1165572 ?auto_1165579 ) ) ( OBJ-AT ?auto_1165573 ?auto_1165572 ) ( OBJ-AT ?auto_1165576 ?auto_1165579 ) ( TRUCK-AT ?auto_1165578 ?auto_1165572 ) ( OBJ-AT ?auto_1165574 ?auto_1165572 ) ( OBJ-AT ?auto_1165575 ?auto_1165572 ) ( OBJ-AT ?auto_1165577 ?auto_1165572 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1165573 ?auto_1165576 ?auto_1165572 )
      ( DELIVER-5PKG-VERIFY ?auto_1165573 ?auto_1165574 ?auto_1165575 ?auto_1165576 ?auto_1165577 ?auto_1165572 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1165783 - OBJ
      ?auto_1165784 - OBJ
      ?auto_1165785 - OBJ
      ?auto_1165786 - OBJ
      ?auto_1165787 - OBJ
      ?auto_1165782 - LOCATION
    )
    :vars
    (
      ?auto_1165789 - LOCATION
      ?auto_1165790 - CITY
      ?auto_1165788 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1165784 ?auto_1165783 ) ) ( not ( = ?auto_1165785 ?auto_1165783 ) ) ( not ( = ?auto_1165785 ?auto_1165784 ) ) ( not ( = ?auto_1165786 ?auto_1165783 ) ) ( not ( = ?auto_1165786 ?auto_1165784 ) ) ( not ( = ?auto_1165786 ?auto_1165785 ) ) ( not ( = ?auto_1165787 ?auto_1165783 ) ) ( not ( = ?auto_1165787 ?auto_1165784 ) ) ( not ( = ?auto_1165787 ?auto_1165785 ) ) ( not ( = ?auto_1165787 ?auto_1165786 ) ) ( IN-CITY ?auto_1165789 ?auto_1165790 ) ( IN-CITY ?auto_1165782 ?auto_1165790 ) ( not ( = ?auto_1165782 ?auto_1165789 ) ) ( OBJ-AT ?auto_1165783 ?auto_1165782 ) ( OBJ-AT ?auto_1165785 ?auto_1165789 ) ( TRUCK-AT ?auto_1165788 ?auto_1165782 ) ( OBJ-AT ?auto_1165784 ?auto_1165782 ) ( OBJ-AT ?auto_1165786 ?auto_1165782 ) ( OBJ-AT ?auto_1165787 ?auto_1165782 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1165783 ?auto_1165785 ?auto_1165782 )
      ( DELIVER-5PKG-VERIFY ?auto_1165783 ?auto_1165784 ?auto_1165785 ?auto_1165786 ?auto_1165787 ?auto_1165782 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1167292 - OBJ
      ?auto_1167293 - OBJ
      ?auto_1167294 - OBJ
      ?auto_1167295 - OBJ
      ?auto_1167296 - OBJ
      ?auto_1167291 - LOCATION
    )
    :vars
    (
      ?auto_1167298 - LOCATION
      ?auto_1167299 - CITY
      ?auto_1167297 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1167293 ?auto_1167292 ) ) ( not ( = ?auto_1167294 ?auto_1167292 ) ) ( not ( = ?auto_1167294 ?auto_1167293 ) ) ( not ( = ?auto_1167295 ?auto_1167292 ) ) ( not ( = ?auto_1167295 ?auto_1167293 ) ) ( not ( = ?auto_1167295 ?auto_1167294 ) ) ( not ( = ?auto_1167296 ?auto_1167292 ) ) ( not ( = ?auto_1167296 ?auto_1167293 ) ) ( not ( = ?auto_1167296 ?auto_1167294 ) ) ( not ( = ?auto_1167296 ?auto_1167295 ) ) ( IN-CITY ?auto_1167298 ?auto_1167299 ) ( IN-CITY ?auto_1167291 ?auto_1167299 ) ( not ( = ?auto_1167291 ?auto_1167298 ) ) ( OBJ-AT ?auto_1167292 ?auto_1167291 ) ( OBJ-AT ?auto_1167293 ?auto_1167298 ) ( TRUCK-AT ?auto_1167297 ?auto_1167291 ) ( OBJ-AT ?auto_1167294 ?auto_1167291 ) ( OBJ-AT ?auto_1167295 ?auto_1167291 ) ( OBJ-AT ?auto_1167296 ?auto_1167291 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1167292 ?auto_1167293 ?auto_1167291 )
      ( DELIVER-5PKG-VERIFY ?auto_1167292 ?auto_1167293 ?auto_1167294 ?auto_1167295 ?auto_1167296 ?auto_1167291 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1178674 - OBJ
      ?auto_1178675 - OBJ
      ?auto_1178676 - OBJ
      ?auto_1178677 - OBJ
      ?auto_1178678 - OBJ
      ?auto_1178673 - LOCATION
    )
    :vars
    (
      ?auto_1178680 - LOCATION
      ?auto_1178681 - CITY
      ?auto_1178679 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1178675 ?auto_1178674 ) ) ( not ( = ?auto_1178676 ?auto_1178674 ) ) ( not ( = ?auto_1178676 ?auto_1178675 ) ) ( not ( = ?auto_1178677 ?auto_1178674 ) ) ( not ( = ?auto_1178677 ?auto_1178675 ) ) ( not ( = ?auto_1178677 ?auto_1178676 ) ) ( not ( = ?auto_1178678 ?auto_1178674 ) ) ( not ( = ?auto_1178678 ?auto_1178675 ) ) ( not ( = ?auto_1178678 ?auto_1178676 ) ) ( not ( = ?auto_1178678 ?auto_1178677 ) ) ( IN-CITY ?auto_1178680 ?auto_1178681 ) ( IN-CITY ?auto_1178673 ?auto_1178681 ) ( not ( = ?auto_1178673 ?auto_1178680 ) ) ( OBJ-AT ?auto_1178675 ?auto_1178673 ) ( OBJ-AT ?auto_1178674 ?auto_1178680 ) ( TRUCK-AT ?auto_1178679 ?auto_1178673 ) ( OBJ-AT ?auto_1178676 ?auto_1178673 ) ( OBJ-AT ?auto_1178677 ?auto_1178673 ) ( OBJ-AT ?auto_1178678 ?auto_1178673 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1178675 ?auto_1178674 ?auto_1178673 )
      ( DELIVER-5PKG-VERIFY ?auto_1178674 ?auto_1178675 ?auto_1178676 ?auto_1178677 ?auto_1178678 ?auto_1178673 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1207949 - OBJ
      ?auto_1207950 - OBJ
      ?auto_1207951 - OBJ
      ?auto_1207952 - OBJ
      ?auto_1207948 - LOCATION
    )
    :vars
    (
      ?auto_1207953 - LOCATION
      ?auto_1207955 - CITY
      ?auto_1207956 - TRUCK
      ?auto_1207954 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1207950 ?auto_1207949 ) ) ( not ( = ?auto_1207951 ?auto_1207949 ) ) ( not ( = ?auto_1207951 ?auto_1207950 ) ) ( not ( = ?auto_1207952 ?auto_1207949 ) ) ( not ( = ?auto_1207952 ?auto_1207950 ) ) ( not ( = ?auto_1207952 ?auto_1207951 ) ) ( IN-CITY ?auto_1207953 ?auto_1207955 ) ( IN-CITY ?auto_1207948 ?auto_1207955 ) ( not ( = ?auto_1207948 ?auto_1207953 ) ) ( OBJ-AT ?auto_1207949 ?auto_1207948 ) ( OBJ-AT ?auto_1207952 ?auto_1207953 ) ( TRUCK-AT ?auto_1207956 ?auto_1207954 ) ( IN-CITY ?auto_1207954 ?auto_1207955 ) ( not ( = ?auto_1207948 ?auto_1207954 ) ) ( not ( = ?auto_1207953 ?auto_1207954 ) ) ( OBJ-AT ?auto_1207950 ?auto_1207948 ) ( OBJ-AT ?auto_1207951 ?auto_1207948 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1207949 ?auto_1207952 ?auto_1207948 )
      ( DELIVER-4PKG-VERIFY ?auto_1207949 ?auto_1207950 ?auto_1207951 ?auto_1207952 ?auto_1207948 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1207985 - OBJ
      ?auto_1207986 - OBJ
      ?auto_1207987 - OBJ
      ?auto_1207988 - OBJ
      ?auto_1207984 - LOCATION
    )
    :vars
    (
      ?auto_1207989 - LOCATION
      ?auto_1207991 - CITY
      ?auto_1207992 - TRUCK
      ?auto_1207990 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1207986 ?auto_1207985 ) ) ( not ( = ?auto_1207987 ?auto_1207985 ) ) ( not ( = ?auto_1207987 ?auto_1207986 ) ) ( not ( = ?auto_1207988 ?auto_1207985 ) ) ( not ( = ?auto_1207988 ?auto_1207986 ) ) ( not ( = ?auto_1207988 ?auto_1207987 ) ) ( IN-CITY ?auto_1207989 ?auto_1207991 ) ( IN-CITY ?auto_1207984 ?auto_1207991 ) ( not ( = ?auto_1207984 ?auto_1207989 ) ) ( OBJ-AT ?auto_1207985 ?auto_1207984 ) ( OBJ-AT ?auto_1207987 ?auto_1207989 ) ( TRUCK-AT ?auto_1207992 ?auto_1207990 ) ( IN-CITY ?auto_1207990 ?auto_1207991 ) ( not ( = ?auto_1207984 ?auto_1207990 ) ) ( not ( = ?auto_1207989 ?auto_1207990 ) ) ( OBJ-AT ?auto_1207986 ?auto_1207984 ) ( OBJ-AT ?auto_1207988 ?auto_1207984 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1207985 ?auto_1207987 ?auto_1207984 )
      ( DELIVER-4PKG-VERIFY ?auto_1207985 ?auto_1207986 ?auto_1207987 ?auto_1207988 ?auto_1207984 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1208229 - OBJ
      ?auto_1208230 - OBJ
      ?auto_1208231 - OBJ
      ?auto_1208232 - OBJ
      ?auto_1208228 - LOCATION
    )
    :vars
    (
      ?auto_1208233 - LOCATION
      ?auto_1208235 - CITY
      ?auto_1208236 - TRUCK
      ?auto_1208234 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1208230 ?auto_1208229 ) ) ( not ( = ?auto_1208231 ?auto_1208229 ) ) ( not ( = ?auto_1208231 ?auto_1208230 ) ) ( not ( = ?auto_1208232 ?auto_1208229 ) ) ( not ( = ?auto_1208232 ?auto_1208230 ) ) ( not ( = ?auto_1208232 ?auto_1208231 ) ) ( IN-CITY ?auto_1208233 ?auto_1208235 ) ( IN-CITY ?auto_1208228 ?auto_1208235 ) ( not ( = ?auto_1208228 ?auto_1208233 ) ) ( OBJ-AT ?auto_1208229 ?auto_1208228 ) ( OBJ-AT ?auto_1208230 ?auto_1208233 ) ( TRUCK-AT ?auto_1208236 ?auto_1208234 ) ( IN-CITY ?auto_1208234 ?auto_1208235 ) ( not ( = ?auto_1208228 ?auto_1208234 ) ) ( not ( = ?auto_1208233 ?auto_1208234 ) ) ( OBJ-AT ?auto_1208231 ?auto_1208228 ) ( OBJ-AT ?auto_1208232 ?auto_1208228 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1208229 ?auto_1208230 ?auto_1208228 )
      ( DELIVER-4PKG-VERIFY ?auto_1208229 ?auto_1208230 ?auto_1208231 ?auto_1208232 ?auto_1208228 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1210160 - OBJ
      ?auto_1210161 - OBJ
      ?auto_1210162 - OBJ
      ?auto_1210163 - OBJ
      ?auto_1210159 - LOCATION
    )
    :vars
    (
      ?auto_1210164 - LOCATION
      ?auto_1210166 - CITY
      ?auto_1210167 - TRUCK
      ?auto_1210165 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1210161 ?auto_1210160 ) ) ( not ( = ?auto_1210162 ?auto_1210160 ) ) ( not ( = ?auto_1210162 ?auto_1210161 ) ) ( not ( = ?auto_1210163 ?auto_1210160 ) ) ( not ( = ?auto_1210163 ?auto_1210161 ) ) ( not ( = ?auto_1210163 ?auto_1210162 ) ) ( IN-CITY ?auto_1210164 ?auto_1210166 ) ( IN-CITY ?auto_1210159 ?auto_1210166 ) ( not ( = ?auto_1210159 ?auto_1210164 ) ) ( OBJ-AT ?auto_1210161 ?auto_1210159 ) ( OBJ-AT ?auto_1210160 ?auto_1210164 ) ( TRUCK-AT ?auto_1210167 ?auto_1210165 ) ( IN-CITY ?auto_1210165 ?auto_1210166 ) ( not ( = ?auto_1210159 ?auto_1210165 ) ) ( not ( = ?auto_1210164 ?auto_1210165 ) ) ( OBJ-AT ?auto_1210162 ?auto_1210159 ) ( OBJ-AT ?auto_1210163 ?auto_1210159 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1210161 ?auto_1210160 ?auto_1210159 )
      ( DELIVER-4PKG-VERIFY ?auto_1210160 ?auto_1210161 ?auto_1210162 ?auto_1210163 ?auto_1210159 ) )
  )

)

