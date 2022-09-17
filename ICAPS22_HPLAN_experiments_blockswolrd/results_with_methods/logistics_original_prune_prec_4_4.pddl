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
      ?auto_175961 - OBJ
      ?auto_175960 - LOCATION
    )
    :vars
    (
      ?auto_175962 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175962 ?auto_175960 ) ( IN-TRUCK ?auto_175961 ?auto_175962 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_175961 ?auto_175962 ?auto_175960 )
      ( DELIVER-1PKG-VERIFY ?auto_175961 ?auto_175960 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_175979 - OBJ
      ?auto_175978 - LOCATION
    )
    :vars
    (
      ?auto_175980 - TRUCK
      ?auto_175981 - LOCATION
      ?auto_175982 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_175979 ?auto_175980 ) ( TRUCK-AT ?auto_175980 ?auto_175981 ) ( IN-CITY ?auto_175981 ?auto_175982 ) ( IN-CITY ?auto_175978 ?auto_175982 ) ( not ( = ?auto_175978 ?auto_175981 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_175980 ?auto_175981 ?auto_175978 ?auto_175982 )
      ( DELIVER-1PKG ?auto_175979 ?auto_175978 )
      ( DELIVER-1PKG-VERIFY ?auto_175979 ?auto_175978 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_176005 - OBJ
      ?auto_176004 - LOCATION
    )
    :vars
    (
      ?auto_176008 - TRUCK
      ?auto_176006 - LOCATION
      ?auto_176007 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176008 ?auto_176006 ) ( IN-CITY ?auto_176006 ?auto_176007 ) ( IN-CITY ?auto_176004 ?auto_176007 ) ( not ( = ?auto_176004 ?auto_176006 ) ) ( OBJ-AT ?auto_176005 ?auto_176006 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_176005 ?auto_176008 ?auto_176006 )
      ( DELIVER-1PKG ?auto_176005 ?auto_176004 )
      ( DELIVER-1PKG-VERIFY ?auto_176005 ?auto_176004 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_176031 - OBJ
      ?auto_176030 - LOCATION
    )
    :vars
    (
      ?auto_176034 - LOCATION
      ?auto_176032 - CITY
      ?auto_176033 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176034 ?auto_176032 ) ( IN-CITY ?auto_176030 ?auto_176032 ) ( not ( = ?auto_176030 ?auto_176034 ) ) ( OBJ-AT ?auto_176031 ?auto_176034 ) ( TRUCK-AT ?auto_176033 ?auto_176030 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_176033 ?auto_176030 ?auto_176034 ?auto_176032 )
      ( DELIVER-1PKG ?auto_176031 ?auto_176030 )
      ( DELIVER-1PKG-VERIFY ?auto_176031 ?auto_176030 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176174 - OBJ
      ?auto_176175 - OBJ
      ?auto_176173 - LOCATION
    )
    :vars
    (
      ?auto_176176 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_176175 ?auto_176174 ) ) ( TRUCK-AT ?auto_176176 ?auto_176173 ) ( IN-TRUCK ?auto_176175 ?auto_176176 ) ( OBJ-AT ?auto_176174 ?auto_176173 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176175 ?auto_176173 )
      ( DELIVER-2PKG-VERIFY ?auto_176174 ?auto_176175 ?auto_176173 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176178 - OBJ
      ?auto_176179 - OBJ
      ?auto_176177 - LOCATION
    )
    :vars
    (
      ?auto_176180 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_176179 ?auto_176178 ) ) ( TRUCK-AT ?auto_176180 ?auto_176177 ) ( IN-TRUCK ?auto_176178 ?auto_176180 ) ( OBJ-AT ?auto_176179 ?auto_176177 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176178 ?auto_176177 )
      ( DELIVER-2PKG-VERIFY ?auto_176178 ?auto_176179 ?auto_176177 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176316 - OBJ
      ?auto_176317 - OBJ
      ?auto_176315 - LOCATION
    )
    :vars
    (
      ?auto_176320 - TRUCK
      ?auto_176319 - LOCATION
      ?auto_176318 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_176317 ?auto_176316 ) ) ( IN-TRUCK ?auto_176317 ?auto_176320 ) ( TRUCK-AT ?auto_176320 ?auto_176319 ) ( IN-CITY ?auto_176319 ?auto_176318 ) ( IN-CITY ?auto_176315 ?auto_176318 ) ( not ( = ?auto_176315 ?auto_176319 ) ) ( OBJ-AT ?auto_176316 ?auto_176315 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176317 ?auto_176315 )
      ( DELIVER-2PKG-VERIFY ?auto_176316 ?auto_176317 ?auto_176315 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176322 - OBJ
      ?auto_176323 - OBJ
      ?auto_176321 - LOCATION
    )
    :vars
    (
      ?auto_176324 - TRUCK
      ?auto_176325 - LOCATION
      ?auto_176326 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_176323 ?auto_176322 ) ) ( IN-TRUCK ?auto_176322 ?auto_176324 ) ( TRUCK-AT ?auto_176324 ?auto_176325 ) ( IN-CITY ?auto_176325 ?auto_176326 ) ( IN-CITY ?auto_176321 ?auto_176326 ) ( not ( = ?auto_176321 ?auto_176325 ) ) ( OBJ-AT ?auto_176323 ?auto_176321 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176323 ?auto_176322 ?auto_176321 )
      ( DELIVER-2PKG-VERIFY ?auto_176322 ?auto_176323 ?auto_176321 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_176506 - OBJ
      ?auto_176505 - LOCATION
    )
    :vars
    (
      ?auto_176507 - OBJ
      ?auto_176508 - TRUCK
      ?auto_176509 - LOCATION
      ?auto_176510 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_176506 ?auto_176507 ) ) ( TRUCK-AT ?auto_176508 ?auto_176509 ) ( IN-CITY ?auto_176509 ?auto_176510 ) ( IN-CITY ?auto_176505 ?auto_176510 ) ( not ( = ?auto_176505 ?auto_176509 ) ) ( OBJ-AT ?auto_176507 ?auto_176505 ) ( OBJ-AT ?auto_176506 ?auto_176509 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_176506 ?auto_176508 ?auto_176509 )
      ( DELIVER-2PKG ?auto_176507 ?auto_176506 ?auto_176505 )
      ( DELIVER-1PKG-VERIFY ?auto_176506 ?auto_176505 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176512 - OBJ
      ?auto_176513 - OBJ
      ?auto_176511 - LOCATION
    )
    :vars
    (
      ?auto_176515 - TRUCK
      ?auto_176514 - LOCATION
      ?auto_176516 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_176513 ?auto_176512 ) ) ( TRUCK-AT ?auto_176515 ?auto_176514 ) ( IN-CITY ?auto_176514 ?auto_176516 ) ( IN-CITY ?auto_176511 ?auto_176516 ) ( not ( = ?auto_176511 ?auto_176514 ) ) ( OBJ-AT ?auto_176512 ?auto_176511 ) ( OBJ-AT ?auto_176513 ?auto_176514 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176513 ?auto_176511 )
      ( DELIVER-2PKG-VERIFY ?auto_176512 ?auto_176513 ?auto_176511 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176518 - OBJ
      ?auto_176519 - OBJ
      ?auto_176517 - LOCATION
    )
    :vars
    (
      ?auto_176520 - TRUCK
      ?auto_176522 - LOCATION
      ?auto_176521 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_176519 ?auto_176518 ) ) ( TRUCK-AT ?auto_176520 ?auto_176522 ) ( IN-CITY ?auto_176522 ?auto_176521 ) ( IN-CITY ?auto_176517 ?auto_176521 ) ( not ( = ?auto_176517 ?auto_176522 ) ) ( OBJ-AT ?auto_176519 ?auto_176517 ) ( OBJ-AT ?auto_176518 ?auto_176522 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176519 ?auto_176518 ?auto_176517 )
      ( DELIVER-2PKG-VERIFY ?auto_176518 ?auto_176519 ?auto_176517 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_176702 - OBJ
      ?auto_176701 - LOCATION
    )
    :vars
    (
      ?auto_176704 - OBJ
      ?auto_176706 - LOCATION
      ?auto_176705 - CITY
      ?auto_176703 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_176702 ?auto_176704 ) ) ( IN-CITY ?auto_176706 ?auto_176705 ) ( IN-CITY ?auto_176701 ?auto_176705 ) ( not ( = ?auto_176701 ?auto_176706 ) ) ( OBJ-AT ?auto_176704 ?auto_176701 ) ( OBJ-AT ?auto_176702 ?auto_176706 ) ( TRUCK-AT ?auto_176703 ?auto_176701 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_176703 ?auto_176701 ?auto_176706 ?auto_176705 )
      ( DELIVER-2PKG ?auto_176704 ?auto_176702 ?auto_176701 )
      ( DELIVER-1PKG-VERIFY ?auto_176702 ?auto_176701 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176708 - OBJ
      ?auto_176709 - OBJ
      ?auto_176707 - LOCATION
    )
    :vars
    (
      ?auto_176711 - LOCATION
      ?auto_176710 - CITY
      ?auto_176712 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_176709 ?auto_176708 ) ) ( IN-CITY ?auto_176711 ?auto_176710 ) ( IN-CITY ?auto_176707 ?auto_176710 ) ( not ( = ?auto_176707 ?auto_176711 ) ) ( OBJ-AT ?auto_176708 ?auto_176707 ) ( OBJ-AT ?auto_176709 ?auto_176711 ) ( TRUCK-AT ?auto_176712 ?auto_176707 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176709 ?auto_176707 )
      ( DELIVER-2PKG-VERIFY ?auto_176708 ?auto_176709 ?auto_176707 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176714 - OBJ
      ?auto_176715 - OBJ
      ?auto_176713 - LOCATION
    )
    :vars
    (
      ?auto_176718 - LOCATION
      ?auto_176717 - CITY
      ?auto_176716 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_176715 ?auto_176714 ) ) ( IN-CITY ?auto_176718 ?auto_176717 ) ( IN-CITY ?auto_176713 ?auto_176717 ) ( not ( = ?auto_176713 ?auto_176718 ) ) ( OBJ-AT ?auto_176715 ?auto_176713 ) ( OBJ-AT ?auto_176714 ?auto_176718 ) ( TRUCK-AT ?auto_176716 ?auto_176713 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176715 ?auto_176714 ?auto_176713 )
      ( DELIVER-2PKG-VERIFY ?auto_176714 ?auto_176715 ?auto_176713 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_176898 - OBJ
      ?auto_176897 - LOCATION
    )
    :vars
    (
      ?auto_176899 - OBJ
      ?auto_176902 - LOCATION
      ?auto_176901 - CITY
      ?auto_176900 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_176898 ?auto_176899 ) ) ( IN-CITY ?auto_176902 ?auto_176901 ) ( IN-CITY ?auto_176897 ?auto_176901 ) ( not ( = ?auto_176897 ?auto_176902 ) ) ( OBJ-AT ?auto_176898 ?auto_176902 ) ( TRUCK-AT ?auto_176900 ?auto_176897 ) ( IN-TRUCK ?auto_176899 ?auto_176900 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176899 ?auto_176897 )
      ( DELIVER-2PKG ?auto_176899 ?auto_176898 ?auto_176897 )
      ( DELIVER-1PKG-VERIFY ?auto_176898 ?auto_176897 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176904 - OBJ
      ?auto_176905 - OBJ
      ?auto_176903 - LOCATION
    )
    :vars
    (
      ?auto_176906 - LOCATION
      ?auto_176907 - CITY
      ?auto_176908 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_176905 ?auto_176904 ) ) ( IN-CITY ?auto_176906 ?auto_176907 ) ( IN-CITY ?auto_176903 ?auto_176907 ) ( not ( = ?auto_176903 ?auto_176906 ) ) ( OBJ-AT ?auto_176905 ?auto_176906 ) ( TRUCK-AT ?auto_176908 ?auto_176903 ) ( IN-TRUCK ?auto_176904 ?auto_176908 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176905 ?auto_176903 )
      ( DELIVER-2PKG-VERIFY ?auto_176904 ?auto_176905 ?auto_176903 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176910 - OBJ
      ?auto_176911 - OBJ
      ?auto_176909 - LOCATION
    )
    :vars
    (
      ?auto_176912 - LOCATION
      ?auto_176914 - CITY
      ?auto_176913 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_176911 ?auto_176910 ) ) ( IN-CITY ?auto_176912 ?auto_176914 ) ( IN-CITY ?auto_176909 ?auto_176914 ) ( not ( = ?auto_176909 ?auto_176912 ) ) ( OBJ-AT ?auto_176910 ?auto_176912 ) ( TRUCK-AT ?auto_176913 ?auto_176909 ) ( IN-TRUCK ?auto_176911 ?auto_176913 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176911 ?auto_176910 ?auto_176909 )
      ( DELIVER-2PKG-VERIFY ?auto_176910 ?auto_176911 ?auto_176909 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_177094 - OBJ
      ?auto_177093 - LOCATION
    )
    :vars
    (
      ?auto_177097 - OBJ
      ?auto_177095 - LOCATION
      ?auto_177098 - CITY
      ?auto_177096 - TRUCK
      ?auto_177099 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177094 ?auto_177097 ) ) ( IN-CITY ?auto_177095 ?auto_177098 ) ( IN-CITY ?auto_177093 ?auto_177098 ) ( not ( = ?auto_177093 ?auto_177095 ) ) ( OBJ-AT ?auto_177094 ?auto_177095 ) ( IN-TRUCK ?auto_177097 ?auto_177096 ) ( TRUCK-AT ?auto_177096 ?auto_177099 ) ( IN-CITY ?auto_177099 ?auto_177098 ) ( not ( = ?auto_177093 ?auto_177099 ) ) ( not ( = ?auto_177095 ?auto_177099 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_177096 ?auto_177099 ?auto_177093 ?auto_177098 )
      ( DELIVER-2PKG ?auto_177097 ?auto_177094 ?auto_177093 )
      ( DELIVER-1PKG-VERIFY ?auto_177094 ?auto_177093 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177101 - OBJ
      ?auto_177102 - OBJ
      ?auto_177100 - LOCATION
    )
    :vars
    (
      ?auto_177106 - LOCATION
      ?auto_177103 - CITY
      ?auto_177104 - TRUCK
      ?auto_177105 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177102 ?auto_177101 ) ) ( IN-CITY ?auto_177106 ?auto_177103 ) ( IN-CITY ?auto_177100 ?auto_177103 ) ( not ( = ?auto_177100 ?auto_177106 ) ) ( OBJ-AT ?auto_177102 ?auto_177106 ) ( IN-TRUCK ?auto_177101 ?auto_177104 ) ( TRUCK-AT ?auto_177104 ?auto_177105 ) ( IN-CITY ?auto_177105 ?auto_177103 ) ( not ( = ?auto_177100 ?auto_177105 ) ) ( not ( = ?auto_177106 ?auto_177105 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_177102 ?auto_177100 )
      ( DELIVER-2PKG-VERIFY ?auto_177101 ?auto_177102 ?auto_177100 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177108 - OBJ
      ?auto_177109 - OBJ
      ?auto_177107 - LOCATION
    )
    :vars
    (
      ?auto_177113 - LOCATION
      ?auto_177112 - CITY
      ?auto_177110 - TRUCK
      ?auto_177111 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177109 ?auto_177108 ) ) ( IN-CITY ?auto_177113 ?auto_177112 ) ( IN-CITY ?auto_177107 ?auto_177112 ) ( not ( = ?auto_177107 ?auto_177113 ) ) ( OBJ-AT ?auto_177108 ?auto_177113 ) ( IN-TRUCK ?auto_177109 ?auto_177110 ) ( TRUCK-AT ?auto_177110 ?auto_177111 ) ( IN-CITY ?auto_177111 ?auto_177112 ) ( not ( = ?auto_177107 ?auto_177111 ) ) ( not ( = ?auto_177113 ?auto_177111 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177109 ?auto_177108 ?auto_177107 )
      ( DELIVER-2PKG-VERIFY ?auto_177108 ?auto_177109 ?auto_177107 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_177316 - OBJ
      ?auto_177315 - LOCATION
    )
    :vars
    (
      ?auto_177318 - OBJ
      ?auto_177321 - LOCATION
      ?auto_177320 - CITY
      ?auto_177317 - TRUCK
      ?auto_177319 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177316 ?auto_177318 ) ) ( IN-CITY ?auto_177321 ?auto_177320 ) ( IN-CITY ?auto_177315 ?auto_177320 ) ( not ( = ?auto_177315 ?auto_177321 ) ) ( OBJ-AT ?auto_177316 ?auto_177321 ) ( TRUCK-AT ?auto_177317 ?auto_177319 ) ( IN-CITY ?auto_177319 ?auto_177320 ) ( not ( = ?auto_177315 ?auto_177319 ) ) ( not ( = ?auto_177321 ?auto_177319 ) ) ( OBJ-AT ?auto_177318 ?auto_177319 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_177318 ?auto_177317 ?auto_177319 )
      ( DELIVER-2PKG ?auto_177318 ?auto_177316 ?auto_177315 )
      ( DELIVER-1PKG-VERIFY ?auto_177316 ?auto_177315 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177323 - OBJ
      ?auto_177324 - OBJ
      ?auto_177322 - LOCATION
    )
    :vars
    (
      ?auto_177325 - LOCATION
      ?auto_177327 - CITY
      ?auto_177326 - TRUCK
      ?auto_177328 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177324 ?auto_177323 ) ) ( IN-CITY ?auto_177325 ?auto_177327 ) ( IN-CITY ?auto_177322 ?auto_177327 ) ( not ( = ?auto_177322 ?auto_177325 ) ) ( OBJ-AT ?auto_177324 ?auto_177325 ) ( TRUCK-AT ?auto_177326 ?auto_177328 ) ( IN-CITY ?auto_177328 ?auto_177327 ) ( not ( = ?auto_177322 ?auto_177328 ) ) ( not ( = ?auto_177325 ?auto_177328 ) ) ( OBJ-AT ?auto_177323 ?auto_177328 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_177324 ?auto_177322 )
      ( DELIVER-2PKG-VERIFY ?auto_177323 ?auto_177324 ?auto_177322 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177330 - OBJ
      ?auto_177331 - OBJ
      ?auto_177329 - LOCATION
    )
    :vars
    (
      ?auto_177332 - LOCATION
      ?auto_177333 - CITY
      ?auto_177334 - TRUCK
      ?auto_177335 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177331 ?auto_177330 ) ) ( IN-CITY ?auto_177332 ?auto_177333 ) ( IN-CITY ?auto_177329 ?auto_177333 ) ( not ( = ?auto_177329 ?auto_177332 ) ) ( OBJ-AT ?auto_177330 ?auto_177332 ) ( TRUCK-AT ?auto_177334 ?auto_177335 ) ( IN-CITY ?auto_177335 ?auto_177333 ) ( not ( = ?auto_177329 ?auto_177335 ) ) ( not ( = ?auto_177332 ?auto_177335 ) ) ( OBJ-AT ?auto_177331 ?auto_177335 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177331 ?auto_177330 ?auto_177329 )
      ( DELIVER-2PKG-VERIFY ?auto_177330 ?auto_177331 ?auto_177329 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178171 - OBJ
      ?auto_178172 - OBJ
      ?auto_178173 - OBJ
      ?auto_178170 - LOCATION
    )
    :vars
    (
      ?auto_178174 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_178172 ?auto_178171 ) ) ( not ( = ?auto_178173 ?auto_178171 ) ) ( not ( = ?auto_178173 ?auto_178172 ) ) ( TRUCK-AT ?auto_178174 ?auto_178170 ) ( IN-TRUCK ?auto_178173 ?auto_178174 ) ( OBJ-AT ?auto_178171 ?auto_178170 ) ( OBJ-AT ?auto_178172 ?auto_178170 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_178173 ?auto_178170 )
      ( DELIVER-3PKG-VERIFY ?auto_178171 ?auto_178172 ?auto_178173 ?auto_178170 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178181 - OBJ
      ?auto_178182 - OBJ
      ?auto_178183 - OBJ
      ?auto_178180 - LOCATION
    )
    :vars
    (
      ?auto_178184 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_178182 ?auto_178181 ) ) ( not ( = ?auto_178183 ?auto_178181 ) ) ( not ( = ?auto_178183 ?auto_178182 ) ) ( TRUCK-AT ?auto_178184 ?auto_178180 ) ( IN-TRUCK ?auto_178182 ?auto_178184 ) ( OBJ-AT ?auto_178181 ?auto_178180 ) ( OBJ-AT ?auto_178183 ?auto_178180 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_178182 ?auto_178180 )
      ( DELIVER-3PKG-VERIFY ?auto_178181 ?auto_178182 ?auto_178183 ?auto_178180 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178219 - OBJ
      ?auto_178220 - OBJ
      ?auto_178221 - OBJ
      ?auto_178218 - LOCATION
    )
    :vars
    (
      ?auto_178222 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_178220 ?auto_178219 ) ) ( not ( = ?auto_178221 ?auto_178219 ) ) ( not ( = ?auto_178221 ?auto_178220 ) ) ( TRUCK-AT ?auto_178222 ?auto_178218 ) ( IN-TRUCK ?auto_178219 ?auto_178222 ) ( OBJ-AT ?auto_178220 ?auto_178218 ) ( OBJ-AT ?auto_178221 ?auto_178218 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_178219 ?auto_178218 )
      ( DELIVER-3PKG-VERIFY ?auto_178219 ?auto_178220 ?auto_178221 ?auto_178218 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178685 - OBJ
      ?auto_178686 - OBJ
      ?auto_178687 - OBJ
      ?auto_178684 - LOCATION
    )
    :vars
    (
      ?auto_178690 - TRUCK
      ?auto_178688 - LOCATION
      ?auto_178689 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_178686 ?auto_178685 ) ) ( not ( = ?auto_178687 ?auto_178685 ) ) ( not ( = ?auto_178687 ?auto_178686 ) ) ( IN-TRUCK ?auto_178687 ?auto_178690 ) ( TRUCK-AT ?auto_178690 ?auto_178688 ) ( IN-CITY ?auto_178688 ?auto_178689 ) ( IN-CITY ?auto_178684 ?auto_178689 ) ( not ( = ?auto_178684 ?auto_178688 ) ) ( OBJ-AT ?auto_178685 ?auto_178684 ) ( OBJ-AT ?auto_178686 ?auto_178684 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178685 ?auto_178687 ?auto_178684 )
      ( DELIVER-3PKG-VERIFY ?auto_178685 ?auto_178686 ?auto_178687 ?auto_178684 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178699 - OBJ
      ?auto_178700 - OBJ
      ?auto_178701 - OBJ
      ?auto_178698 - LOCATION
    )
    :vars
    (
      ?auto_178704 - TRUCK
      ?auto_178702 - LOCATION
      ?auto_178703 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_178700 ?auto_178699 ) ) ( not ( = ?auto_178701 ?auto_178699 ) ) ( not ( = ?auto_178701 ?auto_178700 ) ) ( IN-TRUCK ?auto_178700 ?auto_178704 ) ( TRUCK-AT ?auto_178704 ?auto_178702 ) ( IN-CITY ?auto_178702 ?auto_178703 ) ( IN-CITY ?auto_178698 ?auto_178703 ) ( not ( = ?auto_178698 ?auto_178702 ) ) ( OBJ-AT ?auto_178699 ?auto_178698 ) ( OBJ-AT ?auto_178701 ?auto_178698 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178699 ?auto_178700 ?auto_178698 )
      ( DELIVER-3PKG-VERIFY ?auto_178699 ?auto_178700 ?auto_178701 ?auto_178698 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178752 - OBJ
      ?auto_178753 - OBJ
      ?auto_178754 - OBJ
      ?auto_178751 - LOCATION
    )
    :vars
    (
      ?auto_178757 - TRUCK
      ?auto_178755 - LOCATION
      ?auto_178756 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_178753 ?auto_178752 ) ) ( not ( = ?auto_178754 ?auto_178752 ) ) ( not ( = ?auto_178754 ?auto_178753 ) ) ( IN-TRUCK ?auto_178752 ?auto_178757 ) ( TRUCK-AT ?auto_178757 ?auto_178755 ) ( IN-CITY ?auto_178755 ?auto_178756 ) ( IN-CITY ?auto_178751 ?auto_178756 ) ( not ( = ?auto_178751 ?auto_178755 ) ) ( OBJ-AT ?auto_178753 ?auto_178751 ) ( OBJ-AT ?auto_178754 ?auto_178751 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178753 ?auto_178752 ?auto_178751 )
      ( DELIVER-3PKG-VERIFY ?auto_178752 ?auto_178753 ?auto_178754 ?auto_178751 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179382 - OBJ
      ?auto_179383 - OBJ
      ?auto_179384 - OBJ
      ?auto_179381 - LOCATION
    )
    :vars
    (
      ?auto_179387 - TRUCK
      ?auto_179386 - LOCATION
      ?auto_179385 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_179383 ?auto_179382 ) ) ( not ( = ?auto_179384 ?auto_179382 ) ) ( not ( = ?auto_179384 ?auto_179383 ) ) ( TRUCK-AT ?auto_179387 ?auto_179386 ) ( IN-CITY ?auto_179386 ?auto_179385 ) ( IN-CITY ?auto_179381 ?auto_179385 ) ( not ( = ?auto_179381 ?auto_179386 ) ) ( OBJ-AT ?auto_179382 ?auto_179381 ) ( OBJ-AT ?auto_179384 ?auto_179386 ) ( OBJ-AT ?auto_179383 ?auto_179381 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179382 ?auto_179384 ?auto_179381 )
      ( DELIVER-3PKG-VERIFY ?auto_179382 ?auto_179383 ?auto_179384 ?auto_179381 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179396 - OBJ
      ?auto_179397 - OBJ
      ?auto_179398 - OBJ
      ?auto_179395 - LOCATION
    )
    :vars
    (
      ?auto_179401 - TRUCK
      ?auto_179400 - LOCATION
      ?auto_179399 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_179397 ?auto_179396 ) ) ( not ( = ?auto_179398 ?auto_179396 ) ) ( not ( = ?auto_179398 ?auto_179397 ) ) ( TRUCK-AT ?auto_179401 ?auto_179400 ) ( IN-CITY ?auto_179400 ?auto_179399 ) ( IN-CITY ?auto_179395 ?auto_179399 ) ( not ( = ?auto_179395 ?auto_179400 ) ) ( OBJ-AT ?auto_179396 ?auto_179395 ) ( OBJ-AT ?auto_179397 ?auto_179400 ) ( OBJ-AT ?auto_179398 ?auto_179395 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179396 ?auto_179397 ?auto_179395 )
      ( DELIVER-3PKG-VERIFY ?auto_179396 ?auto_179397 ?auto_179398 ?auto_179395 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179449 - OBJ
      ?auto_179450 - OBJ
      ?auto_179451 - OBJ
      ?auto_179448 - LOCATION
    )
    :vars
    (
      ?auto_179454 - TRUCK
      ?auto_179453 - LOCATION
      ?auto_179452 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_179450 ?auto_179449 ) ) ( not ( = ?auto_179451 ?auto_179449 ) ) ( not ( = ?auto_179451 ?auto_179450 ) ) ( TRUCK-AT ?auto_179454 ?auto_179453 ) ( IN-CITY ?auto_179453 ?auto_179452 ) ( IN-CITY ?auto_179448 ?auto_179452 ) ( not ( = ?auto_179448 ?auto_179453 ) ) ( OBJ-AT ?auto_179450 ?auto_179448 ) ( OBJ-AT ?auto_179449 ?auto_179453 ) ( OBJ-AT ?auto_179451 ?auto_179448 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179450 ?auto_179449 ?auto_179448 )
      ( DELIVER-3PKG-VERIFY ?auto_179449 ?auto_179450 ?auto_179451 ?auto_179448 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180079 - OBJ
      ?auto_180080 - OBJ
      ?auto_180081 - OBJ
      ?auto_180078 - LOCATION
    )
    :vars
    (
      ?auto_180082 - LOCATION
      ?auto_180084 - CITY
      ?auto_180083 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_180080 ?auto_180079 ) ) ( not ( = ?auto_180081 ?auto_180079 ) ) ( not ( = ?auto_180081 ?auto_180080 ) ) ( IN-CITY ?auto_180082 ?auto_180084 ) ( IN-CITY ?auto_180078 ?auto_180084 ) ( not ( = ?auto_180078 ?auto_180082 ) ) ( OBJ-AT ?auto_180079 ?auto_180078 ) ( OBJ-AT ?auto_180081 ?auto_180082 ) ( TRUCK-AT ?auto_180083 ?auto_180078 ) ( OBJ-AT ?auto_180080 ?auto_180078 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180079 ?auto_180081 ?auto_180078 )
      ( DELIVER-3PKG-VERIFY ?auto_180079 ?auto_180080 ?auto_180081 ?auto_180078 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180093 - OBJ
      ?auto_180094 - OBJ
      ?auto_180095 - OBJ
      ?auto_180092 - LOCATION
    )
    :vars
    (
      ?auto_180096 - LOCATION
      ?auto_180098 - CITY
      ?auto_180097 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_180094 ?auto_180093 ) ) ( not ( = ?auto_180095 ?auto_180093 ) ) ( not ( = ?auto_180095 ?auto_180094 ) ) ( IN-CITY ?auto_180096 ?auto_180098 ) ( IN-CITY ?auto_180092 ?auto_180098 ) ( not ( = ?auto_180092 ?auto_180096 ) ) ( OBJ-AT ?auto_180093 ?auto_180092 ) ( OBJ-AT ?auto_180094 ?auto_180096 ) ( TRUCK-AT ?auto_180097 ?auto_180092 ) ( OBJ-AT ?auto_180095 ?auto_180092 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180093 ?auto_180094 ?auto_180092 )
      ( DELIVER-3PKG-VERIFY ?auto_180093 ?auto_180094 ?auto_180095 ?auto_180092 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180146 - OBJ
      ?auto_180147 - OBJ
      ?auto_180148 - OBJ
      ?auto_180145 - LOCATION
    )
    :vars
    (
      ?auto_180149 - LOCATION
      ?auto_180151 - CITY
      ?auto_180150 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_180147 ?auto_180146 ) ) ( not ( = ?auto_180148 ?auto_180146 ) ) ( not ( = ?auto_180148 ?auto_180147 ) ) ( IN-CITY ?auto_180149 ?auto_180151 ) ( IN-CITY ?auto_180145 ?auto_180151 ) ( not ( = ?auto_180145 ?auto_180149 ) ) ( OBJ-AT ?auto_180147 ?auto_180145 ) ( OBJ-AT ?auto_180146 ?auto_180149 ) ( TRUCK-AT ?auto_180150 ?auto_180145 ) ( OBJ-AT ?auto_180148 ?auto_180145 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180147 ?auto_180146 ?auto_180145 )
      ( DELIVER-3PKG-VERIFY ?auto_180146 ?auto_180147 ?auto_180148 ?auto_180145 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_181442 - OBJ
      ?auto_181441 - LOCATION
    )
    :vars
    (
      ?auto_181445 - OBJ
      ?auto_181446 - LOCATION
      ?auto_181443 - CITY
      ?auto_181444 - TRUCK
      ?auto_181447 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_181442 ?auto_181445 ) ) ( IN-CITY ?auto_181446 ?auto_181443 ) ( IN-CITY ?auto_181441 ?auto_181443 ) ( not ( = ?auto_181441 ?auto_181446 ) ) ( OBJ-AT ?auto_181445 ?auto_181441 ) ( OBJ-AT ?auto_181442 ?auto_181446 ) ( TRUCK-AT ?auto_181444 ?auto_181447 ) ( IN-CITY ?auto_181447 ?auto_181443 ) ( not ( = ?auto_181441 ?auto_181447 ) ) ( not ( = ?auto_181446 ?auto_181447 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_181444 ?auto_181447 ?auto_181441 ?auto_181443 )
      ( DELIVER-2PKG ?auto_181445 ?auto_181442 ?auto_181441 )
      ( DELIVER-1PKG-VERIFY ?auto_181442 ?auto_181441 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_181449 - OBJ
      ?auto_181450 - OBJ
      ?auto_181448 - LOCATION
    )
    :vars
    (
      ?auto_181453 - LOCATION
      ?auto_181452 - CITY
      ?auto_181454 - TRUCK
      ?auto_181451 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_181450 ?auto_181449 ) ) ( IN-CITY ?auto_181453 ?auto_181452 ) ( IN-CITY ?auto_181448 ?auto_181452 ) ( not ( = ?auto_181448 ?auto_181453 ) ) ( OBJ-AT ?auto_181449 ?auto_181448 ) ( OBJ-AT ?auto_181450 ?auto_181453 ) ( TRUCK-AT ?auto_181454 ?auto_181451 ) ( IN-CITY ?auto_181451 ?auto_181452 ) ( not ( = ?auto_181448 ?auto_181451 ) ) ( not ( = ?auto_181453 ?auto_181451 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_181450 ?auto_181448 )
      ( DELIVER-2PKG-VERIFY ?auto_181449 ?auto_181450 ?auto_181448 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_181464 - OBJ
      ?auto_181465 - OBJ
      ?auto_181463 - LOCATION
    )
    :vars
    (
      ?auto_181467 - LOCATION
      ?auto_181468 - CITY
      ?auto_181466 - TRUCK
      ?auto_181469 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_181465 ?auto_181464 ) ) ( IN-CITY ?auto_181467 ?auto_181468 ) ( IN-CITY ?auto_181463 ?auto_181468 ) ( not ( = ?auto_181463 ?auto_181467 ) ) ( OBJ-AT ?auto_181465 ?auto_181463 ) ( OBJ-AT ?auto_181464 ?auto_181467 ) ( TRUCK-AT ?auto_181466 ?auto_181469 ) ( IN-CITY ?auto_181469 ?auto_181468 ) ( not ( = ?auto_181463 ?auto_181469 ) ) ( not ( = ?auto_181467 ?auto_181469 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181465 ?auto_181464 ?auto_181463 )
      ( DELIVER-2PKG-VERIFY ?auto_181464 ?auto_181465 ?auto_181463 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_188009 - OBJ
      ?auto_188010 - OBJ
      ?auto_188011 - OBJ
      ?auto_188012 - OBJ
      ?auto_188008 - LOCATION
    )
    :vars
    (
      ?auto_188013 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188010 ?auto_188009 ) ) ( not ( = ?auto_188011 ?auto_188009 ) ) ( not ( = ?auto_188011 ?auto_188010 ) ) ( not ( = ?auto_188012 ?auto_188009 ) ) ( not ( = ?auto_188012 ?auto_188010 ) ) ( not ( = ?auto_188012 ?auto_188011 ) ) ( TRUCK-AT ?auto_188013 ?auto_188008 ) ( IN-TRUCK ?auto_188012 ?auto_188013 ) ( OBJ-AT ?auto_188009 ?auto_188008 ) ( OBJ-AT ?auto_188010 ?auto_188008 ) ( OBJ-AT ?auto_188011 ?auto_188008 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_188012 ?auto_188008 )
      ( DELIVER-4PKG-VERIFY ?auto_188009 ?auto_188010 ?auto_188011 ?auto_188012 ?auto_188008 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_188027 - OBJ
      ?auto_188028 - OBJ
      ?auto_188029 - OBJ
      ?auto_188030 - OBJ
      ?auto_188026 - LOCATION
    )
    :vars
    (
      ?auto_188031 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188028 ?auto_188027 ) ) ( not ( = ?auto_188029 ?auto_188027 ) ) ( not ( = ?auto_188029 ?auto_188028 ) ) ( not ( = ?auto_188030 ?auto_188027 ) ) ( not ( = ?auto_188030 ?auto_188028 ) ) ( not ( = ?auto_188030 ?auto_188029 ) ) ( TRUCK-AT ?auto_188031 ?auto_188026 ) ( IN-TRUCK ?auto_188029 ?auto_188031 ) ( OBJ-AT ?auto_188027 ?auto_188026 ) ( OBJ-AT ?auto_188028 ?auto_188026 ) ( OBJ-AT ?auto_188030 ?auto_188026 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_188029 ?auto_188026 )
      ( DELIVER-4PKG-VERIFY ?auto_188027 ?auto_188028 ?auto_188029 ?auto_188030 ?auto_188026 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_188115 - OBJ
      ?auto_188116 - OBJ
      ?auto_188117 - OBJ
      ?auto_188118 - OBJ
      ?auto_188114 - LOCATION
    )
    :vars
    (
      ?auto_188119 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188116 ?auto_188115 ) ) ( not ( = ?auto_188117 ?auto_188115 ) ) ( not ( = ?auto_188117 ?auto_188116 ) ) ( not ( = ?auto_188118 ?auto_188115 ) ) ( not ( = ?auto_188118 ?auto_188116 ) ) ( not ( = ?auto_188118 ?auto_188117 ) ) ( TRUCK-AT ?auto_188119 ?auto_188114 ) ( IN-TRUCK ?auto_188116 ?auto_188119 ) ( OBJ-AT ?auto_188115 ?auto_188114 ) ( OBJ-AT ?auto_188117 ?auto_188114 ) ( OBJ-AT ?auto_188118 ?auto_188114 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_188116 ?auto_188114 )
      ( DELIVER-4PKG-VERIFY ?auto_188115 ?auto_188116 ?auto_188117 ?auto_188118 ?auto_188114 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_188642 - OBJ
      ?auto_188643 - OBJ
      ?auto_188644 - OBJ
      ?auto_188645 - OBJ
      ?auto_188641 - LOCATION
    )
    :vars
    (
      ?auto_188646 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188643 ?auto_188642 ) ) ( not ( = ?auto_188644 ?auto_188642 ) ) ( not ( = ?auto_188644 ?auto_188643 ) ) ( not ( = ?auto_188645 ?auto_188642 ) ) ( not ( = ?auto_188645 ?auto_188643 ) ) ( not ( = ?auto_188645 ?auto_188644 ) ) ( TRUCK-AT ?auto_188646 ?auto_188641 ) ( IN-TRUCK ?auto_188642 ?auto_188646 ) ( OBJ-AT ?auto_188643 ?auto_188641 ) ( OBJ-AT ?auto_188644 ?auto_188641 ) ( OBJ-AT ?auto_188645 ?auto_188641 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_188642 ?auto_188641 )
      ( DELIVER-4PKG-VERIFY ?auto_188642 ?auto_188643 ?auto_188644 ?auto_188645 ?auto_188641 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_189320 - OBJ
      ?auto_189321 - OBJ
      ?auto_189322 - OBJ
      ?auto_189323 - OBJ
      ?auto_189319 - LOCATION
    )
    :vars
    (
      ?auto_189324 - TRUCK
      ?auto_189326 - LOCATION
      ?auto_189325 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_189321 ?auto_189320 ) ) ( not ( = ?auto_189322 ?auto_189320 ) ) ( not ( = ?auto_189322 ?auto_189321 ) ) ( not ( = ?auto_189323 ?auto_189320 ) ) ( not ( = ?auto_189323 ?auto_189321 ) ) ( not ( = ?auto_189323 ?auto_189322 ) ) ( IN-TRUCK ?auto_189323 ?auto_189324 ) ( TRUCK-AT ?auto_189324 ?auto_189326 ) ( IN-CITY ?auto_189326 ?auto_189325 ) ( IN-CITY ?auto_189319 ?auto_189325 ) ( not ( = ?auto_189319 ?auto_189326 ) ) ( OBJ-AT ?auto_189320 ?auto_189319 ) ( OBJ-AT ?auto_189321 ?auto_189319 ) ( OBJ-AT ?auto_189322 ?auto_189319 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_189320 ?auto_189323 ?auto_189319 )
      ( DELIVER-4PKG-VERIFY ?auto_189320 ?auto_189321 ?auto_189322 ?auto_189323 ?auto_189319 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_189344 - OBJ
      ?auto_189345 - OBJ
      ?auto_189346 - OBJ
      ?auto_189347 - OBJ
      ?auto_189343 - LOCATION
    )
    :vars
    (
      ?auto_189348 - TRUCK
      ?auto_189350 - LOCATION
      ?auto_189349 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_189345 ?auto_189344 ) ) ( not ( = ?auto_189346 ?auto_189344 ) ) ( not ( = ?auto_189346 ?auto_189345 ) ) ( not ( = ?auto_189347 ?auto_189344 ) ) ( not ( = ?auto_189347 ?auto_189345 ) ) ( not ( = ?auto_189347 ?auto_189346 ) ) ( IN-TRUCK ?auto_189346 ?auto_189348 ) ( TRUCK-AT ?auto_189348 ?auto_189350 ) ( IN-CITY ?auto_189350 ?auto_189349 ) ( IN-CITY ?auto_189343 ?auto_189349 ) ( not ( = ?auto_189343 ?auto_189350 ) ) ( OBJ-AT ?auto_189344 ?auto_189343 ) ( OBJ-AT ?auto_189345 ?auto_189343 ) ( OBJ-AT ?auto_189347 ?auto_189343 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_189344 ?auto_189346 ?auto_189343 )
      ( DELIVER-4PKG-VERIFY ?auto_189344 ?auto_189345 ?auto_189346 ?auto_189347 ?auto_189343 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_189458 - OBJ
      ?auto_189459 - OBJ
      ?auto_189460 - OBJ
      ?auto_189461 - OBJ
      ?auto_189457 - LOCATION
    )
    :vars
    (
      ?auto_189462 - TRUCK
      ?auto_189464 - LOCATION
      ?auto_189463 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_189459 ?auto_189458 ) ) ( not ( = ?auto_189460 ?auto_189458 ) ) ( not ( = ?auto_189460 ?auto_189459 ) ) ( not ( = ?auto_189461 ?auto_189458 ) ) ( not ( = ?auto_189461 ?auto_189459 ) ) ( not ( = ?auto_189461 ?auto_189460 ) ) ( IN-TRUCK ?auto_189459 ?auto_189462 ) ( TRUCK-AT ?auto_189462 ?auto_189464 ) ( IN-CITY ?auto_189464 ?auto_189463 ) ( IN-CITY ?auto_189457 ?auto_189463 ) ( not ( = ?auto_189457 ?auto_189464 ) ) ( OBJ-AT ?auto_189458 ?auto_189457 ) ( OBJ-AT ?auto_189460 ?auto_189457 ) ( OBJ-AT ?auto_189461 ?auto_189457 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_189458 ?auto_189459 ?auto_189457 )
      ( DELIVER-4PKG-VERIFY ?auto_189458 ?auto_189459 ?auto_189460 ?auto_189461 ?auto_189457 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_190177 - OBJ
      ?auto_190178 - OBJ
      ?auto_190179 - OBJ
      ?auto_190180 - OBJ
      ?auto_190176 - LOCATION
    )
    :vars
    (
      ?auto_190181 - TRUCK
      ?auto_190183 - LOCATION
      ?auto_190182 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_190178 ?auto_190177 ) ) ( not ( = ?auto_190179 ?auto_190177 ) ) ( not ( = ?auto_190179 ?auto_190178 ) ) ( not ( = ?auto_190180 ?auto_190177 ) ) ( not ( = ?auto_190180 ?auto_190178 ) ) ( not ( = ?auto_190180 ?auto_190179 ) ) ( IN-TRUCK ?auto_190177 ?auto_190181 ) ( TRUCK-AT ?auto_190181 ?auto_190183 ) ( IN-CITY ?auto_190183 ?auto_190182 ) ( IN-CITY ?auto_190176 ?auto_190182 ) ( not ( = ?auto_190176 ?auto_190183 ) ) ( OBJ-AT ?auto_190178 ?auto_190176 ) ( OBJ-AT ?auto_190179 ?auto_190176 ) ( OBJ-AT ?auto_190180 ?auto_190176 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190178 ?auto_190177 ?auto_190176 )
      ( DELIVER-4PKG-VERIFY ?auto_190177 ?auto_190178 ?auto_190179 ?auto_190180 ?auto_190176 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_190989 - OBJ
      ?auto_190990 - OBJ
      ?auto_190991 - OBJ
      ?auto_190992 - OBJ
      ?auto_190988 - LOCATION
    )
    :vars
    (
      ?auto_190995 - TRUCK
      ?auto_190993 - LOCATION
      ?auto_190994 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_190990 ?auto_190989 ) ) ( not ( = ?auto_190991 ?auto_190989 ) ) ( not ( = ?auto_190991 ?auto_190990 ) ) ( not ( = ?auto_190992 ?auto_190989 ) ) ( not ( = ?auto_190992 ?auto_190990 ) ) ( not ( = ?auto_190992 ?auto_190991 ) ) ( TRUCK-AT ?auto_190995 ?auto_190993 ) ( IN-CITY ?auto_190993 ?auto_190994 ) ( IN-CITY ?auto_190988 ?auto_190994 ) ( not ( = ?auto_190988 ?auto_190993 ) ) ( OBJ-AT ?auto_190989 ?auto_190988 ) ( OBJ-AT ?auto_190992 ?auto_190993 ) ( OBJ-AT ?auto_190990 ?auto_190988 ) ( OBJ-AT ?auto_190991 ?auto_190988 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190989 ?auto_190992 ?auto_190988 )
      ( DELIVER-4PKG-VERIFY ?auto_190989 ?auto_190990 ?auto_190991 ?auto_190992 ?auto_190988 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191013 - OBJ
      ?auto_191014 - OBJ
      ?auto_191015 - OBJ
      ?auto_191016 - OBJ
      ?auto_191012 - LOCATION
    )
    :vars
    (
      ?auto_191019 - TRUCK
      ?auto_191017 - LOCATION
      ?auto_191018 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_191014 ?auto_191013 ) ) ( not ( = ?auto_191015 ?auto_191013 ) ) ( not ( = ?auto_191015 ?auto_191014 ) ) ( not ( = ?auto_191016 ?auto_191013 ) ) ( not ( = ?auto_191016 ?auto_191014 ) ) ( not ( = ?auto_191016 ?auto_191015 ) ) ( TRUCK-AT ?auto_191019 ?auto_191017 ) ( IN-CITY ?auto_191017 ?auto_191018 ) ( IN-CITY ?auto_191012 ?auto_191018 ) ( not ( = ?auto_191012 ?auto_191017 ) ) ( OBJ-AT ?auto_191013 ?auto_191012 ) ( OBJ-AT ?auto_191015 ?auto_191017 ) ( OBJ-AT ?auto_191014 ?auto_191012 ) ( OBJ-AT ?auto_191016 ?auto_191012 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191013 ?auto_191015 ?auto_191012 )
      ( DELIVER-4PKG-VERIFY ?auto_191013 ?auto_191014 ?auto_191015 ?auto_191016 ?auto_191012 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191127 - OBJ
      ?auto_191128 - OBJ
      ?auto_191129 - OBJ
      ?auto_191130 - OBJ
      ?auto_191126 - LOCATION
    )
    :vars
    (
      ?auto_191133 - TRUCK
      ?auto_191131 - LOCATION
      ?auto_191132 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_191128 ?auto_191127 ) ) ( not ( = ?auto_191129 ?auto_191127 ) ) ( not ( = ?auto_191129 ?auto_191128 ) ) ( not ( = ?auto_191130 ?auto_191127 ) ) ( not ( = ?auto_191130 ?auto_191128 ) ) ( not ( = ?auto_191130 ?auto_191129 ) ) ( TRUCK-AT ?auto_191133 ?auto_191131 ) ( IN-CITY ?auto_191131 ?auto_191132 ) ( IN-CITY ?auto_191126 ?auto_191132 ) ( not ( = ?auto_191126 ?auto_191131 ) ) ( OBJ-AT ?auto_191127 ?auto_191126 ) ( OBJ-AT ?auto_191128 ?auto_191131 ) ( OBJ-AT ?auto_191129 ?auto_191126 ) ( OBJ-AT ?auto_191130 ?auto_191126 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191127 ?auto_191128 ?auto_191126 )
      ( DELIVER-4PKG-VERIFY ?auto_191127 ?auto_191128 ?auto_191129 ?auto_191130 ?auto_191126 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191846 - OBJ
      ?auto_191847 - OBJ
      ?auto_191848 - OBJ
      ?auto_191849 - OBJ
      ?auto_191845 - LOCATION
    )
    :vars
    (
      ?auto_191852 - TRUCK
      ?auto_191850 - LOCATION
      ?auto_191851 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_191847 ?auto_191846 ) ) ( not ( = ?auto_191848 ?auto_191846 ) ) ( not ( = ?auto_191848 ?auto_191847 ) ) ( not ( = ?auto_191849 ?auto_191846 ) ) ( not ( = ?auto_191849 ?auto_191847 ) ) ( not ( = ?auto_191849 ?auto_191848 ) ) ( TRUCK-AT ?auto_191852 ?auto_191850 ) ( IN-CITY ?auto_191850 ?auto_191851 ) ( IN-CITY ?auto_191845 ?auto_191851 ) ( not ( = ?auto_191845 ?auto_191850 ) ) ( OBJ-AT ?auto_191847 ?auto_191845 ) ( OBJ-AT ?auto_191846 ?auto_191850 ) ( OBJ-AT ?auto_191848 ?auto_191845 ) ( OBJ-AT ?auto_191849 ?auto_191845 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191847 ?auto_191846 ?auto_191845 )
      ( DELIVER-4PKG-VERIFY ?auto_191846 ?auto_191847 ?auto_191848 ?auto_191849 ?auto_191845 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192658 - OBJ
      ?auto_192659 - OBJ
      ?auto_192660 - OBJ
      ?auto_192661 - OBJ
      ?auto_192657 - LOCATION
    )
    :vars
    (
      ?auto_192662 - LOCATION
      ?auto_192663 - CITY
      ?auto_192664 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192659 ?auto_192658 ) ) ( not ( = ?auto_192660 ?auto_192658 ) ) ( not ( = ?auto_192660 ?auto_192659 ) ) ( not ( = ?auto_192661 ?auto_192658 ) ) ( not ( = ?auto_192661 ?auto_192659 ) ) ( not ( = ?auto_192661 ?auto_192660 ) ) ( IN-CITY ?auto_192662 ?auto_192663 ) ( IN-CITY ?auto_192657 ?auto_192663 ) ( not ( = ?auto_192657 ?auto_192662 ) ) ( OBJ-AT ?auto_192658 ?auto_192657 ) ( OBJ-AT ?auto_192661 ?auto_192662 ) ( TRUCK-AT ?auto_192664 ?auto_192657 ) ( OBJ-AT ?auto_192659 ?auto_192657 ) ( OBJ-AT ?auto_192660 ?auto_192657 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192658 ?auto_192661 ?auto_192657 )
      ( DELIVER-4PKG-VERIFY ?auto_192658 ?auto_192659 ?auto_192660 ?auto_192661 ?auto_192657 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192682 - OBJ
      ?auto_192683 - OBJ
      ?auto_192684 - OBJ
      ?auto_192685 - OBJ
      ?auto_192681 - LOCATION
    )
    :vars
    (
      ?auto_192686 - LOCATION
      ?auto_192687 - CITY
      ?auto_192688 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192683 ?auto_192682 ) ) ( not ( = ?auto_192684 ?auto_192682 ) ) ( not ( = ?auto_192684 ?auto_192683 ) ) ( not ( = ?auto_192685 ?auto_192682 ) ) ( not ( = ?auto_192685 ?auto_192683 ) ) ( not ( = ?auto_192685 ?auto_192684 ) ) ( IN-CITY ?auto_192686 ?auto_192687 ) ( IN-CITY ?auto_192681 ?auto_192687 ) ( not ( = ?auto_192681 ?auto_192686 ) ) ( OBJ-AT ?auto_192682 ?auto_192681 ) ( OBJ-AT ?auto_192684 ?auto_192686 ) ( TRUCK-AT ?auto_192688 ?auto_192681 ) ( OBJ-AT ?auto_192683 ?auto_192681 ) ( OBJ-AT ?auto_192685 ?auto_192681 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192682 ?auto_192684 ?auto_192681 )
      ( DELIVER-4PKG-VERIFY ?auto_192682 ?auto_192683 ?auto_192684 ?auto_192685 ?auto_192681 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192796 - OBJ
      ?auto_192797 - OBJ
      ?auto_192798 - OBJ
      ?auto_192799 - OBJ
      ?auto_192795 - LOCATION
    )
    :vars
    (
      ?auto_192800 - LOCATION
      ?auto_192801 - CITY
      ?auto_192802 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192797 ?auto_192796 ) ) ( not ( = ?auto_192798 ?auto_192796 ) ) ( not ( = ?auto_192798 ?auto_192797 ) ) ( not ( = ?auto_192799 ?auto_192796 ) ) ( not ( = ?auto_192799 ?auto_192797 ) ) ( not ( = ?auto_192799 ?auto_192798 ) ) ( IN-CITY ?auto_192800 ?auto_192801 ) ( IN-CITY ?auto_192795 ?auto_192801 ) ( not ( = ?auto_192795 ?auto_192800 ) ) ( OBJ-AT ?auto_192796 ?auto_192795 ) ( OBJ-AT ?auto_192797 ?auto_192800 ) ( TRUCK-AT ?auto_192802 ?auto_192795 ) ( OBJ-AT ?auto_192798 ?auto_192795 ) ( OBJ-AT ?auto_192799 ?auto_192795 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192796 ?auto_192797 ?auto_192795 )
      ( DELIVER-4PKG-VERIFY ?auto_192796 ?auto_192797 ?auto_192798 ?auto_192799 ?auto_192795 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193515 - OBJ
      ?auto_193516 - OBJ
      ?auto_193517 - OBJ
      ?auto_193518 - OBJ
      ?auto_193514 - LOCATION
    )
    :vars
    (
      ?auto_193519 - LOCATION
      ?auto_193520 - CITY
      ?auto_193521 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_193516 ?auto_193515 ) ) ( not ( = ?auto_193517 ?auto_193515 ) ) ( not ( = ?auto_193517 ?auto_193516 ) ) ( not ( = ?auto_193518 ?auto_193515 ) ) ( not ( = ?auto_193518 ?auto_193516 ) ) ( not ( = ?auto_193518 ?auto_193517 ) ) ( IN-CITY ?auto_193519 ?auto_193520 ) ( IN-CITY ?auto_193514 ?auto_193520 ) ( not ( = ?auto_193514 ?auto_193519 ) ) ( OBJ-AT ?auto_193516 ?auto_193514 ) ( OBJ-AT ?auto_193515 ?auto_193519 ) ( TRUCK-AT ?auto_193521 ?auto_193514 ) ( OBJ-AT ?auto_193517 ?auto_193514 ) ( OBJ-AT ?auto_193518 ?auto_193514 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_193516 ?auto_193515 ?auto_193514 )
      ( DELIVER-4PKG-VERIFY ?auto_193515 ?auto_193516 ?auto_193517 ?auto_193518 ?auto_193514 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_195810 - OBJ
      ?auto_195811 - OBJ
      ?auto_195812 - OBJ
      ?auto_195809 - LOCATION
    )
    :vars
    (
      ?auto_195815 - LOCATION
      ?auto_195816 - CITY
      ?auto_195814 - TRUCK
      ?auto_195813 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_195811 ?auto_195810 ) ) ( not ( = ?auto_195812 ?auto_195810 ) ) ( not ( = ?auto_195812 ?auto_195811 ) ) ( IN-CITY ?auto_195815 ?auto_195816 ) ( IN-CITY ?auto_195809 ?auto_195816 ) ( not ( = ?auto_195809 ?auto_195815 ) ) ( OBJ-AT ?auto_195810 ?auto_195809 ) ( OBJ-AT ?auto_195812 ?auto_195815 ) ( TRUCK-AT ?auto_195814 ?auto_195813 ) ( IN-CITY ?auto_195813 ?auto_195816 ) ( not ( = ?auto_195809 ?auto_195813 ) ) ( not ( = ?auto_195815 ?auto_195813 ) ) ( OBJ-AT ?auto_195811 ?auto_195809 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195810 ?auto_195812 ?auto_195809 )
      ( DELIVER-3PKG-VERIFY ?auto_195810 ?auto_195811 ?auto_195812 ?auto_195809 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_195834 - OBJ
      ?auto_195835 - OBJ
      ?auto_195836 - OBJ
      ?auto_195833 - LOCATION
    )
    :vars
    (
      ?auto_195839 - LOCATION
      ?auto_195840 - CITY
      ?auto_195838 - TRUCK
      ?auto_195837 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_195835 ?auto_195834 ) ) ( not ( = ?auto_195836 ?auto_195834 ) ) ( not ( = ?auto_195836 ?auto_195835 ) ) ( IN-CITY ?auto_195839 ?auto_195840 ) ( IN-CITY ?auto_195833 ?auto_195840 ) ( not ( = ?auto_195833 ?auto_195839 ) ) ( OBJ-AT ?auto_195834 ?auto_195833 ) ( OBJ-AT ?auto_195835 ?auto_195839 ) ( TRUCK-AT ?auto_195838 ?auto_195837 ) ( IN-CITY ?auto_195837 ?auto_195840 ) ( not ( = ?auto_195833 ?auto_195837 ) ) ( not ( = ?auto_195839 ?auto_195837 ) ) ( OBJ-AT ?auto_195836 ?auto_195833 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195834 ?auto_195835 ?auto_195833 )
      ( DELIVER-3PKG-VERIFY ?auto_195834 ?auto_195835 ?auto_195836 ?auto_195833 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_195980 - OBJ
      ?auto_195981 - OBJ
      ?auto_195982 - OBJ
      ?auto_195979 - LOCATION
    )
    :vars
    (
      ?auto_195985 - LOCATION
      ?auto_195986 - CITY
      ?auto_195984 - TRUCK
      ?auto_195983 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_195981 ?auto_195980 ) ) ( not ( = ?auto_195982 ?auto_195980 ) ) ( not ( = ?auto_195982 ?auto_195981 ) ) ( IN-CITY ?auto_195985 ?auto_195986 ) ( IN-CITY ?auto_195979 ?auto_195986 ) ( not ( = ?auto_195979 ?auto_195985 ) ) ( OBJ-AT ?auto_195981 ?auto_195979 ) ( OBJ-AT ?auto_195980 ?auto_195985 ) ( TRUCK-AT ?auto_195984 ?auto_195983 ) ( IN-CITY ?auto_195983 ?auto_195986 ) ( not ( = ?auto_195979 ?auto_195983 ) ) ( not ( = ?auto_195985 ?auto_195983 ) ) ( OBJ-AT ?auto_195982 ?auto_195979 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195981 ?auto_195980 ?auto_195979 )
      ( DELIVER-3PKG-VERIFY ?auto_195980 ?auto_195981 ?auto_195982 ?auto_195979 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_210838 - OBJ
      ?auto_210837 - LOCATION
    )
    :vars
    (
      ?auto_210841 - OBJ
      ?auto_210839 - LOCATION
      ?auto_210842 - CITY
      ?auto_210840 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_210838 ?auto_210841 ) ) ( IN-CITY ?auto_210839 ?auto_210842 ) ( IN-CITY ?auto_210837 ?auto_210842 ) ( not ( = ?auto_210837 ?auto_210839 ) ) ( OBJ-AT ?auto_210838 ?auto_210839 ) ( IN-TRUCK ?auto_210841 ?auto_210840 ) ( TRUCK-AT ?auto_210840 ?auto_210839 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_210840 ?auto_210839 ?auto_210837 ?auto_210842 )
      ( DELIVER-2PKG ?auto_210841 ?auto_210838 ?auto_210837 )
      ( DELIVER-1PKG-VERIFY ?auto_210838 ?auto_210837 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_210844 - OBJ
      ?auto_210845 - OBJ
      ?auto_210843 - LOCATION
    )
    :vars
    (
      ?auto_210848 - LOCATION
      ?auto_210846 - CITY
      ?auto_210847 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_210845 ?auto_210844 ) ) ( IN-CITY ?auto_210848 ?auto_210846 ) ( IN-CITY ?auto_210843 ?auto_210846 ) ( not ( = ?auto_210843 ?auto_210848 ) ) ( OBJ-AT ?auto_210845 ?auto_210848 ) ( IN-TRUCK ?auto_210844 ?auto_210847 ) ( TRUCK-AT ?auto_210847 ?auto_210848 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_210845 ?auto_210843 )
      ( DELIVER-2PKG-VERIFY ?auto_210844 ?auto_210845 ?auto_210843 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_210864 - OBJ
      ?auto_210865 - OBJ
      ?auto_210863 - LOCATION
    )
    :vars
    (
      ?auto_210867 - LOCATION
      ?auto_210868 - CITY
      ?auto_210866 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_210865 ?auto_210864 ) ) ( IN-CITY ?auto_210867 ?auto_210868 ) ( IN-CITY ?auto_210863 ?auto_210868 ) ( not ( = ?auto_210863 ?auto_210867 ) ) ( OBJ-AT ?auto_210864 ?auto_210867 ) ( IN-TRUCK ?auto_210865 ?auto_210866 ) ( TRUCK-AT ?auto_210866 ?auto_210867 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_210865 ?auto_210864 ?auto_210863 )
      ( DELIVER-2PKG-VERIFY ?auto_210864 ?auto_210865 ?auto_210863 ) )
  )

)

