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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9699 - OBJ
      ?auto_9698 - LOCATION
    )
    :vars
    (
      ?auto_9700 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9700 ?auto_9698 ) ( IN-TRUCK ?auto_9699 ?auto_9700 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_9699 ?auto_9700 ?auto_9698 )
      ( DELIVER-1PKG-VERIFY ?auto_9699 ?auto_9698 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9711 - OBJ
      ?auto_9710 - LOCATION
    )
    :vars
    (
      ?auto_9712 - TRUCK
      ?auto_9713 - LOCATION
      ?auto_9714 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9711 ?auto_9712 ) ( TRUCK-AT ?auto_9712 ?auto_9713 ) ( IN-CITY ?auto_9713 ?auto_9714 ) ( IN-CITY ?auto_9710 ?auto_9714 ) ( not ( = ?auto_9710 ?auto_9713 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9712 ?auto_9713 ?auto_9710 ?auto_9714 )
      ( DELIVER-1PKG ?auto_9711 ?auto_9710 )
      ( DELIVER-1PKG-VERIFY ?auto_9711 ?auto_9710 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9729 - OBJ
      ?auto_9728 - LOCATION
    )
    :vars
    (
      ?auto_9730 - TRUCK
      ?auto_9732 - LOCATION
      ?auto_9731 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9730 ?auto_9732 ) ( IN-CITY ?auto_9732 ?auto_9731 ) ( IN-CITY ?auto_9728 ?auto_9731 ) ( not ( = ?auto_9728 ?auto_9732 ) ) ( OBJ-AT ?auto_9729 ?auto_9732 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9729 ?auto_9730 ?auto_9732 )
      ( DELIVER-1PKG ?auto_9729 ?auto_9728 )
      ( DELIVER-1PKG-VERIFY ?auto_9729 ?auto_9728 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9747 - OBJ
      ?auto_9746 - LOCATION
    )
    :vars
    (
      ?auto_9749 - LOCATION
      ?auto_9748 - CITY
      ?auto_9750 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9749 ?auto_9748 ) ( IN-CITY ?auto_9746 ?auto_9748 ) ( not ( = ?auto_9746 ?auto_9749 ) ) ( OBJ-AT ?auto_9747 ?auto_9749 ) ( TRUCK-AT ?auto_9750 ?auto_9746 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9750 ?auto_9746 ?auto_9749 ?auto_9748 )
      ( DELIVER-1PKG ?auto_9747 ?auto_9746 )
      ( DELIVER-1PKG-VERIFY ?auto_9747 ?auto_9746 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9807 - OBJ
      ?auto_9808 - OBJ
      ?auto_9806 - LOCATION
    )
    :vars
    (
      ?auto_9809 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9808 ?auto_9807 ) ) ( TRUCK-AT ?auto_9809 ?auto_9806 ) ( IN-TRUCK ?auto_9808 ?auto_9809 ) ( OBJ-AT ?auto_9807 ?auto_9806 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9808 ?auto_9806 )
      ( DELIVER-2PKG-VERIFY ?auto_9807 ?auto_9808 ?auto_9806 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9811 - OBJ
      ?auto_9812 - OBJ
      ?auto_9810 - LOCATION
    )
    :vars
    (
      ?auto_9813 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9812 ?auto_9811 ) ) ( TRUCK-AT ?auto_9813 ?auto_9810 ) ( IN-TRUCK ?auto_9811 ?auto_9813 ) ( OBJ-AT ?auto_9812 ?auto_9810 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9811 ?auto_9810 )
      ( DELIVER-2PKG-VERIFY ?auto_9811 ?auto_9812 ?auto_9810 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9859 - OBJ
      ?auto_9860 - OBJ
      ?auto_9858 - LOCATION
    )
    :vars
    (
      ?auto_9861 - TRUCK
      ?auto_9863 - LOCATION
      ?auto_9862 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_9860 ?auto_9859 ) ) ( IN-TRUCK ?auto_9860 ?auto_9861 ) ( TRUCK-AT ?auto_9861 ?auto_9863 ) ( IN-CITY ?auto_9863 ?auto_9862 ) ( IN-CITY ?auto_9858 ?auto_9862 ) ( not ( = ?auto_9858 ?auto_9863 ) ) ( OBJ-AT ?auto_9859 ?auto_9858 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9860 ?auto_9858 )
      ( DELIVER-2PKG-VERIFY ?auto_9859 ?auto_9860 ?auto_9858 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9865 - OBJ
      ?auto_9866 - OBJ
      ?auto_9864 - LOCATION
    )
    :vars
    (
      ?auto_9869 - TRUCK
      ?auto_9867 - LOCATION
      ?auto_9868 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_9866 ?auto_9865 ) ) ( IN-TRUCK ?auto_9865 ?auto_9869 ) ( TRUCK-AT ?auto_9869 ?auto_9867 ) ( IN-CITY ?auto_9867 ?auto_9868 ) ( IN-CITY ?auto_9864 ?auto_9868 ) ( not ( = ?auto_9864 ?auto_9867 ) ) ( OBJ-AT ?auto_9866 ?auto_9864 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9866 ?auto_9865 ?auto_9864 )
      ( DELIVER-2PKG-VERIFY ?auto_9865 ?auto_9866 ?auto_9864 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9928 - OBJ
      ?auto_9927 - LOCATION
    )
    :vars
    (
      ?auto_9932 - OBJ
      ?auto_9931 - TRUCK
      ?auto_9929 - LOCATION
      ?auto_9930 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_9928 ?auto_9932 ) ) ( TRUCK-AT ?auto_9931 ?auto_9929 ) ( IN-CITY ?auto_9929 ?auto_9930 ) ( IN-CITY ?auto_9927 ?auto_9930 ) ( not ( = ?auto_9927 ?auto_9929 ) ) ( OBJ-AT ?auto_9932 ?auto_9927 ) ( OBJ-AT ?auto_9928 ?auto_9929 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9928 ?auto_9931 ?auto_9929 )
      ( DELIVER-2PKG ?auto_9932 ?auto_9928 ?auto_9927 )
      ( DELIVER-1PKG-VERIFY ?auto_9928 ?auto_9927 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9934 - OBJ
      ?auto_9935 - OBJ
      ?auto_9933 - LOCATION
    )
    :vars
    (
      ?auto_9936 - TRUCK
      ?auto_9938 - LOCATION
      ?auto_9937 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_9935 ?auto_9934 ) ) ( TRUCK-AT ?auto_9936 ?auto_9938 ) ( IN-CITY ?auto_9938 ?auto_9937 ) ( IN-CITY ?auto_9933 ?auto_9937 ) ( not ( = ?auto_9933 ?auto_9938 ) ) ( OBJ-AT ?auto_9934 ?auto_9933 ) ( OBJ-AT ?auto_9935 ?auto_9938 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9935 ?auto_9933 )
      ( DELIVER-2PKG-VERIFY ?auto_9934 ?auto_9935 ?auto_9933 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9940 - OBJ
      ?auto_9941 - OBJ
      ?auto_9939 - LOCATION
    )
    :vars
    (
      ?auto_9943 - TRUCK
      ?auto_9944 - LOCATION
      ?auto_9942 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_9941 ?auto_9940 ) ) ( TRUCK-AT ?auto_9943 ?auto_9944 ) ( IN-CITY ?auto_9944 ?auto_9942 ) ( IN-CITY ?auto_9939 ?auto_9942 ) ( not ( = ?auto_9939 ?auto_9944 ) ) ( OBJ-AT ?auto_9941 ?auto_9939 ) ( OBJ-AT ?auto_9940 ?auto_9944 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9941 ?auto_9940 ?auto_9939 )
      ( DELIVER-2PKG-VERIFY ?auto_9940 ?auto_9941 ?auto_9939 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10003 - OBJ
      ?auto_10002 - LOCATION
    )
    :vars
    (
      ?auto_10004 - OBJ
      ?auto_10007 - LOCATION
      ?auto_10005 - CITY
      ?auto_10006 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10003 ?auto_10004 ) ) ( IN-CITY ?auto_10007 ?auto_10005 ) ( IN-CITY ?auto_10002 ?auto_10005 ) ( not ( = ?auto_10002 ?auto_10007 ) ) ( OBJ-AT ?auto_10004 ?auto_10002 ) ( OBJ-AT ?auto_10003 ?auto_10007 ) ( TRUCK-AT ?auto_10006 ?auto_10002 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10006 ?auto_10002 ?auto_10007 ?auto_10005 )
      ( DELIVER-2PKG ?auto_10004 ?auto_10003 ?auto_10002 )
      ( DELIVER-1PKG-VERIFY ?auto_10003 ?auto_10002 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10009 - OBJ
      ?auto_10010 - OBJ
      ?auto_10008 - LOCATION
    )
    :vars
    (
      ?auto_10013 - LOCATION
      ?auto_10011 - CITY
      ?auto_10012 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10010 ?auto_10009 ) ) ( IN-CITY ?auto_10013 ?auto_10011 ) ( IN-CITY ?auto_10008 ?auto_10011 ) ( not ( = ?auto_10008 ?auto_10013 ) ) ( OBJ-AT ?auto_10009 ?auto_10008 ) ( OBJ-AT ?auto_10010 ?auto_10013 ) ( TRUCK-AT ?auto_10012 ?auto_10008 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10010 ?auto_10008 )
      ( DELIVER-2PKG-VERIFY ?auto_10009 ?auto_10010 ?auto_10008 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10015 - OBJ
      ?auto_10016 - OBJ
      ?auto_10014 - LOCATION
    )
    :vars
    (
      ?auto_10017 - LOCATION
      ?auto_10018 - CITY
      ?auto_10019 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10016 ?auto_10015 ) ) ( IN-CITY ?auto_10017 ?auto_10018 ) ( IN-CITY ?auto_10014 ?auto_10018 ) ( not ( = ?auto_10014 ?auto_10017 ) ) ( OBJ-AT ?auto_10016 ?auto_10014 ) ( OBJ-AT ?auto_10015 ?auto_10017 ) ( TRUCK-AT ?auto_10019 ?auto_10014 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10016 ?auto_10015 ?auto_10014 )
      ( DELIVER-2PKG-VERIFY ?auto_10015 ?auto_10016 ?auto_10014 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10078 - OBJ
      ?auto_10077 - LOCATION
    )
    :vars
    (
      ?auto_10081 - OBJ
      ?auto_10079 - LOCATION
      ?auto_10080 - CITY
      ?auto_10082 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10078 ?auto_10081 ) ) ( IN-CITY ?auto_10079 ?auto_10080 ) ( IN-CITY ?auto_10077 ?auto_10080 ) ( not ( = ?auto_10077 ?auto_10079 ) ) ( OBJ-AT ?auto_10078 ?auto_10079 ) ( TRUCK-AT ?auto_10082 ?auto_10077 ) ( IN-TRUCK ?auto_10081 ?auto_10082 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10081 ?auto_10077 )
      ( DELIVER-2PKG ?auto_10081 ?auto_10078 ?auto_10077 )
      ( DELIVER-1PKG-VERIFY ?auto_10078 ?auto_10077 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10084 - OBJ
      ?auto_10085 - OBJ
      ?auto_10083 - LOCATION
    )
    :vars
    (
      ?auto_10088 - LOCATION
      ?auto_10086 - CITY
      ?auto_10087 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10085 ?auto_10084 ) ) ( IN-CITY ?auto_10088 ?auto_10086 ) ( IN-CITY ?auto_10083 ?auto_10086 ) ( not ( = ?auto_10083 ?auto_10088 ) ) ( OBJ-AT ?auto_10085 ?auto_10088 ) ( TRUCK-AT ?auto_10087 ?auto_10083 ) ( IN-TRUCK ?auto_10084 ?auto_10087 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10085 ?auto_10083 )
      ( DELIVER-2PKG-VERIFY ?auto_10084 ?auto_10085 ?auto_10083 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10090 - OBJ
      ?auto_10091 - OBJ
      ?auto_10089 - LOCATION
    )
    :vars
    (
      ?auto_10094 - LOCATION
      ?auto_10092 - CITY
      ?auto_10093 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10091 ?auto_10090 ) ) ( IN-CITY ?auto_10094 ?auto_10092 ) ( IN-CITY ?auto_10089 ?auto_10092 ) ( not ( = ?auto_10089 ?auto_10094 ) ) ( OBJ-AT ?auto_10090 ?auto_10094 ) ( TRUCK-AT ?auto_10093 ?auto_10089 ) ( IN-TRUCK ?auto_10091 ?auto_10093 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10091 ?auto_10090 ?auto_10089 )
      ( DELIVER-2PKG-VERIFY ?auto_10090 ?auto_10091 ?auto_10089 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10153 - OBJ
      ?auto_10152 - LOCATION
    )
    :vars
    (
      ?auto_10157 - OBJ
      ?auto_10156 - LOCATION
      ?auto_10154 - CITY
      ?auto_10155 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10153 ?auto_10157 ) ) ( IN-CITY ?auto_10156 ?auto_10154 ) ( IN-CITY ?auto_10152 ?auto_10154 ) ( not ( = ?auto_10152 ?auto_10156 ) ) ( OBJ-AT ?auto_10153 ?auto_10156 ) ( IN-TRUCK ?auto_10157 ?auto_10155 ) ( TRUCK-AT ?auto_10155 ?auto_10156 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10155 ?auto_10156 ?auto_10152 ?auto_10154 )
      ( DELIVER-2PKG ?auto_10157 ?auto_10153 ?auto_10152 )
      ( DELIVER-1PKG-VERIFY ?auto_10153 ?auto_10152 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10159 - OBJ
      ?auto_10160 - OBJ
      ?auto_10158 - LOCATION
    )
    :vars
    (
      ?auto_10162 - LOCATION
      ?auto_10161 - CITY
      ?auto_10163 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10160 ?auto_10159 ) ) ( IN-CITY ?auto_10162 ?auto_10161 ) ( IN-CITY ?auto_10158 ?auto_10161 ) ( not ( = ?auto_10158 ?auto_10162 ) ) ( OBJ-AT ?auto_10160 ?auto_10162 ) ( IN-TRUCK ?auto_10159 ?auto_10163 ) ( TRUCK-AT ?auto_10163 ?auto_10162 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10160 ?auto_10158 )
      ( DELIVER-2PKG-VERIFY ?auto_10159 ?auto_10160 ?auto_10158 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10165 - OBJ
      ?auto_10166 - OBJ
      ?auto_10164 - LOCATION
    )
    :vars
    (
      ?auto_10168 - LOCATION
      ?auto_10169 - CITY
      ?auto_10167 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10166 ?auto_10165 ) ) ( IN-CITY ?auto_10168 ?auto_10169 ) ( IN-CITY ?auto_10164 ?auto_10169 ) ( not ( = ?auto_10164 ?auto_10168 ) ) ( OBJ-AT ?auto_10165 ?auto_10168 ) ( IN-TRUCK ?auto_10166 ?auto_10167 ) ( TRUCK-AT ?auto_10167 ?auto_10168 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10166 ?auto_10165 ?auto_10164 )
      ( DELIVER-2PKG-VERIFY ?auto_10165 ?auto_10166 ?auto_10164 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10485 - OBJ
      ?auto_10486 - OBJ
      ?auto_10487 - OBJ
      ?auto_10484 - LOCATION
    )
    :vars
    (
      ?auto_10488 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10486 ?auto_10485 ) ) ( not ( = ?auto_10487 ?auto_10485 ) ) ( not ( = ?auto_10487 ?auto_10486 ) ) ( TRUCK-AT ?auto_10488 ?auto_10484 ) ( IN-TRUCK ?auto_10487 ?auto_10488 ) ( OBJ-AT ?auto_10485 ?auto_10484 ) ( OBJ-AT ?auto_10486 ?auto_10484 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10487 ?auto_10484 )
      ( DELIVER-3PKG-VERIFY ?auto_10485 ?auto_10486 ?auto_10487 ?auto_10484 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10495 - OBJ
      ?auto_10496 - OBJ
      ?auto_10497 - OBJ
      ?auto_10494 - LOCATION
    )
    :vars
    (
      ?auto_10498 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10496 ?auto_10495 ) ) ( not ( = ?auto_10497 ?auto_10495 ) ) ( not ( = ?auto_10497 ?auto_10496 ) ) ( TRUCK-AT ?auto_10498 ?auto_10494 ) ( IN-TRUCK ?auto_10496 ?auto_10498 ) ( OBJ-AT ?auto_10495 ?auto_10494 ) ( OBJ-AT ?auto_10497 ?auto_10494 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10496 ?auto_10494 )
      ( DELIVER-3PKG-VERIFY ?auto_10495 ?auto_10496 ?auto_10497 ?auto_10494 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10533 - OBJ
      ?auto_10534 - OBJ
      ?auto_10535 - OBJ
      ?auto_10532 - LOCATION
    )
    :vars
    (
      ?auto_10536 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10534 ?auto_10533 ) ) ( not ( = ?auto_10535 ?auto_10533 ) ) ( not ( = ?auto_10535 ?auto_10534 ) ) ( TRUCK-AT ?auto_10536 ?auto_10532 ) ( IN-TRUCK ?auto_10533 ?auto_10536 ) ( OBJ-AT ?auto_10534 ?auto_10532 ) ( OBJ-AT ?auto_10535 ?auto_10532 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10533 ?auto_10532 )
      ( DELIVER-3PKG-VERIFY ?auto_10533 ?auto_10534 ?auto_10535 ?auto_10532 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10609 - OBJ
      ?auto_10610 - OBJ
      ?auto_10611 - OBJ
      ?auto_10608 - LOCATION
    )
    :vars
    (
      ?auto_10612 - TRUCK
      ?auto_10614 - LOCATION
      ?auto_10613 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_10610 ?auto_10609 ) ) ( not ( = ?auto_10611 ?auto_10609 ) ) ( not ( = ?auto_10611 ?auto_10610 ) ) ( IN-TRUCK ?auto_10611 ?auto_10612 ) ( TRUCK-AT ?auto_10612 ?auto_10614 ) ( IN-CITY ?auto_10614 ?auto_10613 ) ( IN-CITY ?auto_10608 ?auto_10613 ) ( not ( = ?auto_10608 ?auto_10614 ) ) ( OBJ-AT ?auto_10609 ?auto_10608 ) ( OBJ-AT ?auto_10610 ?auto_10608 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10609 ?auto_10611 ?auto_10608 )
      ( DELIVER-3PKG-VERIFY ?auto_10609 ?auto_10610 ?auto_10611 ?auto_10608 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10623 - OBJ
      ?auto_10624 - OBJ
      ?auto_10625 - OBJ
      ?auto_10622 - LOCATION
    )
    :vars
    (
      ?auto_10626 - TRUCK
      ?auto_10628 - LOCATION
      ?auto_10627 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_10624 ?auto_10623 ) ) ( not ( = ?auto_10625 ?auto_10623 ) ) ( not ( = ?auto_10625 ?auto_10624 ) ) ( IN-TRUCK ?auto_10624 ?auto_10626 ) ( TRUCK-AT ?auto_10626 ?auto_10628 ) ( IN-CITY ?auto_10628 ?auto_10627 ) ( IN-CITY ?auto_10622 ?auto_10627 ) ( not ( = ?auto_10622 ?auto_10628 ) ) ( OBJ-AT ?auto_10623 ?auto_10622 ) ( OBJ-AT ?auto_10625 ?auto_10622 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10623 ?auto_10624 ?auto_10622 )
      ( DELIVER-3PKG-VERIFY ?auto_10623 ?auto_10624 ?auto_10625 ?auto_10622 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10676 - OBJ
      ?auto_10677 - OBJ
      ?auto_10678 - OBJ
      ?auto_10675 - LOCATION
    )
    :vars
    (
      ?auto_10679 - TRUCK
      ?auto_10681 - LOCATION
      ?auto_10680 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_10677 ?auto_10676 ) ) ( not ( = ?auto_10678 ?auto_10676 ) ) ( not ( = ?auto_10678 ?auto_10677 ) ) ( IN-TRUCK ?auto_10676 ?auto_10679 ) ( TRUCK-AT ?auto_10679 ?auto_10681 ) ( IN-CITY ?auto_10681 ?auto_10680 ) ( IN-CITY ?auto_10675 ?auto_10680 ) ( not ( = ?auto_10675 ?auto_10681 ) ) ( OBJ-AT ?auto_10677 ?auto_10675 ) ( OBJ-AT ?auto_10678 ?auto_10675 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10677 ?auto_10676 ?auto_10675 )
      ( DELIVER-3PKG-VERIFY ?auto_10676 ?auto_10677 ?auto_10678 ?auto_10675 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10771 - OBJ
      ?auto_10772 - OBJ
      ?auto_10773 - OBJ
      ?auto_10770 - LOCATION
    )
    :vars
    (
      ?auto_10775 - TRUCK
      ?auto_10774 - LOCATION
      ?auto_10776 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_10772 ?auto_10771 ) ) ( not ( = ?auto_10773 ?auto_10771 ) ) ( not ( = ?auto_10773 ?auto_10772 ) ) ( TRUCK-AT ?auto_10775 ?auto_10774 ) ( IN-CITY ?auto_10774 ?auto_10776 ) ( IN-CITY ?auto_10770 ?auto_10776 ) ( not ( = ?auto_10770 ?auto_10774 ) ) ( OBJ-AT ?auto_10771 ?auto_10770 ) ( OBJ-AT ?auto_10773 ?auto_10774 ) ( OBJ-AT ?auto_10772 ?auto_10770 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10771 ?auto_10773 ?auto_10770 )
      ( DELIVER-3PKG-VERIFY ?auto_10771 ?auto_10772 ?auto_10773 ?auto_10770 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10785 - OBJ
      ?auto_10786 - OBJ
      ?auto_10787 - OBJ
      ?auto_10784 - LOCATION
    )
    :vars
    (
      ?auto_10789 - TRUCK
      ?auto_10788 - LOCATION
      ?auto_10790 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_10786 ?auto_10785 ) ) ( not ( = ?auto_10787 ?auto_10785 ) ) ( not ( = ?auto_10787 ?auto_10786 ) ) ( TRUCK-AT ?auto_10789 ?auto_10788 ) ( IN-CITY ?auto_10788 ?auto_10790 ) ( IN-CITY ?auto_10784 ?auto_10790 ) ( not ( = ?auto_10784 ?auto_10788 ) ) ( OBJ-AT ?auto_10785 ?auto_10784 ) ( OBJ-AT ?auto_10786 ?auto_10788 ) ( OBJ-AT ?auto_10787 ?auto_10784 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10785 ?auto_10786 ?auto_10784 )
      ( DELIVER-3PKG-VERIFY ?auto_10785 ?auto_10786 ?auto_10787 ?auto_10784 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10838 - OBJ
      ?auto_10839 - OBJ
      ?auto_10840 - OBJ
      ?auto_10837 - LOCATION
    )
    :vars
    (
      ?auto_10842 - TRUCK
      ?auto_10841 - LOCATION
      ?auto_10843 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_10839 ?auto_10838 ) ) ( not ( = ?auto_10840 ?auto_10838 ) ) ( not ( = ?auto_10840 ?auto_10839 ) ) ( TRUCK-AT ?auto_10842 ?auto_10841 ) ( IN-CITY ?auto_10841 ?auto_10843 ) ( IN-CITY ?auto_10837 ?auto_10843 ) ( not ( = ?auto_10837 ?auto_10841 ) ) ( OBJ-AT ?auto_10839 ?auto_10837 ) ( OBJ-AT ?auto_10838 ?auto_10841 ) ( OBJ-AT ?auto_10840 ?auto_10837 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10839 ?auto_10838 ?auto_10837 )
      ( DELIVER-3PKG-VERIFY ?auto_10838 ?auto_10839 ?auto_10840 ?auto_10837 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10933 - OBJ
      ?auto_10934 - OBJ
      ?auto_10935 - OBJ
      ?auto_10932 - LOCATION
    )
    :vars
    (
      ?auto_10937 - LOCATION
      ?auto_10938 - CITY
      ?auto_10936 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10934 ?auto_10933 ) ) ( not ( = ?auto_10935 ?auto_10933 ) ) ( not ( = ?auto_10935 ?auto_10934 ) ) ( IN-CITY ?auto_10937 ?auto_10938 ) ( IN-CITY ?auto_10932 ?auto_10938 ) ( not ( = ?auto_10932 ?auto_10937 ) ) ( OBJ-AT ?auto_10933 ?auto_10932 ) ( OBJ-AT ?auto_10935 ?auto_10937 ) ( TRUCK-AT ?auto_10936 ?auto_10932 ) ( OBJ-AT ?auto_10934 ?auto_10932 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10933 ?auto_10935 ?auto_10932 )
      ( DELIVER-3PKG-VERIFY ?auto_10933 ?auto_10934 ?auto_10935 ?auto_10932 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10947 - OBJ
      ?auto_10948 - OBJ
      ?auto_10949 - OBJ
      ?auto_10946 - LOCATION
    )
    :vars
    (
      ?auto_10951 - LOCATION
      ?auto_10952 - CITY
      ?auto_10950 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10948 ?auto_10947 ) ) ( not ( = ?auto_10949 ?auto_10947 ) ) ( not ( = ?auto_10949 ?auto_10948 ) ) ( IN-CITY ?auto_10951 ?auto_10952 ) ( IN-CITY ?auto_10946 ?auto_10952 ) ( not ( = ?auto_10946 ?auto_10951 ) ) ( OBJ-AT ?auto_10947 ?auto_10946 ) ( OBJ-AT ?auto_10948 ?auto_10951 ) ( TRUCK-AT ?auto_10950 ?auto_10946 ) ( OBJ-AT ?auto_10949 ?auto_10946 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10947 ?auto_10948 ?auto_10946 )
      ( DELIVER-3PKG-VERIFY ?auto_10947 ?auto_10948 ?auto_10949 ?auto_10946 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11000 - OBJ
      ?auto_11001 - OBJ
      ?auto_11002 - OBJ
      ?auto_10999 - LOCATION
    )
    :vars
    (
      ?auto_11004 - LOCATION
      ?auto_11005 - CITY
      ?auto_11003 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_11001 ?auto_11000 ) ) ( not ( = ?auto_11002 ?auto_11000 ) ) ( not ( = ?auto_11002 ?auto_11001 ) ) ( IN-CITY ?auto_11004 ?auto_11005 ) ( IN-CITY ?auto_10999 ?auto_11005 ) ( not ( = ?auto_10999 ?auto_11004 ) ) ( OBJ-AT ?auto_11001 ?auto_10999 ) ( OBJ-AT ?auto_11000 ?auto_11004 ) ( TRUCK-AT ?auto_11003 ?auto_10999 ) ( OBJ-AT ?auto_11002 ?auto_10999 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11001 ?auto_11000 ?auto_10999 )
      ( DELIVER-3PKG-VERIFY ?auto_11000 ?auto_11001 ?auto_11002 ?auto_10999 ) )
  )

)

