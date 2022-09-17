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
      ?auto_154231 - OBJ
      ?auto_154230 - LOCATION
    )
    :vars
    (
      ?auto_154232 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_154232 ?auto_154230 ) ( IN-TRUCK ?auto_154231 ?auto_154232 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_154231 ?auto_154232 ?auto_154230 )
      ( DELIVER-1PKG-VERIFY ?auto_154231 ?auto_154230 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_154249 - OBJ
      ?auto_154248 - LOCATION
    )
    :vars
    (
      ?auto_154250 - TRUCK
      ?auto_154251 - LOCATION
      ?auto_154252 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_154249 ?auto_154250 ) ( TRUCK-AT ?auto_154250 ?auto_154251 ) ( IN-CITY ?auto_154251 ?auto_154252 ) ( IN-CITY ?auto_154248 ?auto_154252 ) ( not ( = ?auto_154248 ?auto_154251 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_154250 ?auto_154251 ?auto_154248 ?auto_154252 )
      ( DELIVER-1PKG ?auto_154249 ?auto_154248 )
      ( DELIVER-1PKG-VERIFY ?auto_154249 ?auto_154248 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_154275 - OBJ
      ?auto_154274 - LOCATION
    )
    :vars
    (
      ?auto_154277 - TRUCK
      ?auto_154276 - LOCATION
      ?auto_154278 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_154277 ?auto_154276 ) ( IN-CITY ?auto_154276 ?auto_154278 ) ( IN-CITY ?auto_154274 ?auto_154278 ) ( not ( = ?auto_154274 ?auto_154276 ) ) ( OBJ-AT ?auto_154275 ?auto_154276 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_154275 ?auto_154277 ?auto_154276 )
      ( DELIVER-1PKG ?auto_154275 ?auto_154274 )
      ( DELIVER-1PKG-VERIFY ?auto_154275 ?auto_154274 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_154301 - OBJ
      ?auto_154300 - LOCATION
    )
    :vars
    (
      ?auto_154303 - LOCATION
      ?auto_154302 - CITY
      ?auto_154304 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_154303 ?auto_154302 ) ( IN-CITY ?auto_154300 ?auto_154302 ) ( not ( = ?auto_154300 ?auto_154303 ) ) ( OBJ-AT ?auto_154301 ?auto_154303 ) ( TRUCK-AT ?auto_154304 ?auto_154300 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_154304 ?auto_154300 ?auto_154303 ?auto_154302 )
      ( DELIVER-1PKG ?auto_154301 ?auto_154300 )
      ( DELIVER-1PKG-VERIFY ?auto_154301 ?auto_154300 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_154441 - OBJ
      ?auto_154440 - LOCATION
    )
    :vars
    (
      ?auto_154442 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_154442 ?auto_154440 ) ( IN-TRUCK ?auto_154441 ?auto_154442 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_154441 ?auto_154442 ?auto_154440 )
      ( DELIVER-1PKG-VERIFY ?auto_154441 ?auto_154440 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_154444 - OBJ
      ?auto_154445 - OBJ
      ?auto_154443 - LOCATION
    )
    :vars
    (
      ?auto_154446 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_154445 ?auto_154444 ) ) ( TRUCK-AT ?auto_154446 ?auto_154443 ) ( IN-TRUCK ?auto_154445 ?auto_154446 ) ( OBJ-AT ?auto_154444 ?auto_154443 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_154445 ?auto_154443 )
      ( DELIVER-2PKG-VERIFY ?auto_154444 ?auto_154445 ?auto_154443 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_154448 - OBJ
      ?auto_154449 - OBJ
      ?auto_154447 - LOCATION
    )
    :vars
    (
      ?auto_154450 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_154449 ?auto_154448 ) ) ( TRUCK-AT ?auto_154450 ?auto_154447 ) ( IN-TRUCK ?auto_154448 ?auto_154450 ) ( OBJ-AT ?auto_154449 ?auto_154447 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_154448 ?auto_154447 )
      ( DELIVER-2PKG-VERIFY ?auto_154448 ?auto_154449 ?auto_154447 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_154581 - OBJ
      ?auto_154580 - LOCATION
    )
    :vars
    (
      ?auto_154582 - TRUCK
      ?auto_154583 - LOCATION
      ?auto_154584 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_154581 ?auto_154582 ) ( TRUCK-AT ?auto_154582 ?auto_154583 ) ( IN-CITY ?auto_154583 ?auto_154584 ) ( IN-CITY ?auto_154580 ?auto_154584 ) ( not ( = ?auto_154580 ?auto_154583 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_154582 ?auto_154583 ?auto_154580 ?auto_154584 )
      ( DELIVER-1PKG ?auto_154581 ?auto_154580 )
      ( DELIVER-1PKG-VERIFY ?auto_154581 ?auto_154580 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_154586 - OBJ
      ?auto_154587 - OBJ
      ?auto_154585 - LOCATION
    )
    :vars
    (
      ?auto_154590 - TRUCK
      ?auto_154588 - LOCATION
      ?auto_154589 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_154587 ?auto_154586 ) ) ( IN-TRUCK ?auto_154587 ?auto_154590 ) ( TRUCK-AT ?auto_154590 ?auto_154588 ) ( IN-CITY ?auto_154588 ?auto_154589 ) ( IN-CITY ?auto_154585 ?auto_154589 ) ( not ( = ?auto_154585 ?auto_154588 ) ) ( OBJ-AT ?auto_154586 ?auto_154585 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_154587 ?auto_154585 )
      ( DELIVER-2PKG-VERIFY ?auto_154586 ?auto_154587 ?auto_154585 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_154592 - OBJ
      ?auto_154593 - OBJ
      ?auto_154591 - LOCATION
    )
    :vars
    (
      ?auto_154595 - TRUCK
      ?auto_154596 - LOCATION
      ?auto_154594 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_154593 ?auto_154592 ) ) ( IN-TRUCK ?auto_154592 ?auto_154595 ) ( TRUCK-AT ?auto_154595 ?auto_154596 ) ( IN-CITY ?auto_154596 ?auto_154594 ) ( IN-CITY ?auto_154591 ?auto_154594 ) ( not ( = ?auto_154591 ?auto_154596 ) ) ( OBJ-AT ?auto_154593 ?auto_154591 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154593 ?auto_154592 ?auto_154591 )
      ( DELIVER-2PKG-VERIFY ?auto_154592 ?auto_154593 ?auto_154591 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_154776 - OBJ
      ?auto_154775 - LOCATION
    )
    :vars
    (
      ?auto_154779 - OBJ
      ?auto_154778 - TRUCK
      ?auto_154780 - LOCATION
      ?auto_154777 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_154776 ?auto_154779 ) ) ( TRUCK-AT ?auto_154778 ?auto_154780 ) ( IN-CITY ?auto_154780 ?auto_154777 ) ( IN-CITY ?auto_154775 ?auto_154777 ) ( not ( = ?auto_154775 ?auto_154780 ) ) ( OBJ-AT ?auto_154779 ?auto_154775 ) ( OBJ-AT ?auto_154776 ?auto_154780 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_154776 ?auto_154778 ?auto_154780 )
      ( DELIVER-2PKG ?auto_154779 ?auto_154776 ?auto_154775 )
      ( DELIVER-1PKG-VERIFY ?auto_154776 ?auto_154775 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_154782 - OBJ
      ?auto_154783 - OBJ
      ?auto_154781 - LOCATION
    )
    :vars
    (
      ?auto_154784 - TRUCK
      ?auto_154785 - LOCATION
      ?auto_154786 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_154783 ?auto_154782 ) ) ( TRUCK-AT ?auto_154784 ?auto_154785 ) ( IN-CITY ?auto_154785 ?auto_154786 ) ( IN-CITY ?auto_154781 ?auto_154786 ) ( not ( = ?auto_154781 ?auto_154785 ) ) ( OBJ-AT ?auto_154782 ?auto_154781 ) ( OBJ-AT ?auto_154783 ?auto_154785 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_154783 ?auto_154781 )
      ( DELIVER-2PKG-VERIFY ?auto_154782 ?auto_154783 ?auto_154781 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_154788 - OBJ
      ?auto_154789 - OBJ
      ?auto_154787 - LOCATION
    )
    :vars
    (
      ?auto_154791 - TRUCK
      ?auto_154792 - LOCATION
      ?auto_154790 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_154789 ?auto_154788 ) ) ( TRUCK-AT ?auto_154791 ?auto_154792 ) ( IN-CITY ?auto_154792 ?auto_154790 ) ( IN-CITY ?auto_154787 ?auto_154790 ) ( not ( = ?auto_154787 ?auto_154792 ) ) ( OBJ-AT ?auto_154789 ?auto_154787 ) ( OBJ-AT ?auto_154788 ?auto_154792 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154789 ?auto_154788 ?auto_154787 )
      ( DELIVER-2PKG-VERIFY ?auto_154788 ?auto_154789 ?auto_154787 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_154972 - OBJ
      ?auto_154971 - LOCATION
    )
    :vars
    (
      ?auto_154976 - OBJ
      ?auto_154975 - LOCATION
      ?auto_154973 - CITY
      ?auto_154974 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_154972 ?auto_154976 ) ) ( IN-CITY ?auto_154975 ?auto_154973 ) ( IN-CITY ?auto_154971 ?auto_154973 ) ( not ( = ?auto_154971 ?auto_154975 ) ) ( OBJ-AT ?auto_154976 ?auto_154971 ) ( OBJ-AT ?auto_154972 ?auto_154975 ) ( TRUCK-AT ?auto_154974 ?auto_154971 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_154974 ?auto_154971 ?auto_154975 ?auto_154973 )
      ( DELIVER-2PKG ?auto_154976 ?auto_154972 ?auto_154971 )
      ( DELIVER-1PKG-VERIFY ?auto_154972 ?auto_154971 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_154978 - OBJ
      ?auto_154979 - OBJ
      ?auto_154977 - LOCATION
    )
    :vars
    (
      ?auto_154981 - LOCATION
      ?auto_154982 - CITY
      ?auto_154980 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_154979 ?auto_154978 ) ) ( IN-CITY ?auto_154981 ?auto_154982 ) ( IN-CITY ?auto_154977 ?auto_154982 ) ( not ( = ?auto_154977 ?auto_154981 ) ) ( OBJ-AT ?auto_154978 ?auto_154977 ) ( OBJ-AT ?auto_154979 ?auto_154981 ) ( TRUCK-AT ?auto_154980 ?auto_154977 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_154979 ?auto_154977 )
      ( DELIVER-2PKG-VERIFY ?auto_154978 ?auto_154979 ?auto_154977 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_154984 - OBJ
      ?auto_154985 - OBJ
      ?auto_154983 - LOCATION
    )
    :vars
    (
      ?auto_154987 - LOCATION
      ?auto_154986 - CITY
      ?auto_154988 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_154985 ?auto_154984 ) ) ( IN-CITY ?auto_154987 ?auto_154986 ) ( IN-CITY ?auto_154983 ?auto_154986 ) ( not ( = ?auto_154983 ?auto_154987 ) ) ( OBJ-AT ?auto_154985 ?auto_154983 ) ( OBJ-AT ?auto_154984 ?auto_154987 ) ( TRUCK-AT ?auto_154988 ?auto_154983 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154985 ?auto_154984 ?auto_154983 )
      ( DELIVER-2PKG-VERIFY ?auto_154984 ?auto_154985 ?auto_154983 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_155168 - OBJ
      ?auto_155167 - LOCATION
    )
    :vars
    (
      ?auto_155169 - OBJ
      ?auto_155171 - LOCATION
      ?auto_155170 - CITY
      ?auto_155172 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_155168 ?auto_155169 ) ) ( IN-CITY ?auto_155171 ?auto_155170 ) ( IN-CITY ?auto_155167 ?auto_155170 ) ( not ( = ?auto_155167 ?auto_155171 ) ) ( OBJ-AT ?auto_155168 ?auto_155171 ) ( TRUCK-AT ?auto_155172 ?auto_155167 ) ( IN-TRUCK ?auto_155169 ?auto_155172 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_155169 ?auto_155167 )
      ( DELIVER-2PKG ?auto_155169 ?auto_155168 ?auto_155167 )
      ( DELIVER-1PKG-VERIFY ?auto_155168 ?auto_155167 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_155174 - OBJ
      ?auto_155175 - OBJ
      ?auto_155173 - LOCATION
    )
    :vars
    (
      ?auto_155177 - LOCATION
      ?auto_155178 - CITY
      ?auto_155176 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_155175 ?auto_155174 ) ) ( IN-CITY ?auto_155177 ?auto_155178 ) ( IN-CITY ?auto_155173 ?auto_155178 ) ( not ( = ?auto_155173 ?auto_155177 ) ) ( OBJ-AT ?auto_155175 ?auto_155177 ) ( TRUCK-AT ?auto_155176 ?auto_155173 ) ( IN-TRUCK ?auto_155174 ?auto_155176 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_155175 ?auto_155173 )
      ( DELIVER-2PKG-VERIFY ?auto_155174 ?auto_155175 ?auto_155173 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_155180 - OBJ
      ?auto_155181 - OBJ
      ?auto_155179 - LOCATION
    )
    :vars
    (
      ?auto_155183 - LOCATION
      ?auto_155182 - CITY
      ?auto_155184 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_155181 ?auto_155180 ) ) ( IN-CITY ?auto_155183 ?auto_155182 ) ( IN-CITY ?auto_155179 ?auto_155182 ) ( not ( = ?auto_155179 ?auto_155183 ) ) ( OBJ-AT ?auto_155180 ?auto_155183 ) ( TRUCK-AT ?auto_155184 ?auto_155179 ) ( IN-TRUCK ?auto_155181 ?auto_155184 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155181 ?auto_155180 ?auto_155179 )
      ( DELIVER-2PKG-VERIFY ?auto_155180 ?auto_155181 ?auto_155179 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_155364 - OBJ
      ?auto_155363 - LOCATION
    )
    :vars
    (
      ?auto_155368 - OBJ
      ?auto_155366 - LOCATION
      ?auto_155365 - CITY
      ?auto_155367 - TRUCK
      ?auto_155369 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_155364 ?auto_155368 ) ) ( IN-CITY ?auto_155366 ?auto_155365 ) ( IN-CITY ?auto_155363 ?auto_155365 ) ( not ( = ?auto_155363 ?auto_155366 ) ) ( OBJ-AT ?auto_155364 ?auto_155366 ) ( IN-TRUCK ?auto_155368 ?auto_155367 ) ( TRUCK-AT ?auto_155367 ?auto_155369 ) ( IN-CITY ?auto_155369 ?auto_155365 ) ( not ( = ?auto_155363 ?auto_155369 ) ) ( not ( = ?auto_155366 ?auto_155369 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_155367 ?auto_155369 ?auto_155363 ?auto_155365 )
      ( DELIVER-2PKG ?auto_155368 ?auto_155364 ?auto_155363 )
      ( DELIVER-1PKG-VERIFY ?auto_155364 ?auto_155363 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_155371 - OBJ
      ?auto_155372 - OBJ
      ?auto_155370 - LOCATION
    )
    :vars
    (
      ?auto_155376 - LOCATION
      ?auto_155375 - CITY
      ?auto_155373 - TRUCK
      ?auto_155374 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_155372 ?auto_155371 ) ) ( IN-CITY ?auto_155376 ?auto_155375 ) ( IN-CITY ?auto_155370 ?auto_155375 ) ( not ( = ?auto_155370 ?auto_155376 ) ) ( OBJ-AT ?auto_155372 ?auto_155376 ) ( IN-TRUCK ?auto_155371 ?auto_155373 ) ( TRUCK-AT ?auto_155373 ?auto_155374 ) ( IN-CITY ?auto_155374 ?auto_155375 ) ( not ( = ?auto_155370 ?auto_155374 ) ) ( not ( = ?auto_155376 ?auto_155374 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_155372 ?auto_155370 )
      ( DELIVER-2PKG-VERIFY ?auto_155371 ?auto_155372 ?auto_155370 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_155378 - OBJ
      ?auto_155379 - OBJ
      ?auto_155377 - LOCATION
    )
    :vars
    (
      ?auto_155381 - LOCATION
      ?auto_155382 - CITY
      ?auto_155383 - TRUCK
      ?auto_155380 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_155379 ?auto_155378 ) ) ( IN-CITY ?auto_155381 ?auto_155382 ) ( IN-CITY ?auto_155377 ?auto_155382 ) ( not ( = ?auto_155377 ?auto_155381 ) ) ( OBJ-AT ?auto_155378 ?auto_155381 ) ( IN-TRUCK ?auto_155379 ?auto_155383 ) ( TRUCK-AT ?auto_155383 ?auto_155380 ) ( IN-CITY ?auto_155380 ?auto_155382 ) ( not ( = ?auto_155377 ?auto_155380 ) ) ( not ( = ?auto_155381 ?auto_155380 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155379 ?auto_155378 ?auto_155377 )
      ( DELIVER-2PKG-VERIFY ?auto_155378 ?auto_155379 ?auto_155377 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_155586 - OBJ
      ?auto_155585 - LOCATION
    )
    :vars
    (
      ?auto_155589 - OBJ
      ?auto_155588 - LOCATION
      ?auto_155590 - CITY
      ?auto_155591 - TRUCK
      ?auto_155587 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_155586 ?auto_155589 ) ) ( IN-CITY ?auto_155588 ?auto_155590 ) ( IN-CITY ?auto_155585 ?auto_155590 ) ( not ( = ?auto_155585 ?auto_155588 ) ) ( OBJ-AT ?auto_155586 ?auto_155588 ) ( TRUCK-AT ?auto_155591 ?auto_155587 ) ( IN-CITY ?auto_155587 ?auto_155590 ) ( not ( = ?auto_155585 ?auto_155587 ) ) ( not ( = ?auto_155588 ?auto_155587 ) ) ( OBJ-AT ?auto_155589 ?auto_155587 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_155589 ?auto_155591 ?auto_155587 )
      ( DELIVER-2PKG ?auto_155589 ?auto_155586 ?auto_155585 )
      ( DELIVER-1PKG-VERIFY ?auto_155586 ?auto_155585 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_155593 - OBJ
      ?auto_155594 - OBJ
      ?auto_155592 - LOCATION
    )
    :vars
    (
      ?auto_155596 - LOCATION
      ?auto_155597 - CITY
      ?auto_155598 - TRUCK
      ?auto_155595 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_155594 ?auto_155593 ) ) ( IN-CITY ?auto_155596 ?auto_155597 ) ( IN-CITY ?auto_155592 ?auto_155597 ) ( not ( = ?auto_155592 ?auto_155596 ) ) ( OBJ-AT ?auto_155594 ?auto_155596 ) ( TRUCK-AT ?auto_155598 ?auto_155595 ) ( IN-CITY ?auto_155595 ?auto_155597 ) ( not ( = ?auto_155592 ?auto_155595 ) ) ( not ( = ?auto_155596 ?auto_155595 ) ) ( OBJ-AT ?auto_155593 ?auto_155595 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_155594 ?auto_155592 )
      ( DELIVER-2PKG-VERIFY ?auto_155593 ?auto_155594 ?auto_155592 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_155600 - OBJ
      ?auto_155601 - OBJ
      ?auto_155599 - LOCATION
    )
    :vars
    (
      ?auto_155602 - LOCATION
      ?auto_155603 - CITY
      ?auto_155604 - TRUCK
      ?auto_155605 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_155601 ?auto_155600 ) ) ( IN-CITY ?auto_155602 ?auto_155603 ) ( IN-CITY ?auto_155599 ?auto_155603 ) ( not ( = ?auto_155599 ?auto_155602 ) ) ( OBJ-AT ?auto_155600 ?auto_155602 ) ( TRUCK-AT ?auto_155604 ?auto_155605 ) ( IN-CITY ?auto_155605 ?auto_155603 ) ( not ( = ?auto_155599 ?auto_155605 ) ) ( not ( = ?auto_155602 ?auto_155605 ) ) ( OBJ-AT ?auto_155601 ?auto_155605 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155601 ?auto_155600 ?auto_155599 )
      ( DELIVER-2PKG-VERIFY ?auto_155600 ?auto_155601 ?auto_155599 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_155808 - OBJ
      ?auto_155807 - LOCATION
    )
    :vars
    (
      ?auto_155813 - OBJ
      ?auto_155809 - LOCATION
      ?auto_155810 - CITY
      ?auto_155812 - LOCATION
      ?auto_155811 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_155808 ?auto_155813 ) ) ( IN-CITY ?auto_155809 ?auto_155810 ) ( IN-CITY ?auto_155807 ?auto_155810 ) ( not ( = ?auto_155807 ?auto_155809 ) ) ( OBJ-AT ?auto_155808 ?auto_155809 ) ( IN-CITY ?auto_155812 ?auto_155810 ) ( not ( = ?auto_155807 ?auto_155812 ) ) ( not ( = ?auto_155809 ?auto_155812 ) ) ( OBJ-AT ?auto_155813 ?auto_155812 ) ( TRUCK-AT ?auto_155811 ?auto_155807 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_155811 ?auto_155807 ?auto_155812 ?auto_155810 )
      ( DELIVER-2PKG ?auto_155813 ?auto_155808 ?auto_155807 )
      ( DELIVER-1PKG-VERIFY ?auto_155808 ?auto_155807 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_155815 - OBJ
      ?auto_155816 - OBJ
      ?auto_155814 - LOCATION
    )
    :vars
    (
      ?auto_155820 - LOCATION
      ?auto_155817 - CITY
      ?auto_155819 - LOCATION
      ?auto_155818 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_155816 ?auto_155815 ) ) ( IN-CITY ?auto_155820 ?auto_155817 ) ( IN-CITY ?auto_155814 ?auto_155817 ) ( not ( = ?auto_155814 ?auto_155820 ) ) ( OBJ-AT ?auto_155816 ?auto_155820 ) ( IN-CITY ?auto_155819 ?auto_155817 ) ( not ( = ?auto_155814 ?auto_155819 ) ) ( not ( = ?auto_155820 ?auto_155819 ) ) ( OBJ-AT ?auto_155815 ?auto_155819 ) ( TRUCK-AT ?auto_155818 ?auto_155814 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_155816 ?auto_155814 )
      ( DELIVER-2PKG-VERIFY ?auto_155815 ?auto_155816 ?auto_155814 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_155822 - OBJ
      ?auto_155823 - OBJ
      ?auto_155821 - LOCATION
    )
    :vars
    (
      ?auto_155826 - LOCATION
      ?auto_155825 - CITY
      ?auto_155824 - LOCATION
      ?auto_155827 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_155823 ?auto_155822 ) ) ( IN-CITY ?auto_155826 ?auto_155825 ) ( IN-CITY ?auto_155821 ?auto_155825 ) ( not ( = ?auto_155821 ?auto_155826 ) ) ( OBJ-AT ?auto_155822 ?auto_155826 ) ( IN-CITY ?auto_155824 ?auto_155825 ) ( not ( = ?auto_155821 ?auto_155824 ) ) ( not ( = ?auto_155826 ?auto_155824 ) ) ( OBJ-AT ?auto_155823 ?auto_155824 ) ( TRUCK-AT ?auto_155827 ?auto_155821 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155823 ?auto_155822 ?auto_155821 )
      ( DELIVER-2PKG-VERIFY ?auto_155822 ?auto_155823 ?auto_155821 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_156448 - OBJ
      ?auto_156447 - LOCATION
    )
    :vars
    (
      ?auto_156449 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_156449 ?auto_156447 ) ( IN-TRUCK ?auto_156448 ?auto_156449 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_156448 ?auto_156449 ?auto_156447 )
      ( DELIVER-1PKG-VERIFY ?auto_156448 ?auto_156447 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_156451 - OBJ
      ?auto_156452 - OBJ
      ?auto_156450 - LOCATION
    )
    :vars
    (
      ?auto_156453 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_156452 ?auto_156451 ) ) ( TRUCK-AT ?auto_156453 ?auto_156450 ) ( IN-TRUCK ?auto_156452 ?auto_156453 ) ( OBJ-AT ?auto_156451 ?auto_156450 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_156452 ?auto_156450 )
      ( DELIVER-2PKG-VERIFY ?auto_156451 ?auto_156452 ?auto_156450 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_156455 - OBJ
      ?auto_156456 - OBJ
      ?auto_156454 - LOCATION
    )
    :vars
    (
      ?auto_156457 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_156456 ?auto_156455 ) ) ( TRUCK-AT ?auto_156457 ?auto_156454 ) ( IN-TRUCK ?auto_156456 ?auto_156457 ) ( OBJ-AT ?auto_156455 ?auto_156454 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_156456 ?auto_156454 )
      ( DELIVER-2PKG-VERIFY ?auto_156455 ?auto_156456 ?auto_156454 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_156459 - OBJ
      ?auto_156460 - OBJ
      ?auto_156458 - LOCATION
    )
    :vars
    (
      ?auto_156461 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_156460 ?auto_156459 ) ) ( TRUCK-AT ?auto_156461 ?auto_156458 ) ( IN-TRUCK ?auto_156459 ?auto_156461 ) ( OBJ-AT ?auto_156460 ?auto_156458 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_156459 ?auto_156458 )
      ( DELIVER-2PKG-VERIFY ?auto_156459 ?auto_156460 ?auto_156458 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_156463 - OBJ
      ?auto_156464 - OBJ
      ?auto_156462 - LOCATION
    )
    :vars
    (
      ?auto_156465 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_156464 ?auto_156463 ) ) ( TRUCK-AT ?auto_156465 ?auto_156462 ) ( IN-TRUCK ?auto_156463 ?auto_156465 ) ( OBJ-AT ?auto_156464 ?auto_156462 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_156463 ?auto_156462 )
      ( DELIVER-2PKG-VERIFY ?auto_156463 ?auto_156464 ?auto_156462 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_156476 - OBJ
      ?auto_156477 - OBJ
      ?auto_156478 - OBJ
      ?auto_156475 - LOCATION
    )
    :vars
    (
      ?auto_156479 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_156477 ?auto_156476 ) ) ( not ( = ?auto_156478 ?auto_156476 ) ) ( not ( = ?auto_156478 ?auto_156477 ) ) ( TRUCK-AT ?auto_156479 ?auto_156475 ) ( IN-TRUCK ?auto_156478 ?auto_156479 ) ( OBJ-AT ?auto_156476 ?auto_156475 ) ( OBJ-AT ?auto_156477 ?auto_156475 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_156478 ?auto_156475 )
      ( DELIVER-3PKG-VERIFY ?auto_156476 ?auto_156477 ?auto_156478 ?auto_156475 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_156486 - OBJ
      ?auto_156487 - OBJ
      ?auto_156488 - OBJ
      ?auto_156485 - LOCATION
    )
    :vars
    (
      ?auto_156489 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_156487 ?auto_156486 ) ) ( not ( = ?auto_156488 ?auto_156486 ) ) ( not ( = ?auto_156488 ?auto_156487 ) ) ( TRUCK-AT ?auto_156489 ?auto_156485 ) ( IN-TRUCK ?auto_156487 ?auto_156489 ) ( OBJ-AT ?auto_156486 ?auto_156485 ) ( OBJ-AT ?auto_156488 ?auto_156485 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_156487 ?auto_156485 )
      ( DELIVER-3PKG-VERIFY ?auto_156486 ?auto_156487 ?auto_156488 ?auto_156485 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_156496 - OBJ
      ?auto_156497 - OBJ
      ?auto_156498 - OBJ
      ?auto_156495 - LOCATION
    )
    :vars
    (
      ?auto_156499 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_156497 ?auto_156496 ) ) ( not ( = ?auto_156498 ?auto_156496 ) ) ( not ( = ?auto_156498 ?auto_156497 ) ) ( TRUCK-AT ?auto_156499 ?auto_156495 ) ( IN-TRUCK ?auto_156498 ?auto_156499 ) ( OBJ-AT ?auto_156496 ?auto_156495 ) ( OBJ-AT ?auto_156497 ?auto_156495 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_156498 ?auto_156495 )
      ( DELIVER-3PKG-VERIFY ?auto_156496 ?auto_156497 ?auto_156498 ?auto_156495 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_156506 - OBJ
      ?auto_156507 - OBJ
      ?auto_156508 - OBJ
      ?auto_156505 - LOCATION
    )
    :vars
    (
      ?auto_156509 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_156507 ?auto_156506 ) ) ( not ( = ?auto_156508 ?auto_156506 ) ) ( not ( = ?auto_156508 ?auto_156507 ) ) ( TRUCK-AT ?auto_156509 ?auto_156505 ) ( IN-TRUCK ?auto_156507 ?auto_156509 ) ( OBJ-AT ?auto_156506 ?auto_156505 ) ( OBJ-AT ?auto_156508 ?auto_156505 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_156507 ?auto_156505 )
      ( DELIVER-3PKG-VERIFY ?auto_156506 ?auto_156507 ?auto_156508 ?auto_156505 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_156526 - OBJ
      ?auto_156527 - OBJ
      ?auto_156528 - OBJ
      ?auto_156525 - LOCATION
    )
    :vars
    (
      ?auto_156529 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_156527 ?auto_156526 ) ) ( not ( = ?auto_156528 ?auto_156526 ) ) ( not ( = ?auto_156528 ?auto_156527 ) ) ( TRUCK-AT ?auto_156529 ?auto_156525 ) ( IN-TRUCK ?auto_156526 ?auto_156529 ) ( OBJ-AT ?auto_156527 ?auto_156525 ) ( OBJ-AT ?auto_156528 ?auto_156525 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_156526 ?auto_156525 )
      ( DELIVER-3PKG-VERIFY ?auto_156526 ?auto_156527 ?auto_156528 ?auto_156525 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_156536 - OBJ
      ?auto_156537 - OBJ
      ?auto_156538 - OBJ
      ?auto_156535 - LOCATION
    )
    :vars
    (
      ?auto_156539 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_156537 ?auto_156536 ) ) ( not ( = ?auto_156538 ?auto_156536 ) ) ( not ( = ?auto_156538 ?auto_156537 ) ) ( TRUCK-AT ?auto_156539 ?auto_156535 ) ( IN-TRUCK ?auto_156536 ?auto_156539 ) ( OBJ-AT ?auto_156537 ?auto_156535 ) ( OBJ-AT ?auto_156538 ?auto_156535 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_156536 ?auto_156535 )
      ( DELIVER-3PKG-VERIFY ?auto_156536 ?auto_156537 ?auto_156538 ?auto_156535 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_156956 - OBJ
      ?auto_156955 - LOCATION
    )
    :vars
    (
      ?auto_156957 - TRUCK
      ?auto_156958 - LOCATION
      ?auto_156959 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_156956 ?auto_156957 ) ( TRUCK-AT ?auto_156957 ?auto_156958 ) ( IN-CITY ?auto_156958 ?auto_156959 ) ( IN-CITY ?auto_156955 ?auto_156959 ) ( not ( = ?auto_156955 ?auto_156958 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_156957 ?auto_156958 ?auto_156955 ?auto_156959 )
      ( DELIVER-1PKG ?auto_156956 ?auto_156955 )
      ( DELIVER-1PKG-VERIFY ?auto_156956 ?auto_156955 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_156961 - OBJ
      ?auto_156962 - OBJ
      ?auto_156960 - LOCATION
    )
    :vars
    (
      ?auto_156963 - TRUCK
      ?auto_156964 - LOCATION
      ?auto_156965 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_156962 ?auto_156961 ) ) ( IN-TRUCK ?auto_156962 ?auto_156963 ) ( TRUCK-AT ?auto_156963 ?auto_156964 ) ( IN-CITY ?auto_156964 ?auto_156965 ) ( IN-CITY ?auto_156960 ?auto_156965 ) ( not ( = ?auto_156960 ?auto_156964 ) ) ( OBJ-AT ?auto_156961 ?auto_156960 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_156962 ?auto_156960 )
      ( DELIVER-2PKG-VERIFY ?auto_156961 ?auto_156962 ?auto_156960 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_156967 - OBJ
      ?auto_156968 - OBJ
      ?auto_156966 - LOCATION
    )
    :vars
    (
      ?auto_156970 - OBJ
      ?auto_156969 - TRUCK
      ?auto_156971 - LOCATION
      ?auto_156972 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_156968 ?auto_156967 ) ) ( not ( = ?auto_156968 ?auto_156970 ) ) ( IN-TRUCK ?auto_156968 ?auto_156969 ) ( TRUCK-AT ?auto_156969 ?auto_156971 ) ( IN-CITY ?auto_156971 ?auto_156972 ) ( IN-CITY ?auto_156966 ?auto_156972 ) ( not ( = ?auto_156966 ?auto_156971 ) ) ( OBJ-AT ?auto_156970 ?auto_156966 ) ( OBJ-AT ?auto_156967 ?auto_156966 ) ( not ( = ?auto_156967 ?auto_156970 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156970 ?auto_156968 ?auto_156966 )
      ( DELIVER-2PKG-VERIFY ?auto_156967 ?auto_156968 ?auto_156966 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_156974 - OBJ
      ?auto_156975 - OBJ
      ?auto_156973 - LOCATION
    )
    :vars
    (
      ?auto_156976 - TRUCK
      ?auto_156977 - LOCATION
      ?auto_156978 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_156975 ?auto_156974 ) ) ( IN-TRUCK ?auto_156974 ?auto_156976 ) ( TRUCK-AT ?auto_156976 ?auto_156977 ) ( IN-CITY ?auto_156977 ?auto_156978 ) ( IN-CITY ?auto_156973 ?auto_156978 ) ( not ( = ?auto_156973 ?auto_156977 ) ) ( OBJ-AT ?auto_156975 ?auto_156973 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156975 ?auto_156974 ?auto_156973 )
      ( DELIVER-2PKG-VERIFY ?auto_156974 ?auto_156975 ?auto_156973 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_156980 - OBJ
      ?auto_156981 - OBJ
      ?auto_156979 - LOCATION
    )
    :vars
    (
      ?auto_156983 - OBJ
      ?auto_156982 - TRUCK
      ?auto_156984 - LOCATION
      ?auto_156985 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_156981 ?auto_156980 ) ) ( not ( = ?auto_156980 ?auto_156983 ) ) ( IN-TRUCK ?auto_156980 ?auto_156982 ) ( TRUCK-AT ?auto_156982 ?auto_156984 ) ( IN-CITY ?auto_156984 ?auto_156985 ) ( IN-CITY ?auto_156979 ?auto_156985 ) ( not ( = ?auto_156979 ?auto_156984 ) ) ( OBJ-AT ?auto_156983 ?auto_156979 ) ( OBJ-AT ?auto_156981 ?auto_156979 ) ( not ( = ?auto_156981 ?auto_156983 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156983 ?auto_156980 ?auto_156979 )
      ( DELIVER-2PKG-VERIFY ?auto_156980 ?auto_156981 ?auto_156979 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_157001 - OBJ
      ?auto_157002 - OBJ
      ?auto_157003 - OBJ
      ?auto_157000 - LOCATION
    )
    :vars
    (
      ?auto_157004 - TRUCK
      ?auto_157005 - LOCATION
      ?auto_157006 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_157002 ?auto_157001 ) ) ( not ( = ?auto_157003 ?auto_157001 ) ) ( not ( = ?auto_157003 ?auto_157002 ) ) ( IN-TRUCK ?auto_157003 ?auto_157004 ) ( TRUCK-AT ?auto_157004 ?auto_157005 ) ( IN-CITY ?auto_157005 ?auto_157006 ) ( IN-CITY ?auto_157000 ?auto_157006 ) ( not ( = ?auto_157000 ?auto_157005 ) ) ( OBJ-AT ?auto_157001 ?auto_157000 ) ( OBJ-AT ?auto_157002 ?auto_157000 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_157001 ?auto_157003 ?auto_157000 )
      ( DELIVER-3PKG-VERIFY ?auto_157001 ?auto_157002 ?auto_157003 ?auto_157000 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_157015 - OBJ
      ?auto_157016 - OBJ
      ?auto_157017 - OBJ
      ?auto_157014 - LOCATION
    )
    :vars
    (
      ?auto_157018 - TRUCK
      ?auto_157019 - LOCATION
      ?auto_157020 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_157016 ?auto_157015 ) ) ( not ( = ?auto_157017 ?auto_157015 ) ) ( not ( = ?auto_157017 ?auto_157016 ) ) ( IN-TRUCK ?auto_157016 ?auto_157018 ) ( TRUCK-AT ?auto_157018 ?auto_157019 ) ( IN-CITY ?auto_157019 ?auto_157020 ) ( IN-CITY ?auto_157014 ?auto_157020 ) ( not ( = ?auto_157014 ?auto_157019 ) ) ( OBJ-AT ?auto_157015 ?auto_157014 ) ( OBJ-AT ?auto_157017 ?auto_157014 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_157015 ?auto_157016 ?auto_157014 )
      ( DELIVER-3PKG-VERIFY ?auto_157015 ?auto_157016 ?auto_157017 ?auto_157014 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_157029 - OBJ
      ?auto_157030 - OBJ
      ?auto_157031 - OBJ
      ?auto_157028 - LOCATION
    )
    :vars
    (
      ?auto_157032 - TRUCK
      ?auto_157033 - LOCATION
      ?auto_157034 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_157030 ?auto_157029 ) ) ( not ( = ?auto_157031 ?auto_157029 ) ) ( not ( = ?auto_157031 ?auto_157030 ) ) ( IN-TRUCK ?auto_157031 ?auto_157032 ) ( TRUCK-AT ?auto_157032 ?auto_157033 ) ( IN-CITY ?auto_157033 ?auto_157034 ) ( IN-CITY ?auto_157028 ?auto_157034 ) ( not ( = ?auto_157028 ?auto_157033 ) ) ( OBJ-AT ?auto_157030 ?auto_157028 ) ( OBJ-AT ?auto_157029 ?auto_157028 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_157030 ?auto_157031 ?auto_157028 )
      ( DELIVER-3PKG-VERIFY ?auto_157029 ?auto_157030 ?auto_157031 ?auto_157028 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_157044 - OBJ
      ?auto_157045 - OBJ
      ?auto_157046 - OBJ
      ?auto_157043 - LOCATION
    )
    :vars
    (
      ?auto_157047 - TRUCK
      ?auto_157048 - LOCATION
      ?auto_157049 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_157045 ?auto_157044 ) ) ( not ( = ?auto_157046 ?auto_157044 ) ) ( not ( = ?auto_157046 ?auto_157045 ) ) ( IN-TRUCK ?auto_157045 ?auto_157047 ) ( TRUCK-AT ?auto_157047 ?auto_157048 ) ( IN-CITY ?auto_157048 ?auto_157049 ) ( IN-CITY ?auto_157043 ?auto_157049 ) ( not ( = ?auto_157043 ?auto_157048 ) ) ( OBJ-AT ?auto_157046 ?auto_157043 ) ( OBJ-AT ?auto_157044 ?auto_157043 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_157046 ?auto_157045 ?auto_157043 )
      ( DELIVER-3PKG-VERIFY ?auto_157044 ?auto_157045 ?auto_157046 ?auto_157043 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_157074 - OBJ
      ?auto_157075 - OBJ
      ?auto_157076 - OBJ
      ?auto_157073 - LOCATION
    )
    :vars
    (
      ?auto_157077 - TRUCK
      ?auto_157078 - LOCATION
      ?auto_157079 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_157075 ?auto_157074 ) ) ( not ( = ?auto_157076 ?auto_157074 ) ) ( not ( = ?auto_157076 ?auto_157075 ) ) ( IN-TRUCK ?auto_157074 ?auto_157077 ) ( TRUCK-AT ?auto_157077 ?auto_157078 ) ( IN-CITY ?auto_157078 ?auto_157079 ) ( IN-CITY ?auto_157073 ?auto_157079 ) ( not ( = ?auto_157073 ?auto_157078 ) ) ( OBJ-AT ?auto_157075 ?auto_157073 ) ( OBJ-AT ?auto_157076 ?auto_157073 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_157075 ?auto_157074 ?auto_157073 )
      ( DELIVER-3PKG-VERIFY ?auto_157074 ?auto_157075 ?auto_157076 ?auto_157073 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_157088 - OBJ
      ?auto_157089 - OBJ
      ?auto_157090 - OBJ
      ?auto_157087 - LOCATION
    )
    :vars
    (
      ?auto_157091 - TRUCK
      ?auto_157092 - LOCATION
      ?auto_157093 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_157089 ?auto_157088 ) ) ( not ( = ?auto_157090 ?auto_157088 ) ) ( not ( = ?auto_157090 ?auto_157089 ) ) ( IN-TRUCK ?auto_157088 ?auto_157091 ) ( TRUCK-AT ?auto_157091 ?auto_157092 ) ( IN-CITY ?auto_157092 ?auto_157093 ) ( IN-CITY ?auto_157087 ?auto_157093 ) ( not ( = ?auto_157087 ?auto_157092 ) ) ( OBJ-AT ?auto_157090 ?auto_157087 ) ( OBJ-AT ?auto_157089 ?auto_157087 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_157090 ?auto_157088 ?auto_157087 )
      ( DELIVER-3PKG-VERIFY ?auto_157088 ?auto_157089 ?auto_157090 ?auto_157087 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_157669 - OBJ
      ?auto_157668 - LOCATION
    )
    :vars
    (
      ?auto_157671 - OBJ
      ?auto_157670 - TRUCK
      ?auto_157672 - LOCATION
      ?auto_157673 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_157669 ?auto_157671 ) ) ( TRUCK-AT ?auto_157670 ?auto_157672 ) ( IN-CITY ?auto_157672 ?auto_157673 ) ( IN-CITY ?auto_157668 ?auto_157673 ) ( not ( = ?auto_157668 ?auto_157672 ) ) ( OBJ-AT ?auto_157671 ?auto_157668 ) ( OBJ-AT ?auto_157669 ?auto_157672 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_157669 ?auto_157670 ?auto_157672 )
      ( DELIVER-2PKG ?auto_157671 ?auto_157669 ?auto_157668 )
      ( DELIVER-1PKG-VERIFY ?auto_157669 ?auto_157668 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_157675 - OBJ
      ?auto_157676 - OBJ
      ?auto_157674 - LOCATION
    )
    :vars
    (
      ?auto_157679 - TRUCK
      ?auto_157678 - LOCATION
      ?auto_157677 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_157676 ?auto_157675 ) ) ( TRUCK-AT ?auto_157679 ?auto_157678 ) ( IN-CITY ?auto_157678 ?auto_157677 ) ( IN-CITY ?auto_157674 ?auto_157677 ) ( not ( = ?auto_157674 ?auto_157678 ) ) ( OBJ-AT ?auto_157675 ?auto_157674 ) ( OBJ-AT ?auto_157676 ?auto_157678 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_157676 ?auto_157674 )
      ( DELIVER-2PKG-VERIFY ?auto_157675 ?auto_157676 ?auto_157674 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_157681 - OBJ
      ?auto_157682 - OBJ
      ?auto_157680 - LOCATION
    )
    :vars
    (
      ?auto_157686 - OBJ
      ?auto_157684 - TRUCK
      ?auto_157685 - LOCATION
      ?auto_157683 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_157682 ?auto_157681 ) ) ( not ( = ?auto_157682 ?auto_157686 ) ) ( TRUCK-AT ?auto_157684 ?auto_157685 ) ( IN-CITY ?auto_157685 ?auto_157683 ) ( IN-CITY ?auto_157680 ?auto_157683 ) ( not ( = ?auto_157680 ?auto_157685 ) ) ( OBJ-AT ?auto_157686 ?auto_157680 ) ( OBJ-AT ?auto_157682 ?auto_157685 ) ( OBJ-AT ?auto_157681 ?auto_157680 ) ( not ( = ?auto_157681 ?auto_157686 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_157686 ?auto_157682 ?auto_157680 )
      ( DELIVER-2PKG-VERIFY ?auto_157681 ?auto_157682 ?auto_157680 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_157688 - OBJ
      ?auto_157689 - OBJ
      ?auto_157687 - LOCATION
    )
    :vars
    (
      ?auto_157691 - TRUCK
      ?auto_157692 - LOCATION
      ?auto_157690 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_157689 ?auto_157688 ) ) ( TRUCK-AT ?auto_157691 ?auto_157692 ) ( IN-CITY ?auto_157692 ?auto_157690 ) ( IN-CITY ?auto_157687 ?auto_157690 ) ( not ( = ?auto_157687 ?auto_157692 ) ) ( OBJ-AT ?auto_157689 ?auto_157687 ) ( OBJ-AT ?auto_157688 ?auto_157692 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_157689 ?auto_157688 ?auto_157687 )
      ( DELIVER-2PKG-VERIFY ?auto_157688 ?auto_157689 ?auto_157687 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_157694 - OBJ
      ?auto_157695 - OBJ
      ?auto_157693 - LOCATION
    )
    :vars
    (
      ?auto_157699 - OBJ
      ?auto_157697 - TRUCK
      ?auto_157698 - LOCATION
      ?auto_157696 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_157695 ?auto_157694 ) ) ( not ( = ?auto_157694 ?auto_157699 ) ) ( TRUCK-AT ?auto_157697 ?auto_157698 ) ( IN-CITY ?auto_157698 ?auto_157696 ) ( IN-CITY ?auto_157693 ?auto_157696 ) ( not ( = ?auto_157693 ?auto_157698 ) ) ( OBJ-AT ?auto_157699 ?auto_157693 ) ( OBJ-AT ?auto_157694 ?auto_157698 ) ( OBJ-AT ?auto_157695 ?auto_157693 ) ( not ( = ?auto_157695 ?auto_157699 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_157699 ?auto_157694 ?auto_157693 )
      ( DELIVER-2PKG-VERIFY ?auto_157694 ?auto_157695 ?auto_157693 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_157715 - OBJ
      ?auto_157716 - OBJ
      ?auto_157717 - OBJ
      ?auto_157714 - LOCATION
    )
    :vars
    (
      ?auto_157719 - TRUCK
      ?auto_157720 - LOCATION
      ?auto_157718 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_157716 ?auto_157715 ) ) ( not ( = ?auto_157717 ?auto_157715 ) ) ( not ( = ?auto_157717 ?auto_157716 ) ) ( TRUCK-AT ?auto_157719 ?auto_157720 ) ( IN-CITY ?auto_157720 ?auto_157718 ) ( IN-CITY ?auto_157714 ?auto_157718 ) ( not ( = ?auto_157714 ?auto_157720 ) ) ( OBJ-AT ?auto_157715 ?auto_157714 ) ( OBJ-AT ?auto_157717 ?auto_157720 ) ( OBJ-AT ?auto_157716 ?auto_157714 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_157715 ?auto_157717 ?auto_157714 )
      ( DELIVER-3PKG-VERIFY ?auto_157715 ?auto_157716 ?auto_157717 ?auto_157714 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_157729 - OBJ
      ?auto_157730 - OBJ
      ?auto_157731 - OBJ
      ?auto_157728 - LOCATION
    )
    :vars
    (
      ?auto_157733 - TRUCK
      ?auto_157734 - LOCATION
      ?auto_157732 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_157730 ?auto_157729 ) ) ( not ( = ?auto_157731 ?auto_157729 ) ) ( not ( = ?auto_157731 ?auto_157730 ) ) ( TRUCK-AT ?auto_157733 ?auto_157734 ) ( IN-CITY ?auto_157734 ?auto_157732 ) ( IN-CITY ?auto_157728 ?auto_157732 ) ( not ( = ?auto_157728 ?auto_157734 ) ) ( OBJ-AT ?auto_157729 ?auto_157728 ) ( OBJ-AT ?auto_157730 ?auto_157734 ) ( OBJ-AT ?auto_157731 ?auto_157728 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_157729 ?auto_157730 ?auto_157728 )
      ( DELIVER-3PKG-VERIFY ?auto_157729 ?auto_157730 ?auto_157731 ?auto_157728 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_157743 - OBJ
      ?auto_157744 - OBJ
      ?auto_157745 - OBJ
      ?auto_157742 - LOCATION
    )
    :vars
    (
      ?auto_157747 - TRUCK
      ?auto_157748 - LOCATION
      ?auto_157746 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_157744 ?auto_157743 ) ) ( not ( = ?auto_157745 ?auto_157743 ) ) ( not ( = ?auto_157745 ?auto_157744 ) ) ( TRUCK-AT ?auto_157747 ?auto_157748 ) ( IN-CITY ?auto_157748 ?auto_157746 ) ( IN-CITY ?auto_157742 ?auto_157746 ) ( not ( = ?auto_157742 ?auto_157748 ) ) ( OBJ-AT ?auto_157744 ?auto_157742 ) ( OBJ-AT ?auto_157745 ?auto_157748 ) ( OBJ-AT ?auto_157743 ?auto_157742 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_157744 ?auto_157745 ?auto_157742 )
      ( DELIVER-3PKG-VERIFY ?auto_157743 ?auto_157744 ?auto_157745 ?auto_157742 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_157758 - OBJ
      ?auto_157759 - OBJ
      ?auto_157760 - OBJ
      ?auto_157757 - LOCATION
    )
    :vars
    (
      ?auto_157762 - TRUCK
      ?auto_157763 - LOCATION
      ?auto_157761 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_157759 ?auto_157758 ) ) ( not ( = ?auto_157760 ?auto_157758 ) ) ( not ( = ?auto_157760 ?auto_157759 ) ) ( TRUCK-AT ?auto_157762 ?auto_157763 ) ( IN-CITY ?auto_157763 ?auto_157761 ) ( IN-CITY ?auto_157757 ?auto_157761 ) ( not ( = ?auto_157757 ?auto_157763 ) ) ( OBJ-AT ?auto_157760 ?auto_157757 ) ( OBJ-AT ?auto_157759 ?auto_157763 ) ( OBJ-AT ?auto_157758 ?auto_157757 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_157760 ?auto_157759 ?auto_157757 )
      ( DELIVER-3PKG-VERIFY ?auto_157758 ?auto_157759 ?auto_157760 ?auto_157757 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_157788 - OBJ
      ?auto_157789 - OBJ
      ?auto_157790 - OBJ
      ?auto_157787 - LOCATION
    )
    :vars
    (
      ?auto_157792 - TRUCK
      ?auto_157793 - LOCATION
      ?auto_157791 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_157789 ?auto_157788 ) ) ( not ( = ?auto_157790 ?auto_157788 ) ) ( not ( = ?auto_157790 ?auto_157789 ) ) ( TRUCK-AT ?auto_157792 ?auto_157793 ) ( IN-CITY ?auto_157793 ?auto_157791 ) ( IN-CITY ?auto_157787 ?auto_157791 ) ( not ( = ?auto_157787 ?auto_157793 ) ) ( OBJ-AT ?auto_157789 ?auto_157787 ) ( OBJ-AT ?auto_157788 ?auto_157793 ) ( OBJ-AT ?auto_157790 ?auto_157787 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_157789 ?auto_157788 ?auto_157787 )
      ( DELIVER-3PKG-VERIFY ?auto_157788 ?auto_157789 ?auto_157790 ?auto_157787 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_157802 - OBJ
      ?auto_157803 - OBJ
      ?auto_157804 - OBJ
      ?auto_157801 - LOCATION
    )
    :vars
    (
      ?auto_157806 - TRUCK
      ?auto_157807 - LOCATION
      ?auto_157805 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_157803 ?auto_157802 ) ) ( not ( = ?auto_157804 ?auto_157802 ) ) ( not ( = ?auto_157804 ?auto_157803 ) ) ( TRUCK-AT ?auto_157806 ?auto_157807 ) ( IN-CITY ?auto_157807 ?auto_157805 ) ( IN-CITY ?auto_157801 ?auto_157805 ) ( not ( = ?auto_157801 ?auto_157807 ) ) ( OBJ-AT ?auto_157804 ?auto_157801 ) ( OBJ-AT ?auto_157802 ?auto_157807 ) ( OBJ-AT ?auto_157803 ?auto_157801 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_157804 ?auto_157802 ?auto_157801 )
      ( DELIVER-3PKG-VERIFY ?auto_157802 ?auto_157803 ?auto_157804 ?auto_157801 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_158383 - OBJ
      ?auto_158382 - LOCATION
    )
    :vars
    (
      ?auto_158387 - OBJ
      ?auto_158386 - LOCATION
      ?auto_158384 - CITY
      ?auto_158385 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_158383 ?auto_158387 ) ) ( IN-CITY ?auto_158386 ?auto_158384 ) ( IN-CITY ?auto_158382 ?auto_158384 ) ( not ( = ?auto_158382 ?auto_158386 ) ) ( OBJ-AT ?auto_158387 ?auto_158382 ) ( OBJ-AT ?auto_158383 ?auto_158386 ) ( TRUCK-AT ?auto_158385 ?auto_158382 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_158385 ?auto_158382 ?auto_158386 ?auto_158384 )
      ( DELIVER-2PKG ?auto_158387 ?auto_158383 ?auto_158382 )
      ( DELIVER-1PKG-VERIFY ?auto_158383 ?auto_158382 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_158389 - OBJ
      ?auto_158390 - OBJ
      ?auto_158388 - LOCATION
    )
    :vars
    (
      ?auto_158393 - LOCATION
      ?auto_158391 - CITY
      ?auto_158392 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_158390 ?auto_158389 ) ) ( IN-CITY ?auto_158393 ?auto_158391 ) ( IN-CITY ?auto_158388 ?auto_158391 ) ( not ( = ?auto_158388 ?auto_158393 ) ) ( OBJ-AT ?auto_158389 ?auto_158388 ) ( OBJ-AT ?auto_158390 ?auto_158393 ) ( TRUCK-AT ?auto_158392 ?auto_158388 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_158390 ?auto_158388 )
      ( DELIVER-2PKG-VERIFY ?auto_158389 ?auto_158390 ?auto_158388 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_158395 - OBJ
      ?auto_158396 - OBJ
      ?auto_158394 - LOCATION
    )
    :vars
    (
      ?auto_158398 - OBJ
      ?auto_158399 - LOCATION
      ?auto_158400 - CITY
      ?auto_158397 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_158396 ?auto_158395 ) ) ( not ( = ?auto_158396 ?auto_158398 ) ) ( IN-CITY ?auto_158399 ?auto_158400 ) ( IN-CITY ?auto_158394 ?auto_158400 ) ( not ( = ?auto_158394 ?auto_158399 ) ) ( OBJ-AT ?auto_158398 ?auto_158394 ) ( OBJ-AT ?auto_158396 ?auto_158399 ) ( TRUCK-AT ?auto_158397 ?auto_158394 ) ( OBJ-AT ?auto_158395 ?auto_158394 ) ( not ( = ?auto_158395 ?auto_158398 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_158398 ?auto_158396 ?auto_158394 )
      ( DELIVER-2PKG-VERIFY ?auto_158395 ?auto_158396 ?auto_158394 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_158402 - OBJ
      ?auto_158403 - OBJ
      ?auto_158401 - LOCATION
    )
    :vars
    (
      ?auto_158405 - LOCATION
      ?auto_158406 - CITY
      ?auto_158404 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_158403 ?auto_158402 ) ) ( IN-CITY ?auto_158405 ?auto_158406 ) ( IN-CITY ?auto_158401 ?auto_158406 ) ( not ( = ?auto_158401 ?auto_158405 ) ) ( OBJ-AT ?auto_158403 ?auto_158401 ) ( OBJ-AT ?auto_158402 ?auto_158405 ) ( TRUCK-AT ?auto_158404 ?auto_158401 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_158403 ?auto_158402 ?auto_158401 )
      ( DELIVER-2PKG-VERIFY ?auto_158402 ?auto_158403 ?auto_158401 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_158408 - OBJ
      ?auto_158409 - OBJ
      ?auto_158407 - LOCATION
    )
    :vars
    (
      ?auto_158411 - OBJ
      ?auto_158412 - LOCATION
      ?auto_158413 - CITY
      ?auto_158410 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_158409 ?auto_158408 ) ) ( not ( = ?auto_158408 ?auto_158411 ) ) ( IN-CITY ?auto_158412 ?auto_158413 ) ( IN-CITY ?auto_158407 ?auto_158413 ) ( not ( = ?auto_158407 ?auto_158412 ) ) ( OBJ-AT ?auto_158411 ?auto_158407 ) ( OBJ-AT ?auto_158408 ?auto_158412 ) ( TRUCK-AT ?auto_158410 ?auto_158407 ) ( OBJ-AT ?auto_158409 ?auto_158407 ) ( not ( = ?auto_158409 ?auto_158411 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_158411 ?auto_158408 ?auto_158407 )
      ( DELIVER-2PKG-VERIFY ?auto_158408 ?auto_158409 ?auto_158407 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_158429 - OBJ
      ?auto_158430 - OBJ
      ?auto_158431 - OBJ
      ?auto_158428 - LOCATION
    )
    :vars
    (
      ?auto_158433 - LOCATION
      ?auto_158434 - CITY
      ?auto_158432 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_158430 ?auto_158429 ) ) ( not ( = ?auto_158431 ?auto_158429 ) ) ( not ( = ?auto_158431 ?auto_158430 ) ) ( IN-CITY ?auto_158433 ?auto_158434 ) ( IN-CITY ?auto_158428 ?auto_158434 ) ( not ( = ?auto_158428 ?auto_158433 ) ) ( OBJ-AT ?auto_158429 ?auto_158428 ) ( OBJ-AT ?auto_158431 ?auto_158433 ) ( TRUCK-AT ?auto_158432 ?auto_158428 ) ( OBJ-AT ?auto_158430 ?auto_158428 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_158429 ?auto_158431 ?auto_158428 )
      ( DELIVER-3PKG-VERIFY ?auto_158429 ?auto_158430 ?auto_158431 ?auto_158428 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_158443 - OBJ
      ?auto_158444 - OBJ
      ?auto_158445 - OBJ
      ?auto_158442 - LOCATION
    )
    :vars
    (
      ?auto_158447 - LOCATION
      ?auto_158448 - CITY
      ?auto_158446 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_158444 ?auto_158443 ) ) ( not ( = ?auto_158445 ?auto_158443 ) ) ( not ( = ?auto_158445 ?auto_158444 ) ) ( IN-CITY ?auto_158447 ?auto_158448 ) ( IN-CITY ?auto_158442 ?auto_158448 ) ( not ( = ?auto_158442 ?auto_158447 ) ) ( OBJ-AT ?auto_158443 ?auto_158442 ) ( OBJ-AT ?auto_158444 ?auto_158447 ) ( TRUCK-AT ?auto_158446 ?auto_158442 ) ( OBJ-AT ?auto_158445 ?auto_158442 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_158443 ?auto_158444 ?auto_158442 )
      ( DELIVER-3PKG-VERIFY ?auto_158443 ?auto_158444 ?auto_158445 ?auto_158442 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_158457 - OBJ
      ?auto_158458 - OBJ
      ?auto_158459 - OBJ
      ?auto_158456 - LOCATION
    )
    :vars
    (
      ?auto_158461 - LOCATION
      ?auto_158462 - CITY
      ?auto_158460 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_158458 ?auto_158457 ) ) ( not ( = ?auto_158459 ?auto_158457 ) ) ( not ( = ?auto_158459 ?auto_158458 ) ) ( IN-CITY ?auto_158461 ?auto_158462 ) ( IN-CITY ?auto_158456 ?auto_158462 ) ( not ( = ?auto_158456 ?auto_158461 ) ) ( OBJ-AT ?auto_158458 ?auto_158456 ) ( OBJ-AT ?auto_158459 ?auto_158461 ) ( TRUCK-AT ?auto_158460 ?auto_158456 ) ( OBJ-AT ?auto_158457 ?auto_158456 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_158458 ?auto_158459 ?auto_158456 )
      ( DELIVER-3PKG-VERIFY ?auto_158457 ?auto_158458 ?auto_158459 ?auto_158456 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_158472 - OBJ
      ?auto_158473 - OBJ
      ?auto_158474 - OBJ
      ?auto_158471 - LOCATION
    )
    :vars
    (
      ?auto_158476 - LOCATION
      ?auto_158477 - CITY
      ?auto_158475 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_158473 ?auto_158472 ) ) ( not ( = ?auto_158474 ?auto_158472 ) ) ( not ( = ?auto_158474 ?auto_158473 ) ) ( IN-CITY ?auto_158476 ?auto_158477 ) ( IN-CITY ?auto_158471 ?auto_158477 ) ( not ( = ?auto_158471 ?auto_158476 ) ) ( OBJ-AT ?auto_158474 ?auto_158471 ) ( OBJ-AT ?auto_158473 ?auto_158476 ) ( TRUCK-AT ?auto_158475 ?auto_158471 ) ( OBJ-AT ?auto_158472 ?auto_158471 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_158474 ?auto_158473 ?auto_158471 )
      ( DELIVER-3PKG-VERIFY ?auto_158472 ?auto_158473 ?auto_158474 ?auto_158471 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_158502 - OBJ
      ?auto_158503 - OBJ
      ?auto_158504 - OBJ
      ?auto_158501 - LOCATION
    )
    :vars
    (
      ?auto_158506 - LOCATION
      ?auto_158507 - CITY
      ?auto_158505 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_158503 ?auto_158502 ) ) ( not ( = ?auto_158504 ?auto_158502 ) ) ( not ( = ?auto_158504 ?auto_158503 ) ) ( IN-CITY ?auto_158506 ?auto_158507 ) ( IN-CITY ?auto_158501 ?auto_158507 ) ( not ( = ?auto_158501 ?auto_158506 ) ) ( OBJ-AT ?auto_158503 ?auto_158501 ) ( OBJ-AT ?auto_158502 ?auto_158506 ) ( TRUCK-AT ?auto_158505 ?auto_158501 ) ( OBJ-AT ?auto_158504 ?auto_158501 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_158503 ?auto_158502 ?auto_158501 )
      ( DELIVER-3PKG-VERIFY ?auto_158502 ?auto_158503 ?auto_158504 ?auto_158501 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_158516 - OBJ
      ?auto_158517 - OBJ
      ?auto_158518 - OBJ
      ?auto_158515 - LOCATION
    )
    :vars
    (
      ?auto_158520 - LOCATION
      ?auto_158521 - CITY
      ?auto_158519 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_158517 ?auto_158516 ) ) ( not ( = ?auto_158518 ?auto_158516 ) ) ( not ( = ?auto_158518 ?auto_158517 ) ) ( IN-CITY ?auto_158520 ?auto_158521 ) ( IN-CITY ?auto_158515 ?auto_158521 ) ( not ( = ?auto_158515 ?auto_158520 ) ) ( OBJ-AT ?auto_158518 ?auto_158515 ) ( OBJ-AT ?auto_158516 ?auto_158520 ) ( TRUCK-AT ?auto_158519 ?auto_158515 ) ( OBJ-AT ?auto_158517 ?auto_158515 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_158518 ?auto_158516 ?auto_158515 )
      ( DELIVER-3PKG-VERIFY ?auto_158516 ?auto_158517 ?auto_158518 ?auto_158515 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_159097 - OBJ
      ?auto_159096 - LOCATION
    )
    :vars
    (
      ?auto_159099 - OBJ
      ?auto_159100 - LOCATION
      ?auto_159101 - CITY
      ?auto_159098 - TRUCK
      ?auto_159102 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_159097 ?auto_159099 ) ) ( IN-CITY ?auto_159100 ?auto_159101 ) ( IN-CITY ?auto_159096 ?auto_159101 ) ( not ( = ?auto_159096 ?auto_159100 ) ) ( OBJ-AT ?auto_159099 ?auto_159096 ) ( OBJ-AT ?auto_159097 ?auto_159100 ) ( TRUCK-AT ?auto_159098 ?auto_159096 ) ( not ( = ?auto_159102 ?auto_159099 ) ) ( IN-TRUCK ?auto_159102 ?auto_159098 ) ( not ( = ?auto_159097 ?auto_159102 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_159099 ?auto_159102 ?auto_159096 )
      ( DELIVER-2PKG ?auto_159099 ?auto_159097 ?auto_159096 )
      ( DELIVER-1PKG-VERIFY ?auto_159097 ?auto_159096 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_159104 - OBJ
      ?auto_159105 - OBJ
      ?auto_159103 - LOCATION
    )
    :vars
    (
      ?auto_159109 - LOCATION
      ?auto_159107 - CITY
      ?auto_159108 - TRUCK
      ?auto_159106 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_159105 ?auto_159104 ) ) ( IN-CITY ?auto_159109 ?auto_159107 ) ( IN-CITY ?auto_159103 ?auto_159107 ) ( not ( = ?auto_159103 ?auto_159109 ) ) ( OBJ-AT ?auto_159104 ?auto_159103 ) ( OBJ-AT ?auto_159105 ?auto_159109 ) ( TRUCK-AT ?auto_159108 ?auto_159103 ) ( not ( = ?auto_159106 ?auto_159104 ) ) ( IN-TRUCK ?auto_159106 ?auto_159108 ) ( not ( = ?auto_159105 ?auto_159106 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_159105 ?auto_159103 )
      ( DELIVER-2PKG-VERIFY ?auto_159104 ?auto_159105 ?auto_159103 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_159111 - OBJ
      ?auto_159112 - OBJ
      ?auto_159110 - LOCATION
    )
    :vars
    (
      ?auto_159115 - OBJ
      ?auto_159113 - LOCATION
      ?auto_159114 - CITY
      ?auto_159116 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_159112 ?auto_159111 ) ) ( not ( = ?auto_159112 ?auto_159115 ) ) ( IN-CITY ?auto_159113 ?auto_159114 ) ( IN-CITY ?auto_159110 ?auto_159114 ) ( not ( = ?auto_159110 ?auto_159113 ) ) ( OBJ-AT ?auto_159115 ?auto_159110 ) ( OBJ-AT ?auto_159112 ?auto_159113 ) ( TRUCK-AT ?auto_159116 ?auto_159110 ) ( not ( = ?auto_159111 ?auto_159115 ) ) ( IN-TRUCK ?auto_159111 ?auto_159116 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_159115 ?auto_159112 ?auto_159110 )
      ( DELIVER-2PKG-VERIFY ?auto_159111 ?auto_159112 ?auto_159110 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_159118 - OBJ
      ?auto_159119 - OBJ
      ?auto_159117 - LOCATION
    )
    :vars
    (
      ?auto_159120 - LOCATION
      ?auto_159121 - CITY
      ?auto_159122 - TRUCK
      ?auto_159123 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_159119 ?auto_159118 ) ) ( IN-CITY ?auto_159120 ?auto_159121 ) ( IN-CITY ?auto_159117 ?auto_159121 ) ( not ( = ?auto_159117 ?auto_159120 ) ) ( OBJ-AT ?auto_159119 ?auto_159117 ) ( OBJ-AT ?auto_159118 ?auto_159120 ) ( TRUCK-AT ?auto_159122 ?auto_159117 ) ( not ( = ?auto_159123 ?auto_159119 ) ) ( IN-TRUCK ?auto_159123 ?auto_159122 ) ( not ( = ?auto_159118 ?auto_159123 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_159119 ?auto_159118 ?auto_159117 )
      ( DELIVER-2PKG-VERIFY ?auto_159118 ?auto_159119 ?auto_159117 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_159125 - OBJ
      ?auto_159126 - OBJ
      ?auto_159124 - LOCATION
    )
    :vars
    (
      ?auto_159129 - OBJ
      ?auto_159127 - LOCATION
      ?auto_159128 - CITY
      ?auto_159130 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_159126 ?auto_159125 ) ) ( not ( = ?auto_159125 ?auto_159129 ) ) ( IN-CITY ?auto_159127 ?auto_159128 ) ( IN-CITY ?auto_159124 ?auto_159128 ) ( not ( = ?auto_159124 ?auto_159127 ) ) ( OBJ-AT ?auto_159129 ?auto_159124 ) ( OBJ-AT ?auto_159125 ?auto_159127 ) ( TRUCK-AT ?auto_159130 ?auto_159124 ) ( not ( = ?auto_159126 ?auto_159129 ) ) ( IN-TRUCK ?auto_159126 ?auto_159130 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_159129 ?auto_159125 ?auto_159124 )
      ( DELIVER-2PKG-VERIFY ?auto_159125 ?auto_159126 ?auto_159124 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_159148 - OBJ
      ?auto_159149 - OBJ
      ?auto_159150 - OBJ
      ?auto_159147 - LOCATION
    )
    :vars
    (
      ?auto_159151 - LOCATION
      ?auto_159152 - CITY
      ?auto_159153 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_159149 ?auto_159148 ) ) ( not ( = ?auto_159150 ?auto_159148 ) ) ( not ( = ?auto_159150 ?auto_159149 ) ) ( IN-CITY ?auto_159151 ?auto_159152 ) ( IN-CITY ?auto_159147 ?auto_159152 ) ( not ( = ?auto_159147 ?auto_159151 ) ) ( OBJ-AT ?auto_159148 ?auto_159147 ) ( OBJ-AT ?auto_159150 ?auto_159151 ) ( TRUCK-AT ?auto_159153 ?auto_159147 ) ( IN-TRUCK ?auto_159149 ?auto_159153 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_159148 ?auto_159150 ?auto_159147 )
      ( DELIVER-3PKG-VERIFY ?auto_159148 ?auto_159149 ?auto_159150 ?auto_159147 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_159163 - OBJ
      ?auto_159164 - OBJ
      ?auto_159165 - OBJ
      ?auto_159162 - LOCATION
    )
    :vars
    (
      ?auto_159166 - LOCATION
      ?auto_159167 - CITY
      ?auto_159168 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_159164 ?auto_159163 ) ) ( not ( = ?auto_159165 ?auto_159163 ) ) ( not ( = ?auto_159165 ?auto_159164 ) ) ( IN-CITY ?auto_159166 ?auto_159167 ) ( IN-CITY ?auto_159162 ?auto_159167 ) ( not ( = ?auto_159162 ?auto_159166 ) ) ( OBJ-AT ?auto_159163 ?auto_159162 ) ( OBJ-AT ?auto_159164 ?auto_159166 ) ( TRUCK-AT ?auto_159168 ?auto_159162 ) ( IN-TRUCK ?auto_159165 ?auto_159168 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_159163 ?auto_159164 ?auto_159162 )
      ( DELIVER-3PKG-VERIFY ?auto_159163 ?auto_159164 ?auto_159165 ?auto_159162 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_159178 - OBJ
      ?auto_159179 - OBJ
      ?auto_159180 - OBJ
      ?auto_159177 - LOCATION
    )
    :vars
    (
      ?auto_159181 - LOCATION
      ?auto_159182 - CITY
      ?auto_159183 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_159179 ?auto_159178 ) ) ( not ( = ?auto_159180 ?auto_159178 ) ) ( not ( = ?auto_159180 ?auto_159179 ) ) ( IN-CITY ?auto_159181 ?auto_159182 ) ( IN-CITY ?auto_159177 ?auto_159182 ) ( not ( = ?auto_159177 ?auto_159181 ) ) ( OBJ-AT ?auto_159179 ?auto_159177 ) ( OBJ-AT ?auto_159180 ?auto_159181 ) ( TRUCK-AT ?auto_159183 ?auto_159177 ) ( IN-TRUCK ?auto_159178 ?auto_159183 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_159179 ?auto_159180 ?auto_159177 )
      ( DELIVER-3PKG-VERIFY ?auto_159178 ?auto_159179 ?auto_159180 ?auto_159177 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_159193 - OBJ
      ?auto_159194 - OBJ
      ?auto_159195 - OBJ
      ?auto_159192 - LOCATION
    )
    :vars
    (
      ?auto_159196 - LOCATION
      ?auto_159197 - CITY
      ?auto_159198 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_159194 ?auto_159193 ) ) ( not ( = ?auto_159195 ?auto_159193 ) ) ( not ( = ?auto_159195 ?auto_159194 ) ) ( IN-CITY ?auto_159196 ?auto_159197 ) ( IN-CITY ?auto_159192 ?auto_159197 ) ( not ( = ?auto_159192 ?auto_159196 ) ) ( OBJ-AT ?auto_159195 ?auto_159192 ) ( OBJ-AT ?auto_159194 ?auto_159196 ) ( TRUCK-AT ?auto_159198 ?auto_159192 ) ( IN-TRUCK ?auto_159193 ?auto_159198 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_159195 ?auto_159194 ?auto_159192 )
      ( DELIVER-3PKG-VERIFY ?auto_159193 ?auto_159194 ?auto_159195 ?auto_159192 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_159224 - OBJ
      ?auto_159225 - OBJ
      ?auto_159226 - OBJ
      ?auto_159223 - LOCATION
    )
    :vars
    (
      ?auto_159227 - LOCATION
      ?auto_159228 - CITY
      ?auto_159229 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_159225 ?auto_159224 ) ) ( not ( = ?auto_159226 ?auto_159224 ) ) ( not ( = ?auto_159226 ?auto_159225 ) ) ( IN-CITY ?auto_159227 ?auto_159228 ) ( IN-CITY ?auto_159223 ?auto_159228 ) ( not ( = ?auto_159223 ?auto_159227 ) ) ( OBJ-AT ?auto_159225 ?auto_159223 ) ( OBJ-AT ?auto_159224 ?auto_159227 ) ( TRUCK-AT ?auto_159229 ?auto_159223 ) ( IN-TRUCK ?auto_159226 ?auto_159229 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_159225 ?auto_159224 ?auto_159223 )
      ( DELIVER-3PKG-VERIFY ?auto_159224 ?auto_159225 ?auto_159226 ?auto_159223 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_159239 - OBJ
      ?auto_159240 - OBJ
      ?auto_159241 - OBJ
      ?auto_159238 - LOCATION
    )
    :vars
    (
      ?auto_159242 - LOCATION
      ?auto_159243 - CITY
      ?auto_159244 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_159240 ?auto_159239 ) ) ( not ( = ?auto_159241 ?auto_159239 ) ) ( not ( = ?auto_159241 ?auto_159240 ) ) ( IN-CITY ?auto_159242 ?auto_159243 ) ( IN-CITY ?auto_159238 ?auto_159243 ) ( not ( = ?auto_159238 ?auto_159242 ) ) ( OBJ-AT ?auto_159241 ?auto_159238 ) ( OBJ-AT ?auto_159239 ?auto_159242 ) ( TRUCK-AT ?auto_159244 ?auto_159238 ) ( IN-TRUCK ?auto_159240 ?auto_159244 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_159241 ?auto_159239 ?auto_159238 )
      ( DELIVER-3PKG-VERIFY ?auto_159239 ?auto_159240 ?auto_159241 ?auto_159238 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_159837 - OBJ
      ?auto_159836 - LOCATION
    )
    :vars
    (
      ?auto_159840 - OBJ
      ?auto_159838 - LOCATION
      ?auto_159839 - CITY
      ?auto_159842 - OBJ
      ?auto_159841 - TRUCK
      ?auto_159843 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_159837 ?auto_159840 ) ) ( IN-CITY ?auto_159838 ?auto_159839 ) ( IN-CITY ?auto_159836 ?auto_159839 ) ( not ( = ?auto_159836 ?auto_159838 ) ) ( OBJ-AT ?auto_159840 ?auto_159836 ) ( OBJ-AT ?auto_159837 ?auto_159838 ) ( not ( = ?auto_159842 ?auto_159840 ) ) ( IN-TRUCK ?auto_159842 ?auto_159841 ) ( not ( = ?auto_159837 ?auto_159842 ) ) ( TRUCK-AT ?auto_159841 ?auto_159843 ) ( IN-CITY ?auto_159843 ?auto_159839 ) ( not ( = ?auto_159836 ?auto_159843 ) ) ( not ( = ?auto_159838 ?auto_159843 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_159841 ?auto_159843 ?auto_159836 ?auto_159839 )
      ( DELIVER-2PKG ?auto_159840 ?auto_159837 ?auto_159836 )
      ( DELIVER-1PKG-VERIFY ?auto_159837 ?auto_159836 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_159845 - OBJ
      ?auto_159846 - OBJ
      ?auto_159844 - LOCATION
    )
    :vars
    (
      ?auto_159850 - LOCATION
      ?auto_159847 - CITY
      ?auto_159851 - OBJ
      ?auto_159849 - TRUCK
      ?auto_159848 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_159846 ?auto_159845 ) ) ( IN-CITY ?auto_159850 ?auto_159847 ) ( IN-CITY ?auto_159844 ?auto_159847 ) ( not ( = ?auto_159844 ?auto_159850 ) ) ( OBJ-AT ?auto_159845 ?auto_159844 ) ( OBJ-AT ?auto_159846 ?auto_159850 ) ( not ( = ?auto_159851 ?auto_159845 ) ) ( IN-TRUCK ?auto_159851 ?auto_159849 ) ( not ( = ?auto_159846 ?auto_159851 ) ) ( TRUCK-AT ?auto_159849 ?auto_159848 ) ( IN-CITY ?auto_159848 ?auto_159847 ) ( not ( = ?auto_159844 ?auto_159848 ) ) ( not ( = ?auto_159850 ?auto_159848 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_159846 ?auto_159844 )
      ( DELIVER-2PKG-VERIFY ?auto_159845 ?auto_159846 ?auto_159844 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_159853 - OBJ
      ?auto_159854 - OBJ
      ?auto_159852 - LOCATION
    )
    :vars
    (
      ?auto_159859 - OBJ
      ?auto_159858 - LOCATION
      ?auto_159856 - CITY
      ?auto_159855 - TRUCK
      ?auto_159857 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_159854 ?auto_159853 ) ) ( not ( = ?auto_159854 ?auto_159859 ) ) ( IN-CITY ?auto_159858 ?auto_159856 ) ( IN-CITY ?auto_159852 ?auto_159856 ) ( not ( = ?auto_159852 ?auto_159858 ) ) ( OBJ-AT ?auto_159859 ?auto_159852 ) ( OBJ-AT ?auto_159854 ?auto_159858 ) ( not ( = ?auto_159853 ?auto_159859 ) ) ( IN-TRUCK ?auto_159853 ?auto_159855 ) ( TRUCK-AT ?auto_159855 ?auto_159857 ) ( IN-CITY ?auto_159857 ?auto_159856 ) ( not ( = ?auto_159852 ?auto_159857 ) ) ( not ( = ?auto_159858 ?auto_159857 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_159859 ?auto_159854 ?auto_159852 )
      ( DELIVER-2PKG-VERIFY ?auto_159853 ?auto_159854 ?auto_159852 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_159861 - OBJ
      ?auto_159862 - OBJ
      ?auto_159860 - LOCATION
    )
    :vars
    (
      ?auto_159867 - LOCATION
      ?auto_159865 - CITY
      ?auto_159864 - OBJ
      ?auto_159863 - TRUCK
      ?auto_159866 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_159862 ?auto_159861 ) ) ( IN-CITY ?auto_159867 ?auto_159865 ) ( IN-CITY ?auto_159860 ?auto_159865 ) ( not ( = ?auto_159860 ?auto_159867 ) ) ( OBJ-AT ?auto_159862 ?auto_159860 ) ( OBJ-AT ?auto_159861 ?auto_159867 ) ( not ( = ?auto_159864 ?auto_159862 ) ) ( IN-TRUCK ?auto_159864 ?auto_159863 ) ( not ( = ?auto_159861 ?auto_159864 ) ) ( TRUCK-AT ?auto_159863 ?auto_159866 ) ( IN-CITY ?auto_159866 ?auto_159865 ) ( not ( = ?auto_159860 ?auto_159866 ) ) ( not ( = ?auto_159867 ?auto_159866 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_159862 ?auto_159861 ?auto_159860 )
      ( DELIVER-2PKG-VERIFY ?auto_159861 ?auto_159862 ?auto_159860 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_159869 - OBJ
      ?auto_159870 - OBJ
      ?auto_159868 - LOCATION
    )
    :vars
    (
      ?auto_159875 - OBJ
      ?auto_159874 - LOCATION
      ?auto_159872 - CITY
      ?auto_159871 - TRUCK
      ?auto_159873 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_159870 ?auto_159869 ) ) ( not ( = ?auto_159869 ?auto_159875 ) ) ( IN-CITY ?auto_159874 ?auto_159872 ) ( IN-CITY ?auto_159868 ?auto_159872 ) ( not ( = ?auto_159868 ?auto_159874 ) ) ( OBJ-AT ?auto_159875 ?auto_159868 ) ( OBJ-AT ?auto_159869 ?auto_159874 ) ( not ( = ?auto_159870 ?auto_159875 ) ) ( IN-TRUCK ?auto_159870 ?auto_159871 ) ( TRUCK-AT ?auto_159871 ?auto_159873 ) ( IN-CITY ?auto_159873 ?auto_159872 ) ( not ( = ?auto_159868 ?auto_159873 ) ) ( not ( = ?auto_159874 ?auto_159873 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_159875 ?auto_159869 ?auto_159868 )
      ( DELIVER-2PKG-VERIFY ?auto_159869 ?auto_159870 ?auto_159868 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_159895 - OBJ
      ?auto_159896 - OBJ
      ?auto_159897 - OBJ
      ?auto_159894 - LOCATION
    )
    :vars
    (
      ?auto_159901 - LOCATION
      ?auto_159899 - CITY
      ?auto_159898 - TRUCK
      ?auto_159900 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_159896 ?auto_159895 ) ) ( not ( = ?auto_159897 ?auto_159895 ) ) ( not ( = ?auto_159897 ?auto_159896 ) ) ( IN-CITY ?auto_159901 ?auto_159899 ) ( IN-CITY ?auto_159894 ?auto_159899 ) ( not ( = ?auto_159894 ?auto_159901 ) ) ( OBJ-AT ?auto_159895 ?auto_159894 ) ( OBJ-AT ?auto_159897 ?auto_159901 ) ( IN-TRUCK ?auto_159896 ?auto_159898 ) ( TRUCK-AT ?auto_159898 ?auto_159900 ) ( IN-CITY ?auto_159900 ?auto_159899 ) ( not ( = ?auto_159894 ?auto_159900 ) ) ( not ( = ?auto_159901 ?auto_159900 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_159895 ?auto_159897 ?auto_159894 )
      ( DELIVER-3PKG-VERIFY ?auto_159895 ?auto_159896 ?auto_159897 ?auto_159894 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_159912 - OBJ
      ?auto_159913 - OBJ
      ?auto_159914 - OBJ
      ?auto_159911 - LOCATION
    )
    :vars
    (
      ?auto_159918 - LOCATION
      ?auto_159916 - CITY
      ?auto_159915 - TRUCK
      ?auto_159917 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_159913 ?auto_159912 ) ) ( not ( = ?auto_159914 ?auto_159912 ) ) ( not ( = ?auto_159914 ?auto_159913 ) ) ( IN-CITY ?auto_159918 ?auto_159916 ) ( IN-CITY ?auto_159911 ?auto_159916 ) ( not ( = ?auto_159911 ?auto_159918 ) ) ( OBJ-AT ?auto_159912 ?auto_159911 ) ( OBJ-AT ?auto_159913 ?auto_159918 ) ( IN-TRUCK ?auto_159914 ?auto_159915 ) ( TRUCK-AT ?auto_159915 ?auto_159917 ) ( IN-CITY ?auto_159917 ?auto_159916 ) ( not ( = ?auto_159911 ?auto_159917 ) ) ( not ( = ?auto_159918 ?auto_159917 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_159912 ?auto_159913 ?auto_159911 )
      ( DELIVER-3PKG-VERIFY ?auto_159912 ?auto_159913 ?auto_159914 ?auto_159911 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_159929 - OBJ
      ?auto_159930 - OBJ
      ?auto_159931 - OBJ
      ?auto_159928 - LOCATION
    )
    :vars
    (
      ?auto_159935 - LOCATION
      ?auto_159933 - CITY
      ?auto_159932 - TRUCK
      ?auto_159934 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_159930 ?auto_159929 ) ) ( not ( = ?auto_159931 ?auto_159929 ) ) ( not ( = ?auto_159931 ?auto_159930 ) ) ( IN-CITY ?auto_159935 ?auto_159933 ) ( IN-CITY ?auto_159928 ?auto_159933 ) ( not ( = ?auto_159928 ?auto_159935 ) ) ( OBJ-AT ?auto_159930 ?auto_159928 ) ( OBJ-AT ?auto_159931 ?auto_159935 ) ( IN-TRUCK ?auto_159929 ?auto_159932 ) ( TRUCK-AT ?auto_159932 ?auto_159934 ) ( IN-CITY ?auto_159934 ?auto_159933 ) ( not ( = ?auto_159928 ?auto_159934 ) ) ( not ( = ?auto_159935 ?auto_159934 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_159930 ?auto_159931 ?auto_159928 )
      ( DELIVER-3PKG-VERIFY ?auto_159929 ?auto_159930 ?auto_159931 ?auto_159928 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_159946 - OBJ
      ?auto_159947 - OBJ
      ?auto_159948 - OBJ
      ?auto_159945 - LOCATION
    )
    :vars
    (
      ?auto_159952 - LOCATION
      ?auto_159950 - CITY
      ?auto_159949 - TRUCK
      ?auto_159951 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_159947 ?auto_159946 ) ) ( not ( = ?auto_159948 ?auto_159946 ) ) ( not ( = ?auto_159948 ?auto_159947 ) ) ( IN-CITY ?auto_159952 ?auto_159950 ) ( IN-CITY ?auto_159945 ?auto_159950 ) ( not ( = ?auto_159945 ?auto_159952 ) ) ( OBJ-AT ?auto_159948 ?auto_159945 ) ( OBJ-AT ?auto_159947 ?auto_159952 ) ( IN-TRUCK ?auto_159946 ?auto_159949 ) ( TRUCK-AT ?auto_159949 ?auto_159951 ) ( IN-CITY ?auto_159951 ?auto_159950 ) ( not ( = ?auto_159945 ?auto_159951 ) ) ( not ( = ?auto_159952 ?auto_159951 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_159948 ?auto_159947 ?auto_159945 )
      ( DELIVER-3PKG-VERIFY ?auto_159946 ?auto_159947 ?auto_159948 ?auto_159945 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_159981 - OBJ
      ?auto_159982 - OBJ
      ?auto_159983 - OBJ
      ?auto_159980 - LOCATION
    )
    :vars
    (
      ?auto_159987 - LOCATION
      ?auto_159985 - CITY
      ?auto_159984 - TRUCK
      ?auto_159986 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_159982 ?auto_159981 ) ) ( not ( = ?auto_159983 ?auto_159981 ) ) ( not ( = ?auto_159983 ?auto_159982 ) ) ( IN-CITY ?auto_159987 ?auto_159985 ) ( IN-CITY ?auto_159980 ?auto_159985 ) ( not ( = ?auto_159980 ?auto_159987 ) ) ( OBJ-AT ?auto_159982 ?auto_159980 ) ( OBJ-AT ?auto_159981 ?auto_159987 ) ( IN-TRUCK ?auto_159983 ?auto_159984 ) ( TRUCK-AT ?auto_159984 ?auto_159986 ) ( IN-CITY ?auto_159986 ?auto_159985 ) ( not ( = ?auto_159980 ?auto_159986 ) ) ( not ( = ?auto_159987 ?auto_159986 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_159982 ?auto_159981 ?auto_159980 )
      ( DELIVER-3PKG-VERIFY ?auto_159981 ?auto_159982 ?auto_159983 ?auto_159980 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_159998 - OBJ
      ?auto_159999 - OBJ
      ?auto_160000 - OBJ
      ?auto_159997 - LOCATION
    )
    :vars
    (
      ?auto_160004 - LOCATION
      ?auto_160002 - CITY
      ?auto_160001 - TRUCK
      ?auto_160003 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_159999 ?auto_159998 ) ) ( not ( = ?auto_160000 ?auto_159998 ) ) ( not ( = ?auto_160000 ?auto_159999 ) ) ( IN-CITY ?auto_160004 ?auto_160002 ) ( IN-CITY ?auto_159997 ?auto_160002 ) ( not ( = ?auto_159997 ?auto_160004 ) ) ( OBJ-AT ?auto_160000 ?auto_159997 ) ( OBJ-AT ?auto_159998 ?auto_160004 ) ( IN-TRUCK ?auto_159999 ?auto_160001 ) ( TRUCK-AT ?auto_160001 ?auto_160003 ) ( IN-CITY ?auto_160003 ?auto_160002 ) ( not ( = ?auto_159997 ?auto_160003 ) ) ( not ( = ?auto_160004 ?auto_160003 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_160000 ?auto_159998 ?auto_159997 )
      ( DELIVER-3PKG-VERIFY ?auto_159998 ?auto_159999 ?auto_160000 ?auto_159997 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_160667 - OBJ
      ?auto_160666 - LOCATION
    )
    :vars
    (
      ?auto_160673 - OBJ
      ?auto_160672 - LOCATION
      ?auto_160670 - CITY
      ?auto_160669 - OBJ
      ?auto_160668 - TRUCK
      ?auto_160671 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_160667 ?auto_160673 ) ) ( IN-CITY ?auto_160672 ?auto_160670 ) ( IN-CITY ?auto_160666 ?auto_160670 ) ( not ( = ?auto_160666 ?auto_160672 ) ) ( OBJ-AT ?auto_160673 ?auto_160666 ) ( OBJ-AT ?auto_160667 ?auto_160672 ) ( not ( = ?auto_160669 ?auto_160673 ) ) ( not ( = ?auto_160667 ?auto_160669 ) ) ( TRUCK-AT ?auto_160668 ?auto_160671 ) ( IN-CITY ?auto_160671 ?auto_160670 ) ( not ( = ?auto_160666 ?auto_160671 ) ) ( not ( = ?auto_160672 ?auto_160671 ) ) ( OBJ-AT ?auto_160669 ?auto_160671 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_160669 ?auto_160668 ?auto_160671 )
      ( DELIVER-2PKG ?auto_160673 ?auto_160667 ?auto_160666 )
      ( DELIVER-1PKG-VERIFY ?auto_160667 ?auto_160666 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_160675 - OBJ
      ?auto_160676 - OBJ
      ?auto_160674 - LOCATION
    )
    :vars
    (
      ?auto_160680 - LOCATION
      ?auto_160677 - CITY
      ?auto_160681 - OBJ
      ?auto_160679 - TRUCK
      ?auto_160678 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_160676 ?auto_160675 ) ) ( IN-CITY ?auto_160680 ?auto_160677 ) ( IN-CITY ?auto_160674 ?auto_160677 ) ( not ( = ?auto_160674 ?auto_160680 ) ) ( OBJ-AT ?auto_160675 ?auto_160674 ) ( OBJ-AT ?auto_160676 ?auto_160680 ) ( not ( = ?auto_160681 ?auto_160675 ) ) ( not ( = ?auto_160676 ?auto_160681 ) ) ( TRUCK-AT ?auto_160679 ?auto_160678 ) ( IN-CITY ?auto_160678 ?auto_160677 ) ( not ( = ?auto_160674 ?auto_160678 ) ) ( not ( = ?auto_160680 ?auto_160678 ) ) ( OBJ-AT ?auto_160681 ?auto_160678 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_160676 ?auto_160674 )
      ( DELIVER-2PKG-VERIFY ?auto_160675 ?auto_160676 ?auto_160674 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_160683 - OBJ
      ?auto_160684 - OBJ
      ?auto_160682 - LOCATION
    )
    :vars
    (
      ?auto_160686 - OBJ
      ?auto_160685 - LOCATION
      ?auto_160689 - CITY
      ?auto_160688 - TRUCK
      ?auto_160687 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_160684 ?auto_160683 ) ) ( not ( = ?auto_160684 ?auto_160686 ) ) ( IN-CITY ?auto_160685 ?auto_160689 ) ( IN-CITY ?auto_160682 ?auto_160689 ) ( not ( = ?auto_160682 ?auto_160685 ) ) ( OBJ-AT ?auto_160686 ?auto_160682 ) ( OBJ-AT ?auto_160684 ?auto_160685 ) ( not ( = ?auto_160683 ?auto_160686 ) ) ( TRUCK-AT ?auto_160688 ?auto_160687 ) ( IN-CITY ?auto_160687 ?auto_160689 ) ( not ( = ?auto_160682 ?auto_160687 ) ) ( not ( = ?auto_160685 ?auto_160687 ) ) ( OBJ-AT ?auto_160683 ?auto_160687 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_160686 ?auto_160684 ?auto_160682 )
      ( DELIVER-2PKG-VERIFY ?auto_160683 ?auto_160684 ?auto_160682 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_160691 - OBJ
      ?auto_160692 - OBJ
      ?auto_160690 - LOCATION
    )
    :vars
    (
      ?auto_160693 - LOCATION
      ?auto_160696 - CITY
      ?auto_160697 - OBJ
      ?auto_160695 - TRUCK
      ?auto_160694 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_160692 ?auto_160691 ) ) ( IN-CITY ?auto_160693 ?auto_160696 ) ( IN-CITY ?auto_160690 ?auto_160696 ) ( not ( = ?auto_160690 ?auto_160693 ) ) ( OBJ-AT ?auto_160692 ?auto_160690 ) ( OBJ-AT ?auto_160691 ?auto_160693 ) ( not ( = ?auto_160697 ?auto_160692 ) ) ( not ( = ?auto_160691 ?auto_160697 ) ) ( TRUCK-AT ?auto_160695 ?auto_160694 ) ( IN-CITY ?auto_160694 ?auto_160696 ) ( not ( = ?auto_160690 ?auto_160694 ) ) ( not ( = ?auto_160693 ?auto_160694 ) ) ( OBJ-AT ?auto_160697 ?auto_160694 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_160692 ?auto_160691 ?auto_160690 )
      ( DELIVER-2PKG-VERIFY ?auto_160691 ?auto_160692 ?auto_160690 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_160699 - OBJ
      ?auto_160700 - OBJ
      ?auto_160698 - LOCATION
    )
    :vars
    (
      ?auto_160702 - OBJ
      ?auto_160701 - LOCATION
      ?auto_160705 - CITY
      ?auto_160704 - TRUCK
      ?auto_160703 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_160700 ?auto_160699 ) ) ( not ( = ?auto_160699 ?auto_160702 ) ) ( IN-CITY ?auto_160701 ?auto_160705 ) ( IN-CITY ?auto_160698 ?auto_160705 ) ( not ( = ?auto_160698 ?auto_160701 ) ) ( OBJ-AT ?auto_160702 ?auto_160698 ) ( OBJ-AT ?auto_160699 ?auto_160701 ) ( not ( = ?auto_160700 ?auto_160702 ) ) ( TRUCK-AT ?auto_160704 ?auto_160703 ) ( IN-CITY ?auto_160703 ?auto_160705 ) ( not ( = ?auto_160698 ?auto_160703 ) ) ( not ( = ?auto_160701 ?auto_160703 ) ) ( OBJ-AT ?auto_160700 ?auto_160703 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_160702 ?auto_160699 ?auto_160698 )
      ( DELIVER-2PKG-VERIFY ?auto_160699 ?auto_160700 ?auto_160698 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_160725 - OBJ
      ?auto_160726 - OBJ
      ?auto_160727 - OBJ
      ?auto_160724 - LOCATION
    )
    :vars
    (
      ?auto_160728 - LOCATION
      ?auto_160731 - CITY
      ?auto_160730 - TRUCK
      ?auto_160729 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_160726 ?auto_160725 ) ) ( not ( = ?auto_160727 ?auto_160725 ) ) ( not ( = ?auto_160727 ?auto_160726 ) ) ( IN-CITY ?auto_160728 ?auto_160731 ) ( IN-CITY ?auto_160724 ?auto_160731 ) ( not ( = ?auto_160724 ?auto_160728 ) ) ( OBJ-AT ?auto_160725 ?auto_160724 ) ( OBJ-AT ?auto_160727 ?auto_160728 ) ( TRUCK-AT ?auto_160730 ?auto_160729 ) ( IN-CITY ?auto_160729 ?auto_160731 ) ( not ( = ?auto_160724 ?auto_160729 ) ) ( not ( = ?auto_160728 ?auto_160729 ) ) ( OBJ-AT ?auto_160726 ?auto_160729 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_160725 ?auto_160727 ?auto_160724 )
      ( DELIVER-3PKG-VERIFY ?auto_160725 ?auto_160726 ?auto_160727 ?auto_160724 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_160742 - OBJ
      ?auto_160743 - OBJ
      ?auto_160744 - OBJ
      ?auto_160741 - LOCATION
    )
    :vars
    (
      ?auto_160745 - LOCATION
      ?auto_160748 - CITY
      ?auto_160747 - TRUCK
      ?auto_160746 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_160743 ?auto_160742 ) ) ( not ( = ?auto_160744 ?auto_160742 ) ) ( not ( = ?auto_160744 ?auto_160743 ) ) ( IN-CITY ?auto_160745 ?auto_160748 ) ( IN-CITY ?auto_160741 ?auto_160748 ) ( not ( = ?auto_160741 ?auto_160745 ) ) ( OBJ-AT ?auto_160742 ?auto_160741 ) ( OBJ-AT ?auto_160743 ?auto_160745 ) ( TRUCK-AT ?auto_160747 ?auto_160746 ) ( IN-CITY ?auto_160746 ?auto_160748 ) ( not ( = ?auto_160741 ?auto_160746 ) ) ( not ( = ?auto_160745 ?auto_160746 ) ) ( OBJ-AT ?auto_160744 ?auto_160746 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_160742 ?auto_160743 ?auto_160741 )
      ( DELIVER-3PKG-VERIFY ?auto_160742 ?auto_160743 ?auto_160744 ?auto_160741 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_160759 - OBJ
      ?auto_160760 - OBJ
      ?auto_160761 - OBJ
      ?auto_160758 - LOCATION
    )
    :vars
    (
      ?auto_160762 - LOCATION
      ?auto_160765 - CITY
      ?auto_160764 - TRUCK
      ?auto_160763 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_160760 ?auto_160759 ) ) ( not ( = ?auto_160761 ?auto_160759 ) ) ( not ( = ?auto_160761 ?auto_160760 ) ) ( IN-CITY ?auto_160762 ?auto_160765 ) ( IN-CITY ?auto_160758 ?auto_160765 ) ( not ( = ?auto_160758 ?auto_160762 ) ) ( OBJ-AT ?auto_160760 ?auto_160758 ) ( OBJ-AT ?auto_160761 ?auto_160762 ) ( TRUCK-AT ?auto_160764 ?auto_160763 ) ( IN-CITY ?auto_160763 ?auto_160765 ) ( not ( = ?auto_160758 ?auto_160763 ) ) ( not ( = ?auto_160762 ?auto_160763 ) ) ( OBJ-AT ?auto_160759 ?auto_160763 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_160760 ?auto_160761 ?auto_160758 )
      ( DELIVER-3PKG-VERIFY ?auto_160759 ?auto_160760 ?auto_160761 ?auto_160758 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_160776 - OBJ
      ?auto_160777 - OBJ
      ?auto_160778 - OBJ
      ?auto_160775 - LOCATION
    )
    :vars
    (
      ?auto_160779 - LOCATION
      ?auto_160782 - CITY
      ?auto_160781 - TRUCK
      ?auto_160780 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_160777 ?auto_160776 ) ) ( not ( = ?auto_160778 ?auto_160776 ) ) ( not ( = ?auto_160778 ?auto_160777 ) ) ( IN-CITY ?auto_160779 ?auto_160782 ) ( IN-CITY ?auto_160775 ?auto_160782 ) ( not ( = ?auto_160775 ?auto_160779 ) ) ( OBJ-AT ?auto_160778 ?auto_160775 ) ( OBJ-AT ?auto_160777 ?auto_160779 ) ( TRUCK-AT ?auto_160781 ?auto_160780 ) ( IN-CITY ?auto_160780 ?auto_160782 ) ( not ( = ?auto_160775 ?auto_160780 ) ) ( not ( = ?auto_160779 ?auto_160780 ) ) ( OBJ-AT ?auto_160776 ?auto_160780 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_160778 ?auto_160777 ?auto_160775 )
      ( DELIVER-3PKG-VERIFY ?auto_160776 ?auto_160777 ?auto_160778 ?auto_160775 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_160811 - OBJ
      ?auto_160812 - OBJ
      ?auto_160813 - OBJ
      ?auto_160810 - LOCATION
    )
    :vars
    (
      ?auto_160814 - LOCATION
      ?auto_160817 - CITY
      ?auto_160816 - TRUCK
      ?auto_160815 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_160812 ?auto_160811 ) ) ( not ( = ?auto_160813 ?auto_160811 ) ) ( not ( = ?auto_160813 ?auto_160812 ) ) ( IN-CITY ?auto_160814 ?auto_160817 ) ( IN-CITY ?auto_160810 ?auto_160817 ) ( not ( = ?auto_160810 ?auto_160814 ) ) ( OBJ-AT ?auto_160812 ?auto_160810 ) ( OBJ-AT ?auto_160811 ?auto_160814 ) ( TRUCK-AT ?auto_160816 ?auto_160815 ) ( IN-CITY ?auto_160815 ?auto_160817 ) ( not ( = ?auto_160810 ?auto_160815 ) ) ( not ( = ?auto_160814 ?auto_160815 ) ) ( OBJ-AT ?auto_160813 ?auto_160815 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_160812 ?auto_160811 ?auto_160810 )
      ( DELIVER-3PKG-VERIFY ?auto_160811 ?auto_160812 ?auto_160813 ?auto_160810 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_160828 - OBJ
      ?auto_160829 - OBJ
      ?auto_160830 - OBJ
      ?auto_160827 - LOCATION
    )
    :vars
    (
      ?auto_160831 - LOCATION
      ?auto_160834 - CITY
      ?auto_160833 - TRUCK
      ?auto_160832 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_160829 ?auto_160828 ) ) ( not ( = ?auto_160830 ?auto_160828 ) ) ( not ( = ?auto_160830 ?auto_160829 ) ) ( IN-CITY ?auto_160831 ?auto_160834 ) ( IN-CITY ?auto_160827 ?auto_160834 ) ( not ( = ?auto_160827 ?auto_160831 ) ) ( OBJ-AT ?auto_160830 ?auto_160827 ) ( OBJ-AT ?auto_160828 ?auto_160831 ) ( TRUCK-AT ?auto_160833 ?auto_160832 ) ( IN-CITY ?auto_160832 ?auto_160834 ) ( not ( = ?auto_160827 ?auto_160832 ) ) ( not ( = ?auto_160831 ?auto_160832 ) ) ( OBJ-AT ?auto_160829 ?auto_160832 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_160830 ?auto_160828 ?auto_160827 )
      ( DELIVER-3PKG-VERIFY ?auto_160828 ?auto_160829 ?auto_160830 ?auto_160827 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_161497 - OBJ
      ?auto_161496 - LOCATION
    )
    :vars
    (
      ?auto_161499 - OBJ
      ?auto_161498 - LOCATION
      ?auto_161502 - CITY
      ?auto_161503 - OBJ
      ?auto_161500 - LOCATION
      ?auto_161501 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_161497 ?auto_161499 ) ) ( IN-CITY ?auto_161498 ?auto_161502 ) ( IN-CITY ?auto_161496 ?auto_161502 ) ( not ( = ?auto_161496 ?auto_161498 ) ) ( OBJ-AT ?auto_161499 ?auto_161496 ) ( OBJ-AT ?auto_161497 ?auto_161498 ) ( not ( = ?auto_161503 ?auto_161499 ) ) ( not ( = ?auto_161497 ?auto_161503 ) ) ( IN-CITY ?auto_161500 ?auto_161502 ) ( not ( = ?auto_161496 ?auto_161500 ) ) ( not ( = ?auto_161498 ?auto_161500 ) ) ( OBJ-AT ?auto_161503 ?auto_161500 ) ( TRUCK-AT ?auto_161501 ?auto_161496 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_161501 ?auto_161496 ?auto_161500 ?auto_161502 )
      ( DELIVER-2PKG ?auto_161499 ?auto_161497 ?auto_161496 )
      ( DELIVER-1PKG-VERIFY ?auto_161497 ?auto_161496 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_161505 - OBJ
      ?auto_161506 - OBJ
      ?auto_161504 - LOCATION
    )
    :vars
    (
      ?auto_161507 - LOCATION
      ?auto_161508 - CITY
      ?auto_161510 - OBJ
      ?auto_161509 - LOCATION
      ?auto_161511 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_161506 ?auto_161505 ) ) ( IN-CITY ?auto_161507 ?auto_161508 ) ( IN-CITY ?auto_161504 ?auto_161508 ) ( not ( = ?auto_161504 ?auto_161507 ) ) ( OBJ-AT ?auto_161505 ?auto_161504 ) ( OBJ-AT ?auto_161506 ?auto_161507 ) ( not ( = ?auto_161510 ?auto_161505 ) ) ( not ( = ?auto_161506 ?auto_161510 ) ) ( IN-CITY ?auto_161509 ?auto_161508 ) ( not ( = ?auto_161504 ?auto_161509 ) ) ( not ( = ?auto_161507 ?auto_161509 ) ) ( OBJ-AT ?auto_161510 ?auto_161509 ) ( TRUCK-AT ?auto_161511 ?auto_161504 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_161506 ?auto_161504 )
      ( DELIVER-2PKG-VERIFY ?auto_161505 ?auto_161506 ?auto_161504 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_161513 - OBJ
      ?auto_161514 - OBJ
      ?auto_161512 - LOCATION
    )
    :vars
    (
      ?auto_161516 - OBJ
      ?auto_161515 - LOCATION
      ?auto_161517 - CITY
      ?auto_161518 - LOCATION
      ?auto_161519 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_161514 ?auto_161513 ) ) ( not ( = ?auto_161514 ?auto_161516 ) ) ( IN-CITY ?auto_161515 ?auto_161517 ) ( IN-CITY ?auto_161512 ?auto_161517 ) ( not ( = ?auto_161512 ?auto_161515 ) ) ( OBJ-AT ?auto_161516 ?auto_161512 ) ( OBJ-AT ?auto_161514 ?auto_161515 ) ( not ( = ?auto_161513 ?auto_161516 ) ) ( IN-CITY ?auto_161518 ?auto_161517 ) ( not ( = ?auto_161512 ?auto_161518 ) ) ( not ( = ?auto_161515 ?auto_161518 ) ) ( OBJ-AT ?auto_161513 ?auto_161518 ) ( TRUCK-AT ?auto_161519 ?auto_161512 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_161516 ?auto_161514 ?auto_161512 )
      ( DELIVER-2PKG-VERIFY ?auto_161513 ?auto_161514 ?auto_161512 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_161521 - OBJ
      ?auto_161522 - OBJ
      ?auto_161520 - LOCATION
    )
    :vars
    (
      ?auto_161523 - LOCATION
      ?auto_161524 - CITY
      ?auto_161525 - OBJ
      ?auto_161526 - LOCATION
      ?auto_161527 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_161522 ?auto_161521 ) ) ( IN-CITY ?auto_161523 ?auto_161524 ) ( IN-CITY ?auto_161520 ?auto_161524 ) ( not ( = ?auto_161520 ?auto_161523 ) ) ( OBJ-AT ?auto_161522 ?auto_161520 ) ( OBJ-AT ?auto_161521 ?auto_161523 ) ( not ( = ?auto_161525 ?auto_161522 ) ) ( not ( = ?auto_161521 ?auto_161525 ) ) ( IN-CITY ?auto_161526 ?auto_161524 ) ( not ( = ?auto_161520 ?auto_161526 ) ) ( not ( = ?auto_161523 ?auto_161526 ) ) ( OBJ-AT ?auto_161525 ?auto_161526 ) ( TRUCK-AT ?auto_161527 ?auto_161520 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_161522 ?auto_161521 ?auto_161520 )
      ( DELIVER-2PKG-VERIFY ?auto_161521 ?auto_161522 ?auto_161520 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_161529 - OBJ
      ?auto_161530 - OBJ
      ?auto_161528 - LOCATION
    )
    :vars
    (
      ?auto_161532 - OBJ
      ?auto_161531 - LOCATION
      ?auto_161533 - CITY
      ?auto_161534 - LOCATION
      ?auto_161535 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_161530 ?auto_161529 ) ) ( not ( = ?auto_161529 ?auto_161532 ) ) ( IN-CITY ?auto_161531 ?auto_161533 ) ( IN-CITY ?auto_161528 ?auto_161533 ) ( not ( = ?auto_161528 ?auto_161531 ) ) ( OBJ-AT ?auto_161532 ?auto_161528 ) ( OBJ-AT ?auto_161529 ?auto_161531 ) ( not ( = ?auto_161530 ?auto_161532 ) ) ( IN-CITY ?auto_161534 ?auto_161533 ) ( not ( = ?auto_161528 ?auto_161534 ) ) ( not ( = ?auto_161531 ?auto_161534 ) ) ( OBJ-AT ?auto_161530 ?auto_161534 ) ( TRUCK-AT ?auto_161535 ?auto_161528 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_161532 ?auto_161529 ?auto_161528 )
      ( DELIVER-2PKG-VERIFY ?auto_161529 ?auto_161530 ?auto_161528 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_161555 - OBJ
      ?auto_161556 - OBJ
      ?auto_161557 - OBJ
      ?auto_161554 - LOCATION
    )
    :vars
    (
      ?auto_161558 - LOCATION
      ?auto_161559 - CITY
      ?auto_161560 - LOCATION
      ?auto_161561 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_161556 ?auto_161555 ) ) ( not ( = ?auto_161557 ?auto_161555 ) ) ( not ( = ?auto_161557 ?auto_161556 ) ) ( IN-CITY ?auto_161558 ?auto_161559 ) ( IN-CITY ?auto_161554 ?auto_161559 ) ( not ( = ?auto_161554 ?auto_161558 ) ) ( OBJ-AT ?auto_161555 ?auto_161554 ) ( OBJ-AT ?auto_161557 ?auto_161558 ) ( IN-CITY ?auto_161560 ?auto_161559 ) ( not ( = ?auto_161554 ?auto_161560 ) ) ( not ( = ?auto_161558 ?auto_161560 ) ) ( OBJ-AT ?auto_161556 ?auto_161560 ) ( TRUCK-AT ?auto_161561 ?auto_161554 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_161555 ?auto_161557 ?auto_161554 )
      ( DELIVER-3PKG-VERIFY ?auto_161555 ?auto_161556 ?auto_161557 ?auto_161554 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_161572 - OBJ
      ?auto_161573 - OBJ
      ?auto_161574 - OBJ
      ?auto_161571 - LOCATION
    )
    :vars
    (
      ?auto_161575 - LOCATION
      ?auto_161576 - CITY
      ?auto_161577 - LOCATION
      ?auto_161578 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_161573 ?auto_161572 ) ) ( not ( = ?auto_161574 ?auto_161572 ) ) ( not ( = ?auto_161574 ?auto_161573 ) ) ( IN-CITY ?auto_161575 ?auto_161576 ) ( IN-CITY ?auto_161571 ?auto_161576 ) ( not ( = ?auto_161571 ?auto_161575 ) ) ( OBJ-AT ?auto_161572 ?auto_161571 ) ( OBJ-AT ?auto_161573 ?auto_161575 ) ( IN-CITY ?auto_161577 ?auto_161576 ) ( not ( = ?auto_161571 ?auto_161577 ) ) ( not ( = ?auto_161575 ?auto_161577 ) ) ( OBJ-AT ?auto_161574 ?auto_161577 ) ( TRUCK-AT ?auto_161578 ?auto_161571 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_161572 ?auto_161573 ?auto_161571 )
      ( DELIVER-3PKG-VERIFY ?auto_161572 ?auto_161573 ?auto_161574 ?auto_161571 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_161589 - OBJ
      ?auto_161590 - OBJ
      ?auto_161591 - OBJ
      ?auto_161588 - LOCATION
    )
    :vars
    (
      ?auto_161592 - LOCATION
      ?auto_161593 - CITY
      ?auto_161594 - LOCATION
      ?auto_161595 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_161590 ?auto_161589 ) ) ( not ( = ?auto_161591 ?auto_161589 ) ) ( not ( = ?auto_161591 ?auto_161590 ) ) ( IN-CITY ?auto_161592 ?auto_161593 ) ( IN-CITY ?auto_161588 ?auto_161593 ) ( not ( = ?auto_161588 ?auto_161592 ) ) ( OBJ-AT ?auto_161590 ?auto_161588 ) ( OBJ-AT ?auto_161591 ?auto_161592 ) ( IN-CITY ?auto_161594 ?auto_161593 ) ( not ( = ?auto_161588 ?auto_161594 ) ) ( not ( = ?auto_161592 ?auto_161594 ) ) ( OBJ-AT ?auto_161589 ?auto_161594 ) ( TRUCK-AT ?auto_161595 ?auto_161588 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_161590 ?auto_161591 ?auto_161588 )
      ( DELIVER-3PKG-VERIFY ?auto_161589 ?auto_161590 ?auto_161591 ?auto_161588 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_161606 - OBJ
      ?auto_161607 - OBJ
      ?auto_161608 - OBJ
      ?auto_161605 - LOCATION
    )
    :vars
    (
      ?auto_161609 - LOCATION
      ?auto_161610 - CITY
      ?auto_161611 - LOCATION
      ?auto_161612 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_161607 ?auto_161606 ) ) ( not ( = ?auto_161608 ?auto_161606 ) ) ( not ( = ?auto_161608 ?auto_161607 ) ) ( IN-CITY ?auto_161609 ?auto_161610 ) ( IN-CITY ?auto_161605 ?auto_161610 ) ( not ( = ?auto_161605 ?auto_161609 ) ) ( OBJ-AT ?auto_161608 ?auto_161605 ) ( OBJ-AT ?auto_161607 ?auto_161609 ) ( IN-CITY ?auto_161611 ?auto_161610 ) ( not ( = ?auto_161605 ?auto_161611 ) ) ( not ( = ?auto_161609 ?auto_161611 ) ) ( OBJ-AT ?auto_161606 ?auto_161611 ) ( TRUCK-AT ?auto_161612 ?auto_161605 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_161608 ?auto_161607 ?auto_161605 )
      ( DELIVER-3PKG-VERIFY ?auto_161606 ?auto_161607 ?auto_161608 ?auto_161605 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_161641 - OBJ
      ?auto_161642 - OBJ
      ?auto_161643 - OBJ
      ?auto_161640 - LOCATION
    )
    :vars
    (
      ?auto_161644 - LOCATION
      ?auto_161645 - CITY
      ?auto_161646 - LOCATION
      ?auto_161647 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_161642 ?auto_161641 ) ) ( not ( = ?auto_161643 ?auto_161641 ) ) ( not ( = ?auto_161643 ?auto_161642 ) ) ( IN-CITY ?auto_161644 ?auto_161645 ) ( IN-CITY ?auto_161640 ?auto_161645 ) ( not ( = ?auto_161640 ?auto_161644 ) ) ( OBJ-AT ?auto_161642 ?auto_161640 ) ( OBJ-AT ?auto_161641 ?auto_161644 ) ( IN-CITY ?auto_161646 ?auto_161645 ) ( not ( = ?auto_161640 ?auto_161646 ) ) ( not ( = ?auto_161644 ?auto_161646 ) ) ( OBJ-AT ?auto_161643 ?auto_161646 ) ( TRUCK-AT ?auto_161647 ?auto_161640 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_161642 ?auto_161641 ?auto_161640 )
      ( DELIVER-3PKG-VERIFY ?auto_161641 ?auto_161642 ?auto_161643 ?auto_161640 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_161658 - OBJ
      ?auto_161659 - OBJ
      ?auto_161660 - OBJ
      ?auto_161657 - LOCATION
    )
    :vars
    (
      ?auto_161661 - LOCATION
      ?auto_161662 - CITY
      ?auto_161663 - LOCATION
      ?auto_161664 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_161659 ?auto_161658 ) ) ( not ( = ?auto_161660 ?auto_161658 ) ) ( not ( = ?auto_161660 ?auto_161659 ) ) ( IN-CITY ?auto_161661 ?auto_161662 ) ( IN-CITY ?auto_161657 ?auto_161662 ) ( not ( = ?auto_161657 ?auto_161661 ) ) ( OBJ-AT ?auto_161660 ?auto_161657 ) ( OBJ-AT ?auto_161658 ?auto_161661 ) ( IN-CITY ?auto_161663 ?auto_161662 ) ( not ( = ?auto_161657 ?auto_161663 ) ) ( not ( = ?auto_161661 ?auto_161663 ) ) ( OBJ-AT ?auto_161659 ?auto_161663 ) ( TRUCK-AT ?auto_161664 ?auto_161657 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_161660 ?auto_161658 ?auto_161657 )
      ( DELIVER-3PKG-VERIFY ?auto_161658 ?auto_161659 ?auto_161660 ?auto_161657 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_162327 - OBJ
      ?auto_162326 - LOCATION
    )
    :vars
    (
      ?auto_162329 - OBJ
      ?auto_162328 - LOCATION
      ?auto_162330 - CITY
      ?auto_162331 - OBJ
      ?auto_162332 - LOCATION
      ?auto_162333 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_162327 ?auto_162329 ) ) ( IN-CITY ?auto_162328 ?auto_162330 ) ( IN-CITY ?auto_162326 ?auto_162330 ) ( not ( = ?auto_162326 ?auto_162328 ) ) ( OBJ-AT ?auto_162327 ?auto_162328 ) ( not ( = ?auto_162331 ?auto_162329 ) ) ( not ( = ?auto_162327 ?auto_162331 ) ) ( IN-CITY ?auto_162332 ?auto_162330 ) ( not ( = ?auto_162326 ?auto_162332 ) ) ( not ( = ?auto_162328 ?auto_162332 ) ) ( OBJ-AT ?auto_162331 ?auto_162332 ) ( TRUCK-AT ?auto_162333 ?auto_162326 ) ( IN-TRUCK ?auto_162329 ?auto_162333 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_162329 ?auto_162326 )
      ( DELIVER-2PKG ?auto_162329 ?auto_162327 ?auto_162326 )
      ( DELIVER-1PKG-VERIFY ?auto_162327 ?auto_162326 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_162335 - OBJ
      ?auto_162336 - OBJ
      ?auto_162334 - LOCATION
    )
    :vars
    (
      ?auto_162338 - LOCATION
      ?auto_162337 - CITY
      ?auto_162339 - OBJ
      ?auto_162340 - LOCATION
      ?auto_162341 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_162336 ?auto_162335 ) ) ( IN-CITY ?auto_162338 ?auto_162337 ) ( IN-CITY ?auto_162334 ?auto_162337 ) ( not ( = ?auto_162334 ?auto_162338 ) ) ( OBJ-AT ?auto_162336 ?auto_162338 ) ( not ( = ?auto_162339 ?auto_162335 ) ) ( not ( = ?auto_162336 ?auto_162339 ) ) ( IN-CITY ?auto_162340 ?auto_162337 ) ( not ( = ?auto_162334 ?auto_162340 ) ) ( not ( = ?auto_162338 ?auto_162340 ) ) ( OBJ-AT ?auto_162339 ?auto_162340 ) ( TRUCK-AT ?auto_162341 ?auto_162334 ) ( IN-TRUCK ?auto_162335 ?auto_162341 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_162336 ?auto_162334 )
      ( DELIVER-2PKG-VERIFY ?auto_162335 ?auto_162336 ?auto_162334 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_162343 - OBJ
      ?auto_162344 - OBJ
      ?auto_162342 - LOCATION
    )
    :vars
    (
      ?auto_162347 - OBJ
      ?auto_162349 - LOCATION
      ?auto_162346 - CITY
      ?auto_162345 - LOCATION
      ?auto_162348 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_162344 ?auto_162343 ) ) ( not ( = ?auto_162344 ?auto_162347 ) ) ( IN-CITY ?auto_162349 ?auto_162346 ) ( IN-CITY ?auto_162342 ?auto_162346 ) ( not ( = ?auto_162342 ?auto_162349 ) ) ( OBJ-AT ?auto_162344 ?auto_162349 ) ( not ( = ?auto_162343 ?auto_162347 ) ) ( IN-CITY ?auto_162345 ?auto_162346 ) ( not ( = ?auto_162342 ?auto_162345 ) ) ( not ( = ?auto_162349 ?auto_162345 ) ) ( OBJ-AT ?auto_162343 ?auto_162345 ) ( TRUCK-AT ?auto_162348 ?auto_162342 ) ( IN-TRUCK ?auto_162347 ?auto_162348 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_162347 ?auto_162344 ?auto_162342 )
      ( DELIVER-2PKG-VERIFY ?auto_162343 ?auto_162344 ?auto_162342 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_162351 - OBJ
      ?auto_162352 - OBJ
      ?auto_162350 - LOCATION
    )
    :vars
    (
      ?auto_162357 - LOCATION
      ?auto_162355 - CITY
      ?auto_162354 - OBJ
      ?auto_162353 - LOCATION
      ?auto_162356 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_162352 ?auto_162351 ) ) ( IN-CITY ?auto_162357 ?auto_162355 ) ( IN-CITY ?auto_162350 ?auto_162355 ) ( not ( = ?auto_162350 ?auto_162357 ) ) ( OBJ-AT ?auto_162351 ?auto_162357 ) ( not ( = ?auto_162354 ?auto_162352 ) ) ( not ( = ?auto_162351 ?auto_162354 ) ) ( IN-CITY ?auto_162353 ?auto_162355 ) ( not ( = ?auto_162350 ?auto_162353 ) ) ( not ( = ?auto_162357 ?auto_162353 ) ) ( OBJ-AT ?auto_162354 ?auto_162353 ) ( TRUCK-AT ?auto_162356 ?auto_162350 ) ( IN-TRUCK ?auto_162352 ?auto_162356 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_162352 ?auto_162351 ?auto_162350 )
      ( DELIVER-2PKG-VERIFY ?auto_162351 ?auto_162352 ?auto_162350 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_162359 - OBJ
      ?auto_162360 - OBJ
      ?auto_162358 - LOCATION
    )
    :vars
    (
      ?auto_162363 - OBJ
      ?auto_162365 - LOCATION
      ?auto_162362 - CITY
      ?auto_162361 - LOCATION
      ?auto_162364 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_162360 ?auto_162359 ) ) ( not ( = ?auto_162359 ?auto_162363 ) ) ( IN-CITY ?auto_162365 ?auto_162362 ) ( IN-CITY ?auto_162358 ?auto_162362 ) ( not ( = ?auto_162358 ?auto_162365 ) ) ( OBJ-AT ?auto_162359 ?auto_162365 ) ( not ( = ?auto_162360 ?auto_162363 ) ) ( IN-CITY ?auto_162361 ?auto_162362 ) ( not ( = ?auto_162358 ?auto_162361 ) ) ( not ( = ?auto_162365 ?auto_162361 ) ) ( OBJ-AT ?auto_162360 ?auto_162361 ) ( TRUCK-AT ?auto_162364 ?auto_162358 ) ( IN-TRUCK ?auto_162363 ?auto_162364 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_162363 ?auto_162359 ?auto_162358 )
      ( DELIVER-2PKG-VERIFY ?auto_162359 ?auto_162360 ?auto_162358 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_162385 - OBJ
      ?auto_162386 - OBJ
      ?auto_162387 - OBJ
      ?auto_162384 - LOCATION
    )
    :vars
    (
      ?auto_162391 - LOCATION
      ?auto_162389 - CITY
      ?auto_162388 - LOCATION
      ?auto_162390 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_162386 ?auto_162385 ) ) ( not ( = ?auto_162387 ?auto_162385 ) ) ( not ( = ?auto_162387 ?auto_162386 ) ) ( IN-CITY ?auto_162391 ?auto_162389 ) ( IN-CITY ?auto_162384 ?auto_162389 ) ( not ( = ?auto_162384 ?auto_162391 ) ) ( OBJ-AT ?auto_162387 ?auto_162391 ) ( IN-CITY ?auto_162388 ?auto_162389 ) ( not ( = ?auto_162384 ?auto_162388 ) ) ( not ( = ?auto_162391 ?auto_162388 ) ) ( OBJ-AT ?auto_162386 ?auto_162388 ) ( TRUCK-AT ?auto_162390 ?auto_162384 ) ( IN-TRUCK ?auto_162385 ?auto_162390 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_162385 ?auto_162387 ?auto_162384 )
      ( DELIVER-3PKG-VERIFY ?auto_162385 ?auto_162386 ?auto_162387 ?auto_162384 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_162402 - OBJ
      ?auto_162403 - OBJ
      ?auto_162404 - OBJ
      ?auto_162401 - LOCATION
    )
    :vars
    (
      ?auto_162408 - LOCATION
      ?auto_162406 - CITY
      ?auto_162405 - LOCATION
      ?auto_162407 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_162403 ?auto_162402 ) ) ( not ( = ?auto_162404 ?auto_162402 ) ) ( not ( = ?auto_162404 ?auto_162403 ) ) ( IN-CITY ?auto_162408 ?auto_162406 ) ( IN-CITY ?auto_162401 ?auto_162406 ) ( not ( = ?auto_162401 ?auto_162408 ) ) ( OBJ-AT ?auto_162403 ?auto_162408 ) ( IN-CITY ?auto_162405 ?auto_162406 ) ( not ( = ?auto_162401 ?auto_162405 ) ) ( not ( = ?auto_162408 ?auto_162405 ) ) ( OBJ-AT ?auto_162404 ?auto_162405 ) ( TRUCK-AT ?auto_162407 ?auto_162401 ) ( IN-TRUCK ?auto_162402 ?auto_162407 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_162402 ?auto_162403 ?auto_162401 )
      ( DELIVER-3PKG-VERIFY ?auto_162402 ?auto_162403 ?auto_162404 ?auto_162401 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_162419 - OBJ
      ?auto_162420 - OBJ
      ?auto_162421 - OBJ
      ?auto_162418 - LOCATION
    )
    :vars
    (
      ?auto_162425 - LOCATION
      ?auto_162423 - CITY
      ?auto_162422 - LOCATION
      ?auto_162424 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_162420 ?auto_162419 ) ) ( not ( = ?auto_162421 ?auto_162419 ) ) ( not ( = ?auto_162421 ?auto_162420 ) ) ( IN-CITY ?auto_162425 ?auto_162423 ) ( IN-CITY ?auto_162418 ?auto_162423 ) ( not ( = ?auto_162418 ?auto_162425 ) ) ( OBJ-AT ?auto_162421 ?auto_162425 ) ( IN-CITY ?auto_162422 ?auto_162423 ) ( not ( = ?auto_162418 ?auto_162422 ) ) ( not ( = ?auto_162425 ?auto_162422 ) ) ( OBJ-AT ?auto_162419 ?auto_162422 ) ( TRUCK-AT ?auto_162424 ?auto_162418 ) ( IN-TRUCK ?auto_162420 ?auto_162424 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_162420 ?auto_162421 ?auto_162418 )
      ( DELIVER-3PKG-VERIFY ?auto_162419 ?auto_162420 ?auto_162421 ?auto_162418 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_162436 - OBJ
      ?auto_162437 - OBJ
      ?auto_162438 - OBJ
      ?auto_162435 - LOCATION
    )
    :vars
    (
      ?auto_162442 - LOCATION
      ?auto_162440 - CITY
      ?auto_162439 - LOCATION
      ?auto_162441 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_162437 ?auto_162436 ) ) ( not ( = ?auto_162438 ?auto_162436 ) ) ( not ( = ?auto_162438 ?auto_162437 ) ) ( IN-CITY ?auto_162442 ?auto_162440 ) ( IN-CITY ?auto_162435 ?auto_162440 ) ( not ( = ?auto_162435 ?auto_162442 ) ) ( OBJ-AT ?auto_162437 ?auto_162442 ) ( IN-CITY ?auto_162439 ?auto_162440 ) ( not ( = ?auto_162435 ?auto_162439 ) ) ( not ( = ?auto_162442 ?auto_162439 ) ) ( OBJ-AT ?auto_162436 ?auto_162439 ) ( TRUCK-AT ?auto_162441 ?auto_162435 ) ( IN-TRUCK ?auto_162438 ?auto_162441 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_162438 ?auto_162437 ?auto_162435 )
      ( DELIVER-3PKG-VERIFY ?auto_162436 ?auto_162437 ?auto_162438 ?auto_162435 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_162471 - OBJ
      ?auto_162472 - OBJ
      ?auto_162473 - OBJ
      ?auto_162470 - LOCATION
    )
    :vars
    (
      ?auto_162477 - LOCATION
      ?auto_162475 - CITY
      ?auto_162474 - LOCATION
      ?auto_162476 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_162472 ?auto_162471 ) ) ( not ( = ?auto_162473 ?auto_162471 ) ) ( not ( = ?auto_162473 ?auto_162472 ) ) ( IN-CITY ?auto_162477 ?auto_162475 ) ( IN-CITY ?auto_162470 ?auto_162475 ) ( not ( = ?auto_162470 ?auto_162477 ) ) ( OBJ-AT ?auto_162471 ?auto_162477 ) ( IN-CITY ?auto_162474 ?auto_162475 ) ( not ( = ?auto_162470 ?auto_162474 ) ) ( not ( = ?auto_162477 ?auto_162474 ) ) ( OBJ-AT ?auto_162473 ?auto_162474 ) ( TRUCK-AT ?auto_162476 ?auto_162470 ) ( IN-TRUCK ?auto_162472 ?auto_162476 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_162472 ?auto_162471 ?auto_162470 )
      ( DELIVER-3PKG-VERIFY ?auto_162471 ?auto_162472 ?auto_162473 ?auto_162470 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_162488 - OBJ
      ?auto_162489 - OBJ
      ?auto_162490 - OBJ
      ?auto_162487 - LOCATION
    )
    :vars
    (
      ?auto_162494 - LOCATION
      ?auto_162492 - CITY
      ?auto_162491 - LOCATION
      ?auto_162493 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_162489 ?auto_162488 ) ) ( not ( = ?auto_162490 ?auto_162488 ) ) ( not ( = ?auto_162490 ?auto_162489 ) ) ( IN-CITY ?auto_162494 ?auto_162492 ) ( IN-CITY ?auto_162487 ?auto_162492 ) ( not ( = ?auto_162487 ?auto_162494 ) ) ( OBJ-AT ?auto_162488 ?auto_162494 ) ( IN-CITY ?auto_162491 ?auto_162492 ) ( not ( = ?auto_162487 ?auto_162491 ) ) ( not ( = ?auto_162494 ?auto_162491 ) ) ( OBJ-AT ?auto_162489 ?auto_162491 ) ( TRUCK-AT ?auto_162493 ?auto_162487 ) ( IN-TRUCK ?auto_162490 ?auto_162493 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_162490 ?auto_162488 ?auto_162487 )
      ( DELIVER-3PKG-VERIFY ?auto_162488 ?auto_162489 ?auto_162490 ?auto_162487 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_163157 - OBJ
      ?auto_163156 - LOCATION
    )
    :vars
    (
      ?auto_163161 - OBJ
      ?auto_163163 - LOCATION
      ?auto_163160 - CITY
      ?auto_163159 - OBJ
      ?auto_163158 - LOCATION
      ?auto_163162 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_163157 ?auto_163161 ) ) ( IN-CITY ?auto_163163 ?auto_163160 ) ( IN-CITY ?auto_163156 ?auto_163160 ) ( not ( = ?auto_163156 ?auto_163163 ) ) ( OBJ-AT ?auto_163157 ?auto_163163 ) ( not ( = ?auto_163159 ?auto_163161 ) ) ( not ( = ?auto_163157 ?auto_163159 ) ) ( IN-CITY ?auto_163158 ?auto_163160 ) ( not ( = ?auto_163156 ?auto_163158 ) ) ( not ( = ?auto_163163 ?auto_163158 ) ) ( OBJ-AT ?auto_163159 ?auto_163158 ) ( IN-TRUCK ?auto_163161 ?auto_163162 ) ( TRUCK-AT ?auto_163162 ?auto_163163 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_163162 ?auto_163163 ?auto_163156 ?auto_163160 )
      ( DELIVER-2PKG ?auto_163161 ?auto_163157 ?auto_163156 )
      ( DELIVER-1PKG-VERIFY ?auto_163157 ?auto_163156 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_163165 - OBJ
      ?auto_163166 - OBJ
      ?auto_163164 - LOCATION
    )
    :vars
    (
      ?auto_163168 - LOCATION
      ?auto_163170 - CITY
      ?auto_163169 - OBJ
      ?auto_163167 - LOCATION
      ?auto_163171 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_163166 ?auto_163165 ) ) ( IN-CITY ?auto_163168 ?auto_163170 ) ( IN-CITY ?auto_163164 ?auto_163170 ) ( not ( = ?auto_163164 ?auto_163168 ) ) ( OBJ-AT ?auto_163166 ?auto_163168 ) ( not ( = ?auto_163169 ?auto_163165 ) ) ( not ( = ?auto_163166 ?auto_163169 ) ) ( IN-CITY ?auto_163167 ?auto_163170 ) ( not ( = ?auto_163164 ?auto_163167 ) ) ( not ( = ?auto_163168 ?auto_163167 ) ) ( OBJ-AT ?auto_163169 ?auto_163167 ) ( IN-TRUCK ?auto_163165 ?auto_163171 ) ( TRUCK-AT ?auto_163171 ?auto_163168 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_163166 ?auto_163164 )
      ( DELIVER-2PKG-VERIFY ?auto_163165 ?auto_163166 ?auto_163164 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_163173 - OBJ
      ?auto_163174 - OBJ
      ?auto_163172 - LOCATION
    )
    :vars
    (
      ?auto_163175 - OBJ
      ?auto_163176 - LOCATION
      ?auto_163177 - CITY
      ?auto_163178 - LOCATION
      ?auto_163179 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_163174 ?auto_163173 ) ) ( not ( = ?auto_163174 ?auto_163175 ) ) ( IN-CITY ?auto_163176 ?auto_163177 ) ( IN-CITY ?auto_163172 ?auto_163177 ) ( not ( = ?auto_163172 ?auto_163176 ) ) ( OBJ-AT ?auto_163174 ?auto_163176 ) ( not ( = ?auto_163173 ?auto_163175 ) ) ( IN-CITY ?auto_163178 ?auto_163177 ) ( not ( = ?auto_163172 ?auto_163178 ) ) ( not ( = ?auto_163176 ?auto_163178 ) ) ( OBJ-AT ?auto_163173 ?auto_163178 ) ( IN-TRUCK ?auto_163175 ?auto_163179 ) ( TRUCK-AT ?auto_163179 ?auto_163176 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_163175 ?auto_163174 ?auto_163172 )
      ( DELIVER-2PKG-VERIFY ?auto_163173 ?auto_163174 ?auto_163172 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_163181 - OBJ
      ?auto_163182 - OBJ
      ?auto_163180 - LOCATION
    )
    :vars
    (
      ?auto_163184 - LOCATION
      ?auto_163185 - CITY
      ?auto_163183 - OBJ
      ?auto_163186 - LOCATION
      ?auto_163187 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_163182 ?auto_163181 ) ) ( IN-CITY ?auto_163184 ?auto_163185 ) ( IN-CITY ?auto_163180 ?auto_163185 ) ( not ( = ?auto_163180 ?auto_163184 ) ) ( OBJ-AT ?auto_163181 ?auto_163184 ) ( not ( = ?auto_163183 ?auto_163182 ) ) ( not ( = ?auto_163181 ?auto_163183 ) ) ( IN-CITY ?auto_163186 ?auto_163185 ) ( not ( = ?auto_163180 ?auto_163186 ) ) ( not ( = ?auto_163184 ?auto_163186 ) ) ( OBJ-AT ?auto_163183 ?auto_163186 ) ( IN-TRUCK ?auto_163182 ?auto_163187 ) ( TRUCK-AT ?auto_163187 ?auto_163184 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_163182 ?auto_163181 ?auto_163180 )
      ( DELIVER-2PKG-VERIFY ?auto_163181 ?auto_163182 ?auto_163180 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_163189 - OBJ
      ?auto_163190 - OBJ
      ?auto_163188 - LOCATION
    )
    :vars
    (
      ?auto_163191 - OBJ
      ?auto_163192 - LOCATION
      ?auto_163193 - CITY
      ?auto_163194 - LOCATION
      ?auto_163195 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_163190 ?auto_163189 ) ) ( not ( = ?auto_163189 ?auto_163191 ) ) ( IN-CITY ?auto_163192 ?auto_163193 ) ( IN-CITY ?auto_163188 ?auto_163193 ) ( not ( = ?auto_163188 ?auto_163192 ) ) ( OBJ-AT ?auto_163189 ?auto_163192 ) ( not ( = ?auto_163190 ?auto_163191 ) ) ( IN-CITY ?auto_163194 ?auto_163193 ) ( not ( = ?auto_163188 ?auto_163194 ) ) ( not ( = ?auto_163192 ?auto_163194 ) ) ( OBJ-AT ?auto_163190 ?auto_163194 ) ( IN-TRUCK ?auto_163191 ?auto_163195 ) ( TRUCK-AT ?auto_163195 ?auto_163192 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_163191 ?auto_163189 ?auto_163188 )
      ( DELIVER-2PKG-VERIFY ?auto_163189 ?auto_163190 ?auto_163188 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_163215 - OBJ
      ?auto_163216 - OBJ
      ?auto_163217 - OBJ
      ?auto_163214 - LOCATION
    )
    :vars
    (
      ?auto_163218 - LOCATION
      ?auto_163219 - CITY
      ?auto_163220 - LOCATION
      ?auto_163221 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_163216 ?auto_163215 ) ) ( not ( = ?auto_163217 ?auto_163215 ) ) ( not ( = ?auto_163217 ?auto_163216 ) ) ( IN-CITY ?auto_163218 ?auto_163219 ) ( IN-CITY ?auto_163214 ?auto_163219 ) ( not ( = ?auto_163214 ?auto_163218 ) ) ( OBJ-AT ?auto_163217 ?auto_163218 ) ( IN-CITY ?auto_163220 ?auto_163219 ) ( not ( = ?auto_163214 ?auto_163220 ) ) ( not ( = ?auto_163218 ?auto_163220 ) ) ( OBJ-AT ?auto_163216 ?auto_163220 ) ( IN-TRUCK ?auto_163215 ?auto_163221 ) ( TRUCK-AT ?auto_163221 ?auto_163218 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_163215 ?auto_163217 ?auto_163214 )
      ( DELIVER-3PKG-VERIFY ?auto_163215 ?auto_163216 ?auto_163217 ?auto_163214 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_163232 - OBJ
      ?auto_163233 - OBJ
      ?auto_163234 - OBJ
      ?auto_163231 - LOCATION
    )
    :vars
    (
      ?auto_163235 - LOCATION
      ?auto_163236 - CITY
      ?auto_163237 - LOCATION
      ?auto_163238 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_163233 ?auto_163232 ) ) ( not ( = ?auto_163234 ?auto_163232 ) ) ( not ( = ?auto_163234 ?auto_163233 ) ) ( IN-CITY ?auto_163235 ?auto_163236 ) ( IN-CITY ?auto_163231 ?auto_163236 ) ( not ( = ?auto_163231 ?auto_163235 ) ) ( OBJ-AT ?auto_163233 ?auto_163235 ) ( IN-CITY ?auto_163237 ?auto_163236 ) ( not ( = ?auto_163231 ?auto_163237 ) ) ( not ( = ?auto_163235 ?auto_163237 ) ) ( OBJ-AT ?auto_163234 ?auto_163237 ) ( IN-TRUCK ?auto_163232 ?auto_163238 ) ( TRUCK-AT ?auto_163238 ?auto_163235 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_163232 ?auto_163233 ?auto_163231 )
      ( DELIVER-3PKG-VERIFY ?auto_163232 ?auto_163233 ?auto_163234 ?auto_163231 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_163249 - OBJ
      ?auto_163250 - OBJ
      ?auto_163251 - OBJ
      ?auto_163248 - LOCATION
    )
    :vars
    (
      ?auto_163252 - LOCATION
      ?auto_163253 - CITY
      ?auto_163254 - LOCATION
      ?auto_163255 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_163250 ?auto_163249 ) ) ( not ( = ?auto_163251 ?auto_163249 ) ) ( not ( = ?auto_163251 ?auto_163250 ) ) ( IN-CITY ?auto_163252 ?auto_163253 ) ( IN-CITY ?auto_163248 ?auto_163253 ) ( not ( = ?auto_163248 ?auto_163252 ) ) ( OBJ-AT ?auto_163251 ?auto_163252 ) ( IN-CITY ?auto_163254 ?auto_163253 ) ( not ( = ?auto_163248 ?auto_163254 ) ) ( not ( = ?auto_163252 ?auto_163254 ) ) ( OBJ-AT ?auto_163249 ?auto_163254 ) ( IN-TRUCK ?auto_163250 ?auto_163255 ) ( TRUCK-AT ?auto_163255 ?auto_163252 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_163250 ?auto_163251 ?auto_163248 )
      ( DELIVER-3PKG-VERIFY ?auto_163249 ?auto_163250 ?auto_163251 ?auto_163248 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_163266 - OBJ
      ?auto_163267 - OBJ
      ?auto_163268 - OBJ
      ?auto_163265 - LOCATION
    )
    :vars
    (
      ?auto_163269 - LOCATION
      ?auto_163270 - CITY
      ?auto_163271 - LOCATION
      ?auto_163272 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_163267 ?auto_163266 ) ) ( not ( = ?auto_163268 ?auto_163266 ) ) ( not ( = ?auto_163268 ?auto_163267 ) ) ( IN-CITY ?auto_163269 ?auto_163270 ) ( IN-CITY ?auto_163265 ?auto_163270 ) ( not ( = ?auto_163265 ?auto_163269 ) ) ( OBJ-AT ?auto_163267 ?auto_163269 ) ( IN-CITY ?auto_163271 ?auto_163270 ) ( not ( = ?auto_163265 ?auto_163271 ) ) ( not ( = ?auto_163269 ?auto_163271 ) ) ( OBJ-AT ?auto_163266 ?auto_163271 ) ( IN-TRUCK ?auto_163268 ?auto_163272 ) ( TRUCK-AT ?auto_163272 ?auto_163269 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_163268 ?auto_163267 ?auto_163265 )
      ( DELIVER-3PKG-VERIFY ?auto_163266 ?auto_163267 ?auto_163268 ?auto_163265 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_163301 - OBJ
      ?auto_163302 - OBJ
      ?auto_163303 - OBJ
      ?auto_163300 - LOCATION
    )
    :vars
    (
      ?auto_163304 - LOCATION
      ?auto_163305 - CITY
      ?auto_163306 - LOCATION
      ?auto_163307 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_163302 ?auto_163301 ) ) ( not ( = ?auto_163303 ?auto_163301 ) ) ( not ( = ?auto_163303 ?auto_163302 ) ) ( IN-CITY ?auto_163304 ?auto_163305 ) ( IN-CITY ?auto_163300 ?auto_163305 ) ( not ( = ?auto_163300 ?auto_163304 ) ) ( OBJ-AT ?auto_163301 ?auto_163304 ) ( IN-CITY ?auto_163306 ?auto_163305 ) ( not ( = ?auto_163300 ?auto_163306 ) ) ( not ( = ?auto_163304 ?auto_163306 ) ) ( OBJ-AT ?auto_163303 ?auto_163306 ) ( IN-TRUCK ?auto_163302 ?auto_163307 ) ( TRUCK-AT ?auto_163307 ?auto_163304 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_163302 ?auto_163301 ?auto_163300 )
      ( DELIVER-3PKG-VERIFY ?auto_163301 ?auto_163302 ?auto_163303 ?auto_163300 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_163318 - OBJ
      ?auto_163319 - OBJ
      ?auto_163320 - OBJ
      ?auto_163317 - LOCATION
    )
    :vars
    (
      ?auto_163321 - LOCATION
      ?auto_163322 - CITY
      ?auto_163323 - LOCATION
      ?auto_163324 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_163319 ?auto_163318 ) ) ( not ( = ?auto_163320 ?auto_163318 ) ) ( not ( = ?auto_163320 ?auto_163319 ) ) ( IN-CITY ?auto_163321 ?auto_163322 ) ( IN-CITY ?auto_163317 ?auto_163322 ) ( not ( = ?auto_163317 ?auto_163321 ) ) ( OBJ-AT ?auto_163318 ?auto_163321 ) ( IN-CITY ?auto_163323 ?auto_163322 ) ( not ( = ?auto_163317 ?auto_163323 ) ) ( not ( = ?auto_163321 ?auto_163323 ) ) ( OBJ-AT ?auto_163319 ?auto_163323 ) ( IN-TRUCK ?auto_163320 ?auto_163324 ) ( TRUCK-AT ?auto_163324 ?auto_163321 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_163320 ?auto_163318 ?auto_163317 )
      ( DELIVER-3PKG-VERIFY ?auto_163318 ?auto_163319 ?auto_163320 ?auto_163317 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_163987 - OBJ
      ?auto_163986 - LOCATION
    )
    :vars
    (
      ?auto_163988 - OBJ
      ?auto_163990 - LOCATION
      ?auto_163991 - CITY
      ?auto_163989 - OBJ
      ?auto_163992 - LOCATION
      ?auto_163993 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_163987 ?auto_163988 ) ) ( IN-CITY ?auto_163990 ?auto_163991 ) ( IN-CITY ?auto_163986 ?auto_163991 ) ( not ( = ?auto_163986 ?auto_163990 ) ) ( OBJ-AT ?auto_163987 ?auto_163990 ) ( not ( = ?auto_163989 ?auto_163988 ) ) ( not ( = ?auto_163987 ?auto_163989 ) ) ( IN-CITY ?auto_163992 ?auto_163991 ) ( not ( = ?auto_163986 ?auto_163992 ) ) ( not ( = ?auto_163990 ?auto_163992 ) ) ( OBJ-AT ?auto_163989 ?auto_163992 ) ( TRUCK-AT ?auto_163993 ?auto_163990 ) ( OBJ-AT ?auto_163988 ?auto_163990 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_163988 ?auto_163993 ?auto_163990 )
      ( DELIVER-2PKG ?auto_163988 ?auto_163987 ?auto_163986 )
      ( DELIVER-1PKG-VERIFY ?auto_163987 ?auto_163986 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_163995 - OBJ
      ?auto_163996 - OBJ
      ?auto_163994 - LOCATION
    )
    :vars
    (
      ?auto_163999 - LOCATION
      ?auto_164001 - CITY
      ?auto_163998 - OBJ
      ?auto_163997 - LOCATION
      ?auto_164000 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_163996 ?auto_163995 ) ) ( IN-CITY ?auto_163999 ?auto_164001 ) ( IN-CITY ?auto_163994 ?auto_164001 ) ( not ( = ?auto_163994 ?auto_163999 ) ) ( OBJ-AT ?auto_163996 ?auto_163999 ) ( not ( = ?auto_163998 ?auto_163995 ) ) ( not ( = ?auto_163996 ?auto_163998 ) ) ( IN-CITY ?auto_163997 ?auto_164001 ) ( not ( = ?auto_163994 ?auto_163997 ) ) ( not ( = ?auto_163999 ?auto_163997 ) ) ( OBJ-AT ?auto_163998 ?auto_163997 ) ( TRUCK-AT ?auto_164000 ?auto_163999 ) ( OBJ-AT ?auto_163995 ?auto_163999 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_163996 ?auto_163994 )
      ( DELIVER-2PKG-VERIFY ?auto_163995 ?auto_163996 ?auto_163994 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_164003 - OBJ
      ?auto_164004 - OBJ
      ?auto_164002 - LOCATION
    )
    :vars
    (
      ?auto_164007 - OBJ
      ?auto_164008 - LOCATION
      ?auto_164009 - CITY
      ?auto_164005 - LOCATION
      ?auto_164006 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_164004 ?auto_164003 ) ) ( not ( = ?auto_164004 ?auto_164007 ) ) ( IN-CITY ?auto_164008 ?auto_164009 ) ( IN-CITY ?auto_164002 ?auto_164009 ) ( not ( = ?auto_164002 ?auto_164008 ) ) ( OBJ-AT ?auto_164004 ?auto_164008 ) ( not ( = ?auto_164003 ?auto_164007 ) ) ( IN-CITY ?auto_164005 ?auto_164009 ) ( not ( = ?auto_164002 ?auto_164005 ) ) ( not ( = ?auto_164008 ?auto_164005 ) ) ( OBJ-AT ?auto_164003 ?auto_164005 ) ( TRUCK-AT ?auto_164006 ?auto_164008 ) ( OBJ-AT ?auto_164007 ?auto_164008 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_164007 ?auto_164004 ?auto_164002 )
      ( DELIVER-2PKG-VERIFY ?auto_164003 ?auto_164004 ?auto_164002 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_164011 - OBJ
      ?auto_164012 - OBJ
      ?auto_164010 - LOCATION
    )
    :vars
    (
      ?auto_164016 - LOCATION
      ?auto_164017 - CITY
      ?auto_164013 - OBJ
      ?auto_164014 - LOCATION
      ?auto_164015 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_164012 ?auto_164011 ) ) ( IN-CITY ?auto_164016 ?auto_164017 ) ( IN-CITY ?auto_164010 ?auto_164017 ) ( not ( = ?auto_164010 ?auto_164016 ) ) ( OBJ-AT ?auto_164011 ?auto_164016 ) ( not ( = ?auto_164013 ?auto_164012 ) ) ( not ( = ?auto_164011 ?auto_164013 ) ) ( IN-CITY ?auto_164014 ?auto_164017 ) ( not ( = ?auto_164010 ?auto_164014 ) ) ( not ( = ?auto_164016 ?auto_164014 ) ) ( OBJ-AT ?auto_164013 ?auto_164014 ) ( TRUCK-AT ?auto_164015 ?auto_164016 ) ( OBJ-AT ?auto_164012 ?auto_164016 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_164012 ?auto_164011 ?auto_164010 )
      ( DELIVER-2PKG-VERIFY ?auto_164011 ?auto_164012 ?auto_164010 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_164019 - OBJ
      ?auto_164020 - OBJ
      ?auto_164018 - LOCATION
    )
    :vars
    (
      ?auto_164023 - OBJ
      ?auto_164024 - LOCATION
      ?auto_164025 - CITY
      ?auto_164021 - LOCATION
      ?auto_164022 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_164020 ?auto_164019 ) ) ( not ( = ?auto_164019 ?auto_164023 ) ) ( IN-CITY ?auto_164024 ?auto_164025 ) ( IN-CITY ?auto_164018 ?auto_164025 ) ( not ( = ?auto_164018 ?auto_164024 ) ) ( OBJ-AT ?auto_164019 ?auto_164024 ) ( not ( = ?auto_164020 ?auto_164023 ) ) ( IN-CITY ?auto_164021 ?auto_164025 ) ( not ( = ?auto_164018 ?auto_164021 ) ) ( not ( = ?auto_164024 ?auto_164021 ) ) ( OBJ-AT ?auto_164020 ?auto_164021 ) ( TRUCK-AT ?auto_164022 ?auto_164024 ) ( OBJ-AT ?auto_164023 ?auto_164024 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_164023 ?auto_164019 ?auto_164018 )
      ( DELIVER-2PKG-VERIFY ?auto_164019 ?auto_164020 ?auto_164018 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_164045 - OBJ
      ?auto_164046 - OBJ
      ?auto_164047 - OBJ
      ?auto_164044 - LOCATION
    )
    :vars
    (
      ?auto_164050 - LOCATION
      ?auto_164051 - CITY
      ?auto_164048 - LOCATION
      ?auto_164049 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_164046 ?auto_164045 ) ) ( not ( = ?auto_164047 ?auto_164045 ) ) ( not ( = ?auto_164047 ?auto_164046 ) ) ( IN-CITY ?auto_164050 ?auto_164051 ) ( IN-CITY ?auto_164044 ?auto_164051 ) ( not ( = ?auto_164044 ?auto_164050 ) ) ( OBJ-AT ?auto_164047 ?auto_164050 ) ( IN-CITY ?auto_164048 ?auto_164051 ) ( not ( = ?auto_164044 ?auto_164048 ) ) ( not ( = ?auto_164050 ?auto_164048 ) ) ( OBJ-AT ?auto_164046 ?auto_164048 ) ( TRUCK-AT ?auto_164049 ?auto_164050 ) ( OBJ-AT ?auto_164045 ?auto_164050 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_164045 ?auto_164047 ?auto_164044 )
      ( DELIVER-3PKG-VERIFY ?auto_164045 ?auto_164046 ?auto_164047 ?auto_164044 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_164062 - OBJ
      ?auto_164063 - OBJ
      ?auto_164064 - OBJ
      ?auto_164061 - LOCATION
    )
    :vars
    (
      ?auto_164067 - LOCATION
      ?auto_164068 - CITY
      ?auto_164065 - LOCATION
      ?auto_164066 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_164063 ?auto_164062 ) ) ( not ( = ?auto_164064 ?auto_164062 ) ) ( not ( = ?auto_164064 ?auto_164063 ) ) ( IN-CITY ?auto_164067 ?auto_164068 ) ( IN-CITY ?auto_164061 ?auto_164068 ) ( not ( = ?auto_164061 ?auto_164067 ) ) ( OBJ-AT ?auto_164063 ?auto_164067 ) ( IN-CITY ?auto_164065 ?auto_164068 ) ( not ( = ?auto_164061 ?auto_164065 ) ) ( not ( = ?auto_164067 ?auto_164065 ) ) ( OBJ-AT ?auto_164064 ?auto_164065 ) ( TRUCK-AT ?auto_164066 ?auto_164067 ) ( OBJ-AT ?auto_164062 ?auto_164067 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_164062 ?auto_164063 ?auto_164061 )
      ( DELIVER-3PKG-VERIFY ?auto_164062 ?auto_164063 ?auto_164064 ?auto_164061 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_164079 - OBJ
      ?auto_164080 - OBJ
      ?auto_164081 - OBJ
      ?auto_164078 - LOCATION
    )
    :vars
    (
      ?auto_164084 - LOCATION
      ?auto_164085 - CITY
      ?auto_164082 - LOCATION
      ?auto_164083 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_164080 ?auto_164079 ) ) ( not ( = ?auto_164081 ?auto_164079 ) ) ( not ( = ?auto_164081 ?auto_164080 ) ) ( IN-CITY ?auto_164084 ?auto_164085 ) ( IN-CITY ?auto_164078 ?auto_164085 ) ( not ( = ?auto_164078 ?auto_164084 ) ) ( OBJ-AT ?auto_164081 ?auto_164084 ) ( IN-CITY ?auto_164082 ?auto_164085 ) ( not ( = ?auto_164078 ?auto_164082 ) ) ( not ( = ?auto_164084 ?auto_164082 ) ) ( OBJ-AT ?auto_164079 ?auto_164082 ) ( TRUCK-AT ?auto_164083 ?auto_164084 ) ( OBJ-AT ?auto_164080 ?auto_164084 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_164080 ?auto_164081 ?auto_164078 )
      ( DELIVER-3PKG-VERIFY ?auto_164079 ?auto_164080 ?auto_164081 ?auto_164078 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_164096 - OBJ
      ?auto_164097 - OBJ
      ?auto_164098 - OBJ
      ?auto_164095 - LOCATION
    )
    :vars
    (
      ?auto_164101 - LOCATION
      ?auto_164102 - CITY
      ?auto_164099 - LOCATION
      ?auto_164100 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_164097 ?auto_164096 ) ) ( not ( = ?auto_164098 ?auto_164096 ) ) ( not ( = ?auto_164098 ?auto_164097 ) ) ( IN-CITY ?auto_164101 ?auto_164102 ) ( IN-CITY ?auto_164095 ?auto_164102 ) ( not ( = ?auto_164095 ?auto_164101 ) ) ( OBJ-AT ?auto_164097 ?auto_164101 ) ( IN-CITY ?auto_164099 ?auto_164102 ) ( not ( = ?auto_164095 ?auto_164099 ) ) ( not ( = ?auto_164101 ?auto_164099 ) ) ( OBJ-AT ?auto_164096 ?auto_164099 ) ( TRUCK-AT ?auto_164100 ?auto_164101 ) ( OBJ-AT ?auto_164098 ?auto_164101 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_164098 ?auto_164097 ?auto_164095 )
      ( DELIVER-3PKG-VERIFY ?auto_164096 ?auto_164097 ?auto_164098 ?auto_164095 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_164131 - OBJ
      ?auto_164132 - OBJ
      ?auto_164133 - OBJ
      ?auto_164130 - LOCATION
    )
    :vars
    (
      ?auto_164136 - LOCATION
      ?auto_164137 - CITY
      ?auto_164134 - LOCATION
      ?auto_164135 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_164132 ?auto_164131 ) ) ( not ( = ?auto_164133 ?auto_164131 ) ) ( not ( = ?auto_164133 ?auto_164132 ) ) ( IN-CITY ?auto_164136 ?auto_164137 ) ( IN-CITY ?auto_164130 ?auto_164137 ) ( not ( = ?auto_164130 ?auto_164136 ) ) ( OBJ-AT ?auto_164131 ?auto_164136 ) ( IN-CITY ?auto_164134 ?auto_164137 ) ( not ( = ?auto_164130 ?auto_164134 ) ) ( not ( = ?auto_164136 ?auto_164134 ) ) ( OBJ-AT ?auto_164133 ?auto_164134 ) ( TRUCK-AT ?auto_164135 ?auto_164136 ) ( OBJ-AT ?auto_164132 ?auto_164136 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_164132 ?auto_164131 ?auto_164130 )
      ( DELIVER-3PKG-VERIFY ?auto_164131 ?auto_164132 ?auto_164133 ?auto_164130 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_164148 - OBJ
      ?auto_164149 - OBJ
      ?auto_164150 - OBJ
      ?auto_164147 - LOCATION
    )
    :vars
    (
      ?auto_164153 - LOCATION
      ?auto_164154 - CITY
      ?auto_164151 - LOCATION
      ?auto_164152 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_164149 ?auto_164148 ) ) ( not ( = ?auto_164150 ?auto_164148 ) ) ( not ( = ?auto_164150 ?auto_164149 ) ) ( IN-CITY ?auto_164153 ?auto_164154 ) ( IN-CITY ?auto_164147 ?auto_164154 ) ( not ( = ?auto_164147 ?auto_164153 ) ) ( OBJ-AT ?auto_164148 ?auto_164153 ) ( IN-CITY ?auto_164151 ?auto_164154 ) ( not ( = ?auto_164147 ?auto_164151 ) ) ( not ( = ?auto_164153 ?auto_164151 ) ) ( OBJ-AT ?auto_164149 ?auto_164151 ) ( TRUCK-AT ?auto_164152 ?auto_164153 ) ( OBJ-AT ?auto_164150 ?auto_164153 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_164150 ?auto_164148 ?auto_164147 )
      ( DELIVER-3PKG-VERIFY ?auto_164148 ?auto_164149 ?auto_164150 ?auto_164147 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_164817 - OBJ
      ?auto_164816 - LOCATION
    )
    :vars
    (
      ?auto_164821 - OBJ
      ?auto_164822 - LOCATION
      ?auto_164823 - CITY
      ?auto_164818 - OBJ
      ?auto_164819 - LOCATION
      ?auto_164820 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_164817 ?auto_164821 ) ) ( IN-CITY ?auto_164822 ?auto_164823 ) ( IN-CITY ?auto_164816 ?auto_164823 ) ( not ( = ?auto_164816 ?auto_164822 ) ) ( OBJ-AT ?auto_164817 ?auto_164822 ) ( not ( = ?auto_164818 ?auto_164821 ) ) ( not ( = ?auto_164817 ?auto_164818 ) ) ( IN-CITY ?auto_164819 ?auto_164823 ) ( not ( = ?auto_164816 ?auto_164819 ) ) ( not ( = ?auto_164822 ?auto_164819 ) ) ( OBJ-AT ?auto_164818 ?auto_164819 ) ( OBJ-AT ?auto_164821 ?auto_164822 ) ( TRUCK-AT ?auto_164820 ?auto_164816 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_164820 ?auto_164816 ?auto_164822 ?auto_164823 )
      ( DELIVER-2PKG ?auto_164821 ?auto_164817 ?auto_164816 )
      ( DELIVER-1PKG-VERIFY ?auto_164817 ?auto_164816 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_164825 - OBJ
      ?auto_164826 - OBJ
      ?auto_164824 - LOCATION
    )
    :vars
    (
      ?auto_164831 - LOCATION
      ?auto_164827 - CITY
      ?auto_164830 - OBJ
      ?auto_164829 - LOCATION
      ?auto_164828 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_164826 ?auto_164825 ) ) ( IN-CITY ?auto_164831 ?auto_164827 ) ( IN-CITY ?auto_164824 ?auto_164827 ) ( not ( = ?auto_164824 ?auto_164831 ) ) ( OBJ-AT ?auto_164826 ?auto_164831 ) ( not ( = ?auto_164830 ?auto_164825 ) ) ( not ( = ?auto_164826 ?auto_164830 ) ) ( IN-CITY ?auto_164829 ?auto_164827 ) ( not ( = ?auto_164824 ?auto_164829 ) ) ( not ( = ?auto_164831 ?auto_164829 ) ) ( OBJ-AT ?auto_164830 ?auto_164829 ) ( OBJ-AT ?auto_164825 ?auto_164831 ) ( TRUCK-AT ?auto_164828 ?auto_164824 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_164826 ?auto_164824 )
      ( DELIVER-2PKG-VERIFY ?auto_164825 ?auto_164826 ?auto_164824 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_164833 - OBJ
      ?auto_164834 - OBJ
      ?auto_164832 - LOCATION
    )
    :vars
    (
      ?auto_164835 - OBJ
      ?auto_164837 - LOCATION
      ?auto_164836 - CITY
      ?auto_164838 - LOCATION
      ?auto_164839 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_164834 ?auto_164833 ) ) ( not ( = ?auto_164834 ?auto_164835 ) ) ( IN-CITY ?auto_164837 ?auto_164836 ) ( IN-CITY ?auto_164832 ?auto_164836 ) ( not ( = ?auto_164832 ?auto_164837 ) ) ( OBJ-AT ?auto_164834 ?auto_164837 ) ( not ( = ?auto_164833 ?auto_164835 ) ) ( IN-CITY ?auto_164838 ?auto_164836 ) ( not ( = ?auto_164832 ?auto_164838 ) ) ( not ( = ?auto_164837 ?auto_164838 ) ) ( OBJ-AT ?auto_164833 ?auto_164838 ) ( OBJ-AT ?auto_164835 ?auto_164837 ) ( TRUCK-AT ?auto_164839 ?auto_164832 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_164835 ?auto_164834 ?auto_164832 )
      ( DELIVER-2PKG-VERIFY ?auto_164833 ?auto_164834 ?auto_164832 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_164841 - OBJ
      ?auto_164842 - OBJ
      ?auto_164840 - LOCATION
    )
    :vars
    (
      ?auto_164844 - LOCATION
      ?auto_164843 - CITY
      ?auto_164846 - OBJ
      ?auto_164845 - LOCATION
      ?auto_164847 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_164842 ?auto_164841 ) ) ( IN-CITY ?auto_164844 ?auto_164843 ) ( IN-CITY ?auto_164840 ?auto_164843 ) ( not ( = ?auto_164840 ?auto_164844 ) ) ( OBJ-AT ?auto_164841 ?auto_164844 ) ( not ( = ?auto_164846 ?auto_164842 ) ) ( not ( = ?auto_164841 ?auto_164846 ) ) ( IN-CITY ?auto_164845 ?auto_164843 ) ( not ( = ?auto_164840 ?auto_164845 ) ) ( not ( = ?auto_164844 ?auto_164845 ) ) ( OBJ-AT ?auto_164846 ?auto_164845 ) ( OBJ-AT ?auto_164842 ?auto_164844 ) ( TRUCK-AT ?auto_164847 ?auto_164840 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_164842 ?auto_164841 ?auto_164840 )
      ( DELIVER-2PKG-VERIFY ?auto_164841 ?auto_164842 ?auto_164840 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_164849 - OBJ
      ?auto_164850 - OBJ
      ?auto_164848 - LOCATION
    )
    :vars
    (
      ?auto_164851 - OBJ
      ?auto_164853 - LOCATION
      ?auto_164852 - CITY
      ?auto_164854 - LOCATION
      ?auto_164855 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_164850 ?auto_164849 ) ) ( not ( = ?auto_164849 ?auto_164851 ) ) ( IN-CITY ?auto_164853 ?auto_164852 ) ( IN-CITY ?auto_164848 ?auto_164852 ) ( not ( = ?auto_164848 ?auto_164853 ) ) ( OBJ-AT ?auto_164849 ?auto_164853 ) ( not ( = ?auto_164850 ?auto_164851 ) ) ( IN-CITY ?auto_164854 ?auto_164852 ) ( not ( = ?auto_164848 ?auto_164854 ) ) ( not ( = ?auto_164853 ?auto_164854 ) ) ( OBJ-AT ?auto_164850 ?auto_164854 ) ( OBJ-AT ?auto_164851 ?auto_164853 ) ( TRUCK-AT ?auto_164855 ?auto_164848 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_164851 ?auto_164849 ?auto_164848 )
      ( DELIVER-2PKG-VERIFY ?auto_164849 ?auto_164850 ?auto_164848 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_164875 - OBJ
      ?auto_164876 - OBJ
      ?auto_164877 - OBJ
      ?auto_164874 - LOCATION
    )
    :vars
    (
      ?auto_164879 - LOCATION
      ?auto_164878 - CITY
      ?auto_164880 - LOCATION
      ?auto_164881 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_164876 ?auto_164875 ) ) ( not ( = ?auto_164877 ?auto_164875 ) ) ( not ( = ?auto_164877 ?auto_164876 ) ) ( IN-CITY ?auto_164879 ?auto_164878 ) ( IN-CITY ?auto_164874 ?auto_164878 ) ( not ( = ?auto_164874 ?auto_164879 ) ) ( OBJ-AT ?auto_164877 ?auto_164879 ) ( IN-CITY ?auto_164880 ?auto_164878 ) ( not ( = ?auto_164874 ?auto_164880 ) ) ( not ( = ?auto_164879 ?auto_164880 ) ) ( OBJ-AT ?auto_164876 ?auto_164880 ) ( OBJ-AT ?auto_164875 ?auto_164879 ) ( TRUCK-AT ?auto_164881 ?auto_164874 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_164875 ?auto_164877 ?auto_164874 )
      ( DELIVER-3PKG-VERIFY ?auto_164875 ?auto_164876 ?auto_164877 ?auto_164874 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_164892 - OBJ
      ?auto_164893 - OBJ
      ?auto_164894 - OBJ
      ?auto_164891 - LOCATION
    )
    :vars
    (
      ?auto_164896 - LOCATION
      ?auto_164895 - CITY
      ?auto_164897 - LOCATION
      ?auto_164898 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_164893 ?auto_164892 ) ) ( not ( = ?auto_164894 ?auto_164892 ) ) ( not ( = ?auto_164894 ?auto_164893 ) ) ( IN-CITY ?auto_164896 ?auto_164895 ) ( IN-CITY ?auto_164891 ?auto_164895 ) ( not ( = ?auto_164891 ?auto_164896 ) ) ( OBJ-AT ?auto_164893 ?auto_164896 ) ( IN-CITY ?auto_164897 ?auto_164895 ) ( not ( = ?auto_164891 ?auto_164897 ) ) ( not ( = ?auto_164896 ?auto_164897 ) ) ( OBJ-AT ?auto_164894 ?auto_164897 ) ( OBJ-AT ?auto_164892 ?auto_164896 ) ( TRUCK-AT ?auto_164898 ?auto_164891 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_164892 ?auto_164893 ?auto_164891 )
      ( DELIVER-3PKG-VERIFY ?auto_164892 ?auto_164893 ?auto_164894 ?auto_164891 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_164909 - OBJ
      ?auto_164910 - OBJ
      ?auto_164911 - OBJ
      ?auto_164908 - LOCATION
    )
    :vars
    (
      ?auto_164913 - LOCATION
      ?auto_164912 - CITY
      ?auto_164914 - LOCATION
      ?auto_164915 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_164910 ?auto_164909 ) ) ( not ( = ?auto_164911 ?auto_164909 ) ) ( not ( = ?auto_164911 ?auto_164910 ) ) ( IN-CITY ?auto_164913 ?auto_164912 ) ( IN-CITY ?auto_164908 ?auto_164912 ) ( not ( = ?auto_164908 ?auto_164913 ) ) ( OBJ-AT ?auto_164911 ?auto_164913 ) ( IN-CITY ?auto_164914 ?auto_164912 ) ( not ( = ?auto_164908 ?auto_164914 ) ) ( not ( = ?auto_164913 ?auto_164914 ) ) ( OBJ-AT ?auto_164909 ?auto_164914 ) ( OBJ-AT ?auto_164910 ?auto_164913 ) ( TRUCK-AT ?auto_164915 ?auto_164908 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_164910 ?auto_164911 ?auto_164908 )
      ( DELIVER-3PKG-VERIFY ?auto_164909 ?auto_164910 ?auto_164911 ?auto_164908 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_164926 - OBJ
      ?auto_164927 - OBJ
      ?auto_164928 - OBJ
      ?auto_164925 - LOCATION
    )
    :vars
    (
      ?auto_164930 - LOCATION
      ?auto_164929 - CITY
      ?auto_164931 - LOCATION
      ?auto_164932 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_164927 ?auto_164926 ) ) ( not ( = ?auto_164928 ?auto_164926 ) ) ( not ( = ?auto_164928 ?auto_164927 ) ) ( IN-CITY ?auto_164930 ?auto_164929 ) ( IN-CITY ?auto_164925 ?auto_164929 ) ( not ( = ?auto_164925 ?auto_164930 ) ) ( OBJ-AT ?auto_164927 ?auto_164930 ) ( IN-CITY ?auto_164931 ?auto_164929 ) ( not ( = ?auto_164925 ?auto_164931 ) ) ( not ( = ?auto_164930 ?auto_164931 ) ) ( OBJ-AT ?auto_164926 ?auto_164931 ) ( OBJ-AT ?auto_164928 ?auto_164930 ) ( TRUCK-AT ?auto_164932 ?auto_164925 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_164928 ?auto_164927 ?auto_164925 )
      ( DELIVER-3PKG-VERIFY ?auto_164926 ?auto_164927 ?auto_164928 ?auto_164925 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_164961 - OBJ
      ?auto_164962 - OBJ
      ?auto_164963 - OBJ
      ?auto_164960 - LOCATION
    )
    :vars
    (
      ?auto_164965 - LOCATION
      ?auto_164964 - CITY
      ?auto_164966 - LOCATION
      ?auto_164967 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_164962 ?auto_164961 ) ) ( not ( = ?auto_164963 ?auto_164961 ) ) ( not ( = ?auto_164963 ?auto_164962 ) ) ( IN-CITY ?auto_164965 ?auto_164964 ) ( IN-CITY ?auto_164960 ?auto_164964 ) ( not ( = ?auto_164960 ?auto_164965 ) ) ( OBJ-AT ?auto_164961 ?auto_164965 ) ( IN-CITY ?auto_164966 ?auto_164964 ) ( not ( = ?auto_164960 ?auto_164966 ) ) ( not ( = ?auto_164965 ?auto_164966 ) ) ( OBJ-AT ?auto_164963 ?auto_164966 ) ( OBJ-AT ?auto_164962 ?auto_164965 ) ( TRUCK-AT ?auto_164967 ?auto_164960 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_164962 ?auto_164961 ?auto_164960 )
      ( DELIVER-3PKG-VERIFY ?auto_164961 ?auto_164962 ?auto_164963 ?auto_164960 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_164978 - OBJ
      ?auto_164979 - OBJ
      ?auto_164980 - OBJ
      ?auto_164977 - LOCATION
    )
    :vars
    (
      ?auto_164982 - LOCATION
      ?auto_164981 - CITY
      ?auto_164983 - LOCATION
      ?auto_164984 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_164979 ?auto_164978 ) ) ( not ( = ?auto_164980 ?auto_164978 ) ) ( not ( = ?auto_164980 ?auto_164979 ) ) ( IN-CITY ?auto_164982 ?auto_164981 ) ( IN-CITY ?auto_164977 ?auto_164981 ) ( not ( = ?auto_164977 ?auto_164982 ) ) ( OBJ-AT ?auto_164978 ?auto_164982 ) ( IN-CITY ?auto_164983 ?auto_164981 ) ( not ( = ?auto_164977 ?auto_164983 ) ) ( not ( = ?auto_164982 ?auto_164983 ) ) ( OBJ-AT ?auto_164979 ?auto_164983 ) ( OBJ-AT ?auto_164980 ?auto_164982 ) ( TRUCK-AT ?auto_164984 ?auto_164977 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_164980 ?auto_164978 ?auto_164977 )
      ( DELIVER-3PKG-VERIFY ?auto_164978 ?auto_164979 ?auto_164980 ?auto_164977 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_166693 - OBJ
      ?auto_166692 - LOCATION
    )
    :vars
    (
      ?auto_166694 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_166694 ?auto_166692 ) ( IN-TRUCK ?auto_166693 ?auto_166694 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_166693 ?auto_166694 ?auto_166692 )
      ( DELIVER-1PKG-VERIFY ?auto_166693 ?auto_166692 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_166696 - OBJ
      ?auto_166697 - OBJ
      ?auto_166695 - LOCATION
    )
    :vars
    (
      ?auto_166698 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166697 ?auto_166696 ) ) ( TRUCK-AT ?auto_166698 ?auto_166695 ) ( IN-TRUCK ?auto_166697 ?auto_166698 ) ( OBJ-AT ?auto_166696 ?auto_166695 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166697 ?auto_166695 )
      ( DELIVER-2PKG-VERIFY ?auto_166696 ?auto_166697 ?auto_166695 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_166700 - OBJ
      ?auto_166701 - OBJ
      ?auto_166699 - LOCATION
    )
    :vars
    (
      ?auto_166702 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166701 ?auto_166700 ) ) ( TRUCK-AT ?auto_166702 ?auto_166699 ) ( IN-TRUCK ?auto_166701 ?auto_166702 ) ( OBJ-AT ?auto_166700 ?auto_166699 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166701 ?auto_166699 )
      ( DELIVER-2PKG-VERIFY ?auto_166700 ?auto_166701 ?auto_166699 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_166704 - OBJ
      ?auto_166705 - OBJ
      ?auto_166703 - LOCATION
    )
    :vars
    (
      ?auto_166706 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166705 ?auto_166704 ) ) ( TRUCK-AT ?auto_166706 ?auto_166703 ) ( IN-TRUCK ?auto_166705 ?auto_166706 ) ( OBJ-AT ?auto_166704 ?auto_166703 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166705 ?auto_166703 )
      ( DELIVER-2PKG-VERIFY ?auto_166704 ?auto_166705 ?auto_166703 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_166708 - OBJ
      ?auto_166709 - OBJ
      ?auto_166707 - LOCATION
    )
    :vars
    (
      ?auto_166710 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166709 ?auto_166708 ) ) ( TRUCK-AT ?auto_166710 ?auto_166707 ) ( IN-TRUCK ?auto_166708 ?auto_166710 ) ( OBJ-AT ?auto_166709 ?auto_166707 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166708 ?auto_166707 )
      ( DELIVER-2PKG-VERIFY ?auto_166708 ?auto_166709 ?auto_166707 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_166712 - OBJ
      ?auto_166713 - OBJ
      ?auto_166711 - LOCATION
    )
    :vars
    (
      ?auto_166714 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166713 ?auto_166712 ) ) ( TRUCK-AT ?auto_166714 ?auto_166711 ) ( IN-TRUCK ?auto_166712 ?auto_166714 ) ( OBJ-AT ?auto_166713 ?auto_166711 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166712 ?auto_166711 )
      ( DELIVER-2PKG-VERIFY ?auto_166712 ?auto_166713 ?auto_166711 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_166716 - OBJ
      ?auto_166717 - OBJ
      ?auto_166715 - LOCATION
    )
    :vars
    (
      ?auto_166718 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166717 ?auto_166716 ) ) ( TRUCK-AT ?auto_166718 ?auto_166715 ) ( IN-TRUCK ?auto_166716 ?auto_166718 ) ( OBJ-AT ?auto_166717 ?auto_166715 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166716 ?auto_166715 )
      ( DELIVER-2PKG-VERIFY ?auto_166716 ?auto_166717 ?auto_166715 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_166729 - OBJ
      ?auto_166730 - OBJ
      ?auto_166731 - OBJ
      ?auto_166728 - LOCATION
    )
    :vars
    (
      ?auto_166732 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166730 ?auto_166729 ) ) ( not ( = ?auto_166731 ?auto_166729 ) ) ( not ( = ?auto_166731 ?auto_166730 ) ) ( TRUCK-AT ?auto_166732 ?auto_166728 ) ( IN-TRUCK ?auto_166731 ?auto_166732 ) ( OBJ-AT ?auto_166729 ?auto_166728 ) ( OBJ-AT ?auto_166730 ?auto_166728 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166731 ?auto_166728 )
      ( DELIVER-3PKG-VERIFY ?auto_166729 ?auto_166730 ?auto_166731 ?auto_166728 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_166734 - OBJ
      ?auto_166735 - OBJ
      ?auto_166736 - OBJ
      ?auto_166733 - LOCATION
    )
    :vars
    (
      ?auto_166737 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166735 ?auto_166734 ) ) ( not ( = ?auto_166736 ?auto_166734 ) ) ( not ( = ?auto_166736 ?auto_166735 ) ) ( TRUCK-AT ?auto_166737 ?auto_166733 ) ( IN-TRUCK ?auto_166736 ?auto_166737 ) ( OBJ-AT ?auto_166734 ?auto_166733 ) ( OBJ-AT ?auto_166735 ?auto_166733 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166736 ?auto_166733 )
      ( DELIVER-3PKG-VERIFY ?auto_166734 ?auto_166735 ?auto_166736 ?auto_166733 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_166744 - OBJ
      ?auto_166745 - OBJ
      ?auto_166746 - OBJ
      ?auto_166743 - LOCATION
    )
    :vars
    (
      ?auto_166747 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166745 ?auto_166744 ) ) ( not ( = ?auto_166746 ?auto_166744 ) ) ( not ( = ?auto_166746 ?auto_166745 ) ) ( TRUCK-AT ?auto_166747 ?auto_166743 ) ( IN-TRUCK ?auto_166745 ?auto_166747 ) ( OBJ-AT ?auto_166744 ?auto_166743 ) ( OBJ-AT ?auto_166746 ?auto_166743 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166745 ?auto_166743 )
      ( DELIVER-3PKG-VERIFY ?auto_166744 ?auto_166745 ?auto_166746 ?auto_166743 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_166749 - OBJ
      ?auto_166750 - OBJ
      ?auto_166751 - OBJ
      ?auto_166748 - LOCATION
    )
    :vars
    (
      ?auto_166752 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166750 ?auto_166749 ) ) ( not ( = ?auto_166751 ?auto_166749 ) ) ( not ( = ?auto_166751 ?auto_166750 ) ) ( TRUCK-AT ?auto_166752 ?auto_166748 ) ( IN-TRUCK ?auto_166750 ?auto_166752 ) ( OBJ-AT ?auto_166749 ?auto_166748 ) ( OBJ-AT ?auto_166751 ?auto_166748 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166750 ?auto_166748 )
      ( DELIVER-3PKG-VERIFY ?auto_166749 ?auto_166750 ?auto_166751 ?auto_166748 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_166759 - OBJ
      ?auto_166760 - OBJ
      ?auto_166761 - OBJ
      ?auto_166758 - LOCATION
    )
    :vars
    (
      ?auto_166762 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166760 ?auto_166759 ) ) ( not ( = ?auto_166761 ?auto_166759 ) ) ( not ( = ?auto_166761 ?auto_166760 ) ) ( TRUCK-AT ?auto_166762 ?auto_166758 ) ( IN-TRUCK ?auto_166761 ?auto_166762 ) ( OBJ-AT ?auto_166759 ?auto_166758 ) ( OBJ-AT ?auto_166760 ?auto_166758 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166761 ?auto_166758 )
      ( DELIVER-3PKG-VERIFY ?auto_166759 ?auto_166760 ?auto_166761 ?auto_166758 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_166769 - OBJ
      ?auto_166770 - OBJ
      ?auto_166771 - OBJ
      ?auto_166768 - LOCATION
    )
    :vars
    (
      ?auto_166772 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166770 ?auto_166769 ) ) ( not ( = ?auto_166771 ?auto_166769 ) ) ( not ( = ?auto_166771 ?auto_166770 ) ) ( TRUCK-AT ?auto_166772 ?auto_166768 ) ( IN-TRUCK ?auto_166771 ?auto_166772 ) ( OBJ-AT ?auto_166769 ?auto_166768 ) ( OBJ-AT ?auto_166770 ?auto_166768 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166771 ?auto_166768 )
      ( DELIVER-3PKG-VERIFY ?auto_166769 ?auto_166770 ?auto_166771 ?auto_166768 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_166774 - OBJ
      ?auto_166775 - OBJ
      ?auto_166776 - OBJ
      ?auto_166773 - LOCATION
    )
    :vars
    (
      ?auto_166777 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166775 ?auto_166774 ) ) ( not ( = ?auto_166776 ?auto_166774 ) ) ( not ( = ?auto_166776 ?auto_166775 ) ) ( TRUCK-AT ?auto_166777 ?auto_166773 ) ( IN-TRUCK ?auto_166775 ?auto_166777 ) ( OBJ-AT ?auto_166774 ?auto_166773 ) ( OBJ-AT ?auto_166776 ?auto_166773 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166775 ?auto_166773 )
      ( DELIVER-3PKG-VERIFY ?auto_166774 ?auto_166775 ?auto_166776 ?auto_166773 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_166784 - OBJ
      ?auto_166785 - OBJ
      ?auto_166786 - OBJ
      ?auto_166783 - LOCATION
    )
    :vars
    (
      ?auto_166787 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166785 ?auto_166784 ) ) ( not ( = ?auto_166786 ?auto_166784 ) ) ( not ( = ?auto_166786 ?auto_166785 ) ) ( TRUCK-AT ?auto_166787 ?auto_166783 ) ( IN-TRUCK ?auto_166785 ?auto_166787 ) ( OBJ-AT ?auto_166784 ?auto_166783 ) ( OBJ-AT ?auto_166786 ?auto_166783 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166785 ?auto_166783 )
      ( DELIVER-3PKG-VERIFY ?auto_166784 ?auto_166785 ?auto_166786 ?auto_166783 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_166794 - OBJ
      ?auto_166795 - OBJ
      ?auto_166796 - OBJ
      ?auto_166793 - LOCATION
    )
    :vars
    (
      ?auto_166797 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166795 ?auto_166794 ) ) ( not ( = ?auto_166796 ?auto_166794 ) ) ( not ( = ?auto_166796 ?auto_166795 ) ) ( TRUCK-AT ?auto_166797 ?auto_166793 ) ( IN-TRUCK ?auto_166796 ?auto_166797 ) ( OBJ-AT ?auto_166794 ?auto_166793 ) ( OBJ-AT ?auto_166795 ?auto_166793 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166796 ?auto_166793 )
      ( DELIVER-3PKG-VERIFY ?auto_166794 ?auto_166795 ?auto_166796 ?auto_166793 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_166799 - OBJ
      ?auto_166800 - OBJ
      ?auto_166801 - OBJ
      ?auto_166798 - LOCATION
    )
    :vars
    (
      ?auto_166802 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166800 ?auto_166799 ) ) ( not ( = ?auto_166801 ?auto_166799 ) ) ( not ( = ?auto_166801 ?auto_166800 ) ) ( TRUCK-AT ?auto_166802 ?auto_166798 ) ( IN-TRUCK ?auto_166801 ?auto_166802 ) ( OBJ-AT ?auto_166799 ?auto_166798 ) ( OBJ-AT ?auto_166800 ?auto_166798 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166801 ?auto_166798 )
      ( DELIVER-3PKG-VERIFY ?auto_166799 ?auto_166800 ?auto_166801 ?auto_166798 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_166809 - OBJ
      ?auto_166810 - OBJ
      ?auto_166811 - OBJ
      ?auto_166808 - LOCATION
    )
    :vars
    (
      ?auto_166812 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166810 ?auto_166809 ) ) ( not ( = ?auto_166811 ?auto_166809 ) ) ( not ( = ?auto_166811 ?auto_166810 ) ) ( TRUCK-AT ?auto_166812 ?auto_166808 ) ( IN-TRUCK ?auto_166810 ?auto_166812 ) ( OBJ-AT ?auto_166809 ?auto_166808 ) ( OBJ-AT ?auto_166811 ?auto_166808 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166810 ?auto_166808 )
      ( DELIVER-3PKG-VERIFY ?auto_166809 ?auto_166810 ?auto_166811 ?auto_166808 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_166814 - OBJ
      ?auto_166815 - OBJ
      ?auto_166816 - OBJ
      ?auto_166813 - LOCATION
    )
    :vars
    (
      ?auto_166817 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166815 ?auto_166814 ) ) ( not ( = ?auto_166816 ?auto_166814 ) ) ( not ( = ?auto_166816 ?auto_166815 ) ) ( TRUCK-AT ?auto_166817 ?auto_166813 ) ( IN-TRUCK ?auto_166815 ?auto_166817 ) ( OBJ-AT ?auto_166814 ?auto_166813 ) ( OBJ-AT ?auto_166816 ?auto_166813 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166815 ?auto_166813 )
      ( DELIVER-3PKG-VERIFY ?auto_166814 ?auto_166815 ?auto_166816 ?auto_166813 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_166834 - OBJ
      ?auto_166835 - OBJ
      ?auto_166836 - OBJ
      ?auto_166833 - LOCATION
    )
    :vars
    (
      ?auto_166837 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166835 ?auto_166834 ) ) ( not ( = ?auto_166836 ?auto_166834 ) ) ( not ( = ?auto_166836 ?auto_166835 ) ) ( TRUCK-AT ?auto_166837 ?auto_166833 ) ( IN-TRUCK ?auto_166834 ?auto_166837 ) ( OBJ-AT ?auto_166835 ?auto_166833 ) ( OBJ-AT ?auto_166836 ?auto_166833 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166834 ?auto_166833 )
      ( DELIVER-3PKG-VERIFY ?auto_166834 ?auto_166835 ?auto_166836 ?auto_166833 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_166839 - OBJ
      ?auto_166840 - OBJ
      ?auto_166841 - OBJ
      ?auto_166838 - LOCATION
    )
    :vars
    (
      ?auto_166842 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166840 ?auto_166839 ) ) ( not ( = ?auto_166841 ?auto_166839 ) ) ( not ( = ?auto_166841 ?auto_166840 ) ) ( TRUCK-AT ?auto_166842 ?auto_166838 ) ( IN-TRUCK ?auto_166839 ?auto_166842 ) ( OBJ-AT ?auto_166840 ?auto_166838 ) ( OBJ-AT ?auto_166841 ?auto_166838 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166839 ?auto_166838 )
      ( DELIVER-3PKG-VERIFY ?auto_166839 ?auto_166840 ?auto_166841 ?auto_166838 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_166849 - OBJ
      ?auto_166850 - OBJ
      ?auto_166851 - OBJ
      ?auto_166848 - LOCATION
    )
    :vars
    (
      ?auto_166852 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166850 ?auto_166849 ) ) ( not ( = ?auto_166851 ?auto_166849 ) ) ( not ( = ?auto_166851 ?auto_166850 ) ) ( TRUCK-AT ?auto_166852 ?auto_166848 ) ( IN-TRUCK ?auto_166849 ?auto_166852 ) ( OBJ-AT ?auto_166850 ?auto_166848 ) ( OBJ-AT ?auto_166851 ?auto_166848 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166849 ?auto_166848 )
      ( DELIVER-3PKG-VERIFY ?auto_166849 ?auto_166850 ?auto_166851 ?auto_166848 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_166859 - OBJ
      ?auto_166860 - OBJ
      ?auto_166861 - OBJ
      ?auto_166858 - LOCATION
    )
    :vars
    (
      ?auto_166862 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166860 ?auto_166859 ) ) ( not ( = ?auto_166861 ?auto_166859 ) ) ( not ( = ?auto_166861 ?auto_166860 ) ) ( TRUCK-AT ?auto_166862 ?auto_166858 ) ( IN-TRUCK ?auto_166859 ?auto_166862 ) ( OBJ-AT ?auto_166860 ?auto_166858 ) ( OBJ-AT ?auto_166861 ?auto_166858 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166859 ?auto_166858 )
      ( DELIVER-3PKG-VERIFY ?auto_166859 ?auto_166860 ?auto_166861 ?auto_166858 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_166869 - OBJ
      ?auto_166870 - OBJ
      ?auto_166871 - OBJ
      ?auto_166868 - LOCATION
    )
    :vars
    (
      ?auto_166872 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166870 ?auto_166869 ) ) ( not ( = ?auto_166871 ?auto_166869 ) ) ( not ( = ?auto_166871 ?auto_166870 ) ) ( TRUCK-AT ?auto_166872 ?auto_166868 ) ( IN-TRUCK ?auto_166869 ?auto_166872 ) ( OBJ-AT ?auto_166870 ?auto_166868 ) ( OBJ-AT ?auto_166871 ?auto_166868 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166869 ?auto_166868 )
      ( DELIVER-3PKG-VERIFY ?auto_166869 ?auto_166870 ?auto_166871 ?auto_166868 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_166874 - OBJ
      ?auto_166875 - OBJ
      ?auto_166876 - OBJ
      ?auto_166873 - LOCATION
    )
    :vars
    (
      ?auto_166877 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166875 ?auto_166874 ) ) ( not ( = ?auto_166876 ?auto_166874 ) ) ( not ( = ?auto_166876 ?auto_166875 ) ) ( TRUCK-AT ?auto_166877 ?auto_166873 ) ( IN-TRUCK ?auto_166874 ?auto_166877 ) ( OBJ-AT ?auto_166875 ?auto_166873 ) ( OBJ-AT ?auto_166876 ?auto_166873 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166874 ?auto_166873 )
      ( DELIVER-3PKG-VERIFY ?auto_166874 ?auto_166875 ?auto_166876 ?auto_166873 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_166963 - OBJ
      ?auto_166964 - OBJ
      ?auto_166965 - OBJ
      ?auto_166966 - OBJ
      ?auto_166962 - LOCATION
    )
    :vars
    (
      ?auto_166967 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166964 ?auto_166963 ) ) ( not ( = ?auto_166965 ?auto_166963 ) ) ( not ( = ?auto_166965 ?auto_166964 ) ) ( not ( = ?auto_166966 ?auto_166963 ) ) ( not ( = ?auto_166966 ?auto_166964 ) ) ( not ( = ?auto_166966 ?auto_166965 ) ) ( TRUCK-AT ?auto_166967 ?auto_166962 ) ( IN-TRUCK ?auto_166966 ?auto_166967 ) ( OBJ-AT ?auto_166963 ?auto_166962 ) ( OBJ-AT ?auto_166964 ?auto_166962 ) ( OBJ-AT ?auto_166965 ?auto_166962 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166966 ?auto_166962 )
      ( DELIVER-4PKG-VERIFY ?auto_166963 ?auto_166964 ?auto_166965 ?auto_166966 ?auto_166962 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_166981 - OBJ
      ?auto_166982 - OBJ
      ?auto_166983 - OBJ
      ?auto_166984 - OBJ
      ?auto_166980 - LOCATION
    )
    :vars
    (
      ?auto_166985 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_166982 ?auto_166981 ) ) ( not ( = ?auto_166983 ?auto_166981 ) ) ( not ( = ?auto_166983 ?auto_166982 ) ) ( not ( = ?auto_166984 ?auto_166981 ) ) ( not ( = ?auto_166984 ?auto_166982 ) ) ( not ( = ?auto_166984 ?auto_166983 ) ) ( TRUCK-AT ?auto_166985 ?auto_166980 ) ( IN-TRUCK ?auto_166983 ?auto_166985 ) ( OBJ-AT ?auto_166981 ?auto_166980 ) ( OBJ-AT ?auto_166982 ?auto_166980 ) ( OBJ-AT ?auto_166984 ?auto_166980 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_166983 ?auto_166980 )
      ( DELIVER-4PKG-VERIFY ?auto_166981 ?auto_166982 ?auto_166983 ?auto_166984 ?auto_166980 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_166999 - OBJ
      ?auto_167000 - OBJ
      ?auto_167001 - OBJ
      ?auto_167002 - OBJ
      ?auto_166998 - LOCATION
    )
    :vars
    (
      ?auto_167003 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167000 ?auto_166999 ) ) ( not ( = ?auto_167001 ?auto_166999 ) ) ( not ( = ?auto_167001 ?auto_167000 ) ) ( not ( = ?auto_167002 ?auto_166999 ) ) ( not ( = ?auto_167002 ?auto_167000 ) ) ( not ( = ?auto_167002 ?auto_167001 ) ) ( TRUCK-AT ?auto_167003 ?auto_166998 ) ( IN-TRUCK ?auto_167002 ?auto_167003 ) ( OBJ-AT ?auto_166999 ?auto_166998 ) ( OBJ-AT ?auto_167000 ?auto_166998 ) ( OBJ-AT ?auto_167001 ?auto_166998 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167002 ?auto_166998 )
      ( DELIVER-4PKG-VERIFY ?auto_166999 ?auto_167000 ?auto_167001 ?auto_167002 ?auto_166998 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_167017 - OBJ
      ?auto_167018 - OBJ
      ?auto_167019 - OBJ
      ?auto_167020 - OBJ
      ?auto_167016 - LOCATION
    )
    :vars
    (
      ?auto_167021 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167018 ?auto_167017 ) ) ( not ( = ?auto_167019 ?auto_167017 ) ) ( not ( = ?auto_167019 ?auto_167018 ) ) ( not ( = ?auto_167020 ?auto_167017 ) ) ( not ( = ?auto_167020 ?auto_167018 ) ) ( not ( = ?auto_167020 ?auto_167019 ) ) ( TRUCK-AT ?auto_167021 ?auto_167016 ) ( IN-TRUCK ?auto_167019 ?auto_167021 ) ( OBJ-AT ?auto_167017 ?auto_167016 ) ( OBJ-AT ?auto_167018 ?auto_167016 ) ( OBJ-AT ?auto_167020 ?auto_167016 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167019 ?auto_167016 )
      ( DELIVER-4PKG-VERIFY ?auto_167017 ?auto_167018 ?auto_167019 ?auto_167020 ?auto_167016 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_167071 - OBJ
      ?auto_167072 - OBJ
      ?auto_167073 - OBJ
      ?auto_167074 - OBJ
      ?auto_167070 - LOCATION
    )
    :vars
    (
      ?auto_167075 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167072 ?auto_167071 ) ) ( not ( = ?auto_167073 ?auto_167071 ) ) ( not ( = ?auto_167073 ?auto_167072 ) ) ( not ( = ?auto_167074 ?auto_167071 ) ) ( not ( = ?auto_167074 ?auto_167072 ) ) ( not ( = ?auto_167074 ?auto_167073 ) ) ( TRUCK-AT ?auto_167075 ?auto_167070 ) ( IN-TRUCK ?auto_167072 ?auto_167075 ) ( OBJ-AT ?auto_167071 ?auto_167070 ) ( OBJ-AT ?auto_167073 ?auto_167070 ) ( OBJ-AT ?auto_167074 ?auto_167070 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167072 ?auto_167070 )
      ( DELIVER-4PKG-VERIFY ?auto_167071 ?auto_167072 ?auto_167073 ?auto_167074 ?auto_167070 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_167089 - OBJ
      ?auto_167090 - OBJ
      ?auto_167091 - OBJ
      ?auto_167092 - OBJ
      ?auto_167088 - LOCATION
    )
    :vars
    (
      ?auto_167093 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167090 ?auto_167089 ) ) ( not ( = ?auto_167091 ?auto_167089 ) ) ( not ( = ?auto_167091 ?auto_167090 ) ) ( not ( = ?auto_167092 ?auto_167089 ) ) ( not ( = ?auto_167092 ?auto_167090 ) ) ( not ( = ?auto_167092 ?auto_167091 ) ) ( TRUCK-AT ?auto_167093 ?auto_167088 ) ( IN-TRUCK ?auto_167090 ?auto_167093 ) ( OBJ-AT ?auto_167089 ?auto_167088 ) ( OBJ-AT ?auto_167091 ?auto_167088 ) ( OBJ-AT ?auto_167092 ?auto_167088 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167090 ?auto_167088 )
      ( DELIVER-4PKG-VERIFY ?auto_167089 ?auto_167090 ?auto_167091 ?auto_167092 ?auto_167088 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_167143 - OBJ
      ?auto_167144 - OBJ
      ?auto_167145 - OBJ
      ?auto_167146 - OBJ
      ?auto_167142 - LOCATION
    )
    :vars
    (
      ?auto_167147 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167144 ?auto_167143 ) ) ( not ( = ?auto_167145 ?auto_167143 ) ) ( not ( = ?auto_167145 ?auto_167144 ) ) ( not ( = ?auto_167146 ?auto_167143 ) ) ( not ( = ?auto_167146 ?auto_167144 ) ) ( not ( = ?auto_167146 ?auto_167145 ) ) ( TRUCK-AT ?auto_167147 ?auto_167142 ) ( IN-TRUCK ?auto_167146 ?auto_167147 ) ( OBJ-AT ?auto_167143 ?auto_167142 ) ( OBJ-AT ?auto_167144 ?auto_167142 ) ( OBJ-AT ?auto_167145 ?auto_167142 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167146 ?auto_167142 )
      ( DELIVER-4PKG-VERIFY ?auto_167143 ?auto_167144 ?auto_167145 ?auto_167146 ?auto_167142 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_167161 - OBJ
      ?auto_167162 - OBJ
      ?auto_167163 - OBJ
      ?auto_167164 - OBJ
      ?auto_167160 - LOCATION
    )
    :vars
    (
      ?auto_167165 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167162 ?auto_167161 ) ) ( not ( = ?auto_167163 ?auto_167161 ) ) ( not ( = ?auto_167163 ?auto_167162 ) ) ( not ( = ?auto_167164 ?auto_167161 ) ) ( not ( = ?auto_167164 ?auto_167162 ) ) ( not ( = ?auto_167164 ?auto_167163 ) ) ( TRUCK-AT ?auto_167165 ?auto_167160 ) ( IN-TRUCK ?auto_167163 ?auto_167165 ) ( OBJ-AT ?auto_167161 ?auto_167160 ) ( OBJ-AT ?auto_167162 ?auto_167160 ) ( OBJ-AT ?auto_167164 ?auto_167160 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167163 ?auto_167160 )
      ( DELIVER-4PKG-VERIFY ?auto_167161 ?auto_167162 ?auto_167163 ?auto_167164 ?auto_167160 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_167215 - OBJ
      ?auto_167216 - OBJ
      ?auto_167217 - OBJ
      ?auto_167218 - OBJ
      ?auto_167214 - LOCATION
    )
    :vars
    (
      ?auto_167219 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167216 ?auto_167215 ) ) ( not ( = ?auto_167217 ?auto_167215 ) ) ( not ( = ?auto_167217 ?auto_167216 ) ) ( not ( = ?auto_167218 ?auto_167215 ) ) ( not ( = ?auto_167218 ?auto_167216 ) ) ( not ( = ?auto_167218 ?auto_167217 ) ) ( TRUCK-AT ?auto_167219 ?auto_167214 ) ( IN-TRUCK ?auto_167218 ?auto_167219 ) ( OBJ-AT ?auto_167215 ?auto_167214 ) ( OBJ-AT ?auto_167216 ?auto_167214 ) ( OBJ-AT ?auto_167217 ?auto_167214 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167218 ?auto_167214 )
      ( DELIVER-4PKG-VERIFY ?auto_167215 ?auto_167216 ?auto_167217 ?auto_167218 ?auto_167214 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_167233 - OBJ
      ?auto_167234 - OBJ
      ?auto_167235 - OBJ
      ?auto_167236 - OBJ
      ?auto_167232 - LOCATION
    )
    :vars
    (
      ?auto_167237 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167234 ?auto_167233 ) ) ( not ( = ?auto_167235 ?auto_167233 ) ) ( not ( = ?auto_167235 ?auto_167234 ) ) ( not ( = ?auto_167236 ?auto_167233 ) ) ( not ( = ?auto_167236 ?auto_167234 ) ) ( not ( = ?auto_167236 ?auto_167235 ) ) ( TRUCK-AT ?auto_167237 ?auto_167232 ) ( IN-TRUCK ?auto_167235 ?auto_167237 ) ( OBJ-AT ?auto_167233 ?auto_167232 ) ( OBJ-AT ?auto_167234 ?auto_167232 ) ( OBJ-AT ?auto_167236 ?auto_167232 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167235 ?auto_167232 )
      ( DELIVER-4PKG-VERIFY ?auto_167233 ?auto_167234 ?auto_167235 ?auto_167236 ?auto_167232 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_167269 - OBJ
      ?auto_167270 - OBJ
      ?auto_167271 - OBJ
      ?auto_167272 - OBJ
      ?auto_167268 - LOCATION
    )
    :vars
    (
      ?auto_167273 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167270 ?auto_167269 ) ) ( not ( = ?auto_167271 ?auto_167269 ) ) ( not ( = ?auto_167271 ?auto_167270 ) ) ( not ( = ?auto_167272 ?auto_167269 ) ) ( not ( = ?auto_167272 ?auto_167270 ) ) ( not ( = ?auto_167272 ?auto_167271 ) ) ( TRUCK-AT ?auto_167273 ?auto_167268 ) ( IN-TRUCK ?auto_167270 ?auto_167273 ) ( OBJ-AT ?auto_167269 ?auto_167268 ) ( OBJ-AT ?auto_167271 ?auto_167268 ) ( OBJ-AT ?auto_167272 ?auto_167268 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167270 ?auto_167268 )
      ( DELIVER-4PKG-VERIFY ?auto_167269 ?auto_167270 ?auto_167271 ?auto_167272 ?auto_167268 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_167305 - OBJ
      ?auto_167306 - OBJ
      ?auto_167307 - OBJ
      ?auto_167308 - OBJ
      ?auto_167304 - LOCATION
    )
    :vars
    (
      ?auto_167309 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167306 ?auto_167305 ) ) ( not ( = ?auto_167307 ?auto_167305 ) ) ( not ( = ?auto_167307 ?auto_167306 ) ) ( not ( = ?auto_167308 ?auto_167305 ) ) ( not ( = ?auto_167308 ?auto_167306 ) ) ( not ( = ?auto_167308 ?auto_167307 ) ) ( TRUCK-AT ?auto_167309 ?auto_167304 ) ( IN-TRUCK ?auto_167306 ?auto_167309 ) ( OBJ-AT ?auto_167305 ?auto_167304 ) ( OBJ-AT ?auto_167307 ?auto_167304 ) ( OBJ-AT ?auto_167308 ?auto_167304 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167306 ?auto_167304 )
      ( DELIVER-4PKG-VERIFY ?auto_167305 ?auto_167306 ?auto_167307 ?auto_167308 ?auto_167304 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_167359 - OBJ
      ?auto_167360 - OBJ
      ?auto_167361 - OBJ
      ?auto_167362 - OBJ
      ?auto_167358 - LOCATION
    )
    :vars
    (
      ?auto_167363 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167360 ?auto_167359 ) ) ( not ( = ?auto_167361 ?auto_167359 ) ) ( not ( = ?auto_167361 ?auto_167360 ) ) ( not ( = ?auto_167362 ?auto_167359 ) ) ( not ( = ?auto_167362 ?auto_167360 ) ) ( not ( = ?auto_167362 ?auto_167361 ) ) ( TRUCK-AT ?auto_167363 ?auto_167358 ) ( IN-TRUCK ?auto_167362 ?auto_167363 ) ( OBJ-AT ?auto_167359 ?auto_167358 ) ( OBJ-AT ?auto_167360 ?auto_167358 ) ( OBJ-AT ?auto_167361 ?auto_167358 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167362 ?auto_167358 )
      ( DELIVER-4PKG-VERIFY ?auto_167359 ?auto_167360 ?auto_167361 ?auto_167362 ?auto_167358 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_167377 - OBJ
      ?auto_167378 - OBJ
      ?auto_167379 - OBJ
      ?auto_167380 - OBJ
      ?auto_167376 - LOCATION
    )
    :vars
    (
      ?auto_167381 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167378 ?auto_167377 ) ) ( not ( = ?auto_167379 ?auto_167377 ) ) ( not ( = ?auto_167379 ?auto_167378 ) ) ( not ( = ?auto_167380 ?auto_167377 ) ) ( not ( = ?auto_167380 ?auto_167378 ) ) ( not ( = ?auto_167380 ?auto_167379 ) ) ( TRUCK-AT ?auto_167381 ?auto_167376 ) ( IN-TRUCK ?auto_167379 ?auto_167381 ) ( OBJ-AT ?auto_167377 ?auto_167376 ) ( OBJ-AT ?auto_167378 ?auto_167376 ) ( OBJ-AT ?auto_167380 ?auto_167376 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167379 ?auto_167376 )
      ( DELIVER-4PKG-VERIFY ?auto_167377 ?auto_167378 ?auto_167379 ?auto_167380 ?auto_167376 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_167395 - OBJ
      ?auto_167396 - OBJ
      ?auto_167397 - OBJ
      ?auto_167398 - OBJ
      ?auto_167394 - LOCATION
    )
    :vars
    (
      ?auto_167399 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167396 ?auto_167395 ) ) ( not ( = ?auto_167397 ?auto_167395 ) ) ( not ( = ?auto_167397 ?auto_167396 ) ) ( not ( = ?auto_167398 ?auto_167395 ) ) ( not ( = ?auto_167398 ?auto_167396 ) ) ( not ( = ?auto_167398 ?auto_167397 ) ) ( TRUCK-AT ?auto_167399 ?auto_167394 ) ( IN-TRUCK ?auto_167398 ?auto_167399 ) ( OBJ-AT ?auto_167395 ?auto_167394 ) ( OBJ-AT ?auto_167396 ?auto_167394 ) ( OBJ-AT ?auto_167397 ?auto_167394 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167398 ?auto_167394 )
      ( DELIVER-4PKG-VERIFY ?auto_167395 ?auto_167396 ?auto_167397 ?auto_167398 ?auto_167394 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_167413 - OBJ
      ?auto_167414 - OBJ
      ?auto_167415 - OBJ
      ?auto_167416 - OBJ
      ?auto_167412 - LOCATION
    )
    :vars
    (
      ?auto_167417 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167414 ?auto_167413 ) ) ( not ( = ?auto_167415 ?auto_167413 ) ) ( not ( = ?auto_167415 ?auto_167414 ) ) ( not ( = ?auto_167416 ?auto_167413 ) ) ( not ( = ?auto_167416 ?auto_167414 ) ) ( not ( = ?auto_167416 ?auto_167415 ) ) ( TRUCK-AT ?auto_167417 ?auto_167412 ) ( IN-TRUCK ?auto_167415 ?auto_167417 ) ( OBJ-AT ?auto_167413 ?auto_167412 ) ( OBJ-AT ?auto_167414 ?auto_167412 ) ( OBJ-AT ?auto_167416 ?auto_167412 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167415 ?auto_167412 )
      ( DELIVER-4PKG-VERIFY ?auto_167413 ?auto_167414 ?auto_167415 ?auto_167416 ?auto_167412 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_167485 - OBJ
      ?auto_167486 - OBJ
      ?auto_167487 - OBJ
      ?auto_167488 - OBJ
      ?auto_167484 - LOCATION
    )
    :vars
    (
      ?auto_167489 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167486 ?auto_167485 ) ) ( not ( = ?auto_167487 ?auto_167485 ) ) ( not ( = ?auto_167487 ?auto_167486 ) ) ( not ( = ?auto_167488 ?auto_167485 ) ) ( not ( = ?auto_167488 ?auto_167486 ) ) ( not ( = ?auto_167488 ?auto_167487 ) ) ( TRUCK-AT ?auto_167489 ?auto_167484 ) ( IN-TRUCK ?auto_167486 ?auto_167489 ) ( OBJ-AT ?auto_167485 ?auto_167484 ) ( OBJ-AT ?auto_167487 ?auto_167484 ) ( OBJ-AT ?auto_167488 ?auto_167484 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167486 ?auto_167484 )
      ( DELIVER-4PKG-VERIFY ?auto_167485 ?auto_167486 ?auto_167487 ?auto_167488 ?auto_167484 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_167503 - OBJ
      ?auto_167504 - OBJ
      ?auto_167505 - OBJ
      ?auto_167506 - OBJ
      ?auto_167502 - LOCATION
    )
    :vars
    (
      ?auto_167507 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167504 ?auto_167503 ) ) ( not ( = ?auto_167505 ?auto_167503 ) ) ( not ( = ?auto_167505 ?auto_167504 ) ) ( not ( = ?auto_167506 ?auto_167503 ) ) ( not ( = ?auto_167506 ?auto_167504 ) ) ( not ( = ?auto_167506 ?auto_167505 ) ) ( TRUCK-AT ?auto_167507 ?auto_167502 ) ( IN-TRUCK ?auto_167504 ?auto_167507 ) ( OBJ-AT ?auto_167503 ?auto_167502 ) ( OBJ-AT ?auto_167505 ?auto_167502 ) ( OBJ-AT ?auto_167506 ?auto_167502 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167504 ?auto_167502 )
      ( DELIVER-4PKG-VERIFY ?auto_167503 ?auto_167504 ?auto_167505 ?auto_167506 ?auto_167502 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_167611 - OBJ
      ?auto_167612 - OBJ
      ?auto_167613 - OBJ
      ?auto_167614 - OBJ
      ?auto_167610 - LOCATION
    )
    :vars
    (
      ?auto_167615 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167612 ?auto_167611 ) ) ( not ( = ?auto_167613 ?auto_167611 ) ) ( not ( = ?auto_167613 ?auto_167612 ) ) ( not ( = ?auto_167614 ?auto_167611 ) ) ( not ( = ?auto_167614 ?auto_167612 ) ) ( not ( = ?auto_167614 ?auto_167613 ) ) ( TRUCK-AT ?auto_167615 ?auto_167610 ) ( IN-TRUCK ?auto_167611 ?auto_167615 ) ( OBJ-AT ?auto_167612 ?auto_167610 ) ( OBJ-AT ?auto_167613 ?auto_167610 ) ( OBJ-AT ?auto_167614 ?auto_167610 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167611 ?auto_167610 )
      ( DELIVER-4PKG-VERIFY ?auto_167611 ?auto_167612 ?auto_167613 ?auto_167614 ?auto_167610 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_167629 - OBJ
      ?auto_167630 - OBJ
      ?auto_167631 - OBJ
      ?auto_167632 - OBJ
      ?auto_167628 - LOCATION
    )
    :vars
    (
      ?auto_167633 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167630 ?auto_167629 ) ) ( not ( = ?auto_167631 ?auto_167629 ) ) ( not ( = ?auto_167631 ?auto_167630 ) ) ( not ( = ?auto_167632 ?auto_167629 ) ) ( not ( = ?auto_167632 ?auto_167630 ) ) ( not ( = ?auto_167632 ?auto_167631 ) ) ( TRUCK-AT ?auto_167633 ?auto_167628 ) ( IN-TRUCK ?auto_167629 ?auto_167633 ) ( OBJ-AT ?auto_167630 ?auto_167628 ) ( OBJ-AT ?auto_167631 ?auto_167628 ) ( OBJ-AT ?auto_167632 ?auto_167628 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167629 ?auto_167628 )
      ( DELIVER-4PKG-VERIFY ?auto_167629 ?auto_167630 ?auto_167631 ?auto_167632 ?auto_167628 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_167683 - OBJ
      ?auto_167684 - OBJ
      ?auto_167685 - OBJ
      ?auto_167686 - OBJ
      ?auto_167682 - LOCATION
    )
    :vars
    (
      ?auto_167687 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167684 ?auto_167683 ) ) ( not ( = ?auto_167685 ?auto_167683 ) ) ( not ( = ?auto_167685 ?auto_167684 ) ) ( not ( = ?auto_167686 ?auto_167683 ) ) ( not ( = ?auto_167686 ?auto_167684 ) ) ( not ( = ?auto_167686 ?auto_167685 ) ) ( TRUCK-AT ?auto_167687 ?auto_167682 ) ( IN-TRUCK ?auto_167683 ?auto_167687 ) ( OBJ-AT ?auto_167684 ?auto_167682 ) ( OBJ-AT ?auto_167685 ?auto_167682 ) ( OBJ-AT ?auto_167686 ?auto_167682 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167683 ?auto_167682 )
      ( DELIVER-4PKG-VERIFY ?auto_167683 ?auto_167684 ?auto_167685 ?auto_167686 ?auto_167682 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_167719 - OBJ
      ?auto_167720 - OBJ
      ?auto_167721 - OBJ
      ?auto_167722 - OBJ
      ?auto_167718 - LOCATION
    )
    :vars
    (
      ?auto_167723 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167720 ?auto_167719 ) ) ( not ( = ?auto_167721 ?auto_167719 ) ) ( not ( = ?auto_167721 ?auto_167720 ) ) ( not ( = ?auto_167722 ?auto_167719 ) ) ( not ( = ?auto_167722 ?auto_167720 ) ) ( not ( = ?auto_167722 ?auto_167721 ) ) ( TRUCK-AT ?auto_167723 ?auto_167718 ) ( IN-TRUCK ?auto_167719 ?auto_167723 ) ( OBJ-AT ?auto_167720 ?auto_167718 ) ( OBJ-AT ?auto_167721 ?auto_167718 ) ( OBJ-AT ?auto_167722 ?auto_167718 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167719 ?auto_167718 )
      ( DELIVER-4PKG-VERIFY ?auto_167719 ?auto_167720 ?auto_167721 ?auto_167722 ?auto_167718 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_167773 - OBJ
      ?auto_167774 - OBJ
      ?auto_167775 - OBJ
      ?auto_167776 - OBJ
      ?auto_167772 - LOCATION
    )
    :vars
    (
      ?auto_167777 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167774 ?auto_167773 ) ) ( not ( = ?auto_167775 ?auto_167773 ) ) ( not ( = ?auto_167775 ?auto_167774 ) ) ( not ( = ?auto_167776 ?auto_167773 ) ) ( not ( = ?auto_167776 ?auto_167774 ) ) ( not ( = ?auto_167776 ?auto_167775 ) ) ( TRUCK-AT ?auto_167777 ?auto_167772 ) ( IN-TRUCK ?auto_167773 ?auto_167777 ) ( OBJ-AT ?auto_167774 ?auto_167772 ) ( OBJ-AT ?auto_167775 ?auto_167772 ) ( OBJ-AT ?auto_167776 ?auto_167772 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167773 ?auto_167772 )
      ( DELIVER-4PKG-VERIFY ?auto_167773 ?auto_167774 ?auto_167775 ?auto_167776 ?auto_167772 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_167791 - OBJ
      ?auto_167792 - OBJ
      ?auto_167793 - OBJ
      ?auto_167794 - OBJ
      ?auto_167790 - LOCATION
    )
    :vars
    (
      ?auto_167795 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_167792 ?auto_167791 ) ) ( not ( = ?auto_167793 ?auto_167791 ) ) ( not ( = ?auto_167793 ?auto_167792 ) ) ( not ( = ?auto_167794 ?auto_167791 ) ) ( not ( = ?auto_167794 ?auto_167792 ) ) ( not ( = ?auto_167794 ?auto_167793 ) ) ( TRUCK-AT ?auto_167795 ?auto_167790 ) ( IN-TRUCK ?auto_167791 ?auto_167795 ) ( OBJ-AT ?auto_167792 ?auto_167790 ) ( OBJ-AT ?auto_167793 ?auto_167790 ) ( OBJ-AT ?auto_167794 ?auto_167790 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167791 ?auto_167790 )
      ( DELIVER-4PKG-VERIFY ?auto_167791 ?auto_167792 ?auto_167793 ?auto_167794 ?auto_167790 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_167959 - OBJ
      ?auto_167958 - LOCATION
    )
    :vars
    (
      ?auto_167960 - TRUCK
      ?auto_167961 - LOCATION
      ?auto_167962 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_167959 ?auto_167960 ) ( TRUCK-AT ?auto_167960 ?auto_167961 ) ( IN-CITY ?auto_167961 ?auto_167962 ) ( IN-CITY ?auto_167958 ?auto_167962 ) ( not ( = ?auto_167958 ?auto_167961 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_167960 ?auto_167961 ?auto_167958 ?auto_167962 )
      ( DELIVER-1PKG ?auto_167959 ?auto_167958 )
      ( DELIVER-1PKG-VERIFY ?auto_167959 ?auto_167958 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_167964 - OBJ
      ?auto_167965 - OBJ
      ?auto_167963 - LOCATION
    )
    :vars
    (
      ?auto_167966 - TRUCK
      ?auto_167967 - LOCATION
      ?auto_167968 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_167965 ?auto_167964 ) ) ( IN-TRUCK ?auto_167965 ?auto_167966 ) ( TRUCK-AT ?auto_167966 ?auto_167967 ) ( IN-CITY ?auto_167967 ?auto_167968 ) ( IN-CITY ?auto_167963 ?auto_167968 ) ( not ( = ?auto_167963 ?auto_167967 ) ) ( OBJ-AT ?auto_167964 ?auto_167963 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_167965 ?auto_167963 )
      ( DELIVER-2PKG-VERIFY ?auto_167964 ?auto_167965 ?auto_167963 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_167970 - OBJ
      ?auto_167971 - OBJ
      ?auto_167969 - LOCATION
    )
    :vars
    (
      ?auto_167974 - OBJ
      ?auto_167972 - TRUCK
      ?auto_167973 - LOCATION
      ?auto_167975 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_167971 ?auto_167970 ) ) ( not ( = ?auto_167971 ?auto_167974 ) ) ( IN-TRUCK ?auto_167971 ?auto_167972 ) ( TRUCK-AT ?auto_167972 ?auto_167973 ) ( IN-CITY ?auto_167973 ?auto_167975 ) ( IN-CITY ?auto_167969 ?auto_167975 ) ( not ( = ?auto_167969 ?auto_167973 ) ) ( OBJ-AT ?auto_167974 ?auto_167969 ) ( OBJ-AT ?auto_167970 ?auto_167969 ) ( not ( = ?auto_167970 ?auto_167974 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_167974 ?auto_167971 ?auto_167969 )
      ( DELIVER-2PKG-VERIFY ?auto_167970 ?auto_167971 ?auto_167969 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_167977 - OBJ
      ?auto_167978 - OBJ
      ?auto_167976 - LOCATION
    )
    :vars
    (
      ?auto_167981 - OBJ
      ?auto_167979 - TRUCK
      ?auto_167980 - LOCATION
      ?auto_167982 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_167978 ?auto_167977 ) ) ( not ( = ?auto_167978 ?auto_167981 ) ) ( IN-TRUCK ?auto_167978 ?auto_167979 ) ( TRUCK-AT ?auto_167979 ?auto_167980 ) ( IN-CITY ?auto_167980 ?auto_167982 ) ( IN-CITY ?auto_167976 ?auto_167982 ) ( not ( = ?auto_167976 ?auto_167980 ) ) ( OBJ-AT ?auto_167981 ?auto_167976 ) ( OBJ-AT ?auto_167977 ?auto_167976 ) ( not ( = ?auto_167977 ?auto_167981 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_167981 ?auto_167978 ?auto_167976 )
      ( DELIVER-2PKG-VERIFY ?auto_167977 ?auto_167978 ?auto_167976 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_167984 - OBJ
      ?auto_167985 - OBJ
      ?auto_167983 - LOCATION
    )
    :vars
    (
      ?auto_167986 - TRUCK
      ?auto_167987 - LOCATION
      ?auto_167988 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_167985 ?auto_167984 ) ) ( IN-TRUCK ?auto_167984 ?auto_167986 ) ( TRUCK-AT ?auto_167986 ?auto_167987 ) ( IN-CITY ?auto_167987 ?auto_167988 ) ( IN-CITY ?auto_167983 ?auto_167988 ) ( not ( = ?auto_167983 ?auto_167987 ) ) ( OBJ-AT ?auto_167985 ?auto_167983 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_167985 ?auto_167984 ?auto_167983 )
      ( DELIVER-2PKG-VERIFY ?auto_167984 ?auto_167985 ?auto_167983 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_167990 - OBJ
      ?auto_167991 - OBJ
      ?auto_167989 - LOCATION
    )
    :vars
    (
      ?auto_167994 - OBJ
      ?auto_167992 - TRUCK
      ?auto_167993 - LOCATION
      ?auto_167995 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_167991 ?auto_167990 ) ) ( not ( = ?auto_167990 ?auto_167994 ) ) ( IN-TRUCK ?auto_167990 ?auto_167992 ) ( TRUCK-AT ?auto_167992 ?auto_167993 ) ( IN-CITY ?auto_167993 ?auto_167995 ) ( IN-CITY ?auto_167989 ?auto_167995 ) ( not ( = ?auto_167989 ?auto_167993 ) ) ( OBJ-AT ?auto_167994 ?auto_167989 ) ( OBJ-AT ?auto_167991 ?auto_167989 ) ( not ( = ?auto_167991 ?auto_167994 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_167994 ?auto_167990 ?auto_167989 )
      ( DELIVER-2PKG-VERIFY ?auto_167990 ?auto_167991 ?auto_167989 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_167997 - OBJ
      ?auto_167998 - OBJ
      ?auto_167996 - LOCATION
    )
    :vars
    (
      ?auto_168001 - OBJ
      ?auto_167999 - TRUCK
      ?auto_168000 - LOCATION
      ?auto_168002 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_167998 ?auto_167997 ) ) ( not ( = ?auto_167997 ?auto_168001 ) ) ( IN-TRUCK ?auto_167997 ?auto_167999 ) ( TRUCK-AT ?auto_167999 ?auto_168000 ) ( IN-CITY ?auto_168000 ?auto_168002 ) ( IN-CITY ?auto_167996 ?auto_168002 ) ( not ( = ?auto_167996 ?auto_168000 ) ) ( OBJ-AT ?auto_168001 ?auto_167996 ) ( OBJ-AT ?auto_167998 ?auto_167996 ) ( not ( = ?auto_167998 ?auto_168001 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168001 ?auto_167997 ?auto_167996 )
      ( DELIVER-2PKG-VERIFY ?auto_167997 ?auto_167998 ?auto_167996 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_168018 - OBJ
      ?auto_168019 - OBJ
      ?auto_168020 - OBJ
      ?auto_168017 - LOCATION
    )
    :vars
    (
      ?auto_168021 - TRUCK
      ?auto_168022 - LOCATION
      ?auto_168023 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168019 ?auto_168018 ) ) ( not ( = ?auto_168020 ?auto_168018 ) ) ( not ( = ?auto_168020 ?auto_168019 ) ) ( IN-TRUCK ?auto_168020 ?auto_168021 ) ( TRUCK-AT ?auto_168021 ?auto_168022 ) ( IN-CITY ?auto_168022 ?auto_168023 ) ( IN-CITY ?auto_168017 ?auto_168023 ) ( not ( = ?auto_168017 ?auto_168022 ) ) ( OBJ-AT ?auto_168018 ?auto_168017 ) ( OBJ-AT ?auto_168019 ?auto_168017 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168018 ?auto_168020 ?auto_168017 )
      ( DELIVER-3PKG-VERIFY ?auto_168018 ?auto_168019 ?auto_168020 ?auto_168017 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_168025 - OBJ
      ?auto_168026 - OBJ
      ?auto_168027 - OBJ
      ?auto_168024 - LOCATION
    )
    :vars
    (
      ?auto_168028 - TRUCK
      ?auto_168029 - LOCATION
      ?auto_168030 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168026 ?auto_168025 ) ) ( not ( = ?auto_168027 ?auto_168025 ) ) ( not ( = ?auto_168027 ?auto_168026 ) ) ( IN-TRUCK ?auto_168027 ?auto_168028 ) ( TRUCK-AT ?auto_168028 ?auto_168029 ) ( IN-CITY ?auto_168029 ?auto_168030 ) ( IN-CITY ?auto_168024 ?auto_168030 ) ( not ( = ?auto_168024 ?auto_168029 ) ) ( OBJ-AT ?auto_168025 ?auto_168024 ) ( OBJ-AT ?auto_168026 ?auto_168024 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168025 ?auto_168027 ?auto_168024 )
      ( DELIVER-3PKG-VERIFY ?auto_168025 ?auto_168026 ?auto_168027 ?auto_168024 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_168039 - OBJ
      ?auto_168040 - OBJ
      ?auto_168041 - OBJ
      ?auto_168038 - LOCATION
    )
    :vars
    (
      ?auto_168042 - TRUCK
      ?auto_168043 - LOCATION
      ?auto_168044 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168040 ?auto_168039 ) ) ( not ( = ?auto_168041 ?auto_168039 ) ) ( not ( = ?auto_168041 ?auto_168040 ) ) ( IN-TRUCK ?auto_168040 ?auto_168042 ) ( TRUCK-AT ?auto_168042 ?auto_168043 ) ( IN-CITY ?auto_168043 ?auto_168044 ) ( IN-CITY ?auto_168038 ?auto_168044 ) ( not ( = ?auto_168038 ?auto_168043 ) ) ( OBJ-AT ?auto_168039 ?auto_168038 ) ( OBJ-AT ?auto_168041 ?auto_168038 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168039 ?auto_168040 ?auto_168038 )
      ( DELIVER-3PKG-VERIFY ?auto_168039 ?auto_168040 ?auto_168041 ?auto_168038 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_168046 - OBJ
      ?auto_168047 - OBJ
      ?auto_168048 - OBJ
      ?auto_168045 - LOCATION
    )
    :vars
    (
      ?auto_168049 - TRUCK
      ?auto_168050 - LOCATION
      ?auto_168051 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168047 ?auto_168046 ) ) ( not ( = ?auto_168048 ?auto_168046 ) ) ( not ( = ?auto_168048 ?auto_168047 ) ) ( IN-TRUCK ?auto_168047 ?auto_168049 ) ( TRUCK-AT ?auto_168049 ?auto_168050 ) ( IN-CITY ?auto_168050 ?auto_168051 ) ( IN-CITY ?auto_168045 ?auto_168051 ) ( not ( = ?auto_168045 ?auto_168050 ) ) ( OBJ-AT ?auto_168046 ?auto_168045 ) ( OBJ-AT ?auto_168048 ?auto_168045 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168046 ?auto_168047 ?auto_168045 )
      ( DELIVER-3PKG-VERIFY ?auto_168046 ?auto_168047 ?auto_168048 ?auto_168045 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_168060 - OBJ
      ?auto_168061 - OBJ
      ?auto_168062 - OBJ
      ?auto_168059 - LOCATION
    )
    :vars
    (
      ?auto_168063 - TRUCK
      ?auto_168064 - LOCATION
      ?auto_168065 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168061 ?auto_168060 ) ) ( not ( = ?auto_168062 ?auto_168060 ) ) ( not ( = ?auto_168062 ?auto_168061 ) ) ( IN-TRUCK ?auto_168062 ?auto_168063 ) ( TRUCK-AT ?auto_168063 ?auto_168064 ) ( IN-CITY ?auto_168064 ?auto_168065 ) ( IN-CITY ?auto_168059 ?auto_168065 ) ( not ( = ?auto_168059 ?auto_168064 ) ) ( OBJ-AT ?auto_168061 ?auto_168059 ) ( OBJ-AT ?auto_168060 ?auto_168059 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168061 ?auto_168062 ?auto_168059 )
      ( DELIVER-3PKG-VERIFY ?auto_168060 ?auto_168061 ?auto_168062 ?auto_168059 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_168075 - OBJ
      ?auto_168076 - OBJ
      ?auto_168077 - OBJ
      ?auto_168074 - LOCATION
    )
    :vars
    (
      ?auto_168080 - OBJ
      ?auto_168078 - TRUCK
      ?auto_168079 - LOCATION
      ?auto_168081 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168076 ?auto_168075 ) ) ( not ( = ?auto_168077 ?auto_168075 ) ) ( not ( = ?auto_168077 ?auto_168076 ) ) ( not ( = ?auto_168077 ?auto_168080 ) ) ( IN-TRUCK ?auto_168077 ?auto_168078 ) ( TRUCK-AT ?auto_168078 ?auto_168079 ) ( IN-CITY ?auto_168079 ?auto_168081 ) ( IN-CITY ?auto_168074 ?auto_168081 ) ( not ( = ?auto_168074 ?auto_168079 ) ) ( OBJ-AT ?auto_168080 ?auto_168074 ) ( OBJ-AT ?auto_168075 ?auto_168074 ) ( OBJ-AT ?auto_168076 ?auto_168074 ) ( not ( = ?auto_168075 ?auto_168080 ) ) ( not ( = ?auto_168076 ?auto_168080 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168080 ?auto_168077 ?auto_168074 )
      ( DELIVER-3PKG-VERIFY ?auto_168075 ?auto_168076 ?auto_168077 ?auto_168074 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_168083 - OBJ
      ?auto_168084 - OBJ
      ?auto_168085 - OBJ
      ?auto_168082 - LOCATION
    )
    :vars
    (
      ?auto_168086 - TRUCK
      ?auto_168087 - LOCATION
      ?auto_168088 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168084 ?auto_168083 ) ) ( not ( = ?auto_168085 ?auto_168083 ) ) ( not ( = ?auto_168085 ?auto_168084 ) ) ( IN-TRUCK ?auto_168084 ?auto_168086 ) ( TRUCK-AT ?auto_168086 ?auto_168087 ) ( IN-CITY ?auto_168087 ?auto_168088 ) ( IN-CITY ?auto_168082 ?auto_168088 ) ( not ( = ?auto_168082 ?auto_168087 ) ) ( OBJ-AT ?auto_168085 ?auto_168082 ) ( OBJ-AT ?auto_168083 ?auto_168082 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168085 ?auto_168084 ?auto_168082 )
      ( DELIVER-3PKG-VERIFY ?auto_168083 ?auto_168084 ?auto_168085 ?auto_168082 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_168098 - OBJ
      ?auto_168099 - OBJ
      ?auto_168100 - OBJ
      ?auto_168097 - LOCATION
    )
    :vars
    (
      ?auto_168103 - OBJ
      ?auto_168101 - TRUCK
      ?auto_168102 - LOCATION
      ?auto_168104 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168099 ?auto_168098 ) ) ( not ( = ?auto_168100 ?auto_168098 ) ) ( not ( = ?auto_168100 ?auto_168099 ) ) ( not ( = ?auto_168099 ?auto_168103 ) ) ( IN-TRUCK ?auto_168099 ?auto_168101 ) ( TRUCK-AT ?auto_168101 ?auto_168102 ) ( IN-CITY ?auto_168102 ?auto_168104 ) ( IN-CITY ?auto_168097 ?auto_168104 ) ( not ( = ?auto_168097 ?auto_168102 ) ) ( OBJ-AT ?auto_168103 ?auto_168097 ) ( OBJ-AT ?auto_168098 ?auto_168097 ) ( OBJ-AT ?auto_168100 ?auto_168097 ) ( not ( = ?auto_168098 ?auto_168103 ) ) ( not ( = ?auto_168100 ?auto_168103 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168103 ?auto_168099 ?auto_168097 )
      ( DELIVER-3PKG-VERIFY ?auto_168098 ?auto_168099 ?auto_168100 ?auto_168097 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_168114 - OBJ
      ?auto_168115 - OBJ
      ?auto_168116 - OBJ
      ?auto_168113 - LOCATION
    )
    :vars
    (
      ?auto_168117 - TRUCK
      ?auto_168118 - LOCATION
      ?auto_168119 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168115 ?auto_168114 ) ) ( not ( = ?auto_168116 ?auto_168114 ) ) ( not ( = ?auto_168116 ?auto_168115 ) ) ( IN-TRUCK ?auto_168116 ?auto_168117 ) ( TRUCK-AT ?auto_168117 ?auto_168118 ) ( IN-CITY ?auto_168118 ?auto_168119 ) ( IN-CITY ?auto_168113 ?auto_168119 ) ( not ( = ?auto_168113 ?auto_168118 ) ) ( OBJ-AT ?auto_168115 ?auto_168113 ) ( OBJ-AT ?auto_168114 ?auto_168113 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168115 ?auto_168116 ?auto_168113 )
      ( DELIVER-3PKG-VERIFY ?auto_168114 ?auto_168115 ?auto_168116 ?auto_168113 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_168121 - OBJ
      ?auto_168122 - OBJ
      ?auto_168123 - OBJ
      ?auto_168120 - LOCATION
    )
    :vars
    (
      ?auto_168126 - OBJ
      ?auto_168124 - TRUCK
      ?auto_168125 - LOCATION
      ?auto_168127 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168122 ?auto_168121 ) ) ( not ( = ?auto_168123 ?auto_168121 ) ) ( not ( = ?auto_168123 ?auto_168122 ) ) ( not ( = ?auto_168123 ?auto_168126 ) ) ( IN-TRUCK ?auto_168123 ?auto_168124 ) ( TRUCK-AT ?auto_168124 ?auto_168125 ) ( IN-CITY ?auto_168125 ?auto_168127 ) ( IN-CITY ?auto_168120 ?auto_168127 ) ( not ( = ?auto_168120 ?auto_168125 ) ) ( OBJ-AT ?auto_168126 ?auto_168120 ) ( OBJ-AT ?auto_168121 ?auto_168120 ) ( OBJ-AT ?auto_168122 ?auto_168120 ) ( not ( = ?auto_168121 ?auto_168126 ) ) ( not ( = ?auto_168122 ?auto_168126 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168126 ?auto_168123 ?auto_168120 )
      ( DELIVER-3PKG-VERIFY ?auto_168121 ?auto_168122 ?auto_168123 ?auto_168120 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_168137 - OBJ
      ?auto_168138 - OBJ
      ?auto_168139 - OBJ
      ?auto_168136 - LOCATION
    )
    :vars
    (
      ?auto_168140 - TRUCK
      ?auto_168141 - LOCATION
      ?auto_168142 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168138 ?auto_168137 ) ) ( not ( = ?auto_168139 ?auto_168137 ) ) ( not ( = ?auto_168139 ?auto_168138 ) ) ( IN-TRUCK ?auto_168138 ?auto_168140 ) ( TRUCK-AT ?auto_168140 ?auto_168141 ) ( IN-CITY ?auto_168141 ?auto_168142 ) ( IN-CITY ?auto_168136 ?auto_168142 ) ( not ( = ?auto_168136 ?auto_168141 ) ) ( OBJ-AT ?auto_168139 ?auto_168136 ) ( OBJ-AT ?auto_168137 ?auto_168136 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168139 ?auto_168138 ?auto_168136 )
      ( DELIVER-3PKG-VERIFY ?auto_168137 ?auto_168138 ?auto_168139 ?auto_168136 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_168144 - OBJ
      ?auto_168145 - OBJ
      ?auto_168146 - OBJ
      ?auto_168143 - LOCATION
    )
    :vars
    (
      ?auto_168149 - OBJ
      ?auto_168147 - TRUCK
      ?auto_168148 - LOCATION
      ?auto_168150 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168145 ?auto_168144 ) ) ( not ( = ?auto_168146 ?auto_168144 ) ) ( not ( = ?auto_168146 ?auto_168145 ) ) ( not ( = ?auto_168145 ?auto_168149 ) ) ( IN-TRUCK ?auto_168145 ?auto_168147 ) ( TRUCK-AT ?auto_168147 ?auto_168148 ) ( IN-CITY ?auto_168148 ?auto_168150 ) ( IN-CITY ?auto_168143 ?auto_168150 ) ( not ( = ?auto_168143 ?auto_168148 ) ) ( OBJ-AT ?auto_168149 ?auto_168143 ) ( OBJ-AT ?auto_168144 ?auto_168143 ) ( OBJ-AT ?auto_168146 ?auto_168143 ) ( not ( = ?auto_168144 ?auto_168149 ) ) ( not ( = ?auto_168146 ?auto_168149 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168149 ?auto_168145 ?auto_168143 )
      ( DELIVER-3PKG-VERIFY ?auto_168144 ?auto_168145 ?auto_168146 ?auto_168143 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_168175 - OBJ
      ?auto_168176 - OBJ
      ?auto_168177 - OBJ
      ?auto_168174 - LOCATION
    )
    :vars
    (
      ?auto_168178 - TRUCK
      ?auto_168179 - LOCATION
      ?auto_168180 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168176 ?auto_168175 ) ) ( not ( = ?auto_168177 ?auto_168175 ) ) ( not ( = ?auto_168177 ?auto_168176 ) ) ( IN-TRUCK ?auto_168175 ?auto_168178 ) ( TRUCK-AT ?auto_168178 ?auto_168179 ) ( IN-CITY ?auto_168179 ?auto_168180 ) ( IN-CITY ?auto_168174 ?auto_168180 ) ( not ( = ?auto_168174 ?auto_168179 ) ) ( OBJ-AT ?auto_168176 ?auto_168174 ) ( OBJ-AT ?auto_168177 ?auto_168174 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168176 ?auto_168175 ?auto_168174 )
      ( DELIVER-3PKG-VERIFY ?auto_168175 ?auto_168176 ?auto_168177 ?auto_168174 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_168182 - OBJ
      ?auto_168183 - OBJ
      ?auto_168184 - OBJ
      ?auto_168181 - LOCATION
    )
    :vars
    (
      ?auto_168185 - TRUCK
      ?auto_168186 - LOCATION
      ?auto_168187 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168183 ?auto_168182 ) ) ( not ( = ?auto_168184 ?auto_168182 ) ) ( not ( = ?auto_168184 ?auto_168183 ) ) ( IN-TRUCK ?auto_168182 ?auto_168185 ) ( TRUCK-AT ?auto_168185 ?auto_168186 ) ( IN-CITY ?auto_168186 ?auto_168187 ) ( IN-CITY ?auto_168181 ?auto_168187 ) ( not ( = ?auto_168181 ?auto_168186 ) ) ( OBJ-AT ?auto_168183 ?auto_168181 ) ( OBJ-AT ?auto_168184 ?auto_168181 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168183 ?auto_168182 ?auto_168181 )
      ( DELIVER-3PKG-VERIFY ?auto_168182 ?auto_168183 ?auto_168184 ?auto_168181 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_168196 - OBJ
      ?auto_168197 - OBJ
      ?auto_168198 - OBJ
      ?auto_168195 - LOCATION
    )
    :vars
    (
      ?auto_168199 - TRUCK
      ?auto_168200 - LOCATION
      ?auto_168201 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168197 ?auto_168196 ) ) ( not ( = ?auto_168198 ?auto_168196 ) ) ( not ( = ?auto_168198 ?auto_168197 ) ) ( IN-TRUCK ?auto_168196 ?auto_168199 ) ( TRUCK-AT ?auto_168199 ?auto_168200 ) ( IN-CITY ?auto_168200 ?auto_168201 ) ( IN-CITY ?auto_168195 ?auto_168201 ) ( not ( = ?auto_168195 ?auto_168200 ) ) ( OBJ-AT ?auto_168198 ?auto_168195 ) ( OBJ-AT ?auto_168197 ?auto_168195 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168198 ?auto_168196 ?auto_168195 )
      ( DELIVER-3PKG-VERIFY ?auto_168196 ?auto_168197 ?auto_168198 ?auto_168195 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_168211 - OBJ
      ?auto_168212 - OBJ
      ?auto_168213 - OBJ
      ?auto_168210 - LOCATION
    )
    :vars
    (
      ?auto_168216 - OBJ
      ?auto_168214 - TRUCK
      ?auto_168215 - LOCATION
      ?auto_168217 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168212 ?auto_168211 ) ) ( not ( = ?auto_168213 ?auto_168211 ) ) ( not ( = ?auto_168213 ?auto_168212 ) ) ( not ( = ?auto_168211 ?auto_168216 ) ) ( IN-TRUCK ?auto_168211 ?auto_168214 ) ( TRUCK-AT ?auto_168214 ?auto_168215 ) ( IN-CITY ?auto_168215 ?auto_168217 ) ( IN-CITY ?auto_168210 ?auto_168217 ) ( not ( = ?auto_168210 ?auto_168215 ) ) ( OBJ-AT ?auto_168216 ?auto_168210 ) ( OBJ-AT ?auto_168212 ?auto_168210 ) ( OBJ-AT ?auto_168213 ?auto_168210 ) ( not ( = ?auto_168212 ?auto_168216 ) ) ( not ( = ?auto_168213 ?auto_168216 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168216 ?auto_168211 ?auto_168210 )
      ( DELIVER-3PKG-VERIFY ?auto_168211 ?auto_168212 ?auto_168213 ?auto_168210 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_168227 - OBJ
      ?auto_168228 - OBJ
      ?auto_168229 - OBJ
      ?auto_168226 - LOCATION
    )
    :vars
    (
      ?auto_168230 - TRUCK
      ?auto_168231 - LOCATION
      ?auto_168232 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168228 ?auto_168227 ) ) ( not ( = ?auto_168229 ?auto_168227 ) ) ( not ( = ?auto_168229 ?auto_168228 ) ) ( IN-TRUCK ?auto_168227 ?auto_168230 ) ( TRUCK-AT ?auto_168230 ?auto_168231 ) ( IN-CITY ?auto_168231 ?auto_168232 ) ( IN-CITY ?auto_168226 ?auto_168232 ) ( not ( = ?auto_168226 ?auto_168231 ) ) ( OBJ-AT ?auto_168229 ?auto_168226 ) ( OBJ-AT ?auto_168228 ?auto_168226 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168229 ?auto_168227 ?auto_168226 )
      ( DELIVER-3PKG-VERIFY ?auto_168227 ?auto_168228 ?auto_168229 ?auto_168226 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_168234 - OBJ
      ?auto_168235 - OBJ
      ?auto_168236 - OBJ
      ?auto_168233 - LOCATION
    )
    :vars
    (
      ?auto_168239 - OBJ
      ?auto_168237 - TRUCK
      ?auto_168238 - LOCATION
      ?auto_168240 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168235 ?auto_168234 ) ) ( not ( = ?auto_168236 ?auto_168234 ) ) ( not ( = ?auto_168236 ?auto_168235 ) ) ( not ( = ?auto_168234 ?auto_168239 ) ) ( IN-TRUCK ?auto_168234 ?auto_168237 ) ( TRUCK-AT ?auto_168237 ?auto_168238 ) ( IN-CITY ?auto_168238 ?auto_168240 ) ( IN-CITY ?auto_168233 ?auto_168240 ) ( not ( = ?auto_168233 ?auto_168238 ) ) ( OBJ-AT ?auto_168239 ?auto_168233 ) ( OBJ-AT ?auto_168235 ?auto_168233 ) ( OBJ-AT ?auto_168236 ?auto_168233 ) ( not ( = ?auto_168235 ?auto_168239 ) ) ( not ( = ?auto_168236 ?auto_168239 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168239 ?auto_168234 ?auto_168233 )
      ( DELIVER-3PKG-VERIFY ?auto_168234 ?auto_168235 ?auto_168236 ?auto_168233 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_168361 - OBJ
      ?auto_168362 - OBJ
      ?auto_168363 - OBJ
      ?auto_168364 - OBJ
      ?auto_168360 - LOCATION
    )
    :vars
    (
      ?auto_168365 - TRUCK
      ?auto_168366 - LOCATION
      ?auto_168367 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168362 ?auto_168361 ) ) ( not ( = ?auto_168363 ?auto_168361 ) ) ( not ( = ?auto_168363 ?auto_168362 ) ) ( not ( = ?auto_168364 ?auto_168361 ) ) ( not ( = ?auto_168364 ?auto_168362 ) ) ( not ( = ?auto_168364 ?auto_168363 ) ) ( IN-TRUCK ?auto_168364 ?auto_168365 ) ( TRUCK-AT ?auto_168365 ?auto_168366 ) ( IN-CITY ?auto_168366 ?auto_168367 ) ( IN-CITY ?auto_168360 ?auto_168367 ) ( not ( = ?auto_168360 ?auto_168366 ) ) ( OBJ-AT ?auto_168361 ?auto_168360 ) ( OBJ-AT ?auto_168362 ?auto_168360 ) ( OBJ-AT ?auto_168363 ?auto_168360 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168361 ?auto_168364 ?auto_168360 )
      ( DELIVER-4PKG-VERIFY ?auto_168361 ?auto_168362 ?auto_168363 ?auto_168364 ?auto_168360 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_168385 - OBJ
      ?auto_168386 - OBJ
      ?auto_168387 - OBJ
      ?auto_168388 - OBJ
      ?auto_168384 - LOCATION
    )
    :vars
    (
      ?auto_168389 - TRUCK
      ?auto_168390 - LOCATION
      ?auto_168391 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168386 ?auto_168385 ) ) ( not ( = ?auto_168387 ?auto_168385 ) ) ( not ( = ?auto_168387 ?auto_168386 ) ) ( not ( = ?auto_168388 ?auto_168385 ) ) ( not ( = ?auto_168388 ?auto_168386 ) ) ( not ( = ?auto_168388 ?auto_168387 ) ) ( IN-TRUCK ?auto_168387 ?auto_168389 ) ( TRUCK-AT ?auto_168389 ?auto_168390 ) ( IN-CITY ?auto_168390 ?auto_168391 ) ( IN-CITY ?auto_168384 ?auto_168391 ) ( not ( = ?auto_168384 ?auto_168390 ) ) ( OBJ-AT ?auto_168385 ?auto_168384 ) ( OBJ-AT ?auto_168386 ?auto_168384 ) ( OBJ-AT ?auto_168388 ?auto_168384 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168385 ?auto_168387 ?auto_168384 )
      ( DELIVER-4PKG-VERIFY ?auto_168385 ?auto_168386 ?auto_168387 ?auto_168388 ?auto_168384 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_168409 - OBJ
      ?auto_168410 - OBJ
      ?auto_168411 - OBJ
      ?auto_168412 - OBJ
      ?auto_168408 - LOCATION
    )
    :vars
    (
      ?auto_168413 - TRUCK
      ?auto_168414 - LOCATION
      ?auto_168415 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168410 ?auto_168409 ) ) ( not ( = ?auto_168411 ?auto_168409 ) ) ( not ( = ?auto_168411 ?auto_168410 ) ) ( not ( = ?auto_168412 ?auto_168409 ) ) ( not ( = ?auto_168412 ?auto_168410 ) ) ( not ( = ?auto_168412 ?auto_168411 ) ) ( IN-TRUCK ?auto_168412 ?auto_168413 ) ( TRUCK-AT ?auto_168413 ?auto_168414 ) ( IN-CITY ?auto_168414 ?auto_168415 ) ( IN-CITY ?auto_168408 ?auto_168415 ) ( not ( = ?auto_168408 ?auto_168414 ) ) ( OBJ-AT ?auto_168409 ?auto_168408 ) ( OBJ-AT ?auto_168410 ?auto_168408 ) ( OBJ-AT ?auto_168411 ?auto_168408 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168409 ?auto_168412 ?auto_168408 )
      ( DELIVER-4PKG-VERIFY ?auto_168409 ?auto_168410 ?auto_168411 ?auto_168412 ?auto_168408 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_168433 - OBJ
      ?auto_168434 - OBJ
      ?auto_168435 - OBJ
      ?auto_168436 - OBJ
      ?auto_168432 - LOCATION
    )
    :vars
    (
      ?auto_168437 - TRUCK
      ?auto_168438 - LOCATION
      ?auto_168439 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168434 ?auto_168433 ) ) ( not ( = ?auto_168435 ?auto_168433 ) ) ( not ( = ?auto_168435 ?auto_168434 ) ) ( not ( = ?auto_168436 ?auto_168433 ) ) ( not ( = ?auto_168436 ?auto_168434 ) ) ( not ( = ?auto_168436 ?auto_168435 ) ) ( IN-TRUCK ?auto_168435 ?auto_168437 ) ( TRUCK-AT ?auto_168437 ?auto_168438 ) ( IN-CITY ?auto_168438 ?auto_168439 ) ( IN-CITY ?auto_168432 ?auto_168439 ) ( not ( = ?auto_168432 ?auto_168438 ) ) ( OBJ-AT ?auto_168433 ?auto_168432 ) ( OBJ-AT ?auto_168434 ?auto_168432 ) ( OBJ-AT ?auto_168436 ?auto_168432 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168433 ?auto_168435 ?auto_168432 )
      ( DELIVER-4PKG-VERIFY ?auto_168433 ?auto_168434 ?auto_168435 ?auto_168436 ?auto_168432 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_168505 - OBJ
      ?auto_168506 - OBJ
      ?auto_168507 - OBJ
      ?auto_168508 - OBJ
      ?auto_168504 - LOCATION
    )
    :vars
    (
      ?auto_168509 - TRUCK
      ?auto_168510 - LOCATION
      ?auto_168511 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168506 ?auto_168505 ) ) ( not ( = ?auto_168507 ?auto_168505 ) ) ( not ( = ?auto_168507 ?auto_168506 ) ) ( not ( = ?auto_168508 ?auto_168505 ) ) ( not ( = ?auto_168508 ?auto_168506 ) ) ( not ( = ?auto_168508 ?auto_168507 ) ) ( IN-TRUCK ?auto_168506 ?auto_168509 ) ( TRUCK-AT ?auto_168509 ?auto_168510 ) ( IN-CITY ?auto_168510 ?auto_168511 ) ( IN-CITY ?auto_168504 ?auto_168511 ) ( not ( = ?auto_168504 ?auto_168510 ) ) ( OBJ-AT ?auto_168505 ?auto_168504 ) ( OBJ-AT ?auto_168507 ?auto_168504 ) ( OBJ-AT ?auto_168508 ?auto_168504 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168505 ?auto_168506 ?auto_168504 )
      ( DELIVER-4PKG-VERIFY ?auto_168505 ?auto_168506 ?auto_168507 ?auto_168508 ?auto_168504 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_168529 - OBJ
      ?auto_168530 - OBJ
      ?auto_168531 - OBJ
      ?auto_168532 - OBJ
      ?auto_168528 - LOCATION
    )
    :vars
    (
      ?auto_168533 - TRUCK
      ?auto_168534 - LOCATION
      ?auto_168535 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168530 ?auto_168529 ) ) ( not ( = ?auto_168531 ?auto_168529 ) ) ( not ( = ?auto_168531 ?auto_168530 ) ) ( not ( = ?auto_168532 ?auto_168529 ) ) ( not ( = ?auto_168532 ?auto_168530 ) ) ( not ( = ?auto_168532 ?auto_168531 ) ) ( IN-TRUCK ?auto_168530 ?auto_168533 ) ( TRUCK-AT ?auto_168533 ?auto_168534 ) ( IN-CITY ?auto_168534 ?auto_168535 ) ( IN-CITY ?auto_168528 ?auto_168535 ) ( not ( = ?auto_168528 ?auto_168534 ) ) ( OBJ-AT ?auto_168529 ?auto_168528 ) ( OBJ-AT ?auto_168531 ?auto_168528 ) ( OBJ-AT ?auto_168532 ?auto_168528 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168529 ?auto_168530 ?auto_168528 )
      ( DELIVER-4PKG-VERIFY ?auto_168529 ?auto_168530 ?auto_168531 ?auto_168532 ?auto_168528 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_168601 - OBJ
      ?auto_168602 - OBJ
      ?auto_168603 - OBJ
      ?auto_168604 - OBJ
      ?auto_168600 - LOCATION
    )
    :vars
    (
      ?auto_168605 - TRUCK
      ?auto_168606 - LOCATION
      ?auto_168607 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168602 ?auto_168601 ) ) ( not ( = ?auto_168603 ?auto_168601 ) ) ( not ( = ?auto_168603 ?auto_168602 ) ) ( not ( = ?auto_168604 ?auto_168601 ) ) ( not ( = ?auto_168604 ?auto_168602 ) ) ( not ( = ?auto_168604 ?auto_168603 ) ) ( IN-TRUCK ?auto_168604 ?auto_168605 ) ( TRUCK-AT ?auto_168605 ?auto_168606 ) ( IN-CITY ?auto_168606 ?auto_168607 ) ( IN-CITY ?auto_168600 ?auto_168607 ) ( not ( = ?auto_168600 ?auto_168606 ) ) ( OBJ-AT ?auto_168602 ?auto_168600 ) ( OBJ-AT ?auto_168601 ?auto_168600 ) ( OBJ-AT ?auto_168603 ?auto_168600 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168602 ?auto_168604 ?auto_168600 )
      ( DELIVER-4PKG-VERIFY ?auto_168601 ?auto_168602 ?auto_168603 ?auto_168604 ?auto_168600 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_168625 - OBJ
      ?auto_168626 - OBJ
      ?auto_168627 - OBJ
      ?auto_168628 - OBJ
      ?auto_168624 - LOCATION
    )
    :vars
    (
      ?auto_168629 - TRUCK
      ?auto_168630 - LOCATION
      ?auto_168631 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168626 ?auto_168625 ) ) ( not ( = ?auto_168627 ?auto_168625 ) ) ( not ( = ?auto_168627 ?auto_168626 ) ) ( not ( = ?auto_168628 ?auto_168625 ) ) ( not ( = ?auto_168628 ?auto_168626 ) ) ( not ( = ?auto_168628 ?auto_168627 ) ) ( IN-TRUCK ?auto_168627 ?auto_168629 ) ( TRUCK-AT ?auto_168629 ?auto_168630 ) ( IN-CITY ?auto_168630 ?auto_168631 ) ( IN-CITY ?auto_168624 ?auto_168631 ) ( not ( = ?auto_168624 ?auto_168630 ) ) ( OBJ-AT ?auto_168626 ?auto_168624 ) ( OBJ-AT ?auto_168625 ?auto_168624 ) ( OBJ-AT ?auto_168628 ?auto_168624 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168626 ?auto_168627 ?auto_168624 )
      ( DELIVER-4PKG-VERIFY ?auto_168625 ?auto_168626 ?auto_168627 ?auto_168628 ?auto_168624 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_168702 - OBJ
      ?auto_168703 - OBJ
      ?auto_168704 - OBJ
      ?auto_168705 - OBJ
      ?auto_168701 - LOCATION
    )
    :vars
    (
      ?auto_168706 - TRUCK
      ?auto_168707 - LOCATION
      ?auto_168708 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168703 ?auto_168702 ) ) ( not ( = ?auto_168704 ?auto_168702 ) ) ( not ( = ?auto_168704 ?auto_168703 ) ) ( not ( = ?auto_168705 ?auto_168702 ) ) ( not ( = ?auto_168705 ?auto_168703 ) ) ( not ( = ?auto_168705 ?auto_168704 ) ) ( IN-TRUCK ?auto_168705 ?auto_168706 ) ( TRUCK-AT ?auto_168706 ?auto_168707 ) ( IN-CITY ?auto_168707 ?auto_168708 ) ( IN-CITY ?auto_168701 ?auto_168708 ) ( not ( = ?auto_168701 ?auto_168707 ) ) ( OBJ-AT ?auto_168704 ?auto_168701 ) ( OBJ-AT ?auto_168702 ?auto_168701 ) ( OBJ-AT ?auto_168703 ?auto_168701 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168704 ?auto_168705 ?auto_168701 )
      ( DELIVER-4PKG-VERIFY ?auto_168702 ?auto_168703 ?auto_168704 ?auto_168705 ?auto_168701 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_168728 - OBJ
      ?auto_168729 - OBJ
      ?auto_168730 - OBJ
      ?auto_168731 - OBJ
      ?auto_168727 - LOCATION
    )
    :vars
    (
      ?auto_168732 - TRUCK
      ?auto_168733 - LOCATION
      ?auto_168734 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168729 ?auto_168728 ) ) ( not ( = ?auto_168730 ?auto_168728 ) ) ( not ( = ?auto_168730 ?auto_168729 ) ) ( not ( = ?auto_168731 ?auto_168728 ) ) ( not ( = ?auto_168731 ?auto_168729 ) ) ( not ( = ?auto_168731 ?auto_168730 ) ) ( IN-TRUCK ?auto_168730 ?auto_168732 ) ( TRUCK-AT ?auto_168732 ?auto_168733 ) ( IN-CITY ?auto_168733 ?auto_168734 ) ( IN-CITY ?auto_168727 ?auto_168734 ) ( not ( = ?auto_168727 ?auto_168733 ) ) ( OBJ-AT ?auto_168731 ?auto_168727 ) ( OBJ-AT ?auto_168728 ?auto_168727 ) ( OBJ-AT ?auto_168729 ?auto_168727 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168731 ?auto_168730 ?auto_168727 )
      ( DELIVER-4PKG-VERIFY ?auto_168728 ?auto_168729 ?auto_168730 ?auto_168731 ?auto_168727 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_168779 - OBJ
      ?auto_168780 - OBJ
      ?auto_168781 - OBJ
      ?auto_168782 - OBJ
      ?auto_168778 - LOCATION
    )
    :vars
    (
      ?auto_168783 - TRUCK
      ?auto_168784 - LOCATION
      ?auto_168785 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168780 ?auto_168779 ) ) ( not ( = ?auto_168781 ?auto_168779 ) ) ( not ( = ?auto_168781 ?auto_168780 ) ) ( not ( = ?auto_168782 ?auto_168779 ) ) ( not ( = ?auto_168782 ?auto_168780 ) ) ( not ( = ?auto_168782 ?auto_168781 ) ) ( IN-TRUCK ?auto_168780 ?auto_168783 ) ( TRUCK-AT ?auto_168783 ?auto_168784 ) ( IN-CITY ?auto_168784 ?auto_168785 ) ( IN-CITY ?auto_168778 ?auto_168785 ) ( not ( = ?auto_168778 ?auto_168784 ) ) ( OBJ-AT ?auto_168781 ?auto_168778 ) ( OBJ-AT ?auto_168779 ?auto_168778 ) ( OBJ-AT ?auto_168782 ?auto_168778 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168781 ?auto_168780 ?auto_168778 )
      ( DELIVER-4PKG-VERIFY ?auto_168779 ?auto_168780 ?auto_168781 ?auto_168782 ?auto_168778 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_168830 - OBJ
      ?auto_168831 - OBJ
      ?auto_168832 - OBJ
      ?auto_168833 - OBJ
      ?auto_168829 - LOCATION
    )
    :vars
    (
      ?auto_168834 - TRUCK
      ?auto_168835 - LOCATION
      ?auto_168836 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168831 ?auto_168830 ) ) ( not ( = ?auto_168832 ?auto_168830 ) ) ( not ( = ?auto_168832 ?auto_168831 ) ) ( not ( = ?auto_168833 ?auto_168830 ) ) ( not ( = ?auto_168833 ?auto_168831 ) ) ( not ( = ?auto_168833 ?auto_168832 ) ) ( IN-TRUCK ?auto_168831 ?auto_168834 ) ( TRUCK-AT ?auto_168834 ?auto_168835 ) ( IN-CITY ?auto_168835 ?auto_168836 ) ( IN-CITY ?auto_168829 ?auto_168836 ) ( not ( = ?auto_168829 ?auto_168835 ) ) ( OBJ-AT ?auto_168833 ?auto_168829 ) ( OBJ-AT ?auto_168830 ?auto_168829 ) ( OBJ-AT ?auto_168832 ?auto_168829 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168833 ?auto_168831 ?auto_168829 )
      ( DELIVER-4PKG-VERIFY ?auto_168830 ?auto_168831 ?auto_168832 ?auto_168833 ?auto_168829 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_168908 - OBJ
      ?auto_168909 - OBJ
      ?auto_168910 - OBJ
      ?auto_168911 - OBJ
      ?auto_168907 - LOCATION
    )
    :vars
    (
      ?auto_168912 - TRUCK
      ?auto_168913 - LOCATION
      ?auto_168914 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168909 ?auto_168908 ) ) ( not ( = ?auto_168910 ?auto_168908 ) ) ( not ( = ?auto_168910 ?auto_168909 ) ) ( not ( = ?auto_168911 ?auto_168908 ) ) ( not ( = ?auto_168911 ?auto_168909 ) ) ( not ( = ?auto_168911 ?auto_168910 ) ) ( IN-TRUCK ?auto_168911 ?auto_168912 ) ( TRUCK-AT ?auto_168912 ?auto_168913 ) ( IN-CITY ?auto_168913 ?auto_168914 ) ( IN-CITY ?auto_168907 ?auto_168914 ) ( not ( = ?auto_168907 ?auto_168913 ) ) ( OBJ-AT ?auto_168909 ?auto_168907 ) ( OBJ-AT ?auto_168908 ?auto_168907 ) ( OBJ-AT ?auto_168910 ?auto_168907 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168909 ?auto_168911 ?auto_168907 )
      ( DELIVER-4PKG-VERIFY ?auto_168908 ?auto_168909 ?auto_168910 ?auto_168911 ?auto_168907 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_168932 - OBJ
      ?auto_168933 - OBJ
      ?auto_168934 - OBJ
      ?auto_168935 - OBJ
      ?auto_168931 - LOCATION
    )
    :vars
    (
      ?auto_168936 - TRUCK
      ?auto_168937 - LOCATION
      ?auto_168938 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168933 ?auto_168932 ) ) ( not ( = ?auto_168934 ?auto_168932 ) ) ( not ( = ?auto_168934 ?auto_168933 ) ) ( not ( = ?auto_168935 ?auto_168932 ) ) ( not ( = ?auto_168935 ?auto_168933 ) ) ( not ( = ?auto_168935 ?auto_168934 ) ) ( IN-TRUCK ?auto_168934 ?auto_168936 ) ( TRUCK-AT ?auto_168936 ?auto_168937 ) ( IN-CITY ?auto_168937 ?auto_168938 ) ( IN-CITY ?auto_168931 ?auto_168938 ) ( not ( = ?auto_168931 ?auto_168937 ) ) ( OBJ-AT ?auto_168933 ?auto_168931 ) ( OBJ-AT ?auto_168932 ?auto_168931 ) ( OBJ-AT ?auto_168935 ?auto_168931 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168933 ?auto_168934 ?auto_168931 )
      ( DELIVER-4PKG-VERIFY ?auto_168932 ?auto_168933 ?auto_168934 ?auto_168935 ?auto_168931 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_168956 - OBJ
      ?auto_168957 - OBJ
      ?auto_168958 - OBJ
      ?auto_168959 - OBJ
      ?auto_168955 - LOCATION
    )
    :vars
    (
      ?auto_168960 - TRUCK
      ?auto_168961 - LOCATION
      ?auto_168962 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168957 ?auto_168956 ) ) ( not ( = ?auto_168958 ?auto_168956 ) ) ( not ( = ?auto_168958 ?auto_168957 ) ) ( not ( = ?auto_168959 ?auto_168956 ) ) ( not ( = ?auto_168959 ?auto_168957 ) ) ( not ( = ?auto_168959 ?auto_168958 ) ) ( IN-TRUCK ?auto_168959 ?auto_168960 ) ( TRUCK-AT ?auto_168960 ?auto_168961 ) ( IN-CITY ?auto_168961 ?auto_168962 ) ( IN-CITY ?auto_168955 ?auto_168962 ) ( not ( = ?auto_168955 ?auto_168961 ) ) ( OBJ-AT ?auto_168958 ?auto_168955 ) ( OBJ-AT ?auto_168956 ?auto_168955 ) ( OBJ-AT ?auto_168957 ?auto_168955 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168958 ?auto_168959 ?auto_168955 )
      ( DELIVER-4PKG-VERIFY ?auto_168956 ?auto_168957 ?auto_168958 ?auto_168959 ?auto_168955 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_168982 - OBJ
      ?auto_168983 - OBJ
      ?auto_168984 - OBJ
      ?auto_168985 - OBJ
      ?auto_168981 - LOCATION
    )
    :vars
    (
      ?auto_168986 - TRUCK
      ?auto_168987 - LOCATION
      ?auto_168988 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_168983 ?auto_168982 ) ) ( not ( = ?auto_168984 ?auto_168982 ) ) ( not ( = ?auto_168984 ?auto_168983 ) ) ( not ( = ?auto_168985 ?auto_168982 ) ) ( not ( = ?auto_168985 ?auto_168983 ) ) ( not ( = ?auto_168985 ?auto_168984 ) ) ( IN-TRUCK ?auto_168984 ?auto_168986 ) ( TRUCK-AT ?auto_168986 ?auto_168987 ) ( IN-CITY ?auto_168987 ?auto_168988 ) ( IN-CITY ?auto_168981 ?auto_168988 ) ( not ( = ?auto_168981 ?auto_168987 ) ) ( OBJ-AT ?auto_168985 ?auto_168981 ) ( OBJ-AT ?auto_168982 ?auto_168981 ) ( OBJ-AT ?auto_168983 ?auto_168981 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168985 ?auto_168984 ?auto_168981 )
      ( DELIVER-4PKG-VERIFY ?auto_168982 ?auto_168983 ?auto_168984 ?auto_168985 ?auto_168981 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_169086 - OBJ
      ?auto_169087 - OBJ
      ?auto_169088 - OBJ
      ?auto_169089 - OBJ
      ?auto_169085 - LOCATION
    )
    :vars
    (
      ?auto_169090 - TRUCK
      ?auto_169091 - LOCATION
      ?auto_169092 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169087 ?auto_169086 ) ) ( not ( = ?auto_169088 ?auto_169086 ) ) ( not ( = ?auto_169088 ?auto_169087 ) ) ( not ( = ?auto_169089 ?auto_169086 ) ) ( not ( = ?auto_169089 ?auto_169087 ) ) ( not ( = ?auto_169089 ?auto_169088 ) ) ( IN-TRUCK ?auto_169087 ?auto_169090 ) ( TRUCK-AT ?auto_169090 ?auto_169091 ) ( IN-CITY ?auto_169091 ?auto_169092 ) ( IN-CITY ?auto_169085 ?auto_169092 ) ( not ( = ?auto_169085 ?auto_169091 ) ) ( OBJ-AT ?auto_169088 ?auto_169085 ) ( OBJ-AT ?auto_169086 ?auto_169085 ) ( OBJ-AT ?auto_169089 ?auto_169085 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169088 ?auto_169087 ?auto_169085 )
      ( DELIVER-4PKG-VERIFY ?auto_169086 ?auto_169087 ?auto_169088 ?auto_169089 ?auto_169085 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_169110 - OBJ
      ?auto_169111 - OBJ
      ?auto_169112 - OBJ
      ?auto_169113 - OBJ
      ?auto_169109 - LOCATION
    )
    :vars
    (
      ?auto_169114 - TRUCK
      ?auto_169115 - LOCATION
      ?auto_169116 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169111 ?auto_169110 ) ) ( not ( = ?auto_169112 ?auto_169110 ) ) ( not ( = ?auto_169112 ?auto_169111 ) ) ( not ( = ?auto_169113 ?auto_169110 ) ) ( not ( = ?auto_169113 ?auto_169111 ) ) ( not ( = ?auto_169113 ?auto_169112 ) ) ( IN-TRUCK ?auto_169111 ?auto_169114 ) ( TRUCK-AT ?auto_169114 ?auto_169115 ) ( IN-CITY ?auto_169115 ?auto_169116 ) ( IN-CITY ?auto_169109 ?auto_169116 ) ( not ( = ?auto_169109 ?auto_169115 ) ) ( OBJ-AT ?auto_169113 ?auto_169109 ) ( OBJ-AT ?auto_169110 ?auto_169109 ) ( OBJ-AT ?auto_169112 ?auto_169109 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169113 ?auto_169111 ?auto_169109 )
      ( DELIVER-4PKG-VERIFY ?auto_169110 ?auto_169111 ?auto_169112 ?auto_169113 ?auto_169109 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_169263 - OBJ
      ?auto_169264 - OBJ
      ?auto_169265 - OBJ
      ?auto_169266 - OBJ
      ?auto_169262 - LOCATION
    )
    :vars
    (
      ?auto_169267 - TRUCK
      ?auto_169268 - LOCATION
      ?auto_169269 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169264 ?auto_169263 ) ) ( not ( = ?auto_169265 ?auto_169263 ) ) ( not ( = ?auto_169265 ?auto_169264 ) ) ( not ( = ?auto_169266 ?auto_169263 ) ) ( not ( = ?auto_169266 ?auto_169264 ) ) ( not ( = ?auto_169266 ?auto_169265 ) ) ( IN-TRUCK ?auto_169263 ?auto_169267 ) ( TRUCK-AT ?auto_169267 ?auto_169268 ) ( IN-CITY ?auto_169268 ?auto_169269 ) ( IN-CITY ?auto_169262 ?auto_169269 ) ( not ( = ?auto_169262 ?auto_169268 ) ) ( OBJ-AT ?auto_169264 ?auto_169262 ) ( OBJ-AT ?auto_169265 ?auto_169262 ) ( OBJ-AT ?auto_169266 ?auto_169262 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169264 ?auto_169263 ?auto_169262 )
      ( DELIVER-4PKG-VERIFY ?auto_169263 ?auto_169264 ?auto_169265 ?auto_169266 ?auto_169262 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_169287 - OBJ
      ?auto_169288 - OBJ
      ?auto_169289 - OBJ
      ?auto_169290 - OBJ
      ?auto_169286 - LOCATION
    )
    :vars
    (
      ?auto_169291 - TRUCK
      ?auto_169292 - LOCATION
      ?auto_169293 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169288 ?auto_169287 ) ) ( not ( = ?auto_169289 ?auto_169287 ) ) ( not ( = ?auto_169289 ?auto_169288 ) ) ( not ( = ?auto_169290 ?auto_169287 ) ) ( not ( = ?auto_169290 ?auto_169288 ) ) ( not ( = ?auto_169290 ?auto_169289 ) ) ( IN-TRUCK ?auto_169287 ?auto_169291 ) ( TRUCK-AT ?auto_169291 ?auto_169292 ) ( IN-CITY ?auto_169292 ?auto_169293 ) ( IN-CITY ?auto_169286 ?auto_169293 ) ( not ( = ?auto_169286 ?auto_169292 ) ) ( OBJ-AT ?auto_169288 ?auto_169286 ) ( OBJ-AT ?auto_169289 ?auto_169286 ) ( OBJ-AT ?auto_169290 ?auto_169286 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169288 ?auto_169287 ?auto_169286 )
      ( DELIVER-4PKG-VERIFY ?auto_169287 ?auto_169288 ?auto_169289 ?auto_169290 ?auto_169286 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_169359 - OBJ
      ?auto_169360 - OBJ
      ?auto_169361 - OBJ
      ?auto_169362 - OBJ
      ?auto_169358 - LOCATION
    )
    :vars
    (
      ?auto_169363 - TRUCK
      ?auto_169364 - LOCATION
      ?auto_169365 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169360 ?auto_169359 ) ) ( not ( = ?auto_169361 ?auto_169359 ) ) ( not ( = ?auto_169361 ?auto_169360 ) ) ( not ( = ?auto_169362 ?auto_169359 ) ) ( not ( = ?auto_169362 ?auto_169360 ) ) ( not ( = ?auto_169362 ?auto_169361 ) ) ( IN-TRUCK ?auto_169359 ?auto_169363 ) ( TRUCK-AT ?auto_169363 ?auto_169364 ) ( IN-CITY ?auto_169364 ?auto_169365 ) ( IN-CITY ?auto_169358 ?auto_169365 ) ( not ( = ?auto_169358 ?auto_169364 ) ) ( OBJ-AT ?auto_169361 ?auto_169358 ) ( OBJ-AT ?auto_169360 ?auto_169358 ) ( OBJ-AT ?auto_169362 ?auto_169358 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169361 ?auto_169359 ?auto_169358 )
      ( DELIVER-4PKG-VERIFY ?auto_169359 ?auto_169360 ?auto_169361 ?auto_169362 ?auto_169358 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_169410 - OBJ
      ?auto_169411 - OBJ
      ?auto_169412 - OBJ
      ?auto_169413 - OBJ
      ?auto_169409 - LOCATION
    )
    :vars
    (
      ?auto_169414 - TRUCK
      ?auto_169415 - LOCATION
      ?auto_169416 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169411 ?auto_169410 ) ) ( not ( = ?auto_169412 ?auto_169410 ) ) ( not ( = ?auto_169412 ?auto_169411 ) ) ( not ( = ?auto_169413 ?auto_169410 ) ) ( not ( = ?auto_169413 ?auto_169411 ) ) ( not ( = ?auto_169413 ?auto_169412 ) ) ( IN-TRUCK ?auto_169410 ?auto_169414 ) ( TRUCK-AT ?auto_169414 ?auto_169415 ) ( IN-CITY ?auto_169415 ?auto_169416 ) ( IN-CITY ?auto_169409 ?auto_169416 ) ( not ( = ?auto_169409 ?auto_169415 ) ) ( OBJ-AT ?auto_169413 ?auto_169409 ) ( OBJ-AT ?auto_169411 ?auto_169409 ) ( OBJ-AT ?auto_169412 ?auto_169409 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169413 ?auto_169410 ?auto_169409 )
      ( DELIVER-4PKG-VERIFY ?auto_169410 ?auto_169411 ?auto_169412 ?auto_169413 ?auto_169409 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_169488 - OBJ
      ?auto_169489 - OBJ
      ?auto_169490 - OBJ
      ?auto_169491 - OBJ
      ?auto_169487 - LOCATION
    )
    :vars
    (
      ?auto_169492 - TRUCK
      ?auto_169493 - LOCATION
      ?auto_169494 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169489 ?auto_169488 ) ) ( not ( = ?auto_169490 ?auto_169488 ) ) ( not ( = ?auto_169490 ?auto_169489 ) ) ( not ( = ?auto_169491 ?auto_169488 ) ) ( not ( = ?auto_169491 ?auto_169489 ) ) ( not ( = ?auto_169491 ?auto_169490 ) ) ( IN-TRUCK ?auto_169488 ?auto_169492 ) ( TRUCK-AT ?auto_169492 ?auto_169493 ) ( IN-CITY ?auto_169493 ?auto_169494 ) ( IN-CITY ?auto_169487 ?auto_169494 ) ( not ( = ?auto_169487 ?auto_169493 ) ) ( OBJ-AT ?auto_169490 ?auto_169487 ) ( OBJ-AT ?auto_169489 ?auto_169487 ) ( OBJ-AT ?auto_169491 ?auto_169487 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169490 ?auto_169488 ?auto_169487 )
      ( DELIVER-4PKG-VERIFY ?auto_169488 ?auto_169489 ?auto_169490 ?auto_169491 ?auto_169487 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_169512 - OBJ
      ?auto_169513 - OBJ
      ?auto_169514 - OBJ
      ?auto_169515 - OBJ
      ?auto_169511 - LOCATION
    )
    :vars
    (
      ?auto_169516 - TRUCK
      ?auto_169517 - LOCATION
      ?auto_169518 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169513 ?auto_169512 ) ) ( not ( = ?auto_169514 ?auto_169512 ) ) ( not ( = ?auto_169514 ?auto_169513 ) ) ( not ( = ?auto_169515 ?auto_169512 ) ) ( not ( = ?auto_169515 ?auto_169513 ) ) ( not ( = ?auto_169515 ?auto_169514 ) ) ( IN-TRUCK ?auto_169512 ?auto_169516 ) ( TRUCK-AT ?auto_169516 ?auto_169517 ) ( IN-CITY ?auto_169517 ?auto_169518 ) ( IN-CITY ?auto_169511 ?auto_169518 ) ( not ( = ?auto_169511 ?auto_169517 ) ) ( OBJ-AT ?auto_169515 ?auto_169511 ) ( OBJ-AT ?auto_169513 ?auto_169511 ) ( OBJ-AT ?auto_169514 ?auto_169511 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169515 ?auto_169512 ?auto_169511 )
      ( DELIVER-4PKG-VERIFY ?auto_169512 ?auto_169513 ?auto_169514 ?auto_169515 ?auto_169511 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_169754 - OBJ
      ?auto_169753 - LOCATION
    )
    :vars
    (
      ?auto_169757 - OBJ
      ?auto_169755 - TRUCK
      ?auto_169756 - LOCATION
      ?auto_169758 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169754 ?auto_169757 ) ) ( TRUCK-AT ?auto_169755 ?auto_169756 ) ( IN-CITY ?auto_169756 ?auto_169758 ) ( IN-CITY ?auto_169753 ?auto_169758 ) ( not ( = ?auto_169753 ?auto_169756 ) ) ( OBJ-AT ?auto_169757 ?auto_169753 ) ( OBJ-AT ?auto_169754 ?auto_169756 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_169754 ?auto_169755 ?auto_169756 )
      ( DELIVER-2PKG ?auto_169757 ?auto_169754 ?auto_169753 )
      ( DELIVER-1PKG-VERIFY ?auto_169754 ?auto_169753 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_169760 - OBJ
      ?auto_169761 - OBJ
      ?auto_169759 - LOCATION
    )
    :vars
    (
      ?auto_169762 - TRUCK
      ?auto_169764 - LOCATION
      ?auto_169763 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169761 ?auto_169760 ) ) ( TRUCK-AT ?auto_169762 ?auto_169764 ) ( IN-CITY ?auto_169764 ?auto_169763 ) ( IN-CITY ?auto_169759 ?auto_169763 ) ( not ( = ?auto_169759 ?auto_169764 ) ) ( OBJ-AT ?auto_169760 ?auto_169759 ) ( OBJ-AT ?auto_169761 ?auto_169764 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_169761 ?auto_169759 )
      ( DELIVER-2PKG-VERIFY ?auto_169760 ?auto_169761 ?auto_169759 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_169766 - OBJ
      ?auto_169767 - OBJ
      ?auto_169765 - LOCATION
    )
    :vars
    (
      ?auto_169768 - OBJ
      ?auto_169769 - TRUCK
      ?auto_169771 - LOCATION
      ?auto_169770 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169767 ?auto_169766 ) ) ( not ( = ?auto_169767 ?auto_169768 ) ) ( TRUCK-AT ?auto_169769 ?auto_169771 ) ( IN-CITY ?auto_169771 ?auto_169770 ) ( IN-CITY ?auto_169765 ?auto_169770 ) ( not ( = ?auto_169765 ?auto_169771 ) ) ( OBJ-AT ?auto_169768 ?auto_169765 ) ( OBJ-AT ?auto_169767 ?auto_169771 ) ( OBJ-AT ?auto_169766 ?auto_169765 ) ( not ( = ?auto_169766 ?auto_169768 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169768 ?auto_169767 ?auto_169765 )
      ( DELIVER-2PKG-VERIFY ?auto_169766 ?auto_169767 ?auto_169765 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_169773 - OBJ
      ?auto_169774 - OBJ
      ?auto_169772 - LOCATION
    )
    :vars
    (
      ?auto_169775 - OBJ
      ?auto_169776 - TRUCK
      ?auto_169778 - LOCATION
      ?auto_169777 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169774 ?auto_169773 ) ) ( not ( = ?auto_169774 ?auto_169775 ) ) ( TRUCK-AT ?auto_169776 ?auto_169778 ) ( IN-CITY ?auto_169778 ?auto_169777 ) ( IN-CITY ?auto_169772 ?auto_169777 ) ( not ( = ?auto_169772 ?auto_169778 ) ) ( OBJ-AT ?auto_169775 ?auto_169772 ) ( OBJ-AT ?auto_169774 ?auto_169778 ) ( OBJ-AT ?auto_169773 ?auto_169772 ) ( not ( = ?auto_169773 ?auto_169775 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169775 ?auto_169774 ?auto_169772 )
      ( DELIVER-2PKG-VERIFY ?auto_169773 ?auto_169774 ?auto_169772 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_169780 - OBJ
      ?auto_169781 - OBJ
      ?auto_169779 - LOCATION
    )
    :vars
    (
      ?auto_169782 - TRUCK
      ?auto_169784 - LOCATION
      ?auto_169783 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169781 ?auto_169780 ) ) ( TRUCK-AT ?auto_169782 ?auto_169784 ) ( IN-CITY ?auto_169784 ?auto_169783 ) ( IN-CITY ?auto_169779 ?auto_169783 ) ( not ( = ?auto_169779 ?auto_169784 ) ) ( OBJ-AT ?auto_169781 ?auto_169779 ) ( OBJ-AT ?auto_169780 ?auto_169784 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169781 ?auto_169780 ?auto_169779 )
      ( DELIVER-2PKG-VERIFY ?auto_169780 ?auto_169781 ?auto_169779 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_169786 - OBJ
      ?auto_169787 - OBJ
      ?auto_169785 - LOCATION
    )
    :vars
    (
      ?auto_169788 - OBJ
      ?auto_169789 - TRUCK
      ?auto_169791 - LOCATION
      ?auto_169790 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169787 ?auto_169786 ) ) ( not ( = ?auto_169786 ?auto_169788 ) ) ( TRUCK-AT ?auto_169789 ?auto_169791 ) ( IN-CITY ?auto_169791 ?auto_169790 ) ( IN-CITY ?auto_169785 ?auto_169790 ) ( not ( = ?auto_169785 ?auto_169791 ) ) ( OBJ-AT ?auto_169788 ?auto_169785 ) ( OBJ-AT ?auto_169786 ?auto_169791 ) ( OBJ-AT ?auto_169787 ?auto_169785 ) ( not ( = ?auto_169787 ?auto_169788 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169788 ?auto_169786 ?auto_169785 )
      ( DELIVER-2PKG-VERIFY ?auto_169786 ?auto_169787 ?auto_169785 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_169793 - OBJ
      ?auto_169794 - OBJ
      ?auto_169792 - LOCATION
    )
    :vars
    (
      ?auto_169795 - OBJ
      ?auto_169796 - TRUCK
      ?auto_169798 - LOCATION
      ?auto_169797 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169794 ?auto_169793 ) ) ( not ( = ?auto_169793 ?auto_169795 ) ) ( TRUCK-AT ?auto_169796 ?auto_169798 ) ( IN-CITY ?auto_169798 ?auto_169797 ) ( IN-CITY ?auto_169792 ?auto_169797 ) ( not ( = ?auto_169792 ?auto_169798 ) ) ( OBJ-AT ?auto_169795 ?auto_169792 ) ( OBJ-AT ?auto_169793 ?auto_169798 ) ( OBJ-AT ?auto_169794 ?auto_169792 ) ( not ( = ?auto_169794 ?auto_169795 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169795 ?auto_169793 ?auto_169792 )
      ( DELIVER-2PKG-VERIFY ?auto_169793 ?auto_169794 ?auto_169792 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_169814 - OBJ
      ?auto_169815 - OBJ
      ?auto_169816 - OBJ
      ?auto_169813 - LOCATION
    )
    :vars
    (
      ?auto_169817 - TRUCK
      ?auto_169819 - LOCATION
      ?auto_169818 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169815 ?auto_169814 ) ) ( not ( = ?auto_169816 ?auto_169814 ) ) ( not ( = ?auto_169816 ?auto_169815 ) ) ( TRUCK-AT ?auto_169817 ?auto_169819 ) ( IN-CITY ?auto_169819 ?auto_169818 ) ( IN-CITY ?auto_169813 ?auto_169818 ) ( not ( = ?auto_169813 ?auto_169819 ) ) ( OBJ-AT ?auto_169814 ?auto_169813 ) ( OBJ-AT ?auto_169816 ?auto_169819 ) ( OBJ-AT ?auto_169815 ?auto_169813 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169814 ?auto_169816 ?auto_169813 )
      ( DELIVER-3PKG-VERIFY ?auto_169814 ?auto_169815 ?auto_169816 ?auto_169813 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_169821 - OBJ
      ?auto_169822 - OBJ
      ?auto_169823 - OBJ
      ?auto_169820 - LOCATION
    )
    :vars
    (
      ?auto_169824 - TRUCK
      ?auto_169826 - LOCATION
      ?auto_169825 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169822 ?auto_169821 ) ) ( not ( = ?auto_169823 ?auto_169821 ) ) ( not ( = ?auto_169823 ?auto_169822 ) ) ( TRUCK-AT ?auto_169824 ?auto_169826 ) ( IN-CITY ?auto_169826 ?auto_169825 ) ( IN-CITY ?auto_169820 ?auto_169825 ) ( not ( = ?auto_169820 ?auto_169826 ) ) ( OBJ-AT ?auto_169821 ?auto_169820 ) ( OBJ-AT ?auto_169823 ?auto_169826 ) ( OBJ-AT ?auto_169822 ?auto_169820 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169821 ?auto_169823 ?auto_169820 )
      ( DELIVER-3PKG-VERIFY ?auto_169821 ?auto_169822 ?auto_169823 ?auto_169820 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_169835 - OBJ
      ?auto_169836 - OBJ
      ?auto_169837 - OBJ
      ?auto_169834 - LOCATION
    )
    :vars
    (
      ?auto_169838 - TRUCK
      ?auto_169840 - LOCATION
      ?auto_169839 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169836 ?auto_169835 ) ) ( not ( = ?auto_169837 ?auto_169835 ) ) ( not ( = ?auto_169837 ?auto_169836 ) ) ( TRUCK-AT ?auto_169838 ?auto_169840 ) ( IN-CITY ?auto_169840 ?auto_169839 ) ( IN-CITY ?auto_169834 ?auto_169839 ) ( not ( = ?auto_169834 ?auto_169840 ) ) ( OBJ-AT ?auto_169835 ?auto_169834 ) ( OBJ-AT ?auto_169836 ?auto_169840 ) ( OBJ-AT ?auto_169837 ?auto_169834 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169835 ?auto_169836 ?auto_169834 )
      ( DELIVER-3PKG-VERIFY ?auto_169835 ?auto_169836 ?auto_169837 ?auto_169834 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_169842 - OBJ
      ?auto_169843 - OBJ
      ?auto_169844 - OBJ
      ?auto_169841 - LOCATION
    )
    :vars
    (
      ?auto_169845 - TRUCK
      ?auto_169847 - LOCATION
      ?auto_169846 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169843 ?auto_169842 ) ) ( not ( = ?auto_169844 ?auto_169842 ) ) ( not ( = ?auto_169844 ?auto_169843 ) ) ( TRUCK-AT ?auto_169845 ?auto_169847 ) ( IN-CITY ?auto_169847 ?auto_169846 ) ( IN-CITY ?auto_169841 ?auto_169846 ) ( not ( = ?auto_169841 ?auto_169847 ) ) ( OBJ-AT ?auto_169842 ?auto_169841 ) ( OBJ-AT ?auto_169843 ?auto_169847 ) ( OBJ-AT ?auto_169844 ?auto_169841 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169842 ?auto_169843 ?auto_169841 )
      ( DELIVER-3PKG-VERIFY ?auto_169842 ?auto_169843 ?auto_169844 ?auto_169841 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_169856 - OBJ
      ?auto_169857 - OBJ
      ?auto_169858 - OBJ
      ?auto_169855 - LOCATION
    )
    :vars
    (
      ?auto_169859 - TRUCK
      ?auto_169861 - LOCATION
      ?auto_169860 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169857 ?auto_169856 ) ) ( not ( = ?auto_169858 ?auto_169856 ) ) ( not ( = ?auto_169858 ?auto_169857 ) ) ( TRUCK-AT ?auto_169859 ?auto_169861 ) ( IN-CITY ?auto_169861 ?auto_169860 ) ( IN-CITY ?auto_169855 ?auto_169860 ) ( not ( = ?auto_169855 ?auto_169861 ) ) ( OBJ-AT ?auto_169857 ?auto_169855 ) ( OBJ-AT ?auto_169858 ?auto_169861 ) ( OBJ-AT ?auto_169856 ?auto_169855 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169857 ?auto_169858 ?auto_169855 )
      ( DELIVER-3PKG-VERIFY ?auto_169856 ?auto_169857 ?auto_169858 ?auto_169855 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_169871 - OBJ
      ?auto_169872 - OBJ
      ?auto_169873 - OBJ
      ?auto_169870 - LOCATION
    )
    :vars
    (
      ?auto_169874 - OBJ
      ?auto_169875 - TRUCK
      ?auto_169877 - LOCATION
      ?auto_169876 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169872 ?auto_169871 ) ) ( not ( = ?auto_169873 ?auto_169871 ) ) ( not ( = ?auto_169873 ?auto_169872 ) ) ( not ( = ?auto_169873 ?auto_169874 ) ) ( TRUCK-AT ?auto_169875 ?auto_169877 ) ( IN-CITY ?auto_169877 ?auto_169876 ) ( IN-CITY ?auto_169870 ?auto_169876 ) ( not ( = ?auto_169870 ?auto_169877 ) ) ( OBJ-AT ?auto_169874 ?auto_169870 ) ( OBJ-AT ?auto_169873 ?auto_169877 ) ( OBJ-AT ?auto_169871 ?auto_169870 ) ( OBJ-AT ?auto_169872 ?auto_169870 ) ( not ( = ?auto_169871 ?auto_169874 ) ) ( not ( = ?auto_169872 ?auto_169874 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169874 ?auto_169873 ?auto_169870 )
      ( DELIVER-3PKG-VERIFY ?auto_169871 ?auto_169872 ?auto_169873 ?auto_169870 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_169879 - OBJ
      ?auto_169880 - OBJ
      ?auto_169881 - OBJ
      ?auto_169878 - LOCATION
    )
    :vars
    (
      ?auto_169882 - TRUCK
      ?auto_169884 - LOCATION
      ?auto_169883 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169880 ?auto_169879 ) ) ( not ( = ?auto_169881 ?auto_169879 ) ) ( not ( = ?auto_169881 ?auto_169880 ) ) ( TRUCK-AT ?auto_169882 ?auto_169884 ) ( IN-CITY ?auto_169884 ?auto_169883 ) ( IN-CITY ?auto_169878 ?auto_169883 ) ( not ( = ?auto_169878 ?auto_169884 ) ) ( OBJ-AT ?auto_169881 ?auto_169878 ) ( OBJ-AT ?auto_169880 ?auto_169884 ) ( OBJ-AT ?auto_169879 ?auto_169878 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169881 ?auto_169880 ?auto_169878 )
      ( DELIVER-3PKG-VERIFY ?auto_169879 ?auto_169880 ?auto_169881 ?auto_169878 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_169894 - OBJ
      ?auto_169895 - OBJ
      ?auto_169896 - OBJ
      ?auto_169893 - LOCATION
    )
    :vars
    (
      ?auto_169897 - OBJ
      ?auto_169898 - TRUCK
      ?auto_169900 - LOCATION
      ?auto_169899 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169895 ?auto_169894 ) ) ( not ( = ?auto_169896 ?auto_169894 ) ) ( not ( = ?auto_169896 ?auto_169895 ) ) ( not ( = ?auto_169895 ?auto_169897 ) ) ( TRUCK-AT ?auto_169898 ?auto_169900 ) ( IN-CITY ?auto_169900 ?auto_169899 ) ( IN-CITY ?auto_169893 ?auto_169899 ) ( not ( = ?auto_169893 ?auto_169900 ) ) ( OBJ-AT ?auto_169897 ?auto_169893 ) ( OBJ-AT ?auto_169895 ?auto_169900 ) ( OBJ-AT ?auto_169894 ?auto_169893 ) ( OBJ-AT ?auto_169896 ?auto_169893 ) ( not ( = ?auto_169894 ?auto_169897 ) ) ( not ( = ?auto_169896 ?auto_169897 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169897 ?auto_169895 ?auto_169893 )
      ( DELIVER-3PKG-VERIFY ?auto_169894 ?auto_169895 ?auto_169896 ?auto_169893 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_169910 - OBJ
      ?auto_169911 - OBJ
      ?auto_169912 - OBJ
      ?auto_169909 - LOCATION
    )
    :vars
    (
      ?auto_169913 - TRUCK
      ?auto_169915 - LOCATION
      ?auto_169914 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169911 ?auto_169910 ) ) ( not ( = ?auto_169912 ?auto_169910 ) ) ( not ( = ?auto_169912 ?auto_169911 ) ) ( TRUCK-AT ?auto_169913 ?auto_169915 ) ( IN-CITY ?auto_169915 ?auto_169914 ) ( IN-CITY ?auto_169909 ?auto_169914 ) ( not ( = ?auto_169909 ?auto_169915 ) ) ( OBJ-AT ?auto_169911 ?auto_169909 ) ( OBJ-AT ?auto_169912 ?auto_169915 ) ( OBJ-AT ?auto_169910 ?auto_169909 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169911 ?auto_169912 ?auto_169909 )
      ( DELIVER-3PKG-VERIFY ?auto_169910 ?auto_169911 ?auto_169912 ?auto_169909 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_169917 - OBJ
      ?auto_169918 - OBJ
      ?auto_169919 - OBJ
      ?auto_169916 - LOCATION
    )
    :vars
    (
      ?auto_169920 - OBJ
      ?auto_169921 - TRUCK
      ?auto_169923 - LOCATION
      ?auto_169922 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169918 ?auto_169917 ) ) ( not ( = ?auto_169919 ?auto_169917 ) ) ( not ( = ?auto_169919 ?auto_169918 ) ) ( not ( = ?auto_169919 ?auto_169920 ) ) ( TRUCK-AT ?auto_169921 ?auto_169923 ) ( IN-CITY ?auto_169923 ?auto_169922 ) ( IN-CITY ?auto_169916 ?auto_169922 ) ( not ( = ?auto_169916 ?auto_169923 ) ) ( OBJ-AT ?auto_169920 ?auto_169916 ) ( OBJ-AT ?auto_169919 ?auto_169923 ) ( OBJ-AT ?auto_169917 ?auto_169916 ) ( OBJ-AT ?auto_169918 ?auto_169916 ) ( not ( = ?auto_169917 ?auto_169920 ) ) ( not ( = ?auto_169918 ?auto_169920 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169920 ?auto_169919 ?auto_169916 )
      ( DELIVER-3PKG-VERIFY ?auto_169917 ?auto_169918 ?auto_169919 ?auto_169916 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_169933 - OBJ
      ?auto_169934 - OBJ
      ?auto_169935 - OBJ
      ?auto_169932 - LOCATION
    )
    :vars
    (
      ?auto_169936 - TRUCK
      ?auto_169938 - LOCATION
      ?auto_169937 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169934 ?auto_169933 ) ) ( not ( = ?auto_169935 ?auto_169933 ) ) ( not ( = ?auto_169935 ?auto_169934 ) ) ( TRUCK-AT ?auto_169936 ?auto_169938 ) ( IN-CITY ?auto_169938 ?auto_169937 ) ( IN-CITY ?auto_169932 ?auto_169937 ) ( not ( = ?auto_169932 ?auto_169938 ) ) ( OBJ-AT ?auto_169935 ?auto_169932 ) ( OBJ-AT ?auto_169934 ?auto_169938 ) ( OBJ-AT ?auto_169933 ?auto_169932 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169935 ?auto_169934 ?auto_169932 )
      ( DELIVER-3PKG-VERIFY ?auto_169933 ?auto_169934 ?auto_169935 ?auto_169932 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_169940 - OBJ
      ?auto_169941 - OBJ
      ?auto_169942 - OBJ
      ?auto_169939 - LOCATION
    )
    :vars
    (
      ?auto_169943 - OBJ
      ?auto_169944 - TRUCK
      ?auto_169946 - LOCATION
      ?auto_169945 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169941 ?auto_169940 ) ) ( not ( = ?auto_169942 ?auto_169940 ) ) ( not ( = ?auto_169942 ?auto_169941 ) ) ( not ( = ?auto_169941 ?auto_169943 ) ) ( TRUCK-AT ?auto_169944 ?auto_169946 ) ( IN-CITY ?auto_169946 ?auto_169945 ) ( IN-CITY ?auto_169939 ?auto_169945 ) ( not ( = ?auto_169939 ?auto_169946 ) ) ( OBJ-AT ?auto_169943 ?auto_169939 ) ( OBJ-AT ?auto_169941 ?auto_169946 ) ( OBJ-AT ?auto_169940 ?auto_169939 ) ( OBJ-AT ?auto_169942 ?auto_169939 ) ( not ( = ?auto_169940 ?auto_169943 ) ) ( not ( = ?auto_169942 ?auto_169943 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169943 ?auto_169941 ?auto_169939 )
      ( DELIVER-3PKG-VERIFY ?auto_169940 ?auto_169941 ?auto_169942 ?auto_169939 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_169971 - OBJ
      ?auto_169972 - OBJ
      ?auto_169973 - OBJ
      ?auto_169970 - LOCATION
    )
    :vars
    (
      ?auto_169974 - TRUCK
      ?auto_169976 - LOCATION
      ?auto_169975 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169972 ?auto_169971 ) ) ( not ( = ?auto_169973 ?auto_169971 ) ) ( not ( = ?auto_169973 ?auto_169972 ) ) ( TRUCK-AT ?auto_169974 ?auto_169976 ) ( IN-CITY ?auto_169976 ?auto_169975 ) ( IN-CITY ?auto_169970 ?auto_169975 ) ( not ( = ?auto_169970 ?auto_169976 ) ) ( OBJ-AT ?auto_169972 ?auto_169970 ) ( OBJ-AT ?auto_169971 ?auto_169976 ) ( OBJ-AT ?auto_169973 ?auto_169970 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169972 ?auto_169971 ?auto_169970 )
      ( DELIVER-3PKG-VERIFY ?auto_169971 ?auto_169972 ?auto_169973 ?auto_169970 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_169978 - OBJ
      ?auto_169979 - OBJ
      ?auto_169980 - OBJ
      ?auto_169977 - LOCATION
    )
    :vars
    (
      ?auto_169981 - TRUCK
      ?auto_169983 - LOCATION
      ?auto_169982 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169979 ?auto_169978 ) ) ( not ( = ?auto_169980 ?auto_169978 ) ) ( not ( = ?auto_169980 ?auto_169979 ) ) ( TRUCK-AT ?auto_169981 ?auto_169983 ) ( IN-CITY ?auto_169983 ?auto_169982 ) ( IN-CITY ?auto_169977 ?auto_169982 ) ( not ( = ?auto_169977 ?auto_169983 ) ) ( OBJ-AT ?auto_169979 ?auto_169977 ) ( OBJ-AT ?auto_169978 ?auto_169983 ) ( OBJ-AT ?auto_169980 ?auto_169977 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169979 ?auto_169978 ?auto_169977 )
      ( DELIVER-3PKG-VERIFY ?auto_169978 ?auto_169979 ?auto_169980 ?auto_169977 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_169992 - OBJ
      ?auto_169993 - OBJ
      ?auto_169994 - OBJ
      ?auto_169991 - LOCATION
    )
    :vars
    (
      ?auto_169995 - TRUCK
      ?auto_169997 - LOCATION
      ?auto_169996 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_169993 ?auto_169992 ) ) ( not ( = ?auto_169994 ?auto_169992 ) ) ( not ( = ?auto_169994 ?auto_169993 ) ) ( TRUCK-AT ?auto_169995 ?auto_169997 ) ( IN-CITY ?auto_169997 ?auto_169996 ) ( IN-CITY ?auto_169991 ?auto_169996 ) ( not ( = ?auto_169991 ?auto_169997 ) ) ( OBJ-AT ?auto_169994 ?auto_169991 ) ( OBJ-AT ?auto_169992 ?auto_169997 ) ( OBJ-AT ?auto_169993 ?auto_169991 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_169994 ?auto_169992 ?auto_169991 )
      ( DELIVER-3PKG-VERIFY ?auto_169992 ?auto_169993 ?auto_169994 ?auto_169991 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_170007 - OBJ
      ?auto_170008 - OBJ
      ?auto_170009 - OBJ
      ?auto_170006 - LOCATION
    )
    :vars
    (
      ?auto_170010 - OBJ
      ?auto_170011 - TRUCK
      ?auto_170013 - LOCATION
      ?auto_170012 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_170008 ?auto_170007 ) ) ( not ( = ?auto_170009 ?auto_170007 ) ) ( not ( = ?auto_170009 ?auto_170008 ) ) ( not ( = ?auto_170007 ?auto_170010 ) ) ( TRUCK-AT ?auto_170011 ?auto_170013 ) ( IN-CITY ?auto_170013 ?auto_170012 ) ( IN-CITY ?auto_170006 ?auto_170012 ) ( not ( = ?auto_170006 ?auto_170013 ) ) ( OBJ-AT ?auto_170010 ?auto_170006 ) ( OBJ-AT ?auto_170007 ?auto_170013 ) ( OBJ-AT ?auto_170008 ?auto_170006 ) ( OBJ-AT ?auto_170009 ?auto_170006 ) ( not ( = ?auto_170008 ?auto_170010 ) ) ( not ( = ?auto_170009 ?auto_170010 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170010 ?auto_170007 ?auto_170006 )
      ( DELIVER-3PKG-VERIFY ?auto_170007 ?auto_170008 ?auto_170009 ?auto_170006 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_170023 - OBJ
      ?auto_170024 - OBJ
      ?auto_170025 - OBJ
      ?auto_170022 - LOCATION
    )
    :vars
    (
      ?auto_170026 - TRUCK
      ?auto_170028 - LOCATION
      ?auto_170027 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_170024 ?auto_170023 ) ) ( not ( = ?auto_170025 ?auto_170023 ) ) ( not ( = ?auto_170025 ?auto_170024 ) ) ( TRUCK-AT ?auto_170026 ?auto_170028 ) ( IN-CITY ?auto_170028 ?auto_170027 ) ( IN-CITY ?auto_170022 ?auto_170027 ) ( not ( = ?auto_170022 ?auto_170028 ) ) ( OBJ-AT ?auto_170025 ?auto_170022 ) ( OBJ-AT ?auto_170023 ?auto_170028 ) ( OBJ-AT ?auto_170024 ?auto_170022 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170025 ?auto_170023 ?auto_170022 )
      ( DELIVER-3PKG-VERIFY ?auto_170023 ?auto_170024 ?auto_170025 ?auto_170022 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_170030 - OBJ
      ?auto_170031 - OBJ
      ?auto_170032 - OBJ
      ?auto_170029 - LOCATION
    )
    :vars
    (
      ?auto_170033 - OBJ
      ?auto_170034 - TRUCK
      ?auto_170036 - LOCATION
      ?auto_170035 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_170031 ?auto_170030 ) ) ( not ( = ?auto_170032 ?auto_170030 ) ) ( not ( = ?auto_170032 ?auto_170031 ) ) ( not ( = ?auto_170030 ?auto_170033 ) ) ( TRUCK-AT ?auto_170034 ?auto_170036 ) ( IN-CITY ?auto_170036 ?auto_170035 ) ( IN-CITY ?auto_170029 ?auto_170035 ) ( not ( = ?auto_170029 ?auto_170036 ) ) ( OBJ-AT ?auto_170033 ?auto_170029 ) ( OBJ-AT ?auto_170030 ?auto_170036 ) ( OBJ-AT ?auto_170031 ?auto_170029 ) ( OBJ-AT ?auto_170032 ?auto_170029 ) ( not ( = ?auto_170031 ?auto_170033 ) ) ( not ( = ?auto_170032 ?auto_170033 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170033 ?auto_170030 ?auto_170029 )
      ( DELIVER-3PKG-VERIFY ?auto_170030 ?auto_170031 ?auto_170032 ?auto_170029 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_170157 - OBJ
      ?auto_170158 - OBJ
      ?auto_170159 - OBJ
      ?auto_170160 - OBJ
      ?auto_170156 - LOCATION
    )
    :vars
    (
      ?auto_170161 - TRUCK
      ?auto_170163 - LOCATION
      ?auto_170162 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_170158 ?auto_170157 ) ) ( not ( = ?auto_170159 ?auto_170157 ) ) ( not ( = ?auto_170159 ?auto_170158 ) ) ( not ( = ?auto_170160 ?auto_170157 ) ) ( not ( = ?auto_170160 ?auto_170158 ) ) ( not ( = ?auto_170160 ?auto_170159 ) ) ( TRUCK-AT ?auto_170161 ?auto_170163 ) ( IN-CITY ?auto_170163 ?auto_170162 ) ( IN-CITY ?auto_170156 ?auto_170162 ) ( not ( = ?auto_170156 ?auto_170163 ) ) ( OBJ-AT ?auto_170157 ?auto_170156 ) ( OBJ-AT ?auto_170160 ?auto_170163 ) ( OBJ-AT ?auto_170158 ?auto_170156 ) ( OBJ-AT ?auto_170159 ?auto_170156 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170157 ?auto_170160 ?auto_170156 )
      ( DELIVER-4PKG-VERIFY ?auto_170157 ?auto_170158 ?auto_170159 ?auto_170160 ?auto_170156 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_170181 - OBJ
      ?auto_170182 - OBJ
      ?auto_170183 - OBJ
      ?auto_170184 - OBJ
      ?auto_170180 - LOCATION
    )
    :vars
    (
      ?auto_170185 - TRUCK
      ?auto_170187 - LOCATION
      ?auto_170186 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_170182 ?auto_170181 ) ) ( not ( = ?auto_170183 ?auto_170181 ) ) ( not ( = ?auto_170183 ?auto_170182 ) ) ( not ( = ?auto_170184 ?auto_170181 ) ) ( not ( = ?auto_170184 ?auto_170182 ) ) ( not ( = ?auto_170184 ?auto_170183 ) ) ( TRUCK-AT ?auto_170185 ?auto_170187 ) ( IN-CITY ?auto_170187 ?auto_170186 ) ( IN-CITY ?auto_170180 ?auto_170186 ) ( not ( = ?auto_170180 ?auto_170187 ) ) ( OBJ-AT ?auto_170181 ?auto_170180 ) ( OBJ-AT ?auto_170183 ?auto_170187 ) ( OBJ-AT ?auto_170182 ?auto_170180 ) ( OBJ-AT ?auto_170184 ?auto_170180 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170181 ?auto_170183 ?auto_170180 )
      ( DELIVER-4PKG-VERIFY ?auto_170181 ?auto_170182 ?auto_170183 ?auto_170184 ?auto_170180 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_170205 - OBJ
      ?auto_170206 - OBJ
      ?auto_170207 - OBJ
      ?auto_170208 - OBJ
      ?auto_170204 - LOCATION
    )
    :vars
    (
      ?auto_170209 - TRUCK
      ?auto_170211 - LOCATION
      ?auto_170210 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_170206 ?auto_170205 ) ) ( not ( = ?auto_170207 ?auto_170205 ) ) ( not ( = ?auto_170207 ?auto_170206 ) ) ( not ( = ?auto_170208 ?auto_170205 ) ) ( not ( = ?auto_170208 ?auto_170206 ) ) ( not ( = ?auto_170208 ?auto_170207 ) ) ( TRUCK-AT ?auto_170209 ?auto_170211 ) ( IN-CITY ?auto_170211 ?auto_170210 ) ( IN-CITY ?auto_170204 ?auto_170210 ) ( not ( = ?auto_170204 ?auto_170211 ) ) ( OBJ-AT ?auto_170205 ?auto_170204 ) ( OBJ-AT ?auto_170208 ?auto_170211 ) ( OBJ-AT ?auto_170206 ?auto_170204 ) ( OBJ-AT ?auto_170207 ?auto_170204 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170205 ?auto_170208 ?auto_170204 )
      ( DELIVER-4PKG-VERIFY ?auto_170205 ?auto_170206 ?auto_170207 ?auto_170208 ?auto_170204 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_170229 - OBJ
      ?auto_170230 - OBJ
      ?auto_170231 - OBJ
      ?auto_170232 - OBJ
      ?auto_170228 - LOCATION
    )
    :vars
    (
      ?auto_170233 - TRUCK
      ?auto_170235 - LOCATION
      ?auto_170234 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_170230 ?auto_170229 ) ) ( not ( = ?auto_170231 ?auto_170229 ) ) ( not ( = ?auto_170231 ?auto_170230 ) ) ( not ( = ?auto_170232 ?auto_170229 ) ) ( not ( = ?auto_170232 ?auto_170230 ) ) ( not ( = ?auto_170232 ?auto_170231 ) ) ( TRUCK-AT ?auto_170233 ?auto_170235 ) ( IN-CITY ?auto_170235 ?auto_170234 ) ( IN-CITY ?auto_170228 ?auto_170234 ) ( not ( = ?auto_170228 ?auto_170235 ) ) ( OBJ-AT ?auto_170229 ?auto_170228 ) ( OBJ-AT ?auto_170231 ?auto_170235 ) ( OBJ-AT ?auto_170230 ?auto_170228 ) ( OBJ-AT ?auto_170232 ?auto_170228 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170229 ?auto_170231 ?auto_170228 )
      ( DELIVER-4PKG-VERIFY ?auto_170229 ?auto_170230 ?auto_170231 ?auto_170232 ?auto_170228 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_170301 - OBJ
      ?auto_170302 - OBJ
      ?auto_170303 - OBJ
      ?auto_170304 - OBJ
      ?auto_170300 - LOCATION
    )
    :vars
    (
      ?auto_170305 - TRUCK
      ?auto_170307 - LOCATION
      ?auto_170306 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_170302 ?auto_170301 ) ) ( not ( = ?auto_170303 ?auto_170301 ) ) ( not ( = ?auto_170303 ?auto_170302 ) ) ( not ( = ?auto_170304 ?auto_170301 ) ) ( not ( = ?auto_170304 ?auto_170302 ) ) ( not ( = ?auto_170304 ?auto_170303 ) ) ( TRUCK-AT ?auto_170305 ?auto_170307 ) ( IN-CITY ?auto_170307 ?auto_170306 ) ( IN-CITY ?auto_170300 ?auto_170306 ) ( not ( = ?auto_170300 ?auto_170307 ) ) ( OBJ-AT ?auto_170301 ?auto_170300 ) ( OBJ-AT ?auto_170302 ?auto_170307 ) ( OBJ-AT ?auto_170303 ?auto_170300 ) ( OBJ-AT ?auto_170304 ?auto_170300 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170301 ?auto_170302 ?auto_170300 )
      ( DELIVER-4PKG-VERIFY ?auto_170301 ?auto_170302 ?auto_170303 ?auto_170304 ?auto_170300 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_170325 - OBJ
      ?auto_170326 - OBJ
      ?auto_170327 - OBJ
      ?auto_170328 - OBJ
      ?auto_170324 - LOCATION
    )
    :vars
    (
      ?auto_170329 - TRUCK
      ?auto_170331 - LOCATION
      ?auto_170330 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_170326 ?auto_170325 ) ) ( not ( = ?auto_170327 ?auto_170325 ) ) ( not ( = ?auto_170327 ?auto_170326 ) ) ( not ( = ?auto_170328 ?auto_170325 ) ) ( not ( = ?auto_170328 ?auto_170326 ) ) ( not ( = ?auto_170328 ?auto_170327 ) ) ( TRUCK-AT ?auto_170329 ?auto_170331 ) ( IN-CITY ?auto_170331 ?auto_170330 ) ( IN-CITY ?auto_170324 ?auto_170330 ) ( not ( = ?auto_170324 ?auto_170331 ) ) ( OBJ-AT ?auto_170325 ?auto_170324 ) ( OBJ-AT ?auto_170326 ?auto_170331 ) ( OBJ-AT ?auto_170327 ?auto_170324 ) ( OBJ-AT ?auto_170328 ?auto_170324 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170325 ?auto_170326 ?auto_170324 )
      ( DELIVER-4PKG-VERIFY ?auto_170325 ?auto_170326 ?auto_170327 ?auto_170328 ?auto_170324 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_170397 - OBJ
      ?auto_170398 - OBJ
      ?auto_170399 - OBJ
      ?auto_170400 - OBJ
      ?auto_170396 - LOCATION
    )
    :vars
    (
      ?auto_170401 - TRUCK
      ?auto_170403 - LOCATION
      ?auto_170402 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_170398 ?auto_170397 ) ) ( not ( = ?auto_170399 ?auto_170397 ) ) ( not ( = ?auto_170399 ?auto_170398 ) ) ( not ( = ?auto_170400 ?auto_170397 ) ) ( not ( = ?auto_170400 ?auto_170398 ) ) ( not ( = ?auto_170400 ?auto_170399 ) ) ( TRUCK-AT ?auto_170401 ?auto_170403 ) ( IN-CITY ?auto_170403 ?auto_170402 ) ( IN-CITY ?auto_170396 ?auto_170402 ) ( not ( = ?auto_170396 ?auto_170403 ) ) ( OBJ-AT ?auto_170398 ?auto_170396 ) ( OBJ-AT ?auto_170400 ?auto_170403 ) ( OBJ-AT ?auto_170397 ?auto_170396 ) ( OBJ-AT ?auto_170399 ?auto_170396 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170398 ?auto_170400 ?auto_170396 )
      ( DELIVER-4PKG-VERIFY ?auto_170397 ?auto_170398 ?auto_170399 ?auto_170400 ?auto_170396 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_170421 - OBJ
      ?auto_170422 - OBJ
      ?auto_170423 - OBJ
      ?auto_170424 - OBJ
      ?auto_170420 - LOCATION
    )
    :vars
    (
      ?auto_170425 - TRUCK
      ?auto_170427 - LOCATION
      ?auto_170426 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_170422 ?auto_170421 ) ) ( not ( = ?auto_170423 ?auto_170421 ) ) ( not ( = ?auto_170423 ?auto_170422 ) ) ( not ( = ?auto_170424 ?auto_170421 ) ) ( not ( = ?auto_170424 ?auto_170422 ) ) ( not ( = ?auto_170424 ?auto_170423 ) ) ( TRUCK-AT ?auto_170425 ?auto_170427 ) ( IN-CITY ?auto_170427 ?auto_170426 ) ( IN-CITY ?auto_170420 ?auto_170426 ) ( not ( = ?auto_170420 ?auto_170427 ) ) ( OBJ-AT ?auto_170422 ?auto_170420 ) ( OBJ-AT ?auto_170423 ?auto_170427 ) ( OBJ-AT ?auto_170421 ?auto_170420 ) ( OBJ-AT ?auto_170424 ?auto_170420 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170422 ?auto_170423 ?auto_170420 )
      ( DELIVER-4PKG-VERIFY ?auto_170421 ?auto_170422 ?auto_170423 ?auto_170424 ?auto_170420 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_170498 - OBJ
      ?auto_170499 - OBJ
      ?auto_170500 - OBJ
      ?auto_170501 - OBJ
      ?auto_170497 - LOCATION
    )
    :vars
    (
      ?auto_170502 - TRUCK
      ?auto_170504 - LOCATION
      ?auto_170503 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_170499 ?auto_170498 ) ) ( not ( = ?auto_170500 ?auto_170498 ) ) ( not ( = ?auto_170500 ?auto_170499 ) ) ( not ( = ?auto_170501 ?auto_170498 ) ) ( not ( = ?auto_170501 ?auto_170499 ) ) ( not ( = ?auto_170501 ?auto_170500 ) ) ( TRUCK-AT ?auto_170502 ?auto_170504 ) ( IN-CITY ?auto_170504 ?auto_170503 ) ( IN-CITY ?auto_170497 ?auto_170503 ) ( not ( = ?auto_170497 ?auto_170504 ) ) ( OBJ-AT ?auto_170500 ?auto_170497 ) ( OBJ-AT ?auto_170501 ?auto_170504 ) ( OBJ-AT ?auto_170498 ?auto_170497 ) ( OBJ-AT ?auto_170499 ?auto_170497 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170500 ?auto_170501 ?auto_170497 )
      ( DELIVER-4PKG-VERIFY ?auto_170498 ?auto_170499 ?auto_170500 ?auto_170501 ?auto_170497 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_170524 - OBJ
      ?auto_170525 - OBJ
      ?auto_170526 - OBJ
      ?auto_170527 - OBJ
      ?auto_170523 - LOCATION
    )
    :vars
    (
      ?auto_170528 - TRUCK
      ?auto_170530 - LOCATION
      ?auto_170529 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_170525 ?auto_170524 ) ) ( not ( = ?auto_170526 ?auto_170524 ) ) ( not ( = ?auto_170526 ?auto_170525 ) ) ( not ( = ?auto_170527 ?auto_170524 ) ) ( not ( = ?auto_170527 ?auto_170525 ) ) ( not ( = ?auto_170527 ?auto_170526 ) ) ( TRUCK-AT ?auto_170528 ?auto_170530 ) ( IN-CITY ?auto_170530 ?auto_170529 ) ( IN-CITY ?auto_170523 ?auto_170529 ) ( not ( = ?auto_170523 ?auto_170530 ) ) ( OBJ-AT ?auto_170527 ?auto_170523 ) ( OBJ-AT ?auto_170526 ?auto_170530 ) ( OBJ-AT ?auto_170524 ?auto_170523 ) ( OBJ-AT ?auto_170525 ?auto_170523 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170527 ?auto_170526 ?auto_170523 )
      ( DELIVER-4PKG-VERIFY ?auto_170524 ?auto_170525 ?auto_170526 ?auto_170527 ?auto_170523 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_170575 - OBJ
      ?auto_170576 - OBJ
      ?auto_170577 - OBJ
      ?auto_170578 - OBJ
      ?auto_170574 - LOCATION
    )
    :vars
    (
      ?auto_170579 - TRUCK
      ?auto_170581 - LOCATION
      ?auto_170580 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_170576 ?auto_170575 ) ) ( not ( = ?auto_170577 ?auto_170575 ) ) ( not ( = ?auto_170577 ?auto_170576 ) ) ( not ( = ?auto_170578 ?auto_170575 ) ) ( not ( = ?auto_170578 ?auto_170576 ) ) ( not ( = ?auto_170578 ?auto_170577 ) ) ( TRUCK-AT ?auto_170579 ?auto_170581 ) ( IN-CITY ?auto_170581 ?auto_170580 ) ( IN-CITY ?auto_170574 ?auto_170580 ) ( not ( = ?auto_170574 ?auto_170581 ) ) ( OBJ-AT ?auto_170577 ?auto_170574 ) ( OBJ-AT ?auto_170576 ?auto_170581 ) ( OBJ-AT ?auto_170575 ?auto_170574 ) ( OBJ-AT ?auto_170578 ?auto_170574 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170577 ?auto_170576 ?auto_170574 )
      ( DELIVER-4PKG-VERIFY ?auto_170575 ?auto_170576 ?auto_170577 ?auto_170578 ?auto_170574 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_170626 - OBJ
      ?auto_170627 - OBJ
      ?auto_170628 - OBJ
      ?auto_170629 - OBJ
      ?auto_170625 - LOCATION
    )
    :vars
    (
      ?auto_170630 - TRUCK
      ?auto_170632 - LOCATION
      ?auto_170631 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_170627 ?auto_170626 ) ) ( not ( = ?auto_170628 ?auto_170626 ) ) ( not ( = ?auto_170628 ?auto_170627 ) ) ( not ( = ?auto_170629 ?auto_170626 ) ) ( not ( = ?auto_170629 ?auto_170627 ) ) ( not ( = ?auto_170629 ?auto_170628 ) ) ( TRUCK-AT ?auto_170630 ?auto_170632 ) ( IN-CITY ?auto_170632 ?auto_170631 ) ( IN-CITY ?auto_170625 ?auto_170631 ) ( not ( = ?auto_170625 ?auto_170632 ) ) ( OBJ-AT ?auto_170629 ?auto_170625 ) ( OBJ-AT ?auto_170627 ?auto_170632 ) ( OBJ-AT ?auto_170626 ?auto_170625 ) ( OBJ-AT ?auto_170628 ?auto_170625 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170629 ?auto_170627 ?auto_170625 )
      ( DELIVER-4PKG-VERIFY ?auto_170626 ?auto_170627 ?auto_170628 ?auto_170629 ?auto_170625 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_170704 - OBJ
      ?auto_170705 - OBJ
      ?auto_170706 - OBJ
      ?auto_170707 - OBJ
      ?auto_170703 - LOCATION
    )
    :vars
    (
      ?auto_170708 - TRUCK
      ?auto_170710 - LOCATION
      ?auto_170709 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_170705 ?auto_170704 ) ) ( not ( = ?auto_170706 ?auto_170704 ) ) ( not ( = ?auto_170706 ?auto_170705 ) ) ( not ( = ?auto_170707 ?auto_170704 ) ) ( not ( = ?auto_170707 ?auto_170705 ) ) ( not ( = ?auto_170707 ?auto_170706 ) ) ( TRUCK-AT ?auto_170708 ?auto_170710 ) ( IN-CITY ?auto_170710 ?auto_170709 ) ( IN-CITY ?auto_170703 ?auto_170709 ) ( not ( = ?auto_170703 ?auto_170710 ) ) ( OBJ-AT ?auto_170705 ?auto_170703 ) ( OBJ-AT ?auto_170707 ?auto_170710 ) ( OBJ-AT ?auto_170704 ?auto_170703 ) ( OBJ-AT ?auto_170706 ?auto_170703 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170705 ?auto_170707 ?auto_170703 )
      ( DELIVER-4PKG-VERIFY ?auto_170704 ?auto_170705 ?auto_170706 ?auto_170707 ?auto_170703 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_170728 - OBJ
      ?auto_170729 - OBJ
      ?auto_170730 - OBJ
      ?auto_170731 - OBJ
      ?auto_170727 - LOCATION
    )
    :vars
    (
      ?auto_170732 - TRUCK
      ?auto_170734 - LOCATION
      ?auto_170733 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_170729 ?auto_170728 ) ) ( not ( = ?auto_170730 ?auto_170728 ) ) ( not ( = ?auto_170730 ?auto_170729 ) ) ( not ( = ?auto_170731 ?auto_170728 ) ) ( not ( = ?auto_170731 ?auto_170729 ) ) ( not ( = ?auto_170731 ?auto_170730 ) ) ( TRUCK-AT ?auto_170732 ?auto_170734 ) ( IN-CITY ?auto_170734 ?auto_170733 ) ( IN-CITY ?auto_170727 ?auto_170733 ) ( not ( = ?auto_170727 ?auto_170734 ) ) ( OBJ-AT ?auto_170729 ?auto_170727 ) ( OBJ-AT ?auto_170730 ?auto_170734 ) ( OBJ-AT ?auto_170728 ?auto_170727 ) ( OBJ-AT ?auto_170731 ?auto_170727 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170729 ?auto_170730 ?auto_170727 )
      ( DELIVER-4PKG-VERIFY ?auto_170728 ?auto_170729 ?auto_170730 ?auto_170731 ?auto_170727 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_170752 - OBJ
      ?auto_170753 - OBJ
      ?auto_170754 - OBJ
      ?auto_170755 - OBJ
      ?auto_170751 - LOCATION
    )
    :vars
    (
      ?auto_170756 - TRUCK
      ?auto_170758 - LOCATION
      ?auto_170757 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_170753 ?auto_170752 ) ) ( not ( = ?auto_170754 ?auto_170752 ) ) ( not ( = ?auto_170754 ?auto_170753 ) ) ( not ( = ?auto_170755 ?auto_170752 ) ) ( not ( = ?auto_170755 ?auto_170753 ) ) ( not ( = ?auto_170755 ?auto_170754 ) ) ( TRUCK-AT ?auto_170756 ?auto_170758 ) ( IN-CITY ?auto_170758 ?auto_170757 ) ( IN-CITY ?auto_170751 ?auto_170757 ) ( not ( = ?auto_170751 ?auto_170758 ) ) ( OBJ-AT ?auto_170754 ?auto_170751 ) ( OBJ-AT ?auto_170755 ?auto_170758 ) ( OBJ-AT ?auto_170752 ?auto_170751 ) ( OBJ-AT ?auto_170753 ?auto_170751 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170754 ?auto_170755 ?auto_170751 )
      ( DELIVER-4PKG-VERIFY ?auto_170752 ?auto_170753 ?auto_170754 ?auto_170755 ?auto_170751 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_170778 - OBJ
      ?auto_170779 - OBJ
      ?auto_170780 - OBJ
      ?auto_170781 - OBJ
      ?auto_170777 - LOCATION
    )
    :vars
    (
      ?auto_170782 - TRUCK
      ?auto_170784 - LOCATION
      ?auto_170783 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_170779 ?auto_170778 ) ) ( not ( = ?auto_170780 ?auto_170778 ) ) ( not ( = ?auto_170780 ?auto_170779 ) ) ( not ( = ?auto_170781 ?auto_170778 ) ) ( not ( = ?auto_170781 ?auto_170779 ) ) ( not ( = ?auto_170781 ?auto_170780 ) ) ( TRUCK-AT ?auto_170782 ?auto_170784 ) ( IN-CITY ?auto_170784 ?auto_170783 ) ( IN-CITY ?auto_170777 ?auto_170783 ) ( not ( = ?auto_170777 ?auto_170784 ) ) ( OBJ-AT ?auto_170781 ?auto_170777 ) ( OBJ-AT ?auto_170780 ?auto_170784 ) ( OBJ-AT ?auto_170778 ?auto_170777 ) ( OBJ-AT ?auto_170779 ?auto_170777 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170781 ?auto_170780 ?auto_170777 )
      ( DELIVER-4PKG-VERIFY ?auto_170778 ?auto_170779 ?auto_170780 ?auto_170781 ?auto_170777 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_170882 - OBJ
      ?auto_170883 - OBJ
      ?auto_170884 - OBJ
      ?auto_170885 - OBJ
      ?auto_170881 - LOCATION
    )
    :vars
    (
      ?auto_170886 - TRUCK
      ?auto_170888 - LOCATION
      ?auto_170887 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_170883 ?auto_170882 ) ) ( not ( = ?auto_170884 ?auto_170882 ) ) ( not ( = ?auto_170884 ?auto_170883 ) ) ( not ( = ?auto_170885 ?auto_170882 ) ) ( not ( = ?auto_170885 ?auto_170883 ) ) ( not ( = ?auto_170885 ?auto_170884 ) ) ( TRUCK-AT ?auto_170886 ?auto_170888 ) ( IN-CITY ?auto_170888 ?auto_170887 ) ( IN-CITY ?auto_170881 ?auto_170887 ) ( not ( = ?auto_170881 ?auto_170888 ) ) ( OBJ-AT ?auto_170884 ?auto_170881 ) ( OBJ-AT ?auto_170883 ?auto_170888 ) ( OBJ-AT ?auto_170882 ?auto_170881 ) ( OBJ-AT ?auto_170885 ?auto_170881 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170884 ?auto_170883 ?auto_170881 )
      ( DELIVER-4PKG-VERIFY ?auto_170882 ?auto_170883 ?auto_170884 ?auto_170885 ?auto_170881 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_170906 - OBJ
      ?auto_170907 - OBJ
      ?auto_170908 - OBJ
      ?auto_170909 - OBJ
      ?auto_170905 - LOCATION
    )
    :vars
    (
      ?auto_170910 - TRUCK
      ?auto_170912 - LOCATION
      ?auto_170911 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_170907 ?auto_170906 ) ) ( not ( = ?auto_170908 ?auto_170906 ) ) ( not ( = ?auto_170908 ?auto_170907 ) ) ( not ( = ?auto_170909 ?auto_170906 ) ) ( not ( = ?auto_170909 ?auto_170907 ) ) ( not ( = ?auto_170909 ?auto_170908 ) ) ( TRUCK-AT ?auto_170910 ?auto_170912 ) ( IN-CITY ?auto_170912 ?auto_170911 ) ( IN-CITY ?auto_170905 ?auto_170911 ) ( not ( = ?auto_170905 ?auto_170912 ) ) ( OBJ-AT ?auto_170909 ?auto_170905 ) ( OBJ-AT ?auto_170907 ?auto_170912 ) ( OBJ-AT ?auto_170906 ?auto_170905 ) ( OBJ-AT ?auto_170908 ?auto_170905 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170909 ?auto_170907 ?auto_170905 )
      ( DELIVER-4PKG-VERIFY ?auto_170906 ?auto_170907 ?auto_170908 ?auto_170909 ?auto_170905 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_171059 - OBJ
      ?auto_171060 - OBJ
      ?auto_171061 - OBJ
      ?auto_171062 - OBJ
      ?auto_171058 - LOCATION
    )
    :vars
    (
      ?auto_171063 - TRUCK
      ?auto_171065 - LOCATION
      ?auto_171064 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_171060 ?auto_171059 ) ) ( not ( = ?auto_171061 ?auto_171059 ) ) ( not ( = ?auto_171061 ?auto_171060 ) ) ( not ( = ?auto_171062 ?auto_171059 ) ) ( not ( = ?auto_171062 ?auto_171060 ) ) ( not ( = ?auto_171062 ?auto_171061 ) ) ( TRUCK-AT ?auto_171063 ?auto_171065 ) ( IN-CITY ?auto_171065 ?auto_171064 ) ( IN-CITY ?auto_171058 ?auto_171064 ) ( not ( = ?auto_171058 ?auto_171065 ) ) ( OBJ-AT ?auto_171060 ?auto_171058 ) ( OBJ-AT ?auto_171059 ?auto_171065 ) ( OBJ-AT ?auto_171061 ?auto_171058 ) ( OBJ-AT ?auto_171062 ?auto_171058 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171060 ?auto_171059 ?auto_171058 )
      ( DELIVER-4PKG-VERIFY ?auto_171059 ?auto_171060 ?auto_171061 ?auto_171062 ?auto_171058 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_171083 - OBJ
      ?auto_171084 - OBJ
      ?auto_171085 - OBJ
      ?auto_171086 - OBJ
      ?auto_171082 - LOCATION
    )
    :vars
    (
      ?auto_171087 - TRUCK
      ?auto_171089 - LOCATION
      ?auto_171088 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_171084 ?auto_171083 ) ) ( not ( = ?auto_171085 ?auto_171083 ) ) ( not ( = ?auto_171085 ?auto_171084 ) ) ( not ( = ?auto_171086 ?auto_171083 ) ) ( not ( = ?auto_171086 ?auto_171084 ) ) ( not ( = ?auto_171086 ?auto_171085 ) ) ( TRUCK-AT ?auto_171087 ?auto_171089 ) ( IN-CITY ?auto_171089 ?auto_171088 ) ( IN-CITY ?auto_171082 ?auto_171088 ) ( not ( = ?auto_171082 ?auto_171089 ) ) ( OBJ-AT ?auto_171084 ?auto_171082 ) ( OBJ-AT ?auto_171083 ?auto_171089 ) ( OBJ-AT ?auto_171085 ?auto_171082 ) ( OBJ-AT ?auto_171086 ?auto_171082 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171084 ?auto_171083 ?auto_171082 )
      ( DELIVER-4PKG-VERIFY ?auto_171083 ?auto_171084 ?auto_171085 ?auto_171086 ?auto_171082 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_171155 - OBJ
      ?auto_171156 - OBJ
      ?auto_171157 - OBJ
      ?auto_171158 - OBJ
      ?auto_171154 - LOCATION
    )
    :vars
    (
      ?auto_171159 - TRUCK
      ?auto_171161 - LOCATION
      ?auto_171160 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_171156 ?auto_171155 ) ) ( not ( = ?auto_171157 ?auto_171155 ) ) ( not ( = ?auto_171157 ?auto_171156 ) ) ( not ( = ?auto_171158 ?auto_171155 ) ) ( not ( = ?auto_171158 ?auto_171156 ) ) ( not ( = ?auto_171158 ?auto_171157 ) ) ( TRUCK-AT ?auto_171159 ?auto_171161 ) ( IN-CITY ?auto_171161 ?auto_171160 ) ( IN-CITY ?auto_171154 ?auto_171160 ) ( not ( = ?auto_171154 ?auto_171161 ) ) ( OBJ-AT ?auto_171157 ?auto_171154 ) ( OBJ-AT ?auto_171155 ?auto_171161 ) ( OBJ-AT ?auto_171156 ?auto_171154 ) ( OBJ-AT ?auto_171158 ?auto_171154 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171157 ?auto_171155 ?auto_171154 )
      ( DELIVER-4PKG-VERIFY ?auto_171155 ?auto_171156 ?auto_171157 ?auto_171158 ?auto_171154 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_171206 - OBJ
      ?auto_171207 - OBJ
      ?auto_171208 - OBJ
      ?auto_171209 - OBJ
      ?auto_171205 - LOCATION
    )
    :vars
    (
      ?auto_171210 - TRUCK
      ?auto_171212 - LOCATION
      ?auto_171211 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_171207 ?auto_171206 ) ) ( not ( = ?auto_171208 ?auto_171206 ) ) ( not ( = ?auto_171208 ?auto_171207 ) ) ( not ( = ?auto_171209 ?auto_171206 ) ) ( not ( = ?auto_171209 ?auto_171207 ) ) ( not ( = ?auto_171209 ?auto_171208 ) ) ( TRUCK-AT ?auto_171210 ?auto_171212 ) ( IN-CITY ?auto_171212 ?auto_171211 ) ( IN-CITY ?auto_171205 ?auto_171211 ) ( not ( = ?auto_171205 ?auto_171212 ) ) ( OBJ-AT ?auto_171209 ?auto_171205 ) ( OBJ-AT ?auto_171206 ?auto_171212 ) ( OBJ-AT ?auto_171207 ?auto_171205 ) ( OBJ-AT ?auto_171208 ?auto_171205 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171209 ?auto_171206 ?auto_171205 )
      ( DELIVER-4PKG-VERIFY ?auto_171206 ?auto_171207 ?auto_171208 ?auto_171209 ?auto_171205 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_171284 - OBJ
      ?auto_171285 - OBJ
      ?auto_171286 - OBJ
      ?auto_171287 - OBJ
      ?auto_171283 - LOCATION
    )
    :vars
    (
      ?auto_171288 - TRUCK
      ?auto_171290 - LOCATION
      ?auto_171289 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_171285 ?auto_171284 ) ) ( not ( = ?auto_171286 ?auto_171284 ) ) ( not ( = ?auto_171286 ?auto_171285 ) ) ( not ( = ?auto_171287 ?auto_171284 ) ) ( not ( = ?auto_171287 ?auto_171285 ) ) ( not ( = ?auto_171287 ?auto_171286 ) ) ( TRUCK-AT ?auto_171288 ?auto_171290 ) ( IN-CITY ?auto_171290 ?auto_171289 ) ( IN-CITY ?auto_171283 ?auto_171289 ) ( not ( = ?auto_171283 ?auto_171290 ) ) ( OBJ-AT ?auto_171286 ?auto_171283 ) ( OBJ-AT ?auto_171284 ?auto_171290 ) ( OBJ-AT ?auto_171285 ?auto_171283 ) ( OBJ-AT ?auto_171287 ?auto_171283 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171286 ?auto_171284 ?auto_171283 )
      ( DELIVER-4PKG-VERIFY ?auto_171284 ?auto_171285 ?auto_171286 ?auto_171287 ?auto_171283 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_171308 - OBJ
      ?auto_171309 - OBJ
      ?auto_171310 - OBJ
      ?auto_171311 - OBJ
      ?auto_171307 - LOCATION
    )
    :vars
    (
      ?auto_171312 - TRUCK
      ?auto_171314 - LOCATION
      ?auto_171313 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_171309 ?auto_171308 ) ) ( not ( = ?auto_171310 ?auto_171308 ) ) ( not ( = ?auto_171310 ?auto_171309 ) ) ( not ( = ?auto_171311 ?auto_171308 ) ) ( not ( = ?auto_171311 ?auto_171309 ) ) ( not ( = ?auto_171311 ?auto_171310 ) ) ( TRUCK-AT ?auto_171312 ?auto_171314 ) ( IN-CITY ?auto_171314 ?auto_171313 ) ( IN-CITY ?auto_171307 ?auto_171313 ) ( not ( = ?auto_171307 ?auto_171314 ) ) ( OBJ-AT ?auto_171311 ?auto_171307 ) ( OBJ-AT ?auto_171308 ?auto_171314 ) ( OBJ-AT ?auto_171309 ?auto_171307 ) ( OBJ-AT ?auto_171310 ?auto_171307 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171311 ?auto_171308 ?auto_171307 )
      ( DELIVER-4PKG-VERIFY ?auto_171308 ?auto_171309 ?auto_171310 ?auto_171311 ?auto_171307 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_171550 - OBJ
      ?auto_171549 - LOCATION
    )
    :vars
    (
      ?auto_171551 - OBJ
      ?auto_171554 - LOCATION
      ?auto_171553 - CITY
      ?auto_171552 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171550 ?auto_171551 ) ) ( IN-CITY ?auto_171554 ?auto_171553 ) ( IN-CITY ?auto_171549 ?auto_171553 ) ( not ( = ?auto_171549 ?auto_171554 ) ) ( OBJ-AT ?auto_171551 ?auto_171549 ) ( OBJ-AT ?auto_171550 ?auto_171554 ) ( TRUCK-AT ?auto_171552 ?auto_171549 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_171552 ?auto_171549 ?auto_171554 ?auto_171553 )
      ( DELIVER-2PKG ?auto_171551 ?auto_171550 ?auto_171549 )
      ( DELIVER-1PKG-VERIFY ?auto_171550 ?auto_171549 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_171556 - OBJ
      ?auto_171557 - OBJ
      ?auto_171555 - LOCATION
    )
    :vars
    (
      ?auto_171559 - LOCATION
      ?auto_171560 - CITY
      ?auto_171558 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171557 ?auto_171556 ) ) ( IN-CITY ?auto_171559 ?auto_171560 ) ( IN-CITY ?auto_171555 ?auto_171560 ) ( not ( = ?auto_171555 ?auto_171559 ) ) ( OBJ-AT ?auto_171556 ?auto_171555 ) ( OBJ-AT ?auto_171557 ?auto_171559 ) ( TRUCK-AT ?auto_171558 ?auto_171555 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_171557 ?auto_171555 )
      ( DELIVER-2PKG-VERIFY ?auto_171556 ?auto_171557 ?auto_171555 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_171562 - OBJ
      ?auto_171563 - OBJ
      ?auto_171561 - LOCATION
    )
    :vars
    (
      ?auto_171564 - OBJ
      ?auto_171566 - LOCATION
      ?auto_171565 - CITY
      ?auto_171567 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171563 ?auto_171562 ) ) ( not ( = ?auto_171563 ?auto_171564 ) ) ( IN-CITY ?auto_171566 ?auto_171565 ) ( IN-CITY ?auto_171561 ?auto_171565 ) ( not ( = ?auto_171561 ?auto_171566 ) ) ( OBJ-AT ?auto_171564 ?auto_171561 ) ( OBJ-AT ?auto_171563 ?auto_171566 ) ( TRUCK-AT ?auto_171567 ?auto_171561 ) ( OBJ-AT ?auto_171562 ?auto_171561 ) ( not ( = ?auto_171562 ?auto_171564 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171564 ?auto_171563 ?auto_171561 )
      ( DELIVER-2PKG-VERIFY ?auto_171562 ?auto_171563 ?auto_171561 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_171569 - OBJ
      ?auto_171570 - OBJ
      ?auto_171568 - LOCATION
    )
    :vars
    (
      ?auto_171571 - OBJ
      ?auto_171573 - LOCATION
      ?auto_171572 - CITY
      ?auto_171574 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171570 ?auto_171569 ) ) ( not ( = ?auto_171570 ?auto_171571 ) ) ( IN-CITY ?auto_171573 ?auto_171572 ) ( IN-CITY ?auto_171568 ?auto_171572 ) ( not ( = ?auto_171568 ?auto_171573 ) ) ( OBJ-AT ?auto_171571 ?auto_171568 ) ( OBJ-AT ?auto_171570 ?auto_171573 ) ( TRUCK-AT ?auto_171574 ?auto_171568 ) ( OBJ-AT ?auto_171569 ?auto_171568 ) ( not ( = ?auto_171569 ?auto_171571 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171571 ?auto_171570 ?auto_171568 )
      ( DELIVER-2PKG-VERIFY ?auto_171569 ?auto_171570 ?auto_171568 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_171576 - OBJ
      ?auto_171577 - OBJ
      ?auto_171575 - LOCATION
    )
    :vars
    (
      ?auto_171579 - LOCATION
      ?auto_171578 - CITY
      ?auto_171580 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171577 ?auto_171576 ) ) ( IN-CITY ?auto_171579 ?auto_171578 ) ( IN-CITY ?auto_171575 ?auto_171578 ) ( not ( = ?auto_171575 ?auto_171579 ) ) ( OBJ-AT ?auto_171577 ?auto_171575 ) ( OBJ-AT ?auto_171576 ?auto_171579 ) ( TRUCK-AT ?auto_171580 ?auto_171575 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171577 ?auto_171576 ?auto_171575 )
      ( DELIVER-2PKG-VERIFY ?auto_171576 ?auto_171577 ?auto_171575 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_171582 - OBJ
      ?auto_171583 - OBJ
      ?auto_171581 - LOCATION
    )
    :vars
    (
      ?auto_171584 - OBJ
      ?auto_171586 - LOCATION
      ?auto_171585 - CITY
      ?auto_171587 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171583 ?auto_171582 ) ) ( not ( = ?auto_171582 ?auto_171584 ) ) ( IN-CITY ?auto_171586 ?auto_171585 ) ( IN-CITY ?auto_171581 ?auto_171585 ) ( not ( = ?auto_171581 ?auto_171586 ) ) ( OBJ-AT ?auto_171584 ?auto_171581 ) ( OBJ-AT ?auto_171582 ?auto_171586 ) ( TRUCK-AT ?auto_171587 ?auto_171581 ) ( OBJ-AT ?auto_171583 ?auto_171581 ) ( not ( = ?auto_171583 ?auto_171584 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171584 ?auto_171582 ?auto_171581 )
      ( DELIVER-2PKG-VERIFY ?auto_171582 ?auto_171583 ?auto_171581 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_171589 - OBJ
      ?auto_171590 - OBJ
      ?auto_171588 - LOCATION
    )
    :vars
    (
      ?auto_171591 - OBJ
      ?auto_171593 - LOCATION
      ?auto_171592 - CITY
      ?auto_171594 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171590 ?auto_171589 ) ) ( not ( = ?auto_171589 ?auto_171591 ) ) ( IN-CITY ?auto_171593 ?auto_171592 ) ( IN-CITY ?auto_171588 ?auto_171592 ) ( not ( = ?auto_171588 ?auto_171593 ) ) ( OBJ-AT ?auto_171591 ?auto_171588 ) ( OBJ-AT ?auto_171589 ?auto_171593 ) ( TRUCK-AT ?auto_171594 ?auto_171588 ) ( OBJ-AT ?auto_171590 ?auto_171588 ) ( not ( = ?auto_171590 ?auto_171591 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171591 ?auto_171589 ?auto_171588 )
      ( DELIVER-2PKG-VERIFY ?auto_171589 ?auto_171590 ?auto_171588 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_171610 - OBJ
      ?auto_171611 - OBJ
      ?auto_171612 - OBJ
      ?auto_171609 - LOCATION
    )
    :vars
    (
      ?auto_171614 - LOCATION
      ?auto_171613 - CITY
      ?auto_171615 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171611 ?auto_171610 ) ) ( not ( = ?auto_171612 ?auto_171610 ) ) ( not ( = ?auto_171612 ?auto_171611 ) ) ( IN-CITY ?auto_171614 ?auto_171613 ) ( IN-CITY ?auto_171609 ?auto_171613 ) ( not ( = ?auto_171609 ?auto_171614 ) ) ( OBJ-AT ?auto_171610 ?auto_171609 ) ( OBJ-AT ?auto_171612 ?auto_171614 ) ( TRUCK-AT ?auto_171615 ?auto_171609 ) ( OBJ-AT ?auto_171611 ?auto_171609 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171610 ?auto_171612 ?auto_171609 )
      ( DELIVER-3PKG-VERIFY ?auto_171610 ?auto_171611 ?auto_171612 ?auto_171609 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_171617 - OBJ
      ?auto_171618 - OBJ
      ?auto_171619 - OBJ
      ?auto_171616 - LOCATION
    )
    :vars
    (
      ?auto_171621 - LOCATION
      ?auto_171620 - CITY
      ?auto_171622 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171618 ?auto_171617 ) ) ( not ( = ?auto_171619 ?auto_171617 ) ) ( not ( = ?auto_171619 ?auto_171618 ) ) ( IN-CITY ?auto_171621 ?auto_171620 ) ( IN-CITY ?auto_171616 ?auto_171620 ) ( not ( = ?auto_171616 ?auto_171621 ) ) ( OBJ-AT ?auto_171617 ?auto_171616 ) ( OBJ-AT ?auto_171619 ?auto_171621 ) ( TRUCK-AT ?auto_171622 ?auto_171616 ) ( OBJ-AT ?auto_171618 ?auto_171616 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171617 ?auto_171619 ?auto_171616 )
      ( DELIVER-3PKG-VERIFY ?auto_171617 ?auto_171618 ?auto_171619 ?auto_171616 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_171631 - OBJ
      ?auto_171632 - OBJ
      ?auto_171633 - OBJ
      ?auto_171630 - LOCATION
    )
    :vars
    (
      ?auto_171635 - LOCATION
      ?auto_171634 - CITY
      ?auto_171636 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171632 ?auto_171631 ) ) ( not ( = ?auto_171633 ?auto_171631 ) ) ( not ( = ?auto_171633 ?auto_171632 ) ) ( IN-CITY ?auto_171635 ?auto_171634 ) ( IN-CITY ?auto_171630 ?auto_171634 ) ( not ( = ?auto_171630 ?auto_171635 ) ) ( OBJ-AT ?auto_171631 ?auto_171630 ) ( OBJ-AT ?auto_171632 ?auto_171635 ) ( TRUCK-AT ?auto_171636 ?auto_171630 ) ( OBJ-AT ?auto_171633 ?auto_171630 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171631 ?auto_171632 ?auto_171630 )
      ( DELIVER-3PKG-VERIFY ?auto_171631 ?auto_171632 ?auto_171633 ?auto_171630 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_171638 - OBJ
      ?auto_171639 - OBJ
      ?auto_171640 - OBJ
      ?auto_171637 - LOCATION
    )
    :vars
    (
      ?auto_171642 - LOCATION
      ?auto_171641 - CITY
      ?auto_171643 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171639 ?auto_171638 ) ) ( not ( = ?auto_171640 ?auto_171638 ) ) ( not ( = ?auto_171640 ?auto_171639 ) ) ( IN-CITY ?auto_171642 ?auto_171641 ) ( IN-CITY ?auto_171637 ?auto_171641 ) ( not ( = ?auto_171637 ?auto_171642 ) ) ( OBJ-AT ?auto_171638 ?auto_171637 ) ( OBJ-AT ?auto_171639 ?auto_171642 ) ( TRUCK-AT ?auto_171643 ?auto_171637 ) ( OBJ-AT ?auto_171640 ?auto_171637 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171638 ?auto_171639 ?auto_171637 )
      ( DELIVER-3PKG-VERIFY ?auto_171638 ?auto_171639 ?auto_171640 ?auto_171637 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_171652 - OBJ
      ?auto_171653 - OBJ
      ?auto_171654 - OBJ
      ?auto_171651 - LOCATION
    )
    :vars
    (
      ?auto_171656 - LOCATION
      ?auto_171655 - CITY
      ?auto_171657 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171653 ?auto_171652 ) ) ( not ( = ?auto_171654 ?auto_171652 ) ) ( not ( = ?auto_171654 ?auto_171653 ) ) ( IN-CITY ?auto_171656 ?auto_171655 ) ( IN-CITY ?auto_171651 ?auto_171655 ) ( not ( = ?auto_171651 ?auto_171656 ) ) ( OBJ-AT ?auto_171653 ?auto_171651 ) ( OBJ-AT ?auto_171654 ?auto_171656 ) ( TRUCK-AT ?auto_171657 ?auto_171651 ) ( OBJ-AT ?auto_171652 ?auto_171651 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171653 ?auto_171654 ?auto_171651 )
      ( DELIVER-3PKG-VERIFY ?auto_171652 ?auto_171653 ?auto_171654 ?auto_171651 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_171667 - OBJ
      ?auto_171668 - OBJ
      ?auto_171669 - OBJ
      ?auto_171666 - LOCATION
    )
    :vars
    (
      ?auto_171670 - OBJ
      ?auto_171672 - LOCATION
      ?auto_171671 - CITY
      ?auto_171673 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171668 ?auto_171667 ) ) ( not ( = ?auto_171669 ?auto_171667 ) ) ( not ( = ?auto_171669 ?auto_171668 ) ) ( not ( = ?auto_171669 ?auto_171670 ) ) ( IN-CITY ?auto_171672 ?auto_171671 ) ( IN-CITY ?auto_171666 ?auto_171671 ) ( not ( = ?auto_171666 ?auto_171672 ) ) ( OBJ-AT ?auto_171670 ?auto_171666 ) ( OBJ-AT ?auto_171669 ?auto_171672 ) ( TRUCK-AT ?auto_171673 ?auto_171666 ) ( OBJ-AT ?auto_171667 ?auto_171666 ) ( OBJ-AT ?auto_171668 ?auto_171666 ) ( not ( = ?auto_171667 ?auto_171670 ) ) ( not ( = ?auto_171668 ?auto_171670 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171670 ?auto_171669 ?auto_171666 )
      ( DELIVER-3PKG-VERIFY ?auto_171667 ?auto_171668 ?auto_171669 ?auto_171666 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_171675 - OBJ
      ?auto_171676 - OBJ
      ?auto_171677 - OBJ
      ?auto_171674 - LOCATION
    )
    :vars
    (
      ?auto_171679 - LOCATION
      ?auto_171678 - CITY
      ?auto_171680 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171676 ?auto_171675 ) ) ( not ( = ?auto_171677 ?auto_171675 ) ) ( not ( = ?auto_171677 ?auto_171676 ) ) ( IN-CITY ?auto_171679 ?auto_171678 ) ( IN-CITY ?auto_171674 ?auto_171678 ) ( not ( = ?auto_171674 ?auto_171679 ) ) ( OBJ-AT ?auto_171677 ?auto_171674 ) ( OBJ-AT ?auto_171676 ?auto_171679 ) ( TRUCK-AT ?auto_171680 ?auto_171674 ) ( OBJ-AT ?auto_171675 ?auto_171674 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171677 ?auto_171676 ?auto_171674 )
      ( DELIVER-3PKG-VERIFY ?auto_171675 ?auto_171676 ?auto_171677 ?auto_171674 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_171690 - OBJ
      ?auto_171691 - OBJ
      ?auto_171692 - OBJ
      ?auto_171689 - LOCATION
    )
    :vars
    (
      ?auto_171693 - OBJ
      ?auto_171695 - LOCATION
      ?auto_171694 - CITY
      ?auto_171696 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171691 ?auto_171690 ) ) ( not ( = ?auto_171692 ?auto_171690 ) ) ( not ( = ?auto_171692 ?auto_171691 ) ) ( not ( = ?auto_171691 ?auto_171693 ) ) ( IN-CITY ?auto_171695 ?auto_171694 ) ( IN-CITY ?auto_171689 ?auto_171694 ) ( not ( = ?auto_171689 ?auto_171695 ) ) ( OBJ-AT ?auto_171693 ?auto_171689 ) ( OBJ-AT ?auto_171691 ?auto_171695 ) ( TRUCK-AT ?auto_171696 ?auto_171689 ) ( OBJ-AT ?auto_171690 ?auto_171689 ) ( OBJ-AT ?auto_171692 ?auto_171689 ) ( not ( = ?auto_171690 ?auto_171693 ) ) ( not ( = ?auto_171692 ?auto_171693 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171693 ?auto_171691 ?auto_171689 )
      ( DELIVER-3PKG-VERIFY ?auto_171690 ?auto_171691 ?auto_171692 ?auto_171689 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_171706 - OBJ
      ?auto_171707 - OBJ
      ?auto_171708 - OBJ
      ?auto_171705 - LOCATION
    )
    :vars
    (
      ?auto_171710 - LOCATION
      ?auto_171709 - CITY
      ?auto_171711 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171707 ?auto_171706 ) ) ( not ( = ?auto_171708 ?auto_171706 ) ) ( not ( = ?auto_171708 ?auto_171707 ) ) ( IN-CITY ?auto_171710 ?auto_171709 ) ( IN-CITY ?auto_171705 ?auto_171709 ) ( not ( = ?auto_171705 ?auto_171710 ) ) ( OBJ-AT ?auto_171707 ?auto_171705 ) ( OBJ-AT ?auto_171708 ?auto_171710 ) ( TRUCK-AT ?auto_171711 ?auto_171705 ) ( OBJ-AT ?auto_171706 ?auto_171705 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171707 ?auto_171708 ?auto_171705 )
      ( DELIVER-3PKG-VERIFY ?auto_171706 ?auto_171707 ?auto_171708 ?auto_171705 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_171713 - OBJ
      ?auto_171714 - OBJ
      ?auto_171715 - OBJ
      ?auto_171712 - LOCATION
    )
    :vars
    (
      ?auto_171716 - OBJ
      ?auto_171718 - LOCATION
      ?auto_171717 - CITY
      ?auto_171719 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171714 ?auto_171713 ) ) ( not ( = ?auto_171715 ?auto_171713 ) ) ( not ( = ?auto_171715 ?auto_171714 ) ) ( not ( = ?auto_171715 ?auto_171716 ) ) ( IN-CITY ?auto_171718 ?auto_171717 ) ( IN-CITY ?auto_171712 ?auto_171717 ) ( not ( = ?auto_171712 ?auto_171718 ) ) ( OBJ-AT ?auto_171716 ?auto_171712 ) ( OBJ-AT ?auto_171715 ?auto_171718 ) ( TRUCK-AT ?auto_171719 ?auto_171712 ) ( OBJ-AT ?auto_171713 ?auto_171712 ) ( OBJ-AT ?auto_171714 ?auto_171712 ) ( not ( = ?auto_171713 ?auto_171716 ) ) ( not ( = ?auto_171714 ?auto_171716 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171716 ?auto_171715 ?auto_171712 )
      ( DELIVER-3PKG-VERIFY ?auto_171713 ?auto_171714 ?auto_171715 ?auto_171712 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_171729 - OBJ
      ?auto_171730 - OBJ
      ?auto_171731 - OBJ
      ?auto_171728 - LOCATION
    )
    :vars
    (
      ?auto_171733 - LOCATION
      ?auto_171732 - CITY
      ?auto_171734 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171730 ?auto_171729 ) ) ( not ( = ?auto_171731 ?auto_171729 ) ) ( not ( = ?auto_171731 ?auto_171730 ) ) ( IN-CITY ?auto_171733 ?auto_171732 ) ( IN-CITY ?auto_171728 ?auto_171732 ) ( not ( = ?auto_171728 ?auto_171733 ) ) ( OBJ-AT ?auto_171731 ?auto_171728 ) ( OBJ-AT ?auto_171730 ?auto_171733 ) ( TRUCK-AT ?auto_171734 ?auto_171728 ) ( OBJ-AT ?auto_171729 ?auto_171728 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171731 ?auto_171730 ?auto_171728 )
      ( DELIVER-3PKG-VERIFY ?auto_171729 ?auto_171730 ?auto_171731 ?auto_171728 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_171736 - OBJ
      ?auto_171737 - OBJ
      ?auto_171738 - OBJ
      ?auto_171735 - LOCATION
    )
    :vars
    (
      ?auto_171739 - OBJ
      ?auto_171741 - LOCATION
      ?auto_171740 - CITY
      ?auto_171742 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171737 ?auto_171736 ) ) ( not ( = ?auto_171738 ?auto_171736 ) ) ( not ( = ?auto_171738 ?auto_171737 ) ) ( not ( = ?auto_171737 ?auto_171739 ) ) ( IN-CITY ?auto_171741 ?auto_171740 ) ( IN-CITY ?auto_171735 ?auto_171740 ) ( not ( = ?auto_171735 ?auto_171741 ) ) ( OBJ-AT ?auto_171739 ?auto_171735 ) ( OBJ-AT ?auto_171737 ?auto_171741 ) ( TRUCK-AT ?auto_171742 ?auto_171735 ) ( OBJ-AT ?auto_171736 ?auto_171735 ) ( OBJ-AT ?auto_171738 ?auto_171735 ) ( not ( = ?auto_171736 ?auto_171739 ) ) ( not ( = ?auto_171738 ?auto_171739 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171739 ?auto_171737 ?auto_171735 )
      ( DELIVER-3PKG-VERIFY ?auto_171736 ?auto_171737 ?auto_171738 ?auto_171735 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_171767 - OBJ
      ?auto_171768 - OBJ
      ?auto_171769 - OBJ
      ?auto_171766 - LOCATION
    )
    :vars
    (
      ?auto_171771 - LOCATION
      ?auto_171770 - CITY
      ?auto_171772 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171768 ?auto_171767 ) ) ( not ( = ?auto_171769 ?auto_171767 ) ) ( not ( = ?auto_171769 ?auto_171768 ) ) ( IN-CITY ?auto_171771 ?auto_171770 ) ( IN-CITY ?auto_171766 ?auto_171770 ) ( not ( = ?auto_171766 ?auto_171771 ) ) ( OBJ-AT ?auto_171768 ?auto_171766 ) ( OBJ-AT ?auto_171767 ?auto_171771 ) ( TRUCK-AT ?auto_171772 ?auto_171766 ) ( OBJ-AT ?auto_171769 ?auto_171766 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171768 ?auto_171767 ?auto_171766 )
      ( DELIVER-3PKG-VERIFY ?auto_171767 ?auto_171768 ?auto_171769 ?auto_171766 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_171774 - OBJ
      ?auto_171775 - OBJ
      ?auto_171776 - OBJ
      ?auto_171773 - LOCATION
    )
    :vars
    (
      ?auto_171778 - LOCATION
      ?auto_171777 - CITY
      ?auto_171779 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171775 ?auto_171774 ) ) ( not ( = ?auto_171776 ?auto_171774 ) ) ( not ( = ?auto_171776 ?auto_171775 ) ) ( IN-CITY ?auto_171778 ?auto_171777 ) ( IN-CITY ?auto_171773 ?auto_171777 ) ( not ( = ?auto_171773 ?auto_171778 ) ) ( OBJ-AT ?auto_171775 ?auto_171773 ) ( OBJ-AT ?auto_171774 ?auto_171778 ) ( TRUCK-AT ?auto_171779 ?auto_171773 ) ( OBJ-AT ?auto_171776 ?auto_171773 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171775 ?auto_171774 ?auto_171773 )
      ( DELIVER-3PKG-VERIFY ?auto_171774 ?auto_171775 ?auto_171776 ?auto_171773 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_171788 - OBJ
      ?auto_171789 - OBJ
      ?auto_171790 - OBJ
      ?auto_171787 - LOCATION
    )
    :vars
    (
      ?auto_171792 - LOCATION
      ?auto_171791 - CITY
      ?auto_171793 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171789 ?auto_171788 ) ) ( not ( = ?auto_171790 ?auto_171788 ) ) ( not ( = ?auto_171790 ?auto_171789 ) ) ( IN-CITY ?auto_171792 ?auto_171791 ) ( IN-CITY ?auto_171787 ?auto_171791 ) ( not ( = ?auto_171787 ?auto_171792 ) ) ( OBJ-AT ?auto_171790 ?auto_171787 ) ( OBJ-AT ?auto_171788 ?auto_171792 ) ( TRUCK-AT ?auto_171793 ?auto_171787 ) ( OBJ-AT ?auto_171789 ?auto_171787 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171790 ?auto_171788 ?auto_171787 )
      ( DELIVER-3PKG-VERIFY ?auto_171788 ?auto_171789 ?auto_171790 ?auto_171787 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_171803 - OBJ
      ?auto_171804 - OBJ
      ?auto_171805 - OBJ
      ?auto_171802 - LOCATION
    )
    :vars
    (
      ?auto_171806 - OBJ
      ?auto_171808 - LOCATION
      ?auto_171807 - CITY
      ?auto_171809 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171804 ?auto_171803 ) ) ( not ( = ?auto_171805 ?auto_171803 ) ) ( not ( = ?auto_171805 ?auto_171804 ) ) ( not ( = ?auto_171803 ?auto_171806 ) ) ( IN-CITY ?auto_171808 ?auto_171807 ) ( IN-CITY ?auto_171802 ?auto_171807 ) ( not ( = ?auto_171802 ?auto_171808 ) ) ( OBJ-AT ?auto_171806 ?auto_171802 ) ( OBJ-AT ?auto_171803 ?auto_171808 ) ( TRUCK-AT ?auto_171809 ?auto_171802 ) ( OBJ-AT ?auto_171804 ?auto_171802 ) ( OBJ-AT ?auto_171805 ?auto_171802 ) ( not ( = ?auto_171804 ?auto_171806 ) ) ( not ( = ?auto_171805 ?auto_171806 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171806 ?auto_171803 ?auto_171802 )
      ( DELIVER-3PKG-VERIFY ?auto_171803 ?auto_171804 ?auto_171805 ?auto_171802 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_171819 - OBJ
      ?auto_171820 - OBJ
      ?auto_171821 - OBJ
      ?auto_171818 - LOCATION
    )
    :vars
    (
      ?auto_171823 - LOCATION
      ?auto_171822 - CITY
      ?auto_171824 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171820 ?auto_171819 ) ) ( not ( = ?auto_171821 ?auto_171819 ) ) ( not ( = ?auto_171821 ?auto_171820 ) ) ( IN-CITY ?auto_171823 ?auto_171822 ) ( IN-CITY ?auto_171818 ?auto_171822 ) ( not ( = ?auto_171818 ?auto_171823 ) ) ( OBJ-AT ?auto_171821 ?auto_171818 ) ( OBJ-AT ?auto_171819 ?auto_171823 ) ( TRUCK-AT ?auto_171824 ?auto_171818 ) ( OBJ-AT ?auto_171820 ?auto_171818 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171821 ?auto_171819 ?auto_171818 )
      ( DELIVER-3PKG-VERIFY ?auto_171819 ?auto_171820 ?auto_171821 ?auto_171818 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_171826 - OBJ
      ?auto_171827 - OBJ
      ?auto_171828 - OBJ
      ?auto_171825 - LOCATION
    )
    :vars
    (
      ?auto_171829 - OBJ
      ?auto_171831 - LOCATION
      ?auto_171830 - CITY
      ?auto_171832 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171827 ?auto_171826 ) ) ( not ( = ?auto_171828 ?auto_171826 ) ) ( not ( = ?auto_171828 ?auto_171827 ) ) ( not ( = ?auto_171826 ?auto_171829 ) ) ( IN-CITY ?auto_171831 ?auto_171830 ) ( IN-CITY ?auto_171825 ?auto_171830 ) ( not ( = ?auto_171825 ?auto_171831 ) ) ( OBJ-AT ?auto_171829 ?auto_171825 ) ( OBJ-AT ?auto_171826 ?auto_171831 ) ( TRUCK-AT ?auto_171832 ?auto_171825 ) ( OBJ-AT ?auto_171827 ?auto_171825 ) ( OBJ-AT ?auto_171828 ?auto_171825 ) ( not ( = ?auto_171827 ?auto_171829 ) ) ( not ( = ?auto_171828 ?auto_171829 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171829 ?auto_171826 ?auto_171825 )
      ( DELIVER-3PKG-VERIFY ?auto_171826 ?auto_171827 ?auto_171828 ?auto_171825 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_171953 - OBJ
      ?auto_171954 - OBJ
      ?auto_171955 - OBJ
      ?auto_171956 - OBJ
      ?auto_171952 - LOCATION
    )
    :vars
    (
      ?auto_171958 - LOCATION
      ?auto_171957 - CITY
      ?auto_171959 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171954 ?auto_171953 ) ) ( not ( = ?auto_171955 ?auto_171953 ) ) ( not ( = ?auto_171955 ?auto_171954 ) ) ( not ( = ?auto_171956 ?auto_171953 ) ) ( not ( = ?auto_171956 ?auto_171954 ) ) ( not ( = ?auto_171956 ?auto_171955 ) ) ( IN-CITY ?auto_171958 ?auto_171957 ) ( IN-CITY ?auto_171952 ?auto_171957 ) ( not ( = ?auto_171952 ?auto_171958 ) ) ( OBJ-AT ?auto_171953 ?auto_171952 ) ( OBJ-AT ?auto_171956 ?auto_171958 ) ( TRUCK-AT ?auto_171959 ?auto_171952 ) ( OBJ-AT ?auto_171954 ?auto_171952 ) ( OBJ-AT ?auto_171955 ?auto_171952 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171953 ?auto_171956 ?auto_171952 )
      ( DELIVER-4PKG-VERIFY ?auto_171953 ?auto_171954 ?auto_171955 ?auto_171956 ?auto_171952 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_171977 - OBJ
      ?auto_171978 - OBJ
      ?auto_171979 - OBJ
      ?auto_171980 - OBJ
      ?auto_171976 - LOCATION
    )
    :vars
    (
      ?auto_171982 - LOCATION
      ?auto_171981 - CITY
      ?auto_171983 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_171978 ?auto_171977 ) ) ( not ( = ?auto_171979 ?auto_171977 ) ) ( not ( = ?auto_171979 ?auto_171978 ) ) ( not ( = ?auto_171980 ?auto_171977 ) ) ( not ( = ?auto_171980 ?auto_171978 ) ) ( not ( = ?auto_171980 ?auto_171979 ) ) ( IN-CITY ?auto_171982 ?auto_171981 ) ( IN-CITY ?auto_171976 ?auto_171981 ) ( not ( = ?auto_171976 ?auto_171982 ) ) ( OBJ-AT ?auto_171977 ?auto_171976 ) ( OBJ-AT ?auto_171979 ?auto_171982 ) ( TRUCK-AT ?auto_171983 ?auto_171976 ) ( OBJ-AT ?auto_171978 ?auto_171976 ) ( OBJ-AT ?auto_171980 ?auto_171976 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_171977 ?auto_171979 ?auto_171976 )
      ( DELIVER-4PKG-VERIFY ?auto_171977 ?auto_171978 ?auto_171979 ?auto_171980 ?auto_171976 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_172001 - OBJ
      ?auto_172002 - OBJ
      ?auto_172003 - OBJ
      ?auto_172004 - OBJ
      ?auto_172000 - LOCATION
    )
    :vars
    (
      ?auto_172006 - LOCATION
      ?auto_172005 - CITY
      ?auto_172007 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_172002 ?auto_172001 ) ) ( not ( = ?auto_172003 ?auto_172001 ) ) ( not ( = ?auto_172003 ?auto_172002 ) ) ( not ( = ?auto_172004 ?auto_172001 ) ) ( not ( = ?auto_172004 ?auto_172002 ) ) ( not ( = ?auto_172004 ?auto_172003 ) ) ( IN-CITY ?auto_172006 ?auto_172005 ) ( IN-CITY ?auto_172000 ?auto_172005 ) ( not ( = ?auto_172000 ?auto_172006 ) ) ( OBJ-AT ?auto_172001 ?auto_172000 ) ( OBJ-AT ?auto_172004 ?auto_172006 ) ( TRUCK-AT ?auto_172007 ?auto_172000 ) ( OBJ-AT ?auto_172002 ?auto_172000 ) ( OBJ-AT ?auto_172003 ?auto_172000 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_172001 ?auto_172004 ?auto_172000 )
      ( DELIVER-4PKG-VERIFY ?auto_172001 ?auto_172002 ?auto_172003 ?auto_172004 ?auto_172000 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_172025 - OBJ
      ?auto_172026 - OBJ
      ?auto_172027 - OBJ
      ?auto_172028 - OBJ
      ?auto_172024 - LOCATION
    )
    :vars
    (
      ?auto_172030 - LOCATION
      ?auto_172029 - CITY
      ?auto_172031 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_172026 ?auto_172025 ) ) ( not ( = ?auto_172027 ?auto_172025 ) ) ( not ( = ?auto_172027 ?auto_172026 ) ) ( not ( = ?auto_172028 ?auto_172025 ) ) ( not ( = ?auto_172028 ?auto_172026 ) ) ( not ( = ?auto_172028 ?auto_172027 ) ) ( IN-CITY ?auto_172030 ?auto_172029 ) ( IN-CITY ?auto_172024 ?auto_172029 ) ( not ( = ?auto_172024 ?auto_172030 ) ) ( OBJ-AT ?auto_172025 ?auto_172024 ) ( OBJ-AT ?auto_172027 ?auto_172030 ) ( TRUCK-AT ?auto_172031 ?auto_172024 ) ( OBJ-AT ?auto_172026 ?auto_172024 ) ( OBJ-AT ?auto_172028 ?auto_172024 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_172025 ?auto_172027 ?auto_172024 )
      ( DELIVER-4PKG-VERIFY ?auto_172025 ?auto_172026 ?auto_172027 ?auto_172028 ?auto_172024 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_172097 - OBJ
      ?auto_172098 - OBJ
      ?auto_172099 - OBJ
      ?auto_172100 - OBJ
      ?auto_172096 - LOCATION
    )
    :vars
    (
      ?auto_172102 - LOCATION
      ?auto_172101 - CITY
      ?auto_172103 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_172098 ?auto_172097 ) ) ( not ( = ?auto_172099 ?auto_172097 ) ) ( not ( = ?auto_172099 ?auto_172098 ) ) ( not ( = ?auto_172100 ?auto_172097 ) ) ( not ( = ?auto_172100 ?auto_172098 ) ) ( not ( = ?auto_172100 ?auto_172099 ) ) ( IN-CITY ?auto_172102 ?auto_172101 ) ( IN-CITY ?auto_172096 ?auto_172101 ) ( not ( = ?auto_172096 ?auto_172102 ) ) ( OBJ-AT ?auto_172097 ?auto_172096 ) ( OBJ-AT ?auto_172098 ?auto_172102 ) ( TRUCK-AT ?auto_172103 ?auto_172096 ) ( OBJ-AT ?auto_172099 ?auto_172096 ) ( OBJ-AT ?auto_172100 ?auto_172096 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_172097 ?auto_172098 ?auto_172096 )
      ( DELIVER-4PKG-VERIFY ?auto_172097 ?auto_172098 ?auto_172099 ?auto_172100 ?auto_172096 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_172121 - OBJ
      ?auto_172122 - OBJ
      ?auto_172123 - OBJ
      ?auto_172124 - OBJ
      ?auto_172120 - LOCATION
    )
    :vars
    (
      ?auto_172126 - LOCATION
      ?auto_172125 - CITY
      ?auto_172127 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_172122 ?auto_172121 ) ) ( not ( = ?auto_172123 ?auto_172121 ) ) ( not ( = ?auto_172123 ?auto_172122 ) ) ( not ( = ?auto_172124 ?auto_172121 ) ) ( not ( = ?auto_172124 ?auto_172122 ) ) ( not ( = ?auto_172124 ?auto_172123 ) ) ( IN-CITY ?auto_172126 ?auto_172125 ) ( IN-CITY ?auto_172120 ?auto_172125 ) ( not ( = ?auto_172120 ?auto_172126 ) ) ( OBJ-AT ?auto_172121 ?auto_172120 ) ( OBJ-AT ?auto_172122 ?auto_172126 ) ( TRUCK-AT ?auto_172127 ?auto_172120 ) ( OBJ-AT ?auto_172123 ?auto_172120 ) ( OBJ-AT ?auto_172124 ?auto_172120 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_172121 ?auto_172122 ?auto_172120 )
      ( DELIVER-4PKG-VERIFY ?auto_172121 ?auto_172122 ?auto_172123 ?auto_172124 ?auto_172120 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_172193 - OBJ
      ?auto_172194 - OBJ
      ?auto_172195 - OBJ
      ?auto_172196 - OBJ
      ?auto_172192 - LOCATION
    )
    :vars
    (
      ?auto_172198 - LOCATION
      ?auto_172197 - CITY
      ?auto_172199 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_172194 ?auto_172193 ) ) ( not ( = ?auto_172195 ?auto_172193 ) ) ( not ( = ?auto_172195 ?auto_172194 ) ) ( not ( = ?auto_172196 ?auto_172193 ) ) ( not ( = ?auto_172196 ?auto_172194 ) ) ( not ( = ?auto_172196 ?auto_172195 ) ) ( IN-CITY ?auto_172198 ?auto_172197 ) ( IN-CITY ?auto_172192 ?auto_172197 ) ( not ( = ?auto_172192 ?auto_172198 ) ) ( OBJ-AT ?auto_172194 ?auto_172192 ) ( OBJ-AT ?auto_172196 ?auto_172198 ) ( TRUCK-AT ?auto_172199 ?auto_172192 ) ( OBJ-AT ?auto_172193 ?auto_172192 ) ( OBJ-AT ?auto_172195 ?auto_172192 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_172194 ?auto_172196 ?auto_172192 )
      ( DELIVER-4PKG-VERIFY ?auto_172193 ?auto_172194 ?auto_172195 ?auto_172196 ?auto_172192 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_172217 - OBJ
      ?auto_172218 - OBJ
      ?auto_172219 - OBJ
      ?auto_172220 - OBJ
      ?auto_172216 - LOCATION
    )
    :vars
    (
      ?auto_172222 - LOCATION
      ?auto_172221 - CITY
      ?auto_172223 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_172218 ?auto_172217 ) ) ( not ( = ?auto_172219 ?auto_172217 ) ) ( not ( = ?auto_172219 ?auto_172218 ) ) ( not ( = ?auto_172220 ?auto_172217 ) ) ( not ( = ?auto_172220 ?auto_172218 ) ) ( not ( = ?auto_172220 ?auto_172219 ) ) ( IN-CITY ?auto_172222 ?auto_172221 ) ( IN-CITY ?auto_172216 ?auto_172221 ) ( not ( = ?auto_172216 ?auto_172222 ) ) ( OBJ-AT ?auto_172218 ?auto_172216 ) ( OBJ-AT ?auto_172219 ?auto_172222 ) ( TRUCK-AT ?auto_172223 ?auto_172216 ) ( OBJ-AT ?auto_172217 ?auto_172216 ) ( OBJ-AT ?auto_172220 ?auto_172216 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_172218 ?auto_172219 ?auto_172216 )
      ( DELIVER-4PKG-VERIFY ?auto_172217 ?auto_172218 ?auto_172219 ?auto_172220 ?auto_172216 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_172294 - OBJ
      ?auto_172295 - OBJ
      ?auto_172296 - OBJ
      ?auto_172297 - OBJ
      ?auto_172293 - LOCATION
    )
    :vars
    (
      ?auto_172299 - LOCATION
      ?auto_172298 - CITY
      ?auto_172300 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_172295 ?auto_172294 ) ) ( not ( = ?auto_172296 ?auto_172294 ) ) ( not ( = ?auto_172296 ?auto_172295 ) ) ( not ( = ?auto_172297 ?auto_172294 ) ) ( not ( = ?auto_172297 ?auto_172295 ) ) ( not ( = ?auto_172297 ?auto_172296 ) ) ( IN-CITY ?auto_172299 ?auto_172298 ) ( IN-CITY ?auto_172293 ?auto_172298 ) ( not ( = ?auto_172293 ?auto_172299 ) ) ( OBJ-AT ?auto_172296 ?auto_172293 ) ( OBJ-AT ?auto_172297 ?auto_172299 ) ( TRUCK-AT ?auto_172300 ?auto_172293 ) ( OBJ-AT ?auto_172294 ?auto_172293 ) ( OBJ-AT ?auto_172295 ?auto_172293 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_172296 ?auto_172297 ?auto_172293 )
      ( DELIVER-4PKG-VERIFY ?auto_172294 ?auto_172295 ?auto_172296 ?auto_172297 ?auto_172293 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_172320 - OBJ
      ?auto_172321 - OBJ
      ?auto_172322 - OBJ
      ?auto_172323 - OBJ
      ?auto_172319 - LOCATION
    )
    :vars
    (
      ?auto_172325 - LOCATION
      ?auto_172324 - CITY
      ?auto_172326 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_172321 ?auto_172320 ) ) ( not ( = ?auto_172322 ?auto_172320 ) ) ( not ( = ?auto_172322 ?auto_172321 ) ) ( not ( = ?auto_172323 ?auto_172320 ) ) ( not ( = ?auto_172323 ?auto_172321 ) ) ( not ( = ?auto_172323 ?auto_172322 ) ) ( IN-CITY ?auto_172325 ?auto_172324 ) ( IN-CITY ?auto_172319 ?auto_172324 ) ( not ( = ?auto_172319 ?auto_172325 ) ) ( OBJ-AT ?auto_172323 ?auto_172319 ) ( OBJ-AT ?auto_172322 ?auto_172325 ) ( TRUCK-AT ?auto_172326 ?auto_172319 ) ( OBJ-AT ?auto_172320 ?auto_172319 ) ( OBJ-AT ?auto_172321 ?auto_172319 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_172323 ?auto_172322 ?auto_172319 )
      ( DELIVER-4PKG-VERIFY ?auto_172320 ?auto_172321 ?auto_172322 ?auto_172323 ?auto_172319 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_172371 - OBJ
      ?auto_172372 - OBJ
      ?auto_172373 - OBJ
      ?auto_172374 - OBJ
      ?auto_172370 - LOCATION
    )
    :vars
    (
      ?auto_172376 - LOCATION
      ?auto_172375 - CITY
      ?auto_172377 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_172372 ?auto_172371 ) ) ( not ( = ?auto_172373 ?auto_172371 ) ) ( not ( = ?auto_172373 ?auto_172372 ) ) ( not ( = ?auto_172374 ?auto_172371 ) ) ( not ( = ?auto_172374 ?auto_172372 ) ) ( not ( = ?auto_172374 ?auto_172373 ) ) ( IN-CITY ?auto_172376 ?auto_172375 ) ( IN-CITY ?auto_172370 ?auto_172375 ) ( not ( = ?auto_172370 ?auto_172376 ) ) ( OBJ-AT ?auto_172373 ?auto_172370 ) ( OBJ-AT ?auto_172372 ?auto_172376 ) ( TRUCK-AT ?auto_172377 ?auto_172370 ) ( OBJ-AT ?auto_172371 ?auto_172370 ) ( OBJ-AT ?auto_172374 ?auto_172370 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_172373 ?auto_172372 ?auto_172370 )
      ( DELIVER-4PKG-VERIFY ?auto_172371 ?auto_172372 ?auto_172373 ?auto_172374 ?auto_172370 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_172422 - OBJ
      ?auto_172423 - OBJ
      ?auto_172424 - OBJ
      ?auto_172425 - OBJ
      ?auto_172421 - LOCATION
    )
    :vars
    (
      ?auto_172427 - LOCATION
      ?auto_172426 - CITY
      ?auto_172428 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_172423 ?auto_172422 ) ) ( not ( = ?auto_172424 ?auto_172422 ) ) ( not ( = ?auto_172424 ?auto_172423 ) ) ( not ( = ?auto_172425 ?auto_172422 ) ) ( not ( = ?auto_172425 ?auto_172423 ) ) ( not ( = ?auto_172425 ?auto_172424 ) ) ( IN-CITY ?auto_172427 ?auto_172426 ) ( IN-CITY ?auto_172421 ?auto_172426 ) ( not ( = ?auto_172421 ?auto_172427 ) ) ( OBJ-AT ?auto_172425 ?auto_172421 ) ( OBJ-AT ?auto_172423 ?auto_172427 ) ( TRUCK-AT ?auto_172428 ?auto_172421 ) ( OBJ-AT ?auto_172422 ?auto_172421 ) ( OBJ-AT ?auto_172424 ?auto_172421 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_172425 ?auto_172423 ?auto_172421 )
      ( DELIVER-4PKG-VERIFY ?auto_172422 ?auto_172423 ?auto_172424 ?auto_172425 ?auto_172421 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_172500 - OBJ
      ?auto_172501 - OBJ
      ?auto_172502 - OBJ
      ?auto_172503 - OBJ
      ?auto_172499 - LOCATION
    )
    :vars
    (
      ?auto_172505 - LOCATION
      ?auto_172504 - CITY
      ?auto_172506 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_172501 ?auto_172500 ) ) ( not ( = ?auto_172502 ?auto_172500 ) ) ( not ( = ?auto_172502 ?auto_172501 ) ) ( not ( = ?auto_172503 ?auto_172500 ) ) ( not ( = ?auto_172503 ?auto_172501 ) ) ( not ( = ?auto_172503 ?auto_172502 ) ) ( IN-CITY ?auto_172505 ?auto_172504 ) ( IN-CITY ?auto_172499 ?auto_172504 ) ( not ( = ?auto_172499 ?auto_172505 ) ) ( OBJ-AT ?auto_172501 ?auto_172499 ) ( OBJ-AT ?auto_172503 ?auto_172505 ) ( TRUCK-AT ?auto_172506 ?auto_172499 ) ( OBJ-AT ?auto_172500 ?auto_172499 ) ( OBJ-AT ?auto_172502 ?auto_172499 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_172501 ?auto_172503 ?auto_172499 )
      ( DELIVER-4PKG-VERIFY ?auto_172500 ?auto_172501 ?auto_172502 ?auto_172503 ?auto_172499 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_172524 - OBJ
      ?auto_172525 - OBJ
      ?auto_172526 - OBJ
      ?auto_172527 - OBJ
      ?auto_172523 - LOCATION
    )
    :vars
    (
      ?auto_172529 - LOCATION
      ?auto_172528 - CITY
      ?auto_172530 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_172525 ?auto_172524 ) ) ( not ( = ?auto_172526 ?auto_172524 ) ) ( not ( = ?auto_172526 ?auto_172525 ) ) ( not ( = ?auto_172527 ?auto_172524 ) ) ( not ( = ?auto_172527 ?auto_172525 ) ) ( not ( = ?auto_172527 ?auto_172526 ) ) ( IN-CITY ?auto_172529 ?auto_172528 ) ( IN-CITY ?auto_172523 ?auto_172528 ) ( not ( = ?auto_172523 ?auto_172529 ) ) ( OBJ-AT ?auto_172525 ?auto_172523 ) ( OBJ-AT ?auto_172526 ?auto_172529 ) ( TRUCK-AT ?auto_172530 ?auto_172523 ) ( OBJ-AT ?auto_172524 ?auto_172523 ) ( OBJ-AT ?auto_172527 ?auto_172523 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_172525 ?auto_172526 ?auto_172523 )
      ( DELIVER-4PKG-VERIFY ?auto_172524 ?auto_172525 ?auto_172526 ?auto_172527 ?auto_172523 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_172548 - OBJ
      ?auto_172549 - OBJ
      ?auto_172550 - OBJ
      ?auto_172551 - OBJ
      ?auto_172547 - LOCATION
    )
    :vars
    (
      ?auto_172553 - LOCATION
      ?auto_172552 - CITY
      ?auto_172554 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_172549 ?auto_172548 ) ) ( not ( = ?auto_172550 ?auto_172548 ) ) ( not ( = ?auto_172550 ?auto_172549 ) ) ( not ( = ?auto_172551 ?auto_172548 ) ) ( not ( = ?auto_172551 ?auto_172549 ) ) ( not ( = ?auto_172551 ?auto_172550 ) ) ( IN-CITY ?auto_172553 ?auto_172552 ) ( IN-CITY ?auto_172547 ?auto_172552 ) ( not ( = ?auto_172547 ?auto_172553 ) ) ( OBJ-AT ?auto_172550 ?auto_172547 ) ( OBJ-AT ?auto_172551 ?auto_172553 ) ( TRUCK-AT ?auto_172554 ?auto_172547 ) ( OBJ-AT ?auto_172548 ?auto_172547 ) ( OBJ-AT ?auto_172549 ?auto_172547 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_172550 ?auto_172551 ?auto_172547 )
      ( DELIVER-4PKG-VERIFY ?auto_172548 ?auto_172549 ?auto_172550 ?auto_172551 ?auto_172547 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_172574 - OBJ
      ?auto_172575 - OBJ
      ?auto_172576 - OBJ
      ?auto_172577 - OBJ
      ?auto_172573 - LOCATION
    )
    :vars
    (
      ?auto_172579 - LOCATION
      ?auto_172578 - CITY
      ?auto_172580 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_172575 ?auto_172574 ) ) ( not ( = ?auto_172576 ?auto_172574 ) ) ( not ( = ?auto_172576 ?auto_172575 ) ) ( not ( = ?auto_172577 ?auto_172574 ) ) ( not ( = ?auto_172577 ?auto_172575 ) ) ( not ( = ?auto_172577 ?auto_172576 ) ) ( IN-CITY ?auto_172579 ?auto_172578 ) ( IN-CITY ?auto_172573 ?auto_172578 ) ( not ( = ?auto_172573 ?auto_172579 ) ) ( OBJ-AT ?auto_172577 ?auto_172573 ) ( OBJ-AT ?auto_172576 ?auto_172579 ) ( TRUCK-AT ?auto_172580 ?auto_172573 ) ( OBJ-AT ?auto_172574 ?auto_172573 ) ( OBJ-AT ?auto_172575 ?auto_172573 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_172577 ?auto_172576 ?auto_172573 )
      ( DELIVER-4PKG-VERIFY ?auto_172574 ?auto_172575 ?auto_172576 ?auto_172577 ?auto_172573 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_172678 - OBJ
      ?auto_172679 - OBJ
      ?auto_172680 - OBJ
      ?auto_172681 - OBJ
      ?auto_172677 - LOCATION
    )
    :vars
    (
      ?auto_172683 - LOCATION
      ?auto_172682 - CITY
      ?auto_172684 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_172679 ?auto_172678 ) ) ( not ( = ?auto_172680 ?auto_172678 ) ) ( not ( = ?auto_172680 ?auto_172679 ) ) ( not ( = ?auto_172681 ?auto_172678 ) ) ( not ( = ?auto_172681 ?auto_172679 ) ) ( not ( = ?auto_172681 ?auto_172680 ) ) ( IN-CITY ?auto_172683 ?auto_172682 ) ( IN-CITY ?auto_172677 ?auto_172682 ) ( not ( = ?auto_172677 ?auto_172683 ) ) ( OBJ-AT ?auto_172680 ?auto_172677 ) ( OBJ-AT ?auto_172679 ?auto_172683 ) ( TRUCK-AT ?auto_172684 ?auto_172677 ) ( OBJ-AT ?auto_172678 ?auto_172677 ) ( OBJ-AT ?auto_172681 ?auto_172677 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_172680 ?auto_172679 ?auto_172677 )
      ( DELIVER-4PKG-VERIFY ?auto_172678 ?auto_172679 ?auto_172680 ?auto_172681 ?auto_172677 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_172702 - OBJ
      ?auto_172703 - OBJ
      ?auto_172704 - OBJ
      ?auto_172705 - OBJ
      ?auto_172701 - LOCATION
    )
    :vars
    (
      ?auto_172707 - LOCATION
      ?auto_172706 - CITY
      ?auto_172708 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_172703 ?auto_172702 ) ) ( not ( = ?auto_172704 ?auto_172702 ) ) ( not ( = ?auto_172704 ?auto_172703 ) ) ( not ( = ?auto_172705 ?auto_172702 ) ) ( not ( = ?auto_172705 ?auto_172703 ) ) ( not ( = ?auto_172705 ?auto_172704 ) ) ( IN-CITY ?auto_172707 ?auto_172706 ) ( IN-CITY ?auto_172701 ?auto_172706 ) ( not ( = ?auto_172701 ?auto_172707 ) ) ( OBJ-AT ?auto_172705 ?auto_172701 ) ( OBJ-AT ?auto_172703 ?auto_172707 ) ( TRUCK-AT ?auto_172708 ?auto_172701 ) ( OBJ-AT ?auto_172702 ?auto_172701 ) ( OBJ-AT ?auto_172704 ?auto_172701 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_172705 ?auto_172703 ?auto_172701 )
      ( DELIVER-4PKG-VERIFY ?auto_172702 ?auto_172703 ?auto_172704 ?auto_172705 ?auto_172701 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_172855 - OBJ
      ?auto_172856 - OBJ
      ?auto_172857 - OBJ
      ?auto_172858 - OBJ
      ?auto_172854 - LOCATION
    )
    :vars
    (
      ?auto_172860 - LOCATION
      ?auto_172859 - CITY
      ?auto_172861 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_172856 ?auto_172855 ) ) ( not ( = ?auto_172857 ?auto_172855 ) ) ( not ( = ?auto_172857 ?auto_172856 ) ) ( not ( = ?auto_172858 ?auto_172855 ) ) ( not ( = ?auto_172858 ?auto_172856 ) ) ( not ( = ?auto_172858 ?auto_172857 ) ) ( IN-CITY ?auto_172860 ?auto_172859 ) ( IN-CITY ?auto_172854 ?auto_172859 ) ( not ( = ?auto_172854 ?auto_172860 ) ) ( OBJ-AT ?auto_172856 ?auto_172854 ) ( OBJ-AT ?auto_172855 ?auto_172860 ) ( TRUCK-AT ?auto_172861 ?auto_172854 ) ( OBJ-AT ?auto_172857 ?auto_172854 ) ( OBJ-AT ?auto_172858 ?auto_172854 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_172856 ?auto_172855 ?auto_172854 )
      ( DELIVER-4PKG-VERIFY ?auto_172855 ?auto_172856 ?auto_172857 ?auto_172858 ?auto_172854 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_172879 - OBJ
      ?auto_172880 - OBJ
      ?auto_172881 - OBJ
      ?auto_172882 - OBJ
      ?auto_172878 - LOCATION
    )
    :vars
    (
      ?auto_172884 - LOCATION
      ?auto_172883 - CITY
      ?auto_172885 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_172880 ?auto_172879 ) ) ( not ( = ?auto_172881 ?auto_172879 ) ) ( not ( = ?auto_172881 ?auto_172880 ) ) ( not ( = ?auto_172882 ?auto_172879 ) ) ( not ( = ?auto_172882 ?auto_172880 ) ) ( not ( = ?auto_172882 ?auto_172881 ) ) ( IN-CITY ?auto_172884 ?auto_172883 ) ( IN-CITY ?auto_172878 ?auto_172883 ) ( not ( = ?auto_172878 ?auto_172884 ) ) ( OBJ-AT ?auto_172880 ?auto_172878 ) ( OBJ-AT ?auto_172879 ?auto_172884 ) ( TRUCK-AT ?auto_172885 ?auto_172878 ) ( OBJ-AT ?auto_172881 ?auto_172878 ) ( OBJ-AT ?auto_172882 ?auto_172878 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_172880 ?auto_172879 ?auto_172878 )
      ( DELIVER-4PKG-VERIFY ?auto_172879 ?auto_172880 ?auto_172881 ?auto_172882 ?auto_172878 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_172951 - OBJ
      ?auto_172952 - OBJ
      ?auto_172953 - OBJ
      ?auto_172954 - OBJ
      ?auto_172950 - LOCATION
    )
    :vars
    (
      ?auto_172956 - LOCATION
      ?auto_172955 - CITY
      ?auto_172957 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_172952 ?auto_172951 ) ) ( not ( = ?auto_172953 ?auto_172951 ) ) ( not ( = ?auto_172953 ?auto_172952 ) ) ( not ( = ?auto_172954 ?auto_172951 ) ) ( not ( = ?auto_172954 ?auto_172952 ) ) ( not ( = ?auto_172954 ?auto_172953 ) ) ( IN-CITY ?auto_172956 ?auto_172955 ) ( IN-CITY ?auto_172950 ?auto_172955 ) ( not ( = ?auto_172950 ?auto_172956 ) ) ( OBJ-AT ?auto_172953 ?auto_172950 ) ( OBJ-AT ?auto_172951 ?auto_172956 ) ( TRUCK-AT ?auto_172957 ?auto_172950 ) ( OBJ-AT ?auto_172952 ?auto_172950 ) ( OBJ-AT ?auto_172954 ?auto_172950 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_172953 ?auto_172951 ?auto_172950 )
      ( DELIVER-4PKG-VERIFY ?auto_172951 ?auto_172952 ?auto_172953 ?auto_172954 ?auto_172950 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_173002 - OBJ
      ?auto_173003 - OBJ
      ?auto_173004 - OBJ
      ?auto_173005 - OBJ
      ?auto_173001 - LOCATION
    )
    :vars
    (
      ?auto_173007 - LOCATION
      ?auto_173006 - CITY
      ?auto_173008 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173003 ?auto_173002 ) ) ( not ( = ?auto_173004 ?auto_173002 ) ) ( not ( = ?auto_173004 ?auto_173003 ) ) ( not ( = ?auto_173005 ?auto_173002 ) ) ( not ( = ?auto_173005 ?auto_173003 ) ) ( not ( = ?auto_173005 ?auto_173004 ) ) ( IN-CITY ?auto_173007 ?auto_173006 ) ( IN-CITY ?auto_173001 ?auto_173006 ) ( not ( = ?auto_173001 ?auto_173007 ) ) ( OBJ-AT ?auto_173005 ?auto_173001 ) ( OBJ-AT ?auto_173002 ?auto_173007 ) ( TRUCK-AT ?auto_173008 ?auto_173001 ) ( OBJ-AT ?auto_173003 ?auto_173001 ) ( OBJ-AT ?auto_173004 ?auto_173001 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173005 ?auto_173002 ?auto_173001 )
      ( DELIVER-4PKG-VERIFY ?auto_173002 ?auto_173003 ?auto_173004 ?auto_173005 ?auto_173001 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_173080 - OBJ
      ?auto_173081 - OBJ
      ?auto_173082 - OBJ
      ?auto_173083 - OBJ
      ?auto_173079 - LOCATION
    )
    :vars
    (
      ?auto_173085 - LOCATION
      ?auto_173084 - CITY
      ?auto_173086 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173081 ?auto_173080 ) ) ( not ( = ?auto_173082 ?auto_173080 ) ) ( not ( = ?auto_173082 ?auto_173081 ) ) ( not ( = ?auto_173083 ?auto_173080 ) ) ( not ( = ?auto_173083 ?auto_173081 ) ) ( not ( = ?auto_173083 ?auto_173082 ) ) ( IN-CITY ?auto_173085 ?auto_173084 ) ( IN-CITY ?auto_173079 ?auto_173084 ) ( not ( = ?auto_173079 ?auto_173085 ) ) ( OBJ-AT ?auto_173082 ?auto_173079 ) ( OBJ-AT ?auto_173080 ?auto_173085 ) ( TRUCK-AT ?auto_173086 ?auto_173079 ) ( OBJ-AT ?auto_173081 ?auto_173079 ) ( OBJ-AT ?auto_173083 ?auto_173079 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173082 ?auto_173080 ?auto_173079 )
      ( DELIVER-4PKG-VERIFY ?auto_173080 ?auto_173081 ?auto_173082 ?auto_173083 ?auto_173079 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_173104 - OBJ
      ?auto_173105 - OBJ
      ?auto_173106 - OBJ
      ?auto_173107 - OBJ
      ?auto_173103 - LOCATION
    )
    :vars
    (
      ?auto_173109 - LOCATION
      ?auto_173108 - CITY
      ?auto_173110 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173105 ?auto_173104 ) ) ( not ( = ?auto_173106 ?auto_173104 ) ) ( not ( = ?auto_173106 ?auto_173105 ) ) ( not ( = ?auto_173107 ?auto_173104 ) ) ( not ( = ?auto_173107 ?auto_173105 ) ) ( not ( = ?auto_173107 ?auto_173106 ) ) ( IN-CITY ?auto_173109 ?auto_173108 ) ( IN-CITY ?auto_173103 ?auto_173108 ) ( not ( = ?auto_173103 ?auto_173109 ) ) ( OBJ-AT ?auto_173107 ?auto_173103 ) ( OBJ-AT ?auto_173104 ?auto_173109 ) ( TRUCK-AT ?auto_173110 ?auto_173103 ) ( OBJ-AT ?auto_173105 ?auto_173103 ) ( OBJ-AT ?auto_173106 ?auto_173103 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173107 ?auto_173104 ?auto_173103 )
      ( DELIVER-4PKG-VERIFY ?auto_173104 ?auto_173105 ?auto_173106 ?auto_173107 ?auto_173103 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_173346 - OBJ
      ?auto_173345 - LOCATION
    )
    :vars
    (
      ?auto_173347 - OBJ
      ?auto_173349 - LOCATION
      ?auto_173348 - CITY
      ?auto_173350 - TRUCK
      ?auto_173351 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_173346 ?auto_173347 ) ) ( IN-CITY ?auto_173349 ?auto_173348 ) ( IN-CITY ?auto_173345 ?auto_173348 ) ( not ( = ?auto_173345 ?auto_173349 ) ) ( OBJ-AT ?auto_173347 ?auto_173345 ) ( OBJ-AT ?auto_173346 ?auto_173349 ) ( TRUCK-AT ?auto_173350 ?auto_173345 ) ( not ( = ?auto_173351 ?auto_173347 ) ) ( IN-TRUCK ?auto_173351 ?auto_173350 ) ( not ( = ?auto_173346 ?auto_173351 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173347 ?auto_173351 ?auto_173345 )
      ( DELIVER-2PKG ?auto_173347 ?auto_173346 ?auto_173345 )
      ( DELIVER-1PKG-VERIFY ?auto_173346 ?auto_173345 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_173353 - OBJ
      ?auto_173354 - OBJ
      ?auto_173352 - LOCATION
    )
    :vars
    (
      ?auto_173358 - LOCATION
      ?auto_173356 - CITY
      ?auto_173357 - TRUCK
      ?auto_173355 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_173354 ?auto_173353 ) ) ( IN-CITY ?auto_173358 ?auto_173356 ) ( IN-CITY ?auto_173352 ?auto_173356 ) ( not ( = ?auto_173352 ?auto_173358 ) ) ( OBJ-AT ?auto_173353 ?auto_173352 ) ( OBJ-AT ?auto_173354 ?auto_173358 ) ( TRUCK-AT ?auto_173357 ?auto_173352 ) ( not ( = ?auto_173355 ?auto_173353 ) ) ( IN-TRUCK ?auto_173355 ?auto_173357 ) ( not ( = ?auto_173354 ?auto_173355 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_173354 ?auto_173352 )
      ( DELIVER-2PKG-VERIFY ?auto_173353 ?auto_173354 ?auto_173352 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_173360 - OBJ
      ?auto_173361 - OBJ
      ?auto_173359 - LOCATION
    )
    :vars
    (
      ?auto_173364 - OBJ
      ?auto_173362 - LOCATION
      ?auto_173366 - CITY
      ?auto_173365 - TRUCK
      ?auto_173363 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_173361 ?auto_173360 ) ) ( not ( = ?auto_173361 ?auto_173364 ) ) ( IN-CITY ?auto_173362 ?auto_173366 ) ( IN-CITY ?auto_173359 ?auto_173366 ) ( not ( = ?auto_173359 ?auto_173362 ) ) ( OBJ-AT ?auto_173364 ?auto_173359 ) ( OBJ-AT ?auto_173361 ?auto_173362 ) ( TRUCK-AT ?auto_173365 ?auto_173359 ) ( not ( = ?auto_173363 ?auto_173364 ) ) ( IN-TRUCK ?auto_173363 ?auto_173365 ) ( not ( = ?auto_173361 ?auto_173363 ) ) ( OBJ-AT ?auto_173360 ?auto_173359 ) ( not ( = ?auto_173360 ?auto_173364 ) ) ( not ( = ?auto_173360 ?auto_173363 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173364 ?auto_173361 ?auto_173359 )
      ( DELIVER-2PKG-VERIFY ?auto_173360 ?auto_173361 ?auto_173359 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_173368 - OBJ
      ?auto_173369 - OBJ
      ?auto_173367 - LOCATION
    )
    :vars
    (
      ?auto_173371 - OBJ
      ?auto_173370 - LOCATION
      ?auto_173373 - CITY
      ?auto_173372 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173369 ?auto_173368 ) ) ( not ( = ?auto_173369 ?auto_173371 ) ) ( IN-CITY ?auto_173370 ?auto_173373 ) ( IN-CITY ?auto_173367 ?auto_173373 ) ( not ( = ?auto_173367 ?auto_173370 ) ) ( OBJ-AT ?auto_173371 ?auto_173367 ) ( OBJ-AT ?auto_173369 ?auto_173370 ) ( TRUCK-AT ?auto_173372 ?auto_173367 ) ( not ( = ?auto_173368 ?auto_173371 ) ) ( IN-TRUCK ?auto_173368 ?auto_173372 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173371 ?auto_173369 ?auto_173367 )
      ( DELIVER-2PKG-VERIFY ?auto_173368 ?auto_173369 ?auto_173367 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_173375 - OBJ
      ?auto_173376 - OBJ
      ?auto_173374 - LOCATION
    )
    :vars
    (
      ?auto_173377 - LOCATION
      ?auto_173380 - CITY
      ?auto_173379 - TRUCK
      ?auto_173378 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_173376 ?auto_173375 ) ) ( IN-CITY ?auto_173377 ?auto_173380 ) ( IN-CITY ?auto_173374 ?auto_173380 ) ( not ( = ?auto_173374 ?auto_173377 ) ) ( OBJ-AT ?auto_173376 ?auto_173374 ) ( OBJ-AT ?auto_173375 ?auto_173377 ) ( TRUCK-AT ?auto_173379 ?auto_173374 ) ( not ( = ?auto_173378 ?auto_173376 ) ) ( IN-TRUCK ?auto_173378 ?auto_173379 ) ( not ( = ?auto_173375 ?auto_173378 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173376 ?auto_173375 ?auto_173374 )
      ( DELIVER-2PKG-VERIFY ?auto_173375 ?auto_173376 ?auto_173374 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_173382 - OBJ
      ?auto_173383 - OBJ
      ?auto_173381 - LOCATION
    )
    :vars
    (
      ?auto_173386 - OBJ
      ?auto_173384 - LOCATION
      ?auto_173388 - CITY
      ?auto_173387 - TRUCK
      ?auto_173385 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_173383 ?auto_173382 ) ) ( not ( = ?auto_173382 ?auto_173386 ) ) ( IN-CITY ?auto_173384 ?auto_173388 ) ( IN-CITY ?auto_173381 ?auto_173388 ) ( not ( = ?auto_173381 ?auto_173384 ) ) ( OBJ-AT ?auto_173386 ?auto_173381 ) ( OBJ-AT ?auto_173382 ?auto_173384 ) ( TRUCK-AT ?auto_173387 ?auto_173381 ) ( not ( = ?auto_173385 ?auto_173386 ) ) ( IN-TRUCK ?auto_173385 ?auto_173387 ) ( not ( = ?auto_173382 ?auto_173385 ) ) ( OBJ-AT ?auto_173383 ?auto_173381 ) ( not ( = ?auto_173383 ?auto_173386 ) ) ( not ( = ?auto_173383 ?auto_173385 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173386 ?auto_173382 ?auto_173381 )
      ( DELIVER-2PKG-VERIFY ?auto_173382 ?auto_173383 ?auto_173381 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_173390 - OBJ
      ?auto_173391 - OBJ
      ?auto_173389 - LOCATION
    )
    :vars
    (
      ?auto_173393 - OBJ
      ?auto_173392 - LOCATION
      ?auto_173395 - CITY
      ?auto_173394 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173391 ?auto_173390 ) ) ( not ( = ?auto_173390 ?auto_173393 ) ) ( IN-CITY ?auto_173392 ?auto_173395 ) ( IN-CITY ?auto_173389 ?auto_173395 ) ( not ( = ?auto_173389 ?auto_173392 ) ) ( OBJ-AT ?auto_173393 ?auto_173389 ) ( OBJ-AT ?auto_173390 ?auto_173392 ) ( TRUCK-AT ?auto_173394 ?auto_173389 ) ( not ( = ?auto_173391 ?auto_173393 ) ) ( IN-TRUCK ?auto_173391 ?auto_173394 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173393 ?auto_173390 ?auto_173389 )
      ( DELIVER-2PKG-VERIFY ?auto_173390 ?auto_173391 ?auto_173389 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_173413 - OBJ
      ?auto_173414 - OBJ
      ?auto_173415 - OBJ
      ?auto_173412 - LOCATION
    )
    :vars
    (
      ?auto_173416 - LOCATION
      ?auto_173419 - CITY
      ?auto_173418 - TRUCK
      ?auto_173417 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_173414 ?auto_173413 ) ) ( not ( = ?auto_173415 ?auto_173413 ) ) ( not ( = ?auto_173415 ?auto_173414 ) ) ( IN-CITY ?auto_173416 ?auto_173419 ) ( IN-CITY ?auto_173412 ?auto_173419 ) ( not ( = ?auto_173412 ?auto_173416 ) ) ( OBJ-AT ?auto_173413 ?auto_173412 ) ( OBJ-AT ?auto_173415 ?auto_173416 ) ( TRUCK-AT ?auto_173418 ?auto_173412 ) ( not ( = ?auto_173417 ?auto_173413 ) ) ( IN-TRUCK ?auto_173417 ?auto_173418 ) ( not ( = ?auto_173415 ?auto_173417 ) ) ( OBJ-AT ?auto_173414 ?auto_173412 ) ( not ( = ?auto_173414 ?auto_173417 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173413 ?auto_173415 ?auto_173412 )
      ( DELIVER-3PKG-VERIFY ?auto_173413 ?auto_173414 ?auto_173415 ?auto_173412 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_173421 - OBJ
      ?auto_173422 - OBJ
      ?auto_173423 - OBJ
      ?auto_173420 - LOCATION
    )
    :vars
    (
      ?auto_173424 - LOCATION
      ?auto_173426 - CITY
      ?auto_173425 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173422 ?auto_173421 ) ) ( not ( = ?auto_173423 ?auto_173421 ) ) ( not ( = ?auto_173423 ?auto_173422 ) ) ( IN-CITY ?auto_173424 ?auto_173426 ) ( IN-CITY ?auto_173420 ?auto_173426 ) ( not ( = ?auto_173420 ?auto_173424 ) ) ( OBJ-AT ?auto_173421 ?auto_173420 ) ( OBJ-AT ?auto_173423 ?auto_173424 ) ( TRUCK-AT ?auto_173425 ?auto_173420 ) ( IN-TRUCK ?auto_173422 ?auto_173425 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173421 ?auto_173423 ?auto_173420 )
      ( DELIVER-3PKG-VERIFY ?auto_173421 ?auto_173422 ?auto_173423 ?auto_173420 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_173436 - OBJ
      ?auto_173437 - OBJ
      ?auto_173438 - OBJ
      ?auto_173435 - LOCATION
    )
    :vars
    (
      ?auto_173439 - LOCATION
      ?auto_173442 - CITY
      ?auto_173441 - TRUCK
      ?auto_173440 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_173437 ?auto_173436 ) ) ( not ( = ?auto_173438 ?auto_173436 ) ) ( not ( = ?auto_173438 ?auto_173437 ) ) ( IN-CITY ?auto_173439 ?auto_173442 ) ( IN-CITY ?auto_173435 ?auto_173442 ) ( not ( = ?auto_173435 ?auto_173439 ) ) ( OBJ-AT ?auto_173436 ?auto_173435 ) ( OBJ-AT ?auto_173437 ?auto_173439 ) ( TRUCK-AT ?auto_173441 ?auto_173435 ) ( not ( = ?auto_173440 ?auto_173436 ) ) ( IN-TRUCK ?auto_173440 ?auto_173441 ) ( not ( = ?auto_173437 ?auto_173440 ) ) ( OBJ-AT ?auto_173438 ?auto_173435 ) ( not ( = ?auto_173438 ?auto_173440 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173436 ?auto_173437 ?auto_173435 )
      ( DELIVER-3PKG-VERIFY ?auto_173436 ?auto_173437 ?auto_173438 ?auto_173435 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_173444 - OBJ
      ?auto_173445 - OBJ
      ?auto_173446 - OBJ
      ?auto_173443 - LOCATION
    )
    :vars
    (
      ?auto_173447 - LOCATION
      ?auto_173449 - CITY
      ?auto_173448 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173445 ?auto_173444 ) ) ( not ( = ?auto_173446 ?auto_173444 ) ) ( not ( = ?auto_173446 ?auto_173445 ) ) ( IN-CITY ?auto_173447 ?auto_173449 ) ( IN-CITY ?auto_173443 ?auto_173449 ) ( not ( = ?auto_173443 ?auto_173447 ) ) ( OBJ-AT ?auto_173444 ?auto_173443 ) ( OBJ-AT ?auto_173445 ?auto_173447 ) ( TRUCK-AT ?auto_173448 ?auto_173443 ) ( IN-TRUCK ?auto_173446 ?auto_173448 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173444 ?auto_173445 ?auto_173443 )
      ( DELIVER-3PKG-VERIFY ?auto_173444 ?auto_173445 ?auto_173446 ?auto_173443 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_173459 - OBJ
      ?auto_173460 - OBJ
      ?auto_173461 - OBJ
      ?auto_173458 - LOCATION
    )
    :vars
    (
      ?auto_173462 - LOCATION
      ?auto_173465 - CITY
      ?auto_173464 - TRUCK
      ?auto_173463 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_173460 ?auto_173459 ) ) ( not ( = ?auto_173461 ?auto_173459 ) ) ( not ( = ?auto_173461 ?auto_173460 ) ) ( IN-CITY ?auto_173462 ?auto_173465 ) ( IN-CITY ?auto_173458 ?auto_173465 ) ( not ( = ?auto_173458 ?auto_173462 ) ) ( OBJ-AT ?auto_173460 ?auto_173458 ) ( OBJ-AT ?auto_173461 ?auto_173462 ) ( TRUCK-AT ?auto_173464 ?auto_173458 ) ( not ( = ?auto_173463 ?auto_173460 ) ) ( IN-TRUCK ?auto_173463 ?auto_173464 ) ( not ( = ?auto_173461 ?auto_173463 ) ) ( OBJ-AT ?auto_173459 ?auto_173458 ) ( not ( = ?auto_173459 ?auto_173463 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173460 ?auto_173461 ?auto_173458 )
      ( DELIVER-3PKG-VERIFY ?auto_173459 ?auto_173460 ?auto_173461 ?auto_173458 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_173476 - OBJ
      ?auto_173477 - OBJ
      ?auto_173478 - OBJ
      ?auto_173475 - LOCATION
    )
    :vars
    (
      ?auto_173480 - OBJ
      ?auto_173479 - LOCATION
      ?auto_173482 - CITY
      ?auto_173481 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173477 ?auto_173476 ) ) ( not ( = ?auto_173478 ?auto_173476 ) ) ( not ( = ?auto_173478 ?auto_173477 ) ) ( not ( = ?auto_173478 ?auto_173480 ) ) ( IN-CITY ?auto_173479 ?auto_173482 ) ( IN-CITY ?auto_173475 ?auto_173482 ) ( not ( = ?auto_173475 ?auto_173479 ) ) ( OBJ-AT ?auto_173480 ?auto_173475 ) ( OBJ-AT ?auto_173478 ?auto_173479 ) ( TRUCK-AT ?auto_173481 ?auto_173475 ) ( not ( = ?auto_173477 ?auto_173480 ) ) ( IN-TRUCK ?auto_173477 ?auto_173481 ) ( OBJ-AT ?auto_173476 ?auto_173475 ) ( not ( = ?auto_173476 ?auto_173480 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173480 ?auto_173478 ?auto_173475 )
      ( DELIVER-3PKG-VERIFY ?auto_173476 ?auto_173477 ?auto_173478 ?auto_173475 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_173484 - OBJ
      ?auto_173485 - OBJ
      ?auto_173486 - OBJ
      ?auto_173483 - LOCATION
    )
    :vars
    (
      ?auto_173487 - LOCATION
      ?auto_173490 - CITY
      ?auto_173489 - TRUCK
      ?auto_173488 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_173485 ?auto_173484 ) ) ( not ( = ?auto_173486 ?auto_173484 ) ) ( not ( = ?auto_173486 ?auto_173485 ) ) ( IN-CITY ?auto_173487 ?auto_173490 ) ( IN-CITY ?auto_173483 ?auto_173490 ) ( not ( = ?auto_173483 ?auto_173487 ) ) ( OBJ-AT ?auto_173486 ?auto_173483 ) ( OBJ-AT ?auto_173485 ?auto_173487 ) ( TRUCK-AT ?auto_173489 ?auto_173483 ) ( not ( = ?auto_173488 ?auto_173486 ) ) ( IN-TRUCK ?auto_173488 ?auto_173489 ) ( not ( = ?auto_173485 ?auto_173488 ) ) ( OBJ-AT ?auto_173484 ?auto_173483 ) ( not ( = ?auto_173484 ?auto_173488 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173486 ?auto_173485 ?auto_173483 )
      ( DELIVER-3PKG-VERIFY ?auto_173484 ?auto_173485 ?auto_173486 ?auto_173483 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_173501 - OBJ
      ?auto_173502 - OBJ
      ?auto_173503 - OBJ
      ?auto_173500 - LOCATION
    )
    :vars
    (
      ?auto_173505 - OBJ
      ?auto_173504 - LOCATION
      ?auto_173507 - CITY
      ?auto_173506 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173502 ?auto_173501 ) ) ( not ( = ?auto_173503 ?auto_173501 ) ) ( not ( = ?auto_173503 ?auto_173502 ) ) ( not ( = ?auto_173502 ?auto_173505 ) ) ( IN-CITY ?auto_173504 ?auto_173507 ) ( IN-CITY ?auto_173500 ?auto_173507 ) ( not ( = ?auto_173500 ?auto_173504 ) ) ( OBJ-AT ?auto_173505 ?auto_173500 ) ( OBJ-AT ?auto_173502 ?auto_173504 ) ( TRUCK-AT ?auto_173506 ?auto_173500 ) ( not ( = ?auto_173503 ?auto_173505 ) ) ( IN-TRUCK ?auto_173503 ?auto_173506 ) ( OBJ-AT ?auto_173501 ?auto_173500 ) ( not ( = ?auto_173501 ?auto_173505 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173505 ?auto_173502 ?auto_173500 )
      ( DELIVER-3PKG-VERIFY ?auto_173501 ?auto_173502 ?auto_173503 ?auto_173500 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_173518 - OBJ
      ?auto_173519 - OBJ
      ?auto_173520 - OBJ
      ?auto_173517 - LOCATION
    )
    :vars
    (
      ?auto_173521 - LOCATION
      ?auto_173523 - CITY
      ?auto_173522 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173519 ?auto_173518 ) ) ( not ( = ?auto_173520 ?auto_173518 ) ) ( not ( = ?auto_173520 ?auto_173519 ) ) ( IN-CITY ?auto_173521 ?auto_173523 ) ( IN-CITY ?auto_173517 ?auto_173523 ) ( not ( = ?auto_173517 ?auto_173521 ) ) ( OBJ-AT ?auto_173519 ?auto_173517 ) ( OBJ-AT ?auto_173520 ?auto_173521 ) ( TRUCK-AT ?auto_173522 ?auto_173517 ) ( IN-TRUCK ?auto_173518 ?auto_173522 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173519 ?auto_173520 ?auto_173517 )
      ( DELIVER-3PKG-VERIFY ?auto_173518 ?auto_173519 ?auto_173520 ?auto_173517 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_173525 - OBJ
      ?auto_173526 - OBJ
      ?auto_173527 - OBJ
      ?auto_173524 - LOCATION
    )
    :vars
    (
      ?auto_173529 - OBJ
      ?auto_173528 - LOCATION
      ?auto_173531 - CITY
      ?auto_173530 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173526 ?auto_173525 ) ) ( not ( = ?auto_173527 ?auto_173525 ) ) ( not ( = ?auto_173527 ?auto_173526 ) ) ( not ( = ?auto_173527 ?auto_173529 ) ) ( IN-CITY ?auto_173528 ?auto_173531 ) ( IN-CITY ?auto_173524 ?auto_173531 ) ( not ( = ?auto_173524 ?auto_173528 ) ) ( OBJ-AT ?auto_173529 ?auto_173524 ) ( OBJ-AT ?auto_173527 ?auto_173528 ) ( TRUCK-AT ?auto_173530 ?auto_173524 ) ( not ( = ?auto_173525 ?auto_173529 ) ) ( IN-TRUCK ?auto_173525 ?auto_173530 ) ( OBJ-AT ?auto_173526 ?auto_173524 ) ( not ( = ?auto_173526 ?auto_173529 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173529 ?auto_173527 ?auto_173524 )
      ( DELIVER-3PKG-VERIFY ?auto_173525 ?auto_173526 ?auto_173527 ?auto_173524 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_173541 - OBJ
      ?auto_173542 - OBJ
      ?auto_173543 - OBJ
      ?auto_173540 - LOCATION
    )
    :vars
    (
      ?auto_173544 - LOCATION
      ?auto_173546 - CITY
      ?auto_173545 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173542 ?auto_173541 ) ) ( not ( = ?auto_173543 ?auto_173541 ) ) ( not ( = ?auto_173543 ?auto_173542 ) ) ( IN-CITY ?auto_173544 ?auto_173546 ) ( IN-CITY ?auto_173540 ?auto_173546 ) ( not ( = ?auto_173540 ?auto_173544 ) ) ( OBJ-AT ?auto_173543 ?auto_173540 ) ( OBJ-AT ?auto_173542 ?auto_173544 ) ( TRUCK-AT ?auto_173545 ?auto_173540 ) ( IN-TRUCK ?auto_173541 ?auto_173545 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173543 ?auto_173542 ?auto_173540 )
      ( DELIVER-3PKG-VERIFY ?auto_173541 ?auto_173542 ?auto_173543 ?auto_173540 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_173548 - OBJ
      ?auto_173549 - OBJ
      ?auto_173550 - OBJ
      ?auto_173547 - LOCATION
    )
    :vars
    (
      ?auto_173552 - OBJ
      ?auto_173551 - LOCATION
      ?auto_173554 - CITY
      ?auto_173553 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173549 ?auto_173548 ) ) ( not ( = ?auto_173550 ?auto_173548 ) ) ( not ( = ?auto_173550 ?auto_173549 ) ) ( not ( = ?auto_173549 ?auto_173552 ) ) ( IN-CITY ?auto_173551 ?auto_173554 ) ( IN-CITY ?auto_173547 ?auto_173554 ) ( not ( = ?auto_173547 ?auto_173551 ) ) ( OBJ-AT ?auto_173552 ?auto_173547 ) ( OBJ-AT ?auto_173549 ?auto_173551 ) ( TRUCK-AT ?auto_173553 ?auto_173547 ) ( not ( = ?auto_173548 ?auto_173552 ) ) ( IN-TRUCK ?auto_173548 ?auto_173553 ) ( OBJ-AT ?auto_173550 ?auto_173547 ) ( not ( = ?auto_173550 ?auto_173552 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173552 ?auto_173549 ?auto_173547 )
      ( DELIVER-3PKG-VERIFY ?auto_173548 ?auto_173549 ?auto_173550 ?auto_173547 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_173580 - OBJ
      ?auto_173581 - OBJ
      ?auto_173582 - OBJ
      ?auto_173579 - LOCATION
    )
    :vars
    (
      ?auto_173583 - LOCATION
      ?auto_173586 - CITY
      ?auto_173585 - TRUCK
      ?auto_173584 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_173581 ?auto_173580 ) ) ( not ( = ?auto_173582 ?auto_173580 ) ) ( not ( = ?auto_173582 ?auto_173581 ) ) ( IN-CITY ?auto_173583 ?auto_173586 ) ( IN-CITY ?auto_173579 ?auto_173586 ) ( not ( = ?auto_173579 ?auto_173583 ) ) ( OBJ-AT ?auto_173581 ?auto_173579 ) ( OBJ-AT ?auto_173580 ?auto_173583 ) ( TRUCK-AT ?auto_173585 ?auto_173579 ) ( not ( = ?auto_173584 ?auto_173581 ) ) ( IN-TRUCK ?auto_173584 ?auto_173585 ) ( not ( = ?auto_173580 ?auto_173584 ) ) ( OBJ-AT ?auto_173582 ?auto_173579 ) ( not ( = ?auto_173582 ?auto_173584 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173581 ?auto_173580 ?auto_173579 )
      ( DELIVER-3PKG-VERIFY ?auto_173580 ?auto_173581 ?auto_173582 ?auto_173579 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_173588 - OBJ
      ?auto_173589 - OBJ
      ?auto_173590 - OBJ
      ?auto_173587 - LOCATION
    )
    :vars
    (
      ?auto_173591 - LOCATION
      ?auto_173593 - CITY
      ?auto_173592 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173589 ?auto_173588 ) ) ( not ( = ?auto_173590 ?auto_173588 ) ) ( not ( = ?auto_173590 ?auto_173589 ) ) ( IN-CITY ?auto_173591 ?auto_173593 ) ( IN-CITY ?auto_173587 ?auto_173593 ) ( not ( = ?auto_173587 ?auto_173591 ) ) ( OBJ-AT ?auto_173589 ?auto_173587 ) ( OBJ-AT ?auto_173588 ?auto_173591 ) ( TRUCK-AT ?auto_173592 ?auto_173587 ) ( IN-TRUCK ?auto_173590 ?auto_173592 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173589 ?auto_173588 ?auto_173587 )
      ( DELIVER-3PKG-VERIFY ?auto_173588 ?auto_173589 ?auto_173590 ?auto_173587 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_173603 - OBJ
      ?auto_173604 - OBJ
      ?auto_173605 - OBJ
      ?auto_173602 - LOCATION
    )
    :vars
    (
      ?auto_173606 - LOCATION
      ?auto_173609 - CITY
      ?auto_173608 - TRUCK
      ?auto_173607 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_173604 ?auto_173603 ) ) ( not ( = ?auto_173605 ?auto_173603 ) ) ( not ( = ?auto_173605 ?auto_173604 ) ) ( IN-CITY ?auto_173606 ?auto_173609 ) ( IN-CITY ?auto_173602 ?auto_173609 ) ( not ( = ?auto_173602 ?auto_173606 ) ) ( OBJ-AT ?auto_173605 ?auto_173602 ) ( OBJ-AT ?auto_173603 ?auto_173606 ) ( TRUCK-AT ?auto_173608 ?auto_173602 ) ( not ( = ?auto_173607 ?auto_173605 ) ) ( IN-TRUCK ?auto_173607 ?auto_173608 ) ( not ( = ?auto_173603 ?auto_173607 ) ) ( OBJ-AT ?auto_173604 ?auto_173602 ) ( not ( = ?auto_173604 ?auto_173607 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173605 ?auto_173603 ?auto_173602 )
      ( DELIVER-3PKG-VERIFY ?auto_173603 ?auto_173604 ?auto_173605 ?auto_173602 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_173620 - OBJ
      ?auto_173621 - OBJ
      ?auto_173622 - OBJ
      ?auto_173619 - LOCATION
    )
    :vars
    (
      ?auto_173624 - OBJ
      ?auto_173623 - LOCATION
      ?auto_173626 - CITY
      ?auto_173625 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173621 ?auto_173620 ) ) ( not ( = ?auto_173622 ?auto_173620 ) ) ( not ( = ?auto_173622 ?auto_173621 ) ) ( not ( = ?auto_173620 ?auto_173624 ) ) ( IN-CITY ?auto_173623 ?auto_173626 ) ( IN-CITY ?auto_173619 ?auto_173626 ) ( not ( = ?auto_173619 ?auto_173623 ) ) ( OBJ-AT ?auto_173624 ?auto_173619 ) ( OBJ-AT ?auto_173620 ?auto_173623 ) ( TRUCK-AT ?auto_173625 ?auto_173619 ) ( not ( = ?auto_173622 ?auto_173624 ) ) ( IN-TRUCK ?auto_173622 ?auto_173625 ) ( OBJ-AT ?auto_173621 ?auto_173619 ) ( not ( = ?auto_173621 ?auto_173624 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173624 ?auto_173620 ?auto_173619 )
      ( DELIVER-3PKG-VERIFY ?auto_173620 ?auto_173621 ?auto_173622 ?auto_173619 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_173637 - OBJ
      ?auto_173638 - OBJ
      ?auto_173639 - OBJ
      ?auto_173636 - LOCATION
    )
    :vars
    (
      ?auto_173640 - LOCATION
      ?auto_173642 - CITY
      ?auto_173641 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173638 ?auto_173637 ) ) ( not ( = ?auto_173639 ?auto_173637 ) ) ( not ( = ?auto_173639 ?auto_173638 ) ) ( IN-CITY ?auto_173640 ?auto_173642 ) ( IN-CITY ?auto_173636 ?auto_173642 ) ( not ( = ?auto_173636 ?auto_173640 ) ) ( OBJ-AT ?auto_173639 ?auto_173636 ) ( OBJ-AT ?auto_173637 ?auto_173640 ) ( TRUCK-AT ?auto_173641 ?auto_173636 ) ( IN-TRUCK ?auto_173638 ?auto_173641 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173639 ?auto_173637 ?auto_173636 )
      ( DELIVER-3PKG-VERIFY ?auto_173637 ?auto_173638 ?auto_173639 ?auto_173636 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_173644 - OBJ
      ?auto_173645 - OBJ
      ?auto_173646 - OBJ
      ?auto_173643 - LOCATION
    )
    :vars
    (
      ?auto_173648 - OBJ
      ?auto_173647 - LOCATION
      ?auto_173650 - CITY
      ?auto_173649 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173645 ?auto_173644 ) ) ( not ( = ?auto_173646 ?auto_173644 ) ) ( not ( = ?auto_173646 ?auto_173645 ) ) ( not ( = ?auto_173644 ?auto_173648 ) ) ( IN-CITY ?auto_173647 ?auto_173650 ) ( IN-CITY ?auto_173643 ?auto_173650 ) ( not ( = ?auto_173643 ?auto_173647 ) ) ( OBJ-AT ?auto_173648 ?auto_173643 ) ( OBJ-AT ?auto_173644 ?auto_173647 ) ( TRUCK-AT ?auto_173649 ?auto_173643 ) ( not ( = ?auto_173645 ?auto_173648 ) ) ( IN-TRUCK ?auto_173645 ?auto_173649 ) ( OBJ-AT ?auto_173646 ?auto_173643 ) ( not ( = ?auto_173646 ?auto_173648 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173648 ?auto_173644 ?auto_173643 )
      ( DELIVER-3PKG-VERIFY ?auto_173644 ?auto_173645 ?auto_173646 ?auto_173643 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_173781 - OBJ
      ?auto_173782 - OBJ
      ?auto_173783 - OBJ
      ?auto_173784 - OBJ
      ?auto_173780 - LOCATION
    )
    :vars
    (
      ?auto_173785 - LOCATION
      ?auto_173787 - CITY
      ?auto_173786 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173782 ?auto_173781 ) ) ( not ( = ?auto_173783 ?auto_173781 ) ) ( not ( = ?auto_173783 ?auto_173782 ) ) ( not ( = ?auto_173784 ?auto_173781 ) ) ( not ( = ?auto_173784 ?auto_173782 ) ) ( not ( = ?auto_173784 ?auto_173783 ) ) ( IN-CITY ?auto_173785 ?auto_173787 ) ( IN-CITY ?auto_173780 ?auto_173787 ) ( not ( = ?auto_173780 ?auto_173785 ) ) ( OBJ-AT ?auto_173781 ?auto_173780 ) ( OBJ-AT ?auto_173784 ?auto_173785 ) ( TRUCK-AT ?auto_173786 ?auto_173780 ) ( IN-TRUCK ?auto_173783 ?auto_173786 ) ( OBJ-AT ?auto_173782 ?auto_173780 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173781 ?auto_173784 ?auto_173780 )
      ( DELIVER-4PKG-VERIFY ?auto_173781 ?auto_173782 ?auto_173783 ?auto_173784 ?auto_173780 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_173807 - OBJ
      ?auto_173808 - OBJ
      ?auto_173809 - OBJ
      ?auto_173810 - OBJ
      ?auto_173806 - LOCATION
    )
    :vars
    (
      ?auto_173811 - LOCATION
      ?auto_173813 - CITY
      ?auto_173812 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173808 ?auto_173807 ) ) ( not ( = ?auto_173809 ?auto_173807 ) ) ( not ( = ?auto_173809 ?auto_173808 ) ) ( not ( = ?auto_173810 ?auto_173807 ) ) ( not ( = ?auto_173810 ?auto_173808 ) ) ( not ( = ?auto_173810 ?auto_173809 ) ) ( IN-CITY ?auto_173811 ?auto_173813 ) ( IN-CITY ?auto_173806 ?auto_173813 ) ( not ( = ?auto_173806 ?auto_173811 ) ) ( OBJ-AT ?auto_173807 ?auto_173806 ) ( OBJ-AT ?auto_173809 ?auto_173811 ) ( TRUCK-AT ?auto_173812 ?auto_173806 ) ( IN-TRUCK ?auto_173810 ?auto_173812 ) ( OBJ-AT ?auto_173808 ?auto_173806 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173807 ?auto_173809 ?auto_173806 )
      ( DELIVER-4PKG-VERIFY ?auto_173807 ?auto_173808 ?auto_173809 ?auto_173810 ?auto_173806 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_173832 - OBJ
      ?auto_173833 - OBJ
      ?auto_173834 - OBJ
      ?auto_173835 - OBJ
      ?auto_173831 - LOCATION
    )
    :vars
    (
      ?auto_173836 - LOCATION
      ?auto_173838 - CITY
      ?auto_173837 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173833 ?auto_173832 ) ) ( not ( = ?auto_173834 ?auto_173832 ) ) ( not ( = ?auto_173834 ?auto_173833 ) ) ( not ( = ?auto_173835 ?auto_173832 ) ) ( not ( = ?auto_173835 ?auto_173833 ) ) ( not ( = ?auto_173835 ?auto_173834 ) ) ( IN-CITY ?auto_173836 ?auto_173838 ) ( IN-CITY ?auto_173831 ?auto_173838 ) ( not ( = ?auto_173831 ?auto_173836 ) ) ( OBJ-AT ?auto_173832 ?auto_173831 ) ( OBJ-AT ?auto_173835 ?auto_173836 ) ( TRUCK-AT ?auto_173837 ?auto_173831 ) ( IN-TRUCK ?auto_173833 ?auto_173837 ) ( OBJ-AT ?auto_173834 ?auto_173831 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173832 ?auto_173835 ?auto_173831 )
      ( DELIVER-4PKG-VERIFY ?auto_173832 ?auto_173833 ?auto_173834 ?auto_173835 ?auto_173831 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_173856 - OBJ
      ?auto_173857 - OBJ
      ?auto_173858 - OBJ
      ?auto_173859 - OBJ
      ?auto_173855 - LOCATION
    )
    :vars
    (
      ?auto_173860 - LOCATION
      ?auto_173862 - CITY
      ?auto_173861 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173857 ?auto_173856 ) ) ( not ( = ?auto_173858 ?auto_173856 ) ) ( not ( = ?auto_173858 ?auto_173857 ) ) ( not ( = ?auto_173859 ?auto_173856 ) ) ( not ( = ?auto_173859 ?auto_173857 ) ) ( not ( = ?auto_173859 ?auto_173858 ) ) ( IN-CITY ?auto_173860 ?auto_173862 ) ( IN-CITY ?auto_173855 ?auto_173862 ) ( not ( = ?auto_173855 ?auto_173860 ) ) ( OBJ-AT ?auto_173856 ?auto_173855 ) ( OBJ-AT ?auto_173858 ?auto_173860 ) ( TRUCK-AT ?auto_173861 ?auto_173855 ) ( IN-TRUCK ?auto_173857 ?auto_173861 ) ( OBJ-AT ?auto_173859 ?auto_173855 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173856 ?auto_173858 ?auto_173855 )
      ( DELIVER-4PKG-VERIFY ?auto_173856 ?auto_173857 ?auto_173858 ?auto_173859 ?auto_173855 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_173933 - OBJ
      ?auto_173934 - OBJ
      ?auto_173935 - OBJ
      ?auto_173936 - OBJ
      ?auto_173932 - LOCATION
    )
    :vars
    (
      ?auto_173937 - LOCATION
      ?auto_173939 - CITY
      ?auto_173938 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173934 ?auto_173933 ) ) ( not ( = ?auto_173935 ?auto_173933 ) ) ( not ( = ?auto_173935 ?auto_173934 ) ) ( not ( = ?auto_173936 ?auto_173933 ) ) ( not ( = ?auto_173936 ?auto_173934 ) ) ( not ( = ?auto_173936 ?auto_173935 ) ) ( IN-CITY ?auto_173937 ?auto_173939 ) ( IN-CITY ?auto_173932 ?auto_173939 ) ( not ( = ?auto_173932 ?auto_173937 ) ) ( OBJ-AT ?auto_173933 ?auto_173932 ) ( OBJ-AT ?auto_173934 ?auto_173937 ) ( TRUCK-AT ?auto_173938 ?auto_173932 ) ( IN-TRUCK ?auto_173936 ?auto_173938 ) ( OBJ-AT ?auto_173935 ?auto_173932 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173933 ?auto_173934 ?auto_173932 )
      ( DELIVER-4PKG-VERIFY ?auto_173933 ?auto_173934 ?auto_173935 ?auto_173936 ?auto_173932 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_173958 - OBJ
      ?auto_173959 - OBJ
      ?auto_173960 - OBJ
      ?auto_173961 - OBJ
      ?auto_173957 - LOCATION
    )
    :vars
    (
      ?auto_173962 - LOCATION
      ?auto_173964 - CITY
      ?auto_173963 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_173959 ?auto_173958 ) ) ( not ( = ?auto_173960 ?auto_173958 ) ) ( not ( = ?auto_173960 ?auto_173959 ) ) ( not ( = ?auto_173961 ?auto_173958 ) ) ( not ( = ?auto_173961 ?auto_173959 ) ) ( not ( = ?auto_173961 ?auto_173960 ) ) ( IN-CITY ?auto_173962 ?auto_173964 ) ( IN-CITY ?auto_173957 ?auto_173964 ) ( not ( = ?auto_173957 ?auto_173962 ) ) ( OBJ-AT ?auto_173958 ?auto_173957 ) ( OBJ-AT ?auto_173959 ?auto_173962 ) ( TRUCK-AT ?auto_173963 ?auto_173957 ) ( IN-TRUCK ?auto_173960 ?auto_173963 ) ( OBJ-AT ?auto_173961 ?auto_173957 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_173958 ?auto_173959 ?auto_173957 )
      ( DELIVER-4PKG-VERIFY ?auto_173958 ?auto_173959 ?auto_173960 ?auto_173961 ?auto_173957 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174035 - OBJ
      ?auto_174036 - OBJ
      ?auto_174037 - OBJ
      ?auto_174038 - OBJ
      ?auto_174034 - LOCATION
    )
    :vars
    (
      ?auto_174039 - LOCATION
      ?auto_174041 - CITY
      ?auto_174040 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_174036 ?auto_174035 ) ) ( not ( = ?auto_174037 ?auto_174035 ) ) ( not ( = ?auto_174037 ?auto_174036 ) ) ( not ( = ?auto_174038 ?auto_174035 ) ) ( not ( = ?auto_174038 ?auto_174036 ) ) ( not ( = ?auto_174038 ?auto_174037 ) ) ( IN-CITY ?auto_174039 ?auto_174041 ) ( IN-CITY ?auto_174034 ?auto_174041 ) ( not ( = ?auto_174034 ?auto_174039 ) ) ( OBJ-AT ?auto_174036 ?auto_174034 ) ( OBJ-AT ?auto_174038 ?auto_174039 ) ( TRUCK-AT ?auto_174040 ?auto_174034 ) ( IN-TRUCK ?auto_174037 ?auto_174040 ) ( OBJ-AT ?auto_174035 ?auto_174034 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174036 ?auto_174038 ?auto_174034 )
      ( DELIVER-4PKG-VERIFY ?auto_174035 ?auto_174036 ?auto_174037 ?auto_174038 ?auto_174034 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174061 - OBJ
      ?auto_174062 - OBJ
      ?auto_174063 - OBJ
      ?auto_174064 - OBJ
      ?auto_174060 - LOCATION
    )
    :vars
    (
      ?auto_174065 - LOCATION
      ?auto_174067 - CITY
      ?auto_174066 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_174062 ?auto_174061 ) ) ( not ( = ?auto_174063 ?auto_174061 ) ) ( not ( = ?auto_174063 ?auto_174062 ) ) ( not ( = ?auto_174064 ?auto_174061 ) ) ( not ( = ?auto_174064 ?auto_174062 ) ) ( not ( = ?auto_174064 ?auto_174063 ) ) ( IN-CITY ?auto_174065 ?auto_174067 ) ( IN-CITY ?auto_174060 ?auto_174067 ) ( not ( = ?auto_174060 ?auto_174065 ) ) ( OBJ-AT ?auto_174062 ?auto_174060 ) ( OBJ-AT ?auto_174063 ?auto_174065 ) ( TRUCK-AT ?auto_174066 ?auto_174060 ) ( IN-TRUCK ?auto_174064 ?auto_174066 ) ( OBJ-AT ?auto_174061 ?auto_174060 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174062 ?auto_174063 ?auto_174060 )
      ( DELIVER-4PKG-VERIFY ?auto_174061 ?auto_174062 ?auto_174063 ?auto_174064 ?auto_174060 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174144 - OBJ
      ?auto_174145 - OBJ
      ?auto_174146 - OBJ
      ?auto_174147 - OBJ
      ?auto_174143 - LOCATION
    )
    :vars
    (
      ?auto_174148 - LOCATION
      ?auto_174150 - CITY
      ?auto_174149 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_174145 ?auto_174144 ) ) ( not ( = ?auto_174146 ?auto_174144 ) ) ( not ( = ?auto_174146 ?auto_174145 ) ) ( not ( = ?auto_174147 ?auto_174144 ) ) ( not ( = ?auto_174147 ?auto_174145 ) ) ( not ( = ?auto_174147 ?auto_174146 ) ) ( IN-CITY ?auto_174148 ?auto_174150 ) ( IN-CITY ?auto_174143 ?auto_174150 ) ( not ( = ?auto_174143 ?auto_174148 ) ) ( OBJ-AT ?auto_174146 ?auto_174143 ) ( OBJ-AT ?auto_174147 ?auto_174148 ) ( TRUCK-AT ?auto_174149 ?auto_174143 ) ( IN-TRUCK ?auto_174145 ?auto_174149 ) ( OBJ-AT ?auto_174144 ?auto_174143 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174146 ?auto_174147 ?auto_174143 )
      ( DELIVER-4PKG-VERIFY ?auto_174144 ?auto_174145 ?auto_174146 ?auto_174147 ?auto_174143 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174170 - OBJ
      ?auto_174171 - OBJ
      ?auto_174172 - OBJ
      ?auto_174173 - OBJ
      ?auto_174169 - LOCATION
    )
    :vars
    (
      ?auto_174174 - LOCATION
      ?auto_174176 - CITY
      ?auto_174175 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_174171 ?auto_174170 ) ) ( not ( = ?auto_174172 ?auto_174170 ) ) ( not ( = ?auto_174172 ?auto_174171 ) ) ( not ( = ?auto_174173 ?auto_174170 ) ) ( not ( = ?auto_174173 ?auto_174171 ) ) ( not ( = ?auto_174173 ?auto_174172 ) ) ( IN-CITY ?auto_174174 ?auto_174176 ) ( IN-CITY ?auto_174169 ?auto_174176 ) ( not ( = ?auto_174169 ?auto_174174 ) ) ( OBJ-AT ?auto_174173 ?auto_174169 ) ( OBJ-AT ?auto_174172 ?auto_174174 ) ( TRUCK-AT ?auto_174175 ?auto_174169 ) ( IN-TRUCK ?auto_174171 ?auto_174175 ) ( OBJ-AT ?auto_174170 ?auto_174169 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174173 ?auto_174172 ?auto_174169 )
      ( DELIVER-4PKG-VERIFY ?auto_174170 ?auto_174171 ?auto_174172 ?auto_174173 ?auto_174169 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174223 - OBJ
      ?auto_174224 - OBJ
      ?auto_174225 - OBJ
      ?auto_174226 - OBJ
      ?auto_174222 - LOCATION
    )
    :vars
    (
      ?auto_174227 - LOCATION
      ?auto_174229 - CITY
      ?auto_174228 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_174224 ?auto_174223 ) ) ( not ( = ?auto_174225 ?auto_174223 ) ) ( not ( = ?auto_174225 ?auto_174224 ) ) ( not ( = ?auto_174226 ?auto_174223 ) ) ( not ( = ?auto_174226 ?auto_174224 ) ) ( not ( = ?auto_174226 ?auto_174225 ) ) ( IN-CITY ?auto_174227 ?auto_174229 ) ( IN-CITY ?auto_174222 ?auto_174229 ) ( not ( = ?auto_174222 ?auto_174227 ) ) ( OBJ-AT ?auto_174225 ?auto_174222 ) ( OBJ-AT ?auto_174224 ?auto_174227 ) ( TRUCK-AT ?auto_174228 ?auto_174222 ) ( IN-TRUCK ?auto_174226 ?auto_174228 ) ( OBJ-AT ?auto_174223 ?auto_174222 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174225 ?auto_174224 ?auto_174222 )
      ( DELIVER-4PKG-VERIFY ?auto_174223 ?auto_174224 ?auto_174225 ?auto_174226 ?auto_174222 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174278 - OBJ
      ?auto_174279 - OBJ
      ?auto_174280 - OBJ
      ?auto_174281 - OBJ
      ?auto_174277 - LOCATION
    )
    :vars
    (
      ?auto_174282 - LOCATION
      ?auto_174284 - CITY
      ?auto_174283 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_174279 ?auto_174278 ) ) ( not ( = ?auto_174280 ?auto_174278 ) ) ( not ( = ?auto_174280 ?auto_174279 ) ) ( not ( = ?auto_174281 ?auto_174278 ) ) ( not ( = ?auto_174281 ?auto_174279 ) ) ( not ( = ?auto_174281 ?auto_174280 ) ) ( IN-CITY ?auto_174282 ?auto_174284 ) ( IN-CITY ?auto_174277 ?auto_174284 ) ( not ( = ?auto_174277 ?auto_174282 ) ) ( OBJ-AT ?auto_174281 ?auto_174277 ) ( OBJ-AT ?auto_174279 ?auto_174282 ) ( TRUCK-AT ?auto_174283 ?auto_174277 ) ( IN-TRUCK ?auto_174280 ?auto_174283 ) ( OBJ-AT ?auto_174278 ?auto_174277 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174281 ?auto_174279 ?auto_174277 )
      ( DELIVER-4PKG-VERIFY ?auto_174278 ?auto_174279 ?auto_174280 ?auto_174281 ?auto_174277 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174359 - OBJ
      ?auto_174360 - OBJ
      ?auto_174361 - OBJ
      ?auto_174362 - OBJ
      ?auto_174358 - LOCATION
    )
    :vars
    (
      ?auto_174363 - LOCATION
      ?auto_174365 - CITY
      ?auto_174364 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_174360 ?auto_174359 ) ) ( not ( = ?auto_174361 ?auto_174359 ) ) ( not ( = ?auto_174361 ?auto_174360 ) ) ( not ( = ?auto_174362 ?auto_174359 ) ) ( not ( = ?auto_174362 ?auto_174360 ) ) ( not ( = ?auto_174362 ?auto_174361 ) ) ( IN-CITY ?auto_174363 ?auto_174365 ) ( IN-CITY ?auto_174358 ?auto_174365 ) ( not ( = ?auto_174358 ?auto_174363 ) ) ( OBJ-AT ?auto_174360 ?auto_174358 ) ( OBJ-AT ?auto_174362 ?auto_174363 ) ( TRUCK-AT ?auto_174364 ?auto_174358 ) ( IN-TRUCK ?auto_174359 ?auto_174364 ) ( OBJ-AT ?auto_174361 ?auto_174358 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174360 ?auto_174362 ?auto_174358 )
      ( DELIVER-4PKG-VERIFY ?auto_174359 ?auto_174360 ?auto_174361 ?auto_174362 ?auto_174358 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174383 - OBJ
      ?auto_174384 - OBJ
      ?auto_174385 - OBJ
      ?auto_174386 - OBJ
      ?auto_174382 - LOCATION
    )
    :vars
    (
      ?auto_174387 - LOCATION
      ?auto_174389 - CITY
      ?auto_174388 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_174384 ?auto_174383 ) ) ( not ( = ?auto_174385 ?auto_174383 ) ) ( not ( = ?auto_174385 ?auto_174384 ) ) ( not ( = ?auto_174386 ?auto_174383 ) ) ( not ( = ?auto_174386 ?auto_174384 ) ) ( not ( = ?auto_174386 ?auto_174385 ) ) ( IN-CITY ?auto_174387 ?auto_174389 ) ( IN-CITY ?auto_174382 ?auto_174389 ) ( not ( = ?auto_174382 ?auto_174387 ) ) ( OBJ-AT ?auto_174384 ?auto_174382 ) ( OBJ-AT ?auto_174385 ?auto_174387 ) ( TRUCK-AT ?auto_174388 ?auto_174382 ) ( IN-TRUCK ?auto_174383 ?auto_174388 ) ( OBJ-AT ?auto_174386 ?auto_174382 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174384 ?auto_174385 ?auto_174382 )
      ( DELIVER-4PKG-VERIFY ?auto_174383 ?auto_174384 ?auto_174385 ?auto_174386 ?auto_174382 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174407 - OBJ
      ?auto_174408 - OBJ
      ?auto_174409 - OBJ
      ?auto_174410 - OBJ
      ?auto_174406 - LOCATION
    )
    :vars
    (
      ?auto_174411 - LOCATION
      ?auto_174413 - CITY
      ?auto_174412 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_174408 ?auto_174407 ) ) ( not ( = ?auto_174409 ?auto_174407 ) ) ( not ( = ?auto_174409 ?auto_174408 ) ) ( not ( = ?auto_174410 ?auto_174407 ) ) ( not ( = ?auto_174410 ?auto_174408 ) ) ( not ( = ?auto_174410 ?auto_174409 ) ) ( IN-CITY ?auto_174411 ?auto_174413 ) ( IN-CITY ?auto_174406 ?auto_174413 ) ( not ( = ?auto_174406 ?auto_174411 ) ) ( OBJ-AT ?auto_174409 ?auto_174406 ) ( OBJ-AT ?auto_174410 ?auto_174411 ) ( TRUCK-AT ?auto_174412 ?auto_174406 ) ( IN-TRUCK ?auto_174407 ?auto_174412 ) ( OBJ-AT ?auto_174408 ?auto_174406 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174409 ?auto_174410 ?auto_174406 )
      ( DELIVER-4PKG-VERIFY ?auto_174407 ?auto_174408 ?auto_174409 ?auto_174410 ?auto_174406 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174433 - OBJ
      ?auto_174434 - OBJ
      ?auto_174435 - OBJ
      ?auto_174436 - OBJ
      ?auto_174432 - LOCATION
    )
    :vars
    (
      ?auto_174437 - LOCATION
      ?auto_174439 - CITY
      ?auto_174438 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_174434 ?auto_174433 ) ) ( not ( = ?auto_174435 ?auto_174433 ) ) ( not ( = ?auto_174435 ?auto_174434 ) ) ( not ( = ?auto_174436 ?auto_174433 ) ) ( not ( = ?auto_174436 ?auto_174434 ) ) ( not ( = ?auto_174436 ?auto_174435 ) ) ( IN-CITY ?auto_174437 ?auto_174439 ) ( IN-CITY ?auto_174432 ?auto_174439 ) ( not ( = ?auto_174432 ?auto_174437 ) ) ( OBJ-AT ?auto_174436 ?auto_174432 ) ( OBJ-AT ?auto_174435 ?auto_174437 ) ( TRUCK-AT ?auto_174438 ?auto_174432 ) ( IN-TRUCK ?auto_174433 ?auto_174438 ) ( OBJ-AT ?auto_174434 ?auto_174432 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174436 ?auto_174435 ?auto_174432 )
      ( DELIVER-4PKG-VERIFY ?auto_174433 ?auto_174434 ?auto_174435 ?auto_174436 ?auto_174432 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174537 - OBJ
      ?auto_174538 - OBJ
      ?auto_174539 - OBJ
      ?auto_174540 - OBJ
      ?auto_174536 - LOCATION
    )
    :vars
    (
      ?auto_174541 - LOCATION
      ?auto_174543 - CITY
      ?auto_174542 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_174538 ?auto_174537 ) ) ( not ( = ?auto_174539 ?auto_174537 ) ) ( not ( = ?auto_174539 ?auto_174538 ) ) ( not ( = ?auto_174540 ?auto_174537 ) ) ( not ( = ?auto_174540 ?auto_174538 ) ) ( not ( = ?auto_174540 ?auto_174539 ) ) ( IN-CITY ?auto_174541 ?auto_174543 ) ( IN-CITY ?auto_174536 ?auto_174543 ) ( not ( = ?auto_174536 ?auto_174541 ) ) ( OBJ-AT ?auto_174539 ?auto_174536 ) ( OBJ-AT ?auto_174538 ?auto_174541 ) ( TRUCK-AT ?auto_174542 ?auto_174536 ) ( IN-TRUCK ?auto_174537 ?auto_174542 ) ( OBJ-AT ?auto_174540 ?auto_174536 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174539 ?auto_174538 ?auto_174536 )
      ( DELIVER-4PKG-VERIFY ?auto_174537 ?auto_174538 ?auto_174539 ?auto_174540 ?auto_174536 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174561 - OBJ
      ?auto_174562 - OBJ
      ?auto_174563 - OBJ
      ?auto_174564 - OBJ
      ?auto_174560 - LOCATION
    )
    :vars
    (
      ?auto_174565 - LOCATION
      ?auto_174567 - CITY
      ?auto_174566 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_174562 ?auto_174561 ) ) ( not ( = ?auto_174563 ?auto_174561 ) ) ( not ( = ?auto_174563 ?auto_174562 ) ) ( not ( = ?auto_174564 ?auto_174561 ) ) ( not ( = ?auto_174564 ?auto_174562 ) ) ( not ( = ?auto_174564 ?auto_174563 ) ) ( IN-CITY ?auto_174565 ?auto_174567 ) ( IN-CITY ?auto_174560 ?auto_174567 ) ( not ( = ?auto_174560 ?auto_174565 ) ) ( OBJ-AT ?auto_174564 ?auto_174560 ) ( OBJ-AT ?auto_174562 ?auto_174565 ) ( TRUCK-AT ?auto_174566 ?auto_174560 ) ( IN-TRUCK ?auto_174561 ?auto_174566 ) ( OBJ-AT ?auto_174563 ?auto_174560 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174564 ?auto_174562 ?auto_174560 )
      ( DELIVER-4PKG-VERIFY ?auto_174561 ?auto_174562 ?auto_174563 ?auto_174564 ?auto_174560 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174719 - OBJ
      ?auto_174720 - OBJ
      ?auto_174721 - OBJ
      ?auto_174722 - OBJ
      ?auto_174718 - LOCATION
    )
    :vars
    (
      ?auto_174723 - LOCATION
      ?auto_174725 - CITY
      ?auto_174724 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_174720 ?auto_174719 ) ) ( not ( = ?auto_174721 ?auto_174719 ) ) ( not ( = ?auto_174721 ?auto_174720 ) ) ( not ( = ?auto_174722 ?auto_174719 ) ) ( not ( = ?auto_174722 ?auto_174720 ) ) ( not ( = ?auto_174722 ?auto_174721 ) ) ( IN-CITY ?auto_174723 ?auto_174725 ) ( IN-CITY ?auto_174718 ?auto_174725 ) ( not ( = ?auto_174718 ?auto_174723 ) ) ( OBJ-AT ?auto_174720 ?auto_174718 ) ( OBJ-AT ?auto_174719 ?auto_174723 ) ( TRUCK-AT ?auto_174724 ?auto_174718 ) ( IN-TRUCK ?auto_174722 ?auto_174724 ) ( OBJ-AT ?auto_174721 ?auto_174718 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174720 ?auto_174719 ?auto_174718 )
      ( DELIVER-4PKG-VERIFY ?auto_174719 ?auto_174720 ?auto_174721 ?auto_174722 ?auto_174718 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174744 - OBJ
      ?auto_174745 - OBJ
      ?auto_174746 - OBJ
      ?auto_174747 - OBJ
      ?auto_174743 - LOCATION
    )
    :vars
    (
      ?auto_174748 - LOCATION
      ?auto_174750 - CITY
      ?auto_174749 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_174745 ?auto_174744 ) ) ( not ( = ?auto_174746 ?auto_174744 ) ) ( not ( = ?auto_174746 ?auto_174745 ) ) ( not ( = ?auto_174747 ?auto_174744 ) ) ( not ( = ?auto_174747 ?auto_174745 ) ) ( not ( = ?auto_174747 ?auto_174746 ) ) ( IN-CITY ?auto_174748 ?auto_174750 ) ( IN-CITY ?auto_174743 ?auto_174750 ) ( not ( = ?auto_174743 ?auto_174748 ) ) ( OBJ-AT ?auto_174745 ?auto_174743 ) ( OBJ-AT ?auto_174744 ?auto_174748 ) ( TRUCK-AT ?auto_174749 ?auto_174743 ) ( IN-TRUCK ?auto_174746 ?auto_174749 ) ( OBJ-AT ?auto_174747 ?auto_174743 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174745 ?auto_174744 ?auto_174743 )
      ( DELIVER-4PKG-VERIFY ?auto_174744 ?auto_174745 ?auto_174746 ?auto_174747 ?auto_174743 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174821 - OBJ
      ?auto_174822 - OBJ
      ?auto_174823 - OBJ
      ?auto_174824 - OBJ
      ?auto_174820 - LOCATION
    )
    :vars
    (
      ?auto_174825 - LOCATION
      ?auto_174827 - CITY
      ?auto_174826 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_174822 ?auto_174821 ) ) ( not ( = ?auto_174823 ?auto_174821 ) ) ( not ( = ?auto_174823 ?auto_174822 ) ) ( not ( = ?auto_174824 ?auto_174821 ) ) ( not ( = ?auto_174824 ?auto_174822 ) ) ( not ( = ?auto_174824 ?auto_174823 ) ) ( IN-CITY ?auto_174825 ?auto_174827 ) ( IN-CITY ?auto_174820 ?auto_174827 ) ( not ( = ?auto_174820 ?auto_174825 ) ) ( OBJ-AT ?auto_174823 ?auto_174820 ) ( OBJ-AT ?auto_174821 ?auto_174825 ) ( TRUCK-AT ?auto_174826 ?auto_174820 ) ( IN-TRUCK ?auto_174824 ?auto_174826 ) ( OBJ-AT ?auto_174822 ?auto_174820 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174823 ?auto_174821 ?auto_174820 )
      ( DELIVER-4PKG-VERIFY ?auto_174821 ?auto_174822 ?auto_174823 ?auto_174824 ?auto_174820 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174876 - OBJ
      ?auto_174877 - OBJ
      ?auto_174878 - OBJ
      ?auto_174879 - OBJ
      ?auto_174875 - LOCATION
    )
    :vars
    (
      ?auto_174880 - LOCATION
      ?auto_174882 - CITY
      ?auto_174881 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_174877 ?auto_174876 ) ) ( not ( = ?auto_174878 ?auto_174876 ) ) ( not ( = ?auto_174878 ?auto_174877 ) ) ( not ( = ?auto_174879 ?auto_174876 ) ) ( not ( = ?auto_174879 ?auto_174877 ) ) ( not ( = ?auto_174879 ?auto_174878 ) ) ( IN-CITY ?auto_174880 ?auto_174882 ) ( IN-CITY ?auto_174875 ?auto_174882 ) ( not ( = ?auto_174875 ?auto_174880 ) ) ( OBJ-AT ?auto_174879 ?auto_174875 ) ( OBJ-AT ?auto_174876 ?auto_174880 ) ( TRUCK-AT ?auto_174881 ?auto_174875 ) ( IN-TRUCK ?auto_174878 ?auto_174881 ) ( OBJ-AT ?auto_174877 ?auto_174875 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174879 ?auto_174876 ?auto_174875 )
      ( DELIVER-4PKG-VERIFY ?auto_174876 ?auto_174877 ?auto_174878 ?auto_174879 ?auto_174875 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174957 - OBJ
      ?auto_174958 - OBJ
      ?auto_174959 - OBJ
      ?auto_174960 - OBJ
      ?auto_174956 - LOCATION
    )
    :vars
    (
      ?auto_174961 - LOCATION
      ?auto_174963 - CITY
      ?auto_174962 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_174958 ?auto_174957 ) ) ( not ( = ?auto_174959 ?auto_174957 ) ) ( not ( = ?auto_174959 ?auto_174958 ) ) ( not ( = ?auto_174960 ?auto_174957 ) ) ( not ( = ?auto_174960 ?auto_174958 ) ) ( not ( = ?auto_174960 ?auto_174959 ) ) ( IN-CITY ?auto_174961 ?auto_174963 ) ( IN-CITY ?auto_174956 ?auto_174963 ) ( not ( = ?auto_174956 ?auto_174961 ) ) ( OBJ-AT ?auto_174959 ?auto_174956 ) ( OBJ-AT ?auto_174957 ?auto_174961 ) ( TRUCK-AT ?auto_174962 ?auto_174956 ) ( IN-TRUCK ?auto_174958 ?auto_174962 ) ( OBJ-AT ?auto_174960 ?auto_174956 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174959 ?auto_174957 ?auto_174956 )
      ( DELIVER-4PKG-VERIFY ?auto_174957 ?auto_174958 ?auto_174959 ?auto_174960 ?auto_174956 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174981 - OBJ
      ?auto_174982 - OBJ
      ?auto_174983 - OBJ
      ?auto_174984 - OBJ
      ?auto_174980 - LOCATION
    )
    :vars
    (
      ?auto_174985 - LOCATION
      ?auto_174987 - CITY
      ?auto_174986 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_174982 ?auto_174981 ) ) ( not ( = ?auto_174983 ?auto_174981 ) ) ( not ( = ?auto_174983 ?auto_174982 ) ) ( not ( = ?auto_174984 ?auto_174981 ) ) ( not ( = ?auto_174984 ?auto_174982 ) ) ( not ( = ?auto_174984 ?auto_174983 ) ) ( IN-CITY ?auto_174985 ?auto_174987 ) ( IN-CITY ?auto_174980 ?auto_174987 ) ( not ( = ?auto_174980 ?auto_174985 ) ) ( OBJ-AT ?auto_174984 ?auto_174980 ) ( OBJ-AT ?auto_174981 ?auto_174985 ) ( TRUCK-AT ?auto_174986 ?auto_174980 ) ( IN-TRUCK ?auto_174982 ?auto_174986 ) ( OBJ-AT ?auto_174983 ?auto_174980 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174984 ?auto_174981 ?auto_174980 )
      ( DELIVER-4PKG-VERIFY ?auto_174981 ?auto_174982 ?auto_174983 ?auto_174984 ?auto_174980 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_175232 - OBJ
      ?auto_175231 - LOCATION
    )
    :vars
    (
      ?auto_175235 - OBJ
      ?auto_175233 - LOCATION
      ?auto_175237 - CITY
      ?auto_175234 - OBJ
      ?auto_175236 - TRUCK
      ?auto_175238 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175232 ?auto_175235 ) ) ( IN-CITY ?auto_175233 ?auto_175237 ) ( IN-CITY ?auto_175231 ?auto_175237 ) ( not ( = ?auto_175231 ?auto_175233 ) ) ( OBJ-AT ?auto_175235 ?auto_175231 ) ( OBJ-AT ?auto_175232 ?auto_175233 ) ( not ( = ?auto_175234 ?auto_175235 ) ) ( IN-TRUCK ?auto_175234 ?auto_175236 ) ( not ( = ?auto_175232 ?auto_175234 ) ) ( TRUCK-AT ?auto_175236 ?auto_175238 ) ( IN-CITY ?auto_175238 ?auto_175237 ) ( not ( = ?auto_175231 ?auto_175238 ) ) ( not ( = ?auto_175233 ?auto_175238 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_175236 ?auto_175238 ?auto_175231 ?auto_175237 )
      ( DELIVER-2PKG ?auto_175235 ?auto_175232 ?auto_175231 )
      ( DELIVER-1PKG-VERIFY ?auto_175232 ?auto_175231 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175240 - OBJ
      ?auto_175241 - OBJ
      ?auto_175239 - LOCATION
    )
    :vars
    (
      ?auto_175243 - LOCATION
      ?auto_175245 - CITY
      ?auto_175242 - OBJ
      ?auto_175244 - TRUCK
      ?auto_175246 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175241 ?auto_175240 ) ) ( IN-CITY ?auto_175243 ?auto_175245 ) ( IN-CITY ?auto_175239 ?auto_175245 ) ( not ( = ?auto_175239 ?auto_175243 ) ) ( OBJ-AT ?auto_175240 ?auto_175239 ) ( OBJ-AT ?auto_175241 ?auto_175243 ) ( not ( = ?auto_175242 ?auto_175240 ) ) ( IN-TRUCK ?auto_175242 ?auto_175244 ) ( not ( = ?auto_175241 ?auto_175242 ) ) ( TRUCK-AT ?auto_175244 ?auto_175246 ) ( IN-CITY ?auto_175246 ?auto_175245 ) ( not ( = ?auto_175239 ?auto_175246 ) ) ( not ( = ?auto_175243 ?auto_175246 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175241 ?auto_175239 )
      ( DELIVER-2PKG-VERIFY ?auto_175240 ?auto_175241 ?auto_175239 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175248 - OBJ
      ?auto_175249 - OBJ
      ?auto_175247 - LOCATION
    )
    :vars
    (
      ?auto_175255 - OBJ
      ?auto_175253 - LOCATION
      ?auto_175250 - CITY
      ?auto_175252 - OBJ
      ?auto_175251 - TRUCK
      ?auto_175254 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175249 ?auto_175248 ) ) ( not ( = ?auto_175249 ?auto_175255 ) ) ( IN-CITY ?auto_175253 ?auto_175250 ) ( IN-CITY ?auto_175247 ?auto_175250 ) ( not ( = ?auto_175247 ?auto_175253 ) ) ( OBJ-AT ?auto_175255 ?auto_175247 ) ( OBJ-AT ?auto_175249 ?auto_175253 ) ( not ( = ?auto_175252 ?auto_175255 ) ) ( IN-TRUCK ?auto_175252 ?auto_175251 ) ( not ( = ?auto_175249 ?auto_175252 ) ) ( TRUCK-AT ?auto_175251 ?auto_175254 ) ( IN-CITY ?auto_175254 ?auto_175250 ) ( not ( = ?auto_175247 ?auto_175254 ) ) ( not ( = ?auto_175253 ?auto_175254 ) ) ( OBJ-AT ?auto_175248 ?auto_175247 ) ( not ( = ?auto_175248 ?auto_175255 ) ) ( not ( = ?auto_175248 ?auto_175252 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175255 ?auto_175249 ?auto_175247 )
      ( DELIVER-2PKG-VERIFY ?auto_175248 ?auto_175249 ?auto_175247 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175257 - OBJ
      ?auto_175258 - OBJ
      ?auto_175256 - LOCATION
    )
    :vars
    (
      ?auto_175263 - OBJ
      ?auto_175261 - LOCATION
      ?auto_175259 - CITY
      ?auto_175260 - TRUCK
      ?auto_175262 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175258 ?auto_175257 ) ) ( not ( = ?auto_175258 ?auto_175263 ) ) ( IN-CITY ?auto_175261 ?auto_175259 ) ( IN-CITY ?auto_175256 ?auto_175259 ) ( not ( = ?auto_175256 ?auto_175261 ) ) ( OBJ-AT ?auto_175263 ?auto_175256 ) ( OBJ-AT ?auto_175258 ?auto_175261 ) ( not ( = ?auto_175257 ?auto_175263 ) ) ( IN-TRUCK ?auto_175257 ?auto_175260 ) ( TRUCK-AT ?auto_175260 ?auto_175262 ) ( IN-CITY ?auto_175262 ?auto_175259 ) ( not ( = ?auto_175256 ?auto_175262 ) ) ( not ( = ?auto_175261 ?auto_175262 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175263 ?auto_175258 ?auto_175256 )
      ( DELIVER-2PKG-VERIFY ?auto_175257 ?auto_175258 ?auto_175256 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175265 - OBJ
      ?auto_175266 - OBJ
      ?auto_175264 - LOCATION
    )
    :vars
    (
      ?auto_175270 - LOCATION
      ?auto_175267 - CITY
      ?auto_175269 - OBJ
      ?auto_175268 - TRUCK
      ?auto_175271 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175266 ?auto_175265 ) ) ( IN-CITY ?auto_175270 ?auto_175267 ) ( IN-CITY ?auto_175264 ?auto_175267 ) ( not ( = ?auto_175264 ?auto_175270 ) ) ( OBJ-AT ?auto_175266 ?auto_175264 ) ( OBJ-AT ?auto_175265 ?auto_175270 ) ( not ( = ?auto_175269 ?auto_175266 ) ) ( IN-TRUCK ?auto_175269 ?auto_175268 ) ( not ( = ?auto_175265 ?auto_175269 ) ) ( TRUCK-AT ?auto_175268 ?auto_175271 ) ( IN-CITY ?auto_175271 ?auto_175267 ) ( not ( = ?auto_175264 ?auto_175271 ) ) ( not ( = ?auto_175270 ?auto_175271 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175266 ?auto_175265 ?auto_175264 )
      ( DELIVER-2PKG-VERIFY ?auto_175265 ?auto_175266 ?auto_175264 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175273 - OBJ
      ?auto_175274 - OBJ
      ?auto_175272 - LOCATION
    )
    :vars
    (
      ?auto_175280 - OBJ
      ?auto_175278 - LOCATION
      ?auto_175275 - CITY
      ?auto_175277 - OBJ
      ?auto_175276 - TRUCK
      ?auto_175279 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175274 ?auto_175273 ) ) ( not ( = ?auto_175273 ?auto_175280 ) ) ( IN-CITY ?auto_175278 ?auto_175275 ) ( IN-CITY ?auto_175272 ?auto_175275 ) ( not ( = ?auto_175272 ?auto_175278 ) ) ( OBJ-AT ?auto_175280 ?auto_175272 ) ( OBJ-AT ?auto_175273 ?auto_175278 ) ( not ( = ?auto_175277 ?auto_175280 ) ) ( IN-TRUCK ?auto_175277 ?auto_175276 ) ( not ( = ?auto_175273 ?auto_175277 ) ) ( TRUCK-AT ?auto_175276 ?auto_175279 ) ( IN-CITY ?auto_175279 ?auto_175275 ) ( not ( = ?auto_175272 ?auto_175279 ) ) ( not ( = ?auto_175278 ?auto_175279 ) ) ( OBJ-AT ?auto_175274 ?auto_175272 ) ( not ( = ?auto_175274 ?auto_175280 ) ) ( not ( = ?auto_175274 ?auto_175277 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175280 ?auto_175273 ?auto_175272 )
      ( DELIVER-2PKG-VERIFY ?auto_175273 ?auto_175274 ?auto_175272 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175282 - OBJ
      ?auto_175283 - OBJ
      ?auto_175281 - LOCATION
    )
    :vars
    (
      ?auto_175288 - OBJ
      ?auto_175286 - LOCATION
      ?auto_175284 - CITY
      ?auto_175285 - TRUCK
      ?auto_175287 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175283 ?auto_175282 ) ) ( not ( = ?auto_175282 ?auto_175288 ) ) ( IN-CITY ?auto_175286 ?auto_175284 ) ( IN-CITY ?auto_175281 ?auto_175284 ) ( not ( = ?auto_175281 ?auto_175286 ) ) ( OBJ-AT ?auto_175288 ?auto_175281 ) ( OBJ-AT ?auto_175282 ?auto_175286 ) ( not ( = ?auto_175283 ?auto_175288 ) ) ( IN-TRUCK ?auto_175283 ?auto_175285 ) ( TRUCK-AT ?auto_175285 ?auto_175287 ) ( IN-CITY ?auto_175287 ?auto_175284 ) ( not ( = ?auto_175281 ?auto_175287 ) ) ( not ( = ?auto_175286 ?auto_175287 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175288 ?auto_175282 ?auto_175281 )
      ( DELIVER-2PKG-VERIFY ?auto_175282 ?auto_175283 ?auto_175281 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175308 - OBJ
      ?auto_175309 - OBJ
      ?auto_175310 - OBJ
      ?auto_175307 - LOCATION
    )
    :vars
    (
      ?auto_175314 - LOCATION
      ?auto_175311 - CITY
      ?auto_175313 - OBJ
      ?auto_175312 - TRUCK
      ?auto_175315 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175309 ?auto_175308 ) ) ( not ( = ?auto_175310 ?auto_175308 ) ) ( not ( = ?auto_175310 ?auto_175309 ) ) ( IN-CITY ?auto_175314 ?auto_175311 ) ( IN-CITY ?auto_175307 ?auto_175311 ) ( not ( = ?auto_175307 ?auto_175314 ) ) ( OBJ-AT ?auto_175308 ?auto_175307 ) ( OBJ-AT ?auto_175310 ?auto_175314 ) ( not ( = ?auto_175313 ?auto_175308 ) ) ( IN-TRUCK ?auto_175313 ?auto_175312 ) ( not ( = ?auto_175310 ?auto_175313 ) ) ( TRUCK-AT ?auto_175312 ?auto_175315 ) ( IN-CITY ?auto_175315 ?auto_175311 ) ( not ( = ?auto_175307 ?auto_175315 ) ) ( not ( = ?auto_175314 ?auto_175315 ) ) ( OBJ-AT ?auto_175309 ?auto_175307 ) ( not ( = ?auto_175309 ?auto_175313 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175308 ?auto_175310 ?auto_175307 )
      ( DELIVER-3PKG-VERIFY ?auto_175308 ?auto_175309 ?auto_175310 ?auto_175307 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175317 - OBJ
      ?auto_175318 - OBJ
      ?auto_175319 - OBJ
      ?auto_175316 - LOCATION
    )
    :vars
    (
      ?auto_175322 - LOCATION
      ?auto_175320 - CITY
      ?auto_175321 - TRUCK
      ?auto_175323 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175318 ?auto_175317 ) ) ( not ( = ?auto_175319 ?auto_175317 ) ) ( not ( = ?auto_175319 ?auto_175318 ) ) ( IN-CITY ?auto_175322 ?auto_175320 ) ( IN-CITY ?auto_175316 ?auto_175320 ) ( not ( = ?auto_175316 ?auto_175322 ) ) ( OBJ-AT ?auto_175317 ?auto_175316 ) ( OBJ-AT ?auto_175319 ?auto_175322 ) ( IN-TRUCK ?auto_175318 ?auto_175321 ) ( TRUCK-AT ?auto_175321 ?auto_175323 ) ( IN-CITY ?auto_175323 ?auto_175320 ) ( not ( = ?auto_175316 ?auto_175323 ) ) ( not ( = ?auto_175322 ?auto_175323 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175317 ?auto_175319 ?auto_175316 )
      ( DELIVER-3PKG-VERIFY ?auto_175317 ?auto_175318 ?auto_175319 ?auto_175316 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175334 - OBJ
      ?auto_175335 - OBJ
      ?auto_175336 - OBJ
      ?auto_175333 - LOCATION
    )
    :vars
    (
      ?auto_175340 - LOCATION
      ?auto_175337 - CITY
      ?auto_175339 - OBJ
      ?auto_175338 - TRUCK
      ?auto_175341 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175335 ?auto_175334 ) ) ( not ( = ?auto_175336 ?auto_175334 ) ) ( not ( = ?auto_175336 ?auto_175335 ) ) ( IN-CITY ?auto_175340 ?auto_175337 ) ( IN-CITY ?auto_175333 ?auto_175337 ) ( not ( = ?auto_175333 ?auto_175340 ) ) ( OBJ-AT ?auto_175334 ?auto_175333 ) ( OBJ-AT ?auto_175335 ?auto_175340 ) ( not ( = ?auto_175339 ?auto_175334 ) ) ( IN-TRUCK ?auto_175339 ?auto_175338 ) ( not ( = ?auto_175335 ?auto_175339 ) ) ( TRUCK-AT ?auto_175338 ?auto_175341 ) ( IN-CITY ?auto_175341 ?auto_175337 ) ( not ( = ?auto_175333 ?auto_175341 ) ) ( not ( = ?auto_175340 ?auto_175341 ) ) ( OBJ-AT ?auto_175336 ?auto_175333 ) ( not ( = ?auto_175336 ?auto_175339 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175334 ?auto_175335 ?auto_175333 )
      ( DELIVER-3PKG-VERIFY ?auto_175334 ?auto_175335 ?auto_175336 ?auto_175333 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175343 - OBJ
      ?auto_175344 - OBJ
      ?auto_175345 - OBJ
      ?auto_175342 - LOCATION
    )
    :vars
    (
      ?auto_175348 - LOCATION
      ?auto_175346 - CITY
      ?auto_175347 - TRUCK
      ?auto_175349 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175344 ?auto_175343 ) ) ( not ( = ?auto_175345 ?auto_175343 ) ) ( not ( = ?auto_175345 ?auto_175344 ) ) ( IN-CITY ?auto_175348 ?auto_175346 ) ( IN-CITY ?auto_175342 ?auto_175346 ) ( not ( = ?auto_175342 ?auto_175348 ) ) ( OBJ-AT ?auto_175343 ?auto_175342 ) ( OBJ-AT ?auto_175344 ?auto_175348 ) ( IN-TRUCK ?auto_175345 ?auto_175347 ) ( TRUCK-AT ?auto_175347 ?auto_175349 ) ( IN-CITY ?auto_175349 ?auto_175346 ) ( not ( = ?auto_175342 ?auto_175349 ) ) ( not ( = ?auto_175348 ?auto_175349 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175343 ?auto_175344 ?auto_175342 )
      ( DELIVER-3PKG-VERIFY ?auto_175343 ?auto_175344 ?auto_175345 ?auto_175342 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175360 - OBJ
      ?auto_175361 - OBJ
      ?auto_175362 - OBJ
      ?auto_175359 - LOCATION
    )
    :vars
    (
      ?auto_175366 - LOCATION
      ?auto_175363 - CITY
      ?auto_175365 - OBJ
      ?auto_175364 - TRUCK
      ?auto_175367 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175361 ?auto_175360 ) ) ( not ( = ?auto_175362 ?auto_175360 ) ) ( not ( = ?auto_175362 ?auto_175361 ) ) ( IN-CITY ?auto_175366 ?auto_175363 ) ( IN-CITY ?auto_175359 ?auto_175363 ) ( not ( = ?auto_175359 ?auto_175366 ) ) ( OBJ-AT ?auto_175361 ?auto_175359 ) ( OBJ-AT ?auto_175362 ?auto_175366 ) ( not ( = ?auto_175365 ?auto_175361 ) ) ( IN-TRUCK ?auto_175365 ?auto_175364 ) ( not ( = ?auto_175362 ?auto_175365 ) ) ( TRUCK-AT ?auto_175364 ?auto_175367 ) ( IN-CITY ?auto_175367 ?auto_175363 ) ( not ( = ?auto_175359 ?auto_175367 ) ) ( not ( = ?auto_175366 ?auto_175367 ) ) ( OBJ-AT ?auto_175360 ?auto_175359 ) ( not ( = ?auto_175360 ?auto_175365 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175361 ?auto_175362 ?auto_175359 )
      ( DELIVER-3PKG-VERIFY ?auto_175360 ?auto_175361 ?auto_175362 ?auto_175359 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175379 - OBJ
      ?auto_175380 - OBJ
      ?auto_175381 - OBJ
      ?auto_175378 - LOCATION
    )
    :vars
    (
      ?auto_175386 - OBJ
      ?auto_175384 - LOCATION
      ?auto_175382 - CITY
      ?auto_175383 - TRUCK
      ?auto_175385 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175380 ?auto_175379 ) ) ( not ( = ?auto_175381 ?auto_175379 ) ) ( not ( = ?auto_175381 ?auto_175380 ) ) ( not ( = ?auto_175381 ?auto_175386 ) ) ( IN-CITY ?auto_175384 ?auto_175382 ) ( IN-CITY ?auto_175378 ?auto_175382 ) ( not ( = ?auto_175378 ?auto_175384 ) ) ( OBJ-AT ?auto_175386 ?auto_175378 ) ( OBJ-AT ?auto_175381 ?auto_175384 ) ( not ( = ?auto_175380 ?auto_175386 ) ) ( IN-TRUCK ?auto_175380 ?auto_175383 ) ( TRUCK-AT ?auto_175383 ?auto_175385 ) ( IN-CITY ?auto_175385 ?auto_175382 ) ( not ( = ?auto_175378 ?auto_175385 ) ) ( not ( = ?auto_175384 ?auto_175385 ) ) ( OBJ-AT ?auto_175379 ?auto_175378 ) ( not ( = ?auto_175379 ?auto_175386 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175386 ?auto_175381 ?auto_175378 )
      ( DELIVER-3PKG-VERIFY ?auto_175379 ?auto_175380 ?auto_175381 ?auto_175378 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175388 - OBJ
      ?auto_175389 - OBJ
      ?auto_175390 - OBJ
      ?auto_175387 - LOCATION
    )
    :vars
    (
      ?auto_175394 - LOCATION
      ?auto_175391 - CITY
      ?auto_175393 - OBJ
      ?auto_175392 - TRUCK
      ?auto_175395 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175389 ?auto_175388 ) ) ( not ( = ?auto_175390 ?auto_175388 ) ) ( not ( = ?auto_175390 ?auto_175389 ) ) ( IN-CITY ?auto_175394 ?auto_175391 ) ( IN-CITY ?auto_175387 ?auto_175391 ) ( not ( = ?auto_175387 ?auto_175394 ) ) ( OBJ-AT ?auto_175390 ?auto_175387 ) ( OBJ-AT ?auto_175389 ?auto_175394 ) ( not ( = ?auto_175393 ?auto_175390 ) ) ( IN-TRUCK ?auto_175393 ?auto_175392 ) ( not ( = ?auto_175389 ?auto_175393 ) ) ( TRUCK-AT ?auto_175392 ?auto_175395 ) ( IN-CITY ?auto_175395 ?auto_175391 ) ( not ( = ?auto_175387 ?auto_175395 ) ) ( not ( = ?auto_175394 ?auto_175395 ) ) ( OBJ-AT ?auto_175388 ?auto_175387 ) ( not ( = ?auto_175388 ?auto_175393 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175390 ?auto_175389 ?auto_175387 )
      ( DELIVER-3PKG-VERIFY ?auto_175388 ?auto_175389 ?auto_175390 ?auto_175387 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175407 - OBJ
      ?auto_175408 - OBJ
      ?auto_175409 - OBJ
      ?auto_175406 - LOCATION
    )
    :vars
    (
      ?auto_175414 - OBJ
      ?auto_175412 - LOCATION
      ?auto_175410 - CITY
      ?auto_175411 - TRUCK
      ?auto_175413 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175408 ?auto_175407 ) ) ( not ( = ?auto_175409 ?auto_175407 ) ) ( not ( = ?auto_175409 ?auto_175408 ) ) ( not ( = ?auto_175408 ?auto_175414 ) ) ( IN-CITY ?auto_175412 ?auto_175410 ) ( IN-CITY ?auto_175406 ?auto_175410 ) ( not ( = ?auto_175406 ?auto_175412 ) ) ( OBJ-AT ?auto_175414 ?auto_175406 ) ( OBJ-AT ?auto_175408 ?auto_175412 ) ( not ( = ?auto_175409 ?auto_175414 ) ) ( IN-TRUCK ?auto_175409 ?auto_175411 ) ( TRUCK-AT ?auto_175411 ?auto_175413 ) ( IN-CITY ?auto_175413 ?auto_175410 ) ( not ( = ?auto_175406 ?auto_175413 ) ) ( not ( = ?auto_175412 ?auto_175413 ) ) ( OBJ-AT ?auto_175407 ?auto_175406 ) ( not ( = ?auto_175407 ?auto_175414 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175414 ?auto_175408 ?auto_175406 )
      ( DELIVER-3PKG-VERIFY ?auto_175407 ?auto_175408 ?auto_175409 ?auto_175406 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175426 - OBJ
      ?auto_175427 - OBJ
      ?auto_175428 - OBJ
      ?auto_175425 - LOCATION
    )
    :vars
    (
      ?auto_175431 - LOCATION
      ?auto_175429 - CITY
      ?auto_175430 - TRUCK
      ?auto_175432 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175427 ?auto_175426 ) ) ( not ( = ?auto_175428 ?auto_175426 ) ) ( not ( = ?auto_175428 ?auto_175427 ) ) ( IN-CITY ?auto_175431 ?auto_175429 ) ( IN-CITY ?auto_175425 ?auto_175429 ) ( not ( = ?auto_175425 ?auto_175431 ) ) ( OBJ-AT ?auto_175427 ?auto_175425 ) ( OBJ-AT ?auto_175428 ?auto_175431 ) ( IN-TRUCK ?auto_175426 ?auto_175430 ) ( TRUCK-AT ?auto_175430 ?auto_175432 ) ( IN-CITY ?auto_175432 ?auto_175429 ) ( not ( = ?auto_175425 ?auto_175432 ) ) ( not ( = ?auto_175431 ?auto_175432 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175427 ?auto_175428 ?auto_175425 )
      ( DELIVER-3PKG-VERIFY ?auto_175426 ?auto_175427 ?auto_175428 ?auto_175425 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175434 - OBJ
      ?auto_175435 - OBJ
      ?auto_175436 - OBJ
      ?auto_175433 - LOCATION
    )
    :vars
    (
      ?auto_175441 - OBJ
      ?auto_175439 - LOCATION
      ?auto_175437 - CITY
      ?auto_175438 - TRUCK
      ?auto_175440 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175435 ?auto_175434 ) ) ( not ( = ?auto_175436 ?auto_175434 ) ) ( not ( = ?auto_175436 ?auto_175435 ) ) ( not ( = ?auto_175436 ?auto_175441 ) ) ( IN-CITY ?auto_175439 ?auto_175437 ) ( IN-CITY ?auto_175433 ?auto_175437 ) ( not ( = ?auto_175433 ?auto_175439 ) ) ( OBJ-AT ?auto_175441 ?auto_175433 ) ( OBJ-AT ?auto_175436 ?auto_175439 ) ( not ( = ?auto_175434 ?auto_175441 ) ) ( IN-TRUCK ?auto_175434 ?auto_175438 ) ( TRUCK-AT ?auto_175438 ?auto_175440 ) ( IN-CITY ?auto_175440 ?auto_175437 ) ( not ( = ?auto_175433 ?auto_175440 ) ) ( not ( = ?auto_175439 ?auto_175440 ) ) ( OBJ-AT ?auto_175435 ?auto_175433 ) ( not ( = ?auto_175435 ?auto_175441 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175441 ?auto_175436 ?auto_175433 )
      ( DELIVER-3PKG-VERIFY ?auto_175434 ?auto_175435 ?auto_175436 ?auto_175433 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175452 - OBJ
      ?auto_175453 - OBJ
      ?auto_175454 - OBJ
      ?auto_175451 - LOCATION
    )
    :vars
    (
      ?auto_175457 - LOCATION
      ?auto_175455 - CITY
      ?auto_175456 - TRUCK
      ?auto_175458 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175453 ?auto_175452 ) ) ( not ( = ?auto_175454 ?auto_175452 ) ) ( not ( = ?auto_175454 ?auto_175453 ) ) ( IN-CITY ?auto_175457 ?auto_175455 ) ( IN-CITY ?auto_175451 ?auto_175455 ) ( not ( = ?auto_175451 ?auto_175457 ) ) ( OBJ-AT ?auto_175454 ?auto_175451 ) ( OBJ-AT ?auto_175453 ?auto_175457 ) ( IN-TRUCK ?auto_175452 ?auto_175456 ) ( TRUCK-AT ?auto_175456 ?auto_175458 ) ( IN-CITY ?auto_175458 ?auto_175455 ) ( not ( = ?auto_175451 ?auto_175458 ) ) ( not ( = ?auto_175457 ?auto_175458 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175454 ?auto_175453 ?auto_175451 )
      ( DELIVER-3PKG-VERIFY ?auto_175452 ?auto_175453 ?auto_175454 ?auto_175451 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175460 - OBJ
      ?auto_175461 - OBJ
      ?auto_175462 - OBJ
      ?auto_175459 - LOCATION
    )
    :vars
    (
      ?auto_175467 - OBJ
      ?auto_175465 - LOCATION
      ?auto_175463 - CITY
      ?auto_175464 - TRUCK
      ?auto_175466 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175461 ?auto_175460 ) ) ( not ( = ?auto_175462 ?auto_175460 ) ) ( not ( = ?auto_175462 ?auto_175461 ) ) ( not ( = ?auto_175461 ?auto_175467 ) ) ( IN-CITY ?auto_175465 ?auto_175463 ) ( IN-CITY ?auto_175459 ?auto_175463 ) ( not ( = ?auto_175459 ?auto_175465 ) ) ( OBJ-AT ?auto_175467 ?auto_175459 ) ( OBJ-AT ?auto_175461 ?auto_175465 ) ( not ( = ?auto_175460 ?auto_175467 ) ) ( IN-TRUCK ?auto_175460 ?auto_175464 ) ( TRUCK-AT ?auto_175464 ?auto_175466 ) ( IN-CITY ?auto_175466 ?auto_175463 ) ( not ( = ?auto_175459 ?auto_175466 ) ) ( not ( = ?auto_175465 ?auto_175466 ) ) ( OBJ-AT ?auto_175462 ?auto_175459 ) ( not ( = ?auto_175462 ?auto_175467 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175467 ?auto_175461 ?auto_175459 )
      ( DELIVER-3PKG-VERIFY ?auto_175460 ?auto_175461 ?auto_175462 ?auto_175459 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175496 - OBJ
      ?auto_175497 - OBJ
      ?auto_175498 - OBJ
      ?auto_175495 - LOCATION
    )
    :vars
    (
      ?auto_175502 - LOCATION
      ?auto_175499 - CITY
      ?auto_175501 - OBJ
      ?auto_175500 - TRUCK
      ?auto_175503 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175497 ?auto_175496 ) ) ( not ( = ?auto_175498 ?auto_175496 ) ) ( not ( = ?auto_175498 ?auto_175497 ) ) ( IN-CITY ?auto_175502 ?auto_175499 ) ( IN-CITY ?auto_175495 ?auto_175499 ) ( not ( = ?auto_175495 ?auto_175502 ) ) ( OBJ-AT ?auto_175497 ?auto_175495 ) ( OBJ-AT ?auto_175496 ?auto_175502 ) ( not ( = ?auto_175501 ?auto_175497 ) ) ( IN-TRUCK ?auto_175501 ?auto_175500 ) ( not ( = ?auto_175496 ?auto_175501 ) ) ( TRUCK-AT ?auto_175500 ?auto_175503 ) ( IN-CITY ?auto_175503 ?auto_175499 ) ( not ( = ?auto_175495 ?auto_175503 ) ) ( not ( = ?auto_175502 ?auto_175503 ) ) ( OBJ-AT ?auto_175498 ?auto_175495 ) ( not ( = ?auto_175498 ?auto_175501 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175497 ?auto_175496 ?auto_175495 )
      ( DELIVER-3PKG-VERIFY ?auto_175496 ?auto_175497 ?auto_175498 ?auto_175495 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175505 - OBJ
      ?auto_175506 - OBJ
      ?auto_175507 - OBJ
      ?auto_175504 - LOCATION
    )
    :vars
    (
      ?auto_175510 - LOCATION
      ?auto_175508 - CITY
      ?auto_175509 - TRUCK
      ?auto_175511 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175506 ?auto_175505 ) ) ( not ( = ?auto_175507 ?auto_175505 ) ) ( not ( = ?auto_175507 ?auto_175506 ) ) ( IN-CITY ?auto_175510 ?auto_175508 ) ( IN-CITY ?auto_175504 ?auto_175508 ) ( not ( = ?auto_175504 ?auto_175510 ) ) ( OBJ-AT ?auto_175506 ?auto_175504 ) ( OBJ-AT ?auto_175505 ?auto_175510 ) ( IN-TRUCK ?auto_175507 ?auto_175509 ) ( TRUCK-AT ?auto_175509 ?auto_175511 ) ( IN-CITY ?auto_175511 ?auto_175508 ) ( not ( = ?auto_175504 ?auto_175511 ) ) ( not ( = ?auto_175510 ?auto_175511 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175506 ?auto_175505 ?auto_175504 )
      ( DELIVER-3PKG-VERIFY ?auto_175505 ?auto_175506 ?auto_175507 ?auto_175504 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175522 - OBJ
      ?auto_175523 - OBJ
      ?auto_175524 - OBJ
      ?auto_175521 - LOCATION
    )
    :vars
    (
      ?auto_175528 - LOCATION
      ?auto_175525 - CITY
      ?auto_175527 - OBJ
      ?auto_175526 - TRUCK
      ?auto_175529 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175523 ?auto_175522 ) ) ( not ( = ?auto_175524 ?auto_175522 ) ) ( not ( = ?auto_175524 ?auto_175523 ) ) ( IN-CITY ?auto_175528 ?auto_175525 ) ( IN-CITY ?auto_175521 ?auto_175525 ) ( not ( = ?auto_175521 ?auto_175528 ) ) ( OBJ-AT ?auto_175524 ?auto_175521 ) ( OBJ-AT ?auto_175522 ?auto_175528 ) ( not ( = ?auto_175527 ?auto_175524 ) ) ( IN-TRUCK ?auto_175527 ?auto_175526 ) ( not ( = ?auto_175522 ?auto_175527 ) ) ( TRUCK-AT ?auto_175526 ?auto_175529 ) ( IN-CITY ?auto_175529 ?auto_175525 ) ( not ( = ?auto_175521 ?auto_175529 ) ) ( not ( = ?auto_175528 ?auto_175529 ) ) ( OBJ-AT ?auto_175523 ?auto_175521 ) ( not ( = ?auto_175523 ?auto_175527 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175524 ?auto_175522 ?auto_175521 )
      ( DELIVER-3PKG-VERIFY ?auto_175522 ?auto_175523 ?auto_175524 ?auto_175521 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175541 - OBJ
      ?auto_175542 - OBJ
      ?auto_175543 - OBJ
      ?auto_175540 - LOCATION
    )
    :vars
    (
      ?auto_175548 - OBJ
      ?auto_175546 - LOCATION
      ?auto_175544 - CITY
      ?auto_175545 - TRUCK
      ?auto_175547 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175542 ?auto_175541 ) ) ( not ( = ?auto_175543 ?auto_175541 ) ) ( not ( = ?auto_175543 ?auto_175542 ) ) ( not ( = ?auto_175541 ?auto_175548 ) ) ( IN-CITY ?auto_175546 ?auto_175544 ) ( IN-CITY ?auto_175540 ?auto_175544 ) ( not ( = ?auto_175540 ?auto_175546 ) ) ( OBJ-AT ?auto_175548 ?auto_175540 ) ( OBJ-AT ?auto_175541 ?auto_175546 ) ( not ( = ?auto_175543 ?auto_175548 ) ) ( IN-TRUCK ?auto_175543 ?auto_175545 ) ( TRUCK-AT ?auto_175545 ?auto_175547 ) ( IN-CITY ?auto_175547 ?auto_175544 ) ( not ( = ?auto_175540 ?auto_175547 ) ) ( not ( = ?auto_175546 ?auto_175547 ) ) ( OBJ-AT ?auto_175542 ?auto_175540 ) ( not ( = ?auto_175542 ?auto_175548 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175548 ?auto_175541 ?auto_175540 )
      ( DELIVER-3PKG-VERIFY ?auto_175541 ?auto_175542 ?auto_175543 ?auto_175540 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175560 - OBJ
      ?auto_175561 - OBJ
      ?auto_175562 - OBJ
      ?auto_175559 - LOCATION
    )
    :vars
    (
      ?auto_175565 - LOCATION
      ?auto_175563 - CITY
      ?auto_175564 - TRUCK
      ?auto_175566 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175561 ?auto_175560 ) ) ( not ( = ?auto_175562 ?auto_175560 ) ) ( not ( = ?auto_175562 ?auto_175561 ) ) ( IN-CITY ?auto_175565 ?auto_175563 ) ( IN-CITY ?auto_175559 ?auto_175563 ) ( not ( = ?auto_175559 ?auto_175565 ) ) ( OBJ-AT ?auto_175562 ?auto_175559 ) ( OBJ-AT ?auto_175560 ?auto_175565 ) ( IN-TRUCK ?auto_175561 ?auto_175564 ) ( TRUCK-AT ?auto_175564 ?auto_175566 ) ( IN-CITY ?auto_175566 ?auto_175563 ) ( not ( = ?auto_175559 ?auto_175566 ) ) ( not ( = ?auto_175565 ?auto_175566 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175562 ?auto_175560 ?auto_175559 )
      ( DELIVER-3PKG-VERIFY ?auto_175560 ?auto_175561 ?auto_175562 ?auto_175559 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175568 - OBJ
      ?auto_175569 - OBJ
      ?auto_175570 - OBJ
      ?auto_175567 - LOCATION
    )
    :vars
    (
      ?auto_175575 - OBJ
      ?auto_175573 - LOCATION
      ?auto_175571 - CITY
      ?auto_175572 - TRUCK
      ?auto_175574 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175569 ?auto_175568 ) ) ( not ( = ?auto_175570 ?auto_175568 ) ) ( not ( = ?auto_175570 ?auto_175569 ) ) ( not ( = ?auto_175568 ?auto_175575 ) ) ( IN-CITY ?auto_175573 ?auto_175571 ) ( IN-CITY ?auto_175567 ?auto_175571 ) ( not ( = ?auto_175567 ?auto_175573 ) ) ( OBJ-AT ?auto_175575 ?auto_175567 ) ( OBJ-AT ?auto_175568 ?auto_175573 ) ( not ( = ?auto_175569 ?auto_175575 ) ) ( IN-TRUCK ?auto_175569 ?auto_175572 ) ( TRUCK-AT ?auto_175572 ?auto_175574 ) ( IN-CITY ?auto_175574 ?auto_175571 ) ( not ( = ?auto_175567 ?auto_175574 ) ) ( not ( = ?auto_175573 ?auto_175574 ) ) ( OBJ-AT ?auto_175570 ?auto_175567 ) ( not ( = ?auto_175570 ?auto_175575 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175575 ?auto_175568 ?auto_175567 )
      ( DELIVER-3PKG-VERIFY ?auto_175568 ?auto_175569 ?auto_175570 ?auto_175567 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175721 - OBJ
      ?auto_175722 - OBJ
      ?auto_175723 - OBJ
      ?auto_175724 - OBJ
      ?auto_175720 - LOCATION
    )
    :vars
    (
      ?auto_175727 - LOCATION
      ?auto_175725 - CITY
      ?auto_175726 - TRUCK
      ?auto_175728 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175722 ?auto_175721 ) ) ( not ( = ?auto_175723 ?auto_175721 ) ) ( not ( = ?auto_175723 ?auto_175722 ) ) ( not ( = ?auto_175724 ?auto_175721 ) ) ( not ( = ?auto_175724 ?auto_175722 ) ) ( not ( = ?auto_175724 ?auto_175723 ) ) ( IN-CITY ?auto_175727 ?auto_175725 ) ( IN-CITY ?auto_175720 ?auto_175725 ) ( not ( = ?auto_175720 ?auto_175727 ) ) ( OBJ-AT ?auto_175721 ?auto_175720 ) ( OBJ-AT ?auto_175724 ?auto_175727 ) ( IN-TRUCK ?auto_175723 ?auto_175726 ) ( TRUCK-AT ?auto_175726 ?auto_175728 ) ( IN-CITY ?auto_175728 ?auto_175725 ) ( not ( = ?auto_175720 ?auto_175728 ) ) ( not ( = ?auto_175727 ?auto_175728 ) ) ( OBJ-AT ?auto_175722 ?auto_175720 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175721 ?auto_175724 ?auto_175720 )
      ( DELIVER-4PKG-VERIFY ?auto_175721 ?auto_175722 ?auto_175723 ?auto_175724 ?auto_175720 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175750 - OBJ
      ?auto_175751 - OBJ
      ?auto_175752 - OBJ
      ?auto_175753 - OBJ
      ?auto_175749 - LOCATION
    )
    :vars
    (
      ?auto_175756 - LOCATION
      ?auto_175754 - CITY
      ?auto_175755 - TRUCK
      ?auto_175757 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175751 ?auto_175750 ) ) ( not ( = ?auto_175752 ?auto_175750 ) ) ( not ( = ?auto_175752 ?auto_175751 ) ) ( not ( = ?auto_175753 ?auto_175750 ) ) ( not ( = ?auto_175753 ?auto_175751 ) ) ( not ( = ?auto_175753 ?auto_175752 ) ) ( IN-CITY ?auto_175756 ?auto_175754 ) ( IN-CITY ?auto_175749 ?auto_175754 ) ( not ( = ?auto_175749 ?auto_175756 ) ) ( OBJ-AT ?auto_175750 ?auto_175749 ) ( OBJ-AT ?auto_175752 ?auto_175756 ) ( IN-TRUCK ?auto_175753 ?auto_175755 ) ( TRUCK-AT ?auto_175755 ?auto_175757 ) ( IN-CITY ?auto_175757 ?auto_175754 ) ( not ( = ?auto_175749 ?auto_175757 ) ) ( not ( = ?auto_175756 ?auto_175757 ) ) ( OBJ-AT ?auto_175751 ?auto_175749 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175750 ?auto_175752 ?auto_175749 )
      ( DELIVER-4PKG-VERIFY ?auto_175750 ?auto_175751 ?auto_175752 ?auto_175753 ?auto_175749 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175778 - OBJ
      ?auto_175779 - OBJ
      ?auto_175780 - OBJ
      ?auto_175781 - OBJ
      ?auto_175777 - LOCATION
    )
    :vars
    (
      ?auto_175784 - LOCATION
      ?auto_175782 - CITY
      ?auto_175783 - TRUCK
      ?auto_175785 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175779 ?auto_175778 ) ) ( not ( = ?auto_175780 ?auto_175778 ) ) ( not ( = ?auto_175780 ?auto_175779 ) ) ( not ( = ?auto_175781 ?auto_175778 ) ) ( not ( = ?auto_175781 ?auto_175779 ) ) ( not ( = ?auto_175781 ?auto_175780 ) ) ( IN-CITY ?auto_175784 ?auto_175782 ) ( IN-CITY ?auto_175777 ?auto_175782 ) ( not ( = ?auto_175777 ?auto_175784 ) ) ( OBJ-AT ?auto_175778 ?auto_175777 ) ( OBJ-AT ?auto_175781 ?auto_175784 ) ( IN-TRUCK ?auto_175779 ?auto_175783 ) ( TRUCK-AT ?auto_175783 ?auto_175785 ) ( IN-CITY ?auto_175785 ?auto_175782 ) ( not ( = ?auto_175777 ?auto_175785 ) ) ( not ( = ?auto_175784 ?auto_175785 ) ) ( OBJ-AT ?auto_175780 ?auto_175777 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175778 ?auto_175781 ?auto_175777 )
      ( DELIVER-4PKG-VERIFY ?auto_175778 ?auto_175779 ?auto_175780 ?auto_175781 ?auto_175777 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175805 - OBJ
      ?auto_175806 - OBJ
      ?auto_175807 - OBJ
      ?auto_175808 - OBJ
      ?auto_175804 - LOCATION
    )
    :vars
    (
      ?auto_175811 - LOCATION
      ?auto_175809 - CITY
      ?auto_175810 - TRUCK
      ?auto_175812 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175806 ?auto_175805 ) ) ( not ( = ?auto_175807 ?auto_175805 ) ) ( not ( = ?auto_175807 ?auto_175806 ) ) ( not ( = ?auto_175808 ?auto_175805 ) ) ( not ( = ?auto_175808 ?auto_175806 ) ) ( not ( = ?auto_175808 ?auto_175807 ) ) ( IN-CITY ?auto_175811 ?auto_175809 ) ( IN-CITY ?auto_175804 ?auto_175809 ) ( not ( = ?auto_175804 ?auto_175811 ) ) ( OBJ-AT ?auto_175805 ?auto_175804 ) ( OBJ-AT ?auto_175807 ?auto_175811 ) ( IN-TRUCK ?auto_175806 ?auto_175810 ) ( TRUCK-AT ?auto_175810 ?auto_175812 ) ( IN-CITY ?auto_175812 ?auto_175809 ) ( not ( = ?auto_175804 ?auto_175812 ) ) ( not ( = ?auto_175811 ?auto_175812 ) ) ( OBJ-AT ?auto_175808 ?auto_175804 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175805 ?auto_175807 ?auto_175804 )
      ( DELIVER-4PKG-VERIFY ?auto_175805 ?auto_175806 ?auto_175807 ?auto_175808 ?auto_175804 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175891 - OBJ
      ?auto_175892 - OBJ
      ?auto_175893 - OBJ
      ?auto_175894 - OBJ
      ?auto_175890 - LOCATION
    )
    :vars
    (
      ?auto_175897 - LOCATION
      ?auto_175895 - CITY
      ?auto_175896 - TRUCK
      ?auto_175898 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175892 ?auto_175891 ) ) ( not ( = ?auto_175893 ?auto_175891 ) ) ( not ( = ?auto_175893 ?auto_175892 ) ) ( not ( = ?auto_175894 ?auto_175891 ) ) ( not ( = ?auto_175894 ?auto_175892 ) ) ( not ( = ?auto_175894 ?auto_175893 ) ) ( IN-CITY ?auto_175897 ?auto_175895 ) ( IN-CITY ?auto_175890 ?auto_175895 ) ( not ( = ?auto_175890 ?auto_175897 ) ) ( OBJ-AT ?auto_175891 ?auto_175890 ) ( OBJ-AT ?auto_175892 ?auto_175897 ) ( IN-TRUCK ?auto_175894 ?auto_175896 ) ( TRUCK-AT ?auto_175896 ?auto_175898 ) ( IN-CITY ?auto_175898 ?auto_175895 ) ( not ( = ?auto_175890 ?auto_175898 ) ) ( not ( = ?auto_175897 ?auto_175898 ) ) ( OBJ-AT ?auto_175893 ?auto_175890 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175891 ?auto_175892 ?auto_175890 )
      ( DELIVER-4PKG-VERIFY ?auto_175891 ?auto_175892 ?auto_175893 ?auto_175894 ?auto_175890 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175919 - OBJ
      ?auto_175920 - OBJ
      ?auto_175921 - OBJ
      ?auto_175922 - OBJ
      ?auto_175918 - LOCATION
    )
    :vars
    (
      ?auto_175925 - LOCATION
      ?auto_175923 - CITY
      ?auto_175924 - TRUCK
      ?auto_175926 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_175920 ?auto_175919 ) ) ( not ( = ?auto_175921 ?auto_175919 ) ) ( not ( = ?auto_175921 ?auto_175920 ) ) ( not ( = ?auto_175922 ?auto_175919 ) ) ( not ( = ?auto_175922 ?auto_175920 ) ) ( not ( = ?auto_175922 ?auto_175921 ) ) ( IN-CITY ?auto_175925 ?auto_175923 ) ( IN-CITY ?auto_175918 ?auto_175923 ) ( not ( = ?auto_175918 ?auto_175925 ) ) ( OBJ-AT ?auto_175919 ?auto_175918 ) ( OBJ-AT ?auto_175920 ?auto_175925 ) ( IN-TRUCK ?auto_175921 ?auto_175924 ) ( TRUCK-AT ?auto_175924 ?auto_175926 ) ( IN-CITY ?auto_175926 ?auto_175923 ) ( not ( = ?auto_175918 ?auto_175926 ) ) ( not ( = ?auto_175925 ?auto_175926 ) ) ( OBJ-AT ?auto_175922 ?auto_175918 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175919 ?auto_175920 ?auto_175918 )
      ( DELIVER-4PKG-VERIFY ?auto_175919 ?auto_175920 ?auto_175921 ?auto_175922 ?auto_175918 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176005 - OBJ
      ?auto_176006 - OBJ
      ?auto_176007 - OBJ
      ?auto_176008 - OBJ
      ?auto_176004 - LOCATION
    )
    :vars
    (
      ?auto_176011 - LOCATION
      ?auto_176009 - CITY
      ?auto_176010 - TRUCK
      ?auto_176012 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_176006 ?auto_176005 ) ) ( not ( = ?auto_176007 ?auto_176005 ) ) ( not ( = ?auto_176007 ?auto_176006 ) ) ( not ( = ?auto_176008 ?auto_176005 ) ) ( not ( = ?auto_176008 ?auto_176006 ) ) ( not ( = ?auto_176008 ?auto_176007 ) ) ( IN-CITY ?auto_176011 ?auto_176009 ) ( IN-CITY ?auto_176004 ?auto_176009 ) ( not ( = ?auto_176004 ?auto_176011 ) ) ( OBJ-AT ?auto_176006 ?auto_176004 ) ( OBJ-AT ?auto_176008 ?auto_176011 ) ( IN-TRUCK ?auto_176007 ?auto_176010 ) ( TRUCK-AT ?auto_176010 ?auto_176012 ) ( IN-CITY ?auto_176012 ?auto_176009 ) ( not ( = ?auto_176004 ?auto_176012 ) ) ( not ( = ?auto_176011 ?auto_176012 ) ) ( OBJ-AT ?auto_176005 ?auto_176004 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176006 ?auto_176008 ?auto_176004 )
      ( DELIVER-4PKG-VERIFY ?auto_176005 ?auto_176006 ?auto_176007 ?auto_176008 ?auto_176004 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176034 - OBJ
      ?auto_176035 - OBJ
      ?auto_176036 - OBJ
      ?auto_176037 - OBJ
      ?auto_176033 - LOCATION
    )
    :vars
    (
      ?auto_176040 - LOCATION
      ?auto_176038 - CITY
      ?auto_176039 - TRUCK
      ?auto_176041 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_176035 ?auto_176034 ) ) ( not ( = ?auto_176036 ?auto_176034 ) ) ( not ( = ?auto_176036 ?auto_176035 ) ) ( not ( = ?auto_176037 ?auto_176034 ) ) ( not ( = ?auto_176037 ?auto_176035 ) ) ( not ( = ?auto_176037 ?auto_176036 ) ) ( IN-CITY ?auto_176040 ?auto_176038 ) ( IN-CITY ?auto_176033 ?auto_176038 ) ( not ( = ?auto_176033 ?auto_176040 ) ) ( OBJ-AT ?auto_176035 ?auto_176033 ) ( OBJ-AT ?auto_176036 ?auto_176040 ) ( IN-TRUCK ?auto_176037 ?auto_176039 ) ( TRUCK-AT ?auto_176039 ?auto_176041 ) ( IN-CITY ?auto_176041 ?auto_176038 ) ( not ( = ?auto_176033 ?auto_176041 ) ) ( not ( = ?auto_176040 ?auto_176041 ) ) ( OBJ-AT ?auto_176034 ?auto_176033 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176035 ?auto_176036 ?auto_176033 )
      ( DELIVER-4PKG-VERIFY ?auto_176034 ?auto_176035 ?auto_176036 ?auto_176037 ?auto_176033 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176126 - OBJ
      ?auto_176127 - OBJ
      ?auto_176128 - OBJ
      ?auto_176129 - OBJ
      ?auto_176125 - LOCATION
    )
    :vars
    (
      ?auto_176132 - LOCATION
      ?auto_176130 - CITY
      ?auto_176131 - TRUCK
      ?auto_176133 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_176127 ?auto_176126 ) ) ( not ( = ?auto_176128 ?auto_176126 ) ) ( not ( = ?auto_176128 ?auto_176127 ) ) ( not ( = ?auto_176129 ?auto_176126 ) ) ( not ( = ?auto_176129 ?auto_176127 ) ) ( not ( = ?auto_176129 ?auto_176128 ) ) ( IN-CITY ?auto_176132 ?auto_176130 ) ( IN-CITY ?auto_176125 ?auto_176130 ) ( not ( = ?auto_176125 ?auto_176132 ) ) ( OBJ-AT ?auto_176128 ?auto_176125 ) ( OBJ-AT ?auto_176129 ?auto_176132 ) ( IN-TRUCK ?auto_176127 ?auto_176131 ) ( TRUCK-AT ?auto_176131 ?auto_176133 ) ( IN-CITY ?auto_176133 ?auto_176130 ) ( not ( = ?auto_176125 ?auto_176133 ) ) ( not ( = ?auto_176132 ?auto_176133 ) ) ( OBJ-AT ?auto_176126 ?auto_176125 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176128 ?auto_176129 ?auto_176125 )
      ( DELIVER-4PKG-VERIFY ?auto_176126 ?auto_176127 ?auto_176128 ?auto_176129 ?auto_176125 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176155 - OBJ
      ?auto_176156 - OBJ
      ?auto_176157 - OBJ
      ?auto_176158 - OBJ
      ?auto_176154 - LOCATION
    )
    :vars
    (
      ?auto_176161 - LOCATION
      ?auto_176159 - CITY
      ?auto_176160 - TRUCK
      ?auto_176162 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_176156 ?auto_176155 ) ) ( not ( = ?auto_176157 ?auto_176155 ) ) ( not ( = ?auto_176157 ?auto_176156 ) ) ( not ( = ?auto_176158 ?auto_176155 ) ) ( not ( = ?auto_176158 ?auto_176156 ) ) ( not ( = ?auto_176158 ?auto_176157 ) ) ( IN-CITY ?auto_176161 ?auto_176159 ) ( IN-CITY ?auto_176154 ?auto_176159 ) ( not ( = ?auto_176154 ?auto_176161 ) ) ( OBJ-AT ?auto_176158 ?auto_176154 ) ( OBJ-AT ?auto_176157 ?auto_176161 ) ( IN-TRUCK ?auto_176156 ?auto_176160 ) ( TRUCK-AT ?auto_176160 ?auto_176162 ) ( IN-CITY ?auto_176162 ?auto_176159 ) ( not ( = ?auto_176154 ?auto_176162 ) ) ( not ( = ?auto_176161 ?auto_176162 ) ) ( OBJ-AT ?auto_176155 ?auto_176154 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176158 ?auto_176157 ?auto_176154 )
      ( DELIVER-4PKG-VERIFY ?auto_176155 ?auto_176156 ?auto_176157 ?auto_176158 ?auto_176154 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176214 - OBJ
      ?auto_176215 - OBJ
      ?auto_176216 - OBJ
      ?auto_176217 - OBJ
      ?auto_176213 - LOCATION
    )
    :vars
    (
      ?auto_176220 - LOCATION
      ?auto_176218 - CITY
      ?auto_176219 - TRUCK
      ?auto_176221 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_176215 ?auto_176214 ) ) ( not ( = ?auto_176216 ?auto_176214 ) ) ( not ( = ?auto_176216 ?auto_176215 ) ) ( not ( = ?auto_176217 ?auto_176214 ) ) ( not ( = ?auto_176217 ?auto_176215 ) ) ( not ( = ?auto_176217 ?auto_176216 ) ) ( IN-CITY ?auto_176220 ?auto_176218 ) ( IN-CITY ?auto_176213 ?auto_176218 ) ( not ( = ?auto_176213 ?auto_176220 ) ) ( OBJ-AT ?auto_176216 ?auto_176213 ) ( OBJ-AT ?auto_176215 ?auto_176220 ) ( IN-TRUCK ?auto_176217 ?auto_176219 ) ( TRUCK-AT ?auto_176219 ?auto_176221 ) ( IN-CITY ?auto_176221 ?auto_176218 ) ( not ( = ?auto_176213 ?auto_176221 ) ) ( not ( = ?auto_176220 ?auto_176221 ) ) ( OBJ-AT ?auto_176214 ?auto_176213 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176216 ?auto_176215 ?auto_176213 )
      ( DELIVER-4PKG-VERIFY ?auto_176214 ?auto_176215 ?auto_176216 ?auto_176217 ?auto_176213 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176275 - OBJ
      ?auto_176276 - OBJ
      ?auto_176277 - OBJ
      ?auto_176278 - OBJ
      ?auto_176274 - LOCATION
    )
    :vars
    (
      ?auto_176281 - LOCATION
      ?auto_176279 - CITY
      ?auto_176280 - TRUCK
      ?auto_176282 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_176276 ?auto_176275 ) ) ( not ( = ?auto_176277 ?auto_176275 ) ) ( not ( = ?auto_176277 ?auto_176276 ) ) ( not ( = ?auto_176278 ?auto_176275 ) ) ( not ( = ?auto_176278 ?auto_176276 ) ) ( not ( = ?auto_176278 ?auto_176277 ) ) ( IN-CITY ?auto_176281 ?auto_176279 ) ( IN-CITY ?auto_176274 ?auto_176279 ) ( not ( = ?auto_176274 ?auto_176281 ) ) ( OBJ-AT ?auto_176278 ?auto_176274 ) ( OBJ-AT ?auto_176276 ?auto_176281 ) ( IN-TRUCK ?auto_176277 ?auto_176280 ) ( TRUCK-AT ?auto_176280 ?auto_176282 ) ( IN-CITY ?auto_176282 ?auto_176279 ) ( not ( = ?auto_176274 ?auto_176282 ) ) ( not ( = ?auto_176281 ?auto_176282 ) ) ( OBJ-AT ?auto_176275 ?auto_176274 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176278 ?auto_176276 ?auto_176274 )
      ( DELIVER-4PKG-VERIFY ?auto_176275 ?auto_176276 ?auto_176277 ?auto_176278 ?auto_176274 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176365 - OBJ
      ?auto_176366 - OBJ
      ?auto_176367 - OBJ
      ?auto_176368 - OBJ
      ?auto_176364 - LOCATION
    )
    :vars
    (
      ?auto_176371 - LOCATION
      ?auto_176369 - CITY
      ?auto_176370 - TRUCK
      ?auto_176372 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_176366 ?auto_176365 ) ) ( not ( = ?auto_176367 ?auto_176365 ) ) ( not ( = ?auto_176367 ?auto_176366 ) ) ( not ( = ?auto_176368 ?auto_176365 ) ) ( not ( = ?auto_176368 ?auto_176366 ) ) ( not ( = ?auto_176368 ?auto_176367 ) ) ( IN-CITY ?auto_176371 ?auto_176369 ) ( IN-CITY ?auto_176364 ?auto_176369 ) ( not ( = ?auto_176364 ?auto_176371 ) ) ( OBJ-AT ?auto_176366 ?auto_176364 ) ( OBJ-AT ?auto_176368 ?auto_176371 ) ( IN-TRUCK ?auto_176365 ?auto_176370 ) ( TRUCK-AT ?auto_176370 ?auto_176372 ) ( IN-CITY ?auto_176372 ?auto_176369 ) ( not ( = ?auto_176364 ?auto_176372 ) ) ( not ( = ?auto_176371 ?auto_176372 ) ) ( OBJ-AT ?auto_176367 ?auto_176364 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176366 ?auto_176368 ?auto_176364 )
      ( DELIVER-4PKG-VERIFY ?auto_176365 ?auto_176366 ?auto_176367 ?auto_176368 ?auto_176364 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176392 - OBJ
      ?auto_176393 - OBJ
      ?auto_176394 - OBJ
      ?auto_176395 - OBJ
      ?auto_176391 - LOCATION
    )
    :vars
    (
      ?auto_176398 - LOCATION
      ?auto_176396 - CITY
      ?auto_176397 - TRUCK
      ?auto_176399 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_176393 ?auto_176392 ) ) ( not ( = ?auto_176394 ?auto_176392 ) ) ( not ( = ?auto_176394 ?auto_176393 ) ) ( not ( = ?auto_176395 ?auto_176392 ) ) ( not ( = ?auto_176395 ?auto_176393 ) ) ( not ( = ?auto_176395 ?auto_176394 ) ) ( IN-CITY ?auto_176398 ?auto_176396 ) ( IN-CITY ?auto_176391 ?auto_176396 ) ( not ( = ?auto_176391 ?auto_176398 ) ) ( OBJ-AT ?auto_176393 ?auto_176391 ) ( OBJ-AT ?auto_176394 ?auto_176398 ) ( IN-TRUCK ?auto_176392 ?auto_176397 ) ( TRUCK-AT ?auto_176397 ?auto_176399 ) ( IN-CITY ?auto_176399 ?auto_176396 ) ( not ( = ?auto_176391 ?auto_176399 ) ) ( not ( = ?auto_176398 ?auto_176399 ) ) ( OBJ-AT ?auto_176395 ?auto_176391 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176393 ?auto_176394 ?auto_176391 )
      ( DELIVER-4PKG-VERIFY ?auto_176392 ?auto_176393 ?auto_176394 ?auto_176395 ?auto_176391 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176419 - OBJ
      ?auto_176420 - OBJ
      ?auto_176421 - OBJ
      ?auto_176422 - OBJ
      ?auto_176418 - LOCATION
    )
    :vars
    (
      ?auto_176425 - LOCATION
      ?auto_176423 - CITY
      ?auto_176424 - TRUCK
      ?auto_176426 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_176420 ?auto_176419 ) ) ( not ( = ?auto_176421 ?auto_176419 ) ) ( not ( = ?auto_176421 ?auto_176420 ) ) ( not ( = ?auto_176422 ?auto_176419 ) ) ( not ( = ?auto_176422 ?auto_176420 ) ) ( not ( = ?auto_176422 ?auto_176421 ) ) ( IN-CITY ?auto_176425 ?auto_176423 ) ( IN-CITY ?auto_176418 ?auto_176423 ) ( not ( = ?auto_176418 ?auto_176425 ) ) ( OBJ-AT ?auto_176421 ?auto_176418 ) ( OBJ-AT ?auto_176422 ?auto_176425 ) ( IN-TRUCK ?auto_176419 ?auto_176424 ) ( TRUCK-AT ?auto_176424 ?auto_176426 ) ( IN-CITY ?auto_176426 ?auto_176423 ) ( not ( = ?auto_176418 ?auto_176426 ) ) ( not ( = ?auto_176425 ?auto_176426 ) ) ( OBJ-AT ?auto_176420 ?auto_176418 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176421 ?auto_176422 ?auto_176418 )
      ( DELIVER-4PKG-VERIFY ?auto_176419 ?auto_176420 ?auto_176421 ?auto_176422 ?auto_176418 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176448 - OBJ
      ?auto_176449 - OBJ
      ?auto_176450 - OBJ
      ?auto_176451 - OBJ
      ?auto_176447 - LOCATION
    )
    :vars
    (
      ?auto_176454 - LOCATION
      ?auto_176452 - CITY
      ?auto_176453 - TRUCK
      ?auto_176455 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_176449 ?auto_176448 ) ) ( not ( = ?auto_176450 ?auto_176448 ) ) ( not ( = ?auto_176450 ?auto_176449 ) ) ( not ( = ?auto_176451 ?auto_176448 ) ) ( not ( = ?auto_176451 ?auto_176449 ) ) ( not ( = ?auto_176451 ?auto_176450 ) ) ( IN-CITY ?auto_176454 ?auto_176452 ) ( IN-CITY ?auto_176447 ?auto_176452 ) ( not ( = ?auto_176447 ?auto_176454 ) ) ( OBJ-AT ?auto_176451 ?auto_176447 ) ( OBJ-AT ?auto_176450 ?auto_176454 ) ( IN-TRUCK ?auto_176448 ?auto_176453 ) ( TRUCK-AT ?auto_176453 ?auto_176455 ) ( IN-CITY ?auto_176455 ?auto_176452 ) ( not ( = ?auto_176447 ?auto_176455 ) ) ( not ( = ?auto_176454 ?auto_176455 ) ) ( OBJ-AT ?auto_176449 ?auto_176447 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176451 ?auto_176450 ?auto_176447 )
      ( DELIVER-4PKG-VERIFY ?auto_176448 ?auto_176449 ?auto_176450 ?auto_176451 ?auto_176447 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176564 - OBJ
      ?auto_176565 - OBJ
      ?auto_176566 - OBJ
      ?auto_176567 - OBJ
      ?auto_176563 - LOCATION
    )
    :vars
    (
      ?auto_176570 - LOCATION
      ?auto_176568 - CITY
      ?auto_176569 - TRUCK
      ?auto_176571 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_176565 ?auto_176564 ) ) ( not ( = ?auto_176566 ?auto_176564 ) ) ( not ( = ?auto_176566 ?auto_176565 ) ) ( not ( = ?auto_176567 ?auto_176564 ) ) ( not ( = ?auto_176567 ?auto_176565 ) ) ( not ( = ?auto_176567 ?auto_176566 ) ) ( IN-CITY ?auto_176570 ?auto_176568 ) ( IN-CITY ?auto_176563 ?auto_176568 ) ( not ( = ?auto_176563 ?auto_176570 ) ) ( OBJ-AT ?auto_176566 ?auto_176563 ) ( OBJ-AT ?auto_176565 ?auto_176570 ) ( IN-TRUCK ?auto_176564 ?auto_176569 ) ( TRUCK-AT ?auto_176569 ?auto_176571 ) ( IN-CITY ?auto_176571 ?auto_176568 ) ( not ( = ?auto_176563 ?auto_176571 ) ) ( not ( = ?auto_176570 ?auto_176571 ) ) ( OBJ-AT ?auto_176567 ?auto_176563 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176566 ?auto_176565 ?auto_176563 )
      ( DELIVER-4PKG-VERIFY ?auto_176564 ?auto_176565 ?auto_176566 ?auto_176567 ?auto_176563 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176591 - OBJ
      ?auto_176592 - OBJ
      ?auto_176593 - OBJ
      ?auto_176594 - OBJ
      ?auto_176590 - LOCATION
    )
    :vars
    (
      ?auto_176597 - LOCATION
      ?auto_176595 - CITY
      ?auto_176596 - TRUCK
      ?auto_176598 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_176592 ?auto_176591 ) ) ( not ( = ?auto_176593 ?auto_176591 ) ) ( not ( = ?auto_176593 ?auto_176592 ) ) ( not ( = ?auto_176594 ?auto_176591 ) ) ( not ( = ?auto_176594 ?auto_176592 ) ) ( not ( = ?auto_176594 ?auto_176593 ) ) ( IN-CITY ?auto_176597 ?auto_176595 ) ( IN-CITY ?auto_176590 ?auto_176595 ) ( not ( = ?auto_176590 ?auto_176597 ) ) ( OBJ-AT ?auto_176594 ?auto_176590 ) ( OBJ-AT ?auto_176592 ?auto_176597 ) ( IN-TRUCK ?auto_176591 ?auto_176596 ) ( TRUCK-AT ?auto_176596 ?auto_176598 ) ( IN-CITY ?auto_176598 ?auto_176595 ) ( not ( = ?auto_176590 ?auto_176598 ) ) ( not ( = ?auto_176597 ?auto_176598 ) ) ( OBJ-AT ?auto_176593 ?auto_176590 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176594 ?auto_176592 ?auto_176590 )
      ( DELIVER-4PKG-VERIFY ?auto_176591 ?auto_176592 ?auto_176593 ?auto_176594 ?auto_176590 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176767 - OBJ
      ?auto_176768 - OBJ
      ?auto_176769 - OBJ
      ?auto_176770 - OBJ
      ?auto_176766 - LOCATION
    )
    :vars
    (
      ?auto_176773 - LOCATION
      ?auto_176771 - CITY
      ?auto_176772 - TRUCK
      ?auto_176774 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_176768 ?auto_176767 ) ) ( not ( = ?auto_176769 ?auto_176767 ) ) ( not ( = ?auto_176769 ?auto_176768 ) ) ( not ( = ?auto_176770 ?auto_176767 ) ) ( not ( = ?auto_176770 ?auto_176768 ) ) ( not ( = ?auto_176770 ?auto_176769 ) ) ( IN-CITY ?auto_176773 ?auto_176771 ) ( IN-CITY ?auto_176766 ?auto_176771 ) ( not ( = ?auto_176766 ?auto_176773 ) ) ( OBJ-AT ?auto_176768 ?auto_176766 ) ( OBJ-AT ?auto_176767 ?auto_176773 ) ( IN-TRUCK ?auto_176770 ?auto_176772 ) ( TRUCK-AT ?auto_176772 ?auto_176774 ) ( IN-CITY ?auto_176774 ?auto_176771 ) ( not ( = ?auto_176766 ?auto_176774 ) ) ( not ( = ?auto_176773 ?auto_176774 ) ) ( OBJ-AT ?auto_176769 ?auto_176766 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176768 ?auto_176767 ?auto_176766 )
      ( DELIVER-4PKG-VERIFY ?auto_176767 ?auto_176768 ?auto_176769 ?auto_176770 ?auto_176766 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176795 - OBJ
      ?auto_176796 - OBJ
      ?auto_176797 - OBJ
      ?auto_176798 - OBJ
      ?auto_176794 - LOCATION
    )
    :vars
    (
      ?auto_176801 - LOCATION
      ?auto_176799 - CITY
      ?auto_176800 - TRUCK
      ?auto_176802 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_176796 ?auto_176795 ) ) ( not ( = ?auto_176797 ?auto_176795 ) ) ( not ( = ?auto_176797 ?auto_176796 ) ) ( not ( = ?auto_176798 ?auto_176795 ) ) ( not ( = ?auto_176798 ?auto_176796 ) ) ( not ( = ?auto_176798 ?auto_176797 ) ) ( IN-CITY ?auto_176801 ?auto_176799 ) ( IN-CITY ?auto_176794 ?auto_176799 ) ( not ( = ?auto_176794 ?auto_176801 ) ) ( OBJ-AT ?auto_176796 ?auto_176794 ) ( OBJ-AT ?auto_176795 ?auto_176801 ) ( IN-TRUCK ?auto_176797 ?auto_176800 ) ( TRUCK-AT ?auto_176800 ?auto_176802 ) ( IN-CITY ?auto_176802 ?auto_176799 ) ( not ( = ?auto_176794 ?auto_176802 ) ) ( not ( = ?auto_176801 ?auto_176802 ) ) ( OBJ-AT ?auto_176798 ?auto_176794 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176796 ?auto_176795 ?auto_176794 )
      ( DELIVER-4PKG-VERIFY ?auto_176795 ?auto_176796 ?auto_176797 ?auto_176798 ?auto_176794 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176881 - OBJ
      ?auto_176882 - OBJ
      ?auto_176883 - OBJ
      ?auto_176884 - OBJ
      ?auto_176880 - LOCATION
    )
    :vars
    (
      ?auto_176887 - LOCATION
      ?auto_176885 - CITY
      ?auto_176886 - TRUCK
      ?auto_176888 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_176882 ?auto_176881 ) ) ( not ( = ?auto_176883 ?auto_176881 ) ) ( not ( = ?auto_176883 ?auto_176882 ) ) ( not ( = ?auto_176884 ?auto_176881 ) ) ( not ( = ?auto_176884 ?auto_176882 ) ) ( not ( = ?auto_176884 ?auto_176883 ) ) ( IN-CITY ?auto_176887 ?auto_176885 ) ( IN-CITY ?auto_176880 ?auto_176885 ) ( not ( = ?auto_176880 ?auto_176887 ) ) ( OBJ-AT ?auto_176883 ?auto_176880 ) ( OBJ-AT ?auto_176881 ?auto_176887 ) ( IN-TRUCK ?auto_176884 ?auto_176886 ) ( TRUCK-AT ?auto_176886 ?auto_176888 ) ( IN-CITY ?auto_176888 ?auto_176885 ) ( not ( = ?auto_176880 ?auto_176888 ) ) ( not ( = ?auto_176887 ?auto_176888 ) ) ( OBJ-AT ?auto_176882 ?auto_176880 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176883 ?auto_176881 ?auto_176880 )
      ( DELIVER-4PKG-VERIFY ?auto_176881 ?auto_176882 ?auto_176883 ?auto_176884 ?auto_176880 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176942 - OBJ
      ?auto_176943 - OBJ
      ?auto_176944 - OBJ
      ?auto_176945 - OBJ
      ?auto_176941 - LOCATION
    )
    :vars
    (
      ?auto_176948 - LOCATION
      ?auto_176946 - CITY
      ?auto_176947 - TRUCK
      ?auto_176949 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_176943 ?auto_176942 ) ) ( not ( = ?auto_176944 ?auto_176942 ) ) ( not ( = ?auto_176944 ?auto_176943 ) ) ( not ( = ?auto_176945 ?auto_176942 ) ) ( not ( = ?auto_176945 ?auto_176943 ) ) ( not ( = ?auto_176945 ?auto_176944 ) ) ( IN-CITY ?auto_176948 ?auto_176946 ) ( IN-CITY ?auto_176941 ?auto_176946 ) ( not ( = ?auto_176941 ?auto_176948 ) ) ( OBJ-AT ?auto_176945 ?auto_176941 ) ( OBJ-AT ?auto_176942 ?auto_176948 ) ( IN-TRUCK ?auto_176944 ?auto_176947 ) ( TRUCK-AT ?auto_176947 ?auto_176949 ) ( IN-CITY ?auto_176949 ?auto_176946 ) ( not ( = ?auto_176941 ?auto_176949 ) ) ( not ( = ?auto_176948 ?auto_176949 ) ) ( OBJ-AT ?auto_176943 ?auto_176941 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176945 ?auto_176942 ?auto_176941 )
      ( DELIVER-4PKG-VERIFY ?auto_176942 ?auto_176943 ?auto_176944 ?auto_176945 ?auto_176941 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177032 - OBJ
      ?auto_177033 - OBJ
      ?auto_177034 - OBJ
      ?auto_177035 - OBJ
      ?auto_177031 - LOCATION
    )
    :vars
    (
      ?auto_177038 - LOCATION
      ?auto_177036 - CITY
      ?auto_177037 - TRUCK
      ?auto_177039 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177033 ?auto_177032 ) ) ( not ( = ?auto_177034 ?auto_177032 ) ) ( not ( = ?auto_177034 ?auto_177033 ) ) ( not ( = ?auto_177035 ?auto_177032 ) ) ( not ( = ?auto_177035 ?auto_177033 ) ) ( not ( = ?auto_177035 ?auto_177034 ) ) ( IN-CITY ?auto_177038 ?auto_177036 ) ( IN-CITY ?auto_177031 ?auto_177036 ) ( not ( = ?auto_177031 ?auto_177038 ) ) ( OBJ-AT ?auto_177034 ?auto_177031 ) ( OBJ-AT ?auto_177032 ?auto_177038 ) ( IN-TRUCK ?auto_177033 ?auto_177037 ) ( TRUCK-AT ?auto_177037 ?auto_177039 ) ( IN-CITY ?auto_177039 ?auto_177036 ) ( not ( = ?auto_177031 ?auto_177039 ) ) ( not ( = ?auto_177038 ?auto_177039 ) ) ( OBJ-AT ?auto_177035 ?auto_177031 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177034 ?auto_177032 ?auto_177031 )
      ( DELIVER-4PKG-VERIFY ?auto_177032 ?auto_177033 ?auto_177034 ?auto_177035 ?auto_177031 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177059 - OBJ
      ?auto_177060 - OBJ
      ?auto_177061 - OBJ
      ?auto_177062 - OBJ
      ?auto_177058 - LOCATION
    )
    :vars
    (
      ?auto_177065 - LOCATION
      ?auto_177063 - CITY
      ?auto_177064 - TRUCK
      ?auto_177066 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177060 ?auto_177059 ) ) ( not ( = ?auto_177061 ?auto_177059 ) ) ( not ( = ?auto_177061 ?auto_177060 ) ) ( not ( = ?auto_177062 ?auto_177059 ) ) ( not ( = ?auto_177062 ?auto_177060 ) ) ( not ( = ?auto_177062 ?auto_177061 ) ) ( IN-CITY ?auto_177065 ?auto_177063 ) ( IN-CITY ?auto_177058 ?auto_177063 ) ( not ( = ?auto_177058 ?auto_177065 ) ) ( OBJ-AT ?auto_177062 ?auto_177058 ) ( OBJ-AT ?auto_177059 ?auto_177065 ) ( IN-TRUCK ?auto_177060 ?auto_177064 ) ( TRUCK-AT ?auto_177064 ?auto_177066 ) ( IN-CITY ?auto_177066 ?auto_177063 ) ( not ( = ?auto_177058 ?auto_177066 ) ) ( not ( = ?auto_177065 ?auto_177066 ) ) ( OBJ-AT ?auto_177061 ?auto_177058 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177062 ?auto_177059 ?auto_177058 )
      ( DELIVER-4PKG-VERIFY ?auto_177059 ?auto_177060 ?auto_177061 ?auto_177062 ?auto_177058 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_177338 - OBJ
      ?auto_177337 - LOCATION
    )
    :vars
    (
      ?auto_177344 - OBJ
      ?auto_177342 - LOCATION
      ?auto_177339 - CITY
      ?auto_177341 - OBJ
      ?auto_177340 - TRUCK
      ?auto_177343 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177338 ?auto_177344 ) ) ( IN-CITY ?auto_177342 ?auto_177339 ) ( IN-CITY ?auto_177337 ?auto_177339 ) ( not ( = ?auto_177337 ?auto_177342 ) ) ( OBJ-AT ?auto_177344 ?auto_177337 ) ( OBJ-AT ?auto_177338 ?auto_177342 ) ( not ( = ?auto_177341 ?auto_177344 ) ) ( not ( = ?auto_177338 ?auto_177341 ) ) ( TRUCK-AT ?auto_177340 ?auto_177343 ) ( IN-CITY ?auto_177343 ?auto_177339 ) ( not ( = ?auto_177337 ?auto_177343 ) ) ( not ( = ?auto_177342 ?auto_177343 ) ) ( OBJ-AT ?auto_177341 ?auto_177343 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_177341 ?auto_177340 ?auto_177343 )
      ( DELIVER-2PKG ?auto_177344 ?auto_177338 ?auto_177337 )
      ( DELIVER-1PKG-VERIFY ?auto_177338 ?auto_177337 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177346 - OBJ
      ?auto_177347 - OBJ
      ?auto_177345 - LOCATION
    )
    :vars
    (
      ?auto_177350 - LOCATION
      ?auto_177352 - CITY
      ?auto_177348 - OBJ
      ?auto_177349 - TRUCK
      ?auto_177351 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177347 ?auto_177346 ) ) ( IN-CITY ?auto_177350 ?auto_177352 ) ( IN-CITY ?auto_177345 ?auto_177352 ) ( not ( = ?auto_177345 ?auto_177350 ) ) ( OBJ-AT ?auto_177346 ?auto_177345 ) ( OBJ-AT ?auto_177347 ?auto_177350 ) ( not ( = ?auto_177348 ?auto_177346 ) ) ( not ( = ?auto_177347 ?auto_177348 ) ) ( TRUCK-AT ?auto_177349 ?auto_177351 ) ( IN-CITY ?auto_177351 ?auto_177352 ) ( not ( = ?auto_177345 ?auto_177351 ) ) ( not ( = ?auto_177350 ?auto_177351 ) ) ( OBJ-AT ?auto_177348 ?auto_177351 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_177347 ?auto_177345 )
      ( DELIVER-2PKG-VERIFY ?auto_177346 ?auto_177347 ?auto_177345 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177354 - OBJ
      ?auto_177355 - OBJ
      ?auto_177353 - LOCATION
    )
    :vars
    (
      ?auto_177358 - OBJ
      ?auto_177356 - LOCATION
      ?auto_177359 - CITY
      ?auto_177360 - OBJ
      ?auto_177361 - TRUCK
      ?auto_177357 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177355 ?auto_177354 ) ) ( not ( = ?auto_177355 ?auto_177358 ) ) ( IN-CITY ?auto_177356 ?auto_177359 ) ( IN-CITY ?auto_177353 ?auto_177359 ) ( not ( = ?auto_177353 ?auto_177356 ) ) ( OBJ-AT ?auto_177358 ?auto_177353 ) ( OBJ-AT ?auto_177355 ?auto_177356 ) ( not ( = ?auto_177360 ?auto_177358 ) ) ( not ( = ?auto_177355 ?auto_177360 ) ) ( TRUCK-AT ?auto_177361 ?auto_177357 ) ( IN-CITY ?auto_177357 ?auto_177359 ) ( not ( = ?auto_177353 ?auto_177357 ) ) ( not ( = ?auto_177356 ?auto_177357 ) ) ( OBJ-AT ?auto_177360 ?auto_177357 ) ( OBJ-AT ?auto_177354 ?auto_177353 ) ( not ( = ?auto_177354 ?auto_177358 ) ) ( not ( = ?auto_177354 ?auto_177360 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177358 ?auto_177355 ?auto_177353 )
      ( DELIVER-2PKG-VERIFY ?auto_177354 ?auto_177355 ?auto_177353 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177363 - OBJ
      ?auto_177364 - OBJ
      ?auto_177362 - LOCATION
    )
    :vars
    (
      ?auto_177367 - OBJ
      ?auto_177365 - LOCATION
      ?auto_177368 - CITY
      ?auto_177369 - TRUCK
      ?auto_177366 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177364 ?auto_177363 ) ) ( not ( = ?auto_177364 ?auto_177367 ) ) ( IN-CITY ?auto_177365 ?auto_177368 ) ( IN-CITY ?auto_177362 ?auto_177368 ) ( not ( = ?auto_177362 ?auto_177365 ) ) ( OBJ-AT ?auto_177367 ?auto_177362 ) ( OBJ-AT ?auto_177364 ?auto_177365 ) ( not ( = ?auto_177363 ?auto_177367 ) ) ( TRUCK-AT ?auto_177369 ?auto_177366 ) ( IN-CITY ?auto_177366 ?auto_177368 ) ( not ( = ?auto_177362 ?auto_177366 ) ) ( not ( = ?auto_177365 ?auto_177366 ) ) ( OBJ-AT ?auto_177363 ?auto_177366 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177367 ?auto_177364 ?auto_177362 )
      ( DELIVER-2PKG-VERIFY ?auto_177363 ?auto_177364 ?auto_177362 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177371 - OBJ
      ?auto_177372 - OBJ
      ?auto_177370 - LOCATION
    )
    :vars
    (
      ?auto_177373 - LOCATION
      ?auto_177375 - CITY
      ?auto_177376 - OBJ
      ?auto_177377 - TRUCK
      ?auto_177374 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177372 ?auto_177371 ) ) ( IN-CITY ?auto_177373 ?auto_177375 ) ( IN-CITY ?auto_177370 ?auto_177375 ) ( not ( = ?auto_177370 ?auto_177373 ) ) ( OBJ-AT ?auto_177372 ?auto_177370 ) ( OBJ-AT ?auto_177371 ?auto_177373 ) ( not ( = ?auto_177376 ?auto_177372 ) ) ( not ( = ?auto_177371 ?auto_177376 ) ) ( TRUCK-AT ?auto_177377 ?auto_177374 ) ( IN-CITY ?auto_177374 ?auto_177375 ) ( not ( = ?auto_177370 ?auto_177374 ) ) ( not ( = ?auto_177373 ?auto_177374 ) ) ( OBJ-AT ?auto_177376 ?auto_177374 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177372 ?auto_177371 ?auto_177370 )
      ( DELIVER-2PKG-VERIFY ?auto_177371 ?auto_177372 ?auto_177370 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177379 - OBJ
      ?auto_177380 - OBJ
      ?auto_177378 - LOCATION
    )
    :vars
    (
      ?auto_177383 - OBJ
      ?auto_177381 - LOCATION
      ?auto_177384 - CITY
      ?auto_177385 - OBJ
      ?auto_177386 - TRUCK
      ?auto_177382 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177380 ?auto_177379 ) ) ( not ( = ?auto_177379 ?auto_177383 ) ) ( IN-CITY ?auto_177381 ?auto_177384 ) ( IN-CITY ?auto_177378 ?auto_177384 ) ( not ( = ?auto_177378 ?auto_177381 ) ) ( OBJ-AT ?auto_177383 ?auto_177378 ) ( OBJ-AT ?auto_177379 ?auto_177381 ) ( not ( = ?auto_177385 ?auto_177383 ) ) ( not ( = ?auto_177379 ?auto_177385 ) ) ( TRUCK-AT ?auto_177386 ?auto_177382 ) ( IN-CITY ?auto_177382 ?auto_177384 ) ( not ( = ?auto_177378 ?auto_177382 ) ) ( not ( = ?auto_177381 ?auto_177382 ) ) ( OBJ-AT ?auto_177385 ?auto_177382 ) ( OBJ-AT ?auto_177380 ?auto_177378 ) ( not ( = ?auto_177380 ?auto_177383 ) ) ( not ( = ?auto_177380 ?auto_177385 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177383 ?auto_177379 ?auto_177378 )
      ( DELIVER-2PKG-VERIFY ?auto_177379 ?auto_177380 ?auto_177378 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177388 - OBJ
      ?auto_177389 - OBJ
      ?auto_177387 - LOCATION
    )
    :vars
    (
      ?auto_177392 - OBJ
      ?auto_177390 - LOCATION
      ?auto_177393 - CITY
      ?auto_177394 - TRUCK
      ?auto_177391 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177389 ?auto_177388 ) ) ( not ( = ?auto_177388 ?auto_177392 ) ) ( IN-CITY ?auto_177390 ?auto_177393 ) ( IN-CITY ?auto_177387 ?auto_177393 ) ( not ( = ?auto_177387 ?auto_177390 ) ) ( OBJ-AT ?auto_177392 ?auto_177387 ) ( OBJ-AT ?auto_177388 ?auto_177390 ) ( not ( = ?auto_177389 ?auto_177392 ) ) ( TRUCK-AT ?auto_177394 ?auto_177391 ) ( IN-CITY ?auto_177391 ?auto_177393 ) ( not ( = ?auto_177387 ?auto_177391 ) ) ( not ( = ?auto_177390 ?auto_177391 ) ) ( OBJ-AT ?auto_177389 ?auto_177391 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177392 ?auto_177388 ?auto_177387 )
      ( DELIVER-2PKG-VERIFY ?auto_177388 ?auto_177389 ?auto_177387 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177414 - OBJ
      ?auto_177415 - OBJ
      ?auto_177416 - OBJ
      ?auto_177413 - LOCATION
    )
    :vars
    (
      ?auto_177417 - LOCATION
      ?auto_177419 - CITY
      ?auto_177420 - OBJ
      ?auto_177421 - TRUCK
      ?auto_177418 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177415 ?auto_177414 ) ) ( not ( = ?auto_177416 ?auto_177414 ) ) ( not ( = ?auto_177416 ?auto_177415 ) ) ( IN-CITY ?auto_177417 ?auto_177419 ) ( IN-CITY ?auto_177413 ?auto_177419 ) ( not ( = ?auto_177413 ?auto_177417 ) ) ( OBJ-AT ?auto_177414 ?auto_177413 ) ( OBJ-AT ?auto_177416 ?auto_177417 ) ( not ( = ?auto_177420 ?auto_177414 ) ) ( not ( = ?auto_177416 ?auto_177420 ) ) ( TRUCK-AT ?auto_177421 ?auto_177418 ) ( IN-CITY ?auto_177418 ?auto_177419 ) ( not ( = ?auto_177413 ?auto_177418 ) ) ( not ( = ?auto_177417 ?auto_177418 ) ) ( OBJ-AT ?auto_177420 ?auto_177418 ) ( OBJ-AT ?auto_177415 ?auto_177413 ) ( not ( = ?auto_177415 ?auto_177420 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177414 ?auto_177416 ?auto_177413 )
      ( DELIVER-3PKG-VERIFY ?auto_177414 ?auto_177415 ?auto_177416 ?auto_177413 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177423 - OBJ
      ?auto_177424 - OBJ
      ?auto_177425 - OBJ
      ?auto_177422 - LOCATION
    )
    :vars
    (
      ?auto_177426 - LOCATION
      ?auto_177428 - CITY
      ?auto_177429 - TRUCK
      ?auto_177427 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177424 ?auto_177423 ) ) ( not ( = ?auto_177425 ?auto_177423 ) ) ( not ( = ?auto_177425 ?auto_177424 ) ) ( IN-CITY ?auto_177426 ?auto_177428 ) ( IN-CITY ?auto_177422 ?auto_177428 ) ( not ( = ?auto_177422 ?auto_177426 ) ) ( OBJ-AT ?auto_177423 ?auto_177422 ) ( OBJ-AT ?auto_177425 ?auto_177426 ) ( TRUCK-AT ?auto_177429 ?auto_177427 ) ( IN-CITY ?auto_177427 ?auto_177428 ) ( not ( = ?auto_177422 ?auto_177427 ) ) ( not ( = ?auto_177426 ?auto_177427 ) ) ( OBJ-AT ?auto_177424 ?auto_177427 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177423 ?auto_177425 ?auto_177422 )
      ( DELIVER-3PKG-VERIFY ?auto_177423 ?auto_177424 ?auto_177425 ?auto_177422 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177440 - OBJ
      ?auto_177441 - OBJ
      ?auto_177442 - OBJ
      ?auto_177439 - LOCATION
    )
    :vars
    (
      ?auto_177443 - LOCATION
      ?auto_177445 - CITY
      ?auto_177446 - OBJ
      ?auto_177447 - TRUCK
      ?auto_177444 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177441 ?auto_177440 ) ) ( not ( = ?auto_177442 ?auto_177440 ) ) ( not ( = ?auto_177442 ?auto_177441 ) ) ( IN-CITY ?auto_177443 ?auto_177445 ) ( IN-CITY ?auto_177439 ?auto_177445 ) ( not ( = ?auto_177439 ?auto_177443 ) ) ( OBJ-AT ?auto_177440 ?auto_177439 ) ( OBJ-AT ?auto_177441 ?auto_177443 ) ( not ( = ?auto_177446 ?auto_177440 ) ) ( not ( = ?auto_177441 ?auto_177446 ) ) ( TRUCK-AT ?auto_177447 ?auto_177444 ) ( IN-CITY ?auto_177444 ?auto_177445 ) ( not ( = ?auto_177439 ?auto_177444 ) ) ( not ( = ?auto_177443 ?auto_177444 ) ) ( OBJ-AT ?auto_177446 ?auto_177444 ) ( OBJ-AT ?auto_177442 ?auto_177439 ) ( not ( = ?auto_177442 ?auto_177446 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177440 ?auto_177441 ?auto_177439 )
      ( DELIVER-3PKG-VERIFY ?auto_177440 ?auto_177441 ?auto_177442 ?auto_177439 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177449 - OBJ
      ?auto_177450 - OBJ
      ?auto_177451 - OBJ
      ?auto_177448 - LOCATION
    )
    :vars
    (
      ?auto_177452 - LOCATION
      ?auto_177454 - CITY
      ?auto_177455 - TRUCK
      ?auto_177453 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177450 ?auto_177449 ) ) ( not ( = ?auto_177451 ?auto_177449 ) ) ( not ( = ?auto_177451 ?auto_177450 ) ) ( IN-CITY ?auto_177452 ?auto_177454 ) ( IN-CITY ?auto_177448 ?auto_177454 ) ( not ( = ?auto_177448 ?auto_177452 ) ) ( OBJ-AT ?auto_177449 ?auto_177448 ) ( OBJ-AT ?auto_177450 ?auto_177452 ) ( TRUCK-AT ?auto_177455 ?auto_177453 ) ( IN-CITY ?auto_177453 ?auto_177454 ) ( not ( = ?auto_177448 ?auto_177453 ) ) ( not ( = ?auto_177452 ?auto_177453 ) ) ( OBJ-AT ?auto_177451 ?auto_177453 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177449 ?auto_177450 ?auto_177448 )
      ( DELIVER-3PKG-VERIFY ?auto_177449 ?auto_177450 ?auto_177451 ?auto_177448 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177466 - OBJ
      ?auto_177467 - OBJ
      ?auto_177468 - OBJ
      ?auto_177465 - LOCATION
    )
    :vars
    (
      ?auto_177469 - LOCATION
      ?auto_177471 - CITY
      ?auto_177472 - OBJ
      ?auto_177473 - TRUCK
      ?auto_177470 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177467 ?auto_177466 ) ) ( not ( = ?auto_177468 ?auto_177466 ) ) ( not ( = ?auto_177468 ?auto_177467 ) ) ( IN-CITY ?auto_177469 ?auto_177471 ) ( IN-CITY ?auto_177465 ?auto_177471 ) ( not ( = ?auto_177465 ?auto_177469 ) ) ( OBJ-AT ?auto_177467 ?auto_177465 ) ( OBJ-AT ?auto_177468 ?auto_177469 ) ( not ( = ?auto_177472 ?auto_177467 ) ) ( not ( = ?auto_177468 ?auto_177472 ) ) ( TRUCK-AT ?auto_177473 ?auto_177470 ) ( IN-CITY ?auto_177470 ?auto_177471 ) ( not ( = ?auto_177465 ?auto_177470 ) ) ( not ( = ?auto_177469 ?auto_177470 ) ) ( OBJ-AT ?auto_177472 ?auto_177470 ) ( OBJ-AT ?auto_177466 ?auto_177465 ) ( not ( = ?auto_177466 ?auto_177472 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177467 ?auto_177468 ?auto_177465 )
      ( DELIVER-3PKG-VERIFY ?auto_177466 ?auto_177467 ?auto_177468 ?auto_177465 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177485 - OBJ
      ?auto_177486 - OBJ
      ?auto_177487 - OBJ
      ?auto_177484 - LOCATION
    )
    :vars
    (
      ?auto_177490 - OBJ
      ?auto_177488 - LOCATION
      ?auto_177491 - CITY
      ?auto_177492 - TRUCK
      ?auto_177489 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177486 ?auto_177485 ) ) ( not ( = ?auto_177487 ?auto_177485 ) ) ( not ( = ?auto_177487 ?auto_177486 ) ) ( not ( = ?auto_177487 ?auto_177490 ) ) ( IN-CITY ?auto_177488 ?auto_177491 ) ( IN-CITY ?auto_177484 ?auto_177491 ) ( not ( = ?auto_177484 ?auto_177488 ) ) ( OBJ-AT ?auto_177490 ?auto_177484 ) ( OBJ-AT ?auto_177487 ?auto_177488 ) ( not ( = ?auto_177486 ?auto_177490 ) ) ( TRUCK-AT ?auto_177492 ?auto_177489 ) ( IN-CITY ?auto_177489 ?auto_177491 ) ( not ( = ?auto_177484 ?auto_177489 ) ) ( not ( = ?auto_177488 ?auto_177489 ) ) ( OBJ-AT ?auto_177486 ?auto_177489 ) ( OBJ-AT ?auto_177485 ?auto_177484 ) ( not ( = ?auto_177485 ?auto_177490 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177490 ?auto_177487 ?auto_177484 )
      ( DELIVER-3PKG-VERIFY ?auto_177485 ?auto_177486 ?auto_177487 ?auto_177484 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177494 - OBJ
      ?auto_177495 - OBJ
      ?auto_177496 - OBJ
      ?auto_177493 - LOCATION
    )
    :vars
    (
      ?auto_177497 - LOCATION
      ?auto_177499 - CITY
      ?auto_177500 - OBJ
      ?auto_177501 - TRUCK
      ?auto_177498 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177495 ?auto_177494 ) ) ( not ( = ?auto_177496 ?auto_177494 ) ) ( not ( = ?auto_177496 ?auto_177495 ) ) ( IN-CITY ?auto_177497 ?auto_177499 ) ( IN-CITY ?auto_177493 ?auto_177499 ) ( not ( = ?auto_177493 ?auto_177497 ) ) ( OBJ-AT ?auto_177496 ?auto_177493 ) ( OBJ-AT ?auto_177495 ?auto_177497 ) ( not ( = ?auto_177500 ?auto_177496 ) ) ( not ( = ?auto_177495 ?auto_177500 ) ) ( TRUCK-AT ?auto_177501 ?auto_177498 ) ( IN-CITY ?auto_177498 ?auto_177499 ) ( not ( = ?auto_177493 ?auto_177498 ) ) ( not ( = ?auto_177497 ?auto_177498 ) ) ( OBJ-AT ?auto_177500 ?auto_177498 ) ( OBJ-AT ?auto_177494 ?auto_177493 ) ( not ( = ?auto_177494 ?auto_177500 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177496 ?auto_177495 ?auto_177493 )
      ( DELIVER-3PKG-VERIFY ?auto_177494 ?auto_177495 ?auto_177496 ?auto_177493 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177513 - OBJ
      ?auto_177514 - OBJ
      ?auto_177515 - OBJ
      ?auto_177512 - LOCATION
    )
    :vars
    (
      ?auto_177518 - OBJ
      ?auto_177516 - LOCATION
      ?auto_177519 - CITY
      ?auto_177520 - TRUCK
      ?auto_177517 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177514 ?auto_177513 ) ) ( not ( = ?auto_177515 ?auto_177513 ) ) ( not ( = ?auto_177515 ?auto_177514 ) ) ( not ( = ?auto_177514 ?auto_177518 ) ) ( IN-CITY ?auto_177516 ?auto_177519 ) ( IN-CITY ?auto_177512 ?auto_177519 ) ( not ( = ?auto_177512 ?auto_177516 ) ) ( OBJ-AT ?auto_177518 ?auto_177512 ) ( OBJ-AT ?auto_177514 ?auto_177516 ) ( not ( = ?auto_177515 ?auto_177518 ) ) ( TRUCK-AT ?auto_177520 ?auto_177517 ) ( IN-CITY ?auto_177517 ?auto_177519 ) ( not ( = ?auto_177512 ?auto_177517 ) ) ( not ( = ?auto_177516 ?auto_177517 ) ) ( OBJ-AT ?auto_177515 ?auto_177517 ) ( OBJ-AT ?auto_177513 ?auto_177512 ) ( not ( = ?auto_177513 ?auto_177518 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177518 ?auto_177514 ?auto_177512 )
      ( DELIVER-3PKG-VERIFY ?auto_177513 ?auto_177514 ?auto_177515 ?auto_177512 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177532 - OBJ
      ?auto_177533 - OBJ
      ?auto_177534 - OBJ
      ?auto_177531 - LOCATION
    )
    :vars
    (
      ?auto_177535 - LOCATION
      ?auto_177537 - CITY
      ?auto_177538 - TRUCK
      ?auto_177536 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177533 ?auto_177532 ) ) ( not ( = ?auto_177534 ?auto_177532 ) ) ( not ( = ?auto_177534 ?auto_177533 ) ) ( IN-CITY ?auto_177535 ?auto_177537 ) ( IN-CITY ?auto_177531 ?auto_177537 ) ( not ( = ?auto_177531 ?auto_177535 ) ) ( OBJ-AT ?auto_177533 ?auto_177531 ) ( OBJ-AT ?auto_177534 ?auto_177535 ) ( TRUCK-AT ?auto_177538 ?auto_177536 ) ( IN-CITY ?auto_177536 ?auto_177537 ) ( not ( = ?auto_177531 ?auto_177536 ) ) ( not ( = ?auto_177535 ?auto_177536 ) ) ( OBJ-AT ?auto_177532 ?auto_177536 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177533 ?auto_177534 ?auto_177531 )
      ( DELIVER-3PKG-VERIFY ?auto_177532 ?auto_177533 ?auto_177534 ?auto_177531 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177540 - OBJ
      ?auto_177541 - OBJ
      ?auto_177542 - OBJ
      ?auto_177539 - LOCATION
    )
    :vars
    (
      ?auto_177545 - OBJ
      ?auto_177543 - LOCATION
      ?auto_177546 - CITY
      ?auto_177547 - TRUCK
      ?auto_177544 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177541 ?auto_177540 ) ) ( not ( = ?auto_177542 ?auto_177540 ) ) ( not ( = ?auto_177542 ?auto_177541 ) ) ( not ( = ?auto_177542 ?auto_177545 ) ) ( IN-CITY ?auto_177543 ?auto_177546 ) ( IN-CITY ?auto_177539 ?auto_177546 ) ( not ( = ?auto_177539 ?auto_177543 ) ) ( OBJ-AT ?auto_177545 ?auto_177539 ) ( OBJ-AT ?auto_177542 ?auto_177543 ) ( not ( = ?auto_177540 ?auto_177545 ) ) ( TRUCK-AT ?auto_177547 ?auto_177544 ) ( IN-CITY ?auto_177544 ?auto_177546 ) ( not ( = ?auto_177539 ?auto_177544 ) ) ( not ( = ?auto_177543 ?auto_177544 ) ) ( OBJ-AT ?auto_177540 ?auto_177544 ) ( OBJ-AT ?auto_177541 ?auto_177539 ) ( not ( = ?auto_177541 ?auto_177545 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177545 ?auto_177542 ?auto_177539 )
      ( DELIVER-3PKG-VERIFY ?auto_177540 ?auto_177541 ?auto_177542 ?auto_177539 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177558 - OBJ
      ?auto_177559 - OBJ
      ?auto_177560 - OBJ
      ?auto_177557 - LOCATION
    )
    :vars
    (
      ?auto_177561 - LOCATION
      ?auto_177563 - CITY
      ?auto_177564 - TRUCK
      ?auto_177562 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177559 ?auto_177558 ) ) ( not ( = ?auto_177560 ?auto_177558 ) ) ( not ( = ?auto_177560 ?auto_177559 ) ) ( IN-CITY ?auto_177561 ?auto_177563 ) ( IN-CITY ?auto_177557 ?auto_177563 ) ( not ( = ?auto_177557 ?auto_177561 ) ) ( OBJ-AT ?auto_177560 ?auto_177557 ) ( OBJ-AT ?auto_177559 ?auto_177561 ) ( TRUCK-AT ?auto_177564 ?auto_177562 ) ( IN-CITY ?auto_177562 ?auto_177563 ) ( not ( = ?auto_177557 ?auto_177562 ) ) ( not ( = ?auto_177561 ?auto_177562 ) ) ( OBJ-AT ?auto_177558 ?auto_177562 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177560 ?auto_177559 ?auto_177557 )
      ( DELIVER-3PKG-VERIFY ?auto_177558 ?auto_177559 ?auto_177560 ?auto_177557 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177566 - OBJ
      ?auto_177567 - OBJ
      ?auto_177568 - OBJ
      ?auto_177565 - LOCATION
    )
    :vars
    (
      ?auto_177571 - OBJ
      ?auto_177569 - LOCATION
      ?auto_177572 - CITY
      ?auto_177573 - TRUCK
      ?auto_177570 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177567 ?auto_177566 ) ) ( not ( = ?auto_177568 ?auto_177566 ) ) ( not ( = ?auto_177568 ?auto_177567 ) ) ( not ( = ?auto_177567 ?auto_177571 ) ) ( IN-CITY ?auto_177569 ?auto_177572 ) ( IN-CITY ?auto_177565 ?auto_177572 ) ( not ( = ?auto_177565 ?auto_177569 ) ) ( OBJ-AT ?auto_177571 ?auto_177565 ) ( OBJ-AT ?auto_177567 ?auto_177569 ) ( not ( = ?auto_177566 ?auto_177571 ) ) ( TRUCK-AT ?auto_177573 ?auto_177570 ) ( IN-CITY ?auto_177570 ?auto_177572 ) ( not ( = ?auto_177565 ?auto_177570 ) ) ( not ( = ?auto_177569 ?auto_177570 ) ) ( OBJ-AT ?auto_177566 ?auto_177570 ) ( OBJ-AT ?auto_177568 ?auto_177565 ) ( not ( = ?auto_177568 ?auto_177571 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177571 ?auto_177567 ?auto_177565 )
      ( DELIVER-3PKG-VERIFY ?auto_177566 ?auto_177567 ?auto_177568 ?auto_177565 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177602 - OBJ
      ?auto_177603 - OBJ
      ?auto_177604 - OBJ
      ?auto_177601 - LOCATION
    )
    :vars
    (
      ?auto_177605 - LOCATION
      ?auto_177607 - CITY
      ?auto_177608 - OBJ
      ?auto_177609 - TRUCK
      ?auto_177606 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177603 ?auto_177602 ) ) ( not ( = ?auto_177604 ?auto_177602 ) ) ( not ( = ?auto_177604 ?auto_177603 ) ) ( IN-CITY ?auto_177605 ?auto_177607 ) ( IN-CITY ?auto_177601 ?auto_177607 ) ( not ( = ?auto_177601 ?auto_177605 ) ) ( OBJ-AT ?auto_177603 ?auto_177601 ) ( OBJ-AT ?auto_177602 ?auto_177605 ) ( not ( = ?auto_177608 ?auto_177603 ) ) ( not ( = ?auto_177602 ?auto_177608 ) ) ( TRUCK-AT ?auto_177609 ?auto_177606 ) ( IN-CITY ?auto_177606 ?auto_177607 ) ( not ( = ?auto_177601 ?auto_177606 ) ) ( not ( = ?auto_177605 ?auto_177606 ) ) ( OBJ-AT ?auto_177608 ?auto_177606 ) ( OBJ-AT ?auto_177604 ?auto_177601 ) ( not ( = ?auto_177604 ?auto_177608 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177603 ?auto_177602 ?auto_177601 )
      ( DELIVER-3PKG-VERIFY ?auto_177602 ?auto_177603 ?auto_177604 ?auto_177601 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177611 - OBJ
      ?auto_177612 - OBJ
      ?auto_177613 - OBJ
      ?auto_177610 - LOCATION
    )
    :vars
    (
      ?auto_177614 - LOCATION
      ?auto_177616 - CITY
      ?auto_177617 - TRUCK
      ?auto_177615 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177612 ?auto_177611 ) ) ( not ( = ?auto_177613 ?auto_177611 ) ) ( not ( = ?auto_177613 ?auto_177612 ) ) ( IN-CITY ?auto_177614 ?auto_177616 ) ( IN-CITY ?auto_177610 ?auto_177616 ) ( not ( = ?auto_177610 ?auto_177614 ) ) ( OBJ-AT ?auto_177612 ?auto_177610 ) ( OBJ-AT ?auto_177611 ?auto_177614 ) ( TRUCK-AT ?auto_177617 ?auto_177615 ) ( IN-CITY ?auto_177615 ?auto_177616 ) ( not ( = ?auto_177610 ?auto_177615 ) ) ( not ( = ?auto_177614 ?auto_177615 ) ) ( OBJ-AT ?auto_177613 ?auto_177615 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177612 ?auto_177611 ?auto_177610 )
      ( DELIVER-3PKG-VERIFY ?auto_177611 ?auto_177612 ?auto_177613 ?auto_177610 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177628 - OBJ
      ?auto_177629 - OBJ
      ?auto_177630 - OBJ
      ?auto_177627 - LOCATION
    )
    :vars
    (
      ?auto_177631 - LOCATION
      ?auto_177633 - CITY
      ?auto_177634 - OBJ
      ?auto_177635 - TRUCK
      ?auto_177632 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177629 ?auto_177628 ) ) ( not ( = ?auto_177630 ?auto_177628 ) ) ( not ( = ?auto_177630 ?auto_177629 ) ) ( IN-CITY ?auto_177631 ?auto_177633 ) ( IN-CITY ?auto_177627 ?auto_177633 ) ( not ( = ?auto_177627 ?auto_177631 ) ) ( OBJ-AT ?auto_177630 ?auto_177627 ) ( OBJ-AT ?auto_177628 ?auto_177631 ) ( not ( = ?auto_177634 ?auto_177630 ) ) ( not ( = ?auto_177628 ?auto_177634 ) ) ( TRUCK-AT ?auto_177635 ?auto_177632 ) ( IN-CITY ?auto_177632 ?auto_177633 ) ( not ( = ?auto_177627 ?auto_177632 ) ) ( not ( = ?auto_177631 ?auto_177632 ) ) ( OBJ-AT ?auto_177634 ?auto_177632 ) ( OBJ-AT ?auto_177629 ?auto_177627 ) ( not ( = ?auto_177629 ?auto_177634 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177630 ?auto_177628 ?auto_177627 )
      ( DELIVER-3PKG-VERIFY ?auto_177628 ?auto_177629 ?auto_177630 ?auto_177627 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177647 - OBJ
      ?auto_177648 - OBJ
      ?auto_177649 - OBJ
      ?auto_177646 - LOCATION
    )
    :vars
    (
      ?auto_177652 - OBJ
      ?auto_177650 - LOCATION
      ?auto_177653 - CITY
      ?auto_177654 - TRUCK
      ?auto_177651 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177648 ?auto_177647 ) ) ( not ( = ?auto_177649 ?auto_177647 ) ) ( not ( = ?auto_177649 ?auto_177648 ) ) ( not ( = ?auto_177647 ?auto_177652 ) ) ( IN-CITY ?auto_177650 ?auto_177653 ) ( IN-CITY ?auto_177646 ?auto_177653 ) ( not ( = ?auto_177646 ?auto_177650 ) ) ( OBJ-AT ?auto_177652 ?auto_177646 ) ( OBJ-AT ?auto_177647 ?auto_177650 ) ( not ( = ?auto_177649 ?auto_177652 ) ) ( TRUCK-AT ?auto_177654 ?auto_177651 ) ( IN-CITY ?auto_177651 ?auto_177653 ) ( not ( = ?auto_177646 ?auto_177651 ) ) ( not ( = ?auto_177650 ?auto_177651 ) ) ( OBJ-AT ?auto_177649 ?auto_177651 ) ( OBJ-AT ?auto_177648 ?auto_177646 ) ( not ( = ?auto_177648 ?auto_177652 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177652 ?auto_177647 ?auto_177646 )
      ( DELIVER-3PKG-VERIFY ?auto_177647 ?auto_177648 ?auto_177649 ?auto_177646 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177666 - OBJ
      ?auto_177667 - OBJ
      ?auto_177668 - OBJ
      ?auto_177665 - LOCATION
    )
    :vars
    (
      ?auto_177669 - LOCATION
      ?auto_177671 - CITY
      ?auto_177672 - TRUCK
      ?auto_177670 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177667 ?auto_177666 ) ) ( not ( = ?auto_177668 ?auto_177666 ) ) ( not ( = ?auto_177668 ?auto_177667 ) ) ( IN-CITY ?auto_177669 ?auto_177671 ) ( IN-CITY ?auto_177665 ?auto_177671 ) ( not ( = ?auto_177665 ?auto_177669 ) ) ( OBJ-AT ?auto_177668 ?auto_177665 ) ( OBJ-AT ?auto_177666 ?auto_177669 ) ( TRUCK-AT ?auto_177672 ?auto_177670 ) ( IN-CITY ?auto_177670 ?auto_177671 ) ( not ( = ?auto_177665 ?auto_177670 ) ) ( not ( = ?auto_177669 ?auto_177670 ) ) ( OBJ-AT ?auto_177667 ?auto_177670 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177668 ?auto_177666 ?auto_177665 )
      ( DELIVER-3PKG-VERIFY ?auto_177666 ?auto_177667 ?auto_177668 ?auto_177665 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177674 - OBJ
      ?auto_177675 - OBJ
      ?auto_177676 - OBJ
      ?auto_177673 - LOCATION
    )
    :vars
    (
      ?auto_177679 - OBJ
      ?auto_177677 - LOCATION
      ?auto_177680 - CITY
      ?auto_177681 - TRUCK
      ?auto_177678 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177675 ?auto_177674 ) ) ( not ( = ?auto_177676 ?auto_177674 ) ) ( not ( = ?auto_177676 ?auto_177675 ) ) ( not ( = ?auto_177674 ?auto_177679 ) ) ( IN-CITY ?auto_177677 ?auto_177680 ) ( IN-CITY ?auto_177673 ?auto_177680 ) ( not ( = ?auto_177673 ?auto_177677 ) ) ( OBJ-AT ?auto_177679 ?auto_177673 ) ( OBJ-AT ?auto_177674 ?auto_177677 ) ( not ( = ?auto_177675 ?auto_177679 ) ) ( TRUCK-AT ?auto_177681 ?auto_177678 ) ( IN-CITY ?auto_177678 ?auto_177680 ) ( not ( = ?auto_177673 ?auto_177678 ) ) ( not ( = ?auto_177677 ?auto_177678 ) ) ( OBJ-AT ?auto_177675 ?auto_177678 ) ( OBJ-AT ?auto_177676 ?auto_177673 ) ( not ( = ?auto_177676 ?auto_177679 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177679 ?auto_177674 ?auto_177673 )
      ( DELIVER-3PKG-VERIFY ?auto_177674 ?auto_177675 ?auto_177676 ?auto_177673 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177827 - OBJ
      ?auto_177828 - OBJ
      ?auto_177829 - OBJ
      ?auto_177830 - OBJ
      ?auto_177826 - LOCATION
    )
    :vars
    (
      ?auto_177831 - LOCATION
      ?auto_177833 - CITY
      ?auto_177834 - TRUCK
      ?auto_177832 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177828 ?auto_177827 ) ) ( not ( = ?auto_177829 ?auto_177827 ) ) ( not ( = ?auto_177829 ?auto_177828 ) ) ( not ( = ?auto_177830 ?auto_177827 ) ) ( not ( = ?auto_177830 ?auto_177828 ) ) ( not ( = ?auto_177830 ?auto_177829 ) ) ( IN-CITY ?auto_177831 ?auto_177833 ) ( IN-CITY ?auto_177826 ?auto_177833 ) ( not ( = ?auto_177826 ?auto_177831 ) ) ( OBJ-AT ?auto_177827 ?auto_177826 ) ( OBJ-AT ?auto_177830 ?auto_177831 ) ( TRUCK-AT ?auto_177834 ?auto_177832 ) ( IN-CITY ?auto_177832 ?auto_177833 ) ( not ( = ?auto_177826 ?auto_177832 ) ) ( not ( = ?auto_177831 ?auto_177832 ) ) ( OBJ-AT ?auto_177829 ?auto_177832 ) ( OBJ-AT ?auto_177828 ?auto_177826 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177827 ?auto_177830 ?auto_177826 )
      ( DELIVER-4PKG-VERIFY ?auto_177827 ?auto_177828 ?auto_177829 ?auto_177830 ?auto_177826 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177856 - OBJ
      ?auto_177857 - OBJ
      ?auto_177858 - OBJ
      ?auto_177859 - OBJ
      ?auto_177855 - LOCATION
    )
    :vars
    (
      ?auto_177860 - LOCATION
      ?auto_177862 - CITY
      ?auto_177863 - TRUCK
      ?auto_177861 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177857 ?auto_177856 ) ) ( not ( = ?auto_177858 ?auto_177856 ) ) ( not ( = ?auto_177858 ?auto_177857 ) ) ( not ( = ?auto_177859 ?auto_177856 ) ) ( not ( = ?auto_177859 ?auto_177857 ) ) ( not ( = ?auto_177859 ?auto_177858 ) ) ( IN-CITY ?auto_177860 ?auto_177862 ) ( IN-CITY ?auto_177855 ?auto_177862 ) ( not ( = ?auto_177855 ?auto_177860 ) ) ( OBJ-AT ?auto_177856 ?auto_177855 ) ( OBJ-AT ?auto_177858 ?auto_177860 ) ( TRUCK-AT ?auto_177863 ?auto_177861 ) ( IN-CITY ?auto_177861 ?auto_177862 ) ( not ( = ?auto_177855 ?auto_177861 ) ) ( not ( = ?auto_177860 ?auto_177861 ) ) ( OBJ-AT ?auto_177859 ?auto_177861 ) ( OBJ-AT ?auto_177857 ?auto_177855 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177856 ?auto_177858 ?auto_177855 )
      ( DELIVER-4PKG-VERIFY ?auto_177856 ?auto_177857 ?auto_177858 ?auto_177859 ?auto_177855 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177884 - OBJ
      ?auto_177885 - OBJ
      ?auto_177886 - OBJ
      ?auto_177887 - OBJ
      ?auto_177883 - LOCATION
    )
    :vars
    (
      ?auto_177888 - LOCATION
      ?auto_177890 - CITY
      ?auto_177891 - TRUCK
      ?auto_177889 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177885 ?auto_177884 ) ) ( not ( = ?auto_177886 ?auto_177884 ) ) ( not ( = ?auto_177886 ?auto_177885 ) ) ( not ( = ?auto_177887 ?auto_177884 ) ) ( not ( = ?auto_177887 ?auto_177885 ) ) ( not ( = ?auto_177887 ?auto_177886 ) ) ( IN-CITY ?auto_177888 ?auto_177890 ) ( IN-CITY ?auto_177883 ?auto_177890 ) ( not ( = ?auto_177883 ?auto_177888 ) ) ( OBJ-AT ?auto_177884 ?auto_177883 ) ( OBJ-AT ?auto_177887 ?auto_177888 ) ( TRUCK-AT ?auto_177891 ?auto_177889 ) ( IN-CITY ?auto_177889 ?auto_177890 ) ( not ( = ?auto_177883 ?auto_177889 ) ) ( not ( = ?auto_177888 ?auto_177889 ) ) ( OBJ-AT ?auto_177885 ?auto_177889 ) ( OBJ-AT ?auto_177886 ?auto_177883 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177884 ?auto_177887 ?auto_177883 )
      ( DELIVER-4PKG-VERIFY ?auto_177884 ?auto_177885 ?auto_177886 ?auto_177887 ?auto_177883 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177911 - OBJ
      ?auto_177912 - OBJ
      ?auto_177913 - OBJ
      ?auto_177914 - OBJ
      ?auto_177910 - LOCATION
    )
    :vars
    (
      ?auto_177915 - LOCATION
      ?auto_177917 - CITY
      ?auto_177918 - TRUCK
      ?auto_177916 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177912 ?auto_177911 ) ) ( not ( = ?auto_177913 ?auto_177911 ) ) ( not ( = ?auto_177913 ?auto_177912 ) ) ( not ( = ?auto_177914 ?auto_177911 ) ) ( not ( = ?auto_177914 ?auto_177912 ) ) ( not ( = ?auto_177914 ?auto_177913 ) ) ( IN-CITY ?auto_177915 ?auto_177917 ) ( IN-CITY ?auto_177910 ?auto_177917 ) ( not ( = ?auto_177910 ?auto_177915 ) ) ( OBJ-AT ?auto_177911 ?auto_177910 ) ( OBJ-AT ?auto_177913 ?auto_177915 ) ( TRUCK-AT ?auto_177918 ?auto_177916 ) ( IN-CITY ?auto_177916 ?auto_177917 ) ( not ( = ?auto_177910 ?auto_177916 ) ) ( not ( = ?auto_177915 ?auto_177916 ) ) ( OBJ-AT ?auto_177912 ?auto_177916 ) ( OBJ-AT ?auto_177914 ?auto_177910 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177911 ?auto_177913 ?auto_177910 )
      ( DELIVER-4PKG-VERIFY ?auto_177911 ?auto_177912 ?auto_177913 ?auto_177914 ?auto_177910 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177997 - OBJ
      ?auto_177998 - OBJ
      ?auto_177999 - OBJ
      ?auto_178000 - OBJ
      ?auto_177996 - LOCATION
    )
    :vars
    (
      ?auto_178001 - LOCATION
      ?auto_178003 - CITY
      ?auto_178004 - TRUCK
      ?auto_178002 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_177998 ?auto_177997 ) ) ( not ( = ?auto_177999 ?auto_177997 ) ) ( not ( = ?auto_177999 ?auto_177998 ) ) ( not ( = ?auto_178000 ?auto_177997 ) ) ( not ( = ?auto_178000 ?auto_177998 ) ) ( not ( = ?auto_178000 ?auto_177999 ) ) ( IN-CITY ?auto_178001 ?auto_178003 ) ( IN-CITY ?auto_177996 ?auto_178003 ) ( not ( = ?auto_177996 ?auto_178001 ) ) ( OBJ-AT ?auto_177997 ?auto_177996 ) ( OBJ-AT ?auto_177998 ?auto_178001 ) ( TRUCK-AT ?auto_178004 ?auto_178002 ) ( IN-CITY ?auto_178002 ?auto_178003 ) ( not ( = ?auto_177996 ?auto_178002 ) ) ( not ( = ?auto_178001 ?auto_178002 ) ) ( OBJ-AT ?auto_178000 ?auto_178002 ) ( OBJ-AT ?auto_177999 ?auto_177996 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177997 ?auto_177998 ?auto_177996 )
      ( DELIVER-4PKG-VERIFY ?auto_177997 ?auto_177998 ?auto_177999 ?auto_178000 ?auto_177996 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178025 - OBJ
      ?auto_178026 - OBJ
      ?auto_178027 - OBJ
      ?auto_178028 - OBJ
      ?auto_178024 - LOCATION
    )
    :vars
    (
      ?auto_178029 - LOCATION
      ?auto_178031 - CITY
      ?auto_178032 - TRUCK
      ?auto_178030 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_178026 ?auto_178025 ) ) ( not ( = ?auto_178027 ?auto_178025 ) ) ( not ( = ?auto_178027 ?auto_178026 ) ) ( not ( = ?auto_178028 ?auto_178025 ) ) ( not ( = ?auto_178028 ?auto_178026 ) ) ( not ( = ?auto_178028 ?auto_178027 ) ) ( IN-CITY ?auto_178029 ?auto_178031 ) ( IN-CITY ?auto_178024 ?auto_178031 ) ( not ( = ?auto_178024 ?auto_178029 ) ) ( OBJ-AT ?auto_178025 ?auto_178024 ) ( OBJ-AT ?auto_178026 ?auto_178029 ) ( TRUCK-AT ?auto_178032 ?auto_178030 ) ( IN-CITY ?auto_178030 ?auto_178031 ) ( not ( = ?auto_178024 ?auto_178030 ) ) ( not ( = ?auto_178029 ?auto_178030 ) ) ( OBJ-AT ?auto_178027 ?auto_178030 ) ( OBJ-AT ?auto_178028 ?auto_178024 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178025 ?auto_178026 ?auto_178024 )
      ( DELIVER-4PKG-VERIFY ?auto_178025 ?auto_178026 ?auto_178027 ?auto_178028 ?auto_178024 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178111 - OBJ
      ?auto_178112 - OBJ
      ?auto_178113 - OBJ
      ?auto_178114 - OBJ
      ?auto_178110 - LOCATION
    )
    :vars
    (
      ?auto_178115 - LOCATION
      ?auto_178117 - CITY
      ?auto_178118 - TRUCK
      ?auto_178116 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_178112 ?auto_178111 ) ) ( not ( = ?auto_178113 ?auto_178111 ) ) ( not ( = ?auto_178113 ?auto_178112 ) ) ( not ( = ?auto_178114 ?auto_178111 ) ) ( not ( = ?auto_178114 ?auto_178112 ) ) ( not ( = ?auto_178114 ?auto_178113 ) ) ( IN-CITY ?auto_178115 ?auto_178117 ) ( IN-CITY ?auto_178110 ?auto_178117 ) ( not ( = ?auto_178110 ?auto_178115 ) ) ( OBJ-AT ?auto_178112 ?auto_178110 ) ( OBJ-AT ?auto_178114 ?auto_178115 ) ( TRUCK-AT ?auto_178118 ?auto_178116 ) ( IN-CITY ?auto_178116 ?auto_178117 ) ( not ( = ?auto_178110 ?auto_178116 ) ) ( not ( = ?auto_178115 ?auto_178116 ) ) ( OBJ-AT ?auto_178113 ?auto_178116 ) ( OBJ-AT ?auto_178111 ?auto_178110 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178112 ?auto_178114 ?auto_178110 )
      ( DELIVER-4PKG-VERIFY ?auto_178111 ?auto_178112 ?auto_178113 ?auto_178114 ?auto_178110 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178140 - OBJ
      ?auto_178141 - OBJ
      ?auto_178142 - OBJ
      ?auto_178143 - OBJ
      ?auto_178139 - LOCATION
    )
    :vars
    (
      ?auto_178144 - LOCATION
      ?auto_178146 - CITY
      ?auto_178147 - TRUCK
      ?auto_178145 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_178141 ?auto_178140 ) ) ( not ( = ?auto_178142 ?auto_178140 ) ) ( not ( = ?auto_178142 ?auto_178141 ) ) ( not ( = ?auto_178143 ?auto_178140 ) ) ( not ( = ?auto_178143 ?auto_178141 ) ) ( not ( = ?auto_178143 ?auto_178142 ) ) ( IN-CITY ?auto_178144 ?auto_178146 ) ( IN-CITY ?auto_178139 ?auto_178146 ) ( not ( = ?auto_178139 ?auto_178144 ) ) ( OBJ-AT ?auto_178141 ?auto_178139 ) ( OBJ-AT ?auto_178142 ?auto_178144 ) ( TRUCK-AT ?auto_178147 ?auto_178145 ) ( IN-CITY ?auto_178145 ?auto_178146 ) ( not ( = ?auto_178139 ?auto_178145 ) ) ( not ( = ?auto_178144 ?auto_178145 ) ) ( OBJ-AT ?auto_178143 ?auto_178145 ) ( OBJ-AT ?auto_178140 ?auto_178139 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178141 ?auto_178142 ?auto_178139 )
      ( DELIVER-4PKG-VERIFY ?auto_178140 ?auto_178141 ?auto_178142 ?auto_178143 ?auto_178139 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178232 - OBJ
      ?auto_178233 - OBJ
      ?auto_178234 - OBJ
      ?auto_178235 - OBJ
      ?auto_178231 - LOCATION
    )
    :vars
    (
      ?auto_178236 - LOCATION
      ?auto_178238 - CITY
      ?auto_178239 - TRUCK
      ?auto_178237 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_178233 ?auto_178232 ) ) ( not ( = ?auto_178234 ?auto_178232 ) ) ( not ( = ?auto_178234 ?auto_178233 ) ) ( not ( = ?auto_178235 ?auto_178232 ) ) ( not ( = ?auto_178235 ?auto_178233 ) ) ( not ( = ?auto_178235 ?auto_178234 ) ) ( IN-CITY ?auto_178236 ?auto_178238 ) ( IN-CITY ?auto_178231 ?auto_178238 ) ( not ( = ?auto_178231 ?auto_178236 ) ) ( OBJ-AT ?auto_178234 ?auto_178231 ) ( OBJ-AT ?auto_178235 ?auto_178236 ) ( TRUCK-AT ?auto_178239 ?auto_178237 ) ( IN-CITY ?auto_178237 ?auto_178238 ) ( not ( = ?auto_178231 ?auto_178237 ) ) ( not ( = ?auto_178236 ?auto_178237 ) ) ( OBJ-AT ?auto_178233 ?auto_178237 ) ( OBJ-AT ?auto_178232 ?auto_178231 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178234 ?auto_178235 ?auto_178231 )
      ( DELIVER-4PKG-VERIFY ?auto_178232 ?auto_178233 ?auto_178234 ?auto_178235 ?auto_178231 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178261 - OBJ
      ?auto_178262 - OBJ
      ?auto_178263 - OBJ
      ?auto_178264 - OBJ
      ?auto_178260 - LOCATION
    )
    :vars
    (
      ?auto_178265 - LOCATION
      ?auto_178267 - CITY
      ?auto_178268 - TRUCK
      ?auto_178266 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_178262 ?auto_178261 ) ) ( not ( = ?auto_178263 ?auto_178261 ) ) ( not ( = ?auto_178263 ?auto_178262 ) ) ( not ( = ?auto_178264 ?auto_178261 ) ) ( not ( = ?auto_178264 ?auto_178262 ) ) ( not ( = ?auto_178264 ?auto_178263 ) ) ( IN-CITY ?auto_178265 ?auto_178267 ) ( IN-CITY ?auto_178260 ?auto_178267 ) ( not ( = ?auto_178260 ?auto_178265 ) ) ( OBJ-AT ?auto_178264 ?auto_178260 ) ( OBJ-AT ?auto_178263 ?auto_178265 ) ( TRUCK-AT ?auto_178268 ?auto_178266 ) ( IN-CITY ?auto_178266 ?auto_178267 ) ( not ( = ?auto_178260 ?auto_178266 ) ) ( not ( = ?auto_178265 ?auto_178266 ) ) ( OBJ-AT ?auto_178262 ?auto_178266 ) ( OBJ-AT ?auto_178261 ?auto_178260 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178264 ?auto_178263 ?auto_178260 )
      ( DELIVER-4PKG-VERIFY ?auto_178261 ?auto_178262 ?auto_178263 ?auto_178264 ?auto_178260 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178320 - OBJ
      ?auto_178321 - OBJ
      ?auto_178322 - OBJ
      ?auto_178323 - OBJ
      ?auto_178319 - LOCATION
    )
    :vars
    (
      ?auto_178324 - LOCATION
      ?auto_178326 - CITY
      ?auto_178327 - TRUCK
      ?auto_178325 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_178321 ?auto_178320 ) ) ( not ( = ?auto_178322 ?auto_178320 ) ) ( not ( = ?auto_178322 ?auto_178321 ) ) ( not ( = ?auto_178323 ?auto_178320 ) ) ( not ( = ?auto_178323 ?auto_178321 ) ) ( not ( = ?auto_178323 ?auto_178322 ) ) ( IN-CITY ?auto_178324 ?auto_178326 ) ( IN-CITY ?auto_178319 ?auto_178326 ) ( not ( = ?auto_178319 ?auto_178324 ) ) ( OBJ-AT ?auto_178322 ?auto_178319 ) ( OBJ-AT ?auto_178321 ?auto_178324 ) ( TRUCK-AT ?auto_178327 ?auto_178325 ) ( IN-CITY ?auto_178325 ?auto_178326 ) ( not ( = ?auto_178319 ?auto_178325 ) ) ( not ( = ?auto_178324 ?auto_178325 ) ) ( OBJ-AT ?auto_178323 ?auto_178325 ) ( OBJ-AT ?auto_178320 ?auto_178319 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178322 ?auto_178321 ?auto_178319 )
      ( DELIVER-4PKG-VERIFY ?auto_178320 ?auto_178321 ?auto_178322 ?auto_178323 ?auto_178319 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178381 - OBJ
      ?auto_178382 - OBJ
      ?auto_178383 - OBJ
      ?auto_178384 - OBJ
      ?auto_178380 - LOCATION
    )
    :vars
    (
      ?auto_178385 - LOCATION
      ?auto_178387 - CITY
      ?auto_178388 - TRUCK
      ?auto_178386 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_178382 ?auto_178381 ) ) ( not ( = ?auto_178383 ?auto_178381 ) ) ( not ( = ?auto_178383 ?auto_178382 ) ) ( not ( = ?auto_178384 ?auto_178381 ) ) ( not ( = ?auto_178384 ?auto_178382 ) ) ( not ( = ?auto_178384 ?auto_178383 ) ) ( IN-CITY ?auto_178385 ?auto_178387 ) ( IN-CITY ?auto_178380 ?auto_178387 ) ( not ( = ?auto_178380 ?auto_178385 ) ) ( OBJ-AT ?auto_178384 ?auto_178380 ) ( OBJ-AT ?auto_178382 ?auto_178385 ) ( TRUCK-AT ?auto_178388 ?auto_178386 ) ( IN-CITY ?auto_178386 ?auto_178387 ) ( not ( = ?auto_178380 ?auto_178386 ) ) ( not ( = ?auto_178385 ?auto_178386 ) ) ( OBJ-AT ?auto_178383 ?auto_178386 ) ( OBJ-AT ?auto_178381 ?auto_178380 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178384 ?auto_178382 ?auto_178380 )
      ( DELIVER-4PKG-VERIFY ?auto_178381 ?auto_178382 ?auto_178383 ?auto_178384 ?auto_178380 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178471 - OBJ
      ?auto_178472 - OBJ
      ?auto_178473 - OBJ
      ?auto_178474 - OBJ
      ?auto_178470 - LOCATION
    )
    :vars
    (
      ?auto_178475 - LOCATION
      ?auto_178477 - CITY
      ?auto_178478 - TRUCK
      ?auto_178476 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_178472 ?auto_178471 ) ) ( not ( = ?auto_178473 ?auto_178471 ) ) ( not ( = ?auto_178473 ?auto_178472 ) ) ( not ( = ?auto_178474 ?auto_178471 ) ) ( not ( = ?auto_178474 ?auto_178472 ) ) ( not ( = ?auto_178474 ?auto_178473 ) ) ( IN-CITY ?auto_178475 ?auto_178477 ) ( IN-CITY ?auto_178470 ?auto_178477 ) ( not ( = ?auto_178470 ?auto_178475 ) ) ( OBJ-AT ?auto_178472 ?auto_178470 ) ( OBJ-AT ?auto_178474 ?auto_178475 ) ( TRUCK-AT ?auto_178478 ?auto_178476 ) ( IN-CITY ?auto_178476 ?auto_178477 ) ( not ( = ?auto_178470 ?auto_178476 ) ) ( not ( = ?auto_178475 ?auto_178476 ) ) ( OBJ-AT ?auto_178471 ?auto_178476 ) ( OBJ-AT ?auto_178473 ?auto_178470 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178472 ?auto_178474 ?auto_178470 )
      ( DELIVER-4PKG-VERIFY ?auto_178471 ?auto_178472 ?auto_178473 ?auto_178474 ?auto_178470 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178498 - OBJ
      ?auto_178499 - OBJ
      ?auto_178500 - OBJ
      ?auto_178501 - OBJ
      ?auto_178497 - LOCATION
    )
    :vars
    (
      ?auto_178502 - LOCATION
      ?auto_178504 - CITY
      ?auto_178505 - TRUCK
      ?auto_178503 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_178499 ?auto_178498 ) ) ( not ( = ?auto_178500 ?auto_178498 ) ) ( not ( = ?auto_178500 ?auto_178499 ) ) ( not ( = ?auto_178501 ?auto_178498 ) ) ( not ( = ?auto_178501 ?auto_178499 ) ) ( not ( = ?auto_178501 ?auto_178500 ) ) ( IN-CITY ?auto_178502 ?auto_178504 ) ( IN-CITY ?auto_178497 ?auto_178504 ) ( not ( = ?auto_178497 ?auto_178502 ) ) ( OBJ-AT ?auto_178499 ?auto_178497 ) ( OBJ-AT ?auto_178500 ?auto_178502 ) ( TRUCK-AT ?auto_178505 ?auto_178503 ) ( IN-CITY ?auto_178503 ?auto_178504 ) ( not ( = ?auto_178497 ?auto_178503 ) ) ( not ( = ?auto_178502 ?auto_178503 ) ) ( OBJ-AT ?auto_178498 ?auto_178503 ) ( OBJ-AT ?auto_178501 ?auto_178497 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178499 ?auto_178500 ?auto_178497 )
      ( DELIVER-4PKG-VERIFY ?auto_178498 ?auto_178499 ?auto_178500 ?auto_178501 ?auto_178497 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178525 - OBJ
      ?auto_178526 - OBJ
      ?auto_178527 - OBJ
      ?auto_178528 - OBJ
      ?auto_178524 - LOCATION
    )
    :vars
    (
      ?auto_178529 - LOCATION
      ?auto_178531 - CITY
      ?auto_178532 - TRUCK
      ?auto_178530 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_178526 ?auto_178525 ) ) ( not ( = ?auto_178527 ?auto_178525 ) ) ( not ( = ?auto_178527 ?auto_178526 ) ) ( not ( = ?auto_178528 ?auto_178525 ) ) ( not ( = ?auto_178528 ?auto_178526 ) ) ( not ( = ?auto_178528 ?auto_178527 ) ) ( IN-CITY ?auto_178529 ?auto_178531 ) ( IN-CITY ?auto_178524 ?auto_178531 ) ( not ( = ?auto_178524 ?auto_178529 ) ) ( OBJ-AT ?auto_178527 ?auto_178524 ) ( OBJ-AT ?auto_178528 ?auto_178529 ) ( TRUCK-AT ?auto_178532 ?auto_178530 ) ( IN-CITY ?auto_178530 ?auto_178531 ) ( not ( = ?auto_178524 ?auto_178530 ) ) ( not ( = ?auto_178529 ?auto_178530 ) ) ( OBJ-AT ?auto_178525 ?auto_178530 ) ( OBJ-AT ?auto_178526 ?auto_178524 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178527 ?auto_178528 ?auto_178524 )
      ( DELIVER-4PKG-VERIFY ?auto_178525 ?auto_178526 ?auto_178527 ?auto_178528 ?auto_178524 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178554 - OBJ
      ?auto_178555 - OBJ
      ?auto_178556 - OBJ
      ?auto_178557 - OBJ
      ?auto_178553 - LOCATION
    )
    :vars
    (
      ?auto_178558 - LOCATION
      ?auto_178560 - CITY
      ?auto_178561 - TRUCK
      ?auto_178559 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_178555 ?auto_178554 ) ) ( not ( = ?auto_178556 ?auto_178554 ) ) ( not ( = ?auto_178556 ?auto_178555 ) ) ( not ( = ?auto_178557 ?auto_178554 ) ) ( not ( = ?auto_178557 ?auto_178555 ) ) ( not ( = ?auto_178557 ?auto_178556 ) ) ( IN-CITY ?auto_178558 ?auto_178560 ) ( IN-CITY ?auto_178553 ?auto_178560 ) ( not ( = ?auto_178553 ?auto_178558 ) ) ( OBJ-AT ?auto_178557 ?auto_178553 ) ( OBJ-AT ?auto_178556 ?auto_178558 ) ( TRUCK-AT ?auto_178561 ?auto_178559 ) ( IN-CITY ?auto_178559 ?auto_178560 ) ( not ( = ?auto_178553 ?auto_178559 ) ) ( not ( = ?auto_178558 ?auto_178559 ) ) ( OBJ-AT ?auto_178554 ?auto_178559 ) ( OBJ-AT ?auto_178555 ?auto_178553 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178557 ?auto_178556 ?auto_178553 )
      ( DELIVER-4PKG-VERIFY ?auto_178554 ?auto_178555 ?auto_178556 ?auto_178557 ?auto_178553 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178670 - OBJ
      ?auto_178671 - OBJ
      ?auto_178672 - OBJ
      ?auto_178673 - OBJ
      ?auto_178669 - LOCATION
    )
    :vars
    (
      ?auto_178674 - LOCATION
      ?auto_178676 - CITY
      ?auto_178677 - TRUCK
      ?auto_178675 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_178671 ?auto_178670 ) ) ( not ( = ?auto_178672 ?auto_178670 ) ) ( not ( = ?auto_178672 ?auto_178671 ) ) ( not ( = ?auto_178673 ?auto_178670 ) ) ( not ( = ?auto_178673 ?auto_178671 ) ) ( not ( = ?auto_178673 ?auto_178672 ) ) ( IN-CITY ?auto_178674 ?auto_178676 ) ( IN-CITY ?auto_178669 ?auto_178676 ) ( not ( = ?auto_178669 ?auto_178674 ) ) ( OBJ-AT ?auto_178672 ?auto_178669 ) ( OBJ-AT ?auto_178671 ?auto_178674 ) ( TRUCK-AT ?auto_178677 ?auto_178675 ) ( IN-CITY ?auto_178675 ?auto_178676 ) ( not ( = ?auto_178669 ?auto_178675 ) ) ( not ( = ?auto_178674 ?auto_178675 ) ) ( OBJ-AT ?auto_178670 ?auto_178675 ) ( OBJ-AT ?auto_178673 ?auto_178669 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178672 ?auto_178671 ?auto_178669 )
      ( DELIVER-4PKG-VERIFY ?auto_178670 ?auto_178671 ?auto_178672 ?auto_178673 ?auto_178669 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178697 - OBJ
      ?auto_178698 - OBJ
      ?auto_178699 - OBJ
      ?auto_178700 - OBJ
      ?auto_178696 - LOCATION
    )
    :vars
    (
      ?auto_178701 - LOCATION
      ?auto_178703 - CITY
      ?auto_178704 - TRUCK
      ?auto_178702 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_178698 ?auto_178697 ) ) ( not ( = ?auto_178699 ?auto_178697 ) ) ( not ( = ?auto_178699 ?auto_178698 ) ) ( not ( = ?auto_178700 ?auto_178697 ) ) ( not ( = ?auto_178700 ?auto_178698 ) ) ( not ( = ?auto_178700 ?auto_178699 ) ) ( IN-CITY ?auto_178701 ?auto_178703 ) ( IN-CITY ?auto_178696 ?auto_178703 ) ( not ( = ?auto_178696 ?auto_178701 ) ) ( OBJ-AT ?auto_178700 ?auto_178696 ) ( OBJ-AT ?auto_178698 ?auto_178701 ) ( TRUCK-AT ?auto_178704 ?auto_178702 ) ( IN-CITY ?auto_178702 ?auto_178703 ) ( not ( = ?auto_178696 ?auto_178702 ) ) ( not ( = ?auto_178701 ?auto_178702 ) ) ( OBJ-AT ?auto_178697 ?auto_178702 ) ( OBJ-AT ?auto_178699 ?auto_178696 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178700 ?auto_178698 ?auto_178696 )
      ( DELIVER-4PKG-VERIFY ?auto_178697 ?auto_178698 ?auto_178699 ?auto_178700 ?auto_178696 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178873 - OBJ
      ?auto_178874 - OBJ
      ?auto_178875 - OBJ
      ?auto_178876 - OBJ
      ?auto_178872 - LOCATION
    )
    :vars
    (
      ?auto_178877 - LOCATION
      ?auto_178879 - CITY
      ?auto_178880 - TRUCK
      ?auto_178878 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_178874 ?auto_178873 ) ) ( not ( = ?auto_178875 ?auto_178873 ) ) ( not ( = ?auto_178875 ?auto_178874 ) ) ( not ( = ?auto_178876 ?auto_178873 ) ) ( not ( = ?auto_178876 ?auto_178874 ) ) ( not ( = ?auto_178876 ?auto_178875 ) ) ( IN-CITY ?auto_178877 ?auto_178879 ) ( IN-CITY ?auto_178872 ?auto_178879 ) ( not ( = ?auto_178872 ?auto_178877 ) ) ( OBJ-AT ?auto_178874 ?auto_178872 ) ( OBJ-AT ?auto_178873 ?auto_178877 ) ( TRUCK-AT ?auto_178880 ?auto_178878 ) ( IN-CITY ?auto_178878 ?auto_178879 ) ( not ( = ?auto_178872 ?auto_178878 ) ) ( not ( = ?auto_178877 ?auto_178878 ) ) ( OBJ-AT ?auto_178876 ?auto_178878 ) ( OBJ-AT ?auto_178875 ?auto_178872 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178874 ?auto_178873 ?auto_178872 )
      ( DELIVER-4PKG-VERIFY ?auto_178873 ?auto_178874 ?auto_178875 ?auto_178876 ?auto_178872 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178901 - OBJ
      ?auto_178902 - OBJ
      ?auto_178903 - OBJ
      ?auto_178904 - OBJ
      ?auto_178900 - LOCATION
    )
    :vars
    (
      ?auto_178905 - LOCATION
      ?auto_178907 - CITY
      ?auto_178908 - TRUCK
      ?auto_178906 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_178902 ?auto_178901 ) ) ( not ( = ?auto_178903 ?auto_178901 ) ) ( not ( = ?auto_178903 ?auto_178902 ) ) ( not ( = ?auto_178904 ?auto_178901 ) ) ( not ( = ?auto_178904 ?auto_178902 ) ) ( not ( = ?auto_178904 ?auto_178903 ) ) ( IN-CITY ?auto_178905 ?auto_178907 ) ( IN-CITY ?auto_178900 ?auto_178907 ) ( not ( = ?auto_178900 ?auto_178905 ) ) ( OBJ-AT ?auto_178902 ?auto_178900 ) ( OBJ-AT ?auto_178901 ?auto_178905 ) ( TRUCK-AT ?auto_178908 ?auto_178906 ) ( IN-CITY ?auto_178906 ?auto_178907 ) ( not ( = ?auto_178900 ?auto_178906 ) ) ( not ( = ?auto_178905 ?auto_178906 ) ) ( OBJ-AT ?auto_178903 ?auto_178906 ) ( OBJ-AT ?auto_178904 ?auto_178900 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178902 ?auto_178901 ?auto_178900 )
      ( DELIVER-4PKG-VERIFY ?auto_178901 ?auto_178902 ?auto_178903 ?auto_178904 ?auto_178900 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178987 - OBJ
      ?auto_178988 - OBJ
      ?auto_178989 - OBJ
      ?auto_178990 - OBJ
      ?auto_178986 - LOCATION
    )
    :vars
    (
      ?auto_178991 - LOCATION
      ?auto_178993 - CITY
      ?auto_178994 - TRUCK
      ?auto_178992 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_178988 ?auto_178987 ) ) ( not ( = ?auto_178989 ?auto_178987 ) ) ( not ( = ?auto_178989 ?auto_178988 ) ) ( not ( = ?auto_178990 ?auto_178987 ) ) ( not ( = ?auto_178990 ?auto_178988 ) ) ( not ( = ?auto_178990 ?auto_178989 ) ) ( IN-CITY ?auto_178991 ?auto_178993 ) ( IN-CITY ?auto_178986 ?auto_178993 ) ( not ( = ?auto_178986 ?auto_178991 ) ) ( OBJ-AT ?auto_178989 ?auto_178986 ) ( OBJ-AT ?auto_178987 ?auto_178991 ) ( TRUCK-AT ?auto_178994 ?auto_178992 ) ( IN-CITY ?auto_178992 ?auto_178993 ) ( not ( = ?auto_178986 ?auto_178992 ) ) ( not ( = ?auto_178991 ?auto_178992 ) ) ( OBJ-AT ?auto_178990 ?auto_178992 ) ( OBJ-AT ?auto_178988 ?auto_178986 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178989 ?auto_178987 ?auto_178986 )
      ( DELIVER-4PKG-VERIFY ?auto_178987 ?auto_178988 ?auto_178989 ?auto_178990 ?auto_178986 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179048 - OBJ
      ?auto_179049 - OBJ
      ?auto_179050 - OBJ
      ?auto_179051 - OBJ
      ?auto_179047 - LOCATION
    )
    :vars
    (
      ?auto_179052 - LOCATION
      ?auto_179054 - CITY
      ?auto_179055 - TRUCK
      ?auto_179053 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_179049 ?auto_179048 ) ) ( not ( = ?auto_179050 ?auto_179048 ) ) ( not ( = ?auto_179050 ?auto_179049 ) ) ( not ( = ?auto_179051 ?auto_179048 ) ) ( not ( = ?auto_179051 ?auto_179049 ) ) ( not ( = ?auto_179051 ?auto_179050 ) ) ( IN-CITY ?auto_179052 ?auto_179054 ) ( IN-CITY ?auto_179047 ?auto_179054 ) ( not ( = ?auto_179047 ?auto_179052 ) ) ( OBJ-AT ?auto_179051 ?auto_179047 ) ( OBJ-AT ?auto_179048 ?auto_179052 ) ( TRUCK-AT ?auto_179055 ?auto_179053 ) ( IN-CITY ?auto_179053 ?auto_179054 ) ( not ( = ?auto_179047 ?auto_179053 ) ) ( not ( = ?auto_179052 ?auto_179053 ) ) ( OBJ-AT ?auto_179050 ?auto_179053 ) ( OBJ-AT ?auto_179049 ?auto_179047 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179051 ?auto_179048 ?auto_179047 )
      ( DELIVER-4PKG-VERIFY ?auto_179048 ?auto_179049 ?auto_179050 ?auto_179051 ?auto_179047 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179138 - OBJ
      ?auto_179139 - OBJ
      ?auto_179140 - OBJ
      ?auto_179141 - OBJ
      ?auto_179137 - LOCATION
    )
    :vars
    (
      ?auto_179142 - LOCATION
      ?auto_179144 - CITY
      ?auto_179145 - TRUCK
      ?auto_179143 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_179139 ?auto_179138 ) ) ( not ( = ?auto_179140 ?auto_179138 ) ) ( not ( = ?auto_179140 ?auto_179139 ) ) ( not ( = ?auto_179141 ?auto_179138 ) ) ( not ( = ?auto_179141 ?auto_179139 ) ) ( not ( = ?auto_179141 ?auto_179140 ) ) ( IN-CITY ?auto_179142 ?auto_179144 ) ( IN-CITY ?auto_179137 ?auto_179144 ) ( not ( = ?auto_179137 ?auto_179142 ) ) ( OBJ-AT ?auto_179140 ?auto_179137 ) ( OBJ-AT ?auto_179138 ?auto_179142 ) ( TRUCK-AT ?auto_179145 ?auto_179143 ) ( IN-CITY ?auto_179143 ?auto_179144 ) ( not ( = ?auto_179137 ?auto_179143 ) ) ( not ( = ?auto_179142 ?auto_179143 ) ) ( OBJ-AT ?auto_179139 ?auto_179143 ) ( OBJ-AT ?auto_179141 ?auto_179137 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179140 ?auto_179138 ?auto_179137 )
      ( DELIVER-4PKG-VERIFY ?auto_179138 ?auto_179139 ?auto_179140 ?auto_179141 ?auto_179137 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179165 - OBJ
      ?auto_179166 - OBJ
      ?auto_179167 - OBJ
      ?auto_179168 - OBJ
      ?auto_179164 - LOCATION
    )
    :vars
    (
      ?auto_179169 - LOCATION
      ?auto_179171 - CITY
      ?auto_179172 - TRUCK
      ?auto_179170 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_179166 ?auto_179165 ) ) ( not ( = ?auto_179167 ?auto_179165 ) ) ( not ( = ?auto_179167 ?auto_179166 ) ) ( not ( = ?auto_179168 ?auto_179165 ) ) ( not ( = ?auto_179168 ?auto_179166 ) ) ( not ( = ?auto_179168 ?auto_179167 ) ) ( IN-CITY ?auto_179169 ?auto_179171 ) ( IN-CITY ?auto_179164 ?auto_179171 ) ( not ( = ?auto_179164 ?auto_179169 ) ) ( OBJ-AT ?auto_179168 ?auto_179164 ) ( OBJ-AT ?auto_179165 ?auto_179169 ) ( TRUCK-AT ?auto_179172 ?auto_179170 ) ( IN-CITY ?auto_179170 ?auto_179171 ) ( not ( = ?auto_179164 ?auto_179170 ) ) ( not ( = ?auto_179169 ?auto_179170 ) ) ( OBJ-AT ?auto_179166 ?auto_179170 ) ( OBJ-AT ?auto_179167 ?auto_179164 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179168 ?auto_179165 ?auto_179164 )
      ( DELIVER-4PKG-VERIFY ?auto_179165 ?auto_179166 ?auto_179167 ?auto_179168 ?auto_179164 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_179444 - OBJ
      ?auto_179443 - LOCATION
    )
    :vars
    (
      ?auto_179447 - OBJ
      ?auto_179445 - LOCATION
      ?auto_179448 - CITY
      ?auto_179449 - OBJ
      ?auto_179446 - LOCATION
      ?auto_179450 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179444 ?auto_179447 ) ) ( IN-CITY ?auto_179445 ?auto_179448 ) ( IN-CITY ?auto_179443 ?auto_179448 ) ( not ( = ?auto_179443 ?auto_179445 ) ) ( OBJ-AT ?auto_179447 ?auto_179443 ) ( OBJ-AT ?auto_179444 ?auto_179445 ) ( not ( = ?auto_179449 ?auto_179447 ) ) ( not ( = ?auto_179444 ?auto_179449 ) ) ( IN-CITY ?auto_179446 ?auto_179448 ) ( not ( = ?auto_179443 ?auto_179446 ) ) ( not ( = ?auto_179445 ?auto_179446 ) ) ( OBJ-AT ?auto_179449 ?auto_179446 ) ( TRUCK-AT ?auto_179450 ?auto_179443 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_179450 ?auto_179443 ?auto_179446 ?auto_179448 )
      ( DELIVER-2PKG ?auto_179447 ?auto_179444 ?auto_179443 )
      ( DELIVER-1PKG-VERIFY ?auto_179444 ?auto_179443 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_179452 - OBJ
      ?auto_179453 - OBJ
      ?auto_179451 - LOCATION
    )
    :vars
    (
      ?auto_179456 - LOCATION
      ?auto_179457 - CITY
      ?auto_179454 - OBJ
      ?auto_179455 - LOCATION
      ?auto_179458 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179453 ?auto_179452 ) ) ( IN-CITY ?auto_179456 ?auto_179457 ) ( IN-CITY ?auto_179451 ?auto_179457 ) ( not ( = ?auto_179451 ?auto_179456 ) ) ( OBJ-AT ?auto_179452 ?auto_179451 ) ( OBJ-AT ?auto_179453 ?auto_179456 ) ( not ( = ?auto_179454 ?auto_179452 ) ) ( not ( = ?auto_179453 ?auto_179454 ) ) ( IN-CITY ?auto_179455 ?auto_179457 ) ( not ( = ?auto_179451 ?auto_179455 ) ) ( not ( = ?auto_179456 ?auto_179455 ) ) ( OBJ-AT ?auto_179454 ?auto_179455 ) ( TRUCK-AT ?auto_179458 ?auto_179451 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_179453 ?auto_179451 )
      ( DELIVER-2PKG-VERIFY ?auto_179452 ?auto_179453 ?auto_179451 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_179460 - OBJ
      ?auto_179461 - OBJ
      ?auto_179459 - LOCATION
    )
    :vars
    (
      ?auto_179467 - OBJ
      ?auto_179465 - LOCATION
      ?auto_179464 - CITY
      ?auto_179463 - OBJ
      ?auto_179466 - LOCATION
      ?auto_179462 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179461 ?auto_179460 ) ) ( not ( = ?auto_179461 ?auto_179467 ) ) ( IN-CITY ?auto_179465 ?auto_179464 ) ( IN-CITY ?auto_179459 ?auto_179464 ) ( not ( = ?auto_179459 ?auto_179465 ) ) ( OBJ-AT ?auto_179467 ?auto_179459 ) ( OBJ-AT ?auto_179461 ?auto_179465 ) ( not ( = ?auto_179463 ?auto_179467 ) ) ( not ( = ?auto_179461 ?auto_179463 ) ) ( IN-CITY ?auto_179466 ?auto_179464 ) ( not ( = ?auto_179459 ?auto_179466 ) ) ( not ( = ?auto_179465 ?auto_179466 ) ) ( OBJ-AT ?auto_179463 ?auto_179466 ) ( TRUCK-AT ?auto_179462 ?auto_179459 ) ( OBJ-AT ?auto_179460 ?auto_179459 ) ( not ( = ?auto_179460 ?auto_179467 ) ) ( not ( = ?auto_179460 ?auto_179463 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179467 ?auto_179461 ?auto_179459 )
      ( DELIVER-2PKG-VERIFY ?auto_179460 ?auto_179461 ?auto_179459 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_179469 - OBJ
      ?auto_179470 - OBJ
      ?auto_179468 - LOCATION
    )
    :vars
    (
      ?auto_179475 - OBJ
      ?auto_179473 - LOCATION
      ?auto_179472 - CITY
      ?auto_179474 - LOCATION
      ?auto_179471 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179470 ?auto_179469 ) ) ( not ( = ?auto_179470 ?auto_179475 ) ) ( IN-CITY ?auto_179473 ?auto_179472 ) ( IN-CITY ?auto_179468 ?auto_179472 ) ( not ( = ?auto_179468 ?auto_179473 ) ) ( OBJ-AT ?auto_179475 ?auto_179468 ) ( OBJ-AT ?auto_179470 ?auto_179473 ) ( not ( = ?auto_179469 ?auto_179475 ) ) ( IN-CITY ?auto_179474 ?auto_179472 ) ( not ( = ?auto_179468 ?auto_179474 ) ) ( not ( = ?auto_179473 ?auto_179474 ) ) ( OBJ-AT ?auto_179469 ?auto_179474 ) ( TRUCK-AT ?auto_179471 ?auto_179468 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179475 ?auto_179470 ?auto_179468 )
      ( DELIVER-2PKG-VERIFY ?auto_179469 ?auto_179470 ?auto_179468 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_179477 - OBJ
      ?auto_179478 - OBJ
      ?auto_179476 - LOCATION
    )
    :vars
    (
      ?auto_179482 - LOCATION
      ?auto_179481 - CITY
      ?auto_179480 - OBJ
      ?auto_179483 - LOCATION
      ?auto_179479 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179478 ?auto_179477 ) ) ( IN-CITY ?auto_179482 ?auto_179481 ) ( IN-CITY ?auto_179476 ?auto_179481 ) ( not ( = ?auto_179476 ?auto_179482 ) ) ( OBJ-AT ?auto_179478 ?auto_179476 ) ( OBJ-AT ?auto_179477 ?auto_179482 ) ( not ( = ?auto_179480 ?auto_179478 ) ) ( not ( = ?auto_179477 ?auto_179480 ) ) ( IN-CITY ?auto_179483 ?auto_179481 ) ( not ( = ?auto_179476 ?auto_179483 ) ) ( not ( = ?auto_179482 ?auto_179483 ) ) ( OBJ-AT ?auto_179480 ?auto_179483 ) ( TRUCK-AT ?auto_179479 ?auto_179476 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179478 ?auto_179477 ?auto_179476 )
      ( DELIVER-2PKG-VERIFY ?auto_179477 ?auto_179478 ?auto_179476 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_179485 - OBJ
      ?auto_179486 - OBJ
      ?auto_179484 - LOCATION
    )
    :vars
    (
      ?auto_179492 - OBJ
      ?auto_179490 - LOCATION
      ?auto_179489 - CITY
      ?auto_179488 - OBJ
      ?auto_179491 - LOCATION
      ?auto_179487 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179486 ?auto_179485 ) ) ( not ( = ?auto_179485 ?auto_179492 ) ) ( IN-CITY ?auto_179490 ?auto_179489 ) ( IN-CITY ?auto_179484 ?auto_179489 ) ( not ( = ?auto_179484 ?auto_179490 ) ) ( OBJ-AT ?auto_179492 ?auto_179484 ) ( OBJ-AT ?auto_179485 ?auto_179490 ) ( not ( = ?auto_179488 ?auto_179492 ) ) ( not ( = ?auto_179485 ?auto_179488 ) ) ( IN-CITY ?auto_179491 ?auto_179489 ) ( not ( = ?auto_179484 ?auto_179491 ) ) ( not ( = ?auto_179490 ?auto_179491 ) ) ( OBJ-AT ?auto_179488 ?auto_179491 ) ( TRUCK-AT ?auto_179487 ?auto_179484 ) ( OBJ-AT ?auto_179486 ?auto_179484 ) ( not ( = ?auto_179486 ?auto_179492 ) ) ( not ( = ?auto_179486 ?auto_179488 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179492 ?auto_179485 ?auto_179484 )
      ( DELIVER-2PKG-VERIFY ?auto_179485 ?auto_179486 ?auto_179484 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_179494 - OBJ
      ?auto_179495 - OBJ
      ?auto_179493 - LOCATION
    )
    :vars
    (
      ?auto_179500 - OBJ
      ?auto_179498 - LOCATION
      ?auto_179497 - CITY
      ?auto_179499 - LOCATION
      ?auto_179496 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179495 ?auto_179494 ) ) ( not ( = ?auto_179494 ?auto_179500 ) ) ( IN-CITY ?auto_179498 ?auto_179497 ) ( IN-CITY ?auto_179493 ?auto_179497 ) ( not ( = ?auto_179493 ?auto_179498 ) ) ( OBJ-AT ?auto_179500 ?auto_179493 ) ( OBJ-AT ?auto_179494 ?auto_179498 ) ( not ( = ?auto_179495 ?auto_179500 ) ) ( IN-CITY ?auto_179499 ?auto_179497 ) ( not ( = ?auto_179493 ?auto_179499 ) ) ( not ( = ?auto_179498 ?auto_179499 ) ) ( OBJ-AT ?auto_179495 ?auto_179499 ) ( TRUCK-AT ?auto_179496 ?auto_179493 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179500 ?auto_179494 ?auto_179493 )
      ( DELIVER-2PKG-VERIFY ?auto_179494 ?auto_179495 ?auto_179493 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179520 - OBJ
      ?auto_179521 - OBJ
      ?auto_179522 - OBJ
      ?auto_179519 - LOCATION
    )
    :vars
    (
      ?auto_179526 - LOCATION
      ?auto_179525 - CITY
      ?auto_179524 - OBJ
      ?auto_179527 - LOCATION
      ?auto_179523 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179521 ?auto_179520 ) ) ( not ( = ?auto_179522 ?auto_179520 ) ) ( not ( = ?auto_179522 ?auto_179521 ) ) ( IN-CITY ?auto_179526 ?auto_179525 ) ( IN-CITY ?auto_179519 ?auto_179525 ) ( not ( = ?auto_179519 ?auto_179526 ) ) ( OBJ-AT ?auto_179520 ?auto_179519 ) ( OBJ-AT ?auto_179522 ?auto_179526 ) ( not ( = ?auto_179524 ?auto_179520 ) ) ( not ( = ?auto_179522 ?auto_179524 ) ) ( IN-CITY ?auto_179527 ?auto_179525 ) ( not ( = ?auto_179519 ?auto_179527 ) ) ( not ( = ?auto_179526 ?auto_179527 ) ) ( OBJ-AT ?auto_179524 ?auto_179527 ) ( TRUCK-AT ?auto_179523 ?auto_179519 ) ( OBJ-AT ?auto_179521 ?auto_179519 ) ( not ( = ?auto_179521 ?auto_179524 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179520 ?auto_179522 ?auto_179519 )
      ( DELIVER-3PKG-VERIFY ?auto_179520 ?auto_179521 ?auto_179522 ?auto_179519 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179529 - OBJ
      ?auto_179530 - OBJ
      ?auto_179531 - OBJ
      ?auto_179528 - LOCATION
    )
    :vars
    (
      ?auto_179534 - LOCATION
      ?auto_179533 - CITY
      ?auto_179535 - LOCATION
      ?auto_179532 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179530 ?auto_179529 ) ) ( not ( = ?auto_179531 ?auto_179529 ) ) ( not ( = ?auto_179531 ?auto_179530 ) ) ( IN-CITY ?auto_179534 ?auto_179533 ) ( IN-CITY ?auto_179528 ?auto_179533 ) ( not ( = ?auto_179528 ?auto_179534 ) ) ( OBJ-AT ?auto_179529 ?auto_179528 ) ( OBJ-AT ?auto_179531 ?auto_179534 ) ( IN-CITY ?auto_179535 ?auto_179533 ) ( not ( = ?auto_179528 ?auto_179535 ) ) ( not ( = ?auto_179534 ?auto_179535 ) ) ( OBJ-AT ?auto_179530 ?auto_179535 ) ( TRUCK-AT ?auto_179532 ?auto_179528 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179529 ?auto_179531 ?auto_179528 )
      ( DELIVER-3PKG-VERIFY ?auto_179529 ?auto_179530 ?auto_179531 ?auto_179528 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179546 - OBJ
      ?auto_179547 - OBJ
      ?auto_179548 - OBJ
      ?auto_179545 - LOCATION
    )
    :vars
    (
      ?auto_179552 - LOCATION
      ?auto_179551 - CITY
      ?auto_179550 - OBJ
      ?auto_179553 - LOCATION
      ?auto_179549 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179547 ?auto_179546 ) ) ( not ( = ?auto_179548 ?auto_179546 ) ) ( not ( = ?auto_179548 ?auto_179547 ) ) ( IN-CITY ?auto_179552 ?auto_179551 ) ( IN-CITY ?auto_179545 ?auto_179551 ) ( not ( = ?auto_179545 ?auto_179552 ) ) ( OBJ-AT ?auto_179546 ?auto_179545 ) ( OBJ-AT ?auto_179547 ?auto_179552 ) ( not ( = ?auto_179550 ?auto_179546 ) ) ( not ( = ?auto_179547 ?auto_179550 ) ) ( IN-CITY ?auto_179553 ?auto_179551 ) ( not ( = ?auto_179545 ?auto_179553 ) ) ( not ( = ?auto_179552 ?auto_179553 ) ) ( OBJ-AT ?auto_179550 ?auto_179553 ) ( TRUCK-AT ?auto_179549 ?auto_179545 ) ( OBJ-AT ?auto_179548 ?auto_179545 ) ( not ( = ?auto_179548 ?auto_179550 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179546 ?auto_179547 ?auto_179545 )
      ( DELIVER-3PKG-VERIFY ?auto_179546 ?auto_179547 ?auto_179548 ?auto_179545 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179555 - OBJ
      ?auto_179556 - OBJ
      ?auto_179557 - OBJ
      ?auto_179554 - LOCATION
    )
    :vars
    (
      ?auto_179560 - LOCATION
      ?auto_179559 - CITY
      ?auto_179561 - LOCATION
      ?auto_179558 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179556 ?auto_179555 ) ) ( not ( = ?auto_179557 ?auto_179555 ) ) ( not ( = ?auto_179557 ?auto_179556 ) ) ( IN-CITY ?auto_179560 ?auto_179559 ) ( IN-CITY ?auto_179554 ?auto_179559 ) ( not ( = ?auto_179554 ?auto_179560 ) ) ( OBJ-AT ?auto_179555 ?auto_179554 ) ( OBJ-AT ?auto_179556 ?auto_179560 ) ( IN-CITY ?auto_179561 ?auto_179559 ) ( not ( = ?auto_179554 ?auto_179561 ) ) ( not ( = ?auto_179560 ?auto_179561 ) ) ( OBJ-AT ?auto_179557 ?auto_179561 ) ( TRUCK-AT ?auto_179558 ?auto_179554 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179555 ?auto_179556 ?auto_179554 )
      ( DELIVER-3PKG-VERIFY ?auto_179555 ?auto_179556 ?auto_179557 ?auto_179554 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179572 - OBJ
      ?auto_179573 - OBJ
      ?auto_179574 - OBJ
      ?auto_179571 - LOCATION
    )
    :vars
    (
      ?auto_179578 - LOCATION
      ?auto_179577 - CITY
      ?auto_179576 - OBJ
      ?auto_179579 - LOCATION
      ?auto_179575 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179573 ?auto_179572 ) ) ( not ( = ?auto_179574 ?auto_179572 ) ) ( not ( = ?auto_179574 ?auto_179573 ) ) ( IN-CITY ?auto_179578 ?auto_179577 ) ( IN-CITY ?auto_179571 ?auto_179577 ) ( not ( = ?auto_179571 ?auto_179578 ) ) ( OBJ-AT ?auto_179573 ?auto_179571 ) ( OBJ-AT ?auto_179574 ?auto_179578 ) ( not ( = ?auto_179576 ?auto_179573 ) ) ( not ( = ?auto_179574 ?auto_179576 ) ) ( IN-CITY ?auto_179579 ?auto_179577 ) ( not ( = ?auto_179571 ?auto_179579 ) ) ( not ( = ?auto_179578 ?auto_179579 ) ) ( OBJ-AT ?auto_179576 ?auto_179579 ) ( TRUCK-AT ?auto_179575 ?auto_179571 ) ( OBJ-AT ?auto_179572 ?auto_179571 ) ( not ( = ?auto_179572 ?auto_179576 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179573 ?auto_179574 ?auto_179571 )
      ( DELIVER-3PKG-VERIFY ?auto_179572 ?auto_179573 ?auto_179574 ?auto_179571 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179591 - OBJ
      ?auto_179592 - OBJ
      ?auto_179593 - OBJ
      ?auto_179590 - LOCATION
    )
    :vars
    (
      ?auto_179598 - OBJ
      ?auto_179596 - LOCATION
      ?auto_179595 - CITY
      ?auto_179597 - LOCATION
      ?auto_179594 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179592 ?auto_179591 ) ) ( not ( = ?auto_179593 ?auto_179591 ) ) ( not ( = ?auto_179593 ?auto_179592 ) ) ( not ( = ?auto_179593 ?auto_179598 ) ) ( IN-CITY ?auto_179596 ?auto_179595 ) ( IN-CITY ?auto_179590 ?auto_179595 ) ( not ( = ?auto_179590 ?auto_179596 ) ) ( OBJ-AT ?auto_179598 ?auto_179590 ) ( OBJ-AT ?auto_179593 ?auto_179596 ) ( not ( = ?auto_179592 ?auto_179598 ) ) ( IN-CITY ?auto_179597 ?auto_179595 ) ( not ( = ?auto_179590 ?auto_179597 ) ) ( not ( = ?auto_179596 ?auto_179597 ) ) ( OBJ-AT ?auto_179592 ?auto_179597 ) ( TRUCK-AT ?auto_179594 ?auto_179590 ) ( OBJ-AT ?auto_179591 ?auto_179590 ) ( not ( = ?auto_179591 ?auto_179598 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179598 ?auto_179593 ?auto_179590 )
      ( DELIVER-3PKG-VERIFY ?auto_179591 ?auto_179592 ?auto_179593 ?auto_179590 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179600 - OBJ
      ?auto_179601 - OBJ
      ?auto_179602 - OBJ
      ?auto_179599 - LOCATION
    )
    :vars
    (
      ?auto_179606 - LOCATION
      ?auto_179605 - CITY
      ?auto_179604 - OBJ
      ?auto_179607 - LOCATION
      ?auto_179603 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179601 ?auto_179600 ) ) ( not ( = ?auto_179602 ?auto_179600 ) ) ( not ( = ?auto_179602 ?auto_179601 ) ) ( IN-CITY ?auto_179606 ?auto_179605 ) ( IN-CITY ?auto_179599 ?auto_179605 ) ( not ( = ?auto_179599 ?auto_179606 ) ) ( OBJ-AT ?auto_179602 ?auto_179599 ) ( OBJ-AT ?auto_179601 ?auto_179606 ) ( not ( = ?auto_179604 ?auto_179602 ) ) ( not ( = ?auto_179601 ?auto_179604 ) ) ( IN-CITY ?auto_179607 ?auto_179605 ) ( not ( = ?auto_179599 ?auto_179607 ) ) ( not ( = ?auto_179606 ?auto_179607 ) ) ( OBJ-AT ?auto_179604 ?auto_179607 ) ( TRUCK-AT ?auto_179603 ?auto_179599 ) ( OBJ-AT ?auto_179600 ?auto_179599 ) ( not ( = ?auto_179600 ?auto_179604 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179602 ?auto_179601 ?auto_179599 )
      ( DELIVER-3PKG-VERIFY ?auto_179600 ?auto_179601 ?auto_179602 ?auto_179599 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179619 - OBJ
      ?auto_179620 - OBJ
      ?auto_179621 - OBJ
      ?auto_179618 - LOCATION
    )
    :vars
    (
      ?auto_179626 - OBJ
      ?auto_179624 - LOCATION
      ?auto_179623 - CITY
      ?auto_179625 - LOCATION
      ?auto_179622 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179620 ?auto_179619 ) ) ( not ( = ?auto_179621 ?auto_179619 ) ) ( not ( = ?auto_179621 ?auto_179620 ) ) ( not ( = ?auto_179620 ?auto_179626 ) ) ( IN-CITY ?auto_179624 ?auto_179623 ) ( IN-CITY ?auto_179618 ?auto_179623 ) ( not ( = ?auto_179618 ?auto_179624 ) ) ( OBJ-AT ?auto_179626 ?auto_179618 ) ( OBJ-AT ?auto_179620 ?auto_179624 ) ( not ( = ?auto_179621 ?auto_179626 ) ) ( IN-CITY ?auto_179625 ?auto_179623 ) ( not ( = ?auto_179618 ?auto_179625 ) ) ( not ( = ?auto_179624 ?auto_179625 ) ) ( OBJ-AT ?auto_179621 ?auto_179625 ) ( TRUCK-AT ?auto_179622 ?auto_179618 ) ( OBJ-AT ?auto_179619 ?auto_179618 ) ( not ( = ?auto_179619 ?auto_179626 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179626 ?auto_179620 ?auto_179618 )
      ( DELIVER-3PKG-VERIFY ?auto_179619 ?auto_179620 ?auto_179621 ?auto_179618 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179638 - OBJ
      ?auto_179639 - OBJ
      ?auto_179640 - OBJ
      ?auto_179637 - LOCATION
    )
    :vars
    (
      ?auto_179643 - LOCATION
      ?auto_179642 - CITY
      ?auto_179644 - LOCATION
      ?auto_179641 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179639 ?auto_179638 ) ) ( not ( = ?auto_179640 ?auto_179638 ) ) ( not ( = ?auto_179640 ?auto_179639 ) ) ( IN-CITY ?auto_179643 ?auto_179642 ) ( IN-CITY ?auto_179637 ?auto_179642 ) ( not ( = ?auto_179637 ?auto_179643 ) ) ( OBJ-AT ?auto_179639 ?auto_179637 ) ( OBJ-AT ?auto_179640 ?auto_179643 ) ( IN-CITY ?auto_179644 ?auto_179642 ) ( not ( = ?auto_179637 ?auto_179644 ) ) ( not ( = ?auto_179643 ?auto_179644 ) ) ( OBJ-AT ?auto_179638 ?auto_179644 ) ( TRUCK-AT ?auto_179641 ?auto_179637 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179639 ?auto_179640 ?auto_179637 )
      ( DELIVER-3PKG-VERIFY ?auto_179638 ?auto_179639 ?auto_179640 ?auto_179637 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179646 - OBJ
      ?auto_179647 - OBJ
      ?auto_179648 - OBJ
      ?auto_179645 - LOCATION
    )
    :vars
    (
      ?auto_179653 - OBJ
      ?auto_179651 - LOCATION
      ?auto_179650 - CITY
      ?auto_179652 - LOCATION
      ?auto_179649 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179647 ?auto_179646 ) ) ( not ( = ?auto_179648 ?auto_179646 ) ) ( not ( = ?auto_179648 ?auto_179647 ) ) ( not ( = ?auto_179648 ?auto_179653 ) ) ( IN-CITY ?auto_179651 ?auto_179650 ) ( IN-CITY ?auto_179645 ?auto_179650 ) ( not ( = ?auto_179645 ?auto_179651 ) ) ( OBJ-AT ?auto_179653 ?auto_179645 ) ( OBJ-AT ?auto_179648 ?auto_179651 ) ( not ( = ?auto_179646 ?auto_179653 ) ) ( IN-CITY ?auto_179652 ?auto_179650 ) ( not ( = ?auto_179645 ?auto_179652 ) ) ( not ( = ?auto_179651 ?auto_179652 ) ) ( OBJ-AT ?auto_179646 ?auto_179652 ) ( TRUCK-AT ?auto_179649 ?auto_179645 ) ( OBJ-AT ?auto_179647 ?auto_179645 ) ( not ( = ?auto_179647 ?auto_179653 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179653 ?auto_179648 ?auto_179645 )
      ( DELIVER-3PKG-VERIFY ?auto_179646 ?auto_179647 ?auto_179648 ?auto_179645 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179664 - OBJ
      ?auto_179665 - OBJ
      ?auto_179666 - OBJ
      ?auto_179663 - LOCATION
    )
    :vars
    (
      ?auto_179669 - LOCATION
      ?auto_179668 - CITY
      ?auto_179670 - LOCATION
      ?auto_179667 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179665 ?auto_179664 ) ) ( not ( = ?auto_179666 ?auto_179664 ) ) ( not ( = ?auto_179666 ?auto_179665 ) ) ( IN-CITY ?auto_179669 ?auto_179668 ) ( IN-CITY ?auto_179663 ?auto_179668 ) ( not ( = ?auto_179663 ?auto_179669 ) ) ( OBJ-AT ?auto_179666 ?auto_179663 ) ( OBJ-AT ?auto_179665 ?auto_179669 ) ( IN-CITY ?auto_179670 ?auto_179668 ) ( not ( = ?auto_179663 ?auto_179670 ) ) ( not ( = ?auto_179669 ?auto_179670 ) ) ( OBJ-AT ?auto_179664 ?auto_179670 ) ( TRUCK-AT ?auto_179667 ?auto_179663 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179666 ?auto_179665 ?auto_179663 )
      ( DELIVER-3PKG-VERIFY ?auto_179664 ?auto_179665 ?auto_179666 ?auto_179663 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179672 - OBJ
      ?auto_179673 - OBJ
      ?auto_179674 - OBJ
      ?auto_179671 - LOCATION
    )
    :vars
    (
      ?auto_179679 - OBJ
      ?auto_179677 - LOCATION
      ?auto_179676 - CITY
      ?auto_179678 - LOCATION
      ?auto_179675 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179673 ?auto_179672 ) ) ( not ( = ?auto_179674 ?auto_179672 ) ) ( not ( = ?auto_179674 ?auto_179673 ) ) ( not ( = ?auto_179673 ?auto_179679 ) ) ( IN-CITY ?auto_179677 ?auto_179676 ) ( IN-CITY ?auto_179671 ?auto_179676 ) ( not ( = ?auto_179671 ?auto_179677 ) ) ( OBJ-AT ?auto_179679 ?auto_179671 ) ( OBJ-AT ?auto_179673 ?auto_179677 ) ( not ( = ?auto_179672 ?auto_179679 ) ) ( IN-CITY ?auto_179678 ?auto_179676 ) ( not ( = ?auto_179671 ?auto_179678 ) ) ( not ( = ?auto_179677 ?auto_179678 ) ) ( OBJ-AT ?auto_179672 ?auto_179678 ) ( TRUCK-AT ?auto_179675 ?auto_179671 ) ( OBJ-AT ?auto_179674 ?auto_179671 ) ( not ( = ?auto_179674 ?auto_179679 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179679 ?auto_179673 ?auto_179671 )
      ( DELIVER-3PKG-VERIFY ?auto_179672 ?auto_179673 ?auto_179674 ?auto_179671 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179708 - OBJ
      ?auto_179709 - OBJ
      ?auto_179710 - OBJ
      ?auto_179707 - LOCATION
    )
    :vars
    (
      ?auto_179714 - LOCATION
      ?auto_179713 - CITY
      ?auto_179712 - OBJ
      ?auto_179715 - LOCATION
      ?auto_179711 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179709 ?auto_179708 ) ) ( not ( = ?auto_179710 ?auto_179708 ) ) ( not ( = ?auto_179710 ?auto_179709 ) ) ( IN-CITY ?auto_179714 ?auto_179713 ) ( IN-CITY ?auto_179707 ?auto_179713 ) ( not ( = ?auto_179707 ?auto_179714 ) ) ( OBJ-AT ?auto_179709 ?auto_179707 ) ( OBJ-AT ?auto_179708 ?auto_179714 ) ( not ( = ?auto_179712 ?auto_179709 ) ) ( not ( = ?auto_179708 ?auto_179712 ) ) ( IN-CITY ?auto_179715 ?auto_179713 ) ( not ( = ?auto_179707 ?auto_179715 ) ) ( not ( = ?auto_179714 ?auto_179715 ) ) ( OBJ-AT ?auto_179712 ?auto_179715 ) ( TRUCK-AT ?auto_179711 ?auto_179707 ) ( OBJ-AT ?auto_179710 ?auto_179707 ) ( not ( = ?auto_179710 ?auto_179712 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179709 ?auto_179708 ?auto_179707 )
      ( DELIVER-3PKG-VERIFY ?auto_179708 ?auto_179709 ?auto_179710 ?auto_179707 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179717 - OBJ
      ?auto_179718 - OBJ
      ?auto_179719 - OBJ
      ?auto_179716 - LOCATION
    )
    :vars
    (
      ?auto_179722 - LOCATION
      ?auto_179721 - CITY
      ?auto_179723 - LOCATION
      ?auto_179720 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179718 ?auto_179717 ) ) ( not ( = ?auto_179719 ?auto_179717 ) ) ( not ( = ?auto_179719 ?auto_179718 ) ) ( IN-CITY ?auto_179722 ?auto_179721 ) ( IN-CITY ?auto_179716 ?auto_179721 ) ( not ( = ?auto_179716 ?auto_179722 ) ) ( OBJ-AT ?auto_179718 ?auto_179716 ) ( OBJ-AT ?auto_179717 ?auto_179722 ) ( IN-CITY ?auto_179723 ?auto_179721 ) ( not ( = ?auto_179716 ?auto_179723 ) ) ( not ( = ?auto_179722 ?auto_179723 ) ) ( OBJ-AT ?auto_179719 ?auto_179723 ) ( TRUCK-AT ?auto_179720 ?auto_179716 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179718 ?auto_179717 ?auto_179716 )
      ( DELIVER-3PKG-VERIFY ?auto_179717 ?auto_179718 ?auto_179719 ?auto_179716 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179734 - OBJ
      ?auto_179735 - OBJ
      ?auto_179736 - OBJ
      ?auto_179733 - LOCATION
    )
    :vars
    (
      ?auto_179740 - LOCATION
      ?auto_179739 - CITY
      ?auto_179738 - OBJ
      ?auto_179741 - LOCATION
      ?auto_179737 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179735 ?auto_179734 ) ) ( not ( = ?auto_179736 ?auto_179734 ) ) ( not ( = ?auto_179736 ?auto_179735 ) ) ( IN-CITY ?auto_179740 ?auto_179739 ) ( IN-CITY ?auto_179733 ?auto_179739 ) ( not ( = ?auto_179733 ?auto_179740 ) ) ( OBJ-AT ?auto_179736 ?auto_179733 ) ( OBJ-AT ?auto_179734 ?auto_179740 ) ( not ( = ?auto_179738 ?auto_179736 ) ) ( not ( = ?auto_179734 ?auto_179738 ) ) ( IN-CITY ?auto_179741 ?auto_179739 ) ( not ( = ?auto_179733 ?auto_179741 ) ) ( not ( = ?auto_179740 ?auto_179741 ) ) ( OBJ-AT ?auto_179738 ?auto_179741 ) ( TRUCK-AT ?auto_179737 ?auto_179733 ) ( OBJ-AT ?auto_179735 ?auto_179733 ) ( not ( = ?auto_179735 ?auto_179738 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179736 ?auto_179734 ?auto_179733 )
      ( DELIVER-3PKG-VERIFY ?auto_179734 ?auto_179735 ?auto_179736 ?auto_179733 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179753 - OBJ
      ?auto_179754 - OBJ
      ?auto_179755 - OBJ
      ?auto_179752 - LOCATION
    )
    :vars
    (
      ?auto_179760 - OBJ
      ?auto_179758 - LOCATION
      ?auto_179757 - CITY
      ?auto_179759 - LOCATION
      ?auto_179756 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179754 ?auto_179753 ) ) ( not ( = ?auto_179755 ?auto_179753 ) ) ( not ( = ?auto_179755 ?auto_179754 ) ) ( not ( = ?auto_179753 ?auto_179760 ) ) ( IN-CITY ?auto_179758 ?auto_179757 ) ( IN-CITY ?auto_179752 ?auto_179757 ) ( not ( = ?auto_179752 ?auto_179758 ) ) ( OBJ-AT ?auto_179760 ?auto_179752 ) ( OBJ-AT ?auto_179753 ?auto_179758 ) ( not ( = ?auto_179755 ?auto_179760 ) ) ( IN-CITY ?auto_179759 ?auto_179757 ) ( not ( = ?auto_179752 ?auto_179759 ) ) ( not ( = ?auto_179758 ?auto_179759 ) ) ( OBJ-AT ?auto_179755 ?auto_179759 ) ( TRUCK-AT ?auto_179756 ?auto_179752 ) ( OBJ-AT ?auto_179754 ?auto_179752 ) ( not ( = ?auto_179754 ?auto_179760 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179760 ?auto_179753 ?auto_179752 )
      ( DELIVER-3PKG-VERIFY ?auto_179753 ?auto_179754 ?auto_179755 ?auto_179752 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179772 - OBJ
      ?auto_179773 - OBJ
      ?auto_179774 - OBJ
      ?auto_179771 - LOCATION
    )
    :vars
    (
      ?auto_179777 - LOCATION
      ?auto_179776 - CITY
      ?auto_179778 - LOCATION
      ?auto_179775 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179773 ?auto_179772 ) ) ( not ( = ?auto_179774 ?auto_179772 ) ) ( not ( = ?auto_179774 ?auto_179773 ) ) ( IN-CITY ?auto_179777 ?auto_179776 ) ( IN-CITY ?auto_179771 ?auto_179776 ) ( not ( = ?auto_179771 ?auto_179777 ) ) ( OBJ-AT ?auto_179774 ?auto_179771 ) ( OBJ-AT ?auto_179772 ?auto_179777 ) ( IN-CITY ?auto_179778 ?auto_179776 ) ( not ( = ?auto_179771 ?auto_179778 ) ) ( not ( = ?auto_179777 ?auto_179778 ) ) ( OBJ-AT ?auto_179773 ?auto_179778 ) ( TRUCK-AT ?auto_179775 ?auto_179771 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179774 ?auto_179772 ?auto_179771 )
      ( DELIVER-3PKG-VERIFY ?auto_179772 ?auto_179773 ?auto_179774 ?auto_179771 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179780 - OBJ
      ?auto_179781 - OBJ
      ?auto_179782 - OBJ
      ?auto_179779 - LOCATION
    )
    :vars
    (
      ?auto_179787 - OBJ
      ?auto_179785 - LOCATION
      ?auto_179784 - CITY
      ?auto_179786 - LOCATION
      ?auto_179783 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179781 ?auto_179780 ) ) ( not ( = ?auto_179782 ?auto_179780 ) ) ( not ( = ?auto_179782 ?auto_179781 ) ) ( not ( = ?auto_179780 ?auto_179787 ) ) ( IN-CITY ?auto_179785 ?auto_179784 ) ( IN-CITY ?auto_179779 ?auto_179784 ) ( not ( = ?auto_179779 ?auto_179785 ) ) ( OBJ-AT ?auto_179787 ?auto_179779 ) ( OBJ-AT ?auto_179780 ?auto_179785 ) ( not ( = ?auto_179781 ?auto_179787 ) ) ( IN-CITY ?auto_179786 ?auto_179784 ) ( not ( = ?auto_179779 ?auto_179786 ) ) ( not ( = ?auto_179785 ?auto_179786 ) ) ( OBJ-AT ?auto_179781 ?auto_179786 ) ( TRUCK-AT ?auto_179783 ?auto_179779 ) ( OBJ-AT ?auto_179782 ?auto_179779 ) ( not ( = ?auto_179782 ?auto_179787 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179787 ?auto_179780 ?auto_179779 )
      ( DELIVER-3PKG-VERIFY ?auto_179780 ?auto_179781 ?auto_179782 ?auto_179779 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179933 - OBJ
      ?auto_179934 - OBJ
      ?auto_179935 - OBJ
      ?auto_179936 - OBJ
      ?auto_179932 - LOCATION
    )
    :vars
    (
      ?auto_179939 - LOCATION
      ?auto_179938 - CITY
      ?auto_179940 - LOCATION
      ?auto_179937 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179934 ?auto_179933 ) ) ( not ( = ?auto_179935 ?auto_179933 ) ) ( not ( = ?auto_179935 ?auto_179934 ) ) ( not ( = ?auto_179936 ?auto_179933 ) ) ( not ( = ?auto_179936 ?auto_179934 ) ) ( not ( = ?auto_179936 ?auto_179935 ) ) ( IN-CITY ?auto_179939 ?auto_179938 ) ( IN-CITY ?auto_179932 ?auto_179938 ) ( not ( = ?auto_179932 ?auto_179939 ) ) ( OBJ-AT ?auto_179933 ?auto_179932 ) ( OBJ-AT ?auto_179936 ?auto_179939 ) ( IN-CITY ?auto_179940 ?auto_179938 ) ( not ( = ?auto_179932 ?auto_179940 ) ) ( not ( = ?auto_179939 ?auto_179940 ) ) ( OBJ-AT ?auto_179935 ?auto_179940 ) ( TRUCK-AT ?auto_179937 ?auto_179932 ) ( OBJ-AT ?auto_179934 ?auto_179932 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179933 ?auto_179936 ?auto_179932 )
      ( DELIVER-4PKG-VERIFY ?auto_179933 ?auto_179934 ?auto_179935 ?auto_179936 ?auto_179932 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179962 - OBJ
      ?auto_179963 - OBJ
      ?auto_179964 - OBJ
      ?auto_179965 - OBJ
      ?auto_179961 - LOCATION
    )
    :vars
    (
      ?auto_179968 - LOCATION
      ?auto_179967 - CITY
      ?auto_179969 - LOCATION
      ?auto_179966 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179963 ?auto_179962 ) ) ( not ( = ?auto_179964 ?auto_179962 ) ) ( not ( = ?auto_179964 ?auto_179963 ) ) ( not ( = ?auto_179965 ?auto_179962 ) ) ( not ( = ?auto_179965 ?auto_179963 ) ) ( not ( = ?auto_179965 ?auto_179964 ) ) ( IN-CITY ?auto_179968 ?auto_179967 ) ( IN-CITY ?auto_179961 ?auto_179967 ) ( not ( = ?auto_179961 ?auto_179968 ) ) ( OBJ-AT ?auto_179962 ?auto_179961 ) ( OBJ-AT ?auto_179964 ?auto_179968 ) ( IN-CITY ?auto_179969 ?auto_179967 ) ( not ( = ?auto_179961 ?auto_179969 ) ) ( not ( = ?auto_179968 ?auto_179969 ) ) ( OBJ-AT ?auto_179965 ?auto_179969 ) ( TRUCK-AT ?auto_179966 ?auto_179961 ) ( OBJ-AT ?auto_179963 ?auto_179961 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179962 ?auto_179964 ?auto_179961 )
      ( DELIVER-4PKG-VERIFY ?auto_179962 ?auto_179963 ?auto_179964 ?auto_179965 ?auto_179961 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179990 - OBJ
      ?auto_179991 - OBJ
      ?auto_179992 - OBJ
      ?auto_179993 - OBJ
      ?auto_179989 - LOCATION
    )
    :vars
    (
      ?auto_179996 - LOCATION
      ?auto_179995 - CITY
      ?auto_179997 - LOCATION
      ?auto_179994 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_179991 ?auto_179990 ) ) ( not ( = ?auto_179992 ?auto_179990 ) ) ( not ( = ?auto_179992 ?auto_179991 ) ) ( not ( = ?auto_179993 ?auto_179990 ) ) ( not ( = ?auto_179993 ?auto_179991 ) ) ( not ( = ?auto_179993 ?auto_179992 ) ) ( IN-CITY ?auto_179996 ?auto_179995 ) ( IN-CITY ?auto_179989 ?auto_179995 ) ( not ( = ?auto_179989 ?auto_179996 ) ) ( OBJ-AT ?auto_179990 ?auto_179989 ) ( OBJ-AT ?auto_179993 ?auto_179996 ) ( IN-CITY ?auto_179997 ?auto_179995 ) ( not ( = ?auto_179989 ?auto_179997 ) ) ( not ( = ?auto_179996 ?auto_179997 ) ) ( OBJ-AT ?auto_179991 ?auto_179997 ) ( TRUCK-AT ?auto_179994 ?auto_179989 ) ( OBJ-AT ?auto_179992 ?auto_179989 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179990 ?auto_179993 ?auto_179989 )
      ( DELIVER-4PKG-VERIFY ?auto_179990 ?auto_179991 ?auto_179992 ?auto_179993 ?auto_179989 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180017 - OBJ
      ?auto_180018 - OBJ
      ?auto_180019 - OBJ
      ?auto_180020 - OBJ
      ?auto_180016 - LOCATION
    )
    :vars
    (
      ?auto_180023 - LOCATION
      ?auto_180022 - CITY
      ?auto_180024 - LOCATION
      ?auto_180021 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_180018 ?auto_180017 ) ) ( not ( = ?auto_180019 ?auto_180017 ) ) ( not ( = ?auto_180019 ?auto_180018 ) ) ( not ( = ?auto_180020 ?auto_180017 ) ) ( not ( = ?auto_180020 ?auto_180018 ) ) ( not ( = ?auto_180020 ?auto_180019 ) ) ( IN-CITY ?auto_180023 ?auto_180022 ) ( IN-CITY ?auto_180016 ?auto_180022 ) ( not ( = ?auto_180016 ?auto_180023 ) ) ( OBJ-AT ?auto_180017 ?auto_180016 ) ( OBJ-AT ?auto_180019 ?auto_180023 ) ( IN-CITY ?auto_180024 ?auto_180022 ) ( not ( = ?auto_180016 ?auto_180024 ) ) ( not ( = ?auto_180023 ?auto_180024 ) ) ( OBJ-AT ?auto_180018 ?auto_180024 ) ( TRUCK-AT ?auto_180021 ?auto_180016 ) ( OBJ-AT ?auto_180020 ?auto_180016 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180017 ?auto_180019 ?auto_180016 )
      ( DELIVER-4PKG-VERIFY ?auto_180017 ?auto_180018 ?auto_180019 ?auto_180020 ?auto_180016 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180103 - OBJ
      ?auto_180104 - OBJ
      ?auto_180105 - OBJ
      ?auto_180106 - OBJ
      ?auto_180102 - LOCATION
    )
    :vars
    (
      ?auto_180109 - LOCATION
      ?auto_180108 - CITY
      ?auto_180110 - LOCATION
      ?auto_180107 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_180104 ?auto_180103 ) ) ( not ( = ?auto_180105 ?auto_180103 ) ) ( not ( = ?auto_180105 ?auto_180104 ) ) ( not ( = ?auto_180106 ?auto_180103 ) ) ( not ( = ?auto_180106 ?auto_180104 ) ) ( not ( = ?auto_180106 ?auto_180105 ) ) ( IN-CITY ?auto_180109 ?auto_180108 ) ( IN-CITY ?auto_180102 ?auto_180108 ) ( not ( = ?auto_180102 ?auto_180109 ) ) ( OBJ-AT ?auto_180103 ?auto_180102 ) ( OBJ-AT ?auto_180104 ?auto_180109 ) ( IN-CITY ?auto_180110 ?auto_180108 ) ( not ( = ?auto_180102 ?auto_180110 ) ) ( not ( = ?auto_180109 ?auto_180110 ) ) ( OBJ-AT ?auto_180106 ?auto_180110 ) ( TRUCK-AT ?auto_180107 ?auto_180102 ) ( OBJ-AT ?auto_180105 ?auto_180102 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180103 ?auto_180104 ?auto_180102 )
      ( DELIVER-4PKG-VERIFY ?auto_180103 ?auto_180104 ?auto_180105 ?auto_180106 ?auto_180102 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180131 - OBJ
      ?auto_180132 - OBJ
      ?auto_180133 - OBJ
      ?auto_180134 - OBJ
      ?auto_180130 - LOCATION
    )
    :vars
    (
      ?auto_180137 - LOCATION
      ?auto_180136 - CITY
      ?auto_180138 - LOCATION
      ?auto_180135 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_180132 ?auto_180131 ) ) ( not ( = ?auto_180133 ?auto_180131 ) ) ( not ( = ?auto_180133 ?auto_180132 ) ) ( not ( = ?auto_180134 ?auto_180131 ) ) ( not ( = ?auto_180134 ?auto_180132 ) ) ( not ( = ?auto_180134 ?auto_180133 ) ) ( IN-CITY ?auto_180137 ?auto_180136 ) ( IN-CITY ?auto_180130 ?auto_180136 ) ( not ( = ?auto_180130 ?auto_180137 ) ) ( OBJ-AT ?auto_180131 ?auto_180130 ) ( OBJ-AT ?auto_180132 ?auto_180137 ) ( IN-CITY ?auto_180138 ?auto_180136 ) ( not ( = ?auto_180130 ?auto_180138 ) ) ( not ( = ?auto_180137 ?auto_180138 ) ) ( OBJ-AT ?auto_180133 ?auto_180138 ) ( TRUCK-AT ?auto_180135 ?auto_180130 ) ( OBJ-AT ?auto_180134 ?auto_180130 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180131 ?auto_180132 ?auto_180130 )
      ( DELIVER-4PKG-VERIFY ?auto_180131 ?auto_180132 ?auto_180133 ?auto_180134 ?auto_180130 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180217 - OBJ
      ?auto_180218 - OBJ
      ?auto_180219 - OBJ
      ?auto_180220 - OBJ
      ?auto_180216 - LOCATION
    )
    :vars
    (
      ?auto_180223 - LOCATION
      ?auto_180222 - CITY
      ?auto_180224 - LOCATION
      ?auto_180221 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_180218 ?auto_180217 ) ) ( not ( = ?auto_180219 ?auto_180217 ) ) ( not ( = ?auto_180219 ?auto_180218 ) ) ( not ( = ?auto_180220 ?auto_180217 ) ) ( not ( = ?auto_180220 ?auto_180218 ) ) ( not ( = ?auto_180220 ?auto_180219 ) ) ( IN-CITY ?auto_180223 ?auto_180222 ) ( IN-CITY ?auto_180216 ?auto_180222 ) ( not ( = ?auto_180216 ?auto_180223 ) ) ( OBJ-AT ?auto_180218 ?auto_180216 ) ( OBJ-AT ?auto_180220 ?auto_180223 ) ( IN-CITY ?auto_180224 ?auto_180222 ) ( not ( = ?auto_180216 ?auto_180224 ) ) ( not ( = ?auto_180223 ?auto_180224 ) ) ( OBJ-AT ?auto_180219 ?auto_180224 ) ( TRUCK-AT ?auto_180221 ?auto_180216 ) ( OBJ-AT ?auto_180217 ?auto_180216 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180218 ?auto_180220 ?auto_180216 )
      ( DELIVER-4PKG-VERIFY ?auto_180217 ?auto_180218 ?auto_180219 ?auto_180220 ?auto_180216 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180246 - OBJ
      ?auto_180247 - OBJ
      ?auto_180248 - OBJ
      ?auto_180249 - OBJ
      ?auto_180245 - LOCATION
    )
    :vars
    (
      ?auto_180252 - LOCATION
      ?auto_180251 - CITY
      ?auto_180253 - LOCATION
      ?auto_180250 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_180247 ?auto_180246 ) ) ( not ( = ?auto_180248 ?auto_180246 ) ) ( not ( = ?auto_180248 ?auto_180247 ) ) ( not ( = ?auto_180249 ?auto_180246 ) ) ( not ( = ?auto_180249 ?auto_180247 ) ) ( not ( = ?auto_180249 ?auto_180248 ) ) ( IN-CITY ?auto_180252 ?auto_180251 ) ( IN-CITY ?auto_180245 ?auto_180251 ) ( not ( = ?auto_180245 ?auto_180252 ) ) ( OBJ-AT ?auto_180247 ?auto_180245 ) ( OBJ-AT ?auto_180248 ?auto_180252 ) ( IN-CITY ?auto_180253 ?auto_180251 ) ( not ( = ?auto_180245 ?auto_180253 ) ) ( not ( = ?auto_180252 ?auto_180253 ) ) ( OBJ-AT ?auto_180249 ?auto_180253 ) ( TRUCK-AT ?auto_180250 ?auto_180245 ) ( OBJ-AT ?auto_180246 ?auto_180245 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180247 ?auto_180248 ?auto_180245 )
      ( DELIVER-4PKG-VERIFY ?auto_180246 ?auto_180247 ?auto_180248 ?auto_180249 ?auto_180245 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180338 - OBJ
      ?auto_180339 - OBJ
      ?auto_180340 - OBJ
      ?auto_180341 - OBJ
      ?auto_180337 - LOCATION
    )
    :vars
    (
      ?auto_180344 - LOCATION
      ?auto_180343 - CITY
      ?auto_180345 - LOCATION
      ?auto_180342 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_180339 ?auto_180338 ) ) ( not ( = ?auto_180340 ?auto_180338 ) ) ( not ( = ?auto_180340 ?auto_180339 ) ) ( not ( = ?auto_180341 ?auto_180338 ) ) ( not ( = ?auto_180341 ?auto_180339 ) ) ( not ( = ?auto_180341 ?auto_180340 ) ) ( IN-CITY ?auto_180344 ?auto_180343 ) ( IN-CITY ?auto_180337 ?auto_180343 ) ( not ( = ?auto_180337 ?auto_180344 ) ) ( OBJ-AT ?auto_180340 ?auto_180337 ) ( OBJ-AT ?auto_180341 ?auto_180344 ) ( IN-CITY ?auto_180345 ?auto_180343 ) ( not ( = ?auto_180337 ?auto_180345 ) ) ( not ( = ?auto_180344 ?auto_180345 ) ) ( OBJ-AT ?auto_180339 ?auto_180345 ) ( TRUCK-AT ?auto_180342 ?auto_180337 ) ( OBJ-AT ?auto_180338 ?auto_180337 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180340 ?auto_180341 ?auto_180337 )
      ( DELIVER-4PKG-VERIFY ?auto_180338 ?auto_180339 ?auto_180340 ?auto_180341 ?auto_180337 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180367 - OBJ
      ?auto_180368 - OBJ
      ?auto_180369 - OBJ
      ?auto_180370 - OBJ
      ?auto_180366 - LOCATION
    )
    :vars
    (
      ?auto_180373 - LOCATION
      ?auto_180372 - CITY
      ?auto_180374 - LOCATION
      ?auto_180371 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_180368 ?auto_180367 ) ) ( not ( = ?auto_180369 ?auto_180367 ) ) ( not ( = ?auto_180369 ?auto_180368 ) ) ( not ( = ?auto_180370 ?auto_180367 ) ) ( not ( = ?auto_180370 ?auto_180368 ) ) ( not ( = ?auto_180370 ?auto_180369 ) ) ( IN-CITY ?auto_180373 ?auto_180372 ) ( IN-CITY ?auto_180366 ?auto_180372 ) ( not ( = ?auto_180366 ?auto_180373 ) ) ( OBJ-AT ?auto_180370 ?auto_180366 ) ( OBJ-AT ?auto_180369 ?auto_180373 ) ( IN-CITY ?auto_180374 ?auto_180372 ) ( not ( = ?auto_180366 ?auto_180374 ) ) ( not ( = ?auto_180373 ?auto_180374 ) ) ( OBJ-AT ?auto_180368 ?auto_180374 ) ( TRUCK-AT ?auto_180371 ?auto_180366 ) ( OBJ-AT ?auto_180367 ?auto_180366 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180370 ?auto_180369 ?auto_180366 )
      ( DELIVER-4PKG-VERIFY ?auto_180367 ?auto_180368 ?auto_180369 ?auto_180370 ?auto_180366 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180426 - OBJ
      ?auto_180427 - OBJ
      ?auto_180428 - OBJ
      ?auto_180429 - OBJ
      ?auto_180425 - LOCATION
    )
    :vars
    (
      ?auto_180432 - LOCATION
      ?auto_180431 - CITY
      ?auto_180433 - LOCATION
      ?auto_180430 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_180427 ?auto_180426 ) ) ( not ( = ?auto_180428 ?auto_180426 ) ) ( not ( = ?auto_180428 ?auto_180427 ) ) ( not ( = ?auto_180429 ?auto_180426 ) ) ( not ( = ?auto_180429 ?auto_180427 ) ) ( not ( = ?auto_180429 ?auto_180428 ) ) ( IN-CITY ?auto_180432 ?auto_180431 ) ( IN-CITY ?auto_180425 ?auto_180431 ) ( not ( = ?auto_180425 ?auto_180432 ) ) ( OBJ-AT ?auto_180428 ?auto_180425 ) ( OBJ-AT ?auto_180427 ?auto_180432 ) ( IN-CITY ?auto_180433 ?auto_180431 ) ( not ( = ?auto_180425 ?auto_180433 ) ) ( not ( = ?auto_180432 ?auto_180433 ) ) ( OBJ-AT ?auto_180429 ?auto_180433 ) ( TRUCK-AT ?auto_180430 ?auto_180425 ) ( OBJ-AT ?auto_180426 ?auto_180425 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180428 ?auto_180427 ?auto_180425 )
      ( DELIVER-4PKG-VERIFY ?auto_180426 ?auto_180427 ?auto_180428 ?auto_180429 ?auto_180425 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180487 - OBJ
      ?auto_180488 - OBJ
      ?auto_180489 - OBJ
      ?auto_180490 - OBJ
      ?auto_180486 - LOCATION
    )
    :vars
    (
      ?auto_180493 - LOCATION
      ?auto_180492 - CITY
      ?auto_180494 - LOCATION
      ?auto_180491 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_180488 ?auto_180487 ) ) ( not ( = ?auto_180489 ?auto_180487 ) ) ( not ( = ?auto_180489 ?auto_180488 ) ) ( not ( = ?auto_180490 ?auto_180487 ) ) ( not ( = ?auto_180490 ?auto_180488 ) ) ( not ( = ?auto_180490 ?auto_180489 ) ) ( IN-CITY ?auto_180493 ?auto_180492 ) ( IN-CITY ?auto_180486 ?auto_180492 ) ( not ( = ?auto_180486 ?auto_180493 ) ) ( OBJ-AT ?auto_180490 ?auto_180486 ) ( OBJ-AT ?auto_180488 ?auto_180493 ) ( IN-CITY ?auto_180494 ?auto_180492 ) ( not ( = ?auto_180486 ?auto_180494 ) ) ( not ( = ?auto_180493 ?auto_180494 ) ) ( OBJ-AT ?auto_180489 ?auto_180494 ) ( TRUCK-AT ?auto_180491 ?auto_180486 ) ( OBJ-AT ?auto_180487 ?auto_180486 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180490 ?auto_180488 ?auto_180486 )
      ( DELIVER-4PKG-VERIFY ?auto_180487 ?auto_180488 ?auto_180489 ?auto_180490 ?auto_180486 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180577 - OBJ
      ?auto_180578 - OBJ
      ?auto_180579 - OBJ
      ?auto_180580 - OBJ
      ?auto_180576 - LOCATION
    )
    :vars
    (
      ?auto_180583 - LOCATION
      ?auto_180582 - CITY
      ?auto_180584 - LOCATION
      ?auto_180581 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_180578 ?auto_180577 ) ) ( not ( = ?auto_180579 ?auto_180577 ) ) ( not ( = ?auto_180579 ?auto_180578 ) ) ( not ( = ?auto_180580 ?auto_180577 ) ) ( not ( = ?auto_180580 ?auto_180578 ) ) ( not ( = ?auto_180580 ?auto_180579 ) ) ( IN-CITY ?auto_180583 ?auto_180582 ) ( IN-CITY ?auto_180576 ?auto_180582 ) ( not ( = ?auto_180576 ?auto_180583 ) ) ( OBJ-AT ?auto_180578 ?auto_180576 ) ( OBJ-AT ?auto_180580 ?auto_180583 ) ( IN-CITY ?auto_180584 ?auto_180582 ) ( not ( = ?auto_180576 ?auto_180584 ) ) ( not ( = ?auto_180583 ?auto_180584 ) ) ( OBJ-AT ?auto_180577 ?auto_180584 ) ( TRUCK-AT ?auto_180581 ?auto_180576 ) ( OBJ-AT ?auto_180579 ?auto_180576 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180578 ?auto_180580 ?auto_180576 )
      ( DELIVER-4PKG-VERIFY ?auto_180577 ?auto_180578 ?auto_180579 ?auto_180580 ?auto_180576 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180604 - OBJ
      ?auto_180605 - OBJ
      ?auto_180606 - OBJ
      ?auto_180607 - OBJ
      ?auto_180603 - LOCATION
    )
    :vars
    (
      ?auto_180610 - LOCATION
      ?auto_180609 - CITY
      ?auto_180611 - LOCATION
      ?auto_180608 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_180605 ?auto_180604 ) ) ( not ( = ?auto_180606 ?auto_180604 ) ) ( not ( = ?auto_180606 ?auto_180605 ) ) ( not ( = ?auto_180607 ?auto_180604 ) ) ( not ( = ?auto_180607 ?auto_180605 ) ) ( not ( = ?auto_180607 ?auto_180606 ) ) ( IN-CITY ?auto_180610 ?auto_180609 ) ( IN-CITY ?auto_180603 ?auto_180609 ) ( not ( = ?auto_180603 ?auto_180610 ) ) ( OBJ-AT ?auto_180605 ?auto_180603 ) ( OBJ-AT ?auto_180606 ?auto_180610 ) ( IN-CITY ?auto_180611 ?auto_180609 ) ( not ( = ?auto_180603 ?auto_180611 ) ) ( not ( = ?auto_180610 ?auto_180611 ) ) ( OBJ-AT ?auto_180604 ?auto_180611 ) ( TRUCK-AT ?auto_180608 ?auto_180603 ) ( OBJ-AT ?auto_180607 ?auto_180603 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180605 ?auto_180606 ?auto_180603 )
      ( DELIVER-4PKG-VERIFY ?auto_180604 ?auto_180605 ?auto_180606 ?auto_180607 ?auto_180603 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180631 - OBJ
      ?auto_180632 - OBJ
      ?auto_180633 - OBJ
      ?auto_180634 - OBJ
      ?auto_180630 - LOCATION
    )
    :vars
    (
      ?auto_180637 - LOCATION
      ?auto_180636 - CITY
      ?auto_180638 - LOCATION
      ?auto_180635 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_180632 ?auto_180631 ) ) ( not ( = ?auto_180633 ?auto_180631 ) ) ( not ( = ?auto_180633 ?auto_180632 ) ) ( not ( = ?auto_180634 ?auto_180631 ) ) ( not ( = ?auto_180634 ?auto_180632 ) ) ( not ( = ?auto_180634 ?auto_180633 ) ) ( IN-CITY ?auto_180637 ?auto_180636 ) ( IN-CITY ?auto_180630 ?auto_180636 ) ( not ( = ?auto_180630 ?auto_180637 ) ) ( OBJ-AT ?auto_180633 ?auto_180630 ) ( OBJ-AT ?auto_180634 ?auto_180637 ) ( IN-CITY ?auto_180638 ?auto_180636 ) ( not ( = ?auto_180630 ?auto_180638 ) ) ( not ( = ?auto_180637 ?auto_180638 ) ) ( OBJ-AT ?auto_180631 ?auto_180638 ) ( TRUCK-AT ?auto_180635 ?auto_180630 ) ( OBJ-AT ?auto_180632 ?auto_180630 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180633 ?auto_180634 ?auto_180630 )
      ( DELIVER-4PKG-VERIFY ?auto_180631 ?auto_180632 ?auto_180633 ?auto_180634 ?auto_180630 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180660 - OBJ
      ?auto_180661 - OBJ
      ?auto_180662 - OBJ
      ?auto_180663 - OBJ
      ?auto_180659 - LOCATION
    )
    :vars
    (
      ?auto_180666 - LOCATION
      ?auto_180665 - CITY
      ?auto_180667 - LOCATION
      ?auto_180664 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_180661 ?auto_180660 ) ) ( not ( = ?auto_180662 ?auto_180660 ) ) ( not ( = ?auto_180662 ?auto_180661 ) ) ( not ( = ?auto_180663 ?auto_180660 ) ) ( not ( = ?auto_180663 ?auto_180661 ) ) ( not ( = ?auto_180663 ?auto_180662 ) ) ( IN-CITY ?auto_180666 ?auto_180665 ) ( IN-CITY ?auto_180659 ?auto_180665 ) ( not ( = ?auto_180659 ?auto_180666 ) ) ( OBJ-AT ?auto_180663 ?auto_180659 ) ( OBJ-AT ?auto_180662 ?auto_180666 ) ( IN-CITY ?auto_180667 ?auto_180665 ) ( not ( = ?auto_180659 ?auto_180667 ) ) ( not ( = ?auto_180666 ?auto_180667 ) ) ( OBJ-AT ?auto_180660 ?auto_180667 ) ( TRUCK-AT ?auto_180664 ?auto_180659 ) ( OBJ-AT ?auto_180661 ?auto_180659 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180663 ?auto_180662 ?auto_180659 )
      ( DELIVER-4PKG-VERIFY ?auto_180660 ?auto_180661 ?auto_180662 ?auto_180663 ?auto_180659 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180776 - OBJ
      ?auto_180777 - OBJ
      ?auto_180778 - OBJ
      ?auto_180779 - OBJ
      ?auto_180775 - LOCATION
    )
    :vars
    (
      ?auto_180782 - LOCATION
      ?auto_180781 - CITY
      ?auto_180783 - LOCATION
      ?auto_180780 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_180777 ?auto_180776 ) ) ( not ( = ?auto_180778 ?auto_180776 ) ) ( not ( = ?auto_180778 ?auto_180777 ) ) ( not ( = ?auto_180779 ?auto_180776 ) ) ( not ( = ?auto_180779 ?auto_180777 ) ) ( not ( = ?auto_180779 ?auto_180778 ) ) ( IN-CITY ?auto_180782 ?auto_180781 ) ( IN-CITY ?auto_180775 ?auto_180781 ) ( not ( = ?auto_180775 ?auto_180782 ) ) ( OBJ-AT ?auto_180778 ?auto_180775 ) ( OBJ-AT ?auto_180777 ?auto_180782 ) ( IN-CITY ?auto_180783 ?auto_180781 ) ( not ( = ?auto_180775 ?auto_180783 ) ) ( not ( = ?auto_180782 ?auto_180783 ) ) ( OBJ-AT ?auto_180776 ?auto_180783 ) ( TRUCK-AT ?auto_180780 ?auto_180775 ) ( OBJ-AT ?auto_180779 ?auto_180775 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180778 ?auto_180777 ?auto_180775 )
      ( DELIVER-4PKG-VERIFY ?auto_180776 ?auto_180777 ?auto_180778 ?auto_180779 ?auto_180775 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180803 - OBJ
      ?auto_180804 - OBJ
      ?auto_180805 - OBJ
      ?auto_180806 - OBJ
      ?auto_180802 - LOCATION
    )
    :vars
    (
      ?auto_180809 - LOCATION
      ?auto_180808 - CITY
      ?auto_180810 - LOCATION
      ?auto_180807 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_180804 ?auto_180803 ) ) ( not ( = ?auto_180805 ?auto_180803 ) ) ( not ( = ?auto_180805 ?auto_180804 ) ) ( not ( = ?auto_180806 ?auto_180803 ) ) ( not ( = ?auto_180806 ?auto_180804 ) ) ( not ( = ?auto_180806 ?auto_180805 ) ) ( IN-CITY ?auto_180809 ?auto_180808 ) ( IN-CITY ?auto_180802 ?auto_180808 ) ( not ( = ?auto_180802 ?auto_180809 ) ) ( OBJ-AT ?auto_180806 ?auto_180802 ) ( OBJ-AT ?auto_180804 ?auto_180809 ) ( IN-CITY ?auto_180810 ?auto_180808 ) ( not ( = ?auto_180802 ?auto_180810 ) ) ( not ( = ?auto_180809 ?auto_180810 ) ) ( OBJ-AT ?auto_180803 ?auto_180810 ) ( TRUCK-AT ?auto_180807 ?auto_180802 ) ( OBJ-AT ?auto_180805 ?auto_180802 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180806 ?auto_180804 ?auto_180802 )
      ( DELIVER-4PKG-VERIFY ?auto_180803 ?auto_180804 ?auto_180805 ?auto_180806 ?auto_180802 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180979 - OBJ
      ?auto_180980 - OBJ
      ?auto_180981 - OBJ
      ?auto_180982 - OBJ
      ?auto_180978 - LOCATION
    )
    :vars
    (
      ?auto_180985 - LOCATION
      ?auto_180984 - CITY
      ?auto_180986 - LOCATION
      ?auto_180983 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_180980 ?auto_180979 ) ) ( not ( = ?auto_180981 ?auto_180979 ) ) ( not ( = ?auto_180981 ?auto_180980 ) ) ( not ( = ?auto_180982 ?auto_180979 ) ) ( not ( = ?auto_180982 ?auto_180980 ) ) ( not ( = ?auto_180982 ?auto_180981 ) ) ( IN-CITY ?auto_180985 ?auto_180984 ) ( IN-CITY ?auto_180978 ?auto_180984 ) ( not ( = ?auto_180978 ?auto_180985 ) ) ( OBJ-AT ?auto_180980 ?auto_180978 ) ( OBJ-AT ?auto_180979 ?auto_180985 ) ( IN-CITY ?auto_180986 ?auto_180984 ) ( not ( = ?auto_180978 ?auto_180986 ) ) ( not ( = ?auto_180985 ?auto_180986 ) ) ( OBJ-AT ?auto_180982 ?auto_180986 ) ( TRUCK-AT ?auto_180983 ?auto_180978 ) ( OBJ-AT ?auto_180981 ?auto_180978 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180980 ?auto_180979 ?auto_180978 )
      ( DELIVER-4PKG-VERIFY ?auto_180979 ?auto_180980 ?auto_180981 ?auto_180982 ?auto_180978 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181007 - OBJ
      ?auto_181008 - OBJ
      ?auto_181009 - OBJ
      ?auto_181010 - OBJ
      ?auto_181006 - LOCATION
    )
    :vars
    (
      ?auto_181013 - LOCATION
      ?auto_181012 - CITY
      ?auto_181014 - LOCATION
      ?auto_181011 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_181008 ?auto_181007 ) ) ( not ( = ?auto_181009 ?auto_181007 ) ) ( not ( = ?auto_181009 ?auto_181008 ) ) ( not ( = ?auto_181010 ?auto_181007 ) ) ( not ( = ?auto_181010 ?auto_181008 ) ) ( not ( = ?auto_181010 ?auto_181009 ) ) ( IN-CITY ?auto_181013 ?auto_181012 ) ( IN-CITY ?auto_181006 ?auto_181012 ) ( not ( = ?auto_181006 ?auto_181013 ) ) ( OBJ-AT ?auto_181008 ?auto_181006 ) ( OBJ-AT ?auto_181007 ?auto_181013 ) ( IN-CITY ?auto_181014 ?auto_181012 ) ( not ( = ?auto_181006 ?auto_181014 ) ) ( not ( = ?auto_181013 ?auto_181014 ) ) ( OBJ-AT ?auto_181009 ?auto_181014 ) ( TRUCK-AT ?auto_181011 ?auto_181006 ) ( OBJ-AT ?auto_181010 ?auto_181006 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181008 ?auto_181007 ?auto_181006 )
      ( DELIVER-4PKG-VERIFY ?auto_181007 ?auto_181008 ?auto_181009 ?auto_181010 ?auto_181006 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181093 - OBJ
      ?auto_181094 - OBJ
      ?auto_181095 - OBJ
      ?auto_181096 - OBJ
      ?auto_181092 - LOCATION
    )
    :vars
    (
      ?auto_181099 - LOCATION
      ?auto_181098 - CITY
      ?auto_181100 - LOCATION
      ?auto_181097 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_181094 ?auto_181093 ) ) ( not ( = ?auto_181095 ?auto_181093 ) ) ( not ( = ?auto_181095 ?auto_181094 ) ) ( not ( = ?auto_181096 ?auto_181093 ) ) ( not ( = ?auto_181096 ?auto_181094 ) ) ( not ( = ?auto_181096 ?auto_181095 ) ) ( IN-CITY ?auto_181099 ?auto_181098 ) ( IN-CITY ?auto_181092 ?auto_181098 ) ( not ( = ?auto_181092 ?auto_181099 ) ) ( OBJ-AT ?auto_181095 ?auto_181092 ) ( OBJ-AT ?auto_181093 ?auto_181099 ) ( IN-CITY ?auto_181100 ?auto_181098 ) ( not ( = ?auto_181092 ?auto_181100 ) ) ( not ( = ?auto_181099 ?auto_181100 ) ) ( OBJ-AT ?auto_181096 ?auto_181100 ) ( TRUCK-AT ?auto_181097 ?auto_181092 ) ( OBJ-AT ?auto_181094 ?auto_181092 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181095 ?auto_181093 ?auto_181092 )
      ( DELIVER-4PKG-VERIFY ?auto_181093 ?auto_181094 ?auto_181095 ?auto_181096 ?auto_181092 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181154 - OBJ
      ?auto_181155 - OBJ
      ?auto_181156 - OBJ
      ?auto_181157 - OBJ
      ?auto_181153 - LOCATION
    )
    :vars
    (
      ?auto_181160 - LOCATION
      ?auto_181159 - CITY
      ?auto_181161 - LOCATION
      ?auto_181158 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_181155 ?auto_181154 ) ) ( not ( = ?auto_181156 ?auto_181154 ) ) ( not ( = ?auto_181156 ?auto_181155 ) ) ( not ( = ?auto_181157 ?auto_181154 ) ) ( not ( = ?auto_181157 ?auto_181155 ) ) ( not ( = ?auto_181157 ?auto_181156 ) ) ( IN-CITY ?auto_181160 ?auto_181159 ) ( IN-CITY ?auto_181153 ?auto_181159 ) ( not ( = ?auto_181153 ?auto_181160 ) ) ( OBJ-AT ?auto_181157 ?auto_181153 ) ( OBJ-AT ?auto_181154 ?auto_181160 ) ( IN-CITY ?auto_181161 ?auto_181159 ) ( not ( = ?auto_181153 ?auto_181161 ) ) ( not ( = ?auto_181160 ?auto_181161 ) ) ( OBJ-AT ?auto_181156 ?auto_181161 ) ( TRUCK-AT ?auto_181158 ?auto_181153 ) ( OBJ-AT ?auto_181155 ?auto_181153 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181157 ?auto_181154 ?auto_181153 )
      ( DELIVER-4PKG-VERIFY ?auto_181154 ?auto_181155 ?auto_181156 ?auto_181157 ?auto_181153 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181244 - OBJ
      ?auto_181245 - OBJ
      ?auto_181246 - OBJ
      ?auto_181247 - OBJ
      ?auto_181243 - LOCATION
    )
    :vars
    (
      ?auto_181250 - LOCATION
      ?auto_181249 - CITY
      ?auto_181251 - LOCATION
      ?auto_181248 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_181245 ?auto_181244 ) ) ( not ( = ?auto_181246 ?auto_181244 ) ) ( not ( = ?auto_181246 ?auto_181245 ) ) ( not ( = ?auto_181247 ?auto_181244 ) ) ( not ( = ?auto_181247 ?auto_181245 ) ) ( not ( = ?auto_181247 ?auto_181246 ) ) ( IN-CITY ?auto_181250 ?auto_181249 ) ( IN-CITY ?auto_181243 ?auto_181249 ) ( not ( = ?auto_181243 ?auto_181250 ) ) ( OBJ-AT ?auto_181246 ?auto_181243 ) ( OBJ-AT ?auto_181244 ?auto_181250 ) ( IN-CITY ?auto_181251 ?auto_181249 ) ( not ( = ?auto_181243 ?auto_181251 ) ) ( not ( = ?auto_181250 ?auto_181251 ) ) ( OBJ-AT ?auto_181245 ?auto_181251 ) ( TRUCK-AT ?auto_181248 ?auto_181243 ) ( OBJ-AT ?auto_181247 ?auto_181243 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181246 ?auto_181244 ?auto_181243 )
      ( DELIVER-4PKG-VERIFY ?auto_181244 ?auto_181245 ?auto_181246 ?auto_181247 ?auto_181243 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181271 - OBJ
      ?auto_181272 - OBJ
      ?auto_181273 - OBJ
      ?auto_181274 - OBJ
      ?auto_181270 - LOCATION
    )
    :vars
    (
      ?auto_181277 - LOCATION
      ?auto_181276 - CITY
      ?auto_181278 - LOCATION
      ?auto_181275 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_181272 ?auto_181271 ) ) ( not ( = ?auto_181273 ?auto_181271 ) ) ( not ( = ?auto_181273 ?auto_181272 ) ) ( not ( = ?auto_181274 ?auto_181271 ) ) ( not ( = ?auto_181274 ?auto_181272 ) ) ( not ( = ?auto_181274 ?auto_181273 ) ) ( IN-CITY ?auto_181277 ?auto_181276 ) ( IN-CITY ?auto_181270 ?auto_181276 ) ( not ( = ?auto_181270 ?auto_181277 ) ) ( OBJ-AT ?auto_181274 ?auto_181270 ) ( OBJ-AT ?auto_181271 ?auto_181277 ) ( IN-CITY ?auto_181278 ?auto_181276 ) ( not ( = ?auto_181270 ?auto_181278 ) ) ( not ( = ?auto_181277 ?auto_181278 ) ) ( OBJ-AT ?auto_181272 ?auto_181278 ) ( TRUCK-AT ?auto_181275 ?auto_181270 ) ( OBJ-AT ?auto_181273 ?auto_181270 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181274 ?auto_181271 ?auto_181270 )
      ( DELIVER-4PKG-VERIFY ?auto_181271 ?auto_181272 ?auto_181273 ?auto_181274 ?auto_181270 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_181550 - OBJ
      ?auto_181549 - LOCATION
    )
    :vars
    (
      ?auto_181556 - OBJ
      ?auto_181554 - LOCATION
      ?auto_181553 - CITY
      ?auto_181552 - OBJ
      ?auto_181555 - LOCATION
      ?auto_181551 - TRUCK
      ?auto_181557 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_181550 ?auto_181556 ) ) ( IN-CITY ?auto_181554 ?auto_181553 ) ( IN-CITY ?auto_181549 ?auto_181553 ) ( not ( = ?auto_181549 ?auto_181554 ) ) ( OBJ-AT ?auto_181556 ?auto_181549 ) ( OBJ-AT ?auto_181550 ?auto_181554 ) ( not ( = ?auto_181552 ?auto_181556 ) ) ( not ( = ?auto_181550 ?auto_181552 ) ) ( IN-CITY ?auto_181555 ?auto_181553 ) ( not ( = ?auto_181549 ?auto_181555 ) ) ( not ( = ?auto_181554 ?auto_181555 ) ) ( OBJ-AT ?auto_181552 ?auto_181555 ) ( TRUCK-AT ?auto_181551 ?auto_181549 ) ( not ( = ?auto_181557 ?auto_181556 ) ) ( IN-TRUCK ?auto_181557 ?auto_181551 ) ( not ( = ?auto_181550 ?auto_181557 ) ) ( not ( = ?auto_181552 ?auto_181557 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181556 ?auto_181557 ?auto_181549 )
      ( DELIVER-2PKG ?auto_181556 ?auto_181550 ?auto_181549 )
      ( DELIVER-1PKG-VERIFY ?auto_181550 ?auto_181549 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_181559 - OBJ
      ?auto_181560 - OBJ
      ?auto_181558 - LOCATION
    )
    :vars
    (
      ?auto_181564 - LOCATION
      ?auto_181562 - CITY
      ?auto_181563 - OBJ
      ?auto_181565 - LOCATION
      ?auto_181566 - TRUCK
      ?auto_181561 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_181560 ?auto_181559 ) ) ( IN-CITY ?auto_181564 ?auto_181562 ) ( IN-CITY ?auto_181558 ?auto_181562 ) ( not ( = ?auto_181558 ?auto_181564 ) ) ( OBJ-AT ?auto_181559 ?auto_181558 ) ( OBJ-AT ?auto_181560 ?auto_181564 ) ( not ( = ?auto_181563 ?auto_181559 ) ) ( not ( = ?auto_181560 ?auto_181563 ) ) ( IN-CITY ?auto_181565 ?auto_181562 ) ( not ( = ?auto_181558 ?auto_181565 ) ) ( not ( = ?auto_181564 ?auto_181565 ) ) ( OBJ-AT ?auto_181563 ?auto_181565 ) ( TRUCK-AT ?auto_181566 ?auto_181558 ) ( not ( = ?auto_181561 ?auto_181559 ) ) ( IN-TRUCK ?auto_181561 ?auto_181566 ) ( not ( = ?auto_181560 ?auto_181561 ) ) ( not ( = ?auto_181563 ?auto_181561 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_181560 ?auto_181558 )
      ( DELIVER-2PKG-VERIFY ?auto_181559 ?auto_181560 ?auto_181558 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_181568 - OBJ
      ?auto_181569 - OBJ
      ?auto_181567 - LOCATION
    )
    :vars
    (
      ?auto_181571 - OBJ
      ?auto_181570 - LOCATION
      ?auto_181575 - CITY
      ?auto_181572 - OBJ
      ?auto_181574 - LOCATION
      ?auto_181573 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_181569 ?auto_181568 ) ) ( not ( = ?auto_181569 ?auto_181571 ) ) ( IN-CITY ?auto_181570 ?auto_181575 ) ( IN-CITY ?auto_181567 ?auto_181575 ) ( not ( = ?auto_181567 ?auto_181570 ) ) ( OBJ-AT ?auto_181571 ?auto_181567 ) ( OBJ-AT ?auto_181569 ?auto_181570 ) ( not ( = ?auto_181572 ?auto_181571 ) ) ( not ( = ?auto_181569 ?auto_181572 ) ) ( IN-CITY ?auto_181574 ?auto_181575 ) ( not ( = ?auto_181567 ?auto_181574 ) ) ( not ( = ?auto_181570 ?auto_181574 ) ) ( OBJ-AT ?auto_181572 ?auto_181574 ) ( TRUCK-AT ?auto_181573 ?auto_181567 ) ( not ( = ?auto_181568 ?auto_181571 ) ) ( IN-TRUCK ?auto_181568 ?auto_181573 ) ( not ( = ?auto_181572 ?auto_181568 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181571 ?auto_181569 ?auto_181567 )
      ( DELIVER-2PKG-VERIFY ?auto_181568 ?auto_181569 ?auto_181567 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_181577 - OBJ
      ?auto_181578 - OBJ
      ?auto_181576 - LOCATION
    )
    :vars
    (
      ?auto_181580 - OBJ
      ?auto_181579 - LOCATION
      ?auto_181584 - CITY
      ?auto_181583 - LOCATION
      ?auto_181582 - TRUCK
      ?auto_181581 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_181578 ?auto_181577 ) ) ( not ( = ?auto_181578 ?auto_181580 ) ) ( IN-CITY ?auto_181579 ?auto_181584 ) ( IN-CITY ?auto_181576 ?auto_181584 ) ( not ( = ?auto_181576 ?auto_181579 ) ) ( OBJ-AT ?auto_181580 ?auto_181576 ) ( OBJ-AT ?auto_181578 ?auto_181579 ) ( not ( = ?auto_181577 ?auto_181580 ) ) ( IN-CITY ?auto_181583 ?auto_181584 ) ( not ( = ?auto_181576 ?auto_181583 ) ) ( not ( = ?auto_181579 ?auto_181583 ) ) ( OBJ-AT ?auto_181577 ?auto_181583 ) ( TRUCK-AT ?auto_181582 ?auto_181576 ) ( not ( = ?auto_181581 ?auto_181580 ) ) ( IN-TRUCK ?auto_181581 ?auto_181582 ) ( not ( = ?auto_181578 ?auto_181581 ) ) ( not ( = ?auto_181577 ?auto_181581 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181580 ?auto_181578 ?auto_181576 )
      ( DELIVER-2PKG-VERIFY ?auto_181577 ?auto_181578 ?auto_181576 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_181586 - OBJ
      ?auto_181587 - OBJ
      ?auto_181585 - LOCATION
    )
    :vars
    (
      ?auto_181588 - LOCATION
      ?auto_181593 - CITY
      ?auto_181590 - OBJ
      ?auto_181592 - LOCATION
      ?auto_181591 - TRUCK
      ?auto_181589 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_181587 ?auto_181586 ) ) ( IN-CITY ?auto_181588 ?auto_181593 ) ( IN-CITY ?auto_181585 ?auto_181593 ) ( not ( = ?auto_181585 ?auto_181588 ) ) ( OBJ-AT ?auto_181587 ?auto_181585 ) ( OBJ-AT ?auto_181586 ?auto_181588 ) ( not ( = ?auto_181590 ?auto_181587 ) ) ( not ( = ?auto_181586 ?auto_181590 ) ) ( IN-CITY ?auto_181592 ?auto_181593 ) ( not ( = ?auto_181585 ?auto_181592 ) ) ( not ( = ?auto_181588 ?auto_181592 ) ) ( OBJ-AT ?auto_181590 ?auto_181592 ) ( TRUCK-AT ?auto_181591 ?auto_181585 ) ( not ( = ?auto_181589 ?auto_181587 ) ) ( IN-TRUCK ?auto_181589 ?auto_181591 ) ( not ( = ?auto_181586 ?auto_181589 ) ) ( not ( = ?auto_181590 ?auto_181589 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181587 ?auto_181586 ?auto_181585 )
      ( DELIVER-2PKG-VERIFY ?auto_181586 ?auto_181587 ?auto_181585 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_181595 - OBJ
      ?auto_181596 - OBJ
      ?auto_181594 - LOCATION
    )
    :vars
    (
      ?auto_181598 - OBJ
      ?auto_181597 - LOCATION
      ?auto_181602 - CITY
      ?auto_181599 - OBJ
      ?auto_181601 - LOCATION
      ?auto_181600 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_181596 ?auto_181595 ) ) ( not ( = ?auto_181595 ?auto_181598 ) ) ( IN-CITY ?auto_181597 ?auto_181602 ) ( IN-CITY ?auto_181594 ?auto_181602 ) ( not ( = ?auto_181594 ?auto_181597 ) ) ( OBJ-AT ?auto_181598 ?auto_181594 ) ( OBJ-AT ?auto_181595 ?auto_181597 ) ( not ( = ?auto_181599 ?auto_181598 ) ) ( not ( = ?auto_181595 ?auto_181599 ) ) ( IN-CITY ?auto_181601 ?auto_181602 ) ( not ( = ?auto_181594 ?auto_181601 ) ) ( not ( = ?auto_181597 ?auto_181601 ) ) ( OBJ-AT ?auto_181599 ?auto_181601 ) ( TRUCK-AT ?auto_181600 ?auto_181594 ) ( not ( = ?auto_181596 ?auto_181598 ) ) ( IN-TRUCK ?auto_181596 ?auto_181600 ) ( not ( = ?auto_181599 ?auto_181596 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181598 ?auto_181595 ?auto_181594 )
      ( DELIVER-2PKG-VERIFY ?auto_181595 ?auto_181596 ?auto_181594 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_181604 - OBJ
      ?auto_181605 - OBJ
      ?auto_181603 - LOCATION
    )
    :vars
    (
      ?auto_181607 - OBJ
      ?auto_181606 - LOCATION
      ?auto_181611 - CITY
      ?auto_181610 - LOCATION
      ?auto_181609 - TRUCK
      ?auto_181608 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_181605 ?auto_181604 ) ) ( not ( = ?auto_181604 ?auto_181607 ) ) ( IN-CITY ?auto_181606 ?auto_181611 ) ( IN-CITY ?auto_181603 ?auto_181611 ) ( not ( = ?auto_181603 ?auto_181606 ) ) ( OBJ-AT ?auto_181607 ?auto_181603 ) ( OBJ-AT ?auto_181604 ?auto_181606 ) ( not ( = ?auto_181605 ?auto_181607 ) ) ( IN-CITY ?auto_181610 ?auto_181611 ) ( not ( = ?auto_181603 ?auto_181610 ) ) ( not ( = ?auto_181606 ?auto_181610 ) ) ( OBJ-AT ?auto_181605 ?auto_181610 ) ( TRUCK-AT ?auto_181609 ?auto_181603 ) ( not ( = ?auto_181608 ?auto_181607 ) ) ( IN-TRUCK ?auto_181608 ?auto_181609 ) ( not ( = ?auto_181604 ?auto_181608 ) ) ( not ( = ?auto_181605 ?auto_181608 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181607 ?auto_181604 ?auto_181603 )
      ( DELIVER-2PKG-VERIFY ?auto_181604 ?auto_181605 ?auto_181603 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181633 - OBJ
      ?auto_181634 - OBJ
      ?auto_181635 - OBJ
      ?auto_181632 - LOCATION
    )
    :vars
    (
      ?auto_181636 - LOCATION
      ?auto_181640 - CITY
      ?auto_181637 - OBJ
      ?auto_181639 - LOCATION
      ?auto_181638 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_181634 ?auto_181633 ) ) ( not ( = ?auto_181635 ?auto_181633 ) ) ( not ( = ?auto_181635 ?auto_181634 ) ) ( IN-CITY ?auto_181636 ?auto_181640 ) ( IN-CITY ?auto_181632 ?auto_181640 ) ( not ( = ?auto_181632 ?auto_181636 ) ) ( OBJ-AT ?auto_181633 ?auto_181632 ) ( OBJ-AT ?auto_181635 ?auto_181636 ) ( not ( = ?auto_181637 ?auto_181633 ) ) ( not ( = ?auto_181635 ?auto_181637 ) ) ( IN-CITY ?auto_181639 ?auto_181640 ) ( not ( = ?auto_181632 ?auto_181639 ) ) ( not ( = ?auto_181636 ?auto_181639 ) ) ( OBJ-AT ?auto_181637 ?auto_181639 ) ( TRUCK-AT ?auto_181638 ?auto_181632 ) ( IN-TRUCK ?auto_181634 ?auto_181638 ) ( not ( = ?auto_181637 ?auto_181634 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181633 ?auto_181635 ?auto_181632 )
      ( DELIVER-3PKG-VERIFY ?auto_181633 ?auto_181634 ?auto_181635 ?auto_181632 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181642 - OBJ
      ?auto_181643 - OBJ
      ?auto_181644 - OBJ
      ?auto_181641 - LOCATION
    )
    :vars
    (
      ?auto_181645 - LOCATION
      ?auto_181649 - CITY
      ?auto_181648 - LOCATION
      ?auto_181647 - TRUCK
      ?auto_181646 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_181643 ?auto_181642 ) ) ( not ( = ?auto_181644 ?auto_181642 ) ) ( not ( = ?auto_181644 ?auto_181643 ) ) ( IN-CITY ?auto_181645 ?auto_181649 ) ( IN-CITY ?auto_181641 ?auto_181649 ) ( not ( = ?auto_181641 ?auto_181645 ) ) ( OBJ-AT ?auto_181642 ?auto_181641 ) ( OBJ-AT ?auto_181644 ?auto_181645 ) ( IN-CITY ?auto_181648 ?auto_181649 ) ( not ( = ?auto_181641 ?auto_181648 ) ) ( not ( = ?auto_181645 ?auto_181648 ) ) ( OBJ-AT ?auto_181643 ?auto_181648 ) ( TRUCK-AT ?auto_181647 ?auto_181641 ) ( not ( = ?auto_181646 ?auto_181642 ) ) ( IN-TRUCK ?auto_181646 ?auto_181647 ) ( not ( = ?auto_181644 ?auto_181646 ) ) ( not ( = ?auto_181643 ?auto_181646 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181642 ?auto_181644 ?auto_181641 )
      ( DELIVER-3PKG-VERIFY ?auto_181642 ?auto_181643 ?auto_181644 ?auto_181641 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181661 - OBJ
      ?auto_181662 - OBJ
      ?auto_181663 - OBJ
      ?auto_181660 - LOCATION
    )
    :vars
    (
      ?auto_181664 - LOCATION
      ?auto_181668 - CITY
      ?auto_181665 - OBJ
      ?auto_181667 - LOCATION
      ?auto_181666 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_181662 ?auto_181661 ) ) ( not ( = ?auto_181663 ?auto_181661 ) ) ( not ( = ?auto_181663 ?auto_181662 ) ) ( IN-CITY ?auto_181664 ?auto_181668 ) ( IN-CITY ?auto_181660 ?auto_181668 ) ( not ( = ?auto_181660 ?auto_181664 ) ) ( OBJ-AT ?auto_181661 ?auto_181660 ) ( OBJ-AT ?auto_181662 ?auto_181664 ) ( not ( = ?auto_181665 ?auto_181661 ) ) ( not ( = ?auto_181662 ?auto_181665 ) ) ( IN-CITY ?auto_181667 ?auto_181668 ) ( not ( = ?auto_181660 ?auto_181667 ) ) ( not ( = ?auto_181664 ?auto_181667 ) ) ( OBJ-AT ?auto_181665 ?auto_181667 ) ( TRUCK-AT ?auto_181666 ?auto_181660 ) ( IN-TRUCK ?auto_181663 ?auto_181666 ) ( not ( = ?auto_181665 ?auto_181663 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181661 ?auto_181662 ?auto_181660 )
      ( DELIVER-3PKG-VERIFY ?auto_181661 ?auto_181662 ?auto_181663 ?auto_181660 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181670 - OBJ
      ?auto_181671 - OBJ
      ?auto_181672 - OBJ
      ?auto_181669 - LOCATION
    )
    :vars
    (
      ?auto_181673 - LOCATION
      ?auto_181677 - CITY
      ?auto_181676 - LOCATION
      ?auto_181675 - TRUCK
      ?auto_181674 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_181671 ?auto_181670 ) ) ( not ( = ?auto_181672 ?auto_181670 ) ) ( not ( = ?auto_181672 ?auto_181671 ) ) ( IN-CITY ?auto_181673 ?auto_181677 ) ( IN-CITY ?auto_181669 ?auto_181677 ) ( not ( = ?auto_181669 ?auto_181673 ) ) ( OBJ-AT ?auto_181670 ?auto_181669 ) ( OBJ-AT ?auto_181671 ?auto_181673 ) ( IN-CITY ?auto_181676 ?auto_181677 ) ( not ( = ?auto_181669 ?auto_181676 ) ) ( not ( = ?auto_181673 ?auto_181676 ) ) ( OBJ-AT ?auto_181672 ?auto_181676 ) ( TRUCK-AT ?auto_181675 ?auto_181669 ) ( not ( = ?auto_181674 ?auto_181670 ) ) ( IN-TRUCK ?auto_181674 ?auto_181675 ) ( not ( = ?auto_181671 ?auto_181674 ) ) ( not ( = ?auto_181672 ?auto_181674 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181670 ?auto_181671 ?auto_181669 )
      ( DELIVER-3PKG-VERIFY ?auto_181670 ?auto_181671 ?auto_181672 ?auto_181669 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181689 - OBJ
      ?auto_181690 - OBJ
      ?auto_181691 - OBJ
      ?auto_181688 - LOCATION
    )
    :vars
    (
      ?auto_181692 - LOCATION
      ?auto_181696 - CITY
      ?auto_181693 - OBJ
      ?auto_181695 - LOCATION
      ?auto_181694 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_181690 ?auto_181689 ) ) ( not ( = ?auto_181691 ?auto_181689 ) ) ( not ( = ?auto_181691 ?auto_181690 ) ) ( IN-CITY ?auto_181692 ?auto_181696 ) ( IN-CITY ?auto_181688 ?auto_181696 ) ( not ( = ?auto_181688 ?auto_181692 ) ) ( OBJ-AT ?auto_181690 ?auto_181688 ) ( OBJ-AT ?auto_181691 ?auto_181692 ) ( not ( = ?auto_181693 ?auto_181690 ) ) ( not ( = ?auto_181691 ?auto_181693 ) ) ( IN-CITY ?auto_181695 ?auto_181696 ) ( not ( = ?auto_181688 ?auto_181695 ) ) ( not ( = ?auto_181692 ?auto_181695 ) ) ( OBJ-AT ?auto_181693 ?auto_181695 ) ( TRUCK-AT ?auto_181694 ?auto_181688 ) ( IN-TRUCK ?auto_181689 ?auto_181694 ) ( not ( = ?auto_181693 ?auto_181689 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181690 ?auto_181691 ?auto_181688 )
      ( DELIVER-3PKG-VERIFY ?auto_181689 ?auto_181690 ?auto_181691 ?auto_181688 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181708 - OBJ
      ?auto_181709 - OBJ
      ?auto_181710 - OBJ
      ?auto_181707 - LOCATION
    )
    :vars
    (
      ?auto_181712 - OBJ
      ?auto_181711 - LOCATION
      ?auto_181715 - CITY
      ?auto_181714 - LOCATION
      ?auto_181713 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_181709 ?auto_181708 ) ) ( not ( = ?auto_181710 ?auto_181708 ) ) ( not ( = ?auto_181710 ?auto_181709 ) ) ( not ( = ?auto_181710 ?auto_181712 ) ) ( IN-CITY ?auto_181711 ?auto_181715 ) ( IN-CITY ?auto_181707 ?auto_181715 ) ( not ( = ?auto_181707 ?auto_181711 ) ) ( OBJ-AT ?auto_181712 ?auto_181707 ) ( OBJ-AT ?auto_181710 ?auto_181711 ) ( not ( = ?auto_181709 ?auto_181712 ) ) ( IN-CITY ?auto_181714 ?auto_181715 ) ( not ( = ?auto_181707 ?auto_181714 ) ) ( not ( = ?auto_181711 ?auto_181714 ) ) ( OBJ-AT ?auto_181709 ?auto_181714 ) ( TRUCK-AT ?auto_181713 ?auto_181707 ) ( not ( = ?auto_181708 ?auto_181712 ) ) ( IN-TRUCK ?auto_181708 ?auto_181713 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181712 ?auto_181710 ?auto_181707 )
      ( DELIVER-3PKG-VERIFY ?auto_181708 ?auto_181709 ?auto_181710 ?auto_181707 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181717 - OBJ
      ?auto_181718 - OBJ
      ?auto_181719 - OBJ
      ?auto_181716 - LOCATION
    )
    :vars
    (
      ?auto_181720 - LOCATION
      ?auto_181724 - CITY
      ?auto_181721 - OBJ
      ?auto_181723 - LOCATION
      ?auto_181722 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_181718 ?auto_181717 ) ) ( not ( = ?auto_181719 ?auto_181717 ) ) ( not ( = ?auto_181719 ?auto_181718 ) ) ( IN-CITY ?auto_181720 ?auto_181724 ) ( IN-CITY ?auto_181716 ?auto_181724 ) ( not ( = ?auto_181716 ?auto_181720 ) ) ( OBJ-AT ?auto_181719 ?auto_181716 ) ( OBJ-AT ?auto_181718 ?auto_181720 ) ( not ( = ?auto_181721 ?auto_181719 ) ) ( not ( = ?auto_181718 ?auto_181721 ) ) ( IN-CITY ?auto_181723 ?auto_181724 ) ( not ( = ?auto_181716 ?auto_181723 ) ) ( not ( = ?auto_181720 ?auto_181723 ) ) ( OBJ-AT ?auto_181721 ?auto_181723 ) ( TRUCK-AT ?auto_181722 ?auto_181716 ) ( IN-TRUCK ?auto_181717 ?auto_181722 ) ( not ( = ?auto_181721 ?auto_181717 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181719 ?auto_181718 ?auto_181716 )
      ( DELIVER-3PKG-VERIFY ?auto_181717 ?auto_181718 ?auto_181719 ?auto_181716 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181736 - OBJ
      ?auto_181737 - OBJ
      ?auto_181738 - OBJ
      ?auto_181735 - LOCATION
    )
    :vars
    (
      ?auto_181740 - OBJ
      ?auto_181739 - LOCATION
      ?auto_181743 - CITY
      ?auto_181742 - LOCATION
      ?auto_181741 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_181737 ?auto_181736 ) ) ( not ( = ?auto_181738 ?auto_181736 ) ) ( not ( = ?auto_181738 ?auto_181737 ) ) ( not ( = ?auto_181737 ?auto_181740 ) ) ( IN-CITY ?auto_181739 ?auto_181743 ) ( IN-CITY ?auto_181735 ?auto_181743 ) ( not ( = ?auto_181735 ?auto_181739 ) ) ( OBJ-AT ?auto_181740 ?auto_181735 ) ( OBJ-AT ?auto_181737 ?auto_181739 ) ( not ( = ?auto_181738 ?auto_181740 ) ) ( IN-CITY ?auto_181742 ?auto_181743 ) ( not ( = ?auto_181735 ?auto_181742 ) ) ( not ( = ?auto_181739 ?auto_181742 ) ) ( OBJ-AT ?auto_181738 ?auto_181742 ) ( TRUCK-AT ?auto_181741 ?auto_181735 ) ( not ( = ?auto_181736 ?auto_181740 ) ) ( IN-TRUCK ?auto_181736 ?auto_181741 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181740 ?auto_181737 ?auto_181735 )
      ( DELIVER-3PKG-VERIFY ?auto_181736 ?auto_181737 ?auto_181738 ?auto_181735 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181755 - OBJ
      ?auto_181756 - OBJ
      ?auto_181757 - OBJ
      ?auto_181754 - LOCATION
    )
    :vars
    (
      ?auto_181758 - LOCATION
      ?auto_181762 - CITY
      ?auto_181761 - LOCATION
      ?auto_181760 - TRUCK
      ?auto_181759 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_181756 ?auto_181755 ) ) ( not ( = ?auto_181757 ?auto_181755 ) ) ( not ( = ?auto_181757 ?auto_181756 ) ) ( IN-CITY ?auto_181758 ?auto_181762 ) ( IN-CITY ?auto_181754 ?auto_181762 ) ( not ( = ?auto_181754 ?auto_181758 ) ) ( OBJ-AT ?auto_181756 ?auto_181754 ) ( OBJ-AT ?auto_181757 ?auto_181758 ) ( IN-CITY ?auto_181761 ?auto_181762 ) ( not ( = ?auto_181754 ?auto_181761 ) ) ( not ( = ?auto_181758 ?auto_181761 ) ) ( OBJ-AT ?auto_181755 ?auto_181761 ) ( TRUCK-AT ?auto_181760 ?auto_181754 ) ( not ( = ?auto_181759 ?auto_181756 ) ) ( IN-TRUCK ?auto_181759 ?auto_181760 ) ( not ( = ?auto_181757 ?auto_181759 ) ) ( not ( = ?auto_181755 ?auto_181759 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181756 ?auto_181757 ?auto_181754 )
      ( DELIVER-3PKG-VERIFY ?auto_181755 ?auto_181756 ?auto_181757 ?auto_181754 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181764 - OBJ
      ?auto_181765 - OBJ
      ?auto_181766 - OBJ
      ?auto_181763 - LOCATION
    )
    :vars
    (
      ?auto_181768 - OBJ
      ?auto_181767 - LOCATION
      ?auto_181771 - CITY
      ?auto_181770 - LOCATION
      ?auto_181769 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_181765 ?auto_181764 ) ) ( not ( = ?auto_181766 ?auto_181764 ) ) ( not ( = ?auto_181766 ?auto_181765 ) ) ( not ( = ?auto_181766 ?auto_181768 ) ) ( IN-CITY ?auto_181767 ?auto_181771 ) ( IN-CITY ?auto_181763 ?auto_181771 ) ( not ( = ?auto_181763 ?auto_181767 ) ) ( OBJ-AT ?auto_181768 ?auto_181763 ) ( OBJ-AT ?auto_181766 ?auto_181767 ) ( not ( = ?auto_181764 ?auto_181768 ) ) ( IN-CITY ?auto_181770 ?auto_181771 ) ( not ( = ?auto_181763 ?auto_181770 ) ) ( not ( = ?auto_181767 ?auto_181770 ) ) ( OBJ-AT ?auto_181764 ?auto_181770 ) ( TRUCK-AT ?auto_181769 ?auto_181763 ) ( not ( = ?auto_181765 ?auto_181768 ) ) ( IN-TRUCK ?auto_181765 ?auto_181769 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181768 ?auto_181766 ?auto_181763 )
      ( DELIVER-3PKG-VERIFY ?auto_181764 ?auto_181765 ?auto_181766 ?auto_181763 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181783 - OBJ
      ?auto_181784 - OBJ
      ?auto_181785 - OBJ
      ?auto_181782 - LOCATION
    )
    :vars
    (
      ?auto_181786 - LOCATION
      ?auto_181790 - CITY
      ?auto_181789 - LOCATION
      ?auto_181788 - TRUCK
      ?auto_181787 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_181784 ?auto_181783 ) ) ( not ( = ?auto_181785 ?auto_181783 ) ) ( not ( = ?auto_181785 ?auto_181784 ) ) ( IN-CITY ?auto_181786 ?auto_181790 ) ( IN-CITY ?auto_181782 ?auto_181790 ) ( not ( = ?auto_181782 ?auto_181786 ) ) ( OBJ-AT ?auto_181785 ?auto_181782 ) ( OBJ-AT ?auto_181784 ?auto_181786 ) ( IN-CITY ?auto_181789 ?auto_181790 ) ( not ( = ?auto_181782 ?auto_181789 ) ) ( not ( = ?auto_181786 ?auto_181789 ) ) ( OBJ-AT ?auto_181783 ?auto_181789 ) ( TRUCK-AT ?auto_181788 ?auto_181782 ) ( not ( = ?auto_181787 ?auto_181785 ) ) ( IN-TRUCK ?auto_181787 ?auto_181788 ) ( not ( = ?auto_181784 ?auto_181787 ) ) ( not ( = ?auto_181783 ?auto_181787 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181785 ?auto_181784 ?auto_181782 )
      ( DELIVER-3PKG-VERIFY ?auto_181783 ?auto_181784 ?auto_181785 ?auto_181782 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181792 - OBJ
      ?auto_181793 - OBJ
      ?auto_181794 - OBJ
      ?auto_181791 - LOCATION
    )
    :vars
    (
      ?auto_181796 - OBJ
      ?auto_181795 - LOCATION
      ?auto_181799 - CITY
      ?auto_181798 - LOCATION
      ?auto_181797 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_181793 ?auto_181792 ) ) ( not ( = ?auto_181794 ?auto_181792 ) ) ( not ( = ?auto_181794 ?auto_181793 ) ) ( not ( = ?auto_181793 ?auto_181796 ) ) ( IN-CITY ?auto_181795 ?auto_181799 ) ( IN-CITY ?auto_181791 ?auto_181799 ) ( not ( = ?auto_181791 ?auto_181795 ) ) ( OBJ-AT ?auto_181796 ?auto_181791 ) ( OBJ-AT ?auto_181793 ?auto_181795 ) ( not ( = ?auto_181792 ?auto_181796 ) ) ( IN-CITY ?auto_181798 ?auto_181799 ) ( not ( = ?auto_181791 ?auto_181798 ) ) ( not ( = ?auto_181795 ?auto_181798 ) ) ( OBJ-AT ?auto_181792 ?auto_181798 ) ( TRUCK-AT ?auto_181797 ?auto_181791 ) ( not ( = ?auto_181794 ?auto_181796 ) ) ( IN-TRUCK ?auto_181794 ?auto_181797 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181796 ?auto_181793 ?auto_181791 )
      ( DELIVER-3PKG-VERIFY ?auto_181792 ?auto_181793 ?auto_181794 ?auto_181791 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181831 - OBJ
      ?auto_181832 - OBJ
      ?auto_181833 - OBJ
      ?auto_181830 - LOCATION
    )
    :vars
    (
      ?auto_181834 - LOCATION
      ?auto_181838 - CITY
      ?auto_181835 - OBJ
      ?auto_181837 - LOCATION
      ?auto_181836 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_181832 ?auto_181831 ) ) ( not ( = ?auto_181833 ?auto_181831 ) ) ( not ( = ?auto_181833 ?auto_181832 ) ) ( IN-CITY ?auto_181834 ?auto_181838 ) ( IN-CITY ?auto_181830 ?auto_181838 ) ( not ( = ?auto_181830 ?auto_181834 ) ) ( OBJ-AT ?auto_181832 ?auto_181830 ) ( OBJ-AT ?auto_181831 ?auto_181834 ) ( not ( = ?auto_181835 ?auto_181832 ) ) ( not ( = ?auto_181831 ?auto_181835 ) ) ( IN-CITY ?auto_181837 ?auto_181838 ) ( not ( = ?auto_181830 ?auto_181837 ) ) ( not ( = ?auto_181834 ?auto_181837 ) ) ( OBJ-AT ?auto_181835 ?auto_181837 ) ( TRUCK-AT ?auto_181836 ?auto_181830 ) ( IN-TRUCK ?auto_181833 ?auto_181836 ) ( not ( = ?auto_181835 ?auto_181833 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181832 ?auto_181831 ?auto_181830 )
      ( DELIVER-3PKG-VERIFY ?auto_181831 ?auto_181832 ?auto_181833 ?auto_181830 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181840 - OBJ
      ?auto_181841 - OBJ
      ?auto_181842 - OBJ
      ?auto_181839 - LOCATION
    )
    :vars
    (
      ?auto_181843 - LOCATION
      ?auto_181847 - CITY
      ?auto_181846 - LOCATION
      ?auto_181845 - TRUCK
      ?auto_181844 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_181841 ?auto_181840 ) ) ( not ( = ?auto_181842 ?auto_181840 ) ) ( not ( = ?auto_181842 ?auto_181841 ) ) ( IN-CITY ?auto_181843 ?auto_181847 ) ( IN-CITY ?auto_181839 ?auto_181847 ) ( not ( = ?auto_181839 ?auto_181843 ) ) ( OBJ-AT ?auto_181841 ?auto_181839 ) ( OBJ-AT ?auto_181840 ?auto_181843 ) ( IN-CITY ?auto_181846 ?auto_181847 ) ( not ( = ?auto_181839 ?auto_181846 ) ) ( not ( = ?auto_181843 ?auto_181846 ) ) ( OBJ-AT ?auto_181842 ?auto_181846 ) ( TRUCK-AT ?auto_181845 ?auto_181839 ) ( not ( = ?auto_181844 ?auto_181841 ) ) ( IN-TRUCK ?auto_181844 ?auto_181845 ) ( not ( = ?auto_181840 ?auto_181844 ) ) ( not ( = ?auto_181842 ?auto_181844 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181841 ?auto_181840 ?auto_181839 )
      ( DELIVER-3PKG-VERIFY ?auto_181840 ?auto_181841 ?auto_181842 ?auto_181839 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181859 - OBJ
      ?auto_181860 - OBJ
      ?auto_181861 - OBJ
      ?auto_181858 - LOCATION
    )
    :vars
    (
      ?auto_181862 - LOCATION
      ?auto_181866 - CITY
      ?auto_181863 - OBJ
      ?auto_181865 - LOCATION
      ?auto_181864 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_181860 ?auto_181859 ) ) ( not ( = ?auto_181861 ?auto_181859 ) ) ( not ( = ?auto_181861 ?auto_181860 ) ) ( IN-CITY ?auto_181862 ?auto_181866 ) ( IN-CITY ?auto_181858 ?auto_181866 ) ( not ( = ?auto_181858 ?auto_181862 ) ) ( OBJ-AT ?auto_181861 ?auto_181858 ) ( OBJ-AT ?auto_181859 ?auto_181862 ) ( not ( = ?auto_181863 ?auto_181861 ) ) ( not ( = ?auto_181859 ?auto_181863 ) ) ( IN-CITY ?auto_181865 ?auto_181866 ) ( not ( = ?auto_181858 ?auto_181865 ) ) ( not ( = ?auto_181862 ?auto_181865 ) ) ( OBJ-AT ?auto_181863 ?auto_181865 ) ( TRUCK-AT ?auto_181864 ?auto_181858 ) ( IN-TRUCK ?auto_181860 ?auto_181864 ) ( not ( = ?auto_181863 ?auto_181860 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181861 ?auto_181859 ?auto_181858 )
      ( DELIVER-3PKG-VERIFY ?auto_181859 ?auto_181860 ?auto_181861 ?auto_181858 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181878 - OBJ
      ?auto_181879 - OBJ
      ?auto_181880 - OBJ
      ?auto_181877 - LOCATION
    )
    :vars
    (
      ?auto_181882 - OBJ
      ?auto_181881 - LOCATION
      ?auto_181885 - CITY
      ?auto_181884 - LOCATION
      ?auto_181883 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_181879 ?auto_181878 ) ) ( not ( = ?auto_181880 ?auto_181878 ) ) ( not ( = ?auto_181880 ?auto_181879 ) ) ( not ( = ?auto_181878 ?auto_181882 ) ) ( IN-CITY ?auto_181881 ?auto_181885 ) ( IN-CITY ?auto_181877 ?auto_181885 ) ( not ( = ?auto_181877 ?auto_181881 ) ) ( OBJ-AT ?auto_181882 ?auto_181877 ) ( OBJ-AT ?auto_181878 ?auto_181881 ) ( not ( = ?auto_181880 ?auto_181882 ) ) ( IN-CITY ?auto_181884 ?auto_181885 ) ( not ( = ?auto_181877 ?auto_181884 ) ) ( not ( = ?auto_181881 ?auto_181884 ) ) ( OBJ-AT ?auto_181880 ?auto_181884 ) ( TRUCK-AT ?auto_181883 ?auto_181877 ) ( not ( = ?auto_181879 ?auto_181882 ) ) ( IN-TRUCK ?auto_181879 ?auto_181883 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181882 ?auto_181878 ?auto_181877 )
      ( DELIVER-3PKG-VERIFY ?auto_181878 ?auto_181879 ?auto_181880 ?auto_181877 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181897 - OBJ
      ?auto_181898 - OBJ
      ?auto_181899 - OBJ
      ?auto_181896 - LOCATION
    )
    :vars
    (
      ?auto_181900 - LOCATION
      ?auto_181904 - CITY
      ?auto_181903 - LOCATION
      ?auto_181902 - TRUCK
      ?auto_181901 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_181898 ?auto_181897 ) ) ( not ( = ?auto_181899 ?auto_181897 ) ) ( not ( = ?auto_181899 ?auto_181898 ) ) ( IN-CITY ?auto_181900 ?auto_181904 ) ( IN-CITY ?auto_181896 ?auto_181904 ) ( not ( = ?auto_181896 ?auto_181900 ) ) ( OBJ-AT ?auto_181899 ?auto_181896 ) ( OBJ-AT ?auto_181897 ?auto_181900 ) ( IN-CITY ?auto_181903 ?auto_181904 ) ( not ( = ?auto_181896 ?auto_181903 ) ) ( not ( = ?auto_181900 ?auto_181903 ) ) ( OBJ-AT ?auto_181898 ?auto_181903 ) ( TRUCK-AT ?auto_181902 ?auto_181896 ) ( not ( = ?auto_181901 ?auto_181899 ) ) ( IN-TRUCK ?auto_181901 ?auto_181902 ) ( not ( = ?auto_181897 ?auto_181901 ) ) ( not ( = ?auto_181898 ?auto_181901 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181899 ?auto_181897 ?auto_181896 )
      ( DELIVER-3PKG-VERIFY ?auto_181897 ?auto_181898 ?auto_181899 ?auto_181896 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181906 - OBJ
      ?auto_181907 - OBJ
      ?auto_181908 - OBJ
      ?auto_181905 - LOCATION
    )
    :vars
    (
      ?auto_181910 - OBJ
      ?auto_181909 - LOCATION
      ?auto_181913 - CITY
      ?auto_181912 - LOCATION
      ?auto_181911 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_181907 ?auto_181906 ) ) ( not ( = ?auto_181908 ?auto_181906 ) ) ( not ( = ?auto_181908 ?auto_181907 ) ) ( not ( = ?auto_181906 ?auto_181910 ) ) ( IN-CITY ?auto_181909 ?auto_181913 ) ( IN-CITY ?auto_181905 ?auto_181913 ) ( not ( = ?auto_181905 ?auto_181909 ) ) ( OBJ-AT ?auto_181910 ?auto_181905 ) ( OBJ-AT ?auto_181906 ?auto_181909 ) ( not ( = ?auto_181907 ?auto_181910 ) ) ( IN-CITY ?auto_181912 ?auto_181913 ) ( not ( = ?auto_181905 ?auto_181912 ) ) ( not ( = ?auto_181909 ?auto_181912 ) ) ( OBJ-AT ?auto_181907 ?auto_181912 ) ( TRUCK-AT ?auto_181911 ?auto_181905 ) ( not ( = ?auto_181908 ?auto_181910 ) ) ( IN-TRUCK ?auto_181908 ?auto_181911 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181910 ?auto_181906 ?auto_181905 )
      ( DELIVER-3PKG-VERIFY ?auto_181906 ?auto_181907 ?auto_181908 ?auto_181905 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182069 - OBJ
      ?auto_182070 - OBJ
      ?auto_182071 - OBJ
      ?auto_182072 - OBJ
      ?auto_182068 - LOCATION
    )
    :vars
    (
      ?auto_182073 - LOCATION
      ?auto_182076 - CITY
      ?auto_182075 - LOCATION
      ?auto_182074 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_182070 ?auto_182069 ) ) ( not ( = ?auto_182071 ?auto_182069 ) ) ( not ( = ?auto_182071 ?auto_182070 ) ) ( not ( = ?auto_182072 ?auto_182069 ) ) ( not ( = ?auto_182072 ?auto_182070 ) ) ( not ( = ?auto_182072 ?auto_182071 ) ) ( IN-CITY ?auto_182073 ?auto_182076 ) ( IN-CITY ?auto_182068 ?auto_182076 ) ( not ( = ?auto_182068 ?auto_182073 ) ) ( OBJ-AT ?auto_182069 ?auto_182068 ) ( OBJ-AT ?auto_182072 ?auto_182073 ) ( IN-CITY ?auto_182075 ?auto_182076 ) ( not ( = ?auto_182068 ?auto_182075 ) ) ( not ( = ?auto_182073 ?auto_182075 ) ) ( OBJ-AT ?auto_182071 ?auto_182075 ) ( TRUCK-AT ?auto_182074 ?auto_182068 ) ( IN-TRUCK ?auto_182070 ?auto_182074 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182069 ?auto_182072 ?auto_182068 )
      ( DELIVER-4PKG-VERIFY ?auto_182069 ?auto_182070 ?auto_182071 ?auto_182072 ?auto_182068 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182098 - OBJ
      ?auto_182099 - OBJ
      ?auto_182100 - OBJ
      ?auto_182101 - OBJ
      ?auto_182097 - LOCATION
    )
    :vars
    (
      ?auto_182102 - LOCATION
      ?auto_182105 - CITY
      ?auto_182104 - LOCATION
      ?auto_182103 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_182099 ?auto_182098 ) ) ( not ( = ?auto_182100 ?auto_182098 ) ) ( not ( = ?auto_182100 ?auto_182099 ) ) ( not ( = ?auto_182101 ?auto_182098 ) ) ( not ( = ?auto_182101 ?auto_182099 ) ) ( not ( = ?auto_182101 ?auto_182100 ) ) ( IN-CITY ?auto_182102 ?auto_182105 ) ( IN-CITY ?auto_182097 ?auto_182105 ) ( not ( = ?auto_182097 ?auto_182102 ) ) ( OBJ-AT ?auto_182098 ?auto_182097 ) ( OBJ-AT ?auto_182100 ?auto_182102 ) ( IN-CITY ?auto_182104 ?auto_182105 ) ( not ( = ?auto_182097 ?auto_182104 ) ) ( not ( = ?auto_182102 ?auto_182104 ) ) ( OBJ-AT ?auto_182101 ?auto_182104 ) ( TRUCK-AT ?auto_182103 ?auto_182097 ) ( IN-TRUCK ?auto_182099 ?auto_182103 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182098 ?auto_182100 ?auto_182097 )
      ( DELIVER-4PKG-VERIFY ?auto_182098 ?auto_182099 ?auto_182100 ?auto_182101 ?auto_182097 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182127 - OBJ
      ?auto_182128 - OBJ
      ?auto_182129 - OBJ
      ?auto_182130 - OBJ
      ?auto_182126 - LOCATION
    )
    :vars
    (
      ?auto_182131 - LOCATION
      ?auto_182134 - CITY
      ?auto_182133 - LOCATION
      ?auto_182132 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_182128 ?auto_182127 ) ) ( not ( = ?auto_182129 ?auto_182127 ) ) ( not ( = ?auto_182129 ?auto_182128 ) ) ( not ( = ?auto_182130 ?auto_182127 ) ) ( not ( = ?auto_182130 ?auto_182128 ) ) ( not ( = ?auto_182130 ?auto_182129 ) ) ( IN-CITY ?auto_182131 ?auto_182134 ) ( IN-CITY ?auto_182126 ?auto_182134 ) ( not ( = ?auto_182126 ?auto_182131 ) ) ( OBJ-AT ?auto_182127 ?auto_182126 ) ( OBJ-AT ?auto_182130 ?auto_182131 ) ( IN-CITY ?auto_182133 ?auto_182134 ) ( not ( = ?auto_182126 ?auto_182133 ) ) ( not ( = ?auto_182131 ?auto_182133 ) ) ( OBJ-AT ?auto_182128 ?auto_182133 ) ( TRUCK-AT ?auto_182132 ?auto_182126 ) ( IN-TRUCK ?auto_182129 ?auto_182132 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182127 ?auto_182130 ?auto_182126 )
      ( DELIVER-4PKG-VERIFY ?auto_182127 ?auto_182128 ?auto_182129 ?auto_182130 ?auto_182126 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182156 - OBJ
      ?auto_182157 - OBJ
      ?auto_182158 - OBJ
      ?auto_182159 - OBJ
      ?auto_182155 - LOCATION
    )
    :vars
    (
      ?auto_182160 - LOCATION
      ?auto_182163 - CITY
      ?auto_182162 - LOCATION
      ?auto_182161 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_182157 ?auto_182156 ) ) ( not ( = ?auto_182158 ?auto_182156 ) ) ( not ( = ?auto_182158 ?auto_182157 ) ) ( not ( = ?auto_182159 ?auto_182156 ) ) ( not ( = ?auto_182159 ?auto_182157 ) ) ( not ( = ?auto_182159 ?auto_182158 ) ) ( IN-CITY ?auto_182160 ?auto_182163 ) ( IN-CITY ?auto_182155 ?auto_182163 ) ( not ( = ?auto_182155 ?auto_182160 ) ) ( OBJ-AT ?auto_182156 ?auto_182155 ) ( OBJ-AT ?auto_182158 ?auto_182160 ) ( IN-CITY ?auto_182162 ?auto_182163 ) ( not ( = ?auto_182155 ?auto_182162 ) ) ( not ( = ?auto_182160 ?auto_182162 ) ) ( OBJ-AT ?auto_182157 ?auto_182162 ) ( TRUCK-AT ?auto_182161 ?auto_182155 ) ( IN-TRUCK ?auto_182159 ?auto_182161 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182156 ?auto_182158 ?auto_182155 )
      ( DELIVER-4PKG-VERIFY ?auto_182156 ?auto_182157 ?auto_182158 ?auto_182159 ?auto_182155 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182247 - OBJ
      ?auto_182248 - OBJ
      ?auto_182249 - OBJ
      ?auto_182250 - OBJ
      ?auto_182246 - LOCATION
    )
    :vars
    (
      ?auto_182251 - LOCATION
      ?auto_182254 - CITY
      ?auto_182253 - LOCATION
      ?auto_182252 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_182248 ?auto_182247 ) ) ( not ( = ?auto_182249 ?auto_182247 ) ) ( not ( = ?auto_182249 ?auto_182248 ) ) ( not ( = ?auto_182250 ?auto_182247 ) ) ( not ( = ?auto_182250 ?auto_182248 ) ) ( not ( = ?auto_182250 ?auto_182249 ) ) ( IN-CITY ?auto_182251 ?auto_182254 ) ( IN-CITY ?auto_182246 ?auto_182254 ) ( not ( = ?auto_182246 ?auto_182251 ) ) ( OBJ-AT ?auto_182247 ?auto_182246 ) ( OBJ-AT ?auto_182248 ?auto_182251 ) ( IN-CITY ?auto_182253 ?auto_182254 ) ( not ( = ?auto_182246 ?auto_182253 ) ) ( not ( = ?auto_182251 ?auto_182253 ) ) ( OBJ-AT ?auto_182250 ?auto_182253 ) ( TRUCK-AT ?auto_182252 ?auto_182246 ) ( IN-TRUCK ?auto_182249 ?auto_182252 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182247 ?auto_182248 ?auto_182246 )
      ( DELIVER-4PKG-VERIFY ?auto_182247 ?auto_182248 ?auto_182249 ?auto_182250 ?auto_182246 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182276 - OBJ
      ?auto_182277 - OBJ
      ?auto_182278 - OBJ
      ?auto_182279 - OBJ
      ?auto_182275 - LOCATION
    )
    :vars
    (
      ?auto_182280 - LOCATION
      ?auto_182283 - CITY
      ?auto_182282 - LOCATION
      ?auto_182281 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_182277 ?auto_182276 ) ) ( not ( = ?auto_182278 ?auto_182276 ) ) ( not ( = ?auto_182278 ?auto_182277 ) ) ( not ( = ?auto_182279 ?auto_182276 ) ) ( not ( = ?auto_182279 ?auto_182277 ) ) ( not ( = ?auto_182279 ?auto_182278 ) ) ( IN-CITY ?auto_182280 ?auto_182283 ) ( IN-CITY ?auto_182275 ?auto_182283 ) ( not ( = ?auto_182275 ?auto_182280 ) ) ( OBJ-AT ?auto_182276 ?auto_182275 ) ( OBJ-AT ?auto_182277 ?auto_182280 ) ( IN-CITY ?auto_182282 ?auto_182283 ) ( not ( = ?auto_182275 ?auto_182282 ) ) ( not ( = ?auto_182280 ?auto_182282 ) ) ( OBJ-AT ?auto_182278 ?auto_182282 ) ( TRUCK-AT ?auto_182281 ?auto_182275 ) ( IN-TRUCK ?auto_182279 ?auto_182281 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182276 ?auto_182277 ?auto_182275 )
      ( DELIVER-4PKG-VERIFY ?auto_182276 ?auto_182277 ?auto_182278 ?auto_182279 ?auto_182275 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182367 - OBJ
      ?auto_182368 - OBJ
      ?auto_182369 - OBJ
      ?auto_182370 - OBJ
      ?auto_182366 - LOCATION
    )
    :vars
    (
      ?auto_182371 - LOCATION
      ?auto_182374 - CITY
      ?auto_182373 - LOCATION
      ?auto_182372 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_182368 ?auto_182367 ) ) ( not ( = ?auto_182369 ?auto_182367 ) ) ( not ( = ?auto_182369 ?auto_182368 ) ) ( not ( = ?auto_182370 ?auto_182367 ) ) ( not ( = ?auto_182370 ?auto_182368 ) ) ( not ( = ?auto_182370 ?auto_182369 ) ) ( IN-CITY ?auto_182371 ?auto_182374 ) ( IN-CITY ?auto_182366 ?auto_182374 ) ( not ( = ?auto_182366 ?auto_182371 ) ) ( OBJ-AT ?auto_182368 ?auto_182366 ) ( OBJ-AT ?auto_182370 ?auto_182371 ) ( IN-CITY ?auto_182373 ?auto_182374 ) ( not ( = ?auto_182366 ?auto_182373 ) ) ( not ( = ?auto_182371 ?auto_182373 ) ) ( OBJ-AT ?auto_182369 ?auto_182373 ) ( TRUCK-AT ?auto_182372 ?auto_182366 ) ( IN-TRUCK ?auto_182367 ?auto_182372 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182368 ?auto_182370 ?auto_182366 )
      ( DELIVER-4PKG-VERIFY ?auto_182367 ?auto_182368 ?auto_182369 ?auto_182370 ?auto_182366 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182396 - OBJ
      ?auto_182397 - OBJ
      ?auto_182398 - OBJ
      ?auto_182399 - OBJ
      ?auto_182395 - LOCATION
    )
    :vars
    (
      ?auto_182400 - LOCATION
      ?auto_182403 - CITY
      ?auto_182402 - LOCATION
      ?auto_182401 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_182397 ?auto_182396 ) ) ( not ( = ?auto_182398 ?auto_182396 ) ) ( not ( = ?auto_182398 ?auto_182397 ) ) ( not ( = ?auto_182399 ?auto_182396 ) ) ( not ( = ?auto_182399 ?auto_182397 ) ) ( not ( = ?auto_182399 ?auto_182398 ) ) ( IN-CITY ?auto_182400 ?auto_182403 ) ( IN-CITY ?auto_182395 ?auto_182403 ) ( not ( = ?auto_182395 ?auto_182400 ) ) ( OBJ-AT ?auto_182397 ?auto_182395 ) ( OBJ-AT ?auto_182398 ?auto_182400 ) ( IN-CITY ?auto_182402 ?auto_182403 ) ( not ( = ?auto_182395 ?auto_182402 ) ) ( not ( = ?auto_182400 ?auto_182402 ) ) ( OBJ-AT ?auto_182399 ?auto_182402 ) ( TRUCK-AT ?auto_182401 ?auto_182395 ) ( IN-TRUCK ?auto_182396 ?auto_182401 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182397 ?auto_182398 ?auto_182395 )
      ( DELIVER-4PKG-VERIFY ?auto_182396 ?auto_182397 ?auto_182398 ?auto_182399 ?auto_182395 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182488 - OBJ
      ?auto_182489 - OBJ
      ?auto_182490 - OBJ
      ?auto_182491 - OBJ
      ?auto_182487 - LOCATION
    )
    :vars
    (
      ?auto_182492 - LOCATION
      ?auto_182495 - CITY
      ?auto_182494 - LOCATION
      ?auto_182493 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_182489 ?auto_182488 ) ) ( not ( = ?auto_182490 ?auto_182488 ) ) ( not ( = ?auto_182490 ?auto_182489 ) ) ( not ( = ?auto_182491 ?auto_182488 ) ) ( not ( = ?auto_182491 ?auto_182489 ) ) ( not ( = ?auto_182491 ?auto_182490 ) ) ( IN-CITY ?auto_182492 ?auto_182495 ) ( IN-CITY ?auto_182487 ?auto_182495 ) ( not ( = ?auto_182487 ?auto_182492 ) ) ( OBJ-AT ?auto_182490 ?auto_182487 ) ( OBJ-AT ?auto_182491 ?auto_182492 ) ( IN-CITY ?auto_182494 ?auto_182495 ) ( not ( = ?auto_182487 ?auto_182494 ) ) ( not ( = ?auto_182492 ?auto_182494 ) ) ( OBJ-AT ?auto_182489 ?auto_182494 ) ( TRUCK-AT ?auto_182493 ?auto_182487 ) ( IN-TRUCK ?auto_182488 ?auto_182493 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182490 ?auto_182491 ?auto_182487 )
      ( DELIVER-4PKG-VERIFY ?auto_182488 ?auto_182489 ?auto_182490 ?auto_182491 ?auto_182487 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182517 - OBJ
      ?auto_182518 - OBJ
      ?auto_182519 - OBJ
      ?auto_182520 - OBJ
      ?auto_182516 - LOCATION
    )
    :vars
    (
      ?auto_182521 - LOCATION
      ?auto_182524 - CITY
      ?auto_182523 - LOCATION
      ?auto_182522 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_182518 ?auto_182517 ) ) ( not ( = ?auto_182519 ?auto_182517 ) ) ( not ( = ?auto_182519 ?auto_182518 ) ) ( not ( = ?auto_182520 ?auto_182517 ) ) ( not ( = ?auto_182520 ?auto_182518 ) ) ( not ( = ?auto_182520 ?auto_182519 ) ) ( IN-CITY ?auto_182521 ?auto_182524 ) ( IN-CITY ?auto_182516 ?auto_182524 ) ( not ( = ?auto_182516 ?auto_182521 ) ) ( OBJ-AT ?auto_182520 ?auto_182516 ) ( OBJ-AT ?auto_182519 ?auto_182521 ) ( IN-CITY ?auto_182523 ?auto_182524 ) ( not ( = ?auto_182516 ?auto_182523 ) ) ( not ( = ?auto_182521 ?auto_182523 ) ) ( OBJ-AT ?auto_182518 ?auto_182523 ) ( TRUCK-AT ?auto_182522 ?auto_182516 ) ( IN-TRUCK ?auto_182517 ?auto_182522 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182520 ?auto_182519 ?auto_182516 )
      ( DELIVER-4PKG-VERIFY ?auto_182517 ?auto_182518 ?auto_182519 ?auto_182520 ?auto_182516 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182576 - OBJ
      ?auto_182577 - OBJ
      ?auto_182578 - OBJ
      ?auto_182579 - OBJ
      ?auto_182575 - LOCATION
    )
    :vars
    (
      ?auto_182580 - LOCATION
      ?auto_182583 - CITY
      ?auto_182582 - LOCATION
      ?auto_182581 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_182577 ?auto_182576 ) ) ( not ( = ?auto_182578 ?auto_182576 ) ) ( not ( = ?auto_182578 ?auto_182577 ) ) ( not ( = ?auto_182579 ?auto_182576 ) ) ( not ( = ?auto_182579 ?auto_182577 ) ) ( not ( = ?auto_182579 ?auto_182578 ) ) ( IN-CITY ?auto_182580 ?auto_182583 ) ( IN-CITY ?auto_182575 ?auto_182583 ) ( not ( = ?auto_182575 ?auto_182580 ) ) ( OBJ-AT ?auto_182578 ?auto_182575 ) ( OBJ-AT ?auto_182577 ?auto_182580 ) ( IN-CITY ?auto_182582 ?auto_182583 ) ( not ( = ?auto_182575 ?auto_182582 ) ) ( not ( = ?auto_182580 ?auto_182582 ) ) ( OBJ-AT ?auto_182579 ?auto_182582 ) ( TRUCK-AT ?auto_182581 ?auto_182575 ) ( IN-TRUCK ?auto_182576 ?auto_182581 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182578 ?auto_182577 ?auto_182575 )
      ( DELIVER-4PKG-VERIFY ?auto_182576 ?auto_182577 ?auto_182578 ?auto_182579 ?auto_182575 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182637 - OBJ
      ?auto_182638 - OBJ
      ?auto_182639 - OBJ
      ?auto_182640 - OBJ
      ?auto_182636 - LOCATION
    )
    :vars
    (
      ?auto_182641 - LOCATION
      ?auto_182644 - CITY
      ?auto_182643 - LOCATION
      ?auto_182642 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_182638 ?auto_182637 ) ) ( not ( = ?auto_182639 ?auto_182637 ) ) ( not ( = ?auto_182639 ?auto_182638 ) ) ( not ( = ?auto_182640 ?auto_182637 ) ) ( not ( = ?auto_182640 ?auto_182638 ) ) ( not ( = ?auto_182640 ?auto_182639 ) ) ( IN-CITY ?auto_182641 ?auto_182644 ) ( IN-CITY ?auto_182636 ?auto_182644 ) ( not ( = ?auto_182636 ?auto_182641 ) ) ( OBJ-AT ?auto_182640 ?auto_182636 ) ( OBJ-AT ?auto_182638 ?auto_182641 ) ( IN-CITY ?auto_182643 ?auto_182644 ) ( not ( = ?auto_182636 ?auto_182643 ) ) ( not ( = ?auto_182641 ?auto_182643 ) ) ( OBJ-AT ?auto_182639 ?auto_182643 ) ( TRUCK-AT ?auto_182642 ?auto_182636 ) ( IN-TRUCK ?auto_182637 ?auto_182642 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182640 ?auto_182638 ?auto_182636 )
      ( DELIVER-4PKG-VERIFY ?auto_182637 ?auto_182638 ?auto_182639 ?auto_182640 ?auto_182636 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182728 - OBJ
      ?auto_182729 - OBJ
      ?auto_182730 - OBJ
      ?auto_182731 - OBJ
      ?auto_182727 - LOCATION
    )
    :vars
    (
      ?auto_182732 - LOCATION
      ?auto_182735 - CITY
      ?auto_182734 - LOCATION
      ?auto_182733 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_182729 ?auto_182728 ) ) ( not ( = ?auto_182730 ?auto_182728 ) ) ( not ( = ?auto_182730 ?auto_182729 ) ) ( not ( = ?auto_182731 ?auto_182728 ) ) ( not ( = ?auto_182731 ?auto_182729 ) ) ( not ( = ?auto_182731 ?auto_182730 ) ) ( IN-CITY ?auto_182732 ?auto_182735 ) ( IN-CITY ?auto_182727 ?auto_182735 ) ( not ( = ?auto_182727 ?auto_182732 ) ) ( OBJ-AT ?auto_182729 ?auto_182727 ) ( OBJ-AT ?auto_182731 ?auto_182732 ) ( IN-CITY ?auto_182734 ?auto_182735 ) ( not ( = ?auto_182727 ?auto_182734 ) ) ( not ( = ?auto_182732 ?auto_182734 ) ) ( OBJ-AT ?auto_182728 ?auto_182734 ) ( TRUCK-AT ?auto_182733 ?auto_182727 ) ( IN-TRUCK ?auto_182730 ?auto_182733 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182729 ?auto_182731 ?auto_182727 )
      ( DELIVER-4PKG-VERIFY ?auto_182728 ?auto_182729 ?auto_182730 ?auto_182731 ?auto_182727 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182757 - OBJ
      ?auto_182758 - OBJ
      ?auto_182759 - OBJ
      ?auto_182760 - OBJ
      ?auto_182756 - LOCATION
    )
    :vars
    (
      ?auto_182761 - LOCATION
      ?auto_182764 - CITY
      ?auto_182763 - LOCATION
      ?auto_182762 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_182758 ?auto_182757 ) ) ( not ( = ?auto_182759 ?auto_182757 ) ) ( not ( = ?auto_182759 ?auto_182758 ) ) ( not ( = ?auto_182760 ?auto_182757 ) ) ( not ( = ?auto_182760 ?auto_182758 ) ) ( not ( = ?auto_182760 ?auto_182759 ) ) ( IN-CITY ?auto_182761 ?auto_182764 ) ( IN-CITY ?auto_182756 ?auto_182764 ) ( not ( = ?auto_182756 ?auto_182761 ) ) ( OBJ-AT ?auto_182758 ?auto_182756 ) ( OBJ-AT ?auto_182759 ?auto_182761 ) ( IN-CITY ?auto_182763 ?auto_182764 ) ( not ( = ?auto_182756 ?auto_182763 ) ) ( not ( = ?auto_182761 ?auto_182763 ) ) ( OBJ-AT ?auto_182757 ?auto_182763 ) ( TRUCK-AT ?auto_182762 ?auto_182756 ) ( IN-TRUCK ?auto_182760 ?auto_182762 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182758 ?auto_182759 ?auto_182756 )
      ( DELIVER-4PKG-VERIFY ?auto_182757 ?auto_182758 ?auto_182759 ?auto_182760 ?auto_182756 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182786 - OBJ
      ?auto_182787 - OBJ
      ?auto_182788 - OBJ
      ?auto_182789 - OBJ
      ?auto_182785 - LOCATION
    )
    :vars
    (
      ?auto_182790 - LOCATION
      ?auto_182793 - CITY
      ?auto_182792 - LOCATION
      ?auto_182791 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_182787 ?auto_182786 ) ) ( not ( = ?auto_182788 ?auto_182786 ) ) ( not ( = ?auto_182788 ?auto_182787 ) ) ( not ( = ?auto_182789 ?auto_182786 ) ) ( not ( = ?auto_182789 ?auto_182787 ) ) ( not ( = ?auto_182789 ?auto_182788 ) ) ( IN-CITY ?auto_182790 ?auto_182793 ) ( IN-CITY ?auto_182785 ?auto_182793 ) ( not ( = ?auto_182785 ?auto_182790 ) ) ( OBJ-AT ?auto_182788 ?auto_182785 ) ( OBJ-AT ?auto_182789 ?auto_182790 ) ( IN-CITY ?auto_182792 ?auto_182793 ) ( not ( = ?auto_182785 ?auto_182792 ) ) ( not ( = ?auto_182790 ?auto_182792 ) ) ( OBJ-AT ?auto_182786 ?auto_182792 ) ( TRUCK-AT ?auto_182791 ?auto_182785 ) ( IN-TRUCK ?auto_182787 ?auto_182791 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182788 ?auto_182789 ?auto_182785 )
      ( DELIVER-4PKG-VERIFY ?auto_182786 ?auto_182787 ?auto_182788 ?auto_182789 ?auto_182785 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182815 - OBJ
      ?auto_182816 - OBJ
      ?auto_182817 - OBJ
      ?auto_182818 - OBJ
      ?auto_182814 - LOCATION
    )
    :vars
    (
      ?auto_182819 - LOCATION
      ?auto_182822 - CITY
      ?auto_182821 - LOCATION
      ?auto_182820 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_182816 ?auto_182815 ) ) ( not ( = ?auto_182817 ?auto_182815 ) ) ( not ( = ?auto_182817 ?auto_182816 ) ) ( not ( = ?auto_182818 ?auto_182815 ) ) ( not ( = ?auto_182818 ?auto_182816 ) ) ( not ( = ?auto_182818 ?auto_182817 ) ) ( IN-CITY ?auto_182819 ?auto_182822 ) ( IN-CITY ?auto_182814 ?auto_182822 ) ( not ( = ?auto_182814 ?auto_182819 ) ) ( OBJ-AT ?auto_182818 ?auto_182814 ) ( OBJ-AT ?auto_182817 ?auto_182819 ) ( IN-CITY ?auto_182821 ?auto_182822 ) ( not ( = ?auto_182814 ?auto_182821 ) ) ( not ( = ?auto_182819 ?auto_182821 ) ) ( OBJ-AT ?auto_182815 ?auto_182821 ) ( TRUCK-AT ?auto_182820 ?auto_182814 ) ( IN-TRUCK ?auto_182816 ?auto_182820 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182818 ?auto_182817 ?auto_182814 )
      ( DELIVER-4PKG-VERIFY ?auto_182815 ?auto_182816 ?auto_182817 ?auto_182818 ?auto_182814 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182937 - OBJ
      ?auto_182938 - OBJ
      ?auto_182939 - OBJ
      ?auto_182940 - OBJ
      ?auto_182936 - LOCATION
    )
    :vars
    (
      ?auto_182941 - LOCATION
      ?auto_182944 - CITY
      ?auto_182943 - LOCATION
      ?auto_182942 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_182938 ?auto_182937 ) ) ( not ( = ?auto_182939 ?auto_182937 ) ) ( not ( = ?auto_182939 ?auto_182938 ) ) ( not ( = ?auto_182940 ?auto_182937 ) ) ( not ( = ?auto_182940 ?auto_182938 ) ) ( not ( = ?auto_182940 ?auto_182939 ) ) ( IN-CITY ?auto_182941 ?auto_182944 ) ( IN-CITY ?auto_182936 ?auto_182944 ) ( not ( = ?auto_182936 ?auto_182941 ) ) ( OBJ-AT ?auto_182939 ?auto_182936 ) ( OBJ-AT ?auto_182938 ?auto_182941 ) ( IN-CITY ?auto_182943 ?auto_182944 ) ( not ( = ?auto_182936 ?auto_182943 ) ) ( not ( = ?auto_182941 ?auto_182943 ) ) ( OBJ-AT ?auto_182937 ?auto_182943 ) ( TRUCK-AT ?auto_182942 ?auto_182936 ) ( IN-TRUCK ?auto_182940 ?auto_182942 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182939 ?auto_182938 ?auto_182936 )
      ( DELIVER-4PKG-VERIFY ?auto_182937 ?auto_182938 ?auto_182939 ?auto_182940 ?auto_182936 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182966 - OBJ
      ?auto_182967 - OBJ
      ?auto_182968 - OBJ
      ?auto_182969 - OBJ
      ?auto_182965 - LOCATION
    )
    :vars
    (
      ?auto_182970 - LOCATION
      ?auto_182973 - CITY
      ?auto_182972 - LOCATION
      ?auto_182971 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_182967 ?auto_182966 ) ) ( not ( = ?auto_182968 ?auto_182966 ) ) ( not ( = ?auto_182968 ?auto_182967 ) ) ( not ( = ?auto_182969 ?auto_182966 ) ) ( not ( = ?auto_182969 ?auto_182967 ) ) ( not ( = ?auto_182969 ?auto_182968 ) ) ( IN-CITY ?auto_182970 ?auto_182973 ) ( IN-CITY ?auto_182965 ?auto_182973 ) ( not ( = ?auto_182965 ?auto_182970 ) ) ( OBJ-AT ?auto_182969 ?auto_182965 ) ( OBJ-AT ?auto_182967 ?auto_182970 ) ( IN-CITY ?auto_182972 ?auto_182973 ) ( not ( = ?auto_182965 ?auto_182972 ) ) ( not ( = ?auto_182970 ?auto_182972 ) ) ( OBJ-AT ?auto_182966 ?auto_182972 ) ( TRUCK-AT ?auto_182971 ?auto_182965 ) ( IN-TRUCK ?auto_182968 ?auto_182971 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182969 ?auto_182967 ?auto_182965 )
      ( DELIVER-4PKG-VERIFY ?auto_182966 ?auto_182967 ?auto_182968 ?auto_182969 ?auto_182965 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_183151 - OBJ
      ?auto_183152 - OBJ
      ?auto_183153 - OBJ
      ?auto_183154 - OBJ
      ?auto_183150 - LOCATION
    )
    :vars
    (
      ?auto_183155 - LOCATION
      ?auto_183158 - CITY
      ?auto_183157 - LOCATION
      ?auto_183156 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183152 ?auto_183151 ) ) ( not ( = ?auto_183153 ?auto_183151 ) ) ( not ( = ?auto_183153 ?auto_183152 ) ) ( not ( = ?auto_183154 ?auto_183151 ) ) ( not ( = ?auto_183154 ?auto_183152 ) ) ( not ( = ?auto_183154 ?auto_183153 ) ) ( IN-CITY ?auto_183155 ?auto_183158 ) ( IN-CITY ?auto_183150 ?auto_183158 ) ( not ( = ?auto_183150 ?auto_183155 ) ) ( OBJ-AT ?auto_183152 ?auto_183150 ) ( OBJ-AT ?auto_183151 ?auto_183155 ) ( IN-CITY ?auto_183157 ?auto_183158 ) ( not ( = ?auto_183150 ?auto_183157 ) ) ( not ( = ?auto_183155 ?auto_183157 ) ) ( OBJ-AT ?auto_183154 ?auto_183157 ) ( TRUCK-AT ?auto_183156 ?auto_183150 ) ( IN-TRUCK ?auto_183153 ?auto_183156 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183152 ?auto_183151 ?auto_183150 )
      ( DELIVER-4PKG-VERIFY ?auto_183151 ?auto_183152 ?auto_183153 ?auto_183154 ?auto_183150 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_183180 - OBJ
      ?auto_183181 - OBJ
      ?auto_183182 - OBJ
      ?auto_183183 - OBJ
      ?auto_183179 - LOCATION
    )
    :vars
    (
      ?auto_183184 - LOCATION
      ?auto_183187 - CITY
      ?auto_183186 - LOCATION
      ?auto_183185 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183181 ?auto_183180 ) ) ( not ( = ?auto_183182 ?auto_183180 ) ) ( not ( = ?auto_183182 ?auto_183181 ) ) ( not ( = ?auto_183183 ?auto_183180 ) ) ( not ( = ?auto_183183 ?auto_183181 ) ) ( not ( = ?auto_183183 ?auto_183182 ) ) ( IN-CITY ?auto_183184 ?auto_183187 ) ( IN-CITY ?auto_183179 ?auto_183187 ) ( not ( = ?auto_183179 ?auto_183184 ) ) ( OBJ-AT ?auto_183181 ?auto_183179 ) ( OBJ-AT ?auto_183180 ?auto_183184 ) ( IN-CITY ?auto_183186 ?auto_183187 ) ( not ( = ?auto_183179 ?auto_183186 ) ) ( not ( = ?auto_183184 ?auto_183186 ) ) ( OBJ-AT ?auto_183182 ?auto_183186 ) ( TRUCK-AT ?auto_183185 ?auto_183179 ) ( IN-TRUCK ?auto_183183 ?auto_183185 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183181 ?auto_183180 ?auto_183179 )
      ( DELIVER-4PKG-VERIFY ?auto_183180 ?auto_183181 ?auto_183182 ?auto_183183 ?auto_183179 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_183271 - OBJ
      ?auto_183272 - OBJ
      ?auto_183273 - OBJ
      ?auto_183274 - OBJ
      ?auto_183270 - LOCATION
    )
    :vars
    (
      ?auto_183275 - LOCATION
      ?auto_183278 - CITY
      ?auto_183277 - LOCATION
      ?auto_183276 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183272 ?auto_183271 ) ) ( not ( = ?auto_183273 ?auto_183271 ) ) ( not ( = ?auto_183273 ?auto_183272 ) ) ( not ( = ?auto_183274 ?auto_183271 ) ) ( not ( = ?auto_183274 ?auto_183272 ) ) ( not ( = ?auto_183274 ?auto_183273 ) ) ( IN-CITY ?auto_183275 ?auto_183278 ) ( IN-CITY ?auto_183270 ?auto_183278 ) ( not ( = ?auto_183270 ?auto_183275 ) ) ( OBJ-AT ?auto_183273 ?auto_183270 ) ( OBJ-AT ?auto_183271 ?auto_183275 ) ( IN-CITY ?auto_183277 ?auto_183278 ) ( not ( = ?auto_183270 ?auto_183277 ) ) ( not ( = ?auto_183275 ?auto_183277 ) ) ( OBJ-AT ?auto_183274 ?auto_183277 ) ( TRUCK-AT ?auto_183276 ?auto_183270 ) ( IN-TRUCK ?auto_183272 ?auto_183276 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183273 ?auto_183271 ?auto_183270 )
      ( DELIVER-4PKG-VERIFY ?auto_183271 ?auto_183272 ?auto_183273 ?auto_183274 ?auto_183270 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_183332 - OBJ
      ?auto_183333 - OBJ
      ?auto_183334 - OBJ
      ?auto_183335 - OBJ
      ?auto_183331 - LOCATION
    )
    :vars
    (
      ?auto_183336 - LOCATION
      ?auto_183339 - CITY
      ?auto_183338 - LOCATION
      ?auto_183337 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183333 ?auto_183332 ) ) ( not ( = ?auto_183334 ?auto_183332 ) ) ( not ( = ?auto_183334 ?auto_183333 ) ) ( not ( = ?auto_183335 ?auto_183332 ) ) ( not ( = ?auto_183335 ?auto_183333 ) ) ( not ( = ?auto_183335 ?auto_183334 ) ) ( IN-CITY ?auto_183336 ?auto_183339 ) ( IN-CITY ?auto_183331 ?auto_183339 ) ( not ( = ?auto_183331 ?auto_183336 ) ) ( OBJ-AT ?auto_183335 ?auto_183331 ) ( OBJ-AT ?auto_183332 ?auto_183336 ) ( IN-CITY ?auto_183338 ?auto_183339 ) ( not ( = ?auto_183331 ?auto_183338 ) ) ( not ( = ?auto_183336 ?auto_183338 ) ) ( OBJ-AT ?auto_183334 ?auto_183338 ) ( TRUCK-AT ?auto_183337 ?auto_183331 ) ( IN-TRUCK ?auto_183333 ?auto_183337 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183335 ?auto_183332 ?auto_183331 )
      ( DELIVER-4PKG-VERIFY ?auto_183332 ?auto_183333 ?auto_183334 ?auto_183335 ?auto_183331 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_183423 - OBJ
      ?auto_183424 - OBJ
      ?auto_183425 - OBJ
      ?auto_183426 - OBJ
      ?auto_183422 - LOCATION
    )
    :vars
    (
      ?auto_183427 - LOCATION
      ?auto_183430 - CITY
      ?auto_183429 - LOCATION
      ?auto_183428 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183424 ?auto_183423 ) ) ( not ( = ?auto_183425 ?auto_183423 ) ) ( not ( = ?auto_183425 ?auto_183424 ) ) ( not ( = ?auto_183426 ?auto_183423 ) ) ( not ( = ?auto_183426 ?auto_183424 ) ) ( not ( = ?auto_183426 ?auto_183425 ) ) ( IN-CITY ?auto_183427 ?auto_183430 ) ( IN-CITY ?auto_183422 ?auto_183430 ) ( not ( = ?auto_183422 ?auto_183427 ) ) ( OBJ-AT ?auto_183425 ?auto_183422 ) ( OBJ-AT ?auto_183423 ?auto_183427 ) ( IN-CITY ?auto_183429 ?auto_183430 ) ( not ( = ?auto_183422 ?auto_183429 ) ) ( not ( = ?auto_183427 ?auto_183429 ) ) ( OBJ-AT ?auto_183424 ?auto_183429 ) ( TRUCK-AT ?auto_183428 ?auto_183422 ) ( IN-TRUCK ?auto_183426 ?auto_183428 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183425 ?auto_183423 ?auto_183422 )
      ( DELIVER-4PKG-VERIFY ?auto_183423 ?auto_183424 ?auto_183425 ?auto_183426 ?auto_183422 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_183452 - OBJ
      ?auto_183453 - OBJ
      ?auto_183454 - OBJ
      ?auto_183455 - OBJ
      ?auto_183451 - LOCATION
    )
    :vars
    (
      ?auto_183456 - LOCATION
      ?auto_183459 - CITY
      ?auto_183458 - LOCATION
      ?auto_183457 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183453 ?auto_183452 ) ) ( not ( = ?auto_183454 ?auto_183452 ) ) ( not ( = ?auto_183454 ?auto_183453 ) ) ( not ( = ?auto_183455 ?auto_183452 ) ) ( not ( = ?auto_183455 ?auto_183453 ) ) ( not ( = ?auto_183455 ?auto_183454 ) ) ( IN-CITY ?auto_183456 ?auto_183459 ) ( IN-CITY ?auto_183451 ?auto_183459 ) ( not ( = ?auto_183451 ?auto_183456 ) ) ( OBJ-AT ?auto_183455 ?auto_183451 ) ( OBJ-AT ?auto_183452 ?auto_183456 ) ( IN-CITY ?auto_183458 ?auto_183459 ) ( not ( = ?auto_183451 ?auto_183458 ) ) ( not ( = ?auto_183456 ?auto_183458 ) ) ( OBJ-AT ?auto_183453 ?auto_183458 ) ( TRUCK-AT ?auto_183457 ?auto_183451 ) ( IN-TRUCK ?auto_183454 ?auto_183457 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183455 ?auto_183452 ?auto_183451 )
      ( DELIVER-4PKG-VERIFY ?auto_183452 ?auto_183453 ?auto_183454 ?auto_183455 ?auto_183451 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_183746 - OBJ
      ?auto_183745 - LOCATION
    )
    :vars
    (
      ?auto_183748 - OBJ
      ?auto_183747 - LOCATION
      ?auto_183753 - CITY
      ?auto_183750 - OBJ
      ?auto_183752 - LOCATION
      ?auto_183749 - OBJ
      ?auto_183751 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183746 ?auto_183748 ) ) ( IN-CITY ?auto_183747 ?auto_183753 ) ( IN-CITY ?auto_183745 ?auto_183753 ) ( not ( = ?auto_183745 ?auto_183747 ) ) ( OBJ-AT ?auto_183748 ?auto_183745 ) ( OBJ-AT ?auto_183746 ?auto_183747 ) ( not ( = ?auto_183750 ?auto_183748 ) ) ( not ( = ?auto_183746 ?auto_183750 ) ) ( IN-CITY ?auto_183752 ?auto_183753 ) ( not ( = ?auto_183745 ?auto_183752 ) ) ( not ( = ?auto_183747 ?auto_183752 ) ) ( OBJ-AT ?auto_183750 ?auto_183752 ) ( not ( = ?auto_183749 ?auto_183748 ) ) ( IN-TRUCK ?auto_183749 ?auto_183751 ) ( not ( = ?auto_183746 ?auto_183749 ) ) ( not ( = ?auto_183750 ?auto_183749 ) ) ( TRUCK-AT ?auto_183751 ?auto_183747 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_183751 ?auto_183747 ?auto_183745 ?auto_183753 )
      ( DELIVER-2PKG ?auto_183748 ?auto_183746 ?auto_183745 )
      ( DELIVER-1PKG-VERIFY ?auto_183746 ?auto_183745 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_183755 - OBJ
      ?auto_183756 - OBJ
      ?auto_183754 - LOCATION
    )
    :vars
    (
      ?auto_183757 - LOCATION
      ?auto_183762 - CITY
      ?auto_183758 - OBJ
      ?auto_183759 - LOCATION
      ?auto_183761 - OBJ
      ?auto_183760 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183756 ?auto_183755 ) ) ( IN-CITY ?auto_183757 ?auto_183762 ) ( IN-CITY ?auto_183754 ?auto_183762 ) ( not ( = ?auto_183754 ?auto_183757 ) ) ( OBJ-AT ?auto_183755 ?auto_183754 ) ( OBJ-AT ?auto_183756 ?auto_183757 ) ( not ( = ?auto_183758 ?auto_183755 ) ) ( not ( = ?auto_183756 ?auto_183758 ) ) ( IN-CITY ?auto_183759 ?auto_183762 ) ( not ( = ?auto_183754 ?auto_183759 ) ) ( not ( = ?auto_183757 ?auto_183759 ) ) ( OBJ-AT ?auto_183758 ?auto_183759 ) ( not ( = ?auto_183761 ?auto_183755 ) ) ( IN-TRUCK ?auto_183761 ?auto_183760 ) ( not ( = ?auto_183756 ?auto_183761 ) ) ( not ( = ?auto_183758 ?auto_183761 ) ) ( TRUCK-AT ?auto_183760 ?auto_183757 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_183756 ?auto_183754 )
      ( DELIVER-2PKG-VERIFY ?auto_183755 ?auto_183756 ?auto_183754 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_183764 - OBJ
      ?auto_183765 - OBJ
      ?auto_183763 - LOCATION
    )
    :vars
    (
      ?auto_183771 - OBJ
      ?auto_183770 - LOCATION
      ?auto_183766 - CITY
      ?auto_183768 - OBJ
      ?auto_183767 - LOCATION
      ?auto_183769 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183765 ?auto_183764 ) ) ( not ( = ?auto_183765 ?auto_183771 ) ) ( IN-CITY ?auto_183770 ?auto_183766 ) ( IN-CITY ?auto_183763 ?auto_183766 ) ( not ( = ?auto_183763 ?auto_183770 ) ) ( OBJ-AT ?auto_183771 ?auto_183763 ) ( OBJ-AT ?auto_183765 ?auto_183770 ) ( not ( = ?auto_183768 ?auto_183771 ) ) ( not ( = ?auto_183765 ?auto_183768 ) ) ( IN-CITY ?auto_183767 ?auto_183766 ) ( not ( = ?auto_183763 ?auto_183767 ) ) ( not ( = ?auto_183770 ?auto_183767 ) ) ( OBJ-AT ?auto_183768 ?auto_183767 ) ( not ( = ?auto_183764 ?auto_183771 ) ) ( IN-TRUCK ?auto_183764 ?auto_183769 ) ( not ( = ?auto_183768 ?auto_183764 ) ) ( TRUCK-AT ?auto_183769 ?auto_183770 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183771 ?auto_183765 ?auto_183763 )
      ( DELIVER-2PKG-VERIFY ?auto_183764 ?auto_183765 ?auto_183763 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_183773 - OBJ
      ?auto_183774 - OBJ
      ?auto_183772 - LOCATION
    )
    :vars
    (
      ?auto_183780 - OBJ
      ?auto_183779 - LOCATION
      ?auto_183775 - CITY
      ?auto_183776 - LOCATION
      ?auto_183777 - OBJ
      ?auto_183778 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183774 ?auto_183773 ) ) ( not ( = ?auto_183774 ?auto_183780 ) ) ( IN-CITY ?auto_183779 ?auto_183775 ) ( IN-CITY ?auto_183772 ?auto_183775 ) ( not ( = ?auto_183772 ?auto_183779 ) ) ( OBJ-AT ?auto_183780 ?auto_183772 ) ( OBJ-AT ?auto_183774 ?auto_183779 ) ( not ( = ?auto_183773 ?auto_183780 ) ) ( IN-CITY ?auto_183776 ?auto_183775 ) ( not ( = ?auto_183772 ?auto_183776 ) ) ( not ( = ?auto_183779 ?auto_183776 ) ) ( OBJ-AT ?auto_183773 ?auto_183776 ) ( not ( = ?auto_183777 ?auto_183780 ) ) ( IN-TRUCK ?auto_183777 ?auto_183778 ) ( not ( = ?auto_183774 ?auto_183777 ) ) ( not ( = ?auto_183773 ?auto_183777 ) ) ( TRUCK-AT ?auto_183778 ?auto_183779 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183780 ?auto_183774 ?auto_183772 )
      ( DELIVER-2PKG-VERIFY ?auto_183773 ?auto_183774 ?auto_183772 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_183782 - OBJ
      ?auto_183783 - OBJ
      ?auto_183781 - LOCATION
    )
    :vars
    (
      ?auto_183789 - LOCATION
      ?auto_183784 - CITY
      ?auto_183787 - OBJ
      ?auto_183785 - LOCATION
      ?auto_183786 - OBJ
      ?auto_183788 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183783 ?auto_183782 ) ) ( IN-CITY ?auto_183789 ?auto_183784 ) ( IN-CITY ?auto_183781 ?auto_183784 ) ( not ( = ?auto_183781 ?auto_183789 ) ) ( OBJ-AT ?auto_183783 ?auto_183781 ) ( OBJ-AT ?auto_183782 ?auto_183789 ) ( not ( = ?auto_183787 ?auto_183783 ) ) ( not ( = ?auto_183782 ?auto_183787 ) ) ( IN-CITY ?auto_183785 ?auto_183784 ) ( not ( = ?auto_183781 ?auto_183785 ) ) ( not ( = ?auto_183789 ?auto_183785 ) ) ( OBJ-AT ?auto_183787 ?auto_183785 ) ( not ( = ?auto_183786 ?auto_183783 ) ) ( IN-TRUCK ?auto_183786 ?auto_183788 ) ( not ( = ?auto_183782 ?auto_183786 ) ) ( not ( = ?auto_183787 ?auto_183786 ) ) ( TRUCK-AT ?auto_183788 ?auto_183789 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183783 ?auto_183782 ?auto_183781 )
      ( DELIVER-2PKG-VERIFY ?auto_183782 ?auto_183783 ?auto_183781 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_183791 - OBJ
      ?auto_183792 - OBJ
      ?auto_183790 - LOCATION
    )
    :vars
    (
      ?auto_183798 - OBJ
      ?auto_183797 - LOCATION
      ?auto_183793 - CITY
      ?auto_183795 - OBJ
      ?auto_183794 - LOCATION
      ?auto_183796 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183792 ?auto_183791 ) ) ( not ( = ?auto_183791 ?auto_183798 ) ) ( IN-CITY ?auto_183797 ?auto_183793 ) ( IN-CITY ?auto_183790 ?auto_183793 ) ( not ( = ?auto_183790 ?auto_183797 ) ) ( OBJ-AT ?auto_183798 ?auto_183790 ) ( OBJ-AT ?auto_183791 ?auto_183797 ) ( not ( = ?auto_183795 ?auto_183798 ) ) ( not ( = ?auto_183791 ?auto_183795 ) ) ( IN-CITY ?auto_183794 ?auto_183793 ) ( not ( = ?auto_183790 ?auto_183794 ) ) ( not ( = ?auto_183797 ?auto_183794 ) ) ( OBJ-AT ?auto_183795 ?auto_183794 ) ( not ( = ?auto_183792 ?auto_183798 ) ) ( IN-TRUCK ?auto_183792 ?auto_183796 ) ( not ( = ?auto_183795 ?auto_183792 ) ) ( TRUCK-AT ?auto_183796 ?auto_183797 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183798 ?auto_183791 ?auto_183790 )
      ( DELIVER-2PKG-VERIFY ?auto_183791 ?auto_183792 ?auto_183790 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_183800 - OBJ
      ?auto_183801 - OBJ
      ?auto_183799 - LOCATION
    )
    :vars
    (
      ?auto_183807 - OBJ
      ?auto_183806 - LOCATION
      ?auto_183802 - CITY
      ?auto_183803 - LOCATION
      ?auto_183804 - OBJ
      ?auto_183805 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183801 ?auto_183800 ) ) ( not ( = ?auto_183800 ?auto_183807 ) ) ( IN-CITY ?auto_183806 ?auto_183802 ) ( IN-CITY ?auto_183799 ?auto_183802 ) ( not ( = ?auto_183799 ?auto_183806 ) ) ( OBJ-AT ?auto_183807 ?auto_183799 ) ( OBJ-AT ?auto_183800 ?auto_183806 ) ( not ( = ?auto_183801 ?auto_183807 ) ) ( IN-CITY ?auto_183803 ?auto_183802 ) ( not ( = ?auto_183799 ?auto_183803 ) ) ( not ( = ?auto_183806 ?auto_183803 ) ) ( OBJ-AT ?auto_183801 ?auto_183803 ) ( not ( = ?auto_183804 ?auto_183807 ) ) ( IN-TRUCK ?auto_183804 ?auto_183805 ) ( not ( = ?auto_183800 ?auto_183804 ) ) ( not ( = ?auto_183801 ?auto_183804 ) ) ( TRUCK-AT ?auto_183805 ?auto_183806 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183807 ?auto_183800 ?auto_183799 )
      ( DELIVER-2PKG-VERIFY ?auto_183800 ?auto_183801 ?auto_183799 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_183829 - OBJ
      ?auto_183830 - OBJ
      ?auto_183831 - OBJ
      ?auto_183828 - LOCATION
    )
    :vars
    (
      ?auto_183836 - LOCATION
      ?auto_183832 - CITY
      ?auto_183834 - OBJ
      ?auto_183833 - LOCATION
      ?auto_183835 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183830 ?auto_183829 ) ) ( not ( = ?auto_183831 ?auto_183829 ) ) ( not ( = ?auto_183831 ?auto_183830 ) ) ( IN-CITY ?auto_183836 ?auto_183832 ) ( IN-CITY ?auto_183828 ?auto_183832 ) ( not ( = ?auto_183828 ?auto_183836 ) ) ( OBJ-AT ?auto_183829 ?auto_183828 ) ( OBJ-AT ?auto_183831 ?auto_183836 ) ( not ( = ?auto_183834 ?auto_183829 ) ) ( not ( = ?auto_183831 ?auto_183834 ) ) ( IN-CITY ?auto_183833 ?auto_183832 ) ( not ( = ?auto_183828 ?auto_183833 ) ) ( not ( = ?auto_183836 ?auto_183833 ) ) ( OBJ-AT ?auto_183834 ?auto_183833 ) ( IN-TRUCK ?auto_183830 ?auto_183835 ) ( not ( = ?auto_183834 ?auto_183830 ) ) ( TRUCK-AT ?auto_183835 ?auto_183836 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183829 ?auto_183831 ?auto_183828 )
      ( DELIVER-3PKG-VERIFY ?auto_183829 ?auto_183830 ?auto_183831 ?auto_183828 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_183838 - OBJ
      ?auto_183839 - OBJ
      ?auto_183840 - OBJ
      ?auto_183837 - LOCATION
    )
    :vars
    (
      ?auto_183845 - LOCATION
      ?auto_183841 - CITY
      ?auto_183842 - LOCATION
      ?auto_183843 - OBJ
      ?auto_183844 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183839 ?auto_183838 ) ) ( not ( = ?auto_183840 ?auto_183838 ) ) ( not ( = ?auto_183840 ?auto_183839 ) ) ( IN-CITY ?auto_183845 ?auto_183841 ) ( IN-CITY ?auto_183837 ?auto_183841 ) ( not ( = ?auto_183837 ?auto_183845 ) ) ( OBJ-AT ?auto_183838 ?auto_183837 ) ( OBJ-AT ?auto_183840 ?auto_183845 ) ( IN-CITY ?auto_183842 ?auto_183841 ) ( not ( = ?auto_183837 ?auto_183842 ) ) ( not ( = ?auto_183845 ?auto_183842 ) ) ( OBJ-AT ?auto_183839 ?auto_183842 ) ( not ( = ?auto_183843 ?auto_183838 ) ) ( IN-TRUCK ?auto_183843 ?auto_183844 ) ( not ( = ?auto_183840 ?auto_183843 ) ) ( not ( = ?auto_183839 ?auto_183843 ) ) ( TRUCK-AT ?auto_183844 ?auto_183845 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183838 ?auto_183840 ?auto_183837 )
      ( DELIVER-3PKG-VERIFY ?auto_183838 ?auto_183839 ?auto_183840 ?auto_183837 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_183857 - OBJ
      ?auto_183858 - OBJ
      ?auto_183859 - OBJ
      ?auto_183856 - LOCATION
    )
    :vars
    (
      ?auto_183864 - LOCATION
      ?auto_183860 - CITY
      ?auto_183862 - OBJ
      ?auto_183861 - LOCATION
      ?auto_183863 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183858 ?auto_183857 ) ) ( not ( = ?auto_183859 ?auto_183857 ) ) ( not ( = ?auto_183859 ?auto_183858 ) ) ( IN-CITY ?auto_183864 ?auto_183860 ) ( IN-CITY ?auto_183856 ?auto_183860 ) ( not ( = ?auto_183856 ?auto_183864 ) ) ( OBJ-AT ?auto_183857 ?auto_183856 ) ( OBJ-AT ?auto_183858 ?auto_183864 ) ( not ( = ?auto_183862 ?auto_183857 ) ) ( not ( = ?auto_183858 ?auto_183862 ) ) ( IN-CITY ?auto_183861 ?auto_183860 ) ( not ( = ?auto_183856 ?auto_183861 ) ) ( not ( = ?auto_183864 ?auto_183861 ) ) ( OBJ-AT ?auto_183862 ?auto_183861 ) ( IN-TRUCK ?auto_183859 ?auto_183863 ) ( not ( = ?auto_183862 ?auto_183859 ) ) ( TRUCK-AT ?auto_183863 ?auto_183864 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183857 ?auto_183858 ?auto_183856 )
      ( DELIVER-3PKG-VERIFY ?auto_183857 ?auto_183858 ?auto_183859 ?auto_183856 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_183866 - OBJ
      ?auto_183867 - OBJ
      ?auto_183868 - OBJ
      ?auto_183865 - LOCATION
    )
    :vars
    (
      ?auto_183873 - LOCATION
      ?auto_183869 - CITY
      ?auto_183870 - LOCATION
      ?auto_183871 - OBJ
      ?auto_183872 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183867 ?auto_183866 ) ) ( not ( = ?auto_183868 ?auto_183866 ) ) ( not ( = ?auto_183868 ?auto_183867 ) ) ( IN-CITY ?auto_183873 ?auto_183869 ) ( IN-CITY ?auto_183865 ?auto_183869 ) ( not ( = ?auto_183865 ?auto_183873 ) ) ( OBJ-AT ?auto_183866 ?auto_183865 ) ( OBJ-AT ?auto_183867 ?auto_183873 ) ( IN-CITY ?auto_183870 ?auto_183869 ) ( not ( = ?auto_183865 ?auto_183870 ) ) ( not ( = ?auto_183873 ?auto_183870 ) ) ( OBJ-AT ?auto_183868 ?auto_183870 ) ( not ( = ?auto_183871 ?auto_183866 ) ) ( IN-TRUCK ?auto_183871 ?auto_183872 ) ( not ( = ?auto_183867 ?auto_183871 ) ) ( not ( = ?auto_183868 ?auto_183871 ) ) ( TRUCK-AT ?auto_183872 ?auto_183873 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183866 ?auto_183867 ?auto_183865 )
      ( DELIVER-3PKG-VERIFY ?auto_183866 ?auto_183867 ?auto_183868 ?auto_183865 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_183885 - OBJ
      ?auto_183886 - OBJ
      ?auto_183887 - OBJ
      ?auto_183884 - LOCATION
    )
    :vars
    (
      ?auto_183892 - LOCATION
      ?auto_183888 - CITY
      ?auto_183890 - OBJ
      ?auto_183889 - LOCATION
      ?auto_183891 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183886 ?auto_183885 ) ) ( not ( = ?auto_183887 ?auto_183885 ) ) ( not ( = ?auto_183887 ?auto_183886 ) ) ( IN-CITY ?auto_183892 ?auto_183888 ) ( IN-CITY ?auto_183884 ?auto_183888 ) ( not ( = ?auto_183884 ?auto_183892 ) ) ( OBJ-AT ?auto_183886 ?auto_183884 ) ( OBJ-AT ?auto_183887 ?auto_183892 ) ( not ( = ?auto_183890 ?auto_183886 ) ) ( not ( = ?auto_183887 ?auto_183890 ) ) ( IN-CITY ?auto_183889 ?auto_183888 ) ( not ( = ?auto_183884 ?auto_183889 ) ) ( not ( = ?auto_183892 ?auto_183889 ) ) ( OBJ-AT ?auto_183890 ?auto_183889 ) ( IN-TRUCK ?auto_183885 ?auto_183891 ) ( not ( = ?auto_183890 ?auto_183885 ) ) ( TRUCK-AT ?auto_183891 ?auto_183892 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183886 ?auto_183887 ?auto_183884 )
      ( DELIVER-3PKG-VERIFY ?auto_183885 ?auto_183886 ?auto_183887 ?auto_183884 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_183904 - OBJ
      ?auto_183905 - OBJ
      ?auto_183906 - OBJ
      ?auto_183903 - LOCATION
    )
    :vars
    (
      ?auto_183911 - OBJ
      ?auto_183910 - LOCATION
      ?auto_183907 - CITY
      ?auto_183908 - LOCATION
      ?auto_183909 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183905 ?auto_183904 ) ) ( not ( = ?auto_183906 ?auto_183904 ) ) ( not ( = ?auto_183906 ?auto_183905 ) ) ( not ( = ?auto_183906 ?auto_183911 ) ) ( IN-CITY ?auto_183910 ?auto_183907 ) ( IN-CITY ?auto_183903 ?auto_183907 ) ( not ( = ?auto_183903 ?auto_183910 ) ) ( OBJ-AT ?auto_183911 ?auto_183903 ) ( OBJ-AT ?auto_183906 ?auto_183910 ) ( not ( = ?auto_183905 ?auto_183911 ) ) ( IN-CITY ?auto_183908 ?auto_183907 ) ( not ( = ?auto_183903 ?auto_183908 ) ) ( not ( = ?auto_183910 ?auto_183908 ) ) ( OBJ-AT ?auto_183905 ?auto_183908 ) ( not ( = ?auto_183904 ?auto_183911 ) ) ( IN-TRUCK ?auto_183904 ?auto_183909 ) ( TRUCK-AT ?auto_183909 ?auto_183910 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183911 ?auto_183906 ?auto_183903 )
      ( DELIVER-3PKG-VERIFY ?auto_183904 ?auto_183905 ?auto_183906 ?auto_183903 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_183913 - OBJ
      ?auto_183914 - OBJ
      ?auto_183915 - OBJ
      ?auto_183912 - LOCATION
    )
    :vars
    (
      ?auto_183920 - LOCATION
      ?auto_183916 - CITY
      ?auto_183918 - OBJ
      ?auto_183917 - LOCATION
      ?auto_183919 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183914 ?auto_183913 ) ) ( not ( = ?auto_183915 ?auto_183913 ) ) ( not ( = ?auto_183915 ?auto_183914 ) ) ( IN-CITY ?auto_183920 ?auto_183916 ) ( IN-CITY ?auto_183912 ?auto_183916 ) ( not ( = ?auto_183912 ?auto_183920 ) ) ( OBJ-AT ?auto_183915 ?auto_183912 ) ( OBJ-AT ?auto_183914 ?auto_183920 ) ( not ( = ?auto_183918 ?auto_183915 ) ) ( not ( = ?auto_183914 ?auto_183918 ) ) ( IN-CITY ?auto_183917 ?auto_183916 ) ( not ( = ?auto_183912 ?auto_183917 ) ) ( not ( = ?auto_183920 ?auto_183917 ) ) ( OBJ-AT ?auto_183918 ?auto_183917 ) ( IN-TRUCK ?auto_183913 ?auto_183919 ) ( not ( = ?auto_183918 ?auto_183913 ) ) ( TRUCK-AT ?auto_183919 ?auto_183920 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183915 ?auto_183914 ?auto_183912 )
      ( DELIVER-3PKG-VERIFY ?auto_183913 ?auto_183914 ?auto_183915 ?auto_183912 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_183932 - OBJ
      ?auto_183933 - OBJ
      ?auto_183934 - OBJ
      ?auto_183931 - LOCATION
    )
    :vars
    (
      ?auto_183939 - OBJ
      ?auto_183938 - LOCATION
      ?auto_183935 - CITY
      ?auto_183936 - LOCATION
      ?auto_183937 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183933 ?auto_183932 ) ) ( not ( = ?auto_183934 ?auto_183932 ) ) ( not ( = ?auto_183934 ?auto_183933 ) ) ( not ( = ?auto_183933 ?auto_183939 ) ) ( IN-CITY ?auto_183938 ?auto_183935 ) ( IN-CITY ?auto_183931 ?auto_183935 ) ( not ( = ?auto_183931 ?auto_183938 ) ) ( OBJ-AT ?auto_183939 ?auto_183931 ) ( OBJ-AT ?auto_183933 ?auto_183938 ) ( not ( = ?auto_183934 ?auto_183939 ) ) ( IN-CITY ?auto_183936 ?auto_183935 ) ( not ( = ?auto_183931 ?auto_183936 ) ) ( not ( = ?auto_183938 ?auto_183936 ) ) ( OBJ-AT ?auto_183934 ?auto_183936 ) ( not ( = ?auto_183932 ?auto_183939 ) ) ( IN-TRUCK ?auto_183932 ?auto_183937 ) ( TRUCK-AT ?auto_183937 ?auto_183938 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183939 ?auto_183933 ?auto_183931 )
      ( DELIVER-3PKG-VERIFY ?auto_183932 ?auto_183933 ?auto_183934 ?auto_183931 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_183951 - OBJ
      ?auto_183952 - OBJ
      ?auto_183953 - OBJ
      ?auto_183950 - LOCATION
    )
    :vars
    (
      ?auto_183958 - LOCATION
      ?auto_183954 - CITY
      ?auto_183955 - LOCATION
      ?auto_183956 - OBJ
      ?auto_183957 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183952 ?auto_183951 ) ) ( not ( = ?auto_183953 ?auto_183951 ) ) ( not ( = ?auto_183953 ?auto_183952 ) ) ( IN-CITY ?auto_183958 ?auto_183954 ) ( IN-CITY ?auto_183950 ?auto_183954 ) ( not ( = ?auto_183950 ?auto_183958 ) ) ( OBJ-AT ?auto_183952 ?auto_183950 ) ( OBJ-AT ?auto_183953 ?auto_183958 ) ( IN-CITY ?auto_183955 ?auto_183954 ) ( not ( = ?auto_183950 ?auto_183955 ) ) ( not ( = ?auto_183958 ?auto_183955 ) ) ( OBJ-AT ?auto_183951 ?auto_183955 ) ( not ( = ?auto_183956 ?auto_183952 ) ) ( IN-TRUCK ?auto_183956 ?auto_183957 ) ( not ( = ?auto_183953 ?auto_183956 ) ) ( not ( = ?auto_183951 ?auto_183956 ) ) ( TRUCK-AT ?auto_183957 ?auto_183958 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183952 ?auto_183953 ?auto_183950 )
      ( DELIVER-3PKG-VERIFY ?auto_183951 ?auto_183952 ?auto_183953 ?auto_183950 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_183960 - OBJ
      ?auto_183961 - OBJ
      ?auto_183962 - OBJ
      ?auto_183959 - LOCATION
    )
    :vars
    (
      ?auto_183967 - OBJ
      ?auto_183966 - LOCATION
      ?auto_183963 - CITY
      ?auto_183964 - LOCATION
      ?auto_183965 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183961 ?auto_183960 ) ) ( not ( = ?auto_183962 ?auto_183960 ) ) ( not ( = ?auto_183962 ?auto_183961 ) ) ( not ( = ?auto_183962 ?auto_183967 ) ) ( IN-CITY ?auto_183966 ?auto_183963 ) ( IN-CITY ?auto_183959 ?auto_183963 ) ( not ( = ?auto_183959 ?auto_183966 ) ) ( OBJ-AT ?auto_183967 ?auto_183959 ) ( OBJ-AT ?auto_183962 ?auto_183966 ) ( not ( = ?auto_183960 ?auto_183967 ) ) ( IN-CITY ?auto_183964 ?auto_183963 ) ( not ( = ?auto_183959 ?auto_183964 ) ) ( not ( = ?auto_183966 ?auto_183964 ) ) ( OBJ-AT ?auto_183960 ?auto_183964 ) ( not ( = ?auto_183961 ?auto_183967 ) ) ( IN-TRUCK ?auto_183961 ?auto_183965 ) ( TRUCK-AT ?auto_183965 ?auto_183966 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183967 ?auto_183962 ?auto_183959 )
      ( DELIVER-3PKG-VERIFY ?auto_183960 ?auto_183961 ?auto_183962 ?auto_183959 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_183979 - OBJ
      ?auto_183980 - OBJ
      ?auto_183981 - OBJ
      ?auto_183978 - LOCATION
    )
    :vars
    (
      ?auto_183986 - LOCATION
      ?auto_183982 - CITY
      ?auto_183983 - LOCATION
      ?auto_183984 - OBJ
      ?auto_183985 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183980 ?auto_183979 ) ) ( not ( = ?auto_183981 ?auto_183979 ) ) ( not ( = ?auto_183981 ?auto_183980 ) ) ( IN-CITY ?auto_183986 ?auto_183982 ) ( IN-CITY ?auto_183978 ?auto_183982 ) ( not ( = ?auto_183978 ?auto_183986 ) ) ( OBJ-AT ?auto_183981 ?auto_183978 ) ( OBJ-AT ?auto_183980 ?auto_183986 ) ( IN-CITY ?auto_183983 ?auto_183982 ) ( not ( = ?auto_183978 ?auto_183983 ) ) ( not ( = ?auto_183986 ?auto_183983 ) ) ( OBJ-AT ?auto_183979 ?auto_183983 ) ( not ( = ?auto_183984 ?auto_183981 ) ) ( IN-TRUCK ?auto_183984 ?auto_183985 ) ( not ( = ?auto_183980 ?auto_183984 ) ) ( not ( = ?auto_183979 ?auto_183984 ) ) ( TRUCK-AT ?auto_183985 ?auto_183986 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183981 ?auto_183980 ?auto_183978 )
      ( DELIVER-3PKG-VERIFY ?auto_183979 ?auto_183980 ?auto_183981 ?auto_183978 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_183988 - OBJ
      ?auto_183989 - OBJ
      ?auto_183990 - OBJ
      ?auto_183987 - LOCATION
    )
    :vars
    (
      ?auto_183995 - OBJ
      ?auto_183994 - LOCATION
      ?auto_183991 - CITY
      ?auto_183992 - LOCATION
      ?auto_183993 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_183989 ?auto_183988 ) ) ( not ( = ?auto_183990 ?auto_183988 ) ) ( not ( = ?auto_183990 ?auto_183989 ) ) ( not ( = ?auto_183989 ?auto_183995 ) ) ( IN-CITY ?auto_183994 ?auto_183991 ) ( IN-CITY ?auto_183987 ?auto_183991 ) ( not ( = ?auto_183987 ?auto_183994 ) ) ( OBJ-AT ?auto_183995 ?auto_183987 ) ( OBJ-AT ?auto_183989 ?auto_183994 ) ( not ( = ?auto_183988 ?auto_183995 ) ) ( IN-CITY ?auto_183992 ?auto_183991 ) ( not ( = ?auto_183987 ?auto_183992 ) ) ( not ( = ?auto_183994 ?auto_183992 ) ) ( OBJ-AT ?auto_183988 ?auto_183992 ) ( not ( = ?auto_183990 ?auto_183995 ) ) ( IN-TRUCK ?auto_183990 ?auto_183993 ) ( TRUCK-AT ?auto_183993 ?auto_183994 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183995 ?auto_183989 ?auto_183987 )
      ( DELIVER-3PKG-VERIFY ?auto_183988 ?auto_183989 ?auto_183990 ?auto_183987 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_184027 - OBJ
      ?auto_184028 - OBJ
      ?auto_184029 - OBJ
      ?auto_184026 - LOCATION
    )
    :vars
    (
      ?auto_184034 - LOCATION
      ?auto_184030 - CITY
      ?auto_184032 - OBJ
      ?auto_184031 - LOCATION
      ?auto_184033 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_184028 ?auto_184027 ) ) ( not ( = ?auto_184029 ?auto_184027 ) ) ( not ( = ?auto_184029 ?auto_184028 ) ) ( IN-CITY ?auto_184034 ?auto_184030 ) ( IN-CITY ?auto_184026 ?auto_184030 ) ( not ( = ?auto_184026 ?auto_184034 ) ) ( OBJ-AT ?auto_184028 ?auto_184026 ) ( OBJ-AT ?auto_184027 ?auto_184034 ) ( not ( = ?auto_184032 ?auto_184028 ) ) ( not ( = ?auto_184027 ?auto_184032 ) ) ( IN-CITY ?auto_184031 ?auto_184030 ) ( not ( = ?auto_184026 ?auto_184031 ) ) ( not ( = ?auto_184034 ?auto_184031 ) ) ( OBJ-AT ?auto_184032 ?auto_184031 ) ( IN-TRUCK ?auto_184029 ?auto_184033 ) ( not ( = ?auto_184032 ?auto_184029 ) ) ( TRUCK-AT ?auto_184033 ?auto_184034 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184028 ?auto_184027 ?auto_184026 )
      ( DELIVER-3PKG-VERIFY ?auto_184027 ?auto_184028 ?auto_184029 ?auto_184026 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_184036 - OBJ
      ?auto_184037 - OBJ
      ?auto_184038 - OBJ
      ?auto_184035 - LOCATION
    )
    :vars
    (
      ?auto_184043 - LOCATION
      ?auto_184039 - CITY
      ?auto_184040 - LOCATION
      ?auto_184041 - OBJ
      ?auto_184042 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_184037 ?auto_184036 ) ) ( not ( = ?auto_184038 ?auto_184036 ) ) ( not ( = ?auto_184038 ?auto_184037 ) ) ( IN-CITY ?auto_184043 ?auto_184039 ) ( IN-CITY ?auto_184035 ?auto_184039 ) ( not ( = ?auto_184035 ?auto_184043 ) ) ( OBJ-AT ?auto_184037 ?auto_184035 ) ( OBJ-AT ?auto_184036 ?auto_184043 ) ( IN-CITY ?auto_184040 ?auto_184039 ) ( not ( = ?auto_184035 ?auto_184040 ) ) ( not ( = ?auto_184043 ?auto_184040 ) ) ( OBJ-AT ?auto_184038 ?auto_184040 ) ( not ( = ?auto_184041 ?auto_184037 ) ) ( IN-TRUCK ?auto_184041 ?auto_184042 ) ( not ( = ?auto_184036 ?auto_184041 ) ) ( not ( = ?auto_184038 ?auto_184041 ) ) ( TRUCK-AT ?auto_184042 ?auto_184043 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184037 ?auto_184036 ?auto_184035 )
      ( DELIVER-3PKG-VERIFY ?auto_184036 ?auto_184037 ?auto_184038 ?auto_184035 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_184055 - OBJ
      ?auto_184056 - OBJ
      ?auto_184057 - OBJ
      ?auto_184054 - LOCATION
    )
    :vars
    (
      ?auto_184062 - LOCATION
      ?auto_184058 - CITY
      ?auto_184060 - OBJ
      ?auto_184059 - LOCATION
      ?auto_184061 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_184056 ?auto_184055 ) ) ( not ( = ?auto_184057 ?auto_184055 ) ) ( not ( = ?auto_184057 ?auto_184056 ) ) ( IN-CITY ?auto_184062 ?auto_184058 ) ( IN-CITY ?auto_184054 ?auto_184058 ) ( not ( = ?auto_184054 ?auto_184062 ) ) ( OBJ-AT ?auto_184057 ?auto_184054 ) ( OBJ-AT ?auto_184055 ?auto_184062 ) ( not ( = ?auto_184060 ?auto_184057 ) ) ( not ( = ?auto_184055 ?auto_184060 ) ) ( IN-CITY ?auto_184059 ?auto_184058 ) ( not ( = ?auto_184054 ?auto_184059 ) ) ( not ( = ?auto_184062 ?auto_184059 ) ) ( OBJ-AT ?auto_184060 ?auto_184059 ) ( IN-TRUCK ?auto_184056 ?auto_184061 ) ( not ( = ?auto_184060 ?auto_184056 ) ) ( TRUCK-AT ?auto_184061 ?auto_184062 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184057 ?auto_184055 ?auto_184054 )
      ( DELIVER-3PKG-VERIFY ?auto_184055 ?auto_184056 ?auto_184057 ?auto_184054 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_184074 - OBJ
      ?auto_184075 - OBJ
      ?auto_184076 - OBJ
      ?auto_184073 - LOCATION
    )
    :vars
    (
      ?auto_184081 - OBJ
      ?auto_184080 - LOCATION
      ?auto_184077 - CITY
      ?auto_184078 - LOCATION
      ?auto_184079 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_184075 ?auto_184074 ) ) ( not ( = ?auto_184076 ?auto_184074 ) ) ( not ( = ?auto_184076 ?auto_184075 ) ) ( not ( = ?auto_184074 ?auto_184081 ) ) ( IN-CITY ?auto_184080 ?auto_184077 ) ( IN-CITY ?auto_184073 ?auto_184077 ) ( not ( = ?auto_184073 ?auto_184080 ) ) ( OBJ-AT ?auto_184081 ?auto_184073 ) ( OBJ-AT ?auto_184074 ?auto_184080 ) ( not ( = ?auto_184076 ?auto_184081 ) ) ( IN-CITY ?auto_184078 ?auto_184077 ) ( not ( = ?auto_184073 ?auto_184078 ) ) ( not ( = ?auto_184080 ?auto_184078 ) ) ( OBJ-AT ?auto_184076 ?auto_184078 ) ( not ( = ?auto_184075 ?auto_184081 ) ) ( IN-TRUCK ?auto_184075 ?auto_184079 ) ( TRUCK-AT ?auto_184079 ?auto_184080 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184081 ?auto_184074 ?auto_184073 )
      ( DELIVER-3PKG-VERIFY ?auto_184074 ?auto_184075 ?auto_184076 ?auto_184073 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_184093 - OBJ
      ?auto_184094 - OBJ
      ?auto_184095 - OBJ
      ?auto_184092 - LOCATION
    )
    :vars
    (
      ?auto_184100 - LOCATION
      ?auto_184096 - CITY
      ?auto_184097 - LOCATION
      ?auto_184098 - OBJ
      ?auto_184099 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_184094 ?auto_184093 ) ) ( not ( = ?auto_184095 ?auto_184093 ) ) ( not ( = ?auto_184095 ?auto_184094 ) ) ( IN-CITY ?auto_184100 ?auto_184096 ) ( IN-CITY ?auto_184092 ?auto_184096 ) ( not ( = ?auto_184092 ?auto_184100 ) ) ( OBJ-AT ?auto_184095 ?auto_184092 ) ( OBJ-AT ?auto_184093 ?auto_184100 ) ( IN-CITY ?auto_184097 ?auto_184096 ) ( not ( = ?auto_184092 ?auto_184097 ) ) ( not ( = ?auto_184100 ?auto_184097 ) ) ( OBJ-AT ?auto_184094 ?auto_184097 ) ( not ( = ?auto_184098 ?auto_184095 ) ) ( IN-TRUCK ?auto_184098 ?auto_184099 ) ( not ( = ?auto_184093 ?auto_184098 ) ) ( not ( = ?auto_184094 ?auto_184098 ) ) ( TRUCK-AT ?auto_184099 ?auto_184100 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184095 ?auto_184093 ?auto_184092 )
      ( DELIVER-3PKG-VERIFY ?auto_184093 ?auto_184094 ?auto_184095 ?auto_184092 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_184102 - OBJ
      ?auto_184103 - OBJ
      ?auto_184104 - OBJ
      ?auto_184101 - LOCATION
    )
    :vars
    (
      ?auto_184109 - OBJ
      ?auto_184108 - LOCATION
      ?auto_184105 - CITY
      ?auto_184106 - LOCATION
      ?auto_184107 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_184103 ?auto_184102 ) ) ( not ( = ?auto_184104 ?auto_184102 ) ) ( not ( = ?auto_184104 ?auto_184103 ) ) ( not ( = ?auto_184102 ?auto_184109 ) ) ( IN-CITY ?auto_184108 ?auto_184105 ) ( IN-CITY ?auto_184101 ?auto_184105 ) ( not ( = ?auto_184101 ?auto_184108 ) ) ( OBJ-AT ?auto_184109 ?auto_184101 ) ( OBJ-AT ?auto_184102 ?auto_184108 ) ( not ( = ?auto_184103 ?auto_184109 ) ) ( IN-CITY ?auto_184106 ?auto_184105 ) ( not ( = ?auto_184101 ?auto_184106 ) ) ( not ( = ?auto_184108 ?auto_184106 ) ) ( OBJ-AT ?auto_184103 ?auto_184106 ) ( not ( = ?auto_184104 ?auto_184109 ) ) ( IN-TRUCK ?auto_184104 ?auto_184107 ) ( TRUCK-AT ?auto_184107 ?auto_184108 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184109 ?auto_184102 ?auto_184101 )
      ( DELIVER-3PKG-VERIFY ?auto_184102 ?auto_184103 ?auto_184104 ?auto_184101 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_184265 - OBJ
      ?auto_184266 - OBJ
      ?auto_184267 - OBJ
      ?auto_184268 - OBJ
      ?auto_184264 - LOCATION
    )
    :vars
    (
      ?auto_184272 - LOCATION
      ?auto_184269 - CITY
      ?auto_184270 - LOCATION
      ?auto_184271 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_184266 ?auto_184265 ) ) ( not ( = ?auto_184267 ?auto_184265 ) ) ( not ( = ?auto_184267 ?auto_184266 ) ) ( not ( = ?auto_184268 ?auto_184265 ) ) ( not ( = ?auto_184268 ?auto_184266 ) ) ( not ( = ?auto_184268 ?auto_184267 ) ) ( IN-CITY ?auto_184272 ?auto_184269 ) ( IN-CITY ?auto_184264 ?auto_184269 ) ( not ( = ?auto_184264 ?auto_184272 ) ) ( OBJ-AT ?auto_184265 ?auto_184264 ) ( OBJ-AT ?auto_184268 ?auto_184272 ) ( IN-CITY ?auto_184270 ?auto_184269 ) ( not ( = ?auto_184264 ?auto_184270 ) ) ( not ( = ?auto_184272 ?auto_184270 ) ) ( OBJ-AT ?auto_184267 ?auto_184270 ) ( IN-TRUCK ?auto_184266 ?auto_184271 ) ( TRUCK-AT ?auto_184271 ?auto_184272 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184265 ?auto_184268 ?auto_184264 )
      ( DELIVER-4PKG-VERIFY ?auto_184265 ?auto_184266 ?auto_184267 ?auto_184268 ?auto_184264 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_184294 - OBJ
      ?auto_184295 - OBJ
      ?auto_184296 - OBJ
      ?auto_184297 - OBJ
      ?auto_184293 - LOCATION
    )
    :vars
    (
      ?auto_184301 - LOCATION
      ?auto_184298 - CITY
      ?auto_184299 - LOCATION
      ?auto_184300 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_184295 ?auto_184294 ) ) ( not ( = ?auto_184296 ?auto_184294 ) ) ( not ( = ?auto_184296 ?auto_184295 ) ) ( not ( = ?auto_184297 ?auto_184294 ) ) ( not ( = ?auto_184297 ?auto_184295 ) ) ( not ( = ?auto_184297 ?auto_184296 ) ) ( IN-CITY ?auto_184301 ?auto_184298 ) ( IN-CITY ?auto_184293 ?auto_184298 ) ( not ( = ?auto_184293 ?auto_184301 ) ) ( OBJ-AT ?auto_184294 ?auto_184293 ) ( OBJ-AT ?auto_184296 ?auto_184301 ) ( IN-CITY ?auto_184299 ?auto_184298 ) ( not ( = ?auto_184293 ?auto_184299 ) ) ( not ( = ?auto_184301 ?auto_184299 ) ) ( OBJ-AT ?auto_184297 ?auto_184299 ) ( IN-TRUCK ?auto_184295 ?auto_184300 ) ( TRUCK-AT ?auto_184300 ?auto_184301 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184294 ?auto_184296 ?auto_184293 )
      ( DELIVER-4PKG-VERIFY ?auto_184294 ?auto_184295 ?auto_184296 ?auto_184297 ?auto_184293 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_184323 - OBJ
      ?auto_184324 - OBJ
      ?auto_184325 - OBJ
      ?auto_184326 - OBJ
      ?auto_184322 - LOCATION
    )
    :vars
    (
      ?auto_184330 - LOCATION
      ?auto_184327 - CITY
      ?auto_184328 - LOCATION
      ?auto_184329 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_184324 ?auto_184323 ) ) ( not ( = ?auto_184325 ?auto_184323 ) ) ( not ( = ?auto_184325 ?auto_184324 ) ) ( not ( = ?auto_184326 ?auto_184323 ) ) ( not ( = ?auto_184326 ?auto_184324 ) ) ( not ( = ?auto_184326 ?auto_184325 ) ) ( IN-CITY ?auto_184330 ?auto_184327 ) ( IN-CITY ?auto_184322 ?auto_184327 ) ( not ( = ?auto_184322 ?auto_184330 ) ) ( OBJ-AT ?auto_184323 ?auto_184322 ) ( OBJ-AT ?auto_184326 ?auto_184330 ) ( IN-CITY ?auto_184328 ?auto_184327 ) ( not ( = ?auto_184322 ?auto_184328 ) ) ( not ( = ?auto_184330 ?auto_184328 ) ) ( OBJ-AT ?auto_184324 ?auto_184328 ) ( IN-TRUCK ?auto_184325 ?auto_184329 ) ( TRUCK-AT ?auto_184329 ?auto_184330 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184323 ?auto_184326 ?auto_184322 )
      ( DELIVER-4PKG-VERIFY ?auto_184323 ?auto_184324 ?auto_184325 ?auto_184326 ?auto_184322 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_184352 - OBJ
      ?auto_184353 - OBJ
      ?auto_184354 - OBJ
      ?auto_184355 - OBJ
      ?auto_184351 - LOCATION
    )
    :vars
    (
      ?auto_184359 - LOCATION
      ?auto_184356 - CITY
      ?auto_184357 - LOCATION
      ?auto_184358 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_184353 ?auto_184352 ) ) ( not ( = ?auto_184354 ?auto_184352 ) ) ( not ( = ?auto_184354 ?auto_184353 ) ) ( not ( = ?auto_184355 ?auto_184352 ) ) ( not ( = ?auto_184355 ?auto_184353 ) ) ( not ( = ?auto_184355 ?auto_184354 ) ) ( IN-CITY ?auto_184359 ?auto_184356 ) ( IN-CITY ?auto_184351 ?auto_184356 ) ( not ( = ?auto_184351 ?auto_184359 ) ) ( OBJ-AT ?auto_184352 ?auto_184351 ) ( OBJ-AT ?auto_184354 ?auto_184359 ) ( IN-CITY ?auto_184357 ?auto_184356 ) ( not ( = ?auto_184351 ?auto_184357 ) ) ( not ( = ?auto_184359 ?auto_184357 ) ) ( OBJ-AT ?auto_184353 ?auto_184357 ) ( IN-TRUCK ?auto_184355 ?auto_184358 ) ( TRUCK-AT ?auto_184358 ?auto_184359 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184352 ?auto_184354 ?auto_184351 )
      ( DELIVER-4PKG-VERIFY ?auto_184352 ?auto_184353 ?auto_184354 ?auto_184355 ?auto_184351 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_184443 - OBJ
      ?auto_184444 - OBJ
      ?auto_184445 - OBJ
      ?auto_184446 - OBJ
      ?auto_184442 - LOCATION
    )
    :vars
    (
      ?auto_184450 - LOCATION
      ?auto_184447 - CITY
      ?auto_184448 - LOCATION
      ?auto_184449 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_184444 ?auto_184443 ) ) ( not ( = ?auto_184445 ?auto_184443 ) ) ( not ( = ?auto_184445 ?auto_184444 ) ) ( not ( = ?auto_184446 ?auto_184443 ) ) ( not ( = ?auto_184446 ?auto_184444 ) ) ( not ( = ?auto_184446 ?auto_184445 ) ) ( IN-CITY ?auto_184450 ?auto_184447 ) ( IN-CITY ?auto_184442 ?auto_184447 ) ( not ( = ?auto_184442 ?auto_184450 ) ) ( OBJ-AT ?auto_184443 ?auto_184442 ) ( OBJ-AT ?auto_184444 ?auto_184450 ) ( IN-CITY ?auto_184448 ?auto_184447 ) ( not ( = ?auto_184442 ?auto_184448 ) ) ( not ( = ?auto_184450 ?auto_184448 ) ) ( OBJ-AT ?auto_184446 ?auto_184448 ) ( IN-TRUCK ?auto_184445 ?auto_184449 ) ( TRUCK-AT ?auto_184449 ?auto_184450 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184443 ?auto_184444 ?auto_184442 )
      ( DELIVER-4PKG-VERIFY ?auto_184443 ?auto_184444 ?auto_184445 ?auto_184446 ?auto_184442 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_184472 - OBJ
      ?auto_184473 - OBJ
      ?auto_184474 - OBJ
      ?auto_184475 - OBJ
      ?auto_184471 - LOCATION
    )
    :vars
    (
      ?auto_184479 - LOCATION
      ?auto_184476 - CITY
      ?auto_184477 - LOCATION
      ?auto_184478 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_184473 ?auto_184472 ) ) ( not ( = ?auto_184474 ?auto_184472 ) ) ( not ( = ?auto_184474 ?auto_184473 ) ) ( not ( = ?auto_184475 ?auto_184472 ) ) ( not ( = ?auto_184475 ?auto_184473 ) ) ( not ( = ?auto_184475 ?auto_184474 ) ) ( IN-CITY ?auto_184479 ?auto_184476 ) ( IN-CITY ?auto_184471 ?auto_184476 ) ( not ( = ?auto_184471 ?auto_184479 ) ) ( OBJ-AT ?auto_184472 ?auto_184471 ) ( OBJ-AT ?auto_184473 ?auto_184479 ) ( IN-CITY ?auto_184477 ?auto_184476 ) ( not ( = ?auto_184471 ?auto_184477 ) ) ( not ( = ?auto_184479 ?auto_184477 ) ) ( OBJ-AT ?auto_184474 ?auto_184477 ) ( IN-TRUCK ?auto_184475 ?auto_184478 ) ( TRUCK-AT ?auto_184478 ?auto_184479 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184472 ?auto_184473 ?auto_184471 )
      ( DELIVER-4PKG-VERIFY ?auto_184472 ?auto_184473 ?auto_184474 ?auto_184475 ?auto_184471 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_184563 - OBJ
      ?auto_184564 - OBJ
      ?auto_184565 - OBJ
      ?auto_184566 - OBJ
      ?auto_184562 - LOCATION
    )
    :vars
    (
      ?auto_184570 - LOCATION
      ?auto_184567 - CITY
      ?auto_184568 - LOCATION
      ?auto_184569 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_184564 ?auto_184563 ) ) ( not ( = ?auto_184565 ?auto_184563 ) ) ( not ( = ?auto_184565 ?auto_184564 ) ) ( not ( = ?auto_184566 ?auto_184563 ) ) ( not ( = ?auto_184566 ?auto_184564 ) ) ( not ( = ?auto_184566 ?auto_184565 ) ) ( IN-CITY ?auto_184570 ?auto_184567 ) ( IN-CITY ?auto_184562 ?auto_184567 ) ( not ( = ?auto_184562 ?auto_184570 ) ) ( OBJ-AT ?auto_184564 ?auto_184562 ) ( OBJ-AT ?auto_184566 ?auto_184570 ) ( IN-CITY ?auto_184568 ?auto_184567 ) ( not ( = ?auto_184562 ?auto_184568 ) ) ( not ( = ?auto_184570 ?auto_184568 ) ) ( OBJ-AT ?auto_184565 ?auto_184568 ) ( IN-TRUCK ?auto_184563 ?auto_184569 ) ( TRUCK-AT ?auto_184569 ?auto_184570 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184564 ?auto_184566 ?auto_184562 )
      ( DELIVER-4PKG-VERIFY ?auto_184563 ?auto_184564 ?auto_184565 ?auto_184566 ?auto_184562 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_184592 - OBJ
      ?auto_184593 - OBJ
      ?auto_184594 - OBJ
      ?auto_184595 - OBJ
      ?auto_184591 - LOCATION
    )
    :vars
    (
      ?auto_184599 - LOCATION
      ?auto_184596 - CITY
      ?auto_184597 - LOCATION
      ?auto_184598 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_184593 ?auto_184592 ) ) ( not ( = ?auto_184594 ?auto_184592 ) ) ( not ( = ?auto_184594 ?auto_184593 ) ) ( not ( = ?auto_184595 ?auto_184592 ) ) ( not ( = ?auto_184595 ?auto_184593 ) ) ( not ( = ?auto_184595 ?auto_184594 ) ) ( IN-CITY ?auto_184599 ?auto_184596 ) ( IN-CITY ?auto_184591 ?auto_184596 ) ( not ( = ?auto_184591 ?auto_184599 ) ) ( OBJ-AT ?auto_184593 ?auto_184591 ) ( OBJ-AT ?auto_184594 ?auto_184599 ) ( IN-CITY ?auto_184597 ?auto_184596 ) ( not ( = ?auto_184591 ?auto_184597 ) ) ( not ( = ?auto_184599 ?auto_184597 ) ) ( OBJ-AT ?auto_184595 ?auto_184597 ) ( IN-TRUCK ?auto_184592 ?auto_184598 ) ( TRUCK-AT ?auto_184598 ?auto_184599 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184593 ?auto_184594 ?auto_184591 )
      ( DELIVER-4PKG-VERIFY ?auto_184592 ?auto_184593 ?auto_184594 ?auto_184595 ?auto_184591 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_184684 - OBJ
      ?auto_184685 - OBJ
      ?auto_184686 - OBJ
      ?auto_184687 - OBJ
      ?auto_184683 - LOCATION
    )
    :vars
    (
      ?auto_184691 - LOCATION
      ?auto_184688 - CITY
      ?auto_184689 - LOCATION
      ?auto_184690 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_184685 ?auto_184684 ) ) ( not ( = ?auto_184686 ?auto_184684 ) ) ( not ( = ?auto_184686 ?auto_184685 ) ) ( not ( = ?auto_184687 ?auto_184684 ) ) ( not ( = ?auto_184687 ?auto_184685 ) ) ( not ( = ?auto_184687 ?auto_184686 ) ) ( IN-CITY ?auto_184691 ?auto_184688 ) ( IN-CITY ?auto_184683 ?auto_184688 ) ( not ( = ?auto_184683 ?auto_184691 ) ) ( OBJ-AT ?auto_184686 ?auto_184683 ) ( OBJ-AT ?auto_184687 ?auto_184691 ) ( IN-CITY ?auto_184689 ?auto_184688 ) ( not ( = ?auto_184683 ?auto_184689 ) ) ( not ( = ?auto_184691 ?auto_184689 ) ) ( OBJ-AT ?auto_184685 ?auto_184689 ) ( IN-TRUCK ?auto_184684 ?auto_184690 ) ( TRUCK-AT ?auto_184690 ?auto_184691 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184686 ?auto_184687 ?auto_184683 )
      ( DELIVER-4PKG-VERIFY ?auto_184684 ?auto_184685 ?auto_184686 ?auto_184687 ?auto_184683 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_184713 - OBJ
      ?auto_184714 - OBJ
      ?auto_184715 - OBJ
      ?auto_184716 - OBJ
      ?auto_184712 - LOCATION
    )
    :vars
    (
      ?auto_184720 - LOCATION
      ?auto_184717 - CITY
      ?auto_184718 - LOCATION
      ?auto_184719 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_184714 ?auto_184713 ) ) ( not ( = ?auto_184715 ?auto_184713 ) ) ( not ( = ?auto_184715 ?auto_184714 ) ) ( not ( = ?auto_184716 ?auto_184713 ) ) ( not ( = ?auto_184716 ?auto_184714 ) ) ( not ( = ?auto_184716 ?auto_184715 ) ) ( IN-CITY ?auto_184720 ?auto_184717 ) ( IN-CITY ?auto_184712 ?auto_184717 ) ( not ( = ?auto_184712 ?auto_184720 ) ) ( OBJ-AT ?auto_184716 ?auto_184712 ) ( OBJ-AT ?auto_184715 ?auto_184720 ) ( IN-CITY ?auto_184718 ?auto_184717 ) ( not ( = ?auto_184712 ?auto_184718 ) ) ( not ( = ?auto_184720 ?auto_184718 ) ) ( OBJ-AT ?auto_184714 ?auto_184718 ) ( IN-TRUCK ?auto_184713 ?auto_184719 ) ( TRUCK-AT ?auto_184719 ?auto_184720 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184716 ?auto_184715 ?auto_184712 )
      ( DELIVER-4PKG-VERIFY ?auto_184713 ?auto_184714 ?auto_184715 ?auto_184716 ?auto_184712 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_184772 - OBJ
      ?auto_184773 - OBJ
      ?auto_184774 - OBJ
      ?auto_184775 - OBJ
      ?auto_184771 - LOCATION
    )
    :vars
    (
      ?auto_184779 - LOCATION
      ?auto_184776 - CITY
      ?auto_184777 - LOCATION
      ?auto_184778 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_184773 ?auto_184772 ) ) ( not ( = ?auto_184774 ?auto_184772 ) ) ( not ( = ?auto_184774 ?auto_184773 ) ) ( not ( = ?auto_184775 ?auto_184772 ) ) ( not ( = ?auto_184775 ?auto_184773 ) ) ( not ( = ?auto_184775 ?auto_184774 ) ) ( IN-CITY ?auto_184779 ?auto_184776 ) ( IN-CITY ?auto_184771 ?auto_184776 ) ( not ( = ?auto_184771 ?auto_184779 ) ) ( OBJ-AT ?auto_184774 ?auto_184771 ) ( OBJ-AT ?auto_184773 ?auto_184779 ) ( IN-CITY ?auto_184777 ?auto_184776 ) ( not ( = ?auto_184771 ?auto_184777 ) ) ( not ( = ?auto_184779 ?auto_184777 ) ) ( OBJ-AT ?auto_184775 ?auto_184777 ) ( IN-TRUCK ?auto_184772 ?auto_184778 ) ( TRUCK-AT ?auto_184778 ?auto_184779 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184774 ?auto_184773 ?auto_184771 )
      ( DELIVER-4PKG-VERIFY ?auto_184772 ?auto_184773 ?auto_184774 ?auto_184775 ?auto_184771 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_184833 - OBJ
      ?auto_184834 - OBJ
      ?auto_184835 - OBJ
      ?auto_184836 - OBJ
      ?auto_184832 - LOCATION
    )
    :vars
    (
      ?auto_184840 - LOCATION
      ?auto_184837 - CITY
      ?auto_184838 - LOCATION
      ?auto_184839 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_184834 ?auto_184833 ) ) ( not ( = ?auto_184835 ?auto_184833 ) ) ( not ( = ?auto_184835 ?auto_184834 ) ) ( not ( = ?auto_184836 ?auto_184833 ) ) ( not ( = ?auto_184836 ?auto_184834 ) ) ( not ( = ?auto_184836 ?auto_184835 ) ) ( IN-CITY ?auto_184840 ?auto_184837 ) ( IN-CITY ?auto_184832 ?auto_184837 ) ( not ( = ?auto_184832 ?auto_184840 ) ) ( OBJ-AT ?auto_184836 ?auto_184832 ) ( OBJ-AT ?auto_184834 ?auto_184840 ) ( IN-CITY ?auto_184838 ?auto_184837 ) ( not ( = ?auto_184832 ?auto_184838 ) ) ( not ( = ?auto_184840 ?auto_184838 ) ) ( OBJ-AT ?auto_184835 ?auto_184838 ) ( IN-TRUCK ?auto_184833 ?auto_184839 ) ( TRUCK-AT ?auto_184839 ?auto_184840 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184836 ?auto_184834 ?auto_184832 )
      ( DELIVER-4PKG-VERIFY ?auto_184833 ?auto_184834 ?auto_184835 ?auto_184836 ?auto_184832 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_184924 - OBJ
      ?auto_184925 - OBJ
      ?auto_184926 - OBJ
      ?auto_184927 - OBJ
      ?auto_184923 - LOCATION
    )
    :vars
    (
      ?auto_184931 - LOCATION
      ?auto_184928 - CITY
      ?auto_184929 - LOCATION
      ?auto_184930 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_184925 ?auto_184924 ) ) ( not ( = ?auto_184926 ?auto_184924 ) ) ( not ( = ?auto_184926 ?auto_184925 ) ) ( not ( = ?auto_184927 ?auto_184924 ) ) ( not ( = ?auto_184927 ?auto_184925 ) ) ( not ( = ?auto_184927 ?auto_184926 ) ) ( IN-CITY ?auto_184931 ?auto_184928 ) ( IN-CITY ?auto_184923 ?auto_184928 ) ( not ( = ?auto_184923 ?auto_184931 ) ) ( OBJ-AT ?auto_184925 ?auto_184923 ) ( OBJ-AT ?auto_184927 ?auto_184931 ) ( IN-CITY ?auto_184929 ?auto_184928 ) ( not ( = ?auto_184923 ?auto_184929 ) ) ( not ( = ?auto_184931 ?auto_184929 ) ) ( OBJ-AT ?auto_184924 ?auto_184929 ) ( IN-TRUCK ?auto_184926 ?auto_184930 ) ( TRUCK-AT ?auto_184930 ?auto_184931 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184925 ?auto_184927 ?auto_184923 )
      ( DELIVER-4PKG-VERIFY ?auto_184924 ?auto_184925 ?auto_184926 ?auto_184927 ?auto_184923 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_184953 - OBJ
      ?auto_184954 - OBJ
      ?auto_184955 - OBJ
      ?auto_184956 - OBJ
      ?auto_184952 - LOCATION
    )
    :vars
    (
      ?auto_184960 - LOCATION
      ?auto_184957 - CITY
      ?auto_184958 - LOCATION
      ?auto_184959 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_184954 ?auto_184953 ) ) ( not ( = ?auto_184955 ?auto_184953 ) ) ( not ( = ?auto_184955 ?auto_184954 ) ) ( not ( = ?auto_184956 ?auto_184953 ) ) ( not ( = ?auto_184956 ?auto_184954 ) ) ( not ( = ?auto_184956 ?auto_184955 ) ) ( IN-CITY ?auto_184960 ?auto_184957 ) ( IN-CITY ?auto_184952 ?auto_184957 ) ( not ( = ?auto_184952 ?auto_184960 ) ) ( OBJ-AT ?auto_184954 ?auto_184952 ) ( OBJ-AT ?auto_184955 ?auto_184960 ) ( IN-CITY ?auto_184958 ?auto_184957 ) ( not ( = ?auto_184952 ?auto_184958 ) ) ( not ( = ?auto_184960 ?auto_184958 ) ) ( OBJ-AT ?auto_184953 ?auto_184958 ) ( IN-TRUCK ?auto_184956 ?auto_184959 ) ( TRUCK-AT ?auto_184959 ?auto_184960 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184954 ?auto_184955 ?auto_184952 )
      ( DELIVER-4PKG-VERIFY ?auto_184953 ?auto_184954 ?auto_184955 ?auto_184956 ?auto_184952 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_184982 - OBJ
      ?auto_184983 - OBJ
      ?auto_184984 - OBJ
      ?auto_184985 - OBJ
      ?auto_184981 - LOCATION
    )
    :vars
    (
      ?auto_184989 - LOCATION
      ?auto_184986 - CITY
      ?auto_184987 - LOCATION
      ?auto_184988 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_184983 ?auto_184982 ) ) ( not ( = ?auto_184984 ?auto_184982 ) ) ( not ( = ?auto_184984 ?auto_184983 ) ) ( not ( = ?auto_184985 ?auto_184982 ) ) ( not ( = ?auto_184985 ?auto_184983 ) ) ( not ( = ?auto_184985 ?auto_184984 ) ) ( IN-CITY ?auto_184989 ?auto_184986 ) ( IN-CITY ?auto_184981 ?auto_184986 ) ( not ( = ?auto_184981 ?auto_184989 ) ) ( OBJ-AT ?auto_184984 ?auto_184981 ) ( OBJ-AT ?auto_184985 ?auto_184989 ) ( IN-CITY ?auto_184987 ?auto_184986 ) ( not ( = ?auto_184981 ?auto_184987 ) ) ( not ( = ?auto_184989 ?auto_184987 ) ) ( OBJ-AT ?auto_184982 ?auto_184987 ) ( IN-TRUCK ?auto_184983 ?auto_184988 ) ( TRUCK-AT ?auto_184988 ?auto_184989 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184984 ?auto_184985 ?auto_184981 )
      ( DELIVER-4PKG-VERIFY ?auto_184982 ?auto_184983 ?auto_184984 ?auto_184985 ?auto_184981 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_185011 - OBJ
      ?auto_185012 - OBJ
      ?auto_185013 - OBJ
      ?auto_185014 - OBJ
      ?auto_185010 - LOCATION
    )
    :vars
    (
      ?auto_185018 - LOCATION
      ?auto_185015 - CITY
      ?auto_185016 - LOCATION
      ?auto_185017 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_185012 ?auto_185011 ) ) ( not ( = ?auto_185013 ?auto_185011 ) ) ( not ( = ?auto_185013 ?auto_185012 ) ) ( not ( = ?auto_185014 ?auto_185011 ) ) ( not ( = ?auto_185014 ?auto_185012 ) ) ( not ( = ?auto_185014 ?auto_185013 ) ) ( IN-CITY ?auto_185018 ?auto_185015 ) ( IN-CITY ?auto_185010 ?auto_185015 ) ( not ( = ?auto_185010 ?auto_185018 ) ) ( OBJ-AT ?auto_185014 ?auto_185010 ) ( OBJ-AT ?auto_185013 ?auto_185018 ) ( IN-CITY ?auto_185016 ?auto_185015 ) ( not ( = ?auto_185010 ?auto_185016 ) ) ( not ( = ?auto_185018 ?auto_185016 ) ) ( OBJ-AT ?auto_185011 ?auto_185016 ) ( IN-TRUCK ?auto_185012 ?auto_185017 ) ( TRUCK-AT ?auto_185017 ?auto_185018 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_185014 ?auto_185013 ?auto_185010 )
      ( DELIVER-4PKG-VERIFY ?auto_185011 ?auto_185012 ?auto_185013 ?auto_185014 ?auto_185010 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_185133 - OBJ
      ?auto_185134 - OBJ
      ?auto_185135 - OBJ
      ?auto_185136 - OBJ
      ?auto_185132 - LOCATION
    )
    :vars
    (
      ?auto_185140 - LOCATION
      ?auto_185137 - CITY
      ?auto_185138 - LOCATION
      ?auto_185139 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_185134 ?auto_185133 ) ) ( not ( = ?auto_185135 ?auto_185133 ) ) ( not ( = ?auto_185135 ?auto_185134 ) ) ( not ( = ?auto_185136 ?auto_185133 ) ) ( not ( = ?auto_185136 ?auto_185134 ) ) ( not ( = ?auto_185136 ?auto_185135 ) ) ( IN-CITY ?auto_185140 ?auto_185137 ) ( IN-CITY ?auto_185132 ?auto_185137 ) ( not ( = ?auto_185132 ?auto_185140 ) ) ( OBJ-AT ?auto_185135 ?auto_185132 ) ( OBJ-AT ?auto_185134 ?auto_185140 ) ( IN-CITY ?auto_185138 ?auto_185137 ) ( not ( = ?auto_185132 ?auto_185138 ) ) ( not ( = ?auto_185140 ?auto_185138 ) ) ( OBJ-AT ?auto_185133 ?auto_185138 ) ( IN-TRUCK ?auto_185136 ?auto_185139 ) ( TRUCK-AT ?auto_185139 ?auto_185140 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_185135 ?auto_185134 ?auto_185132 )
      ( DELIVER-4PKG-VERIFY ?auto_185133 ?auto_185134 ?auto_185135 ?auto_185136 ?auto_185132 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_185162 - OBJ
      ?auto_185163 - OBJ
      ?auto_185164 - OBJ
      ?auto_185165 - OBJ
      ?auto_185161 - LOCATION
    )
    :vars
    (
      ?auto_185169 - LOCATION
      ?auto_185166 - CITY
      ?auto_185167 - LOCATION
      ?auto_185168 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_185163 ?auto_185162 ) ) ( not ( = ?auto_185164 ?auto_185162 ) ) ( not ( = ?auto_185164 ?auto_185163 ) ) ( not ( = ?auto_185165 ?auto_185162 ) ) ( not ( = ?auto_185165 ?auto_185163 ) ) ( not ( = ?auto_185165 ?auto_185164 ) ) ( IN-CITY ?auto_185169 ?auto_185166 ) ( IN-CITY ?auto_185161 ?auto_185166 ) ( not ( = ?auto_185161 ?auto_185169 ) ) ( OBJ-AT ?auto_185165 ?auto_185161 ) ( OBJ-AT ?auto_185163 ?auto_185169 ) ( IN-CITY ?auto_185167 ?auto_185166 ) ( not ( = ?auto_185161 ?auto_185167 ) ) ( not ( = ?auto_185169 ?auto_185167 ) ) ( OBJ-AT ?auto_185162 ?auto_185167 ) ( IN-TRUCK ?auto_185164 ?auto_185168 ) ( TRUCK-AT ?auto_185168 ?auto_185169 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_185165 ?auto_185163 ?auto_185161 )
      ( DELIVER-4PKG-VERIFY ?auto_185162 ?auto_185163 ?auto_185164 ?auto_185165 ?auto_185161 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_185347 - OBJ
      ?auto_185348 - OBJ
      ?auto_185349 - OBJ
      ?auto_185350 - OBJ
      ?auto_185346 - LOCATION
    )
    :vars
    (
      ?auto_185354 - LOCATION
      ?auto_185351 - CITY
      ?auto_185352 - LOCATION
      ?auto_185353 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_185348 ?auto_185347 ) ) ( not ( = ?auto_185349 ?auto_185347 ) ) ( not ( = ?auto_185349 ?auto_185348 ) ) ( not ( = ?auto_185350 ?auto_185347 ) ) ( not ( = ?auto_185350 ?auto_185348 ) ) ( not ( = ?auto_185350 ?auto_185349 ) ) ( IN-CITY ?auto_185354 ?auto_185351 ) ( IN-CITY ?auto_185346 ?auto_185351 ) ( not ( = ?auto_185346 ?auto_185354 ) ) ( OBJ-AT ?auto_185348 ?auto_185346 ) ( OBJ-AT ?auto_185347 ?auto_185354 ) ( IN-CITY ?auto_185352 ?auto_185351 ) ( not ( = ?auto_185346 ?auto_185352 ) ) ( not ( = ?auto_185354 ?auto_185352 ) ) ( OBJ-AT ?auto_185350 ?auto_185352 ) ( IN-TRUCK ?auto_185349 ?auto_185353 ) ( TRUCK-AT ?auto_185353 ?auto_185354 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_185348 ?auto_185347 ?auto_185346 )
      ( DELIVER-4PKG-VERIFY ?auto_185347 ?auto_185348 ?auto_185349 ?auto_185350 ?auto_185346 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_185376 - OBJ
      ?auto_185377 - OBJ
      ?auto_185378 - OBJ
      ?auto_185379 - OBJ
      ?auto_185375 - LOCATION
    )
    :vars
    (
      ?auto_185383 - LOCATION
      ?auto_185380 - CITY
      ?auto_185381 - LOCATION
      ?auto_185382 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_185377 ?auto_185376 ) ) ( not ( = ?auto_185378 ?auto_185376 ) ) ( not ( = ?auto_185378 ?auto_185377 ) ) ( not ( = ?auto_185379 ?auto_185376 ) ) ( not ( = ?auto_185379 ?auto_185377 ) ) ( not ( = ?auto_185379 ?auto_185378 ) ) ( IN-CITY ?auto_185383 ?auto_185380 ) ( IN-CITY ?auto_185375 ?auto_185380 ) ( not ( = ?auto_185375 ?auto_185383 ) ) ( OBJ-AT ?auto_185377 ?auto_185375 ) ( OBJ-AT ?auto_185376 ?auto_185383 ) ( IN-CITY ?auto_185381 ?auto_185380 ) ( not ( = ?auto_185375 ?auto_185381 ) ) ( not ( = ?auto_185383 ?auto_185381 ) ) ( OBJ-AT ?auto_185378 ?auto_185381 ) ( IN-TRUCK ?auto_185379 ?auto_185382 ) ( TRUCK-AT ?auto_185382 ?auto_185383 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_185377 ?auto_185376 ?auto_185375 )
      ( DELIVER-4PKG-VERIFY ?auto_185376 ?auto_185377 ?auto_185378 ?auto_185379 ?auto_185375 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_185467 - OBJ
      ?auto_185468 - OBJ
      ?auto_185469 - OBJ
      ?auto_185470 - OBJ
      ?auto_185466 - LOCATION
    )
    :vars
    (
      ?auto_185474 - LOCATION
      ?auto_185471 - CITY
      ?auto_185472 - LOCATION
      ?auto_185473 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_185468 ?auto_185467 ) ) ( not ( = ?auto_185469 ?auto_185467 ) ) ( not ( = ?auto_185469 ?auto_185468 ) ) ( not ( = ?auto_185470 ?auto_185467 ) ) ( not ( = ?auto_185470 ?auto_185468 ) ) ( not ( = ?auto_185470 ?auto_185469 ) ) ( IN-CITY ?auto_185474 ?auto_185471 ) ( IN-CITY ?auto_185466 ?auto_185471 ) ( not ( = ?auto_185466 ?auto_185474 ) ) ( OBJ-AT ?auto_185469 ?auto_185466 ) ( OBJ-AT ?auto_185467 ?auto_185474 ) ( IN-CITY ?auto_185472 ?auto_185471 ) ( not ( = ?auto_185466 ?auto_185472 ) ) ( not ( = ?auto_185474 ?auto_185472 ) ) ( OBJ-AT ?auto_185470 ?auto_185472 ) ( IN-TRUCK ?auto_185468 ?auto_185473 ) ( TRUCK-AT ?auto_185473 ?auto_185474 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_185469 ?auto_185467 ?auto_185466 )
      ( DELIVER-4PKG-VERIFY ?auto_185467 ?auto_185468 ?auto_185469 ?auto_185470 ?auto_185466 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_185528 - OBJ
      ?auto_185529 - OBJ
      ?auto_185530 - OBJ
      ?auto_185531 - OBJ
      ?auto_185527 - LOCATION
    )
    :vars
    (
      ?auto_185535 - LOCATION
      ?auto_185532 - CITY
      ?auto_185533 - LOCATION
      ?auto_185534 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_185529 ?auto_185528 ) ) ( not ( = ?auto_185530 ?auto_185528 ) ) ( not ( = ?auto_185530 ?auto_185529 ) ) ( not ( = ?auto_185531 ?auto_185528 ) ) ( not ( = ?auto_185531 ?auto_185529 ) ) ( not ( = ?auto_185531 ?auto_185530 ) ) ( IN-CITY ?auto_185535 ?auto_185532 ) ( IN-CITY ?auto_185527 ?auto_185532 ) ( not ( = ?auto_185527 ?auto_185535 ) ) ( OBJ-AT ?auto_185531 ?auto_185527 ) ( OBJ-AT ?auto_185528 ?auto_185535 ) ( IN-CITY ?auto_185533 ?auto_185532 ) ( not ( = ?auto_185527 ?auto_185533 ) ) ( not ( = ?auto_185535 ?auto_185533 ) ) ( OBJ-AT ?auto_185530 ?auto_185533 ) ( IN-TRUCK ?auto_185529 ?auto_185534 ) ( TRUCK-AT ?auto_185534 ?auto_185535 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_185531 ?auto_185528 ?auto_185527 )
      ( DELIVER-4PKG-VERIFY ?auto_185528 ?auto_185529 ?auto_185530 ?auto_185531 ?auto_185527 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_185619 - OBJ
      ?auto_185620 - OBJ
      ?auto_185621 - OBJ
      ?auto_185622 - OBJ
      ?auto_185618 - LOCATION
    )
    :vars
    (
      ?auto_185626 - LOCATION
      ?auto_185623 - CITY
      ?auto_185624 - LOCATION
      ?auto_185625 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_185620 ?auto_185619 ) ) ( not ( = ?auto_185621 ?auto_185619 ) ) ( not ( = ?auto_185621 ?auto_185620 ) ) ( not ( = ?auto_185622 ?auto_185619 ) ) ( not ( = ?auto_185622 ?auto_185620 ) ) ( not ( = ?auto_185622 ?auto_185621 ) ) ( IN-CITY ?auto_185626 ?auto_185623 ) ( IN-CITY ?auto_185618 ?auto_185623 ) ( not ( = ?auto_185618 ?auto_185626 ) ) ( OBJ-AT ?auto_185621 ?auto_185618 ) ( OBJ-AT ?auto_185619 ?auto_185626 ) ( IN-CITY ?auto_185624 ?auto_185623 ) ( not ( = ?auto_185618 ?auto_185624 ) ) ( not ( = ?auto_185626 ?auto_185624 ) ) ( OBJ-AT ?auto_185620 ?auto_185624 ) ( IN-TRUCK ?auto_185622 ?auto_185625 ) ( TRUCK-AT ?auto_185625 ?auto_185626 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_185621 ?auto_185619 ?auto_185618 )
      ( DELIVER-4PKG-VERIFY ?auto_185619 ?auto_185620 ?auto_185621 ?auto_185622 ?auto_185618 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_185648 - OBJ
      ?auto_185649 - OBJ
      ?auto_185650 - OBJ
      ?auto_185651 - OBJ
      ?auto_185647 - LOCATION
    )
    :vars
    (
      ?auto_185655 - LOCATION
      ?auto_185652 - CITY
      ?auto_185653 - LOCATION
      ?auto_185654 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_185649 ?auto_185648 ) ) ( not ( = ?auto_185650 ?auto_185648 ) ) ( not ( = ?auto_185650 ?auto_185649 ) ) ( not ( = ?auto_185651 ?auto_185648 ) ) ( not ( = ?auto_185651 ?auto_185649 ) ) ( not ( = ?auto_185651 ?auto_185650 ) ) ( IN-CITY ?auto_185655 ?auto_185652 ) ( IN-CITY ?auto_185647 ?auto_185652 ) ( not ( = ?auto_185647 ?auto_185655 ) ) ( OBJ-AT ?auto_185651 ?auto_185647 ) ( OBJ-AT ?auto_185648 ?auto_185655 ) ( IN-CITY ?auto_185653 ?auto_185652 ) ( not ( = ?auto_185647 ?auto_185653 ) ) ( not ( = ?auto_185655 ?auto_185653 ) ) ( OBJ-AT ?auto_185649 ?auto_185653 ) ( IN-TRUCK ?auto_185650 ?auto_185654 ) ( TRUCK-AT ?auto_185654 ?auto_185655 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_185651 ?auto_185648 ?auto_185647 )
      ( DELIVER-4PKG-VERIFY ?auto_185648 ?auto_185649 ?auto_185650 ?auto_185651 ?auto_185647 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_185942 - OBJ
      ?auto_185941 - LOCATION
    )
    :vars
    (
      ?auto_185949 - OBJ
      ?auto_185948 - LOCATION
      ?auto_185943 - CITY
      ?auto_185946 - OBJ
      ?auto_185944 - LOCATION
      ?auto_185945 - OBJ
      ?auto_185947 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_185942 ?auto_185949 ) ) ( IN-CITY ?auto_185948 ?auto_185943 ) ( IN-CITY ?auto_185941 ?auto_185943 ) ( not ( = ?auto_185941 ?auto_185948 ) ) ( OBJ-AT ?auto_185949 ?auto_185941 ) ( OBJ-AT ?auto_185942 ?auto_185948 ) ( not ( = ?auto_185946 ?auto_185949 ) ) ( not ( = ?auto_185942 ?auto_185946 ) ) ( IN-CITY ?auto_185944 ?auto_185943 ) ( not ( = ?auto_185941 ?auto_185944 ) ) ( not ( = ?auto_185948 ?auto_185944 ) ) ( OBJ-AT ?auto_185946 ?auto_185944 ) ( not ( = ?auto_185945 ?auto_185949 ) ) ( not ( = ?auto_185942 ?auto_185945 ) ) ( not ( = ?auto_185946 ?auto_185945 ) ) ( TRUCK-AT ?auto_185947 ?auto_185948 ) ( OBJ-AT ?auto_185945 ?auto_185948 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_185945 ?auto_185947 ?auto_185948 )
      ( DELIVER-2PKG ?auto_185949 ?auto_185942 ?auto_185941 )
      ( DELIVER-1PKG-VERIFY ?auto_185942 ?auto_185941 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_185951 - OBJ
      ?auto_185952 - OBJ
      ?auto_185950 - LOCATION
    )
    :vars
    (
      ?auto_185957 - LOCATION
      ?auto_185953 - CITY
      ?auto_185955 - OBJ
      ?auto_185958 - LOCATION
      ?auto_185954 - OBJ
      ?auto_185956 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_185952 ?auto_185951 ) ) ( IN-CITY ?auto_185957 ?auto_185953 ) ( IN-CITY ?auto_185950 ?auto_185953 ) ( not ( = ?auto_185950 ?auto_185957 ) ) ( OBJ-AT ?auto_185951 ?auto_185950 ) ( OBJ-AT ?auto_185952 ?auto_185957 ) ( not ( = ?auto_185955 ?auto_185951 ) ) ( not ( = ?auto_185952 ?auto_185955 ) ) ( IN-CITY ?auto_185958 ?auto_185953 ) ( not ( = ?auto_185950 ?auto_185958 ) ) ( not ( = ?auto_185957 ?auto_185958 ) ) ( OBJ-AT ?auto_185955 ?auto_185958 ) ( not ( = ?auto_185954 ?auto_185951 ) ) ( not ( = ?auto_185952 ?auto_185954 ) ) ( not ( = ?auto_185955 ?auto_185954 ) ) ( TRUCK-AT ?auto_185956 ?auto_185957 ) ( OBJ-AT ?auto_185954 ?auto_185957 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_185952 ?auto_185950 )
      ( DELIVER-2PKG-VERIFY ?auto_185951 ?auto_185952 ?auto_185950 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_185960 - OBJ
      ?auto_185961 - OBJ
      ?auto_185959 - LOCATION
    )
    :vars
    (
      ?auto_185967 - OBJ
      ?auto_185964 - LOCATION
      ?auto_185966 - CITY
      ?auto_185962 - OBJ
      ?auto_185963 - LOCATION
      ?auto_185965 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_185961 ?auto_185960 ) ) ( not ( = ?auto_185961 ?auto_185967 ) ) ( IN-CITY ?auto_185964 ?auto_185966 ) ( IN-CITY ?auto_185959 ?auto_185966 ) ( not ( = ?auto_185959 ?auto_185964 ) ) ( OBJ-AT ?auto_185967 ?auto_185959 ) ( OBJ-AT ?auto_185961 ?auto_185964 ) ( not ( = ?auto_185962 ?auto_185967 ) ) ( not ( = ?auto_185961 ?auto_185962 ) ) ( IN-CITY ?auto_185963 ?auto_185966 ) ( not ( = ?auto_185959 ?auto_185963 ) ) ( not ( = ?auto_185964 ?auto_185963 ) ) ( OBJ-AT ?auto_185962 ?auto_185963 ) ( not ( = ?auto_185960 ?auto_185967 ) ) ( not ( = ?auto_185962 ?auto_185960 ) ) ( TRUCK-AT ?auto_185965 ?auto_185964 ) ( OBJ-AT ?auto_185960 ?auto_185964 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_185967 ?auto_185961 ?auto_185959 )
      ( DELIVER-2PKG-VERIFY ?auto_185960 ?auto_185961 ?auto_185959 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_185969 - OBJ
      ?auto_185970 - OBJ
      ?auto_185968 - LOCATION
    )
    :vars
    (
      ?auto_185976 - OBJ
      ?auto_185973 - LOCATION
      ?auto_185975 - CITY
      ?auto_185971 - LOCATION
      ?auto_185972 - OBJ
      ?auto_185974 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_185970 ?auto_185969 ) ) ( not ( = ?auto_185970 ?auto_185976 ) ) ( IN-CITY ?auto_185973 ?auto_185975 ) ( IN-CITY ?auto_185968 ?auto_185975 ) ( not ( = ?auto_185968 ?auto_185973 ) ) ( OBJ-AT ?auto_185976 ?auto_185968 ) ( OBJ-AT ?auto_185970 ?auto_185973 ) ( not ( = ?auto_185969 ?auto_185976 ) ) ( IN-CITY ?auto_185971 ?auto_185975 ) ( not ( = ?auto_185968 ?auto_185971 ) ) ( not ( = ?auto_185973 ?auto_185971 ) ) ( OBJ-AT ?auto_185969 ?auto_185971 ) ( not ( = ?auto_185972 ?auto_185976 ) ) ( not ( = ?auto_185970 ?auto_185972 ) ) ( not ( = ?auto_185969 ?auto_185972 ) ) ( TRUCK-AT ?auto_185974 ?auto_185973 ) ( OBJ-AT ?auto_185972 ?auto_185973 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_185976 ?auto_185970 ?auto_185968 )
      ( DELIVER-2PKG-VERIFY ?auto_185969 ?auto_185970 ?auto_185968 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_185978 - OBJ
      ?auto_185979 - OBJ
      ?auto_185977 - LOCATION
    )
    :vars
    (
      ?auto_185983 - LOCATION
      ?auto_185985 - CITY
      ?auto_185980 - OBJ
      ?auto_185981 - LOCATION
      ?auto_185982 - OBJ
      ?auto_185984 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_185979 ?auto_185978 ) ) ( IN-CITY ?auto_185983 ?auto_185985 ) ( IN-CITY ?auto_185977 ?auto_185985 ) ( not ( = ?auto_185977 ?auto_185983 ) ) ( OBJ-AT ?auto_185979 ?auto_185977 ) ( OBJ-AT ?auto_185978 ?auto_185983 ) ( not ( = ?auto_185980 ?auto_185979 ) ) ( not ( = ?auto_185978 ?auto_185980 ) ) ( IN-CITY ?auto_185981 ?auto_185985 ) ( not ( = ?auto_185977 ?auto_185981 ) ) ( not ( = ?auto_185983 ?auto_185981 ) ) ( OBJ-AT ?auto_185980 ?auto_185981 ) ( not ( = ?auto_185982 ?auto_185979 ) ) ( not ( = ?auto_185978 ?auto_185982 ) ) ( not ( = ?auto_185980 ?auto_185982 ) ) ( TRUCK-AT ?auto_185984 ?auto_185983 ) ( OBJ-AT ?auto_185982 ?auto_185983 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_185979 ?auto_185978 ?auto_185977 )
      ( DELIVER-2PKG-VERIFY ?auto_185978 ?auto_185979 ?auto_185977 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_185987 - OBJ
      ?auto_185988 - OBJ
      ?auto_185986 - LOCATION
    )
    :vars
    (
      ?auto_185994 - OBJ
      ?auto_185991 - LOCATION
      ?auto_185993 - CITY
      ?auto_185989 - OBJ
      ?auto_185990 - LOCATION
      ?auto_185992 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_185988 ?auto_185987 ) ) ( not ( = ?auto_185987 ?auto_185994 ) ) ( IN-CITY ?auto_185991 ?auto_185993 ) ( IN-CITY ?auto_185986 ?auto_185993 ) ( not ( = ?auto_185986 ?auto_185991 ) ) ( OBJ-AT ?auto_185994 ?auto_185986 ) ( OBJ-AT ?auto_185987 ?auto_185991 ) ( not ( = ?auto_185989 ?auto_185994 ) ) ( not ( = ?auto_185987 ?auto_185989 ) ) ( IN-CITY ?auto_185990 ?auto_185993 ) ( not ( = ?auto_185986 ?auto_185990 ) ) ( not ( = ?auto_185991 ?auto_185990 ) ) ( OBJ-AT ?auto_185989 ?auto_185990 ) ( not ( = ?auto_185988 ?auto_185994 ) ) ( not ( = ?auto_185989 ?auto_185988 ) ) ( TRUCK-AT ?auto_185992 ?auto_185991 ) ( OBJ-AT ?auto_185988 ?auto_185991 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_185994 ?auto_185987 ?auto_185986 )
      ( DELIVER-2PKG-VERIFY ?auto_185987 ?auto_185988 ?auto_185986 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_185996 - OBJ
      ?auto_185997 - OBJ
      ?auto_185995 - LOCATION
    )
    :vars
    (
      ?auto_186003 - OBJ
      ?auto_186000 - LOCATION
      ?auto_186002 - CITY
      ?auto_185998 - LOCATION
      ?auto_185999 - OBJ
      ?auto_186001 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_185997 ?auto_185996 ) ) ( not ( = ?auto_185996 ?auto_186003 ) ) ( IN-CITY ?auto_186000 ?auto_186002 ) ( IN-CITY ?auto_185995 ?auto_186002 ) ( not ( = ?auto_185995 ?auto_186000 ) ) ( OBJ-AT ?auto_186003 ?auto_185995 ) ( OBJ-AT ?auto_185996 ?auto_186000 ) ( not ( = ?auto_185997 ?auto_186003 ) ) ( IN-CITY ?auto_185998 ?auto_186002 ) ( not ( = ?auto_185995 ?auto_185998 ) ) ( not ( = ?auto_186000 ?auto_185998 ) ) ( OBJ-AT ?auto_185997 ?auto_185998 ) ( not ( = ?auto_185999 ?auto_186003 ) ) ( not ( = ?auto_185996 ?auto_185999 ) ) ( not ( = ?auto_185997 ?auto_185999 ) ) ( TRUCK-AT ?auto_186001 ?auto_186000 ) ( OBJ-AT ?auto_185999 ?auto_186000 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186003 ?auto_185996 ?auto_185995 )
      ( DELIVER-2PKG-VERIFY ?auto_185996 ?auto_185997 ?auto_185995 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_186025 - OBJ
      ?auto_186026 - OBJ
      ?auto_186027 - OBJ
      ?auto_186024 - LOCATION
    )
    :vars
    (
      ?auto_186030 - LOCATION
      ?auto_186032 - CITY
      ?auto_186028 - OBJ
      ?auto_186029 - LOCATION
      ?auto_186031 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186026 ?auto_186025 ) ) ( not ( = ?auto_186027 ?auto_186025 ) ) ( not ( = ?auto_186027 ?auto_186026 ) ) ( IN-CITY ?auto_186030 ?auto_186032 ) ( IN-CITY ?auto_186024 ?auto_186032 ) ( not ( = ?auto_186024 ?auto_186030 ) ) ( OBJ-AT ?auto_186025 ?auto_186024 ) ( OBJ-AT ?auto_186027 ?auto_186030 ) ( not ( = ?auto_186028 ?auto_186025 ) ) ( not ( = ?auto_186027 ?auto_186028 ) ) ( IN-CITY ?auto_186029 ?auto_186032 ) ( not ( = ?auto_186024 ?auto_186029 ) ) ( not ( = ?auto_186030 ?auto_186029 ) ) ( OBJ-AT ?auto_186028 ?auto_186029 ) ( not ( = ?auto_186028 ?auto_186026 ) ) ( TRUCK-AT ?auto_186031 ?auto_186030 ) ( OBJ-AT ?auto_186026 ?auto_186030 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186025 ?auto_186027 ?auto_186024 )
      ( DELIVER-3PKG-VERIFY ?auto_186025 ?auto_186026 ?auto_186027 ?auto_186024 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_186034 - OBJ
      ?auto_186035 - OBJ
      ?auto_186036 - OBJ
      ?auto_186033 - LOCATION
    )
    :vars
    (
      ?auto_186039 - LOCATION
      ?auto_186041 - CITY
      ?auto_186037 - LOCATION
      ?auto_186038 - OBJ
      ?auto_186040 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186035 ?auto_186034 ) ) ( not ( = ?auto_186036 ?auto_186034 ) ) ( not ( = ?auto_186036 ?auto_186035 ) ) ( IN-CITY ?auto_186039 ?auto_186041 ) ( IN-CITY ?auto_186033 ?auto_186041 ) ( not ( = ?auto_186033 ?auto_186039 ) ) ( OBJ-AT ?auto_186034 ?auto_186033 ) ( OBJ-AT ?auto_186036 ?auto_186039 ) ( IN-CITY ?auto_186037 ?auto_186041 ) ( not ( = ?auto_186033 ?auto_186037 ) ) ( not ( = ?auto_186039 ?auto_186037 ) ) ( OBJ-AT ?auto_186035 ?auto_186037 ) ( not ( = ?auto_186038 ?auto_186034 ) ) ( not ( = ?auto_186036 ?auto_186038 ) ) ( not ( = ?auto_186035 ?auto_186038 ) ) ( TRUCK-AT ?auto_186040 ?auto_186039 ) ( OBJ-AT ?auto_186038 ?auto_186039 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186034 ?auto_186036 ?auto_186033 )
      ( DELIVER-3PKG-VERIFY ?auto_186034 ?auto_186035 ?auto_186036 ?auto_186033 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_186053 - OBJ
      ?auto_186054 - OBJ
      ?auto_186055 - OBJ
      ?auto_186052 - LOCATION
    )
    :vars
    (
      ?auto_186058 - LOCATION
      ?auto_186060 - CITY
      ?auto_186056 - OBJ
      ?auto_186057 - LOCATION
      ?auto_186059 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186054 ?auto_186053 ) ) ( not ( = ?auto_186055 ?auto_186053 ) ) ( not ( = ?auto_186055 ?auto_186054 ) ) ( IN-CITY ?auto_186058 ?auto_186060 ) ( IN-CITY ?auto_186052 ?auto_186060 ) ( not ( = ?auto_186052 ?auto_186058 ) ) ( OBJ-AT ?auto_186053 ?auto_186052 ) ( OBJ-AT ?auto_186054 ?auto_186058 ) ( not ( = ?auto_186056 ?auto_186053 ) ) ( not ( = ?auto_186054 ?auto_186056 ) ) ( IN-CITY ?auto_186057 ?auto_186060 ) ( not ( = ?auto_186052 ?auto_186057 ) ) ( not ( = ?auto_186058 ?auto_186057 ) ) ( OBJ-AT ?auto_186056 ?auto_186057 ) ( not ( = ?auto_186056 ?auto_186055 ) ) ( TRUCK-AT ?auto_186059 ?auto_186058 ) ( OBJ-AT ?auto_186055 ?auto_186058 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186053 ?auto_186054 ?auto_186052 )
      ( DELIVER-3PKG-VERIFY ?auto_186053 ?auto_186054 ?auto_186055 ?auto_186052 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_186062 - OBJ
      ?auto_186063 - OBJ
      ?auto_186064 - OBJ
      ?auto_186061 - LOCATION
    )
    :vars
    (
      ?auto_186067 - LOCATION
      ?auto_186069 - CITY
      ?auto_186065 - LOCATION
      ?auto_186066 - OBJ
      ?auto_186068 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186063 ?auto_186062 ) ) ( not ( = ?auto_186064 ?auto_186062 ) ) ( not ( = ?auto_186064 ?auto_186063 ) ) ( IN-CITY ?auto_186067 ?auto_186069 ) ( IN-CITY ?auto_186061 ?auto_186069 ) ( not ( = ?auto_186061 ?auto_186067 ) ) ( OBJ-AT ?auto_186062 ?auto_186061 ) ( OBJ-AT ?auto_186063 ?auto_186067 ) ( IN-CITY ?auto_186065 ?auto_186069 ) ( not ( = ?auto_186061 ?auto_186065 ) ) ( not ( = ?auto_186067 ?auto_186065 ) ) ( OBJ-AT ?auto_186064 ?auto_186065 ) ( not ( = ?auto_186066 ?auto_186062 ) ) ( not ( = ?auto_186063 ?auto_186066 ) ) ( not ( = ?auto_186064 ?auto_186066 ) ) ( TRUCK-AT ?auto_186068 ?auto_186067 ) ( OBJ-AT ?auto_186066 ?auto_186067 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186062 ?auto_186063 ?auto_186061 )
      ( DELIVER-3PKG-VERIFY ?auto_186062 ?auto_186063 ?auto_186064 ?auto_186061 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_186081 - OBJ
      ?auto_186082 - OBJ
      ?auto_186083 - OBJ
      ?auto_186080 - LOCATION
    )
    :vars
    (
      ?auto_186086 - LOCATION
      ?auto_186088 - CITY
      ?auto_186084 - OBJ
      ?auto_186085 - LOCATION
      ?auto_186087 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186082 ?auto_186081 ) ) ( not ( = ?auto_186083 ?auto_186081 ) ) ( not ( = ?auto_186083 ?auto_186082 ) ) ( IN-CITY ?auto_186086 ?auto_186088 ) ( IN-CITY ?auto_186080 ?auto_186088 ) ( not ( = ?auto_186080 ?auto_186086 ) ) ( OBJ-AT ?auto_186082 ?auto_186080 ) ( OBJ-AT ?auto_186083 ?auto_186086 ) ( not ( = ?auto_186084 ?auto_186082 ) ) ( not ( = ?auto_186083 ?auto_186084 ) ) ( IN-CITY ?auto_186085 ?auto_186088 ) ( not ( = ?auto_186080 ?auto_186085 ) ) ( not ( = ?auto_186086 ?auto_186085 ) ) ( OBJ-AT ?auto_186084 ?auto_186085 ) ( not ( = ?auto_186084 ?auto_186081 ) ) ( TRUCK-AT ?auto_186087 ?auto_186086 ) ( OBJ-AT ?auto_186081 ?auto_186086 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186082 ?auto_186083 ?auto_186080 )
      ( DELIVER-3PKG-VERIFY ?auto_186081 ?auto_186082 ?auto_186083 ?auto_186080 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_186100 - OBJ
      ?auto_186101 - OBJ
      ?auto_186102 - OBJ
      ?auto_186099 - LOCATION
    )
    :vars
    (
      ?auto_186107 - OBJ
      ?auto_186104 - LOCATION
      ?auto_186106 - CITY
      ?auto_186103 - LOCATION
      ?auto_186105 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186101 ?auto_186100 ) ) ( not ( = ?auto_186102 ?auto_186100 ) ) ( not ( = ?auto_186102 ?auto_186101 ) ) ( not ( = ?auto_186102 ?auto_186107 ) ) ( IN-CITY ?auto_186104 ?auto_186106 ) ( IN-CITY ?auto_186099 ?auto_186106 ) ( not ( = ?auto_186099 ?auto_186104 ) ) ( OBJ-AT ?auto_186107 ?auto_186099 ) ( OBJ-AT ?auto_186102 ?auto_186104 ) ( not ( = ?auto_186101 ?auto_186107 ) ) ( IN-CITY ?auto_186103 ?auto_186106 ) ( not ( = ?auto_186099 ?auto_186103 ) ) ( not ( = ?auto_186104 ?auto_186103 ) ) ( OBJ-AT ?auto_186101 ?auto_186103 ) ( not ( = ?auto_186100 ?auto_186107 ) ) ( TRUCK-AT ?auto_186105 ?auto_186104 ) ( OBJ-AT ?auto_186100 ?auto_186104 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186107 ?auto_186102 ?auto_186099 )
      ( DELIVER-3PKG-VERIFY ?auto_186100 ?auto_186101 ?auto_186102 ?auto_186099 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_186109 - OBJ
      ?auto_186110 - OBJ
      ?auto_186111 - OBJ
      ?auto_186108 - LOCATION
    )
    :vars
    (
      ?auto_186114 - LOCATION
      ?auto_186116 - CITY
      ?auto_186112 - OBJ
      ?auto_186113 - LOCATION
      ?auto_186115 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186110 ?auto_186109 ) ) ( not ( = ?auto_186111 ?auto_186109 ) ) ( not ( = ?auto_186111 ?auto_186110 ) ) ( IN-CITY ?auto_186114 ?auto_186116 ) ( IN-CITY ?auto_186108 ?auto_186116 ) ( not ( = ?auto_186108 ?auto_186114 ) ) ( OBJ-AT ?auto_186111 ?auto_186108 ) ( OBJ-AT ?auto_186110 ?auto_186114 ) ( not ( = ?auto_186112 ?auto_186111 ) ) ( not ( = ?auto_186110 ?auto_186112 ) ) ( IN-CITY ?auto_186113 ?auto_186116 ) ( not ( = ?auto_186108 ?auto_186113 ) ) ( not ( = ?auto_186114 ?auto_186113 ) ) ( OBJ-AT ?auto_186112 ?auto_186113 ) ( not ( = ?auto_186112 ?auto_186109 ) ) ( TRUCK-AT ?auto_186115 ?auto_186114 ) ( OBJ-AT ?auto_186109 ?auto_186114 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186111 ?auto_186110 ?auto_186108 )
      ( DELIVER-3PKG-VERIFY ?auto_186109 ?auto_186110 ?auto_186111 ?auto_186108 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_186128 - OBJ
      ?auto_186129 - OBJ
      ?auto_186130 - OBJ
      ?auto_186127 - LOCATION
    )
    :vars
    (
      ?auto_186135 - OBJ
      ?auto_186132 - LOCATION
      ?auto_186134 - CITY
      ?auto_186131 - LOCATION
      ?auto_186133 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186129 ?auto_186128 ) ) ( not ( = ?auto_186130 ?auto_186128 ) ) ( not ( = ?auto_186130 ?auto_186129 ) ) ( not ( = ?auto_186129 ?auto_186135 ) ) ( IN-CITY ?auto_186132 ?auto_186134 ) ( IN-CITY ?auto_186127 ?auto_186134 ) ( not ( = ?auto_186127 ?auto_186132 ) ) ( OBJ-AT ?auto_186135 ?auto_186127 ) ( OBJ-AT ?auto_186129 ?auto_186132 ) ( not ( = ?auto_186130 ?auto_186135 ) ) ( IN-CITY ?auto_186131 ?auto_186134 ) ( not ( = ?auto_186127 ?auto_186131 ) ) ( not ( = ?auto_186132 ?auto_186131 ) ) ( OBJ-AT ?auto_186130 ?auto_186131 ) ( not ( = ?auto_186128 ?auto_186135 ) ) ( TRUCK-AT ?auto_186133 ?auto_186132 ) ( OBJ-AT ?auto_186128 ?auto_186132 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186135 ?auto_186129 ?auto_186127 )
      ( DELIVER-3PKG-VERIFY ?auto_186128 ?auto_186129 ?auto_186130 ?auto_186127 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_186147 - OBJ
      ?auto_186148 - OBJ
      ?auto_186149 - OBJ
      ?auto_186146 - LOCATION
    )
    :vars
    (
      ?auto_186152 - LOCATION
      ?auto_186154 - CITY
      ?auto_186150 - LOCATION
      ?auto_186151 - OBJ
      ?auto_186153 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186148 ?auto_186147 ) ) ( not ( = ?auto_186149 ?auto_186147 ) ) ( not ( = ?auto_186149 ?auto_186148 ) ) ( IN-CITY ?auto_186152 ?auto_186154 ) ( IN-CITY ?auto_186146 ?auto_186154 ) ( not ( = ?auto_186146 ?auto_186152 ) ) ( OBJ-AT ?auto_186148 ?auto_186146 ) ( OBJ-AT ?auto_186149 ?auto_186152 ) ( IN-CITY ?auto_186150 ?auto_186154 ) ( not ( = ?auto_186146 ?auto_186150 ) ) ( not ( = ?auto_186152 ?auto_186150 ) ) ( OBJ-AT ?auto_186147 ?auto_186150 ) ( not ( = ?auto_186151 ?auto_186148 ) ) ( not ( = ?auto_186149 ?auto_186151 ) ) ( not ( = ?auto_186147 ?auto_186151 ) ) ( TRUCK-AT ?auto_186153 ?auto_186152 ) ( OBJ-AT ?auto_186151 ?auto_186152 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186148 ?auto_186149 ?auto_186146 )
      ( DELIVER-3PKG-VERIFY ?auto_186147 ?auto_186148 ?auto_186149 ?auto_186146 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_186156 - OBJ
      ?auto_186157 - OBJ
      ?auto_186158 - OBJ
      ?auto_186155 - LOCATION
    )
    :vars
    (
      ?auto_186163 - OBJ
      ?auto_186160 - LOCATION
      ?auto_186162 - CITY
      ?auto_186159 - LOCATION
      ?auto_186161 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186157 ?auto_186156 ) ) ( not ( = ?auto_186158 ?auto_186156 ) ) ( not ( = ?auto_186158 ?auto_186157 ) ) ( not ( = ?auto_186158 ?auto_186163 ) ) ( IN-CITY ?auto_186160 ?auto_186162 ) ( IN-CITY ?auto_186155 ?auto_186162 ) ( not ( = ?auto_186155 ?auto_186160 ) ) ( OBJ-AT ?auto_186163 ?auto_186155 ) ( OBJ-AT ?auto_186158 ?auto_186160 ) ( not ( = ?auto_186156 ?auto_186163 ) ) ( IN-CITY ?auto_186159 ?auto_186162 ) ( not ( = ?auto_186155 ?auto_186159 ) ) ( not ( = ?auto_186160 ?auto_186159 ) ) ( OBJ-AT ?auto_186156 ?auto_186159 ) ( not ( = ?auto_186157 ?auto_186163 ) ) ( TRUCK-AT ?auto_186161 ?auto_186160 ) ( OBJ-AT ?auto_186157 ?auto_186160 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186163 ?auto_186158 ?auto_186155 )
      ( DELIVER-3PKG-VERIFY ?auto_186156 ?auto_186157 ?auto_186158 ?auto_186155 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_186175 - OBJ
      ?auto_186176 - OBJ
      ?auto_186177 - OBJ
      ?auto_186174 - LOCATION
    )
    :vars
    (
      ?auto_186180 - LOCATION
      ?auto_186182 - CITY
      ?auto_186178 - LOCATION
      ?auto_186179 - OBJ
      ?auto_186181 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186176 ?auto_186175 ) ) ( not ( = ?auto_186177 ?auto_186175 ) ) ( not ( = ?auto_186177 ?auto_186176 ) ) ( IN-CITY ?auto_186180 ?auto_186182 ) ( IN-CITY ?auto_186174 ?auto_186182 ) ( not ( = ?auto_186174 ?auto_186180 ) ) ( OBJ-AT ?auto_186177 ?auto_186174 ) ( OBJ-AT ?auto_186176 ?auto_186180 ) ( IN-CITY ?auto_186178 ?auto_186182 ) ( not ( = ?auto_186174 ?auto_186178 ) ) ( not ( = ?auto_186180 ?auto_186178 ) ) ( OBJ-AT ?auto_186175 ?auto_186178 ) ( not ( = ?auto_186179 ?auto_186177 ) ) ( not ( = ?auto_186176 ?auto_186179 ) ) ( not ( = ?auto_186175 ?auto_186179 ) ) ( TRUCK-AT ?auto_186181 ?auto_186180 ) ( OBJ-AT ?auto_186179 ?auto_186180 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186177 ?auto_186176 ?auto_186174 )
      ( DELIVER-3PKG-VERIFY ?auto_186175 ?auto_186176 ?auto_186177 ?auto_186174 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_186184 - OBJ
      ?auto_186185 - OBJ
      ?auto_186186 - OBJ
      ?auto_186183 - LOCATION
    )
    :vars
    (
      ?auto_186191 - OBJ
      ?auto_186188 - LOCATION
      ?auto_186190 - CITY
      ?auto_186187 - LOCATION
      ?auto_186189 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186185 ?auto_186184 ) ) ( not ( = ?auto_186186 ?auto_186184 ) ) ( not ( = ?auto_186186 ?auto_186185 ) ) ( not ( = ?auto_186185 ?auto_186191 ) ) ( IN-CITY ?auto_186188 ?auto_186190 ) ( IN-CITY ?auto_186183 ?auto_186190 ) ( not ( = ?auto_186183 ?auto_186188 ) ) ( OBJ-AT ?auto_186191 ?auto_186183 ) ( OBJ-AT ?auto_186185 ?auto_186188 ) ( not ( = ?auto_186184 ?auto_186191 ) ) ( IN-CITY ?auto_186187 ?auto_186190 ) ( not ( = ?auto_186183 ?auto_186187 ) ) ( not ( = ?auto_186188 ?auto_186187 ) ) ( OBJ-AT ?auto_186184 ?auto_186187 ) ( not ( = ?auto_186186 ?auto_186191 ) ) ( TRUCK-AT ?auto_186189 ?auto_186188 ) ( OBJ-AT ?auto_186186 ?auto_186188 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186191 ?auto_186185 ?auto_186183 )
      ( DELIVER-3PKG-VERIFY ?auto_186184 ?auto_186185 ?auto_186186 ?auto_186183 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_186223 - OBJ
      ?auto_186224 - OBJ
      ?auto_186225 - OBJ
      ?auto_186222 - LOCATION
    )
    :vars
    (
      ?auto_186228 - LOCATION
      ?auto_186230 - CITY
      ?auto_186226 - OBJ
      ?auto_186227 - LOCATION
      ?auto_186229 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186224 ?auto_186223 ) ) ( not ( = ?auto_186225 ?auto_186223 ) ) ( not ( = ?auto_186225 ?auto_186224 ) ) ( IN-CITY ?auto_186228 ?auto_186230 ) ( IN-CITY ?auto_186222 ?auto_186230 ) ( not ( = ?auto_186222 ?auto_186228 ) ) ( OBJ-AT ?auto_186224 ?auto_186222 ) ( OBJ-AT ?auto_186223 ?auto_186228 ) ( not ( = ?auto_186226 ?auto_186224 ) ) ( not ( = ?auto_186223 ?auto_186226 ) ) ( IN-CITY ?auto_186227 ?auto_186230 ) ( not ( = ?auto_186222 ?auto_186227 ) ) ( not ( = ?auto_186228 ?auto_186227 ) ) ( OBJ-AT ?auto_186226 ?auto_186227 ) ( not ( = ?auto_186226 ?auto_186225 ) ) ( TRUCK-AT ?auto_186229 ?auto_186228 ) ( OBJ-AT ?auto_186225 ?auto_186228 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186224 ?auto_186223 ?auto_186222 )
      ( DELIVER-3PKG-VERIFY ?auto_186223 ?auto_186224 ?auto_186225 ?auto_186222 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_186232 - OBJ
      ?auto_186233 - OBJ
      ?auto_186234 - OBJ
      ?auto_186231 - LOCATION
    )
    :vars
    (
      ?auto_186237 - LOCATION
      ?auto_186239 - CITY
      ?auto_186235 - LOCATION
      ?auto_186236 - OBJ
      ?auto_186238 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186233 ?auto_186232 ) ) ( not ( = ?auto_186234 ?auto_186232 ) ) ( not ( = ?auto_186234 ?auto_186233 ) ) ( IN-CITY ?auto_186237 ?auto_186239 ) ( IN-CITY ?auto_186231 ?auto_186239 ) ( not ( = ?auto_186231 ?auto_186237 ) ) ( OBJ-AT ?auto_186233 ?auto_186231 ) ( OBJ-AT ?auto_186232 ?auto_186237 ) ( IN-CITY ?auto_186235 ?auto_186239 ) ( not ( = ?auto_186231 ?auto_186235 ) ) ( not ( = ?auto_186237 ?auto_186235 ) ) ( OBJ-AT ?auto_186234 ?auto_186235 ) ( not ( = ?auto_186236 ?auto_186233 ) ) ( not ( = ?auto_186232 ?auto_186236 ) ) ( not ( = ?auto_186234 ?auto_186236 ) ) ( TRUCK-AT ?auto_186238 ?auto_186237 ) ( OBJ-AT ?auto_186236 ?auto_186237 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186233 ?auto_186232 ?auto_186231 )
      ( DELIVER-3PKG-VERIFY ?auto_186232 ?auto_186233 ?auto_186234 ?auto_186231 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_186251 - OBJ
      ?auto_186252 - OBJ
      ?auto_186253 - OBJ
      ?auto_186250 - LOCATION
    )
    :vars
    (
      ?auto_186256 - LOCATION
      ?auto_186258 - CITY
      ?auto_186254 - OBJ
      ?auto_186255 - LOCATION
      ?auto_186257 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186252 ?auto_186251 ) ) ( not ( = ?auto_186253 ?auto_186251 ) ) ( not ( = ?auto_186253 ?auto_186252 ) ) ( IN-CITY ?auto_186256 ?auto_186258 ) ( IN-CITY ?auto_186250 ?auto_186258 ) ( not ( = ?auto_186250 ?auto_186256 ) ) ( OBJ-AT ?auto_186253 ?auto_186250 ) ( OBJ-AT ?auto_186251 ?auto_186256 ) ( not ( = ?auto_186254 ?auto_186253 ) ) ( not ( = ?auto_186251 ?auto_186254 ) ) ( IN-CITY ?auto_186255 ?auto_186258 ) ( not ( = ?auto_186250 ?auto_186255 ) ) ( not ( = ?auto_186256 ?auto_186255 ) ) ( OBJ-AT ?auto_186254 ?auto_186255 ) ( not ( = ?auto_186254 ?auto_186252 ) ) ( TRUCK-AT ?auto_186257 ?auto_186256 ) ( OBJ-AT ?auto_186252 ?auto_186256 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186253 ?auto_186251 ?auto_186250 )
      ( DELIVER-3PKG-VERIFY ?auto_186251 ?auto_186252 ?auto_186253 ?auto_186250 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_186270 - OBJ
      ?auto_186271 - OBJ
      ?auto_186272 - OBJ
      ?auto_186269 - LOCATION
    )
    :vars
    (
      ?auto_186277 - OBJ
      ?auto_186274 - LOCATION
      ?auto_186276 - CITY
      ?auto_186273 - LOCATION
      ?auto_186275 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186271 ?auto_186270 ) ) ( not ( = ?auto_186272 ?auto_186270 ) ) ( not ( = ?auto_186272 ?auto_186271 ) ) ( not ( = ?auto_186270 ?auto_186277 ) ) ( IN-CITY ?auto_186274 ?auto_186276 ) ( IN-CITY ?auto_186269 ?auto_186276 ) ( not ( = ?auto_186269 ?auto_186274 ) ) ( OBJ-AT ?auto_186277 ?auto_186269 ) ( OBJ-AT ?auto_186270 ?auto_186274 ) ( not ( = ?auto_186272 ?auto_186277 ) ) ( IN-CITY ?auto_186273 ?auto_186276 ) ( not ( = ?auto_186269 ?auto_186273 ) ) ( not ( = ?auto_186274 ?auto_186273 ) ) ( OBJ-AT ?auto_186272 ?auto_186273 ) ( not ( = ?auto_186271 ?auto_186277 ) ) ( TRUCK-AT ?auto_186275 ?auto_186274 ) ( OBJ-AT ?auto_186271 ?auto_186274 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186277 ?auto_186270 ?auto_186269 )
      ( DELIVER-3PKG-VERIFY ?auto_186270 ?auto_186271 ?auto_186272 ?auto_186269 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_186289 - OBJ
      ?auto_186290 - OBJ
      ?auto_186291 - OBJ
      ?auto_186288 - LOCATION
    )
    :vars
    (
      ?auto_186294 - LOCATION
      ?auto_186296 - CITY
      ?auto_186292 - LOCATION
      ?auto_186293 - OBJ
      ?auto_186295 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186290 ?auto_186289 ) ) ( not ( = ?auto_186291 ?auto_186289 ) ) ( not ( = ?auto_186291 ?auto_186290 ) ) ( IN-CITY ?auto_186294 ?auto_186296 ) ( IN-CITY ?auto_186288 ?auto_186296 ) ( not ( = ?auto_186288 ?auto_186294 ) ) ( OBJ-AT ?auto_186291 ?auto_186288 ) ( OBJ-AT ?auto_186289 ?auto_186294 ) ( IN-CITY ?auto_186292 ?auto_186296 ) ( not ( = ?auto_186288 ?auto_186292 ) ) ( not ( = ?auto_186294 ?auto_186292 ) ) ( OBJ-AT ?auto_186290 ?auto_186292 ) ( not ( = ?auto_186293 ?auto_186291 ) ) ( not ( = ?auto_186289 ?auto_186293 ) ) ( not ( = ?auto_186290 ?auto_186293 ) ) ( TRUCK-AT ?auto_186295 ?auto_186294 ) ( OBJ-AT ?auto_186293 ?auto_186294 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186291 ?auto_186289 ?auto_186288 )
      ( DELIVER-3PKG-VERIFY ?auto_186289 ?auto_186290 ?auto_186291 ?auto_186288 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_186298 - OBJ
      ?auto_186299 - OBJ
      ?auto_186300 - OBJ
      ?auto_186297 - LOCATION
    )
    :vars
    (
      ?auto_186305 - OBJ
      ?auto_186302 - LOCATION
      ?auto_186304 - CITY
      ?auto_186301 - LOCATION
      ?auto_186303 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186299 ?auto_186298 ) ) ( not ( = ?auto_186300 ?auto_186298 ) ) ( not ( = ?auto_186300 ?auto_186299 ) ) ( not ( = ?auto_186298 ?auto_186305 ) ) ( IN-CITY ?auto_186302 ?auto_186304 ) ( IN-CITY ?auto_186297 ?auto_186304 ) ( not ( = ?auto_186297 ?auto_186302 ) ) ( OBJ-AT ?auto_186305 ?auto_186297 ) ( OBJ-AT ?auto_186298 ?auto_186302 ) ( not ( = ?auto_186299 ?auto_186305 ) ) ( IN-CITY ?auto_186301 ?auto_186304 ) ( not ( = ?auto_186297 ?auto_186301 ) ) ( not ( = ?auto_186302 ?auto_186301 ) ) ( OBJ-AT ?auto_186299 ?auto_186301 ) ( not ( = ?auto_186300 ?auto_186305 ) ) ( TRUCK-AT ?auto_186303 ?auto_186302 ) ( OBJ-AT ?auto_186300 ?auto_186302 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186305 ?auto_186298 ?auto_186297 )
      ( DELIVER-3PKG-VERIFY ?auto_186298 ?auto_186299 ?auto_186300 ?auto_186297 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_186461 - OBJ
      ?auto_186462 - OBJ
      ?auto_186463 - OBJ
      ?auto_186464 - OBJ
      ?auto_186460 - LOCATION
    )
    :vars
    (
      ?auto_186466 - LOCATION
      ?auto_186468 - CITY
      ?auto_186465 - LOCATION
      ?auto_186467 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186462 ?auto_186461 ) ) ( not ( = ?auto_186463 ?auto_186461 ) ) ( not ( = ?auto_186463 ?auto_186462 ) ) ( not ( = ?auto_186464 ?auto_186461 ) ) ( not ( = ?auto_186464 ?auto_186462 ) ) ( not ( = ?auto_186464 ?auto_186463 ) ) ( IN-CITY ?auto_186466 ?auto_186468 ) ( IN-CITY ?auto_186460 ?auto_186468 ) ( not ( = ?auto_186460 ?auto_186466 ) ) ( OBJ-AT ?auto_186461 ?auto_186460 ) ( OBJ-AT ?auto_186464 ?auto_186466 ) ( IN-CITY ?auto_186465 ?auto_186468 ) ( not ( = ?auto_186460 ?auto_186465 ) ) ( not ( = ?auto_186466 ?auto_186465 ) ) ( OBJ-AT ?auto_186463 ?auto_186465 ) ( TRUCK-AT ?auto_186467 ?auto_186466 ) ( OBJ-AT ?auto_186462 ?auto_186466 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186461 ?auto_186464 ?auto_186460 )
      ( DELIVER-4PKG-VERIFY ?auto_186461 ?auto_186462 ?auto_186463 ?auto_186464 ?auto_186460 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_186490 - OBJ
      ?auto_186491 - OBJ
      ?auto_186492 - OBJ
      ?auto_186493 - OBJ
      ?auto_186489 - LOCATION
    )
    :vars
    (
      ?auto_186495 - LOCATION
      ?auto_186497 - CITY
      ?auto_186494 - LOCATION
      ?auto_186496 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186491 ?auto_186490 ) ) ( not ( = ?auto_186492 ?auto_186490 ) ) ( not ( = ?auto_186492 ?auto_186491 ) ) ( not ( = ?auto_186493 ?auto_186490 ) ) ( not ( = ?auto_186493 ?auto_186491 ) ) ( not ( = ?auto_186493 ?auto_186492 ) ) ( IN-CITY ?auto_186495 ?auto_186497 ) ( IN-CITY ?auto_186489 ?auto_186497 ) ( not ( = ?auto_186489 ?auto_186495 ) ) ( OBJ-AT ?auto_186490 ?auto_186489 ) ( OBJ-AT ?auto_186492 ?auto_186495 ) ( IN-CITY ?auto_186494 ?auto_186497 ) ( not ( = ?auto_186489 ?auto_186494 ) ) ( not ( = ?auto_186495 ?auto_186494 ) ) ( OBJ-AT ?auto_186493 ?auto_186494 ) ( TRUCK-AT ?auto_186496 ?auto_186495 ) ( OBJ-AT ?auto_186491 ?auto_186495 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186490 ?auto_186492 ?auto_186489 )
      ( DELIVER-4PKG-VERIFY ?auto_186490 ?auto_186491 ?auto_186492 ?auto_186493 ?auto_186489 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_186519 - OBJ
      ?auto_186520 - OBJ
      ?auto_186521 - OBJ
      ?auto_186522 - OBJ
      ?auto_186518 - LOCATION
    )
    :vars
    (
      ?auto_186524 - LOCATION
      ?auto_186526 - CITY
      ?auto_186523 - LOCATION
      ?auto_186525 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186520 ?auto_186519 ) ) ( not ( = ?auto_186521 ?auto_186519 ) ) ( not ( = ?auto_186521 ?auto_186520 ) ) ( not ( = ?auto_186522 ?auto_186519 ) ) ( not ( = ?auto_186522 ?auto_186520 ) ) ( not ( = ?auto_186522 ?auto_186521 ) ) ( IN-CITY ?auto_186524 ?auto_186526 ) ( IN-CITY ?auto_186518 ?auto_186526 ) ( not ( = ?auto_186518 ?auto_186524 ) ) ( OBJ-AT ?auto_186519 ?auto_186518 ) ( OBJ-AT ?auto_186522 ?auto_186524 ) ( IN-CITY ?auto_186523 ?auto_186526 ) ( not ( = ?auto_186518 ?auto_186523 ) ) ( not ( = ?auto_186524 ?auto_186523 ) ) ( OBJ-AT ?auto_186520 ?auto_186523 ) ( TRUCK-AT ?auto_186525 ?auto_186524 ) ( OBJ-AT ?auto_186521 ?auto_186524 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186519 ?auto_186522 ?auto_186518 )
      ( DELIVER-4PKG-VERIFY ?auto_186519 ?auto_186520 ?auto_186521 ?auto_186522 ?auto_186518 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_186548 - OBJ
      ?auto_186549 - OBJ
      ?auto_186550 - OBJ
      ?auto_186551 - OBJ
      ?auto_186547 - LOCATION
    )
    :vars
    (
      ?auto_186553 - LOCATION
      ?auto_186555 - CITY
      ?auto_186552 - LOCATION
      ?auto_186554 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186549 ?auto_186548 ) ) ( not ( = ?auto_186550 ?auto_186548 ) ) ( not ( = ?auto_186550 ?auto_186549 ) ) ( not ( = ?auto_186551 ?auto_186548 ) ) ( not ( = ?auto_186551 ?auto_186549 ) ) ( not ( = ?auto_186551 ?auto_186550 ) ) ( IN-CITY ?auto_186553 ?auto_186555 ) ( IN-CITY ?auto_186547 ?auto_186555 ) ( not ( = ?auto_186547 ?auto_186553 ) ) ( OBJ-AT ?auto_186548 ?auto_186547 ) ( OBJ-AT ?auto_186550 ?auto_186553 ) ( IN-CITY ?auto_186552 ?auto_186555 ) ( not ( = ?auto_186547 ?auto_186552 ) ) ( not ( = ?auto_186553 ?auto_186552 ) ) ( OBJ-AT ?auto_186549 ?auto_186552 ) ( TRUCK-AT ?auto_186554 ?auto_186553 ) ( OBJ-AT ?auto_186551 ?auto_186553 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186548 ?auto_186550 ?auto_186547 )
      ( DELIVER-4PKG-VERIFY ?auto_186548 ?auto_186549 ?auto_186550 ?auto_186551 ?auto_186547 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_186639 - OBJ
      ?auto_186640 - OBJ
      ?auto_186641 - OBJ
      ?auto_186642 - OBJ
      ?auto_186638 - LOCATION
    )
    :vars
    (
      ?auto_186644 - LOCATION
      ?auto_186646 - CITY
      ?auto_186643 - LOCATION
      ?auto_186645 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186640 ?auto_186639 ) ) ( not ( = ?auto_186641 ?auto_186639 ) ) ( not ( = ?auto_186641 ?auto_186640 ) ) ( not ( = ?auto_186642 ?auto_186639 ) ) ( not ( = ?auto_186642 ?auto_186640 ) ) ( not ( = ?auto_186642 ?auto_186641 ) ) ( IN-CITY ?auto_186644 ?auto_186646 ) ( IN-CITY ?auto_186638 ?auto_186646 ) ( not ( = ?auto_186638 ?auto_186644 ) ) ( OBJ-AT ?auto_186639 ?auto_186638 ) ( OBJ-AT ?auto_186640 ?auto_186644 ) ( IN-CITY ?auto_186643 ?auto_186646 ) ( not ( = ?auto_186638 ?auto_186643 ) ) ( not ( = ?auto_186644 ?auto_186643 ) ) ( OBJ-AT ?auto_186642 ?auto_186643 ) ( TRUCK-AT ?auto_186645 ?auto_186644 ) ( OBJ-AT ?auto_186641 ?auto_186644 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186639 ?auto_186640 ?auto_186638 )
      ( DELIVER-4PKG-VERIFY ?auto_186639 ?auto_186640 ?auto_186641 ?auto_186642 ?auto_186638 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_186668 - OBJ
      ?auto_186669 - OBJ
      ?auto_186670 - OBJ
      ?auto_186671 - OBJ
      ?auto_186667 - LOCATION
    )
    :vars
    (
      ?auto_186673 - LOCATION
      ?auto_186675 - CITY
      ?auto_186672 - LOCATION
      ?auto_186674 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186669 ?auto_186668 ) ) ( not ( = ?auto_186670 ?auto_186668 ) ) ( not ( = ?auto_186670 ?auto_186669 ) ) ( not ( = ?auto_186671 ?auto_186668 ) ) ( not ( = ?auto_186671 ?auto_186669 ) ) ( not ( = ?auto_186671 ?auto_186670 ) ) ( IN-CITY ?auto_186673 ?auto_186675 ) ( IN-CITY ?auto_186667 ?auto_186675 ) ( not ( = ?auto_186667 ?auto_186673 ) ) ( OBJ-AT ?auto_186668 ?auto_186667 ) ( OBJ-AT ?auto_186669 ?auto_186673 ) ( IN-CITY ?auto_186672 ?auto_186675 ) ( not ( = ?auto_186667 ?auto_186672 ) ) ( not ( = ?auto_186673 ?auto_186672 ) ) ( OBJ-AT ?auto_186670 ?auto_186672 ) ( TRUCK-AT ?auto_186674 ?auto_186673 ) ( OBJ-AT ?auto_186671 ?auto_186673 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186668 ?auto_186669 ?auto_186667 )
      ( DELIVER-4PKG-VERIFY ?auto_186668 ?auto_186669 ?auto_186670 ?auto_186671 ?auto_186667 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_186759 - OBJ
      ?auto_186760 - OBJ
      ?auto_186761 - OBJ
      ?auto_186762 - OBJ
      ?auto_186758 - LOCATION
    )
    :vars
    (
      ?auto_186764 - LOCATION
      ?auto_186766 - CITY
      ?auto_186763 - LOCATION
      ?auto_186765 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186760 ?auto_186759 ) ) ( not ( = ?auto_186761 ?auto_186759 ) ) ( not ( = ?auto_186761 ?auto_186760 ) ) ( not ( = ?auto_186762 ?auto_186759 ) ) ( not ( = ?auto_186762 ?auto_186760 ) ) ( not ( = ?auto_186762 ?auto_186761 ) ) ( IN-CITY ?auto_186764 ?auto_186766 ) ( IN-CITY ?auto_186758 ?auto_186766 ) ( not ( = ?auto_186758 ?auto_186764 ) ) ( OBJ-AT ?auto_186760 ?auto_186758 ) ( OBJ-AT ?auto_186762 ?auto_186764 ) ( IN-CITY ?auto_186763 ?auto_186766 ) ( not ( = ?auto_186758 ?auto_186763 ) ) ( not ( = ?auto_186764 ?auto_186763 ) ) ( OBJ-AT ?auto_186761 ?auto_186763 ) ( TRUCK-AT ?auto_186765 ?auto_186764 ) ( OBJ-AT ?auto_186759 ?auto_186764 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186760 ?auto_186762 ?auto_186758 )
      ( DELIVER-4PKG-VERIFY ?auto_186759 ?auto_186760 ?auto_186761 ?auto_186762 ?auto_186758 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_186788 - OBJ
      ?auto_186789 - OBJ
      ?auto_186790 - OBJ
      ?auto_186791 - OBJ
      ?auto_186787 - LOCATION
    )
    :vars
    (
      ?auto_186793 - LOCATION
      ?auto_186795 - CITY
      ?auto_186792 - LOCATION
      ?auto_186794 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186789 ?auto_186788 ) ) ( not ( = ?auto_186790 ?auto_186788 ) ) ( not ( = ?auto_186790 ?auto_186789 ) ) ( not ( = ?auto_186791 ?auto_186788 ) ) ( not ( = ?auto_186791 ?auto_186789 ) ) ( not ( = ?auto_186791 ?auto_186790 ) ) ( IN-CITY ?auto_186793 ?auto_186795 ) ( IN-CITY ?auto_186787 ?auto_186795 ) ( not ( = ?auto_186787 ?auto_186793 ) ) ( OBJ-AT ?auto_186789 ?auto_186787 ) ( OBJ-AT ?auto_186790 ?auto_186793 ) ( IN-CITY ?auto_186792 ?auto_186795 ) ( not ( = ?auto_186787 ?auto_186792 ) ) ( not ( = ?auto_186793 ?auto_186792 ) ) ( OBJ-AT ?auto_186791 ?auto_186792 ) ( TRUCK-AT ?auto_186794 ?auto_186793 ) ( OBJ-AT ?auto_186788 ?auto_186793 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186789 ?auto_186790 ?auto_186787 )
      ( DELIVER-4PKG-VERIFY ?auto_186788 ?auto_186789 ?auto_186790 ?auto_186791 ?auto_186787 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_186880 - OBJ
      ?auto_186881 - OBJ
      ?auto_186882 - OBJ
      ?auto_186883 - OBJ
      ?auto_186879 - LOCATION
    )
    :vars
    (
      ?auto_186885 - LOCATION
      ?auto_186887 - CITY
      ?auto_186884 - LOCATION
      ?auto_186886 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186881 ?auto_186880 ) ) ( not ( = ?auto_186882 ?auto_186880 ) ) ( not ( = ?auto_186882 ?auto_186881 ) ) ( not ( = ?auto_186883 ?auto_186880 ) ) ( not ( = ?auto_186883 ?auto_186881 ) ) ( not ( = ?auto_186883 ?auto_186882 ) ) ( IN-CITY ?auto_186885 ?auto_186887 ) ( IN-CITY ?auto_186879 ?auto_186887 ) ( not ( = ?auto_186879 ?auto_186885 ) ) ( OBJ-AT ?auto_186882 ?auto_186879 ) ( OBJ-AT ?auto_186883 ?auto_186885 ) ( IN-CITY ?auto_186884 ?auto_186887 ) ( not ( = ?auto_186879 ?auto_186884 ) ) ( not ( = ?auto_186885 ?auto_186884 ) ) ( OBJ-AT ?auto_186881 ?auto_186884 ) ( TRUCK-AT ?auto_186886 ?auto_186885 ) ( OBJ-AT ?auto_186880 ?auto_186885 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186882 ?auto_186883 ?auto_186879 )
      ( DELIVER-4PKG-VERIFY ?auto_186880 ?auto_186881 ?auto_186882 ?auto_186883 ?auto_186879 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_186909 - OBJ
      ?auto_186910 - OBJ
      ?auto_186911 - OBJ
      ?auto_186912 - OBJ
      ?auto_186908 - LOCATION
    )
    :vars
    (
      ?auto_186914 - LOCATION
      ?auto_186916 - CITY
      ?auto_186913 - LOCATION
      ?auto_186915 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186910 ?auto_186909 ) ) ( not ( = ?auto_186911 ?auto_186909 ) ) ( not ( = ?auto_186911 ?auto_186910 ) ) ( not ( = ?auto_186912 ?auto_186909 ) ) ( not ( = ?auto_186912 ?auto_186910 ) ) ( not ( = ?auto_186912 ?auto_186911 ) ) ( IN-CITY ?auto_186914 ?auto_186916 ) ( IN-CITY ?auto_186908 ?auto_186916 ) ( not ( = ?auto_186908 ?auto_186914 ) ) ( OBJ-AT ?auto_186912 ?auto_186908 ) ( OBJ-AT ?auto_186911 ?auto_186914 ) ( IN-CITY ?auto_186913 ?auto_186916 ) ( not ( = ?auto_186908 ?auto_186913 ) ) ( not ( = ?auto_186914 ?auto_186913 ) ) ( OBJ-AT ?auto_186910 ?auto_186913 ) ( TRUCK-AT ?auto_186915 ?auto_186914 ) ( OBJ-AT ?auto_186909 ?auto_186914 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186912 ?auto_186911 ?auto_186908 )
      ( DELIVER-4PKG-VERIFY ?auto_186909 ?auto_186910 ?auto_186911 ?auto_186912 ?auto_186908 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_186968 - OBJ
      ?auto_186969 - OBJ
      ?auto_186970 - OBJ
      ?auto_186971 - OBJ
      ?auto_186967 - LOCATION
    )
    :vars
    (
      ?auto_186973 - LOCATION
      ?auto_186975 - CITY
      ?auto_186972 - LOCATION
      ?auto_186974 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_186969 ?auto_186968 ) ) ( not ( = ?auto_186970 ?auto_186968 ) ) ( not ( = ?auto_186970 ?auto_186969 ) ) ( not ( = ?auto_186971 ?auto_186968 ) ) ( not ( = ?auto_186971 ?auto_186969 ) ) ( not ( = ?auto_186971 ?auto_186970 ) ) ( IN-CITY ?auto_186973 ?auto_186975 ) ( IN-CITY ?auto_186967 ?auto_186975 ) ( not ( = ?auto_186967 ?auto_186973 ) ) ( OBJ-AT ?auto_186970 ?auto_186967 ) ( OBJ-AT ?auto_186969 ?auto_186973 ) ( IN-CITY ?auto_186972 ?auto_186975 ) ( not ( = ?auto_186967 ?auto_186972 ) ) ( not ( = ?auto_186973 ?auto_186972 ) ) ( OBJ-AT ?auto_186971 ?auto_186972 ) ( TRUCK-AT ?auto_186974 ?auto_186973 ) ( OBJ-AT ?auto_186968 ?auto_186973 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186970 ?auto_186969 ?auto_186967 )
      ( DELIVER-4PKG-VERIFY ?auto_186968 ?auto_186969 ?auto_186970 ?auto_186971 ?auto_186967 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_187029 - OBJ
      ?auto_187030 - OBJ
      ?auto_187031 - OBJ
      ?auto_187032 - OBJ
      ?auto_187028 - LOCATION
    )
    :vars
    (
      ?auto_187034 - LOCATION
      ?auto_187036 - CITY
      ?auto_187033 - LOCATION
      ?auto_187035 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_187030 ?auto_187029 ) ) ( not ( = ?auto_187031 ?auto_187029 ) ) ( not ( = ?auto_187031 ?auto_187030 ) ) ( not ( = ?auto_187032 ?auto_187029 ) ) ( not ( = ?auto_187032 ?auto_187030 ) ) ( not ( = ?auto_187032 ?auto_187031 ) ) ( IN-CITY ?auto_187034 ?auto_187036 ) ( IN-CITY ?auto_187028 ?auto_187036 ) ( not ( = ?auto_187028 ?auto_187034 ) ) ( OBJ-AT ?auto_187032 ?auto_187028 ) ( OBJ-AT ?auto_187030 ?auto_187034 ) ( IN-CITY ?auto_187033 ?auto_187036 ) ( not ( = ?auto_187028 ?auto_187033 ) ) ( not ( = ?auto_187034 ?auto_187033 ) ) ( OBJ-AT ?auto_187031 ?auto_187033 ) ( TRUCK-AT ?auto_187035 ?auto_187034 ) ( OBJ-AT ?auto_187029 ?auto_187034 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_187032 ?auto_187030 ?auto_187028 )
      ( DELIVER-4PKG-VERIFY ?auto_187029 ?auto_187030 ?auto_187031 ?auto_187032 ?auto_187028 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_187120 - OBJ
      ?auto_187121 - OBJ
      ?auto_187122 - OBJ
      ?auto_187123 - OBJ
      ?auto_187119 - LOCATION
    )
    :vars
    (
      ?auto_187125 - LOCATION
      ?auto_187127 - CITY
      ?auto_187124 - LOCATION
      ?auto_187126 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_187121 ?auto_187120 ) ) ( not ( = ?auto_187122 ?auto_187120 ) ) ( not ( = ?auto_187122 ?auto_187121 ) ) ( not ( = ?auto_187123 ?auto_187120 ) ) ( not ( = ?auto_187123 ?auto_187121 ) ) ( not ( = ?auto_187123 ?auto_187122 ) ) ( IN-CITY ?auto_187125 ?auto_187127 ) ( IN-CITY ?auto_187119 ?auto_187127 ) ( not ( = ?auto_187119 ?auto_187125 ) ) ( OBJ-AT ?auto_187121 ?auto_187119 ) ( OBJ-AT ?auto_187123 ?auto_187125 ) ( IN-CITY ?auto_187124 ?auto_187127 ) ( not ( = ?auto_187119 ?auto_187124 ) ) ( not ( = ?auto_187125 ?auto_187124 ) ) ( OBJ-AT ?auto_187120 ?auto_187124 ) ( TRUCK-AT ?auto_187126 ?auto_187125 ) ( OBJ-AT ?auto_187122 ?auto_187125 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_187121 ?auto_187123 ?auto_187119 )
      ( DELIVER-4PKG-VERIFY ?auto_187120 ?auto_187121 ?auto_187122 ?auto_187123 ?auto_187119 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_187149 - OBJ
      ?auto_187150 - OBJ
      ?auto_187151 - OBJ
      ?auto_187152 - OBJ
      ?auto_187148 - LOCATION
    )
    :vars
    (
      ?auto_187154 - LOCATION
      ?auto_187156 - CITY
      ?auto_187153 - LOCATION
      ?auto_187155 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_187150 ?auto_187149 ) ) ( not ( = ?auto_187151 ?auto_187149 ) ) ( not ( = ?auto_187151 ?auto_187150 ) ) ( not ( = ?auto_187152 ?auto_187149 ) ) ( not ( = ?auto_187152 ?auto_187150 ) ) ( not ( = ?auto_187152 ?auto_187151 ) ) ( IN-CITY ?auto_187154 ?auto_187156 ) ( IN-CITY ?auto_187148 ?auto_187156 ) ( not ( = ?auto_187148 ?auto_187154 ) ) ( OBJ-AT ?auto_187150 ?auto_187148 ) ( OBJ-AT ?auto_187151 ?auto_187154 ) ( IN-CITY ?auto_187153 ?auto_187156 ) ( not ( = ?auto_187148 ?auto_187153 ) ) ( not ( = ?auto_187154 ?auto_187153 ) ) ( OBJ-AT ?auto_187149 ?auto_187153 ) ( TRUCK-AT ?auto_187155 ?auto_187154 ) ( OBJ-AT ?auto_187152 ?auto_187154 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_187150 ?auto_187151 ?auto_187148 )
      ( DELIVER-4PKG-VERIFY ?auto_187149 ?auto_187150 ?auto_187151 ?auto_187152 ?auto_187148 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_187178 - OBJ
      ?auto_187179 - OBJ
      ?auto_187180 - OBJ
      ?auto_187181 - OBJ
      ?auto_187177 - LOCATION
    )
    :vars
    (
      ?auto_187183 - LOCATION
      ?auto_187185 - CITY
      ?auto_187182 - LOCATION
      ?auto_187184 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_187179 ?auto_187178 ) ) ( not ( = ?auto_187180 ?auto_187178 ) ) ( not ( = ?auto_187180 ?auto_187179 ) ) ( not ( = ?auto_187181 ?auto_187178 ) ) ( not ( = ?auto_187181 ?auto_187179 ) ) ( not ( = ?auto_187181 ?auto_187180 ) ) ( IN-CITY ?auto_187183 ?auto_187185 ) ( IN-CITY ?auto_187177 ?auto_187185 ) ( not ( = ?auto_187177 ?auto_187183 ) ) ( OBJ-AT ?auto_187180 ?auto_187177 ) ( OBJ-AT ?auto_187181 ?auto_187183 ) ( IN-CITY ?auto_187182 ?auto_187185 ) ( not ( = ?auto_187177 ?auto_187182 ) ) ( not ( = ?auto_187183 ?auto_187182 ) ) ( OBJ-AT ?auto_187178 ?auto_187182 ) ( TRUCK-AT ?auto_187184 ?auto_187183 ) ( OBJ-AT ?auto_187179 ?auto_187183 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_187180 ?auto_187181 ?auto_187177 )
      ( DELIVER-4PKG-VERIFY ?auto_187178 ?auto_187179 ?auto_187180 ?auto_187181 ?auto_187177 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_187207 - OBJ
      ?auto_187208 - OBJ
      ?auto_187209 - OBJ
      ?auto_187210 - OBJ
      ?auto_187206 - LOCATION
    )
    :vars
    (
      ?auto_187212 - LOCATION
      ?auto_187214 - CITY
      ?auto_187211 - LOCATION
      ?auto_187213 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_187208 ?auto_187207 ) ) ( not ( = ?auto_187209 ?auto_187207 ) ) ( not ( = ?auto_187209 ?auto_187208 ) ) ( not ( = ?auto_187210 ?auto_187207 ) ) ( not ( = ?auto_187210 ?auto_187208 ) ) ( not ( = ?auto_187210 ?auto_187209 ) ) ( IN-CITY ?auto_187212 ?auto_187214 ) ( IN-CITY ?auto_187206 ?auto_187214 ) ( not ( = ?auto_187206 ?auto_187212 ) ) ( OBJ-AT ?auto_187210 ?auto_187206 ) ( OBJ-AT ?auto_187209 ?auto_187212 ) ( IN-CITY ?auto_187211 ?auto_187214 ) ( not ( = ?auto_187206 ?auto_187211 ) ) ( not ( = ?auto_187212 ?auto_187211 ) ) ( OBJ-AT ?auto_187207 ?auto_187211 ) ( TRUCK-AT ?auto_187213 ?auto_187212 ) ( OBJ-AT ?auto_187208 ?auto_187212 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_187210 ?auto_187209 ?auto_187206 )
      ( DELIVER-4PKG-VERIFY ?auto_187207 ?auto_187208 ?auto_187209 ?auto_187210 ?auto_187206 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_187329 - OBJ
      ?auto_187330 - OBJ
      ?auto_187331 - OBJ
      ?auto_187332 - OBJ
      ?auto_187328 - LOCATION
    )
    :vars
    (
      ?auto_187334 - LOCATION
      ?auto_187336 - CITY
      ?auto_187333 - LOCATION
      ?auto_187335 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_187330 ?auto_187329 ) ) ( not ( = ?auto_187331 ?auto_187329 ) ) ( not ( = ?auto_187331 ?auto_187330 ) ) ( not ( = ?auto_187332 ?auto_187329 ) ) ( not ( = ?auto_187332 ?auto_187330 ) ) ( not ( = ?auto_187332 ?auto_187331 ) ) ( IN-CITY ?auto_187334 ?auto_187336 ) ( IN-CITY ?auto_187328 ?auto_187336 ) ( not ( = ?auto_187328 ?auto_187334 ) ) ( OBJ-AT ?auto_187331 ?auto_187328 ) ( OBJ-AT ?auto_187330 ?auto_187334 ) ( IN-CITY ?auto_187333 ?auto_187336 ) ( not ( = ?auto_187328 ?auto_187333 ) ) ( not ( = ?auto_187334 ?auto_187333 ) ) ( OBJ-AT ?auto_187329 ?auto_187333 ) ( TRUCK-AT ?auto_187335 ?auto_187334 ) ( OBJ-AT ?auto_187332 ?auto_187334 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_187331 ?auto_187330 ?auto_187328 )
      ( DELIVER-4PKG-VERIFY ?auto_187329 ?auto_187330 ?auto_187331 ?auto_187332 ?auto_187328 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_187358 - OBJ
      ?auto_187359 - OBJ
      ?auto_187360 - OBJ
      ?auto_187361 - OBJ
      ?auto_187357 - LOCATION
    )
    :vars
    (
      ?auto_187363 - LOCATION
      ?auto_187365 - CITY
      ?auto_187362 - LOCATION
      ?auto_187364 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_187359 ?auto_187358 ) ) ( not ( = ?auto_187360 ?auto_187358 ) ) ( not ( = ?auto_187360 ?auto_187359 ) ) ( not ( = ?auto_187361 ?auto_187358 ) ) ( not ( = ?auto_187361 ?auto_187359 ) ) ( not ( = ?auto_187361 ?auto_187360 ) ) ( IN-CITY ?auto_187363 ?auto_187365 ) ( IN-CITY ?auto_187357 ?auto_187365 ) ( not ( = ?auto_187357 ?auto_187363 ) ) ( OBJ-AT ?auto_187361 ?auto_187357 ) ( OBJ-AT ?auto_187359 ?auto_187363 ) ( IN-CITY ?auto_187362 ?auto_187365 ) ( not ( = ?auto_187357 ?auto_187362 ) ) ( not ( = ?auto_187363 ?auto_187362 ) ) ( OBJ-AT ?auto_187358 ?auto_187362 ) ( TRUCK-AT ?auto_187364 ?auto_187363 ) ( OBJ-AT ?auto_187360 ?auto_187363 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_187361 ?auto_187359 ?auto_187357 )
      ( DELIVER-4PKG-VERIFY ?auto_187358 ?auto_187359 ?auto_187360 ?auto_187361 ?auto_187357 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_187543 - OBJ
      ?auto_187544 - OBJ
      ?auto_187545 - OBJ
      ?auto_187546 - OBJ
      ?auto_187542 - LOCATION
    )
    :vars
    (
      ?auto_187548 - LOCATION
      ?auto_187550 - CITY
      ?auto_187547 - LOCATION
      ?auto_187549 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_187544 ?auto_187543 ) ) ( not ( = ?auto_187545 ?auto_187543 ) ) ( not ( = ?auto_187545 ?auto_187544 ) ) ( not ( = ?auto_187546 ?auto_187543 ) ) ( not ( = ?auto_187546 ?auto_187544 ) ) ( not ( = ?auto_187546 ?auto_187545 ) ) ( IN-CITY ?auto_187548 ?auto_187550 ) ( IN-CITY ?auto_187542 ?auto_187550 ) ( not ( = ?auto_187542 ?auto_187548 ) ) ( OBJ-AT ?auto_187544 ?auto_187542 ) ( OBJ-AT ?auto_187543 ?auto_187548 ) ( IN-CITY ?auto_187547 ?auto_187550 ) ( not ( = ?auto_187542 ?auto_187547 ) ) ( not ( = ?auto_187548 ?auto_187547 ) ) ( OBJ-AT ?auto_187546 ?auto_187547 ) ( TRUCK-AT ?auto_187549 ?auto_187548 ) ( OBJ-AT ?auto_187545 ?auto_187548 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_187544 ?auto_187543 ?auto_187542 )
      ( DELIVER-4PKG-VERIFY ?auto_187543 ?auto_187544 ?auto_187545 ?auto_187546 ?auto_187542 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_187572 - OBJ
      ?auto_187573 - OBJ
      ?auto_187574 - OBJ
      ?auto_187575 - OBJ
      ?auto_187571 - LOCATION
    )
    :vars
    (
      ?auto_187577 - LOCATION
      ?auto_187579 - CITY
      ?auto_187576 - LOCATION
      ?auto_187578 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_187573 ?auto_187572 ) ) ( not ( = ?auto_187574 ?auto_187572 ) ) ( not ( = ?auto_187574 ?auto_187573 ) ) ( not ( = ?auto_187575 ?auto_187572 ) ) ( not ( = ?auto_187575 ?auto_187573 ) ) ( not ( = ?auto_187575 ?auto_187574 ) ) ( IN-CITY ?auto_187577 ?auto_187579 ) ( IN-CITY ?auto_187571 ?auto_187579 ) ( not ( = ?auto_187571 ?auto_187577 ) ) ( OBJ-AT ?auto_187573 ?auto_187571 ) ( OBJ-AT ?auto_187572 ?auto_187577 ) ( IN-CITY ?auto_187576 ?auto_187579 ) ( not ( = ?auto_187571 ?auto_187576 ) ) ( not ( = ?auto_187577 ?auto_187576 ) ) ( OBJ-AT ?auto_187574 ?auto_187576 ) ( TRUCK-AT ?auto_187578 ?auto_187577 ) ( OBJ-AT ?auto_187575 ?auto_187577 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_187573 ?auto_187572 ?auto_187571 )
      ( DELIVER-4PKG-VERIFY ?auto_187572 ?auto_187573 ?auto_187574 ?auto_187575 ?auto_187571 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_187663 - OBJ
      ?auto_187664 - OBJ
      ?auto_187665 - OBJ
      ?auto_187666 - OBJ
      ?auto_187662 - LOCATION
    )
    :vars
    (
      ?auto_187668 - LOCATION
      ?auto_187670 - CITY
      ?auto_187667 - LOCATION
      ?auto_187669 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_187664 ?auto_187663 ) ) ( not ( = ?auto_187665 ?auto_187663 ) ) ( not ( = ?auto_187665 ?auto_187664 ) ) ( not ( = ?auto_187666 ?auto_187663 ) ) ( not ( = ?auto_187666 ?auto_187664 ) ) ( not ( = ?auto_187666 ?auto_187665 ) ) ( IN-CITY ?auto_187668 ?auto_187670 ) ( IN-CITY ?auto_187662 ?auto_187670 ) ( not ( = ?auto_187662 ?auto_187668 ) ) ( OBJ-AT ?auto_187665 ?auto_187662 ) ( OBJ-AT ?auto_187663 ?auto_187668 ) ( IN-CITY ?auto_187667 ?auto_187670 ) ( not ( = ?auto_187662 ?auto_187667 ) ) ( not ( = ?auto_187668 ?auto_187667 ) ) ( OBJ-AT ?auto_187666 ?auto_187667 ) ( TRUCK-AT ?auto_187669 ?auto_187668 ) ( OBJ-AT ?auto_187664 ?auto_187668 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_187665 ?auto_187663 ?auto_187662 )
      ( DELIVER-4PKG-VERIFY ?auto_187663 ?auto_187664 ?auto_187665 ?auto_187666 ?auto_187662 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_187724 - OBJ
      ?auto_187725 - OBJ
      ?auto_187726 - OBJ
      ?auto_187727 - OBJ
      ?auto_187723 - LOCATION
    )
    :vars
    (
      ?auto_187729 - LOCATION
      ?auto_187731 - CITY
      ?auto_187728 - LOCATION
      ?auto_187730 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_187725 ?auto_187724 ) ) ( not ( = ?auto_187726 ?auto_187724 ) ) ( not ( = ?auto_187726 ?auto_187725 ) ) ( not ( = ?auto_187727 ?auto_187724 ) ) ( not ( = ?auto_187727 ?auto_187725 ) ) ( not ( = ?auto_187727 ?auto_187726 ) ) ( IN-CITY ?auto_187729 ?auto_187731 ) ( IN-CITY ?auto_187723 ?auto_187731 ) ( not ( = ?auto_187723 ?auto_187729 ) ) ( OBJ-AT ?auto_187727 ?auto_187723 ) ( OBJ-AT ?auto_187724 ?auto_187729 ) ( IN-CITY ?auto_187728 ?auto_187731 ) ( not ( = ?auto_187723 ?auto_187728 ) ) ( not ( = ?auto_187729 ?auto_187728 ) ) ( OBJ-AT ?auto_187726 ?auto_187728 ) ( TRUCK-AT ?auto_187730 ?auto_187729 ) ( OBJ-AT ?auto_187725 ?auto_187729 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_187727 ?auto_187724 ?auto_187723 )
      ( DELIVER-4PKG-VERIFY ?auto_187724 ?auto_187725 ?auto_187726 ?auto_187727 ?auto_187723 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_187815 - OBJ
      ?auto_187816 - OBJ
      ?auto_187817 - OBJ
      ?auto_187818 - OBJ
      ?auto_187814 - LOCATION
    )
    :vars
    (
      ?auto_187820 - LOCATION
      ?auto_187822 - CITY
      ?auto_187819 - LOCATION
      ?auto_187821 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_187816 ?auto_187815 ) ) ( not ( = ?auto_187817 ?auto_187815 ) ) ( not ( = ?auto_187817 ?auto_187816 ) ) ( not ( = ?auto_187818 ?auto_187815 ) ) ( not ( = ?auto_187818 ?auto_187816 ) ) ( not ( = ?auto_187818 ?auto_187817 ) ) ( IN-CITY ?auto_187820 ?auto_187822 ) ( IN-CITY ?auto_187814 ?auto_187822 ) ( not ( = ?auto_187814 ?auto_187820 ) ) ( OBJ-AT ?auto_187817 ?auto_187814 ) ( OBJ-AT ?auto_187815 ?auto_187820 ) ( IN-CITY ?auto_187819 ?auto_187822 ) ( not ( = ?auto_187814 ?auto_187819 ) ) ( not ( = ?auto_187820 ?auto_187819 ) ) ( OBJ-AT ?auto_187816 ?auto_187819 ) ( TRUCK-AT ?auto_187821 ?auto_187820 ) ( OBJ-AT ?auto_187818 ?auto_187820 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_187817 ?auto_187815 ?auto_187814 )
      ( DELIVER-4PKG-VERIFY ?auto_187815 ?auto_187816 ?auto_187817 ?auto_187818 ?auto_187814 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_187844 - OBJ
      ?auto_187845 - OBJ
      ?auto_187846 - OBJ
      ?auto_187847 - OBJ
      ?auto_187843 - LOCATION
    )
    :vars
    (
      ?auto_187849 - LOCATION
      ?auto_187851 - CITY
      ?auto_187848 - LOCATION
      ?auto_187850 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_187845 ?auto_187844 ) ) ( not ( = ?auto_187846 ?auto_187844 ) ) ( not ( = ?auto_187846 ?auto_187845 ) ) ( not ( = ?auto_187847 ?auto_187844 ) ) ( not ( = ?auto_187847 ?auto_187845 ) ) ( not ( = ?auto_187847 ?auto_187846 ) ) ( IN-CITY ?auto_187849 ?auto_187851 ) ( IN-CITY ?auto_187843 ?auto_187851 ) ( not ( = ?auto_187843 ?auto_187849 ) ) ( OBJ-AT ?auto_187847 ?auto_187843 ) ( OBJ-AT ?auto_187844 ?auto_187849 ) ( IN-CITY ?auto_187848 ?auto_187851 ) ( not ( = ?auto_187843 ?auto_187848 ) ) ( not ( = ?auto_187849 ?auto_187848 ) ) ( OBJ-AT ?auto_187845 ?auto_187848 ) ( TRUCK-AT ?auto_187850 ?auto_187849 ) ( OBJ-AT ?auto_187846 ?auto_187849 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_187847 ?auto_187844 ?auto_187843 )
      ( DELIVER-4PKG-VERIFY ?auto_187844 ?auto_187845 ?auto_187846 ?auto_187847 ?auto_187843 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_188138 - OBJ
      ?auto_188137 - LOCATION
    )
    :vars
    (
      ?auto_188145 - OBJ
      ?auto_188142 - LOCATION
      ?auto_188144 - CITY
      ?auto_188139 - OBJ
      ?auto_188140 - LOCATION
      ?auto_188141 - OBJ
      ?auto_188143 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188138 ?auto_188145 ) ) ( IN-CITY ?auto_188142 ?auto_188144 ) ( IN-CITY ?auto_188137 ?auto_188144 ) ( not ( = ?auto_188137 ?auto_188142 ) ) ( OBJ-AT ?auto_188145 ?auto_188137 ) ( OBJ-AT ?auto_188138 ?auto_188142 ) ( not ( = ?auto_188139 ?auto_188145 ) ) ( not ( = ?auto_188138 ?auto_188139 ) ) ( IN-CITY ?auto_188140 ?auto_188144 ) ( not ( = ?auto_188137 ?auto_188140 ) ) ( not ( = ?auto_188142 ?auto_188140 ) ) ( OBJ-AT ?auto_188139 ?auto_188140 ) ( not ( = ?auto_188141 ?auto_188145 ) ) ( not ( = ?auto_188138 ?auto_188141 ) ) ( not ( = ?auto_188139 ?auto_188141 ) ) ( OBJ-AT ?auto_188141 ?auto_188142 ) ( TRUCK-AT ?auto_188143 ?auto_188137 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_188143 ?auto_188137 ?auto_188142 ?auto_188144 )
      ( DELIVER-2PKG ?auto_188145 ?auto_188138 ?auto_188137 )
      ( DELIVER-1PKG-VERIFY ?auto_188138 ?auto_188137 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_188147 - OBJ
      ?auto_188148 - OBJ
      ?auto_188146 - LOCATION
    )
    :vars
    (
      ?auto_188154 - LOCATION
      ?auto_188153 - CITY
      ?auto_188151 - OBJ
      ?auto_188149 - LOCATION
      ?auto_188150 - OBJ
      ?auto_188152 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188148 ?auto_188147 ) ) ( IN-CITY ?auto_188154 ?auto_188153 ) ( IN-CITY ?auto_188146 ?auto_188153 ) ( not ( = ?auto_188146 ?auto_188154 ) ) ( OBJ-AT ?auto_188147 ?auto_188146 ) ( OBJ-AT ?auto_188148 ?auto_188154 ) ( not ( = ?auto_188151 ?auto_188147 ) ) ( not ( = ?auto_188148 ?auto_188151 ) ) ( IN-CITY ?auto_188149 ?auto_188153 ) ( not ( = ?auto_188146 ?auto_188149 ) ) ( not ( = ?auto_188154 ?auto_188149 ) ) ( OBJ-AT ?auto_188151 ?auto_188149 ) ( not ( = ?auto_188150 ?auto_188147 ) ) ( not ( = ?auto_188148 ?auto_188150 ) ) ( not ( = ?auto_188151 ?auto_188150 ) ) ( OBJ-AT ?auto_188150 ?auto_188154 ) ( TRUCK-AT ?auto_188152 ?auto_188146 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_188148 ?auto_188146 )
      ( DELIVER-2PKG-VERIFY ?auto_188147 ?auto_188148 ?auto_188146 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_188156 - OBJ
      ?auto_188157 - OBJ
      ?auto_188155 - LOCATION
    )
    :vars
    (
      ?auto_188163 - OBJ
      ?auto_188158 - LOCATION
      ?auto_188162 - CITY
      ?auto_188161 - OBJ
      ?auto_188160 - LOCATION
      ?auto_188159 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188157 ?auto_188156 ) ) ( not ( = ?auto_188157 ?auto_188163 ) ) ( IN-CITY ?auto_188158 ?auto_188162 ) ( IN-CITY ?auto_188155 ?auto_188162 ) ( not ( = ?auto_188155 ?auto_188158 ) ) ( OBJ-AT ?auto_188163 ?auto_188155 ) ( OBJ-AT ?auto_188157 ?auto_188158 ) ( not ( = ?auto_188161 ?auto_188163 ) ) ( not ( = ?auto_188157 ?auto_188161 ) ) ( IN-CITY ?auto_188160 ?auto_188162 ) ( not ( = ?auto_188155 ?auto_188160 ) ) ( not ( = ?auto_188158 ?auto_188160 ) ) ( OBJ-AT ?auto_188161 ?auto_188160 ) ( not ( = ?auto_188156 ?auto_188163 ) ) ( not ( = ?auto_188161 ?auto_188156 ) ) ( OBJ-AT ?auto_188156 ?auto_188158 ) ( TRUCK-AT ?auto_188159 ?auto_188155 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188163 ?auto_188157 ?auto_188155 )
      ( DELIVER-2PKG-VERIFY ?auto_188156 ?auto_188157 ?auto_188155 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_188165 - OBJ
      ?auto_188166 - OBJ
      ?auto_188164 - LOCATION
    )
    :vars
    (
      ?auto_188172 - OBJ
      ?auto_188167 - LOCATION
      ?auto_188171 - CITY
      ?auto_188170 - LOCATION
      ?auto_188168 - OBJ
      ?auto_188169 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188166 ?auto_188165 ) ) ( not ( = ?auto_188166 ?auto_188172 ) ) ( IN-CITY ?auto_188167 ?auto_188171 ) ( IN-CITY ?auto_188164 ?auto_188171 ) ( not ( = ?auto_188164 ?auto_188167 ) ) ( OBJ-AT ?auto_188172 ?auto_188164 ) ( OBJ-AT ?auto_188166 ?auto_188167 ) ( not ( = ?auto_188165 ?auto_188172 ) ) ( IN-CITY ?auto_188170 ?auto_188171 ) ( not ( = ?auto_188164 ?auto_188170 ) ) ( not ( = ?auto_188167 ?auto_188170 ) ) ( OBJ-AT ?auto_188165 ?auto_188170 ) ( not ( = ?auto_188168 ?auto_188172 ) ) ( not ( = ?auto_188166 ?auto_188168 ) ) ( not ( = ?auto_188165 ?auto_188168 ) ) ( OBJ-AT ?auto_188168 ?auto_188167 ) ( TRUCK-AT ?auto_188169 ?auto_188164 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188172 ?auto_188166 ?auto_188164 )
      ( DELIVER-2PKG-VERIFY ?auto_188165 ?auto_188166 ?auto_188164 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_188174 - OBJ
      ?auto_188175 - OBJ
      ?auto_188173 - LOCATION
    )
    :vars
    (
      ?auto_188176 - LOCATION
      ?auto_188181 - CITY
      ?auto_188180 - OBJ
      ?auto_188179 - LOCATION
      ?auto_188177 - OBJ
      ?auto_188178 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188175 ?auto_188174 ) ) ( IN-CITY ?auto_188176 ?auto_188181 ) ( IN-CITY ?auto_188173 ?auto_188181 ) ( not ( = ?auto_188173 ?auto_188176 ) ) ( OBJ-AT ?auto_188175 ?auto_188173 ) ( OBJ-AT ?auto_188174 ?auto_188176 ) ( not ( = ?auto_188180 ?auto_188175 ) ) ( not ( = ?auto_188174 ?auto_188180 ) ) ( IN-CITY ?auto_188179 ?auto_188181 ) ( not ( = ?auto_188173 ?auto_188179 ) ) ( not ( = ?auto_188176 ?auto_188179 ) ) ( OBJ-AT ?auto_188180 ?auto_188179 ) ( not ( = ?auto_188177 ?auto_188175 ) ) ( not ( = ?auto_188174 ?auto_188177 ) ) ( not ( = ?auto_188180 ?auto_188177 ) ) ( OBJ-AT ?auto_188177 ?auto_188176 ) ( TRUCK-AT ?auto_188178 ?auto_188173 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188175 ?auto_188174 ?auto_188173 )
      ( DELIVER-2PKG-VERIFY ?auto_188174 ?auto_188175 ?auto_188173 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_188183 - OBJ
      ?auto_188184 - OBJ
      ?auto_188182 - LOCATION
    )
    :vars
    (
      ?auto_188190 - OBJ
      ?auto_188185 - LOCATION
      ?auto_188189 - CITY
      ?auto_188188 - OBJ
      ?auto_188187 - LOCATION
      ?auto_188186 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188184 ?auto_188183 ) ) ( not ( = ?auto_188183 ?auto_188190 ) ) ( IN-CITY ?auto_188185 ?auto_188189 ) ( IN-CITY ?auto_188182 ?auto_188189 ) ( not ( = ?auto_188182 ?auto_188185 ) ) ( OBJ-AT ?auto_188190 ?auto_188182 ) ( OBJ-AT ?auto_188183 ?auto_188185 ) ( not ( = ?auto_188188 ?auto_188190 ) ) ( not ( = ?auto_188183 ?auto_188188 ) ) ( IN-CITY ?auto_188187 ?auto_188189 ) ( not ( = ?auto_188182 ?auto_188187 ) ) ( not ( = ?auto_188185 ?auto_188187 ) ) ( OBJ-AT ?auto_188188 ?auto_188187 ) ( not ( = ?auto_188184 ?auto_188190 ) ) ( not ( = ?auto_188188 ?auto_188184 ) ) ( OBJ-AT ?auto_188184 ?auto_188185 ) ( TRUCK-AT ?auto_188186 ?auto_188182 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188190 ?auto_188183 ?auto_188182 )
      ( DELIVER-2PKG-VERIFY ?auto_188183 ?auto_188184 ?auto_188182 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_188192 - OBJ
      ?auto_188193 - OBJ
      ?auto_188191 - LOCATION
    )
    :vars
    (
      ?auto_188199 - OBJ
      ?auto_188194 - LOCATION
      ?auto_188198 - CITY
      ?auto_188197 - LOCATION
      ?auto_188195 - OBJ
      ?auto_188196 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188193 ?auto_188192 ) ) ( not ( = ?auto_188192 ?auto_188199 ) ) ( IN-CITY ?auto_188194 ?auto_188198 ) ( IN-CITY ?auto_188191 ?auto_188198 ) ( not ( = ?auto_188191 ?auto_188194 ) ) ( OBJ-AT ?auto_188199 ?auto_188191 ) ( OBJ-AT ?auto_188192 ?auto_188194 ) ( not ( = ?auto_188193 ?auto_188199 ) ) ( IN-CITY ?auto_188197 ?auto_188198 ) ( not ( = ?auto_188191 ?auto_188197 ) ) ( not ( = ?auto_188194 ?auto_188197 ) ) ( OBJ-AT ?auto_188193 ?auto_188197 ) ( not ( = ?auto_188195 ?auto_188199 ) ) ( not ( = ?auto_188192 ?auto_188195 ) ) ( not ( = ?auto_188193 ?auto_188195 ) ) ( OBJ-AT ?auto_188195 ?auto_188194 ) ( TRUCK-AT ?auto_188196 ?auto_188191 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188199 ?auto_188192 ?auto_188191 )
      ( DELIVER-2PKG-VERIFY ?auto_188192 ?auto_188193 ?auto_188191 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_188221 - OBJ
      ?auto_188222 - OBJ
      ?auto_188223 - OBJ
      ?auto_188220 - LOCATION
    )
    :vars
    (
      ?auto_188224 - LOCATION
      ?auto_188228 - CITY
      ?auto_188227 - OBJ
      ?auto_188226 - LOCATION
      ?auto_188225 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188222 ?auto_188221 ) ) ( not ( = ?auto_188223 ?auto_188221 ) ) ( not ( = ?auto_188223 ?auto_188222 ) ) ( IN-CITY ?auto_188224 ?auto_188228 ) ( IN-CITY ?auto_188220 ?auto_188228 ) ( not ( = ?auto_188220 ?auto_188224 ) ) ( OBJ-AT ?auto_188221 ?auto_188220 ) ( OBJ-AT ?auto_188223 ?auto_188224 ) ( not ( = ?auto_188227 ?auto_188221 ) ) ( not ( = ?auto_188223 ?auto_188227 ) ) ( IN-CITY ?auto_188226 ?auto_188228 ) ( not ( = ?auto_188220 ?auto_188226 ) ) ( not ( = ?auto_188224 ?auto_188226 ) ) ( OBJ-AT ?auto_188227 ?auto_188226 ) ( not ( = ?auto_188227 ?auto_188222 ) ) ( OBJ-AT ?auto_188222 ?auto_188224 ) ( TRUCK-AT ?auto_188225 ?auto_188220 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188221 ?auto_188223 ?auto_188220 )
      ( DELIVER-3PKG-VERIFY ?auto_188221 ?auto_188222 ?auto_188223 ?auto_188220 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_188230 - OBJ
      ?auto_188231 - OBJ
      ?auto_188232 - OBJ
      ?auto_188229 - LOCATION
    )
    :vars
    (
      ?auto_188233 - LOCATION
      ?auto_188237 - CITY
      ?auto_188236 - LOCATION
      ?auto_188234 - OBJ
      ?auto_188235 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188231 ?auto_188230 ) ) ( not ( = ?auto_188232 ?auto_188230 ) ) ( not ( = ?auto_188232 ?auto_188231 ) ) ( IN-CITY ?auto_188233 ?auto_188237 ) ( IN-CITY ?auto_188229 ?auto_188237 ) ( not ( = ?auto_188229 ?auto_188233 ) ) ( OBJ-AT ?auto_188230 ?auto_188229 ) ( OBJ-AT ?auto_188232 ?auto_188233 ) ( IN-CITY ?auto_188236 ?auto_188237 ) ( not ( = ?auto_188229 ?auto_188236 ) ) ( not ( = ?auto_188233 ?auto_188236 ) ) ( OBJ-AT ?auto_188231 ?auto_188236 ) ( not ( = ?auto_188234 ?auto_188230 ) ) ( not ( = ?auto_188232 ?auto_188234 ) ) ( not ( = ?auto_188231 ?auto_188234 ) ) ( OBJ-AT ?auto_188234 ?auto_188233 ) ( TRUCK-AT ?auto_188235 ?auto_188229 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188230 ?auto_188232 ?auto_188229 )
      ( DELIVER-3PKG-VERIFY ?auto_188230 ?auto_188231 ?auto_188232 ?auto_188229 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_188249 - OBJ
      ?auto_188250 - OBJ
      ?auto_188251 - OBJ
      ?auto_188248 - LOCATION
    )
    :vars
    (
      ?auto_188252 - LOCATION
      ?auto_188256 - CITY
      ?auto_188255 - OBJ
      ?auto_188254 - LOCATION
      ?auto_188253 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188250 ?auto_188249 ) ) ( not ( = ?auto_188251 ?auto_188249 ) ) ( not ( = ?auto_188251 ?auto_188250 ) ) ( IN-CITY ?auto_188252 ?auto_188256 ) ( IN-CITY ?auto_188248 ?auto_188256 ) ( not ( = ?auto_188248 ?auto_188252 ) ) ( OBJ-AT ?auto_188249 ?auto_188248 ) ( OBJ-AT ?auto_188250 ?auto_188252 ) ( not ( = ?auto_188255 ?auto_188249 ) ) ( not ( = ?auto_188250 ?auto_188255 ) ) ( IN-CITY ?auto_188254 ?auto_188256 ) ( not ( = ?auto_188248 ?auto_188254 ) ) ( not ( = ?auto_188252 ?auto_188254 ) ) ( OBJ-AT ?auto_188255 ?auto_188254 ) ( not ( = ?auto_188255 ?auto_188251 ) ) ( OBJ-AT ?auto_188251 ?auto_188252 ) ( TRUCK-AT ?auto_188253 ?auto_188248 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188249 ?auto_188250 ?auto_188248 )
      ( DELIVER-3PKG-VERIFY ?auto_188249 ?auto_188250 ?auto_188251 ?auto_188248 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_188258 - OBJ
      ?auto_188259 - OBJ
      ?auto_188260 - OBJ
      ?auto_188257 - LOCATION
    )
    :vars
    (
      ?auto_188261 - LOCATION
      ?auto_188265 - CITY
      ?auto_188264 - LOCATION
      ?auto_188262 - OBJ
      ?auto_188263 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188259 ?auto_188258 ) ) ( not ( = ?auto_188260 ?auto_188258 ) ) ( not ( = ?auto_188260 ?auto_188259 ) ) ( IN-CITY ?auto_188261 ?auto_188265 ) ( IN-CITY ?auto_188257 ?auto_188265 ) ( not ( = ?auto_188257 ?auto_188261 ) ) ( OBJ-AT ?auto_188258 ?auto_188257 ) ( OBJ-AT ?auto_188259 ?auto_188261 ) ( IN-CITY ?auto_188264 ?auto_188265 ) ( not ( = ?auto_188257 ?auto_188264 ) ) ( not ( = ?auto_188261 ?auto_188264 ) ) ( OBJ-AT ?auto_188260 ?auto_188264 ) ( not ( = ?auto_188262 ?auto_188258 ) ) ( not ( = ?auto_188259 ?auto_188262 ) ) ( not ( = ?auto_188260 ?auto_188262 ) ) ( OBJ-AT ?auto_188262 ?auto_188261 ) ( TRUCK-AT ?auto_188263 ?auto_188257 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188258 ?auto_188259 ?auto_188257 )
      ( DELIVER-3PKG-VERIFY ?auto_188258 ?auto_188259 ?auto_188260 ?auto_188257 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_188277 - OBJ
      ?auto_188278 - OBJ
      ?auto_188279 - OBJ
      ?auto_188276 - LOCATION
    )
    :vars
    (
      ?auto_188280 - LOCATION
      ?auto_188284 - CITY
      ?auto_188283 - OBJ
      ?auto_188282 - LOCATION
      ?auto_188281 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188278 ?auto_188277 ) ) ( not ( = ?auto_188279 ?auto_188277 ) ) ( not ( = ?auto_188279 ?auto_188278 ) ) ( IN-CITY ?auto_188280 ?auto_188284 ) ( IN-CITY ?auto_188276 ?auto_188284 ) ( not ( = ?auto_188276 ?auto_188280 ) ) ( OBJ-AT ?auto_188278 ?auto_188276 ) ( OBJ-AT ?auto_188279 ?auto_188280 ) ( not ( = ?auto_188283 ?auto_188278 ) ) ( not ( = ?auto_188279 ?auto_188283 ) ) ( IN-CITY ?auto_188282 ?auto_188284 ) ( not ( = ?auto_188276 ?auto_188282 ) ) ( not ( = ?auto_188280 ?auto_188282 ) ) ( OBJ-AT ?auto_188283 ?auto_188282 ) ( not ( = ?auto_188283 ?auto_188277 ) ) ( OBJ-AT ?auto_188277 ?auto_188280 ) ( TRUCK-AT ?auto_188281 ?auto_188276 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188278 ?auto_188279 ?auto_188276 )
      ( DELIVER-3PKG-VERIFY ?auto_188277 ?auto_188278 ?auto_188279 ?auto_188276 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_188296 - OBJ
      ?auto_188297 - OBJ
      ?auto_188298 - OBJ
      ?auto_188295 - LOCATION
    )
    :vars
    (
      ?auto_188303 - OBJ
      ?auto_188299 - LOCATION
      ?auto_188302 - CITY
      ?auto_188301 - LOCATION
      ?auto_188300 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188297 ?auto_188296 ) ) ( not ( = ?auto_188298 ?auto_188296 ) ) ( not ( = ?auto_188298 ?auto_188297 ) ) ( not ( = ?auto_188298 ?auto_188303 ) ) ( IN-CITY ?auto_188299 ?auto_188302 ) ( IN-CITY ?auto_188295 ?auto_188302 ) ( not ( = ?auto_188295 ?auto_188299 ) ) ( OBJ-AT ?auto_188303 ?auto_188295 ) ( OBJ-AT ?auto_188298 ?auto_188299 ) ( not ( = ?auto_188297 ?auto_188303 ) ) ( IN-CITY ?auto_188301 ?auto_188302 ) ( not ( = ?auto_188295 ?auto_188301 ) ) ( not ( = ?auto_188299 ?auto_188301 ) ) ( OBJ-AT ?auto_188297 ?auto_188301 ) ( not ( = ?auto_188296 ?auto_188303 ) ) ( OBJ-AT ?auto_188296 ?auto_188299 ) ( TRUCK-AT ?auto_188300 ?auto_188295 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188303 ?auto_188298 ?auto_188295 )
      ( DELIVER-3PKG-VERIFY ?auto_188296 ?auto_188297 ?auto_188298 ?auto_188295 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_188305 - OBJ
      ?auto_188306 - OBJ
      ?auto_188307 - OBJ
      ?auto_188304 - LOCATION
    )
    :vars
    (
      ?auto_188308 - LOCATION
      ?auto_188312 - CITY
      ?auto_188311 - OBJ
      ?auto_188310 - LOCATION
      ?auto_188309 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188306 ?auto_188305 ) ) ( not ( = ?auto_188307 ?auto_188305 ) ) ( not ( = ?auto_188307 ?auto_188306 ) ) ( IN-CITY ?auto_188308 ?auto_188312 ) ( IN-CITY ?auto_188304 ?auto_188312 ) ( not ( = ?auto_188304 ?auto_188308 ) ) ( OBJ-AT ?auto_188307 ?auto_188304 ) ( OBJ-AT ?auto_188306 ?auto_188308 ) ( not ( = ?auto_188311 ?auto_188307 ) ) ( not ( = ?auto_188306 ?auto_188311 ) ) ( IN-CITY ?auto_188310 ?auto_188312 ) ( not ( = ?auto_188304 ?auto_188310 ) ) ( not ( = ?auto_188308 ?auto_188310 ) ) ( OBJ-AT ?auto_188311 ?auto_188310 ) ( not ( = ?auto_188311 ?auto_188305 ) ) ( OBJ-AT ?auto_188305 ?auto_188308 ) ( TRUCK-AT ?auto_188309 ?auto_188304 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188307 ?auto_188306 ?auto_188304 )
      ( DELIVER-3PKG-VERIFY ?auto_188305 ?auto_188306 ?auto_188307 ?auto_188304 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_188324 - OBJ
      ?auto_188325 - OBJ
      ?auto_188326 - OBJ
      ?auto_188323 - LOCATION
    )
    :vars
    (
      ?auto_188331 - OBJ
      ?auto_188327 - LOCATION
      ?auto_188330 - CITY
      ?auto_188329 - LOCATION
      ?auto_188328 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188325 ?auto_188324 ) ) ( not ( = ?auto_188326 ?auto_188324 ) ) ( not ( = ?auto_188326 ?auto_188325 ) ) ( not ( = ?auto_188325 ?auto_188331 ) ) ( IN-CITY ?auto_188327 ?auto_188330 ) ( IN-CITY ?auto_188323 ?auto_188330 ) ( not ( = ?auto_188323 ?auto_188327 ) ) ( OBJ-AT ?auto_188331 ?auto_188323 ) ( OBJ-AT ?auto_188325 ?auto_188327 ) ( not ( = ?auto_188326 ?auto_188331 ) ) ( IN-CITY ?auto_188329 ?auto_188330 ) ( not ( = ?auto_188323 ?auto_188329 ) ) ( not ( = ?auto_188327 ?auto_188329 ) ) ( OBJ-AT ?auto_188326 ?auto_188329 ) ( not ( = ?auto_188324 ?auto_188331 ) ) ( OBJ-AT ?auto_188324 ?auto_188327 ) ( TRUCK-AT ?auto_188328 ?auto_188323 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188331 ?auto_188325 ?auto_188323 )
      ( DELIVER-3PKG-VERIFY ?auto_188324 ?auto_188325 ?auto_188326 ?auto_188323 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_188343 - OBJ
      ?auto_188344 - OBJ
      ?auto_188345 - OBJ
      ?auto_188342 - LOCATION
    )
    :vars
    (
      ?auto_188346 - LOCATION
      ?auto_188350 - CITY
      ?auto_188349 - LOCATION
      ?auto_188347 - OBJ
      ?auto_188348 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188344 ?auto_188343 ) ) ( not ( = ?auto_188345 ?auto_188343 ) ) ( not ( = ?auto_188345 ?auto_188344 ) ) ( IN-CITY ?auto_188346 ?auto_188350 ) ( IN-CITY ?auto_188342 ?auto_188350 ) ( not ( = ?auto_188342 ?auto_188346 ) ) ( OBJ-AT ?auto_188344 ?auto_188342 ) ( OBJ-AT ?auto_188345 ?auto_188346 ) ( IN-CITY ?auto_188349 ?auto_188350 ) ( not ( = ?auto_188342 ?auto_188349 ) ) ( not ( = ?auto_188346 ?auto_188349 ) ) ( OBJ-AT ?auto_188343 ?auto_188349 ) ( not ( = ?auto_188347 ?auto_188344 ) ) ( not ( = ?auto_188345 ?auto_188347 ) ) ( not ( = ?auto_188343 ?auto_188347 ) ) ( OBJ-AT ?auto_188347 ?auto_188346 ) ( TRUCK-AT ?auto_188348 ?auto_188342 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188344 ?auto_188345 ?auto_188342 )
      ( DELIVER-3PKG-VERIFY ?auto_188343 ?auto_188344 ?auto_188345 ?auto_188342 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_188352 - OBJ
      ?auto_188353 - OBJ
      ?auto_188354 - OBJ
      ?auto_188351 - LOCATION
    )
    :vars
    (
      ?auto_188359 - OBJ
      ?auto_188355 - LOCATION
      ?auto_188358 - CITY
      ?auto_188357 - LOCATION
      ?auto_188356 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188353 ?auto_188352 ) ) ( not ( = ?auto_188354 ?auto_188352 ) ) ( not ( = ?auto_188354 ?auto_188353 ) ) ( not ( = ?auto_188354 ?auto_188359 ) ) ( IN-CITY ?auto_188355 ?auto_188358 ) ( IN-CITY ?auto_188351 ?auto_188358 ) ( not ( = ?auto_188351 ?auto_188355 ) ) ( OBJ-AT ?auto_188359 ?auto_188351 ) ( OBJ-AT ?auto_188354 ?auto_188355 ) ( not ( = ?auto_188352 ?auto_188359 ) ) ( IN-CITY ?auto_188357 ?auto_188358 ) ( not ( = ?auto_188351 ?auto_188357 ) ) ( not ( = ?auto_188355 ?auto_188357 ) ) ( OBJ-AT ?auto_188352 ?auto_188357 ) ( not ( = ?auto_188353 ?auto_188359 ) ) ( OBJ-AT ?auto_188353 ?auto_188355 ) ( TRUCK-AT ?auto_188356 ?auto_188351 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188359 ?auto_188354 ?auto_188351 )
      ( DELIVER-3PKG-VERIFY ?auto_188352 ?auto_188353 ?auto_188354 ?auto_188351 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_188371 - OBJ
      ?auto_188372 - OBJ
      ?auto_188373 - OBJ
      ?auto_188370 - LOCATION
    )
    :vars
    (
      ?auto_188374 - LOCATION
      ?auto_188378 - CITY
      ?auto_188377 - LOCATION
      ?auto_188375 - OBJ
      ?auto_188376 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188372 ?auto_188371 ) ) ( not ( = ?auto_188373 ?auto_188371 ) ) ( not ( = ?auto_188373 ?auto_188372 ) ) ( IN-CITY ?auto_188374 ?auto_188378 ) ( IN-CITY ?auto_188370 ?auto_188378 ) ( not ( = ?auto_188370 ?auto_188374 ) ) ( OBJ-AT ?auto_188373 ?auto_188370 ) ( OBJ-AT ?auto_188372 ?auto_188374 ) ( IN-CITY ?auto_188377 ?auto_188378 ) ( not ( = ?auto_188370 ?auto_188377 ) ) ( not ( = ?auto_188374 ?auto_188377 ) ) ( OBJ-AT ?auto_188371 ?auto_188377 ) ( not ( = ?auto_188375 ?auto_188373 ) ) ( not ( = ?auto_188372 ?auto_188375 ) ) ( not ( = ?auto_188371 ?auto_188375 ) ) ( OBJ-AT ?auto_188375 ?auto_188374 ) ( TRUCK-AT ?auto_188376 ?auto_188370 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188373 ?auto_188372 ?auto_188370 )
      ( DELIVER-3PKG-VERIFY ?auto_188371 ?auto_188372 ?auto_188373 ?auto_188370 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_188380 - OBJ
      ?auto_188381 - OBJ
      ?auto_188382 - OBJ
      ?auto_188379 - LOCATION
    )
    :vars
    (
      ?auto_188387 - OBJ
      ?auto_188383 - LOCATION
      ?auto_188386 - CITY
      ?auto_188385 - LOCATION
      ?auto_188384 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188381 ?auto_188380 ) ) ( not ( = ?auto_188382 ?auto_188380 ) ) ( not ( = ?auto_188382 ?auto_188381 ) ) ( not ( = ?auto_188381 ?auto_188387 ) ) ( IN-CITY ?auto_188383 ?auto_188386 ) ( IN-CITY ?auto_188379 ?auto_188386 ) ( not ( = ?auto_188379 ?auto_188383 ) ) ( OBJ-AT ?auto_188387 ?auto_188379 ) ( OBJ-AT ?auto_188381 ?auto_188383 ) ( not ( = ?auto_188380 ?auto_188387 ) ) ( IN-CITY ?auto_188385 ?auto_188386 ) ( not ( = ?auto_188379 ?auto_188385 ) ) ( not ( = ?auto_188383 ?auto_188385 ) ) ( OBJ-AT ?auto_188380 ?auto_188385 ) ( not ( = ?auto_188382 ?auto_188387 ) ) ( OBJ-AT ?auto_188382 ?auto_188383 ) ( TRUCK-AT ?auto_188384 ?auto_188379 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188387 ?auto_188381 ?auto_188379 )
      ( DELIVER-3PKG-VERIFY ?auto_188380 ?auto_188381 ?auto_188382 ?auto_188379 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_188419 - OBJ
      ?auto_188420 - OBJ
      ?auto_188421 - OBJ
      ?auto_188418 - LOCATION
    )
    :vars
    (
      ?auto_188422 - LOCATION
      ?auto_188426 - CITY
      ?auto_188425 - OBJ
      ?auto_188424 - LOCATION
      ?auto_188423 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188420 ?auto_188419 ) ) ( not ( = ?auto_188421 ?auto_188419 ) ) ( not ( = ?auto_188421 ?auto_188420 ) ) ( IN-CITY ?auto_188422 ?auto_188426 ) ( IN-CITY ?auto_188418 ?auto_188426 ) ( not ( = ?auto_188418 ?auto_188422 ) ) ( OBJ-AT ?auto_188420 ?auto_188418 ) ( OBJ-AT ?auto_188419 ?auto_188422 ) ( not ( = ?auto_188425 ?auto_188420 ) ) ( not ( = ?auto_188419 ?auto_188425 ) ) ( IN-CITY ?auto_188424 ?auto_188426 ) ( not ( = ?auto_188418 ?auto_188424 ) ) ( not ( = ?auto_188422 ?auto_188424 ) ) ( OBJ-AT ?auto_188425 ?auto_188424 ) ( not ( = ?auto_188425 ?auto_188421 ) ) ( OBJ-AT ?auto_188421 ?auto_188422 ) ( TRUCK-AT ?auto_188423 ?auto_188418 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188420 ?auto_188419 ?auto_188418 )
      ( DELIVER-3PKG-VERIFY ?auto_188419 ?auto_188420 ?auto_188421 ?auto_188418 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_188428 - OBJ
      ?auto_188429 - OBJ
      ?auto_188430 - OBJ
      ?auto_188427 - LOCATION
    )
    :vars
    (
      ?auto_188431 - LOCATION
      ?auto_188435 - CITY
      ?auto_188434 - LOCATION
      ?auto_188432 - OBJ
      ?auto_188433 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188429 ?auto_188428 ) ) ( not ( = ?auto_188430 ?auto_188428 ) ) ( not ( = ?auto_188430 ?auto_188429 ) ) ( IN-CITY ?auto_188431 ?auto_188435 ) ( IN-CITY ?auto_188427 ?auto_188435 ) ( not ( = ?auto_188427 ?auto_188431 ) ) ( OBJ-AT ?auto_188429 ?auto_188427 ) ( OBJ-AT ?auto_188428 ?auto_188431 ) ( IN-CITY ?auto_188434 ?auto_188435 ) ( not ( = ?auto_188427 ?auto_188434 ) ) ( not ( = ?auto_188431 ?auto_188434 ) ) ( OBJ-AT ?auto_188430 ?auto_188434 ) ( not ( = ?auto_188432 ?auto_188429 ) ) ( not ( = ?auto_188428 ?auto_188432 ) ) ( not ( = ?auto_188430 ?auto_188432 ) ) ( OBJ-AT ?auto_188432 ?auto_188431 ) ( TRUCK-AT ?auto_188433 ?auto_188427 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188429 ?auto_188428 ?auto_188427 )
      ( DELIVER-3PKG-VERIFY ?auto_188428 ?auto_188429 ?auto_188430 ?auto_188427 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_188447 - OBJ
      ?auto_188448 - OBJ
      ?auto_188449 - OBJ
      ?auto_188446 - LOCATION
    )
    :vars
    (
      ?auto_188450 - LOCATION
      ?auto_188454 - CITY
      ?auto_188453 - OBJ
      ?auto_188452 - LOCATION
      ?auto_188451 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188448 ?auto_188447 ) ) ( not ( = ?auto_188449 ?auto_188447 ) ) ( not ( = ?auto_188449 ?auto_188448 ) ) ( IN-CITY ?auto_188450 ?auto_188454 ) ( IN-CITY ?auto_188446 ?auto_188454 ) ( not ( = ?auto_188446 ?auto_188450 ) ) ( OBJ-AT ?auto_188449 ?auto_188446 ) ( OBJ-AT ?auto_188447 ?auto_188450 ) ( not ( = ?auto_188453 ?auto_188449 ) ) ( not ( = ?auto_188447 ?auto_188453 ) ) ( IN-CITY ?auto_188452 ?auto_188454 ) ( not ( = ?auto_188446 ?auto_188452 ) ) ( not ( = ?auto_188450 ?auto_188452 ) ) ( OBJ-AT ?auto_188453 ?auto_188452 ) ( not ( = ?auto_188453 ?auto_188448 ) ) ( OBJ-AT ?auto_188448 ?auto_188450 ) ( TRUCK-AT ?auto_188451 ?auto_188446 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188449 ?auto_188447 ?auto_188446 )
      ( DELIVER-3PKG-VERIFY ?auto_188447 ?auto_188448 ?auto_188449 ?auto_188446 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_188466 - OBJ
      ?auto_188467 - OBJ
      ?auto_188468 - OBJ
      ?auto_188465 - LOCATION
    )
    :vars
    (
      ?auto_188473 - OBJ
      ?auto_188469 - LOCATION
      ?auto_188472 - CITY
      ?auto_188471 - LOCATION
      ?auto_188470 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188467 ?auto_188466 ) ) ( not ( = ?auto_188468 ?auto_188466 ) ) ( not ( = ?auto_188468 ?auto_188467 ) ) ( not ( = ?auto_188466 ?auto_188473 ) ) ( IN-CITY ?auto_188469 ?auto_188472 ) ( IN-CITY ?auto_188465 ?auto_188472 ) ( not ( = ?auto_188465 ?auto_188469 ) ) ( OBJ-AT ?auto_188473 ?auto_188465 ) ( OBJ-AT ?auto_188466 ?auto_188469 ) ( not ( = ?auto_188468 ?auto_188473 ) ) ( IN-CITY ?auto_188471 ?auto_188472 ) ( not ( = ?auto_188465 ?auto_188471 ) ) ( not ( = ?auto_188469 ?auto_188471 ) ) ( OBJ-AT ?auto_188468 ?auto_188471 ) ( not ( = ?auto_188467 ?auto_188473 ) ) ( OBJ-AT ?auto_188467 ?auto_188469 ) ( TRUCK-AT ?auto_188470 ?auto_188465 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188473 ?auto_188466 ?auto_188465 )
      ( DELIVER-3PKG-VERIFY ?auto_188466 ?auto_188467 ?auto_188468 ?auto_188465 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_188485 - OBJ
      ?auto_188486 - OBJ
      ?auto_188487 - OBJ
      ?auto_188484 - LOCATION
    )
    :vars
    (
      ?auto_188488 - LOCATION
      ?auto_188492 - CITY
      ?auto_188491 - LOCATION
      ?auto_188489 - OBJ
      ?auto_188490 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188486 ?auto_188485 ) ) ( not ( = ?auto_188487 ?auto_188485 ) ) ( not ( = ?auto_188487 ?auto_188486 ) ) ( IN-CITY ?auto_188488 ?auto_188492 ) ( IN-CITY ?auto_188484 ?auto_188492 ) ( not ( = ?auto_188484 ?auto_188488 ) ) ( OBJ-AT ?auto_188487 ?auto_188484 ) ( OBJ-AT ?auto_188485 ?auto_188488 ) ( IN-CITY ?auto_188491 ?auto_188492 ) ( not ( = ?auto_188484 ?auto_188491 ) ) ( not ( = ?auto_188488 ?auto_188491 ) ) ( OBJ-AT ?auto_188486 ?auto_188491 ) ( not ( = ?auto_188489 ?auto_188487 ) ) ( not ( = ?auto_188485 ?auto_188489 ) ) ( not ( = ?auto_188486 ?auto_188489 ) ) ( OBJ-AT ?auto_188489 ?auto_188488 ) ( TRUCK-AT ?auto_188490 ?auto_188484 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188487 ?auto_188485 ?auto_188484 )
      ( DELIVER-3PKG-VERIFY ?auto_188485 ?auto_188486 ?auto_188487 ?auto_188484 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_188494 - OBJ
      ?auto_188495 - OBJ
      ?auto_188496 - OBJ
      ?auto_188493 - LOCATION
    )
    :vars
    (
      ?auto_188501 - OBJ
      ?auto_188497 - LOCATION
      ?auto_188500 - CITY
      ?auto_188499 - LOCATION
      ?auto_188498 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188495 ?auto_188494 ) ) ( not ( = ?auto_188496 ?auto_188494 ) ) ( not ( = ?auto_188496 ?auto_188495 ) ) ( not ( = ?auto_188494 ?auto_188501 ) ) ( IN-CITY ?auto_188497 ?auto_188500 ) ( IN-CITY ?auto_188493 ?auto_188500 ) ( not ( = ?auto_188493 ?auto_188497 ) ) ( OBJ-AT ?auto_188501 ?auto_188493 ) ( OBJ-AT ?auto_188494 ?auto_188497 ) ( not ( = ?auto_188495 ?auto_188501 ) ) ( IN-CITY ?auto_188499 ?auto_188500 ) ( not ( = ?auto_188493 ?auto_188499 ) ) ( not ( = ?auto_188497 ?auto_188499 ) ) ( OBJ-AT ?auto_188495 ?auto_188499 ) ( not ( = ?auto_188496 ?auto_188501 ) ) ( OBJ-AT ?auto_188496 ?auto_188497 ) ( TRUCK-AT ?auto_188498 ?auto_188493 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188501 ?auto_188494 ?auto_188493 )
      ( DELIVER-3PKG-VERIFY ?auto_188494 ?auto_188495 ?auto_188496 ?auto_188493 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_188657 - OBJ
      ?auto_188658 - OBJ
      ?auto_188659 - OBJ
      ?auto_188660 - OBJ
      ?auto_188656 - LOCATION
    )
    :vars
    (
      ?auto_188661 - LOCATION
      ?auto_188664 - CITY
      ?auto_188663 - LOCATION
      ?auto_188662 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188658 ?auto_188657 ) ) ( not ( = ?auto_188659 ?auto_188657 ) ) ( not ( = ?auto_188659 ?auto_188658 ) ) ( not ( = ?auto_188660 ?auto_188657 ) ) ( not ( = ?auto_188660 ?auto_188658 ) ) ( not ( = ?auto_188660 ?auto_188659 ) ) ( IN-CITY ?auto_188661 ?auto_188664 ) ( IN-CITY ?auto_188656 ?auto_188664 ) ( not ( = ?auto_188656 ?auto_188661 ) ) ( OBJ-AT ?auto_188657 ?auto_188656 ) ( OBJ-AT ?auto_188660 ?auto_188661 ) ( IN-CITY ?auto_188663 ?auto_188664 ) ( not ( = ?auto_188656 ?auto_188663 ) ) ( not ( = ?auto_188661 ?auto_188663 ) ) ( OBJ-AT ?auto_188659 ?auto_188663 ) ( OBJ-AT ?auto_188658 ?auto_188661 ) ( TRUCK-AT ?auto_188662 ?auto_188656 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188657 ?auto_188660 ?auto_188656 )
      ( DELIVER-4PKG-VERIFY ?auto_188657 ?auto_188658 ?auto_188659 ?auto_188660 ?auto_188656 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_188686 - OBJ
      ?auto_188687 - OBJ
      ?auto_188688 - OBJ
      ?auto_188689 - OBJ
      ?auto_188685 - LOCATION
    )
    :vars
    (
      ?auto_188690 - LOCATION
      ?auto_188693 - CITY
      ?auto_188692 - LOCATION
      ?auto_188691 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188687 ?auto_188686 ) ) ( not ( = ?auto_188688 ?auto_188686 ) ) ( not ( = ?auto_188688 ?auto_188687 ) ) ( not ( = ?auto_188689 ?auto_188686 ) ) ( not ( = ?auto_188689 ?auto_188687 ) ) ( not ( = ?auto_188689 ?auto_188688 ) ) ( IN-CITY ?auto_188690 ?auto_188693 ) ( IN-CITY ?auto_188685 ?auto_188693 ) ( not ( = ?auto_188685 ?auto_188690 ) ) ( OBJ-AT ?auto_188686 ?auto_188685 ) ( OBJ-AT ?auto_188688 ?auto_188690 ) ( IN-CITY ?auto_188692 ?auto_188693 ) ( not ( = ?auto_188685 ?auto_188692 ) ) ( not ( = ?auto_188690 ?auto_188692 ) ) ( OBJ-AT ?auto_188689 ?auto_188692 ) ( OBJ-AT ?auto_188687 ?auto_188690 ) ( TRUCK-AT ?auto_188691 ?auto_188685 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188686 ?auto_188688 ?auto_188685 )
      ( DELIVER-4PKG-VERIFY ?auto_188686 ?auto_188687 ?auto_188688 ?auto_188689 ?auto_188685 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_188715 - OBJ
      ?auto_188716 - OBJ
      ?auto_188717 - OBJ
      ?auto_188718 - OBJ
      ?auto_188714 - LOCATION
    )
    :vars
    (
      ?auto_188719 - LOCATION
      ?auto_188722 - CITY
      ?auto_188721 - LOCATION
      ?auto_188720 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188716 ?auto_188715 ) ) ( not ( = ?auto_188717 ?auto_188715 ) ) ( not ( = ?auto_188717 ?auto_188716 ) ) ( not ( = ?auto_188718 ?auto_188715 ) ) ( not ( = ?auto_188718 ?auto_188716 ) ) ( not ( = ?auto_188718 ?auto_188717 ) ) ( IN-CITY ?auto_188719 ?auto_188722 ) ( IN-CITY ?auto_188714 ?auto_188722 ) ( not ( = ?auto_188714 ?auto_188719 ) ) ( OBJ-AT ?auto_188715 ?auto_188714 ) ( OBJ-AT ?auto_188718 ?auto_188719 ) ( IN-CITY ?auto_188721 ?auto_188722 ) ( not ( = ?auto_188714 ?auto_188721 ) ) ( not ( = ?auto_188719 ?auto_188721 ) ) ( OBJ-AT ?auto_188716 ?auto_188721 ) ( OBJ-AT ?auto_188717 ?auto_188719 ) ( TRUCK-AT ?auto_188720 ?auto_188714 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188715 ?auto_188718 ?auto_188714 )
      ( DELIVER-4PKG-VERIFY ?auto_188715 ?auto_188716 ?auto_188717 ?auto_188718 ?auto_188714 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_188744 - OBJ
      ?auto_188745 - OBJ
      ?auto_188746 - OBJ
      ?auto_188747 - OBJ
      ?auto_188743 - LOCATION
    )
    :vars
    (
      ?auto_188748 - LOCATION
      ?auto_188751 - CITY
      ?auto_188750 - LOCATION
      ?auto_188749 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188745 ?auto_188744 ) ) ( not ( = ?auto_188746 ?auto_188744 ) ) ( not ( = ?auto_188746 ?auto_188745 ) ) ( not ( = ?auto_188747 ?auto_188744 ) ) ( not ( = ?auto_188747 ?auto_188745 ) ) ( not ( = ?auto_188747 ?auto_188746 ) ) ( IN-CITY ?auto_188748 ?auto_188751 ) ( IN-CITY ?auto_188743 ?auto_188751 ) ( not ( = ?auto_188743 ?auto_188748 ) ) ( OBJ-AT ?auto_188744 ?auto_188743 ) ( OBJ-AT ?auto_188746 ?auto_188748 ) ( IN-CITY ?auto_188750 ?auto_188751 ) ( not ( = ?auto_188743 ?auto_188750 ) ) ( not ( = ?auto_188748 ?auto_188750 ) ) ( OBJ-AT ?auto_188745 ?auto_188750 ) ( OBJ-AT ?auto_188747 ?auto_188748 ) ( TRUCK-AT ?auto_188749 ?auto_188743 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188744 ?auto_188746 ?auto_188743 )
      ( DELIVER-4PKG-VERIFY ?auto_188744 ?auto_188745 ?auto_188746 ?auto_188747 ?auto_188743 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_188835 - OBJ
      ?auto_188836 - OBJ
      ?auto_188837 - OBJ
      ?auto_188838 - OBJ
      ?auto_188834 - LOCATION
    )
    :vars
    (
      ?auto_188839 - LOCATION
      ?auto_188842 - CITY
      ?auto_188841 - LOCATION
      ?auto_188840 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188836 ?auto_188835 ) ) ( not ( = ?auto_188837 ?auto_188835 ) ) ( not ( = ?auto_188837 ?auto_188836 ) ) ( not ( = ?auto_188838 ?auto_188835 ) ) ( not ( = ?auto_188838 ?auto_188836 ) ) ( not ( = ?auto_188838 ?auto_188837 ) ) ( IN-CITY ?auto_188839 ?auto_188842 ) ( IN-CITY ?auto_188834 ?auto_188842 ) ( not ( = ?auto_188834 ?auto_188839 ) ) ( OBJ-AT ?auto_188835 ?auto_188834 ) ( OBJ-AT ?auto_188836 ?auto_188839 ) ( IN-CITY ?auto_188841 ?auto_188842 ) ( not ( = ?auto_188834 ?auto_188841 ) ) ( not ( = ?auto_188839 ?auto_188841 ) ) ( OBJ-AT ?auto_188838 ?auto_188841 ) ( OBJ-AT ?auto_188837 ?auto_188839 ) ( TRUCK-AT ?auto_188840 ?auto_188834 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188835 ?auto_188836 ?auto_188834 )
      ( DELIVER-4PKG-VERIFY ?auto_188835 ?auto_188836 ?auto_188837 ?auto_188838 ?auto_188834 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_188864 - OBJ
      ?auto_188865 - OBJ
      ?auto_188866 - OBJ
      ?auto_188867 - OBJ
      ?auto_188863 - LOCATION
    )
    :vars
    (
      ?auto_188868 - LOCATION
      ?auto_188871 - CITY
      ?auto_188870 - LOCATION
      ?auto_188869 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188865 ?auto_188864 ) ) ( not ( = ?auto_188866 ?auto_188864 ) ) ( not ( = ?auto_188866 ?auto_188865 ) ) ( not ( = ?auto_188867 ?auto_188864 ) ) ( not ( = ?auto_188867 ?auto_188865 ) ) ( not ( = ?auto_188867 ?auto_188866 ) ) ( IN-CITY ?auto_188868 ?auto_188871 ) ( IN-CITY ?auto_188863 ?auto_188871 ) ( not ( = ?auto_188863 ?auto_188868 ) ) ( OBJ-AT ?auto_188864 ?auto_188863 ) ( OBJ-AT ?auto_188865 ?auto_188868 ) ( IN-CITY ?auto_188870 ?auto_188871 ) ( not ( = ?auto_188863 ?auto_188870 ) ) ( not ( = ?auto_188868 ?auto_188870 ) ) ( OBJ-AT ?auto_188866 ?auto_188870 ) ( OBJ-AT ?auto_188867 ?auto_188868 ) ( TRUCK-AT ?auto_188869 ?auto_188863 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188864 ?auto_188865 ?auto_188863 )
      ( DELIVER-4PKG-VERIFY ?auto_188864 ?auto_188865 ?auto_188866 ?auto_188867 ?auto_188863 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_188955 - OBJ
      ?auto_188956 - OBJ
      ?auto_188957 - OBJ
      ?auto_188958 - OBJ
      ?auto_188954 - LOCATION
    )
    :vars
    (
      ?auto_188959 - LOCATION
      ?auto_188962 - CITY
      ?auto_188961 - LOCATION
      ?auto_188960 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188956 ?auto_188955 ) ) ( not ( = ?auto_188957 ?auto_188955 ) ) ( not ( = ?auto_188957 ?auto_188956 ) ) ( not ( = ?auto_188958 ?auto_188955 ) ) ( not ( = ?auto_188958 ?auto_188956 ) ) ( not ( = ?auto_188958 ?auto_188957 ) ) ( IN-CITY ?auto_188959 ?auto_188962 ) ( IN-CITY ?auto_188954 ?auto_188962 ) ( not ( = ?auto_188954 ?auto_188959 ) ) ( OBJ-AT ?auto_188956 ?auto_188954 ) ( OBJ-AT ?auto_188958 ?auto_188959 ) ( IN-CITY ?auto_188961 ?auto_188962 ) ( not ( = ?auto_188954 ?auto_188961 ) ) ( not ( = ?auto_188959 ?auto_188961 ) ) ( OBJ-AT ?auto_188957 ?auto_188961 ) ( OBJ-AT ?auto_188955 ?auto_188959 ) ( TRUCK-AT ?auto_188960 ?auto_188954 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188956 ?auto_188958 ?auto_188954 )
      ( DELIVER-4PKG-VERIFY ?auto_188955 ?auto_188956 ?auto_188957 ?auto_188958 ?auto_188954 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_188984 - OBJ
      ?auto_188985 - OBJ
      ?auto_188986 - OBJ
      ?auto_188987 - OBJ
      ?auto_188983 - LOCATION
    )
    :vars
    (
      ?auto_188988 - LOCATION
      ?auto_188991 - CITY
      ?auto_188990 - LOCATION
      ?auto_188989 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_188985 ?auto_188984 ) ) ( not ( = ?auto_188986 ?auto_188984 ) ) ( not ( = ?auto_188986 ?auto_188985 ) ) ( not ( = ?auto_188987 ?auto_188984 ) ) ( not ( = ?auto_188987 ?auto_188985 ) ) ( not ( = ?auto_188987 ?auto_188986 ) ) ( IN-CITY ?auto_188988 ?auto_188991 ) ( IN-CITY ?auto_188983 ?auto_188991 ) ( not ( = ?auto_188983 ?auto_188988 ) ) ( OBJ-AT ?auto_188985 ?auto_188983 ) ( OBJ-AT ?auto_188986 ?auto_188988 ) ( IN-CITY ?auto_188990 ?auto_188991 ) ( not ( = ?auto_188983 ?auto_188990 ) ) ( not ( = ?auto_188988 ?auto_188990 ) ) ( OBJ-AT ?auto_188987 ?auto_188990 ) ( OBJ-AT ?auto_188984 ?auto_188988 ) ( TRUCK-AT ?auto_188989 ?auto_188983 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188985 ?auto_188986 ?auto_188983 )
      ( DELIVER-4PKG-VERIFY ?auto_188984 ?auto_188985 ?auto_188986 ?auto_188987 ?auto_188983 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_189076 - OBJ
      ?auto_189077 - OBJ
      ?auto_189078 - OBJ
      ?auto_189079 - OBJ
      ?auto_189075 - LOCATION
    )
    :vars
    (
      ?auto_189080 - LOCATION
      ?auto_189083 - CITY
      ?auto_189082 - LOCATION
      ?auto_189081 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_189077 ?auto_189076 ) ) ( not ( = ?auto_189078 ?auto_189076 ) ) ( not ( = ?auto_189078 ?auto_189077 ) ) ( not ( = ?auto_189079 ?auto_189076 ) ) ( not ( = ?auto_189079 ?auto_189077 ) ) ( not ( = ?auto_189079 ?auto_189078 ) ) ( IN-CITY ?auto_189080 ?auto_189083 ) ( IN-CITY ?auto_189075 ?auto_189083 ) ( not ( = ?auto_189075 ?auto_189080 ) ) ( OBJ-AT ?auto_189078 ?auto_189075 ) ( OBJ-AT ?auto_189079 ?auto_189080 ) ( IN-CITY ?auto_189082 ?auto_189083 ) ( not ( = ?auto_189075 ?auto_189082 ) ) ( not ( = ?auto_189080 ?auto_189082 ) ) ( OBJ-AT ?auto_189077 ?auto_189082 ) ( OBJ-AT ?auto_189076 ?auto_189080 ) ( TRUCK-AT ?auto_189081 ?auto_189075 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_189078 ?auto_189079 ?auto_189075 )
      ( DELIVER-4PKG-VERIFY ?auto_189076 ?auto_189077 ?auto_189078 ?auto_189079 ?auto_189075 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_189105 - OBJ
      ?auto_189106 - OBJ
      ?auto_189107 - OBJ
      ?auto_189108 - OBJ
      ?auto_189104 - LOCATION
    )
    :vars
    (
      ?auto_189109 - LOCATION
      ?auto_189112 - CITY
      ?auto_189111 - LOCATION
      ?auto_189110 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_189106 ?auto_189105 ) ) ( not ( = ?auto_189107 ?auto_189105 ) ) ( not ( = ?auto_189107 ?auto_189106 ) ) ( not ( = ?auto_189108 ?auto_189105 ) ) ( not ( = ?auto_189108 ?auto_189106 ) ) ( not ( = ?auto_189108 ?auto_189107 ) ) ( IN-CITY ?auto_189109 ?auto_189112 ) ( IN-CITY ?auto_189104 ?auto_189112 ) ( not ( = ?auto_189104 ?auto_189109 ) ) ( OBJ-AT ?auto_189108 ?auto_189104 ) ( OBJ-AT ?auto_189107 ?auto_189109 ) ( IN-CITY ?auto_189111 ?auto_189112 ) ( not ( = ?auto_189104 ?auto_189111 ) ) ( not ( = ?auto_189109 ?auto_189111 ) ) ( OBJ-AT ?auto_189106 ?auto_189111 ) ( OBJ-AT ?auto_189105 ?auto_189109 ) ( TRUCK-AT ?auto_189110 ?auto_189104 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_189108 ?auto_189107 ?auto_189104 )
      ( DELIVER-4PKG-VERIFY ?auto_189105 ?auto_189106 ?auto_189107 ?auto_189108 ?auto_189104 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_189164 - OBJ
      ?auto_189165 - OBJ
      ?auto_189166 - OBJ
      ?auto_189167 - OBJ
      ?auto_189163 - LOCATION
    )
    :vars
    (
      ?auto_189168 - LOCATION
      ?auto_189171 - CITY
      ?auto_189170 - LOCATION
      ?auto_189169 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_189165 ?auto_189164 ) ) ( not ( = ?auto_189166 ?auto_189164 ) ) ( not ( = ?auto_189166 ?auto_189165 ) ) ( not ( = ?auto_189167 ?auto_189164 ) ) ( not ( = ?auto_189167 ?auto_189165 ) ) ( not ( = ?auto_189167 ?auto_189166 ) ) ( IN-CITY ?auto_189168 ?auto_189171 ) ( IN-CITY ?auto_189163 ?auto_189171 ) ( not ( = ?auto_189163 ?auto_189168 ) ) ( OBJ-AT ?auto_189166 ?auto_189163 ) ( OBJ-AT ?auto_189165 ?auto_189168 ) ( IN-CITY ?auto_189170 ?auto_189171 ) ( not ( = ?auto_189163 ?auto_189170 ) ) ( not ( = ?auto_189168 ?auto_189170 ) ) ( OBJ-AT ?auto_189167 ?auto_189170 ) ( OBJ-AT ?auto_189164 ?auto_189168 ) ( TRUCK-AT ?auto_189169 ?auto_189163 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_189166 ?auto_189165 ?auto_189163 )
      ( DELIVER-4PKG-VERIFY ?auto_189164 ?auto_189165 ?auto_189166 ?auto_189167 ?auto_189163 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_189225 - OBJ
      ?auto_189226 - OBJ
      ?auto_189227 - OBJ
      ?auto_189228 - OBJ
      ?auto_189224 - LOCATION
    )
    :vars
    (
      ?auto_189229 - LOCATION
      ?auto_189232 - CITY
      ?auto_189231 - LOCATION
      ?auto_189230 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_189226 ?auto_189225 ) ) ( not ( = ?auto_189227 ?auto_189225 ) ) ( not ( = ?auto_189227 ?auto_189226 ) ) ( not ( = ?auto_189228 ?auto_189225 ) ) ( not ( = ?auto_189228 ?auto_189226 ) ) ( not ( = ?auto_189228 ?auto_189227 ) ) ( IN-CITY ?auto_189229 ?auto_189232 ) ( IN-CITY ?auto_189224 ?auto_189232 ) ( not ( = ?auto_189224 ?auto_189229 ) ) ( OBJ-AT ?auto_189228 ?auto_189224 ) ( OBJ-AT ?auto_189226 ?auto_189229 ) ( IN-CITY ?auto_189231 ?auto_189232 ) ( not ( = ?auto_189224 ?auto_189231 ) ) ( not ( = ?auto_189229 ?auto_189231 ) ) ( OBJ-AT ?auto_189227 ?auto_189231 ) ( OBJ-AT ?auto_189225 ?auto_189229 ) ( TRUCK-AT ?auto_189230 ?auto_189224 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_189228 ?auto_189226 ?auto_189224 )
      ( DELIVER-4PKG-VERIFY ?auto_189225 ?auto_189226 ?auto_189227 ?auto_189228 ?auto_189224 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_189316 - OBJ
      ?auto_189317 - OBJ
      ?auto_189318 - OBJ
      ?auto_189319 - OBJ
      ?auto_189315 - LOCATION
    )
    :vars
    (
      ?auto_189320 - LOCATION
      ?auto_189323 - CITY
      ?auto_189322 - LOCATION
      ?auto_189321 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_189317 ?auto_189316 ) ) ( not ( = ?auto_189318 ?auto_189316 ) ) ( not ( = ?auto_189318 ?auto_189317 ) ) ( not ( = ?auto_189319 ?auto_189316 ) ) ( not ( = ?auto_189319 ?auto_189317 ) ) ( not ( = ?auto_189319 ?auto_189318 ) ) ( IN-CITY ?auto_189320 ?auto_189323 ) ( IN-CITY ?auto_189315 ?auto_189323 ) ( not ( = ?auto_189315 ?auto_189320 ) ) ( OBJ-AT ?auto_189317 ?auto_189315 ) ( OBJ-AT ?auto_189319 ?auto_189320 ) ( IN-CITY ?auto_189322 ?auto_189323 ) ( not ( = ?auto_189315 ?auto_189322 ) ) ( not ( = ?auto_189320 ?auto_189322 ) ) ( OBJ-AT ?auto_189316 ?auto_189322 ) ( OBJ-AT ?auto_189318 ?auto_189320 ) ( TRUCK-AT ?auto_189321 ?auto_189315 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_189317 ?auto_189319 ?auto_189315 )
      ( DELIVER-4PKG-VERIFY ?auto_189316 ?auto_189317 ?auto_189318 ?auto_189319 ?auto_189315 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_189345 - OBJ
      ?auto_189346 - OBJ
      ?auto_189347 - OBJ
      ?auto_189348 - OBJ
      ?auto_189344 - LOCATION
    )
    :vars
    (
      ?auto_189349 - LOCATION
      ?auto_189352 - CITY
      ?auto_189351 - LOCATION
      ?auto_189350 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_189346 ?auto_189345 ) ) ( not ( = ?auto_189347 ?auto_189345 ) ) ( not ( = ?auto_189347 ?auto_189346 ) ) ( not ( = ?auto_189348 ?auto_189345 ) ) ( not ( = ?auto_189348 ?auto_189346 ) ) ( not ( = ?auto_189348 ?auto_189347 ) ) ( IN-CITY ?auto_189349 ?auto_189352 ) ( IN-CITY ?auto_189344 ?auto_189352 ) ( not ( = ?auto_189344 ?auto_189349 ) ) ( OBJ-AT ?auto_189346 ?auto_189344 ) ( OBJ-AT ?auto_189347 ?auto_189349 ) ( IN-CITY ?auto_189351 ?auto_189352 ) ( not ( = ?auto_189344 ?auto_189351 ) ) ( not ( = ?auto_189349 ?auto_189351 ) ) ( OBJ-AT ?auto_189345 ?auto_189351 ) ( OBJ-AT ?auto_189348 ?auto_189349 ) ( TRUCK-AT ?auto_189350 ?auto_189344 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_189346 ?auto_189347 ?auto_189344 )
      ( DELIVER-4PKG-VERIFY ?auto_189345 ?auto_189346 ?auto_189347 ?auto_189348 ?auto_189344 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_189374 - OBJ
      ?auto_189375 - OBJ
      ?auto_189376 - OBJ
      ?auto_189377 - OBJ
      ?auto_189373 - LOCATION
    )
    :vars
    (
      ?auto_189378 - LOCATION
      ?auto_189381 - CITY
      ?auto_189380 - LOCATION
      ?auto_189379 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_189375 ?auto_189374 ) ) ( not ( = ?auto_189376 ?auto_189374 ) ) ( not ( = ?auto_189376 ?auto_189375 ) ) ( not ( = ?auto_189377 ?auto_189374 ) ) ( not ( = ?auto_189377 ?auto_189375 ) ) ( not ( = ?auto_189377 ?auto_189376 ) ) ( IN-CITY ?auto_189378 ?auto_189381 ) ( IN-CITY ?auto_189373 ?auto_189381 ) ( not ( = ?auto_189373 ?auto_189378 ) ) ( OBJ-AT ?auto_189376 ?auto_189373 ) ( OBJ-AT ?auto_189377 ?auto_189378 ) ( IN-CITY ?auto_189380 ?auto_189381 ) ( not ( = ?auto_189373 ?auto_189380 ) ) ( not ( = ?auto_189378 ?auto_189380 ) ) ( OBJ-AT ?auto_189374 ?auto_189380 ) ( OBJ-AT ?auto_189375 ?auto_189378 ) ( TRUCK-AT ?auto_189379 ?auto_189373 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_189376 ?auto_189377 ?auto_189373 )
      ( DELIVER-4PKG-VERIFY ?auto_189374 ?auto_189375 ?auto_189376 ?auto_189377 ?auto_189373 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_189403 - OBJ
      ?auto_189404 - OBJ
      ?auto_189405 - OBJ
      ?auto_189406 - OBJ
      ?auto_189402 - LOCATION
    )
    :vars
    (
      ?auto_189407 - LOCATION
      ?auto_189410 - CITY
      ?auto_189409 - LOCATION
      ?auto_189408 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_189404 ?auto_189403 ) ) ( not ( = ?auto_189405 ?auto_189403 ) ) ( not ( = ?auto_189405 ?auto_189404 ) ) ( not ( = ?auto_189406 ?auto_189403 ) ) ( not ( = ?auto_189406 ?auto_189404 ) ) ( not ( = ?auto_189406 ?auto_189405 ) ) ( IN-CITY ?auto_189407 ?auto_189410 ) ( IN-CITY ?auto_189402 ?auto_189410 ) ( not ( = ?auto_189402 ?auto_189407 ) ) ( OBJ-AT ?auto_189406 ?auto_189402 ) ( OBJ-AT ?auto_189405 ?auto_189407 ) ( IN-CITY ?auto_189409 ?auto_189410 ) ( not ( = ?auto_189402 ?auto_189409 ) ) ( not ( = ?auto_189407 ?auto_189409 ) ) ( OBJ-AT ?auto_189403 ?auto_189409 ) ( OBJ-AT ?auto_189404 ?auto_189407 ) ( TRUCK-AT ?auto_189408 ?auto_189402 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_189406 ?auto_189405 ?auto_189402 )
      ( DELIVER-4PKG-VERIFY ?auto_189403 ?auto_189404 ?auto_189405 ?auto_189406 ?auto_189402 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_189525 - OBJ
      ?auto_189526 - OBJ
      ?auto_189527 - OBJ
      ?auto_189528 - OBJ
      ?auto_189524 - LOCATION
    )
    :vars
    (
      ?auto_189529 - LOCATION
      ?auto_189532 - CITY
      ?auto_189531 - LOCATION
      ?auto_189530 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_189526 ?auto_189525 ) ) ( not ( = ?auto_189527 ?auto_189525 ) ) ( not ( = ?auto_189527 ?auto_189526 ) ) ( not ( = ?auto_189528 ?auto_189525 ) ) ( not ( = ?auto_189528 ?auto_189526 ) ) ( not ( = ?auto_189528 ?auto_189527 ) ) ( IN-CITY ?auto_189529 ?auto_189532 ) ( IN-CITY ?auto_189524 ?auto_189532 ) ( not ( = ?auto_189524 ?auto_189529 ) ) ( OBJ-AT ?auto_189527 ?auto_189524 ) ( OBJ-AT ?auto_189526 ?auto_189529 ) ( IN-CITY ?auto_189531 ?auto_189532 ) ( not ( = ?auto_189524 ?auto_189531 ) ) ( not ( = ?auto_189529 ?auto_189531 ) ) ( OBJ-AT ?auto_189525 ?auto_189531 ) ( OBJ-AT ?auto_189528 ?auto_189529 ) ( TRUCK-AT ?auto_189530 ?auto_189524 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_189527 ?auto_189526 ?auto_189524 )
      ( DELIVER-4PKG-VERIFY ?auto_189525 ?auto_189526 ?auto_189527 ?auto_189528 ?auto_189524 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_189554 - OBJ
      ?auto_189555 - OBJ
      ?auto_189556 - OBJ
      ?auto_189557 - OBJ
      ?auto_189553 - LOCATION
    )
    :vars
    (
      ?auto_189558 - LOCATION
      ?auto_189561 - CITY
      ?auto_189560 - LOCATION
      ?auto_189559 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_189555 ?auto_189554 ) ) ( not ( = ?auto_189556 ?auto_189554 ) ) ( not ( = ?auto_189556 ?auto_189555 ) ) ( not ( = ?auto_189557 ?auto_189554 ) ) ( not ( = ?auto_189557 ?auto_189555 ) ) ( not ( = ?auto_189557 ?auto_189556 ) ) ( IN-CITY ?auto_189558 ?auto_189561 ) ( IN-CITY ?auto_189553 ?auto_189561 ) ( not ( = ?auto_189553 ?auto_189558 ) ) ( OBJ-AT ?auto_189557 ?auto_189553 ) ( OBJ-AT ?auto_189555 ?auto_189558 ) ( IN-CITY ?auto_189560 ?auto_189561 ) ( not ( = ?auto_189553 ?auto_189560 ) ) ( not ( = ?auto_189558 ?auto_189560 ) ) ( OBJ-AT ?auto_189554 ?auto_189560 ) ( OBJ-AT ?auto_189556 ?auto_189558 ) ( TRUCK-AT ?auto_189559 ?auto_189553 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_189557 ?auto_189555 ?auto_189553 )
      ( DELIVER-4PKG-VERIFY ?auto_189554 ?auto_189555 ?auto_189556 ?auto_189557 ?auto_189553 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_189739 - OBJ
      ?auto_189740 - OBJ
      ?auto_189741 - OBJ
      ?auto_189742 - OBJ
      ?auto_189738 - LOCATION
    )
    :vars
    (
      ?auto_189743 - LOCATION
      ?auto_189746 - CITY
      ?auto_189745 - LOCATION
      ?auto_189744 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_189740 ?auto_189739 ) ) ( not ( = ?auto_189741 ?auto_189739 ) ) ( not ( = ?auto_189741 ?auto_189740 ) ) ( not ( = ?auto_189742 ?auto_189739 ) ) ( not ( = ?auto_189742 ?auto_189740 ) ) ( not ( = ?auto_189742 ?auto_189741 ) ) ( IN-CITY ?auto_189743 ?auto_189746 ) ( IN-CITY ?auto_189738 ?auto_189746 ) ( not ( = ?auto_189738 ?auto_189743 ) ) ( OBJ-AT ?auto_189740 ?auto_189738 ) ( OBJ-AT ?auto_189739 ?auto_189743 ) ( IN-CITY ?auto_189745 ?auto_189746 ) ( not ( = ?auto_189738 ?auto_189745 ) ) ( not ( = ?auto_189743 ?auto_189745 ) ) ( OBJ-AT ?auto_189742 ?auto_189745 ) ( OBJ-AT ?auto_189741 ?auto_189743 ) ( TRUCK-AT ?auto_189744 ?auto_189738 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_189740 ?auto_189739 ?auto_189738 )
      ( DELIVER-4PKG-VERIFY ?auto_189739 ?auto_189740 ?auto_189741 ?auto_189742 ?auto_189738 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_189768 - OBJ
      ?auto_189769 - OBJ
      ?auto_189770 - OBJ
      ?auto_189771 - OBJ
      ?auto_189767 - LOCATION
    )
    :vars
    (
      ?auto_189772 - LOCATION
      ?auto_189775 - CITY
      ?auto_189774 - LOCATION
      ?auto_189773 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_189769 ?auto_189768 ) ) ( not ( = ?auto_189770 ?auto_189768 ) ) ( not ( = ?auto_189770 ?auto_189769 ) ) ( not ( = ?auto_189771 ?auto_189768 ) ) ( not ( = ?auto_189771 ?auto_189769 ) ) ( not ( = ?auto_189771 ?auto_189770 ) ) ( IN-CITY ?auto_189772 ?auto_189775 ) ( IN-CITY ?auto_189767 ?auto_189775 ) ( not ( = ?auto_189767 ?auto_189772 ) ) ( OBJ-AT ?auto_189769 ?auto_189767 ) ( OBJ-AT ?auto_189768 ?auto_189772 ) ( IN-CITY ?auto_189774 ?auto_189775 ) ( not ( = ?auto_189767 ?auto_189774 ) ) ( not ( = ?auto_189772 ?auto_189774 ) ) ( OBJ-AT ?auto_189770 ?auto_189774 ) ( OBJ-AT ?auto_189771 ?auto_189772 ) ( TRUCK-AT ?auto_189773 ?auto_189767 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_189769 ?auto_189768 ?auto_189767 )
      ( DELIVER-4PKG-VERIFY ?auto_189768 ?auto_189769 ?auto_189770 ?auto_189771 ?auto_189767 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_189859 - OBJ
      ?auto_189860 - OBJ
      ?auto_189861 - OBJ
      ?auto_189862 - OBJ
      ?auto_189858 - LOCATION
    )
    :vars
    (
      ?auto_189863 - LOCATION
      ?auto_189866 - CITY
      ?auto_189865 - LOCATION
      ?auto_189864 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_189860 ?auto_189859 ) ) ( not ( = ?auto_189861 ?auto_189859 ) ) ( not ( = ?auto_189861 ?auto_189860 ) ) ( not ( = ?auto_189862 ?auto_189859 ) ) ( not ( = ?auto_189862 ?auto_189860 ) ) ( not ( = ?auto_189862 ?auto_189861 ) ) ( IN-CITY ?auto_189863 ?auto_189866 ) ( IN-CITY ?auto_189858 ?auto_189866 ) ( not ( = ?auto_189858 ?auto_189863 ) ) ( OBJ-AT ?auto_189861 ?auto_189858 ) ( OBJ-AT ?auto_189859 ?auto_189863 ) ( IN-CITY ?auto_189865 ?auto_189866 ) ( not ( = ?auto_189858 ?auto_189865 ) ) ( not ( = ?auto_189863 ?auto_189865 ) ) ( OBJ-AT ?auto_189862 ?auto_189865 ) ( OBJ-AT ?auto_189860 ?auto_189863 ) ( TRUCK-AT ?auto_189864 ?auto_189858 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_189861 ?auto_189859 ?auto_189858 )
      ( DELIVER-4PKG-VERIFY ?auto_189859 ?auto_189860 ?auto_189861 ?auto_189862 ?auto_189858 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_189920 - OBJ
      ?auto_189921 - OBJ
      ?auto_189922 - OBJ
      ?auto_189923 - OBJ
      ?auto_189919 - LOCATION
    )
    :vars
    (
      ?auto_189924 - LOCATION
      ?auto_189927 - CITY
      ?auto_189926 - LOCATION
      ?auto_189925 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_189921 ?auto_189920 ) ) ( not ( = ?auto_189922 ?auto_189920 ) ) ( not ( = ?auto_189922 ?auto_189921 ) ) ( not ( = ?auto_189923 ?auto_189920 ) ) ( not ( = ?auto_189923 ?auto_189921 ) ) ( not ( = ?auto_189923 ?auto_189922 ) ) ( IN-CITY ?auto_189924 ?auto_189927 ) ( IN-CITY ?auto_189919 ?auto_189927 ) ( not ( = ?auto_189919 ?auto_189924 ) ) ( OBJ-AT ?auto_189923 ?auto_189919 ) ( OBJ-AT ?auto_189920 ?auto_189924 ) ( IN-CITY ?auto_189926 ?auto_189927 ) ( not ( = ?auto_189919 ?auto_189926 ) ) ( not ( = ?auto_189924 ?auto_189926 ) ) ( OBJ-AT ?auto_189922 ?auto_189926 ) ( OBJ-AT ?auto_189921 ?auto_189924 ) ( TRUCK-AT ?auto_189925 ?auto_189919 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_189923 ?auto_189920 ?auto_189919 )
      ( DELIVER-4PKG-VERIFY ?auto_189920 ?auto_189921 ?auto_189922 ?auto_189923 ?auto_189919 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_190011 - OBJ
      ?auto_190012 - OBJ
      ?auto_190013 - OBJ
      ?auto_190014 - OBJ
      ?auto_190010 - LOCATION
    )
    :vars
    (
      ?auto_190015 - LOCATION
      ?auto_190018 - CITY
      ?auto_190017 - LOCATION
      ?auto_190016 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190012 ?auto_190011 ) ) ( not ( = ?auto_190013 ?auto_190011 ) ) ( not ( = ?auto_190013 ?auto_190012 ) ) ( not ( = ?auto_190014 ?auto_190011 ) ) ( not ( = ?auto_190014 ?auto_190012 ) ) ( not ( = ?auto_190014 ?auto_190013 ) ) ( IN-CITY ?auto_190015 ?auto_190018 ) ( IN-CITY ?auto_190010 ?auto_190018 ) ( not ( = ?auto_190010 ?auto_190015 ) ) ( OBJ-AT ?auto_190013 ?auto_190010 ) ( OBJ-AT ?auto_190011 ?auto_190015 ) ( IN-CITY ?auto_190017 ?auto_190018 ) ( not ( = ?auto_190010 ?auto_190017 ) ) ( not ( = ?auto_190015 ?auto_190017 ) ) ( OBJ-AT ?auto_190012 ?auto_190017 ) ( OBJ-AT ?auto_190014 ?auto_190015 ) ( TRUCK-AT ?auto_190016 ?auto_190010 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190013 ?auto_190011 ?auto_190010 )
      ( DELIVER-4PKG-VERIFY ?auto_190011 ?auto_190012 ?auto_190013 ?auto_190014 ?auto_190010 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_190040 - OBJ
      ?auto_190041 - OBJ
      ?auto_190042 - OBJ
      ?auto_190043 - OBJ
      ?auto_190039 - LOCATION
    )
    :vars
    (
      ?auto_190044 - LOCATION
      ?auto_190047 - CITY
      ?auto_190046 - LOCATION
      ?auto_190045 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190041 ?auto_190040 ) ) ( not ( = ?auto_190042 ?auto_190040 ) ) ( not ( = ?auto_190042 ?auto_190041 ) ) ( not ( = ?auto_190043 ?auto_190040 ) ) ( not ( = ?auto_190043 ?auto_190041 ) ) ( not ( = ?auto_190043 ?auto_190042 ) ) ( IN-CITY ?auto_190044 ?auto_190047 ) ( IN-CITY ?auto_190039 ?auto_190047 ) ( not ( = ?auto_190039 ?auto_190044 ) ) ( OBJ-AT ?auto_190043 ?auto_190039 ) ( OBJ-AT ?auto_190040 ?auto_190044 ) ( IN-CITY ?auto_190046 ?auto_190047 ) ( not ( = ?auto_190039 ?auto_190046 ) ) ( not ( = ?auto_190044 ?auto_190046 ) ) ( OBJ-AT ?auto_190041 ?auto_190046 ) ( OBJ-AT ?auto_190042 ?auto_190044 ) ( TRUCK-AT ?auto_190045 ?auto_190039 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190043 ?auto_190040 ?auto_190039 )
      ( DELIVER-4PKG-VERIFY ?auto_190040 ?auto_190041 ?auto_190042 ?auto_190043 ?auto_190039 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_190334 - OBJ
      ?auto_190333 - LOCATION
    )
    :vars
    (
      ?auto_190341 - OBJ
      ?auto_190335 - LOCATION
      ?auto_190340 - CITY
      ?auto_190339 - OBJ
      ?auto_190338 - LOCATION
      ?auto_190336 - OBJ
      ?auto_190337 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190334 ?auto_190341 ) ) ( IN-CITY ?auto_190335 ?auto_190340 ) ( IN-CITY ?auto_190333 ?auto_190340 ) ( not ( = ?auto_190333 ?auto_190335 ) ) ( OBJ-AT ?auto_190334 ?auto_190335 ) ( not ( = ?auto_190339 ?auto_190341 ) ) ( not ( = ?auto_190334 ?auto_190339 ) ) ( IN-CITY ?auto_190338 ?auto_190340 ) ( not ( = ?auto_190333 ?auto_190338 ) ) ( not ( = ?auto_190335 ?auto_190338 ) ) ( OBJ-AT ?auto_190339 ?auto_190338 ) ( not ( = ?auto_190336 ?auto_190341 ) ) ( not ( = ?auto_190334 ?auto_190336 ) ) ( not ( = ?auto_190339 ?auto_190336 ) ) ( OBJ-AT ?auto_190336 ?auto_190335 ) ( TRUCK-AT ?auto_190337 ?auto_190333 ) ( IN-TRUCK ?auto_190341 ?auto_190337 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_190341 ?auto_190333 )
      ( DELIVER-2PKG ?auto_190341 ?auto_190334 ?auto_190333 )
      ( DELIVER-1PKG-VERIFY ?auto_190334 ?auto_190333 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_190343 - OBJ
      ?auto_190344 - OBJ
      ?auto_190342 - LOCATION
    )
    :vars
    (
      ?auto_190350 - LOCATION
      ?auto_190345 - CITY
      ?auto_190348 - OBJ
      ?auto_190347 - LOCATION
      ?auto_190346 - OBJ
      ?auto_190349 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190344 ?auto_190343 ) ) ( IN-CITY ?auto_190350 ?auto_190345 ) ( IN-CITY ?auto_190342 ?auto_190345 ) ( not ( = ?auto_190342 ?auto_190350 ) ) ( OBJ-AT ?auto_190344 ?auto_190350 ) ( not ( = ?auto_190348 ?auto_190343 ) ) ( not ( = ?auto_190344 ?auto_190348 ) ) ( IN-CITY ?auto_190347 ?auto_190345 ) ( not ( = ?auto_190342 ?auto_190347 ) ) ( not ( = ?auto_190350 ?auto_190347 ) ) ( OBJ-AT ?auto_190348 ?auto_190347 ) ( not ( = ?auto_190346 ?auto_190343 ) ) ( not ( = ?auto_190344 ?auto_190346 ) ) ( not ( = ?auto_190348 ?auto_190346 ) ) ( OBJ-AT ?auto_190346 ?auto_190350 ) ( TRUCK-AT ?auto_190349 ?auto_190342 ) ( IN-TRUCK ?auto_190343 ?auto_190349 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_190344 ?auto_190342 )
      ( DELIVER-2PKG-VERIFY ?auto_190343 ?auto_190344 ?auto_190342 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_190352 - OBJ
      ?auto_190353 - OBJ
      ?auto_190351 - LOCATION
    )
    :vars
    (
      ?auto_190359 - OBJ
      ?auto_190358 - LOCATION
      ?auto_190354 - CITY
      ?auto_190356 - OBJ
      ?auto_190355 - LOCATION
      ?auto_190357 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190353 ?auto_190352 ) ) ( not ( = ?auto_190353 ?auto_190359 ) ) ( IN-CITY ?auto_190358 ?auto_190354 ) ( IN-CITY ?auto_190351 ?auto_190354 ) ( not ( = ?auto_190351 ?auto_190358 ) ) ( OBJ-AT ?auto_190353 ?auto_190358 ) ( not ( = ?auto_190356 ?auto_190359 ) ) ( not ( = ?auto_190353 ?auto_190356 ) ) ( IN-CITY ?auto_190355 ?auto_190354 ) ( not ( = ?auto_190351 ?auto_190355 ) ) ( not ( = ?auto_190358 ?auto_190355 ) ) ( OBJ-AT ?auto_190356 ?auto_190355 ) ( not ( = ?auto_190352 ?auto_190359 ) ) ( not ( = ?auto_190356 ?auto_190352 ) ) ( OBJ-AT ?auto_190352 ?auto_190358 ) ( TRUCK-AT ?auto_190357 ?auto_190351 ) ( IN-TRUCK ?auto_190359 ?auto_190357 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190359 ?auto_190353 ?auto_190351 )
      ( DELIVER-2PKG-VERIFY ?auto_190352 ?auto_190353 ?auto_190351 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_190361 - OBJ
      ?auto_190362 - OBJ
      ?auto_190360 - LOCATION
    )
    :vars
    (
      ?auto_190368 - OBJ
      ?auto_190366 - LOCATION
      ?auto_190363 - CITY
      ?auto_190364 - LOCATION
      ?auto_190367 - OBJ
      ?auto_190365 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190362 ?auto_190361 ) ) ( not ( = ?auto_190362 ?auto_190368 ) ) ( IN-CITY ?auto_190366 ?auto_190363 ) ( IN-CITY ?auto_190360 ?auto_190363 ) ( not ( = ?auto_190360 ?auto_190366 ) ) ( OBJ-AT ?auto_190362 ?auto_190366 ) ( not ( = ?auto_190361 ?auto_190368 ) ) ( IN-CITY ?auto_190364 ?auto_190363 ) ( not ( = ?auto_190360 ?auto_190364 ) ) ( not ( = ?auto_190366 ?auto_190364 ) ) ( OBJ-AT ?auto_190361 ?auto_190364 ) ( not ( = ?auto_190367 ?auto_190368 ) ) ( not ( = ?auto_190362 ?auto_190367 ) ) ( not ( = ?auto_190361 ?auto_190367 ) ) ( OBJ-AT ?auto_190367 ?auto_190366 ) ( TRUCK-AT ?auto_190365 ?auto_190360 ) ( IN-TRUCK ?auto_190368 ?auto_190365 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190368 ?auto_190362 ?auto_190360 )
      ( DELIVER-2PKG-VERIFY ?auto_190361 ?auto_190362 ?auto_190360 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_190370 - OBJ
      ?auto_190371 - OBJ
      ?auto_190369 - LOCATION
    )
    :vars
    (
      ?auto_190376 - LOCATION
      ?auto_190372 - CITY
      ?auto_190374 - OBJ
      ?auto_190373 - LOCATION
      ?auto_190377 - OBJ
      ?auto_190375 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190371 ?auto_190370 ) ) ( IN-CITY ?auto_190376 ?auto_190372 ) ( IN-CITY ?auto_190369 ?auto_190372 ) ( not ( = ?auto_190369 ?auto_190376 ) ) ( OBJ-AT ?auto_190370 ?auto_190376 ) ( not ( = ?auto_190374 ?auto_190371 ) ) ( not ( = ?auto_190370 ?auto_190374 ) ) ( IN-CITY ?auto_190373 ?auto_190372 ) ( not ( = ?auto_190369 ?auto_190373 ) ) ( not ( = ?auto_190376 ?auto_190373 ) ) ( OBJ-AT ?auto_190374 ?auto_190373 ) ( not ( = ?auto_190377 ?auto_190371 ) ) ( not ( = ?auto_190370 ?auto_190377 ) ) ( not ( = ?auto_190374 ?auto_190377 ) ) ( OBJ-AT ?auto_190377 ?auto_190376 ) ( TRUCK-AT ?auto_190375 ?auto_190369 ) ( IN-TRUCK ?auto_190371 ?auto_190375 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190371 ?auto_190370 ?auto_190369 )
      ( DELIVER-2PKG-VERIFY ?auto_190370 ?auto_190371 ?auto_190369 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_190379 - OBJ
      ?auto_190380 - OBJ
      ?auto_190378 - LOCATION
    )
    :vars
    (
      ?auto_190386 - OBJ
      ?auto_190385 - LOCATION
      ?auto_190381 - CITY
      ?auto_190383 - OBJ
      ?auto_190382 - LOCATION
      ?auto_190384 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190380 ?auto_190379 ) ) ( not ( = ?auto_190379 ?auto_190386 ) ) ( IN-CITY ?auto_190385 ?auto_190381 ) ( IN-CITY ?auto_190378 ?auto_190381 ) ( not ( = ?auto_190378 ?auto_190385 ) ) ( OBJ-AT ?auto_190379 ?auto_190385 ) ( not ( = ?auto_190383 ?auto_190386 ) ) ( not ( = ?auto_190379 ?auto_190383 ) ) ( IN-CITY ?auto_190382 ?auto_190381 ) ( not ( = ?auto_190378 ?auto_190382 ) ) ( not ( = ?auto_190385 ?auto_190382 ) ) ( OBJ-AT ?auto_190383 ?auto_190382 ) ( not ( = ?auto_190380 ?auto_190386 ) ) ( not ( = ?auto_190383 ?auto_190380 ) ) ( OBJ-AT ?auto_190380 ?auto_190385 ) ( TRUCK-AT ?auto_190384 ?auto_190378 ) ( IN-TRUCK ?auto_190386 ?auto_190384 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190386 ?auto_190379 ?auto_190378 )
      ( DELIVER-2PKG-VERIFY ?auto_190379 ?auto_190380 ?auto_190378 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_190388 - OBJ
      ?auto_190389 - OBJ
      ?auto_190387 - LOCATION
    )
    :vars
    (
      ?auto_190395 - OBJ
      ?auto_190393 - LOCATION
      ?auto_190390 - CITY
      ?auto_190391 - LOCATION
      ?auto_190394 - OBJ
      ?auto_190392 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190389 ?auto_190388 ) ) ( not ( = ?auto_190388 ?auto_190395 ) ) ( IN-CITY ?auto_190393 ?auto_190390 ) ( IN-CITY ?auto_190387 ?auto_190390 ) ( not ( = ?auto_190387 ?auto_190393 ) ) ( OBJ-AT ?auto_190388 ?auto_190393 ) ( not ( = ?auto_190389 ?auto_190395 ) ) ( IN-CITY ?auto_190391 ?auto_190390 ) ( not ( = ?auto_190387 ?auto_190391 ) ) ( not ( = ?auto_190393 ?auto_190391 ) ) ( OBJ-AT ?auto_190389 ?auto_190391 ) ( not ( = ?auto_190394 ?auto_190395 ) ) ( not ( = ?auto_190388 ?auto_190394 ) ) ( not ( = ?auto_190389 ?auto_190394 ) ) ( OBJ-AT ?auto_190394 ?auto_190393 ) ( TRUCK-AT ?auto_190392 ?auto_190387 ) ( IN-TRUCK ?auto_190395 ?auto_190392 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190395 ?auto_190388 ?auto_190387 )
      ( DELIVER-2PKG-VERIFY ?auto_190388 ?auto_190389 ?auto_190387 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190417 - OBJ
      ?auto_190418 - OBJ
      ?auto_190419 - OBJ
      ?auto_190416 - LOCATION
    )
    :vars
    (
      ?auto_190424 - LOCATION
      ?auto_190420 - CITY
      ?auto_190422 - OBJ
      ?auto_190421 - LOCATION
      ?auto_190423 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190418 ?auto_190417 ) ) ( not ( = ?auto_190419 ?auto_190417 ) ) ( not ( = ?auto_190419 ?auto_190418 ) ) ( IN-CITY ?auto_190424 ?auto_190420 ) ( IN-CITY ?auto_190416 ?auto_190420 ) ( not ( = ?auto_190416 ?auto_190424 ) ) ( OBJ-AT ?auto_190419 ?auto_190424 ) ( not ( = ?auto_190422 ?auto_190417 ) ) ( not ( = ?auto_190419 ?auto_190422 ) ) ( IN-CITY ?auto_190421 ?auto_190420 ) ( not ( = ?auto_190416 ?auto_190421 ) ) ( not ( = ?auto_190424 ?auto_190421 ) ) ( OBJ-AT ?auto_190422 ?auto_190421 ) ( not ( = ?auto_190422 ?auto_190418 ) ) ( OBJ-AT ?auto_190418 ?auto_190424 ) ( TRUCK-AT ?auto_190423 ?auto_190416 ) ( IN-TRUCK ?auto_190417 ?auto_190423 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190417 ?auto_190419 ?auto_190416 )
      ( DELIVER-3PKG-VERIFY ?auto_190417 ?auto_190418 ?auto_190419 ?auto_190416 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190426 - OBJ
      ?auto_190427 - OBJ
      ?auto_190428 - OBJ
      ?auto_190425 - LOCATION
    )
    :vars
    (
      ?auto_190432 - LOCATION
      ?auto_190429 - CITY
      ?auto_190430 - LOCATION
      ?auto_190433 - OBJ
      ?auto_190431 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190427 ?auto_190426 ) ) ( not ( = ?auto_190428 ?auto_190426 ) ) ( not ( = ?auto_190428 ?auto_190427 ) ) ( IN-CITY ?auto_190432 ?auto_190429 ) ( IN-CITY ?auto_190425 ?auto_190429 ) ( not ( = ?auto_190425 ?auto_190432 ) ) ( OBJ-AT ?auto_190428 ?auto_190432 ) ( IN-CITY ?auto_190430 ?auto_190429 ) ( not ( = ?auto_190425 ?auto_190430 ) ) ( not ( = ?auto_190432 ?auto_190430 ) ) ( OBJ-AT ?auto_190427 ?auto_190430 ) ( not ( = ?auto_190433 ?auto_190426 ) ) ( not ( = ?auto_190428 ?auto_190433 ) ) ( not ( = ?auto_190427 ?auto_190433 ) ) ( OBJ-AT ?auto_190433 ?auto_190432 ) ( TRUCK-AT ?auto_190431 ?auto_190425 ) ( IN-TRUCK ?auto_190426 ?auto_190431 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190426 ?auto_190428 ?auto_190425 )
      ( DELIVER-3PKG-VERIFY ?auto_190426 ?auto_190427 ?auto_190428 ?auto_190425 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190445 - OBJ
      ?auto_190446 - OBJ
      ?auto_190447 - OBJ
      ?auto_190444 - LOCATION
    )
    :vars
    (
      ?auto_190452 - LOCATION
      ?auto_190448 - CITY
      ?auto_190450 - OBJ
      ?auto_190449 - LOCATION
      ?auto_190451 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190446 ?auto_190445 ) ) ( not ( = ?auto_190447 ?auto_190445 ) ) ( not ( = ?auto_190447 ?auto_190446 ) ) ( IN-CITY ?auto_190452 ?auto_190448 ) ( IN-CITY ?auto_190444 ?auto_190448 ) ( not ( = ?auto_190444 ?auto_190452 ) ) ( OBJ-AT ?auto_190446 ?auto_190452 ) ( not ( = ?auto_190450 ?auto_190445 ) ) ( not ( = ?auto_190446 ?auto_190450 ) ) ( IN-CITY ?auto_190449 ?auto_190448 ) ( not ( = ?auto_190444 ?auto_190449 ) ) ( not ( = ?auto_190452 ?auto_190449 ) ) ( OBJ-AT ?auto_190450 ?auto_190449 ) ( not ( = ?auto_190450 ?auto_190447 ) ) ( OBJ-AT ?auto_190447 ?auto_190452 ) ( TRUCK-AT ?auto_190451 ?auto_190444 ) ( IN-TRUCK ?auto_190445 ?auto_190451 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190445 ?auto_190446 ?auto_190444 )
      ( DELIVER-3PKG-VERIFY ?auto_190445 ?auto_190446 ?auto_190447 ?auto_190444 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190454 - OBJ
      ?auto_190455 - OBJ
      ?auto_190456 - OBJ
      ?auto_190453 - LOCATION
    )
    :vars
    (
      ?auto_190460 - LOCATION
      ?auto_190457 - CITY
      ?auto_190458 - LOCATION
      ?auto_190461 - OBJ
      ?auto_190459 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190455 ?auto_190454 ) ) ( not ( = ?auto_190456 ?auto_190454 ) ) ( not ( = ?auto_190456 ?auto_190455 ) ) ( IN-CITY ?auto_190460 ?auto_190457 ) ( IN-CITY ?auto_190453 ?auto_190457 ) ( not ( = ?auto_190453 ?auto_190460 ) ) ( OBJ-AT ?auto_190455 ?auto_190460 ) ( IN-CITY ?auto_190458 ?auto_190457 ) ( not ( = ?auto_190453 ?auto_190458 ) ) ( not ( = ?auto_190460 ?auto_190458 ) ) ( OBJ-AT ?auto_190456 ?auto_190458 ) ( not ( = ?auto_190461 ?auto_190454 ) ) ( not ( = ?auto_190455 ?auto_190461 ) ) ( not ( = ?auto_190456 ?auto_190461 ) ) ( OBJ-AT ?auto_190461 ?auto_190460 ) ( TRUCK-AT ?auto_190459 ?auto_190453 ) ( IN-TRUCK ?auto_190454 ?auto_190459 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190454 ?auto_190455 ?auto_190453 )
      ( DELIVER-3PKG-VERIFY ?auto_190454 ?auto_190455 ?auto_190456 ?auto_190453 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190473 - OBJ
      ?auto_190474 - OBJ
      ?auto_190475 - OBJ
      ?auto_190472 - LOCATION
    )
    :vars
    (
      ?auto_190480 - LOCATION
      ?auto_190476 - CITY
      ?auto_190478 - OBJ
      ?auto_190477 - LOCATION
      ?auto_190479 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190474 ?auto_190473 ) ) ( not ( = ?auto_190475 ?auto_190473 ) ) ( not ( = ?auto_190475 ?auto_190474 ) ) ( IN-CITY ?auto_190480 ?auto_190476 ) ( IN-CITY ?auto_190472 ?auto_190476 ) ( not ( = ?auto_190472 ?auto_190480 ) ) ( OBJ-AT ?auto_190475 ?auto_190480 ) ( not ( = ?auto_190478 ?auto_190474 ) ) ( not ( = ?auto_190475 ?auto_190478 ) ) ( IN-CITY ?auto_190477 ?auto_190476 ) ( not ( = ?auto_190472 ?auto_190477 ) ) ( not ( = ?auto_190480 ?auto_190477 ) ) ( OBJ-AT ?auto_190478 ?auto_190477 ) ( not ( = ?auto_190478 ?auto_190473 ) ) ( OBJ-AT ?auto_190473 ?auto_190480 ) ( TRUCK-AT ?auto_190479 ?auto_190472 ) ( IN-TRUCK ?auto_190474 ?auto_190479 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190474 ?auto_190475 ?auto_190472 )
      ( DELIVER-3PKG-VERIFY ?auto_190473 ?auto_190474 ?auto_190475 ?auto_190472 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190492 - OBJ
      ?auto_190493 - OBJ
      ?auto_190494 - OBJ
      ?auto_190491 - LOCATION
    )
    :vars
    (
      ?auto_190499 - OBJ
      ?auto_190498 - LOCATION
      ?auto_190495 - CITY
      ?auto_190496 - LOCATION
      ?auto_190497 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190493 ?auto_190492 ) ) ( not ( = ?auto_190494 ?auto_190492 ) ) ( not ( = ?auto_190494 ?auto_190493 ) ) ( not ( = ?auto_190494 ?auto_190499 ) ) ( IN-CITY ?auto_190498 ?auto_190495 ) ( IN-CITY ?auto_190491 ?auto_190495 ) ( not ( = ?auto_190491 ?auto_190498 ) ) ( OBJ-AT ?auto_190494 ?auto_190498 ) ( not ( = ?auto_190493 ?auto_190499 ) ) ( IN-CITY ?auto_190496 ?auto_190495 ) ( not ( = ?auto_190491 ?auto_190496 ) ) ( not ( = ?auto_190498 ?auto_190496 ) ) ( OBJ-AT ?auto_190493 ?auto_190496 ) ( not ( = ?auto_190492 ?auto_190499 ) ) ( OBJ-AT ?auto_190492 ?auto_190498 ) ( TRUCK-AT ?auto_190497 ?auto_190491 ) ( IN-TRUCK ?auto_190499 ?auto_190497 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190499 ?auto_190494 ?auto_190491 )
      ( DELIVER-3PKG-VERIFY ?auto_190492 ?auto_190493 ?auto_190494 ?auto_190491 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190501 - OBJ
      ?auto_190502 - OBJ
      ?auto_190503 - OBJ
      ?auto_190500 - LOCATION
    )
    :vars
    (
      ?auto_190508 - LOCATION
      ?auto_190504 - CITY
      ?auto_190506 - OBJ
      ?auto_190505 - LOCATION
      ?auto_190507 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190502 ?auto_190501 ) ) ( not ( = ?auto_190503 ?auto_190501 ) ) ( not ( = ?auto_190503 ?auto_190502 ) ) ( IN-CITY ?auto_190508 ?auto_190504 ) ( IN-CITY ?auto_190500 ?auto_190504 ) ( not ( = ?auto_190500 ?auto_190508 ) ) ( OBJ-AT ?auto_190502 ?auto_190508 ) ( not ( = ?auto_190506 ?auto_190503 ) ) ( not ( = ?auto_190502 ?auto_190506 ) ) ( IN-CITY ?auto_190505 ?auto_190504 ) ( not ( = ?auto_190500 ?auto_190505 ) ) ( not ( = ?auto_190508 ?auto_190505 ) ) ( OBJ-AT ?auto_190506 ?auto_190505 ) ( not ( = ?auto_190506 ?auto_190501 ) ) ( OBJ-AT ?auto_190501 ?auto_190508 ) ( TRUCK-AT ?auto_190507 ?auto_190500 ) ( IN-TRUCK ?auto_190503 ?auto_190507 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190503 ?auto_190502 ?auto_190500 )
      ( DELIVER-3PKG-VERIFY ?auto_190501 ?auto_190502 ?auto_190503 ?auto_190500 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190520 - OBJ
      ?auto_190521 - OBJ
      ?auto_190522 - OBJ
      ?auto_190519 - LOCATION
    )
    :vars
    (
      ?auto_190527 - OBJ
      ?auto_190526 - LOCATION
      ?auto_190523 - CITY
      ?auto_190524 - LOCATION
      ?auto_190525 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190521 ?auto_190520 ) ) ( not ( = ?auto_190522 ?auto_190520 ) ) ( not ( = ?auto_190522 ?auto_190521 ) ) ( not ( = ?auto_190521 ?auto_190527 ) ) ( IN-CITY ?auto_190526 ?auto_190523 ) ( IN-CITY ?auto_190519 ?auto_190523 ) ( not ( = ?auto_190519 ?auto_190526 ) ) ( OBJ-AT ?auto_190521 ?auto_190526 ) ( not ( = ?auto_190522 ?auto_190527 ) ) ( IN-CITY ?auto_190524 ?auto_190523 ) ( not ( = ?auto_190519 ?auto_190524 ) ) ( not ( = ?auto_190526 ?auto_190524 ) ) ( OBJ-AT ?auto_190522 ?auto_190524 ) ( not ( = ?auto_190520 ?auto_190527 ) ) ( OBJ-AT ?auto_190520 ?auto_190526 ) ( TRUCK-AT ?auto_190525 ?auto_190519 ) ( IN-TRUCK ?auto_190527 ?auto_190525 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190527 ?auto_190521 ?auto_190519 )
      ( DELIVER-3PKG-VERIFY ?auto_190520 ?auto_190521 ?auto_190522 ?auto_190519 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190539 - OBJ
      ?auto_190540 - OBJ
      ?auto_190541 - OBJ
      ?auto_190538 - LOCATION
    )
    :vars
    (
      ?auto_190545 - LOCATION
      ?auto_190542 - CITY
      ?auto_190543 - LOCATION
      ?auto_190546 - OBJ
      ?auto_190544 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190540 ?auto_190539 ) ) ( not ( = ?auto_190541 ?auto_190539 ) ) ( not ( = ?auto_190541 ?auto_190540 ) ) ( IN-CITY ?auto_190545 ?auto_190542 ) ( IN-CITY ?auto_190538 ?auto_190542 ) ( not ( = ?auto_190538 ?auto_190545 ) ) ( OBJ-AT ?auto_190541 ?auto_190545 ) ( IN-CITY ?auto_190543 ?auto_190542 ) ( not ( = ?auto_190538 ?auto_190543 ) ) ( not ( = ?auto_190545 ?auto_190543 ) ) ( OBJ-AT ?auto_190539 ?auto_190543 ) ( not ( = ?auto_190546 ?auto_190540 ) ) ( not ( = ?auto_190541 ?auto_190546 ) ) ( not ( = ?auto_190539 ?auto_190546 ) ) ( OBJ-AT ?auto_190546 ?auto_190545 ) ( TRUCK-AT ?auto_190544 ?auto_190538 ) ( IN-TRUCK ?auto_190540 ?auto_190544 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190540 ?auto_190541 ?auto_190538 )
      ( DELIVER-3PKG-VERIFY ?auto_190539 ?auto_190540 ?auto_190541 ?auto_190538 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190548 - OBJ
      ?auto_190549 - OBJ
      ?auto_190550 - OBJ
      ?auto_190547 - LOCATION
    )
    :vars
    (
      ?auto_190555 - OBJ
      ?auto_190554 - LOCATION
      ?auto_190551 - CITY
      ?auto_190552 - LOCATION
      ?auto_190553 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190549 ?auto_190548 ) ) ( not ( = ?auto_190550 ?auto_190548 ) ) ( not ( = ?auto_190550 ?auto_190549 ) ) ( not ( = ?auto_190550 ?auto_190555 ) ) ( IN-CITY ?auto_190554 ?auto_190551 ) ( IN-CITY ?auto_190547 ?auto_190551 ) ( not ( = ?auto_190547 ?auto_190554 ) ) ( OBJ-AT ?auto_190550 ?auto_190554 ) ( not ( = ?auto_190548 ?auto_190555 ) ) ( IN-CITY ?auto_190552 ?auto_190551 ) ( not ( = ?auto_190547 ?auto_190552 ) ) ( not ( = ?auto_190554 ?auto_190552 ) ) ( OBJ-AT ?auto_190548 ?auto_190552 ) ( not ( = ?auto_190549 ?auto_190555 ) ) ( OBJ-AT ?auto_190549 ?auto_190554 ) ( TRUCK-AT ?auto_190553 ?auto_190547 ) ( IN-TRUCK ?auto_190555 ?auto_190553 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190555 ?auto_190550 ?auto_190547 )
      ( DELIVER-3PKG-VERIFY ?auto_190548 ?auto_190549 ?auto_190550 ?auto_190547 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190567 - OBJ
      ?auto_190568 - OBJ
      ?auto_190569 - OBJ
      ?auto_190566 - LOCATION
    )
    :vars
    (
      ?auto_190573 - LOCATION
      ?auto_190570 - CITY
      ?auto_190571 - LOCATION
      ?auto_190574 - OBJ
      ?auto_190572 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190568 ?auto_190567 ) ) ( not ( = ?auto_190569 ?auto_190567 ) ) ( not ( = ?auto_190569 ?auto_190568 ) ) ( IN-CITY ?auto_190573 ?auto_190570 ) ( IN-CITY ?auto_190566 ?auto_190570 ) ( not ( = ?auto_190566 ?auto_190573 ) ) ( OBJ-AT ?auto_190568 ?auto_190573 ) ( IN-CITY ?auto_190571 ?auto_190570 ) ( not ( = ?auto_190566 ?auto_190571 ) ) ( not ( = ?auto_190573 ?auto_190571 ) ) ( OBJ-AT ?auto_190567 ?auto_190571 ) ( not ( = ?auto_190574 ?auto_190569 ) ) ( not ( = ?auto_190568 ?auto_190574 ) ) ( not ( = ?auto_190567 ?auto_190574 ) ) ( OBJ-AT ?auto_190574 ?auto_190573 ) ( TRUCK-AT ?auto_190572 ?auto_190566 ) ( IN-TRUCK ?auto_190569 ?auto_190572 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190569 ?auto_190568 ?auto_190566 )
      ( DELIVER-3PKG-VERIFY ?auto_190567 ?auto_190568 ?auto_190569 ?auto_190566 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190576 - OBJ
      ?auto_190577 - OBJ
      ?auto_190578 - OBJ
      ?auto_190575 - LOCATION
    )
    :vars
    (
      ?auto_190583 - OBJ
      ?auto_190582 - LOCATION
      ?auto_190579 - CITY
      ?auto_190580 - LOCATION
      ?auto_190581 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190577 ?auto_190576 ) ) ( not ( = ?auto_190578 ?auto_190576 ) ) ( not ( = ?auto_190578 ?auto_190577 ) ) ( not ( = ?auto_190577 ?auto_190583 ) ) ( IN-CITY ?auto_190582 ?auto_190579 ) ( IN-CITY ?auto_190575 ?auto_190579 ) ( not ( = ?auto_190575 ?auto_190582 ) ) ( OBJ-AT ?auto_190577 ?auto_190582 ) ( not ( = ?auto_190576 ?auto_190583 ) ) ( IN-CITY ?auto_190580 ?auto_190579 ) ( not ( = ?auto_190575 ?auto_190580 ) ) ( not ( = ?auto_190582 ?auto_190580 ) ) ( OBJ-AT ?auto_190576 ?auto_190580 ) ( not ( = ?auto_190578 ?auto_190583 ) ) ( OBJ-AT ?auto_190578 ?auto_190582 ) ( TRUCK-AT ?auto_190581 ?auto_190575 ) ( IN-TRUCK ?auto_190583 ?auto_190581 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190583 ?auto_190577 ?auto_190575 )
      ( DELIVER-3PKG-VERIFY ?auto_190576 ?auto_190577 ?auto_190578 ?auto_190575 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190615 - OBJ
      ?auto_190616 - OBJ
      ?auto_190617 - OBJ
      ?auto_190614 - LOCATION
    )
    :vars
    (
      ?auto_190622 - LOCATION
      ?auto_190618 - CITY
      ?auto_190620 - OBJ
      ?auto_190619 - LOCATION
      ?auto_190621 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190616 ?auto_190615 ) ) ( not ( = ?auto_190617 ?auto_190615 ) ) ( not ( = ?auto_190617 ?auto_190616 ) ) ( IN-CITY ?auto_190622 ?auto_190618 ) ( IN-CITY ?auto_190614 ?auto_190618 ) ( not ( = ?auto_190614 ?auto_190622 ) ) ( OBJ-AT ?auto_190615 ?auto_190622 ) ( not ( = ?auto_190620 ?auto_190616 ) ) ( not ( = ?auto_190615 ?auto_190620 ) ) ( IN-CITY ?auto_190619 ?auto_190618 ) ( not ( = ?auto_190614 ?auto_190619 ) ) ( not ( = ?auto_190622 ?auto_190619 ) ) ( OBJ-AT ?auto_190620 ?auto_190619 ) ( not ( = ?auto_190620 ?auto_190617 ) ) ( OBJ-AT ?auto_190617 ?auto_190622 ) ( TRUCK-AT ?auto_190621 ?auto_190614 ) ( IN-TRUCK ?auto_190616 ?auto_190621 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190616 ?auto_190615 ?auto_190614 )
      ( DELIVER-3PKG-VERIFY ?auto_190615 ?auto_190616 ?auto_190617 ?auto_190614 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190624 - OBJ
      ?auto_190625 - OBJ
      ?auto_190626 - OBJ
      ?auto_190623 - LOCATION
    )
    :vars
    (
      ?auto_190630 - LOCATION
      ?auto_190627 - CITY
      ?auto_190628 - LOCATION
      ?auto_190631 - OBJ
      ?auto_190629 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190625 ?auto_190624 ) ) ( not ( = ?auto_190626 ?auto_190624 ) ) ( not ( = ?auto_190626 ?auto_190625 ) ) ( IN-CITY ?auto_190630 ?auto_190627 ) ( IN-CITY ?auto_190623 ?auto_190627 ) ( not ( = ?auto_190623 ?auto_190630 ) ) ( OBJ-AT ?auto_190624 ?auto_190630 ) ( IN-CITY ?auto_190628 ?auto_190627 ) ( not ( = ?auto_190623 ?auto_190628 ) ) ( not ( = ?auto_190630 ?auto_190628 ) ) ( OBJ-AT ?auto_190626 ?auto_190628 ) ( not ( = ?auto_190631 ?auto_190625 ) ) ( not ( = ?auto_190624 ?auto_190631 ) ) ( not ( = ?auto_190626 ?auto_190631 ) ) ( OBJ-AT ?auto_190631 ?auto_190630 ) ( TRUCK-AT ?auto_190629 ?auto_190623 ) ( IN-TRUCK ?auto_190625 ?auto_190629 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190625 ?auto_190624 ?auto_190623 )
      ( DELIVER-3PKG-VERIFY ?auto_190624 ?auto_190625 ?auto_190626 ?auto_190623 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190643 - OBJ
      ?auto_190644 - OBJ
      ?auto_190645 - OBJ
      ?auto_190642 - LOCATION
    )
    :vars
    (
      ?auto_190650 - LOCATION
      ?auto_190646 - CITY
      ?auto_190648 - OBJ
      ?auto_190647 - LOCATION
      ?auto_190649 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190644 ?auto_190643 ) ) ( not ( = ?auto_190645 ?auto_190643 ) ) ( not ( = ?auto_190645 ?auto_190644 ) ) ( IN-CITY ?auto_190650 ?auto_190646 ) ( IN-CITY ?auto_190642 ?auto_190646 ) ( not ( = ?auto_190642 ?auto_190650 ) ) ( OBJ-AT ?auto_190643 ?auto_190650 ) ( not ( = ?auto_190648 ?auto_190645 ) ) ( not ( = ?auto_190643 ?auto_190648 ) ) ( IN-CITY ?auto_190647 ?auto_190646 ) ( not ( = ?auto_190642 ?auto_190647 ) ) ( not ( = ?auto_190650 ?auto_190647 ) ) ( OBJ-AT ?auto_190648 ?auto_190647 ) ( not ( = ?auto_190648 ?auto_190644 ) ) ( OBJ-AT ?auto_190644 ?auto_190650 ) ( TRUCK-AT ?auto_190649 ?auto_190642 ) ( IN-TRUCK ?auto_190645 ?auto_190649 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190645 ?auto_190643 ?auto_190642 )
      ( DELIVER-3PKG-VERIFY ?auto_190643 ?auto_190644 ?auto_190645 ?auto_190642 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190662 - OBJ
      ?auto_190663 - OBJ
      ?auto_190664 - OBJ
      ?auto_190661 - LOCATION
    )
    :vars
    (
      ?auto_190669 - OBJ
      ?auto_190668 - LOCATION
      ?auto_190665 - CITY
      ?auto_190666 - LOCATION
      ?auto_190667 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190663 ?auto_190662 ) ) ( not ( = ?auto_190664 ?auto_190662 ) ) ( not ( = ?auto_190664 ?auto_190663 ) ) ( not ( = ?auto_190662 ?auto_190669 ) ) ( IN-CITY ?auto_190668 ?auto_190665 ) ( IN-CITY ?auto_190661 ?auto_190665 ) ( not ( = ?auto_190661 ?auto_190668 ) ) ( OBJ-AT ?auto_190662 ?auto_190668 ) ( not ( = ?auto_190664 ?auto_190669 ) ) ( IN-CITY ?auto_190666 ?auto_190665 ) ( not ( = ?auto_190661 ?auto_190666 ) ) ( not ( = ?auto_190668 ?auto_190666 ) ) ( OBJ-AT ?auto_190664 ?auto_190666 ) ( not ( = ?auto_190663 ?auto_190669 ) ) ( OBJ-AT ?auto_190663 ?auto_190668 ) ( TRUCK-AT ?auto_190667 ?auto_190661 ) ( IN-TRUCK ?auto_190669 ?auto_190667 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190669 ?auto_190662 ?auto_190661 )
      ( DELIVER-3PKG-VERIFY ?auto_190662 ?auto_190663 ?auto_190664 ?auto_190661 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190681 - OBJ
      ?auto_190682 - OBJ
      ?auto_190683 - OBJ
      ?auto_190680 - LOCATION
    )
    :vars
    (
      ?auto_190687 - LOCATION
      ?auto_190684 - CITY
      ?auto_190685 - LOCATION
      ?auto_190688 - OBJ
      ?auto_190686 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190682 ?auto_190681 ) ) ( not ( = ?auto_190683 ?auto_190681 ) ) ( not ( = ?auto_190683 ?auto_190682 ) ) ( IN-CITY ?auto_190687 ?auto_190684 ) ( IN-CITY ?auto_190680 ?auto_190684 ) ( not ( = ?auto_190680 ?auto_190687 ) ) ( OBJ-AT ?auto_190681 ?auto_190687 ) ( IN-CITY ?auto_190685 ?auto_190684 ) ( not ( = ?auto_190680 ?auto_190685 ) ) ( not ( = ?auto_190687 ?auto_190685 ) ) ( OBJ-AT ?auto_190682 ?auto_190685 ) ( not ( = ?auto_190688 ?auto_190683 ) ) ( not ( = ?auto_190681 ?auto_190688 ) ) ( not ( = ?auto_190682 ?auto_190688 ) ) ( OBJ-AT ?auto_190688 ?auto_190687 ) ( TRUCK-AT ?auto_190686 ?auto_190680 ) ( IN-TRUCK ?auto_190683 ?auto_190686 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190683 ?auto_190681 ?auto_190680 )
      ( DELIVER-3PKG-VERIFY ?auto_190681 ?auto_190682 ?auto_190683 ?auto_190680 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190690 - OBJ
      ?auto_190691 - OBJ
      ?auto_190692 - OBJ
      ?auto_190689 - LOCATION
    )
    :vars
    (
      ?auto_190697 - OBJ
      ?auto_190696 - LOCATION
      ?auto_190693 - CITY
      ?auto_190694 - LOCATION
      ?auto_190695 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190691 ?auto_190690 ) ) ( not ( = ?auto_190692 ?auto_190690 ) ) ( not ( = ?auto_190692 ?auto_190691 ) ) ( not ( = ?auto_190690 ?auto_190697 ) ) ( IN-CITY ?auto_190696 ?auto_190693 ) ( IN-CITY ?auto_190689 ?auto_190693 ) ( not ( = ?auto_190689 ?auto_190696 ) ) ( OBJ-AT ?auto_190690 ?auto_190696 ) ( not ( = ?auto_190691 ?auto_190697 ) ) ( IN-CITY ?auto_190694 ?auto_190693 ) ( not ( = ?auto_190689 ?auto_190694 ) ) ( not ( = ?auto_190696 ?auto_190694 ) ) ( OBJ-AT ?auto_190691 ?auto_190694 ) ( not ( = ?auto_190692 ?auto_190697 ) ) ( OBJ-AT ?auto_190692 ?auto_190696 ) ( TRUCK-AT ?auto_190695 ?auto_190689 ) ( IN-TRUCK ?auto_190697 ?auto_190695 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190697 ?auto_190690 ?auto_190689 )
      ( DELIVER-3PKG-VERIFY ?auto_190690 ?auto_190691 ?auto_190692 ?auto_190689 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_190853 - OBJ
      ?auto_190854 - OBJ
      ?auto_190855 - OBJ
      ?auto_190856 - OBJ
      ?auto_190852 - LOCATION
    )
    :vars
    (
      ?auto_190860 - LOCATION
      ?auto_190857 - CITY
      ?auto_190858 - LOCATION
      ?auto_190859 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190854 ?auto_190853 ) ) ( not ( = ?auto_190855 ?auto_190853 ) ) ( not ( = ?auto_190855 ?auto_190854 ) ) ( not ( = ?auto_190856 ?auto_190853 ) ) ( not ( = ?auto_190856 ?auto_190854 ) ) ( not ( = ?auto_190856 ?auto_190855 ) ) ( IN-CITY ?auto_190860 ?auto_190857 ) ( IN-CITY ?auto_190852 ?auto_190857 ) ( not ( = ?auto_190852 ?auto_190860 ) ) ( OBJ-AT ?auto_190856 ?auto_190860 ) ( IN-CITY ?auto_190858 ?auto_190857 ) ( not ( = ?auto_190852 ?auto_190858 ) ) ( not ( = ?auto_190860 ?auto_190858 ) ) ( OBJ-AT ?auto_190855 ?auto_190858 ) ( OBJ-AT ?auto_190854 ?auto_190860 ) ( TRUCK-AT ?auto_190859 ?auto_190852 ) ( IN-TRUCK ?auto_190853 ?auto_190859 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190853 ?auto_190856 ?auto_190852 )
      ( DELIVER-4PKG-VERIFY ?auto_190853 ?auto_190854 ?auto_190855 ?auto_190856 ?auto_190852 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_190882 - OBJ
      ?auto_190883 - OBJ
      ?auto_190884 - OBJ
      ?auto_190885 - OBJ
      ?auto_190881 - LOCATION
    )
    :vars
    (
      ?auto_190889 - LOCATION
      ?auto_190886 - CITY
      ?auto_190887 - LOCATION
      ?auto_190888 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190883 ?auto_190882 ) ) ( not ( = ?auto_190884 ?auto_190882 ) ) ( not ( = ?auto_190884 ?auto_190883 ) ) ( not ( = ?auto_190885 ?auto_190882 ) ) ( not ( = ?auto_190885 ?auto_190883 ) ) ( not ( = ?auto_190885 ?auto_190884 ) ) ( IN-CITY ?auto_190889 ?auto_190886 ) ( IN-CITY ?auto_190881 ?auto_190886 ) ( not ( = ?auto_190881 ?auto_190889 ) ) ( OBJ-AT ?auto_190884 ?auto_190889 ) ( IN-CITY ?auto_190887 ?auto_190886 ) ( not ( = ?auto_190881 ?auto_190887 ) ) ( not ( = ?auto_190889 ?auto_190887 ) ) ( OBJ-AT ?auto_190885 ?auto_190887 ) ( OBJ-AT ?auto_190883 ?auto_190889 ) ( TRUCK-AT ?auto_190888 ?auto_190881 ) ( IN-TRUCK ?auto_190882 ?auto_190888 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190882 ?auto_190884 ?auto_190881 )
      ( DELIVER-4PKG-VERIFY ?auto_190882 ?auto_190883 ?auto_190884 ?auto_190885 ?auto_190881 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_190911 - OBJ
      ?auto_190912 - OBJ
      ?auto_190913 - OBJ
      ?auto_190914 - OBJ
      ?auto_190910 - LOCATION
    )
    :vars
    (
      ?auto_190918 - LOCATION
      ?auto_190915 - CITY
      ?auto_190916 - LOCATION
      ?auto_190917 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190912 ?auto_190911 ) ) ( not ( = ?auto_190913 ?auto_190911 ) ) ( not ( = ?auto_190913 ?auto_190912 ) ) ( not ( = ?auto_190914 ?auto_190911 ) ) ( not ( = ?auto_190914 ?auto_190912 ) ) ( not ( = ?auto_190914 ?auto_190913 ) ) ( IN-CITY ?auto_190918 ?auto_190915 ) ( IN-CITY ?auto_190910 ?auto_190915 ) ( not ( = ?auto_190910 ?auto_190918 ) ) ( OBJ-AT ?auto_190914 ?auto_190918 ) ( IN-CITY ?auto_190916 ?auto_190915 ) ( not ( = ?auto_190910 ?auto_190916 ) ) ( not ( = ?auto_190918 ?auto_190916 ) ) ( OBJ-AT ?auto_190912 ?auto_190916 ) ( OBJ-AT ?auto_190913 ?auto_190918 ) ( TRUCK-AT ?auto_190917 ?auto_190910 ) ( IN-TRUCK ?auto_190911 ?auto_190917 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190911 ?auto_190914 ?auto_190910 )
      ( DELIVER-4PKG-VERIFY ?auto_190911 ?auto_190912 ?auto_190913 ?auto_190914 ?auto_190910 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_190940 - OBJ
      ?auto_190941 - OBJ
      ?auto_190942 - OBJ
      ?auto_190943 - OBJ
      ?auto_190939 - LOCATION
    )
    :vars
    (
      ?auto_190947 - LOCATION
      ?auto_190944 - CITY
      ?auto_190945 - LOCATION
      ?auto_190946 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_190941 ?auto_190940 ) ) ( not ( = ?auto_190942 ?auto_190940 ) ) ( not ( = ?auto_190942 ?auto_190941 ) ) ( not ( = ?auto_190943 ?auto_190940 ) ) ( not ( = ?auto_190943 ?auto_190941 ) ) ( not ( = ?auto_190943 ?auto_190942 ) ) ( IN-CITY ?auto_190947 ?auto_190944 ) ( IN-CITY ?auto_190939 ?auto_190944 ) ( not ( = ?auto_190939 ?auto_190947 ) ) ( OBJ-AT ?auto_190942 ?auto_190947 ) ( IN-CITY ?auto_190945 ?auto_190944 ) ( not ( = ?auto_190939 ?auto_190945 ) ) ( not ( = ?auto_190947 ?auto_190945 ) ) ( OBJ-AT ?auto_190941 ?auto_190945 ) ( OBJ-AT ?auto_190943 ?auto_190947 ) ( TRUCK-AT ?auto_190946 ?auto_190939 ) ( IN-TRUCK ?auto_190940 ?auto_190946 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190940 ?auto_190942 ?auto_190939 )
      ( DELIVER-4PKG-VERIFY ?auto_190940 ?auto_190941 ?auto_190942 ?auto_190943 ?auto_190939 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191031 - OBJ
      ?auto_191032 - OBJ
      ?auto_191033 - OBJ
      ?auto_191034 - OBJ
      ?auto_191030 - LOCATION
    )
    :vars
    (
      ?auto_191038 - LOCATION
      ?auto_191035 - CITY
      ?auto_191036 - LOCATION
      ?auto_191037 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_191032 ?auto_191031 ) ) ( not ( = ?auto_191033 ?auto_191031 ) ) ( not ( = ?auto_191033 ?auto_191032 ) ) ( not ( = ?auto_191034 ?auto_191031 ) ) ( not ( = ?auto_191034 ?auto_191032 ) ) ( not ( = ?auto_191034 ?auto_191033 ) ) ( IN-CITY ?auto_191038 ?auto_191035 ) ( IN-CITY ?auto_191030 ?auto_191035 ) ( not ( = ?auto_191030 ?auto_191038 ) ) ( OBJ-AT ?auto_191032 ?auto_191038 ) ( IN-CITY ?auto_191036 ?auto_191035 ) ( not ( = ?auto_191030 ?auto_191036 ) ) ( not ( = ?auto_191038 ?auto_191036 ) ) ( OBJ-AT ?auto_191034 ?auto_191036 ) ( OBJ-AT ?auto_191033 ?auto_191038 ) ( TRUCK-AT ?auto_191037 ?auto_191030 ) ( IN-TRUCK ?auto_191031 ?auto_191037 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191031 ?auto_191032 ?auto_191030 )
      ( DELIVER-4PKG-VERIFY ?auto_191031 ?auto_191032 ?auto_191033 ?auto_191034 ?auto_191030 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191060 - OBJ
      ?auto_191061 - OBJ
      ?auto_191062 - OBJ
      ?auto_191063 - OBJ
      ?auto_191059 - LOCATION
    )
    :vars
    (
      ?auto_191067 - LOCATION
      ?auto_191064 - CITY
      ?auto_191065 - LOCATION
      ?auto_191066 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_191061 ?auto_191060 ) ) ( not ( = ?auto_191062 ?auto_191060 ) ) ( not ( = ?auto_191062 ?auto_191061 ) ) ( not ( = ?auto_191063 ?auto_191060 ) ) ( not ( = ?auto_191063 ?auto_191061 ) ) ( not ( = ?auto_191063 ?auto_191062 ) ) ( IN-CITY ?auto_191067 ?auto_191064 ) ( IN-CITY ?auto_191059 ?auto_191064 ) ( not ( = ?auto_191059 ?auto_191067 ) ) ( OBJ-AT ?auto_191061 ?auto_191067 ) ( IN-CITY ?auto_191065 ?auto_191064 ) ( not ( = ?auto_191059 ?auto_191065 ) ) ( not ( = ?auto_191067 ?auto_191065 ) ) ( OBJ-AT ?auto_191062 ?auto_191065 ) ( OBJ-AT ?auto_191063 ?auto_191067 ) ( TRUCK-AT ?auto_191066 ?auto_191059 ) ( IN-TRUCK ?auto_191060 ?auto_191066 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191060 ?auto_191061 ?auto_191059 )
      ( DELIVER-4PKG-VERIFY ?auto_191060 ?auto_191061 ?auto_191062 ?auto_191063 ?auto_191059 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191151 - OBJ
      ?auto_191152 - OBJ
      ?auto_191153 - OBJ
      ?auto_191154 - OBJ
      ?auto_191150 - LOCATION
    )
    :vars
    (
      ?auto_191158 - LOCATION
      ?auto_191155 - CITY
      ?auto_191156 - LOCATION
      ?auto_191157 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_191152 ?auto_191151 ) ) ( not ( = ?auto_191153 ?auto_191151 ) ) ( not ( = ?auto_191153 ?auto_191152 ) ) ( not ( = ?auto_191154 ?auto_191151 ) ) ( not ( = ?auto_191154 ?auto_191152 ) ) ( not ( = ?auto_191154 ?auto_191153 ) ) ( IN-CITY ?auto_191158 ?auto_191155 ) ( IN-CITY ?auto_191150 ?auto_191155 ) ( not ( = ?auto_191150 ?auto_191158 ) ) ( OBJ-AT ?auto_191154 ?auto_191158 ) ( IN-CITY ?auto_191156 ?auto_191155 ) ( not ( = ?auto_191150 ?auto_191156 ) ) ( not ( = ?auto_191158 ?auto_191156 ) ) ( OBJ-AT ?auto_191153 ?auto_191156 ) ( OBJ-AT ?auto_191151 ?auto_191158 ) ( TRUCK-AT ?auto_191157 ?auto_191150 ) ( IN-TRUCK ?auto_191152 ?auto_191157 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191152 ?auto_191154 ?auto_191150 )
      ( DELIVER-4PKG-VERIFY ?auto_191151 ?auto_191152 ?auto_191153 ?auto_191154 ?auto_191150 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191180 - OBJ
      ?auto_191181 - OBJ
      ?auto_191182 - OBJ
      ?auto_191183 - OBJ
      ?auto_191179 - LOCATION
    )
    :vars
    (
      ?auto_191187 - LOCATION
      ?auto_191184 - CITY
      ?auto_191185 - LOCATION
      ?auto_191186 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_191181 ?auto_191180 ) ) ( not ( = ?auto_191182 ?auto_191180 ) ) ( not ( = ?auto_191182 ?auto_191181 ) ) ( not ( = ?auto_191183 ?auto_191180 ) ) ( not ( = ?auto_191183 ?auto_191181 ) ) ( not ( = ?auto_191183 ?auto_191182 ) ) ( IN-CITY ?auto_191187 ?auto_191184 ) ( IN-CITY ?auto_191179 ?auto_191184 ) ( not ( = ?auto_191179 ?auto_191187 ) ) ( OBJ-AT ?auto_191182 ?auto_191187 ) ( IN-CITY ?auto_191185 ?auto_191184 ) ( not ( = ?auto_191179 ?auto_191185 ) ) ( not ( = ?auto_191187 ?auto_191185 ) ) ( OBJ-AT ?auto_191183 ?auto_191185 ) ( OBJ-AT ?auto_191180 ?auto_191187 ) ( TRUCK-AT ?auto_191186 ?auto_191179 ) ( IN-TRUCK ?auto_191181 ?auto_191186 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191181 ?auto_191182 ?auto_191179 )
      ( DELIVER-4PKG-VERIFY ?auto_191180 ?auto_191181 ?auto_191182 ?auto_191183 ?auto_191179 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191272 - OBJ
      ?auto_191273 - OBJ
      ?auto_191274 - OBJ
      ?auto_191275 - OBJ
      ?auto_191271 - LOCATION
    )
    :vars
    (
      ?auto_191279 - LOCATION
      ?auto_191276 - CITY
      ?auto_191277 - LOCATION
      ?auto_191278 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_191273 ?auto_191272 ) ) ( not ( = ?auto_191274 ?auto_191272 ) ) ( not ( = ?auto_191274 ?auto_191273 ) ) ( not ( = ?auto_191275 ?auto_191272 ) ) ( not ( = ?auto_191275 ?auto_191273 ) ) ( not ( = ?auto_191275 ?auto_191274 ) ) ( IN-CITY ?auto_191279 ?auto_191276 ) ( IN-CITY ?auto_191271 ?auto_191276 ) ( not ( = ?auto_191271 ?auto_191279 ) ) ( OBJ-AT ?auto_191275 ?auto_191279 ) ( IN-CITY ?auto_191277 ?auto_191276 ) ( not ( = ?auto_191271 ?auto_191277 ) ) ( not ( = ?auto_191279 ?auto_191277 ) ) ( OBJ-AT ?auto_191273 ?auto_191277 ) ( OBJ-AT ?auto_191272 ?auto_191279 ) ( TRUCK-AT ?auto_191278 ?auto_191271 ) ( IN-TRUCK ?auto_191274 ?auto_191278 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191274 ?auto_191275 ?auto_191271 )
      ( DELIVER-4PKG-VERIFY ?auto_191272 ?auto_191273 ?auto_191274 ?auto_191275 ?auto_191271 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191301 - OBJ
      ?auto_191302 - OBJ
      ?auto_191303 - OBJ
      ?auto_191304 - OBJ
      ?auto_191300 - LOCATION
    )
    :vars
    (
      ?auto_191308 - LOCATION
      ?auto_191305 - CITY
      ?auto_191306 - LOCATION
      ?auto_191307 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_191302 ?auto_191301 ) ) ( not ( = ?auto_191303 ?auto_191301 ) ) ( not ( = ?auto_191303 ?auto_191302 ) ) ( not ( = ?auto_191304 ?auto_191301 ) ) ( not ( = ?auto_191304 ?auto_191302 ) ) ( not ( = ?auto_191304 ?auto_191303 ) ) ( IN-CITY ?auto_191308 ?auto_191305 ) ( IN-CITY ?auto_191300 ?auto_191305 ) ( not ( = ?auto_191300 ?auto_191308 ) ) ( OBJ-AT ?auto_191303 ?auto_191308 ) ( IN-CITY ?auto_191306 ?auto_191305 ) ( not ( = ?auto_191300 ?auto_191306 ) ) ( not ( = ?auto_191308 ?auto_191306 ) ) ( OBJ-AT ?auto_191302 ?auto_191306 ) ( OBJ-AT ?auto_191301 ?auto_191308 ) ( TRUCK-AT ?auto_191307 ?auto_191300 ) ( IN-TRUCK ?auto_191304 ?auto_191307 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191304 ?auto_191303 ?auto_191300 )
      ( DELIVER-4PKG-VERIFY ?auto_191301 ?auto_191302 ?auto_191303 ?auto_191304 ?auto_191300 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191360 - OBJ
      ?auto_191361 - OBJ
      ?auto_191362 - OBJ
      ?auto_191363 - OBJ
      ?auto_191359 - LOCATION
    )
    :vars
    (
      ?auto_191367 - LOCATION
      ?auto_191364 - CITY
      ?auto_191365 - LOCATION
      ?auto_191366 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_191361 ?auto_191360 ) ) ( not ( = ?auto_191362 ?auto_191360 ) ) ( not ( = ?auto_191362 ?auto_191361 ) ) ( not ( = ?auto_191363 ?auto_191360 ) ) ( not ( = ?auto_191363 ?auto_191361 ) ) ( not ( = ?auto_191363 ?auto_191362 ) ) ( IN-CITY ?auto_191367 ?auto_191364 ) ( IN-CITY ?auto_191359 ?auto_191364 ) ( not ( = ?auto_191359 ?auto_191367 ) ) ( OBJ-AT ?auto_191361 ?auto_191367 ) ( IN-CITY ?auto_191365 ?auto_191364 ) ( not ( = ?auto_191359 ?auto_191365 ) ) ( not ( = ?auto_191367 ?auto_191365 ) ) ( OBJ-AT ?auto_191363 ?auto_191365 ) ( OBJ-AT ?auto_191360 ?auto_191367 ) ( TRUCK-AT ?auto_191366 ?auto_191359 ) ( IN-TRUCK ?auto_191362 ?auto_191366 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191362 ?auto_191361 ?auto_191359 )
      ( DELIVER-4PKG-VERIFY ?auto_191360 ?auto_191361 ?auto_191362 ?auto_191363 ?auto_191359 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191421 - OBJ
      ?auto_191422 - OBJ
      ?auto_191423 - OBJ
      ?auto_191424 - OBJ
      ?auto_191420 - LOCATION
    )
    :vars
    (
      ?auto_191428 - LOCATION
      ?auto_191425 - CITY
      ?auto_191426 - LOCATION
      ?auto_191427 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_191422 ?auto_191421 ) ) ( not ( = ?auto_191423 ?auto_191421 ) ) ( not ( = ?auto_191423 ?auto_191422 ) ) ( not ( = ?auto_191424 ?auto_191421 ) ) ( not ( = ?auto_191424 ?auto_191422 ) ) ( not ( = ?auto_191424 ?auto_191423 ) ) ( IN-CITY ?auto_191428 ?auto_191425 ) ( IN-CITY ?auto_191420 ?auto_191425 ) ( not ( = ?auto_191420 ?auto_191428 ) ) ( OBJ-AT ?auto_191422 ?auto_191428 ) ( IN-CITY ?auto_191426 ?auto_191425 ) ( not ( = ?auto_191420 ?auto_191426 ) ) ( not ( = ?auto_191428 ?auto_191426 ) ) ( OBJ-AT ?auto_191423 ?auto_191426 ) ( OBJ-AT ?auto_191421 ?auto_191428 ) ( TRUCK-AT ?auto_191427 ?auto_191420 ) ( IN-TRUCK ?auto_191424 ?auto_191427 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191424 ?auto_191422 ?auto_191420 )
      ( DELIVER-4PKG-VERIFY ?auto_191421 ?auto_191422 ?auto_191423 ?auto_191424 ?auto_191420 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191512 - OBJ
      ?auto_191513 - OBJ
      ?auto_191514 - OBJ
      ?auto_191515 - OBJ
      ?auto_191511 - LOCATION
    )
    :vars
    (
      ?auto_191519 - LOCATION
      ?auto_191516 - CITY
      ?auto_191517 - LOCATION
      ?auto_191518 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_191513 ?auto_191512 ) ) ( not ( = ?auto_191514 ?auto_191512 ) ) ( not ( = ?auto_191514 ?auto_191513 ) ) ( not ( = ?auto_191515 ?auto_191512 ) ) ( not ( = ?auto_191515 ?auto_191513 ) ) ( not ( = ?auto_191515 ?auto_191514 ) ) ( IN-CITY ?auto_191519 ?auto_191516 ) ( IN-CITY ?auto_191511 ?auto_191516 ) ( not ( = ?auto_191511 ?auto_191519 ) ) ( OBJ-AT ?auto_191515 ?auto_191519 ) ( IN-CITY ?auto_191517 ?auto_191516 ) ( not ( = ?auto_191511 ?auto_191517 ) ) ( not ( = ?auto_191519 ?auto_191517 ) ) ( OBJ-AT ?auto_191512 ?auto_191517 ) ( OBJ-AT ?auto_191514 ?auto_191519 ) ( TRUCK-AT ?auto_191518 ?auto_191511 ) ( IN-TRUCK ?auto_191513 ?auto_191518 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191513 ?auto_191515 ?auto_191511 )
      ( DELIVER-4PKG-VERIFY ?auto_191512 ?auto_191513 ?auto_191514 ?auto_191515 ?auto_191511 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191541 - OBJ
      ?auto_191542 - OBJ
      ?auto_191543 - OBJ
      ?auto_191544 - OBJ
      ?auto_191540 - LOCATION
    )
    :vars
    (
      ?auto_191548 - LOCATION
      ?auto_191545 - CITY
      ?auto_191546 - LOCATION
      ?auto_191547 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_191542 ?auto_191541 ) ) ( not ( = ?auto_191543 ?auto_191541 ) ) ( not ( = ?auto_191543 ?auto_191542 ) ) ( not ( = ?auto_191544 ?auto_191541 ) ) ( not ( = ?auto_191544 ?auto_191542 ) ) ( not ( = ?auto_191544 ?auto_191543 ) ) ( IN-CITY ?auto_191548 ?auto_191545 ) ( IN-CITY ?auto_191540 ?auto_191545 ) ( not ( = ?auto_191540 ?auto_191548 ) ) ( OBJ-AT ?auto_191543 ?auto_191548 ) ( IN-CITY ?auto_191546 ?auto_191545 ) ( not ( = ?auto_191540 ?auto_191546 ) ) ( not ( = ?auto_191548 ?auto_191546 ) ) ( OBJ-AT ?auto_191541 ?auto_191546 ) ( OBJ-AT ?auto_191544 ?auto_191548 ) ( TRUCK-AT ?auto_191547 ?auto_191540 ) ( IN-TRUCK ?auto_191542 ?auto_191547 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191542 ?auto_191543 ?auto_191540 )
      ( DELIVER-4PKG-VERIFY ?auto_191541 ?auto_191542 ?auto_191543 ?auto_191544 ?auto_191540 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191570 - OBJ
      ?auto_191571 - OBJ
      ?auto_191572 - OBJ
      ?auto_191573 - OBJ
      ?auto_191569 - LOCATION
    )
    :vars
    (
      ?auto_191577 - LOCATION
      ?auto_191574 - CITY
      ?auto_191575 - LOCATION
      ?auto_191576 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_191571 ?auto_191570 ) ) ( not ( = ?auto_191572 ?auto_191570 ) ) ( not ( = ?auto_191572 ?auto_191571 ) ) ( not ( = ?auto_191573 ?auto_191570 ) ) ( not ( = ?auto_191573 ?auto_191571 ) ) ( not ( = ?auto_191573 ?auto_191572 ) ) ( IN-CITY ?auto_191577 ?auto_191574 ) ( IN-CITY ?auto_191569 ?auto_191574 ) ( not ( = ?auto_191569 ?auto_191577 ) ) ( OBJ-AT ?auto_191573 ?auto_191577 ) ( IN-CITY ?auto_191575 ?auto_191574 ) ( not ( = ?auto_191569 ?auto_191575 ) ) ( not ( = ?auto_191577 ?auto_191575 ) ) ( OBJ-AT ?auto_191570 ?auto_191575 ) ( OBJ-AT ?auto_191571 ?auto_191577 ) ( TRUCK-AT ?auto_191576 ?auto_191569 ) ( IN-TRUCK ?auto_191572 ?auto_191576 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191572 ?auto_191573 ?auto_191569 )
      ( DELIVER-4PKG-VERIFY ?auto_191570 ?auto_191571 ?auto_191572 ?auto_191573 ?auto_191569 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191599 - OBJ
      ?auto_191600 - OBJ
      ?auto_191601 - OBJ
      ?auto_191602 - OBJ
      ?auto_191598 - LOCATION
    )
    :vars
    (
      ?auto_191606 - LOCATION
      ?auto_191603 - CITY
      ?auto_191604 - LOCATION
      ?auto_191605 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_191600 ?auto_191599 ) ) ( not ( = ?auto_191601 ?auto_191599 ) ) ( not ( = ?auto_191601 ?auto_191600 ) ) ( not ( = ?auto_191602 ?auto_191599 ) ) ( not ( = ?auto_191602 ?auto_191600 ) ) ( not ( = ?auto_191602 ?auto_191601 ) ) ( IN-CITY ?auto_191606 ?auto_191603 ) ( IN-CITY ?auto_191598 ?auto_191603 ) ( not ( = ?auto_191598 ?auto_191606 ) ) ( OBJ-AT ?auto_191601 ?auto_191606 ) ( IN-CITY ?auto_191604 ?auto_191603 ) ( not ( = ?auto_191598 ?auto_191604 ) ) ( not ( = ?auto_191606 ?auto_191604 ) ) ( OBJ-AT ?auto_191599 ?auto_191604 ) ( OBJ-AT ?auto_191600 ?auto_191606 ) ( TRUCK-AT ?auto_191605 ?auto_191598 ) ( IN-TRUCK ?auto_191602 ?auto_191605 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191602 ?auto_191601 ?auto_191598 )
      ( DELIVER-4PKG-VERIFY ?auto_191599 ?auto_191600 ?auto_191601 ?auto_191602 ?auto_191598 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191721 - OBJ
      ?auto_191722 - OBJ
      ?auto_191723 - OBJ
      ?auto_191724 - OBJ
      ?auto_191720 - LOCATION
    )
    :vars
    (
      ?auto_191728 - LOCATION
      ?auto_191725 - CITY
      ?auto_191726 - LOCATION
      ?auto_191727 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_191722 ?auto_191721 ) ) ( not ( = ?auto_191723 ?auto_191721 ) ) ( not ( = ?auto_191723 ?auto_191722 ) ) ( not ( = ?auto_191724 ?auto_191721 ) ) ( not ( = ?auto_191724 ?auto_191722 ) ) ( not ( = ?auto_191724 ?auto_191723 ) ) ( IN-CITY ?auto_191728 ?auto_191725 ) ( IN-CITY ?auto_191720 ?auto_191725 ) ( not ( = ?auto_191720 ?auto_191728 ) ) ( OBJ-AT ?auto_191722 ?auto_191728 ) ( IN-CITY ?auto_191726 ?auto_191725 ) ( not ( = ?auto_191720 ?auto_191726 ) ) ( not ( = ?auto_191728 ?auto_191726 ) ) ( OBJ-AT ?auto_191721 ?auto_191726 ) ( OBJ-AT ?auto_191724 ?auto_191728 ) ( TRUCK-AT ?auto_191727 ?auto_191720 ) ( IN-TRUCK ?auto_191723 ?auto_191727 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191723 ?auto_191722 ?auto_191720 )
      ( DELIVER-4PKG-VERIFY ?auto_191721 ?auto_191722 ?auto_191723 ?auto_191724 ?auto_191720 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191750 - OBJ
      ?auto_191751 - OBJ
      ?auto_191752 - OBJ
      ?auto_191753 - OBJ
      ?auto_191749 - LOCATION
    )
    :vars
    (
      ?auto_191757 - LOCATION
      ?auto_191754 - CITY
      ?auto_191755 - LOCATION
      ?auto_191756 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_191751 ?auto_191750 ) ) ( not ( = ?auto_191752 ?auto_191750 ) ) ( not ( = ?auto_191752 ?auto_191751 ) ) ( not ( = ?auto_191753 ?auto_191750 ) ) ( not ( = ?auto_191753 ?auto_191751 ) ) ( not ( = ?auto_191753 ?auto_191752 ) ) ( IN-CITY ?auto_191757 ?auto_191754 ) ( IN-CITY ?auto_191749 ?auto_191754 ) ( not ( = ?auto_191749 ?auto_191757 ) ) ( OBJ-AT ?auto_191751 ?auto_191757 ) ( IN-CITY ?auto_191755 ?auto_191754 ) ( not ( = ?auto_191749 ?auto_191755 ) ) ( not ( = ?auto_191757 ?auto_191755 ) ) ( OBJ-AT ?auto_191750 ?auto_191755 ) ( OBJ-AT ?auto_191752 ?auto_191757 ) ( TRUCK-AT ?auto_191756 ?auto_191749 ) ( IN-TRUCK ?auto_191753 ?auto_191756 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191753 ?auto_191751 ?auto_191749 )
      ( DELIVER-4PKG-VERIFY ?auto_191750 ?auto_191751 ?auto_191752 ?auto_191753 ?auto_191749 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191935 - OBJ
      ?auto_191936 - OBJ
      ?auto_191937 - OBJ
      ?auto_191938 - OBJ
      ?auto_191934 - LOCATION
    )
    :vars
    (
      ?auto_191942 - LOCATION
      ?auto_191939 - CITY
      ?auto_191940 - LOCATION
      ?auto_191941 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_191936 ?auto_191935 ) ) ( not ( = ?auto_191937 ?auto_191935 ) ) ( not ( = ?auto_191937 ?auto_191936 ) ) ( not ( = ?auto_191938 ?auto_191935 ) ) ( not ( = ?auto_191938 ?auto_191936 ) ) ( not ( = ?auto_191938 ?auto_191937 ) ) ( IN-CITY ?auto_191942 ?auto_191939 ) ( IN-CITY ?auto_191934 ?auto_191939 ) ( not ( = ?auto_191934 ?auto_191942 ) ) ( OBJ-AT ?auto_191935 ?auto_191942 ) ( IN-CITY ?auto_191940 ?auto_191939 ) ( not ( = ?auto_191934 ?auto_191940 ) ) ( not ( = ?auto_191942 ?auto_191940 ) ) ( OBJ-AT ?auto_191938 ?auto_191940 ) ( OBJ-AT ?auto_191937 ?auto_191942 ) ( TRUCK-AT ?auto_191941 ?auto_191934 ) ( IN-TRUCK ?auto_191936 ?auto_191941 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191936 ?auto_191935 ?auto_191934 )
      ( DELIVER-4PKG-VERIFY ?auto_191935 ?auto_191936 ?auto_191937 ?auto_191938 ?auto_191934 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191964 - OBJ
      ?auto_191965 - OBJ
      ?auto_191966 - OBJ
      ?auto_191967 - OBJ
      ?auto_191963 - LOCATION
    )
    :vars
    (
      ?auto_191971 - LOCATION
      ?auto_191968 - CITY
      ?auto_191969 - LOCATION
      ?auto_191970 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_191965 ?auto_191964 ) ) ( not ( = ?auto_191966 ?auto_191964 ) ) ( not ( = ?auto_191966 ?auto_191965 ) ) ( not ( = ?auto_191967 ?auto_191964 ) ) ( not ( = ?auto_191967 ?auto_191965 ) ) ( not ( = ?auto_191967 ?auto_191966 ) ) ( IN-CITY ?auto_191971 ?auto_191968 ) ( IN-CITY ?auto_191963 ?auto_191968 ) ( not ( = ?auto_191963 ?auto_191971 ) ) ( OBJ-AT ?auto_191964 ?auto_191971 ) ( IN-CITY ?auto_191969 ?auto_191968 ) ( not ( = ?auto_191963 ?auto_191969 ) ) ( not ( = ?auto_191971 ?auto_191969 ) ) ( OBJ-AT ?auto_191966 ?auto_191969 ) ( OBJ-AT ?auto_191967 ?auto_191971 ) ( TRUCK-AT ?auto_191970 ?auto_191963 ) ( IN-TRUCK ?auto_191965 ?auto_191970 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191965 ?auto_191964 ?auto_191963 )
      ( DELIVER-4PKG-VERIFY ?auto_191964 ?auto_191965 ?auto_191966 ?auto_191967 ?auto_191963 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192055 - OBJ
      ?auto_192056 - OBJ
      ?auto_192057 - OBJ
      ?auto_192058 - OBJ
      ?auto_192054 - LOCATION
    )
    :vars
    (
      ?auto_192062 - LOCATION
      ?auto_192059 - CITY
      ?auto_192060 - LOCATION
      ?auto_192061 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192056 ?auto_192055 ) ) ( not ( = ?auto_192057 ?auto_192055 ) ) ( not ( = ?auto_192057 ?auto_192056 ) ) ( not ( = ?auto_192058 ?auto_192055 ) ) ( not ( = ?auto_192058 ?auto_192056 ) ) ( not ( = ?auto_192058 ?auto_192057 ) ) ( IN-CITY ?auto_192062 ?auto_192059 ) ( IN-CITY ?auto_192054 ?auto_192059 ) ( not ( = ?auto_192054 ?auto_192062 ) ) ( OBJ-AT ?auto_192055 ?auto_192062 ) ( IN-CITY ?auto_192060 ?auto_192059 ) ( not ( = ?auto_192054 ?auto_192060 ) ) ( not ( = ?auto_192062 ?auto_192060 ) ) ( OBJ-AT ?auto_192058 ?auto_192060 ) ( OBJ-AT ?auto_192056 ?auto_192062 ) ( TRUCK-AT ?auto_192061 ?auto_192054 ) ( IN-TRUCK ?auto_192057 ?auto_192061 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192057 ?auto_192055 ?auto_192054 )
      ( DELIVER-4PKG-VERIFY ?auto_192055 ?auto_192056 ?auto_192057 ?auto_192058 ?auto_192054 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192116 - OBJ
      ?auto_192117 - OBJ
      ?auto_192118 - OBJ
      ?auto_192119 - OBJ
      ?auto_192115 - LOCATION
    )
    :vars
    (
      ?auto_192123 - LOCATION
      ?auto_192120 - CITY
      ?auto_192121 - LOCATION
      ?auto_192122 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192117 ?auto_192116 ) ) ( not ( = ?auto_192118 ?auto_192116 ) ) ( not ( = ?auto_192118 ?auto_192117 ) ) ( not ( = ?auto_192119 ?auto_192116 ) ) ( not ( = ?auto_192119 ?auto_192117 ) ) ( not ( = ?auto_192119 ?auto_192118 ) ) ( IN-CITY ?auto_192123 ?auto_192120 ) ( IN-CITY ?auto_192115 ?auto_192120 ) ( not ( = ?auto_192115 ?auto_192123 ) ) ( OBJ-AT ?auto_192116 ?auto_192123 ) ( IN-CITY ?auto_192121 ?auto_192120 ) ( not ( = ?auto_192115 ?auto_192121 ) ) ( not ( = ?auto_192123 ?auto_192121 ) ) ( OBJ-AT ?auto_192118 ?auto_192121 ) ( OBJ-AT ?auto_192117 ?auto_192123 ) ( TRUCK-AT ?auto_192122 ?auto_192115 ) ( IN-TRUCK ?auto_192119 ?auto_192122 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192119 ?auto_192116 ?auto_192115 )
      ( DELIVER-4PKG-VERIFY ?auto_192116 ?auto_192117 ?auto_192118 ?auto_192119 ?auto_192115 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192207 - OBJ
      ?auto_192208 - OBJ
      ?auto_192209 - OBJ
      ?auto_192210 - OBJ
      ?auto_192206 - LOCATION
    )
    :vars
    (
      ?auto_192214 - LOCATION
      ?auto_192211 - CITY
      ?auto_192212 - LOCATION
      ?auto_192213 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192208 ?auto_192207 ) ) ( not ( = ?auto_192209 ?auto_192207 ) ) ( not ( = ?auto_192209 ?auto_192208 ) ) ( not ( = ?auto_192210 ?auto_192207 ) ) ( not ( = ?auto_192210 ?auto_192208 ) ) ( not ( = ?auto_192210 ?auto_192209 ) ) ( IN-CITY ?auto_192214 ?auto_192211 ) ( IN-CITY ?auto_192206 ?auto_192211 ) ( not ( = ?auto_192206 ?auto_192214 ) ) ( OBJ-AT ?auto_192207 ?auto_192214 ) ( IN-CITY ?auto_192212 ?auto_192211 ) ( not ( = ?auto_192206 ?auto_192212 ) ) ( not ( = ?auto_192214 ?auto_192212 ) ) ( OBJ-AT ?auto_192208 ?auto_192212 ) ( OBJ-AT ?auto_192210 ?auto_192214 ) ( TRUCK-AT ?auto_192213 ?auto_192206 ) ( IN-TRUCK ?auto_192209 ?auto_192213 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192209 ?auto_192207 ?auto_192206 )
      ( DELIVER-4PKG-VERIFY ?auto_192207 ?auto_192208 ?auto_192209 ?auto_192210 ?auto_192206 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192236 - OBJ
      ?auto_192237 - OBJ
      ?auto_192238 - OBJ
      ?auto_192239 - OBJ
      ?auto_192235 - LOCATION
    )
    :vars
    (
      ?auto_192243 - LOCATION
      ?auto_192240 - CITY
      ?auto_192241 - LOCATION
      ?auto_192242 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192237 ?auto_192236 ) ) ( not ( = ?auto_192238 ?auto_192236 ) ) ( not ( = ?auto_192238 ?auto_192237 ) ) ( not ( = ?auto_192239 ?auto_192236 ) ) ( not ( = ?auto_192239 ?auto_192237 ) ) ( not ( = ?auto_192239 ?auto_192238 ) ) ( IN-CITY ?auto_192243 ?auto_192240 ) ( IN-CITY ?auto_192235 ?auto_192240 ) ( not ( = ?auto_192235 ?auto_192243 ) ) ( OBJ-AT ?auto_192236 ?auto_192243 ) ( IN-CITY ?auto_192241 ?auto_192240 ) ( not ( = ?auto_192235 ?auto_192241 ) ) ( not ( = ?auto_192243 ?auto_192241 ) ) ( OBJ-AT ?auto_192237 ?auto_192241 ) ( OBJ-AT ?auto_192238 ?auto_192243 ) ( TRUCK-AT ?auto_192242 ?auto_192235 ) ( IN-TRUCK ?auto_192239 ?auto_192242 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192239 ?auto_192236 ?auto_192235 )
      ( DELIVER-4PKG-VERIFY ?auto_192236 ?auto_192237 ?auto_192238 ?auto_192239 ?auto_192235 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_192530 - OBJ
      ?auto_192529 - LOCATION
    )
    :vars
    (
      ?auto_192537 - OBJ
      ?auto_192535 - LOCATION
      ?auto_192531 - CITY
      ?auto_192533 - OBJ
      ?auto_192532 - LOCATION
      ?auto_192536 - OBJ
      ?auto_192534 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192530 ?auto_192537 ) ) ( IN-CITY ?auto_192535 ?auto_192531 ) ( IN-CITY ?auto_192529 ?auto_192531 ) ( not ( = ?auto_192529 ?auto_192535 ) ) ( OBJ-AT ?auto_192530 ?auto_192535 ) ( not ( = ?auto_192533 ?auto_192537 ) ) ( not ( = ?auto_192530 ?auto_192533 ) ) ( IN-CITY ?auto_192532 ?auto_192531 ) ( not ( = ?auto_192529 ?auto_192532 ) ) ( not ( = ?auto_192535 ?auto_192532 ) ) ( OBJ-AT ?auto_192533 ?auto_192532 ) ( not ( = ?auto_192536 ?auto_192537 ) ) ( not ( = ?auto_192530 ?auto_192536 ) ) ( not ( = ?auto_192533 ?auto_192536 ) ) ( OBJ-AT ?auto_192536 ?auto_192535 ) ( IN-TRUCK ?auto_192537 ?auto_192534 ) ( TRUCK-AT ?auto_192534 ?auto_192532 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_192534 ?auto_192532 ?auto_192529 ?auto_192531 )
      ( DELIVER-2PKG ?auto_192537 ?auto_192530 ?auto_192529 )
      ( DELIVER-1PKG-VERIFY ?auto_192530 ?auto_192529 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_192539 - OBJ
      ?auto_192540 - OBJ
      ?auto_192538 - LOCATION
    )
    :vars
    (
      ?auto_192546 - LOCATION
      ?auto_192544 - CITY
      ?auto_192542 - OBJ
      ?auto_192545 - LOCATION
      ?auto_192541 - OBJ
      ?auto_192543 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192540 ?auto_192539 ) ) ( IN-CITY ?auto_192546 ?auto_192544 ) ( IN-CITY ?auto_192538 ?auto_192544 ) ( not ( = ?auto_192538 ?auto_192546 ) ) ( OBJ-AT ?auto_192540 ?auto_192546 ) ( not ( = ?auto_192542 ?auto_192539 ) ) ( not ( = ?auto_192540 ?auto_192542 ) ) ( IN-CITY ?auto_192545 ?auto_192544 ) ( not ( = ?auto_192538 ?auto_192545 ) ) ( not ( = ?auto_192546 ?auto_192545 ) ) ( OBJ-AT ?auto_192542 ?auto_192545 ) ( not ( = ?auto_192541 ?auto_192539 ) ) ( not ( = ?auto_192540 ?auto_192541 ) ) ( not ( = ?auto_192542 ?auto_192541 ) ) ( OBJ-AT ?auto_192541 ?auto_192546 ) ( IN-TRUCK ?auto_192539 ?auto_192543 ) ( TRUCK-AT ?auto_192543 ?auto_192545 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_192540 ?auto_192538 )
      ( DELIVER-2PKG-VERIFY ?auto_192539 ?auto_192540 ?auto_192538 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_192548 - OBJ
      ?auto_192549 - OBJ
      ?auto_192547 - LOCATION
    )
    :vars
    (
      ?auto_192555 - OBJ
      ?auto_192551 - LOCATION
      ?auto_192550 - CITY
      ?auto_192553 - OBJ
      ?auto_192552 - LOCATION
      ?auto_192554 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192549 ?auto_192548 ) ) ( not ( = ?auto_192549 ?auto_192555 ) ) ( IN-CITY ?auto_192551 ?auto_192550 ) ( IN-CITY ?auto_192547 ?auto_192550 ) ( not ( = ?auto_192547 ?auto_192551 ) ) ( OBJ-AT ?auto_192549 ?auto_192551 ) ( not ( = ?auto_192553 ?auto_192555 ) ) ( not ( = ?auto_192549 ?auto_192553 ) ) ( IN-CITY ?auto_192552 ?auto_192550 ) ( not ( = ?auto_192547 ?auto_192552 ) ) ( not ( = ?auto_192551 ?auto_192552 ) ) ( OBJ-AT ?auto_192553 ?auto_192552 ) ( not ( = ?auto_192548 ?auto_192555 ) ) ( not ( = ?auto_192553 ?auto_192548 ) ) ( OBJ-AT ?auto_192548 ?auto_192551 ) ( IN-TRUCK ?auto_192555 ?auto_192554 ) ( TRUCK-AT ?auto_192554 ?auto_192552 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192555 ?auto_192549 ?auto_192547 )
      ( DELIVER-2PKG-VERIFY ?auto_192548 ?auto_192549 ?auto_192547 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_192557 - OBJ
      ?auto_192558 - OBJ
      ?auto_192556 - LOCATION
    )
    :vars
    (
      ?auto_192564 - OBJ
      ?auto_192560 - LOCATION
      ?auto_192559 - CITY
      ?auto_192561 - LOCATION
      ?auto_192562 - OBJ
      ?auto_192563 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192558 ?auto_192557 ) ) ( not ( = ?auto_192558 ?auto_192564 ) ) ( IN-CITY ?auto_192560 ?auto_192559 ) ( IN-CITY ?auto_192556 ?auto_192559 ) ( not ( = ?auto_192556 ?auto_192560 ) ) ( OBJ-AT ?auto_192558 ?auto_192560 ) ( not ( = ?auto_192557 ?auto_192564 ) ) ( IN-CITY ?auto_192561 ?auto_192559 ) ( not ( = ?auto_192556 ?auto_192561 ) ) ( not ( = ?auto_192560 ?auto_192561 ) ) ( OBJ-AT ?auto_192557 ?auto_192561 ) ( not ( = ?auto_192562 ?auto_192564 ) ) ( not ( = ?auto_192558 ?auto_192562 ) ) ( not ( = ?auto_192557 ?auto_192562 ) ) ( OBJ-AT ?auto_192562 ?auto_192560 ) ( IN-TRUCK ?auto_192564 ?auto_192563 ) ( TRUCK-AT ?auto_192563 ?auto_192561 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192564 ?auto_192558 ?auto_192556 )
      ( DELIVER-2PKG-VERIFY ?auto_192557 ?auto_192558 ?auto_192556 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_192566 - OBJ
      ?auto_192567 - OBJ
      ?auto_192565 - LOCATION
    )
    :vars
    (
      ?auto_192569 - LOCATION
      ?auto_192568 - CITY
      ?auto_192571 - OBJ
      ?auto_192570 - LOCATION
      ?auto_192572 - OBJ
      ?auto_192573 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192567 ?auto_192566 ) ) ( IN-CITY ?auto_192569 ?auto_192568 ) ( IN-CITY ?auto_192565 ?auto_192568 ) ( not ( = ?auto_192565 ?auto_192569 ) ) ( OBJ-AT ?auto_192566 ?auto_192569 ) ( not ( = ?auto_192571 ?auto_192567 ) ) ( not ( = ?auto_192566 ?auto_192571 ) ) ( IN-CITY ?auto_192570 ?auto_192568 ) ( not ( = ?auto_192565 ?auto_192570 ) ) ( not ( = ?auto_192569 ?auto_192570 ) ) ( OBJ-AT ?auto_192571 ?auto_192570 ) ( not ( = ?auto_192572 ?auto_192567 ) ) ( not ( = ?auto_192566 ?auto_192572 ) ) ( not ( = ?auto_192571 ?auto_192572 ) ) ( OBJ-AT ?auto_192572 ?auto_192569 ) ( IN-TRUCK ?auto_192567 ?auto_192573 ) ( TRUCK-AT ?auto_192573 ?auto_192570 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192567 ?auto_192566 ?auto_192565 )
      ( DELIVER-2PKG-VERIFY ?auto_192566 ?auto_192567 ?auto_192565 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_192575 - OBJ
      ?auto_192576 - OBJ
      ?auto_192574 - LOCATION
    )
    :vars
    (
      ?auto_192582 - OBJ
      ?auto_192578 - LOCATION
      ?auto_192577 - CITY
      ?auto_192580 - OBJ
      ?auto_192579 - LOCATION
      ?auto_192581 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192576 ?auto_192575 ) ) ( not ( = ?auto_192575 ?auto_192582 ) ) ( IN-CITY ?auto_192578 ?auto_192577 ) ( IN-CITY ?auto_192574 ?auto_192577 ) ( not ( = ?auto_192574 ?auto_192578 ) ) ( OBJ-AT ?auto_192575 ?auto_192578 ) ( not ( = ?auto_192580 ?auto_192582 ) ) ( not ( = ?auto_192575 ?auto_192580 ) ) ( IN-CITY ?auto_192579 ?auto_192577 ) ( not ( = ?auto_192574 ?auto_192579 ) ) ( not ( = ?auto_192578 ?auto_192579 ) ) ( OBJ-AT ?auto_192580 ?auto_192579 ) ( not ( = ?auto_192576 ?auto_192582 ) ) ( not ( = ?auto_192580 ?auto_192576 ) ) ( OBJ-AT ?auto_192576 ?auto_192578 ) ( IN-TRUCK ?auto_192582 ?auto_192581 ) ( TRUCK-AT ?auto_192581 ?auto_192579 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192582 ?auto_192575 ?auto_192574 )
      ( DELIVER-2PKG-VERIFY ?auto_192575 ?auto_192576 ?auto_192574 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_192584 - OBJ
      ?auto_192585 - OBJ
      ?auto_192583 - LOCATION
    )
    :vars
    (
      ?auto_192591 - OBJ
      ?auto_192587 - LOCATION
      ?auto_192586 - CITY
      ?auto_192588 - LOCATION
      ?auto_192589 - OBJ
      ?auto_192590 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192585 ?auto_192584 ) ) ( not ( = ?auto_192584 ?auto_192591 ) ) ( IN-CITY ?auto_192587 ?auto_192586 ) ( IN-CITY ?auto_192583 ?auto_192586 ) ( not ( = ?auto_192583 ?auto_192587 ) ) ( OBJ-AT ?auto_192584 ?auto_192587 ) ( not ( = ?auto_192585 ?auto_192591 ) ) ( IN-CITY ?auto_192588 ?auto_192586 ) ( not ( = ?auto_192583 ?auto_192588 ) ) ( not ( = ?auto_192587 ?auto_192588 ) ) ( OBJ-AT ?auto_192585 ?auto_192588 ) ( not ( = ?auto_192589 ?auto_192591 ) ) ( not ( = ?auto_192584 ?auto_192589 ) ) ( not ( = ?auto_192585 ?auto_192589 ) ) ( OBJ-AT ?auto_192589 ?auto_192587 ) ( IN-TRUCK ?auto_192591 ?auto_192590 ) ( TRUCK-AT ?auto_192590 ?auto_192588 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192591 ?auto_192584 ?auto_192583 )
      ( DELIVER-2PKG-VERIFY ?auto_192584 ?auto_192585 ?auto_192583 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_192613 - OBJ
      ?auto_192614 - OBJ
      ?auto_192615 - OBJ
      ?auto_192612 - LOCATION
    )
    :vars
    (
      ?auto_192617 - LOCATION
      ?auto_192616 - CITY
      ?auto_192619 - OBJ
      ?auto_192618 - LOCATION
      ?auto_192620 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192614 ?auto_192613 ) ) ( not ( = ?auto_192615 ?auto_192613 ) ) ( not ( = ?auto_192615 ?auto_192614 ) ) ( IN-CITY ?auto_192617 ?auto_192616 ) ( IN-CITY ?auto_192612 ?auto_192616 ) ( not ( = ?auto_192612 ?auto_192617 ) ) ( OBJ-AT ?auto_192615 ?auto_192617 ) ( not ( = ?auto_192619 ?auto_192613 ) ) ( not ( = ?auto_192615 ?auto_192619 ) ) ( IN-CITY ?auto_192618 ?auto_192616 ) ( not ( = ?auto_192612 ?auto_192618 ) ) ( not ( = ?auto_192617 ?auto_192618 ) ) ( OBJ-AT ?auto_192619 ?auto_192618 ) ( not ( = ?auto_192619 ?auto_192614 ) ) ( OBJ-AT ?auto_192614 ?auto_192617 ) ( IN-TRUCK ?auto_192613 ?auto_192620 ) ( TRUCK-AT ?auto_192620 ?auto_192618 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192613 ?auto_192615 ?auto_192612 )
      ( DELIVER-3PKG-VERIFY ?auto_192613 ?auto_192614 ?auto_192615 ?auto_192612 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_192622 - OBJ
      ?auto_192623 - OBJ
      ?auto_192624 - OBJ
      ?auto_192621 - LOCATION
    )
    :vars
    (
      ?auto_192626 - LOCATION
      ?auto_192625 - CITY
      ?auto_192627 - LOCATION
      ?auto_192628 - OBJ
      ?auto_192629 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192623 ?auto_192622 ) ) ( not ( = ?auto_192624 ?auto_192622 ) ) ( not ( = ?auto_192624 ?auto_192623 ) ) ( IN-CITY ?auto_192626 ?auto_192625 ) ( IN-CITY ?auto_192621 ?auto_192625 ) ( not ( = ?auto_192621 ?auto_192626 ) ) ( OBJ-AT ?auto_192624 ?auto_192626 ) ( IN-CITY ?auto_192627 ?auto_192625 ) ( not ( = ?auto_192621 ?auto_192627 ) ) ( not ( = ?auto_192626 ?auto_192627 ) ) ( OBJ-AT ?auto_192623 ?auto_192627 ) ( not ( = ?auto_192628 ?auto_192622 ) ) ( not ( = ?auto_192624 ?auto_192628 ) ) ( not ( = ?auto_192623 ?auto_192628 ) ) ( OBJ-AT ?auto_192628 ?auto_192626 ) ( IN-TRUCK ?auto_192622 ?auto_192629 ) ( TRUCK-AT ?auto_192629 ?auto_192627 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192622 ?auto_192624 ?auto_192621 )
      ( DELIVER-3PKG-VERIFY ?auto_192622 ?auto_192623 ?auto_192624 ?auto_192621 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_192641 - OBJ
      ?auto_192642 - OBJ
      ?auto_192643 - OBJ
      ?auto_192640 - LOCATION
    )
    :vars
    (
      ?auto_192645 - LOCATION
      ?auto_192644 - CITY
      ?auto_192647 - OBJ
      ?auto_192646 - LOCATION
      ?auto_192648 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192642 ?auto_192641 ) ) ( not ( = ?auto_192643 ?auto_192641 ) ) ( not ( = ?auto_192643 ?auto_192642 ) ) ( IN-CITY ?auto_192645 ?auto_192644 ) ( IN-CITY ?auto_192640 ?auto_192644 ) ( not ( = ?auto_192640 ?auto_192645 ) ) ( OBJ-AT ?auto_192642 ?auto_192645 ) ( not ( = ?auto_192647 ?auto_192641 ) ) ( not ( = ?auto_192642 ?auto_192647 ) ) ( IN-CITY ?auto_192646 ?auto_192644 ) ( not ( = ?auto_192640 ?auto_192646 ) ) ( not ( = ?auto_192645 ?auto_192646 ) ) ( OBJ-AT ?auto_192647 ?auto_192646 ) ( not ( = ?auto_192647 ?auto_192643 ) ) ( OBJ-AT ?auto_192643 ?auto_192645 ) ( IN-TRUCK ?auto_192641 ?auto_192648 ) ( TRUCK-AT ?auto_192648 ?auto_192646 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192641 ?auto_192642 ?auto_192640 )
      ( DELIVER-3PKG-VERIFY ?auto_192641 ?auto_192642 ?auto_192643 ?auto_192640 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_192650 - OBJ
      ?auto_192651 - OBJ
      ?auto_192652 - OBJ
      ?auto_192649 - LOCATION
    )
    :vars
    (
      ?auto_192654 - LOCATION
      ?auto_192653 - CITY
      ?auto_192655 - LOCATION
      ?auto_192656 - OBJ
      ?auto_192657 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192651 ?auto_192650 ) ) ( not ( = ?auto_192652 ?auto_192650 ) ) ( not ( = ?auto_192652 ?auto_192651 ) ) ( IN-CITY ?auto_192654 ?auto_192653 ) ( IN-CITY ?auto_192649 ?auto_192653 ) ( not ( = ?auto_192649 ?auto_192654 ) ) ( OBJ-AT ?auto_192651 ?auto_192654 ) ( IN-CITY ?auto_192655 ?auto_192653 ) ( not ( = ?auto_192649 ?auto_192655 ) ) ( not ( = ?auto_192654 ?auto_192655 ) ) ( OBJ-AT ?auto_192652 ?auto_192655 ) ( not ( = ?auto_192656 ?auto_192650 ) ) ( not ( = ?auto_192651 ?auto_192656 ) ) ( not ( = ?auto_192652 ?auto_192656 ) ) ( OBJ-AT ?auto_192656 ?auto_192654 ) ( IN-TRUCK ?auto_192650 ?auto_192657 ) ( TRUCK-AT ?auto_192657 ?auto_192655 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192650 ?auto_192651 ?auto_192649 )
      ( DELIVER-3PKG-VERIFY ?auto_192650 ?auto_192651 ?auto_192652 ?auto_192649 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_192669 - OBJ
      ?auto_192670 - OBJ
      ?auto_192671 - OBJ
      ?auto_192668 - LOCATION
    )
    :vars
    (
      ?auto_192673 - LOCATION
      ?auto_192672 - CITY
      ?auto_192675 - OBJ
      ?auto_192674 - LOCATION
      ?auto_192676 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192670 ?auto_192669 ) ) ( not ( = ?auto_192671 ?auto_192669 ) ) ( not ( = ?auto_192671 ?auto_192670 ) ) ( IN-CITY ?auto_192673 ?auto_192672 ) ( IN-CITY ?auto_192668 ?auto_192672 ) ( not ( = ?auto_192668 ?auto_192673 ) ) ( OBJ-AT ?auto_192671 ?auto_192673 ) ( not ( = ?auto_192675 ?auto_192670 ) ) ( not ( = ?auto_192671 ?auto_192675 ) ) ( IN-CITY ?auto_192674 ?auto_192672 ) ( not ( = ?auto_192668 ?auto_192674 ) ) ( not ( = ?auto_192673 ?auto_192674 ) ) ( OBJ-AT ?auto_192675 ?auto_192674 ) ( not ( = ?auto_192675 ?auto_192669 ) ) ( OBJ-AT ?auto_192669 ?auto_192673 ) ( IN-TRUCK ?auto_192670 ?auto_192676 ) ( TRUCK-AT ?auto_192676 ?auto_192674 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192670 ?auto_192671 ?auto_192668 )
      ( DELIVER-3PKG-VERIFY ?auto_192669 ?auto_192670 ?auto_192671 ?auto_192668 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_192688 - OBJ
      ?auto_192689 - OBJ
      ?auto_192690 - OBJ
      ?auto_192687 - LOCATION
    )
    :vars
    (
      ?auto_192695 - OBJ
      ?auto_192692 - LOCATION
      ?auto_192691 - CITY
      ?auto_192693 - LOCATION
      ?auto_192694 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192689 ?auto_192688 ) ) ( not ( = ?auto_192690 ?auto_192688 ) ) ( not ( = ?auto_192690 ?auto_192689 ) ) ( not ( = ?auto_192690 ?auto_192695 ) ) ( IN-CITY ?auto_192692 ?auto_192691 ) ( IN-CITY ?auto_192687 ?auto_192691 ) ( not ( = ?auto_192687 ?auto_192692 ) ) ( OBJ-AT ?auto_192690 ?auto_192692 ) ( not ( = ?auto_192689 ?auto_192695 ) ) ( IN-CITY ?auto_192693 ?auto_192691 ) ( not ( = ?auto_192687 ?auto_192693 ) ) ( not ( = ?auto_192692 ?auto_192693 ) ) ( OBJ-AT ?auto_192689 ?auto_192693 ) ( not ( = ?auto_192688 ?auto_192695 ) ) ( OBJ-AT ?auto_192688 ?auto_192692 ) ( IN-TRUCK ?auto_192695 ?auto_192694 ) ( TRUCK-AT ?auto_192694 ?auto_192693 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192695 ?auto_192690 ?auto_192687 )
      ( DELIVER-3PKG-VERIFY ?auto_192688 ?auto_192689 ?auto_192690 ?auto_192687 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_192697 - OBJ
      ?auto_192698 - OBJ
      ?auto_192699 - OBJ
      ?auto_192696 - LOCATION
    )
    :vars
    (
      ?auto_192701 - LOCATION
      ?auto_192700 - CITY
      ?auto_192703 - OBJ
      ?auto_192702 - LOCATION
      ?auto_192704 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192698 ?auto_192697 ) ) ( not ( = ?auto_192699 ?auto_192697 ) ) ( not ( = ?auto_192699 ?auto_192698 ) ) ( IN-CITY ?auto_192701 ?auto_192700 ) ( IN-CITY ?auto_192696 ?auto_192700 ) ( not ( = ?auto_192696 ?auto_192701 ) ) ( OBJ-AT ?auto_192698 ?auto_192701 ) ( not ( = ?auto_192703 ?auto_192699 ) ) ( not ( = ?auto_192698 ?auto_192703 ) ) ( IN-CITY ?auto_192702 ?auto_192700 ) ( not ( = ?auto_192696 ?auto_192702 ) ) ( not ( = ?auto_192701 ?auto_192702 ) ) ( OBJ-AT ?auto_192703 ?auto_192702 ) ( not ( = ?auto_192703 ?auto_192697 ) ) ( OBJ-AT ?auto_192697 ?auto_192701 ) ( IN-TRUCK ?auto_192699 ?auto_192704 ) ( TRUCK-AT ?auto_192704 ?auto_192702 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192699 ?auto_192698 ?auto_192696 )
      ( DELIVER-3PKG-VERIFY ?auto_192697 ?auto_192698 ?auto_192699 ?auto_192696 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_192716 - OBJ
      ?auto_192717 - OBJ
      ?auto_192718 - OBJ
      ?auto_192715 - LOCATION
    )
    :vars
    (
      ?auto_192723 - OBJ
      ?auto_192720 - LOCATION
      ?auto_192719 - CITY
      ?auto_192721 - LOCATION
      ?auto_192722 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192717 ?auto_192716 ) ) ( not ( = ?auto_192718 ?auto_192716 ) ) ( not ( = ?auto_192718 ?auto_192717 ) ) ( not ( = ?auto_192717 ?auto_192723 ) ) ( IN-CITY ?auto_192720 ?auto_192719 ) ( IN-CITY ?auto_192715 ?auto_192719 ) ( not ( = ?auto_192715 ?auto_192720 ) ) ( OBJ-AT ?auto_192717 ?auto_192720 ) ( not ( = ?auto_192718 ?auto_192723 ) ) ( IN-CITY ?auto_192721 ?auto_192719 ) ( not ( = ?auto_192715 ?auto_192721 ) ) ( not ( = ?auto_192720 ?auto_192721 ) ) ( OBJ-AT ?auto_192718 ?auto_192721 ) ( not ( = ?auto_192716 ?auto_192723 ) ) ( OBJ-AT ?auto_192716 ?auto_192720 ) ( IN-TRUCK ?auto_192723 ?auto_192722 ) ( TRUCK-AT ?auto_192722 ?auto_192721 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192723 ?auto_192717 ?auto_192715 )
      ( DELIVER-3PKG-VERIFY ?auto_192716 ?auto_192717 ?auto_192718 ?auto_192715 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_192735 - OBJ
      ?auto_192736 - OBJ
      ?auto_192737 - OBJ
      ?auto_192734 - LOCATION
    )
    :vars
    (
      ?auto_192739 - LOCATION
      ?auto_192738 - CITY
      ?auto_192740 - LOCATION
      ?auto_192741 - OBJ
      ?auto_192742 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192736 ?auto_192735 ) ) ( not ( = ?auto_192737 ?auto_192735 ) ) ( not ( = ?auto_192737 ?auto_192736 ) ) ( IN-CITY ?auto_192739 ?auto_192738 ) ( IN-CITY ?auto_192734 ?auto_192738 ) ( not ( = ?auto_192734 ?auto_192739 ) ) ( OBJ-AT ?auto_192737 ?auto_192739 ) ( IN-CITY ?auto_192740 ?auto_192738 ) ( not ( = ?auto_192734 ?auto_192740 ) ) ( not ( = ?auto_192739 ?auto_192740 ) ) ( OBJ-AT ?auto_192735 ?auto_192740 ) ( not ( = ?auto_192741 ?auto_192736 ) ) ( not ( = ?auto_192737 ?auto_192741 ) ) ( not ( = ?auto_192735 ?auto_192741 ) ) ( OBJ-AT ?auto_192741 ?auto_192739 ) ( IN-TRUCK ?auto_192736 ?auto_192742 ) ( TRUCK-AT ?auto_192742 ?auto_192740 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192736 ?auto_192737 ?auto_192734 )
      ( DELIVER-3PKG-VERIFY ?auto_192735 ?auto_192736 ?auto_192737 ?auto_192734 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_192744 - OBJ
      ?auto_192745 - OBJ
      ?auto_192746 - OBJ
      ?auto_192743 - LOCATION
    )
    :vars
    (
      ?auto_192751 - OBJ
      ?auto_192748 - LOCATION
      ?auto_192747 - CITY
      ?auto_192749 - LOCATION
      ?auto_192750 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192745 ?auto_192744 ) ) ( not ( = ?auto_192746 ?auto_192744 ) ) ( not ( = ?auto_192746 ?auto_192745 ) ) ( not ( = ?auto_192746 ?auto_192751 ) ) ( IN-CITY ?auto_192748 ?auto_192747 ) ( IN-CITY ?auto_192743 ?auto_192747 ) ( not ( = ?auto_192743 ?auto_192748 ) ) ( OBJ-AT ?auto_192746 ?auto_192748 ) ( not ( = ?auto_192744 ?auto_192751 ) ) ( IN-CITY ?auto_192749 ?auto_192747 ) ( not ( = ?auto_192743 ?auto_192749 ) ) ( not ( = ?auto_192748 ?auto_192749 ) ) ( OBJ-AT ?auto_192744 ?auto_192749 ) ( not ( = ?auto_192745 ?auto_192751 ) ) ( OBJ-AT ?auto_192745 ?auto_192748 ) ( IN-TRUCK ?auto_192751 ?auto_192750 ) ( TRUCK-AT ?auto_192750 ?auto_192749 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192751 ?auto_192746 ?auto_192743 )
      ( DELIVER-3PKG-VERIFY ?auto_192744 ?auto_192745 ?auto_192746 ?auto_192743 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_192763 - OBJ
      ?auto_192764 - OBJ
      ?auto_192765 - OBJ
      ?auto_192762 - LOCATION
    )
    :vars
    (
      ?auto_192767 - LOCATION
      ?auto_192766 - CITY
      ?auto_192768 - LOCATION
      ?auto_192769 - OBJ
      ?auto_192770 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192764 ?auto_192763 ) ) ( not ( = ?auto_192765 ?auto_192763 ) ) ( not ( = ?auto_192765 ?auto_192764 ) ) ( IN-CITY ?auto_192767 ?auto_192766 ) ( IN-CITY ?auto_192762 ?auto_192766 ) ( not ( = ?auto_192762 ?auto_192767 ) ) ( OBJ-AT ?auto_192764 ?auto_192767 ) ( IN-CITY ?auto_192768 ?auto_192766 ) ( not ( = ?auto_192762 ?auto_192768 ) ) ( not ( = ?auto_192767 ?auto_192768 ) ) ( OBJ-AT ?auto_192763 ?auto_192768 ) ( not ( = ?auto_192769 ?auto_192765 ) ) ( not ( = ?auto_192764 ?auto_192769 ) ) ( not ( = ?auto_192763 ?auto_192769 ) ) ( OBJ-AT ?auto_192769 ?auto_192767 ) ( IN-TRUCK ?auto_192765 ?auto_192770 ) ( TRUCK-AT ?auto_192770 ?auto_192768 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192765 ?auto_192764 ?auto_192762 )
      ( DELIVER-3PKG-VERIFY ?auto_192763 ?auto_192764 ?auto_192765 ?auto_192762 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_192772 - OBJ
      ?auto_192773 - OBJ
      ?auto_192774 - OBJ
      ?auto_192771 - LOCATION
    )
    :vars
    (
      ?auto_192779 - OBJ
      ?auto_192776 - LOCATION
      ?auto_192775 - CITY
      ?auto_192777 - LOCATION
      ?auto_192778 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192773 ?auto_192772 ) ) ( not ( = ?auto_192774 ?auto_192772 ) ) ( not ( = ?auto_192774 ?auto_192773 ) ) ( not ( = ?auto_192773 ?auto_192779 ) ) ( IN-CITY ?auto_192776 ?auto_192775 ) ( IN-CITY ?auto_192771 ?auto_192775 ) ( not ( = ?auto_192771 ?auto_192776 ) ) ( OBJ-AT ?auto_192773 ?auto_192776 ) ( not ( = ?auto_192772 ?auto_192779 ) ) ( IN-CITY ?auto_192777 ?auto_192775 ) ( not ( = ?auto_192771 ?auto_192777 ) ) ( not ( = ?auto_192776 ?auto_192777 ) ) ( OBJ-AT ?auto_192772 ?auto_192777 ) ( not ( = ?auto_192774 ?auto_192779 ) ) ( OBJ-AT ?auto_192774 ?auto_192776 ) ( IN-TRUCK ?auto_192779 ?auto_192778 ) ( TRUCK-AT ?auto_192778 ?auto_192777 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192779 ?auto_192773 ?auto_192771 )
      ( DELIVER-3PKG-VERIFY ?auto_192772 ?auto_192773 ?auto_192774 ?auto_192771 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_192811 - OBJ
      ?auto_192812 - OBJ
      ?auto_192813 - OBJ
      ?auto_192810 - LOCATION
    )
    :vars
    (
      ?auto_192815 - LOCATION
      ?auto_192814 - CITY
      ?auto_192817 - OBJ
      ?auto_192816 - LOCATION
      ?auto_192818 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192812 ?auto_192811 ) ) ( not ( = ?auto_192813 ?auto_192811 ) ) ( not ( = ?auto_192813 ?auto_192812 ) ) ( IN-CITY ?auto_192815 ?auto_192814 ) ( IN-CITY ?auto_192810 ?auto_192814 ) ( not ( = ?auto_192810 ?auto_192815 ) ) ( OBJ-AT ?auto_192811 ?auto_192815 ) ( not ( = ?auto_192817 ?auto_192812 ) ) ( not ( = ?auto_192811 ?auto_192817 ) ) ( IN-CITY ?auto_192816 ?auto_192814 ) ( not ( = ?auto_192810 ?auto_192816 ) ) ( not ( = ?auto_192815 ?auto_192816 ) ) ( OBJ-AT ?auto_192817 ?auto_192816 ) ( not ( = ?auto_192817 ?auto_192813 ) ) ( OBJ-AT ?auto_192813 ?auto_192815 ) ( IN-TRUCK ?auto_192812 ?auto_192818 ) ( TRUCK-AT ?auto_192818 ?auto_192816 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192812 ?auto_192811 ?auto_192810 )
      ( DELIVER-3PKG-VERIFY ?auto_192811 ?auto_192812 ?auto_192813 ?auto_192810 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_192820 - OBJ
      ?auto_192821 - OBJ
      ?auto_192822 - OBJ
      ?auto_192819 - LOCATION
    )
    :vars
    (
      ?auto_192824 - LOCATION
      ?auto_192823 - CITY
      ?auto_192825 - LOCATION
      ?auto_192826 - OBJ
      ?auto_192827 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192821 ?auto_192820 ) ) ( not ( = ?auto_192822 ?auto_192820 ) ) ( not ( = ?auto_192822 ?auto_192821 ) ) ( IN-CITY ?auto_192824 ?auto_192823 ) ( IN-CITY ?auto_192819 ?auto_192823 ) ( not ( = ?auto_192819 ?auto_192824 ) ) ( OBJ-AT ?auto_192820 ?auto_192824 ) ( IN-CITY ?auto_192825 ?auto_192823 ) ( not ( = ?auto_192819 ?auto_192825 ) ) ( not ( = ?auto_192824 ?auto_192825 ) ) ( OBJ-AT ?auto_192822 ?auto_192825 ) ( not ( = ?auto_192826 ?auto_192821 ) ) ( not ( = ?auto_192820 ?auto_192826 ) ) ( not ( = ?auto_192822 ?auto_192826 ) ) ( OBJ-AT ?auto_192826 ?auto_192824 ) ( IN-TRUCK ?auto_192821 ?auto_192827 ) ( TRUCK-AT ?auto_192827 ?auto_192825 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192821 ?auto_192820 ?auto_192819 )
      ( DELIVER-3PKG-VERIFY ?auto_192820 ?auto_192821 ?auto_192822 ?auto_192819 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_192839 - OBJ
      ?auto_192840 - OBJ
      ?auto_192841 - OBJ
      ?auto_192838 - LOCATION
    )
    :vars
    (
      ?auto_192843 - LOCATION
      ?auto_192842 - CITY
      ?auto_192845 - OBJ
      ?auto_192844 - LOCATION
      ?auto_192846 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192840 ?auto_192839 ) ) ( not ( = ?auto_192841 ?auto_192839 ) ) ( not ( = ?auto_192841 ?auto_192840 ) ) ( IN-CITY ?auto_192843 ?auto_192842 ) ( IN-CITY ?auto_192838 ?auto_192842 ) ( not ( = ?auto_192838 ?auto_192843 ) ) ( OBJ-AT ?auto_192839 ?auto_192843 ) ( not ( = ?auto_192845 ?auto_192841 ) ) ( not ( = ?auto_192839 ?auto_192845 ) ) ( IN-CITY ?auto_192844 ?auto_192842 ) ( not ( = ?auto_192838 ?auto_192844 ) ) ( not ( = ?auto_192843 ?auto_192844 ) ) ( OBJ-AT ?auto_192845 ?auto_192844 ) ( not ( = ?auto_192845 ?auto_192840 ) ) ( OBJ-AT ?auto_192840 ?auto_192843 ) ( IN-TRUCK ?auto_192841 ?auto_192846 ) ( TRUCK-AT ?auto_192846 ?auto_192844 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192841 ?auto_192839 ?auto_192838 )
      ( DELIVER-3PKG-VERIFY ?auto_192839 ?auto_192840 ?auto_192841 ?auto_192838 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_192858 - OBJ
      ?auto_192859 - OBJ
      ?auto_192860 - OBJ
      ?auto_192857 - LOCATION
    )
    :vars
    (
      ?auto_192865 - OBJ
      ?auto_192862 - LOCATION
      ?auto_192861 - CITY
      ?auto_192863 - LOCATION
      ?auto_192864 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192859 ?auto_192858 ) ) ( not ( = ?auto_192860 ?auto_192858 ) ) ( not ( = ?auto_192860 ?auto_192859 ) ) ( not ( = ?auto_192858 ?auto_192865 ) ) ( IN-CITY ?auto_192862 ?auto_192861 ) ( IN-CITY ?auto_192857 ?auto_192861 ) ( not ( = ?auto_192857 ?auto_192862 ) ) ( OBJ-AT ?auto_192858 ?auto_192862 ) ( not ( = ?auto_192860 ?auto_192865 ) ) ( IN-CITY ?auto_192863 ?auto_192861 ) ( not ( = ?auto_192857 ?auto_192863 ) ) ( not ( = ?auto_192862 ?auto_192863 ) ) ( OBJ-AT ?auto_192860 ?auto_192863 ) ( not ( = ?auto_192859 ?auto_192865 ) ) ( OBJ-AT ?auto_192859 ?auto_192862 ) ( IN-TRUCK ?auto_192865 ?auto_192864 ) ( TRUCK-AT ?auto_192864 ?auto_192863 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192865 ?auto_192858 ?auto_192857 )
      ( DELIVER-3PKG-VERIFY ?auto_192858 ?auto_192859 ?auto_192860 ?auto_192857 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_192877 - OBJ
      ?auto_192878 - OBJ
      ?auto_192879 - OBJ
      ?auto_192876 - LOCATION
    )
    :vars
    (
      ?auto_192881 - LOCATION
      ?auto_192880 - CITY
      ?auto_192882 - LOCATION
      ?auto_192883 - OBJ
      ?auto_192884 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192878 ?auto_192877 ) ) ( not ( = ?auto_192879 ?auto_192877 ) ) ( not ( = ?auto_192879 ?auto_192878 ) ) ( IN-CITY ?auto_192881 ?auto_192880 ) ( IN-CITY ?auto_192876 ?auto_192880 ) ( not ( = ?auto_192876 ?auto_192881 ) ) ( OBJ-AT ?auto_192877 ?auto_192881 ) ( IN-CITY ?auto_192882 ?auto_192880 ) ( not ( = ?auto_192876 ?auto_192882 ) ) ( not ( = ?auto_192881 ?auto_192882 ) ) ( OBJ-AT ?auto_192878 ?auto_192882 ) ( not ( = ?auto_192883 ?auto_192879 ) ) ( not ( = ?auto_192877 ?auto_192883 ) ) ( not ( = ?auto_192878 ?auto_192883 ) ) ( OBJ-AT ?auto_192883 ?auto_192881 ) ( IN-TRUCK ?auto_192879 ?auto_192884 ) ( TRUCK-AT ?auto_192884 ?auto_192882 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192879 ?auto_192877 ?auto_192876 )
      ( DELIVER-3PKG-VERIFY ?auto_192877 ?auto_192878 ?auto_192879 ?auto_192876 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_192886 - OBJ
      ?auto_192887 - OBJ
      ?auto_192888 - OBJ
      ?auto_192885 - LOCATION
    )
    :vars
    (
      ?auto_192893 - OBJ
      ?auto_192890 - LOCATION
      ?auto_192889 - CITY
      ?auto_192891 - LOCATION
      ?auto_192892 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_192887 ?auto_192886 ) ) ( not ( = ?auto_192888 ?auto_192886 ) ) ( not ( = ?auto_192888 ?auto_192887 ) ) ( not ( = ?auto_192886 ?auto_192893 ) ) ( IN-CITY ?auto_192890 ?auto_192889 ) ( IN-CITY ?auto_192885 ?auto_192889 ) ( not ( = ?auto_192885 ?auto_192890 ) ) ( OBJ-AT ?auto_192886 ?auto_192890 ) ( not ( = ?auto_192887 ?auto_192893 ) ) ( IN-CITY ?auto_192891 ?auto_192889 ) ( not ( = ?auto_192885 ?auto_192891 ) ) ( not ( = ?auto_192890 ?auto_192891 ) ) ( OBJ-AT ?auto_192887 ?auto_192891 ) ( not ( = ?auto_192888 ?auto_192893 ) ) ( OBJ-AT ?auto_192888 ?auto_192890 ) ( IN-TRUCK ?auto_192893 ?auto_192892 ) ( TRUCK-AT ?auto_192892 ?auto_192891 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_192893 ?auto_192886 ?auto_192885 )
      ( DELIVER-3PKG-VERIFY ?auto_192886 ?auto_192887 ?auto_192888 ?auto_192885 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193049 - OBJ
      ?auto_193050 - OBJ
      ?auto_193051 - OBJ
      ?auto_193052 - OBJ
      ?auto_193048 - LOCATION
    )
    :vars
    (
      ?auto_193054 - LOCATION
      ?auto_193053 - CITY
      ?auto_193055 - LOCATION
      ?auto_193056 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_193050 ?auto_193049 ) ) ( not ( = ?auto_193051 ?auto_193049 ) ) ( not ( = ?auto_193051 ?auto_193050 ) ) ( not ( = ?auto_193052 ?auto_193049 ) ) ( not ( = ?auto_193052 ?auto_193050 ) ) ( not ( = ?auto_193052 ?auto_193051 ) ) ( IN-CITY ?auto_193054 ?auto_193053 ) ( IN-CITY ?auto_193048 ?auto_193053 ) ( not ( = ?auto_193048 ?auto_193054 ) ) ( OBJ-AT ?auto_193052 ?auto_193054 ) ( IN-CITY ?auto_193055 ?auto_193053 ) ( not ( = ?auto_193048 ?auto_193055 ) ) ( not ( = ?auto_193054 ?auto_193055 ) ) ( OBJ-AT ?auto_193051 ?auto_193055 ) ( OBJ-AT ?auto_193050 ?auto_193054 ) ( IN-TRUCK ?auto_193049 ?auto_193056 ) ( TRUCK-AT ?auto_193056 ?auto_193055 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_193049 ?auto_193052 ?auto_193048 )
      ( DELIVER-4PKG-VERIFY ?auto_193049 ?auto_193050 ?auto_193051 ?auto_193052 ?auto_193048 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193078 - OBJ
      ?auto_193079 - OBJ
      ?auto_193080 - OBJ
      ?auto_193081 - OBJ
      ?auto_193077 - LOCATION
    )
    :vars
    (
      ?auto_193083 - LOCATION
      ?auto_193082 - CITY
      ?auto_193084 - LOCATION
      ?auto_193085 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_193079 ?auto_193078 ) ) ( not ( = ?auto_193080 ?auto_193078 ) ) ( not ( = ?auto_193080 ?auto_193079 ) ) ( not ( = ?auto_193081 ?auto_193078 ) ) ( not ( = ?auto_193081 ?auto_193079 ) ) ( not ( = ?auto_193081 ?auto_193080 ) ) ( IN-CITY ?auto_193083 ?auto_193082 ) ( IN-CITY ?auto_193077 ?auto_193082 ) ( not ( = ?auto_193077 ?auto_193083 ) ) ( OBJ-AT ?auto_193080 ?auto_193083 ) ( IN-CITY ?auto_193084 ?auto_193082 ) ( not ( = ?auto_193077 ?auto_193084 ) ) ( not ( = ?auto_193083 ?auto_193084 ) ) ( OBJ-AT ?auto_193081 ?auto_193084 ) ( OBJ-AT ?auto_193079 ?auto_193083 ) ( IN-TRUCK ?auto_193078 ?auto_193085 ) ( TRUCK-AT ?auto_193085 ?auto_193084 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_193078 ?auto_193080 ?auto_193077 )
      ( DELIVER-4PKG-VERIFY ?auto_193078 ?auto_193079 ?auto_193080 ?auto_193081 ?auto_193077 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193107 - OBJ
      ?auto_193108 - OBJ
      ?auto_193109 - OBJ
      ?auto_193110 - OBJ
      ?auto_193106 - LOCATION
    )
    :vars
    (
      ?auto_193112 - LOCATION
      ?auto_193111 - CITY
      ?auto_193113 - LOCATION
      ?auto_193114 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_193108 ?auto_193107 ) ) ( not ( = ?auto_193109 ?auto_193107 ) ) ( not ( = ?auto_193109 ?auto_193108 ) ) ( not ( = ?auto_193110 ?auto_193107 ) ) ( not ( = ?auto_193110 ?auto_193108 ) ) ( not ( = ?auto_193110 ?auto_193109 ) ) ( IN-CITY ?auto_193112 ?auto_193111 ) ( IN-CITY ?auto_193106 ?auto_193111 ) ( not ( = ?auto_193106 ?auto_193112 ) ) ( OBJ-AT ?auto_193110 ?auto_193112 ) ( IN-CITY ?auto_193113 ?auto_193111 ) ( not ( = ?auto_193106 ?auto_193113 ) ) ( not ( = ?auto_193112 ?auto_193113 ) ) ( OBJ-AT ?auto_193108 ?auto_193113 ) ( OBJ-AT ?auto_193109 ?auto_193112 ) ( IN-TRUCK ?auto_193107 ?auto_193114 ) ( TRUCK-AT ?auto_193114 ?auto_193113 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_193107 ?auto_193110 ?auto_193106 )
      ( DELIVER-4PKG-VERIFY ?auto_193107 ?auto_193108 ?auto_193109 ?auto_193110 ?auto_193106 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193136 - OBJ
      ?auto_193137 - OBJ
      ?auto_193138 - OBJ
      ?auto_193139 - OBJ
      ?auto_193135 - LOCATION
    )
    :vars
    (
      ?auto_193141 - LOCATION
      ?auto_193140 - CITY
      ?auto_193142 - LOCATION
      ?auto_193143 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_193137 ?auto_193136 ) ) ( not ( = ?auto_193138 ?auto_193136 ) ) ( not ( = ?auto_193138 ?auto_193137 ) ) ( not ( = ?auto_193139 ?auto_193136 ) ) ( not ( = ?auto_193139 ?auto_193137 ) ) ( not ( = ?auto_193139 ?auto_193138 ) ) ( IN-CITY ?auto_193141 ?auto_193140 ) ( IN-CITY ?auto_193135 ?auto_193140 ) ( not ( = ?auto_193135 ?auto_193141 ) ) ( OBJ-AT ?auto_193138 ?auto_193141 ) ( IN-CITY ?auto_193142 ?auto_193140 ) ( not ( = ?auto_193135 ?auto_193142 ) ) ( not ( = ?auto_193141 ?auto_193142 ) ) ( OBJ-AT ?auto_193137 ?auto_193142 ) ( OBJ-AT ?auto_193139 ?auto_193141 ) ( IN-TRUCK ?auto_193136 ?auto_193143 ) ( TRUCK-AT ?auto_193143 ?auto_193142 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_193136 ?auto_193138 ?auto_193135 )
      ( DELIVER-4PKG-VERIFY ?auto_193136 ?auto_193137 ?auto_193138 ?auto_193139 ?auto_193135 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193227 - OBJ
      ?auto_193228 - OBJ
      ?auto_193229 - OBJ
      ?auto_193230 - OBJ
      ?auto_193226 - LOCATION
    )
    :vars
    (
      ?auto_193232 - LOCATION
      ?auto_193231 - CITY
      ?auto_193233 - LOCATION
      ?auto_193234 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_193228 ?auto_193227 ) ) ( not ( = ?auto_193229 ?auto_193227 ) ) ( not ( = ?auto_193229 ?auto_193228 ) ) ( not ( = ?auto_193230 ?auto_193227 ) ) ( not ( = ?auto_193230 ?auto_193228 ) ) ( not ( = ?auto_193230 ?auto_193229 ) ) ( IN-CITY ?auto_193232 ?auto_193231 ) ( IN-CITY ?auto_193226 ?auto_193231 ) ( not ( = ?auto_193226 ?auto_193232 ) ) ( OBJ-AT ?auto_193228 ?auto_193232 ) ( IN-CITY ?auto_193233 ?auto_193231 ) ( not ( = ?auto_193226 ?auto_193233 ) ) ( not ( = ?auto_193232 ?auto_193233 ) ) ( OBJ-AT ?auto_193230 ?auto_193233 ) ( OBJ-AT ?auto_193229 ?auto_193232 ) ( IN-TRUCK ?auto_193227 ?auto_193234 ) ( TRUCK-AT ?auto_193234 ?auto_193233 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_193227 ?auto_193228 ?auto_193226 )
      ( DELIVER-4PKG-VERIFY ?auto_193227 ?auto_193228 ?auto_193229 ?auto_193230 ?auto_193226 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193256 - OBJ
      ?auto_193257 - OBJ
      ?auto_193258 - OBJ
      ?auto_193259 - OBJ
      ?auto_193255 - LOCATION
    )
    :vars
    (
      ?auto_193261 - LOCATION
      ?auto_193260 - CITY
      ?auto_193262 - LOCATION
      ?auto_193263 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_193257 ?auto_193256 ) ) ( not ( = ?auto_193258 ?auto_193256 ) ) ( not ( = ?auto_193258 ?auto_193257 ) ) ( not ( = ?auto_193259 ?auto_193256 ) ) ( not ( = ?auto_193259 ?auto_193257 ) ) ( not ( = ?auto_193259 ?auto_193258 ) ) ( IN-CITY ?auto_193261 ?auto_193260 ) ( IN-CITY ?auto_193255 ?auto_193260 ) ( not ( = ?auto_193255 ?auto_193261 ) ) ( OBJ-AT ?auto_193257 ?auto_193261 ) ( IN-CITY ?auto_193262 ?auto_193260 ) ( not ( = ?auto_193255 ?auto_193262 ) ) ( not ( = ?auto_193261 ?auto_193262 ) ) ( OBJ-AT ?auto_193258 ?auto_193262 ) ( OBJ-AT ?auto_193259 ?auto_193261 ) ( IN-TRUCK ?auto_193256 ?auto_193263 ) ( TRUCK-AT ?auto_193263 ?auto_193262 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_193256 ?auto_193257 ?auto_193255 )
      ( DELIVER-4PKG-VERIFY ?auto_193256 ?auto_193257 ?auto_193258 ?auto_193259 ?auto_193255 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193347 - OBJ
      ?auto_193348 - OBJ
      ?auto_193349 - OBJ
      ?auto_193350 - OBJ
      ?auto_193346 - LOCATION
    )
    :vars
    (
      ?auto_193352 - LOCATION
      ?auto_193351 - CITY
      ?auto_193353 - LOCATION
      ?auto_193354 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_193348 ?auto_193347 ) ) ( not ( = ?auto_193349 ?auto_193347 ) ) ( not ( = ?auto_193349 ?auto_193348 ) ) ( not ( = ?auto_193350 ?auto_193347 ) ) ( not ( = ?auto_193350 ?auto_193348 ) ) ( not ( = ?auto_193350 ?auto_193349 ) ) ( IN-CITY ?auto_193352 ?auto_193351 ) ( IN-CITY ?auto_193346 ?auto_193351 ) ( not ( = ?auto_193346 ?auto_193352 ) ) ( OBJ-AT ?auto_193350 ?auto_193352 ) ( IN-CITY ?auto_193353 ?auto_193351 ) ( not ( = ?auto_193346 ?auto_193353 ) ) ( not ( = ?auto_193352 ?auto_193353 ) ) ( OBJ-AT ?auto_193349 ?auto_193353 ) ( OBJ-AT ?auto_193347 ?auto_193352 ) ( IN-TRUCK ?auto_193348 ?auto_193354 ) ( TRUCK-AT ?auto_193354 ?auto_193353 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_193348 ?auto_193350 ?auto_193346 )
      ( DELIVER-4PKG-VERIFY ?auto_193347 ?auto_193348 ?auto_193349 ?auto_193350 ?auto_193346 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193376 - OBJ
      ?auto_193377 - OBJ
      ?auto_193378 - OBJ
      ?auto_193379 - OBJ
      ?auto_193375 - LOCATION
    )
    :vars
    (
      ?auto_193381 - LOCATION
      ?auto_193380 - CITY
      ?auto_193382 - LOCATION
      ?auto_193383 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_193377 ?auto_193376 ) ) ( not ( = ?auto_193378 ?auto_193376 ) ) ( not ( = ?auto_193378 ?auto_193377 ) ) ( not ( = ?auto_193379 ?auto_193376 ) ) ( not ( = ?auto_193379 ?auto_193377 ) ) ( not ( = ?auto_193379 ?auto_193378 ) ) ( IN-CITY ?auto_193381 ?auto_193380 ) ( IN-CITY ?auto_193375 ?auto_193380 ) ( not ( = ?auto_193375 ?auto_193381 ) ) ( OBJ-AT ?auto_193378 ?auto_193381 ) ( IN-CITY ?auto_193382 ?auto_193380 ) ( not ( = ?auto_193375 ?auto_193382 ) ) ( not ( = ?auto_193381 ?auto_193382 ) ) ( OBJ-AT ?auto_193379 ?auto_193382 ) ( OBJ-AT ?auto_193376 ?auto_193381 ) ( IN-TRUCK ?auto_193377 ?auto_193383 ) ( TRUCK-AT ?auto_193383 ?auto_193382 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_193377 ?auto_193378 ?auto_193375 )
      ( DELIVER-4PKG-VERIFY ?auto_193376 ?auto_193377 ?auto_193378 ?auto_193379 ?auto_193375 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193468 - OBJ
      ?auto_193469 - OBJ
      ?auto_193470 - OBJ
      ?auto_193471 - OBJ
      ?auto_193467 - LOCATION
    )
    :vars
    (
      ?auto_193473 - LOCATION
      ?auto_193472 - CITY
      ?auto_193474 - LOCATION
      ?auto_193475 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_193469 ?auto_193468 ) ) ( not ( = ?auto_193470 ?auto_193468 ) ) ( not ( = ?auto_193470 ?auto_193469 ) ) ( not ( = ?auto_193471 ?auto_193468 ) ) ( not ( = ?auto_193471 ?auto_193469 ) ) ( not ( = ?auto_193471 ?auto_193470 ) ) ( IN-CITY ?auto_193473 ?auto_193472 ) ( IN-CITY ?auto_193467 ?auto_193472 ) ( not ( = ?auto_193467 ?auto_193473 ) ) ( OBJ-AT ?auto_193471 ?auto_193473 ) ( IN-CITY ?auto_193474 ?auto_193472 ) ( not ( = ?auto_193467 ?auto_193474 ) ) ( not ( = ?auto_193473 ?auto_193474 ) ) ( OBJ-AT ?auto_193469 ?auto_193474 ) ( OBJ-AT ?auto_193468 ?auto_193473 ) ( IN-TRUCK ?auto_193470 ?auto_193475 ) ( TRUCK-AT ?auto_193475 ?auto_193474 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_193470 ?auto_193471 ?auto_193467 )
      ( DELIVER-4PKG-VERIFY ?auto_193468 ?auto_193469 ?auto_193470 ?auto_193471 ?auto_193467 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193497 - OBJ
      ?auto_193498 - OBJ
      ?auto_193499 - OBJ
      ?auto_193500 - OBJ
      ?auto_193496 - LOCATION
    )
    :vars
    (
      ?auto_193502 - LOCATION
      ?auto_193501 - CITY
      ?auto_193503 - LOCATION
      ?auto_193504 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_193498 ?auto_193497 ) ) ( not ( = ?auto_193499 ?auto_193497 ) ) ( not ( = ?auto_193499 ?auto_193498 ) ) ( not ( = ?auto_193500 ?auto_193497 ) ) ( not ( = ?auto_193500 ?auto_193498 ) ) ( not ( = ?auto_193500 ?auto_193499 ) ) ( IN-CITY ?auto_193502 ?auto_193501 ) ( IN-CITY ?auto_193496 ?auto_193501 ) ( not ( = ?auto_193496 ?auto_193502 ) ) ( OBJ-AT ?auto_193499 ?auto_193502 ) ( IN-CITY ?auto_193503 ?auto_193501 ) ( not ( = ?auto_193496 ?auto_193503 ) ) ( not ( = ?auto_193502 ?auto_193503 ) ) ( OBJ-AT ?auto_193498 ?auto_193503 ) ( OBJ-AT ?auto_193497 ?auto_193502 ) ( IN-TRUCK ?auto_193500 ?auto_193504 ) ( TRUCK-AT ?auto_193504 ?auto_193503 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_193500 ?auto_193499 ?auto_193496 )
      ( DELIVER-4PKG-VERIFY ?auto_193497 ?auto_193498 ?auto_193499 ?auto_193500 ?auto_193496 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193556 - OBJ
      ?auto_193557 - OBJ
      ?auto_193558 - OBJ
      ?auto_193559 - OBJ
      ?auto_193555 - LOCATION
    )
    :vars
    (
      ?auto_193561 - LOCATION
      ?auto_193560 - CITY
      ?auto_193562 - LOCATION
      ?auto_193563 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_193557 ?auto_193556 ) ) ( not ( = ?auto_193558 ?auto_193556 ) ) ( not ( = ?auto_193558 ?auto_193557 ) ) ( not ( = ?auto_193559 ?auto_193556 ) ) ( not ( = ?auto_193559 ?auto_193557 ) ) ( not ( = ?auto_193559 ?auto_193558 ) ) ( IN-CITY ?auto_193561 ?auto_193560 ) ( IN-CITY ?auto_193555 ?auto_193560 ) ( not ( = ?auto_193555 ?auto_193561 ) ) ( OBJ-AT ?auto_193557 ?auto_193561 ) ( IN-CITY ?auto_193562 ?auto_193560 ) ( not ( = ?auto_193555 ?auto_193562 ) ) ( not ( = ?auto_193561 ?auto_193562 ) ) ( OBJ-AT ?auto_193559 ?auto_193562 ) ( OBJ-AT ?auto_193556 ?auto_193561 ) ( IN-TRUCK ?auto_193558 ?auto_193563 ) ( TRUCK-AT ?auto_193563 ?auto_193562 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_193558 ?auto_193557 ?auto_193555 )
      ( DELIVER-4PKG-VERIFY ?auto_193556 ?auto_193557 ?auto_193558 ?auto_193559 ?auto_193555 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193617 - OBJ
      ?auto_193618 - OBJ
      ?auto_193619 - OBJ
      ?auto_193620 - OBJ
      ?auto_193616 - LOCATION
    )
    :vars
    (
      ?auto_193622 - LOCATION
      ?auto_193621 - CITY
      ?auto_193623 - LOCATION
      ?auto_193624 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_193618 ?auto_193617 ) ) ( not ( = ?auto_193619 ?auto_193617 ) ) ( not ( = ?auto_193619 ?auto_193618 ) ) ( not ( = ?auto_193620 ?auto_193617 ) ) ( not ( = ?auto_193620 ?auto_193618 ) ) ( not ( = ?auto_193620 ?auto_193619 ) ) ( IN-CITY ?auto_193622 ?auto_193621 ) ( IN-CITY ?auto_193616 ?auto_193621 ) ( not ( = ?auto_193616 ?auto_193622 ) ) ( OBJ-AT ?auto_193618 ?auto_193622 ) ( IN-CITY ?auto_193623 ?auto_193621 ) ( not ( = ?auto_193616 ?auto_193623 ) ) ( not ( = ?auto_193622 ?auto_193623 ) ) ( OBJ-AT ?auto_193619 ?auto_193623 ) ( OBJ-AT ?auto_193617 ?auto_193622 ) ( IN-TRUCK ?auto_193620 ?auto_193624 ) ( TRUCK-AT ?auto_193624 ?auto_193623 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_193620 ?auto_193618 ?auto_193616 )
      ( DELIVER-4PKG-VERIFY ?auto_193617 ?auto_193618 ?auto_193619 ?auto_193620 ?auto_193616 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193708 - OBJ
      ?auto_193709 - OBJ
      ?auto_193710 - OBJ
      ?auto_193711 - OBJ
      ?auto_193707 - LOCATION
    )
    :vars
    (
      ?auto_193713 - LOCATION
      ?auto_193712 - CITY
      ?auto_193714 - LOCATION
      ?auto_193715 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_193709 ?auto_193708 ) ) ( not ( = ?auto_193710 ?auto_193708 ) ) ( not ( = ?auto_193710 ?auto_193709 ) ) ( not ( = ?auto_193711 ?auto_193708 ) ) ( not ( = ?auto_193711 ?auto_193709 ) ) ( not ( = ?auto_193711 ?auto_193710 ) ) ( IN-CITY ?auto_193713 ?auto_193712 ) ( IN-CITY ?auto_193707 ?auto_193712 ) ( not ( = ?auto_193707 ?auto_193713 ) ) ( OBJ-AT ?auto_193711 ?auto_193713 ) ( IN-CITY ?auto_193714 ?auto_193712 ) ( not ( = ?auto_193707 ?auto_193714 ) ) ( not ( = ?auto_193713 ?auto_193714 ) ) ( OBJ-AT ?auto_193708 ?auto_193714 ) ( OBJ-AT ?auto_193710 ?auto_193713 ) ( IN-TRUCK ?auto_193709 ?auto_193715 ) ( TRUCK-AT ?auto_193715 ?auto_193714 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_193709 ?auto_193711 ?auto_193707 )
      ( DELIVER-4PKG-VERIFY ?auto_193708 ?auto_193709 ?auto_193710 ?auto_193711 ?auto_193707 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193737 - OBJ
      ?auto_193738 - OBJ
      ?auto_193739 - OBJ
      ?auto_193740 - OBJ
      ?auto_193736 - LOCATION
    )
    :vars
    (
      ?auto_193742 - LOCATION
      ?auto_193741 - CITY
      ?auto_193743 - LOCATION
      ?auto_193744 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_193738 ?auto_193737 ) ) ( not ( = ?auto_193739 ?auto_193737 ) ) ( not ( = ?auto_193739 ?auto_193738 ) ) ( not ( = ?auto_193740 ?auto_193737 ) ) ( not ( = ?auto_193740 ?auto_193738 ) ) ( not ( = ?auto_193740 ?auto_193739 ) ) ( IN-CITY ?auto_193742 ?auto_193741 ) ( IN-CITY ?auto_193736 ?auto_193741 ) ( not ( = ?auto_193736 ?auto_193742 ) ) ( OBJ-AT ?auto_193739 ?auto_193742 ) ( IN-CITY ?auto_193743 ?auto_193741 ) ( not ( = ?auto_193736 ?auto_193743 ) ) ( not ( = ?auto_193742 ?auto_193743 ) ) ( OBJ-AT ?auto_193737 ?auto_193743 ) ( OBJ-AT ?auto_193740 ?auto_193742 ) ( IN-TRUCK ?auto_193738 ?auto_193744 ) ( TRUCK-AT ?auto_193744 ?auto_193743 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_193738 ?auto_193739 ?auto_193736 )
      ( DELIVER-4PKG-VERIFY ?auto_193737 ?auto_193738 ?auto_193739 ?auto_193740 ?auto_193736 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193766 - OBJ
      ?auto_193767 - OBJ
      ?auto_193768 - OBJ
      ?auto_193769 - OBJ
      ?auto_193765 - LOCATION
    )
    :vars
    (
      ?auto_193771 - LOCATION
      ?auto_193770 - CITY
      ?auto_193772 - LOCATION
      ?auto_193773 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_193767 ?auto_193766 ) ) ( not ( = ?auto_193768 ?auto_193766 ) ) ( not ( = ?auto_193768 ?auto_193767 ) ) ( not ( = ?auto_193769 ?auto_193766 ) ) ( not ( = ?auto_193769 ?auto_193767 ) ) ( not ( = ?auto_193769 ?auto_193768 ) ) ( IN-CITY ?auto_193771 ?auto_193770 ) ( IN-CITY ?auto_193765 ?auto_193770 ) ( not ( = ?auto_193765 ?auto_193771 ) ) ( OBJ-AT ?auto_193769 ?auto_193771 ) ( IN-CITY ?auto_193772 ?auto_193770 ) ( not ( = ?auto_193765 ?auto_193772 ) ) ( not ( = ?auto_193771 ?auto_193772 ) ) ( OBJ-AT ?auto_193766 ?auto_193772 ) ( OBJ-AT ?auto_193767 ?auto_193771 ) ( IN-TRUCK ?auto_193768 ?auto_193773 ) ( TRUCK-AT ?auto_193773 ?auto_193772 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_193768 ?auto_193769 ?auto_193765 )
      ( DELIVER-4PKG-VERIFY ?auto_193766 ?auto_193767 ?auto_193768 ?auto_193769 ?auto_193765 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193795 - OBJ
      ?auto_193796 - OBJ
      ?auto_193797 - OBJ
      ?auto_193798 - OBJ
      ?auto_193794 - LOCATION
    )
    :vars
    (
      ?auto_193800 - LOCATION
      ?auto_193799 - CITY
      ?auto_193801 - LOCATION
      ?auto_193802 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_193796 ?auto_193795 ) ) ( not ( = ?auto_193797 ?auto_193795 ) ) ( not ( = ?auto_193797 ?auto_193796 ) ) ( not ( = ?auto_193798 ?auto_193795 ) ) ( not ( = ?auto_193798 ?auto_193796 ) ) ( not ( = ?auto_193798 ?auto_193797 ) ) ( IN-CITY ?auto_193800 ?auto_193799 ) ( IN-CITY ?auto_193794 ?auto_193799 ) ( not ( = ?auto_193794 ?auto_193800 ) ) ( OBJ-AT ?auto_193797 ?auto_193800 ) ( IN-CITY ?auto_193801 ?auto_193799 ) ( not ( = ?auto_193794 ?auto_193801 ) ) ( not ( = ?auto_193800 ?auto_193801 ) ) ( OBJ-AT ?auto_193795 ?auto_193801 ) ( OBJ-AT ?auto_193796 ?auto_193800 ) ( IN-TRUCK ?auto_193798 ?auto_193802 ) ( TRUCK-AT ?auto_193802 ?auto_193801 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_193798 ?auto_193797 ?auto_193794 )
      ( DELIVER-4PKG-VERIFY ?auto_193795 ?auto_193796 ?auto_193797 ?auto_193798 ?auto_193794 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193917 - OBJ
      ?auto_193918 - OBJ
      ?auto_193919 - OBJ
      ?auto_193920 - OBJ
      ?auto_193916 - LOCATION
    )
    :vars
    (
      ?auto_193922 - LOCATION
      ?auto_193921 - CITY
      ?auto_193923 - LOCATION
      ?auto_193924 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_193918 ?auto_193917 ) ) ( not ( = ?auto_193919 ?auto_193917 ) ) ( not ( = ?auto_193919 ?auto_193918 ) ) ( not ( = ?auto_193920 ?auto_193917 ) ) ( not ( = ?auto_193920 ?auto_193918 ) ) ( not ( = ?auto_193920 ?auto_193919 ) ) ( IN-CITY ?auto_193922 ?auto_193921 ) ( IN-CITY ?auto_193916 ?auto_193921 ) ( not ( = ?auto_193916 ?auto_193922 ) ) ( OBJ-AT ?auto_193918 ?auto_193922 ) ( IN-CITY ?auto_193923 ?auto_193921 ) ( not ( = ?auto_193916 ?auto_193923 ) ) ( not ( = ?auto_193922 ?auto_193923 ) ) ( OBJ-AT ?auto_193917 ?auto_193923 ) ( OBJ-AT ?auto_193920 ?auto_193922 ) ( IN-TRUCK ?auto_193919 ?auto_193924 ) ( TRUCK-AT ?auto_193924 ?auto_193923 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_193919 ?auto_193918 ?auto_193916 )
      ( DELIVER-4PKG-VERIFY ?auto_193917 ?auto_193918 ?auto_193919 ?auto_193920 ?auto_193916 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193946 - OBJ
      ?auto_193947 - OBJ
      ?auto_193948 - OBJ
      ?auto_193949 - OBJ
      ?auto_193945 - LOCATION
    )
    :vars
    (
      ?auto_193951 - LOCATION
      ?auto_193950 - CITY
      ?auto_193952 - LOCATION
      ?auto_193953 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_193947 ?auto_193946 ) ) ( not ( = ?auto_193948 ?auto_193946 ) ) ( not ( = ?auto_193948 ?auto_193947 ) ) ( not ( = ?auto_193949 ?auto_193946 ) ) ( not ( = ?auto_193949 ?auto_193947 ) ) ( not ( = ?auto_193949 ?auto_193948 ) ) ( IN-CITY ?auto_193951 ?auto_193950 ) ( IN-CITY ?auto_193945 ?auto_193950 ) ( not ( = ?auto_193945 ?auto_193951 ) ) ( OBJ-AT ?auto_193947 ?auto_193951 ) ( IN-CITY ?auto_193952 ?auto_193950 ) ( not ( = ?auto_193945 ?auto_193952 ) ) ( not ( = ?auto_193951 ?auto_193952 ) ) ( OBJ-AT ?auto_193946 ?auto_193952 ) ( OBJ-AT ?auto_193948 ?auto_193951 ) ( IN-TRUCK ?auto_193949 ?auto_193953 ) ( TRUCK-AT ?auto_193953 ?auto_193952 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_193949 ?auto_193947 ?auto_193945 )
      ( DELIVER-4PKG-VERIFY ?auto_193946 ?auto_193947 ?auto_193948 ?auto_193949 ?auto_193945 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194131 - OBJ
      ?auto_194132 - OBJ
      ?auto_194133 - OBJ
      ?auto_194134 - OBJ
      ?auto_194130 - LOCATION
    )
    :vars
    (
      ?auto_194136 - LOCATION
      ?auto_194135 - CITY
      ?auto_194137 - LOCATION
      ?auto_194138 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194132 ?auto_194131 ) ) ( not ( = ?auto_194133 ?auto_194131 ) ) ( not ( = ?auto_194133 ?auto_194132 ) ) ( not ( = ?auto_194134 ?auto_194131 ) ) ( not ( = ?auto_194134 ?auto_194132 ) ) ( not ( = ?auto_194134 ?auto_194133 ) ) ( IN-CITY ?auto_194136 ?auto_194135 ) ( IN-CITY ?auto_194130 ?auto_194135 ) ( not ( = ?auto_194130 ?auto_194136 ) ) ( OBJ-AT ?auto_194131 ?auto_194136 ) ( IN-CITY ?auto_194137 ?auto_194135 ) ( not ( = ?auto_194130 ?auto_194137 ) ) ( not ( = ?auto_194136 ?auto_194137 ) ) ( OBJ-AT ?auto_194134 ?auto_194137 ) ( OBJ-AT ?auto_194133 ?auto_194136 ) ( IN-TRUCK ?auto_194132 ?auto_194138 ) ( TRUCK-AT ?auto_194138 ?auto_194137 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194132 ?auto_194131 ?auto_194130 )
      ( DELIVER-4PKG-VERIFY ?auto_194131 ?auto_194132 ?auto_194133 ?auto_194134 ?auto_194130 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194160 - OBJ
      ?auto_194161 - OBJ
      ?auto_194162 - OBJ
      ?auto_194163 - OBJ
      ?auto_194159 - LOCATION
    )
    :vars
    (
      ?auto_194165 - LOCATION
      ?auto_194164 - CITY
      ?auto_194166 - LOCATION
      ?auto_194167 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194161 ?auto_194160 ) ) ( not ( = ?auto_194162 ?auto_194160 ) ) ( not ( = ?auto_194162 ?auto_194161 ) ) ( not ( = ?auto_194163 ?auto_194160 ) ) ( not ( = ?auto_194163 ?auto_194161 ) ) ( not ( = ?auto_194163 ?auto_194162 ) ) ( IN-CITY ?auto_194165 ?auto_194164 ) ( IN-CITY ?auto_194159 ?auto_194164 ) ( not ( = ?auto_194159 ?auto_194165 ) ) ( OBJ-AT ?auto_194160 ?auto_194165 ) ( IN-CITY ?auto_194166 ?auto_194164 ) ( not ( = ?auto_194159 ?auto_194166 ) ) ( not ( = ?auto_194165 ?auto_194166 ) ) ( OBJ-AT ?auto_194162 ?auto_194166 ) ( OBJ-AT ?auto_194163 ?auto_194165 ) ( IN-TRUCK ?auto_194161 ?auto_194167 ) ( TRUCK-AT ?auto_194167 ?auto_194166 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194161 ?auto_194160 ?auto_194159 )
      ( DELIVER-4PKG-VERIFY ?auto_194160 ?auto_194161 ?auto_194162 ?auto_194163 ?auto_194159 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194251 - OBJ
      ?auto_194252 - OBJ
      ?auto_194253 - OBJ
      ?auto_194254 - OBJ
      ?auto_194250 - LOCATION
    )
    :vars
    (
      ?auto_194256 - LOCATION
      ?auto_194255 - CITY
      ?auto_194257 - LOCATION
      ?auto_194258 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194252 ?auto_194251 ) ) ( not ( = ?auto_194253 ?auto_194251 ) ) ( not ( = ?auto_194253 ?auto_194252 ) ) ( not ( = ?auto_194254 ?auto_194251 ) ) ( not ( = ?auto_194254 ?auto_194252 ) ) ( not ( = ?auto_194254 ?auto_194253 ) ) ( IN-CITY ?auto_194256 ?auto_194255 ) ( IN-CITY ?auto_194250 ?auto_194255 ) ( not ( = ?auto_194250 ?auto_194256 ) ) ( OBJ-AT ?auto_194251 ?auto_194256 ) ( IN-CITY ?auto_194257 ?auto_194255 ) ( not ( = ?auto_194250 ?auto_194257 ) ) ( not ( = ?auto_194256 ?auto_194257 ) ) ( OBJ-AT ?auto_194254 ?auto_194257 ) ( OBJ-AT ?auto_194252 ?auto_194256 ) ( IN-TRUCK ?auto_194253 ?auto_194258 ) ( TRUCK-AT ?auto_194258 ?auto_194257 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194253 ?auto_194251 ?auto_194250 )
      ( DELIVER-4PKG-VERIFY ?auto_194251 ?auto_194252 ?auto_194253 ?auto_194254 ?auto_194250 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194312 - OBJ
      ?auto_194313 - OBJ
      ?auto_194314 - OBJ
      ?auto_194315 - OBJ
      ?auto_194311 - LOCATION
    )
    :vars
    (
      ?auto_194317 - LOCATION
      ?auto_194316 - CITY
      ?auto_194318 - LOCATION
      ?auto_194319 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194313 ?auto_194312 ) ) ( not ( = ?auto_194314 ?auto_194312 ) ) ( not ( = ?auto_194314 ?auto_194313 ) ) ( not ( = ?auto_194315 ?auto_194312 ) ) ( not ( = ?auto_194315 ?auto_194313 ) ) ( not ( = ?auto_194315 ?auto_194314 ) ) ( IN-CITY ?auto_194317 ?auto_194316 ) ( IN-CITY ?auto_194311 ?auto_194316 ) ( not ( = ?auto_194311 ?auto_194317 ) ) ( OBJ-AT ?auto_194312 ?auto_194317 ) ( IN-CITY ?auto_194318 ?auto_194316 ) ( not ( = ?auto_194311 ?auto_194318 ) ) ( not ( = ?auto_194317 ?auto_194318 ) ) ( OBJ-AT ?auto_194314 ?auto_194318 ) ( OBJ-AT ?auto_194313 ?auto_194317 ) ( IN-TRUCK ?auto_194315 ?auto_194319 ) ( TRUCK-AT ?auto_194319 ?auto_194318 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194315 ?auto_194312 ?auto_194311 )
      ( DELIVER-4PKG-VERIFY ?auto_194312 ?auto_194313 ?auto_194314 ?auto_194315 ?auto_194311 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194403 - OBJ
      ?auto_194404 - OBJ
      ?auto_194405 - OBJ
      ?auto_194406 - OBJ
      ?auto_194402 - LOCATION
    )
    :vars
    (
      ?auto_194408 - LOCATION
      ?auto_194407 - CITY
      ?auto_194409 - LOCATION
      ?auto_194410 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194404 ?auto_194403 ) ) ( not ( = ?auto_194405 ?auto_194403 ) ) ( not ( = ?auto_194405 ?auto_194404 ) ) ( not ( = ?auto_194406 ?auto_194403 ) ) ( not ( = ?auto_194406 ?auto_194404 ) ) ( not ( = ?auto_194406 ?auto_194405 ) ) ( IN-CITY ?auto_194408 ?auto_194407 ) ( IN-CITY ?auto_194402 ?auto_194407 ) ( not ( = ?auto_194402 ?auto_194408 ) ) ( OBJ-AT ?auto_194403 ?auto_194408 ) ( IN-CITY ?auto_194409 ?auto_194407 ) ( not ( = ?auto_194402 ?auto_194409 ) ) ( not ( = ?auto_194408 ?auto_194409 ) ) ( OBJ-AT ?auto_194404 ?auto_194409 ) ( OBJ-AT ?auto_194406 ?auto_194408 ) ( IN-TRUCK ?auto_194405 ?auto_194410 ) ( TRUCK-AT ?auto_194410 ?auto_194409 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194405 ?auto_194403 ?auto_194402 )
      ( DELIVER-4PKG-VERIFY ?auto_194403 ?auto_194404 ?auto_194405 ?auto_194406 ?auto_194402 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194432 - OBJ
      ?auto_194433 - OBJ
      ?auto_194434 - OBJ
      ?auto_194435 - OBJ
      ?auto_194431 - LOCATION
    )
    :vars
    (
      ?auto_194437 - LOCATION
      ?auto_194436 - CITY
      ?auto_194438 - LOCATION
      ?auto_194439 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194433 ?auto_194432 ) ) ( not ( = ?auto_194434 ?auto_194432 ) ) ( not ( = ?auto_194434 ?auto_194433 ) ) ( not ( = ?auto_194435 ?auto_194432 ) ) ( not ( = ?auto_194435 ?auto_194433 ) ) ( not ( = ?auto_194435 ?auto_194434 ) ) ( IN-CITY ?auto_194437 ?auto_194436 ) ( IN-CITY ?auto_194431 ?auto_194436 ) ( not ( = ?auto_194431 ?auto_194437 ) ) ( OBJ-AT ?auto_194432 ?auto_194437 ) ( IN-CITY ?auto_194438 ?auto_194436 ) ( not ( = ?auto_194431 ?auto_194438 ) ) ( not ( = ?auto_194437 ?auto_194438 ) ) ( OBJ-AT ?auto_194433 ?auto_194438 ) ( OBJ-AT ?auto_194434 ?auto_194437 ) ( IN-TRUCK ?auto_194435 ?auto_194439 ) ( TRUCK-AT ?auto_194439 ?auto_194438 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194435 ?auto_194432 ?auto_194431 )
      ( DELIVER-4PKG-VERIFY ?auto_194432 ?auto_194433 ?auto_194434 ?auto_194435 ?auto_194431 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_194726 - OBJ
      ?auto_194725 - LOCATION
    )
    :vars
    (
      ?auto_194733 - OBJ
      ?auto_194728 - LOCATION
      ?auto_194727 - CITY
      ?auto_194730 - OBJ
      ?auto_194729 - LOCATION
      ?auto_194731 - OBJ
      ?auto_194732 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194726 ?auto_194733 ) ) ( IN-CITY ?auto_194728 ?auto_194727 ) ( IN-CITY ?auto_194725 ?auto_194727 ) ( not ( = ?auto_194725 ?auto_194728 ) ) ( OBJ-AT ?auto_194726 ?auto_194728 ) ( not ( = ?auto_194730 ?auto_194733 ) ) ( not ( = ?auto_194726 ?auto_194730 ) ) ( IN-CITY ?auto_194729 ?auto_194727 ) ( not ( = ?auto_194725 ?auto_194729 ) ) ( not ( = ?auto_194728 ?auto_194729 ) ) ( OBJ-AT ?auto_194730 ?auto_194729 ) ( not ( = ?auto_194731 ?auto_194733 ) ) ( not ( = ?auto_194726 ?auto_194731 ) ) ( not ( = ?auto_194730 ?auto_194731 ) ) ( OBJ-AT ?auto_194731 ?auto_194728 ) ( TRUCK-AT ?auto_194732 ?auto_194729 ) ( OBJ-AT ?auto_194733 ?auto_194729 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_194733 ?auto_194732 ?auto_194729 )
      ( DELIVER-2PKG ?auto_194733 ?auto_194726 ?auto_194725 )
      ( DELIVER-1PKG-VERIFY ?auto_194726 ?auto_194725 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_194735 - OBJ
      ?auto_194736 - OBJ
      ?auto_194734 - LOCATION
    )
    :vars
    (
      ?auto_194742 - LOCATION
      ?auto_194738 - CITY
      ?auto_194740 - OBJ
      ?auto_194739 - LOCATION
      ?auto_194737 - OBJ
      ?auto_194741 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194736 ?auto_194735 ) ) ( IN-CITY ?auto_194742 ?auto_194738 ) ( IN-CITY ?auto_194734 ?auto_194738 ) ( not ( = ?auto_194734 ?auto_194742 ) ) ( OBJ-AT ?auto_194736 ?auto_194742 ) ( not ( = ?auto_194740 ?auto_194735 ) ) ( not ( = ?auto_194736 ?auto_194740 ) ) ( IN-CITY ?auto_194739 ?auto_194738 ) ( not ( = ?auto_194734 ?auto_194739 ) ) ( not ( = ?auto_194742 ?auto_194739 ) ) ( OBJ-AT ?auto_194740 ?auto_194739 ) ( not ( = ?auto_194737 ?auto_194735 ) ) ( not ( = ?auto_194736 ?auto_194737 ) ) ( not ( = ?auto_194740 ?auto_194737 ) ) ( OBJ-AT ?auto_194737 ?auto_194742 ) ( TRUCK-AT ?auto_194741 ?auto_194739 ) ( OBJ-AT ?auto_194735 ?auto_194739 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_194736 ?auto_194734 )
      ( DELIVER-2PKG-VERIFY ?auto_194735 ?auto_194736 ?auto_194734 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_194744 - OBJ
      ?auto_194745 - OBJ
      ?auto_194743 - LOCATION
    )
    :vars
    (
      ?auto_194751 - OBJ
      ?auto_194746 - LOCATION
      ?auto_194749 - CITY
      ?auto_194747 - OBJ
      ?auto_194750 - LOCATION
      ?auto_194748 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194745 ?auto_194744 ) ) ( not ( = ?auto_194745 ?auto_194751 ) ) ( IN-CITY ?auto_194746 ?auto_194749 ) ( IN-CITY ?auto_194743 ?auto_194749 ) ( not ( = ?auto_194743 ?auto_194746 ) ) ( OBJ-AT ?auto_194745 ?auto_194746 ) ( not ( = ?auto_194747 ?auto_194751 ) ) ( not ( = ?auto_194745 ?auto_194747 ) ) ( IN-CITY ?auto_194750 ?auto_194749 ) ( not ( = ?auto_194743 ?auto_194750 ) ) ( not ( = ?auto_194746 ?auto_194750 ) ) ( OBJ-AT ?auto_194747 ?auto_194750 ) ( not ( = ?auto_194744 ?auto_194751 ) ) ( not ( = ?auto_194747 ?auto_194744 ) ) ( OBJ-AT ?auto_194744 ?auto_194746 ) ( TRUCK-AT ?auto_194748 ?auto_194750 ) ( OBJ-AT ?auto_194751 ?auto_194750 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194751 ?auto_194745 ?auto_194743 )
      ( DELIVER-2PKG-VERIFY ?auto_194744 ?auto_194745 ?auto_194743 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_194753 - OBJ
      ?auto_194754 - OBJ
      ?auto_194752 - LOCATION
    )
    :vars
    (
      ?auto_194760 - OBJ
      ?auto_194755 - LOCATION
      ?auto_194757 - CITY
      ?auto_194758 - LOCATION
      ?auto_194759 - OBJ
      ?auto_194756 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194754 ?auto_194753 ) ) ( not ( = ?auto_194754 ?auto_194760 ) ) ( IN-CITY ?auto_194755 ?auto_194757 ) ( IN-CITY ?auto_194752 ?auto_194757 ) ( not ( = ?auto_194752 ?auto_194755 ) ) ( OBJ-AT ?auto_194754 ?auto_194755 ) ( not ( = ?auto_194753 ?auto_194760 ) ) ( IN-CITY ?auto_194758 ?auto_194757 ) ( not ( = ?auto_194752 ?auto_194758 ) ) ( not ( = ?auto_194755 ?auto_194758 ) ) ( OBJ-AT ?auto_194753 ?auto_194758 ) ( not ( = ?auto_194759 ?auto_194760 ) ) ( not ( = ?auto_194754 ?auto_194759 ) ) ( not ( = ?auto_194753 ?auto_194759 ) ) ( OBJ-AT ?auto_194759 ?auto_194755 ) ( TRUCK-AT ?auto_194756 ?auto_194758 ) ( OBJ-AT ?auto_194760 ?auto_194758 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194760 ?auto_194754 ?auto_194752 )
      ( DELIVER-2PKG-VERIFY ?auto_194753 ?auto_194754 ?auto_194752 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_194762 - OBJ
      ?auto_194763 - OBJ
      ?auto_194761 - LOCATION
    )
    :vars
    (
      ?auto_194764 - LOCATION
      ?auto_194767 - CITY
      ?auto_194765 - OBJ
      ?auto_194768 - LOCATION
      ?auto_194769 - OBJ
      ?auto_194766 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194763 ?auto_194762 ) ) ( IN-CITY ?auto_194764 ?auto_194767 ) ( IN-CITY ?auto_194761 ?auto_194767 ) ( not ( = ?auto_194761 ?auto_194764 ) ) ( OBJ-AT ?auto_194762 ?auto_194764 ) ( not ( = ?auto_194765 ?auto_194763 ) ) ( not ( = ?auto_194762 ?auto_194765 ) ) ( IN-CITY ?auto_194768 ?auto_194767 ) ( not ( = ?auto_194761 ?auto_194768 ) ) ( not ( = ?auto_194764 ?auto_194768 ) ) ( OBJ-AT ?auto_194765 ?auto_194768 ) ( not ( = ?auto_194769 ?auto_194763 ) ) ( not ( = ?auto_194762 ?auto_194769 ) ) ( not ( = ?auto_194765 ?auto_194769 ) ) ( OBJ-AT ?auto_194769 ?auto_194764 ) ( TRUCK-AT ?auto_194766 ?auto_194768 ) ( OBJ-AT ?auto_194763 ?auto_194768 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194763 ?auto_194762 ?auto_194761 )
      ( DELIVER-2PKG-VERIFY ?auto_194762 ?auto_194763 ?auto_194761 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_194771 - OBJ
      ?auto_194772 - OBJ
      ?auto_194770 - LOCATION
    )
    :vars
    (
      ?auto_194778 - OBJ
      ?auto_194773 - LOCATION
      ?auto_194776 - CITY
      ?auto_194774 - OBJ
      ?auto_194777 - LOCATION
      ?auto_194775 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194772 ?auto_194771 ) ) ( not ( = ?auto_194771 ?auto_194778 ) ) ( IN-CITY ?auto_194773 ?auto_194776 ) ( IN-CITY ?auto_194770 ?auto_194776 ) ( not ( = ?auto_194770 ?auto_194773 ) ) ( OBJ-AT ?auto_194771 ?auto_194773 ) ( not ( = ?auto_194774 ?auto_194778 ) ) ( not ( = ?auto_194771 ?auto_194774 ) ) ( IN-CITY ?auto_194777 ?auto_194776 ) ( not ( = ?auto_194770 ?auto_194777 ) ) ( not ( = ?auto_194773 ?auto_194777 ) ) ( OBJ-AT ?auto_194774 ?auto_194777 ) ( not ( = ?auto_194772 ?auto_194778 ) ) ( not ( = ?auto_194774 ?auto_194772 ) ) ( OBJ-AT ?auto_194772 ?auto_194773 ) ( TRUCK-AT ?auto_194775 ?auto_194777 ) ( OBJ-AT ?auto_194778 ?auto_194777 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194778 ?auto_194771 ?auto_194770 )
      ( DELIVER-2PKG-VERIFY ?auto_194771 ?auto_194772 ?auto_194770 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_194780 - OBJ
      ?auto_194781 - OBJ
      ?auto_194779 - LOCATION
    )
    :vars
    (
      ?auto_194787 - OBJ
      ?auto_194782 - LOCATION
      ?auto_194784 - CITY
      ?auto_194785 - LOCATION
      ?auto_194786 - OBJ
      ?auto_194783 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194781 ?auto_194780 ) ) ( not ( = ?auto_194780 ?auto_194787 ) ) ( IN-CITY ?auto_194782 ?auto_194784 ) ( IN-CITY ?auto_194779 ?auto_194784 ) ( not ( = ?auto_194779 ?auto_194782 ) ) ( OBJ-AT ?auto_194780 ?auto_194782 ) ( not ( = ?auto_194781 ?auto_194787 ) ) ( IN-CITY ?auto_194785 ?auto_194784 ) ( not ( = ?auto_194779 ?auto_194785 ) ) ( not ( = ?auto_194782 ?auto_194785 ) ) ( OBJ-AT ?auto_194781 ?auto_194785 ) ( not ( = ?auto_194786 ?auto_194787 ) ) ( not ( = ?auto_194780 ?auto_194786 ) ) ( not ( = ?auto_194781 ?auto_194786 ) ) ( OBJ-AT ?auto_194786 ?auto_194782 ) ( TRUCK-AT ?auto_194783 ?auto_194785 ) ( OBJ-AT ?auto_194787 ?auto_194785 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194787 ?auto_194780 ?auto_194779 )
      ( DELIVER-2PKG-VERIFY ?auto_194780 ?auto_194781 ?auto_194779 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194809 - OBJ
      ?auto_194810 - OBJ
      ?auto_194811 - OBJ
      ?auto_194808 - LOCATION
    )
    :vars
    (
      ?auto_194812 - LOCATION
      ?auto_194815 - CITY
      ?auto_194813 - OBJ
      ?auto_194816 - LOCATION
      ?auto_194814 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194810 ?auto_194809 ) ) ( not ( = ?auto_194811 ?auto_194809 ) ) ( not ( = ?auto_194811 ?auto_194810 ) ) ( IN-CITY ?auto_194812 ?auto_194815 ) ( IN-CITY ?auto_194808 ?auto_194815 ) ( not ( = ?auto_194808 ?auto_194812 ) ) ( OBJ-AT ?auto_194811 ?auto_194812 ) ( not ( = ?auto_194813 ?auto_194809 ) ) ( not ( = ?auto_194811 ?auto_194813 ) ) ( IN-CITY ?auto_194816 ?auto_194815 ) ( not ( = ?auto_194808 ?auto_194816 ) ) ( not ( = ?auto_194812 ?auto_194816 ) ) ( OBJ-AT ?auto_194813 ?auto_194816 ) ( not ( = ?auto_194813 ?auto_194810 ) ) ( OBJ-AT ?auto_194810 ?auto_194812 ) ( TRUCK-AT ?auto_194814 ?auto_194816 ) ( OBJ-AT ?auto_194809 ?auto_194816 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194809 ?auto_194811 ?auto_194808 )
      ( DELIVER-3PKG-VERIFY ?auto_194809 ?auto_194810 ?auto_194811 ?auto_194808 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194818 - OBJ
      ?auto_194819 - OBJ
      ?auto_194820 - OBJ
      ?auto_194817 - LOCATION
    )
    :vars
    (
      ?auto_194821 - LOCATION
      ?auto_194823 - CITY
      ?auto_194824 - LOCATION
      ?auto_194825 - OBJ
      ?auto_194822 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194819 ?auto_194818 ) ) ( not ( = ?auto_194820 ?auto_194818 ) ) ( not ( = ?auto_194820 ?auto_194819 ) ) ( IN-CITY ?auto_194821 ?auto_194823 ) ( IN-CITY ?auto_194817 ?auto_194823 ) ( not ( = ?auto_194817 ?auto_194821 ) ) ( OBJ-AT ?auto_194820 ?auto_194821 ) ( IN-CITY ?auto_194824 ?auto_194823 ) ( not ( = ?auto_194817 ?auto_194824 ) ) ( not ( = ?auto_194821 ?auto_194824 ) ) ( OBJ-AT ?auto_194819 ?auto_194824 ) ( not ( = ?auto_194825 ?auto_194818 ) ) ( not ( = ?auto_194820 ?auto_194825 ) ) ( not ( = ?auto_194819 ?auto_194825 ) ) ( OBJ-AT ?auto_194825 ?auto_194821 ) ( TRUCK-AT ?auto_194822 ?auto_194824 ) ( OBJ-AT ?auto_194818 ?auto_194824 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194818 ?auto_194820 ?auto_194817 )
      ( DELIVER-3PKG-VERIFY ?auto_194818 ?auto_194819 ?auto_194820 ?auto_194817 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194837 - OBJ
      ?auto_194838 - OBJ
      ?auto_194839 - OBJ
      ?auto_194836 - LOCATION
    )
    :vars
    (
      ?auto_194840 - LOCATION
      ?auto_194843 - CITY
      ?auto_194841 - OBJ
      ?auto_194844 - LOCATION
      ?auto_194842 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194838 ?auto_194837 ) ) ( not ( = ?auto_194839 ?auto_194837 ) ) ( not ( = ?auto_194839 ?auto_194838 ) ) ( IN-CITY ?auto_194840 ?auto_194843 ) ( IN-CITY ?auto_194836 ?auto_194843 ) ( not ( = ?auto_194836 ?auto_194840 ) ) ( OBJ-AT ?auto_194838 ?auto_194840 ) ( not ( = ?auto_194841 ?auto_194837 ) ) ( not ( = ?auto_194838 ?auto_194841 ) ) ( IN-CITY ?auto_194844 ?auto_194843 ) ( not ( = ?auto_194836 ?auto_194844 ) ) ( not ( = ?auto_194840 ?auto_194844 ) ) ( OBJ-AT ?auto_194841 ?auto_194844 ) ( not ( = ?auto_194841 ?auto_194839 ) ) ( OBJ-AT ?auto_194839 ?auto_194840 ) ( TRUCK-AT ?auto_194842 ?auto_194844 ) ( OBJ-AT ?auto_194837 ?auto_194844 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194837 ?auto_194838 ?auto_194836 )
      ( DELIVER-3PKG-VERIFY ?auto_194837 ?auto_194838 ?auto_194839 ?auto_194836 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194846 - OBJ
      ?auto_194847 - OBJ
      ?auto_194848 - OBJ
      ?auto_194845 - LOCATION
    )
    :vars
    (
      ?auto_194849 - LOCATION
      ?auto_194851 - CITY
      ?auto_194852 - LOCATION
      ?auto_194853 - OBJ
      ?auto_194850 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194847 ?auto_194846 ) ) ( not ( = ?auto_194848 ?auto_194846 ) ) ( not ( = ?auto_194848 ?auto_194847 ) ) ( IN-CITY ?auto_194849 ?auto_194851 ) ( IN-CITY ?auto_194845 ?auto_194851 ) ( not ( = ?auto_194845 ?auto_194849 ) ) ( OBJ-AT ?auto_194847 ?auto_194849 ) ( IN-CITY ?auto_194852 ?auto_194851 ) ( not ( = ?auto_194845 ?auto_194852 ) ) ( not ( = ?auto_194849 ?auto_194852 ) ) ( OBJ-AT ?auto_194848 ?auto_194852 ) ( not ( = ?auto_194853 ?auto_194846 ) ) ( not ( = ?auto_194847 ?auto_194853 ) ) ( not ( = ?auto_194848 ?auto_194853 ) ) ( OBJ-AT ?auto_194853 ?auto_194849 ) ( TRUCK-AT ?auto_194850 ?auto_194852 ) ( OBJ-AT ?auto_194846 ?auto_194852 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194846 ?auto_194847 ?auto_194845 )
      ( DELIVER-3PKG-VERIFY ?auto_194846 ?auto_194847 ?auto_194848 ?auto_194845 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194865 - OBJ
      ?auto_194866 - OBJ
      ?auto_194867 - OBJ
      ?auto_194864 - LOCATION
    )
    :vars
    (
      ?auto_194868 - LOCATION
      ?auto_194871 - CITY
      ?auto_194869 - OBJ
      ?auto_194872 - LOCATION
      ?auto_194870 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194866 ?auto_194865 ) ) ( not ( = ?auto_194867 ?auto_194865 ) ) ( not ( = ?auto_194867 ?auto_194866 ) ) ( IN-CITY ?auto_194868 ?auto_194871 ) ( IN-CITY ?auto_194864 ?auto_194871 ) ( not ( = ?auto_194864 ?auto_194868 ) ) ( OBJ-AT ?auto_194867 ?auto_194868 ) ( not ( = ?auto_194869 ?auto_194866 ) ) ( not ( = ?auto_194867 ?auto_194869 ) ) ( IN-CITY ?auto_194872 ?auto_194871 ) ( not ( = ?auto_194864 ?auto_194872 ) ) ( not ( = ?auto_194868 ?auto_194872 ) ) ( OBJ-AT ?auto_194869 ?auto_194872 ) ( not ( = ?auto_194869 ?auto_194865 ) ) ( OBJ-AT ?auto_194865 ?auto_194868 ) ( TRUCK-AT ?auto_194870 ?auto_194872 ) ( OBJ-AT ?auto_194866 ?auto_194872 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194866 ?auto_194867 ?auto_194864 )
      ( DELIVER-3PKG-VERIFY ?auto_194865 ?auto_194866 ?auto_194867 ?auto_194864 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194884 - OBJ
      ?auto_194885 - OBJ
      ?auto_194886 - OBJ
      ?auto_194883 - LOCATION
    )
    :vars
    (
      ?auto_194891 - OBJ
      ?auto_194887 - LOCATION
      ?auto_194889 - CITY
      ?auto_194890 - LOCATION
      ?auto_194888 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194885 ?auto_194884 ) ) ( not ( = ?auto_194886 ?auto_194884 ) ) ( not ( = ?auto_194886 ?auto_194885 ) ) ( not ( = ?auto_194886 ?auto_194891 ) ) ( IN-CITY ?auto_194887 ?auto_194889 ) ( IN-CITY ?auto_194883 ?auto_194889 ) ( not ( = ?auto_194883 ?auto_194887 ) ) ( OBJ-AT ?auto_194886 ?auto_194887 ) ( not ( = ?auto_194885 ?auto_194891 ) ) ( IN-CITY ?auto_194890 ?auto_194889 ) ( not ( = ?auto_194883 ?auto_194890 ) ) ( not ( = ?auto_194887 ?auto_194890 ) ) ( OBJ-AT ?auto_194885 ?auto_194890 ) ( not ( = ?auto_194884 ?auto_194891 ) ) ( OBJ-AT ?auto_194884 ?auto_194887 ) ( TRUCK-AT ?auto_194888 ?auto_194890 ) ( OBJ-AT ?auto_194891 ?auto_194890 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194891 ?auto_194886 ?auto_194883 )
      ( DELIVER-3PKG-VERIFY ?auto_194884 ?auto_194885 ?auto_194886 ?auto_194883 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194893 - OBJ
      ?auto_194894 - OBJ
      ?auto_194895 - OBJ
      ?auto_194892 - LOCATION
    )
    :vars
    (
      ?auto_194896 - LOCATION
      ?auto_194899 - CITY
      ?auto_194897 - OBJ
      ?auto_194900 - LOCATION
      ?auto_194898 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194894 ?auto_194893 ) ) ( not ( = ?auto_194895 ?auto_194893 ) ) ( not ( = ?auto_194895 ?auto_194894 ) ) ( IN-CITY ?auto_194896 ?auto_194899 ) ( IN-CITY ?auto_194892 ?auto_194899 ) ( not ( = ?auto_194892 ?auto_194896 ) ) ( OBJ-AT ?auto_194894 ?auto_194896 ) ( not ( = ?auto_194897 ?auto_194895 ) ) ( not ( = ?auto_194894 ?auto_194897 ) ) ( IN-CITY ?auto_194900 ?auto_194899 ) ( not ( = ?auto_194892 ?auto_194900 ) ) ( not ( = ?auto_194896 ?auto_194900 ) ) ( OBJ-AT ?auto_194897 ?auto_194900 ) ( not ( = ?auto_194897 ?auto_194893 ) ) ( OBJ-AT ?auto_194893 ?auto_194896 ) ( TRUCK-AT ?auto_194898 ?auto_194900 ) ( OBJ-AT ?auto_194895 ?auto_194900 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194895 ?auto_194894 ?auto_194892 )
      ( DELIVER-3PKG-VERIFY ?auto_194893 ?auto_194894 ?auto_194895 ?auto_194892 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194912 - OBJ
      ?auto_194913 - OBJ
      ?auto_194914 - OBJ
      ?auto_194911 - LOCATION
    )
    :vars
    (
      ?auto_194919 - OBJ
      ?auto_194915 - LOCATION
      ?auto_194917 - CITY
      ?auto_194918 - LOCATION
      ?auto_194916 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194913 ?auto_194912 ) ) ( not ( = ?auto_194914 ?auto_194912 ) ) ( not ( = ?auto_194914 ?auto_194913 ) ) ( not ( = ?auto_194913 ?auto_194919 ) ) ( IN-CITY ?auto_194915 ?auto_194917 ) ( IN-CITY ?auto_194911 ?auto_194917 ) ( not ( = ?auto_194911 ?auto_194915 ) ) ( OBJ-AT ?auto_194913 ?auto_194915 ) ( not ( = ?auto_194914 ?auto_194919 ) ) ( IN-CITY ?auto_194918 ?auto_194917 ) ( not ( = ?auto_194911 ?auto_194918 ) ) ( not ( = ?auto_194915 ?auto_194918 ) ) ( OBJ-AT ?auto_194914 ?auto_194918 ) ( not ( = ?auto_194912 ?auto_194919 ) ) ( OBJ-AT ?auto_194912 ?auto_194915 ) ( TRUCK-AT ?auto_194916 ?auto_194918 ) ( OBJ-AT ?auto_194919 ?auto_194918 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194919 ?auto_194913 ?auto_194911 )
      ( DELIVER-3PKG-VERIFY ?auto_194912 ?auto_194913 ?auto_194914 ?auto_194911 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194931 - OBJ
      ?auto_194932 - OBJ
      ?auto_194933 - OBJ
      ?auto_194930 - LOCATION
    )
    :vars
    (
      ?auto_194934 - LOCATION
      ?auto_194936 - CITY
      ?auto_194937 - LOCATION
      ?auto_194938 - OBJ
      ?auto_194935 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194932 ?auto_194931 ) ) ( not ( = ?auto_194933 ?auto_194931 ) ) ( not ( = ?auto_194933 ?auto_194932 ) ) ( IN-CITY ?auto_194934 ?auto_194936 ) ( IN-CITY ?auto_194930 ?auto_194936 ) ( not ( = ?auto_194930 ?auto_194934 ) ) ( OBJ-AT ?auto_194933 ?auto_194934 ) ( IN-CITY ?auto_194937 ?auto_194936 ) ( not ( = ?auto_194930 ?auto_194937 ) ) ( not ( = ?auto_194934 ?auto_194937 ) ) ( OBJ-AT ?auto_194931 ?auto_194937 ) ( not ( = ?auto_194938 ?auto_194932 ) ) ( not ( = ?auto_194933 ?auto_194938 ) ) ( not ( = ?auto_194931 ?auto_194938 ) ) ( OBJ-AT ?auto_194938 ?auto_194934 ) ( TRUCK-AT ?auto_194935 ?auto_194937 ) ( OBJ-AT ?auto_194932 ?auto_194937 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194932 ?auto_194933 ?auto_194930 )
      ( DELIVER-3PKG-VERIFY ?auto_194931 ?auto_194932 ?auto_194933 ?auto_194930 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194940 - OBJ
      ?auto_194941 - OBJ
      ?auto_194942 - OBJ
      ?auto_194939 - LOCATION
    )
    :vars
    (
      ?auto_194947 - OBJ
      ?auto_194943 - LOCATION
      ?auto_194945 - CITY
      ?auto_194946 - LOCATION
      ?auto_194944 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194941 ?auto_194940 ) ) ( not ( = ?auto_194942 ?auto_194940 ) ) ( not ( = ?auto_194942 ?auto_194941 ) ) ( not ( = ?auto_194942 ?auto_194947 ) ) ( IN-CITY ?auto_194943 ?auto_194945 ) ( IN-CITY ?auto_194939 ?auto_194945 ) ( not ( = ?auto_194939 ?auto_194943 ) ) ( OBJ-AT ?auto_194942 ?auto_194943 ) ( not ( = ?auto_194940 ?auto_194947 ) ) ( IN-CITY ?auto_194946 ?auto_194945 ) ( not ( = ?auto_194939 ?auto_194946 ) ) ( not ( = ?auto_194943 ?auto_194946 ) ) ( OBJ-AT ?auto_194940 ?auto_194946 ) ( not ( = ?auto_194941 ?auto_194947 ) ) ( OBJ-AT ?auto_194941 ?auto_194943 ) ( TRUCK-AT ?auto_194944 ?auto_194946 ) ( OBJ-AT ?auto_194947 ?auto_194946 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194947 ?auto_194942 ?auto_194939 )
      ( DELIVER-3PKG-VERIFY ?auto_194940 ?auto_194941 ?auto_194942 ?auto_194939 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194959 - OBJ
      ?auto_194960 - OBJ
      ?auto_194961 - OBJ
      ?auto_194958 - LOCATION
    )
    :vars
    (
      ?auto_194962 - LOCATION
      ?auto_194964 - CITY
      ?auto_194965 - LOCATION
      ?auto_194966 - OBJ
      ?auto_194963 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194960 ?auto_194959 ) ) ( not ( = ?auto_194961 ?auto_194959 ) ) ( not ( = ?auto_194961 ?auto_194960 ) ) ( IN-CITY ?auto_194962 ?auto_194964 ) ( IN-CITY ?auto_194958 ?auto_194964 ) ( not ( = ?auto_194958 ?auto_194962 ) ) ( OBJ-AT ?auto_194960 ?auto_194962 ) ( IN-CITY ?auto_194965 ?auto_194964 ) ( not ( = ?auto_194958 ?auto_194965 ) ) ( not ( = ?auto_194962 ?auto_194965 ) ) ( OBJ-AT ?auto_194959 ?auto_194965 ) ( not ( = ?auto_194966 ?auto_194961 ) ) ( not ( = ?auto_194960 ?auto_194966 ) ) ( not ( = ?auto_194959 ?auto_194966 ) ) ( OBJ-AT ?auto_194966 ?auto_194962 ) ( TRUCK-AT ?auto_194963 ?auto_194965 ) ( OBJ-AT ?auto_194961 ?auto_194965 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194961 ?auto_194960 ?auto_194958 )
      ( DELIVER-3PKG-VERIFY ?auto_194959 ?auto_194960 ?auto_194961 ?auto_194958 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194968 - OBJ
      ?auto_194969 - OBJ
      ?auto_194970 - OBJ
      ?auto_194967 - LOCATION
    )
    :vars
    (
      ?auto_194975 - OBJ
      ?auto_194971 - LOCATION
      ?auto_194973 - CITY
      ?auto_194974 - LOCATION
      ?auto_194972 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_194969 ?auto_194968 ) ) ( not ( = ?auto_194970 ?auto_194968 ) ) ( not ( = ?auto_194970 ?auto_194969 ) ) ( not ( = ?auto_194969 ?auto_194975 ) ) ( IN-CITY ?auto_194971 ?auto_194973 ) ( IN-CITY ?auto_194967 ?auto_194973 ) ( not ( = ?auto_194967 ?auto_194971 ) ) ( OBJ-AT ?auto_194969 ?auto_194971 ) ( not ( = ?auto_194968 ?auto_194975 ) ) ( IN-CITY ?auto_194974 ?auto_194973 ) ( not ( = ?auto_194967 ?auto_194974 ) ) ( not ( = ?auto_194971 ?auto_194974 ) ) ( OBJ-AT ?auto_194968 ?auto_194974 ) ( not ( = ?auto_194970 ?auto_194975 ) ) ( OBJ-AT ?auto_194970 ?auto_194971 ) ( TRUCK-AT ?auto_194972 ?auto_194974 ) ( OBJ-AT ?auto_194975 ?auto_194974 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194975 ?auto_194969 ?auto_194967 )
      ( DELIVER-3PKG-VERIFY ?auto_194968 ?auto_194969 ?auto_194970 ?auto_194967 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_195007 - OBJ
      ?auto_195008 - OBJ
      ?auto_195009 - OBJ
      ?auto_195006 - LOCATION
    )
    :vars
    (
      ?auto_195010 - LOCATION
      ?auto_195013 - CITY
      ?auto_195011 - OBJ
      ?auto_195014 - LOCATION
      ?auto_195012 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195008 ?auto_195007 ) ) ( not ( = ?auto_195009 ?auto_195007 ) ) ( not ( = ?auto_195009 ?auto_195008 ) ) ( IN-CITY ?auto_195010 ?auto_195013 ) ( IN-CITY ?auto_195006 ?auto_195013 ) ( not ( = ?auto_195006 ?auto_195010 ) ) ( OBJ-AT ?auto_195007 ?auto_195010 ) ( not ( = ?auto_195011 ?auto_195008 ) ) ( not ( = ?auto_195007 ?auto_195011 ) ) ( IN-CITY ?auto_195014 ?auto_195013 ) ( not ( = ?auto_195006 ?auto_195014 ) ) ( not ( = ?auto_195010 ?auto_195014 ) ) ( OBJ-AT ?auto_195011 ?auto_195014 ) ( not ( = ?auto_195011 ?auto_195009 ) ) ( OBJ-AT ?auto_195009 ?auto_195010 ) ( TRUCK-AT ?auto_195012 ?auto_195014 ) ( OBJ-AT ?auto_195008 ?auto_195014 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195008 ?auto_195007 ?auto_195006 )
      ( DELIVER-3PKG-VERIFY ?auto_195007 ?auto_195008 ?auto_195009 ?auto_195006 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_195016 - OBJ
      ?auto_195017 - OBJ
      ?auto_195018 - OBJ
      ?auto_195015 - LOCATION
    )
    :vars
    (
      ?auto_195019 - LOCATION
      ?auto_195021 - CITY
      ?auto_195022 - LOCATION
      ?auto_195023 - OBJ
      ?auto_195020 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195017 ?auto_195016 ) ) ( not ( = ?auto_195018 ?auto_195016 ) ) ( not ( = ?auto_195018 ?auto_195017 ) ) ( IN-CITY ?auto_195019 ?auto_195021 ) ( IN-CITY ?auto_195015 ?auto_195021 ) ( not ( = ?auto_195015 ?auto_195019 ) ) ( OBJ-AT ?auto_195016 ?auto_195019 ) ( IN-CITY ?auto_195022 ?auto_195021 ) ( not ( = ?auto_195015 ?auto_195022 ) ) ( not ( = ?auto_195019 ?auto_195022 ) ) ( OBJ-AT ?auto_195018 ?auto_195022 ) ( not ( = ?auto_195023 ?auto_195017 ) ) ( not ( = ?auto_195016 ?auto_195023 ) ) ( not ( = ?auto_195018 ?auto_195023 ) ) ( OBJ-AT ?auto_195023 ?auto_195019 ) ( TRUCK-AT ?auto_195020 ?auto_195022 ) ( OBJ-AT ?auto_195017 ?auto_195022 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195017 ?auto_195016 ?auto_195015 )
      ( DELIVER-3PKG-VERIFY ?auto_195016 ?auto_195017 ?auto_195018 ?auto_195015 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_195035 - OBJ
      ?auto_195036 - OBJ
      ?auto_195037 - OBJ
      ?auto_195034 - LOCATION
    )
    :vars
    (
      ?auto_195038 - LOCATION
      ?auto_195041 - CITY
      ?auto_195039 - OBJ
      ?auto_195042 - LOCATION
      ?auto_195040 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195036 ?auto_195035 ) ) ( not ( = ?auto_195037 ?auto_195035 ) ) ( not ( = ?auto_195037 ?auto_195036 ) ) ( IN-CITY ?auto_195038 ?auto_195041 ) ( IN-CITY ?auto_195034 ?auto_195041 ) ( not ( = ?auto_195034 ?auto_195038 ) ) ( OBJ-AT ?auto_195035 ?auto_195038 ) ( not ( = ?auto_195039 ?auto_195037 ) ) ( not ( = ?auto_195035 ?auto_195039 ) ) ( IN-CITY ?auto_195042 ?auto_195041 ) ( not ( = ?auto_195034 ?auto_195042 ) ) ( not ( = ?auto_195038 ?auto_195042 ) ) ( OBJ-AT ?auto_195039 ?auto_195042 ) ( not ( = ?auto_195039 ?auto_195036 ) ) ( OBJ-AT ?auto_195036 ?auto_195038 ) ( TRUCK-AT ?auto_195040 ?auto_195042 ) ( OBJ-AT ?auto_195037 ?auto_195042 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195037 ?auto_195035 ?auto_195034 )
      ( DELIVER-3PKG-VERIFY ?auto_195035 ?auto_195036 ?auto_195037 ?auto_195034 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_195054 - OBJ
      ?auto_195055 - OBJ
      ?auto_195056 - OBJ
      ?auto_195053 - LOCATION
    )
    :vars
    (
      ?auto_195061 - OBJ
      ?auto_195057 - LOCATION
      ?auto_195059 - CITY
      ?auto_195060 - LOCATION
      ?auto_195058 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195055 ?auto_195054 ) ) ( not ( = ?auto_195056 ?auto_195054 ) ) ( not ( = ?auto_195056 ?auto_195055 ) ) ( not ( = ?auto_195054 ?auto_195061 ) ) ( IN-CITY ?auto_195057 ?auto_195059 ) ( IN-CITY ?auto_195053 ?auto_195059 ) ( not ( = ?auto_195053 ?auto_195057 ) ) ( OBJ-AT ?auto_195054 ?auto_195057 ) ( not ( = ?auto_195056 ?auto_195061 ) ) ( IN-CITY ?auto_195060 ?auto_195059 ) ( not ( = ?auto_195053 ?auto_195060 ) ) ( not ( = ?auto_195057 ?auto_195060 ) ) ( OBJ-AT ?auto_195056 ?auto_195060 ) ( not ( = ?auto_195055 ?auto_195061 ) ) ( OBJ-AT ?auto_195055 ?auto_195057 ) ( TRUCK-AT ?auto_195058 ?auto_195060 ) ( OBJ-AT ?auto_195061 ?auto_195060 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195061 ?auto_195054 ?auto_195053 )
      ( DELIVER-3PKG-VERIFY ?auto_195054 ?auto_195055 ?auto_195056 ?auto_195053 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_195073 - OBJ
      ?auto_195074 - OBJ
      ?auto_195075 - OBJ
      ?auto_195072 - LOCATION
    )
    :vars
    (
      ?auto_195076 - LOCATION
      ?auto_195078 - CITY
      ?auto_195079 - LOCATION
      ?auto_195080 - OBJ
      ?auto_195077 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195074 ?auto_195073 ) ) ( not ( = ?auto_195075 ?auto_195073 ) ) ( not ( = ?auto_195075 ?auto_195074 ) ) ( IN-CITY ?auto_195076 ?auto_195078 ) ( IN-CITY ?auto_195072 ?auto_195078 ) ( not ( = ?auto_195072 ?auto_195076 ) ) ( OBJ-AT ?auto_195073 ?auto_195076 ) ( IN-CITY ?auto_195079 ?auto_195078 ) ( not ( = ?auto_195072 ?auto_195079 ) ) ( not ( = ?auto_195076 ?auto_195079 ) ) ( OBJ-AT ?auto_195074 ?auto_195079 ) ( not ( = ?auto_195080 ?auto_195075 ) ) ( not ( = ?auto_195073 ?auto_195080 ) ) ( not ( = ?auto_195074 ?auto_195080 ) ) ( OBJ-AT ?auto_195080 ?auto_195076 ) ( TRUCK-AT ?auto_195077 ?auto_195079 ) ( OBJ-AT ?auto_195075 ?auto_195079 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195075 ?auto_195073 ?auto_195072 )
      ( DELIVER-3PKG-VERIFY ?auto_195073 ?auto_195074 ?auto_195075 ?auto_195072 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_195082 - OBJ
      ?auto_195083 - OBJ
      ?auto_195084 - OBJ
      ?auto_195081 - LOCATION
    )
    :vars
    (
      ?auto_195089 - OBJ
      ?auto_195085 - LOCATION
      ?auto_195087 - CITY
      ?auto_195088 - LOCATION
      ?auto_195086 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195083 ?auto_195082 ) ) ( not ( = ?auto_195084 ?auto_195082 ) ) ( not ( = ?auto_195084 ?auto_195083 ) ) ( not ( = ?auto_195082 ?auto_195089 ) ) ( IN-CITY ?auto_195085 ?auto_195087 ) ( IN-CITY ?auto_195081 ?auto_195087 ) ( not ( = ?auto_195081 ?auto_195085 ) ) ( OBJ-AT ?auto_195082 ?auto_195085 ) ( not ( = ?auto_195083 ?auto_195089 ) ) ( IN-CITY ?auto_195088 ?auto_195087 ) ( not ( = ?auto_195081 ?auto_195088 ) ) ( not ( = ?auto_195085 ?auto_195088 ) ) ( OBJ-AT ?auto_195083 ?auto_195088 ) ( not ( = ?auto_195084 ?auto_195089 ) ) ( OBJ-AT ?auto_195084 ?auto_195085 ) ( TRUCK-AT ?auto_195086 ?auto_195088 ) ( OBJ-AT ?auto_195089 ?auto_195088 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195089 ?auto_195082 ?auto_195081 )
      ( DELIVER-3PKG-VERIFY ?auto_195082 ?auto_195083 ?auto_195084 ?auto_195081 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195245 - OBJ
      ?auto_195246 - OBJ
      ?auto_195247 - OBJ
      ?auto_195248 - OBJ
      ?auto_195244 - LOCATION
    )
    :vars
    (
      ?auto_195249 - LOCATION
      ?auto_195251 - CITY
      ?auto_195252 - LOCATION
      ?auto_195250 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195246 ?auto_195245 ) ) ( not ( = ?auto_195247 ?auto_195245 ) ) ( not ( = ?auto_195247 ?auto_195246 ) ) ( not ( = ?auto_195248 ?auto_195245 ) ) ( not ( = ?auto_195248 ?auto_195246 ) ) ( not ( = ?auto_195248 ?auto_195247 ) ) ( IN-CITY ?auto_195249 ?auto_195251 ) ( IN-CITY ?auto_195244 ?auto_195251 ) ( not ( = ?auto_195244 ?auto_195249 ) ) ( OBJ-AT ?auto_195248 ?auto_195249 ) ( IN-CITY ?auto_195252 ?auto_195251 ) ( not ( = ?auto_195244 ?auto_195252 ) ) ( not ( = ?auto_195249 ?auto_195252 ) ) ( OBJ-AT ?auto_195247 ?auto_195252 ) ( OBJ-AT ?auto_195246 ?auto_195249 ) ( TRUCK-AT ?auto_195250 ?auto_195252 ) ( OBJ-AT ?auto_195245 ?auto_195252 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195245 ?auto_195248 ?auto_195244 )
      ( DELIVER-4PKG-VERIFY ?auto_195245 ?auto_195246 ?auto_195247 ?auto_195248 ?auto_195244 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195274 - OBJ
      ?auto_195275 - OBJ
      ?auto_195276 - OBJ
      ?auto_195277 - OBJ
      ?auto_195273 - LOCATION
    )
    :vars
    (
      ?auto_195278 - LOCATION
      ?auto_195280 - CITY
      ?auto_195281 - LOCATION
      ?auto_195279 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195275 ?auto_195274 ) ) ( not ( = ?auto_195276 ?auto_195274 ) ) ( not ( = ?auto_195276 ?auto_195275 ) ) ( not ( = ?auto_195277 ?auto_195274 ) ) ( not ( = ?auto_195277 ?auto_195275 ) ) ( not ( = ?auto_195277 ?auto_195276 ) ) ( IN-CITY ?auto_195278 ?auto_195280 ) ( IN-CITY ?auto_195273 ?auto_195280 ) ( not ( = ?auto_195273 ?auto_195278 ) ) ( OBJ-AT ?auto_195276 ?auto_195278 ) ( IN-CITY ?auto_195281 ?auto_195280 ) ( not ( = ?auto_195273 ?auto_195281 ) ) ( not ( = ?auto_195278 ?auto_195281 ) ) ( OBJ-AT ?auto_195277 ?auto_195281 ) ( OBJ-AT ?auto_195275 ?auto_195278 ) ( TRUCK-AT ?auto_195279 ?auto_195281 ) ( OBJ-AT ?auto_195274 ?auto_195281 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195274 ?auto_195276 ?auto_195273 )
      ( DELIVER-4PKG-VERIFY ?auto_195274 ?auto_195275 ?auto_195276 ?auto_195277 ?auto_195273 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195303 - OBJ
      ?auto_195304 - OBJ
      ?auto_195305 - OBJ
      ?auto_195306 - OBJ
      ?auto_195302 - LOCATION
    )
    :vars
    (
      ?auto_195307 - LOCATION
      ?auto_195309 - CITY
      ?auto_195310 - LOCATION
      ?auto_195308 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195304 ?auto_195303 ) ) ( not ( = ?auto_195305 ?auto_195303 ) ) ( not ( = ?auto_195305 ?auto_195304 ) ) ( not ( = ?auto_195306 ?auto_195303 ) ) ( not ( = ?auto_195306 ?auto_195304 ) ) ( not ( = ?auto_195306 ?auto_195305 ) ) ( IN-CITY ?auto_195307 ?auto_195309 ) ( IN-CITY ?auto_195302 ?auto_195309 ) ( not ( = ?auto_195302 ?auto_195307 ) ) ( OBJ-AT ?auto_195306 ?auto_195307 ) ( IN-CITY ?auto_195310 ?auto_195309 ) ( not ( = ?auto_195302 ?auto_195310 ) ) ( not ( = ?auto_195307 ?auto_195310 ) ) ( OBJ-AT ?auto_195304 ?auto_195310 ) ( OBJ-AT ?auto_195305 ?auto_195307 ) ( TRUCK-AT ?auto_195308 ?auto_195310 ) ( OBJ-AT ?auto_195303 ?auto_195310 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195303 ?auto_195306 ?auto_195302 )
      ( DELIVER-4PKG-VERIFY ?auto_195303 ?auto_195304 ?auto_195305 ?auto_195306 ?auto_195302 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195332 - OBJ
      ?auto_195333 - OBJ
      ?auto_195334 - OBJ
      ?auto_195335 - OBJ
      ?auto_195331 - LOCATION
    )
    :vars
    (
      ?auto_195336 - LOCATION
      ?auto_195338 - CITY
      ?auto_195339 - LOCATION
      ?auto_195337 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195333 ?auto_195332 ) ) ( not ( = ?auto_195334 ?auto_195332 ) ) ( not ( = ?auto_195334 ?auto_195333 ) ) ( not ( = ?auto_195335 ?auto_195332 ) ) ( not ( = ?auto_195335 ?auto_195333 ) ) ( not ( = ?auto_195335 ?auto_195334 ) ) ( IN-CITY ?auto_195336 ?auto_195338 ) ( IN-CITY ?auto_195331 ?auto_195338 ) ( not ( = ?auto_195331 ?auto_195336 ) ) ( OBJ-AT ?auto_195334 ?auto_195336 ) ( IN-CITY ?auto_195339 ?auto_195338 ) ( not ( = ?auto_195331 ?auto_195339 ) ) ( not ( = ?auto_195336 ?auto_195339 ) ) ( OBJ-AT ?auto_195333 ?auto_195339 ) ( OBJ-AT ?auto_195335 ?auto_195336 ) ( TRUCK-AT ?auto_195337 ?auto_195339 ) ( OBJ-AT ?auto_195332 ?auto_195339 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195332 ?auto_195334 ?auto_195331 )
      ( DELIVER-4PKG-VERIFY ?auto_195332 ?auto_195333 ?auto_195334 ?auto_195335 ?auto_195331 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195423 - OBJ
      ?auto_195424 - OBJ
      ?auto_195425 - OBJ
      ?auto_195426 - OBJ
      ?auto_195422 - LOCATION
    )
    :vars
    (
      ?auto_195427 - LOCATION
      ?auto_195429 - CITY
      ?auto_195430 - LOCATION
      ?auto_195428 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195424 ?auto_195423 ) ) ( not ( = ?auto_195425 ?auto_195423 ) ) ( not ( = ?auto_195425 ?auto_195424 ) ) ( not ( = ?auto_195426 ?auto_195423 ) ) ( not ( = ?auto_195426 ?auto_195424 ) ) ( not ( = ?auto_195426 ?auto_195425 ) ) ( IN-CITY ?auto_195427 ?auto_195429 ) ( IN-CITY ?auto_195422 ?auto_195429 ) ( not ( = ?auto_195422 ?auto_195427 ) ) ( OBJ-AT ?auto_195424 ?auto_195427 ) ( IN-CITY ?auto_195430 ?auto_195429 ) ( not ( = ?auto_195422 ?auto_195430 ) ) ( not ( = ?auto_195427 ?auto_195430 ) ) ( OBJ-AT ?auto_195426 ?auto_195430 ) ( OBJ-AT ?auto_195425 ?auto_195427 ) ( TRUCK-AT ?auto_195428 ?auto_195430 ) ( OBJ-AT ?auto_195423 ?auto_195430 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195423 ?auto_195424 ?auto_195422 )
      ( DELIVER-4PKG-VERIFY ?auto_195423 ?auto_195424 ?auto_195425 ?auto_195426 ?auto_195422 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195452 - OBJ
      ?auto_195453 - OBJ
      ?auto_195454 - OBJ
      ?auto_195455 - OBJ
      ?auto_195451 - LOCATION
    )
    :vars
    (
      ?auto_195456 - LOCATION
      ?auto_195458 - CITY
      ?auto_195459 - LOCATION
      ?auto_195457 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195453 ?auto_195452 ) ) ( not ( = ?auto_195454 ?auto_195452 ) ) ( not ( = ?auto_195454 ?auto_195453 ) ) ( not ( = ?auto_195455 ?auto_195452 ) ) ( not ( = ?auto_195455 ?auto_195453 ) ) ( not ( = ?auto_195455 ?auto_195454 ) ) ( IN-CITY ?auto_195456 ?auto_195458 ) ( IN-CITY ?auto_195451 ?auto_195458 ) ( not ( = ?auto_195451 ?auto_195456 ) ) ( OBJ-AT ?auto_195453 ?auto_195456 ) ( IN-CITY ?auto_195459 ?auto_195458 ) ( not ( = ?auto_195451 ?auto_195459 ) ) ( not ( = ?auto_195456 ?auto_195459 ) ) ( OBJ-AT ?auto_195454 ?auto_195459 ) ( OBJ-AT ?auto_195455 ?auto_195456 ) ( TRUCK-AT ?auto_195457 ?auto_195459 ) ( OBJ-AT ?auto_195452 ?auto_195459 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195452 ?auto_195453 ?auto_195451 )
      ( DELIVER-4PKG-VERIFY ?auto_195452 ?auto_195453 ?auto_195454 ?auto_195455 ?auto_195451 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195543 - OBJ
      ?auto_195544 - OBJ
      ?auto_195545 - OBJ
      ?auto_195546 - OBJ
      ?auto_195542 - LOCATION
    )
    :vars
    (
      ?auto_195547 - LOCATION
      ?auto_195549 - CITY
      ?auto_195550 - LOCATION
      ?auto_195548 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195544 ?auto_195543 ) ) ( not ( = ?auto_195545 ?auto_195543 ) ) ( not ( = ?auto_195545 ?auto_195544 ) ) ( not ( = ?auto_195546 ?auto_195543 ) ) ( not ( = ?auto_195546 ?auto_195544 ) ) ( not ( = ?auto_195546 ?auto_195545 ) ) ( IN-CITY ?auto_195547 ?auto_195549 ) ( IN-CITY ?auto_195542 ?auto_195549 ) ( not ( = ?auto_195542 ?auto_195547 ) ) ( OBJ-AT ?auto_195546 ?auto_195547 ) ( IN-CITY ?auto_195550 ?auto_195549 ) ( not ( = ?auto_195542 ?auto_195550 ) ) ( not ( = ?auto_195547 ?auto_195550 ) ) ( OBJ-AT ?auto_195545 ?auto_195550 ) ( OBJ-AT ?auto_195543 ?auto_195547 ) ( TRUCK-AT ?auto_195548 ?auto_195550 ) ( OBJ-AT ?auto_195544 ?auto_195550 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195544 ?auto_195546 ?auto_195542 )
      ( DELIVER-4PKG-VERIFY ?auto_195543 ?auto_195544 ?auto_195545 ?auto_195546 ?auto_195542 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195572 - OBJ
      ?auto_195573 - OBJ
      ?auto_195574 - OBJ
      ?auto_195575 - OBJ
      ?auto_195571 - LOCATION
    )
    :vars
    (
      ?auto_195576 - LOCATION
      ?auto_195578 - CITY
      ?auto_195579 - LOCATION
      ?auto_195577 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195573 ?auto_195572 ) ) ( not ( = ?auto_195574 ?auto_195572 ) ) ( not ( = ?auto_195574 ?auto_195573 ) ) ( not ( = ?auto_195575 ?auto_195572 ) ) ( not ( = ?auto_195575 ?auto_195573 ) ) ( not ( = ?auto_195575 ?auto_195574 ) ) ( IN-CITY ?auto_195576 ?auto_195578 ) ( IN-CITY ?auto_195571 ?auto_195578 ) ( not ( = ?auto_195571 ?auto_195576 ) ) ( OBJ-AT ?auto_195574 ?auto_195576 ) ( IN-CITY ?auto_195579 ?auto_195578 ) ( not ( = ?auto_195571 ?auto_195579 ) ) ( not ( = ?auto_195576 ?auto_195579 ) ) ( OBJ-AT ?auto_195575 ?auto_195579 ) ( OBJ-AT ?auto_195572 ?auto_195576 ) ( TRUCK-AT ?auto_195577 ?auto_195579 ) ( OBJ-AT ?auto_195573 ?auto_195579 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195573 ?auto_195574 ?auto_195571 )
      ( DELIVER-4PKG-VERIFY ?auto_195572 ?auto_195573 ?auto_195574 ?auto_195575 ?auto_195571 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195664 - OBJ
      ?auto_195665 - OBJ
      ?auto_195666 - OBJ
      ?auto_195667 - OBJ
      ?auto_195663 - LOCATION
    )
    :vars
    (
      ?auto_195668 - LOCATION
      ?auto_195670 - CITY
      ?auto_195671 - LOCATION
      ?auto_195669 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195665 ?auto_195664 ) ) ( not ( = ?auto_195666 ?auto_195664 ) ) ( not ( = ?auto_195666 ?auto_195665 ) ) ( not ( = ?auto_195667 ?auto_195664 ) ) ( not ( = ?auto_195667 ?auto_195665 ) ) ( not ( = ?auto_195667 ?auto_195666 ) ) ( IN-CITY ?auto_195668 ?auto_195670 ) ( IN-CITY ?auto_195663 ?auto_195670 ) ( not ( = ?auto_195663 ?auto_195668 ) ) ( OBJ-AT ?auto_195667 ?auto_195668 ) ( IN-CITY ?auto_195671 ?auto_195670 ) ( not ( = ?auto_195663 ?auto_195671 ) ) ( not ( = ?auto_195668 ?auto_195671 ) ) ( OBJ-AT ?auto_195665 ?auto_195671 ) ( OBJ-AT ?auto_195664 ?auto_195668 ) ( TRUCK-AT ?auto_195669 ?auto_195671 ) ( OBJ-AT ?auto_195666 ?auto_195671 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195666 ?auto_195667 ?auto_195663 )
      ( DELIVER-4PKG-VERIFY ?auto_195664 ?auto_195665 ?auto_195666 ?auto_195667 ?auto_195663 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195693 - OBJ
      ?auto_195694 - OBJ
      ?auto_195695 - OBJ
      ?auto_195696 - OBJ
      ?auto_195692 - LOCATION
    )
    :vars
    (
      ?auto_195697 - LOCATION
      ?auto_195699 - CITY
      ?auto_195700 - LOCATION
      ?auto_195698 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195694 ?auto_195693 ) ) ( not ( = ?auto_195695 ?auto_195693 ) ) ( not ( = ?auto_195695 ?auto_195694 ) ) ( not ( = ?auto_195696 ?auto_195693 ) ) ( not ( = ?auto_195696 ?auto_195694 ) ) ( not ( = ?auto_195696 ?auto_195695 ) ) ( IN-CITY ?auto_195697 ?auto_195699 ) ( IN-CITY ?auto_195692 ?auto_195699 ) ( not ( = ?auto_195692 ?auto_195697 ) ) ( OBJ-AT ?auto_195695 ?auto_195697 ) ( IN-CITY ?auto_195700 ?auto_195699 ) ( not ( = ?auto_195692 ?auto_195700 ) ) ( not ( = ?auto_195697 ?auto_195700 ) ) ( OBJ-AT ?auto_195694 ?auto_195700 ) ( OBJ-AT ?auto_195693 ?auto_195697 ) ( TRUCK-AT ?auto_195698 ?auto_195700 ) ( OBJ-AT ?auto_195696 ?auto_195700 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195696 ?auto_195695 ?auto_195692 )
      ( DELIVER-4PKG-VERIFY ?auto_195693 ?auto_195694 ?auto_195695 ?auto_195696 ?auto_195692 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195752 - OBJ
      ?auto_195753 - OBJ
      ?auto_195754 - OBJ
      ?auto_195755 - OBJ
      ?auto_195751 - LOCATION
    )
    :vars
    (
      ?auto_195756 - LOCATION
      ?auto_195758 - CITY
      ?auto_195759 - LOCATION
      ?auto_195757 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195753 ?auto_195752 ) ) ( not ( = ?auto_195754 ?auto_195752 ) ) ( not ( = ?auto_195754 ?auto_195753 ) ) ( not ( = ?auto_195755 ?auto_195752 ) ) ( not ( = ?auto_195755 ?auto_195753 ) ) ( not ( = ?auto_195755 ?auto_195754 ) ) ( IN-CITY ?auto_195756 ?auto_195758 ) ( IN-CITY ?auto_195751 ?auto_195758 ) ( not ( = ?auto_195751 ?auto_195756 ) ) ( OBJ-AT ?auto_195753 ?auto_195756 ) ( IN-CITY ?auto_195759 ?auto_195758 ) ( not ( = ?auto_195751 ?auto_195759 ) ) ( not ( = ?auto_195756 ?auto_195759 ) ) ( OBJ-AT ?auto_195755 ?auto_195759 ) ( OBJ-AT ?auto_195752 ?auto_195756 ) ( TRUCK-AT ?auto_195757 ?auto_195759 ) ( OBJ-AT ?auto_195754 ?auto_195759 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195754 ?auto_195753 ?auto_195751 )
      ( DELIVER-4PKG-VERIFY ?auto_195752 ?auto_195753 ?auto_195754 ?auto_195755 ?auto_195751 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195813 - OBJ
      ?auto_195814 - OBJ
      ?auto_195815 - OBJ
      ?auto_195816 - OBJ
      ?auto_195812 - LOCATION
    )
    :vars
    (
      ?auto_195817 - LOCATION
      ?auto_195819 - CITY
      ?auto_195820 - LOCATION
      ?auto_195818 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195814 ?auto_195813 ) ) ( not ( = ?auto_195815 ?auto_195813 ) ) ( not ( = ?auto_195815 ?auto_195814 ) ) ( not ( = ?auto_195816 ?auto_195813 ) ) ( not ( = ?auto_195816 ?auto_195814 ) ) ( not ( = ?auto_195816 ?auto_195815 ) ) ( IN-CITY ?auto_195817 ?auto_195819 ) ( IN-CITY ?auto_195812 ?auto_195819 ) ( not ( = ?auto_195812 ?auto_195817 ) ) ( OBJ-AT ?auto_195814 ?auto_195817 ) ( IN-CITY ?auto_195820 ?auto_195819 ) ( not ( = ?auto_195812 ?auto_195820 ) ) ( not ( = ?auto_195817 ?auto_195820 ) ) ( OBJ-AT ?auto_195815 ?auto_195820 ) ( OBJ-AT ?auto_195813 ?auto_195817 ) ( TRUCK-AT ?auto_195818 ?auto_195820 ) ( OBJ-AT ?auto_195816 ?auto_195820 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195816 ?auto_195814 ?auto_195812 )
      ( DELIVER-4PKG-VERIFY ?auto_195813 ?auto_195814 ?auto_195815 ?auto_195816 ?auto_195812 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195904 - OBJ
      ?auto_195905 - OBJ
      ?auto_195906 - OBJ
      ?auto_195907 - OBJ
      ?auto_195903 - LOCATION
    )
    :vars
    (
      ?auto_195908 - LOCATION
      ?auto_195910 - CITY
      ?auto_195911 - LOCATION
      ?auto_195909 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195905 ?auto_195904 ) ) ( not ( = ?auto_195906 ?auto_195904 ) ) ( not ( = ?auto_195906 ?auto_195905 ) ) ( not ( = ?auto_195907 ?auto_195904 ) ) ( not ( = ?auto_195907 ?auto_195905 ) ) ( not ( = ?auto_195907 ?auto_195906 ) ) ( IN-CITY ?auto_195908 ?auto_195910 ) ( IN-CITY ?auto_195903 ?auto_195910 ) ( not ( = ?auto_195903 ?auto_195908 ) ) ( OBJ-AT ?auto_195907 ?auto_195908 ) ( IN-CITY ?auto_195911 ?auto_195910 ) ( not ( = ?auto_195903 ?auto_195911 ) ) ( not ( = ?auto_195908 ?auto_195911 ) ) ( OBJ-AT ?auto_195904 ?auto_195911 ) ( OBJ-AT ?auto_195906 ?auto_195908 ) ( TRUCK-AT ?auto_195909 ?auto_195911 ) ( OBJ-AT ?auto_195905 ?auto_195911 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195905 ?auto_195907 ?auto_195903 )
      ( DELIVER-4PKG-VERIFY ?auto_195904 ?auto_195905 ?auto_195906 ?auto_195907 ?auto_195903 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195933 - OBJ
      ?auto_195934 - OBJ
      ?auto_195935 - OBJ
      ?auto_195936 - OBJ
      ?auto_195932 - LOCATION
    )
    :vars
    (
      ?auto_195937 - LOCATION
      ?auto_195939 - CITY
      ?auto_195940 - LOCATION
      ?auto_195938 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195934 ?auto_195933 ) ) ( not ( = ?auto_195935 ?auto_195933 ) ) ( not ( = ?auto_195935 ?auto_195934 ) ) ( not ( = ?auto_195936 ?auto_195933 ) ) ( not ( = ?auto_195936 ?auto_195934 ) ) ( not ( = ?auto_195936 ?auto_195935 ) ) ( IN-CITY ?auto_195937 ?auto_195939 ) ( IN-CITY ?auto_195932 ?auto_195939 ) ( not ( = ?auto_195932 ?auto_195937 ) ) ( OBJ-AT ?auto_195935 ?auto_195937 ) ( IN-CITY ?auto_195940 ?auto_195939 ) ( not ( = ?auto_195932 ?auto_195940 ) ) ( not ( = ?auto_195937 ?auto_195940 ) ) ( OBJ-AT ?auto_195933 ?auto_195940 ) ( OBJ-AT ?auto_195936 ?auto_195937 ) ( TRUCK-AT ?auto_195938 ?auto_195940 ) ( OBJ-AT ?auto_195934 ?auto_195940 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195934 ?auto_195935 ?auto_195932 )
      ( DELIVER-4PKG-VERIFY ?auto_195933 ?auto_195934 ?auto_195935 ?auto_195936 ?auto_195932 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195962 - OBJ
      ?auto_195963 - OBJ
      ?auto_195964 - OBJ
      ?auto_195965 - OBJ
      ?auto_195961 - LOCATION
    )
    :vars
    (
      ?auto_195966 - LOCATION
      ?auto_195968 - CITY
      ?auto_195969 - LOCATION
      ?auto_195967 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195963 ?auto_195962 ) ) ( not ( = ?auto_195964 ?auto_195962 ) ) ( not ( = ?auto_195964 ?auto_195963 ) ) ( not ( = ?auto_195965 ?auto_195962 ) ) ( not ( = ?auto_195965 ?auto_195963 ) ) ( not ( = ?auto_195965 ?auto_195964 ) ) ( IN-CITY ?auto_195966 ?auto_195968 ) ( IN-CITY ?auto_195961 ?auto_195968 ) ( not ( = ?auto_195961 ?auto_195966 ) ) ( OBJ-AT ?auto_195965 ?auto_195966 ) ( IN-CITY ?auto_195969 ?auto_195968 ) ( not ( = ?auto_195961 ?auto_195969 ) ) ( not ( = ?auto_195966 ?auto_195969 ) ) ( OBJ-AT ?auto_195962 ?auto_195969 ) ( OBJ-AT ?auto_195963 ?auto_195966 ) ( TRUCK-AT ?auto_195967 ?auto_195969 ) ( OBJ-AT ?auto_195964 ?auto_195969 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195964 ?auto_195965 ?auto_195961 )
      ( DELIVER-4PKG-VERIFY ?auto_195962 ?auto_195963 ?auto_195964 ?auto_195965 ?auto_195961 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195991 - OBJ
      ?auto_195992 - OBJ
      ?auto_195993 - OBJ
      ?auto_195994 - OBJ
      ?auto_195990 - LOCATION
    )
    :vars
    (
      ?auto_195995 - LOCATION
      ?auto_195997 - CITY
      ?auto_195998 - LOCATION
      ?auto_195996 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_195992 ?auto_195991 ) ) ( not ( = ?auto_195993 ?auto_195991 ) ) ( not ( = ?auto_195993 ?auto_195992 ) ) ( not ( = ?auto_195994 ?auto_195991 ) ) ( not ( = ?auto_195994 ?auto_195992 ) ) ( not ( = ?auto_195994 ?auto_195993 ) ) ( IN-CITY ?auto_195995 ?auto_195997 ) ( IN-CITY ?auto_195990 ?auto_195997 ) ( not ( = ?auto_195990 ?auto_195995 ) ) ( OBJ-AT ?auto_195993 ?auto_195995 ) ( IN-CITY ?auto_195998 ?auto_195997 ) ( not ( = ?auto_195990 ?auto_195998 ) ) ( not ( = ?auto_195995 ?auto_195998 ) ) ( OBJ-AT ?auto_195991 ?auto_195998 ) ( OBJ-AT ?auto_195992 ?auto_195995 ) ( TRUCK-AT ?auto_195996 ?auto_195998 ) ( OBJ-AT ?auto_195994 ?auto_195998 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195994 ?auto_195993 ?auto_195990 )
      ( DELIVER-4PKG-VERIFY ?auto_195991 ?auto_195992 ?auto_195993 ?auto_195994 ?auto_195990 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196113 - OBJ
      ?auto_196114 - OBJ
      ?auto_196115 - OBJ
      ?auto_196116 - OBJ
      ?auto_196112 - LOCATION
    )
    :vars
    (
      ?auto_196117 - LOCATION
      ?auto_196119 - CITY
      ?auto_196120 - LOCATION
      ?auto_196118 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_196114 ?auto_196113 ) ) ( not ( = ?auto_196115 ?auto_196113 ) ) ( not ( = ?auto_196115 ?auto_196114 ) ) ( not ( = ?auto_196116 ?auto_196113 ) ) ( not ( = ?auto_196116 ?auto_196114 ) ) ( not ( = ?auto_196116 ?auto_196115 ) ) ( IN-CITY ?auto_196117 ?auto_196119 ) ( IN-CITY ?auto_196112 ?auto_196119 ) ( not ( = ?auto_196112 ?auto_196117 ) ) ( OBJ-AT ?auto_196114 ?auto_196117 ) ( IN-CITY ?auto_196120 ?auto_196119 ) ( not ( = ?auto_196112 ?auto_196120 ) ) ( not ( = ?auto_196117 ?auto_196120 ) ) ( OBJ-AT ?auto_196113 ?auto_196120 ) ( OBJ-AT ?auto_196116 ?auto_196117 ) ( TRUCK-AT ?auto_196118 ?auto_196120 ) ( OBJ-AT ?auto_196115 ?auto_196120 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196115 ?auto_196114 ?auto_196112 )
      ( DELIVER-4PKG-VERIFY ?auto_196113 ?auto_196114 ?auto_196115 ?auto_196116 ?auto_196112 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196142 - OBJ
      ?auto_196143 - OBJ
      ?auto_196144 - OBJ
      ?auto_196145 - OBJ
      ?auto_196141 - LOCATION
    )
    :vars
    (
      ?auto_196146 - LOCATION
      ?auto_196148 - CITY
      ?auto_196149 - LOCATION
      ?auto_196147 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_196143 ?auto_196142 ) ) ( not ( = ?auto_196144 ?auto_196142 ) ) ( not ( = ?auto_196144 ?auto_196143 ) ) ( not ( = ?auto_196145 ?auto_196142 ) ) ( not ( = ?auto_196145 ?auto_196143 ) ) ( not ( = ?auto_196145 ?auto_196144 ) ) ( IN-CITY ?auto_196146 ?auto_196148 ) ( IN-CITY ?auto_196141 ?auto_196148 ) ( not ( = ?auto_196141 ?auto_196146 ) ) ( OBJ-AT ?auto_196143 ?auto_196146 ) ( IN-CITY ?auto_196149 ?auto_196148 ) ( not ( = ?auto_196141 ?auto_196149 ) ) ( not ( = ?auto_196146 ?auto_196149 ) ) ( OBJ-AT ?auto_196142 ?auto_196149 ) ( OBJ-AT ?auto_196144 ?auto_196146 ) ( TRUCK-AT ?auto_196147 ?auto_196149 ) ( OBJ-AT ?auto_196145 ?auto_196149 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196145 ?auto_196143 ?auto_196141 )
      ( DELIVER-4PKG-VERIFY ?auto_196142 ?auto_196143 ?auto_196144 ?auto_196145 ?auto_196141 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196327 - OBJ
      ?auto_196328 - OBJ
      ?auto_196329 - OBJ
      ?auto_196330 - OBJ
      ?auto_196326 - LOCATION
    )
    :vars
    (
      ?auto_196331 - LOCATION
      ?auto_196333 - CITY
      ?auto_196334 - LOCATION
      ?auto_196332 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_196328 ?auto_196327 ) ) ( not ( = ?auto_196329 ?auto_196327 ) ) ( not ( = ?auto_196329 ?auto_196328 ) ) ( not ( = ?auto_196330 ?auto_196327 ) ) ( not ( = ?auto_196330 ?auto_196328 ) ) ( not ( = ?auto_196330 ?auto_196329 ) ) ( IN-CITY ?auto_196331 ?auto_196333 ) ( IN-CITY ?auto_196326 ?auto_196333 ) ( not ( = ?auto_196326 ?auto_196331 ) ) ( OBJ-AT ?auto_196327 ?auto_196331 ) ( IN-CITY ?auto_196334 ?auto_196333 ) ( not ( = ?auto_196326 ?auto_196334 ) ) ( not ( = ?auto_196331 ?auto_196334 ) ) ( OBJ-AT ?auto_196330 ?auto_196334 ) ( OBJ-AT ?auto_196329 ?auto_196331 ) ( TRUCK-AT ?auto_196332 ?auto_196334 ) ( OBJ-AT ?auto_196328 ?auto_196334 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196328 ?auto_196327 ?auto_196326 )
      ( DELIVER-4PKG-VERIFY ?auto_196327 ?auto_196328 ?auto_196329 ?auto_196330 ?auto_196326 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196356 - OBJ
      ?auto_196357 - OBJ
      ?auto_196358 - OBJ
      ?auto_196359 - OBJ
      ?auto_196355 - LOCATION
    )
    :vars
    (
      ?auto_196360 - LOCATION
      ?auto_196362 - CITY
      ?auto_196363 - LOCATION
      ?auto_196361 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_196357 ?auto_196356 ) ) ( not ( = ?auto_196358 ?auto_196356 ) ) ( not ( = ?auto_196358 ?auto_196357 ) ) ( not ( = ?auto_196359 ?auto_196356 ) ) ( not ( = ?auto_196359 ?auto_196357 ) ) ( not ( = ?auto_196359 ?auto_196358 ) ) ( IN-CITY ?auto_196360 ?auto_196362 ) ( IN-CITY ?auto_196355 ?auto_196362 ) ( not ( = ?auto_196355 ?auto_196360 ) ) ( OBJ-AT ?auto_196356 ?auto_196360 ) ( IN-CITY ?auto_196363 ?auto_196362 ) ( not ( = ?auto_196355 ?auto_196363 ) ) ( not ( = ?auto_196360 ?auto_196363 ) ) ( OBJ-AT ?auto_196358 ?auto_196363 ) ( OBJ-AT ?auto_196359 ?auto_196360 ) ( TRUCK-AT ?auto_196361 ?auto_196363 ) ( OBJ-AT ?auto_196357 ?auto_196363 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196357 ?auto_196356 ?auto_196355 )
      ( DELIVER-4PKG-VERIFY ?auto_196356 ?auto_196357 ?auto_196358 ?auto_196359 ?auto_196355 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196447 - OBJ
      ?auto_196448 - OBJ
      ?auto_196449 - OBJ
      ?auto_196450 - OBJ
      ?auto_196446 - LOCATION
    )
    :vars
    (
      ?auto_196451 - LOCATION
      ?auto_196453 - CITY
      ?auto_196454 - LOCATION
      ?auto_196452 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_196448 ?auto_196447 ) ) ( not ( = ?auto_196449 ?auto_196447 ) ) ( not ( = ?auto_196449 ?auto_196448 ) ) ( not ( = ?auto_196450 ?auto_196447 ) ) ( not ( = ?auto_196450 ?auto_196448 ) ) ( not ( = ?auto_196450 ?auto_196449 ) ) ( IN-CITY ?auto_196451 ?auto_196453 ) ( IN-CITY ?auto_196446 ?auto_196453 ) ( not ( = ?auto_196446 ?auto_196451 ) ) ( OBJ-AT ?auto_196447 ?auto_196451 ) ( IN-CITY ?auto_196454 ?auto_196453 ) ( not ( = ?auto_196446 ?auto_196454 ) ) ( not ( = ?auto_196451 ?auto_196454 ) ) ( OBJ-AT ?auto_196450 ?auto_196454 ) ( OBJ-AT ?auto_196448 ?auto_196451 ) ( TRUCK-AT ?auto_196452 ?auto_196454 ) ( OBJ-AT ?auto_196449 ?auto_196454 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196449 ?auto_196447 ?auto_196446 )
      ( DELIVER-4PKG-VERIFY ?auto_196447 ?auto_196448 ?auto_196449 ?auto_196450 ?auto_196446 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196508 - OBJ
      ?auto_196509 - OBJ
      ?auto_196510 - OBJ
      ?auto_196511 - OBJ
      ?auto_196507 - LOCATION
    )
    :vars
    (
      ?auto_196512 - LOCATION
      ?auto_196514 - CITY
      ?auto_196515 - LOCATION
      ?auto_196513 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_196509 ?auto_196508 ) ) ( not ( = ?auto_196510 ?auto_196508 ) ) ( not ( = ?auto_196510 ?auto_196509 ) ) ( not ( = ?auto_196511 ?auto_196508 ) ) ( not ( = ?auto_196511 ?auto_196509 ) ) ( not ( = ?auto_196511 ?auto_196510 ) ) ( IN-CITY ?auto_196512 ?auto_196514 ) ( IN-CITY ?auto_196507 ?auto_196514 ) ( not ( = ?auto_196507 ?auto_196512 ) ) ( OBJ-AT ?auto_196508 ?auto_196512 ) ( IN-CITY ?auto_196515 ?auto_196514 ) ( not ( = ?auto_196507 ?auto_196515 ) ) ( not ( = ?auto_196512 ?auto_196515 ) ) ( OBJ-AT ?auto_196510 ?auto_196515 ) ( OBJ-AT ?auto_196509 ?auto_196512 ) ( TRUCK-AT ?auto_196513 ?auto_196515 ) ( OBJ-AT ?auto_196511 ?auto_196515 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196511 ?auto_196508 ?auto_196507 )
      ( DELIVER-4PKG-VERIFY ?auto_196508 ?auto_196509 ?auto_196510 ?auto_196511 ?auto_196507 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196599 - OBJ
      ?auto_196600 - OBJ
      ?auto_196601 - OBJ
      ?auto_196602 - OBJ
      ?auto_196598 - LOCATION
    )
    :vars
    (
      ?auto_196603 - LOCATION
      ?auto_196605 - CITY
      ?auto_196606 - LOCATION
      ?auto_196604 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_196600 ?auto_196599 ) ) ( not ( = ?auto_196601 ?auto_196599 ) ) ( not ( = ?auto_196601 ?auto_196600 ) ) ( not ( = ?auto_196602 ?auto_196599 ) ) ( not ( = ?auto_196602 ?auto_196600 ) ) ( not ( = ?auto_196602 ?auto_196601 ) ) ( IN-CITY ?auto_196603 ?auto_196605 ) ( IN-CITY ?auto_196598 ?auto_196605 ) ( not ( = ?auto_196598 ?auto_196603 ) ) ( OBJ-AT ?auto_196599 ?auto_196603 ) ( IN-CITY ?auto_196606 ?auto_196605 ) ( not ( = ?auto_196598 ?auto_196606 ) ) ( not ( = ?auto_196603 ?auto_196606 ) ) ( OBJ-AT ?auto_196600 ?auto_196606 ) ( OBJ-AT ?auto_196602 ?auto_196603 ) ( TRUCK-AT ?auto_196604 ?auto_196606 ) ( OBJ-AT ?auto_196601 ?auto_196606 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196601 ?auto_196599 ?auto_196598 )
      ( DELIVER-4PKG-VERIFY ?auto_196599 ?auto_196600 ?auto_196601 ?auto_196602 ?auto_196598 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196628 - OBJ
      ?auto_196629 - OBJ
      ?auto_196630 - OBJ
      ?auto_196631 - OBJ
      ?auto_196627 - LOCATION
    )
    :vars
    (
      ?auto_196632 - LOCATION
      ?auto_196634 - CITY
      ?auto_196635 - LOCATION
      ?auto_196633 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_196629 ?auto_196628 ) ) ( not ( = ?auto_196630 ?auto_196628 ) ) ( not ( = ?auto_196630 ?auto_196629 ) ) ( not ( = ?auto_196631 ?auto_196628 ) ) ( not ( = ?auto_196631 ?auto_196629 ) ) ( not ( = ?auto_196631 ?auto_196630 ) ) ( IN-CITY ?auto_196632 ?auto_196634 ) ( IN-CITY ?auto_196627 ?auto_196634 ) ( not ( = ?auto_196627 ?auto_196632 ) ) ( OBJ-AT ?auto_196628 ?auto_196632 ) ( IN-CITY ?auto_196635 ?auto_196634 ) ( not ( = ?auto_196627 ?auto_196635 ) ) ( not ( = ?auto_196632 ?auto_196635 ) ) ( OBJ-AT ?auto_196629 ?auto_196635 ) ( OBJ-AT ?auto_196630 ?auto_196632 ) ( TRUCK-AT ?auto_196633 ?auto_196635 ) ( OBJ-AT ?auto_196631 ?auto_196635 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196631 ?auto_196628 ?auto_196627 )
      ( DELIVER-4PKG-VERIFY ?auto_196628 ?auto_196629 ?auto_196630 ?auto_196631 ?auto_196627 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_196922 - OBJ
      ?auto_196921 - LOCATION
    )
    :vars
    (
      ?auto_196929 - OBJ
      ?auto_196923 - LOCATION
      ?auto_196926 - CITY
      ?auto_196924 - OBJ
      ?auto_196927 - LOCATION
      ?auto_196928 - OBJ
      ?auto_196925 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_196922 ?auto_196929 ) ) ( IN-CITY ?auto_196923 ?auto_196926 ) ( IN-CITY ?auto_196921 ?auto_196926 ) ( not ( = ?auto_196921 ?auto_196923 ) ) ( OBJ-AT ?auto_196922 ?auto_196923 ) ( not ( = ?auto_196924 ?auto_196929 ) ) ( not ( = ?auto_196922 ?auto_196924 ) ) ( IN-CITY ?auto_196927 ?auto_196926 ) ( not ( = ?auto_196921 ?auto_196927 ) ) ( not ( = ?auto_196923 ?auto_196927 ) ) ( OBJ-AT ?auto_196924 ?auto_196927 ) ( not ( = ?auto_196928 ?auto_196929 ) ) ( not ( = ?auto_196922 ?auto_196928 ) ) ( not ( = ?auto_196924 ?auto_196928 ) ) ( OBJ-AT ?auto_196928 ?auto_196923 ) ( OBJ-AT ?auto_196929 ?auto_196927 ) ( TRUCK-AT ?auto_196925 ?auto_196921 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_196925 ?auto_196921 ?auto_196927 ?auto_196926 )
      ( DELIVER-2PKG ?auto_196929 ?auto_196922 ?auto_196921 )
      ( DELIVER-1PKG-VERIFY ?auto_196922 ?auto_196921 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_196931 - OBJ
      ?auto_196932 - OBJ
      ?auto_196930 - LOCATION
    )
    :vars
    (
      ?auto_196934 - LOCATION
      ?auto_196938 - CITY
      ?auto_196935 - OBJ
      ?auto_196937 - LOCATION
      ?auto_196936 - OBJ
      ?auto_196933 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_196932 ?auto_196931 ) ) ( IN-CITY ?auto_196934 ?auto_196938 ) ( IN-CITY ?auto_196930 ?auto_196938 ) ( not ( = ?auto_196930 ?auto_196934 ) ) ( OBJ-AT ?auto_196932 ?auto_196934 ) ( not ( = ?auto_196935 ?auto_196931 ) ) ( not ( = ?auto_196932 ?auto_196935 ) ) ( IN-CITY ?auto_196937 ?auto_196938 ) ( not ( = ?auto_196930 ?auto_196937 ) ) ( not ( = ?auto_196934 ?auto_196937 ) ) ( OBJ-AT ?auto_196935 ?auto_196937 ) ( not ( = ?auto_196936 ?auto_196931 ) ) ( not ( = ?auto_196932 ?auto_196936 ) ) ( not ( = ?auto_196935 ?auto_196936 ) ) ( OBJ-AT ?auto_196936 ?auto_196934 ) ( OBJ-AT ?auto_196931 ?auto_196937 ) ( TRUCK-AT ?auto_196933 ?auto_196930 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_196932 ?auto_196930 )
      ( DELIVER-2PKG-VERIFY ?auto_196931 ?auto_196932 ?auto_196930 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_196940 - OBJ
      ?auto_196941 - OBJ
      ?auto_196939 - LOCATION
    )
    :vars
    (
      ?auto_196947 - OBJ
      ?auto_196943 - LOCATION
      ?auto_196942 - CITY
      ?auto_196945 - OBJ
      ?auto_196944 - LOCATION
      ?auto_196946 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_196941 ?auto_196940 ) ) ( not ( = ?auto_196941 ?auto_196947 ) ) ( IN-CITY ?auto_196943 ?auto_196942 ) ( IN-CITY ?auto_196939 ?auto_196942 ) ( not ( = ?auto_196939 ?auto_196943 ) ) ( OBJ-AT ?auto_196941 ?auto_196943 ) ( not ( = ?auto_196945 ?auto_196947 ) ) ( not ( = ?auto_196941 ?auto_196945 ) ) ( IN-CITY ?auto_196944 ?auto_196942 ) ( not ( = ?auto_196939 ?auto_196944 ) ) ( not ( = ?auto_196943 ?auto_196944 ) ) ( OBJ-AT ?auto_196945 ?auto_196944 ) ( not ( = ?auto_196940 ?auto_196947 ) ) ( not ( = ?auto_196945 ?auto_196940 ) ) ( OBJ-AT ?auto_196940 ?auto_196943 ) ( OBJ-AT ?auto_196947 ?auto_196944 ) ( TRUCK-AT ?auto_196946 ?auto_196939 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196947 ?auto_196941 ?auto_196939 )
      ( DELIVER-2PKG-VERIFY ?auto_196940 ?auto_196941 ?auto_196939 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_196949 - OBJ
      ?auto_196950 - OBJ
      ?auto_196948 - LOCATION
    )
    :vars
    (
      ?auto_196956 - OBJ
      ?auto_196953 - LOCATION
      ?auto_196951 - CITY
      ?auto_196954 - LOCATION
      ?auto_196952 - OBJ
      ?auto_196955 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_196950 ?auto_196949 ) ) ( not ( = ?auto_196950 ?auto_196956 ) ) ( IN-CITY ?auto_196953 ?auto_196951 ) ( IN-CITY ?auto_196948 ?auto_196951 ) ( not ( = ?auto_196948 ?auto_196953 ) ) ( OBJ-AT ?auto_196950 ?auto_196953 ) ( not ( = ?auto_196949 ?auto_196956 ) ) ( IN-CITY ?auto_196954 ?auto_196951 ) ( not ( = ?auto_196948 ?auto_196954 ) ) ( not ( = ?auto_196953 ?auto_196954 ) ) ( OBJ-AT ?auto_196949 ?auto_196954 ) ( not ( = ?auto_196952 ?auto_196956 ) ) ( not ( = ?auto_196950 ?auto_196952 ) ) ( not ( = ?auto_196949 ?auto_196952 ) ) ( OBJ-AT ?auto_196952 ?auto_196953 ) ( OBJ-AT ?auto_196956 ?auto_196954 ) ( TRUCK-AT ?auto_196955 ?auto_196948 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196956 ?auto_196950 ?auto_196948 )
      ( DELIVER-2PKG-VERIFY ?auto_196949 ?auto_196950 ?auto_196948 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_196958 - OBJ
      ?auto_196959 - OBJ
      ?auto_196957 - LOCATION
    )
    :vars
    (
      ?auto_196962 - LOCATION
      ?auto_196960 - CITY
      ?auto_196964 - OBJ
      ?auto_196963 - LOCATION
      ?auto_196961 - OBJ
      ?auto_196965 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_196959 ?auto_196958 ) ) ( IN-CITY ?auto_196962 ?auto_196960 ) ( IN-CITY ?auto_196957 ?auto_196960 ) ( not ( = ?auto_196957 ?auto_196962 ) ) ( OBJ-AT ?auto_196958 ?auto_196962 ) ( not ( = ?auto_196964 ?auto_196959 ) ) ( not ( = ?auto_196958 ?auto_196964 ) ) ( IN-CITY ?auto_196963 ?auto_196960 ) ( not ( = ?auto_196957 ?auto_196963 ) ) ( not ( = ?auto_196962 ?auto_196963 ) ) ( OBJ-AT ?auto_196964 ?auto_196963 ) ( not ( = ?auto_196961 ?auto_196959 ) ) ( not ( = ?auto_196958 ?auto_196961 ) ) ( not ( = ?auto_196964 ?auto_196961 ) ) ( OBJ-AT ?auto_196961 ?auto_196962 ) ( OBJ-AT ?auto_196959 ?auto_196963 ) ( TRUCK-AT ?auto_196965 ?auto_196957 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196959 ?auto_196958 ?auto_196957 )
      ( DELIVER-2PKG-VERIFY ?auto_196958 ?auto_196959 ?auto_196957 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_196967 - OBJ
      ?auto_196968 - OBJ
      ?auto_196966 - LOCATION
    )
    :vars
    (
      ?auto_196974 - OBJ
      ?auto_196970 - LOCATION
      ?auto_196969 - CITY
      ?auto_196972 - OBJ
      ?auto_196971 - LOCATION
      ?auto_196973 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_196968 ?auto_196967 ) ) ( not ( = ?auto_196967 ?auto_196974 ) ) ( IN-CITY ?auto_196970 ?auto_196969 ) ( IN-CITY ?auto_196966 ?auto_196969 ) ( not ( = ?auto_196966 ?auto_196970 ) ) ( OBJ-AT ?auto_196967 ?auto_196970 ) ( not ( = ?auto_196972 ?auto_196974 ) ) ( not ( = ?auto_196967 ?auto_196972 ) ) ( IN-CITY ?auto_196971 ?auto_196969 ) ( not ( = ?auto_196966 ?auto_196971 ) ) ( not ( = ?auto_196970 ?auto_196971 ) ) ( OBJ-AT ?auto_196972 ?auto_196971 ) ( not ( = ?auto_196968 ?auto_196974 ) ) ( not ( = ?auto_196972 ?auto_196968 ) ) ( OBJ-AT ?auto_196968 ?auto_196970 ) ( OBJ-AT ?auto_196974 ?auto_196971 ) ( TRUCK-AT ?auto_196973 ?auto_196966 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196974 ?auto_196967 ?auto_196966 )
      ( DELIVER-2PKG-VERIFY ?auto_196967 ?auto_196968 ?auto_196966 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_196976 - OBJ
      ?auto_196977 - OBJ
      ?auto_196975 - LOCATION
    )
    :vars
    (
      ?auto_196983 - OBJ
      ?auto_196980 - LOCATION
      ?auto_196978 - CITY
      ?auto_196981 - LOCATION
      ?auto_196979 - OBJ
      ?auto_196982 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_196977 ?auto_196976 ) ) ( not ( = ?auto_196976 ?auto_196983 ) ) ( IN-CITY ?auto_196980 ?auto_196978 ) ( IN-CITY ?auto_196975 ?auto_196978 ) ( not ( = ?auto_196975 ?auto_196980 ) ) ( OBJ-AT ?auto_196976 ?auto_196980 ) ( not ( = ?auto_196977 ?auto_196983 ) ) ( IN-CITY ?auto_196981 ?auto_196978 ) ( not ( = ?auto_196975 ?auto_196981 ) ) ( not ( = ?auto_196980 ?auto_196981 ) ) ( OBJ-AT ?auto_196977 ?auto_196981 ) ( not ( = ?auto_196979 ?auto_196983 ) ) ( not ( = ?auto_196976 ?auto_196979 ) ) ( not ( = ?auto_196977 ?auto_196979 ) ) ( OBJ-AT ?auto_196979 ?auto_196980 ) ( OBJ-AT ?auto_196983 ?auto_196981 ) ( TRUCK-AT ?auto_196982 ?auto_196975 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196983 ?auto_196976 ?auto_196975 )
      ( DELIVER-2PKG-VERIFY ?auto_196976 ?auto_196977 ?auto_196975 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_197005 - OBJ
      ?auto_197006 - OBJ
      ?auto_197007 - OBJ
      ?auto_197004 - LOCATION
    )
    :vars
    (
      ?auto_197009 - LOCATION
      ?auto_197008 - CITY
      ?auto_197011 - OBJ
      ?auto_197010 - LOCATION
      ?auto_197012 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197006 ?auto_197005 ) ) ( not ( = ?auto_197007 ?auto_197005 ) ) ( not ( = ?auto_197007 ?auto_197006 ) ) ( IN-CITY ?auto_197009 ?auto_197008 ) ( IN-CITY ?auto_197004 ?auto_197008 ) ( not ( = ?auto_197004 ?auto_197009 ) ) ( OBJ-AT ?auto_197007 ?auto_197009 ) ( not ( = ?auto_197011 ?auto_197005 ) ) ( not ( = ?auto_197007 ?auto_197011 ) ) ( IN-CITY ?auto_197010 ?auto_197008 ) ( not ( = ?auto_197004 ?auto_197010 ) ) ( not ( = ?auto_197009 ?auto_197010 ) ) ( OBJ-AT ?auto_197011 ?auto_197010 ) ( not ( = ?auto_197011 ?auto_197006 ) ) ( OBJ-AT ?auto_197006 ?auto_197009 ) ( OBJ-AT ?auto_197005 ?auto_197010 ) ( TRUCK-AT ?auto_197012 ?auto_197004 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197005 ?auto_197007 ?auto_197004 )
      ( DELIVER-3PKG-VERIFY ?auto_197005 ?auto_197006 ?auto_197007 ?auto_197004 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_197014 - OBJ
      ?auto_197015 - OBJ
      ?auto_197016 - OBJ
      ?auto_197013 - LOCATION
    )
    :vars
    (
      ?auto_197019 - LOCATION
      ?auto_197017 - CITY
      ?auto_197020 - LOCATION
      ?auto_197018 - OBJ
      ?auto_197021 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197015 ?auto_197014 ) ) ( not ( = ?auto_197016 ?auto_197014 ) ) ( not ( = ?auto_197016 ?auto_197015 ) ) ( IN-CITY ?auto_197019 ?auto_197017 ) ( IN-CITY ?auto_197013 ?auto_197017 ) ( not ( = ?auto_197013 ?auto_197019 ) ) ( OBJ-AT ?auto_197016 ?auto_197019 ) ( IN-CITY ?auto_197020 ?auto_197017 ) ( not ( = ?auto_197013 ?auto_197020 ) ) ( not ( = ?auto_197019 ?auto_197020 ) ) ( OBJ-AT ?auto_197015 ?auto_197020 ) ( not ( = ?auto_197018 ?auto_197014 ) ) ( not ( = ?auto_197016 ?auto_197018 ) ) ( not ( = ?auto_197015 ?auto_197018 ) ) ( OBJ-AT ?auto_197018 ?auto_197019 ) ( OBJ-AT ?auto_197014 ?auto_197020 ) ( TRUCK-AT ?auto_197021 ?auto_197013 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197014 ?auto_197016 ?auto_197013 )
      ( DELIVER-3PKG-VERIFY ?auto_197014 ?auto_197015 ?auto_197016 ?auto_197013 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_197033 - OBJ
      ?auto_197034 - OBJ
      ?auto_197035 - OBJ
      ?auto_197032 - LOCATION
    )
    :vars
    (
      ?auto_197037 - LOCATION
      ?auto_197036 - CITY
      ?auto_197039 - OBJ
      ?auto_197038 - LOCATION
      ?auto_197040 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197034 ?auto_197033 ) ) ( not ( = ?auto_197035 ?auto_197033 ) ) ( not ( = ?auto_197035 ?auto_197034 ) ) ( IN-CITY ?auto_197037 ?auto_197036 ) ( IN-CITY ?auto_197032 ?auto_197036 ) ( not ( = ?auto_197032 ?auto_197037 ) ) ( OBJ-AT ?auto_197034 ?auto_197037 ) ( not ( = ?auto_197039 ?auto_197033 ) ) ( not ( = ?auto_197034 ?auto_197039 ) ) ( IN-CITY ?auto_197038 ?auto_197036 ) ( not ( = ?auto_197032 ?auto_197038 ) ) ( not ( = ?auto_197037 ?auto_197038 ) ) ( OBJ-AT ?auto_197039 ?auto_197038 ) ( not ( = ?auto_197039 ?auto_197035 ) ) ( OBJ-AT ?auto_197035 ?auto_197037 ) ( OBJ-AT ?auto_197033 ?auto_197038 ) ( TRUCK-AT ?auto_197040 ?auto_197032 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197033 ?auto_197034 ?auto_197032 )
      ( DELIVER-3PKG-VERIFY ?auto_197033 ?auto_197034 ?auto_197035 ?auto_197032 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_197042 - OBJ
      ?auto_197043 - OBJ
      ?auto_197044 - OBJ
      ?auto_197041 - LOCATION
    )
    :vars
    (
      ?auto_197047 - LOCATION
      ?auto_197045 - CITY
      ?auto_197048 - LOCATION
      ?auto_197046 - OBJ
      ?auto_197049 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197043 ?auto_197042 ) ) ( not ( = ?auto_197044 ?auto_197042 ) ) ( not ( = ?auto_197044 ?auto_197043 ) ) ( IN-CITY ?auto_197047 ?auto_197045 ) ( IN-CITY ?auto_197041 ?auto_197045 ) ( not ( = ?auto_197041 ?auto_197047 ) ) ( OBJ-AT ?auto_197043 ?auto_197047 ) ( IN-CITY ?auto_197048 ?auto_197045 ) ( not ( = ?auto_197041 ?auto_197048 ) ) ( not ( = ?auto_197047 ?auto_197048 ) ) ( OBJ-AT ?auto_197044 ?auto_197048 ) ( not ( = ?auto_197046 ?auto_197042 ) ) ( not ( = ?auto_197043 ?auto_197046 ) ) ( not ( = ?auto_197044 ?auto_197046 ) ) ( OBJ-AT ?auto_197046 ?auto_197047 ) ( OBJ-AT ?auto_197042 ?auto_197048 ) ( TRUCK-AT ?auto_197049 ?auto_197041 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197042 ?auto_197043 ?auto_197041 )
      ( DELIVER-3PKG-VERIFY ?auto_197042 ?auto_197043 ?auto_197044 ?auto_197041 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_197061 - OBJ
      ?auto_197062 - OBJ
      ?auto_197063 - OBJ
      ?auto_197060 - LOCATION
    )
    :vars
    (
      ?auto_197065 - LOCATION
      ?auto_197064 - CITY
      ?auto_197067 - OBJ
      ?auto_197066 - LOCATION
      ?auto_197068 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197062 ?auto_197061 ) ) ( not ( = ?auto_197063 ?auto_197061 ) ) ( not ( = ?auto_197063 ?auto_197062 ) ) ( IN-CITY ?auto_197065 ?auto_197064 ) ( IN-CITY ?auto_197060 ?auto_197064 ) ( not ( = ?auto_197060 ?auto_197065 ) ) ( OBJ-AT ?auto_197063 ?auto_197065 ) ( not ( = ?auto_197067 ?auto_197062 ) ) ( not ( = ?auto_197063 ?auto_197067 ) ) ( IN-CITY ?auto_197066 ?auto_197064 ) ( not ( = ?auto_197060 ?auto_197066 ) ) ( not ( = ?auto_197065 ?auto_197066 ) ) ( OBJ-AT ?auto_197067 ?auto_197066 ) ( not ( = ?auto_197067 ?auto_197061 ) ) ( OBJ-AT ?auto_197061 ?auto_197065 ) ( OBJ-AT ?auto_197062 ?auto_197066 ) ( TRUCK-AT ?auto_197068 ?auto_197060 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197062 ?auto_197063 ?auto_197060 )
      ( DELIVER-3PKG-VERIFY ?auto_197061 ?auto_197062 ?auto_197063 ?auto_197060 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_197080 - OBJ
      ?auto_197081 - OBJ
      ?auto_197082 - OBJ
      ?auto_197079 - LOCATION
    )
    :vars
    (
      ?auto_197087 - OBJ
      ?auto_197084 - LOCATION
      ?auto_197083 - CITY
      ?auto_197085 - LOCATION
      ?auto_197086 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197081 ?auto_197080 ) ) ( not ( = ?auto_197082 ?auto_197080 ) ) ( not ( = ?auto_197082 ?auto_197081 ) ) ( not ( = ?auto_197082 ?auto_197087 ) ) ( IN-CITY ?auto_197084 ?auto_197083 ) ( IN-CITY ?auto_197079 ?auto_197083 ) ( not ( = ?auto_197079 ?auto_197084 ) ) ( OBJ-AT ?auto_197082 ?auto_197084 ) ( not ( = ?auto_197081 ?auto_197087 ) ) ( IN-CITY ?auto_197085 ?auto_197083 ) ( not ( = ?auto_197079 ?auto_197085 ) ) ( not ( = ?auto_197084 ?auto_197085 ) ) ( OBJ-AT ?auto_197081 ?auto_197085 ) ( not ( = ?auto_197080 ?auto_197087 ) ) ( OBJ-AT ?auto_197080 ?auto_197084 ) ( OBJ-AT ?auto_197087 ?auto_197085 ) ( TRUCK-AT ?auto_197086 ?auto_197079 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197087 ?auto_197082 ?auto_197079 )
      ( DELIVER-3PKG-VERIFY ?auto_197080 ?auto_197081 ?auto_197082 ?auto_197079 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_197089 - OBJ
      ?auto_197090 - OBJ
      ?auto_197091 - OBJ
      ?auto_197088 - LOCATION
    )
    :vars
    (
      ?auto_197093 - LOCATION
      ?auto_197092 - CITY
      ?auto_197095 - OBJ
      ?auto_197094 - LOCATION
      ?auto_197096 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197090 ?auto_197089 ) ) ( not ( = ?auto_197091 ?auto_197089 ) ) ( not ( = ?auto_197091 ?auto_197090 ) ) ( IN-CITY ?auto_197093 ?auto_197092 ) ( IN-CITY ?auto_197088 ?auto_197092 ) ( not ( = ?auto_197088 ?auto_197093 ) ) ( OBJ-AT ?auto_197090 ?auto_197093 ) ( not ( = ?auto_197095 ?auto_197091 ) ) ( not ( = ?auto_197090 ?auto_197095 ) ) ( IN-CITY ?auto_197094 ?auto_197092 ) ( not ( = ?auto_197088 ?auto_197094 ) ) ( not ( = ?auto_197093 ?auto_197094 ) ) ( OBJ-AT ?auto_197095 ?auto_197094 ) ( not ( = ?auto_197095 ?auto_197089 ) ) ( OBJ-AT ?auto_197089 ?auto_197093 ) ( OBJ-AT ?auto_197091 ?auto_197094 ) ( TRUCK-AT ?auto_197096 ?auto_197088 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197091 ?auto_197090 ?auto_197088 )
      ( DELIVER-3PKG-VERIFY ?auto_197089 ?auto_197090 ?auto_197091 ?auto_197088 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_197108 - OBJ
      ?auto_197109 - OBJ
      ?auto_197110 - OBJ
      ?auto_197107 - LOCATION
    )
    :vars
    (
      ?auto_197115 - OBJ
      ?auto_197112 - LOCATION
      ?auto_197111 - CITY
      ?auto_197113 - LOCATION
      ?auto_197114 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197109 ?auto_197108 ) ) ( not ( = ?auto_197110 ?auto_197108 ) ) ( not ( = ?auto_197110 ?auto_197109 ) ) ( not ( = ?auto_197109 ?auto_197115 ) ) ( IN-CITY ?auto_197112 ?auto_197111 ) ( IN-CITY ?auto_197107 ?auto_197111 ) ( not ( = ?auto_197107 ?auto_197112 ) ) ( OBJ-AT ?auto_197109 ?auto_197112 ) ( not ( = ?auto_197110 ?auto_197115 ) ) ( IN-CITY ?auto_197113 ?auto_197111 ) ( not ( = ?auto_197107 ?auto_197113 ) ) ( not ( = ?auto_197112 ?auto_197113 ) ) ( OBJ-AT ?auto_197110 ?auto_197113 ) ( not ( = ?auto_197108 ?auto_197115 ) ) ( OBJ-AT ?auto_197108 ?auto_197112 ) ( OBJ-AT ?auto_197115 ?auto_197113 ) ( TRUCK-AT ?auto_197114 ?auto_197107 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197115 ?auto_197109 ?auto_197107 )
      ( DELIVER-3PKG-VERIFY ?auto_197108 ?auto_197109 ?auto_197110 ?auto_197107 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_197127 - OBJ
      ?auto_197128 - OBJ
      ?auto_197129 - OBJ
      ?auto_197126 - LOCATION
    )
    :vars
    (
      ?auto_197132 - LOCATION
      ?auto_197130 - CITY
      ?auto_197133 - LOCATION
      ?auto_197131 - OBJ
      ?auto_197134 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197128 ?auto_197127 ) ) ( not ( = ?auto_197129 ?auto_197127 ) ) ( not ( = ?auto_197129 ?auto_197128 ) ) ( IN-CITY ?auto_197132 ?auto_197130 ) ( IN-CITY ?auto_197126 ?auto_197130 ) ( not ( = ?auto_197126 ?auto_197132 ) ) ( OBJ-AT ?auto_197129 ?auto_197132 ) ( IN-CITY ?auto_197133 ?auto_197130 ) ( not ( = ?auto_197126 ?auto_197133 ) ) ( not ( = ?auto_197132 ?auto_197133 ) ) ( OBJ-AT ?auto_197127 ?auto_197133 ) ( not ( = ?auto_197131 ?auto_197128 ) ) ( not ( = ?auto_197129 ?auto_197131 ) ) ( not ( = ?auto_197127 ?auto_197131 ) ) ( OBJ-AT ?auto_197131 ?auto_197132 ) ( OBJ-AT ?auto_197128 ?auto_197133 ) ( TRUCK-AT ?auto_197134 ?auto_197126 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197128 ?auto_197129 ?auto_197126 )
      ( DELIVER-3PKG-VERIFY ?auto_197127 ?auto_197128 ?auto_197129 ?auto_197126 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_197136 - OBJ
      ?auto_197137 - OBJ
      ?auto_197138 - OBJ
      ?auto_197135 - LOCATION
    )
    :vars
    (
      ?auto_197143 - OBJ
      ?auto_197140 - LOCATION
      ?auto_197139 - CITY
      ?auto_197141 - LOCATION
      ?auto_197142 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197137 ?auto_197136 ) ) ( not ( = ?auto_197138 ?auto_197136 ) ) ( not ( = ?auto_197138 ?auto_197137 ) ) ( not ( = ?auto_197138 ?auto_197143 ) ) ( IN-CITY ?auto_197140 ?auto_197139 ) ( IN-CITY ?auto_197135 ?auto_197139 ) ( not ( = ?auto_197135 ?auto_197140 ) ) ( OBJ-AT ?auto_197138 ?auto_197140 ) ( not ( = ?auto_197136 ?auto_197143 ) ) ( IN-CITY ?auto_197141 ?auto_197139 ) ( not ( = ?auto_197135 ?auto_197141 ) ) ( not ( = ?auto_197140 ?auto_197141 ) ) ( OBJ-AT ?auto_197136 ?auto_197141 ) ( not ( = ?auto_197137 ?auto_197143 ) ) ( OBJ-AT ?auto_197137 ?auto_197140 ) ( OBJ-AT ?auto_197143 ?auto_197141 ) ( TRUCK-AT ?auto_197142 ?auto_197135 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197143 ?auto_197138 ?auto_197135 )
      ( DELIVER-3PKG-VERIFY ?auto_197136 ?auto_197137 ?auto_197138 ?auto_197135 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_197155 - OBJ
      ?auto_197156 - OBJ
      ?auto_197157 - OBJ
      ?auto_197154 - LOCATION
    )
    :vars
    (
      ?auto_197160 - LOCATION
      ?auto_197158 - CITY
      ?auto_197161 - LOCATION
      ?auto_197159 - OBJ
      ?auto_197162 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197156 ?auto_197155 ) ) ( not ( = ?auto_197157 ?auto_197155 ) ) ( not ( = ?auto_197157 ?auto_197156 ) ) ( IN-CITY ?auto_197160 ?auto_197158 ) ( IN-CITY ?auto_197154 ?auto_197158 ) ( not ( = ?auto_197154 ?auto_197160 ) ) ( OBJ-AT ?auto_197156 ?auto_197160 ) ( IN-CITY ?auto_197161 ?auto_197158 ) ( not ( = ?auto_197154 ?auto_197161 ) ) ( not ( = ?auto_197160 ?auto_197161 ) ) ( OBJ-AT ?auto_197155 ?auto_197161 ) ( not ( = ?auto_197159 ?auto_197157 ) ) ( not ( = ?auto_197156 ?auto_197159 ) ) ( not ( = ?auto_197155 ?auto_197159 ) ) ( OBJ-AT ?auto_197159 ?auto_197160 ) ( OBJ-AT ?auto_197157 ?auto_197161 ) ( TRUCK-AT ?auto_197162 ?auto_197154 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197157 ?auto_197156 ?auto_197154 )
      ( DELIVER-3PKG-VERIFY ?auto_197155 ?auto_197156 ?auto_197157 ?auto_197154 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_197164 - OBJ
      ?auto_197165 - OBJ
      ?auto_197166 - OBJ
      ?auto_197163 - LOCATION
    )
    :vars
    (
      ?auto_197171 - OBJ
      ?auto_197168 - LOCATION
      ?auto_197167 - CITY
      ?auto_197169 - LOCATION
      ?auto_197170 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197165 ?auto_197164 ) ) ( not ( = ?auto_197166 ?auto_197164 ) ) ( not ( = ?auto_197166 ?auto_197165 ) ) ( not ( = ?auto_197165 ?auto_197171 ) ) ( IN-CITY ?auto_197168 ?auto_197167 ) ( IN-CITY ?auto_197163 ?auto_197167 ) ( not ( = ?auto_197163 ?auto_197168 ) ) ( OBJ-AT ?auto_197165 ?auto_197168 ) ( not ( = ?auto_197164 ?auto_197171 ) ) ( IN-CITY ?auto_197169 ?auto_197167 ) ( not ( = ?auto_197163 ?auto_197169 ) ) ( not ( = ?auto_197168 ?auto_197169 ) ) ( OBJ-AT ?auto_197164 ?auto_197169 ) ( not ( = ?auto_197166 ?auto_197171 ) ) ( OBJ-AT ?auto_197166 ?auto_197168 ) ( OBJ-AT ?auto_197171 ?auto_197169 ) ( TRUCK-AT ?auto_197170 ?auto_197163 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197171 ?auto_197165 ?auto_197163 )
      ( DELIVER-3PKG-VERIFY ?auto_197164 ?auto_197165 ?auto_197166 ?auto_197163 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_197203 - OBJ
      ?auto_197204 - OBJ
      ?auto_197205 - OBJ
      ?auto_197202 - LOCATION
    )
    :vars
    (
      ?auto_197207 - LOCATION
      ?auto_197206 - CITY
      ?auto_197209 - OBJ
      ?auto_197208 - LOCATION
      ?auto_197210 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197204 ?auto_197203 ) ) ( not ( = ?auto_197205 ?auto_197203 ) ) ( not ( = ?auto_197205 ?auto_197204 ) ) ( IN-CITY ?auto_197207 ?auto_197206 ) ( IN-CITY ?auto_197202 ?auto_197206 ) ( not ( = ?auto_197202 ?auto_197207 ) ) ( OBJ-AT ?auto_197203 ?auto_197207 ) ( not ( = ?auto_197209 ?auto_197204 ) ) ( not ( = ?auto_197203 ?auto_197209 ) ) ( IN-CITY ?auto_197208 ?auto_197206 ) ( not ( = ?auto_197202 ?auto_197208 ) ) ( not ( = ?auto_197207 ?auto_197208 ) ) ( OBJ-AT ?auto_197209 ?auto_197208 ) ( not ( = ?auto_197209 ?auto_197205 ) ) ( OBJ-AT ?auto_197205 ?auto_197207 ) ( OBJ-AT ?auto_197204 ?auto_197208 ) ( TRUCK-AT ?auto_197210 ?auto_197202 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197204 ?auto_197203 ?auto_197202 )
      ( DELIVER-3PKG-VERIFY ?auto_197203 ?auto_197204 ?auto_197205 ?auto_197202 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_197212 - OBJ
      ?auto_197213 - OBJ
      ?auto_197214 - OBJ
      ?auto_197211 - LOCATION
    )
    :vars
    (
      ?auto_197217 - LOCATION
      ?auto_197215 - CITY
      ?auto_197218 - LOCATION
      ?auto_197216 - OBJ
      ?auto_197219 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197213 ?auto_197212 ) ) ( not ( = ?auto_197214 ?auto_197212 ) ) ( not ( = ?auto_197214 ?auto_197213 ) ) ( IN-CITY ?auto_197217 ?auto_197215 ) ( IN-CITY ?auto_197211 ?auto_197215 ) ( not ( = ?auto_197211 ?auto_197217 ) ) ( OBJ-AT ?auto_197212 ?auto_197217 ) ( IN-CITY ?auto_197218 ?auto_197215 ) ( not ( = ?auto_197211 ?auto_197218 ) ) ( not ( = ?auto_197217 ?auto_197218 ) ) ( OBJ-AT ?auto_197214 ?auto_197218 ) ( not ( = ?auto_197216 ?auto_197213 ) ) ( not ( = ?auto_197212 ?auto_197216 ) ) ( not ( = ?auto_197214 ?auto_197216 ) ) ( OBJ-AT ?auto_197216 ?auto_197217 ) ( OBJ-AT ?auto_197213 ?auto_197218 ) ( TRUCK-AT ?auto_197219 ?auto_197211 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197213 ?auto_197212 ?auto_197211 )
      ( DELIVER-3PKG-VERIFY ?auto_197212 ?auto_197213 ?auto_197214 ?auto_197211 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_197231 - OBJ
      ?auto_197232 - OBJ
      ?auto_197233 - OBJ
      ?auto_197230 - LOCATION
    )
    :vars
    (
      ?auto_197235 - LOCATION
      ?auto_197234 - CITY
      ?auto_197237 - OBJ
      ?auto_197236 - LOCATION
      ?auto_197238 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197232 ?auto_197231 ) ) ( not ( = ?auto_197233 ?auto_197231 ) ) ( not ( = ?auto_197233 ?auto_197232 ) ) ( IN-CITY ?auto_197235 ?auto_197234 ) ( IN-CITY ?auto_197230 ?auto_197234 ) ( not ( = ?auto_197230 ?auto_197235 ) ) ( OBJ-AT ?auto_197231 ?auto_197235 ) ( not ( = ?auto_197237 ?auto_197233 ) ) ( not ( = ?auto_197231 ?auto_197237 ) ) ( IN-CITY ?auto_197236 ?auto_197234 ) ( not ( = ?auto_197230 ?auto_197236 ) ) ( not ( = ?auto_197235 ?auto_197236 ) ) ( OBJ-AT ?auto_197237 ?auto_197236 ) ( not ( = ?auto_197237 ?auto_197232 ) ) ( OBJ-AT ?auto_197232 ?auto_197235 ) ( OBJ-AT ?auto_197233 ?auto_197236 ) ( TRUCK-AT ?auto_197238 ?auto_197230 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197233 ?auto_197231 ?auto_197230 )
      ( DELIVER-3PKG-VERIFY ?auto_197231 ?auto_197232 ?auto_197233 ?auto_197230 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_197250 - OBJ
      ?auto_197251 - OBJ
      ?auto_197252 - OBJ
      ?auto_197249 - LOCATION
    )
    :vars
    (
      ?auto_197257 - OBJ
      ?auto_197254 - LOCATION
      ?auto_197253 - CITY
      ?auto_197255 - LOCATION
      ?auto_197256 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197251 ?auto_197250 ) ) ( not ( = ?auto_197252 ?auto_197250 ) ) ( not ( = ?auto_197252 ?auto_197251 ) ) ( not ( = ?auto_197250 ?auto_197257 ) ) ( IN-CITY ?auto_197254 ?auto_197253 ) ( IN-CITY ?auto_197249 ?auto_197253 ) ( not ( = ?auto_197249 ?auto_197254 ) ) ( OBJ-AT ?auto_197250 ?auto_197254 ) ( not ( = ?auto_197252 ?auto_197257 ) ) ( IN-CITY ?auto_197255 ?auto_197253 ) ( not ( = ?auto_197249 ?auto_197255 ) ) ( not ( = ?auto_197254 ?auto_197255 ) ) ( OBJ-AT ?auto_197252 ?auto_197255 ) ( not ( = ?auto_197251 ?auto_197257 ) ) ( OBJ-AT ?auto_197251 ?auto_197254 ) ( OBJ-AT ?auto_197257 ?auto_197255 ) ( TRUCK-AT ?auto_197256 ?auto_197249 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197257 ?auto_197250 ?auto_197249 )
      ( DELIVER-3PKG-VERIFY ?auto_197250 ?auto_197251 ?auto_197252 ?auto_197249 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_197269 - OBJ
      ?auto_197270 - OBJ
      ?auto_197271 - OBJ
      ?auto_197268 - LOCATION
    )
    :vars
    (
      ?auto_197274 - LOCATION
      ?auto_197272 - CITY
      ?auto_197275 - LOCATION
      ?auto_197273 - OBJ
      ?auto_197276 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197270 ?auto_197269 ) ) ( not ( = ?auto_197271 ?auto_197269 ) ) ( not ( = ?auto_197271 ?auto_197270 ) ) ( IN-CITY ?auto_197274 ?auto_197272 ) ( IN-CITY ?auto_197268 ?auto_197272 ) ( not ( = ?auto_197268 ?auto_197274 ) ) ( OBJ-AT ?auto_197269 ?auto_197274 ) ( IN-CITY ?auto_197275 ?auto_197272 ) ( not ( = ?auto_197268 ?auto_197275 ) ) ( not ( = ?auto_197274 ?auto_197275 ) ) ( OBJ-AT ?auto_197270 ?auto_197275 ) ( not ( = ?auto_197273 ?auto_197271 ) ) ( not ( = ?auto_197269 ?auto_197273 ) ) ( not ( = ?auto_197270 ?auto_197273 ) ) ( OBJ-AT ?auto_197273 ?auto_197274 ) ( OBJ-AT ?auto_197271 ?auto_197275 ) ( TRUCK-AT ?auto_197276 ?auto_197268 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197271 ?auto_197269 ?auto_197268 )
      ( DELIVER-3PKG-VERIFY ?auto_197269 ?auto_197270 ?auto_197271 ?auto_197268 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_197278 - OBJ
      ?auto_197279 - OBJ
      ?auto_197280 - OBJ
      ?auto_197277 - LOCATION
    )
    :vars
    (
      ?auto_197285 - OBJ
      ?auto_197282 - LOCATION
      ?auto_197281 - CITY
      ?auto_197283 - LOCATION
      ?auto_197284 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197279 ?auto_197278 ) ) ( not ( = ?auto_197280 ?auto_197278 ) ) ( not ( = ?auto_197280 ?auto_197279 ) ) ( not ( = ?auto_197278 ?auto_197285 ) ) ( IN-CITY ?auto_197282 ?auto_197281 ) ( IN-CITY ?auto_197277 ?auto_197281 ) ( not ( = ?auto_197277 ?auto_197282 ) ) ( OBJ-AT ?auto_197278 ?auto_197282 ) ( not ( = ?auto_197279 ?auto_197285 ) ) ( IN-CITY ?auto_197283 ?auto_197281 ) ( not ( = ?auto_197277 ?auto_197283 ) ) ( not ( = ?auto_197282 ?auto_197283 ) ) ( OBJ-AT ?auto_197279 ?auto_197283 ) ( not ( = ?auto_197280 ?auto_197285 ) ) ( OBJ-AT ?auto_197280 ?auto_197282 ) ( OBJ-AT ?auto_197285 ?auto_197283 ) ( TRUCK-AT ?auto_197284 ?auto_197277 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197285 ?auto_197278 ?auto_197277 )
      ( DELIVER-3PKG-VERIFY ?auto_197278 ?auto_197279 ?auto_197280 ?auto_197277 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_197441 - OBJ
      ?auto_197442 - OBJ
      ?auto_197443 - OBJ
      ?auto_197444 - OBJ
      ?auto_197440 - LOCATION
    )
    :vars
    (
      ?auto_197446 - LOCATION
      ?auto_197445 - CITY
      ?auto_197447 - LOCATION
      ?auto_197448 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197442 ?auto_197441 ) ) ( not ( = ?auto_197443 ?auto_197441 ) ) ( not ( = ?auto_197443 ?auto_197442 ) ) ( not ( = ?auto_197444 ?auto_197441 ) ) ( not ( = ?auto_197444 ?auto_197442 ) ) ( not ( = ?auto_197444 ?auto_197443 ) ) ( IN-CITY ?auto_197446 ?auto_197445 ) ( IN-CITY ?auto_197440 ?auto_197445 ) ( not ( = ?auto_197440 ?auto_197446 ) ) ( OBJ-AT ?auto_197444 ?auto_197446 ) ( IN-CITY ?auto_197447 ?auto_197445 ) ( not ( = ?auto_197440 ?auto_197447 ) ) ( not ( = ?auto_197446 ?auto_197447 ) ) ( OBJ-AT ?auto_197443 ?auto_197447 ) ( OBJ-AT ?auto_197442 ?auto_197446 ) ( OBJ-AT ?auto_197441 ?auto_197447 ) ( TRUCK-AT ?auto_197448 ?auto_197440 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197441 ?auto_197444 ?auto_197440 )
      ( DELIVER-4PKG-VERIFY ?auto_197441 ?auto_197442 ?auto_197443 ?auto_197444 ?auto_197440 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_197470 - OBJ
      ?auto_197471 - OBJ
      ?auto_197472 - OBJ
      ?auto_197473 - OBJ
      ?auto_197469 - LOCATION
    )
    :vars
    (
      ?auto_197475 - LOCATION
      ?auto_197474 - CITY
      ?auto_197476 - LOCATION
      ?auto_197477 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197471 ?auto_197470 ) ) ( not ( = ?auto_197472 ?auto_197470 ) ) ( not ( = ?auto_197472 ?auto_197471 ) ) ( not ( = ?auto_197473 ?auto_197470 ) ) ( not ( = ?auto_197473 ?auto_197471 ) ) ( not ( = ?auto_197473 ?auto_197472 ) ) ( IN-CITY ?auto_197475 ?auto_197474 ) ( IN-CITY ?auto_197469 ?auto_197474 ) ( not ( = ?auto_197469 ?auto_197475 ) ) ( OBJ-AT ?auto_197472 ?auto_197475 ) ( IN-CITY ?auto_197476 ?auto_197474 ) ( not ( = ?auto_197469 ?auto_197476 ) ) ( not ( = ?auto_197475 ?auto_197476 ) ) ( OBJ-AT ?auto_197473 ?auto_197476 ) ( OBJ-AT ?auto_197471 ?auto_197475 ) ( OBJ-AT ?auto_197470 ?auto_197476 ) ( TRUCK-AT ?auto_197477 ?auto_197469 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197470 ?auto_197472 ?auto_197469 )
      ( DELIVER-4PKG-VERIFY ?auto_197470 ?auto_197471 ?auto_197472 ?auto_197473 ?auto_197469 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_197499 - OBJ
      ?auto_197500 - OBJ
      ?auto_197501 - OBJ
      ?auto_197502 - OBJ
      ?auto_197498 - LOCATION
    )
    :vars
    (
      ?auto_197504 - LOCATION
      ?auto_197503 - CITY
      ?auto_197505 - LOCATION
      ?auto_197506 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197500 ?auto_197499 ) ) ( not ( = ?auto_197501 ?auto_197499 ) ) ( not ( = ?auto_197501 ?auto_197500 ) ) ( not ( = ?auto_197502 ?auto_197499 ) ) ( not ( = ?auto_197502 ?auto_197500 ) ) ( not ( = ?auto_197502 ?auto_197501 ) ) ( IN-CITY ?auto_197504 ?auto_197503 ) ( IN-CITY ?auto_197498 ?auto_197503 ) ( not ( = ?auto_197498 ?auto_197504 ) ) ( OBJ-AT ?auto_197502 ?auto_197504 ) ( IN-CITY ?auto_197505 ?auto_197503 ) ( not ( = ?auto_197498 ?auto_197505 ) ) ( not ( = ?auto_197504 ?auto_197505 ) ) ( OBJ-AT ?auto_197500 ?auto_197505 ) ( OBJ-AT ?auto_197501 ?auto_197504 ) ( OBJ-AT ?auto_197499 ?auto_197505 ) ( TRUCK-AT ?auto_197506 ?auto_197498 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197499 ?auto_197502 ?auto_197498 )
      ( DELIVER-4PKG-VERIFY ?auto_197499 ?auto_197500 ?auto_197501 ?auto_197502 ?auto_197498 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_197528 - OBJ
      ?auto_197529 - OBJ
      ?auto_197530 - OBJ
      ?auto_197531 - OBJ
      ?auto_197527 - LOCATION
    )
    :vars
    (
      ?auto_197533 - LOCATION
      ?auto_197532 - CITY
      ?auto_197534 - LOCATION
      ?auto_197535 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197529 ?auto_197528 ) ) ( not ( = ?auto_197530 ?auto_197528 ) ) ( not ( = ?auto_197530 ?auto_197529 ) ) ( not ( = ?auto_197531 ?auto_197528 ) ) ( not ( = ?auto_197531 ?auto_197529 ) ) ( not ( = ?auto_197531 ?auto_197530 ) ) ( IN-CITY ?auto_197533 ?auto_197532 ) ( IN-CITY ?auto_197527 ?auto_197532 ) ( not ( = ?auto_197527 ?auto_197533 ) ) ( OBJ-AT ?auto_197530 ?auto_197533 ) ( IN-CITY ?auto_197534 ?auto_197532 ) ( not ( = ?auto_197527 ?auto_197534 ) ) ( not ( = ?auto_197533 ?auto_197534 ) ) ( OBJ-AT ?auto_197529 ?auto_197534 ) ( OBJ-AT ?auto_197531 ?auto_197533 ) ( OBJ-AT ?auto_197528 ?auto_197534 ) ( TRUCK-AT ?auto_197535 ?auto_197527 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197528 ?auto_197530 ?auto_197527 )
      ( DELIVER-4PKG-VERIFY ?auto_197528 ?auto_197529 ?auto_197530 ?auto_197531 ?auto_197527 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_197619 - OBJ
      ?auto_197620 - OBJ
      ?auto_197621 - OBJ
      ?auto_197622 - OBJ
      ?auto_197618 - LOCATION
    )
    :vars
    (
      ?auto_197624 - LOCATION
      ?auto_197623 - CITY
      ?auto_197625 - LOCATION
      ?auto_197626 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197620 ?auto_197619 ) ) ( not ( = ?auto_197621 ?auto_197619 ) ) ( not ( = ?auto_197621 ?auto_197620 ) ) ( not ( = ?auto_197622 ?auto_197619 ) ) ( not ( = ?auto_197622 ?auto_197620 ) ) ( not ( = ?auto_197622 ?auto_197621 ) ) ( IN-CITY ?auto_197624 ?auto_197623 ) ( IN-CITY ?auto_197618 ?auto_197623 ) ( not ( = ?auto_197618 ?auto_197624 ) ) ( OBJ-AT ?auto_197620 ?auto_197624 ) ( IN-CITY ?auto_197625 ?auto_197623 ) ( not ( = ?auto_197618 ?auto_197625 ) ) ( not ( = ?auto_197624 ?auto_197625 ) ) ( OBJ-AT ?auto_197622 ?auto_197625 ) ( OBJ-AT ?auto_197621 ?auto_197624 ) ( OBJ-AT ?auto_197619 ?auto_197625 ) ( TRUCK-AT ?auto_197626 ?auto_197618 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197619 ?auto_197620 ?auto_197618 )
      ( DELIVER-4PKG-VERIFY ?auto_197619 ?auto_197620 ?auto_197621 ?auto_197622 ?auto_197618 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_197648 - OBJ
      ?auto_197649 - OBJ
      ?auto_197650 - OBJ
      ?auto_197651 - OBJ
      ?auto_197647 - LOCATION
    )
    :vars
    (
      ?auto_197653 - LOCATION
      ?auto_197652 - CITY
      ?auto_197654 - LOCATION
      ?auto_197655 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197649 ?auto_197648 ) ) ( not ( = ?auto_197650 ?auto_197648 ) ) ( not ( = ?auto_197650 ?auto_197649 ) ) ( not ( = ?auto_197651 ?auto_197648 ) ) ( not ( = ?auto_197651 ?auto_197649 ) ) ( not ( = ?auto_197651 ?auto_197650 ) ) ( IN-CITY ?auto_197653 ?auto_197652 ) ( IN-CITY ?auto_197647 ?auto_197652 ) ( not ( = ?auto_197647 ?auto_197653 ) ) ( OBJ-AT ?auto_197649 ?auto_197653 ) ( IN-CITY ?auto_197654 ?auto_197652 ) ( not ( = ?auto_197647 ?auto_197654 ) ) ( not ( = ?auto_197653 ?auto_197654 ) ) ( OBJ-AT ?auto_197650 ?auto_197654 ) ( OBJ-AT ?auto_197651 ?auto_197653 ) ( OBJ-AT ?auto_197648 ?auto_197654 ) ( TRUCK-AT ?auto_197655 ?auto_197647 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197648 ?auto_197649 ?auto_197647 )
      ( DELIVER-4PKG-VERIFY ?auto_197648 ?auto_197649 ?auto_197650 ?auto_197651 ?auto_197647 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_197739 - OBJ
      ?auto_197740 - OBJ
      ?auto_197741 - OBJ
      ?auto_197742 - OBJ
      ?auto_197738 - LOCATION
    )
    :vars
    (
      ?auto_197744 - LOCATION
      ?auto_197743 - CITY
      ?auto_197745 - LOCATION
      ?auto_197746 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197740 ?auto_197739 ) ) ( not ( = ?auto_197741 ?auto_197739 ) ) ( not ( = ?auto_197741 ?auto_197740 ) ) ( not ( = ?auto_197742 ?auto_197739 ) ) ( not ( = ?auto_197742 ?auto_197740 ) ) ( not ( = ?auto_197742 ?auto_197741 ) ) ( IN-CITY ?auto_197744 ?auto_197743 ) ( IN-CITY ?auto_197738 ?auto_197743 ) ( not ( = ?auto_197738 ?auto_197744 ) ) ( OBJ-AT ?auto_197742 ?auto_197744 ) ( IN-CITY ?auto_197745 ?auto_197743 ) ( not ( = ?auto_197738 ?auto_197745 ) ) ( not ( = ?auto_197744 ?auto_197745 ) ) ( OBJ-AT ?auto_197741 ?auto_197745 ) ( OBJ-AT ?auto_197739 ?auto_197744 ) ( OBJ-AT ?auto_197740 ?auto_197745 ) ( TRUCK-AT ?auto_197746 ?auto_197738 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197740 ?auto_197742 ?auto_197738 )
      ( DELIVER-4PKG-VERIFY ?auto_197739 ?auto_197740 ?auto_197741 ?auto_197742 ?auto_197738 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_197768 - OBJ
      ?auto_197769 - OBJ
      ?auto_197770 - OBJ
      ?auto_197771 - OBJ
      ?auto_197767 - LOCATION
    )
    :vars
    (
      ?auto_197773 - LOCATION
      ?auto_197772 - CITY
      ?auto_197774 - LOCATION
      ?auto_197775 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197769 ?auto_197768 ) ) ( not ( = ?auto_197770 ?auto_197768 ) ) ( not ( = ?auto_197770 ?auto_197769 ) ) ( not ( = ?auto_197771 ?auto_197768 ) ) ( not ( = ?auto_197771 ?auto_197769 ) ) ( not ( = ?auto_197771 ?auto_197770 ) ) ( IN-CITY ?auto_197773 ?auto_197772 ) ( IN-CITY ?auto_197767 ?auto_197772 ) ( not ( = ?auto_197767 ?auto_197773 ) ) ( OBJ-AT ?auto_197770 ?auto_197773 ) ( IN-CITY ?auto_197774 ?auto_197772 ) ( not ( = ?auto_197767 ?auto_197774 ) ) ( not ( = ?auto_197773 ?auto_197774 ) ) ( OBJ-AT ?auto_197771 ?auto_197774 ) ( OBJ-AT ?auto_197768 ?auto_197773 ) ( OBJ-AT ?auto_197769 ?auto_197774 ) ( TRUCK-AT ?auto_197775 ?auto_197767 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197769 ?auto_197770 ?auto_197767 )
      ( DELIVER-4PKG-VERIFY ?auto_197768 ?auto_197769 ?auto_197770 ?auto_197771 ?auto_197767 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_197860 - OBJ
      ?auto_197861 - OBJ
      ?auto_197862 - OBJ
      ?auto_197863 - OBJ
      ?auto_197859 - LOCATION
    )
    :vars
    (
      ?auto_197865 - LOCATION
      ?auto_197864 - CITY
      ?auto_197866 - LOCATION
      ?auto_197867 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197861 ?auto_197860 ) ) ( not ( = ?auto_197862 ?auto_197860 ) ) ( not ( = ?auto_197862 ?auto_197861 ) ) ( not ( = ?auto_197863 ?auto_197860 ) ) ( not ( = ?auto_197863 ?auto_197861 ) ) ( not ( = ?auto_197863 ?auto_197862 ) ) ( IN-CITY ?auto_197865 ?auto_197864 ) ( IN-CITY ?auto_197859 ?auto_197864 ) ( not ( = ?auto_197859 ?auto_197865 ) ) ( OBJ-AT ?auto_197863 ?auto_197865 ) ( IN-CITY ?auto_197866 ?auto_197864 ) ( not ( = ?auto_197859 ?auto_197866 ) ) ( not ( = ?auto_197865 ?auto_197866 ) ) ( OBJ-AT ?auto_197861 ?auto_197866 ) ( OBJ-AT ?auto_197860 ?auto_197865 ) ( OBJ-AT ?auto_197862 ?auto_197866 ) ( TRUCK-AT ?auto_197867 ?auto_197859 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197862 ?auto_197863 ?auto_197859 )
      ( DELIVER-4PKG-VERIFY ?auto_197860 ?auto_197861 ?auto_197862 ?auto_197863 ?auto_197859 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_197889 - OBJ
      ?auto_197890 - OBJ
      ?auto_197891 - OBJ
      ?auto_197892 - OBJ
      ?auto_197888 - LOCATION
    )
    :vars
    (
      ?auto_197894 - LOCATION
      ?auto_197893 - CITY
      ?auto_197895 - LOCATION
      ?auto_197896 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197890 ?auto_197889 ) ) ( not ( = ?auto_197891 ?auto_197889 ) ) ( not ( = ?auto_197891 ?auto_197890 ) ) ( not ( = ?auto_197892 ?auto_197889 ) ) ( not ( = ?auto_197892 ?auto_197890 ) ) ( not ( = ?auto_197892 ?auto_197891 ) ) ( IN-CITY ?auto_197894 ?auto_197893 ) ( IN-CITY ?auto_197888 ?auto_197893 ) ( not ( = ?auto_197888 ?auto_197894 ) ) ( OBJ-AT ?auto_197891 ?auto_197894 ) ( IN-CITY ?auto_197895 ?auto_197893 ) ( not ( = ?auto_197888 ?auto_197895 ) ) ( not ( = ?auto_197894 ?auto_197895 ) ) ( OBJ-AT ?auto_197890 ?auto_197895 ) ( OBJ-AT ?auto_197889 ?auto_197894 ) ( OBJ-AT ?auto_197892 ?auto_197895 ) ( TRUCK-AT ?auto_197896 ?auto_197888 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197892 ?auto_197891 ?auto_197888 )
      ( DELIVER-4PKG-VERIFY ?auto_197889 ?auto_197890 ?auto_197891 ?auto_197892 ?auto_197888 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_197948 - OBJ
      ?auto_197949 - OBJ
      ?auto_197950 - OBJ
      ?auto_197951 - OBJ
      ?auto_197947 - LOCATION
    )
    :vars
    (
      ?auto_197953 - LOCATION
      ?auto_197952 - CITY
      ?auto_197954 - LOCATION
      ?auto_197955 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_197949 ?auto_197948 ) ) ( not ( = ?auto_197950 ?auto_197948 ) ) ( not ( = ?auto_197950 ?auto_197949 ) ) ( not ( = ?auto_197951 ?auto_197948 ) ) ( not ( = ?auto_197951 ?auto_197949 ) ) ( not ( = ?auto_197951 ?auto_197950 ) ) ( IN-CITY ?auto_197953 ?auto_197952 ) ( IN-CITY ?auto_197947 ?auto_197952 ) ( not ( = ?auto_197947 ?auto_197953 ) ) ( OBJ-AT ?auto_197949 ?auto_197953 ) ( IN-CITY ?auto_197954 ?auto_197952 ) ( not ( = ?auto_197947 ?auto_197954 ) ) ( not ( = ?auto_197953 ?auto_197954 ) ) ( OBJ-AT ?auto_197951 ?auto_197954 ) ( OBJ-AT ?auto_197948 ?auto_197953 ) ( OBJ-AT ?auto_197950 ?auto_197954 ) ( TRUCK-AT ?auto_197955 ?auto_197947 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197950 ?auto_197949 ?auto_197947 )
      ( DELIVER-4PKG-VERIFY ?auto_197948 ?auto_197949 ?auto_197950 ?auto_197951 ?auto_197947 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_198009 - OBJ
      ?auto_198010 - OBJ
      ?auto_198011 - OBJ
      ?auto_198012 - OBJ
      ?auto_198008 - LOCATION
    )
    :vars
    (
      ?auto_198014 - LOCATION
      ?auto_198013 - CITY
      ?auto_198015 - LOCATION
      ?auto_198016 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_198010 ?auto_198009 ) ) ( not ( = ?auto_198011 ?auto_198009 ) ) ( not ( = ?auto_198011 ?auto_198010 ) ) ( not ( = ?auto_198012 ?auto_198009 ) ) ( not ( = ?auto_198012 ?auto_198010 ) ) ( not ( = ?auto_198012 ?auto_198011 ) ) ( IN-CITY ?auto_198014 ?auto_198013 ) ( IN-CITY ?auto_198008 ?auto_198013 ) ( not ( = ?auto_198008 ?auto_198014 ) ) ( OBJ-AT ?auto_198010 ?auto_198014 ) ( IN-CITY ?auto_198015 ?auto_198013 ) ( not ( = ?auto_198008 ?auto_198015 ) ) ( not ( = ?auto_198014 ?auto_198015 ) ) ( OBJ-AT ?auto_198011 ?auto_198015 ) ( OBJ-AT ?auto_198009 ?auto_198014 ) ( OBJ-AT ?auto_198012 ?auto_198015 ) ( TRUCK-AT ?auto_198016 ?auto_198008 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_198012 ?auto_198010 ?auto_198008 )
      ( DELIVER-4PKG-VERIFY ?auto_198009 ?auto_198010 ?auto_198011 ?auto_198012 ?auto_198008 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_198100 - OBJ
      ?auto_198101 - OBJ
      ?auto_198102 - OBJ
      ?auto_198103 - OBJ
      ?auto_198099 - LOCATION
    )
    :vars
    (
      ?auto_198105 - LOCATION
      ?auto_198104 - CITY
      ?auto_198106 - LOCATION
      ?auto_198107 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_198101 ?auto_198100 ) ) ( not ( = ?auto_198102 ?auto_198100 ) ) ( not ( = ?auto_198102 ?auto_198101 ) ) ( not ( = ?auto_198103 ?auto_198100 ) ) ( not ( = ?auto_198103 ?auto_198101 ) ) ( not ( = ?auto_198103 ?auto_198102 ) ) ( IN-CITY ?auto_198105 ?auto_198104 ) ( IN-CITY ?auto_198099 ?auto_198104 ) ( not ( = ?auto_198099 ?auto_198105 ) ) ( OBJ-AT ?auto_198103 ?auto_198105 ) ( IN-CITY ?auto_198106 ?auto_198104 ) ( not ( = ?auto_198099 ?auto_198106 ) ) ( not ( = ?auto_198105 ?auto_198106 ) ) ( OBJ-AT ?auto_198100 ?auto_198106 ) ( OBJ-AT ?auto_198102 ?auto_198105 ) ( OBJ-AT ?auto_198101 ?auto_198106 ) ( TRUCK-AT ?auto_198107 ?auto_198099 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_198101 ?auto_198103 ?auto_198099 )
      ( DELIVER-4PKG-VERIFY ?auto_198100 ?auto_198101 ?auto_198102 ?auto_198103 ?auto_198099 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_198129 - OBJ
      ?auto_198130 - OBJ
      ?auto_198131 - OBJ
      ?auto_198132 - OBJ
      ?auto_198128 - LOCATION
    )
    :vars
    (
      ?auto_198134 - LOCATION
      ?auto_198133 - CITY
      ?auto_198135 - LOCATION
      ?auto_198136 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_198130 ?auto_198129 ) ) ( not ( = ?auto_198131 ?auto_198129 ) ) ( not ( = ?auto_198131 ?auto_198130 ) ) ( not ( = ?auto_198132 ?auto_198129 ) ) ( not ( = ?auto_198132 ?auto_198130 ) ) ( not ( = ?auto_198132 ?auto_198131 ) ) ( IN-CITY ?auto_198134 ?auto_198133 ) ( IN-CITY ?auto_198128 ?auto_198133 ) ( not ( = ?auto_198128 ?auto_198134 ) ) ( OBJ-AT ?auto_198131 ?auto_198134 ) ( IN-CITY ?auto_198135 ?auto_198133 ) ( not ( = ?auto_198128 ?auto_198135 ) ) ( not ( = ?auto_198134 ?auto_198135 ) ) ( OBJ-AT ?auto_198129 ?auto_198135 ) ( OBJ-AT ?auto_198132 ?auto_198134 ) ( OBJ-AT ?auto_198130 ?auto_198135 ) ( TRUCK-AT ?auto_198136 ?auto_198128 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_198130 ?auto_198131 ?auto_198128 )
      ( DELIVER-4PKG-VERIFY ?auto_198129 ?auto_198130 ?auto_198131 ?auto_198132 ?auto_198128 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_198158 - OBJ
      ?auto_198159 - OBJ
      ?auto_198160 - OBJ
      ?auto_198161 - OBJ
      ?auto_198157 - LOCATION
    )
    :vars
    (
      ?auto_198163 - LOCATION
      ?auto_198162 - CITY
      ?auto_198164 - LOCATION
      ?auto_198165 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_198159 ?auto_198158 ) ) ( not ( = ?auto_198160 ?auto_198158 ) ) ( not ( = ?auto_198160 ?auto_198159 ) ) ( not ( = ?auto_198161 ?auto_198158 ) ) ( not ( = ?auto_198161 ?auto_198159 ) ) ( not ( = ?auto_198161 ?auto_198160 ) ) ( IN-CITY ?auto_198163 ?auto_198162 ) ( IN-CITY ?auto_198157 ?auto_198162 ) ( not ( = ?auto_198157 ?auto_198163 ) ) ( OBJ-AT ?auto_198161 ?auto_198163 ) ( IN-CITY ?auto_198164 ?auto_198162 ) ( not ( = ?auto_198157 ?auto_198164 ) ) ( not ( = ?auto_198163 ?auto_198164 ) ) ( OBJ-AT ?auto_198158 ?auto_198164 ) ( OBJ-AT ?auto_198159 ?auto_198163 ) ( OBJ-AT ?auto_198160 ?auto_198164 ) ( TRUCK-AT ?auto_198165 ?auto_198157 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_198160 ?auto_198161 ?auto_198157 )
      ( DELIVER-4PKG-VERIFY ?auto_198158 ?auto_198159 ?auto_198160 ?auto_198161 ?auto_198157 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_198187 - OBJ
      ?auto_198188 - OBJ
      ?auto_198189 - OBJ
      ?auto_198190 - OBJ
      ?auto_198186 - LOCATION
    )
    :vars
    (
      ?auto_198192 - LOCATION
      ?auto_198191 - CITY
      ?auto_198193 - LOCATION
      ?auto_198194 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_198188 ?auto_198187 ) ) ( not ( = ?auto_198189 ?auto_198187 ) ) ( not ( = ?auto_198189 ?auto_198188 ) ) ( not ( = ?auto_198190 ?auto_198187 ) ) ( not ( = ?auto_198190 ?auto_198188 ) ) ( not ( = ?auto_198190 ?auto_198189 ) ) ( IN-CITY ?auto_198192 ?auto_198191 ) ( IN-CITY ?auto_198186 ?auto_198191 ) ( not ( = ?auto_198186 ?auto_198192 ) ) ( OBJ-AT ?auto_198189 ?auto_198192 ) ( IN-CITY ?auto_198193 ?auto_198191 ) ( not ( = ?auto_198186 ?auto_198193 ) ) ( not ( = ?auto_198192 ?auto_198193 ) ) ( OBJ-AT ?auto_198187 ?auto_198193 ) ( OBJ-AT ?auto_198188 ?auto_198192 ) ( OBJ-AT ?auto_198190 ?auto_198193 ) ( TRUCK-AT ?auto_198194 ?auto_198186 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_198190 ?auto_198189 ?auto_198186 )
      ( DELIVER-4PKG-VERIFY ?auto_198187 ?auto_198188 ?auto_198189 ?auto_198190 ?auto_198186 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_198309 - OBJ
      ?auto_198310 - OBJ
      ?auto_198311 - OBJ
      ?auto_198312 - OBJ
      ?auto_198308 - LOCATION
    )
    :vars
    (
      ?auto_198314 - LOCATION
      ?auto_198313 - CITY
      ?auto_198315 - LOCATION
      ?auto_198316 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_198310 ?auto_198309 ) ) ( not ( = ?auto_198311 ?auto_198309 ) ) ( not ( = ?auto_198311 ?auto_198310 ) ) ( not ( = ?auto_198312 ?auto_198309 ) ) ( not ( = ?auto_198312 ?auto_198310 ) ) ( not ( = ?auto_198312 ?auto_198311 ) ) ( IN-CITY ?auto_198314 ?auto_198313 ) ( IN-CITY ?auto_198308 ?auto_198313 ) ( not ( = ?auto_198308 ?auto_198314 ) ) ( OBJ-AT ?auto_198310 ?auto_198314 ) ( IN-CITY ?auto_198315 ?auto_198313 ) ( not ( = ?auto_198308 ?auto_198315 ) ) ( not ( = ?auto_198314 ?auto_198315 ) ) ( OBJ-AT ?auto_198309 ?auto_198315 ) ( OBJ-AT ?auto_198312 ?auto_198314 ) ( OBJ-AT ?auto_198311 ?auto_198315 ) ( TRUCK-AT ?auto_198316 ?auto_198308 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_198311 ?auto_198310 ?auto_198308 )
      ( DELIVER-4PKG-VERIFY ?auto_198309 ?auto_198310 ?auto_198311 ?auto_198312 ?auto_198308 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_198338 - OBJ
      ?auto_198339 - OBJ
      ?auto_198340 - OBJ
      ?auto_198341 - OBJ
      ?auto_198337 - LOCATION
    )
    :vars
    (
      ?auto_198343 - LOCATION
      ?auto_198342 - CITY
      ?auto_198344 - LOCATION
      ?auto_198345 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_198339 ?auto_198338 ) ) ( not ( = ?auto_198340 ?auto_198338 ) ) ( not ( = ?auto_198340 ?auto_198339 ) ) ( not ( = ?auto_198341 ?auto_198338 ) ) ( not ( = ?auto_198341 ?auto_198339 ) ) ( not ( = ?auto_198341 ?auto_198340 ) ) ( IN-CITY ?auto_198343 ?auto_198342 ) ( IN-CITY ?auto_198337 ?auto_198342 ) ( not ( = ?auto_198337 ?auto_198343 ) ) ( OBJ-AT ?auto_198339 ?auto_198343 ) ( IN-CITY ?auto_198344 ?auto_198342 ) ( not ( = ?auto_198337 ?auto_198344 ) ) ( not ( = ?auto_198343 ?auto_198344 ) ) ( OBJ-AT ?auto_198338 ?auto_198344 ) ( OBJ-AT ?auto_198340 ?auto_198343 ) ( OBJ-AT ?auto_198341 ?auto_198344 ) ( TRUCK-AT ?auto_198345 ?auto_198337 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_198341 ?auto_198339 ?auto_198337 )
      ( DELIVER-4PKG-VERIFY ?auto_198338 ?auto_198339 ?auto_198340 ?auto_198341 ?auto_198337 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_198523 - OBJ
      ?auto_198524 - OBJ
      ?auto_198525 - OBJ
      ?auto_198526 - OBJ
      ?auto_198522 - LOCATION
    )
    :vars
    (
      ?auto_198528 - LOCATION
      ?auto_198527 - CITY
      ?auto_198529 - LOCATION
      ?auto_198530 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_198524 ?auto_198523 ) ) ( not ( = ?auto_198525 ?auto_198523 ) ) ( not ( = ?auto_198525 ?auto_198524 ) ) ( not ( = ?auto_198526 ?auto_198523 ) ) ( not ( = ?auto_198526 ?auto_198524 ) ) ( not ( = ?auto_198526 ?auto_198525 ) ) ( IN-CITY ?auto_198528 ?auto_198527 ) ( IN-CITY ?auto_198522 ?auto_198527 ) ( not ( = ?auto_198522 ?auto_198528 ) ) ( OBJ-AT ?auto_198523 ?auto_198528 ) ( IN-CITY ?auto_198529 ?auto_198527 ) ( not ( = ?auto_198522 ?auto_198529 ) ) ( not ( = ?auto_198528 ?auto_198529 ) ) ( OBJ-AT ?auto_198526 ?auto_198529 ) ( OBJ-AT ?auto_198525 ?auto_198528 ) ( OBJ-AT ?auto_198524 ?auto_198529 ) ( TRUCK-AT ?auto_198530 ?auto_198522 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_198524 ?auto_198523 ?auto_198522 )
      ( DELIVER-4PKG-VERIFY ?auto_198523 ?auto_198524 ?auto_198525 ?auto_198526 ?auto_198522 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_198552 - OBJ
      ?auto_198553 - OBJ
      ?auto_198554 - OBJ
      ?auto_198555 - OBJ
      ?auto_198551 - LOCATION
    )
    :vars
    (
      ?auto_198557 - LOCATION
      ?auto_198556 - CITY
      ?auto_198558 - LOCATION
      ?auto_198559 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_198553 ?auto_198552 ) ) ( not ( = ?auto_198554 ?auto_198552 ) ) ( not ( = ?auto_198554 ?auto_198553 ) ) ( not ( = ?auto_198555 ?auto_198552 ) ) ( not ( = ?auto_198555 ?auto_198553 ) ) ( not ( = ?auto_198555 ?auto_198554 ) ) ( IN-CITY ?auto_198557 ?auto_198556 ) ( IN-CITY ?auto_198551 ?auto_198556 ) ( not ( = ?auto_198551 ?auto_198557 ) ) ( OBJ-AT ?auto_198552 ?auto_198557 ) ( IN-CITY ?auto_198558 ?auto_198556 ) ( not ( = ?auto_198551 ?auto_198558 ) ) ( not ( = ?auto_198557 ?auto_198558 ) ) ( OBJ-AT ?auto_198554 ?auto_198558 ) ( OBJ-AT ?auto_198555 ?auto_198557 ) ( OBJ-AT ?auto_198553 ?auto_198558 ) ( TRUCK-AT ?auto_198559 ?auto_198551 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_198553 ?auto_198552 ?auto_198551 )
      ( DELIVER-4PKG-VERIFY ?auto_198552 ?auto_198553 ?auto_198554 ?auto_198555 ?auto_198551 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_198643 - OBJ
      ?auto_198644 - OBJ
      ?auto_198645 - OBJ
      ?auto_198646 - OBJ
      ?auto_198642 - LOCATION
    )
    :vars
    (
      ?auto_198648 - LOCATION
      ?auto_198647 - CITY
      ?auto_198649 - LOCATION
      ?auto_198650 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_198644 ?auto_198643 ) ) ( not ( = ?auto_198645 ?auto_198643 ) ) ( not ( = ?auto_198645 ?auto_198644 ) ) ( not ( = ?auto_198646 ?auto_198643 ) ) ( not ( = ?auto_198646 ?auto_198644 ) ) ( not ( = ?auto_198646 ?auto_198645 ) ) ( IN-CITY ?auto_198648 ?auto_198647 ) ( IN-CITY ?auto_198642 ?auto_198647 ) ( not ( = ?auto_198642 ?auto_198648 ) ) ( OBJ-AT ?auto_198643 ?auto_198648 ) ( IN-CITY ?auto_198649 ?auto_198647 ) ( not ( = ?auto_198642 ?auto_198649 ) ) ( not ( = ?auto_198648 ?auto_198649 ) ) ( OBJ-AT ?auto_198646 ?auto_198649 ) ( OBJ-AT ?auto_198644 ?auto_198648 ) ( OBJ-AT ?auto_198645 ?auto_198649 ) ( TRUCK-AT ?auto_198650 ?auto_198642 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_198645 ?auto_198643 ?auto_198642 )
      ( DELIVER-4PKG-VERIFY ?auto_198643 ?auto_198644 ?auto_198645 ?auto_198646 ?auto_198642 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_198704 - OBJ
      ?auto_198705 - OBJ
      ?auto_198706 - OBJ
      ?auto_198707 - OBJ
      ?auto_198703 - LOCATION
    )
    :vars
    (
      ?auto_198709 - LOCATION
      ?auto_198708 - CITY
      ?auto_198710 - LOCATION
      ?auto_198711 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_198705 ?auto_198704 ) ) ( not ( = ?auto_198706 ?auto_198704 ) ) ( not ( = ?auto_198706 ?auto_198705 ) ) ( not ( = ?auto_198707 ?auto_198704 ) ) ( not ( = ?auto_198707 ?auto_198705 ) ) ( not ( = ?auto_198707 ?auto_198706 ) ) ( IN-CITY ?auto_198709 ?auto_198708 ) ( IN-CITY ?auto_198703 ?auto_198708 ) ( not ( = ?auto_198703 ?auto_198709 ) ) ( OBJ-AT ?auto_198704 ?auto_198709 ) ( IN-CITY ?auto_198710 ?auto_198708 ) ( not ( = ?auto_198703 ?auto_198710 ) ) ( not ( = ?auto_198709 ?auto_198710 ) ) ( OBJ-AT ?auto_198706 ?auto_198710 ) ( OBJ-AT ?auto_198705 ?auto_198709 ) ( OBJ-AT ?auto_198707 ?auto_198710 ) ( TRUCK-AT ?auto_198711 ?auto_198703 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_198707 ?auto_198704 ?auto_198703 )
      ( DELIVER-4PKG-VERIFY ?auto_198704 ?auto_198705 ?auto_198706 ?auto_198707 ?auto_198703 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_198795 - OBJ
      ?auto_198796 - OBJ
      ?auto_198797 - OBJ
      ?auto_198798 - OBJ
      ?auto_198794 - LOCATION
    )
    :vars
    (
      ?auto_198800 - LOCATION
      ?auto_198799 - CITY
      ?auto_198801 - LOCATION
      ?auto_198802 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_198796 ?auto_198795 ) ) ( not ( = ?auto_198797 ?auto_198795 ) ) ( not ( = ?auto_198797 ?auto_198796 ) ) ( not ( = ?auto_198798 ?auto_198795 ) ) ( not ( = ?auto_198798 ?auto_198796 ) ) ( not ( = ?auto_198798 ?auto_198797 ) ) ( IN-CITY ?auto_198800 ?auto_198799 ) ( IN-CITY ?auto_198794 ?auto_198799 ) ( not ( = ?auto_198794 ?auto_198800 ) ) ( OBJ-AT ?auto_198795 ?auto_198800 ) ( IN-CITY ?auto_198801 ?auto_198799 ) ( not ( = ?auto_198794 ?auto_198801 ) ) ( not ( = ?auto_198800 ?auto_198801 ) ) ( OBJ-AT ?auto_198796 ?auto_198801 ) ( OBJ-AT ?auto_198798 ?auto_198800 ) ( OBJ-AT ?auto_198797 ?auto_198801 ) ( TRUCK-AT ?auto_198802 ?auto_198794 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_198797 ?auto_198795 ?auto_198794 )
      ( DELIVER-4PKG-VERIFY ?auto_198795 ?auto_198796 ?auto_198797 ?auto_198798 ?auto_198794 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_198824 - OBJ
      ?auto_198825 - OBJ
      ?auto_198826 - OBJ
      ?auto_198827 - OBJ
      ?auto_198823 - LOCATION
    )
    :vars
    (
      ?auto_198829 - LOCATION
      ?auto_198828 - CITY
      ?auto_198830 - LOCATION
      ?auto_198831 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_198825 ?auto_198824 ) ) ( not ( = ?auto_198826 ?auto_198824 ) ) ( not ( = ?auto_198826 ?auto_198825 ) ) ( not ( = ?auto_198827 ?auto_198824 ) ) ( not ( = ?auto_198827 ?auto_198825 ) ) ( not ( = ?auto_198827 ?auto_198826 ) ) ( IN-CITY ?auto_198829 ?auto_198828 ) ( IN-CITY ?auto_198823 ?auto_198828 ) ( not ( = ?auto_198823 ?auto_198829 ) ) ( OBJ-AT ?auto_198824 ?auto_198829 ) ( IN-CITY ?auto_198830 ?auto_198828 ) ( not ( = ?auto_198823 ?auto_198830 ) ) ( not ( = ?auto_198829 ?auto_198830 ) ) ( OBJ-AT ?auto_198825 ?auto_198830 ) ( OBJ-AT ?auto_198826 ?auto_198829 ) ( OBJ-AT ?auto_198827 ?auto_198830 ) ( TRUCK-AT ?auto_198831 ?auto_198823 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_198827 ?auto_198824 ?auto_198823 )
      ( DELIVER-4PKG-VERIFY ?auto_198824 ?auto_198825 ?auto_198826 ?auto_198827 ?auto_198823 ) )
  )

)

