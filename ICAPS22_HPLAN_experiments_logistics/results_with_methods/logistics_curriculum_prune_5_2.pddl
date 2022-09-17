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
      ?auto_105264 - OBJ
      ?auto_105263 - LOCATION
    )
    :vars
    (
      ?auto_105266 - LOCATION
      ?auto_105267 - CITY
      ?auto_105265 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105266 ?auto_105267 ) ( IN-CITY ?auto_105263 ?auto_105267 ) ( not ( = ?auto_105263 ?auto_105266 ) ) ( OBJ-AT ?auto_105264 ?auto_105266 ) ( TRUCK-AT ?auto_105265 ?auto_105263 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_105265 ?auto_105263 ?auto_105266 ?auto_105267 )
      ( !LOAD-TRUCK ?auto_105264 ?auto_105265 ?auto_105266 )
      ( !DRIVE-TRUCK ?auto_105265 ?auto_105266 ?auto_105263 ?auto_105267 )
      ( !UNLOAD-TRUCK ?auto_105264 ?auto_105265 ?auto_105263 )
      ( DELIVER-1PKG-VERIFY ?auto_105264 ?auto_105263 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_105285 - OBJ
      ?auto_105286 - OBJ
      ?auto_105284 - LOCATION
    )
    :vars
    (
      ?auto_105288 - LOCATION
      ?auto_105287 - CITY
      ?auto_105290 - LOCATION
      ?auto_105289 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105288 ?auto_105287 ) ( IN-CITY ?auto_105284 ?auto_105287 ) ( not ( = ?auto_105284 ?auto_105288 ) ) ( OBJ-AT ?auto_105286 ?auto_105288 ) ( IN-CITY ?auto_105290 ?auto_105287 ) ( not ( = ?auto_105284 ?auto_105290 ) ) ( OBJ-AT ?auto_105285 ?auto_105290 ) ( TRUCK-AT ?auto_105289 ?auto_105284 ) ( not ( = ?auto_105285 ?auto_105286 ) ) ( not ( = ?auto_105288 ?auto_105290 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_105285 ?auto_105284 )
      ( DELIVER-1PKG ?auto_105286 ?auto_105284 )
      ( DELIVER-2PKG-VERIFY ?auto_105285 ?auto_105286 ?auto_105284 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_105396 - OBJ
      ?auto_105397 - OBJ
      ?auto_105398 - OBJ
      ?auto_105395 - LOCATION
    )
    :vars
    (
      ?auto_105401 - LOCATION
      ?auto_105399 - CITY
      ?auto_105402 - LOCATION
      ?auto_105403 - LOCATION
      ?auto_105400 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105401 ?auto_105399 ) ( IN-CITY ?auto_105395 ?auto_105399 ) ( not ( = ?auto_105395 ?auto_105401 ) ) ( OBJ-AT ?auto_105398 ?auto_105401 ) ( IN-CITY ?auto_105402 ?auto_105399 ) ( not ( = ?auto_105395 ?auto_105402 ) ) ( OBJ-AT ?auto_105397 ?auto_105402 ) ( IN-CITY ?auto_105403 ?auto_105399 ) ( not ( = ?auto_105395 ?auto_105403 ) ) ( OBJ-AT ?auto_105396 ?auto_105403 ) ( TRUCK-AT ?auto_105400 ?auto_105395 ) ( not ( = ?auto_105396 ?auto_105397 ) ) ( not ( = ?auto_105402 ?auto_105403 ) ) ( not ( = ?auto_105396 ?auto_105398 ) ) ( not ( = ?auto_105397 ?auto_105398 ) ) ( not ( = ?auto_105401 ?auto_105402 ) ) ( not ( = ?auto_105401 ?auto_105403 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_105396 ?auto_105397 ?auto_105395 )
      ( DELIVER-1PKG ?auto_105398 ?auto_105395 )
      ( DELIVER-3PKG-VERIFY ?auto_105396 ?auto_105397 ?auto_105398 ?auto_105395 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106539 - OBJ
      ?auto_106540 - OBJ
      ?auto_106541 - OBJ
      ?auto_106542 - OBJ
      ?auto_106538 - LOCATION
    )
    :vars
    (
      ?auto_106544 - LOCATION
      ?auto_106545 - CITY
      ?auto_106547 - LOCATION
      ?auto_106548 - LOCATION
      ?auto_106546 - LOCATION
      ?auto_106543 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106544 ?auto_106545 ) ( IN-CITY ?auto_106538 ?auto_106545 ) ( not ( = ?auto_106538 ?auto_106544 ) ) ( OBJ-AT ?auto_106542 ?auto_106544 ) ( IN-CITY ?auto_106547 ?auto_106545 ) ( not ( = ?auto_106538 ?auto_106547 ) ) ( OBJ-AT ?auto_106541 ?auto_106547 ) ( IN-CITY ?auto_106548 ?auto_106545 ) ( not ( = ?auto_106538 ?auto_106548 ) ) ( OBJ-AT ?auto_106540 ?auto_106548 ) ( IN-CITY ?auto_106546 ?auto_106545 ) ( not ( = ?auto_106538 ?auto_106546 ) ) ( OBJ-AT ?auto_106539 ?auto_106546 ) ( TRUCK-AT ?auto_106543 ?auto_106538 ) ( not ( = ?auto_106539 ?auto_106540 ) ) ( not ( = ?auto_106548 ?auto_106546 ) ) ( not ( = ?auto_106539 ?auto_106541 ) ) ( not ( = ?auto_106540 ?auto_106541 ) ) ( not ( = ?auto_106547 ?auto_106548 ) ) ( not ( = ?auto_106547 ?auto_106546 ) ) ( not ( = ?auto_106539 ?auto_106542 ) ) ( not ( = ?auto_106540 ?auto_106542 ) ) ( not ( = ?auto_106541 ?auto_106542 ) ) ( not ( = ?auto_106544 ?auto_106547 ) ) ( not ( = ?auto_106544 ?auto_106548 ) ) ( not ( = ?auto_106544 ?auto_106546 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_106539 ?auto_106540 ?auto_106541 ?auto_106538 )
      ( DELIVER-1PKG ?auto_106542 ?auto_106538 )
      ( DELIVER-4PKG-VERIFY ?auto_106539 ?auto_106540 ?auto_106541 ?auto_106542 ?auto_106538 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122149 - OBJ
      ?auto_122150 - OBJ
      ?auto_122151 - OBJ
      ?auto_122152 - OBJ
      ?auto_122153 - OBJ
      ?auto_122148 - LOCATION
    )
    :vars
    (
      ?auto_122156 - LOCATION
      ?auto_122154 - CITY
      ?auto_122158 - LOCATION
      ?auto_122157 - LOCATION
      ?auto_122159 - LOCATION
      ?auto_122155 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122156 ?auto_122154 ) ( IN-CITY ?auto_122148 ?auto_122154 ) ( not ( = ?auto_122148 ?auto_122156 ) ) ( OBJ-AT ?auto_122153 ?auto_122156 ) ( IN-CITY ?auto_122158 ?auto_122154 ) ( not ( = ?auto_122148 ?auto_122158 ) ) ( OBJ-AT ?auto_122152 ?auto_122158 ) ( IN-CITY ?auto_122157 ?auto_122154 ) ( not ( = ?auto_122148 ?auto_122157 ) ) ( OBJ-AT ?auto_122151 ?auto_122157 ) ( OBJ-AT ?auto_122150 ?auto_122156 ) ( IN-CITY ?auto_122159 ?auto_122154 ) ( not ( = ?auto_122148 ?auto_122159 ) ) ( OBJ-AT ?auto_122149 ?auto_122159 ) ( TRUCK-AT ?auto_122155 ?auto_122148 ) ( not ( = ?auto_122149 ?auto_122150 ) ) ( not ( = ?auto_122156 ?auto_122159 ) ) ( not ( = ?auto_122149 ?auto_122151 ) ) ( not ( = ?auto_122150 ?auto_122151 ) ) ( not ( = ?auto_122157 ?auto_122156 ) ) ( not ( = ?auto_122157 ?auto_122159 ) ) ( not ( = ?auto_122149 ?auto_122152 ) ) ( not ( = ?auto_122150 ?auto_122152 ) ) ( not ( = ?auto_122151 ?auto_122152 ) ) ( not ( = ?auto_122158 ?auto_122157 ) ) ( not ( = ?auto_122158 ?auto_122156 ) ) ( not ( = ?auto_122158 ?auto_122159 ) ) ( not ( = ?auto_122149 ?auto_122153 ) ) ( not ( = ?auto_122150 ?auto_122153 ) ) ( not ( = ?auto_122151 ?auto_122153 ) ) ( not ( = ?auto_122152 ?auto_122153 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_122149 ?auto_122150 ?auto_122151 ?auto_122152 ?auto_122148 )
      ( DELIVER-1PKG ?auto_122153 ?auto_122148 )
      ( DELIVER-5PKG-VERIFY ?auto_122149 ?auto_122150 ?auto_122151 ?auto_122152 ?auto_122153 ?auto_122148 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122200 - OBJ
      ?auto_122201 - OBJ
      ?auto_122202 - OBJ
      ?auto_122203 - OBJ
      ?auto_122204 - OBJ
      ?auto_122199 - LOCATION
    )
    :vars
    (
      ?auto_122205 - LOCATION
      ?auto_122210 - CITY
      ?auto_122209 - LOCATION
      ?auto_122207 - LOCATION
      ?auto_122208 - LOCATION
      ?auto_122206 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122205 ?auto_122210 ) ( IN-CITY ?auto_122199 ?auto_122210 ) ( not ( = ?auto_122199 ?auto_122205 ) ) ( OBJ-AT ?auto_122203 ?auto_122205 ) ( IN-CITY ?auto_122209 ?auto_122210 ) ( not ( = ?auto_122199 ?auto_122209 ) ) ( OBJ-AT ?auto_122204 ?auto_122209 ) ( IN-CITY ?auto_122207 ?auto_122210 ) ( not ( = ?auto_122199 ?auto_122207 ) ) ( OBJ-AT ?auto_122202 ?auto_122207 ) ( OBJ-AT ?auto_122201 ?auto_122205 ) ( IN-CITY ?auto_122208 ?auto_122210 ) ( not ( = ?auto_122199 ?auto_122208 ) ) ( OBJ-AT ?auto_122200 ?auto_122208 ) ( TRUCK-AT ?auto_122206 ?auto_122199 ) ( not ( = ?auto_122200 ?auto_122201 ) ) ( not ( = ?auto_122205 ?auto_122208 ) ) ( not ( = ?auto_122200 ?auto_122202 ) ) ( not ( = ?auto_122201 ?auto_122202 ) ) ( not ( = ?auto_122207 ?auto_122205 ) ) ( not ( = ?auto_122207 ?auto_122208 ) ) ( not ( = ?auto_122200 ?auto_122204 ) ) ( not ( = ?auto_122201 ?auto_122204 ) ) ( not ( = ?auto_122202 ?auto_122204 ) ) ( not ( = ?auto_122209 ?auto_122207 ) ) ( not ( = ?auto_122209 ?auto_122205 ) ) ( not ( = ?auto_122209 ?auto_122208 ) ) ( not ( = ?auto_122200 ?auto_122203 ) ) ( not ( = ?auto_122201 ?auto_122203 ) ) ( not ( = ?auto_122202 ?auto_122203 ) ) ( not ( = ?auto_122204 ?auto_122203 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122200 ?auto_122201 ?auto_122202 ?auto_122204 ?auto_122203 ?auto_122199 )
      ( DELIVER-5PKG-VERIFY ?auto_122200 ?auto_122201 ?auto_122202 ?auto_122203 ?auto_122204 ?auto_122199 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122503 - OBJ
      ?auto_122504 - OBJ
      ?auto_122505 - OBJ
      ?auto_122506 - OBJ
      ?auto_122507 - OBJ
      ?auto_122502 - LOCATION
    )
    :vars
    (
      ?auto_122511 - LOCATION
      ?auto_122512 - CITY
      ?auto_122513 - LOCATION
      ?auto_122508 - LOCATION
      ?auto_122510 - LOCATION
      ?auto_122509 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122511 ?auto_122512 ) ( IN-CITY ?auto_122502 ?auto_122512 ) ( not ( = ?auto_122502 ?auto_122511 ) ) ( OBJ-AT ?auto_122505 ?auto_122511 ) ( IN-CITY ?auto_122513 ?auto_122512 ) ( not ( = ?auto_122502 ?auto_122513 ) ) ( OBJ-AT ?auto_122507 ?auto_122513 ) ( IN-CITY ?auto_122508 ?auto_122512 ) ( not ( = ?auto_122502 ?auto_122508 ) ) ( OBJ-AT ?auto_122506 ?auto_122508 ) ( OBJ-AT ?auto_122504 ?auto_122511 ) ( IN-CITY ?auto_122510 ?auto_122512 ) ( not ( = ?auto_122502 ?auto_122510 ) ) ( OBJ-AT ?auto_122503 ?auto_122510 ) ( TRUCK-AT ?auto_122509 ?auto_122502 ) ( not ( = ?auto_122503 ?auto_122504 ) ) ( not ( = ?auto_122511 ?auto_122510 ) ) ( not ( = ?auto_122503 ?auto_122506 ) ) ( not ( = ?auto_122504 ?auto_122506 ) ) ( not ( = ?auto_122508 ?auto_122511 ) ) ( not ( = ?auto_122508 ?auto_122510 ) ) ( not ( = ?auto_122503 ?auto_122507 ) ) ( not ( = ?auto_122504 ?auto_122507 ) ) ( not ( = ?auto_122506 ?auto_122507 ) ) ( not ( = ?auto_122513 ?auto_122508 ) ) ( not ( = ?auto_122513 ?auto_122511 ) ) ( not ( = ?auto_122513 ?auto_122510 ) ) ( not ( = ?auto_122503 ?auto_122505 ) ) ( not ( = ?auto_122504 ?auto_122505 ) ) ( not ( = ?auto_122506 ?auto_122505 ) ) ( not ( = ?auto_122507 ?auto_122505 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122503 ?auto_122504 ?auto_122506 ?auto_122505 ?auto_122507 ?auto_122502 )
      ( DELIVER-5PKG-VERIFY ?auto_122503 ?auto_122504 ?auto_122505 ?auto_122506 ?auto_122507 ?auto_122502 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122815 - OBJ
      ?auto_122816 - OBJ
      ?auto_122817 - OBJ
      ?auto_122818 - OBJ
      ?auto_122819 - OBJ
      ?auto_122814 - LOCATION
    )
    :vars
    (
      ?auto_122823 - LOCATION
      ?auto_122824 - CITY
      ?auto_122825 - LOCATION
      ?auto_122820 - LOCATION
      ?auto_122822 - LOCATION
      ?auto_122821 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122823 ?auto_122824 ) ( IN-CITY ?auto_122814 ?auto_122824 ) ( not ( = ?auto_122814 ?auto_122823 ) ) ( OBJ-AT ?auto_122819 ?auto_122823 ) ( IN-CITY ?auto_122825 ?auto_122824 ) ( not ( = ?auto_122814 ?auto_122825 ) ) ( OBJ-AT ?auto_122818 ?auto_122825 ) ( IN-CITY ?auto_122820 ?auto_122824 ) ( not ( = ?auto_122814 ?auto_122820 ) ) ( OBJ-AT ?auto_122816 ?auto_122820 ) ( OBJ-AT ?auto_122817 ?auto_122823 ) ( IN-CITY ?auto_122822 ?auto_122824 ) ( not ( = ?auto_122814 ?auto_122822 ) ) ( OBJ-AT ?auto_122815 ?auto_122822 ) ( TRUCK-AT ?auto_122821 ?auto_122814 ) ( not ( = ?auto_122815 ?auto_122817 ) ) ( not ( = ?auto_122823 ?auto_122822 ) ) ( not ( = ?auto_122815 ?auto_122816 ) ) ( not ( = ?auto_122817 ?auto_122816 ) ) ( not ( = ?auto_122820 ?auto_122823 ) ) ( not ( = ?auto_122820 ?auto_122822 ) ) ( not ( = ?auto_122815 ?auto_122818 ) ) ( not ( = ?auto_122817 ?auto_122818 ) ) ( not ( = ?auto_122816 ?auto_122818 ) ) ( not ( = ?auto_122825 ?auto_122820 ) ) ( not ( = ?auto_122825 ?auto_122823 ) ) ( not ( = ?auto_122825 ?auto_122822 ) ) ( not ( = ?auto_122815 ?auto_122819 ) ) ( not ( = ?auto_122817 ?auto_122819 ) ) ( not ( = ?auto_122816 ?auto_122819 ) ) ( not ( = ?auto_122818 ?auto_122819 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122815 ?auto_122817 ?auto_122816 ?auto_122819 ?auto_122818 ?auto_122814 )
      ( DELIVER-5PKG-VERIFY ?auto_122815 ?auto_122816 ?auto_122817 ?auto_122818 ?auto_122819 ?auto_122814 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122866 - OBJ
      ?auto_122867 - OBJ
      ?auto_122868 - OBJ
      ?auto_122869 - OBJ
      ?auto_122870 - OBJ
      ?auto_122865 - LOCATION
    )
    :vars
    (
      ?auto_122874 - LOCATION
      ?auto_122875 - CITY
      ?auto_122876 - LOCATION
      ?auto_122871 - LOCATION
      ?auto_122873 - LOCATION
      ?auto_122872 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122874 ?auto_122875 ) ( IN-CITY ?auto_122865 ?auto_122875 ) ( not ( = ?auto_122865 ?auto_122874 ) ) ( OBJ-AT ?auto_122869 ?auto_122874 ) ( IN-CITY ?auto_122876 ?auto_122875 ) ( not ( = ?auto_122865 ?auto_122876 ) ) ( OBJ-AT ?auto_122870 ?auto_122876 ) ( IN-CITY ?auto_122871 ?auto_122875 ) ( not ( = ?auto_122865 ?auto_122871 ) ) ( OBJ-AT ?auto_122867 ?auto_122871 ) ( OBJ-AT ?auto_122868 ?auto_122874 ) ( IN-CITY ?auto_122873 ?auto_122875 ) ( not ( = ?auto_122865 ?auto_122873 ) ) ( OBJ-AT ?auto_122866 ?auto_122873 ) ( TRUCK-AT ?auto_122872 ?auto_122865 ) ( not ( = ?auto_122866 ?auto_122868 ) ) ( not ( = ?auto_122874 ?auto_122873 ) ) ( not ( = ?auto_122866 ?auto_122867 ) ) ( not ( = ?auto_122868 ?auto_122867 ) ) ( not ( = ?auto_122871 ?auto_122874 ) ) ( not ( = ?auto_122871 ?auto_122873 ) ) ( not ( = ?auto_122866 ?auto_122870 ) ) ( not ( = ?auto_122868 ?auto_122870 ) ) ( not ( = ?auto_122867 ?auto_122870 ) ) ( not ( = ?auto_122876 ?auto_122871 ) ) ( not ( = ?auto_122876 ?auto_122874 ) ) ( not ( = ?auto_122876 ?auto_122873 ) ) ( not ( = ?auto_122866 ?auto_122869 ) ) ( not ( = ?auto_122868 ?auto_122869 ) ) ( not ( = ?auto_122867 ?auto_122869 ) ) ( not ( = ?auto_122870 ?auto_122869 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122866 ?auto_122868 ?auto_122867 ?auto_122869 ?auto_122870 ?auto_122865 )
      ( DELIVER-5PKG-VERIFY ?auto_122866 ?auto_122867 ?auto_122868 ?auto_122869 ?auto_122870 ?auto_122865 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_123026 - OBJ
      ?auto_123027 - OBJ
      ?auto_123028 - OBJ
      ?auto_123029 - OBJ
      ?auto_123030 - OBJ
      ?auto_123025 - LOCATION
    )
    :vars
    (
      ?auto_123034 - LOCATION
      ?auto_123035 - CITY
      ?auto_123036 - LOCATION
      ?auto_123031 - LOCATION
      ?auto_123033 - LOCATION
      ?auto_123032 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_123034 ?auto_123035 ) ( IN-CITY ?auto_123025 ?auto_123035 ) ( not ( = ?auto_123025 ?auto_123034 ) ) ( OBJ-AT ?auto_123030 ?auto_123034 ) ( IN-CITY ?auto_123036 ?auto_123035 ) ( not ( = ?auto_123025 ?auto_123036 ) ) ( OBJ-AT ?auto_123028 ?auto_123036 ) ( IN-CITY ?auto_123031 ?auto_123035 ) ( not ( = ?auto_123025 ?auto_123031 ) ) ( OBJ-AT ?auto_123027 ?auto_123031 ) ( OBJ-AT ?auto_123029 ?auto_123034 ) ( IN-CITY ?auto_123033 ?auto_123035 ) ( not ( = ?auto_123025 ?auto_123033 ) ) ( OBJ-AT ?auto_123026 ?auto_123033 ) ( TRUCK-AT ?auto_123032 ?auto_123025 ) ( not ( = ?auto_123026 ?auto_123029 ) ) ( not ( = ?auto_123034 ?auto_123033 ) ) ( not ( = ?auto_123026 ?auto_123027 ) ) ( not ( = ?auto_123029 ?auto_123027 ) ) ( not ( = ?auto_123031 ?auto_123034 ) ) ( not ( = ?auto_123031 ?auto_123033 ) ) ( not ( = ?auto_123026 ?auto_123028 ) ) ( not ( = ?auto_123029 ?auto_123028 ) ) ( not ( = ?auto_123027 ?auto_123028 ) ) ( not ( = ?auto_123036 ?auto_123031 ) ) ( not ( = ?auto_123036 ?auto_123034 ) ) ( not ( = ?auto_123036 ?auto_123033 ) ) ( not ( = ?auto_123026 ?auto_123030 ) ) ( not ( = ?auto_123029 ?auto_123030 ) ) ( not ( = ?auto_123027 ?auto_123030 ) ) ( not ( = ?auto_123028 ?auto_123030 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_123026 ?auto_123029 ?auto_123027 ?auto_123030 ?auto_123028 ?auto_123025 )
      ( DELIVER-5PKG-VERIFY ?auto_123026 ?auto_123027 ?auto_123028 ?auto_123029 ?auto_123030 ?auto_123025 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_126151 - OBJ
      ?auto_126152 - OBJ
      ?auto_126153 - OBJ
      ?auto_126154 - OBJ
      ?auto_126155 - OBJ
      ?auto_126150 - LOCATION
    )
    :vars
    (
      ?auto_126159 - LOCATION
      ?auto_126160 - CITY
      ?auto_126161 - LOCATION
      ?auto_126156 - LOCATION
      ?auto_126158 - LOCATION
      ?auto_126157 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_126159 ?auto_126160 ) ( IN-CITY ?auto_126150 ?auto_126160 ) ( not ( = ?auto_126150 ?auto_126159 ) ) ( OBJ-AT ?auto_126155 ?auto_126159 ) ( IN-CITY ?auto_126161 ?auto_126160 ) ( not ( = ?auto_126150 ?auto_126161 ) ) ( OBJ-AT ?auto_126154 ?auto_126161 ) ( IN-CITY ?auto_126156 ?auto_126160 ) ( not ( = ?auto_126150 ?auto_126156 ) ) ( OBJ-AT ?auto_126153 ?auto_126156 ) ( OBJ-AT ?auto_126151 ?auto_126159 ) ( IN-CITY ?auto_126158 ?auto_126160 ) ( not ( = ?auto_126150 ?auto_126158 ) ) ( OBJ-AT ?auto_126152 ?auto_126158 ) ( TRUCK-AT ?auto_126157 ?auto_126150 ) ( not ( = ?auto_126152 ?auto_126151 ) ) ( not ( = ?auto_126159 ?auto_126158 ) ) ( not ( = ?auto_126152 ?auto_126153 ) ) ( not ( = ?auto_126151 ?auto_126153 ) ) ( not ( = ?auto_126156 ?auto_126159 ) ) ( not ( = ?auto_126156 ?auto_126158 ) ) ( not ( = ?auto_126152 ?auto_126154 ) ) ( not ( = ?auto_126151 ?auto_126154 ) ) ( not ( = ?auto_126153 ?auto_126154 ) ) ( not ( = ?auto_126161 ?auto_126156 ) ) ( not ( = ?auto_126161 ?auto_126159 ) ) ( not ( = ?auto_126161 ?auto_126158 ) ) ( not ( = ?auto_126152 ?auto_126155 ) ) ( not ( = ?auto_126151 ?auto_126155 ) ) ( not ( = ?auto_126153 ?auto_126155 ) ) ( not ( = ?auto_126154 ?auto_126155 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_126152 ?auto_126151 ?auto_126153 ?auto_126155 ?auto_126154 ?auto_126150 )
      ( DELIVER-5PKG-VERIFY ?auto_126151 ?auto_126152 ?auto_126153 ?auto_126154 ?auto_126155 ?auto_126150 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_126202 - OBJ
      ?auto_126203 - OBJ
      ?auto_126204 - OBJ
      ?auto_126205 - OBJ
      ?auto_126206 - OBJ
      ?auto_126201 - LOCATION
    )
    :vars
    (
      ?auto_126210 - LOCATION
      ?auto_126211 - CITY
      ?auto_126212 - LOCATION
      ?auto_126207 - LOCATION
      ?auto_126209 - LOCATION
      ?auto_126208 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_126210 ?auto_126211 ) ( IN-CITY ?auto_126201 ?auto_126211 ) ( not ( = ?auto_126201 ?auto_126210 ) ) ( OBJ-AT ?auto_126205 ?auto_126210 ) ( IN-CITY ?auto_126212 ?auto_126211 ) ( not ( = ?auto_126201 ?auto_126212 ) ) ( OBJ-AT ?auto_126206 ?auto_126212 ) ( IN-CITY ?auto_126207 ?auto_126211 ) ( not ( = ?auto_126201 ?auto_126207 ) ) ( OBJ-AT ?auto_126204 ?auto_126207 ) ( OBJ-AT ?auto_126202 ?auto_126210 ) ( IN-CITY ?auto_126209 ?auto_126211 ) ( not ( = ?auto_126201 ?auto_126209 ) ) ( OBJ-AT ?auto_126203 ?auto_126209 ) ( TRUCK-AT ?auto_126208 ?auto_126201 ) ( not ( = ?auto_126203 ?auto_126202 ) ) ( not ( = ?auto_126210 ?auto_126209 ) ) ( not ( = ?auto_126203 ?auto_126204 ) ) ( not ( = ?auto_126202 ?auto_126204 ) ) ( not ( = ?auto_126207 ?auto_126210 ) ) ( not ( = ?auto_126207 ?auto_126209 ) ) ( not ( = ?auto_126203 ?auto_126206 ) ) ( not ( = ?auto_126202 ?auto_126206 ) ) ( not ( = ?auto_126204 ?auto_126206 ) ) ( not ( = ?auto_126212 ?auto_126207 ) ) ( not ( = ?auto_126212 ?auto_126210 ) ) ( not ( = ?auto_126212 ?auto_126209 ) ) ( not ( = ?auto_126203 ?auto_126205 ) ) ( not ( = ?auto_126202 ?auto_126205 ) ) ( not ( = ?auto_126204 ?auto_126205 ) ) ( not ( = ?auto_126206 ?auto_126205 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_126203 ?auto_126202 ?auto_126204 ?auto_126205 ?auto_126206 ?auto_126201 )
      ( DELIVER-5PKG-VERIFY ?auto_126202 ?auto_126203 ?auto_126204 ?auto_126205 ?auto_126206 ?auto_126201 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_126505 - OBJ
      ?auto_126506 - OBJ
      ?auto_126507 - OBJ
      ?auto_126508 - OBJ
      ?auto_126509 - OBJ
      ?auto_126504 - LOCATION
    )
    :vars
    (
      ?auto_126513 - LOCATION
      ?auto_126514 - CITY
      ?auto_126515 - LOCATION
      ?auto_126510 - LOCATION
      ?auto_126512 - LOCATION
      ?auto_126511 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_126513 ?auto_126514 ) ( IN-CITY ?auto_126504 ?auto_126514 ) ( not ( = ?auto_126504 ?auto_126513 ) ) ( OBJ-AT ?auto_126507 ?auto_126513 ) ( IN-CITY ?auto_126515 ?auto_126514 ) ( not ( = ?auto_126504 ?auto_126515 ) ) ( OBJ-AT ?auto_126509 ?auto_126515 ) ( IN-CITY ?auto_126510 ?auto_126514 ) ( not ( = ?auto_126504 ?auto_126510 ) ) ( OBJ-AT ?auto_126508 ?auto_126510 ) ( OBJ-AT ?auto_126505 ?auto_126513 ) ( IN-CITY ?auto_126512 ?auto_126514 ) ( not ( = ?auto_126504 ?auto_126512 ) ) ( OBJ-AT ?auto_126506 ?auto_126512 ) ( TRUCK-AT ?auto_126511 ?auto_126504 ) ( not ( = ?auto_126506 ?auto_126505 ) ) ( not ( = ?auto_126513 ?auto_126512 ) ) ( not ( = ?auto_126506 ?auto_126508 ) ) ( not ( = ?auto_126505 ?auto_126508 ) ) ( not ( = ?auto_126510 ?auto_126513 ) ) ( not ( = ?auto_126510 ?auto_126512 ) ) ( not ( = ?auto_126506 ?auto_126509 ) ) ( not ( = ?auto_126505 ?auto_126509 ) ) ( not ( = ?auto_126508 ?auto_126509 ) ) ( not ( = ?auto_126515 ?auto_126510 ) ) ( not ( = ?auto_126515 ?auto_126513 ) ) ( not ( = ?auto_126515 ?auto_126512 ) ) ( not ( = ?auto_126506 ?auto_126507 ) ) ( not ( = ?auto_126505 ?auto_126507 ) ) ( not ( = ?auto_126508 ?auto_126507 ) ) ( not ( = ?auto_126509 ?auto_126507 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_126506 ?auto_126505 ?auto_126508 ?auto_126507 ?auto_126509 ?auto_126504 )
      ( DELIVER-5PKG-VERIFY ?auto_126505 ?auto_126506 ?auto_126507 ?auto_126508 ?auto_126509 ?auto_126504 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_129214 - OBJ
      ?auto_129215 - OBJ
      ?auto_129216 - OBJ
      ?auto_129217 - OBJ
      ?auto_129218 - OBJ
      ?auto_129213 - LOCATION
    )
    :vars
    (
      ?auto_129222 - LOCATION
      ?auto_129223 - CITY
      ?auto_129224 - LOCATION
      ?auto_129219 - LOCATION
      ?auto_129221 - LOCATION
      ?auto_129220 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_129222 ?auto_129223 ) ( IN-CITY ?auto_129213 ?auto_129223 ) ( not ( = ?auto_129213 ?auto_129222 ) ) ( OBJ-AT ?auto_129215 ?auto_129222 ) ( IN-CITY ?auto_129224 ?auto_129223 ) ( not ( = ?auto_129213 ?auto_129224 ) ) ( OBJ-AT ?auto_129218 ?auto_129224 ) ( IN-CITY ?auto_129219 ?auto_129223 ) ( not ( = ?auto_129213 ?auto_129219 ) ) ( OBJ-AT ?auto_129217 ?auto_129219 ) ( OBJ-AT ?auto_129214 ?auto_129222 ) ( IN-CITY ?auto_129221 ?auto_129223 ) ( not ( = ?auto_129213 ?auto_129221 ) ) ( OBJ-AT ?auto_129216 ?auto_129221 ) ( TRUCK-AT ?auto_129220 ?auto_129213 ) ( not ( = ?auto_129216 ?auto_129214 ) ) ( not ( = ?auto_129222 ?auto_129221 ) ) ( not ( = ?auto_129216 ?auto_129217 ) ) ( not ( = ?auto_129214 ?auto_129217 ) ) ( not ( = ?auto_129219 ?auto_129222 ) ) ( not ( = ?auto_129219 ?auto_129221 ) ) ( not ( = ?auto_129216 ?auto_129218 ) ) ( not ( = ?auto_129214 ?auto_129218 ) ) ( not ( = ?auto_129217 ?auto_129218 ) ) ( not ( = ?auto_129224 ?auto_129219 ) ) ( not ( = ?auto_129224 ?auto_129222 ) ) ( not ( = ?auto_129224 ?auto_129221 ) ) ( not ( = ?auto_129216 ?auto_129215 ) ) ( not ( = ?auto_129214 ?auto_129215 ) ) ( not ( = ?auto_129217 ?auto_129215 ) ) ( not ( = ?auto_129218 ?auto_129215 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_129216 ?auto_129214 ?auto_129217 ?auto_129215 ?auto_129218 ?auto_129213 )
      ( DELIVER-5PKG-VERIFY ?auto_129214 ?auto_129215 ?auto_129216 ?auto_129217 ?auto_129218 ?auto_129213 ) )
  )

)

