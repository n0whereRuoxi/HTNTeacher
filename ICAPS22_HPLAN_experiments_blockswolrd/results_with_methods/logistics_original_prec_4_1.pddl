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
      ?auto_61029 - OBJ
      ?auto_61028 - LOCATION
    )
    :vars
    (
      ?auto_61030 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_61030 ?auto_61028 ) ( IN-TRUCK ?auto_61029 ?auto_61030 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_61029 ?auto_61030 ?auto_61028 )
      ( DELIVER-1PKG-VERIFY ?auto_61029 ?auto_61028 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_61047 - OBJ
      ?auto_61046 - LOCATION
    )
    :vars
    (
      ?auto_61048 - TRUCK
      ?auto_61049 - LOCATION
      ?auto_61050 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_61047 ?auto_61048 ) ( TRUCK-AT ?auto_61048 ?auto_61049 ) ( IN-CITY ?auto_61049 ?auto_61050 ) ( IN-CITY ?auto_61046 ?auto_61050 ) ( not ( = ?auto_61046 ?auto_61049 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_61048 ?auto_61049 ?auto_61046 ?auto_61050 )
      ( DELIVER-1PKG ?auto_61047 ?auto_61046 )
      ( DELIVER-1PKG-VERIFY ?auto_61047 ?auto_61046 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_61073 - OBJ
      ?auto_61072 - LOCATION
    )
    :vars
    (
      ?auto_61074 - TRUCK
      ?auto_61076 - LOCATION
      ?auto_61075 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_61074 ?auto_61076 ) ( IN-CITY ?auto_61076 ?auto_61075 ) ( IN-CITY ?auto_61072 ?auto_61075 ) ( not ( = ?auto_61072 ?auto_61076 ) ) ( OBJ-AT ?auto_61073 ?auto_61076 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_61073 ?auto_61074 ?auto_61076 )
      ( DELIVER-1PKG ?auto_61073 ?auto_61072 )
      ( DELIVER-1PKG-VERIFY ?auto_61073 ?auto_61072 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_61099 - OBJ
      ?auto_61098 - LOCATION
    )
    :vars
    (
      ?auto_61102 - LOCATION
      ?auto_61101 - CITY
      ?auto_61100 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61102 ?auto_61101 ) ( IN-CITY ?auto_61098 ?auto_61101 ) ( not ( = ?auto_61098 ?auto_61102 ) ) ( OBJ-AT ?auto_61099 ?auto_61102 ) ( TRUCK-AT ?auto_61100 ?auto_61098 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_61100 ?auto_61098 ?auto_61102 ?auto_61101 )
      ( DELIVER-1PKG ?auto_61099 ?auto_61098 )
      ( DELIVER-1PKG-VERIFY ?auto_61099 ?auto_61098 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_61239 - OBJ
      ?auto_61238 - LOCATION
    )
    :vars
    (
      ?auto_61240 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_61240 ?auto_61238 ) ( IN-TRUCK ?auto_61239 ?auto_61240 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_61239 ?auto_61240 ?auto_61238 )
      ( DELIVER-1PKG-VERIFY ?auto_61239 ?auto_61238 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_61242 - OBJ
      ?auto_61243 - OBJ
      ?auto_61241 - LOCATION
    )
    :vars
    (
      ?auto_61244 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_61243 ?auto_61242 ) ) ( TRUCK-AT ?auto_61244 ?auto_61241 ) ( IN-TRUCK ?auto_61243 ?auto_61244 ) ( OBJ-AT ?auto_61242 ?auto_61241 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_61243 ?auto_61241 )
      ( DELIVER-2PKG-VERIFY ?auto_61242 ?auto_61243 ?auto_61241 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_61246 - OBJ
      ?auto_61247 - OBJ
      ?auto_61245 - LOCATION
    )
    :vars
    (
      ?auto_61248 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_61247 ?auto_61246 ) ) ( TRUCK-AT ?auto_61248 ?auto_61245 ) ( IN-TRUCK ?auto_61246 ?auto_61248 ) ( OBJ-AT ?auto_61247 ?auto_61245 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_61246 ?auto_61245 )
      ( DELIVER-2PKG-VERIFY ?auto_61246 ?auto_61247 ?auto_61245 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_61379 - OBJ
      ?auto_61378 - LOCATION
    )
    :vars
    (
      ?auto_61380 - TRUCK
      ?auto_61381 - LOCATION
      ?auto_61382 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_61379 ?auto_61380 ) ( TRUCK-AT ?auto_61380 ?auto_61381 ) ( IN-CITY ?auto_61381 ?auto_61382 ) ( IN-CITY ?auto_61378 ?auto_61382 ) ( not ( = ?auto_61378 ?auto_61381 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_61380 ?auto_61381 ?auto_61378 ?auto_61382 )
      ( DELIVER-1PKG ?auto_61379 ?auto_61378 )
      ( DELIVER-1PKG-VERIFY ?auto_61379 ?auto_61378 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_61384 - OBJ
      ?auto_61385 - OBJ
      ?auto_61383 - LOCATION
    )
    :vars
    (
      ?auto_61387 - TRUCK
      ?auto_61386 - LOCATION
      ?auto_61388 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_61385 ?auto_61384 ) ) ( IN-TRUCK ?auto_61385 ?auto_61387 ) ( TRUCK-AT ?auto_61387 ?auto_61386 ) ( IN-CITY ?auto_61386 ?auto_61388 ) ( IN-CITY ?auto_61383 ?auto_61388 ) ( not ( = ?auto_61383 ?auto_61386 ) ) ( OBJ-AT ?auto_61384 ?auto_61383 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_61385 ?auto_61383 )
      ( DELIVER-2PKG-VERIFY ?auto_61384 ?auto_61385 ?auto_61383 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_61390 - OBJ
      ?auto_61391 - OBJ
      ?auto_61389 - LOCATION
    )
    :vars
    (
      ?auto_61392 - TRUCK
      ?auto_61393 - LOCATION
      ?auto_61394 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_61391 ?auto_61390 ) ) ( IN-TRUCK ?auto_61390 ?auto_61392 ) ( TRUCK-AT ?auto_61392 ?auto_61393 ) ( IN-CITY ?auto_61393 ?auto_61394 ) ( IN-CITY ?auto_61389 ?auto_61394 ) ( not ( = ?auto_61389 ?auto_61393 ) ) ( OBJ-AT ?auto_61391 ?auto_61389 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61391 ?auto_61390 ?auto_61389 )
      ( DELIVER-2PKG-VERIFY ?auto_61390 ?auto_61391 ?auto_61389 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_61574 - OBJ
      ?auto_61573 - LOCATION
    )
    :vars
    (
      ?auto_61576 - OBJ
      ?auto_61575 - TRUCK
      ?auto_61577 - LOCATION
      ?auto_61578 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_61574 ?auto_61576 ) ) ( TRUCK-AT ?auto_61575 ?auto_61577 ) ( IN-CITY ?auto_61577 ?auto_61578 ) ( IN-CITY ?auto_61573 ?auto_61578 ) ( not ( = ?auto_61573 ?auto_61577 ) ) ( OBJ-AT ?auto_61576 ?auto_61573 ) ( OBJ-AT ?auto_61574 ?auto_61577 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_61574 ?auto_61575 ?auto_61577 )
      ( DELIVER-2PKG ?auto_61576 ?auto_61574 ?auto_61573 )
      ( DELIVER-1PKG-VERIFY ?auto_61574 ?auto_61573 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_61580 - OBJ
      ?auto_61581 - OBJ
      ?auto_61579 - LOCATION
    )
    :vars
    (
      ?auto_61583 - TRUCK
      ?auto_61582 - LOCATION
      ?auto_61584 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_61581 ?auto_61580 ) ) ( TRUCK-AT ?auto_61583 ?auto_61582 ) ( IN-CITY ?auto_61582 ?auto_61584 ) ( IN-CITY ?auto_61579 ?auto_61584 ) ( not ( = ?auto_61579 ?auto_61582 ) ) ( OBJ-AT ?auto_61580 ?auto_61579 ) ( OBJ-AT ?auto_61581 ?auto_61582 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_61581 ?auto_61579 )
      ( DELIVER-2PKG-VERIFY ?auto_61580 ?auto_61581 ?auto_61579 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_61586 - OBJ
      ?auto_61587 - OBJ
      ?auto_61585 - LOCATION
    )
    :vars
    (
      ?auto_61588 - TRUCK
      ?auto_61590 - LOCATION
      ?auto_61589 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_61587 ?auto_61586 ) ) ( TRUCK-AT ?auto_61588 ?auto_61590 ) ( IN-CITY ?auto_61590 ?auto_61589 ) ( IN-CITY ?auto_61585 ?auto_61589 ) ( not ( = ?auto_61585 ?auto_61590 ) ) ( OBJ-AT ?auto_61587 ?auto_61585 ) ( OBJ-AT ?auto_61586 ?auto_61590 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61587 ?auto_61586 ?auto_61585 )
      ( DELIVER-2PKG-VERIFY ?auto_61586 ?auto_61587 ?auto_61585 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_61770 - OBJ
      ?auto_61769 - LOCATION
    )
    :vars
    (
      ?auto_61774 - OBJ
      ?auto_61773 - LOCATION
      ?auto_61772 - CITY
      ?auto_61771 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_61770 ?auto_61774 ) ) ( IN-CITY ?auto_61773 ?auto_61772 ) ( IN-CITY ?auto_61769 ?auto_61772 ) ( not ( = ?auto_61769 ?auto_61773 ) ) ( OBJ-AT ?auto_61774 ?auto_61769 ) ( OBJ-AT ?auto_61770 ?auto_61773 ) ( TRUCK-AT ?auto_61771 ?auto_61769 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_61771 ?auto_61769 ?auto_61773 ?auto_61772 )
      ( DELIVER-2PKG ?auto_61774 ?auto_61770 ?auto_61769 )
      ( DELIVER-1PKG-VERIFY ?auto_61770 ?auto_61769 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_61776 - OBJ
      ?auto_61777 - OBJ
      ?auto_61775 - LOCATION
    )
    :vars
    (
      ?auto_61778 - LOCATION
      ?auto_61779 - CITY
      ?auto_61780 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_61777 ?auto_61776 ) ) ( IN-CITY ?auto_61778 ?auto_61779 ) ( IN-CITY ?auto_61775 ?auto_61779 ) ( not ( = ?auto_61775 ?auto_61778 ) ) ( OBJ-AT ?auto_61776 ?auto_61775 ) ( OBJ-AT ?auto_61777 ?auto_61778 ) ( TRUCK-AT ?auto_61780 ?auto_61775 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_61777 ?auto_61775 )
      ( DELIVER-2PKG-VERIFY ?auto_61776 ?auto_61777 ?auto_61775 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_61782 - OBJ
      ?auto_61783 - OBJ
      ?auto_61781 - LOCATION
    )
    :vars
    (
      ?auto_61786 - LOCATION
      ?auto_61785 - CITY
      ?auto_61784 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_61783 ?auto_61782 ) ) ( IN-CITY ?auto_61786 ?auto_61785 ) ( IN-CITY ?auto_61781 ?auto_61785 ) ( not ( = ?auto_61781 ?auto_61786 ) ) ( OBJ-AT ?auto_61783 ?auto_61781 ) ( OBJ-AT ?auto_61782 ?auto_61786 ) ( TRUCK-AT ?auto_61784 ?auto_61781 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61783 ?auto_61782 ?auto_61781 )
      ( DELIVER-2PKG-VERIFY ?auto_61782 ?auto_61783 ?auto_61781 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_61966 - OBJ
      ?auto_61965 - LOCATION
    )
    :vars
    (
      ?auto_61970 - OBJ
      ?auto_61969 - LOCATION
      ?auto_61968 - CITY
      ?auto_61967 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_61966 ?auto_61970 ) ) ( IN-CITY ?auto_61969 ?auto_61968 ) ( IN-CITY ?auto_61965 ?auto_61968 ) ( not ( = ?auto_61965 ?auto_61969 ) ) ( OBJ-AT ?auto_61966 ?auto_61969 ) ( TRUCK-AT ?auto_61967 ?auto_61965 ) ( IN-TRUCK ?auto_61970 ?auto_61967 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_61970 ?auto_61965 )
      ( DELIVER-2PKG ?auto_61970 ?auto_61966 ?auto_61965 )
      ( DELIVER-1PKG-VERIFY ?auto_61966 ?auto_61965 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_61972 - OBJ
      ?auto_61973 - OBJ
      ?auto_61971 - LOCATION
    )
    :vars
    (
      ?auto_61975 - LOCATION
      ?auto_61976 - CITY
      ?auto_61974 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_61973 ?auto_61972 ) ) ( IN-CITY ?auto_61975 ?auto_61976 ) ( IN-CITY ?auto_61971 ?auto_61976 ) ( not ( = ?auto_61971 ?auto_61975 ) ) ( OBJ-AT ?auto_61973 ?auto_61975 ) ( TRUCK-AT ?auto_61974 ?auto_61971 ) ( IN-TRUCK ?auto_61972 ?auto_61974 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_61973 ?auto_61971 )
      ( DELIVER-2PKG-VERIFY ?auto_61972 ?auto_61973 ?auto_61971 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_61978 - OBJ
      ?auto_61979 - OBJ
      ?auto_61977 - LOCATION
    )
    :vars
    (
      ?auto_61980 - LOCATION
      ?auto_61982 - CITY
      ?auto_61981 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_61979 ?auto_61978 ) ) ( IN-CITY ?auto_61980 ?auto_61982 ) ( IN-CITY ?auto_61977 ?auto_61982 ) ( not ( = ?auto_61977 ?auto_61980 ) ) ( OBJ-AT ?auto_61978 ?auto_61980 ) ( TRUCK-AT ?auto_61981 ?auto_61977 ) ( IN-TRUCK ?auto_61979 ?auto_61981 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61979 ?auto_61978 ?auto_61977 )
      ( DELIVER-2PKG-VERIFY ?auto_61978 ?auto_61979 ?auto_61977 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_62162 - OBJ
      ?auto_62161 - LOCATION
    )
    :vars
    (
      ?auto_62166 - OBJ
      ?auto_62163 - LOCATION
      ?auto_62165 - CITY
      ?auto_62164 - TRUCK
      ?auto_62167 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_62162 ?auto_62166 ) ) ( IN-CITY ?auto_62163 ?auto_62165 ) ( IN-CITY ?auto_62161 ?auto_62165 ) ( not ( = ?auto_62161 ?auto_62163 ) ) ( OBJ-AT ?auto_62162 ?auto_62163 ) ( IN-TRUCK ?auto_62166 ?auto_62164 ) ( TRUCK-AT ?auto_62164 ?auto_62167 ) ( IN-CITY ?auto_62167 ?auto_62165 ) ( not ( = ?auto_62161 ?auto_62167 ) ) ( not ( = ?auto_62163 ?auto_62167 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_62164 ?auto_62167 ?auto_62161 ?auto_62165 )
      ( DELIVER-2PKG ?auto_62166 ?auto_62162 ?auto_62161 )
      ( DELIVER-1PKG-VERIFY ?auto_62162 ?auto_62161 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_62169 - OBJ
      ?auto_62170 - OBJ
      ?auto_62168 - LOCATION
    )
    :vars
    (
      ?auto_62172 - LOCATION
      ?auto_62174 - CITY
      ?auto_62173 - TRUCK
      ?auto_62171 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_62170 ?auto_62169 ) ) ( IN-CITY ?auto_62172 ?auto_62174 ) ( IN-CITY ?auto_62168 ?auto_62174 ) ( not ( = ?auto_62168 ?auto_62172 ) ) ( OBJ-AT ?auto_62170 ?auto_62172 ) ( IN-TRUCK ?auto_62169 ?auto_62173 ) ( TRUCK-AT ?auto_62173 ?auto_62171 ) ( IN-CITY ?auto_62171 ?auto_62174 ) ( not ( = ?auto_62168 ?auto_62171 ) ) ( not ( = ?auto_62172 ?auto_62171 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_62170 ?auto_62168 )
      ( DELIVER-2PKG-VERIFY ?auto_62169 ?auto_62170 ?auto_62168 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_62176 - OBJ
      ?auto_62177 - OBJ
      ?auto_62175 - LOCATION
    )
    :vars
    (
      ?auto_62180 - LOCATION
      ?auto_62178 - CITY
      ?auto_62179 - TRUCK
      ?auto_62181 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_62177 ?auto_62176 ) ) ( IN-CITY ?auto_62180 ?auto_62178 ) ( IN-CITY ?auto_62175 ?auto_62178 ) ( not ( = ?auto_62175 ?auto_62180 ) ) ( OBJ-AT ?auto_62176 ?auto_62180 ) ( IN-TRUCK ?auto_62177 ?auto_62179 ) ( TRUCK-AT ?auto_62179 ?auto_62181 ) ( IN-CITY ?auto_62181 ?auto_62178 ) ( not ( = ?auto_62175 ?auto_62181 ) ) ( not ( = ?auto_62180 ?auto_62181 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_62177 ?auto_62176 ?auto_62175 )
      ( DELIVER-2PKG-VERIFY ?auto_62176 ?auto_62177 ?auto_62175 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_62384 - OBJ
      ?auto_62383 - LOCATION
    )
    :vars
    (
      ?auto_62387 - OBJ
      ?auto_62388 - LOCATION
      ?auto_62385 - CITY
      ?auto_62386 - TRUCK
      ?auto_62389 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_62384 ?auto_62387 ) ) ( IN-CITY ?auto_62388 ?auto_62385 ) ( IN-CITY ?auto_62383 ?auto_62385 ) ( not ( = ?auto_62383 ?auto_62388 ) ) ( OBJ-AT ?auto_62384 ?auto_62388 ) ( TRUCK-AT ?auto_62386 ?auto_62389 ) ( IN-CITY ?auto_62389 ?auto_62385 ) ( not ( = ?auto_62383 ?auto_62389 ) ) ( not ( = ?auto_62388 ?auto_62389 ) ) ( OBJ-AT ?auto_62387 ?auto_62389 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_62387 ?auto_62386 ?auto_62389 )
      ( DELIVER-2PKG ?auto_62387 ?auto_62384 ?auto_62383 )
      ( DELIVER-1PKG-VERIFY ?auto_62384 ?auto_62383 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_62391 - OBJ
      ?auto_62392 - OBJ
      ?auto_62390 - LOCATION
    )
    :vars
    (
      ?auto_62396 - LOCATION
      ?auto_62395 - CITY
      ?auto_62393 - TRUCK
      ?auto_62394 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_62392 ?auto_62391 ) ) ( IN-CITY ?auto_62396 ?auto_62395 ) ( IN-CITY ?auto_62390 ?auto_62395 ) ( not ( = ?auto_62390 ?auto_62396 ) ) ( OBJ-AT ?auto_62392 ?auto_62396 ) ( TRUCK-AT ?auto_62393 ?auto_62394 ) ( IN-CITY ?auto_62394 ?auto_62395 ) ( not ( = ?auto_62390 ?auto_62394 ) ) ( not ( = ?auto_62396 ?auto_62394 ) ) ( OBJ-AT ?auto_62391 ?auto_62394 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_62392 ?auto_62390 )
      ( DELIVER-2PKG-VERIFY ?auto_62391 ?auto_62392 ?auto_62390 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_62398 - OBJ
      ?auto_62399 - OBJ
      ?auto_62397 - LOCATION
    )
    :vars
    (
      ?auto_62402 - LOCATION
      ?auto_62401 - CITY
      ?auto_62400 - TRUCK
      ?auto_62403 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_62399 ?auto_62398 ) ) ( IN-CITY ?auto_62402 ?auto_62401 ) ( IN-CITY ?auto_62397 ?auto_62401 ) ( not ( = ?auto_62397 ?auto_62402 ) ) ( OBJ-AT ?auto_62398 ?auto_62402 ) ( TRUCK-AT ?auto_62400 ?auto_62403 ) ( IN-CITY ?auto_62403 ?auto_62401 ) ( not ( = ?auto_62397 ?auto_62403 ) ) ( not ( = ?auto_62402 ?auto_62403 ) ) ( OBJ-AT ?auto_62399 ?auto_62403 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_62399 ?auto_62398 ?auto_62397 )
      ( DELIVER-2PKG-VERIFY ?auto_62398 ?auto_62399 ?auto_62397 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_62606 - OBJ
      ?auto_62605 - LOCATION
    )
    :vars
    (
      ?auto_62611 - OBJ
      ?auto_62609 - LOCATION
      ?auto_62608 - CITY
      ?auto_62610 - LOCATION
      ?auto_62607 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_62606 ?auto_62611 ) ) ( IN-CITY ?auto_62609 ?auto_62608 ) ( IN-CITY ?auto_62605 ?auto_62608 ) ( not ( = ?auto_62605 ?auto_62609 ) ) ( OBJ-AT ?auto_62606 ?auto_62609 ) ( IN-CITY ?auto_62610 ?auto_62608 ) ( not ( = ?auto_62605 ?auto_62610 ) ) ( not ( = ?auto_62609 ?auto_62610 ) ) ( OBJ-AT ?auto_62611 ?auto_62610 ) ( TRUCK-AT ?auto_62607 ?auto_62605 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_62607 ?auto_62605 ?auto_62610 ?auto_62608 )
      ( DELIVER-2PKG ?auto_62611 ?auto_62606 ?auto_62605 )
      ( DELIVER-1PKG-VERIFY ?auto_62606 ?auto_62605 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_62613 - OBJ
      ?auto_62614 - OBJ
      ?auto_62612 - LOCATION
    )
    :vars
    (
      ?auto_62616 - LOCATION
      ?auto_62618 - CITY
      ?auto_62615 - LOCATION
      ?auto_62617 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_62614 ?auto_62613 ) ) ( IN-CITY ?auto_62616 ?auto_62618 ) ( IN-CITY ?auto_62612 ?auto_62618 ) ( not ( = ?auto_62612 ?auto_62616 ) ) ( OBJ-AT ?auto_62614 ?auto_62616 ) ( IN-CITY ?auto_62615 ?auto_62618 ) ( not ( = ?auto_62612 ?auto_62615 ) ) ( not ( = ?auto_62616 ?auto_62615 ) ) ( OBJ-AT ?auto_62613 ?auto_62615 ) ( TRUCK-AT ?auto_62617 ?auto_62612 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_62614 ?auto_62612 )
      ( DELIVER-2PKG-VERIFY ?auto_62613 ?auto_62614 ?auto_62612 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_62620 - OBJ
      ?auto_62621 - OBJ
      ?auto_62619 - LOCATION
    )
    :vars
    (
      ?auto_62625 - LOCATION
      ?auto_62622 - CITY
      ?auto_62624 - LOCATION
      ?auto_62623 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_62621 ?auto_62620 ) ) ( IN-CITY ?auto_62625 ?auto_62622 ) ( IN-CITY ?auto_62619 ?auto_62622 ) ( not ( = ?auto_62619 ?auto_62625 ) ) ( OBJ-AT ?auto_62620 ?auto_62625 ) ( IN-CITY ?auto_62624 ?auto_62622 ) ( not ( = ?auto_62619 ?auto_62624 ) ) ( not ( = ?auto_62625 ?auto_62624 ) ) ( OBJ-AT ?auto_62621 ?auto_62624 ) ( TRUCK-AT ?auto_62623 ?auto_62619 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_62621 ?auto_62620 ?auto_62619 )
      ( DELIVER-2PKG-VERIFY ?auto_62620 ?auto_62621 ?auto_62619 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_63246 - OBJ
      ?auto_63245 - LOCATION
    )
    :vars
    (
      ?auto_63247 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_63247 ?auto_63245 ) ( IN-TRUCK ?auto_63246 ?auto_63247 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_63246 ?auto_63247 ?auto_63245 )
      ( DELIVER-1PKG-VERIFY ?auto_63246 ?auto_63245 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_63249 - OBJ
      ?auto_63250 - OBJ
      ?auto_63248 - LOCATION
    )
    :vars
    (
      ?auto_63251 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_63250 ?auto_63249 ) ) ( TRUCK-AT ?auto_63251 ?auto_63248 ) ( IN-TRUCK ?auto_63250 ?auto_63251 ) ( OBJ-AT ?auto_63249 ?auto_63248 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_63250 ?auto_63248 )
      ( DELIVER-2PKG-VERIFY ?auto_63249 ?auto_63250 ?auto_63248 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_63253 - OBJ
      ?auto_63254 - OBJ
      ?auto_63252 - LOCATION
    )
    :vars
    (
      ?auto_63255 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_63254 ?auto_63253 ) ) ( TRUCK-AT ?auto_63255 ?auto_63252 ) ( IN-TRUCK ?auto_63254 ?auto_63255 ) ( OBJ-AT ?auto_63253 ?auto_63252 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_63254 ?auto_63252 )
      ( DELIVER-2PKG-VERIFY ?auto_63253 ?auto_63254 ?auto_63252 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_63257 - OBJ
      ?auto_63258 - OBJ
      ?auto_63256 - LOCATION
    )
    :vars
    (
      ?auto_63259 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_63258 ?auto_63257 ) ) ( TRUCK-AT ?auto_63259 ?auto_63256 ) ( IN-TRUCK ?auto_63257 ?auto_63259 ) ( OBJ-AT ?auto_63258 ?auto_63256 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_63257 ?auto_63256 )
      ( DELIVER-2PKG-VERIFY ?auto_63257 ?auto_63258 ?auto_63256 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_63261 - OBJ
      ?auto_63262 - OBJ
      ?auto_63260 - LOCATION
    )
    :vars
    (
      ?auto_63263 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_63262 ?auto_63261 ) ) ( TRUCK-AT ?auto_63263 ?auto_63260 ) ( IN-TRUCK ?auto_63261 ?auto_63263 ) ( OBJ-AT ?auto_63262 ?auto_63260 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_63261 ?auto_63260 )
      ( DELIVER-2PKG-VERIFY ?auto_63261 ?auto_63262 ?auto_63260 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_63274 - OBJ
      ?auto_63275 - OBJ
      ?auto_63276 - OBJ
      ?auto_63273 - LOCATION
    )
    :vars
    (
      ?auto_63277 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_63275 ?auto_63274 ) ) ( not ( = ?auto_63276 ?auto_63274 ) ) ( not ( = ?auto_63276 ?auto_63275 ) ) ( TRUCK-AT ?auto_63277 ?auto_63273 ) ( IN-TRUCK ?auto_63276 ?auto_63277 ) ( OBJ-AT ?auto_63274 ?auto_63273 ) ( OBJ-AT ?auto_63275 ?auto_63273 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_63276 ?auto_63273 )
      ( DELIVER-3PKG-VERIFY ?auto_63274 ?auto_63275 ?auto_63276 ?auto_63273 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_63284 - OBJ
      ?auto_63285 - OBJ
      ?auto_63286 - OBJ
      ?auto_63283 - LOCATION
    )
    :vars
    (
      ?auto_63287 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_63285 ?auto_63284 ) ) ( not ( = ?auto_63286 ?auto_63284 ) ) ( not ( = ?auto_63286 ?auto_63285 ) ) ( TRUCK-AT ?auto_63287 ?auto_63283 ) ( IN-TRUCK ?auto_63285 ?auto_63287 ) ( OBJ-AT ?auto_63284 ?auto_63283 ) ( OBJ-AT ?auto_63286 ?auto_63283 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_63285 ?auto_63283 )
      ( DELIVER-3PKG-VERIFY ?auto_63284 ?auto_63285 ?auto_63286 ?auto_63283 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_63294 - OBJ
      ?auto_63295 - OBJ
      ?auto_63296 - OBJ
      ?auto_63293 - LOCATION
    )
    :vars
    (
      ?auto_63297 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_63295 ?auto_63294 ) ) ( not ( = ?auto_63296 ?auto_63294 ) ) ( not ( = ?auto_63296 ?auto_63295 ) ) ( TRUCK-AT ?auto_63297 ?auto_63293 ) ( IN-TRUCK ?auto_63296 ?auto_63297 ) ( OBJ-AT ?auto_63294 ?auto_63293 ) ( OBJ-AT ?auto_63295 ?auto_63293 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_63296 ?auto_63293 )
      ( DELIVER-3PKG-VERIFY ?auto_63294 ?auto_63295 ?auto_63296 ?auto_63293 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_63304 - OBJ
      ?auto_63305 - OBJ
      ?auto_63306 - OBJ
      ?auto_63303 - LOCATION
    )
    :vars
    (
      ?auto_63307 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_63305 ?auto_63304 ) ) ( not ( = ?auto_63306 ?auto_63304 ) ) ( not ( = ?auto_63306 ?auto_63305 ) ) ( TRUCK-AT ?auto_63307 ?auto_63303 ) ( IN-TRUCK ?auto_63305 ?auto_63307 ) ( OBJ-AT ?auto_63304 ?auto_63303 ) ( OBJ-AT ?auto_63306 ?auto_63303 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_63305 ?auto_63303 )
      ( DELIVER-3PKG-VERIFY ?auto_63304 ?auto_63305 ?auto_63306 ?auto_63303 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_63324 - OBJ
      ?auto_63325 - OBJ
      ?auto_63326 - OBJ
      ?auto_63323 - LOCATION
    )
    :vars
    (
      ?auto_63327 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_63325 ?auto_63324 ) ) ( not ( = ?auto_63326 ?auto_63324 ) ) ( not ( = ?auto_63326 ?auto_63325 ) ) ( TRUCK-AT ?auto_63327 ?auto_63323 ) ( IN-TRUCK ?auto_63324 ?auto_63327 ) ( OBJ-AT ?auto_63325 ?auto_63323 ) ( OBJ-AT ?auto_63326 ?auto_63323 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_63324 ?auto_63323 )
      ( DELIVER-3PKG-VERIFY ?auto_63324 ?auto_63325 ?auto_63326 ?auto_63323 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_63334 - OBJ
      ?auto_63335 - OBJ
      ?auto_63336 - OBJ
      ?auto_63333 - LOCATION
    )
    :vars
    (
      ?auto_63337 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_63335 ?auto_63334 ) ) ( not ( = ?auto_63336 ?auto_63334 ) ) ( not ( = ?auto_63336 ?auto_63335 ) ) ( TRUCK-AT ?auto_63337 ?auto_63333 ) ( IN-TRUCK ?auto_63334 ?auto_63337 ) ( OBJ-AT ?auto_63335 ?auto_63333 ) ( OBJ-AT ?auto_63336 ?auto_63333 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_63334 ?auto_63333 )
      ( DELIVER-3PKG-VERIFY ?auto_63334 ?auto_63335 ?auto_63336 ?auto_63333 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_63754 - OBJ
      ?auto_63753 - LOCATION
    )
    :vars
    (
      ?auto_63755 - TRUCK
      ?auto_63756 - LOCATION
      ?auto_63757 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_63754 ?auto_63755 ) ( TRUCK-AT ?auto_63755 ?auto_63756 ) ( IN-CITY ?auto_63756 ?auto_63757 ) ( IN-CITY ?auto_63753 ?auto_63757 ) ( not ( = ?auto_63753 ?auto_63756 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_63755 ?auto_63756 ?auto_63753 ?auto_63757 )
      ( DELIVER-1PKG ?auto_63754 ?auto_63753 )
      ( DELIVER-1PKG-VERIFY ?auto_63754 ?auto_63753 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_63759 - OBJ
      ?auto_63760 - OBJ
      ?auto_63758 - LOCATION
    )
    :vars
    (
      ?auto_63761 - TRUCK
      ?auto_63762 - LOCATION
      ?auto_63763 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_63760 ?auto_63759 ) ) ( IN-TRUCK ?auto_63760 ?auto_63761 ) ( TRUCK-AT ?auto_63761 ?auto_63762 ) ( IN-CITY ?auto_63762 ?auto_63763 ) ( IN-CITY ?auto_63758 ?auto_63763 ) ( not ( = ?auto_63758 ?auto_63762 ) ) ( OBJ-AT ?auto_63759 ?auto_63758 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_63760 ?auto_63758 )
      ( DELIVER-2PKG-VERIFY ?auto_63759 ?auto_63760 ?auto_63758 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_63765 - OBJ
      ?auto_63766 - OBJ
      ?auto_63764 - LOCATION
    )
    :vars
    (
      ?auto_63770 - OBJ
      ?auto_63769 - TRUCK
      ?auto_63768 - LOCATION
      ?auto_63767 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_63766 ?auto_63765 ) ) ( not ( = ?auto_63766 ?auto_63770 ) ) ( IN-TRUCK ?auto_63766 ?auto_63769 ) ( TRUCK-AT ?auto_63769 ?auto_63768 ) ( IN-CITY ?auto_63768 ?auto_63767 ) ( IN-CITY ?auto_63764 ?auto_63767 ) ( not ( = ?auto_63764 ?auto_63768 ) ) ( OBJ-AT ?auto_63770 ?auto_63764 ) ( OBJ-AT ?auto_63765 ?auto_63764 ) ( not ( = ?auto_63765 ?auto_63770 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_63770 ?auto_63766 ?auto_63764 )
      ( DELIVER-2PKG-VERIFY ?auto_63765 ?auto_63766 ?auto_63764 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_63772 - OBJ
      ?auto_63773 - OBJ
      ?auto_63771 - LOCATION
    )
    :vars
    (
      ?auto_63776 - TRUCK
      ?auto_63775 - LOCATION
      ?auto_63774 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_63773 ?auto_63772 ) ) ( IN-TRUCK ?auto_63772 ?auto_63776 ) ( TRUCK-AT ?auto_63776 ?auto_63775 ) ( IN-CITY ?auto_63775 ?auto_63774 ) ( IN-CITY ?auto_63771 ?auto_63774 ) ( not ( = ?auto_63771 ?auto_63775 ) ) ( OBJ-AT ?auto_63773 ?auto_63771 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_63773 ?auto_63772 ?auto_63771 )
      ( DELIVER-2PKG-VERIFY ?auto_63772 ?auto_63773 ?auto_63771 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_63778 - OBJ
      ?auto_63779 - OBJ
      ?auto_63777 - LOCATION
    )
    :vars
    (
      ?auto_63783 - OBJ
      ?auto_63782 - TRUCK
      ?auto_63781 - LOCATION
      ?auto_63780 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_63779 ?auto_63778 ) ) ( not ( = ?auto_63778 ?auto_63783 ) ) ( IN-TRUCK ?auto_63778 ?auto_63782 ) ( TRUCK-AT ?auto_63782 ?auto_63781 ) ( IN-CITY ?auto_63781 ?auto_63780 ) ( IN-CITY ?auto_63777 ?auto_63780 ) ( not ( = ?auto_63777 ?auto_63781 ) ) ( OBJ-AT ?auto_63783 ?auto_63777 ) ( OBJ-AT ?auto_63779 ?auto_63777 ) ( not ( = ?auto_63779 ?auto_63783 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_63783 ?auto_63778 ?auto_63777 )
      ( DELIVER-2PKG-VERIFY ?auto_63778 ?auto_63779 ?auto_63777 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_63799 - OBJ
      ?auto_63800 - OBJ
      ?auto_63801 - OBJ
      ?auto_63798 - LOCATION
    )
    :vars
    (
      ?auto_63804 - TRUCK
      ?auto_63803 - LOCATION
      ?auto_63802 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_63800 ?auto_63799 ) ) ( not ( = ?auto_63801 ?auto_63799 ) ) ( not ( = ?auto_63801 ?auto_63800 ) ) ( IN-TRUCK ?auto_63801 ?auto_63804 ) ( TRUCK-AT ?auto_63804 ?auto_63803 ) ( IN-CITY ?auto_63803 ?auto_63802 ) ( IN-CITY ?auto_63798 ?auto_63802 ) ( not ( = ?auto_63798 ?auto_63803 ) ) ( OBJ-AT ?auto_63799 ?auto_63798 ) ( OBJ-AT ?auto_63800 ?auto_63798 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_63799 ?auto_63801 ?auto_63798 )
      ( DELIVER-3PKG-VERIFY ?auto_63799 ?auto_63800 ?auto_63801 ?auto_63798 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_63813 - OBJ
      ?auto_63814 - OBJ
      ?auto_63815 - OBJ
      ?auto_63812 - LOCATION
    )
    :vars
    (
      ?auto_63818 - TRUCK
      ?auto_63817 - LOCATION
      ?auto_63816 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_63814 ?auto_63813 ) ) ( not ( = ?auto_63815 ?auto_63813 ) ) ( not ( = ?auto_63815 ?auto_63814 ) ) ( IN-TRUCK ?auto_63814 ?auto_63818 ) ( TRUCK-AT ?auto_63818 ?auto_63817 ) ( IN-CITY ?auto_63817 ?auto_63816 ) ( IN-CITY ?auto_63812 ?auto_63816 ) ( not ( = ?auto_63812 ?auto_63817 ) ) ( OBJ-AT ?auto_63813 ?auto_63812 ) ( OBJ-AT ?auto_63815 ?auto_63812 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_63813 ?auto_63814 ?auto_63812 )
      ( DELIVER-3PKG-VERIFY ?auto_63813 ?auto_63814 ?auto_63815 ?auto_63812 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_63827 - OBJ
      ?auto_63828 - OBJ
      ?auto_63829 - OBJ
      ?auto_63826 - LOCATION
    )
    :vars
    (
      ?auto_63832 - TRUCK
      ?auto_63831 - LOCATION
      ?auto_63830 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_63828 ?auto_63827 ) ) ( not ( = ?auto_63829 ?auto_63827 ) ) ( not ( = ?auto_63829 ?auto_63828 ) ) ( IN-TRUCK ?auto_63829 ?auto_63832 ) ( TRUCK-AT ?auto_63832 ?auto_63831 ) ( IN-CITY ?auto_63831 ?auto_63830 ) ( IN-CITY ?auto_63826 ?auto_63830 ) ( not ( = ?auto_63826 ?auto_63831 ) ) ( OBJ-AT ?auto_63828 ?auto_63826 ) ( OBJ-AT ?auto_63827 ?auto_63826 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_63828 ?auto_63829 ?auto_63826 )
      ( DELIVER-3PKG-VERIFY ?auto_63827 ?auto_63828 ?auto_63829 ?auto_63826 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_63842 - OBJ
      ?auto_63843 - OBJ
      ?auto_63844 - OBJ
      ?auto_63841 - LOCATION
    )
    :vars
    (
      ?auto_63847 - TRUCK
      ?auto_63846 - LOCATION
      ?auto_63845 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_63843 ?auto_63842 ) ) ( not ( = ?auto_63844 ?auto_63842 ) ) ( not ( = ?auto_63844 ?auto_63843 ) ) ( IN-TRUCK ?auto_63843 ?auto_63847 ) ( TRUCK-AT ?auto_63847 ?auto_63846 ) ( IN-CITY ?auto_63846 ?auto_63845 ) ( IN-CITY ?auto_63841 ?auto_63845 ) ( not ( = ?auto_63841 ?auto_63846 ) ) ( OBJ-AT ?auto_63844 ?auto_63841 ) ( OBJ-AT ?auto_63842 ?auto_63841 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_63844 ?auto_63843 ?auto_63841 )
      ( DELIVER-3PKG-VERIFY ?auto_63842 ?auto_63843 ?auto_63844 ?auto_63841 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_63872 - OBJ
      ?auto_63873 - OBJ
      ?auto_63874 - OBJ
      ?auto_63871 - LOCATION
    )
    :vars
    (
      ?auto_63877 - TRUCK
      ?auto_63876 - LOCATION
      ?auto_63875 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_63873 ?auto_63872 ) ) ( not ( = ?auto_63874 ?auto_63872 ) ) ( not ( = ?auto_63874 ?auto_63873 ) ) ( IN-TRUCK ?auto_63872 ?auto_63877 ) ( TRUCK-AT ?auto_63877 ?auto_63876 ) ( IN-CITY ?auto_63876 ?auto_63875 ) ( IN-CITY ?auto_63871 ?auto_63875 ) ( not ( = ?auto_63871 ?auto_63876 ) ) ( OBJ-AT ?auto_63873 ?auto_63871 ) ( OBJ-AT ?auto_63874 ?auto_63871 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_63873 ?auto_63872 ?auto_63871 )
      ( DELIVER-3PKG-VERIFY ?auto_63872 ?auto_63873 ?auto_63874 ?auto_63871 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_63886 - OBJ
      ?auto_63887 - OBJ
      ?auto_63888 - OBJ
      ?auto_63885 - LOCATION
    )
    :vars
    (
      ?auto_63891 - TRUCK
      ?auto_63890 - LOCATION
      ?auto_63889 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_63887 ?auto_63886 ) ) ( not ( = ?auto_63888 ?auto_63886 ) ) ( not ( = ?auto_63888 ?auto_63887 ) ) ( IN-TRUCK ?auto_63886 ?auto_63891 ) ( TRUCK-AT ?auto_63891 ?auto_63890 ) ( IN-CITY ?auto_63890 ?auto_63889 ) ( IN-CITY ?auto_63885 ?auto_63889 ) ( not ( = ?auto_63885 ?auto_63890 ) ) ( OBJ-AT ?auto_63888 ?auto_63885 ) ( OBJ-AT ?auto_63887 ?auto_63885 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_63888 ?auto_63886 ?auto_63885 )
      ( DELIVER-3PKG-VERIFY ?auto_63886 ?auto_63887 ?auto_63888 ?auto_63885 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_64467 - OBJ
      ?auto_64466 - LOCATION
    )
    :vars
    (
      ?auto_64471 - OBJ
      ?auto_64470 - TRUCK
      ?auto_64469 - LOCATION
      ?auto_64468 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_64467 ?auto_64471 ) ) ( TRUCK-AT ?auto_64470 ?auto_64469 ) ( IN-CITY ?auto_64469 ?auto_64468 ) ( IN-CITY ?auto_64466 ?auto_64468 ) ( not ( = ?auto_64466 ?auto_64469 ) ) ( OBJ-AT ?auto_64471 ?auto_64466 ) ( OBJ-AT ?auto_64467 ?auto_64469 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_64467 ?auto_64470 ?auto_64469 )
      ( DELIVER-2PKG ?auto_64471 ?auto_64467 ?auto_64466 )
      ( DELIVER-1PKG-VERIFY ?auto_64467 ?auto_64466 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_64473 - OBJ
      ?auto_64474 - OBJ
      ?auto_64472 - LOCATION
    )
    :vars
    (
      ?auto_64477 - TRUCK
      ?auto_64476 - LOCATION
      ?auto_64475 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_64474 ?auto_64473 ) ) ( TRUCK-AT ?auto_64477 ?auto_64476 ) ( IN-CITY ?auto_64476 ?auto_64475 ) ( IN-CITY ?auto_64472 ?auto_64475 ) ( not ( = ?auto_64472 ?auto_64476 ) ) ( OBJ-AT ?auto_64473 ?auto_64472 ) ( OBJ-AT ?auto_64474 ?auto_64476 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_64474 ?auto_64472 )
      ( DELIVER-2PKG-VERIFY ?auto_64473 ?auto_64474 ?auto_64472 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_64479 - OBJ
      ?auto_64480 - OBJ
      ?auto_64478 - LOCATION
    )
    :vars
    (
      ?auto_64484 - OBJ
      ?auto_64481 - TRUCK
      ?auto_64482 - LOCATION
      ?auto_64483 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_64480 ?auto_64479 ) ) ( not ( = ?auto_64480 ?auto_64484 ) ) ( TRUCK-AT ?auto_64481 ?auto_64482 ) ( IN-CITY ?auto_64482 ?auto_64483 ) ( IN-CITY ?auto_64478 ?auto_64483 ) ( not ( = ?auto_64478 ?auto_64482 ) ) ( OBJ-AT ?auto_64484 ?auto_64478 ) ( OBJ-AT ?auto_64480 ?auto_64482 ) ( OBJ-AT ?auto_64479 ?auto_64478 ) ( not ( = ?auto_64479 ?auto_64484 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_64484 ?auto_64480 ?auto_64478 )
      ( DELIVER-2PKG-VERIFY ?auto_64479 ?auto_64480 ?auto_64478 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_64486 - OBJ
      ?auto_64487 - OBJ
      ?auto_64485 - LOCATION
    )
    :vars
    (
      ?auto_64488 - TRUCK
      ?auto_64489 - LOCATION
      ?auto_64490 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_64487 ?auto_64486 ) ) ( TRUCK-AT ?auto_64488 ?auto_64489 ) ( IN-CITY ?auto_64489 ?auto_64490 ) ( IN-CITY ?auto_64485 ?auto_64490 ) ( not ( = ?auto_64485 ?auto_64489 ) ) ( OBJ-AT ?auto_64487 ?auto_64485 ) ( OBJ-AT ?auto_64486 ?auto_64489 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_64487 ?auto_64486 ?auto_64485 )
      ( DELIVER-2PKG-VERIFY ?auto_64486 ?auto_64487 ?auto_64485 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_64492 - OBJ
      ?auto_64493 - OBJ
      ?auto_64491 - LOCATION
    )
    :vars
    (
      ?auto_64497 - OBJ
      ?auto_64494 - TRUCK
      ?auto_64495 - LOCATION
      ?auto_64496 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_64493 ?auto_64492 ) ) ( not ( = ?auto_64492 ?auto_64497 ) ) ( TRUCK-AT ?auto_64494 ?auto_64495 ) ( IN-CITY ?auto_64495 ?auto_64496 ) ( IN-CITY ?auto_64491 ?auto_64496 ) ( not ( = ?auto_64491 ?auto_64495 ) ) ( OBJ-AT ?auto_64497 ?auto_64491 ) ( OBJ-AT ?auto_64492 ?auto_64495 ) ( OBJ-AT ?auto_64493 ?auto_64491 ) ( not ( = ?auto_64493 ?auto_64497 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_64497 ?auto_64492 ?auto_64491 )
      ( DELIVER-2PKG-VERIFY ?auto_64492 ?auto_64493 ?auto_64491 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_64513 - OBJ
      ?auto_64514 - OBJ
      ?auto_64515 - OBJ
      ?auto_64512 - LOCATION
    )
    :vars
    (
      ?auto_64516 - TRUCK
      ?auto_64517 - LOCATION
      ?auto_64518 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_64514 ?auto_64513 ) ) ( not ( = ?auto_64515 ?auto_64513 ) ) ( not ( = ?auto_64515 ?auto_64514 ) ) ( TRUCK-AT ?auto_64516 ?auto_64517 ) ( IN-CITY ?auto_64517 ?auto_64518 ) ( IN-CITY ?auto_64512 ?auto_64518 ) ( not ( = ?auto_64512 ?auto_64517 ) ) ( OBJ-AT ?auto_64513 ?auto_64512 ) ( OBJ-AT ?auto_64515 ?auto_64517 ) ( OBJ-AT ?auto_64514 ?auto_64512 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_64513 ?auto_64515 ?auto_64512 )
      ( DELIVER-3PKG-VERIFY ?auto_64513 ?auto_64514 ?auto_64515 ?auto_64512 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_64527 - OBJ
      ?auto_64528 - OBJ
      ?auto_64529 - OBJ
      ?auto_64526 - LOCATION
    )
    :vars
    (
      ?auto_64530 - TRUCK
      ?auto_64531 - LOCATION
      ?auto_64532 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_64528 ?auto_64527 ) ) ( not ( = ?auto_64529 ?auto_64527 ) ) ( not ( = ?auto_64529 ?auto_64528 ) ) ( TRUCK-AT ?auto_64530 ?auto_64531 ) ( IN-CITY ?auto_64531 ?auto_64532 ) ( IN-CITY ?auto_64526 ?auto_64532 ) ( not ( = ?auto_64526 ?auto_64531 ) ) ( OBJ-AT ?auto_64527 ?auto_64526 ) ( OBJ-AT ?auto_64528 ?auto_64531 ) ( OBJ-AT ?auto_64529 ?auto_64526 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_64527 ?auto_64528 ?auto_64526 )
      ( DELIVER-3PKG-VERIFY ?auto_64527 ?auto_64528 ?auto_64529 ?auto_64526 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_64541 - OBJ
      ?auto_64542 - OBJ
      ?auto_64543 - OBJ
      ?auto_64540 - LOCATION
    )
    :vars
    (
      ?auto_64544 - TRUCK
      ?auto_64545 - LOCATION
      ?auto_64546 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_64542 ?auto_64541 ) ) ( not ( = ?auto_64543 ?auto_64541 ) ) ( not ( = ?auto_64543 ?auto_64542 ) ) ( TRUCK-AT ?auto_64544 ?auto_64545 ) ( IN-CITY ?auto_64545 ?auto_64546 ) ( IN-CITY ?auto_64540 ?auto_64546 ) ( not ( = ?auto_64540 ?auto_64545 ) ) ( OBJ-AT ?auto_64542 ?auto_64540 ) ( OBJ-AT ?auto_64543 ?auto_64545 ) ( OBJ-AT ?auto_64541 ?auto_64540 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_64542 ?auto_64543 ?auto_64540 )
      ( DELIVER-3PKG-VERIFY ?auto_64541 ?auto_64542 ?auto_64543 ?auto_64540 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_64556 - OBJ
      ?auto_64557 - OBJ
      ?auto_64558 - OBJ
      ?auto_64555 - LOCATION
    )
    :vars
    (
      ?auto_64559 - TRUCK
      ?auto_64560 - LOCATION
      ?auto_64561 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_64557 ?auto_64556 ) ) ( not ( = ?auto_64558 ?auto_64556 ) ) ( not ( = ?auto_64558 ?auto_64557 ) ) ( TRUCK-AT ?auto_64559 ?auto_64560 ) ( IN-CITY ?auto_64560 ?auto_64561 ) ( IN-CITY ?auto_64555 ?auto_64561 ) ( not ( = ?auto_64555 ?auto_64560 ) ) ( OBJ-AT ?auto_64558 ?auto_64555 ) ( OBJ-AT ?auto_64557 ?auto_64560 ) ( OBJ-AT ?auto_64556 ?auto_64555 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_64558 ?auto_64557 ?auto_64555 )
      ( DELIVER-3PKG-VERIFY ?auto_64556 ?auto_64557 ?auto_64558 ?auto_64555 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_64586 - OBJ
      ?auto_64587 - OBJ
      ?auto_64588 - OBJ
      ?auto_64585 - LOCATION
    )
    :vars
    (
      ?auto_64589 - TRUCK
      ?auto_64590 - LOCATION
      ?auto_64591 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_64587 ?auto_64586 ) ) ( not ( = ?auto_64588 ?auto_64586 ) ) ( not ( = ?auto_64588 ?auto_64587 ) ) ( TRUCK-AT ?auto_64589 ?auto_64590 ) ( IN-CITY ?auto_64590 ?auto_64591 ) ( IN-CITY ?auto_64585 ?auto_64591 ) ( not ( = ?auto_64585 ?auto_64590 ) ) ( OBJ-AT ?auto_64587 ?auto_64585 ) ( OBJ-AT ?auto_64586 ?auto_64590 ) ( OBJ-AT ?auto_64588 ?auto_64585 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_64587 ?auto_64586 ?auto_64585 )
      ( DELIVER-3PKG-VERIFY ?auto_64586 ?auto_64587 ?auto_64588 ?auto_64585 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_64600 - OBJ
      ?auto_64601 - OBJ
      ?auto_64602 - OBJ
      ?auto_64599 - LOCATION
    )
    :vars
    (
      ?auto_64603 - TRUCK
      ?auto_64604 - LOCATION
      ?auto_64605 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_64601 ?auto_64600 ) ) ( not ( = ?auto_64602 ?auto_64600 ) ) ( not ( = ?auto_64602 ?auto_64601 ) ) ( TRUCK-AT ?auto_64603 ?auto_64604 ) ( IN-CITY ?auto_64604 ?auto_64605 ) ( IN-CITY ?auto_64599 ?auto_64605 ) ( not ( = ?auto_64599 ?auto_64604 ) ) ( OBJ-AT ?auto_64602 ?auto_64599 ) ( OBJ-AT ?auto_64600 ?auto_64604 ) ( OBJ-AT ?auto_64601 ?auto_64599 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_64602 ?auto_64600 ?auto_64599 )
      ( DELIVER-3PKG-VERIFY ?auto_64600 ?auto_64601 ?auto_64602 ?auto_64599 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_65181 - OBJ
      ?auto_65180 - LOCATION
    )
    :vars
    (
      ?auto_65185 - OBJ
      ?auto_65183 - LOCATION
      ?auto_65184 - CITY
      ?auto_65182 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_65181 ?auto_65185 ) ) ( IN-CITY ?auto_65183 ?auto_65184 ) ( IN-CITY ?auto_65180 ?auto_65184 ) ( not ( = ?auto_65180 ?auto_65183 ) ) ( OBJ-AT ?auto_65185 ?auto_65180 ) ( OBJ-AT ?auto_65181 ?auto_65183 ) ( TRUCK-AT ?auto_65182 ?auto_65180 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_65182 ?auto_65180 ?auto_65183 ?auto_65184 )
      ( DELIVER-2PKG ?auto_65185 ?auto_65181 ?auto_65180 )
      ( DELIVER-1PKG-VERIFY ?auto_65181 ?auto_65180 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_65187 - OBJ
      ?auto_65188 - OBJ
      ?auto_65186 - LOCATION
    )
    :vars
    (
      ?auto_65191 - LOCATION
      ?auto_65189 - CITY
      ?auto_65190 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_65188 ?auto_65187 ) ) ( IN-CITY ?auto_65191 ?auto_65189 ) ( IN-CITY ?auto_65186 ?auto_65189 ) ( not ( = ?auto_65186 ?auto_65191 ) ) ( OBJ-AT ?auto_65187 ?auto_65186 ) ( OBJ-AT ?auto_65188 ?auto_65191 ) ( TRUCK-AT ?auto_65190 ?auto_65186 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_65188 ?auto_65186 )
      ( DELIVER-2PKG-VERIFY ?auto_65187 ?auto_65188 ?auto_65186 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_65193 - OBJ
      ?auto_65194 - OBJ
      ?auto_65192 - LOCATION
    )
    :vars
    (
      ?auto_65196 - OBJ
      ?auto_65195 - LOCATION
      ?auto_65197 - CITY
      ?auto_65198 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_65194 ?auto_65193 ) ) ( not ( = ?auto_65194 ?auto_65196 ) ) ( IN-CITY ?auto_65195 ?auto_65197 ) ( IN-CITY ?auto_65192 ?auto_65197 ) ( not ( = ?auto_65192 ?auto_65195 ) ) ( OBJ-AT ?auto_65196 ?auto_65192 ) ( OBJ-AT ?auto_65194 ?auto_65195 ) ( TRUCK-AT ?auto_65198 ?auto_65192 ) ( OBJ-AT ?auto_65193 ?auto_65192 ) ( not ( = ?auto_65193 ?auto_65196 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_65196 ?auto_65194 ?auto_65192 )
      ( DELIVER-2PKG-VERIFY ?auto_65193 ?auto_65194 ?auto_65192 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_65200 - OBJ
      ?auto_65201 - OBJ
      ?auto_65199 - LOCATION
    )
    :vars
    (
      ?auto_65202 - LOCATION
      ?auto_65203 - CITY
      ?auto_65204 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_65201 ?auto_65200 ) ) ( IN-CITY ?auto_65202 ?auto_65203 ) ( IN-CITY ?auto_65199 ?auto_65203 ) ( not ( = ?auto_65199 ?auto_65202 ) ) ( OBJ-AT ?auto_65201 ?auto_65199 ) ( OBJ-AT ?auto_65200 ?auto_65202 ) ( TRUCK-AT ?auto_65204 ?auto_65199 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_65201 ?auto_65200 ?auto_65199 )
      ( DELIVER-2PKG-VERIFY ?auto_65200 ?auto_65201 ?auto_65199 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_65206 - OBJ
      ?auto_65207 - OBJ
      ?auto_65205 - LOCATION
    )
    :vars
    (
      ?auto_65209 - OBJ
      ?auto_65208 - LOCATION
      ?auto_65210 - CITY
      ?auto_65211 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_65207 ?auto_65206 ) ) ( not ( = ?auto_65206 ?auto_65209 ) ) ( IN-CITY ?auto_65208 ?auto_65210 ) ( IN-CITY ?auto_65205 ?auto_65210 ) ( not ( = ?auto_65205 ?auto_65208 ) ) ( OBJ-AT ?auto_65209 ?auto_65205 ) ( OBJ-AT ?auto_65206 ?auto_65208 ) ( TRUCK-AT ?auto_65211 ?auto_65205 ) ( OBJ-AT ?auto_65207 ?auto_65205 ) ( not ( = ?auto_65207 ?auto_65209 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_65209 ?auto_65206 ?auto_65205 )
      ( DELIVER-2PKG-VERIFY ?auto_65206 ?auto_65207 ?auto_65205 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_65227 - OBJ
      ?auto_65228 - OBJ
      ?auto_65229 - OBJ
      ?auto_65226 - LOCATION
    )
    :vars
    (
      ?auto_65230 - LOCATION
      ?auto_65231 - CITY
      ?auto_65232 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_65228 ?auto_65227 ) ) ( not ( = ?auto_65229 ?auto_65227 ) ) ( not ( = ?auto_65229 ?auto_65228 ) ) ( IN-CITY ?auto_65230 ?auto_65231 ) ( IN-CITY ?auto_65226 ?auto_65231 ) ( not ( = ?auto_65226 ?auto_65230 ) ) ( OBJ-AT ?auto_65227 ?auto_65226 ) ( OBJ-AT ?auto_65229 ?auto_65230 ) ( TRUCK-AT ?auto_65232 ?auto_65226 ) ( OBJ-AT ?auto_65228 ?auto_65226 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_65227 ?auto_65229 ?auto_65226 )
      ( DELIVER-3PKG-VERIFY ?auto_65227 ?auto_65228 ?auto_65229 ?auto_65226 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_65241 - OBJ
      ?auto_65242 - OBJ
      ?auto_65243 - OBJ
      ?auto_65240 - LOCATION
    )
    :vars
    (
      ?auto_65244 - LOCATION
      ?auto_65245 - CITY
      ?auto_65246 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_65242 ?auto_65241 ) ) ( not ( = ?auto_65243 ?auto_65241 ) ) ( not ( = ?auto_65243 ?auto_65242 ) ) ( IN-CITY ?auto_65244 ?auto_65245 ) ( IN-CITY ?auto_65240 ?auto_65245 ) ( not ( = ?auto_65240 ?auto_65244 ) ) ( OBJ-AT ?auto_65241 ?auto_65240 ) ( OBJ-AT ?auto_65242 ?auto_65244 ) ( TRUCK-AT ?auto_65246 ?auto_65240 ) ( OBJ-AT ?auto_65243 ?auto_65240 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_65241 ?auto_65242 ?auto_65240 )
      ( DELIVER-3PKG-VERIFY ?auto_65241 ?auto_65242 ?auto_65243 ?auto_65240 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_65255 - OBJ
      ?auto_65256 - OBJ
      ?auto_65257 - OBJ
      ?auto_65254 - LOCATION
    )
    :vars
    (
      ?auto_65258 - LOCATION
      ?auto_65259 - CITY
      ?auto_65260 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_65256 ?auto_65255 ) ) ( not ( = ?auto_65257 ?auto_65255 ) ) ( not ( = ?auto_65257 ?auto_65256 ) ) ( IN-CITY ?auto_65258 ?auto_65259 ) ( IN-CITY ?auto_65254 ?auto_65259 ) ( not ( = ?auto_65254 ?auto_65258 ) ) ( OBJ-AT ?auto_65256 ?auto_65254 ) ( OBJ-AT ?auto_65257 ?auto_65258 ) ( TRUCK-AT ?auto_65260 ?auto_65254 ) ( OBJ-AT ?auto_65255 ?auto_65254 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_65256 ?auto_65257 ?auto_65254 )
      ( DELIVER-3PKG-VERIFY ?auto_65255 ?auto_65256 ?auto_65257 ?auto_65254 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_65270 - OBJ
      ?auto_65271 - OBJ
      ?auto_65272 - OBJ
      ?auto_65269 - LOCATION
    )
    :vars
    (
      ?auto_65273 - LOCATION
      ?auto_65274 - CITY
      ?auto_65275 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_65271 ?auto_65270 ) ) ( not ( = ?auto_65272 ?auto_65270 ) ) ( not ( = ?auto_65272 ?auto_65271 ) ) ( IN-CITY ?auto_65273 ?auto_65274 ) ( IN-CITY ?auto_65269 ?auto_65274 ) ( not ( = ?auto_65269 ?auto_65273 ) ) ( OBJ-AT ?auto_65272 ?auto_65269 ) ( OBJ-AT ?auto_65271 ?auto_65273 ) ( TRUCK-AT ?auto_65275 ?auto_65269 ) ( OBJ-AT ?auto_65270 ?auto_65269 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_65272 ?auto_65271 ?auto_65269 )
      ( DELIVER-3PKG-VERIFY ?auto_65270 ?auto_65271 ?auto_65272 ?auto_65269 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_65300 - OBJ
      ?auto_65301 - OBJ
      ?auto_65302 - OBJ
      ?auto_65299 - LOCATION
    )
    :vars
    (
      ?auto_65303 - LOCATION
      ?auto_65304 - CITY
      ?auto_65305 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_65301 ?auto_65300 ) ) ( not ( = ?auto_65302 ?auto_65300 ) ) ( not ( = ?auto_65302 ?auto_65301 ) ) ( IN-CITY ?auto_65303 ?auto_65304 ) ( IN-CITY ?auto_65299 ?auto_65304 ) ( not ( = ?auto_65299 ?auto_65303 ) ) ( OBJ-AT ?auto_65301 ?auto_65299 ) ( OBJ-AT ?auto_65300 ?auto_65303 ) ( TRUCK-AT ?auto_65305 ?auto_65299 ) ( OBJ-AT ?auto_65302 ?auto_65299 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_65301 ?auto_65300 ?auto_65299 )
      ( DELIVER-3PKG-VERIFY ?auto_65300 ?auto_65301 ?auto_65302 ?auto_65299 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_65314 - OBJ
      ?auto_65315 - OBJ
      ?auto_65316 - OBJ
      ?auto_65313 - LOCATION
    )
    :vars
    (
      ?auto_65317 - LOCATION
      ?auto_65318 - CITY
      ?auto_65319 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_65315 ?auto_65314 ) ) ( not ( = ?auto_65316 ?auto_65314 ) ) ( not ( = ?auto_65316 ?auto_65315 ) ) ( IN-CITY ?auto_65317 ?auto_65318 ) ( IN-CITY ?auto_65313 ?auto_65318 ) ( not ( = ?auto_65313 ?auto_65317 ) ) ( OBJ-AT ?auto_65316 ?auto_65313 ) ( OBJ-AT ?auto_65314 ?auto_65317 ) ( TRUCK-AT ?auto_65319 ?auto_65313 ) ( OBJ-AT ?auto_65315 ?auto_65313 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_65316 ?auto_65314 ?auto_65313 )
      ( DELIVER-3PKG-VERIFY ?auto_65314 ?auto_65315 ?auto_65316 ?auto_65313 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_65895 - OBJ
      ?auto_65894 - LOCATION
    )
    :vars
    (
      ?auto_65897 - OBJ
      ?auto_65896 - LOCATION
      ?auto_65898 - CITY
      ?auto_65899 - TRUCK
      ?auto_65900 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_65895 ?auto_65897 ) ) ( IN-CITY ?auto_65896 ?auto_65898 ) ( IN-CITY ?auto_65894 ?auto_65898 ) ( not ( = ?auto_65894 ?auto_65896 ) ) ( OBJ-AT ?auto_65897 ?auto_65894 ) ( OBJ-AT ?auto_65895 ?auto_65896 ) ( TRUCK-AT ?auto_65899 ?auto_65894 ) ( not ( = ?auto_65900 ?auto_65897 ) ) ( IN-TRUCK ?auto_65900 ?auto_65899 ) ( not ( = ?auto_65895 ?auto_65900 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_65897 ?auto_65900 ?auto_65894 )
      ( DELIVER-2PKG ?auto_65897 ?auto_65895 ?auto_65894 )
      ( DELIVER-1PKG-VERIFY ?auto_65895 ?auto_65894 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_65902 - OBJ
      ?auto_65903 - OBJ
      ?auto_65901 - LOCATION
    )
    :vars
    (
      ?auto_65904 - LOCATION
      ?auto_65905 - CITY
      ?auto_65906 - TRUCK
      ?auto_65907 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_65903 ?auto_65902 ) ) ( IN-CITY ?auto_65904 ?auto_65905 ) ( IN-CITY ?auto_65901 ?auto_65905 ) ( not ( = ?auto_65901 ?auto_65904 ) ) ( OBJ-AT ?auto_65902 ?auto_65901 ) ( OBJ-AT ?auto_65903 ?auto_65904 ) ( TRUCK-AT ?auto_65906 ?auto_65901 ) ( not ( = ?auto_65907 ?auto_65902 ) ) ( IN-TRUCK ?auto_65907 ?auto_65906 ) ( not ( = ?auto_65903 ?auto_65907 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_65903 ?auto_65901 )
      ( DELIVER-2PKG-VERIFY ?auto_65902 ?auto_65903 ?auto_65901 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_65909 - OBJ
      ?auto_65910 - OBJ
      ?auto_65908 - LOCATION
    )
    :vars
    (
      ?auto_65914 - OBJ
      ?auto_65911 - LOCATION
      ?auto_65912 - CITY
      ?auto_65913 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_65910 ?auto_65909 ) ) ( not ( = ?auto_65910 ?auto_65914 ) ) ( IN-CITY ?auto_65911 ?auto_65912 ) ( IN-CITY ?auto_65908 ?auto_65912 ) ( not ( = ?auto_65908 ?auto_65911 ) ) ( OBJ-AT ?auto_65914 ?auto_65908 ) ( OBJ-AT ?auto_65910 ?auto_65911 ) ( TRUCK-AT ?auto_65913 ?auto_65908 ) ( not ( = ?auto_65909 ?auto_65914 ) ) ( IN-TRUCK ?auto_65909 ?auto_65913 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_65914 ?auto_65910 ?auto_65908 )
      ( DELIVER-2PKG-VERIFY ?auto_65909 ?auto_65910 ?auto_65908 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_65916 - OBJ
      ?auto_65917 - OBJ
      ?auto_65915 - LOCATION
    )
    :vars
    (
      ?auto_65918 - LOCATION
      ?auto_65919 - CITY
      ?auto_65920 - TRUCK
      ?auto_65921 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_65917 ?auto_65916 ) ) ( IN-CITY ?auto_65918 ?auto_65919 ) ( IN-CITY ?auto_65915 ?auto_65919 ) ( not ( = ?auto_65915 ?auto_65918 ) ) ( OBJ-AT ?auto_65917 ?auto_65915 ) ( OBJ-AT ?auto_65916 ?auto_65918 ) ( TRUCK-AT ?auto_65920 ?auto_65915 ) ( not ( = ?auto_65921 ?auto_65917 ) ) ( IN-TRUCK ?auto_65921 ?auto_65920 ) ( not ( = ?auto_65916 ?auto_65921 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_65917 ?auto_65916 ?auto_65915 )
      ( DELIVER-2PKG-VERIFY ?auto_65916 ?auto_65917 ?auto_65915 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_65923 - OBJ
      ?auto_65924 - OBJ
      ?auto_65922 - LOCATION
    )
    :vars
    (
      ?auto_65928 - OBJ
      ?auto_65925 - LOCATION
      ?auto_65926 - CITY
      ?auto_65927 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_65924 ?auto_65923 ) ) ( not ( = ?auto_65923 ?auto_65928 ) ) ( IN-CITY ?auto_65925 ?auto_65926 ) ( IN-CITY ?auto_65922 ?auto_65926 ) ( not ( = ?auto_65922 ?auto_65925 ) ) ( OBJ-AT ?auto_65928 ?auto_65922 ) ( OBJ-AT ?auto_65923 ?auto_65925 ) ( TRUCK-AT ?auto_65927 ?auto_65922 ) ( not ( = ?auto_65924 ?auto_65928 ) ) ( IN-TRUCK ?auto_65924 ?auto_65927 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_65928 ?auto_65923 ?auto_65922 )
      ( DELIVER-2PKG-VERIFY ?auto_65923 ?auto_65924 ?auto_65922 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_65946 - OBJ
      ?auto_65947 - OBJ
      ?auto_65948 - OBJ
      ?auto_65945 - LOCATION
    )
    :vars
    (
      ?auto_65949 - LOCATION
      ?auto_65950 - CITY
      ?auto_65951 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_65947 ?auto_65946 ) ) ( not ( = ?auto_65948 ?auto_65946 ) ) ( not ( = ?auto_65948 ?auto_65947 ) ) ( IN-CITY ?auto_65949 ?auto_65950 ) ( IN-CITY ?auto_65945 ?auto_65950 ) ( not ( = ?auto_65945 ?auto_65949 ) ) ( OBJ-AT ?auto_65946 ?auto_65945 ) ( OBJ-AT ?auto_65948 ?auto_65949 ) ( TRUCK-AT ?auto_65951 ?auto_65945 ) ( IN-TRUCK ?auto_65947 ?auto_65951 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_65946 ?auto_65948 ?auto_65945 )
      ( DELIVER-3PKG-VERIFY ?auto_65946 ?auto_65947 ?auto_65948 ?auto_65945 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_65961 - OBJ
      ?auto_65962 - OBJ
      ?auto_65963 - OBJ
      ?auto_65960 - LOCATION
    )
    :vars
    (
      ?auto_65964 - LOCATION
      ?auto_65965 - CITY
      ?auto_65966 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_65962 ?auto_65961 ) ) ( not ( = ?auto_65963 ?auto_65961 ) ) ( not ( = ?auto_65963 ?auto_65962 ) ) ( IN-CITY ?auto_65964 ?auto_65965 ) ( IN-CITY ?auto_65960 ?auto_65965 ) ( not ( = ?auto_65960 ?auto_65964 ) ) ( OBJ-AT ?auto_65961 ?auto_65960 ) ( OBJ-AT ?auto_65962 ?auto_65964 ) ( TRUCK-AT ?auto_65966 ?auto_65960 ) ( IN-TRUCK ?auto_65963 ?auto_65966 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_65961 ?auto_65962 ?auto_65960 )
      ( DELIVER-3PKG-VERIFY ?auto_65961 ?auto_65962 ?auto_65963 ?auto_65960 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_65976 - OBJ
      ?auto_65977 - OBJ
      ?auto_65978 - OBJ
      ?auto_65975 - LOCATION
    )
    :vars
    (
      ?auto_65979 - LOCATION
      ?auto_65980 - CITY
      ?auto_65981 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_65977 ?auto_65976 ) ) ( not ( = ?auto_65978 ?auto_65976 ) ) ( not ( = ?auto_65978 ?auto_65977 ) ) ( IN-CITY ?auto_65979 ?auto_65980 ) ( IN-CITY ?auto_65975 ?auto_65980 ) ( not ( = ?auto_65975 ?auto_65979 ) ) ( OBJ-AT ?auto_65977 ?auto_65975 ) ( OBJ-AT ?auto_65978 ?auto_65979 ) ( TRUCK-AT ?auto_65981 ?auto_65975 ) ( IN-TRUCK ?auto_65976 ?auto_65981 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_65977 ?auto_65978 ?auto_65975 )
      ( DELIVER-3PKG-VERIFY ?auto_65976 ?auto_65977 ?auto_65978 ?auto_65975 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_65991 - OBJ
      ?auto_65992 - OBJ
      ?auto_65993 - OBJ
      ?auto_65990 - LOCATION
    )
    :vars
    (
      ?auto_65994 - LOCATION
      ?auto_65995 - CITY
      ?auto_65996 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_65992 ?auto_65991 ) ) ( not ( = ?auto_65993 ?auto_65991 ) ) ( not ( = ?auto_65993 ?auto_65992 ) ) ( IN-CITY ?auto_65994 ?auto_65995 ) ( IN-CITY ?auto_65990 ?auto_65995 ) ( not ( = ?auto_65990 ?auto_65994 ) ) ( OBJ-AT ?auto_65993 ?auto_65990 ) ( OBJ-AT ?auto_65992 ?auto_65994 ) ( TRUCK-AT ?auto_65996 ?auto_65990 ) ( IN-TRUCK ?auto_65991 ?auto_65996 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_65993 ?auto_65992 ?auto_65990 )
      ( DELIVER-3PKG-VERIFY ?auto_65991 ?auto_65992 ?auto_65993 ?auto_65990 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_66022 - OBJ
      ?auto_66023 - OBJ
      ?auto_66024 - OBJ
      ?auto_66021 - LOCATION
    )
    :vars
    (
      ?auto_66025 - LOCATION
      ?auto_66026 - CITY
      ?auto_66027 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_66023 ?auto_66022 ) ) ( not ( = ?auto_66024 ?auto_66022 ) ) ( not ( = ?auto_66024 ?auto_66023 ) ) ( IN-CITY ?auto_66025 ?auto_66026 ) ( IN-CITY ?auto_66021 ?auto_66026 ) ( not ( = ?auto_66021 ?auto_66025 ) ) ( OBJ-AT ?auto_66023 ?auto_66021 ) ( OBJ-AT ?auto_66022 ?auto_66025 ) ( TRUCK-AT ?auto_66027 ?auto_66021 ) ( IN-TRUCK ?auto_66024 ?auto_66027 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_66023 ?auto_66022 ?auto_66021 )
      ( DELIVER-3PKG-VERIFY ?auto_66022 ?auto_66023 ?auto_66024 ?auto_66021 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_66037 - OBJ
      ?auto_66038 - OBJ
      ?auto_66039 - OBJ
      ?auto_66036 - LOCATION
    )
    :vars
    (
      ?auto_66040 - LOCATION
      ?auto_66041 - CITY
      ?auto_66042 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_66038 ?auto_66037 ) ) ( not ( = ?auto_66039 ?auto_66037 ) ) ( not ( = ?auto_66039 ?auto_66038 ) ) ( IN-CITY ?auto_66040 ?auto_66041 ) ( IN-CITY ?auto_66036 ?auto_66041 ) ( not ( = ?auto_66036 ?auto_66040 ) ) ( OBJ-AT ?auto_66039 ?auto_66036 ) ( OBJ-AT ?auto_66037 ?auto_66040 ) ( TRUCK-AT ?auto_66042 ?auto_66036 ) ( IN-TRUCK ?auto_66038 ?auto_66042 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_66039 ?auto_66037 ?auto_66036 )
      ( DELIVER-3PKG-VERIFY ?auto_66037 ?auto_66038 ?auto_66039 ?auto_66036 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_66635 - OBJ
      ?auto_66634 - LOCATION
    )
    :vars
    (
      ?auto_66640 - OBJ
      ?auto_66636 - LOCATION
      ?auto_66637 - CITY
      ?auto_66639 - OBJ
      ?auto_66638 - TRUCK
      ?auto_66641 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_66635 ?auto_66640 ) ) ( IN-CITY ?auto_66636 ?auto_66637 ) ( IN-CITY ?auto_66634 ?auto_66637 ) ( not ( = ?auto_66634 ?auto_66636 ) ) ( OBJ-AT ?auto_66640 ?auto_66634 ) ( OBJ-AT ?auto_66635 ?auto_66636 ) ( not ( = ?auto_66639 ?auto_66640 ) ) ( IN-TRUCK ?auto_66639 ?auto_66638 ) ( not ( = ?auto_66635 ?auto_66639 ) ) ( TRUCK-AT ?auto_66638 ?auto_66641 ) ( IN-CITY ?auto_66641 ?auto_66637 ) ( not ( = ?auto_66634 ?auto_66641 ) ) ( not ( = ?auto_66636 ?auto_66641 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_66638 ?auto_66641 ?auto_66634 ?auto_66637 )
      ( DELIVER-2PKG ?auto_66640 ?auto_66635 ?auto_66634 )
      ( DELIVER-1PKG-VERIFY ?auto_66635 ?auto_66634 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_66643 - OBJ
      ?auto_66644 - OBJ
      ?auto_66642 - LOCATION
    )
    :vars
    (
      ?auto_66648 - LOCATION
      ?auto_66645 - CITY
      ?auto_66647 - OBJ
      ?auto_66646 - TRUCK
      ?auto_66649 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_66644 ?auto_66643 ) ) ( IN-CITY ?auto_66648 ?auto_66645 ) ( IN-CITY ?auto_66642 ?auto_66645 ) ( not ( = ?auto_66642 ?auto_66648 ) ) ( OBJ-AT ?auto_66643 ?auto_66642 ) ( OBJ-AT ?auto_66644 ?auto_66648 ) ( not ( = ?auto_66647 ?auto_66643 ) ) ( IN-TRUCK ?auto_66647 ?auto_66646 ) ( not ( = ?auto_66644 ?auto_66647 ) ) ( TRUCK-AT ?auto_66646 ?auto_66649 ) ( IN-CITY ?auto_66649 ?auto_66645 ) ( not ( = ?auto_66642 ?auto_66649 ) ) ( not ( = ?auto_66648 ?auto_66649 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_66644 ?auto_66642 )
      ( DELIVER-2PKG-VERIFY ?auto_66643 ?auto_66644 ?auto_66642 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_66651 - OBJ
      ?auto_66652 - OBJ
      ?auto_66650 - LOCATION
    )
    :vars
    (
      ?auto_66656 - OBJ
      ?auto_66657 - LOCATION
      ?auto_66654 - CITY
      ?auto_66655 - TRUCK
      ?auto_66653 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_66652 ?auto_66651 ) ) ( not ( = ?auto_66652 ?auto_66656 ) ) ( IN-CITY ?auto_66657 ?auto_66654 ) ( IN-CITY ?auto_66650 ?auto_66654 ) ( not ( = ?auto_66650 ?auto_66657 ) ) ( OBJ-AT ?auto_66656 ?auto_66650 ) ( OBJ-AT ?auto_66652 ?auto_66657 ) ( not ( = ?auto_66651 ?auto_66656 ) ) ( IN-TRUCK ?auto_66651 ?auto_66655 ) ( TRUCK-AT ?auto_66655 ?auto_66653 ) ( IN-CITY ?auto_66653 ?auto_66654 ) ( not ( = ?auto_66650 ?auto_66653 ) ) ( not ( = ?auto_66657 ?auto_66653 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_66656 ?auto_66652 ?auto_66650 )
      ( DELIVER-2PKG-VERIFY ?auto_66651 ?auto_66652 ?auto_66650 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_66659 - OBJ
      ?auto_66660 - OBJ
      ?auto_66658 - LOCATION
    )
    :vars
    (
      ?auto_66665 - LOCATION
      ?auto_66663 - CITY
      ?auto_66662 - OBJ
      ?auto_66664 - TRUCK
      ?auto_66661 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_66660 ?auto_66659 ) ) ( IN-CITY ?auto_66665 ?auto_66663 ) ( IN-CITY ?auto_66658 ?auto_66663 ) ( not ( = ?auto_66658 ?auto_66665 ) ) ( OBJ-AT ?auto_66660 ?auto_66658 ) ( OBJ-AT ?auto_66659 ?auto_66665 ) ( not ( = ?auto_66662 ?auto_66660 ) ) ( IN-TRUCK ?auto_66662 ?auto_66664 ) ( not ( = ?auto_66659 ?auto_66662 ) ) ( TRUCK-AT ?auto_66664 ?auto_66661 ) ( IN-CITY ?auto_66661 ?auto_66663 ) ( not ( = ?auto_66658 ?auto_66661 ) ) ( not ( = ?auto_66665 ?auto_66661 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_66660 ?auto_66659 ?auto_66658 )
      ( DELIVER-2PKG-VERIFY ?auto_66659 ?auto_66660 ?auto_66658 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_66667 - OBJ
      ?auto_66668 - OBJ
      ?auto_66666 - LOCATION
    )
    :vars
    (
      ?auto_66672 - OBJ
      ?auto_66673 - LOCATION
      ?auto_66670 - CITY
      ?auto_66671 - TRUCK
      ?auto_66669 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_66668 ?auto_66667 ) ) ( not ( = ?auto_66667 ?auto_66672 ) ) ( IN-CITY ?auto_66673 ?auto_66670 ) ( IN-CITY ?auto_66666 ?auto_66670 ) ( not ( = ?auto_66666 ?auto_66673 ) ) ( OBJ-AT ?auto_66672 ?auto_66666 ) ( OBJ-AT ?auto_66667 ?auto_66673 ) ( not ( = ?auto_66668 ?auto_66672 ) ) ( IN-TRUCK ?auto_66668 ?auto_66671 ) ( TRUCK-AT ?auto_66671 ?auto_66669 ) ( IN-CITY ?auto_66669 ?auto_66670 ) ( not ( = ?auto_66666 ?auto_66669 ) ) ( not ( = ?auto_66673 ?auto_66669 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_66672 ?auto_66667 ?auto_66666 )
      ( DELIVER-2PKG-VERIFY ?auto_66667 ?auto_66668 ?auto_66666 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_66693 - OBJ
      ?auto_66694 - OBJ
      ?auto_66695 - OBJ
      ?auto_66692 - LOCATION
    )
    :vars
    (
      ?auto_66699 - LOCATION
      ?auto_66697 - CITY
      ?auto_66698 - TRUCK
      ?auto_66696 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_66694 ?auto_66693 ) ) ( not ( = ?auto_66695 ?auto_66693 ) ) ( not ( = ?auto_66695 ?auto_66694 ) ) ( IN-CITY ?auto_66699 ?auto_66697 ) ( IN-CITY ?auto_66692 ?auto_66697 ) ( not ( = ?auto_66692 ?auto_66699 ) ) ( OBJ-AT ?auto_66693 ?auto_66692 ) ( OBJ-AT ?auto_66695 ?auto_66699 ) ( IN-TRUCK ?auto_66694 ?auto_66698 ) ( TRUCK-AT ?auto_66698 ?auto_66696 ) ( IN-CITY ?auto_66696 ?auto_66697 ) ( not ( = ?auto_66692 ?auto_66696 ) ) ( not ( = ?auto_66699 ?auto_66696 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_66693 ?auto_66695 ?auto_66692 )
      ( DELIVER-3PKG-VERIFY ?auto_66693 ?auto_66694 ?auto_66695 ?auto_66692 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_66710 - OBJ
      ?auto_66711 - OBJ
      ?auto_66712 - OBJ
      ?auto_66709 - LOCATION
    )
    :vars
    (
      ?auto_66716 - LOCATION
      ?auto_66714 - CITY
      ?auto_66715 - TRUCK
      ?auto_66713 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_66711 ?auto_66710 ) ) ( not ( = ?auto_66712 ?auto_66710 ) ) ( not ( = ?auto_66712 ?auto_66711 ) ) ( IN-CITY ?auto_66716 ?auto_66714 ) ( IN-CITY ?auto_66709 ?auto_66714 ) ( not ( = ?auto_66709 ?auto_66716 ) ) ( OBJ-AT ?auto_66710 ?auto_66709 ) ( OBJ-AT ?auto_66711 ?auto_66716 ) ( IN-TRUCK ?auto_66712 ?auto_66715 ) ( TRUCK-AT ?auto_66715 ?auto_66713 ) ( IN-CITY ?auto_66713 ?auto_66714 ) ( not ( = ?auto_66709 ?auto_66713 ) ) ( not ( = ?auto_66716 ?auto_66713 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_66710 ?auto_66711 ?auto_66709 )
      ( DELIVER-3PKG-VERIFY ?auto_66710 ?auto_66711 ?auto_66712 ?auto_66709 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_66727 - OBJ
      ?auto_66728 - OBJ
      ?auto_66729 - OBJ
      ?auto_66726 - LOCATION
    )
    :vars
    (
      ?auto_66733 - LOCATION
      ?auto_66731 - CITY
      ?auto_66732 - TRUCK
      ?auto_66730 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_66728 ?auto_66727 ) ) ( not ( = ?auto_66729 ?auto_66727 ) ) ( not ( = ?auto_66729 ?auto_66728 ) ) ( IN-CITY ?auto_66733 ?auto_66731 ) ( IN-CITY ?auto_66726 ?auto_66731 ) ( not ( = ?auto_66726 ?auto_66733 ) ) ( OBJ-AT ?auto_66728 ?auto_66726 ) ( OBJ-AT ?auto_66729 ?auto_66733 ) ( IN-TRUCK ?auto_66727 ?auto_66732 ) ( TRUCK-AT ?auto_66732 ?auto_66730 ) ( IN-CITY ?auto_66730 ?auto_66731 ) ( not ( = ?auto_66726 ?auto_66730 ) ) ( not ( = ?auto_66733 ?auto_66730 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_66728 ?auto_66729 ?auto_66726 )
      ( DELIVER-3PKG-VERIFY ?auto_66727 ?auto_66728 ?auto_66729 ?auto_66726 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_66744 - OBJ
      ?auto_66745 - OBJ
      ?auto_66746 - OBJ
      ?auto_66743 - LOCATION
    )
    :vars
    (
      ?auto_66750 - LOCATION
      ?auto_66748 - CITY
      ?auto_66749 - TRUCK
      ?auto_66747 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_66745 ?auto_66744 ) ) ( not ( = ?auto_66746 ?auto_66744 ) ) ( not ( = ?auto_66746 ?auto_66745 ) ) ( IN-CITY ?auto_66750 ?auto_66748 ) ( IN-CITY ?auto_66743 ?auto_66748 ) ( not ( = ?auto_66743 ?auto_66750 ) ) ( OBJ-AT ?auto_66746 ?auto_66743 ) ( OBJ-AT ?auto_66745 ?auto_66750 ) ( IN-TRUCK ?auto_66744 ?auto_66749 ) ( TRUCK-AT ?auto_66749 ?auto_66747 ) ( IN-CITY ?auto_66747 ?auto_66748 ) ( not ( = ?auto_66743 ?auto_66747 ) ) ( not ( = ?auto_66750 ?auto_66747 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_66746 ?auto_66745 ?auto_66743 )
      ( DELIVER-3PKG-VERIFY ?auto_66744 ?auto_66745 ?auto_66746 ?auto_66743 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_66779 - OBJ
      ?auto_66780 - OBJ
      ?auto_66781 - OBJ
      ?auto_66778 - LOCATION
    )
    :vars
    (
      ?auto_66785 - LOCATION
      ?auto_66783 - CITY
      ?auto_66784 - TRUCK
      ?auto_66782 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_66780 ?auto_66779 ) ) ( not ( = ?auto_66781 ?auto_66779 ) ) ( not ( = ?auto_66781 ?auto_66780 ) ) ( IN-CITY ?auto_66785 ?auto_66783 ) ( IN-CITY ?auto_66778 ?auto_66783 ) ( not ( = ?auto_66778 ?auto_66785 ) ) ( OBJ-AT ?auto_66780 ?auto_66778 ) ( OBJ-AT ?auto_66779 ?auto_66785 ) ( IN-TRUCK ?auto_66781 ?auto_66784 ) ( TRUCK-AT ?auto_66784 ?auto_66782 ) ( IN-CITY ?auto_66782 ?auto_66783 ) ( not ( = ?auto_66778 ?auto_66782 ) ) ( not ( = ?auto_66785 ?auto_66782 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_66780 ?auto_66779 ?auto_66778 )
      ( DELIVER-3PKG-VERIFY ?auto_66779 ?auto_66780 ?auto_66781 ?auto_66778 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_66796 - OBJ
      ?auto_66797 - OBJ
      ?auto_66798 - OBJ
      ?auto_66795 - LOCATION
    )
    :vars
    (
      ?auto_66802 - LOCATION
      ?auto_66800 - CITY
      ?auto_66801 - TRUCK
      ?auto_66799 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_66797 ?auto_66796 ) ) ( not ( = ?auto_66798 ?auto_66796 ) ) ( not ( = ?auto_66798 ?auto_66797 ) ) ( IN-CITY ?auto_66802 ?auto_66800 ) ( IN-CITY ?auto_66795 ?auto_66800 ) ( not ( = ?auto_66795 ?auto_66802 ) ) ( OBJ-AT ?auto_66798 ?auto_66795 ) ( OBJ-AT ?auto_66796 ?auto_66802 ) ( IN-TRUCK ?auto_66797 ?auto_66801 ) ( TRUCK-AT ?auto_66801 ?auto_66799 ) ( IN-CITY ?auto_66799 ?auto_66800 ) ( not ( = ?auto_66795 ?auto_66799 ) ) ( not ( = ?auto_66802 ?auto_66799 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_66798 ?auto_66796 ?auto_66795 )
      ( DELIVER-3PKG-VERIFY ?auto_66796 ?auto_66797 ?auto_66798 ?auto_66795 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_67465 - OBJ
      ?auto_67464 - LOCATION
    )
    :vars
    (
      ?auto_67470 - OBJ
      ?auto_67471 - LOCATION
      ?auto_67468 - CITY
      ?auto_67467 - OBJ
      ?auto_67469 - TRUCK
      ?auto_67466 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_67465 ?auto_67470 ) ) ( IN-CITY ?auto_67471 ?auto_67468 ) ( IN-CITY ?auto_67464 ?auto_67468 ) ( not ( = ?auto_67464 ?auto_67471 ) ) ( OBJ-AT ?auto_67470 ?auto_67464 ) ( OBJ-AT ?auto_67465 ?auto_67471 ) ( not ( = ?auto_67467 ?auto_67470 ) ) ( not ( = ?auto_67465 ?auto_67467 ) ) ( TRUCK-AT ?auto_67469 ?auto_67466 ) ( IN-CITY ?auto_67466 ?auto_67468 ) ( not ( = ?auto_67464 ?auto_67466 ) ) ( not ( = ?auto_67471 ?auto_67466 ) ) ( OBJ-AT ?auto_67467 ?auto_67466 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_67467 ?auto_67469 ?auto_67466 )
      ( DELIVER-2PKG ?auto_67470 ?auto_67465 ?auto_67464 )
      ( DELIVER-1PKG-VERIFY ?auto_67465 ?auto_67464 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_67473 - OBJ
      ?auto_67474 - OBJ
      ?auto_67472 - LOCATION
    )
    :vars
    (
      ?auto_67478 - LOCATION
      ?auto_67479 - CITY
      ?auto_67475 - OBJ
      ?auto_67476 - TRUCK
      ?auto_67477 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_67474 ?auto_67473 ) ) ( IN-CITY ?auto_67478 ?auto_67479 ) ( IN-CITY ?auto_67472 ?auto_67479 ) ( not ( = ?auto_67472 ?auto_67478 ) ) ( OBJ-AT ?auto_67473 ?auto_67472 ) ( OBJ-AT ?auto_67474 ?auto_67478 ) ( not ( = ?auto_67475 ?auto_67473 ) ) ( not ( = ?auto_67474 ?auto_67475 ) ) ( TRUCK-AT ?auto_67476 ?auto_67477 ) ( IN-CITY ?auto_67477 ?auto_67479 ) ( not ( = ?auto_67472 ?auto_67477 ) ) ( not ( = ?auto_67478 ?auto_67477 ) ) ( OBJ-AT ?auto_67475 ?auto_67477 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_67474 ?auto_67472 )
      ( DELIVER-2PKG-VERIFY ?auto_67473 ?auto_67474 ?auto_67472 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_67481 - OBJ
      ?auto_67482 - OBJ
      ?auto_67480 - LOCATION
    )
    :vars
    (
      ?auto_67487 - OBJ
      ?auto_67485 - LOCATION
      ?auto_67486 - CITY
      ?auto_67484 - TRUCK
      ?auto_67483 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_67482 ?auto_67481 ) ) ( not ( = ?auto_67482 ?auto_67487 ) ) ( IN-CITY ?auto_67485 ?auto_67486 ) ( IN-CITY ?auto_67480 ?auto_67486 ) ( not ( = ?auto_67480 ?auto_67485 ) ) ( OBJ-AT ?auto_67487 ?auto_67480 ) ( OBJ-AT ?auto_67482 ?auto_67485 ) ( not ( = ?auto_67481 ?auto_67487 ) ) ( TRUCK-AT ?auto_67484 ?auto_67483 ) ( IN-CITY ?auto_67483 ?auto_67486 ) ( not ( = ?auto_67480 ?auto_67483 ) ) ( not ( = ?auto_67485 ?auto_67483 ) ) ( OBJ-AT ?auto_67481 ?auto_67483 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_67487 ?auto_67482 ?auto_67480 )
      ( DELIVER-2PKG-VERIFY ?auto_67481 ?auto_67482 ?auto_67480 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_67489 - OBJ
      ?auto_67490 - OBJ
      ?auto_67488 - LOCATION
    )
    :vars
    (
      ?auto_67494 - LOCATION
      ?auto_67495 - CITY
      ?auto_67491 - OBJ
      ?auto_67493 - TRUCK
      ?auto_67492 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_67490 ?auto_67489 ) ) ( IN-CITY ?auto_67494 ?auto_67495 ) ( IN-CITY ?auto_67488 ?auto_67495 ) ( not ( = ?auto_67488 ?auto_67494 ) ) ( OBJ-AT ?auto_67490 ?auto_67488 ) ( OBJ-AT ?auto_67489 ?auto_67494 ) ( not ( = ?auto_67491 ?auto_67490 ) ) ( not ( = ?auto_67489 ?auto_67491 ) ) ( TRUCK-AT ?auto_67493 ?auto_67492 ) ( IN-CITY ?auto_67492 ?auto_67495 ) ( not ( = ?auto_67488 ?auto_67492 ) ) ( not ( = ?auto_67494 ?auto_67492 ) ) ( OBJ-AT ?auto_67491 ?auto_67492 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_67490 ?auto_67489 ?auto_67488 )
      ( DELIVER-2PKG-VERIFY ?auto_67489 ?auto_67490 ?auto_67488 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_67497 - OBJ
      ?auto_67498 - OBJ
      ?auto_67496 - LOCATION
    )
    :vars
    (
      ?auto_67503 - OBJ
      ?auto_67501 - LOCATION
      ?auto_67502 - CITY
      ?auto_67500 - TRUCK
      ?auto_67499 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_67498 ?auto_67497 ) ) ( not ( = ?auto_67497 ?auto_67503 ) ) ( IN-CITY ?auto_67501 ?auto_67502 ) ( IN-CITY ?auto_67496 ?auto_67502 ) ( not ( = ?auto_67496 ?auto_67501 ) ) ( OBJ-AT ?auto_67503 ?auto_67496 ) ( OBJ-AT ?auto_67497 ?auto_67501 ) ( not ( = ?auto_67498 ?auto_67503 ) ) ( TRUCK-AT ?auto_67500 ?auto_67499 ) ( IN-CITY ?auto_67499 ?auto_67502 ) ( not ( = ?auto_67496 ?auto_67499 ) ) ( not ( = ?auto_67501 ?auto_67499 ) ) ( OBJ-AT ?auto_67498 ?auto_67499 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_67503 ?auto_67497 ?auto_67496 )
      ( DELIVER-2PKG-VERIFY ?auto_67497 ?auto_67498 ?auto_67496 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_67523 - OBJ
      ?auto_67524 - OBJ
      ?auto_67525 - OBJ
      ?auto_67522 - LOCATION
    )
    :vars
    (
      ?auto_67528 - LOCATION
      ?auto_67529 - CITY
      ?auto_67527 - TRUCK
      ?auto_67526 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_67524 ?auto_67523 ) ) ( not ( = ?auto_67525 ?auto_67523 ) ) ( not ( = ?auto_67525 ?auto_67524 ) ) ( IN-CITY ?auto_67528 ?auto_67529 ) ( IN-CITY ?auto_67522 ?auto_67529 ) ( not ( = ?auto_67522 ?auto_67528 ) ) ( OBJ-AT ?auto_67523 ?auto_67522 ) ( OBJ-AT ?auto_67525 ?auto_67528 ) ( TRUCK-AT ?auto_67527 ?auto_67526 ) ( IN-CITY ?auto_67526 ?auto_67529 ) ( not ( = ?auto_67522 ?auto_67526 ) ) ( not ( = ?auto_67528 ?auto_67526 ) ) ( OBJ-AT ?auto_67524 ?auto_67526 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_67523 ?auto_67525 ?auto_67522 )
      ( DELIVER-3PKG-VERIFY ?auto_67523 ?auto_67524 ?auto_67525 ?auto_67522 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_67540 - OBJ
      ?auto_67541 - OBJ
      ?auto_67542 - OBJ
      ?auto_67539 - LOCATION
    )
    :vars
    (
      ?auto_67545 - LOCATION
      ?auto_67546 - CITY
      ?auto_67544 - TRUCK
      ?auto_67543 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_67541 ?auto_67540 ) ) ( not ( = ?auto_67542 ?auto_67540 ) ) ( not ( = ?auto_67542 ?auto_67541 ) ) ( IN-CITY ?auto_67545 ?auto_67546 ) ( IN-CITY ?auto_67539 ?auto_67546 ) ( not ( = ?auto_67539 ?auto_67545 ) ) ( OBJ-AT ?auto_67540 ?auto_67539 ) ( OBJ-AT ?auto_67541 ?auto_67545 ) ( TRUCK-AT ?auto_67544 ?auto_67543 ) ( IN-CITY ?auto_67543 ?auto_67546 ) ( not ( = ?auto_67539 ?auto_67543 ) ) ( not ( = ?auto_67545 ?auto_67543 ) ) ( OBJ-AT ?auto_67542 ?auto_67543 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_67540 ?auto_67541 ?auto_67539 )
      ( DELIVER-3PKG-VERIFY ?auto_67540 ?auto_67541 ?auto_67542 ?auto_67539 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_67557 - OBJ
      ?auto_67558 - OBJ
      ?auto_67559 - OBJ
      ?auto_67556 - LOCATION
    )
    :vars
    (
      ?auto_67562 - LOCATION
      ?auto_67563 - CITY
      ?auto_67561 - TRUCK
      ?auto_67560 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_67558 ?auto_67557 ) ) ( not ( = ?auto_67559 ?auto_67557 ) ) ( not ( = ?auto_67559 ?auto_67558 ) ) ( IN-CITY ?auto_67562 ?auto_67563 ) ( IN-CITY ?auto_67556 ?auto_67563 ) ( not ( = ?auto_67556 ?auto_67562 ) ) ( OBJ-AT ?auto_67558 ?auto_67556 ) ( OBJ-AT ?auto_67559 ?auto_67562 ) ( TRUCK-AT ?auto_67561 ?auto_67560 ) ( IN-CITY ?auto_67560 ?auto_67563 ) ( not ( = ?auto_67556 ?auto_67560 ) ) ( not ( = ?auto_67562 ?auto_67560 ) ) ( OBJ-AT ?auto_67557 ?auto_67560 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_67558 ?auto_67559 ?auto_67556 )
      ( DELIVER-3PKG-VERIFY ?auto_67557 ?auto_67558 ?auto_67559 ?auto_67556 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_67574 - OBJ
      ?auto_67575 - OBJ
      ?auto_67576 - OBJ
      ?auto_67573 - LOCATION
    )
    :vars
    (
      ?auto_67579 - LOCATION
      ?auto_67580 - CITY
      ?auto_67578 - TRUCK
      ?auto_67577 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_67575 ?auto_67574 ) ) ( not ( = ?auto_67576 ?auto_67574 ) ) ( not ( = ?auto_67576 ?auto_67575 ) ) ( IN-CITY ?auto_67579 ?auto_67580 ) ( IN-CITY ?auto_67573 ?auto_67580 ) ( not ( = ?auto_67573 ?auto_67579 ) ) ( OBJ-AT ?auto_67576 ?auto_67573 ) ( OBJ-AT ?auto_67575 ?auto_67579 ) ( TRUCK-AT ?auto_67578 ?auto_67577 ) ( IN-CITY ?auto_67577 ?auto_67580 ) ( not ( = ?auto_67573 ?auto_67577 ) ) ( not ( = ?auto_67579 ?auto_67577 ) ) ( OBJ-AT ?auto_67574 ?auto_67577 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_67576 ?auto_67575 ?auto_67573 )
      ( DELIVER-3PKG-VERIFY ?auto_67574 ?auto_67575 ?auto_67576 ?auto_67573 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_67609 - OBJ
      ?auto_67610 - OBJ
      ?auto_67611 - OBJ
      ?auto_67608 - LOCATION
    )
    :vars
    (
      ?auto_67614 - LOCATION
      ?auto_67615 - CITY
      ?auto_67613 - TRUCK
      ?auto_67612 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_67610 ?auto_67609 ) ) ( not ( = ?auto_67611 ?auto_67609 ) ) ( not ( = ?auto_67611 ?auto_67610 ) ) ( IN-CITY ?auto_67614 ?auto_67615 ) ( IN-CITY ?auto_67608 ?auto_67615 ) ( not ( = ?auto_67608 ?auto_67614 ) ) ( OBJ-AT ?auto_67610 ?auto_67608 ) ( OBJ-AT ?auto_67609 ?auto_67614 ) ( TRUCK-AT ?auto_67613 ?auto_67612 ) ( IN-CITY ?auto_67612 ?auto_67615 ) ( not ( = ?auto_67608 ?auto_67612 ) ) ( not ( = ?auto_67614 ?auto_67612 ) ) ( OBJ-AT ?auto_67611 ?auto_67612 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_67610 ?auto_67609 ?auto_67608 )
      ( DELIVER-3PKG-VERIFY ?auto_67609 ?auto_67610 ?auto_67611 ?auto_67608 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_67626 - OBJ
      ?auto_67627 - OBJ
      ?auto_67628 - OBJ
      ?auto_67625 - LOCATION
    )
    :vars
    (
      ?auto_67631 - LOCATION
      ?auto_67632 - CITY
      ?auto_67630 - TRUCK
      ?auto_67629 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_67627 ?auto_67626 ) ) ( not ( = ?auto_67628 ?auto_67626 ) ) ( not ( = ?auto_67628 ?auto_67627 ) ) ( IN-CITY ?auto_67631 ?auto_67632 ) ( IN-CITY ?auto_67625 ?auto_67632 ) ( not ( = ?auto_67625 ?auto_67631 ) ) ( OBJ-AT ?auto_67628 ?auto_67625 ) ( OBJ-AT ?auto_67626 ?auto_67631 ) ( TRUCK-AT ?auto_67630 ?auto_67629 ) ( IN-CITY ?auto_67629 ?auto_67632 ) ( not ( = ?auto_67625 ?auto_67629 ) ) ( not ( = ?auto_67631 ?auto_67629 ) ) ( OBJ-AT ?auto_67627 ?auto_67629 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_67628 ?auto_67626 ?auto_67625 )
      ( DELIVER-3PKG-VERIFY ?auto_67626 ?auto_67627 ?auto_67628 ?auto_67625 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_68295 - OBJ
      ?auto_68294 - LOCATION
    )
    :vars
    (
      ?auto_68301 - OBJ
      ?auto_68299 - LOCATION
      ?auto_68300 - CITY
      ?auto_68296 - OBJ
      ?auto_68297 - LOCATION
      ?auto_68298 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_68295 ?auto_68301 ) ) ( IN-CITY ?auto_68299 ?auto_68300 ) ( IN-CITY ?auto_68294 ?auto_68300 ) ( not ( = ?auto_68294 ?auto_68299 ) ) ( OBJ-AT ?auto_68301 ?auto_68294 ) ( OBJ-AT ?auto_68295 ?auto_68299 ) ( not ( = ?auto_68296 ?auto_68301 ) ) ( not ( = ?auto_68295 ?auto_68296 ) ) ( IN-CITY ?auto_68297 ?auto_68300 ) ( not ( = ?auto_68294 ?auto_68297 ) ) ( not ( = ?auto_68299 ?auto_68297 ) ) ( OBJ-AT ?auto_68296 ?auto_68297 ) ( TRUCK-AT ?auto_68298 ?auto_68294 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_68298 ?auto_68294 ?auto_68297 ?auto_68300 )
      ( DELIVER-2PKG ?auto_68301 ?auto_68295 ?auto_68294 )
      ( DELIVER-1PKG-VERIFY ?auto_68295 ?auto_68294 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_68303 - OBJ
      ?auto_68304 - OBJ
      ?auto_68302 - LOCATION
    )
    :vars
    (
      ?auto_68305 - LOCATION
      ?auto_68308 - CITY
      ?auto_68306 - OBJ
      ?auto_68309 - LOCATION
      ?auto_68307 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_68304 ?auto_68303 ) ) ( IN-CITY ?auto_68305 ?auto_68308 ) ( IN-CITY ?auto_68302 ?auto_68308 ) ( not ( = ?auto_68302 ?auto_68305 ) ) ( OBJ-AT ?auto_68303 ?auto_68302 ) ( OBJ-AT ?auto_68304 ?auto_68305 ) ( not ( = ?auto_68306 ?auto_68303 ) ) ( not ( = ?auto_68304 ?auto_68306 ) ) ( IN-CITY ?auto_68309 ?auto_68308 ) ( not ( = ?auto_68302 ?auto_68309 ) ) ( not ( = ?auto_68305 ?auto_68309 ) ) ( OBJ-AT ?auto_68306 ?auto_68309 ) ( TRUCK-AT ?auto_68307 ?auto_68302 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_68304 ?auto_68302 )
      ( DELIVER-2PKG-VERIFY ?auto_68303 ?auto_68304 ?auto_68302 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_68311 - OBJ
      ?auto_68312 - OBJ
      ?auto_68310 - LOCATION
    )
    :vars
    (
      ?auto_68313 - OBJ
      ?auto_68315 - LOCATION
      ?auto_68317 - CITY
      ?auto_68314 - LOCATION
      ?auto_68316 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_68312 ?auto_68311 ) ) ( not ( = ?auto_68312 ?auto_68313 ) ) ( IN-CITY ?auto_68315 ?auto_68317 ) ( IN-CITY ?auto_68310 ?auto_68317 ) ( not ( = ?auto_68310 ?auto_68315 ) ) ( OBJ-AT ?auto_68313 ?auto_68310 ) ( OBJ-AT ?auto_68312 ?auto_68315 ) ( not ( = ?auto_68311 ?auto_68313 ) ) ( IN-CITY ?auto_68314 ?auto_68317 ) ( not ( = ?auto_68310 ?auto_68314 ) ) ( not ( = ?auto_68315 ?auto_68314 ) ) ( OBJ-AT ?auto_68311 ?auto_68314 ) ( TRUCK-AT ?auto_68316 ?auto_68310 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_68313 ?auto_68312 ?auto_68310 )
      ( DELIVER-2PKG-VERIFY ?auto_68311 ?auto_68312 ?auto_68310 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_68319 - OBJ
      ?auto_68320 - OBJ
      ?auto_68318 - LOCATION
    )
    :vars
    (
      ?auto_68323 - LOCATION
      ?auto_68325 - CITY
      ?auto_68321 - OBJ
      ?auto_68322 - LOCATION
      ?auto_68324 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_68320 ?auto_68319 ) ) ( IN-CITY ?auto_68323 ?auto_68325 ) ( IN-CITY ?auto_68318 ?auto_68325 ) ( not ( = ?auto_68318 ?auto_68323 ) ) ( OBJ-AT ?auto_68320 ?auto_68318 ) ( OBJ-AT ?auto_68319 ?auto_68323 ) ( not ( = ?auto_68321 ?auto_68320 ) ) ( not ( = ?auto_68319 ?auto_68321 ) ) ( IN-CITY ?auto_68322 ?auto_68325 ) ( not ( = ?auto_68318 ?auto_68322 ) ) ( not ( = ?auto_68323 ?auto_68322 ) ) ( OBJ-AT ?auto_68321 ?auto_68322 ) ( TRUCK-AT ?auto_68324 ?auto_68318 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_68320 ?auto_68319 ?auto_68318 )
      ( DELIVER-2PKG-VERIFY ?auto_68319 ?auto_68320 ?auto_68318 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_68327 - OBJ
      ?auto_68328 - OBJ
      ?auto_68326 - LOCATION
    )
    :vars
    (
      ?auto_68329 - OBJ
      ?auto_68331 - LOCATION
      ?auto_68333 - CITY
      ?auto_68330 - LOCATION
      ?auto_68332 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_68328 ?auto_68327 ) ) ( not ( = ?auto_68327 ?auto_68329 ) ) ( IN-CITY ?auto_68331 ?auto_68333 ) ( IN-CITY ?auto_68326 ?auto_68333 ) ( not ( = ?auto_68326 ?auto_68331 ) ) ( OBJ-AT ?auto_68329 ?auto_68326 ) ( OBJ-AT ?auto_68327 ?auto_68331 ) ( not ( = ?auto_68328 ?auto_68329 ) ) ( IN-CITY ?auto_68330 ?auto_68333 ) ( not ( = ?auto_68326 ?auto_68330 ) ) ( not ( = ?auto_68331 ?auto_68330 ) ) ( OBJ-AT ?auto_68328 ?auto_68330 ) ( TRUCK-AT ?auto_68332 ?auto_68326 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_68329 ?auto_68327 ?auto_68326 )
      ( DELIVER-2PKG-VERIFY ?auto_68327 ?auto_68328 ?auto_68326 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_68353 - OBJ
      ?auto_68354 - OBJ
      ?auto_68355 - OBJ
      ?auto_68352 - LOCATION
    )
    :vars
    (
      ?auto_68357 - LOCATION
      ?auto_68359 - CITY
      ?auto_68356 - LOCATION
      ?auto_68358 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_68354 ?auto_68353 ) ) ( not ( = ?auto_68355 ?auto_68353 ) ) ( not ( = ?auto_68355 ?auto_68354 ) ) ( IN-CITY ?auto_68357 ?auto_68359 ) ( IN-CITY ?auto_68352 ?auto_68359 ) ( not ( = ?auto_68352 ?auto_68357 ) ) ( OBJ-AT ?auto_68353 ?auto_68352 ) ( OBJ-AT ?auto_68355 ?auto_68357 ) ( IN-CITY ?auto_68356 ?auto_68359 ) ( not ( = ?auto_68352 ?auto_68356 ) ) ( not ( = ?auto_68357 ?auto_68356 ) ) ( OBJ-AT ?auto_68354 ?auto_68356 ) ( TRUCK-AT ?auto_68358 ?auto_68352 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_68353 ?auto_68355 ?auto_68352 )
      ( DELIVER-3PKG-VERIFY ?auto_68353 ?auto_68354 ?auto_68355 ?auto_68352 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_68370 - OBJ
      ?auto_68371 - OBJ
      ?auto_68372 - OBJ
      ?auto_68369 - LOCATION
    )
    :vars
    (
      ?auto_68374 - LOCATION
      ?auto_68376 - CITY
      ?auto_68373 - LOCATION
      ?auto_68375 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_68371 ?auto_68370 ) ) ( not ( = ?auto_68372 ?auto_68370 ) ) ( not ( = ?auto_68372 ?auto_68371 ) ) ( IN-CITY ?auto_68374 ?auto_68376 ) ( IN-CITY ?auto_68369 ?auto_68376 ) ( not ( = ?auto_68369 ?auto_68374 ) ) ( OBJ-AT ?auto_68370 ?auto_68369 ) ( OBJ-AT ?auto_68371 ?auto_68374 ) ( IN-CITY ?auto_68373 ?auto_68376 ) ( not ( = ?auto_68369 ?auto_68373 ) ) ( not ( = ?auto_68374 ?auto_68373 ) ) ( OBJ-AT ?auto_68372 ?auto_68373 ) ( TRUCK-AT ?auto_68375 ?auto_68369 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_68370 ?auto_68371 ?auto_68369 )
      ( DELIVER-3PKG-VERIFY ?auto_68370 ?auto_68371 ?auto_68372 ?auto_68369 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_68387 - OBJ
      ?auto_68388 - OBJ
      ?auto_68389 - OBJ
      ?auto_68386 - LOCATION
    )
    :vars
    (
      ?auto_68391 - LOCATION
      ?auto_68393 - CITY
      ?auto_68390 - LOCATION
      ?auto_68392 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_68388 ?auto_68387 ) ) ( not ( = ?auto_68389 ?auto_68387 ) ) ( not ( = ?auto_68389 ?auto_68388 ) ) ( IN-CITY ?auto_68391 ?auto_68393 ) ( IN-CITY ?auto_68386 ?auto_68393 ) ( not ( = ?auto_68386 ?auto_68391 ) ) ( OBJ-AT ?auto_68388 ?auto_68386 ) ( OBJ-AT ?auto_68389 ?auto_68391 ) ( IN-CITY ?auto_68390 ?auto_68393 ) ( not ( = ?auto_68386 ?auto_68390 ) ) ( not ( = ?auto_68391 ?auto_68390 ) ) ( OBJ-AT ?auto_68387 ?auto_68390 ) ( TRUCK-AT ?auto_68392 ?auto_68386 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_68388 ?auto_68389 ?auto_68386 )
      ( DELIVER-3PKG-VERIFY ?auto_68387 ?auto_68388 ?auto_68389 ?auto_68386 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_68404 - OBJ
      ?auto_68405 - OBJ
      ?auto_68406 - OBJ
      ?auto_68403 - LOCATION
    )
    :vars
    (
      ?auto_68408 - LOCATION
      ?auto_68410 - CITY
      ?auto_68407 - LOCATION
      ?auto_68409 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_68405 ?auto_68404 ) ) ( not ( = ?auto_68406 ?auto_68404 ) ) ( not ( = ?auto_68406 ?auto_68405 ) ) ( IN-CITY ?auto_68408 ?auto_68410 ) ( IN-CITY ?auto_68403 ?auto_68410 ) ( not ( = ?auto_68403 ?auto_68408 ) ) ( OBJ-AT ?auto_68406 ?auto_68403 ) ( OBJ-AT ?auto_68405 ?auto_68408 ) ( IN-CITY ?auto_68407 ?auto_68410 ) ( not ( = ?auto_68403 ?auto_68407 ) ) ( not ( = ?auto_68408 ?auto_68407 ) ) ( OBJ-AT ?auto_68404 ?auto_68407 ) ( TRUCK-AT ?auto_68409 ?auto_68403 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_68406 ?auto_68405 ?auto_68403 )
      ( DELIVER-3PKG-VERIFY ?auto_68404 ?auto_68405 ?auto_68406 ?auto_68403 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_68439 - OBJ
      ?auto_68440 - OBJ
      ?auto_68441 - OBJ
      ?auto_68438 - LOCATION
    )
    :vars
    (
      ?auto_68443 - LOCATION
      ?auto_68445 - CITY
      ?auto_68442 - LOCATION
      ?auto_68444 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_68440 ?auto_68439 ) ) ( not ( = ?auto_68441 ?auto_68439 ) ) ( not ( = ?auto_68441 ?auto_68440 ) ) ( IN-CITY ?auto_68443 ?auto_68445 ) ( IN-CITY ?auto_68438 ?auto_68445 ) ( not ( = ?auto_68438 ?auto_68443 ) ) ( OBJ-AT ?auto_68440 ?auto_68438 ) ( OBJ-AT ?auto_68439 ?auto_68443 ) ( IN-CITY ?auto_68442 ?auto_68445 ) ( not ( = ?auto_68438 ?auto_68442 ) ) ( not ( = ?auto_68443 ?auto_68442 ) ) ( OBJ-AT ?auto_68441 ?auto_68442 ) ( TRUCK-AT ?auto_68444 ?auto_68438 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_68440 ?auto_68439 ?auto_68438 )
      ( DELIVER-3PKG-VERIFY ?auto_68439 ?auto_68440 ?auto_68441 ?auto_68438 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_68456 - OBJ
      ?auto_68457 - OBJ
      ?auto_68458 - OBJ
      ?auto_68455 - LOCATION
    )
    :vars
    (
      ?auto_68460 - LOCATION
      ?auto_68462 - CITY
      ?auto_68459 - LOCATION
      ?auto_68461 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_68457 ?auto_68456 ) ) ( not ( = ?auto_68458 ?auto_68456 ) ) ( not ( = ?auto_68458 ?auto_68457 ) ) ( IN-CITY ?auto_68460 ?auto_68462 ) ( IN-CITY ?auto_68455 ?auto_68462 ) ( not ( = ?auto_68455 ?auto_68460 ) ) ( OBJ-AT ?auto_68458 ?auto_68455 ) ( OBJ-AT ?auto_68456 ?auto_68460 ) ( IN-CITY ?auto_68459 ?auto_68462 ) ( not ( = ?auto_68455 ?auto_68459 ) ) ( not ( = ?auto_68460 ?auto_68459 ) ) ( OBJ-AT ?auto_68457 ?auto_68459 ) ( TRUCK-AT ?auto_68461 ?auto_68455 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_68458 ?auto_68456 ?auto_68455 )
      ( DELIVER-3PKG-VERIFY ?auto_68456 ?auto_68457 ?auto_68458 ?auto_68455 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_69125 - OBJ
      ?auto_69124 - LOCATION
    )
    :vars
    (
      ?auto_69126 - OBJ
      ?auto_69129 - LOCATION
      ?auto_69131 - CITY
      ?auto_69127 - OBJ
      ?auto_69128 - LOCATION
      ?auto_69130 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_69125 ?auto_69126 ) ) ( IN-CITY ?auto_69129 ?auto_69131 ) ( IN-CITY ?auto_69124 ?auto_69131 ) ( not ( = ?auto_69124 ?auto_69129 ) ) ( OBJ-AT ?auto_69125 ?auto_69129 ) ( not ( = ?auto_69127 ?auto_69126 ) ) ( not ( = ?auto_69125 ?auto_69127 ) ) ( IN-CITY ?auto_69128 ?auto_69131 ) ( not ( = ?auto_69124 ?auto_69128 ) ) ( not ( = ?auto_69129 ?auto_69128 ) ) ( OBJ-AT ?auto_69127 ?auto_69128 ) ( TRUCK-AT ?auto_69130 ?auto_69124 ) ( IN-TRUCK ?auto_69126 ?auto_69130 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_69126 ?auto_69124 )
      ( DELIVER-2PKG ?auto_69126 ?auto_69125 ?auto_69124 )
      ( DELIVER-1PKG-VERIFY ?auto_69125 ?auto_69124 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_69133 - OBJ
      ?auto_69134 - OBJ
      ?auto_69132 - LOCATION
    )
    :vars
    (
      ?auto_69138 - LOCATION
      ?auto_69139 - CITY
      ?auto_69137 - OBJ
      ?auto_69136 - LOCATION
      ?auto_69135 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_69134 ?auto_69133 ) ) ( IN-CITY ?auto_69138 ?auto_69139 ) ( IN-CITY ?auto_69132 ?auto_69139 ) ( not ( = ?auto_69132 ?auto_69138 ) ) ( OBJ-AT ?auto_69134 ?auto_69138 ) ( not ( = ?auto_69137 ?auto_69133 ) ) ( not ( = ?auto_69134 ?auto_69137 ) ) ( IN-CITY ?auto_69136 ?auto_69139 ) ( not ( = ?auto_69132 ?auto_69136 ) ) ( not ( = ?auto_69138 ?auto_69136 ) ) ( OBJ-AT ?auto_69137 ?auto_69136 ) ( TRUCK-AT ?auto_69135 ?auto_69132 ) ( IN-TRUCK ?auto_69133 ?auto_69135 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_69134 ?auto_69132 )
      ( DELIVER-2PKG-VERIFY ?auto_69133 ?auto_69134 ?auto_69132 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_69141 - OBJ
      ?auto_69142 - OBJ
      ?auto_69140 - LOCATION
    )
    :vars
    (
      ?auto_69145 - OBJ
      ?auto_69147 - LOCATION
      ?auto_69143 - CITY
      ?auto_69146 - LOCATION
      ?auto_69144 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_69142 ?auto_69141 ) ) ( not ( = ?auto_69142 ?auto_69145 ) ) ( IN-CITY ?auto_69147 ?auto_69143 ) ( IN-CITY ?auto_69140 ?auto_69143 ) ( not ( = ?auto_69140 ?auto_69147 ) ) ( OBJ-AT ?auto_69142 ?auto_69147 ) ( not ( = ?auto_69141 ?auto_69145 ) ) ( IN-CITY ?auto_69146 ?auto_69143 ) ( not ( = ?auto_69140 ?auto_69146 ) ) ( not ( = ?auto_69147 ?auto_69146 ) ) ( OBJ-AT ?auto_69141 ?auto_69146 ) ( TRUCK-AT ?auto_69144 ?auto_69140 ) ( IN-TRUCK ?auto_69145 ?auto_69144 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_69145 ?auto_69142 ?auto_69140 )
      ( DELIVER-2PKG-VERIFY ?auto_69141 ?auto_69142 ?auto_69140 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_69149 - OBJ
      ?auto_69150 - OBJ
      ?auto_69148 - LOCATION
    )
    :vars
    (
      ?auto_69154 - LOCATION
      ?auto_69151 - CITY
      ?auto_69155 - OBJ
      ?auto_69153 - LOCATION
      ?auto_69152 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_69150 ?auto_69149 ) ) ( IN-CITY ?auto_69154 ?auto_69151 ) ( IN-CITY ?auto_69148 ?auto_69151 ) ( not ( = ?auto_69148 ?auto_69154 ) ) ( OBJ-AT ?auto_69149 ?auto_69154 ) ( not ( = ?auto_69155 ?auto_69150 ) ) ( not ( = ?auto_69149 ?auto_69155 ) ) ( IN-CITY ?auto_69153 ?auto_69151 ) ( not ( = ?auto_69148 ?auto_69153 ) ) ( not ( = ?auto_69154 ?auto_69153 ) ) ( OBJ-AT ?auto_69155 ?auto_69153 ) ( TRUCK-AT ?auto_69152 ?auto_69148 ) ( IN-TRUCK ?auto_69150 ?auto_69152 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_69150 ?auto_69149 ?auto_69148 )
      ( DELIVER-2PKG-VERIFY ?auto_69149 ?auto_69150 ?auto_69148 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_69157 - OBJ
      ?auto_69158 - OBJ
      ?auto_69156 - LOCATION
    )
    :vars
    (
      ?auto_69161 - OBJ
      ?auto_69163 - LOCATION
      ?auto_69159 - CITY
      ?auto_69162 - LOCATION
      ?auto_69160 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_69158 ?auto_69157 ) ) ( not ( = ?auto_69157 ?auto_69161 ) ) ( IN-CITY ?auto_69163 ?auto_69159 ) ( IN-CITY ?auto_69156 ?auto_69159 ) ( not ( = ?auto_69156 ?auto_69163 ) ) ( OBJ-AT ?auto_69157 ?auto_69163 ) ( not ( = ?auto_69158 ?auto_69161 ) ) ( IN-CITY ?auto_69162 ?auto_69159 ) ( not ( = ?auto_69156 ?auto_69162 ) ) ( not ( = ?auto_69163 ?auto_69162 ) ) ( OBJ-AT ?auto_69158 ?auto_69162 ) ( TRUCK-AT ?auto_69160 ?auto_69156 ) ( IN-TRUCK ?auto_69161 ?auto_69160 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_69161 ?auto_69157 ?auto_69156 )
      ( DELIVER-2PKG-VERIFY ?auto_69157 ?auto_69158 ?auto_69156 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_69183 - OBJ
      ?auto_69184 - OBJ
      ?auto_69185 - OBJ
      ?auto_69182 - LOCATION
    )
    :vars
    (
      ?auto_69189 - LOCATION
      ?auto_69186 - CITY
      ?auto_69188 - LOCATION
      ?auto_69187 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_69184 ?auto_69183 ) ) ( not ( = ?auto_69185 ?auto_69183 ) ) ( not ( = ?auto_69185 ?auto_69184 ) ) ( IN-CITY ?auto_69189 ?auto_69186 ) ( IN-CITY ?auto_69182 ?auto_69186 ) ( not ( = ?auto_69182 ?auto_69189 ) ) ( OBJ-AT ?auto_69185 ?auto_69189 ) ( IN-CITY ?auto_69188 ?auto_69186 ) ( not ( = ?auto_69182 ?auto_69188 ) ) ( not ( = ?auto_69189 ?auto_69188 ) ) ( OBJ-AT ?auto_69184 ?auto_69188 ) ( TRUCK-AT ?auto_69187 ?auto_69182 ) ( IN-TRUCK ?auto_69183 ?auto_69187 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_69183 ?auto_69185 ?auto_69182 )
      ( DELIVER-3PKG-VERIFY ?auto_69183 ?auto_69184 ?auto_69185 ?auto_69182 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_69200 - OBJ
      ?auto_69201 - OBJ
      ?auto_69202 - OBJ
      ?auto_69199 - LOCATION
    )
    :vars
    (
      ?auto_69206 - LOCATION
      ?auto_69203 - CITY
      ?auto_69205 - LOCATION
      ?auto_69204 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_69201 ?auto_69200 ) ) ( not ( = ?auto_69202 ?auto_69200 ) ) ( not ( = ?auto_69202 ?auto_69201 ) ) ( IN-CITY ?auto_69206 ?auto_69203 ) ( IN-CITY ?auto_69199 ?auto_69203 ) ( not ( = ?auto_69199 ?auto_69206 ) ) ( OBJ-AT ?auto_69201 ?auto_69206 ) ( IN-CITY ?auto_69205 ?auto_69203 ) ( not ( = ?auto_69199 ?auto_69205 ) ) ( not ( = ?auto_69206 ?auto_69205 ) ) ( OBJ-AT ?auto_69202 ?auto_69205 ) ( TRUCK-AT ?auto_69204 ?auto_69199 ) ( IN-TRUCK ?auto_69200 ?auto_69204 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_69200 ?auto_69201 ?auto_69199 )
      ( DELIVER-3PKG-VERIFY ?auto_69200 ?auto_69201 ?auto_69202 ?auto_69199 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_69217 - OBJ
      ?auto_69218 - OBJ
      ?auto_69219 - OBJ
      ?auto_69216 - LOCATION
    )
    :vars
    (
      ?auto_69223 - LOCATION
      ?auto_69220 - CITY
      ?auto_69222 - LOCATION
      ?auto_69221 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_69218 ?auto_69217 ) ) ( not ( = ?auto_69219 ?auto_69217 ) ) ( not ( = ?auto_69219 ?auto_69218 ) ) ( IN-CITY ?auto_69223 ?auto_69220 ) ( IN-CITY ?auto_69216 ?auto_69220 ) ( not ( = ?auto_69216 ?auto_69223 ) ) ( OBJ-AT ?auto_69219 ?auto_69223 ) ( IN-CITY ?auto_69222 ?auto_69220 ) ( not ( = ?auto_69216 ?auto_69222 ) ) ( not ( = ?auto_69223 ?auto_69222 ) ) ( OBJ-AT ?auto_69217 ?auto_69222 ) ( TRUCK-AT ?auto_69221 ?auto_69216 ) ( IN-TRUCK ?auto_69218 ?auto_69221 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_69218 ?auto_69219 ?auto_69216 )
      ( DELIVER-3PKG-VERIFY ?auto_69217 ?auto_69218 ?auto_69219 ?auto_69216 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_69234 - OBJ
      ?auto_69235 - OBJ
      ?auto_69236 - OBJ
      ?auto_69233 - LOCATION
    )
    :vars
    (
      ?auto_69240 - LOCATION
      ?auto_69237 - CITY
      ?auto_69239 - LOCATION
      ?auto_69238 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_69235 ?auto_69234 ) ) ( not ( = ?auto_69236 ?auto_69234 ) ) ( not ( = ?auto_69236 ?auto_69235 ) ) ( IN-CITY ?auto_69240 ?auto_69237 ) ( IN-CITY ?auto_69233 ?auto_69237 ) ( not ( = ?auto_69233 ?auto_69240 ) ) ( OBJ-AT ?auto_69235 ?auto_69240 ) ( IN-CITY ?auto_69239 ?auto_69237 ) ( not ( = ?auto_69233 ?auto_69239 ) ) ( not ( = ?auto_69240 ?auto_69239 ) ) ( OBJ-AT ?auto_69234 ?auto_69239 ) ( TRUCK-AT ?auto_69238 ?auto_69233 ) ( IN-TRUCK ?auto_69236 ?auto_69238 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_69236 ?auto_69235 ?auto_69233 )
      ( DELIVER-3PKG-VERIFY ?auto_69234 ?auto_69235 ?auto_69236 ?auto_69233 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_69269 - OBJ
      ?auto_69270 - OBJ
      ?auto_69271 - OBJ
      ?auto_69268 - LOCATION
    )
    :vars
    (
      ?auto_69275 - LOCATION
      ?auto_69272 - CITY
      ?auto_69274 - LOCATION
      ?auto_69273 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_69270 ?auto_69269 ) ) ( not ( = ?auto_69271 ?auto_69269 ) ) ( not ( = ?auto_69271 ?auto_69270 ) ) ( IN-CITY ?auto_69275 ?auto_69272 ) ( IN-CITY ?auto_69268 ?auto_69272 ) ( not ( = ?auto_69268 ?auto_69275 ) ) ( OBJ-AT ?auto_69269 ?auto_69275 ) ( IN-CITY ?auto_69274 ?auto_69272 ) ( not ( = ?auto_69268 ?auto_69274 ) ) ( not ( = ?auto_69275 ?auto_69274 ) ) ( OBJ-AT ?auto_69271 ?auto_69274 ) ( TRUCK-AT ?auto_69273 ?auto_69268 ) ( IN-TRUCK ?auto_69270 ?auto_69273 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_69270 ?auto_69269 ?auto_69268 )
      ( DELIVER-3PKG-VERIFY ?auto_69269 ?auto_69270 ?auto_69271 ?auto_69268 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_69286 - OBJ
      ?auto_69287 - OBJ
      ?auto_69288 - OBJ
      ?auto_69285 - LOCATION
    )
    :vars
    (
      ?auto_69292 - LOCATION
      ?auto_69289 - CITY
      ?auto_69291 - LOCATION
      ?auto_69290 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_69287 ?auto_69286 ) ) ( not ( = ?auto_69288 ?auto_69286 ) ) ( not ( = ?auto_69288 ?auto_69287 ) ) ( IN-CITY ?auto_69292 ?auto_69289 ) ( IN-CITY ?auto_69285 ?auto_69289 ) ( not ( = ?auto_69285 ?auto_69292 ) ) ( OBJ-AT ?auto_69286 ?auto_69292 ) ( IN-CITY ?auto_69291 ?auto_69289 ) ( not ( = ?auto_69285 ?auto_69291 ) ) ( not ( = ?auto_69292 ?auto_69291 ) ) ( OBJ-AT ?auto_69287 ?auto_69291 ) ( TRUCK-AT ?auto_69290 ?auto_69285 ) ( IN-TRUCK ?auto_69288 ?auto_69290 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_69288 ?auto_69286 ?auto_69285 )
      ( DELIVER-3PKG-VERIFY ?auto_69286 ?auto_69287 ?auto_69288 ?auto_69285 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_69955 - OBJ
      ?auto_69954 - LOCATION
    )
    :vars
    (
      ?auto_69958 - OBJ
      ?auto_69960 - LOCATION
      ?auto_69956 - CITY
      ?auto_69961 - OBJ
      ?auto_69959 - LOCATION
      ?auto_69957 - TRUCK
      ?auto_69962 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_69955 ?auto_69958 ) ) ( IN-CITY ?auto_69960 ?auto_69956 ) ( IN-CITY ?auto_69954 ?auto_69956 ) ( not ( = ?auto_69954 ?auto_69960 ) ) ( OBJ-AT ?auto_69955 ?auto_69960 ) ( not ( = ?auto_69961 ?auto_69958 ) ) ( not ( = ?auto_69955 ?auto_69961 ) ) ( IN-CITY ?auto_69959 ?auto_69956 ) ( not ( = ?auto_69954 ?auto_69959 ) ) ( not ( = ?auto_69960 ?auto_69959 ) ) ( OBJ-AT ?auto_69961 ?auto_69959 ) ( IN-TRUCK ?auto_69958 ?auto_69957 ) ( TRUCK-AT ?auto_69957 ?auto_69962 ) ( IN-CITY ?auto_69962 ?auto_69956 ) ( not ( = ?auto_69954 ?auto_69962 ) ) ( not ( = ?auto_69960 ?auto_69962 ) ) ( not ( = ?auto_69959 ?auto_69962 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_69957 ?auto_69962 ?auto_69954 ?auto_69956 )
      ( DELIVER-2PKG ?auto_69958 ?auto_69955 ?auto_69954 )
      ( DELIVER-1PKG-VERIFY ?auto_69955 ?auto_69954 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_69964 - OBJ
      ?auto_69965 - OBJ
      ?auto_69963 - LOCATION
    )
    :vars
    (
      ?auto_69968 - LOCATION
      ?auto_69970 - CITY
      ?auto_69966 - OBJ
      ?auto_69969 - LOCATION
      ?auto_69967 - TRUCK
      ?auto_69971 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_69965 ?auto_69964 ) ) ( IN-CITY ?auto_69968 ?auto_69970 ) ( IN-CITY ?auto_69963 ?auto_69970 ) ( not ( = ?auto_69963 ?auto_69968 ) ) ( OBJ-AT ?auto_69965 ?auto_69968 ) ( not ( = ?auto_69966 ?auto_69964 ) ) ( not ( = ?auto_69965 ?auto_69966 ) ) ( IN-CITY ?auto_69969 ?auto_69970 ) ( not ( = ?auto_69963 ?auto_69969 ) ) ( not ( = ?auto_69968 ?auto_69969 ) ) ( OBJ-AT ?auto_69966 ?auto_69969 ) ( IN-TRUCK ?auto_69964 ?auto_69967 ) ( TRUCK-AT ?auto_69967 ?auto_69971 ) ( IN-CITY ?auto_69971 ?auto_69970 ) ( not ( = ?auto_69963 ?auto_69971 ) ) ( not ( = ?auto_69968 ?auto_69971 ) ) ( not ( = ?auto_69969 ?auto_69971 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_69965 ?auto_69963 )
      ( DELIVER-2PKG-VERIFY ?auto_69964 ?auto_69965 ?auto_69963 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_69973 - OBJ
      ?auto_69974 - OBJ
      ?auto_69972 - LOCATION
    )
    :vars
    (
      ?auto_69978 - OBJ
      ?auto_69977 - LOCATION
      ?auto_69980 - CITY
      ?auto_69976 - LOCATION
      ?auto_69979 - TRUCK
      ?auto_69975 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_69974 ?auto_69973 ) ) ( not ( = ?auto_69974 ?auto_69978 ) ) ( IN-CITY ?auto_69977 ?auto_69980 ) ( IN-CITY ?auto_69972 ?auto_69980 ) ( not ( = ?auto_69972 ?auto_69977 ) ) ( OBJ-AT ?auto_69974 ?auto_69977 ) ( not ( = ?auto_69973 ?auto_69978 ) ) ( IN-CITY ?auto_69976 ?auto_69980 ) ( not ( = ?auto_69972 ?auto_69976 ) ) ( not ( = ?auto_69977 ?auto_69976 ) ) ( OBJ-AT ?auto_69973 ?auto_69976 ) ( IN-TRUCK ?auto_69978 ?auto_69979 ) ( TRUCK-AT ?auto_69979 ?auto_69975 ) ( IN-CITY ?auto_69975 ?auto_69980 ) ( not ( = ?auto_69972 ?auto_69975 ) ) ( not ( = ?auto_69977 ?auto_69975 ) ) ( not ( = ?auto_69976 ?auto_69975 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_69978 ?auto_69974 ?auto_69972 )
      ( DELIVER-2PKG-VERIFY ?auto_69973 ?auto_69974 ?auto_69972 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_69982 - OBJ
      ?auto_69983 - OBJ
      ?auto_69981 - LOCATION
    )
    :vars
    (
      ?auto_69987 - LOCATION
      ?auto_69989 - CITY
      ?auto_69985 - OBJ
      ?auto_69986 - LOCATION
      ?auto_69988 - TRUCK
      ?auto_69984 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_69983 ?auto_69982 ) ) ( IN-CITY ?auto_69987 ?auto_69989 ) ( IN-CITY ?auto_69981 ?auto_69989 ) ( not ( = ?auto_69981 ?auto_69987 ) ) ( OBJ-AT ?auto_69982 ?auto_69987 ) ( not ( = ?auto_69985 ?auto_69983 ) ) ( not ( = ?auto_69982 ?auto_69985 ) ) ( IN-CITY ?auto_69986 ?auto_69989 ) ( not ( = ?auto_69981 ?auto_69986 ) ) ( not ( = ?auto_69987 ?auto_69986 ) ) ( OBJ-AT ?auto_69985 ?auto_69986 ) ( IN-TRUCK ?auto_69983 ?auto_69988 ) ( TRUCK-AT ?auto_69988 ?auto_69984 ) ( IN-CITY ?auto_69984 ?auto_69989 ) ( not ( = ?auto_69981 ?auto_69984 ) ) ( not ( = ?auto_69987 ?auto_69984 ) ) ( not ( = ?auto_69986 ?auto_69984 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_69983 ?auto_69982 ?auto_69981 )
      ( DELIVER-2PKG-VERIFY ?auto_69982 ?auto_69983 ?auto_69981 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_69991 - OBJ
      ?auto_69992 - OBJ
      ?auto_69990 - LOCATION
    )
    :vars
    (
      ?auto_69996 - OBJ
      ?auto_69995 - LOCATION
      ?auto_69998 - CITY
      ?auto_69994 - LOCATION
      ?auto_69997 - TRUCK
      ?auto_69993 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_69992 ?auto_69991 ) ) ( not ( = ?auto_69991 ?auto_69996 ) ) ( IN-CITY ?auto_69995 ?auto_69998 ) ( IN-CITY ?auto_69990 ?auto_69998 ) ( not ( = ?auto_69990 ?auto_69995 ) ) ( OBJ-AT ?auto_69991 ?auto_69995 ) ( not ( = ?auto_69992 ?auto_69996 ) ) ( IN-CITY ?auto_69994 ?auto_69998 ) ( not ( = ?auto_69990 ?auto_69994 ) ) ( not ( = ?auto_69995 ?auto_69994 ) ) ( OBJ-AT ?auto_69992 ?auto_69994 ) ( IN-TRUCK ?auto_69996 ?auto_69997 ) ( TRUCK-AT ?auto_69997 ?auto_69993 ) ( IN-CITY ?auto_69993 ?auto_69998 ) ( not ( = ?auto_69990 ?auto_69993 ) ) ( not ( = ?auto_69995 ?auto_69993 ) ) ( not ( = ?auto_69994 ?auto_69993 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_69996 ?auto_69991 ?auto_69990 )
      ( DELIVER-2PKG-VERIFY ?auto_69991 ?auto_69992 ?auto_69990 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_70020 - OBJ
      ?auto_70021 - OBJ
      ?auto_70022 - OBJ
      ?auto_70019 - LOCATION
    )
    :vars
    (
      ?auto_70025 - LOCATION
      ?auto_70027 - CITY
      ?auto_70024 - LOCATION
      ?auto_70026 - TRUCK
      ?auto_70023 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_70021 ?auto_70020 ) ) ( not ( = ?auto_70022 ?auto_70020 ) ) ( not ( = ?auto_70022 ?auto_70021 ) ) ( IN-CITY ?auto_70025 ?auto_70027 ) ( IN-CITY ?auto_70019 ?auto_70027 ) ( not ( = ?auto_70019 ?auto_70025 ) ) ( OBJ-AT ?auto_70022 ?auto_70025 ) ( IN-CITY ?auto_70024 ?auto_70027 ) ( not ( = ?auto_70019 ?auto_70024 ) ) ( not ( = ?auto_70025 ?auto_70024 ) ) ( OBJ-AT ?auto_70021 ?auto_70024 ) ( IN-TRUCK ?auto_70020 ?auto_70026 ) ( TRUCK-AT ?auto_70026 ?auto_70023 ) ( IN-CITY ?auto_70023 ?auto_70027 ) ( not ( = ?auto_70019 ?auto_70023 ) ) ( not ( = ?auto_70025 ?auto_70023 ) ) ( not ( = ?auto_70024 ?auto_70023 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_70020 ?auto_70022 ?auto_70019 )
      ( DELIVER-3PKG-VERIFY ?auto_70020 ?auto_70021 ?auto_70022 ?auto_70019 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_70039 - OBJ
      ?auto_70040 - OBJ
      ?auto_70041 - OBJ
      ?auto_70038 - LOCATION
    )
    :vars
    (
      ?auto_70044 - LOCATION
      ?auto_70046 - CITY
      ?auto_70043 - LOCATION
      ?auto_70045 - TRUCK
      ?auto_70042 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_70040 ?auto_70039 ) ) ( not ( = ?auto_70041 ?auto_70039 ) ) ( not ( = ?auto_70041 ?auto_70040 ) ) ( IN-CITY ?auto_70044 ?auto_70046 ) ( IN-CITY ?auto_70038 ?auto_70046 ) ( not ( = ?auto_70038 ?auto_70044 ) ) ( OBJ-AT ?auto_70040 ?auto_70044 ) ( IN-CITY ?auto_70043 ?auto_70046 ) ( not ( = ?auto_70038 ?auto_70043 ) ) ( not ( = ?auto_70044 ?auto_70043 ) ) ( OBJ-AT ?auto_70041 ?auto_70043 ) ( IN-TRUCK ?auto_70039 ?auto_70045 ) ( TRUCK-AT ?auto_70045 ?auto_70042 ) ( IN-CITY ?auto_70042 ?auto_70046 ) ( not ( = ?auto_70038 ?auto_70042 ) ) ( not ( = ?auto_70044 ?auto_70042 ) ) ( not ( = ?auto_70043 ?auto_70042 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_70039 ?auto_70040 ?auto_70038 )
      ( DELIVER-3PKG-VERIFY ?auto_70039 ?auto_70040 ?auto_70041 ?auto_70038 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_70058 - OBJ
      ?auto_70059 - OBJ
      ?auto_70060 - OBJ
      ?auto_70057 - LOCATION
    )
    :vars
    (
      ?auto_70063 - LOCATION
      ?auto_70065 - CITY
      ?auto_70062 - LOCATION
      ?auto_70064 - TRUCK
      ?auto_70061 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_70059 ?auto_70058 ) ) ( not ( = ?auto_70060 ?auto_70058 ) ) ( not ( = ?auto_70060 ?auto_70059 ) ) ( IN-CITY ?auto_70063 ?auto_70065 ) ( IN-CITY ?auto_70057 ?auto_70065 ) ( not ( = ?auto_70057 ?auto_70063 ) ) ( OBJ-AT ?auto_70060 ?auto_70063 ) ( IN-CITY ?auto_70062 ?auto_70065 ) ( not ( = ?auto_70057 ?auto_70062 ) ) ( not ( = ?auto_70063 ?auto_70062 ) ) ( OBJ-AT ?auto_70058 ?auto_70062 ) ( IN-TRUCK ?auto_70059 ?auto_70064 ) ( TRUCK-AT ?auto_70064 ?auto_70061 ) ( IN-CITY ?auto_70061 ?auto_70065 ) ( not ( = ?auto_70057 ?auto_70061 ) ) ( not ( = ?auto_70063 ?auto_70061 ) ) ( not ( = ?auto_70062 ?auto_70061 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_70059 ?auto_70060 ?auto_70057 )
      ( DELIVER-3PKG-VERIFY ?auto_70058 ?auto_70059 ?auto_70060 ?auto_70057 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_70077 - OBJ
      ?auto_70078 - OBJ
      ?auto_70079 - OBJ
      ?auto_70076 - LOCATION
    )
    :vars
    (
      ?auto_70082 - LOCATION
      ?auto_70084 - CITY
      ?auto_70081 - LOCATION
      ?auto_70083 - TRUCK
      ?auto_70080 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_70078 ?auto_70077 ) ) ( not ( = ?auto_70079 ?auto_70077 ) ) ( not ( = ?auto_70079 ?auto_70078 ) ) ( IN-CITY ?auto_70082 ?auto_70084 ) ( IN-CITY ?auto_70076 ?auto_70084 ) ( not ( = ?auto_70076 ?auto_70082 ) ) ( OBJ-AT ?auto_70078 ?auto_70082 ) ( IN-CITY ?auto_70081 ?auto_70084 ) ( not ( = ?auto_70076 ?auto_70081 ) ) ( not ( = ?auto_70082 ?auto_70081 ) ) ( OBJ-AT ?auto_70077 ?auto_70081 ) ( IN-TRUCK ?auto_70079 ?auto_70083 ) ( TRUCK-AT ?auto_70083 ?auto_70080 ) ( IN-CITY ?auto_70080 ?auto_70084 ) ( not ( = ?auto_70076 ?auto_70080 ) ) ( not ( = ?auto_70082 ?auto_70080 ) ) ( not ( = ?auto_70081 ?auto_70080 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_70079 ?auto_70078 ?auto_70076 )
      ( DELIVER-3PKG-VERIFY ?auto_70077 ?auto_70078 ?auto_70079 ?auto_70076 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_70116 - OBJ
      ?auto_70117 - OBJ
      ?auto_70118 - OBJ
      ?auto_70115 - LOCATION
    )
    :vars
    (
      ?auto_70121 - LOCATION
      ?auto_70123 - CITY
      ?auto_70120 - LOCATION
      ?auto_70122 - TRUCK
      ?auto_70119 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_70117 ?auto_70116 ) ) ( not ( = ?auto_70118 ?auto_70116 ) ) ( not ( = ?auto_70118 ?auto_70117 ) ) ( IN-CITY ?auto_70121 ?auto_70123 ) ( IN-CITY ?auto_70115 ?auto_70123 ) ( not ( = ?auto_70115 ?auto_70121 ) ) ( OBJ-AT ?auto_70116 ?auto_70121 ) ( IN-CITY ?auto_70120 ?auto_70123 ) ( not ( = ?auto_70115 ?auto_70120 ) ) ( not ( = ?auto_70121 ?auto_70120 ) ) ( OBJ-AT ?auto_70118 ?auto_70120 ) ( IN-TRUCK ?auto_70117 ?auto_70122 ) ( TRUCK-AT ?auto_70122 ?auto_70119 ) ( IN-CITY ?auto_70119 ?auto_70123 ) ( not ( = ?auto_70115 ?auto_70119 ) ) ( not ( = ?auto_70121 ?auto_70119 ) ) ( not ( = ?auto_70120 ?auto_70119 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_70117 ?auto_70116 ?auto_70115 )
      ( DELIVER-3PKG-VERIFY ?auto_70116 ?auto_70117 ?auto_70118 ?auto_70115 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_70135 - OBJ
      ?auto_70136 - OBJ
      ?auto_70137 - OBJ
      ?auto_70134 - LOCATION
    )
    :vars
    (
      ?auto_70140 - LOCATION
      ?auto_70142 - CITY
      ?auto_70139 - LOCATION
      ?auto_70141 - TRUCK
      ?auto_70138 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_70136 ?auto_70135 ) ) ( not ( = ?auto_70137 ?auto_70135 ) ) ( not ( = ?auto_70137 ?auto_70136 ) ) ( IN-CITY ?auto_70140 ?auto_70142 ) ( IN-CITY ?auto_70134 ?auto_70142 ) ( not ( = ?auto_70134 ?auto_70140 ) ) ( OBJ-AT ?auto_70135 ?auto_70140 ) ( IN-CITY ?auto_70139 ?auto_70142 ) ( not ( = ?auto_70134 ?auto_70139 ) ) ( not ( = ?auto_70140 ?auto_70139 ) ) ( OBJ-AT ?auto_70136 ?auto_70139 ) ( IN-TRUCK ?auto_70137 ?auto_70141 ) ( TRUCK-AT ?auto_70141 ?auto_70138 ) ( IN-CITY ?auto_70138 ?auto_70142 ) ( not ( = ?auto_70134 ?auto_70138 ) ) ( not ( = ?auto_70140 ?auto_70138 ) ) ( not ( = ?auto_70139 ?auto_70138 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_70137 ?auto_70135 ?auto_70134 )
      ( DELIVER-3PKG-VERIFY ?auto_70135 ?auto_70136 ?auto_70137 ?auto_70134 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_70875 - OBJ
      ?auto_70874 - LOCATION
    )
    :vars
    (
      ?auto_70880 - OBJ
      ?auto_70879 - LOCATION
      ?auto_70882 - CITY
      ?auto_70877 - OBJ
      ?auto_70878 - LOCATION
      ?auto_70881 - TRUCK
      ?auto_70876 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_70875 ?auto_70880 ) ) ( IN-CITY ?auto_70879 ?auto_70882 ) ( IN-CITY ?auto_70874 ?auto_70882 ) ( not ( = ?auto_70874 ?auto_70879 ) ) ( OBJ-AT ?auto_70875 ?auto_70879 ) ( not ( = ?auto_70877 ?auto_70880 ) ) ( not ( = ?auto_70875 ?auto_70877 ) ) ( IN-CITY ?auto_70878 ?auto_70882 ) ( not ( = ?auto_70874 ?auto_70878 ) ) ( not ( = ?auto_70879 ?auto_70878 ) ) ( OBJ-AT ?auto_70877 ?auto_70878 ) ( TRUCK-AT ?auto_70881 ?auto_70876 ) ( IN-CITY ?auto_70876 ?auto_70882 ) ( not ( = ?auto_70874 ?auto_70876 ) ) ( not ( = ?auto_70879 ?auto_70876 ) ) ( not ( = ?auto_70878 ?auto_70876 ) ) ( OBJ-AT ?auto_70880 ?auto_70876 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_70880 ?auto_70881 ?auto_70876 )
      ( DELIVER-2PKG ?auto_70880 ?auto_70875 ?auto_70874 )
      ( DELIVER-1PKG-VERIFY ?auto_70875 ?auto_70874 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_70884 - OBJ
      ?auto_70885 - OBJ
      ?auto_70883 - LOCATION
    )
    :vars
    (
      ?auto_70891 - LOCATION
      ?auto_70886 - CITY
      ?auto_70888 - OBJ
      ?auto_70889 - LOCATION
      ?auto_70887 - TRUCK
      ?auto_70890 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_70885 ?auto_70884 ) ) ( IN-CITY ?auto_70891 ?auto_70886 ) ( IN-CITY ?auto_70883 ?auto_70886 ) ( not ( = ?auto_70883 ?auto_70891 ) ) ( OBJ-AT ?auto_70885 ?auto_70891 ) ( not ( = ?auto_70888 ?auto_70884 ) ) ( not ( = ?auto_70885 ?auto_70888 ) ) ( IN-CITY ?auto_70889 ?auto_70886 ) ( not ( = ?auto_70883 ?auto_70889 ) ) ( not ( = ?auto_70891 ?auto_70889 ) ) ( OBJ-AT ?auto_70888 ?auto_70889 ) ( TRUCK-AT ?auto_70887 ?auto_70890 ) ( IN-CITY ?auto_70890 ?auto_70886 ) ( not ( = ?auto_70883 ?auto_70890 ) ) ( not ( = ?auto_70891 ?auto_70890 ) ) ( not ( = ?auto_70889 ?auto_70890 ) ) ( OBJ-AT ?auto_70884 ?auto_70890 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_70885 ?auto_70883 )
      ( DELIVER-2PKG-VERIFY ?auto_70884 ?auto_70885 ?auto_70883 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_70893 - OBJ
      ?auto_70894 - OBJ
      ?auto_70892 - LOCATION
    )
    :vars
    (
      ?auto_70898 - OBJ
      ?auto_70900 - LOCATION
      ?auto_70895 - CITY
      ?auto_70897 - LOCATION
      ?auto_70899 - TRUCK
      ?auto_70896 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_70894 ?auto_70893 ) ) ( not ( = ?auto_70894 ?auto_70898 ) ) ( IN-CITY ?auto_70900 ?auto_70895 ) ( IN-CITY ?auto_70892 ?auto_70895 ) ( not ( = ?auto_70892 ?auto_70900 ) ) ( OBJ-AT ?auto_70894 ?auto_70900 ) ( not ( = ?auto_70893 ?auto_70898 ) ) ( IN-CITY ?auto_70897 ?auto_70895 ) ( not ( = ?auto_70892 ?auto_70897 ) ) ( not ( = ?auto_70900 ?auto_70897 ) ) ( OBJ-AT ?auto_70893 ?auto_70897 ) ( TRUCK-AT ?auto_70899 ?auto_70896 ) ( IN-CITY ?auto_70896 ?auto_70895 ) ( not ( = ?auto_70892 ?auto_70896 ) ) ( not ( = ?auto_70900 ?auto_70896 ) ) ( not ( = ?auto_70897 ?auto_70896 ) ) ( OBJ-AT ?auto_70898 ?auto_70896 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_70898 ?auto_70894 ?auto_70892 )
      ( DELIVER-2PKG-VERIFY ?auto_70893 ?auto_70894 ?auto_70892 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_70902 - OBJ
      ?auto_70903 - OBJ
      ?auto_70901 - LOCATION
    )
    :vars
    (
      ?auto_70909 - LOCATION
      ?auto_70904 - CITY
      ?auto_70905 - OBJ
      ?auto_70907 - LOCATION
      ?auto_70908 - TRUCK
      ?auto_70906 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_70903 ?auto_70902 ) ) ( IN-CITY ?auto_70909 ?auto_70904 ) ( IN-CITY ?auto_70901 ?auto_70904 ) ( not ( = ?auto_70901 ?auto_70909 ) ) ( OBJ-AT ?auto_70902 ?auto_70909 ) ( not ( = ?auto_70905 ?auto_70903 ) ) ( not ( = ?auto_70902 ?auto_70905 ) ) ( IN-CITY ?auto_70907 ?auto_70904 ) ( not ( = ?auto_70901 ?auto_70907 ) ) ( not ( = ?auto_70909 ?auto_70907 ) ) ( OBJ-AT ?auto_70905 ?auto_70907 ) ( TRUCK-AT ?auto_70908 ?auto_70906 ) ( IN-CITY ?auto_70906 ?auto_70904 ) ( not ( = ?auto_70901 ?auto_70906 ) ) ( not ( = ?auto_70909 ?auto_70906 ) ) ( not ( = ?auto_70907 ?auto_70906 ) ) ( OBJ-AT ?auto_70903 ?auto_70906 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_70903 ?auto_70902 ?auto_70901 )
      ( DELIVER-2PKG-VERIFY ?auto_70902 ?auto_70903 ?auto_70901 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_70911 - OBJ
      ?auto_70912 - OBJ
      ?auto_70910 - LOCATION
    )
    :vars
    (
      ?auto_70916 - OBJ
      ?auto_70918 - LOCATION
      ?auto_70913 - CITY
      ?auto_70915 - LOCATION
      ?auto_70917 - TRUCK
      ?auto_70914 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_70912 ?auto_70911 ) ) ( not ( = ?auto_70911 ?auto_70916 ) ) ( IN-CITY ?auto_70918 ?auto_70913 ) ( IN-CITY ?auto_70910 ?auto_70913 ) ( not ( = ?auto_70910 ?auto_70918 ) ) ( OBJ-AT ?auto_70911 ?auto_70918 ) ( not ( = ?auto_70912 ?auto_70916 ) ) ( IN-CITY ?auto_70915 ?auto_70913 ) ( not ( = ?auto_70910 ?auto_70915 ) ) ( not ( = ?auto_70918 ?auto_70915 ) ) ( OBJ-AT ?auto_70912 ?auto_70915 ) ( TRUCK-AT ?auto_70917 ?auto_70914 ) ( IN-CITY ?auto_70914 ?auto_70913 ) ( not ( = ?auto_70910 ?auto_70914 ) ) ( not ( = ?auto_70918 ?auto_70914 ) ) ( not ( = ?auto_70915 ?auto_70914 ) ) ( OBJ-AT ?auto_70916 ?auto_70914 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_70916 ?auto_70911 ?auto_70910 )
      ( DELIVER-2PKG-VERIFY ?auto_70911 ?auto_70912 ?auto_70910 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_70940 - OBJ
      ?auto_70941 - OBJ
      ?auto_70942 - OBJ
      ?auto_70939 - LOCATION
    )
    :vars
    (
      ?auto_70947 - LOCATION
      ?auto_70943 - CITY
      ?auto_70945 - LOCATION
      ?auto_70946 - TRUCK
      ?auto_70944 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_70941 ?auto_70940 ) ) ( not ( = ?auto_70942 ?auto_70940 ) ) ( not ( = ?auto_70942 ?auto_70941 ) ) ( IN-CITY ?auto_70947 ?auto_70943 ) ( IN-CITY ?auto_70939 ?auto_70943 ) ( not ( = ?auto_70939 ?auto_70947 ) ) ( OBJ-AT ?auto_70942 ?auto_70947 ) ( IN-CITY ?auto_70945 ?auto_70943 ) ( not ( = ?auto_70939 ?auto_70945 ) ) ( not ( = ?auto_70947 ?auto_70945 ) ) ( OBJ-AT ?auto_70941 ?auto_70945 ) ( TRUCK-AT ?auto_70946 ?auto_70944 ) ( IN-CITY ?auto_70944 ?auto_70943 ) ( not ( = ?auto_70939 ?auto_70944 ) ) ( not ( = ?auto_70947 ?auto_70944 ) ) ( not ( = ?auto_70945 ?auto_70944 ) ) ( OBJ-AT ?auto_70940 ?auto_70944 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_70940 ?auto_70942 ?auto_70939 )
      ( DELIVER-3PKG-VERIFY ?auto_70940 ?auto_70941 ?auto_70942 ?auto_70939 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_70959 - OBJ
      ?auto_70960 - OBJ
      ?auto_70961 - OBJ
      ?auto_70958 - LOCATION
    )
    :vars
    (
      ?auto_70966 - LOCATION
      ?auto_70962 - CITY
      ?auto_70964 - LOCATION
      ?auto_70965 - TRUCK
      ?auto_70963 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_70960 ?auto_70959 ) ) ( not ( = ?auto_70961 ?auto_70959 ) ) ( not ( = ?auto_70961 ?auto_70960 ) ) ( IN-CITY ?auto_70966 ?auto_70962 ) ( IN-CITY ?auto_70958 ?auto_70962 ) ( not ( = ?auto_70958 ?auto_70966 ) ) ( OBJ-AT ?auto_70960 ?auto_70966 ) ( IN-CITY ?auto_70964 ?auto_70962 ) ( not ( = ?auto_70958 ?auto_70964 ) ) ( not ( = ?auto_70966 ?auto_70964 ) ) ( OBJ-AT ?auto_70961 ?auto_70964 ) ( TRUCK-AT ?auto_70965 ?auto_70963 ) ( IN-CITY ?auto_70963 ?auto_70962 ) ( not ( = ?auto_70958 ?auto_70963 ) ) ( not ( = ?auto_70966 ?auto_70963 ) ) ( not ( = ?auto_70964 ?auto_70963 ) ) ( OBJ-AT ?auto_70959 ?auto_70963 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_70959 ?auto_70960 ?auto_70958 )
      ( DELIVER-3PKG-VERIFY ?auto_70959 ?auto_70960 ?auto_70961 ?auto_70958 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_70978 - OBJ
      ?auto_70979 - OBJ
      ?auto_70980 - OBJ
      ?auto_70977 - LOCATION
    )
    :vars
    (
      ?auto_70985 - LOCATION
      ?auto_70981 - CITY
      ?auto_70983 - LOCATION
      ?auto_70984 - TRUCK
      ?auto_70982 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_70979 ?auto_70978 ) ) ( not ( = ?auto_70980 ?auto_70978 ) ) ( not ( = ?auto_70980 ?auto_70979 ) ) ( IN-CITY ?auto_70985 ?auto_70981 ) ( IN-CITY ?auto_70977 ?auto_70981 ) ( not ( = ?auto_70977 ?auto_70985 ) ) ( OBJ-AT ?auto_70980 ?auto_70985 ) ( IN-CITY ?auto_70983 ?auto_70981 ) ( not ( = ?auto_70977 ?auto_70983 ) ) ( not ( = ?auto_70985 ?auto_70983 ) ) ( OBJ-AT ?auto_70978 ?auto_70983 ) ( TRUCK-AT ?auto_70984 ?auto_70982 ) ( IN-CITY ?auto_70982 ?auto_70981 ) ( not ( = ?auto_70977 ?auto_70982 ) ) ( not ( = ?auto_70985 ?auto_70982 ) ) ( not ( = ?auto_70983 ?auto_70982 ) ) ( OBJ-AT ?auto_70979 ?auto_70982 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_70979 ?auto_70980 ?auto_70977 )
      ( DELIVER-3PKG-VERIFY ?auto_70978 ?auto_70979 ?auto_70980 ?auto_70977 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_70997 - OBJ
      ?auto_70998 - OBJ
      ?auto_70999 - OBJ
      ?auto_70996 - LOCATION
    )
    :vars
    (
      ?auto_71004 - LOCATION
      ?auto_71000 - CITY
      ?auto_71002 - LOCATION
      ?auto_71003 - TRUCK
      ?auto_71001 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_70998 ?auto_70997 ) ) ( not ( = ?auto_70999 ?auto_70997 ) ) ( not ( = ?auto_70999 ?auto_70998 ) ) ( IN-CITY ?auto_71004 ?auto_71000 ) ( IN-CITY ?auto_70996 ?auto_71000 ) ( not ( = ?auto_70996 ?auto_71004 ) ) ( OBJ-AT ?auto_70998 ?auto_71004 ) ( IN-CITY ?auto_71002 ?auto_71000 ) ( not ( = ?auto_70996 ?auto_71002 ) ) ( not ( = ?auto_71004 ?auto_71002 ) ) ( OBJ-AT ?auto_70997 ?auto_71002 ) ( TRUCK-AT ?auto_71003 ?auto_71001 ) ( IN-CITY ?auto_71001 ?auto_71000 ) ( not ( = ?auto_70996 ?auto_71001 ) ) ( not ( = ?auto_71004 ?auto_71001 ) ) ( not ( = ?auto_71002 ?auto_71001 ) ) ( OBJ-AT ?auto_70999 ?auto_71001 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_70999 ?auto_70998 ?auto_70996 )
      ( DELIVER-3PKG-VERIFY ?auto_70997 ?auto_70998 ?auto_70999 ?auto_70996 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_71036 - OBJ
      ?auto_71037 - OBJ
      ?auto_71038 - OBJ
      ?auto_71035 - LOCATION
    )
    :vars
    (
      ?auto_71043 - LOCATION
      ?auto_71039 - CITY
      ?auto_71041 - LOCATION
      ?auto_71042 - TRUCK
      ?auto_71040 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_71037 ?auto_71036 ) ) ( not ( = ?auto_71038 ?auto_71036 ) ) ( not ( = ?auto_71038 ?auto_71037 ) ) ( IN-CITY ?auto_71043 ?auto_71039 ) ( IN-CITY ?auto_71035 ?auto_71039 ) ( not ( = ?auto_71035 ?auto_71043 ) ) ( OBJ-AT ?auto_71036 ?auto_71043 ) ( IN-CITY ?auto_71041 ?auto_71039 ) ( not ( = ?auto_71035 ?auto_71041 ) ) ( not ( = ?auto_71043 ?auto_71041 ) ) ( OBJ-AT ?auto_71038 ?auto_71041 ) ( TRUCK-AT ?auto_71042 ?auto_71040 ) ( IN-CITY ?auto_71040 ?auto_71039 ) ( not ( = ?auto_71035 ?auto_71040 ) ) ( not ( = ?auto_71043 ?auto_71040 ) ) ( not ( = ?auto_71041 ?auto_71040 ) ) ( OBJ-AT ?auto_71037 ?auto_71040 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_71037 ?auto_71036 ?auto_71035 )
      ( DELIVER-3PKG-VERIFY ?auto_71036 ?auto_71037 ?auto_71038 ?auto_71035 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_71055 - OBJ
      ?auto_71056 - OBJ
      ?auto_71057 - OBJ
      ?auto_71054 - LOCATION
    )
    :vars
    (
      ?auto_71062 - LOCATION
      ?auto_71058 - CITY
      ?auto_71060 - LOCATION
      ?auto_71061 - TRUCK
      ?auto_71059 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_71056 ?auto_71055 ) ) ( not ( = ?auto_71057 ?auto_71055 ) ) ( not ( = ?auto_71057 ?auto_71056 ) ) ( IN-CITY ?auto_71062 ?auto_71058 ) ( IN-CITY ?auto_71054 ?auto_71058 ) ( not ( = ?auto_71054 ?auto_71062 ) ) ( OBJ-AT ?auto_71055 ?auto_71062 ) ( IN-CITY ?auto_71060 ?auto_71058 ) ( not ( = ?auto_71054 ?auto_71060 ) ) ( not ( = ?auto_71062 ?auto_71060 ) ) ( OBJ-AT ?auto_71056 ?auto_71060 ) ( TRUCK-AT ?auto_71061 ?auto_71059 ) ( IN-CITY ?auto_71059 ?auto_71058 ) ( not ( = ?auto_71054 ?auto_71059 ) ) ( not ( = ?auto_71062 ?auto_71059 ) ) ( not ( = ?auto_71060 ?auto_71059 ) ) ( OBJ-AT ?auto_71057 ?auto_71059 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_71057 ?auto_71055 ?auto_71054 )
      ( DELIVER-3PKG-VERIFY ?auto_71055 ?auto_71056 ?auto_71057 ?auto_71054 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_71795 - OBJ
      ?auto_71794 - LOCATION
    )
    :vars
    (
      ?auto_71800 - OBJ
      ?auto_71802 - LOCATION
      ?auto_71796 - CITY
      ?auto_71797 - OBJ
      ?auto_71799 - LOCATION
      ?auto_71798 - LOCATION
      ?auto_71801 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_71795 ?auto_71800 ) ) ( IN-CITY ?auto_71802 ?auto_71796 ) ( IN-CITY ?auto_71794 ?auto_71796 ) ( not ( = ?auto_71794 ?auto_71802 ) ) ( OBJ-AT ?auto_71795 ?auto_71802 ) ( not ( = ?auto_71797 ?auto_71800 ) ) ( not ( = ?auto_71795 ?auto_71797 ) ) ( IN-CITY ?auto_71799 ?auto_71796 ) ( not ( = ?auto_71794 ?auto_71799 ) ) ( not ( = ?auto_71802 ?auto_71799 ) ) ( OBJ-AT ?auto_71797 ?auto_71799 ) ( IN-CITY ?auto_71798 ?auto_71796 ) ( not ( = ?auto_71794 ?auto_71798 ) ) ( not ( = ?auto_71802 ?auto_71798 ) ) ( not ( = ?auto_71799 ?auto_71798 ) ) ( OBJ-AT ?auto_71800 ?auto_71798 ) ( TRUCK-AT ?auto_71801 ?auto_71794 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_71801 ?auto_71794 ?auto_71798 ?auto_71796 )
      ( DELIVER-2PKG ?auto_71800 ?auto_71795 ?auto_71794 )
      ( DELIVER-1PKG-VERIFY ?auto_71795 ?auto_71794 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_71804 - OBJ
      ?auto_71805 - OBJ
      ?auto_71803 - LOCATION
    )
    :vars
    (
      ?auto_71811 - LOCATION
      ?auto_71808 - CITY
      ?auto_71807 - OBJ
      ?auto_71809 - LOCATION
      ?auto_71806 - LOCATION
      ?auto_71810 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_71805 ?auto_71804 ) ) ( IN-CITY ?auto_71811 ?auto_71808 ) ( IN-CITY ?auto_71803 ?auto_71808 ) ( not ( = ?auto_71803 ?auto_71811 ) ) ( OBJ-AT ?auto_71805 ?auto_71811 ) ( not ( = ?auto_71807 ?auto_71804 ) ) ( not ( = ?auto_71805 ?auto_71807 ) ) ( IN-CITY ?auto_71809 ?auto_71808 ) ( not ( = ?auto_71803 ?auto_71809 ) ) ( not ( = ?auto_71811 ?auto_71809 ) ) ( OBJ-AT ?auto_71807 ?auto_71809 ) ( IN-CITY ?auto_71806 ?auto_71808 ) ( not ( = ?auto_71803 ?auto_71806 ) ) ( not ( = ?auto_71811 ?auto_71806 ) ) ( not ( = ?auto_71809 ?auto_71806 ) ) ( OBJ-AT ?auto_71804 ?auto_71806 ) ( TRUCK-AT ?auto_71810 ?auto_71803 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_71805 ?auto_71803 )
      ( DELIVER-2PKG-VERIFY ?auto_71804 ?auto_71805 ?auto_71803 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_71813 - OBJ
      ?auto_71814 - OBJ
      ?auto_71812 - LOCATION
    )
    :vars
    (
      ?auto_71818 - OBJ
      ?auto_71817 - LOCATION
      ?auto_71816 - CITY
      ?auto_71815 - LOCATION
      ?auto_71819 - LOCATION
      ?auto_71820 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_71814 ?auto_71813 ) ) ( not ( = ?auto_71814 ?auto_71818 ) ) ( IN-CITY ?auto_71817 ?auto_71816 ) ( IN-CITY ?auto_71812 ?auto_71816 ) ( not ( = ?auto_71812 ?auto_71817 ) ) ( OBJ-AT ?auto_71814 ?auto_71817 ) ( not ( = ?auto_71813 ?auto_71818 ) ) ( IN-CITY ?auto_71815 ?auto_71816 ) ( not ( = ?auto_71812 ?auto_71815 ) ) ( not ( = ?auto_71817 ?auto_71815 ) ) ( OBJ-AT ?auto_71813 ?auto_71815 ) ( IN-CITY ?auto_71819 ?auto_71816 ) ( not ( = ?auto_71812 ?auto_71819 ) ) ( not ( = ?auto_71817 ?auto_71819 ) ) ( not ( = ?auto_71815 ?auto_71819 ) ) ( OBJ-AT ?auto_71818 ?auto_71819 ) ( TRUCK-AT ?auto_71820 ?auto_71812 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_71818 ?auto_71814 ?auto_71812 )
      ( DELIVER-2PKG-VERIFY ?auto_71813 ?auto_71814 ?auto_71812 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_71822 - OBJ
      ?auto_71823 - OBJ
      ?auto_71821 - LOCATION
    )
    :vars
    (
      ?auto_71827 - LOCATION
      ?auto_71826 - CITY
      ?auto_71825 - OBJ
      ?auto_71824 - LOCATION
      ?auto_71828 - LOCATION
      ?auto_71829 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_71823 ?auto_71822 ) ) ( IN-CITY ?auto_71827 ?auto_71826 ) ( IN-CITY ?auto_71821 ?auto_71826 ) ( not ( = ?auto_71821 ?auto_71827 ) ) ( OBJ-AT ?auto_71822 ?auto_71827 ) ( not ( = ?auto_71825 ?auto_71823 ) ) ( not ( = ?auto_71822 ?auto_71825 ) ) ( IN-CITY ?auto_71824 ?auto_71826 ) ( not ( = ?auto_71821 ?auto_71824 ) ) ( not ( = ?auto_71827 ?auto_71824 ) ) ( OBJ-AT ?auto_71825 ?auto_71824 ) ( IN-CITY ?auto_71828 ?auto_71826 ) ( not ( = ?auto_71821 ?auto_71828 ) ) ( not ( = ?auto_71827 ?auto_71828 ) ) ( not ( = ?auto_71824 ?auto_71828 ) ) ( OBJ-AT ?auto_71823 ?auto_71828 ) ( TRUCK-AT ?auto_71829 ?auto_71821 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_71823 ?auto_71822 ?auto_71821 )
      ( DELIVER-2PKG-VERIFY ?auto_71822 ?auto_71823 ?auto_71821 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_71831 - OBJ
      ?auto_71832 - OBJ
      ?auto_71830 - LOCATION
    )
    :vars
    (
      ?auto_71836 - OBJ
      ?auto_71835 - LOCATION
      ?auto_71834 - CITY
      ?auto_71833 - LOCATION
      ?auto_71837 - LOCATION
      ?auto_71838 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_71832 ?auto_71831 ) ) ( not ( = ?auto_71831 ?auto_71836 ) ) ( IN-CITY ?auto_71835 ?auto_71834 ) ( IN-CITY ?auto_71830 ?auto_71834 ) ( not ( = ?auto_71830 ?auto_71835 ) ) ( OBJ-AT ?auto_71831 ?auto_71835 ) ( not ( = ?auto_71832 ?auto_71836 ) ) ( IN-CITY ?auto_71833 ?auto_71834 ) ( not ( = ?auto_71830 ?auto_71833 ) ) ( not ( = ?auto_71835 ?auto_71833 ) ) ( OBJ-AT ?auto_71832 ?auto_71833 ) ( IN-CITY ?auto_71837 ?auto_71834 ) ( not ( = ?auto_71830 ?auto_71837 ) ) ( not ( = ?auto_71835 ?auto_71837 ) ) ( not ( = ?auto_71833 ?auto_71837 ) ) ( OBJ-AT ?auto_71836 ?auto_71837 ) ( TRUCK-AT ?auto_71838 ?auto_71830 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_71836 ?auto_71831 ?auto_71830 )
      ( DELIVER-2PKG-VERIFY ?auto_71831 ?auto_71832 ?auto_71830 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_71860 - OBJ
      ?auto_71861 - OBJ
      ?auto_71862 - OBJ
      ?auto_71859 - LOCATION
    )
    :vars
    (
      ?auto_71865 - LOCATION
      ?auto_71864 - CITY
      ?auto_71863 - LOCATION
      ?auto_71866 - LOCATION
      ?auto_71867 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_71861 ?auto_71860 ) ) ( not ( = ?auto_71862 ?auto_71860 ) ) ( not ( = ?auto_71862 ?auto_71861 ) ) ( IN-CITY ?auto_71865 ?auto_71864 ) ( IN-CITY ?auto_71859 ?auto_71864 ) ( not ( = ?auto_71859 ?auto_71865 ) ) ( OBJ-AT ?auto_71862 ?auto_71865 ) ( IN-CITY ?auto_71863 ?auto_71864 ) ( not ( = ?auto_71859 ?auto_71863 ) ) ( not ( = ?auto_71865 ?auto_71863 ) ) ( OBJ-AT ?auto_71861 ?auto_71863 ) ( IN-CITY ?auto_71866 ?auto_71864 ) ( not ( = ?auto_71859 ?auto_71866 ) ) ( not ( = ?auto_71865 ?auto_71866 ) ) ( not ( = ?auto_71863 ?auto_71866 ) ) ( OBJ-AT ?auto_71860 ?auto_71866 ) ( TRUCK-AT ?auto_71867 ?auto_71859 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_71860 ?auto_71862 ?auto_71859 )
      ( DELIVER-3PKG-VERIFY ?auto_71860 ?auto_71861 ?auto_71862 ?auto_71859 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_71879 - OBJ
      ?auto_71880 - OBJ
      ?auto_71881 - OBJ
      ?auto_71878 - LOCATION
    )
    :vars
    (
      ?auto_71884 - LOCATION
      ?auto_71883 - CITY
      ?auto_71882 - LOCATION
      ?auto_71885 - LOCATION
      ?auto_71886 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_71880 ?auto_71879 ) ) ( not ( = ?auto_71881 ?auto_71879 ) ) ( not ( = ?auto_71881 ?auto_71880 ) ) ( IN-CITY ?auto_71884 ?auto_71883 ) ( IN-CITY ?auto_71878 ?auto_71883 ) ( not ( = ?auto_71878 ?auto_71884 ) ) ( OBJ-AT ?auto_71880 ?auto_71884 ) ( IN-CITY ?auto_71882 ?auto_71883 ) ( not ( = ?auto_71878 ?auto_71882 ) ) ( not ( = ?auto_71884 ?auto_71882 ) ) ( OBJ-AT ?auto_71881 ?auto_71882 ) ( IN-CITY ?auto_71885 ?auto_71883 ) ( not ( = ?auto_71878 ?auto_71885 ) ) ( not ( = ?auto_71884 ?auto_71885 ) ) ( not ( = ?auto_71882 ?auto_71885 ) ) ( OBJ-AT ?auto_71879 ?auto_71885 ) ( TRUCK-AT ?auto_71886 ?auto_71878 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_71879 ?auto_71880 ?auto_71878 )
      ( DELIVER-3PKG-VERIFY ?auto_71879 ?auto_71880 ?auto_71881 ?auto_71878 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_71898 - OBJ
      ?auto_71899 - OBJ
      ?auto_71900 - OBJ
      ?auto_71897 - LOCATION
    )
    :vars
    (
      ?auto_71903 - LOCATION
      ?auto_71902 - CITY
      ?auto_71901 - LOCATION
      ?auto_71904 - LOCATION
      ?auto_71905 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_71899 ?auto_71898 ) ) ( not ( = ?auto_71900 ?auto_71898 ) ) ( not ( = ?auto_71900 ?auto_71899 ) ) ( IN-CITY ?auto_71903 ?auto_71902 ) ( IN-CITY ?auto_71897 ?auto_71902 ) ( not ( = ?auto_71897 ?auto_71903 ) ) ( OBJ-AT ?auto_71900 ?auto_71903 ) ( IN-CITY ?auto_71901 ?auto_71902 ) ( not ( = ?auto_71897 ?auto_71901 ) ) ( not ( = ?auto_71903 ?auto_71901 ) ) ( OBJ-AT ?auto_71898 ?auto_71901 ) ( IN-CITY ?auto_71904 ?auto_71902 ) ( not ( = ?auto_71897 ?auto_71904 ) ) ( not ( = ?auto_71903 ?auto_71904 ) ) ( not ( = ?auto_71901 ?auto_71904 ) ) ( OBJ-AT ?auto_71899 ?auto_71904 ) ( TRUCK-AT ?auto_71905 ?auto_71897 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_71899 ?auto_71900 ?auto_71897 )
      ( DELIVER-3PKG-VERIFY ?auto_71898 ?auto_71899 ?auto_71900 ?auto_71897 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_71917 - OBJ
      ?auto_71918 - OBJ
      ?auto_71919 - OBJ
      ?auto_71916 - LOCATION
    )
    :vars
    (
      ?auto_71922 - LOCATION
      ?auto_71921 - CITY
      ?auto_71920 - LOCATION
      ?auto_71923 - LOCATION
      ?auto_71924 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_71918 ?auto_71917 ) ) ( not ( = ?auto_71919 ?auto_71917 ) ) ( not ( = ?auto_71919 ?auto_71918 ) ) ( IN-CITY ?auto_71922 ?auto_71921 ) ( IN-CITY ?auto_71916 ?auto_71921 ) ( not ( = ?auto_71916 ?auto_71922 ) ) ( OBJ-AT ?auto_71918 ?auto_71922 ) ( IN-CITY ?auto_71920 ?auto_71921 ) ( not ( = ?auto_71916 ?auto_71920 ) ) ( not ( = ?auto_71922 ?auto_71920 ) ) ( OBJ-AT ?auto_71917 ?auto_71920 ) ( IN-CITY ?auto_71923 ?auto_71921 ) ( not ( = ?auto_71916 ?auto_71923 ) ) ( not ( = ?auto_71922 ?auto_71923 ) ) ( not ( = ?auto_71920 ?auto_71923 ) ) ( OBJ-AT ?auto_71919 ?auto_71923 ) ( TRUCK-AT ?auto_71924 ?auto_71916 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_71919 ?auto_71918 ?auto_71916 )
      ( DELIVER-3PKG-VERIFY ?auto_71917 ?auto_71918 ?auto_71919 ?auto_71916 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_71956 - OBJ
      ?auto_71957 - OBJ
      ?auto_71958 - OBJ
      ?auto_71955 - LOCATION
    )
    :vars
    (
      ?auto_71961 - LOCATION
      ?auto_71960 - CITY
      ?auto_71959 - LOCATION
      ?auto_71962 - LOCATION
      ?auto_71963 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_71957 ?auto_71956 ) ) ( not ( = ?auto_71958 ?auto_71956 ) ) ( not ( = ?auto_71958 ?auto_71957 ) ) ( IN-CITY ?auto_71961 ?auto_71960 ) ( IN-CITY ?auto_71955 ?auto_71960 ) ( not ( = ?auto_71955 ?auto_71961 ) ) ( OBJ-AT ?auto_71956 ?auto_71961 ) ( IN-CITY ?auto_71959 ?auto_71960 ) ( not ( = ?auto_71955 ?auto_71959 ) ) ( not ( = ?auto_71961 ?auto_71959 ) ) ( OBJ-AT ?auto_71958 ?auto_71959 ) ( IN-CITY ?auto_71962 ?auto_71960 ) ( not ( = ?auto_71955 ?auto_71962 ) ) ( not ( = ?auto_71961 ?auto_71962 ) ) ( not ( = ?auto_71959 ?auto_71962 ) ) ( OBJ-AT ?auto_71957 ?auto_71962 ) ( TRUCK-AT ?auto_71963 ?auto_71955 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_71957 ?auto_71956 ?auto_71955 )
      ( DELIVER-3PKG-VERIFY ?auto_71956 ?auto_71957 ?auto_71958 ?auto_71955 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_71975 - OBJ
      ?auto_71976 - OBJ
      ?auto_71977 - OBJ
      ?auto_71974 - LOCATION
    )
    :vars
    (
      ?auto_71980 - LOCATION
      ?auto_71979 - CITY
      ?auto_71978 - LOCATION
      ?auto_71981 - LOCATION
      ?auto_71982 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_71976 ?auto_71975 ) ) ( not ( = ?auto_71977 ?auto_71975 ) ) ( not ( = ?auto_71977 ?auto_71976 ) ) ( IN-CITY ?auto_71980 ?auto_71979 ) ( IN-CITY ?auto_71974 ?auto_71979 ) ( not ( = ?auto_71974 ?auto_71980 ) ) ( OBJ-AT ?auto_71975 ?auto_71980 ) ( IN-CITY ?auto_71978 ?auto_71979 ) ( not ( = ?auto_71974 ?auto_71978 ) ) ( not ( = ?auto_71980 ?auto_71978 ) ) ( OBJ-AT ?auto_71976 ?auto_71978 ) ( IN-CITY ?auto_71981 ?auto_71979 ) ( not ( = ?auto_71974 ?auto_71981 ) ) ( not ( = ?auto_71980 ?auto_71981 ) ) ( not ( = ?auto_71978 ?auto_71981 ) ) ( OBJ-AT ?auto_71977 ?auto_71981 ) ( TRUCK-AT ?auto_71982 ?auto_71974 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_71977 ?auto_71975 ?auto_71974 )
      ( DELIVER-3PKG-VERIFY ?auto_71975 ?auto_71976 ?auto_71977 ?auto_71974 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_73761 - OBJ
      ?auto_73760 - LOCATION
    )
    :vars
    (
      ?auto_73762 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_73762 ?auto_73760 ) ( IN-TRUCK ?auto_73761 ?auto_73762 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_73761 ?auto_73762 ?auto_73760 )
      ( DELIVER-1PKG-VERIFY ?auto_73761 ?auto_73760 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_73764 - OBJ
      ?auto_73765 - OBJ
      ?auto_73763 - LOCATION
    )
    :vars
    (
      ?auto_73766 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73765 ?auto_73764 ) ) ( TRUCK-AT ?auto_73766 ?auto_73763 ) ( IN-TRUCK ?auto_73765 ?auto_73766 ) ( OBJ-AT ?auto_73764 ?auto_73763 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73765 ?auto_73763 )
      ( DELIVER-2PKG-VERIFY ?auto_73764 ?auto_73765 ?auto_73763 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_73768 - OBJ
      ?auto_73769 - OBJ
      ?auto_73767 - LOCATION
    )
    :vars
    (
      ?auto_73770 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73769 ?auto_73768 ) ) ( TRUCK-AT ?auto_73770 ?auto_73767 ) ( IN-TRUCK ?auto_73769 ?auto_73770 ) ( OBJ-AT ?auto_73768 ?auto_73767 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73769 ?auto_73767 )
      ( DELIVER-2PKG-VERIFY ?auto_73768 ?auto_73769 ?auto_73767 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_73772 - OBJ
      ?auto_73773 - OBJ
      ?auto_73771 - LOCATION
    )
    :vars
    (
      ?auto_73774 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73773 ?auto_73772 ) ) ( TRUCK-AT ?auto_73774 ?auto_73771 ) ( IN-TRUCK ?auto_73773 ?auto_73774 ) ( OBJ-AT ?auto_73772 ?auto_73771 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73773 ?auto_73771 )
      ( DELIVER-2PKG-VERIFY ?auto_73772 ?auto_73773 ?auto_73771 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_73776 - OBJ
      ?auto_73777 - OBJ
      ?auto_73775 - LOCATION
    )
    :vars
    (
      ?auto_73778 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73777 ?auto_73776 ) ) ( TRUCK-AT ?auto_73778 ?auto_73775 ) ( IN-TRUCK ?auto_73776 ?auto_73778 ) ( OBJ-AT ?auto_73777 ?auto_73775 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73776 ?auto_73775 )
      ( DELIVER-2PKG-VERIFY ?auto_73776 ?auto_73777 ?auto_73775 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_73780 - OBJ
      ?auto_73781 - OBJ
      ?auto_73779 - LOCATION
    )
    :vars
    (
      ?auto_73782 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73781 ?auto_73780 ) ) ( TRUCK-AT ?auto_73782 ?auto_73779 ) ( IN-TRUCK ?auto_73780 ?auto_73782 ) ( OBJ-AT ?auto_73781 ?auto_73779 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73780 ?auto_73779 )
      ( DELIVER-2PKG-VERIFY ?auto_73780 ?auto_73781 ?auto_73779 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_73784 - OBJ
      ?auto_73785 - OBJ
      ?auto_73783 - LOCATION
    )
    :vars
    (
      ?auto_73786 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73785 ?auto_73784 ) ) ( TRUCK-AT ?auto_73786 ?auto_73783 ) ( IN-TRUCK ?auto_73784 ?auto_73786 ) ( OBJ-AT ?auto_73785 ?auto_73783 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73784 ?auto_73783 )
      ( DELIVER-2PKG-VERIFY ?auto_73784 ?auto_73785 ?auto_73783 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_73797 - OBJ
      ?auto_73798 - OBJ
      ?auto_73799 - OBJ
      ?auto_73796 - LOCATION
    )
    :vars
    (
      ?auto_73800 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73798 ?auto_73797 ) ) ( not ( = ?auto_73799 ?auto_73797 ) ) ( not ( = ?auto_73799 ?auto_73798 ) ) ( TRUCK-AT ?auto_73800 ?auto_73796 ) ( IN-TRUCK ?auto_73799 ?auto_73800 ) ( OBJ-AT ?auto_73797 ?auto_73796 ) ( OBJ-AT ?auto_73798 ?auto_73796 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73799 ?auto_73796 )
      ( DELIVER-3PKG-VERIFY ?auto_73797 ?auto_73798 ?auto_73799 ?auto_73796 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_73802 - OBJ
      ?auto_73803 - OBJ
      ?auto_73804 - OBJ
      ?auto_73801 - LOCATION
    )
    :vars
    (
      ?auto_73805 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73803 ?auto_73802 ) ) ( not ( = ?auto_73804 ?auto_73802 ) ) ( not ( = ?auto_73804 ?auto_73803 ) ) ( TRUCK-AT ?auto_73805 ?auto_73801 ) ( IN-TRUCK ?auto_73804 ?auto_73805 ) ( OBJ-AT ?auto_73802 ?auto_73801 ) ( OBJ-AT ?auto_73803 ?auto_73801 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73804 ?auto_73801 )
      ( DELIVER-3PKG-VERIFY ?auto_73802 ?auto_73803 ?auto_73804 ?auto_73801 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_73812 - OBJ
      ?auto_73813 - OBJ
      ?auto_73814 - OBJ
      ?auto_73811 - LOCATION
    )
    :vars
    (
      ?auto_73815 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73813 ?auto_73812 ) ) ( not ( = ?auto_73814 ?auto_73812 ) ) ( not ( = ?auto_73814 ?auto_73813 ) ) ( TRUCK-AT ?auto_73815 ?auto_73811 ) ( IN-TRUCK ?auto_73813 ?auto_73815 ) ( OBJ-AT ?auto_73812 ?auto_73811 ) ( OBJ-AT ?auto_73814 ?auto_73811 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73813 ?auto_73811 )
      ( DELIVER-3PKG-VERIFY ?auto_73812 ?auto_73813 ?auto_73814 ?auto_73811 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_73817 - OBJ
      ?auto_73818 - OBJ
      ?auto_73819 - OBJ
      ?auto_73816 - LOCATION
    )
    :vars
    (
      ?auto_73820 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73818 ?auto_73817 ) ) ( not ( = ?auto_73819 ?auto_73817 ) ) ( not ( = ?auto_73819 ?auto_73818 ) ) ( TRUCK-AT ?auto_73820 ?auto_73816 ) ( IN-TRUCK ?auto_73818 ?auto_73820 ) ( OBJ-AT ?auto_73817 ?auto_73816 ) ( OBJ-AT ?auto_73819 ?auto_73816 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73818 ?auto_73816 )
      ( DELIVER-3PKG-VERIFY ?auto_73817 ?auto_73818 ?auto_73819 ?auto_73816 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_73827 - OBJ
      ?auto_73828 - OBJ
      ?auto_73829 - OBJ
      ?auto_73826 - LOCATION
    )
    :vars
    (
      ?auto_73830 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73828 ?auto_73827 ) ) ( not ( = ?auto_73829 ?auto_73827 ) ) ( not ( = ?auto_73829 ?auto_73828 ) ) ( TRUCK-AT ?auto_73830 ?auto_73826 ) ( IN-TRUCK ?auto_73829 ?auto_73830 ) ( OBJ-AT ?auto_73827 ?auto_73826 ) ( OBJ-AT ?auto_73828 ?auto_73826 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73829 ?auto_73826 )
      ( DELIVER-3PKG-VERIFY ?auto_73827 ?auto_73828 ?auto_73829 ?auto_73826 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_73837 - OBJ
      ?auto_73838 - OBJ
      ?auto_73839 - OBJ
      ?auto_73836 - LOCATION
    )
    :vars
    (
      ?auto_73840 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73838 ?auto_73837 ) ) ( not ( = ?auto_73839 ?auto_73837 ) ) ( not ( = ?auto_73839 ?auto_73838 ) ) ( TRUCK-AT ?auto_73840 ?auto_73836 ) ( IN-TRUCK ?auto_73839 ?auto_73840 ) ( OBJ-AT ?auto_73837 ?auto_73836 ) ( OBJ-AT ?auto_73838 ?auto_73836 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73839 ?auto_73836 )
      ( DELIVER-3PKG-VERIFY ?auto_73837 ?auto_73838 ?auto_73839 ?auto_73836 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_73842 - OBJ
      ?auto_73843 - OBJ
      ?auto_73844 - OBJ
      ?auto_73841 - LOCATION
    )
    :vars
    (
      ?auto_73845 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73843 ?auto_73842 ) ) ( not ( = ?auto_73844 ?auto_73842 ) ) ( not ( = ?auto_73844 ?auto_73843 ) ) ( TRUCK-AT ?auto_73845 ?auto_73841 ) ( IN-TRUCK ?auto_73843 ?auto_73845 ) ( OBJ-AT ?auto_73842 ?auto_73841 ) ( OBJ-AT ?auto_73844 ?auto_73841 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73843 ?auto_73841 )
      ( DELIVER-3PKG-VERIFY ?auto_73842 ?auto_73843 ?auto_73844 ?auto_73841 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_73852 - OBJ
      ?auto_73853 - OBJ
      ?auto_73854 - OBJ
      ?auto_73851 - LOCATION
    )
    :vars
    (
      ?auto_73855 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73853 ?auto_73852 ) ) ( not ( = ?auto_73854 ?auto_73852 ) ) ( not ( = ?auto_73854 ?auto_73853 ) ) ( TRUCK-AT ?auto_73855 ?auto_73851 ) ( IN-TRUCK ?auto_73853 ?auto_73855 ) ( OBJ-AT ?auto_73852 ?auto_73851 ) ( OBJ-AT ?auto_73854 ?auto_73851 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73853 ?auto_73851 )
      ( DELIVER-3PKG-VERIFY ?auto_73852 ?auto_73853 ?auto_73854 ?auto_73851 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_73862 - OBJ
      ?auto_73863 - OBJ
      ?auto_73864 - OBJ
      ?auto_73861 - LOCATION
    )
    :vars
    (
      ?auto_73865 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73863 ?auto_73862 ) ) ( not ( = ?auto_73864 ?auto_73862 ) ) ( not ( = ?auto_73864 ?auto_73863 ) ) ( TRUCK-AT ?auto_73865 ?auto_73861 ) ( IN-TRUCK ?auto_73864 ?auto_73865 ) ( OBJ-AT ?auto_73862 ?auto_73861 ) ( OBJ-AT ?auto_73863 ?auto_73861 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73864 ?auto_73861 )
      ( DELIVER-3PKG-VERIFY ?auto_73862 ?auto_73863 ?auto_73864 ?auto_73861 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_73867 - OBJ
      ?auto_73868 - OBJ
      ?auto_73869 - OBJ
      ?auto_73866 - LOCATION
    )
    :vars
    (
      ?auto_73870 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73868 ?auto_73867 ) ) ( not ( = ?auto_73869 ?auto_73867 ) ) ( not ( = ?auto_73869 ?auto_73868 ) ) ( TRUCK-AT ?auto_73870 ?auto_73866 ) ( IN-TRUCK ?auto_73869 ?auto_73870 ) ( OBJ-AT ?auto_73867 ?auto_73866 ) ( OBJ-AT ?auto_73868 ?auto_73866 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73869 ?auto_73866 )
      ( DELIVER-3PKG-VERIFY ?auto_73867 ?auto_73868 ?auto_73869 ?auto_73866 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_73877 - OBJ
      ?auto_73878 - OBJ
      ?auto_73879 - OBJ
      ?auto_73876 - LOCATION
    )
    :vars
    (
      ?auto_73880 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73878 ?auto_73877 ) ) ( not ( = ?auto_73879 ?auto_73877 ) ) ( not ( = ?auto_73879 ?auto_73878 ) ) ( TRUCK-AT ?auto_73880 ?auto_73876 ) ( IN-TRUCK ?auto_73878 ?auto_73880 ) ( OBJ-AT ?auto_73877 ?auto_73876 ) ( OBJ-AT ?auto_73879 ?auto_73876 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73878 ?auto_73876 )
      ( DELIVER-3PKG-VERIFY ?auto_73877 ?auto_73878 ?auto_73879 ?auto_73876 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_73882 - OBJ
      ?auto_73883 - OBJ
      ?auto_73884 - OBJ
      ?auto_73881 - LOCATION
    )
    :vars
    (
      ?auto_73885 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73883 ?auto_73882 ) ) ( not ( = ?auto_73884 ?auto_73882 ) ) ( not ( = ?auto_73884 ?auto_73883 ) ) ( TRUCK-AT ?auto_73885 ?auto_73881 ) ( IN-TRUCK ?auto_73883 ?auto_73885 ) ( OBJ-AT ?auto_73882 ?auto_73881 ) ( OBJ-AT ?auto_73884 ?auto_73881 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73883 ?auto_73881 )
      ( DELIVER-3PKG-VERIFY ?auto_73882 ?auto_73883 ?auto_73884 ?auto_73881 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_73902 - OBJ
      ?auto_73903 - OBJ
      ?auto_73904 - OBJ
      ?auto_73901 - LOCATION
    )
    :vars
    (
      ?auto_73905 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73903 ?auto_73902 ) ) ( not ( = ?auto_73904 ?auto_73902 ) ) ( not ( = ?auto_73904 ?auto_73903 ) ) ( TRUCK-AT ?auto_73905 ?auto_73901 ) ( IN-TRUCK ?auto_73902 ?auto_73905 ) ( OBJ-AT ?auto_73903 ?auto_73901 ) ( OBJ-AT ?auto_73904 ?auto_73901 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73902 ?auto_73901 )
      ( DELIVER-3PKG-VERIFY ?auto_73902 ?auto_73903 ?auto_73904 ?auto_73901 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_73907 - OBJ
      ?auto_73908 - OBJ
      ?auto_73909 - OBJ
      ?auto_73906 - LOCATION
    )
    :vars
    (
      ?auto_73910 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73908 ?auto_73907 ) ) ( not ( = ?auto_73909 ?auto_73907 ) ) ( not ( = ?auto_73909 ?auto_73908 ) ) ( TRUCK-AT ?auto_73910 ?auto_73906 ) ( IN-TRUCK ?auto_73907 ?auto_73910 ) ( OBJ-AT ?auto_73908 ?auto_73906 ) ( OBJ-AT ?auto_73909 ?auto_73906 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73907 ?auto_73906 )
      ( DELIVER-3PKG-VERIFY ?auto_73907 ?auto_73908 ?auto_73909 ?auto_73906 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_73917 - OBJ
      ?auto_73918 - OBJ
      ?auto_73919 - OBJ
      ?auto_73916 - LOCATION
    )
    :vars
    (
      ?auto_73920 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73918 ?auto_73917 ) ) ( not ( = ?auto_73919 ?auto_73917 ) ) ( not ( = ?auto_73919 ?auto_73918 ) ) ( TRUCK-AT ?auto_73920 ?auto_73916 ) ( IN-TRUCK ?auto_73917 ?auto_73920 ) ( OBJ-AT ?auto_73918 ?auto_73916 ) ( OBJ-AT ?auto_73919 ?auto_73916 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73917 ?auto_73916 )
      ( DELIVER-3PKG-VERIFY ?auto_73917 ?auto_73918 ?auto_73919 ?auto_73916 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_73927 - OBJ
      ?auto_73928 - OBJ
      ?auto_73929 - OBJ
      ?auto_73926 - LOCATION
    )
    :vars
    (
      ?auto_73930 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73928 ?auto_73927 ) ) ( not ( = ?auto_73929 ?auto_73927 ) ) ( not ( = ?auto_73929 ?auto_73928 ) ) ( TRUCK-AT ?auto_73930 ?auto_73926 ) ( IN-TRUCK ?auto_73927 ?auto_73930 ) ( OBJ-AT ?auto_73928 ?auto_73926 ) ( OBJ-AT ?auto_73929 ?auto_73926 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73927 ?auto_73926 )
      ( DELIVER-3PKG-VERIFY ?auto_73927 ?auto_73928 ?auto_73929 ?auto_73926 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_73937 - OBJ
      ?auto_73938 - OBJ
      ?auto_73939 - OBJ
      ?auto_73936 - LOCATION
    )
    :vars
    (
      ?auto_73940 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73938 ?auto_73937 ) ) ( not ( = ?auto_73939 ?auto_73937 ) ) ( not ( = ?auto_73939 ?auto_73938 ) ) ( TRUCK-AT ?auto_73940 ?auto_73936 ) ( IN-TRUCK ?auto_73937 ?auto_73940 ) ( OBJ-AT ?auto_73938 ?auto_73936 ) ( OBJ-AT ?auto_73939 ?auto_73936 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73937 ?auto_73936 )
      ( DELIVER-3PKG-VERIFY ?auto_73937 ?auto_73938 ?auto_73939 ?auto_73936 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_73942 - OBJ
      ?auto_73943 - OBJ
      ?auto_73944 - OBJ
      ?auto_73941 - LOCATION
    )
    :vars
    (
      ?auto_73945 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_73943 ?auto_73942 ) ) ( not ( = ?auto_73944 ?auto_73942 ) ) ( not ( = ?auto_73944 ?auto_73943 ) ) ( TRUCK-AT ?auto_73945 ?auto_73941 ) ( IN-TRUCK ?auto_73942 ?auto_73945 ) ( OBJ-AT ?auto_73943 ?auto_73941 ) ( OBJ-AT ?auto_73944 ?auto_73941 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_73942 ?auto_73941 )
      ( DELIVER-3PKG-VERIFY ?auto_73942 ?auto_73943 ?auto_73944 ?auto_73941 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74031 - OBJ
      ?auto_74032 - OBJ
      ?auto_74033 - OBJ
      ?auto_74034 - OBJ
      ?auto_74030 - LOCATION
    )
    :vars
    (
      ?auto_74035 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74032 ?auto_74031 ) ) ( not ( = ?auto_74033 ?auto_74031 ) ) ( not ( = ?auto_74033 ?auto_74032 ) ) ( not ( = ?auto_74034 ?auto_74031 ) ) ( not ( = ?auto_74034 ?auto_74032 ) ) ( not ( = ?auto_74034 ?auto_74033 ) ) ( TRUCK-AT ?auto_74035 ?auto_74030 ) ( IN-TRUCK ?auto_74034 ?auto_74035 ) ( OBJ-AT ?auto_74031 ?auto_74030 ) ( OBJ-AT ?auto_74032 ?auto_74030 ) ( OBJ-AT ?auto_74033 ?auto_74030 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74034 ?auto_74030 )
      ( DELIVER-4PKG-VERIFY ?auto_74031 ?auto_74032 ?auto_74033 ?auto_74034 ?auto_74030 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74049 - OBJ
      ?auto_74050 - OBJ
      ?auto_74051 - OBJ
      ?auto_74052 - OBJ
      ?auto_74048 - LOCATION
    )
    :vars
    (
      ?auto_74053 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74050 ?auto_74049 ) ) ( not ( = ?auto_74051 ?auto_74049 ) ) ( not ( = ?auto_74051 ?auto_74050 ) ) ( not ( = ?auto_74052 ?auto_74049 ) ) ( not ( = ?auto_74052 ?auto_74050 ) ) ( not ( = ?auto_74052 ?auto_74051 ) ) ( TRUCK-AT ?auto_74053 ?auto_74048 ) ( IN-TRUCK ?auto_74051 ?auto_74053 ) ( OBJ-AT ?auto_74049 ?auto_74048 ) ( OBJ-AT ?auto_74050 ?auto_74048 ) ( OBJ-AT ?auto_74052 ?auto_74048 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74051 ?auto_74048 )
      ( DELIVER-4PKG-VERIFY ?auto_74049 ?auto_74050 ?auto_74051 ?auto_74052 ?auto_74048 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74067 - OBJ
      ?auto_74068 - OBJ
      ?auto_74069 - OBJ
      ?auto_74070 - OBJ
      ?auto_74066 - LOCATION
    )
    :vars
    (
      ?auto_74071 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74068 ?auto_74067 ) ) ( not ( = ?auto_74069 ?auto_74067 ) ) ( not ( = ?auto_74069 ?auto_74068 ) ) ( not ( = ?auto_74070 ?auto_74067 ) ) ( not ( = ?auto_74070 ?auto_74068 ) ) ( not ( = ?auto_74070 ?auto_74069 ) ) ( TRUCK-AT ?auto_74071 ?auto_74066 ) ( IN-TRUCK ?auto_74070 ?auto_74071 ) ( OBJ-AT ?auto_74067 ?auto_74066 ) ( OBJ-AT ?auto_74068 ?auto_74066 ) ( OBJ-AT ?auto_74069 ?auto_74066 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74070 ?auto_74066 )
      ( DELIVER-4PKG-VERIFY ?auto_74067 ?auto_74068 ?auto_74069 ?auto_74070 ?auto_74066 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74085 - OBJ
      ?auto_74086 - OBJ
      ?auto_74087 - OBJ
      ?auto_74088 - OBJ
      ?auto_74084 - LOCATION
    )
    :vars
    (
      ?auto_74089 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74086 ?auto_74085 ) ) ( not ( = ?auto_74087 ?auto_74085 ) ) ( not ( = ?auto_74087 ?auto_74086 ) ) ( not ( = ?auto_74088 ?auto_74085 ) ) ( not ( = ?auto_74088 ?auto_74086 ) ) ( not ( = ?auto_74088 ?auto_74087 ) ) ( TRUCK-AT ?auto_74089 ?auto_74084 ) ( IN-TRUCK ?auto_74087 ?auto_74089 ) ( OBJ-AT ?auto_74085 ?auto_74084 ) ( OBJ-AT ?auto_74086 ?auto_74084 ) ( OBJ-AT ?auto_74088 ?auto_74084 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74087 ?auto_74084 )
      ( DELIVER-4PKG-VERIFY ?auto_74085 ?auto_74086 ?auto_74087 ?auto_74088 ?auto_74084 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74139 - OBJ
      ?auto_74140 - OBJ
      ?auto_74141 - OBJ
      ?auto_74142 - OBJ
      ?auto_74138 - LOCATION
    )
    :vars
    (
      ?auto_74143 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74140 ?auto_74139 ) ) ( not ( = ?auto_74141 ?auto_74139 ) ) ( not ( = ?auto_74141 ?auto_74140 ) ) ( not ( = ?auto_74142 ?auto_74139 ) ) ( not ( = ?auto_74142 ?auto_74140 ) ) ( not ( = ?auto_74142 ?auto_74141 ) ) ( TRUCK-AT ?auto_74143 ?auto_74138 ) ( IN-TRUCK ?auto_74140 ?auto_74143 ) ( OBJ-AT ?auto_74139 ?auto_74138 ) ( OBJ-AT ?auto_74141 ?auto_74138 ) ( OBJ-AT ?auto_74142 ?auto_74138 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74140 ?auto_74138 )
      ( DELIVER-4PKG-VERIFY ?auto_74139 ?auto_74140 ?auto_74141 ?auto_74142 ?auto_74138 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74157 - OBJ
      ?auto_74158 - OBJ
      ?auto_74159 - OBJ
      ?auto_74160 - OBJ
      ?auto_74156 - LOCATION
    )
    :vars
    (
      ?auto_74161 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74158 ?auto_74157 ) ) ( not ( = ?auto_74159 ?auto_74157 ) ) ( not ( = ?auto_74159 ?auto_74158 ) ) ( not ( = ?auto_74160 ?auto_74157 ) ) ( not ( = ?auto_74160 ?auto_74158 ) ) ( not ( = ?auto_74160 ?auto_74159 ) ) ( TRUCK-AT ?auto_74161 ?auto_74156 ) ( IN-TRUCK ?auto_74158 ?auto_74161 ) ( OBJ-AT ?auto_74157 ?auto_74156 ) ( OBJ-AT ?auto_74159 ?auto_74156 ) ( OBJ-AT ?auto_74160 ?auto_74156 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74158 ?auto_74156 )
      ( DELIVER-4PKG-VERIFY ?auto_74157 ?auto_74158 ?auto_74159 ?auto_74160 ?auto_74156 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74211 - OBJ
      ?auto_74212 - OBJ
      ?auto_74213 - OBJ
      ?auto_74214 - OBJ
      ?auto_74210 - LOCATION
    )
    :vars
    (
      ?auto_74215 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74212 ?auto_74211 ) ) ( not ( = ?auto_74213 ?auto_74211 ) ) ( not ( = ?auto_74213 ?auto_74212 ) ) ( not ( = ?auto_74214 ?auto_74211 ) ) ( not ( = ?auto_74214 ?auto_74212 ) ) ( not ( = ?auto_74214 ?auto_74213 ) ) ( TRUCK-AT ?auto_74215 ?auto_74210 ) ( IN-TRUCK ?auto_74214 ?auto_74215 ) ( OBJ-AT ?auto_74211 ?auto_74210 ) ( OBJ-AT ?auto_74212 ?auto_74210 ) ( OBJ-AT ?auto_74213 ?auto_74210 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74214 ?auto_74210 )
      ( DELIVER-4PKG-VERIFY ?auto_74211 ?auto_74212 ?auto_74213 ?auto_74214 ?auto_74210 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74229 - OBJ
      ?auto_74230 - OBJ
      ?auto_74231 - OBJ
      ?auto_74232 - OBJ
      ?auto_74228 - LOCATION
    )
    :vars
    (
      ?auto_74233 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74230 ?auto_74229 ) ) ( not ( = ?auto_74231 ?auto_74229 ) ) ( not ( = ?auto_74231 ?auto_74230 ) ) ( not ( = ?auto_74232 ?auto_74229 ) ) ( not ( = ?auto_74232 ?auto_74230 ) ) ( not ( = ?auto_74232 ?auto_74231 ) ) ( TRUCK-AT ?auto_74233 ?auto_74228 ) ( IN-TRUCK ?auto_74231 ?auto_74233 ) ( OBJ-AT ?auto_74229 ?auto_74228 ) ( OBJ-AT ?auto_74230 ?auto_74228 ) ( OBJ-AT ?auto_74232 ?auto_74228 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74231 ?auto_74228 )
      ( DELIVER-4PKG-VERIFY ?auto_74229 ?auto_74230 ?auto_74231 ?auto_74232 ?auto_74228 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74283 - OBJ
      ?auto_74284 - OBJ
      ?auto_74285 - OBJ
      ?auto_74286 - OBJ
      ?auto_74282 - LOCATION
    )
    :vars
    (
      ?auto_74287 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74284 ?auto_74283 ) ) ( not ( = ?auto_74285 ?auto_74283 ) ) ( not ( = ?auto_74285 ?auto_74284 ) ) ( not ( = ?auto_74286 ?auto_74283 ) ) ( not ( = ?auto_74286 ?auto_74284 ) ) ( not ( = ?auto_74286 ?auto_74285 ) ) ( TRUCK-AT ?auto_74287 ?auto_74282 ) ( IN-TRUCK ?auto_74286 ?auto_74287 ) ( OBJ-AT ?auto_74283 ?auto_74282 ) ( OBJ-AT ?auto_74284 ?auto_74282 ) ( OBJ-AT ?auto_74285 ?auto_74282 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74286 ?auto_74282 )
      ( DELIVER-4PKG-VERIFY ?auto_74283 ?auto_74284 ?auto_74285 ?auto_74286 ?auto_74282 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74301 - OBJ
      ?auto_74302 - OBJ
      ?auto_74303 - OBJ
      ?auto_74304 - OBJ
      ?auto_74300 - LOCATION
    )
    :vars
    (
      ?auto_74305 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74302 ?auto_74301 ) ) ( not ( = ?auto_74303 ?auto_74301 ) ) ( not ( = ?auto_74303 ?auto_74302 ) ) ( not ( = ?auto_74304 ?auto_74301 ) ) ( not ( = ?auto_74304 ?auto_74302 ) ) ( not ( = ?auto_74304 ?auto_74303 ) ) ( TRUCK-AT ?auto_74305 ?auto_74300 ) ( IN-TRUCK ?auto_74303 ?auto_74305 ) ( OBJ-AT ?auto_74301 ?auto_74300 ) ( OBJ-AT ?auto_74302 ?auto_74300 ) ( OBJ-AT ?auto_74304 ?auto_74300 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74303 ?auto_74300 )
      ( DELIVER-4PKG-VERIFY ?auto_74301 ?auto_74302 ?auto_74303 ?auto_74304 ?auto_74300 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74337 - OBJ
      ?auto_74338 - OBJ
      ?auto_74339 - OBJ
      ?auto_74340 - OBJ
      ?auto_74336 - LOCATION
    )
    :vars
    (
      ?auto_74341 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74338 ?auto_74337 ) ) ( not ( = ?auto_74339 ?auto_74337 ) ) ( not ( = ?auto_74339 ?auto_74338 ) ) ( not ( = ?auto_74340 ?auto_74337 ) ) ( not ( = ?auto_74340 ?auto_74338 ) ) ( not ( = ?auto_74340 ?auto_74339 ) ) ( TRUCK-AT ?auto_74341 ?auto_74336 ) ( IN-TRUCK ?auto_74338 ?auto_74341 ) ( OBJ-AT ?auto_74337 ?auto_74336 ) ( OBJ-AT ?auto_74339 ?auto_74336 ) ( OBJ-AT ?auto_74340 ?auto_74336 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74338 ?auto_74336 )
      ( DELIVER-4PKG-VERIFY ?auto_74337 ?auto_74338 ?auto_74339 ?auto_74340 ?auto_74336 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74373 - OBJ
      ?auto_74374 - OBJ
      ?auto_74375 - OBJ
      ?auto_74376 - OBJ
      ?auto_74372 - LOCATION
    )
    :vars
    (
      ?auto_74377 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74374 ?auto_74373 ) ) ( not ( = ?auto_74375 ?auto_74373 ) ) ( not ( = ?auto_74375 ?auto_74374 ) ) ( not ( = ?auto_74376 ?auto_74373 ) ) ( not ( = ?auto_74376 ?auto_74374 ) ) ( not ( = ?auto_74376 ?auto_74375 ) ) ( TRUCK-AT ?auto_74377 ?auto_74372 ) ( IN-TRUCK ?auto_74374 ?auto_74377 ) ( OBJ-AT ?auto_74373 ?auto_74372 ) ( OBJ-AT ?auto_74375 ?auto_74372 ) ( OBJ-AT ?auto_74376 ?auto_74372 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74374 ?auto_74372 )
      ( DELIVER-4PKG-VERIFY ?auto_74373 ?auto_74374 ?auto_74375 ?auto_74376 ?auto_74372 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74427 - OBJ
      ?auto_74428 - OBJ
      ?auto_74429 - OBJ
      ?auto_74430 - OBJ
      ?auto_74426 - LOCATION
    )
    :vars
    (
      ?auto_74431 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74428 ?auto_74427 ) ) ( not ( = ?auto_74429 ?auto_74427 ) ) ( not ( = ?auto_74429 ?auto_74428 ) ) ( not ( = ?auto_74430 ?auto_74427 ) ) ( not ( = ?auto_74430 ?auto_74428 ) ) ( not ( = ?auto_74430 ?auto_74429 ) ) ( TRUCK-AT ?auto_74431 ?auto_74426 ) ( IN-TRUCK ?auto_74430 ?auto_74431 ) ( OBJ-AT ?auto_74427 ?auto_74426 ) ( OBJ-AT ?auto_74428 ?auto_74426 ) ( OBJ-AT ?auto_74429 ?auto_74426 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74430 ?auto_74426 )
      ( DELIVER-4PKG-VERIFY ?auto_74427 ?auto_74428 ?auto_74429 ?auto_74430 ?auto_74426 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74445 - OBJ
      ?auto_74446 - OBJ
      ?auto_74447 - OBJ
      ?auto_74448 - OBJ
      ?auto_74444 - LOCATION
    )
    :vars
    (
      ?auto_74449 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74446 ?auto_74445 ) ) ( not ( = ?auto_74447 ?auto_74445 ) ) ( not ( = ?auto_74447 ?auto_74446 ) ) ( not ( = ?auto_74448 ?auto_74445 ) ) ( not ( = ?auto_74448 ?auto_74446 ) ) ( not ( = ?auto_74448 ?auto_74447 ) ) ( TRUCK-AT ?auto_74449 ?auto_74444 ) ( IN-TRUCK ?auto_74447 ?auto_74449 ) ( OBJ-AT ?auto_74445 ?auto_74444 ) ( OBJ-AT ?auto_74446 ?auto_74444 ) ( OBJ-AT ?auto_74448 ?auto_74444 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74447 ?auto_74444 )
      ( DELIVER-4PKG-VERIFY ?auto_74445 ?auto_74446 ?auto_74447 ?auto_74448 ?auto_74444 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74463 - OBJ
      ?auto_74464 - OBJ
      ?auto_74465 - OBJ
      ?auto_74466 - OBJ
      ?auto_74462 - LOCATION
    )
    :vars
    (
      ?auto_74467 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74464 ?auto_74463 ) ) ( not ( = ?auto_74465 ?auto_74463 ) ) ( not ( = ?auto_74465 ?auto_74464 ) ) ( not ( = ?auto_74466 ?auto_74463 ) ) ( not ( = ?auto_74466 ?auto_74464 ) ) ( not ( = ?auto_74466 ?auto_74465 ) ) ( TRUCK-AT ?auto_74467 ?auto_74462 ) ( IN-TRUCK ?auto_74466 ?auto_74467 ) ( OBJ-AT ?auto_74463 ?auto_74462 ) ( OBJ-AT ?auto_74464 ?auto_74462 ) ( OBJ-AT ?auto_74465 ?auto_74462 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74466 ?auto_74462 )
      ( DELIVER-4PKG-VERIFY ?auto_74463 ?auto_74464 ?auto_74465 ?auto_74466 ?auto_74462 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74481 - OBJ
      ?auto_74482 - OBJ
      ?auto_74483 - OBJ
      ?auto_74484 - OBJ
      ?auto_74480 - LOCATION
    )
    :vars
    (
      ?auto_74485 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74482 ?auto_74481 ) ) ( not ( = ?auto_74483 ?auto_74481 ) ) ( not ( = ?auto_74483 ?auto_74482 ) ) ( not ( = ?auto_74484 ?auto_74481 ) ) ( not ( = ?auto_74484 ?auto_74482 ) ) ( not ( = ?auto_74484 ?auto_74483 ) ) ( TRUCK-AT ?auto_74485 ?auto_74480 ) ( IN-TRUCK ?auto_74483 ?auto_74485 ) ( OBJ-AT ?auto_74481 ?auto_74480 ) ( OBJ-AT ?auto_74482 ?auto_74480 ) ( OBJ-AT ?auto_74484 ?auto_74480 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74483 ?auto_74480 )
      ( DELIVER-4PKG-VERIFY ?auto_74481 ?auto_74482 ?auto_74483 ?auto_74484 ?auto_74480 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74553 - OBJ
      ?auto_74554 - OBJ
      ?auto_74555 - OBJ
      ?auto_74556 - OBJ
      ?auto_74552 - LOCATION
    )
    :vars
    (
      ?auto_74557 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74554 ?auto_74553 ) ) ( not ( = ?auto_74555 ?auto_74553 ) ) ( not ( = ?auto_74555 ?auto_74554 ) ) ( not ( = ?auto_74556 ?auto_74553 ) ) ( not ( = ?auto_74556 ?auto_74554 ) ) ( not ( = ?auto_74556 ?auto_74555 ) ) ( TRUCK-AT ?auto_74557 ?auto_74552 ) ( IN-TRUCK ?auto_74554 ?auto_74557 ) ( OBJ-AT ?auto_74553 ?auto_74552 ) ( OBJ-AT ?auto_74555 ?auto_74552 ) ( OBJ-AT ?auto_74556 ?auto_74552 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74554 ?auto_74552 )
      ( DELIVER-4PKG-VERIFY ?auto_74553 ?auto_74554 ?auto_74555 ?auto_74556 ?auto_74552 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74571 - OBJ
      ?auto_74572 - OBJ
      ?auto_74573 - OBJ
      ?auto_74574 - OBJ
      ?auto_74570 - LOCATION
    )
    :vars
    (
      ?auto_74575 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74572 ?auto_74571 ) ) ( not ( = ?auto_74573 ?auto_74571 ) ) ( not ( = ?auto_74573 ?auto_74572 ) ) ( not ( = ?auto_74574 ?auto_74571 ) ) ( not ( = ?auto_74574 ?auto_74572 ) ) ( not ( = ?auto_74574 ?auto_74573 ) ) ( TRUCK-AT ?auto_74575 ?auto_74570 ) ( IN-TRUCK ?auto_74572 ?auto_74575 ) ( OBJ-AT ?auto_74571 ?auto_74570 ) ( OBJ-AT ?auto_74573 ?auto_74570 ) ( OBJ-AT ?auto_74574 ?auto_74570 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74572 ?auto_74570 )
      ( DELIVER-4PKG-VERIFY ?auto_74571 ?auto_74572 ?auto_74573 ?auto_74574 ?auto_74570 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74679 - OBJ
      ?auto_74680 - OBJ
      ?auto_74681 - OBJ
      ?auto_74682 - OBJ
      ?auto_74678 - LOCATION
    )
    :vars
    (
      ?auto_74683 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74680 ?auto_74679 ) ) ( not ( = ?auto_74681 ?auto_74679 ) ) ( not ( = ?auto_74681 ?auto_74680 ) ) ( not ( = ?auto_74682 ?auto_74679 ) ) ( not ( = ?auto_74682 ?auto_74680 ) ) ( not ( = ?auto_74682 ?auto_74681 ) ) ( TRUCK-AT ?auto_74683 ?auto_74678 ) ( IN-TRUCK ?auto_74679 ?auto_74683 ) ( OBJ-AT ?auto_74680 ?auto_74678 ) ( OBJ-AT ?auto_74681 ?auto_74678 ) ( OBJ-AT ?auto_74682 ?auto_74678 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74679 ?auto_74678 )
      ( DELIVER-4PKG-VERIFY ?auto_74679 ?auto_74680 ?auto_74681 ?auto_74682 ?auto_74678 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74697 - OBJ
      ?auto_74698 - OBJ
      ?auto_74699 - OBJ
      ?auto_74700 - OBJ
      ?auto_74696 - LOCATION
    )
    :vars
    (
      ?auto_74701 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74698 ?auto_74697 ) ) ( not ( = ?auto_74699 ?auto_74697 ) ) ( not ( = ?auto_74699 ?auto_74698 ) ) ( not ( = ?auto_74700 ?auto_74697 ) ) ( not ( = ?auto_74700 ?auto_74698 ) ) ( not ( = ?auto_74700 ?auto_74699 ) ) ( TRUCK-AT ?auto_74701 ?auto_74696 ) ( IN-TRUCK ?auto_74697 ?auto_74701 ) ( OBJ-AT ?auto_74698 ?auto_74696 ) ( OBJ-AT ?auto_74699 ?auto_74696 ) ( OBJ-AT ?auto_74700 ?auto_74696 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74697 ?auto_74696 )
      ( DELIVER-4PKG-VERIFY ?auto_74697 ?auto_74698 ?auto_74699 ?auto_74700 ?auto_74696 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74751 - OBJ
      ?auto_74752 - OBJ
      ?auto_74753 - OBJ
      ?auto_74754 - OBJ
      ?auto_74750 - LOCATION
    )
    :vars
    (
      ?auto_74755 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74752 ?auto_74751 ) ) ( not ( = ?auto_74753 ?auto_74751 ) ) ( not ( = ?auto_74753 ?auto_74752 ) ) ( not ( = ?auto_74754 ?auto_74751 ) ) ( not ( = ?auto_74754 ?auto_74752 ) ) ( not ( = ?auto_74754 ?auto_74753 ) ) ( TRUCK-AT ?auto_74755 ?auto_74750 ) ( IN-TRUCK ?auto_74751 ?auto_74755 ) ( OBJ-AT ?auto_74752 ?auto_74750 ) ( OBJ-AT ?auto_74753 ?auto_74750 ) ( OBJ-AT ?auto_74754 ?auto_74750 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74751 ?auto_74750 )
      ( DELIVER-4PKG-VERIFY ?auto_74751 ?auto_74752 ?auto_74753 ?auto_74754 ?auto_74750 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74787 - OBJ
      ?auto_74788 - OBJ
      ?auto_74789 - OBJ
      ?auto_74790 - OBJ
      ?auto_74786 - LOCATION
    )
    :vars
    (
      ?auto_74791 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74788 ?auto_74787 ) ) ( not ( = ?auto_74789 ?auto_74787 ) ) ( not ( = ?auto_74789 ?auto_74788 ) ) ( not ( = ?auto_74790 ?auto_74787 ) ) ( not ( = ?auto_74790 ?auto_74788 ) ) ( not ( = ?auto_74790 ?auto_74789 ) ) ( TRUCK-AT ?auto_74791 ?auto_74786 ) ( IN-TRUCK ?auto_74787 ?auto_74791 ) ( OBJ-AT ?auto_74788 ?auto_74786 ) ( OBJ-AT ?auto_74789 ?auto_74786 ) ( OBJ-AT ?auto_74790 ?auto_74786 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74787 ?auto_74786 )
      ( DELIVER-4PKG-VERIFY ?auto_74787 ?auto_74788 ?auto_74789 ?auto_74790 ?auto_74786 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74841 - OBJ
      ?auto_74842 - OBJ
      ?auto_74843 - OBJ
      ?auto_74844 - OBJ
      ?auto_74840 - LOCATION
    )
    :vars
    (
      ?auto_74845 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74842 ?auto_74841 ) ) ( not ( = ?auto_74843 ?auto_74841 ) ) ( not ( = ?auto_74843 ?auto_74842 ) ) ( not ( = ?auto_74844 ?auto_74841 ) ) ( not ( = ?auto_74844 ?auto_74842 ) ) ( not ( = ?auto_74844 ?auto_74843 ) ) ( TRUCK-AT ?auto_74845 ?auto_74840 ) ( IN-TRUCK ?auto_74841 ?auto_74845 ) ( OBJ-AT ?auto_74842 ?auto_74840 ) ( OBJ-AT ?auto_74843 ?auto_74840 ) ( OBJ-AT ?auto_74844 ?auto_74840 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74841 ?auto_74840 )
      ( DELIVER-4PKG-VERIFY ?auto_74841 ?auto_74842 ?auto_74843 ?auto_74844 ?auto_74840 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74859 - OBJ
      ?auto_74860 - OBJ
      ?auto_74861 - OBJ
      ?auto_74862 - OBJ
      ?auto_74858 - LOCATION
    )
    :vars
    (
      ?auto_74863 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_74860 ?auto_74859 ) ) ( not ( = ?auto_74861 ?auto_74859 ) ) ( not ( = ?auto_74861 ?auto_74860 ) ) ( not ( = ?auto_74862 ?auto_74859 ) ) ( not ( = ?auto_74862 ?auto_74860 ) ) ( not ( = ?auto_74862 ?auto_74861 ) ) ( TRUCK-AT ?auto_74863 ?auto_74858 ) ( IN-TRUCK ?auto_74859 ?auto_74863 ) ( OBJ-AT ?auto_74860 ?auto_74858 ) ( OBJ-AT ?auto_74861 ?auto_74858 ) ( OBJ-AT ?auto_74862 ?auto_74858 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_74859 ?auto_74858 )
      ( DELIVER-4PKG-VERIFY ?auto_74859 ?auto_74860 ?auto_74861 ?auto_74862 ?auto_74858 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_75027 - OBJ
      ?auto_75026 - LOCATION
    )
    :vars
    (
      ?auto_75028 - TRUCK
      ?auto_75029 - LOCATION
      ?auto_75030 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_75027 ?auto_75028 ) ( TRUCK-AT ?auto_75028 ?auto_75029 ) ( IN-CITY ?auto_75029 ?auto_75030 ) ( IN-CITY ?auto_75026 ?auto_75030 ) ( not ( = ?auto_75026 ?auto_75029 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_75028 ?auto_75029 ?auto_75026 ?auto_75030 )
      ( DELIVER-1PKG ?auto_75027 ?auto_75026 )
      ( DELIVER-1PKG-VERIFY ?auto_75027 ?auto_75026 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_75032 - OBJ
      ?auto_75033 - OBJ
      ?auto_75031 - LOCATION
    )
    :vars
    (
      ?auto_75035 - TRUCK
      ?auto_75034 - LOCATION
      ?auto_75036 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75033 ?auto_75032 ) ) ( IN-TRUCK ?auto_75033 ?auto_75035 ) ( TRUCK-AT ?auto_75035 ?auto_75034 ) ( IN-CITY ?auto_75034 ?auto_75036 ) ( IN-CITY ?auto_75031 ?auto_75036 ) ( not ( = ?auto_75031 ?auto_75034 ) ) ( OBJ-AT ?auto_75032 ?auto_75031 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_75033 ?auto_75031 )
      ( DELIVER-2PKG-VERIFY ?auto_75032 ?auto_75033 ?auto_75031 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_75038 - OBJ
      ?auto_75039 - OBJ
      ?auto_75037 - LOCATION
    )
    :vars
    (
      ?auto_75041 - OBJ
      ?auto_75042 - TRUCK
      ?auto_75040 - LOCATION
      ?auto_75043 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75039 ?auto_75038 ) ) ( not ( = ?auto_75039 ?auto_75041 ) ) ( IN-TRUCK ?auto_75039 ?auto_75042 ) ( TRUCK-AT ?auto_75042 ?auto_75040 ) ( IN-CITY ?auto_75040 ?auto_75043 ) ( IN-CITY ?auto_75037 ?auto_75043 ) ( not ( = ?auto_75037 ?auto_75040 ) ) ( OBJ-AT ?auto_75041 ?auto_75037 ) ( OBJ-AT ?auto_75038 ?auto_75037 ) ( not ( = ?auto_75038 ?auto_75041 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75041 ?auto_75039 ?auto_75037 )
      ( DELIVER-2PKG-VERIFY ?auto_75038 ?auto_75039 ?auto_75037 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_75045 - OBJ
      ?auto_75046 - OBJ
      ?auto_75044 - LOCATION
    )
    :vars
    (
      ?auto_75048 - OBJ
      ?auto_75049 - TRUCK
      ?auto_75047 - LOCATION
      ?auto_75050 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75046 ?auto_75045 ) ) ( not ( = ?auto_75046 ?auto_75048 ) ) ( IN-TRUCK ?auto_75046 ?auto_75049 ) ( TRUCK-AT ?auto_75049 ?auto_75047 ) ( IN-CITY ?auto_75047 ?auto_75050 ) ( IN-CITY ?auto_75044 ?auto_75050 ) ( not ( = ?auto_75044 ?auto_75047 ) ) ( OBJ-AT ?auto_75048 ?auto_75044 ) ( OBJ-AT ?auto_75045 ?auto_75044 ) ( not ( = ?auto_75045 ?auto_75048 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75048 ?auto_75046 ?auto_75044 )
      ( DELIVER-2PKG-VERIFY ?auto_75045 ?auto_75046 ?auto_75044 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_75052 - OBJ
      ?auto_75053 - OBJ
      ?auto_75051 - LOCATION
    )
    :vars
    (
      ?auto_75055 - TRUCK
      ?auto_75054 - LOCATION
      ?auto_75056 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75053 ?auto_75052 ) ) ( IN-TRUCK ?auto_75052 ?auto_75055 ) ( TRUCK-AT ?auto_75055 ?auto_75054 ) ( IN-CITY ?auto_75054 ?auto_75056 ) ( IN-CITY ?auto_75051 ?auto_75056 ) ( not ( = ?auto_75051 ?auto_75054 ) ) ( OBJ-AT ?auto_75053 ?auto_75051 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75053 ?auto_75052 ?auto_75051 )
      ( DELIVER-2PKG-VERIFY ?auto_75052 ?auto_75053 ?auto_75051 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_75058 - OBJ
      ?auto_75059 - OBJ
      ?auto_75057 - LOCATION
    )
    :vars
    (
      ?auto_75061 - OBJ
      ?auto_75062 - TRUCK
      ?auto_75060 - LOCATION
      ?auto_75063 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75059 ?auto_75058 ) ) ( not ( = ?auto_75058 ?auto_75061 ) ) ( IN-TRUCK ?auto_75058 ?auto_75062 ) ( TRUCK-AT ?auto_75062 ?auto_75060 ) ( IN-CITY ?auto_75060 ?auto_75063 ) ( IN-CITY ?auto_75057 ?auto_75063 ) ( not ( = ?auto_75057 ?auto_75060 ) ) ( OBJ-AT ?auto_75061 ?auto_75057 ) ( OBJ-AT ?auto_75059 ?auto_75057 ) ( not ( = ?auto_75059 ?auto_75061 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75061 ?auto_75058 ?auto_75057 )
      ( DELIVER-2PKG-VERIFY ?auto_75058 ?auto_75059 ?auto_75057 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_75065 - OBJ
      ?auto_75066 - OBJ
      ?auto_75064 - LOCATION
    )
    :vars
    (
      ?auto_75068 - OBJ
      ?auto_75069 - TRUCK
      ?auto_75067 - LOCATION
      ?auto_75070 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75066 ?auto_75065 ) ) ( not ( = ?auto_75065 ?auto_75068 ) ) ( IN-TRUCK ?auto_75065 ?auto_75069 ) ( TRUCK-AT ?auto_75069 ?auto_75067 ) ( IN-CITY ?auto_75067 ?auto_75070 ) ( IN-CITY ?auto_75064 ?auto_75070 ) ( not ( = ?auto_75064 ?auto_75067 ) ) ( OBJ-AT ?auto_75068 ?auto_75064 ) ( OBJ-AT ?auto_75066 ?auto_75064 ) ( not ( = ?auto_75066 ?auto_75068 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75068 ?auto_75065 ?auto_75064 )
      ( DELIVER-2PKG-VERIFY ?auto_75065 ?auto_75066 ?auto_75064 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75086 - OBJ
      ?auto_75087 - OBJ
      ?auto_75088 - OBJ
      ?auto_75085 - LOCATION
    )
    :vars
    (
      ?auto_75090 - TRUCK
      ?auto_75089 - LOCATION
      ?auto_75091 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75087 ?auto_75086 ) ) ( not ( = ?auto_75088 ?auto_75086 ) ) ( not ( = ?auto_75088 ?auto_75087 ) ) ( IN-TRUCK ?auto_75088 ?auto_75090 ) ( TRUCK-AT ?auto_75090 ?auto_75089 ) ( IN-CITY ?auto_75089 ?auto_75091 ) ( IN-CITY ?auto_75085 ?auto_75091 ) ( not ( = ?auto_75085 ?auto_75089 ) ) ( OBJ-AT ?auto_75086 ?auto_75085 ) ( OBJ-AT ?auto_75087 ?auto_75085 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75086 ?auto_75088 ?auto_75085 )
      ( DELIVER-3PKG-VERIFY ?auto_75086 ?auto_75087 ?auto_75088 ?auto_75085 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75093 - OBJ
      ?auto_75094 - OBJ
      ?auto_75095 - OBJ
      ?auto_75092 - LOCATION
    )
    :vars
    (
      ?auto_75097 - TRUCK
      ?auto_75096 - LOCATION
      ?auto_75098 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75094 ?auto_75093 ) ) ( not ( = ?auto_75095 ?auto_75093 ) ) ( not ( = ?auto_75095 ?auto_75094 ) ) ( IN-TRUCK ?auto_75095 ?auto_75097 ) ( TRUCK-AT ?auto_75097 ?auto_75096 ) ( IN-CITY ?auto_75096 ?auto_75098 ) ( IN-CITY ?auto_75092 ?auto_75098 ) ( not ( = ?auto_75092 ?auto_75096 ) ) ( OBJ-AT ?auto_75093 ?auto_75092 ) ( OBJ-AT ?auto_75094 ?auto_75092 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75093 ?auto_75095 ?auto_75092 )
      ( DELIVER-3PKG-VERIFY ?auto_75093 ?auto_75094 ?auto_75095 ?auto_75092 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75107 - OBJ
      ?auto_75108 - OBJ
      ?auto_75109 - OBJ
      ?auto_75106 - LOCATION
    )
    :vars
    (
      ?auto_75111 - TRUCK
      ?auto_75110 - LOCATION
      ?auto_75112 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75108 ?auto_75107 ) ) ( not ( = ?auto_75109 ?auto_75107 ) ) ( not ( = ?auto_75109 ?auto_75108 ) ) ( IN-TRUCK ?auto_75108 ?auto_75111 ) ( TRUCK-AT ?auto_75111 ?auto_75110 ) ( IN-CITY ?auto_75110 ?auto_75112 ) ( IN-CITY ?auto_75106 ?auto_75112 ) ( not ( = ?auto_75106 ?auto_75110 ) ) ( OBJ-AT ?auto_75107 ?auto_75106 ) ( OBJ-AT ?auto_75109 ?auto_75106 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75107 ?auto_75108 ?auto_75106 )
      ( DELIVER-3PKG-VERIFY ?auto_75107 ?auto_75108 ?auto_75109 ?auto_75106 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75114 - OBJ
      ?auto_75115 - OBJ
      ?auto_75116 - OBJ
      ?auto_75113 - LOCATION
    )
    :vars
    (
      ?auto_75118 - TRUCK
      ?auto_75117 - LOCATION
      ?auto_75119 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75115 ?auto_75114 ) ) ( not ( = ?auto_75116 ?auto_75114 ) ) ( not ( = ?auto_75116 ?auto_75115 ) ) ( IN-TRUCK ?auto_75115 ?auto_75118 ) ( TRUCK-AT ?auto_75118 ?auto_75117 ) ( IN-CITY ?auto_75117 ?auto_75119 ) ( IN-CITY ?auto_75113 ?auto_75119 ) ( not ( = ?auto_75113 ?auto_75117 ) ) ( OBJ-AT ?auto_75114 ?auto_75113 ) ( OBJ-AT ?auto_75116 ?auto_75113 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75114 ?auto_75115 ?auto_75113 )
      ( DELIVER-3PKG-VERIFY ?auto_75114 ?auto_75115 ?auto_75116 ?auto_75113 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75128 - OBJ
      ?auto_75129 - OBJ
      ?auto_75130 - OBJ
      ?auto_75127 - LOCATION
    )
    :vars
    (
      ?auto_75132 - TRUCK
      ?auto_75131 - LOCATION
      ?auto_75133 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75129 ?auto_75128 ) ) ( not ( = ?auto_75130 ?auto_75128 ) ) ( not ( = ?auto_75130 ?auto_75129 ) ) ( IN-TRUCK ?auto_75130 ?auto_75132 ) ( TRUCK-AT ?auto_75132 ?auto_75131 ) ( IN-CITY ?auto_75131 ?auto_75133 ) ( IN-CITY ?auto_75127 ?auto_75133 ) ( not ( = ?auto_75127 ?auto_75131 ) ) ( OBJ-AT ?auto_75129 ?auto_75127 ) ( OBJ-AT ?auto_75128 ?auto_75127 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75129 ?auto_75130 ?auto_75127 )
      ( DELIVER-3PKG-VERIFY ?auto_75128 ?auto_75129 ?auto_75130 ?auto_75127 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75143 - OBJ
      ?auto_75144 - OBJ
      ?auto_75145 - OBJ
      ?auto_75142 - LOCATION
    )
    :vars
    (
      ?auto_75147 - OBJ
      ?auto_75148 - TRUCK
      ?auto_75146 - LOCATION
      ?auto_75149 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75144 ?auto_75143 ) ) ( not ( = ?auto_75145 ?auto_75143 ) ) ( not ( = ?auto_75145 ?auto_75144 ) ) ( not ( = ?auto_75145 ?auto_75147 ) ) ( IN-TRUCK ?auto_75145 ?auto_75148 ) ( TRUCK-AT ?auto_75148 ?auto_75146 ) ( IN-CITY ?auto_75146 ?auto_75149 ) ( IN-CITY ?auto_75142 ?auto_75149 ) ( not ( = ?auto_75142 ?auto_75146 ) ) ( OBJ-AT ?auto_75147 ?auto_75142 ) ( OBJ-AT ?auto_75143 ?auto_75142 ) ( OBJ-AT ?auto_75144 ?auto_75142 ) ( not ( = ?auto_75143 ?auto_75147 ) ) ( not ( = ?auto_75144 ?auto_75147 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75147 ?auto_75145 ?auto_75142 )
      ( DELIVER-3PKG-VERIFY ?auto_75143 ?auto_75144 ?auto_75145 ?auto_75142 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75151 - OBJ
      ?auto_75152 - OBJ
      ?auto_75153 - OBJ
      ?auto_75150 - LOCATION
    )
    :vars
    (
      ?auto_75155 - TRUCK
      ?auto_75154 - LOCATION
      ?auto_75156 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75152 ?auto_75151 ) ) ( not ( = ?auto_75153 ?auto_75151 ) ) ( not ( = ?auto_75153 ?auto_75152 ) ) ( IN-TRUCK ?auto_75152 ?auto_75155 ) ( TRUCK-AT ?auto_75155 ?auto_75154 ) ( IN-CITY ?auto_75154 ?auto_75156 ) ( IN-CITY ?auto_75150 ?auto_75156 ) ( not ( = ?auto_75150 ?auto_75154 ) ) ( OBJ-AT ?auto_75153 ?auto_75150 ) ( OBJ-AT ?auto_75151 ?auto_75150 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75153 ?auto_75152 ?auto_75150 )
      ( DELIVER-3PKG-VERIFY ?auto_75151 ?auto_75152 ?auto_75153 ?auto_75150 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75166 - OBJ
      ?auto_75167 - OBJ
      ?auto_75168 - OBJ
      ?auto_75165 - LOCATION
    )
    :vars
    (
      ?auto_75170 - OBJ
      ?auto_75171 - TRUCK
      ?auto_75169 - LOCATION
      ?auto_75172 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75167 ?auto_75166 ) ) ( not ( = ?auto_75168 ?auto_75166 ) ) ( not ( = ?auto_75168 ?auto_75167 ) ) ( not ( = ?auto_75167 ?auto_75170 ) ) ( IN-TRUCK ?auto_75167 ?auto_75171 ) ( TRUCK-AT ?auto_75171 ?auto_75169 ) ( IN-CITY ?auto_75169 ?auto_75172 ) ( IN-CITY ?auto_75165 ?auto_75172 ) ( not ( = ?auto_75165 ?auto_75169 ) ) ( OBJ-AT ?auto_75170 ?auto_75165 ) ( OBJ-AT ?auto_75166 ?auto_75165 ) ( OBJ-AT ?auto_75168 ?auto_75165 ) ( not ( = ?auto_75166 ?auto_75170 ) ) ( not ( = ?auto_75168 ?auto_75170 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75170 ?auto_75167 ?auto_75165 )
      ( DELIVER-3PKG-VERIFY ?auto_75166 ?auto_75167 ?auto_75168 ?auto_75165 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75182 - OBJ
      ?auto_75183 - OBJ
      ?auto_75184 - OBJ
      ?auto_75181 - LOCATION
    )
    :vars
    (
      ?auto_75186 - TRUCK
      ?auto_75185 - LOCATION
      ?auto_75187 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75183 ?auto_75182 ) ) ( not ( = ?auto_75184 ?auto_75182 ) ) ( not ( = ?auto_75184 ?auto_75183 ) ) ( IN-TRUCK ?auto_75184 ?auto_75186 ) ( TRUCK-AT ?auto_75186 ?auto_75185 ) ( IN-CITY ?auto_75185 ?auto_75187 ) ( IN-CITY ?auto_75181 ?auto_75187 ) ( not ( = ?auto_75181 ?auto_75185 ) ) ( OBJ-AT ?auto_75183 ?auto_75181 ) ( OBJ-AT ?auto_75182 ?auto_75181 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75183 ?auto_75184 ?auto_75181 )
      ( DELIVER-3PKG-VERIFY ?auto_75182 ?auto_75183 ?auto_75184 ?auto_75181 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75189 - OBJ
      ?auto_75190 - OBJ
      ?auto_75191 - OBJ
      ?auto_75188 - LOCATION
    )
    :vars
    (
      ?auto_75193 - OBJ
      ?auto_75194 - TRUCK
      ?auto_75192 - LOCATION
      ?auto_75195 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75190 ?auto_75189 ) ) ( not ( = ?auto_75191 ?auto_75189 ) ) ( not ( = ?auto_75191 ?auto_75190 ) ) ( not ( = ?auto_75191 ?auto_75193 ) ) ( IN-TRUCK ?auto_75191 ?auto_75194 ) ( TRUCK-AT ?auto_75194 ?auto_75192 ) ( IN-CITY ?auto_75192 ?auto_75195 ) ( IN-CITY ?auto_75188 ?auto_75195 ) ( not ( = ?auto_75188 ?auto_75192 ) ) ( OBJ-AT ?auto_75193 ?auto_75188 ) ( OBJ-AT ?auto_75189 ?auto_75188 ) ( OBJ-AT ?auto_75190 ?auto_75188 ) ( not ( = ?auto_75189 ?auto_75193 ) ) ( not ( = ?auto_75190 ?auto_75193 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75193 ?auto_75191 ?auto_75188 )
      ( DELIVER-3PKG-VERIFY ?auto_75189 ?auto_75190 ?auto_75191 ?auto_75188 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75205 - OBJ
      ?auto_75206 - OBJ
      ?auto_75207 - OBJ
      ?auto_75204 - LOCATION
    )
    :vars
    (
      ?auto_75209 - TRUCK
      ?auto_75208 - LOCATION
      ?auto_75210 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75206 ?auto_75205 ) ) ( not ( = ?auto_75207 ?auto_75205 ) ) ( not ( = ?auto_75207 ?auto_75206 ) ) ( IN-TRUCK ?auto_75206 ?auto_75209 ) ( TRUCK-AT ?auto_75209 ?auto_75208 ) ( IN-CITY ?auto_75208 ?auto_75210 ) ( IN-CITY ?auto_75204 ?auto_75210 ) ( not ( = ?auto_75204 ?auto_75208 ) ) ( OBJ-AT ?auto_75207 ?auto_75204 ) ( OBJ-AT ?auto_75205 ?auto_75204 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75207 ?auto_75206 ?auto_75204 )
      ( DELIVER-3PKG-VERIFY ?auto_75205 ?auto_75206 ?auto_75207 ?auto_75204 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75212 - OBJ
      ?auto_75213 - OBJ
      ?auto_75214 - OBJ
      ?auto_75211 - LOCATION
    )
    :vars
    (
      ?auto_75216 - OBJ
      ?auto_75217 - TRUCK
      ?auto_75215 - LOCATION
      ?auto_75218 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75213 ?auto_75212 ) ) ( not ( = ?auto_75214 ?auto_75212 ) ) ( not ( = ?auto_75214 ?auto_75213 ) ) ( not ( = ?auto_75213 ?auto_75216 ) ) ( IN-TRUCK ?auto_75213 ?auto_75217 ) ( TRUCK-AT ?auto_75217 ?auto_75215 ) ( IN-CITY ?auto_75215 ?auto_75218 ) ( IN-CITY ?auto_75211 ?auto_75218 ) ( not ( = ?auto_75211 ?auto_75215 ) ) ( OBJ-AT ?auto_75216 ?auto_75211 ) ( OBJ-AT ?auto_75212 ?auto_75211 ) ( OBJ-AT ?auto_75214 ?auto_75211 ) ( not ( = ?auto_75212 ?auto_75216 ) ) ( not ( = ?auto_75214 ?auto_75216 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75216 ?auto_75213 ?auto_75211 )
      ( DELIVER-3PKG-VERIFY ?auto_75212 ?auto_75213 ?auto_75214 ?auto_75211 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75243 - OBJ
      ?auto_75244 - OBJ
      ?auto_75245 - OBJ
      ?auto_75242 - LOCATION
    )
    :vars
    (
      ?auto_75247 - TRUCK
      ?auto_75246 - LOCATION
      ?auto_75248 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75244 ?auto_75243 ) ) ( not ( = ?auto_75245 ?auto_75243 ) ) ( not ( = ?auto_75245 ?auto_75244 ) ) ( IN-TRUCK ?auto_75243 ?auto_75247 ) ( TRUCK-AT ?auto_75247 ?auto_75246 ) ( IN-CITY ?auto_75246 ?auto_75248 ) ( IN-CITY ?auto_75242 ?auto_75248 ) ( not ( = ?auto_75242 ?auto_75246 ) ) ( OBJ-AT ?auto_75244 ?auto_75242 ) ( OBJ-AT ?auto_75245 ?auto_75242 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75244 ?auto_75243 ?auto_75242 )
      ( DELIVER-3PKG-VERIFY ?auto_75243 ?auto_75244 ?auto_75245 ?auto_75242 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75250 - OBJ
      ?auto_75251 - OBJ
      ?auto_75252 - OBJ
      ?auto_75249 - LOCATION
    )
    :vars
    (
      ?auto_75254 - TRUCK
      ?auto_75253 - LOCATION
      ?auto_75255 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75251 ?auto_75250 ) ) ( not ( = ?auto_75252 ?auto_75250 ) ) ( not ( = ?auto_75252 ?auto_75251 ) ) ( IN-TRUCK ?auto_75250 ?auto_75254 ) ( TRUCK-AT ?auto_75254 ?auto_75253 ) ( IN-CITY ?auto_75253 ?auto_75255 ) ( IN-CITY ?auto_75249 ?auto_75255 ) ( not ( = ?auto_75249 ?auto_75253 ) ) ( OBJ-AT ?auto_75251 ?auto_75249 ) ( OBJ-AT ?auto_75252 ?auto_75249 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75251 ?auto_75250 ?auto_75249 )
      ( DELIVER-3PKG-VERIFY ?auto_75250 ?auto_75251 ?auto_75252 ?auto_75249 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75264 - OBJ
      ?auto_75265 - OBJ
      ?auto_75266 - OBJ
      ?auto_75263 - LOCATION
    )
    :vars
    (
      ?auto_75268 - TRUCK
      ?auto_75267 - LOCATION
      ?auto_75269 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75265 ?auto_75264 ) ) ( not ( = ?auto_75266 ?auto_75264 ) ) ( not ( = ?auto_75266 ?auto_75265 ) ) ( IN-TRUCK ?auto_75264 ?auto_75268 ) ( TRUCK-AT ?auto_75268 ?auto_75267 ) ( IN-CITY ?auto_75267 ?auto_75269 ) ( IN-CITY ?auto_75263 ?auto_75269 ) ( not ( = ?auto_75263 ?auto_75267 ) ) ( OBJ-AT ?auto_75266 ?auto_75263 ) ( OBJ-AT ?auto_75265 ?auto_75263 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75266 ?auto_75264 ?auto_75263 )
      ( DELIVER-3PKG-VERIFY ?auto_75264 ?auto_75265 ?auto_75266 ?auto_75263 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75279 - OBJ
      ?auto_75280 - OBJ
      ?auto_75281 - OBJ
      ?auto_75278 - LOCATION
    )
    :vars
    (
      ?auto_75283 - OBJ
      ?auto_75284 - TRUCK
      ?auto_75282 - LOCATION
      ?auto_75285 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75280 ?auto_75279 ) ) ( not ( = ?auto_75281 ?auto_75279 ) ) ( not ( = ?auto_75281 ?auto_75280 ) ) ( not ( = ?auto_75279 ?auto_75283 ) ) ( IN-TRUCK ?auto_75279 ?auto_75284 ) ( TRUCK-AT ?auto_75284 ?auto_75282 ) ( IN-CITY ?auto_75282 ?auto_75285 ) ( IN-CITY ?auto_75278 ?auto_75285 ) ( not ( = ?auto_75278 ?auto_75282 ) ) ( OBJ-AT ?auto_75283 ?auto_75278 ) ( OBJ-AT ?auto_75280 ?auto_75278 ) ( OBJ-AT ?auto_75281 ?auto_75278 ) ( not ( = ?auto_75280 ?auto_75283 ) ) ( not ( = ?auto_75281 ?auto_75283 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75283 ?auto_75279 ?auto_75278 )
      ( DELIVER-3PKG-VERIFY ?auto_75279 ?auto_75280 ?auto_75281 ?auto_75278 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75295 - OBJ
      ?auto_75296 - OBJ
      ?auto_75297 - OBJ
      ?auto_75294 - LOCATION
    )
    :vars
    (
      ?auto_75299 - TRUCK
      ?auto_75298 - LOCATION
      ?auto_75300 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75296 ?auto_75295 ) ) ( not ( = ?auto_75297 ?auto_75295 ) ) ( not ( = ?auto_75297 ?auto_75296 ) ) ( IN-TRUCK ?auto_75295 ?auto_75299 ) ( TRUCK-AT ?auto_75299 ?auto_75298 ) ( IN-CITY ?auto_75298 ?auto_75300 ) ( IN-CITY ?auto_75294 ?auto_75300 ) ( not ( = ?auto_75294 ?auto_75298 ) ) ( OBJ-AT ?auto_75297 ?auto_75294 ) ( OBJ-AT ?auto_75296 ?auto_75294 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75297 ?auto_75295 ?auto_75294 )
      ( DELIVER-3PKG-VERIFY ?auto_75295 ?auto_75296 ?auto_75297 ?auto_75294 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75302 - OBJ
      ?auto_75303 - OBJ
      ?auto_75304 - OBJ
      ?auto_75301 - LOCATION
    )
    :vars
    (
      ?auto_75306 - OBJ
      ?auto_75307 - TRUCK
      ?auto_75305 - LOCATION
      ?auto_75308 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75303 ?auto_75302 ) ) ( not ( = ?auto_75304 ?auto_75302 ) ) ( not ( = ?auto_75304 ?auto_75303 ) ) ( not ( = ?auto_75302 ?auto_75306 ) ) ( IN-TRUCK ?auto_75302 ?auto_75307 ) ( TRUCK-AT ?auto_75307 ?auto_75305 ) ( IN-CITY ?auto_75305 ?auto_75308 ) ( IN-CITY ?auto_75301 ?auto_75308 ) ( not ( = ?auto_75301 ?auto_75305 ) ) ( OBJ-AT ?auto_75306 ?auto_75301 ) ( OBJ-AT ?auto_75303 ?auto_75301 ) ( OBJ-AT ?auto_75304 ?auto_75301 ) ( not ( = ?auto_75303 ?auto_75306 ) ) ( not ( = ?auto_75304 ?auto_75306 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75306 ?auto_75302 ?auto_75301 )
      ( DELIVER-3PKG-VERIFY ?auto_75302 ?auto_75303 ?auto_75304 ?auto_75301 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75429 - OBJ
      ?auto_75430 - OBJ
      ?auto_75431 - OBJ
      ?auto_75432 - OBJ
      ?auto_75428 - LOCATION
    )
    :vars
    (
      ?auto_75434 - TRUCK
      ?auto_75433 - LOCATION
      ?auto_75435 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75430 ?auto_75429 ) ) ( not ( = ?auto_75431 ?auto_75429 ) ) ( not ( = ?auto_75431 ?auto_75430 ) ) ( not ( = ?auto_75432 ?auto_75429 ) ) ( not ( = ?auto_75432 ?auto_75430 ) ) ( not ( = ?auto_75432 ?auto_75431 ) ) ( IN-TRUCK ?auto_75432 ?auto_75434 ) ( TRUCK-AT ?auto_75434 ?auto_75433 ) ( IN-CITY ?auto_75433 ?auto_75435 ) ( IN-CITY ?auto_75428 ?auto_75435 ) ( not ( = ?auto_75428 ?auto_75433 ) ) ( OBJ-AT ?auto_75429 ?auto_75428 ) ( OBJ-AT ?auto_75430 ?auto_75428 ) ( OBJ-AT ?auto_75431 ?auto_75428 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75429 ?auto_75432 ?auto_75428 )
      ( DELIVER-4PKG-VERIFY ?auto_75429 ?auto_75430 ?auto_75431 ?auto_75432 ?auto_75428 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75453 - OBJ
      ?auto_75454 - OBJ
      ?auto_75455 - OBJ
      ?auto_75456 - OBJ
      ?auto_75452 - LOCATION
    )
    :vars
    (
      ?auto_75458 - TRUCK
      ?auto_75457 - LOCATION
      ?auto_75459 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75454 ?auto_75453 ) ) ( not ( = ?auto_75455 ?auto_75453 ) ) ( not ( = ?auto_75455 ?auto_75454 ) ) ( not ( = ?auto_75456 ?auto_75453 ) ) ( not ( = ?auto_75456 ?auto_75454 ) ) ( not ( = ?auto_75456 ?auto_75455 ) ) ( IN-TRUCK ?auto_75455 ?auto_75458 ) ( TRUCK-AT ?auto_75458 ?auto_75457 ) ( IN-CITY ?auto_75457 ?auto_75459 ) ( IN-CITY ?auto_75452 ?auto_75459 ) ( not ( = ?auto_75452 ?auto_75457 ) ) ( OBJ-AT ?auto_75453 ?auto_75452 ) ( OBJ-AT ?auto_75454 ?auto_75452 ) ( OBJ-AT ?auto_75456 ?auto_75452 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75453 ?auto_75455 ?auto_75452 )
      ( DELIVER-4PKG-VERIFY ?auto_75453 ?auto_75454 ?auto_75455 ?auto_75456 ?auto_75452 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75477 - OBJ
      ?auto_75478 - OBJ
      ?auto_75479 - OBJ
      ?auto_75480 - OBJ
      ?auto_75476 - LOCATION
    )
    :vars
    (
      ?auto_75482 - TRUCK
      ?auto_75481 - LOCATION
      ?auto_75483 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75478 ?auto_75477 ) ) ( not ( = ?auto_75479 ?auto_75477 ) ) ( not ( = ?auto_75479 ?auto_75478 ) ) ( not ( = ?auto_75480 ?auto_75477 ) ) ( not ( = ?auto_75480 ?auto_75478 ) ) ( not ( = ?auto_75480 ?auto_75479 ) ) ( IN-TRUCK ?auto_75480 ?auto_75482 ) ( TRUCK-AT ?auto_75482 ?auto_75481 ) ( IN-CITY ?auto_75481 ?auto_75483 ) ( IN-CITY ?auto_75476 ?auto_75483 ) ( not ( = ?auto_75476 ?auto_75481 ) ) ( OBJ-AT ?auto_75477 ?auto_75476 ) ( OBJ-AT ?auto_75478 ?auto_75476 ) ( OBJ-AT ?auto_75479 ?auto_75476 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75477 ?auto_75480 ?auto_75476 )
      ( DELIVER-4PKG-VERIFY ?auto_75477 ?auto_75478 ?auto_75479 ?auto_75480 ?auto_75476 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75501 - OBJ
      ?auto_75502 - OBJ
      ?auto_75503 - OBJ
      ?auto_75504 - OBJ
      ?auto_75500 - LOCATION
    )
    :vars
    (
      ?auto_75506 - TRUCK
      ?auto_75505 - LOCATION
      ?auto_75507 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75502 ?auto_75501 ) ) ( not ( = ?auto_75503 ?auto_75501 ) ) ( not ( = ?auto_75503 ?auto_75502 ) ) ( not ( = ?auto_75504 ?auto_75501 ) ) ( not ( = ?auto_75504 ?auto_75502 ) ) ( not ( = ?auto_75504 ?auto_75503 ) ) ( IN-TRUCK ?auto_75503 ?auto_75506 ) ( TRUCK-AT ?auto_75506 ?auto_75505 ) ( IN-CITY ?auto_75505 ?auto_75507 ) ( IN-CITY ?auto_75500 ?auto_75507 ) ( not ( = ?auto_75500 ?auto_75505 ) ) ( OBJ-AT ?auto_75501 ?auto_75500 ) ( OBJ-AT ?auto_75502 ?auto_75500 ) ( OBJ-AT ?auto_75504 ?auto_75500 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75501 ?auto_75503 ?auto_75500 )
      ( DELIVER-4PKG-VERIFY ?auto_75501 ?auto_75502 ?auto_75503 ?auto_75504 ?auto_75500 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75573 - OBJ
      ?auto_75574 - OBJ
      ?auto_75575 - OBJ
      ?auto_75576 - OBJ
      ?auto_75572 - LOCATION
    )
    :vars
    (
      ?auto_75578 - TRUCK
      ?auto_75577 - LOCATION
      ?auto_75579 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75574 ?auto_75573 ) ) ( not ( = ?auto_75575 ?auto_75573 ) ) ( not ( = ?auto_75575 ?auto_75574 ) ) ( not ( = ?auto_75576 ?auto_75573 ) ) ( not ( = ?auto_75576 ?auto_75574 ) ) ( not ( = ?auto_75576 ?auto_75575 ) ) ( IN-TRUCK ?auto_75574 ?auto_75578 ) ( TRUCK-AT ?auto_75578 ?auto_75577 ) ( IN-CITY ?auto_75577 ?auto_75579 ) ( IN-CITY ?auto_75572 ?auto_75579 ) ( not ( = ?auto_75572 ?auto_75577 ) ) ( OBJ-AT ?auto_75573 ?auto_75572 ) ( OBJ-AT ?auto_75575 ?auto_75572 ) ( OBJ-AT ?auto_75576 ?auto_75572 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75573 ?auto_75574 ?auto_75572 )
      ( DELIVER-4PKG-VERIFY ?auto_75573 ?auto_75574 ?auto_75575 ?auto_75576 ?auto_75572 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75597 - OBJ
      ?auto_75598 - OBJ
      ?auto_75599 - OBJ
      ?auto_75600 - OBJ
      ?auto_75596 - LOCATION
    )
    :vars
    (
      ?auto_75602 - TRUCK
      ?auto_75601 - LOCATION
      ?auto_75603 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75598 ?auto_75597 ) ) ( not ( = ?auto_75599 ?auto_75597 ) ) ( not ( = ?auto_75599 ?auto_75598 ) ) ( not ( = ?auto_75600 ?auto_75597 ) ) ( not ( = ?auto_75600 ?auto_75598 ) ) ( not ( = ?auto_75600 ?auto_75599 ) ) ( IN-TRUCK ?auto_75598 ?auto_75602 ) ( TRUCK-AT ?auto_75602 ?auto_75601 ) ( IN-CITY ?auto_75601 ?auto_75603 ) ( IN-CITY ?auto_75596 ?auto_75603 ) ( not ( = ?auto_75596 ?auto_75601 ) ) ( OBJ-AT ?auto_75597 ?auto_75596 ) ( OBJ-AT ?auto_75599 ?auto_75596 ) ( OBJ-AT ?auto_75600 ?auto_75596 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75597 ?auto_75598 ?auto_75596 )
      ( DELIVER-4PKG-VERIFY ?auto_75597 ?auto_75598 ?auto_75599 ?auto_75600 ?auto_75596 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75669 - OBJ
      ?auto_75670 - OBJ
      ?auto_75671 - OBJ
      ?auto_75672 - OBJ
      ?auto_75668 - LOCATION
    )
    :vars
    (
      ?auto_75674 - TRUCK
      ?auto_75673 - LOCATION
      ?auto_75675 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75670 ?auto_75669 ) ) ( not ( = ?auto_75671 ?auto_75669 ) ) ( not ( = ?auto_75671 ?auto_75670 ) ) ( not ( = ?auto_75672 ?auto_75669 ) ) ( not ( = ?auto_75672 ?auto_75670 ) ) ( not ( = ?auto_75672 ?auto_75671 ) ) ( IN-TRUCK ?auto_75672 ?auto_75674 ) ( TRUCK-AT ?auto_75674 ?auto_75673 ) ( IN-CITY ?auto_75673 ?auto_75675 ) ( IN-CITY ?auto_75668 ?auto_75675 ) ( not ( = ?auto_75668 ?auto_75673 ) ) ( OBJ-AT ?auto_75670 ?auto_75668 ) ( OBJ-AT ?auto_75669 ?auto_75668 ) ( OBJ-AT ?auto_75671 ?auto_75668 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75670 ?auto_75672 ?auto_75668 )
      ( DELIVER-4PKG-VERIFY ?auto_75669 ?auto_75670 ?auto_75671 ?auto_75672 ?auto_75668 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75693 - OBJ
      ?auto_75694 - OBJ
      ?auto_75695 - OBJ
      ?auto_75696 - OBJ
      ?auto_75692 - LOCATION
    )
    :vars
    (
      ?auto_75698 - TRUCK
      ?auto_75697 - LOCATION
      ?auto_75699 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75694 ?auto_75693 ) ) ( not ( = ?auto_75695 ?auto_75693 ) ) ( not ( = ?auto_75695 ?auto_75694 ) ) ( not ( = ?auto_75696 ?auto_75693 ) ) ( not ( = ?auto_75696 ?auto_75694 ) ) ( not ( = ?auto_75696 ?auto_75695 ) ) ( IN-TRUCK ?auto_75695 ?auto_75698 ) ( TRUCK-AT ?auto_75698 ?auto_75697 ) ( IN-CITY ?auto_75697 ?auto_75699 ) ( IN-CITY ?auto_75692 ?auto_75699 ) ( not ( = ?auto_75692 ?auto_75697 ) ) ( OBJ-AT ?auto_75694 ?auto_75692 ) ( OBJ-AT ?auto_75693 ?auto_75692 ) ( OBJ-AT ?auto_75696 ?auto_75692 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75694 ?auto_75695 ?auto_75692 )
      ( DELIVER-4PKG-VERIFY ?auto_75693 ?auto_75694 ?auto_75695 ?auto_75696 ?auto_75692 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75770 - OBJ
      ?auto_75771 - OBJ
      ?auto_75772 - OBJ
      ?auto_75773 - OBJ
      ?auto_75769 - LOCATION
    )
    :vars
    (
      ?auto_75775 - TRUCK
      ?auto_75774 - LOCATION
      ?auto_75776 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75771 ?auto_75770 ) ) ( not ( = ?auto_75772 ?auto_75770 ) ) ( not ( = ?auto_75772 ?auto_75771 ) ) ( not ( = ?auto_75773 ?auto_75770 ) ) ( not ( = ?auto_75773 ?auto_75771 ) ) ( not ( = ?auto_75773 ?auto_75772 ) ) ( IN-TRUCK ?auto_75773 ?auto_75775 ) ( TRUCK-AT ?auto_75775 ?auto_75774 ) ( IN-CITY ?auto_75774 ?auto_75776 ) ( IN-CITY ?auto_75769 ?auto_75776 ) ( not ( = ?auto_75769 ?auto_75774 ) ) ( OBJ-AT ?auto_75772 ?auto_75769 ) ( OBJ-AT ?auto_75770 ?auto_75769 ) ( OBJ-AT ?auto_75771 ?auto_75769 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75772 ?auto_75773 ?auto_75769 )
      ( DELIVER-4PKG-VERIFY ?auto_75770 ?auto_75771 ?auto_75772 ?auto_75773 ?auto_75769 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75796 - OBJ
      ?auto_75797 - OBJ
      ?auto_75798 - OBJ
      ?auto_75799 - OBJ
      ?auto_75795 - LOCATION
    )
    :vars
    (
      ?auto_75801 - TRUCK
      ?auto_75800 - LOCATION
      ?auto_75802 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75797 ?auto_75796 ) ) ( not ( = ?auto_75798 ?auto_75796 ) ) ( not ( = ?auto_75798 ?auto_75797 ) ) ( not ( = ?auto_75799 ?auto_75796 ) ) ( not ( = ?auto_75799 ?auto_75797 ) ) ( not ( = ?auto_75799 ?auto_75798 ) ) ( IN-TRUCK ?auto_75798 ?auto_75801 ) ( TRUCK-AT ?auto_75801 ?auto_75800 ) ( IN-CITY ?auto_75800 ?auto_75802 ) ( IN-CITY ?auto_75795 ?auto_75802 ) ( not ( = ?auto_75795 ?auto_75800 ) ) ( OBJ-AT ?auto_75799 ?auto_75795 ) ( OBJ-AT ?auto_75796 ?auto_75795 ) ( OBJ-AT ?auto_75797 ?auto_75795 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75799 ?auto_75798 ?auto_75795 )
      ( DELIVER-4PKG-VERIFY ?auto_75796 ?auto_75797 ?auto_75798 ?auto_75799 ?auto_75795 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75847 - OBJ
      ?auto_75848 - OBJ
      ?auto_75849 - OBJ
      ?auto_75850 - OBJ
      ?auto_75846 - LOCATION
    )
    :vars
    (
      ?auto_75852 - TRUCK
      ?auto_75851 - LOCATION
      ?auto_75853 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75848 ?auto_75847 ) ) ( not ( = ?auto_75849 ?auto_75847 ) ) ( not ( = ?auto_75849 ?auto_75848 ) ) ( not ( = ?auto_75850 ?auto_75847 ) ) ( not ( = ?auto_75850 ?auto_75848 ) ) ( not ( = ?auto_75850 ?auto_75849 ) ) ( IN-TRUCK ?auto_75848 ?auto_75852 ) ( TRUCK-AT ?auto_75852 ?auto_75851 ) ( IN-CITY ?auto_75851 ?auto_75853 ) ( IN-CITY ?auto_75846 ?auto_75853 ) ( not ( = ?auto_75846 ?auto_75851 ) ) ( OBJ-AT ?auto_75849 ?auto_75846 ) ( OBJ-AT ?auto_75847 ?auto_75846 ) ( OBJ-AT ?auto_75850 ?auto_75846 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75849 ?auto_75848 ?auto_75846 )
      ( DELIVER-4PKG-VERIFY ?auto_75847 ?auto_75848 ?auto_75849 ?auto_75850 ?auto_75846 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75898 - OBJ
      ?auto_75899 - OBJ
      ?auto_75900 - OBJ
      ?auto_75901 - OBJ
      ?auto_75897 - LOCATION
    )
    :vars
    (
      ?auto_75903 - TRUCK
      ?auto_75902 - LOCATION
      ?auto_75904 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75899 ?auto_75898 ) ) ( not ( = ?auto_75900 ?auto_75898 ) ) ( not ( = ?auto_75900 ?auto_75899 ) ) ( not ( = ?auto_75901 ?auto_75898 ) ) ( not ( = ?auto_75901 ?auto_75899 ) ) ( not ( = ?auto_75901 ?auto_75900 ) ) ( IN-TRUCK ?auto_75899 ?auto_75903 ) ( TRUCK-AT ?auto_75903 ?auto_75902 ) ( IN-CITY ?auto_75902 ?auto_75904 ) ( IN-CITY ?auto_75897 ?auto_75904 ) ( not ( = ?auto_75897 ?auto_75902 ) ) ( OBJ-AT ?auto_75901 ?auto_75897 ) ( OBJ-AT ?auto_75898 ?auto_75897 ) ( OBJ-AT ?auto_75900 ?auto_75897 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75901 ?auto_75899 ?auto_75897 )
      ( DELIVER-4PKG-VERIFY ?auto_75898 ?auto_75899 ?auto_75900 ?auto_75901 ?auto_75897 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75976 - OBJ
      ?auto_75977 - OBJ
      ?auto_75978 - OBJ
      ?auto_75979 - OBJ
      ?auto_75975 - LOCATION
    )
    :vars
    (
      ?auto_75981 - TRUCK
      ?auto_75980 - LOCATION
      ?auto_75982 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_75977 ?auto_75976 ) ) ( not ( = ?auto_75978 ?auto_75976 ) ) ( not ( = ?auto_75978 ?auto_75977 ) ) ( not ( = ?auto_75979 ?auto_75976 ) ) ( not ( = ?auto_75979 ?auto_75977 ) ) ( not ( = ?auto_75979 ?auto_75978 ) ) ( IN-TRUCK ?auto_75979 ?auto_75981 ) ( TRUCK-AT ?auto_75981 ?auto_75980 ) ( IN-CITY ?auto_75980 ?auto_75982 ) ( IN-CITY ?auto_75975 ?auto_75982 ) ( not ( = ?auto_75975 ?auto_75980 ) ) ( OBJ-AT ?auto_75977 ?auto_75975 ) ( OBJ-AT ?auto_75976 ?auto_75975 ) ( OBJ-AT ?auto_75978 ?auto_75975 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75977 ?auto_75979 ?auto_75975 )
      ( DELIVER-4PKG-VERIFY ?auto_75976 ?auto_75977 ?auto_75978 ?auto_75979 ?auto_75975 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76000 - OBJ
      ?auto_76001 - OBJ
      ?auto_76002 - OBJ
      ?auto_76003 - OBJ
      ?auto_75999 - LOCATION
    )
    :vars
    (
      ?auto_76005 - TRUCK
      ?auto_76004 - LOCATION
      ?auto_76006 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76001 ?auto_76000 ) ) ( not ( = ?auto_76002 ?auto_76000 ) ) ( not ( = ?auto_76002 ?auto_76001 ) ) ( not ( = ?auto_76003 ?auto_76000 ) ) ( not ( = ?auto_76003 ?auto_76001 ) ) ( not ( = ?auto_76003 ?auto_76002 ) ) ( IN-TRUCK ?auto_76002 ?auto_76005 ) ( TRUCK-AT ?auto_76005 ?auto_76004 ) ( IN-CITY ?auto_76004 ?auto_76006 ) ( IN-CITY ?auto_75999 ?auto_76006 ) ( not ( = ?auto_75999 ?auto_76004 ) ) ( OBJ-AT ?auto_76001 ?auto_75999 ) ( OBJ-AT ?auto_76000 ?auto_75999 ) ( OBJ-AT ?auto_76003 ?auto_75999 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76001 ?auto_76002 ?auto_75999 )
      ( DELIVER-4PKG-VERIFY ?auto_76000 ?auto_76001 ?auto_76002 ?auto_76003 ?auto_75999 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76024 - OBJ
      ?auto_76025 - OBJ
      ?auto_76026 - OBJ
      ?auto_76027 - OBJ
      ?auto_76023 - LOCATION
    )
    :vars
    (
      ?auto_76029 - TRUCK
      ?auto_76028 - LOCATION
      ?auto_76030 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76025 ?auto_76024 ) ) ( not ( = ?auto_76026 ?auto_76024 ) ) ( not ( = ?auto_76026 ?auto_76025 ) ) ( not ( = ?auto_76027 ?auto_76024 ) ) ( not ( = ?auto_76027 ?auto_76025 ) ) ( not ( = ?auto_76027 ?auto_76026 ) ) ( IN-TRUCK ?auto_76027 ?auto_76029 ) ( TRUCK-AT ?auto_76029 ?auto_76028 ) ( IN-CITY ?auto_76028 ?auto_76030 ) ( IN-CITY ?auto_76023 ?auto_76030 ) ( not ( = ?auto_76023 ?auto_76028 ) ) ( OBJ-AT ?auto_76026 ?auto_76023 ) ( OBJ-AT ?auto_76024 ?auto_76023 ) ( OBJ-AT ?auto_76025 ?auto_76023 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76026 ?auto_76027 ?auto_76023 )
      ( DELIVER-4PKG-VERIFY ?auto_76024 ?auto_76025 ?auto_76026 ?auto_76027 ?auto_76023 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76050 - OBJ
      ?auto_76051 - OBJ
      ?auto_76052 - OBJ
      ?auto_76053 - OBJ
      ?auto_76049 - LOCATION
    )
    :vars
    (
      ?auto_76055 - TRUCK
      ?auto_76054 - LOCATION
      ?auto_76056 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76051 ?auto_76050 ) ) ( not ( = ?auto_76052 ?auto_76050 ) ) ( not ( = ?auto_76052 ?auto_76051 ) ) ( not ( = ?auto_76053 ?auto_76050 ) ) ( not ( = ?auto_76053 ?auto_76051 ) ) ( not ( = ?auto_76053 ?auto_76052 ) ) ( IN-TRUCK ?auto_76052 ?auto_76055 ) ( TRUCK-AT ?auto_76055 ?auto_76054 ) ( IN-CITY ?auto_76054 ?auto_76056 ) ( IN-CITY ?auto_76049 ?auto_76056 ) ( not ( = ?auto_76049 ?auto_76054 ) ) ( OBJ-AT ?auto_76053 ?auto_76049 ) ( OBJ-AT ?auto_76050 ?auto_76049 ) ( OBJ-AT ?auto_76051 ?auto_76049 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76053 ?auto_76052 ?auto_76049 )
      ( DELIVER-4PKG-VERIFY ?auto_76050 ?auto_76051 ?auto_76052 ?auto_76053 ?auto_76049 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76154 - OBJ
      ?auto_76155 - OBJ
      ?auto_76156 - OBJ
      ?auto_76157 - OBJ
      ?auto_76153 - LOCATION
    )
    :vars
    (
      ?auto_76159 - TRUCK
      ?auto_76158 - LOCATION
      ?auto_76160 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76155 ?auto_76154 ) ) ( not ( = ?auto_76156 ?auto_76154 ) ) ( not ( = ?auto_76156 ?auto_76155 ) ) ( not ( = ?auto_76157 ?auto_76154 ) ) ( not ( = ?auto_76157 ?auto_76155 ) ) ( not ( = ?auto_76157 ?auto_76156 ) ) ( IN-TRUCK ?auto_76155 ?auto_76159 ) ( TRUCK-AT ?auto_76159 ?auto_76158 ) ( IN-CITY ?auto_76158 ?auto_76160 ) ( IN-CITY ?auto_76153 ?auto_76160 ) ( not ( = ?auto_76153 ?auto_76158 ) ) ( OBJ-AT ?auto_76156 ?auto_76153 ) ( OBJ-AT ?auto_76154 ?auto_76153 ) ( OBJ-AT ?auto_76157 ?auto_76153 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76156 ?auto_76155 ?auto_76153 )
      ( DELIVER-4PKG-VERIFY ?auto_76154 ?auto_76155 ?auto_76156 ?auto_76157 ?auto_76153 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76178 - OBJ
      ?auto_76179 - OBJ
      ?auto_76180 - OBJ
      ?auto_76181 - OBJ
      ?auto_76177 - LOCATION
    )
    :vars
    (
      ?auto_76183 - TRUCK
      ?auto_76182 - LOCATION
      ?auto_76184 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76179 ?auto_76178 ) ) ( not ( = ?auto_76180 ?auto_76178 ) ) ( not ( = ?auto_76180 ?auto_76179 ) ) ( not ( = ?auto_76181 ?auto_76178 ) ) ( not ( = ?auto_76181 ?auto_76179 ) ) ( not ( = ?auto_76181 ?auto_76180 ) ) ( IN-TRUCK ?auto_76179 ?auto_76183 ) ( TRUCK-AT ?auto_76183 ?auto_76182 ) ( IN-CITY ?auto_76182 ?auto_76184 ) ( IN-CITY ?auto_76177 ?auto_76184 ) ( not ( = ?auto_76177 ?auto_76182 ) ) ( OBJ-AT ?auto_76181 ?auto_76177 ) ( OBJ-AT ?auto_76178 ?auto_76177 ) ( OBJ-AT ?auto_76180 ?auto_76177 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76181 ?auto_76179 ?auto_76177 )
      ( DELIVER-4PKG-VERIFY ?auto_76178 ?auto_76179 ?auto_76180 ?auto_76181 ?auto_76177 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76331 - OBJ
      ?auto_76332 - OBJ
      ?auto_76333 - OBJ
      ?auto_76334 - OBJ
      ?auto_76330 - LOCATION
    )
    :vars
    (
      ?auto_76336 - TRUCK
      ?auto_76335 - LOCATION
      ?auto_76337 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76332 ?auto_76331 ) ) ( not ( = ?auto_76333 ?auto_76331 ) ) ( not ( = ?auto_76333 ?auto_76332 ) ) ( not ( = ?auto_76334 ?auto_76331 ) ) ( not ( = ?auto_76334 ?auto_76332 ) ) ( not ( = ?auto_76334 ?auto_76333 ) ) ( IN-TRUCK ?auto_76331 ?auto_76336 ) ( TRUCK-AT ?auto_76336 ?auto_76335 ) ( IN-CITY ?auto_76335 ?auto_76337 ) ( IN-CITY ?auto_76330 ?auto_76337 ) ( not ( = ?auto_76330 ?auto_76335 ) ) ( OBJ-AT ?auto_76332 ?auto_76330 ) ( OBJ-AT ?auto_76333 ?auto_76330 ) ( OBJ-AT ?auto_76334 ?auto_76330 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76332 ?auto_76331 ?auto_76330 )
      ( DELIVER-4PKG-VERIFY ?auto_76331 ?auto_76332 ?auto_76333 ?auto_76334 ?auto_76330 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76355 - OBJ
      ?auto_76356 - OBJ
      ?auto_76357 - OBJ
      ?auto_76358 - OBJ
      ?auto_76354 - LOCATION
    )
    :vars
    (
      ?auto_76360 - TRUCK
      ?auto_76359 - LOCATION
      ?auto_76361 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76356 ?auto_76355 ) ) ( not ( = ?auto_76357 ?auto_76355 ) ) ( not ( = ?auto_76357 ?auto_76356 ) ) ( not ( = ?auto_76358 ?auto_76355 ) ) ( not ( = ?auto_76358 ?auto_76356 ) ) ( not ( = ?auto_76358 ?auto_76357 ) ) ( IN-TRUCK ?auto_76355 ?auto_76360 ) ( TRUCK-AT ?auto_76360 ?auto_76359 ) ( IN-CITY ?auto_76359 ?auto_76361 ) ( IN-CITY ?auto_76354 ?auto_76361 ) ( not ( = ?auto_76354 ?auto_76359 ) ) ( OBJ-AT ?auto_76356 ?auto_76354 ) ( OBJ-AT ?auto_76357 ?auto_76354 ) ( OBJ-AT ?auto_76358 ?auto_76354 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76356 ?auto_76355 ?auto_76354 )
      ( DELIVER-4PKG-VERIFY ?auto_76355 ?auto_76356 ?auto_76357 ?auto_76358 ?auto_76354 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76427 - OBJ
      ?auto_76428 - OBJ
      ?auto_76429 - OBJ
      ?auto_76430 - OBJ
      ?auto_76426 - LOCATION
    )
    :vars
    (
      ?auto_76432 - TRUCK
      ?auto_76431 - LOCATION
      ?auto_76433 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76428 ?auto_76427 ) ) ( not ( = ?auto_76429 ?auto_76427 ) ) ( not ( = ?auto_76429 ?auto_76428 ) ) ( not ( = ?auto_76430 ?auto_76427 ) ) ( not ( = ?auto_76430 ?auto_76428 ) ) ( not ( = ?auto_76430 ?auto_76429 ) ) ( IN-TRUCK ?auto_76427 ?auto_76432 ) ( TRUCK-AT ?auto_76432 ?auto_76431 ) ( IN-CITY ?auto_76431 ?auto_76433 ) ( IN-CITY ?auto_76426 ?auto_76433 ) ( not ( = ?auto_76426 ?auto_76431 ) ) ( OBJ-AT ?auto_76429 ?auto_76426 ) ( OBJ-AT ?auto_76428 ?auto_76426 ) ( OBJ-AT ?auto_76430 ?auto_76426 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76429 ?auto_76427 ?auto_76426 )
      ( DELIVER-4PKG-VERIFY ?auto_76427 ?auto_76428 ?auto_76429 ?auto_76430 ?auto_76426 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76478 - OBJ
      ?auto_76479 - OBJ
      ?auto_76480 - OBJ
      ?auto_76481 - OBJ
      ?auto_76477 - LOCATION
    )
    :vars
    (
      ?auto_76483 - TRUCK
      ?auto_76482 - LOCATION
      ?auto_76484 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76479 ?auto_76478 ) ) ( not ( = ?auto_76480 ?auto_76478 ) ) ( not ( = ?auto_76480 ?auto_76479 ) ) ( not ( = ?auto_76481 ?auto_76478 ) ) ( not ( = ?auto_76481 ?auto_76479 ) ) ( not ( = ?auto_76481 ?auto_76480 ) ) ( IN-TRUCK ?auto_76478 ?auto_76483 ) ( TRUCK-AT ?auto_76483 ?auto_76482 ) ( IN-CITY ?auto_76482 ?auto_76484 ) ( IN-CITY ?auto_76477 ?auto_76484 ) ( not ( = ?auto_76477 ?auto_76482 ) ) ( OBJ-AT ?auto_76481 ?auto_76477 ) ( OBJ-AT ?auto_76479 ?auto_76477 ) ( OBJ-AT ?auto_76480 ?auto_76477 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76481 ?auto_76478 ?auto_76477 )
      ( DELIVER-4PKG-VERIFY ?auto_76478 ?auto_76479 ?auto_76480 ?auto_76481 ?auto_76477 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76556 - OBJ
      ?auto_76557 - OBJ
      ?auto_76558 - OBJ
      ?auto_76559 - OBJ
      ?auto_76555 - LOCATION
    )
    :vars
    (
      ?auto_76561 - TRUCK
      ?auto_76560 - LOCATION
      ?auto_76562 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76557 ?auto_76556 ) ) ( not ( = ?auto_76558 ?auto_76556 ) ) ( not ( = ?auto_76558 ?auto_76557 ) ) ( not ( = ?auto_76559 ?auto_76556 ) ) ( not ( = ?auto_76559 ?auto_76557 ) ) ( not ( = ?auto_76559 ?auto_76558 ) ) ( IN-TRUCK ?auto_76556 ?auto_76561 ) ( TRUCK-AT ?auto_76561 ?auto_76560 ) ( IN-CITY ?auto_76560 ?auto_76562 ) ( IN-CITY ?auto_76555 ?auto_76562 ) ( not ( = ?auto_76555 ?auto_76560 ) ) ( OBJ-AT ?auto_76558 ?auto_76555 ) ( OBJ-AT ?auto_76557 ?auto_76555 ) ( OBJ-AT ?auto_76559 ?auto_76555 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76558 ?auto_76556 ?auto_76555 )
      ( DELIVER-4PKG-VERIFY ?auto_76556 ?auto_76557 ?auto_76558 ?auto_76559 ?auto_76555 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76580 - OBJ
      ?auto_76581 - OBJ
      ?auto_76582 - OBJ
      ?auto_76583 - OBJ
      ?auto_76579 - LOCATION
    )
    :vars
    (
      ?auto_76585 - TRUCK
      ?auto_76584 - LOCATION
      ?auto_76586 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76581 ?auto_76580 ) ) ( not ( = ?auto_76582 ?auto_76580 ) ) ( not ( = ?auto_76582 ?auto_76581 ) ) ( not ( = ?auto_76583 ?auto_76580 ) ) ( not ( = ?auto_76583 ?auto_76581 ) ) ( not ( = ?auto_76583 ?auto_76582 ) ) ( IN-TRUCK ?auto_76580 ?auto_76585 ) ( TRUCK-AT ?auto_76585 ?auto_76584 ) ( IN-CITY ?auto_76584 ?auto_76586 ) ( IN-CITY ?auto_76579 ?auto_76586 ) ( not ( = ?auto_76579 ?auto_76584 ) ) ( OBJ-AT ?auto_76583 ?auto_76579 ) ( OBJ-AT ?auto_76581 ?auto_76579 ) ( OBJ-AT ?auto_76582 ?auto_76579 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76583 ?auto_76580 ?auto_76579 )
      ( DELIVER-4PKG-VERIFY ?auto_76580 ?auto_76581 ?auto_76582 ?auto_76583 ?auto_76579 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_76822 - OBJ
      ?auto_76821 - LOCATION
    )
    :vars
    (
      ?auto_76824 - OBJ
      ?auto_76825 - TRUCK
      ?auto_76823 - LOCATION
      ?auto_76826 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76822 ?auto_76824 ) ) ( TRUCK-AT ?auto_76825 ?auto_76823 ) ( IN-CITY ?auto_76823 ?auto_76826 ) ( IN-CITY ?auto_76821 ?auto_76826 ) ( not ( = ?auto_76821 ?auto_76823 ) ) ( OBJ-AT ?auto_76824 ?auto_76821 ) ( OBJ-AT ?auto_76822 ?auto_76823 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_76822 ?auto_76825 ?auto_76823 )
      ( DELIVER-2PKG ?auto_76824 ?auto_76822 ?auto_76821 )
      ( DELIVER-1PKG-VERIFY ?auto_76822 ?auto_76821 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_76828 - OBJ
      ?auto_76829 - OBJ
      ?auto_76827 - LOCATION
    )
    :vars
    (
      ?auto_76831 - TRUCK
      ?auto_76832 - LOCATION
      ?auto_76830 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76829 ?auto_76828 ) ) ( TRUCK-AT ?auto_76831 ?auto_76832 ) ( IN-CITY ?auto_76832 ?auto_76830 ) ( IN-CITY ?auto_76827 ?auto_76830 ) ( not ( = ?auto_76827 ?auto_76832 ) ) ( OBJ-AT ?auto_76828 ?auto_76827 ) ( OBJ-AT ?auto_76829 ?auto_76832 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_76829 ?auto_76827 )
      ( DELIVER-2PKG-VERIFY ?auto_76828 ?auto_76829 ?auto_76827 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_76834 - OBJ
      ?auto_76835 - OBJ
      ?auto_76833 - LOCATION
    )
    :vars
    (
      ?auto_76837 - OBJ
      ?auto_76836 - TRUCK
      ?auto_76838 - LOCATION
      ?auto_76839 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76835 ?auto_76834 ) ) ( not ( = ?auto_76835 ?auto_76837 ) ) ( TRUCK-AT ?auto_76836 ?auto_76838 ) ( IN-CITY ?auto_76838 ?auto_76839 ) ( IN-CITY ?auto_76833 ?auto_76839 ) ( not ( = ?auto_76833 ?auto_76838 ) ) ( OBJ-AT ?auto_76837 ?auto_76833 ) ( OBJ-AT ?auto_76835 ?auto_76838 ) ( OBJ-AT ?auto_76834 ?auto_76833 ) ( not ( = ?auto_76834 ?auto_76837 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76837 ?auto_76835 ?auto_76833 )
      ( DELIVER-2PKG-VERIFY ?auto_76834 ?auto_76835 ?auto_76833 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_76841 - OBJ
      ?auto_76842 - OBJ
      ?auto_76840 - LOCATION
    )
    :vars
    (
      ?auto_76844 - OBJ
      ?auto_76843 - TRUCK
      ?auto_76845 - LOCATION
      ?auto_76846 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76842 ?auto_76841 ) ) ( not ( = ?auto_76842 ?auto_76844 ) ) ( TRUCK-AT ?auto_76843 ?auto_76845 ) ( IN-CITY ?auto_76845 ?auto_76846 ) ( IN-CITY ?auto_76840 ?auto_76846 ) ( not ( = ?auto_76840 ?auto_76845 ) ) ( OBJ-AT ?auto_76844 ?auto_76840 ) ( OBJ-AT ?auto_76842 ?auto_76845 ) ( OBJ-AT ?auto_76841 ?auto_76840 ) ( not ( = ?auto_76841 ?auto_76844 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76844 ?auto_76842 ?auto_76840 )
      ( DELIVER-2PKG-VERIFY ?auto_76841 ?auto_76842 ?auto_76840 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_76848 - OBJ
      ?auto_76849 - OBJ
      ?auto_76847 - LOCATION
    )
    :vars
    (
      ?auto_76850 - TRUCK
      ?auto_76851 - LOCATION
      ?auto_76852 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76849 ?auto_76848 ) ) ( TRUCK-AT ?auto_76850 ?auto_76851 ) ( IN-CITY ?auto_76851 ?auto_76852 ) ( IN-CITY ?auto_76847 ?auto_76852 ) ( not ( = ?auto_76847 ?auto_76851 ) ) ( OBJ-AT ?auto_76849 ?auto_76847 ) ( OBJ-AT ?auto_76848 ?auto_76851 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76849 ?auto_76848 ?auto_76847 )
      ( DELIVER-2PKG-VERIFY ?auto_76848 ?auto_76849 ?auto_76847 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_76854 - OBJ
      ?auto_76855 - OBJ
      ?auto_76853 - LOCATION
    )
    :vars
    (
      ?auto_76857 - OBJ
      ?auto_76856 - TRUCK
      ?auto_76858 - LOCATION
      ?auto_76859 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76855 ?auto_76854 ) ) ( not ( = ?auto_76854 ?auto_76857 ) ) ( TRUCK-AT ?auto_76856 ?auto_76858 ) ( IN-CITY ?auto_76858 ?auto_76859 ) ( IN-CITY ?auto_76853 ?auto_76859 ) ( not ( = ?auto_76853 ?auto_76858 ) ) ( OBJ-AT ?auto_76857 ?auto_76853 ) ( OBJ-AT ?auto_76854 ?auto_76858 ) ( OBJ-AT ?auto_76855 ?auto_76853 ) ( not ( = ?auto_76855 ?auto_76857 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76857 ?auto_76854 ?auto_76853 )
      ( DELIVER-2PKG-VERIFY ?auto_76854 ?auto_76855 ?auto_76853 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_76861 - OBJ
      ?auto_76862 - OBJ
      ?auto_76860 - LOCATION
    )
    :vars
    (
      ?auto_76864 - OBJ
      ?auto_76863 - TRUCK
      ?auto_76865 - LOCATION
      ?auto_76866 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76862 ?auto_76861 ) ) ( not ( = ?auto_76861 ?auto_76864 ) ) ( TRUCK-AT ?auto_76863 ?auto_76865 ) ( IN-CITY ?auto_76865 ?auto_76866 ) ( IN-CITY ?auto_76860 ?auto_76866 ) ( not ( = ?auto_76860 ?auto_76865 ) ) ( OBJ-AT ?auto_76864 ?auto_76860 ) ( OBJ-AT ?auto_76861 ?auto_76865 ) ( OBJ-AT ?auto_76862 ?auto_76860 ) ( not ( = ?auto_76862 ?auto_76864 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76864 ?auto_76861 ?auto_76860 )
      ( DELIVER-2PKG-VERIFY ?auto_76861 ?auto_76862 ?auto_76860 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_76882 - OBJ
      ?auto_76883 - OBJ
      ?auto_76884 - OBJ
      ?auto_76881 - LOCATION
    )
    :vars
    (
      ?auto_76885 - TRUCK
      ?auto_76886 - LOCATION
      ?auto_76887 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76883 ?auto_76882 ) ) ( not ( = ?auto_76884 ?auto_76882 ) ) ( not ( = ?auto_76884 ?auto_76883 ) ) ( TRUCK-AT ?auto_76885 ?auto_76886 ) ( IN-CITY ?auto_76886 ?auto_76887 ) ( IN-CITY ?auto_76881 ?auto_76887 ) ( not ( = ?auto_76881 ?auto_76886 ) ) ( OBJ-AT ?auto_76882 ?auto_76881 ) ( OBJ-AT ?auto_76884 ?auto_76886 ) ( OBJ-AT ?auto_76883 ?auto_76881 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76882 ?auto_76884 ?auto_76881 )
      ( DELIVER-3PKG-VERIFY ?auto_76882 ?auto_76883 ?auto_76884 ?auto_76881 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_76889 - OBJ
      ?auto_76890 - OBJ
      ?auto_76891 - OBJ
      ?auto_76888 - LOCATION
    )
    :vars
    (
      ?auto_76892 - TRUCK
      ?auto_76893 - LOCATION
      ?auto_76894 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76890 ?auto_76889 ) ) ( not ( = ?auto_76891 ?auto_76889 ) ) ( not ( = ?auto_76891 ?auto_76890 ) ) ( TRUCK-AT ?auto_76892 ?auto_76893 ) ( IN-CITY ?auto_76893 ?auto_76894 ) ( IN-CITY ?auto_76888 ?auto_76894 ) ( not ( = ?auto_76888 ?auto_76893 ) ) ( OBJ-AT ?auto_76889 ?auto_76888 ) ( OBJ-AT ?auto_76891 ?auto_76893 ) ( OBJ-AT ?auto_76890 ?auto_76888 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76889 ?auto_76891 ?auto_76888 )
      ( DELIVER-3PKG-VERIFY ?auto_76889 ?auto_76890 ?auto_76891 ?auto_76888 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_76903 - OBJ
      ?auto_76904 - OBJ
      ?auto_76905 - OBJ
      ?auto_76902 - LOCATION
    )
    :vars
    (
      ?auto_76906 - TRUCK
      ?auto_76907 - LOCATION
      ?auto_76908 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76904 ?auto_76903 ) ) ( not ( = ?auto_76905 ?auto_76903 ) ) ( not ( = ?auto_76905 ?auto_76904 ) ) ( TRUCK-AT ?auto_76906 ?auto_76907 ) ( IN-CITY ?auto_76907 ?auto_76908 ) ( IN-CITY ?auto_76902 ?auto_76908 ) ( not ( = ?auto_76902 ?auto_76907 ) ) ( OBJ-AT ?auto_76903 ?auto_76902 ) ( OBJ-AT ?auto_76904 ?auto_76907 ) ( OBJ-AT ?auto_76905 ?auto_76902 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76903 ?auto_76904 ?auto_76902 )
      ( DELIVER-3PKG-VERIFY ?auto_76903 ?auto_76904 ?auto_76905 ?auto_76902 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_76910 - OBJ
      ?auto_76911 - OBJ
      ?auto_76912 - OBJ
      ?auto_76909 - LOCATION
    )
    :vars
    (
      ?auto_76913 - TRUCK
      ?auto_76914 - LOCATION
      ?auto_76915 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76911 ?auto_76910 ) ) ( not ( = ?auto_76912 ?auto_76910 ) ) ( not ( = ?auto_76912 ?auto_76911 ) ) ( TRUCK-AT ?auto_76913 ?auto_76914 ) ( IN-CITY ?auto_76914 ?auto_76915 ) ( IN-CITY ?auto_76909 ?auto_76915 ) ( not ( = ?auto_76909 ?auto_76914 ) ) ( OBJ-AT ?auto_76910 ?auto_76909 ) ( OBJ-AT ?auto_76911 ?auto_76914 ) ( OBJ-AT ?auto_76912 ?auto_76909 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76910 ?auto_76911 ?auto_76909 )
      ( DELIVER-3PKG-VERIFY ?auto_76910 ?auto_76911 ?auto_76912 ?auto_76909 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_76924 - OBJ
      ?auto_76925 - OBJ
      ?auto_76926 - OBJ
      ?auto_76923 - LOCATION
    )
    :vars
    (
      ?auto_76927 - TRUCK
      ?auto_76928 - LOCATION
      ?auto_76929 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76925 ?auto_76924 ) ) ( not ( = ?auto_76926 ?auto_76924 ) ) ( not ( = ?auto_76926 ?auto_76925 ) ) ( TRUCK-AT ?auto_76927 ?auto_76928 ) ( IN-CITY ?auto_76928 ?auto_76929 ) ( IN-CITY ?auto_76923 ?auto_76929 ) ( not ( = ?auto_76923 ?auto_76928 ) ) ( OBJ-AT ?auto_76925 ?auto_76923 ) ( OBJ-AT ?auto_76926 ?auto_76928 ) ( OBJ-AT ?auto_76924 ?auto_76923 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76925 ?auto_76926 ?auto_76923 )
      ( DELIVER-3PKG-VERIFY ?auto_76924 ?auto_76925 ?auto_76926 ?auto_76923 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_76939 - OBJ
      ?auto_76940 - OBJ
      ?auto_76941 - OBJ
      ?auto_76938 - LOCATION
    )
    :vars
    (
      ?auto_76943 - OBJ
      ?auto_76942 - TRUCK
      ?auto_76944 - LOCATION
      ?auto_76945 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76940 ?auto_76939 ) ) ( not ( = ?auto_76941 ?auto_76939 ) ) ( not ( = ?auto_76941 ?auto_76940 ) ) ( not ( = ?auto_76941 ?auto_76943 ) ) ( TRUCK-AT ?auto_76942 ?auto_76944 ) ( IN-CITY ?auto_76944 ?auto_76945 ) ( IN-CITY ?auto_76938 ?auto_76945 ) ( not ( = ?auto_76938 ?auto_76944 ) ) ( OBJ-AT ?auto_76943 ?auto_76938 ) ( OBJ-AT ?auto_76941 ?auto_76944 ) ( OBJ-AT ?auto_76939 ?auto_76938 ) ( OBJ-AT ?auto_76940 ?auto_76938 ) ( not ( = ?auto_76939 ?auto_76943 ) ) ( not ( = ?auto_76940 ?auto_76943 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76943 ?auto_76941 ?auto_76938 )
      ( DELIVER-3PKG-VERIFY ?auto_76939 ?auto_76940 ?auto_76941 ?auto_76938 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_76947 - OBJ
      ?auto_76948 - OBJ
      ?auto_76949 - OBJ
      ?auto_76946 - LOCATION
    )
    :vars
    (
      ?auto_76950 - TRUCK
      ?auto_76951 - LOCATION
      ?auto_76952 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76948 ?auto_76947 ) ) ( not ( = ?auto_76949 ?auto_76947 ) ) ( not ( = ?auto_76949 ?auto_76948 ) ) ( TRUCK-AT ?auto_76950 ?auto_76951 ) ( IN-CITY ?auto_76951 ?auto_76952 ) ( IN-CITY ?auto_76946 ?auto_76952 ) ( not ( = ?auto_76946 ?auto_76951 ) ) ( OBJ-AT ?auto_76949 ?auto_76946 ) ( OBJ-AT ?auto_76948 ?auto_76951 ) ( OBJ-AT ?auto_76947 ?auto_76946 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76949 ?auto_76948 ?auto_76946 )
      ( DELIVER-3PKG-VERIFY ?auto_76947 ?auto_76948 ?auto_76949 ?auto_76946 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_76962 - OBJ
      ?auto_76963 - OBJ
      ?auto_76964 - OBJ
      ?auto_76961 - LOCATION
    )
    :vars
    (
      ?auto_76966 - OBJ
      ?auto_76965 - TRUCK
      ?auto_76967 - LOCATION
      ?auto_76968 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76963 ?auto_76962 ) ) ( not ( = ?auto_76964 ?auto_76962 ) ) ( not ( = ?auto_76964 ?auto_76963 ) ) ( not ( = ?auto_76963 ?auto_76966 ) ) ( TRUCK-AT ?auto_76965 ?auto_76967 ) ( IN-CITY ?auto_76967 ?auto_76968 ) ( IN-CITY ?auto_76961 ?auto_76968 ) ( not ( = ?auto_76961 ?auto_76967 ) ) ( OBJ-AT ?auto_76966 ?auto_76961 ) ( OBJ-AT ?auto_76963 ?auto_76967 ) ( OBJ-AT ?auto_76962 ?auto_76961 ) ( OBJ-AT ?auto_76964 ?auto_76961 ) ( not ( = ?auto_76962 ?auto_76966 ) ) ( not ( = ?auto_76964 ?auto_76966 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76966 ?auto_76963 ?auto_76961 )
      ( DELIVER-3PKG-VERIFY ?auto_76962 ?auto_76963 ?auto_76964 ?auto_76961 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_76978 - OBJ
      ?auto_76979 - OBJ
      ?auto_76980 - OBJ
      ?auto_76977 - LOCATION
    )
    :vars
    (
      ?auto_76981 - TRUCK
      ?auto_76982 - LOCATION
      ?auto_76983 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76979 ?auto_76978 ) ) ( not ( = ?auto_76980 ?auto_76978 ) ) ( not ( = ?auto_76980 ?auto_76979 ) ) ( TRUCK-AT ?auto_76981 ?auto_76982 ) ( IN-CITY ?auto_76982 ?auto_76983 ) ( IN-CITY ?auto_76977 ?auto_76983 ) ( not ( = ?auto_76977 ?auto_76982 ) ) ( OBJ-AT ?auto_76979 ?auto_76977 ) ( OBJ-AT ?auto_76980 ?auto_76982 ) ( OBJ-AT ?auto_76978 ?auto_76977 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76979 ?auto_76980 ?auto_76977 )
      ( DELIVER-3PKG-VERIFY ?auto_76978 ?auto_76979 ?auto_76980 ?auto_76977 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_76985 - OBJ
      ?auto_76986 - OBJ
      ?auto_76987 - OBJ
      ?auto_76984 - LOCATION
    )
    :vars
    (
      ?auto_76989 - OBJ
      ?auto_76988 - TRUCK
      ?auto_76990 - LOCATION
      ?auto_76991 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_76986 ?auto_76985 ) ) ( not ( = ?auto_76987 ?auto_76985 ) ) ( not ( = ?auto_76987 ?auto_76986 ) ) ( not ( = ?auto_76987 ?auto_76989 ) ) ( TRUCK-AT ?auto_76988 ?auto_76990 ) ( IN-CITY ?auto_76990 ?auto_76991 ) ( IN-CITY ?auto_76984 ?auto_76991 ) ( not ( = ?auto_76984 ?auto_76990 ) ) ( OBJ-AT ?auto_76989 ?auto_76984 ) ( OBJ-AT ?auto_76987 ?auto_76990 ) ( OBJ-AT ?auto_76985 ?auto_76984 ) ( OBJ-AT ?auto_76986 ?auto_76984 ) ( not ( = ?auto_76985 ?auto_76989 ) ) ( not ( = ?auto_76986 ?auto_76989 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76989 ?auto_76987 ?auto_76984 )
      ( DELIVER-3PKG-VERIFY ?auto_76985 ?auto_76986 ?auto_76987 ?auto_76984 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_77001 - OBJ
      ?auto_77002 - OBJ
      ?auto_77003 - OBJ
      ?auto_77000 - LOCATION
    )
    :vars
    (
      ?auto_77004 - TRUCK
      ?auto_77005 - LOCATION
      ?auto_77006 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77002 ?auto_77001 ) ) ( not ( = ?auto_77003 ?auto_77001 ) ) ( not ( = ?auto_77003 ?auto_77002 ) ) ( TRUCK-AT ?auto_77004 ?auto_77005 ) ( IN-CITY ?auto_77005 ?auto_77006 ) ( IN-CITY ?auto_77000 ?auto_77006 ) ( not ( = ?auto_77000 ?auto_77005 ) ) ( OBJ-AT ?auto_77003 ?auto_77000 ) ( OBJ-AT ?auto_77002 ?auto_77005 ) ( OBJ-AT ?auto_77001 ?auto_77000 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77003 ?auto_77002 ?auto_77000 )
      ( DELIVER-3PKG-VERIFY ?auto_77001 ?auto_77002 ?auto_77003 ?auto_77000 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_77008 - OBJ
      ?auto_77009 - OBJ
      ?auto_77010 - OBJ
      ?auto_77007 - LOCATION
    )
    :vars
    (
      ?auto_77012 - OBJ
      ?auto_77011 - TRUCK
      ?auto_77013 - LOCATION
      ?auto_77014 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77009 ?auto_77008 ) ) ( not ( = ?auto_77010 ?auto_77008 ) ) ( not ( = ?auto_77010 ?auto_77009 ) ) ( not ( = ?auto_77009 ?auto_77012 ) ) ( TRUCK-AT ?auto_77011 ?auto_77013 ) ( IN-CITY ?auto_77013 ?auto_77014 ) ( IN-CITY ?auto_77007 ?auto_77014 ) ( not ( = ?auto_77007 ?auto_77013 ) ) ( OBJ-AT ?auto_77012 ?auto_77007 ) ( OBJ-AT ?auto_77009 ?auto_77013 ) ( OBJ-AT ?auto_77008 ?auto_77007 ) ( OBJ-AT ?auto_77010 ?auto_77007 ) ( not ( = ?auto_77008 ?auto_77012 ) ) ( not ( = ?auto_77010 ?auto_77012 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77012 ?auto_77009 ?auto_77007 )
      ( DELIVER-3PKG-VERIFY ?auto_77008 ?auto_77009 ?auto_77010 ?auto_77007 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_77039 - OBJ
      ?auto_77040 - OBJ
      ?auto_77041 - OBJ
      ?auto_77038 - LOCATION
    )
    :vars
    (
      ?auto_77042 - TRUCK
      ?auto_77043 - LOCATION
      ?auto_77044 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77040 ?auto_77039 ) ) ( not ( = ?auto_77041 ?auto_77039 ) ) ( not ( = ?auto_77041 ?auto_77040 ) ) ( TRUCK-AT ?auto_77042 ?auto_77043 ) ( IN-CITY ?auto_77043 ?auto_77044 ) ( IN-CITY ?auto_77038 ?auto_77044 ) ( not ( = ?auto_77038 ?auto_77043 ) ) ( OBJ-AT ?auto_77040 ?auto_77038 ) ( OBJ-AT ?auto_77039 ?auto_77043 ) ( OBJ-AT ?auto_77041 ?auto_77038 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77040 ?auto_77039 ?auto_77038 )
      ( DELIVER-3PKG-VERIFY ?auto_77039 ?auto_77040 ?auto_77041 ?auto_77038 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_77046 - OBJ
      ?auto_77047 - OBJ
      ?auto_77048 - OBJ
      ?auto_77045 - LOCATION
    )
    :vars
    (
      ?auto_77049 - TRUCK
      ?auto_77050 - LOCATION
      ?auto_77051 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77047 ?auto_77046 ) ) ( not ( = ?auto_77048 ?auto_77046 ) ) ( not ( = ?auto_77048 ?auto_77047 ) ) ( TRUCK-AT ?auto_77049 ?auto_77050 ) ( IN-CITY ?auto_77050 ?auto_77051 ) ( IN-CITY ?auto_77045 ?auto_77051 ) ( not ( = ?auto_77045 ?auto_77050 ) ) ( OBJ-AT ?auto_77047 ?auto_77045 ) ( OBJ-AT ?auto_77046 ?auto_77050 ) ( OBJ-AT ?auto_77048 ?auto_77045 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77047 ?auto_77046 ?auto_77045 )
      ( DELIVER-3PKG-VERIFY ?auto_77046 ?auto_77047 ?auto_77048 ?auto_77045 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_77060 - OBJ
      ?auto_77061 - OBJ
      ?auto_77062 - OBJ
      ?auto_77059 - LOCATION
    )
    :vars
    (
      ?auto_77063 - TRUCK
      ?auto_77064 - LOCATION
      ?auto_77065 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77061 ?auto_77060 ) ) ( not ( = ?auto_77062 ?auto_77060 ) ) ( not ( = ?auto_77062 ?auto_77061 ) ) ( TRUCK-AT ?auto_77063 ?auto_77064 ) ( IN-CITY ?auto_77064 ?auto_77065 ) ( IN-CITY ?auto_77059 ?auto_77065 ) ( not ( = ?auto_77059 ?auto_77064 ) ) ( OBJ-AT ?auto_77062 ?auto_77059 ) ( OBJ-AT ?auto_77060 ?auto_77064 ) ( OBJ-AT ?auto_77061 ?auto_77059 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77062 ?auto_77060 ?auto_77059 )
      ( DELIVER-3PKG-VERIFY ?auto_77060 ?auto_77061 ?auto_77062 ?auto_77059 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_77075 - OBJ
      ?auto_77076 - OBJ
      ?auto_77077 - OBJ
      ?auto_77074 - LOCATION
    )
    :vars
    (
      ?auto_77079 - OBJ
      ?auto_77078 - TRUCK
      ?auto_77080 - LOCATION
      ?auto_77081 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77076 ?auto_77075 ) ) ( not ( = ?auto_77077 ?auto_77075 ) ) ( not ( = ?auto_77077 ?auto_77076 ) ) ( not ( = ?auto_77075 ?auto_77079 ) ) ( TRUCK-AT ?auto_77078 ?auto_77080 ) ( IN-CITY ?auto_77080 ?auto_77081 ) ( IN-CITY ?auto_77074 ?auto_77081 ) ( not ( = ?auto_77074 ?auto_77080 ) ) ( OBJ-AT ?auto_77079 ?auto_77074 ) ( OBJ-AT ?auto_77075 ?auto_77080 ) ( OBJ-AT ?auto_77076 ?auto_77074 ) ( OBJ-AT ?auto_77077 ?auto_77074 ) ( not ( = ?auto_77076 ?auto_77079 ) ) ( not ( = ?auto_77077 ?auto_77079 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77079 ?auto_77075 ?auto_77074 )
      ( DELIVER-3PKG-VERIFY ?auto_77075 ?auto_77076 ?auto_77077 ?auto_77074 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_77091 - OBJ
      ?auto_77092 - OBJ
      ?auto_77093 - OBJ
      ?auto_77090 - LOCATION
    )
    :vars
    (
      ?auto_77094 - TRUCK
      ?auto_77095 - LOCATION
      ?auto_77096 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77092 ?auto_77091 ) ) ( not ( = ?auto_77093 ?auto_77091 ) ) ( not ( = ?auto_77093 ?auto_77092 ) ) ( TRUCK-AT ?auto_77094 ?auto_77095 ) ( IN-CITY ?auto_77095 ?auto_77096 ) ( IN-CITY ?auto_77090 ?auto_77096 ) ( not ( = ?auto_77090 ?auto_77095 ) ) ( OBJ-AT ?auto_77093 ?auto_77090 ) ( OBJ-AT ?auto_77091 ?auto_77095 ) ( OBJ-AT ?auto_77092 ?auto_77090 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77093 ?auto_77091 ?auto_77090 )
      ( DELIVER-3PKG-VERIFY ?auto_77091 ?auto_77092 ?auto_77093 ?auto_77090 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_77098 - OBJ
      ?auto_77099 - OBJ
      ?auto_77100 - OBJ
      ?auto_77097 - LOCATION
    )
    :vars
    (
      ?auto_77102 - OBJ
      ?auto_77101 - TRUCK
      ?auto_77103 - LOCATION
      ?auto_77104 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77099 ?auto_77098 ) ) ( not ( = ?auto_77100 ?auto_77098 ) ) ( not ( = ?auto_77100 ?auto_77099 ) ) ( not ( = ?auto_77098 ?auto_77102 ) ) ( TRUCK-AT ?auto_77101 ?auto_77103 ) ( IN-CITY ?auto_77103 ?auto_77104 ) ( IN-CITY ?auto_77097 ?auto_77104 ) ( not ( = ?auto_77097 ?auto_77103 ) ) ( OBJ-AT ?auto_77102 ?auto_77097 ) ( OBJ-AT ?auto_77098 ?auto_77103 ) ( OBJ-AT ?auto_77099 ?auto_77097 ) ( OBJ-AT ?auto_77100 ?auto_77097 ) ( not ( = ?auto_77099 ?auto_77102 ) ) ( not ( = ?auto_77100 ?auto_77102 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77102 ?auto_77098 ?auto_77097 )
      ( DELIVER-3PKG-VERIFY ?auto_77098 ?auto_77099 ?auto_77100 ?auto_77097 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_77225 - OBJ
      ?auto_77226 - OBJ
      ?auto_77227 - OBJ
      ?auto_77228 - OBJ
      ?auto_77224 - LOCATION
    )
    :vars
    (
      ?auto_77229 - TRUCK
      ?auto_77230 - LOCATION
      ?auto_77231 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77226 ?auto_77225 ) ) ( not ( = ?auto_77227 ?auto_77225 ) ) ( not ( = ?auto_77227 ?auto_77226 ) ) ( not ( = ?auto_77228 ?auto_77225 ) ) ( not ( = ?auto_77228 ?auto_77226 ) ) ( not ( = ?auto_77228 ?auto_77227 ) ) ( TRUCK-AT ?auto_77229 ?auto_77230 ) ( IN-CITY ?auto_77230 ?auto_77231 ) ( IN-CITY ?auto_77224 ?auto_77231 ) ( not ( = ?auto_77224 ?auto_77230 ) ) ( OBJ-AT ?auto_77225 ?auto_77224 ) ( OBJ-AT ?auto_77228 ?auto_77230 ) ( OBJ-AT ?auto_77226 ?auto_77224 ) ( OBJ-AT ?auto_77227 ?auto_77224 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77225 ?auto_77228 ?auto_77224 )
      ( DELIVER-4PKG-VERIFY ?auto_77225 ?auto_77226 ?auto_77227 ?auto_77228 ?auto_77224 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_77249 - OBJ
      ?auto_77250 - OBJ
      ?auto_77251 - OBJ
      ?auto_77252 - OBJ
      ?auto_77248 - LOCATION
    )
    :vars
    (
      ?auto_77253 - TRUCK
      ?auto_77254 - LOCATION
      ?auto_77255 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77250 ?auto_77249 ) ) ( not ( = ?auto_77251 ?auto_77249 ) ) ( not ( = ?auto_77251 ?auto_77250 ) ) ( not ( = ?auto_77252 ?auto_77249 ) ) ( not ( = ?auto_77252 ?auto_77250 ) ) ( not ( = ?auto_77252 ?auto_77251 ) ) ( TRUCK-AT ?auto_77253 ?auto_77254 ) ( IN-CITY ?auto_77254 ?auto_77255 ) ( IN-CITY ?auto_77248 ?auto_77255 ) ( not ( = ?auto_77248 ?auto_77254 ) ) ( OBJ-AT ?auto_77249 ?auto_77248 ) ( OBJ-AT ?auto_77251 ?auto_77254 ) ( OBJ-AT ?auto_77250 ?auto_77248 ) ( OBJ-AT ?auto_77252 ?auto_77248 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77249 ?auto_77251 ?auto_77248 )
      ( DELIVER-4PKG-VERIFY ?auto_77249 ?auto_77250 ?auto_77251 ?auto_77252 ?auto_77248 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_77273 - OBJ
      ?auto_77274 - OBJ
      ?auto_77275 - OBJ
      ?auto_77276 - OBJ
      ?auto_77272 - LOCATION
    )
    :vars
    (
      ?auto_77277 - TRUCK
      ?auto_77278 - LOCATION
      ?auto_77279 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77274 ?auto_77273 ) ) ( not ( = ?auto_77275 ?auto_77273 ) ) ( not ( = ?auto_77275 ?auto_77274 ) ) ( not ( = ?auto_77276 ?auto_77273 ) ) ( not ( = ?auto_77276 ?auto_77274 ) ) ( not ( = ?auto_77276 ?auto_77275 ) ) ( TRUCK-AT ?auto_77277 ?auto_77278 ) ( IN-CITY ?auto_77278 ?auto_77279 ) ( IN-CITY ?auto_77272 ?auto_77279 ) ( not ( = ?auto_77272 ?auto_77278 ) ) ( OBJ-AT ?auto_77273 ?auto_77272 ) ( OBJ-AT ?auto_77276 ?auto_77278 ) ( OBJ-AT ?auto_77274 ?auto_77272 ) ( OBJ-AT ?auto_77275 ?auto_77272 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77273 ?auto_77276 ?auto_77272 )
      ( DELIVER-4PKG-VERIFY ?auto_77273 ?auto_77274 ?auto_77275 ?auto_77276 ?auto_77272 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_77297 - OBJ
      ?auto_77298 - OBJ
      ?auto_77299 - OBJ
      ?auto_77300 - OBJ
      ?auto_77296 - LOCATION
    )
    :vars
    (
      ?auto_77301 - TRUCK
      ?auto_77302 - LOCATION
      ?auto_77303 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77298 ?auto_77297 ) ) ( not ( = ?auto_77299 ?auto_77297 ) ) ( not ( = ?auto_77299 ?auto_77298 ) ) ( not ( = ?auto_77300 ?auto_77297 ) ) ( not ( = ?auto_77300 ?auto_77298 ) ) ( not ( = ?auto_77300 ?auto_77299 ) ) ( TRUCK-AT ?auto_77301 ?auto_77302 ) ( IN-CITY ?auto_77302 ?auto_77303 ) ( IN-CITY ?auto_77296 ?auto_77303 ) ( not ( = ?auto_77296 ?auto_77302 ) ) ( OBJ-AT ?auto_77297 ?auto_77296 ) ( OBJ-AT ?auto_77299 ?auto_77302 ) ( OBJ-AT ?auto_77298 ?auto_77296 ) ( OBJ-AT ?auto_77300 ?auto_77296 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77297 ?auto_77299 ?auto_77296 )
      ( DELIVER-4PKG-VERIFY ?auto_77297 ?auto_77298 ?auto_77299 ?auto_77300 ?auto_77296 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_77369 - OBJ
      ?auto_77370 - OBJ
      ?auto_77371 - OBJ
      ?auto_77372 - OBJ
      ?auto_77368 - LOCATION
    )
    :vars
    (
      ?auto_77373 - TRUCK
      ?auto_77374 - LOCATION
      ?auto_77375 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77370 ?auto_77369 ) ) ( not ( = ?auto_77371 ?auto_77369 ) ) ( not ( = ?auto_77371 ?auto_77370 ) ) ( not ( = ?auto_77372 ?auto_77369 ) ) ( not ( = ?auto_77372 ?auto_77370 ) ) ( not ( = ?auto_77372 ?auto_77371 ) ) ( TRUCK-AT ?auto_77373 ?auto_77374 ) ( IN-CITY ?auto_77374 ?auto_77375 ) ( IN-CITY ?auto_77368 ?auto_77375 ) ( not ( = ?auto_77368 ?auto_77374 ) ) ( OBJ-AT ?auto_77369 ?auto_77368 ) ( OBJ-AT ?auto_77370 ?auto_77374 ) ( OBJ-AT ?auto_77371 ?auto_77368 ) ( OBJ-AT ?auto_77372 ?auto_77368 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77369 ?auto_77370 ?auto_77368 )
      ( DELIVER-4PKG-VERIFY ?auto_77369 ?auto_77370 ?auto_77371 ?auto_77372 ?auto_77368 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_77393 - OBJ
      ?auto_77394 - OBJ
      ?auto_77395 - OBJ
      ?auto_77396 - OBJ
      ?auto_77392 - LOCATION
    )
    :vars
    (
      ?auto_77397 - TRUCK
      ?auto_77398 - LOCATION
      ?auto_77399 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77394 ?auto_77393 ) ) ( not ( = ?auto_77395 ?auto_77393 ) ) ( not ( = ?auto_77395 ?auto_77394 ) ) ( not ( = ?auto_77396 ?auto_77393 ) ) ( not ( = ?auto_77396 ?auto_77394 ) ) ( not ( = ?auto_77396 ?auto_77395 ) ) ( TRUCK-AT ?auto_77397 ?auto_77398 ) ( IN-CITY ?auto_77398 ?auto_77399 ) ( IN-CITY ?auto_77392 ?auto_77399 ) ( not ( = ?auto_77392 ?auto_77398 ) ) ( OBJ-AT ?auto_77393 ?auto_77392 ) ( OBJ-AT ?auto_77394 ?auto_77398 ) ( OBJ-AT ?auto_77395 ?auto_77392 ) ( OBJ-AT ?auto_77396 ?auto_77392 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77393 ?auto_77394 ?auto_77392 )
      ( DELIVER-4PKG-VERIFY ?auto_77393 ?auto_77394 ?auto_77395 ?auto_77396 ?auto_77392 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_77465 - OBJ
      ?auto_77466 - OBJ
      ?auto_77467 - OBJ
      ?auto_77468 - OBJ
      ?auto_77464 - LOCATION
    )
    :vars
    (
      ?auto_77469 - TRUCK
      ?auto_77470 - LOCATION
      ?auto_77471 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77466 ?auto_77465 ) ) ( not ( = ?auto_77467 ?auto_77465 ) ) ( not ( = ?auto_77467 ?auto_77466 ) ) ( not ( = ?auto_77468 ?auto_77465 ) ) ( not ( = ?auto_77468 ?auto_77466 ) ) ( not ( = ?auto_77468 ?auto_77467 ) ) ( TRUCK-AT ?auto_77469 ?auto_77470 ) ( IN-CITY ?auto_77470 ?auto_77471 ) ( IN-CITY ?auto_77464 ?auto_77471 ) ( not ( = ?auto_77464 ?auto_77470 ) ) ( OBJ-AT ?auto_77466 ?auto_77464 ) ( OBJ-AT ?auto_77468 ?auto_77470 ) ( OBJ-AT ?auto_77465 ?auto_77464 ) ( OBJ-AT ?auto_77467 ?auto_77464 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77466 ?auto_77468 ?auto_77464 )
      ( DELIVER-4PKG-VERIFY ?auto_77465 ?auto_77466 ?auto_77467 ?auto_77468 ?auto_77464 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_77489 - OBJ
      ?auto_77490 - OBJ
      ?auto_77491 - OBJ
      ?auto_77492 - OBJ
      ?auto_77488 - LOCATION
    )
    :vars
    (
      ?auto_77493 - TRUCK
      ?auto_77494 - LOCATION
      ?auto_77495 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77490 ?auto_77489 ) ) ( not ( = ?auto_77491 ?auto_77489 ) ) ( not ( = ?auto_77491 ?auto_77490 ) ) ( not ( = ?auto_77492 ?auto_77489 ) ) ( not ( = ?auto_77492 ?auto_77490 ) ) ( not ( = ?auto_77492 ?auto_77491 ) ) ( TRUCK-AT ?auto_77493 ?auto_77494 ) ( IN-CITY ?auto_77494 ?auto_77495 ) ( IN-CITY ?auto_77488 ?auto_77495 ) ( not ( = ?auto_77488 ?auto_77494 ) ) ( OBJ-AT ?auto_77490 ?auto_77488 ) ( OBJ-AT ?auto_77491 ?auto_77494 ) ( OBJ-AT ?auto_77489 ?auto_77488 ) ( OBJ-AT ?auto_77492 ?auto_77488 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77490 ?auto_77491 ?auto_77488 )
      ( DELIVER-4PKG-VERIFY ?auto_77489 ?auto_77490 ?auto_77491 ?auto_77492 ?auto_77488 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_77566 - OBJ
      ?auto_77567 - OBJ
      ?auto_77568 - OBJ
      ?auto_77569 - OBJ
      ?auto_77565 - LOCATION
    )
    :vars
    (
      ?auto_77570 - TRUCK
      ?auto_77571 - LOCATION
      ?auto_77572 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77567 ?auto_77566 ) ) ( not ( = ?auto_77568 ?auto_77566 ) ) ( not ( = ?auto_77568 ?auto_77567 ) ) ( not ( = ?auto_77569 ?auto_77566 ) ) ( not ( = ?auto_77569 ?auto_77567 ) ) ( not ( = ?auto_77569 ?auto_77568 ) ) ( TRUCK-AT ?auto_77570 ?auto_77571 ) ( IN-CITY ?auto_77571 ?auto_77572 ) ( IN-CITY ?auto_77565 ?auto_77572 ) ( not ( = ?auto_77565 ?auto_77571 ) ) ( OBJ-AT ?auto_77568 ?auto_77565 ) ( OBJ-AT ?auto_77569 ?auto_77571 ) ( OBJ-AT ?auto_77566 ?auto_77565 ) ( OBJ-AT ?auto_77567 ?auto_77565 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77568 ?auto_77569 ?auto_77565 )
      ( DELIVER-4PKG-VERIFY ?auto_77566 ?auto_77567 ?auto_77568 ?auto_77569 ?auto_77565 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_77592 - OBJ
      ?auto_77593 - OBJ
      ?auto_77594 - OBJ
      ?auto_77595 - OBJ
      ?auto_77591 - LOCATION
    )
    :vars
    (
      ?auto_77596 - TRUCK
      ?auto_77597 - LOCATION
      ?auto_77598 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77593 ?auto_77592 ) ) ( not ( = ?auto_77594 ?auto_77592 ) ) ( not ( = ?auto_77594 ?auto_77593 ) ) ( not ( = ?auto_77595 ?auto_77592 ) ) ( not ( = ?auto_77595 ?auto_77593 ) ) ( not ( = ?auto_77595 ?auto_77594 ) ) ( TRUCK-AT ?auto_77596 ?auto_77597 ) ( IN-CITY ?auto_77597 ?auto_77598 ) ( IN-CITY ?auto_77591 ?auto_77598 ) ( not ( = ?auto_77591 ?auto_77597 ) ) ( OBJ-AT ?auto_77595 ?auto_77591 ) ( OBJ-AT ?auto_77594 ?auto_77597 ) ( OBJ-AT ?auto_77592 ?auto_77591 ) ( OBJ-AT ?auto_77593 ?auto_77591 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77595 ?auto_77594 ?auto_77591 )
      ( DELIVER-4PKG-VERIFY ?auto_77592 ?auto_77593 ?auto_77594 ?auto_77595 ?auto_77591 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_77643 - OBJ
      ?auto_77644 - OBJ
      ?auto_77645 - OBJ
      ?auto_77646 - OBJ
      ?auto_77642 - LOCATION
    )
    :vars
    (
      ?auto_77647 - TRUCK
      ?auto_77648 - LOCATION
      ?auto_77649 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77644 ?auto_77643 ) ) ( not ( = ?auto_77645 ?auto_77643 ) ) ( not ( = ?auto_77645 ?auto_77644 ) ) ( not ( = ?auto_77646 ?auto_77643 ) ) ( not ( = ?auto_77646 ?auto_77644 ) ) ( not ( = ?auto_77646 ?auto_77645 ) ) ( TRUCK-AT ?auto_77647 ?auto_77648 ) ( IN-CITY ?auto_77648 ?auto_77649 ) ( IN-CITY ?auto_77642 ?auto_77649 ) ( not ( = ?auto_77642 ?auto_77648 ) ) ( OBJ-AT ?auto_77645 ?auto_77642 ) ( OBJ-AT ?auto_77644 ?auto_77648 ) ( OBJ-AT ?auto_77643 ?auto_77642 ) ( OBJ-AT ?auto_77646 ?auto_77642 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77645 ?auto_77644 ?auto_77642 )
      ( DELIVER-4PKG-VERIFY ?auto_77643 ?auto_77644 ?auto_77645 ?auto_77646 ?auto_77642 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_77694 - OBJ
      ?auto_77695 - OBJ
      ?auto_77696 - OBJ
      ?auto_77697 - OBJ
      ?auto_77693 - LOCATION
    )
    :vars
    (
      ?auto_77698 - TRUCK
      ?auto_77699 - LOCATION
      ?auto_77700 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77695 ?auto_77694 ) ) ( not ( = ?auto_77696 ?auto_77694 ) ) ( not ( = ?auto_77696 ?auto_77695 ) ) ( not ( = ?auto_77697 ?auto_77694 ) ) ( not ( = ?auto_77697 ?auto_77695 ) ) ( not ( = ?auto_77697 ?auto_77696 ) ) ( TRUCK-AT ?auto_77698 ?auto_77699 ) ( IN-CITY ?auto_77699 ?auto_77700 ) ( IN-CITY ?auto_77693 ?auto_77700 ) ( not ( = ?auto_77693 ?auto_77699 ) ) ( OBJ-AT ?auto_77697 ?auto_77693 ) ( OBJ-AT ?auto_77695 ?auto_77699 ) ( OBJ-AT ?auto_77694 ?auto_77693 ) ( OBJ-AT ?auto_77696 ?auto_77693 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77697 ?auto_77695 ?auto_77693 )
      ( DELIVER-4PKG-VERIFY ?auto_77694 ?auto_77695 ?auto_77696 ?auto_77697 ?auto_77693 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_77772 - OBJ
      ?auto_77773 - OBJ
      ?auto_77774 - OBJ
      ?auto_77775 - OBJ
      ?auto_77771 - LOCATION
    )
    :vars
    (
      ?auto_77776 - TRUCK
      ?auto_77777 - LOCATION
      ?auto_77778 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77773 ?auto_77772 ) ) ( not ( = ?auto_77774 ?auto_77772 ) ) ( not ( = ?auto_77774 ?auto_77773 ) ) ( not ( = ?auto_77775 ?auto_77772 ) ) ( not ( = ?auto_77775 ?auto_77773 ) ) ( not ( = ?auto_77775 ?auto_77774 ) ) ( TRUCK-AT ?auto_77776 ?auto_77777 ) ( IN-CITY ?auto_77777 ?auto_77778 ) ( IN-CITY ?auto_77771 ?auto_77778 ) ( not ( = ?auto_77771 ?auto_77777 ) ) ( OBJ-AT ?auto_77773 ?auto_77771 ) ( OBJ-AT ?auto_77775 ?auto_77777 ) ( OBJ-AT ?auto_77772 ?auto_77771 ) ( OBJ-AT ?auto_77774 ?auto_77771 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77773 ?auto_77775 ?auto_77771 )
      ( DELIVER-4PKG-VERIFY ?auto_77772 ?auto_77773 ?auto_77774 ?auto_77775 ?auto_77771 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_77796 - OBJ
      ?auto_77797 - OBJ
      ?auto_77798 - OBJ
      ?auto_77799 - OBJ
      ?auto_77795 - LOCATION
    )
    :vars
    (
      ?auto_77800 - TRUCK
      ?auto_77801 - LOCATION
      ?auto_77802 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77797 ?auto_77796 ) ) ( not ( = ?auto_77798 ?auto_77796 ) ) ( not ( = ?auto_77798 ?auto_77797 ) ) ( not ( = ?auto_77799 ?auto_77796 ) ) ( not ( = ?auto_77799 ?auto_77797 ) ) ( not ( = ?auto_77799 ?auto_77798 ) ) ( TRUCK-AT ?auto_77800 ?auto_77801 ) ( IN-CITY ?auto_77801 ?auto_77802 ) ( IN-CITY ?auto_77795 ?auto_77802 ) ( not ( = ?auto_77795 ?auto_77801 ) ) ( OBJ-AT ?auto_77797 ?auto_77795 ) ( OBJ-AT ?auto_77798 ?auto_77801 ) ( OBJ-AT ?auto_77796 ?auto_77795 ) ( OBJ-AT ?auto_77799 ?auto_77795 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77797 ?auto_77798 ?auto_77795 )
      ( DELIVER-4PKG-VERIFY ?auto_77796 ?auto_77797 ?auto_77798 ?auto_77799 ?auto_77795 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_77820 - OBJ
      ?auto_77821 - OBJ
      ?auto_77822 - OBJ
      ?auto_77823 - OBJ
      ?auto_77819 - LOCATION
    )
    :vars
    (
      ?auto_77824 - TRUCK
      ?auto_77825 - LOCATION
      ?auto_77826 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77821 ?auto_77820 ) ) ( not ( = ?auto_77822 ?auto_77820 ) ) ( not ( = ?auto_77822 ?auto_77821 ) ) ( not ( = ?auto_77823 ?auto_77820 ) ) ( not ( = ?auto_77823 ?auto_77821 ) ) ( not ( = ?auto_77823 ?auto_77822 ) ) ( TRUCK-AT ?auto_77824 ?auto_77825 ) ( IN-CITY ?auto_77825 ?auto_77826 ) ( IN-CITY ?auto_77819 ?auto_77826 ) ( not ( = ?auto_77819 ?auto_77825 ) ) ( OBJ-AT ?auto_77822 ?auto_77819 ) ( OBJ-AT ?auto_77823 ?auto_77825 ) ( OBJ-AT ?auto_77820 ?auto_77819 ) ( OBJ-AT ?auto_77821 ?auto_77819 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77822 ?auto_77823 ?auto_77819 )
      ( DELIVER-4PKG-VERIFY ?auto_77820 ?auto_77821 ?auto_77822 ?auto_77823 ?auto_77819 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_77846 - OBJ
      ?auto_77847 - OBJ
      ?auto_77848 - OBJ
      ?auto_77849 - OBJ
      ?auto_77845 - LOCATION
    )
    :vars
    (
      ?auto_77850 - TRUCK
      ?auto_77851 - LOCATION
      ?auto_77852 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77847 ?auto_77846 ) ) ( not ( = ?auto_77848 ?auto_77846 ) ) ( not ( = ?auto_77848 ?auto_77847 ) ) ( not ( = ?auto_77849 ?auto_77846 ) ) ( not ( = ?auto_77849 ?auto_77847 ) ) ( not ( = ?auto_77849 ?auto_77848 ) ) ( TRUCK-AT ?auto_77850 ?auto_77851 ) ( IN-CITY ?auto_77851 ?auto_77852 ) ( IN-CITY ?auto_77845 ?auto_77852 ) ( not ( = ?auto_77845 ?auto_77851 ) ) ( OBJ-AT ?auto_77849 ?auto_77845 ) ( OBJ-AT ?auto_77848 ?auto_77851 ) ( OBJ-AT ?auto_77846 ?auto_77845 ) ( OBJ-AT ?auto_77847 ?auto_77845 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77849 ?auto_77848 ?auto_77845 )
      ( DELIVER-4PKG-VERIFY ?auto_77846 ?auto_77847 ?auto_77848 ?auto_77849 ?auto_77845 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_77950 - OBJ
      ?auto_77951 - OBJ
      ?auto_77952 - OBJ
      ?auto_77953 - OBJ
      ?auto_77949 - LOCATION
    )
    :vars
    (
      ?auto_77954 - TRUCK
      ?auto_77955 - LOCATION
      ?auto_77956 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77951 ?auto_77950 ) ) ( not ( = ?auto_77952 ?auto_77950 ) ) ( not ( = ?auto_77952 ?auto_77951 ) ) ( not ( = ?auto_77953 ?auto_77950 ) ) ( not ( = ?auto_77953 ?auto_77951 ) ) ( not ( = ?auto_77953 ?auto_77952 ) ) ( TRUCK-AT ?auto_77954 ?auto_77955 ) ( IN-CITY ?auto_77955 ?auto_77956 ) ( IN-CITY ?auto_77949 ?auto_77956 ) ( not ( = ?auto_77949 ?auto_77955 ) ) ( OBJ-AT ?auto_77952 ?auto_77949 ) ( OBJ-AT ?auto_77951 ?auto_77955 ) ( OBJ-AT ?auto_77950 ?auto_77949 ) ( OBJ-AT ?auto_77953 ?auto_77949 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77952 ?auto_77951 ?auto_77949 )
      ( DELIVER-4PKG-VERIFY ?auto_77950 ?auto_77951 ?auto_77952 ?auto_77953 ?auto_77949 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_77974 - OBJ
      ?auto_77975 - OBJ
      ?auto_77976 - OBJ
      ?auto_77977 - OBJ
      ?auto_77973 - LOCATION
    )
    :vars
    (
      ?auto_77978 - TRUCK
      ?auto_77979 - LOCATION
      ?auto_77980 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_77975 ?auto_77974 ) ) ( not ( = ?auto_77976 ?auto_77974 ) ) ( not ( = ?auto_77976 ?auto_77975 ) ) ( not ( = ?auto_77977 ?auto_77974 ) ) ( not ( = ?auto_77977 ?auto_77975 ) ) ( not ( = ?auto_77977 ?auto_77976 ) ) ( TRUCK-AT ?auto_77978 ?auto_77979 ) ( IN-CITY ?auto_77979 ?auto_77980 ) ( IN-CITY ?auto_77973 ?auto_77980 ) ( not ( = ?auto_77973 ?auto_77979 ) ) ( OBJ-AT ?auto_77977 ?auto_77973 ) ( OBJ-AT ?auto_77975 ?auto_77979 ) ( OBJ-AT ?auto_77974 ?auto_77973 ) ( OBJ-AT ?auto_77976 ?auto_77973 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_77977 ?auto_77975 ?auto_77973 )
      ( DELIVER-4PKG-VERIFY ?auto_77974 ?auto_77975 ?auto_77976 ?auto_77977 ?auto_77973 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_78127 - OBJ
      ?auto_78128 - OBJ
      ?auto_78129 - OBJ
      ?auto_78130 - OBJ
      ?auto_78126 - LOCATION
    )
    :vars
    (
      ?auto_78131 - TRUCK
      ?auto_78132 - LOCATION
      ?auto_78133 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_78128 ?auto_78127 ) ) ( not ( = ?auto_78129 ?auto_78127 ) ) ( not ( = ?auto_78129 ?auto_78128 ) ) ( not ( = ?auto_78130 ?auto_78127 ) ) ( not ( = ?auto_78130 ?auto_78128 ) ) ( not ( = ?auto_78130 ?auto_78129 ) ) ( TRUCK-AT ?auto_78131 ?auto_78132 ) ( IN-CITY ?auto_78132 ?auto_78133 ) ( IN-CITY ?auto_78126 ?auto_78133 ) ( not ( = ?auto_78126 ?auto_78132 ) ) ( OBJ-AT ?auto_78128 ?auto_78126 ) ( OBJ-AT ?auto_78127 ?auto_78132 ) ( OBJ-AT ?auto_78129 ?auto_78126 ) ( OBJ-AT ?auto_78130 ?auto_78126 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78128 ?auto_78127 ?auto_78126 )
      ( DELIVER-4PKG-VERIFY ?auto_78127 ?auto_78128 ?auto_78129 ?auto_78130 ?auto_78126 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_78151 - OBJ
      ?auto_78152 - OBJ
      ?auto_78153 - OBJ
      ?auto_78154 - OBJ
      ?auto_78150 - LOCATION
    )
    :vars
    (
      ?auto_78155 - TRUCK
      ?auto_78156 - LOCATION
      ?auto_78157 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_78152 ?auto_78151 ) ) ( not ( = ?auto_78153 ?auto_78151 ) ) ( not ( = ?auto_78153 ?auto_78152 ) ) ( not ( = ?auto_78154 ?auto_78151 ) ) ( not ( = ?auto_78154 ?auto_78152 ) ) ( not ( = ?auto_78154 ?auto_78153 ) ) ( TRUCK-AT ?auto_78155 ?auto_78156 ) ( IN-CITY ?auto_78156 ?auto_78157 ) ( IN-CITY ?auto_78150 ?auto_78157 ) ( not ( = ?auto_78150 ?auto_78156 ) ) ( OBJ-AT ?auto_78152 ?auto_78150 ) ( OBJ-AT ?auto_78151 ?auto_78156 ) ( OBJ-AT ?auto_78153 ?auto_78150 ) ( OBJ-AT ?auto_78154 ?auto_78150 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78152 ?auto_78151 ?auto_78150 )
      ( DELIVER-4PKG-VERIFY ?auto_78151 ?auto_78152 ?auto_78153 ?auto_78154 ?auto_78150 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_78223 - OBJ
      ?auto_78224 - OBJ
      ?auto_78225 - OBJ
      ?auto_78226 - OBJ
      ?auto_78222 - LOCATION
    )
    :vars
    (
      ?auto_78227 - TRUCK
      ?auto_78228 - LOCATION
      ?auto_78229 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_78224 ?auto_78223 ) ) ( not ( = ?auto_78225 ?auto_78223 ) ) ( not ( = ?auto_78225 ?auto_78224 ) ) ( not ( = ?auto_78226 ?auto_78223 ) ) ( not ( = ?auto_78226 ?auto_78224 ) ) ( not ( = ?auto_78226 ?auto_78225 ) ) ( TRUCK-AT ?auto_78227 ?auto_78228 ) ( IN-CITY ?auto_78228 ?auto_78229 ) ( IN-CITY ?auto_78222 ?auto_78229 ) ( not ( = ?auto_78222 ?auto_78228 ) ) ( OBJ-AT ?auto_78225 ?auto_78222 ) ( OBJ-AT ?auto_78223 ?auto_78228 ) ( OBJ-AT ?auto_78224 ?auto_78222 ) ( OBJ-AT ?auto_78226 ?auto_78222 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78225 ?auto_78223 ?auto_78222 )
      ( DELIVER-4PKG-VERIFY ?auto_78223 ?auto_78224 ?auto_78225 ?auto_78226 ?auto_78222 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_78274 - OBJ
      ?auto_78275 - OBJ
      ?auto_78276 - OBJ
      ?auto_78277 - OBJ
      ?auto_78273 - LOCATION
    )
    :vars
    (
      ?auto_78278 - TRUCK
      ?auto_78279 - LOCATION
      ?auto_78280 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_78275 ?auto_78274 ) ) ( not ( = ?auto_78276 ?auto_78274 ) ) ( not ( = ?auto_78276 ?auto_78275 ) ) ( not ( = ?auto_78277 ?auto_78274 ) ) ( not ( = ?auto_78277 ?auto_78275 ) ) ( not ( = ?auto_78277 ?auto_78276 ) ) ( TRUCK-AT ?auto_78278 ?auto_78279 ) ( IN-CITY ?auto_78279 ?auto_78280 ) ( IN-CITY ?auto_78273 ?auto_78280 ) ( not ( = ?auto_78273 ?auto_78279 ) ) ( OBJ-AT ?auto_78277 ?auto_78273 ) ( OBJ-AT ?auto_78274 ?auto_78279 ) ( OBJ-AT ?auto_78275 ?auto_78273 ) ( OBJ-AT ?auto_78276 ?auto_78273 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78277 ?auto_78274 ?auto_78273 )
      ( DELIVER-4PKG-VERIFY ?auto_78274 ?auto_78275 ?auto_78276 ?auto_78277 ?auto_78273 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_78352 - OBJ
      ?auto_78353 - OBJ
      ?auto_78354 - OBJ
      ?auto_78355 - OBJ
      ?auto_78351 - LOCATION
    )
    :vars
    (
      ?auto_78356 - TRUCK
      ?auto_78357 - LOCATION
      ?auto_78358 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_78353 ?auto_78352 ) ) ( not ( = ?auto_78354 ?auto_78352 ) ) ( not ( = ?auto_78354 ?auto_78353 ) ) ( not ( = ?auto_78355 ?auto_78352 ) ) ( not ( = ?auto_78355 ?auto_78353 ) ) ( not ( = ?auto_78355 ?auto_78354 ) ) ( TRUCK-AT ?auto_78356 ?auto_78357 ) ( IN-CITY ?auto_78357 ?auto_78358 ) ( IN-CITY ?auto_78351 ?auto_78358 ) ( not ( = ?auto_78351 ?auto_78357 ) ) ( OBJ-AT ?auto_78354 ?auto_78351 ) ( OBJ-AT ?auto_78352 ?auto_78357 ) ( OBJ-AT ?auto_78353 ?auto_78351 ) ( OBJ-AT ?auto_78355 ?auto_78351 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78354 ?auto_78352 ?auto_78351 )
      ( DELIVER-4PKG-VERIFY ?auto_78352 ?auto_78353 ?auto_78354 ?auto_78355 ?auto_78351 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_78376 - OBJ
      ?auto_78377 - OBJ
      ?auto_78378 - OBJ
      ?auto_78379 - OBJ
      ?auto_78375 - LOCATION
    )
    :vars
    (
      ?auto_78380 - TRUCK
      ?auto_78381 - LOCATION
      ?auto_78382 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_78377 ?auto_78376 ) ) ( not ( = ?auto_78378 ?auto_78376 ) ) ( not ( = ?auto_78378 ?auto_78377 ) ) ( not ( = ?auto_78379 ?auto_78376 ) ) ( not ( = ?auto_78379 ?auto_78377 ) ) ( not ( = ?auto_78379 ?auto_78378 ) ) ( TRUCK-AT ?auto_78380 ?auto_78381 ) ( IN-CITY ?auto_78381 ?auto_78382 ) ( IN-CITY ?auto_78375 ?auto_78382 ) ( not ( = ?auto_78375 ?auto_78381 ) ) ( OBJ-AT ?auto_78379 ?auto_78375 ) ( OBJ-AT ?auto_78376 ?auto_78381 ) ( OBJ-AT ?auto_78377 ?auto_78375 ) ( OBJ-AT ?auto_78378 ?auto_78375 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78379 ?auto_78376 ?auto_78375 )
      ( DELIVER-4PKG-VERIFY ?auto_78376 ?auto_78377 ?auto_78378 ?auto_78379 ?auto_78375 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_78618 - OBJ
      ?auto_78617 - LOCATION
    )
    :vars
    (
      ?auto_78620 - OBJ
      ?auto_78621 - LOCATION
      ?auto_78622 - CITY
      ?auto_78619 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78618 ?auto_78620 ) ) ( IN-CITY ?auto_78621 ?auto_78622 ) ( IN-CITY ?auto_78617 ?auto_78622 ) ( not ( = ?auto_78617 ?auto_78621 ) ) ( OBJ-AT ?auto_78620 ?auto_78617 ) ( OBJ-AT ?auto_78618 ?auto_78621 ) ( TRUCK-AT ?auto_78619 ?auto_78617 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_78619 ?auto_78617 ?auto_78621 ?auto_78622 )
      ( DELIVER-2PKG ?auto_78620 ?auto_78618 ?auto_78617 )
      ( DELIVER-1PKG-VERIFY ?auto_78618 ?auto_78617 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_78624 - OBJ
      ?auto_78625 - OBJ
      ?auto_78623 - LOCATION
    )
    :vars
    (
      ?auto_78628 - LOCATION
      ?auto_78627 - CITY
      ?auto_78626 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78625 ?auto_78624 ) ) ( IN-CITY ?auto_78628 ?auto_78627 ) ( IN-CITY ?auto_78623 ?auto_78627 ) ( not ( = ?auto_78623 ?auto_78628 ) ) ( OBJ-AT ?auto_78624 ?auto_78623 ) ( OBJ-AT ?auto_78625 ?auto_78628 ) ( TRUCK-AT ?auto_78626 ?auto_78623 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_78625 ?auto_78623 )
      ( DELIVER-2PKG-VERIFY ?auto_78624 ?auto_78625 ?auto_78623 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_78630 - OBJ
      ?auto_78631 - OBJ
      ?auto_78629 - LOCATION
    )
    :vars
    (
      ?auto_78634 - OBJ
      ?auto_78635 - LOCATION
      ?auto_78632 - CITY
      ?auto_78633 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78631 ?auto_78630 ) ) ( not ( = ?auto_78631 ?auto_78634 ) ) ( IN-CITY ?auto_78635 ?auto_78632 ) ( IN-CITY ?auto_78629 ?auto_78632 ) ( not ( = ?auto_78629 ?auto_78635 ) ) ( OBJ-AT ?auto_78634 ?auto_78629 ) ( OBJ-AT ?auto_78631 ?auto_78635 ) ( TRUCK-AT ?auto_78633 ?auto_78629 ) ( OBJ-AT ?auto_78630 ?auto_78629 ) ( not ( = ?auto_78630 ?auto_78634 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78634 ?auto_78631 ?auto_78629 )
      ( DELIVER-2PKG-VERIFY ?auto_78630 ?auto_78631 ?auto_78629 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_78637 - OBJ
      ?auto_78638 - OBJ
      ?auto_78636 - LOCATION
    )
    :vars
    (
      ?auto_78641 - OBJ
      ?auto_78642 - LOCATION
      ?auto_78639 - CITY
      ?auto_78640 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78638 ?auto_78637 ) ) ( not ( = ?auto_78638 ?auto_78641 ) ) ( IN-CITY ?auto_78642 ?auto_78639 ) ( IN-CITY ?auto_78636 ?auto_78639 ) ( not ( = ?auto_78636 ?auto_78642 ) ) ( OBJ-AT ?auto_78641 ?auto_78636 ) ( OBJ-AT ?auto_78638 ?auto_78642 ) ( TRUCK-AT ?auto_78640 ?auto_78636 ) ( OBJ-AT ?auto_78637 ?auto_78636 ) ( not ( = ?auto_78637 ?auto_78641 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78641 ?auto_78638 ?auto_78636 )
      ( DELIVER-2PKG-VERIFY ?auto_78637 ?auto_78638 ?auto_78636 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_78644 - OBJ
      ?auto_78645 - OBJ
      ?auto_78643 - LOCATION
    )
    :vars
    (
      ?auto_78648 - LOCATION
      ?auto_78646 - CITY
      ?auto_78647 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78645 ?auto_78644 ) ) ( IN-CITY ?auto_78648 ?auto_78646 ) ( IN-CITY ?auto_78643 ?auto_78646 ) ( not ( = ?auto_78643 ?auto_78648 ) ) ( OBJ-AT ?auto_78645 ?auto_78643 ) ( OBJ-AT ?auto_78644 ?auto_78648 ) ( TRUCK-AT ?auto_78647 ?auto_78643 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78645 ?auto_78644 ?auto_78643 )
      ( DELIVER-2PKG-VERIFY ?auto_78644 ?auto_78645 ?auto_78643 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_78650 - OBJ
      ?auto_78651 - OBJ
      ?auto_78649 - LOCATION
    )
    :vars
    (
      ?auto_78654 - OBJ
      ?auto_78655 - LOCATION
      ?auto_78652 - CITY
      ?auto_78653 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78651 ?auto_78650 ) ) ( not ( = ?auto_78650 ?auto_78654 ) ) ( IN-CITY ?auto_78655 ?auto_78652 ) ( IN-CITY ?auto_78649 ?auto_78652 ) ( not ( = ?auto_78649 ?auto_78655 ) ) ( OBJ-AT ?auto_78654 ?auto_78649 ) ( OBJ-AT ?auto_78650 ?auto_78655 ) ( TRUCK-AT ?auto_78653 ?auto_78649 ) ( OBJ-AT ?auto_78651 ?auto_78649 ) ( not ( = ?auto_78651 ?auto_78654 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78654 ?auto_78650 ?auto_78649 )
      ( DELIVER-2PKG-VERIFY ?auto_78650 ?auto_78651 ?auto_78649 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_78657 - OBJ
      ?auto_78658 - OBJ
      ?auto_78656 - LOCATION
    )
    :vars
    (
      ?auto_78661 - OBJ
      ?auto_78662 - LOCATION
      ?auto_78659 - CITY
      ?auto_78660 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78658 ?auto_78657 ) ) ( not ( = ?auto_78657 ?auto_78661 ) ) ( IN-CITY ?auto_78662 ?auto_78659 ) ( IN-CITY ?auto_78656 ?auto_78659 ) ( not ( = ?auto_78656 ?auto_78662 ) ) ( OBJ-AT ?auto_78661 ?auto_78656 ) ( OBJ-AT ?auto_78657 ?auto_78662 ) ( TRUCK-AT ?auto_78660 ?auto_78656 ) ( OBJ-AT ?auto_78658 ?auto_78656 ) ( not ( = ?auto_78658 ?auto_78661 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78661 ?auto_78657 ?auto_78656 )
      ( DELIVER-2PKG-VERIFY ?auto_78657 ?auto_78658 ?auto_78656 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_78678 - OBJ
      ?auto_78679 - OBJ
      ?auto_78680 - OBJ
      ?auto_78677 - LOCATION
    )
    :vars
    (
      ?auto_78683 - LOCATION
      ?auto_78681 - CITY
      ?auto_78682 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78679 ?auto_78678 ) ) ( not ( = ?auto_78680 ?auto_78678 ) ) ( not ( = ?auto_78680 ?auto_78679 ) ) ( IN-CITY ?auto_78683 ?auto_78681 ) ( IN-CITY ?auto_78677 ?auto_78681 ) ( not ( = ?auto_78677 ?auto_78683 ) ) ( OBJ-AT ?auto_78678 ?auto_78677 ) ( OBJ-AT ?auto_78680 ?auto_78683 ) ( TRUCK-AT ?auto_78682 ?auto_78677 ) ( OBJ-AT ?auto_78679 ?auto_78677 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78678 ?auto_78680 ?auto_78677 )
      ( DELIVER-3PKG-VERIFY ?auto_78678 ?auto_78679 ?auto_78680 ?auto_78677 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_78685 - OBJ
      ?auto_78686 - OBJ
      ?auto_78687 - OBJ
      ?auto_78684 - LOCATION
    )
    :vars
    (
      ?auto_78690 - LOCATION
      ?auto_78688 - CITY
      ?auto_78689 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78686 ?auto_78685 ) ) ( not ( = ?auto_78687 ?auto_78685 ) ) ( not ( = ?auto_78687 ?auto_78686 ) ) ( IN-CITY ?auto_78690 ?auto_78688 ) ( IN-CITY ?auto_78684 ?auto_78688 ) ( not ( = ?auto_78684 ?auto_78690 ) ) ( OBJ-AT ?auto_78685 ?auto_78684 ) ( OBJ-AT ?auto_78687 ?auto_78690 ) ( TRUCK-AT ?auto_78689 ?auto_78684 ) ( OBJ-AT ?auto_78686 ?auto_78684 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78685 ?auto_78687 ?auto_78684 )
      ( DELIVER-3PKG-VERIFY ?auto_78685 ?auto_78686 ?auto_78687 ?auto_78684 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_78699 - OBJ
      ?auto_78700 - OBJ
      ?auto_78701 - OBJ
      ?auto_78698 - LOCATION
    )
    :vars
    (
      ?auto_78704 - LOCATION
      ?auto_78702 - CITY
      ?auto_78703 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78700 ?auto_78699 ) ) ( not ( = ?auto_78701 ?auto_78699 ) ) ( not ( = ?auto_78701 ?auto_78700 ) ) ( IN-CITY ?auto_78704 ?auto_78702 ) ( IN-CITY ?auto_78698 ?auto_78702 ) ( not ( = ?auto_78698 ?auto_78704 ) ) ( OBJ-AT ?auto_78699 ?auto_78698 ) ( OBJ-AT ?auto_78700 ?auto_78704 ) ( TRUCK-AT ?auto_78703 ?auto_78698 ) ( OBJ-AT ?auto_78701 ?auto_78698 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78699 ?auto_78700 ?auto_78698 )
      ( DELIVER-3PKG-VERIFY ?auto_78699 ?auto_78700 ?auto_78701 ?auto_78698 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_78706 - OBJ
      ?auto_78707 - OBJ
      ?auto_78708 - OBJ
      ?auto_78705 - LOCATION
    )
    :vars
    (
      ?auto_78711 - LOCATION
      ?auto_78709 - CITY
      ?auto_78710 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78707 ?auto_78706 ) ) ( not ( = ?auto_78708 ?auto_78706 ) ) ( not ( = ?auto_78708 ?auto_78707 ) ) ( IN-CITY ?auto_78711 ?auto_78709 ) ( IN-CITY ?auto_78705 ?auto_78709 ) ( not ( = ?auto_78705 ?auto_78711 ) ) ( OBJ-AT ?auto_78706 ?auto_78705 ) ( OBJ-AT ?auto_78707 ?auto_78711 ) ( TRUCK-AT ?auto_78710 ?auto_78705 ) ( OBJ-AT ?auto_78708 ?auto_78705 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78706 ?auto_78707 ?auto_78705 )
      ( DELIVER-3PKG-VERIFY ?auto_78706 ?auto_78707 ?auto_78708 ?auto_78705 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_78720 - OBJ
      ?auto_78721 - OBJ
      ?auto_78722 - OBJ
      ?auto_78719 - LOCATION
    )
    :vars
    (
      ?auto_78725 - LOCATION
      ?auto_78723 - CITY
      ?auto_78724 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78721 ?auto_78720 ) ) ( not ( = ?auto_78722 ?auto_78720 ) ) ( not ( = ?auto_78722 ?auto_78721 ) ) ( IN-CITY ?auto_78725 ?auto_78723 ) ( IN-CITY ?auto_78719 ?auto_78723 ) ( not ( = ?auto_78719 ?auto_78725 ) ) ( OBJ-AT ?auto_78721 ?auto_78719 ) ( OBJ-AT ?auto_78722 ?auto_78725 ) ( TRUCK-AT ?auto_78724 ?auto_78719 ) ( OBJ-AT ?auto_78720 ?auto_78719 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78721 ?auto_78722 ?auto_78719 )
      ( DELIVER-3PKG-VERIFY ?auto_78720 ?auto_78721 ?auto_78722 ?auto_78719 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_78735 - OBJ
      ?auto_78736 - OBJ
      ?auto_78737 - OBJ
      ?auto_78734 - LOCATION
    )
    :vars
    (
      ?auto_78740 - OBJ
      ?auto_78741 - LOCATION
      ?auto_78738 - CITY
      ?auto_78739 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78736 ?auto_78735 ) ) ( not ( = ?auto_78737 ?auto_78735 ) ) ( not ( = ?auto_78737 ?auto_78736 ) ) ( not ( = ?auto_78737 ?auto_78740 ) ) ( IN-CITY ?auto_78741 ?auto_78738 ) ( IN-CITY ?auto_78734 ?auto_78738 ) ( not ( = ?auto_78734 ?auto_78741 ) ) ( OBJ-AT ?auto_78740 ?auto_78734 ) ( OBJ-AT ?auto_78737 ?auto_78741 ) ( TRUCK-AT ?auto_78739 ?auto_78734 ) ( OBJ-AT ?auto_78735 ?auto_78734 ) ( OBJ-AT ?auto_78736 ?auto_78734 ) ( not ( = ?auto_78735 ?auto_78740 ) ) ( not ( = ?auto_78736 ?auto_78740 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78740 ?auto_78737 ?auto_78734 )
      ( DELIVER-3PKG-VERIFY ?auto_78735 ?auto_78736 ?auto_78737 ?auto_78734 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_78743 - OBJ
      ?auto_78744 - OBJ
      ?auto_78745 - OBJ
      ?auto_78742 - LOCATION
    )
    :vars
    (
      ?auto_78748 - LOCATION
      ?auto_78746 - CITY
      ?auto_78747 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78744 ?auto_78743 ) ) ( not ( = ?auto_78745 ?auto_78743 ) ) ( not ( = ?auto_78745 ?auto_78744 ) ) ( IN-CITY ?auto_78748 ?auto_78746 ) ( IN-CITY ?auto_78742 ?auto_78746 ) ( not ( = ?auto_78742 ?auto_78748 ) ) ( OBJ-AT ?auto_78745 ?auto_78742 ) ( OBJ-AT ?auto_78744 ?auto_78748 ) ( TRUCK-AT ?auto_78747 ?auto_78742 ) ( OBJ-AT ?auto_78743 ?auto_78742 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78745 ?auto_78744 ?auto_78742 )
      ( DELIVER-3PKG-VERIFY ?auto_78743 ?auto_78744 ?auto_78745 ?auto_78742 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_78758 - OBJ
      ?auto_78759 - OBJ
      ?auto_78760 - OBJ
      ?auto_78757 - LOCATION
    )
    :vars
    (
      ?auto_78763 - OBJ
      ?auto_78764 - LOCATION
      ?auto_78761 - CITY
      ?auto_78762 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78759 ?auto_78758 ) ) ( not ( = ?auto_78760 ?auto_78758 ) ) ( not ( = ?auto_78760 ?auto_78759 ) ) ( not ( = ?auto_78759 ?auto_78763 ) ) ( IN-CITY ?auto_78764 ?auto_78761 ) ( IN-CITY ?auto_78757 ?auto_78761 ) ( not ( = ?auto_78757 ?auto_78764 ) ) ( OBJ-AT ?auto_78763 ?auto_78757 ) ( OBJ-AT ?auto_78759 ?auto_78764 ) ( TRUCK-AT ?auto_78762 ?auto_78757 ) ( OBJ-AT ?auto_78758 ?auto_78757 ) ( OBJ-AT ?auto_78760 ?auto_78757 ) ( not ( = ?auto_78758 ?auto_78763 ) ) ( not ( = ?auto_78760 ?auto_78763 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78763 ?auto_78759 ?auto_78757 )
      ( DELIVER-3PKG-VERIFY ?auto_78758 ?auto_78759 ?auto_78760 ?auto_78757 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_78774 - OBJ
      ?auto_78775 - OBJ
      ?auto_78776 - OBJ
      ?auto_78773 - LOCATION
    )
    :vars
    (
      ?auto_78779 - LOCATION
      ?auto_78777 - CITY
      ?auto_78778 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78775 ?auto_78774 ) ) ( not ( = ?auto_78776 ?auto_78774 ) ) ( not ( = ?auto_78776 ?auto_78775 ) ) ( IN-CITY ?auto_78779 ?auto_78777 ) ( IN-CITY ?auto_78773 ?auto_78777 ) ( not ( = ?auto_78773 ?auto_78779 ) ) ( OBJ-AT ?auto_78775 ?auto_78773 ) ( OBJ-AT ?auto_78776 ?auto_78779 ) ( TRUCK-AT ?auto_78778 ?auto_78773 ) ( OBJ-AT ?auto_78774 ?auto_78773 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78775 ?auto_78776 ?auto_78773 )
      ( DELIVER-3PKG-VERIFY ?auto_78774 ?auto_78775 ?auto_78776 ?auto_78773 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_78781 - OBJ
      ?auto_78782 - OBJ
      ?auto_78783 - OBJ
      ?auto_78780 - LOCATION
    )
    :vars
    (
      ?auto_78786 - OBJ
      ?auto_78787 - LOCATION
      ?auto_78784 - CITY
      ?auto_78785 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78782 ?auto_78781 ) ) ( not ( = ?auto_78783 ?auto_78781 ) ) ( not ( = ?auto_78783 ?auto_78782 ) ) ( not ( = ?auto_78783 ?auto_78786 ) ) ( IN-CITY ?auto_78787 ?auto_78784 ) ( IN-CITY ?auto_78780 ?auto_78784 ) ( not ( = ?auto_78780 ?auto_78787 ) ) ( OBJ-AT ?auto_78786 ?auto_78780 ) ( OBJ-AT ?auto_78783 ?auto_78787 ) ( TRUCK-AT ?auto_78785 ?auto_78780 ) ( OBJ-AT ?auto_78781 ?auto_78780 ) ( OBJ-AT ?auto_78782 ?auto_78780 ) ( not ( = ?auto_78781 ?auto_78786 ) ) ( not ( = ?auto_78782 ?auto_78786 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78786 ?auto_78783 ?auto_78780 )
      ( DELIVER-3PKG-VERIFY ?auto_78781 ?auto_78782 ?auto_78783 ?auto_78780 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_78797 - OBJ
      ?auto_78798 - OBJ
      ?auto_78799 - OBJ
      ?auto_78796 - LOCATION
    )
    :vars
    (
      ?auto_78802 - LOCATION
      ?auto_78800 - CITY
      ?auto_78801 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78798 ?auto_78797 ) ) ( not ( = ?auto_78799 ?auto_78797 ) ) ( not ( = ?auto_78799 ?auto_78798 ) ) ( IN-CITY ?auto_78802 ?auto_78800 ) ( IN-CITY ?auto_78796 ?auto_78800 ) ( not ( = ?auto_78796 ?auto_78802 ) ) ( OBJ-AT ?auto_78799 ?auto_78796 ) ( OBJ-AT ?auto_78798 ?auto_78802 ) ( TRUCK-AT ?auto_78801 ?auto_78796 ) ( OBJ-AT ?auto_78797 ?auto_78796 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78799 ?auto_78798 ?auto_78796 )
      ( DELIVER-3PKG-VERIFY ?auto_78797 ?auto_78798 ?auto_78799 ?auto_78796 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_78804 - OBJ
      ?auto_78805 - OBJ
      ?auto_78806 - OBJ
      ?auto_78803 - LOCATION
    )
    :vars
    (
      ?auto_78809 - OBJ
      ?auto_78810 - LOCATION
      ?auto_78807 - CITY
      ?auto_78808 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78805 ?auto_78804 ) ) ( not ( = ?auto_78806 ?auto_78804 ) ) ( not ( = ?auto_78806 ?auto_78805 ) ) ( not ( = ?auto_78805 ?auto_78809 ) ) ( IN-CITY ?auto_78810 ?auto_78807 ) ( IN-CITY ?auto_78803 ?auto_78807 ) ( not ( = ?auto_78803 ?auto_78810 ) ) ( OBJ-AT ?auto_78809 ?auto_78803 ) ( OBJ-AT ?auto_78805 ?auto_78810 ) ( TRUCK-AT ?auto_78808 ?auto_78803 ) ( OBJ-AT ?auto_78804 ?auto_78803 ) ( OBJ-AT ?auto_78806 ?auto_78803 ) ( not ( = ?auto_78804 ?auto_78809 ) ) ( not ( = ?auto_78806 ?auto_78809 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78809 ?auto_78805 ?auto_78803 )
      ( DELIVER-3PKG-VERIFY ?auto_78804 ?auto_78805 ?auto_78806 ?auto_78803 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_78835 - OBJ
      ?auto_78836 - OBJ
      ?auto_78837 - OBJ
      ?auto_78834 - LOCATION
    )
    :vars
    (
      ?auto_78840 - LOCATION
      ?auto_78838 - CITY
      ?auto_78839 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78836 ?auto_78835 ) ) ( not ( = ?auto_78837 ?auto_78835 ) ) ( not ( = ?auto_78837 ?auto_78836 ) ) ( IN-CITY ?auto_78840 ?auto_78838 ) ( IN-CITY ?auto_78834 ?auto_78838 ) ( not ( = ?auto_78834 ?auto_78840 ) ) ( OBJ-AT ?auto_78836 ?auto_78834 ) ( OBJ-AT ?auto_78835 ?auto_78840 ) ( TRUCK-AT ?auto_78839 ?auto_78834 ) ( OBJ-AT ?auto_78837 ?auto_78834 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78836 ?auto_78835 ?auto_78834 )
      ( DELIVER-3PKG-VERIFY ?auto_78835 ?auto_78836 ?auto_78837 ?auto_78834 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_78842 - OBJ
      ?auto_78843 - OBJ
      ?auto_78844 - OBJ
      ?auto_78841 - LOCATION
    )
    :vars
    (
      ?auto_78847 - LOCATION
      ?auto_78845 - CITY
      ?auto_78846 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78843 ?auto_78842 ) ) ( not ( = ?auto_78844 ?auto_78842 ) ) ( not ( = ?auto_78844 ?auto_78843 ) ) ( IN-CITY ?auto_78847 ?auto_78845 ) ( IN-CITY ?auto_78841 ?auto_78845 ) ( not ( = ?auto_78841 ?auto_78847 ) ) ( OBJ-AT ?auto_78843 ?auto_78841 ) ( OBJ-AT ?auto_78842 ?auto_78847 ) ( TRUCK-AT ?auto_78846 ?auto_78841 ) ( OBJ-AT ?auto_78844 ?auto_78841 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78843 ?auto_78842 ?auto_78841 )
      ( DELIVER-3PKG-VERIFY ?auto_78842 ?auto_78843 ?auto_78844 ?auto_78841 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_78856 - OBJ
      ?auto_78857 - OBJ
      ?auto_78858 - OBJ
      ?auto_78855 - LOCATION
    )
    :vars
    (
      ?auto_78861 - LOCATION
      ?auto_78859 - CITY
      ?auto_78860 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78857 ?auto_78856 ) ) ( not ( = ?auto_78858 ?auto_78856 ) ) ( not ( = ?auto_78858 ?auto_78857 ) ) ( IN-CITY ?auto_78861 ?auto_78859 ) ( IN-CITY ?auto_78855 ?auto_78859 ) ( not ( = ?auto_78855 ?auto_78861 ) ) ( OBJ-AT ?auto_78858 ?auto_78855 ) ( OBJ-AT ?auto_78856 ?auto_78861 ) ( TRUCK-AT ?auto_78860 ?auto_78855 ) ( OBJ-AT ?auto_78857 ?auto_78855 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78858 ?auto_78856 ?auto_78855 )
      ( DELIVER-3PKG-VERIFY ?auto_78856 ?auto_78857 ?auto_78858 ?auto_78855 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_78871 - OBJ
      ?auto_78872 - OBJ
      ?auto_78873 - OBJ
      ?auto_78870 - LOCATION
    )
    :vars
    (
      ?auto_78876 - OBJ
      ?auto_78877 - LOCATION
      ?auto_78874 - CITY
      ?auto_78875 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78872 ?auto_78871 ) ) ( not ( = ?auto_78873 ?auto_78871 ) ) ( not ( = ?auto_78873 ?auto_78872 ) ) ( not ( = ?auto_78871 ?auto_78876 ) ) ( IN-CITY ?auto_78877 ?auto_78874 ) ( IN-CITY ?auto_78870 ?auto_78874 ) ( not ( = ?auto_78870 ?auto_78877 ) ) ( OBJ-AT ?auto_78876 ?auto_78870 ) ( OBJ-AT ?auto_78871 ?auto_78877 ) ( TRUCK-AT ?auto_78875 ?auto_78870 ) ( OBJ-AT ?auto_78872 ?auto_78870 ) ( OBJ-AT ?auto_78873 ?auto_78870 ) ( not ( = ?auto_78872 ?auto_78876 ) ) ( not ( = ?auto_78873 ?auto_78876 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78876 ?auto_78871 ?auto_78870 )
      ( DELIVER-3PKG-VERIFY ?auto_78871 ?auto_78872 ?auto_78873 ?auto_78870 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_78887 - OBJ
      ?auto_78888 - OBJ
      ?auto_78889 - OBJ
      ?auto_78886 - LOCATION
    )
    :vars
    (
      ?auto_78892 - LOCATION
      ?auto_78890 - CITY
      ?auto_78891 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78888 ?auto_78887 ) ) ( not ( = ?auto_78889 ?auto_78887 ) ) ( not ( = ?auto_78889 ?auto_78888 ) ) ( IN-CITY ?auto_78892 ?auto_78890 ) ( IN-CITY ?auto_78886 ?auto_78890 ) ( not ( = ?auto_78886 ?auto_78892 ) ) ( OBJ-AT ?auto_78889 ?auto_78886 ) ( OBJ-AT ?auto_78887 ?auto_78892 ) ( TRUCK-AT ?auto_78891 ?auto_78886 ) ( OBJ-AT ?auto_78888 ?auto_78886 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78889 ?auto_78887 ?auto_78886 )
      ( DELIVER-3PKG-VERIFY ?auto_78887 ?auto_78888 ?auto_78889 ?auto_78886 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_78894 - OBJ
      ?auto_78895 - OBJ
      ?auto_78896 - OBJ
      ?auto_78893 - LOCATION
    )
    :vars
    (
      ?auto_78899 - OBJ
      ?auto_78900 - LOCATION
      ?auto_78897 - CITY
      ?auto_78898 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_78895 ?auto_78894 ) ) ( not ( = ?auto_78896 ?auto_78894 ) ) ( not ( = ?auto_78896 ?auto_78895 ) ) ( not ( = ?auto_78894 ?auto_78899 ) ) ( IN-CITY ?auto_78900 ?auto_78897 ) ( IN-CITY ?auto_78893 ?auto_78897 ) ( not ( = ?auto_78893 ?auto_78900 ) ) ( OBJ-AT ?auto_78899 ?auto_78893 ) ( OBJ-AT ?auto_78894 ?auto_78900 ) ( TRUCK-AT ?auto_78898 ?auto_78893 ) ( OBJ-AT ?auto_78895 ?auto_78893 ) ( OBJ-AT ?auto_78896 ?auto_78893 ) ( not ( = ?auto_78895 ?auto_78899 ) ) ( not ( = ?auto_78896 ?auto_78899 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_78899 ?auto_78894 ?auto_78893 )
      ( DELIVER-3PKG-VERIFY ?auto_78894 ?auto_78895 ?auto_78896 ?auto_78893 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_79021 - OBJ
      ?auto_79022 - OBJ
      ?auto_79023 - OBJ
      ?auto_79024 - OBJ
      ?auto_79020 - LOCATION
    )
    :vars
    (
      ?auto_79027 - LOCATION
      ?auto_79025 - CITY
      ?auto_79026 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_79022 ?auto_79021 ) ) ( not ( = ?auto_79023 ?auto_79021 ) ) ( not ( = ?auto_79023 ?auto_79022 ) ) ( not ( = ?auto_79024 ?auto_79021 ) ) ( not ( = ?auto_79024 ?auto_79022 ) ) ( not ( = ?auto_79024 ?auto_79023 ) ) ( IN-CITY ?auto_79027 ?auto_79025 ) ( IN-CITY ?auto_79020 ?auto_79025 ) ( not ( = ?auto_79020 ?auto_79027 ) ) ( OBJ-AT ?auto_79021 ?auto_79020 ) ( OBJ-AT ?auto_79024 ?auto_79027 ) ( TRUCK-AT ?auto_79026 ?auto_79020 ) ( OBJ-AT ?auto_79022 ?auto_79020 ) ( OBJ-AT ?auto_79023 ?auto_79020 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_79021 ?auto_79024 ?auto_79020 )
      ( DELIVER-4PKG-VERIFY ?auto_79021 ?auto_79022 ?auto_79023 ?auto_79024 ?auto_79020 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_79045 - OBJ
      ?auto_79046 - OBJ
      ?auto_79047 - OBJ
      ?auto_79048 - OBJ
      ?auto_79044 - LOCATION
    )
    :vars
    (
      ?auto_79051 - LOCATION
      ?auto_79049 - CITY
      ?auto_79050 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_79046 ?auto_79045 ) ) ( not ( = ?auto_79047 ?auto_79045 ) ) ( not ( = ?auto_79047 ?auto_79046 ) ) ( not ( = ?auto_79048 ?auto_79045 ) ) ( not ( = ?auto_79048 ?auto_79046 ) ) ( not ( = ?auto_79048 ?auto_79047 ) ) ( IN-CITY ?auto_79051 ?auto_79049 ) ( IN-CITY ?auto_79044 ?auto_79049 ) ( not ( = ?auto_79044 ?auto_79051 ) ) ( OBJ-AT ?auto_79045 ?auto_79044 ) ( OBJ-AT ?auto_79047 ?auto_79051 ) ( TRUCK-AT ?auto_79050 ?auto_79044 ) ( OBJ-AT ?auto_79046 ?auto_79044 ) ( OBJ-AT ?auto_79048 ?auto_79044 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_79045 ?auto_79047 ?auto_79044 )
      ( DELIVER-4PKG-VERIFY ?auto_79045 ?auto_79046 ?auto_79047 ?auto_79048 ?auto_79044 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_79069 - OBJ
      ?auto_79070 - OBJ
      ?auto_79071 - OBJ
      ?auto_79072 - OBJ
      ?auto_79068 - LOCATION
    )
    :vars
    (
      ?auto_79075 - LOCATION
      ?auto_79073 - CITY
      ?auto_79074 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_79070 ?auto_79069 ) ) ( not ( = ?auto_79071 ?auto_79069 ) ) ( not ( = ?auto_79071 ?auto_79070 ) ) ( not ( = ?auto_79072 ?auto_79069 ) ) ( not ( = ?auto_79072 ?auto_79070 ) ) ( not ( = ?auto_79072 ?auto_79071 ) ) ( IN-CITY ?auto_79075 ?auto_79073 ) ( IN-CITY ?auto_79068 ?auto_79073 ) ( not ( = ?auto_79068 ?auto_79075 ) ) ( OBJ-AT ?auto_79069 ?auto_79068 ) ( OBJ-AT ?auto_79072 ?auto_79075 ) ( TRUCK-AT ?auto_79074 ?auto_79068 ) ( OBJ-AT ?auto_79070 ?auto_79068 ) ( OBJ-AT ?auto_79071 ?auto_79068 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_79069 ?auto_79072 ?auto_79068 )
      ( DELIVER-4PKG-VERIFY ?auto_79069 ?auto_79070 ?auto_79071 ?auto_79072 ?auto_79068 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_79093 - OBJ
      ?auto_79094 - OBJ
      ?auto_79095 - OBJ
      ?auto_79096 - OBJ
      ?auto_79092 - LOCATION
    )
    :vars
    (
      ?auto_79099 - LOCATION
      ?auto_79097 - CITY
      ?auto_79098 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_79094 ?auto_79093 ) ) ( not ( = ?auto_79095 ?auto_79093 ) ) ( not ( = ?auto_79095 ?auto_79094 ) ) ( not ( = ?auto_79096 ?auto_79093 ) ) ( not ( = ?auto_79096 ?auto_79094 ) ) ( not ( = ?auto_79096 ?auto_79095 ) ) ( IN-CITY ?auto_79099 ?auto_79097 ) ( IN-CITY ?auto_79092 ?auto_79097 ) ( not ( = ?auto_79092 ?auto_79099 ) ) ( OBJ-AT ?auto_79093 ?auto_79092 ) ( OBJ-AT ?auto_79095 ?auto_79099 ) ( TRUCK-AT ?auto_79098 ?auto_79092 ) ( OBJ-AT ?auto_79094 ?auto_79092 ) ( OBJ-AT ?auto_79096 ?auto_79092 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_79093 ?auto_79095 ?auto_79092 )
      ( DELIVER-4PKG-VERIFY ?auto_79093 ?auto_79094 ?auto_79095 ?auto_79096 ?auto_79092 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_79165 - OBJ
      ?auto_79166 - OBJ
      ?auto_79167 - OBJ
      ?auto_79168 - OBJ
      ?auto_79164 - LOCATION
    )
    :vars
    (
      ?auto_79171 - LOCATION
      ?auto_79169 - CITY
      ?auto_79170 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_79166 ?auto_79165 ) ) ( not ( = ?auto_79167 ?auto_79165 ) ) ( not ( = ?auto_79167 ?auto_79166 ) ) ( not ( = ?auto_79168 ?auto_79165 ) ) ( not ( = ?auto_79168 ?auto_79166 ) ) ( not ( = ?auto_79168 ?auto_79167 ) ) ( IN-CITY ?auto_79171 ?auto_79169 ) ( IN-CITY ?auto_79164 ?auto_79169 ) ( not ( = ?auto_79164 ?auto_79171 ) ) ( OBJ-AT ?auto_79165 ?auto_79164 ) ( OBJ-AT ?auto_79166 ?auto_79171 ) ( TRUCK-AT ?auto_79170 ?auto_79164 ) ( OBJ-AT ?auto_79167 ?auto_79164 ) ( OBJ-AT ?auto_79168 ?auto_79164 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_79165 ?auto_79166 ?auto_79164 )
      ( DELIVER-4PKG-VERIFY ?auto_79165 ?auto_79166 ?auto_79167 ?auto_79168 ?auto_79164 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_79189 - OBJ
      ?auto_79190 - OBJ
      ?auto_79191 - OBJ
      ?auto_79192 - OBJ
      ?auto_79188 - LOCATION
    )
    :vars
    (
      ?auto_79195 - LOCATION
      ?auto_79193 - CITY
      ?auto_79194 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_79190 ?auto_79189 ) ) ( not ( = ?auto_79191 ?auto_79189 ) ) ( not ( = ?auto_79191 ?auto_79190 ) ) ( not ( = ?auto_79192 ?auto_79189 ) ) ( not ( = ?auto_79192 ?auto_79190 ) ) ( not ( = ?auto_79192 ?auto_79191 ) ) ( IN-CITY ?auto_79195 ?auto_79193 ) ( IN-CITY ?auto_79188 ?auto_79193 ) ( not ( = ?auto_79188 ?auto_79195 ) ) ( OBJ-AT ?auto_79189 ?auto_79188 ) ( OBJ-AT ?auto_79190 ?auto_79195 ) ( TRUCK-AT ?auto_79194 ?auto_79188 ) ( OBJ-AT ?auto_79191 ?auto_79188 ) ( OBJ-AT ?auto_79192 ?auto_79188 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_79189 ?auto_79190 ?auto_79188 )
      ( DELIVER-4PKG-VERIFY ?auto_79189 ?auto_79190 ?auto_79191 ?auto_79192 ?auto_79188 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_79261 - OBJ
      ?auto_79262 - OBJ
      ?auto_79263 - OBJ
      ?auto_79264 - OBJ
      ?auto_79260 - LOCATION
    )
    :vars
    (
      ?auto_79267 - LOCATION
      ?auto_79265 - CITY
      ?auto_79266 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_79262 ?auto_79261 ) ) ( not ( = ?auto_79263 ?auto_79261 ) ) ( not ( = ?auto_79263 ?auto_79262 ) ) ( not ( = ?auto_79264 ?auto_79261 ) ) ( not ( = ?auto_79264 ?auto_79262 ) ) ( not ( = ?auto_79264 ?auto_79263 ) ) ( IN-CITY ?auto_79267 ?auto_79265 ) ( IN-CITY ?auto_79260 ?auto_79265 ) ( not ( = ?auto_79260 ?auto_79267 ) ) ( OBJ-AT ?auto_79262 ?auto_79260 ) ( OBJ-AT ?auto_79264 ?auto_79267 ) ( TRUCK-AT ?auto_79266 ?auto_79260 ) ( OBJ-AT ?auto_79261 ?auto_79260 ) ( OBJ-AT ?auto_79263 ?auto_79260 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_79262 ?auto_79264 ?auto_79260 )
      ( DELIVER-4PKG-VERIFY ?auto_79261 ?auto_79262 ?auto_79263 ?auto_79264 ?auto_79260 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_79285 - OBJ
      ?auto_79286 - OBJ
      ?auto_79287 - OBJ
      ?auto_79288 - OBJ
      ?auto_79284 - LOCATION
    )
    :vars
    (
      ?auto_79291 - LOCATION
      ?auto_79289 - CITY
      ?auto_79290 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_79286 ?auto_79285 ) ) ( not ( = ?auto_79287 ?auto_79285 ) ) ( not ( = ?auto_79287 ?auto_79286 ) ) ( not ( = ?auto_79288 ?auto_79285 ) ) ( not ( = ?auto_79288 ?auto_79286 ) ) ( not ( = ?auto_79288 ?auto_79287 ) ) ( IN-CITY ?auto_79291 ?auto_79289 ) ( IN-CITY ?auto_79284 ?auto_79289 ) ( not ( = ?auto_79284 ?auto_79291 ) ) ( OBJ-AT ?auto_79286 ?auto_79284 ) ( OBJ-AT ?auto_79287 ?auto_79291 ) ( TRUCK-AT ?auto_79290 ?auto_79284 ) ( OBJ-AT ?auto_79285 ?auto_79284 ) ( OBJ-AT ?auto_79288 ?auto_79284 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_79286 ?auto_79287 ?auto_79284 )
      ( DELIVER-4PKG-VERIFY ?auto_79285 ?auto_79286 ?auto_79287 ?auto_79288 ?auto_79284 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_79362 - OBJ
      ?auto_79363 - OBJ
      ?auto_79364 - OBJ
      ?auto_79365 - OBJ
      ?auto_79361 - LOCATION
    )
    :vars
    (
      ?auto_79368 - LOCATION
      ?auto_79366 - CITY
      ?auto_79367 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_79363 ?auto_79362 ) ) ( not ( = ?auto_79364 ?auto_79362 ) ) ( not ( = ?auto_79364 ?auto_79363 ) ) ( not ( = ?auto_79365 ?auto_79362 ) ) ( not ( = ?auto_79365 ?auto_79363 ) ) ( not ( = ?auto_79365 ?auto_79364 ) ) ( IN-CITY ?auto_79368 ?auto_79366 ) ( IN-CITY ?auto_79361 ?auto_79366 ) ( not ( = ?auto_79361 ?auto_79368 ) ) ( OBJ-AT ?auto_79364 ?auto_79361 ) ( OBJ-AT ?auto_79365 ?auto_79368 ) ( TRUCK-AT ?auto_79367 ?auto_79361 ) ( OBJ-AT ?auto_79362 ?auto_79361 ) ( OBJ-AT ?auto_79363 ?auto_79361 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_79364 ?auto_79365 ?auto_79361 )
      ( DELIVER-4PKG-VERIFY ?auto_79362 ?auto_79363 ?auto_79364 ?auto_79365 ?auto_79361 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_79388 - OBJ
      ?auto_79389 - OBJ
      ?auto_79390 - OBJ
      ?auto_79391 - OBJ
      ?auto_79387 - LOCATION
    )
    :vars
    (
      ?auto_79394 - LOCATION
      ?auto_79392 - CITY
      ?auto_79393 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_79389 ?auto_79388 ) ) ( not ( = ?auto_79390 ?auto_79388 ) ) ( not ( = ?auto_79390 ?auto_79389 ) ) ( not ( = ?auto_79391 ?auto_79388 ) ) ( not ( = ?auto_79391 ?auto_79389 ) ) ( not ( = ?auto_79391 ?auto_79390 ) ) ( IN-CITY ?auto_79394 ?auto_79392 ) ( IN-CITY ?auto_79387 ?auto_79392 ) ( not ( = ?auto_79387 ?auto_79394 ) ) ( OBJ-AT ?auto_79391 ?auto_79387 ) ( OBJ-AT ?auto_79390 ?auto_79394 ) ( TRUCK-AT ?auto_79393 ?auto_79387 ) ( OBJ-AT ?auto_79388 ?auto_79387 ) ( OBJ-AT ?auto_79389 ?auto_79387 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_79391 ?auto_79390 ?auto_79387 )
      ( DELIVER-4PKG-VERIFY ?auto_79388 ?auto_79389 ?auto_79390 ?auto_79391 ?auto_79387 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_79439 - OBJ
      ?auto_79440 - OBJ
      ?auto_79441 - OBJ
      ?auto_79442 - OBJ
      ?auto_79438 - LOCATION
    )
    :vars
    (
      ?auto_79445 - LOCATION
      ?auto_79443 - CITY
      ?auto_79444 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_79440 ?auto_79439 ) ) ( not ( = ?auto_79441 ?auto_79439 ) ) ( not ( = ?auto_79441 ?auto_79440 ) ) ( not ( = ?auto_79442 ?auto_79439 ) ) ( not ( = ?auto_79442 ?auto_79440 ) ) ( not ( = ?auto_79442 ?auto_79441 ) ) ( IN-CITY ?auto_79445 ?auto_79443 ) ( IN-CITY ?auto_79438 ?auto_79443 ) ( not ( = ?auto_79438 ?auto_79445 ) ) ( OBJ-AT ?auto_79441 ?auto_79438 ) ( OBJ-AT ?auto_79440 ?auto_79445 ) ( TRUCK-AT ?auto_79444 ?auto_79438 ) ( OBJ-AT ?auto_79439 ?auto_79438 ) ( OBJ-AT ?auto_79442 ?auto_79438 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_79441 ?auto_79440 ?auto_79438 )
      ( DELIVER-4PKG-VERIFY ?auto_79439 ?auto_79440 ?auto_79441 ?auto_79442 ?auto_79438 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_79490 - OBJ
      ?auto_79491 - OBJ
      ?auto_79492 - OBJ
      ?auto_79493 - OBJ
      ?auto_79489 - LOCATION
    )
    :vars
    (
      ?auto_79496 - LOCATION
      ?auto_79494 - CITY
      ?auto_79495 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_79491 ?auto_79490 ) ) ( not ( = ?auto_79492 ?auto_79490 ) ) ( not ( = ?auto_79492 ?auto_79491 ) ) ( not ( = ?auto_79493 ?auto_79490 ) ) ( not ( = ?auto_79493 ?auto_79491 ) ) ( not ( = ?auto_79493 ?auto_79492 ) ) ( IN-CITY ?auto_79496 ?auto_79494 ) ( IN-CITY ?auto_79489 ?auto_79494 ) ( not ( = ?auto_79489 ?auto_79496 ) ) ( OBJ-AT ?auto_79493 ?auto_79489 ) ( OBJ-AT ?auto_79491 ?auto_79496 ) ( TRUCK-AT ?auto_79495 ?auto_79489 ) ( OBJ-AT ?auto_79490 ?auto_79489 ) ( OBJ-AT ?auto_79492 ?auto_79489 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_79493 ?auto_79491 ?auto_79489 )
      ( DELIVER-4PKG-VERIFY ?auto_79490 ?auto_79491 ?auto_79492 ?auto_79493 ?auto_79489 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_79568 - OBJ
      ?auto_79569 - OBJ
      ?auto_79570 - OBJ
      ?auto_79571 - OBJ
      ?auto_79567 - LOCATION
    )
    :vars
    (
      ?auto_79574 - LOCATION
      ?auto_79572 - CITY
      ?auto_79573 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_79569 ?auto_79568 ) ) ( not ( = ?auto_79570 ?auto_79568 ) ) ( not ( = ?auto_79570 ?auto_79569 ) ) ( not ( = ?auto_79571 ?auto_79568 ) ) ( not ( = ?auto_79571 ?auto_79569 ) ) ( not ( = ?auto_79571 ?auto_79570 ) ) ( IN-CITY ?auto_79574 ?auto_79572 ) ( IN-CITY ?auto_79567 ?auto_79572 ) ( not ( = ?auto_79567 ?auto_79574 ) ) ( OBJ-AT ?auto_79569 ?auto_79567 ) ( OBJ-AT ?auto_79571 ?auto_79574 ) ( TRUCK-AT ?auto_79573 ?auto_79567 ) ( OBJ-AT ?auto_79568 ?auto_79567 ) ( OBJ-AT ?auto_79570 ?auto_79567 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_79569 ?auto_79571 ?auto_79567 )
      ( DELIVER-4PKG-VERIFY ?auto_79568 ?auto_79569 ?auto_79570 ?auto_79571 ?auto_79567 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_79592 - OBJ
      ?auto_79593 - OBJ
      ?auto_79594 - OBJ
      ?auto_79595 - OBJ
      ?auto_79591 - LOCATION
    )
    :vars
    (
      ?auto_79598 - LOCATION
      ?auto_79596 - CITY
      ?auto_79597 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_79593 ?auto_79592 ) ) ( not ( = ?auto_79594 ?auto_79592 ) ) ( not ( = ?auto_79594 ?auto_79593 ) ) ( not ( = ?auto_79595 ?auto_79592 ) ) ( not ( = ?auto_79595 ?auto_79593 ) ) ( not ( = ?auto_79595 ?auto_79594 ) ) ( IN-CITY ?auto_79598 ?auto_79596 ) ( IN-CITY ?auto_79591 ?auto_79596 ) ( not ( = ?auto_79591 ?auto_79598 ) ) ( OBJ-AT ?auto_79593 ?auto_79591 ) ( OBJ-AT ?auto_79594 ?auto_79598 ) ( TRUCK-AT ?auto_79597 ?auto_79591 ) ( OBJ-AT ?auto_79592 ?auto_79591 ) ( OBJ-AT ?auto_79595 ?auto_79591 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_79593 ?auto_79594 ?auto_79591 )
      ( DELIVER-4PKG-VERIFY ?auto_79592 ?auto_79593 ?auto_79594 ?auto_79595 ?auto_79591 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_79616 - OBJ
      ?auto_79617 - OBJ
      ?auto_79618 - OBJ
      ?auto_79619 - OBJ
      ?auto_79615 - LOCATION
    )
    :vars
    (
      ?auto_79622 - LOCATION
      ?auto_79620 - CITY
      ?auto_79621 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_79617 ?auto_79616 ) ) ( not ( = ?auto_79618 ?auto_79616 ) ) ( not ( = ?auto_79618 ?auto_79617 ) ) ( not ( = ?auto_79619 ?auto_79616 ) ) ( not ( = ?auto_79619 ?auto_79617 ) ) ( not ( = ?auto_79619 ?auto_79618 ) ) ( IN-CITY ?auto_79622 ?auto_79620 ) ( IN-CITY ?auto_79615 ?auto_79620 ) ( not ( = ?auto_79615 ?auto_79622 ) ) ( OBJ-AT ?auto_79618 ?auto_79615 ) ( OBJ-AT ?auto_79619 ?auto_79622 ) ( TRUCK-AT ?auto_79621 ?auto_79615 ) ( OBJ-AT ?auto_79616 ?auto_79615 ) ( OBJ-AT ?auto_79617 ?auto_79615 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_79618 ?auto_79619 ?auto_79615 )
      ( DELIVER-4PKG-VERIFY ?auto_79616 ?auto_79617 ?auto_79618 ?auto_79619 ?auto_79615 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_79642 - OBJ
      ?auto_79643 - OBJ
      ?auto_79644 - OBJ
      ?auto_79645 - OBJ
      ?auto_79641 - LOCATION
    )
    :vars
    (
      ?auto_79648 - LOCATION
      ?auto_79646 - CITY
      ?auto_79647 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_79643 ?auto_79642 ) ) ( not ( = ?auto_79644 ?auto_79642 ) ) ( not ( = ?auto_79644 ?auto_79643 ) ) ( not ( = ?auto_79645 ?auto_79642 ) ) ( not ( = ?auto_79645 ?auto_79643 ) ) ( not ( = ?auto_79645 ?auto_79644 ) ) ( IN-CITY ?auto_79648 ?auto_79646 ) ( IN-CITY ?auto_79641 ?auto_79646 ) ( not ( = ?auto_79641 ?auto_79648 ) ) ( OBJ-AT ?auto_79645 ?auto_79641 ) ( OBJ-AT ?auto_79644 ?auto_79648 ) ( TRUCK-AT ?auto_79647 ?auto_79641 ) ( OBJ-AT ?auto_79642 ?auto_79641 ) ( OBJ-AT ?auto_79643 ?auto_79641 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_79645 ?auto_79644 ?auto_79641 )
      ( DELIVER-4PKG-VERIFY ?auto_79642 ?auto_79643 ?auto_79644 ?auto_79645 ?auto_79641 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_79746 - OBJ
      ?auto_79747 - OBJ
      ?auto_79748 - OBJ
      ?auto_79749 - OBJ
      ?auto_79745 - LOCATION
    )
    :vars
    (
      ?auto_79752 - LOCATION
      ?auto_79750 - CITY
      ?auto_79751 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_79747 ?auto_79746 ) ) ( not ( = ?auto_79748 ?auto_79746 ) ) ( not ( = ?auto_79748 ?auto_79747 ) ) ( not ( = ?auto_79749 ?auto_79746 ) ) ( not ( = ?auto_79749 ?auto_79747 ) ) ( not ( = ?auto_79749 ?auto_79748 ) ) ( IN-CITY ?auto_79752 ?auto_79750 ) ( IN-CITY ?auto_79745 ?auto_79750 ) ( not ( = ?auto_79745 ?auto_79752 ) ) ( OBJ-AT ?auto_79748 ?auto_79745 ) ( OBJ-AT ?auto_79747 ?auto_79752 ) ( TRUCK-AT ?auto_79751 ?auto_79745 ) ( OBJ-AT ?auto_79746 ?auto_79745 ) ( OBJ-AT ?auto_79749 ?auto_79745 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_79748 ?auto_79747 ?auto_79745 )
      ( DELIVER-4PKG-VERIFY ?auto_79746 ?auto_79747 ?auto_79748 ?auto_79749 ?auto_79745 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_79770 - OBJ
      ?auto_79771 - OBJ
      ?auto_79772 - OBJ
      ?auto_79773 - OBJ
      ?auto_79769 - LOCATION
    )
    :vars
    (
      ?auto_79776 - LOCATION
      ?auto_79774 - CITY
      ?auto_79775 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_79771 ?auto_79770 ) ) ( not ( = ?auto_79772 ?auto_79770 ) ) ( not ( = ?auto_79772 ?auto_79771 ) ) ( not ( = ?auto_79773 ?auto_79770 ) ) ( not ( = ?auto_79773 ?auto_79771 ) ) ( not ( = ?auto_79773 ?auto_79772 ) ) ( IN-CITY ?auto_79776 ?auto_79774 ) ( IN-CITY ?auto_79769 ?auto_79774 ) ( not ( = ?auto_79769 ?auto_79776 ) ) ( OBJ-AT ?auto_79773 ?auto_79769 ) ( OBJ-AT ?auto_79771 ?auto_79776 ) ( TRUCK-AT ?auto_79775 ?auto_79769 ) ( OBJ-AT ?auto_79770 ?auto_79769 ) ( OBJ-AT ?auto_79772 ?auto_79769 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_79773 ?auto_79771 ?auto_79769 )
      ( DELIVER-4PKG-VERIFY ?auto_79770 ?auto_79771 ?auto_79772 ?auto_79773 ?auto_79769 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_79923 - OBJ
      ?auto_79924 - OBJ
      ?auto_79925 - OBJ
      ?auto_79926 - OBJ
      ?auto_79922 - LOCATION
    )
    :vars
    (
      ?auto_79929 - LOCATION
      ?auto_79927 - CITY
      ?auto_79928 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_79924 ?auto_79923 ) ) ( not ( = ?auto_79925 ?auto_79923 ) ) ( not ( = ?auto_79925 ?auto_79924 ) ) ( not ( = ?auto_79926 ?auto_79923 ) ) ( not ( = ?auto_79926 ?auto_79924 ) ) ( not ( = ?auto_79926 ?auto_79925 ) ) ( IN-CITY ?auto_79929 ?auto_79927 ) ( IN-CITY ?auto_79922 ?auto_79927 ) ( not ( = ?auto_79922 ?auto_79929 ) ) ( OBJ-AT ?auto_79924 ?auto_79922 ) ( OBJ-AT ?auto_79923 ?auto_79929 ) ( TRUCK-AT ?auto_79928 ?auto_79922 ) ( OBJ-AT ?auto_79925 ?auto_79922 ) ( OBJ-AT ?auto_79926 ?auto_79922 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_79924 ?auto_79923 ?auto_79922 )
      ( DELIVER-4PKG-VERIFY ?auto_79923 ?auto_79924 ?auto_79925 ?auto_79926 ?auto_79922 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_79947 - OBJ
      ?auto_79948 - OBJ
      ?auto_79949 - OBJ
      ?auto_79950 - OBJ
      ?auto_79946 - LOCATION
    )
    :vars
    (
      ?auto_79953 - LOCATION
      ?auto_79951 - CITY
      ?auto_79952 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_79948 ?auto_79947 ) ) ( not ( = ?auto_79949 ?auto_79947 ) ) ( not ( = ?auto_79949 ?auto_79948 ) ) ( not ( = ?auto_79950 ?auto_79947 ) ) ( not ( = ?auto_79950 ?auto_79948 ) ) ( not ( = ?auto_79950 ?auto_79949 ) ) ( IN-CITY ?auto_79953 ?auto_79951 ) ( IN-CITY ?auto_79946 ?auto_79951 ) ( not ( = ?auto_79946 ?auto_79953 ) ) ( OBJ-AT ?auto_79948 ?auto_79946 ) ( OBJ-AT ?auto_79947 ?auto_79953 ) ( TRUCK-AT ?auto_79952 ?auto_79946 ) ( OBJ-AT ?auto_79949 ?auto_79946 ) ( OBJ-AT ?auto_79950 ?auto_79946 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_79948 ?auto_79947 ?auto_79946 )
      ( DELIVER-4PKG-VERIFY ?auto_79947 ?auto_79948 ?auto_79949 ?auto_79950 ?auto_79946 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_80019 - OBJ
      ?auto_80020 - OBJ
      ?auto_80021 - OBJ
      ?auto_80022 - OBJ
      ?auto_80018 - LOCATION
    )
    :vars
    (
      ?auto_80025 - LOCATION
      ?auto_80023 - CITY
      ?auto_80024 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80020 ?auto_80019 ) ) ( not ( = ?auto_80021 ?auto_80019 ) ) ( not ( = ?auto_80021 ?auto_80020 ) ) ( not ( = ?auto_80022 ?auto_80019 ) ) ( not ( = ?auto_80022 ?auto_80020 ) ) ( not ( = ?auto_80022 ?auto_80021 ) ) ( IN-CITY ?auto_80025 ?auto_80023 ) ( IN-CITY ?auto_80018 ?auto_80023 ) ( not ( = ?auto_80018 ?auto_80025 ) ) ( OBJ-AT ?auto_80021 ?auto_80018 ) ( OBJ-AT ?auto_80019 ?auto_80025 ) ( TRUCK-AT ?auto_80024 ?auto_80018 ) ( OBJ-AT ?auto_80020 ?auto_80018 ) ( OBJ-AT ?auto_80022 ?auto_80018 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80021 ?auto_80019 ?auto_80018 )
      ( DELIVER-4PKG-VERIFY ?auto_80019 ?auto_80020 ?auto_80021 ?auto_80022 ?auto_80018 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_80070 - OBJ
      ?auto_80071 - OBJ
      ?auto_80072 - OBJ
      ?auto_80073 - OBJ
      ?auto_80069 - LOCATION
    )
    :vars
    (
      ?auto_80076 - LOCATION
      ?auto_80074 - CITY
      ?auto_80075 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80071 ?auto_80070 ) ) ( not ( = ?auto_80072 ?auto_80070 ) ) ( not ( = ?auto_80072 ?auto_80071 ) ) ( not ( = ?auto_80073 ?auto_80070 ) ) ( not ( = ?auto_80073 ?auto_80071 ) ) ( not ( = ?auto_80073 ?auto_80072 ) ) ( IN-CITY ?auto_80076 ?auto_80074 ) ( IN-CITY ?auto_80069 ?auto_80074 ) ( not ( = ?auto_80069 ?auto_80076 ) ) ( OBJ-AT ?auto_80073 ?auto_80069 ) ( OBJ-AT ?auto_80070 ?auto_80076 ) ( TRUCK-AT ?auto_80075 ?auto_80069 ) ( OBJ-AT ?auto_80071 ?auto_80069 ) ( OBJ-AT ?auto_80072 ?auto_80069 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80073 ?auto_80070 ?auto_80069 )
      ( DELIVER-4PKG-VERIFY ?auto_80070 ?auto_80071 ?auto_80072 ?auto_80073 ?auto_80069 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_80148 - OBJ
      ?auto_80149 - OBJ
      ?auto_80150 - OBJ
      ?auto_80151 - OBJ
      ?auto_80147 - LOCATION
    )
    :vars
    (
      ?auto_80154 - LOCATION
      ?auto_80152 - CITY
      ?auto_80153 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80149 ?auto_80148 ) ) ( not ( = ?auto_80150 ?auto_80148 ) ) ( not ( = ?auto_80150 ?auto_80149 ) ) ( not ( = ?auto_80151 ?auto_80148 ) ) ( not ( = ?auto_80151 ?auto_80149 ) ) ( not ( = ?auto_80151 ?auto_80150 ) ) ( IN-CITY ?auto_80154 ?auto_80152 ) ( IN-CITY ?auto_80147 ?auto_80152 ) ( not ( = ?auto_80147 ?auto_80154 ) ) ( OBJ-AT ?auto_80150 ?auto_80147 ) ( OBJ-AT ?auto_80148 ?auto_80154 ) ( TRUCK-AT ?auto_80153 ?auto_80147 ) ( OBJ-AT ?auto_80149 ?auto_80147 ) ( OBJ-AT ?auto_80151 ?auto_80147 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80150 ?auto_80148 ?auto_80147 )
      ( DELIVER-4PKG-VERIFY ?auto_80148 ?auto_80149 ?auto_80150 ?auto_80151 ?auto_80147 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_80172 - OBJ
      ?auto_80173 - OBJ
      ?auto_80174 - OBJ
      ?auto_80175 - OBJ
      ?auto_80171 - LOCATION
    )
    :vars
    (
      ?auto_80178 - LOCATION
      ?auto_80176 - CITY
      ?auto_80177 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80173 ?auto_80172 ) ) ( not ( = ?auto_80174 ?auto_80172 ) ) ( not ( = ?auto_80174 ?auto_80173 ) ) ( not ( = ?auto_80175 ?auto_80172 ) ) ( not ( = ?auto_80175 ?auto_80173 ) ) ( not ( = ?auto_80175 ?auto_80174 ) ) ( IN-CITY ?auto_80178 ?auto_80176 ) ( IN-CITY ?auto_80171 ?auto_80176 ) ( not ( = ?auto_80171 ?auto_80178 ) ) ( OBJ-AT ?auto_80175 ?auto_80171 ) ( OBJ-AT ?auto_80172 ?auto_80178 ) ( TRUCK-AT ?auto_80177 ?auto_80171 ) ( OBJ-AT ?auto_80173 ?auto_80171 ) ( OBJ-AT ?auto_80174 ?auto_80171 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80175 ?auto_80172 ?auto_80171 )
      ( DELIVER-4PKG-VERIFY ?auto_80172 ?auto_80173 ?auto_80174 ?auto_80175 ?auto_80171 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_80414 - OBJ
      ?auto_80413 - LOCATION
    )
    :vars
    (
      ?auto_80417 - OBJ
      ?auto_80418 - LOCATION
      ?auto_80415 - CITY
      ?auto_80416 - TRUCK
      ?auto_80419 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_80414 ?auto_80417 ) ) ( IN-CITY ?auto_80418 ?auto_80415 ) ( IN-CITY ?auto_80413 ?auto_80415 ) ( not ( = ?auto_80413 ?auto_80418 ) ) ( OBJ-AT ?auto_80417 ?auto_80413 ) ( OBJ-AT ?auto_80414 ?auto_80418 ) ( TRUCK-AT ?auto_80416 ?auto_80413 ) ( not ( = ?auto_80419 ?auto_80417 ) ) ( IN-TRUCK ?auto_80419 ?auto_80416 ) ( not ( = ?auto_80414 ?auto_80419 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80417 ?auto_80419 ?auto_80413 )
      ( DELIVER-2PKG ?auto_80417 ?auto_80414 ?auto_80413 )
      ( DELIVER-1PKG-VERIFY ?auto_80414 ?auto_80413 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_80421 - OBJ
      ?auto_80422 - OBJ
      ?auto_80420 - LOCATION
    )
    :vars
    (
      ?auto_80426 - LOCATION
      ?auto_80425 - CITY
      ?auto_80424 - TRUCK
      ?auto_80423 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_80422 ?auto_80421 ) ) ( IN-CITY ?auto_80426 ?auto_80425 ) ( IN-CITY ?auto_80420 ?auto_80425 ) ( not ( = ?auto_80420 ?auto_80426 ) ) ( OBJ-AT ?auto_80421 ?auto_80420 ) ( OBJ-AT ?auto_80422 ?auto_80426 ) ( TRUCK-AT ?auto_80424 ?auto_80420 ) ( not ( = ?auto_80423 ?auto_80421 ) ) ( IN-TRUCK ?auto_80423 ?auto_80424 ) ( not ( = ?auto_80422 ?auto_80423 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_80422 ?auto_80420 )
      ( DELIVER-2PKG-VERIFY ?auto_80421 ?auto_80422 ?auto_80420 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_80428 - OBJ
      ?auto_80429 - OBJ
      ?auto_80427 - LOCATION
    )
    :vars
    (
      ?auto_80433 - OBJ
      ?auto_80431 - LOCATION
      ?auto_80434 - CITY
      ?auto_80430 - TRUCK
      ?auto_80432 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_80429 ?auto_80428 ) ) ( not ( = ?auto_80429 ?auto_80433 ) ) ( IN-CITY ?auto_80431 ?auto_80434 ) ( IN-CITY ?auto_80427 ?auto_80434 ) ( not ( = ?auto_80427 ?auto_80431 ) ) ( OBJ-AT ?auto_80433 ?auto_80427 ) ( OBJ-AT ?auto_80429 ?auto_80431 ) ( TRUCK-AT ?auto_80430 ?auto_80427 ) ( not ( = ?auto_80432 ?auto_80433 ) ) ( IN-TRUCK ?auto_80432 ?auto_80430 ) ( not ( = ?auto_80429 ?auto_80432 ) ) ( OBJ-AT ?auto_80428 ?auto_80427 ) ( not ( = ?auto_80428 ?auto_80433 ) ) ( not ( = ?auto_80428 ?auto_80432 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80433 ?auto_80429 ?auto_80427 )
      ( DELIVER-2PKG-VERIFY ?auto_80428 ?auto_80429 ?auto_80427 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_80436 - OBJ
      ?auto_80437 - OBJ
      ?auto_80435 - LOCATION
    )
    :vars
    (
      ?auto_80440 - OBJ
      ?auto_80439 - LOCATION
      ?auto_80441 - CITY
      ?auto_80438 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80437 ?auto_80436 ) ) ( not ( = ?auto_80437 ?auto_80440 ) ) ( IN-CITY ?auto_80439 ?auto_80441 ) ( IN-CITY ?auto_80435 ?auto_80441 ) ( not ( = ?auto_80435 ?auto_80439 ) ) ( OBJ-AT ?auto_80440 ?auto_80435 ) ( OBJ-AT ?auto_80437 ?auto_80439 ) ( TRUCK-AT ?auto_80438 ?auto_80435 ) ( not ( = ?auto_80436 ?auto_80440 ) ) ( IN-TRUCK ?auto_80436 ?auto_80438 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80440 ?auto_80437 ?auto_80435 )
      ( DELIVER-2PKG-VERIFY ?auto_80436 ?auto_80437 ?auto_80435 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_80443 - OBJ
      ?auto_80444 - OBJ
      ?auto_80442 - LOCATION
    )
    :vars
    (
      ?auto_80446 - LOCATION
      ?auto_80448 - CITY
      ?auto_80445 - TRUCK
      ?auto_80447 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_80444 ?auto_80443 ) ) ( IN-CITY ?auto_80446 ?auto_80448 ) ( IN-CITY ?auto_80442 ?auto_80448 ) ( not ( = ?auto_80442 ?auto_80446 ) ) ( OBJ-AT ?auto_80444 ?auto_80442 ) ( OBJ-AT ?auto_80443 ?auto_80446 ) ( TRUCK-AT ?auto_80445 ?auto_80442 ) ( not ( = ?auto_80447 ?auto_80444 ) ) ( IN-TRUCK ?auto_80447 ?auto_80445 ) ( not ( = ?auto_80443 ?auto_80447 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80444 ?auto_80443 ?auto_80442 )
      ( DELIVER-2PKG-VERIFY ?auto_80443 ?auto_80444 ?auto_80442 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_80450 - OBJ
      ?auto_80451 - OBJ
      ?auto_80449 - LOCATION
    )
    :vars
    (
      ?auto_80455 - OBJ
      ?auto_80453 - LOCATION
      ?auto_80456 - CITY
      ?auto_80452 - TRUCK
      ?auto_80454 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_80451 ?auto_80450 ) ) ( not ( = ?auto_80450 ?auto_80455 ) ) ( IN-CITY ?auto_80453 ?auto_80456 ) ( IN-CITY ?auto_80449 ?auto_80456 ) ( not ( = ?auto_80449 ?auto_80453 ) ) ( OBJ-AT ?auto_80455 ?auto_80449 ) ( OBJ-AT ?auto_80450 ?auto_80453 ) ( TRUCK-AT ?auto_80452 ?auto_80449 ) ( not ( = ?auto_80454 ?auto_80455 ) ) ( IN-TRUCK ?auto_80454 ?auto_80452 ) ( not ( = ?auto_80450 ?auto_80454 ) ) ( OBJ-AT ?auto_80451 ?auto_80449 ) ( not ( = ?auto_80451 ?auto_80455 ) ) ( not ( = ?auto_80451 ?auto_80454 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80455 ?auto_80450 ?auto_80449 )
      ( DELIVER-2PKG-VERIFY ?auto_80450 ?auto_80451 ?auto_80449 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_80458 - OBJ
      ?auto_80459 - OBJ
      ?auto_80457 - LOCATION
    )
    :vars
    (
      ?auto_80462 - OBJ
      ?auto_80461 - LOCATION
      ?auto_80463 - CITY
      ?auto_80460 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80459 ?auto_80458 ) ) ( not ( = ?auto_80458 ?auto_80462 ) ) ( IN-CITY ?auto_80461 ?auto_80463 ) ( IN-CITY ?auto_80457 ?auto_80463 ) ( not ( = ?auto_80457 ?auto_80461 ) ) ( OBJ-AT ?auto_80462 ?auto_80457 ) ( OBJ-AT ?auto_80458 ?auto_80461 ) ( TRUCK-AT ?auto_80460 ?auto_80457 ) ( not ( = ?auto_80459 ?auto_80462 ) ) ( IN-TRUCK ?auto_80459 ?auto_80460 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80462 ?auto_80458 ?auto_80457 )
      ( DELIVER-2PKG-VERIFY ?auto_80458 ?auto_80459 ?auto_80457 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_80481 - OBJ
      ?auto_80482 - OBJ
      ?auto_80483 - OBJ
      ?auto_80480 - LOCATION
    )
    :vars
    (
      ?auto_80485 - LOCATION
      ?auto_80487 - CITY
      ?auto_80484 - TRUCK
      ?auto_80486 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_80482 ?auto_80481 ) ) ( not ( = ?auto_80483 ?auto_80481 ) ) ( not ( = ?auto_80483 ?auto_80482 ) ) ( IN-CITY ?auto_80485 ?auto_80487 ) ( IN-CITY ?auto_80480 ?auto_80487 ) ( not ( = ?auto_80480 ?auto_80485 ) ) ( OBJ-AT ?auto_80481 ?auto_80480 ) ( OBJ-AT ?auto_80483 ?auto_80485 ) ( TRUCK-AT ?auto_80484 ?auto_80480 ) ( not ( = ?auto_80486 ?auto_80481 ) ) ( IN-TRUCK ?auto_80486 ?auto_80484 ) ( not ( = ?auto_80483 ?auto_80486 ) ) ( OBJ-AT ?auto_80482 ?auto_80480 ) ( not ( = ?auto_80482 ?auto_80486 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80481 ?auto_80483 ?auto_80480 )
      ( DELIVER-3PKG-VERIFY ?auto_80481 ?auto_80482 ?auto_80483 ?auto_80480 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_80489 - OBJ
      ?auto_80490 - OBJ
      ?auto_80491 - OBJ
      ?auto_80488 - LOCATION
    )
    :vars
    (
      ?auto_80493 - LOCATION
      ?auto_80494 - CITY
      ?auto_80492 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80490 ?auto_80489 ) ) ( not ( = ?auto_80491 ?auto_80489 ) ) ( not ( = ?auto_80491 ?auto_80490 ) ) ( IN-CITY ?auto_80493 ?auto_80494 ) ( IN-CITY ?auto_80488 ?auto_80494 ) ( not ( = ?auto_80488 ?auto_80493 ) ) ( OBJ-AT ?auto_80489 ?auto_80488 ) ( OBJ-AT ?auto_80491 ?auto_80493 ) ( TRUCK-AT ?auto_80492 ?auto_80488 ) ( IN-TRUCK ?auto_80490 ?auto_80492 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80489 ?auto_80491 ?auto_80488 )
      ( DELIVER-3PKG-VERIFY ?auto_80489 ?auto_80490 ?auto_80491 ?auto_80488 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_80504 - OBJ
      ?auto_80505 - OBJ
      ?auto_80506 - OBJ
      ?auto_80503 - LOCATION
    )
    :vars
    (
      ?auto_80508 - LOCATION
      ?auto_80510 - CITY
      ?auto_80507 - TRUCK
      ?auto_80509 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_80505 ?auto_80504 ) ) ( not ( = ?auto_80506 ?auto_80504 ) ) ( not ( = ?auto_80506 ?auto_80505 ) ) ( IN-CITY ?auto_80508 ?auto_80510 ) ( IN-CITY ?auto_80503 ?auto_80510 ) ( not ( = ?auto_80503 ?auto_80508 ) ) ( OBJ-AT ?auto_80504 ?auto_80503 ) ( OBJ-AT ?auto_80505 ?auto_80508 ) ( TRUCK-AT ?auto_80507 ?auto_80503 ) ( not ( = ?auto_80509 ?auto_80504 ) ) ( IN-TRUCK ?auto_80509 ?auto_80507 ) ( not ( = ?auto_80505 ?auto_80509 ) ) ( OBJ-AT ?auto_80506 ?auto_80503 ) ( not ( = ?auto_80506 ?auto_80509 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80504 ?auto_80505 ?auto_80503 )
      ( DELIVER-3PKG-VERIFY ?auto_80504 ?auto_80505 ?auto_80506 ?auto_80503 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_80512 - OBJ
      ?auto_80513 - OBJ
      ?auto_80514 - OBJ
      ?auto_80511 - LOCATION
    )
    :vars
    (
      ?auto_80516 - LOCATION
      ?auto_80517 - CITY
      ?auto_80515 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80513 ?auto_80512 ) ) ( not ( = ?auto_80514 ?auto_80512 ) ) ( not ( = ?auto_80514 ?auto_80513 ) ) ( IN-CITY ?auto_80516 ?auto_80517 ) ( IN-CITY ?auto_80511 ?auto_80517 ) ( not ( = ?auto_80511 ?auto_80516 ) ) ( OBJ-AT ?auto_80512 ?auto_80511 ) ( OBJ-AT ?auto_80513 ?auto_80516 ) ( TRUCK-AT ?auto_80515 ?auto_80511 ) ( IN-TRUCK ?auto_80514 ?auto_80515 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80512 ?auto_80513 ?auto_80511 )
      ( DELIVER-3PKG-VERIFY ?auto_80512 ?auto_80513 ?auto_80514 ?auto_80511 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_80527 - OBJ
      ?auto_80528 - OBJ
      ?auto_80529 - OBJ
      ?auto_80526 - LOCATION
    )
    :vars
    (
      ?auto_80531 - LOCATION
      ?auto_80533 - CITY
      ?auto_80530 - TRUCK
      ?auto_80532 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_80528 ?auto_80527 ) ) ( not ( = ?auto_80529 ?auto_80527 ) ) ( not ( = ?auto_80529 ?auto_80528 ) ) ( IN-CITY ?auto_80531 ?auto_80533 ) ( IN-CITY ?auto_80526 ?auto_80533 ) ( not ( = ?auto_80526 ?auto_80531 ) ) ( OBJ-AT ?auto_80528 ?auto_80526 ) ( OBJ-AT ?auto_80529 ?auto_80531 ) ( TRUCK-AT ?auto_80530 ?auto_80526 ) ( not ( = ?auto_80532 ?auto_80528 ) ) ( IN-TRUCK ?auto_80532 ?auto_80530 ) ( not ( = ?auto_80529 ?auto_80532 ) ) ( OBJ-AT ?auto_80527 ?auto_80526 ) ( not ( = ?auto_80527 ?auto_80532 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80528 ?auto_80529 ?auto_80526 )
      ( DELIVER-3PKG-VERIFY ?auto_80527 ?auto_80528 ?auto_80529 ?auto_80526 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_80544 - OBJ
      ?auto_80545 - OBJ
      ?auto_80546 - OBJ
      ?auto_80543 - LOCATION
    )
    :vars
    (
      ?auto_80549 - OBJ
      ?auto_80548 - LOCATION
      ?auto_80550 - CITY
      ?auto_80547 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80545 ?auto_80544 ) ) ( not ( = ?auto_80546 ?auto_80544 ) ) ( not ( = ?auto_80546 ?auto_80545 ) ) ( not ( = ?auto_80546 ?auto_80549 ) ) ( IN-CITY ?auto_80548 ?auto_80550 ) ( IN-CITY ?auto_80543 ?auto_80550 ) ( not ( = ?auto_80543 ?auto_80548 ) ) ( OBJ-AT ?auto_80549 ?auto_80543 ) ( OBJ-AT ?auto_80546 ?auto_80548 ) ( TRUCK-AT ?auto_80547 ?auto_80543 ) ( not ( = ?auto_80545 ?auto_80549 ) ) ( IN-TRUCK ?auto_80545 ?auto_80547 ) ( OBJ-AT ?auto_80544 ?auto_80543 ) ( not ( = ?auto_80544 ?auto_80549 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80549 ?auto_80546 ?auto_80543 )
      ( DELIVER-3PKG-VERIFY ?auto_80544 ?auto_80545 ?auto_80546 ?auto_80543 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_80552 - OBJ
      ?auto_80553 - OBJ
      ?auto_80554 - OBJ
      ?auto_80551 - LOCATION
    )
    :vars
    (
      ?auto_80556 - LOCATION
      ?auto_80558 - CITY
      ?auto_80555 - TRUCK
      ?auto_80557 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_80553 ?auto_80552 ) ) ( not ( = ?auto_80554 ?auto_80552 ) ) ( not ( = ?auto_80554 ?auto_80553 ) ) ( IN-CITY ?auto_80556 ?auto_80558 ) ( IN-CITY ?auto_80551 ?auto_80558 ) ( not ( = ?auto_80551 ?auto_80556 ) ) ( OBJ-AT ?auto_80554 ?auto_80551 ) ( OBJ-AT ?auto_80553 ?auto_80556 ) ( TRUCK-AT ?auto_80555 ?auto_80551 ) ( not ( = ?auto_80557 ?auto_80554 ) ) ( IN-TRUCK ?auto_80557 ?auto_80555 ) ( not ( = ?auto_80553 ?auto_80557 ) ) ( OBJ-AT ?auto_80552 ?auto_80551 ) ( not ( = ?auto_80552 ?auto_80557 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80554 ?auto_80553 ?auto_80551 )
      ( DELIVER-3PKG-VERIFY ?auto_80552 ?auto_80553 ?auto_80554 ?auto_80551 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_80569 - OBJ
      ?auto_80570 - OBJ
      ?auto_80571 - OBJ
      ?auto_80568 - LOCATION
    )
    :vars
    (
      ?auto_80574 - OBJ
      ?auto_80573 - LOCATION
      ?auto_80575 - CITY
      ?auto_80572 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80570 ?auto_80569 ) ) ( not ( = ?auto_80571 ?auto_80569 ) ) ( not ( = ?auto_80571 ?auto_80570 ) ) ( not ( = ?auto_80570 ?auto_80574 ) ) ( IN-CITY ?auto_80573 ?auto_80575 ) ( IN-CITY ?auto_80568 ?auto_80575 ) ( not ( = ?auto_80568 ?auto_80573 ) ) ( OBJ-AT ?auto_80574 ?auto_80568 ) ( OBJ-AT ?auto_80570 ?auto_80573 ) ( TRUCK-AT ?auto_80572 ?auto_80568 ) ( not ( = ?auto_80571 ?auto_80574 ) ) ( IN-TRUCK ?auto_80571 ?auto_80572 ) ( OBJ-AT ?auto_80569 ?auto_80568 ) ( not ( = ?auto_80569 ?auto_80574 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80574 ?auto_80570 ?auto_80568 )
      ( DELIVER-3PKG-VERIFY ?auto_80569 ?auto_80570 ?auto_80571 ?auto_80568 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_80586 - OBJ
      ?auto_80587 - OBJ
      ?auto_80588 - OBJ
      ?auto_80585 - LOCATION
    )
    :vars
    (
      ?auto_80590 - LOCATION
      ?auto_80591 - CITY
      ?auto_80589 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80587 ?auto_80586 ) ) ( not ( = ?auto_80588 ?auto_80586 ) ) ( not ( = ?auto_80588 ?auto_80587 ) ) ( IN-CITY ?auto_80590 ?auto_80591 ) ( IN-CITY ?auto_80585 ?auto_80591 ) ( not ( = ?auto_80585 ?auto_80590 ) ) ( OBJ-AT ?auto_80587 ?auto_80585 ) ( OBJ-AT ?auto_80588 ?auto_80590 ) ( TRUCK-AT ?auto_80589 ?auto_80585 ) ( IN-TRUCK ?auto_80586 ?auto_80589 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80587 ?auto_80588 ?auto_80585 )
      ( DELIVER-3PKG-VERIFY ?auto_80586 ?auto_80587 ?auto_80588 ?auto_80585 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_80593 - OBJ
      ?auto_80594 - OBJ
      ?auto_80595 - OBJ
      ?auto_80592 - LOCATION
    )
    :vars
    (
      ?auto_80598 - OBJ
      ?auto_80597 - LOCATION
      ?auto_80599 - CITY
      ?auto_80596 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80594 ?auto_80593 ) ) ( not ( = ?auto_80595 ?auto_80593 ) ) ( not ( = ?auto_80595 ?auto_80594 ) ) ( not ( = ?auto_80595 ?auto_80598 ) ) ( IN-CITY ?auto_80597 ?auto_80599 ) ( IN-CITY ?auto_80592 ?auto_80599 ) ( not ( = ?auto_80592 ?auto_80597 ) ) ( OBJ-AT ?auto_80598 ?auto_80592 ) ( OBJ-AT ?auto_80595 ?auto_80597 ) ( TRUCK-AT ?auto_80596 ?auto_80592 ) ( not ( = ?auto_80593 ?auto_80598 ) ) ( IN-TRUCK ?auto_80593 ?auto_80596 ) ( OBJ-AT ?auto_80594 ?auto_80592 ) ( not ( = ?auto_80594 ?auto_80598 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80598 ?auto_80595 ?auto_80592 )
      ( DELIVER-3PKG-VERIFY ?auto_80593 ?auto_80594 ?auto_80595 ?auto_80592 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_80609 - OBJ
      ?auto_80610 - OBJ
      ?auto_80611 - OBJ
      ?auto_80608 - LOCATION
    )
    :vars
    (
      ?auto_80613 - LOCATION
      ?auto_80614 - CITY
      ?auto_80612 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80610 ?auto_80609 ) ) ( not ( = ?auto_80611 ?auto_80609 ) ) ( not ( = ?auto_80611 ?auto_80610 ) ) ( IN-CITY ?auto_80613 ?auto_80614 ) ( IN-CITY ?auto_80608 ?auto_80614 ) ( not ( = ?auto_80608 ?auto_80613 ) ) ( OBJ-AT ?auto_80611 ?auto_80608 ) ( OBJ-AT ?auto_80610 ?auto_80613 ) ( TRUCK-AT ?auto_80612 ?auto_80608 ) ( IN-TRUCK ?auto_80609 ?auto_80612 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80611 ?auto_80610 ?auto_80608 )
      ( DELIVER-3PKG-VERIFY ?auto_80609 ?auto_80610 ?auto_80611 ?auto_80608 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_80616 - OBJ
      ?auto_80617 - OBJ
      ?auto_80618 - OBJ
      ?auto_80615 - LOCATION
    )
    :vars
    (
      ?auto_80621 - OBJ
      ?auto_80620 - LOCATION
      ?auto_80622 - CITY
      ?auto_80619 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80617 ?auto_80616 ) ) ( not ( = ?auto_80618 ?auto_80616 ) ) ( not ( = ?auto_80618 ?auto_80617 ) ) ( not ( = ?auto_80617 ?auto_80621 ) ) ( IN-CITY ?auto_80620 ?auto_80622 ) ( IN-CITY ?auto_80615 ?auto_80622 ) ( not ( = ?auto_80615 ?auto_80620 ) ) ( OBJ-AT ?auto_80621 ?auto_80615 ) ( OBJ-AT ?auto_80617 ?auto_80620 ) ( TRUCK-AT ?auto_80619 ?auto_80615 ) ( not ( = ?auto_80616 ?auto_80621 ) ) ( IN-TRUCK ?auto_80616 ?auto_80619 ) ( OBJ-AT ?auto_80618 ?auto_80615 ) ( not ( = ?auto_80618 ?auto_80621 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80621 ?auto_80617 ?auto_80615 )
      ( DELIVER-3PKG-VERIFY ?auto_80616 ?auto_80617 ?auto_80618 ?auto_80615 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_80648 - OBJ
      ?auto_80649 - OBJ
      ?auto_80650 - OBJ
      ?auto_80647 - LOCATION
    )
    :vars
    (
      ?auto_80652 - LOCATION
      ?auto_80654 - CITY
      ?auto_80651 - TRUCK
      ?auto_80653 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_80649 ?auto_80648 ) ) ( not ( = ?auto_80650 ?auto_80648 ) ) ( not ( = ?auto_80650 ?auto_80649 ) ) ( IN-CITY ?auto_80652 ?auto_80654 ) ( IN-CITY ?auto_80647 ?auto_80654 ) ( not ( = ?auto_80647 ?auto_80652 ) ) ( OBJ-AT ?auto_80649 ?auto_80647 ) ( OBJ-AT ?auto_80648 ?auto_80652 ) ( TRUCK-AT ?auto_80651 ?auto_80647 ) ( not ( = ?auto_80653 ?auto_80649 ) ) ( IN-TRUCK ?auto_80653 ?auto_80651 ) ( not ( = ?auto_80648 ?auto_80653 ) ) ( OBJ-AT ?auto_80650 ?auto_80647 ) ( not ( = ?auto_80650 ?auto_80653 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80649 ?auto_80648 ?auto_80647 )
      ( DELIVER-3PKG-VERIFY ?auto_80648 ?auto_80649 ?auto_80650 ?auto_80647 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_80656 - OBJ
      ?auto_80657 - OBJ
      ?auto_80658 - OBJ
      ?auto_80655 - LOCATION
    )
    :vars
    (
      ?auto_80660 - LOCATION
      ?auto_80661 - CITY
      ?auto_80659 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80657 ?auto_80656 ) ) ( not ( = ?auto_80658 ?auto_80656 ) ) ( not ( = ?auto_80658 ?auto_80657 ) ) ( IN-CITY ?auto_80660 ?auto_80661 ) ( IN-CITY ?auto_80655 ?auto_80661 ) ( not ( = ?auto_80655 ?auto_80660 ) ) ( OBJ-AT ?auto_80657 ?auto_80655 ) ( OBJ-AT ?auto_80656 ?auto_80660 ) ( TRUCK-AT ?auto_80659 ?auto_80655 ) ( IN-TRUCK ?auto_80658 ?auto_80659 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80657 ?auto_80656 ?auto_80655 )
      ( DELIVER-3PKG-VERIFY ?auto_80656 ?auto_80657 ?auto_80658 ?auto_80655 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_80671 - OBJ
      ?auto_80672 - OBJ
      ?auto_80673 - OBJ
      ?auto_80670 - LOCATION
    )
    :vars
    (
      ?auto_80675 - LOCATION
      ?auto_80677 - CITY
      ?auto_80674 - TRUCK
      ?auto_80676 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_80672 ?auto_80671 ) ) ( not ( = ?auto_80673 ?auto_80671 ) ) ( not ( = ?auto_80673 ?auto_80672 ) ) ( IN-CITY ?auto_80675 ?auto_80677 ) ( IN-CITY ?auto_80670 ?auto_80677 ) ( not ( = ?auto_80670 ?auto_80675 ) ) ( OBJ-AT ?auto_80673 ?auto_80670 ) ( OBJ-AT ?auto_80671 ?auto_80675 ) ( TRUCK-AT ?auto_80674 ?auto_80670 ) ( not ( = ?auto_80676 ?auto_80673 ) ) ( IN-TRUCK ?auto_80676 ?auto_80674 ) ( not ( = ?auto_80671 ?auto_80676 ) ) ( OBJ-AT ?auto_80672 ?auto_80670 ) ( not ( = ?auto_80672 ?auto_80676 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80673 ?auto_80671 ?auto_80670 )
      ( DELIVER-3PKG-VERIFY ?auto_80671 ?auto_80672 ?auto_80673 ?auto_80670 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_80688 - OBJ
      ?auto_80689 - OBJ
      ?auto_80690 - OBJ
      ?auto_80687 - LOCATION
    )
    :vars
    (
      ?auto_80693 - OBJ
      ?auto_80692 - LOCATION
      ?auto_80694 - CITY
      ?auto_80691 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80689 ?auto_80688 ) ) ( not ( = ?auto_80690 ?auto_80688 ) ) ( not ( = ?auto_80690 ?auto_80689 ) ) ( not ( = ?auto_80688 ?auto_80693 ) ) ( IN-CITY ?auto_80692 ?auto_80694 ) ( IN-CITY ?auto_80687 ?auto_80694 ) ( not ( = ?auto_80687 ?auto_80692 ) ) ( OBJ-AT ?auto_80693 ?auto_80687 ) ( OBJ-AT ?auto_80688 ?auto_80692 ) ( TRUCK-AT ?auto_80691 ?auto_80687 ) ( not ( = ?auto_80690 ?auto_80693 ) ) ( IN-TRUCK ?auto_80690 ?auto_80691 ) ( OBJ-AT ?auto_80689 ?auto_80687 ) ( not ( = ?auto_80689 ?auto_80693 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80693 ?auto_80688 ?auto_80687 )
      ( DELIVER-3PKG-VERIFY ?auto_80688 ?auto_80689 ?auto_80690 ?auto_80687 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_80705 - OBJ
      ?auto_80706 - OBJ
      ?auto_80707 - OBJ
      ?auto_80704 - LOCATION
    )
    :vars
    (
      ?auto_80709 - LOCATION
      ?auto_80710 - CITY
      ?auto_80708 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80706 ?auto_80705 ) ) ( not ( = ?auto_80707 ?auto_80705 ) ) ( not ( = ?auto_80707 ?auto_80706 ) ) ( IN-CITY ?auto_80709 ?auto_80710 ) ( IN-CITY ?auto_80704 ?auto_80710 ) ( not ( = ?auto_80704 ?auto_80709 ) ) ( OBJ-AT ?auto_80707 ?auto_80704 ) ( OBJ-AT ?auto_80705 ?auto_80709 ) ( TRUCK-AT ?auto_80708 ?auto_80704 ) ( IN-TRUCK ?auto_80706 ?auto_80708 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80707 ?auto_80705 ?auto_80704 )
      ( DELIVER-3PKG-VERIFY ?auto_80705 ?auto_80706 ?auto_80707 ?auto_80704 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_80712 - OBJ
      ?auto_80713 - OBJ
      ?auto_80714 - OBJ
      ?auto_80711 - LOCATION
    )
    :vars
    (
      ?auto_80717 - OBJ
      ?auto_80716 - LOCATION
      ?auto_80718 - CITY
      ?auto_80715 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80713 ?auto_80712 ) ) ( not ( = ?auto_80714 ?auto_80712 ) ) ( not ( = ?auto_80714 ?auto_80713 ) ) ( not ( = ?auto_80712 ?auto_80717 ) ) ( IN-CITY ?auto_80716 ?auto_80718 ) ( IN-CITY ?auto_80711 ?auto_80718 ) ( not ( = ?auto_80711 ?auto_80716 ) ) ( OBJ-AT ?auto_80717 ?auto_80711 ) ( OBJ-AT ?auto_80712 ?auto_80716 ) ( TRUCK-AT ?auto_80715 ?auto_80711 ) ( not ( = ?auto_80713 ?auto_80717 ) ) ( IN-TRUCK ?auto_80713 ?auto_80715 ) ( OBJ-AT ?auto_80714 ?auto_80711 ) ( not ( = ?auto_80714 ?auto_80717 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80717 ?auto_80712 ?auto_80711 )
      ( DELIVER-3PKG-VERIFY ?auto_80712 ?auto_80713 ?auto_80714 ?auto_80711 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_80849 - OBJ
      ?auto_80850 - OBJ
      ?auto_80851 - OBJ
      ?auto_80852 - OBJ
      ?auto_80848 - LOCATION
    )
    :vars
    (
      ?auto_80854 - LOCATION
      ?auto_80855 - CITY
      ?auto_80853 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80850 ?auto_80849 ) ) ( not ( = ?auto_80851 ?auto_80849 ) ) ( not ( = ?auto_80851 ?auto_80850 ) ) ( not ( = ?auto_80852 ?auto_80849 ) ) ( not ( = ?auto_80852 ?auto_80850 ) ) ( not ( = ?auto_80852 ?auto_80851 ) ) ( IN-CITY ?auto_80854 ?auto_80855 ) ( IN-CITY ?auto_80848 ?auto_80855 ) ( not ( = ?auto_80848 ?auto_80854 ) ) ( OBJ-AT ?auto_80849 ?auto_80848 ) ( OBJ-AT ?auto_80852 ?auto_80854 ) ( TRUCK-AT ?auto_80853 ?auto_80848 ) ( IN-TRUCK ?auto_80851 ?auto_80853 ) ( OBJ-AT ?auto_80850 ?auto_80848 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80849 ?auto_80852 ?auto_80848 )
      ( DELIVER-4PKG-VERIFY ?auto_80849 ?auto_80850 ?auto_80851 ?auto_80852 ?auto_80848 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_80875 - OBJ
      ?auto_80876 - OBJ
      ?auto_80877 - OBJ
      ?auto_80878 - OBJ
      ?auto_80874 - LOCATION
    )
    :vars
    (
      ?auto_80880 - LOCATION
      ?auto_80881 - CITY
      ?auto_80879 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80876 ?auto_80875 ) ) ( not ( = ?auto_80877 ?auto_80875 ) ) ( not ( = ?auto_80877 ?auto_80876 ) ) ( not ( = ?auto_80878 ?auto_80875 ) ) ( not ( = ?auto_80878 ?auto_80876 ) ) ( not ( = ?auto_80878 ?auto_80877 ) ) ( IN-CITY ?auto_80880 ?auto_80881 ) ( IN-CITY ?auto_80874 ?auto_80881 ) ( not ( = ?auto_80874 ?auto_80880 ) ) ( OBJ-AT ?auto_80875 ?auto_80874 ) ( OBJ-AT ?auto_80877 ?auto_80880 ) ( TRUCK-AT ?auto_80879 ?auto_80874 ) ( IN-TRUCK ?auto_80878 ?auto_80879 ) ( OBJ-AT ?auto_80876 ?auto_80874 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80875 ?auto_80877 ?auto_80874 )
      ( DELIVER-4PKG-VERIFY ?auto_80875 ?auto_80876 ?auto_80877 ?auto_80878 ?auto_80874 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_80900 - OBJ
      ?auto_80901 - OBJ
      ?auto_80902 - OBJ
      ?auto_80903 - OBJ
      ?auto_80899 - LOCATION
    )
    :vars
    (
      ?auto_80905 - LOCATION
      ?auto_80906 - CITY
      ?auto_80904 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80901 ?auto_80900 ) ) ( not ( = ?auto_80902 ?auto_80900 ) ) ( not ( = ?auto_80902 ?auto_80901 ) ) ( not ( = ?auto_80903 ?auto_80900 ) ) ( not ( = ?auto_80903 ?auto_80901 ) ) ( not ( = ?auto_80903 ?auto_80902 ) ) ( IN-CITY ?auto_80905 ?auto_80906 ) ( IN-CITY ?auto_80899 ?auto_80906 ) ( not ( = ?auto_80899 ?auto_80905 ) ) ( OBJ-AT ?auto_80900 ?auto_80899 ) ( OBJ-AT ?auto_80903 ?auto_80905 ) ( TRUCK-AT ?auto_80904 ?auto_80899 ) ( IN-TRUCK ?auto_80901 ?auto_80904 ) ( OBJ-AT ?auto_80902 ?auto_80899 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80900 ?auto_80903 ?auto_80899 )
      ( DELIVER-4PKG-VERIFY ?auto_80900 ?auto_80901 ?auto_80902 ?auto_80903 ?auto_80899 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_80924 - OBJ
      ?auto_80925 - OBJ
      ?auto_80926 - OBJ
      ?auto_80927 - OBJ
      ?auto_80923 - LOCATION
    )
    :vars
    (
      ?auto_80929 - LOCATION
      ?auto_80930 - CITY
      ?auto_80928 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_80925 ?auto_80924 ) ) ( not ( = ?auto_80926 ?auto_80924 ) ) ( not ( = ?auto_80926 ?auto_80925 ) ) ( not ( = ?auto_80927 ?auto_80924 ) ) ( not ( = ?auto_80927 ?auto_80925 ) ) ( not ( = ?auto_80927 ?auto_80926 ) ) ( IN-CITY ?auto_80929 ?auto_80930 ) ( IN-CITY ?auto_80923 ?auto_80930 ) ( not ( = ?auto_80923 ?auto_80929 ) ) ( OBJ-AT ?auto_80924 ?auto_80923 ) ( OBJ-AT ?auto_80926 ?auto_80929 ) ( TRUCK-AT ?auto_80928 ?auto_80923 ) ( IN-TRUCK ?auto_80925 ?auto_80928 ) ( OBJ-AT ?auto_80927 ?auto_80923 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_80924 ?auto_80926 ?auto_80923 )
      ( DELIVER-4PKG-VERIFY ?auto_80924 ?auto_80925 ?auto_80926 ?auto_80927 ?auto_80923 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_81001 - OBJ
      ?auto_81002 - OBJ
      ?auto_81003 - OBJ
      ?auto_81004 - OBJ
      ?auto_81000 - LOCATION
    )
    :vars
    (
      ?auto_81006 - LOCATION
      ?auto_81007 - CITY
      ?auto_81005 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_81002 ?auto_81001 ) ) ( not ( = ?auto_81003 ?auto_81001 ) ) ( not ( = ?auto_81003 ?auto_81002 ) ) ( not ( = ?auto_81004 ?auto_81001 ) ) ( not ( = ?auto_81004 ?auto_81002 ) ) ( not ( = ?auto_81004 ?auto_81003 ) ) ( IN-CITY ?auto_81006 ?auto_81007 ) ( IN-CITY ?auto_81000 ?auto_81007 ) ( not ( = ?auto_81000 ?auto_81006 ) ) ( OBJ-AT ?auto_81001 ?auto_81000 ) ( OBJ-AT ?auto_81002 ?auto_81006 ) ( TRUCK-AT ?auto_81005 ?auto_81000 ) ( IN-TRUCK ?auto_81004 ?auto_81005 ) ( OBJ-AT ?auto_81003 ?auto_81000 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_81001 ?auto_81002 ?auto_81000 )
      ( DELIVER-4PKG-VERIFY ?auto_81001 ?auto_81002 ?auto_81003 ?auto_81004 ?auto_81000 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_81026 - OBJ
      ?auto_81027 - OBJ
      ?auto_81028 - OBJ
      ?auto_81029 - OBJ
      ?auto_81025 - LOCATION
    )
    :vars
    (
      ?auto_81031 - LOCATION
      ?auto_81032 - CITY
      ?auto_81030 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_81027 ?auto_81026 ) ) ( not ( = ?auto_81028 ?auto_81026 ) ) ( not ( = ?auto_81028 ?auto_81027 ) ) ( not ( = ?auto_81029 ?auto_81026 ) ) ( not ( = ?auto_81029 ?auto_81027 ) ) ( not ( = ?auto_81029 ?auto_81028 ) ) ( IN-CITY ?auto_81031 ?auto_81032 ) ( IN-CITY ?auto_81025 ?auto_81032 ) ( not ( = ?auto_81025 ?auto_81031 ) ) ( OBJ-AT ?auto_81026 ?auto_81025 ) ( OBJ-AT ?auto_81027 ?auto_81031 ) ( TRUCK-AT ?auto_81030 ?auto_81025 ) ( IN-TRUCK ?auto_81028 ?auto_81030 ) ( OBJ-AT ?auto_81029 ?auto_81025 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_81026 ?auto_81027 ?auto_81025 )
      ( DELIVER-4PKG-VERIFY ?auto_81026 ?auto_81027 ?auto_81028 ?auto_81029 ?auto_81025 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_81103 - OBJ
      ?auto_81104 - OBJ
      ?auto_81105 - OBJ
      ?auto_81106 - OBJ
      ?auto_81102 - LOCATION
    )
    :vars
    (
      ?auto_81108 - LOCATION
      ?auto_81109 - CITY
      ?auto_81107 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_81104 ?auto_81103 ) ) ( not ( = ?auto_81105 ?auto_81103 ) ) ( not ( = ?auto_81105 ?auto_81104 ) ) ( not ( = ?auto_81106 ?auto_81103 ) ) ( not ( = ?auto_81106 ?auto_81104 ) ) ( not ( = ?auto_81106 ?auto_81105 ) ) ( IN-CITY ?auto_81108 ?auto_81109 ) ( IN-CITY ?auto_81102 ?auto_81109 ) ( not ( = ?auto_81102 ?auto_81108 ) ) ( OBJ-AT ?auto_81104 ?auto_81102 ) ( OBJ-AT ?auto_81106 ?auto_81108 ) ( TRUCK-AT ?auto_81107 ?auto_81102 ) ( IN-TRUCK ?auto_81105 ?auto_81107 ) ( OBJ-AT ?auto_81103 ?auto_81102 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_81104 ?auto_81106 ?auto_81102 )
      ( DELIVER-4PKG-VERIFY ?auto_81103 ?auto_81104 ?auto_81105 ?auto_81106 ?auto_81102 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_81129 - OBJ
      ?auto_81130 - OBJ
      ?auto_81131 - OBJ
      ?auto_81132 - OBJ
      ?auto_81128 - LOCATION
    )
    :vars
    (
      ?auto_81134 - LOCATION
      ?auto_81135 - CITY
      ?auto_81133 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_81130 ?auto_81129 ) ) ( not ( = ?auto_81131 ?auto_81129 ) ) ( not ( = ?auto_81131 ?auto_81130 ) ) ( not ( = ?auto_81132 ?auto_81129 ) ) ( not ( = ?auto_81132 ?auto_81130 ) ) ( not ( = ?auto_81132 ?auto_81131 ) ) ( IN-CITY ?auto_81134 ?auto_81135 ) ( IN-CITY ?auto_81128 ?auto_81135 ) ( not ( = ?auto_81128 ?auto_81134 ) ) ( OBJ-AT ?auto_81130 ?auto_81128 ) ( OBJ-AT ?auto_81131 ?auto_81134 ) ( TRUCK-AT ?auto_81133 ?auto_81128 ) ( IN-TRUCK ?auto_81132 ?auto_81133 ) ( OBJ-AT ?auto_81129 ?auto_81128 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_81130 ?auto_81131 ?auto_81128 )
      ( DELIVER-4PKG-VERIFY ?auto_81129 ?auto_81130 ?auto_81131 ?auto_81132 ?auto_81128 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_81212 - OBJ
      ?auto_81213 - OBJ
      ?auto_81214 - OBJ
      ?auto_81215 - OBJ
      ?auto_81211 - LOCATION
    )
    :vars
    (
      ?auto_81217 - LOCATION
      ?auto_81218 - CITY
      ?auto_81216 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_81213 ?auto_81212 ) ) ( not ( = ?auto_81214 ?auto_81212 ) ) ( not ( = ?auto_81214 ?auto_81213 ) ) ( not ( = ?auto_81215 ?auto_81212 ) ) ( not ( = ?auto_81215 ?auto_81213 ) ) ( not ( = ?auto_81215 ?auto_81214 ) ) ( IN-CITY ?auto_81217 ?auto_81218 ) ( IN-CITY ?auto_81211 ?auto_81218 ) ( not ( = ?auto_81211 ?auto_81217 ) ) ( OBJ-AT ?auto_81214 ?auto_81211 ) ( OBJ-AT ?auto_81215 ?auto_81217 ) ( TRUCK-AT ?auto_81216 ?auto_81211 ) ( IN-TRUCK ?auto_81213 ?auto_81216 ) ( OBJ-AT ?auto_81212 ?auto_81211 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_81214 ?auto_81215 ?auto_81211 )
      ( DELIVER-4PKG-VERIFY ?auto_81212 ?auto_81213 ?auto_81214 ?auto_81215 ?auto_81211 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_81238 - OBJ
      ?auto_81239 - OBJ
      ?auto_81240 - OBJ
      ?auto_81241 - OBJ
      ?auto_81237 - LOCATION
    )
    :vars
    (
      ?auto_81243 - LOCATION
      ?auto_81244 - CITY
      ?auto_81242 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_81239 ?auto_81238 ) ) ( not ( = ?auto_81240 ?auto_81238 ) ) ( not ( = ?auto_81240 ?auto_81239 ) ) ( not ( = ?auto_81241 ?auto_81238 ) ) ( not ( = ?auto_81241 ?auto_81239 ) ) ( not ( = ?auto_81241 ?auto_81240 ) ) ( IN-CITY ?auto_81243 ?auto_81244 ) ( IN-CITY ?auto_81237 ?auto_81244 ) ( not ( = ?auto_81237 ?auto_81243 ) ) ( OBJ-AT ?auto_81241 ?auto_81237 ) ( OBJ-AT ?auto_81240 ?auto_81243 ) ( TRUCK-AT ?auto_81242 ?auto_81237 ) ( IN-TRUCK ?auto_81239 ?auto_81242 ) ( OBJ-AT ?auto_81238 ?auto_81237 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_81241 ?auto_81240 ?auto_81237 )
      ( DELIVER-4PKG-VERIFY ?auto_81238 ?auto_81239 ?auto_81240 ?auto_81241 ?auto_81237 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_81291 - OBJ
      ?auto_81292 - OBJ
      ?auto_81293 - OBJ
      ?auto_81294 - OBJ
      ?auto_81290 - LOCATION
    )
    :vars
    (
      ?auto_81296 - LOCATION
      ?auto_81297 - CITY
      ?auto_81295 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_81292 ?auto_81291 ) ) ( not ( = ?auto_81293 ?auto_81291 ) ) ( not ( = ?auto_81293 ?auto_81292 ) ) ( not ( = ?auto_81294 ?auto_81291 ) ) ( not ( = ?auto_81294 ?auto_81292 ) ) ( not ( = ?auto_81294 ?auto_81293 ) ) ( IN-CITY ?auto_81296 ?auto_81297 ) ( IN-CITY ?auto_81290 ?auto_81297 ) ( not ( = ?auto_81290 ?auto_81296 ) ) ( OBJ-AT ?auto_81293 ?auto_81290 ) ( OBJ-AT ?auto_81292 ?auto_81296 ) ( TRUCK-AT ?auto_81295 ?auto_81290 ) ( IN-TRUCK ?auto_81294 ?auto_81295 ) ( OBJ-AT ?auto_81291 ?auto_81290 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_81293 ?auto_81292 ?auto_81290 )
      ( DELIVER-4PKG-VERIFY ?auto_81291 ?auto_81292 ?auto_81293 ?auto_81294 ?auto_81290 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_81346 - OBJ
      ?auto_81347 - OBJ
      ?auto_81348 - OBJ
      ?auto_81349 - OBJ
      ?auto_81345 - LOCATION
    )
    :vars
    (
      ?auto_81351 - LOCATION
      ?auto_81352 - CITY
      ?auto_81350 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_81347 ?auto_81346 ) ) ( not ( = ?auto_81348 ?auto_81346 ) ) ( not ( = ?auto_81348 ?auto_81347 ) ) ( not ( = ?auto_81349 ?auto_81346 ) ) ( not ( = ?auto_81349 ?auto_81347 ) ) ( not ( = ?auto_81349 ?auto_81348 ) ) ( IN-CITY ?auto_81351 ?auto_81352 ) ( IN-CITY ?auto_81345 ?auto_81352 ) ( not ( = ?auto_81345 ?auto_81351 ) ) ( OBJ-AT ?auto_81349 ?auto_81345 ) ( OBJ-AT ?auto_81347 ?auto_81351 ) ( TRUCK-AT ?auto_81350 ?auto_81345 ) ( IN-TRUCK ?auto_81348 ?auto_81350 ) ( OBJ-AT ?auto_81346 ?auto_81345 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_81349 ?auto_81347 ?auto_81345 )
      ( DELIVER-4PKG-VERIFY ?auto_81346 ?auto_81347 ?auto_81348 ?auto_81349 ?auto_81345 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_81427 - OBJ
      ?auto_81428 - OBJ
      ?auto_81429 - OBJ
      ?auto_81430 - OBJ
      ?auto_81426 - LOCATION
    )
    :vars
    (
      ?auto_81432 - LOCATION
      ?auto_81433 - CITY
      ?auto_81431 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_81428 ?auto_81427 ) ) ( not ( = ?auto_81429 ?auto_81427 ) ) ( not ( = ?auto_81429 ?auto_81428 ) ) ( not ( = ?auto_81430 ?auto_81427 ) ) ( not ( = ?auto_81430 ?auto_81428 ) ) ( not ( = ?auto_81430 ?auto_81429 ) ) ( IN-CITY ?auto_81432 ?auto_81433 ) ( IN-CITY ?auto_81426 ?auto_81433 ) ( not ( = ?auto_81426 ?auto_81432 ) ) ( OBJ-AT ?auto_81428 ?auto_81426 ) ( OBJ-AT ?auto_81430 ?auto_81432 ) ( TRUCK-AT ?auto_81431 ?auto_81426 ) ( IN-TRUCK ?auto_81427 ?auto_81431 ) ( OBJ-AT ?auto_81429 ?auto_81426 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_81428 ?auto_81430 ?auto_81426 )
      ( DELIVER-4PKG-VERIFY ?auto_81427 ?auto_81428 ?auto_81429 ?auto_81430 ?auto_81426 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_81451 - OBJ
      ?auto_81452 - OBJ
      ?auto_81453 - OBJ
      ?auto_81454 - OBJ
      ?auto_81450 - LOCATION
    )
    :vars
    (
      ?auto_81456 - LOCATION
      ?auto_81457 - CITY
      ?auto_81455 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_81452 ?auto_81451 ) ) ( not ( = ?auto_81453 ?auto_81451 ) ) ( not ( = ?auto_81453 ?auto_81452 ) ) ( not ( = ?auto_81454 ?auto_81451 ) ) ( not ( = ?auto_81454 ?auto_81452 ) ) ( not ( = ?auto_81454 ?auto_81453 ) ) ( IN-CITY ?auto_81456 ?auto_81457 ) ( IN-CITY ?auto_81450 ?auto_81457 ) ( not ( = ?auto_81450 ?auto_81456 ) ) ( OBJ-AT ?auto_81452 ?auto_81450 ) ( OBJ-AT ?auto_81453 ?auto_81456 ) ( TRUCK-AT ?auto_81455 ?auto_81450 ) ( IN-TRUCK ?auto_81451 ?auto_81455 ) ( OBJ-AT ?auto_81454 ?auto_81450 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_81452 ?auto_81453 ?auto_81450 )
      ( DELIVER-4PKG-VERIFY ?auto_81451 ?auto_81452 ?auto_81453 ?auto_81454 ?auto_81450 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_81475 - OBJ
      ?auto_81476 - OBJ
      ?auto_81477 - OBJ
      ?auto_81478 - OBJ
      ?auto_81474 - LOCATION
    )
    :vars
    (
      ?auto_81480 - LOCATION
      ?auto_81481 - CITY
      ?auto_81479 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_81476 ?auto_81475 ) ) ( not ( = ?auto_81477 ?auto_81475 ) ) ( not ( = ?auto_81477 ?auto_81476 ) ) ( not ( = ?auto_81478 ?auto_81475 ) ) ( not ( = ?auto_81478 ?auto_81476 ) ) ( not ( = ?auto_81478 ?auto_81477 ) ) ( IN-CITY ?auto_81480 ?auto_81481 ) ( IN-CITY ?auto_81474 ?auto_81481 ) ( not ( = ?auto_81474 ?auto_81480 ) ) ( OBJ-AT ?auto_81477 ?auto_81474 ) ( OBJ-AT ?auto_81478 ?auto_81480 ) ( TRUCK-AT ?auto_81479 ?auto_81474 ) ( IN-TRUCK ?auto_81475 ?auto_81479 ) ( OBJ-AT ?auto_81476 ?auto_81474 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_81477 ?auto_81478 ?auto_81474 )
      ( DELIVER-4PKG-VERIFY ?auto_81475 ?auto_81476 ?auto_81477 ?auto_81478 ?auto_81474 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_81501 - OBJ
      ?auto_81502 - OBJ
      ?auto_81503 - OBJ
      ?auto_81504 - OBJ
      ?auto_81500 - LOCATION
    )
    :vars
    (
      ?auto_81506 - LOCATION
      ?auto_81507 - CITY
      ?auto_81505 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_81502 ?auto_81501 ) ) ( not ( = ?auto_81503 ?auto_81501 ) ) ( not ( = ?auto_81503 ?auto_81502 ) ) ( not ( = ?auto_81504 ?auto_81501 ) ) ( not ( = ?auto_81504 ?auto_81502 ) ) ( not ( = ?auto_81504 ?auto_81503 ) ) ( IN-CITY ?auto_81506 ?auto_81507 ) ( IN-CITY ?auto_81500 ?auto_81507 ) ( not ( = ?auto_81500 ?auto_81506 ) ) ( OBJ-AT ?auto_81504 ?auto_81500 ) ( OBJ-AT ?auto_81503 ?auto_81506 ) ( TRUCK-AT ?auto_81505 ?auto_81500 ) ( IN-TRUCK ?auto_81501 ?auto_81505 ) ( OBJ-AT ?auto_81502 ?auto_81500 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_81504 ?auto_81503 ?auto_81500 )
      ( DELIVER-4PKG-VERIFY ?auto_81501 ?auto_81502 ?auto_81503 ?auto_81504 ?auto_81500 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_81605 - OBJ
      ?auto_81606 - OBJ
      ?auto_81607 - OBJ
      ?auto_81608 - OBJ
      ?auto_81604 - LOCATION
    )
    :vars
    (
      ?auto_81610 - LOCATION
      ?auto_81611 - CITY
      ?auto_81609 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_81606 ?auto_81605 ) ) ( not ( = ?auto_81607 ?auto_81605 ) ) ( not ( = ?auto_81607 ?auto_81606 ) ) ( not ( = ?auto_81608 ?auto_81605 ) ) ( not ( = ?auto_81608 ?auto_81606 ) ) ( not ( = ?auto_81608 ?auto_81607 ) ) ( IN-CITY ?auto_81610 ?auto_81611 ) ( IN-CITY ?auto_81604 ?auto_81611 ) ( not ( = ?auto_81604 ?auto_81610 ) ) ( OBJ-AT ?auto_81607 ?auto_81604 ) ( OBJ-AT ?auto_81606 ?auto_81610 ) ( TRUCK-AT ?auto_81609 ?auto_81604 ) ( IN-TRUCK ?auto_81605 ?auto_81609 ) ( OBJ-AT ?auto_81608 ?auto_81604 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_81607 ?auto_81606 ?auto_81604 )
      ( DELIVER-4PKG-VERIFY ?auto_81605 ?auto_81606 ?auto_81607 ?auto_81608 ?auto_81604 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_81629 - OBJ
      ?auto_81630 - OBJ
      ?auto_81631 - OBJ
      ?auto_81632 - OBJ
      ?auto_81628 - LOCATION
    )
    :vars
    (
      ?auto_81634 - LOCATION
      ?auto_81635 - CITY
      ?auto_81633 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_81630 ?auto_81629 ) ) ( not ( = ?auto_81631 ?auto_81629 ) ) ( not ( = ?auto_81631 ?auto_81630 ) ) ( not ( = ?auto_81632 ?auto_81629 ) ) ( not ( = ?auto_81632 ?auto_81630 ) ) ( not ( = ?auto_81632 ?auto_81631 ) ) ( IN-CITY ?auto_81634 ?auto_81635 ) ( IN-CITY ?auto_81628 ?auto_81635 ) ( not ( = ?auto_81628 ?auto_81634 ) ) ( OBJ-AT ?auto_81632 ?auto_81628 ) ( OBJ-AT ?auto_81630 ?auto_81634 ) ( TRUCK-AT ?auto_81633 ?auto_81628 ) ( IN-TRUCK ?auto_81629 ?auto_81633 ) ( OBJ-AT ?auto_81631 ?auto_81628 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_81632 ?auto_81630 ?auto_81628 )
      ( DELIVER-4PKG-VERIFY ?auto_81629 ?auto_81630 ?auto_81631 ?auto_81632 ?auto_81628 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_81787 - OBJ
      ?auto_81788 - OBJ
      ?auto_81789 - OBJ
      ?auto_81790 - OBJ
      ?auto_81786 - LOCATION
    )
    :vars
    (
      ?auto_81792 - LOCATION
      ?auto_81793 - CITY
      ?auto_81791 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_81788 ?auto_81787 ) ) ( not ( = ?auto_81789 ?auto_81787 ) ) ( not ( = ?auto_81789 ?auto_81788 ) ) ( not ( = ?auto_81790 ?auto_81787 ) ) ( not ( = ?auto_81790 ?auto_81788 ) ) ( not ( = ?auto_81790 ?auto_81789 ) ) ( IN-CITY ?auto_81792 ?auto_81793 ) ( IN-CITY ?auto_81786 ?auto_81793 ) ( not ( = ?auto_81786 ?auto_81792 ) ) ( OBJ-AT ?auto_81788 ?auto_81786 ) ( OBJ-AT ?auto_81787 ?auto_81792 ) ( TRUCK-AT ?auto_81791 ?auto_81786 ) ( IN-TRUCK ?auto_81790 ?auto_81791 ) ( OBJ-AT ?auto_81789 ?auto_81786 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_81788 ?auto_81787 ?auto_81786 )
      ( DELIVER-4PKG-VERIFY ?auto_81787 ?auto_81788 ?auto_81789 ?auto_81790 ?auto_81786 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_81812 - OBJ
      ?auto_81813 - OBJ
      ?auto_81814 - OBJ
      ?auto_81815 - OBJ
      ?auto_81811 - LOCATION
    )
    :vars
    (
      ?auto_81817 - LOCATION
      ?auto_81818 - CITY
      ?auto_81816 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_81813 ?auto_81812 ) ) ( not ( = ?auto_81814 ?auto_81812 ) ) ( not ( = ?auto_81814 ?auto_81813 ) ) ( not ( = ?auto_81815 ?auto_81812 ) ) ( not ( = ?auto_81815 ?auto_81813 ) ) ( not ( = ?auto_81815 ?auto_81814 ) ) ( IN-CITY ?auto_81817 ?auto_81818 ) ( IN-CITY ?auto_81811 ?auto_81818 ) ( not ( = ?auto_81811 ?auto_81817 ) ) ( OBJ-AT ?auto_81813 ?auto_81811 ) ( OBJ-AT ?auto_81812 ?auto_81817 ) ( TRUCK-AT ?auto_81816 ?auto_81811 ) ( IN-TRUCK ?auto_81814 ?auto_81816 ) ( OBJ-AT ?auto_81815 ?auto_81811 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_81813 ?auto_81812 ?auto_81811 )
      ( DELIVER-4PKG-VERIFY ?auto_81812 ?auto_81813 ?auto_81814 ?auto_81815 ?auto_81811 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_81889 - OBJ
      ?auto_81890 - OBJ
      ?auto_81891 - OBJ
      ?auto_81892 - OBJ
      ?auto_81888 - LOCATION
    )
    :vars
    (
      ?auto_81894 - LOCATION
      ?auto_81895 - CITY
      ?auto_81893 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_81890 ?auto_81889 ) ) ( not ( = ?auto_81891 ?auto_81889 ) ) ( not ( = ?auto_81891 ?auto_81890 ) ) ( not ( = ?auto_81892 ?auto_81889 ) ) ( not ( = ?auto_81892 ?auto_81890 ) ) ( not ( = ?auto_81892 ?auto_81891 ) ) ( IN-CITY ?auto_81894 ?auto_81895 ) ( IN-CITY ?auto_81888 ?auto_81895 ) ( not ( = ?auto_81888 ?auto_81894 ) ) ( OBJ-AT ?auto_81891 ?auto_81888 ) ( OBJ-AT ?auto_81889 ?auto_81894 ) ( TRUCK-AT ?auto_81893 ?auto_81888 ) ( IN-TRUCK ?auto_81892 ?auto_81893 ) ( OBJ-AT ?auto_81890 ?auto_81888 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_81891 ?auto_81889 ?auto_81888 )
      ( DELIVER-4PKG-VERIFY ?auto_81889 ?auto_81890 ?auto_81891 ?auto_81892 ?auto_81888 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_81944 - OBJ
      ?auto_81945 - OBJ
      ?auto_81946 - OBJ
      ?auto_81947 - OBJ
      ?auto_81943 - LOCATION
    )
    :vars
    (
      ?auto_81949 - LOCATION
      ?auto_81950 - CITY
      ?auto_81948 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_81945 ?auto_81944 ) ) ( not ( = ?auto_81946 ?auto_81944 ) ) ( not ( = ?auto_81946 ?auto_81945 ) ) ( not ( = ?auto_81947 ?auto_81944 ) ) ( not ( = ?auto_81947 ?auto_81945 ) ) ( not ( = ?auto_81947 ?auto_81946 ) ) ( IN-CITY ?auto_81949 ?auto_81950 ) ( IN-CITY ?auto_81943 ?auto_81950 ) ( not ( = ?auto_81943 ?auto_81949 ) ) ( OBJ-AT ?auto_81947 ?auto_81943 ) ( OBJ-AT ?auto_81944 ?auto_81949 ) ( TRUCK-AT ?auto_81948 ?auto_81943 ) ( IN-TRUCK ?auto_81946 ?auto_81948 ) ( OBJ-AT ?auto_81945 ?auto_81943 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_81947 ?auto_81944 ?auto_81943 )
      ( DELIVER-4PKG-VERIFY ?auto_81944 ?auto_81945 ?auto_81946 ?auto_81947 ?auto_81943 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_82025 - OBJ
      ?auto_82026 - OBJ
      ?auto_82027 - OBJ
      ?auto_82028 - OBJ
      ?auto_82024 - LOCATION
    )
    :vars
    (
      ?auto_82030 - LOCATION
      ?auto_82031 - CITY
      ?auto_82029 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_82026 ?auto_82025 ) ) ( not ( = ?auto_82027 ?auto_82025 ) ) ( not ( = ?auto_82027 ?auto_82026 ) ) ( not ( = ?auto_82028 ?auto_82025 ) ) ( not ( = ?auto_82028 ?auto_82026 ) ) ( not ( = ?auto_82028 ?auto_82027 ) ) ( IN-CITY ?auto_82030 ?auto_82031 ) ( IN-CITY ?auto_82024 ?auto_82031 ) ( not ( = ?auto_82024 ?auto_82030 ) ) ( OBJ-AT ?auto_82027 ?auto_82024 ) ( OBJ-AT ?auto_82025 ?auto_82030 ) ( TRUCK-AT ?auto_82029 ?auto_82024 ) ( IN-TRUCK ?auto_82026 ?auto_82029 ) ( OBJ-AT ?auto_82028 ?auto_82024 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82027 ?auto_82025 ?auto_82024 )
      ( DELIVER-4PKG-VERIFY ?auto_82025 ?auto_82026 ?auto_82027 ?auto_82028 ?auto_82024 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_82049 - OBJ
      ?auto_82050 - OBJ
      ?auto_82051 - OBJ
      ?auto_82052 - OBJ
      ?auto_82048 - LOCATION
    )
    :vars
    (
      ?auto_82054 - LOCATION
      ?auto_82055 - CITY
      ?auto_82053 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_82050 ?auto_82049 ) ) ( not ( = ?auto_82051 ?auto_82049 ) ) ( not ( = ?auto_82051 ?auto_82050 ) ) ( not ( = ?auto_82052 ?auto_82049 ) ) ( not ( = ?auto_82052 ?auto_82050 ) ) ( not ( = ?auto_82052 ?auto_82051 ) ) ( IN-CITY ?auto_82054 ?auto_82055 ) ( IN-CITY ?auto_82048 ?auto_82055 ) ( not ( = ?auto_82048 ?auto_82054 ) ) ( OBJ-AT ?auto_82052 ?auto_82048 ) ( OBJ-AT ?auto_82049 ?auto_82054 ) ( TRUCK-AT ?auto_82053 ?auto_82048 ) ( IN-TRUCK ?auto_82050 ?auto_82053 ) ( OBJ-AT ?auto_82051 ?auto_82048 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82052 ?auto_82049 ?auto_82048 )
      ( DELIVER-4PKG-VERIFY ?auto_82049 ?auto_82050 ?auto_82051 ?auto_82052 ?auto_82048 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_82300 - OBJ
      ?auto_82299 - LOCATION
    )
    :vars
    (
      ?auto_82304 - OBJ
      ?auto_82302 - LOCATION
      ?auto_82305 - CITY
      ?auto_82303 - OBJ
      ?auto_82301 - TRUCK
      ?auto_82306 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82300 ?auto_82304 ) ) ( IN-CITY ?auto_82302 ?auto_82305 ) ( IN-CITY ?auto_82299 ?auto_82305 ) ( not ( = ?auto_82299 ?auto_82302 ) ) ( OBJ-AT ?auto_82304 ?auto_82299 ) ( OBJ-AT ?auto_82300 ?auto_82302 ) ( not ( = ?auto_82303 ?auto_82304 ) ) ( IN-TRUCK ?auto_82303 ?auto_82301 ) ( not ( = ?auto_82300 ?auto_82303 ) ) ( TRUCK-AT ?auto_82301 ?auto_82306 ) ( IN-CITY ?auto_82306 ?auto_82305 ) ( not ( = ?auto_82299 ?auto_82306 ) ) ( not ( = ?auto_82302 ?auto_82306 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_82301 ?auto_82306 ?auto_82299 ?auto_82305 )
      ( DELIVER-2PKG ?auto_82304 ?auto_82300 ?auto_82299 )
      ( DELIVER-1PKG-VERIFY ?auto_82300 ?auto_82299 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_82308 - OBJ
      ?auto_82309 - OBJ
      ?auto_82307 - LOCATION
    )
    :vars
    (
      ?auto_82312 - LOCATION
      ?auto_82313 - CITY
      ?auto_82311 - OBJ
      ?auto_82310 - TRUCK
      ?auto_82314 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82309 ?auto_82308 ) ) ( IN-CITY ?auto_82312 ?auto_82313 ) ( IN-CITY ?auto_82307 ?auto_82313 ) ( not ( = ?auto_82307 ?auto_82312 ) ) ( OBJ-AT ?auto_82308 ?auto_82307 ) ( OBJ-AT ?auto_82309 ?auto_82312 ) ( not ( = ?auto_82311 ?auto_82308 ) ) ( IN-TRUCK ?auto_82311 ?auto_82310 ) ( not ( = ?auto_82309 ?auto_82311 ) ) ( TRUCK-AT ?auto_82310 ?auto_82314 ) ( IN-CITY ?auto_82314 ?auto_82313 ) ( not ( = ?auto_82307 ?auto_82314 ) ) ( not ( = ?auto_82312 ?auto_82314 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_82309 ?auto_82307 )
      ( DELIVER-2PKG-VERIFY ?auto_82308 ?auto_82309 ?auto_82307 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_82316 - OBJ
      ?auto_82317 - OBJ
      ?auto_82315 - LOCATION
    )
    :vars
    (
      ?auto_82323 - OBJ
      ?auto_82322 - LOCATION
      ?auto_82321 - CITY
      ?auto_82319 - OBJ
      ?auto_82318 - TRUCK
      ?auto_82320 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82317 ?auto_82316 ) ) ( not ( = ?auto_82317 ?auto_82323 ) ) ( IN-CITY ?auto_82322 ?auto_82321 ) ( IN-CITY ?auto_82315 ?auto_82321 ) ( not ( = ?auto_82315 ?auto_82322 ) ) ( OBJ-AT ?auto_82323 ?auto_82315 ) ( OBJ-AT ?auto_82317 ?auto_82322 ) ( not ( = ?auto_82319 ?auto_82323 ) ) ( IN-TRUCK ?auto_82319 ?auto_82318 ) ( not ( = ?auto_82317 ?auto_82319 ) ) ( TRUCK-AT ?auto_82318 ?auto_82320 ) ( IN-CITY ?auto_82320 ?auto_82321 ) ( not ( = ?auto_82315 ?auto_82320 ) ) ( not ( = ?auto_82322 ?auto_82320 ) ) ( OBJ-AT ?auto_82316 ?auto_82315 ) ( not ( = ?auto_82316 ?auto_82323 ) ) ( not ( = ?auto_82316 ?auto_82319 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82323 ?auto_82317 ?auto_82315 )
      ( DELIVER-2PKG-VERIFY ?auto_82316 ?auto_82317 ?auto_82315 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_82325 - OBJ
      ?auto_82326 - OBJ
      ?auto_82324 - LOCATION
    )
    :vars
    (
      ?auto_82331 - OBJ
      ?auto_82330 - LOCATION
      ?auto_82329 - CITY
      ?auto_82327 - TRUCK
      ?auto_82328 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82326 ?auto_82325 ) ) ( not ( = ?auto_82326 ?auto_82331 ) ) ( IN-CITY ?auto_82330 ?auto_82329 ) ( IN-CITY ?auto_82324 ?auto_82329 ) ( not ( = ?auto_82324 ?auto_82330 ) ) ( OBJ-AT ?auto_82331 ?auto_82324 ) ( OBJ-AT ?auto_82326 ?auto_82330 ) ( not ( = ?auto_82325 ?auto_82331 ) ) ( IN-TRUCK ?auto_82325 ?auto_82327 ) ( TRUCK-AT ?auto_82327 ?auto_82328 ) ( IN-CITY ?auto_82328 ?auto_82329 ) ( not ( = ?auto_82324 ?auto_82328 ) ) ( not ( = ?auto_82330 ?auto_82328 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82331 ?auto_82326 ?auto_82324 )
      ( DELIVER-2PKG-VERIFY ?auto_82325 ?auto_82326 ?auto_82324 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_82333 - OBJ
      ?auto_82334 - OBJ
      ?auto_82332 - LOCATION
    )
    :vars
    (
      ?auto_82339 - LOCATION
      ?auto_82338 - CITY
      ?auto_82336 - OBJ
      ?auto_82335 - TRUCK
      ?auto_82337 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82334 ?auto_82333 ) ) ( IN-CITY ?auto_82339 ?auto_82338 ) ( IN-CITY ?auto_82332 ?auto_82338 ) ( not ( = ?auto_82332 ?auto_82339 ) ) ( OBJ-AT ?auto_82334 ?auto_82332 ) ( OBJ-AT ?auto_82333 ?auto_82339 ) ( not ( = ?auto_82336 ?auto_82334 ) ) ( IN-TRUCK ?auto_82336 ?auto_82335 ) ( not ( = ?auto_82333 ?auto_82336 ) ) ( TRUCK-AT ?auto_82335 ?auto_82337 ) ( IN-CITY ?auto_82337 ?auto_82338 ) ( not ( = ?auto_82332 ?auto_82337 ) ) ( not ( = ?auto_82339 ?auto_82337 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82334 ?auto_82333 ?auto_82332 )
      ( DELIVER-2PKG-VERIFY ?auto_82333 ?auto_82334 ?auto_82332 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_82341 - OBJ
      ?auto_82342 - OBJ
      ?auto_82340 - LOCATION
    )
    :vars
    (
      ?auto_82348 - OBJ
      ?auto_82347 - LOCATION
      ?auto_82346 - CITY
      ?auto_82344 - OBJ
      ?auto_82343 - TRUCK
      ?auto_82345 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82342 ?auto_82341 ) ) ( not ( = ?auto_82341 ?auto_82348 ) ) ( IN-CITY ?auto_82347 ?auto_82346 ) ( IN-CITY ?auto_82340 ?auto_82346 ) ( not ( = ?auto_82340 ?auto_82347 ) ) ( OBJ-AT ?auto_82348 ?auto_82340 ) ( OBJ-AT ?auto_82341 ?auto_82347 ) ( not ( = ?auto_82344 ?auto_82348 ) ) ( IN-TRUCK ?auto_82344 ?auto_82343 ) ( not ( = ?auto_82341 ?auto_82344 ) ) ( TRUCK-AT ?auto_82343 ?auto_82345 ) ( IN-CITY ?auto_82345 ?auto_82346 ) ( not ( = ?auto_82340 ?auto_82345 ) ) ( not ( = ?auto_82347 ?auto_82345 ) ) ( OBJ-AT ?auto_82342 ?auto_82340 ) ( not ( = ?auto_82342 ?auto_82348 ) ) ( not ( = ?auto_82342 ?auto_82344 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82348 ?auto_82341 ?auto_82340 )
      ( DELIVER-2PKG-VERIFY ?auto_82341 ?auto_82342 ?auto_82340 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_82350 - OBJ
      ?auto_82351 - OBJ
      ?auto_82349 - LOCATION
    )
    :vars
    (
      ?auto_82356 - OBJ
      ?auto_82355 - LOCATION
      ?auto_82354 - CITY
      ?auto_82352 - TRUCK
      ?auto_82353 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82351 ?auto_82350 ) ) ( not ( = ?auto_82350 ?auto_82356 ) ) ( IN-CITY ?auto_82355 ?auto_82354 ) ( IN-CITY ?auto_82349 ?auto_82354 ) ( not ( = ?auto_82349 ?auto_82355 ) ) ( OBJ-AT ?auto_82356 ?auto_82349 ) ( OBJ-AT ?auto_82350 ?auto_82355 ) ( not ( = ?auto_82351 ?auto_82356 ) ) ( IN-TRUCK ?auto_82351 ?auto_82352 ) ( TRUCK-AT ?auto_82352 ?auto_82353 ) ( IN-CITY ?auto_82353 ?auto_82354 ) ( not ( = ?auto_82349 ?auto_82353 ) ) ( not ( = ?auto_82355 ?auto_82353 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82356 ?auto_82350 ?auto_82349 )
      ( DELIVER-2PKG-VERIFY ?auto_82350 ?auto_82351 ?auto_82349 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_82376 - OBJ
      ?auto_82377 - OBJ
      ?auto_82378 - OBJ
      ?auto_82375 - LOCATION
    )
    :vars
    (
      ?auto_82383 - LOCATION
      ?auto_82382 - CITY
      ?auto_82380 - OBJ
      ?auto_82379 - TRUCK
      ?auto_82381 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82377 ?auto_82376 ) ) ( not ( = ?auto_82378 ?auto_82376 ) ) ( not ( = ?auto_82378 ?auto_82377 ) ) ( IN-CITY ?auto_82383 ?auto_82382 ) ( IN-CITY ?auto_82375 ?auto_82382 ) ( not ( = ?auto_82375 ?auto_82383 ) ) ( OBJ-AT ?auto_82376 ?auto_82375 ) ( OBJ-AT ?auto_82378 ?auto_82383 ) ( not ( = ?auto_82380 ?auto_82376 ) ) ( IN-TRUCK ?auto_82380 ?auto_82379 ) ( not ( = ?auto_82378 ?auto_82380 ) ) ( TRUCK-AT ?auto_82379 ?auto_82381 ) ( IN-CITY ?auto_82381 ?auto_82382 ) ( not ( = ?auto_82375 ?auto_82381 ) ) ( not ( = ?auto_82383 ?auto_82381 ) ) ( OBJ-AT ?auto_82377 ?auto_82375 ) ( not ( = ?auto_82377 ?auto_82380 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82376 ?auto_82378 ?auto_82375 )
      ( DELIVER-3PKG-VERIFY ?auto_82376 ?auto_82377 ?auto_82378 ?auto_82375 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_82385 - OBJ
      ?auto_82386 - OBJ
      ?auto_82387 - OBJ
      ?auto_82384 - LOCATION
    )
    :vars
    (
      ?auto_82391 - LOCATION
      ?auto_82390 - CITY
      ?auto_82388 - TRUCK
      ?auto_82389 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82386 ?auto_82385 ) ) ( not ( = ?auto_82387 ?auto_82385 ) ) ( not ( = ?auto_82387 ?auto_82386 ) ) ( IN-CITY ?auto_82391 ?auto_82390 ) ( IN-CITY ?auto_82384 ?auto_82390 ) ( not ( = ?auto_82384 ?auto_82391 ) ) ( OBJ-AT ?auto_82385 ?auto_82384 ) ( OBJ-AT ?auto_82387 ?auto_82391 ) ( IN-TRUCK ?auto_82386 ?auto_82388 ) ( TRUCK-AT ?auto_82388 ?auto_82389 ) ( IN-CITY ?auto_82389 ?auto_82390 ) ( not ( = ?auto_82384 ?auto_82389 ) ) ( not ( = ?auto_82391 ?auto_82389 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82385 ?auto_82387 ?auto_82384 )
      ( DELIVER-3PKG-VERIFY ?auto_82385 ?auto_82386 ?auto_82387 ?auto_82384 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_82402 - OBJ
      ?auto_82403 - OBJ
      ?auto_82404 - OBJ
      ?auto_82401 - LOCATION
    )
    :vars
    (
      ?auto_82409 - LOCATION
      ?auto_82408 - CITY
      ?auto_82406 - OBJ
      ?auto_82405 - TRUCK
      ?auto_82407 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82403 ?auto_82402 ) ) ( not ( = ?auto_82404 ?auto_82402 ) ) ( not ( = ?auto_82404 ?auto_82403 ) ) ( IN-CITY ?auto_82409 ?auto_82408 ) ( IN-CITY ?auto_82401 ?auto_82408 ) ( not ( = ?auto_82401 ?auto_82409 ) ) ( OBJ-AT ?auto_82402 ?auto_82401 ) ( OBJ-AT ?auto_82403 ?auto_82409 ) ( not ( = ?auto_82406 ?auto_82402 ) ) ( IN-TRUCK ?auto_82406 ?auto_82405 ) ( not ( = ?auto_82403 ?auto_82406 ) ) ( TRUCK-AT ?auto_82405 ?auto_82407 ) ( IN-CITY ?auto_82407 ?auto_82408 ) ( not ( = ?auto_82401 ?auto_82407 ) ) ( not ( = ?auto_82409 ?auto_82407 ) ) ( OBJ-AT ?auto_82404 ?auto_82401 ) ( not ( = ?auto_82404 ?auto_82406 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82402 ?auto_82403 ?auto_82401 )
      ( DELIVER-3PKG-VERIFY ?auto_82402 ?auto_82403 ?auto_82404 ?auto_82401 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_82411 - OBJ
      ?auto_82412 - OBJ
      ?auto_82413 - OBJ
      ?auto_82410 - LOCATION
    )
    :vars
    (
      ?auto_82417 - LOCATION
      ?auto_82416 - CITY
      ?auto_82414 - TRUCK
      ?auto_82415 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82412 ?auto_82411 ) ) ( not ( = ?auto_82413 ?auto_82411 ) ) ( not ( = ?auto_82413 ?auto_82412 ) ) ( IN-CITY ?auto_82417 ?auto_82416 ) ( IN-CITY ?auto_82410 ?auto_82416 ) ( not ( = ?auto_82410 ?auto_82417 ) ) ( OBJ-AT ?auto_82411 ?auto_82410 ) ( OBJ-AT ?auto_82412 ?auto_82417 ) ( IN-TRUCK ?auto_82413 ?auto_82414 ) ( TRUCK-AT ?auto_82414 ?auto_82415 ) ( IN-CITY ?auto_82415 ?auto_82416 ) ( not ( = ?auto_82410 ?auto_82415 ) ) ( not ( = ?auto_82417 ?auto_82415 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82411 ?auto_82412 ?auto_82410 )
      ( DELIVER-3PKG-VERIFY ?auto_82411 ?auto_82412 ?auto_82413 ?auto_82410 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_82428 - OBJ
      ?auto_82429 - OBJ
      ?auto_82430 - OBJ
      ?auto_82427 - LOCATION
    )
    :vars
    (
      ?auto_82435 - LOCATION
      ?auto_82434 - CITY
      ?auto_82432 - OBJ
      ?auto_82431 - TRUCK
      ?auto_82433 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82429 ?auto_82428 ) ) ( not ( = ?auto_82430 ?auto_82428 ) ) ( not ( = ?auto_82430 ?auto_82429 ) ) ( IN-CITY ?auto_82435 ?auto_82434 ) ( IN-CITY ?auto_82427 ?auto_82434 ) ( not ( = ?auto_82427 ?auto_82435 ) ) ( OBJ-AT ?auto_82429 ?auto_82427 ) ( OBJ-AT ?auto_82430 ?auto_82435 ) ( not ( = ?auto_82432 ?auto_82429 ) ) ( IN-TRUCK ?auto_82432 ?auto_82431 ) ( not ( = ?auto_82430 ?auto_82432 ) ) ( TRUCK-AT ?auto_82431 ?auto_82433 ) ( IN-CITY ?auto_82433 ?auto_82434 ) ( not ( = ?auto_82427 ?auto_82433 ) ) ( not ( = ?auto_82435 ?auto_82433 ) ) ( OBJ-AT ?auto_82428 ?auto_82427 ) ( not ( = ?auto_82428 ?auto_82432 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82429 ?auto_82430 ?auto_82427 )
      ( DELIVER-3PKG-VERIFY ?auto_82428 ?auto_82429 ?auto_82430 ?auto_82427 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_82447 - OBJ
      ?auto_82448 - OBJ
      ?auto_82449 - OBJ
      ?auto_82446 - LOCATION
    )
    :vars
    (
      ?auto_82454 - OBJ
      ?auto_82453 - LOCATION
      ?auto_82452 - CITY
      ?auto_82450 - TRUCK
      ?auto_82451 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82448 ?auto_82447 ) ) ( not ( = ?auto_82449 ?auto_82447 ) ) ( not ( = ?auto_82449 ?auto_82448 ) ) ( not ( = ?auto_82449 ?auto_82454 ) ) ( IN-CITY ?auto_82453 ?auto_82452 ) ( IN-CITY ?auto_82446 ?auto_82452 ) ( not ( = ?auto_82446 ?auto_82453 ) ) ( OBJ-AT ?auto_82454 ?auto_82446 ) ( OBJ-AT ?auto_82449 ?auto_82453 ) ( not ( = ?auto_82448 ?auto_82454 ) ) ( IN-TRUCK ?auto_82448 ?auto_82450 ) ( TRUCK-AT ?auto_82450 ?auto_82451 ) ( IN-CITY ?auto_82451 ?auto_82452 ) ( not ( = ?auto_82446 ?auto_82451 ) ) ( not ( = ?auto_82453 ?auto_82451 ) ) ( OBJ-AT ?auto_82447 ?auto_82446 ) ( not ( = ?auto_82447 ?auto_82454 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82454 ?auto_82449 ?auto_82446 )
      ( DELIVER-3PKG-VERIFY ?auto_82447 ?auto_82448 ?auto_82449 ?auto_82446 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_82456 - OBJ
      ?auto_82457 - OBJ
      ?auto_82458 - OBJ
      ?auto_82455 - LOCATION
    )
    :vars
    (
      ?auto_82463 - LOCATION
      ?auto_82462 - CITY
      ?auto_82460 - OBJ
      ?auto_82459 - TRUCK
      ?auto_82461 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82457 ?auto_82456 ) ) ( not ( = ?auto_82458 ?auto_82456 ) ) ( not ( = ?auto_82458 ?auto_82457 ) ) ( IN-CITY ?auto_82463 ?auto_82462 ) ( IN-CITY ?auto_82455 ?auto_82462 ) ( not ( = ?auto_82455 ?auto_82463 ) ) ( OBJ-AT ?auto_82458 ?auto_82455 ) ( OBJ-AT ?auto_82457 ?auto_82463 ) ( not ( = ?auto_82460 ?auto_82458 ) ) ( IN-TRUCK ?auto_82460 ?auto_82459 ) ( not ( = ?auto_82457 ?auto_82460 ) ) ( TRUCK-AT ?auto_82459 ?auto_82461 ) ( IN-CITY ?auto_82461 ?auto_82462 ) ( not ( = ?auto_82455 ?auto_82461 ) ) ( not ( = ?auto_82463 ?auto_82461 ) ) ( OBJ-AT ?auto_82456 ?auto_82455 ) ( not ( = ?auto_82456 ?auto_82460 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82458 ?auto_82457 ?auto_82455 )
      ( DELIVER-3PKG-VERIFY ?auto_82456 ?auto_82457 ?auto_82458 ?auto_82455 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_82475 - OBJ
      ?auto_82476 - OBJ
      ?auto_82477 - OBJ
      ?auto_82474 - LOCATION
    )
    :vars
    (
      ?auto_82482 - OBJ
      ?auto_82481 - LOCATION
      ?auto_82480 - CITY
      ?auto_82478 - TRUCK
      ?auto_82479 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82476 ?auto_82475 ) ) ( not ( = ?auto_82477 ?auto_82475 ) ) ( not ( = ?auto_82477 ?auto_82476 ) ) ( not ( = ?auto_82476 ?auto_82482 ) ) ( IN-CITY ?auto_82481 ?auto_82480 ) ( IN-CITY ?auto_82474 ?auto_82480 ) ( not ( = ?auto_82474 ?auto_82481 ) ) ( OBJ-AT ?auto_82482 ?auto_82474 ) ( OBJ-AT ?auto_82476 ?auto_82481 ) ( not ( = ?auto_82477 ?auto_82482 ) ) ( IN-TRUCK ?auto_82477 ?auto_82478 ) ( TRUCK-AT ?auto_82478 ?auto_82479 ) ( IN-CITY ?auto_82479 ?auto_82480 ) ( not ( = ?auto_82474 ?auto_82479 ) ) ( not ( = ?auto_82481 ?auto_82479 ) ) ( OBJ-AT ?auto_82475 ?auto_82474 ) ( not ( = ?auto_82475 ?auto_82482 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82482 ?auto_82476 ?auto_82474 )
      ( DELIVER-3PKG-VERIFY ?auto_82475 ?auto_82476 ?auto_82477 ?auto_82474 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_82494 - OBJ
      ?auto_82495 - OBJ
      ?auto_82496 - OBJ
      ?auto_82493 - LOCATION
    )
    :vars
    (
      ?auto_82500 - LOCATION
      ?auto_82499 - CITY
      ?auto_82497 - TRUCK
      ?auto_82498 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82495 ?auto_82494 ) ) ( not ( = ?auto_82496 ?auto_82494 ) ) ( not ( = ?auto_82496 ?auto_82495 ) ) ( IN-CITY ?auto_82500 ?auto_82499 ) ( IN-CITY ?auto_82493 ?auto_82499 ) ( not ( = ?auto_82493 ?auto_82500 ) ) ( OBJ-AT ?auto_82495 ?auto_82493 ) ( OBJ-AT ?auto_82496 ?auto_82500 ) ( IN-TRUCK ?auto_82494 ?auto_82497 ) ( TRUCK-AT ?auto_82497 ?auto_82498 ) ( IN-CITY ?auto_82498 ?auto_82499 ) ( not ( = ?auto_82493 ?auto_82498 ) ) ( not ( = ?auto_82500 ?auto_82498 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82495 ?auto_82496 ?auto_82493 )
      ( DELIVER-3PKG-VERIFY ?auto_82494 ?auto_82495 ?auto_82496 ?auto_82493 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_82502 - OBJ
      ?auto_82503 - OBJ
      ?auto_82504 - OBJ
      ?auto_82501 - LOCATION
    )
    :vars
    (
      ?auto_82509 - OBJ
      ?auto_82508 - LOCATION
      ?auto_82507 - CITY
      ?auto_82505 - TRUCK
      ?auto_82506 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82503 ?auto_82502 ) ) ( not ( = ?auto_82504 ?auto_82502 ) ) ( not ( = ?auto_82504 ?auto_82503 ) ) ( not ( = ?auto_82504 ?auto_82509 ) ) ( IN-CITY ?auto_82508 ?auto_82507 ) ( IN-CITY ?auto_82501 ?auto_82507 ) ( not ( = ?auto_82501 ?auto_82508 ) ) ( OBJ-AT ?auto_82509 ?auto_82501 ) ( OBJ-AT ?auto_82504 ?auto_82508 ) ( not ( = ?auto_82502 ?auto_82509 ) ) ( IN-TRUCK ?auto_82502 ?auto_82505 ) ( TRUCK-AT ?auto_82505 ?auto_82506 ) ( IN-CITY ?auto_82506 ?auto_82507 ) ( not ( = ?auto_82501 ?auto_82506 ) ) ( not ( = ?auto_82508 ?auto_82506 ) ) ( OBJ-AT ?auto_82503 ?auto_82501 ) ( not ( = ?auto_82503 ?auto_82509 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82509 ?auto_82504 ?auto_82501 )
      ( DELIVER-3PKG-VERIFY ?auto_82502 ?auto_82503 ?auto_82504 ?auto_82501 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_82520 - OBJ
      ?auto_82521 - OBJ
      ?auto_82522 - OBJ
      ?auto_82519 - LOCATION
    )
    :vars
    (
      ?auto_82526 - LOCATION
      ?auto_82525 - CITY
      ?auto_82523 - TRUCK
      ?auto_82524 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82521 ?auto_82520 ) ) ( not ( = ?auto_82522 ?auto_82520 ) ) ( not ( = ?auto_82522 ?auto_82521 ) ) ( IN-CITY ?auto_82526 ?auto_82525 ) ( IN-CITY ?auto_82519 ?auto_82525 ) ( not ( = ?auto_82519 ?auto_82526 ) ) ( OBJ-AT ?auto_82522 ?auto_82519 ) ( OBJ-AT ?auto_82521 ?auto_82526 ) ( IN-TRUCK ?auto_82520 ?auto_82523 ) ( TRUCK-AT ?auto_82523 ?auto_82524 ) ( IN-CITY ?auto_82524 ?auto_82525 ) ( not ( = ?auto_82519 ?auto_82524 ) ) ( not ( = ?auto_82526 ?auto_82524 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82522 ?auto_82521 ?auto_82519 )
      ( DELIVER-3PKG-VERIFY ?auto_82520 ?auto_82521 ?auto_82522 ?auto_82519 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_82528 - OBJ
      ?auto_82529 - OBJ
      ?auto_82530 - OBJ
      ?auto_82527 - LOCATION
    )
    :vars
    (
      ?auto_82535 - OBJ
      ?auto_82534 - LOCATION
      ?auto_82533 - CITY
      ?auto_82531 - TRUCK
      ?auto_82532 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82529 ?auto_82528 ) ) ( not ( = ?auto_82530 ?auto_82528 ) ) ( not ( = ?auto_82530 ?auto_82529 ) ) ( not ( = ?auto_82529 ?auto_82535 ) ) ( IN-CITY ?auto_82534 ?auto_82533 ) ( IN-CITY ?auto_82527 ?auto_82533 ) ( not ( = ?auto_82527 ?auto_82534 ) ) ( OBJ-AT ?auto_82535 ?auto_82527 ) ( OBJ-AT ?auto_82529 ?auto_82534 ) ( not ( = ?auto_82528 ?auto_82535 ) ) ( IN-TRUCK ?auto_82528 ?auto_82531 ) ( TRUCK-AT ?auto_82531 ?auto_82532 ) ( IN-CITY ?auto_82532 ?auto_82533 ) ( not ( = ?auto_82527 ?auto_82532 ) ) ( not ( = ?auto_82534 ?auto_82532 ) ) ( OBJ-AT ?auto_82530 ?auto_82527 ) ( not ( = ?auto_82530 ?auto_82535 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82535 ?auto_82529 ?auto_82527 )
      ( DELIVER-3PKG-VERIFY ?auto_82528 ?auto_82529 ?auto_82530 ?auto_82527 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_82564 - OBJ
      ?auto_82565 - OBJ
      ?auto_82566 - OBJ
      ?auto_82563 - LOCATION
    )
    :vars
    (
      ?auto_82571 - LOCATION
      ?auto_82570 - CITY
      ?auto_82568 - OBJ
      ?auto_82567 - TRUCK
      ?auto_82569 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82565 ?auto_82564 ) ) ( not ( = ?auto_82566 ?auto_82564 ) ) ( not ( = ?auto_82566 ?auto_82565 ) ) ( IN-CITY ?auto_82571 ?auto_82570 ) ( IN-CITY ?auto_82563 ?auto_82570 ) ( not ( = ?auto_82563 ?auto_82571 ) ) ( OBJ-AT ?auto_82565 ?auto_82563 ) ( OBJ-AT ?auto_82564 ?auto_82571 ) ( not ( = ?auto_82568 ?auto_82565 ) ) ( IN-TRUCK ?auto_82568 ?auto_82567 ) ( not ( = ?auto_82564 ?auto_82568 ) ) ( TRUCK-AT ?auto_82567 ?auto_82569 ) ( IN-CITY ?auto_82569 ?auto_82570 ) ( not ( = ?auto_82563 ?auto_82569 ) ) ( not ( = ?auto_82571 ?auto_82569 ) ) ( OBJ-AT ?auto_82566 ?auto_82563 ) ( not ( = ?auto_82566 ?auto_82568 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82565 ?auto_82564 ?auto_82563 )
      ( DELIVER-3PKG-VERIFY ?auto_82564 ?auto_82565 ?auto_82566 ?auto_82563 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_82573 - OBJ
      ?auto_82574 - OBJ
      ?auto_82575 - OBJ
      ?auto_82572 - LOCATION
    )
    :vars
    (
      ?auto_82579 - LOCATION
      ?auto_82578 - CITY
      ?auto_82576 - TRUCK
      ?auto_82577 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82574 ?auto_82573 ) ) ( not ( = ?auto_82575 ?auto_82573 ) ) ( not ( = ?auto_82575 ?auto_82574 ) ) ( IN-CITY ?auto_82579 ?auto_82578 ) ( IN-CITY ?auto_82572 ?auto_82578 ) ( not ( = ?auto_82572 ?auto_82579 ) ) ( OBJ-AT ?auto_82574 ?auto_82572 ) ( OBJ-AT ?auto_82573 ?auto_82579 ) ( IN-TRUCK ?auto_82575 ?auto_82576 ) ( TRUCK-AT ?auto_82576 ?auto_82577 ) ( IN-CITY ?auto_82577 ?auto_82578 ) ( not ( = ?auto_82572 ?auto_82577 ) ) ( not ( = ?auto_82579 ?auto_82577 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82574 ?auto_82573 ?auto_82572 )
      ( DELIVER-3PKG-VERIFY ?auto_82573 ?auto_82574 ?auto_82575 ?auto_82572 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_82590 - OBJ
      ?auto_82591 - OBJ
      ?auto_82592 - OBJ
      ?auto_82589 - LOCATION
    )
    :vars
    (
      ?auto_82597 - LOCATION
      ?auto_82596 - CITY
      ?auto_82594 - OBJ
      ?auto_82593 - TRUCK
      ?auto_82595 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82591 ?auto_82590 ) ) ( not ( = ?auto_82592 ?auto_82590 ) ) ( not ( = ?auto_82592 ?auto_82591 ) ) ( IN-CITY ?auto_82597 ?auto_82596 ) ( IN-CITY ?auto_82589 ?auto_82596 ) ( not ( = ?auto_82589 ?auto_82597 ) ) ( OBJ-AT ?auto_82592 ?auto_82589 ) ( OBJ-AT ?auto_82590 ?auto_82597 ) ( not ( = ?auto_82594 ?auto_82592 ) ) ( IN-TRUCK ?auto_82594 ?auto_82593 ) ( not ( = ?auto_82590 ?auto_82594 ) ) ( TRUCK-AT ?auto_82593 ?auto_82595 ) ( IN-CITY ?auto_82595 ?auto_82596 ) ( not ( = ?auto_82589 ?auto_82595 ) ) ( not ( = ?auto_82597 ?auto_82595 ) ) ( OBJ-AT ?auto_82591 ?auto_82589 ) ( not ( = ?auto_82591 ?auto_82594 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82592 ?auto_82590 ?auto_82589 )
      ( DELIVER-3PKG-VERIFY ?auto_82590 ?auto_82591 ?auto_82592 ?auto_82589 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_82609 - OBJ
      ?auto_82610 - OBJ
      ?auto_82611 - OBJ
      ?auto_82608 - LOCATION
    )
    :vars
    (
      ?auto_82616 - OBJ
      ?auto_82615 - LOCATION
      ?auto_82614 - CITY
      ?auto_82612 - TRUCK
      ?auto_82613 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82610 ?auto_82609 ) ) ( not ( = ?auto_82611 ?auto_82609 ) ) ( not ( = ?auto_82611 ?auto_82610 ) ) ( not ( = ?auto_82609 ?auto_82616 ) ) ( IN-CITY ?auto_82615 ?auto_82614 ) ( IN-CITY ?auto_82608 ?auto_82614 ) ( not ( = ?auto_82608 ?auto_82615 ) ) ( OBJ-AT ?auto_82616 ?auto_82608 ) ( OBJ-AT ?auto_82609 ?auto_82615 ) ( not ( = ?auto_82611 ?auto_82616 ) ) ( IN-TRUCK ?auto_82611 ?auto_82612 ) ( TRUCK-AT ?auto_82612 ?auto_82613 ) ( IN-CITY ?auto_82613 ?auto_82614 ) ( not ( = ?auto_82608 ?auto_82613 ) ) ( not ( = ?auto_82615 ?auto_82613 ) ) ( OBJ-AT ?auto_82610 ?auto_82608 ) ( not ( = ?auto_82610 ?auto_82616 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82616 ?auto_82609 ?auto_82608 )
      ( DELIVER-3PKG-VERIFY ?auto_82609 ?auto_82610 ?auto_82611 ?auto_82608 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_82628 - OBJ
      ?auto_82629 - OBJ
      ?auto_82630 - OBJ
      ?auto_82627 - LOCATION
    )
    :vars
    (
      ?auto_82634 - LOCATION
      ?auto_82633 - CITY
      ?auto_82631 - TRUCK
      ?auto_82632 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82629 ?auto_82628 ) ) ( not ( = ?auto_82630 ?auto_82628 ) ) ( not ( = ?auto_82630 ?auto_82629 ) ) ( IN-CITY ?auto_82634 ?auto_82633 ) ( IN-CITY ?auto_82627 ?auto_82633 ) ( not ( = ?auto_82627 ?auto_82634 ) ) ( OBJ-AT ?auto_82630 ?auto_82627 ) ( OBJ-AT ?auto_82628 ?auto_82634 ) ( IN-TRUCK ?auto_82629 ?auto_82631 ) ( TRUCK-AT ?auto_82631 ?auto_82632 ) ( IN-CITY ?auto_82632 ?auto_82633 ) ( not ( = ?auto_82627 ?auto_82632 ) ) ( not ( = ?auto_82634 ?auto_82632 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82630 ?auto_82628 ?auto_82627 )
      ( DELIVER-3PKG-VERIFY ?auto_82628 ?auto_82629 ?auto_82630 ?auto_82627 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_82636 - OBJ
      ?auto_82637 - OBJ
      ?auto_82638 - OBJ
      ?auto_82635 - LOCATION
    )
    :vars
    (
      ?auto_82643 - OBJ
      ?auto_82642 - LOCATION
      ?auto_82641 - CITY
      ?auto_82639 - TRUCK
      ?auto_82640 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82637 ?auto_82636 ) ) ( not ( = ?auto_82638 ?auto_82636 ) ) ( not ( = ?auto_82638 ?auto_82637 ) ) ( not ( = ?auto_82636 ?auto_82643 ) ) ( IN-CITY ?auto_82642 ?auto_82641 ) ( IN-CITY ?auto_82635 ?auto_82641 ) ( not ( = ?auto_82635 ?auto_82642 ) ) ( OBJ-AT ?auto_82643 ?auto_82635 ) ( OBJ-AT ?auto_82636 ?auto_82642 ) ( not ( = ?auto_82637 ?auto_82643 ) ) ( IN-TRUCK ?auto_82637 ?auto_82639 ) ( TRUCK-AT ?auto_82639 ?auto_82640 ) ( IN-CITY ?auto_82640 ?auto_82641 ) ( not ( = ?auto_82635 ?auto_82640 ) ) ( not ( = ?auto_82642 ?auto_82640 ) ) ( OBJ-AT ?auto_82638 ?auto_82635 ) ( not ( = ?auto_82638 ?auto_82643 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82643 ?auto_82636 ?auto_82635 )
      ( DELIVER-3PKG-VERIFY ?auto_82636 ?auto_82637 ?auto_82638 ?auto_82635 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_82789 - OBJ
      ?auto_82790 - OBJ
      ?auto_82791 - OBJ
      ?auto_82792 - OBJ
      ?auto_82788 - LOCATION
    )
    :vars
    (
      ?auto_82796 - LOCATION
      ?auto_82795 - CITY
      ?auto_82793 - TRUCK
      ?auto_82794 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82790 ?auto_82789 ) ) ( not ( = ?auto_82791 ?auto_82789 ) ) ( not ( = ?auto_82791 ?auto_82790 ) ) ( not ( = ?auto_82792 ?auto_82789 ) ) ( not ( = ?auto_82792 ?auto_82790 ) ) ( not ( = ?auto_82792 ?auto_82791 ) ) ( IN-CITY ?auto_82796 ?auto_82795 ) ( IN-CITY ?auto_82788 ?auto_82795 ) ( not ( = ?auto_82788 ?auto_82796 ) ) ( OBJ-AT ?auto_82789 ?auto_82788 ) ( OBJ-AT ?auto_82792 ?auto_82796 ) ( IN-TRUCK ?auto_82791 ?auto_82793 ) ( TRUCK-AT ?auto_82793 ?auto_82794 ) ( IN-CITY ?auto_82794 ?auto_82795 ) ( not ( = ?auto_82788 ?auto_82794 ) ) ( not ( = ?auto_82796 ?auto_82794 ) ) ( OBJ-AT ?auto_82790 ?auto_82788 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82789 ?auto_82792 ?auto_82788 )
      ( DELIVER-4PKG-VERIFY ?auto_82789 ?auto_82790 ?auto_82791 ?auto_82792 ?auto_82788 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_82818 - OBJ
      ?auto_82819 - OBJ
      ?auto_82820 - OBJ
      ?auto_82821 - OBJ
      ?auto_82817 - LOCATION
    )
    :vars
    (
      ?auto_82825 - LOCATION
      ?auto_82824 - CITY
      ?auto_82822 - TRUCK
      ?auto_82823 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82819 ?auto_82818 ) ) ( not ( = ?auto_82820 ?auto_82818 ) ) ( not ( = ?auto_82820 ?auto_82819 ) ) ( not ( = ?auto_82821 ?auto_82818 ) ) ( not ( = ?auto_82821 ?auto_82819 ) ) ( not ( = ?auto_82821 ?auto_82820 ) ) ( IN-CITY ?auto_82825 ?auto_82824 ) ( IN-CITY ?auto_82817 ?auto_82824 ) ( not ( = ?auto_82817 ?auto_82825 ) ) ( OBJ-AT ?auto_82818 ?auto_82817 ) ( OBJ-AT ?auto_82820 ?auto_82825 ) ( IN-TRUCK ?auto_82821 ?auto_82822 ) ( TRUCK-AT ?auto_82822 ?auto_82823 ) ( IN-CITY ?auto_82823 ?auto_82824 ) ( not ( = ?auto_82817 ?auto_82823 ) ) ( not ( = ?auto_82825 ?auto_82823 ) ) ( OBJ-AT ?auto_82819 ?auto_82817 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82818 ?auto_82820 ?auto_82817 )
      ( DELIVER-4PKG-VERIFY ?auto_82818 ?auto_82819 ?auto_82820 ?auto_82821 ?auto_82817 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_82846 - OBJ
      ?auto_82847 - OBJ
      ?auto_82848 - OBJ
      ?auto_82849 - OBJ
      ?auto_82845 - LOCATION
    )
    :vars
    (
      ?auto_82853 - LOCATION
      ?auto_82852 - CITY
      ?auto_82850 - TRUCK
      ?auto_82851 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82847 ?auto_82846 ) ) ( not ( = ?auto_82848 ?auto_82846 ) ) ( not ( = ?auto_82848 ?auto_82847 ) ) ( not ( = ?auto_82849 ?auto_82846 ) ) ( not ( = ?auto_82849 ?auto_82847 ) ) ( not ( = ?auto_82849 ?auto_82848 ) ) ( IN-CITY ?auto_82853 ?auto_82852 ) ( IN-CITY ?auto_82845 ?auto_82852 ) ( not ( = ?auto_82845 ?auto_82853 ) ) ( OBJ-AT ?auto_82846 ?auto_82845 ) ( OBJ-AT ?auto_82849 ?auto_82853 ) ( IN-TRUCK ?auto_82847 ?auto_82850 ) ( TRUCK-AT ?auto_82850 ?auto_82851 ) ( IN-CITY ?auto_82851 ?auto_82852 ) ( not ( = ?auto_82845 ?auto_82851 ) ) ( not ( = ?auto_82853 ?auto_82851 ) ) ( OBJ-AT ?auto_82848 ?auto_82845 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82846 ?auto_82849 ?auto_82845 )
      ( DELIVER-4PKG-VERIFY ?auto_82846 ?auto_82847 ?auto_82848 ?auto_82849 ?auto_82845 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_82873 - OBJ
      ?auto_82874 - OBJ
      ?auto_82875 - OBJ
      ?auto_82876 - OBJ
      ?auto_82872 - LOCATION
    )
    :vars
    (
      ?auto_82880 - LOCATION
      ?auto_82879 - CITY
      ?auto_82877 - TRUCK
      ?auto_82878 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82874 ?auto_82873 ) ) ( not ( = ?auto_82875 ?auto_82873 ) ) ( not ( = ?auto_82875 ?auto_82874 ) ) ( not ( = ?auto_82876 ?auto_82873 ) ) ( not ( = ?auto_82876 ?auto_82874 ) ) ( not ( = ?auto_82876 ?auto_82875 ) ) ( IN-CITY ?auto_82880 ?auto_82879 ) ( IN-CITY ?auto_82872 ?auto_82879 ) ( not ( = ?auto_82872 ?auto_82880 ) ) ( OBJ-AT ?auto_82873 ?auto_82872 ) ( OBJ-AT ?auto_82875 ?auto_82880 ) ( IN-TRUCK ?auto_82874 ?auto_82877 ) ( TRUCK-AT ?auto_82877 ?auto_82878 ) ( IN-CITY ?auto_82878 ?auto_82879 ) ( not ( = ?auto_82872 ?auto_82878 ) ) ( not ( = ?auto_82880 ?auto_82878 ) ) ( OBJ-AT ?auto_82876 ?auto_82872 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82873 ?auto_82875 ?auto_82872 )
      ( DELIVER-4PKG-VERIFY ?auto_82873 ?auto_82874 ?auto_82875 ?auto_82876 ?auto_82872 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_82959 - OBJ
      ?auto_82960 - OBJ
      ?auto_82961 - OBJ
      ?auto_82962 - OBJ
      ?auto_82958 - LOCATION
    )
    :vars
    (
      ?auto_82966 - LOCATION
      ?auto_82965 - CITY
      ?auto_82963 - TRUCK
      ?auto_82964 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82960 ?auto_82959 ) ) ( not ( = ?auto_82961 ?auto_82959 ) ) ( not ( = ?auto_82961 ?auto_82960 ) ) ( not ( = ?auto_82962 ?auto_82959 ) ) ( not ( = ?auto_82962 ?auto_82960 ) ) ( not ( = ?auto_82962 ?auto_82961 ) ) ( IN-CITY ?auto_82966 ?auto_82965 ) ( IN-CITY ?auto_82958 ?auto_82965 ) ( not ( = ?auto_82958 ?auto_82966 ) ) ( OBJ-AT ?auto_82959 ?auto_82958 ) ( OBJ-AT ?auto_82960 ?auto_82966 ) ( IN-TRUCK ?auto_82962 ?auto_82963 ) ( TRUCK-AT ?auto_82963 ?auto_82964 ) ( IN-CITY ?auto_82964 ?auto_82965 ) ( not ( = ?auto_82958 ?auto_82964 ) ) ( not ( = ?auto_82966 ?auto_82964 ) ) ( OBJ-AT ?auto_82961 ?auto_82958 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82959 ?auto_82960 ?auto_82958 )
      ( DELIVER-4PKG-VERIFY ?auto_82959 ?auto_82960 ?auto_82961 ?auto_82962 ?auto_82958 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_82987 - OBJ
      ?auto_82988 - OBJ
      ?auto_82989 - OBJ
      ?auto_82990 - OBJ
      ?auto_82986 - LOCATION
    )
    :vars
    (
      ?auto_82994 - LOCATION
      ?auto_82993 - CITY
      ?auto_82991 - TRUCK
      ?auto_82992 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_82988 ?auto_82987 ) ) ( not ( = ?auto_82989 ?auto_82987 ) ) ( not ( = ?auto_82989 ?auto_82988 ) ) ( not ( = ?auto_82990 ?auto_82987 ) ) ( not ( = ?auto_82990 ?auto_82988 ) ) ( not ( = ?auto_82990 ?auto_82989 ) ) ( IN-CITY ?auto_82994 ?auto_82993 ) ( IN-CITY ?auto_82986 ?auto_82993 ) ( not ( = ?auto_82986 ?auto_82994 ) ) ( OBJ-AT ?auto_82987 ?auto_82986 ) ( OBJ-AT ?auto_82988 ?auto_82994 ) ( IN-TRUCK ?auto_82989 ?auto_82991 ) ( TRUCK-AT ?auto_82991 ?auto_82992 ) ( IN-CITY ?auto_82992 ?auto_82993 ) ( not ( = ?auto_82986 ?auto_82992 ) ) ( not ( = ?auto_82994 ?auto_82992 ) ) ( OBJ-AT ?auto_82990 ?auto_82986 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_82987 ?auto_82988 ?auto_82986 )
      ( DELIVER-4PKG-VERIFY ?auto_82987 ?auto_82988 ?auto_82989 ?auto_82990 ?auto_82986 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_83073 - OBJ
      ?auto_83074 - OBJ
      ?auto_83075 - OBJ
      ?auto_83076 - OBJ
      ?auto_83072 - LOCATION
    )
    :vars
    (
      ?auto_83080 - LOCATION
      ?auto_83079 - CITY
      ?auto_83077 - TRUCK
      ?auto_83078 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_83074 ?auto_83073 ) ) ( not ( = ?auto_83075 ?auto_83073 ) ) ( not ( = ?auto_83075 ?auto_83074 ) ) ( not ( = ?auto_83076 ?auto_83073 ) ) ( not ( = ?auto_83076 ?auto_83074 ) ) ( not ( = ?auto_83076 ?auto_83075 ) ) ( IN-CITY ?auto_83080 ?auto_83079 ) ( IN-CITY ?auto_83072 ?auto_83079 ) ( not ( = ?auto_83072 ?auto_83080 ) ) ( OBJ-AT ?auto_83074 ?auto_83072 ) ( OBJ-AT ?auto_83076 ?auto_83080 ) ( IN-TRUCK ?auto_83075 ?auto_83077 ) ( TRUCK-AT ?auto_83077 ?auto_83078 ) ( IN-CITY ?auto_83078 ?auto_83079 ) ( not ( = ?auto_83072 ?auto_83078 ) ) ( not ( = ?auto_83080 ?auto_83078 ) ) ( OBJ-AT ?auto_83073 ?auto_83072 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_83074 ?auto_83076 ?auto_83072 )
      ( DELIVER-4PKG-VERIFY ?auto_83073 ?auto_83074 ?auto_83075 ?auto_83076 ?auto_83072 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_83102 - OBJ
      ?auto_83103 - OBJ
      ?auto_83104 - OBJ
      ?auto_83105 - OBJ
      ?auto_83101 - LOCATION
    )
    :vars
    (
      ?auto_83109 - LOCATION
      ?auto_83108 - CITY
      ?auto_83106 - TRUCK
      ?auto_83107 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_83103 ?auto_83102 ) ) ( not ( = ?auto_83104 ?auto_83102 ) ) ( not ( = ?auto_83104 ?auto_83103 ) ) ( not ( = ?auto_83105 ?auto_83102 ) ) ( not ( = ?auto_83105 ?auto_83103 ) ) ( not ( = ?auto_83105 ?auto_83104 ) ) ( IN-CITY ?auto_83109 ?auto_83108 ) ( IN-CITY ?auto_83101 ?auto_83108 ) ( not ( = ?auto_83101 ?auto_83109 ) ) ( OBJ-AT ?auto_83103 ?auto_83101 ) ( OBJ-AT ?auto_83104 ?auto_83109 ) ( IN-TRUCK ?auto_83105 ?auto_83106 ) ( TRUCK-AT ?auto_83106 ?auto_83107 ) ( IN-CITY ?auto_83107 ?auto_83108 ) ( not ( = ?auto_83101 ?auto_83107 ) ) ( not ( = ?auto_83109 ?auto_83107 ) ) ( OBJ-AT ?auto_83102 ?auto_83101 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_83103 ?auto_83104 ?auto_83101 )
      ( DELIVER-4PKG-VERIFY ?auto_83102 ?auto_83103 ?auto_83104 ?auto_83105 ?auto_83101 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_83194 - OBJ
      ?auto_83195 - OBJ
      ?auto_83196 - OBJ
      ?auto_83197 - OBJ
      ?auto_83193 - LOCATION
    )
    :vars
    (
      ?auto_83201 - LOCATION
      ?auto_83200 - CITY
      ?auto_83198 - TRUCK
      ?auto_83199 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_83195 ?auto_83194 ) ) ( not ( = ?auto_83196 ?auto_83194 ) ) ( not ( = ?auto_83196 ?auto_83195 ) ) ( not ( = ?auto_83197 ?auto_83194 ) ) ( not ( = ?auto_83197 ?auto_83195 ) ) ( not ( = ?auto_83197 ?auto_83196 ) ) ( IN-CITY ?auto_83201 ?auto_83200 ) ( IN-CITY ?auto_83193 ?auto_83200 ) ( not ( = ?auto_83193 ?auto_83201 ) ) ( OBJ-AT ?auto_83196 ?auto_83193 ) ( OBJ-AT ?auto_83197 ?auto_83201 ) ( IN-TRUCK ?auto_83195 ?auto_83198 ) ( TRUCK-AT ?auto_83198 ?auto_83199 ) ( IN-CITY ?auto_83199 ?auto_83200 ) ( not ( = ?auto_83193 ?auto_83199 ) ) ( not ( = ?auto_83201 ?auto_83199 ) ) ( OBJ-AT ?auto_83194 ?auto_83193 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_83196 ?auto_83197 ?auto_83193 )
      ( DELIVER-4PKG-VERIFY ?auto_83194 ?auto_83195 ?auto_83196 ?auto_83197 ?auto_83193 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_83223 - OBJ
      ?auto_83224 - OBJ
      ?auto_83225 - OBJ
      ?auto_83226 - OBJ
      ?auto_83222 - LOCATION
    )
    :vars
    (
      ?auto_83230 - LOCATION
      ?auto_83229 - CITY
      ?auto_83227 - TRUCK
      ?auto_83228 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_83224 ?auto_83223 ) ) ( not ( = ?auto_83225 ?auto_83223 ) ) ( not ( = ?auto_83225 ?auto_83224 ) ) ( not ( = ?auto_83226 ?auto_83223 ) ) ( not ( = ?auto_83226 ?auto_83224 ) ) ( not ( = ?auto_83226 ?auto_83225 ) ) ( IN-CITY ?auto_83230 ?auto_83229 ) ( IN-CITY ?auto_83222 ?auto_83229 ) ( not ( = ?auto_83222 ?auto_83230 ) ) ( OBJ-AT ?auto_83226 ?auto_83222 ) ( OBJ-AT ?auto_83225 ?auto_83230 ) ( IN-TRUCK ?auto_83224 ?auto_83227 ) ( TRUCK-AT ?auto_83227 ?auto_83228 ) ( IN-CITY ?auto_83228 ?auto_83229 ) ( not ( = ?auto_83222 ?auto_83228 ) ) ( not ( = ?auto_83230 ?auto_83228 ) ) ( OBJ-AT ?auto_83223 ?auto_83222 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_83226 ?auto_83225 ?auto_83222 )
      ( DELIVER-4PKG-VERIFY ?auto_83223 ?auto_83224 ?auto_83225 ?auto_83226 ?auto_83222 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_83282 - OBJ
      ?auto_83283 - OBJ
      ?auto_83284 - OBJ
      ?auto_83285 - OBJ
      ?auto_83281 - LOCATION
    )
    :vars
    (
      ?auto_83289 - LOCATION
      ?auto_83288 - CITY
      ?auto_83286 - TRUCK
      ?auto_83287 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_83283 ?auto_83282 ) ) ( not ( = ?auto_83284 ?auto_83282 ) ) ( not ( = ?auto_83284 ?auto_83283 ) ) ( not ( = ?auto_83285 ?auto_83282 ) ) ( not ( = ?auto_83285 ?auto_83283 ) ) ( not ( = ?auto_83285 ?auto_83284 ) ) ( IN-CITY ?auto_83289 ?auto_83288 ) ( IN-CITY ?auto_83281 ?auto_83288 ) ( not ( = ?auto_83281 ?auto_83289 ) ) ( OBJ-AT ?auto_83284 ?auto_83281 ) ( OBJ-AT ?auto_83283 ?auto_83289 ) ( IN-TRUCK ?auto_83285 ?auto_83286 ) ( TRUCK-AT ?auto_83286 ?auto_83287 ) ( IN-CITY ?auto_83287 ?auto_83288 ) ( not ( = ?auto_83281 ?auto_83287 ) ) ( not ( = ?auto_83289 ?auto_83287 ) ) ( OBJ-AT ?auto_83282 ?auto_83281 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_83284 ?auto_83283 ?auto_83281 )
      ( DELIVER-4PKG-VERIFY ?auto_83282 ?auto_83283 ?auto_83284 ?auto_83285 ?auto_83281 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_83343 - OBJ
      ?auto_83344 - OBJ
      ?auto_83345 - OBJ
      ?auto_83346 - OBJ
      ?auto_83342 - LOCATION
    )
    :vars
    (
      ?auto_83350 - LOCATION
      ?auto_83349 - CITY
      ?auto_83347 - TRUCK
      ?auto_83348 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_83344 ?auto_83343 ) ) ( not ( = ?auto_83345 ?auto_83343 ) ) ( not ( = ?auto_83345 ?auto_83344 ) ) ( not ( = ?auto_83346 ?auto_83343 ) ) ( not ( = ?auto_83346 ?auto_83344 ) ) ( not ( = ?auto_83346 ?auto_83345 ) ) ( IN-CITY ?auto_83350 ?auto_83349 ) ( IN-CITY ?auto_83342 ?auto_83349 ) ( not ( = ?auto_83342 ?auto_83350 ) ) ( OBJ-AT ?auto_83346 ?auto_83342 ) ( OBJ-AT ?auto_83344 ?auto_83350 ) ( IN-TRUCK ?auto_83345 ?auto_83347 ) ( TRUCK-AT ?auto_83347 ?auto_83348 ) ( IN-CITY ?auto_83348 ?auto_83349 ) ( not ( = ?auto_83342 ?auto_83348 ) ) ( not ( = ?auto_83350 ?auto_83348 ) ) ( OBJ-AT ?auto_83343 ?auto_83342 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_83346 ?auto_83344 ?auto_83342 )
      ( DELIVER-4PKG-VERIFY ?auto_83343 ?auto_83344 ?auto_83345 ?auto_83346 ?auto_83342 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_83433 - OBJ
      ?auto_83434 - OBJ
      ?auto_83435 - OBJ
      ?auto_83436 - OBJ
      ?auto_83432 - LOCATION
    )
    :vars
    (
      ?auto_83440 - LOCATION
      ?auto_83439 - CITY
      ?auto_83437 - TRUCK
      ?auto_83438 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_83434 ?auto_83433 ) ) ( not ( = ?auto_83435 ?auto_83433 ) ) ( not ( = ?auto_83435 ?auto_83434 ) ) ( not ( = ?auto_83436 ?auto_83433 ) ) ( not ( = ?auto_83436 ?auto_83434 ) ) ( not ( = ?auto_83436 ?auto_83435 ) ) ( IN-CITY ?auto_83440 ?auto_83439 ) ( IN-CITY ?auto_83432 ?auto_83439 ) ( not ( = ?auto_83432 ?auto_83440 ) ) ( OBJ-AT ?auto_83434 ?auto_83432 ) ( OBJ-AT ?auto_83436 ?auto_83440 ) ( IN-TRUCK ?auto_83433 ?auto_83437 ) ( TRUCK-AT ?auto_83437 ?auto_83438 ) ( IN-CITY ?auto_83438 ?auto_83439 ) ( not ( = ?auto_83432 ?auto_83438 ) ) ( not ( = ?auto_83440 ?auto_83438 ) ) ( OBJ-AT ?auto_83435 ?auto_83432 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_83434 ?auto_83436 ?auto_83432 )
      ( DELIVER-4PKG-VERIFY ?auto_83433 ?auto_83434 ?auto_83435 ?auto_83436 ?auto_83432 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_83460 - OBJ
      ?auto_83461 - OBJ
      ?auto_83462 - OBJ
      ?auto_83463 - OBJ
      ?auto_83459 - LOCATION
    )
    :vars
    (
      ?auto_83467 - LOCATION
      ?auto_83466 - CITY
      ?auto_83464 - TRUCK
      ?auto_83465 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_83461 ?auto_83460 ) ) ( not ( = ?auto_83462 ?auto_83460 ) ) ( not ( = ?auto_83462 ?auto_83461 ) ) ( not ( = ?auto_83463 ?auto_83460 ) ) ( not ( = ?auto_83463 ?auto_83461 ) ) ( not ( = ?auto_83463 ?auto_83462 ) ) ( IN-CITY ?auto_83467 ?auto_83466 ) ( IN-CITY ?auto_83459 ?auto_83466 ) ( not ( = ?auto_83459 ?auto_83467 ) ) ( OBJ-AT ?auto_83461 ?auto_83459 ) ( OBJ-AT ?auto_83462 ?auto_83467 ) ( IN-TRUCK ?auto_83460 ?auto_83464 ) ( TRUCK-AT ?auto_83464 ?auto_83465 ) ( IN-CITY ?auto_83465 ?auto_83466 ) ( not ( = ?auto_83459 ?auto_83465 ) ) ( not ( = ?auto_83467 ?auto_83465 ) ) ( OBJ-AT ?auto_83463 ?auto_83459 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_83461 ?auto_83462 ?auto_83459 )
      ( DELIVER-4PKG-VERIFY ?auto_83460 ?auto_83461 ?auto_83462 ?auto_83463 ?auto_83459 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_83487 - OBJ
      ?auto_83488 - OBJ
      ?auto_83489 - OBJ
      ?auto_83490 - OBJ
      ?auto_83486 - LOCATION
    )
    :vars
    (
      ?auto_83494 - LOCATION
      ?auto_83493 - CITY
      ?auto_83491 - TRUCK
      ?auto_83492 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_83488 ?auto_83487 ) ) ( not ( = ?auto_83489 ?auto_83487 ) ) ( not ( = ?auto_83489 ?auto_83488 ) ) ( not ( = ?auto_83490 ?auto_83487 ) ) ( not ( = ?auto_83490 ?auto_83488 ) ) ( not ( = ?auto_83490 ?auto_83489 ) ) ( IN-CITY ?auto_83494 ?auto_83493 ) ( IN-CITY ?auto_83486 ?auto_83493 ) ( not ( = ?auto_83486 ?auto_83494 ) ) ( OBJ-AT ?auto_83489 ?auto_83486 ) ( OBJ-AT ?auto_83490 ?auto_83494 ) ( IN-TRUCK ?auto_83487 ?auto_83491 ) ( TRUCK-AT ?auto_83491 ?auto_83492 ) ( IN-CITY ?auto_83492 ?auto_83493 ) ( not ( = ?auto_83486 ?auto_83492 ) ) ( not ( = ?auto_83494 ?auto_83492 ) ) ( OBJ-AT ?auto_83488 ?auto_83486 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_83489 ?auto_83490 ?auto_83486 )
      ( DELIVER-4PKG-VERIFY ?auto_83487 ?auto_83488 ?auto_83489 ?auto_83490 ?auto_83486 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_83516 - OBJ
      ?auto_83517 - OBJ
      ?auto_83518 - OBJ
      ?auto_83519 - OBJ
      ?auto_83515 - LOCATION
    )
    :vars
    (
      ?auto_83523 - LOCATION
      ?auto_83522 - CITY
      ?auto_83520 - TRUCK
      ?auto_83521 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_83517 ?auto_83516 ) ) ( not ( = ?auto_83518 ?auto_83516 ) ) ( not ( = ?auto_83518 ?auto_83517 ) ) ( not ( = ?auto_83519 ?auto_83516 ) ) ( not ( = ?auto_83519 ?auto_83517 ) ) ( not ( = ?auto_83519 ?auto_83518 ) ) ( IN-CITY ?auto_83523 ?auto_83522 ) ( IN-CITY ?auto_83515 ?auto_83522 ) ( not ( = ?auto_83515 ?auto_83523 ) ) ( OBJ-AT ?auto_83519 ?auto_83515 ) ( OBJ-AT ?auto_83518 ?auto_83523 ) ( IN-TRUCK ?auto_83516 ?auto_83520 ) ( TRUCK-AT ?auto_83520 ?auto_83521 ) ( IN-CITY ?auto_83521 ?auto_83522 ) ( not ( = ?auto_83515 ?auto_83521 ) ) ( not ( = ?auto_83523 ?auto_83521 ) ) ( OBJ-AT ?auto_83517 ?auto_83515 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_83519 ?auto_83518 ?auto_83515 )
      ( DELIVER-4PKG-VERIFY ?auto_83516 ?auto_83517 ?auto_83518 ?auto_83519 ?auto_83515 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_83632 - OBJ
      ?auto_83633 - OBJ
      ?auto_83634 - OBJ
      ?auto_83635 - OBJ
      ?auto_83631 - LOCATION
    )
    :vars
    (
      ?auto_83639 - LOCATION
      ?auto_83638 - CITY
      ?auto_83636 - TRUCK
      ?auto_83637 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_83633 ?auto_83632 ) ) ( not ( = ?auto_83634 ?auto_83632 ) ) ( not ( = ?auto_83634 ?auto_83633 ) ) ( not ( = ?auto_83635 ?auto_83632 ) ) ( not ( = ?auto_83635 ?auto_83633 ) ) ( not ( = ?auto_83635 ?auto_83634 ) ) ( IN-CITY ?auto_83639 ?auto_83638 ) ( IN-CITY ?auto_83631 ?auto_83638 ) ( not ( = ?auto_83631 ?auto_83639 ) ) ( OBJ-AT ?auto_83634 ?auto_83631 ) ( OBJ-AT ?auto_83633 ?auto_83639 ) ( IN-TRUCK ?auto_83632 ?auto_83636 ) ( TRUCK-AT ?auto_83636 ?auto_83637 ) ( IN-CITY ?auto_83637 ?auto_83638 ) ( not ( = ?auto_83631 ?auto_83637 ) ) ( not ( = ?auto_83639 ?auto_83637 ) ) ( OBJ-AT ?auto_83635 ?auto_83631 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_83634 ?auto_83633 ?auto_83631 )
      ( DELIVER-4PKG-VERIFY ?auto_83632 ?auto_83633 ?auto_83634 ?auto_83635 ?auto_83631 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_83659 - OBJ
      ?auto_83660 - OBJ
      ?auto_83661 - OBJ
      ?auto_83662 - OBJ
      ?auto_83658 - LOCATION
    )
    :vars
    (
      ?auto_83666 - LOCATION
      ?auto_83665 - CITY
      ?auto_83663 - TRUCK
      ?auto_83664 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_83660 ?auto_83659 ) ) ( not ( = ?auto_83661 ?auto_83659 ) ) ( not ( = ?auto_83661 ?auto_83660 ) ) ( not ( = ?auto_83662 ?auto_83659 ) ) ( not ( = ?auto_83662 ?auto_83660 ) ) ( not ( = ?auto_83662 ?auto_83661 ) ) ( IN-CITY ?auto_83666 ?auto_83665 ) ( IN-CITY ?auto_83658 ?auto_83665 ) ( not ( = ?auto_83658 ?auto_83666 ) ) ( OBJ-AT ?auto_83662 ?auto_83658 ) ( OBJ-AT ?auto_83660 ?auto_83666 ) ( IN-TRUCK ?auto_83659 ?auto_83663 ) ( TRUCK-AT ?auto_83663 ?auto_83664 ) ( IN-CITY ?auto_83664 ?auto_83665 ) ( not ( = ?auto_83658 ?auto_83664 ) ) ( not ( = ?auto_83666 ?auto_83664 ) ) ( OBJ-AT ?auto_83661 ?auto_83658 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_83662 ?auto_83660 ?auto_83658 )
      ( DELIVER-4PKG-VERIFY ?auto_83659 ?auto_83660 ?auto_83661 ?auto_83662 ?auto_83658 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_83835 - OBJ
      ?auto_83836 - OBJ
      ?auto_83837 - OBJ
      ?auto_83838 - OBJ
      ?auto_83834 - LOCATION
    )
    :vars
    (
      ?auto_83842 - LOCATION
      ?auto_83841 - CITY
      ?auto_83839 - TRUCK
      ?auto_83840 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_83836 ?auto_83835 ) ) ( not ( = ?auto_83837 ?auto_83835 ) ) ( not ( = ?auto_83837 ?auto_83836 ) ) ( not ( = ?auto_83838 ?auto_83835 ) ) ( not ( = ?auto_83838 ?auto_83836 ) ) ( not ( = ?auto_83838 ?auto_83837 ) ) ( IN-CITY ?auto_83842 ?auto_83841 ) ( IN-CITY ?auto_83834 ?auto_83841 ) ( not ( = ?auto_83834 ?auto_83842 ) ) ( OBJ-AT ?auto_83836 ?auto_83834 ) ( OBJ-AT ?auto_83835 ?auto_83842 ) ( IN-TRUCK ?auto_83838 ?auto_83839 ) ( TRUCK-AT ?auto_83839 ?auto_83840 ) ( IN-CITY ?auto_83840 ?auto_83841 ) ( not ( = ?auto_83834 ?auto_83840 ) ) ( not ( = ?auto_83842 ?auto_83840 ) ) ( OBJ-AT ?auto_83837 ?auto_83834 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_83836 ?auto_83835 ?auto_83834 )
      ( DELIVER-4PKG-VERIFY ?auto_83835 ?auto_83836 ?auto_83837 ?auto_83838 ?auto_83834 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_83863 - OBJ
      ?auto_83864 - OBJ
      ?auto_83865 - OBJ
      ?auto_83866 - OBJ
      ?auto_83862 - LOCATION
    )
    :vars
    (
      ?auto_83870 - LOCATION
      ?auto_83869 - CITY
      ?auto_83867 - TRUCK
      ?auto_83868 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_83864 ?auto_83863 ) ) ( not ( = ?auto_83865 ?auto_83863 ) ) ( not ( = ?auto_83865 ?auto_83864 ) ) ( not ( = ?auto_83866 ?auto_83863 ) ) ( not ( = ?auto_83866 ?auto_83864 ) ) ( not ( = ?auto_83866 ?auto_83865 ) ) ( IN-CITY ?auto_83870 ?auto_83869 ) ( IN-CITY ?auto_83862 ?auto_83869 ) ( not ( = ?auto_83862 ?auto_83870 ) ) ( OBJ-AT ?auto_83864 ?auto_83862 ) ( OBJ-AT ?auto_83863 ?auto_83870 ) ( IN-TRUCK ?auto_83865 ?auto_83867 ) ( TRUCK-AT ?auto_83867 ?auto_83868 ) ( IN-CITY ?auto_83868 ?auto_83869 ) ( not ( = ?auto_83862 ?auto_83868 ) ) ( not ( = ?auto_83870 ?auto_83868 ) ) ( OBJ-AT ?auto_83866 ?auto_83862 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_83864 ?auto_83863 ?auto_83862 )
      ( DELIVER-4PKG-VERIFY ?auto_83863 ?auto_83864 ?auto_83865 ?auto_83866 ?auto_83862 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_83949 - OBJ
      ?auto_83950 - OBJ
      ?auto_83951 - OBJ
      ?auto_83952 - OBJ
      ?auto_83948 - LOCATION
    )
    :vars
    (
      ?auto_83956 - LOCATION
      ?auto_83955 - CITY
      ?auto_83953 - TRUCK
      ?auto_83954 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_83950 ?auto_83949 ) ) ( not ( = ?auto_83951 ?auto_83949 ) ) ( not ( = ?auto_83951 ?auto_83950 ) ) ( not ( = ?auto_83952 ?auto_83949 ) ) ( not ( = ?auto_83952 ?auto_83950 ) ) ( not ( = ?auto_83952 ?auto_83951 ) ) ( IN-CITY ?auto_83956 ?auto_83955 ) ( IN-CITY ?auto_83948 ?auto_83955 ) ( not ( = ?auto_83948 ?auto_83956 ) ) ( OBJ-AT ?auto_83951 ?auto_83948 ) ( OBJ-AT ?auto_83949 ?auto_83956 ) ( IN-TRUCK ?auto_83952 ?auto_83953 ) ( TRUCK-AT ?auto_83953 ?auto_83954 ) ( IN-CITY ?auto_83954 ?auto_83955 ) ( not ( = ?auto_83948 ?auto_83954 ) ) ( not ( = ?auto_83956 ?auto_83954 ) ) ( OBJ-AT ?auto_83950 ?auto_83948 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_83951 ?auto_83949 ?auto_83948 )
      ( DELIVER-4PKG-VERIFY ?auto_83949 ?auto_83950 ?auto_83951 ?auto_83952 ?auto_83948 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_84010 - OBJ
      ?auto_84011 - OBJ
      ?auto_84012 - OBJ
      ?auto_84013 - OBJ
      ?auto_84009 - LOCATION
    )
    :vars
    (
      ?auto_84017 - LOCATION
      ?auto_84016 - CITY
      ?auto_84014 - TRUCK
      ?auto_84015 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84011 ?auto_84010 ) ) ( not ( = ?auto_84012 ?auto_84010 ) ) ( not ( = ?auto_84012 ?auto_84011 ) ) ( not ( = ?auto_84013 ?auto_84010 ) ) ( not ( = ?auto_84013 ?auto_84011 ) ) ( not ( = ?auto_84013 ?auto_84012 ) ) ( IN-CITY ?auto_84017 ?auto_84016 ) ( IN-CITY ?auto_84009 ?auto_84016 ) ( not ( = ?auto_84009 ?auto_84017 ) ) ( OBJ-AT ?auto_84013 ?auto_84009 ) ( OBJ-AT ?auto_84010 ?auto_84017 ) ( IN-TRUCK ?auto_84012 ?auto_84014 ) ( TRUCK-AT ?auto_84014 ?auto_84015 ) ( IN-CITY ?auto_84015 ?auto_84016 ) ( not ( = ?auto_84009 ?auto_84015 ) ) ( not ( = ?auto_84017 ?auto_84015 ) ) ( OBJ-AT ?auto_84011 ?auto_84009 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84013 ?auto_84010 ?auto_84009 )
      ( DELIVER-4PKG-VERIFY ?auto_84010 ?auto_84011 ?auto_84012 ?auto_84013 ?auto_84009 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_84100 - OBJ
      ?auto_84101 - OBJ
      ?auto_84102 - OBJ
      ?auto_84103 - OBJ
      ?auto_84099 - LOCATION
    )
    :vars
    (
      ?auto_84107 - LOCATION
      ?auto_84106 - CITY
      ?auto_84104 - TRUCK
      ?auto_84105 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84101 ?auto_84100 ) ) ( not ( = ?auto_84102 ?auto_84100 ) ) ( not ( = ?auto_84102 ?auto_84101 ) ) ( not ( = ?auto_84103 ?auto_84100 ) ) ( not ( = ?auto_84103 ?auto_84101 ) ) ( not ( = ?auto_84103 ?auto_84102 ) ) ( IN-CITY ?auto_84107 ?auto_84106 ) ( IN-CITY ?auto_84099 ?auto_84106 ) ( not ( = ?auto_84099 ?auto_84107 ) ) ( OBJ-AT ?auto_84102 ?auto_84099 ) ( OBJ-AT ?auto_84100 ?auto_84107 ) ( IN-TRUCK ?auto_84101 ?auto_84104 ) ( TRUCK-AT ?auto_84104 ?auto_84105 ) ( IN-CITY ?auto_84105 ?auto_84106 ) ( not ( = ?auto_84099 ?auto_84105 ) ) ( not ( = ?auto_84107 ?auto_84105 ) ) ( OBJ-AT ?auto_84103 ?auto_84099 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84102 ?auto_84100 ?auto_84099 )
      ( DELIVER-4PKG-VERIFY ?auto_84100 ?auto_84101 ?auto_84102 ?auto_84103 ?auto_84099 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_84127 - OBJ
      ?auto_84128 - OBJ
      ?auto_84129 - OBJ
      ?auto_84130 - OBJ
      ?auto_84126 - LOCATION
    )
    :vars
    (
      ?auto_84134 - LOCATION
      ?auto_84133 - CITY
      ?auto_84131 - TRUCK
      ?auto_84132 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84128 ?auto_84127 ) ) ( not ( = ?auto_84129 ?auto_84127 ) ) ( not ( = ?auto_84129 ?auto_84128 ) ) ( not ( = ?auto_84130 ?auto_84127 ) ) ( not ( = ?auto_84130 ?auto_84128 ) ) ( not ( = ?auto_84130 ?auto_84129 ) ) ( IN-CITY ?auto_84134 ?auto_84133 ) ( IN-CITY ?auto_84126 ?auto_84133 ) ( not ( = ?auto_84126 ?auto_84134 ) ) ( OBJ-AT ?auto_84130 ?auto_84126 ) ( OBJ-AT ?auto_84127 ?auto_84134 ) ( IN-TRUCK ?auto_84128 ?auto_84131 ) ( TRUCK-AT ?auto_84131 ?auto_84132 ) ( IN-CITY ?auto_84132 ?auto_84133 ) ( not ( = ?auto_84126 ?auto_84132 ) ) ( not ( = ?auto_84134 ?auto_84132 ) ) ( OBJ-AT ?auto_84129 ?auto_84126 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84130 ?auto_84127 ?auto_84126 )
      ( DELIVER-4PKG-VERIFY ?auto_84127 ?auto_84128 ?auto_84129 ?auto_84130 ?auto_84126 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_84406 - OBJ
      ?auto_84405 - LOCATION
    )
    :vars
    (
      ?auto_84412 - OBJ
      ?auto_84411 - LOCATION
      ?auto_84410 - CITY
      ?auto_84408 - OBJ
      ?auto_84407 - TRUCK
      ?auto_84409 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84406 ?auto_84412 ) ) ( IN-CITY ?auto_84411 ?auto_84410 ) ( IN-CITY ?auto_84405 ?auto_84410 ) ( not ( = ?auto_84405 ?auto_84411 ) ) ( OBJ-AT ?auto_84412 ?auto_84405 ) ( OBJ-AT ?auto_84406 ?auto_84411 ) ( not ( = ?auto_84408 ?auto_84412 ) ) ( not ( = ?auto_84406 ?auto_84408 ) ) ( TRUCK-AT ?auto_84407 ?auto_84409 ) ( IN-CITY ?auto_84409 ?auto_84410 ) ( not ( = ?auto_84405 ?auto_84409 ) ) ( not ( = ?auto_84411 ?auto_84409 ) ) ( OBJ-AT ?auto_84408 ?auto_84409 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_84408 ?auto_84407 ?auto_84409 )
      ( DELIVER-2PKG ?auto_84412 ?auto_84406 ?auto_84405 )
      ( DELIVER-1PKG-VERIFY ?auto_84406 ?auto_84405 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_84414 - OBJ
      ?auto_84415 - OBJ
      ?auto_84413 - LOCATION
    )
    :vars
    (
      ?auto_84420 - LOCATION
      ?auto_84417 - CITY
      ?auto_84416 - OBJ
      ?auto_84418 - TRUCK
      ?auto_84419 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84415 ?auto_84414 ) ) ( IN-CITY ?auto_84420 ?auto_84417 ) ( IN-CITY ?auto_84413 ?auto_84417 ) ( not ( = ?auto_84413 ?auto_84420 ) ) ( OBJ-AT ?auto_84414 ?auto_84413 ) ( OBJ-AT ?auto_84415 ?auto_84420 ) ( not ( = ?auto_84416 ?auto_84414 ) ) ( not ( = ?auto_84415 ?auto_84416 ) ) ( TRUCK-AT ?auto_84418 ?auto_84419 ) ( IN-CITY ?auto_84419 ?auto_84417 ) ( not ( = ?auto_84413 ?auto_84419 ) ) ( not ( = ?auto_84420 ?auto_84419 ) ) ( OBJ-AT ?auto_84416 ?auto_84419 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_84415 ?auto_84413 )
      ( DELIVER-2PKG-VERIFY ?auto_84414 ?auto_84415 ?auto_84413 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_84422 - OBJ
      ?auto_84423 - OBJ
      ?auto_84421 - LOCATION
    )
    :vars
    (
      ?auto_84429 - OBJ
      ?auto_84424 - LOCATION
      ?auto_84426 - CITY
      ?auto_84425 - OBJ
      ?auto_84427 - TRUCK
      ?auto_84428 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84423 ?auto_84422 ) ) ( not ( = ?auto_84423 ?auto_84429 ) ) ( IN-CITY ?auto_84424 ?auto_84426 ) ( IN-CITY ?auto_84421 ?auto_84426 ) ( not ( = ?auto_84421 ?auto_84424 ) ) ( OBJ-AT ?auto_84429 ?auto_84421 ) ( OBJ-AT ?auto_84423 ?auto_84424 ) ( not ( = ?auto_84425 ?auto_84429 ) ) ( not ( = ?auto_84423 ?auto_84425 ) ) ( TRUCK-AT ?auto_84427 ?auto_84428 ) ( IN-CITY ?auto_84428 ?auto_84426 ) ( not ( = ?auto_84421 ?auto_84428 ) ) ( not ( = ?auto_84424 ?auto_84428 ) ) ( OBJ-AT ?auto_84425 ?auto_84428 ) ( OBJ-AT ?auto_84422 ?auto_84421 ) ( not ( = ?auto_84422 ?auto_84429 ) ) ( not ( = ?auto_84422 ?auto_84425 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84429 ?auto_84423 ?auto_84421 )
      ( DELIVER-2PKG-VERIFY ?auto_84422 ?auto_84423 ?auto_84421 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_84431 - OBJ
      ?auto_84432 - OBJ
      ?auto_84430 - LOCATION
    )
    :vars
    (
      ?auto_84437 - OBJ
      ?auto_84433 - LOCATION
      ?auto_84434 - CITY
      ?auto_84435 - TRUCK
      ?auto_84436 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84432 ?auto_84431 ) ) ( not ( = ?auto_84432 ?auto_84437 ) ) ( IN-CITY ?auto_84433 ?auto_84434 ) ( IN-CITY ?auto_84430 ?auto_84434 ) ( not ( = ?auto_84430 ?auto_84433 ) ) ( OBJ-AT ?auto_84437 ?auto_84430 ) ( OBJ-AT ?auto_84432 ?auto_84433 ) ( not ( = ?auto_84431 ?auto_84437 ) ) ( TRUCK-AT ?auto_84435 ?auto_84436 ) ( IN-CITY ?auto_84436 ?auto_84434 ) ( not ( = ?auto_84430 ?auto_84436 ) ) ( not ( = ?auto_84433 ?auto_84436 ) ) ( OBJ-AT ?auto_84431 ?auto_84436 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84437 ?auto_84432 ?auto_84430 )
      ( DELIVER-2PKG-VERIFY ?auto_84431 ?auto_84432 ?auto_84430 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_84439 - OBJ
      ?auto_84440 - OBJ
      ?auto_84438 - LOCATION
    )
    :vars
    (
      ?auto_84441 - LOCATION
      ?auto_84443 - CITY
      ?auto_84442 - OBJ
      ?auto_84444 - TRUCK
      ?auto_84445 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84440 ?auto_84439 ) ) ( IN-CITY ?auto_84441 ?auto_84443 ) ( IN-CITY ?auto_84438 ?auto_84443 ) ( not ( = ?auto_84438 ?auto_84441 ) ) ( OBJ-AT ?auto_84440 ?auto_84438 ) ( OBJ-AT ?auto_84439 ?auto_84441 ) ( not ( = ?auto_84442 ?auto_84440 ) ) ( not ( = ?auto_84439 ?auto_84442 ) ) ( TRUCK-AT ?auto_84444 ?auto_84445 ) ( IN-CITY ?auto_84445 ?auto_84443 ) ( not ( = ?auto_84438 ?auto_84445 ) ) ( not ( = ?auto_84441 ?auto_84445 ) ) ( OBJ-AT ?auto_84442 ?auto_84445 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84440 ?auto_84439 ?auto_84438 )
      ( DELIVER-2PKG-VERIFY ?auto_84439 ?auto_84440 ?auto_84438 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_84447 - OBJ
      ?auto_84448 - OBJ
      ?auto_84446 - LOCATION
    )
    :vars
    (
      ?auto_84454 - OBJ
      ?auto_84449 - LOCATION
      ?auto_84451 - CITY
      ?auto_84450 - OBJ
      ?auto_84452 - TRUCK
      ?auto_84453 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84448 ?auto_84447 ) ) ( not ( = ?auto_84447 ?auto_84454 ) ) ( IN-CITY ?auto_84449 ?auto_84451 ) ( IN-CITY ?auto_84446 ?auto_84451 ) ( not ( = ?auto_84446 ?auto_84449 ) ) ( OBJ-AT ?auto_84454 ?auto_84446 ) ( OBJ-AT ?auto_84447 ?auto_84449 ) ( not ( = ?auto_84450 ?auto_84454 ) ) ( not ( = ?auto_84447 ?auto_84450 ) ) ( TRUCK-AT ?auto_84452 ?auto_84453 ) ( IN-CITY ?auto_84453 ?auto_84451 ) ( not ( = ?auto_84446 ?auto_84453 ) ) ( not ( = ?auto_84449 ?auto_84453 ) ) ( OBJ-AT ?auto_84450 ?auto_84453 ) ( OBJ-AT ?auto_84448 ?auto_84446 ) ( not ( = ?auto_84448 ?auto_84454 ) ) ( not ( = ?auto_84448 ?auto_84450 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84454 ?auto_84447 ?auto_84446 )
      ( DELIVER-2PKG-VERIFY ?auto_84447 ?auto_84448 ?auto_84446 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_84456 - OBJ
      ?auto_84457 - OBJ
      ?auto_84455 - LOCATION
    )
    :vars
    (
      ?auto_84462 - OBJ
      ?auto_84458 - LOCATION
      ?auto_84459 - CITY
      ?auto_84460 - TRUCK
      ?auto_84461 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84457 ?auto_84456 ) ) ( not ( = ?auto_84456 ?auto_84462 ) ) ( IN-CITY ?auto_84458 ?auto_84459 ) ( IN-CITY ?auto_84455 ?auto_84459 ) ( not ( = ?auto_84455 ?auto_84458 ) ) ( OBJ-AT ?auto_84462 ?auto_84455 ) ( OBJ-AT ?auto_84456 ?auto_84458 ) ( not ( = ?auto_84457 ?auto_84462 ) ) ( TRUCK-AT ?auto_84460 ?auto_84461 ) ( IN-CITY ?auto_84461 ?auto_84459 ) ( not ( = ?auto_84455 ?auto_84461 ) ) ( not ( = ?auto_84458 ?auto_84461 ) ) ( OBJ-AT ?auto_84457 ?auto_84461 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84462 ?auto_84456 ?auto_84455 )
      ( DELIVER-2PKG-VERIFY ?auto_84456 ?auto_84457 ?auto_84455 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_84482 - OBJ
      ?auto_84483 - OBJ
      ?auto_84484 - OBJ
      ?auto_84481 - LOCATION
    )
    :vars
    (
      ?auto_84485 - LOCATION
      ?auto_84487 - CITY
      ?auto_84486 - OBJ
      ?auto_84488 - TRUCK
      ?auto_84489 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84483 ?auto_84482 ) ) ( not ( = ?auto_84484 ?auto_84482 ) ) ( not ( = ?auto_84484 ?auto_84483 ) ) ( IN-CITY ?auto_84485 ?auto_84487 ) ( IN-CITY ?auto_84481 ?auto_84487 ) ( not ( = ?auto_84481 ?auto_84485 ) ) ( OBJ-AT ?auto_84482 ?auto_84481 ) ( OBJ-AT ?auto_84484 ?auto_84485 ) ( not ( = ?auto_84486 ?auto_84482 ) ) ( not ( = ?auto_84484 ?auto_84486 ) ) ( TRUCK-AT ?auto_84488 ?auto_84489 ) ( IN-CITY ?auto_84489 ?auto_84487 ) ( not ( = ?auto_84481 ?auto_84489 ) ) ( not ( = ?auto_84485 ?auto_84489 ) ) ( OBJ-AT ?auto_84486 ?auto_84489 ) ( OBJ-AT ?auto_84483 ?auto_84481 ) ( not ( = ?auto_84483 ?auto_84486 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84482 ?auto_84484 ?auto_84481 )
      ( DELIVER-3PKG-VERIFY ?auto_84482 ?auto_84483 ?auto_84484 ?auto_84481 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_84491 - OBJ
      ?auto_84492 - OBJ
      ?auto_84493 - OBJ
      ?auto_84490 - LOCATION
    )
    :vars
    (
      ?auto_84494 - LOCATION
      ?auto_84495 - CITY
      ?auto_84496 - TRUCK
      ?auto_84497 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84492 ?auto_84491 ) ) ( not ( = ?auto_84493 ?auto_84491 ) ) ( not ( = ?auto_84493 ?auto_84492 ) ) ( IN-CITY ?auto_84494 ?auto_84495 ) ( IN-CITY ?auto_84490 ?auto_84495 ) ( not ( = ?auto_84490 ?auto_84494 ) ) ( OBJ-AT ?auto_84491 ?auto_84490 ) ( OBJ-AT ?auto_84493 ?auto_84494 ) ( TRUCK-AT ?auto_84496 ?auto_84497 ) ( IN-CITY ?auto_84497 ?auto_84495 ) ( not ( = ?auto_84490 ?auto_84497 ) ) ( not ( = ?auto_84494 ?auto_84497 ) ) ( OBJ-AT ?auto_84492 ?auto_84497 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84491 ?auto_84493 ?auto_84490 )
      ( DELIVER-3PKG-VERIFY ?auto_84491 ?auto_84492 ?auto_84493 ?auto_84490 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_84508 - OBJ
      ?auto_84509 - OBJ
      ?auto_84510 - OBJ
      ?auto_84507 - LOCATION
    )
    :vars
    (
      ?auto_84511 - LOCATION
      ?auto_84513 - CITY
      ?auto_84512 - OBJ
      ?auto_84514 - TRUCK
      ?auto_84515 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84509 ?auto_84508 ) ) ( not ( = ?auto_84510 ?auto_84508 ) ) ( not ( = ?auto_84510 ?auto_84509 ) ) ( IN-CITY ?auto_84511 ?auto_84513 ) ( IN-CITY ?auto_84507 ?auto_84513 ) ( not ( = ?auto_84507 ?auto_84511 ) ) ( OBJ-AT ?auto_84508 ?auto_84507 ) ( OBJ-AT ?auto_84509 ?auto_84511 ) ( not ( = ?auto_84512 ?auto_84508 ) ) ( not ( = ?auto_84509 ?auto_84512 ) ) ( TRUCK-AT ?auto_84514 ?auto_84515 ) ( IN-CITY ?auto_84515 ?auto_84513 ) ( not ( = ?auto_84507 ?auto_84515 ) ) ( not ( = ?auto_84511 ?auto_84515 ) ) ( OBJ-AT ?auto_84512 ?auto_84515 ) ( OBJ-AT ?auto_84510 ?auto_84507 ) ( not ( = ?auto_84510 ?auto_84512 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84508 ?auto_84509 ?auto_84507 )
      ( DELIVER-3PKG-VERIFY ?auto_84508 ?auto_84509 ?auto_84510 ?auto_84507 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_84517 - OBJ
      ?auto_84518 - OBJ
      ?auto_84519 - OBJ
      ?auto_84516 - LOCATION
    )
    :vars
    (
      ?auto_84520 - LOCATION
      ?auto_84521 - CITY
      ?auto_84522 - TRUCK
      ?auto_84523 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84518 ?auto_84517 ) ) ( not ( = ?auto_84519 ?auto_84517 ) ) ( not ( = ?auto_84519 ?auto_84518 ) ) ( IN-CITY ?auto_84520 ?auto_84521 ) ( IN-CITY ?auto_84516 ?auto_84521 ) ( not ( = ?auto_84516 ?auto_84520 ) ) ( OBJ-AT ?auto_84517 ?auto_84516 ) ( OBJ-AT ?auto_84518 ?auto_84520 ) ( TRUCK-AT ?auto_84522 ?auto_84523 ) ( IN-CITY ?auto_84523 ?auto_84521 ) ( not ( = ?auto_84516 ?auto_84523 ) ) ( not ( = ?auto_84520 ?auto_84523 ) ) ( OBJ-AT ?auto_84519 ?auto_84523 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84517 ?auto_84518 ?auto_84516 )
      ( DELIVER-3PKG-VERIFY ?auto_84517 ?auto_84518 ?auto_84519 ?auto_84516 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_84534 - OBJ
      ?auto_84535 - OBJ
      ?auto_84536 - OBJ
      ?auto_84533 - LOCATION
    )
    :vars
    (
      ?auto_84537 - LOCATION
      ?auto_84539 - CITY
      ?auto_84538 - OBJ
      ?auto_84540 - TRUCK
      ?auto_84541 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84535 ?auto_84534 ) ) ( not ( = ?auto_84536 ?auto_84534 ) ) ( not ( = ?auto_84536 ?auto_84535 ) ) ( IN-CITY ?auto_84537 ?auto_84539 ) ( IN-CITY ?auto_84533 ?auto_84539 ) ( not ( = ?auto_84533 ?auto_84537 ) ) ( OBJ-AT ?auto_84535 ?auto_84533 ) ( OBJ-AT ?auto_84536 ?auto_84537 ) ( not ( = ?auto_84538 ?auto_84535 ) ) ( not ( = ?auto_84536 ?auto_84538 ) ) ( TRUCK-AT ?auto_84540 ?auto_84541 ) ( IN-CITY ?auto_84541 ?auto_84539 ) ( not ( = ?auto_84533 ?auto_84541 ) ) ( not ( = ?auto_84537 ?auto_84541 ) ) ( OBJ-AT ?auto_84538 ?auto_84541 ) ( OBJ-AT ?auto_84534 ?auto_84533 ) ( not ( = ?auto_84534 ?auto_84538 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84535 ?auto_84536 ?auto_84533 )
      ( DELIVER-3PKG-VERIFY ?auto_84534 ?auto_84535 ?auto_84536 ?auto_84533 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_84553 - OBJ
      ?auto_84554 - OBJ
      ?auto_84555 - OBJ
      ?auto_84552 - LOCATION
    )
    :vars
    (
      ?auto_84560 - OBJ
      ?auto_84556 - LOCATION
      ?auto_84557 - CITY
      ?auto_84558 - TRUCK
      ?auto_84559 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84554 ?auto_84553 ) ) ( not ( = ?auto_84555 ?auto_84553 ) ) ( not ( = ?auto_84555 ?auto_84554 ) ) ( not ( = ?auto_84555 ?auto_84560 ) ) ( IN-CITY ?auto_84556 ?auto_84557 ) ( IN-CITY ?auto_84552 ?auto_84557 ) ( not ( = ?auto_84552 ?auto_84556 ) ) ( OBJ-AT ?auto_84560 ?auto_84552 ) ( OBJ-AT ?auto_84555 ?auto_84556 ) ( not ( = ?auto_84554 ?auto_84560 ) ) ( TRUCK-AT ?auto_84558 ?auto_84559 ) ( IN-CITY ?auto_84559 ?auto_84557 ) ( not ( = ?auto_84552 ?auto_84559 ) ) ( not ( = ?auto_84556 ?auto_84559 ) ) ( OBJ-AT ?auto_84554 ?auto_84559 ) ( OBJ-AT ?auto_84553 ?auto_84552 ) ( not ( = ?auto_84553 ?auto_84560 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84560 ?auto_84555 ?auto_84552 )
      ( DELIVER-3PKG-VERIFY ?auto_84553 ?auto_84554 ?auto_84555 ?auto_84552 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_84562 - OBJ
      ?auto_84563 - OBJ
      ?auto_84564 - OBJ
      ?auto_84561 - LOCATION
    )
    :vars
    (
      ?auto_84565 - LOCATION
      ?auto_84567 - CITY
      ?auto_84566 - OBJ
      ?auto_84568 - TRUCK
      ?auto_84569 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84563 ?auto_84562 ) ) ( not ( = ?auto_84564 ?auto_84562 ) ) ( not ( = ?auto_84564 ?auto_84563 ) ) ( IN-CITY ?auto_84565 ?auto_84567 ) ( IN-CITY ?auto_84561 ?auto_84567 ) ( not ( = ?auto_84561 ?auto_84565 ) ) ( OBJ-AT ?auto_84564 ?auto_84561 ) ( OBJ-AT ?auto_84563 ?auto_84565 ) ( not ( = ?auto_84566 ?auto_84564 ) ) ( not ( = ?auto_84563 ?auto_84566 ) ) ( TRUCK-AT ?auto_84568 ?auto_84569 ) ( IN-CITY ?auto_84569 ?auto_84567 ) ( not ( = ?auto_84561 ?auto_84569 ) ) ( not ( = ?auto_84565 ?auto_84569 ) ) ( OBJ-AT ?auto_84566 ?auto_84569 ) ( OBJ-AT ?auto_84562 ?auto_84561 ) ( not ( = ?auto_84562 ?auto_84566 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84564 ?auto_84563 ?auto_84561 )
      ( DELIVER-3PKG-VERIFY ?auto_84562 ?auto_84563 ?auto_84564 ?auto_84561 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_84581 - OBJ
      ?auto_84582 - OBJ
      ?auto_84583 - OBJ
      ?auto_84580 - LOCATION
    )
    :vars
    (
      ?auto_84588 - OBJ
      ?auto_84584 - LOCATION
      ?auto_84585 - CITY
      ?auto_84586 - TRUCK
      ?auto_84587 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84582 ?auto_84581 ) ) ( not ( = ?auto_84583 ?auto_84581 ) ) ( not ( = ?auto_84583 ?auto_84582 ) ) ( not ( = ?auto_84582 ?auto_84588 ) ) ( IN-CITY ?auto_84584 ?auto_84585 ) ( IN-CITY ?auto_84580 ?auto_84585 ) ( not ( = ?auto_84580 ?auto_84584 ) ) ( OBJ-AT ?auto_84588 ?auto_84580 ) ( OBJ-AT ?auto_84582 ?auto_84584 ) ( not ( = ?auto_84583 ?auto_84588 ) ) ( TRUCK-AT ?auto_84586 ?auto_84587 ) ( IN-CITY ?auto_84587 ?auto_84585 ) ( not ( = ?auto_84580 ?auto_84587 ) ) ( not ( = ?auto_84584 ?auto_84587 ) ) ( OBJ-AT ?auto_84583 ?auto_84587 ) ( OBJ-AT ?auto_84581 ?auto_84580 ) ( not ( = ?auto_84581 ?auto_84588 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84588 ?auto_84582 ?auto_84580 )
      ( DELIVER-3PKG-VERIFY ?auto_84581 ?auto_84582 ?auto_84583 ?auto_84580 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_84600 - OBJ
      ?auto_84601 - OBJ
      ?auto_84602 - OBJ
      ?auto_84599 - LOCATION
    )
    :vars
    (
      ?auto_84603 - LOCATION
      ?auto_84604 - CITY
      ?auto_84605 - TRUCK
      ?auto_84606 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84601 ?auto_84600 ) ) ( not ( = ?auto_84602 ?auto_84600 ) ) ( not ( = ?auto_84602 ?auto_84601 ) ) ( IN-CITY ?auto_84603 ?auto_84604 ) ( IN-CITY ?auto_84599 ?auto_84604 ) ( not ( = ?auto_84599 ?auto_84603 ) ) ( OBJ-AT ?auto_84601 ?auto_84599 ) ( OBJ-AT ?auto_84602 ?auto_84603 ) ( TRUCK-AT ?auto_84605 ?auto_84606 ) ( IN-CITY ?auto_84606 ?auto_84604 ) ( not ( = ?auto_84599 ?auto_84606 ) ) ( not ( = ?auto_84603 ?auto_84606 ) ) ( OBJ-AT ?auto_84600 ?auto_84606 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84601 ?auto_84602 ?auto_84599 )
      ( DELIVER-3PKG-VERIFY ?auto_84600 ?auto_84601 ?auto_84602 ?auto_84599 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_84608 - OBJ
      ?auto_84609 - OBJ
      ?auto_84610 - OBJ
      ?auto_84607 - LOCATION
    )
    :vars
    (
      ?auto_84615 - OBJ
      ?auto_84611 - LOCATION
      ?auto_84612 - CITY
      ?auto_84613 - TRUCK
      ?auto_84614 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84609 ?auto_84608 ) ) ( not ( = ?auto_84610 ?auto_84608 ) ) ( not ( = ?auto_84610 ?auto_84609 ) ) ( not ( = ?auto_84610 ?auto_84615 ) ) ( IN-CITY ?auto_84611 ?auto_84612 ) ( IN-CITY ?auto_84607 ?auto_84612 ) ( not ( = ?auto_84607 ?auto_84611 ) ) ( OBJ-AT ?auto_84615 ?auto_84607 ) ( OBJ-AT ?auto_84610 ?auto_84611 ) ( not ( = ?auto_84608 ?auto_84615 ) ) ( TRUCK-AT ?auto_84613 ?auto_84614 ) ( IN-CITY ?auto_84614 ?auto_84612 ) ( not ( = ?auto_84607 ?auto_84614 ) ) ( not ( = ?auto_84611 ?auto_84614 ) ) ( OBJ-AT ?auto_84608 ?auto_84614 ) ( OBJ-AT ?auto_84609 ?auto_84607 ) ( not ( = ?auto_84609 ?auto_84615 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84615 ?auto_84610 ?auto_84607 )
      ( DELIVER-3PKG-VERIFY ?auto_84608 ?auto_84609 ?auto_84610 ?auto_84607 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_84626 - OBJ
      ?auto_84627 - OBJ
      ?auto_84628 - OBJ
      ?auto_84625 - LOCATION
    )
    :vars
    (
      ?auto_84629 - LOCATION
      ?auto_84630 - CITY
      ?auto_84631 - TRUCK
      ?auto_84632 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84627 ?auto_84626 ) ) ( not ( = ?auto_84628 ?auto_84626 ) ) ( not ( = ?auto_84628 ?auto_84627 ) ) ( IN-CITY ?auto_84629 ?auto_84630 ) ( IN-CITY ?auto_84625 ?auto_84630 ) ( not ( = ?auto_84625 ?auto_84629 ) ) ( OBJ-AT ?auto_84628 ?auto_84625 ) ( OBJ-AT ?auto_84627 ?auto_84629 ) ( TRUCK-AT ?auto_84631 ?auto_84632 ) ( IN-CITY ?auto_84632 ?auto_84630 ) ( not ( = ?auto_84625 ?auto_84632 ) ) ( not ( = ?auto_84629 ?auto_84632 ) ) ( OBJ-AT ?auto_84626 ?auto_84632 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84628 ?auto_84627 ?auto_84625 )
      ( DELIVER-3PKG-VERIFY ?auto_84626 ?auto_84627 ?auto_84628 ?auto_84625 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_84634 - OBJ
      ?auto_84635 - OBJ
      ?auto_84636 - OBJ
      ?auto_84633 - LOCATION
    )
    :vars
    (
      ?auto_84641 - OBJ
      ?auto_84637 - LOCATION
      ?auto_84638 - CITY
      ?auto_84639 - TRUCK
      ?auto_84640 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84635 ?auto_84634 ) ) ( not ( = ?auto_84636 ?auto_84634 ) ) ( not ( = ?auto_84636 ?auto_84635 ) ) ( not ( = ?auto_84635 ?auto_84641 ) ) ( IN-CITY ?auto_84637 ?auto_84638 ) ( IN-CITY ?auto_84633 ?auto_84638 ) ( not ( = ?auto_84633 ?auto_84637 ) ) ( OBJ-AT ?auto_84641 ?auto_84633 ) ( OBJ-AT ?auto_84635 ?auto_84637 ) ( not ( = ?auto_84634 ?auto_84641 ) ) ( TRUCK-AT ?auto_84639 ?auto_84640 ) ( IN-CITY ?auto_84640 ?auto_84638 ) ( not ( = ?auto_84633 ?auto_84640 ) ) ( not ( = ?auto_84637 ?auto_84640 ) ) ( OBJ-AT ?auto_84634 ?auto_84640 ) ( OBJ-AT ?auto_84636 ?auto_84633 ) ( not ( = ?auto_84636 ?auto_84641 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84641 ?auto_84635 ?auto_84633 )
      ( DELIVER-3PKG-VERIFY ?auto_84634 ?auto_84635 ?auto_84636 ?auto_84633 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_84670 - OBJ
      ?auto_84671 - OBJ
      ?auto_84672 - OBJ
      ?auto_84669 - LOCATION
    )
    :vars
    (
      ?auto_84673 - LOCATION
      ?auto_84675 - CITY
      ?auto_84674 - OBJ
      ?auto_84676 - TRUCK
      ?auto_84677 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84671 ?auto_84670 ) ) ( not ( = ?auto_84672 ?auto_84670 ) ) ( not ( = ?auto_84672 ?auto_84671 ) ) ( IN-CITY ?auto_84673 ?auto_84675 ) ( IN-CITY ?auto_84669 ?auto_84675 ) ( not ( = ?auto_84669 ?auto_84673 ) ) ( OBJ-AT ?auto_84671 ?auto_84669 ) ( OBJ-AT ?auto_84670 ?auto_84673 ) ( not ( = ?auto_84674 ?auto_84671 ) ) ( not ( = ?auto_84670 ?auto_84674 ) ) ( TRUCK-AT ?auto_84676 ?auto_84677 ) ( IN-CITY ?auto_84677 ?auto_84675 ) ( not ( = ?auto_84669 ?auto_84677 ) ) ( not ( = ?auto_84673 ?auto_84677 ) ) ( OBJ-AT ?auto_84674 ?auto_84677 ) ( OBJ-AT ?auto_84672 ?auto_84669 ) ( not ( = ?auto_84672 ?auto_84674 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84671 ?auto_84670 ?auto_84669 )
      ( DELIVER-3PKG-VERIFY ?auto_84670 ?auto_84671 ?auto_84672 ?auto_84669 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_84679 - OBJ
      ?auto_84680 - OBJ
      ?auto_84681 - OBJ
      ?auto_84678 - LOCATION
    )
    :vars
    (
      ?auto_84682 - LOCATION
      ?auto_84683 - CITY
      ?auto_84684 - TRUCK
      ?auto_84685 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84680 ?auto_84679 ) ) ( not ( = ?auto_84681 ?auto_84679 ) ) ( not ( = ?auto_84681 ?auto_84680 ) ) ( IN-CITY ?auto_84682 ?auto_84683 ) ( IN-CITY ?auto_84678 ?auto_84683 ) ( not ( = ?auto_84678 ?auto_84682 ) ) ( OBJ-AT ?auto_84680 ?auto_84678 ) ( OBJ-AT ?auto_84679 ?auto_84682 ) ( TRUCK-AT ?auto_84684 ?auto_84685 ) ( IN-CITY ?auto_84685 ?auto_84683 ) ( not ( = ?auto_84678 ?auto_84685 ) ) ( not ( = ?auto_84682 ?auto_84685 ) ) ( OBJ-AT ?auto_84681 ?auto_84685 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84680 ?auto_84679 ?auto_84678 )
      ( DELIVER-3PKG-VERIFY ?auto_84679 ?auto_84680 ?auto_84681 ?auto_84678 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_84696 - OBJ
      ?auto_84697 - OBJ
      ?auto_84698 - OBJ
      ?auto_84695 - LOCATION
    )
    :vars
    (
      ?auto_84699 - LOCATION
      ?auto_84701 - CITY
      ?auto_84700 - OBJ
      ?auto_84702 - TRUCK
      ?auto_84703 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84697 ?auto_84696 ) ) ( not ( = ?auto_84698 ?auto_84696 ) ) ( not ( = ?auto_84698 ?auto_84697 ) ) ( IN-CITY ?auto_84699 ?auto_84701 ) ( IN-CITY ?auto_84695 ?auto_84701 ) ( not ( = ?auto_84695 ?auto_84699 ) ) ( OBJ-AT ?auto_84698 ?auto_84695 ) ( OBJ-AT ?auto_84696 ?auto_84699 ) ( not ( = ?auto_84700 ?auto_84698 ) ) ( not ( = ?auto_84696 ?auto_84700 ) ) ( TRUCK-AT ?auto_84702 ?auto_84703 ) ( IN-CITY ?auto_84703 ?auto_84701 ) ( not ( = ?auto_84695 ?auto_84703 ) ) ( not ( = ?auto_84699 ?auto_84703 ) ) ( OBJ-AT ?auto_84700 ?auto_84703 ) ( OBJ-AT ?auto_84697 ?auto_84695 ) ( not ( = ?auto_84697 ?auto_84700 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84698 ?auto_84696 ?auto_84695 )
      ( DELIVER-3PKG-VERIFY ?auto_84696 ?auto_84697 ?auto_84698 ?auto_84695 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_84715 - OBJ
      ?auto_84716 - OBJ
      ?auto_84717 - OBJ
      ?auto_84714 - LOCATION
    )
    :vars
    (
      ?auto_84722 - OBJ
      ?auto_84718 - LOCATION
      ?auto_84719 - CITY
      ?auto_84720 - TRUCK
      ?auto_84721 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84716 ?auto_84715 ) ) ( not ( = ?auto_84717 ?auto_84715 ) ) ( not ( = ?auto_84717 ?auto_84716 ) ) ( not ( = ?auto_84715 ?auto_84722 ) ) ( IN-CITY ?auto_84718 ?auto_84719 ) ( IN-CITY ?auto_84714 ?auto_84719 ) ( not ( = ?auto_84714 ?auto_84718 ) ) ( OBJ-AT ?auto_84722 ?auto_84714 ) ( OBJ-AT ?auto_84715 ?auto_84718 ) ( not ( = ?auto_84717 ?auto_84722 ) ) ( TRUCK-AT ?auto_84720 ?auto_84721 ) ( IN-CITY ?auto_84721 ?auto_84719 ) ( not ( = ?auto_84714 ?auto_84721 ) ) ( not ( = ?auto_84718 ?auto_84721 ) ) ( OBJ-AT ?auto_84717 ?auto_84721 ) ( OBJ-AT ?auto_84716 ?auto_84714 ) ( not ( = ?auto_84716 ?auto_84722 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84722 ?auto_84715 ?auto_84714 )
      ( DELIVER-3PKG-VERIFY ?auto_84715 ?auto_84716 ?auto_84717 ?auto_84714 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_84734 - OBJ
      ?auto_84735 - OBJ
      ?auto_84736 - OBJ
      ?auto_84733 - LOCATION
    )
    :vars
    (
      ?auto_84737 - LOCATION
      ?auto_84738 - CITY
      ?auto_84739 - TRUCK
      ?auto_84740 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84735 ?auto_84734 ) ) ( not ( = ?auto_84736 ?auto_84734 ) ) ( not ( = ?auto_84736 ?auto_84735 ) ) ( IN-CITY ?auto_84737 ?auto_84738 ) ( IN-CITY ?auto_84733 ?auto_84738 ) ( not ( = ?auto_84733 ?auto_84737 ) ) ( OBJ-AT ?auto_84736 ?auto_84733 ) ( OBJ-AT ?auto_84734 ?auto_84737 ) ( TRUCK-AT ?auto_84739 ?auto_84740 ) ( IN-CITY ?auto_84740 ?auto_84738 ) ( not ( = ?auto_84733 ?auto_84740 ) ) ( not ( = ?auto_84737 ?auto_84740 ) ) ( OBJ-AT ?auto_84735 ?auto_84740 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84736 ?auto_84734 ?auto_84733 )
      ( DELIVER-3PKG-VERIFY ?auto_84734 ?auto_84735 ?auto_84736 ?auto_84733 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_84742 - OBJ
      ?auto_84743 - OBJ
      ?auto_84744 - OBJ
      ?auto_84741 - LOCATION
    )
    :vars
    (
      ?auto_84749 - OBJ
      ?auto_84745 - LOCATION
      ?auto_84746 - CITY
      ?auto_84747 - TRUCK
      ?auto_84748 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84743 ?auto_84742 ) ) ( not ( = ?auto_84744 ?auto_84742 ) ) ( not ( = ?auto_84744 ?auto_84743 ) ) ( not ( = ?auto_84742 ?auto_84749 ) ) ( IN-CITY ?auto_84745 ?auto_84746 ) ( IN-CITY ?auto_84741 ?auto_84746 ) ( not ( = ?auto_84741 ?auto_84745 ) ) ( OBJ-AT ?auto_84749 ?auto_84741 ) ( OBJ-AT ?auto_84742 ?auto_84745 ) ( not ( = ?auto_84743 ?auto_84749 ) ) ( TRUCK-AT ?auto_84747 ?auto_84748 ) ( IN-CITY ?auto_84748 ?auto_84746 ) ( not ( = ?auto_84741 ?auto_84748 ) ) ( not ( = ?auto_84745 ?auto_84748 ) ) ( OBJ-AT ?auto_84743 ?auto_84748 ) ( OBJ-AT ?auto_84744 ?auto_84741 ) ( not ( = ?auto_84744 ?auto_84749 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84749 ?auto_84742 ?auto_84741 )
      ( DELIVER-3PKG-VERIFY ?auto_84742 ?auto_84743 ?auto_84744 ?auto_84741 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_84895 - OBJ
      ?auto_84896 - OBJ
      ?auto_84897 - OBJ
      ?auto_84898 - OBJ
      ?auto_84894 - LOCATION
    )
    :vars
    (
      ?auto_84899 - LOCATION
      ?auto_84900 - CITY
      ?auto_84901 - TRUCK
      ?auto_84902 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84896 ?auto_84895 ) ) ( not ( = ?auto_84897 ?auto_84895 ) ) ( not ( = ?auto_84897 ?auto_84896 ) ) ( not ( = ?auto_84898 ?auto_84895 ) ) ( not ( = ?auto_84898 ?auto_84896 ) ) ( not ( = ?auto_84898 ?auto_84897 ) ) ( IN-CITY ?auto_84899 ?auto_84900 ) ( IN-CITY ?auto_84894 ?auto_84900 ) ( not ( = ?auto_84894 ?auto_84899 ) ) ( OBJ-AT ?auto_84895 ?auto_84894 ) ( OBJ-AT ?auto_84898 ?auto_84899 ) ( TRUCK-AT ?auto_84901 ?auto_84902 ) ( IN-CITY ?auto_84902 ?auto_84900 ) ( not ( = ?auto_84894 ?auto_84902 ) ) ( not ( = ?auto_84899 ?auto_84902 ) ) ( OBJ-AT ?auto_84897 ?auto_84902 ) ( OBJ-AT ?auto_84896 ?auto_84894 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84895 ?auto_84898 ?auto_84894 )
      ( DELIVER-4PKG-VERIFY ?auto_84895 ?auto_84896 ?auto_84897 ?auto_84898 ?auto_84894 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_84924 - OBJ
      ?auto_84925 - OBJ
      ?auto_84926 - OBJ
      ?auto_84927 - OBJ
      ?auto_84923 - LOCATION
    )
    :vars
    (
      ?auto_84928 - LOCATION
      ?auto_84929 - CITY
      ?auto_84930 - TRUCK
      ?auto_84931 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84925 ?auto_84924 ) ) ( not ( = ?auto_84926 ?auto_84924 ) ) ( not ( = ?auto_84926 ?auto_84925 ) ) ( not ( = ?auto_84927 ?auto_84924 ) ) ( not ( = ?auto_84927 ?auto_84925 ) ) ( not ( = ?auto_84927 ?auto_84926 ) ) ( IN-CITY ?auto_84928 ?auto_84929 ) ( IN-CITY ?auto_84923 ?auto_84929 ) ( not ( = ?auto_84923 ?auto_84928 ) ) ( OBJ-AT ?auto_84924 ?auto_84923 ) ( OBJ-AT ?auto_84926 ?auto_84928 ) ( TRUCK-AT ?auto_84930 ?auto_84931 ) ( IN-CITY ?auto_84931 ?auto_84929 ) ( not ( = ?auto_84923 ?auto_84931 ) ) ( not ( = ?auto_84928 ?auto_84931 ) ) ( OBJ-AT ?auto_84927 ?auto_84931 ) ( OBJ-AT ?auto_84925 ?auto_84923 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84924 ?auto_84926 ?auto_84923 )
      ( DELIVER-4PKG-VERIFY ?auto_84924 ?auto_84925 ?auto_84926 ?auto_84927 ?auto_84923 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_84952 - OBJ
      ?auto_84953 - OBJ
      ?auto_84954 - OBJ
      ?auto_84955 - OBJ
      ?auto_84951 - LOCATION
    )
    :vars
    (
      ?auto_84956 - LOCATION
      ?auto_84957 - CITY
      ?auto_84958 - TRUCK
      ?auto_84959 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84953 ?auto_84952 ) ) ( not ( = ?auto_84954 ?auto_84952 ) ) ( not ( = ?auto_84954 ?auto_84953 ) ) ( not ( = ?auto_84955 ?auto_84952 ) ) ( not ( = ?auto_84955 ?auto_84953 ) ) ( not ( = ?auto_84955 ?auto_84954 ) ) ( IN-CITY ?auto_84956 ?auto_84957 ) ( IN-CITY ?auto_84951 ?auto_84957 ) ( not ( = ?auto_84951 ?auto_84956 ) ) ( OBJ-AT ?auto_84952 ?auto_84951 ) ( OBJ-AT ?auto_84955 ?auto_84956 ) ( TRUCK-AT ?auto_84958 ?auto_84959 ) ( IN-CITY ?auto_84959 ?auto_84957 ) ( not ( = ?auto_84951 ?auto_84959 ) ) ( not ( = ?auto_84956 ?auto_84959 ) ) ( OBJ-AT ?auto_84953 ?auto_84959 ) ( OBJ-AT ?auto_84954 ?auto_84951 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84952 ?auto_84955 ?auto_84951 )
      ( DELIVER-4PKG-VERIFY ?auto_84952 ?auto_84953 ?auto_84954 ?auto_84955 ?auto_84951 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_84979 - OBJ
      ?auto_84980 - OBJ
      ?auto_84981 - OBJ
      ?auto_84982 - OBJ
      ?auto_84978 - LOCATION
    )
    :vars
    (
      ?auto_84983 - LOCATION
      ?auto_84984 - CITY
      ?auto_84985 - TRUCK
      ?auto_84986 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_84980 ?auto_84979 ) ) ( not ( = ?auto_84981 ?auto_84979 ) ) ( not ( = ?auto_84981 ?auto_84980 ) ) ( not ( = ?auto_84982 ?auto_84979 ) ) ( not ( = ?auto_84982 ?auto_84980 ) ) ( not ( = ?auto_84982 ?auto_84981 ) ) ( IN-CITY ?auto_84983 ?auto_84984 ) ( IN-CITY ?auto_84978 ?auto_84984 ) ( not ( = ?auto_84978 ?auto_84983 ) ) ( OBJ-AT ?auto_84979 ?auto_84978 ) ( OBJ-AT ?auto_84981 ?auto_84983 ) ( TRUCK-AT ?auto_84985 ?auto_84986 ) ( IN-CITY ?auto_84986 ?auto_84984 ) ( not ( = ?auto_84978 ?auto_84986 ) ) ( not ( = ?auto_84983 ?auto_84986 ) ) ( OBJ-AT ?auto_84980 ?auto_84986 ) ( OBJ-AT ?auto_84982 ?auto_84978 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84979 ?auto_84981 ?auto_84978 )
      ( DELIVER-4PKG-VERIFY ?auto_84979 ?auto_84980 ?auto_84981 ?auto_84982 ?auto_84978 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_85065 - OBJ
      ?auto_85066 - OBJ
      ?auto_85067 - OBJ
      ?auto_85068 - OBJ
      ?auto_85064 - LOCATION
    )
    :vars
    (
      ?auto_85069 - LOCATION
      ?auto_85070 - CITY
      ?auto_85071 - TRUCK
      ?auto_85072 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_85066 ?auto_85065 ) ) ( not ( = ?auto_85067 ?auto_85065 ) ) ( not ( = ?auto_85067 ?auto_85066 ) ) ( not ( = ?auto_85068 ?auto_85065 ) ) ( not ( = ?auto_85068 ?auto_85066 ) ) ( not ( = ?auto_85068 ?auto_85067 ) ) ( IN-CITY ?auto_85069 ?auto_85070 ) ( IN-CITY ?auto_85064 ?auto_85070 ) ( not ( = ?auto_85064 ?auto_85069 ) ) ( OBJ-AT ?auto_85065 ?auto_85064 ) ( OBJ-AT ?auto_85066 ?auto_85069 ) ( TRUCK-AT ?auto_85071 ?auto_85072 ) ( IN-CITY ?auto_85072 ?auto_85070 ) ( not ( = ?auto_85064 ?auto_85072 ) ) ( not ( = ?auto_85069 ?auto_85072 ) ) ( OBJ-AT ?auto_85068 ?auto_85072 ) ( OBJ-AT ?auto_85067 ?auto_85064 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_85065 ?auto_85066 ?auto_85064 )
      ( DELIVER-4PKG-VERIFY ?auto_85065 ?auto_85066 ?auto_85067 ?auto_85068 ?auto_85064 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_85093 - OBJ
      ?auto_85094 - OBJ
      ?auto_85095 - OBJ
      ?auto_85096 - OBJ
      ?auto_85092 - LOCATION
    )
    :vars
    (
      ?auto_85097 - LOCATION
      ?auto_85098 - CITY
      ?auto_85099 - TRUCK
      ?auto_85100 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_85094 ?auto_85093 ) ) ( not ( = ?auto_85095 ?auto_85093 ) ) ( not ( = ?auto_85095 ?auto_85094 ) ) ( not ( = ?auto_85096 ?auto_85093 ) ) ( not ( = ?auto_85096 ?auto_85094 ) ) ( not ( = ?auto_85096 ?auto_85095 ) ) ( IN-CITY ?auto_85097 ?auto_85098 ) ( IN-CITY ?auto_85092 ?auto_85098 ) ( not ( = ?auto_85092 ?auto_85097 ) ) ( OBJ-AT ?auto_85093 ?auto_85092 ) ( OBJ-AT ?auto_85094 ?auto_85097 ) ( TRUCK-AT ?auto_85099 ?auto_85100 ) ( IN-CITY ?auto_85100 ?auto_85098 ) ( not ( = ?auto_85092 ?auto_85100 ) ) ( not ( = ?auto_85097 ?auto_85100 ) ) ( OBJ-AT ?auto_85095 ?auto_85100 ) ( OBJ-AT ?auto_85096 ?auto_85092 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_85093 ?auto_85094 ?auto_85092 )
      ( DELIVER-4PKG-VERIFY ?auto_85093 ?auto_85094 ?auto_85095 ?auto_85096 ?auto_85092 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_85179 - OBJ
      ?auto_85180 - OBJ
      ?auto_85181 - OBJ
      ?auto_85182 - OBJ
      ?auto_85178 - LOCATION
    )
    :vars
    (
      ?auto_85183 - LOCATION
      ?auto_85184 - CITY
      ?auto_85185 - TRUCK
      ?auto_85186 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_85180 ?auto_85179 ) ) ( not ( = ?auto_85181 ?auto_85179 ) ) ( not ( = ?auto_85181 ?auto_85180 ) ) ( not ( = ?auto_85182 ?auto_85179 ) ) ( not ( = ?auto_85182 ?auto_85180 ) ) ( not ( = ?auto_85182 ?auto_85181 ) ) ( IN-CITY ?auto_85183 ?auto_85184 ) ( IN-CITY ?auto_85178 ?auto_85184 ) ( not ( = ?auto_85178 ?auto_85183 ) ) ( OBJ-AT ?auto_85180 ?auto_85178 ) ( OBJ-AT ?auto_85182 ?auto_85183 ) ( TRUCK-AT ?auto_85185 ?auto_85186 ) ( IN-CITY ?auto_85186 ?auto_85184 ) ( not ( = ?auto_85178 ?auto_85186 ) ) ( not ( = ?auto_85183 ?auto_85186 ) ) ( OBJ-AT ?auto_85181 ?auto_85186 ) ( OBJ-AT ?auto_85179 ?auto_85178 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_85180 ?auto_85182 ?auto_85178 )
      ( DELIVER-4PKG-VERIFY ?auto_85179 ?auto_85180 ?auto_85181 ?auto_85182 ?auto_85178 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_85208 - OBJ
      ?auto_85209 - OBJ
      ?auto_85210 - OBJ
      ?auto_85211 - OBJ
      ?auto_85207 - LOCATION
    )
    :vars
    (
      ?auto_85212 - LOCATION
      ?auto_85213 - CITY
      ?auto_85214 - TRUCK
      ?auto_85215 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_85209 ?auto_85208 ) ) ( not ( = ?auto_85210 ?auto_85208 ) ) ( not ( = ?auto_85210 ?auto_85209 ) ) ( not ( = ?auto_85211 ?auto_85208 ) ) ( not ( = ?auto_85211 ?auto_85209 ) ) ( not ( = ?auto_85211 ?auto_85210 ) ) ( IN-CITY ?auto_85212 ?auto_85213 ) ( IN-CITY ?auto_85207 ?auto_85213 ) ( not ( = ?auto_85207 ?auto_85212 ) ) ( OBJ-AT ?auto_85209 ?auto_85207 ) ( OBJ-AT ?auto_85210 ?auto_85212 ) ( TRUCK-AT ?auto_85214 ?auto_85215 ) ( IN-CITY ?auto_85215 ?auto_85213 ) ( not ( = ?auto_85207 ?auto_85215 ) ) ( not ( = ?auto_85212 ?auto_85215 ) ) ( OBJ-AT ?auto_85211 ?auto_85215 ) ( OBJ-AT ?auto_85208 ?auto_85207 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_85209 ?auto_85210 ?auto_85207 )
      ( DELIVER-4PKG-VERIFY ?auto_85208 ?auto_85209 ?auto_85210 ?auto_85211 ?auto_85207 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_85300 - OBJ
      ?auto_85301 - OBJ
      ?auto_85302 - OBJ
      ?auto_85303 - OBJ
      ?auto_85299 - LOCATION
    )
    :vars
    (
      ?auto_85304 - LOCATION
      ?auto_85305 - CITY
      ?auto_85306 - TRUCK
      ?auto_85307 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_85301 ?auto_85300 ) ) ( not ( = ?auto_85302 ?auto_85300 ) ) ( not ( = ?auto_85302 ?auto_85301 ) ) ( not ( = ?auto_85303 ?auto_85300 ) ) ( not ( = ?auto_85303 ?auto_85301 ) ) ( not ( = ?auto_85303 ?auto_85302 ) ) ( IN-CITY ?auto_85304 ?auto_85305 ) ( IN-CITY ?auto_85299 ?auto_85305 ) ( not ( = ?auto_85299 ?auto_85304 ) ) ( OBJ-AT ?auto_85302 ?auto_85299 ) ( OBJ-AT ?auto_85303 ?auto_85304 ) ( TRUCK-AT ?auto_85306 ?auto_85307 ) ( IN-CITY ?auto_85307 ?auto_85305 ) ( not ( = ?auto_85299 ?auto_85307 ) ) ( not ( = ?auto_85304 ?auto_85307 ) ) ( OBJ-AT ?auto_85301 ?auto_85307 ) ( OBJ-AT ?auto_85300 ?auto_85299 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_85302 ?auto_85303 ?auto_85299 )
      ( DELIVER-4PKG-VERIFY ?auto_85300 ?auto_85301 ?auto_85302 ?auto_85303 ?auto_85299 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_85329 - OBJ
      ?auto_85330 - OBJ
      ?auto_85331 - OBJ
      ?auto_85332 - OBJ
      ?auto_85328 - LOCATION
    )
    :vars
    (
      ?auto_85333 - LOCATION
      ?auto_85334 - CITY
      ?auto_85335 - TRUCK
      ?auto_85336 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_85330 ?auto_85329 ) ) ( not ( = ?auto_85331 ?auto_85329 ) ) ( not ( = ?auto_85331 ?auto_85330 ) ) ( not ( = ?auto_85332 ?auto_85329 ) ) ( not ( = ?auto_85332 ?auto_85330 ) ) ( not ( = ?auto_85332 ?auto_85331 ) ) ( IN-CITY ?auto_85333 ?auto_85334 ) ( IN-CITY ?auto_85328 ?auto_85334 ) ( not ( = ?auto_85328 ?auto_85333 ) ) ( OBJ-AT ?auto_85332 ?auto_85328 ) ( OBJ-AT ?auto_85331 ?auto_85333 ) ( TRUCK-AT ?auto_85335 ?auto_85336 ) ( IN-CITY ?auto_85336 ?auto_85334 ) ( not ( = ?auto_85328 ?auto_85336 ) ) ( not ( = ?auto_85333 ?auto_85336 ) ) ( OBJ-AT ?auto_85330 ?auto_85336 ) ( OBJ-AT ?auto_85329 ?auto_85328 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_85332 ?auto_85331 ?auto_85328 )
      ( DELIVER-4PKG-VERIFY ?auto_85329 ?auto_85330 ?auto_85331 ?auto_85332 ?auto_85328 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_85388 - OBJ
      ?auto_85389 - OBJ
      ?auto_85390 - OBJ
      ?auto_85391 - OBJ
      ?auto_85387 - LOCATION
    )
    :vars
    (
      ?auto_85392 - LOCATION
      ?auto_85393 - CITY
      ?auto_85394 - TRUCK
      ?auto_85395 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_85389 ?auto_85388 ) ) ( not ( = ?auto_85390 ?auto_85388 ) ) ( not ( = ?auto_85390 ?auto_85389 ) ) ( not ( = ?auto_85391 ?auto_85388 ) ) ( not ( = ?auto_85391 ?auto_85389 ) ) ( not ( = ?auto_85391 ?auto_85390 ) ) ( IN-CITY ?auto_85392 ?auto_85393 ) ( IN-CITY ?auto_85387 ?auto_85393 ) ( not ( = ?auto_85387 ?auto_85392 ) ) ( OBJ-AT ?auto_85390 ?auto_85387 ) ( OBJ-AT ?auto_85389 ?auto_85392 ) ( TRUCK-AT ?auto_85394 ?auto_85395 ) ( IN-CITY ?auto_85395 ?auto_85393 ) ( not ( = ?auto_85387 ?auto_85395 ) ) ( not ( = ?auto_85392 ?auto_85395 ) ) ( OBJ-AT ?auto_85391 ?auto_85395 ) ( OBJ-AT ?auto_85388 ?auto_85387 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_85390 ?auto_85389 ?auto_85387 )
      ( DELIVER-4PKG-VERIFY ?auto_85388 ?auto_85389 ?auto_85390 ?auto_85391 ?auto_85387 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_85449 - OBJ
      ?auto_85450 - OBJ
      ?auto_85451 - OBJ
      ?auto_85452 - OBJ
      ?auto_85448 - LOCATION
    )
    :vars
    (
      ?auto_85453 - LOCATION
      ?auto_85454 - CITY
      ?auto_85455 - TRUCK
      ?auto_85456 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_85450 ?auto_85449 ) ) ( not ( = ?auto_85451 ?auto_85449 ) ) ( not ( = ?auto_85451 ?auto_85450 ) ) ( not ( = ?auto_85452 ?auto_85449 ) ) ( not ( = ?auto_85452 ?auto_85450 ) ) ( not ( = ?auto_85452 ?auto_85451 ) ) ( IN-CITY ?auto_85453 ?auto_85454 ) ( IN-CITY ?auto_85448 ?auto_85454 ) ( not ( = ?auto_85448 ?auto_85453 ) ) ( OBJ-AT ?auto_85452 ?auto_85448 ) ( OBJ-AT ?auto_85450 ?auto_85453 ) ( TRUCK-AT ?auto_85455 ?auto_85456 ) ( IN-CITY ?auto_85456 ?auto_85454 ) ( not ( = ?auto_85448 ?auto_85456 ) ) ( not ( = ?auto_85453 ?auto_85456 ) ) ( OBJ-AT ?auto_85451 ?auto_85456 ) ( OBJ-AT ?auto_85449 ?auto_85448 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_85452 ?auto_85450 ?auto_85448 )
      ( DELIVER-4PKG-VERIFY ?auto_85449 ?auto_85450 ?auto_85451 ?auto_85452 ?auto_85448 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_85539 - OBJ
      ?auto_85540 - OBJ
      ?auto_85541 - OBJ
      ?auto_85542 - OBJ
      ?auto_85538 - LOCATION
    )
    :vars
    (
      ?auto_85543 - LOCATION
      ?auto_85544 - CITY
      ?auto_85545 - TRUCK
      ?auto_85546 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_85540 ?auto_85539 ) ) ( not ( = ?auto_85541 ?auto_85539 ) ) ( not ( = ?auto_85541 ?auto_85540 ) ) ( not ( = ?auto_85542 ?auto_85539 ) ) ( not ( = ?auto_85542 ?auto_85540 ) ) ( not ( = ?auto_85542 ?auto_85541 ) ) ( IN-CITY ?auto_85543 ?auto_85544 ) ( IN-CITY ?auto_85538 ?auto_85544 ) ( not ( = ?auto_85538 ?auto_85543 ) ) ( OBJ-AT ?auto_85540 ?auto_85538 ) ( OBJ-AT ?auto_85542 ?auto_85543 ) ( TRUCK-AT ?auto_85545 ?auto_85546 ) ( IN-CITY ?auto_85546 ?auto_85544 ) ( not ( = ?auto_85538 ?auto_85546 ) ) ( not ( = ?auto_85543 ?auto_85546 ) ) ( OBJ-AT ?auto_85539 ?auto_85546 ) ( OBJ-AT ?auto_85541 ?auto_85538 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_85540 ?auto_85542 ?auto_85538 )
      ( DELIVER-4PKG-VERIFY ?auto_85539 ?auto_85540 ?auto_85541 ?auto_85542 ?auto_85538 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_85566 - OBJ
      ?auto_85567 - OBJ
      ?auto_85568 - OBJ
      ?auto_85569 - OBJ
      ?auto_85565 - LOCATION
    )
    :vars
    (
      ?auto_85570 - LOCATION
      ?auto_85571 - CITY
      ?auto_85572 - TRUCK
      ?auto_85573 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_85567 ?auto_85566 ) ) ( not ( = ?auto_85568 ?auto_85566 ) ) ( not ( = ?auto_85568 ?auto_85567 ) ) ( not ( = ?auto_85569 ?auto_85566 ) ) ( not ( = ?auto_85569 ?auto_85567 ) ) ( not ( = ?auto_85569 ?auto_85568 ) ) ( IN-CITY ?auto_85570 ?auto_85571 ) ( IN-CITY ?auto_85565 ?auto_85571 ) ( not ( = ?auto_85565 ?auto_85570 ) ) ( OBJ-AT ?auto_85567 ?auto_85565 ) ( OBJ-AT ?auto_85568 ?auto_85570 ) ( TRUCK-AT ?auto_85572 ?auto_85573 ) ( IN-CITY ?auto_85573 ?auto_85571 ) ( not ( = ?auto_85565 ?auto_85573 ) ) ( not ( = ?auto_85570 ?auto_85573 ) ) ( OBJ-AT ?auto_85566 ?auto_85573 ) ( OBJ-AT ?auto_85569 ?auto_85565 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_85567 ?auto_85568 ?auto_85565 )
      ( DELIVER-4PKG-VERIFY ?auto_85566 ?auto_85567 ?auto_85568 ?auto_85569 ?auto_85565 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_85593 - OBJ
      ?auto_85594 - OBJ
      ?auto_85595 - OBJ
      ?auto_85596 - OBJ
      ?auto_85592 - LOCATION
    )
    :vars
    (
      ?auto_85597 - LOCATION
      ?auto_85598 - CITY
      ?auto_85599 - TRUCK
      ?auto_85600 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_85594 ?auto_85593 ) ) ( not ( = ?auto_85595 ?auto_85593 ) ) ( not ( = ?auto_85595 ?auto_85594 ) ) ( not ( = ?auto_85596 ?auto_85593 ) ) ( not ( = ?auto_85596 ?auto_85594 ) ) ( not ( = ?auto_85596 ?auto_85595 ) ) ( IN-CITY ?auto_85597 ?auto_85598 ) ( IN-CITY ?auto_85592 ?auto_85598 ) ( not ( = ?auto_85592 ?auto_85597 ) ) ( OBJ-AT ?auto_85595 ?auto_85592 ) ( OBJ-AT ?auto_85596 ?auto_85597 ) ( TRUCK-AT ?auto_85599 ?auto_85600 ) ( IN-CITY ?auto_85600 ?auto_85598 ) ( not ( = ?auto_85592 ?auto_85600 ) ) ( not ( = ?auto_85597 ?auto_85600 ) ) ( OBJ-AT ?auto_85593 ?auto_85600 ) ( OBJ-AT ?auto_85594 ?auto_85592 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_85595 ?auto_85596 ?auto_85592 )
      ( DELIVER-4PKG-VERIFY ?auto_85593 ?auto_85594 ?auto_85595 ?auto_85596 ?auto_85592 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_85622 - OBJ
      ?auto_85623 - OBJ
      ?auto_85624 - OBJ
      ?auto_85625 - OBJ
      ?auto_85621 - LOCATION
    )
    :vars
    (
      ?auto_85626 - LOCATION
      ?auto_85627 - CITY
      ?auto_85628 - TRUCK
      ?auto_85629 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_85623 ?auto_85622 ) ) ( not ( = ?auto_85624 ?auto_85622 ) ) ( not ( = ?auto_85624 ?auto_85623 ) ) ( not ( = ?auto_85625 ?auto_85622 ) ) ( not ( = ?auto_85625 ?auto_85623 ) ) ( not ( = ?auto_85625 ?auto_85624 ) ) ( IN-CITY ?auto_85626 ?auto_85627 ) ( IN-CITY ?auto_85621 ?auto_85627 ) ( not ( = ?auto_85621 ?auto_85626 ) ) ( OBJ-AT ?auto_85625 ?auto_85621 ) ( OBJ-AT ?auto_85624 ?auto_85626 ) ( TRUCK-AT ?auto_85628 ?auto_85629 ) ( IN-CITY ?auto_85629 ?auto_85627 ) ( not ( = ?auto_85621 ?auto_85629 ) ) ( not ( = ?auto_85626 ?auto_85629 ) ) ( OBJ-AT ?auto_85622 ?auto_85629 ) ( OBJ-AT ?auto_85623 ?auto_85621 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_85625 ?auto_85624 ?auto_85621 )
      ( DELIVER-4PKG-VERIFY ?auto_85622 ?auto_85623 ?auto_85624 ?auto_85625 ?auto_85621 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_85738 - OBJ
      ?auto_85739 - OBJ
      ?auto_85740 - OBJ
      ?auto_85741 - OBJ
      ?auto_85737 - LOCATION
    )
    :vars
    (
      ?auto_85742 - LOCATION
      ?auto_85743 - CITY
      ?auto_85744 - TRUCK
      ?auto_85745 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_85739 ?auto_85738 ) ) ( not ( = ?auto_85740 ?auto_85738 ) ) ( not ( = ?auto_85740 ?auto_85739 ) ) ( not ( = ?auto_85741 ?auto_85738 ) ) ( not ( = ?auto_85741 ?auto_85739 ) ) ( not ( = ?auto_85741 ?auto_85740 ) ) ( IN-CITY ?auto_85742 ?auto_85743 ) ( IN-CITY ?auto_85737 ?auto_85743 ) ( not ( = ?auto_85737 ?auto_85742 ) ) ( OBJ-AT ?auto_85740 ?auto_85737 ) ( OBJ-AT ?auto_85739 ?auto_85742 ) ( TRUCK-AT ?auto_85744 ?auto_85745 ) ( IN-CITY ?auto_85745 ?auto_85743 ) ( not ( = ?auto_85737 ?auto_85745 ) ) ( not ( = ?auto_85742 ?auto_85745 ) ) ( OBJ-AT ?auto_85738 ?auto_85745 ) ( OBJ-AT ?auto_85741 ?auto_85737 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_85740 ?auto_85739 ?auto_85737 )
      ( DELIVER-4PKG-VERIFY ?auto_85738 ?auto_85739 ?auto_85740 ?auto_85741 ?auto_85737 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_85765 - OBJ
      ?auto_85766 - OBJ
      ?auto_85767 - OBJ
      ?auto_85768 - OBJ
      ?auto_85764 - LOCATION
    )
    :vars
    (
      ?auto_85769 - LOCATION
      ?auto_85770 - CITY
      ?auto_85771 - TRUCK
      ?auto_85772 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_85766 ?auto_85765 ) ) ( not ( = ?auto_85767 ?auto_85765 ) ) ( not ( = ?auto_85767 ?auto_85766 ) ) ( not ( = ?auto_85768 ?auto_85765 ) ) ( not ( = ?auto_85768 ?auto_85766 ) ) ( not ( = ?auto_85768 ?auto_85767 ) ) ( IN-CITY ?auto_85769 ?auto_85770 ) ( IN-CITY ?auto_85764 ?auto_85770 ) ( not ( = ?auto_85764 ?auto_85769 ) ) ( OBJ-AT ?auto_85768 ?auto_85764 ) ( OBJ-AT ?auto_85766 ?auto_85769 ) ( TRUCK-AT ?auto_85771 ?auto_85772 ) ( IN-CITY ?auto_85772 ?auto_85770 ) ( not ( = ?auto_85764 ?auto_85772 ) ) ( not ( = ?auto_85769 ?auto_85772 ) ) ( OBJ-AT ?auto_85765 ?auto_85772 ) ( OBJ-AT ?auto_85767 ?auto_85764 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_85768 ?auto_85766 ?auto_85764 )
      ( DELIVER-4PKG-VERIFY ?auto_85765 ?auto_85766 ?auto_85767 ?auto_85768 ?auto_85764 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_85941 - OBJ
      ?auto_85942 - OBJ
      ?auto_85943 - OBJ
      ?auto_85944 - OBJ
      ?auto_85940 - LOCATION
    )
    :vars
    (
      ?auto_85945 - LOCATION
      ?auto_85946 - CITY
      ?auto_85947 - TRUCK
      ?auto_85948 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_85942 ?auto_85941 ) ) ( not ( = ?auto_85943 ?auto_85941 ) ) ( not ( = ?auto_85943 ?auto_85942 ) ) ( not ( = ?auto_85944 ?auto_85941 ) ) ( not ( = ?auto_85944 ?auto_85942 ) ) ( not ( = ?auto_85944 ?auto_85943 ) ) ( IN-CITY ?auto_85945 ?auto_85946 ) ( IN-CITY ?auto_85940 ?auto_85946 ) ( not ( = ?auto_85940 ?auto_85945 ) ) ( OBJ-AT ?auto_85942 ?auto_85940 ) ( OBJ-AT ?auto_85941 ?auto_85945 ) ( TRUCK-AT ?auto_85947 ?auto_85948 ) ( IN-CITY ?auto_85948 ?auto_85946 ) ( not ( = ?auto_85940 ?auto_85948 ) ) ( not ( = ?auto_85945 ?auto_85948 ) ) ( OBJ-AT ?auto_85944 ?auto_85948 ) ( OBJ-AT ?auto_85943 ?auto_85940 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_85942 ?auto_85941 ?auto_85940 )
      ( DELIVER-4PKG-VERIFY ?auto_85941 ?auto_85942 ?auto_85943 ?auto_85944 ?auto_85940 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_85969 - OBJ
      ?auto_85970 - OBJ
      ?auto_85971 - OBJ
      ?auto_85972 - OBJ
      ?auto_85968 - LOCATION
    )
    :vars
    (
      ?auto_85973 - LOCATION
      ?auto_85974 - CITY
      ?auto_85975 - TRUCK
      ?auto_85976 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_85970 ?auto_85969 ) ) ( not ( = ?auto_85971 ?auto_85969 ) ) ( not ( = ?auto_85971 ?auto_85970 ) ) ( not ( = ?auto_85972 ?auto_85969 ) ) ( not ( = ?auto_85972 ?auto_85970 ) ) ( not ( = ?auto_85972 ?auto_85971 ) ) ( IN-CITY ?auto_85973 ?auto_85974 ) ( IN-CITY ?auto_85968 ?auto_85974 ) ( not ( = ?auto_85968 ?auto_85973 ) ) ( OBJ-AT ?auto_85970 ?auto_85968 ) ( OBJ-AT ?auto_85969 ?auto_85973 ) ( TRUCK-AT ?auto_85975 ?auto_85976 ) ( IN-CITY ?auto_85976 ?auto_85974 ) ( not ( = ?auto_85968 ?auto_85976 ) ) ( not ( = ?auto_85973 ?auto_85976 ) ) ( OBJ-AT ?auto_85971 ?auto_85976 ) ( OBJ-AT ?auto_85972 ?auto_85968 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_85970 ?auto_85969 ?auto_85968 )
      ( DELIVER-4PKG-VERIFY ?auto_85969 ?auto_85970 ?auto_85971 ?auto_85972 ?auto_85968 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_86055 - OBJ
      ?auto_86056 - OBJ
      ?auto_86057 - OBJ
      ?auto_86058 - OBJ
      ?auto_86054 - LOCATION
    )
    :vars
    (
      ?auto_86059 - LOCATION
      ?auto_86060 - CITY
      ?auto_86061 - TRUCK
      ?auto_86062 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_86056 ?auto_86055 ) ) ( not ( = ?auto_86057 ?auto_86055 ) ) ( not ( = ?auto_86057 ?auto_86056 ) ) ( not ( = ?auto_86058 ?auto_86055 ) ) ( not ( = ?auto_86058 ?auto_86056 ) ) ( not ( = ?auto_86058 ?auto_86057 ) ) ( IN-CITY ?auto_86059 ?auto_86060 ) ( IN-CITY ?auto_86054 ?auto_86060 ) ( not ( = ?auto_86054 ?auto_86059 ) ) ( OBJ-AT ?auto_86057 ?auto_86054 ) ( OBJ-AT ?auto_86055 ?auto_86059 ) ( TRUCK-AT ?auto_86061 ?auto_86062 ) ( IN-CITY ?auto_86062 ?auto_86060 ) ( not ( = ?auto_86054 ?auto_86062 ) ) ( not ( = ?auto_86059 ?auto_86062 ) ) ( OBJ-AT ?auto_86058 ?auto_86062 ) ( OBJ-AT ?auto_86056 ?auto_86054 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86057 ?auto_86055 ?auto_86054 )
      ( DELIVER-4PKG-VERIFY ?auto_86055 ?auto_86056 ?auto_86057 ?auto_86058 ?auto_86054 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_86116 - OBJ
      ?auto_86117 - OBJ
      ?auto_86118 - OBJ
      ?auto_86119 - OBJ
      ?auto_86115 - LOCATION
    )
    :vars
    (
      ?auto_86120 - LOCATION
      ?auto_86121 - CITY
      ?auto_86122 - TRUCK
      ?auto_86123 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_86117 ?auto_86116 ) ) ( not ( = ?auto_86118 ?auto_86116 ) ) ( not ( = ?auto_86118 ?auto_86117 ) ) ( not ( = ?auto_86119 ?auto_86116 ) ) ( not ( = ?auto_86119 ?auto_86117 ) ) ( not ( = ?auto_86119 ?auto_86118 ) ) ( IN-CITY ?auto_86120 ?auto_86121 ) ( IN-CITY ?auto_86115 ?auto_86121 ) ( not ( = ?auto_86115 ?auto_86120 ) ) ( OBJ-AT ?auto_86119 ?auto_86115 ) ( OBJ-AT ?auto_86116 ?auto_86120 ) ( TRUCK-AT ?auto_86122 ?auto_86123 ) ( IN-CITY ?auto_86123 ?auto_86121 ) ( not ( = ?auto_86115 ?auto_86123 ) ) ( not ( = ?auto_86120 ?auto_86123 ) ) ( OBJ-AT ?auto_86118 ?auto_86123 ) ( OBJ-AT ?auto_86117 ?auto_86115 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86119 ?auto_86116 ?auto_86115 )
      ( DELIVER-4PKG-VERIFY ?auto_86116 ?auto_86117 ?auto_86118 ?auto_86119 ?auto_86115 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_86206 - OBJ
      ?auto_86207 - OBJ
      ?auto_86208 - OBJ
      ?auto_86209 - OBJ
      ?auto_86205 - LOCATION
    )
    :vars
    (
      ?auto_86210 - LOCATION
      ?auto_86211 - CITY
      ?auto_86212 - TRUCK
      ?auto_86213 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_86207 ?auto_86206 ) ) ( not ( = ?auto_86208 ?auto_86206 ) ) ( not ( = ?auto_86208 ?auto_86207 ) ) ( not ( = ?auto_86209 ?auto_86206 ) ) ( not ( = ?auto_86209 ?auto_86207 ) ) ( not ( = ?auto_86209 ?auto_86208 ) ) ( IN-CITY ?auto_86210 ?auto_86211 ) ( IN-CITY ?auto_86205 ?auto_86211 ) ( not ( = ?auto_86205 ?auto_86210 ) ) ( OBJ-AT ?auto_86208 ?auto_86205 ) ( OBJ-AT ?auto_86206 ?auto_86210 ) ( TRUCK-AT ?auto_86212 ?auto_86213 ) ( IN-CITY ?auto_86213 ?auto_86211 ) ( not ( = ?auto_86205 ?auto_86213 ) ) ( not ( = ?auto_86210 ?auto_86213 ) ) ( OBJ-AT ?auto_86207 ?auto_86213 ) ( OBJ-AT ?auto_86209 ?auto_86205 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86208 ?auto_86206 ?auto_86205 )
      ( DELIVER-4PKG-VERIFY ?auto_86206 ?auto_86207 ?auto_86208 ?auto_86209 ?auto_86205 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_86233 - OBJ
      ?auto_86234 - OBJ
      ?auto_86235 - OBJ
      ?auto_86236 - OBJ
      ?auto_86232 - LOCATION
    )
    :vars
    (
      ?auto_86237 - LOCATION
      ?auto_86238 - CITY
      ?auto_86239 - TRUCK
      ?auto_86240 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_86234 ?auto_86233 ) ) ( not ( = ?auto_86235 ?auto_86233 ) ) ( not ( = ?auto_86235 ?auto_86234 ) ) ( not ( = ?auto_86236 ?auto_86233 ) ) ( not ( = ?auto_86236 ?auto_86234 ) ) ( not ( = ?auto_86236 ?auto_86235 ) ) ( IN-CITY ?auto_86237 ?auto_86238 ) ( IN-CITY ?auto_86232 ?auto_86238 ) ( not ( = ?auto_86232 ?auto_86237 ) ) ( OBJ-AT ?auto_86236 ?auto_86232 ) ( OBJ-AT ?auto_86233 ?auto_86237 ) ( TRUCK-AT ?auto_86239 ?auto_86240 ) ( IN-CITY ?auto_86240 ?auto_86238 ) ( not ( = ?auto_86232 ?auto_86240 ) ) ( not ( = ?auto_86237 ?auto_86240 ) ) ( OBJ-AT ?auto_86234 ?auto_86240 ) ( OBJ-AT ?auto_86235 ?auto_86232 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86236 ?auto_86233 ?auto_86232 )
      ( DELIVER-4PKG-VERIFY ?auto_86233 ?auto_86234 ?auto_86235 ?auto_86236 ?auto_86232 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_86512 - OBJ
      ?auto_86511 - LOCATION
    )
    :vars
    (
      ?auto_86518 - OBJ
      ?auto_86513 - LOCATION
      ?auto_86515 - CITY
      ?auto_86514 - OBJ
      ?auto_86517 - LOCATION
      ?auto_86516 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86512 ?auto_86518 ) ) ( IN-CITY ?auto_86513 ?auto_86515 ) ( IN-CITY ?auto_86511 ?auto_86515 ) ( not ( = ?auto_86511 ?auto_86513 ) ) ( OBJ-AT ?auto_86518 ?auto_86511 ) ( OBJ-AT ?auto_86512 ?auto_86513 ) ( not ( = ?auto_86514 ?auto_86518 ) ) ( not ( = ?auto_86512 ?auto_86514 ) ) ( IN-CITY ?auto_86517 ?auto_86515 ) ( not ( = ?auto_86511 ?auto_86517 ) ) ( not ( = ?auto_86513 ?auto_86517 ) ) ( OBJ-AT ?auto_86514 ?auto_86517 ) ( TRUCK-AT ?auto_86516 ?auto_86511 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_86516 ?auto_86511 ?auto_86517 ?auto_86515 )
      ( DELIVER-2PKG ?auto_86518 ?auto_86512 ?auto_86511 )
      ( DELIVER-1PKG-VERIFY ?auto_86512 ?auto_86511 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_86520 - OBJ
      ?auto_86521 - OBJ
      ?auto_86519 - LOCATION
    )
    :vars
    (
      ?auto_86524 - LOCATION
      ?auto_86523 - CITY
      ?auto_86525 - OBJ
      ?auto_86522 - LOCATION
      ?auto_86526 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86521 ?auto_86520 ) ) ( IN-CITY ?auto_86524 ?auto_86523 ) ( IN-CITY ?auto_86519 ?auto_86523 ) ( not ( = ?auto_86519 ?auto_86524 ) ) ( OBJ-AT ?auto_86520 ?auto_86519 ) ( OBJ-AT ?auto_86521 ?auto_86524 ) ( not ( = ?auto_86525 ?auto_86520 ) ) ( not ( = ?auto_86521 ?auto_86525 ) ) ( IN-CITY ?auto_86522 ?auto_86523 ) ( not ( = ?auto_86519 ?auto_86522 ) ) ( not ( = ?auto_86524 ?auto_86522 ) ) ( OBJ-AT ?auto_86525 ?auto_86522 ) ( TRUCK-AT ?auto_86526 ?auto_86519 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_86521 ?auto_86519 )
      ( DELIVER-2PKG-VERIFY ?auto_86520 ?auto_86521 ?auto_86519 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_86528 - OBJ
      ?auto_86529 - OBJ
      ?auto_86527 - LOCATION
    )
    :vars
    (
      ?auto_86534 - OBJ
      ?auto_86535 - LOCATION
      ?auto_86530 - CITY
      ?auto_86532 - OBJ
      ?auto_86531 - LOCATION
      ?auto_86533 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86529 ?auto_86528 ) ) ( not ( = ?auto_86529 ?auto_86534 ) ) ( IN-CITY ?auto_86535 ?auto_86530 ) ( IN-CITY ?auto_86527 ?auto_86530 ) ( not ( = ?auto_86527 ?auto_86535 ) ) ( OBJ-AT ?auto_86534 ?auto_86527 ) ( OBJ-AT ?auto_86529 ?auto_86535 ) ( not ( = ?auto_86532 ?auto_86534 ) ) ( not ( = ?auto_86529 ?auto_86532 ) ) ( IN-CITY ?auto_86531 ?auto_86530 ) ( not ( = ?auto_86527 ?auto_86531 ) ) ( not ( = ?auto_86535 ?auto_86531 ) ) ( OBJ-AT ?auto_86532 ?auto_86531 ) ( TRUCK-AT ?auto_86533 ?auto_86527 ) ( OBJ-AT ?auto_86528 ?auto_86527 ) ( not ( = ?auto_86528 ?auto_86534 ) ) ( not ( = ?auto_86528 ?auto_86532 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86534 ?auto_86529 ?auto_86527 )
      ( DELIVER-2PKG-VERIFY ?auto_86528 ?auto_86529 ?auto_86527 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_86537 - OBJ
      ?auto_86538 - OBJ
      ?auto_86536 - LOCATION
    )
    :vars
    (
      ?auto_86542 - OBJ
      ?auto_86543 - LOCATION
      ?auto_86539 - CITY
      ?auto_86540 - LOCATION
      ?auto_86541 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86538 ?auto_86537 ) ) ( not ( = ?auto_86538 ?auto_86542 ) ) ( IN-CITY ?auto_86543 ?auto_86539 ) ( IN-CITY ?auto_86536 ?auto_86539 ) ( not ( = ?auto_86536 ?auto_86543 ) ) ( OBJ-AT ?auto_86542 ?auto_86536 ) ( OBJ-AT ?auto_86538 ?auto_86543 ) ( not ( = ?auto_86537 ?auto_86542 ) ) ( IN-CITY ?auto_86540 ?auto_86539 ) ( not ( = ?auto_86536 ?auto_86540 ) ) ( not ( = ?auto_86543 ?auto_86540 ) ) ( OBJ-AT ?auto_86537 ?auto_86540 ) ( TRUCK-AT ?auto_86541 ?auto_86536 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86542 ?auto_86538 ?auto_86536 )
      ( DELIVER-2PKG-VERIFY ?auto_86537 ?auto_86538 ?auto_86536 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_86545 - OBJ
      ?auto_86546 - OBJ
      ?auto_86544 - LOCATION
    )
    :vars
    (
      ?auto_86551 - LOCATION
      ?auto_86547 - CITY
      ?auto_86549 - OBJ
      ?auto_86548 - LOCATION
      ?auto_86550 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86546 ?auto_86545 ) ) ( IN-CITY ?auto_86551 ?auto_86547 ) ( IN-CITY ?auto_86544 ?auto_86547 ) ( not ( = ?auto_86544 ?auto_86551 ) ) ( OBJ-AT ?auto_86546 ?auto_86544 ) ( OBJ-AT ?auto_86545 ?auto_86551 ) ( not ( = ?auto_86549 ?auto_86546 ) ) ( not ( = ?auto_86545 ?auto_86549 ) ) ( IN-CITY ?auto_86548 ?auto_86547 ) ( not ( = ?auto_86544 ?auto_86548 ) ) ( not ( = ?auto_86551 ?auto_86548 ) ) ( OBJ-AT ?auto_86549 ?auto_86548 ) ( TRUCK-AT ?auto_86550 ?auto_86544 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86546 ?auto_86545 ?auto_86544 )
      ( DELIVER-2PKG-VERIFY ?auto_86545 ?auto_86546 ?auto_86544 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_86553 - OBJ
      ?auto_86554 - OBJ
      ?auto_86552 - LOCATION
    )
    :vars
    (
      ?auto_86559 - OBJ
      ?auto_86560 - LOCATION
      ?auto_86555 - CITY
      ?auto_86557 - OBJ
      ?auto_86556 - LOCATION
      ?auto_86558 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86554 ?auto_86553 ) ) ( not ( = ?auto_86553 ?auto_86559 ) ) ( IN-CITY ?auto_86560 ?auto_86555 ) ( IN-CITY ?auto_86552 ?auto_86555 ) ( not ( = ?auto_86552 ?auto_86560 ) ) ( OBJ-AT ?auto_86559 ?auto_86552 ) ( OBJ-AT ?auto_86553 ?auto_86560 ) ( not ( = ?auto_86557 ?auto_86559 ) ) ( not ( = ?auto_86553 ?auto_86557 ) ) ( IN-CITY ?auto_86556 ?auto_86555 ) ( not ( = ?auto_86552 ?auto_86556 ) ) ( not ( = ?auto_86560 ?auto_86556 ) ) ( OBJ-AT ?auto_86557 ?auto_86556 ) ( TRUCK-AT ?auto_86558 ?auto_86552 ) ( OBJ-AT ?auto_86554 ?auto_86552 ) ( not ( = ?auto_86554 ?auto_86559 ) ) ( not ( = ?auto_86554 ?auto_86557 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86559 ?auto_86553 ?auto_86552 )
      ( DELIVER-2PKG-VERIFY ?auto_86553 ?auto_86554 ?auto_86552 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_86562 - OBJ
      ?auto_86563 - OBJ
      ?auto_86561 - LOCATION
    )
    :vars
    (
      ?auto_86567 - OBJ
      ?auto_86568 - LOCATION
      ?auto_86564 - CITY
      ?auto_86565 - LOCATION
      ?auto_86566 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86563 ?auto_86562 ) ) ( not ( = ?auto_86562 ?auto_86567 ) ) ( IN-CITY ?auto_86568 ?auto_86564 ) ( IN-CITY ?auto_86561 ?auto_86564 ) ( not ( = ?auto_86561 ?auto_86568 ) ) ( OBJ-AT ?auto_86567 ?auto_86561 ) ( OBJ-AT ?auto_86562 ?auto_86568 ) ( not ( = ?auto_86563 ?auto_86567 ) ) ( IN-CITY ?auto_86565 ?auto_86564 ) ( not ( = ?auto_86561 ?auto_86565 ) ) ( not ( = ?auto_86568 ?auto_86565 ) ) ( OBJ-AT ?auto_86563 ?auto_86565 ) ( TRUCK-AT ?auto_86566 ?auto_86561 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86567 ?auto_86562 ?auto_86561 )
      ( DELIVER-2PKG-VERIFY ?auto_86562 ?auto_86563 ?auto_86561 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_86588 - OBJ
      ?auto_86589 - OBJ
      ?auto_86590 - OBJ
      ?auto_86587 - LOCATION
    )
    :vars
    (
      ?auto_86595 - LOCATION
      ?auto_86591 - CITY
      ?auto_86593 - OBJ
      ?auto_86592 - LOCATION
      ?auto_86594 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86589 ?auto_86588 ) ) ( not ( = ?auto_86590 ?auto_86588 ) ) ( not ( = ?auto_86590 ?auto_86589 ) ) ( IN-CITY ?auto_86595 ?auto_86591 ) ( IN-CITY ?auto_86587 ?auto_86591 ) ( not ( = ?auto_86587 ?auto_86595 ) ) ( OBJ-AT ?auto_86588 ?auto_86587 ) ( OBJ-AT ?auto_86590 ?auto_86595 ) ( not ( = ?auto_86593 ?auto_86588 ) ) ( not ( = ?auto_86590 ?auto_86593 ) ) ( IN-CITY ?auto_86592 ?auto_86591 ) ( not ( = ?auto_86587 ?auto_86592 ) ) ( not ( = ?auto_86595 ?auto_86592 ) ) ( OBJ-AT ?auto_86593 ?auto_86592 ) ( TRUCK-AT ?auto_86594 ?auto_86587 ) ( OBJ-AT ?auto_86589 ?auto_86587 ) ( not ( = ?auto_86589 ?auto_86593 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86588 ?auto_86590 ?auto_86587 )
      ( DELIVER-3PKG-VERIFY ?auto_86588 ?auto_86589 ?auto_86590 ?auto_86587 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_86597 - OBJ
      ?auto_86598 - OBJ
      ?auto_86599 - OBJ
      ?auto_86596 - LOCATION
    )
    :vars
    (
      ?auto_86603 - LOCATION
      ?auto_86600 - CITY
      ?auto_86601 - LOCATION
      ?auto_86602 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86598 ?auto_86597 ) ) ( not ( = ?auto_86599 ?auto_86597 ) ) ( not ( = ?auto_86599 ?auto_86598 ) ) ( IN-CITY ?auto_86603 ?auto_86600 ) ( IN-CITY ?auto_86596 ?auto_86600 ) ( not ( = ?auto_86596 ?auto_86603 ) ) ( OBJ-AT ?auto_86597 ?auto_86596 ) ( OBJ-AT ?auto_86599 ?auto_86603 ) ( IN-CITY ?auto_86601 ?auto_86600 ) ( not ( = ?auto_86596 ?auto_86601 ) ) ( not ( = ?auto_86603 ?auto_86601 ) ) ( OBJ-AT ?auto_86598 ?auto_86601 ) ( TRUCK-AT ?auto_86602 ?auto_86596 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86597 ?auto_86599 ?auto_86596 )
      ( DELIVER-3PKG-VERIFY ?auto_86597 ?auto_86598 ?auto_86599 ?auto_86596 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_86614 - OBJ
      ?auto_86615 - OBJ
      ?auto_86616 - OBJ
      ?auto_86613 - LOCATION
    )
    :vars
    (
      ?auto_86621 - LOCATION
      ?auto_86617 - CITY
      ?auto_86619 - OBJ
      ?auto_86618 - LOCATION
      ?auto_86620 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86615 ?auto_86614 ) ) ( not ( = ?auto_86616 ?auto_86614 ) ) ( not ( = ?auto_86616 ?auto_86615 ) ) ( IN-CITY ?auto_86621 ?auto_86617 ) ( IN-CITY ?auto_86613 ?auto_86617 ) ( not ( = ?auto_86613 ?auto_86621 ) ) ( OBJ-AT ?auto_86614 ?auto_86613 ) ( OBJ-AT ?auto_86615 ?auto_86621 ) ( not ( = ?auto_86619 ?auto_86614 ) ) ( not ( = ?auto_86615 ?auto_86619 ) ) ( IN-CITY ?auto_86618 ?auto_86617 ) ( not ( = ?auto_86613 ?auto_86618 ) ) ( not ( = ?auto_86621 ?auto_86618 ) ) ( OBJ-AT ?auto_86619 ?auto_86618 ) ( TRUCK-AT ?auto_86620 ?auto_86613 ) ( OBJ-AT ?auto_86616 ?auto_86613 ) ( not ( = ?auto_86616 ?auto_86619 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86614 ?auto_86615 ?auto_86613 )
      ( DELIVER-3PKG-VERIFY ?auto_86614 ?auto_86615 ?auto_86616 ?auto_86613 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_86623 - OBJ
      ?auto_86624 - OBJ
      ?auto_86625 - OBJ
      ?auto_86622 - LOCATION
    )
    :vars
    (
      ?auto_86629 - LOCATION
      ?auto_86626 - CITY
      ?auto_86627 - LOCATION
      ?auto_86628 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86624 ?auto_86623 ) ) ( not ( = ?auto_86625 ?auto_86623 ) ) ( not ( = ?auto_86625 ?auto_86624 ) ) ( IN-CITY ?auto_86629 ?auto_86626 ) ( IN-CITY ?auto_86622 ?auto_86626 ) ( not ( = ?auto_86622 ?auto_86629 ) ) ( OBJ-AT ?auto_86623 ?auto_86622 ) ( OBJ-AT ?auto_86624 ?auto_86629 ) ( IN-CITY ?auto_86627 ?auto_86626 ) ( not ( = ?auto_86622 ?auto_86627 ) ) ( not ( = ?auto_86629 ?auto_86627 ) ) ( OBJ-AT ?auto_86625 ?auto_86627 ) ( TRUCK-AT ?auto_86628 ?auto_86622 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86623 ?auto_86624 ?auto_86622 )
      ( DELIVER-3PKG-VERIFY ?auto_86623 ?auto_86624 ?auto_86625 ?auto_86622 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_86640 - OBJ
      ?auto_86641 - OBJ
      ?auto_86642 - OBJ
      ?auto_86639 - LOCATION
    )
    :vars
    (
      ?auto_86647 - LOCATION
      ?auto_86643 - CITY
      ?auto_86645 - OBJ
      ?auto_86644 - LOCATION
      ?auto_86646 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86641 ?auto_86640 ) ) ( not ( = ?auto_86642 ?auto_86640 ) ) ( not ( = ?auto_86642 ?auto_86641 ) ) ( IN-CITY ?auto_86647 ?auto_86643 ) ( IN-CITY ?auto_86639 ?auto_86643 ) ( not ( = ?auto_86639 ?auto_86647 ) ) ( OBJ-AT ?auto_86641 ?auto_86639 ) ( OBJ-AT ?auto_86642 ?auto_86647 ) ( not ( = ?auto_86645 ?auto_86641 ) ) ( not ( = ?auto_86642 ?auto_86645 ) ) ( IN-CITY ?auto_86644 ?auto_86643 ) ( not ( = ?auto_86639 ?auto_86644 ) ) ( not ( = ?auto_86647 ?auto_86644 ) ) ( OBJ-AT ?auto_86645 ?auto_86644 ) ( TRUCK-AT ?auto_86646 ?auto_86639 ) ( OBJ-AT ?auto_86640 ?auto_86639 ) ( not ( = ?auto_86640 ?auto_86645 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86641 ?auto_86642 ?auto_86639 )
      ( DELIVER-3PKG-VERIFY ?auto_86640 ?auto_86641 ?auto_86642 ?auto_86639 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_86659 - OBJ
      ?auto_86660 - OBJ
      ?auto_86661 - OBJ
      ?auto_86658 - LOCATION
    )
    :vars
    (
      ?auto_86665 - OBJ
      ?auto_86666 - LOCATION
      ?auto_86662 - CITY
      ?auto_86663 - LOCATION
      ?auto_86664 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86660 ?auto_86659 ) ) ( not ( = ?auto_86661 ?auto_86659 ) ) ( not ( = ?auto_86661 ?auto_86660 ) ) ( not ( = ?auto_86661 ?auto_86665 ) ) ( IN-CITY ?auto_86666 ?auto_86662 ) ( IN-CITY ?auto_86658 ?auto_86662 ) ( not ( = ?auto_86658 ?auto_86666 ) ) ( OBJ-AT ?auto_86665 ?auto_86658 ) ( OBJ-AT ?auto_86661 ?auto_86666 ) ( not ( = ?auto_86660 ?auto_86665 ) ) ( IN-CITY ?auto_86663 ?auto_86662 ) ( not ( = ?auto_86658 ?auto_86663 ) ) ( not ( = ?auto_86666 ?auto_86663 ) ) ( OBJ-AT ?auto_86660 ?auto_86663 ) ( TRUCK-AT ?auto_86664 ?auto_86658 ) ( OBJ-AT ?auto_86659 ?auto_86658 ) ( not ( = ?auto_86659 ?auto_86665 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86665 ?auto_86661 ?auto_86658 )
      ( DELIVER-3PKG-VERIFY ?auto_86659 ?auto_86660 ?auto_86661 ?auto_86658 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_86668 - OBJ
      ?auto_86669 - OBJ
      ?auto_86670 - OBJ
      ?auto_86667 - LOCATION
    )
    :vars
    (
      ?auto_86675 - LOCATION
      ?auto_86671 - CITY
      ?auto_86673 - OBJ
      ?auto_86672 - LOCATION
      ?auto_86674 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86669 ?auto_86668 ) ) ( not ( = ?auto_86670 ?auto_86668 ) ) ( not ( = ?auto_86670 ?auto_86669 ) ) ( IN-CITY ?auto_86675 ?auto_86671 ) ( IN-CITY ?auto_86667 ?auto_86671 ) ( not ( = ?auto_86667 ?auto_86675 ) ) ( OBJ-AT ?auto_86670 ?auto_86667 ) ( OBJ-AT ?auto_86669 ?auto_86675 ) ( not ( = ?auto_86673 ?auto_86670 ) ) ( not ( = ?auto_86669 ?auto_86673 ) ) ( IN-CITY ?auto_86672 ?auto_86671 ) ( not ( = ?auto_86667 ?auto_86672 ) ) ( not ( = ?auto_86675 ?auto_86672 ) ) ( OBJ-AT ?auto_86673 ?auto_86672 ) ( TRUCK-AT ?auto_86674 ?auto_86667 ) ( OBJ-AT ?auto_86668 ?auto_86667 ) ( not ( = ?auto_86668 ?auto_86673 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86670 ?auto_86669 ?auto_86667 )
      ( DELIVER-3PKG-VERIFY ?auto_86668 ?auto_86669 ?auto_86670 ?auto_86667 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_86687 - OBJ
      ?auto_86688 - OBJ
      ?auto_86689 - OBJ
      ?auto_86686 - LOCATION
    )
    :vars
    (
      ?auto_86693 - OBJ
      ?auto_86694 - LOCATION
      ?auto_86690 - CITY
      ?auto_86691 - LOCATION
      ?auto_86692 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86688 ?auto_86687 ) ) ( not ( = ?auto_86689 ?auto_86687 ) ) ( not ( = ?auto_86689 ?auto_86688 ) ) ( not ( = ?auto_86688 ?auto_86693 ) ) ( IN-CITY ?auto_86694 ?auto_86690 ) ( IN-CITY ?auto_86686 ?auto_86690 ) ( not ( = ?auto_86686 ?auto_86694 ) ) ( OBJ-AT ?auto_86693 ?auto_86686 ) ( OBJ-AT ?auto_86688 ?auto_86694 ) ( not ( = ?auto_86689 ?auto_86693 ) ) ( IN-CITY ?auto_86691 ?auto_86690 ) ( not ( = ?auto_86686 ?auto_86691 ) ) ( not ( = ?auto_86694 ?auto_86691 ) ) ( OBJ-AT ?auto_86689 ?auto_86691 ) ( TRUCK-AT ?auto_86692 ?auto_86686 ) ( OBJ-AT ?auto_86687 ?auto_86686 ) ( not ( = ?auto_86687 ?auto_86693 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86693 ?auto_86688 ?auto_86686 )
      ( DELIVER-3PKG-VERIFY ?auto_86687 ?auto_86688 ?auto_86689 ?auto_86686 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_86706 - OBJ
      ?auto_86707 - OBJ
      ?auto_86708 - OBJ
      ?auto_86705 - LOCATION
    )
    :vars
    (
      ?auto_86712 - LOCATION
      ?auto_86709 - CITY
      ?auto_86710 - LOCATION
      ?auto_86711 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86707 ?auto_86706 ) ) ( not ( = ?auto_86708 ?auto_86706 ) ) ( not ( = ?auto_86708 ?auto_86707 ) ) ( IN-CITY ?auto_86712 ?auto_86709 ) ( IN-CITY ?auto_86705 ?auto_86709 ) ( not ( = ?auto_86705 ?auto_86712 ) ) ( OBJ-AT ?auto_86707 ?auto_86705 ) ( OBJ-AT ?auto_86708 ?auto_86712 ) ( IN-CITY ?auto_86710 ?auto_86709 ) ( not ( = ?auto_86705 ?auto_86710 ) ) ( not ( = ?auto_86712 ?auto_86710 ) ) ( OBJ-AT ?auto_86706 ?auto_86710 ) ( TRUCK-AT ?auto_86711 ?auto_86705 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86707 ?auto_86708 ?auto_86705 )
      ( DELIVER-3PKG-VERIFY ?auto_86706 ?auto_86707 ?auto_86708 ?auto_86705 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_86714 - OBJ
      ?auto_86715 - OBJ
      ?auto_86716 - OBJ
      ?auto_86713 - LOCATION
    )
    :vars
    (
      ?auto_86720 - OBJ
      ?auto_86721 - LOCATION
      ?auto_86717 - CITY
      ?auto_86718 - LOCATION
      ?auto_86719 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86715 ?auto_86714 ) ) ( not ( = ?auto_86716 ?auto_86714 ) ) ( not ( = ?auto_86716 ?auto_86715 ) ) ( not ( = ?auto_86716 ?auto_86720 ) ) ( IN-CITY ?auto_86721 ?auto_86717 ) ( IN-CITY ?auto_86713 ?auto_86717 ) ( not ( = ?auto_86713 ?auto_86721 ) ) ( OBJ-AT ?auto_86720 ?auto_86713 ) ( OBJ-AT ?auto_86716 ?auto_86721 ) ( not ( = ?auto_86714 ?auto_86720 ) ) ( IN-CITY ?auto_86718 ?auto_86717 ) ( not ( = ?auto_86713 ?auto_86718 ) ) ( not ( = ?auto_86721 ?auto_86718 ) ) ( OBJ-AT ?auto_86714 ?auto_86718 ) ( TRUCK-AT ?auto_86719 ?auto_86713 ) ( OBJ-AT ?auto_86715 ?auto_86713 ) ( not ( = ?auto_86715 ?auto_86720 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86720 ?auto_86716 ?auto_86713 )
      ( DELIVER-3PKG-VERIFY ?auto_86714 ?auto_86715 ?auto_86716 ?auto_86713 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_86732 - OBJ
      ?auto_86733 - OBJ
      ?auto_86734 - OBJ
      ?auto_86731 - LOCATION
    )
    :vars
    (
      ?auto_86738 - LOCATION
      ?auto_86735 - CITY
      ?auto_86736 - LOCATION
      ?auto_86737 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86733 ?auto_86732 ) ) ( not ( = ?auto_86734 ?auto_86732 ) ) ( not ( = ?auto_86734 ?auto_86733 ) ) ( IN-CITY ?auto_86738 ?auto_86735 ) ( IN-CITY ?auto_86731 ?auto_86735 ) ( not ( = ?auto_86731 ?auto_86738 ) ) ( OBJ-AT ?auto_86734 ?auto_86731 ) ( OBJ-AT ?auto_86733 ?auto_86738 ) ( IN-CITY ?auto_86736 ?auto_86735 ) ( not ( = ?auto_86731 ?auto_86736 ) ) ( not ( = ?auto_86738 ?auto_86736 ) ) ( OBJ-AT ?auto_86732 ?auto_86736 ) ( TRUCK-AT ?auto_86737 ?auto_86731 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86734 ?auto_86733 ?auto_86731 )
      ( DELIVER-3PKG-VERIFY ?auto_86732 ?auto_86733 ?auto_86734 ?auto_86731 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_86740 - OBJ
      ?auto_86741 - OBJ
      ?auto_86742 - OBJ
      ?auto_86739 - LOCATION
    )
    :vars
    (
      ?auto_86746 - OBJ
      ?auto_86747 - LOCATION
      ?auto_86743 - CITY
      ?auto_86744 - LOCATION
      ?auto_86745 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86741 ?auto_86740 ) ) ( not ( = ?auto_86742 ?auto_86740 ) ) ( not ( = ?auto_86742 ?auto_86741 ) ) ( not ( = ?auto_86741 ?auto_86746 ) ) ( IN-CITY ?auto_86747 ?auto_86743 ) ( IN-CITY ?auto_86739 ?auto_86743 ) ( not ( = ?auto_86739 ?auto_86747 ) ) ( OBJ-AT ?auto_86746 ?auto_86739 ) ( OBJ-AT ?auto_86741 ?auto_86747 ) ( not ( = ?auto_86740 ?auto_86746 ) ) ( IN-CITY ?auto_86744 ?auto_86743 ) ( not ( = ?auto_86739 ?auto_86744 ) ) ( not ( = ?auto_86747 ?auto_86744 ) ) ( OBJ-AT ?auto_86740 ?auto_86744 ) ( TRUCK-AT ?auto_86745 ?auto_86739 ) ( OBJ-AT ?auto_86742 ?auto_86739 ) ( not ( = ?auto_86742 ?auto_86746 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86746 ?auto_86741 ?auto_86739 )
      ( DELIVER-3PKG-VERIFY ?auto_86740 ?auto_86741 ?auto_86742 ?auto_86739 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_86776 - OBJ
      ?auto_86777 - OBJ
      ?auto_86778 - OBJ
      ?auto_86775 - LOCATION
    )
    :vars
    (
      ?auto_86783 - LOCATION
      ?auto_86779 - CITY
      ?auto_86781 - OBJ
      ?auto_86780 - LOCATION
      ?auto_86782 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86777 ?auto_86776 ) ) ( not ( = ?auto_86778 ?auto_86776 ) ) ( not ( = ?auto_86778 ?auto_86777 ) ) ( IN-CITY ?auto_86783 ?auto_86779 ) ( IN-CITY ?auto_86775 ?auto_86779 ) ( not ( = ?auto_86775 ?auto_86783 ) ) ( OBJ-AT ?auto_86777 ?auto_86775 ) ( OBJ-AT ?auto_86776 ?auto_86783 ) ( not ( = ?auto_86781 ?auto_86777 ) ) ( not ( = ?auto_86776 ?auto_86781 ) ) ( IN-CITY ?auto_86780 ?auto_86779 ) ( not ( = ?auto_86775 ?auto_86780 ) ) ( not ( = ?auto_86783 ?auto_86780 ) ) ( OBJ-AT ?auto_86781 ?auto_86780 ) ( TRUCK-AT ?auto_86782 ?auto_86775 ) ( OBJ-AT ?auto_86778 ?auto_86775 ) ( not ( = ?auto_86778 ?auto_86781 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86777 ?auto_86776 ?auto_86775 )
      ( DELIVER-3PKG-VERIFY ?auto_86776 ?auto_86777 ?auto_86778 ?auto_86775 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_86785 - OBJ
      ?auto_86786 - OBJ
      ?auto_86787 - OBJ
      ?auto_86784 - LOCATION
    )
    :vars
    (
      ?auto_86791 - LOCATION
      ?auto_86788 - CITY
      ?auto_86789 - LOCATION
      ?auto_86790 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86786 ?auto_86785 ) ) ( not ( = ?auto_86787 ?auto_86785 ) ) ( not ( = ?auto_86787 ?auto_86786 ) ) ( IN-CITY ?auto_86791 ?auto_86788 ) ( IN-CITY ?auto_86784 ?auto_86788 ) ( not ( = ?auto_86784 ?auto_86791 ) ) ( OBJ-AT ?auto_86786 ?auto_86784 ) ( OBJ-AT ?auto_86785 ?auto_86791 ) ( IN-CITY ?auto_86789 ?auto_86788 ) ( not ( = ?auto_86784 ?auto_86789 ) ) ( not ( = ?auto_86791 ?auto_86789 ) ) ( OBJ-AT ?auto_86787 ?auto_86789 ) ( TRUCK-AT ?auto_86790 ?auto_86784 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86786 ?auto_86785 ?auto_86784 )
      ( DELIVER-3PKG-VERIFY ?auto_86785 ?auto_86786 ?auto_86787 ?auto_86784 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_86802 - OBJ
      ?auto_86803 - OBJ
      ?auto_86804 - OBJ
      ?auto_86801 - LOCATION
    )
    :vars
    (
      ?auto_86809 - LOCATION
      ?auto_86805 - CITY
      ?auto_86807 - OBJ
      ?auto_86806 - LOCATION
      ?auto_86808 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86803 ?auto_86802 ) ) ( not ( = ?auto_86804 ?auto_86802 ) ) ( not ( = ?auto_86804 ?auto_86803 ) ) ( IN-CITY ?auto_86809 ?auto_86805 ) ( IN-CITY ?auto_86801 ?auto_86805 ) ( not ( = ?auto_86801 ?auto_86809 ) ) ( OBJ-AT ?auto_86804 ?auto_86801 ) ( OBJ-AT ?auto_86802 ?auto_86809 ) ( not ( = ?auto_86807 ?auto_86804 ) ) ( not ( = ?auto_86802 ?auto_86807 ) ) ( IN-CITY ?auto_86806 ?auto_86805 ) ( not ( = ?auto_86801 ?auto_86806 ) ) ( not ( = ?auto_86809 ?auto_86806 ) ) ( OBJ-AT ?auto_86807 ?auto_86806 ) ( TRUCK-AT ?auto_86808 ?auto_86801 ) ( OBJ-AT ?auto_86803 ?auto_86801 ) ( not ( = ?auto_86803 ?auto_86807 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86804 ?auto_86802 ?auto_86801 )
      ( DELIVER-3PKG-VERIFY ?auto_86802 ?auto_86803 ?auto_86804 ?auto_86801 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_86821 - OBJ
      ?auto_86822 - OBJ
      ?auto_86823 - OBJ
      ?auto_86820 - LOCATION
    )
    :vars
    (
      ?auto_86827 - OBJ
      ?auto_86828 - LOCATION
      ?auto_86824 - CITY
      ?auto_86825 - LOCATION
      ?auto_86826 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86822 ?auto_86821 ) ) ( not ( = ?auto_86823 ?auto_86821 ) ) ( not ( = ?auto_86823 ?auto_86822 ) ) ( not ( = ?auto_86821 ?auto_86827 ) ) ( IN-CITY ?auto_86828 ?auto_86824 ) ( IN-CITY ?auto_86820 ?auto_86824 ) ( not ( = ?auto_86820 ?auto_86828 ) ) ( OBJ-AT ?auto_86827 ?auto_86820 ) ( OBJ-AT ?auto_86821 ?auto_86828 ) ( not ( = ?auto_86823 ?auto_86827 ) ) ( IN-CITY ?auto_86825 ?auto_86824 ) ( not ( = ?auto_86820 ?auto_86825 ) ) ( not ( = ?auto_86828 ?auto_86825 ) ) ( OBJ-AT ?auto_86823 ?auto_86825 ) ( TRUCK-AT ?auto_86826 ?auto_86820 ) ( OBJ-AT ?auto_86822 ?auto_86820 ) ( not ( = ?auto_86822 ?auto_86827 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86827 ?auto_86821 ?auto_86820 )
      ( DELIVER-3PKG-VERIFY ?auto_86821 ?auto_86822 ?auto_86823 ?auto_86820 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_86840 - OBJ
      ?auto_86841 - OBJ
      ?auto_86842 - OBJ
      ?auto_86839 - LOCATION
    )
    :vars
    (
      ?auto_86846 - LOCATION
      ?auto_86843 - CITY
      ?auto_86844 - LOCATION
      ?auto_86845 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86841 ?auto_86840 ) ) ( not ( = ?auto_86842 ?auto_86840 ) ) ( not ( = ?auto_86842 ?auto_86841 ) ) ( IN-CITY ?auto_86846 ?auto_86843 ) ( IN-CITY ?auto_86839 ?auto_86843 ) ( not ( = ?auto_86839 ?auto_86846 ) ) ( OBJ-AT ?auto_86842 ?auto_86839 ) ( OBJ-AT ?auto_86840 ?auto_86846 ) ( IN-CITY ?auto_86844 ?auto_86843 ) ( not ( = ?auto_86839 ?auto_86844 ) ) ( not ( = ?auto_86846 ?auto_86844 ) ) ( OBJ-AT ?auto_86841 ?auto_86844 ) ( TRUCK-AT ?auto_86845 ?auto_86839 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86842 ?auto_86840 ?auto_86839 )
      ( DELIVER-3PKG-VERIFY ?auto_86840 ?auto_86841 ?auto_86842 ?auto_86839 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_86848 - OBJ
      ?auto_86849 - OBJ
      ?auto_86850 - OBJ
      ?auto_86847 - LOCATION
    )
    :vars
    (
      ?auto_86854 - OBJ
      ?auto_86855 - LOCATION
      ?auto_86851 - CITY
      ?auto_86852 - LOCATION
      ?auto_86853 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_86849 ?auto_86848 ) ) ( not ( = ?auto_86850 ?auto_86848 ) ) ( not ( = ?auto_86850 ?auto_86849 ) ) ( not ( = ?auto_86848 ?auto_86854 ) ) ( IN-CITY ?auto_86855 ?auto_86851 ) ( IN-CITY ?auto_86847 ?auto_86851 ) ( not ( = ?auto_86847 ?auto_86855 ) ) ( OBJ-AT ?auto_86854 ?auto_86847 ) ( OBJ-AT ?auto_86848 ?auto_86855 ) ( not ( = ?auto_86849 ?auto_86854 ) ) ( IN-CITY ?auto_86852 ?auto_86851 ) ( not ( = ?auto_86847 ?auto_86852 ) ) ( not ( = ?auto_86855 ?auto_86852 ) ) ( OBJ-AT ?auto_86849 ?auto_86852 ) ( TRUCK-AT ?auto_86853 ?auto_86847 ) ( OBJ-AT ?auto_86850 ?auto_86847 ) ( not ( = ?auto_86850 ?auto_86854 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_86854 ?auto_86848 ?auto_86847 )
      ( DELIVER-3PKG-VERIFY ?auto_86848 ?auto_86849 ?auto_86850 ?auto_86847 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_87001 - OBJ
      ?auto_87002 - OBJ
      ?auto_87003 - OBJ
      ?auto_87004 - OBJ
      ?auto_87000 - LOCATION
    )
    :vars
    (
      ?auto_87008 - LOCATION
      ?auto_87005 - CITY
      ?auto_87006 - LOCATION
      ?auto_87007 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_87002 ?auto_87001 ) ) ( not ( = ?auto_87003 ?auto_87001 ) ) ( not ( = ?auto_87003 ?auto_87002 ) ) ( not ( = ?auto_87004 ?auto_87001 ) ) ( not ( = ?auto_87004 ?auto_87002 ) ) ( not ( = ?auto_87004 ?auto_87003 ) ) ( IN-CITY ?auto_87008 ?auto_87005 ) ( IN-CITY ?auto_87000 ?auto_87005 ) ( not ( = ?auto_87000 ?auto_87008 ) ) ( OBJ-AT ?auto_87001 ?auto_87000 ) ( OBJ-AT ?auto_87004 ?auto_87008 ) ( IN-CITY ?auto_87006 ?auto_87005 ) ( not ( = ?auto_87000 ?auto_87006 ) ) ( not ( = ?auto_87008 ?auto_87006 ) ) ( OBJ-AT ?auto_87003 ?auto_87006 ) ( TRUCK-AT ?auto_87007 ?auto_87000 ) ( OBJ-AT ?auto_87002 ?auto_87000 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_87001 ?auto_87004 ?auto_87000 )
      ( DELIVER-4PKG-VERIFY ?auto_87001 ?auto_87002 ?auto_87003 ?auto_87004 ?auto_87000 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_87030 - OBJ
      ?auto_87031 - OBJ
      ?auto_87032 - OBJ
      ?auto_87033 - OBJ
      ?auto_87029 - LOCATION
    )
    :vars
    (
      ?auto_87037 - LOCATION
      ?auto_87034 - CITY
      ?auto_87035 - LOCATION
      ?auto_87036 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_87031 ?auto_87030 ) ) ( not ( = ?auto_87032 ?auto_87030 ) ) ( not ( = ?auto_87032 ?auto_87031 ) ) ( not ( = ?auto_87033 ?auto_87030 ) ) ( not ( = ?auto_87033 ?auto_87031 ) ) ( not ( = ?auto_87033 ?auto_87032 ) ) ( IN-CITY ?auto_87037 ?auto_87034 ) ( IN-CITY ?auto_87029 ?auto_87034 ) ( not ( = ?auto_87029 ?auto_87037 ) ) ( OBJ-AT ?auto_87030 ?auto_87029 ) ( OBJ-AT ?auto_87032 ?auto_87037 ) ( IN-CITY ?auto_87035 ?auto_87034 ) ( not ( = ?auto_87029 ?auto_87035 ) ) ( not ( = ?auto_87037 ?auto_87035 ) ) ( OBJ-AT ?auto_87033 ?auto_87035 ) ( TRUCK-AT ?auto_87036 ?auto_87029 ) ( OBJ-AT ?auto_87031 ?auto_87029 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_87030 ?auto_87032 ?auto_87029 )
      ( DELIVER-4PKG-VERIFY ?auto_87030 ?auto_87031 ?auto_87032 ?auto_87033 ?auto_87029 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_87058 - OBJ
      ?auto_87059 - OBJ
      ?auto_87060 - OBJ
      ?auto_87061 - OBJ
      ?auto_87057 - LOCATION
    )
    :vars
    (
      ?auto_87065 - LOCATION
      ?auto_87062 - CITY
      ?auto_87063 - LOCATION
      ?auto_87064 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_87059 ?auto_87058 ) ) ( not ( = ?auto_87060 ?auto_87058 ) ) ( not ( = ?auto_87060 ?auto_87059 ) ) ( not ( = ?auto_87061 ?auto_87058 ) ) ( not ( = ?auto_87061 ?auto_87059 ) ) ( not ( = ?auto_87061 ?auto_87060 ) ) ( IN-CITY ?auto_87065 ?auto_87062 ) ( IN-CITY ?auto_87057 ?auto_87062 ) ( not ( = ?auto_87057 ?auto_87065 ) ) ( OBJ-AT ?auto_87058 ?auto_87057 ) ( OBJ-AT ?auto_87061 ?auto_87065 ) ( IN-CITY ?auto_87063 ?auto_87062 ) ( not ( = ?auto_87057 ?auto_87063 ) ) ( not ( = ?auto_87065 ?auto_87063 ) ) ( OBJ-AT ?auto_87059 ?auto_87063 ) ( TRUCK-AT ?auto_87064 ?auto_87057 ) ( OBJ-AT ?auto_87060 ?auto_87057 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_87058 ?auto_87061 ?auto_87057 )
      ( DELIVER-4PKG-VERIFY ?auto_87058 ?auto_87059 ?auto_87060 ?auto_87061 ?auto_87057 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_87085 - OBJ
      ?auto_87086 - OBJ
      ?auto_87087 - OBJ
      ?auto_87088 - OBJ
      ?auto_87084 - LOCATION
    )
    :vars
    (
      ?auto_87092 - LOCATION
      ?auto_87089 - CITY
      ?auto_87090 - LOCATION
      ?auto_87091 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_87086 ?auto_87085 ) ) ( not ( = ?auto_87087 ?auto_87085 ) ) ( not ( = ?auto_87087 ?auto_87086 ) ) ( not ( = ?auto_87088 ?auto_87085 ) ) ( not ( = ?auto_87088 ?auto_87086 ) ) ( not ( = ?auto_87088 ?auto_87087 ) ) ( IN-CITY ?auto_87092 ?auto_87089 ) ( IN-CITY ?auto_87084 ?auto_87089 ) ( not ( = ?auto_87084 ?auto_87092 ) ) ( OBJ-AT ?auto_87085 ?auto_87084 ) ( OBJ-AT ?auto_87087 ?auto_87092 ) ( IN-CITY ?auto_87090 ?auto_87089 ) ( not ( = ?auto_87084 ?auto_87090 ) ) ( not ( = ?auto_87092 ?auto_87090 ) ) ( OBJ-AT ?auto_87086 ?auto_87090 ) ( TRUCK-AT ?auto_87091 ?auto_87084 ) ( OBJ-AT ?auto_87088 ?auto_87084 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_87085 ?auto_87087 ?auto_87084 )
      ( DELIVER-4PKG-VERIFY ?auto_87085 ?auto_87086 ?auto_87087 ?auto_87088 ?auto_87084 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_87171 - OBJ
      ?auto_87172 - OBJ
      ?auto_87173 - OBJ
      ?auto_87174 - OBJ
      ?auto_87170 - LOCATION
    )
    :vars
    (
      ?auto_87178 - LOCATION
      ?auto_87175 - CITY
      ?auto_87176 - LOCATION
      ?auto_87177 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_87172 ?auto_87171 ) ) ( not ( = ?auto_87173 ?auto_87171 ) ) ( not ( = ?auto_87173 ?auto_87172 ) ) ( not ( = ?auto_87174 ?auto_87171 ) ) ( not ( = ?auto_87174 ?auto_87172 ) ) ( not ( = ?auto_87174 ?auto_87173 ) ) ( IN-CITY ?auto_87178 ?auto_87175 ) ( IN-CITY ?auto_87170 ?auto_87175 ) ( not ( = ?auto_87170 ?auto_87178 ) ) ( OBJ-AT ?auto_87171 ?auto_87170 ) ( OBJ-AT ?auto_87172 ?auto_87178 ) ( IN-CITY ?auto_87176 ?auto_87175 ) ( not ( = ?auto_87170 ?auto_87176 ) ) ( not ( = ?auto_87178 ?auto_87176 ) ) ( OBJ-AT ?auto_87174 ?auto_87176 ) ( TRUCK-AT ?auto_87177 ?auto_87170 ) ( OBJ-AT ?auto_87173 ?auto_87170 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_87171 ?auto_87172 ?auto_87170 )
      ( DELIVER-4PKG-VERIFY ?auto_87171 ?auto_87172 ?auto_87173 ?auto_87174 ?auto_87170 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_87199 - OBJ
      ?auto_87200 - OBJ
      ?auto_87201 - OBJ
      ?auto_87202 - OBJ
      ?auto_87198 - LOCATION
    )
    :vars
    (
      ?auto_87206 - LOCATION
      ?auto_87203 - CITY
      ?auto_87204 - LOCATION
      ?auto_87205 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_87200 ?auto_87199 ) ) ( not ( = ?auto_87201 ?auto_87199 ) ) ( not ( = ?auto_87201 ?auto_87200 ) ) ( not ( = ?auto_87202 ?auto_87199 ) ) ( not ( = ?auto_87202 ?auto_87200 ) ) ( not ( = ?auto_87202 ?auto_87201 ) ) ( IN-CITY ?auto_87206 ?auto_87203 ) ( IN-CITY ?auto_87198 ?auto_87203 ) ( not ( = ?auto_87198 ?auto_87206 ) ) ( OBJ-AT ?auto_87199 ?auto_87198 ) ( OBJ-AT ?auto_87200 ?auto_87206 ) ( IN-CITY ?auto_87204 ?auto_87203 ) ( not ( = ?auto_87198 ?auto_87204 ) ) ( not ( = ?auto_87206 ?auto_87204 ) ) ( OBJ-AT ?auto_87201 ?auto_87204 ) ( TRUCK-AT ?auto_87205 ?auto_87198 ) ( OBJ-AT ?auto_87202 ?auto_87198 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_87199 ?auto_87200 ?auto_87198 )
      ( DELIVER-4PKG-VERIFY ?auto_87199 ?auto_87200 ?auto_87201 ?auto_87202 ?auto_87198 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_87285 - OBJ
      ?auto_87286 - OBJ
      ?auto_87287 - OBJ
      ?auto_87288 - OBJ
      ?auto_87284 - LOCATION
    )
    :vars
    (
      ?auto_87292 - LOCATION
      ?auto_87289 - CITY
      ?auto_87290 - LOCATION
      ?auto_87291 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_87286 ?auto_87285 ) ) ( not ( = ?auto_87287 ?auto_87285 ) ) ( not ( = ?auto_87287 ?auto_87286 ) ) ( not ( = ?auto_87288 ?auto_87285 ) ) ( not ( = ?auto_87288 ?auto_87286 ) ) ( not ( = ?auto_87288 ?auto_87287 ) ) ( IN-CITY ?auto_87292 ?auto_87289 ) ( IN-CITY ?auto_87284 ?auto_87289 ) ( not ( = ?auto_87284 ?auto_87292 ) ) ( OBJ-AT ?auto_87286 ?auto_87284 ) ( OBJ-AT ?auto_87288 ?auto_87292 ) ( IN-CITY ?auto_87290 ?auto_87289 ) ( not ( = ?auto_87284 ?auto_87290 ) ) ( not ( = ?auto_87292 ?auto_87290 ) ) ( OBJ-AT ?auto_87287 ?auto_87290 ) ( TRUCK-AT ?auto_87291 ?auto_87284 ) ( OBJ-AT ?auto_87285 ?auto_87284 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_87286 ?auto_87288 ?auto_87284 )
      ( DELIVER-4PKG-VERIFY ?auto_87285 ?auto_87286 ?auto_87287 ?auto_87288 ?auto_87284 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_87314 - OBJ
      ?auto_87315 - OBJ
      ?auto_87316 - OBJ
      ?auto_87317 - OBJ
      ?auto_87313 - LOCATION
    )
    :vars
    (
      ?auto_87321 - LOCATION
      ?auto_87318 - CITY
      ?auto_87319 - LOCATION
      ?auto_87320 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_87315 ?auto_87314 ) ) ( not ( = ?auto_87316 ?auto_87314 ) ) ( not ( = ?auto_87316 ?auto_87315 ) ) ( not ( = ?auto_87317 ?auto_87314 ) ) ( not ( = ?auto_87317 ?auto_87315 ) ) ( not ( = ?auto_87317 ?auto_87316 ) ) ( IN-CITY ?auto_87321 ?auto_87318 ) ( IN-CITY ?auto_87313 ?auto_87318 ) ( not ( = ?auto_87313 ?auto_87321 ) ) ( OBJ-AT ?auto_87315 ?auto_87313 ) ( OBJ-AT ?auto_87316 ?auto_87321 ) ( IN-CITY ?auto_87319 ?auto_87318 ) ( not ( = ?auto_87313 ?auto_87319 ) ) ( not ( = ?auto_87321 ?auto_87319 ) ) ( OBJ-AT ?auto_87317 ?auto_87319 ) ( TRUCK-AT ?auto_87320 ?auto_87313 ) ( OBJ-AT ?auto_87314 ?auto_87313 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_87315 ?auto_87316 ?auto_87313 )
      ( DELIVER-4PKG-VERIFY ?auto_87314 ?auto_87315 ?auto_87316 ?auto_87317 ?auto_87313 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_87406 - OBJ
      ?auto_87407 - OBJ
      ?auto_87408 - OBJ
      ?auto_87409 - OBJ
      ?auto_87405 - LOCATION
    )
    :vars
    (
      ?auto_87413 - LOCATION
      ?auto_87410 - CITY
      ?auto_87411 - LOCATION
      ?auto_87412 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_87407 ?auto_87406 ) ) ( not ( = ?auto_87408 ?auto_87406 ) ) ( not ( = ?auto_87408 ?auto_87407 ) ) ( not ( = ?auto_87409 ?auto_87406 ) ) ( not ( = ?auto_87409 ?auto_87407 ) ) ( not ( = ?auto_87409 ?auto_87408 ) ) ( IN-CITY ?auto_87413 ?auto_87410 ) ( IN-CITY ?auto_87405 ?auto_87410 ) ( not ( = ?auto_87405 ?auto_87413 ) ) ( OBJ-AT ?auto_87408 ?auto_87405 ) ( OBJ-AT ?auto_87409 ?auto_87413 ) ( IN-CITY ?auto_87411 ?auto_87410 ) ( not ( = ?auto_87405 ?auto_87411 ) ) ( not ( = ?auto_87413 ?auto_87411 ) ) ( OBJ-AT ?auto_87407 ?auto_87411 ) ( TRUCK-AT ?auto_87412 ?auto_87405 ) ( OBJ-AT ?auto_87406 ?auto_87405 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_87408 ?auto_87409 ?auto_87405 )
      ( DELIVER-4PKG-VERIFY ?auto_87406 ?auto_87407 ?auto_87408 ?auto_87409 ?auto_87405 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_87435 - OBJ
      ?auto_87436 - OBJ
      ?auto_87437 - OBJ
      ?auto_87438 - OBJ
      ?auto_87434 - LOCATION
    )
    :vars
    (
      ?auto_87442 - LOCATION
      ?auto_87439 - CITY
      ?auto_87440 - LOCATION
      ?auto_87441 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_87436 ?auto_87435 ) ) ( not ( = ?auto_87437 ?auto_87435 ) ) ( not ( = ?auto_87437 ?auto_87436 ) ) ( not ( = ?auto_87438 ?auto_87435 ) ) ( not ( = ?auto_87438 ?auto_87436 ) ) ( not ( = ?auto_87438 ?auto_87437 ) ) ( IN-CITY ?auto_87442 ?auto_87439 ) ( IN-CITY ?auto_87434 ?auto_87439 ) ( not ( = ?auto_87434 ?auto_87442 ) ) ( OBJ-AT ?auto_87438 ?auto_87434 ) ( OBJ-AT ?auto_87437 ?auto_87442 ) ( IN-CITY ?auto_87440 ?auto_87439 ) ( not ( = ?auto_87434 ?auto_87440 ) ) ( not ( = ?auto_87442 ?auto_87440 ) ) ( OBJ-AT ?auto_87436 ?auto_87440 ) ( TRUCK-AT ?auto_87441 ?auto_87434 ) ( OBJ-AT ?auto_87435 ?auto_87434 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_87438 ?auto_87437 ?auto_87434 )
      ( DELIVER-4PKG-VERIFY ?auto_87435 ?auto_87436 ?auto_87437 ?auto_87438 ?auto_87434 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_87494 - OBJ
      ?auto_87495 - OBJ
      ?auto_87496 - OBJ
      ?auto_87497 - OBJ
      ?auto_87493 - LOCATION
    )
    :vars
    (
      ?auto_87501 - LOCATION
      ?auto_87498 - CITY
      ?auto_87499 - LOCATION
      ?auto_87500 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_87495 ?auto_87494 ) ) ( not ( = ?auto_87496 ?auto_87494 ) ) ( not ( = ?auto_87496 ?auto_87495 ) ) ( not ( = ?auto_87497 ?auto_87494 ) ) ( not ( = ?auto_87497 ?auto_87495 ) ) ( not ( = ?auto_87497 ?auto_87496 ) ) ( IN-CITY ?auto_87501 ?auto_87498 ) ( IN-CITY ?auto_87493 ?auto_87498 ) ( not ( = ?auto_87493 ?auto_87501 ) ) ( OBJ-AT ?auto_87496 ?auto_87493 ) ( OBJ-AT ?auto_87495 ?auto_87501 ) ( IN-CITY ?auto_87499 ?auto_87498 ) ( not ( = ?auto_87493 ?auto_87499 ) ) ( not ( = ?auto_87501 ?auto_87499 ) ) ( OBJ-AT ?auto_87497 ?auto_87499 ) ( TRUCK-AT ?auto_87500 ?auto_87493 ) ( OBJ-AT ?auto_87494 ?auto_87493 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_87496 ?auto_87495 ?auto_87493 )
      ( DELIVER-4PKG-VERIFY ?auto_87494 ?auto_87495 ?auto_87496 ?auto_87497 ?auto_87493 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_87555 - OBJ
      ?auto_87556 - OBJ
      ?auto_87557 - OBJ
      ?auto_87558 - OBJ
      ?auto_87554 - LOCATION
    )
    :vars
    (
      ?auto_87562 - LOCATION
      ?auto_87559 - CITY
      ?auto_87560 - LOCATION
      ?auto_87561 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_87556 ?auto_87555 ) ) ( not ( = ?auto_87557 ?auto_87555 ) ) ( not ( = ?auto_87557 ?auto_87556 ) ) ( not ( = ?auto_87558 ?auto_87555 ) ) ( not ( = ?auto_87558 ?auto_87556 ) ) ( not ( = ?auto_87558 ?auto_87557 ) ) ( IN-CITY ?auto_87562 ?auto_87559 ) ( IN-CITY ?auto_87554 ?auto_87559 ) ( not ( = ?auto_87554 ?auto_87562 ) ) ( OBJ-AT ?auto_87558 ?auto_87554 ) ( OBJ-AT ?auto_87556 ?auto_87562 ) ( IN-CITY ?auto_87560 ?auto_87559 ) ( not ( = ?auto_87554 ?auto_87560 ) ) ( not ( = ?auto_87562 ?auto_87560 ) ) ( OBJ-AT ?auto_87557 ?auto_87560 ) ( TRUCK-AT ?auto_87561 ?auto_87554 ) ( OBJ-AT ?auto_87555 ?auto_87554 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_87558 ?auto_87556 ?auto_87554 )
      ( DELIVER-4PKG-VERIFY ?auto_87555 ?auto_87556 ?auto_87557 ?auto_87558 ?auto_87554 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_87645 - OBJ
      ?auto_87646 - OBJ
      ?auto_87647 - OBJ
      ?auto_87648 - OBJ
      ?auto_87644 - LOCATION
    )
    :vars
    (
      ?auto_87652 - LOCATION
      ?auto_87649 - CITY
      ?auto_87650 - LOCATION
      ?auto_87651 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_87646 ?auto_87645 ) ) ( not ( = ?auto_87647 ?auto_87645 ) ) ( not ( = ?auto_87647 ?auto_87646 ) ) ( not ( = ?auto_87648 ?auto_87645 ) ) ( not ( = ?auto_87648 ?auto_87646 ) ) ( not ( = ?auto_87648 ?auto_87647 ) ) ( IN-CITY ?auto_87652 ?auto_87649 ) ( IN-CITY ?auto_87644 ?auto_87649 ) ( not ( = ?auto_87644 ?auto_87652 ) ) ( OBJ-AT ?auto_87646 ?auto_87644 ) ( OBJ-AT ?auto_87648 ?auto_87652 ) ( IN-CITY ?auto_87650 ?auto_87649 ) ( not ( = ?auto_87644 ?auto_87650 ) ) ( not ( = ?auto_87652 ?auto_87650 ) ) ( OBJ-AT ?auto_87645 ?auto_87650 ) ( TRUCK-AT ?auto_87651 ?auto_87644 ) ( OBJ-AT ?auto_87647 ?auto_87644 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_87646 ?auto_87648 ?auto_87644 )
      ( DELIVER-4PKG-VERIFY ?auto_87645 ?auto_87646 ?auto_87647 ?auto_87648 ?auto_87644 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_87672 - OBJ
      ?auto_87673 - OBJ
      ?auto_87674 - OBJ
      ?auto_87675 - OBJ
      ?auto_87671 - LOCATION
    )
    :vars
    (
      ?auto_87679 - LOCATION
      ?auto_87676 - CITY
      ?auto_87677 - LOCATION
      ?auto_87678 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_87673 ?auto_87672 ) ) ( not ( = ?auto_87674 ?auto_87672 ) ) ( not ( = ?auto_87674 ?auto_87673 ) ) ( not ( = ?auto_87675 ?auto_87672 ) ) ( not ( = ?auto_87675 ?auto_87673 ) ) ( not ( = ?auto_87675 ?auto_87674 ) ) ( IN-CITY ?auto_87679 ?auto_87676 ) ( IN-CITY ?auto_87671 ?auto_87676 ) ( not ( = ?auto_87671 ?auto_87679 ) ) ( OBJ-AT ?auto_87673 ?auto_87671 ) ( OBJ-AT ?auto_87674 ?auto_87679 ) ( IN-CITY ?auto_87677 ?auto_87676 ) ( not ( = ?auto_87671 ?auto_87677 ) ) ( not ( = ?auto_87679 ?auto_87677 ) ) ( OBJ-AT ?auto_87672 ?auto_87677 ) ( TRUCK-AT ?auto_87678 ?auto_87671 ) ( OBJ-AT ?auto_87675 ?auto_87671 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_87673 ?auto_87674 ?auto_87671 )
      ( DELIVER-4PKG-VERIFY ?auto_87672 ?auto_87673 ?auto_87674 ?auto_87675 ?auto_87671 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_87699 - OBJ
      ?auto_87700 - OBJ
      ?auto_87701 - OBJ
      ?auto_87702 - OBJ
      ?auto_87698 - LOCATION
    )
    :vars
    (
      ?auto_87706 - LOCATION
      ?auto_87703 - CITY
      ?auto_87704 - LOCATION
      ?auto_87705 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_87700 ?auto_87699 ) ) ( not ( = ?auto_87701 ?auto_87699 ) ) ( not ( = ?auto_87701 ?auto_87700 ) ) ( not ( = ?auto_87702 ?auto_87699 ) ) ( not ( = ?auto_87702 ?auto_87700 ) ) ( not ( = ?auto_87702 ?auto_87701 ) ) ( IN-CITY ?auto_87706 ?auto_87703 ) ( IN-CITY ?auto_87698 ?auto_87703 ) ( not ( = ?auto_87698 ?auto_87706 ) ) ( OBJ-AT ?auto_87701 ?auto_87698 ) ( OBJ-AT ?auto_87702 ?auto_87706 ) ( IN-CITY ?auto_87704 ?auto_87703 ) ( not ( = ?auto_87698 ?auto_87704 ) ) ( not ( = ?auto_87706 ?auto_87704 ) ) ( OBJ-AT ?auto_87699 ?auto_87704 ) ( TRUCK-AT ?auto_87705 ?auto_87698 ) ( OBJ-AT ?auto_87700 ?auto_87698 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_87701 ?auto_87702 ?auto_87698 )
      ( DELIVER-4PKG-VERIFY ?auto_87699 ?auto_87700 ?auto_87701 ?auto_87702 ?auto_87698 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_87728 - OBJ
      ?auto_87729 - OBJ
      ?auto_87730 - OBJ
      ?auto_87731 - OBJ
      ?auto_87727 - LOCATION
    )
    :vars
    (
      ?auto_87735 - LOCATION
      ?auto_87732 - CITY
      ?auto_87733 - LOCATION
      ?auto_87734 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_87729 ?auto_87728 ) ) ( not ( = ?auto_87730 ?auto_87728 ) ) ( not ( = ?auto_87730 ?auto_87729 ) ) ( not ( = ?auto_87731 ?auto_87728 ) ) ( not ( = ?auto_87731 ?auto_87729 ) ) ( not ( = ?auto_87731 ?auto_87730 ) ) ( IN-CITY ?auto_87735 ?auto_87732 ) ( IN-CITY ?auto_87727 ?auto_87732 ) ( not ( = ?auto_87727 ?auto_87735 ) ) ( OBJ-AT ?auto_87731 ?auto_87727 ) ( OBJ-AT ?auto_87730 ?auto_87735 ) ( IN-CITY ?auto_87733 ?auto_87732 ) ( not ( = ?auto_87727 ?auto_87733 ) ) ( not ( = ?auto_87735 ?auto_87733 ) ) ( OBJ-AT ?auto_87728 ?auto_87733 ) ( TRUCK-AT ?auto_87734 ?auto_87727 ) ( OBJ-AT ?auto_87729 ?auto_87727 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_87731 ?auto_87730 ?auto_87727 )
      ( DELIVER-4PKG-VERIFY ?auto_87728 ?auto_87729 ?auto_87730 ?auto_87731 ?auto_87727 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_87844 - OBJ
      ?auto_87845 - OBJ
      ?auto_87846 - OBJ
      ?auto_87847 - OBJ
      ?auto_87843 - LOCATION
    )
    :vars
    (
      ?auto_87851 - LOCATION
      ?auto_87848 - CITY
      ?auto_87849 - LOCATION
      ?auto_87850 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_87845 ?auto_87844 ) ) ( not ( = ?auto_87846 ?auto_87844 ) ) ( not ( = ?auto_87846 ?auto_87845 ) ) ( not ( = ?auto_87847 ?auto_87844 ) ) ( not ( = ?auto_87847 ?auto_87845 ) ) ( not ( = ?auto_87847 ?auto_87846 ) ) ( IN-CITY ?auto_87851 ?auto_87848 ) ( IN-CITY ?auto_87843 ?auto_87848 ) ( not ( = ?auto_87843 ?auto_87851 ) ) ( OBJ-AT ?auto_87846 ?auto_87843 ) ( OBJ-AT ?auto_87845 ?auto_87851 ) ( IN-CITY ?auto_87849 ?auto_87848 ) ( not ( = ?auto_87843 ?auto_87849 ) ) ( not ( = ?auto_87851 ?auto_87849 ) ) ( OBJ-AT ?auto_87844 ?auto_87849 ) ( TRUCK-AT ?auto_87850 ?auto_87843 ) ( OBJ-AT ?auto_87847 ?auto_87843 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_87846 ?auto_87845 ?auto_87843 )
      ( DELIVER-4PKG-VERIFY ?auto_87844 ?auto_87845 ?auto_87846 ?auto_87847 ?auto_87843 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_87871 - OBJ
      ?auto_87872 - OBJ
      ?auto_87873 - OBJ
      ?auto_87874 - OBJ
      ?auto_87870 - LOCATION
    )
    :vars
    (
      ?auto_87878 - LOCATION
      ?auto_87875 - CITY
      ?auto_87876 - LOCATION
      ?auto_87877 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_87872 ?auto_87871 ) ) ( not ( = ?auto_87873 ?auto_87871 ) ) ( not ( = ?auto_87873 ?auto_87872 ) ) ( not ( = ?auto_87874 ?auto_87871 ) ) ( not ( = ?auto_87874 ?auto_87872 ) ) ( not ( = ?auto_87874 ?auto_87873 ) ) ( IN-CITY ?auto_87878 ?auto_87875 ) ( IN-CITY ?auto_87870 ?auto_87875 ) ( not ( = ?auto_87870 ?auto_87878 ) ) ( OBJ-AT ?auto_87874 ?auto_87870 ) ( OBJ-AT ?auto_87872 ?auto_87878 ) ( IN-CITY ?auto_87876 ?auto_87875 ) ( not ( = ?auto_87870 ?auto_87876 ) ) ( not ( = ?auto_87878 ?auto_87876 ) ) ( OBJ-AT ?auto_87871 ?auto_87876 ) ( TRUCK-AT ?auto_87877 ?auto_87870 ) ( OBJ-AT ?auto_87873 ?auto_87870 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_87874 ?auto_87872 ?auto_87870 )
      ( DELIVER-4PKG-VERIFY ?auto_87871 ?auto_87872 ?auto_87873 ?auto_87874 ?auto_87870 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_88047 - OBJ
      ?auto_88048 - OBJ
      ?auto_88049 - OBJ
      ?auto_88050 - OBJ
      ?auto_88046 - LOCATION
    )
    :vars
    (
      ?auto_88054 - LOCATION
      ?auto_88051 - CITY
      ?auto_88052 - LOCATION
      ?auto_88053 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_88048 ?auto_88047 ) ) ( not ( = ?auto_88049 ?auto_88047 ) ) ( not ( = ?auto_88049 ?auto_88048 ) ) ( not ( = ?auto_88050 ?auto_88047 ) ) ( not ( = ?auto_88050 ?auto_88048 ) ) ( not ( = ?auto_88050 ?auto_88049 ) ) ( IN-CITY ?auto_88054 ?auto_88051 ) ( IN-CITY ?auto_88046 ?auto_88051 ) ( not ( = ?auto_88046 ?auto_88054 ) ) ( OBJ-AT ?auto_88048 ?auto_88046 ) ( OBJ-AT ?auto_88047 ?auto_88054 ) ( IN-CITY ?auto_88052 ?auto_88051 ) ( not ( = ?auto_88046 ?auto_88052 ) ) ( not ( = ?auto_88054 ?auto_88052 ) ) ( OBJ-AT ?auto_88050 ?auto_88052 ) ( TRUCK-AT ?auto_88053 ?auto_88046 ) ( OBJ-AT ?auto_88049 ?auto_88046 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88048 ?auto_88047 ?auto_88046 )
      ( DELIVER-4PKG-VERIFY ?auto_88047 ?auto_88048 ?auto_88049 ?auto_88050 ?auto_88046 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_88075 - OBJ
      ?auto_88076 - OBJ
      ?auto_88077 - OBJ
      ?auto_88078 - OBJ
      ?auto_88074 - LOCATION
    )
    :vars
    (
      ?auto_88082 - LOCATION
      ?auto_88079 - CITY
      ?auto_88080 - LOCATION
      ?auto_88081 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_88076 ?auto_88075 ) ) ( not ( = ?auto_88077 ?auto_88075 ) ) ( not ( = ?auto_88077 ?auto_88076 ) ) ( not ( = ?auto_88078 ?auto_88075 ) ) ( not ( = ?auto_88078 ?auto_88076 ) ) ( not ( = ?auto_88078 ?auto_88077 ) ) ( IN-CITY ?auto_88082 ?auto_88079 ) ( IN-CITY ?auto_88074 ?auto_88079 ) ( not ( = ?auto_88074 ?auto_88082 ) ) ( OBJ-AT ?auto_88076 ?auto_88074 ) ( OBJ-AT ?auto_88075 ?auto_88082 ) ( IN-CITY ?auto_88080 ?auto_88079 ) ( not ( = ?auto_88074 ?auto_88080 ) ) ( not ( = ?auto_88082 ?auto_88080 ) ) ( OBJ-AT ?auto_88077 ?auto_88080 ) ( TRUCK-AT ?auto_88081 ?auto_88074 ) ( OBJ-AT ?auto_88078 ?auto_88074 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88076 ?auto_88075 ?auto_88074 )
      ( DELIVER-4PKG-VERIFY ?auto_88075 ?auto_88076 ?auto_88077 ?auto_88078 ?auto_88074 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_88161 - OBJ
      ?auto_88162 - OBJ
      ?auto_88163 - OBJ
      ?auto_88164 - OBJ
      ?auto_88160 - LOCATION
    )
    :vars
    (
      ?auto_88168 - LOCATION
      ?auto_88165 - CITY
      ?auto_88166 - LOCATION
      ?auto_88167 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_88162 ?auto_88161 ) ) ( not ( = ?auto_88163 ?auto_88161 ) ) ( not ( = ?auto_88163 ?auto_88162 ) ) ( not ( = ?auto_88164 ?auto_88161 ) ) ( not ( = ?auto_88164 ?auto_88162 ) ) ( not ( = ?auto_88164 ?auto_88163 ) ) ( IN-CITY ?auto_88168 ?auto_88165 ) ( IN-CITY ?auto_88160 ?auto_88165 ) ( not ( = ?auto_88160 ?auto_88168 ) ) ( OBJ-AT ?auto_88163 ?auto_88160 ) ( OBJ-AT ?auto_88161 ?auto_88168 ) ( IN-CITY ?auto_88166 ?auto_88165 ) ( not ( = ?auto_88160 ?auto_88166 ) ) ( not ( = ?auto_88168 ?auto_88166 ) ) ( OBJ-AT ?auto_88164 ?auto_88166 ) ( TRUCK-AT ?auto_88167 ?auto_88160 ) ( OBJ-AT ?auto_88162 ?auto_88160 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88163 ?auto_88161 ?auto_88160 )
      ( DELIVER-4PKG-VERIFY ?auto_88161 ?auto_88162 ?auto_88163 ?auto_88164 ?auto_88160 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_88222 - OBJ
      ?auto_88223 - OBJ
      ?auto_88224 - OBJ
      ?auto_88225 - OBJ
      ?auto_88221 - LOCATION
    )
    :vars
    (
      ?auto_88229 - LOCATION
      ?auto_88226 - CITY
      ?auto_88227 - LOCATION
      ?auto_88228 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_88223 ?auto_88222 ) ) ( not ( = ?auto_88224 ?auto_88222 ) ) ( not ( = ?auto_88224 ?auto_88223 ) ) ( not ( = ?auto_88225 ?auto_88222 ) ) ( not ( = ?auto_88225 ?auto_88223 ) ) ( not ( = ?auto_88225 ?auto_88224 ) ) ( IN-CITY ?auto_88229 ?auto_88226 ) ( IN-CITY ?auto_88221 ?auto_88226 ) ( not ( = ?auto_88221 ?auto_88229 ) ) ( OBJ-AT ?auto_88225 ?auto_88221 ) ( OBJ-AT ?auto_88222 ?auto_88229 ) ( IN-CITY ?auto_88227 ?auto_88226 ) ( not ( = ?auto_88221 ?auto_88227 ) ) ( not ( = ?auto_88229 ?auto_88227 ) ) ( OBJ-AT ?auto_88224 ?auto_88227 ) ( TRUCK-AT ?auto_88228 ?auto_88221 ) ( OBJ-AT ?auto_88223 ?auto_88221 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88225 ?auto_88222 ?auto_88221 )
      ( DELIVER-4PKG-VERIFY ?auto_88222 ?auto_88223 ?auto_88224 ?auto_88225 ?auto_88221 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_88312 - OBJ
      ?auto_88313 - OBJ
      ?auto_88314 - OBJ
      ?auto_88315 - OBJ
      ?auto_88311 - LOCATION
    )
    :vars
    (
      ?auto_88319 - LOCATION
      ?auto_88316 - CITY
      ?auto_88317 - LOCATION
      ?auto_88318 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_88313 ?auto_88312 ) ) ( not ( = ?auto_88314 ?auto_88312 ) ) ( not ( = ?auto_88314 ?auto_88313 ) ) ( not ( = ?auto_88315 ?auto_88312 ) ) ( not ( = ?auto_88315 ?auto_88313 ) ) ( not ( = ?auto_88315 ?auto_88314 ) ) ( IN-CITY ?auto_88319 ?auto_88316 ) ( IN-CITY ?auto_88311 ?auto_88316 ) ( not ( = ?auto_88311 ?auto_88319 ) ) ( OBJ-AT ?auto_88314 ?auto_88311 ) ( OBJ-AT ?auto_88312 ?auto_88319 ) ( IN-CITY ?auto_88317 ?auto_88316 ) ( not ( = ?auto_88311 ?auto_88317 ) ) ( not ( = ?auto_88319 ?auto_88317 ) ) ( OBJ-AT ?auto_88313 ?auto_88317 ) ( TRUCK-AT ?auto_88318 ?auto_88311 ) ( OBJ-AT ?auto_88315 ?auto_88311 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88314 ?auto_88312 ?auto_88311 )
      ( DELIVER-4PKG-VERIFY ?auto_88312 ?auto_88313 ?auto_88314 ?auto_88315 ?auto_88311 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_88339 - OBJ
      ?auto_88340 - OBJ
      ?auto_88341 - OBJ
      ?auto_88342 - OBJ
      ?auto_88338 - LOCATION
    )
    :vars
    (
      ?auto_88346 - LOCATION
      ?auto_88343 - CITY
      ?auto_88344 - LOCATION
      ?auto_88345 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_88340 ?auto_88339 ) ) ( not ( = ?auto_88341 ?auto_88339 ) ) ( not ( = ?auto_88341 ?auto_88340 ) ) ( not ( = ?auto_88342 ?auto_88339 ) ) ( not ( = ?auto_88342 ?auto_88340 ) ) ( not ( = ?auto_88342 ?auto_88341 ) ) ( IN-CITY ?auto_88346 ?auto_88343 ) ( IN-CITY ?auto_88338 ?auto_88343 ) ( not ( = ?auto_88338 ?auto_88346 ) ) ( OBJ-AT ?auto_88342 ?auto_88338 ) ( OBJ-AT ?auto_88339 ?auto_88346 ) ( IN-CITY ?auto_88344 ?auto_88343 ) ( not ( = ?auto_88338 ?auto_88344 ) ) ( not ( = ?auto_88346 ?auto_88344 ) ) ( OBJ-AT ?auto_88340 ?auto_88344 ) ( TRUCK-AT ?auto_88345 ?auto_88338 ) ( OBJ-AT ?auto_88341 ?auto_88338 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88342 ?auto_88339 ?auto_88338 )
      ( DELIVER-4PKG-VERIFY ?auto_88339 ?auto_88340 ?auto_88341 ?auto_88342 ?auto_88338 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_88618 - OBJ
      ?auto_88617 - LOCATION
    )
    :vars
    (
      ?auto_88623 - OBJ
      ?auto_88624 - LOCATION
      ?auto_88619 - CITY
      ?auto_88621 - OBJ
      ?auto_88620 - LOCATION
      ?auto_88622 - TRUCK
      ?auto_88625 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_88618 ?auto_88623 ) ) ( IN-CITY ?auto_88624 ?auto_88619 ) ( IN-CITY ?auto_88617 ?auto_88619 ) ( not ( = ?auto_88617 ?auto_88624 ) ) ( OBJ-AT ?auto_88623 ?auto_88617 ) ( OBJ-AT ?auto_88618 ?auto_88624 ) ( not ( = ?auto_88621 ?auto_88623 ) ) ( not ( = ?auto_88618 ?auto_88621 ) ) ( IN-CITY ?auto_88620 ?auto_88619 ) ( not ( = ?auto_88617 ?auto_88620 ) ) ( not ( = ?auto_88624 ?auto_88620 ) ) ( OBJ-AT ?auto_88621 ?auto_88620 ) ( TRUCK-AT ?auto_88622 ?auto_88617 ) ( not ( = ?auto_88625 ?auto_88623 ) ) ( IN-TRUCK ?auto_88625 ?auto_88622 ) ( not ( = ?auto_88618 ?auto_88625 ) ) ( not ( = ?auto_88621 ?auto_88625 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88623 ?auto_88625 ?auto_88617 )
      ( DELIVER-2PKG ?auto_88623 ?auto_88618 ?auto_88617 )
      ( DELIVER-1PKG-VERIFY ?auto_88618 ?auto_88617 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_88627 - OBJ
      ?auto_88628 - OBJ
      ?auto_88626 - LOCATION
    )
    :vars
    (
      ?auto_88629 - LOCATION
      ?auto_88634 - CITY
      ?auto_88633 - OBJ
      ?auto_88630 - LOCATION
      ?auto_88631 - TRUCK
      ?auto_88632 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_88628 ?auto_88627 ) ) ( IN-CITY ?auto_88629 ?auto_88634 ) ( IN-CITY ?auto_88626 ?auto_88634 ) ( not ( = ?auto_88626 ?auto_88629 ) ) ( OBJ-AT ?auto_88627 ?auto_88626 ) ( OBJ-AT ?auto_88628 ?auto_88629 ) ( not ( = ?auto_88633 ?auto_88627 ) ) ( not ( = ?auto_88628 ?auto_88633 ) ) ( IN-CITY ?auto_88630 ?auto_88634 ) ( not ( = ?auto_88626 ?auto_88630 ) ) ( not ( = ?auto_88629 ?auto_88630 ) ) ( OBJ-AT ?auto_88633 ?auto_88630 ) ( TRUCK-AT ?auto_88631 ?auto_88626 ) ( not ( = ?auto_88632 ?auto_88627 ) ) ( IN-TRUCK ?auto_88632 ?auto_88631 ) ( not ( = ?auto_88628 ?auto_88632 ) ) ( not ( = ?auto_88633 ?auto_88632 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_88628 ?auto_88626 )
      ( DELIVER-2PKG-VERIFY ?auto_88627 ?auto_88628 ?auto_88626 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_88636 - OBJ
      ?auto_88637 - OBJ
      ?auto_88635 - LOCATION
    )
    :vars
    (
      ?auto_88643 - OBJ
      ?auto_88641 - LOCATION
      ?auto_88638 - CITY
      ?auto_88640 - OBJ
      ?auto_88639 - LOCATION
      ?auto_88642 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_88637 ?auto_88636 ) ) ( not ( = ?auto_88637 ?auto_88643 ) ) ( IN-CITY ?auto_88641 ?auto_88638 ) ( IN-CITY ?auto_88635 ?auto_88638 ) ( not ( = ?auto_88635 ?auto_88641 ) ) ( OBJ-AT ?auto_88643 ?auto_88635 ) ( OBJ-AT ?auto_88637 ?auto_88641 ) ( not ( = ?auto_88640 ?auto_88643 ) ) ( not ( = ?auto_88637 ?auto_88640 ) ) ( IN-CITY ?auto_88639 ?auto_88638 ) ( not ( = ?auto_88635 ?auto_88639 ) ) ( not ( = ?auto_88641 ?auto_88639 ) ) ( OBJ-AT ?auto_88640 ?auto_88639 ) ( TRUCK-AT ?auto_88642 ?auto_88635 ) ( not ( = ?auto_88636 ?auto_88643 ) ) ( IN-TRUCK ?auto_88636 ?auto_88642 ) ( not ( = ?auto_88640 ?auto_88636 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88643 ?auto_88637 ?auto_88635 )
      ( DELIVER-2PKG-VERIFY ?auto_88636 ?auto_88637 ?auto_88635 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_88645 - OBJ
      ?auto_88646 - OBJ
      ?auto_88644 - LOCATION
    )
    :vars
    (
      ?auto_88652 - OBJ
      ?auto_88650 - LOCATION
      ?auto_88648 - CITY
      ?auto_88649 - LOCATION
      ?auto_88651 - TRUCK
      ?auto_88647 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_88646 ?auto_88645 ) ) ( not ( = ?auto_88646 ?auto_88652 ) ) ( IN-CITY ?auto_88650 ?auto_88648 ) ( IN-CITY ?auto_88644 ?auto_88648 ) ( not ( = ?auto_88644 ?auto_88650 ) ) ( OBJ-AT ?auto_88652 ?auto_88644 ) ( OBJ-AT ?auto_88646 ?auto_88650 ) ( not ( = ?auto_88645 ?auto_88652 ) ) ( IN-CITY ?auto_88649 ?auto_88648 ) ( not ( = ?auto_88644 ?auto_88649 ) ) ( not ( = ?auto_88650 ?auto_88649 ) ) ( OBJ-AT ?auto_88645 ?auto_88649 ) ( TRUCK-AT ?auto_88651 ?auto_88644 ) ( not ( = ?auto_88647 ?auto_88652 ) ) ( IN-TRUCK ?auto_88647 ?auto_88651 ) ( not ( = ?auto_88646 ?auto_88647 ) ) ( not ( = ?auto_88645 ?auto_88647 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88652 ?auto_88646 ?auto_88644 )
      ( DELIVER-2PKG-VERIFY ?auto_88645 ?auto_88646 ?auto_88644 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_88654 - OBJ
      ?auto_88655 - OBJ
      ?auto_88653 - LOCATION
    )
    :vars
    (
      ?auto_88660 - LOCATION
      ?auto_88657 - CITY
      ?auto_88659 - OBJ
      ?auto_88658 - LOCATION
      ?auto_88661 - TRUCK
      ?auto_88656 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_88655 ?auto_88654 ) ) ( IN-CITY ?auto_88660 ?auto_88657 ) ( IN-CITY ?auto_88653 ?auto_88657 ) ( not ( = ?auto_88653 ?auto_88660 ) ) ( OBJ-AT ?auto_88655 ?auto_88653 ) ( OBJ-AT ?auto_88654 ?auto_88660 ) ( not ( = ?auto_88659 ?auto_88655 ) ) ( not ( = ?auto_88654 ?auto_88659 ) ) ( IN-CITY ?auto_88658 ?auto_88657 ) ( not ( = ?auto_88653 ?auto_88658 ) ) ( not ( = ?auto_88660 ?auto_88658 ) ) ( OBJ-AT ?auto_88659 ?auto_88658 ) ( TRUCK-AT ?auto_88661 ?auto_88653 ) ( not ( = ?auto_88656 ?auto_88655 ) ) ( IN-TRUCK ?auto_88656 ?auto_88661 ) ( not ( = ?auto_88654 ?auto_88656 ) ) ( not ( = ?auto_88659 ?auto_88656 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88655 ?auto_88654 ?auto_88653 )
      ( DELIVER-2PKG-VERIFY ?auto_88654 ?auto_88655 ?auto_88653 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_88663 - OBJ
      ?auto_88664 - OBJ
      ?auto_88662 - LOCATION
    )
    :vars
    (
      ?auto_88670 - OBJ
      ?auto_88668 - LOCATION
      ?auto_88665 - CITY
      ?auto_88667 - OBJ
      ?auto_88666 - LOCATION
      ?auto_88669 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_88664 ?auto_88663 ) ) ( not ( = ?auto_88663 ?auto_88670 ) ) ( IN-CITY ?auto_88668 ?auto_88665 ) ( IN-CITY ?auto_88662 ?auto_88665 ) ( not ( = ?auto_88662 ?auto_88668 ) ) ( OBJ-AT ?auto_88670 ?auto_88662 ) ( OBJ-AT ?auto_88663 ?auto_88668 ) ( not ( = ?auto_88667 ?auto_88670 ) ) ( not ( = ?auto_88663 ?auto_88667 ) ) ( IN-CITY ?auto_88666 ?auto_88665 ) ( not ( = ?auto_88662 ?auto_88666 ) ) ( not ( = ?auto_88668 ?auto_88666 ) ) ( OBJ-AT ?auto_88667 ?auto_88666 ) ( TRUCK-AT ?auto_88669 ?auto_88662 ) ( not ( = ?auto_88664 ?auto_88670 ) ) ( IN-TRUCK ?auto_88664 ?auto_88669 ) ( not ( = ?auto_88667 ?auto_88664 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88670 ?auto_88663 ?auto_88662 )
      ( DELIVER-2PKG-VERIFY ?auto_88663 ?auto_88664 ?auto_88662 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_88672 - OBJ
      ?auto_88673 - OBJ
      ?auto_88671 - LOCATION
    )
    :vars
    (
      ?auto_88679 - OBJ
      ?auto_88677 - LOCATION
      ?auto_88675 - CITY
      ?auto_88676 - LOCATION
      ?auto_88678 - TRUCK
      ?auto_88674 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_88673 ?auto_88672 ) ) ( not ( = ?auto_88672 ?auto_88679 ) ) ( IN-CITY ?auto_88677 ?auto_88675 ) ( IN-CITY ?auto_88671 ?auto_88675 ) ( not ( = ?auto_88671 ?auto_88677 ) ) ( OBJ-AT ?auto_88679 ?auto_88671 ) ( OBJ-AT ?auto_88672 ?auto_88677 ) ( not ( = ?auto_88673 ?auto_88679 ) ) ( IN-CITY ?auto_88676 ?auto_88675 ) ( not ( = ?auto_88671 ?auto_88676 ) ) ( not ( = ?auto_88677 ?auto_88676 ) ) ( OBJ-AT ?auto_88673 ?auto_88676 ) ( TRUCK-AT ?auto_88678 ?auto_88671 ) ( not ( = ?auto_88674 ?auto_88679 ) ) ( IN-TRUCK ?auto_88674 ?auto_88678 ) ( not ( = ?auto_88672 ?auto_88674 ) ) ( not ( = ?auto_88673 ?auto_88674 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88679 ?auto_88672 ?auto_88671 )
      ( DELIVER-2PKG-VERIFY ?auto_88672 ?auto_88673 ?auto_88671 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_88701 - OBJ
      ?auto_88702 - OBJ
      ?auto_88703 - OBJ
      ?auto_88700 - LOCATION
    )
    :vars
    (
      ?auto_88707 - LOCATION
      ?auto_88704 - CITY
      ?auto_88706 - OBJ
      ?auto_88705 - LOCATION
      ?auto_88708 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_88702 ?auto_88701 ) ) ( not ( = ?auto_88703 ?auto_88701 ) ) ( not ( = ?auto_88703 ?auto_88702 ) ) ( IN-CITY ?auto_88707 ?auto_88704 ) ( IN-CITY ?auto_88700 ?auto_88704 ) ( not ( = ?auto_88700 ?auto_88707 ) ) ( OBJ-AT ?auto_88701 ?auto_88700 ) ( OBJ-AT ?auto_88703 ?auto_88707 ) ( not ( = ?auto_88706 ?auto_88701 ) ) ( not ( = ?auto_88703 ?auto_88706 ) ) ( IN-CITY ?auto_88705 ?auto_88704 ) ( not ( = ?auto_88700 ?auto_88705 ) ) ( not ( = ?auto_88707 ?auto_88705 ) ) ( OBJ-AT ?auto_88706 ?auto_88705 ) ( TRUCK-AT ?auto_88708 ?auto_88700 ) ( IN-TRUCK ?auto_88702 ?auto_88708 ) ( not ( = ?auto_88706 ?auto_88702 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88701 ?auto_88703 ?auto_88700 )
      ( DELIVER-3PKG-VERIFY ?auto_88701 ?auto_88702 ?auto_88703 ?auto_88700 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_88710 - OBJ
      ?auto_88711 - OBJ
      ?auto_88712 - OBJ
      ?auto_88709 - LOCATION
    )
    :vars
    (
      ?auto_88716 - LOCATION
      ?auto_88714 - CITY
      ?auto_88715 - LOCATION
      ?auto_88717 - TRUCK
      ?auto_88713 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_88711 ?auto_88710 ) ) ( not ( = ?auto_88712 ?auto_88710 ) ) ( not ( = ?auto_88712 ?auto_88711 ) ) ( IN-CITY ?auto_88716 ?auto_88714 ) ( IN-CITY ?auto_88709 ?auto_88714 ) ( not ( = ?auto_88709 ?auto_88716 ) ) ( OBJ-AT ?auto_88710 ?auto_88709 ) ( OBJ-AT ?auto_88712 ?auto_88716 ) ( IN-CITY ?auto_88715 ?auto_88714 ) ( not ( = ?auto_88709 ?auto_88715 ) ) ( not ( = ?auto_88716 ?auto_88715 ) ) ( OBJ-AT ?auto_88711 ?auto_88715 ) ( TRUCK-AT ?auto_88717 ?auto_88709 ) ( not ( = ?auto_88713 ?auto_88710 ) ) ( IN-TRUCK ?auto_88713 ?auto_88717 ) ( not ( = ?auto_88712 ?auto_88713 ) ) ( not ( = ?auto_88711 ?auto_88713 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88710 ?auto_88712 ?auto_88709 )
      ( DELIVER-3PKG-VERIFY ?auto_88710 ?auto_88711 ?auto_88712 ?auto_88709 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_88729 - OBJ
      ?auto_88730 - OBJ
      ?auto_88731 - OBJ
      ?auto_88728 - LOCATION
    )
    :vars
    (
      ?auto_88735 - LOCATION
      ?auto_88732 - CITY
      ?auto_88734 - OBJ
      ?auto_88733 - LOCATION
      ?auto_88736 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_88730 ?auto_88729 ) ) ( not ( = ?auto_88731 ?auto_88729 ) ) ( not ( = ?auto_88731 ?auto_88730 ) ) ( IN-CITY ?auto_88735 ?auto_88732 ) ( IN-CITY ?auto_88728 ?auto_88732 ) ( not ( = ?auto_88728 ?auto_88735 ) ) ( OBJ-AT ?auto_88729 ?auto_88728 ) ( OBJ-AT ?auto_88730 ?auto_88735 ) ( not ( = ?auto_88734 ?auto_88729 ) ) ( not ( = ?auto_88730 ?auto_88734 ) ) ( IN-CITY ?auto_88733 ?auto_88732 ) ( not ( = ?auto_88728 ?auto_88733 ) ) ( not ( = ?auto_88735 ?auto_88733 ) ) ( OBJ-AT ?auto_88734 ?auto_88733 ) ( TRUCK-AT ?auto_88736 ?auto_88728 ) ( IN-TRUCK ?auto_88731 ?auto_88736 ) ( not ( = ?auto_88734 ?auto_88731 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88729 ?auto_88730 ?auto_88728 )
      ( DELIVER-3PKG-VERIFY ?auto_88729 ?auto_88730 ?auto_88731 ?auto_88728 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_88738 - OBJ
      ?auto_88739 - OBJ
      ?auto_88740 - OBJ
      ?auto_88737 - LOCATION
    )
    :vars
    (
      ?auto_88744 - LOCATION
      ?auto_88742 - CITY
      ?auto_88743 - LOCATION
      ?auto_88745 - TRUCK
      ?auto_88741 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_88739 ?auto_88738 ) ) ( not ( = ?auto_88740 ?auto_88738 ) ) ( not ( = ?auto_88740 ?auto_88739 ) ) ( IN-CITY ?auto_88744 ?auto_88742 ) ( IN-CITY ?auto_88737 ?auto_88742 ) ( not ( = ?auto_88737 ?auto_88744 ) ) ( OBJ-AT ?auto_88738 ?auto_88737 ) ( OBJ-AT ?auto_88739 ?auto_88744 ) ( IN-CITY ?auto_88743 ?auto_88742 ) ( not ( = ?auto_88737 ?auto_88743 ) ) ( not ( = ?auto_88744 ?auto_88743 ) ) ( OBJ-AT ?auto_88740 ?auto_88743 ) ( TRUCK-AT ?auto_88745 ?auto_88737 ) ( not ( = ?auto_88741 ?auto_88738 ) ) ( IN-TRUCK ?auto_88741 ?auto_88745 ) ( not ( = ?auto_88739 ?auto_88741 ) ) ( not ( = ?auto_88740 ?auto_88741 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88738 ?auto_88739 ?auto_88737 )
      ( DELIVER-3PKG-VERIFY ?auto_88738 ?auto_88739 ?auto_88740 ?auto_88737 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_88757 - OBJ
      ?auto_88758 - OBJ
      ?auto_88759 - OBJ
      ?auto_88756 - LOCATION
    )
    :vars
    (
      ?auto_88763 - LOCATION
      ?auto_88760 - CITY
      ?auto_88762 - OBJ
      ?auto_88761 - LOCATION
      ?auto_88764 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_88758 ?auto_88757 ) ) ( not ( = ?auto_88759 ?auto_88757 ) ) ( not ( = ?auto_88759 ?auto_88758 ) ) ( IN-CITY ?auto_88763 ?auto_88760 ) ( IN-CITY ?auto_88756 ?auto_88760 ) ( not ( = ?auto_88756 ?auto_88763 ) ) ( OBJ-AT ?auto_88758 ?auto_88756 ) ( OBJ-AT ?auto_88759 ?auto_88763 ) ( not ( = ?auto_88762 ?auto_88758 ) ) ( not ( = ?auto_88759 ?auto_88762 ) ) ( IN-CITY ?auto_88761 ?auto_88760 ) ( not ( = ?auto_88756 ?auto_88761 ) ) ( not ( = ?auto_88763 ?auto_88761 ) ) ( OBJ-AT ?auto_88762 ?auto_88761 ) ( TRUCK-AT ?auto_88764 ?auto_88756 ) ( IN-TRUCK ?auto_88757 ?auto_88764 ) ( not ( = ?auto_88762 ?auto_88757 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88758 ?auto_88759 ?auto_88756 )
      ( DELIVER-3PKG-VERIFY ?auto_88757 ?auto_88758 ?auto_88759 ?auto_88756 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_88776 - OBJ
      ?auto_88777 - OBJ
      ?auto_88778 - OBJ
      ?auto_88775 - LOCATION
    )
    :vars
    (
      ?auto_88783 - OBJ
      ?auto_88781 - LOCATION
      ?auto_88779 - CITY
      ?auto_88780 - LOCATION
      ?auto_88782 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_88777 ?auto_88776 ) ) ( not ( = ?auto_88778 ?auto_88776 ) ) ( not ( = ?auto_88778 ?auto_88777 ) ) ( not ( = ?auto_88778 ?auto_88783 ) ) ( IN-CITY ?auto_88781 ?auto_88779 ) ( IN-CITY ?auto_88775 ?auto_88779 ) ( not ( = ?auto_88775 ?auto_88781 ) ) ( OBJ-AT ?auto_88783 ?auto_88775 ) ( OBJ-AT ?auto_88778 ?auto_88781 ) ( not ( = ?auto_88777 ?auto_88783 ) ) ( IN-CITY ?auto_88780 ?auto_88779 ) ( not ( = ?auto_88775 ?auto_88780 ) ) ( not ( = ?auto_88781 ?auto_88780 ) ) ( OBJ-AT ?auto_88777 ?auto_88780 ) ( TRUCK-AT ?auto_88782 ?auto_88775 ) ( not ( = ?auto_88776 ?auto_88783 ) ) ( IN-TRUCK ?auto_88776 ?auto_88782 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88783 ?auto_88778 ?auto_88775 )
      ( DELIVER-3PKG-VERIFY ?auto_88776 ?auto_88777 ?auto_88778 ?auto_88775 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_88785 - OBJ
      ?auto_88786 - OBJ
      ?auto_88787 - OBJ
      ?auto_88784 - LOCATION
    )
    :vars
    (
      ?auto_88791 - LOCATION
      ?auto_88788 - CITY
      ?auto_88790 - OBJ
      ?auto_88789 - LOCATION
      ?auto_88792 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_88786 ?auto_88785 ) ) ( not ( = ?auto_88787 ?auto_88785 ) ) ( not ( = ?auto_88787 ?auto_88786 ) ) ( IN-CITY ?auto_88791 ?auto_88788 ) ( IN-CITY ?auto_88784 ?auto_88788 ) ( not ( = ?auto_88784 ?auto_88791 ) ) ( OBJ-AT ?auto_88787 ?auto_88784 ) ( OBJ-AT ?auto_88786 ?auto_88791 ) ( not ( = ?auto_88790 ?auto_88787 ) ) ( not ( = ?auto_88786 ?auto_88790 ) ) ( IN-CITY ?auto_88789 ?auto_88788 ) ( not ( = ?auto_88784 ?auto_88789 ) ) ( not ( = ?auto_88791 ?auto_88789 ) ) ( OBJ-AT ?auto_88790 ?auto_88789 ) ( TRUCK-AT ?auto_88792 ?auto_88784 ) ( IN-TRUCK ?auto_88785 ?auto_88792 ) ( not ( = ?auto_88790 ?auto_88785 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88787 ?auto_88786 ?auto_88784 )
      ( DELIVER-3PKG-VERIFY ?auto_88785 ?auto_88786 ?auto_88787 ?auto_88784 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_88804 - OBJ
      ?auto_88805 - OBJ
      ?auto_88806 - OBJ
      ?auto_88803 - LOCATION
    )
    :vars
    (
      ?auto_88811 - OBJ
      ?auto_88809 - LOCATION
      ?auto_88807 - CITY
      ?auto_88808 - LOCATION
      ?auto_88810 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_88805 ?auto_88804 ) ) ( not ( = ?auto_88806 ?auto_88804 ) ) ( not ( = ?auto_88806 ?auto_88805 ) ) ( not ( = ?auto_88805 ?auto_88811 ) ) ( IN-CITY ?auto_88809 ?auto_88807 ) ( IN-CITY ?auto_88803 ?auto_88807 ) ( not ( = ?auto_88803 ?auto_88809 ) ) ( OBJ-AT ?auto_88811 ?auto_88803 ) ( OBJ-AT ?auto_88805 ?auto_88809 ) ( not ( = ?auto_88806 ?auto_88811 ) ) ( IN-CITY ?auto_88808 ?auto_88807 ) ( not ( = ?auto_88803 ?auto_88808 ) ) ( not ( = ?auto_88809 ?auto_88808 ) ) ( OBJ-AT ?auto_88806 ?auto_88808 ) ( TRUCK-AT ?auto_88810 ?auto_88803 ) ( not ( = ?auto_88804 ?auto_88811 ) ) ( IN-TRUCK ?auto_88804 ?auto_88810 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88811 ?auto_88805 ?auto_88803 )
      ( DELIVER-3PKG-VERIFY ?auto_88804 ?auto_88805 ?auto_88806 ?auto_88803 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_88823 - OBJ
      ?auto_88824 - OBJ
      ?auto_88825 - OBJ
      ?auto_88822 - LOCATION
    )
    :vars
    (
      ?auto_88829 - LOCATION
      ?auto_88827 - CITY
      ?auto_88828 - LOCATION
      ?auto_88830 - TRUCK
      ?auto_88826 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_88824 ?auto_88823 ) ) ( not ( = ?auto_88825 ?auto_88823 ) ) ( not ( = ?auto_88825 ?auto_88824 ) ) ( IN-CITY ?auto_88829 ?auto_88827 ) ( IN-CITY ?auto_88822 ?auto_88827 ) ( not ( = ?auto_88822 ?auto_88829 ) ) ( OBJ-AT ?auto_88824 ?auto_88822 ) ( OBJ-AT ?auto_88825 ?auto_88829 ) ( IN-CITY ?auto_88828 ?auto_88827 ) ( not ( = ?auto_88822 ?auto_88828 ) ) ( not ( = ?auto_88829 ?auto_88828 ) ) ( OBJ-AT ?auto_88823 ?auto_88828 ) ( TRUCK-AT ?auto_88830 ?auto_88822 ) ( not ( = ?auto_88826 ?auto_88824 ) ) ( IN-TRUCK ?auto_88826 ?auto_88830 ) ( not ( = ?auto_88825 ?auto_88826 ) ) ( not ( = ?auto_88823 ?auto_88826 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88824 ?auto_88825 ?auto_88822 )
      ( DELIVER-3PKG-VERIFY ?auto_88823 ?auto_88824 ?auto_88825 ?auto_88822 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_88832 - OBJ
      ?auto_88833 - OBJ
      ?auto_88834 - OBJ
      ?auto_88831 - LOCATION
    )
    :vars
    (
      ?auto_88839 - OBJ
      ?auto_88837 - LOCATION
      ?auto_88835 - CITY
      ?auto_88836 - LOCATION
      ?auto_88838 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_88833 ?auto_88832 ) ) ( not ( = ?auto_88834 ?auto_88832 ) ) ( not ( = ?auto_88834 ?auto_88833 ) ) ( not ( = ?auto_88834 ?auto_88839 ) ) ( IN-CITY ?auto_88837 ?auto_88835 ) ( IN-CITY ?auto_88831 ?auto_88835 ) ( not ( = ?auto_88831 ?auto_88837 ) ) ( OBJ-AT ?auto_88839 ?auto_88831 ) ( OBJ-AT ?auto_88834 ?auto_88837 ) ( not ( = ?auto_88832 ?auto_88839 ) ) ( IN-CITY ?auto_88836 ?auto_88835 ) ( not ( = ?auto_88831 ?auto_88836 ) ) ( not ( = ?auto_88837 ?auto_88836 ) ) ( OBJ-AT ?auto_88832 ?auto_88836 ) ( TRUCK-AT ?auto_88838 ?auto_88831 ) ( not ( = ?auto_88833 ?auto_88839 ) ) ( IN-TRUCK ?auto_88833 ?auto_88838 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88839 ?auto_88834 ?auto_88831 )
      ( DELIVER-3PKG-VERIFY ?auto_88832 ?auto_88833 ?auto_88834 ?auto_88831 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_88851 - OBJ
      ?auto_88852 - OBJ
      ?auto_88853 - OBJ
      ?auto_88850 - LOCATION
    )
    :vars
    (
      ?auto_88857 - LOCATION
      ?auto_88855 - CITY
      ?auto_88856 - LOCATION
      ?auto_88858 - TRUCK
      ?auto_88854 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_88852 ?auto_88851 ) ) ( not ( = ?auto_88853 ?auto_88851 ) ) ( not ( = ?auto_88853 ?auto_88852 ) ) ( IN-CITY ?auto_88857 ?auto_88855 ) ( IN-CITY ?auto_88850 ?auto_88855 ) ( not ( = ?auto_88850 ?auto_88857 ) ) ( OBJ-AT ?auto_88853 ?auto_88850 ) ( OBJ-AT ?auto_88852 ?auto_88857 ) ( IN-CITY ?auto_88856 ?auto_88855 ) ( not ( = ?auto_88850 ?auto_88856 ) ) ( not ( = ?auto_88857 ?auto_88856 ) ) ( OBJ-AT ?auto_88851 ?auto_88856 ) ( TRUCK-AT ?auto_88858 ?auto_88850 ) ( not ( = ?auto_88854 ?auto_88853 ) ) ( IN-TRUCK ?auto_88854 ?auto_88858 ) ( not ( = ?auto_88852 ?auto_88854 ) ) ( not ( = ?auto_88851 ?auto_88854 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88853 ?auto_88852 ?auto_88850 )
      ( DELIVER-3PKG-VERIFY ?auto_88851 ?auto_88852 ?auto_88853 ?auto_88850 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_88860 - OBJ
      ?auto_88861 - OBJ
      ?auto_88862 - OBJ
      ?auto_88859 - LOCATION
    )
    :vars
    (
      ?auto_88867 - OBJ
      ?auto_88865 - LOCATION
      ?auto_88863 - CITY
      ?auto_88864 - LOCATION
      ?auto_88866 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_88861 ?auto_88860 ) ) ( not ( = ?auto_88862 ?auto_88860 ) ) ( not ( = ?auto_88862 ?auto_88861 ) ) ( not ( = ?auto_88861 ?auto_88867 ) ) ( IN-CITY ?auto_88865 ?auto_88863 ) ( IN-CITY ?auto_88859 ?auto_88863 ) ( not ( = ?auto_88859 ?auto_88865 ) ) ( OBJ-AT ?auto_88867 ?auto_88859 ) ( OBJ-AT ?auto_88861 ?auto_88865 ) ( not ( = ?auto_88860 ?auto_88867 ) ) ( IN-CITY ?auto_88864 ?auto_88863 ) ( not ( = ?auto_88859 ?auto_88864 ) ) ( not ( = ?auto_88865 ?auto_88864 ) ) ( OBJ-AT ?auto_88860 ?auto_88864 ) ( TRUCK-AT ?auto_88866 ?auto_88859 ) ( not ( = ?auto_88862 ?auto_88867 ) ) ( IN-TRUCK ?auto_88862 ?auto_88866 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88867 ?auto_88861 ?auto_88859 )
      ( DELIVER-3PKG-VERIFY ?auto_88860 ?auto_88861 ?auto_88862 ?auto_88859 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_88899 - OBJ
      ?auto_88900 - OBJ
      ?auto_88901 - OBJ
      ?auto_88898 - LOCATION
    )
    :vars
    (
      ?auto_88905 - LOCATION
      ?auto_88902 - CITY
      ?auto_88904 - OBJ
      ?auto_88903 - LOCATION
      ?auto_88906 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_88900 ?auto_88899 ) ) ( not ( = ?auto_88901 ?auto_88899 ) ) ( not ( = ?auto_88901 ?auto_88900 ) ) ( IN-CITY ?auto_88905 ?auto_88902 ) ( IN-CITY ?auto_88898 ?auto_88902 ) ( not ( = ?auto_88898 ?auto_88905 ) ) ( OBJ-AT ?auto_88900 ?auto_88898 ) ( OBJ-AT ?auto_88899 ?auto_88905 ) ( not ( = ?auto_88904 ?auto_88900 ) ) ( not ( = ?auto_88899 ?auto_88904 ) ) ( IN-CITY ?auto_88903 ?auto_88902 ) ( not ( = ?auto_88898 ?auto_88903 ) ) ( not ( = ?auto_88905 ?auto_88903 ) ) ( OBJ-AT ?auto_88904 ?auto_88903 ) ( TRUCK-AT ?auto_88906 ?auto_88898 ) ( IN-TRUCK ?auto_88901 ?auto_88906 ) ( not ( = ?auto_88904 ?auto_88901 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88900 ?auto_88899 ?auto_88898 )
      ( DELIVER-3PKG-VERIFY ?auto_88899 ?auto_88900 ?auto_88901 ?auto_88898 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_88908 - OBJ
      ?auto_88909 - OBJ
      ?auto_88910 - OBJ
      ?auto_88907 - LOCATION
    )
    :vars
    (
      ?auto_88914 - LOCATION
      ?auto_88912 - CITY
      ?auto_88913 - LOCATION
      ?auto_88915 - TRUCK
      ?auto_88911 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_88909 ?auto_88908 ) ) ( not ( = ?auto_88910 ?auto_88908 ) ) ( not ( = ?auto_88910 ?auto_88909 ) ) ( IN-CITY ?auto_88914 ?auto_88912 ) ( IN-CITY ?auto_88907 ?auto_88912 ) ( not ( = ?auto_88907 ?auto_88914 ) ) ( OBJ-AT ?auto_88909 ?auto_88907 ) ( OBJ-AT ?auto_88908 ?auto_88914 ) ( IN-CITY ?auto_88913 ?auto_88912 ) ( not ( = ?auto_88907 ?auto_88913 ) ) ( not ( = ?auto_88914 ?auto_88913 ) ) ( OBJ-AT ?auto_88910 ?auto_88913 ) ( TRUCK-AT ?auto_88915 ?auto_88907 ) ( not ( = ?auto_88911 ?auto_88909 ) ) ( IN-TRUCK ?auto_88911 ?auto_88915 ) ( not ( = ?auto_88908 ?auto_88911 ) ) ( not ( = ?auto_88910 ?auto_88911 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88909 ?auto_88908 ?auto_88907 )
      ( DELIVER-3PKG-VERIFY ?auto_88908 ?auto_88909 ?auto_88910 ?auto_88907 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_88927 - OBJ
      ?auto_88928 - OBJ
      ?auto_88929 - OBJ
      ?auto_88926 - LOCATION
    )
    :vars
    (
      ?auto_88933 - LOCATION
      ?auto_88930 - CITY
      ?auto_88932 - OBJ
      ?auto_88931 - LOCATION
      ?auto_88934 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_88928 ?auto_88927 ) ) ( not ( = ?auto_88929 ?auto_88927 ) ) ( not ( = ?auto_88929 ?auto_88928 ) ) ( IN-CITY ?auto_88933 ?auto_88930 ) ( IN-CITY ?auto_88926 ?auto_88930 ) ( not ( = ?auto_88926 ?auto_88933 ) ) ( OBJ-AT ?auto_88929 ?auto_88926 ) ( OBJ-AT ?auto_88927 ?auto_88933 ) ( not ( = ?auto_88932 ?auto_88929 ) ) ( not ( = ?auto_88927 ?auto_88932 ) ) ( IN-CITY ?auto_88931 ?auto_88930 ) ( not ( = ?auto_88926 ?auto_88931 ) ) ( not ( = ?auto_88933 ?auto_88931 ) ) ( OBJ-AT ?auto_88932 ?auto_88931 ) ( TRUCK-AT ?auto_88934 ?auto_88926 ) ( IN-TRUCK ?auto_88928 ?auto_88934 ) ( not ( = ?auto_88932 ?auto_88928 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88929 ?auto_88927 ?auto_88926 )
      ( DELIVER-3PKG-VERIFY ?auto_88927 ?auto_88928 ?auto_88929 ?auto_88926 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_88946 - OBJ
      ?auto_88947 - OBJ
      ?auto_88948 - OBJ
      ?auto_88945 - LOCATION
    )
    :vars
    (
      ?auto_88953 - OBJ
      ?auto_88951 - LOCATION
      ?auto_88949 - CITY
      ?auto_88950 - LOCATION
      ?auto_88952 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_88947 ?auto_88946 ) ) ( not ( = ?auto_88948 ?auto_88946 ) ) ( not ( = ?auto_88948 ?auto_88947 ) ) ( not ( = ?auto_88946 ?auto_88953 ) ) ( IN-CITY ?auto_88951 ?auto_88949 ) ( IN-CITY ?auto_88945 ?auto_88949 ) ( not ( = ?auto_88945 ?auto_88951 ) ) ( OBJ-AT ?auto_88953 ?auto_88945 ) ( OBJ-AT ?auto_88946 ?auto_88951 ) ( not ( = ?auto_88948 ?auto_88953 ) ) ( IN-CITY ?auto_88950 ?auto_88949 ) ( not ( = ?auto_88945 ?auto_88950 ) ) ( not ( = ?auto_88951 ?auto_88950 ) ) ( OBJ-AT ?auto_88948 ?auto_88950 ) ( TRUCK-AT ?auto_88952 ?auto_88945 ) ( not ( = ?auto_88947 ?auto_88953 ) ) ( IN-TRUCK ?auto_88947 ?auto_88952 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88953 ?auto_88946 ?auto_88945 )
      ( DELIVER-3PKG-VERIFY ?auto_88946 ?auto_88947 ?auto_88948 ?auto_88945 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_88965 - OBJ
      ?auto_88966 - OBJ
      ?auto_88967 - OBJ
      ?auto_88964 - LOCATION
    )
    :vars
    (
      ?auto_88971 - LOCATION
      ?auto_88969 - CITY
      ?auto_88970 - LOCATION
      ?auto_88972 - TRUCK
      ?auto_88968 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_88966 ?auto_88965 ) ) ( not ( = ?auto_88967 ?auto_88965 ) ) ( not ( = ?auto_88967 ?auto_88966 ) ) ( IN-CITY ?auto_88971 ?auto_88969 ) ( IN-CITY ?auto_88964 ?auto_88969 ) ( not ( = ?auto_88964 ?auto_88971 ) ) ( OBJ-AT ?auto_88967 ?auto_88964 ) ( OBJ-AT ?auto_88965 ?auto_88971 ) ( IN-CITY ?auto_88970 ?auto_88969 ) ( not ( = ?auto_88964 ?auto_88970 ) ) ( not ( = ?auto_88971 ?auto_88970 ) ) ( OBJ-AT ?auto_88966 ?auto_88970 ) ( TRUCK-AT ?auto_88972 ?auto_88964 ) ( not ( = ?auto_88968 ?auto_88967 ) ) ( IN-TRUCK ?auto_88968 ?auto_88972 ) ( not ( = ?auto_88965 ?auto_88968 ) ) ( not ( = ?auto_88966 ?auto_88968 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88967 ?auto_88965 ?auto_88964 )
      ( DELIVER-3PKG-VERIFY ?auto_88965 ?auto_88966 ?auto_88967 ?auto_88964 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_88974 - OBJ
      ?auto_88975 - OBJ
      ?auto_88976 - OBJ
      ?auto_88973 - LOCATION
    )
    :vars
    (
      ?auto_88981 - OBJ
      ?auto_88979 - LOCATION
      ?auto_88977 - CITY
      ?auto_88978 - LOCATION
      ?auto_88980 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_88975 ?auto_88974 ) ) ( not ( = ?auto_88976 ?auto_88974 ) ) ( not ( = ?auto_88976 ?auto_88975 ) ) ( not ( = ?auto_88974 ?auto_88981 ) ) ( IN-CITY ?auto_88979 ?auto_88977 ) ( IN-CITY ?auto_88973 ?auto_88977 ) ( not ( = ?auto_88973 ?auto_88979 ) ) ( OBJ-AT ?auto_88981 ?auto_88973 ) ( OBJ-AT ?auto_88974 ?auto_88979 ) ( not ( = ?auto_88975 ?auto_88981 ) ) ( IN-CITY ?auto_88978 ?auto_88977 ) ( not ( = ?auto_88973 ?auto_88978 ) ) ( not ( = ?auto_88979 ?auto_88978 ) ) ( OBJ-AT ?auto_88975 ?auto_88978 ) ( TRUCK-AT ?auto_88980 ?auto_88973 ) ( not ( = ?auto_88976 ?auto_88981 ) ) ( IN-TRUCK ?auto_88976 ?auto_88980 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_88981 ?auto_88974 ?auto_88973 )
      ( DELIVER-3PKG-VERIFY ?auto_88974 ?auto_88975 ?auto_88976 ?auto_88973 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_89137 - OBJ
      ?auto_89138 - OBJ
      ?auto_89139 - OBJ
      ?auto_89140 - OBJ
      ?auto_89136 - LOCATION
    )
    :vars
    (
      ?auto_89143 - LOCATION
      ?auto_89141 - CITY
      ?auto_89142 - LOCATION
      ?auto_89144 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_89138 ?auto_89137 ) ) ( not ( = ?auto_89139 ?auto_89137 ) ) ( not ( = ?auto_89139 ?auto_89138 ) ) ( not ( = ?auto_89140 ?auto_89137 ) ) ( not ( = ?auto_89140 ?auto_89138 ) ) ( not ( = ?auto_89140 ?auto_89139 ) ) ( IN-CITY ?auto_89143 ?auto_89141 ) ( IN-CITY ?auto_89136 ?auto_89141 ) ( not ( = ?auto_89136 ?auto_89143 ) ) ( OBJ-AT ?auto_89137 ?auto_89136 ) ( OBJ-AT ?auto_89140 ?auto_89143 ) ( IN-CITY ?auto_89142 ?auto_89141 ) ( not ( = ?auto_89136 ?auto_89142 ) ) ( not ( = ?auto_89143 ?auto_89142 ) ) ( OBJ-AT ?auto_89139 ?auto_89142 ) ( TRUCK-AT ?auto_89144 ?auto_89136 ) ( IN-TRUCK ?auto_89138 ?auto_89144 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_89137 ?auto_89140 ?auto_89136 )
      ( DELIVER-4PKG-VERIFY ?auto_89137 ?auto_89138 ?auto_89139 ?auto_89140 ?auto_89136 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_89166 - OBJ
      ?auto_89167 - OBJ
      ?auto_89168 - OBJ
      ?auto_89169 - OBJ
      ?auto_89165 - LOCATION
    )
    :vars
    (
      ?auto_89172 - LOCATION
      ?auto_89170 - CITY
      ?auto_89171 - LOCATION
      ?auto_89173 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_89167 ?auto_89166 ) ) ( not ( = ?auto_89168 ?auto_89166 ) ) ( not ( = ?auto_89168 ?auto_89167 ) ) ( not ( = ?auto_89169 ?auto_89166 ) ) ( not ( = ?auto_89169 ?auto_89167 ) ) ( not ( = ?auto_89169 ?auto_89168 ) ) ( IN-CITY ?auto_89172 ?auto_89170 ) ( IN-CITY ?auto_89165 ?auto_89170 ) ( not ( = ?auto_89165 ?auto_89172 ) ) ( OBJ-AT ?auto_89166 ?auto_89165 ) ( OBJ-AT ?auto_89168 ?auto_89172 ) ( IN-CITY ?auto_89171 ?auto_89170 ) ( not ( = ?auto_89165 ?auto_89171 ) ) ( not ( = ?auto_89172 ?auto_89171 ) ) ( OBJ-AT ?auto_89169 ?auto_89171 ) ( TRUCK-AT ?auto_89173 ?auto_89165 ) ( IN-TRUCK ?auto_89167 ?auto_89173 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_89166 ?auto_89168 ?auto_89165 )
      ( DELIVER-4PKG-VERIFY ?auto_89166 ?auto_89167 ?auto_89168 ?auto_89169 ?auto_89165 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_89195 - OBJ
      ?auto_89196 - OBJ
      ?auto_89197 - OBJ
      ?auto_89198 - OBJ
      ?auto_89194 - LOCATION
    )
    :vars
    (
      ?auto_89201 - LOCATION
      ?auto_89199 - CITY
      ?auto_89200 - LOCATION
      ?auto_89202 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_89196 ?auto_89195 ) ) ( not ( = ?auto_89197 ?auto_89195 ) ) ( not ( = ?auto_89197 ?auto_89196 ) ) ( not ( = ?auto_89198 ?auto_89195 ) ) ( not ( = ?auto_89198 ?auto_89196 ) ) ( not ( = ?auto_89198 ?auto_89197 ) ) ( IN-CITY ?auto_89201 ?auto_89199 ) ( IN-CITY ?auto_89194 ?auto_89199 ) ( not ( = ?auto_89194 ?auto_89201 ) ) ( OBJ-AT ?auto_89195 ?auto_89194 ) ( OBJ-AT ?auto_89198 ?auto_89201 ) ( IN-CITY ?auto_89200 ?auto_89199 ) ( not ( = ?auto_89194 ?auto_89200 ) ) ( not ( = ?auto_89201 ?auto_89200 ) ) ( OBJ-AT ?auto_89196 ?auto_89200 ) ( TRUCK-AT ?auto_89202 ?auto_89194 ) ( IN-TRUCK ?auto_89197 ?auto_89202 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_89195 ?auto_89198 ?auto_89194 )
      ( DELIVER-4PKG-VERIFY ?auto_89195 ?auto_89196 ?auto_89197 ?auto_89198 ?auto_89194 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_89224 - OBJ
      ?auto_89225 - OBJ
      ?auto_89226 - OBJ
      ?auto_89227 - OBJ
      ?auto_89223 - LOCATION
    )
    :vars
    (
      ?auto_89230 - LOCATION
      ?auto_89228 - CITY
      ?auto_89229 - LOCATION
      ?auto_89231 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_89225 ?auto_89224 ) ) ( not ( = ?auto_89226 ?auto_89224 ) ) ( not ( = ?auto_89226 ?auto_89225 ) ) ( not ( = ?auto_89227 ?auto_89224 ) ) ( not ( = ?auto_89227 ?auto_89225 ) ) ( not ( = ?auto_89227 ?auto_89226 ) ) ( IN-CITY ?auto_89230 ?auto_89228 ) ( IN-CITY ?auto_89223 ?auto_89228 ) ( not ( = ?auto_89223 ?auto_89230 ) ) ( OBJ-AT ?auto_89224 ?auto_89223 ) ( OBJ-AT ?auto_89226 ?auto_89230 ) ( IN-CITY ?auto_89229 ?auto_89228 ) ( not ( = ?auto_89223 ?auto_89229 ) ) ( not ( = ?auto_89230 ?auto_89229 ) ) ( OBJ-AT ?auto_89225 ?auto_89229 ) ( TRUCK-AT ?auto_89231 ?auto_89223 ) ( IN-TRUCK ?auto_89227 ?auto_89231 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_89224 ?auto_89226 ?auto_89223 )
      ( DELIVER-4PKG-VERIFY ?auto_89224 ?auto_89225 ?auto_89226 ?auto_89227 ?auto_89223 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_89315 - OBJ
      ?auto_89316 - OBJ
      ?auto_89317 - OBJ
      ?auto_89318 - OBJ
      ?auto_89314 - LOCATION
    )
    :vars
    (
      ?auto_89321 - LOCATION
      ?auto_89319 - CITY
      ?auto_89320 - LOCATION
      ?auto_89322 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_89316 ?auto_89315 ) ) ( not ( = ?auto_89317 ?auto_89315 ) ) ( not ( = ?auto_89317 ?auto_89316 ) ) ( not ( = ?auto_89318 ?auto_89315 ) ) ( not ( = ?auto_89318 ?auto_89316 ) ) ( not ( = ?auto_89318 ?auto_89317 ) ) ( IN-CITY ?auto_89321 ?auto_89319 ) ( IN-CITY ?auto_89314 ?auto_89319 ) ( not ( = ?auto_89314 ?auto_89321 ) ) ( OBJ-AT ?auto_89315 ?auto_89314 ) ( OBJ-AT ?auto_89316 ?auto_89321 ) ( IN-CITY ?auto_89320 ?auto_89319 ) ( not ( = ?auto_89314 ?auto_89320 ) ) ( not ( = ?auto_89321 ?auto_89320 ) ) ( OBJ-AT ?auto_89318 ?auto_89320 ) ( TRUCK-AT ?auto_89322 ?auto_89314 ) ( IN-TRUCK ?auto_89317 ?auto_89322 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_89315 ?auto_89316 ?auto_89314 )
      ( DELIVER-4PKG-VERIFY ?auto_89315 ?auto_89316 ?auto_89317 ?auto_89318 ?auto_89314 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_89344 - OBJ
      ?auto_89345 - OBJ
      ?auto_89346 - OBJ
      ?auto_89347 - OBJ
      ?auto_89343 - LOCATION
    )
    :vars
    (
      ?auto_89350 - LOCATION
      ?auto_89348 - CITY
      ?auto_89349 - LOCATION
      ?auto_89351 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_89345 ?auto_89344 ) ) ( not ( = ?auto_89346 ?auto_89344 ) ) ( not ( = ?auto_89346 ?auto_89345 ) ) ( not ( = ?auto_89347 ?auto_89344 ) ) ( not ( = ?auto_89347 ?auto_89345 ) ) ( not ( = ?auto_89347 ?auto_89346 ) ) ( IN-CITY ?auto_89350 ?auto_89348 ) ( IN-CITY ?auto_89343 ?auto_89348 ) ( not ( = ?auto_89343 ?auto_89350 ) ) ( OBJ-AT ?auto_89344 ?auto_89343 ) ( OBJ-AT ?auto_89345 ?auto_89350 ) ( IN-CITY ?auto_89349 ?auto_89348 ) ( not ( = ?auto_89343 ?auto_89349 ) ) ( not ( = ?auto_89350 ?auto_89349 ) ) ( OBJ-AT ?auto_89346 ?auto_89349 ) ( TRUCK-AT ?auto_89351 ?auto_89343 ) ( IN-TRUCK ?auto_89347 ?auto_89351 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_89344 ?auto_89345 ?auto_89343 )
      ( DELIVER-4PKG-VERIFY ?auto_89344 ?auto_89345 ?auto_89346 ?auto_89347 ?auto_89343 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_89435 - OBJ
      ?auto_89436 - OBJ
      ?auto_89437 - OBJ
      ?auto_89438 - OBJ
      ?auto_89434 - LOCATION
    )
    :vars
    (
      ?auto_89441 - LOCATION
      ?auto_89439 - CITY
      ?auto_89440 - LOCATION
      ?auto_89442 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_89436 ?auto_89435 ) ) ( not ( = ?auto_89437 ?auto_89435 ) ) ( not ( = ?auto_89437 ?auto_89436 ) ) ( not ( = ?auto_89438 ?auto_89435 ) ) ( not ( = ?auto_89438 ?auto_89436 ) ) ( not ( = ?auto_89438 ?auto_89437 ) ) ( IN-CITY ?auto_89441 ?auto_89439 ) ( IN-CITY ?auto_89434 ?auto_89439 ) ( not ( = ?auto_89434 ?auto_89441 ) ) ( OBJ-AT ?auto_89436 ?auto_89434 ) ( OBJ-AT ?auto_89438 ?auto_89441 ) ( IN-CITY ?auto_89440 ?auto_89439 ) ( not ( = ?auto_89434 ?auto_89440 ) ) ( not ( = ?auto_89441 ?auto_89440 ) ) ( OBJ-AT ?auto_89437 ?auto_89440 ) ( TRUCK-AT ?auto_89442 ?auto_89434 ) ( IN-TRUCK ?auto_89435 ?auto_89442 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_89436 ?auto_89438 ?auto_89434 )
      ( DELIVER-4PKG-VERIFY ?auto_89435 ?auto_89436 ?auto_89437 ?auto_89438 ?auto_89434 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_89464 - OBJ
      ?auto_89465 - OBJ
      ?auto_89466 - OBJ
      ?auto_89467 - OBJ
      ?auto_89463 - LOCATION
    )
    :vars
    (
      ?auto_89470 - LOCATION
      ?auto_89468 - CITY
      ?auto_89469 - LOCATION
      ?auto_89471 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_89465 ?auto_89464 ) ) ( not ( = ?auto_89466 ?auto_89464 ) ) ( not ( = ?auto_89466 ?auto_89465 ) ) ( not ( = ?auto_89467 ?auto_89464 ) ) ( not ( = ?auto_89467 ?auto_89465 ) ) ( not ( = ?auto_89467 ?auto_89466 ) ) ( IN-CITY ?auto_89470 ?auto_89468 ) ( IN-CITY ?auto_89463 ?auto_89468 ) ( not ( = ?auto_89463 ?auto_89470 ) ) ( OBJ-AT ?auto_89465 ?auto_89463 ) ( OBJ-AT ?auto_89466 ?auto_89470 ) ( IN-CITY ?auto_89469 ?auto_89468 ) ( not ( = ?auto_89463 ?auto_89469 ) ) ( not ( = ?auto_89470 ?auto_89469 ) ) ( OBJ-AT ?auto_89467 ?auto_89469 ) ( TRUCK-AT ?auto_89471 ?auto_89463 ) ( IN-TRUCK ?auto_89464 ?auto_89471 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_89465 ?auto_89466 ?auto_89463 )
      ( DELIVER-4PKG-VERIFY ?auto_89464 ?auto_89465 ?auto_89466 ?auto_89467 ?auto_89463 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_89556 - OBJ
      ?auto_89557 - OBJ
      ?auto_89558 - OBJ
      ?auto_89559 - OBJ
      ?auto_89555 - LOCATION
    )
    :vars
    (
      ?auto_89562 - LOCATION
      ?auto_89560 - CITY
      ?auto_89561 - LOCATION
      ?auto_89563 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_89557 ?auto_89556 ) ) ( not ( = ?auto_89558 ?auto_89556 ) ) ( not ( = ?auto_89558 ?auto_89557 ) ) ( not ( = ?auto_89559 ?auto_89556 ) ) ( not ( = ?auto_89559 ?auto_89557 ) ) ( not ( = ?auto_89559 ?auto_89558 ) ) ( IN-CITY ?auto_89562 ?auto_89560 ) ( IN-CITY ?auto_89555 ?auto_89560 ) ( not ( = ?auto_89555 ?auto_89562 ) ) ( OBJ-AT ?auto_89558 ?auto_89555 ) ( OBJ-AT ?auto_89559 ?auto_89562 ) ( IN-CITY ?auto_89561 ?auto_89560 ) ( not ( = ?auto_89555 ?auto_89561 ) ) ( not ( = ?auto_89562 ?auto_89561 ) ) ( OBJ-AT ?auto_89557 ?auto_89561 ) ( TRUCK-AT ?auto_89563 ?auto_89555 ) ( IN-TRUCK ?auto_89556 ?auto_89563 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_89558 ?auto_89559 ?auto_89555 )
      ( DELIVER-4PKG-VERIFY ?auto_89556 ?auto_89557 ?auto_89558 ?auto_89559 ?auto_89555 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_89585 - OBJ
      ?auto_89586 - OBJ
      ?auto_89587 - OBJ
      ?auto_89588 - OBJ
      ?auto_89584 - LOCATION
    )
    :vars
    (
      ?auto_89591 - LOCATION
      ?auto_89589 - CITY
      ?auto_89590 - LOCATION
      ?auto_89592 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_89586 ?auto_89585 ) ) ( not ( = ?auto_89587 ?auto_89585 ) ) ( not ( = ?auto_89587 ?auto_89586 ) ) ( not ( = ?auto_89588 ?auto_89585 ) ) ( not ( = ?auto_89588 ?auto_89586 ) ) ( not ( = ?auto_89588 ?auto_89587 ) ) ( IN-CITY ?auto_89591 ?auto_89589 ) ( IN-CITY ?auto_89584 ?auto_89589 ) ( not ( = ?auto_89584 ?auto_89591 ) ) ( OBJ-AT ?auto_89588 ?auto_89584 ) ( OBJ-AT ?auto_89587 ?auto_89591 ) ( IN-CITY ?auto_89590 ?auto_89589 ) ( not ( = ?auto_89584 ?auto_89590 ) ) ( not ( = ?auto_89591 ?auto_89590 ) ) ( OBJ-AT ?auto_89586 ?auto_89590 ) ( TRUCK-AT ?auto_89592 ?auto_89584 ) ( IN-TRUCK ?auto_89585 ?auto_89592 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_89588 ?auto_89587 ?auto_89584 )
      ( DELIVER-4PKG-VERIFY ?auto_89585 ?auto_89586 ?auto_89587 ?auto_89588 ?auto_89584 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_89644 - OBJ
      ?auto_89645 - OBJ
      ?auto_89646 - OBJ
      ?auto_89647 - OBJ
      ?auto_89643 - LOCATION
    )
    :vars
    (
      ?auto_89650 - LOCATION
      ?auto_89648 - CITY
      ?auto_89649 - LOCATION
      ?auto_89651 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_89645 ?auto_89644 ) ) ( not ( = ?auto_89646 ?auto_89644 ) ) ( not ( = ?auto_89646 ?auto_89645 ) ) ( not ( = ?auto_89647 ?auto_89644 ) ) ( not ( = ?auto_89647 ?auto_89645 ) ) ( not ( = ?auto_89647 ?auto_89646 ) ) ( IN-CITY ?auto_89650 ?auto_89648 ) ( IN-CITY ?auto_89643 ?auto_89648 ) ( not ( = ?auto_89643 ?auto_89650 ) ) ( OBJ-AT ?auto_89646 ?auto_89643 ) ( OBJ-AT ?auto_89645 ?auto_89650 ) ( IN-CITY ?auto_89649 ?auto_89648 ) ( not ( = ?auto_89643 ?auto_89649 ) ) ( not ( = ?auto_89650 ?auto_89649 ) ) ( OBJ-AT ?auto_89647 ?auto_89649 ) ( TRUCK-AT ?auto_89651 ?auto_89643 ) ( IN-TRUCK ?auto_89644 ?auto_89651 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_89646 ?auto_89645 ?auto_89643 )
      ( DELIVER-4PKG-VERIFY ?auto_89644 ?auto_89645 ?auto_89646 ?auto_89647 ?auto_89643 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_89705 - OBJ
      ?auto_89706 - OBJ
      ?auto_89707 - OBJ
      ?auto_89708 - OBJ
      ?auto_89704 - LOCATION
    )
    :vars
    (
      ?auto_89711 - LOCATION
      ?auto_89709 - CITY
      ?auto_89710 - LOCATION
      ?auto_89712 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_89706 ?auto_89705 ) ) ( not ( = ?auto_89707 ?auto_89705 ) ) ( not ( = ?auto_89707 ?auto_89706 ) ) ( not ( = ?auto_89708 ?auto_89705 ) ) ( not ( = ?auto_89708 ?auto_89706 ) ) ( not ( = ?auto_89708 ?auto_89707 ) ) ( IN-CITY ?auto_89711 ?auto_89709 ) ( IN-CITY ?auto_89704 ?auto_89709 ) ( not ( = ?auto_89704 ?auto_89711 ) ) ( OBJ-AT ?auto_89708 ?auto_89704 ) ( OBJ-AT ?auto_89706 ?auto_89711 ) ( IN-CITY ?auto_89710 ?auto_89709 ) ( not ( = ?auto_89704 ?auto_89710 ) ) ( not ( = ?auto_89711 ?auto_89710 ) ) ( OBJ-AT ?auto_89707 ?auto_89710 ) ( TRUCK-AT ?auto_89712 ?auto_89704 ) ( IN-TRUCK ?auto_89705 ?auto_89712 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_89708 ?auto_89706 ?auto_89704 )
      ( DELIVER-4PKG-VERIFY ?auto_89705 ?auto_89706 ?auto_89707 ?auto_89708 ?auto_89704 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_89796 - OBJ
      ?auto_89797 - OBJ
      ?auto_89798 - OBJ
      ?auto_89799 - OBJ
      ?auto_89795 - LOCATION
    )
    :vars
    (
      ?auto_89802 - LOCATION
      ?auto_89800 - CITY
      ?auto_89801 - LOCATION
      ?auto_89803 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_89797 ?auto_89796 ) ) ( not ( = ?auto_89798 ?auto_89796 ) ) ( not ( = ?auto_89798 ?auto_89797 ) ) ( not ( = ?auto_89799 ?auto_89796 ) ) ( not ( = ?auto_89799 ?auto_89797 ) ) ( not ( = ?auto_89799 ?auto_89798 ) ) ( IN-CITY ?auto_89802 ?auto_89800 ) ( IN-CITY ?auto_89795 ?auto_89800 ) ( not ( = ?auto_89795 ?auto_89802 ) ) ( OBJ-AT ?auto_89797 ?auto_89795 ) ( OBJ-AT ?auto_89799 ?auto_89802 ) ( IN-CITY ?auto_89801 ?auto_89800 ) ( not ( = ?auto_89795 ?auto_89801 ) ) ( not ( = ?auto_89802 ?auto_89801 ) ) ( OBJ-AT ?auto_89796 ?auto_89801 ) ( TRUCK-AT ?auto_89803 ?auto_89795 ) ( IN-TRUCK ?auto_89798 ?auto_89803 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_89797 ?auto_89799 ?auto_89795 )
      ( DELIVER-4PKG-VERIFY ?auto_89796 ?auto_89797 ?auto_89798 ?auto_89799 ?auto_89795 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_89825 - OBJ
      ?auto_89826 - OBJ
      ?auto_89827 - OBJ
      ?auto_89828 - OBJ
      ?auto_89824 - LOCATION
    )
    :vars
    (
      ?auto_89831 - LOCATION
      ?auto_89829 - CITY
      ?auto_89830 - LOCATION
      ?auto_89832 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_89826 ?auto_89825 ) ) ( not ( = ?auto_89827 ?auto_89825 ) ) ( not ( = ?auto_89827 ?auto_89826 ) ) ( not ( = ?auto_89828 ?auto_89825 ) ) ( not ( = ?auto_89828 ?auto_89826 ) ) ( not ( = ?auto_89828 ?auto_89827 ) ) ( IN-CITY ?auto_89831 ?auto_89829 ) ( IN-CITY ?auto_89824 ?auto_89829 ) ( not ( = ?auto_89824 ?auto_89831 ) ) ( OBJ-AT ?auto_89826 ?auto_89824 ) ( OBJ-AT ?auto_89827 ?auto_89831 ) ( IN-CITY ?auto_89830 ?auto_89829 ) ( not ( = ?auto_89824 ?auto_89830 ) ) ( not ( = ?auto_89831 ?auto_89830 ) ) ( OBJ-AT ?auto_89825 ?auto_89830 ) ( TRUCK-AT ?auto_89832 ?auto_89824 ) ( IN-TRUCK ?auto_89828 ?auto_89832 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_89826 ?auto_89827 ?auto_89824 )
      ( DELIVER-4PKG-VERIFY ?auto_89825 ?auto_89826 ?auto_89827 ?auto_89828 ?auto_89824 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_89854 - OBJ
      ?auto_89855 - OBJ
      ?auto_89856 - OBJ
      ?auto_89857 - OBJ
      ?auto_89853 - LOCATION
    )
    :vars
    (
      ?auto_89860 - LOCATION
      ?auto_89858 - CITY
      ?auto_89859 - LOCATION
      ?auto_89861 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_89855 ?auto_89854 ) ) ( not ( = ?auto_89856 ?auto_89854 ) ) ( not ( = ?auto_89856 ?auto_89855 ) ) ( not ( = ?auto_89857 ?auto_89854 ) ) ( not ( = ?auto_89857 ?auto_89855 ) ) ( not ( = ?auto_89857 ?auto_89856 ) ) ( IN-CITY ?auto_89860 ?auto_89858 ) ( IN-CITY ?auto_89853 ?auto_89858 ) ( not ( = ?auto_89853 ?auto_89860 ) ) ( OBJ-AT ?auto_89856 ?auto_89853 ) ( OBJ-AT ?auto_89857 ?auto_89860 ) ( IN-CITY ?auto_89859 ?auto_89858 ) ( not ( = ?auto_89853 ?auto_89859 ) ) ( not ( = ?auto_89860 ?auto_89859 ) ) ( OBJ-AT ?auto_89854 ?auto_89859 ) ( TRUCK-AT ?auto_89861 ?auto_89853 ) ( IN-TRUCK ?auto_89855 ?auto_89861 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_89856 ?auto_89857 ?auto_89853 )
      ( DELIVER-4PKG-VERIFY ?auto_89854 ?auto_89855 ?auto_89856 ?auto_89857 ?auto_89853 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_89883 - OBJ
      ?auto_89884 - OBJ
      ?auto_89885 - OBJ
      ?auto_89886 - OBJ
      ?auto_89882 - LOCATION
    )
    :vars
    (
      ?auto_89889 - LOCATION
      ?auto_89887 - CITY
      ?auto_89888 - LOCATION
      ?auto_89890 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_89884 ?auto_89883 ) ) ( not ( = ?auto_89885 ?auto_89883 ) ) ( not ( = ?auto_89885 ?auto_89884 ) ) ( not ( = ?auto_89886 ?auto_89883 ) ) ( not ( = ?auto_89886 ?auto_89884 ) ) ( not ( = ?auto_89886 ?auto_89885 ) ) ( IN-CITY ?auto_89889 ?auto_89887 ) ( IN-CITY ?auto_89882 ?auto_89887 ) ( not ( = ?auto_89882 ?auto_89889 ) ) ( OBJ-AT ?auto_89886 ?auto_89882 ) ( OBJ-AT ?auto_89885 ?auto_89889 ) ( IN-CITY ?auto_89888 ?auto_89887 ) ( not ( = ?auto_89882 ?auto_89888 ) ) ( not ( = ?auto_89889 ?auto_89888 ) ) ( OBJ-AT ?auto_89883 ?auto_89888 ) ( TRUCK-AT ?auto_89890 ?auto_89882 ) ( IN-TRUCK ?auto_89884 ?auto_89890 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_89886 ?auto_89885 ?auto_89882 )
      ( DELIVER-4PKG-VERIFY ?auto_89883 ?auto_89884 ?auto_89885 ?auto_89886 ?auto_89882 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_90005 - OBJ
      ?auto_90006 - OBJ
      ?auto_90007 - OBJ
      ?auto_90008 - OBJ
      ?auto_90004 - LOCATION
    )
    :vars
    (
      ?auto_90011 - LOCATION
      ?auto_90009 - CITY
      ?auto_90010 - LOCATION
      ?auto_90012 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90006 ?auto_90005 ) ) ( not ( = ?auto_90007 ?auto_90005 ) ) ( not ( = ?auto_90007 ?auto_90006 ) ) ( not ( = ?auto_90008 ?auto_90005 ) ) ( not ( = ?auto_90008 ?auto_90006 ) ) ( not ( = ?auto_90008 ?auto_90007 ) ) ( IN-CITY ?auto_90011 ?auto_90009 ) ( IN-CITY ?auto_90004 ?auto_90009 ) ( not ( = ?auto_90004 ?auto_90011 ) ) ( OBJ-AT ?auto_90007 ?auto_90004 ) ( OBJ-AT ?auto_90006 ?auto_90011 ) ( IN-CITY ?auto_90010 ?auto_90009 ) ( not ( = ?auto_90004 ?auto_90010 ) ) ( not ( = ?auto_90011 ?auto_90010 ) ) ( OBJ-AT ?auto_90005 ?auto_90010 ) ( TRUCK-AT ?auto_90012 ?auto_90004 ) ( IN-TRUCK ?auto_90008 ?auto_90012 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_90007 ?auto_90006 ?auto_90004 )
      ( DELIVER-4PKG-VERIFY ?auto_90005 ?auto_90006 ?auto_90007 ?auto_90008 ?auto_90004 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_90034 - OBJ
      ?auto_90035 - OBJ
      ?auto_90036 - OBJ
      ?auto_90037 - OBJ
      ?auto_90033 - LOCATION
    )
    :vars
    (
      ?auto_90040 - LOCATION
      ?auto_90038 - CITY
      ?auto_90039 - LOCATION
      ?auto_90041 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90035 ?auto_90034 ) ) ( not ( = ?auto_90036 ?auto_90034 ) ) ( not ( = ?auto_90036 ?auto_90035 ) ) ( not ( = ?auto_90037 ?auto_90034 ) ) ( not ( = ?auto_90037 ?auto_90035 ) ) ( not ( = ?auto_90037 ?auto_90036 ) ) ( IN-CITY ?auto_90040 ?auto_90038 ) ( IN-CITY ?auto_90033 ?auto_90038 ) ( not ( = ?auto_90033 ?auto_90040 ) ) ( OBJ-AT ?auto_90037 ?auto_90033 ) ( OBJ-AT ?auto_90035 ?auto_90040 ) ( IN-CITY ?auto_90039 ?auto_90038 ) ( not ( = ?auto_90033 ?auto_90039 ) ) ( not ( = ?auto_90040 ?auto_90039 ) ) ( OBJ-AT ?auto_90034 ?auto_90039 ) ( TRUCK-AT ?auto_90041 ?auto_90033 ) ( IN-TRUCK ?auto_90036 ?auto_90041 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_90037 ?auto_90035 ?auto_90033 )
      ( DELIVER-4PKG-VERIFY ?auto_90034 ?auto_90035 ?auto_90036 ?auto_90037 ?auto_90033 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_90219 - OBJ
      ?auto_90220 - OBJ
      ?auto_90221 - OBJ
      ?auto_90222 - OBJ
      ?auto_90218 - LOCATION
    )
    :vars
    (
      ?auto_90225 - LOCATION
      ?auto_90223 - CITY
      ?auto_90224 - LOCATION
      ?auto_90226 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90220 ?auto_90219 ) ) ( not ( = ?auto_90221 ?auto_90219 ) ) ( not ( = ?auto_90221 ?auto_90220 ) ) ( not ( = ?auto_90222 ?auto_90219 ) ) ( not ( = ?auto_90222 ?auto_90220 ) ) ( not ( = ?auto_90222 ?auto_90221 ) ) ( IN-CITY ?auto_90225 ?auto_90223 ) ( IN-CITY ?auto_90218 ?auto_90223 ) ( not ( = ?auto_90218 ?auto_90225 ) ) ( OBJ-AT ?auto_90220 ?auto_90218 ) ( OBJ-AT ?auto_90219 ?auto_90225 ) ( IN-CITY ?auto_90224 ?auto_90223 ) ( not ( = ?auto_90218 ?auto_90224 ) ) ( not ( = ?auto_90225 ?auto_90224 ) ) ( OBJ-AT ?auto_90222 ?auto_90224 ) ( TRUCK-AT ?auto_90226 ?auto_90218 ) ( IN-TRUCK ?auto_90221 ?auto_90226 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_90220 ?auto_90219 ?auto_90218 )
      ( DELIVER-4PKG-VERIFY ?auto_90219 ?auto_90220 ?auto_90221 ?auto_90222 ?auto_90218 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_90248 - OBJ
      ?auto_90249 - OBJ
      ?auto_90250 - OBJ
      ?auto_90251 - OBJ
      ?auto_90247 - LOCATION
    )
    :vars
    (
      ?auto_90254 - LOCATION
      ?auto_90252 - CITY
      ?auto_90253 - LOCATION
      ?auto_90255 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90249 ?auto_90248 ) ) ( not ( = ?auto_90250 ?auto_90248 ) ) ( not ( = ?auto_90250 ?auto_90249 ) ) ( not ( = ?auto_90251 ?auto_90248 ) ) ( not ( = ?auto_90251 ?auto_90249 ) ) ( not ( = ?auto_90251 ?auto_90250 ) ) ( IN-CITY ?auto_90254 ?auto_90252 ) ( IN-CITY ?auto_90247 ?auto_90252 ) ( not ( = ?auto_90247 ?auto_90254 ) ) ( OBJ-AT ?auto_90249 ?auto_90247 ) ( OBJ-AT ?auto_90248 ?auto_90254 ) ( IN-CITY ?auto_90253 ?auto_90252 ) ( not ( = ?auto_90247 ?auto_90253 ) ) ( not ( = ?auto_90254 ?auto_90253 ) ) ( OBJ-AT ?auto_90250 ?auto_90253 ) ( TRUCK-AT ?auto_90255 ?auto_90247 ) ( IN-TRUCK ?auto_90251 ?auto_90255 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_90249 ?auto_90248 ?auto_90247 )
      ( DELIVER-4PKG-VERIFY ?auto_90248 ?auto_90249 ?auto_90250 ?auto_90251 ?auto_90247 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_90339 - OBJ
      ?auto_90340 - OBJ
      ?auto_90341 - OBJ
      ?auto_90342 - OBJ
      ?auto_90338 - LOCATION
    )
    :vars
    (
      ?auto_90345 - LOCATION
      ?auto_90343 - CITY
      ?auto_90344 - LOCATION
      ?auto_90346 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90340 ?auto_90339 ) ) ( not ( = ?auto_90341 ?auto_90339 ) ) ( not ( = ?auto_90341 ?auto_90340 ) ) ( not ( = ?auto_90342 ?auto_90339 ) ) ( not ( = ?auto_90342 ?auto_90340 ) ) ( not ( = ?auto_90342 ?auto_90341 ) ) ( IN-CITY ?auto_90345 ?auto_90343 ) ( IN-CITY ?auto_90338 ?auto_90343 ) ( not ( = ?auto_90338 ?auto_90345 ) ) ( OBJ-AT ?auto_90341 ?auto_90338 ) ( OBJ-AT ?auto_90339 ?auto_90345 ) ( IN-CITY ?auto_90344 ?auto_90343 ) ( not ( = ?auto_90338 ?auto_90344 ) ) ( not ( = ?auto_90345 ?auto_90344 ) ) ( OBJ-AT ?auto_90342 ?auto_90344 ) ( TRUCK-AT ?auto_90346 ?auto_90338 ) ( IN-TRUCK ?auto_90340 ?auto_90346 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_90341 ?auto_90339 ?auto_90338 )
      ( DELIVER-4PKG-VERIFY ?auto_90339 ?auto_90340 ?auto_90341 ?auto_90342 ?auto_90338 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_90400 - OBJ
      ?auto_90401 - OBJ
      ?auto_90402 - OBJ
      ?auto_90403 - OBJ
      ?auto_90399 - LOCATION
    )
    :vars
    (
      ?auto_90406 - LOCATION
      ?auto_90404 - CITY
      ?auto_90405 - LOCATION
      ?auto_90407 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90401 ?auto_90400 ) ) ( not ( = ?auto_90402 ?auto_90400 ) ) ( not ( = ?auto_90402 ?auto_90401 ) ) ( not ( = ?auto_90403 ?auto_90400 ) ) ( not ( = ?auto_90403 ?auto_90401 ) ) ( not ( = ?auto_90403 ?auto_90402 ) ) ( IN-CITY ?auto_90406 ?auto_90404 ) ( IN-CITY ?auto_90399 ?auto_90404 ) ( not ( = ?auto_90399 ?auto_90406 ) ) ( OBJ-AT ?auto_90403 ?auto_90399 ) ( OBJ-AT ?auto_90400 ?auto_90406 ) ( IN-CITY ?auto_90405 ?auto_90404 ) ( not ( = ?auto_90399 ?auto_90405 ) ) ( not ( = ?auto_90406 ?auto_90405 ) ) ( OBJ-AT ?auto_90402 ?auto_90405 ) ( TRUCK-AT ?auto_90407 ?auto_90399 ) ( IN-TRUCK ?auto_90401 ?auto_90407 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_90403 ?auto_90400 ?auto_90399 )
      ( DELIVER-4PKG-VERIFY ?auto_90400 ?auto_90401 ?auto_90402 ?auto_90403 ?auto_90399 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_90491 - OBJ
      ?auto_90492 - OBJ
      ?auto_90493 - OBJ
      ?auto_90494 - OBJ
      ?auto_90490 - LOCATION
    )
    :vars
    (
      ?auto_90497 - LOCATION
      ?auto_90495 - CITY
      ?auto_90496 - LOCATION
      ?auto_90498 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90492 ?auto_90491 ) ) ( not ( = ?auto_90493 ?auto_90491 ) ) ( not ( = ?auto_90493 ?auto_90492 ) ) ( not ( = ?auto_90494 ?auto_90491 ) ) ( not ( = ?auto_90494 ?auto_90492 ) ) ( not ( = ?auto_90494 ?auto_90493 ) ) ( IN-CITY ?auto_90497 ?auto_90495 ) ( IN-CITY ?auto_90490 ?auto_90495 ) ( not ( = ?auto_90490 ?auto_90497 ) ) ( OBJ-AT ?auto_90493 ?auto_90490 ) ( OBJ-AT ?auto_90491 ?auto_90497 ) ( IN-CITY ?auto_90496 ?auto_90495 ) ( not ( = ?auto_90490 ?auto_90496 ) ) ( not ( = ?auto_90497 ?auto_90496 ) ) ( OBJ-AT ?auto_90492 ?auto_90496 ) ( TRUCK-AT ?auto_90498 ?auto_90490 ) ( IN-TRUCK ?auto_90494 ?auto_90498 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_90493 ?auto_90491 ?auto_90490 )
      ( DELIVER-4PKG-VERIFY ?auto_90491 ?auto_90492 ?auto_90493 ?auto_90494 ?auto_90490 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_90520 - OBJ
      ?auto_90521 - OBJ
      ?auto_90522 - OBJ
      ?auto_90523 - OBJ
      ?auto_90519 - LOCATION
    )
    :vars
    (
      ?auto_90526 - LOCATION
      ?auto_90524 - CITY
      ?auto_90525 - LOCATION
      ?auto_90527 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90521 ?auto_90520 ) ) ( not ( = ?auto_90522 ?auto_90520 ) ) ( not ( = ?auto_90522 ?auto_90521 ) ) ( not ( = ?auto_90523 ?auto_90520 ) ) ( not ( = ?auto_90523 ?auto_90521 ) ) ( not ( = ?auto_90523 ?auto_90522 ) ) ( IN-CITY ?auto_90526 ?auto_90524 ) ( IN-CITY ?auto_90519 ?auto_90524 ) ( not ( = ?auto_90519 ?auto_90526 ) ) ( OBJ-AT ?auto_90523 ?auto_90519 ) ( OBJ-AT ?auto_90520 ?auto_90526 ) ( IN-CITY ?auto_90525 ?auto_90524 ) ( not ( = ?auto_90519 ?auto_90525 ) ) ( not ( = ?auto_90526 ?auto_90525 ) ) ( OBJ-AT ?auto_90521 ?auto_90525 ) ( TRUCK-AT ?auto_90527 ?auto_90519 ) ( IN-TRUCK ?auto_90522 ?auto_90527 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_90523 ?auto_90520 ?auto_90519 )
      ( DELIVER-4PKG-VERIFY ?auto_90520 ?auto_90521 ?auto_90522 ?auto_90523 ?auto_90519 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_90814 - OBJ
      ?auto_90813 - LOCATION
    )
    :vars
    (
      ?auto_90821 - OBJ
      ?auto_90819 - LOCATION
      ?auto_90816 - CITY
      ?auto_90818 - OBJ
      ?auto_90817 - LOCATION
      ?auto_90815 - OBJ
      ?auto_90820 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90814 ?auto_90821 ) ) ( IN-CITY ?auto_90819 ?auto_90816 ) ( IN-CITY ?auto_90813 ?auto_90816 ) ( not ( = ?auto_90813 ?auto_90819 ) ) ( OBJ-AT ?auto_90821 ?auto_90813 ) ( OBJ-AT ?auto_90814 ?auto_90819 ) ( not ( = ?auto_90818 ?auto_90821 ) ) ( not ( = ?auto_90814 ?auto_90818 ) ) ( IN-CITY ?auto_90817 ?auto_90816 ) ( not ( = ?auto_90813 ?auto_90817 ) ) ( not ( = ?auto_90819 ?auto_90817 ) ) ( OBJ-AT ?auto_90818 ?auto_90817 ) ( not ( = ?auto_90815 ?auto_90821 ) ) ( IN-TRUCK ?auto_90815 ?auto_90820 ) ( not ( = ?auto_90814 ?auto_90815 ) ) ( not ( = ?auto_90818 ?auto_90815 ) ) ( TRUCK-AT ?auto_90820 ?auto_90819 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_90820 ?auto_90819 ?auto_90813 ?auto_90816 )
      ( DELIVER-2PKG ?auto_90821 ?auto_90814 ?auto_90813 )
      ( DELIVER-1PKG-VERIFY ?auto_90814 ?auto_90813 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_90823 - OBJ
      ?auto_90824 - OBJ
      ?auto_90822 - LOCATION
    )
    :vars
    (
      ?auto_90828 - LOCATION
      ?auto_90830 - CITY
      ?auto_90826 - OBJ
      ?auto_90829 - LOCATION
      ?auto_90825 - OBJ
      ?auto_90827 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90824 ?auto_90823 ) ) ( IN-CITY ?auto_90828 ?auto_90830 ) ( IN-CITY ?auto_90822 ?auto_90830 ) ( not ( = ?auto_90822 ?auto_90828 ) ) ( OBJ-AT ?auto_90823 ?auto_90822 ) ( OBJ-AT ?auto_90824 ?auto_90828 ) ( not ( = ?auto_90826 ?auto_90823 ) ) ( not ( = ?auto_90824 ?auto_90826 ) ) ( IN-CITY ?auto_90829 ?auto_90830 ) ( not ( = ?auto_90822 ?auto_90829 ) ) ( not ( = ?auto_90828 ?auto_90829 ) ) ( OBJ-AT ?auto_90826 ?auto_90829 ) ( not ( = ?auto_90825 ?auto_90823 ) ) ( IN-TRUCK ?auto_90825 ?auto_90827 ) ( not ( = ?auto_90824 ?auto_90825 ) ) ( not ( = ?auto_90826 ?auto_90825 ) ) ( TRUCK-AT ?auto_90827 ?auto_90828 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_90824 ?auto_90822 )
      ( DELIVER-2PKG-VERIFY ?auto_90823 ?auto_90824 ?auto_90822 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_90832 - OBJ
      ?auto_90833 - OBJ
      ?auto_90831 - LOCATION
    )
    :vars
    (
      ?auto_90839 - OBJ
      ?auto_90838 - LOCATION
      ?auto_90834 - CITY
      ?auto_90837 - OBJ
      ?auto_90836 - LOCATION
      ?auto_90835 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90833 ?auto_90832 ) ) ( not ( = ?auto_90833 ?auto_90839 ) ) ( IN-CITY ?auto_90838 ?auto_90834 ) ( IN-CITY ?auto_90831 ?auto_90834 ) ( not ( = ?auto_90831 ?auto_90838 ) ) ( OBJ-AT ?auto_90839 ?auto_90831 ) ( OBJ-AT ?auto_90833 ?auto_90838 ) ( not ( = ?auto_90837 ?auto_90839 ) ) ( not ( = ?auto_90833 ?auto_90837 ) ) ( IN-CITY ?auto_90836 ?auto_90834 ) ( not ( = ?auto_90831 ?auto_90836 ) ) ( not ( = ?auto_90838 ?auto_90836 ) ) ( OBJ-AT ?auto_90837 ?auto_90836 ) ( not ( = ?auto_90832 ?auto_90839 ) ) ( IN-TRUCK ?auto_90832 ?auto_90835 ) ( not ( = ?auto_90837 ?auto_90832 ) ) ( TRUCK-AT ?auto_90835 ?auto_90838 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_90839 ?auto_90833 ?auto_90831 )
      ( DELIVER-2PKG-VERIFY ?auto_90832 ?auto_90833 ?auto_90831 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_90841 - OBJ
      ?auto_90842 - OBJ
      ?auto_90840 - LOCATION
    )
    :vars
    (
      ?auto_90848 - OBJ
      ?auto_90846 - LOCATION
      ?auto_90843 - CITY
      ?auto_90845 - LOCATION
      ?auto_90847 - OBJ
      ?auto_90844 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90842 ?auto_90841 ) ) ( not ( = ?auto_90842 ?auto_90848 ) ) ( IN-CITY ?auto_90846 ?auto_90843 ) ( IN-CITY ?auto_90840 ?auto_90843 ) ( not ( = ?auto_90840 ?auto_90846 ) ) ( OBJ-AT ?auto_90848 ?auto_90840 ) ( OBJ-AT ?auto_90842 ?auto_90846 ) ( not ( = ?auto_90841 ?auto_90848 ) ) ( IN-CITY ?auto_90845 ?auto_90843 ) ( not ( = ?auto_90840 ?auto_90845 ) ) ( not ( = ?auto_90846 ?auto_90845 ) ) ( OBJ-AT ?auto_90841 ?auto_90845 ) ( not ( = ?auto_90847 ?auto_90848 ) ) ( IN-TRUCK ?auto_90847 ?auto_90844 ) ( not ( = ?auto_90842 ?auto_90847 ) ) ( not ( = ?auto_90841 ?auto_90847 ) ) ( TRUCK-AT ?auto_90844 ?auto_90846 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_90848 ?auto_90842 ?auto_90840 )
      ( DELIVER-2PKG-VERIFY ?auto_90841 ?auto_90842 ?auto_90840 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_90850 - OBJ
      ?auto_90851 - OBJ
      ?auto_90849 - LOCATION
    )
    :vars
    (
      ?auto_90856 - LOCATION
      ?auto_90852 - CITY
      ?auto_90855 - OBJ
      ?auto_90854 - LOCATION
      ?auto_90857 - OBJ
      ?auto_90853 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90851 ?auto_90850 ) ) ( IN-CITY ?auto_90856 ?auto_90852 ) ( IN-CITY ?auto_90849 ?auto_90852 ) ( not ( = ?auto_90849 ?auto_90856 ) ) ( OBJ-AT ?auto_90851 ?auto_90849 ) ( OBJ-AT ?auto_90850 ?auto_90856 ) ( not ( = ?auto_90855 ?auto_90851 ) ) ( not ( = ?auto_90850 ?auto_90855 ) ) ( IN-CITY ?auto_90854 ?auto_90852 ) ( not ( = ?auto_90849 ?auto_90854 ) ) ( not ( = ?auto_90856 ?auto_90854 ) ) ( OBJ-AT ?auto_90855 ?auto_90854 ) ( not ( = ?auto_90857 ?auto_90851 ) ) ( IN-TRUCK ?auto_90857 ?auto_90853 ) ( not ( = ?auto_90850 ?auto_90857 ) ) ( not ( = ?auto_90855 ?auto_90857 ) ) ( TRUCK-AT ?auto_90853 ?auto_90856 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_90851 ?auto_90850 ?auto_90849 )
      ( DELIVER-2PKG-VERIFY ?auto_90850 ?auto_90851 ?auto_90849 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_90859 - OBJ
      ?auto_90860 - OBJ
      ?auto_90858 - LOCATION
    )
    :vars
    (
      ?auto_90866 - OBJ
      ?auto_90865 - LOCATION
      ?auto_90861 - CITY
      ?auto_90864 - OBJ
      ?auto_90863 - LOCATION
      ?auto_90862 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90860 ?auto_90859 ) ) ( not ( = ?auto_90859 ?auto_90866 ) ) ( IN-CITY ?auto_90865 ?auto_90861 ) ( IN-CITY ?auto_90858 ?auto_90861 ) ( not ( = ?auto_90858 ?auto_90865 ) ) ( OBJ-AT ?auto_90866 ?auto_90858 ) ( OBJ-AT ?auto_90859 ?auto_90865 ) ( not ( = ?auto_90864 ?auto_90866 ) ) ( not ( = ?auto_90859 ?auto_90864 ) ) ( IN-CITY ?auto_90863 ?auto_90861 ) ( not ( = ?auto_90858 ?auto_90863 ) ) ( not ( = ?auto_90865 ?auto_90863 ) ) ( OBJ-AT ?auto_90864 ?auto_90863 ) ( not ( = ?auto_90860 ?auto_90866 ) ) ( IN-TRUCK ?auto_90860 ?auto_90862 ) ( not ( = ?auto_90864 ?auto_90860 ) ) ( TRUCK-AT ?auto_90862 ?auto_90865 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_90866 ?auto_90859 ?auto_90858 )
      ( DELIVER-2PKG-VERIFY ?auto_90859 ?auto_90860 ?auto_90858 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_90868 - OBJ
      ?auto_90869 - OBJ
      ?auto_90867 - LOCATION
    )
    :vars
    (
      ?auto_90875 - OBJ
      ?auto_90873 - LOCATION
      ?auto_90870 - CITY
      ?auto_90872 - LOCATION
      ?auto_90874 - OBJ
      ?auto_90871 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90869 ?auto_90868 ) ) ( not ( = ?auto_90868 ?auto_90875 ) ) ( IN-CITY ?auto_90873 ?auto_90870 ) ( IN-CITY ?auto_90867 ?auto_90870 ) ( not ( = ?auto_90867 ?auto_90873 ) ) ( OBJ-AT ?auto_90875 ?auto_90867 ) ( OBJ-AT ?auto_90868 ?auto_90873 ) ( not ( = ?auto_90869 ?auto_90875 ) ) ( IN-CITY ?auto_90872 ?auto_90870 ) ( not ( = ?auto_90867 ?auto_90872 ) ) ( not ( = ?auto_90873 ?auto_90872 ) ) ( OBJ-AT ?auto_90869 ?auto_90872 ) ( not ( = ?auto_90874 ?auto_90875 ) ) ( IN-TRUCK ?auto_90874 ?auto_90871 ) ( not ( = ?auto_90868 ?auto_90874 ) ) ( not ( = ?auto_90869 ?auto_90874 ) ) ( TRUCK-AT ?auto_90871 ?auto_90873 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_90875 ?auto_90868 ?auto_90867 )
      ( DELIVER-2PKG-VERIFY ?auto_90868 ?auto_90869 ?auto_90867 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_90897 - OBJ
      ?auto_90898 - OBJ
      ?auto_90899 - OBJ
      ?auto_90896 - LOCATION
    )
    :vars
    (
      ?auto_90904 - LOCATION
      ?auto_90900 - CITY
      ?auto_90903 - OBJ
      ?auto_90902 - LOCATION
      ?auto_90901 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90898 ?auto_90897 ) ) ( not ( = ?auto_90899 ?auto_90897 ) ) ( not ( = ?auto_90899 ?auto_90898 ) ) ( IN-CITY ?auto_90904 ?auto_90900 ) ( IN-CITY ?auto_90896 ?auto_90900 ) ( not ( = ?auto_90896 ?auto_90904 ) ) ( OBJ-AT ?auto_90897 ?auto_90896 ) ( OBJ-AT ?auto_90899 ?auto_90904 ) ( not ( = ?auto_90903 ?auto_90897 ) ) ( not ( = ?auto_90899 ?auto_90903 ) ) ( IN-CITY ?auto_90902 ?auto_90900 ) ( not ( = ?auto_90896 ?auto_90902 ) ) ( not ( = ?auto_90904 ?auto_90902 ) ) ( OBJ-AT ?auto_90903 ?auto_90902 ) ( IN-TRUCK ?auto_90898 ?auto_90901 ) ( not ( = ?auto_90903 ?auto_90898 ) ) ( TRUCK-AT ?auto_90901 ?auto_90904 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_90897 ?auto_90899 ?auto_90896 )
      ( DELIVER-3PKG-VERIFY ?auto_90897 ?auto_90898 ?auto_90899 ?auto_90896 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_90906 - OBJ
      ?auto_90907 - OBJ
      ?auto_90908 - OBJ
      ?auto_90905 - LOCATION
    )
    :vars
    (
      ?auto_90912 - LOCATION
      ?auto_90909 - CITY
      ?auto_90911 - LOCATION
      ?auto_90913 - OBJ
      ?auto_90910 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90907 ?auto_90906 ) ) ( not ( = ?auto_90908 ?auto_90906 ) ) ( not ( = ?auto_90908 ?auto_90907 ) ) ( IN-CITY ?auto_90912 ?auto_90909 ) ( IN-CITY ?auto_90905 ?auto_90909 ) ( not ( = ?auto_90905 ?auto_90912 ) ) ( OBJ-AT ?auto_90906 ?auto_90905 ) ( OBJ-AT ?auto_90908 ?auto_90912 ) ( IN-CITY ?auto_90911 ?auto_90909 ) ( not ( = ?auto_90905 ?auto_90911 ) ) ( not ( = ?auto_90912 ?auto_90911 ) ) ( OBJ-AT ?auto_90907 ?auto_90911 ) ( not ( = ?auto_90913 ?auto_90906 ) ) ( IN-TRUCK ?auto_90913 ?auto_90910 ) ( not ( = ?auto_90908 ?auto_90913 ) ) ( not ( = ?auto_90907 ?auto_90913 ) ) ( TRUCK-AT ?auto_90910 ?auto_90912 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_90906 ?auto_90908 ?auto_90905 )
      ( DELIVER-3PKG-VERIFY ?auto_90906 ?auto_90907 ?auto_90908 ?auto_90905 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_90925 - OBJ
      ?auto_90926 - OBJ
      ?auto_90927 - OBJ
      ?auto_90924 - LOCATION
    )
    :vars
    (
      ?auto_90932 - LOCATION
      ?auto_90928 - CITY
      ?auto_90931 - OBJ
      ?auto_90930 - LOCATION
      ?auto_90929 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90926 ?auto_90925 ) ) ( not ( = ?auto_90927 ?auto_90925 ) ) ( not ( = ?auto_90927 ?auto_90926 ) ) ( IN-CITY ?auto_90932 ?auto_90928 ) ( IN-CITY ?auto_90924 ?auto_90928 ) ( not ( = ?auto_90924 ?auto_90932 ) ) ( OBJ-AT ?auto_90925 ?auto_90924 ) ( OBJ-AT ?auto_90926 ?auto_90932 ) ( not ( = ?auto_90931 ?auto_90925 ) ) ( not ( = ?auto_90926 ?auto_90931 ) ) ( IN-CITY ?auto_90930 ?auto_90928 ) ( not ( = ?auto_90924 ?auto_90930 ) ) ( not ( = ?auto_90932 ?auto_90930 ) ) ( OBJ-AT ?auto_90931 ?auto_90930 ) ( IN-TRUCK ?auto_90927 ?auto_90929 ) ( not ( = ?auto_90931 ?auto_90927 ) ) ( TRUCK-AT ?auto_90929 ?auto_90932 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_90925 ?auto_90926 ?auto_90924 )
      ( DELIVER-3PKG-VERIFY ?auto_90925 ?auto_90926 ?auto_90927 ?auto_90924 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_90934 - OBJ
      ?auto_90935 - OBJ
      ?auto_90936 - OBJ
      ?auto_90933 - LOCATION
    )
    :vars
    (
      ?auto_90940 - LOCATION
      ?auto_90937 - CITY
      ?auto_90939 - LOCATION
      ?auto_90941 - OBJ
      ?auto_90938 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90935 ?auto_90934 ) ) ( not ( = ?auto_90936 ?auto_90934 ) ) ( not ( = ?auto_90936 ?auto_90935 ) ) ( IN-CITY ?auto_90940 ?auto_90937 ) ( IN-CITY ?auto_90933 ?auto_90937 ) ( not ( = ?auto_90933 ?auto_90940 ) ) ( OBJ-AT ?auto_90934 ?auto_90933 ) ( OBJ-AT ?auto_90935 ?auto_90940 ) ( IN-CITY ?auto_90939 ?auto_90937 ) ( not ( = ?auto_90933 ?auto_90939 ) ) ( not ( = ?auto_90940 ?auto_90939 ) ) ( OBJ-AT ?auto_90936 ?auto_90939 ) ( not ( = ?auto_90941 ?auto_90934 ) ) ( IN-TRUCK ?auto_90941 ?auto_90938 ) ( not ( = ?auto_90935 ?auto_90941 ) ) ( not ( = ?auto_90936 ?auto_90941 ) ) ( TRUCK-AT ?auto_90938 ?auto_90940 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_90934 ?auto_90935 ?auto_90933 )
      ( DELIVER-3PKG-VERIFY ?auto_90934 ?auto_90935 ?auto_90936 ?auto_90933 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_90953 - OBJ
      ?auto_90954 - OBJ
      ?auto_90955 - OBJ
      ?auto_90952 - LOCATION
    )
    :vars
    (
      ?auto_90960 - LOCATION
      ?auto_90956 - CITY
      ?auto_90959 - OBJ
      ?auto_90958 - LOCATION
      ?auto_90957 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90954 ?auto_90953 ) ) ( not ( = ?auto_90955 ?auto_90953 ) ) ( not ( = ?auto_90955 ?auto_90954 ) ) ( IN-CITY ?auto_90960 ?auto_90956 ) ( IN-CITY ?auto_90952 ?auto_90956 ) ( not ( = ?auto_90952 ?auto_90960 ) ) ( OBJ-AT ?auto_90954 ?auto_90952 ) ( OBJ-AT ?auto_90955 ?auto_90960 ) ( not ( = ?auto_90959 ?auto_90954 ) ) ( not ( = ?auto_90955 ?auto_90959 ) ) ( IN-CITY ?auto_90958 ?auto_90956 ) ( not ( = ?auto_90952 ?auto_90958 ) ) ( not ( = ?auto_90960 ?auto_90958 ) ) ( OBJ-AT ?auto_90959 ?auto_90958 ) ( IN-TRUCK ?auto_90953 ?auto_90957 ) ( not ( = ?auto_90959 ?auto_90953 ) ) ( TRUCK-AT ?auto_90957 ?auto_90960 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_90954 ?auto_90955 ?auto_90952 )
      ( DELIVER-3PKG-VERIFY ?auto_90953 ?auto_90954 ?auto_90955 ?auto_90952 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_90972 - OBJ
      ?auto_90973 - OBJ
      ?auto_90974 - OBJ
      ?auto_90971 - LOCATION
    )
    :vars
    (
      ?auto_90979 - OBJ
      ?auto_90978 - LOCATION
      ?auto_90975 - CITY
      ?auto_90977 - LOCATION
      ?auto_90976 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90973 ?auto_90972 ) ) ( not ( = ?auto_90974 ?auto_90972 ) ) ( not ( = ?auto_90974 ?auto_90973 ) ) ( not ( = ?auto_90974 ?auto_90979 ) ) ( IN-CITY ?auto_90978 ?auto_90975 ) ( IN-CITY ?auto_90971 ?auto_90975 ) ( not ( = ?auto_90971 ?auto_90978 ) ) ( OBJ-AT ?auto_90979 ?auto_90971 ) ( OBJ-AT ?auto_90974 ?auto_90978 ) ( not ( = ?auto_90973 ?auto_90979 ) ) ( IN-CITY ?auto_90977 ?auto_90975 ) ( not ( = ?auto_90971 ?auto_90977 ) ) ( not ( = ?auto_90978 ?auto_90977 ) ) ( OBJ-AT ?auto_90973 ?auto_90977 ) ( not ( = ?auto_90972 ?auto_90979 ) ) ( IN-TRUCK ?auto_90972 ?auto_90976 ) ( TRUCK-AT ?auto_90976 ?auto_90978 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_90979 ?auto_90974 ?auto_90971 )
      ( DELIVER-3PKG-VERIFY ?auto_90972 ?auto_90973 ?auto_90974 ?auto_90971 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_90981 - OBJ
      ?auto_90982 - OBJ
      ?auto_90983 - OBJ
      ?auto_90980 - LOCATION
    )
    :vars
    (
      ?auto_90988 - LOCATION
      ?auto_90984 - CITY
      ?auto_90987 - OBJ
      ?auto_90986 - LOCATION
      ?auto_90985 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_90982 ?auto_90981 ) ) ( not ( = ?auto_90983 ?auto_90981 ) ) ( not ( = ?auto_90983 ?auto_90982 ) ) ( IN-CITY ?auto_90988 ?auto_90984 ) ( IN-CITY ?auto_90980 ?auto_90984 ) ( not ( = ?auto_90980 ?auto_90988 ) ) ( OBJ-AT ?auto_90983 ?auto_90980 ) ( OBJ-AT ?auto_90982 ?auto_90988 ) ( not ( = ?auto_90987 ?auto_90983 ) ) ( not ( = ?auto_90982 ?auto_90987 ) ) ( IN-CITY ?auto_90986 ?auto_90984 ) ( not ( = ?auto_90980 ?auto_90986 ) ) ( not ( = ?auto_90988 ?auto_90986 ) ) ( OBJ-AT ?auto_90987 ?auto_90986 ) ( IN-TRUCK ?auto_90981 ?auto_90985 ) ( not ( = ?auto_90987 ?auto_90981 ) ) ( TRUCK-AT ?auto_90985 ?auto_90988 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_90983 ?auto_90982 ?auto_90980 )
      ( DELIVER-3PKG-VERIFY ?auto_90981 ?auto_90982 ?auto_90983 ?auto_90980 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_91000 - OBJ
      ?auto_91001 - OBJ
      ?auto_91002 - OBJ
      ?auto_90999 - LOCATION
    )
    :vars
    (
      ?auto_91007 - OBJ
      ?auto_91006 - LOCATION
      ?auto_91003 - CITY
      ?auto_91005 - LOCATION
      ?auto_91004 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91001 ?auto_91000 ) ) ( not ( = ?auto_91002 ?auto_91000 ) ) ( not ( = ?auto_91002 ?auto_91001 ) ) ( not ( = ?auto_91001 ?auto_91007 ) ) ( IN-CITY ?auto_91006 ?auto_91003 ) ( IN-CITY ?auto_90999 ?auto_91003 ) ( not ( = ?auto_90999 ?auto_91006 ) ) ( OBJ-AT ?auto_91007 ?auto_90999 ) ( OBJ-AT ?auto_91001 ?auto_91006 ) ( not ( = ?auto_91002 ?auto_91007 ) ) ( IN-CITY ?auto_91005 ?auto_91003 ) ( not ( = ?auto_90999 ?auto_91005 ) ) ( not ( = ?auto_91006 ?auto_91005 ) ) ( OBJ-AT ?auto_91002 ?auto_91005 ) ( not ( = ?auto_91000 ?auto_91007 ) ) ( IN-TRUCK ?auto_91000 ?auto_91004 ) ( TRUCK-AT ?auto_91004 ?auto_91006 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91007 ?auto_91001 ?auto_90999 )
      ( DELIVER-3PKG-VERIFY ?auto_91000 ?auto_91001 ?auto_91002 ?auto_90999 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_91019 - OBJ
      ?auto_91020 - OBJ
      ?auto_91021 - OBJ
      ?auto_91018 - LOCATION
    )
    :vars
    (
      ?auto_91025 - LOCATION
      ?auto_91022 - CITY
      ?auto_91024 - LOCATION
      ?auto_91026 - OBJ
      ?auto_91023 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91020 ?auto_91019 ) ) ( not ( = ?auto_91021 ?auto_91019 ) ) ( not ( = ?auto_91021 ?auto_91020 ) ) ( IN-CITY ?auto_91025 ?auto_91022 ) ( IN-CITY ?auto_91018 ?auto_91022 ) ( not ( = ?auto_91018 ?auto_91025 ) ) ( OBJ-AT ?auto_91020 ?auto_91018 ) ( OBJ-AT ?auto_91021 ?auto_91025 ) ( IN-CITY ?auto_91024 ?auto_91022 ) ( not ( = ?auto_91018 ?auto_91024 ) ) ( not ( = ?auto_91025 ?auto_91024 ) ) ( OBJ-AT ?auto_91019 ?auto_91024 ) ( not ( = ?auto_91026 ?auto_91020 ) ) ( IN-TRUCK ?auto_91026 ?auto_91023 ) ( not ( = ?auto_91021 ?auto_91026 ) ) ( not ( = ?auto_91019 ?auto_91026 ) ) ( TRUCK-AT ?auto_91023 ?auto_91025 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91020 ?auto_91021 ?auto_91018 )
      ( DELIVER-3PKG-VERIFY ?auto_91019 ?auto_91020 ?auto_91021 ?auto_91018 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_91028 - OBJ
      ?auto_91029 - OBJ
      ?auto_91030 - OBJ
      ?auto_91027 - LOCATION
    )
    :vars
    (
      ?auto_91035 - OBJ
      ?auto_91034 - LOCATION
      ?auto_91031 - CITY
      ?auto_91033 - LOCATION
      ?auto_91032 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91029 ?auto_91028 ) ) ( not ( = ?auto_91030 ?auto_91028 ) ) ( not ( = ?auto_91030 ?auto_91029 ) ) ( not ( = ?auto_91030 ?auto_91035 ) ) ( IN-CITY ?auto_91034 ?auto_91031 ) ( IN-CITY ?auto_91027 ?auto_91031 ) ( not ( = ?auto_91027 ?auto_91034 ) ) ( OBJ-AT ?auto_91035 ?auto_91027 ) ( OBJ-AT ?auto_91030 ?auto_91034 ) ( not ( = ?auto_91028 ?auto_91035 ) ) ( IN-CITY ?auto_91033 ?auto_91031 ) ( not ( = ?auto_91027 ?auto_91033 ) ) ( not ( = ?auto_91034 ?auto_91033 ) ) ( OBJ-AT ?auto_91028 ?auto_91033 ) ( not ( = ?auto_91029 ?auto_91035 ) ) ( IN-TRUCK ?auto_91029 ?auto_91032 ) ( TRUCK-AT ?auto_91032 ?auto_91034 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91035 ?auto_91030 ?auto_91027 )
      ( DELIVER-3PKG-VERIFY ?auto_91028 ?auto_91029 ?auto_91030 ?auto_91027 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_91047 - OBJ
      ?auto_91048 - OBJ
      ?auto_91049 - OBJ
      ?auto_91046 - LOCATION
    )
    :vars
    (
      ?auto_91053 - LOCATION
      ?auto_91050 - CITY
      ?auto_91052 - LOCATION
      ?auto_91054 - OBJ
      ?auto_91051 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91048 ?auto_91047 ) ) ( not ( = ?auto_91049 ?auto_91047 ) ) ( not ( = ?auto_91049 ?auto_91048 ) ) ( IN-CITY ?auto_91053 ?auto_91050 ) ( IN-CITY ?auto_91046 ?auto_91050 ) ( not ( = ?auto_91046 ?auto_91053 ) ) ( OBJ-AT ?auto_91049 ?auto_91046 ) ( OBJ-AT ?auto_91048 ?auto_91053 ) ( IN-CITY ?auto_91052 ?auto_91050 ) ( not ( = ?auto_91046 ?auto_91052 ) ) ( not ( = ?auto_91053 ?auto_91052 ) ) ( OBJ-AT ?auto_91047 ?auto_91052 ) ( not ( = ?auto_91054 ?auto_91049 ) ) ( IN-TRUCK ?auto_91054 ?auto_91051 ) ( not ( = ?auto_91048 ?auto_91054 ) ) ( not ( = ?auto_91047 ?auto_91054 ) ) ( TRUCK-AT ?auto_91051 ?auto_91053 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91049 ?auto_91048 ?auto_91046 )
      ( DELIVER-3PKG-VERIFY ?auto_91047 ?auto_91048 ?auto_91049 ?auto_91046 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_91056 - OBJ
      ?auto_91057 - OBJ
      ?auto_91058 - OBJ
      ?auto_91055 - LOCATION
    )
    :vars
    (
      ?auto_91063 - OBJ
      ?auto_91062 - LOCATION
      ?auto_91059 - CITY
      ?auto_91061 - LOCATION
      ?auto_91060 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91057 ?auto_91056 ) ) ( not ( = ?auto_91058 ?auto_91056 ) ) ( not ( = ?auto_91058 ?auto_91057 ) ) ( not ( = ?auto_91057 ?auto_91063 ) ) ( IN-CITY ?auto_91062 ?auto_91059 ) ( IN-CITY ?auto_91055 ?auto_91059 ) ( not ( = ?auto_91055 ?auto_91062 ) ) ( OBJ-AT ?auto_91063 ?auto_91055 ) ( OBJ-AT ?auto_91057 ?auto_91062 ) ( not ( = ?auto_91056 ?auto_91063 ) ) ( IN-CITY ?auto_91061 ?auto_91059 ) ( not ( = ?auto_91055 ?auto_91061 ) ) ( not ( = ?auto_91062 ?auto_91061 ) ) ( OBJ-AT ?auto_91056 ?auto_91061 ) ( not ( = ?auto_91058 ?auto_91063 ) ) ( IN-TRUCK ?auto_91058 ?auto_91060 ) ( TRUCK-AT ?auto_91060 ?auto_91062 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91063 ?auto_91057 ?auto_91055 )
      ( DELIVER-3PKG-VERIFY ?auto_91056 ?auto_91057 ?auto_91058 ?auto_91055 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_91095 - OBJ
      ?auto_91096 - OBJ
      ?auto_91097 - OBJ
      ?auto_91094 - LOCATION
    )
    :vars
    (
      ?auto_91102 - LOCATION
      ?auto_91098 - CITY
      ?auto_91101 - OBJ
      ?auto_91100 - LOCATION
      ?auto_91099 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91096 ?auto_91095 ) ) ( not ( = ?auto_91097 ?auto_91095 ) ) ( not ( = ?auto_91097 ?auto_91096 ) ) ( IN-CITY ?auto_91102 ?auto_91098 ) ( IN-CITY ?auto_91094 ?auto_91098 ) ( not ( = ?auto_91094 ?auto_91102 ) ) ( OBJ-AT ?auto_91096 ?auto_91094 ) ( OBJ-AT ?auto_91095 ?auto_91102 ) ( not ( = ?auto_91101 ?auto_91096 ) ) ( not ( = ?auto_91095 ?auto_91101 ) ) ( IN-CITY ?auto_91100 ?auto_91098 ) ( not ( = ?auto_91094 ?auto_91100 ) ) ( not ( = ?auto_91102 ?auto_91100 ) ) ( OBJ-AT ?auto_91101 ?auto_91100 ) ( IN-TRUCK ?auto_91097 ?auto_91099 ) ( not ( = ?auto_91101 ?auto_91097 ) ) ( TRUCK-AT ?auto_91099 ?auto_91102 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91096 ?auto_91095 ?auto_91094 )
      ( DELIVER-3PKG-VERIFY ?auto_91095 ?auto_91096 ?auto_91097 ?auto_91094 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_91104 - OBJ
      ?auto_91105 - OBJ
      ?auto_91106 - OBJ
      ?auto_91103 - LOCATION
    )
    :vars
    (
      ?auto_91110 - LOCATION
      ?auto_91107 - CITY
      ?auto_91109 - LOCATION
      ?auto_91111 - OBJ
      ?auto_91108 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91105 ?auto_91104 ) ) ( not ( = ?auto_91106 ?auto_91104 ) ) ( not ( = ?auto_91106 ?auto_91105 ) ) ( IN-CITY ?auto_91110 ?auto_91107 ) ( IN-CITY ?auto_91103 ?auto_91107 ) ( not ( = ?auto_91103 ?auto_91110 ) ) ( OBJ-AT ?auto_91105 ?auto_91103 ) ( OBJ-AT ?auto_91104 ?auto_91110 ) ( IN-CITY ?auto_91109 ?auto_91107 ) ( not ( = ?auto_91103 ?auto_91109 ) ) ( not ( = ?auto_91110 ?auto_91109 ) ) ( OBJ-AT ?auto_91106 ?auto_91109 ) ( not ( = ?auto_91111 ?auto_91105 ) ) ( IN-TRUCK ?auto_91111 ?auto_91108 ) ( not ( = ?auto_91104 ?auto_91111 ) ) ( not ( = ?auto_91106 ?auto_91111 ) ) ( TRUCK-AT ?auto_91108 ?auto_91110 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91105 ?auto_91104 ?auto_91103 )
      ( DELIVER-3PKG-VERIFY ?auto_91104 ?auto_91105 ?auto_91106 ?auto_91103 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_91123 - OBJ
      ?auto_91124 - OBJ
      ?auto_91125 - OBJ
      ?auto_91122 - LOCATION
    )
    :vars
    (
      ?auto_91130 - LOCATION
      ?auto_91126 - CITY
      ?auto_91129 - OBJ
      ?auto_91128 - LOCATION
      ?auto_91127 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91124 ?auto_91123 ) ) ( not ( = ?auto_91125 ?auto_91123 ) ) ( not ( = ?auto_91125 ?auto_91124 ) ) ( IN-CITY ?auto_91130 ?auto_91126 ) ( IN-CITY ?auto_91122 ?auto_91126 ) ( not ( = ?auto_91122 ?auto_91130 ) ) ( OBJ-AT ?auto_91125 ?auto_91122 ) ( OBJ-AT ?auto_91123 ?auto_91130 ) ( not ( = ?auto_91129 ?auto_91125 ) ) ( not ( = ?auto_91123 ?auto_91129 ) ) ( IN-CITY ?auto_91128 ?auto_91126 ) ( not ( = ?auto_91122 ?auto_91128 ) ) ( not ( = ?auto_91130 ?auto_91128 ) ) ( OBJ-AT ?auto_91129 ?auto_91128 ) ( IN-TRUCK ?auto_91124 ?auto_91127 ) ( not ( = ?auto_91129 ?auto_91124 ) ) ( TRUCK-AT ?auto_91127 ?auto_91130 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91125 ?auto_91123 ?auto_91122 )
      ( DELIVER-3PKG-VERIFY ?auto_91123 ?auto_91124 ?auto_91125 ?auto_91122 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_91142 - OBJ
      ?auto_91143 - OBJ
      ?auto_91144 - OBJ
      ?auto_91141 - LOCATION
    )
    :vars
    (
      ?auto_91149 - OBJ
      ?auto_91148 - LOCATION
      ?auto_91145 - CITY
      ?auto_91147 - LOCATION
      ?auto_91146 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91143 ?auto_91142 ) ) ( not ( = ?auto_91144 ?auto_91142 ) ) ( not ( = ?auto_91144 ?auto_91143 ) ) ( not ( = ?auto_91142 ?auto_91149 ) ) ( IN-CITY ?auto_91148 ?auto_91145 ) ( IN-CITY ?auto_91141 ?auto_91145 ) ( not ( = ?auto_91141 ?auto_91148 ) ) ( OBJ-AT ?auto_91149 ?auto_91141 ) ( OBJ-AT ?auto_91142 ?auto_91148 ) ( not ( = ?auto_91144 ?auto_91149 ) ) ( IN-CITY ?auto_91147 ?auto_91145 ) ( not ( = ?auto_91141 ?auto_91147 ) ) ( not ( = ?auto_91148 ?auto_91147 ) ) ( OBJ-AT ?auto_91144 ?auto_91147 ) ( not ( = ?auto_91143 ?auto_91149 ) ) ( IN-TRUCK ?auto_91143 ?auto_91146 ) ( TRUCK-AT ?auto_91146 ?auto_91148 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91149 ?auto_91142 ?auto_91141 )
      ( DELIVER-3PKG-VERIFY ?auto_91142 ?auto_91143 ?auto_91144 ?auto_91141 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_91161 - OBJ
      ?auto_91162 - OBJ
      ?auto_91163 - OBJ
      ?auto_91160 - LOCATION
    )
    :vars
    (
      ?auto_91167 - LOCATION
      ?auto_91164 - CITY
      ?auto_91166 - LOCATION
      ?auto_91168 - OBJ
      ?auto_91165 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91162 ?auto_91161 ) ) ( not ( = ?auto_91163 ?auto_91161 ) ) ( not ( = ?auto_91163 ?auto_91162 ) ) ( IN-CITY ?auto_91167 ?auto_91164 ) ( IN-CITY ?auto_91160 ?auto_91164 ) ( not ( = ?auto_91160 ?auto_91167 ) ) ( OBJ-AT ?auto_91163 ?auto_91160 ) ( OBJ-AT ?auto_91161 ?auto_91167 ) ( IN-CITY ?auto_91166 ?auto_91164 ) ( not ( = ?auto_91160 ?auto_91166 ) ) ( not ( = ?auto_91167 ?auto_91166 ) ) ( OBJ-AT ?auto_91162 ?auto_91166 ) ( not ( = ?auto_91168 ?auto_91163 ) ) ( IN-TRUCK ?auto_91168 ?auto_91165 ) ( not ( = ?auto_91161 ?auto_91168 ) ) ( not ( = ?auto_91162 ?auto_91168 ) ) ( TRUCK-AT ?auto_91165 ?auto_91167 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91163 ?auto_91161 ?auto_91160 )
      ( DELIVER-3PKG-VERIFY ?auto_91161 ?auto_91162 ?auto_91163 ?auto_91160 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_91170 - OBJ
      ?auto_91171 - OBJ
      ?auto_91172 - OBJ
      ?auto_91169 - LOCATION
    )
    :vars
    (
      ?auto_91177 - OBJ
      ?auto_91176 - LOCATION
      ?auto_91173 - CITY
      ?auto_91175 - LOCATION
      ?auto_91174 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91171 ?auto_91170 ) ) ( not ( = ?auto_91172 ?auto_91170 ) ) ( not ( = ?auto_91172 ?auto_91171 ) ) ( not ( = ?auto_91170 ?auto_91177 ) ) ( IN-CITY ?auto_91176 ?auto_91173 ) ( IN-CITY ?auto_91169 ?auto_91173 ) ( not ( = ?auto_91169 ?auto_91176 ) ) ( OBJ-AT ?auto_91177 ?auto_91169 ) ( OBJ-AT ?auto_91170 ?auto_91176 ) ( not ( = ?auto_91171 ?auto_91177 ) ) ( IN-CITY ?auto_91175 ?auto_91173 ) ( not ( = ?auto_91169 ?auto_91175 ) ) ( not ( = ?auto_91176 ?auto_91175 ) ) ( OBJ-AT ?auto_91171 ?auto_91175 ) ( not ( = ?auto_91172 ?auto_91177 ) ) ( IN-TRUCK ?auto_91172 ?auto_91174 ) ( TRUCK-AT ?auto_91174 ?auto_91176 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91177 ?auto_91170 ?auto_91169 )
      ( DELIVER-3PKG-VERIFY ?auto_91170 ?auto_91171 ?auto_91172 ?auto_91169 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_91333 - OBJ
      ?auto_91334 - OBJ
      ?auto_91335 - OBJ
      ?auto_91336 - OBJ
      ?auto_91332 - LOCATION
    )
    :vars
    (
      ?auto_91340 - LOCATION
      ?auto_91337 - CITY
      ?auto_91339 - LOCATION
      ?auto_91338 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91334 ?auto_91333 ) ) ( not ( = ?auto_91335 ?auto_91333 ) ) ( not ( = ?auto_91335 ?auto_91334 ) ) ( not ( = ?auto_91336 ?auto_91333 ) ) ( not ( = ?auto_91336 ?auto_91334 ) ) ( not ( = ?auto_91336 ?auto_91335 ) ) ( IN-CITY ?auto_91340 ?auto_91337 ) ( IN-CITY ?auto_91332 ?auto_91337 ) ( not ( = ?auto_91332 ?auto_91340 ) ) ( OBJ-AT ?auto_91333 ?auto_91332 ) ( OBJ-AT ?auto_91336 ?auto_91340 ) ( IN-CITY ?auto_91339 ?auto_91337 ) ( not ( = ?auto_91332 ?auto_91339 ) ) ( not ( = ?auto_91340 ?auto_91339 ) ) ( OBJ-AT ?auto_91335 ?auto_91339 ) ( IN-TRUCK ?auto_91334 ?auto_91338 ) ( TRUCK-AT ?auto_91338 ?auto_91340 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91333 ?auto_91336 ?auto_91332 )
      ( DELIVER-4PKG-VERIFY ?auto_91333 ?auto_91334 ?auto_91335 ?auto_91336 ?auto_91332 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_91362 - OBJ
      ?auto_91363 - OBJ
      ?auto_91364 - OBJ
      ?auto_91365 - OBJ
      ?auto_91361 - LOCATION
    )
    :vars
    (
      ?auto_91369 - LOCATION
      ?auto_91366 - CITY
      ?auto_91368 - LOCATION
      ?auto_91367 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91363 ?auto_91362 ) ) ( not ( = ?auto_91364 ?auto_91362 ) ) ( not ( = ?auto_91364 ?auto_91363 ) ) ( not ( = ?auto_91365 ?auto_91362 ) ) ( not ( = ?auto_91365 ?auto_91363 ) ) ( not ( = ?auto_91365 ?auto_91364 ) ) ( IN-CITY ?auto_91369 ?auto_91366 ) ( IN-CITY ?auto_91361 ?auto_91366 ) ( not ( = ?auto_91361 ?auto_91369 ) ) ( OBJ-AT ?auto_91362 ?auto_91361 ) ( OBJ-AT ?auto_91364 ?auto_91369 ) ( IN-CITY ?auto_91368 ?auto_91366 ) ( not ( = ?auto_91361 ?auto_91368 ) ) ( not ( = ?auto_91369 ?auto_91368 ) ) ( OBJ-AT ?auto_91365 ?auto_91368 ) ( IN-TRUCK ?auto_91363 ?auto_91367 ) ( TRUCK-AT ?auto_91367 ?auto_91369 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91362 ?auto_91364 ?auto_91361 )
      ( DELIVER-4PKG-VERIFY ?auto_91362 ?auto_91363 ?auto_91364 ?auto_91365 ?auto_91361 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_91391 - OBJ
      ?auto_91392 - OBJ
      ?auto_91393 - OBJ
      ?auto_91394 - OBJ
      ?auto_91390 - LOCATION
    )
    :vars
    (
      ?auto_91398 - LOCATION
      ?auto_91395 - CITY
      ?auto_91397 - LOCATION
      ?auto_91396 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91392 ?auto_91391 ) ) ( not ( = ?auto_91393 ?auto_91391 ) ) ( not ( = ?auto_91393 ?auto_91392 ) ) ( not ( = ?auto_91394 ?auto_91391 ) ) ( not ( = ?auto_91394 ?auto_91392 ) ) ( not ( = ?auto_91394 ?auto_91393 ) ) ( IN-CITY ?auto_91398 ?auto_91395 ) ( IN-CITY ?auto_91390 ?auto_91395 ) ( not ( = ?auto_91390 ?auto_91398 ) ) ( OBJ-AT ?auto_91391 ?auto_91390 ) ( OBJ-AT ?auto_91394 ?auto_91398 ) ( IN-CITY ?auto_91397 ?auto_91395 ) ( not ( = ?auto_91390 ?auto_91397 ) ) ( not ( = ?auto_91398 ?auto_91397 ) ) ( OBJ-AT ?auto_91392 ?auto_91397 ) ( IN-TRUCK ?auto_91393 ?auto_91396 ) ( TRUCK-AT ?auto_91396 ?auto_91398 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91391 ?auto_91394 ?auto_91390 )
      ( DELIVER-4PKG-VERIFY ?auto_91391 ?auto_91392 ?auto_91393 ?auto_91394 ?auto_91390 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_91420 - OBJ
      ?auto_91421 - OBJ
      ?auto_91422 - OBJ
      ?auto_91423 - OBJ
      ?auto_91419 - LOCATION
    )
    :vars
    (
      ?auto_91427 - LOCATION
      ?auto_91424 - CITY
      ?auto_91426 - LOCATION
      ?auto_91425 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91421 ?auto_91420 ) ) ( not ( = ?auto_91422 ?auto_91420 ) ) ( not ( = ?auto_91422 ?auto_91421 ) ) ( not ( = ?auto_91423 ?auto_91420 ) ) ( not ( = ?auto_91423 ?auto_91421 ) ) ( not ( = ?auto_91423 ?auto_91422 ) ) ( IN-CITY ?auto_91427 ?auto_91424 ) ( IN-CITY ?auto_91419 ?auto_91424 ) ( not ( = ?auto_91419 ?auto_91427 ) ) ( OBJ-AT ?auto_91420 ?auto_91419 ) ( OBJ-AT ?auto_91422 ?auto_91427 ) ( IN-CITY ?auto_91426 ?auto_91424 ) ( not ( = ?auto_91419 ?auto_91426 ) ) ( not ( = ?auto_91427 ?auto_91426 ) ) ( OBJ-AT ?auto_91421 ?auto_91426 ) ( IN-TRUCK ?auto_91423 ?auto_91425 ) ( TRUCK-AT ?auto_91425 ?auto_91427 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91420 ?auto_91422 ?auto_91419 )
      ( DELIVER-4PKG-VERIFY ?auto_91420 ?auto_91421 ?auto_91422 ?auto_91423 ?auto_91419 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_91511 - OBJ
      ?auto_91512 - OBJ
      ?auto_91513 - OBJ
      ?auto_91514 - OBJ
      ?auto_91510 - LOCATION
    )
    :vars
    (
      ?auto_91518 - LOCATION
      ?auto_91515 - CITY
      ?auto_91517 - LOCATION
      ?auto_91516 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91512 ?auto_91511 ) ) ( not ( = ?auto_91513 ?auto_91511 ) ) ( not ( = ?auto_91513 ?auto_91512 ) ) ( not ( = ?auto_91514 ?auto_91511 ) ) ( not ( = ?auto_91514 ?auto_91512 ) ) ( not ( = ?auto_91514 ?auto_91513 ) ) ( IN-CITY ?auto_91518 ?auto_91515 ) ( IN-CITY ?auto_91510 ?auto_91515 ) ( not ( = ?auto_91510 ?auto_91518 ) ) ( OBJ-AT ?auto_91511 ?auto_91510 ) ( OBJ-AT ?auto_91512 ?auto_91518 ) ( IN-CITY ?auto_91517 ?auto_91515 ) ( not ( = ?auto_91510 ?auto_91517 ) ) ( not ( = ?auto_91518 ?auto_91517 ) ) ( OBJ-AT ?auto_91514 ?auto_91517 ) ( IN-TRUCK ?auto_91513 ?auto_91516 ) ( TRUCK-AT ?auto_91516 ?auto_91518 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91511 ?auto_91512 ?auto_91510 )
      ( DELIVER-4PKG-VERIFY ?auto_91511 ?auto_91512 ?auto_91513 ?auto_91514 ?auto_91510 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_91540 - OBJ
      ?auto_91541 - OBJ
      ?auto_91542 - OBJ
      ?auto_91543 - OBJ
      ?auto_91539 - LOCATION
    )
    :vars
    (
      ?auto_91547 - LOCATION
      ?auto_91544 - CITY
      ?auto_91546 - LOCATION
      ?auto_91545 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91541 ?auto_91540 ) ) ( not ( = ?auto_91542 ?auto_91540 ) ) ( not ( = ?auto_91542 ?auto_91541 ) ) ( not ( = ?auto_91543 ?auto_91540 ) ) ( not ( = ?auto_91543 ?auto_91541 ) ) ( not ( = ?auto_91543 ?auto_91542 ) ) ( IN-CITY ?auto_91547 ?auto_91544 ) ( IN-CITY ?auto_91539 ?auto_91544 ) ( not ( = ?auto_91539 ?auto_91547 ) ) ( OBJ-AT ?auto_91540 ?auto_91539 ) ( OBJ-AT ?auto_91541 ?auto_91547 ) ( IN-CITY ?auto_91546 ?auto_91544 ) ( not ( = ?auto_91539 ?auto_91546 ) ) ( not ( = ?auto_91547 ?auto_91546 ) ) ( OBJ-AT ?auto_91542 ?auto_91546 ) ( IN-TRUCK ?auto_91543 ?auto_91545 ) ( TRUCK-AT ?auto_91545 ?auto_91547 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91540 ?auto_91541 ?auto_91539 )
      ( DELIVER-4PKG-VERIFY ?auto_91540 ?auto_91541 ?auto_91542 ?auto_91543 ?auto_91539 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_91631 - OBJ
      ?auto_91632 - OBJ
      ?auto_91633 - OBJ
      ?auto_91634 - OBJ
      ?auto_91630 - LOCATION
    )
    :vars
    (
      ?auto_91638 - LOCATION
      ?auto_91635 - CITY
      ?auto_91637 - LOCATION
      ?auto_91636 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91632 ?auto_91631 ) ) ( not ( = ?auto_91633 ?auto_91631 ) ) ( not ( = ?auto_91633 ?auto_91632 ) ) ( not ( = ?auto_91634 ?auto_91631 ) ) ( not ( = ?auto_91634 ?auto_91632 ) ) ( not ( = ?auto_91634 ?auto_91633 ) ) ( IN-CITY ?auto_91638 ?auto_91635 ) ( IN-CITY ?auto_91630 ?auto_91635 ) ( not ( = ?auto_91630 ?auto_91638 ) ) ( OBJ-AT ?auto_91632 ?auto_91630 ) ( OBJ-AT ?auto_91634 ?auto_91638 ) ( IN-CITY ?auto_91637 ?auto_91635 ) ( not ( = ?auto_91630 ?auto_91637 ) ) ( not ( = ?auto_91638 ?auto_91637 ) ) ( OBJ-AT ?auto_91633 ?auto_91637 ) ( IN-TRUCK ?auto_91631 ?auto_91636 ) ( TRUCK-AT ?auto_91636 ?auto_91638 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91632 ?auto_91634 ?auto_91630 )
      ( DELIVER-4PKG-VERIFY ?auto_91631 ?auto_91632 ?auto_91633 ?auto_91634 ?auto_91630 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_91660 - OBJ
      ?auto_91661 - OBJ
      ?auto_91662 - OBJ
      ?auto_91663 - OBJ
      ?auto_91659 - LOCATION
    )
    :vars
    (
      ?auto_91667 - LOCATION
      ?auto_91664 - CITY
      ?auto_91666 - LOCATION
      ?auto_91665 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91661 ?auto_91660 ) ) ( not ( = ?auto_91662 ?auto_91660 ) ) ( not ( = ?auto_91662 ?auto_91661 ) ) ( not ( = ?auto_91663 ?auto_91660 ) ) ( not ( = ?auto_91663 ?auto_91661 ) ) ( not ( = ?auto_91663 ?auto_91662 ) ) ( IN-CITY ?auto_91667 ?auto_91664 ) ( IN-CITY ?auto_91659 ?auto_91664 ) ( not ( = ?auto_91659 ?auto_91667 ) ) ( OBJ-AT ?auto_91661 ?auto_91659 ) ( OBJ-AT ?auto_91662 ?auto_91667 ) ( IN-CITY ?auto_91666 ?auto_91664 ) ( not ( = ?auto_91659 ?auto_91666 ) ) ( not ( = ?auto_91667 ?auto_91666 ) ) ( OBJ-AT ?auto_91663 ?auto_91666 ) ( IN-TRUCK ?auto_91660 ?auto_91665 ) ( TRUCK-AT ?auto_91665 ?auto_91667 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91661 ?auto_91662 ?auto_91659 )
      ( DELIVER-4PKG-VERIFY ?auto_91660 ?auto_91661 ?auto_91662 ?auto_91663 ?auto_91659 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_91752 - OBJ
      ?auto_91753 - OBJ
      ?auto_91754 - OBJ
      ?auto_91755 - OBJ
      ?auto_91751 - LOCATION
    )
    :vars
    (
      ?auto_91759 - LOCATION
      ?auto_91756 - CITY
      ?auto_91758 - LOCATION
      ?auto_91757 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91753 ?auto_91752 ) ) ( not ( = ?auto_91754 ?auto_91752 ) ) ( not ( = ?auto_91754 ?auto_91753 ) ) ( not ( = ?auto_91755 ?auto_91752 ) ) ( not ( = ?auto_91755 ?auto_91753 ) ) ( not ( = ?auto_91755 ?auto_91754 ) ) ( IN-CITY ?auto_91759 ?auto_91756 ) ( IN-CITY ?auto_91751 ?auto_91756 ) ( not ( = ?auto_91751 ?auto_91759 ) ) ( OBJ-AT ?auto_91754 ?auto_91751 ) ( OBJ-AT ?auto_91755 ?auto_91759 ) ( IN-CITY ?auto_91758 ?auto_91756 ) ( not ( = ?auto_91751 ?auto_91758 ) ) ( not ( = ?auto_91759 ?auto_91758 ) ) ( OBJ-AT ?auto_91753 ?auto_91758 ) ( IN-TRUCK ?auto_91752 ?auto_91757 ) ( TRUCK-AT ?auto_91757 ?auto_91759 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91754 ?auto_91755 ?auto_91751 )
      ( DELIVER-4PKG-VERIFY ?auto_91752 ?auto_91753 ?auto_91754 ?auto_91755 ?auto_91751 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_91781 - OBJ
      ?auto_91782 - OBJ
      ?auto_91783 - OBJ
      ?auto_91784 - OBJ
      ?auto_91780 - LOCATION
    )
    :vars
    (
      ?auto_91788 - LOCATION
      ?auto_91785 - CITY
      ?auto_91787 - LOCATION
      ?auto_91786 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91782 ?auto_91781 ) ) ( not ( = ?auto_91783 ?auto_91781 ) ) ( not ( = ?auto_91783 ?auto_91782 ) ) ( not ( = ?auto_91784 ?auto_91781 ) ) ( not ( = ?auto_91784 ?auto_91782 ) ) ( not ( = ?auto_91784 ?auto_91783 ) ) ( IN-CITY ?auto_91788 ?auto_91785 ) ( IN-CITY ?auto_91780 ?auto_91785 ) ( not ( = ?auto_91780 ?auto_91788 ) ) ( OBJ-AT ?auto_91784 ?auto_91780 ) ( OBJ-AT ?auto_91783 ?auto_91788 ) ( IN-CITY ?auto_91787 ?auto_91785 ) ( not ( = ?auto_91780 ?auto_91787 ) ) ( not ( = ?auto_91788 ?auto_91787 ) ) ( OBJ-AT ?auto_91782 ?auto_91787 ) ( IN-TRUCK ?auto_91781 ?auto_91786 ) ( TRUCK-AT ?auto_91786 ?auto_91788 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91784 ?auto_91783 ?auto_91780 )
      ( DELIVER-4PKG-VERIFY ?auto_91781 ?auto_91782 ?auto_91783 ?auto_91784 ?auto_91780 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_91840 - OBJ
      ?auto_91841 - OBJ
      ?auto_91842 - OBJ
      ?auto_91843 - OBJ
      ?auto_91839 - LOCATION
    )
    :vars
    (
      ?auto_91847 - LOCATION
      ?auto_91844 - CITY
      ?auto_91846 - LOCATION
      ?auto_91845 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91841 ?auto_91840 ) ) ( not ( = ?auto_91842 ?auto_91840 ) ) ( not ( = ?auto_91842 ?auto_91841 ) ) ( not ( = ?auto_91843 ?auto_91840 ) ) ( not ( = ?auto_91843 ?auto_91841 ) ) ( not ( = ?auto_91843 ?auto_91842 ) ) ( IN-CITY ?auto_91847 ?auto_91844 ) ( IN-CITY ?auto_91839 ?auto_91844 ) ( not ( = ?auto_91839 ?auto_91847 ) ) ( OBJ-AT ?auto_91842 ?auto_91839 ) ( OBJ-AT ?auto_91841 ?auto_91847 ) ( IN-CITY ?auto_91846 ?auto_91844 ) ( not ( = ?auto_91839 ?auto_91846 ) ) ( not ( = ?auto_91847 ?auto_91846 ) ) ( OBJ-AT ?auto_91843 ?auto_91846 ) ( IN-TRUCK ?auto_91840 ?auto_91845 ) ( TRUCK-AT ?auto_91845 ?auto_91847 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91842 ?auto_91841 ?auto_91839 )
      ( DELIVER-4PKG-VERIFY ?auto_91840 ?auto_91841 ?auto_91842 ?auto_91843 ?auto_91839 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_91901 - OBJ
      ?auto_91902 - OBJ
      ?auto_91903 - OBJ
      ?auto_91904 - OBJ
      ?auto_91900 - LOCATION
    )
    :vars
    (
      ?auto_91908 - LOCATION
      ?auto_91905 - CITY
      ?auto_91907 - LOCATION
      ?auto_91906 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91902 ?auto_91901 ) ) ( not ( = ?auto_91903 ?auto_91901 ) ) ( not ( = ?auto_91903 ?auto_91902 ) ) ( not ( = ?auto_91904 ?auto_91901 ) ) ( not ( = ?auto_91904 ?auto_91902 ) ) ( not ( = ?auto_91904 ?auto_91903 ) ) ( IN-CITY ?auto_91908 ?auto_91905 ) ( IN-CITY ?auto_91900 ?auto_91905 ) ( not ( = ?auto_91900 ?auto_91908 ) ) ( OBJ-AT ?auto_91904 ?auto_91900 ) ( OBJ-AT ?auto_91902 ?auto_91908 ) ( IN-CITY ?auto_91907 ?auto_91905 ) ( not ( = ?auto_91900 ?auto_91907 ) ) ( not ( = ?auto_91908 ?auto_91907 ) ) ( OBJ-AT ?auto_91903 ?auto_91907 ) ( IN-TRUCK ?auto_91901 ?auto_91906 ) ( TRUCK-AT ?auto_91906 ?auto_91908 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91904 ?auto_91902 ?auto_91900 )
      ( DELIVER-4PKG-VERIFY ?auto_91901 ?auto_91902 ?auto_91903 ?auto_91904 ?auto_91900 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_91992 - OBJ
      ?auto_91993 - OBJ
      ?auto_91994 - OBJ
      ?auto_91995 - OBJ
      ?auto_91991 - LOCATION
    )
    :vars
    (
      ?auto_91999 - LOCATION
      ?auto_91996 - CITY
      ?auto_91998 - LOCATION
      ?auto_91997 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_91993 ?auto_91992 ) ) ( not ( = ?auto_91994 ?auto_91992 ) ) ( not ( = ?auto_91994 ?auto_91993 ) ) ( not ( = ?auto_91995 ?auto_91992 ) ) ( not ( = ?auto_91995 ?auto_91993 ) ) ( not ( = ?auto_91995 ?auto_91994 ) ) ( IN-CITY ?auto_91999 ?auto_91996 ) ( IN-CITY ?auto_91991 ?auto_91996 ) ( not ( = ?auto_91991 ?auto_91999 ) ) ( OBJ-AT ?auto_91993 ?auto_91991 ) ( OBJ-AT ?auto_91995 ?auto_91999 ) ( IN-CITY ?auto_91998 ?auto_91996 ) ( not ( = ?auto_91991 ?auto_91998 ) ) ( not ( = ?auto_91999 ?auto_91998 ) ) ( OBJ-AT ?auto_91992 ?auto_91998 ) ( IN-TRUCK ?auto_91994 ?auto_91997 ) ( TRUCK-AT ?auto_91997 ?auto_91999 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_91993 ?auto_91995 ?auto_91991 )
      ( DELIVER-4PKG-VERIFY ?auto_91992 ?auto_91993 ?auto_91994 ?auto_91995 ?auto_91991 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_92021 - OBJ
      ?auto_92022 - OBJ
      ?auto_92023 - OBJ
      ?auto_92024 - OBJ
      ?auto_92020 - LOCATION
    )
    :vars
    (
      ?auto_92028 - LOCATION
      ?auto_92025 - CITY
      ?auto_92027 - LOCATION
      ?auto_92026 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_92022 ?auto_92021 ) ) ( not ( = ?auto_92023 ?auto_92021 ) ) ( not ( = ?auto_92023 ?auto_92022 ) ) ( not ( = ?auto_92024 ?auto_92021 ) ) ( not ( = ?auto_92024 ?auto_92022 ) ) ( not ( = ?auto_92024 ?auto_92023 ) ) ( IN-CITY ?auto_92028 ?auto_92025 ) ( IN-CITY ?auto_92020 ?auto_92025 ) ( not ( = ?auto_92020 ?auto_92028 ) ) ( OBJ-AT ?auto_92022 ?auto_92020 ) ( OBJ-AT ?auto_92023 ?auto_92028 ) ( IN-CITY ?auto_92027 ?auto_92025 ) ( not ( = ?auto_92020 ?auto_92027 ) ) ( not ( = ?auto_92028 ?auto_92027 ) ) ( OBJ-AT ?auto_92021 ?auto_92027 ) ( IN-TRUCK ?auto_92024 ?auto_92026 ) ( TRUCK-AT ?auto_92026 ?auto_92028 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_92022 ?auto_92023 ?auto_92020 )
      ( DELIVER-4PKG-VERIFY ?auto_92021 ?auto_92022 ?auto_92023 ?auto_92024 ?auto_92020 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_92050 - OBJ
      ?auto_92051 - OBJ
      ?auto_92052 - OBJ
      ?auto_92053 - OBJ
      ?auto_92049 - LOCATION
    )
    :vars
    (
      ?auto_92057 - LOCATION
      ?auto_92054 - CITY
      ?auto_92056 - LOCATION
      ?auto_92055 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_92051 ?auto_92050 ) ) ( not ( = ?auto_92052 ?auto_92050 ) ) ( not ( = ?auto_92052 ?auto_92051 ) ) ( not ( = ?auto_92053 ?auto_92050 ) ) ( not ( = ?auto_92053 ?auto_92051 ) ) ( not ( = ?auto_92053 ?auto_92052 ) ) ( IN-CITY ?auto_92057 ?auto_92054 ) ( IN-CITY ?auto_92049 ?auto_92054 ) ( not ( = ?auto_92049 ?auto_92057 ) ) ( OBJ-AT ?auto_92052 ?auto_92049 ) ( OBJ-AT ?auto_92053 ?auto_92057 ) ( IN-CITY ?auto_92056 ?auto_92054 ) ( not ( = ?auto_92049 ?auto_92056 ) ) ( not ( = ?auto_92057 ?auto_92056 ) ) ( OBJ-AT ?auto_92050 ?auto_92056 ) ( IN-TRUCK ?auto_92051 ?auto_92055 ) ( TRUCK-AT ?auto_92055 ?auto_92057 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_92052 ?auto_92053 ?auto_92049 )
      ( DELIVER-4PKG-VERIFY ?auto_92050 ?auto_92051 ?auto_92052 ?auto_92053 ?auto_92049 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_92079 - OBJ
      ?auto_92080 - OBJ
      ?auto_92081 - OBJ
      ?auto_92082 - OBJ
      ?auto_92078 - LOCATION
    )
    :vars
    (
      ?auto_92086 - LOCATION
      ?auto_92083 - CITY
      ?auto_92085 - LOCATION
      ?auto_92084 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_92080 ?auto_92079 ) ) ( not ( = ?auto_92081 ?auto_92079 ) ) ( not ( = ?auto_92081 ?auto_92080 ) ) ( not ( = ?auto_92082 ?auto_92079 ) ) ( not ( = ?auto_92082 ?auto_92080 ) ) ( not ( = ?auto_92082 ?auto_92081 ) ) ( IN-CITY ?auto_92086 ?auto_92083 ) ( IN-CITY ?auto_92078 ?auto_92083 ) ( not ( = ?auto_92078 ?auto_92086 ) ) ( OBJ-AT ?auto_92082 ?auto_92078 ) ( OBJ-AT ?auto_92081 ?auto_92086 ) ( IN-CITY ?auto_92085 ?auto_92083 ) ( not ( = ?auto_92078 ?auto_92085 ) ) ( not ( = ?auto_92086 ?auto_92085 ) ) ( OBJ-AT ?auto_92079 ?auto_92085 ) ( IN-TRUCK ?auto_92080 ?auto_92084 ) ( TRUCK-AT ?auto_92084 ?auto_92086 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_92082 ?auto_92081 ?auto_92078 )
      ( DELIVER-4PKG-VERIFY ?auto_92079 ?auto_92080 ?auto_92081 ?auto_92082 ?auto_92078 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_92201 - OBJ
      ?auto_92202 - OBJ
      ?auto_92203 - OBJ
      ?auto_92204 - OBJ
      ?auto_92200 - LOCATION
    )
    :vars
    (
      ?auto_92208 - LOCATION
      ?auto_92205 - CITY
      ?auto_92207 - LOCATION
      ?auto_92206 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_92202 ?auto_92201 ) ) ( not ( = ?auto_92203 ?auto_92201 ) ) ( not ( = ?auto_92203 ?auto_92202 ) ) ( not ( = ?auto_92204 ?auto_92201 ) ) ( not ( = ?auto_92204 ?auto_92202 ) ) ( not ( = ?auto_92204 ?auto_92203 ) ) ( IN-CITY ?auto_92208 ?auto_92205 ) ( IN-CITY ?auto_92200 ?auto_92205 ) ( not ( = ?auto_92200 ?auto_92208 ) ) ( OBJ-AT ?auto_92203 ?auto_92200 ) ( OBJ-AT ?auto_92202 ?auto_92208 ) ( IN-CITY ?auto_92207 ?auto_92205 ) ( not ( = ?auto_92200 ?auto_92207 ) ) ( not ( = ?auto_92208 ?auto_92207 ) ) ( OBJ-AT ?auto_92201 ?auto_92207 ) ( IN-TRUCK ?auto_92204 ?auto_92206 ) ( TRUCK-AT ?auto_92206 ?auto_92208 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_92203 ?auto_92202 ?auto_92200 )
      ( DELIVER-4PKG-VERIFY ?auto_92201 ?auto_92202 ?auto_92203 ?auto_92204 ?auto_92200 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_92230 - OBJ
      ?auto_92231 - OBJ
      ?auto_92232 - OBJ
      ?auto_92233 - OBJ
      ?auto_92229 - LOCATION
    )
    :vars
    (
      ?auto_92237 - LOCATION
      ?auto_92234 - CITY
      ?auto_92236 - LOCATION
      ?auto_92235 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_92231 ?auto_92230 ) ) ( not ( = ?auto_92232 ?auto_92230 ) ) ( not ( = ?auto_92232 ?auto_92231 ) ) ( not ( = ?auto_92233 ?auto_92230 ) ) ( not ( = ?auto_92233 ?auto_92231 ) ) ( not ( = ?auto_92233 ?auto_92232 ) ) ( IN-CITY ?auto_92237 ?auto_92234 ) ( IN-CITY ?auto_92229 ?auto_92234 ) ( not ( = ?auto_92229 ?auto_92237 ) ) ( OBJ-AT ?auto_92233 ?auto_92229 ) ( OBJ-AT ?auto_92231 ?auto_92237 ) ( IN-CITY ?auto_92236 ?auto_92234 ) ( not ( = ?auto_92229 ?auto_92236 ) ) ( not ( = ?auto_92237 ?auto_92236 ) ) ( OBJ-AT ?auto_92230 ?auto_92236 ) ( IN-TRUCK ?auto_92232 ?auto_92235 ) ( TRUCK-AT ?auto_92235 ?auto_92237 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_92233 ?auto_92231 ?auto_92229 )
      ( DELIVER-4PKG-VERIFY ?auto_92230 ?auto_92231 ?auto_92232 ?auto_92233 ?auto_92229 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_92415 - OBJ
      ?auto_92416 - OBJ
      ?auto_92417 - OBJ
      ?auto_92418 - OBJ
      ?auto_92414 - LOCATION
    )
    :vars
    (
      ?auto_92422 - LOCATION
      ?auto_92419 - CITY
      ?auto_92421 - LOCATION
      ?auto_92420 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_92416 ?auto_92415 ) ) ( not ( = ?auto_92417 ?auto_92415 ) ) ( not ( = ?auto_92417 ?auto_92416 ) ) ( not ( = ?auto_92418 ?auto_92415 ) ) ( not ( = ?auto_92418 ?auto_92416 ) ) ( not ( = ?auto_92418 ?auto_92417 ) ) ( IN-CITY ?auto_92422 ?auto_92419 ) ( IN-CITY ?auto_92414 ?auto_92419 ) ( not ( = ?auto_92414 ?auto_92422 ) ) ( OBJ-AT ?auto_92416 ?auto_92414 ) ( OBJ-AT ?auto_92415 ?auto_92422 ) ( IN-CITY ?auto_92421 ?auto_92419 ) ( not ( = ?auto_92414 ?auto_92421 ) ) ( not ( = ?auto_92422 ?auto_92421 ) ) ( OBJ-AT ?auto_92418 ?auto_92421 ) ( IN-TRUCK ?auto_92417 ?auto_92420 ) ( TRUCK-AT ?auto_92420 ?auto_92422 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_92416 ?auto_92415 ?auto_92414 )
      ( DELIVER-4PKG-VERIFY ?auto_92415 ?auto_92416 ?auto_92417 ?auto_92418 ?auto_92414 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_92444 - OBJ
      ?auto_92445 - OBJ
      ?auto_92446 - OBJ
      ?auto_92447 - OBJ
      ?auto_92443 - LOCATION
    )
    :vars
    (
      ?auto_92451 - LOCATION
      ?auto_92448 - CITY
      ?auto_92450 - LOCATION
      ?auto_92449 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_92445 ?auto_92444 ) ) ( not ( = ?auto_92446 ?auto_92444 ) ) ( not ( = ?auto_92446 ?auto_92445 ) ) ( not ( = ?auto_92447 ?auto_92444 ) ) ( not ( = ?auto_92447 ?auto_92445 ) ) ( not ( = ?auto_92447 ?auto_92446 ) ) ( IN-CITY ?auto_92451 ?auto_92448 ) ( IN-CITY ?auto_92443 ?auto_92448 ) ( not ( = ?auto_92443 ?auto_92451 ) ) ( OBJ-AT ?auto_92445 ?auto_92443 ) ( OBJ-AT ?auto_92444 ?auto_92451 ) ( IN-CITY ?auto_92450 ?auto_92448 ) ( not ( = ?auto_92443 ?auto_92450 ) ) ( not ( = ?auto_92451 ?auto_92450 ) ) ( OBJ-AT ?auto_92446 ?auto_92450 ) ( IN-TRUCK ?auto_92447 ?auto_92449 ) ( TRUCK-AT ?auto_92449 ?auto_92451 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_92445 ?auto_92444 ?auto_92443 )
      ( DELIVER-4PKG-VERIFY ?auto_92444 ?auto_92445 ?auto_92446 ?auto_92447 ?auto_92443 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_92535 - OBJ
      ?auto_92536 - OBJ
      ?auto_92537 - OBJ
      ?auto_92538 - OBJ
      ?auto_92534 - LOCATION
    )
    :vars
    (
      ?auto_92542 - LOCATION
      ?auto_92539 - CITY
      ?auto_92541 - LOCATION
      ?auto_92540 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_92536 ?auto_92535 ) ) ( not ( = ?auto_92537 ?auto_92535 ) ) ( not ( = ?auto_92537 ?auto_92536 ) ) ( not ( = ?auto_92538 ?auto_92535 ) ) ( not ( = ?auto_92538 ?auto_92536 ) ) ( not ( = ?auto_92538 ?auto_92537 ) ) ( IN-CITY ?auto_92542 ?auto_92539 ) ( IN-CITY ?auto_92534 ?auto_92539 ) ( not ( = ?auto_92534 ?auto_92542 ) ) ( OBJ-AT ?auto_92537 ?auto_92534 ) ( OBJ-AT ?auto_92535 ?auto_92542 ) ( IN-CITY ?auto_92541 ?auto_92539 ) ( not ( = ?auto_92534 ?auto_92541 ) ) ( not ( = ?auto_92542 ?auto_92541 ) ) ( OBJ-AT ?auto_92538 ?auto_92541 ) ( IN-TRUCK ?auto_92536 ?auto_92540 ) ( TRUCK-AT ?auto_92540 ?auto_92542 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_92537 ?auto_92535 ?auto_92534 )
      ( DELIVER-4PKG-VERIFY ?auto_92535 ?auto_92536 ?auto_92537 ?auto_92538 ?auto_92534 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_92596 - OBJ
      ?auto_92597 - OBJ
      ?auto_92598 - OBJ
      ?auto_92599 - OBJ
      ?auto_92595 - LOCATION
    )
    :vars
    (
      ?auto_92603 - LOCATION
      ?auto_92600 - CITY
      ?auto_92602 - LOCATION
      ?auto_92601 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_92597 ?auto_92596 ) ) ( not ( = ?auto_92598 ?auto_92596 ) ) ( not ( = ?auto_92598 ?auto_92597 ) ) ( not ( = ?auto_92599 ?auto_92596 ) ) ( not ( = ?auto_92599 ?auto_92597 ) ) ( not ( = ?auto_92599 ?auto_92598 ) ) ( IN-CITY ?auto_92603 ?auto_92600 ) ( IN-CITY ?auto_92595 ?auto_92600 ) ( not ( = ?auto_92595 ?auto_92603 ) ) ( OBJ-AT ?auto_92599 ?auto_92595 ) ( OBJ-AT ?auto_92596 ?auto_92603 ) ( IN-CITY ?auto_92602 ?auto_92600 ) ( not ( = ?auto_92595 ?auto_92602 ) ) ( not ( = ?auto_92603 ?auto_92602 ) ) ( OBJ-AT ?auto_92598 ?auto_92602 ) ( IN-TRUCK ?auto_92597 ?auto_92601 ) ( TRUCK-AT ?auto_92601 ?auto_92603 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_92599 ?auto_92596 ?auto_92595 )
      ( DELIVER-4PKG-VERIFY ?auto_92596 ?auto_92597 ?auto_92598 ?auto_92599 ?auto_92595 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_92687 - OBJ
      ?auto_92688 - OBJ
      ?auto_92689 - OBJ
      ?auto_92690 - OBJ
      ?auto_92686 - LOCATION
    )
    :vars
    (
      ?auto_92694 - LOCATION
      ?auto_92691 - CITY
      ?auto_92693 - LOCATION
      ?auto_92692 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_92688 ?auto_92687 ) ) ( not ( = ?auto_92689 ?auto_92687 ) ) ( not ( = ?auto_92689 ?auto_92688 ) ) ( not ( = ?auto_92690 ?auto_92687 ) ) ( not ( = ?auto_92690 ?auto_92688 ) ) ( not ( = ?auto_92690 ?auto_92689 ) ) ( IN-CITY ?auto_92694 ?auto_92691 ) ( IN-CITY ?auto_92686 ?auto_92691 ) ( not ( = ?auto_92686 ?auto_92694 ) ) ( OBJ-AT ?auto_92689 ?auto_92686 ) ( OBJ-AT ?auto_92687 ?auto_92694 ) ( IN-CITY ?auto_92693 ?auto_92691 ) ( not ( = ?auto_92686 ?auto_92693 ) ) ( not ( = ?auto_92694 ?auto_92693 ) ) ( OBJ-AT ?auto_92688 ?auto_92693 ) ( IN-TRUCK ?auto_92690 ?auto_92692 ) ( TRUCK-AT ?auto_92692 ?auto_92694 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_92689 ?auto_92687 ?auto_92686 )
      ( DELIVER-4PKG-VERIFY ?auto_92687 ?auto_92688 ?auto_92689 ?auto_92690 ?auto_92686 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_92716 - OBJ
      ?auto_92717 - OBJ
      ?auto_92718 - OBJ
      ?auto_92719 - OBJ
      ?auto_92715 - LOCATION
    )
    :vars
    (
      ?auto_92723 - LOCATION
      ?auto_92720 - CITY
      ?auto_92722 - LOCATION
      ?auto_92721 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_92717 ?auto_92716 ) ) ( not ( = ?auto_92718 ?auto_92716 ) ) ( not ( = ?auto_92718 ?auto_92717 ) ) ( not ( = ?auto_92719 ?auto_92716 ) ) ( not ( = ?auto_92719 ?auto_92717 ) ) ( not ( = ?auto_92719 ?auto_92718 ) ) ( IN-CITY ?auto_92723 ?auto_92720 ) ( IN-CITY ?auto_92715 ?auto_92720 ) ( not ( = ?auto_92715 ?auto_92723 ) ) ( OBJ-AT ?auto_92719 ?auto_92715 ) ( OBJ-AT ?auto_92716 ?auto_92723 ) ( IN-CITY ?auto_92722 ?auto_92720 ) ( not ( = ?auto_92715 ?auto_92722 ) ) ( not ( = ?auto_92723 ?auto_92722 ) ) ( OBJ-AT ?auto_92717 ?auto_92722 ) ( IN-TRUCK ?auto_92718 ?auto_92721 ) ( TRUCK-AT ?auto_92721 ?auto_92723 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_92719 ?auto_92716 ?auto_92715 )
      ( DELIVER-4PKG-VERIFY ?auto_92716 ?auto_92717 ?auto_92718 ?auto_92719 ?auto_92715 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_93010 - OBJ
      ?auto_93009 - LOCATION
    )
    :vars
    (
      ?auto_93017 - OBJ
      ?auto_93015 - LOCATION
      ?auto_93011 - CITY
      ?auto_93014 - OBJ
      ?auto_93013 - LOCATION
      ?auto_93016 - OBJ
      ?auto_93012 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93010 ?auto_93017 ) ) ( IN-CITY ?auto_93015 ?auto_93011 ) ( IN-CITY ?auto_93009 ?auto_93011 ) ( not ( = ?auto_93009 ?auto_93015 ) ) ( OBJ-AT ?auto_93017 ?auto_93009 ) ( OBJ-AT ?auto_93010 ?auto_93015 ) ( not ( = ?auto_93014 ?auto_93017 ) ) ( not ( = ?auto_93010 ?auto_93014 ) ) ( IN-CITY ?auto_93013 ?auto_93011 ) ( not ( = ?auto_93009 ?auto_93013 ) ) ( not ( = ?auto_93015 ?auto_93013 ) ) ( OBJ-AT ?auto_93014 ?auto_93013 ) ( not ( = ?auto_93016 ?auto_93017 ) ) ( not ( = ?auto_93010 ?auto_93016 ) ) ( not ( = ?auto_93014 ?auto_93016 ) ) ( TRUCK-AT ?auto_93012 ?auto_93015 ) ( OBJ-AT ?auto_93016 ?auto_93015 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_93016 ?auto_93012 ?auto_93015 )
      ( DELIVER-2PKG ?auto_93017 ?auto_93010 ?auto_93009 )
      ( DELIVER-1PKG-VERIFY ?auto_93010 ?auto_93009 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_93019 - OBJ
      ?auto_93020 - OBJ
      ?auto_93018 - LOCATION
    )
    :vars
    (
      ?auto_93024 - LOCATION
      ?auto_93021 - CITY
      ?auto_93023 - OBJ
      ?auto_93022 - LOCATION
      ?auto_93025 - OBJ
      ?auto_93026 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93020 ?auto_93019 ) ) ( IN-CITY ?auto_93024 ?auto_93021 ) ( IN-CITY ?auto_93018 ?auto_93021 ) ( not ( = ?auto_93018 ?auto_93024 ) ) ( OBJ-AT ?auto_93019 ?auto_93018 ) ( OBJ-AT ?auto_93020 ?auto_93024 ) ( not ( = ?auto_93023 ?auto_93019 ) ) ( not ( = ?auto_93020 ?auto_93023 ) ) ( IN-CITY ?auto_93022 ?auto_93021 ) ( not ( = ?auto_93018 ?auto_93022 ) ) ( not ( = ?auto_93024 ?auto_93022 ) ) ( OBJ-AT ?auto_93023 ?auto_93022 ) ( not ( = ?auto_93025 ?auto_93019 ) ) ( not ( = ?auto_93020 ?auto_93025 ) ) ( not ( = ?auto_93023 ?auto_93025 ) ) ( TRUCK-AT ?auto_93026 ?auto_93024 ) ( OBJ-AT ?auto_93025 ?auto_93024 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_93020 ?auto_93018 )
      ( DELIVER-2PKG-VERIFY ?auto_93019 ?auto_93020 ?auto_93018 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_93028 - OBJ
      ?auto_93029 - OBJ
      ?auto_93027 - LOCATION
    )
    :vars
    (
      ?auto_93035 - OBJ
      ?auto_93033 - LOCATION
      ?auto_93034 - CITY
      ?auto_93030 - OBJ
      ?auto_93031 - LOCATION
      ?auto_93032 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93029 ?auto_93028 ) ) ( not ( = ?auto_93029 ?auto_93035 ) ) ( IN-CITY ?auto_93033 ?auto_93034 ) ( IN-CITY ?auto_93027 ?auto_93034 ) ( not ( = ?auto_93027 ?auto_93033 ) ) ( OBJ-AT ?auto_93035 ?auto_93027 ) ( OBJ-AT ?auto_93029 ?auto_93033 ) ( not ( = ?auto_93030 ?auto_93035 ) ) ( not ( = ?auto_93029 ?auto_93030 ) ) ( IN-CITY ?auto_93031 ?auto_93034 ) ( not ( = ?auto_93027 ?auto_93031 ) ) ( not ( = ?auto_93033 ?auto_93031 ) ) ( OBJ-AT ?auto_93030 ?auto_93031 ) ( not ( = ?auto_93028 ?auto_93035 ) ) ( not ( = ?auto_93030 ?auto_93028 ) ) ( TRUCK-AT ?auto_93032 ?auto_93033 ) ( OBJ-AT ?auto_93028 ?auto_93033 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93035 ?auto_93029 ?auto_93027 )
      ( DELIVER-2PKG-VERIFY ?auto_93028 ?auto_93029 ?auto_93027 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_93037 - OBJ
      ?auto_93038 - OBJ
      ?auto_93036 - LOCATION
    )
    :vars
    (
      ?auto_93044 - OBJ
      ?auto_93042 - LOCATION
      ?auto_93043 - CITY
      ?auto_93039 - LOCATION
      ?auto_93041 - OBJ
      ?auto_93040 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93038 ?auto_93037 ) ) ( not ( = ?auto_93038 ?auto_93044 ) ) ( IN-CITY ?auto_93042 ?auto_93043 ) ( IN-CITY ?auto_93036 ?auto_93043 ) ( not ( = ?auto_93036 ?auto_93042 ) ) ( OBJ-AT ?auto_93044 ?auto_93036 ) ( OBJ-AT ?auto_93038 ?auto_93042 ) ( not ( = ?auto_93037 ?auto_93044 ) ) ( IN-CITY ?auto_93039 ?auto_93043 ) ( not ( = ?auto_93036 ?auto_93039 ) ) ( not ( = ?auto_93042 ?auto_93039 ) ) ( OBJ-AT ?auto_93037 ?auto_93039 ) ( not ( = ?auto_93041 ?auto_93044 ) ) ( not ( = ?auto_93038 ?auto_93041 ) ) ( not ( = ?auto_93037 ?auto_93041 ) ) ( TRUCK-AT ?auto_93040 ?auto_93042 ) ( OBJ-AT ?auto_93041 ?auto_93042 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93044 ?auto_93038 ?auto_93036 )
      ( DELIVER-2PKG-VERIFY ?auto_93037 ?auto_93038 ?auto_93036 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_93046 - OBJ
      ?auto_93047 - OBJ
      ?auto_93045 - LOCATION
    )
    :vars
    (
      ?auto_93052 - LOCATION
      ?auto_93053 - CITY
      ?auto_93048 - OBJ
      ?auto_93049 - LOCATION
      ?auto_93051 - OBJ
      ?auto_93050 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93047 ?auto_93046 ) ) ( IN-CITY ?auto_93052 ?auto_93053 ) ( IN-CITY ?auto_93045 ?auto_93053 ) ( not ( = ?auto_93045 ?auto_93052 ) ) ( OBJ-AT ?auto_93047 ?auto_93045 ) ( OBJ-AT ?auto_93046 ?auto_93052 ) ( not ( = ?auto_93048 ?auto_93047 ) ) ( not ( = ?auto_93046 ?auto_93048 ) ) ( IN-CITY ?auto_93049 ?auto_93053 ) ( not ( = ?auto_93045 ?auto_93049 ) ) ( not ( = ?auto_93052 ?auto_93049 ) ) ( OBJ-AT ?auto_93048 ?auto_93049 ) ( not ( = ?auto_93051 ?auto_93047 ) ) ( not ( = ?auto_93046 ?auto_93051 ) ) ( not ( = ?auto_93048 ?auto_93051 ) ) ( TRUCK-AT ?auto_93050 ?auto_93052 ) ( OBJ-AT ?auto_93051 ?auto_93052 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93047 ?auto_93046 ?auto_93045 )
      ( DELIVER-2PKG-VERIFY ?auto_93046 ?auto_93047 ?auto_93045 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_93055 - OBJ
      ?auto_93056 - OBJ
      ?auto_93054 - LOCATION
    )
    :vars
    (
      ?auto_93062 - OBJ
      ?auto_93060 - LOCATION
      ?auto_93061 - CITY
      ?auto_93057 - OBJ
      ?auto_93058 - LOCATION
      ?auto_93059 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93056 ?auto_93055 ) ) ( not ( = ?auto_93055 ?auto_93062 ) ) ( IN-CITY ?auto_93060 ?auto_93061 ) ( IN-CITY ?auto_93054 ?auto_93061 ) ( not ( = ?auto_93054 ?auto_93060 ) ) ( OBJ-AT ?auto_93062 ?auto_93054 ) ( OBJ-AT ?auto_93055 ?auto_93060 ) ( not ( = ?auto_93057 ?auto_93062 ) ) ( not ( = ?auto_93055 ?auto_93057 ) ) ( IN-CITY ?auto_93058 ?auto_93061 ) ( not ( = ?auto_93054 ?auto_93058 ) ) ( not ( = ?auto_93060 ?auto_93058 ) ) ( OBJ-AT ?auto_93057 ?auto_93058 ) ( not ( = ?auto_93056 ?auto_93062 ) ) ( not ( = ?auto_93057 ?auto_93056 ) ) ( TRUCK-AT ?auto_93059 ?auto_93060 ) ( OBJ-AT ?auto_93056 ?auto_93060 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93062 ?auto_93055 ?auto_93054 )
      ( DELIVER-2PKG-VERIFY ?auto_93055 ?auto_93056 ?auto_93054 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_93064 - OBJ
      ?auto_93065 - OBJ
      ?auto_93063 - LOCATION
    )
    :vars
    (
      ?auto_93071 - OBJ
      ?auto_93069 - LOCATION
      ?auto_93070 - CITY
      ?auto_93066 - LOCATION
      ?auto_93068 - OBJ
      ?auto_93067 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93065 ?auto_93064 ) ) ( not ( = ?auto_93064 ?auto_93071 ) ) ( IN-CITY ?auto_93069 ?auto_93070 ) ( IN-CITY ?auto_93063 ?auto_93070 ) ( not ( = ?auto_93063 ?auto_93069 ) ) ( OBJ-AT ?auto_93071 ?auto_93063 ) ( OBJ-AT ?auto_93064 ?auto_93069 ) ( not ( = ?auto_93065 ?auto_93071 ) ) ( IN-CITY ?auto_93066 ?auto_93070 ) ( not ( = ?auto_93063 ?auto_93066 ) ) ( not ( = ?auto_93069 ?auto_93066 ) ) ( OBJ-AT ?auto_93065 ?auto_93066 ) ( not ( = ?auto_93068 ?auto_93071 ) ) ( not ( = ?auto_93064 ?auto_93068 ) ) ( not ( = ?auto_93065 ?auto_93068 ) ) ( TRUCK-AT ?auto_93067 ?auto_93069 ) ( OBJ-AT ?auto_93068 ?auto_93069 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93071 ?auto_93064 ?auto_93063 )
      ( DELIVER-2PKG-VERIFY ?auto_93064 ?auto_93065 ?auto_93063 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_93093 - OBJ
      ?auto_93094 - OBJ
      ?auto_93095 - OBJ
      ?auto_93092 - LOCATION
    )
    :vars
    (
      ?auto_93099 - LOCATION
      ?auto_93100 - CITY
      ?auto_93096 - OBJ
      ?auto_93097 - LOCATION
      ?auto_93098 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93094 ?auto_93093 ) ) ( not ( = ?auto_93095 ?auto_93093 ) ) ( not ( = ?auto_93095 ?auto_93094 ) ) ( IN-CITY ?auto_93099 ?auto_93100 ) ( IN-CITY ?auto_93092 ?auto_93100 ) ( not ( = ?auto_93092 ?auto_93099 ) ) ( OBJ-AT ?auto_93093 ?auto_93092 ) ( OBJ-AT ?auto_93095 ?auto_93099 ) ( not ( = ?auto_93096 ?auto_93093 ) ) ( not ( = ?auto_93095 ?auto_93096 ) ) ( IN-CITY ?auto_93097 ?auto_93100 ) ( not ( = ?auto_93092 ?auto_93097 ) ) ( not ( = ?auto_93099 ?auto_93097 ) ) ( OBJ-AT ?auto_93096 ?auto_93097 ) ( not ( = ?auto_93096 ?auto_93094 ) ) ( TRUCK-AT ?auto_93098 ?auto_93099 ) ( OBJ-AT ?auto_93094 ?auto_93099 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93093 ?auto_93095 ?auto_93092 )
      ( DELIVER-3PKG-VERIFY ?auto_93093 ?auto_93094 ?auto_93095 ?auto_93092 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_93102 - OBJ
      ?auto_93103 - OBJ
      ?auto_93104 - OBJ
      ?auto_93101 - LOCATION
    )
    :vars
    (
      ?auto_93108 - LOCATION
      ?auto_93109 - CITY
      ?auto_93105 - LOCATION
      ?auto_93107 - OBJ
      ?auto_93106 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93103 ?auto_93102 ) ) ( not ( = ?auto_93104 ?auto_93102 ) ) ( not ( = ?auto_93104 ?auto_93103 ) ) ( IN-CITY ?auto_93108 ?auto_93109 ) ( IN-CITY ?auto_93101 ?auto_93109 ) ( not ( = ?auto_93101 ?auto_93108 ) ) ( OBJ-AT ?auto_93102 ?auto_93101 ) ( OBJ-AT ?auto_93104 ?auto_93108 ) ( IN-CITY ?auto_93105 ?auto_93109 ) ( not ( = ?auto_93101 ?auto_93105 ) ) ( not ( = ?auto_93108 ?auto_93105 ) ) ( OBJ-AT ?auto_93103 ?auto_93105 ) ( not ( = ?auto_93107 ?auto_93102 ) ) ( not ( = ?auto_93104 ?auto_93107 ) ) ( not ( = ?auto_93103 ?auto_93107 ) ) ( TRUCK-AT ?auto_93106 ?auto_93108 ) ( OBJ-AT ?auto_93107 ?auto_93108 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93102 ?auto_93104 ?auto_93101 )
      ( DELIVER-3PKG-VERIFY ?auto_93102 ?auto_93103 ?auto_93104 ?auto_93101 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_93121 - OBJ
      ?auto_93122 - OBJ
      ?auto_93123 - OBJ
      ?auto_93120 - LOCATION
    )
    :vars
    (
      ?auto_93127 - LOCATION
      ?auto_93128 - CITY
      ?auto_93124 - OBJ
      ?auto_93125 - LOCATION
      ?auto_93126 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93122 ?auto_93121 ) ) ( not ( = ?auto_93123 ?auto_93121 ) ) ( not ( = ?auto_93123 ?auto_93122 ) ) ( IN-CITY ?auto_93127 ?auto_93128 ) ( IN-CITY ?auto_93120 ?auto_93128 ) ( not ( = ?auto_93120 ?auto_93127 ) ) ( OBJ-AT ?auto_93121 ?auto_93120 ) ( OBJ-AT ?auto_93122 ?auto_93127 ) ( not ( = ?auto_93124 ?auto_93121 ) ) ( not ( = ?auto_93122 ?auto_93124 ) ) ( IN-CITY ?auto_93125 ?auto_93128 ) ( not ( = ?auto_93120 ?auto_93125 ) ) ( not ( = ?auto_93127 ?auto_93125 ) ) ( OBJ-AT ?auto_93124 ?auto_93125 ) ( not ( = ?auto_93124 ?auto_93123 ) ) ( TRUCK-AT ?auto_93126 ?auto_93127 ) ( OBJ-AT ?auto_93123 ?auto_93127 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93121 ?auto_93122 ?auto_93120 )
      ( DELIVER-3PKG-VERIFY ?auto_93121 ?auto_93122 ?auto_93123 ?auto_93120 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_93130 - OBJ
      ?auto_93131 - OBJ
      ?auto_93132 - OBJ
      ?auto_93129 - LOCATION
    )
    :vars
    (
      ?auto_93136 - LOCATION
      ?auto_93137 - CITY
      ?auto_93133 - LOCATION
      ?auto_93135 - OBJ
      ?auto_93134 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93131 ?auto_93130 ) ) ( not ( = ?auto_93132 ?auto_93130 ) ) ( not ( = ?auto_93132 ?auto_93131 ) ) ( IN-CITY ?auto_93136 ?auto_93137 ) ( IN-CITY ?auto_93129 ?auto_93137 ) ( not ( = ?auto_93129 ?auto_93136 ) ) ( OBJ-AT ?auto_93130 ?auto_93129 ) ( OBJ-AT ?auto_93131 ?auto_93136 ) ( IN-CITY ?auto_93133 ?auto_93137 ) ( not ( = ?auto_93129 ?auto_93133 ) ) ( not ( = ?auto_93136 ?auto_93133 ) ) ( OBJ-AT ?auto_93132 ?auto_93133 ) ( not ( = ?auto_93135 ?auto_93130 ) ) ( not ( = ?auto_93131 ?auto_93135 ) ) ( not ( = ?auto_93132 ?auto_93135 ) ) ( TRUCK-AT ?auto_93134 ?auto_93136 ) ( OBJ-AT ?auto_93135 ?auto_93136 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93130 ?auto_93131 ?auto_93129 )
      ( DELIVER-3PKG-VERIFY ?auto_93130 ?auto_93131 ?auto_93132 ?auto_93129 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_93149 - OBJ
      ?auto_93150 - OBJ
      ?auto_93151 - OBJ
      ?auto_93148 - LOCATION
    )
    :vars
    (
      ?auto_93155 - LOCATION
      ?auto_93156 - CITY
      ?auto_93152 - OBJ
      ?auto_93153 - LOCATION
      ?auto_93154 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93150 ?auto_93149 ) ) ( not ( = ?auto_93151 ?auto_93149 ) ) ( not ( = ?auto_93151 ?auto_93150 ) ) ( IN-CITY ?auto_93155 ?auto_93156 ) ( IN-CITY ?auto_93148 ?auto_93156 ) ( not ( = ?auto_93148 ?auto_93155 ) ) ( OBJ-AT ?auto_93150 ?auto_93148 ) ( OBJ-AT ?auto_93151 ?auto_93155 ) ( not ( = ?auto_93152 ?auto_93150 ) ) ( not ( = ?auto_93151 ?auto_93152 ) ) ( IN-CITY ?auto_93153 ?auto_93156 ) ( not ( = ?auto_93148 ?auto_93153 ) ) ( not ( = ?auto_93155 ?auto_93153 ) ) ( OBJ-AT ?auto_93152 ?auto_93153 ) ( not ( = ?auto_93152 ?auto_93149 ) ) ( TRUCK-AT ?auto_93154 ?auto_93155 ) ( OBJ-AT ?auto_93149 ?auto_93155 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93150 ?auto_93151 ?auto_93148 )
      ( DELIVER-3PKG-VERIFY ?auto_93149 ?auto_93150 ?auto_93151 ?auto_93148 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_93168 - OBJ
      ?auto_93169 - OBJ
      ?auto_93170 - OBJ
      ?auto_93167 - LOCATION
    )
    :vars
    (
      ?auto_93175 - OBJ
      ?auto_93173 - LOCATION
      ?auto_93174 - CITY
      ?auto_93171 - LOCATION
      ?auto_93172 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93169 ?auto_93168 ) ) ( not ( = ?auto_93170 ?auto_93168 ) ) ( not ( = ?auto_93170 ?auto_93169 ) ) ( not ( = ?auto_93170 ?auto_93175 ) ) ( IN-CITY ?auto_93173 ?auto_93174 ) ( IN-CITY ?auto_93167 ?auto_93174 ) ( not ( = ?auto_93167 ?auto_93173 ) ) ( OBJ-AT ?auto_93175 ?auto_93167 ) ( OBJ-AT ?auto_93170 ?auto_93173 ) ( not ( = ?auto_93169 ?auto_93175 ) ) ( IN-CITY ?auto_93171 ?auto_93174 ) ( not ( = ?auto_93167 ?auto_93171 ) ) ( not ( = ?auto_93173 ?auto_93171 ) ) ( OBJ-AT ?auto_93169 ?auto_93171 ) ( not ( = ?auto_93168 ?auto_93175 ) ) ( TRUCK-AT ?auto_93172 ?auto_93173 ) ( OBJ-AT ?auto_93168 ?auto_93173 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93175 ?auto_93170 ?auto_93167 )
      ( DELIVER-3PKG-VERIFY ?auto_93168 ?auto_93169 ?auto_93170 ?auto_93167 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_93177 - OBJ
      ?auto_93178 - OBJ
      ?auto_93179 - OBJ
      ?auto_93176 - LOCATION
    )
    :vars
    (
      ?auto_93183 - LOCATION
      ?auto_93184 - CITY
      ?auto_93180 - OBJ
      ?auto_93181 - LOCATION
      ?auto_93182 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93178 ?auto_93177 ) ) ( not ( = ?auto_93179 ?auto_93177 ) ) ( not ( = ?auto_93179 ?auto_93178 ) ) ( IN-CITY ?auto_93183 ?auto_93184 ) ( IN-CITY ?auto_93176 ?auto_93184 ) ( not ( = ?auto_93176 ?auto_93183 ) ) ( OBJ-AT ?auto_93179 ?auto_93176 ) ( OBJ-AT ?auto_93178 ?auto_93183 ) ( not ( = ?auto_93180 ?auto_93179 ) ) ( not ( = ?auto_93178 ?auto_93180 ) ) ( IN-CITY ?auto_93181 ?auto_93184 ) ( not ( = ?auto_93176 ?auto_93181 ) ) ( not ( = ?auto_93183 ?auto_93181 ) ) ( OBJ-AT ?auto_93180 ?auto_93181 ) ( not ( = ?auto_93180 ?auto_93177 ) ) ( TRUCK-AT ?auto_93182 ?auto_93183 ) ( OBJ-AT ?auto_93177 ?auto_93183 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93179 ?auto_93178 ?auto_93176 )
      ( DELIVER-3PKG-VERIFY ?auto_93177 ?auto_93178 ?auto_93179 ?auto_93176 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_93196 - OBJ
      ?auto_93197 - OBJ
      ?auto_93198 - OBJ
      ?auto_93195 - LOCATION
    )
    :vars
    (
      ?auto_93203 - OBJ
      ?auto_93201 - LOCATION
      ?auto_93202 - CITY
      ?auto_93199 - LOCATION
      ?auto_93200 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93197 ?auto_93196 ) ) ( not ( = ?auto_93198 ?auto_93196 ) ) ( not ( = ?auto_93198 ?auto_93197 ) ) ( not ( = ?auto_93197 ?auto_93203 ) ) ( IN-CITY ?auto_93201 ?auto_93202 ) ( IN-CITY ?auto_93195 ?auto_93202 ) ( not ( = ?auto_93195 ?auto_93201 ) ) ( OBJ-AT ?auto_93203 ?auto_93195 ) ( OBJ-AT ?auto_93197 ?auto_93201 ) ( not ( = ?auto_93198 ?auto_93203 ) ) ( IN-CITY ?auto_93199 ?auto_93202 ) ( not ( = ?auto_93195 ?auto_93199 ) ) ( not ( = ?auto_93201 ?auto_93199 ) ) ( OBJ-AT ?auto_93198 ?auto_93199 ) ( not ( = ?auto_93196 ?auto_93203 ) ) ( TRUCK-AT ?auto_93200 ?auto_93201 ) ( OBJ-AT ?auto_93196 ?auto_93201 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93203 ?auto_93197 ?auto_93195 )
      ( DELIVER-3PKG-VERIFY ?auto_93196 ?auto_93197 ?auto_93198 ?auto_93195 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_93215 - OBJ
      ?auto_93216 - OBJ
      ?auto_93217 - OBJ
      ?auto_93214 - LOCATION
    )
    :vars
    (
      ?auto_93221 - LOCATION
      ?auto_93222 - CITY
      ?auto_93218 - LOCATION
      ?auto_93220 - OBJ
      ?auto_93219 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93216 ?auto_93215 ) ) ( not ( = ?auto_93217 ?auto_93215 ) ) ( not ( = ?auto_93217 ?auto_93216 ) ) ( IN-CITY ?auto_93221 ?auto_93222 ) ( IN-CITY ?auto_93214 ?auto_93222 ) ( not ( = ?auto_93214 ?auto_93221 ) ) ( OBJ-AT ?auto_93216 ?auto_93214 ) ( OBJ-AT ?auto_93217 ?auto_93221 ) ( IN-CITY ?auto_93218 ?auto_93222 ) ( not ( = ?auto_93214 ?auto_93218 ) ) ( not ( = ?auto_93221 ?auto_93218 ) ) ( OBJ-AT ?auto_93215 ?auto_93218 ) ( not ( = ?auto_93220 ?auto_93216 ) ) ( not ( = ?auto_93217 ?auto_93220 ) ) ( not ( = ?auto_93215 ?auto_93220 ) ) ( TRUCK-AT ?auto_93219 ?auto_93221 ) ( OBJ-AT ?auto_93220 ?auto_93221 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93216 ?auto_93217 ?auto_93214 )
      ( DELIVER-3PKG-VERIFY ?auto_93215 ?auto_93216 ?auto_93217 ?auto_93214 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_93224 - OBJ
      ?auto_93225 - OBJ
      ?auto_93226 - OBJ
      ?auto_93223 - LOCATION
    )
    :vars
    (
      ?auto_93231 - OBJ
      ?auto_93229 - LOCATION
      ?auto_93230 - CITY
      ?auto_93227 - LOCATION
      ?auto_93228 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93225 ?auto_93224 ) ) ( not ( = ?auto_93226 ?auto_93224 ) ) ( not ( = ?auto_93226 ?auto_93225 ) ) ( not ( = ?auto_93226 ?auto_93231 ) ) ( IN-CITY ?auto_93229 ?auto_93230 ) ( IN-CITY ?auto_93223 ?auto_93230 ) ( not ( = ?auto_93223 ?auto_93229 ) ) ( OBJ-AT ?auto_93231 ?auto_93223 ) ( OBJ-AT ?auto_93226 ?auto_93229 ) ( not ( = ?auto_93224 ?auto_93231 ) ) ( IN-CITY ?auto_93227 ?auto_93230 ) ( not ( = ?auto_93223 ?auto_93227 ) ) ( not ( = ?auto_93229 ?auto_93227 ) ) ( OBJ-AT ?auto_93224 ?auto_93227 ) ( not ( = ?auto_93225 ?auto_93231 ) ) ( TRUCK-AT ?auto_93228 ?auto_93229 ) ( OBJ-AT ?auto_93225 ?auto_93229 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93231 ?auto_93226 ?auto_93223 )
      ( DELIVER-3PKG-VERIFY ?auto_93224 ?auto_93225 ?auto_93226 ?auto_93223 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_93243 - OBJ
      ?auto_93244 - OBJ
      ?auto_93245 - OBJ
      ?auto_93242 - LOCATION
    )
    :vars
    (
      ?auto_93249 - LOCATION
      ?auto_93250 - CITY
      ?auto_93246 - LOCATION
      ?auto_93248 - OBJ
      ?auto_93247 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93244 ?auto_93243 ) ) ( not ( = ?auto_93245 ?auto_93243 ) ) ( not ( = ?auto_93245 ?auto_93244 ) ) ( IN-CITY ?auto_93249 ?auto_93250 ) ( IN-CITY ?auto_93242 ?auto_93250 ) ( not ( = ?auto_93242 ?auto_93249 ) ) ( OBJ-AT ?auto_93245 ?auto_93242 ) ( OBJ-AT ?auto_93244 ?auto_93249 ) ( IN-CITY ?auto_93246 ?auto_93250 ) ( not ( = ?auto_93242 ?auto_93246 ) ) ( not ( = ?auto_93249 ?auto_93246 ) ) ( OBJ-AT ?auto_93243 ?auto_93246 ) ( not ( = ?auto_93248 ?auto_93245 ) ) ( not ( = ?auto_93244 ?auto_93248 ) ) ( not ( = ?auto_93243 ?auto_93248 ) ) ( TRUCK-AT ?auto_93247 ?auto_93249 ) ( OBJ-AT ?auto_93248 ?auto_93249 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93245 ?auto_93244 ?auto_93242 )
      ( DELIVER-3PKG-VERIFY ?auto_93243 ?auto_93244 ?auto_93245 ?auto_93242 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_93252 - OBJ
      ?auto_93253 - OBJ
      ?auto_93254 - OBJ
      ?auto_93251 - LOCATION
    )
    :vars
    (
      ?auto_93259 - OBJ
      ?auto_93257 - LOCATION
      ?auto_93258 - CITY
      ?auto_93255 - LOCATION
      ?auto_93256 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93253 ?auto_93252 ) ) ( not ( = ?auto_93254 ?auto_93252 ) ) ( not ( = ?auto_93254 ?auto_93253 ) ) ( not ( = ?auto_93253 ?auto_93259 ) ) ( IN-CITY ?auto_93257 ?auto_93258 ) ( IN-CITY ?auto_93251 ?auto_93258 ) ( not ( = ?auto_93251 ?auto_93257 ) ) ( OBJ-AT ?auto_93259 ?auto_93251 ) ( OBJ-AT ?auto_93253 ?auto_93257 ) ( not ( = ?auto_93252 ?auto_93259 ) ) ( IN-CITY ?auto_93255 ?auto_93258 ) ( not ( = ?auto_93251 ?auto_93255 ) ) ( not ( = ?auto_93257 ?auto_93255 ) ) ( OBJ-AT ?auto_93252 ?auto_93255 ) ( not ( = ?auto_93254 ?auto_93259 ) ) ( TRUCK-AT ?auto_93256 ?auto_93257 ) ( OBJ-AT ?auto_93254 ?auto_93257 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93259 ?auto_93253 ?auto_93251 )
      ( DELIVER-3PKG-VERIFY ?auto_93252 ?auto_93253 ?auto_93254 ?auto_93251 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_93291 - OBJ
      ?auto_93292 - OBJ
      ?auto_93293 - OBJ
      ?auto_93290 - LOCATION
    )
    :vars
    (
      ?auto_93297 - LOCATION
      ?auto_93298 - CITY
      ?auto_93294 - OBJ
      ?auto_93295 - LOCATION
      ?auto_93296 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93292 ?auto_93291 ) ) ( not ( = ?auto_93293 ?auto_93291 ) ) ( not ( = ?auto_93293 ?auto_93292 ) ) ( IN-CITY ?auto_93297 ?auto_93298 ) ( IN-CITY ?auto_93290 ?auto_93298 ) ( not ( = ?auto_93290 ?auto_93297 ) ) ( OBJ-AT ?auto_93292 ?auto_93290 ) ( OBJ-AT ?auto_93291 ?auto_93297 ) ( not ( = ?auto_93294 ?auto_93292 ) ) ( not ( = ?auto_93291 ?auto_93294 ) ) ( IN-CITY ?auto_93295 ?auto_93298 ) ( not ( = ?auto_93290 ?auto_93295 ) ) ( not ( = ?auto_93297 ?auto_93295 ) ) ( OBJ-AT ?auto_93294 ?auto_93295 ) ( not ( = ?auto_93294 ?auto_93293 ) ) ( TRUCK-AT ?auto_93296 ?auto_93297 ) ( OBJ-AT ?auto_93293 ?auto_93297 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93292 ?auto_93291 ?auto_93290 )
      ( DELIVER-3PKG-VERIFY ?auto_93291 ?auto_93292 ?auto_93293 ?auto_93290 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_93300 - OBJ
      ?auto_93301 - OBJ
      ?auto_93302 - OBJ
      ?auto_93299 - LOCATION
    )
    :vars
    (
      ?auto_93306 - LOCATION
      ?auto_93307 - CITY
      ?auto_93303 - LOCATION
      ?auto_93305 - OBJ
      ?auto_93304 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93301 ?auto_93300 ) ) ( not ( = ?auto_93302 ?auto_93300 ) ) ( not ( = ?auto_93302 ?auto_93301 ) ) ( IN-CITY ?auto_93306 ?auto_93307 ) ( IN-CITY ?auto_93299 ?auto_93307 ) ( not ( = ?auto_93299 ?auto_93306 ) ) ( OBJ-AT ?auto_93301 ?auto_93299 ) ( OBJ-AT ?auto_93300 ?auto_93306 ) ( IN-CITY ?auto_93303 ?auto_93307 ) ( not ( = ?auto_93299 ?auto_93303 ) ) ( not ( = ?auto_93306 ?auto_93303 ) ) ( OBJ-AT ?auto_93302 ?auto_93303 ) ( not ( = ?auto_93305 ?auto_93301 ) ) ( not ( = ?auto_93300 ?auto_93305 ) ) ( not ( = ?auto_93302 ?auto_93305 ) ) ( TRUCK-AT ?auto_93304 ?auto_93306 ) ( OBJ-AT ?auto_93305 ?auto_93306 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93301 ?auto_93300 ?auto_93299 )
      ( DELIVER-3PKG-VERIFY ?auto_93300 ?auto_93301 ?auto_93302 ?auto_93299 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_93319 - OBJ
      ?auto_93320 - OBJ
      ?auto_93321 - OBJ
      ?auto_93318 - LOCATION
    )
    :vars
    (
      ?auto_93325 - LOCATION
      ?auto_93326 - CITY
      ?auto_93322 - OBJ
      ?auto_93323 - LOCATION
      ?auto_93324 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93320 ?auto_93319 ) ) ( not ( = ?auto_93321 ?auto_93319 ) ) ( not ( = ?auto_93321 ?auto_93320 ) ) ( IN-CITY ?auto_93325 ?auto_93326 ) ( IN-CITY ?auto_93318 ?auto_93326 ) ( not ( = ?auto_93318 ?auto_93325 ) ) ( OBJ-AT ?auto_93321 ?auto_93318 ) ( OBJ-AT ?auto_93319 ?auto_93325 ) ( not ( = ?auto_93322 ?auto_93321 ) ) ( not ( = ?auto_93319 ?auto_93322 ) ) ( IN-CITY ?auto_93323 ?auto_93326 ) ( not ( = ?auto_93318 ?auto_93323 ) ) ( not ( = ?auto_93325 ?auto_93323 ) ) ( OBJ-AT ?auto_93322 ?auto_93323 ) ( not ( = ?auto_93322 ?auto_93320 ) ) ( TRUCK-AT ?auto_93324 ?auto_93325 ) ( OBJ-AT ?auto_93320 ?auto_93325 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93321 ?auto_93319 ?auto_93318 )
      ( DELIVER-3PKG-VERIFY ?auto_93319 ?auto_93320 ?auto_93321 ?auto_93318 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_93338 - OBJ
      ?auto_93339 - OBJ
      ?auto_93340 - OBJ
      ?auto_93337 - LOCATION
    )
    :vars
    (
      ?auto_93345 - OBJ
      ?auto_93343 - LOCATION
      ?auto_93344 - CITY
      ?auto_93341 - LOCATION
      ?auto_93342 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93339 ?auto_93338 ) ) ( not ( = ?auto_93340 ?auto_93338 ) ) ( not ( = ?auto_93340 ?auto_93339 ) ) ( not ( = ?auto_93338 ?auto_93345 ) ) ( IN-CITY ?auto_93343 ?auto_93344 ) ( IN-CITY ?auto_93337 ?auto_93344 ) ( not ( = ?auto_93337 ?auto_93343 ) ) ( OBJ-AT ?auto_93345 ?auto_93337 ) ( OBJ-AT ?auto_93338 ?auto_93343 ) ( not ( = ?auto_93340 ?auto_93345 ) ) ( IN-CITY ?auto_93341 ?auto_93344 ) ( not ( = ?auto_93337 ?auto_93341 ) ) ( not ( = ?auto_93343 ?auto_93341 ) ) ( OBJ-AT ?auto_93340 ?auto_93341 ) ( not ( = ?auto_93339 ?auto_93345 ) ) ( TRUCK-AT ?auto_93342 ?auto_93343 ) ( OBJ-AT ?auto_93339 ?auto_93343 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93345 ?auto_93338 ?auto_93337 )
      ( DELIVER-3PKG-VERIFY ?auto_93338 ?auto_93339 ?auto_93340 ?auto_93337 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_93357 - OBJ
      ?auto_93358 - OBJ
      ?auto_93359 - OBJ
      ?auto_93356 - LOCATION
    )
    :vars
    (
      ?auto_93363 - LOCATION
      ?auto_93364 - CITY
      ?auto_93360 - LOCATION
      ?auto_93362 - OBJ
      ?auto_93361 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93358 ?auto_93357 ) ) ( not ( = ?auto_93359 ?auto_93357 ) ) ( not ( = ?auto_93359 ?auto_93358 ) ) ( IN-CITY ?auto_93363 ?auto_93364 ) ( IN-CITY ?auto_93356 ?auto_93364 ) ( not ( = ?auto_93356 ?auto_93363 ) ) ( OBJ-AT ?auto_93359 ?auto_93356 ) ( OBJ-AT ?auto_93357 ?auto_93363 ) ( IN-CITY ?auto_93360 ?auto_93364 ) ( not ( = ?auto_93356 ?auto_93360 ) ) ( not ( = ?auto_93363 ?auto_93360 ) ) ( OBJ-AT ?auto_93358 ?auto_93360 ) ( not ( = ?auto_93362 ?auto_93359 ) ) ( not ( = ?auto_93357 ?auto_93362 ) ) ( not ( = ?auto_93358 ?auto_93362 ) ) ( TRUCK-AT ?auto_93361 ?auto_93363 ) ( OBJ-AT ?auto_93362 ?auto_93363 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93359 ?auto_93357 ?auto_93356 )
      ( DELIVER-3PKG-VERIFY ?auto_93357 ?auto_93358 ?auto_93359 ?auto_93356 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_93366 - OBJ
      ?auto_93367 - OBJ
      ?auto_93368 - OBJ
      ?auto_93365 - LOCATION
    )
    :vars
    (
      ?auto_93373 - OBJ
      ?auto_93371 - LOCATION
      ?auto_93372 - CITY
      ?auto_93369 - LOCATION
      ?auto_93370 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93367 ?auto_93366 ) ) ( not ( = ?auto_93368 ?auto_93366 ) ) ( not ( = ?auto_93368 ?auto_93367 ) ) ( not ( = ?auto_93366 ?auto_93373 ) ) ( IN-CITY ?auto_93371 ?auto_93372 ) ( IN-CITY ?auto_93365 ?auto_93372 ) ( not ( = ?auto_93365 ?auto_93371 ) ) ( OBJ-AT ?auto_93373 ?auto_93365 ) ( OBJ-AT ?auto_93366 ?auto_93371 ) ( not ( = ?auto_93367 ?auto_93373 ) ) ( IN-CITY ?auto_93369 ?auto_93372 ) ( not ( = ?auto_93365 ?auto_93369 ) ) ( not ( = ?auto_93371 ?auto_93369 ) ) ( OBJ-AT ?auto_93367 ?auto_93369 ) ( not ( = ?auto_93368 ?auto_93373 ) ) ( TRUCK-AT ?auto_93370 ?auto_93371 ) ( OBJ-AT ?auto_93368 ?auto_93371 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93373 ?auto_93366 ?auto_93365 )
      ( DELIVER-3PKG-VERIFY ?auto_93366 ?auto_93367 ?auto_93368 ?auto_93365 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_93529 - OBJ
      ?auto_93530 - OBJ
      ?auto_93531 - OBJ
      ?auto_93532 - OBJ
      ?auto_93528 - LOCATION
    )
    :vars
    (
      ?auto_93535 - LOCATION
      ?auto_93536 - CITY
      ?auto_93533 - LOCATION
      ?auto_93534 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93530 ?auto_93529 ) ) ( not ( = ?auto_93531 ?auto_93529 ) ) ( not ( = ?auto_93531 ?auto_93530 ) ) ( not ( = ?auto_93532 ?auto_93529 ) ) ( not ( = ?auto_93532 ?auto_93530 ) ) ( not ( = ?auto_93532 ?auto_93531 ) ) ( IN-CITY ?auto_93535 ?auto_93536 ) ( IN-CITY ?auto_93528 ?auto_93536 ) ( not ( = ?auto_93528 ?auto_93535 ) ) ( OBJ-AT ?auto_93529 ?auto_93528 ) ( OBJ-AT ?auto_93532 ?auto_93535 ) ( IN-CITY ?auto_93533 ?auto_93536 ) ( not ( = ?auto_93528 ?auto_93533 ) ) ( not ( = ?auto_93535 ?auto_93533 ) ) ( OBJ-AT ?auto_93531 ?auto_93533 ) ( TRUCK-AT ?auto_93534 ?auto_93535 ) ( OBJ-AT ?auto_93530 ?auto_93535 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93529 ?auto_93532 ?auto_93528 )
      ( DELIVER-4PKG-VERIFY ?auto_93529 ?auto_93530 ?auto_93531 ?auto_93532 ?auto_93528 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_93558 - OBJ
      ?auto_93559 - OBJ
      ?auto_93560 - OBJ
      ?auto_93561 - OBJ
      ?auto_93557 - LOCATION
    )
    :vars
    (
      ?auto_93564 - LOCATION
      ?auto_93565 - CITY
      ?auto_93562 - LOCATION
      ?auto_93563 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93559 ?auto_93558 ) ) ( not ( = ?auto_93560 ?auto_93558 ) ) ( not ( = ?auto_93560 ?auto_93559 ) ) ( not ( = ?auto_93561 ?auto_93558 ) ) ( not ( = ?auto_93561 ?auto_93559 ) ) ( not ( = ?auto_93561 ?auto_93560 ) ) ( IN-CITY ?auto_93564 ?auto_93565 ) ( IN-CITY ?auto_93557 ?auto_93565 ) ( not ( = ?auto_93557 ?auto_93564 ) ) ( OBJ-AT ?auto_93558 ?auto_93557 ) ( OBJ-AT ?auto_93560 ?auto_93564 ) ( IN-CITY ?auto_93562 ?auto_93565 ) ( not ( = ?auto_93557 ?auto_93562 ) ) ( not ( = ?auto_93564 ?auto_93562 ) ) ( OBJ-AT ?auto_93561 ?auto_93562 ) ( TRUCK-AT ?auto_93563 ?auto_93564 ) ( OBJ-AT ?auto_93559 ?auto_93564 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93558 ?auto_93560 ?auto_93557 )
      ( DELIVER-4PKG-VERIFY ?auto_93558 ?auto_93559 ?auto_93560 ?auto_93561 ?auto_93557 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_93587 - OBJ
      ?auto_93588 - OBJ
      ?auto_93589 - OBJ
      ?auto_93590 - OBJ
      ?auto_93586 - LOCATION
    )
    :vars
    (
      ?auto_93593 - LOCATION
      ?auto_93594 - CITY
      ?auto_93591 - LOCATION
      ?auto_93592 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93588 ?auto_93587 ) ) ( not ( = ?auto_93589 ?auto_93587 ) ) ( not ( = ?auto_93589 ?auto_93588 ) ) ( not ( = ?auto_93590 ?auto_93587 ) ) ( not ( = ?auto_93590 ?auto_93588 ) ) ( not ( = ?auto_93590 ?auto_93589 ) ) ( IN-CITY ?auto_93593 ?auto_93594 ) ( IN-CITY ?auto_93586 ?auto_93594 ) ( not ( = ?auto_93586 ?auto_93593 ) ) ( OBJ-AT ?auto_93587 ?auto_93586 ) ( OBJ-AT ?auto_93590 ?auto_93593 ) ( IN-CITY ?auto_93591 ?auto_93594 ) ( not ( = ?auto_93586 ?auto_93591 ) ) ( not ( = ?auto_93593 ?auto_93591 ) ) ( OBJ-AT ?auto_93588 ?auto_93591 ) ( TRUCK-AT ?auto_93592 ?auto_93593 ) ( OBJ-AT ?auto_93589 ?auto_93593 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93587 ?auto_93590 ?auto_93586 )
      ( DELIVER-4PKG-VERIFY ?auto_93587 ?auto_93588 ?auto_93589 ?auto_93590 ?auto_93586 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_93616 - OBJ
      ?auto_93617 - OBJ
      ?auto_93618 - OBJ
      ?auto_93619 - OBJ
      ?auto_93615 - LOCATION
    )
    :vars
    (
      ?auto_93622 - LOCATION
      ?auto_93623 - CITY
      ?auto_93620 - LOCATION
      ?auto_93621 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93617 ?auto_93616 ) ) ( not ( = ?auto_93618 ?auto_93616 ) ) ( not ( = ?auto_93618 ?auto_93617 ) ) ( not ( = ?auto_93619 ?auto_93616 ) ) ( not ( = ?auto_93619 ?auto_93617 ) ) ( not ( = ?auto_93619 ?auto_93618 ) ) ( IN-CITY ?auto_93622 ?auto_93623 ) ( IN-CITY ?auto_93615 ?auto_93623 ) ( not ( = ?auto_93615 ?auto_93622 ) ) ( OBJ-AT ?auto_93616 ?auto_93615 ) ( OBJ-AT ?auto_93618 ?auto_93622 ) ( IN-CITY ?auto_93620 ?auto_93623 ) ( not ( = ?auto_93615 ?auto_93620 ) ) ( not ( = ?auto_93622 ?auto_93620 ) ) ( OBJ-AT ?auto_93617 ?auto_93620 ) ( TRUCK-AT ?auto_93621 ?auto_93622 ) ( OBJ-AT ?auto_93619 ?auto_93622 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93616 ?auto_93618 ?auto_93615 )
      ( DELIVER-4PKG-VERIFY ?auto_93616 ?auto_93617 ?auto_93618 ?auto_93619 ?auto_93615 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_93707 - OBJ
      ?auto_93708 - OBJ
      ?auto_93709 - OBJ
      ?auto_93710 - OBJ
      ?auto_93706 - LOCATION
    )
    :vars
    (
      ?auto_93713 - LOCATION
      ?auto_93714 - CITY
      ?auto_93711 - LOCATION
      ?auto_93712 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93708 ?auto_93707 ) ) ( not ( = ?auto_93709 ?auto_93707 ) ) ( not ( = ?auto_93709 ?auto_93708 ) ) ( not ( = ?auto_93710 ?auto_93707 ) ) ( not ( = ?auto_93710 ?auto_93708 ) ) ( not ( = ?auto_93710 ?auto_93709 ) ) ( IN-CITY ?auto_93713 ?auto_93714 ) ( IN-CITY ?auto_93706 ?auto_93714 ) ( not ( = ?auto_93706 ?auto_93713 ) ) ( OBJ-AT ?auto_93707 ?auto_93706 ) ( OBJ-AT ?auto_93708 ?auto_93713 ) ( IN-CITY ?auto_93711 ?auto_93714 ) ( not ( = ?auto_93706 ?auto_93711 ) ) ( not ( = ?auto_93713 ?auto_93711 ) ) ( OBJ-AT ?auto_93710 ?auto_93711 ) ( TRUCK-AT ?auto_93712 ?auto_93713 ) ( OBJ-AT ?auto_93709 ?auto_93713 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93707 ?auto_93708 ?auto_93706 )
      ( DELIVER-4PKG-VERIFY ?auto_93707 ?auto_93708 ?auto_93709 ?auto_93710 ?auto_93706 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_93736 - OBJ
      ?auto_93737 - OBJ
      ?auto_93738 - OBJ
      ?auto_93739 - OBJ
      ?auto_93735 - LOCATION
    )
    :vars
    (
      ?auto_93742 - LOCATION
      ?auto_93743 - CITY
      ?auto_93740 - LOCATION
      ?auto_93741 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93737 ?auto_93736 ) ) ( not ( = ?auto_93738 ?auto_93736 ) ) ( not ( = ?auto_93738 ?auto_93737 ) ) ( not ( = ?auto_93739 ?auto_93736 ) ) ( not ( = ?auto_93739 ?auto_93737 ) ) ( not ( = ?auto_93739 ?auto_93738 ) ) ( IN-CITY ?auto_93742 ?auto_93743 ) ( IN-CITY ?auto_93735 ?auto_93743 ) ( not ( = ?auto_93735 ?auto_93742 ) ) ( OBJ-AT ?auto_93736 ?auto_93735 ) ( OBJ-AT ?auto_93737 ?auto_93742 ) ( IN-CITY ?auto_93740 ?auto_93743 ) ( not ( = ?auto_93735 ?auto_93740 ) ) ( not ( = ?auto_93742 ?auto_93740 ) ) ( OBJ-AT ?auto_93738 ?auto_93740 ) ( TRUCK-AT ?auto_93741 ?auto_93742 ) ( OBJ-AT ?auto_93739 ?auto_93742 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93736 ?auto_93737 ?auto_93735 )
      ( DELIVER-4PKG-VERIFY ?auto_93736 ?auto_93737 ?auto_93738 ?auto_93739 ?auto_93735 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_93827 - OBJ
      ?auto_93828 - OBJ
      ?auto_93829 - OBJ
      ?auto_93830 - OBJ
      ?auto_93826 - LOCATION
    )
    :vars
    (
      ?auto_93833 - LOCATION
      ?auto_93834 - CITY
      ?auto_93831 - LOCATION
      ?auto_93832 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93828 ?auto_93827 ) ) ( not ( = ?auto_93829 ?auto_93827 ) ) ( not ( = ?auto_93829 ?auto_93828 ) ) ( not ( = ?auto_93830 ?auto_93827 ) ) ( not ( = ?auto_93830 ?auto_93828 ) ) ( not ( = ?auto_93830 ?auto_93829 ) ) ( IN-CITY ?auto_93833 ?auto_93834 ) ( IN-CITY ?auto_93826 ?auto_93834 ) ( not ( = ?auto_93826 ?auto_93833 ) ) ( OBJ-AT ?auto_93828 ?auto_93826 ) ( OBJ-AT ?auto_93830 ?auto_93833 ) ( IN-CITY ?auto_93831 ?auto_93834 ) ( not ( = ?auto_93826 ?auto_93831 ) ) ( not ( = ?auto_93833 ?auto_93831 ) ) ( OBJ-AT ?auto_93829 ?auto_93831 ) ( TRUCK-AT ?auto_93832 ?auto_93833 ) ( OBJ-AT ?auto_93827 ?auto_93833 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93828 ?auto_93830 ?auto_93826 )
      ( DELIVER-4PKG-VERIFY ?auto_93827 ?auto_93828 ?auto_93829 ?auto_93830 ?auto_93826 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_93856 - OBJ
      ?auto_93857 - OBJ
      ?auto_93858 - OBJ
      ?auto_93859 - OBJ
      ?auto_93855 - LOCATION
    )
    :vars
    (
      ?auto_93862 - LOCATION
      ?auto_93863 - CITY
      ?auto_93860 - LOCATION
      ?auto_93861 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93857 ?auto_93856 ) ) ( not ( = ?auto_93858 ?auto_93856 ) ) ( not ( = ?auto_93858 ?auto_93857 ) ) ( not ( = ?auto_93859 ?auto_93856 ) ) ( not ( = ?auto_93859 ?auto_93857 ) ) ( not ( = ?auto_93859 ?auto_93858 ) ) ( IN-CITY ?auto_93862 ?auto_93863 ) ( IN-CITY ?auto_93855 ?auto_93863 ) ( not ( = ?auto_93855 ?auto_93862 ) ) ( OBJ-AT ?auto_93857 ?auto_93855 ) ( OBJ-AT ?auto_93858 ?auto_93862 ) ( IN-CITY ?auto_93860 ?auto_93863 ) ( not ( = ?auto_93855 ?auto_93860 ) ) ( not ( = ?auto_93862 ?auto_93860 ) ) ( OBJ-AT ?auto_93859 ?auto_93860 ) ( TRUCK-AT ?auto_93861 ?auto_93862 ) ( OBJ-AT ?auto_93856 ?auto_93862 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93857 ?auto_93858 ?auto_93855 )
      ( DELIVER-4PKG-VERIFY ?auto_93856 ?auto_93857 ?auto_93858 ?auto_93859 ?auto_93855 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_93948 - OBJ
      ?auto_93949 - OBJ
      ?auto_93950 - OBJ
      ?auto_93951 - OBJ
      ?auto_93947 - LOCATION
    )
    :vars
    (
      ?auto_93954 - LOCATION
      ?auto_93955 - CITY
      ?auto_93952 - LOCATION
      ?auto_93953 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93949 ?auto_93948 ) ) ( not ( = ?auto_93950 ?auto_93948 ) ) ( not ( = ?auto_93950 ?auto_93949 ) ) ( not ( = ?auto_93951 ?auto_93948 ) ) ( not ( = ?auto_93951 ?auto_93949 ) ) ( not ( = ?auto_93951 ?auto_93950 ) ) ( IN-CITY ?auto_93954 ?auto_93955 ) ( IN-CITY ?auto_93947 ?auto_93955 ) ( not ( = ?auto_93947 ?auto_93954 ) ) ( OBJ-AT ?auto_93950 ?auto_93947 ) ( OBJ-AT ?auto_93951 ?auto_93954 ) ( IN-CITY ?auto_93952 ?auto_93955 ) ( not ( = ?auto_93947 ?auto_93952 ) ) ( not ( = ?auto_93954 ?auto_93952 ) ) ( OBJ-AT ?auto_93949 ?auto_93952 ) ( TRUCK-AT ?auto_93953 ?auto_93954 ) ( OBJ-AT ?auto_93948 ?auto_93954 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93950 ?auto_93951 ?auto_93947 )
      ( DELIVER-4PKG-VERIFY ?auto_93948 ?auto_93949 ?auto_93950 ?auto_93951 ?auto_93947 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_93977 - OBJ
      ?auto_93978 - OBJ
      ?auto_93979 - OBJ
      ?auto_93980 - OBJ
      ?auto_93976 - LOCATION
    )
    :vars
    (
      ?auto_93983 - LOCATION
      ?auto_93984 - CITY
      ?auto_93981 - LOCATION
      ?auto_93982 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_93978 ?auto_93977 ) ) ( not ( = ?auto_93979 ?auto_93977 ) ) ( not ( = ?auto_93979 ?auto_93978 ) ) ( not ( = ?auto_93980 ?auto_93977 ) ) ( not ( = ?auto_93980 ?auto_93978 ) ) ( not ( = ?auto_93980 ?auto_93979 ) ) ( IN-CITY ?auto_93983 ?auto_93984 ) ( IN-CITY ?auto_93976 ?auto_93984 ) ( not ( = ?auto_93976 ?auto_93983 ) ) ( OBJ-AT ?auto_93980 ?auto_93976 ) ( OBJ-AT ?auto_93979 ?auto_93983 ) ( IN-CITY ?auto_93981 ?auto_93984 ) ( not ( = ?auto_93976 ?auto_93981 ) ) ( not ( = ?auto_93983 ?auto_93981 ) ) ( OBJ-AT ?auto_93978 ?auto_93981 ) ( TRUCK-AT ?auto_93982 ?auto_93983 ) ( OBJ-AT ?auto_93977 ?auto_93983 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_93980 ?auto_93979 ?auto_93976 )
      ( DELIVER-4PKG-VERIFY ?auto_93977 ?auto_93978 ?auto_93979 ?auto_93980 ?auto_93976 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_94036 - OBJ
      ?auto_94037 - OBJ
      ?auto_94038 - OBJ
      ?auto_94039 - OBJ
      ?auto_94035 - LOCATION
    )
    :vars
    (
      ?auto_94042 - LOCATION
      ?auto_94043 - CITY
      ?auto_94040 - LOCATION
      ?auto_94041 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_94037 ?auto_94036 ) ) ( not ( = ?auto_94038 ?auto_94036 ) ) ( not ( = ?auto_94038 ?auto_94037 ) ) ( not ( = ?auto_94039 ?auto_94036 ) ) ( not ( = ?auto_94039 ?auto_94037 ) ) ( not ( = ?auto_94039 ?auto_94038 ) ) ( IN-CITY ?auto_94042 ?auto_94043 ) ( IN-CITY ?auto_94035 ?auto_94043 ) ( not ( = ?auto_94035 ?auto_94042 ) ) ( OBJ-AT ?auto_94038 ?auto_94035 ) ( OBJ-AT ?auto_94037 ?auto_94042 ) ( IN-CITY ?auto_94040 ?auto_94043 ) ( not ( = ?auto_94035 ?auto_94040 ) ) ( not ( = ?auto_94042 ?auto_94040 ) ) ( OBJ-AT ?auto_94039 ?auto_94040 ) ( TRUCK-AT ?auto_94041 ?auto_94042 ) ( OBJ-AT ?auto_94036 ?auto_94042 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_94038 ?auto_94037 ?auto_94035 )
      ( DELIVER-4PKG-VERIFY ?auto_94036 ?auto_94037 ?auto_94038 ?auto_94039 ?auto_94035 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_94097 - OBJ
      ?auto_94098 - OBJ
      ?auto_94099 - OBJ
      ?auto_94100 - OBJ
      ?auto_94096 - LOCATION
    )
    :vars
    (
      ?auto_94103 - LOCATION
      ?auto_94104 - CITY
      ?auto_94101 - LOCATION
      ?auto_94102 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_94098 ?auto_94097 ) ) ( not ( = ?auto_94099 ?auto_94097 ) ) ( not ( = ?auto_94099 ?auto_94098 ) ) ( not ( = ?auto_94100 ?auto_94097 ) ) ( not ( = ?auto_94100 ?auto_94098 ) ) ( not ( = ?auto_94100 ?auto_94099 ) ) ( IN-CITY ?auto_94103 ?auto_94104 ) ( IN-CITY ?auto_94096 ?auto_94104 ) ( not ( = ?auto_94096 ?auto_94103 ) ) ( OBJ-AT ?auto_94100 ?auto_94096 ) ( OBJ-AT ?auto_94098 ?auto_94103 ) ( IN-CITY ?auto_94101 ?auto_94104 ) ( not ( = ?auto_94096 ?auto_94101 ) ) ( not ( = ?auto_94103 ?auto_94101 ) ) ( OBJ-AT ?auto_94099 ?auto_94101 ) ( TRUCK-AT ?auto_94102 ?auto_94103 ) ( OBJ-AT ?auto_94097 ?auto_94103 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_94100 ?auto_94098 ?auto_94096 )
      ( DELIVER-4PKG-VERIFY ?auto_94097 ?auto_94098 ?auto_94099 ?auto_94100 ?auto_94096 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_94188 - OBJ
      ?auto_94189 - OBJ
      ?auto_94190 - OBJ
      ?auto_94191 - OBJ
      ?auto_94187 - LOCATION
    )
    :vars
    (
      ?auto_94194 - LOCATION
      ?auto_94195 - CITY
      ?auto_94192 - LOCATION
      ?auto_94193 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_94189 ?auto_94188 ) ) ( not ( = ?auto_94190 ?auto_94188 ) ) ( not ( = ?auto_94190 ?auto_94189 ) ) ( not ( = ?auto_94191 ?auto_94188 ) ) ( not ( = ?auto_94191 ?auto_94189 ) ) ( not ( = ?auto_94191 ?auto_94190 ) ) ( IN-CITY ?auto_94194 ?auto_94195 ) ( IN-CITY ?auto_94187 ?auto_94195 ) ( not ( = ?auto_94187 ?auto_94194 ) ) ( OBJ-AT ?auto_94189 ?auto_94187 ) ( OBJ-AT ?auto_94191 ?auto_94194 ) ( IN-CITY ?auto_94192 ?auto_94195 ) ( not ( = ?auto_94187 ?auto_94192 ) ) ( not ( = ?auto_94194 ?auto_94192 ) ) ( OBJ-AT ?auto_94188 ?auto_94192 ) ( TRUCK-AT ?auto_94193 ?auto_94194 ) ( OBJ-AT ?auto_94190 ?auto_94194 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_94189 ?auto_94191 ?auto_94187 )
      ( DELIVER-4PKG-VERIFY ?auto_94188 ?auto_94189 ?auto_94190 ?auto_94191 ?auto_94187 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_94217 - OBJ
      ?auto_94218 - OBJ
      ?auto_94219 - OBJ
      ?auto_94220 - OBJ
      ?auto_94216 - LOCATION
    )
    :vars
    (
      ?auto_94223 - LOCATION
      ?auto_94224 - CITY
      ?auto_94221 - LOCATION
      ?auto_94222 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_94218 ?auto_94217 ) ) ( not ( = ?auto_94219 ?auto_94217 ) ) ( not ( = ?auto_94219 ?auto_94218 ) ) ( not ( = ?auto_94220 ?auto_94217 ) ) ( not ( = ?auto_94220 ?auto_94218 ) ) ( not ( = ?auto_94220 ?auto_94219 ) ) ( IN-CITY ?auto_94223 ?auto_94224 ) ( IN-CITY ?auto_94216 ?auto_94224 ) ( not ( = ?auto_94216 ?auto_94223 ) ) ( OBJ-AT ?auto_94218 ?auto_94216 ) ( OBJ-AT ?auto_94219 ?auto_94223 ) ( IN-CITY ?auto_94221 ?auto_94224 ) ( not ( = ?auto_94216 ?auto_94221 ) ) ( not ( = ?auto_94223 ?auto_94221 ) ) ( OBJ-AT ?auto_94217 ?auto_94221 ) ( TRUCK-AT ?auto_94222 ?auto_94223 ) ( OBJ-AT ?auto_94220 ?auto_94223 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_94218 ?auto_94219 ?auto_94216 )
      ( DELIVER-4PKG-VERIFY ?auto_94217 ?auto_94218 ?auto_94219 ?auto_94220 ?auto_94216 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_94246 - OBJ
      ?auto_94247 - OBJ
      ?auto_94248 - OBJ
      ?auto_94249 - OBJ
      ?auto_94245 - LOCATION
    )
    :vars
    (
      ?auto_94252 - LOCATION
      ?auto_94253 - CITY
      ?auto_94250 - LOCATION
      ?auto_94251 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_94247 ?auto_94246 ) ) ( not ( = ?auto_94248 ?auto_94246 ) ) ( not ( = ?auto_94248 ?auto_94247 ) ) ( not ( = ?auto_94249 ?auto_94246 ) ) ( not ( = ?auto_94249 ?auto_94247 ) ) ( not ( = ?auto_94249 ?auto_94248 ) ) ( IN-CITY ?auto_94252 ?auto_94253 ) ( IN-CITY ?auto_94245 ?auto_94253 ) ( not ( = ?auto_94245 ?auto_94252 ) ) ( OBJ-AT ?auto_94248 ?auto_94245 ) ( OBJ-AT ?auto_94249 ?auto_94252 ) ( IN-CITY ?auto_94250 ?auto_94253 ) ( not ( = ?auto_94245 ?auto_94250 ) ) ( not ( = ?auto_94252 ?auto_94250 ) ) ( OBJ-AT ?auto_94246 ?auto_94250 ) ( TRUCK-AT ?auto_94251 ?auto_94252 ) ( OBJ-AT ?auto_94247 ?auto_94252 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_94248 ?auto_94249 ?auto_94245 )
      ( DELIVER-4PKG-VERIFY ?auto_94246 ?auto_94247 ?auto_94248 ?auto_94249 ?auto_94245 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_94275 - OBJ
      ?auto_94276 - OBJ
      ?auto_94277 - OBJ
      ?auto_94278 - OBJ
      ?auto_94274 - LOCATION
    )
    :vars
    (
      ?auto_94281 - LOCATION
      ?auto_94282 - CITY
      ?auto_94279 - LOCATION
      ?auto_94280 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_94276 ?auto_94275 ) ) ( not ( = ?auto_94277 ?auto_94275 ) ) ( not ( = ?auto_94277 ?auto_94276 ) ) ( not ( = ?auto_94278 ?auto_94275 ) ) ( not ( = ?auto_94278 ?auto_94276 ) ) ( not ( = ?auto_94278 ?auto_94277 ) ) ( IN-CITY ?auto_94281 ?auto_94282 ) ( IN-CITY ?auto_94274 ?auto_94282 ) ( not ( = ?auto_94274 ?auto_94281 ) ) ( OBJ-AT ?auto_94278 ?auto_94274 ) ( OBJ-AT ?auto_94277 ?auto_94281 ) ( IN-CITY ?auto_94279 ?auto_94282 ) ( not ( = ?auto_94274 ?auto_94279 ) ) ( not ( = ?auto_94281 ?auto_94279 ) ) ( OBJ-AT ?auto_94275 ?auto_94279 ) ( TRUCK-AT ?auto_94280 ?auto_94281 ) ( OBJ-AT ?auto_94276 ?auto_94281 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_94278 ?auto_94277 ?auto_94274 )
      ( DELIVER-4PKG-VERIFY ?auto_94275 ?auto_94276 ?auto_94277 ?auto_94278 ?auto_94274 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_94397 - OBJ
      ?auto_94398 - OBJ
      ?auto_94399 - OBJ
      ?auto_94400 - OBJ
      ?auto_94396 - LOCATION
    )
    :vars
    (
      ?auto_94403 - LOCATION
      ?auto_94404 - CITY
      ?auto_94401 - LOCATION
      ?auto_94402 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_94398 ?auto_94397 ) ) ( not ( = ?auto_94399 ?auto_94397 ) ) ( not ( = ?auto_94399 ?auto_94398 ) ) ( not ( = ?auto_94400 ?auto_94397 ) ) ( not ( = ?auto_94400 ?auto_94398 ) ) ( not ( = ?auto_94400 ?auto_94399 ) ) ( IN-CITY ?auto_94403 ?auto_94404 ) ( IN-CITY ?auto_94396 ?auto_94404 ) ( not ( = ?auto_94396 ?auto_94403 ) ) ( OBJ-AT ?auto_94399 ?auto_94396 ) ( OBJ-AT ?auto_94398 ?auto_94403 ) ( IN-CITY ?auto_94401 ?auto_94404 ) ( not ( = ?auto_94396 ?auto_94401 ) ) ( not ( = ?auto_94403 ?auto_94401 ) ) ( OBJ-AT ?auto_94397 ?auto_94401 ) ( TRUCK-AT ?auto_94402 ?auto_94403 ) ( OBJ-AT ?auto_94400 ?auto_94403 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_94399 ?auto_94398 ?auto_94396 )
      ( DELIVER-4PKG-VERIFY ?auto_94397 ?auto_94398 ?auto_94399 ?auto_94400 ?auto_94396 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_94426 - OBJ
      ?auto_94427 - OBJ
      ?auto_94428 - OBJ
      ?auto_94429 - OBJ
      ?auto_94425 - LOCATION
    )
    :vars
    (
      ?auto_94432 - LOCATION
      ?auto_94433 - CITY
      ?auto_94430 - LOCATION
      ?auto_94431 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_94427 ?auto_94426 ) ) ( not ( = ?auto_94428 ?auto_94426 ) ) ( not ( = ?auto_94428 ?auto_94427 ) ) ( not ( = ?auto_94429 ?auto_94426 ) ) ( not ( = ?auto_94429 ?auto_94427 ) ) ( not ( = ?auto_94429 ?auto_94428 ) ) ( IN-CITY ?auto_94432 ?auto_94433 ) ( IN-CITY ?auto_94425 ?auto_94433 ) ( not ( = ?auto_94425 ?auto_94432 ) ) ( OBJ-AT ?auto_94429 ?auto_94425 ) ( OBJ-AT ?auto_94427 ?auto_94432 ) ( IN-CITY ?auto_94430 ?auto_94433 ) ( not ( = ?auto_94425 ?auto_94430 ) ) ( not ( = ?auto_94432 ?auto_94430 ) ) ( OBJ-AT ?auto_94426 ?auto_94430 ) ( TRUCK-AT ?auto_94431 ?auto_94432 ) ( OBJ-AT ?auto_94428 ?auto_94432 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_94429 ?auto_94427 ?auto_94425 )
      ( DELIVER-4PKG-VERIFY ?auto_94426 ?auto_94427 ?auto_94428 ?auto_94429 ?auto_94425 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_94611 - OBJ
      ?auto_94612 - OBJ
      ?auto_94613 - OBJ
      ?auto_94614 - OBJ
      ?auto_94610 - LOCATION
    )
    :vars
    (
      ?auto_94617 - LOCATION
      ?auto_94618 - CITY
      ?auto_94615 - LOCATION
      ?auto_94616 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_94612 ?auto_94611 ) ) ( not ( = ?auto_94613 ?auto_94611 ) ) ( not ( = ?auto_94613 ?auto_94612 ) ) ( not ( = ?auto_94614 ?auto_94611 ) ) ( not ( = ?auto_94614 ?auto_94612 ) ) ( not ( = ?auto_94614 ?auto_94613 ) ) ( IN-CITY ?auto_94617 ?auto_94618 ) ( IN-CITY ?auto_94610 ?auto_94618 ) ( not ( = ?auto_94610 ?auto_94617 ) ) ( OBJ-AT ?auto_94612 ?auto_94610 ) ( OBJ-AT ?auto_94611 ?auto_94617 ) ( IN-CITY ?auto_94615 ?auto_94618 ) ( not ( = ?auto_94610 ?auto_94615 ) ) ( not ( = ?auto_94617 ?auto_94615 ) ) ( OBJ-AT ?auto_94614 ?auto_94615 ) ( TRUCK-AT ?auto_94616 ?auto_94617 ) ( OBJ-AT ?auto_94613 ?auto_94617 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_94612 ?auto_94611 ?auto_94610 )
      ( DELIVER-4PKG-VERIFY ?auto_94611 ?auto_94612 ?auto_94613 ?auto_94614 ?auto_94610 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_94640 - OBJ
      ?auto_94641 - OBJ
      ?auto_94642 - OBJ
      ?auto_94643 - OBJ
      ?auto_94639 - LOCATION
    )
    :vars
    (
      ?auto_94646 - LOCATION
      ?auto_94647 - CITY
      ?auto_94644 - LOCATION
      ?auto_94645 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_94641 ?auto_94640 ) ) ( not ( = ?auto_94642 ?auto_94640 ) ) ( not ( = ?auto_94642 ?auto_94641 ) ) ( not ( = ?auto_94643 ?auto_94640 ) ) ( not ( = ?auto_94643 ?auto_94641 ) ) ( not ( = ?auto_94643 ?auto_94642 ) ) ( IN-CITY ?auto_94646 ?auto_94647 ) ( IN-CITY ?auto_94639 ?auto_94647 ) ( not ( = ?auto_94639 ?auto_94646 ) ) ( OBJ-AT ?auto_94641 ?auto_94639 ) ( OBJ-AT ?auto_94640 ?auto_94646 ) ( IN-CITY ?auto_94644 ?auto_94647 ) ( not ( = ?auto_94639 ?auto_94644 ) ) ( not ( = ?auto_94646 ?auto_94644 ) ) ( OBJ-AT ?auto_94642 ?auto_94644 ) ( TRUCK-AT ?auto_94645 ?auto_94646 ) ( OBJ-AT ?auto_94643 ?auto_94646 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_94641 ?auto_94640 ?auto_94639 )
      ( DELIVER-4PKG-VERIFY ?auto_94640 ?auto_94641 ?auto_94642 ?auto_94643 ?auto_94639 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_94731 - OBJ
      ?auto_94732 - OBJ
      ?auto_94733 - OBJ
      ?auto_94734 - OBJ
      ?auto_94730 - LOCATION
    )
    :vars
    (
      ?auto_94737 - LOCATION
      ?auto_94738 - CITY
      ?auto_94735 - LOCATION
      ?auto_94736 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_94732 ?auto_94731 ) ) ( not ( = ?auto_94733 ?auto_94731 ) ) ( not ( = ?auto_94733 ?auto_94732 ) ) ( not ( = ?auto_94734 ?auto_94731 ) ) ( not ( = ?auto_94734 ?auto_94732 ) ) ( not ( = ?auto_94734 ?auto_94733 ) ) ( IN-CITY ?auto_94737 ?auto_94738 ) ( IN-CITY ?auto_94730 ?auto_94738 ) ( not ( = ?auto_94730 ?auto_94737 ) ) ( OBJ-AT ?auto_94733 ?auto_94730 ) ( OBJ-AT ?auto_94731 ?auto_94737 ) ( IN-CITY ?auto_94735 ?auto_94738 ) ( not ( = ?auto_94730 ?auto_94735 ) ) ( not ( = ?auto_94737 ?auto_94735 ) ) ( OBJ-AT ?auto_94734 ?auto_94735 ) ( TRUCK-AT ?auto_94736 ?auto_94737 ) ( OBJ-AT ?auto_94732 ?auto_94737 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_94733 ?auto_94731 ?auto_94730 )
      ( DELIVER-4PKG-VERIFY ?auto_94731 ?auto_94732 ?auto_94733 ?auto_94734 ?auto_94730 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_94792 - OBJ
      ?auto_94793 - OBJ
      ?auto_94794 - OBJ
      ?auto_94795 - OBJ
      ?auto_94791 - LOCATION
    )
    :vars
    (
      ?auto_94798 - LOCATION
      ?auto_94799 - CITY
      ?auto_94796 - LOCATION
      ?auto_94797 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_94793 ?auto_94792 ) ) ( not ( = ?auto_94794 ?auto_94792 ) ) ( not ( = ?auto_94794 ?auto_94793 ) ) ( not ( = ?auto_94795 ?auto_94792 ) ) ( not ( = ?auto_94795 ?auto_94793 ) ) ( not ( = ?auto_94795 ?auto_94794 ) ) ( IN-CITY ?auto_94798 ?auto_94799 ) ( IN-CITY ?auto_94791 ?auto_94799 ) ( not ( = ?auto_94791 ?auto_94798 ) ) ( OBJ-AT ?auto_94795 ?auto_94791 ) ( OBJ-AT ?auto_94792 ?auto_94798 ) ( IN-CITY ?auto_94796 ?auto_94799 ) ( not ( = ?auto_94791 ?auto_94796 ) ) ( not ( = ?auto_94798 ?auto_94796 ) ) ( OBJ-AT ?auto_94794 ?auto_94796 ) ( TRUCK-AT ?auto_94797 ?auto_94798 ) ( OBJ-AT ?auto_94793 ?auto_94798 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_94795 ?auto_94792 ?auto_94791 )
      ( DELIVER-4PKG-VERIFY ?auto_94792 ?auto_94793 ?auto_94794 ?auto_94795 ?auto_94791 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_94883 - OBJ
      ?auto_94884 - OBJ
      ?auto_94885 - OBJ
      ?auto_94886 - OBJ
      ?auto_94882 - LOCATION
    )
    :vars
    (
      ?auto_94889 - LOCATION
      ?auto_94890 - CITY
      ?auto_94887 - LOCATION
      ?auto_94888 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_94884 ?auto_94883 ) ) ( not ( = ?auto_94885 ?auto_94883 ) ) ( not ( = ?auto_94885 ?auto_94884 ) ) ( not ( = ?auto_94886 ?auto_94883 ) ) ( not ( = ?auto_94886 ?auto_94884 ) ) ( not ( = ?auto_94886 ?auto_94885 ) ) ( IN-CITY ?auto_94889 ?auto_94890 ) ( IN-CITY ?auto_94882 ?auto_94890 ) ( not ( = ?auto_94882 ?auto_94889 ) ) ( OBJ-AT ?auto_94885 ?auto_94882 ) ( OBJ-AT ?auto_94883 ?auto_94889 ) ( IN-CITY ?auto_94887 ?auto_94890 ) ( not ( = ?auto_94882 ?auto_94887 ) ) ( not ( = ?auto_94889 ?auto_94887 ) ) ( OBJ-AT ?auto_94884 ?auto_94887 ) ( TRUCK-AT ?auto_94888 ?auto_94889 ) ( OBJ-AT ?auto_94886 ?auto_94889 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_94885 ?auto_94883 ?auto_94882 )
      ( DELIVER-4PKG-VERIFY ?auto_94883 ?auto_94884 ?auto_94885 ?auto_94886 ?auto_94882 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_94912 - OBJ
      ?auto_94913 - OBJ
      ?auto_94914 - OBJ
      ?auto_94915 - OBJ
      ?auto_94911 - LOCATION
    )
    :vars
    (
      ?auto_94918 - LOCATION
      ?auto_94919 - CITY
      ?auto_94916 - LOCATION
      ?auto_94917 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_94913 ?auto_94912 ) ) ( not ( = ?auto_94914 ?auto_94912 ) ) ( not ( = ?auto_94914 ?auto_94913 ) ) ( not ( = ?auto_94915 ?auto_94912 ) ) ( not ( = ?auto_94915 ?auto_94913 ) ) ( not ( = ?auto_94915 ?auto_94914 ) ) ( IN-CITY ?auto_94918 ?auto_94919 ) ( IN-CITY ?auto_94911 ?auto_94919 ) ( not ( = ?auto_94911 ?auto_94918 ) ) ( OBJ-AT ?auto_94915 ?auto_94911 ) ( OBJ-AT ?auto_94912 ?auto_94918 ) ( IN-CITY ?auto_94916 ?auto_94919 ) ( not ( = ?auto_94911 ?auto_94916 ) ) ( not ( = ?auto_94918 ?auto_94916 ) ) ( OBJ-AT ?auto_94913 ?auto_94916 ) ( TRUCK-AT ?auto_94917 ?auto_94918 ) ( OBJ-AT ?auto_94914 ?auto_94918 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_94915 ?auto_94912 ?auto_94911 )
      ( DELIVER-4PKG-VERIFY ?auto_94912 ?auto_94913 ?auto_94914 ?auto_94915 ?auto_94911 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95206 - OBJ
      ?auto_95205 - LOCATION
    )
    :vars
    (
      ?auto_95213 - OBJ
      ?auto_95211 - LOCATION
      ?auto_95212 - CITY
      ?auto_95207 - OBJ
      ?auto_95208 - LOCATION
      ?auto_95210 - OBJ
      ?auto_95209 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95206 ?auto_95213 ) ) ( IN-CITY ?auto_95211 ?auto_95212 ) ( IN-CITY ?auto_95205 ?auto_95212 ) ( not ( = ?auto_95205 ?auto_95211 ) ) ( OBJ-AT ?auto_95213 ?auto_95205 ) ( OBJ-AT ?auto_95206 ?auto_95211 ) ( not ( = ?auto_95207 ?auto_95213 ) ) ( not ( = ?auto_95206 ?auto_95207 ) ) ( IN-CITY ?auto_95208 ?auto_95212 ) ( not ( = ?auto_95205 ?auto_95208 ) ) ( not ( = ?auto_95211 ?auto_95208 ) ) ( OBJ-AT ?auto_95207 ?auto_95208 ) ( not ( = ?auto_95210 ?auto_95213 ) ) ( not ( = ?auto_95206 ?auto_95210 ) ) ( not ( = ?auto_95207 ?auto_95210 ) ) ( OBJ-AT ?auto_95210 ?auto_95211 ) ( TRUCK-AT ?auto_95209 ?auto_95205 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_95209 ?auto_95205 ?auto_95211 ?auto_95212 )
      ( DELIVER-2PKG ?auto_95213 ?auto_95206 ?auto_95205 )
      ( DELIVER-1PKG-VERIFY ?auto_95206 ?auto_95205 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95215 - OBJ
      ?auto_95216 - OBJ
      ?auto_95214 - LOCATION
    )
    :vars
    (
      ?auto_95217 - LOCATION
      ?auto_95221 - CITY
      ?auto_95220 - OBJ
      ?auto_95218 - LOCATION
      ?auto_95222 - OBJ
      ?auto_95219 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95216 ?auto_95215 ) ) ( IN-CITY ?auto_95217 ?auto_95221 ) ( IN-CITY ?auto_95214 ?auto_95221 ) ( not ( = ?auto_95214 ?auto_95217 ) ) ( OBJ-AT ?auto_95215 ?auto_95214 ) ( OBJ-AT ?auto_95216 ?auto_95217 ) ( not ( = ?auto_95220 ?auto_95215 ) ) ( not ( = ?auto_95216 ?auto_95220 ) ) ( IN-CITY ?auto_95218 ?auto_95221 ) ( not ( = ?auto_95214 ?auto_95218 ) ) ( not ( = ?auto_95217 ?auto_95218 ) ) ( OBJ-AT ?auto_95220 ?auto_95218 ) ( not ( = ?auto_95222 ?auto_95215 ) ) ( not ( = ?auto_95216 ?auto_95222 ) ) ( not ( = ?auto_95220 ?auto_95222 ) ) ( OBJ-AT ?auto_95222 ?auto_95217 ) ( TRUCK-AT ?auto_95219 ?auto_95214 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95216 ?auto_95214 )
      ( DELIVER-2PKG-VERIFY ?auto_95215 ?auto_95216 ?auto_95214 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95224 - OBJ
      ?auto_95225 - OBJ
      ?auto_95223 - LOCATION
    )
    :vars
    (
      ?auto_95231 - OBJ
      ?auto_95228 - LOCATION
      ?auto_95230 - CITY
      ?auto_95227 - OBJ
      ?auto_95226 - LOCATION
      ?auto_95229 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95225 ?auto_95224 ) ) ( not ( = ?auto_95225 ?auto_95231 ) ) ( IN-CITY ?auto_95228 ?auto_95230 ) ( IN-CITY ?auto_95223 ?auto_95230 ) ( not ( = ?auto_95223 ?auto_95228 ) ) ( OBJ-AT ?auto_95231 ?auto_95223 ) ( OBJ-AT ?auto_95225 ?auto_95228 ) ( not ( = ?auto_95227 ?auto_95231 ) ) ( not ( = ?auto_95225 ?auto_95227 ) ) ( IN-CITY ?auto_95226 ?auto_95230 ) ( not ( = ?auto_95223 ?auto_95226 ) ) ( not ( = ?auto_95228 ?auto_95226 ) ) ( OBJ-AT ?auto_95227 ?auto_95226 ) ( not ( = ?auto_95224 ?auto_95231 ) ) ( not ( = ?auto_95227 ?auto_95224 ) ) ( OBJ-AT ?auto_95224 ?auto_95228 ) ( TRUCK-AT ?auto_95229 ?auto_95223 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95231 ?auto_95225 ?auto_95223 )
      ( DELIVER-2PKG-VERIFY ?auto_95224 ?auto_95225 ?auto_95223 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95233 - OBJ
      ?auto_95234 - OBJ
      ?auto_95232 - LOCATION
    )
    :vars
    (
      ?auto_95240 - OBJ
      ?auto_95237 - LOCATION
      ?auto_95239 - CITY
      ?auto_95236 - LOCATION
      ?auto_95235 - OBJ
      ?auto_95238 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95234 ?auto_95233 ) ) ( not ( = ?auto_95234 ?auto_95240 ) ) ( IN-CITY ?auto_95237 ?auto_95239 ) ( IN-CITY ?auto_95232 ?auto_95239 ) ( not ( = ?auto_95232 ?auto_95237 ) ) ( OBJ-AT ?auto_95240 ?auto_95232 ) ( OBJ-AT ?auto_95234 ?auto_95237 ) ( not ( = ?auto_95233 ?auto_95240 ) ) ( IN-CITY ?auto_95236 ?auto_95239 ) ( not ( = ?auto_95232 ?auto_95236 ) ) ( not ( = ?auto_95237 ?auto_95236 ) ) ( OBJ-AT ?auto_95233 ?auto_95236 ) ( not ( = ?auto_95235 ?auto_95240 ) ) ( not ( = ?auto_95234 ?auto_95235 ) ) ( not ( = ?auto_95233 ?auto_95235 ) ) ( OBJ-AT ?auto_95235 ?auto_95237 ) ( TRUCK-AT ?auto_95238 ?auto_95232 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95240 ?auto_95234 ?auto_95232 )
      ( DELIVER-2PKG-VERIFY ?auto_95233 ?auto_95234 ?auto_95232 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95242 - OBJ
      ?auto_95243 - OBJ
      ?auto_95241 - LOCATION
    )
    :vars
    (
      ?auto_95247 - LOCATION
      ?auto_95249 - CITY
      ?auto_95246 - OBJ
      ?auto_95245 - LOCATION
      ?auto_95244 - OBJ
      ?auto_95248 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95243 ?auto_95242 ) ) ( IN-CITY ?auto_95247 ?auto_95249 ) ( IN-CITY ?auto_95241 ?auto_95249 ) ( not ( = ?auto_95241 ?auto_95247 ) ) ( OBJ-AT ?auto_95243 ?auto_95241 ) ( OBJ-AT ?auto_95242 ?auto_95247 ) ( not ( = ?auto_95246 ?auto_95243 ) ) ( not ( = ?auto_95242 ?auto_95246 ) ) ( IN-CITY ?auto_95245 ?auto_95249 ) ( not ( = ?auto_95241 ?auto_95245 ) ) ( not ( = ?auto_95247 ?auto_95245 ) ) ( OBJ-AT ?auto_95246 ?auto_95245 ) ( not ( = ?auto_95244 ?auto_95243 ) ) ( not ( = ?auto_95242 ?auto_95244 ) ) ( not ( = ?auto_95246 ?auto_95244 ) ) ( OBJ-AT ?auto_95244 ?auto_95247 ) ( TRUCK-AT ?auto_95248 ?auto_95241 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95243 ?auto_95242 ?auto_95241 )
      ( DELIVER-2PKG-VERIFY ?auto_95242 ?auto_95243 ?auto_95241 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95251 - OBJ
      ?auto_95252 - OBJ
      ?auto_95250 - LOCATION
    )
    :vars
    (
      ?auto_95258 - OBJ
      ?auto_95255 - LOCATION
      ?auto_95257 - CITY
      ?auto_95254 - OBJ
      ?auto_95253 - LOCATION
      ?auto_95256 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95252 ?auto_95251 ) ) ( not ( = ?auto_95251 ?auto_95258 ) ) ( IN-CITY ?auto_95255 ?auto_95257 ) ( IN-CITY ?auto_95250 ?auto_95257 ) ( not ( = ?auto_95250 ?auto_95255 ) ) ( OBJ-AT ?auto_95258 ?auto_95250 ) ( OBJ-AT ?auto_95251 ?auto_95255 ) ( not ( = ?auto_95254 ?auto_95258 ) ) ( not ( = ?auto_95251 ?auto_95254 ) ) ( IN-CITY ?auto_95253 ?auto_95257 ) ( not ( = ?auto_95250 ?auto_95253 ) ) ( not ( = ?auto_95255 ?auto_95253 ) ) ( OBJ-AT ?auto_95254 ?auto_95253 ) ( not ( = ?auto_95252 ?auto_95258 ) ) ( not ( = ?auto_95254 ?auto_95252 ) ) ( OBJ-AT ?auto_95252 ?auto_95255 ) ( TRUCK-AT ?auto_95256 ?auto_95250 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95258 ?auto_95251 ?auto_95250 )
      ( DELIVER-2PKG-VERIFY ?auto_95251 ?auto_95252 ?auto_95250 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95260 - OBJ
      ?auto_95261 - OBJ
      ?auto_95259 - LOCATION
    )
    :vars
    (
      ?auto_95267 - OBJ
      ?auto_95264 - LOCATION
      ?auto_95266 - CITY
      ?auto_95263 - LOCATION
      ?auto_95262 - OBJ
      ?auto_95265 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95261 ?auto_95260 ) ) ( not ( = ?auto_95260 ?auto_95267 ) ) ( IN-CITY ?auto_95264 ?auto_95266 ) ( IN-CITY ?auto_95259 ?auto_95266 ) ( not ( = ?auto_95259 ?auto_95264 ) ) ( OBJ-AT ?auto_95267 ?auto_95259 ) ( OBJ-AT ?auto_95260 ?auto_95264 ) ( not ( = ?auto_95261 ?auto_95267 ) ) ( IN-CITY ?auto_95263 ?auto_95266 ) ( not ( = ?auto_95259 ?auto_95263 ) ) ( not ( = ?auto_95264 ?auto_95263 ) ) ( OBJ-AT ?auto_95261 ?auto_95263 ) ( not ( = ?auto_95262 ?auto_95267 ) ) ( not ( = ?auto_95260 ?auto_95262 ) ) ( not ( = ?auto_95261 ?auto_95262 ) ) ( OBJ-AT ?auto_95262 ?auto_95264 ) ( TRUCK-AT ?auto_95265 ?auto_95259 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95267 ?auto_95260 ?auto_95259 )
      ( DELIVER-2PKG-VERIFY ?auto_95260 ?auto_95261 ?auto_95259 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95289 - OBJ
      ?auto_95290 - OBJ
      ?auto_95291 - OBJ
      ?auto_95288 - LOCATION
    )
    :vars
    (
      ?auto_95294 - LOCATION
      ?auto_95296 - CITY
      ?auto_95293 - OBJ
      ?auto_95292 - LOCATION
      ?auto_95295 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95290 ?auto_95289 ) ) ( not ( = ?auto_95291 ?auto_95289 ) ) ( not ( = ?auto_95291 ?auto_95290 ) ) ( IN-CITY ?auto_95294 ?auto_95296 ) ( IN-CITY ?auto_95288 ?auto_95296 ) ( not ( = ?auto_95288 ?auto_95294 ) ) ( OBJ-AT ?auto_95289 ?auto_95288 ) ( OBJ-AT ?auto_95291 ?auto_95294 ) ( not ( = ?auto_95293 ?auto_95289 ) ) ( not ( = ?auto_95291 ?auto_95293 ) ) ( IN-CITY ?auto_95292 ?auto_95296 ) ( not ( = ?auto_95288 ?auto_95292 ) ) ( not ( = ?auto_95294 ?auto_95292 ) ) ( OBJ-AT ?auto_95293 ?auto_95292 ) ( not ( = ?auto_95293 ?auto_95290 ) ) ( OBJ-AT ?auto_95290 ?auto_95294 ) ( TRUCK-AT ?auto_95295 ?auto_95288 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95289 ?auto_95291 ?auto_95288 )
      ( DELIVER-3PKG-VERIFY ?auto_95289 ?auto_95290 ?auto_95291 ?auto_95288 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95298 - OBJ
      ?auto_95299 - OBJ
      ?auto_95300 - OBJ
      ?auto_95297 - LOCATION
    )
    :vars
    (
      ?auto_95303 - LOCATION
      ?auto_95305 - CITY
      ?auto_95302 - LOCATION
      ?auto_95301 - OBJ
      ?auto_95304 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95299 ?auto_95298 ) ) ( not ( = ?auto_95300 ?auto_95298 ) ) ( not ( = ?auto_95300 ?auto_95299 ) ) ( IN-CITY ?auto_95303 ?auto_95305 ) ( IN-CITY ?auto_95297 ?auto_95305 ) ( not ( = ?auto_95297 ?auto_95303 ) ) ( OBJ-AT ?auto_95298 ?auto_95297 ) ( OBJ-AT ?auto_95300 ?auto_95303 ) ( IN-CITY ?auto_95302 ?auto_95305 ) ( not ( = ?auto_95297 ?auto_95302 ) ) ( not ( = ?auto_95303 ?auto_95302 ) ) ( OBJ-AT ?auto_95299 ?auto_95302 ) ( not ( = ?auto_95301 ?auto_95298 ) ) ( not ( = ?auto_95300 ?auto_95301 ) ) ( not ( = ?auto_95299 ?auto_95301 ) ) ( OBJ-AT ?auto_95301 ?auto_95303 ) ( TRUCK-AT ?auto_95304 ?auto_95297 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95298 ?auto_95300 ?auto_95297 )
      ( DELIVER-3PKG-VERIFY ?auto_95298 ?auto_95299 ?auto_95300 ?auto_95297 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95317 - OBJ
      ?auto_95318 - OBJ
      ?auto_95319 - OBJ
      ?auto_95316 - LOCATION
    )
    :vars
    (
      ?auto_95322 - LOCATION
      ?auto_95324 - CITY
      ?auto_95321 - OBJ
      ?auto_95320 - LOCATION
      ?auto_95323 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95318 ?auto_95317 ) ) ( not ( = ?auto_95319 ?auto_95317 ) ) ( not ( = ?auto_95319 ?auto_95318 ) ) ( IN-CITY ?auto_95322 ?auto_95324 ) ( IN-CITY ?auto_95316 ?auto_95324 ) ( not ( = ?auto_95316 ?auto_95322 ) ) ( OBJ-AT ?auto_95317 ?auto_95316 ) ( OBJ-AT ?auto_95318 ?auto_95322 ) ( not ( = ?auto_95321 ?auto_95317 ) ) ( not ( = ?auto_95318 ?auto_95321 ) ) ( IN-CITY ?auto_95320 ?auto_95324 ) ( not ( = ?auto_95316 ?auto_95320 ) ) ( not ( = ?auto_95322 ?auto_95320 ) ) ( OBJ-AT ?auto_95321 ?auto_95320 ) ( not ( = ?auto_95321 ?auto_95319 ) ) ( OBJ-AT ?auto_95319 ?auto_95322 ) ( TRUCK-AT ?auto_95323 ?auto_95316 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95317 ?auto_95318 ?auto_95316 )
      ( DELIVER-3PKG-VERIFY ?auto_95317 ?auto_95318 ?auto_95319 ?auto_95316 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95326 - OBJ
      ?auto_95327 - OBJ
      ?auto_95328 - OBJ
      ?auto_95325 - LOCATION
    )
    :vars
    (
      ?auto_95331 - LOCATION
      ?auto_95333 - CITY
      ?auto_95330 - LOCATION
      ?auto_95329 - OBJ
      ?auto_95332 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95327 ?auto_95326 ) ) ( not ( = ?auto_95328 ?auto_95326 ) ) ( not ( = ?auto_95328 ?auto_95327 ) ) ( IN-CITY ?auto_95331 ?auto_95333 ) ( IN-CITY ?auto_95325 ?auto_95333 ) ( not ( = ?auto_95325 ?auto_95331 ) ) ( OBJ-AT ?auto_95326 ?auto_95325 ) ( OBJ-AT ?auto_95327 ?auto_95331 ) ( IN-CITY ?auto_95330 ?auto_95333 ) ( not ( = ?auto_95325 ?auto_95330 ) ) ( not ( = ?auto_95331 ?auto_95330 ) ) ( OBJ-AT ?auto_95328 ?auto_95330 ) ( not ( = ?auto_95329 ?auto_95326 ) ) ( not ( = ?auto_95327 ?auto_95329 ) ) ( not ( = ?auto_95328 ?auto_95329 ) ) ( OBJ-AT ?auto_95329 ?auto_95331 ) ( TRUCK-AT ?auto_95332 ?auto_95325 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95326 ?auto_95327 ?auto_95325 )
      ( DELIVER-3PKG-VERIFY ?auto_95326 ?auto_95327 ?auto_95328 ?auto_95325 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95345 - OBJ
      ?auto_95346 - OBJ
      ?auto_95347 - OBJ
      ?auto_95344 - LOCATION
    )
    :vars
    (
      ?auto_95350 - LOCATION
      ?auto_95352 - CITY
      ?auto_95349 - OBJ
      ?auto_95348 - LOCATION
      ?auto_95351 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95346 ?auto_95345 ) ) ( not ( = ?auto_95347 ?auto_95345 ) ) ( not ( = ?auto_95347 ?auto_95346 ) ) ( IN-CITY ?auto_95350 ?auto_95352 ) ( IN-CITY ?auto_95344 ?auto_95352 ) ( not ( = ?auto_95344 ?auto_95350 ) ) ( OBJ-AT ?auto_95346 ?auto_95344 ) ( OBJ-AT ?auto_95347 ?auto_95350 ) ( not ( = ?auto_95349 ?auto_95346 ) ) ( not ( = ?auto_95347 ?auto_95349 ) ) ( IN-CITY ?auto_95348 ?auto_95352 ) ( not ( = ?auto_95344 ?auto_95348 ) ) ( not ( = ?auto_95350 ?auto_95348 ) ) ( OBJ-AT ?auto_95349 ?auto_95348 ) ( not ( = ?auto_95349 ?auto_95345 ) ) ( OBJ-AT ?auto_95345 ?auto_95350 ) ( TRUCK-AT ?auto_95351 ?auto_95344 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95346 ?auto_95347 ?auto_95344 )
      ( DELIVER-3PKG-VERIFY ?auto_95345 ?auto_95346 ?auto_95347 ?auto_95344 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95364 - OBJ
      ?auto_95365 - OBJ
      ?auto_95366 - OBJ
      ?auto_95363 - LOCATION
    )
    :vars
    (
      ?auto_95371 - OBJ
      ?auto_95368 - LOCATION
      ?auto_95370 - CITY
      ?auto_95367 - LOCATION
      ?auto_95369 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95365 ?auto_95364 ) ) ( not ( = ?auto_95366 ?auto_95364 ) ) ( not ( = ?auto_95366 ?auto_95365 ) ) ( not ( = ?auto_95366 ?auto_95371 ) ) ( IN-CITY ?auto_95368 ?auto_95370 ) ( IN-CITY ?auto_95363 ?auto_95370 ) ( not ( = ?auto_95363 ?auto_95368 ) ) ( OBJ-AT ?auto_95371 ?auto_95363 ) ( OBJ-AT ?auto_95366 ?auto_95368 ) ( not ( = ?auto_95365 ?auto_95371 ) ) ( IN-CITY ?auto_95367 ?auto_95370 ) ( not ( = ?auto_95363 ?auto_95367 ) ) ( not ( = ?auto_95368 ?auto_95367 ) ) ( OBJ-AT ?auto_95365 ?auto_95367 ) ( not ( = ?auto_95364 ?auto_95371 ) ) ( OBJ-AT ?auto_95364 ?auto_95368 ) ( TRUCK-AT ?auto_95369 ?auto_95363 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95371 ?auto_95366 ?auto_95363 )
      ( DELIVER-3PKG-VERIFY ?auto_95364 ?auto_95365 ?auto_95366 ?auto_95363 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95373 - OBJ
      ?auto_95374 - OBJ
      ?auto_95375 - OBJ
      ?auto_95372 - LOCATION
    )
    :vars
    (
      ?auto_95378 - LOCATION
      ?auto_95380 - CITY
      ?auto_95377 - OBJ
      ?auto_95376 - LOCATION
      ?auto_95379 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95374 ?auto_95373 ) ) ( not ( = ?auto_95375 ?auto_95373 ) ) ( not ( = ?auto_95375 ?auto_95374 ) ) ( IN-CITY ?auto_95378 ?auto_95380 ) ( IN-CITY ?auto_95372 ?auto_95380 ) ( not ( = ?auto_95372 ?auto_95378 ) ) ( OBJ-AT ?auto_95375 ?auto_95372 ) ( OBJ-AT ?auto_95374 ?auto_95378 ) ( not ( = ?auto_95377 ?auto_95375 ) ) ( not ( = ?auto_95374 ?auto_95377 ) ) ( IN-CITY ?auto_95376 ?auto_95380 ) ( not ( = ?auto_95372 ?auto_95376 ) ) ( not ( = ?auto_95378 ?auto_95376 ) ) ( OBJ-AT ?auto_95377 ?auto_95376 ) ( not ( = ?auto_95377 ?auto_95373 ) ) ( OBJ-AT ?auto_95373 ?auto_95378 ) ( TRUCK-AT ?auto_95379 ?auto_95372 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95375 ?auto_95374 ?auto_95372 )
      ( DELIVER-3PKG-VERIFY ?auto_95373 ?auto_95374 ?auto_95375 ?auto_95372 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95392 - OBJ
      ?auto_95393 - OBJ
      ?auto_95394 - OBJ
      ?auto_95391 - LOCATION
    )
    :vars
    (
      ?auto_95399 - OBJ
      ?auto_95396 - LOCATION
      ?auto_95398 - CITY
      ?auto_95395 - LOCATION
      ?auto_95397 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95393 ?auto_95392 ) ) ( not ( = ?auto_95394 ?auto_95392 ) ) ( not ( = ?auto_95394 ?auto_95393 ) ) ( not ( = ?auto_95393 ?auto_95399 ) ) ( IN-CITY ?auto_95396 ?auto_95398 ) ( IN-CITY ?auto_95391 ?auto_95398 ) ( not ( = ?auto_95391 ?auto_95396 ) ) ( OBJ-AT ?auto_95399 ?auto_95391 ) ( OBJ-AT ?auto_95393 ?auto_95396 ) ( not ( = ?auto_95394 ?auto_95399 ) ) ( IN-CITY ?auto_95395 ?auto_95398 ) ( not ( = ?auto_95391 ?auto_95395 ) ) ( not ( = ?auto_95396 ?auto_95395 ) ) ( OBJ-AT ?auto_95394 ?auto_95395 ) ( not ( = ?auto_95392 ?auto_95399 ) ) ( OBJ-AT ?auto_95392 ?auto_95396 ) ( TRUCK-AT ?auto_95397 ?auto_95391 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95399 ?auto_95393 ?auto_95391 )
      ( DELIVER-3PKG-VERIFY ?auto_95392 ?auto_95393 ?auto_95394 ?auto_95391 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95411 - OBJ
      ?auto_95412 - OBJ
      ?auto_95413 - OBJ
      ?auto_95410 - LOCATION
    )
    :vars
    (
      ?auto_95416 - LOCATION
      ?auto_95418 - CITY
      ?auto_95415 - LOCATION
      ?auto_95414 - OBJ
      ?auto_95417 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95412 ?auto_95411 ) ) ( not ( = ?auto_95413 ?auto_95411 ) ) ( not ( = ?auto_95413 ?auto_95412 ) ) ( IN-CITY ?auto_95416 ?auto_95418 ) ( IN-CITY ?auto_95410 ?auto_95418 ) ( not ( = ?auto_95410 ?auto_95416 ) ) ( OBJ-AT ?auto_95412 ?auto_95410 ) ( OBJ-AT ?auto_95413 ?auto_95416 ) ( IN-CITY ?auto_95415 ?auto_95418 ) ( not ( = ?auto_95410 ?auto_95415 ) ) ( not ( = ?auto_95416 ?auto_95415 ) ) ( OBJ-AT ?auto_95411 ?auto_95415 ) ( not ( = ?auto_95414 ?auto_95412 ) ) ( not ( = ?auto_95413 ?auto_95414 ) ) ( not ( = ?auto_95411 ?auto_95414 ) ) ( OBJ-AT ?auto_95414 ?auto_95416 ) ( TRUCK-AT ?auto_95417 ?auto_95410 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95412 ?auto_95413 ?auto_95410 )
      ( DELIVER-3PKG-VERIFY ?auto_95411 ?auto_95412 ?auto_95413 ?auto_95410 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95420 - OBJ
      ?auto_95421 - OBJ
      ?auto_95422 - OBJ
      ?auto_95419 - LOCATION
    )
    :vars
    (
      ?auto_95427 - OBJ
      ?auto_95424 - LOCATION
      ?auto_95426 - CITY
      ?auto_95423 - LOCATION
      ?auto_95425 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95421 ?auto_95420 ) ) ( not ( = ?auto_95422 ?auto_95420 ) ) ( not ( = ?auto_95422 ?auto_95421 ) ) ( not ( = ?auto_95422 ?auto_95427 ) ) ( IN-CITY ?auto_95424 ?auto_95426 ) ( IN-CITY ?auto_95419 ?auto_95426 ) ( not ( = ?auto_95419 ?auto_95424 ) ) ( OBJ-AT ?auto_95427 ?auto_95419 ) ( OBJ-AT ?auto_95422 ?auto_95424 ) ( not ( = ?auto_95420 ?auto_95427 ) ) ( IN-CITY ?auto_95423 ?auto_95426 ) ( not ( = ?auto_95419 ?auto_95423 ) ) ( not ( = ?auto_95424 ?auto_95423 ) ) ( OBJ-AT ?auto_95420 ?auto_95423 ) ( not ( = ?auto_95421 ?auto_95427 ) ) ( OBJ-AT ?auto_95421 ?auto_95424 ) ( TRUCK-AT ?auto_95425 ?auto_95419 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95427 ?auto_95422 ?auto_95419 )
      ( DELIVER-3PKG-VERIFY ?auto_95420 ?auto_95421 ?auto_95422 ?auto_95419 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95439 - OBJ
      ?auto_95440 - OBJ
      ?auto_95441 - OBJ
      ?auto_95438 - LOCATION
    )
    :vars
    (
      ?auto_95444 - LOCATION
      ?auto_95446 - CITY
      ?auto_95443 - LOCATION
      ?auto_95442 - OBJ
      ?auto_95445 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95440 ?auto_95439 ) ) ( not ( = ?auto_95441 ?auto_95439 ) ) ( not ( = ?auto_95441 ?auto_95440 ) ) ( IN-CITY ?auto_95444 ?auto_95446 ) ( IN-CITY ?auto_95438 ?auto_95446 ) ( not ( = ?auto_95438 ?auto_95444 ) ) ( OBJ-AT ?auto_95441 ?auto_95438 ) ( OBJ-AT ?auto_95440 ?auto_95444 ) ( IN-CITY ?auto_95443 ?auto_95446 ) ( not ( = ?auto_95438 ?auto_95443 ) ) ( not ( = ?auto_95444 ?auto_95443 ) ) ( OBJ-AT ?auto_95439 ?auto_95443 ) ( not ( = ?auto_95442 ?auto_95441 ) ) ( not ( = ?auto_95440 ?auto_95442 ) ) ( not ( = ?auto_95439 ?auto_95442 ) ) ( OBJ-AT ?auto_95442 ?auto_95444 ) ( TRUCK-AT ?auto_95445 ?auto_95438 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95441 ?auto_95440 ?auto_95438 )
      ( DELIVER-3PKG-VERIFY ?auto_95439 ?auto_95440 ?auto_95441 ?auto_95438 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95448 - OBJ
      ?auto_95449 - OBJ
      ?auto_95450 - OBJ
      ?auto_95447 - LOCATION
    )
    :vars
    (
      ?auto_95455 - OBJ
      ?auto_95452 - LOCATION
      ?auto_95454 - CITY
      ?auto_95451 - LOCATION
      ?auto_95453 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95449 ?auto_95448 ) ) ( not ( = ?auto_95450 ?auto_95448 ) ) ( not ( = ?auto_95450 ?auto_95449 ) ) ( not ( = ?auto_95449 ?auto_95455 ) ) ( IN-CITY ?auto_95452 ?auto_95454 ) ( IN-CITY ?auto_95447 ?auto_95454 ) ( not ( = ?auto_95447 ?auto_95452 ) ) ( OBJ-AT ?auto_95455 ?auto_95447 ) ( OBJ-AT ?auto_95449 ?auto_95452 ) ( not ( = ?auto_95448 ?auto_95455 ) ) ( IN-CITY ?auto_95451 ?auto_95454 ) ( not ( = ?auto_95447 ?auto_95451 ) ) ( not ( = ?auto_95452 ?auto_95451 ) ) ( OBJ-AT ?auto_95448 ?auto_95451 ) ( not ( = ?auto_95450 ?auto_95455 ) ) ( OBJ-AT ?auto_95450 ?auto_95452 ) ( TRUCK-AT ?auto_95453 ?auto_95447 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95455 ?auto_95449 ?auto_95447 )
      ( DELIVER-3PKG-VERIFY ?auto_95448 ?auto_95449 ?auto_95450 ?auto_95447 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95487 - OBJ
      ?auto_95488 - OBJ
      ?auto_95489 - OBJ
      ?auto_95486 - LOCATION
    )
    :vars
    (
      ?auto_95492 - LOCATION
      ?auto_95494 - CITY
      ?auto_95491 - OBJ
      ?auto_95490 - LOCATION
      ?auto_95493 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95488 ?auto_95487 ) ) ( not ( = ?auto_95489 ?auto_95487 ) ) ( not ( = ?auto_95489 ?auto_95488 ) ) ( IN-CITY ?auto_95492 ?auto_95494 ) ( IN-CITY ?auto_95486 ?auto_95494 ) ( not ( = ?auto_95486 ?auto_95492 ) ) ( OBJ-AT ?auto_95488 ?auto_95486 ) ( OBJ-AT ?auto_95487 ?auto_95492 ) ( not ( = ?auto_95491 ?auto_95488 ) ) ( not ( = ?auto_95487 ?auto_95491 ) ) ( IN-CITY ?auto_95490 ?auto_95494 ) ( not ( = ?auto_95486 ?auto_95490 ) ) ( not ( = ?auto_95492 ?auto_95490 ) ) ( OBJ-AT ?auto_95491 ?auto_95490 ) ( not ( = ?auto_95491 ?auto_95489 ) ) ( OBJ-AT ?auto_95489 ?auto_95492 ) ( TRUCK-AT ?auto_95493 ?auto_95486 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95488 ?auto_95487 ?auto_95486 )
      ( DELIVER-3PKG-VERIFY ?auto_95487 ?auto_95488 ?auto_95489 ?auto_95486 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95496 - OBJ
      ?auto_95497 - OBJ
      ?auto_95498 - OBJ
      ?auto_95495 - LOCATION
    )
    :vars
    (
      ?auto_95501 - LOCATION
      ?auto_95503 - CITY
      ?auto_95500 - LOCATION
      ?auto_95499 - OBJ
      ?auto_95502 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95497 ?auto_95496 ) ) ( not ( = ?auto_95498 ?auto_95496 ) ) ( not ( = ?auto_95498 ?auto_95497 ) ) ( IN-CITY ?auto_95501 ?auto_95503 ) ( IN-CITY ?auto_95495 ?auto_95503 ) ( not ( = ?auto_95495 ?auto_95501 ) ) ( OBJ-AT ?auto_95497 ?auto_95495 ) ( OBJ-AT ?auto_95496 ?auto_95501 ) ( IN-CITY ?auto_95500 ?auto_95503 ) ( not ( = ?auto_95495 ?auto_95500 ) ) ( not ( = ?auto_95501 ?auto_95500 ) ) ( OBJ-AT ?auto_95498 ?auto_95500 ) ( not ( = ?auto_95499 ?auto_95497 ) ) ( not ( = ?auto_95496 ?auto_95499 ) ) ( not ( = ?auto_95498 ?auto_95499 ) ) ( OBJ-AT ?auto_95499 ?auto_95501 ) ( TRUCK-AT ?auto_95502 ?auto_95495 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95497 ?auto_95496 ?auto_95495 )
      ( DELIVER-3PKG-VERIFY ?auto_95496 ?auto_95497 ?auto_95498 ?auto_95495 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95515 - OBJ
      ?auto_95516 - OBJ
      ?auto_95517 - OBJ
      ?auto_95514 - LOCATION
    )
    :vars
    (
      ?auto_95520 - LOCATION
      ?auto_95522 - CITY
      ?auto_95519 - OBJ
      ?auto_95518 - LOCATION
      ?auto_95521 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95516 ?auto_95515 ) ) ( not ( = ?auto_95517 ?auto_95515 ) ) ( not ( = ?auto_95517 ?auto_95516 ) ) ( IN-CITY ?auto_95520 ?auto_95522 ) ( IN-CITY ?auto_95514 ?auto_95522 ) ( not ( = ?auto_95514 ?auto_95520 ) ) ( OBJ-AT ?auto_95517 ?auto_95514 ) ( OBJ-AT ?auto_95515 ?auto_95520 ) ( not ( = ?auto_95519 ?auto_95517 ) ) ( not ( = ?auto_95515 ?auto_95519 ) ) ( IN-CITY ?auto_95518 ?auto_95522 ) ( not ( = ?auto_95514 ?auto_95518 ) ) ( not ( = ?auto_95520 ?auto_95518 ) ) ( OBJ-AT ?auto_95519 ?auto_95518 ) ( not ( = ?auto_95519 ?auto_95516 ) ) ( OBJ-AT ?auto_95516 ?auto_95520 ) ( TRUCK-AT ?auto_95521 ?auto_95514 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95517 ?auto_95515 ?auto_95514 )
      ( DELIVER-3PKG-VERIFY ?auto_95515 ?auto_95516 ?auto_95517 ?auto_95514 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95534 - OBJ
      ?auto_95535 - OBJ
      ?auto_95536 - OBJ
      ?auto_95533 - LOCATION
    )
    :vars
    (
      ?auto_95541 - OBJ
      ?auto_95538 - LOCATION
      ?auto_95540 - CITY
      ?auto_95537 - LOCATION
      ?auto_95539 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95535 ?auto_95534 ) ) ( not ( = ?auto_95536 ?auto_95534 ) ) ( not ( = ?auto_95536 ?auto_95535 ) ) ( not ( = ?auto_95534 ?auto_95541 ) ) ( IN-CITY ?auto_95538 ?auto_95540 ) ( IN-CITY ?auto_95533 ?auto_95540 ) ( not ( = ?auto_95533 ?auto_95538 ) ) ( OBJ-AT ?auto_95541 ?auto_95533 ) ( OBJ-AT ?auto_95534 ?auto_95538 ) ( not ( = ?auto_95536 ?auto_95541 ) ) ( IN-CITY ?auto_95537 ?auto_95540 ) ( not ( = ?auto_95533 ?auto_95537 ) ) ( not ( = ?auto_95538 ?auto_95537 ) ) ( OBJ-AT ?auto_95536 ?auto_95537 ) ( not ( = ?auto_95535 ?auto_95541 ) ) ( OBJ-AT ?auto_95535 ?auto_95538 ) ( TRUCK-AT ?auto_95539 ?auto_95533 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95541 ?auto_95534 ?auto_95533 )
      ( DELIVER-3PKG-VERIFY ?auto_95534 ?auto_95535 ?auto_95536 ?auto_95533 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95553 - OBJ
      ?auto_95554 - OBJ
      ?auto_95555 - OBJ
      ?auto_95552 - LOCATION
    )
    :vars
    (
      ?auto_95558 - LOCATION
      ?auto_95560 - CITY
      ?auto_95557 - LOCATION
      ?auto_95556 - OBJ
      ?auto_95559 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95554 ?auto_95553 ) ) ( not ( = ?auto_95555 ?auto_95553 ) ) ( not ( = ?auto_95555 ?auto_95554 ) ) ( IN-CITY ?auto_95558 ?auto_95560 ) ( IN-CITY ?auto_95552 ?auto_95560 ) ( not ( = ?auto_95552 ?auto_95558 ) ) ( OBJ-AT ?auto_95555 ?auto_95552 ) ( OBJ-AT ?auto_95553 ?auto_95558 ) ( IN-CITY ?auto_95557 ?auto_95560 ) ( not ( = ?auto_95552 ?auto_95557 ) ) ( not ( = ?auto_95558 ?auto_95557 ) ) ( OBJ-AT ?auto_95554 ?auto_95557 ) ( not ( = ?auto_95556 ?auto_95555 ) ) ( not ( = ?auto_95553 ?auto_95556 ) ) ( not ( = ?auto_95554 ?auto_95556 ) ) ( OBJ-AT ?auto_95556 ?auto_95558 ) ( TRUCK-AT ?auto_95559 ?auto_95552 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95555 ?auto_95553 ?auto_95552 )
      ( DELIVER-3PKG-VERIFY ?auto_95553 ?auto_95554 ?auto_95555 ?auto_95552 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95562 - OBJ
      ?auto_95563 - OBJ
      ?auto_95564 - OBJ
      ?auto_95561 - LOCATION
    )
    :vars
    (
      ?auto_95569 - OBJ
      ?auto_95566 - LOCATION
      ?auto_95568 - CITY
      ?auto_95565 - LOCATION
      ?auto_95567 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95563 ?auto_95562 ) ) ( not ( = ?auto_95564 ?auto_95562 ) ) ( not ( = ?auto_95564 ?auto_95563 ) ) ( not ( = ?auto_95562 ?auto_95569 ) ) ( IN-CITY ?auto_95566 ?auto_95568 ) ( IN-CITY ?auto_95561 ?auto_95568 ) ( not ( = ?auto_95561 ?auto_95566 ) ) ( OBJ-AT ?auto_95569 ?auto_95561 ) ( OBJ-AT ?auto_95562 ?auto_95566 ) ( not ( = ?auto_95563 ?auto_95569 ) ) ( IN-CITY ?auto_95565 ?auto_95568 ) ( not ( = ?auto_95561 ?auto_95565 ) ) ( not ( = ?auto_95566 ?auto_95565 ) ) ( OBJ-AT ?auto_95563 ?auto_95565 ) ( not ( = ?auto_95564 ?auto_95569 ) ) ( OBJ-AT ?auto_95564 ?auto_95566 ) ( TRUCK-AT ?auto_95567 ?auto_95561 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95569 ?auto_95562 ?auto_95561 )
      ( DELIVER-3PKG-VERIFY ?auto_95562 ?auto_95563 ?auto_95564 ?auto_95561 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95725 - OBJ
      ?auto_95726 - OBJ
      ?auto_95727 - OBJ
      ?auto_95728 - OBJ
      ?auto_95724 - LOCATION
    )
    :vars
    (
      ?auto_95730 - LOCATION
      ?auto_95732 - CITY
      ?auto_95729 - LOCATION
      ?auto_95731 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95726 ?auto_95725 ) ) ( not ( = ?auto_95727 ?auto_95725 ) ) ( not ( = ?auto_95727 ?auto_95726 ) ) ( not ( = ?auto_95728 ?auto_95725 ) ) ( not ( = ?auto_95728 ?auto_95726 ) ) ( not ( = ?auto_95728 ?auto_95727 ) ) ( IN-CITY ?auto_95730 ?auto_95732 ) ( IN-CITY ?auto_95724 ?auto_95732 ) ( not ( = ?auto_95724 ?auto_95730 ) ) ( OBJ-AT ?auto_95725 ?auto_95724 ) ( OBJ-AT ?auto_95728 ?auto_95730 ) ( IN-CITY ?auto_95729 ?auto_95732 ) ( not ( = ?auto_95724 ?auto_95729 ) ) ( not ( = ?auto_95730 ?auto_95729 ) ) ( OBJ-AT ?auto_95727 ?auto_95729 ) ( OBJ-AT ?auto_95726 ?auto_95730 ) ( TRUCK-AT ?auto_95731 ?auto_95724 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95725 ?auto_95728 ?auto_95724 )
      ( DELIVER-4PKG-VERIFY ?auto_95725 ?auto_95726 ?auto_95727 ?auto_95728 ?auto_95724 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95754 - OBJ
      ?auto_95755 - OBJ
      ?auto_95756 - OBJ
      ?auto_95757 - OBJ
      ?auto_95753 - LOCATION
    )
    :vars
    (
      ?auto_95759 - LOCATION
      ?auto_95761 - CITY
      ?auto_95758 - LOCATION
      ?auto_95760 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95755 ?auto_95754 ) ) ( not ( = ?auto_95756 ?auto_95754 ) ) ( not ( = ?auto_95756 ?auto_95755 ) ) ( not ( = ?auto_95757 ?auto_95754 ) ) ( not ( = ?auto_95757 ?auto_95755 ) ) ( not ( = ?auto_95757 ?auto_95756 ) ) ( IN-CITY ?auto_95759 ?auto_95761 ) ( IN-CITY ?auto_95753 ?auto_95761 ) ( not ( = ?auto_95753 ?auto_95759 ) ) ( OBJ-AT ?auto_95754 ?auto_95753 ) ( OBJ-AT ?auto_95756 ?auto_95759 ) ( IN-CITY ?auto_95758 ?auto_95761 ) ( not ( = ?auto_95753 ?auto_95758 ) ) ( not ( = ?auto_95759 ?auto_95758 ) ) ( OBJ-AT ?auto_95757 ?auto_95758 ) ( OBJ-AT ?auto_95755 ?auto_95759 ) ( TRUCK-AT ?auto_95760 ?auto_95753 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95754 ?auto_95756 ?auto_95753 )
      ( DELIVER-4PKG-VERIFY ?auto_95754 ?auto_95755 ?auto_95756 ?auto_95757 ?auto_95753 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95783 - OBJ
      ?auto_95784 - OBJ
      ?auto_95785 - OBJ
      ?auto_95786 - OBJ
      ?auto_95782 - LOCATION
    )
    :vars
    (
      ?auto_95788 - LOCATION
      ?auto_95790 - CITY
      ?auto_95787 - LOCATION
      ?auto_95789 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95784 ?auto_95783 ) ) ( not ( = ?auto_95785 ?auto_95783 ) ) ( not ( = ?auto_95785 ?auto_95784 ) ) ( not ( = ?auto_95786 ?auto_95783 ) ) ( not ( = ?auto_95786 ?auto_95784 ) ) ( not ( = ?auto_95786 ?auto_95785 ) ) ( IN-CITY ?auto_95788 ?auto_95790 ) ( IN-CITY ?auto_95782 ?auto_95790 ) ( not ( = ?auto_95782 ?auto_95788 ) ) ( OBJ-AT ?auto_95783 ?auto_95782 ) ( OBJ-AT ?auto_95786 ?auto_95788 ) ( IN-CITY ?auto_95787 ?auto_95790 ) ( not ( = ?auto_95782 ?auto_95787 ) ) ( not ( = ?auto_95788 ?auto_95787 ) ) ( OBJ-AT ?auto_95784 ?auto_95787 ) ( OBJ-AT ?auto_95785 ?auto_95788 ) ( TRUCK-AT ?auto_95789 ?auto_95782 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95783 ?auto_95786 ?auto_95782 )
      ( DELIVER-4PKG-VERIFY ?auto_95783 ?auto_95784 ?auto_95785 ?auto_95786 ?auto_95782 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95812 - OBJ
      ?auto_95813 - OBJ
      ?auto_95814 - OBJ
      ?auto_95815 - OBJ
      ?auto_95811 - LOCATION
    )
    :vars
    (
      ?auto_95817 - LOCATION
      ?auto_95819 - CITY
      ?auto_95816 - LOCATION
      ?auto_95818 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95813 ?auto_95812 ) ) ( not ( = ?auto_95814 ?auto_95812 ) ) ( not ( = ?auto_95814 ?auto_95813 ) ) ( not ( = ?auto_95815 ?auto_95812 ) ) ( not ( = ?auto_95815 ?auto_95813 ) ) ( not ( = ?auto_95815 ?auto_95814 ) ) ( IN-CITY ?auto_95817 ?auto_95819 ) ( IN-CITY ?auto_95811 ?auto_95819 ) ( not ( = ?auto_95811 ?auto_95817 ) ) ( OBJ-AT ?auto_95812 ?auto_95811 ) ( OBJ-AT ?auto_95814 ?auto_95817 ) ( IN-CITY ?auto_95816 ?auto_95819 ) ( not ( = ?auto_95811 ?auto_95816 ) ) ( not ( = ?auto_95817 ?auto_95816 ) ) ( OBJ-AT ?auto_95813 ?auto_95816 ) ( OBJ-AT ?auto_95815 ?auto_95817 ) ( TRUCK-AT ?auto_95818 ?auto_95811 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95812 ?auto_95814 ?auto_95811 )
      ( DELIVER-4PKG-VERIFY ?auto_95812 ?auto_95813 ?auto_95814 ?auto_95815 ?auto_95811 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95903 - OBJ
      ?auto_95904 - OBJ
      ?auto_95905 - OBJ
      ?auto_95906 - OBJ
      ?auto_95902 - LOCATION
    )
    :vars
    (
      ?auto_95908 - LOCATION
      ?auto_95910 - CITY
      ?auto_95907 - LOCATION
      ?auto_95909 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95904 ?auto_95903 ) ) ( not ( = ?auto_95905 ?auto_95903 ) ) ( not ( = ?auto_95905 ?auto_95904 ) ) ( not ( = ?auto_95906 ?auto_95903 ) ) ( not ( = ?auto_95906 ?auto_95904 ) ) ( not ( = ?auto_95906 ?auto_95905 ) ) ( IN-CITY ?auto_95908 ?auto_95910 ) ( IN-CITY ?auto_95902 ?auto_95910 ) ( not ( = ?auto_95902 ?auto_95908 ) ) ( OBJ-AT ?auto_95903 ?auto_95902 ) ( OBJ-AT ?auto_95904 ?auto_95908 ) ( IN-CITY ?auto_95907 ?auto_95910 ) ( not ( = ?auto_95902 ?auto_95907 ) ) ( not ( = ?auto_95908 ?auto_95907 ) ) ( OBJ-AT ?auto_95906 ?auto_95907 ) ( OBJ-AT ?auto_95905 ?auto_95908 ) ( TRUCK-AT ?auto_95909 ?auto_95902 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95903 ?auto_95904 ?auto_95902 )
      ( DELIVER-4PKG-VERIFY ?auto_95903 ?auto_95904 ?auto_95905 ?auto_95906 ?auto_95902 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95932 - OBJ
      ?auto_95933 - OBJ
      ?auto_95934 - OBJ
      ?auto_95935 - OBJ
      ?auto_95931 - LOCATION
    )
    :vars
    (
      ?auto_95937 - LOCATION
      ?auto_95939 - CITY
      ?auto_95936 - LOCATION
      ?auto_95938 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_95933 ?auto_95932 ) ) ( not ( = ?auto_95934 ?auto_95932 ) ) ( not ( = ?auto_95934 ?auto_95933 ) ) ( not ( = ?auto_95935 ?auto_95932 ) ) ( not ( = ?auto_95935 ?auto_95933 ) ) ( not ( = ?auto_95935 ?auto_95934 ) ) ( IN-CITY ?auto_95937 ?auto_95939 ) ( IN-CITY ?auto_95931 ?auto_95939 ) ( not ( = ?auto_95931 ?auto_95937 ) ) ( OBJ-AT ?auto_95932 ?auto_95931 ) ( OBJ-AT ?auto_95933 ?auto_95937 ) ( IN-CITY ?auto_95936 ?auto_95939 ) ( not ( = ?auto_95931 ?auto_95936 ) ) ( not ( = ?auto_95937 ?auto_95936 ) ) ( OBJ-AT ?auto_95934 ?auto_95936 ) ( OBJ-AT ?auto_95935 ?auto_95937 ) ( TRUCK-AT ?auto_95938 ?auto_95931 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95932 ?auto_95933 ?auto_95931 )
      ( DELIVER-4PKG-VERIFY ?auto_95932 ?auto_95933 ?auto_95934 ?auto_95935 ?auto_95931 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96023 - OBJ
      ?auto_96024 - OBJ
      ?auto_96025 - OBJ
      ?auto_96026 - OBJ
      ?auto_96022 - LOCATION
    )
    :vars
    (
      ?auto_96028 - LOCATION
      ?auto_96030 - CITY
      ?auto_96027 - LOCATION
      ?auto_96029 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96024 ?auto_96023 ) ) ( not ( = ?auto_96025 ?auto_96023 ) ) ( not ( = ?auto_96025 ?auto_96024 ) ) ( not ( = ?auto_96026 ?auto_96023 ) ) ( not ( = ?auto_96026 ?auto_96024 ) ) ( not ( = ?auto_96026 ?auto_96025 ) ) ( IN-CITY ?auto_96028 ?auto_96030 ) ( IN-CITY ?auto_96022 ?auto_96030 ) ( not ( = ?auto_96022 ?auto_96028 ) ) ( OBJ-AT ?auto_96024 ?auto_96022 ) ( OBJ-AT ?auto_96026 ?auto_96028 ) ( IN-CITY ?auto_96027 ?auto_96030 ) ( not ( = ?auto_96022 ?auto_96027 ) ) ( not ( = ?auto_96028 ?auto_96027 ) ) ( OBJ-AT ?auto_96025 ?auto_96027 ) ( OBJ-AT ?auto_96023 ?auto_96028 ) ( TRUCK-AT ?auto_96029 ?auto_96022 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96024 ?auto_96026 ?auto_96022 )
      ( DELIVER-4PKG-VERIFY ?auto_96023 ?auto_96024 ?auto_96025 ?auto_96026 ?auto_96022 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96052 - OBJ
      ?auto_96053 - OBJ
      ?auto_96054 - OBJ
      ?auto_96055 - OBJ
      ?auto_96051 - LOCATION
    )
    :vars
    (
      ?auto_96057 - LOCATION
      ?auto_96059 - CITY
      ?auto_96056 - LOCATION
      ?auto_96058 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96053 ?auto_96052 ) ) ( not ( = ?auto_96054 ?auto_96052 ) ) ( not ( = ?auto_96054 ?auto_96053 ) ) ( not ( = ?auto_96055 ?auto_96052 ) ) ( not ( = ?auto_96055 ?auto_96053 ) ) ( not ( = ?auto_96055 ?auto_96054 ) ) ( IN-CITY ?auto_96057 ?auto_96059 ) ( IN-CITY ?auto_96051 ?auto_96059 ) ( not ( = ?auto_96051 ?auto_96057 ) ) ( OBJ-AT ?auto_96053 ?auto_96051 ) ( OBJ-AT ?auto_96054 ?auto_96057 ) ( IN-CITY ?auto_96056 ?auto_96059 ) ( not ( = ?auto_96051 ?auto_96056 ) ) ( not ( = ?auto_96057 ?auto_96056 ) ) ( OBJ-AT ?auto_96055 ?auto_96056 ) ( OBJ-AT ?auto_96052 ?auto_96057 ) ( TRUCK-AT ?auto_96058 ?auto_96051 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96053 ?auto_96054 ?auto_96051 )
      ( DELIVER-4PKG-VERIFY ?auto_96052 ?auto_96053 ?auto_96054 ?auto_96055 ?auto_96051 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96144 - OBJ
      ?auto_96145 - OBJ
      ?auto_96146 - OBJ
      ?auto_96147 - OBJ
      ?auto_96143 - LOCATION
    )
    :vars
    (
      ?auto_96149 - LOCATION
      ?auto_96151 - CITY
      ?auto_96148 - LOCATION
      ?auto_96150 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96145 ?auto_96144 ) ) ( not ( = ?auto_96146 ?auto_96144 ) ) ( not ( = ?auto_96146 ?auto_96145 ) ) ( not ( = ?auto_96147 ?auto_96144 ) ) ( not ( = ?auto_96147 ?auto_96145 ) ) ( not ( = ?auto_96147 ?auto_96146 ) ) ( IN-CITY ?auto_96149 ?auto_96151 ) ( IN-CITY ?auto_96143 ?auto_96151 ) ( not ( = ?auto_96143 ?auto_96149 ) ) ( OBJ-AT ?auto_96146 ?auto_96143 ) ( OBJ-AT ?auto_96147 ?auto_96149 ) ( IN-CITY ?auto_96148 ?auto_96151 ) ( not ( = ?auto_96143 ?auto_96148 ) ) ( not ( = ?auto_96149 ?auto_96148 ) ) ( OBJ-AT ?auto_96145 ?auto_96148 ) ( OBJ-AT ?auto_96144 ?auto_96149 ) ( TRUCK-AT ?auto_96150 ?auto_96143 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96146 ?auto_96147 ?auto_96143 )
      ( DELIVER-4PKG-VERIFY ?auto_96144 ?auto_96145 ?auto_96146 ?auto_96147 ?auto_96143 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96173 - OBJ
      ?auto_96174 - OBJ
      ?auto_96175 - OBJ
      ?auto_96176 - OBJ
      ?auto_96172 - LOCATION
    )
    :vars
    (
      ?auto_96178 - LOCATION
      ?auto_96180 - CITY
      ?auto_96177 - LOCATION
      ?auto_96179 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96174 ?auto_96173 ) ) ( not ( = ?auto_96175 ?auto_96173 ) ) ( not ( = ?auto_96175 ?auto_96174 ) ) ( not ( = ?auto_96176 ?auto_96173 ) ) ( not ( = ?auto_96176 ?auto_96174 ) ) ( not ( = ?auto_96176 ?auto_96175 ) ) ( IN-CITY ?auto_96178 ?auto_96180 ) ( IN-CITY ?auto_96172 ?auto_96180 ) ( not ( = ?auto_96172 ?auto_96178 ) ) ( OBJ-AT ?auto_96176 ?auto_96172 ) ( OBJ-AT ?auto_96175 ?auto_96178 ) ( IN-CITY ?auto_96177 ?auto_96180 ) ( not ( = ?auto_96172 ?auto_96177 ) ) ( not ( = ?auto_96178 ?auto_96177 ) ) ( OBJ-AT ?auto_96174 ?auto_96177 ) ( OBJ-AT ?auto_96173 ?auto_96178 ) ( TRUCK-AT ?auto_96179 ?auto_96172 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96176 ?auto_96175 ?auto_96172 )
      ( DELIVER-4PKG-VERIFY ?auto_96173 ?auto_96174 ?auto_96175 ?auto_96176 ?auto_96172 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96232 - OBJ
      ?auto_96233 - OBJ
      ?auto_96234 - OBJ
      ?auto_96235 - OBJ
      ?auto_96231 - LOCATION
    )
    :vars
    (
      ?auto_96237 - LOCATION
      ?auto_96239 - CITY
      ?auto_96236 - LOCATION
      ?auto_96238 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96233 ?auto_96232 ) ) ( not ( = ?auto_96234 ?auto_96232 ) ) ( not ( = ?auto_96234 ?auto_96233 ) ) ( not ( = ?auto_96235 ?auto_96232 ) ) ( not ( = ?auto_96235 ?auto_96233 ) ) ( not ( = ?auto_96235 ?auto_96234 ) ) ( IN-CITY ?auto_96237 ?auto_96239 ) ( IN-CITY ?auto_96231 ?auto_96239 ) ( not ( = ?auto_96231 ?auto_96237 ) ) ( OBJ-AT ?auto_96234 ?auto_96231 ) ( OBJ-AT ?auto_96233 ?auto_96237 ) ( IN-CITY ?auto_96236 ?auto_96239 ) ( not ( = ?auto_96231 ?auto_96236 ) ) ( not ( = ?auto_96237 ?auto_96236 ) ) ( OBJ-AT ?auto_96235 ?auto_96236 ) ( OBJ-AT ?auto_96232 ?auto_96237 ) ( TRUCK-AT ?auto_96238 ?auto_96231 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96234 ?auto_96233 ?auto_96231 )
      ( DELIVER-4PKG-VERIFY ?auto_96232 ?auto_96233 ?auto_96234 ?auto_96235 ?auto_96231 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96293 - OBJ
      ?auto_96294 - OBJ
      ?auto_96295 - OBJ
      ?auto_96296 - OBJ
      ?auto_96292 - LOCATION
    )
    :vars
    (
      ?auto_96298 - LOCATION
      ?auto_96300 - CITY
      ?auto_96297 - LOCATION
      ?auto_96299 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96294 ?auto_96293 ) ) ( not ( = ?auto_96295 ?auto_96293 ) ) ( not ( = ?auto_96295 ?auto_96294 ) ) ( not ( = ?auto_96296 ?auto_96293 ) ) ( not ( = ?auto_96296 ?auto_96294 ) ) ( not ( = ?auto_96296 ?auto_96295 ) ) ( IN-CITY ?auto_96298 ?auto_96300 ) ( IN-CITY ?auto_96292 ?auto_96300 ) ( not ( = ?auto_96292 ?auto_96298 ) ) ( OBJ-AT ?auto_96296 ?auto_96292 ) ( OBJ-AT ?auto_96294 ?auto_96298 ) ( IN-CITY ?auto_96297 ?auto_96300 ) ( not ( = ?auto_96292 ?auto_96297 ) ) ( not ( = ?auto_96298 ?auto_96297 ) ) ( OBJ-AT ?auto_96295 ?auto_96297 ) ( OBJ-AT ?auto_96293 ?auto_96298 ) ( TRUCK-AT ?auto_96299 ?auto_96292 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96296 ?auto_96294 ?auto_96292 )
      ( DELIVER-4PKG-VERIFY ?auto_96293 ?auto_96294 ?auto_96295 ?auto_96296 ?auto_96292 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96384 - OBJ
      ?auto_96385 - OBJ
      ?auto_96386 - OBJ
      ?auto_96387 - OBJ
      ?auto_96383 - LOCATION
    )
    :vars
    (
      ?auto_96389 - LOCATION
      ?auto_96391 - CITY
      ?auto_96388 - LOCATION
      ?auto_96390 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96385 ?auto_96384 ) ) ( not ( = ?auto_96386 ?auto_96384 ) ) ( not ( = ?auto_96386 ?auto_96385 ) ) ( not ( = ?auto_96387 ?auto_96384 ) ) ( not ( = ?auto_96387 ?auto_96385 ) ) ( not ( = ?auto_96387 ?auto_96386 ) ) ( IN-CITY ?auto_96389 ?auto_96391 ) ( IN-CITY ?auto_96383 ?auto_96391 ) ( not ( = ?auto_96383 ?auto_96389 ) ) ( OBJ-AT ?auto_96385 ?auto_96383 ) ( OBJ-AT ?auto_96387 ?auto_96389 ) ( IN-CITY ?auto_96388 ?auto_96391 ) ( not ( = ?auto_96383 ?auto_96388 ) ) ( not ( = ?auto_96389 ?auto_96388 ) ) ( OBJ-AT ?auto_96384 ?auto_96388 ) ( OBJ-AT ?auto_96386 ?auto_96389 ) ( TRUCK-AT ?auto_96390 ?auto_96383 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96385 ?auto_96387 ?auto_96383 )
      ( DELIVER-4PKG-VERIFY ?auto_96384 ?auto_96385 ?auto_96386 ?auto_96387 ?auto_96383 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96413 - OBJ
      ?auto_96414 - OBJ
      ?auto_96415 - OBJ
      ?auto_96416 - OBJ
      ?auto_96412 - LOCATION
    )
    :vars
    (
      ?auto_96418 - LOCATION
      ?auto_96420 - CITY
      ?auto_96417 - LOCATION
      ?auto_96419 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96414 ?auto_96413 ) ) ( not ( = ?auto_96415 ?auto_96413 ) ) ( not ( = ?auto_96415 ?auto_96414 ) ) ( not ( = ?auto_96416 ?auto_96413 ) ) ( not ( = ?auto_96416 ?auto_96414 ) ) ( not ( = ?auto_96416 ?auto_96415 ) ) ( IN-CITY ?auto_96418 ?auto_96420 ) ( IN-CITY ?auto_96412 ?auto_96420 ) ( not ( = ?auto_96412 ?auto_96418 ) ) ( OBJ-AT ?auto_96414 ?auto_96412 ) ( OBJ-AT ?auto_96415 ?auto_96418 ) ( IN-CITY ?auto_96417 ?auto_96420 ) ( not ( = ?auto_96412 ?auto_96417 ) ) ( not ( = ?auto_96418 ?auto_96417 ) ) ( OBJ-AT ?auto_96413 ?auto_96417 ) ( OBJ-AT ?auto_96416 ?auto_96418 ) ( TRUCK-AT ?auto_96419 ?auto_96412 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96414 ?auto_96415 ?auto_96412 )
      ( DELIVER-4PKG-VERIFY ?auto_96413 ?auto_96414 ?auto_96415 ?auto_96416 ?auto_96412 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96442 - OBJ
      ?auto_96443 - OBJ
      ?auto_96444 - OBJ
      ?auto_96445 - OBJ
      ?auto_96441 - LOCATION
    )
    :vars
    (
      ?auto_96447 - LOCATION
      ?auto_96449 - CITY
      ?auto_96446 - LOCATION
      ?auto_96448 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96443 ?auto_96442 ) ) ( not ( = ?auto_96444 ?auto_96442 ) ) ( not ( = ?auto_96444 ?auto_96443 ) ) ( not ( = ?auto_96445 ?auto_96442 ) ) ( not ( = ?auto_96445 ?auto_96443 ) ) ( not ( = ?auto_96445 ?auto_96444 ) ) ( IN-CITY ?auto_96447 ?auto_96449 ) ( IN-CITY ?auto_96441 ?auto_96449 ) ( not ( = ?auto_96441 ?auto_96447 ) ) ( OBJ-AT ?auto_96444 ?auto_96441 ) ( OBJ-AT ?auto_96445 ?auto_96447 ) ( IN-CITY ?auto_96446 ?auto_96449 ) ( not ( = ?auto_96441 ?auto_96446 ) ) ( not ( = ?auto_96447 ?auto_96446 ) ) ( OBJ-AT ?auto_96442 ?auto_96446 ) ( OBJ-AT ?auto_96443 ?auto_96447 ) ( TRUCK-AT ?auto_96448 ?auto_96441 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96444 ?auto_96445 ?auto_96441 )
      ( DELIVER-4PKG-VERIFY ?auto_96442 ?auto_96443 ?auto_96444 ?auto_96445 ?auto_96441 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96471 - OBJ
      ?auto_96472 - OBJ
      ?auto_96473 - OBJ
      ?auto_96474 - OBJ
      ?auto_96470 - LOCATION
    )
    :vars
    (
      ?auto_96476 - LOCATION
      ?auto_96478 - CITY
      ?auto_96475 - LOCATION
      ?auto_96477 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96472 ?auto_96471 ) ) ( not ( = ?auto_96473 ?auto_96471 ) ) ( not ( = ?auto_96473 ?auto_96472 ) ) ( not ( = ?auto_96474 ?auto_96471 ) ) ( not ( = ?auto_96474 ?auto_96472 ) ) ( not ( = ?auto_96474 ?auto_96473 ) ) ( IN-CITY ?auto_96476 ?auto_96478 ) ( IN-CITY ?auto_96470 ?auto_96478 ) ( not ( = ?auto_96470 ?auto_96476 ) ) ( OBJ-AT ?auto_96474 ?auto_96470 ) ( OBJ-AT ?auto_96473 ?auto_96476 ) ( IN-CITY ?auto_96475 ?auto_96478 ) ( not ( = ?auto_96470 ?auto_96475 ) ) ( not ( = ?auto_96476 ?auto_96475 ) ) ( OBJ-AT ?auto_96471 ?auto_96475 ) ( OBJ-AT ?auto_96472 ?auto_96476 ) ( TRUCK-AT ?auto_96477 ?auto_96470 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96474 ?auto_96473 ?auto_96470 )
      ( DELIVER-4PKG-VERIFY ?auto_96471 ?auto_96472 ?auto_96473 ?auto_96474 ?auto_96470 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96593 - OBJ
      ?auto_96594 - OBJ
      ?auto_96595 - OBJ
      ?auto_96596 - OBJ
      ?auto_96592 - LOCATION
    )
    :vars
    (
      ?auto_96598 - LOCATION
      ?auto_96600 - CITY
      ?auto_96597 - LOCATION
      ?auto_96599 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96594 ?auto_96593 ) ) ( not ( = ?auto_96595 ?auto_96593 ) ) ( not ( = ?auto_96595 ?auto_96594 ) ) ( not ( = ?auto_96596 ?auto_96593 ) ) ( not ( = ?auto_96596 ?auto_96594 ) ) ( not ( = ?auto_96596 ?auto_96595 ) ) ( IN-CITY ?auto_96598 ?auto_96600 ) ( IN-CITY ?auto_96592 ?auto_96600 ) ( not ( = ?auto_96592 ?auto_96598 ) ) ( OBJ-AT ?auto_96595 ?auto_96592 ) ( OBJ-AT ?auto_96594 ?auto_96598 ) ( IN-CITY ?auto_96597 ?auto_96600 ) ( not ( = ?auto_96592 ?auto_96597 ) ) ( not ( = ?auto_96598 ?auto_96597 ) ) ( OBJ-AT ?auto_96593 ?auto_96597 ) ( OBJ-AT ?auto_96596 ?auto_96598 ) ( TRUCK-AT ?auto_96599 ?auto_96592 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96595 ?auto_96594 ?auto_96592 )
      ( DELIVER-4PKG-VERIFY ?auto_96593 ?auto_96594 ?auto_96595 ?auto_96596 ?auto_96592 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96622 - OBJ
      ?auto_96623 - OBJ
      ?auto_96624 - OBJ
      ?auto_96625 - OBJ
      ?auto_96621 - LOCATION
    )
    :vars
    (
      ?auto_96627 - LOCATION
      ?auto_96629 - CITY
      ?auto_96626 - LOCATION
      ?auto_96628 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96623 ?auto_96622 ) ) ( not ( = ?auto_96624 ?auto_96622 ) ) ( not ( = ?auto_96624 ?auto_96623 ) ) ( not ( = ?auto_96625 ?auto_96622 ) ) ( not ( = ?auto_96625 ?auto_96623 ) ) ( not ( = ?auto_96625 ?auto_96624 ) ) ( IN-CITY ?auto_96627 ?auto_96629 ) ( IN-CITY ?auto_96621 ?auto_96629 ) ( not ( = ?auto_96621 ?auto_96627 ) ) ( OBJ-AT ?auto_96625 ?auto_96621 ) ( OBJ-AT ?auto_96623 ?auto_96627 ) ( IN-CITY ?auto_96626 ?auto_96629 ) ( not ( = ?auto_96621 ?auto_96626 ) ) ( not ( = ?auto_96627 ?auto_96626 ) ) ( OBJ-AT ?auto_96622 ?auto_96626 ) ( OBJ-AT ?auto_96624 ?auto_96627 ) ( TRUCK-AT ?auto_96628 ?auto_96621 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96625 ?auto_96623 ?auto_96621 )
      ( DELIVER-4PKG-VERIFY ?auto_96622 ?auto_96623 ?auto_96624 ?auto_96625 ?auto_96621 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96807 - OBJ
      ?auto_96808 - OBJ
      ?auto_96809 - OBJ
      ?auto_96810 - OBJ
      ?auto_96806 - LOCATION
    )
    :vars
    (
      ?auto_96812 - LOCATION
      ?auto_96814 - CITY
      ?auto_96811 - LOCATION
      ?auto_96813 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96808 ?auto_96807 ) ) ( not ( = ?auto_96809 ?auto_96807 ) ) ( not ( = ?auto_96809 ?auto_96808 ) ) ( not ( = ?auto_96810 ?auto_96807 ) ) ( not ( = ?auto_96810 ?auto_96808 ) ) ( not ( = ?auto_96810 ?auto_96809 ) ) ( IN-CITY ?auto_96812 ?auto_96814 ) ( IN-CITY ?auto_96806 ?auto_96814 ) ( not ( = ?auto_96806 ?auto_96812 ) ) ( OBJ-AT ?auto_96808 ?auto_96806 ) ( OBJ-AT ?auto_96807 ?auto_96812 ) ( IN-CITY ?auto_96811 ?auto_96814 ) ( not ( = ?auto_96806 ?auto_96811 ) ) ( not ( = ?auto_96812 ?auto_96811 ) ) ( OBJ-AT ?auto_96810 ?auto_96811 ) ( OBJ-AT ?auto_96809 ?auto_96812 ) ( TRUCK-AT ?auto_96813 ?auto_96806 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96808 ?auto_96807 ?auto_96806 )
      ( DELIVER-4PKG-VERIFY ?auto_96807 ?auto_96808 ?auto_96809 ?auto_96810 ?auto_96806 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96836 - OBJ
      ?auto_96837 - OBJ
      ?auto_96838 - OBJ
      ?auto_96839 - OBJ
      ?auto_96835 - LOCATION
    )
    :vars
    (
      ?auto_96841 - LOCATION
      ?auto_96843 - CITY
      ?auto_96840 - LOCATION
      ?auto_96842 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96837 ?auto_96836 ) ) ( not ( = ?auto_96838 ?auto_96836 ) ) ( not ( = ?auto_96838 ?auto_96837 ) ) ( not ( = ?auto_96839 ?auto_96836 ) ) ( not ( = ?auto_96839 ?auto_96837 ) ) ( not ( = ?auto_96839 ?auto_96838 ) ) ( IN-CITY ?auto_96841 ?auto_96843 ) ( IN-CITY ?auto_96835 ?auto_96843 ) ( not ( = ?auto_96835 ?auto_96841 ) ) ( OBJ-AT ?auto_96837 ?auto_96835 ) ( OBJ-AT ?auto_96836 ?auto_96841 ) ( IN-CITY ?auto_96840 ?auto_96843 ) ( not ( = ?auto_96835 ?auto_96840 ) ) ( not ( = ?auto_96841 ?auto_96840 ) ) ( OBJ-AT ?auto_96838 ?auto_96840 ) ( OBJ-AT ?auto_96839 ?auto_96841 ) ( TRUCK-AT ?auto_96842 ?auto_96835 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96837 ?auto_96836 ?auto_96835 )
      ( DELIVER-4PKG-VERIFY ?auto_96836 ?auto_96837 ?auto_96838 ?auto_96839 ?auto_96835 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96927 - OBJ
      ?auto_96928 - OBJ
      ?auto_96929 - OBJ
      ?auto_96930 - OBJ
      ?auto_96926 - LOCATION
    )
    :vars
    (
      ?auto_96932 - LOCATION
      ?auto_96934 - CITY
      ?auto_96931 - LOCATION
      ?auto_96933 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96928 ?auto_96927 ) ) ( not ( = ?auto_96929 ?auto_96927 ) ) ( not ( = ?auto_96929 ?auto_96928 ) ) ( not ( = ?auto_96930 ?auto_96927 ) ) ( not ( = ?auto_96930 ?auto_96928 ) ) ( not ( = ?auto_96930 ?auto_96929 ) ) ( IN-CITY ?auto_96932 ?auto_96934 ) ( IN-CITY ?auto_96926 ?auto_96934 ) ( not ( = ?auto_96926 ?auto_96932 ) ) ( OBJ-AT ?auto_96929 ?auto_96926 ) ( OBJ-AT ?auto_96927 ?auto_96932 ) ( IN-CITY ?auto_96931 ?auto_96934 ) ( not ( = ?auto_96926 ?auto_96931 ) ) ( not ( = ?auto_96932 ?auto_96931 ) ) ( OBJ-AT ?auto_96930 ?auto_96931 ) ( OBJ-AT ?auto_96928 ?auto_96932 ) ( TRUCK-AT ?auto_96933 ?auto_96926 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96929 ?auto_96927 ?auto_96926 )
      ( DELIVER-4PKG-VERIFY ?auto_96927 ?auto_96928 ?auto_96929 ?auto_96930 ?auto_96926 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96988 - OBJ
      ?auto_96989 - OBJ
      ?auto_96990 - OBJ
      ?auto_96991 - OBJ
      ?auto_96987 - LOCATION
    )
    :vars
    (
      ?auto_96993 - LOCATION
      ?auto_96995 - CITY
      ?auto_96992 - LOCATION
      ?auto_96994 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_96989 ?auto_96988 ) ) ( not ( = ?auto_96990 ?auto_96988 ) ) ( not ( = ?auto_96990 ?auto_96989 ) ) ( not ( = ?auto_96991 ?auto_96988 ) ) ( not ( = ?auto_96991 ?auto_96989 ) ) ( not ( = ?auto_96991 ?auto_96990 ) ) ( IN-CITY ?auto_96993 ?auto_96995 ) ( IN-CITY ?auto_96987 ?auto_96995 ) ( not ( = ?auto_96987 ?auto_96993 ) ) ( OBJ-AT ?auto_96991 ?auto_96987 ) ( OBJ-AT ?auto_96988 ?auto_96993 ) ( IN-CITY ?auto_96992 ?auto_96995 ) ( not ( = ?auto_96987 ?auto_96992 ) ) ( not ( = ?auto_96993 ?auto_96992 ) ) ( OBJ-AT ?auto_96990 ?auto_96992 ) ( OBJ-AT ?auto_96989 ?auto_96993 ) ( TRUCK-AT ?auto_96994 ?auto_96987 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96991 ?auto_96988 ?auto_96987 )
      ( DELIVER-4PKG-VERIFY ?auto_96988 ?auto_96989 ?auto_96990 ?auto_96991 ?auto_96987 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_97079 - OBJ
      ?auto_97080 - OBJ
      ?auto_97081 - OBJ
      ?auto_97082 - OBJ
      ?auto_97078 - LOCATION
    )
    :vars
    (
      ?auto_97084 - LOCATION
      ?auto_97086 - CITY
      ?auto_97083 - LOCATION
      ?auto_97085 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97080 ?auto_97079 ) ) ( not ( = ?auto_97081 ?auto_97079 ) ) ( not ( = ?auto_97081 ?auto_97080 ) ) ( not ( = ?auto_97082 ?auto_97079 ) ) ( not ( = ?auto_97082 ?auto_97080 ) ) ( not ( = ?auto_97082 ?auto_97081 ) ) ( IN-CITY ?auto_97084 ?auto_97086 ) ( IN-CITY ?auto_97078 ?auto_97086 ) ( not ( = ?auto_97078 ?auto_97084 ) ) ( OBJ-AT ?auto_97081 ?auto_97078 ) ( OBJ-AT ?auto_97079 ?auto_97084 ) ( IN-CITY ?auto_97083 ?auto_97086 ) ( not ( = ?auto_97078 ?auto_97083 ) ) ( not ( = ?auto_97084 ?auto_97083 ) ) ( OBJ-AT ?auto_97080 ?auto_97083 ) ( OBJ-AT ?auto_97082 ?auto_97084 ) ( TRUCK-AT ?auto_97085 ?auto_97078 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97081 ?auto_97079 ?auto_97078 )
      ( DELIVER-4PKG-VERIFY ?auto_97079 ?auto_97080 ?auto_97081 ?auto_97082 ?auto_97078 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_97108 - OBJ
      ?auto_97109 - OBJ
      ?auto_97110 - OBJ
      ?auto_97111 - OBJ
      ?auto_97107 - LOCATION
    )
    :vars
    (
      ?auto_97113 - LOCATION
      ?auto_97115 - CITY
      ?auto_97112 - LOCATION
      ?auto_97114 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97109 ?auto_97108 ) ) ( not ( = ?auto_97110 ?auto_97108 ) ) ( not ( = ?auto_97110 ?auto_97109 ) ) ( not ( = ?auto_97111 ?auto_97108 ) ) ( not ( = ?auto_97111 ?auto_97109 ) ) ( not ( = ?auto_97111 ?auto_97110 ) ) ( IN-CITY ?auto_97113 ?auto_97115 ) ( IN-CITY ?auto_97107 ?auto_97115 ) ( not ( = ?auto_97107 ?auto_97113 ) ) ( OBJ-AT ?auto_97111 ?auto_97107 ) ( OBJ-AT ?auto_97108 ?auto_97113 ) ( IN-CITY ?auto_97112 ?auto_97115 ) ( not ( = ?auto_97107 ?auto_97112 ) ) ( not ( = ?auto_97113 ?auto_97112 ) ) ( OBJ-AT ?auto_97109 ?auto_97112 ) ( OBJ-AT ?auto_97110 ?auto_97113 ) ( TRUCK-AT ?auto_97114 ?auto_97107 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97111 ?auto_97108 ?auto_97107 )
      ( DELIVER-4PKG-VERIFY ?auto_97108 ?auto_97109 ?auto_97110 ?auto_97111 ?auto_97107 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_97402 - OBJ
      ?auto_97401 - LOCATION
    )
    :vars
    (
      ?auto_97409 - OBJ
      ?auto_97406 - LOCATION
      ?auto_97408 - CITY
      ?auto_97405 - OBJ
      ?auto_97404 - LOCATION
      ?auto_97403 - OBJ
      ?auto_97407 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97402 ?auto_97409 ) ) ( IN-CITY ?auto_97406 ?auto_97408 ) ( IN-CITY ?auto_97401 ?auto_97408 ) ( not ( = ?auto_97401 ?auto_97406 ) ) ( OBJ-AT ?auto_97402 ?auto_97406 ) ( not ( = ?auto_97405 ?auto_97409 ) ) ( not ( = ?auto_97402 ?auto_97405 ) ) ( IN-CITY ?auto_97404 ?auto_97408 ) ( not ( = ?auto_97401 ?auto_97404 ) ) ( not ( = ?auto_97406 ?auto_97404 ) ) ( OBJ-AT ?auto_97405 ?auto_97404 ) ( not ( = ?auto_97403 ?auto_97409 ) ) ( not ( = ?auto_97402 ?auto_97403 ) ) ( not ( = ?auto_97405 ?auto_97403 ) ) ( OBJ-AT ?auto_97403 ?auto_97406 ) ( TRUCK-AT ?auto_97407 ?auto_97401 ) ( IN-TRUCK ?auto_97409 ?auto_97407 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_97409 ?auto_97401 )
      ( DELIVER-2PKG ?auto_97409 ?auto_97402 ?auto_97401 )
      ( DELIVER-1PKG-VERIFY ?auto_97402 ?auto_97401 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_97411 - OBJ
      ?auto_97412 - OBJ
      ?auto_97410 - LOCATION
    )
    :vars
    (
      ?auto_97415 - LOCATION
      ?auto_97413 - CITY
      ?auto_97417 - OBJ
      ?auto_97414 - LOCATION
      ?auto_97418 - OBJ
      ?auto_97416 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97412 ?auto_97411 ) ) ( IN-CITY ?auto_97415 ?auto_97413 ) ( IN-CITY ?auto_97410 ?auto_97413 ) ( not ( = ?auto_97410 ?auto_97415 ) ) ( OBJ-AT ?auto_97412 ?auto_97415 ) ( not ( = ?auto_97417 ?auto_97411 ) ) ( not ( = ?auto_97412 ?auto_97417 ) ) ( IN-CITY ?auto_97414 ?auto_97413 ) ( not ( = ?auto_97410 ?auto_97414 ) ) ( not ( = ?auto_97415 ?auto_97414 ) ) ( OBJ-AT ?auto_97417 ?auto_97414 ) ( not ( = ?auto_97418 ?auto_97411 ) ) ( not ( = ?auto_97412 ?auto_97418 ) ) ( not ( = ?auto_97417 ?auto_97418 ) ) ( OBJ-AT ?auto_97418 ?auto_97415 ) ( TRUCK-AT ?auto_97416 ?auto_97410 ) ( IN-TRUCK ?auto_97411 ?auto_97416 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_97412 ?auto_97410 )
      ( DELIVER-2PKG-VERIFY ?auto_97411 ?auto_97412 ?auto_97410 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_97420 - OBJ
      ?auto_97421 - OBJ
      ?auto_97419 - LOCATION
    )
    :vars
    (
      ?auto_97427 - OBJ
      ?auto_97423 - LOCATION
      ?auto_97422 - CITY
      ?auto_97425 - OBJ
      ?auto_97426 - LOCATION
      ?auto_97424 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97421 ?auto_97420 ) ) ( not ( = ?auto_97421 ?auto_97427 ) ) ( IN-CITY ?auto_97423 ?auto_97422 ) ( IN-CITY ?auto_97419 ?auto_97422 ) ( not ( = ?auto_97419 ?auto_97423 ) ) ( OBJ-AT ?auto_97421 ?auto_97423 ) ( not ( = ?auto_97425 ?auto_97427 ) ) ( not ( = ?auto_97421 ?auto_97425 ) ) ( IN-CITY ?auto_97426 ?auto_97422 ) ( not ( = ?auto_97419 ?auto_97426 ) ) ( not ( = ?auto_97423 ?auto_97426 ) ) ( OBJ-AT ?auto_97425 ?auto_97426 ) ( not ( = ?auto_97420 ?auto_97427 ) ) ( not ( = ?auto_97425 ?auto_97420 ) ) ( OBJ-AT ?auto_97420 ?auto_97423 ) ( TRUCK-AT ?auto_97424 ?auto_97419 ) ( IN-TRUCK ?auto_97427 ?auto_97424 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97427 ?auto_97421 ?auto_97419 )
      ( DELIVER-2PKG-VERIFY ?auto_97420 ?auto_97421 ?auto_97419 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_97429 - OBJ
      ?auto_97430 - OBJ
      ?auto_97428 - LOCATION
    )
    :vars
    (
      ?auto_97436 - OBJ
      ?auto_97432 - LOCATION
      ?auto_97431 - CITY
      ?auto_97435 - LOCATION
      ?auto_97434 - OBJ
      ?auto_97433 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97430 ?auto_97429 ) ) ( not ( = ?auto_97430 ?auto_97436 ) ) ( IN-CITY ?auto_97432 ?auto_97431 ) ( IN-CITY ?auto_97428 ?auto_97431 ) ( not ( = ?auto_97428 ?auto_97432 ) ) ( OBJ-AT ?auto_97430 ?auto_97432 ) ( not ( = ?auto_97429 ?auto_97436 ) ) ( IN-CITY ?auto_97435 ?auto_97431 ) ( not ( = ?auto_97428 ?auto_97435 ) ) ( not ( = ?auto_97432 ?auto_97435 ) ) ( OBJ-AT ?auto_97429 ?auto_97435 ) ( not ( = ?auto_97434 ?auto_97436 ) ) ( not ( = ?auto_97430 ?auto_97434 ) ) ( not ( = ?auto_97429 ?auto_97434 ) ) ( OBJ-AT ?auto_97434 ?auto_97432 ) ( TRUCK-AT ?auto_97433 ?auto_97428 ) ( IN-TRUCK ?auto_97436 ?auto_97433 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97436 ?auto_97430 ?auto_97428 )
      ( DELIVER-2PKG-VERIFY ?auto_97429 ?auto_97430 ?auto_97428 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_97438 - OBJ
      ?auto_97439 - OBJ
      ?auto_97437 - LOCATION
    )
    :vars
    (
      ?auto_97441 - LOCATION
      ?auto_97440 - CITY
      ?auto_97443 - OBJ
      ?auto_97445 - LOCATION
      ?auto_97444 - OBJ
      ?auto_97442 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97439 ?auto_97438 ) ) ( IN-CITY ?auto_97441 ?auto_97440 ) ( IN-CITY ?auto_97437 ?auto_97440 ) ( not ( = ?auto_97437 ?auto_97441 ) ) ( OBJ-AT ?auto_97438 ?auto_97441 ) ( not ( = ?auto_97443 ?auto_97439 ) ) ( not ( = ?auto_97438 ?auto_97443 ) ) ( IN-CITY ?auto_97445 ?auto_97440 ) ( not ( = ?auto_97437 ?auto_97445 ) ) ( not ( = ?auto_97441 ?auto_97445 ) ) ( OBJ-AT ?auto_97443 ?auto_97445 ) ( not ( = ?auto_97444 ?auto_97439 ) ) ( not ( = ?auto_97438 ?auto_97444 ) ) ( not ( = ?auto_97443 ?auto_97444 ) ) ( OBJ-AT ?auto_97444 ?auto_97441 ) ( TRUCK-AT ?auto_97442 ?auto_97437 ) ( IN-TRUCK ?auto_97439 ?auto_97442 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97439 ?auto_97438 ?auto_97437 )
      ( DELIVER-2PKG-VERIFY ?auto_97438 ?auto_97439 ?auto_97437 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_97447 - OBJ
      ?auto_97448 - OBJ
      ?auto_97446 - LOCATION
    )
    :vars
    (
      ?auto_97454 - OBJ
      ?auto_97450 - LOCATION
      ?auto_97449 - CITY
      ?auto_97452 - OBJ
      ?auto_97453 - LOCATION
      ?auto_97451 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97448 ?auto_97447 ) ) ( not ( = ?auto_97447 ?auto_97454 ) ) ( IN-CITY ?auto_97450 ?auto_97449 ) ( IN-CITY ?auto_97446 ?auto_97449 ) ( not ( = ?auto_97446 ?auto_97450 ) ) ( OBJ-AT ?auto_97447 ?auto_97450 ) ( not ( = ?auto_97452 ?auto_97454 ) ) ( not ( = ?auto_97447 ?auto_97452 ) ) ( IN-CITY ?auto_97453 ?auto_97449 ) ( not ( = ?auto_97446 ?auto_97453 ) ) ( not ( = ?auto_97450 ?auto_97453 ) ) ( OBJ-AT ?auto_97452 ?auto_97453 ) ( not ( = ?auto_97448 ?auto_97454 ) ) ( not ( = ?auto_97452 ?auto_97448 ) ) ( OBJ-AT ?auto_97448 ?auto_97450 ) ( TRUCK-AT ?auto_97451 ?auto_97446 ) ( IN-TRUCK ?auto_97454 ?auto_97451 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97454 ?auto_97447 ?auto_97446 )
      ( DELIVER-2PKG-VERIFY ?auto_97447 ?auto_97448 ?auto_97446 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_97456 - OBJ
      ?auto_97457 - OBJ
      ?auto_97455 - LOCATION
    )
    :vars
    (
      ?auto_97463 - OBJ
      ?auto_97459 - LOCATION
      ?auto_97458 - CITY
      ?auto_97462 - LOCATION
      ?auto_97461 - OBJ
      ?auto_97460 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97457 ?auto_97456 ) ) ( not ( = ?auto_97456 ?auto_97463 ) ) ( IN-CITY ?auto_97459 ?auto_97458 ) ( IN-CITY ?auto_97455 ?auto_97458 ) ( not ( = ?auto_97455 ?auto_97459 ) ) ( OBJ-AT ?auto_97456 ?auto_97459 ) ( not ( = ?auto_97457 ?auto_97463 ) ) ( IN-CITY ?auto_97462 ?auto_97458 ) ( not ( = ?auto_97455 ?auto_97462 ) ) ( not ( = ?auto_97459 ?auto_97462 ) ) ( OBJ-AT ?auto_97457 ?auto_97462 ) ( not ( = ?auto_97461 ?auto_97463 ) ) ( not ( = ?auto_97456 ?auto_97461 ) ) ( not ( = ?auto_97457 ?auto_97461 ) ) ( OBJ-AT ?auto_97461 ?auto_97459 ) ( TRUCK-AT ?auto_97460 ?auto_97455 ) ( IN-TRUCK ?auto_97463 ?auto_97460 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97463 ?auto_97456 ?auto_97455 )
      ( DELIVER-2PKG-VERIFY ?auto_97456 ?auto_97457 ?auto_97455 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97485 - OBJ
      ?auto_97486 - OBJ
      ?auto_97487 - OBJ
      ?auto_97484 - LOCATION
    )
    :vars
    (
      ?auto_97489 - LOCATION
      ?auto_97488 - CITY
      ?auto_97491 - OBJ
      ?auto_97492 - LOCATION
      ?auto_97490 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97486 ?auto_97485 ) ) ( not ( = ?auto_97487 ?auto_97485 ) ) ( not ( = ?auto_97487 ?auto_97486 ) ) ( IN-CITY ?auto_97489 ?auto_97488 ) ( IN-CITY ?auto_97484 ?auto_97488 ) ( not ( = ?auto_97484 ?auto_97489 ) ) ( OBJ-AT ?auto_97487 ?auto_97489 ) ( not ( = ?auto_97491 ?auto_97485 ) ) ( not ( = ?auto_97487 ?auto_97491 ) ) ( IN-CITY ?auto_97492 ?auto_97488 ) ( not ( = ?auto_97484 ?auto_97492 ) ) ( not ( = ?auto_97489 ?auto_97492 ) ) ( OBJ-AT ?auto_97491 ?auto_97492 ) ( not ( = ?auto_97491 ?auto_97486 ) ) ( OBJ-AT ?auto_97486 ?auto_97489 ) ( TRUCK-AT ?auto_97490 ?auto_97484 ) ( IN-TRUCK ?auto_97485 ?auto_97490 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97485 ?auto_97487 ?auto_97484 )
      ( DELIVER-3PKG-VERIFY ?auto_97485 ?auto_97486 ?auto_97487 ?auto_97484 ) )
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
      ?auto_97498 - LOCATION
      ?auto_97497 - CITY
      ?auto_97501 - LOCATION
      ?auto_97500 - OBJ
      ?auto_97499 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97495 ?auto_97494 ) ) ( not ( = ?auto_97496 ?auto_97494 ) ) ( not ( = ?auto_97496 ?auto_97495 ) ) ( IN-CITY ?auto_97498 ?auto_97497 ) ( IN-CITY ?auto_97493 ?auto_97497 ) ( not ( = ?auto_97493 ?auto_97498 ) ) ( OBJ-AT ?auto_97496 ?auto_97498 ) ( IN-CITY ?auto_97501 ?auto_97497 ) ( not ( = ?auto_97493 ?auto_97501 ) ) ( not ( = ?auto_97498 ?auto_97501 ) ) ( OBJ-AT ?auto_97495 ?auto_97501 ) ( not ( = ?auto_97500 ?auto_97494 ) ) ( not ( = ?auto_97496 ?auto_97500 ) ) ( not ( = ?auto_97495 ?auto_97500 ) ) ( OBJ-AT ?auto_97500 ?auto_97498 ) ( TRUCK-AT ?auto_97499 ?auto_97493 ) ( IN-TRUCK ?auto_97494 ?auto_97499 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97494 ?auto_97496 ?auto_97493 )
      ( DELIVER-3PKG-VERIFY ?auto_97494 ?auto_97495 ?auto_97496 ?auto_97493 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97513 - OBJ
      ?auto_97514 - OBJ
      ?auto_97515 - OBJ
      ?auto_97512 - LOCATION
    )
    :vars
    (
      ?auto_97517 - LOCATION
      ?auto_97516 - CITY
      ?auto_97519 - OBJ
      ?auto_97520 - LOCATION
      ?auto_97518 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97514 ?auto_97513 ) ) ( not ( = ?auto_97515 ?auto_97513 ) ) ( not ( = ?auto_97515 ?auto_97514 ) ) ( IN-CITY ?auto_97517 ?auto_97516 ) ( IN-CITY ?auto_97512 ?auto_97516 ) ( not ( = ?auto_97512 ?auto_97517 ) ) ( OBJ-AT ?auto_97514 ?auto_97517 ) ( not ( = ?auto_97519 ?auto_97513 ) ) ( not ( = ?auto_97514 ?auto_97519 ) ) ( IN-CITY ?auto_97520 ?auto_97516 ) ( not ( = ?auto_97512 ?auto_97520 ) ) ( not ( = ?auto_97517 ?auto_97520 ) ) ( OBJ-AT ?auto_97519 ?auto_97520 ) ( not ( = ?auto_97519 ?auto_97515 ) ) ( OBJ-AT ?auto_97515 ?auto_97517 ) ( TRUCK-AT ?auto_97518 ?auto_97512 ) ( IN-TRUCK ?auto_97513 ?auto_97518 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97513 ?auto_97514 ?auto_97512 )
      ( DELIVER-3PKG-VERIFY ?auto_97513 ?auto_97514 ?auto_97515 ?auto_97512 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97522 - OBJ
      ?auto_97523 - OBJ
      ?auto_97524 - OBJ
      ?auto_97521 - LOCATION
    )
    :vars
    (
      ?auto_97526 - LOCATION
      ?auto_97525 - CITY
      ?auto_97529 - LOCATION
      ?auto_97528 - OBJ
      ?auto_97527 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97523 ?auto_97522 ) ) ( not ( = ?auto_97524 ?auto_97522 ) ) ( not ( = ?auto_97524 ?auto_97523 ) ) ( IN-CITY ?auto_97526 ?auto_97525 ) ( IN-CITY ?auto_97521 ?auto_97525 ) ( not ( = ?auto_97521 ?auto_97526 ) ) ( OBJ-AT ?auto_97523 ?auto_97526 ) ( IN-CITY ?auto_97529 ?auto_97525 ) ( not ( = ?auto_97521 ?auto_97529 ) ) ( not ( = ?auto_97526 ?auto_97529 ) ) ( OBJ-AT ?auto_97524 ?auto_97529 ) ( not ( = ?auto_97528 ?auto_97522 ) ) ( not ( = ?auto_97523 ?auto_97528 ) ) ( not ( = ?auto_97524 ?auto_97528 ) ) ( OBJ-AT ?auto_97528 ?auto_97526 ) ( TRUCK-AT ?auto_97527 ?auto_97521 ) ( IN-TRUCK ?auto_97522 ?auto_97527 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97522 ?auto_97523 ?auto_97521 )
      ( DELIVER-3PKG-VERIFY ?auto_97522 ?auto_97523 ?auto_97524 ?auto_97521 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97541 - OBJ
      ?auto_97542 - OBJ
      ?auto_97543 - OBJ
      ?auto_97540 - LOCATION
    )
    :vars
    (
      ?auto_97545 - LOCATION
      ?auto_97544 - CITY
      ?auto_97547 - OBJ
      ?auto_97548 - LOCATION
      ?auto_97546 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97542 ?auto_97541 ) ) ( not ( = ?auto_97543 ?auto_97541 ) ) ( not ( = ?auto_97543 ?auto_97542 ) ) ( IN-CITY ?auto_97545 ?auto_97544 ) ( IN-CITY ?auto_97540 ?auto_97544 ) ( not ( = ?auto_97540 ?auto_97545 ) ) ( OBJ-AT ?auto_97543 ?auto_97545 ) ( not ( = ?auto_97547 ?auto_97542 ) ) ( not ( = ?auto_97543 ?auto_97547 ) ) ( IN-CITY ?auto_97548 ?auto_97544 ) ( not ( = ?auto_97540 ?auto_97548 ) ) ( not ( = ?auto_97545 ?auto_97548 ) ) ( OBJ-AT ?auto_97547 ?auto_97548 ) ( not ( = ?auto_97547 ?auto_97541 ) ) ( OBJ-AT ?auto_97541 ?auto_97545 ) ( TRUCK-AT ?auto_97546 ?auto_97540 ) ( IN-TRUCK ?auto_97542 ?auto_97546 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97542 ?auto_97543 ?auto_97540 )
      ( DELIVER-3PKG-VERIFY ?auto_97541 ?auto_97542 ?auto_97543 ?auto_97540 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97560 - OBJ
      ?auto_97561 - OBJ
      ?auto_97562 - OBJ
      ?auto_97559 - LOCATION
    )
    :vars
    (
      ?auto_97567 - OBJ
      ?auto_97564 - LOCATION
      ?auto_97563 - CITY
      ?auto_97566 - LOCATION
      ?auto_97565 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97561 ?auto_97560 ) ) ( not ( = ?auto_97562 ?auto_97560 ) ) ( not ( = ?auto_97562 ?auto_97561 ) ) ( not ( = ?auto_97562 ?auto_97567 ) ) ( IN-CITY ?auto_97564 ?auto_97563 ) ( IN-CITY ?auto_97559 ?auto_97563 ) ( not ( = ?auto_97559 ?auto_97564 ) ) ( OBJ-AT ?auto_97562 ?auto_97564 ) ( not ( = ?auto_97561 ?auto_97567 ) ) ( IN-CITY ?auto_97566 ?auto_97563 ) ( not ( = ?auto_97559 ?auto_97566 ) ) ( not ( = ?auto_97564 ?auto_97566 ) ) ( OBJ-AT ?auto_97561 ?auto_97566 ) ( not ( = ?auto_97560 ?auto_97567 ) ) ( OBJ-AT ?auto_97560 ?auto_97564 ) ( TRUCK-AT ?auto_97565 ?auto_97559 ) ( IN-TRUCK ?auto_97567 ?auto_97565 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97567 ?auto_97562 ?auto_97559 )
      ( DELIVER-3PKG-VERIFY ?auto_97560 ?auto_97561 ?auto_97562 ?auto_97559 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97569 - OBJ
      ?auto_97570 - OBJ
      ?auto_97571 - OBJ
      ?auto_97568 - LOCATION
    )
    :vars
    (
      ?auto_97573 - LOCATION
      ?auto_97572 - CITY
      ?auto_97575 - OBJ
      ?auto_97576 - LOCATION
      ?auto_97574 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97570 ?auto_97569 ) ) ( not ( = ?auto_97571 ?auto_97569 ) ) ( not ( = ?auto_97571 ?auto_97570 ) ) ( IN-CITY ?auto_97573 ?auto_97572 ) ( IN-CITY ?auto_97568 ?auto_97572 ) ( not ( = ?auto_97568 ?auto_97573 ) ) ( OBJ-AT ?auto_97570 ?auto_97573 ) ( not ( = ?auto_97575 ?auto_97571 ) ) ( not ( = ?auto_97570 ?auto_97575 ) ) ( IN-CITY ?auto_97576 ?auto_97572 ) ( not ( = ?auto_97568 ?auto_97576 ) ) ( not ( = ?auto_97573 ?auto_97576 ) ) ( OBJ-AT ?auto_97575 ?auto_97576 ) ( not ( = ?auto_97575 ?auto_97569 ) ) ( OBJ-AT ?auto_97569 ?auto_97573 ) ( TRUCK-AT ?auto_97574 ?auto_97568 ) ( IN-TRUCK ?auto_97571 ?auto_97574 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97571 ?auto_97570 ?auto_97568 )
      ( DELIVER-3PKG-VERIFY ?auto_97569 ?auto_97570 ?auto_97571 ?auto_97568 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97588 - OBJ
      ?auto_97589 - OBJ
      ?auto_97590 - OBJ
      ?auto_97587 - LOCATION
    )
    :vars
    (
      ?auto_97595 - OBJ
      ?auto_97592 - LOCATION
      ?auto_97591 - CITY
      ?auto_97594 - LOCATION
      ?auto_97593 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97589 ?auto_97588 ) ) ( not ( = ?auto_97590 ?auto_97588 ) ) ( not ( = ?auto_97590 ?auto_97589 ) ) ( not ( = ?auto_97589 ?auto_97595 ) ) ( IN-CITY ?auto_97592 ?auto_97591 ) ( IN-CITY ?auto_97587 ?auto_97591 ) ( not ( = ?auto_97587 ?auto_97592 ) ) ( OBJ-AT ?auto_97589 ?auto_97592 ) ( not ( = ?auto_97590 ?auto_97595 ) ) ( IN-CITY ?auto_97594 ?auto_97591 ) ( not ( = ?auto_97587 ?auto_97594 ) ) ( not ( = ?auto_97592 ?auto_97594 ) ) ( OBJ-AT ?auto_97590 ?auto_97594 ) ( not ( = ?auto_97588 ?auto_97595 ) ) ( OBJ-AT ?auto_97588 ?auto_97592 ) ( TRUCK-AT ?auto_97593 ?auto_97587 ) ( IN-TRUCK ?auto_97595 ?auto_97593 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97595 ?auto_97589 ?auto_97587 )
      ( DELIVER-3PKG-VERIFY ?auto_97588 ?auto_97589 ?auto_97590 ?auto_97587 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97607 - OBJ
      ?auto_97608 - OBJ
      ?auto_97609 - OBJ
      ?auto_97606 - LOCATION
    )
    :vars
    (
      ?auto_97611 - LOCATION
      ?auto_97610 - CITY
      ?auto_97614 - LOCATION
      ?auto_97613 - OBJ
      ?auto_97612 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97608 ?auto_97607 ) ) ( not ( = ?auto_97609 ?auto_97607 ) ) ( not ( = ?auto_97609 ?auto_97608 ) ) ( IN-CITY ?auto_97611 ?auto_97610 ) ( IN-CITY ?auto_97606 ?auto_97610 ) ( not ( = ?auto_97606 ?auto_97611 ) ) ( OBJ-AT ?auto_97609 ?auto_97611 ) ( IN-CITY ?auto_97614 ?auto_97610 ) ( not ( = ?auto_97606 ?auto_97614 ) ) ( not ( = ?auto_97611 ?auto_97614 ) ) ( OBJ-AT ?auto_97607 ?auto_97614 ) ( not ( = ?auto_97613 ?auto_97608 ) ) ( not ( = ?auto_97609 ?auto_97613 ) ) ( not ( = ?auto_97607 ?auto_97613 ) ) ( OBJ-AT ?auto_97613 ?auto_97611 ) ( TRUCK-AT ?auto_97612 ?auto_97606 ) ( IN-TRUCK ?auto_97608 ?auto_97612 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97608 ?auto_97609 ?auto_97606 )
      ( DELIVER-3PKG-VERIFY ?auto_97607 ?auto_97608 ?auto_97609 ?auto_97606 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97616 - OBJ
      ?auto_97617 - OBJ
      ?auto_97618 - OBJ
      ?auto_97615 - LOCATION
    )
    :vars
    (
      ?auto_97623 - OBJ
      ?auto_97620 - LOCATION
      ?auto_97619 - CITY
      ?auto_97622 - LOCATION
      ?auto_97621 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97617 ?auto_97616 ) ) ( not ( = ?auto_97618 ?auto_97616 ) ) ( not ( = ?auto_97618 ?auto_97617 ) ) ( not ( = ?auto_97618 ?auto_97623 ) ) ( IN-CITY ?auto_97620 ?auto_97619 ) ( IN-CITY ?auto_97615 ?auto_97619 ) ( not ( = ?auto_97615 ?auto_97620 ) ) ( OBJ-AT ?auto_97618 ?auto_97620 ) ( not ( = ?auto_97616 ?auto_97623 ) ) ( IN-CITY ?auto_97622 ?auto_97619 ) ( not ( = ?auto_97615 ?auto_97622 ) ) ( not ( = ?auto_97620 ?auto_97622 ) ) ( OBJ-AT ?auto_97616 ?auto_97622 ) ( not ( = ?auto_97617 ?auto_97623 ) ) ( OBJ-AT ?auto_97617 ?auto_97620 ) ( TRUCK-AT ?auto_97621 ?auto_97615 ) ( IN-TRUCK ?auto_97623 ?auto_97621 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97623 ?auto_97618 ?auto_97615 )
      ( DELIVER-3PKG-VERIFY ?auto_97616 ?auto_97617 ?auto_97618 ?auto_97615 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97635 - OBJ
      ?auto_97636 - OBJ
      ?auto_97637 - OBJ
      ?auto_97634 - LOCATION
    )
    :vars
    (
      ?auto_97639 - LOCATION
      ?auto_97638 - CITY
      ?auto_97642 - LOCATION
      ?auto_97641 - OBJ
      ?auto_97640 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97636 ?auto_97635 ) ) ( not ( = ?auto_97637 ?auto_97635 ) ) ( not ( = ?auto_97637 ?auto_97636 ) ) ( IN-CITY ?auto_97639 ?auto_97638 ) ( IN-CITY ?auto_97634 ?auto_97638 ) ( not ( = ?auto_97634 ?auto_97639 ) ) ( OBJ-AT ?auto_97636 ?auto_97639 ) ( IN-CITY ?auto_97642 ?auto_97638 ) ( not ( = ?auto_97634 ?auto_97642 ) ) ( not ( = ?auto_97639 ?auto_97642 ) ) ( OBJ-AT ?auto_97635 ?auto_97642 ) ( not ( = ?auto_97641 ?auto_97637 ) ) ( not ( = ?auto_97636 ?auto_97641 ) ) ( not ( = ?auto_97635 ?auto_97641 ) ) ( OBJ-AT ?auto_97641 ?auto_97639 ) ( TRUCK-AT ?auto_97640 ?auto_97634 ) ( IN-TRUCK ?auto_97637 ?auto_97640 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97637 ?auto_97636 ?auto_97634 )
      ( DELIVER-3PKG-VERIFY ?auto_97635 ?auto_97636 ?auto_97637 ?auto_97634 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97644 - OBJ
      ?auto_97645 - OBJ
      ?auto_97646 - OBJ
      ?auto_97643 - LOCATION
    )
    :vars
    (
      ?auto_97651 - OBJ
      ?auto_97648 - LOCATION
      ?auto_97647 - CITY
      ?auto_97650 - LOCATION
      ?auto_97649 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97645 ?auto_97644 ) ) ( not ( = ?auto_97646 ?auto_97644 ) ) ( not ( = ?auto_97646 ?auto_97645 ) ) ( not ( = ?auto_97645 ?auto_97651 ) ) ( IN-CITY ?auto_97648 ?auto_97647 ) ( IN-CITY ?auto_97643 ?auto_97647 ) ( not ( = ?auto_97643 ?auto_97648 ) ) ( OBJ-AT ?auto_97645 ?auto_97648 ) ( not ( = ?auto_97644 ?auto_97651 ) ) ( IN-CITY ?auto_97650 ?auto_97647 ) ( not ( = ?auto_97643 ?auto_97650 ) ) ( not ( = ?auto_97648 ?auto_97650 ) ) ( OBJ-AT ?auto_97644 ?auto_97650 ) ( not ( = ?auto_97646 ?auto_97651 ) ) ( OBJ-AT ?auto_97646 ?auto_97648 ) ( TRUCK-AT ?auto_97649 ?auto_97643 ) ( IN-TRUCK ?auto_97651 ?auto_97649 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97651 ?auto_97645 ?auto_97643 )
      ( DELIVER-3PKG-VERIFY ?auto_97644 ?auto_97645 ?auto_97646 ?auto_97643 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97683 - OBJ
      ?auto_97684 - OBJ
      ?auto_97685 - OBJ
      ?auto_97682 - LOCATION
    )
    :vars
    (
      ?auto_97687 - LOCATION
      ?auto_97686 - CITY
      ?auto_97689 - OBJ
      ?auto_97690 - LOCATION
      ?auto_97688 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97684 ?auto_97683 ) ) ( not ( = ?auto_97685 ?auto_97683 ) ) ( not ( = ?auto_97685 ?auto_97684 ) ) ( IN-CITY ?auto_97687 ?auto_97686 ) ( IN-CITY ?auto_97682 ?auto_97686 ) ( not ( = ?auto_97682 ?auto_97687 ) ) ( OBJ-AT ?auto_97683 ?auto_97687 ) ( not ( = ?auto_97689 ?auto_97684 ) ) ( not ( = ?auto_97683 ?auto_97689 ) ) ( IN-CITY ?auto_97690 ?auto_97686 ) ( not ( = ?auto_97682 ?auto_97690 ) ) ( not ( = ?auto_97687 ?auto_97690 ) ) ( OBJ-AT ?auto_97689 ?auto_97690 ) ( not ( = ?auto_97689 ?auto_97685 ) ) ( OBJ-AT ?auto_97685 ?auto_97687 ) ( TRUCK-AT ?auto_97688 ?auto_97682 ) ( IN-TRUCK ?auto_97684 ?auto_97688 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97684 ?auto_97683 ?auto_97682 )
      ( DELIVER-3PKG-VERIFY ?auto_97683 ?auto_97684 ?auto_97685 ?auto_97682 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97692 - OBJ
      ?auto_97693 - OBJ
      ?auto_97694 - OBJ
      ?auto_97691 - LOCATION
    )
    :vars
    (
      ?auto_97696 - LOCATION
      ?auto_97695 - CITY
      ?auto_97699 - LOCATION
      ?auto_97698 - OBJ
      ?auto_97697 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97693 ?auto_97692 ) ) ( not ( = ?auto_97694 ?auto_97692 ) ) ( not ( = ?auto_97694 ?auto_97693 ) ) ( IN-CITY ?auto_97696 ?auto_97695 ) ( IN-CITY ?auto_97691 ?auto_97695 ) ( not ( = ?auto_97691 ?auto_97696 ) ) ( OBJ-AT ?auto_97692 ?auto_97696 ) ( IN-CITY ?auto_97699 ?auto_97695 ) ( not ( = ?auto_97691 ?auto_97699 ) ) ( not ( = ?auto_97696 ?auto_97699 ) ) ( OBJ-AT ?auto_97694 ?auto_97699 ) ( not ( = ?auto_97698 ?auto_97693 ) ) ( not ( = ?auto_97692 ?auto_97698 ) ) ( not ( = ?auto_97694 ?auto_97698 ) ) ( OBJ-AT ?auto_97698 ?auto_97696 ) ( TRUCK-AT ?auto_97697 ?auto_97691 ) ( IN-TRUCK ?auto_97693 ?auto_97697 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97693 ?auto_97692 ?auto_97691 )
      ( DELIVER-3PKG-VERIFY ?auto_97692 ?auto_97693 ?auto_97694 ?auto_97691 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97711 - OBJ
      ?auto_97712 - OBJ
      ?auto_97713 - OBJ
      ?auto_97710 - LOCATION
    )
    :vars
    (
      ?auto_97715 - LOCATION
      ?auto_97714 - CITY
      ?auto_97717 - OBJ
      ?auto_97718 - LOCATION
      ?auto_97716 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97712 ?auto_97711 ) ) ( not ( = ?auto_97713 ?auto_97711 ) ) ( not ( = ?auto_97713 ?auto_97712 ) ) ( IN-CITY ?auto_97715 ?auto_97714 ) ( IN-CITY ?auto_97710 ?auto_97714 ) ( not ( = ?auto_97710 ?auto_97715 ) ) ( OBJ-AT ?auto_97711 ?auto_97715 ) ( not ( = ?auto_97717 ?auto_97713 ) ) ( not ( = ?auto_97711 ?auto_97717 ) ) ( IN-CITY ?auto_97718 ?auto_97714 ) ( not ( = ?auto_97710 ?auto_97718 ) ) ( not ( = ?auto_97715 ?auto_97718 ) ) ( OBJ-AT ?auto_97717 ?auto_97718 ) ( not ( = ?auto_97717 ?auto_97712 ) ) ( OBJ-AT ?auto_97712 ?auto_97715 ) ( TRUCK-AT ?auto_97716 ?auto_97710 ) ( IN-TRUCK ?auto_97713 ?auto_97716 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97713 ?auto_97711 ?auto_97710 )
      ( DELIVER-3PKG-VERIFY ?auto_97711 ?auto_97712 ?auto_97713 ?auto_97710 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97730 - OBJ
      ?auto_97731 - OBJ
      ?auto_97732 - OBJ
      ?auto_97729 - LOCATION
    )
    :vars
    (
      ?auto_97737 - OBJ
      ?auto_97734 - LOCATION
      ?auto_97733 - CITY
      ?auto_97736 - LOCATION
      ?auto_97735 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97731 ?auto_97730 ) ) ( not ( = ?auto_97732 ?auto_97730 ) ) ( not ( = ?auto_97732 ?auto_97731 ) ) ( not ( = ?auto_97730 ?auto_97737 ) ) ( IN-CITY ?auto_97734 ?auto_97733 ) ( IN-CITY ?auto_97729 ?auto_97733 ) ( not ( = ?auto_97729 ?auto_97734 ) ) ( OBJ-AT ?auto_97730 ?auto_97734 ) ( not ( = ?auto_97732 ?auto_97737 ) ) ( IN-CITY ?auto_97736 ?auto_97733 ) ( not ( = ?auto_97729 ?auto_97736 ) ) ( not ( = ?auto_97734 ?auto_97736 ) ) ( OBJ-AT ?auto_97732 ?auto_97736 ) ( not ( = ?auto_97731 ?auto_97737 ) ) ( OBJ-AT ?auto_97731 ?auto_97734 ) ( TRUCK-AT ?auto_97735 ?auto_97729 ) ( IN-TRUCK ?auto_97737 ?auto_97735 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97737 ?auto_97730 ?auto_97729 )
      ( DELIVER-3PKG-VERIFY ?auto_97730 ?auto_97731 ?auto_97732 ?auto_97729 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97749 - OBJ
      ?auto_97750 - OBJ
      ?auto_97751 - OBJ
      ?auto_97748 - LOCATION
    )
    :vars
    (
      ?auto_97753 - LOCATION
      ?auto_97752 - CITY
      ?auto_97756 - LOCATION
      ?auto_97755 - OBJ
      ?auto_97754 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97750 ?auto_97749 ) ) ( not ( = ?auto_97751 ?auto_97749 ) ) ( not ( = ?auto_97751 ?auto_97750 ) ) ( IN-CITY ?auto_97753 ?auto_97752 ) ( IN-CITY ?auto_97748 ?auto_97752 ) ( not ( = ?auto_97748 ?auto_97753 ) ) ( OBJ-AT ?auto_97749 ?auto_97753 ) ( IN-CITY ?auto_97756 ?auto_97752 ) ( not ( = ?auto_97748 ?auto_97756 ) ) ( not ( = ?auto_97753 ?auto_97756 ) ) ( OBJ-AT ?auto_97750 ?auto_97756 ) ( not ( = ?auto_97755 ?auto_97751 ) ) ( not ( = ?auto_97749 ?auto_97755 ) ) ( not ( = ?auto_97750 ?auto_97755 ) ) ( OBJ-AT ?auto_97755 ?auto_97753 ) ( TRUCK-AT ?auto_97754 ?auto_97748 ) ( IN-TRUCK ?auto_97751 ?auto_97754 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97751 ?auto_97749 ?auto_97748 )
      ( DELIVER-3PKG-VERIFY ?auto_97749 ?auto_97750 ?auto_97751 ?auto_97748 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97758 - OBJ
      ?auto_97759 - OBJ
      ?auto_97760 - OBJ
      ?auto_97757 - LOCATION
    )
    :vars
    (
      ?auto_97765 - OBJ
      ?auto_97762 - LOCATION
      ?auto_97761 - CITY
      ?auto_97764 - LOCATION
      ?auto_97763 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97759 ?auto_97758 ) ) ( not ( = ?auto_97760 ?auto_97758 ) ) ( not ( = ?auto_97760 ?auto_97759 ) ) ( not ( = ?auto_97758 ?auto_97765 ) ) ( IN-CITY ?auto_97762 ?auto_97761 ) ( IN-CITY ?auto_97757 ?auto_97761 ) ( not ( = ?auto_97757 ?auto_97762 ) ) ( OBJ-AT ?auto_97758 ?auto_97762 ) ( not ( = ?auto_97759 ?auto_97765 ) ) ( IN-CITY ?auto_97764 ?auto_97761 ) ( not ( = ?auto_97757 ?auto_97764 ) ) ( not ( = ?auto_97762 ?auto_97764 ) ) ( OBJ-AT ?auto_97759 ?auto_97764 ) ( not ( = ?auto_97760 ?auto_97765 ) ) ( OBJ-AT ?auto_97760 ?auto_97762 ) ( TRUCK-AT ?auto_97763 ?auto_97757 ) ( IN-TRUCK ?auto_97765 ?auto_97763 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97765 ?auto_97758 ?auto_97757 )
      ( DELIVER-3PKG-VERIFY ?auto_97758 ?auto_97759 ?auto_97760 ?auto_97757 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_97921 - OBJ
      ?auto_97922 - OBJ
      ?auto_97923 - OBJ
      ?auto_97924 - OBJ
      ?auto_97920 - LOCATION
    )
    :vars
    (
      ?auto_97926 - LOCATION
      ?auto_97925 - CITY
      ?auto_97928 - LOCATION
      ?auto_97927 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97922 ?auto_97921 ) ) ( not ( = ?auto_97923 ?auto_97921 ) ) ( not ( = ?auto_97923 ?auto_97922 ) ) ( not ( = ?auto_97924 ?auto_97921 ) ) ( not ( = ?auto_97924 ?auto_97922 ) ) ( not ( = ?auto_97924 ?auto_97923 ) ) ( IN-CITY ?auto_97926 ?auto_97925 ) ( IN-CITY ?auto_97920 ?auto_97925 ) ( not ( = ?auto_97920 ?auto_97926 ) ) ( OBJ-AT ?auto_97924 ?auto_97926 ) ( IN-CITY ?auto_97928 ?auto_97925 ) ( not ( = ?auto_97920 ?auto_97928 ) ) ( not ( = ?auto_97926 ?auto_97928 ) ) ( OBJ-AT ?auto_97923 ?auto_97928 ) ( OBJ-AT ?auto_97922 ?auto_97926 ) ( TRUCK-AT ?auto_97927 ?auto_97920 ) ( IN-TRUCK ?auto_97921 ?auto_97927 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97921 ?auto_97924 ?auto_97920 )
      ( DELIVER-4PKG-VERIFY ?auto_97921 ?auto_97922 ?auto_97923 ?auto_97924 ?auto_97920 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_97950 - OBJ
      ?auto_97951 - OBJ
      ?auto_97952 - OBJ
      ?auto_97953 - OBJ
      ?auto_97949 - LOCATION
    )
    :vars
    (
      ?auto_97955 - LOCATION
      ?auto_97954 - CITY
      ?auto_97957 - LOCATION
      ?auto_97956 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97951 ?auto_97950 ) ) ( not ( = ?auto_97952 ?auto_97950 ) ) ( not ( = ?auto_97952 ?auto_97951 ) ) ( not ( = ?auto_97953 ?auto_97950 ) ) ( not ( = ?auto_97953 ?auto_97951 ) ) ( not ( = ?auto_97953 ?auto_97952 ) ) ( IN-CITY ?auto_97955 ?auto_97954 ) ( IN-CITY ?auto_97949 ?auto_97954 ) ( not ( = ?auto_97949 ?auto_97955 ) ) ( OBJ-AT ?auto_97952 ?auto_97955 ) ( IN-CITY ?auto_97957 ?auto_97954 ) ( not ( = ?auto_97949 ?auto_97957 ) ) ( not ( = ?auto_97955 ?auto_97957 ) ) ( OBJ-AT ?auto_97953 ?auto_97957 ) ( OBJ-AT ?auto_97951 ?auto_97955 ) ( TRUCK-AT ?auto_97956 ?auto_97949 ) ( IN-TRUCK ?auto_97950 ?auto_97956 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97950 ?auto_97952 ?auto_97949 )
      ( DELIVER-4PKG-VERIFY ?auto_97950 ?auto_97951 ?auto_97952 ?auto_97953 ?auto_97949 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_97979 - OBJ
      ?auto_97980 - OBJ
      ?auto_97981 - OBJ
      ?auto_97982 - OBJ
      ?auto_97978 - LOCATION
    )
    :vars
    (
      ?auto_97984 - LOCATION
      ?auto_97983 - CITY
      ?auto_97986 - LOCATION
      ?auto_97985 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_97980 ?auto_97979 ) ) ( not ( = ?auto_97981 ?auto_97979 ) ) ( not ( = ?auto_97981 ?auto_97980 ) ) ( not ( = ?auto_97982 ?auto_97979 ) ) ( not ( = ?auto_97982 ?auto_97980 ) ) ( not ( = ?auto_97982 ?auto_97981 ) ) ( IN-CITY ?auto_97984 ?auto_97983 ) ( IN-CITY ?auto_97978 ?auto_97983 ) ( not ( = ?auto_97978 ?auto_97984 ) ) ( OBJ-AT ?auto_97982 ?auto_97984 ) ( IN-CITY ?auto_97986 ?auto_97983 ) ( not ( = ?auto_97978 ?auto_97986 ) ) ( not ( = ?auto_97984 ?auto_97986 ) ) ( OBJ-AT ?auto_97980 ?auto_97986 ) ( OBJ-AT ?auto_97981 ?auto_97984 ) ( TRUCK-AT ?auto_97985 ?auto_97978 ) ( IN-TRUCK ?auto_97979 ?auto_97985 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97979 ?auto_97982 ?auto_97978 )
      ( DELIVER-4PKG-VERIFY ?auto_97979 ?auto_97980 ?auto_97981 ?auto_97982 ?auto_97978 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98008 - OBJ
      ?auto_98009 - OBJ
      ?auto_98010 - OBJ
      ?auto_98011 - OBJ
      ?auto_98007 - LOCATION
    )
    :vars
    (
      ?auto_98013 - LOCATION
      ?auto_98012 - CITY
      ?auto_98015 - LOCATION
      ?auto_98014 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_98009 ?auto_98008 ) ) ( not ( = ?auto_98010 ?auto_98008 ) ) ( not ( = ?auto_98010 ?auto_98009 ) ) ( not ( = ?auto_98011 ?auto_98008 ) ) ( not ( = ?auto_98011 ?auto_98009 ) ) ( not ( = ?auto_98011 ?auto_98010 ) ) ( IN-CITY ?auto_98013 ?auto_98012 ) ( IN-CITY ?auto_98007 ?auto_98012 ) ( not ( = ?auto_98007 ?auto_98013 ) ) ( OBJ-AT ?auto_98010 ?auto_98013 ) ( IN-CITY ?auto_98015 ?auto_98012 ) ( not ( = ?auto_98007 ?auto_98015 ) ) ( not ( = ?auto_98013 ?auto_98015 ) ) ( OBJ-AT ?auto_98009 ?auto_98015 ) ( OBJ-AT ?auto_98011 ?auto_98013 ) ( TRUCK-AT ?auto_98014 ?auto_98007 ) ( IN-TRUCK ?auto_98008 ?auto_98014 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98008 ?auto_98010 ?auto_98007 )
      ( DELIVER-4PKG-VERIFY ?auto_98008 ?auto_98009 ?auto_98010 ?auto_98011 ?auto_98007 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98099 - OBJ
      ?auto_98100 - OBJ
      ?auto_98101 - OBJ
      ?auto_98102 - OBJ
      ?auto_98098 - LOCATION
    )
    :vars
    (
      ?auto_98104 - LOCATION
      ?auto_98103 - CITY
      ?auto_98106 - LOCATION
      ?auto_98105 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_98100 ?auto_98099 ) ) ( not ( = ?auto_98101 ?auto_98099 ) ) ( not ( = ?auto_98101 ?auto_98100 ) ) ( not ( = ?auto_98102 ?auto_98099 ) ) ( not ( = ?auto_98102 ?auto_98100 ) ) ( not ( = ?auto_98102 ?auto_98101 ) ) ( IN-CITY ?auto_98104 ?auto_98103 ) ( IN-CITY ?auto_98098 ?auto_98103 ) ( not ( = ?auto_98098 ?auto_98104 ) ) ( OBJ-AT ?auto_98100 ?auto_98104 ) ( IN-CITY ?auto_98106 ?auto_98103 ) ( not ( = ?auto_98098 ?auto_98106 ) ) ( not ( = ?auto_98104 ?auto_98106 ) ) ( OBJ-AT ?auto_98102 ?auto_98106 ) ( OBJ-AT ?auto_98101 ?auto_98104 ) ( TRUCK-AT ?auto_98105 ?auto_98098 ) ( IN-TRUCK ?auto_98099 ?auto_98105 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98099 ?auto_98100 ?auto_98098 )
      ( DELIVER-4PKG-VERIFY ?auto_98099 ?auto_98100 ?auto_98101 ?auto_98102 ?auto_98098 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98128 - OBJ
      ?auto_98129 - OBJ
      ?auto_98130 - OBJ
      ?auto_98131 - OBJ
      ?auto_98127 - LOCATION
    )
    :vars
    (
      ?auto_98133 - LOCATION
      ?auto_98132 - CITY
      ?auto_98135 - LOCATION
      ?auto_98134 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_98129 ?auto_98128 ) ) ( not ( = ?auto_98130 ?auto_98128 ) ) ( not ( = ?auto_98130 ?auto_98129 ) ) ( not ( = ?auto_98131 ?auto_98128 ) ) ( not ( = ?auto_98131 ?auto_98129 ) ) ( not ( = ?auto_98131 ?auto_98130 ) ) ( IN-CITY ?auto_98133 ?auto_98132 ) ( IN-CITY ?auto_98127 ?auto_98132 ) ( not ( = ?auto_98127 ?auto_98133 ) ) ( OBJ-AT ?auto_98129 ?auto_98133 ) ( IN-CITY ?auto_98135 ?auto_98132 ) ( not ( = ?auto_98127 ?auto_98135 ) ) ( not ( = ?auto_98133 ?auto_98135 ) ) ( OBJ-AT ?auto_98130 ?auto_98135 ) ( OBJ-AT ?auto_98131 ?auto_98133 ) ( TRUCK-AT ?auto_98134 ?auto_98127 ) ( IN-TRUCK ?auto_98128 ?auto_98134 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98128 ?auto_98129 ?auto_98127 )
      ( DELIVER-4PKG-VERIFY ?auto_98128 ?auto_98129 ?auto_98130 ?auto_98131 ?auto_98127 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98219 - OBJ
      ?auto_98220 - OBJ
      ?auto_98221 - OBJ
      ?auto_98222 - OBJ
      ?auto_98218 - LOCATION
    )
    :vars
    (
      ?auto_98224 - LOCATION
      ?auto_98223 - CITY
      ?auto_98226 - LOCATION
      ?auto_98225 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_98220 ?auto_98219 ) ) ( not ( = ?auto_98221 ?auto_98219 ) ) ( not ( = ?auto_98221 ?auto_98220 ) ) ( not ( = ?auto_98222 ?auto_98219 ) ) ( not ( = ?auto_98222 ?auto_98220 ) ) ( not ( = ?auto_98222 ?auto_98221 ) ) ( IN-CITY ?auto_98224 ?auto_98223 ) ( IN-CITY ?auto_98218 ?auto_98223 ) ( not ( = ?auto_98218 ?auto_98224 ) ) ( OBJ-AT ?auto_98222 ?auto_98224 ) ( IN-CITY ?auto_98226 ?auto_98223 ) ( not ( = ?auto_98218 ?auto_98226 ) ) ( not ( = ?auto_98224 ?auto_98226 ) ) ( OBJ-AT ?auto_98221 ?auto_98226 ) ( OBJ-AT ?auto_98219 ?auto_98224 ) ( TRUCK-AT ?auto_98225 ?auto_98218 ) ( IN-TRUCK ?auto_98220 ?auto_98225 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98220 ?auto_98222 ?auto_98218 )
      ( DELIVER-4PKG-VERIFY ?auto_98219 ?auto_98220 ?auto_98221 ?auto_98222 ?auto_98218 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98248 - OBJ
      ?auto_98249 - OBJ
      ?auto_98250 - OBJ
      ?auto_98251 - OBJ
      ?auto_98247 - LOCATION
    )
    :vars
    (
      ?auto_98253 - LOCATION
      ?auto_98252 - CITY
      ?auto_98255 - LOCATION
      ?auto_98254 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_98249 ?auto_98248 ) ) ( not ( = ?auto_98250 ?auto_98248 ) ) ( not ( = ?auto_98250 ?auto_98249 ) ) ( not ( = ?auto_98251 ?auto_98248 ) ) ( not ( = ?auto_98251 ?auto_98249 ) ) ( not ( = ?auto_98251 ?auto_98250 ) ) ( IN-CITY ?auto_98253 ?auto_98252 ) ( IN-CITY ?auto_98247 ?auto_98252 ) ( not ( = ?auto_98247 ?auto_98253 ) ) ( OBJ-AT ?auto_98250 ?auto_98253 ) ( IN-CITY ?auto_98255 ?auto_98252 ) ( not ( = ?auto_98247 ?auto_98255 ) ) ( not ( = ?auto_98253 ?auto_98255 ) ) ( OBJ-AT ?auto_98251 ?auto_98255 ) ( OBJ-AT ?auto_98248 ?auto_98253 ) ( TRUCK-AT ?auto_98254 ?auto_98247 ) ( IN-TRUCK ?auto_98249 ?auto_98254 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98249 ?auto_98250 ?auto_98247 )
      ( DELIVER-4PKG-VERIFY ?auto_98248 ?auto_98249 ?auto_98250 ?auto_98251 ?auto_98247 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98340 - OBJ
      ?auto_98341 - OBJ
      ?auto_98342 - OBJ
      ?auto_98343 - OBJ
      ?auto_98339 - LOCATION
    )
    :vars
    (
      ?auto_98345 - LOCATION
      ?auto_98344 - CITY
      ?auto_98347 - LOCATION
      ?auto_98346 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_98341 ?auto_98340 ) ) ( not ( = ?auto_98342 ?auto_98340 ) ) ( not ( = ?auto_98342 ?auto_98341 ) ) ( not ( = ?auto_98343 ?auto_98340 ) ) ( not ( = ?auto_98343 ?auto_98341 ) ) ( not ( = ?auto_98343 ?auto_98342 ) ) ( IN-CITY ?auto_98345 ?auto_98344 ) ( IN-CITY ?auto_98339 ?auto_98344 ) ( not ( = ?auto_98339 ?auto_98345 ) ) ( OBJ-AT ?auto_98343 ?auto_98345 ) ( IN-CITY ?auto_98347 ?auto_98344 ) ( not ( = ?auto_98339 ?auto_98347 ) ) ( not ( = ?auto_98345 ?auto_98347 ) ) ( OBJ-AT ?auto_98341 ?auto_98347 ) ( OBJ-AT ?auto_98340 ?auto_98345 ) ( TRUCK-AT ?auto_98346 ?auto_98339 ) ( IN-TRUCK ?auto_98342 ?auto_98346 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98342 ?auto_98343 ?auto_98339 )
      ( DELIVER-4PKG-VERIFY ?auto_98340 ?auto_98341 ?auto_98342 ?auto_98343 ?auto_98339 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98369 - OBJ
      ?auto_98370 - OBJ
      ?auto_98371 - OBJ
      ?auto_98372 - OBJ
      ?auto_98368 - LOCATION
    )
    :vars
    (
      ?auto_98374 - LOCATION
      ?auto_98373 - CITY
      ?auto_98376 - LOCATION
      ?auto_98375 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_98370 ?auto_98369 ) ) ( not ( = ?auto_98371 ?auto_98369 ) ) ( not ( = ?auto_98371 ?auto_98370 ) ) ( not ( = ?auto_98372 ?auto_98369 ) ) ( not ( = ?auto_98372 ?auto_98370 ) ) ( not ( = ?auto_98372 ?auto_98371 ) ) ( IN-CITY ?auto_98374 ?auto_98373 ) ( IN-CITY ?auto_98368 ?auto_98373 ) ( not ( = ?auto_98368 ?auto_98374 ) ) ( OBJ-AT ?auto_98371 ?auto_98374 ) ( IN-CITY ?auto_98376 ?auto_98373 ) ( not ( = ?auto_98368 ?auto_98376 ) ) ( not ( = ?auto_98374 ?auto_98376 ) ) ( OBJ-AT ?auto_98370 ?auto_98376 ) ( OBJ-AT ?auto_98369 ?auto_98374 ) ( TRUCK-AT ?auto_98375 ?auto_98368 ) ( IN-TRUCK ?auto_98372 ?auto_98375 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98372 ?auto_98371 ?auto_98368 )
      ( DELIVER-4PKG-VERIFY ?auto_98369 ?auto_98370 ?auto_98371 ?auto_98372 ?auto_98368 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98428 - OBJ
      ?auto_98429 - OBJ
      ?auto_98430 - OBJ
      ?auto_98431 - OBJ
      ?auto_98427 - LOCATION
    )
    :vars
    (
      ?auto_98433 - LOCATION
      ?auto_98432 - CITY
      ?auto_98435 - LOCATION
      ?auto_98434 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_98429 ?auto_98428 ) ) ( not ( = ?auto_98430 ?auto_98428 ) ) ( not ( = ?auto_98430 ?auto_98429 ) ) ( not ( = ?auto_98431 ?auto_98428 ) ) ( not ( = ?auto_98431 ?auto_98429 ) ) ( not ( = ?auto_98431 ?auto_98430 ) ) ( IN-CITY ?auto_98433 ?auto_98432 ) ( IN-CITY ?auto_98427 ?auto_98432 ) ( not ( = ?auto_98427 ?auto_98433 ) ) ( OBJ-AT ?auto_98429 ?auto_98433 ) ( IN-CITY ?auto_98435 ?auto_98432 ) ( not ( = ?auto_98427 ?auto_98435 ) ) ( not ( = ?auto_98433 ?auto_98435 ) ) ( OBJ-AT ?auto_98431 ?auto_98435 ) ( OBJ-AT ?auto_98428 ?auto_98433 ) ( TRUCK-AT ?auto_98434 ?auto_98427 ) ( IN-TRUCK ?auto_98430 ?auto_98434 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98430 ?auto_98429 ?auto_98427 )
      ( DELIVER-4PKG-VERIFY ?auto_98428 ?auto_98429 ?auto_98430 ?auto_98431 ?auto_98427 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98489 - OBJ
      ?auto_98490 - OBJ
      ?auto_98491 - OBJ
      ?auto_98492 - OBJ
      ?auto_98488 - LOCATION
    )
    :vars
    (
      ?auto_98494 - LOCATION
      ?auto_98493 - CITY
      ?auto_98496 - LOCATION
      ?auto_98495 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_98490 ?auto_98489 ) ) ( not ( = ?auto_98491 ?auto_98489 ) ) ( not ( = ?auto_98491 ?auto_98490 ) ) ( not ( = ?auto_98492 ?auto_98489 ) ) ( not ( = ?auto_98492 ?auto_98490 ) ) ( not ( = ?auto_98492 ?auto_98491 ) ) ( IN-CITY ?auto_98494 ?auto_98493 ) ( IN-CITY ?auto_98488 ?auto_98493 ) ( not ( = ?auto_98488 ?auto_98494 ) ) ( OBJ-AT ?auto_98490 ?auto_98494 ) ( IN-CITY ?auto_98496 ?auto_98493 ) ( not ( = ?auto_98488 ?auto_98496 ) ) ( not ( = ?auto_98494 ?auto_98496 ) ) ( OBJ-AT ?auto_98491 ?auto_98496 ) ( OBJ-AT ?auto_98489 ?auto_98494 ) ( TRUCK-AT ?auto_98495 ?auto_98488 ) ( IN-TRUCK ?auto_98492 ?auto_98495 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98492 ?auto_98490 ?auto_98488 )
      ( DELIVER-4PKG-VERIFY ?auto_98489 ?auto_98490 ?auto_98491 ?auto_98492 ?auto_98488 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98580 - OBJ
      ?auto_98581 - OBJ
      ?auto_98582 - OBJ
      ?auto_98583 - OBJ
      ?auto_98579 - LOCATION
    )
    :vars
    (
      ?auto_98585 - LOCATION
      ?auto_98584 - CITY
      ?auto_98587 - LOCATION
      ?auto_98586 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_98581 ?auto_98580 ) ) ( not ( = ?auto_98582 ?auto_98580 ) ) ( not ( = ?auto_98582 ?auto_98581 ) ) ( not ( = ?auto_98583 ?auto_98580 ) ) ( not ( = ?auto_98583 ?auto_98581 ) ) ( not ( = ?auto_98583 ?auto_98582 ) ) ( IN-CITY ?auto_98585 ?auto_98584 ) ( IN-CITY ?auto_98579 ?auto_98584 ) ( not ( = ?auto_98579 ?auto_98585 ) ) ( OBJ-AT ?auto_98583 ?auto_98585 ) ( IN-CITY ?auto_98587 ?auto_98584 ) ( not ( = ?auto_98579 ?auto_98587 ) ) ( not ( = ?auto_98585 ?auto_98587 ) ) ( OBJ-AT ?auto_98580 ?auto_98587 ) ( OBJ-AT ?auto_98582 ?auto_98585 ) ( TRUCK-AT ?auto_98586 ?auto_98579 ) ( IN-TRUCK ?auto_98581 ?auto_98586 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98581 ?auto_98583 ?auto_98579 )
      ( DELIVER-4PKG-VERIFY ?auto_98580 ?auto_98581 ?auto_98582 ?auto_98583 ?auto_98579 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98609 - OBJ
      ?auto_98610 - OBJ
      ?auto_98611 - OBJ
      ?auto_98612 - OBJ
      ?auto_98608 - LOCATION
    )
    :vars
    (
      ?auto_98614 - LOCATION
      ?auto_98613 - CITY
      ?auto_98616 - LOCATION
      ?auto_98615 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_98610 ?auto_98609 ) ) ( not ( = ?auto_98611 ?auto_98609 ) ) ( not ( = ?auto_98611 ?auto_98610 ) ) ( not ( = ?auto_98612 ?auto_98609 ) ) ( not ( = ?auto_98612 ?auto_98610 ) ) ( not ( = ?auto_98612 ?auto_98611 ) ) ( IN-CITY ?auto_98614 ?auto_98613 ) ( IN-CITY ?auto_98608 ?auto_98613 ) ( not ( = ?auto_98608 ?auto_98614 ) ) ( OBJ-AT ?auto_98611 ?auto_98614 ) ( IN-CITY ?auto_98616 ?auto_98613 ) ( not ( = ?auto_98608 ?auto_98616 ) ) ( not ( = ?auto_98614 ?auto_98616 ) ) ( OBJ-AT ?auto_98609 ?auto_98616 ) ( OBJ-AT ?auto_98612 ?auto_98614 ) ( TRUCK-AT ?auto_98615 ?auto_98608 ) ( IN-TRUCK ?auto_98610 ?auto_98615 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98610 ?auto_98611 ?auto_98608 )
      ( DELIVER-4PKG-VERIFY ?auto_98609 ?auto_98610 ?auto_98611 ?auto_98612 ?auto_98608 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98638 - OBJ
      ?auto_98639 - OBJ
      ?auto_98640 - OBJ
      ?auto_98641 - OBJ
      ?auto_98637 - LOCATION
    )
    :vars
    (
      ?auto_98643 - LOCATION
      ?auto_98642 - CITY
      ?auto_98645 - LOCATION
      ?auto_98644 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_98639 ?auto_98638 ) ) ( not ( = ?auto_98640 ?auto_98638 ) ) ( not ( = ?auto_98640 ?auto_98639 ) ) ( not ( = ?auto_98641 ?auto_98638 ) ) ( not ( = ?auto_98641 ?auto_98639 ) ) ( not ( = ?auto_98641 ?auto_98640 ) ) ( IN-CITY ?auto_98643 ?auto_98642 ) ( IN-CITY ?auto_98637 ?auto_98642 ) ( not ( = ?auto_98637 ?auto_98643 ) ) ( OBJ-AT ?auto_98641 ?auto_98643 ) ( IN-CITY ?auto_98645 ?auto_98642 ) ( not ( = ?auto_98637 ?auto_98645 ) ) ( not ( = ?auto_98643 ?auto_98645 ) ) ( OBJ-AT ?auto_98638 ?auto_98645 ) ( OBJ-AT ?auto_98639 ?auto_98643 ) ( TRUCK-AT ?auto_98644 ?auto_98637 ) ( IN-TRUCK ?auto_98640 ?auto_98644 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98640 ?auto_98641 ?auto_98637 )
      ( DELIVER-4PKG-VERIFY ?auto_98638 ?auto_98639 ?auto_98640 ?auto_98641 ?auto_98637 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98667 - OBJ
      ?auto_98668 - OBJ
      ?auto_98669 - OBJ
      ?auto_98670 - OBJ
      ?auto_98666 - LOCATION
    )
    :vars
    (
      ?auto_98672 - LOCATION
      ?auto_98671 - CITY
      ?auto_98674 - LOCATION
      ?auto_98673 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_98668 ?auto_98667 ) ) ( not ( = ?auto_98669 ?auto_98667 ) ) ( not ( = ?auto_98669 ?auto_98668 ) ) ( not ( = ?auto_98670 ?auto_98667 ) ) ( not ( = ?auto_98670 ?auto_98668 ) ) ( not ( = ?auto_98670 ?auto_98669 ) ) ( IN-CITY ?auto_98672 ?auto_98671 ) ( IN-CITY ?auto_98666 ?auto_98671 ) ( not ( = ?auto_98666 ?auto_98672 ) ) ( OBJ-AT ?auto_98669 ?auto_98672 ) ( IN-CITY ?auto_98674 ?auto_98671 ) ( not ( = ?auto_98666 ?auto_98674 ) ) ( not ( = ?auto_98672 ?auto_98674 ) ) ( OBJ-AT ?auto_98667 ?auto_98674 ) ( OBJ-AT ?auto_98668 ?auto_98672 ) ( TRUCK-AT ?auto_98673 ?auto_98666 ) ( IN-TRUCK ?auto_98670 ?auto_98673 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98670 ?auto_98669 ?auto_98666 )
      ( DELIVER-4PKG-VERIFY ?auto_98667 ?auto_98668 ?auto_98669 ?auto_98670 ?auto_98666 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98789 - OBJ
      ?auto_98790 - OBJ
      ?auto_98791 - OBJ
      ?auto_98792 - OBJ
      ?auto_98788 - LOCATION
    )
    :vars
    (
      ?auto_98794 - LOCATION
      ?auto_98793 - CITY
      ?auto_98796 - LOCATION
      ?auto_98795 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_98790 ?auto_98789 ) ) ( not ( = ?auto_98791 ?auto_98789 ) ) ( not ( = ?auto_98791 ?auto_98790 ) ) ( not ( = ?auto_98792 ?auto_98789 ) ) ( not ( = ?auto_98792 ?auto_98790 ) ) ( not ( = ?auto_98792 ?auto_98791 ) ) ( IN-CITY ?auto_98794 ?auto_98793 ) ( IN-CITY ?auto_98788 ?auto_98793 ) ( not ( = ?auto_98788 ?auto_98794 ) ) ( OBJ-AT ?auto_98790 ?auto_98794 ) ( IN-CITY ?auto_98796 ?auto_98793 ) ( not ( = ?auto_98788 ?auto_98796 ) ) ( not ( = ?auto_98794 ?auto_98796 ) ) ( OBJ-AT ?auto_98789 ?auto_98796 ) ( OBJ-AT ?auto_98792 ?auto_98794 ) ( TRUCK-AT ?auto_98795 ?auto_98788 ) ( IN-TRUCK ?auto_98791 ?auto_98795 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98791 ?auto_98790 ?auto_98788 )
      ( DELIVER-4PKG-VERIFY ?auto_98789 ?auto_98790 ?auto_98791 ?auto_98792 ?auto_98788 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98818 - OBJ
      ?auto_98819 - OBJ
      ?auto_98820 - OBJ
      ?auto_98821 - OBJ
      ?auto_98817 - LOCATION
    )
    :vars
    (
      ?auto_98823 - LOCATION
      ?auto_98822 - CITY
      ?auto_98825 - LOCATION
      ?auto_98824 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_98819 ?auto_98818 ) ) ( not ( = ?auto_98820 ?auto_98818 ) ) ( not ( = ?auto_98820 ?auto_98819 ) ) ( not ( = ?auto_98821 ?auto_98818 ) ) ( not ( = ?auto_98821 ?auto_98819 ) ) ( not ( = ?auto_98821 ?auto_98820 ) ) ( IN-CITY ?auto_98823 ?auto_98822 ) ( IN-CITY ?auto_98817 ?auto_98822 ) ( not ( = ?auto_98817 ?auto_98823 ) ) ( OBJ-AT ?auto_98819 ?auto_98823 ) ( IN-CITY ?auto_98825 ?auto_98822 ) ( not ( = ?auto_98817 ?auto_98825 ) ) ( not ( = ?auto_98823 ?auto_98825 ) ) ( OBJ-AT ?auto_98818 ?auto_98825 ) ( OBJ-AT ?auto_98820 ?auto_98823 ) ( TRUCK-AT ?auto_98824 ?auto_98817 ) ( IN-TRUCK ?auto_98821 ?auto_98824 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98821 ?auto_98819 ?auto_98817 )
      ( DELIVER-4PKG-VERIFY ?auto_98818 ?auto_98819 ?auto_98820 ?auto_98821 ?auto_98817 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99003 - OBJ
      ?auto_99004 - OBJ
      ?auto_99005 - OBJ
      ?auto_99006 - OBJ
      ?auto_99002 - LOCATION
    )
    :vars
    (
      ?auto_99008 - LOCATION
      ?auto_99007 - CITY
      ?auto_99010 - LOCATION
      ?auto_99009 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_99004 ?auto_99003 ) ) ( not ( = ?auto_99005 ?auto_99003 ) ) ( not ( = ?auto_99005 ?auto_99004 ) ) ( not ( = ?auto_99006 ?auto_99003 ) ) ( not ( = ?auto_99006 ?auto_99004 ) ) ( not ( = ?auto_99006 ?auto_99005 ) ) ( IN-CITY ?auto_99008 ?auto_99007 ) ( IN-CITY ?auto_99002 ?auto_99007 ) ( not ( = ?auto_99002 ?auto_99008 ) ) ( OBJ-AT ?auto_99003 ?auto_99008 ) ( IN-CITY ?auto_99010 ?auto_99007 ) ( not ( = ?auto_99002 ?auto_99010 ) ) ( not ( = ?auto_99008 ?auto_99010 ) ) ( OBJ-AT ?auto_99006 ?auto_99010 ) ( OBJ-AT ?auto_99005 ?auto_99008 ) ( TRUCK-AT ?auto_99009 ?auto_99002 ) ( IN-TRUCK ?auto_99004 ?auto_99009 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99004 ?auto_99003 ?auto_99002 )
      ( DELIVER-4PKG-VERIFY ?auto_99003 ?auto_99004 ?auto_99005 ?auto_99006 ?auto_99002 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99032 - OBJ
      ?auto_99033 - OBJ
      ?auto_99034 - OBJ
      ?auto_99035 - OBJ
      ?auto_99031 - LOCATION
    )
    :vars
    (
      ?auto_99037 - LOCATION
      ?auto_99036 - CITY
      ?auto_99039 - LOCATION
      ?auto_99038 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_99033 ?auto_99032 ) ) ( not ( = ?auto_99034 ?auto_99032 ) ) ( not ( = ?auto_99034 ?auto_99033 ) ) ( not ( = ?auto_99035 ?auto_99032 ) ) ( not ( = ?auto_99035 ?auto_99033 ) ) ( not ( = ?auto_99035 ?auto_99034 ) ) ( IN-CITY ?auto_99037 ?auto_99036 ) ( IN-CITY ?auto_99031 ?auto_99036 ) ( not ( = ?auto_99031 ?auto_99037 ) ) ( OBJ-AT ?auto_99032 ?auto_99037 ) ( IN-CITY ?auto_99039 ?auto_99036 ) ( not ( = ?auto_99031 ?auto_99039 ) ) ( not ( = ?auto_99037 ?auto_99039 ) ) ( OBJ-AT ?auto_99034 ?auto_99039 ) ( OBJ-AT ?auto_99035 ?auto_99037 ) ( TRUCK-AT ?auto_99038 ?auto_99031 ) ( IN-TRUCK ?auto_99033 ?auto_99038 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99033 ?auto_99032 ?auto_99031 )
      ( DELIVER-4PKG-VERIFY ?auto_99032 ?auto_99033 ?auto_99034 ?auto_99035 ?auto_99031 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99123 - OBJ
      ?auto_99124 - OBJ
      ?auto_99125 - OBJ
      ?auto_99126 - OBJ
      ?auto_99122 - LOCATION
    )
    :vars
    (
      ?auto_99128 - LOCATION
      ?auto_99127 - CITY
      ?auto_99130 - LOCATION
      ?auto_99129 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_99124 ?auto_99123 ) ) ( not ( = ?auto_99125 ?auto_99123 ) ) ( not ( = ?auto_99125 ?auto_99124 ) ) ( not ( = ?auto_99126 ?auto_99123 ) ) ( not ( = ?auto_99126 ?auto_99124 ) ) ( not ( = ?auto_99126 ?auto_99125 ) ) ( IN-CITY ?auto_99128 ?auto_99127 ) ( IN-CITY ?auto_99122 ?auto_99127 ) ( not ( = ?auto_99122 ?auto_99128 ) ) ( OBJ-AT ?auto_99123 ?auto_99128 ) ( IN-CITY ?auto_99130 ?auto_99127 ) ( not ( = ?auto_99122 ?auto_99130 ) ) ( not ( = ?auto_99128 ?auto_99130 ) ) ( OBJ-AT ?auto_99126 ?auto_99130 ) ( OBJ-AT ?auto_99124 ?auto_99128 ) ( TRUCK-AT ?auto_99129 ?auto_99122 ) ( IN-TRUCK ?auto_99125 ?auto_99129 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99125 ?auto_99123 ?auto_99122 )
      ( DELIVER-4PKG-VERIFY ?auto_99123 ?auto_99124 ?auto_99125 ?auto_99126 ?auto_99122 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99184 - OBJ
      ?auto_99185 - OBJ
      ?auto_99186 - OBJ
      ?auto_99187 - OBJ
      ?auto_99183 - LOCATION
    )
    :vars
    (
      ?auto_99189 - LOCATION
      ?auto_99188 - CITY
      ?auto_99191 - LOCATION
      ?auto_99190 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_99185 ?auto_99184 ) ) ( not ( = ?auto_99186 ?auto_99184 ) ) ( not ( = ?auto_99186 ?auto_99185 ) ) ( not ( = ?auto_99187 ?auto_99184 ) ) ( not ( = ?auto_99187 ?auto_99185 ) ) ( not ( = ?auto_99187 ?auto_99186 ) ) ( IN-CITY ?auto_99189 ?auto_99188 ) ( IN-CITY ?auto_99183 ?auto_99188 ) ( not ( = ?auto_99183 ?auto_99189 ) ) ( OBJ-AT ?auto_99184 ?auto_99189 ) ( IN-CITY ?auto_99191 ?auto_99188 ) ( not ( = ?auto_99183 ?auto_99191 ) ) ( not ( = ?auto_99189 ?auto_99191 ) ) ( OBJ-AT ?auto_99186 ?auto_99191 ) ( OBJ-AT ?auto_99185 ?auto_99189 ) ( TRUCK-AT ?auto_99190 ?auto_99183 ) ( IN-TRUCK ?auto_99187 ?auto_99190 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99187 ?auto_99184 ?auto_99183 )
      ( DELIVER-4PKG-VERIFY ?auto_99184 ?auto_99185 ?auto_99186 ?auto_99187 ?auto_99183 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99275 - OBJ
      ?auto_99276 - OBJ
      ?auto_99277 - OBJ
      ?auto_99278 - OBJ
      ?auto_99274 - LOCATION
    )
    :vars
    (
      ?auto_99280 - LOCATION
      ?auto_99279 - CITY
      ?auto_99282 - LOCATION
      ?auto_99281 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_99276 ?auto_99275 ) ) ( not ( = ?auto_99277 ?auto_99275 ) ) ( not ( = ?auto_99277 ?auto_99276 ) ) ( not ( = ?auto_99278 ?auto_99275 ) ) ( not ( = ?auto_99278 ?auto_99276 ) ) ( not ( = ?auto_99278 ?auto_99277 ) ) ( IN-CITY ?auto_99280 ?auto_99279 ) ( IN-CITY ?auto_99274 ?auto_99279 ) ( not ( = ?auto_99274 ?auto_99280 ) ) ( OBJ-AT ?auto_99275 ?auto_99280 ) ( IN-CITY ?auto_99282 ?auto_99279 ) ( not ( = ?auto_99274 ?auto_99282 ) ) ( not ( = ?auto_99280 ?auto_99282 ) ) ( OBJ-AT ?auto_99276 ?auto_99282 ) ( OBJ-AT ?auto_99278 ?auto_99280 ) ( TRUCK-AT ?auto_99281 ?auto_99274 ) ( IN-TRUCK ?auto_99277 ?auto_99281 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99277 ?auto_99275 ?auto_99274 )
      ( DELIVER-4PKG-VERIFY ?auto_99275 ?auto_99276 ?auto_99277 ?auto_99278 ?auto_99274 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99304 - OBJ
      ?auto_99305 - OBJ
      ?auto_99306 - OBJ
      ?auto_99307 - OBJ
      ?auto_99303 - LOCATION
    )
    :vars
    (
      ?auto_99309 - LOCATION
      ?auto_99308 - CITY
      ?auto_99311 - LOCATION
      ?auto_99310 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_99305 ?auto_99304 ) ) ( not ( = ?auto_99306 ?auto_99304 ) ) ( not ( = ?auto_99306 ?auto_99305 ) ) ( not ( = ?auto_99307 ?auto_99304 ) ) ( not ( = ?auto_99307 ?auto_99305 ) ) ( not ( = ?auto_99307 ?auto_99306 ) ) ( IN-CITY ?auto_99309 ?auto_99308 ) ( IN-CITY ?auto_99303 ?auto_99308 ) ( not ( = ?auto_99303 ?auto_99309 ) ) ( OBJ-AT ?auto_99304 ?auto_99309 ) ( IN-CITY ?auto_99311 ?auto_99308 ) ( not ( = ?auto_99303 ?auto_99311 ) ) ( not ( = ?auto_99309 ?auto_99311 ) ) ( OBJ-AT ?auto_99305 ?auto_99311 ) ( OBJ-AT ?auto_99306 ?auto_99309 ) ( TRUCK-AT ?auto_99310 ?auto_99303 ) ( IN-TRUCK ?auto_99307 ?auto_99310 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99307 ?auto_99304 ?auto_99303 )
      ( DELIVER-4PKG-VERIFY ?auto_99304 ?auto_99305 ?auto_99306 ?auto_99307 ?auto_99303 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_99598 - OBJ
      ?auto_99597 - LOCATION
    )
    :vars
    (
      ?auto_99605 - OBJ
      ?auto_99600 - LOCATION
      ?auto_99599 - CITY
      ?auto_99602 - OBJ
      ?auto_99604 - LOCATION
      ?auto_99603 - OBJ
      ?auto_99601 - TRUCK
      ?auto_99606 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99598 ?auto_99605 ) ) ( IN-CITY ?auto_99600 ?auto_99599 ) ( IN-CITY ?auto_99597 ?auto_99599 ) ( not ( = ?auto_99597 ?auto_99600 ) ) ( OBJ-AT ?auto_99598 ?auto_99600 ) ( not ( = ?auto_99602 ?auto_99605 ) ) ( not ( = ?auto_99598 ?auto_99602 ) ) ( IN-CITY ?auto_99604 ?auto_99599 ) ( not ( = ?auto_99597 ?auto_99604 ) ) ( not ( = ?auto_99600 ?auto_99604 ) ) ( OBJ-AT ?auto_99602 ?auto_99604 ) ( not ( = ?auto_99603 ?auto_99605 ) ) ( not ( = ?auto_99598 ?auto_99603 ) ) ( not ( = ?auto_99602 ?auto_99603 ) ) ( OBJ-AT ?auto_99603 ?auto_99600 ) ( IN-TRUCK ?auto_99605 ?auto_99601 ) ( TRUCK-AT ?auto_99601 ?auto_99606 ) ( IN-CITY ?auto_99606 ?auto_99599 ) ( not ( = ?auto_99597 ?auto_99606 ) ) ( not ( = ?auto_99600 ?auto_99606 ) ) ( not ( = ?auto_99604 ?auto_99606 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_99601 ?auto_99606 ?auto_99597 ?auto_99599 )
      ( DELIVER-2PKG ?auto_99605 ?auto_99598 ?auto_99597 )
      ( DELIVER-1PKG-VERIFY ?auto_99598 ?auto_99597 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_99608 - OBJ
      ?auto_99609 - OBJ
      ?auto_99607 - LOCATION
    )
    :vars
    (
      ?auto_99613 - LOCATION
      ?auto_99610 - CITY
      ?auto_99611 - OBJ
      ?auto_99615 - LOCATION
      ?auto_99612 - OBJ
      ?auto_99614 - TRUCK
      ?auto_99616 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99609 ?auto_99608 ) ) ( IN-CITY ?auto_99613 ?auto_99610 ) ( IN-CITY ?auto_99607 ?auto_99610 ) ( not ( = ?auto_99607 ?auto_99613 ) ) ( OBJ-AT ?auto_99609 ?auto_99613 ) ( not ( = ?auto_99611 ?auto_99608 ) ) ( not ( = ?auto_99609 ?auto_99611 ) ) ( IN-CITY ?auto_99615 ?auto_99610 ) ( not ( = ?auto_99607 ?auto_99615 ) ) ( not ( = ?auto_99613 ?auto_99615 ) ) ( OBJ-AT ?auto_99611 ?auto_99615 ) ( not ( = ?auto_99612 ?auto_99608 ) ) ( not ( = ?auto_99609 ?auto_99612 ) ) ( not ( = ?auto_99611 ?auto_99612 ) ) ( OBJ-AT ?auto_99612 ?auto_99613 ) ( IN-TRUCK ?auto_99608 ?auto_99614 ) ( TRUCK-AT ?auto_99614 ?auto_99616 ) ( IN-CITY ?auto_99616 ?auto_99610 ) ( not ( = ?auto_99607 ?auto_99616 ) ) ( not ( = ?auto_99613 ?auto_99616 ) ) ( not ( = ?auto_99615 ?auto_99616 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_99609 ?auto_99607 )
      ( DELIVER-2PKG-VERIFY ?auto_99608 ?auto_99609 ?auto_99607 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_99618 - OBJ
      ?auto_99619 - OBJ
      ?auto_99617 - LOCATION
    )
    :vars
    (
      ?auto_99626 - OBJ
      ?auto_99622 - LOCATION
      ?auto_99623 - CITY
      ?auto_99624 - OBJ
      ?auto_99625 - LOCATION
      ?auto_99621 - TRUCK
      ?auto_99620 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99619 ?auto_99618 ) ) ( not ( = ?auto_99619 ?auto_99626 ) ) ( IN-CITY ?auto_99622 ?auto_99623 ) ( IN-CITY ?auto_99617 ?auto_99623 ) ( not ( = ?auto_99617 ?auto_99622 ) ) ( OBJ-AT ?auto_99619 ?auto_99622 ) ( not ( = ?auto_99624 ?auto_99626 ) ) ( not ( = ?auto_99619 ?auto_99624 ) ) ( IN-CITY ?auto_99625 ?auto_99623 ) ( not ( = ?auto_99617 ?auto_99625 ) ) ( not ( = ?auto_99622 ?auto_99625 ) ) ( OBJ-AT ?auto_99624 ?auto_99625 ) ( not ( = ?auto_99618 ?auto_99626 ) ) ( not ( = ?auto_99624 ?auto_99618 ) ) ( OBJ-AT ?auto_99618 ?auto_99622 ) ( IN-TRUCK ?auto_99626 ?auto_99621 ) ( TRUCK-AT ?auto_99621 ?auto_99620 ) ( IN-CITY ?auto_99620 ?auto_99623 ) ( not ( = ?auto_99617 ?auto_99620 ) ) ( not ( = ?auto_99622 ?auto_99620 ) ) ( not ( = ?auto_99625 ?auto_99620 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99626 ?auto_99619 ?auto_99617 )
      ( DELIVER-2PKG-VERIFY ?auto_99618 ?auto_99619 ?auto_99617 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_99628 - OBJ
      ?auto_99629 - OBJ
      ?auto_99627 - LOCATION
    )
    :vars
    (
      ?auto_99636 - OBJ
      ?auto_99633 - LOCATION
      ?auto_99634 - CITY
      ?auto_99635 - LOCATION
      ?auto_99632 - OBJ
      ?auto_99631 - TRUCK
      ?auto_99630 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99629 ?auto_99628 ) ) ( not ( = ?auto_99629 ?auto_99636 ) ) ( IN-CITY ?auto_99633 ?auto_99634 ) ( IN-CITY ?auto_99627 ?auto_99634 ) ( not ( = ?auto_99627 ?auto_99633 ) ) ( OBJ-AT ?auto_99629 ?auto_99633 ) ( not ( = ?auto_99628 ?auto_99636 ) ) ( IN-CITY ?auto_99635 ?auto_99634 ) ( not ( = ?auto_99627 ?auto_99635 ) ) ( not ( = ?auto_99633 ?auto_99635 ) ) ( OBJ-AT ?auto_99628 ?auto_99635 ) ( not ( = ?auto_99632 ?auto_99636 ) ) ( not ( = ?auto_99629 ?auto_99632 ) ) ( not ( = ?auto_99628 ?auto_99632 ) ) ( OBJ-AT ?auto_99632 ?auto_99633 ) ( IN-TRUCK ?auto_99636 ?auto_99631 ) ( TRUCK-AT ?auto_99631 ?auto_99630 ) ( IN-CITY ?auto_99630 ?auto_99634 ) ( not ( = ?auto_99627 ?auto_99630 ) ) ( not ( = ?auto_99633 ?auto_99630 ) ) ( not ( = ?auto_99635 ?auto_99630 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99636 ?auto_99629 ?auto_99627 )
      ( DELIVER-2PKG-VERIFY ?auto_99628 ?auto_99629 ?auto_99627 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_99638 - OBJ
      ?auto_99639 - OBJ
      ?auto_99637 - LOCATION
    )
    :vars
    (
      ?auto_99643 - LOCATION
      ?auto_99644 - CITY
      ?auto_99645 - OBJ
      ?auto_99646 - LOCATION
      ?auto_99642 - OBJ
      ?auto_99641 - TRUCK
      ?auto_99640 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99639 ?auto_99638 ) ) ( IN-CITY ?auto_99643 ?auto_99644 ) ( IN-CITY ?auto_99637 ?auto_99644 ) ( not ( = ?auto_99637 ?auto_99643 ) ) ( OBJ-AT ?auto_99638 ?auto_99643 ) ( not ( = ?auto_99645 ?auto_99639 ) ) ( not ( = ?auto_99638 ?auto_99645 ) ) ( IN-CITY ?auto_99646 ?auto_99644 ) ( not ( = ?auto_99637 ?auto_99646 ) ) ( not ( = ?auto_99643 ?auto_99646 ) ) ( OBJ-AT ?auto_99645 ?auto_99646 ) ( not ( = ?auto_99642 ?auto_99639 ) ) ( not ( = ?auto_99638 ?auto_99642 ) ) ( not ( = ?auto_99645 ?auto_99642 ) ) ( OBJ-AT ?auto_99642 ?auto_99643 ) ( IN-TRUCK ?auto_99639 ?auto_99641 ) ( TRUCK-AT ?auto_99641 ?auto_99640 ) ( IN-CITY ?auto_99640 ?auto_99644 ) ( not ( = ?auto_99637 ?auto_99640 ) ) ( not ( = ?auto_99643 ?auto_99640 ) ) ( not ( = ?auto_99646 ?auto_99640 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99639 ?auto_99638 ?auto_99637 )
      ( DELIVER-2PKG-VERIFY ?auto_99638 ?auto_99639 ?auto_99637 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_99648 - OBJ
      ?auto_99649 - OBJ
      ?auto_99647 - LOCATION
    )
    :vars
    (
      ?auto_99656 - OBJ
      ?auto_99652 - LOCATION
      ?auto_99653 - CITY
      ?auto_99654 - OBJ
      ?auto_99655 - LOCATION
      ?auto_99651 - TRUCK
      ?auto_99650 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99649 ?auto_99648 ) ) ( not ( = ?auto_99648 ?auto_99656 ) ) ( IN-CITY ?auto_99652 ?auto_99653 ) ( IN-CITY ?auto_99647 ?auto_99653 ) ( not ( = ?auto_99647 ?auto_99652 ) ) ( OBJ-AT ?auto_99648 ?auto_99652 ) ( not ( = ?auto_99654 ?auto_99656 ) ) ( not ( = ?auto_99648 ?auto_99654 ) ) ( IN-CITY ?auto_99655 ?auto_99653 ) ( not ( = ?auto_99647 ?auto_99655 ) ) ( not ( = ?auto_99652 ?auto_99655 ) ) ( OBJ-AT ?auto_99654 ?auto_99655 ) ( not ( = ?auto_99649 ?auto_99656 ) ) ( not ( = ?auto_99654 ?auto_99649 ) ) ( OBJ-AT ?auto_99649 ?auto_99652 ) ( IN-TRUCK ?auto_99656 ?auto_99651 ) ( TRUCK-AT ?auto_99651 ?auto_99650 ) ( IN-CITY ?auto_99650 ?auto_99653 ) ( not ( = ?auto_99647 ?auto_99650 ) ) ( not ( = ?auto_99652 ?auto_99650 ) ) ( not ( = ?auto_99655 ?auto_99650 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99656 ?auto_99648 ?auto_99647 )
      ( DELIVER-2PKG-VERIFY ?auto_99648 ?auto_99649 ?auto_99647 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_99658 - OBJ
      ?auto_99659 - OBJ
      ?auto_99657 - LOCATION
    )
    :vars
    (
      ?auto_99666 - OBJ
      ?auto_99663 - LOCATION
      ?auto_99664 - CITY
      ?auto_99665 - LOCATION
      ?auto_99662 - OBJ
      ?auto_99661 - TRUCK
      ?auto_99660 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99659 ?auto_99658 ) ) ( not ( = ?auto_99658 ?auto_99666 ) ) ( IN-CITY ?auto_99663 ?auto_99664 ) ( IN-CITY ?auto_99657 ?auto_99664 ) ( not ( = ?auto_99657 ?auto_99663 ) ) ( OBJ-AT ?auto_99658 ?auto_99663 ) ( not ( = ?auto_99659 ?auto_99666 ) ) ( IN-CITY ?auto_99665 ?auto_99664 ) ( not ( = ?auto_99657 ?auto_99665 ) ) ( not ( = ?auto_99663 ?auto_99665 ) ) ( OBJ-AT ?auto_99659 ?auto_99665 ) ( not ( = ?auto_99662 ?auto_99666 ) ) ( not ( = ?auto_99658 ?auto_99662 ) ) ( not ( = ?auto_99659 ?auto_99662 ) ) ( OBJ-AT ?auto_99662 ?auto_99663 ) ( IN-TRUCK ?auto_99666 ?auto_99661 ) ( TRUCK-AT ?auto_99661 ?auto_99660 ) ( IN-CITY ?auto_99660 ?auto_99664 ) ( not ( = ?auto_99657 ?auto_99660 ) ) ( not ( = ?auto_99663 ?auto_99660 ) ) ( not ( = ?auto_99665 ?auto_99660 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99666 ?auto_99658 ?auto_99657 )
      ( DELIVER-2PKG-VERIFY ?auto_99658 ?auto_99659 ?auto_99657 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99690 - OBJ
      ?auto_99691 - OBJ
      ?auto_99692 - OBJ
      ?auto_99689 - LOCATION
    )
    :vars
    (
      ?auto_99695 - LOCATION
      ?auto_99696 - CITY
      ?auto_99697 - OBJ
      ?auto_99698 - LOCATION
      ?auto_99694 - TRUCK
      ?auto_99693 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99691 ?auto_99690 ) ) ( not ( = ?auto_99692 ?auto_99690 ) ) ( not ( = ?auto_99692 ?auto_99691 ) ) ( IN-CITY ?auto_99695 ?auto_99696 ) ( IN-CITY ?auto_99689 ?auto_99696 ) ( not ( = ?auto_99689 ?auto_99695 ) ) ( OBJ-AT ?auto_99692 ?auto_99695 ) ( not ( = ?auto_99697 ?auto_99690 ) ) ( not ( = ?auto_99692 ?auto_99697 ) ) ( IN-CITY ?auto_99698 ?auto_99696 ) ( not ( = ?auto_99689 ?auto_99698 ) ) ( not ( = ?auto_99695 ?auto_99698 ) ) ( OBJ-AT ?auto_99697 ?auto_99698 ) ( not ( = ?auto_99697 ?auto_99691 ) ) ( OBJ-AT ?auto_99691 ?auto_99695 ) ( IN-TRUCK ?auto_99690 ?auto_99694 ) ( TRUCK-AT ?auto_99694 ?auto_99693 ) ( IN-CITY ?auto_99693 ?auto_99696 ) ( not ( = ?auto_99689 ?auto_99693 ) ) ( not ( = ?auto_99695 ?auto_99693 ) ) ( not ( = ?auto_99698 ?auto_99693 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99690 ?auto_99692 ?auto_99689 )
      ( DELIVER-3PKG-VERIFY ?auto_99690 ?auto_99691 ?auto_99692 ?auto_99689 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99700 - OBJ
      ?auto_99701 - OBJ
      ?auto_99702 - OBJ
      ?auto_99699 - LOCATION
    )
    :vars
    (
      ?auto_99706 - LOCATION
      ?auto_99707 - CITY
      ?auto_99708 - LOCATION
      ?auto_99705 - OBJ
      ?auto_99704 - TRUCK
      ?auto_99703 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99701 ?auto_99700 ) ) ( not ( = ?auto_99702 ?auto_99700 ) ) ( not ( = ?auto_99702 ?auto_99701 ) ) ( IN-CITY ?auto_99706 ?auto_99707 ) ( IN-CITY ?auto_99699 ?auto_99707 ) ( not ( = ?auto_99699 ?auto_99706 ) ) ( OBJ-AT ?auto_99702 ?auto_99706 ) ( IN-CITY ?auto_99708 ?auto_99707 ) ( not ( = ?auto_99699 ?auto_99708 ) ) ( not ( = ?auto_99706 ?auto_99708 ) ) ( OBJ-AT ?auto_99701 ?auto_99708 ) ( not ( = ?auto_99705 ?auto_99700 ) ) ( not ( = ?auto_99702 ?auto_99705 ) ) ( not ( = ?auto_99701 ?auto_99705 ) ) ( OBJ-AT ?auto_99705 ?auto_99706 ) ( IN-TRUCK ?auto_99700 ?auto_99704 ) ( TRUCK-AT ?auto_99704 ?auto_99703 ) ( IN-CITY ?auto_99703 ?auto_99707 ) ( not ( = ?auto_99699 ?auto_99703 ) ) ( not ( = ?auto_99706 ?auto_99703 ) ) ( not ( = ?auto_99708 ?auto_99703 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99700 ?auto_99702 ?auto_99699 )
      ( DELIVER-3PKG-VERIFY ?auto_99700 ?auto_99701 ?auto_99702 ?auto_99699 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99721 - OBJ
      ?auto_99722 - OBJ
      ?auto_99723 - OBJ
      ?auto_99720 - LOCATION
    )
    :vars
    (
      ?auto_99726 - LOCATION
      ?auto_99727 - CITY
      ?auto_99728 - OBJ
      ?auto_99729 - LOCATION
      ?auto_99725 - TRUCK
      ?auto_99724 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99722 ?auto_99721 ) ) ( not ( = ?auto_99723 ?auto_99721 ) ) ( not ( = ?auto_99723 ?auto_99722 ) ) ( IN-CITY ?auto_99726 ?auto_99727 ) ( IN-CITY ?auto_99720 ?auto_99727 ) ( not ( = ?auto_99720 ?auto_99726 ) ) ( OBJ-AT ?auto_99722 ?auto_99726 ) ( not ( = ?auto_99728 ?auto_99721 ) ) ( not ( = ?auto_99722 ?auto_99728 ) ) ( IN-CITY ?auto_99729 ?auto_99727 ) ( not ( = ?auto_99720 ?auto_99729 ) ) ( not ( = ?auto_99726 ?auto_99729 ) ) ( OBJ-AT ?auto_99728 ?auto_99729 ) ( not ( = ?auto_99728 ?auto_99723 ) ) ( OBJ-AT ?auto_99723 ?auto_99726 ) ( IN-TRUCK ?auto_99721 ?auto_99725 ) ( TRUCK-AT ?auto_99725 ?auto_99724 ) ( IN-CITY ?auto_99724 ?auto_99727 ) ( not ( = ?auto_99720 ?auto_99724 ) ) ( not ( = ?auto_99726 ?auto_99724 ) ) ( not ( = ?auto_99729 ?auto_99724 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99721 ?auto_99722 ?auto_99720 )
      ( DELIVER-3PKG-VERIFY ?auto_99721 ?auto_99722 ?auto_99723 ?auto_99720 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99731 - OBJ
      ?auto_99732 - OBJ
      ?auto_99733 - OBJ
      ?auto_99730 - LOCATION
    )
    :vars
    (
      ?auto_99737 - LOCATION
      ?auto_99738 - CITY
      ?auto_99739 - LOCATION
      ?auto_99736 - OBJ
      ?auto_99735 - TRUCK
      ?auto_99734 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99732 ?auto_99731 ) ) ( not ( = ?auto_99733 ?auto_99731 ) ) ( not ( = ?auto_99733 ?auto_99732 ) ) ( IN-CITY ?auto_99737 ?auto_99738 ) ( IN-CITY ?auto_99730 ?auto_99738 ) ( not ( = ?auto_99730 ?auto_99737 ) ) ( OBJ-AT ?auto_99732 ?auto_99737 ) ( IN-CITY ?auto_99739 ?auto_99738 ) ( not ( = ?auto_99730 ?auto_99739 ) ) ( not ( = ?auto_99737 ?auto_99739 ) ) ( OBJ-AT ?auto_99733 ?auto_99739 ) ( not ( = ?auto_99736 ?auto_99731 ) ) ( not ( = ?auto_99732 ?auto_99736 ) ) ( not ( = ?auto_99733 ?auto_99736 ) ) ( OBJ-AT ?auto_99736 ?auto_99737 ) ( IN-TRUCK ?auto_99731 ?auto_99735 ) ( TRUCK-AT ?auto_99735 ?auto_99734 ) ( IN-CITY ?auto_99734 ?auto_99738 ) ( not ( = ?auto_99730 ?auto_99734 ) ) ( not ( = ?auto_99737 ?auto_99734 ) ) ( not ( = ?auto_99739 ?auto_99734 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99731 ?auto_99732 ?auto_99730 )
      ( DELIVER-3PKG-VERIFY ?auto_99731 ?auto_99732 ?auto_99733 ?auto_99730 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99752 - OBJ
      ?auto_99753 - OBJ
      ?auto_99754 - OBJ
      ?auto_99751 - LOCATION
    )
    :vars
    (
      ?auto_99757 - LOCATION
      ?auto_99758 - CITY
      ?auto_99759 - OBJ
      ?auto_99760 - LOCATION
      ?auto_99756 - TRUCK
      ?auto_99755 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99753 ?auto_99752 ) ) ( not ( = ?auto_99754 ?auto_99752 ) ) ( not ( = ?auto_99754 ?auto_99753 ) ) ( IN-CITY ?auto_99757 ?auto_99758 ) ( IN-CITY ?auto_99751 ?auto_99758 ) ( not ( = ?auto_99751 ?auto_99757 ) ) ( OBJ-AT ?auto_99754 ?auto_99757 ) ( not ( = ?auto_99759 ?auto_99753 ) ) ( not ( = ?auto_99754 ?auto_99759 ) ) ( IN-CITY ?auto_99760 ?auto_99758 ) ( not ( = ?auto_99751 ?auto_99760 ) ) ( not ( = ?auto_99757 ?auto_99760 ) ) ( OBJ-AT ?auto_99759 ?auto_99760 ) ( not ( = ?auto_99759 ?auto_99752 ) ) ( OBJ-AT ?auto_99752 ?auto_99757 ) ( IN-TRUCK ?auto_99753 ?auto_99756 ) ( TRUCK-AT ?auto_99756 ?auto_99755 ) ( IN-CITY ?auto_99755 ?auto_99758 ) ( not ( = ?auto_99751 ?auto_99755 ) ) ( not ( = ?auto_99757 ?auto_99755 ) ) ( not ( = ?auto_99760 ?auto_99755 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99753 ?auto_99754 ?auto_99751 )
      ( DELIVER-3PKG-VERIFY ?auto_99752 ?auto_99753 ?auto_99754 ?auto_99751 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99773 - OBJ
      ?auto_99774 - OBJ
      ?auto_99775 - OBJ
      ?auto_99772 - LOCATION
    )
    :vars
    (
      ?auto_99781 - OBJ
      ?auto_99778 - LOCATION
      ?auto_99779 - CITY
      ?auto_99780 - LOCATION
      ?auto_99777 - TRUCK
      ?auto_99776 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99774 ?auto_99773 ) ) ( not ( = ?auto_99775 ?auto_99773 ) ) ( not ( = ?auto_99775 ?auto_99774 ) ) ( not ( = ?auto_99775 ?auto_99781 ) ) ( IN-CITY ?auto_99778 ?auto_99779 ) ( IN-CITY ?auto_99772 ?auto_99779 ) ( not ( = ?auto_99772 ?auto_99778 ) ) ( OBJ-AT ?auto_99775 ?auto_99778 ) ( not ( = ?auto_99774 ?auto_99781 ) ) ( IN-CITY ?auto_99780 ?auto_99779 ) ( not ( = ?auto_99772 ?auto_99780 ) ) ( not ( = ?auto_99778 ?auto_99780 ) ) ( OBJ-AT ?auto_99774 ?auto_99780 ) ( not ( = ?auto_99773 ?auto_99781 ) ) ( OBJ-AT ?auto_99773 ?auto_99778 ) ( IN-TRUCK ?auto_99781 ?auto_99777 ) ( TRUCK-AT ?auto_99777 ?auto_99776 ) ( IN-CITY ?auto_99776 ?auto_99779 ) ( not ( = ?auto_99772 ?auto_99776 ) ) ( not ( = ?auto_99778 ?auto_99776 ) ) ( not ( = ?auto_99780 ?auto_99776 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99781 ?auto_99775 ?auto_99772 )
      ( DELIVER-3PKG-VERIFY ?auto_99773 ?auto_99774 ?auto_99775 ?auto_99772 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99783 - OBJ
      ?auto_99784 - OBJ
      ?auto_99785 - OBJ
      ?auto_99782 - LOCATION
    )
    :vars
    (
      ?auto_99788 - LOCATION
      ?auto_99789 - CITY
      ?auto_99790 - OBJ
      ?auto_99791 - LOCATION
      ?auto_99787 - TRUCK
      ?auto_99786 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99784 ?auto_99783 ) ) ( not ( = ?auto_99785 ?auto_99783 ) ) ( not ( = ?auto_99785 ?auto_99784 ) ) ( IN-CITY ?auto_99788 ?auto_99789 ) ( IN-CITY ?auto_99782 ?auto_99789 ) ( not ( = ?auto_99782 ?auto_99788 ) ) ( OBJ-AT ?auto_99784 ?auto_99788 ) ( not ( = ?auto_99790 ?auto_99785 ) ) ( not ( = ?auto_99784 ?auto_99790 ) ) ( IN-CITY ?auto_99791 ?auto_99789 ) ( not ( = ?auto_99782 ?auto_99791 ) ) ( not ( = ?auto_99788 ?auto_99791 ) ) ( OBJ-AT ?auto_99790 ?auto_99791 ) ( not ( = ?auto_99790 ?auto_99783 ) ) ( OBJ-AT ?auto_99783 ?auto_99788 ) ( IN-TRUCK ?auto_99785 ?auto_99787 ) ( TRUCK-AT ?auto_99787 ?auto_99786 ) ( IN-CITY ?auto_99786 ?auto_99789 ) ( not ( = ?auto_99782 ?auto_99786 ) ) ( not ( = ?auto_99788 ?auto_99786 ) ) ( not ( = ?auto_99791 ?auto_99786 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99785 ?auto_99784 ?auto_99782 )
      ( DELIVER-3PKG-VERIFY ?auto_99783 ?auto_99784 ?auto_99785 ?auto_99782 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99804 - OBJ
      ?auto_99805 - OBJ
      ?auto_99806 - OBJ
      ?auto_99803 - LOCATION
    )
    :vars
    (
      ?auto_99812 - OBJ
      ?auto_99809 - LOCATION
      ?auto_99810 - CITY
      ?auto_99811 - LOCATION
      ?auto_99808 - TRUCK
      ?auto_99807 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99805 ?auto_99804 ) ) ( not ( = ?auto_99806 ?auto_99804 ) ) ( not ( = ?auto_99806 ?auto_99805 ) ) ( not ( = ?auto_99805 ?auto_99812 ) ) ( IN-CITY ?auto_99809 ?auto_99810 ) ( IN-CITY ?auto_99803 ?auto_99810 ) ( not ( = ?auto_99803 ?auto_99809 ) ) ( OBJ-AT ?auto_99805 ?auto_99809 ) ( not ( = ?auto_99806 ?auto_99812 ) ) ( IN-CITY ?auto_99811 ?auto_99810 ) ( not ( = ?auto_99803 ?auto_99811 ) ) ( not ( = ?auto_99809 ?auto_99811 ) ) ( OBJ-AT ?auto_99806 ?auto_99811 ) ( not ( = ?auto_99804 ?auto_99812 ) ) ( OBJ-AT ?auto_99804 ?auto_99809 ) ( IN-TRUCK ?auto_99812 ?auto_99808 ) ( TRUCK-AT ?auto_99808 ?auto_99807 ) ( IN-CITY ?auto_99807 ?auto_99810 ) ( not ( = ?auto_99803 ?auto_99807 ) ) ( not ( = ?auto_99809 ?auto_99807 ) ) ( not ( = ?auto_99811 ?auto_99807 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99812 ?auto_99805 ?auto_99803 )
      ( DELIVER-3PKG-VERIFY ?auto_99804 ?auto_99805 ?auto_99806 ?auto_99803 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99825 - OBJ
      ?auto_99826 - OBJ
      ?auto_99827 - OBJ
      ?auto_99824 - LOCATION
    )
    :vars
    (
      ?auto_99831 - LOCATION
      ?auto_99832 - CITY
      ?auto_99833 - LOCATION
      ?auto_99830 - OBJ
      ?auto_99829 - TRUCK
      ?auto_99828 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99826 ?auto_99825 ) ) ( not ( = ?auto_99827 ?auto_99825 ) ) ( not ( = ?auto_99827 ?auto_99826 ) ) ( IN-CITY ?auto_99831 ?auto_99832 ) ( IN-CITY ?auto_99824 ?auto_99832 ) ( not ( = ?auto_99824 ?auto_99831 ) ) ( OBJ-AT ?auto_99827 ?auto_99831 ) ( IN-CITY ?auto_99833 ?auto_99832 ) ( not ( = ?auto_99824 ?auto_99833 ) ) ( not ( = ?auto_99831 ?auto_99833 ) ) ( OBJ-AT ?auto_99825 ?auto_99833 ) ( not ( = ?auto_99830 ?auto_99826 ) ) ( not ( = ?auto_99827 ?auto_99830 ) ) ( not ( = ?auto_99825 ?auto_99830 ) ) ( OBJ-AT ?auto_99830 ?auto_99831 ) ( IN-TRUCK ?auto_99826 ?auto_99829 ) ( TRUCK-AT ?auto_99829 ?auto_99828 ) ( IN-CITY ?auto_99828 ?auto_99832 ) ( not ( = ?auto_99824 ?auto_99828 ) ) ( not ( = ?auto_99831 ?auto_99828 ) ) ( not ( = ?auto_99833 ?auto_99828 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99826 ?auto_99827 ?auto_99824 )
      ( DELIVER-3PKG-VERIFY ?auto_99825 ?auto_99826 ?auto_99827 ?auto_99824 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99835 - OBJ
      ?auto_99836 - OBJ
      ?auto_99837 - OBJ
      ?auto_99834 - LOCATION
    )
    :vars
    (
      ?auto_99843 - OBJ
      ?auto_99840 - LOCATION
      ?auto_99841 - CITY
      ?auto_99842 - LOCATION
      ?auto_99839 - TRUCK
      ?auto_99838 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99836 ?auto_99835 ) ) ( not ( = ?auto_99837 ?auto_99835 ) ) ( not ( = ?auto_99837 ?auto_99836 ) ) ( not ( = ?auto_99837 ?auto_99843 ) ) ( IN-CITY ?auto_99840 ?auto_99841 ) ( IN-CITY ?auto_99834 ?auto_99841 ) ( not ( = ?auto_99834 ?auto_99840 ) ) ( OBJ-AT ?auto_99837 ?auto_99840 ) ( not ( = ?auto_99835 ?auto_99843 ) ) ( IN-CITY ?auto_99842 ?auto_99841 ) ( not ( = ?auto_99834 ?auto_99842 ) ) ( not ( = ?auto_99840 ?auto_99842 ) ) ( OBJ-AT ?auto_99835 ?auto_99842 ) ( not ( = ?auto_99836 ?auto_99843 ) ) ( OBJ-AT ?auto_99836 ?auto_99840 ) ( IN-TRUCK ?auto_99843 ?auto_99839 ) ( TRUCK-AT ?auto_99839 ?auto_99838 ) ( IN-CITY ?auto_99838 ?auto_99841 ) ( not ( = ?auto_99834 ?auto_99838 ) ) ( not ( = ?auto_99840 ?auto_99838 ) ) ( not ( = ?auto_99842 ?auto_99838 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99843 ?auto_99837 ?auto_99834 )
      ( DELIVER-3PKG-VERIFY ?auto_99835 ?auto_99836 ?auto_99837 ?auto_99834 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99856 - OBJ
      ?auto_99857 - OBJ
      ?auto_99858 - OBJ
      ?auto_99855 - LOCATION
    )
    :vars
    (
      ?auto_99862 - LOCATION
      ?auto_99863 - CITY
      ?auto_99864 - LOCATION
      ?auto_99861 - OBJ
      ?auto_99860 - TRUCK
      ?auto_99859 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99857 ?auto_99856 ) ) ( not ( = ?auto_99858 ?auto_99856 ) ) ( not ( = ?auto_99858 ?auto_99857 ) ) ( IN-CITY ?auto_99862 ?auto_99863 ) ( IN-CITY ?auto_99855 ?auto_99863 ) ( not ( = ?auto_99855 ?auto_99862 ) ) ( OBJ-AT ?auto_99857 ?auto_99862 ) ( IN-CITY ?auto_99864 ?auto_99863 ) ( not ( = ?auto_99855 ?auto_99864 ) ) ( not ( = ?auto_99862 ?auto_99864 ) ) ( OBJ-AT ?auto_99856 ?auto_99864 ) ( not ( = ?auto_99861 ?auto_99858 ) ) ( not ( = ?auto_99857 ?auto_99861 ) ) ( not ( = ?auto_99856 ?auto_99861 ) ) ( OBJ-AT ?auto_99861 ?auto_99862 ) ( IN-TRUCK ?auto_99858 ?auto_99860 ) ( TRUCK-AT ?auto_99860 ?auto_99859 ) ( IN-CITY ?auto_99859 ?auto_99863 ) ( not ( = ?auto_99855 ?auto_99859 ) ) ( not ( = ?auto_99862 ?auto_99859 ) ) ( not ( = ?auto_99864 ?auto_99859 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99858 ?auto_99857 ?auto_99855 )
      ( DELIVER-3PKG-VERIFY ?auto_99856 ?auto_99857 ?auto_99858 ?auto_99855 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99866 - OBJ
      ?auto_99867 - OBJ
      ?auto_99868 - OBJ
      ?auto_99865 - LOCATION
    )
    :vars
    (
      ?auto_99874 - OBJ
      ?auto_99871 - LOCATION
      ?auto_99872 - CITY
      ?auto_99873 - LOCATION
      ?auto_99870 - TRUCK
      ?auto_99869 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99867 ?auto_99866 ) ) ( not ( = ?auto_99868 ?auto_99866 ) ) ( not ( = ?auto_99868 ?auto_99867 ) ) ( not ( = ?auto_99867 ?auto_99874 ) ) ( IN-CITY ?auto_99871 ?auto_99872 ) ( IN-CITY ?auto_99865 ?auto_99872 ) ( not ( = ?auto_99865 ?auto_99871 ) ) ( OBJ-AT ?auto_99867 ?auto_99871 ) ( not ( = ?auto_99866 ?auto_99874 ) ) ( IN-CITY ?auto_99873 ?auto_99872 ) ( not ( = ?auto_99865 ?auto_99873 ) ) ( not ( = ?auto_99871 ?auto_99873 ) ) ( OBJ-AT ?auto_99866 ?auto_99873 ) ( not ( = ?auto_99868 ?auto_99874 ) ) ( OBJ-AT ?auto_99868 ?auto_99871 ) ( IN-TRUCK ?auto_99874 ?auto_99870 ) ( TRUCK-AT ?auto_99870 ?auto_99869 ) ( IN-CITY ?auto_99869 ?auto_99872 ) ( not ( = ?auto_99865 ?auto_99869 ) ) ( not ( = ?auto_99871 ?auto_99869 ) ) ( not ( = ?auto_99873 ?auto_99869 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99874 ?auto_99867 ?auto_99865 )
      ( DELIVER-3PKG-VERIFY ?auto_99866 ?auto_99867 ?auto_99868 ?auto_99865 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99909 - OBJ
      ?auto_99910 - OBJ
      ?auto_99911 - OBJ
      ?auto_99908 - LOCATION
    )
    :vars
    (
      ?auto_99914 - LOCATION
      ?auto_99915 - CITY
      ?auto_99916 - OBJ
      ?auto_99917 - LOCATION
      ?auto_99913 - TRUCK
      ?auto_99912 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99910 ?auto_99909 ) ) ( not ( = ?auto_99911 ?auto_99909 ) ) ( not ( = ?auto_99911 ?auto_99910 ) ) ( IN-CITY ?auto_99914 ?auto_99915 ) ( IN-CITY ?auto_99908 ?auto_99915 ) ( not ( = ?auto_99908 ?auto_99914 ) ) ( OBJ-AT ?auto_99909 ?auto_99914 ) ( not ( = ?auto_99916 ?auto_99910 ) ) ( not ( = ?auto_99909 ?auto_99916 ) ) ( IN-CITY ?auto_99917 ?auto_99915 ) ( not ( = ?auto_99908 ?auto_99917 ) ) ( not ( = ?auto_99914 ?auto_99917 ) ) ( OBJ-AT ?auto_99916 ?auto_99917 ) ( not ( = ?auto_99916 ?auto_99911 ) ) ( OBJ-AT ?auto_99911 ?auto_99914 ) ( IN-TRUCK ?auto_99910 ?auto_99913 ) ( TRUCK-AT ?auto_99913 ?auto_99912 ) ( IN-CITY ?auto_99912 ?auto_99915 ) ( not ( = ?auto_99908 ?auto_99912 ) ) ( not ( = ?auto_99914 ?auto_99912 ) ) ( not ( = ?auto_99917 ?auto_99912 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99910 ?auto_99909 ?auto_99908 )
      ( DELIVER-3PKG-VERIFY ?auto_99909 ?auto_99910 ?auto_99911 ?auto_99908 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99919 - OBJ
      ?auto_99920 - OBJ
      ?auto_99921 - OBJ
      ?auto_99918 - LOCATION
    )
    :vars
    (
      ?auto_99925 - LOCATION
      ?auto_99926 - CITY
      ?auto_99927 - LOCATION
      ?auto_99924 - OBJ
      ?auto_99923 - TRUCK
      ?auto_99922 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99920 ?auto_99919 ) ) ( not ( = ?auto_99921 ?auto_99919 ) ) ( not ( = ?auto_99921 ?auto_99920 ) ) ( IN-CITY ?auto_99925 ?auto_99926 ) ( IN-CITY ?auto_99918 ?auto_99926 ) ( not ( = ?auto_99918 ?auto_99925 ) ) ( OBJ-AT ?auto_99919 ?auto_99925 ) ( IN-CITY ?auto_99927 ?auto_99926 ) ( not ( = ?auto_99918 ?auto_99927 ) ) ( not ( = ?auto_99925 ?auto_99927 ) ) ( OBJ-AT ?auto_99921 ?auto_99927 ) ( not ( = ?auto_99924 ?auto_99920 ) ) ( not ( = ?auto_99919 ?auto_99924 ) ) ( not ( = ?auto_99921 ?auto_99924 ) ) ( OBJ-AT ?auto_99924 ?auto_99925 ) ( IN-TRUCK ?auto_99920 ?auto_99923 ) ( TRUCK-AT ?auto_99923 ?auto_99922 ) ( IN-CITY ?auto_99922 ?auto_99926 ) ( not ( = ?auto_99918 ?auto_99922 ) ) ( not ( = ?auto_99925 ?auto_99922 ) ) ( not ( = ?auto_99927 ?auto_99922 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99920 ?auto_99919 ?auto_99918 )
      ( DELIVER-3PKG-VERIFY ?auto_99919 ?auto_99920 ?auto_99921 ?auto_99918 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99940 - OBJ
      ?auto_99941 - OBJ
      ?auto_99942 - OBJ
      ?auto_99939 - LOCATION
    )
    :vars
    (
      ?auto_99945 - LOCATION
      ?auto_99946 - CITY
      ?auto_99947 - OBJ
      ?auto_99948 - LOCATION
      ?auto_99944 - TRUCK
      ?auto_99943 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99941 ?auto_99940 ) ) ( not ( = ?auto_99942 ?auto_99940 ) ) ( not ( = ?auto_99942 ?auto_99941 ) ) ( IN-CITY ?auto_99945 ?auto_99946 ) ( IN-CITY ?auto_99939 ?auto_99946 ) ( not ( = ?auto_99939 ?auto_99945 ) ) ( OBJ-AT ?auto_99940 ?auto_99945 ) ( not ( = ?auto_99947 ?auto_99942 ) ) ( not ( = ?auto_99940 ?auto_99947 ) ) ( IN-CITY ?auto_99948 ?auto_99946 ) ( not ( = ?auto_99939 ?auto_99948 ) ) ( not ( = ?auto_99945 ?auto_99948 ) ) ( OBJ-AT ?auto_99947 ?auto_99948 ) ( not ( = ?auto_99947 ?auto_99941 ) ) ( OBJ-AT ?auto_99941 ?auto_99945 ) ( IN-TRUCK ?auto_99942 ?auto_99944 ) ( TRUCK-AT ?auto_99944 ?auto_99943 ) ( IN-CITY ?auto_99943 ?auto_99946 ) ( not ( = ?auto_99939 ?auto_99943 ) ) ( not ( = ?auto_99945 ?auto_99943 ) ) ( not ( = ?auto_99948 ?auto_99943 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99942 ?auto_99940 ?auto_99939 )
      ( DELIVER-3PKG-VERIFY ?auto_99940 ?auto_99941 ?auto_99942 ?auto_99939 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99961 - OBJ
      ?auto_99962 - OBJ
      ?auto_99963 - OBJ
      ?auto_99960 - LOCATION
    )
    :vars
    (
      ?auto_99969 - OBJ
      ?auto_99966 - LOCATION
      ?auto_99967 - CITY
      ?auto_99968 - LOCATION
      ?auto_99965 - TRUCK
      ?auto_99964 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99962 ?auto_99961 ) ) ( not ( = ?auto_99963 ?auto_99961 ) ) ( not ( = ?auto_99963 ?auto_99962 ) ) ( not ( = ?auto_99961 ?auto_99969 ) ) ( IN-CITY ?auto_99966 ?auto_99967 ) ( IN-CITY ?auto_99960 ?auto_99967 ) ( not ( = ?auto_99960 ?auto_99966 ) ) ( OBJ-AT ?auto_99961 ?auto_99966 ) ( not ( = ?auto_99963 ?auto_99969 ) ) ( IN-CITY ?auto_99968 ?auto_99967 ) ( not ( = ?auto_99960 ?auto_99968 ) ) ( not ( = ?auto_99966 ?auto_99968 ) ) ( OBJ-AT ?auto_99963 ?auto_99968 ) ( not ( = ?auto_99962 ?auto_99969 ) ) ( OBJ-AT ?auto_99962 ?auto_99966 ) ( IN-TRUCK ?auto_99969 ?auto_99965 ) ( TRUCK-AT ?auto_99965 ?auto_99964 ) ( IN-CITY ?auto_99964 ?auto_99967 ) ( not ( = ?auto_99960 ?auto_99964 ) ) ( not ( = ?auto_99966 ?auto_99964 ) ) ( not ( = ?auto_99968 ?auto_99964 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99969 ?auto_99961 ?auto_99960 )
      ( DELIVER-3PKG-VERIFY ?auto_99961 ?auto_99962 ?auto_99963 ?auto_99960 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99982 - OBJ
      ?auto_99983 - OBJ
      ?auto_99984 - OBJ
      ?auto_99981 - LOCATION
    )
    :vars
    (
      ?auto_99988 - LOCATION
      ?auto_99989 - CITY
      ?auto_99990 - LOCATION
      ?auto_99987 - OBJ
      ?auto_99986 - TRUCK
      ?auto_99985 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99983 ?auto_99982 ) ) ( not ( = ?auto_99984 ?auto_99982 ) ) ( not ( = ?auto_99984 ?auto_99983 ) ) ( IN-CITY ?auto_99988 ?auto_99989 ) ( IN-CITY ?auto_99981 ?auto_99989 ) ( not ( = ?auto_99981 ?auto_99988 ) ) ( OBJ-AT ?auto_99982 ?auto_99988 ) ( IN-CITY ?auto_99990 ?auto_99989 ) ( not ( = ?auto_99981 ?auto_99990 ) ) ( not ( = ?auto_99988 ?auto_99990 ) ) ( OBJ-AT ?auto_99983 ?auto_99990 ) ( not ( = ?auto_99987 ?auto_99984 ) ) ( not ( = ?auto_99982 ?auto_99987 ) ) ( not ( = ?auto_99983 ?auto_99987 ) ) ( OBJ-AT ?auto_99987 ?auto_99988 ) ( IN-TRUCK ?auto_99984 ?auto_99986 ) ( TRUCK-AT ?auto_99986 ?auto_99985 ) ( IN-CITY ?auto_99985 ?auto_99989 ) ( not ( = ?auto_99981 ?auto_99985 ) ) ( not ( = ?auto_99988 ?auto_99985 ) ) ( not ( = ?auto_99990 ?auto_99985 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99984 ?auto_99982 ?auto_99981 )
      ( DELIVER-3PKG-VERIFY ?auto_99982 ?auto_99983 ?auto_99984 ?auto_99981 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99992 - OBJ
      ?auto_99993 - OBJ
      ?auto_99994 - OBJ
      ?auto_99991 - LOCATION
    )
    :vars
    (
      ?auto_100000 - OBJ
      ?auto_99997 - LOCATION
      ?auto_99998 - CITY
      ?auto_99999 - LOCATION
      ?auto_99996 - TRUCK
      ?auto_99995 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_99993 ?auto_99992 ) ) ( not ( = ?auto_99994 ?auto_99992 ) ) ( not ( = ?auto_99994 ?auto_99993 ) ) ( not ( = ?auto_99992 ?auto_100000 ) ) ( IN-CITY ?auto_99997 ?auto_99998 ) ( IN-CITY ?auto_99991 ?auto_99998 ) ( not ( = ?auto_99991 ?auto_99997 ) ) ( OBJ-AT ?auto_99992 ?auto_99997 ) ( not ( = ?auto_99993 ?auto_100000 ) ) ( IN-CITY ?auto_99999 ?auto_99998 ) ( not ( = ?auto_99991 ?auto_99999 ) ) ( not ( = ?auto_99997 ?auto_99999 ) ) ( OBJ-AT ?auto_99993 ?auto_99999 ) ( not ( = ?auto_99994 ?auto_100000 ) ) ( OBJ-AT ?auto_99994 ?auto_99997 ) ( IN-TRUCK ?auto_100000 ?auto_99996 ) ( TRUCK-AT ?auto_99996 ?auto_99995 ) ( IN-CITY ?auto_99995 ?auto_99998 ) ( not ( = ?auto_99991 ?auto_99995 ) ) ( not ( = ?auto_99997 ?auto_99995 ) ) ( not ( = ?auto_99999 ?auto_99995 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100000 ?auto_99992 ?auto_99991 )
      ( DELIVER-3PKG-VERIFY ?auto_99992 ?auto_99993 ?auto_99994 ?auto_99991 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100171 - OBJ
      ?auto_100172 - OBJ
      ?auto_100173 - OBJ
      ?auto_100174 - OBJ
      ?auto_100170 - LOCATION
    )
    :vars
    (
      ?auto_100177 - LOCATION
      ?auto_100178 - CITY
      ?auto_100179 - LOCATION
      ?auto_100176 - TRUCK
      ?auto_100175 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_100172 ?auto_100171 ) ) ( not ( = ?auto_100173 ?auto_100171 ) ) ( not ( = ?auto_100173 ?auto_100172 ) ) ( not ( = ?auto_100174 ?auto_100171 ) ) ( not ( = ?auto_100174 ?auto_100172 ) ) ( not ( = ?auto_100174 ?auto_100173 ) ) ( IN-CITY ?auto_100177 ?auto_100178 ) ( IN-CITY ?auto_100170 ?auto_100178 ) ( not ( = ?auto_100170 ?auto_100177 ) ) ( OBJ-AT ?auto_100174 ?auto_100177 ) ( IN-CITY ?auto_100179 ?auto_100178 ) ( not ( = ?auto_100170 ?auto_100179 ) ) ( not ( = ?auto_100177 ?auto_100179 ) ) ( OBJ-AT ?auto_100173 ?auto_100179 ) ( OBJ-AT ?auto_100172 ?auto_100177 ) ( IN-TRUCK ?auto_100171 ?auto_100176 ) ( TRUCK-AT ?auto_100176 ?auto_100175 ) ( IN-CITY ?auto_100175 ?auto_100178 ) ( not ( = ?auto_100170 ?auto_100175 ) ) ( not ( = ?auto_100177 ?auto_100175 ) ) ( not ( = ?auto_100179 ?auto_100175 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100171 ?auto_100174 ?auto_100170 )
      ( DELIVER-4PKG-VERIFY ?auto_100171 ?auto_100172 ?auto_100173 ?auto_100174 ?auto_100170 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100203 - OBJ
      ?auto_100204 - OBJ
      ?auto_100205 - OBJ
      ?auto_100206 - OBJ
      ?auto_100202 - LOCATION
    )
    :vars
    (
      ?auto_100209 - LOCATION
      ?auto_100210 - CITY
      ?auto_100211 - LOCATION
      ?auto_100208 - TRUCK
      ?auto_100207 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_100204 ?auto_100203 ) ) ( not ( = ?auto_100205 ?auto_100203 ) ) ( not ( = ?auto_100205 ?auto_100204 ) ) ( not ( = ?auto_100206 ?auto_100203 ) ) ( not ( = ?auto_100206 ?auto_100204 ) ) ( not ( = ?auto_100206 ?auto_100205 ) ) ( IN-CITY ?auto_100209 ?auto_100210 ) ( IN-CITY ?auto_100202 ?auto_100210 ) ( not ( = ?auto_100202 ?auto_100209 ) ) ( OBJ-AT ?auto_100205 ?auto_100209 ) ( IN-CITY ?auto_100211 ?auto_100210 ) ( not ( = ?auto_100202 ?auto_100211 ) ) ( not ( = ?auto_100209 ?auto_100211 ) ) ( OBJ-AT ?auto_100206 ?auto_100211 ) ( OBJ-AT ?auto_100204 ?auto_100209 ) ( IN-TRUCK ?auto_100203 ?auto_100208 ) ( TRUCK-AT ?auto_100208 ?auto_100207 ) ( IN-CITY ?auto_100207 ?auto_100210 ) ( not ( = ?auto_100202 ?auto_100207 ) ) ( not ( = ?auto_100209 ?auto_100207 ) ) ( not ( = ?auto_100211 ?auto_100207 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100203 ?auto_100205 ?auto_100202 )
      ( DELIVER-4PKG-VERIFY ?auto_100203 ?auto_100204 ?auto_100205 ?auto_100206 ?auto_100202 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100235 - OBJ
      ?auto_100236 - OBJ
      ?auto_100237 - OBJ
      ?auto_100238 - OBJ
      ?auto_100234 - LOCATION
    )
    :vars
    (
      ?auto_100241 - LOCATION
      ?auto_100242 - CITY
      ?auto_100243 - LOCATION
      ?auto_100240 - TRUCK
      ?auto_100239 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_100236 ?auto_100235 ) ) ( not ( = ?auto_100237 ?auto_100235 ) ) ( not ( = ?auto_100237 ?auto_100236 ) ) ( not ( = ?auto_100238 ?auto_100235 ) ) ( not ( = ?auto_100238 ?auto_100236 ) ) ( not ( = ?auto_100238 ?auto_100237 ) ) ( IN-CITY ?auto_100241 ?auto_100242 ) ( IN-CITY ?auto_100234 ?auto_100242 ) ( not ( = ?auto_100234 ?auto_100241 ) ) ( OBJ-AT ?auto_100238 ?auto_100241 ) ( IN-CITY ?auto_100243 ?auto_100242 ) ( not ( = ?auto_100234 ?auto_100243 ) ) ( not ( = ?auto_100241 ?auto_100243 ) ) ( OBJ-AT ?auto_100236 ?auto_100243 ) ( OBJ-AT ?auto_100237 ?auto_100241 ) ( IN-TRUCK ?auto_100235 ?auto_100240 ) ( TRUCK-AT ?auto_100240 ?auto_100239 ) ( IN-CITY ?auto_100239 ?auto_100242 ) ( not ( = ?auto_100234 ?auto_100239 ) ) ( not ( = ?auto_100241 ?auto_100239 ) ) ( not ( = ?auto_100243 ?auto_100239 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100235 ?auto_100238 ?auto_100234 )
      ( DELIVER-4PKG-VERIFY ?auto_100235 ?auto_100236 ?auto_100237 ?auto_100238 ?auto_100234 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100267 - OBJ
      ?auto_100268 - OBJ
      ?auto_100269 - OBJ
      ?auto_100270 - OBJ
      ?auto_100266 - LOCATION
    )
    :vars
    (
      ?auto_100273 - LOCATION
      ?auto_100274 - CITY
      ?auto_100275 - LOCATION
      ?auto_100272 - TRUCK
      ?auto_100271 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_100268 ?auto_100267 ) ) ( not ( = ?auto_100269 ?auto_100267 ) ) ( not ( = ?auto_100269 ?auto_100268 ) ) ( not ( = ?auto_100270 ?auto_100267 ) ) ( not ( = ?auto_100270 ?auto_100268 ) ) ( not ( = ?auto_100270 ?auto_100269 ) ) ( IN-CITY ?auto_100273 ?auto_100274 ) ( IN-CITY ?auto_100266 ?auto_100274 ) ( not ( = ?auto_100266 ?auto_100273 ) ) ( OBJ-AT ?auto_100269 ?auto_100273 ) ( IN-CITY ?auto_100275 ?auto_100274 ) ( not ( = ?auto_100266 ?auto_100275 ) ) ( not ( = ?auto_100273 ?auto_100275 ) ) ( OBJ-AT ?auto_100268 ?auto_100275 ) ( OBJ-AT ?auto_100270 ?auto_100273 ) ( IN-TRUCK ?auto_100267 ?auto_100272 ) ( TRUCK-AT ?auto_100272 ?auto_100271 ) ( IN-CITY ?auto_100271 ?auto_100274 ) ( not ( = ?auto_100266 ?auto_100271 ) ) ( not ( = ?auto_100273 ?auto_100271 ) ) ( not ( = ?auto_100275 ?auto_100271 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100267 ?auto_100269 ?auto_100266 )
      ( DELIVER-4PKG-VERIFY ?auto_100267 ?auto_100268 ?auto_100269 ?auto_100270 ?auto_100266 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100367 - OBJ
      ?auto_100368 - OBJ
      ?auto_100369 - OBJ
      ?auto_100370 - OBJ
      ?auto_100366 - LOCATION
    )
    :vars
    (
      ?auto_100373 - LOCATION
      ?auto_100374 - CITY
      ?auto_100375 - LOCATION
      ?auto_100372 - TRUCK
      ?auto_100371 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_100368 ?auto_100367 ) ) ( not ( = ?auto_100369 ?auto_100367 ) ) ( not ( = ?auto_100369 ?auto_100368 ) ) ( not ( = ?auto_100370 ?auto_100367 ) ) ( not ( = ?auto_100370 ?auto_100368 ) ) ( not ( = ?auto_100370 ?auto_100369 ) ) ( IN-CITY ?auto_100373 ?auto_100374 ) ( IN-CITY ?auto_100366 ?auto_100374 ) ( not ( = ?auto_100366 ?auto_100373 ) ) ( OBJ-AT ?auto_100368 ?auto_100373 ) ( IN-CITY ?auto_100375 ?auto_100374 ) ( not ( = ?auto_100366 ?auto_100375 ) ) ( not ( = ?auto_100373 ?auto_100375 ) ) ( OBJ-AT ?auto_100370 ?auto_100375 ) ( OBJ-AT ?auto_100369 ?auto_100373 ) ( IN-TRUCK ?auto_100367 ?auto_100372 ) ( TRUCK-AT ?auto_100372 ?auto_100371 ) ( IN-CITY ?auto_100371 ?auto_100374 ) ( not ( = ?auto_100366 ?auto_100371 ) ) ( not ( = ?auto_100373 ?auto_100371 ) ) ( not ( = ?auto_100375 ?auto_100371 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100367 ?auto_100368 ?auto_100366 )
      ( DELIVER-4PKG-VERIFY ?auto_100367 ?auto_100368 ?auto_100369 ?auto_100370 ?auto_100366 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100399 - OBJ
      ?auto_100400 - OBJ
      ?auto_100401 - OBJ
      ?auto_100402 - OBJ
      ?auto_100398 - LOCATION
    )
    :vars
    (
      ?auto_100405 - LOCATION
      ?auto_100406 - CITY
      ?auto_100407 - LOCATION
      ?auto_100404 - TRUCK
      ?auto_100403 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_100400 ?auto_100399 ) ) ( not ( = ?auto_100401 ?auto_100399 ) ) ( not ( = ?auto_100401 ?auto_100400 ) ) ( not ( = ?auto_100402 ?auto_100399 ) ) ( not ( = ?auto_100402 ?auto_100400 ) ) ( not ( = ?auto_100402 ?auto_100401 ) ) ( IN-CITY ?auto_100405 ?auto_100406 ) ( IN-CITY ?auto_100398 ?auto_100406 ) ( not ( = ?auto_100398 ?auto_100405 ) ) ( OBJ-AT ?auto_100400 ?auto_100405 ) ( IN-CITY ?auto_100407 ?auto_100406 ) ( not ( = ?auto_100398 ?auto_100407 ) ) ( not ( = ?auto_100405 ?auto_100407 ) ) ( OBJ-AT ?auto_100401 ?auto_100407 ) ( OBJ-AT ?auto_100402 ?auto_100405 ) ( IN-TRUCK ?auto_100399 ?auto_100404 ) ( TRUCK-AT ?auto_100404 ?auto_100403 ) ( IN-CITY ?auto_100403 ?auto_100406 ) ( not ( = ?auto_100398 ?auto_100403 ) ) ( not ( = ?auto_100405 ?auto_100403 ) ) ( not ( = ?auto_100407 ?auto_100403 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100399 ?auto_100400 ?auto_100398 )
      ( DELIVER-4PKG-VERIFY ?auto_100399 ?auto_100400 ?auto_100401 ?auto_100402 ?auto_100398 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100499 - OBJ
      ?auto_100500 - OBJ
      ?auto_100501 - OBJ
      ?auto_100502 - OBJ
      ?auto_100498 - LOCATION
    )
    :vars
    (
      ?auto_100505 - LOCATION
      ?auto_100506 - CITY
      ?auto_100507 - LOCATION
      ?auto_100504 - TRUCK
      ?auto_100503 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_100500 ?auto_100499 ) ) ( not ( = ?auto_100501 ?auto_100499 ) ) ( not ( = ?auto_100501 ?auto_100500 ) ) ( not ( = ?auto_100502 ?auto_100499 ) ) ( not ( = ?auto_100502 ?auto_100500 ) ) ( not ( = ?auto_100502 ?auto_100501 ) ) ( IN-CITY ?auto_100505 ?auto_100506 ) ( IN-CITY ?auto_100498 ?auto_100506 ) ( not ( = ?auto_100498 ?auto_100505 ) ) ( OBJ-AT ?auto_100502 ?auto_100505 ) ( IN-CITY ?auto_100507 ?auto_100506 ) ( not ( = ?auto_100498 ?auto_100507 ) ) ( not ( = ?auto_100505 ?auto_100507 ) ) ( OBJ-AT ?auto_100501 ?auto_100507 ) ( OBJ-AT ?auto_100499 ?auto_100505 ) ( IN-TRUCK ?auto_100500 ?auto_100504 ) ( TRUCK-AT ?auto_100504 ?auto_100503 ) ( IN-CITY ?auto_100503 ?auto_100506 ) ( not ( = ?auto_100498 ?auto_100503 ) ) ( not ( = ?auto_100505 ?auto_100503 ) ) ( not ( = ?auto_100507 ?auto_100503 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100500 ?auto_100502 ?auto_100498 )
      ( DELIVER-4PKG-VERIFY ?auto_100499 ?auto_100500 ?auto_100501 ?auto_100502 ?auto_100498 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100531 - OBJ
      ?auto_100532 - OBJ
      ?auto_100533 - OBJ
      ?auto_100534 - OBJ
      ?auto_100530 - LOCATION
    )
    :vars
    (
      ?auto_100537 - LOCATION
      ?auto_100538 - CITY
      ?auto_100539 - LOCATION
      ?auto_100536 - TRUCK
      ?auto_100535 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_100532 ?auto_100531 ) ) ( not ( = ?auto_100533 ?auto_100531 ) ) ( not ( = ?auto_100533 ?auto_100532 ) ) ( not ( = ?auto_100534 ?auto_100531 ) ) ( not ( = ?auto_100534 ?auto_100532 ) ) ( not ( = ?auto_100534 ?auto_100533 ) ) ( IN-CITY ?auto_100537 ?auto_100538 ) ( IN-CITY ?auto_100530 ?auto_100538 ) ( not ( = ?auto_100530 ?auto_100537 ) ) ( OBJ-AT ?auto_100533 ?auto_100537 ) ( IN-CITY ?auto_100539 ?auto_100538 ) ( not ( = ?auto_100530 ?auto_100539 ) ) ( not ( = ?auto_100537 ?auto_100539 ) ) ( OBJ-AT ?auto_100534 ?auto_100539 ) ( OBJ-AT ?auto_100531 ?auto_100537 ) ( IN-TRUCK ?auto_100532 ?auto_100536 ) ( TRUCK-AT ?auto_100536 ?auto_100535 ) ( IN-CITY ?auto_100535 ?auto_100538 ) ( not ( = ?auto_100530 ?auto_100535 ) ) ( not ( = ?auto_100537 ?auto_100535 ) ) ( not ( = ?auto_100539 ?auto_100535 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100532 ?auto_100533 ?auto_100530 )
      ( DELIVER-4PKG-VERIFY ?auto_100531 ?auto_100532 ?auto_100533 ?auto_100534 ?auto_100530 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100632 - OBJ
      ?auto_100633 - OBJ
      ?auto_100634 - OBJ
      ?auto_100635 - OBJ
      ?auto_100631 - LOCATION
    )
    :vars
    (
      ?auto_100638 - LOCATION
      ?auto_100639 - CITY
      ?auto_100640 - LOCATION
      ?auto_100637 - TRUCK
      ?auto_100636 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_100633 ?auto_100632 ) ) ( not ( = ?auto_100634 ?auto_100632 ) ) ( not ( = ?auto_100634 ?auto_100633 ) ) ( not ( = ?auto_100635 ?auto_100632 ) ) ( not ( = ?auto_100635 ?auto_100633 ) ) ( not ( = ?auto_100635 ?auto_100634 ) ) ( IN-CITY ?auto_100638 ?auto_100639 ) ( IN-CITY ?auto_100631 ?auto_100639 ) ( not ( = ?auto_100631 ?auto_100638 ) ) ( OBJ-AT ?auto_100635 ?auto_100638 ) ( IN-CITY ?auto_100640 ?auto_100639 ) ( not ( = ?auto_100631 ?auto_100640 ) ) ( not ( = ?auto_100638 ?auto_100640 ) ) ( OBJ-AT ?auto_100633 ?auto_100640 ) ( OBJ-AT ?auto_100632 ?auto_100638 ) ( IN-TRUCK ?auto_100634 ?auto_100637 ) ( TRUCK-AT ?auto_100637 ?auto_100636 ) ( IN-CITY ?auto_100636 ?auto_100639 ) ( not ( = ?auto_100631 ?auto_100636 ) ) ( not ( = ?auto_100638 ?auto_100636 ) ) ( not ( = ?auto_100640 ?auto_100636 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100634 ?auto_100635 ?auto_100631 )
      ( DELIVER-4PKG-VERIFY ?auto_100632 ?auto_100633 ?auto_100634 ?auto_100635 ?auto_100631 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100664 - OBJ
      ?auto_100665 - OBJ
      ?auto_100666 - OBJ
      ?auto_100667 - OBJ
      ?auto_100663 - LOCATION
    )
    :vars
    (
      ?auto_100670 - LOCATION
      ?auto_100671 - CITY
      ?auto_100672 - LOCATION
      ?auto_100669 - TRUCK
      ?auto_100668 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_100665 ?auto_100664 ) ) ( not ( = ?auto_100666 ?auto_100664 ) ) ( not ( = ?auto_100666 ?auto_100665 ) ) ( not ( = ?auto_100667 ?auto_100664 ) ) ( not ( = ?auto_100667 ?auto_100665 ) ) ( not ( = ?auto_100667 ?auto_100666 ) ) ( IN-CITY ?auto_100670 ?auto_100671 ) ( IN-CITY ?auto_100663 ?auto_100671 ) ( not ( = ?auto_100663 ?auto_100670 ) ) ( OBJ-AT ?auto_100666 ?auto_100670 ) ( IN-CITY ?auto_100672 ?auto_100671 ) ( not ( = ?auto_100663 ?auto_100672 ) ) ( not ( = ?auto_100670 ?auto_100672 ) ) ( OBJ-AT ?auto_100665 ?auto_100672 ) ( OBJ-AT ?auto_100664 ?auto_100670 ) ( IN-TRUCK ?auto_100667 ?auto_100669 ) ( TRUCK-AT ?auto_100669 ?auto_100668 ) ( IN-CITY ?auto_100668 ?auto_100671 ) ( not ( = ?auto_100663 ?auto_100668 ) ) ( not ( = ?auto_100670 ?auto_100668 ) ) ( not ( = ?auto_100672 ?auto_100668 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100667 ?auto_100666 ?auto_100663 )
      ( DELIVER-4PKG-VERIFY ?auto_100664 ?auto_100665 ?auto_100666 ?auto_100667 ?auto_100663 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100729 - OBJ
      ?auto_100730 - OBJ
      ?auto_100731 - OBJ
      ?auto_100732 - OBJ
      ?auto_100728 - LOCATION
    )
    :vars
    (
      ?auto_100735 - LOCATION
      ?auto_100736 - CITY
      ?auto_100737 - LOCATION
      ?auto_100734 - TRUCK
      ?auto_100733 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_100730 ?auto_100729 ) ) ( not ( = ?auto_100731 ?auto_100729 ) ) ( not ( = ?auto_100731 ?auto_100730 ) ) ( not ( = ?auto_100732 ?auto_100729 ) ) ( not ( = ?auto_100732 ?auto_100730 ) ) ( not ( = ?auto_100732 ?auto_100731 ) ) ( IN-CITY ?auto_100735 ?auto_100736 ) ( IN-CITY ?auto_100728 ?auto_100736 ) ( not ( = ?auto_100728 ?auto_100735 ) ) ( OBJ-AT ?auto_100730 ?auto_100735 ) ( IN-CITY ?auto_100737 ?auto_100736 ) ( not ( = ?auto_100728 ?auto_100737 ) ) ( not ( = ?auto_100735 ?auto_100737 ) ) ( OBJ-AT ?auto_100732 ?auto_100737 ) ( OBJ-AT ?auto_100729 ?auto_100735 ) ( IN-TRUCK ?auto_100731 ?auto_100734 ) ( TRUCK-AT ?auto_100734 ?auto_100733 ) ( IN-CITY ?auto_100733 ?auto_100736 ) ( not ( = ?auto_100728 ?auto_100733 ) ) ( not ( = ?auto_100735 ?auto_100733 ) ) ( not ( = ?auto_100737 ?auto_100733 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100731 ?auto_100730 ?auto_100728 )
      ( DELIVER-4PKG-VERIFY ?auto_100729 ?auto_100730 ?auto_100731 ?auto_100732 ?auto_100728 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100796 - OBJ
      ?auto_100797 - OBJ
      ?auto_100798 - OBJ
      ?auto_100799 - OBJ
      ?auto_100795 - LOCATION
    )
    :vars
    (
      ?auto_100802 - LOCATION
      ?auto_100803 - CITY
      ?auto_100804 - LOCATION
      ?auto_100801 - TRUCK
      ?auto_100800 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_100797 ?auto_100796 ) ) ( not ( = ?auto_100798 ?auto_100796 ) ) ( not ( = ?auto_100798 ?auto_100797 ) ) ( not ( = ?auto_100799 ?auto_100796 ) ) ( not ( = ?auto_100799 ?auto_100797 ) ) ( not ( = ?auto_100799 ?auto_100798 ) ) ( IN-CITY ?auto_100802 ?auto_100803 ) ( IN-CITY ?auto_100795 ?auto_100803 ) ( not ( = ?auto_100795 ?auto_100802 ) ) ( OBJ-AT ?auto_100797 ?auto_100802 ) ( IN-CITY ?auto_100804 ?auto_100803 ) ( not ( = ?auto_100795 ?auto_100804 ) ) ( not ( = ?auto_100802 ?auto_100804 ) ) ( OBJ-AT ?auto_100798 ?auto_100804 ) ( OBJ-AT ?auto_100796 ?auto_100802 ) ( IN-TRUCK ?auto_100799 ?auto_100801 ) ( TRUCK-AT ?auto_100801 ?auto_100800 ) ( IN-CITY ?auto_100800 ?auto_100803 ) ( not ( = ?auto_100795 ?auto_100800 ) ) ( not ( = ?auto_100802 ?auto_100800 ) ) ( not ( = ?auto_100804 ?auto_100800 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100799 ?auto_100797 ?auto_100795 )
      ( DELIVER-4PKG-VERIFY ?auto_100796 ?auto_100797 ?auto_100798 ?auto_100799 ?auto_100795 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100896 - OBJ
      ?auto_100897 - OBJ
      ?auto_100898 - OBJ
      ?auto_100899 - OBJ
      ?auto_100895 - LOCATION
    )
    :vars
    (
      ?auto_100902 - LOCATION
      ?auto_100903 - CITY
      ?auto_100904 - LOCATION
      ?auto_100901 - TRUCK
      ?auto_100900 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_100897 ?auto_100896 ) ) ( not ( = ?auto_100898 ?auto_100896 ) ) ( not ( = ?auto_100898 ?auto_100897 ) ) ( not ( = ?auto_100899 ?auto_100896 ) ) ( not ( = ?auto_100899 ?auto_100897 ) ) ( not ( = ?auto_100899 ?auto_100898 ) ) ( IN-CITY ?auto_100902 ?auto_100903 ) ( IN-CITY ?auto_100895 ?auto_100903 ) ( not ( = ?auto_100895 ?auto_100902 ) ) ( OBJ-AT ?auto_100899 ?auto_100902 ) ( IN-CITY ?auto_100904 ?auto_100903 ) ( not ( = ?auto_100895 ?auto_100904 ) ) ( not ( = ?auto_100902 ?auto_100904 ) ) ( OBJ-AT ?auto_100896 ?auto_100904 ) ( OBJ-AT ?auto_100898 ?auto_100902 ) ( IN-TRUCK ?auto_100897 ?auto_100901 ) ( TRUCK-AT ?auto_100901 ?auto_100900 ) ( IN-CITY ?auto_100900 ?auto_100903 ) ( not ( = ?auto_100895 ?auto_100900 ) ) ( not ( = ?auto_100902 ?auto_100900 ) ) ( not ( = ?auto_100904 ?auto_100900 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100897 ?auto_100899 ?auto_100895 )
      ( DELIVER-4PKG-VERIFY ?auto_100896 ?auto_100897 ?auto_100898 ?auto_100899 ?auto_100895 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100928 - OBJ
      ?auto_100929 - OBJ
      ?auto_100930 - OBJ
      ?auto_100931 - OBJ
      ?auto_100927 - LOCATION
    )
    :vars
    (
      ?auto_100934 - LOCATION
      ?auto_100935 - CITY
      ?auto_100936 - LOCATION
      ?auto_100933 - TRUCK
      ?auto_100932 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_100929 ?auto_100928 ) ) ( not ( = ?auto_100930 ?auto_100928 ) ) ( not ( = ?auto_100930 ?auto_100929 ) ) ( not ( = ?auto_100931 ?auto_100928 ) ) ( not ( = ?auto_100931 ?auto_100929 ) ) ( not ( = ?auto_100931 ?auto_100930 ) ) ( IN-CITY ?auto_100934 ?auto_100935 ) ( IN-CITY ?auto_100927 ?auto_100935 ) ( not ( = ?auto_100927 ?auto_100934 ) ) ( OBJ-AT ?auto_100930 ?auto_100934 ) ( IN-CITY ?auto_100936 ?auto_100935 ) ( not ( = ?auto_100927 ?auto_100936 ) ) ( not ( = ?auto_100934 ?auto_100936 ) ) ( OBJ-AT ?auto_100928 ?auto_100936 ) ( OBJ-AT ?auto_100931 ?auto_100934 ) ( IN-TRUCK ?auto_100929 ?auto_100933 ) ( TRUCK-AT ?auto_100933 ?auto_100932 ) ( IN-CITY ?auto_100932 ?auto_100935 ) ( not ( = ?auto_100927 ?auto_100932 ) ) ( not ( = ?auto_100934 ?auto_100932 ) ) ( not ( = ?auto_100936 ?auto_100932 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100929 ?auto_100930 ?auto_100927 )
      ( DELIVER-4PKG-VERIFY ?auto_100928 ?auto_100929 ?auto_100930 ?auto_100931 ?auto_100927 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100960 - OBJ
      ?auto_100961 - OBJ
      ?auto_100962 - OBJ
      ?auto_100963 - OBJ
      ?auto_100959 - LOCATION
    )
    :vars
    (
      ?auto_100966 - LOCATION
      ?auto_100967 - CITY
      ?auto_100968 - LOCATION
      ?auto_100965 - TRUCK
      ?auto_100964 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_100961 ?auto_100960 ) ) ( not ( = ?auto_100962 ?auto_100960 ) ) ( not ( = ?auto_100962 ?auto_100961 ) ) ( not ( = ?auto_100963 ?auto_100960 ) ) ( not ( = ?auto_100963 ?auto_100961 ) ) ( not ( = ?auto_100963 ?auto_100962 ) ) ( IN-CITY ?auto_100966 ?auto_100967 ) ( IN-CITY ?auto_100959 ?auto_100967 ) ( not ( = ?auto_100959 ?auto_100966 ) ) ( OBJ-AT ?auto_100963 ?auto_100966 ) ( IN-CITY ?auto_100968 ?auto_100967 ) ( not ( = ?auto_100959 ?auto_100968 ) ) ( not ( = ?auto_100966 ?auto_100968 ) ) ( OBJ-AT ?auto_100960 ?auto_100968 ) ( OBJ-AT ?auto_100961 ?auto_100966 ) ( IN-TRUCK ?auto_100962 ?auto_100965 ) ( TRUCK-AT ?auto_100965 ?auto_100964 ) ( IN-CITY ?auto_100964 ?auto_100967 ) ( not ( = ?auto_100959 ?auto_100964 ) ) ( not ( = ?auto_100966 ?auto_100964 ) ) ( not ( = ?auto_100968 ?auto_100964 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100962 ?auto_100963 ?auto_100959 )
      ( DELIVER-4PKG-VERIFY ?auto_100960 ?auto_100961 ?auto_100962 ?auto_100963 ?auto_100959 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100992 - OBJ
      ?auto_100993 - OBJ
      ?auto_100994 - OBJ
      ?auto_100995 - OBJ
      ?auto_100991 - LOCATION
    )
    :vars
    (
      ?auto_100998 - LOCATION
      ?auto_100999 - CITY
      ?auto_101000 - LOCATION
      ?auto_100997 - TRUCK
      ?auto_100996 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_100993 ?auto_100992 ) ) ( not ( = ?auto_100994 ?auto_100992 ) ) ( not ( = ?auto_100994 ?auto_100993 ) ) ( not ( = ?auto_100995 ?auto_100992 ) ) ( not ( = ?auto_100995 ?auto_100993 ) ) ( not ( = ?auto_100995 ?auto_100994 ) ) ( IN-CITY ?auto_100998 ?auto_100999 ) ( IN-CITY ?auto_100991 ?auto_100999 ) ( not ( = ?auto_100991 ?auto_100998 ) ) ( OBJ-AT ?auto_100994 ?auto_100998 ) ( IN-CITY ?auto_101000 ?auto_100999 ) ( not ( = ?auto_100991 ?auto_101000 ) ) ( not ( = ?auto_100998 ?auto_101000 ) ) ( OBJ-AT ?auto_100992 ?auto_101000 ) ( OBJ-AT ?auto_100993 ?auto_100998 ) ( IN-TRUCK ?auto_100995 ?auto_100997 ) ( TRUCK-AT ?auto_100997 ?auto_100996 ) ( IN-CITY ?auto_100996 ?auto_100999 ) ( not ( = ?auto_100991 ?auto_100996 ) ) ( not ( = ?auto_100998 ?auto_100996 ) ) ( not ( = ?auto_101000 ?auto_100996 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100995 ?auto_100994 ?auto_100991 )
      ( DELIVER-4PKG-VERIFY ?auto_100992 ?auto_100993 ?auto_100994 ?auto_100995 ?auto_100991 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_101126 - OBJ
      ?auto_101127 - OBJ
      ?auto_101128 - OBJ
      ?auto_101129 - OBJ
      ?auto_101125 - LOCATION
    )
    :vars
    (
      ?auto_101132 - LOCATION
      ?auto_101133 - CITY
      ?auto_101134 - LOCATION
      ?auto_101131 - TRUCK
      ?auto_101130 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_101127 ?auto_101126 ) ) ( not ( = ?auto_101128 ?auto_101126 ) ) ( not ( = ?auto_101128 ?auto_101127 ) ) ( not ( = ?auto_101129 ?auto_101126 ) ) ( not ( = ?auto_101129 ?auto_101127 ) ) ( not ( = ?auto_101129 ?auto_101128 ) ) ( IN-CITY ?auto_101132 ?auto_101133 ) ( IN-CITY ?auto_101125 ?auto_101133 ) ( not ( = ?auto_101125 ?auto_101132 ) ) ( OBJ-AT ?auto_101127 ?auto_101132 ) ( IN-CITY ?auto_101134 ?auto_101133 ) ( not ( = ?auto_101125 ?auto_101134 ) ) ( not ( = ?auto_101132 ?auto_101134 ) ) ( OBJ-AT ?auto_101126 ?auto_101134 ) ( OBJ-AT ?auto_101129 ?auto_101132 ) ( IN-TRUCK ?auto_101128 ?auto_101131 ) ( TRUCK-AT ?auto_101131 ?auto_101130 ) ( IN-CITY ?auto_101130 ?auto_101133 ) ( not ( = ?auto_101125 ?auto_101130 ) ) ( not ( = ?auto_101132 ?auto_101130 ) ) ( not ( = ?auto_101134 ?auto_101130 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101128 ?auto_101127 ?auto_101125 )
      ( DELIVER-4PKG-VERIFY ?auto_101126 ?auto_101127 ?auto_101128 ?auto_101129 ?auto_101125 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_101158 - OBJ
      ?auto_101159 - OBJ
      ?auto_101160 - OBJ
      ?auto_101161 - OBJ
      ?auto_101157 - LOCATION
    )
    :vars
    (
      ?auto_101164 - LOCATION
      ?auto_101165 - CITY
      ?auto_101166 - LOCATION
      ?auto_101163 - TRUCK
      ?auto_101162 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_101159 ?auto_101158 ) ) ( not ( = ?auto_101160 ?auto_101158 ) ) ( not ( = ?auto_101160 ?auto_101159 ) ) ( not ( = ?auto_101161 ?auto_101158 ) ) ( not ( = ?auto_101161 ?auto_101159 ) ) ( not ( = ?auto_101161 ?auto_101160 ) ) ( IN-CITY ?auto_101164 ?auto_101165 ) ( IN-CITY ?auto_101157 ?auto_101165 ) ( not ( = ?auto_101157 ?auto_101164 ) ) ( OBJ-AT ?auto_101159 ?auto_101164 ) ( IN-CITY ?auto_101166 ?auto_101165 ) ( not ( = ?auto_101157 ?auto_101166 ) ) ( not ( = ?auto_101164 ?auto_101166 ) ) ( OBJ-AT ?auto_101158 ?auto_101166 ) ( OBJ-AT ?auto_101160 ?auto_101164 ) ( IN-TRUCK ?auto_101161 ?auto_101163 ) ( TRUCK-AT ?auto_101163 ?auto_101162 ) ( IN-CITY ?auto_101162 ?auto_101165 ) ( not ( = ?auto_101157 ?auto_101162 ) ) ( not ( = ?auto_101164 ?auto_101162 ) ) ( not ( = ?auto_101166 ?auto_101162 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101161 ?auto_101159 ?auto_101157 )
      ( DELIVER-4PKG-VERIFY ?auto_101158 ?auto_101159 ?auto_101160 ?auto_101161 ?auto_101157 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_101361 - OBJ
      ?auto_101362 - OBJ
      ?auto_101363 - OBJ
      ?auto_101364 - OBJ
      ?auto_101360 - LOCATION
    )
    :vars
    (
      ?auto_101367 - LOCATION
      ?auto_101368 - CITY
      ?auto_101369 - LOCATION
      ?auto_101366 - TRUCK
      ?auto_101365 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_101362 ?auto_101361 ) ) ( not ( = ?auto_101363 ?auto_101361 ) ) ( not ( = ?auto_101363 ?auto_101362 ) ) ( not ( = ?auto_101364 ?auto_101361 ) ) ( not ( = ?auto_101364 ?auto_101362 ) ) ( not ( = ?auto_101364 ?auto_101363 ) ) ( IN-CITY ?auto_101367 ?auto_101368 ) ( IN-CITY ?auto_101360 ?auto_101368 ) ( not ( = ?auto_101360 ?auto_101367 ) ) ( OBJ-AT ?auto_101361 ?auto_101367 ) ( IN-CITY ?auto_101369 ?auto_101368 ) ( not ( = ?auto_101360 ?auto_101369 ) ) ( not ( = ?auto_101367 ?auto_101369 ) ) ( OBJ-AT ?auto_101364 ?auto_101369 ) ( OBJ-AT ?auto_101363 ?auto_101367 ) ( IN-TRUCK ?auto_101362 ?auto_101366 ) ( TRUCK-AT ?auto_101366 ?auto_101365 ) ( IN-CITY ?auto_101365 ?auto_101368 ) ( not ( = ?auto_101360 ?auto_101365 ) ) ( not ( = ?auto_101367 ?auto_101365 ) ) ( not ( = ?auto_101369 ?auto_101365 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101362 ?auto_101361 ?auto_101360 )
      ( DELIVER-4PKG-VERIFY ?auto_101361 ?auto_101362 ?auto_101363 ?auto_101364 ?auto_101360 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_101393 - OBJ
      ?auto_101394 - OBJ
      ?auto_101395 - OBJ
      ?auto_101396 - OBJ
      ?auto_101392 - LOCATION
    )
    :vars
    (
      ?auto_101399 - LOCATION
      ?auto_101400 - CITY
      ?auto_101401 - LOCATION
      ?auto_101398 - TRUCK
      ?auto_101397 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_101394 ?auto_101393 ) ) ( not ( = ?auto_101395 ?auto_101393 ) ) ( not ( = ?auto_101395 ?auto_101394 ) ) ( not ( = ?auto_101396 ?auto_101393 ) ) ( not ( = ?auto_101396 ?auto_101394 ) ) ( not ( = ?auto_101396 ?auto_101395 ) ) ( IN-CITY ?auto_101399 ?auto_101400 ) ( IN-CITY ?auto_101392 ?auto_101400 ) ( not ( = ?auto_101392 ?auto_101399 ) ) ( OBJ-AT ?auto_101393 ?auto_101399 ) ( IN-CITY ?auto_101401 ?auto_101400 ) ( not ( = ?auto_101392 ?auto_101401 ) ) ( not ( = ?auto_101399 ?auto_101401 ) ) ( OBJ-AT ?auto_101395 ?auto_101401 ) ( OBJ-AT ?auto_101396 ?auto_101399 ) ( IN-TRUCK ?auto_101394 ?auto_101398 ) ( TRUCK-AT ?auto_101398 ?auto_101397 ) ( IN-CITY ?auto_101397 ?auto_101400 ) ( not ( = ?auto_101392 ?auto_101397 ) ) ( not ( = ?auto_101399 ?auto_101397 ) ) ( not ( = ?auto_101401 ?auto_101397 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101394 ?auto_101393 ?auto_101392 )
      ( DELIVER-4PKG-VERIFY ?auto_101393 ?auto_101394 ?auto_101395 ?auto_101396 ?auto_101392 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_101493 - OBJ
      ?auto_101494 - OBJ
      ?auto_101495 - OBJ
      ?auto_101496 - OBJ
      ?auto_101492 - LOCATION
    )
    :vars
    (
      ?auto_101499 - LOCATION
      ?auto_101500 - CITY
      ?auto_101501 - LOCATION
      ?auto_101498 - TRUCK
      ?auto_101497 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_101494 ?auto_101493 ) ) ( not ( = ?auto_101495 ?auto_101493 ) ) ( not ( = ?auto_101495 ?auto_101494 ) ) ( not ( = ?auto_101496 ?auto_101493 ) ) ( not ( = ?auto_101496 ?auto_101494 ) ) ( not ( = ?auto_101496 ?auto_101495 ) ) ( IN-CITY ?auto_101499 ?auto_101500 ) ( IN-CITY ?auto_101492 ?auto_101500 ) ( not ( = ?auto_101492 ?auto_101499 ) ) ( OBJ-AT ?auto_101493 ?auto_101499 ) ( IN-CITY ?auto_101501 ?auto_101500 ) ( not ( = ?auto_101492 ?auto_101501 ) ) ( not ( = ?auto_101499 ?auto_101501 ) ) ( OBJ-AT ?auto_101496 ?auto_101501 ) ( OBJ-AT ?auto_101494 ?auto_101499 ) ( IN-TRUCK ?auto_101495 ?auto_101498 ) ( TRUCK-AT ?auto_101498 ?auto_101497 ) ( IN-CITY ?auto_101497 ?auto_101500 ) ( not ( = ?auto_101492 ?auto_101497 ) ) ( not ( = ?auto_101499 ?auto_101497 ) ) ( not ( = ?auto_101501 ?auto_101497 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101495 ?auto_101493 ?auto_101492 )
      ( DELIVER-4PKG-VERIFY ?auto_101493 ?auto_101494 ?auto_101495 ?auto_101496 ?auto_101492 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_101560 - OBJ
      ?auto_101561 - OBJ
      ?auto_101562 - OBJ
      ?auto_101563 - OBJ
      ?auto_101559 - LOCATION
    )
    :vars
    (
      ?auto_101566 - LOCATION
      ?auto_101567 - CITY
      ?auto_101568 - LOCATION
      ?auto_101565 - TRUCK
      ?auto_101564 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_101561 ?auto_101560 ) ) ( not ( = ?auto_101562 ?auto_101560 ) ) ( not ( = ?auto_101562 ?auto_101561 ) ) ( not ( = ?auto_101563 ?auto_101560 ) ) ( not ( = ?auto_101563 ?auto_101561 ) ) ( not ( = ?auto_101563 ?auto_101562 ) ) ( IN-CITY ?auto_101566 ?auto_101567 ) ( IN-CITY ?auto_101559 ?auto_101567 ) ( not ( = ?auto_101559 ?auto_101566 ) ) ( OBJ-AT ?auto_101560 ?auto_101566 ) ( IN-CITY ?auto_101568 ?auto_101567 ) ( not ( = ?auto_101559 ?auto_101568 ) ) ( not ( = ?auto_101566 ?auto_101568 ) ) ( OBJ-AT ?auto_101562 ?auto_101568 ) ( OBJ-AT ?auto_101561 ?auto_101566 ) ( IN-TRUCK ?auto_101563 ?auto_101565 ) ( TRUCK-AT ?auto_101565 ?auto_101564 ) ( IN-CITY ?auto_101564 ?auto_101567 ) ( not ( = ?auto_101559 ?auto_101564 ) ) ( not ( = ?auto_101566 ?auto_101564 ) ) ( not ( = ?auto_101568 ?auto_101564 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101563 ?auto_101560 ?auto_101559 )
      ( DELIVER-4PKG-VERIFY ?auto_101560 ?auto_101561 ?auto_101562 ?auto_101563 ?auto_101559 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_101660 - OBJ
      ?auto_101661 - OBJ
      ?auto_101662 - OBJ
      ?auto_101663 - OBJ
      ?auto_101659 - LOCATION
    )
    :vars
    (
      ?auto_101666 - LOCATION
      ?auto_101667 - CITY
      ?auto_101668 - LOCATION
      ?auto_101665 - TRUCK
      ?auto_101664 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_101661 ?auto_101660 ) ) ( not ( = ?auto_101662 ?auto_101660 ) ) ( not ( = ?auto_101662 ?auto_101661 ) ) ( not ( = ?auto_101663 ?auto_101660 ) ) ( not ( = ?auto_101663 ?auto_101661 ) ) ( not ( = ?auto_101663 ?auto_101662 ) ) ( IN-CITY ?auto_101666 ?auto_101667 ) ( IN-CITY ?auto_101659 ?auto_101667 ) ( not ( = ?auto_101659 ?auto_101666 ) ) ( OBJ-AT ?auto_101660 ?auto_101666 ) ( IN-CITY ?auto_101668 ?auto_101667 ) ( not ( = ?auto_101659 ?auto_101668 ) ) ( not ( = ?auto_101666 ?auto_101668 ) ) ( OBJ-AT ?auto_101661 ?auto_101668 ) ( OBJ-AT ?auto_101663 ?auto_101666 ) ( IN-TRUCK ?auto_101662 ?auto_101665 ) ( TRUCK-AT ?auto_101665 ?auto_101664 ) ( IN-CITY ?auto_101664 ?auto_101667 ) ( not ( = ?auto_101659 ?auto_101664 ) ) ( not ( = ?auto_101666 ?auto_101664 ) ) ( not ( = ?auto_101668 ?auto_101664 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101662 ?auto_101660 ?auto_101659 )
      ( DELIVER-4PKG-VERIFY ?auto_101660 ?auto_101661 ?auto_101662 ?auto_101663 ?auto_101659 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_101692 - OBJ
      ?auto_101693 - OBJ
      ?auto_101694 - OBJ
      ?auto_101695 - OBJ
      ?auto_101691 - LOCATION
    )
    :vars
    (
      ?auto_101698 - LOCATION
      ?auto_101699 - CITY
      ?auto_101700 - LOCATION
      ?auto_101697 - TRUCK
      ?auto_101696 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_101693 ?auto_101692 ) ) ( not ( = ?auto_101694 ?auto_101692 ) ) ( not ( = ?auto_101694 ?auto_101693 ) ) ( not ( = ?auto_101695 ?auto_101692 ) ) ( not ( = ?auto_101695 ?auto_101693 ) ) ( not ( = ?auto_101695 ?auto_101694 ) ) ( IN-CITY ?auto_101698 ?auto_101699 ) ( IN-CITY ?auto_101691 ?auto_101699 ) ( not ( = ?auto_101691 ?auto_101698 ) ) ( OBJ-AT ?auto_101692 ?auto_101698 ) ( IN-CITY ?auto_101700 ?auto_101699 ) ( not ( = ?auto_101691 ?auto_101700 ) ) ( not ( = ?auto_101698 ?auto_101700 ) ) ( OBJ-AT ?auto_101693 ?auto_101700 ) ( OBJ-AT ?auto_101694 ?auto_101698 ) ( IN-TRUCK ?auto_101695 ?auto_101697 ) ( TRUCK-AT ?auto_101697 ?auto_101696 ) ( IN-CITY ?auto_101696 ?auto_101699 ) ( not ( = ?auto_101691 ?auto_101696 ) ) ( not ( = ?auto_101698 ?auto_101696 ) ) ( not ( = ?auto_101700 ?auto_101696 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101695 ?auto_101692 ?auto_101691 )
      ( DELIVER-4PKG-VERIFY ?auto_101692 ?auto_101693 ?auto_101694 ?auto_101695 ?auto_101691 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_102014 - OBJ
      ?auto_102013 - LOCATION
    )
    :vars
    (
      ?auto_102022 - OBJ
      ?auto_102018 - LOCATION
      ?auto_102019 - CITY
      ?auto_102020 - OBJ
      ?auto_102021 - LOCATION
      ?auto_102017 - OBJ
      ?auto_102016 - TRUCK
      ?auto_102015 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102014 ?auto_102022 ) ) ( IN-CITY ?auto_102018 ?auto_102019 ) ( IN-CITY ?auto_102013 ?auto_102019 ) ( not ( = ?auto_102013 ?auto_102018 ) ) ( OBJ-AT ?auto_102014 ?auto_102018 ) ( not ( = ?auto_102020 ?auto_102022 ) ) ( not ( = ?auto_102014 ?auto_102020 ) ) ( IN-CITY ?auto_102021 ?auto_102019 ) ( not ( = ?auto_102013 ?auto_102021 ) ) ( not ( = ?auto_102018 ?auto_102021 ) ) ( OBJ-AT ?auto_102020 ?auto_102021 ) ( not ( = ?auto_102017 ?auto_102022 ) ) ( not ( = ?auto_102014 ?auto_102017 ) ) ( not ( = ?auto_102020 ?auto_102017 ) ) ( OBJ-AT ?auto_102017 ?auto_102018 ) ( TRUCK-AT ?auto_102016 ?auto_102015 ) ( IN-CITY ?auto_102015 ?auto_102019 ) ( not ( = ?auto_102013 ?auto_102015 ) ) ( not ( = ?auto_102018 ?auto_102015 ) ) ( not ( = ?auto_102021 ?auto_102015 ) ) ( OBJ-AT ?auto_102022 ?auto_102015 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_102022 ?auto_102016 ?auto_102015 )
      ( DELIVER-2PKG ?auto_102022 ?auto_102014 ?auto_102013 )
      ( DELIVER-1PKG-VERIFY ?auto_102014 ?auto_102013 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_102024 - OBJ
      ?auto_102025 - OBJ
      ?auto_102023 - LOCATION
    )
    :vars
    (
      ?auto_102029 - LOCATION
      ?auto_102026 - CITY
      ?auto_102027 - OBJ
      ?auto_102032 - LOCATION
      ?auto_102031 - OBJ
      ?auto_102030 - TRUCK
      ?auto_102028 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102025 ?auto_102024 ) ) ( IN-CITY ?auto_102029 ?auto_102026 ) ( IN-CITY ?auto_102023 ?auto_102026 ) ( not ( = ?auto_102023 ?auto_102029 ) ) ( OBJ-AT ?auto_102025 ?auto_102029 ) ( not ( = ?auto_102027 ?auto_102024 ) ) ( not ( = ?auto_102025 ?auto_102027 ) ) ( IN-CITY ?auto_102032 ?auto_102026 ) ( not ( = ?auto_102023 ?auto_102032 ) ) ( not ( = ?auto_102029 ?auto_102032 ) ) ( OBJ-AT ?auto_102027 ?auto_102032 ) ( not ( = ?auto_102031 ?auto_102024 ) ) ( not ( = ?auto_102025 ?auto_102031 ) ) ( not ( = ?auto_102027 ?auto_102031 ) ) ( OBJ-AT ?auto_102031 ?auto_102029 ) ( TRUCK-AT ?auto_102030 ?auto_102028 ) ( IN-CITY ?auto_102028 ?auto_102026 ) ( not ( = ?auto_102023 ?auto_102028 ) ) ( not ( = ?auto_102029 ?auto_102028 ) ) ( not ( = ?auto_102032 ?auto_102028 ) ) ( OBJ-AT ?auto_102024 ?auto_102028 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_102025 ?auto_102023 )
      ( DELIVER-2PKG-VERIFY ?auto_102024 ?auto_102025 ?auto_102023 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_102034 - OBJ
      ?auto_102035 - OBJ
      ?auto_102033 - LOCATION
    )
    :vars
    (
      ?auto_102042 - OBJ
      ?auto_102041 - LOCATION
      ?auto_102040 - CITY
      ?auto_102036 - OBJ
      ?auto_102039 - LOCATION
      ?auto_102038 - TRUCK
      ?auto_102037 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102035 ?auto_102034 ) ) ( not ( = ?auto_102035 ?auto_102042 ) ) ( IN-CITY ?auto_102041 ?auto_102040 ) ( IN-CITY ?auto_102033 ?auto_102040 ) ( not ( = ?auto_102033 ?auto_102041 ) ) ( OBJ-AT ?auto_102035 ?auto_102041 ) ( not ( = ?auto_102036 ?auto_102042 ) ) ( not ( = ?auto_102035 ?auto_102036 ) ) ( IN-CITY ?auto_102039 ?auto_102040 ) ( not ( = ?auto_102033 ?auto_102039 ) ) ( not ( = ?auto_102041 ?auto_102039 ) ) ( OBJ-AT ?auto_102036 ?auto_102039 ) ( not ( = ?auto_102034 ?auto_102042 ) ) ( not ( = ?auto_102036 ?auto_102034 ) ) ( OBJ-AT ?auto_102034 ?auto_102041 ) ( TRUCK-AT ?auto_102038 ?auto_102037 ) ( IN-CITY ?auto_102037 ?auto_102040 ) ( not ( = ?auto_102033 ?auto_102037 ) ) ( not ( = ?auto_102041 ?auto_102037 ) ) ( not ( = ?auto_102039 ?auto_102037 ) ) ( OBJ-AT ?auto_102042 ?auto_102037 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102042 ?auto_102035 ?auto_102033 )
      ( DELIVER-2PKG-VERIFY ?auto_102034 ?auto_102035 ?auto_102033 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_102044 - OBJ
      ?auto_102045 - OBJ
      ?auto_102043 - LOCATION
    )
    :vars
    (
      ?auto_102052 - OBJ
      ?auto_102051 - LOCATION
      ?auto_102050 - CITY
      ?auto_102049 - LOCATION
      ?auto_102047 - OBJ
      ?auto_102048 - TRUCK
      ?auto_102046 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102045 ?auto_102044 ) ) ( not ( = ?auto_102045 ?auto_102052 ) ) ( IN-CITY ?auto_102051 ?auto_102050 ) ( IN-CITY ?auto_102043 ?auto_102050 ) ( not ( = ?auto_102043 ?auto_102051 ) ) ( OBJ-AT ?auto_102045 ?auto_102051 ) ( not ( = ?auto_102044 ?auto_102052 ) ) ( IN-CITY ?auto_102049 ?auto_102050 ) ( not ( = ?auto_102043 ?auto_102049 ) ) ( not ( = ?auto_102051 ?auto_102049 ) ) ( OBJ-AT ?auto_102044 ?auto_102049 ) ( not ( = ?auto_102047 ?auto_102052 ) ) ( not ( = ?auto_102045 ?auto_102047 ) ) ( not ( = ?auto_102044 ?auto_102047 ) ) ( OBJ-AT ?auto_102047 ?auto_102051 ) ( TRUCK-AT ?auto_102048 ?auto_102046 ) ( IN-CITY ?auto_102046 ?auto_102050 ) ( not ( = ?auto_102043 ?auto_102046 ) ) ( not ( = ?auto_102051 ?auto_102046 ) ) ( not ( = ?auto_102049 ?auto_102046 ) ) ( OBJ-AT ?auto_102052 ?auto_102046 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102052 ?auto_102045 ?auto_102043 )
      ( DELIVER-2PKG-VERIFY ?auto_102044 ?auto_102045 ?auto_102043 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_102054 - OBJ
      ?auto_102055 - OBJ
      ?auto_102053 - LOCATION
    )
    :vars
    (
      ?auto_102062 - LOCATION
      ?auto_102061 - CITY
      ?auto_102056 - OBJ
      ?auto_102060 - LOCATION
      ?auto_102058 - OBJ
      ?auto_102059 - TRUCK
      ?auto_102057 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102055 ?auto_102054 ) ) ( IN-CITY ?auto_102062 ?auto_102061 ) ( IN-CITY ?auto_102053 ?auto_102061 ) ( not ( = ?auto_102053 ?auto_102062 ) ) ( OBJ-AT ?auto_102054 ?auto_102062 ) ( not ( = ?auto_102056 ?auto_102055 ) ) ( not ( = ?auto_102054 ?auto_102056 ) ) ( IN-CITY ?auto_102060 ?auto_102061 ) ( not ( = ?auto_102053 ?auto_102060 ) ) ( not ( = ?auto_102062 ?auto_102060 ) ) ( OBJ-AT ?auto_102056 ?auto_102060 ) ( not ( = ?auto_102058 ?auto_102055 ) ) ( not ( = ?auto_102054 ?auto_102058 ) ) ( not ( = ?auto_102056 ?auto_102058 ) ) ( OBJ-AT ?auto_102058 ?auto_102062 ) ( TRUCK-AT ?auto_102059 ?auto_102057 ) ( IN-CITY ?auto_102057 ?auto_102061 ) ( not ( = ?auto_102053 ?auto_102057 ) ) ( not ( = ?auto_102062 ?auto_102057 ) ) ( not ( = ?auto_102060 ?auto_102057 ) ) ( OBJ-AT ?auto_102055 ?auto_102057 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102055 ?auto_102054 ?auto_102053 )
      ( DELIVER-2PKG-VERIFY ?auto_102054 ?auto_102055 ?auto_102053 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_102064 - OBJ
      ?auto_102065 - OBJ
      ?auto_102063 - LOCATION
    )
    :vars
    (
      ?auto_102072 - OBJ
      ?auto_102071 - LOCATION
      ?auto_102070 - CITY
      ?auto_102066 - OBJ
      ?auto_102069 - LOCATION
      ?auto_102068 - TRUCK
      ?auto_102067 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102065 ?auto_102064 ) ) ( not ( = ?auto_102064 ?auto_102072 ) ) ( IN-CITY ?auto_102071 ?auto_102070 ) ( IN-CITY ?auto_102063 ?auto_102070 ) ( not ( = ?auto_102063 ?auto_102071 ) ) ( OBJ-AT ?auto_102064 ?auto_102071 ) ( not ( = ?auto_102066 ?auto_102072 ) ) ( not ( = ?auto_102064 ?auto_102066 ) ) ( IN-CITY ?auto_102069 ?auto_102070 ) ( not ( = ?auto_102063 ?auto_102069 ) ) ( not ( = ?auto_102071 ?auto_102069 ) ) ( OBJ-AT ?auto_102066 ?auto_102069 ) ( not ( = ?auto_102065 ?auto_102072 ) ) ( not ( = ?auto_102066 ?auto_102065 ) ) ( OBJ-AT ?auto_102065 ?auto_102071 ) ( TRUCK-AT ?auto_102068 ?auto_102067 ) ( IN-CITY ?auto_102067 ?auto_102070 ) ( not ( = ?auto_102063 ?auto_102067 ) ) ( not ( = ?auto_102071 ?auto_102067 ) ) ( not ( = ?auto_102069 ?auto_102067 ) ) ( OBJ-AT ?auto_102072 ?auto_102067 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102072 ?auto_102064 ?auto_102063 )
      ( DELIVER-2PKG-VERIFY ?auto_102064 ?auto_102065 ?auto_102063 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_102074 - OBJ
      ?auto_102075 - OBJ
      ?auto_102073 - LOCATION
    )
    :vars
    (
      ?auto_102082 - OBJ
      ?auto_102081 - LOCATION
      ?auto_102080 - CITY
      ?auto_102079 - LOCATION
      ?auto_102077 - OBJ
      ?auto_102078 - TRUCK
      ?auto_102076 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102075 ?auto_102074 ) ) ( not ( = ?auto_102074 ?auto_102082 ) ) ( IN-CITY ?auto_102081 ?auto_102080 ) ( IN-CITY ?auto_102073 ?auto_102080 ) ( not ( = ?auto_102073 ?auto_102081 ) ) ( OBJ-AT ?auto_102074 ?auto_102081 ) ( not ( = ?auto_102075 ?auto_102082 ) ) ( IN-CITY ?auto_102079 ?auto_102080 ) ( not ( = ?auto_102073 ?auto_102079 ) ) ( not ( = ?auto_102081 ?auto_102079 ) ) ( OBJ-AT ?auto_102075 ?auto_102079 ) ( not ( = ?auto_102077 ?auto_102082 ) ) ( not ( = ?auto_102074 ?auto_102077 ) ) ( not ( = ?auto_102075 ?auto_102077 ) ) ( OBJ-AT ?auto_102077 ?auto_102081 ) ( TRUCK-AT ?auto_102078 ?auto_102076 ) ( IN-CITY ?auto_102076 ?auto_102080 ) ( not ( = ?auto_102073 ?auto_102076 ) ) ( not ( = ?auto_102081 ?auto_102076 ) ) ( not ( = ?auto_102079 ?auto_102076 ) ) ( OBJ-AT ?auto_102082 ?auto_102076 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102082 ?auto_102074 ?auto_102073 )
      ( DELIVER-2PKG-VERIFY ?auto_102074 ?auto_102075 ?auto_102073 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_102106 - OBJ
      ?auto_102107 - OBJ
      ?auto_102108 - OBJ
      ?auto_102105 - LOCATION
    )
    :vars
    (
      ?auto_102114 - LOCATION
      ?auto_102113 - CITY
      ?auto_102109 - OBJ
      ?auto_102112 - LOCATION
      ?auto_102111 - TRUCK
      ?auto_102110 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102107 ?auto_102106 ) ) ( not ( = ?auto_102108 ?auto_102106 ) ) ( not ( = ?auto_102108 ?auto_102107 ) ) ( IN-CITY ?auto_102114 ?auto_102113 ) ( IN-CITY ?auto_102105 ?auto_102113 ) ( not ( = ?auto_102105 ?auto_102114 ) ) ( OBJ-AT ?auto_102108 ?auto_102114 ) ( not ( = ?auto_102109 ?auto_102106 ) ) ( not ( = ?auto_102108 ?auto_102109 ) ) ( IN-CITY ?auto_102112 ?auto_102113 ) ( not ( = ?auto_102105 ?auto_102112 ) ) ( not ( = ?auto_102114 ?auto_102112 ) ) ( OBJ-AT ?auto_102109 ?auto_102112 ) ( not ( = ?auto_102109 ?auto_102107 ) ) ( OBJ-AT ?auto_102107 ?auto_102114 ) ( TRUCK-AT ?auto_102111 ?auto_102110 ) ( IN-CITY ?auto_102110 ?auto_102113 ) ( not ( = ?auto_102105 ?auto_102110 ) ) ( not ( = ?auto_102114 ?auto_102110 ) ) ( not ( = ?auto_102112 ?auto_102110 ) ) ( OBJ-AT ?auto_102106 ?auto_102110 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102106 ?auto_102108 ?auto_102105 )
      ( DELIVER-3PKG-VERIFY ?auto_102106 ?auto_102107 ?auto_102108 ?auto_102105 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_102116 - OBJ
      ?auto_102117 - OBJ
      ?auto_102118 - OBJ
      ?auto_102115 - LOCATION
    )
    :vars
    (
      ?auto_102124 - LOCATION
      ?auto_102123 - CITY
      ?auto_102122 - LOCATION
      ?auto_102120 - OBJ
      ?auto_102121 - TRUCK
      ?auto_102119 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102117 ?auto_102116 ) ) ( not ( = ?auto_102118 ?auto_102116 ) ) ( not ( = ?auto_102118 ?auto_102117 ) ) ( IN-CITY ?auto_102124 ?auto_102123 ) ( IN-CITY ?auto_102115 ?auto_102123 ) ( not ( = ?auto_102115 ?auto_102124 ) ) ( OBJ-AT ?auto_102118 ?auto_102124 ) ( IN-CITY ?auto_102122 ?auto_102123 ) ( not ( = ?auto_102115 ?auto_102122 ) ) ( not ( = ?auto_102124 ?auto_102122 ) ) ( OBJ-AT ?auto_102117 ?auto_102122 ) ( not ( = ?auto_102120 ?auto_102116 ) ) ( not ( = ?auto_102118 ?auto_102120 ) ) ( not ( = ?auto_102117 ?auto_102120 ) ) ( OBJ-AT ?auto_102120 ?auto_102124 ) ( TRUCK-AT ?auto_102121 ?auto_102119 ) ( IN-CITY ?auto_102119 ?auto_102123 ) ( not ( = ?auto_102115 ?auto_102119 ) ) ( not ( = ?auto_102124 ?auto_102119 ) ) ( not ( = ?auto_102122 ?auto_102119 ) ) ( OBJ-AT ?auto_102116 ?auto_102119 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102116 ?auto_102118 ?auto_102115 )
      ( DELIVER-3PKG-VERIFY ?auto_102116 ?auto_102117 ?auto_102118 ?auto_102115 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_102137 - OBJ
      ?auto_102138 - OBJ
      ?auto_102139 - OBJ
      ?auto_102136 - LOCATION
    )
    :vars
    (
      ?auto_102145 - LOCATION
      ?auto_102144 - CITY
      ?auto_102140 - OBJ
      ?auto_102143 - LOCATION
      ?auto_102142 - TRUCK
      ?auto_102141 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102138 ?auto_102137 ) ) ( not ( = ?auto_102139 ?auto_102137 ) ) ( not ( = ?auto_102139 ?auto_102138 ) ) ( IN-CITY ?auto_102145 ?auto_102144 ) ( IN-CITY ?auto_102136 ?auto_102144 ) ( not ( = ?auto_102136 ?auto_102145 ) ) ( OBJ-AT ?auto_102138 ?auto_102145 ) ( not ( = ?auto_102140 ?auto_102137 ) ) ( not ( = ?auto_102138 ?auto_102140 ) ) ( IN-CITY ?auto_102143 ?auto_102144 ) ( not ( = ?auto_102136 ?auto_102143 ) ) ( not ( = ?auto_102145 ?auto_102143 ) ) ( OBJ-AT ?auto_102140 ?auto_102143 ) ( not ( = ?auto_102140 ?auto_102139 ) ) ( OBJ-AT ?auto_102139 ?auto_102145 ) ( TRUCK-AT ?auto_102142 ?auto_102141 ) ( IN-CITY ?auto_102141 ?auto_102144 ) ( not ( = ?auto_102136 ?auto_102141 ) ) ( not ( = ?auto_102145 ?auto_102141 ) ) ( not ( = ?auto_102143 ?auto_102141 ) ) ( OBJ-AT ?auto_102137 ?auto_102141 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102137 ?auto_102138 ?auto_102136 )
      ( DELIVER-3PKG-VERIFY ?auto_102137 ?auto_102138 ?auto_102139 ?auto_102136 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_102147 - OBJ
      ?auto_102148 - OBJ
      ?auto_102149 - OBJ
      ?auto_102146 - LOCATION
    )
    :vars
    (
      ?auto_102155 - LOCATION
      ?auto_102154 - CITY
      ?auto_102153 - LOCATION
      ?auto_102151 - OBJ
      ?auto_102152 - TRUCK
      ?auto_102150 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102148 ?auto_102147 ) ) ( not ( = ?auto_102149 ?auto_102147 ) ) ( not ( = ?auto_102149 ?auto_102148 ) ) ( IN-CITY ?auto_102155 ?auto_102154 ) ( IN-CITY ?auto_102146 ?auto_102154 ) ( not ( = ?auto_102146 ?auto_102155 ) ) ( OBJ-AT ?auto_102148 ?auto_102155 ) ( IN-CITY ?auto_102153 ?auto_102154 ) ( not ( = ?auto_102146 ?auto_102153 ) ) ( not ( = ?auto_102155 ?auto_102153 ) ) ( OBJ-AT ?auto_102149 ?auto_102153 ) ( not ( = ?auto_102151 ?auto_102147 ) ) ( not ( = ?auto_102148 ?auto_102151 ) ) ( not ( = ?auto_102149 ?auto_102151 ) ) ( OBJ-AT ?auto_102151 ?auto_102155 ) ( TRUCK-AT ?auto_102152 ?auto_102150 ) ( IN-CITY ?auto_102150 ?auto_102154 ) ( not ( = ?auto_102146 ?auto_102150 ) ) ( not ( = ?auto_102155 ?auto_102150 ) ) ( not ( = ?auto_102153 ?auto_102150 ) ) ( OBJ-AT ?auto_102147 ?auto_102150 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102147 ?auto_102148 ?auto_102146 )
      ( DELIVER-3PKG-VERIFY ?auto_102147 ?auto_102148 ?auto_102149 ?auto_102146 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_102168 - OBJ
      ?auto_102169 - OBJ
      ?auto_102170 - OBJ
      ?auto_102167 - LOCATION
    )
    :vars
    (
      ?auto_102176 - LOCATION
      ?auto_102175 - CITY
      ?auto_102171 - OBJ
      ?auto_102174 - LOCATION
      ?auto_102173 - TRUCK
      ?auto_102172 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102169 ?auto_102168 ) ) ( not ( = ?auto_102170 ?auto_102168 ) ) ( not ( = ?auto_102170 ?auto_102169 ) ) ( IN-CITY ?auto_102176 ?auto_102175 ) ( IN-CITY ?auto_102167 ?auto_102175 ) ( not ( = ?auto_102167 ?auto_102176 ) ) ( OBJ-AT ?auto_102170 ?auto_102176 ) ( not ( = ?auto_102171 ?auto_102169 ) ) ( not ( = ?auto_102170 ?auto_102171 ) ) ( IN-CITY ?auto_102174 ?auto_102175 ) ( not ( = ?auto_102167 ?auto_102174 ) ) ( not ( = ?auto_102176 ?auto_102174 ) ) ( OBJ-AT ?auto_102171 ?auto_102174 ) ( not ( = ?auto_102171 ?auto_102168 ) ) ( OBJ-AT ?auto_102168 ?auto_102176 ) ( TRUCK-AT ?auto_102173 ?auto_102172 ) ( IN-CITY ?auto_102172 ?auto_102175 ) ( not ( = ?auto_102167 ?auto_102172 ) ) ( not ( = ?auto_102176 ?auto_102172 ) ) ( not ( = ?auto_102174 ?auto_102172 ) ) ( OBJ-AT ?auto_102169 ?auto_102172 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102169 ?auto_102170 ?auto_102167 )
      ( DELIVER-3PKG-VERIFY ?auto_102168 ?auto_102169 ?auto_102170 ?auto_102167 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_102189 - OBJ
      ?auto_102190 - OBJ
      ?auto_102191 - OBJ
      ?auto_102188 - LOCATION
    )
    :vars
    (
      ?auto_102197 - OBJ
      ?auto_102196 - LOCATION
      ?auto_102195 - CITY
      ?auto_102194 - LOCATION
      ?auto_102193 - TRUCK
      ?auto_102192 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102190 ?auto_102189 ) ) ( not ( = ?auto_102191 ?auto_102189 ) ) ( not ( = ?auto_102191 ?auto_102190 ) ) ( not ( = ?auto_102191 ?auto_102197 ) ) ( IN-CITY ?auto_102196 ?auto_102195 ) ( IN-CITY ?auto_102188 ?auto_102195 ) ( not ( = ?auto_102188 ?auto_102196 ) ) ( OBJ-AT ?auto_102191 ?auto_102196 ) ( not ( = ?auto_102190 ?auto_102197 ) ) ( IN-CITY ?auto_102194 ?auto_102195 ) ( not ( = ?auto_102188 ?auto_102194 ) ) ( not ( = ?auto_102196 ?auto_102194 ) ) ( OBJ-AT ?auto_102190 ?auto_102194 ) ( not ( = ?auto_102189 ?auto_102197 ) ) ( OBJ-AT ?auto_102189 ?auto_102196 ) ( TRUCK-AT ?auto_102193 ?auto_102192 ) ( IN-CITY ?auto_102192 ?auto_102195 ) ( not ( = ?auto_102188 ?auto_102192 ) ) ( not ( = ?auto_102196 ?auto_102192 ) ) ( not ( = ?auto_102194 ?auto_102192 ) ) ( OBJ-AT ?auto_102197 ?auto_102192 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102197 ?auto_102191 ?auto_102188 )
      ( DELIVER-3PKG-VERIFY ?auto_102189 ?auto_102190 ?auto_102191 ?auto_102188 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_102199 - OBJ
      ?auto_102200 - OBJ
      ?auto_102201 - OBJ
      ?auto_102198 - LOCATION
    )
    :vars
    (
      ?auto_102207 - LOCATION
      ?auto_102206 - CITY
      ?auto_102202 - OBJ
      ?auto_102205 - LOCATION
      ?auto_102204 - TRUCK
      ?auto_102203 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102200 ?auto_102199 ) ) ( not ( = ?auto_102201 ?auto_102199 ) ) ( not ( = ?auto_102201 ?auto_102200 ) ) ( IN-CITY ?auto_102207 ?auto_102206 ) ( IN-CITY ?auto_102198 ?auto_102206 ) ( not ( = ?auto_102198 ?auto_102207 ) ) ( OBJ-AT ?auto_102200 ?auto_102207 ) ( not ( = ?auto_102202 ?auto_102201 ) ) ( not ( = ?auto_102200 ?auto_102202 ) ) ( IN-CITY ?auto_102205 ?auto_102206 ) ( not ( = ?auto_102198 ?auto_102205 ) ) ( not ( = ?auto_102207 ?auto_102205 ) ) ( OBJ-AT ?auto_102202 ?auto_102205 ) ( not ( = ?auto_102202 ?auto_102199 ) ) ( OBJ-AT ?auto_102199 ?auto_102207 ) ( TRUCK-AT ?auto_102204 ?auto_102203 ) ( IN-CITY ?auto_102203 ?auto_102206 ) ( not ( = ?auto_102198 ?auto_102203 ) ) ( not ( = ?auto_102207 ?auto_102203 ) ) ( not ( = ?auto_102205 ?auto_102203 ) ) ( OBJ-AT ?auto_102201 ?auto_102203 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102201 ?auto_102200 ?auto_102198 )
      ( DELIVER-3PKG-VERIFY ?auto_102199 ?auto_102200 ?auto_102201 ?auto_102198 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_102220 - OBJ
      ?auto_102221 - OBJ
      ?auto_102222 - OBJ
      ?auto_102219 - LOCATION
    )
    :vars
    (
      ?auto_102228 - OBJ
      ?auto_102227 - LOCATION
      ?auto_102226 - CITY
      ?auto_102225 - LOCATION
      ?auto_102224 - TRUCK
      ?auto_102223 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102221 ?auto_102220 ) ) ( not ( = ?auto_102222 ?auto_102220 ) ) ( not ( = ?auto_102222 ?auto_102221 ) ) ( not ( = ?auto_102221 ?auto_102228 ) ) ( IN-CITY ?auto_102227 ?auto_102226 ) ( IN-CITY ?auto_102219 ?auto_102226 ) ( not ( = ?auto_102219 ?auto_102227 ) ) ( OBJ-AT ?auto_102221 ?auto_102227 ) ( not ( = ?auto_102222 ?auto_102228 ) ) ( IN-CITY ?auto_102225 ?auto_102226 ) ( not ( = ?auto_102219 ?auto_102225 ) ) ( not ( = ?auto_102227 ?auto_102225 ) ) ( OBJ-AT ?auto_102222 ?auto_102225 ) ( not ( = ?auto_102220 ?auto_102228 ) ) ( OBJ-AT ?auto_102220 ?auto_102227 ) ( TRUCK-AT ?auto_102224 ?auto_102223 ) ( IN-CITY ?auto_102223 ?auto_102226 ) ( not ( = ?auto_102219 ?auto_102223 ) ) ( not ( = ?auto_102227 ?auto_102223 ) ) ( not ( = ?auto_102225 ?auto_102223 ) ) ( OBJ-AT ?auto_102228 ?auto_102223 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102228 ?auto_102221 ?auto_102219 )
      ( DELIVER-3PKG-VERIFY ?auto_102220 ?auto_102221 ?auto_102222 ?auto_102219 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_102241 - OBJ
      ?auto_102242 - OBJ
      ?auto_102243 - OBJ
      ?auto_102240 - LOCATION
    )
    :vars
    (
      ?auto_102249 - LOCATION
      ?auto_102248 - CITY
      ?auto_102247 - LOCATION
      ?auto_102245 - OBJ
      ?auto_102246 - TRUCK
      ?auto_102244 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102242 ?auto_102241 ) ) ( not ( = ?auto_102243 ?auto_102241 ) ) ( not ( = ?auto_102243 ?auto_102242 ) ) ( IN-CITY ?auto_102249 ?auto_102248 ) ( IN-CITY ?auto_102240 ?auto_102248 ) ( not ( = ?auto_102240 ?auto_102249 ) ) ( OBJ-AT ?auto_102243 ?auto_102249 ) ( IN-CITY ?auto_102247 ?auto_102248 ) ( not ( = ?auto_102240 ?auto_102247 ) ) ( not ( = ?auto_102249 ?auto_102247 ) ) ( OBJ-AT ?auto_102241 ?auto_102247 ) ( not ( = ?auto_102245 ?auto_102242 ) ) ( not ( = ?auto_102243 ?auto_102245 ) ) ( not ( = ?auto_102241 ?auto_102245 ) ) ( OBJ-AT ?auto_102245 ?auto_102249 ) ( TRUCK-AT ?auto_102246 ?auto_102244 ) ( IN-CITY ?auto_102244 ?auto_102248 ) ( not ( = ?auto_102240 ?auto_102244 ) ) ( not ( = ?auto_102249 ?auto_102244 ) ) ( not ( = ?auto_102247 ?auto_102244 ) ) ( OBJ-AT ?auto_102242 ?auto_102244 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102242 ?auto_102243 ?auto_102240 )
      ( DELIVER-3PKG-VERIFY ?auto_102241 ?auto_102242 ?auto_102243 ?auto_102240 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_102251 - OBJ
      ?auto_102252 - OBJ
      ?auto_102253 - OBJ
      ?auto_102250 - LOCATION
    )
    :vars
    (
      ?auto_102259 - OBJ
      ?auto_102258 - LOCATION
      ?auto_102257 - CITY
      ?auto_102256 - LOCATION
      ?auto_102255 - TRUCK
      ?auto_102254 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102252 ?auto_102251 ) ) ( not ( = ?auto_102253 ?auto_102251 ) ) ( not ( = ?auto_102253 ?auto_102252 ) ) ( not ( = ?auto_102253 ?auto_102259 ) ) ( IN-CITY ?auto_102258 ?auto_102257 ) ( IN-CITY ?auto_102250 ?auto_102257 ) ( not ( = ?auto_102250 ?auto_102258 ) ) ( OBJ-AT ?auto_102253 ?auto_102258 ) ( not ( = ?auto_102251 ?auto_102259 ) ) ( IN-CITY ?auto_102256 ?auto_102257 ) ( not ( = ?auto_102250 ?auto_102256 ) ) ( not ( = ?auto_102258 ?auto_102256 ) ) ( OBJ-AT ?auto_102251 ?auto_102256 ) ( not ( = ?auto_102252 ?auto_102259 ) ) ( OBJ-AT ?auto_102252 ?auto_102258 ) ( TRUCK-AT ?auto_102255 ?auto_102254 ) ( IN-CITY ?auto_102254 ?auto_102257 ) ( not ( = ?auto_102250 ?auto_102254 ) ) ( not ( = ?auto_102258 ?auto_102254 ) ) ( not ( = ?auto_102256 ?auto_102254 ) ) ( OBJ-AT ?auto_102259 ?auto_102254 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102259 ?auto_102253 ?auto_102250 )
      ( DELIVER-3PKG-VERIFY ?auto_102251 ?auto_102252 ?auto_102253 ?auto_102250 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_102272 - OBJ
      ?auto_102273 - OBJ
      ?auto_102274 - OBJ
      ?auto_102271 - LOCATION
    )
    :vars
    (
      ?auto_102280 - LOCATION
      ?auto_102279 - CITY
      ?auto_102278 - LOCATION
      ?auto_102276 - OBJ
      ?auto_102277 - TRUCK
      ?auto_102275 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102273 ?auto_102272 ) ) ( not ( = ?auto_102274 ?auto_102272 ) ) ( not ( = ?auto_102274 ?auto_102273 ) ) ( IN-CITY ?auto_102280 ?auto_102279 ) ( IN-CITY ?auto_102271 ?auto_102279 ) ( not ( = ?auto_102271 ?auto_102280 ) ) ( OBJ-AT ?auto_102273 ?auto_102280 ) ( IN-CITY ?auto_102278 ?auto_102279 ) ( not ( = ?auto_102271 ?auto_102278 ) ) ( not ( = ?auto_102280 ?auto_102278 ) ) ( OBJ-AT ?auto_102272 ?auto_102278 ) ( not ( = ?auto_102276 ?auto_102274 ) ) ( not ( = ?auto_102273 ?auto_102276 ) ) ( not ( = ?auto_102272 ?auto_102276 ) ) ( OBJ-AT ?auto_102276 ?auto_102280 ) ( TRUCK-AT ?auto_102277 ?auto_102275 ) ( IN-CITY ?auto_102275 ?auto_102279 ) ( not ( = ?auto_102271 ?auto_102275 ) ) ( not ( = ?auto_102280 ?auto_102275 ) ) ( not ( = ?auto_102278 ?auto_102275 ) ) ( OBJ-AT ?auto_102274 ?auto_102275 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102274 ?auto_102273 ?auto_102271 )
      ( DELIVER-3PKG-VERIFY ?auto_102272 ?auto_102273 ?auto_102274 ?auto_102271 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_102282 - OBJ
      ?auto_102283 - OBJ
      ?auto_102284 - OBJ
      ?auto_102281 - LOCATION
    )
    :vars
    (
      ?auto_102290 - OBJ
      ?auto_102289 - LOCATION
      ?auto_102288 - CITY
      ?auto_102287 - LOCATION
      ?auto_102286 - TRUCK
      ?auto_102285 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102283 ?auto_102282 ) ) ( not ( = ?auto_102284 ?auto_102282 ) ) ( not ( = ?auto_102284 ?auto_102283 ) ) ( not ( = ?auto_102283 ?auto_102290 ) ) ( IN-CITY ?auto_102289 ?auto_102288 ) ( IN-CITY ?auto_102281 ?auto_102288 ) ( not ( = ?auto_102281 ?auto_102289 ) ) ( OBJ-AT ?auto_102283 ?auto_102289 ) ( not ( = ?auto_102282 ?auto_102290 ) ) ( IN-CITY ?auto_102287 ?auto_102288 ) ( not ( = ?auto_102281 ?auto_102287 ) ) ( not ( = ?auto_102289 ?auto_102287 ) ) ( OBJ-AT ?auto_102282 ?auto_102287 ) ( not ( = ?auto_102284 ?auto_102290 ) ) ( OBJ-AT ?auto_102284 ?auto_102289 ) ( TRUCK-AT ?auto_102286 ?auto_102285 ) ( IN-CITY ?auto_102285 ?auto_102288 ) ( not ( = ?auto_102281 ?auto_102285 ) ) ( not ( = ?auto_102289 ?auto_102285 ) ) ( not ( = ?auto_102287 ?auto_102285 ) ) ( OBJ-AT ?auto_102290 ?auto_102285 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102290 ?auto_102283 ?auto_102281 )
      ( DELIVER-3PKG-VERIFY ?auto_102282 ?auto_102283 ?auto_102284 ?auto_102281 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_102325 - OBJ
      ?auto_102326 - OBJ
      ?auto_102327 - OBJ
      ?auto_102324 - LOCATION
    )
    :vars
    (
      ?auto_102333 - LOCATION
      ?auto_102332 - CITY
      ?auto_102328 - OBJ
      ?auto_102331 - LOCATION
      ?auto_102330 - TRUCK
      ?auto_102329 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102326 ?auto_102325 ) ) ( not ( = ?auto_102327 ?auto_102325 ) ) ( not ( = ?auto_102327 ?auto_102326 ) ) ( IN-CITY ?auto_102333 ?auto_102332 ) ( IN-CITY ?auto_102324 ?auto_102332 ) ( not ( = ?auto_102324 ?auto_102333 ) ) ( OBJ-AT ?auto_102325 ?auto_102333 ) ( not ( = ?auto_102328 ?auto_102326 ) ) ( not ( = ?auto_102325 ?auto_102328 ) ) ( IN-CITY ?auto_102331 ?auto_102332 ) ( not ( = ?auto_102324 ?auto_102331 ) ) ( not ( = ?auto_102333 ?auto_102331 ) ) ( OBJ-AT ?auto_102328 ?auto_102331 ) ( not ( = ?auto_102328 ?auto_102327 ) ) ( OBJ-AT ?auto_102327 ?auto_102333 ) ( TRUCK-AT ?auto_102330 ?auto_102329 ) ( IN-CITY ?auto_102329 ?auto_102332 ) ( not ( = ?auto_102324 ?auto_102329 ) ) ( not ( = ?auto_102333 ?auto_102329 ) ) ( not ( = ?auto_102331 ?auto_102329 ) ) ( OBJ-AT ?auto_102326 ?auto_102329 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102326 ?auto_102325 ?auto_102324 )
      ( DELIVER-3PKG-VERIFY ?auto_102325 ?auto_102326 ?auto_102327 ?auto_102324 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_102335 - OBJ
      ?auto_102336 - OBJ
      ?auto_102337 - OBJ
      ?auto_102334 - LOCATION
    )
    :vars
    (
      ?auto_102343 - LOCATION
      ?auto_102342 - CITY
      ?auto_102341 - LOCATION
      ?auto_102339 - OBJ
      ?auto_102340 - TRUCK
      ?auto_102338 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102336 ?auto_102335 ) ) ( not ( = ?auto_102337 ?auto_102335 ) ) ( not ( = ?auto_102337 ?auto_102336 ) ) ( IN-CITY ?auto_102343 ?auto_102342 ) ( IN-CITY ?auto_102334 ?auto_102342 ) ( not ( = ?auto_102334 ?auto_102343 ) ) ( OBJ-AT ?auto_102335 ?auto_102343 ) ( IN-CITY ?auto_102341 ?auto_102342 ) ( not ( = ?auto_102334 ?auto_102341 ) ) ( not ( = ?auto_102343 ?auto_102341 ) ) ( OBJ-AT ?auto_102337 ?auto_102341 ) ( not ( = ?auto_102339 ?auto_102336 ) ) ( not ( = ?auto_102335 ?auto_102339 ) ) ( not ( = ?auto_102337 ?auto_102339 ) ) ( OBJ-AT ?auto_102339 ?auto_102343 ) ( TRUCK-AT ?auto_102340 ?auto_102338 ) ( IN-CITY ?auto_102338 ?auto_102342 ) ( not ( = ?auto_102334 ?auto_102338 ) ) ( not ( = ?auto_102343 ?auto_102338 ) ) ( not ( = ?auto_102341 ?auto_102338 ) ) ( OBJ-AT ?auto_102336 ?auto_102338 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102336 ?auto_102335 ?auto_102334 )
      ( DELIVER-3PKG-VERIFY ?auto_102335 ?auto_102336 ?auto_102337 ?auto_102334 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_102356 - OBJ
      ?auto_102357 - OBJ
      ?auto_102358 - OBJ
      ?auto_102355 - LOCATION
    )
    :vars
    (
      ?auto_102364 - LOCATION
      ?auto_102363 - CITY
      ?auto_102359 - OBJ
      ?auto_102362 - LOCATION
      ?auto_102361 - TRUCK
      ?auto_102360 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102357 ?auto_102356 ) ) ( not ( = ?auto_102358 ?auto_102356 ) ) ( not ( = ?auto_102358 ?auto_102357 ) ) ( IN-CITY ?auto_102364 ?auto_102363 ) ( IN-CITY ?auto_102355 ?auto_102363 ) ( not ( = ?auto_102355 ?auto_102364 ) ) ( OBJ-AT ?auto_102356 ?auto_102364 ) ( not ( = ?auto_102359 ?auto_102358 ) ) ( not ( = ?auto_102356 ?auto_102359 ) ) ( IN-CITY ?auto_102362 ?auto_102363 ) ( not ( = ?auto_102355 ?auto_102362 ) ) ( not ( = ?auto_102364 ?auto_102362 ) ) ( OBJ-AT ?auto_102359 ?auto_102362 ) ( not ( = ?auto_102359 ?auto_102357 ) ) ( OBJ-AT ?auto_102357 ?auto_102364 ) ( TRUCK-AT ?auto_102361 ?auto_102360 ) ( IN-CITY ?auto_102360 ?auto_102363 ) ( not ( = ?auto_102355 ?auto_102360 ) ) ( not ( = ?auto_102364 ?auto_102360 ) ) ( not ( = ?auto_102362 ?auto_102360 ) ) ( OBJ-AT ?auto_102358 ?auto_102360 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102358 ?auto_102356 ?auto_102355 )
      ( DELIVER-3PKG-VERIFY ?auto_102356 ?auto_102357 ?auto_102358 ?auto_102355 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_102377 - OBJ
      ?auto_102378 - OBJ
      ?auto_102379 - OBJ
      ?auto_102376 - LOCATION
    )
    :vars
    (
      ?auto_102385 - OBJ
      ?auto_102384 - LOCATION
      ?auto_102383 - CITY
      ?auto_102382 - LOCATION
      ?auto_102381 - TRUCK
      ?auto_102380 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102378 ?auto_102377 ) ) ( not ( = ?auto_102379 ?auto_102377 ) ) ( not ( = ?auto_102379 ?auto_102378 ) ) ( not ( = ?auto_102377 ?auto_102385 ) ) ( IN-CITY ?auto_102384 ?auto_102383 ) ( IN-CITY ?auto_102376 ?auto_102383 ) ( not ( = ?auto_102376 ?auto_102384 ) ) ( OBJ-AT ?auto_102377 ?auto_102384 ) ( not ( = ?auto_102379 ?auto_102385 ) ) ( IN-CITY ?auto_102382 ?auto_102383 ) ( not ( = ?auto_102376 ?auto_102382 ) ) ( not ( = ?auto_102384 ?auto_102382 ) ) ( OBJ-AT ?auto_102379 ?auto_102382 ) ( not ( = ?auto_102378 ?auto_102385 ) ) ( OBJ-AT ?auto_102378 ?auto_102384 ) ( TRUCK-AT ?auto_102381 ?auto_102380 ) ( IN-CITY ?auto_102380 ?auto_102383 ) ( not ( = ?auto_102376 ?auto_102380 ) ) ( not ( = ?auto_102384 ?auto_102380 ) ) ( not ( = ?auto_102382 ?auto_102380 ) ) ( OBJ-AT ?auto_102385 ?auto_102380 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102385 ?auto_102377 ?auto_102376 )
      ( DELIVER-3PKG-VERIFY ?auto_102377 ?auto_102378 ?auto_102379 ?auto_102376 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_102398 - OBJ
      ?auto_102399 - OBJ
      ?auto_102400 - OBJ
      ?auto_102397 - LOCATION
    )
    :vars
    (
      ?auto_102406 - LOCATION
      ?auto_102405 - CITY
      ?auto_102404 - LOCATION
      ?auto_102402 - OBJ
      ?auto_102403 - TRUCK
      ?auto_102401 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102399 ?auto_102398 ) ) ( not ( = ?auto_102400 ?auto_102398 ) ) ( not ( = ?auto_102400 ?auto_102399 ) ) ( IN-CITY ?auto_102406 ?auto_102405 ) ( IN-CITY ?auto_102397 ?auto_102405 ) ( not ( = ?auto_102397 ?auto_102406 ) ) ( OBJ-AT ?auto_102398 ?auto_102406 ) ( IN-CITY ?auto_102404 ?auto_102405 ) ( not ( = ?auto_102397 ?auto_102404 ) ) ( not ( = ?auto_102406 ?auto_102404 ) ) ( OBJ-AT ?auto_102399 ?auto_102404 ) ( not ( = ?auto_102402 ?auto_102400 ) ) ( not ( = ?auto_102398 ?auto_102402 ) ) ( not ( = ?auto_102399 ?auto_102402 ) ) ( OBJ-AT ?auto_102402 ?auto_102406 ) ( TRUCK-AT ?auto_102403 ?auto_102401 ) ( IN-CITY ?auto_102401 ?auto_102405 ) ( not ( = ?auto_102397 ?auto_102401 ) ) ( not ( = ?auto_102406 ?auto_102401 ) ) ( not ( = ?auto_102404 ?auto_102401 ) ) ( OBJ-AT ?auto_102400 ?auto_102401 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102400 ?auto_102398 ?auto_102397 )
      ( DELIVER-3PKG-VERIFY ?auto_102398 ?auto_102399 ?auto_102400 ?auto_102397 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_102408 - OBJ
      ?auto_102409 - OBJ
      ?auto_102410 - OBJ
      ?auto_102407 - LOCATION
    )
    :vars
    (
      ?auto_102416 - OBJ
      ?auto_102415 - LOCATION
      ?auto_102414 - CITY
      ?auto_102413 - LOCATION
      ?auto_102412 - TRUCK
      ?auto_102411 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102409 ?auto_102408 ) ) ( not ( = ?auto_102410 ?auto_102408 ) ) ( not ( = ?auto_102410 ?auto_102409 ) ) ( not ( = ?auto_102408 ?auto_102416 ) ) ( IN-CITY ?auto_102415 ?auto_102414 ) ( IN-CITY ?auto_102407 ?auto_102414 ) ( not ( = ?auto_102407 ?auto_102415 ) ) ( OBJ-AT ?auto_102408 ?auto_102415 ) ( not ( = ?auto_102409 ?auto_102416 ) ) ( IN-CITY ?auto_102413 ?auto_102414 ) ( not ( = ?auto_102407 ?auto_102413 ) ) ( not ( = ?auto_102415 ?auto_102413 ) ) ( OBJ-AT ?auto_102409 ?auto_102413 ) ( not ( = ?auto_102410 ?auto_102416 ) ) ( OBJ-AT ?auto_102410 ?auto_102415 ) ( TRUCK-AT ?auto_102412 ?auto_102411 ) ( IN-CITY ?auto_102411 ?auto_102414 ) ( not ( = ?auto_102407 ?auto_102411 ) ) ( not ( = ?auto_102415 ?auto_102411 ) ) ( not ( = ?auto_102413 ?auto_102411 ) ) ( OBJ-AT ?auto_102416 ?auto_102411 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102416 ?auto_102408 ?auto_102407 )
      ( DELIVER-3PKG-VERIFY ?auto_102408 ?auto_102409 ?auto_102410 ?auto_102407 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_102587 - OBJ
      ?auto_102588 - OBJ
      ?auto_102589 - OBJ
      ?auto_102590 - OBJ
      ?auto_102586 - LOCATION
    )
    :vars
    (
      ?auto_102595 - LOCATION
      ?auto_102594 - CITY
      ?auto_102593 - LOCATION
      ?auto_102592 - TRUCK
      ?auto_102591 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102588 ?auto_102587 ) ) ( not ( = ?auto_102589 ?auto_102587 ) ) ( not ( = ?auto_102589 ?auto_102588 ) ) ( not ( = ?auto_102590 ?auto_102587 ) ) ( not ( = ?auto_102590 ?auto_102588 ) ) ( not ( = ?auto_102590 ?auto_102589 ) ) ( IN-CITY ?auto_102595 ?auto_102594 ) ( IN-CITY ?auto_102586 ?auto_102594 ) ( not ( = ?auto_102586 ?auto_102595 ) ) ( OBJ-AT ?auto_102590 ?auto_102595 ) ( IN-CITY ?auto_102593 ?auto_102594 ) ( not ( = ?auto_102586 ?auto_102593 ) ) ( not ( = ?auto_102595 ?auto_102593 ) ) ( OBJ-AT ?auto_102589 ?auto_102593 ) ( OBJ-AT ?auto_102588 ?auto_102595 ) ( TRUCK-AT ?auto_102592 ?auto_102591 ) ( IN-CITY ?auto_102591 ?auto_102594 ) ( not ( = ?auto_102586 ?auto_102591 ) ) ( not ( = ?auto_102595 ?auto_102591 ) ) ( not ( = ?auto_102593 ?auto_102591 ) ) ( OBJ-AT ?auto_102587 ?auto_102591 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102587 ?auto_102590 ?auto_102586 )
      ( DELIVER-4PKG-VERIFY ?auto_102587 ?auto_102588 ?auto_102589 ?auto_102590 ?auto_102586 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_102619 - OBJ
      ?auto_102620 - OBJ
      ?auto_102621 - OBJ
      ?auto_102622 - OBJ
      ?auto_102618 - LOCATION
    )
    :vars
    (
      ?auto_102627 - LOCATION
      ?auto_102626 - CITY
      ?auto_102625 - LOCATION
      ?auto_102624 - TRUCK
      ?auto_102623 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102620 ?auto_102619 ) ) ( not ( = ?auto_102621 ?auto_102619 ) ) ( not ( = ?auto_102621 ?auto_102620 ) ) ( not ( = ?auto_102622 ?auto_102619 ) ) ( not ( = ?auto_102622 ?auto_102620 ) ) ( not ( = ?auto_102622 ?auto_102621 ) ) ( IN-CITY ?auto_102627 ?auto_102626 ) ( IN-CITY ?auto_102618 ?auto_102626 ) ( not ( = ?auto_102618 ?auto_102627 ) ) ( OBJ-AT ?auto_102621 ?auto_102627 ) ( IN-CITY ?auto_102625 ?auto_102626 ) ( not ( = ?auto_102618 ?auto_102625 ) ) ( not ( = ?auto_102627 ?auto_102625 ) ) ( OBJ-AT ?auto_102622 ?auto_102625 ) ( OBJ-AT ?auto_102620 ?auto_102627 ) ( TRUCK-AT ?auto_102624 ?auto_102623 ) ( IN-CITY ?auto_102623 ?auto_102626 ) ( not ( = ?auto_102618 ?auto_102623 ) ) ( not ( = ?auto_102627 ?auto_102623 ) ) ( not ( = ?auto_102625 ?auto_102623 ) ) ( OBJ-AT ?auto_102619 ?auto_102623 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102619 ?auto_102621 ?auto_102618 )
      ( DELIVER-4PKG-VERIFY ?auto_102619 ?auto_102620 ?auto_102621 ?auto_102622 ?auto_102618 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_102651 - OBJ
      ?auto_102652 - OBJ
      ?auto_102653 - OBJ
      ?auto_102654 - OBJ
      ?auto_102650 - LOCATION
    )
    :vars
    (
      ?auto_102659 - LOCATION
      ?auto_102658 - CITY
      ?auto_102657 - LOCATION
      ?auto_102656 - TRUCK
      ?auto_102655 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102652 ?auto_102651 ) ) ( not ( = ?auto_102653 ?auto_102651 ) ) ( not ( = ?auto_102653 ?auto_102652 ) ) ( not ( = ?auto_102654 ?auto_102651 ) ) ( not ( = ?auto_102654 ?auto_102652 ) ) ( not ( = ?auto_102654 ?auto_102653 ) ) ( IN-CITY ?auto_102659 ?auto_102658 ) ( IN-CITY ?auto_102650 ?auto_102658 ) ( not ( = ?auto_102650 ?auto_102659 ) ) ( OBJ-AT ?auto_102654 ?auto_102659 ) ( IN-CITY ?auto_102657 ?auto_102658 ) ( not ( = ?auto_102650 ?auto_102657 ) ) ( not ( = ?auto_102659 ?auto_102657 ) ) ( OBJ-AT ?auto_102652 ?auto_102657 ) ( OBJ-AT ?auto_102653 ?auto_102659 ) ( TRUCK-AT ?auto_102656 ?auto_102655 ) ( IN-CITY ?auto_102655 ?auto_102658 ) ( not ( = ?auto_102650 ?auto_102655 ) ) ( not ( = ?auto_102659 ?auto_102655 ) ) ( not ( = ?auto_102657 ?auto_102655 ) ) ( OBJ-AT ?auto_102651 ?auto_102655 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102651 ?auto_102654 ?auto_102650 )
      ( DELIVER-4PKG-VERIFY ?auto_102651 ?auto_102652 ?auto_102653 ?auto_102654 ?auto_102650 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_102683 - OBJ
      ?auto_102684 - OBJ
      ?auto_102685 - OBJ
      ?auto_102686 - OBJ
      ?auto_102682 - LOCATION
    )
    :vars
    (
      ?auto_102691 - LOCATION
      ?auto_102690 - CITY
      ?auto_102689 - LOCATION
      ?auto_102688 - TRUCK
      ?auto_102687 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102684 ?auto_102683 ) ) ( not ( = ?auto_102685 ?auto_102683 ) ) ( not ( = ?auto_102685 ?auto_102684 ) ) ( not ( = ?auto_102686 ?auto_102683 ) ) ( not ( = ?auto_102686 ?auto_102684 ) ) ( not ( = ?auto_102686 ?auto_102685 ) ) ( IN-CITY ?auto_102691 ?auto_102690 ) ( IN-CITY ?auto_102682 ?auto_102690 ) ( not ( = ?auto_102682 ?auto_102691 ) ) ( OBJ-AT ?auto_102685 ?auto_102691 ) ( IN-CITY ?auto_102689 ?auto_102690 ) ( not ( = ?auto_102682 ?auto_102689 ) ) ( not ( = ?auto_102691 ?auto_102689 ) ) ( OBJ-AT ?auto_102684 ?auto_102689 ) ( OBJ-AT ?auto_102686 ?auto_102691 ) ( TRUCK-AT ?auto_102688 ?auto_102687 ) ( IN-CITY ?auto_102687 ?auto_102690 ) ( not ( = ?auto_102682 ?auto_102687 ) ) ( not ( = ?auto_102691 ?auto_102687 ) ) ( not ( = ?auto_102689 ?auto_102687 ) ) ( OBJ-AT ?auto_102683 ?auto_102687 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102683 ?auto_102685 ?auto_102682 )
      ( DELIVER-4PKG-VERIFY ?auto_102683 ?auto_102684 ?auto_102685 ?auto_102686 ?auto_102682 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_102783 - OBJ
      ?auto_102784 - OBJ
      ?auto_102785 - OBJ
      ?auto_102786 - OBJ
      ?auto_102782 - LOCATION
    )
    :vars
    (
      ?auto_102791 - LOCATION
      ?auto_102790 - CITY
      ?auto_102789 - LOCATION
      ?auto_102788 - TRUCK
      ?auto_102787 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102784 ?auto_102783 ) ) ( not ( = ?auto_102785 ?auto_102783 ) ) ( not ( = ?auto_102785 ?auto_102784 ) ) ( not ( = ?auto_102786 ?auto_102783 ) ) ( not ( = ?auto_102786 ?auto_102784 ) ) ( not ( = ?auto_102786 ?auto_102785 ) ) ( IN-CITY ?auto_102791 ?auto_102790 ) ( IN-CITY ?auto_102782 ?auto_102790 ) ( not ( = ?auto_102782 ?auto_102791 ) ) ( OBJ-AT ?auto_102784 ?auto_102791 ) ( IN-CITY ?auto_102789 ?auto_102790 ) ( not ( = ?auto_102782 ?auto_102789 ) ) ( not ( = ?auto_102791 ?auto_102789 ) ) ( OBJ-AT ?auto_102786 ?auto_102789 ) ( OBJ-AT ?auto_102785 ?auto_102791 ) ( TRUCK-AT ?auto_102788 ?auto_102787 ) ( IN-CITY ?auto_102787 ?auto_102790 ) ( not ( = ?auto_102782 ?auto_102787 ) ) ( not ( = ?auto_102791 ?auto_102787 ) ) ( not ( = ?auto_102789 ?auto_102787 ) ) ( OBJ-AT ?auto_102783 ?auto_102787 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102783 ?auto_102784 ?auto_102782 )
      ( DELIVER-4PKG-VERIFY ?auto_102783 ?auto_102784 ?auto_102785 ?auto_102786 ?auto_102782 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_102815 - OBJ
      ?auto_102816 - OBJ
      ?auto_102817 - OBJ
      ?auto_102818 - OBJ
      ?auto_102814 - LOCATION
    )
    :vars
    (
      ?auto_102823 - LOCATION
      ?auto_102822 - CITY
      ?auto_102821 - LOCATION
      ?auto_102820 - TRUCK
      ?auto_102819 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102816 ?auto_102815 ) ) ( not ( = ?auto_102817 ?auto_102815 ) ) ( not ( = ?auto_102817 ?auto_102816 ) ) ( not ( = ?auto_102818 ?auto_102815 ) ) ( not ( = ?auto_102818 ?auto_102816 ) ) ( not ( = ?auto_102818 ?auto_102817 ) ) ( IN-CITY ?auto_102823 ?auto_102822 ) ( IN-CITY ?auto_102814 ?auto_102822 ) ( not ( = ?auto_102814 ?auto_102823 ) ) ( OBJ-AT ?auto_102816 ?auto_102823 ) ( IN-CITY ?auto_102821 ?auto_102822 ) ( not ( = ?auto_102814 ?auto_102821 ) ) ( not ( = ?auto_102823 ?auto_102821 ) ) ( OBJ-AT ?auto_102817 ?auto_102821 ) ( OBJ-AT ?auto_102818 ?auto_102823 ) ( TRUCK-AT ?auto_102820 ?auto_102819 ) ( IN-CITY ?auto_102819 ?auto_102822 ) ( not ( = ?auto_102814 ?auto_102819 ) ) ( not ( = ?auto_102823 ?auto_102819 ) ) ( not ( = ?auto_102821 ?auto_102819 ) ) ( OBJ-AT ?auto_102815 ?auto_102819 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102815 ?auto_102816 ?auto_102814 )
      ( DELIVER-4PKG-VERIFY ?auto_102815 ?auto_102816 ?auto_102817 ?auto_102818 ?auto_102814 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_102915 - OBJ
      ?auto_102916 - OBJ
      ?auto_102917 - OBJ
      ?auto_102918 - OBJ
      ?auto_102914 - LOCATION
    )
    :vars
    (
      ?auto_102923 - LOCATION
      ?auto_102922 - CITY
      ?auto_102921 - LOCATION
      ?auto_102920 - TRUCK
      ?auto_102919 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102916 ?auto_102915 ) ) ( not ( = ?auto_102917 ?auto_102915 ) ) ( not ( = ?auto_102917 ?auto_102916 ) ) ( not ( = ?auto_102918 ?auto_102915 ) ) ( not ( = ?auto_102918 ?auto_102916 ) ) ( not ( = ?auto_102918 ?auto_102917 ) ) ( IN-CITY ?auto_102923 ?auto_102922 ) ( IN-CITY ?auto_102914 ?auto_102922 ) ( not ( = ?auto_102914 ?auto_102923 ) ) ( OBJ-AT ?auto_102918 ?auto_102923 ) ( IN-CITY ?auto_102921 ?auto_102922 ) ( not ( = ?auto_102914 ?auto_102921 ) ) ( not ( = ?auto_102923 ?auto_102921 ) ) ( OBJ-AT ?auto_102917 ?auto_102921 ) ( OBJ-AT ?auto_102915 ?auto_102923 ) ( TRUCK-AT ?auto_102920 ?auto_102919 ) ( IN-CITY ?auto_102919 ?auto_102922 ) ( not ( = ?auto_102914 ?auto_102919 ) ) ( not ( = ?auto_102923 ?auto_102919 ) ) ( not ( = ?auto_102921 ?auto_102919 ) ) ( OBJ-AT ?auto_102916 ?auto_102919 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102916 ?auto_102918 ?auto_102914 )
      ( DELIVER-4PKG-VERIFY ?auto_102915 ?auto_102916 ?auto_102917 ?auto_102918 ?auto_102914 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_102947 - OBJ
      ?auto_102948 - OBJ
      ?auto_102949 - OBJ
      ?auto_102950 - OBJ
      ?auto_102946 - LOCATION
    )
    :vars
    (
      ?auto_102955 - LOCATION
      ?auto_102954 - CITY
      ?auto_102953 - LOCATION
      ?auto_102952 - TRUCK
      ?auto_102951 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_102948 ?auto_102947 ) ) ( not ( = ?auto_102949 ?auto_102947 ) ) ( not ( = ?auto_102949 ?auto_102948 ) ) ( not ( = ?auto_102950 ?auto_102947 ) ) ( not ( = ?auto_102950 ?auto_102948 ) ) ( not ( = ?auto_102950 ?auto_102949 ) ) ( IN-CITY ?auto_102955 ?auto_102954 ) ( IN-CITY ?auto_102946 ?auto_102954 ) ( not ( = ?auto_102946 ?auto_102955 ) ) ( OBJ-AT ?auto_102949 ?auto_102955 ) ( IN-CITY ?auto_102953 ?auto_102954 ) ( not ( = ?auto_102946 ?auto_102953 ) ) ( not ( = ?auto_102955 ?auto_102953 ) ) ( OBJ-AT ?auto_102950 ?auto_102953 ) ( OBJ-AT ?auto_102947 ?auto_102955 ) ( TRUCK-AT ?auto_102952 ?auto_102951 ) ( IN-CITY ?auto_102951 ?auto_102954 ) ( not ( = ?auto_102946 ?auto_102951 ) ) ( not ( = ?auto_102955 ?auto_102951 ) ) ( not ( = ?auto_102953 ?auto_102951 ) ) ( OBJ-AT ?auto_102948 ?auto_102951 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102948 ?auto_102949 ?auto_102946 )
      ( DELIVER-4PKG-VERIFY ?auto_102947 ?auto_102948 ?auto_102949 ?auto_102950 ?auto_102946 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_103048 - OBJ
      ?auto_103049 - OBJ
      ?auto_103050 - OBJ
      ?auto_103051 - OBJ
      ?auto_103047 - LOCATION
    )
    :vars
    (
      ?auto_103056 - LOCATION
      ?auto_103055 - CITY
      ?auto_103054 - LOCATION
      ?auto_103053 - TRUCK
      ?auto_103052 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_103049 ?auto_103048 ) ) ( not ( = ?auto_103050 ?auto_103048 ) ) ( not ( = ?auto_103050 ?auto_103049 ) ) ( not ( = ?auto_103051 ?auto_103048 ) ) ( not ( = ?auto_103051 ?auto_103049 ) ) ( not ( = ?auto_103051 ?auto_103050 ) ) ( IN-CITY ?auto_103056 ?auto_103055 ) ( IN-CITY ?auto_103047 ?auto_103055 ) ( not ( = ?auto_103047 ?auto_103056 ) ) ( OBJ-AT ?auto_103051 ?auto_103056 ) ( IN-CITY ?auto_103054 ?auto_103055 ) ( not ( = ?auto_103047 ?auto_103054 ) ) ( not ( = ?auto_103056 ?auto_103054 ) ) ( OBJ-AT ?auto_103049 ?auto_103054 ) ( OBJ-AT ?auto_103048 ?auto_103056 ) ( TRUCK-AT ?auto_103053 ?auto_103052 ) ( IN-CITY ?auto_103052 ?auto_103055 ) ( not ( = ?auto_103047 ?auto_103052 ) ) ( not ( = ?auto_103056 ?auto_103052 ) ) ( not ( = ?auto_103054 ?auto_103052 ) ) ( OBJ-AT ?auto_103050 ?auto_103052 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_103050 ?auto_103051 ?auto_103047 )
      ( DELIVER-4PKG-VERIFY ?auto_103048 ?auto_103049 ?auto_103050 ?auto_103051 ?auto_103047 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_103080 - OBJ
      ?auto_103081 - OBJ
      ?auto_103082 - OBJ
      ?auto_103083 - OBJ
      ?auto_103079 - LOCATION
    )
    :vars
    (
      ?auto_103088 - LOCATION
      ?auto_103087 - CITY
      ?auto_103086 - LOCATION
      ?auto_103085 - TRUCK
      ?auto_103084 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_103081 ?auto_103080 ) ) ( not ( = ?auto_103082 ?auto_103080 ) ) ( not ( = ?auto_103082 ?auto_103081 ) ) ( not ( = ?auto_103083 ?auto_103080 ) ) ( not ( = ?auto_103083 ?auto_103081 ) ) ( not ( = ?auto_103083 ?auto_103082 ) ) ( IN-CITY ?auto_103088 ?auto_103087 ) ( IN-CITY ?auto_103079 ?auto_103087 ) ( not ( = ?auto_103079 ?auto_103088 ) ) ( OBJ-AT ?auto_103082 ?auto_103088 ) ( IN-CITY ?auto_103086 ?auto_103087 ) ( not ( = ?auto_103079 ?auto_103086 ) ) ( not ( = ?auto_103088 ?auto_103086 ) ) ( OBJ-AT ?auto_103081 ?auto_103086 ) ( OBJ-AT ?auto_103080 ?auto_103088 ) ( TRUCK-AT ?auto_103085 ?auto_103084 ) ( IN-CITY ?auto_103084 ?auto_103087 ) ( not ( = ?auto_103079 ?auto_103084 ) ) ( not ( = ?auto_103088 ?auto_103084 ) ) ( not ( = ?auto_103086 ?auto_103084 ) ) ( OBJ-AT ?auto_103083 ?auto_103084 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_103083 ?auto_103082 ?auto_103079 )
      ( DELIVER-4PKG-VERIFY ?auto_103080 ?auto_103081 ?auto_103082 ?auto_103083 ?auto_103079 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_103145 - OBJ
      ?auto_103146 - OBJ
      ?auto_103147 - OBJ
      ?auto_103148 - OBJ
      ?auto_103144 - LOCATION
    )
    :vars
    (
      ?auto_103153 - LOCATION
      ?auto_103152 - CITY
      ?auto_103151 - LOCATION
      ?auto_103150 - TRUCK
      ?auto_103149 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_103146 ?auto_103145 ) ) ( not ( = ?auto_103147 ?auto_103145 ) ) ( not ( = ?auto_103147 ?auto_103146 ) ) ( not ( = ?auto_103148 ?auto_103145 ) ) ( not ( = ?auto_103148 ?auto_103146 ) ) ( not ( = ?auto_103148 ?auto_103147 ) ) ( IN-CITY ?auto_103153 ?auto_103152 ) ( IN-CITY ?auto_103144 ?auto_103152 ) ( not ( = ?auto_103144 ?auto_103153 ) ) ( OBJ-AT ?auto_103146 ?auto_103153 ) ( IN-CITY ?auto_103151 ?auto_103152 ) ( not ( = ?auto_103144 ?auto_103151 ) ) ( not ( = ?auto_103153 ?auto_103151 ) ) ( OBJ-AT ?auto_103148 ?auto_103151 ) ( OBJ-AT ?auto_103145 ?auto_103153 ) ( TRUCK-AT ?auto_103150 ?auto_103149 ) ( IN-CITY ?auto_103149 ?auto_103152 ) ( not ( = ?auto_103144 ?auto_103149 ) ) ( not ( = ?auto_103153 ?auto_103149 ) ) ( not ( = ?auto_103151 ?auto_103149 ) ) ( OBJ-AT ?auto_103147 ?auto_103149 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_103147 ?auto_103146 ?auto_103144 )
      ( DELIVER-4PKG-VERIFY ?auto_103145 ?auto_103146 ?auto_103147 ?auto_103148 ?auto_103144 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_103212 - OBJ
      ?auto_103213 - OBJ
      ?auto_103214 - OBJ
      ?auto_103215 - OBJ
      ?auto_103211 - LOCATION
    )
    :vars
    (
      ?auto_103220 - LOCATION
      ?auto_103219 - CITY
      ?auto_103218 - LOCATION
      ?auto_103217 - TRUCK
      ?auto_103216 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_103213 ?auto_103212 ) ) ( not ( = ?auto_103214 ?auto_103212 ) ) ( not ( = ?auto_103214 ?auto_103213 ) ) ( not ( = ?auto_103215 ?auto_103212 ) ) ( not ( = ?auto_103215 ?auto_103213 ) ) ( not ( = ?auto_103215 ?auto_103214 ) ) ( IN-CITY ?auto_103220 ?auto_103219 ) ( IN-CITY ?auto_103211 ?auto_103219 ) ( not ( = ?auto_103211 ?auto_103220 ) ) ( OBJ-AT ?auto_103213 ?auto_103220 ) ( IN-CITY ?auto_103218 ?auto_103219 ) ( not ( = ?auto_103211 ?auto_103218 ) ) ( not ( = ?auto_103220 ?auto_103218 ) ) ( OBJ-AT ?auto_103214 ?auto_103218 ) ( OBJ-AT ?auto_103212 ?auto_103220 ) ( TRUCK-AT ?auto_103217 ?auto_103216 ) ( IN-CITY ?auto_103216 ?auto_103219 ) ( not ( = ?auto_103211 ?auto_103216 ) ) ( not ( = ?auto_103220 ?auto_103216 ) ) ( not ( = ?auto_103218 ?auto_103216 ) ) ( OBJ-AT ?auto_103215 ?auto_103216 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_103215 ?auto_103213 ?auto_103211 )
      ( DELIVER-4PKG-VERIFY ?auto_103212 ?auto_103213 ?auto_103214 ?auto_103215 ?auto_103211 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_103312 - OBJ
      ?auto_103313 - OBJ
      ?auto_103314 - OBJ
      ?auto_103315 - OBJ
      ?auto_103311 - LOCATION
    )
    :vars
    (
      ?auto_103320 - LOCATION
      ?auto_103319 - CITY
      ?auto_103318 - LOCATION
      ?auto_103317 - TRUCK
      ?auto_103316 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_103313 ?auto_103312 ) ) ( not ( = ?auto_103314 ?auto_103312 ) ) ( not ( = ?auto_103314 ?auto_103313 ) ) ( not ( = ?auto_103315 ?auto_103312 ) ) ( not ( = ?auto_103315 ?auto_103313 ) ) ( not ( = ?auto_103315 ?auto_103314 ) ) ( IN-CITY ?auto_103320 ?auto_103319 ) ( IN-CITY ?auto_103311 ?auto_103319 ) ( not ( = ?auto_103311 ?auto_103320 ) ) ( OBJ-AT ?auto_103315 ?auto_103320 ) ( IN-CITY ?auto_103318 ?auto_103319 ) ( not ( = ?auto_103311 ?auto_103318 ) ) ( not ( = ?auto_103320 ?auto_103318 ) ) ( OBJ-AT ?auto_103312 ?auto_103318 ) ( OBJ-AT ?auto_103314 ?auto_103320 ) ( TRUCK-AT ?auto_103317 ?auto_103316 ) ( IN-CITY ?auto_103316 ?auto_103319 ) ( not ( = ?auto_103311 ?auto_103316 ) ) ( not ( = ?auto_103320 ?auto_103316 ) ) ( not ( = ?auto_103318 ?auto_103316 ) ) ( OBJ-AT ?auto_103313 ?auto_103316 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_103313 ?auto_103315 ?auto_103311 )
      ( DELIVER-4PKG-VERIFY ?auto_103312 ?auto_103313 ?auto_103314 ?auto_103315 ?auto_103311 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_103344 - OBJ
      ?auto_103345 - OBJ
      ?auto_103346 - OBJ
      ?auto_103347 - OBJ
      ?auto_103343 - LOCATION
    )
    :vars
    (
      ?auto_103352 - LOCATION
      ?auto_103351 - CITY
      ?auto_103350 - LOCATION
      ?auto_103349 - TRUCK
      ?auto_103348 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_103345 ?auto_103344 ) ) ( not ( = ?auto_103346 ?auto_103344 ) ) ( not ( = ?auto_103346 ?auto_103345 ) ) ( not ( = ?auto_103347 ?auto_103344 ) ) ( not ( = ?auto_103347 ?auto_103345 ) ) ( not ( = ?auto_103347 ?auto_103346 ) ) ( IN-CITY ?auto_103352 ?auto_103351 ) ( IN-CITY ?auto_103343 ?auto_103351 ) ( not ( = ?auto_103343 ?auto_103352 ) ) ( OBJ-AT ?auto_103346 ?auto_103352 ) ( IN-CITY ?auto_103350 ?auto_103351 ) ( not ( = ?auto_103343 ?auto_103350 ) ) ( not ( = ?auto_103352 ?auto_103350 ) ) ( OBJ-AT ?auto_103344 ?auto_103350 ) ( OBJ-AT ?auto_103347 ?auto_103352 ) ( TRUCK-AT ?auto_103349 ?auto_103348 ) ( IN-CITY ?auto_103348 ?auto_103351 ) ( not ( = ?auto_103343 ?auto_103348 ) ) ( not ( = ?auto_103352 ?auto_103348 ) ) ( not ( = ?auto_103350 ?auto_103348 ) ) ( OBJ-AT ?auto_103345 ?auto_103348 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_103345 ?auto_103346 ?auto_103343 )
      ( DELIVER-4PKG-VERIFY ?auto_103344 ?auto_103345 ?auto_103346 ?auto_103347 ?auto_103343 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_103376 - OBJ
      ?auto_103377 - OBJ
      ?auto_103378 - OBJ
      ?auto_103379 - OBJ
      ?auto_103375 - LOCATION
    )
    :vars
    (
      ?auto_103384 - LOCATION
      ?auto_103383 - CITY
      ?auto_103382 - LOCATION
      ?auto_103381 - TRUCK
      ?auto_103380 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_103377 ?auto_103376 ) ) ( not ( = ?auto_103378 ?auto_103376 ) ) ( not ( = ?auto_103378 ?auto_103377 ) ) ( not ( = ?auto_103379 ?auto_103376 ) ) ( not ( = ?auto_103379 ?auto_103377 ) ) ( not ( = ?auto_103379 ?auto_103378 ) ) ( IN-CITY ?auto_103384 ?auto_103383 ) ( IN-CITY ?auto_103375 ?auto_103383 ) ( not ( = ?auto_103375 ?auto_103384 ) ) ( OBJ-AT ?auto_103379 ?auto_103384 ) ( IN-CITY ?auto_103382 ?auto_103383 ) ( not ( = ?auto_103375 ?auto_103382 ) ) ( not ( = ?auto_103384 ?auto_103382 ) ) ( OBJ-AT ?auto_103376 ?auto_103382 ) ( OBJ-AT ?auto_103377 ?auto_103384 ) ( TRUCK-AT ?auto_103381 ?auto_103380 ) ( IN-CITY ?auto_103380 ?auto_103383 ) ( not ( = ?auto_103375 ?auto_103380 ) ) ( not ( = ?auto_103384 ?auto_103380 ) ) ( not ( = ?auto_103382 ?auto_103380 ) ) ( OBJ-AT ?auto_103378 ?auto_103380 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_103378 ?auto_103379 ?auto_103375 )
      ( DELIVER-4PKG-VERIFY ?auto_103376 ?auto_103377 ?auto_103378 ?auto_103379 ?auto_103375 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_103408 - OBJ
      ?auto_103409 - OBJ
      ?auto_103410 - OBJ
      ?auto_103411 - OBJ
      ?auto_103407 - LOCATION
    )
    :vars
    (
      ?auto_103416 - LOCATION
      ?auto_103415 - CITY
      ?auto_103414 - LOCATION
      ?auto_103413 - TRUCK
      ?auto_103412 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_103409 ?auto_103408 ) ) ( not ( = ?auto_103410 ?auto_103408 ) ) ( not ( = ?auto_103410 ?auto_103409 ) ) ( not ( = ?auto_103411 ?auto_103408 ) ) ( not ( = ?auto_103411 ?auto_103409 ) ) ( not ( = ?auto_103411 ?auto_103410 ) ) ( IN-CITY ?auto_103416 ?auto_103415 ) ( IN-CITY ?auto_103407 ?auto_103415 ) ( not ( = ?auto_103407 ?auto_103416 ) ) ( OBJ-AT ?auto_103410 ?auto_103416 ) ( IN-CITY ?auto_103414 ?auto_103415 ) ( not ( = ?auto_103407 ?auto_103414 ) ) ( not ( = ?auto_103416 ?auto_103414 ) ) ( OBJ-AT ?auto_103408 ?auto_103414 ) ( OBJ-AT ?auto_103409 ?auto_103416 ) ( TRUCK-AT ?auto_103413 ?auto_103412 ) ( IN-CITY ?auto_103412 ?auto_103415 ) ( not ( = ?auto_103407 ?auto_103412 ) ) ( not ( = ?auto_103416 ?auto_103412 ) ) ( not ( = ?auto_103414 ?auto_103412 ) ) ( OBJ-AT ?auto_103411 ?auto_103412 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_103411 ?auto_103410 ?auto_103407 )
      ( DELIVER-4PKG-VERIFY ?auto_103408 ?auto_103409 ?auto_103410 ?auto_103411 ?auto_103407 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_103542 - OBJ
      ?auto_103543 - OBJ
      ?auto_103544 - OBJ
      ?auto_103545 - OBJ
      ?auto_103541 - LOCATION
    )
    :vars
    (
      ?auto_103550 - LOCATION
      ?auto_103549 - CITY
      ?auto_103548 - LOCATION
      ?auto_103547 - TRUCK
      ?auto_103546 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_103543 ?auto_103542 ) ) ( not ( = ?auto_103544 ?auto_103542 ) ) ( not ( = ?auto_103544 ?auto_103543 ) ) ( not ( = ?auto_103545 ?auto_103542 ) ) ( not ( = ?auto_103545 ?auto_103543 ) ) ( not ( = ?auto_103545 ?auto_103544 ) ) ( IN-CITY ?auto_103550 ?auto_103549 ) ( IN-CITY ?auto_103541 ?auto_103549 ) ( not ( = ?auto_103541 ?auto_103550 ) ) ( OBJ-AT ?auto_103543 ?auto_103550 ) ( IN-CITY ?auto_103548 ?auto_103549 ) ( not ( = ?auto_103541 ?auto_103548 ) ) ( not ( = ?auto_103550 ?auto_103548 ) ) ( OBJ-AT ?auto_103542 ?auto_103548 ) ( OBJ-AT ?auto_103545 ?auto_103550 ) ( TRUCK-AT ?auto_103547 ?auto_103546 ) ( IN-CITY ?auto_103546 ?auto_103549 ) ( not ( = ?auto_103541 ?auto_103546 ) ) ( not ( = ?auto_103550 ?auto_103546 ) ) ( not ( = ?auto_103548 ?auto_103546 ) ) ( OBJ-AT ?auto_103544 ?auto_103546 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_103544 ?auto_103543 ?auto_103541 )
      ( DELIVER-4PKG-VERIFY ?auto_103542 ?auto_103543 ?auto_103544 ?auto_103545 ?auto_103541 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_103574 - OBJ
      ?auto_103575 - OBJ
      ?auto_103576 - OBJ
      ?auto_103577 - OBJ
      ?auto_103573 - LOCATION
    )
    :vars
    (
      ?auto_103582 - LOCATION
      ?auto_103581 - CITY
      ?auto_103580 - LOCATION
      ?auto_103579 - TRUCK
      ?auto_103578 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_103575 ?auto_103574 ) ) ( not ( = ?auto_103576 ?auto_103574 ) ) ( not ( = ?auto_103576 ?auto_103575 ) ) ( not ( = ?auto_103577 ?auto_103574 ) ) ( not ( = ?auto_103577 ?auto_103575 ) ) ( not ( = ?auto_103577 ?auto_103576 ) ) ( IN-CITY ?auto_103582 ?auto_103581 ) ( IN-CITY ?auto_103573 ?auto_103581 ) ( not ( = ?auto_103573 ?auto_103582 ) ) ( OBJ-AT ?auto_103575 ?auto_103582 ) ( IN-CITY ?auto_103580 ?auto_103581 ) ( not ( = ?auto_103573 ?auto_103580 ) ) ( not ( = ?auto_103582 ?auto_103580 ) ) ( OBJ-AT ?auto_103574 ?auto_103580 ) ( OBJ-AT ?auto_103576 ?auto_103582 ) ( TRUCK-AT ?auto_103579 ?auto_103578 ) ( IN-CITY ?auto_103578 ?auto_103581 ) ( not ( = ?auto_103573 ?auto_103578 ) ) ( not ( = ?auto_103582 ?auto_103578 ) ) ( not ( = ?auto_103580 ?auto_103578 ) ) ( OBJ-AT ?auto_103577 ?auto_103578 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_103577 ?auto_103575 ?auto_103573 )
      ( DELIVER-4PKG-VERIFY ?auto_103574 ?auto_103575 ?auto_103576 ?auto_103577 ?auto_103573 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_103777 - OBJ
      ?auto_103778 - OBJ
      ?auto_103779 - OBJ
      ?auto_103780 - OBJ
      ?auto_103776 - LOCATION
    )
    :vars
    (
      ?auto_103785 - LOCATION
      ?auto_103784 - CITY
      ?auto_103783 - LOCATION
      ?auto_103782 - TRUCK
      ?auto_103781 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_103778 ?auto_103777 ) ) ( not ( = ?auto_103779 ?auto_103777 ) ) ( not ( = ?auto_103779 ?auto_103778 ) ) ( not ( = ?auto_103780 ?auto_103777 ) ) ( not ( = ?auto_103780 ?auto_103778 ) ) ( not ( = ?auto_103780 ?auto_103779 ) ) ( IN-CITY ?auto_103785 ?auto_103784 ) ( IN-CITY ?auto_103776 ?auto_103784 ) ( not ( = ?auto_103776 ?auto_103785 ) ) ( OBJ-AT ?auto_103777 ?auto_103785 ) ( IN-CITY ?auto_103783 ?auto_103784 ) ( not ( = ?auto_103776 ?auto_103783 ) ) ( not ( = ?auto_103785 ?auto_103783 ) ) ( OBJ-AT ?auto_103780 ?auto_103783 ) ( OBJ-AT ?auto_103779 ?auto_103785 ) ( TRUCK-AT ?auto_103782 ?auto_103781 ) ( IN-CITY ?auto_103781 ?auto_103784 ) ( not ( = ?auto_103776 ?auto_103781 ) ) ( not ( = ?auto_103785 ?auto_103781 ) ) ( not ( = ?auto_103783 ?auto_103781 ) ) ( OBJ-AT ?auto_103778 ?auto_103781 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_103778 ?auto_103777 ?auto_103776 )
      ( DELIVER-4PKG-VERIFY ?auto_103777 ?auto_103778 ?auto_103779 ?auto_103780 ?auto_103776 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_103809 - OBJ
      ?auto_103810 - OBJ
      ?auto_103811 - OBJ
      ?auto_103812 - OBJ
      ?auto_103808 - LOCATION
    )
    :vars
    (
      ?auto_103817 - LOCATION
      ?auto_103816 - CITY
      ?auto_103815 - LOCATION
      ?auto_103814 - TRUCK
      ?auto_103813 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_103810 ?auto_103809 ) ) ( not ( = ?auto_103811 ?auto_103809 ) ) ( not ( = ?auto_103811 ?auto_103810 ) ) ( not ( = ?auto_103812 ?auto_103809 ) ) ( not ( = ?auto_103812 ?auto_103810 ) ) ( not ( = ?auto_103812 ?auto_103811 ) ) ( IN-CITY ?auto_103817 ?auto_103816 ) ( IN-CITY ?auto_103808 ?auto_103816 ) ( not ( = ?auto_103808 ?auto_103817 ) ) ( OBJ-AT ?auto_103809 ?auto_103817 ) ( IN-CITY ?auto_103815 ?auto_103816 ) ( not ( = ?auto_103808 ?auto_103815 ) ) ( not ( = ?auto_103817 ?auto_103815 ) ) ( OBJ-AT ?auto_103811 ?auto_103815 ) ( OBJ-AT ?auto_103812 ?auto_103817 ) ( TRUCK-AT ?auto_103814 ?auto_103813 ) ( IN-CITY ?auto_103813 ?auto_103816 ) ( not ( = ?auto_103808 ?auto_103813 ) ) ( not ( = ?auto_103817 ?auto_103813 ) ) ( not ( = ?auto_103815 ?auto_103813 ) ) ( OBJ-AT ?auto_103810 ?auto_103813 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_103810 ?auto_103809 ?auto_103808 )
      ( DELIVER-4PKG-VERIFY ?auto_103809 ?auto_103810 ?auto_103811 ?auto_103812 ?auto_103808 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_103909 - OBJ
      ?auto_103910 - OBJ
      ?auto_103911 - OBJ
      ?auto_103912 - OBJ
      ?auto_103908 - LOCATION
    )
    :vars
    (
      ?auto_103917 - LOCATION
      ?auto_103916 - CITY
      ?auto_103915 - LOCATION
      ?auto_103914 - TRUCK
      ?auto_103913 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_103910 ?auto_103909 ) ) ( not ( = ?auto_103911 ?auto_103909 ) ) ( not ( = ?auto_103911 ?auto_103910 ) ) ( not ( = ?auto_103912 ?auto_103909 ) ) ( not ( = ?auto_103912 ?auto_103910 ) ) ( not ( = ?auto_103912 ?auto_103911 ) ) ( IN-CITY ?auto_103917 ?auto_103916 ) ( IN-CITY ?auto_103908 ?auto_103916 ) ( not ( = ?auto_103908 ?auto_103917 ) ) ( OBJ-AT ?auto_103909 ?auto_103917 ) ( IN-CITY ?auto_103915 ?auto_103916 ) ( not ( = ?auto_103908 ?auto_103915 ) ) ( not ( = ?auto_103917 ?auto_103915 ) ) ( OBJ-AT ?auto_103912 ?auto_103915 ) ( OBJ-AT ?auto_103910 ?auto_103917 ) ( TRUCK-AT ?auto_103914 ?auto_103913 ) ( IN-CITY ?auto_103913 ?auto_103916 ) ( not ( = ?auto_103908 ?auto_103913 ) ) ( not ( = ?auto_103917 ?auto_103913 ) ) ( not ( = ?auto_103915 ?auto_103913 ) ) ( OBJ-AT ?auto_103911 ?auto_103913 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_103911 ?auto_103909 ?auto_103908 )
      ( DELIVER-4PKG-VERIFY ?auto_103909 ?auto_103910 ?auto_103911 ?auto_103912 ?auto_103908 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_103976 - OBJ
      ?auto_103977 - OBJ
      ?auto_103978 - OBJ
      ?auto_103979 - OBJ
      ?auto_103975 - LOCATION
    )
    :vars
    (
      ?auto_103984 - LOCATION
      ?auto_103983 - CITY
      ?auto_103982 - LOCATION
      ?auto_103981 - TRUCK
      ?auto_103980 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_103977 ?auto_103976 ) ) ( not ( = ?auto_103978 ?auto_103976 ) ) ( not ( = ?auto_103978 ?auto_103977 ) ) ( not ( = ?auto_103979 ?auto_103976 ) ) ( not ( = ?auto_103979 ?auto_103977 ) ) ( not ( = ?auto_103979 ?auto_103978 ) ) ( IN-CITY ?auto_103984 ?auto_103983 ) ( IN-CITY ?auto_103975 ?auto_103983 ) ( not ( = ?auto_103975 ?auto_103984 ) ) ( OBJ-AT ?auto_103976 ?auto_103984 ) ( IN-CITY ?auto_103982 ?auto_103983 ) ( not ( = ?auto_103975 ?auto_103982 ) ) ( not ( = ?auto_103984 ?auto_103982 ) ) ( OBJ-AT ?auto_103978 ?auto_103982 ) ( OBJ-AT ?auto_103977 ?auto_103984 ) ( TRUCK-AT ?auto_103981 ?auto_103980 ) ( IN-CITY ?auto_103980 ?auto_103983 ) ( not ( = ?auto_103975 ?auto_103980 ) ) ( not ( = ?auto_103984 ?auto_103980 ) ) ( not ( = ?auto_103982 ?auto_103980 ) ) ( OBJ-AT ?auto_103979 ?auto_103980 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_103979 ?auto_103976 ?auto_103975 )
      ( DELIVER-4PKG-VERIFY ?auto_103976 ?auto_103977 ?auto_103978 ?auto_103979 ?auto_103975 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_104076 - OBJ
      ?auto_104077 - OBJ
      ?auto_104078 - OBJ
      ?auto_104079 - OBJ
      ?auto_104075 - LOCATION
    )
    :vars
    (
      ?auto_104084 - LOCATION
      ?auto_104083 - CITY
      ?auto_104082 - LOCATION
      ?auto_104081 - TRUCK
      ?auto_104080 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_104077 ?auto_104076 ) ) ( not ( = ?auto_104078 ?auto_104076 ) ) ( not ( = ?auto_104078 ?auto_104077 ) ) ( not ( = ?auto_104079 ?auto_104076 ) ) ( not ( = ?auto_104079 ?auto_104077 ) ) ( not ( = ?auto_104079 ?auto_104078 ) ) ( IN-CITY ?auto_104084 ?auto_104083 ) ( IN-CITY ?auto_104075 ?auto_104083 ) ( not ( = ?auto_104075 ?auto_104084 ) ) ( OBJ-AT ?auto_104076 ?auto_104084 ) ( IN-CITY ?auto_104082 ?auto_104083 ) ( not ( = ?auto_104075 ?auto_104082 ) ) ( not ( = ?auto_104084 ?auto_104082 ) ) ( OBJ-AT ?auto_104077 ?auto_104082 ) ( OBJ-AT ?auto_104079 ?auto_104084 ) ( TRUCK-AT ?auto_104081 ?auto_104080 ) ( IN-CITY ?auto_104080 ?auto_104083 ) ( not ( = ?auto_104075 ?auto_104080 ) ) ( not ( = ?auto_104084 ?auto_104080 ) ) ( not ( = ?auto_104082 ?auto_104080 ) ) ( OBJ-AT ?auto_104078 ?auto_104080 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104078 ?auto_104076 ?auto_104075 )
      ( DELIVER-4PKG-VERIFY ?auto_104076 ?auto_104077 ?auto_104078 ?auto_104079 ?auto_104075 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_104108 - OBJ
      ?auto_104109 - OBJ
      ?auto_104110 - OBJ
      ?auto_104111 - OBJ
      ?auto_104107 - LOCATION
    )
    :vars
    (
      ?auto_104116 - LOCATION
      ?auto_104115 - CITY
      ?auto_104114 - LOCATION
      ?auto_104113 - TRUCK
      ?auto_104112 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_104109 ?auto_104108 ) ) ( not ( = ?auto_104110 ?auto_104108 ) ) ( not ( = ?auto_104110 ?auto_104109 ) ) ( not ( = ?auto_104111 ?auto_104108 ) ) ( not ( = ?auto_104111 ?auto_104109 ) ) ( not ( = ?auto_104111 ?auto_104110 ) ) ( IN-CITY ?auto_104116 ?auto_104115 ) ( IN-CITY ?auto_104107 ?auto_104115 ) ( not ( = ?auto_104107 ?auto_104116 ) ) ( OBJ-AT ?auto_104108 ?auto_104116 ) ( IN-CITY ?auto_104114 ?auto_104115 ) ( not ( = ?auto_104107 ?auto_104114 ) ) ( not ( = ?auto_104116 ?auto_104114 ) ) ( OBJ-AT ?auto_104109 ?auto_104114 ) ( OBJ-AT ?auto_104110 ?auto_104116 ) ( TRUCK-AT ?auto_104113 ?auto_104112 ) ( IN-CITY ?auto_104112 ?auto_104115 ) ( not ( = ?auto_104107 ?auto_104112 ) ) ( not ( = ?auto_104116 ?auto_104112 ) ) ( not ( = ?auto_104114 ?auto_104112 ) ) ( OBJ-AT ?auto_104111 ?auto_104112 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104111 ?auto_104108 ?auto_104107 )
      ( DELIVER-4PKG-VERIFY ?auto_104108 ?auto_104109 ?auto_104110 ?auto_104111 ?auto_104107 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_104430 - OBJ
      ?auto_104429 - LOCATION
    )
    :vars
    (
      ?auto_104438 - OBJ
      ?auto_104437 - LOCATION
      ?auto_104436 - CITY
      ?auto_104431 - OBJ
      ?auto_104435 - LOCATION
      ?auto_104433 - OBJ
      ?auto_104432 - LOCATION
      ?auto_104434 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104430 ?auto_104438 ) ) ( IN-CITY ?auto_104437 ?auto_104436 ) ( IN-CITY ?auto_104429 ?auto_104436 ) ( not ( = ?auto_104429 ?auto_104437 ) ) ( OBJ-AT ?auto_104430 ?auto_104437 ) ( not ( = ?auto_104431 ?auto_104438 ) ) ( not ( = ?auto_104430 ?auto_104431 ) ) ( IN-CITY ?auto_104435 ?auto_104436 ) ( not ( = ?auto_104429 ?auto_104435 ) ) ( not ( = ?auto_104437 ?auto_104435 ) ) ( OBJ-AT ?auto_104431 ?auto_104435 ) ( not ( = ?auto_104433 ?auto_104438 ) ) ( not ( = ?auto_104430 ?auto_104433 ) ) ( not ( = ?auto_104431 ?auto_104433 ) ) ( OBJ-AT ?auto_104433 ?auto_104437 ) ( IN-CITY ?auto_104432 ?auto_104436 ) ( not ( = ?auto_104429 ?auto_104432 ) ) ( not ( = ?auto_104437 ?auto_104432 ) ) ( not ( = ?auto_104435 ?auto_104432 ) ) ( OBJ-AT ?auto_104438 ?auto_104432 ) ( TRUCK-AT ?auto_104434 ?auto_104429 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_104434 ?auto_104429 ?auto_104432 ?auto_104436 )
      ( DELIVER-2PKG ?auto_104438 ?auto_104430 ?auto_104429 )
      ( DELIVER-1PKG-VERIFY ?auto_104430 ?auto_104429 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_104440 - OBJ
      ?auto_104441 - OBJ
      ?auto_104439 - LOCATION
    )
    :vars
    (
      ?auto_104443 - LOCATION
      ?auto_104446 - CITY
      ?auto_104444 - OBJ
      ?auto_104445 - LOCATION
      ?auto_104447 - OBJ
      ?auto_104442 - LOCATION
      ?auto_104448 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104441 ?auto_104440 ) ) ( IN-CITY ?auto_104443 ?auto_104446 ) ( IN-CITY ?auto_104439 ?auto_104446 ) ( not ( = ?auto_104439 ?auto_104443 ) ) ( OBJ-AT ?auto_104441 ?auto_104443 ) ( not ( = ?auto_104444 ?auto_104440 ) ) ( not ( = ?auto_104441 ?auto_104444 ) ) ( IN-CITY ?auto_104445 ?auto_104446 ) ( not ( = ?auto_104439 ?auto_104445 ) ) ( not ( = ?auto_104443 ?auto_104445 ) ) ( OBJ-AT ?auto_104444 ?auto_104445 ) ( not ( = ?auto_104447 ?auto_104440 ) ) ( not ( = ?auto_104441 ?auto_104447 ) ) ( not ( = ?auto_104444 ?auto_104447 ) ) ( OBJ-AT ?auto_104447 ?auto_104443 ) ( IN-CITY ?auto_104442 ?auto_104446 ) ( not ( = ?auto_104439 ?auto_104442 ) ) ( not ( = ?auto_104443 ?auto_104442 ) ) ( not ( = ?auto_104445 ?auto_104442 ) ) ( OBJ-AT ?auto_104440 ?auto_104442 ) ( TRUCK-AT ?auto_104448 ?auto_104439 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_104441 ?auto_104439 )
      ( DELIVER-2PKG-VERIFY ?auto_104440 ?auto_104441 ?auto_104439 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_104450 - OBJ
      ?auto_104451 - OBJ
      ?auto_104449 - LOCATION
    )
    :vars
    (
      ?auto_104458 - OBJ
      ?auto_104456 - LOCATION
      ?auto_104455 - CITY
      ?auto_104453 - OBJ
      ?auto_104454 - LOCATION
      ?auto_104457 - LOCATION
      ?auto_104452 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104451 ?auto_104450 ) ) ( not ( = ?auto_104451 ?auto_104458 ) ) ( IN-CITY ?auto_104456 ?auto_104455 ) ( IN-CITY ?auto_104449 ?auto_104455 ) ( not ( = ?auto_104449 ?auto_104456 ) ) ( OBJ-AT ?auto_104451 ?auto_104456 ) ( not ( = ?auto_104453 ?auto_104458 ) ) ( not ( = ?auto_104451 ?auto_104453 ) ) ( IN-CITY ?auto_104454 ?auto_104455 ) ( not ( = ?auto_104449 ?auto_104454 ) ) ( not ( = ?auto_104456 ?auto_104454 ) ) ( OBJ-AT ?auto_104453 ?auto_104454 ) ( not ( = ?auto_104450 ?auto_104458 ) ) ( not ( = ?auto_104453 ?auto_104450 ) ) ( OBJ-AT ?auto_104450 ?auto_104456 ) ( IN-CITY ?auto_104457 ?auto_104455 ) ( not ( = ?auto_104449 ?auto_104457 ) ) ( not ( = ?auto_104456 ?auto_104457 ) ) ( not ( = ?auto_104454 ?auto_104457 ) ) ( OBJ-AT ?auto_104458 ?auto_104457 ) ( TRUCK-AT ?auto_104452 ?auto_104449 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104458 ?auto_104451 ?auto_104449 )
      ( DELIVER-2PKG-VERIFY ?auto_104450 ?auto_104451 ?auto_104449 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_104460 - OBJ
      ?auto_104461 - OBJ
      ?auto_104459 - LOCATION
    )
    :vars
    (
      ?auto_104468 - OBJ
      ?auto_104466 - LOCATION
      ?auto_104465 - CITY
      ?auto_104464 - LOCATION
      ?auto_104462 - OBJ
      ?auto_104467 - LOCATION
      ?auto_104463 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104461 ?auto_104460 ) ) ( not ( = ?auto_104461 ?auto_104468 ) ) ( IN-CITY ?auto_104466 ?auto_104465 ) ( IN-CITY ?auto_104459 ?auto_104465 ) ( not ( = ?auto_104459 ?auto_104466 ) ) ( OBJ-AT ?auto_104461 ?auto_104466 ) ( not ( = ?auto_104460 ?auto_104468 ) ) ( IN-CITY ?auto_104464 ?auto_104465 ) ( not ( = ?auto_104459 ?auto_104464 ) ) ( not ( = ?auto_104466 ?auto_104464 ) ) ( OBJ-AT ?auto_104460 ?auto_104464 ) ( not ( = ?auto_104462 ?auto_104468 ) ) ( not ( = ?auto_104461 ?auto_104462 ) ) ( not ( = ?auto_104460 ?auto_104462 ) ) ( OBJ-AT ?auto_104462 ?auto_104466 ) ( IN-CITY ?auto_104467 ?auto_104465 ) ( not ( = ?auto_104459 ?auto_104467 ) ) ( not ( = ?auto_104466 ?auto_104467 ) ) ( not ( = ?auto_104464 ?auto_104467 ) ) ( OBJ-AT ?auto_104468 ?auto_104467 ) ( TRUCK-AT ?auto_104463 ?auto_104459 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104468 ?auto_104461 ?auto_104459 )
      ( DELIVER-2PKG-VERIFY ?auto_104460 ?auto_104461 ?auto_104459 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_104470 - OBJ
      ?auto_104471 - OBJ
      ?auto_104469 - LOCATION
    )
    :vars
    (
      ?auto_104477 - LOCATION
      ?auto_104476 - CITY
      ?auto_104474 - OBJ
      ?auto_104475 - LOCATION
      ?auto_104472 - OBJ
      ?auto_104478 - LOCATION
      ?auto_104473 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104471 ?auto_104470 ) ) ( IN-CITY ?auto_104477 ?auto_104476 ) ( IN-CITY ?auto_104469 ?auto_104476 ) ( not ( = ?auto_104469 ?auto_104477 ) ) ( OBJ-AT ?auto_104470 ?auto_104477 ) ( not ( = ?auto_104474 ?auto_104471 ) ) ( not ( = ?auto_104470 ?auto_104474 ) ) ( IN-CITY ?auto_104475 ?auto_104476 ) ( not ( = ?auto_104469 ?auto_104475 ) ) ( not ( = ?auto_104477 ?auto_104475 ) ) ( OBJ-AT ?auto_104474 ?auto_104475 ) ( not ( = ?auto_104472 ?auto_104471 ) ) ( not ( = ?auto_104470 ?auto_104472 ) ) ( not ( = ?auto_104474 ?auto_104472 ) ) ( OBJ-AT ?auto_104472 ?auto_104477 ) ( IN-CITY ?auto_104478 ?auto_104476 ) ( not ( = ?auto_104469 ?auto_104478 ) ) ( not ( = ?auto_104477 ?auto_104478 ) ) ( not ( = ?auto_104475 ?auto_104478 ) ) ( OBJ-AT ?auto_104471 ?auto_104478 ) ( TRUCK-AT ?auto_104473 ?auto_104469 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104471 ?auto_104470 ?auto_104469 )
      ( DELIVER-2PKG-VERIFY ?auto_104470 ?auto_104471 ?auto_104469 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_104480 - OBJ
      ?auto_104481 - OBJ
      ?auto_104479 - LOCATION
    )
    :vars
    (
      ?auto_104488 - OBJ
      ?auto_104486 - LOCATION
      ?auto_104485 - CITY
      ?auto_104483 - OBJ
      ?auto_104484 - LOCATION
      ?auto_104487 - LOCATION
      ?auto_104482 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104481 ?auto_104480 ) ) ( not ( = ?auto_104480 ?auto_104488 ) ) ( IN-CITY ?auto_104486 ?auto_104485 ) ( IN-CITY ?auto_104479 ?auto_104485 ) ( not ( = ?auto_104479 ?auto_104486 ) ) ( OBJ-AT ?auto_104480 ?auto_104486 ) ( not ( = ?auto_104483 ?auto_104488 ) ) ( not ( = ?auto_104480 ?auto_104483 ) ) ( IN-CITY ?auto_104484 ?auto_104485 ) ( not ( = ?auto_104479 ?auto_104484 ) ) ( not ( = ?auto_104486 ?auto_104484 ) ) ( OBJ-AT ?auto_104483 ?auto_104484 ) ( not ( = ?auto_104481 ?auto_104488 ) ) ( not ( = ?auto_104483 ?auto_104481 ) ) ( OBJ-AT ?auto_104481 ?auto_104486 ) ( IN-CITY ?auto_104487 ?auto_104485 ) ( not ( = ?auto_104479 ?auto_104487 ) ) ( not ( = ?auto_104486 ?auto_104487 ) ) ( not ( = ?auto_104484 ?auto_104487 ) ) ( OBJ-AT ?auto_104488 ?auto_104487 ) ( TRUCK-AT ?auto_104482 ?auto_104479 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104488 ?auto_104480 ?auto_104479 )
      ( DELIVER-2PKG-VERIFY ?auto_104480 ?auto_104481 ?auto_104479 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_104490 - OBJ
      ?auto_104491 - OBJ
      ?auto_104489 - LOCATION
    )
    :vars
    (
      ?auto_104498 - OBJ
      ?auto_104496 - LOCATION
      ?auto_104495 - CITY
      ?auto_104494 - LOCATION
      ?auto_104492 - OBJ
      ?auto_104497 - LOCATION
      ?auto_104493 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104491 ?auto_104490 ) ) ( not ( = ?auto_104490 ?auto_104498 ) ) ( IN-CITY ?auto_104496 ?auto_104495 ) ( IN-CITY ?auto_104489 ?auto_104495 ) ( not ( = ?auto_104489 ?auto_104496 ) ) ( OBJ-AT ?auto_104490 ?auto_104496 ) ( not ( = ?auto_104491 ?auto_104498 ) ) ( IN-CITY ?auto_104494 ?auto_104495 ) ( not ( = ?auto_104489 ?auto_104494 ) ) ( not ( = ?auto_104496 ?auto_104494 ) ) ( OBJ-AT ?auto_104491 ?auto_104494 ) ( not ( = ?auto_104492 ?auto_104498 ) ) ( not ( = ?auto_104490 ?auto_104492 ) ) ( not ( = ?auto_104491 ?auto_104492 ) ) ( OBJ-AT ?auto_104492 ?auto_104496 ) ( IN-CITY ?auto_104497 ?auto_104495 ) ( not ( = ?auto_104489 ?auto_104497 ) ) ( not ( = ?auto_104496 ?auto_104497 ) ) ( not ( = ?auto_104494 ?auto_104497 ) ) ( OBJ-AT ?auto_104498 ?auto_104497 ) ( TRUCK-AT ?auto_104493 ?auto_104489 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104498 ?auto_104490 ?auto_104489 )
      ( DELIVER-2PKG-VERIFY ?auto_104490 ?auto_104491 ?auto_104489 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104522 - OBJ
      ?auto_104523 - OBJ
      ?auto_104524 - OBJ
      ?auto_104521 - LOCATION
    )
    :vars
    (
      ?auto_104529 - LOCATION
      ?auto_104528 - CITY
      ?auto_104526 - OBJ
      ?auto_104527 - LOCATION
      ?auto_104530 - LOCATION
      ?auto_104525 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104523 ?auto_104522 ) ) ( not ( = ?auto_104524 ?auto_104522 ) ) ( not ( = ?auto_104524 ?auto_104523 ) ) ( IN-CITY ?auto_104529 ?auto_104528 ) ( IN-CITY ?auto_104521 ?auto_104528 ) ( not ( = ?auto_104521 ?auto_104529 ) ) ( OBJ-AT ?auto_104524 ?auto_104529 ) ( not ( = ?auto_104526 ?auto_104522 ) ) ( not ( = ?auto_104524 ?auto_104526 ) ) ( IN-CITY ?auto_104527 ?auto_104528 ) ( not ( = ?auto_104521 ?auto_104527 ) ) ( not ( = ?auto_104529 ?auto_104527 ) ) ( OBJ-AT ?auto_104526 ?auto_104527 ) ( not ( = ?auto_104526 ?auto_104523 ) ) ( OBJ-AT ?auto_104523 ?auto_104529 ) ( IN-CITY ?auto_104530 ?auto_104528 ) ( not ( = ?auto_104521 ?auto_104530 ) ) ( not ( = ?auto_104529 ?auto_104530 ) ) ( not ( = ?auto_104527 ?auto_104530 ) ) ( OBJ-AT ?auto_104522 ?auto_104530 ) ( TRUCK-AT ?auto_104525 ?auto_104521 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104522 ?auto_104524 ?auto_104521 )
      ( DELIVER-3PKG-VERIFY ?auto_104522 ?auto_104523 ?auto_104524 ?auto_104521 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104532 - OBJ
      ?auto_104533 - OBJ
      ?auto_104534 - OBJ
      ?auto_104531 - LOCATION
    )
    :vars
    (
      ?auto_104539 - LOCATION
      ?auto_104538 - CITY
      ?auto_104537 - LOCATION
      ?auto_104535 - OBJ
      ?auto_104540 - LOCATION
      ?auto_104536 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104533 ?auto_104532 ) ) ( not ( = ?auto_104534 ?auto_104532 ) ) ( not ( = ?auto_104534 ?auto_104533 ) ) ( IN-CITY ?auto_104539 ?auto_104538 ) ( IN-CITY ?auto_104531 ?auto_104538 ) ( not ( = ?auto_104531 ?auto_104539 ) ) ( OBJ-AT ?auto_104534 ?auto_104539 ) ( IN-CITY ?auto_104537 ?auto_104538 ) ( not ( = ?auto_104531 ?auto_104537 ) ) ( not ( = ?auto_104539 ?auto_104537 ) ) ( OBJ-AT ?auto_104533 ?auto_104537 ) ( not ( = ?auto_104535 ?auto_104532 ) ) ( not ( = ?auto_104534 ?auto_104535 ) ) ( not ( = ?auto_104533 ?auto_104535 ) ) ( OBJ-AT ?auto_104535 ?auto_104539 ) ( IN-CITY ?auto_104540 ?auto_104538 ) ( not ( = ?auto_104531 ?auto_104540 ) ) ( not ( = ?auto_104539 ?auto_104540 ) ) ( not ( = ?auto_104537 ?auto_104540 ) ) ( OBJ-AT ?auto_104532 ?auto_104540 ) ( TRUCK-AT ?auto_104536 ?auto_104531 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104532 ?auto_104534 ?auto_104531 )
      ( DELIVER-3PKG-VERIFY ?auto_104532 ?auto_104533 ?auto_104534 ?auto_104531 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104553 - OBJ
      ?auto_104554 - OBJ
      ?auto_104555 - OBJ
      ?auto_104552 - LOCATION
    )
    :vars
    (
      ?auto_104560 - LOCATION
      ?auto_104559 - CITY
      ?auto_104557 - OBJ
      ?auto_104558 - LOCATION
      ?auto_104561 - LOCATION
      ?auto_104556 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104554 ?auto_104553 ) ) ( not ( = ?auto_104555 ?auto_104553 ) ) ( not ( = ?auto_104555 ?auto_104554 ) ) ( IN-CITY ?auto_104560 ?auto_104559 ) ( IN-CITY ?auto_104552 ?auto_104559 ) ( not ( = ?auto_104552 ?auto_104560 ) ) ( OBJ-AT ?auto_104554 ?auto_104560 ) ( not ( = ?auto_104557 ?auto_104553 ) ) ( not ( = ?auto_104554 ?auto_104557 ) ) ( IN-CITY ?auto_104558 ?auto_104559 ) ( not ( = ?auto_104552 ?auto_104558 ) ) ( not ( = ?auto_104560 ?auto_104558 ) ) ( OBJ-AT ?auto_104557 ?auto_104558 ) ( not ( = ?auto_104557 ?auto_104555 ) ) ( OBJ-AT ?auto_104555 ?auto_104560 ) ( IN-CITY ?auto_104561 ?auto_104559 ) ( not ( = ?auto_104552 ?auto_104561 ) ) ( not ( = ?auto_104560 ?auto_104561 ) ) ( not ( = ?auto_104558 ?auto_104561 ) ) ( OBJ-AT ?auto_104553 ?auto_104561 ) ( TRUCK-AT ?auto_104556 ?auto_104552 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104553 ?auto_104554 ?auto_104552 )
      ( DELIVER-3PKG-VERIFY ?auto_104553 ?auto_104554 ?auto_104555 ?auto_104552 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104563 - OBJ
      ?auto_104564 - OBJ
      ?auto_104565 - OBJ
      ?auto_104562 - LOCATION
    )
    :vars
    (
      ?auto_104570 - LOCATION
      ?auto_104569 - CITY
      ?auto_104568 - LOCATION
      ?auto_104566 - OBJ
      ?auto_104571 - LOCATION
      ?auto_104567 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104564 ?auto_104563 ) ) ( not ( = ?auto_104565 ?auto_104563 ) ) ( not ( = ?auto_104565 ?auto_104564 ) ) ( IN-CITY ?auto_104570 ?auto_104569 ) ( IN-CITY ?auto_104562 ?auto_104569 ) ( not ( = ?auto_104562 ?auto_104570 ) ) ( OBJ-AT ?auto_104564 ?auto_104570 ) ( IN-CITY ?auto_104568 ?auto_104569 ) ( not ( = ?auto_104562 ?auto_104568 ) ) ( not ( = ?auto_104570 ?auto_104568 ) ) ( OBJ-AT ?auto_104565 ?auto_104568 ) ( not ( = ?auto_104566 ?auto_104563 ) ) ( not ( = ?auto_104564 ?auto_104566 ) ) ( not ( = ?auto_104565 ?auto_104566 ) ) ( OBJ-AT ?auto_104566 ?auto_104570 ) ( IN-CITY ?auto_104571 ?auto_104569 ) ( not ( = ?auto_104562 ?auto_104571 ) ) ( not ( = ?auto_104570 ?auto_104571 ) ) ( not ( = ?auto_104568 ?auto_104571 ) ) ( OBJ-AT ?auto_104563 ?auto_104571 ) ( TRUCK-AT ?auto_104567 ?auto_104562 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104563 ?auto_104564 ?auto_104562 )
      ( DELIVER-3PKG-VERIFY ?auto_104563 ?auto_104564 ?auto_104565 ?auto_104562 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104584 - OBJ
      ?auto_104585 - OBJ
      ?auto_104586 - OBJ
      ?auto_104583 - LOCATION
    )
    :vars
    (
      ?auto_104591 - LOCATION
      ?auto_104590 - CITY
      ?auto_104588 - OBJ
      ?auto_104589 - LOCATION
      ?auto_104592 - LOCATION
      ?auto_104587 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104585 ?auto_104584 ) ) ( not ( = ?auto_104586 ?auto_104584 ) ) ( not ( = ?auto_104586 ?auto_104585 ) ) ( IN-CITY ?auto_104591 ?auto_104590 ) ( IN-CITY ?auto_104583 ?auto_104590 ) ( not ( = ?auto_104583 ?auto_104591 ) ) ( OBJ-AT ?auto_104586 ?auto_104591 ) ( not ( = ?auto_104588 ?auto_104585 ) ) ( not ( = ?auto_104586 ?auto_104588 ) ) ( IN-CITY ?auto_104589 ?auto_104590 ) ( not ( = ?auto_104583 ?auto_104589 ) ) ( not ( = ?auto_104591 ?auto_104589 ) ) ( OBJ-AT ?auto_104588 ?auto_104589 ) ( not ( = ?auto_104588 ?auto_104584 ) ) ( OBJ-AT ?auto_104584 ?auto_104591 ) ( IN-CITY ?auto_104592 ?auto_104590 ) ( not ( = ?auto_104583 ?auto_104592 ) ) ( not ( = ?auto_104591 ?auto_104592 ) ) ( not ( = ?auto_104589 ?auto_104592 ) ) ( OBJ-AT ?auto_104585 ?auto_104592 ) ( TRUCK-AT ?auto_104587 ?auto_104583 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104585 ?auto_104586 ?auto_104583 )
      ( DELIVER-3PKG-VERIFY ?auto_104584 ?auto_104585 ?auto_104586 ?auto_104583 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104605 - OBJ
      ?auto_104606 - OBJ
      ?auto_104607 - OBJ
      ?auto_104604 - LOCATION
    )
    :vars
    (
      ?auto_104613 - OBJ
      ?auto_104611 - LOCATION
      ?auto_104610 - CITY
      ?auto_104609 - LOCATION
      ?auto_104612 - LOCATION
      ?auto_104608 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104606 ?auto_104605 ) ) ( not ( = ?auto_104607 ?auto_104605 ) ) ( not ( = ?auto_104607 ?auto_104606 ) ) ( not ( = ?auto_104607 ?auto_104613 ) ) ( IN-CITY ?auto_104611 ?auto_104610 ) ( IN-CITY ?auto_104604 ?auto_104610 ) ( not ( = ?auto_104604 ?auto_104611 ) ) ( OBJ-AT ?auto_104607 ?auto_104611 ) ( not ( = ?auto_104606 ?auto_104613 ) ) ( IN-CITY ?auto_104609 ?auto_104610 ) ( not ( = ?auto_104604 ?auto_104609 ) ) ( not ( = ?auto_104611 ?auto_104609 ) ) ( OBJ-AT ?auto_104606 ?auto_104609 ) ( not ( = ?auto_104605 ?auto_104613 ) ) ( OBJ-AT ?auto_104605 ?auto_104611 ) ( IN-CITY ?auto_104612 ?auto_104610 ) ( not ( = ?auto_104604 ?auto_104612 ) ) ( not ( = ?auto_104611 ?auto_104612 ) ) ( not ( = ?auto_104609 ?auto_104612 ) ) ( OBJ-AT ?auto_104613 ?auto_104612 ) ( TRUCK-AT ?auto_104608 ?auto_104604 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104613 ?auto_104607 ?auto_104604 )
      ( DELIVER-3PKG-VERIFY ?auto_104605 ?auto_104606 ?auto_104607 ?auto_104604 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104615 - OBJ
      ?auto_104616 - OBJ
      ?auto_104617 - OBJ
      ?auto_104614 - LOCATION
    )
    :vars
    (
      ?auto_104622 - LOCATION
      ?auto_104621 - CITY
      ?auto_104619 - OBJ
      ?auto_104620 - LOCATION
      ?auto_104623 - LOCATION
      ?auto_104618 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104616 ?auto_104615 ) ) ( not ( = ?auto_104617 ?auto_104615 ) ) ( not ( = ?auto_104617 ?auto_104616 ) ) ( IN-CITY ?auto_104622 ?auto_104621 ) ( IN-CITY ?auto_104614 ?auto_104621 ) ( not ( = ?auto_104614 ?auto_104622 ) ) ( OBJ-AT ?auto_104616 ?auto_104622 ) ( not ( = ?auto_104619 ?auto_104617 ) ) ( not ( = ?auto_104616 ?auto_104619 ) ) ( IN-CITY ?auto_104620 ?auto_104621 ) ( not ( = ?auto_104614 ?auto_104620 ) ) ( not ( = ?auto_104622 ?auto_104620 ) ) ( OBJ-AT ?auto_104619 ?auto_104620 ) ( not ( = ?auto_104619 ?auto_104615 ) ) ( OBJ-AT ?auto_104615 ?auto_104622 ) ( IN-CITY ?auto_104623 ?auto_104621 ) ( not ( = ?auto_104614 ?auto_104623 ) ) ( not ( = ?auto_104622 ?auto_104623 ) ) ( not ( = ?auto_104620 ?auto_104623 ) ) ( OBJ-AT ?auto_104617 ?auto_104623 ) ( TRUCK-AT ?auto_104618 ?auto_104614 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104617 ?auto_104616 ?auto_104614 )
      ( DELIVER-3PKG-VERIFY ?auto_104615 ?auto_104616 ?auto_104617 ?auto_104614 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104636 - OBJ
      ?auto_104637 - OBJ
      ?auto_104638 - OBJ
      ?auto_104635 - LOCATION
    )
    :vars
    (
      ?auto_104644 - OBJ
      ?auto_104642 - LOCATION
      ?auto_104641 - CITY
      ?auto_104640 - LOCATION
      ?auto_104643 - LOCATION
      ?auto_104639 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104637 ?auto_104636 ) ) ( not ( = ?auto_104638 ?auto_104636 ) ) ( not ( = ?auto_104638 ?auto_104637 ) ) ( not ( = ?auto_104637 ?auto_104644 ) ) ( IN-CITY ?auto_104642 ?auto_104641 ) ( IN-CITY ?auto_104635 ?auto_104641 ) ( not ( = ?auto_104635 ?auto_104642 ) ) ( OBJ-AT ?auto_104637 ?auto_104642 ) ( not ( = ?auto_104638 ?auto_104644 ) ) ( IN-CITY ?auto_104640 ?auto_104641 ) ( not ( = ?auto_104635 ?auto_104640 ) ) ( not ( = ?auto_104642 ?auto_104640 ) ) ( OBJ-AT ?auto_104638 ?auto_104640 ) ( not ( = ?auto_104636 ?auto_104644 ) ) ( OBJ-AT ?auto_104636 ?auto_104642 ) ( IN-CITY ?auto_104643 ?auto_104641 ) ( not ( = ?auto_104635 ?auto_104643 ) ) ( not ( = ?auto_104642 ?auto_104643 ) ) ( not ( = ?auto_104640 ?auto_104643 ) ) ( OBJ-AT ?auto_104644 ?auto_104643 ) ( TRUCK-AT ?auto_104639 ?auto_104635 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104644 ?auto_104637 ?auto_104635 )
      ( DELIVER-3PKG-VERIFY ?auto_104636 ?auto_104637 ?auto_104638 ?auto_104635 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104657 - OBJ
      ?auto_104658 - OBJ
      ?auto_104659 - OBJ
      ?auto_104656 - LOCATION
    )
    :vars
    (
      ?auto_104664 - LOCATION
      ?auto_104663 - CITY
      ?auto_104662 - LOCATION
      ?auto_104660 - OBJ
      ?auto_104665 - LOCATION
      ?auto_104661 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104658 ?auto_104657 ) ) ( not ( = ?auto_104659 ?auto_104657 ) ) ( not ( = ?auto_104659 ?auto_104658 ) ) ( IN-CITY ?auto_104664 ?auto_104663 ) ( IN-CITY ?auto_104656 ?auto_104663 ) ( not ( = ?auto_104656 ?auto_104664 ) ) ( OBJ-AT ?auto_104659 ?auto_104664 ) ( IN-CITY ?auto_104662 ?auto_104663 ) ( not ( = ?auto_104656 ?auto_104662 ) ) ( not ( = ?auto_104664 ?auto_104662 ) ) ( OBJ-AT ?auto_104657 ?auto_104662 ) ( not ( = ?auto_104660 ?auto_104658 ) ) ( not ( = ?auto_104659 ?auto_104660 ) ) ( not ( = ?auto_104657 ?auto_104660 ) ) ( OBJ-AT ?auto_104660 ?auto_104664 ) ( IN-CITY ?auto_104665 ?auto_104663 ) ( not ( = ?auto_104656 ?auto_104665 ) ) ( not ( = ?auto_104664 ?auto_104665 ) ) ( not ( = ?auto_104662 ?auto_104665 ) ) ( OBJ-AT ?auto_104658 ?auto_104665 ) ( TRUCK-AT ?auto_104661 ?auto_104656 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104658 ?auto_104659 ?auto_104656 )
      ( DELIVER-3PKG-VERIFY ?auto_104657 ?auto_104658 ?auto_104659 ?auto_104656 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104667 - OBJ
      ?auto_104668 - OBJ
      ?auto_104669 - OBJ
      ?auto_104666 - LOCATION
    )
    :vars
    (
      ?auto_104675 - OBJ
      ?auto_104673 - LOCATION
      ?auto_104672 - CITY
      ?auto_104671 - LOCATION
      ?auto_104674 - LOCATION
      ?auto_104670 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104668 ?auto_104667 ) ) ( not ( = ?auto_104669 ?auto_104667 ) ) ( not ( = ?auto_104669 ?auto_104668 ) ) ( not ( = ?auto_104669 ?auto_104675 ) ) ( IN-CITY ?auto_104673 ?auto_104672 ) ( IN-CITY ?auto_104666 ?auto_104672 ) ( not ( = ?auto_104666 ?auto_104673 ) ) ( OBJ-AT ?auto_104669 ?auto_104673 ) ( not ( = ?auto_104667 ?auto_104675 ) ) ( IN-CITY ?auto_104671 ?auto_104672 ) ( not ( = ?auto_104666 ?auto_104671 ) ) ( not ( = ?auto_104673 ?auto_104671 ) ) ( OBJ-AT ?auto_104667 ?auto_104671 ) ( not ( = ?auto_104668 ?auto_104675 ) ) ( OBJ-AT ?auto_104668 ?auto_104673 ) ( IN-CITY ?auto_104674 ?auto_104672 ) ( not ( = ?auto_104666 ?auto_104674 ) ) ( not ( = ?auto_104673 ?auto_104674 ) ) ( not ( = ?auto_104671 ?auto_104674 ) ) ( OBJ-AT ?auto_104675 ?auto_104674 ) ( TRUCK-AT ?auto_104670 ?auto_104666 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104675 ?auto_104669 ?auto_104666 )
      ( DELIVER-3PKG-VERIFY ?auto_104667 ?auto_104668 ?auto_104669 ?auto_104666 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104688 - OBJ
      ?auto_104689 - OBJ
      ?auto_104690 - OBJ
      ?auto_104687 - LOCATION
    )
    :vars
    (
      ?auto_104695 - LOCATION
      ?auto_104694 - CITY
      ?auto_104693 - LOCATION
      ?auto_104691 - OBJ
      ?auto_104696 - LOCATION
      ?auto_104692 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104689 ?auto_104688 ) ) ( not ( = ?auto_104690 ?auto_104688 ) ) ( not ( = ?auto_104690 ?auto_104689 ) ) ( IN-CITY ?auto_104695 ?auto_104694 ) ( IN-CITY ?auto_104687 ?auto_104694 ) ( not ( = ?auto_104687 ?auto_104695 ) ) ( OBJ-AT ?auto_104689 ?auto_104695 ) ( IN-CITY ?auto_104693 ?auto_104694 ) ( not ( = ?auto_104687 ?auto_104693 ) ) ( not ( = ?auto_104695 ?auto_104693 ) ) ( OBJ-AT ?auto_104688 ?auto_104693 ) ( not ( = ?auto_104691 ?auto_104690 ) ) ( not ( = ?auto_104689 ?auto_104691 ) ) ( not ( = ?auto_104688 ?auto_104691 ) ) ( OBJ-AT ?auto_104691 ?auto_104695 ) ( IN-CITY ?auto_104696 ?auto_104694 ) ( not ( = ?auto_104687 ?auto_104696 ) ) ( not ( = ?auto_104695 ?auto_104696 ) ) ( not ( = ?auto_104693 ?auto_104696 ) ) ( OBJ-AT ?auto_104690 ?auto_104696 ) ( TRUCK-AT ?auto_104692 ?auto_104687 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104690 ?auto_104689 ?auto_104687 )
      ( DELIVER-3PKG-VERIFY ?auto_104688 ?auto_104689 ?auto_104690 ?auto_104687 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104698 - OBJ
      ?auto_104699 - OBJ
      ?auto_104700 - OBJ
      ?auto_104697 - LOCATION
    )
    :vars
    (
      ?auto_104706 - OBJ
      ?auto_104704 - LOCATION
      ?auto_104703 - CITY
      ?auto_104702 - LOCATION
      ?auto_104705 - LOCATION
      ?auto_104701 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104699 ?auto_104698 ) ) ( not ( = ?auto_104700 ?auto_104698 ) ) ( not ( = ?auto_104700 ?auto_104699 ) ) ( not ( = ?auto_104699 ?auto_104706 ) ) ( IN-CITY ?auto_104704 ?auto_104703 ) ( IN-CITY ?auto_104697 ?auto_104703 ) ( not ( = ?auto_104697 ?auto_104704 ) ) ( OBJ-AT ?auto_104699 ?auto_104704 ) ( not ( = ?auto_104698 ?auto_104706 ) ) ( IN-CITY ?auto_104702 ?auto_104703 ) ( not ( = ?auto_104697 ?auto_104702 ) ) ( not ( = ?auto_104704 ?auto_104702 ) ) ( OBJ-AT ?auto_104698 ?auto_104702 ) ( not ( = ?auto_104700 ?auto_104706 ) ) ( OBJ-AT ?auto_104700 ?auto_104704 ) ( IN-CITY ?auto_104705 ?auto_104703 ) ( not ( = ?auto_104697 ?auto_104705 ) ) ( not ( = ?auto_104704 ?auto_104705 ) ) ( not ( = ?auto_104702 ?auto_104705 ) ) ( OBJ-AT ?auto_104706 ?auto_104705 ) ( TRUCK-AT ?auto_104701 ?auto_104697 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104706 ?auto_104699 ?auto_104697 )
      ( DELIVER-3PKG-VERIFY ?auto_104698 ?auto_104699 ?auto_104700 ?auto_104697 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104741 - OBJ
      ?auto_104742 - OBJ
      ?auto_104743 - OBJ
      ?auto_104740 - LOCATION
    )
    :vars
    (
      ?auto_104748 - LOCATION
      ?auto_104747 - CITY
      ?auto_104745 - OBJ
      ?auto_104746 - LOCATION
      ?auto_104749 - LOCATION
      ?auto_104744 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104742 ?auto_104741 ) ) ( not ( = ?auto_104743 ?auto_104741 ) ) ( not ( = ?auto_104743 ?auto_104742 ) ) ( IN-CITY ?auto_104748 ?auto_104747 ) ( IN-CITY ?auto_104740 ?auto_104747 ) ( not ( = ?auto_104740 ?auto_104748 ) ) ( OBJ-AT ?auto_104741 ?auto_104748 ) ( not ( = ?auto_104745 ?auto_104742 ) ) ( not ( = ?auto_104741 ?auto_104745 ) ) ( IN-CITY ?auto_104746 ?auto_104747 ) ( not ( = ?auto_104740 ?auto_104746 ) ) ( not ( = ?auto_104748 ?auto_104746 ) ) ( OBJ-AT ?auto_104745 ?auto_104746 ) ( not ( = ?auto_104745 ?auto_104743 ) ) ( OBJ-AT ?auto_104743 ?auto_104748 ) ( IN-CITY ?auto_104749 ?auto_104747 ) ( not ( = ?auto_104740 ?auto_104749 ) ) ( not ( = ?auto_104748 ?auto_104749 ) ) ( not ( = ?auto_104746 ?auto_104749 ) ) ( OBJ-AT ?auto_104742 ?auto_104749 ) ( TRUCK-AT ?auto_104744 ?auto_104740 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104742 ?auto_104741 ?auto_104740 )
      ( DELIVER-3PKG-VERIFY ?auto_104741 ?auto_104742 ?auto_104743 ?auto_104740 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104751 - OBJ
      ?auto_104752 - OBJ
      ?auto_104753 - OBJ
      ?auto_104750 - LOCATION
    )
    :vars
    (
      ?auto_104758 - LOCATION
      ?auto_104757 - CITY
      ?auto_104756 - LOCATION
      ?auto_104754 - OBJ
      ?auto_104759 - LOCATION
      ?auto_104755 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104752 ?auto_104751 ) ) ( not ( = ?auto_104753 ?auto_104751 ) ) ( not ( = ?auto_104753 ?auto_104752 ) ) ( IN-CITY ?auto_104758 ?auto_104757 ) ( IN-CITY ?auto_104750 ?auto_104757 ) ( not ( = ?auto_104750 ?auto_104758 ) ) ( OBJ-AT ?auto_104751 ?auto_104758 ) ( IN-CITY ?auto_104756 ?auto_104757 ) ( not ( = ?auto_104750 ?auto_104756 ) ) ( not ( = ?auto_104758 ?auto_104756 ) ) ( OBJ-AT ?auto_104753 ?auto_104756 ) ( not ( = ?auto_104754 ?auto_104752 ) ) ( not ( = ?auto_104751 ?auto_104754 ) ) ( not ( = ?auto_104753 ?auto_104754 ) ) ( OBJ-AT ?auto_104754 ?auto_104758 ) ( IN-CITY ?auto_104759 ?auto_104757 ) ( not ( = ?auto_104750 ?auto_104759 ) ) ( not ( = ?auto_104758 ?auto_104759 ) ) ( not ( = ?auto_104756 ?auto_104759 ) ) ( OBJ-AT ?auto_104752 ?auto_104759 ) ( TRUCK-AT ?auto_104755 ?auto_104750 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104752 ?auto_104751 ?auto_104750 )
      ( DELIVER-3PKG-VERIFY ?auto_104751 ?auto_104752 ?auto_104753 ?auto_104750 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104772 - OBJ
      ?auto_104773 - OBJ
      ?auto_104774 - OBJ
      ?auto_104771 - LOCATION
    )
    :vars
    (
      ?auto_104779 - LOCATION
      ?auto_104778 - CITY
      ?auto_104776 - OBJ
      ?auto_104777 - LOCATION
      ?auto_104780 - LOCATION
      ?auto_104775 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104773 ?auto_104772 ) ) ( not ( = ?auto_104774 ?auto_104772 ) ) ( not ( = ?auto_104774 ?auto_104773 ) ) ( IN-CITY ?auto_104779 ?auto_104778 ) ( IN-CITY ?auto_104771 ?auto_104778 ) ( not ( = ?auto_104771 ?auto_104779 ) ) ( OBJ-AT ?auto_104772 ?auto_104779 ) ( not ( = ?auto_104776 ?auto_104774 ) ) ( not ( = ?auto_104772 ?auto_104776 ) ) ( IN-CITY ?auto_104777 ?auto_104778 ) ( not ( = ?auto_104771 ?auto_104777 ) ) ( not ( = ?auto_104779 ?auto_104777 ) ) ( OBJ-AT ?auto_104776 ?auto_104777 ) ( not ( = ?auto_104776 ?auto_104773 ) ) ( OBJ-AT ?auto_104773 ?auto_104779 ) ( IN-CITY ?auto_104780 ?auto_104778 ) ( not ( = ?auto_104771 ?auto_104780 ) ) ( not ( = ?auto_104779 ?auto_104780 ) ) ( not ( = ?auto_104777 ?auto_104780 ) ) ( OBJ-AT ?auto_104774 ?auto_104780 ) ( TRUCK-AT ?auto_104775 ?auto_104771 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104774 ?auto_104772 ?auto_104771 )
      ( DELIVER-3PKG-VERIFY ?auto_104772 ?auto_104773 ?auto_104774 ?auto_104771 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104793 - OBJ
      ?auto_104794 - OBJ
      ?auto_104795 - OBJ
      ?auto_104792 - LOCATION
    )
    :vars
    (
      ?auto_104801 - OBJ
      ?auto_104799 - LOCATION
      ?auto_104798 - CITY
      ?auto_104797 - LOCATION
      ?auto_104800 - LOCATION
      ?auto_104796 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104794 ?auto_104793 ) ) ( not ( = ?auto_104795 ?auto_104793 ) ) ( not ( = ?auto_104795 ?auto_104794 ) ) ( not ( = ?auto_104793 ?auto_104801 ) ) ( IN-CITY ?auto_104799 ?auto_104798 ) ( IN-CITY ?auto_104792 ?auto_104798 ) ( not ( = ?auto_104792 ?auto_104799 ) ) ( OBJ-AT ?auto_104793 ?auto_104799 ) ( not ( = ?auto_104795 ?auto_104801 ) ) ( IN-CITY ?auto_104797 ?auto_104798 ) ( not ( = ?auto_104792 ?auto_104797 ) ) ( not ( = ?auto_104799 ?auto_104797 ) ) ( OBJ-AT ?auto_104795 ?auto_104797 ) ( not ( = ?auto_104794 ?auto_104801 ) ) ( OBJ-AT ?auto_104794 ?auto_104799 ) ( IN-CITY ?auto_104800 ?auto_104798 ) ( not ( = ?auto_104792 ?auto_104800 ) ) ( not ( = ?auto_104799 ?auto_104800 ) ) ( not ( = ?auto_104797 ?auto_104800 ) ) ( OBJ-AT ?auto_104801 ?auto_104800 ) ( TRUCK-AT ?auto_104796 ?auto_104792 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104801 ?auto_104793 ?auto_104792 )
      ( DELIVER-3PKG-VERIFY ?auto_104793 ?auto_104794 ?auto_104795 ?auto_104792 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104814 - OBJ
      ?auto_104815 - OBJ
      ?auto_104816 - OBJ
      ?auto_104813 - LOCATION
    )
    :vars
    (
      ?auto_104821 - LOCATION
      ?auto_104820 - CITY
      ?auto_104819 - LOCATION
      ?auto_104817 - OBJ
      ?auto_104822 - LOCATION
      ?auto_104818 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104815 ?auto_104814 ) ) ( not ( = ?auto_104816 ?auto_104814 ) ) ( not ( = ?auto_104816 ?auto_104815 ) ) ( IN-CITY ?auto_104821 ?auto_104820 ) ( IN-CITY ?auto_104813 ?auto_104820 ) ( not ( = ?auto_104813 ?auto_104821 ) ) ( OBJ-AT ?auto_104814 ?auto_104821 ) ( IN-CITY ?auto_104819 ?auto_104820 ) ( not ( = ?auto_104813 ?auto_104819 ) ) ( not ( = ?auto_104821 ?auto_104819 ) ) ( OBJ-AT ?auto_104815 ?auto_104819 ) ( not ( = ?auto_104817 ?auto_104816 ) ) ( not ( = ?auto_104814 ?auto_104817 ) ) ( not ( = ?auto_104815 ?auto_104817 ) ) ( OBJ-AT ?auto_104817 ?auto_104821 ) ( IN-CITY ?auto_104822 ?auto_104820 ) ( not ( = ?auto_104813 ?auto_104822 ) ) ( not ( = ?auto_104821 ?auto_104822 ) ) ( not ( = ?auto_104819 ?auto_104822 ) ) ( OBJ-AT ?auto_104816 ?auto_104822 ) ( TRUCK-AT ?auto_104818 ?auto_104813 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104816 ?auto_104814 ?auto_104813 )
      ( DELIVER-3PKG-VERIFY ?auto_104814 ?auto_104815 ?auto_104816 ?auto_104813 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104824 - OBJ
      ?auto_104825 - OBJ
      ?auto_104826 - OBJ
      ?auto_104823 - LOCATION
    )
    :vars
    (
      ?auto_104832 - OBJ
      ?auto_104830 - LOCATION
      ?auto_104829 - CITY
      ?auto_104828 - LOCATION
      ?auto_104831 - LOCATION
      ?auto_104827 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_104825 ?auto_104824 ) ) ( not ( = ?auto_104826 ?auto_104824 ) ) ( not ( = ?auto_104826 ?auto_104825 ) ) ( not ( = ?auto_104824 ?auto_104832 ) ) ( IN-CITY ?auto_104830 ?auto_104829 ) ( IN-CITY ?auto_104823 ?auto_104829 ) ( not ( = ?auto_104823 ?auto_104830 ) ) ( OBJ-AT ?auto_104824 ?auto_104830 ) ( not ( = ?auto_104825 ?auto_104832 ) ) ( IN-CITY ?auto_104828 ?auto_104829 ) ( not ( = ?auto_104823 ?auto_104828 ) ) ( not ( = ?auto_104830 ?auto_104828 ) ) ( OBJ-AT ?auto_104825 ?auto_104828 ) ( not ( = ?auto_104826 ?auto_104832 ) ) ( OBJ-AT ?auto_104826 ?auto_104830 ) ( IN-CITY ?auto_104831 ?auto_104829 ) ( not ( = ?auto_104823 ?auto_104831 ) ) ( not ( = ?auto_104830 ?auto_104831 ) ) ( not ( = ?auto_104828 ?auto_104831 ) ) ( OBJ-AT ?auto_104832 ?auto_104831 ) ( TRUCK-AT ?auto_104827 ?auto_104823 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104832 ?auto_104824 ?auto_104823 )
      ( DELIVER-3PKG-VERIFY ?auto_104824 ?auto_104825 ?auto_104826 ?auto_104823 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105003 - OBJ
      ?auto_105004 - OBJ
      ?auto_105005 - OBJ
      ?auto_105006 - OBJ
      ?auto_105002 - LOCATION
    )
    :vars
    (
      ?auto_105010 - LOCATION
      ?auto_105009 - CITY
      ?auto_105008 - LOCATION
      ?auto_105011 - LOCATION
      ?auto_105007 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_105004 ?auto_105003 ) ) ( not ( = ?auto_105005 ?auto_105003 ) ) ( not ( = ?auto_105005 ?auto_105004 ) ) ( not ( = ?auto_105006 ?auto_105003 ) ) ( not ( = ?auto_105006 ?auto_105004 ) ) ( not ( = ?auto_105006 ?auto_105005 ) ) ( IN-CITY ?auto_105010 ?auto_105009 ) ( IN-CITY ?auto_105002 ?auto_105009 ) ( not ( = ?auto_105002 ?auto_105010 ) ) ( OBJ-AT ?auto_105006 ?auto_105010 ) ( IN-CITY ?auto_105008 ?auto_105009 ) ( not ( = ?auto_105002 ?auto_105008 ) ) ( not ( = ?auto_105010 ?auto_105008 ) ) ( OBJ-AT ?auto_105005 ?auto_105008 ) ( OBJ-AT ?auto_105004 ?auto_105010 ) ( IN-CITY ?auto_105011 ?auto_105009 ) ( not ( = ?auto_105002 ?auto_105011 ) ) ( not ( = ?auto_105010 ?auto_105011 ) ) ( not ( = ?auto_105008 ?auto_105011 ) ) ( OBJ-AT ?auto_105003 ?auto_105011 ) ( TRUCK-AT ?auto_105007 ?auto_105002 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_105003 ?auto_105006 ?auto_105002 )
      ( DELIVER-4PKG-VERIFY ?auto_105003 ?auto_105004 ?auto_105005 ?auto_105006 ?auto_105002 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105035 - OBJ
      ?auto_105036 - OBJ
      ?auto_105037 - OBJ
      ?auto_105038 - OBJ
      ?auto_105034 - LOCATION
    )
    :vars
    (
      ?auto_105042 - LOCATION
      ?auto_105041 - CITY
      ?auto_105040 - LOCATION
      ?auto_105043 - LOCATION
      ?auto_105039 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_105036 ?auto_105035 ) ) ( not ( = ?auto_105037 ?auto_105035 ) ) ( not ( = ?auto_105037 ?auto_105036 ) ) ( not ( = ?auto_105038 ?auto_105035 ) ) ( not ( = ?auto_105038 ?auto_105036 ) ) ( not ( = ?auto_105038 ?auto_105037 ) ) ( IN-CITY ?auto_105042 ?auto_105041 ) ( IN-CITY ?auto_105034 ?auto_105041 ) ( not ( = ?auto_105034 ?auto_105042 ) ) ( OBJ-AT ?auto_105037 ?auto_105042 ) ( IN-CITY ?auto_105040 ?auto_105041 ) ( not ( = ?auto_105034 ?auto_105040 ) ) ( not ( = ?auto_105042 ?auto_105040 ) ) ( OBJ-AT ?auto_105038 ?auto_105040 ) ( OBJ-AT ?auto_105036 ?auto_105042 ) ( IN-CITY ?auto_105043 ?auto_105041 ) ( not ( = ?auto_105034 ?auto_105043 ) ) ( not ( = ?auto_105042 ?auto_105043 ) ) ( not ( = ?auto_105040 ?auto_105043 ) ) ( OBJ-AT ?auto_105035 ?auto_105043 ) ( TRUCK-AT ?auto_105039 ?auto_105034 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_105035 ?auto_105037 ?auto_105034 )
      ( DELIVER-4PKG-VERIFY ?auto_105035 ?auto_105036 ?auto_105037 ?auto_105038 ?auto_105034 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105067 - OBJ
      ?auto_105068 - OBJ
      ?auto_105069 - OBJ
      ?auto_105070 - OBJ
      ?auto_105066 - LOCATION
    )
    :vars
    (
      ?auto_105074 - LOCATION
      ?auto_105073 - CITY
      ?auto_105072 - LOCATION
      ?auto_105075 - LOCATION
      ?auto_105071 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_105068 ?auto_105067 ) ) ( not ( = ?auto_105069 ?auto_105067 ) ) ( not ( = ?auto_105069 ?auto_105068 ) ) ( not ( = ?auto_105070 ?auto_105067 ) ) ( not ( = ?auto_105070 ?auto_105068 ) ) ( not ( = ?auto_105070 ?auto_105069 ) ) ( IN-CITY ?auto_105074 ?auto_105073 ) ( IN-CITY ?auto_105066 ?auto_105073 ) ( not ( = ?auto_105066 ?auto_105074 ) ) ( OBJ-AT ?auto_105070 ?auto_105074 ) ( IN-CITY ?auto_105072 ?auto_105073 ) ( not ( = ?auto_105066 ?auto_105072 ) ) ( not ( = ?auto_105074 ?auto_105072 ) ) ( OBJ-AT ?auto_105068 ?auto_105072 ) ( OBJ-AT ?auto_105069 ?auto_105074 ) ( IN-CITY ?auto_105075 ?auto_105073 ) ( not ( = ?auto_105066 ?auto_105075 ) ) ( not ( = ?auto_105074 ?auto_105075 ) ) ( not ( = ?auto_105072 ?auto_105075 ) ) ( OBJ-AT ?auto_105067 ?auto_105075 ) ( TRUCK-AT ?auto_105071 ?auto_105066 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_105067 ?auto_105070 ?auto_105066 )
      ( DELIVER-4PKG-VERIFY ?auto_105067 ?auto_105068 ?auto_105069 ?auto_105070 ?auto_105066 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105099 - OBJ
      ?auto_105100 - OBJ
      ?auto_105101 - OBJ
      ?auto_105102 - OBJ
      ?auto_105098 - LOCATION
    )
    :vars
    (
      ?auto_105106 - LOCATION
      ?auto_105105 - CITY
      ?auto_105104 - LOCATION
      ?auto_105107 - LOCATION
      ?auto_105103 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_105100 ?auto_105099 ) ) ( not ( = ?auto_105101 ?auto_105099 ) ) ( not ( = ?auto_105101 ?auto_105100 ) ) ( not ( = ?auto_105102 ?auto_105099 ) ) ( not ( = ?auto_105102 ?auto_105100 ) ) ( not ( = ?auto_105102 ?auto_105101 ) ) ( IN-CITY ?auto_105106 ?auto_105105 ) ( IN-CITY ?auto_105098 ?auto_105105 ) ( not ( = ?auto_105098 ?auto_105106 ) ) ( OBJ-AT ?auto_105101 ?auto_105106 ) ( IN-CITY ?auto_105104 ?auto_105105 ) ( not ( = ?auto_105098 ?auto_105104 ) ) ( not ( = ?auto_105106 ?auto_105104 ) ) ( OBJ-AT ?auto_105100 ?auto_105104 ) ( OBJ-AT ?auto_105102 ?auto_105106 ) ( IN-CITY ?auto_105107 ?auto_105105 ) ( not ( = ?auto_105098 ?auto_105107 ) ) ( not ( = ?auto_105106 ?auto_105107 ) ) ( not ( = ?auto_105104 ?auto_105107 ) ) ( OBJ-AT ?auto_105099 ?auto_105107 ) ( TRUCK-AT ?auto_105103 ?auto_105098 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_105099 ?auto_105101 ?auto_105098 )
      ( DELIVER-4PKG-VERIFY ?auto_105099 ?auto_105100 ?auto_105101 ?auto_105102 ?auto_105098 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105199 - OBJ
      ?auto_105200 - OBJ
      ?auto_105201 - OBJ
      ?auto_105202 - OBJ
      ?auto_105198 - LOCATION
    )
    :vars
    (
      ?auto_105206 - LOCATION
      ?auto_105205 - CITY
      ?auto_105204 - LOCATION
      ?auto_105207 - LOCATION
      ?auto_105203 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_105200 ?auto_105199 ) ) ( not ( = ?auto_105201 ?auto_105199 ) ) ( not ( = ?auto_105201 ?auto_105200 ) ) ( not ( = ?auto_105202 ?auto_105199 ) ) ( not ( = ?auto_105202 ?auto_105200 ) ) ( not ( = ?auto_105202 ?auto_105201 ) ) ( IN-CITY ?auto_105206 ?auto_105205 ) ( IN-CITY ?auto_105198 ?auto_105205 ) ( not ( = ?auto_105198 ?auto_105206 ) ) ( OBJ-AT ?auto_105200 ?auto_105206 ) ( IN-CITY ?auto_105204 ?auto_105205 ) ( not ( = ?auto_105198 ?auto_105204 ) ) ( not ( = ?auto_105206 ?auto_105204 ) ) ( OBJ-AT ?auto_105202 ?auto_105204 ) ( OBJ-AT ?auto_105201 ?auto_105206 ) ( IN-CITY ?auto_105207 ?auto_105205 ) ( not ( = ?auto_105198 ?auto_105207 ) ) ( not ( = ?auto_105206 ?auto_105207 ) ) ( not ( = ?auto_105204 ?auto_105207 ) ) ( OBJ-AT ?auto_105199 ?auto_105207 ) ( TRUCK-AT ?auto_105203 ?auto_105198 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_105199 ?auto_105200 ?auto_105198 )
      ( DELIVER-4PKG-VERIFY ?auto_105199 ?auto_105200 ?auto_105201 ?auto_105202 ?auto_105198 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105231 - OBJ
      ?auto_105232 - OBJ
      ?auto_105233 - OBJ
      ?auto_105234 - OBJ
      ?auto_105230 - LOCATION
    )
    :vars
    (
      ?auto_105238 - LOCATION
      ?auto_105237 - CITY
      ?auto_105236 - LOCATION
      ?auto_105239 - LOCATION
      ?auto_105235 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_105232 ?auto_105231 ) ) ( not ( = ?auto_105233 ?auto_105231 ) ) ( not ( = ?auto_105233 ?auto_105232 ) ) ( not ( = ?auto_105234 ?auto_105231 ) ) ( not ( = ?auto_105234 ?auto_105232 ) ) ( not ( = ?auto_105234 ?auto_105233 ) ) ( IN-CITY ?auto_105238 ?auto_105237 ) ( IN-CITY ?auto_105230 ?auto_105237 ) ( not ( = ?auto_105230 ?auto_105238 ) ) ( OBJ-AT ?auto_105232 ?auto_105238 ) ( IN-CITY ?auto_105236 ?auto_105237 ) ( not ( = ?auto_105230 ?auto_105236 ) ) ( not ( = ?auto_105238 ?auto_105236 ) ) ( OBJ-AT ?auto_105233 ?auto_105236 ) ( OBJ-AT ?auto_105234 ?auto_105238 ) ( IN-CITY ?auto_105239 ?auto_105237 ) ( not ( = ?auto_105230 ?auto_105239 ) ) ( not ( = ?auto_105238 ?auto_105239 ) ) ( not ( = ?auto_105236 ?auto_105239 ) ) ( OBJ-AT ?auto_105231 ?auto_105239 ) ( TRUCK-AT ?auto_105235 ?auto_105230 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_105231 ?auto_105232 ?auto_105230 )
      ( DELIVER-4PKG-VERIFY ?auto_105231 ?auto_105232 ?auto_105233 ?auto_105234 ?auto_105230 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105331 - OBJ
      ?auto_105332 - OBJ
      ?auto_105333 - OBJ
      ?auto_105334 - OBJ
      ?auto_105330 - LOCATION
    )
    :vars
    (
      ?auto_105338 - LOCATION
      ?auto_105337 - CITY
      ?auto_105336 - LOCATION
      ?auto_105339 - LOCATION
      ?auto_105335 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_105332 ?auto_105331 ) ) ( not ( = ?auto_105333 ?auto_105331 ) ) ( not ( = ?auto_105333 ?auto_105332 ) ) ( not ( = ?auto_105334 ?auto_105331 ) ) ( not ( = ?auto_105334 ?auto_105332 ) ) ( not ( = ?auto_105334 ?auto_105333 ) ) ( IN-CITY ?auto_105338 ?auto_105337 ) ( IN-CITY ?auto_105330 ?auto_105337 ) ( not ( = ?auto_105330 ?auto_105338 ) ) ( OBJ-AT ?auto_105334 ?auto_105338 ) ( IN-CITY ?auto_105336 ?auto_105337 ) ( not ( = ?auto_105330 ?auto_105336 ) ) ( not ( = ?auto_105338 ?auto_105336 ) ) ( OBJ-AT ?auto_105333 ?auto_105336 ) ( OBJ-AT ?auto_105331 ?auto_105338 ) ( IN-CITY ?auto_105339 ?auto_105337 ) ( not ( = ?auto_105330 ?auto_105339 ) ) ( not ( = ?auto_105338 ?auto_105339 ) ) ( not ( = ?auto_105336 ?auto_105339 ) ) ( OBJ-AT ?auto_105332 ?auto_105339 ) ( TRUCK-AT ?auto_105335 ?auto_105330 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_105332 ?auto_105334 ?auto_105330 )
      ( DELIVER-4PKG-VERIFY ?auto_105331 ?auto_105332 ?auto_105333 ?auto_105334 ?auto_105330 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105363 - OBJ
      ?auto_105364 - OBJ
      ?auto_105365 - OBJ
      ?auto_105366 - OBJ
      ?auto_105362 - LOCATION
    )
    :vars
    (
      ?auto_105370 - LOCATION
      ?auto_105369 - CITY
      ?auto_105368 - LOCATION
      ?auto_105371 - LOCATION
      ?auto_105367 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_105364 ?auto_105363 ) ) ( not ( = ?auto_105365 ?auto_105363 ) ) ( not ( = ?auto_105365 ?auto_105364 ) ) ( not ( = ?auto_105366 ?auto_105363 ) ) ( not ( = ?auto_105366 ?auto_105364 ) ) ( not ( = ?auto_105366 ?auto_105365 ) ) ( IN-CITY ?auto_105370 ?auto_105369 ) ( IN-CITY ?auto_105362 ?auto_105369 ) ( not ( = ?auto_105362 ?auto_105370 ) ) ( OBJ-AT ?auto_105365 ?auto_105370 ) ( IN-CITY ?auto_105368 ?auto_105369 ) ( not ( = ?auto_105362 ?auto_105368 ) ) ( not ( = ?auto_105370 ?auto_105368 ) ) ( OBJ-AT ?auto_105366 ?auto_105368 ) ( OBJ-AT ?auto_105363 ?auto_105370 ) ( IN-CITY ?auto_105371 ?auto_105369 ) ( not ( = ?auto_105362 ?auto_105371 ) ) ( not ( = ?auto_105370 ?auto_105371 ) ) ( not ( = ?auto_105368 ?auto_105371 ) ) ( OBJ-AT ?auto_105364 ?auto_105371 ) ( TRUCK-AT ?auto_105367 ?auto_105362 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_105364 ?auto_105365 ?auto_105362 )
      ( DELIVER-4PKG-VERIFY ?auto_105363 ?auto_105364 ?auto_105365 ?auto_105366 ?auto_105362 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105464 - OBJ
      ?auto_105465 - OBJ
      ?auto_105466 - OBJ
      ?auto_105467 - OBJ
      ?auto_105463 - LOCATION
    )
    :vars
    (
      ?auto_105471 - LOCATION
      ?auto_105470 - CITY
      ?auto_105469 - LOCATION
      ?auto_105472 - LOCATION
      ?auto_105468 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_105465 ?auto_105464 ) ) ( not ( = ?auto_105466 ?auto_105464 ) ) ( not ( = ?auto_105466 ?auto_105465 ) ) ( not ( = ?auto_105467 ?auto_105464 ) ) ( not ( = ?auto_105467 ?auto_105465 ) ) ( not ( = ?auto_105467 ?auto_105466 ) ) ( IN-CITY ?auto_105471 ?auto_105470 ) ( IN-CITY ?auto_105463 ?auto_105470 ) ( not ( = ?auto_105463 ?auto_105471 ) ) ( OBJ-AT ?auto_105467 ?auto_105471 ) ( IN-CITY ?auto_105469 ?auto_105470 ) ( not ( = ?auto_105463 ?auto_105469 ) ) ( not ( = ?auto_105471 ?auto_105469 ) ) ( OBJ-AT ?auto_105465 ?auto_105469 ) ( OBJ-AT ?auto_105464 ?auto_105471 ) ( IN-CITY ?auto_105472 ?auto_105470 ) ( not ( = ?auto_105463 ?auto_105472 ) ) ( not ( = ?auto_105471 ?auto_105472 ) ) ( not ( = ?auto_105469 ?auto_105472 ) ) ( OBJ-AT ?auto_105466 ?auto_105472 ) ( TRUCK-AT ?auto_105468 ?auto_105463 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_105466 ?auto_105467 ?auto_105463 )
      ( DELIVER-4PKG-VERIFY ?auto_105464 ?auto_105465 ?auto_105466 ?auto_105467 ?auto_105463 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105496 - OBJ
      ?auto_105497 - OBJ
      ?auto_105498 - OBJ
      ?auto_105499 - OBJ
      ?auto_105495 - LOCATION
    )
    :vars
    (
      ?auto_105503 - LOCATION
      ?auto_105502 - CITY
      ?auto_105501 - LOCATION
      ?auto_105504 - LOCATION
      ?auto_105500 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_105497 ?auto_105496 ) ) ( not ( = ?auto_105498 ?auto_105496 ) ) ( not ( = ?auto_105498 ?auto_105497 ) ) ( not ( = ?auto_105499 ?auto_105496 ) ) ( not ( = ?auto_105499 ?auto_105497 ) ) ( not ( = ?auto_105499 ?auto_105498 ) ) ( IN-CITY ?auto_105503 ?auto_105502 ) ( IN-CITY ?auto_105495 ?auto_105502 ) ( not ( = ?auto_105495 ?auto_105503 ) ) ( OBJ-AT ?auto_105498 ?auto_105503 ) ( IN-CITY ?auto_105501 ?auto_105502 ) ( not ( = ?auto_105495 ?auto_105501 ) ) ( not ( = ?auto_105503 ?auto_105501 ) ) ( OBJ-AT ?auto_105497 ?auto_105501 ) ( OBJ-AT ?auto_105496 ?auto_105503 ) ( IN-CITY ?auto_105504 ?auto_105502 ) ( not ( = ?auto_105495 ?auto_105504 ) ) ( not ( = ?auto_105503 ?auto_105504 ) ) ( not ( = ?auto_105501 ?auto_105504 ) ) ( OBJ-AT ?auto_105499 ?auto_105504 ) ( TRUCK-AT ?auto_105500 ?auto_105495 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_105499 ?auto_105498 ?auto_105495 )
      ( DELIVER-4PKG-VERIFY ?auto_105496 ?auto_105497 ?auto_105498 ?auto_105499 ?auto_105495 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105561 - OBJ
      ?auto_105562 - OBJ
      ?auto_105563 - OBJ
      ?auto_105564 - OBJ
      ?auto_105560 - LOCATION
    )
    :vars
    (
      ?auto_105568 - LOCATION
      ?auto_105567 - CITY
      ?auto_105566 - LOCATION
      ?auto_105569 - LOCATION
      ?auto_105565 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_105562 ?auto_105561 ) ) ( not ( = ?auto_105563 ?auto_105561 ) ) ( not ( = ?auto_105563 ?auto_105562 ) ) ( not ( = ?auto_105564 ?auto_105561 ) ) ( not ( = ?auto_105564 ?auto_105562 ) ) ( not ( = ?auto_105564 ?auto_105563 ) ) ( IN-CITY ?auto_105568 ?auto_105567 ) ( IN-CITY ?auto_105560 ?auto_105567 ) ( not ( = ?auto_105560 ?auto_105568 ) ) ( OBJ-AT ?auto_105562 ?auto_105568 ) ( IN-CITY ?auto_105566 ?auto_105567 ) ( not ( = ?auto_105560 ?auto_105566 ) ) ( not ( = ?auto_105568 ?auto_105566 ) ) ( OBJ-AT ?auto_105564 ?auto_105566 ) ( OBJ-AT ?auto_105561 ?auto_105568 ) ( IN-CITY ?auto_105569 ?auto_105567 ) ( not ( = ?auto_105560 ?auto_105569 ) ) ( not ( = ?auto_105568 ?auto_105569 ) ) ( not ( = ?auto_105566 ?auto_105569 ) ) ( OBJ-AT ?auto_105563 ?auto_105569 ) ( TRUCK-AT ?auto_105565 ?auto_105560 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_105563 ?auto_105562 ?auto_105560 )
      ( DELIVER-4PKG-VERIFY ?auto_105561 ?auto_105562 ?auto_105563 ?auto_105564 ?auto_105560 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105628 - OBJ
      ?auto_105629 - OBJ
      ?auto_105630 - OBJ
      ?auto_105631 - OBJ
      ?auto_105627 - LOCATION
    )
    :vars
    (
      ?auto_105635 - LOCATION
      ?auto_105634 - CITY
      ?auto_105633 - LOCATION
      ?auto_105636 - LOCATION
      ?auto_105632 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_105629 ?auto_105628 ) ) ( not ( = ?auto_105630 ?auto_105628 ) ) ( not ( = ?auto_105630 ?auto_105629 ) ) ( not ( = ?auto_105631 ?auto_105628 ) ) ( not ( = ?auto_105631 ?auto_105629 ) ) ( not ( = ?auto_105631 ?auto_105630 ) ) ( IN-CITY ?auto_105635 ?auto_105634 ) ( IN-CITY ?auto_105627 ?auto_105634 ) ( not ( = ?auto_105627 ?auto_105635 ) ) ( OBJ-AT ?auto_105629 ?auto_105635 ) ( IN-CITY ?auto_105633 ?auto_105634 ) ( not ( = ?auto_105627 ?auto_105633 ) ) ( not ( = ?auto_105635 ?auto_105633 ) ) ( OBJ-AT ?auto_105630 ?auto_105633 ) ( OBJ-AT ?auto_105628 ?auto_105635 ) ( IN-CITY ?auto_105636 ?auto_105634 ) ( not ( = ?auto_105627 ?auto_105636 ) ) ( not ( = ?auto_105635 ?auto_105636 ) ) ( not ( = ?auto_105633 ?auto_105636 ) ) ( OBJ-AT ?auto_105631 ?auto_105636 ) ( TRUCK-AT ?auto_105632 ?auto_105627 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_105631 ?auto_105629 ?auto_105627 )
      ( DELIVER-4PKG-VERIFY ?auto_105628 ?auto_105629 ?auto_105630 ?auto_105631 ?auto_105627 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105728 - OBJ
      ?auto_105729 - OBJ
      ?auto_105730 - OBJ
      ?auto_105731 - OBJ
      ?auto_105727 - LOCATION
    )
    :vars
    (
      ?auto_105735 - LOCATION
      ?auto_105734 - CITY
      ?auto_105733 - LOCATION
      ?auto_105736 - LOCATION
      ?auto_105732 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_105729 ?auto_105728 ) ) ( not ( = ?auto_105730 ?auto_105728 ) ) ( not ( = ?auto_105730 ?auto_105729 ) ) ( not ( = ?auto_105731 ?auto_105728 ) ) ( not ( = ?auto_105731 ?auto_105729 ) ) ( not ( = ?auto_105731 ?auto_105730 ) ) ( IN-CITY ?auto_105735 ?auto_105734 ) ( IN-CITY ?auto_105727 ?auto_105734 ) ( not ( = ?auto_105727 ?auto_105735 ) ) ( OBJ-AT ?auto_105731 ?auto_105735 ) ( IN-CITY ?auto_105733 ?auto_105734 ) ( not ( = ?auto_105727 ?auto_105733 ) ) ( not ( = ?auto_105735 ?auto_105733 ) ) ( OBJ-AT ?auto_105728 ?auto_105733 ) ( OBJ-AT ?auto_105730 ?auto_105735 ) ( IN-CITY ?auto_105736 ?auto_105734 ) ( not ( = ?auto_105727 ?auto_105736 ) ) ( not ( = ?auto_105735 ?auto_105736 ) ) ( not ( = ?auto_105733 ?auto_105736 ) ) ( OBJ-AT ?auto_105729 ?auto_105736 ) ( TRUCK-AT ?auto_105732 ?auto_105727 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_105729 ?auto_105731 ?auto_105727 )
      ( DELIVER-4PKG-VERIFY ?auto_105728 ?auto_105729 ?auto_105730 ?auto_105731 ?auto_105727 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105760 - OBJ
      ?auto_105761 - OBJ
      ?auto_105762 - OBJ
      ?auto_105763 - OBJ
      ?auto_105759 - LOCATION
    )
    :vars
    (
      ?auto_105767 - LOCATION
      ?auto_105766 - CITY
      ?auto_105765 - LOCATION
      ?auto_105768 - LOCATION
      ?auto_105764 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_105761 ?auto_105760 ) ) ( not ( = ?auto_105762 ?auto_105760 ) ) ( not ( = ?auto_105762 ?auto_105761 ) ) ( not ( = ?auto_105763 ?auto_105760 ) ) ( not ( = ?auto_105763 ?auto_105761 ) ) ( not ( = ?auto_105763 ?auto_105762 ) ) ( IN-CITY ?auto_105767 ?auto_105766 ) ( IN-CITY ?auto_105759 ?auto_105766 ) ( not ( = ?auto_105759 ?auto_105767 ) ) ( OBJ-AT ?auto_105762 ?auto_105767 ) ( IN-CITY ?auto_105765 ?auto_105766 ) ( not ( = ?auto_105759 ?auto_105765 ) ) ( not ( = ?auto_105767 ?auto_105765 ) ) ( OBJ-AT ?auto_105760 ?auto_105765 ) ( OBJ-AT ?auto_105763 ?auto_105767 ) ( IN-CITY ?auto_105768 ?auto_105766 ) ( not ( = ?auto_105759 ?auto_105768 ) ) ( not ( = ?auto_105767 ?auto_105768 ) ) ( not ( = ?auto_105765 ?auto_105768 ) ) ( OBJ-AT ?auto_105761 ?auto_105768 ) ( TRUCK-AT ?auto_105764 ?auto_105759 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_105761 ?auto_105762 ?auto_105759 )
      ( DELIVER-4PKG-VERIFY ?auto_105760 ?auto_105761 ?auto_105762 ?auto_105763 ?auto_105759 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105792 - OBJ
      ?auto_105793 - OBJ
      ?auto_105794 - OBJ
      ?auto_105795 - OBJ
      ?auto_105791 - LOCATION
    )
    :vars
    (
      ?auto_105799 - LOCATION
      ?auto_105798 - CITY
      ?auto_105797 - LOCATION
      ?auto_105800 - LOCATION
      ?auto_105796 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_105793 ?auto_105792 ) ) ( not ( = ?auto_105794 ?auto_105792 ) ) ( not ( = ?auto_105794 ?auto_105793 ) ) ( not ( = ?auto_105795 ?auto_105792 ) ) ( not ( = ?auto_105795 ?auto_105793 ) ) ( not ( = ?auto_105795 ?auto_105794 ) ) ( IN-CITY ?auto_105799 ?auto_105798 ) ( IN-CITY ?auto_105791 ?auto_105798 ) ( not ( = ?auto_105791 ?auto_105799 ) ) ( OBJ-AT ?auto_105795 ?auto_105799 ) ( IN-CITY ?auto_105797 ?auto_105798 ) ( not ( = ?auto_105791 ?auto_105797 ) ) ( not ( = ?auto_105799 ?auto_105797 ) ) ( OBJ-AT ?auto_105792 ?auto_105797 ) ( OBJ-AT ?auto_105793 ?auto_105799 ) ( IN-CITY ?auto_105800 ?auto_105798 ) ( not ( = ?auto_105791 ?auto_105800 ) ) ( not ( = ?auto_105799 ?auto_105800 ) ) ( not ( = ?auto_105797 ?auto_105800 ) ) ( OBJ-AT ?auto_105794 ?auto_105800 ) ( TRUCK-AT ?auto_105796 ?auto_105791 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_105794 ?auto_105795 ?auto_105791 )
      ( DELIVER-4PKG-VERIFY ?auto_105792 ?auto_105793 ?auto_105794 ?auto_105795 ?auto_105791 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105824 - OBJ
      ?auto_105825 - OBJ
      ?auto_105826 - OBJ
      ?auto_105827 - OBJ
      ?auto_105823 - LOCATION
    )
    :vars
    (
      ?auto_105831 - LOCATION
      ?auto_105830 - CITY
      ?auto_105829 - LOCATION
      ?auto_105832 - LOCATION
      ?auto_105828 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_105825 ?auto_105824 ) ) ( not ( = ?auto_105826 ?auto_105824 ) ) ( not ( = ?auto_105826 ?auto_105825 ) ) ( not ( = ?auto_105827 ?auto_105824 ) ) ( not ( = ?auto_105827 ?auto_105825 ) ) ( not ( = ?auto_105827 ?auto_105826 ) ) ( IN-CITY ?auto_105831 ?auto_105830 ) ( IN-CITY ?auto_105823 ?auto_105830 ) ( not ( = ?auto_105823 ?auto_105831 ) ) ( OBJ-AT ?auto_105826 ?auto_105831 ) ( IN-CITY ?auto_105829 ?auto_105830 ) ( not ( = ?auto_105823 ?auto_105829 ) ) ( not ( = ?auto_105831 ?auto_105829 ) ) ( OBJ-AT ?auto_105824 ?auto_105829 ) ( OBJ-AT ?auto_105825 ?auto_105831 ) ( IN-CITY ?auto_105832 ?auto_105830 ) ( not ( = ?auto_105823 ?auto_105832 ) ) ( not ( = ?auto_105831 ?auto_105832 ) ) ( not ( = ?auto_105829 ?auto_105832 ) ) ( OBJ-AT ?auto_105827 ?auto_105832 ) ( TRUCK-AT ?auto_105828 ?auto_105823 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_105827 ?auto_105826 ?auto_105823 )
      ( DELIVER-4PKG-VERIFY ?auto_105824 ?auto_105825 ?auto_105826 ?auto_105827 ?auto_105823 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105958 - OBJ
      ?auto_105959 - OBJ
      ?auto_105960 - OBJ
      ?auto_105961 - OBJ
      ?auto_105957 - LOCATION
    )
    :vars
    (
      ?auto_105965 - LOCATION
      ?auto_105964 - CITY
      ?auto_105963 - LOCATION
      ?auto_105966 - LOCATION
      ?auto_105962 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_105959 ?auto_105958 ) ) ( not ( = ?auto_105960 ?auto_105958 ) ) ( not ( = ?auto_105960 ?auto_105959 ) ) ( not ( = ?auto_105961 ?auto_105958 ) ) ( not ( = ?auto_105961 ?auto_105959 ) ) ( not ( = ?auto_105961 ?auto_105960 ) ) ( IN-CITY ?auto_105965 ?auto_105964 ) ( IN-CITY ?auto_105957 ?auto_105964 ) ( not ( = ?auto_105957 ?auto_105965 ) ) ( OBJ-AT ?auto_105959 ?auto_105965 ) ( IN-CITY ?auto_105963 ?auto_105964 ) ( not ( = ?auto_105957 ?auto_105963 ) ) ( not ( = ?auto_105965 ?auto_105963 ) ) ( OBJ-AT ?auto_105958 ?auto_105963 ) ( OBJ-AT ?auto_105961 ?auto_105965 ) ( IN-CITY ?auto_105966 ?auto_105964 ) ( not ( = ?auto_105957 ?auto_105966 ) ) ( not ( = ?auto_105965 ?auto_105966 ) ) ( not ( = ?auto_105963 ?auto_105966 ) ) ( OBJ-AT ?auto_105960 ?auto_105966 ) ( TRUCK-AT ?auto_105962 ?auto_105957 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_105960 ?auto_105959 ?auto_105957 )
      ( DELIVER-4PKG-VERIFY ?auto_105958 ?auto_105959 ?auto_105960 ?auto_105961 ?auto_105957 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105990 - OBJ
      ?auto_105991 - OBJ
      ?auto_105992 - OBJ
      ?auto_105993 - OBJ
      ?auto_105989 - LOCATION
    )
    :vars
    (
      ?auto_105997 - LOCATION
      ?auto_105996 - CITY
      ?auto_105995 - LOCATION
      ?auto_105998 - LOCATION
      ?auto_105994 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_105991 ?auto_105990 ) ) ( not ( = ?auto_105992 ?auto_105990 ) ) ( not ( = ?auto_105992 ?auto_105991 ) ) ( not ( = ?auto_105993 ?auto_105990 ) ) ( not ( = ?auto_105993 ?auto_105991 ) ) ( not ( = ?auto_105993 ?auto_105992 ) ) ( IN-CITY ?auto_105997 ?auto_105996 ) ( IN-CITY ?auto_105989 ?auto_105996 ) ( not ( = ?auto_105989 ?auto_105997 ) ) ( OBJ-AT ?auto_105991 ?auto_105997 ) ( IN-CITY ?auto_105995 ?auto_105996 ) ( not ( = ?auto_105989 ?auto_105995 ) ) ( not ( = ?auto_105997 ?auto_105995 ) ) ( OBJ-AT ?auto_105990 ?auto_105995 ) ( OBJ-AT ?auto_105992 ?auto_105997 ) ( IN-CITY ?auto_105998 ?auto_105996 ) ( not ( = ?auto_105989 ?auto_105998 ) ) ( not ( = ?auto_105997 ?auto_105998 ) ) ( not ( = ?auto_105995 ?auto_105998 ) ) ( OBJ-AT ?auto_105993 ?auto_105998 ) ( TRUCK-AT ?auto_105994 ?auto_105989 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_105993 ?auto_105991 ?auto_105989 )
      ( DELIVER-4PKG-VERIFY ?auto_105990 ?auto_105991 ?auto_105992 ?auto_105993 ?auto_105989 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106193 - OBJ
      ?auto_106194 - OBJ
      ?auto_106195 - OBJ
      ?auto_106196 - OBJ
      ?auto_106192 - LOCATION
    )
    :vars
    (
      ?auto_106200 - LOCATION
      ?auto_106199 - CITY
      ?auto_106198 - LOCATION
      ?auto_106201 - LOCATION
      ?auto_106197 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_106194 ?auto_106193 ) ) ( not ( = ?auto_106195 ?auto_106193 ) ) ( not ( = ?auto_106195 ?auto_106194 ) ) ( not ( = ?auto_106196 ?auto_106193 ) ) ( not ( = ?auto_106196 ?auto_106194 ) ) ( not ( = ?auto_106196 ?auto_106195 ) ) ( IN-CITY ?auto_106200 ?auto_106199 ) ( IN-CITY ?auto_106192 ?auto_106199 ) ( not ( = ?auto_106192 ?auto_106200 ) ) ( OBJ-AT ?auto_106193 ?auto_106200 ) ( IN-CITY ?auto_106198 ?auto_106199 ) ( not ( = ?auto_106192 ?auto_106198 ) ) ( not ( = ?auto_106200 ?auto_106198 ) ) ( OBJ-AT ?auto_106196 ?auto_106198 ) ( OBJ-AT ?auto_106195 ?auto_106200 ) ( IN-CITY ?auto_106201 ?auto_106199 ) ( not ( = ?auto_106192 ?auto_106201 ) ) ( not ( = ?auto_106200 ?auto_106201 ) ) ( not ( = ?auto_106198 ?auto_106201 ) ) ( OBJ-AT ?auto_106194 ?auto_106201 ) ( TRUCK-AT ?auto_106197 ?auto_106192 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_106194 ?auto_106193 ?auto_106192 )
      ( DELIVER-4PKG-VERIFY ?auto_106193 ?auto_106194 ?auto_106195 ?auto_106196 ?auto_106192 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106225 - OBJ
      ?auto_106226 - OBJ
      ?auto_106227 - OBJ
      ?auto_106228 - OBJ
      ?auto_106224 - LOCATION
    )
    :vars
    (
      ?auto_106232 - LOCATION
      ?auto_106231 - CITY
      ?auto_106230 - LOCATION
      ?auto_106233 - LOCATION
      ?auto_106229 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_106226 ?auto_106225 ) ) ( not ( = ?auto_106227 ?auto_106225 ) ) ( not ( = ?auto_106227 ?auto_106226 ) ) ( not ( = ?auto_106228 ?auto_106225 ) ) ( not ( = ?auto_106228 ?auto_106226 ) ) ( not ( = ?auto_106228 ?auto_106227 ) ) ( IN-CITY ?auto_106232 ?auto_106231 ) ( IN-CITY ?auto_106224 ?auto_106231 ) ( not ( = ?auto_106224 ?auto_106232 ) ) ( OBJ-AT ?auto_106225 ?auto_106232 ) ( IN-CITY ?auto_106230 ?auto_106231 ) ( not ( = ?auto_106224 ?auto_106230 ) ) ( not ( = ?auto_106232 ?auto_106230 ) ) ( OBJ-AT ?auto_106227 ?auto_106230 ) ( OBJ-AT ?auto_106228 ?auto_106232 ) ( IN-CITY ?auto_106233 ?auto_106231 ) ( not ( = ?auto_106224 ?auto_106233 ) ) ( not ( = ?auto_106232 ?auto_106233 ) ) ( not ( = ?auto_106230 ?auto_106233 ) ) ( OBJ-AT ?auto_106226 ?auto_106233 ) ( TRUCK-AT ?auto_106229 ?auto_106224 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_106226 ?auto_106225 ?auto_106224 )
      ( DELIVER-4PKG-VERIFY ?auto_106225 ?auto_106226 ?auto_106227 ?auto_106228 ?auto_106224 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106325 - OBJ
      ?auto_106326 - OBJ
      ?auto_106327 - OBJ
      ?auto_106328 - OBJ
      ?auto_106324 - LOCATION
    )
    :vars
    (
      ?auto_106332 - LOCATION
      ?auto_106331 - CITY
      ?auto_106330 - LOCATION
      ?auto_106333 - LOCATION
      ?auto_106329 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_106326 ?auto_106325 ) ) ( not ( = ?auto_106327 ?auto_106325 ) ) ( not ( = ?auto_106327 ?auto_106326 ) ) ( not ( = ?auto_106328 ?auto_106325 ) ) ( not ( = ?auto_106328 ?auto_106326 ) ) ( not ( = ?auto_106328 ?auto_106327 ) ) ( IN-CITY ?auto_106332 ?auto_106331 ) ( IN-CITY ?auto_106324 ?auto_106331 ) ( not ( = ?auto_106324 ?auto_106332 ) ) ( OBJ-AT ?auto_106325 ?auto_106332 ) ( IN-CITY ?auto_106330 ?auto_106331 ) ( not ( = ?auto_106324 ?auto_106330 ) ) ( not ( = ?auto_106332 ?auto_106330 ) ) ( OBJ-AT ?auto_106328 ?auto_106330 ) ( OBJ-AT ?auto_106326 ?auto_106332 ) ( IN-CITY ?auto_106333 ?auto_106331 ) ( not ( = ?auto_106324 ?auto_106333 ) ) ( not ( = ?auto_106332 ?auto_106333 ) ) ( not ( = ?auto_106330 ?auto_106333 ) ) ( OBJ-AT ?auto_106327 ?auto_106333 ) ( TRUCK-AT ?auto_106329 ?auto_106324 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_106327 ?auto_106325 ?auto_106324 )
      ( DELIVER-4PKG-VERIFY ?auto_106325 ?auto_106326 ?auto_106327 ?auto_106328 ?auto_106324 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106392 - OBJ
      ?auto_106393 - OBJ
      ?auto_106394 - OBJ
      ?auto_106395 - OBJ
      ?auto_106391 - LOCATION
    )
    :vars
    (
      ?auto_106399 - LOCATION
      ?auto_106398 - CITY
      ?auto_106397 - LOCATION
      ?auto_106400 - LOCATION
      ?auto_106396 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_106393 ?auto_106392 ) ) ( not ( = ?auto_106394 ?auto_106392 ) ) ( not ( = ?auto_106394 ?auto_106393 ) ) ( not ( = ?auto_106395 ?auto_106392 ) ) ( not ( = ?auto_106395 ?auto_106393 ) ) ( not ( = ?auto_106395 ?auto_106394 ) ) ( IN-CITY ?auto_106399 ?auto_106398 ) ( IN-CITY ?auto_106391 ?auto_106398 ) ( not ( = ?auto_106391 ?auto_106399 ) ) ( OBJ-AT ?auto_106392 ?auto_106399 ) ( IN-CITY ?auto_106397 ?auto_106398 ) ( not ( = ?auto_106391 ?auto_106397 ) ) ( not ( = ?auto_106399 ?auto_106397 ) ) ( OBJ-AT ?auto_106394 ?auto_106397 ) ( OBJ-AT ?auto_106393 ?auto_106399 ) ( IN-CITY ?auto_106400 ?auto_106398 ) ( not ( = ?auto_106391 ?auto_106400 ) ) ( not ( = ?auto_106399 ?auto_106400 ) ) ( not ( = ?auto_106397 ?auto_106400 ) ) ( OBJ-AT ?auto_106395 ?auto_106400 ) ( TRUCK-AT ?auto_106396 ?auto_106391 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_106395 ?auto_106392 ?auto_106391 )
      ( DELIVER-4PKG-VERIFY ?auto_106392 ?auto_106393 ?auto_106394 ?auto_106395 ?auto_106391 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106492 - OBJ
      ?auto_106493 - OBJ
      ?auto_106494 - OBJ
      ?auto_106495 - OBJ
      ?auto_106491 - LOCATION
    )
    :vars
    (
      ?auto_106499 - LOCATION
      ?auto_106498 - CITY
      ?auto_106497 - LOCATION
      ?auto_106500 - LOCATION
      ?auto_106496 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_106493 ?auto_106492 ) ) ( not ( = ?auto_106494 ?auto_106492 ) ) ( not ( = ?auto_106494 ?auto_106493 ) ) ( not ( = ?auto_106495 ?auto_106492 ) ) ( not ( = ?auto_106495 ?auto_106493 ) ) ( not ( = ?auto_106495 ?auto_106494 ) ) ( IN-CITY ?auto_106499 ?auto_106498 ) ( IN-CITY ?auto_106491 ?auto_106498 ) ( not ( = ?auto_106491 ?auto_106499 ) ) ( OBJ-AT ?auto_106492 ?auto_106499 ) ( IN-CITY ?auto_106497 ?auto_106498 ) ( not ( = ?auto_106491 ?auto_106497 ) ) ( not ( = ?auto_106499 ?auto_106497 ) ) ( OBJ-AT ?auto_106493 ?auto_106497 ) ( OBJ-AT ?auto_106495 ?auto_106499 ) ( IN-CITY ?auto_106500 ?auto_106498 ) ( not ( = ?auto_106491 ?auto_106500 ) ) ( not ( = ?auto_106499 ?auto_106500 ) ) ( not ( = ?auto_106497 ?auto_106500 ) ) ( OBJ-AT ?auto_106494 ?auto_106500 ) ( TRUCK-AT ?auto_106496 ?auto_106491 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_106494 ?auto_106492 ?auto_106491 )
      ( DELIVER-4PKG-VERIFY ?auto_106492 ?auto_106493 ?auto_106494 ?auto_106495 ?auto_106491 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106524 - OBJ
      ?auto_106525 - OBJ
      ?auto_106526 - OBJ
      ?auto_106527 - OBJ
      ?auto_106523 - LOCATION
    )
    :vars
    (
      ?auto_106531 - LOCATION
      ?auto_106530 - CITY
      ?auto_106529 - LOCATION
      ?auto_106532 - LOCATION
      ?auto_106528 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_106525 ?auto_106524 ) ) ( not ( = ?auto_106526 ?auto_106524 ) ) ( not ( = ?auto_106526 ?auto_106525 ) ) ( not ( = ?auto_106527 ?auto_106524 ) ) ( not ( = ?auto_106527 ?auto_106525 ) ) ( not ( = ?auto_106527 ?auto_106526 ) ) ( IN-CITY ?auto_106531 ?auto_106530 ) ( IN-CITY ?auto_106523 ?auto_106530 ) ( not ( = ?auto_106523 ?auto_106531 ) ) ( OBJ-AT ?auto_106524 ?auto_106531 ) ( IN-CITY ?auto_106529 ?auto_106530 ) ( not ( = ?auto_106523 ?auto_106529 ) ) ( not ( = ?auto_106531 ?auto_106529 ) ) ( OBJ-AT ?auto_106525 ?auto_106529 ) ( OBJ-AT ?auto_106526 ?auto_106531 ) ( IN-CITY ?auto_106532 ?auto_106530 ) ( not ( = ?auto_106523 ?auto_106532 ) ) ( not ( = ?auto_106531 ?auto_106532 ) ) ( not ( = ?auto_106529 ?auto_106532 ) ) ( OBJ-AT ?auto_106527 ?auto_106532 ) ( TRUCK-AT ?auto_106528 ?auto_106523 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_106527 ?auto_106524 ?auto_106523 )
      ( DELIVER-4PKG-VERIFY ?auto_106524 ?auto_106525 ?auto_106526 ?auto_106527 ?auto_106523 ) )
  )

)

