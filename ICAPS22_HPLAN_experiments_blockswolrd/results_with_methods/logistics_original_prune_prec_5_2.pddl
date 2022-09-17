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
      ?auto_1571043 - OBJ
      ?auto_1571042 - LOCATION
    )
    :vars
    (
      ?auto_1571044 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1571044 ?auto_1571042 ) ( IN-TRUCK ?auto_1571043 ?auto_1571044 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1571043 ?auto_1571044 ?auto_1571042 )
      ( DELIVER-1PKG-VERIFY ?auto_1571043 ?auto_1571042 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1571068 - OBJ
      ?auto_1571067 - LOCATION
    )
    :vars
    (
      ?auto_1571069 - TRUCK
      ?auto_1571070 - LOCATION
      ?auto_1571071 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1571068 ?auto_1571069 ) ( TRUCK-AT ?auto_1571069 ?auto_1571070 ) ( IN-CITY ?auto_1571070 ?auto_1571071 ) ( IN-CITY ?auto_1571067 ?auto_1571071 ) ( not ( = ?auto_1571067 ?auto_1571070 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1571069 ?auto_1571070 ?auto_1571067 ?auto_1571071 )
      ( DELIVER-1PKG ?auto_1571068 ?auto_1571067 )
      ( DELIVER-1PKG-VERIFY ?auto_1571068 ?auto_1571067 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1571103 - OBJ
      ?auto_1571102 - LOCATION
    )
    :vars
    (
      ?auto_1571104 - TRUCK
      ?auto_1571105 - LOCATION
      ?auto_1571106 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1571104 ?auto_1571105 ) ( IN-CITY ?auto_1571105 ?auto_1571106 ) ( IN-CITY ?auto_1571102 ?auto_1571106 ) ( not ( = ?auto_1571102 ?auto_1571105 ) ) ( OBJ-AT ?auto_1571103 ?auto_1571105 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1571103 ?auto_1571104 ?auto_1571105 )
      ( DELIVER-1PKG ?auto_1571103 ?auto_1571102 )
      ( DELIVER-1PKG-VERIFY ?auto_1571103 ?auto_1571102 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1571138 - OBJ
      ?auto_1571137 - LOCATION
    )
    :vars
    (
      ?auto_1571139 - LOCATION
      ?auto_1571140 - CITY
      ?auto_1571141 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1571139 ?auto_1571140 ) ( IN-CITY ?auto_1571137 ?auto_1571140 ) ( not ( = ?auto_1571137 ?auto_1571139 ) ) ( OBJ-AT ?auto_1571138 ?auto_1571139 ) ( TRUCK-AT ?auto_1571141 ?auto_1571137 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1571141 ?auto_1571137 ?auto_1571139 ?auto_1571140 )
      ( DELIVER-1PKG ?auto_1571138 ?auto_1571137 )
      ( DELIVER-1PKG-VERIFY ?auto_1571138 ?auto_1571137 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1571476 - OBJ
      ?auto_1571477 - OBJ
      ?auto_1571475 - LOCATION
    )
    :vars
    (
      ?auto_1571478 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1571477 ?auto_1571476 ) ) ( TRUCK-AT ?auto_1571478 ?auto_1571475 ) ( IN-TRUCK ?auto_1571477 ?auto_1571478 ) ( OBJ-AT ?auto_1571476 ?auto_1571475 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1571477 ?auto_1571475 )
      ( DELIVER-2PKG-VERIFY ?auto_1571476 ?auto_1571477 ?auto_1571475 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1571480 - OBJ
      ?auto_1571481 - OBJ
      ?auto_1571479 - LOCATION
    )
    :vars
    (
      ?auto_1571482 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1571481 ?auto_1571480 ) ) ( TRUCK-AT ?auto_1571482 ?auto_1571479 ) ( IN-TRUCK ?auto_1571480 ?auto_1571482 ) ( OBJ-AT ?auto_1571481 ?auto_1571479 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1571480 ?auto_1571479 )
      ( DELIVER-2PKG-VERIFY ?auto_1571480 ?auto_1571481 ?auto_1571479 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1571835 - OBJ
      ?auto_1571836 - OBJ
      ?auto_1571834 - LOCATION
    )
    :vars
    (
      ?auto_1571837 - TRUCK
      ?auto_1571839 - LOCATION
      ?auto_1571838 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1571836 ?auto_1571835 ) ) ( IN-TRUCK ?auto_1571836 ?auto_1571837 ) ( TRUCK-AT ?auto_1571837 ?auto_1571839 ) ( IN-CITY ?auto_1571839 ?auto_1571838 ) ( IN-CITY ?auto_1571834 ?auto_1571838 ) ( not ( = ?auto_1571834 ?auto_1571839 ) ) ( OBJ-AT ?auto_1571835 ?auto_1571834 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1571836 ?auto_1571834 )
      ( DELIVER-2PKG-VERIFY ?auto_1571835 ?auto_1571836 ?auto_1571834 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1571841 - OBJ
      ?auto_1571842 - OBJ
      ?auto_1571840 - LOCATION
    )
    :vars
    (
      ?auto_1571845 - TRUCK
      ?auto_1571844 - LOCATION
      ?auto_1571843 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1571842 ?auto_1571841 ) ) ( IN-TRUCK ?auto_1571841 ?auto_1571845 ) ( TRUCK-AT ?auto_1571845 ?auto_1571844 ) ( IN-CITY ?auto_1571844 ?auto_1571843 ) ( IN-CITY ?auto_1571840 ?auto_1571843 ) ( not ( = ?auto_1571840 ?auto_1571844 ) ) ( OBJ-AT ?auto_1571842 ?auto_1571840 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1571842 ?auto_1571841 ?auto_1571840 )
      ( DELIVER-2PKG-VERIFY ?auto_1571841 ?auto_1571842 ?auto_1571840 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1572305 - OBJ
      ?auto_1572304 - LOCATION
    )
    :vars
    (
      ?auto_1572309 - OBJ
      ?auto_1572308 - TRUCK
      ?auto_1572307 - LOCATION
      ?auto_1572306 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1572305 ?auto_1572309 ) ) ( TRUCK-AT ?auto_1572308 ?auto_1572307 ) ( IN-CITY ?auto_1572307 ?auto_1572306 ) ( IN-CITY ?auto_1572304 ?auto_1572306 ) ( not ( = ?auto_1572304 ?auto_1572307 ) ) ( OBJ-AT ?auto_1572309 ?auto_1572304 ) ( OBJ-AT ?auto_1572305 ?auto_1572307 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1572305 ?auto_1572308 ?auto_1572307 )
      ( DELIVER-2PKG ?auto_1572309 ?auto_1572305 ?auto_1572304 )
      ( DELIVER-1PKG-VERIFY ?auto_1572305 ?auto_1572304 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1572311 - OBJ
      ?auto_1572312 - OBJ
      ?auto_1572310 - LOCATION
    )
    :vars
    (
      ?auto_1572314 - TRUCK
      ?auto_1572313 - LOCATION
      ?auto_1572315 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1572312 ?auto_1572311 ) ) ( TRUCK-AT ?auto_1572314 ?auto_1572313 ) ( IN-CITY ?auto_1572313 ?auto_1572315 ) ( IN-CITY ?auto_1572310 ?auto_1572315 ) ( not ( = ?auto_1572310 ?auto_1572313 ) ) ( OBJ-AT ?auto_1572311 ?auto_1572310 ) ( OBJ-AT ?auto_1572312 ?auto_1572313 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1572312 ?auto_1572310 )
      ( DELIVER-2PKG-VERIFY ?auto_1572311 ?auto_1572312 ?auto_1572310 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1572317 - OBJ
      ?auto_1572318 - OBJ
      ?auto_1572316 - LOCATION
    )
    :vars
    (
      ?auto_1572321 - TRUCK
      ?auto_1572319 - LOCATION
      ?auto_1572320 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1572318 ?auto_1572317 ) ) ( TRUCK-AT ?auto_1572321 ?auto_1572319 ) ( IN-CITY ?auto_1572319 ?auto_1572320 ) ( IN-CITY ?auto_1572316 ?auto_1572320 ) ( not ( = ?auto_1572316 ?auto_1572319 ) ) ( OBJ-AT ?auto_1572318 ?auto_1572316 ) ( OBJ-AT ?auto_1572317 ?auto_1572319 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1572318 ?auto_1572317 ?auto_1572316 )
      ( DELIVER-2PKG-VERIFY ?auto_1572317 ?auto_1572318 ?auto_1572316 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1572781 - OBJ
      ?auto_1572780 - LOCATION
    )
    :vars
    (
      ?auto_1572785 - OBJ
      ?auto_1572782 - LOCATION
      ?auto_1572783 - CITY
      ?auto_1572784 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1572781 ?auto_1572785 ) ) ( IN-CITY ?auto_1572782 ?auto_1572783 ) ( IN-CITY ?auto_1572780 ?auto_1572783 ) ( not ( = ?auto_1572780 ?auto_1572782 ) ) ( OBJ-AT ?auto_1572785 ?auto_1572780 ) ( OBJ-AT ?auto_1572781 ?auto_1572782 ) ( TRUCK-AT ?auto_1572784 ?auto_1572780 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1572784 ?auto_1572780 ?auto_1572782 ?auto_1572783 )
      ( DELIVER-2PKG ?auto_1572785 ?auto_1572781 ?auto_1572780 )
      ( DELIVER-1PKG-VERIFY ?auto_1572781 ?auto_1572780 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1572787 - OBJ
      ?auto_1572788 - OBJ
      ?auto_1572786 - LOCATION
    )
    :vars
    (
      ?auto_1572791 - LOCATION
      ?auto_1572790 - CITY
      ?auto_1572789 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1572788 ?auto_1572787 ) ) ( IN-CITY ?auto_1572791 ?auto_1572790 ) ( IN-CITY ?auto_1572786 ?auto_1572790 ) ( not ( = ?auto_1572786 ?auto_1572791 ) ) ( OBJ-AT ?auto_1572787 ?auto_1572786 ) ( OBJ-AT ?auto_1572788 ?auto_1572791 ) ( TRUCK-AT ?auto_1572789 ?auto_1572786 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1572788 ?auto_1572786 )
      ( DELIVER-2PKG-VERIFY ?auto_1572787 ?auto_1572788 ?auto_1572786 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1572793 - OBJ
      ?auto_1572794 - OBJ
      ?auto_1572792 - LOCATION
    )
    :vars
    (
      ?auto_1572797 - LOCATION
      ?auto_1572796 - CITY
      ?auto_1572795 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1572794 ?auto_1572793 ) ) ( IN-CITY ?auto_1572797 ?auto_1572796 ) ( IN-CITY ?auto_1572792 ?auto_1572796 ) ( not ( = ?auto_1572792 ?auto_1572797 ) ) ( OBJ-AT ?auto_1572794 ?auto_1572792 ) ( OBJ-AT ?auto_1572793 ?auto_1572797 ) ( TRUCK-AT ?auto_1572795 ?auto_1572792 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1572794 ?auto_1572793 ?auto_1572792 )
      ( DELIVER-2PKG-VERIFY ?auto_1572793 ?auto_1572794 ?auto_1572792 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1573257 - OBJ
      ?auto_1573256 - LOCATION
    )
    :vars
    (
      ?auto_1573261 - OBJ
      ?auto_1573260 - LOCATION
      ?auto_1573259 - CITY
      ?auto_1573258 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1573257 ?auto_1573261 ) ) ( IN-CITY ?auto_1573260 ?auto_1573259 ) ( IN-CITY ?auto_1573256 ?auto_1573259 ) ( not ( = ?auto_1573256 ?auto_1573260 ) ) ( OBJ-AT ?auto_1573257 ?auto_1573260 ) ( TRUCK-AT ?auto_1573258 ?auto_1573256 ) ( IN-TRUCK ?auto_1573261 ?auto_1573258 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1573261 ?auto_1573256 )
      ( DELIVER-2PKG ?auto_1573261 ?auto_1573257 ?auto_1573256 )
      ( DELIVER-1PKG-VERIFY ?auto_1573257 ?auto_1573256 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1573263 - OBJ
      ?auto_1573264 - OBJ
      ?auto_1573262 - LOCATION
    )
    :vars
    (
      ?auto_1573265 - LOCATION
      ?auto_1573267 - CITY
      ?auto_1573266 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1573264 ?auto_1573263 ) ) ( IN-CITY ?auto_1573265 ?auto_1573267 ) ( IN-CITY ?auto_1573262 ?auto_1573267 ) ( not ( = ?auto_1573262 ?auto_1573265 ) ) ( OBJ-AT ?auto_1573264 ?auto_1573265 ) ( TRUCK-AT ?auto_1573266 ?auto_1573262 ) ( IN-TRUCK ?auto_1573263 ?auto_1573266 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1573264 ?auto_1573262 )
      ( DELIVER-2PKG-VERIFY ?auto_1573263 ?auto_1573264 ?auto_1573262 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1573269 - OBJ
      ?auto_1573270 - OBJ
      ?auto_1573268 - LOCATION
    )
    :vars
    (
      ?auto_1573271 - LOCATION
      ?auto_1573273 - CITY
      ?auto_1573272 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1573270 ?auto_1573269 ) ) ( IN-CITY ?auto_1573271 ?auto_1573273 ) ( IN-CITY ?auto_1573268 ?auto_1573273 ) ( not ( = ?auto_1573268 ?auto_1573271 ) ) ( OBJ-AT ?auto_1573269 ?auto_1573271 ) ( TRUCK-AT ?auto_1573272 ?auto_1573268 ) ( IN-TRUCK ?auto_1573270 ?auto_1573272 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1573270 ?auto_1573269 ?auto_1573268 )
      ( DELIVER-2PKG-VERIFY ?auto_1573269 ?auto_1573270 ?auto_1573268 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1573733 - OBJ
      ?auto_1573732 - LOCATION
    )
    :vars
    (
      ?auto_1573735 - OBJ
      ?auto_1573734 - LOCATION
      ?auto_1573737 - CITY
      ?auto_1573736 - TRUCK
      ?auto_1573738 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1573733 ?auto_1573735 ) ) ( IN-CITY ?auto_1573734 ?auto_1573737 ) ( IN-CITY ?auto_1573732 ?auto_1573737 ) ( not ( = ?auto_1573732 ?auto_1573734 ) ) ( OBJ-AT ?auto_1573733 ?auto_1573734 ) ( IN-TRUCK ?auto_1573735 ?auto_1573736 ) ( TRUCK-AT ?auto_1573736 ?auto_1573738 ) ( IN-CITY ?auto_1573738 ?auto_1573737 ) ( not ( = ?auto_1573732 ?auto_1573738 ) ) ( not ( = ?auto_1573734 ?auto_1573738 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1573736 ?auto_1573738 ?auto_1573732 ?auto_1573737 )
      ( DELIVER-2PKG ?auto_1573735 ?auto_1573733 ?auto_1573732 )
      ( DELIVER-1PKG-VERIFY ?auto_1573733 ?auto_1573732 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1573740 - OBJ
      ?auto_1573741 - OBJ
      ?auto_1573739 - LOCATION
    )
    :vars
    (
      ?auto_1573744 - LOCATION
      ?auto_1573742 - CITY
      ?auto_1573745 - TRUCK
      ?auto_1573743 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1573741 ?auto_1573740 ) ) ( IN-CITY ?auto_1573744 ?auto_1573742 ) ( IN-CITY ?auto_1573739 ?auto_1573742 ) ( not ( = ?auto_1573739 ?auto_1573744 ) ) ( OBJ-AT ?auto_1573741 ?auto_1573744 ) ( IN-TRUCK ?auto_1573740 ?auto_1573745 ) ( TRUCK-AT ?auto_1573745 ?auto_1573743 ) ( IN-CITY ?auto_1573743 ?auto_1573742 ) ( not ( = ?auto_1573739 ?auto_1573743 ) ) ( not ( = ?auto_1573744 ?auto_1573743 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1573741 ?auto_1573739 )
      ( DELIVER-2PKG-VERIFY ?auto_1573740 ?auto_1573741 ?auto_1573739 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1573747 - OBJ
      ?auto_1573748 - OBJ
      ?auto_1573746 - LOCATION
    )
    :vars
    (
      ?auto_1573749 - LOCATION
      ?auto_1573751 - CITY
      ?auto_1573750 - TRUCK
      ?auto_1573752 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1573748 ?auto_1573747 ) ) ( IN-CITY ?auto_1573749 ?auto_1573751 ) ( IN-CITY ?auto_1573746 ?auto_1573751 ) ( not ( = ?auto_1573746 ?auto_1573749 ) ) ( OBJ-AT ?auto_1573747 ?auto_1573749 ) ( IN-TRUCK ?auto_1573748 ?auto_1573750 ) ( TRUCK-AT ?auto_1573750 ?auto_1573752 ) ( IN-CITY ?auto_1573752 ?auto_1573751 ) ( not ( = ?auto_1573746 ?auto_1573752 ) ) ( not ( = ?auto_1573749 ?auto_1573752 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1573748 ?auto_1573747 ?auto_1573746 )
      ( DELIVER-2PKG-VERIFY ?auto_1573747 ?auto_1573748 ?auto_1573746 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1574266 - OBJ
      ?auto_1574265 - LOCATION
    )
    :vars
    (
      ?auto_1574269 - OBJ
      ?auto_1574267 - LOCATION
      ?auto_1574270 - CITY
      ?auto_1574268 - TRUCK
      ?auto_1574271 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1574266 ?auto_1574269 ) ) ( IN-CITY ?auto_1574267 ?auto_1574270 ) ( IN-CITY ?auto_1574265 ?auto_1574270 ) ( not ( = ?auto_1574265 ?auto_1574267 ) ) ( OBJ-AT ?auto_1574266 ?auto_1574267 ) ( TRUCK-AT ?auto_1574268 ?auto_1574271 ) ( IN-CITY ?auto_1574271 ?auto_1574270 ) ( not ( = ?auto_1574265 ?auto_1574271 ) ) ( not ( = ?auto_1574267 ?auto_1574271 ) ) ( OBJ-AT ?auto_1574269 ?auto_1574271 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1574269 ?auto_1574268 ?auto_1574271 )
      ( DELIVER-2PKG ?auto_1574269 ?auto_1574266 ?auto_1574265 )
      ( DELIVER-1PKG-VERIFY ?auto_1574266 ?auto_1574265 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1574273 - OBJ
      ?auto_1574274 - OBJ
      ?auto_1574272 - LOCATION
    )
    :vars
    (
      ?auto_1574275 - LOCATION
      ?auto_1574278 - CITY
      ?auto_1574276 - TRUCK
      ?auto_1574277 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1574274 ?auto_1574273 ) ) ( IN-CITY ?auto_1574275 ?auto_1574278 ) ( IN-CITY ?auto_1574272 ?auto_1574278 ) ( not ( = ?auto_1574272 ?auto_1574275 ) ) ( OBJ-AT ?auto_1574274 ?auto_1574275 ) ( TRUCK-AT ?auto_1574276 ?auto_1574277 ) ( IN-CITY ?auto_1574277 ?auto_1574278 ) ( not ( = ?auto_1574272 ?auto_1574277 ) ) ( not ( = ?auto_1574275 ?auto_1574277 ) ) ( OBJ-AT ?auto_1574273 ?auto_1574277 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1574274 ?auto_1574272 )
      ( DELIVER-2PKG-VERIFY ?auto_1574273 ?auto_1574274 ?auto_1574272 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1574280 - OBJ
      ?auto_1574281 - OBJ
      ?auto_1574279 - LOCATION
    )
    :vars
    (
      ?auto_1574285 - LOCATION
      ?auto_1574282 - CITY
      ?auto_1574284 - TRUCK
      ?auto_1574283 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1574281 ?auto_1574280 ) ) ( IN-CITY ?auto_1574285 ?auto_1574282 ) ( IN-CITY ?auto_1574279 ?auto_1574282 ) ( not ( = ?auto_1574279 ?auto_1574285 ) ) ( OBJ-AT ?auto_1574280 ?auto_1574285 ) ( TRUCK-AT ?auto_1574284 ?auto_1574283 ) ( IN-CITY ?auto_1574283 ?auto_1574282 ) ( not ( = ?auto_1574279 ?auto_1574283 ) ) ( not ( = ?auto_1574285 ?auto_1574283 ) ) ( OBJ-AT ?auto_1574281 ?auto_1574283 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1574281 ?auto_1574280 ?auto_1574279 )
      ( DELIVER-2PKG-VERIFY ?auto_1574280 ?auto_1574281 ?auto_1574279 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1576977 - OBJ
      ?auto_1576978 - OBJ
      ?auto_1576979 - OBJ
      ?auto_1576976 - LOCATION
    )
    :vars
    (
      ?auto_1576980 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1576978 ?auto_1576977 ) ) ( not ( = ?auto_1576979 ?auto_1576977 ) ) ( not ( = ?auto_1576979 ?auto_1576978 ) ) ( TRUCK-AT ?auto_1576980 ?auto_1576976 ) ( IN-TRUCK ?auto_1576979 ?auto_1576980 ) ( OBJ-AT ?auto_1576977 ?auto_1576976 ) ( OBJ-AT ?auto_1576978 ?auto_1576976 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1576979 ?auto_1576976 )
      ( DELIVER-3PKG-VERIFY ?auto_1576977 ?auto_1576978 ?auto_1576979 ?auto_1576976 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1576987 - OBJ
      ?auto_1576988 - OBJ
      ?auto_1576989 - OBJ
      ?auto_1576986 - LOCATION
    )
    :vars
    (
      ?auto_1576990 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1576988 ?auto_1576987 ) ) ( not ( = ?auto_1576989 ?auto_1576987 ) ) ( not ( = ?auto_1576989 ?auto_1576988 ) ) ( TRUCK-AT ?auto_1576990 ?auto_1576986 ) ( IN-TRUCK ?auto_1576988 ?auto_1576990 ) ( OBJ-AT ?auto_1576987 ?auto_1576986 ) ( OBJ-AT ?auto_1576989 ?auto_1576986 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1576988 ?auto_1576986 )
      ( DELIVER-3PKG-VERIFY ?auto_1576987 ?auto_1576988 ?auto_1576989 ?auto_1576986 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1577025 - OBJ
      ?auto_1577026 - OBJ
      ?auto_1577027 - OBJ
      ?auto_1577024 - LOCATION
    )
    :vars
    (
      ?auto_1577028 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1577026 ?auto_1577025 ) ) ( not ( = ?auto_1577027 ?auto_1577025 ) ) ( not ( = ?auto_1577027 ?auto_1577026 ) ) ( TRUCK-AT ?auto_1577028 ?auto_1577024 ) ( IN-TRUCK ?auto_1577025 ?auto_1577028 ) ( OBJ-AT ?auto_1577026 ?auto_1577024 ) ( OBJ-AT ?auto_1577027 ?auto_1577024 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1577025 ?auto_1577024 )
      ( DELIVER-3PKG-VERIFY ?auto_1577025 ?auto_1577026 ?auto_1577027 ?auto_1577024 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1578968 - OBJ
      ?auto_1578969 - OBJ
      ?auto_1578970 - OBJ
      ?auto_1578967 - LOCATION
    )
    :vars
    (
      ?auto_1578971 - TRUCK
      ?auto_1578972 - LOCATION
      ?auto_1578973 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1578969 ?auto_1578968 ) ) ( not ( = ?auto_1578970 ?auto_1578968 ) ) ( not ( = ?auto_1578970 ?auto_1578969 ) ) ( IN-TRUCK ?auto_1578970 ?auto_1578971 ) ( TRUCK-AT ?auto_1578971 ?auto_1578972 ) ( IN-CITY ?auto_1578972 ?auto_1578973 ) ( IN-CITY ?auto_1578967 ?auto_1578973 ) ( not ( = ?auto_1578967 ?auto_1578972 ) ) ( OBJ-AT ?auto_1578968 ?auto_1578967 ) ( OBJ-AT ?auto_1578969 ?auto_1578967 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1578968 ?auto_1578970 ?auto_1578967 )
      ( DELIVER-3PKG-VERIFY ?auto_1578968 ?auto_1578969 ?auto_1578970 ?auto_1578967 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1578982 - OBJ
      ?auto_1578983 - OBJ
      ?auto_1578984 - OBJ
      ?auto_1578981 - LOCATION
    )
    :vars
    (
      ?auto_1578985 - TRUCK
      ?auto_1578986 - LOCATION
      ?auto_1578987 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1578983 ?auto_1578982 ) ) ( not ( = ?auto_1578984 ?auto_1578982 ) ) ( not ( = ?auto_1578984 ?auto_1578983 ) ) ( IN-TRUCK ?auto_1578983 ?auto_1578985 ) ( TRUCK-AT ?auto_1578985 ?auto_1578986 ) ( IN-CITY ?auto_1578986 ?auto_1578987 ) ( IN-CITY ?auto_1578981 ?auto_1578987 ) ( not ( = ?auto_1578981 ?auto_1578986 ) ) ( OBJ-AT ?auto_1578982 ?auto_1578981 ) ( OBJ-AT ?auto_1578984 ?auto_1578981 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1578982 ?auto_1578983 ?auto_1578981 )
      ( DELIVER-3PKG-VERIFY ?auto_1578982 ?auto_1578983 ?auto_1578984 ?auto_1578981 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1579035 - OBJ
      ?auto_1579036 - OBJ
      ?auto_1579037 - OBJ
      ?auto_1579034 - LOCATION
    )
    :vars
    (
      ?auto_1579038 - TRUCK
      ?auto_1579039 - LOCATION
      ?auto_1579040 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1579036 ?auto_1579035 ) ) ( not ( = ?auto_1579037 ?auto_1579035 ) ) ( not ( = ?auto_1579037 ?auto_1579036 ) ) ( IN-TRUCK ?auto_1579035 ?auto_1579038 ) ( TRUCK-AT ?auto_1579038 ?auto_1579039 ) ( IN-CITY ?auto_1579039 ?auto_1579040 ) ( IN-CITY ?auto_1579034 ?auto_1579040 ) ( not ( = ?auto_1579034 ?auto_1579039 ) ) ( OBJ-AT ?auto_1579036 ?auto_1579034 ) ( OBJ-AT ?auto_1579037 ?auto_1579034 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1579036 ?auto_1579035 ?auto_1579034 )
      ( DELIVER-3PKG-VERIFY ?auto_1579035 ?auto_1579036 ?auto_1579037 ?auto_1579034 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1581595 - OBJ
      ?auto_1581596 - OBJ
      ?auto_1581597 - OBJ
      ?auto_1581594 - LOCATION
    )
    :vars
    (
      ?auto_1581599 - TRUCK
      ?auto_1581600 - LOCATION
      ?auto_1581598 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1581596 ?auto_1581595 ) ) ( not ( = ?auto_1581597 ?auto_1581595 ) ) ( not ( = ?auto_1581597 ?auto_1581596 ) ) ( TRUCK-AT ?auto_1581599 ?auto_1581600 ) ( IN-CITY ?auto_1581600 ?auto_1581598 ) ( IN-CITY ?auto_1581594 ?auto_1581598 ) ( not ( = ?auto_1581594 ?auto_1581600 ) ) ( OBJ-AT ?auto_1581595 ?auto_1581594 ) ( OBJ-AT ?auto_1581597 ?auto_1581600 ) ( OBJ-AT ?auto_1581596 ?auto_1581594 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1581595 ?auto_1581597 ?auto_1581594 )
      ( DELIVER-3PKG-VERIFY ?auto_1581595 ?auto_1581596 ?auto_1581597 ?auto_1581594 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1581609 - OBJ
      ?auto_1581610 - OBJ
      ?auto_1581611 - OBJ
      ?auto_1581608 - LOCATION
    )
    :vars
    (
      ?auto_1581613 - TRUCK
      ?auto_1581614 - LOCATION
      ?auto_1581612 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1581610 ?auto_1581609 ) ) ( not ( = ?auto_1581611 ?auto_1581609 ) ) ( not ( = ?auto_1581611 ?auto_1581610 ) ) ( TRUCK-AT ?auto_1581613 ?auto_1581614 ) ( IN-CITY ?auto_1581614 ?auto_1581612 ) ( IN-CITY ?auto_1581608 ?auto_1581612 ) ( not ( = ?auto_1581608 ?auto_1581614 ) ) ( OBJ-AT ?auto_1581609 ?auto_1581608 ) ( OBJ-AT ?auto_1581610 ?auto_1581614 ) ( OBJ-AT ?auto_1581611 ?auto_1581608 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1581609 ?auto_1581610 ?auto_1581608 )
      ( DELIVER-3PKG-VERIFY ?auto_1581609 ?auto_1581610 ?auto_1581611 ?auto_1581608 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1581662 - OBJ
      ?auto_1581663 - OBJ
      ?auto_1581664 - OBJ
      ?auto_1581661 - LOCATION
    )
    :vars
    (
      ?auto_1581666 - TRUCK
      ?auto_1581667 - LOCATION
      ?auto_1581665 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1581663 ?auto_1581662 ) ) ( not ( = ?auto_1581664 ?auto_1581662 ) ) ( not ( = ?auto_1581664 ?auto_1581663 ) ) ( TRUCK-AT ?auto_1581666 ?auto_1581667 ) ( IN-CITY ?auto_1581667 ?auto_1581665 ) ( IN-CITY ?auto_1581661 ?auto_1581665 ) ( not ( = ?auto_1581661 ?auto_1581667 ) ) ( OBJ-AT ?auto_1581663 ?auto_1581661 ) ( OBJ-AT ?auto_1581662 ?auto_1581667 ) ( OBJ-AT ?auto_1581664 ?auto_1581661 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1581663 ?auto_1581662 ?auto_1581661 )
      ( DELIVER-3PKG-VERIFY ?auto_1581662 ?auto_1581663 ?auto_1581664 ?auto_1581661 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1584222 - OBJ
      ?auto_1584223 - OBJ
      ?auto_1584224 - OBJ
      ?auto_1584221 - LOCATION
    )
    :vars
    (
      ?auto_1584226 - LOCATION
      ?auto_1584225 - CITY
      ?auto_1584227 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1584223 ?auto_1584222 ) ) ( not ( = ?auto_1584224 ?auto_1584222 ) ) ( not ( = ?auto_1584224 ?auto_1584223 ) ) ( IN-CITY ?auto_1584226 ?auto_1584225 ) ( IN-CITY ?auto_1584221 ?auto_1584225 ) ( not ( = ?auto_1584221 ?auto_1584226 ) ) ( OBJ-AT ?auto_1584222 ?auto_1584221 ) ( OBJ-AT ?auto_1584224 ?auto_1584226 ) ( TRUCK-AT ?auto_1584227 ?auto_1584221 ) ( OBJ-AT ?auto_1584223 ?auto_1584221 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1584222 ?auto_1584224 ?auto_1584221 )
      ( DELIVER-3PKG-VERIFY ?auto_1584222 ?auto_1584223 ?auto_1584224 ?auto_1584221 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1584236 - OBJ
      ?auto_1584237 - OBJ
      ?auto_1584238 - OBJ
      ?auto_1584235 - LOCATION
    )
    :vars
    (
      ?auto_1584240 - LOCATION
      ?auto_1584239 - CITY
      ?auto_1584241 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1584237 ?auto_1584236 ) ) ( not ( = ?auto_1584238 ?auto_1584236 ) ) ( not ( = ?auto_1584238 ?auto_1584237 ) ) ( IN-CITY ?auto_1584240 ?auto_1584239 ) ( IN-CITY ?auto_1584235 ?auto_1584239 ) ( not ( = ?auto_1584235 ?auto_1584240 ) ) ( OBJ-AT ?auto_1584236 ?auto_1584235 ) ( OBJ-AT ?auto_1584237 ?auto_1584240 ) ( TRUCK-AT ?auto_1584241 ?auto_1584235 ) ( OBJ-AT ?auto_1584238 ?auto_1584235 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1584236 ?auto_1584237 ?auto_1584235 )
      ( DELIVER-3PKG-VERIFY ?auto_1584236 ?auto_1584237 ?auto_1584238 ?auto_1584235 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1584289 - OBJ
      ?auto_1584290 - OBJ
      ?auto_1584291 - OBJ
      ?auto_1584288 - LOCATION
    )
    :vars
    (
      ?auto_1584293 - LOCATION
      ?auto_1584292 - CITY
      ?auto_1584294 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1584290 ?auto_1584289 ) ) ( not ( = ?auto_1584291 ?auto_1584289 ) ) ( not ( = ?auto_1584291 ?auto_1584290 ) ) ( IN-CITY ?auto_1584293 ?auto_1584292 ) ( IN-CITY ?auto_1584288 ?auto_1584292 ) ( not ( = ?auto_1584288 ?auto_1584293 ) ) ( OBJ-AT ?auto_1584290 ?auto_1584288 ) ( OBJ-AT ?auto_1584289 ?auto_1584293 ) ( TRUCK-AT ?auto_1584294 ?auto_1584288 ) ( OBJ-AT ?auto_1584291 ?auto_1584288 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1584290 ?auto_1584289 ?auto_1584288 )
      ( DELIVER-3PKG-VERIFY ?auto_1584289 ?auto_1584290 ?auto_1584291 ?auto_1584288 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1589445 - OBJ
      ?auto_1589444 - LOCATION
    )
    :vars
    (
      ?auto_1589446 - OBJ
      ?auto_1589449 - LOCATION
      ?auto_1589447 - CITY
      ?auto_1589448 - TRUCK
      ?auto_1589450 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1589445 ?auto_1589446 ) ) ( IN-CITY ?auto_1589449 ?auto_1589447 ) ( IN-CITY ?auto_1589444 ?auto_1589447 ) ( not ( = ?auto_1589444 ?auto_1589449 ) ) ( OBJ-AT ?auto_1589446 ?auto_1589444 ) ( OBJ-AT ?auto_1589445 ?auto_1589449 ) ( TRUCK-AT ?auto_1589448 ?auto_1589450 ) ( IN-CITY ?auto_1589450 ?auto_1589447 ) ( not ( = ?auto_1589444 ?auto_1589450 ) ) ( not ( = ?auto_1589449 ?auto_1589450 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1589448 ?auto_1589450 ?auto_1589444 ?auto_1589447 )
      ( DELIVER-2PKG ?auto_1589446 ?auto_1589445 ?auto_1589444 )
      ( DELIVER-1PKG-VERIFY ?auto_1589445 ?auto_1589444 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1589452 - OBJ
      ?auto_1589453 - OBJ
      ?auto_1589451 - LOCATION
    )
    :vars
    (
      ?auto_1589457 - LOCATION
      ?auto_1589454 - CITY
      ?auto_1589455 - TRUCK
      ?auto_1589456 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1589453 ?auto_1589452 ) ) ( IN-CITY ?auto_1589457 ?auto_1589454 ) ( IN-CITY ?auto_1589451 ?auto_1589454 ) ( not ( = ?auto_1589451 ?auto_1589457 ) ) ( OBJ-AT ?auto_1589452 ?auto_1589451 ) ( OBJ-AT ?auto_1589453 ?auto_1589457 ) ( TRUCK-AT ?auto_1589455 ?auto_1589456 ) ( IN-CITY ?auto_1589456 ?auto_1589454 ) ( not ( = ?auto_1589451 ?auto_1589456 ) ) ( not ( = ?auto_1589457 ?auto_1589456 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1589453 ?auto_1589451 )
      ( DELIVER-2PKG-VERIFY ?auto_1589452 ?auto_1589453 ?auto_1589451 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1589467 - OBJ
      ?auto_1589468 - OBJ
      ?auto_1589466 - LOCATION
    )
    :vars
    (
      ?auto_1589470 - LOCATION
      ?auto_1589472 - CITY
      ?auto_1589471 - TRUCK
      ?auto_1589469 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1589468 ?auto_1589467 ) ) ( IN-CITY ?auto_1589470 ?auto_1589472 ) ( IN-CITY ?auto_1589466 ?auto_1589472 ) ( not ( = ?auto_1589466 ?auto_1589470 ) ) ( OBJ-AT ?auto_1589468 ?auto_1589466 ) ( OBJ-AT ?auto_1589467 ?auto_1589470 ) ( TRUCK-AT ?auto_1589471 ?auto_1589469 ) ( IN-CITY ?auto_1589469 ?auto_1589472 ) ( not ( = ?auto_1589466 ?auto_1589469 ) ) ( not ( = ?auto_1589470 ?auto_1589469 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1589468 ?auto_1589467 ?auto_1589466 )
      ( DELIVER-2PKG-VERIFY ?auto_1589467 ?auto_1589468 ?auto_1589466 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1615021 - OBJ
      ?auto_1615022 - OBJ
      ?auto_1615023 - OBJ
      ?auto_1615024 - OBJ
      ?auto_1615020 - LOCATION
    )
    :vars
    (
      ?auto_1615025 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1615022 ?auto_1615021 ) ) ( not ( = ?auto_1615023 ?auto_1615021 ) ) ( not ( = ?auto_1615023 ?auto_1615022 ) ) ( not ( = ?auto_1615024 ?auto_1615021 ) ) ( not ( = ?auto_1615024 ?auto_1615022 ) ) ( not ( = ?auto_1615024 ?auto_1615023 ) ) ( TRUCK-AT ?auto_1615025 ?auto_1615020 ) ( IN-TRUCK ?auto_1615024 ?auto_1615025 ) ( OBJ-AT ?auto_1615021 ?auto_1615020 ) ( OBJ-AT ?auto_1615022 ?auto_1615020 ) ( OBJ-AT ?auto_1615023 ?auto_1615020 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1615024 ?auto_1615020 )
      ( DELIVER-4PKG-VERIFY ?auto_1615021 ?auto_1615022 ?auto_1615023 ?auto_1615024 ?auto_1615020 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1615039 - OBJ
      ?auto_1615040 - OBJ
      ?auto_1615041 - OBJ
      ?auto_1615042 - OBJ
      ?auto_1615038 - LOCATION
    )
    :vars
    (
      ?auto_1615043 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1615040 ?auto_1615039 ) ) ( not ( = ?auto_1615041 ?auto_1615039 ) ) ( not ( = ?auto_1615041 ?auto_1615040 ) ) ( not ( = ?auto_1615042 ?auto_1615039 ) ) ( not ( = ?auto_1615042 ?auto_1615040 ) ) ( not ( = ?auto_1615042 ?auto_1615041 ) ) ( TRUCK-AT ?auto_1615043 ?auto_1615038 ) ( IN-TRUCK ?auto_1615041 ?auto_1615043 ) ( OBJ-AT ?auto_1615039 ?auto_1615038 ) ( OBJ-AT ?auto_1615040 ?auto_1615038 ) ( OBJ-AT ?auto_1615042 ?auto_1615038 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1615041 ?auto_1615038 )
      ( DELIVER-4PKG-VERIFY ?auto_1615039 ?auto_1615040 ?auto_1615041 ?auto_1615042 ?auto_1615038 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1615127 - OBJ
      ?auto_1615128 - OBJ
      ?auto_1615129 - OBJ
      ?auto_1615130 - OBJ
      ?auto_1615126 - LOCATION
    )
    :vars
    (
      ?auto_1615131 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1615128 ?auto_1615127 ) ) ( not ( = ?auto_1615129 ?auto_1615127 ) ) ( not ( = ?auto_1615129 ?auto_1615128 ) ) ( not ( = ?auto_1615130 ?auto_1615127 ) ) ( not ( = ?auto_1615130 ?auto_1615128 ) ) ( not ( = ?auto_1615130 ?auto_1615129 ) ) ( TRUCK-AT ?auto_1615131 ?auto_1615126 ) ( IN-TRUCK ?auto_1615128 ?auto_1615131 ) ( OBJ-AT ?auto_1615127 ?auto_1615126 ) ( OBJ-AT ?auto_1615129 ?auto_1615126 ) ( OBJ-AT ?auto_1615130 ?auto_1615126 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1615128 ?auto_1615126 )
      ( DELIVER-4PKG-VERIFY ?auto_1615127 ?auto_1615128 ?auto_1615129 ?auto_1615130 ?auto_1615126 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1615654 - OBJ
      ?auto_1615655 - OBJ
      ?auto_1615656 - OBJ
      ?auto_1615657 - OBJ
      ?auto_1615653 - LOCATION
    )
    :vars
    (
      ?auto_1615658 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1615655 ?auto_1615654 ) ) ( not ( = ?auto_1615656 ?auto_1615654 ) ) ( not ( = ?auto_1615656 ?auto_1615655 ) ) ( not ( = ?auto_1615657 ?auto_1615654 ) ) ( not ( = ?auto_1615657 ?auto_1615655 ) ) ( not ( = ?auto_1615657 ?auto_1615656 ) ) ( TRUCK-AT ?auto_1615658 ?auto_1615653 ) ( IN-TRUCK ?auto_1615654 ?auto_1615658 ) ( OBJ-AT ?auto_1615655 ?auto_1615653 ) ( OBJ-AT ?auto_1615656 ?auto_1615653 ) ( OBJ-AT ?auto_1615657 ?auto_1615653 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1615654 ?auto_1615653 )
      ( DELIVER-4PKG-VERIFY ?auto_1615654 ?auto_1615655 ?auto_1615656 ?auto_1615657 ?auto_1615653 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1621799 - OBJ
      ?auto_1621800 - OBJ
      ?auto_1621801 - OBJ
      ?auto_1621802 - OBJ
      ?auto_1621798 - LOCATION
    )
    :vars
    (
      ?auto_1621803 - TRUCK
      ?auto_1621805 - LOCATION
      ?auto_1621804 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1621800 ?auto_1621799 ) ) ( not ( = ?auto_1621801 ?auto_1621799 ) ) ( not ( = ?auto_1621801 ?auto_1621800 ) ) ( not ( = ?auto_1621802 ?auto_1621799 ) ) ( not ( = ?auto_1621802 ?auto_1621800 ) ) ( not ( = ?auto_1621802 ?auto_1621801 ) ) ( IN-TRUCK ?auto_1621802 ?auto_1621803 ) ( TRUCK-AT ?auto_1621803 ?auto_1621805 ) ( IN-CITY ?auto_1621805 ?auto_1621804 ) ( IN-CITY ?auto_1621798 ?auto_1621804 ) ( not ( = ?auto_1621798 ?auto_1621805 ) ) ( OBJ-AT ?auto_1621799 ?auto_1621798 ) ( OBJ-AT ?auto_1621800 ?auto_1621798 ) ( OBJ-AT ?auto_1621801 ?auto_1621798 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1621799 ?auto_1621802 ?auto_1621798 )
      ( DELIVER-4PKG-VERIFY ?auto_1621799 ?auto_1621800 ?auto_1621801 ?auto_1621802 ?auto_1621798 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1621823 - OBJ
      ?auto_1621824 - OBJ
      ?auto_1621825 - OBJ
      ?auto_1621826 - OBJ
      ?auto_1621822 - LOCATION
    )
    :vars
    (
      ?auto_1621827 - TRUCK
      ?auto_1621829 - LOCATION
      ?auto_1621828 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1621824 ?auto_1621823 ) ) ( not ( = ?auto_1621825 ?auto_1621823 ) ) ( not ( = ?auto_1621825 ?auto_1621824 ) ) ( not ( = ?auto_1621826 ?auto_1621823 ) ) ( not ( = ?auto_1621826 ?auto_1621824 ) ) ( not ( = ?auto_1621826 ?auto_1621825 ) ) ( IN-TRUCK ?auto_1621825 ?auto_1621827 ) ( TRUCK-AT ?auto_1621827 ?auto_1621829 ) ( IN-CITY ?auto_1621829 ?auto_1621828 ) ( IN-CITY ?auto_1621822 ?auto_1621828 ) ( not ( = ?auto_1621822 ?auto_1621829 ) ) ( OBJ-AT ?auto_1621823 ?auto_1621822 ) ( OBJ-AT ?auto_1621824 ?auto_1621822 ) ( OBJ-AT ?auto_1621826 ?auto_1621822 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1621823 ?auto_1621825 ?auto_1621822 )
      ( DELIVER-4PKG-VERIFY ?auto_1621823 ?auto_1621824 ?auto_1621825 ?auto_1621826 ?auto_1621822 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1621937 - OBJ
      ?auto_1621938 - OBJ
      ?auto_1621939 - OBJ
      ?auto_1621940 - OBJ
      ?auto_1621936 - LOCATION
    )
    :vars
    (
      ?auto_1621941 - TRUCK
      ?auto_1621943 - LOCATION
      ?auto_1621942 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1621938 ?auto_1621937 ) ) ( not ( = ?auto_1621939 ?auto_1621937 ) ) ( not ( = ?auto_1621939 ?auto_1621938 ) ) ( not ( = ?auto_1621940 ?auto_1621937 ) ) ( not ( = ?auto_1621940 ?auto_1621938 ) ) ( not ( = ?auto_1621940 ?auto_1621939 ) ) ( IN-TRUCK ?auto_1621938 ?auto_1621941 ) ( TRUCK-AT ?auto_1621941 ?auto_1621943 ) ( IN-CITY ?auto_1621943 ?auto_1621942 ) ( IN-CITY ?auto_1621936 ?auto_1621942 ) ( not ( = ?auto_1621936 ?auto_1621943 ) ) ( OBJ-AT ?auto_1621937 ?auto_1621936 ) ( OBJ-AT ?auto_1621939 ?auto_1621936 ) ( OBJ-AT ?auto_1621940 ?auto_1621936 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1621937 ?auto_1621938 ?auto_1621936 )
      ( DELIVER-4PKG-VERIFY ?auto_1621937 ?auto_1621938 ?auto_1621939 ?auto_1621940 ?auto_1621936 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1622656 - OBJ
      ?auto_1622657 - OBJ
      ?auto_1622658 - OBJ
      ?auto_1622659 - OBJ
      ?auto_1622655 - LOCATION
    )
    :vars
    (
      ?auto_1622660 - TRUCK
      ?auto_1622662 - LOCATION
      ?auto_1622661 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1622657 ?auto_1622656 ) ) ( not ( = ?auto_1622658 ?auto_1622656 ) ) ( not ( = ?auto_1622658 ?auto_1622657 ) ) ( not ( = ?auto_1622659 ?auto_1622656 ) ) ( not ( = ?auto_1622659 ?auto_1622657 ) ) ( not ( = ?auto_1622659 ?auto_1622658 ) ) ( IN-TRUCK ?auto_1622656 ?auto_1622660 ) ( TRUCK-AT ?auto_1622660 ?auto_1622662 ) ( IN-CITY ?auto_1622662 ?auto_1622661 ) ( IN-CITY ?auto_1622655 ?auto_1622661 ) ( not ( = ?auto_1622655 ?auto_1622662 ) ) ( OBJ-AT ?auto_1622657 ?auto_1622655 ) ( OBJ-AT ?auto_1622658 ?auto_1622655 ) ( OBJ-AT ?auto_1622659 ?auto_1622655 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1622657 ?auto_1622656 ?auto_1622655 )
      ( DELIVER-4PKG-VERIFY ?auto_1622656 ?auto_1622657 ?auto_1622658 ?auto_1622659 ?auto_1622655 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1630708 - OBJ
      ?auto_1630709 - OBJ
      ?auto_1630710 - OBJ
      ?auto_1630711 - OBJ
      ?auto_1630707 - LOCATION
    )
    :vars
    (
      ?auto_1630714 - TRUCK
      ?auto_1630713 - LOCATION
      ?auto_1630712 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1630709 ?auto_1630708 ) ) ( not ( = ?auto_1630710 ?auto_1630708 ) ) ( not ( = ?auto_1630710 ?auto_1630709 ) ) ( not ( = ?auto_1630711 ?auto_1630708 ) ) ( not ( = ?auto_1630711 ?auto_1630709 ) ) ( not ( = ?auto_1630711 ?auto_1630710 ) ) ( TRUCK-AT ?auto_1630714 ?auto_1630713 ) ( IN-CITY ?auto_1630713 ?auto_1630712 ) ( IN-CITY ?auto_1630707 ?auto_1630712 ) ( not ( = ?auto_1630707 ?auto_1630713 ) ) ( OBJ-AT ?auto_1630708 ?auto_1630707 ) ( OBJ-AT ?auto_1630711 ?auto_1630713 ) ( OBJ-AT ?auto_1630709 ?auto_1630707 ) ( OBJ-AT ?auto_1630710 ?auto_1630707 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1630708 ?auto_1630711 ?auto_1630707 )
      ( DELIVER-4PKG-VERIFY ?auto_1630708 ?auto_1630709 ?auto_1630710 ?auto_1630711 ?auto_1630707 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1630732 - OBJ
      ?auto_1630733 - OBJ
      ?auto_1630734 - OBJ
      ?auto_1630735 - OBJ
      ?auto_1630731 - LOCATION
    )
    :vars
    (
      ?auto_1630738 - TRUCK
      ?auto_1630737 - LOCATION
      ?auto_1630736 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1630733 ?auto_1630732 ) ) ( not ( = ?auto_1630734 ?auto_1630732 ) ) ( not ( = ?auto_1630734 ?auto_1630733 ) ) ( not ( = ?auto_1630735 ?auto_1630732 ) ) ( not ( = ?auto_1630735 ?auto_1630733 ) ) ( not ( = ?auto_1630735 ?auto_1630734 ) ) ( TRUCK-AT ?auto_1630738 ?auto_1630737 ) ( IN-CITY ?auto_1630737 ?auto_1630736 ) ( IN-CITY ?auto_1630731 ?auto_1630736 ) ( not ( = ?auto_1630731 ?auto_1630737 ) ) ( OBJ-AT ?auto_1630732 ?auto_1630731 ) ( OBJ-AT ?auto_1630734 ?auto_1630737 ) ( OBJ-AT ?auto_1630733 ?auto_1630731 ) ( OBJ-AT ?auto_1630735 ?auto_1630731 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1630732 ?auto_1630734 ?auto_1630731 )
      ( DELIVER-4PKG-VERIFY ?auto_1630732 ?auto_1630733 ?auto_1630734 ?auto_1630735 ?auto_1630731 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1630846 - OBJ
      ?auto_1630847 - OBJ
      ?auto_1630848 - OBJ
      ?auto_1630849 - OBJ
      ?auto_1630845 - LOCATION
    )
    :vars
    (
      ?auto_1630852 - TRUCK
      ?auto_1630851 - LOCATION
      ?auto_1630850 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1630847 ?auto_1630846 ) ) ( not ( = ?auto_1630848 ?auto_1630846 ) ) ( not ( = ?auto_1630848 ?auto_1630847 ) ) ( not ( = ?auto_1630849 ?auto_1630846 ) ) ( not ( = ?auto_1630849 ?auto_1630847 ) ) ( not ( = ?auto_1630849 ?auto_1630848 ) ) ( TRUCK-AT ?auto_1630852 ?auto_1630851 ) ( IN-CITY ?auto_1630851 ?auto_1630850 ) ( IN-CITY ?auto_1630845 ?auto_1630850 ) ( not ( = ?auto_1630845 ?auto_1630851 ) ) ( OBJ-AT ?auto_1630846 ?auto_1630845 ) ( OBJ-AT ?auto_1630847 ?auto_1630851 ) ( OBJ-AT ?auto_1630848 ?auto_1630845 ) ( OBJ-AT ?auto_1630849 ?auto_1630845 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1630846 ?auto_1630847 ?auto_1630845 )
      ( DELIVER-4PKG-VERIFY ?auto_1630846 ?auto_1630847 ?auto_1630848 ?auto_1630849 ?auto_1630845 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1631565 - OBJ
      ?auto_1631566 - OBJ
      ?auto_1631567 - OBJ
      ?auto_1631568 - OBJ
      ?auto_1631564 - LOCATION
    )
    :vars
    (
      ?auto_1631571 - TRUCK
      ?auto_1631570 - LOCATION
      ?auto_1631569 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1631566 ?auto_1631565 ) ) ( not ( = ?auto_1631567 ?auto_1631565 ) ) ( not ( = ?auto_1631567 ?auto_1631566 ) ) ( not ( = ?auto_1631568 ?auto_1631565 ) ) ( not ( = ?auto_1631568 ?auto_1631566 ) ) ( not ( = ?auto_1631568 ?auto_1631567 ) ) ( TRUCK-AT ?auto_1631571 ?auto_1631570 ) ( IN-CITY ?auto_1631570 ?auto_1631569 ) ( IN-CITY ?auto_1631564 ?auto_1631569 ) ( not ( = ?auto_1631564 ?auto_1631570 ) ) ( OBJ-AT ?auto_1631566 ?auto_1631564 ) ( OBJ-AT ?auto_1631565 ?auto_1631570 ) ( OBJ-AT ?auto_1631567 ?auto_1631564 ) ( OBJ-AT ?auto_1631568 ?auto_1631564 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1631566 ?auto_1631565 ?auto_1631564 )
      ( DELIVER-4PKG-VERIFY ?auto_1631565 ?auto_1631566 ?auto_1631567 ?auto_1631568 ?auto_1631564 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1639617 - OBJ
      ?auto_1639618 - OBJ
      ?auto_1639619 - OBJ
      ?auto_1639620 - OBJ
      ?auto_1639616 - LOCATION
    )
    :vars
    (
      ?auto_1639622 - LOCATION
      ?auto_1639621 - CITY
      ?auto_1639623 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1639618 ?auto_1639617 ) ) ( not ( = ?auto_1639619 ?auto_1639617 ) ) ( not ( = ?auto_1639619 ?auto_1639618 ) ) ( not ( = ?auto_1639620 ?auto_1639617 ) ) ( not ( = ?auto_1639620 ?auto_1639618 ) ) ( not ( = ?auto_1639620 ?auto_1639619 ) ) ( IN-CITY ?auto_1639622 ?auto_1639621 ) ( IN-CITY ?auto_1639616 ?auto_1639621 ) ( not ( = ?auto_1639616 ?auto_1639622 ) ) ( OBJ-AT ?auto_1639617 ?auto_1639616 ) ( OBJ-AT ?auto_1639620 ?auto_1639622 ) ( TRUCK-AT ?auto_1639623 ?auto_1639616 ) ( OBJ-AT ?auto_1639618 ?auto_1639616 ) ( OBJ-AT ?auto_1639619 ?auto_1639616 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1639617 ?auto_1639620 ?auto_1639616 )
      ( DELIVER-4PKG-VERIFY ?auto_1639617 ?auto_1639618 ?auto_1639619 ?auto_1639620 ?auto_1639616 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1639641 - OBJ
      ?auto_1639642 - OBJ
      ?auto_1639643 - OBJ
      ?auto_1639644 - OBJ
      ?auto_1639640 - LOCATION
    )
    :vars
    (
      ?auto_1639646 - LOCATION
      ?auto_1639645 - CITY
      ?auto_1639647 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1639642 ?auto_1639641 ) ) ( not ( = ?auto_1639643 ?auto_1639641 ) ) ( not ( = ?auto_1639643 ?auto_1639642 ) ) ( not ( = ?auto_1639644 ?auto_1639641 ) ) ( not ( = ?auto_1639644 ?auto_1639642 ) ) ( not ( = ?auto_1639644 ?auto_1639643 ) ) ( IN-CITY ?auto_1639646 ?auto_1639645 ) ( IN-CITY ?auto_1639640 ?auto_1639645 ) ( not ( = ?auto_1639640 ?auto_1639646 ) ) ( OBJ-AT ?auto_1639641 ?auto_1639640 ) ( OBJ-AT ?auto_1639643 ?auto_1639646 ) ( TRUCK-AT ?auto_1639647 ?auto_1639640 ) ( OBJ-AT ?auto_1639642 ?auto_1639640 ) ( OBJ-AT ?auto_1639644 ?auto_1639640 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1639641 ?auto_1639643 ?auto_1639640 )
      ( DELIVER-4PKG-VERIFY ?auto_1639641 ?auto_1639642 ?auto_1639643 ?auto_1639644 ?auto_1639640 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1639755 - OBJ
      ?auto_1639756 - OBJ
      ?auto_1639757 - OBJ
      ?auto_1639758 - OBJ
      ?auto_1639754 - LOCATION
    )
    :vars
    (
      ?auto_1639760 - LOCATION
      ?auto_1639759 - CITY
      ?auto_1639761 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1639756 ?auto_1639755 ) ) ( not ( = ?auto_1639757 ?auto_1639755 ) ) ( not ( = ?auto_1639757 ?auto_1639756 ) ) ( not ( = ?auto_1639758 ?auto_1639755 ) ) ( not ( = ?auto_1639758 ?auto_1639756 ) ) ( not ( = ?auto_1639758 ?auto_1639757 ) ) ( IN-CITY ?auto_1639760 ?auto_1639759 ) ( IN-CITY ?auto_1639754 ?auto_1639759 ) ( not ( = ?auto_1639754 ?auto_1639760 ) ) ( OBJ-AT ?auto_1639755 ?auto_1639754 ) ( OBJ-AT ?auto_1639756 ?auto_1639760 ) ( TRUCK-AT ?auto_1639761 ?auto_1639754 ) ( OBJ-AT ?auto_1639757 ?auto_1639754 ) ( OBJ-AT ?auto_1639758 ?auto_1639754 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1639755 ?auto_1639756 ?auto_1639754 )
      ( DELIVER-4PKG-VERIFY ?auto_1639755 ?auto_1639756 ?auto_1639757 ?auto_1639758 ?auto_1639754 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1640474 - OBJ
      ?auto_1640475 - OBJ
      ?auto_1640476 - OBJ
      ?auto_1640477 - OBJ
      ?auto_1640473 - LOCATION
    )
    :vars
    (
      ?auto_1640479 - LOCATION
      ?auto_1640478 - CITY
      ?auto_1640480 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1640475 ?auto_1640474 ) ) ( not ( = ?auto_1640476 ?auto_1640474 ) ) ( not ( = ?auto_1640476 ?auto_1640475 ) ) ( not ( = ?auto_1640477 ?auto_1640474 ) ) ( not ( = ?auto_1640477 ?auto_1640475 ) ) ( not ( = ?auto_1640477 ?auto_1640476 ) ) ( IN-CITY ?auto_1640479 ?auto_1640478 ) ( IN-CITY ?auto_1640473 ?auto_1640478 ) ( not ( = ?auto_1640473 ?auto_1640479 ) ) ( OBJ-AT ?auto_1640475 ?auto_1640473 ) ( OBJ-AT ?auto_1640474 ?auto_1640479 ) ( TRUCK-AT ?auto_1640480 ?auto_1640473 ) ( OBJ-AT ?auto_1640476 ?auto_1640473 ) ( OBJ-AT ?auto_1640477 ?auto_1640473 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1640475 ?auto_1640474 ?auto_1640473 )
      ( DELIVER-4PKG-VERIFY ?auto_1640474 ?auto_1640475 ?auto_1640476 ?auto_1640477 ?auto_1640473 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1777821 - OBJ
      ?auto_1777822 - OBJ
      ?auto_1777823 - OBJ
      ?auto_1777824 - OBJ
      ?auto_1777825 - OBJ
      ?auto_1777820 - LOCATION
    )
    :vars
    (
      ?auto_1777826 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1777822 ?auto_1777821 ) ) ( not ( = ?auto_1777823 ?auto_1777821 ) ) ( not ( = ?auto_1777823 ?auto_1777822 ) ) ( not ( = ?auto_1777824 ?auto_1777821 ) ) ( not ( = ?auto_1777824 ?auto_1777822 ) ) ( not ( = ?auto_1777824 ?auto_1777823 ) ) ( not ( = ?auto_1777825 ?auto_1777821 ) ) ( not ( = ?auto_1777825 ?auto_1777822 ) ) ( not ( = ?auto_1777825 ?auto_1777823 ) ) ( not ( = ?auto_1777825 ?auto_1777824 ) ) ( TRUCK-AT ?auto_1777826 ?auto_1777820 ) ( IN-TRUCK ?auto_1777825 ?auto_1777826 ) ( OBJ-AT ?auto_1777821 ?auto_1777820 ) ( OBJ-AT ?auto_1777822 ?auto_1777820 ) ( OBJ-AT ?auto_1777823 ?auto_1777820 ) ( OBJ-AT ?auto_1777824 ?auto_1777820 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1777825 ?auto_1777820 )
      ( DELIVER-5PKG-VERIFY ?auto_1777821 ?auto_1777822 ?auto_1777823 ?auto_1777824 ?auto_1777825 ?auto_1777820 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1777849 - OBJ
      ?auto_1777850 - OBJ
      ?auto_1777851 - OBJ
      ?auto_1777852 - OBJ
      ?auto_1777853 - OBJ
      ?auto_1777848 - LOCATION
    )
    :vars
    (
      ?auto_1777854 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1777850 ?auto_1777849 ) ) ( not ( = ?auto_1777851 ?auto_1777849 ) ) ( not ( = ?auto_1777851 ?auto_1777850 ) ) ( not ( = ?auto_1777852 ?auto_1777849 ) ) ( not ( = ?auto_1777852 ?auto_1777850 ) ) ( not ( = ?auto_1777852 ?auto_1777851 ) ) ( not ( = ?auto_1777853 ?auto_1777849 ) ) ( not ( = ?auto_1777853 ?auto_1777850 ) ) ( not ( = ?auto_1777853 ?auto_1777851 ) ) ( not ( = ?auto_1777853 ?auto_1777852 ) ) ( TRUCK-AT ?auto_1777854 ?auto_1777848 ) ( IN-TRUCK ?auto_1777852 ?auto_1777854 ) ( OBJ-AT ?auto_1777849 ?auto_1777848 ) ( OBJ-AT ?auto_1777850 ?auto_1777848 ) ( OBJ-AT ?auto_1777851 ?auto_1777848 ) ( OBJ-AT ?auto_1777853 ?auto_1777848 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1777852 ?auto_1777848 )
      ( DELIVER-5PKG-VERIFY ?auto_1777849 ?auto_1777850 ?auto_1777851 ?auto_1777852 ?auto_1777853 ?auto_1777848 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1778015 - OBJ
      ?auto_1778016 - OBJ
      ?auto_1778017 - OBJ
      ?auto_1778018 - OBJ
      ?auto_1778019 - OBJ
      ?auto_1778014 - LOCATION
    )
    :vars
    (
      ?auto_1778020 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1778016 ?auto_1778015 ) ) ( not ( = ?auto_1778017 ?auto_1778015 ) ) ( not ( = ?auto_1778017 ?auto_1778016 ) ) ( not ( = ?auto_1778018 ?auto_1778015 ) ) ( not ( = ?auto_1778018 ?auto_1778016 ) ) ( not ( = ?auto_1778018 ?auto_1778017 ) ) ( not ( = ?auto_1778019 ?auto_1778015 ) ) ( not ( = ?auto_1778019 ?auto_1778016 ) ) ( not ( = ?auto_1778019 ?auto_1778017 ) ) ( not ( = ?auto_1778019 ?auto_1778018 ) ) ( TRUCK-AT ?auto_1778020 ?auto_1778014 ) ( IN-TRUCK ?auto_1778017 ?auto_1778020 ) ( OBJ-AT ?auto_1778015 ?auto_1778014 ) ( OBJ-AT ?auto_1778016 ?auto_1778014 ) ( OBJ-AT ?auto_1778018 ?auto_1778014 ) ( OBJ-AT ?auto_1778019 ?auto_1778014 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1778017 ?auto_1778014 )
      ( DELIVER-5PKG-VERIFY ?auto_1778015 ?auto_1778016 ?auto_1778017 ?auto_1778018 ?auto_1778019 ?auto_1778014 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1779206 - OBJ
      ?auto_1779207 - OBJ
      ?auto_1779208 - OBJ
      ?auto_1779209 - OBJ
      ?auto_1779210 - OBJ
      ?auto_1779205 - LOCATION
    )
    :vars
    (
      ?auto_1779211 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1779207 ?auto_1779206 ) ) ( not ( = ?auto_1779208 ?auto_1779206 ) ) ( not ( = ?auto_1779208 ?auto_1779207 ) ) ( not ( = ?auto_1779209 ?auto_1779206 ) ) ( not ( = ?auto_1779209 ?auto_1779207 ) ) ( not ( = ?auto_1779209 ?auto_1779208 ) ) ( not ( = ?auto_1779210 ?auto_1779206 ) ) ( not ( = ?auto_1779210 ?auto_1779207 ) ) ( not ( = ?auto_1779210 ?auto_1779208 ) ) ( not ( = ?auto_1779210 ?auto_1779209 ) ) ( TRUCK-AT ?auto_1779211 ?auto_1779205 ) ( IN-TRUCK ?auto_1779207 ?auto_1779211 ) ( OBJ-AT ?auto_1779206 ?auto_1779205 ) ( OBJ-AT ?auto_1779208 ?auto_1779205 ) ( OBJ-AT ?auto_1779209 ?auto_1779205 ) ( OBJ-AT ?auto_1779210 ?auto_1779205 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1779207 ?auto_1779205 )
      ( DELIVER-5PKG-VERIFY ?auto_1779206 ?auto_1779207 ?auto_1779208 ?auto_1779209 ?auto_1779210 ?auto_1779205 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1787753 - OBJ
      ?auto_1787754 - OBJ
      ?auto_1787755 - OBJ
      ?auto_1787756 - OBJ
      ?auto_1787757 - OBJ
      ?auto_1787752 - LOCATION
    )
    :vars
    (
      ?auto_1787758 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1787754 ?auto_1787753 ) ) ( not ( = ?auto_1787755 ?auto_1787753 ) ) ( not ( = ?auto_1787755 ?auto_1787754 ) ) ( not ( = ?auto_1787756 ?auto_1787753 ) ) ( not ( = ?auto_1787756 ?auto_1787754 ) ) ( not ( = ?auto_1787756 ?auto_1787755 ) ) ( not ( = ?auto_1787757 ?auto_1787753 ) ) ( not ( = ?auto_1787757 ?auto_1787754 ) ) ( not ( = ?auto_1787757 ?auto_1787755 ) ) ( not ( = ?auto_1787757 ?auto_1787756 ) ) ( TRUCK-AT ?auto_1787758 ?auto_1787752 ) ( IN-TRUCK ?auto_1787753 ?auto_1787758 ) ( OBJ-AT ?auto_1787754 ?auto_1787752 ) ( OBJ-AT ?auto_1787755 ?auto_1787752 ) ( OBJ-AT ?auto_1787756 ?auto_1787752 ) ( OBJ-AT ?auto_1787757 ?auto_1787752 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1787753 ?auto_1787752 )
      ( DELIVER-5PKG-VERIFY ?auto_1787753 ?auto_1787754 ?auto_1787755 ?auto_1787756 ?auto_1787757 ?auto_1787752 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1795793 - OBJ
      ?auto_1795794 - OBJ
      ?auto_1795795 - OBJ
      ?auto_1795796 - OBJ
      ?auto_1795797 - OBJ
      ?auto_1795792 - LOCATION
    )
    :vars
    (
      ?auto_1795798 - TRUCK
      ?auto_1795799 - LOCATION
      ?auto_1795800 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1795794 ?auto_1795793 ) ) ( not ( = ?auto_1795795 ?auto_1795793 ) ) ( not ( = ?auto_1795795 ?auto_1795794 ) ) ( not ( = ?auto_1795796 ?auto_1795793 ) ) ( not ( = ?auto_1795796 ?auto_1795794 ) ) ( not ( = ?auto_1795796 ?auto_1795795 ) ) ( not ( = ?auto_1795797 ?auto_1795793 ) ) ( not ( = ?auto_1795797 ?auto_1795794 ) ) ( not ( = ?auto_1795797 ?auto_1795795 ) ) ( not ( = ?auto_1795797 ?auto_1795796 ) ) ( IN-TRUCK ?auto_1795797 ?auto_1795798 ) ( TRUCK-AT ?auto_1795798 ?auto_1795799 ) ( IN-CITY ?auto_1795799 ?auto_1795800 ) ( IN-CITY ?auto_1795792 ?auto_1795800 ) ( not ( = ?auto_1795792 ?auto_1795799 ) ) ( OBJ-AT ?auto_1795793 ?auto_1795792 ) ( OBJ-AT ?auto_1795794 ?auto_1795792 ) ( OBJ-AT ?auto_1795795 ?auto_1795792 ) ( OBJ-AT ?auto_1795796 ?auto_1795792 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1795793 ?auto_1795797 ?auto_1795792 )
      ( DELIVER-5PKG-VERIFY ?auto_1795793 ?auto_1795794 ?auto_1795795 ?auto_1795796 ?auto_1795797 ?auto_1795792 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1795829 - OBJ
      ?auto_1795830 - OBJ
      ?auto_1795831 - OBJ
      ?auto_1795832 - OBJ
      ?auto_1795833 - OBJ
      ?auto_1795828 - LOCATION
    )
    :vars
    (
      ?auto_1795834 - TRUCK
      ?auto_1795835 - LOCATION
      ?auto_1795836 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1795830 ?auto_1795829 ) ) ( not ( = ?auto_1795831 ?auto_1795829 ) ) ( not ( = ?auto_1795831 ?auto_1795830 ) ) ( not ( = ?auto_1795832 ?auto_1795829 ) ) ( not ( = ?auto_1795832 ?auto_1795830 ) ) ( not ( = ?auto_1795832 ?auto_1795831 ) ) ( not ( = ?auto_1795833 ?auto_1795829 ) ) ( not ( = ?auto_1795833 ?auto_1795830 ) ) ( not ( = ?auto_1795833 ?auto_1795831 ) ) ( not ( = ?auto_1795833 ?auto_1795832 ) ) ( IN-TRUCK ?auto_1795832 ?auto_1795834 ) ( TRUCK-AT ?auto_1795834 ?auto_1795835 ) ( IN-CITY ?auto_1795835 ?auto_1795836 ) ( IN-CITY ?auto_1795828 ?auto_1795836 ) ( not ( = ?auto_1795828 ?auto_1795835 ) ) ( OBJ-AT ?auto_1795829 ?auto_1795828 ) ( OBJ-AT ?auto_1795830 ?auto_1795828 ) ( OBJ-AT ?auto_1795831 ?auto_1795828 ) ( OBJ-AT ?auto_1795833 ?auto_1795828 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1795829 ?auto_1795832 ?auto_1795828 )
      ( DELIVER-5PKG-VERIFY ?auto_1795829 ?auto_1795830 ?auto_1795831 ?auto_1795832 ?auto_1795833 ?auto_1795828 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1796039 - OBJ
      ?auto_1796040 - OBJ
      ?auto_1796041 - OBJ
      ?auto_1796042 - OBJ
      ?auto_1796043 - OBJ
      ?auto_1796038 - LOCATION
    )
    :vars
    (
      ?auto_1796044 - TRUCK
      ?auto_1796045 - LOCATION
      ?auto_1796046 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1796040 ?auto_1796039 ) ) ( not ( = ?auto_1796041 ?auto_1796039 ) ) ( not ( = ?auto_1796041 ?auto_1796040 ) ) ( not ( = ?auto_1796042 ?auto_1796039 ) ) ( not ( = ?auto_1796042 ?auto_1796040 ) ) ( not ( = ?auto_1796042 ?auto_1796041 ) ) ( not ( = ?auto_1796043 ?auto_1796039 ) ) ( not ( = ?auto_1796043 ?auto_1796040 ) ) ( not ( = ?auto_1796043 ?auto_1796041 ) ) ( not ( = ?auto_1796043 ?auto_1796042 ) ) ( IN-TRUCK ?auto_1796041 ?auto_1796044 ) ( TRUCK-AT ?auto_1796044 ?auto_1796045 ) ( IN-CITY ?auto_1796045 ?auto_1796046 ) ( IN-CITY ?auto_1796038 ?auto_1796046 ) ( not ( = ?auto_1796038 ?auto_1796045 ) ) ( OBJ-AT ?auto_1796039 ?auto_1796038 ) ( OBJ-AT ?auto_1796040 ?auto_1796038 ) ( OBJ-AT ?auto_1796042 ?auto_1796038 ) ( OBJ-AT ?auto_1796043 ?auto_1796038 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1796039 ?auto_1796041 ?auto_1796038 )
      ( DELIVER-5PKG-VERIFY ?auto_1796039 ?auto_1796040 ?auto_1796041 ?auto_1796042 ?auto_1796043 ?auto_1796038 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1797548 - OBJ
      ?auto_1797549 - OBJ
      ?auto_1797550 - OBJ
      ?auto_1797551 - OBJ
      ?auto_1797552 - OBJ
      ?auto_1797547 - LOCATION
    )
    :vars
    (
      ?auto_1797553 - TRUCK
      ?auto_1797554 - LOCATION
      ?auto_1797555 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1797549 ?auto_1797548 ) ) ( not ( = ?auto_1797550 ?auto_1797548 ) ) ( not ( = ?auto_1797550 ?auto_1797549 ) ) ( not ( = ?auto_1797551 ?auto_1797548 ) ) ( not ( = ?auto_1797551 ?auto_1797549 ) ) ( not ( = ?auto_1797551 ?auto_1797550 ) ) ( not ( = ?auto_1797552 ?auto_1797548 ) ) ( not ( = ?auto_1797552 ?auto_1797549 ) ) ( not ( = ?auto_1797552 ?auto_1797550 ) ) ( not ( = ?auto_1797552 ?auto_1797551 ) ) ( IN-TRUCK ?auto_1797549 ?auto_1797553 ) ( TRUCK-AT ?auto_1797553 ?auto_1797554 ) ( IN-CITY ?auto_1797554 ?auto_1797555 ) ( IN-CITY ?auto_1797547 ?auto_1797555 ) ( not ( = ?auto_1797547 ?auto_1797554 ) ) ( OBJ-AT ?auto_1797548 ?auto_1797547 ) ( OBJ-AT ?auto_1797550 ?auto_1797547 ) ( OBJ-AT ?auto_1797551 ?auto_1797547 ) ( OBJ-AT ?auto_1797552 ?auto_1797547 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1797548 ?auto_1797549 ?auto_1797547 )
      ( DELIVER-5PKG-VERIFY ?auto_1797548 ?auto_1797549 ?auto_1797550 ?auto_1797551 ?auto_1797552 ?auto_1797547 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1808930 - OBJ
      ?auto_1808931 - OBJ
      ?auto_1808932 - OBJ
      ?auto_1808933 - OBJ
      ?auto_1808934 - OBJ
      ?auto_1808929 - LOCATION
    )
    :vars
    (
      ?auto_1808935 - TRUCK
      ?auto_1808936 - LOCATION
      ?auto_1808937 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1808931 ?auto_1808930 ) ) ( not ( = ?auto_1808932 ?auto_1808930 ) ) ( not ( = ?auto_1808932 ?auto_1808931 ) ) ( not ( = ?auto_1808933 ?auto_1808930 ) ) ( not ( = ?auto_1808933 ?auto_1808931 ) ) ( not ( = ?auto_1808933 ?auto_1808932 ) ) ( not ( = ?auto_1808934 ?auto_1808930 ) ) ( not ( = ?auto_1808934 ?auto_1808931 ) ) ( not ( = ?auto_1808934 ?auto_1808932 ) ) ( not ( = ?auto_1808934 ?auto_1808933 ) ) ( IN-TRUCK ?auto_1808930 ?auto_1808935 ) ( TRUCK-AT ?auto_1808935 ?auto_1808936 ) ( IN-CITY ?auto_1808936 ?auto_1808937 ) ( IN-CITY ?auto_1808929 ?auto_1808937 ) ( not ( = ?auto_1808929 ?auto_1808936 ) ) ( OBJ-AT ?auto_1808931 ?auto_1808929 ) ( OBJ-AT ?auto_1808932 ?auto_1808929 ) ( OBJ-AT ?auto_1808933 ?auto_1808929 ) ( OBJ-AT ?auto_1808934 ?auto_1808929 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1808931 ?auto_1808930 ?auto_1808929 )
      ( DELIVER-5PKG-VERIFY ?auto_1808930 ?auto_1808931 ?auto_1808932 ?auto_1808933 ?auto_1808934 ?auto_1808929 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1818355 - OBJ
      ?auto_1818356 - OBJ
      ?auto_1818357 - OBJ
      ?auto_1818358 - OBJ
      ?auto_1818359 - OBJ
      ?auto_1818354 - LOCATION
    )
    :vars
    (
      ?auto_1818360 - TRUCK
      ?auto_1818361 - LOCATION
      ?auto_1818362 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1818356 ?auto_1818355 ) ) ( not ( = ?auto_1818357 ?auto_1818355 ) ) ( not ( = ?auto_1818357 ?auto_1818356 ) ) ( not ( = ?auto_1818358 ?auto_1818355 ) ) ( not ( = ?auto_1818358 ?auto_1818356 ) ) ( not ( = ?auto_1818358 ?auto_1818357 ) ) ( not ( = ?auto_1818359 ?auto_1818355 ) ) ( not ( = ?auto_1818359 ?auto_1818356 ) ) ( not ( = ?auto_1818359 ?auto_1818357 ) ) ( not ( = ?auto_1818359 ?auto_1818358 ) ) ( TRUCK-AT ?auto_1818360 ?auto_1818361 ) ( IN-CITY ?auto_1818361 ?auto_1818362 ) ( IN-CITY ?auto_1818354 ?auto_1818362 ) ( not ( = ?auto_1818354 ?auto_1818361 ) ) ( OBJ-AT ?auto_1818355 ?auto_1818354 ) ( OBJ-AT ?auto_1818359 ?auto_1818361 ) ( OBJ-AT ?auto_1818356 ?auto_1818354 ) ( OBJ-AT ?auto_1818357 ?auto_1818354 ) ( OBJ-AT ?auto_1818358 ?auto_1818354 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1818355 ?auto_1818359 ?auto_1818354 )
      ( DELIVER-5PKG-VERIFY ?auto_1818355 ?auto_1818356 ?auto_1818357 ?auto_1818358 ?auto_1818359 ?auto_1818354 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1818391 - OBJ
      ?auto_1818392 - OBJ
      ?auto_1818393 - OBJ
      ?auto_1818394 - OBJ
      ?auto_1818395 - OBJ
      ?auto_1818390 - LOCATION
    )
    :vars
    (
      ?auto_1818396 - TRUCK
      ?auto_1818397 - LOCATION
      ?auto_1818398 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1818392 ?auto_1818391 ) ) ( not ( = ?auto_1818393 ?auto_1818391 ) ) ( not ( = ?auto_1818393 ?auto_1818392 ) ) ( not ( = ?auto_1818394 ?auto_1818391 ) ) ( not ( = ?auto_1818394 ?auto_1818392 ) ) ( not ( = ?auto_1818394 ?auto_1818393 ) ) ( not ( = ?auto_1818395 ?auto_1818391 ) ) ( not ( = ?auto_1818395 ?auto_1818392 ) ) ( not ( = ?auto_1818395 ?auto_1818393 ) ) ( not ( = ?auto_1818395 ?auto_1818394 ) ) ( TRUCK-AT ?auto_1818396 ?auto_1818397 ) ( IN-CITY ?auto_1818397 ?auto_1818398 ) ( IN-CITY ?auto_1818390 ?auto_1818398 ) ( not ( = ?auto_1818390 ?auto_1818397 ) ) ( OBJ-AT ?auto_1818391 ?auto_1818390 ) ( OBJ-AT ?auto_1818394 ?auto_1818397 ) ( OBJ-AT ?auto_1818392 ?auto_1818390 ) ( OBJ-AT ?auto_1818393 ?auto_1818390 ) ( OBJ-AT ?auto_1818395 ?auto_1818390 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1818391 ?auto_1818394 ?auto_1818390 )
      ( DELIVER-5PKG-VERIFY ?auto_1818391 ?auto_1818392 ?auto_1818393 ?auto_1818394 ?auto_1818395 ?auto_1818390 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1818601 - OBJ
      ?auto_1818602 - OBJ
      ?auto_1818603 - OBJ
      ?auto_1818604 - OBJ
      ?auto_1818605 - OBJ
      ?auto_1818600 - LOCATION
    )
    :vars
    (
      ?auto_1818606 - TRUCK
      ?auto_1818607 - LOCATION
      ?auto_1818608 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1818602 ?auto_1818601 ) ) ( not ( = ?auto_1818603 ?auto_1818601 ) ) ( not ( = ?auto_1818603 ?auto_1818602 ) ) ( not ( = ?auto_1818604 ?auto_1818601 ) ) ( not ( = ?auto_1818604 ?auto_1818602 ) ) ( not ( = ?auto_1818604 ?auto_1818603 ) ) ( not ( = ?auto_1818605 ?auto_1818601 ) ) ( not ( = ?auto_1818605 ?auto_1818602 ) ) ( not ( = ?auto_1818605 ?auto_1818603 ) ) ( not ( = ?auto_1818605 ?auto_1818604 ) ) ( TRUCK-AT ?auto_1818606 ?auto_1818607 ) ( IN-CITY ?auto_1818607 ?auto_1818608 ) ( IN-CITY ?auto_1818600 ?auto_1818608 ) ( not ( = ?auto_1818600 ?auto_1818607 ) ) ( OBJ-AT ?auto_1818601 ?auto_1818600 ) ( OBJ-AT ?auto_1818603 ?auto_1818607 ) ( OBJ-AT ?auto_1818602 ?auto_1818600 ) ( OBJ-AT ?auto_1818604 ?auto_1818600 ) ( OBJ-AT ?auto_1818605 ?auto_1818600 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1818601 ?auto_1818603 ?auto_1818600 )
      ( DELIVER-5PKG-VERIFY ?auto_1818601 ?auto_1818602 ?auto_1818603 ?auto_1818604 ?auto_1818605 ?auto_1818600 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1820110 - OBJ
      ?auto_1820111 - OBJ
      ?auto_1820112 - OBJ
      ?auto_1820113 - OBJ
      ?auto_1820114 - OBJ
      ?auto_1820109 - LOCATION
    )
    :vars
    (
      ?auto_1820115 - TRUCK
      ?auto_1820116 - LOCATION
      ?auto_1820117 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1820111 ?auto_1820110 ) ) ( not ( = ?auto_1820112 ?auto_1820110 ) ) ( not ( = ?auto_1820112 ?auto_1820111 ) ) ( not ( = ?auto_1820113 ?auto_1820110 ) ) ( not ( = ?auto_1820113 ?auto_1820111 ) ) ( not ( = ?auto_1820113 ?auto_1820112 ) ) ( not ( = ?auto_1820114 ?auto_1820110 ) ) ( not ( = ?auto_1820114 ?auto_1820111 ) ) ( not ( = ?auto_1820114 ?auto_1820112 ) ) ( not ( = ?auto_1820114 ?auto_1820113 ) ) ( TRUCK-AT ?auto_1820115 ?auto_1820116 ) ( IN-CITY ?auto_1820116 ?auto_1820117 ) ( IN-CITY ?auto_1820109 ?auto_1820117 ) ( not ( = ?auto_1820109 ?auto_1820116 ) ) ( OBJ-AT ?auto_1820110 ?auto_1820109 ) ( OBJ-AT ?auto_1820111 ?auto_1820116 ) ( OBJ-AT ?auto_1820112 ?auto_1820109 ) ( OBJ-AT ?auto_1820113 ?auto_1820109 ) ( OBJ-AT ?auto_1820114 ?auto_1820109 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1820110 ?auto_1820111 ?auto_1820109 )
      ( DELIVER-5PKG-VERIFY ?auto_1820110 ?auto_1820111 ?auto_1820112 ?auto_1820113 ?auto_1820114 ?auto_1820109 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1831492 - OBJ
      ?auto_1831493 - OBJ
      ?auto_1831494 - OBJ
      ?auto_1831495 - OBJ
      ?auto_1831496 - OBJ
      ?auto_1831491 - LOCATION
    )
    :vars
    (
      ?auto_1831497 - TRUCK
      ?auto_1831498 - LOCATION
      ?auto_1831499 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1831493 ?auto_1831492 ) ) ( not ( = ?auto_1831494 ?auto_1831492 ) ) ( not ( = ?auto_1831494 ?auto_1831493 ) ) ( not ( = ?auto_1831495 ?auto_1831492 ) ) ( not ( = ?auto_1831495 ?auto_1831493 ) ) ( not ( = ?auto_1831495 ?auto_1831494 ) ) ( not ( = ?auto_1831496 ?auto_1831492 ) ) ( not ( = ?auto_1831496 ?auto_1831493 ) ) ( not ( = ?auto_1831496 ?auto_1831494 ) ) ( not ( = ?auto_1831496 ?auto_1831495 ) ) ( TRUCK-AT ?auto_1831497 ?auto_1831498 ) ( IN-CITY ?auto_1831498 ?auto_1831499 ) ( IN-CITY ?auto_1831491 ?auto_1831499 ) ( not ( = ?auto_1831491 ?auto_1831498 ) ) ( OBJ-AT ?auto_1831493 ?auto_1831491 ) ( OBJ-AT ?auto_1831492 ?auto_1831498 ) ( OBJ-AT ?auto_1831494 ?auto_1831491 ) ( OBJ-AT ?auto_1831495 ?auto_1831491 ) ( OBJ-AT ?auto_1831496 ?auto_1831491 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1831493 ?auto_1831492 ?auto_1831491 )
      ( DELIVER-5PKG-VERIFY ?auto_1831492 ?auto_1831493 ?auto_1831494 ?auto_1831495 ?auto_1831496 ?auto_1831491 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1840917 - OBJ
      ?auto_1840918 - OBJ
      ?auto_1840919 - OBJ
      ?auto_1840920 - OBJ
      ?auto_1840921 - OBJ
      ?auto_1840916 - LOCATION
    )
    :vars
    (
      ?auto_1840923 - LOCATION
      ?auto_1840924 - CITY
      ?auto_1840922 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1840918 ?auto_1840917 ) ) ( not ( = ?auto_1840919 ?auto_1840917 ) ) ( not ( = ?auto_1840919 ?auto_1840918 ) ) ( not ( = ?auto_1840920 ?auto_1840917 ) ) ( not ( = ?auto_1840920 ?auto_1840918 ) ) ( not ( = ?auto_1840920 ?auto_1840919 ) ) ( not ( = ?auto_1840921 ?auto_1840917 ) ) ( not ( = ?auto_1840921 ?auto_1840918 ) ) ( not ( = ?auto_1840921 ?auto_1840919 ) ) ( not ( = ?auto_1840921 ?auto_1840920 ) ) ( IN-CITY ?auto_1840923 ?auto_1840924 ) ( IN-CITY ?auto_1840916 ?auto_1840924 ) ( not ( = ?auto_1840916 ?auto_1840923 ) ) ( OBJ-AT ?auto_1840917 ?auto_1840916 ) ( OBJ-AT ?auto_1840921 ?auto_1840923 ) ( TRUCK-AT ?auto_1840922 ?auto_1840916 ) ( OBJ-AT ?auto_1840918 ?auto_1840916 ) ( OBJ-AT ?auto_1840919 ?auto_1840916 ) ( OBJ-AT ?auto_1840920 ?auto_1840916 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1840917 ?auto_1840921 ?auto_1840916 )
      ( DELIVER-5PKG-VERIFY ?auto_1840917 ?auto_1840918 ?auto_1840919 ?auto_1840920 ?auto_1840921 ?auto_1840916 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1840953 - OBJ
      ?auto_1840954 - OBJ
      ?auto_1840955 - OBJ
      ?auto_1840956 - OBJ
      ?auto_1840957 - OBJ
      ?auto_1840952 - LOCATION
    )
    :vars
    (
      ?auto_1840959 - LOCATION
      ?auto_1840960 - CITY
      ?auto_1840958 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1840954 ?auto_1840953 ) ) ( not ( = ?auto_1840955 ?auto_1840953 ) ) ( not ( = ?auto_1840955 ?auto_1840954 ) ) ( not ( = ?auto_1840956 ?auto_1840953 ) ) ( not ( = ?auto_1840956 ?auto_1840954 ) ) ( not ( = ?auto_1840956 ?auto_1840955 ) ) ( not ( = ?auto_1840957 ?auto_1840953 ) ) ( not ( = ?auto_1840957 ?auto_1840954 ) ) ( not ( = ?auto_1840957 ?auto_1840955 ) ) ( not ( = ?auto_1840957 ?auto_1840956 ) ) ( IN-CITY ?auto_1840959 ?auto_1840960 ) ( IN-CITY ?auto_1840952 ?auto_1840960 ) ( not ( = ?auto_1840952 ?auto_1840959 ) ) ( OBJ-AT ?auto_1840953 ?auto_1840952 ) ( OBJ-AT ?auto_1840956 ?auto_1840959 ) ( TRUCK-AT ?auto_1840958 ?auto_1840952 ) ( OBJ-AT ?auto_1840954 ?auto_1840952 ) ( OBJ-AT ?auto_1840955 ?auto_1840952 ) ( OBJ-AT ?auto_1840957 ?auto_1840952 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1840953 ?auto_1840956 ?auto_1840952 )
      ( DELIVER-5PKG-VERIFY ?auto_1840953 ?auto_1840954 ?auto_1840955 ?auto_1840956 ?auto_1840957 ?auto_1840952 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1841163 - OBJ
      ?auto_1841164 - OBJ
      ?auto_1841165 - OBJ
      ?auto_1841166 - OBJ
      ?auto_1841167 - OBJ
      ?auto_1841162 - LOCATION
    )
    :vars
    (
      ?auto_1841169 - LOCATION
      ?auto_1841170 - CITY
      ?auto_1841168 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1841164 ?auto_1841163 ) ) ( not ( = ?auto_1841165 ?auto_1841163 ) ) ( not ( = ?auto_1841165 ?auto_1841164 ) ) ( not ( = ?auto_1841166 ?auto_1841163 ) ) ( not ( = ?auto_1841166 ?auto_1841164 ) ) ( not ( = ?auto_1841166 ?auto_1841165 ) ) ( not ( = ?auto_1841167 ?auto_1841163 ) ) ( not ( = ?auto_1841167 ?auto_1841164 ) ) ( not ( = ?auto_1841167 ?auto_1841165 ) ) ( not ( = ?auto_1841167 ?auto_1841166 ) ) ( IN-CITY ?auto_1841169 ?auto_1841170 ) ( IN-CITY ?auto_1841162 ?auto_1841170 ) ( not ( = ?auto_1841162 ?auto_1841169 ) ) ( OBJ-AT ?auto_1841163 ?auto_1841162 ) ( OBJ-AT ?auto_1841165 ?auto_1841169 ) ( TRUCK-AT ?auto_1841168 ?auto_1841162 ) ( OBJ-AT ?auto_1841164 ?auto_1841162 ) ( OBJ-AT ?auto_1841166 ?auto_1841162 ) ( OBJ-AT ?auto_1841167 ?auto_1841162 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1841163 ?auto_1841165 ?auto_1841162 )
      ( DELIVER-5PKG-VERIFY ?auto_1841163 ?auto_1841164 ?auto_1841165 ?auto_1841166 ?auto_1841167 ?auto_1841162 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1842672 - OBJ
      ?auto_1842673 - OBJ
      ?auto_1842674 - OBJ
      ?auto_1842675 - OBJ
      ?auto_1842676 - OBJ
      ?auto_1842671 - LOCATION
    )
    :vars
    (
      ?auto_1842678 - LOCATION
      ?auto_1842679 - CITY
      ?auto_1842677 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1842673 ?auto_1842672 ) ) ( not ( = ?auto_1842674 ?auto_1842672 ) ) ( not ( = ?auto_1842674 ?auto_1842673 ) ) ( not ( = ?auto_1842675 ?auto_1842672 ) ) ( not ( = ?auto_1842675 ?auto_1842673 ) ) ( not ( = ?auto_1842675 ?auto_1842674 ) ) ( not ( = ?auto_1842676 ?auto_1842672 ) ) ( not ( = ?auto_1842676 ?auto_1842673 ) ) ( not ( = ?auto_1842676 ?auto_1842674 ) ) ( not ( = ?auto_1842676 ?auto_1842675 ) ) ( IN-CITY ?auto_1842678 ?auto_1842679 ) ( IN-CITY ?auto_1842671 ?auto_1842679 ) ( not ( = ?auto_1842671 ?auto_1842678 ) ) ( OBJ-AT ?auto_1842672 ?auto_1842671 ) ( OBJ-AT ?auto_1842673 ?auto_1842678 ) ( TRUCK-AT ?auto_1842677 ?auto_1842671 ) ( OBJ-AT ?auto_1842674 ?auto_1842671 ) ( OBJ-AT ?auto_1842675 ?auto_1842671 ) ( OBJ-AT ?auto_1842676 ?auto_1842671 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1842672 ?auto_1842673 ?auto_1842671 )
      ( DELIVER-5PKG-VERIFY ?auto_1842672 ?auto_1842673 ?auto_1842674 ?auto_1842675 ?auto_1842676 ?auto_1842671 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1854054 - OBJ
      ?auto_1854055 - OBJ
      ?auto_1854056 - OBJ
      ?auto_1854057 - OBJ
      ?auto_1854058 - OBJ
      ?auto_1854053 - LOCATION
    )
    :vars
    (
      ?auto_1854060 - LOCATION
      ?auto_1854061 - CITY
      ?auto_1854059 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1854055 ?auto_1854054 ) ) ( not ( = ?auto_1854056 ?auto_1854054 ) ) ( not ( = ?auto_1854056 ?auto_1854055 ) ) ( not ( = ?auto_1854057 ?auto_1854054 ) ) ( not ( = ?auto_1854057 ?auto_1854055 ) ) ( not ( = ?auto_1854057 ?auto_1854056 ) ) ( not ( = ?auto_1854058 ?auto_1854054 ) ) ( not ( = ?auto_1854058 ?auto_1854055 ) ) ( not ( = ?auto_1854058 ?auto_1854056 ) ) ( not ( = ?auto_1854058 ?auto_1854057 ) ) ( IN-CITY ?auto_1854060 ?auto_1854061 ) ( IN-CITY ?auto_1854053 ?auto_1854061 ) ( not ( = ?auto_1854053 ?auto_1854060 ) ) ( OBJ-AT ?auto_1854055 ?auto_1854053 ) ( OBJ-AT ?auto_1854054 ?auto_1854060 ) ( TRUCK-AT ?auto_1854059 ?auto_1854053 ) ( OBJ-AT ?auto_1854056 ?auto_1854053 ) ( OBJ-AT ?auto_1854057 ?auto_1854053 ) ( OBJ-AT ?auto_1854058 ?auto_1854053 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1854055 ?auto_1854054 ?auto_1854053 )
      ( DELIVER-5PKG-VERIFY ?auto_1854054 ?auto_1854055 ?auto_1854056 ?auto_1854057 ?auto_1854058 ?auto_1854053 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1882779 - OBJ
      ?auto_1882780 - OBJ
      ?auto_1882781 - OBJ
      ?auto_1882778 - LOCATION
    )
    :vars
    (
      ?auto_1882782 - LOCATION
      ?auto_1882784 - CITY
      ?auto_1882785 - TRUCK
      ?auto_1882783 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1882780 ?auto_1882779 ) ) ( not ( = ?auto_1882781 ?auto_1882779 ) ) ( not ( = ?auto_1882781 ?auto_1882780 ) ) ( IN-CITY ?auto_1882782 ?auto_1882784 ) ( IN-CITY ?auto_1882778 ?auto_1882784 ) ( not ( = ?auto_1882778 ?auto_1882782 ) ) ( OBJ-AT ?auto_1882779 ?auto_1882778 ) ( OBJ-AT ?auto_1882781 ?auto_1882782 ) ( TRUCK-AT ?auto_1882785 ?auto_1882783 ) ( IN-CITY ?auto_1882783 ?auto_1882784 ) ( not ( = ?auto_1882778 ?auto_1882783 ) ) ( not ( = ?auto_1882782 ?auto_1882783 ) ) ( OBJ-AT ?auto_1882780 ?auto_1882778 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1882779 ?auto_1882781 ?auto_1882778 )
      ( DELIVER-3PKG-VERIFY ?auto_1882779 ?auto_1882780 ?auto_1882781 ?auto_1882778 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1882807 - OBJ
      ?auto_1882808 - OBJ
      ?auto_1882809 - OBJ
      ?auto_1882806 - LOCATION
    )
    :vars
    (
      ?auto_1882810 - LOCATION
      ?auto_1882812 - CITY
      ?auto_1882813 - TRUCK
      ?auto_1882811 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1882808 ?auto_1882807 ) ) ( not ( = ?auto_1882809 ?auto_1882807 ) ) ( not ( = ?auto_1882809 ?auto_1882808 ) ) ( IN-CITY ?auto_1882810 ?auto_1882812 ) ( IN-CITY ?auto_1882806 ?auto_1882812 ) ( not ( = ?auto_1882806 ?auto_1882810 ) ) ( OBJ-AT ?auto_1882807 ?auto_1882806 ) ( OBJ-AT ?auto_1882808 ?auto_1882810 ) ( TRUCK-AT ?auto_1882813 ?auto_1882811 ) ( IN-CITY ?auto_1882811 ?auto_1882812 ) ( not ( = ?auto_1882806 ?auto_1882811 ) ) ( not ( = ?auto_1882810 ?auto_1882811 ) ) ( OBJ-AT ?auto_1882809 ?auto_1882806 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1882807 ?auto_1882808 ?auto_1882806 )
      ( DELIVER-3PKG-VERIFY ?auto_1882807 ?auto_1882808 ?auto_1882809 ?auto_1882806 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1883044 - OBJ
      ?auto_1883045 - OBJ
      ?auto_1883046 - OBJ
      ?auto_1883043 - LOCATION
    )
    :vars
    (
      ?auto_1883047 - LOCATION
      ?auto_1883049 - CITY
      ?auto_1883050 - TRUCK
      ?auto_1883048 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1883045 ?auto_1883044 ) ) ( not ( = ?auto_1883046 ?auto_1883044 ) ) ( not ( = ?auto_1883046 ?auto_1883045 ) ) ( IN-CITY ?auto_1883047 ?auto_1883049 ) ( IN-CITY ?auto_1883043 ?auto_1883049 ) ( not ( = ?auto_1883043 ?auto_1883047 ) ) ( OBJ-AT ?auto_1883045 ?auto_1883043 ) ( OBJ-AT ?auto_1883044 ?auto_1883047 ) ( TRUCK-AT ?auto_1883050 ?auto_1883048 ) ( IN-CITY ?auto_1883048 ?auto_1883049 ) ( not ( = ?auto_1883043 ?auto_1883048 ) ) ( not ( = ?auto_1883047 ?auto_1883048 ) ) ( OBJ-AT ?auto_1883046 ?auto_1883043 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1883045 ?auto_1883044 ?auto_1883043 )
      ( DELIVER-3PKG-VERIFY ?auto_1883044 ?auto_1883045 ?auto_1883046 ?auto_1883043 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1883329 - OBJ
      ?auto_1883330 - OBJ
      ?auto_1883331 - OBJ
      ?auto_1883332 - OBJ
      ?auto_1883328 - LOCATION
    )
    :vars
    (
      ?auto_1883333 - LOCATION
      ?auto_1883335 - CITY
      ?auto_1883336 - TRUCK
      ?auto_1883334 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1883330 ?auto_1883329 ) ) ( not ( = ?auto_1883331 ?auto_1883329 ) ) ( not ( = ?auto_1883331 ?auto_1883330 ) ) ( not ( = ?auto_1883332 ?auto_1883329 ) ) ( not ( = ?auto_1883332 ?auto_1883330 ) ) ( not ( = ?auto_1883332 ?auto_1883331 ) ) ( IN-CITY ?auto_1883333 ?auto_1883335 ) ( IN-CITY ?auto_1883328 ?auto_1883335 ) ( not ( = ?auto_1883328 ?auto_1883333 ) ) ( OBJ-AT ?auto_1883329 ?auto_1883328 ) ( OBJ-AT ?auto_1883332 ?auto_1883333 ) ( TRUCK-AT ?auto_1883336 ?auto_1883334 ) ( IN-CITY ?auto_1883334 ?auto_1883335 ) ( not ( = ?auto_1883328 ?auto_1883334 ) ) ( not ( = ?auto_1883333 ?auto_1883334 ) ) ( OBJ-AT ?auto_1883330 ?auto_1883328 ) ( OBJ-AT ?auto_1883331 ?auto_1883328 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1883329 ?auto_1883332 ?auto_1883328 )
      ( DELIVER-4PKG-VERIFY ?auto_1883329 ?auto_1883330 ?auto_1883331 ?auto_1883332 ?auto_1883328 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1883365 - OBJ
      ?auto_1883366 - OBJ
      ?auto_1883367 - OBJ
      ?auto_1883368 - OBJ
      ?auto_1883364 - LOCATION
    )
    :vars
    (
      ?auto_1883369 - LOCATION
      ?auto_1883371 - CITY
      ?auto_1883372 - TRUCK
      ?auto_1883370 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1883366 ?auto_1883365 ) ) ( not ( = ?auto_1883367 ?auto_1883365 ) ) ( not ( = ?auto_1883367 ?auto_1883366 ) ) ( not ( = ?auto_1883368 ?auto_1883365 ) ) ( not ( = ?auto_1883368 ?auto_1883366 ) ) ( not ( = ?auto_1883368 ?auto_1883367 ) ) ( IN-CITY ?auto_1883369 ?auto_1883371 ) ( IN-CITY ?auto_1883364 ?auto_1883371 ) ( not ( = ?auto_1883364 ?auto_1883369 ) ) ( OBJ-AT ?auto_1883365 ?auto_1883364 ) ( OBJ-AT ?auto_1883367 ?auto_1883369 ) ( TRUCK-AT ?auto_1883372 ?auto_1883370 ) ( IN-CITY ?auto_1883370 ?auto_1883371 ) ( not ( = ?auto_1883364 ?auto_1883370 ) ) ( not ( = ?auto_1883369 ?auto_1883370 ) ) ( OBJ-AT ?auto_1883366 ?auto_1883364 ) ( OBJ-AT ?auto_1883368 ?auto_1883364 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1883365 ?auto_1883367 ?auto_1883364 )
      ( DELIVER-4PKG-VERIFY ?auto_1883365 ?auto_1883366 ?auto_1883367 ?auto_1883368 ?auto_1883364 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1883609 - OBJ
      ?auto_1883610 - OBJ
      ?auto_1883611 - OBJ
      ?auto_1883612 - OBJ
      ?auto_1883608 - LOCATION
    )
    :vars
    (
      ?auto_1883613 - LOCATION
      ?auto_1883615 - CITY
      ?auto_1883616 - TRUCK
      ?auto_1883614 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1883610 ?auto_1883609 ) ) ( not ( = ?auto_1883611 ?auto_1883609 ) ) ( not ( = ?auto_1883611 ?auto_1883610 ) ) ( not ( = ?auto_1883612 ?auto_1883609 ) ) ( not ( = ?auto_1883612 ?auto_1883610 ) ) ( not ( = ?auto_1883612 ?auto_1883611 ) ) ( IN-CITY ?auto_1883613 ?auto_1883615 ) ( IN-CITY ?auto_1883608 ?auto_1883615 ) ( not ( = ?auto_1883608 ?auto_1883613 ) ) ( OBJ-AT ?auto_1883609 ?auto_1883608 ) ( OBJ-AT ?auto_1883610 ?auto_1883613 ) ( TRUCK-AT ?auto_1883616 ?auto_1883614 ) ( IN-CITY ?auto_1883614 ?auto_1883615 ) ( not ( = ?auto_1883608 ?auto_1883614 ) ) ( not ( = ?auto_1883613 ?auto_1883614 ) ) ( OBJ-AT ?auto_1883611 ?auto_1883608 ) ( OBJ-AT ?auto_1883612 ?auto_1883608 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1883609 ?auto_1883610 ?auto_1883608 )
      ( DELIVER-4PKG-VERIFY ?auto_1883609 ?auto_1883610 ?auto_1883611 ?auto_1883612 ?auto_1883608 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1885540 - OBJ
      ?auto_1885541 - OBJ
      ?auto_1885542 - OBJ
      ?auto_1885543 - OBJ
      ?auto_1885539 - LOCATION
    )
    :vars
    (
      ?auto_1885544 - LOCATION
      ?auto_1885546 - CITY
      ?auto_1885547 - TRUCK
      ?auto_1885545 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1885541 ?auto_1885540 ) ) ( not ( = ?auto_1885542 ?auto_1885540 ) ) ( not ( = ?auto_1885542 ?auto_1885541 ) ) ( not ( = ?auto_1885543 ?auto_1885540 ) ) ( not ( = ?auto_1885543 ?auto_1885541 ) ) ( not ( = ?auto_1885543 ?auto_1885542 ) ) ( IN-CITY ?auto_1885544 ?auto_1885546 ) ( IN-CITY ?auto_1885539 ?auto_1885546 ) ( not ( = ?auto_1885539 ?auto_1885544 ) ) ( OBJ-AT ?auto_1885541 ?auto_1885539 ) ( OBJ-AT ?auto_1885540 ?auto_1885544 ) ( TRUCK-AT ?auto_1885547 ?auto_1885545 ) ( IN-CITY ?auto_1885545 ?auto_1885546 ) ( not ( = ?auto_1885539 ?auto_1885545 ) ) ( not ( = ?auto_1885544 ?auto_1885545 ) ) ( OBJ-AT ?auto_1885542 ?auto_1885539 ) ( OBJ-AT ?auto_1885543 ?auto_1885539 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1885541 ?auto_1885540 ?auto_1885539 )
      ( DELIVER-4PKG-VERIFY ?auto_1885540 ?auto_1885541 ?auto_1885542 ?auto_1885543 ?auto_1885539 ) )
  )

)

