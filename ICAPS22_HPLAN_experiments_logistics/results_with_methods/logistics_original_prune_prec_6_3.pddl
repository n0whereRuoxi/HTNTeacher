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
      ?auto_43242859 - OBJ
      ?auto_43242860 - LOCATION
    )
    :vars
    (
      ?auto_43242861 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_43242861 ?auto_43242860 ) ( IN-TRUCK ?auto_43242859 ?auto_43242861 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_43242859 ?auto_43242861 ?auto_43242860 )
      ( DELIVER-1PKG-VERIFY ?auto_43242859 ?auto_43242860 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_43242892 - OBJ
      ?auto_43242893 - LOCATION
    )
    :vars
    (
      ?auto_43242894 - TRUCK
      ?auto_43242895 - LOCATION
      ?auto_43242896 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_43242892 ?auto_43242894 ) ( TRUCK-AT ?auto_43242894 ?auto_43242895 ) ( IN-CITY ?auto_43242895 ?auto_43242896 ) ( IN-CITY ?auto_43242893 ?auto_43242896 ) ( not ( = ?auto_43242893 ?auto_43242895 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_43242894 ?auto_43242895 ?auto_43242893 ?auto_43242896 )
      ( DELIVER-1PKG ?auto_43242892 ?auto_43242893 )
      ( DELIVER-1PKG-VERIFY ?auto_43242892 ?auto_43242893 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_43242937 - OBJ
      ?auto_43242938 - LOCATION
    )
    :vars
    (
      ?auto_43242940 - TRUCK
      ?auto_43242941 - LOCATION
      ?auto_43242939 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_43242940 ?auto_43242941 ) ( IN-CITY ?auto_43242941 ?auto_43242939 ) ( IN-CITY ?auto_43242938 ?auto_43242939 ) ( not ( = ?auto_43242938 ?auto_43242941 ) ) ( OBJ-AT ?auto_43242937 ?auto_43242941 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_43242937 ?auto_43242940 ?auto_43242941 )
      ( DELIVER-1PKG ?auto_43242937 ?auto_43242938 )
      ( DELIVER-1PKG-VERIFY ?auto_43242937 ?auto_43242938 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_43242982 - OBJ
      ?auto_43242983 - LOCATION
    )
    :vars
    (
      ?auto_43242986 - LOCATION
      ?auto_43242985 - CITY
      ?auto_43242984 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_43242986 ?auto_43242985 ) ( IN-CITY ?auto_43242983 ?auto_43242985 ) ( not ( = ?auto_43242983 ?auto_43242986 ) ) ( OBJ-AT ?auto_43242982 ?auto_43242986 ) ( TRUCK-AT ?auto_43242984 ?auto_43242983 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_43242984 ?auto_43242983 ?auto_43242986 ?auto_43242985 )
      ( DELIVER-1PKG ?auto_43242982 ?auto_43242983 )
      ( DELIVER-1PKG-VERIFY ?auto_43242982 ?auto_43242983 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_43243771 - OBJ
      ?auto_43243773 - OBJ
      ?auto_43243772 - LOCATION
    )
    :vars
    (
      ?auto_43243774 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43243773 ?auto_43243771 ) ( TRUCK-AT ?auto_43243774 ?auto_43243772 ) ( IN-TRUCK ?auto_43243773 ?auto_43243774 ) ( OBJ-AT ?auto_43243771 ?auto_43243772 ) ( not ( = ?auto_43243771 ?auto_43243773 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_43243773 ?auto_43243772 )
      ( DELIVER-2PKG-VERIFY ?auto_43243771 ?auto_43243773 ?auto_43243772 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_43244634 - OBJ
      ?auto_43244636 - OBJ
      ?auto_43244635 - LOCATION
    )
    :vars
    (
      ?auto_43244639 - TRUCK
      ?auto_43244637 - LOCATION
      ?auto_43244638 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43244636 ?auto_43244634 ) ( IN-TRUCK ?auto_43244636 ?auto_43244639 ) ( TRUCK-AT ?auto_43244639 ?auto_43244637 ) ( IN-CITY ?auto_43244637 ?auto_43244638 ) ( IN-CITY ?auto_43244635 ?auto_43244638 ) ( not ( = ?auto_43244635 ?auto_43244637 ) ) ( OBJ-AT ?auto_43244634 ?auto_43244635 ) ( not ( = ?auto_43244634 ?auto_43244636 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_43244636 ?auto_43244635 )
      ( DELIVER-2PKG-VERIFY ?auto_43244634 ?auto_43244636 ?auto_43244635 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_43245735 - OBJ
      ?auto_43245736 - LOCATION
    )
    :vars
    (
      ?auto_43245739 - OBJ
      ?auto_43245738 - TRUCK
      ?auto_43245737 - LOCATION
      ?auto_43245740 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43245735 ?auto_43245739 ) ( TRUCK-AT ?auto_43245738 ?auto_43245737 ) ( IN-CITY ?auto_43245737 ?auto_43245740 ) ( IN-CITY ?auto_43245736 ?auto_43245740 ) ( not ( = ?auto_43245736 ?auto_43245737 ) ) ( OBJ-AT ?auto_43245739 ?auto_43245736 ) ( not ( = ?auto_43245739 ?auto_43245735 ) ) ( OBJ-AT ?auto_43245735 ?auto_43245737 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_43245735 ?auto_43245738 ?auto_43245737 )
      ( DELIVER-2PKG ?auto_43245739 ?auto_43245735 ?auto_43245736 )
      ( DELIVER-1PKG-VERIFY ?auto_43245735 ?auto_43245736 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_43245741 - OBJ
      ?auto_43245743 - OBJ
      ?auto_43245742 - LOCATION
    )
    :vars
    (
      ?auto_43245744 - TRUCK
      ?auto_43245746 - LOCATION
      ?auto_43245745 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43245743 ?auto_43245741 ) ( TRUCK-AT ?auto_43245744 ?auto_43245746 ) ( IN-CITY ?auto_43245746 ?auto_43245745 ) ( IN-CITY ?auto_43245742 ?auto_43245745 ) ( not ( = ?auto_43245742 ?auto_43245746 ) ) ( OBJ-AT ?auto_43245741 ?auto_43245742 ) ( not ( = ?auto_43245741 ?auto_43245743 ) ) ( OBJ-AT ?auto_43245743 ?auto_43245746 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_43245743 ?auto_43245742 )
      ( DELIVER-2PKG-VERIFY ?auto_43245741 ?auto_43245743 ?auto_43245742 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_43246842 - OBJ
      ?auto_43246843 - LOCATION
    )
    :vars
    (
      ?auto_43246847 - OBJ
      ?auto_43246845 - LOCATION
      ?auto_43246846 - CITY
      ?auto_43246844 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43246842 ?auto_43246847 ) ( IN-CITY ?auto_43246845 ?auto_43246846 ) ( IN-CITY ?auto_43246843 ?auto_43246846 ) ( not ( = ?auto_43246843 ?auto_43246845 ) ) ( OBJ-AT ?auto_43246847 ?auto_43246843 ) ( not ( = ?auto_43246847 ?auto_43246842 ) ) ( OBJ-AT ?auto_43246842 ?auto_43246845 ) ( TRUCK-AT ?auto_43246844 ?auto_43246843 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_43246844 ?auto_43246843 ?auto_43246845 ?auto_43246846 )
      ( DELIVER-2PKG ?auto_43246847 ?auto_43246842 ?auto_43246843 )
      ( DELIVER-1PKG-VERIFY ?auto_43246842 ?auto_43246843 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_43246848 - OBJ
      ?auto_43246850 - OBJ
      ?auto_43246849 - LOCATION
    )
    :vars
    (
      ?auto_43246853 - LOCATION
      ?auto_43246851 - CITY
      ?auto_43246852 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43246850 ?auto_43246848 ) ( IN-CITY ?auto_43246853 ?auto_43246851 ) ( IN-CITY ?auto_43246849 ?auto_43246851 ) ( not ( = ?auto_43246849 ?auto_43246853 ) ) ( OBJ-AT ?auto_43246848 ?auto_43246849 ) ( not ( = ?auto_43246848 ?auto_43246850 ) ) ( OBJ-AT ?auto_43246850 ?auto_43246853 ) ( TRUCK-AT ?auto_43246852 ?auto_43246849 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_43246850 ?auto_43246849 )
      ( DELIVER-2PKG-VERIFY ?auto_43246848 ?auto_43246850 ?auto_43246849 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_43247949 - OBJ
      ?auto_43247950 - LOCATION
    )
    :vars
    (
      ?auto_43247954 - OBJ
      ?auto_43247953 - LOCATION
      ?auto_43247951 - CITY
      ?auto_43247952 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43247949 ?auto_43247954 ) ( IN-CITY ?auto_43247953 ?auto_43247951 ) ( IN-CITY ?auto_43247950 ?auto_43247951 ) ( not ( = ?auto_43247950 ?auto_43247953 ) ) ( not ( = ?auto_43247954 ?auto_43247949 ) ) ( OBJ-AT ?auto_43247949 ?auto_43247953 ) ( TRUCK-AT ?auto_43247952 ?auto_43247950 ) ( IN-TRUCK ?auto_43247954 ?auto_43247952 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_43247954 ?auto_43247950 )
      ( DELIVER-2PKG ?auto_43247954 ?auto_43247949 ?auto_43247950 )
      ( DELIVER-1PKG-VERIFY ?auto_43247949 ?auto_43247950 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_43247955 - OBJ
      ?auto_43247957 - OBJ
      ?auto_43247956 - LOCATION
    )
    :vars
    (
      ?auto_43247960 - LOCATION
      ?auto_43247959 - CITY
      ?auto_43247958 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43247957 ?auto_43247955 ) ( IN-CITY ?auto_43247960 ?auto_43247959 ) ( IN-CITY ?auto_43247956 ?auto_43247959 ) ( not ( = ?auto_43247956 ?auto_43247960 ) ) ( not ( = ?auto_43247955 ?auto_43247957 ) ) ( OBJ-AT ?auto_43247957 ?auto_43247960 ) ( TRUCK-AT ?auto_43247958 ?auto_43247956 ) ( IN-TRUCK ?auto_43247955 ?auto_43247958 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_43247957 ?auto_43247956 )
      ( DELIVER-2PKG-VERIFY ?auto_43247955 ?auto_43247957 ?auto_43247956 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_43249056 - OBJ
      ?auto_43249057 - LOCATION
    )
    :vars
    (
      ?auto_43249061 - OBJ
      ?auto_43249060 - LOCATION
      ?auto_43249059 - CITY
      ?auto_43249058 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43249056 ?auto_43249061 ) ( IN-CITY ?auto_43249060 ?auto_43249059 ) ( IN-CITY ?auto_43249057 ?auto_43249059 ) ( not ( = ?auto_43249057 ?auto_43249060 ) ) ( not ( = ?auto_43249061 ?auto_43249056 ) ) ( OBJ-AT ?auto_43249056 ?auto_43249060 ) ( IN-TRUCK ?auto_43249061 ?auto_43249058 ) ( TRUCK-AT ?auto_43249058 ?auto_43249060 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_43249058 ?auto_43249060 ?auto_43249057 ?auto_43249059 )
      ( DELIVER-2PKG ?auto_43249061 ?auto_43249056 ?auto_43249057 )
      ( DELIVER-1PKG-VERIFY ?auto_43249056 ?auto_43249057 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_43249062 - OBJ
      ?auto_43249064 - OBJ
      ?auto_43249063 - LOCATION
    )
    :vars
    (
      ?auto_43249065 - LOCATION
      ?auto_43249066 - CITY
      ?auto_43249067 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43249064 ?auto_43249062 ) ( IN-CITY ?auto_43249065 ?auto_43249066 ) ( IN-CITY ?auto_43249063 ?auto_43249066 ) ( not ( = ?auto_43249063 ?auto_43249065 ) ) ( not ( = ?auto_43249062 ?auto_43249064 ) ) ( OBJ-AT ?auto_43249064 ?auto_43249065 ) ( IN-TRUCK ?auto_43249062 ?auto_43249067 ) ( TRUCK-AT ?auto_43249067 ?auto_43249065 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_43249064 ?auto_43249063 )
      ( DELIVER-2PKG-VERIFY ?auto_43249062 ?auto_43249064 ?auto_43249063 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43258725 - OBJ
      ?auto_43258727 - OBJ
      ?auto_43258728 - OBJ
      ?auto_43258726 - LOCATION
    )
    :vars
    (
      ?auto_43258729 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43258727 ?auto_43258725 ) ( GREATER-THAN ?auto_43258728 ?auto_43258725 ) ( GREATER-THAN ?auto_43258728 ?auto_43258727 ) ( TRUCK-AT ?auto_43258729 ?auto_43258726 ) ( IN-TRUCK ?auto_43258728 ?auto_43258729 ) ( OBJ-AT ?auto_43258725 ?auto_43258726 ) ( OBJ-AT ?auto_43258727 ?auto_43258726 ) ( not ( = ?auto_43258725 ?auto_43258727 ) ) ( not ( = ?auto_43258725 ?auto_43258728 ) ) ( not ( = ?auto_43258727 ?auto_43258728 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_43258728 ?auto_43258726 )
      ( DELIVER-3PKG-VERIFY ?auto_43258725 ?auto_43258727 ?auto_43258728 ?auto_43258726 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43266043 - OBJ
      ?auto_43266045 - OBJ
      ?auto_43266046 - OBJ
      ?auto_43266044 - LOCATION
    )
    :vars
    (
      ?auto_43266049 - TRUCK
      ?auto_43266048 - LOCATION
      ?auto_43266047 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43266045 ?auto_43266043 ) ( GREATER-THAN ?auto_43266046 ?auto_43266043 ) ( GREATER-THAN ?auto_43266046 ?auto_43266045 ) ( IN-TRUCK ?auto_43266046 ?auto_43266049 ) ( TRUCK-AT ?auto_43266049 ?auto_43266048 ) ( IN-CITY ?auto_43266048 ?auto_43266047 ) ( IN-CITY ?auto_43266044 ?auto_43266047 ) ( not ( = ?auto_43266044 ?auto_43266048 ) ) ( OBJ-AT ?auto_43266043 ?auto_43266044 ) ( not ( = ?auto_43266043 ?auto_43266046 ) ) ( OBJ-AT ?auto_43266045 ?auto_43266044 ) ( not ( = ?auto_43266043 ?auto_43266045 ) ) ( not ( = ?auto_43266045 ?auto_43266046 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43266043 ?auto_43266046 ?auto_43266044 )
      ( DELIVER-3PKG-VERIFY ?auto_43266043 ?auto_43266045 ?auto_43266046 ?auto_43266044 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43275396 - OBJ
      ?auto_43275398 - OBJ
      ?auto_43275399 - OBJ
      ?auto_43275397 - LOCATION
    )
    :vars
    (
      ?auto_43275402 - TRUCK
      ?auto_43275401 - LOCATION
      ?auto_43275400 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43275398 ?auto_43275396 ) ( GREATER-THAN ?auto_43275399 ?auto_43275396 ) ( GREATER-THAN ?auto_43275399 ?auto_43275398 ) ( TRUCK-AT ?auto_43275402 ?auto_43275401 ) ( IN-CITY ?auto_43275401 ?auto_43275400 ) ( IN-CITY ?auto_43275397 ?auto_43275400 ) ( not ( = ?auto_43275397 ?auto_43275401 ) ) ( OBJ-AT ?auto_43275396 ?auto_43275397 ) ( not ( = ?auto_43275396 ?auto_43275399 ) ) ( OBJ-AT ?auto_43275399 ?auto_43275401 ) ( OBJ-AT ?auto_43275398 ?auto_43275397 ) ( not ( = ?auto_43275396 ?auto_43275398 ) ) ( not ( = ?auto_43275398 ?auto_43275399 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43275396 ?auto_43275399 ?auto_43275397 )
      ( DELIVER-3PKG-VERIFY ?auto_43275396 ?auto_43275398 ?auto_43275399 ?auto_43275397 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43284749 - OBJ
      ?auto_43284751 - OBJ
      ?auto_43284752 - OBJ
      ?auto_43284750 - LOCATION
    )
    :vars
    (
      ?auto_43284755 - LOCATION
      ?auto_43284754 - CITY
      ?auto_43284753 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43284751 ?auto_43284749 ) ( GREATER-THAN ?auto_43284752 ?auto_43284749 ) ( GREATER-THAN ?auto_43284752 ?auto_43284751 ) ( IN-CITY ?auto_43284755 ?auto_43284754 ) ( IN-CITY ?auto_43284750 ?auto_43284754 ) ( not ( = ?auto_43284750 ?auto_43284755 ) ) ( OBJ-AT ?auto_43284749 ?auto_43284750 ) ( not ( = ?auto_43284749 ?auto_43284752 ) ) ( OBJ-AT ?auto_43284752 ?auto_43284755 ) ( TRUCK-AT ?auto_43284753 ?auto_43284750 ) ( OBJ-AT ?auto_43284751 ?auto_43284750 ) ( not ( = ?auto_43284749 ?auto_43284751 ) ) ( not ( = ?auto_43284751 ?auto_43284752 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43284749 ?auto_43284752 ?auto_43284750 )
      ( DELIVER-3PKG-VERIFY ?auto_43284749 ?auto_43284751 ?auto_43284752 ?auto_43284750 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_43303410 - OBJ
      ?auto_43303411 - LOCATION
    )
    :vars
    (
      ?auto_43303414 - OBJ
      ?auto_43303413 - LOCATION
      ?auto_43303415 - CITY
      ?auto_43303412 - TRUCK
      ?auto_43303416 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43303410 ?auto_43303414 ) ( IN-CITY ?auto_43303413 ?auto_43303415 ) ( IN-CITY ?auto_43303411 ?auto_43303415 ) ( not ( = ?auto_43303411 ?auto_43303413 ) ) ( OBJ-AT ?auto_43303414 ?auto_43303411 ) ( not ( = ?auto_43303414 ?auto_43303410 ) ) ( OBJ-AT ?auto_43303410 ?auto_43303413 ) ( TRUCK-AT ?auto_43303412 ?auto_43303416 ) ( IN-CITY ?auto_43303416 ?auto_43303415 ) ( not ( = ?auto_43303411 ?auto_43303416 ) ) ( not ( = ?auto_43303413 ?auto_43303416 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_43303412 ?auto_43303416 ?auto_43303411 ?auto_43303415 )
      ( DELIVER-2PKG ?auto_43303414 ?auto_43303410 ?auto_43303411 )
      ( DELIVER-1PKG-VERIFY ?auto_43303410 ?auto_43303411 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_43303417 - OBJ
      ?auto_43303419 - OBJ
      ?auto_43303418 - LOCATION
    )
    :vars
    (
      ?auto_43303420 - LOCATION
      ?auto_43303423 - CITY
      ?auto_43303421 - TRUCK
      ?auto_43303422 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43303419 ?auto_43303417 ) ( IN-CITY ?auto_43303420 ?auto_43303423 ) ( IN-CITY ?auto_43303418 ?auto_43303423 ) ( not ( = ?auto_43303418 ?auto_43303420 ) ) ( OBJ-AT ?auto_43303417 ?auto_43303418 ) ( not ( = ?auto_43303417 ?auto_43303419 ) ) ( OBJ-AT ?auto_43303419 ?auto_43303420 ) ( TRUCK-AT ?auto_43303421 ?auto_43303422 ) ( IN-CITY ?auto_43303422 ?auto_43303423 ) ( not ( = ?auto_43303418 ?auto_43303422 ) ) ( not ( = ?auto_43303420 ?auto_43303422 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_43303419 ?auto_43303418 )
      ( DELIVER-2PKG-VERIFY ?auto_43303417 ?auto_43303419 ?auto_43303418 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_43342747 - OBJ
      ?auto_43342748 - LOCATION
    )
    :vars
    (
      ?auto_43342752 - OBJ
      ?auto_43342749 - LOCATION
      ?auto_43342750 - CITY
      ?auto_43342751 - TRUCK
      ?auto_43342753 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43342747 ?auto_43342752 ) ( IN-CITY ?auto_43342749 ?auto_43342750 ) ( IN-CITY ?auto_43342748 ?auto_43342750 ) ( not ( = ?auto_43342748 ?auto_43342749 ) ) ( not ( = ?auto_43342752 ?auto_43342747 ) ) ( OBJ-AT ?auto_43342747 ?auto_43342749 ) ( IN-TRUCK ?auto_43342752 ?auto_43342751 ) ( TRUCK-AT ?auto_43342751 ?auto_43342753 ) ( IN-CITY ?auto_43342753 ?auto_43342750 ) ( not ( = ?auto_43342748 ?auto_43342753 ) ) ( not ( = ?auto_43342749 ?auto_43342753 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_43342751 ?auto_43342753 ?auto_43342748 ?auto_43342750 )
      ( DELIVER-2PKG ?auto_43342752 ?auto_43342747 ?auto_43342748 )
      ( DELIVER-1PKG-VERIFY ?auto_43342747 ?auto_43342748 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_43342754 - OBJ
      ?auto_43342756 - OBJ
      ?auto_43342755 - LOCATION
    )
    :vars
    (
      ?auto_43342757 - LOCATION
      ?auto_43342760 - CITY
      ?auto_43342759 - TRUCK
      ?auto_43342758 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43342756 ?auto_43342754 ) ( IN-CITY ?auto_43342757 ?auto_43342760 ) ( IN-CITY ?auto_43342755 ?auto_43342760 ) ( not ( = ?auto_43342755 ?auto_43342757 ) ) ( not ( = ?auto_43342754 ?auto_43342756 ) ) ( OBJ-AT ?auto_43342756 ?auto_43342757 ) ( IN-TRUCK ?auto_43342754 ?auto_43342759 ) ( TRUCK-AT ?auto_43342759 ?auto_43342758 ) ( IN-CITY ?auto_43342758 ?auto_43342760 ) ( not ( = ?auto_43342755 ?auto_43342758 ) ) ( not ( = ?auto_43342757 ?auto_43342758 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_43342756 ?auto_43342755 )
      ( DELIVER-2PKG-VERIFY ?auto_43342754 ?auto_43342756 ?auto_43342755 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_43353070 - OBJ
      ?auto_43353071 - LOCATION
    )
    :vars
    (
      ?auto_43353075 - OBJ
      ?auto_43353076 - LOCATION
      ?auto_43353073 - CITY
      ?auto_43353072 - TRUCK
      ?auto_43353074 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43353070 ?auto_43353075 ) ( IN-CITY ?auto_43353076 ?auto_43353073 ) ( IN-CITY ?auto_43353071 ?auto_43353073 ) ( not ( = ?auto_43353071 ?auto_43353076 ) ) ( not ( = ?auto_43353075 ?auto_43353070 ) ) ( OBJ-AT ?auto_43353070 ?auto_43353076 ) ( TRUCK-AT ?auto_43353072 ?auto_43353074 ) ( IN-CITY ?auto_43353074 ?auto_43353073 ) ( not ( = ?auto_43353071 ?auto_43353074 ) ) ( not ( = ?auto_43353076 ?auto_43353074 ) ) ( OBJ-AT ?auto_43353075 ?auto_43353074 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_43353075 ?auto_43353072 ?auto_43353074 )
      ( DELIVER-2PKG ?auto_43353075 ?auto_43353070 ?auto_43353071 )
      ( DELIVER-1PKG-VERIFY ?auto_43353070 ?auto_43353071 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_43353077 - OBJ
      ?auto_43353079 - OBJ
      ?auto_43353078 - LOCATION
    )
    :vars
    (
      ?auto_43353083 - LOCATION
      ?auto_43353082 - CITY
      ?auto_43353080 - TRUCK
      ?auto_43353081 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43353079 ?auto_43353077 ) ( IN-CITY ?auto_43353083 ?auto_43353082 ) ( IN-CITY ?auto_43353078 ?auto_43353082 ) ( not ( = ?auto_43353078 ?auto_43353083 ) ) ( not ( = ?auto_43353077 ?auto_43353079 ) ) ( OBJ-AT ?auto_43353079 ?auto_43353083 ) ( TRUCK-AT ?auto_43353080 ?auto_43353081 ) ( IN-CITY ?auto_43353081 ?auto_43353082 ) ( not ( = ?auto_43353078 ?auto_43353081 ) ) ( not ( = ?auto_43353083 ?auto_43353081 ) ) ( OBJ-AT ?auto_43353077 ?auto_43353081 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_43353079 ?auto_43353078 )
      ( DELIVER-2PKG-VERIFY ?auto_43353077 ?auto_43353079 ?auto_43353078 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_43402189 - OBJ
      ?auto_43402191 - OBJ
      ?auto_43402192 - OBJ
      ?auto_43402193 - OBJ
      ?auto_43402190 - LOCATION
    )
    :vars
    (
      ?auto_43402194 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43402191 ?auto_43402189 ) ( GREATER-THAN ?auto_43402192 ?auto_43402189 ) ( GREATER-THAN ?auto_43402192 ?auto_43402191 ) ( GREATER-THAN ?auto_43402193 ?auto_43402189 ) ( GREATER-THAN ?auto_43402193 ?auto_43402191 ) ( GREATER-THAN ?auto_43402193 ?auto_43402192 ) ( TRUCK-AT ?auto_43402194 ?auto_43402190 ) ( IN-TRUCK ?auto_43402193 ?auto_43402194 ) ( OBJ-AT ?auto_43402189 ?auto_43402190 ) ( OBJ-AT ?auto_43402191 ?auto_43402190 ) ( OBJ-AT ?auto_43402192 ?auto_43402190 ) ( not ( = ?auto_43402189 ?auto_43402191 ) ) ( not ( = ?auto_43402189 ?auto_43402192 ) ) ( not ( = ?auto_43402189 ?auto_43402193 ) ) ( not ( = ?auto_43402191 ?auto_43402192 ) ) ( not ( = ?auto_43402191 ?auto_43402193 ) ) ( not ( = ?auto_43402192 ?auto_43402193 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_43402193 ?auto_43402190 )
      ( DELIVER-4PKG-VERIFY ?auto_43402189 ?auto_43402191 ?auto_43402192 ?auto_43402193 ?auto_43402190 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_43435975 - OBJ
      ?auto_43435977 - OBJ
      ?auto_43435978 - OBJ
      ?auto_43435979 - OBJ
      ?auto_43435976 - LOCATION
    )
    :vars
    (
      ?auto_43435982 - TRUCK
      ?auto_43435981 - LOCATION
      ?auto_43435980 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43435977 ?auto_43435975 ) ( GREATER-THAN ?auto_43435978 ?auto_43435975 ) ( GREATER-THAN ?auto_43435978 ?auto_43435977 ) ( GREATER-THAN ?auto_43435979 ?auto_43435975 ) ( GREATER-THAN ?auto_43435979 ?auto_43435977 ) ( GREATER-THAN ?auto_43435979 ?auto_43435978 ) ( IN-TRUCK ?auto_43435979 ?auto_43435982 ) ( TRUCK-AT ?auto_43435982 ?auto_43435981 ) ( IN-CITY ?auto_43435981 ?auto_43435980 ) ( IN-CITY ?auto_43435976 ?auto_43435980 ) ( not ( = ?auto_43435976 ?auto_43435981 ) ) ( OBJ-AT ?auto_43435975 ?auto_43435976 ) ( not ( = ?auto_43435975 ?auto_43435979 ) ) ( OBJ-AT ?auto_43435977 ?auto_43435976 ) ( OBJ-AT ?auto_43435978 ?auto_43435976 ) ( not ( = ?auto_43435975 ?auto_43435977 ) ) ( not ( = ?auto_43435975 ?auto_43435978 ) ) ( not ( = ?auto_43435977 ?auto_43435978 ) ) ( not ( = ?auto_43435977 ?auto_43435979 ) ) ( not ( = ?auto_43435978 ?auto_43435979 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43435975 ?auto_43435979 ?auto_43435976 )
      ( DELIVER-4PKG-VERIFY ?auto_43435975 ?auto_43435977 ?auto_43435978 ?auto_43435979 ?auto_43435976 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_43479331 - OBJ
      ?auto_43479333 - OBJ
      ?auto_43479334 - OBJ
      ?auto_43479335 - OBJ
      ?auto_43479332 - LOCATION
    )
    :vars
    (
      ?auto_43479338 - TRUCK
      ?auto_43479337 - LOCATION
      ?auto_43479336 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43479333 ?auto_43479331 ) ( GREATER-THAN ?auto_43479334 ?auto_43479331 ) ( GREATER-THAN ?auto_43479334 ?auto_43479333 ) ( GREATER-THAN ?auto_43479335 ?auto_43479331 ) ( GREATER-THAN ?auto_43479335 ?auto_43479333 ) ( GREATER-THAN ?auto_43479335 ?auto_43479334 ) ( TRUCK-AT ?auto_43479338 ?auto_43479337 ) ( IN-CITY ?auto_43479337 ?auto_43479336 ) ( IN-CITY ?auto_43479332 ?auto_43479336 ) ( not ( = ?auto_43479332 ?auto_43479337 ) ) ( OBJ-AT ?auto_43479331 ?auto_43479332 ) ( not ( = ?auto_43479331 ?auto_43479335 ) ) ( OBJ-AT ?auto_43479335 ?auto_43479337 ) ( OBJ-AT ?auto_43479333 ?auto_43479332 ) ( OBJ-AT ?auto_43479334 ?auto_43479332 ) ( not ( = ?auto_43479331 ?auto_43479333 ) ) ( not ( = ?auto_43479331 ?auto_43479334 ) ) ( not ( = ?auto_43479333 ?auto_43479334 ) ) ( not ( = ?auto_43479333 ?auto_43479335 ) ) ( not ( = ?auto_43479334 ?auto_43479335 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43479331 ?auto_43479335 ?auto_43479332 )
      ( DELIVER-4PKG-VERIFY ?auto_43479331 ?auto_43479333 ?auto_43479334 ?auto_43479335 ?auto_43479332 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_43522687 - OBJ
      ?auto_43522689 - OBJ
      ?auto_43522690 - OBJ
      ?auto_43522691 - OBJ
      ?auto_43522688 - LOCATION
    )
    :vars
    (
      ?auto_43522692 - LOCATION
      ?auto_43522693 - CITY
      ?auto_43522694 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43522689 ?auto_43522687 ) ( GREATER-THAN ?auto_43522690 ?auto_43522687 ) ( GREATER-THAN ?auto_43522690 ?auto_43522689 ) ( GREATER-THAN ?auto_43522691 ?auto_43522687 ) ( GREATER-THAN ?auto_43522691 ?auto_43522689 ) ( GREATER-THAN ?auto_43522691 ?auto_43522690 ) ( IN-CITY ?auto_43522692 ?auto_43522693 ) ( IN-CITY ?auto_43522688 ?auto_43522693 ) ( not ( = ?auto_43522688 ?auto_43522692 ) ) ( OBJ-AT ?auto_43522687 ?auto_43522688 ) ( not ( = ?auto_43522687 ?auto_43522691 ) ) ( OBJ-AT ?auto_43522691 ?auto_43522692 ) ( TRUCK-AT ?auto_43522694 ?auto_43522688 ) ( OBJ-AT ?auto_43522689 ?auto_43522688 ) ( OBJ-AT ?auto_43522690 ?auto_43522688 ) ( not ( = ?auto_43522687 ?auto_43522689 ) ) ( not ( = ?auto_43522687 ?auto_43522690 ) ) ( not ( = ?auto_43522689 ?auto_43522690 ) ) ( not ( = ?auto_43522689 ?auto_43522691 ) ) ( not ( = ?auto_43522690 ?auto_43522691 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43522687 ?auto_43522691 ?auto_43522688 )
      ( DELIVER-4PKG-VERIFY ?auto_43522687 ?auto_43522689 ?auto_43522690 ?auto_43522691 ?auto_43522688 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_43609076 - OBJ
      ?auto_43609078 - OBJ
      ?auto_43609079 - OBJ
      ?auto_43609077 - LOCATION
    )
    :vars
    (
      ?auto_43609083 - LOCATION
      ?auto_43609080 - CITY
      ?auto_43609081 - TRUCK
      ?auto_43609082 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_43609078 ?auto_43609076 ) ( GREATER-THAN ?auto_43609079 ?auto_43609076 ) ( GREATER-THAN ?auto_43609079 ?auto_43609078 ) ( IN-CITY ?auto_43609083 ?auto_43609080 ) ( IN-CITY ?auto_43609077 ?auto_43609080 ) ( not ( = ?auto_43609077 ?auto_43609083 ) ) ( OBJ-AT ?auto_43609076 ?auto_43609077 ) ( not ( = ?auto_43609076 ?auto_43609079 ) ) ( OBJ-AT ?auto_43609079 ?auto_43609083 ) ( TRUCK-AT ?auto_43609081 ?auto_43609082 ) ( IN-CITY ?auto_43609082 ?auto_43609080 ) ( not ( = ?auto_43609077 ?auto_43609082 ) ) ( not ( = ?auto_43609083 ?auto_43609082 ) ) ( OBJ-AT ?auto_43609078 ?auto_43609077 ) ( not ( = ?auto_43609076 ?auto_43609078 ) ) ( not ( = ?auto_43609078 ?auto_43609079 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_43609076 ?auto_43609079 ?auto_43609077 )
      ( DELIVER-3PKG-VERIFY ?auto_43609076 ?auto_43609078 ?auto_43609079 ?auto_43609077 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_44209781 - OBJ
      ?auto_44209783 - OBJ
      ?auto_44209784 - OBJ
      ?auto_44209785 - OBJ
      ?auto_44209786 - OBJ
      ?auto_44209782 - LOCATION
    )
    :vars
    (
      ?auto_44209787 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_44209783 ?auto_44209781 ) ( GREATER-THAN ?auto_44209784 ?auto_44209781 ) ( GREATER-THAN ?auto_44209784 ?auto_44209783 ) ( GREATER-THAN ?auto_44209785 ?auto_44209781 ) ( GREATER-THAN ?auto_44209785 ?auto_44209783 ) ( GREATER-THAN ?auto_44209785 ?auto_44209784 ) ( GREATER-THAN ?auto_44209786 ?auto_44209781 ) ( GREATER-THAN ?auto_44209786 ?auto_44209783 ) ( GREATER-THAN ?auto_44209786 ?auto_44209784 ) ( GREATER-THAN ?auto_44209786 ?auto_44209785 ) ( TRUCK-AT ?auto_44209787 ?auto_44209782 ) ( IN-TRUCK ?auto_44209786 ?auto_44209787 ) ( OBJ-AT ?auto_44209781 ?auto_44209782 ) ( OBJ-AT ?auto_44209783 ?auto_44209782 ) ( OBJ-AT ?auto_44209784 ?auto_44209782 ) ( OBJ-AT ?auto_44209785 ?auto_44209782 ) ( not ( = ?auto_44209781 ?auto_44209783 ) ) ( not ( = ?auto_44209781 ?auto_44209784 ) ) ( not ( = ?auto_44209781 ?auto_44209785 ) ) ( not ( = ?auto_44209781 ?auto_44209786 ) ) ( not ( = ?auto_44209783 ?auto_44209784 ) ) ( not ( = ?auto_44209783 ?auto_44209785 ) ) ( not ( = ?auto_44209783 ?auto_44209786 ) ) ( not ( = ?auto_44209784 ?auto_44209785 ) ) ( not ( = ?auto_44209784 ?auto_44209786 ) ) ( not ( = ?auto_44209785 ?auto_44209786 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_44209786 ?auto_44209782 )
      ( DELIVER-5PKG-VERIFY ?auto_44209781 ?auto_44209783 ?auto_44209784 ?auto_44209785 ?auto_44209786 ?auto_44209782 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_44320501 - OBJ
      ?auto_44320503 - OBJ
      ?auto_44320504 - OBJ
      ?auto_44320505 - OBJ
      ?auto_44320506 - OBJ
      ?auto_44320502 - LOCATION
    )
    :vars
    (
      ?auto_44320507 - TRUCK
      ?auto_44320509 - LOCATION
      ?auto_44320508 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_44320503 ?auto_44320501 ) ( GREATER-THAN ?auto_44320504 ?auto_44320501 ) ( GREATER-THAN ?auto_44320504 ?auto_44320503 ) ( GREATER-THAN ?auto_44320505 ?auto_44320501 ) ( GREATER-THAN ?auto_44320505 ?auto_44320503 ) ( GREATER-THAN ?auto_44320505 ?auto_44320504 ) ( GREATER-THAN ?auto_44320506 ?auto_44320501 ) ( GREATER-THAN ?auto_44320506 ?auto_44320503 ) ( GREATER-THAN ?auto_44320506 ?auto_44320504 ) ( GREATER-THAN ?auto_44320506 ?auto_44320505 ) ( IN-TRUCK ?auto_44320506 ?auto_44320507 ) ( TRUCK-AT ?auto_44320507 ?auto_44320509 ) ( IN-CITY ?auto_44320509 ?auto_44320508 ) ( IN-CITY ?auto_44320502 ?auto_44320508 ) ( not ( = ?auto_44320502 ?auto_44320509 ) ) ( OBJ-AT ?auto_44320501 ?auto_44320502 ) ( not ( = ?auto_44320501 ?auto_44320506 ) ) ( OBJ-AT ?auto_44320503 ?auto_44320502 ) ( OBJ-AT ?auto_44320504 ?auto_44320502 ) ( OBJ-AT ?auto_44320505 ?auto_44320502 ) ( not ( = ?auto_44320501 ?auto_44320503 ) ) ( not ( = ?auto_44320501 ?auto_44320504 ) ) ( not ( = ?auto_44320501 ?auto_44320505 ) ) ( not ( = ?auto_44320503 ?auto_44320504 ) ) ( not ( = ?auto_44320503 ?auto_44320505 ) ) ( not ( = ?auto_44320503 ?auto_44320506 ) ) ( not ( = ?auto_44320504 ?auto_44320505 ) ) ( not ( = ?auto_44320504 ?auto_44320506 ) ) ( not ( = ?auto_44320505 ?auto_44320506 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_44320501 ?auto_44320506 ?auto_44320502 )
      ( DELIVER-5PKG-VERIFY ?auto_44320501 ?auto_44320503 ?auto_44320504 ?auto_44320505 ?auto_44320506 ?auto_44320502 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_44462466 - OBJ
      ?auto_44462468 - OBJ
      ?auto_44462469 - OBJ
      ?auto_44462470 - OBJ
      ?auto_44462471 - OBJ
      ?auto_44462467 - LOCATION
    )
    :vars
    (
      ?auto_44462474 - TRUCK
      ?auto_44462472 - LOCATION
      ?auto_44462473 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_44462468 ?auto_44462466 ) ( GREATER-THAN ?auto_44462469 ?auto_44462466 ) ( GREATER-THAN ?auto_44462469 ?auto_44462468 ) ( GREATER-THAN ?auto_44462470 ?auto_44462466 ) ( GREATER-THAN ?auto_44462470 ?auto_44462468 ) ( GREATER-THAN ?auto_44462470 ?auto_44462469 ) ( GREATER-THAN ?auto_44462471 ?auto_44462466 ) ( GREATER-THAN ?auto_44462471 ?auto_44462468 ) ( GREATER-THAN ?auto_44462471 ?auto_44462469 ) ( GREATER-THAN ?auto_44462471 ?auto_44462470 ) ( TRUCK-AT ?auto_44462474 ?auto_44462472 ) ( IN-CITY ?auto_44462472 ?auto_44462473 ) ( IN-CITY ?auto_44462467 ?auto_44462473 ) ( not ( = ?auto_44462467 ?auto_44462472 ) ) ( OBJ-AT ?auto_44462466 ?auto_44462467 ) ( not ( = ?auto_44462466 ?auto_44462471 ) ) ( OBJ-AT ?auto_44462471 ?auto_44462472 ) ( OBJ-AT ?auto_44462468 ?auto_44462467 ) ( OBJ-AT ?auto_44462469 ?auto_44462467 ) ( OBJ-AT ?auto_44462470 ?auto_44462467 ) ( not ( = ?auto_44462466 ?auto_44462468 ) ) ( not ( = ?auto_44462466 ?auto_44462469 ) ) ( not ( = ?auto_44462466 ?auto_44462470 ) ) ( not ( = ?auto_44462468 ?auto_44462469 ) ) ( not ( = ?auto_44462468 ?auto_44462470 ) ) ( not ( = ?auto_44462468 ?auto_44462471 ) ) ( not ( = ?auto_44462469 ?auto_44462470 ) ) ( not ( = ?auto_44462469 ?auto_44462471 ) ) ( not ( = ?auto_44462470 ?auto_44462471 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_44462466 ?auto_44462471 ?auto_44462467 )
      ( DELIVER-5PKG-VERIFY ?auto_44462466 ?auto_44462468 ?auto_44462469 ?auto_44462470 ?auto_44462471 ?auto_44462467 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_44604431 - OBJ
      ?auto_44604433 - OBJ
      ?auto_44604434 - OBJ
      ?auto_44604435 - OBJ
      ?auto_44604436 - OBJ
      ?auto_44604432 - LOCATION
    )
    :vars
    (
      ?auto_44604438 - LOCATION
      ?auto_44604437 - CITY
      ?auto_44604439 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_44604433 ?auto_44604431 ) ( GREATER-THAN ?auto_44604434 ?auto_44604431 ) ( GREATER-THAN ?auto_44604434 ?auto_44604433 ) ( GREATER-THAN ?auto_44604435 ?auto_44604431 ) ( GREATER-THAN ?auto_44604435 ?auto_44604433 ) ( GREATER-THAN ?auto_44604435 ?auto_44604434 ) ( GREATER-THAN ?auto_44604436 ?auto_44604431 ) ( GREATER-THAN ?auto_44604436 ?auto_44604433 ) ( GREATER-THAN ?auto_44604436 ?auto_44604434 ) ( GREATER-THAN ?auto_44604436 ?auto_44604435 ) ( IN-CITY ?auto_44604438 ?auto_44604437 ) ( IN-CITY ?auto_44604432 ?auto_44604437 ) ( not ( = ?auto_44604432 ?auto_44604438 ) ) ( OBJ-AT ?auto_44604431 ?auto_44604432 ) ( not ( = ?auto_44604431 ?auto_44604436 ) ) ( OBJ-AT ?auto_44604436 ?auto_44604438 ) ( TRUCK-AT ?auto_44604439 ?auto_44604432 ) ( OBJ-AT ?auto_44604433 ?auto_44604432 ) ( OBJ-AT ?auto_44604434 ?auto_44604432 ) ( OBJ-AT ?auto_44604435 ?auto_44604432 ) ( not ( = ?auto_44604431 ?auto_44604433 ) ) ( not ( = ?auto_44604431 ?auto_44604434 ) ) ( not ( = ?auto_44604431 ?auto_44604435 ) ) ( not ( = ?auto_44604433 ?auto_44604434 ) ) ( not ( = ?auto_44604433 ?auto_44604435 ) ) ( not ( = ?auto_44604433 ?auto_44604436 ) ) ( not ( = ?auto_44604434 ?auto_44604435 ) ) ( not ( = ?auto_44604434 ?auto_44604436 ) ) ( not ( = ?auto_44604435 ?auto_44604436 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_44604431 ?auto_44604436 ?auto_44604432 )
      ( DELIVER-5PKG-VERIFY ?auto_44604431 ?auto_44604433 ?auto_44604434 ?auto_44604435 ?auto_44604436 ?auto_44604432 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_47386987 - OBJ
      ?auto_47386989 - OBJ
      ?auto_47386990 - OBJ
      ?auto_47386991 - OBJ
      ?auto_47386992 - OBJ
      ?auto_47386993 - OBJ
      ?auto_47386988 - LOCATION
    )
    :vars
    (
      ?auto_47386994 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_47386989 ?auto_47386987 ) ( GREATER-THAN ?auto_47386990 ?auto_47386987 ) ( GREATER-THAN ?auto_47386990 ?auto_47386989 ) ( GREATER-THAN ?auto_47386991 ?auto_47386987 ) ( GREATER-THAN ?auto_47386991 ?auto_47386989 ) ( GREATER-THAN ?auto_47386991 ?auto_47386990 ) ( GREATER-THAN ?auto_47386992 ?auto_47386987 ) ( GREATER-THAN ?auto_47386992 ?auto_47386989 ) ( GREATER-THAN ?auto_47386992 ?auto_47386990 ) ( GREATER-THAN ?auto_47386992 ?auto_47386991 ) ( GREATER-THAN ?auto_47386993 ?auto_47386987 ) ( GREATER-THAN ?auto_47386993 ?auto_47386989 ) ( GREATER-THAN ?auto_47386993 ?auto_47386990 ) ( GREATER-THAN ?auto_47386993 ?auto_47386991 ) ( GREATER-THAN ?auto_47386993 ?auto_47386992 ) ( TRUCK-AT ?auto_47386994 ?auto_47386988 ) ( IN-TRUCK ?auto_47386993 ?auto_47386994 ) ( OBJ-AT ?auto_47386987 ?auto_47386988 ) ( OBJ-AT ?auto_47386989 ?auto_47386988 ) ( OBJ-AT ?auto_47386990 ?auto_47386988 ) ( OBJ-AT ?auto_47386991 ?auto_47386988 ) ( OBJ-AT ?auto_47386992 ?auto_47386988 ) ( not ( = ?auto_47386987 ?auto_47386989 ) ) ( not ( = ?auto_47386987 ?auto_47386990 ) ) ( not ( = ?auto_47386987 ?auto_47386991 ) ) ( not ( = ?auto_47386987 ?auto_47386992 ) ) ( not ( = ?auto_47386987 ?auto_47386993 ) ) ( not ( = ?auto_47386989 ?auto_47386990 ) ) ( not ( = ?auto_47386989 ?auto_47386991 ) ) ( not ( = ?auto_47386989 ?auto_47386992 ) ) ( not ( = ?auto_47386989 ?auto_47386993 ) ) ( not ( = ?auto_47386990 ?auto_47386991 ) ) ( not ( = ?auto_47386990 ?auto_47386992 ) ) ( not ( = ?auto_47386990 ?auto_47386993 ) ) ( not ( = ?auto_47386991 ?auto_47386992 ) ) ( not ( = ?auto_47386991 ?auto_47386993 ) ) ( not ( = ?auto_47386992 ?auto_47386993 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_47386993 ?auto_47386988 )
      ( DELIVER-6PKG-VERIFY ?auto_47386987 ?auto_47386989 ?auto_47386990 ?auto_47386991 ?auto_47386992 ?auto_47386993 ?auto_47386988 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_47687397 - OBJ
      ?auto_47687399 - OBJ
      ?auto_47687400 - OBJ
      ?auto_47687401 - OBJ
      ?auto_47687402 - OBJ
      ?auto_47687403 - OBJ
      ?auto_47687398 - LOCATION
    )
    :vars
    (
      ?auto_47687406 - TRUCK
      ?auto_47687405 - LOCATION
      ?auto_47687404 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_47687399 ?auto_47687397 ) ( GREATER-THAN ?auto_47687400 ?auto_47687397 ) ( GREATER-THAN ?auto_47687400 ?auto_47687399 ) ( GREATER-THAN ?auto_47687401 ?auto_47687397 ) ( GREATER-THAN ?auto_47687401 ?auto_47687399 ) ( GREATER-THAN ?auto_47687401 ?auto_47687400 ) ( GREATER-THAN ?auto_47687402 ?auto_47687397 ) ( GREATER-THAN ?auto_47687402 ?auto_47687399 ) ( GREATER-THAN ?auto_47687402 ?auto_47687400 ) ( GREATER-THAN ?auto_47687402 ?auto_47687401 ) ( GREATER-THAN ?auto_47687403 ?auto_47687397 ) ( GREATER-THAN ?auto_47687403 ?auto_47687399 ) ( GREATER-THAN ?auto_47687403 ?auto_47687400 ) ( GREATER-THAN ?auto_47687403 ?auto_47687401 ) ( GREATER-THAN ?auto_47687403 ?auto_47687402 ) ( IN-TRUCK ?auto_47687403 ?auto_47687406 ) ( TRUCK-AT ?auto_47687406 ?auto_47687405 ) ( IN-CITY ?auto_47687405 ?auto_47687404 ) ( IN-CITY ?auto_47687398 ?auto_47687404 ) ( not ( = ?auto_47687398 ?auto_47687405 ) ) ( OBJ-AT ?auto_47687397 ?auto_47687398 ) ( not ( = ?auto_47687397 ?auto_47687403 ) ) ( OBJ-AT ?auto_47687399 ?auto_47687398 ) ( OBJ-AT ?auto_47687400 ?auto_47687398 ) ( OBJ-AT ?auto_47687401 ?auto_47687398 ) ( OBJ-AT ?auto_47687402 ?auto_47687398 ) ( not ( = ?auto_47687397 ?auto_47687399 ) ) ( not ( = ?auto_47687397 ?auto_47687400 ) ) ( not ( = ?auto_47687397 ?auto_47687401 ) ) ( not ( = ?auto_47687397 ?auto_47687402 ) ) ( not ( = ?auto_47687399 ?auto_47687400 ) ) ( not ( = ?auto_47687399 ?auto_47687401 ) ) ( not ( = ?auto_47687399 ?auto_47687402 ) ) ( not ( = ?auto_47687399 ?auto_47687403 ) ) ( not ( = ?auto_47687400 ?auto_47687401 ) ) ( not ( = ?auto_47687400 ?auto_47687402 ) ) ( not ( = ?auto_47687400 ?auto_47687403 ) ) ( not ( = ?auto_47687401 ?auto_47687402 ) ) ( not ( = ?auto_47687401 ?auto_47687403 ) ) ( not ( = ?auto_47687402 ?auto_47687403 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_47687397 ?auto_47687403 ?auto_47687398 )
      ( DELIVER-6PKG-VERIFY ?auto_47687397 ?auto_47687399 ?auto_47687400 ?auto_47687401 ?auto_47687402 ?auto_47687403 ?auto_47687398 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_48059619 - OBJ
      ?auto_48059621 - OBJ
      ?auto_48059622 - OBJ
      ?auto_48059623 - OBJ
      ?auto_48059624 - OBJ
      ?auto_48059625 - OBJ
      ?auto_48059620 - LOCATION
    )
    :vars
    (
      ?auto_48059628 - TRUCK
      ?auto_48059627 - LOCATION
      ?auto_48059626 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_48059621 ?auto_48059619 ) ( GREATER-THAN ?auto_48059622 ?auto_48059619 ) ( GREATER-THAN ?auto_48059622 ?auto_48059621 ) ( GREATER-THAN ?auto_48059623 ?auto_48059619 ) ( GREATER-THAN ?auto_48059623 ?auto_48059621 ) ( GREATER-THAN ?auto_48059623 ?auto_48059622 ) ( GREATER-THAN ?auto_48059624 ?auto_48059619 ) ( GREATER-THAN ?auto_48059624 ?auto_48059621 ) ( GREATER-THAN ?auto_48059624 ?auto_48059622 ) ( GREATER-THAN ?auto_48059624 ?auto_48059623 ) ( GREATER-THAN ?auto_48059625 ?auto_48059619 ) ( GREATER-THAN ?auto_48059625 ?auto_48059621 ) ( GREATER-THAN ?auto_48059625 ?auto_48059622 ) ( GREATER-THAN ?auto_48059625 ?auto_48059623 ) ( GREATER-THAN ?auto_48059625 ?auto_48059624 ) ( TRUCK-AT ?auto_48059628 ?auto_48059627 ) ( IN-CITY ?auto_48059627 ?auto_48059626 ) ( IN-CITY ?auto_48059620 ?auto_48059626 ) ( not ( = ?auto_48059620 ?auto_48059627 ) ) ( OBJ-AT ?auto_48059619 ?auto_48059620 ) ( not ( = ?auto_48059619 ?auto_48059625 ) ) ( OBJ-AT ?auto_48059625 ?auto_48059627 ) ( OBJ-AT ?auto_48059621 ?auto_48059620 ) ( OBJ-AT ?auto_48059622 ?auto_48059620 ) ( OBJ-AT ?auto_48059623 ?auto_48059620 ) ( OBJ-AT ?auto_48059624 ?auto_48059620 ) ( not ( = ?auto_48059619 ?auto_48059621 ) ) ( not ( = ?auto_48059619 ?auto_48059622 ) ) ( not ( = ?auto_48059619 ?auto_48059623 ) ) ( not ( = ?auto_48059619 ?auto_48059624 ) ) ( not ( = ?auto_48059621 ?auto_48059622 ) ) ( not ( = ?auto_48059621 ?auto_48059623 ) ) ( not ( = ?auto_48059621 ?auto_48059624 ) ) ( not ( = ?auto_48059621 ?auto_48059625 ) ) ( not ( = ?auto_48059622 ?auto_48059623 ) ) ( not ( = ?auto_48059622 ?auto_48059624 ) ) ( not ( = ?auto_48059622 ?auto_48059625 ) ) ( not ( = ?auto_48059623 ?auto_48059624 ) ) ( not ( = ?auto_48059623 ?auto_48059625 ) ) ( not ( = ?auto_48059624 ?auto_48059625 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48059619 ?auto_48059625 ?auto_48059620 )
      ( DELIVER-6PKG-VERIFY ?auto_48059619 ?auto_48059621 ?auto_48059622 ?auto_48059623 ?auto_48059624 ?auto_48059625 ?auto_48059620 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_48431841 - OBJ
      ?auto_48431843 - OBJ
      ?auto_48431844 - OBJ
      ?auto_48431845 - OBJ
      ?auto_48431846 - OBJ
      ?auto_48431847 - OBJ
      ?auto_48431842 - LOCATION
    )
    :vars
    (
      ?auto_48431850 - LOCATION
      ?auto_48431849 - CITY
      ?auto_48431848 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_48431843 ?auto_48431841 ) ( GREATER-THAN ?auto_48431844 ?auto_48431841 ) ( GREATER-THAN ?auto_48431844 ?auto_48431843 ) ( GREATER-THAN ?auto_48431845 ?auto_48431841 ) ( GREATER-THAN ?auto_48431845 ?auto_48431843 ) ( GREATER-THAN ?auto_48431845 ?auto_48431844 ) ( GREATER-THAN ?auto_48431846 ?auto_48431841 ) ( GREATER-THAN ?auto_48431846 ?auto_48431843 ) ( GREATER-THAN ?auto_48431846 ?auto_48431844 ) ( GREATER-THAN ?auto_48431846 ?auto_48431845 ) ( GREATER-THAN ?auto_48431847 ?auto_48431841 ) ( GREATER-THAN ?auto_48431847 ?auto_48431843 ) ( GREATER-THAN ?auto_48431847 ?auto_48431844 ) ( GREATER-THAN ?auto_48431847 ?auto_48431845 ) ( GREATER-THAN ?auto_48431847 ?auto_48431846 ) ( IN-CITY ?auto_48431850 ?auto_48431849 ) ( IN-CITY ?auto_48431842 ?auto_48431849 ) ( not ( = ?auto_48431842 ?auto_48431850 ) ) ( OBJ-AT ?auto_48431841 ?auto_48431842 ) ( not ( = ?auto_48431841 ?auto_48431847 ) ) ( OBJ-AT ?auto_48431847 ?auto_48431850 ) ( TRUCK-AT ?auto_48431848 ?auto_48431842 ) ( OBJ-AT ?auto_48431843 ?auto_48431842 ) ( OBJ-AT ?auto_48431844 ?auto_48431842 ) ( OBJ-AT ?auto_48431845 ?auto_48431842 ) ( OBJ-AT ?auto_48431846 ?auto_48431842 ) ( not ( = ?auto_48431841 ?auto_48431843 ) ) ( not ( = ?auto_48431841 ?auto_48431844 ) ) ( not ( = ?auto_48431841 ?auto_48431845 ) ) ( not ( = ?auto_48431841 ?auto_48431846 ) ) ( not ( = ?auto_48431843 ?auto_48431844 ) ) ( not ( = ?auto_48431843 ?auto_48431845 ) ) ( not ( = ?auto_48431843 ?auto_48431846 ) ) ( not ( = ?auto_48431843 ?auto_48431847 ) ) ( not ( = ?auto_48431844 ?auto_48431845 ) ) ( not ( = ?auto_48431844 ?auto_48431846 ) ) ( not ( = ?auto_48431844 ?auto_48431847 ) ) ( not ( = ?auto_48431845 ?auto_48431846 ) ) ( not ( = ?auto_48431845 ?auto_48431847 ) ) ( not ( = ?auto_48431846 ?auto_48431847 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_48431841 ?auto_48431847 ?auto_48431842 )
      ( DELIVER-6PKG-VERIFY ?auto_48431841 ?auto_48431843 ?auto_48431844 ?auto_48431845 ?auto_48431846 ?auto_48431847 ?auto_48431842 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_49118000 - OBJ
      ?auto_49118002 - OBJ
      ?auto_49118003 - OBJ
      ?auto_49118004 - OBJ
      ?auto_49118001 - LOCATION
    )
    :vars
    (
      ?auto_49118005 - LOCATION
      ?auto_49118006 - CITY
      ?auto_49118007 - TRUCK
      ?auto_49118008 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_49118002 ?auto_49118000 ) ( GREATER-THAN ?auto_49118003 ?auto_49118000 ) ( GREATER-THAN ?auto_49118003 ?auto_49118002 ) ( GREATER-THAN ?auto_49118004 ?auto_49118000 ) ( GREATER-THAN ?auto_49118004 ?auto_49118002 ) ( GREATER-THAN ?auto_49118004 ?auto_49118003 ) ( IN-CITY ?auto_49118005 ?auto_49118006 ) ( IN-CITY ?auto_49118001 ?auto_49118006 ) ( not ( = ?auto_49118001 ?auto_49118005 ) ) ( OBJ-AT ?auto_49118000 ?auto_49118001 ) ( not ( = ?auto_49118000 ?auto_49118004 ) ) ( OBJ-AT ?auto_49118004 ?auto_49118005 ) ( TRUCK-AT ?auto_49118007 ?auto_49118008 ) ( IN-CITY ?auto_49118008 ?auto_49118006 ) ( not ( = ?auto_49118001 ?auto_49118008 ) ) ( not ( = ?auto_49118005 ?auto_49118008 ) ) ( OBJ-AT ?auto_49118002 ?auto_49118001 ) ( OBJ-AT ?auto_49118003 ?auto_49118001 ) ( not ( = ?auto_49118000 ?auto_49118002 ) ) ( not ( = ?auto_49118000 ?auto_49118003 ) ) ( not ( = ?auto_49118002 ?auto_49118003 ) ) ( not ( = ?auto_49118002 ?auto_49118004 ) ) ( not ( = ?auto_49118003 ?auto_49118004 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_49118000 ?auto_49118004 ?auto_49118001 )
      ( DELIVER-4PKG-VERIFY ?auto_49118000 ?auto_49118002 ?auto_49118003 ?auto_49118004 ?auto_49118001 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_49125438 - OBJ
      ?auto_49125440 - OBJ
      ?auto_49125441 - OBJ
      ?auto_49125442 - OBJ
      ?auto_49125443 - OBJ
      ?auto_49125439 - LOCATION
    )
    :vars
    (
      ?auto_49125444 - LOCATION
      ?auto_49125445 - CITY
      ?auto_49125446 - TRUCK
      ?auto_49125447 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_49125440 ?auto_49125438 ) ( GREATER-THAN ?auto_49125441 ?auto_49125438 ) ( GREATER-THAN ?auto_49125441 ?auto_49125440 ) ( GREATER-THAN ?auto_49125442 ?auto_49125438 ) ( GREATER-THAN ?auto_49125442 ?auto_49125440 ) ( GREATER-THAN ?auto_49125442 ?auto_49125441 ) ( GREATER-THAN ?auto_49125443 ?auto_49125438 ) ( GREATER-THAN ?auto_49125443 ?auto_49125440 ) ( GREATER-THAN ?auto_49125443 ?auto_49125441 ) ( GREATER-THAN ?auto_49125443 ?auto_49125442 ) ( IN-CITY ?auto_49125444 ?auto_49125445 ) ( IN-CITY ?auto_49125439 ?auto_49125445 ) ( not ( = ?auto_49125439 ?auto_49125444 ) ) ( OBJ-AT ?auto_49125438 ?auto_49125439 ) ( not ( = ?auto_49125438 ?auto_49125443 ) ) ( OBJ-AT ?auto_49125443 ?auto_49125444 ) ( TRUCK-AT ?auto_49125446 ?auto_49125447 ) ( IN-CITY ?auto_49125447 ?auto_49125445 ) ( not ( = ?auto_49125439 ?auto_49125447 ) ) ( not ( = ?auto_49125444 ?auto_49125447 ) ) ( OBJ-AT ?auto_49125440 ?auto_49125439 ) ( OBJ-AT ?auto_49125441 ?auto_49125439 ) ( OBJ-AT ?auto_49125442 ?auto_49125439 ) ( not ( = ?auto_49125438 ?auto_49125440 ) ) ( not ( = ?auto_49125438 ?auto_49125441 ) ) ( not ( = ?auto_49125438 ?auto_49125442 ) ) ( not ( = ?auto_49125440 ?auto_49125441 ) ) ( not ( = ?auto_49125440 ?auto_49125442 ) ) ( not ( = ?auto_49125440 ?auto_49125443 ) ) ( not ( = ?auto_49125441 ?auto_49125442 ) ) ( not ( = ?auto_49125441 ?auto_49125443 ) ) ( not ( = ?auto_49125442 ?auto_49125443 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_49125438 ?auto_49125443 ?auto_49125439 )
      ( DELIVER-5PKG-VERIFY ?auto_49125438 ?auto_49125440 ?auto_49125441 ?auto_49125442 ?auto_49125443 ?auto_49125439 ) )
  )

)

