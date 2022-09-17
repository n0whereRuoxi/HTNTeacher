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
      ?auto_191797 - OBJ
      ?auto_191796 - LOCATION
    )
    :vars
    (
      ?auto_191799 - LOCATION
      ?auto_191800 - CITY
      ?auto_191798 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191799 ?auto_191800 ) ( IN-CITY ?auto_191796 ?auto_191800 ) ( not ( = ?auto_191796 ?auto_191799 ) ) ( OBJ-AT ?auto_191797 ?auto_191799 ) ( TRUCK-AT ?auto_191798 ?auto_191796 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_191798 ?auto_191796 ?auto_191799 ?auto_191800 )
      ( !LOAD-TRUCK ?auto_191797 ?auto_191798 ?auto_191799 )
      ( !DRIVE-TRUCK ?auto_191798 ?auto_191799 ?auto_191796 ?auto_191800 )
      ( !UNLOAD-TRUCK ?auto_191797 ?auto_191798 ?auto_191796 )
      ( DELIVER-1PKG-VERIFY ?auto_191797 ?auto_191796 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_191804 - OBJ
      ?auto_191803 - LOCATION
    )
    :vars
    (
      ?auto_191806 - LOCATION
      ?auto_191807 - CITY
      ?auto_191805 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191806 ?auto_191807 ) ( IN-CITY ?auto_191803 ?auto_191807 ) ( not ( = ?auto_191803 ?auto_191806 ) ) ( OBJ-AT ?auto_191804 ?auto_191806 ) ( TRUCK-AT ?auto_191805 ?auto_191803 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_191805 ?auto_191803 ?auto_191806 ?auto_191807 )
      ( !LOAD-TRUCK ?auto_191804 ?auto_191805 ?auto_191806 )
      ( !DRIVE-TRUCK ?auto_191805 ?auto_191806 ?auto_191803 ?auto_191807 )
      ( !UNLOAD-TRUCK ?auto_191804 ?auto_191805 ?auto_191803 )
      ( DELIVER-1PKG-VERIFY ?auto_191804 ?auto_191803 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_191818 - OBJ
      ?auto_191819 - OBJ
      ?auto_191817 - LOCATION
    )
    :vars
    (
      ?auto_191822 - LOCATION
      ?auto_191820 - CITY
      ?auto_191823 - LOCATION
      ?auto_191821 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191822 ?auto_191820 ) ( IN-CITY ?auto_191817 ?auto_191820 ) ( not ( = ?auto_191817 ?auto_191822 ) ) ( OBJ-AT ?auto_191819 ?auto_191822 ) ( IN-CITY ?auto_191823 ?auto_191820 ) ( not ( = ?auto_191817 ?auto_191823 ) ) ( OBJ-AT ?auto_191818 ?auto_191823 ) ( TRUCK-AT ?auto_191821 ?auto_191817 ) ( not ( = ?auto_191818 ?auto_191819 ) ) ( not ( = ?auto_191822 ?auto_191823 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_191818 ?auto_191817 )
      ( DELIVER-1PKG ?auto_191819 ?auto_191817 )
      ( DELIVER-2PKG-VERIFY ?auto_191818 ?auto_191819 ?auto_191817 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_191825 - OBJ
      ?auto_191826 - OBJ
      ?auto_191824 - LOCATION
    )
    :vars
    (
      ?auto_191828 - LOCATION
      ?auto_191830 - CITY
      ?auto_191829 - LOCATION
      ?auto_191827 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191828 ?auto_191830 ) ( IN-CITY ?auto_191824 ?auto_191830 ) ( not ( = ?auto_191824 ?auto_191828 ) ) ( OBJ-AT ?auto_191825 ?auto_191828 ) ( IN-CITY ?auto_191829 ?auto_191830 ) ( not ( = ?auto_191824 ?auto_191829 ) ) ( OBJ-AT ?auto_191826 ?auto_191829 ) ( TRUCK-AT ?auto_191827 ?auto_191824 ) ( not ( = ?auto_191826 ?auto_191825 ) ) ( not ( = ?auto_191828 ?auto_191829 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191826 ?auto_191825 ?auto_191824 )
      ( DELIVER-2PKG-VERIFY ?auto_191825 ?auto_191826 ?auto_191824 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_191842 - OBJ
      ?auto_191841 - LOCATION
    )
    :vars
    (
      ?auto_191844 - LOCATION
      ?auto_191845 - CITY
      ?auto_191843 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191844 ?auto_191845 ) ( IN-CITY ?auto_191841 ?auto_191845 ) ( not ( = ?auto_191841 ?auto_191844 ) ) ( OBJ-AT ?auto_191842 ?auto_191844 ) ( TRUCK-AT ?auto_191843 ?auto_191841 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_191843 ?auto_191841 ?auto_191844 ?auto_191845 )
      ( !LOAD-TRUCK ?auto_191842 ?auto_191843 ?auto_191844 )
      ( !DRIVE-TRUCK ?auto_191843 ?auto_191844 ?auto_191841 ?auto_191845 )
      ( !UNLOAD-TRUCK ?auto_191842 ?auto_191843 ?auto_191841 )
      ( DELIVER-1PKG-VERIFY ?auto_191842 ?auto_191841 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_191933 - OBJ
      ?auto_191934 - OBJ
      ?auto_191935 - OBJ
      ?auto_191932 - LOCATION
    )
    :vars
    (
      ?auto_191938 - LOCATION
      ?auto_191936 - CITY
      ?auto_191939 - LOCATION
      ?auto_191940 - LOCATION
      ?auto_191937 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191938 ?auto_191936 ) ( IN-CITY ?auto_191932 ?auto_191936 ) ( not ( = ?auto_191932 ?auto_191938 ) ) ( OBJ-AT ?auto_191935 ?auto_191938 ) ( IN-CITY ?auto_191939 ?auto_191936 ) ( not ( = ?auto_191932 ?auto_191939 ) ) ( OBJ-AT ?auto_191934 ?auto_191939 ) ( IN-CITY ?auto_191940 ?auto_191936 ) ( not ( = ?auto_191932 ?auto_191940 ) ) ( OBJ-AT ?auto_191933 ?auto_191940 ) ( TRUCK-AT ?auto_191937 ?auto_191932 ) ( not ( = ?auto_191933 ?auto_191934 ) ) ( not ( = ?auto_191939 ?auto_191940 ) ) ( not ( = ?auto_191933 ?auto_191935 ) ) ( not ( = ?auto_191934 ?auto_191935 ) ) ( not ( = ?auto_191938 ?auto_191939 ) ) ( not ( = ?auto_191938 ?auto_191940 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191934 ?auto_191933 ?auto_191932 )
      ( DELIVER-1PKG ?auto_191935 ?auto_191932 )
      ( DELIVER-3PKG-VERIFY ?auto_191933 ?auto_191934 ?auto_191935 ?auto_191932 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_191952 - OBJ
      ?auto_191953 - OBJ
      ?auto_191954 - OBJ
      ?auto_191951 - LOCATION
    )
    :vars
    (
      ?auto_191955 - LOCATION
      ?auto_191959 - CITY
      ?auto_191957 - LOCATION
      ?auto_191956 - LOCATION
      ?auto_191958 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191955 ?auto_191959 ) ( IN-CITY ?auto_191951 ?auto_191959 ) ( not ( = ?auto_191951 ?auto_191955 ) ) ( OBJ-AT ?auto_191953 ?auto_191955 ) ( IN-CITY ?auto_191957 ?auto_191959 ) ( not ( = ?auto_191951 ?auto_191957 ) ) ( OBJ-AT ?auto_191954 ?auto_191957 ) ( IN-CITY ?auto_191956 ?auto_191959 ) ( not ( = ?auto_191951 ?auto_191956 ) ) ( OBJ-AT ?auto_191952 ?auto_191956 ) ( TRUCK-AT ?auto_191958 ?auto_191951 ) ( not ( = ?auto_191952 ?auto_191954 ) ) ( not ( = ?auto_191957 ?auto_191956 ) ) ( not ( = ?auto_191952 ?auto_191953 ) ) ( not ( = ?auto_191954 ?auto_191953 ) ) ( not ( = ?auto_191955 ?auto_191957 ) ) ( not ( = ?auto_191955 ?auto_191956 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_191952 ?auto_191954 ?auto_191953 ?auto_191951 )
      ( DELIVER-3PKG-VERIFY ?auto_191952 ?auto_191953 ?auto_191954 ?auto_191951 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_191971 - OBJ
      ?auto_191972 - OBJ
      ?auto_191973 - OBJ
      ?auto_191970 - LOCATION
    )
    :vars
    (
      ?auto_191975 - LOCATION
      ?auto_191978 - CITY
      ?auto_191974 - LOCATION
      ?auto_191977 - LOCATION
      ?auto_191976 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191975 ?auto_191978 ) ( IN-CITY ?auto_191970 ?auto_191978 ) ( not ( = ?auto_191970 ?auto_191975 ) ) ( OBJ-AT ?auto_191973 ?auto_191975 ) ( IN-CITY ?auto_191974 ?auto_191978 ) ( not ( = ?auto_191970 ?auto_191974 ) ) ( OBJ-AT ?auto_191971 ?auto_191974 ) ( IN-CITY ?auto_191977 ?auto_191978 ) ( not ( = ?auto_191970 ?auto_191977 ) ) ( OBJ-AT ?auto_191972 ?auto_191977 ) ( TRUCK-AT ?auto_191976 ?auto_191970 ) ( not ( = ?auto_191972 ?auto_191971 ) ) ( not ( = ?auto_191974 ?auto_191977 ) ) ( not ( = ?auto_191972 ?auto_191973 ) ) ( not ( = ?auto_191971 ?auto_191973 ) ) ( not ( = ?auto_191975 ?auto_191974 ) ) ( not ( = ?auto_191975 ?auto_191977 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_191972 ?auto_191973 ?auto_191971 ?auto_191970 )
      ( DELIVER-3PKG-VERIFY ?auto_191971 ?auto_191972 ?auto_191973 ?auto_191970 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_191990 - OBJ
      ?auto_191991 - OBJ
      ?auto_191992 - OBJ
      ?auto_191989 - LOCATION
    )
    :vars
    (
      ?auto_191994 - LOCATION
      ?auto_191997 - CITY
      ?auto_191993 - LOCATION
      ?auto_191996 - LOCATION
      ?auto_191995 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191994 ?auto_191997 ) ( IN-CITY ?auto_191989 ?auto_191997 ) ( not ( = ?auto_191989 ?auto_191994 ) ) ( OBJ-AT ?auto_191991 ?auto_191994 ) ( IN-CITY ?auto_191993 ?auto_191997 ) ( not ( = ?auto_191989 ?auto_191993 ) ) ( OBJ-AT ?auto_191990 ?auto_191993 ) ( IN-CITY ?auto_191996 ?auto_191997 ) ( not ( = ?auto_191989 ?auto_191996 ) ) ( OBJ-AT ?auto_191992 ?auto_191996 ) ( TRUCK-AT ?auto_191995 ?auto_191989 ) ( not ( = ?auto_191992 ?auto_191990 ) ) ( not ( = ?auto_191993 ?auto_191996 ) ) ( not ( = ?auto_191992 ?auto_191991 ) ) ( not ( = ?auto_191990 ?auto_191991 ) ) ( not ( = ?auto_191994 ?auto_191993 ) ) ( not ( = ?auto_191994 ?auto_191996 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_191992 ?auto_191991 ?auto_191990 ?auto_191989 )
      ( DELIVER-3PKG-VERIFY ?auto_191990 ?auto_191991 ?auto_191992 ?auto_191989 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_192029 - OBJ
      ?auto_192030 - OBJ
      ?auto_192031 - OBJ
      ?auto_192028 - LOCATION
    )
    :vars
    (
      ?auto_192033 - LOCATION
      ?auto_192036 - CITY
      ?auto_192032 - LOCATION
      ?auto_192035 - LOCATION
      ?auto_192034 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192033 ?auto_192036 ) ( IN-CITY ?auto_192028 ?auto_192036 ) ( not ( = ?auto_192028 ?auto_192033 ) ) ( OBJ-AT ?auto_192029 ?auto_192033 ) ( IN-CITY ?auto_192032 ?auto_192036 ) ( not ( = ?auto_192028 ?auto_192032 ) ) ( OBJ-AT ?auto_192031 ?auto_192032 ) ( IN-CITY ?auto_192035 ?auto_192036 ) ( not ( = ?auto_192028 ?auto_192035 ) ) ( OBJ-AT ?auto_192030 ?auto_192035 ) ( TRUCK-AT ?auto_192034 ?auto_192028 ) ( not ( = ?auto_192030 ?auto_192031 ) ) ( not ( = ?auto_192032 ?auto_192035 ) ) ( not ( = ?auto_192030 ?auto_192029 ) ) ( not ( = ?auto_192031 ?auto_192029 ) ) ( not ( = ?auto_192033 ?auto_192032 ) ) ( not ( = ?auto_192033 ?auto_192035 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_192030 ?auto_192029 ?auto_192031 ?auto_192028 )
      ( DELIVER-3PKG-VERIFY ?auto_192029 ?auto_192030 ?auto_192031 ?auto_192028 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_192048 - OBJ
      ?auto_192049 - OBJ
      ?auto_192050 - OBJ
      ?auto_192047 - LOCATION
    )
    :vars
    (
      ?auto_192052 - LOCATION
      ?auto_192055 - CITY
      ?auto_192051 - LOCATION
      ?auto_192054 - LOCATION
      ?auto_192053 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192052 ?auto_192055 ) ( IN-CITY ?auto_192047 ?auto_192055 ) ( not ( = ?auto_192047 ?auto_192052 ) ) ( OBJ-AT ?auto_192048 ?auto_192052 ) ( IN-CITY ?auto_192051 ?auto_192055 ) ( not ( = ?auto_192047 ?auto_192051 ) ) ( OBJ-AT ?auto_192049 ?auto_192051 ) ( IN-CITY ?auto_192054 ?auto_192055 ) ( not ( = ?auto_192047 ?auto_192054 ) ) ( OBJ-AT ?auto_192050 ?auto_192054 ) ( TRUCK-AT ?auto_192053 ?auto_192047 ) ( not ( = ?auto_192050 ?auto_192049 ) ) ( not ( = ?auto_192051 ?auto_192054 ) ) ( not ( = ?auto_192050 ?auto_192048 ) ) ( not ( = ?auto_192049 ?auto_192048 ) ) ( not ( = ?auto_192052 ?auto_192051 ) ) ( not ( = ?auto_192052 ?auto_192054 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_192050 ?auto_192048 ?auto_192049 ?auto_192047 )
      ( DELIVER-3PKG-VERIFY ?auto_192048 ?auto_192049 ?auto_192050 ?auto_192047 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_192110 - OBJ
      ?auto_192109 - LOCATION
    )
    :vars
    (
      ?auto_192112 - LOCATION
      ?auto_192113 - CITY
      ?auto_192111 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192112 ?auto_192113 ) ( IN-CITY ?auto_192109 ?auto_192113 ) ( not ( = ?auto_192109 ?auto_192112 ) ) ( OBJ-AT ?auto_192110 ?auto_192112 ) ( TRUCK-AT ?auto_192111 ?auto_192109 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_192111 ?auto_192109 ?auto_192112 ?auto_192113 )
      ( !LOAD-TRUCK ?auto_192110 ?auto_192111 ?auto_192112 )
      ( !DRIVE-TRUCK ?auto_192111 ?auto_192112 ?auto_192109 ?auto_192113 )
      ( !UNLOAD-TRUCK ?auto_192110 ?auto_192111 ?auto_192109 )
      ( DELIVER-1PKG-VERIFY ?auto_192110 ?auto_192109 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193101 - OBJ
      ?auto_193102 - OBJ
      ?auto_193103 - OBJ
      ?auto_193104 - OBJ
      ?auto_193100 - LOCATION
    )
    :vars
    (
      ?auto_193105 - LOCATION
      ?auto_193107 - CITY
      ?auto_193109 - LOCATION
      ?auto_193108 - LOCATION
      ?auto_193110 - LOCATION
      ?auto_193106 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193105 ?auto_193107 ) ( IN-CITY ?auto_193100 ?auto_193107 ) ( not ( = ?auto_193100 ?auto_193105 ) ) ( OBJ-AT ?auto_193104 ?auto_193105 ) ( IN-CITY ?auto_193109 ?auto_193107 ) ( not ( = ?auto_193100 ?auto_193109 ) ) ( OBJ-AT ?auto_193103 ?auto_193109 ) ( IN-CITY ?auto_193108 ?auto_193107 ) ( not ( = ?auto_193100 ?auto_193108 ) ) ( OBJ-AT ?auto_193102 ?auto_193108 ) ( IN-CITY ?auto_193110 ?auto_193107 ) ( not ( = ?auto_193100 ?auto_193110 ) ) ( OBJ-AT ?auto_193101 ?auto_193110 ) ( TRUCK-AT ?auto_193106 ?auto_193100 ) ( not ( = ?auto_193101 ?auto_193102 ) ) ( not ( = ?auto_193108 ?auto_193110 ) ) ( not ( = ?auto_193101 ?auto_193103 ) ) ( not ( = ?auto_193102 ?auto_193103 ) ) ( not ( = ?auto_193109 ?auto_193108 ) ) ( not ( = ?auto_193109 ?auto_193110 ) ) ( not ( = ?auto_193101 ?auto_193104 ) ) ( not ( = ?auto_193102 ?auto_193104 ) ) ( not ( = ?auto_193103 ?auto_193104 ) ) ( not ( = ?auto_193105 ?auto_193109 ) ) ( not ( = ?auto_193105 ?auto_193108 ) ) ( not ( = ?auto_193105 ?auto_193110 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_193101 ?auto_193103 ?auto_193102 ?auto_193100 )
      ( DELIVER-1PKG ?auto_193104 ?auto_193100 )
      ( DELIVER-4PKG-VERIFY ?auto_193101 ?auto_193102 ?auto_193103 ?auto_193104 ?auto_193100 ) )
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
      ?auto_193144 - LOCATION
      ?auto_193141 - CITY
      ?auto_193143 - LOCATION
      ?auto_193145 - LOCATION
      ?auto_193140 - LOCATION
      ?auto_193142 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193144 ?auto_193141 ) ( IN-CITY ?auto_193135 ?auto_193141 ) ( not ( = ?auto_193135 ?auto_193144 ) ) ( OBJ-AT ?auto_193138 ?auto_193144 ) ( IN-CITY ?auto_193143 ?auto_193141 ) ( not ( = ?auto_193135 ?auto_193143 ) ) ( OBJ-AT ?auto_193139 ?auto_193143 ) ( IN-CITY ?auto_193145 ?auto_193141 ) ( not ( = ?auto_193135 ?auto_193145 ) ) ( OBJ-AT ?auto_193137 ?auto_193145 ) ( IN-CITY ?auto_193140 ?auto_193141 ) ( not ( = ?auto_193135 ?auto_193140 ) ) ( OBJ-AT ?auto_193136 ?auto_193140 ) ( TRUCK-AT ?auto_193142 ?auto_193135 ) ( not ( = ?auto_193136 ?auto_193137 ) ) ( not ( = ?auto_193145 ?auto_193140 ) ) ( not ( = ?auto_193136 ?auto_193139 ) ) ( not ( = ?auto_193137 ?auto_193139 ) ) ( not ( = ?auto_193143 ?auto_193145 ) ) ( not ( = ?auto_193143 ?auto_193140 ) ) ( not ( = ?auto_193136 ?auto_193138 ) ) ( not ( = ?auto_193137 ?auto_193138 ) ) ( not ( = ?auto_193139 ?auto_193138 ) ) ( not ( = ?auto_193144 ?auto_193143 ) ) ( not ( = ?auto_193144 ?auto_193145 ) ) ( not ( = ?auto_193144 ?auto_193140 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193136 ?auto_193137 ?auto_193139 ?auto_193138 ?auto_193135 )
      ( DELIVER-4PKG-VERIFY ?auto_193136 ?auto_193137 ?auto_193138 ?auto_193139 ?auto_193135 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193171 - OBJ
      ?auto_193172 - OBJ
      ?auto_193173 - OBJ
      ?auto_193174 - OBJ
      ?auto_193170 - LOCATION
    )
    :vars
    (
      ?auto_193180 - LOCATION
      ?auto_193177 - CITY
      ?auto_193179 - LOCATION
      ?auto_193178 - LOCATION
      ?auto_193175 - LOCATION
      ?auto_193176 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193180 ?auto_193177 ) ( IN-CITY ?auto_193170 ?auto_193177 ) ( not ( = ?auto_193170 ?auto_193180 ) ) ( OBJ-AT ?auto_193174 ?auto_193180 ) ( IN-CITY ?auto_193179 ?auto_193177 ) ( not ( = ?auto_193170 ?auto_193179 ) ) ( OBJ-AT ?auto_193172 ?auto_193179 ) ( IN-CITY ?auto_193178 ?auto_193177 ) ( not ( = ?auto_193170 ?auto_193178 ) ) ( OBJ-AT ?auto_193173 ?auto_193178 ) ( IN-CITY ?auto_193175 ?auto_193177 ) ( not ( = ?auto_193170 ?auto_193175 ) ) ( OBJ-AT ?auto_193171 ?auto_193175 ) ( TRUCK-AT ?auto_193176 ?auto_193170 ) ( not ( = ?auto_193171 ?auto_193173 ) ) ( not ( = ?auto_193178 ?auto_193175 ) ) ( not ( = ?auto_193171 ?auto_193172 ) ) ( not ( = ?auto_193173 ?auto_193172 ) ) ( not ( = ?auto_193179 ?auto_193178 ) ) ( not ( = ?auto_193179 ?auto_193175 ) ) ( not ( = ?auto_193171 ?auto_193174 ) ) ( not ( = ?auto_193173 ?auto_193174 ) ) ( not ( = ?auto_193172 ?auto_193174 ) ) ( not ( = ?auto_193180 ?auto_193179 ) ) ( not ( = ?auto_193180 ?auto_193178 ) ) ( not ( = ?auto_193180 ?auto_193175 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193171 ?auto_193173 ?auto_193174 ?auto_193172 ?auto_193170 )
      ( DELIVER-4PKG-VERIFY ?auto_193171 ?auto_193172 ?auto_193173 ?auto_193174 ?auto_193170 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193206 - OBJ
      ?auto_193207 - OBJ
      ?auto_193208 - OBJ
      ?auto_193209 - OBJ
      ?auto_193205 - LOCATION
    )
    :vars
    (
      ?auto_193215 - LOCATION
      ?auto_193212 - CITY
      ?auto_193214 - LOCATION
      ?auto_193213 - LOCATION
      ?auto_193210 - LOCATION
      ?auto_193211 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193215 ?auto_193212 ) ( IN-CITY ?auto_193205 ?auto_193212 ) ( not ( = ?auto_193205 ?auto_193215 ) ) ( OBJ-AT ?auto_193208 ?auto_193215 ) ( IN-CITY ?auto_193214 ?auto_193212 ) ( not ( = ?auto_193205 ?auto_193214 ) ) ( OBJ-AT ?auto_193207 ?auto_193214 ) ( IN-CITY ?auto_193213 ?auto_193212 ) ( not ( = ?auto_193205 ?auto_193213 ) ) ( OBJ-AT ?auto_193209 ?auto_193213 ) ( IN-CITY ?auto_193210 ?auto_193212 ) ( not ( = ?auto_193205 ?auto_193210 ) ) ( OBJ-AT ?auto_193206 ?auto_193210 ) ( TRUCK-AT ?auto_193211 ?auto_193205 ) ( not ( = ?auto_193206 ?auto_193209 ) ) ( not ( = ?auto_193213 ?auto_193210 ) ) ( not ( = ?auto_193206 ?auto_193207 ) ) ( not ( = ?auto_193209 ?auto_193207 ) ) ( not ( = ?auto_193214 ?auto_193213 ) ) ( not ( = ?auto_193214 ?auto_193210 ) ) ( not ( = ?auto_193206 ?auto_193208 ) ) ( not ( = ?auto_193209 ?auto_193208 ) ) ( not ( = ?auto_193207 ?auto_193208 ) ) ( not ( = ?auto_193215 ?auto_193214 ) ) ( not ( = ?auto_193215 ?auto_193213 ) ) ( not ( = ?auto_193215 ?auto_193210 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193206 ?auto_193209 ?auto_193208 ?auto_193207 ?auto_193205 )
      ( DELIVER-4PKG-VERIFY ?auto_193206 ?auto_193207 ?auto_193208 ?auto_193209 ?auto_193205 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193315 - OBJ
      ?auto_193316 - OBJ
      ?auto_193317 - OBJ
      ?auto_193318 - OBJ
      ?auto_193314 - LOCATION
    )
    :vars
    (
      ?auto_193324 - LOCATION
      ?auto_193321 - CITY
      ?auto_193323 - LOCATION
      ?auto_193322 - LOCATION
      ?auto_193319 - LOCATION
      ?auto_193320 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193324 ?auto_193321 ) ( IN-CITY ?auto_193314 ?auto_193321 ) ( not ( = ?auto_193314 ?auto_193324 ) ) ( OBJ-AT ?auto_193316 ?auto_193324 ) ( IN-CITY ?auto_193323 ?auto_193321 ) ( not ( = ?auto_193314 ?auto_193323 ) ) ( OBJ-AT ?auto_193318 ?auto_193323 ) ( IN-CITY ?auto_193322 ?auto_193321 ) ( not ( = ?auto_193314 ?auto_193322 ) ) ( OBJ-AT ?auto_193317 ?auto_193322 ) ( IN-CITY ?auto_193319 ?auto_193321 ) ( not ( = ?auto_193314 ?auto_193319 ) ) ( OBJ-AT ?auto_193315 ?auto_193319 ) ( TRUCK-AT ?auto_193320 ?auto_193314 ) ( not ( = ?auto_193315 ?auto_193317 ) ) ( not ( = ?auto_193322 ?auto_193319 ) ) ( not ( = ?auto_193315 ?auto_193318 ) ) ( not ( = ?auto_193317 ?auto_193318 ) ) ( not ( = ?auto_193323 ?auto_193322 ) ) ( not ( = ?auto_193323 ?auto_193319 ) ) ( not ( = ?auto_193315 ?auto_193316 ) ) ( not ( = ?auto_193317 ?auto_193316 ) ) ( not ( = ?auto_193318 ?auto_193316 ) ) ( not ( = ?auto_193324 ?auto_193323 ) ) ( not ( = ?auto_193324 ?auto_193322 ) ) ( not ( = ?auto_193324 ?auto_193319 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193315 ?auto_193317 ?auto_193316 ?auto_193318 ?auto_193314 )
      ( DELIVER-4PKG-VERIFY ?auto_193315 ?auto_193316 ?auto_193317 ?auto_193318 ?auto_193314 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193350 - OBJ
      ?auto_193351 - OBJ
      ?auto_193352 - OBJ
      ?auto_193353 - OBJ
      ?auto_193349 - LOCATION
    )
    :vars
    (
      ?auto_193359 - LOCATION
      ?auto_193356 - CITY
      ?auto_193358 - LOCATION
      ?auto_193357 - LOCATION
      ?auto_193354 - LOCATION
      ?auto_193355 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193359 ?auto_193356 ) ( IN-CITY ?auto_193349 ?auto_193356 ) ( not ( = ?auto_193349 ?auto_193359 ) ) ( OBJ-AT ?auto_193351 ?auto_193359 ) ( IN-CITY ?auto_193358 ?auto_193356 ) ( not ( = ?auto_193349 ?auto_193358 ) ) ( OBJ-AT ?auto_193352 ?auto_193358 ) ( IN-CITY ?auto_193357 ?auto_193356 ) ( not ( = ?auto_193349 ?auto_193357 ) ) ( OBJ-AT ?auto_193353 ?auto_193357 ) ( IN-CITY ?auto_193354 ?auto_193356 ) ( not ( = ?auto_193349 ?auto_193354 ) ) ( OBJ-AT ?auto_193350 ?auto_193354 ) ( TRUCK-AT ?auto_193355 ?auto_193349 ) ( not ( = ?auto_193350 ?auto_193353 ) ) ( not ( = ?auto_193357 ?auto_193354 ) ) ( not ( = ?auto_193350 ?auto_193352 ) ) ( not ( = ?auto_193353 ?auto_193352 ) ) ( not ( = ?auto_193358 ?auto_193357 ) ) ( not ( = ?auto_193358 ?auto_193354 ) ) ( not ( = ?auto_193350 ?auto_193351 ) ) ( not ( = ?auto_193353 ?auto_193351 ) ) ( not ( = ?auto_193352 ?auto_193351 ) ) ( not ( = ?auto_193359 ?auto_193358 ) ) ( not ( = ?auto_193359 ?auto_193357 ) ) ( not ( = ?auto_193359 ?auto_193354 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193350 ?auto_193353 ?auto_193351 ?auto_193352 ?auto_193349 )
      ( DELIVER-4PKG-VERIFY ?auto_193350 ?auto_193351 ?auto_193352 ?auto_193353 ?auto_193349 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193459 - OBJ
      ?auto_193460 - OBJ
      ?auto_193461 - OBJ
      ?auto_193462 - OBJ
      ?auto_193458 - LOCATION
    )
    :vars
    (
      ?auto_193468 - LOCATION
      ?auto_193465 - CITY
      ?auto_193467 - LOCATION
      ?auto_193466 - LOCATION
      ?auto_193463 - LOCATION
      ?auto_193464 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193468 ?auto_193465 ) ( IN-CITY ?auto_193458 ?auto_193465 ) ( not ( = ?auto_193458 ?auto_193468 ) ) ( OBJ-AT ?auto_193462 ?auto_193468 ) ( IN-CITY ?auto_193467 ?auto_193465 ) ( not ( = ?auto_193458 ?auto_193467 ) ) ( OBJ-AT ?auto_193461 ?auto_193467 ) ( IN-CITY ?auto_193466 ?auto_193465 ) ( not ( = ?auto_193458 ?auto_193466 ) ) ( OBJ-AT ?auto_193459 ?auto_193466 ) ( IN-CITY ?auto_193463 ?auto_193465 ) ( not ( = ?auto_193458 ?auto_193463 ) ) ( OBJ-AT ?auto_193460 ?auto_193463 ) ( TRUCK-AT ?auto_193464 ?auto_193458 ) ( not ( = ?auto_193460 ?auto_193459 ) ) ( not ( = ?auto_193466 ?auto_193463 ) ) ( not ( = ?auto_193460 ?auto_193461 ) ) ( not ( = ?auto_193459 ?auto_193461 ) ) ( not ( = ?auto_193467 ?auto_193466 ) ) ( not ( = ?auto_193467 ?auto_193463 ) ) ( not ( = ?auto_193460 ?auto_193462 ) ) ( not ( = ?auto_193459 ?auto_193462 ) ) ( not ( = ?auto_193461 ?auto_193462 ) ) ( not ( = ?auto_193468 ?auto_193467 ) ) ( not ( = ?auto_193468 ?auto_193466 ) ) ( not ( = ?auto_193468 ?auto_193463 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193460 ?auto_193459 ?auto_193462 ?auto_193461 ?auto_193458 )
      ( DELIVER-4PKG-VERIFY ?auto_193459 ?auto_193460 ?auto_193461 ?auto_193462 ?auto_193458 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193494 - OBJ
      ?auto_193495 - OBJ
      ?auto_193496 - OBJ
      ?auto_193497 - OBJ
      ?auto_193493 - LOCATION
    )
    :vars
    (
      ?auto_193503 - LOCATION
      ?auto_193500 - CITY
      ?auto_193502 - LOCATION
      ?auto_193501 - LOCATION
      ?auto_193498 - LOCATION
      ?auto_193499 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193503 ?auto_193500 ) ( IN-CITY ?auto_193493 ?auto_193500 ) ( not ( = ?auto_193493 ?auto_193503 ) ) ( OBJ-AT ?auto_193496 ?auto_193503 ) ( IN-CITY ?auto_193502 ?auto_193500 ) ( not ( = ?auto_193493 ?auto_193502 ) ) ( OBJ-AT ?auto_193497 ?auto_193502 ) ( IN-CITY ?auto_193501 ?auto_193500 ) ( not ( = ?auto_193493 ?auto_193501 ) ) ( OBJ-AT ?auto_193494 ?auto_193501 ) ( IN-CITY ?auto_193498 ?auto_193500 ) ( not ( = ?auto_193493 ?auto_193498 ) ) ( OBJ-AT ?auto_193495 ?auto_193498 ) ( TRUCK-AT ?auto_193499 ?auto_193493 ) ( not ( = ?auto_193495 ?auto_193494 ) ) ( not ( = ?auto_193501 ?auto_193498 ) ) ( not ( = ?auto_193495 ?auto_193497 ) ) ( not ( = ?auto_193494 ?auto_193497 ) ) ( not ( = ?auto_193502 ?auto_193501 ) ) ( not ( = ?auto_193502 ?auto_193498 ) ) ( not ( = ?auto_193495 ?auto_193496 ) ) ( not ( = ?auto_193494 ?auto_193496 ) ) ( not ( = ?auto_193497 ?auto_193496 ) ) ( not ( = ?auto_193503 ?auto_193502 ) ) ( not ( = ?auto_193503 ?auto_193501 ) ) ( not ( = ?auto_193503 ?auto_193498 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193495 ?auto_193494 ?auto_193496 ?auto_193497 ?auto_193493 )
      ( DELIVER-4PKG-VERIFY ?auto_193494 ?auto_193495 ?auto_193496 ?auto_193497 ?auto_193493 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193604 - OBJ
      ?auto_193605 - OBJ
      ?auto_193606 - OBJ
      ?auto_193607 - OBJ
      ?auto_193603 - LOCATION
    )
    :vars
    (
      ?auto_193613 - LOCATION
      ?auto_193610 - CITY
      ?auto_193612 - LOCATION
      ?auto_193611 - LOCATION
      ?auto_193608 - LOCATION
      ?auto_193609 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193613 ?auto_193610 ) ( IN-CITY ?auto_193603 ?auto_193610 ) ( not ( = ?auto_193603 ?auto_193613 ) ) ( OBJ-AT ?auto_193607 ?auto_193613 ) ( IN-CITY ?auto_193612 ?auto_193610 ) ( not ( = ?auto_193603 ?auto_193612 ) ) ( OBJ-AT ?auto_193605 ?auto_193612 ) ( IN-CITY ?auto_193611 ?auto_193610 ) ( not ( = ?auto_193603 ?auto_193611 ) ) ( OBJ-AT ?auto_193604 ?auto_193611 ) ( IN-CITY ?auto_193608 ?auto_193610 ) ( not ( = ?auto_193603 ?auto_193608 ) ) ( OBJ-AT ?auto_193606 ?auto_193608 ) ( TRUCK-AT ?auto_193609 ?auto_193603 ) ( not ( = ?auto_193606 ?auto_193604 ) ) ( not ( = ?auto_193611 ?auto_193608 ) ) ( not ( = ?auto_193606 ?auto_193605 ) ) ( not ( = ?auto_193604 ?auto_193605 ) ) ( not ( = ?auto_193612 ?auto_193611 ) ) ( not ( = ?auto_193612 ?auto_193608 ) ) ( not ( = ?auto_193606 ?auto_193607 ) ) ( not ( = ?auto_193604 ?auto_193607 ) ) ( not ( = ?auto_193605 ?auto_193607 ) ) ( not ( = ?auto_193613 ?auto_193612 ) ) ( not ( = ?auto_193613 ?auto_193611 ) ) ( not ( = ?auto_193613 ?auto_193608 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193606 ?auto_193604 ?auto_193607 ?auto_193605 ?auto_193603 )
      ( DELIVER-4PKG-VERIFY ?auto_193604 ?auto_193605 ?auto_193606 ?auto_193607 ?auto_193603 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193639 - OBJ
      ?auto_193640 - OBJ
      ?auto_193641 - OBJ
      ?auto_193642 - OBJ
      ?auto_193638 - LOCATION
    )
    :vars
    (
      ?auto_193648 - LOCATION
      ?auto_193645 - CITY
      ?auto_193647 - LOCATION
      ?auto_193646 - LOCATION
      ?auto_193643 - LOCATION
      ?auto_193644 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193648 ?auto_193645 ) ( IN-CITY ?auto_193638 ?auto_193645 ) ( not ( = ?auto_193638 ?auto_193648 ) ) ( OBJ-AT ?auto_193641 ?auto_193648 ) ( IN-CITY ?auto_193647 ?auto_193645 ) ( not ( = ?auto_193638 ?auto_193647 ) ) ( OBJ-AT ?auto_193640 ?auto_193647 ) ( IN-CITY ?auto_193646 ?auto_193645 ) ( not ( = ?auto_193638 ?auto_193646 ) ) ( OBJ-AT ?auto_193639 ?auto_193646 ) ( IN-CITY ?auto_193643 ?auto_193645 ) ( not ( = ?auto_193638 ?auto_193643 ) ) ( OBJ-AT ?auto_193642 ?auto_193643 ) ( TRUCK-AT ?auto_193644 ?auto_193638 ) ( not ( = ?auto_193642 ?auto_193639 ) ) ( not ( = ?auto_193646 ?auto_193643 ) ) ( not ( = ?auto_193642 ?auto_193640 ) ) ( not ( = ?auto_193639 ?auto_193640 ) ) ( not ( = ?auto_193647 ?auto_193646 ) ) ( not ( = ?auto_193647 ?auto_193643 ) ) ( not ( = ?auto_193642 ?auto_193641 ) ) ( not ( = ?auto_193639 ?auto_193641 ) ) ( not ( = ?auto_193640 ?auto_193641 ) ) ( not ( = ?auto_193648 ?auto_193647 ) ) ( not ( = ?auto_193648 ?auto_193646 ) ) ( not ( = ?auto_193648 ?auto_193643 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193642 ?auto_193639 ?auto_193641 ?auto_193640 ?auto_193638 )
      ( DELIVER-4PKG-VERIFY ?auto_193639 ?auto_193640 ?auto_193641 ?auto_193642 ?auto_193638 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193710 - OBJ
      ?auto_193711 - OBJ
      ?auto_193712 - OBJ
      ?auto_193713 - OBJ
      ?auto_193709 - LOCATION
    )
    :vars
    (
      ?auto_193719 - LOCATION
      ?auto_193716 - CITY
      ?auto_193718 - LOCATION
      ?auto_193717 - LOCATION
      ?auto_193714 - LOCATION
      ?auto_193715 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193719 ?auto_193716 ) ( IN-CITY ?auto_193709 ?auto_193716 ) ( not ( = ?auto_193709 ?auto_193719 ) ) ( OBJ-AT ?auto_193711 ?auto_193719 ) ( IN-CITY ?auto_193718 ?auto_193716 ) ( not ( = ?auto_193709 ?auto_193718 ) ) ( OBJ-AT ?auto_193713 ?auto_193718 ) ( IN-CITY ?auto_193717 ?auto_193716 ) ( not ( = ?auto_193709 ?auto_193717 ) ) ( OBJ-AT ?auto_193710 ?auto_193717 ) ( IN-CITY ?auto_193714 ?auto_193716 ) ( not ( = ?auto_193709 ?auto_193714 ) ) ( OBJ-AT ?auto_193712 ?auto_193714 ) ( TRUCK-AT ?auto_193715 ?auto_193709 ) ( not ( = ?auto_193712 ?auto_193710 ) ) ( not ( = ?auto_193717 ?auto_193714 ) ) ( not ( = ?auto_193712 ?auto_193713 ) ) ( not ( = ?auto_193710 ?auto_193713 ) ) ( not ( = ?auto_193718 ?auto_193717 ) ) ( not ( = ?auto_193718 ?auto_193714 ) ) ( not ( = ?auto_193712 ?auto_193711 ) ) ( not ( = ?auto_193710 ?auto_193711 ) ) ( not ( = ?auto_193713 ?auto_193711 ) ) ( not ( = ?auto_193719 ?auto_193718 ) ) ( not ( = ?auto_193719 ?auto_193717 ) ) ( not ( = ?auto_193719 ?auto_193714 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193712 ?auto_193710 ?auto_193711 ?auto_193713 ?auto_193709 )
      ( DELIVER-4PKG-VERIFY ?auto_193710 ?auto_193711 ?auto_193712 ?auto_193713 ?auto_193709 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193783 - OBJ
      ?auto_193784 - OBJ
      ?auto_193785 - OBJ
      ?auto_193786 - OBJ
      ?auto_193782 - LOCATION
    )
    :vars
    (
      ?auto_193792 - LOCATION
      ?auto_193789 - CITY
      ?auto_193791 - LOCATION
      ?auto_193790 - LOCATION
      ?auto_193787 - LOCATION
      ?auto_193788 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193792 ?auto_193789 ) ( IN-CITY ?auto_193782 ?auto_193789 ) ( not ( = ?auto_193782 ?auto_193792 ) ) ( OBJ-AT ?auto_193784 ?auto_193792 ) ( IN-CITY ?auto_193791 ?auto_193789 ) ( not ( = ?auto_193782 ?auto_193791 ) ) ( OBJ-AT ?auto_193785 ?auto_193791 ) ( IN-CITY ?auto_193790 ?auto_193789 ) ( not ( = ?auto_193782 ?auto_193790 ) ) ( OBJ-AT ?auto_193783 ?auto_193790 ) ( IN-CITY ?auto_193787 ?auto_193789 ) ( not ( = ?auto_193782 ?auto_193787 ) ) ( OBJ-AT ?auto_193786 ?auto_193787 ) ( TRUCK-AT ?auto_193788 ?auto_193782 ) ( not ( = ?auto_193786 ?auto_193783 ) ) ( not ( = ?auto_193790 ?auto_193787 ) ) ( not ( = ?auto_193786 ?auto_193785 ) ) ( not ( = ?auto_193783 ?auto_193785 ) ) ( not ( = ?auto_193791 ?auto_193790 ) ) ( not ( = ?auto_193791 ?auto_193787 ) ) ( not ( = ?auto_193786 ?auto_193784 ) ) ( not ( = ?auto_193783 ?auto_193784 ) ) ( not ( = ?auto_193785 ?auto_193784 ) ) ( not ( = ?auto_193792 ?auto_193791 ) ) ( not ( = ?auto_193792 ?auto_193790 ) ) ( not ( = ?auto_193792 ?auto_193787 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193786 ?auto_193783 ?auto_193784 ?auto_193785 ?auto_193782 )
      ( DELIVER-4PKG-VERIFY ?auto_193783 ?auto_193784 ?auto_193785 ?auto_193786 ?auto_193782 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193892 - OBJ
      ?auto_193893 - OBJ
      ?auto_193894 - OBJ
      ?auto_193895 - OBJ
      ?auto_193891 - LOCATION
    )
    :vars
    (
      ?auto_193901 - LOCATION
      ?auto_193898 - CITY
      ?auto_193900 - LOCATION
      ?auto_193899 - LOCATION
      ?auto_193896 - LOCATION
      ?auto_193897 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193901 ?auto_193898 ) ( IN-CITY ?auto_193891 ?auto_193898 ) ( not ( = ?auto_193891 ?auto_193901 ) ) ( OBJ-AT ?auto_193895 ?auto_193901 ) ( IN-CITY ?auto_193900 ?auto_193898 ) ( not ( = ?auto_193891 ?auto_193900 ) ) ( OBJ-AT ?auto_193892 ?auto_193900 ) ( IN-CITY ?auto_193899 ?auto_193898 ) ( not ( = ?auto_193891 ?auto_193899 ) ) ( OBJ-AT ?auto_193894 ?auto_193899 ) ( IN-CITY ?auto_193896 ?auto_193898 ) ( not ( = ?auto_193891 ?auto_193896 ) ) ( OBJ-AT ?auto_193893 ?auto_193896 ) ( TRUCK-AT ?auto_193897 ?auto_193891 ) ( not ( = ?auto_193893 ?auto_193894 ) ) ( not ( = ?auto_193899 ?auto_193896 ) ) ( not ( = ?auto_193893 ?auto_193892 ) ) ( not ( = ?auto_193894 ?auto_193892 ) ) ( not ( = ?auto_193900 ?auto_193899 ) ) ( not ( = ?auto_193900 ?auto_193896 ) ) ( not ( = ?auto_193893 ?auto_193895 ) ) ( not ( = ?auto_193894 ?auto_193895 ) ) ( not ( = ?auto_193892 ?auto_193895 ) ) ( not ( = ?auto_193901 ?auto_193900 ) ) ( not ( = ?auto_193901 ?auto_193899 ) ) ( not ( = ?auto_193901 ?auto_193896 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193893 ?auto_193894 ?auto_193895 ?auto_193892 ?auto_193891 )
      ( DELIVER-4PKG-VERIFY ?auto_193892 ?auto_193893 ?auto_193894 ?auto_193895 ?auto_193891 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193927 - OBJ
      ?auto_193928 - OBJ
      ?auto_193929 - OBJ
      ?auto_193930 - OBJ
      ?auto_193926 - LOCATION
    )
    :vars
    (
      ?auto_193936 - LOCATION
      ?auto_193933 - CITY
      ?auto_193935 - LOCATION
      ?auto_193934 - LOCATION
      ?auto_193931 - LOCATION
      ?auto_193932 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193936 ?auto_193933 ) ( IN-CITY ?auto_193926 ?auto_193933 ) ( not ( = ?auto_193926 ?auto_193936 ) ) ( OBJ-AT ?auto_193929 ?auto_193936 ) ( IN-CITY ?auto_193935 ?auto_193933 ) ( not ( = ?auto_193926 ?auto_193935 ) ) ( OBJ-AT ?auto_193927 ?auto_193935 ) ( IN-CITY ?auto_193934 ?auto_193933 ) ( not ( = ?auto_193926 ?auto_193934 ) ) ( OBJ-AT ?auto_193930 ?auto_193934 ) ( IN-CITY ?auto_193931 ?auto_193933 ) ( not ( = ?auto_193926 ?auto_193931 ) ) ( OBJ-AT ?auto_193928 ?auto_193931 ) ( TRUCK-AT ?auto_193932 ?auto_193926 ) ( not ( = ?auto_193928 ?auto_193930 ) ) ( not ( = ?auto_193934 ?auto_193931 ) ) ( not ( = ?auto_193928 ?auto_193927 ) ) ( not ( = ?auto_193930 ?auto_193927 ) ) ( not ( = ?auto_193935 ?auto_193934 ) ) ( not ( = ?auto_193935 ?auto_193931 ) ) ( not ( = ?auto_193928 ?auto_193929 ) ) ( not ( = ?auto_193930 ?auto_193929 ) ) ( not ( = ?auto_193927 ?auto_193929 ) ) ( not ( = ?auto_193936 ?auto_193935 ) ) ( not ( = ?auto_193936 ?auto_193934 ) ) ( not ( = ?auto_193936 ?auto_193931 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193928 ?auto_193930 ?auto_193929 ?auto_193927 ?auto_193926 )
      ( DELIVER-4PKG-VERIFY ?auto_193927 ?auto_193928 ?auto_193929 ?auto_193930 ?auto_193926 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193962 - OBJ
      ?auto_193963 - OBJ
      ?auto_193964 - OBJ
      ?auto_193965 - OBJ
      ?auto_193961 - LOCATION
    )
    :vars
    (
      ?auto_193971 - LOCATION
      ?auto_193968 - CITY
      ?auto_193970 - LOCATION
      ?auto_193969 - LOCATION
      ?auto_193966 - LOCATION
      ?auto_193967 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193971 ?auto_193968 ) ( IN-CITY ?auto_193961 ?auto_193968 ) ( not ( = ?auto_193961 ?auto_193971 ) ) ( OBJ-AT ?auto_193965 ?auto_193971 ) ( IN-CITY ?auto_193970 ?auto_193968 ) ( not ( = ?auto_193961 ?auto_193970 ) ) ( OBJ-AT ?auto_193962 ?auto_193970 ) ( IN-CITY ?auto_193969 ?auto_193968 ) ( not ( = ?auto_193961 ?auto_193969 ) ) ( OBJ-AT ?auto_193963 ?auto_193969 ) ( IN-CITY ?auto_193966 ?auto_193968 ) ( not ( = ?auto_193961 ?auto_193966 ) ) ( OBJ-AT ?auto_193964 ?auto_193966 ) ( TRUCK-AT ?auto_193967 ?auto_193961 ) ( not ( = ?auto_193964 ?auto_193963 ) ) ( not ( = ?auto_193969 ?auto_193966 ) ) ( not ( = ?auto_193964 ?auto_193962 ) ) ( not ( = ?auto_193963 ?auto_193962 ) ) ( not ( = ?auto_193970 ?auto_193969 ) ) ( not ( = ?auto_193970 ?auto_193966 ) ) ( not ( = ?auto_193964 ?auto_193965 ) ) ( not ( = ?auto_193963 ?auto_193965 ) ) ( not ( = ?auto_193962 ?auto_193965 ) ) ( not ( = ?auto_193971 ?auto_193970 ) ) ( not ( = ?auto_193971 ?auto_193969 ) ) ( not ( = ?auto_193971 ?auto_193966 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193964 ?auto_193963 ?auto_193965 ?auto_193962 ?auto_193961 )
      ( DELIVER-4PKG-VERIFY ?auto_193962 ?auto_193963 ?auto_193964 ?auto_193965 ?auto_193961 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193997 - OBJ
      ?auto_193998 - OBJ
      ?auto_193999 - OBJ
      ?auto_194000 - OBJ
      ?auto_193996 - LOCATION
    )
    :vars
    (
      ?auto_194006 - LOCATION
      ?auto_194003 - CITY
      ?auto_194005 - LOCATION
      ?auto_194004 - LOCATION
      ?auto_194001 - LOCATION
      ?auto_194002 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_194006 ?auto_194003 ) ( IN-CITY ?auto_193996 ?auto_194003 ) ( not ( = ?auto_193996 ?auto_194006 ) ) ( OBJ-AT ?auto_193999 ?auto_194006 ) ( IN-CITY ?auto_194005 ?auto_194003 ) ( not ( = ?auto_193996 ?auto_194005 ) ) ( OBJ-AT ?auto_193997 ?auto_194005 ) ( IN-CITY ?auto_194004 ?auto_194003 ) ( not ( = ?auto_193996 ?auto_194004 ) ) ( OBJ-AT ?auto_193998 ?auto_194004 ) ( IN-CITY ?auto_194001 ?auto_194003 ) ( not ( = ?auto_193996 ?auto_194001 ) ) ( OBJ-AT ?auto_194000 ?auto_194001 ) ( TRUCK-AT ?auto_194002 ?auto_193996 ) ( not ( = ?auto_194000 ?auto_193998 ) ) ( not ( = ?auto_194004 ?auto_194001 ) ) ( not ( = ?auto_194000 ?auto_193997 ) ) ( not ( = ?auto_193998 ?auto_193997 ) ) ( not ( = ?auto_194005 ?auto_194004 ) ) ( not ( = ?auto_194005 ?auto_194001 ) ) ( not ( = ?auto_194000 ?auto_193999 ) ) ( not ( = ?auto_193998 ?auto_193999 ) ) ( not ( = ?auto_193997 ?auto_193999 ) ) ( not ( = ?auto_194006 ?auto_194005 ) ) ( not ( = ?auto_194006 ?auto_194004 ) ) ( not ( = ?auto_194006 ?auto_194001 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_194000 ?auto_193998 ?auto_193999 ?auto_193997 ?auto_193996 )
      ( DELIVER-4PKG-VERIFY ?auto_193997 ?auto_193998 ?auto_193999 ?auto_194000 ?auto_193996 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194143 - OBJ
      ?auto_194144 - OBJ
      ?auto_194145 - OBJ
      ?auto_194146 - OBJ
      ?auto_194142 - LOCATION
    )
    :vars
    (
      ?auto_194152 - LOCATION
      ?auto_194149 - CITY
      ?auto_194151 - LOCATION
      ?auto_194150 - LOCATION
      ?auto_194147 - LOCATION
      ?auto_194148 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_194152 ?auto_194149 ) ( IN-CITY ?auto_194142 ?auto_194149 ) ( not ( = ?auto_194142 ?auto_194152 ) ) ( OBJ-AT ?auto_194144 ?auto_194152 ) ( IN-CITY ?auto_194151 ?auto_194149 ) ( not ( = ?auto_194142 ?auto_194151 ) ) ( OBJ-AT ?auto_194143 ?auto_194151 ) ( IN-CITY ?auto_194150 ?auto_194149 ) ( not ( = ?auto_194142 ?auto_194150 ) ) ( OBJ-AT ?auto_194146 ?auto_194150 ) ( IN-CITY ?auto_194147 ?auto_194149 ) ( not ( = ?auto_194142 ?auto_194147 ) ) ( OBJ-AT ?auto_194145 ?auto_194147 ) ( TRUCK-AT ?auto_194148 ?auto_194142 ) ( not ( = ?auto_194145 ?auto_194146 ) ) ( not ( = ?auto_194150 ?auto_194147 ) ) ( not ( = ?auto_194145 ?auto_194143 ) ) ( not ( = ?auto_194146 ?auto_194143 ) ) ( not ( = ?auto_194151 ?auto_194150 ) ) ( not ( = ?auto_194151 ?auto_194147 ) ) ( not ( = ?auto_194145 ?auto_194144 ) ) ( not ( = ?auto_194146 ?auto_194144 ) ) ( not ( = ?auto_194143 ?auto_194144 ) ) ( not ( = ?auto_194152 ?auto_194151 ) ) ( not ( = ?auto_194152 ?auto_194150 ) ) ( not ( = ?auto_194152 ?auto_194147 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_194145 ?auto_194146 ?auto_194144 ?auto_194143 ?auto_194142 )
      ( DELIVER-4PKG-VERIFY ?auto_194143 ?auto_194144 ?auto_194145 ?auto_194146 ?auto_194142 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194178 - OBJ
      ?auto_194179 - OBJ
      ?auto_194180 - OBJ
      ?auto_194181 - OBJ
      ?auto_194177 - LOCATION
    )
    :vars
    (
      ?auto_194187 - LOCATION
      ?auto_194184 - CITY
      ?auto_194186 - LOCATION
      ?auto_194185 - LOCATION
      ?auto_194182 - LOCATION
      ?auto_194183 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_194187 ?auto_194184 ) ( IN-CITY ?auto_194177 ?auto_194184 ) ( not ( = ?auto_194177 ?auto_194187 ) ) ( OBJ-AT ?auto_194179 ?auto_194187 ) ( IN-CITY ?auto_194186 ?auto_194184 ) ( not ( = ?auto_194177 ?auto_194186 ) ) ( OBJ-AT ?auto_194178 ?auto_194186 ) ( IN-CITY ?auto_194185 ?auto_194184 ) ( not ( = ?auto_194177 ?auto_194185 ) ) ( OBJ-AT ?auto_194180 ?auto_194185 ) ( IN-CITY ?auto_194182 ?auto_194184 ) ( not ( = ?auto_194177 ?auto_194182 ) ) ( OBJ-AT ?auto_194181 ?auto_194182 ) ( TRUCK-AT ?auto_194183 ?auto_194177 ) ( not ( = ?auto_194181 ?auto_194180 ) ) ( not ( = ?auto_194185 ?auto_194182 ) ) ( not ( = ?auto_194181 ?auto_194178 ) ) ( not ( = ?auto_194180 ?auto_194178 ) ) ( not ( = ?auto_194186 ?auto_194185 ) ) ( not ( = ?auto_194186 ?auto_194182 ) ) ( not ( = ?auto_194181 ?auto_194179 ) ) ( not ( = ?auto_194180 ?auto_194179 ) ) ( not ( = ?auto_194178 ?auto_194179 ) ) ( not ( = ?auto_194187 ?auto_194186 ) ) ( not ( = ?auto_194187 ?auto_194185 ) ) ( not ( = ?auto_194187 ?auto_194182 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_194181 ?auto_194180 ?auto_194179 ?auto_194178 ?auto_194177 )
      ( DELIVER-4PKG-VERIFY ?auto_194178 ?auto_194179 ?auto_194180 ?auto_194181 ?auto_194177 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194399 - OBJ
      ?auto_194400 - OBJ
      ?auto_194401 - OBJ
      ?auto_194402 - OBJ
      ?auto_194398 - LOCATION
    )
    :vars
    (
      ?auto_194408 - LOCATION
      ?auto_194405 - CITY
      ?auto_194407 - LOCATION
      ?auto_194406 - LOCATION
      ?auto_194403 - LOCATION
      ?auto_194404 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_194408 ?auto_194405 ) ( IN-CITY ?auto_194398 ?auto_194405 ) ( not ( = ?auto_194398 ?auto_194408 ) ) ( OBJ-AT ?auto_194399 ?auto_194408 ) ( IN-CITY ?auto_194407 ?auto_194405 ) ( not ( = ?auto_194398 ?auto_194407 ) ) ( OBJ-AT ?auto_194402 ?auto_194407 ) ( IN-CITY ?auto_194406 ?auto_194405 ) ( not ( = ?auto_194398 ?auto_194406 ) ) ( OBJ-AT ?auto_194401 ?auto_194406 ) ( IN-CITY ?auto_194403 ?auto_194405 ) ( not ( = ?auto_194398 ?auto_194403 ) ) ( OBJ-AT ?auto_194400 ?auto_194403 ) ( TRUCK-AT ?auto_194404 ?auto_194398 ) ( not ( = ?auto_194400 ?auto_194401 ) ) ( not ( = ?auto_194406 ?auto_194403 ) ) ( not ( = ?auto_194400 ?auto_194402 ) ) ( not ( = ?auto_194401 ?auto_194402 ) ) ( not ( = ?auto_194407 ?auto_194406 ) ) ( not ( = ?auto_194407 ?auto_194403 ) ) ( not ( = ?auto_194400 ?auto_194399 ) ) ( not ( = ?auto_194401 ?auto_194399 ) ) ( not ( = ?auto_194402 ?auto_194399 ) ) ( not ( = ?auto_194408 ?auto_194407 ) ) ( not ( = ?auto_194408 ?auto_194406 ) ) ( not ( = ?auto_194408 ?auto_194403 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_194400 ?auto_194401 ?auto_194399 ?auto_194402 ?auto_194398 )
      ( DELIVER-4PKG-VERIFY ?auto_194399 ?auto_194400 ?auto_194401 ?auto_194402 ?auto_194398 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194434 - OBJ
      ?auto_194435 - OBJ
      ?auto_194436 - OBJ
      ?auto_194437 - OBJ
      ?auto_194433 - LOCATION
    )
    :vars
    (
      ?auto_194443 - LOCATION
      ?auto_194440 - CITY
      ?auto_194442 - LOCATION
      ?auto_194441 - LOCATION
      ?auto_194438 - LOCATION
      ?auto_194439 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_194443 ?auto_194440 ) ( IN-CITY ?auto_194433 ?auto_194440 ) ( not ( = ?auto_194433 ?auto_194443 ) ) ( OBJ-AT ?auto_194434 ?auto_194443 ) ( IN-CITY ?auto_194442 ?auto_194440 ) ( not ( = ?auto_194433 ?auto_194442 ) ) ( OBJ-AT ?auto_194436 ?auto_194442 ) ( IN-CITY ?auto_194441 ?auto_194440 ) ( not ( = ?auto_194433 ?auto_194441 ) ) ( OBJ-AT ?auto_194437 ?auto_194441 ) ( IN-CITY ?auto_194438 ?auto_194440 ) ( not ( = ?auto_194433 ?auto_194438 ) ) ( OBJ-AT ?auto_194435 ?auto_194438 ) ( TRUCK-AT ?auto_194439 ?auto_194433 ) ( not ( = ?auto_194435 ?auto_194437 ) ) ( not ( = ?auto_194441 ?auto_194438 ) ) ( not ( = ?auto_194435 ?auto_194436 ) ) ( not ( = ?auto_194437 ?auto_194436 ) ) ( not ( = ?auto_194442 ?auto_194441 ) ) ( not ( = ?auto_194442 ?auto_194438 ) ) ( not ( = ?auto_194435 ?auto_194434 ) ) ( not ( = ?auto_194437 ?auto_194434 ) ) ( not ( = ?auto_194436 ?auto_194434 ) ) ( not ( = ?auto_194443 ?auto_194442 ) ) ( not ( = ?auto_194443 ?auto_194441 ) ) ( not ( = ?auto_194443 ?auto_194438 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_194435 ?auto_194437 ?auto_194434 ?auto_194436 ?auto_194433 )
      ( DELIVER-4PKG-VERIFY ?auto_194434 ?auto_194435 ?auto_194436 ?auto_194437 ?auto_194433 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194543 - OBJ
      ?auto_194544 - OBJ
      ?auto_194545 - OBJ
      ?auto_194546 - OBJ
      ?auto_194542 - LOCATION
    )
    :vars
    (
      ?auto_194552 - LOCATION
      ?auto_194549 - CITY
      ?auto_194551 - LOCATION
      ?auto_194550 - LOCATION
      ?auto_194547 - LOCATION
      ?auto_194548 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_194552 ?auto_194549 ) ( IN-CITY ?auto_194542 ?auto_194549 ) ( not ( = ?auto_194542 ?auto_194552 ) ) ( OBJ-AT ?auto_194543 ?auto_194552 ) ( IN-CITY ?auto_194551 ?auto_194549 ) ( not ( = ?auto_194542 ?auto_194551 ) ) ( OBJ-AT ?auto_194546 ?auto_194551 ) ( IN-CITY ?auto_194550 ?auto_194549 ) ( not ( = ?auto_194542 ?auto_194550 ) ) ( OBJ-AT ?auto_194544 ?auto_194550 ) ( IN-CITY ?auto_194547 ?auto_194549 ) ( not ( = ?auto_194542 ?auto_194547 ) ) ( OBJ-AT ?auto_194545 ?auto_194547 ) ( TRUCK-AT ?auto_194548 ?auto_194542 ) ( not ( = ?auto_194545 ?auto_194544 ) ) ( not ( = ?auto_194550 ?auto_194547 ) ) ( not ( = ?auto_194545 ?auto_194546 ) ) ( not ( = ?auto_194544 ?auto_194546 ) ) ( not ( = ?auto_194551 ?auto_194550 ) ) ( not ( = ?auto_194551 ?auto_194547 ) ) ( not ( = ?auto_194545 ?auto_194543 ) ) ( not ( = ?auto_194544 ?auto_194543 ) ) ( not ( = ?auto_194546 ?auto_194543 ) ) ( not ( = ?auto_194552 ?auto_194551 ) ) ( not ( = ?auto_194552 ?auto_194550 ) ) ( not ( = ?auto_194552 ?auto_194547 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_194545 ?auto_194544 ?auto_194543 ?auto_194546 ?auto_194542 )
      ( DELIVER-4PKG-VERIFY ?auto_194543 ?auto_194544 ?auto_194545 ?auto_194546 ?auto_194542 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194616 - OBJ
      ?auto_194617 - OBJ
      ?auto_194618 - OBJ
      ?auto_194619 - OBJ
      ?auto_194615 - LOCATION
    )
    :vars
    (
      ?auto_194625 - LOCATION
      ?auto_194622 - CITY
      ?auto_194624 - LOCATION
      ?auto_194623 - LOCATION
      ?auto_194620 - LOCATION
      ?auto_194621 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_194625 ?auto_194622 ) ( IN-CITY ?auto_194615 ?auto_194622 ) ( not ( = ?auto_194615 ?auto_194625 ) ) ( OBJ-AT ?auto_194616 ?auto_194625 ) ( IN-CITY ?auto_194624 ?auto_194622 ) ( not ( = ?auto_194615 ?auto_194624 ) ) ( OBJ-AT ?auto_194618 ?auto_194624 ) ( IN-CITY ?auto_194623 ?auto_194622 ) ( not ( = ?auto_194615 ?auto_194623 ) ) ( OBJ-AT ?auto_194617 ?auto_194623 ) ( IN-CITY ?auto_194620 ?auto_194622 ) ( not ( = ?auto_194615 ?auto_194620 ) ) ( OBJ-AT ?auto_194619 ?auto_194620 ) ( TRUCK-AT ?auto_194621 ?auto_194615 ) ( not ( = ?auto_194619 ?auto_194617 ) ) ( not ( = ?auto_194623 ?auto_194620 ) ) ( not ( = ?auto_194619 ?auto_194618 ) ) ( not ( = ?auto_194617 ?auto_194618 ) ) ( not ( = ?auto_194624 ?auto_194623 ) ) ( not ( = ?auto_194624 ?auto_194620 ) ) ( not ( = ?auto_194619 ?auto_194616 ) ) ( not ( = ?auto_194617 ?auto_194616 ) ) ( not ( = ?auto_194618 ?auto_194616 ) ) ( not ( = ?auto_194625 ?auto_194624 ) ) ( not ( = ?auto_194625 ?auto_194623 ) ) ( not ( = ?auto_194625 ?auto_194620 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_194619 ?auto_194617 ?auto_194616 ?auto_194618 ?auto_194615 )
      ( DELIVER-4PKG-VERIFY ?auto_194616 ?auto_194617 ?auto_194618 ?auto_194619 ?auto_194615 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194725 - OBJ
      ?auto_194726 - OBJ
      ?auto_194727 - OBJ
      ?auto_194728 - OBJ
      ?auto_194724 - LOCATION
    )
    :vars
    (
      ?auto_194734 - LOCATION
      ?auto_194731 - CITY
      ?auto_194733 - LOCATION
      ?auto_194732 - LOCATION
      ?auto_194729 - LOCATION
      ?auto_194730 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_194734 ?auto_194731 ) ( IN-CITY ?auto_194724 ?auto_194731 ) ( not ( = ?auto_194724 ?auto_194734 ) ) ( OBJ-AT ?auto_194725 ?auto_194734 ) ( IN-CITY ?auto_194733 ?auto_194731 ) ( not ( = ?auto_194724 ?auto_194733 ) ) ( OBJ-AT ?auto_194726 ?auto_194733 ) ( IN-CITY ?auto_194732 ?auto_194731 ) ( not ( = ?auto_194724 ?auto_194732 ) ) ( OBJ-AT ?auto_194728 ?auto_194732 ) ( IN-CITY ?auto_194729 ?auto_194731 ) ( not ( = ?auto_194724 ?auto_194729 ) ) ( OBJ-AT ?auto_194727 ?auto_194729 ) ( TRUCK-AT ?auto_194730 ?auto_194724 ) ( not ( = ?auto_194727 ?auto_194728 ) ) ( not ( = ?auto_194732 ?auto_194729 ) ) ( not ( = ?auto_194727 ?auto_194726 ) ) ( not ( = ?auto_194728 ?auto_194726 ) ) ( not ( = ?auto_194733 ?auto_194732 ) ) ( not ( = ?auto_194733 ?auto_194729 ) ) ( not ( = ?auto_194727 ?auto_194725 ) ) ( not ( = ?auto_194728 ?auto_194725 ) ) ( not ( = ?auto_194726 ?auto_194725 ) ) ( not ( = ?auto_194734 ?auto_194733 ) ) ( not ( = ?auto_194734 ?auto_194732 ) ) ( not ( = ?auto_194734 ?auto_194729 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_194727 ?auto_194728 ?auto_194725 ?auto_194726 ?auto_194724 )
      ( DELIVER-4PKG-VERIFY ?auto_194725 ?auto_194726 ?auto_194727 ?auto_194728 ?auto_194724 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194760 - OBJ
      ?auto_194761 - OBJ
      ?auto_194762 - OBJ
      ?auto_194763 - OBJ
      ?auto_194759 - LOCATION
    )
    :vars
    (
      ?auto_194769 - LOCATION
      ?auto_194766 - CITY
      ?auto_194768 - LOCATION
      ?auto_194767 - LOCATION
      ?auto_194764 - LOCATION
      ?auto_194765 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_194769 ?auto_194766 ) ( IN-CITY ?auto_194759 ?auto_194766 ) ( not ( = ?auto_194759 ?auto_194769 ) ) ( OBJ-AT ?auto_194760 ?auto_194769 ) ( IN-CITY ?auto_194768 ?auto_194766 ) ( not ( = ?auto_194759 ?auto_194768 ) ) ( OBJ-AT ?auto_194761 ?auto_194768 ) ( IN-CITY ?auto_194767 ?auto_194766 ) ( not ( = ?auto_194759 ?auto_194767 ) ) ( OBJ-AT ?auto_194762 ?auto_194767 ) ( IN-CITY ?auto_194764 ?auto_194766 ) ( not ( = ?auto_194759 ?auto_194764 ) ) ( OBJ-AT ?auto_194763 ?auto_194764 ) ( TRUCK-AT ?auto_194765 ?auto_194759 ) ( not ( = ?auto_194763 ?auto_194762 ) ) ( not ( = ?auto_194767 ?auto_194764 ) ) ( not ( = ?auto_194763 ?auto_194761 ) ) ( not ( = ?auto_194762 ?auto_194761 ) ) ( not ( = ?auto_194768 ?auto_194767 ) ) ( not ( = ?auto_194768 ?auto_194764 ) ) ( not ( = ?auto_194763 ?auto_194760 ) ) ( not ( = ?auto_194762 ?auto_194760 ) ) ( not ( = ?auto_194761 ?auto_194760 ) ) ( not ( = ?auto_194769 ?auto_194768 ) ) ( not ( = ?auto_194769 ?auto_194767 ) ) ( not ( = ?auto_194769 ?auto_194764 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_194763 ?auto_194762 ?auto_194760 ?auto_194761 ?auto_194759 )
      ( DELIVER-4PKG-VERIFY ?auto_194760 ?auto_194761 ?auto_194762 ?auto_194763 ?auto_194759 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_195112 - OBJ
      ?auto_195111 - LOCATION
    )
    :vars
    (
      ?auto_195114 - LOCATION
      ?auto_195115 - CITY
      ?auto_195113 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_195114 ?auto_195115 ) ( IN-CITY ?auto_195111 ?auto_195115 ) ( not ( = ?auto_195111 ?auto_195114 ) ) ( OBJ-AT ?auto_195112 ?auto_195114 ) ( TRUCK-AT ?auto_195113 ?auto_195111 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_195113 ?auto_195111 ?auto_195114 ?auto_195115 )
      ( !LOAD-TRUCK ?auto_195112 ?auto_195113 ?auto_195114 )
      ( !DRIVE-TRUCK ?auto_195113 ?auto_195114 ?auto_195111 ?auto_195115 )
      ( !UNLOAD-TRUCK ?auto_195112 ?auto_195113 ?auto_195111 )
      ( DELIVER-1PKG-VERIFY ?auto_195112 ?auto_195111 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_208931 - OBJ
      ?auto_208932 - OBJ
      ?auto_208933 - OBJ
      ?auto_208934 - OBJ
      ?auto_208935 - OBJ
      ?auto_208930 - LOCATION
    )
    :vars
    (
      ?auto_208937 - LOCATION
      ?auto_208936 - CITY
      ?auto_208942 - LOCATION
      ?auto_208941 - LOCATION
      ?auto_208940 - LOCATION
      ?auto_208939 - LOCATION
      ?auto_208938 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_208937 ?auto_208936 ) ( IN-CITY ?auto_208930 ?auto_208936 ) ( not ( = ?auto_208930 ?auto_208937 ) ) ( OBJ-AT ?auto_208935 ?auto_208937 ) ( IN-CITY ?auto_208942 ?auto_208936 ) ( not ( = ?auto_208930 ?auto_208942 ) ) ( OBJ-AT ?auto_208934 ?auto_208942 ) ( IN-CITY ?auto_208941 ?auto_208936 ) ( not ( = ?auto_208930 ?auto_208941 ) ) ( OBJ-AT ?auto_208933 ?auto_208941 ) ( IN-CITY ?auto_208940 ?auto_208936 ) ( not ( = ?auto_208930 ?auto_208940 ) ) ( OBJ-AT ?auto_208932 ?auto_208940 ) ( IN-CITY ?auto_208939 ?auto_208936 ) ( not ( = ?auto_208930 ?auto_208939 ) ) ( OBJ-AT ?auto_208931 ?auto_208939 ) ( TRUCK-AT ?auto_208938 ?auto_208930 ) ( not ( = ?auto_208931 ?auto_208932 ) ) ( not ( = ?auto_208940 ?auto_208939 ) ) ( not ( = ?auto_208931 ?auto_208933 ) ) ( not ( = ?auto_208932 ?auto_208933 ) ) ( not ( = ?auto_208941 ?auto_208940 ) ) ( not ( = ?auto_208941 ?auto_208939 ) ) ( not ( = ?auto_208931 ?auto_208934 ) ) ( not ( = ?auto_208932 ?auto_208934 ) ) ( not ( = ?auto_208933 ?auto_208934 ) ) ( not ( = ?auto_208942 ?auto_208941 ) ) ( not ( = ?auto_208942 ?auto_208940 ) ) ( not ( = ?auto_208942 ?auto_208939 ) ) ( not ( = ?auto_208931 ?auto_208935 ) ) ( not ( = ?auto_208932 ?auto_208935 ) ) ( not ( = ?auto_208933 ?auto_208935 ) ) ( not ( = ?auto_208934 ?auto_208935 ) ) ( not ( = ?auto_208937 ?auto_208942 ) ) ( not ( = ?auto_208937 ?auto_208941 ) ) ( not ( = ?auto_208937 ?auto_208940 ) ) ( not ( = ?auto_208937 ?auto_208939 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_208931 ?auto_208932 ?auto_208934 ?auto_208933 ?auto_208930 )
      ( DELIVER-1PKG ?auto_208935 ?auto_208930 )
      ( DELIVER-5PKG-VERIFY ?auto_208931 ?auto_208932 ?auto_208933 ?auto_208934 ?auto_208935 ?auto_208930 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_208986 - OBJ
      ?auto_208987 - OBJ
      ?auto_208988 - OBJ
      ?auto_208989 - OBJ
      ?auto_208990 - OBJ
      ?auto_208985 - LOCATION
    )
    :vars
    (
      ?auto_208996 - LOCATION
      ?auto_208997 - CITY
      ?auto_208993 - LOCATION
      ?auto_208995 - LOCATION
      ?auto_208992 - LOCATION
      ?auto_208994 - LOCATION
      ?auto_208991 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_208996 ?auto_208997 ) ( IN-CITY ?auto_208985 ?auto_208997 ) ( not ( = ?auto_208985 ?auto_208996 ) ) ( OBJ-AT ?auto_208989 ?auto_208996 ) ( IN-CITY ?auto_208993 ?auto_208997 ) ( not ( = ?auto_208985 ?auto_208993 ) ) ( OBJ-AT ?auto_208990 ?auto_208993 ) ( IN-CITY ?auto_208995 ?auto_208997 ) ( not ( = ?auto_208985 ?auto_208995 ) ) ( OBJ-AT ?auto_208988 ?auto_208995 ) ( IN-CITY ?auto_208992 ?auto_208997 ) ( not ( = ?auto_208985 ?auto_208992 ) ) ( OBJ-AT ?auto_208987 ?auto_208992 ) ( IN-CITY ?auto_208994 ?auto_208997 ) ( not ( = ?auto_208985 ?auto_208994 ) ) ( OBJ-AT ?auto_208986 ?auto_208994 ) ( TRUCK-AT ?auto_208991 ?auto_208985 ) ( not ( = ?auto_208986 ?auto_208987 ) ) ( not ( = ?auto_208992 ?auto_208994 ) ) ( not ( = ?auto_208986 ?auto_208988 ) ) ( not ( = ?auto_208987 ?auto_208988 ) ) ( not ( = ?auto_208995 ?auto_208992 ) ) ( not ( = ?auto_208995 ?auto_208994 ) ) ( not ( = ?auto_208986 ?auto_208990 ) ) ( not ( = ?auto_208987 ?auto_208990 ) ) ( not ( = ?auto_208988 ?auto_208990 ) ) ( not ( = ?auto_208993 ?auto_208995 ) ) ( not ( = ?auto_208993 ?auto_208992 ) ) ( not ( = ?auto_208993 ?auto_208994 ) ) ( not ( = ?auto_208986 ?auto_208989 ) ) ( not ( = ?auto_208987 ?auto_208989 ) ) ( not ( = ?auto_208988 ?auto_208989 ) ) ( not ( = ?auto_208990 ?auto_208989 ) ) ( not ( = ?auto_208996 ?auto_208993 ) ) ( not ( = ?auto_208996 ?auto_208995 ) ) ( not ( = ?auto_208996 ?auto_208992 ) ) ( not ( = ?auto_208996 ?auto_208994 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_208986 ?auto_208987 ?auto_208988 ?auto_208990 ?auto_208989 ?auto_208985 )
      ( DELIVER-5PKG-VERIFY ?auto_208986 ?auto_208987 ?auto_208988 ?auto_208989 ?auto_208990 ?auto_208985 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_209041 - OBJ
      ?auto_209042 - OBJ
      ?auto_209043 - OBJ
      ?auto_209044 - OBJ
      ?auto_209045 - OBJ
      ?auto_209040 - LOCATION
    )
    :vars
    (
      ?auto_209051 - LOCATION
      ?auto_209050 - CITY
      ?auto_209048 - LOCATION
      ?auto_209049 - LOCATION
      ?auto_209047 - LOCATION
      ?auto_209046 - LOCATION
      ?auto_209052 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_209051 ?auto_209050 ) ( IN-CITY ?auto_209040 ?auto_209050 ) ( not ( = ?auto_209040 ?auto_209051 ) ) ( OBJ-AT ?auto_209045 ?auto_209051 ) ( IN-CITY ?auto_209048 ?auto_209050 ) ( not ( = ?auto_209040 ?auto_209048 ) ) ( OBJ-AT ?auto_209043 ?auto_209048 ) ( IN-CITY ?auto_209049 ?auto_209050 ) ( not ( = ?auto_209040 ?auto_209049 ) ) ( OBJ-AT ?auto_209044 ?auto_209049 ) ( IN-CITY ?auto_209047 ?auto_209050 ) ( not ( = ?auto_209040 ?auto_209047 ) ) ( OBJ-AT ?auto_209042 ?auto_209047 ) ( IN-CITY ?auto_209046 ?auto_209050 ) ( not ( = ?auto_209040 ?auto_209046 ) ) ( OBJ-AT ?auto_209041 ?auto_209046 ) ( TRUCK-AT ?auto_209052 ?auto_209040 ) ( not ( = ?auto_209041 ?auto_209042 ) ) ( not ( = ?auto_209047 ?auto_209046 ) ) ( not ( = ?auto_209041 ?auto_209044 ) ) ( not ( = ?auto_209042 ?auto_209044 ) ) ( not ( = ?auto_209049 ?auto_209047 ) ) ( not ( = ?auto_209049 ?auto_209046 ) ) ( not ( = ?auto_209041 ?auto_209043 ) ) ( not ( = ?auto_209042 ?auto_209043 ) ) ( not ( = ?auto_209044 ?auto_209043 ) ) ( not ( = ?auto_209048 ?auto_209049 ) ) ( not ( = ?auto_209048 ?auto_209047 ) ) ( not ( = ?auto_209048 ?auto_209046 ) ) ( not ( = ?auto_209041 ?auto_209045 ) ) ( not ( = ?auto_209042 ?auto_209045 ) ) ( not ( = ?auto_209044 ?auto_209045 ) ) ( not ( = ?auto_209043 ?auto_209045 ) ) ( not ( = ?auto_209051 ?auto_209048 ) ) ( not ( = ?auto_209051 ?auto_209049 ) ) ( not ( = ?auto_209051 ?auto_209047 ) ) ( not ( = ?auto_209051 ?auto_209046 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_209041 ?auto_209042 ?auto_209044 ?auto_209045 ?auto_209043 ?auto_209040 )
      ( DELIVER-5PKG-VERIFY ?auto_209041 ?auto_209042 ?auto_209043 ?auto_209044 ?auto_209045 ?auto_209040 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_209096 - OBJ
      ?auto_209097 - OBJ
      ?auto_209098 - OBJ
      ?auto_209099 - OBJ
      ?auto_209100 - OBJ
      ?auto_209095 - LOCATION
    )
    :vars
    (
      ?auto_209106 - LOCATION
      ?auto_209105 - CITY
      ?auto_209103 - LOCATION
      ?auto_209104 - LOCATION
      ?auto_209102 - LOCATION
      ?auto_209101 - LOCATION
      ?auto_209107 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_209106 ?auto_209105 ) ( IN-CITY ?auto_209095 ?auto_209105 ) ( not ( = ?auto_209095 ?auto_209106 ) ) ( OBJ-AT ?auto_209099 ?auto_209106 ) ( IN-CITY ?auto_209103 ?auto_209105 ) ( not ( = ?auto_209095 ?auto_209103 ) ) ( OBJ-AT ?auto_209098 ?auto_209103 ) ( IN-CITY ?auto_209104 ?auto_209105 ) ( not ( = ?auto_209095 ?auto_209104 ) ) ( OBJ-AT ?auto_209100 ?auto_209104 ) ( IN-CITY ?auto_209102 ?auto_209105 ) ( not ( = ?auto_209095 ?auto_209102 ) ) ( OBJ-AT ?auto_209097 ?auto_209102 ) ( IN-CITY ?auto_209101 ?auto_209105 ) ( not ( = ?auto_209095 ?auto_209101 ) ) ( OBJ-AT ?auto_209096 ?auto_209101 ) ( TRUCK-AT ?auto_209107 ?auto_209095 ) ( not ( = ?auto_209096 ?auto_209097 ) ) ( not ( = ?auto_209102 ?auto_209101 ) ) ( not ( = ?auto_209096 ?auto_209100 ) ) ( not ( = ?auto_209097 ?auto_209100 ) ) ( not ( = ?auto_209104 ?auto_209102 ) ) ( not ( = ?auto_209104 ?auto_209101 ) ) ( not ( = ?auto_209096 ?auto_209098 ) ) ( not ( = ?auto_209097 ?auto_209098 ) ) ( not ( = ?auto_209100 ?auto_209098 ) ) ( not ( = ?auto_209103 ?auto_209104 ) ) ( not ( = ?auto_209103 ?auto_209102 ) ) ( not ( = ?auto_209103 ?auto_209101 ) ) ( not ( = ?auto_209096 ?auto_209099 ) ) ( not ( = ?auto_209097 ?auto_209099 ) ) ( not ( = ?auto_209100 ?auto_209099 ) ) ( not ( = ?auto_209098 ?auto_209099 ) ) ( not ( = ?auto_209106 ?auto_209103 ) ) ( not ( = ?auto_209106 ?auto_209104 ) ) ( not ( = ?auto_209106 ?auto_209102 ) ) ( not ( = ?auto_209106 ?auto_209101 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_209096 ?auto_209097 ?auto_209100 ?auto_209099 ?auto_209098 ?auto_209095 )
      ( DELIVER-5PKG-VERIFY ?auto_209096 ?auto_209097 ?auto_209098 ?auto_209099 ?auto_209100 ?auto_209095 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_209325 - OBJ
      ?auto_209326 - OBJ
      ?auto_209327 - OBJ
      ?auto_209328 - OBJ
      ?auto_209329 - OBJ
      ?auto_209324 - LOCATION
    )
    :vars
    (
      ?auto_209335 - LOCATION
      ?auto_209334 - CITY
      ?auto_209332 - LOCATION
      ?auto_209333 - LOCATION
      ?auto_209331 - LOCATION
      ?auto_209330 - LOCATION
      ?auto_209336 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_209335 ?auto_209334 ) ( IN-CITY ?auto_209324 ?auto_209334 ) ( not ( = ?auto_209324 ?auto_209335 ) ) ( OBJ-AT ?auto_209327 ?auto_209335 ) ( IN-CITY ?auto_209332 ?auto_209334 ) ( not ( = ?auto_209324 ?auto_209332 ) ) ( OBJ-AT ?auto_209329 ?auto_209332 ) ( IN-CITY ?auto_209333 ?auto_209334 ) ( not ( = ?auto_209324 ?auto_209333 ) ) ( OBJ-AT ?auto_209328 ?auto_209333 ) ( IN-CITY ?auto_209331 ?auto_209334 ) ( not ( = ?auto_209324 ?auto_209331 ) ) ( OBJ-AT ?auto_209326 ?auto_209331 ) ( IN-CITY ?auto_209330 ?auto_209334 ) ( not ( = ?auto_209324 ?auto_209330 ) ) ( OBJ-AT ?auto_209325 ?auto_209330 ) ( TRUCK-AT ?auto_209336 ?auto_209324 ) ( not ( = ?auto_209325 ?auto_209326 ) ) ( not ( = ?auto_209331 ?auto_209330 ) ) ( not ( = ?auto_209325 ?auto_209328 ) ) ( not ( = ?auto_209326 ?auto_209328 ) ) ( not ( = ?auto_209333 ?auto_209331 ) ) ( not ( = ?auto_209333 ?auto_209330 ) ) ( not ( = ?auto_209325 ?auto_209329 ) ) ( not ( = ?auto_209326 ?auto_209329 ) ) ( not ( = ?auto_209328 ?auto_209329 ) ) ( not ( = ?auto_209332 ?auto_209333 ) ) ( not ( = ?auto_209332 ?auto_209331 ) ) ( not ( = ?auto_209332 ?auto_209330 ) ) ( not ( = ?auto_209325 ?auto_209327 ) ) ( not ( = ?auto_209326 ?auto_209327 ) ) ( not ( = ?auto_209328 ?auto_209327 ) ) ( not ( = ?auto_209329 ?auto_209327 ) ) ( not ( = ?auto_209335 ?auto_209332 ) ) ( not ( = ?auto_209335 ?auto_209333 ) ) ( not ( = ?auto_209335 ?auto_209331 ) ) ( not ( = ?auto_209335 ?auto_209330 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_209325 ?auto_209326 ?auto_209328 ?auto_209327 ?auto_209329 ?auto_209324 )
      ( DELIVER-5PKG-VERIFY ?auto_209325 ?auto_209326 ?auto_209327 ?auto_209328 ?auto_209329 ?auto_209324 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_209380 - OBJ
      ?auto_209381 - OBJ
      ?auto_209382 - OBJ
      ?auto_209383 - OBJ
      ?auto_209384 - OBJ
      ?auto_209379 - LOCATION
    )
    :vars
    (
      ?auto_209390 - LOCATION
      ?auto_209389 - CITY
      ?auto_209387 - LOCATION
      ?auto_209388 - LOCATION
      ?auto_209386 - LOCATION
      ?auto_209385 - LOCATION
      ?auto_209391 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_209390 ?auto_209389 ) ( IN-CITY ?auto_209379 ?auto_209389 ) ( not ( = ?auto_209379 ?auto_209390 ) ) ( OBJ-AT ?auto_209382 ?auto_209390 ) ( IN-CITY ?auto_209387 ?auto_209389 ) ( not ( = ?auto_209379 ?auto_209387 ) ) ( OBJ-AT ?auto_209383 ?auto_209387 ) ( IN-CITY ?auto_209388 ?auto_209389 ) ( not ( = ?auto_209379 ?auto_209388 ) ) ( OBJ-AT ?auto_209384 ?auto_209388 ) ( IN-CITY ?auto_209386 ?auto_209389 ) ( not ( = ?auto_209379 ?auto_209386 ) ) ( OBJ-AT ?auto_209381 ?auto_209386 ) ( IN-CITY ?auto_209385 ?auto_209389 ) ( not ( = ?auto_209379 ?auto_209385 ) ) ( OBJ-AT ?auto_209380 ?auto_209385 ) ( TRUCK-AT ?auto_209391 ?auto_209379 ) ( not ( = ?auto_209380 ?auto_209381 ) ) ( not ( = ?auto_209386 ?auto_209385 ) ) ( not ( = ?auto_209380 ?auto_209384 ) ) ( not ( = ?auto_209381 ?auto_209384 ) ) ( not ( = ?auto_209388 ?auto_209386 ) ) ( not ( = ?auto_209388 ?auto_209385 ) ) ( not ( = ?auto_209380 ?auto_209383 ) ) ( not ( = ?auto_209381 ?auto_209383 ) ) ( not ( = ?auto_209384 ?auto_209383 ) ) ( not ( = ?auto_209387 ?auto_209388 ) ) ( not ( = ?auto_209387 ?auto_209386 ) ) ( not ( = ?auto_209387 ?auto_209385 ) ) ( not ( = ?auto_209380 ?auto_209382 ) ) ( not ( = ?auto_209381 ?auto_209382 ) ) ( not ( = ?auto_209384 ?auto_209382 ) ) ( not ( = ?auto_209383 ?auto_209382 ) ) ( not ( = ?auto_209390 ?auto_209387 ) ) ( not ( = ?auto_209390 ?auto_209388 ) ) ( not ( = ?auto_209390 ?auto_209386 ) ) ( not ( = ?auto_209390 ?auto_209385 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_209380 ?auto_209381 ?auto_209384 ?auto_209382 ?auto_209383 ?auto_209379 )
      ( DELIVER-5PKG-VERIFY ?auto_209380 ?auto_209381 ?auto_209382 ?auto_209383 ?auto_209384 ?auto_209379 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_209667 - OBJ
      ?auto_209668 - OBJ
      ?auto_209669 - OBJ
      ?auto_209670 - OBJ
      ?auto_209671 - OBJ
      ?auto_209666 - LOCATION
    )
    :vars
    (
      ?auto_209677 - LOCATION
      ?auto_209676 - CITY
      ?auto_209674 - LOCATION
      ?auto_209675 - LOCATION
      ?auto_209673 - LOCATION
      ?auto_209672 - LOCATION
      ?auto_209678 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_209677 ?auto_209676 ) ( IN-CITY ?auto_209666 ?auto_209676 ) ( not ( = ?auto_209666 ?auto_209677 ) ) ( OBJ-AT ?auto_209671 ?auto_209677 ) ( IN-CITY ?auto_209674 ?auto_209676 ) ( not ( = ?auto_209666 ?auto_209674 ) ) ( OBJ-AT ?auto_209670 ?auto_209674 ) ( IN-CITY ?auto_209675 ?auto_209676 ) ( not ( = ?auto_209666 ?auto_209675 ) ) ( OBJ-AT ?auto_209668 ?auto_209675 ) ( IN-CITY ?auto_209673 ?auto_209676 ) ( not ( = ?auto_209666 ?auto_209673 ) ) ( OBJ-AT ?auto_209669 ?auto_209673 ) ( IN-CITY ?auto_209672 ?auto_209676 ) ( not ( = ?auto_209666 ?auto_209672 ) ) ( OBJ-AT ?auto_209667 ?auto_209672 ) ( TRUCK-AT ?auto_209678 ?auto_209666 ) ( not ( = ?auto_209667 ?auto_209669 ) ) ( not ( = ?auto_209673 ?auto_209672 ) ) ( not ( = ?auto_209667 ?auto_209668 ) ) ( not ( = ?auto_209669 ?auto_209668 ) ) ( not ( = ?auto_209675 ?auto_209673 ) ) ( not ( = ?auto_209675 ?auto_209672 ) ) ( not ( = ?auto_209667 ?auto_209670 ) ) ( not ( = ?auto_209669 ?auto_209670 ) ) ( not ( = ?auto_209668 ?auto_209670 ) ) ( not ( = ?auto_209674 ?auto_209675 ) ) ( not ( = ?auto_209674 ?auto_209673 ) ) ( not ( = ?auto_209674 ?auto_209672 ) ) ( not ( = ?auto_209667 ?auto_209671 ) ) ( not ( = ?auto_209669 ?auto_209671 ) ) ( not ( = ?auto_209668 ?auto_209671 ) ) ( not ( = ?auto_209670 ?auto_209671 ) ) ( not ( = ?auto_209677 ?auto_209674 ) ) ( not ( = ?auto_209677 ?auto_209675 ) ) ( not ( = ?auto_209677 ?auto_209673 ) ) ( not ( = ?auto_209677 ?auto_209672 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_209667 ?auto_209669 ?auto_209668 ?auto_209671 ?auto_209670 ?auto_209666 )
      ( DELIVER-5PKG-VERIFY ?auto_209667 ?auto_209668 ?auto_209669 ?auto_209670 ?auto_209671 ?auto_209666 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_209722 - OBJ
      ?auto_209723 - OBJ
      ?auto_209724 - OBJ
      ?auto_209725 - OBJ
      ?auto_209726 - OBJ
      ?auto_209721 - LOCATION
    )
    :vars
    (
      ?auto_209732 - LOCATION
      ?auto_209731 - CITY
      ?auto_209729 - LOCATION
      ?auto_209730 - LOCATION
      ?auto_209728 - LOCATION
      ?auto_209727 - LOCATION
      ?auto_209733 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_209732 ?auto_209731 ) ( IN-CITY ?auto_209721 ?auto_209731 ) ( not ( = ?auto_209721 ?auto_209732 ) ) ( OBJ-AT ?auto_209725 ?auto_209732 ) ( IN-CITY ?auto_209729 ?auto_209731 ) ( not ( = ?auto_209721 ?auto_209729 ) ) ( OBJ-AT ?auto_209726 ?auto_209729 ) ( IN-CITY ?auto_209730 ?auto_209731 ) ( not ( = ?auto_209721 ?auto_209730 ) ) ( OBJ-AT ?auto_209723 ?auto_209730 ) ( IN-CITY ?auto_209728 ?auto_209731 ) ( not ( = ?auto_209721 ?auto_209728 ) ) ( OBJ-AT ?auto_209724 ?auto_209728 ) ( IN-CITY ?auto_209727 ?auto_209731 ) ( not ( = ?auto_209721 ?auto_209727 ) ) ( OBJ-AT ?auto_209722 ?auto_209727 ) ( TRUCK-AT ?auto_209733 ?auto_209721 ) ( not ( = ?auto_209722 ?auto_209724 ) ) ( not ( = ?auto_209728 ?auto_209727 ) ) ( not ( = ?auto_209722 ?auto_209723 ) ) ( not ( = ?auto_209724 ?auto_209723 ) ) ( not ( = ?auto_209730 ?auto_209728 ) ) ( not ( = ?auto_209730 ?auto_209727 ) ) ( not ( = ?auto_209722 ?auto_209726 ) ) ( not ( = ?auto_209724 ?auto_209726 ) ) ( not ( = ?auto_209723 ?auto_209726 ) ) ( not ( = ?auto_209729 ?auto_209730 ) ) ( not ( = ?auto_209729 ?auto_209728 ) ) ( not ( = ?auto_209729 ?auto_209727 ) ) ( not ( = ?auto_209722 ?auto_209725 ) ) ( not ( = ?auto_209724 ?auto_209725 ) ) ( not ( = ?auto_209723 ?auto_209725 ) ) ( not ( = ?auto_209726 ?auto_209725 ) ) ( not ( = ?auto_209732 ?auto_209729 ) ) ( not ( = ?auto_209732 ?auto_209730 ) ) ( not ( = ?auto_209732 ?auto_209728 ) ) ( not ( = ?auto_209732 ?auto_209727 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_209722 ?auto_209724 ?auto_209723 ?auto_209725 ?auto_209726 ?auto_209721 )
      ( DELIVER-5PKG-VERIFY ?auto_209722 ?auto_209723 ?auto_209724 ?auto_209725 ?auto_209726 ?auto_209721 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_209894 - OBJ
      ?auto_209895 - OBJ
      ?auto_209896 - OBJ
      ?auto_209897 - OBJ
      ?auto_209898 - OBJ
      ?auto_209893 - LOCATION
    )
    :vars
    (
      ?auto_209904 - LOCATION
      ?auto_209903 - CITY
      ?auto_209901 - LOCATION
      ?auto_209902 - LOCATION
      ?auto_209900 - LOCATION
      ?auto_209899 - LOCATION
      ?auto_209905 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_209904 ?auto_209903 ) ( IN-CITY ?auto_209893 ?auto_209903 ) ( not ( = ?auto_209893 ?auto_209904 ) ) ( OBJ-AT ?auto_209898 ?auto_209904 ) ( IN-CITY ?auto_209901 ?auto_209903 ) ( not ( = ?auto_209893 ?auto_209901 ) ) ( OBJ-AT ?auto_209896 ?auto_209901 ) ( IN-CITY ?auto_209902 ?auto_209903 ) ( not ( = ?auto_209893 ?auto_209902 ) ) ( OBJ-AT ?auto_209895 ?auto_209902 ) ( IN-CITY ?auto_209900 ?auto_209903 ) ( not ( = ?auto_209893 ?auto_209900 ) ) ( OBJ-AT ?auto_209897 ?auto_209900 ) ( IN-CITY ?auto_209899 ?auto_209903 ) ( not ( = ?auto_209893 ?auto_209899 ) ) ( OBJ-AT ?auto_209894 ?auto_209899 ) ( TRUCK-AT ?auto_209905 ?auto_209893 ) ( not ( = ?auto_209894 ?auto_209897 ) ) ( not ( = ?auto_209900 ?auto_209899 ) ) ( not ( = ?auto_209894 ?auto_209895 ) ) ( not ( = ?auto_209897 ?auto_209895 ) ) ( not ( = ?auto_209902 ?auto_209900 ) ) ( not ( = ?auto_209902 ?auto_209899 ) ) ( not ( = ?auto_209894 ?auto_209896 ) ) ( not ( = ?auto_209897 ?auto_209896 ) ) ( not ( = ?auto_209895 ?auto_209896 ) ) ( not ( = ?auto_209901 ?auto_209902 ) ) ( not ( = ?auto_209901 ?auto_209900 ) ) ( not ( = ?auto_209901 ?auto_209899 ) ) ( not ( = ?auto_209894 ?auto_209898 ) ) ( not ( = ?auto_209897 ?auto_209898 ) ) ( not ( = ?auto_209895 ?auto_209898 ) ) ( not ( = ?auto_209896 ?auto_209898 ) ) ( not ( = ?auto_209904 ?auto_209901 ) ) ( not ( = ?auto_209904 ?auto_209902 ) ) ( not ( = ?auto_209904 ?auto_209900 ) ) ( not ( = ?auto_209904 ?auto_209899 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_209894 ?auto_209897 ?auto_209895 ?auto_209898 ?auto_209896 ?auto_209893 )
      ( DELIVER-5PKG-VERIFY ?auto_209894 ?auto_209895 ?auto_209896 ?auto_209897 ?auto_209898 ?auto_209893 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_209949 - OBJ
      ?auto_209950 - OBJ
      ?auto_209951 - OBJ
      ?auto_209952 - OBJ
      ?auto_209953 - OBJ
      ?auto_209948 - LOCATION
    )
    :vars
    (
      ?auto_209959 - LOCATION
      ?auto_209958 - CITY
      ?auto_209956 - LOCATION
      ?auto_209957 - LOCATION
      ?auto_209955 - LOCATION
      ?auto_209954 - LOCATION
      ?auto_209960 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_209959 ?auto_209958 ) ( IN-CITY ?auto_209948 ?auto_209958 ) ( not ( = ?auto_209948 ?auto_209959 ) ) ( OBJ-AT ?auto_209952 ?auto_209959 ) ( IN-CITY ?auto_209956 ?auto_209958 ) ( not ( = ?auto_209948 ?auto_209956 ) ) ( OBJ-AT ?auto_209951 ?auto_209956 ) ( IN-CITY ?auto_209957 ?auto_209958 ) ( not ( = ?auto_209948 ?auto_209957 ) ) ( OBJ-AT ?auto_209950 ?auto_209957 ) ( IN-CITY ?auto_209955 ?auto_209958 ) ( not ( = ?auto_209948 ?auto_209955 ) ) ( OBJ-AT ?auto_209953 ?auto_209955 ) ( IN-CITY ?auto_209954 ?auto_209958 ) ( not ( = ?auto_209948 ?auto_209954 ) ) ( OBJ-AT ?auto_209949 ?auto_209954 ) ( TRUCK-AT ?auto_209960 ?auto_209948 ) ( not ( = ?auto_209949 ?auto_209953 ) ) ( not ( = ?auto_209955 ?auto_209954 ) ) ( not ( = ?auto_209949 ?auto_209950 ) ) ( not ( = ?auto_209953 ?auto_209950 ) ) ( not ( = ?auto_209957 ?auto_209955 ) ) ( not ( = ?auto_209957 ?auto_209954 ) ) ( not ( = ?auto_209949 ?auto_209951 ) ) ( not ( = ?auto_209953 ?auto_209951 ) ) ( not ( = ?auto_209950 ?auto_209951 ) ) ( not ( = ?auto_209956 ?auto_209957 ) ) ( not ( = ?auto_209956 ?auto_209955 ) ) ( not ( = ?auto_209956 ?auto_209954 ) ) ( not ( = ?auto_209949 ?auto_209952 ) ) ( not ( = ?auto_209953 ?auto_209952 ) ) ( not ( = ?auto_209950 ?auto_209952 ) ) ( not ( = ?auto_209951 ?auto_209952 ) ) ( not ( = ?auto_209959 ?auto_209956 ) ) ( not ( = ?auto_209959 ?auto_209957 ) ) ( not ( = ?auto_209959 ?auto_209955 ) ) ( not ( = ?auto_209959 ?auto_209954 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_209949 ?auto_209953 ?auto_209950 ?auto_209952 ?auto_209951 ?auto_209948 )
      ( DELIVER-5PKG-VERIFY ?auto_209949 ?auto_209950 ?auto_209951 ?auto_209952 ?auto_209953 ?auto_209948 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_210119 - OBJ
      ?auto_210120 - OBJ
      ?auto_210121 - OBJ
      ?auto_210122 - OBJ
      ?auto_210123 - OBJ
      ?auto_210118 - LOCATION
    )
    :vars
    (
      ?auto_210129 - LOCATION
      ?auto_210128 - CITY
      ?auto_210126 - LOCATION
      ?auto_210127 - LOCATION
      ?auto_210125 - LOCATION
      ?auto_210124 - LOCATION
      ?auto_210130 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_210129 ?auto_210128 ) ( IN-CITY ?auto_210118 ?auto_210128 ) ( not ( = ?auto_210118 ?auto_210129 ) ) ( OBJ-AT ?auto_210121 ?auto_210129 ) ( IN-CITY ?auto_210126 ?auto_210128 ) ( not ( = ?auto_210118 ?auto_210126 ) ) ( OBJ-AT ?auto_210123 ?auto_210126 ) ( IN-CITY ?auto_210127 ?auto_210128 ) ( not ( = ?auto_210118 ?auto_210127 ) ) ( OBJ-AT ?auto_210120 ?auto_210127 ) ( IN-CITY ?auto_210125 ?auto_210128 ) ( not ( = ?auto_210118 ?auto_210125 ) ) ( OBJ-AT ?auto_210122 ?auto_210125 ) ( IN-CITY ?auto_210124 ?auto_210128 ) ( not ( = ?auto_210118 ?auto_210124 ) ) ( OBJ-AT ?auto_210119 ?auto_210124 ) ( TRUCK-AT ?auto_210130 ?auto_210118 ) ( not ( = ?auto_210119 ?auto_210122 ) ) ( not ( = ?auto_210125 ?auto_210124 ) ) ( not ( = ?auto_210119 ?auto_210120 ) ) ( not ( = ?auto_210122 ?auto_210120 ) ) ( not ( = ?auto_210127 ?auto_210125 ) ) ( not ( = ?auto_210127 ?auto_210124 ) ) ( not ( = ?auto_210119 ?auto_210123 ) ) ( not ( = ?auto_210122 ?auto_210123 ) ) ( not ( = ?auto_210120 ?auto_210123 ) ) ( not ( = ?auto_210126 ?auto_210127 ) ) ( not ( = ?auto_210126 ?auto_210125 ) ) ( not ( = ?auto_210126 ?auto_210124 ) ) ( not ( = ?auto_210119 ?auto_210121 ) ) ( not ( = ?auto_210122 ?auto_210121 ) ) ( not ( = ?auto_210120 ?auto_210121 ) ) ( not ( = ?auto_210123 ?auto_210121 ) ) ( not ( = ?auto_210129 ?auto_210126 ) ) ( not ( = ?auto_210129 ?auto_210127 ) ) ( not ( = ?auto_210129 ?auto_210125 ) ) ( not ( = ?auto_210129 ?auto_210124 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_210119 ?auto_210122 ?auto_210120 ?auto_210121 ?auto_210123 ?auto_210118 )
      ( DELIVER-5PKG-VERIFY ?auto_210119 ?auto_210120 ?auto_210121 ?auto_210122 ?auto_210123 ?auto_210118 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_210233 - OBJ
      ?auto_210234 - OBJ
      ?auto_210235 - OBJ
      ?auto_210236 - OBJ
      ?auto_210237 - OBJ
      ?auto_210232 - LOCATION
    )
    :vars
    (
      ?auto_210243 - LOCATION
      ?auto_210242 - CITY
      ?auto_210240 - LOCATION
      ?auto_210241 - LOCATION
      ?auto_210239 - LOCATION
      ?auto_210238 - LOCATION
      ?auto_210244 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_210243 ?auto_210242 ) ( IN-CITY ?auto_210232 ?auto_210242 ) ( not ( = ?auto_210232 ?auto_210243 ) ) ( OBJ-AT ?auto_210235 ?auto_210243 ) ( IN-CITY ?auto_210240 ?auto_210242 ) ( not ( = ?auto_210232 ?auto_210240 ) ) ( OBJ-AT ?auto_210236 ?auto_210240 ) ( IN-CITY ?auto_210241 ?auto_210242 ) ( not ( = ?auto_210232 ?auto_210241 ) ) ( OBJ-AT ?auto_210234 ?auto_210241 ) ( IN-CITY ?auto_210239 ?auto_210242 ) ( not ( = ?auto_210232 ?auto_210239 ) ) ( OBJ-AT ?auto_210237 ?auto_210239 ) ( IN-CITY ?auto_210238 ?auto_210242 ) ( not ( = ?auto_210232 ?auto_210238 ) ) ( OBJ-AT ?auto_210233 ?auto_210238 ) ( TRUCK-AT ?auto_210244 ?auto_210232 ) ( not ( = ?auto_210233 ?auto_210237 ) ) ( not ( = ?auto_210239 ?auto_210238 ) ) ( not ( = ?auto_210233 ?auto_210234 ) ) ( not ( = ?auto_210237 ?auto_210234 ) ) ( not ( = ?auto_210241 ?auto_210239 ) ) ( not ( = ?auto_210241 ?auto_210238 ) ) ( not ( = ?auto_210233 ?auto_210236 ) ) ( not ( = ?auto_210237 ?auto_210236 ) ) ( not ( = ?auto_210234 ?auto_210236 ) ) ( not ( = ?auto_210240 ?auto_210241 ) ) ( not ( = ?auto_210240 ?auto_210239 ) ) ( not ( = ?auto_210240 ?auto_210238 ) ) ( not ( = ?auto_210233 ?auto_210235 ) ) ( not ( = ?auto_210237 ?auto_210235 ) ) ( not ( = ?auto_210234 ?auto_210235 ) ) ( not ( = ?auto_210236 ?auto_210235 ) ) ( not ( = ?auto_210243 ?auto_210240 ) ) ( not ( = ?auto_210243 ?auto_210241 ) ) ( not ( = ?auto_210243 ?auto_210239 ) ) ( not ( = ?auto_210243 ?auto_210238 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_210233 ?auto_210237 ?auto_210234 ?auto_210235 ?auto_210236 ?auto_210232 )
      ( DELIVER-5PKG-VERIFY ?auto_210233 ?auto_210234 ?auto_210235 ?auto_210236 ?auto_210237 ?auto_210232 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_210520 - OBJ
      ?auto_210521 - OBJ
      ?auto_210522 - OBJ
      ?auto_210523 - OBJ
      ?auto_210524 - OBJ
      ?auto_210519 - LOCATION
    )
    :vars
    (
      ?auto_210530 - LOCATION
      ?auto_210529 - CITY
      ?auto_210527 - LOCATION
      ?auto_210528 - LOCATION
      ?auto_210526 - LOCATION
      ?auto_210525 - LOCATION
      ?auto_210531 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_210530 ?auto_210529 ) ( IN-CITY ?auto_210519 ?auto_210529 ) ( not ( = ?auto_210519 ?auto_210530 ) ) ( OBJ-AT ?auto_210524 ?auto_210530 ) ( IN-CITY ?auto_210527 ?auto_210529 ) ( not ( = ?auto_210519 ?auto_210527 ) ) ( OBJ-AT ?auto_210521 ?auto_210527 ) ( IN-CITY ?auto_210528 ?auto_210529 ) ( not ( = ?auto_210519 ?auto_210528 ) ) ( OBJ-AT ?auto_210523 ?auto_210528 ) ( IN-CITY ?auto_210526 ?auto_210529 ) ( not ( = ?auto_210519 ?auto_210526 ) ) ( OBJ-AT ?auto_210522 ?auto_210526 ) ( IN-CITY ?auto_210525 ?auto_210529 ) ( not ( = ?auto_210519 ?auto_210525 ) ) ( OBJ-AT ?auto_210520 ?auto_210525 ) ( TRUCK-AT ?auto_210531 ?auto_210519 ) ( not ( = ?auto_210520 ?auto_210522 ) ) ( not ( = ?auto_210526 ?auto_210525 ) ) ( not ( = ?auto_210520 ?auto_210523 ) ) ( not ( = ?auto_210522 ?auto_210523 ) ) ( not ( = ?auto_210528 ?auto_210526 ) ) ( not ( = ?auto_210528 ?auto_210525 ) ) ( not ( = ?auto_210520 ?auto_210521 ) ) ( not ( = ?auto_210522 ?auto_210521 ) ) ( not ( = ?auto_210523 ?auto_210521 ) ) ( not ( = ?auto_210527 ?auto_210528 ) ) ( not ( = ?auto_210527 ?auto_210526 ) ) ( not ( = ?auto_210527 ?auto_210525 ) ) ( not ( = ?auto_210520 ?auto_210524 ) ) ( not ( = ?auto_210522 ?auto_210524 ) ) ( not ( = ?auto_210523 ?auto_210524 ) ) ( not ( = ?auto_210521 ?auto_210524 ) ) ( not ( = ?auto_210530 ?auto_210527 ) ) ( not ( = ?auto_210530 ?auto_210528 ) ) ( not ( = ?auto_210530 ?auto_210526 ) ) ( not ( = ?auto_210530 ?auto_210525 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_210520 ?auto_210522 ?auto_210523 ?auto_210524 ?auto_210521 ?auto_210519 )
      ( DELIVER-5PKG-VERIFY ?auto_210520 ?auto_210521 ?auto_210522 ?auto_210523 ?auto_210524 ?auto_210519 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_210575 - OBJ
      ?auto_210576 - OBJ
      ?auto_210577 - OBJ
      ?auto_210578 - OBJ
      ?auto_210579 - OBJ
      ?auto_210574 - LOCATION
    )
    :vars
    (
      ?auto_210585 - LOCATION
      ?auto_210584 - CITY
      ?auto_210582 - LOCATION
      ?auto_210583 - LOCATION
      ?auto_210581 - LOCATION
      ?auto_210580 - LOCATION
      ?auto_210586 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_210585 ?auto_210584 ) ( IN-CITY ?auto_210574 ?auto_210584 ) ( not ( = ?auto_210574 ?auto_210585 ) ) ( OBJ-AT ?auto_210578 ?auto_210585 ) ( IN-CITY ?auto_210582 ?auto_210584 ) ( not ( = ?auto_210574 ?auto_210582 ) ) ( OBJ-AT ?auto_210576 ?auto_210582 ) ( IN-CITY ?auto_210583 ?auto_210584 ) ( not ( = ?auto_210574 ?auto_210583 ) ) ( OBJ-AT ?auto_210579 ?auto_210583 ) ( IN-CITY ?auto_210581 ?auto_210584 ) ( not ( = ?auto_210574 ?auto_210581 ) ) ( OBJ-AT ?auto_210577 ?auto_210581 ) ( IN-CITY ?auto_210580 ?auto_210584 ) ( not ( = ?auto_210574 ?auto_210580 ) ) ( OBJ-AT ?auto_210575 ?auto_210580 ) ( TRUCK-AT ?auto_210586 ?auto_210574 ) ( not ( = ?auto_210575 ?auto_210577 ) ) ( not ( = ?auto_210581 ?auto_210580 ) ) ( not ( = ?auto_210575 ?auto_210579 ) ) ( not ( = ?auto_210577 ?auto_210579 ) ) ( not ( = ?auto_210583 ?auto_210581 ) ) ( not ( = ?auto_210583 ?auto_210580 ) ) ( not ( = ?auto_210575 ?auto_210576 ) ) ( not ( = ?auto_210577 ?auto_210576 ) ) ( not ( = ?auto_210579 ?auto_210576 ) ) ( not ( = ?auto_210582 ?auto_210583 ) ) ( not ( = ?auto_210582 ?auto_210581 ) ) ( not ( = ?auto_210582 ?auto_210580 ) ) ( not ( = ?auto_210575 ?auto_210578 ) ) ( not ( = ?auto_210577 ?auto_210578 ) ) ( not ( = ?auto_210579 ?auto_210578 ) ) ( not ( = ?auto_210576 ?auto_210578 ) ) ( not ( = ?auto_210585 ?auto_210582 ) ) ( not ( = ?auto_210585 ?auto_210583 ) ) ( not ( = ?auto_210585 ?auto_210581 ) ) ( not ( = ?auto_210585 ?auto_210580 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_210575 ?auto_210577 ?auto_210579 ?auto_210578 ?auto_210576 ?auto_210574 )
      ( DELIVER-5PKG-VERIFY ?auto_210575 ?auto_210576 ?auto_210577 ?auto_210578 ?auto_210579 ?auto_210574 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_210630 - OBJ
      ?auto_210631 - OBJ
      ?auto_210632 - OBJ
      ?auto_210633 - OBJ
      ?auto_210634 - OBJ
      ?auto_210629 - LOCATION
    )
    :vars
    (
      ?auto_210640 - LOCATION
      ?auto_210639 - CITY
      ?auto_210637 - LOCATION
      ?auto_210638 - LOCATION
      ?auto_210636 - LOCATION
      ?auto_210635 - LOCATION
      ?auto_210641 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_210640 ?auto_210639 ) ( IN-CITY ?auto_210629 ?auto_210639 ) ( not ( = ?auto_210629 ?auto_210640 ) ) ( OBJ-AT ?auto_210634 ?auto_210640 ) ( IN-CITY ?auto_210637 ?auto_210639 ) ( not ( = ?auto_210629 ?auto_210637 ) ) ( OBJ-AT ?auto_210631 ?auto_210637 ) ( IN-CITY ?auto_210638 ?auto_210639 ) ( not ( = ?auto_210629 ?auto_210638 ) ) ( OBJ-AT ?auto_210632 ?auto_210638 ) ( IN-CITY ?auto_210636 ?auto_210639 ) ( not ( = ?auto_210629 ?auto_210636 ) ) ( OBJ-AT ?auto_210633 ?auto_210636 ) ( IN-CITY ?auto_210635 ?auto_210639 ) ( not ( = ?auto_210629 ?auto_210635 ) ) ( OBJ-AT ?auto_210630 ?auto_210635 ) ( TRUCK-AT ?auto_210641 ?auto_210629 ) ( not ( = ?auto_210630 ?auto_210633 ) ) ( not ( = ?auto_210636 ?auto_210635 ) ) ( not ( = ?auto_210630 ?auto_210632 ) ) ( not ( = ?auto_210633 ?auto_210632 ) ) ( not ( = ?auto_210638 ?auto_210636 ) ) ( not ( = ?auto_210638 ?auto_210635 ) ) ( not ( = ?auto_210630 ?auto_210631 ) ) ( not ( = ?auto_210633 ?auto_210631 ) ) ( not ( = ?auto_210632 ?auto_210631 ) ) ( not ( = ?auto_210637 ?auto_210638 ) ) ( not ( = ?auto_210637 ?auto_210636 ) ) ( not ( = ?auto_210637 ?auto_210635 ) ) ( not ( = ?auto_210630 ?auto_210634 ) ) ( not ( = ?auto_210633 ?auto_210634 ) ) ( not ( = ?auto_210632 ?auto_210634 ) ) ( not ( = ?auto_210631 ?auto_210634 ) ) ( not ( = ?auto_210640 ?auto_210637 ) ) ( not ( = ?auto_210640 ?auto_210638 ) ) ( not ( = ?auto_210640 ?auto_210636 ) ) ( not ( = ?auto_210640 ?auto_210635 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_210630 ?auto_210633 ?auto_210632 ?auto_210634 ?auto_210631 ?auto_210629 )
      ( DELIVER-5PKG-VERIFY ?auto_210630 ?auto_210631 ?auto_210632 ?auto_210633 ?auto_210634 ?auto_210629 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_210685 - OBJ
      ?auto_210686 - OBJ
      ?auto_210687 - OBJ
      ?auto_210688 - OBJ
      ?auto_210689 - OBJ
      ?auto_210684 - LOCATION
    )
    :vars
    (
      ?auto_210695 - LOCATION
      ?auto_210694 - CITY
      ?auto_210692 - LOCATION
      ?auto_210693 - LOCATION
      ?auto_210691 - LOCATION
      ?auto_210690 - LOCATION
      ?auto_210696 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_210695 ?auto_210694 ) ( IN-CITY ?auto_210684 ?auto_210694 ) ( not ( = ?auto_210684 ?auto_210695 ) ) ( OBJ-AT ?auto_210688 ?auto_210695 ) ( IN-CITY ?auto_210692 ?auto_210694 ) ( not ( = ?auto_210684 ?auto_210692 ) ) ( OBJ-AT ?auto_210686 ?auto_210692 ) ( IN-CITY ?auto_210693 ?auto_210694 ) ( not ( = ?auto_210684 ?auto_210693 ) ) ( OBJ-AT ?auto_210687 ?auto_210693 ) ( IN-CITY ?auto_210691 ?auto_210694 ) ( not ( = ?auto_210684 ?auto_210691 ) ) ( OBJ-AT ?auto_210689 ?auto_210691 ) ( IN-CITY ?auto_210690 ?auto_210694 ) ( not ( = ?auto_210684 ?auto_210690 ) ) ( OBJ-AT ?auto_210685 ?auto_210690 ) ( TRUCK-AT ?auto_210696 ?auto_210684 ) ( not ( = ?auto_210685 ?auto_210689 ) ) ( not ( = ?auto_210691 ?auto_210690 ) ) ( not ( = ?auto_210685 ?auto_210687 ) ) ( not ( = ?auto_210689 ?auto_210687 ) ) ( not ( = ?auto_210693 ?auto_210691 ) ) ( not ( = ?auto_210693 ?auto_210690 ) ) ( not ( = ?auto_210685 ?auto_210686 ) ) ( not ( = ?auto_210689 ?auto_210686 ) ) ( not ( = ?auto_210687 ?auto_210686 ) ) ( not ( = ?auto_210692 ?auto_210693 ) ) ( not ( = ?auto_210692 ?auto_210691 ) ) ( not ( = ?auto_210692 ?auto_210690 ) ) ( not ( = ?auto_210685 ?auto_210688 ) ) ( not ( = ?auto_210689 ?auto_210688 ) ) ( not ( = ?auto_210687 ?auto_210688 ) ) ( not ( = ?auto_210686 ?auto_210688 ) ) ( not ( = ?auto_210695 ?auto_210692 ) ) ( not ( = ?auto_210695 ?auto_210693 ) ) ( not ( = ?auto_210695 ?auto_210691 ) ) ( not ( = ?auto_210695 ?auto_210690 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_210685 ?auto_210689 ?auto_210687 ?auto_210688 ?auto_210686 ?auto_210684 )
      ( DELIVER-5PKG-VERIFY ?auto_210685 ?auto_210686 ?auto_210687 ?auto_210688 ?auto_210689 ?auto_210684 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_210972 - OBJ
      ?auto_210973 - OBJ
      ?auto_210974 - OBJ
      ?auto_210975 - OBJ
      ?auto_210976 - OBJ
      ?auto_210971 - LOCATION
    )
    :vars
    (
      ?auto_210982 - LOCATION
      ?auto_210981 - CITY
      ?auto_210979 - LOCATION
      ?auto_210980 - LOCATION
      ?auto_210978 - LOCATION
      ?auto_210977 - LOCATION
      ?auto_210983 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_210982 ?auto_210981 ) ( IN-CITY ?auto_210971 ?auto_210981 ) ( not ( = ?auto_210971 ?auto_210982 ) ) ( OBJ-AT ?auto_210974 ?auto_210982 ) ( IN-CITY ?auto_210979 ?auto_210981 ) ( not ( = ?auto_210971 ?auto_210979 ) ) ( OBJ-AT ?auto_210973 ?auto_210979 ) ( IN-CITY ?auto_210980 ?auto_210981 ) ( not ( = ?auto_210971 ?auto_210980 ) ) ( OBJ-AT ?auto_210976 ?auto_210980 ) ( IN-CITY ?auto_210978 ?auto_210981 ) ( not ( = ?auto_210971 ?auto_210978 ) ) ( OBJ-AT ?auto_210975 ?auto_210978 ) ( IN-CITY ?auto_210977 ?auto_210981 ) ( not ( = ?auto_210971 ?auto_210977 ) ) ( OBJ-AT ?auto_210972 ?auto_210977 ) ( TRUCK-AT ?auto_210983 ?auto_210971 ) ( not ( = ?auto_210972 ?auto_210975 ) ) ( not ( = ?auto_210978 ?auto_210977 ) ) ( not ( = ?auto_210972 ?auto_210976 ) ) ( not ( = ?auto_210975 ?auto_210976 ) ) ( not ( = ?auto_210980 ?auto_210978 ) ) ( not ( = ?auto_210980 ?auto_210977 ) ) ( not ( = ?auto_210972 ?auto_210973 ) ) ( not ( = ?auto_210975 ?auto_210973 ) ) ( not ( = ?auto_210976 ?auto_210973 ) ) ( not ( = ?auto_210979 ?auto_210980 ) ) ( not ( = ?auto_210979 ?auto_210978 ) ) ( not ( = ?auto_210979 ?auto_210977 ) ) ( not ( = ?auto_210972 ?auto_210974 ) ) ( not ( = ?auto_210975 ?auto_210974 ) ) ( not ( = ?auto_210976 ?auto_210974 ) ) ( not ( = ?auto_210973 ?auto_210974 ) ) ( not ( = ?auto_210982 ?auto_210979 ) ) ( not ( = ?auto_210982 ?auto_210980 ) ) ( not ( = ?auto_210982 ?auto_210978 ) ) ( not ( = ?auto_210982 ?auto_210977 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_210972 ?auto_210975 ?auto_210976 ?auto_210974 ?auto_210973 ?auto_210971 )
      ( DELIVER-5PKG-VERIFY ?auto_210972 ?auto_210973 ?auto_210974 ?auto_210975 ?auto_210976 ?auto_210971 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_211027 - OBJ
      ?auto_211028 - OBJ
      ?auto_211029 - OBJ
      ?auto_211030 - OBJ
      ?auto_211031 - OBJ
      ?auto_211026 - LOCATION
    )
    :vars
    (
      ?auto_211037 - LOCATION
      ?auto_211036 - CITY
      ?auto_211034 - LOCATION
      ?auto_211035 - LOCATION
      ?auto_211033 - LOCATION
      ?auto_211032 - LOCATION
      ?auto_211038 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_211037 ?auto_211036 ) ( IN-CITY ?auto_211026 ?auto_211036 ) ( not ( = ?auto_211026 ?auto_211037 ) ) ( OBJ-AT ?auto_211029 ?auto_211037 ) ( IN-CITY ?auto_211034 ?auto_211036 ) ( not ( = ?auto_211026 ?auto_211034 ) ) ( OBJ-AT ?auto_211028 ?auto_211034 ) ( IN-CITY ?auto_211035 ?auto_211036 ) ( not ( = ?auto_211026 ?auto_211035 ) ) ( OBJ-AT ?auto_211030 ?auto_211035 ) ( IN-CITY ?auto_211033 ?auto_211036 ) ( not ( = ?auto_211026 ?auto_211033 ) ) ( OBJ-AT ?auto_211031 ?auto_211033 ) ( IN-CITY ?auto_211032 ?auto_211036 ) ( not ( = ?auto_211026 ?auto_211032 ) ) ( OBJ-AT ?auto_211027 ?auto_211032 ) ( TRUCK-AT ?auto_211038 ?auto_211026 ) ( not ( = ?auto_211027 ?auto_211031 ) ) ( not ( = ?auto_211033 ?auto_211032 ) ) ( not ( = ?auto_211027 ?auto_211030 ) ) ( not ( = ?auto_211031 ?auto_211030 ) ) ( not ( = ?auto_211035 ?auto_211033 ) ) ( not ( = ?auto_211035 ?auto_211032 ) ) ( not ( = ?auto_211027 ?auto_211028 ) ) ( not ( = ?auto_211031 ?auto_211028 ) ) ( not ( = ?auto_211030 ?auto_211028 ) ) ( not ( = ?auto_211034 ?auto_211035 ) ) ( not ( = ?auto_211034 ?auto_211033 ) ) ( not ( = ?auto_211034 ?auto_211032 ) ) ( not ( = ?auto_211027 ?auto_211029 ) ) ( not ( = ?auto_211031 ?auto_211029 ) ) ( not ( = ?auto_211030 ?auto_211029 ) ) ( not ( = ?auto_211028 ?auto_211029 ) ) ( not ( = ?auto_211037 ?auto_211034 ) ) ( not ( = ?auto_211037 ?auto_211035 ) ) ( not ( = ?auto_211037 ?auto_211033 ) ) ( not ( = ?auto_211037 ?auto_211032 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_211027 ?auto_211031 ?auto_211030 ?auto_211029 ?auto_211028 ?auto_211026 )
      ( DELIVER-5PKG-VERIFY ?auto_211027 ?auto_211028 ?auto_211029 ?auto_211030 ?auto_211031 ?auto_211026 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_211789 - OBJ
      ?auto_211790 - OBJ
      ?auto_211791 - OBJ
      ?auto_211792 - OBJ
      ?auto_211793 - OBJ
      ?auto_211788 - LOCATION
    )
    :vars
    (
      ?auto_211799 - LOCATION
      ?auto_211798 - CITY
      ?auto_211796 - LOCATION
      ?auto_211797 - LOCATION
      ?auto_211795 - LOCATION
      ?auto_211794 - LOCATION
      ?auto_211800 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_211799 ?auto_211798 ) ( IN-CITY ?auto_211788 ?auto_211798 ) ( not ( = ?auto_211788 ?auto_211799 ) ) ( OBJ-AT ?auto_211790 ?auto_211799 ) ( IN-CITY ?auto_211796 ?auto_211798 ) ( not ( = ?auto_211788 ?auto_211796 ) ) ( OBJ-AT ?auto_211793 ?auto_211796 ) ( IN-CITY ?auto_211797 ?auto_211798 ) ( not ( = ?auto_211788 ?auto_211797 ) ) ( OBJ-AT ?auto_211792 ?auto_211797 ) ( IN-CITY ?auto_211795 ?auto_211798 ) ( not ( = ?auto_211788 ?auto_211795 ) ) ( OBJ-AT ?auto_211791 ?auto_211795 ) ( IN-CITY ?auto_211794 ?auto_211798 ) ( not ( = ?auto_211788 ?auto_211794 ) ) ( OBJ-AT ?auto_211789 ?auto_211794 ) ( TRUCK-AT ?auto_211800 ?auto_211788 ) ( not ( = ?auto_211789 ?auto_211791 ) ) ( not ( = ?auto_211795 ?auto_211794 ) ) ( not ( = ?auto_211789 ?auto_211792 ) ) ( not ( = ?auto_211791 ?auto_211792 ) ) ( not ( = ?auto_211797 ?auto_211795 ) ) ( not ( = ?auto_211797 ?auto_211794 ) ) ( not ( = ?auto_211789 ?auto_211793 ) ) ( not ( = ?auto_211791 ?auto_211793 ) ) ( not ( = ?auto_211792 ?auto_211793 ) ) ( not ( = ?auto_211796 ?auto_211797 ) ) ( not ( = ?auto_211796 ?auto_211795 ) ) ( not ( = ?auto_211796 ?auto_211794 ) ) ( not ( = ?auto_211789 ?auto_211790 ) ) ( not ( = ?auto_211791 ?auto_211790 ) ) ( not ( = ?auto_211792 ?auto_211790 ) ) ( not ( = ?auto_211793 ?auto_211790 ) ) ( not ( = ?auto_211799 ?auto_211796 ) ) ( not ( = ?auto_211799 ?auto_211797 ) ) ( not ( = ?auto_211799 ?auto_211795 ) ) ( not ( = ?auto_211799 ?auto_211794 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_211789 ?auto_211791 ?auto_211792 ?auto_211790 ?auto_211793 ?auto_211788 )
      ( DELIVER-5PKG-VERIFY ?auto_211789 ?auto_211790 ?auto_211791 ?auto_211792 ?auto_211793 ?auto_211788 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_211844 - OBJ
      ?auto_211845 - OBJ
      ?auto_211846 - OBJ
      ?auto_211847 - OBJ
      ?auto_211848 - OBJ
      ?auto_211843 - LOCATION
    )
    :vars
    (
      ?auto_211854 - LOCATION
      ?auto_211853 - CITY
      ?auto_211851 - LOCATION
      ?auto_211852 - LOCATION
      ?auto_211850 - LOCATION
      ?auto_211849 - LOCATION
      ?auto_211855 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_211854 ?auto_211853 ) ( IN-CITY ?auto_211843 ?auto_211853 ) ( not ( = ?auto_211843 ?auto_211854 ) ) ( OBJ-AT ?auto_211845 ?auto_211854 ) ( IN-CITY ?auto_211851 ?auto_211853 ) ( not ( = ?auto_211843 ?auto_211851 ) ) ( OBJ-AT ?auto_211847 ?auto_211851 ) ( IN-CITY ?auto_211852 ?auto_211853 ) ( not ( = ?auto_211843 ?auto_211852 ) ) ( OBJ-AT ?auto_211848 ?auto_211852 ) ( IN-CITY ?auto_211850 ?auto_211853 ) ( not ( = ?auto_211843 ?auto_211850 ) ) ( OBJ-AT ?auto_211846 ?auto_211850 ) ( IN-CITY ?auto_211849 ?auto_211853 ) ( not ( = ?auto_211843 ?auto_211849 ) ) ( OBJ-AT ?auto_211844 ?auto_211849 ) ( TRUCK-AT ?auto_211855 ?auto_211843 ) ( not ( = ?auto_211844 ?auto_211846 ) ) ( not ( = ?auto_211850 ?auto_211849 ) ) ( not ( = ?auto_211844 ?auto_211848 ) ) ( not ( = ?auto_211846 ?auto_211848 ) ) ( not ( = ?auto_211852 ?auto_211850 ) ) ( not ( = ?auto_211852 ?auto_211849 ) ) ( not ( = ?auto_211844 ?auto_211847 ) ) ( not ( = ?auto_211846 ?auto_211847 ) ) ( not ( = ?auto_211848 ?auto_211847 ) ) ( not ( = ?auto_211851 ?auto_211852 ) ) ( not ( = ?auto_211851 ?auto_211850 ) ) ( not ( = ?auto_211851 ?auto_211849 ) ) ( not ( = ?auto_211844 ?auto_211845 ) ) ( not ( = ?auto_211846 ?auto_211845 ) ) ( not ( = ?auto_211848 ?auto_211845 ) ) ( not ( = ?auto_211847 ?auto_211845 ) ) ( not ( = ?auto_211854 ?auto_211851 ) ) ( not ( = ?auto_211854 ?auto_211852 ) ) ( not ( = ?auto_211854 ?auto_211850 ) ) ( not ( = ?auto_211854 ?auto_211849 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_211844 ?auto_211846 ?auto_211848 ?auto_211845 ?auto_211847 ?auto_211843 )
      ( DELIVER-5PKG-VERIFY ?auto_211844 ?auto_211845 ?auto_211846 ?auto_211847 ?auto_211848 ?auto_211843 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_212073 - OBJ
      ?auto_212074 - OBJ
      ?auto_212075 - OBJ
      ?auto_212076 - OBJ
      ?auto_212077 - OBJ
      ?auto_212072 - LOCATION
    )
    :vars
    (
      ?auto_212083 - LOCATION
      ?auto_212082 - CITY
      ?auto_212080 - LOCATION
      ?auto_212081 - LOCATION
      ?auto_212079 - LOCATION
      ?auto_212078 - LOCATION
      ?auto_212084 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_212083 ?auto_212082 ) ( IN-CITY ?auto_212072 ?auto_212082 ) ( not ( = ?auto_212072 ?auto_212083 ) ) ( OBJ-AT ?auto_212074 ?auto_212083 ) ( IN-CITY ?auto_212080 ?auto_212082 ) ( not ( = ?auto_212072 ?auto_212080 ) ) ( OBJ-AT ?auto_212077 ?auto_212080 ) ( IN-CITY ?auto_212081 ?auto_212082 ) ( not ( = ?auto_212072 ?auto_212081 ) ) ( OBJ-AT ?auto_212075 ?auto_212081 ) ( IN-CITY ?auto_212079 ?auto_212082 ) ( not ( = ?auto_212072 ?auto_212079 ) ) ( OBJ-AT ?auto_212076 ?auto_212079 ) ( IN-CITY ?auto_212078 ?auto_212082 ) ( not ( = ?auto_212072 ?auto_212078 ) ) ( OBJ-AT ?auto_212073 ?auto_212078 ) ( TRUCK-AT ?auto_212084 ?auto_212072 ) ( not ( = ?auto_212073 ?auto_212076 ) ) ( not ( = ?auto_212079 ?auto_212078 ) ) ( not ( = ?auto_212073 ?auto_212075 ) ) ( not ( = ?auto_212076 ?auto_212075 ) ) ( not ( = ?auto_212081 ?auto_212079 ) ) ( not ( = ?auto_212081 ?auto_212078 ) ) ( not ( = ?auto_212073 ?auto_212077 ) ) ( not ( = ?auto_212076 ?auto_212077 ) ) ( not ( = ?auto_212075 ?auto_212077 ) ) ( not ( = ?auto_212080 ?auto_212081 ) ) ( not ( = ?auto_212080 ?auto_212079 ) ) ( not ( = ?auto_212080 ?auto_212078 ) ) ( not ( = ?auto_212073 ?auto_212074 ) ) ( not ( = ?auto_212076 ?auto_212074 ) ) ( not ( = ?auto_212075 ?auto_212074 ) ) ( not ( = ?auto_212077 ?auto_212074 ) ) ( not ( = ?auto_212083 ?auto_212080 ) ) ( not ( = ?auto_212083 ?auto_212081 ) ) ( not ( = ?auto_212083 ?auto_212079 ) ) ( not ( = ?auto_212083 ?auto_212078 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_212073 ?auto_212076 ?auto_212075 ?auto_212074 ?auto_212077 ?auto_212072 )
      ( DELIVER-5PKG-VERIFY ?auto_212073 ?auto_212074 ?auto_212075 ?auto_212076 ?auto_212077 ?auto_212072 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_212187 - OBJ
      ?auto_212188 - OBJ
      ?auto_212189 - OBJ
      ?auto_212190 - OBJ
      ?auto_212191 - OBJ
      ?auto_212186 - LOCATION
    )
    :vars
    (
      ?auto_212197 - LOCATION
      ?auto_212196 - CITY
      ?auto_212194 - LOCATION
      ?auto_212195 - LOCATION
      ?auto_212193 - LOCATION
      ?auto_212192 - LOCATION
      ?auto_212198 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_212197 ?auto_212196 ) ( IN-CITY ?auto_212186 ?auto_212196 ) ( not ( = ?auto_212186 ?auto_212197 ) ) ( OBJ-AT ?auto_212188 ?auto_212197 ) ( IN-CITY ?auto_212194 ?auto_212196 ) ( not ( = ?auto_212186 ?auto_212194 ) ) ( OBJ-AT ?auto_212190 ?auto_212194 ) ( IN-CITY ?auto_212195 ?auto_212196 ) ( not ( = ?auto_212186 ?auto_212195 ) ) ( OBJ-AT ?auto_212189 ?auto_212195 ) ( IN-CITY ?auto_212193 ?auto_212196 ) ( not ( = ?auto_212186 ?auto_212193 ) ) ( OBJ-AT ?auto_212191 ?auto_212193 ) ( IN-CITY ?auto_212192 ?auto_212196 ) ( not ( = ?auto_212186 ?auto_212192 ) ) ( OBJ-AT ?auto_212187 ?auto_212192 ) ( TRUCK-AT ?auto_212198 ?auto_212186 ) ( not ( = ?auto_212187 ?auto_212191 ) ) ( not ( = ?auto_212193 ?auto_212192 ) ) ( not ( = ?auto_212187 ?auto_212189 ) ) ( not ( = ?auto_212191 ?auto_212189 ) ) ( not ( = ?auto_212195 ?auto_212193 ) ) ( not ( = ?auto_212195 ?auto_212192 ) ) ( not ( = ?auto_212187 ?auto_212190 ) ) ( not ( = ?auto_212191 ?auto_212190 ) ) ( not ( = ?auto_212189 ?auto_212190 ) ) ( not ( = ?auto_212194 ?auto_212195 ) ) ( not ( = ?auto_212194 ?auto_212193 ) ) ( not ( = ?auto_212194 ?auto_212192 ) ) ( not ( = ?auto_212187 ?auto_212188 ) ) ( not ( = ?auto_212191 ?auto_212188 ) ) ( not ( = ?auto_212189 ?auto_212188 ) ) ( not ( = ?auto_212190 ?auto_212188 ) ) ( not ( = ?auto_212197 ?auto_212194 ) ) ( not ( = ?auto_212197 ?auto_212195 ) ) ( not ( = ?auto_212197 ?auto_212193 ) ) ( not ( = ?auto_212197 ?auto_212192 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_212187 ?auto_212191 ?auto_212189 ?auto_212188 ?auto_212190 ?auto_212186 )
      ( DELIVER-5PKG-VERIFY ?auto_212187 ?auto_212188 ?auto_212189 ?auto_212190 ?auto_212191 ?auto_212186 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_212416 - OBJ
      ?auto_212417 - OBJ
      ?auto_212418 - OBJ
      ?auto_212419 - OBJ
      ?auto_212420 - OBJ
      ?auto_212415 - LOCATION
    )
    :vars
    (
      ?auto_212426 - LOCATION
      ?auto_212425 - CITY
      ?auto_212423 - LOCATION
      ?auto_212424 - LOCATION
      ?auto_212422 - LOCATION
      ?auto_212421 - LOCATION
      ?auto_212427 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_212426 ?auto_212425 ) ( IN-CITY ?auto_212415 ?auto_212425 ) ( not ( = ?auto_212415 ?auto_212426 ) ) ( OBJ-AT ?auto_212417 ?auto_212426 ) ( IN-CITY ?auto_212423 ?auto_212425 ) ( not ( = ?auto_212415 ?auto_212423 ) ) ( OBJ-AT ?auto_212418 ?auto_212423 ) ( IN-CITY ?auto_212424 ?auto_212425 ) ( not ( = ?auto_212415 ?auto_212424 ) ) ( OBJ-AT ?auto_212420 ?auto_212424 ) ( IN-CITY ?auto_212422 ?auto_212425 ) ( not ( = ?auto_212415 ?auto_212422 ) ) ( OBJ-AT ?auto_212419 ?auto_212422 ) ( IN-CITY ?auto_212421 ?auto_212425 ) ( not ( = ?auto_212415 ?auto_212421 ) ) ( OBJ-AT ?auto_212416 ?auto_212421 ) ( TRUCK-AT ?auto_212427 ?auto_212415 ) ( not ( = ?auto_212416 ?auto_212419 ) ) ( not ( = ?auto_212422 ?auto_212421 ) ) ( not ( = ?auto_212416 ?auto_212420 ) ) ( not ( = ?auto_212419 ?auto_212420 ) ) ( not ( = ?auto_212424 ?auto_212422 ) ) ( not ( = ?auto_212424 ?auto_212421 ) ) ( not ( = ?auto_212416 ?auto_212418 ) ) ( not ( = ?auto_212419 ?auto_212418 ) ) ( not ( = ?auto_212420 ?auto_212418 ) ) ( not ( = ?auto_212423 ?auto_212424 ) ) ( not ( = ?auto_212423 ?auto_212422 ) ) ( not ( = ?auto_212423 ?auto_212421 ) ) ( not ( = ?auto_212416 ?auto_212417 ) ) ( not ( = ?auto_212419 ?auto_212417 ) ) ( not ( = ?auto_212420 ?auto_212417 ) ) ( not ( = ?auto_212418 ?auto_212417 ) ) ( not ( = ?auto_212426 ?auto_212423 ) ) ( not ( = ?auto_212426 ?auto_212424 ) ) ( not ( = ?auto_212426 ?auto_212422 ) ) ( not ( = ?auto_212426 ?auto_212421 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_212416 ?auto_212419 ?auto_212420 ?auto_212417 ?auto_212418 ?auto_212415 )
      ( DELIVER-5PKG-VERIFY ?auto_212416 ?auto_212417 ?auto_212418 ?auto_212419 ?auto_212420 ?auto_212415 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_212471 - OBJ
      ?auto_212472 - OBJ
      ?auto_212473 - OBJ
      ?auto_212474 - OBJ
      ?auto_212475 - OBJ
      ?auto_212470 - LOCATION
    )
    :vars
    (
      ?auto_212481 - LOCATION
      ?auto_212480 - CITY
      ?auto_212478 - LOCATION
      ?auto_212479 - LOCATION
      ?auto_212477 - LOCATION
      ?auto_212476 - LOCATION
      ?auto_212482 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_212481 ?auto_212480 ) ( IN-CITY ?auto_212470 ?auto_212480 ) ( not ( = ?auto_212470 ?auto_212481 ) ) ( OBJ-AT ?auto_212472 ?auto_212481 ) ( IN-CITY ?auto_212478 ?auto_212480 ) ( not ( = ?auto_212470 ?auto_212478 ) ) ( OBJ-AT ?auto_212473 ?auto_212478 ) ( IN-CITY ?auto_212479 ?auto_212480 ) ( not ( = ?auto_212470 ?auto_212479 ) ) ( OBJ-AT ?auto_212474 ?auto_212479 ) ( IN-CITY ?auto_212477 ?auto_212480 ) ( not ( = ?auto_212470 ?auto_212477 ) ) ( OBJ-AT ?auto_212475 ?auto_212477 ) ( IN-CITY ?auto_212476 ?auto_212480 ) ( not ( = ?auto_212470 ?auto_212476 ) ) ( OBJ-AT ?auto_212471 ?auto_212476 ) ( TRUCK-AT ?auto_212482 ?auto_212470 ) ( not ( = ?auto_212471 ?auto_212475 ) ) ( not ( = ?auto_212477 ?auto_212476 ) ) ( not ( = ?auto_212471 ?auto_212474 ) ) ( not ( = ?auto_212475 ?auto_212474 ) ) ( not ( = ?auto_212479 ?auto_212477 ) ) ( not ( = ?auto_212479 ?auto_212476 ) ) ( not ( = ?auto_212471 ?auto_212473 ) ) ( not ( = ?auto_212475 ?auto_212473 ) ) ( not ( = ?auto_212474 ?auto_212473 ) ) ( not ( = ?auto_212478 ?auto_212479 ) ) ( not ( = ?auto_212478 ?auto_212477 ) ) ( not ( = ?auto_212478 ?auto_212476 ) ) ( not ( = ?auto_212471 ?auto_212472 ) ) ( not ( = ?auto_212475 ?auto_212472 ) ) ( not ( = ?auto_212474 ?auto_212472 ) ) ( not ( = ?auto_212473 ?auto_212472 ) ) ( not ( = ?auto_212481 ?auto_212478 ) ) ( not ( = ?auto_212481 ?auto_212479 ) ) ( not ( = ?auto_212481 ?auto_212477 ) ) ( not ( = ?auto_212481 ?auto_212476 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_212471 ?auto_212475 ?auto_212474 ?auto_212472 ?auto_212473 ?auto_212470 )
      ( DELIVER-5PKG-VERIFY ?auto_212471 ?auto_212472 ?auto_212473 ?auto_212474 ?auto_212475 ?auto_212470 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_213349 - OBJ
      ?auto_213350 - OBJ
      ?auto_213351 - OBJ
      ?auto_213352 - OBJ
      ?auto_213353 - OBJ
      ?auto_213348 - LOCATION
    )
    :vars
    (
      ?auto_213359 - LOCATION
      ?auto_213358 - CITY
      ?auto_213356 - LOCATION
      ?auto_213357 - LOCATION
      ?auto_213355 - LOCATION
      ?auto_213354 - LOCATION
      ?auto_213360 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_213359 ?auto_213358 ) ( IN-CITY ?auto_213348 ?auto_213358 ) ( not ( = ?auto_213348 ?auto_213359 ) ) ( OBJ-AT ?auto_213353 ?auto_213359 ) ( IN-CITY ?auto_213356 ?auto_213358 ) ( not ( = ?auto_213348 ?auto_213356 ) ) ( OBJ-AT ?auto_213352 ?auto_213356 ) ( IN-CITY ?auto_213357 ?auto_213358 ) ( not ( = ?auto_213348 ?auto_213357 ) ) ( OBJ-AT ?auto_213351 ?auto_213357 ) ( IN-CITY ?auto_213355 ?auto_213358 ) ( not ( = ?auto_213348 ?auto_213355 ) ) ( OBJ-AT ?auto_213349 ?auto_213355 ) ( IN-CITY ?auto_213354 ?auto_213358 ) ( not ( = ?auto_213348 ?auto_213354 ) ) ( OBJ-AT ?auto_213350 ?auto_213354 ) ( TRUCK-AT ?auto_213360 ?auto_213348 ) ( not ( = ?auto_213350 ?auto_213349 ) ) ( not ( = ?auto_213355 ?auto_213354 ) ) ( not ( = ?auto_213350 ?auto_213351 ) ) ( not ( = ?auto_213349 ?auto_213351 ) ) ( not ( = ?auto_213357 ?auto_213355 ) ) ( not ( = ?auto_213357 ?auto_213354 ) ) ( not ( = ?auto_213350 ?auto_213352 ) ) ( not ( = ?auto_213349 ?auto_213352 ) ) ( not ( = ?auto_213351 ?auto_213352 ) ) ( not ( = ?auto_213356 ?auto_213357 ) ) ( not ( = ?auto_213356 ?auto_213355 ) ) ( not ( = ?auto_213356 ?auto_213354 ) ) ( not ( = ?auto_213350 ?auto_213353 ) ) ( not ( = ?auto_213349 ?auto_213353 ) ) ( not ( = ?auto_213351 ?auto_213353 ) ) ( not ( = ?auto_213352 ?auto_213353 ) ) ( not ( = ?auto_213359 ?auto_213356 ) ) ( not ( = ?auto_213359 ?auto_213357 ) ) ( not ( = ?auto_213359 ?auto_213355 ) ) ( not ( = ?auto_213359 ?auto_213354 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_213350 ?auto_213349 ?auto_213351 ?auto_213353 ?auto_213352 ?auto_213348 )
      ( DELIVER-5PKG-VERIFY ?auto_213349 ?auto_213350 ?auto_213351 ?auto_213352 ?auto_213353 ?auto_213348 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_213404 - OBJ
      ?auto_213405 - OBJ
      ?auto_213406 - OBJ
      ?auto_213407 - OBJ
      ?auto_213408 - OBJ
      ?auto_213403 - LOCATION
    )
    :vars
    (
      ?auto_213414 - LOCATION
      ?auto_213413 - CITY
      ?auto_213411 - LOCATION
      ?auto_213412 - LOCATION
      ?auto_213410 - LOCATION
      ?auto_213409 - LOCATION
      ?auto_213415 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_213414 ?auto_213413 ) ( IN-CITY ?auto_213403 ?auto_213413 ) ( not ( = ?auto_213403 ?auto_213414 ) ) ( OBJ-AT ?auto_213407 ?auto_213414 ) ( IN-CITY ?auto_213411 ?auto_213413 ) ( not ( = ?auto_213403 ?auto_213411 ) ) ( OBJ-AT ?auto_213408 ?auto_213411 ) ( IN-CITY ?auto_213412 ?auto_213413 ) ( not ( = ?auto_213403 ?auto_213412 ) ) ( OBJ-AT ?auto_213406 ?auto_213412 ) ( IN-CITY ?auto_213410 ?auto_213413 ) ( not ( = ?auto_213403 ?auto_213410 ) ) ( OBJ-AT ?auto_213404 ?auto_213410 ) ( IN-CITY ?auto_213409 ?auto_213413 ) ( not ( = ?auto_213403 ?auto_213409 ) ) ( OBJ-AT ?auto_213405 ?auto_213409 ) ( TRUCK-AT ?auto_213415 ?auto_213403 ) ( not ( = ?auto_213405 ?auto_213404 ) ) ( not ( = ?auto_213410 ?auto_213409 ) ) ( not ( = ?auto_213405 ?auto_213406 ) ) ( not ( = ?auto_213404 ?auto_213406 ) ) ( not ( = ?auto_213412 ?auto_213410 ) ) ( not ( = ?auto_213412 ?auto_213409 ) ) ( not ( = ?auto_213405 ?auto_213408 ) ) ( not ( = ?auto_213404 ?auto_213408 ) ) ( not ( = ?auto_213406 ?auto_213408 ) ) ( not ( = ?auto_213411 ?auto_213412 ) ) ( not ( = ?auto_213411 ?auto_213410 ) ) ( not ( = ?auto_213411 ?auto_213409 ) ) ( not ( = ?auto_213405 ?auto_213407 ) ) ( not ( = ?auto_213404 ?auto_213407 ) ) ( not ( = ?auto_213406 ?auto_213407 ) ) ( not ( = ?auto_213408 ?auto_213407 ) ) ( not ( = ?auto_213414 ?auto_213411 ) ) ( not ( = ?auto_213414 ?auto_213412 ) ) ( not ( = ?auto_213414 ?auto_213410 ) ) ( not ( = ?auto_213414 ?auto_213409 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_213405 ?auto_213404 ?auto_213406 ?auto_213407 ?auto_213408 ?auto_213403 )
      ( DELIVER-5PKG-VERIFY ?auto_213404 ?auto_213405 ?auto_213406 ?auto_213407 ?auto_213408 ?auto_213403 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_213459 - OBJ
      ?auto_213460 - OBJ
      ?auto_213461 - OBJ
      ?auto_213462 - OBJ
      ?auto_213463 - OBJ
      ?auto_213458 - LOCATION
    )
    :vars
    (
      ?auto_213469 - LOCATION
      ?auto_213468 - CITY
      ?auto_213466 - LOCATION
      ?auto_213467 - LOCATION
      ?auto_213465 - LOCATION
      ?auto_213464 - LOCATION
      ?auto_213470 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_213469 ?auto_213468 ) ( IN-CITY ?auto_213458 ?auto_213468 ) ( not ( = ?auto_213458 ?auto_213469 ) ) ( OBJ-AT ?auto_213463 ?auto_213469 ) ( IN-CITY ?auto_213466 ?auto_213468 ) ( not ( = ?auto_213458 ?auto_213466 ) ) ( OBJ-AT ?auto_213461 ?auto_213466 ) ( IN-CITY ?auto_213467 ?auto_213468 ) ( not ( = ?auto_213458 ?auto_213467 ) ) ( OBJ-AT ?auto_213462 ?auto_213467 ) ( IN-CITY ?auto_213465 ?auto_213468 ) ( not ( = ?auto_213458 ?auto_213465 ) ) ( OBJ-AT ?auto_213459 ?auto_213465 ) ( IN-CITY ?auto_213464 ?auto_213468 ) ( not ( = ?auto_213458 ?auto_213464 ) ) ( OBJ-AT ?auto_213460 ?auto_213464 ) ( TRUCK-AT ?auto_213470 ?auto_213458 ) ( not ( = ?auto_213460 ?auto_213459 ) ) ( not ( = ?auto_213465 ?auto_213464 ) ) ( not ( = ?auto_213460 ?auto_213462 ) ) ( not ( = ?auto_213459 ?auto_213462 ) ) ( not ( = ?auto_213467 ?auto_213465 ) ) ( not ( = ?auto_213467 ?auto_213464 ) ) ( not ( = ?auto_213460 ?auto_213461 ) ) ( not ( = ?auto_213459 ?auto_213461 ) ) ( not ( = ?auto_213462 ?auto_213461 ) ) ( not ( = ?auto_213466 ?auto_213467 ) ) ( not ( = ?auto_213466 ?auto_213465 ) ) ( not ( = ?auto_213466 ?auto_213464 ) ) ( not ( = ?auto_213460 ?auto_213463 ) ) ( not ( = ?auto_213459 ?auto_213463 ) ) ( not ( = ?auto_213462 ?auto_213463 ) ) ( not ( = ?auto_213461 ?auto_213463 ) ) ( not ( = ?auto_213469 ?auto_213466 ) ) ( not ( = ?auto_213469 ?auto_213467 ) ) ( not ( = ?auto_213469 ?auto_213465 ) ) ( not ( = ?auto_213469 ?auto_213464 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_213460 ?auto_213459 ?auto_213462 ?auto_213463 ?auto_213461 ?auto_213458 )
      ( DELIVER-5PKG-VERIFY ?auto_213459 ?auto_213460 ?auto_213461 ?auto_213462 ?auto_213463 ?auto_213458 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_213514 - OBJ
      ?auto_213515 - OBJ
      ?auto_213516 - OBJ
      ?auto_213517 - OBJ
      ?auto_213518 - OBJ
      ?auto_213513 - LOCATION
    )
    :vars
    (
      ?auto_213524 - LOCATION
      ?auto_213523 - CITY
      ?auto_213521 - LOCATION
      ?auto_213522 - LOCATION
      ?auto_213520 - LOCATION
      ?auto_213519 - LOCATION
      ?auto_213525 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_213524 ?auto_213523 ) ( IN-CITY ?auto_213513 ?auto_213523 ) ( not ( = ?auto_213513 ?auto_213524 ) ) ( OBJ-AT ?auto_213517 ?auto_213524 ) ( IN-CITY ?auto_213521 ?auto_213523 ) ( not ( = ?auto_213513 ?auto_213521 ) ) ( OBJ-AT ?auto_213516 ?auto_213521 ) ( IN-CITY ?auto_213522 ?auto_213523 ) ( not ( = ?auto_213513 ?auto_213522 ) ) ( OBJ-AT ?auto_213518 ?auto_213522 ) ( IN-CITY ?auto_213520 ?auto_213523 ) ( not ( = ?auto_213513 ?auto_213520 ) ) ( OBJ-AT ?auto_213514 ?auto_213520 ) ( IN-CITY ?auto_213519 ?auto_213523 ) ( not ( = ?auto_213513 ?auto_213519 ) ) ( OBJ-AT ?auto_213515 ?auto_213519 ) ( TRUCK-AT ?auto_213525 ?auto_213513 ) ( not ( = ?auto_213515 ?auto_213514 ) ) ( not ( = ?auto_213520 ?auto_213519 ) ) ( not ( = ?auto_213515 ?auto_213518 ) ) ( not ( = ?auto_213514 ?auto_213518 ) ) ( not ( = ?auto_213522 ?auto_213520 ) ) ( not ( = ?auto_213522 ?auto_213519 ) ) ( not ( = ?auto_213515 ?auto_213516 ) ) ( not ( = ?auto_213514 ?auto_213516 ) ) ( not ( = ?auto_213518 ?auto_213516 ) ) ( not ( = ?auto_213521 ?auto_213522 ) ) ( not ( = ?auto_213521 ?auto_213520 ) ) ( not ( = ?auto_213521 ?auto_213519 ) ) ( not ( = ?auto_213515 ?auto_213517 ) ) ( not ( = ?auto_213514 ?auto_213517 ) ) ( not ( = ?auto_213518 ?auto_213517 ) ) ( not ( = ?auto_213516 ?auto_213517 ) ) ( not ( = ?auto_213524 ?auto_213521 ) ) ( not ( = ?auto_213524 ?auto_213522 ) ) ( not ( = ?auto_213524 ?auto_213520 ) ) ( not ( = ?auto_213524 ?auto_213519 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_213515 ?auto_213514 ?auto_213518 ?auto_213517 ?auto_213516 ?auto_213513 )
      ( DELIVER-5PKG-VERIFY ?auto_213514 ?auto_213515 ?auto_213516 ?auto_213517 ?auto_213518 ?auto_213513 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_213743 - OBJ
      ?auto_213744 - OBJ
      ?auto_213745 - OBJ
      ?auto_213746 - OBJ
      ?auto_213747 - OBJ
      ?auto_213742 - LOCATION
    )
    :vars
    (
      ?auto_213753 - LOCATION
      ?auto_213752 - CITY
      ?auto_213750 - LOCATION
      ?auto_213751 - LOCATION
      ?auto_213749 - LOCATION
      ?auto_213748 - LOCATION
      ?auto_213754 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_213753 ?auto_213752 ) ( IN-CITY ?auto_213742 ?auto_213752 ) ( not ( = ?auto_213742 ?auto_213753 ) ) ( OBJ-AT ?auto_213745 ?auto_213753 ) ( IN-CITY ?auto_213750 ?auto_213752 ) ( not ( = ?auto_213742 ?auto_213750 ) ) ( OBJ-AT ?auto_213747 ?auto_213750 ) ( IN-CITY ?auto_213751 ?auto_213752 ) ( not ( = ?auto_213742 ?auto_213751 ) ) ( OBJ-AT ?auto_213746 ?auto_213751 ) ( IN-CITY ?auto_213749 ?auto_213752 ) ( not ( = ?auto_213742 ?auto_213749 ) ) ( OBJ-AT ?auto_213743 ?auto_213749 ) ( IN-CITY ?auto_213748 ?auto_213752 ) ( not ( = ?auto_213742 ?auto_213748 ) ) ( OBJ-AT ?auto_213744 ?auto_213748 ) ( TRUCK-AT ?auto_213754 ?auto_213742 ) ( not ( = ?auto_213744 ?auto_213743 ) ) ( not ( = ?auto_213749 ?auto_213748 ) ) ( not ( = ?auto_213744 ?auto_213746 ) ) ( not ( = ?auto_213743 ?auto_213746 ) ) ( not ( = ?auto_213751 ?auto_213749 ) ) ( not ( = ?auto_213751 ?auto_213748 ) ) ( not ( = ?auto_213744 ?auto_213747 ) ) ( not ( = ?auto_213743 ?auto_213747 ) ) ( not ( = ?auto_213746 ?auto_213747 ) ) ( not ( = ?auto_213750 ?auto_213751 ) ) ( not ( = ?auto_213750 ?auto_213749 ) ) ( not ( = ?auto_213750 ?auto_213748 ) ) ( not ( = ?auto_213744 ?auto_213745 ) ) ( not ( = ?auto_213743 ?auto_213745 ) ) ( not ( = ?auto_213746 ?auto_213745 ) ) ( not ( = ?auto_213747 ?auto_213745 ) ) ( not ( = ?auto_213753 ?auto_213750 ) ) ( not ( = ?auto_213753 ?auto_213751 ) ) ( not ( = ?auto_213753 ?auto_213749 ) ) ( not ( = ?auto_213753 ?auto_213748 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_213744 ?auto_213743 ?auto_213746 ?auto_213745 ?auto_213747 ?auto_213742 )
      ( DELIVER-5PKG-VERIFY ?auto_213743 ?auto_213744 ?auto_213745 ?auto_213746 ?auto_213747 ?auto_213742 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_213798 - OBJ
      ?auto_213799 - OBJ
      ?auto_213800 - OBJ
      ?auto_213801 - OBJ
      ?auto_213802 - OBJ
      ?auto_213797 - LOCATION
    )
    :vars
    (
      ?auto_213808 - LOCATION
      ?auto_213807 - CITY
      ?auto_213805 - LOCATION
      ?auto_213806 - LOCATION
      ?auto_213804 - LOCATION
      ?auto_213803 - LOCATION
      ?auto_213809 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_213808 ?auto_213807 ) ( IN-CITY ?auto_213797 ?auto_213807 ) ( not ( = ?auto_213797 ?auto_213808 ) ) ( OBJ-AT ?auto_213800 ?auto_213808 ) ( IN-CITY ?auto_213805 ?auto_213807 ) ( not ( = ?auto_213797 ?auto_213805 ) ) ( OBJ-AT ?auto_213801 ?auto_213805 ) ( IN-CITY ?auto_213806 ?auto_213807 ) ( not ( = ?auto_213797 ?auto_213806 ) ) ( OBJ-AT ?auto_213802 ?auto_213806 ) ( IN-CITY ?auto_213804 ?auto_213807 ) ( not ( = ?auto_213797 ?auto_213804 ) ) ( OBJ-AT ?auto_213798 ?auto_213804 ) ( IN-CITY ?auto_213803 ?auto_213807 ) ( not ( = ?auto_213797 ?auto_213803 ) ) ( OBJ-AT ?auto_213799 ?auto_213803 ) ( TRUCK-AT ?auto_213809 ?auto_213797 ) ( not ( = ?auto_213799 ?auto_213798 ) ) ( not ( = ?auto_213804 ?auto_213803 ) ) ( not ( = ?auto_213799 ?auto_213802 ) ) ( not ( = ?auto_213798 ?auto_213802 ) ) ( not ( = ?auto_213806 ?auto_213804 ) ) ( not ( = ?auto_213806 ?auto_213803 ) ) ( not ( = ?auto_213799 ?auto_213801 ) ) ( not ( = ?auto_213798 ?auto_213801 ) ) ( not ( = ?auto_213802 ?auto_213801 ) ) ( not ( = ?auto_213805 ?auto_213806 ) ) ( not ( = ?auto_213805 ?auto_213804 ) ) ( not ( = ?auto_213805 ?auto_213803 ) ) ( not ( = ?auto_213799 ?auto_213800 ) ) ( not ( = ?auto_213798 ?auto_213800 ) ) ( not ( = ?auto_213802 ?auto_213800 ) ) ( not ( = ?auto_213801 ?auto_213800 ) ) ( not ( = ?auto_213808 ?auto_213805 ) ) ( not ( = ?auto_213808 ?auto_213806 ) ) ( not ( = ?auto_213808 ?auto_213804 ) ) ( not ( = ?auto_213808 ?auto_213803 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_213799 ?auto_213798 ?auto_213802 ?auto_213800 ?auto_213801 ?auto_213797 )
      ( DELIVER-5PKG-VERIFY ?auto_213798 ?auto_213799 ?auto_213800 ?auto_213801 ?auto_213802 ?auto_213797 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_214858 - OBJ
      ?auto_214859 - OBJ
      ?auto_214860 - OBJ
      ?auto_214861 - OBJ
      ?auto_214862 - OBJ
      ?auto_214857 - LOCATION
    )
    :vars
    (
      ?auto_214868 - LOCATION
      ?auto_214867 - CITY
      ?auto_214865 - LOCATION
      ?auto_214866 - LOCATION
      ?auto_214864 - LOCATION
      ?auto_214863 - LOCATION
      ?auto_214869 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_214868 ?auto_214867 ) ( IN-CITY ?auto_214857 ?auto_214867 ) ( not ( = ?auto_214857 ?auto_214868 ) ) ( OBJ-AT ?auto_214862 ?auto_214868 ) ( IN-CITY ?auto_214865 ?auto_214867 ) ( not ( = ?auto_214857 ?auto_214865 ) ) ( OBJ-AT ?auto_214861 ?auto_214865 ) ( IN-CITY ?auto_214866 ?auto_214867 ) ( not ( = ?auto_214857 ?auto_214866 ) ) ( OBJ-AT ?auto_214859 ?auto_214866 ) ( IN-CITY ?auto_214864 ?auto_214867 ) ( not ( = ?auto_214857 ?auto_214864 ) ) ( OBJ-AT ?auto_214858 ?auto_214864 ) ( IN-CITY ?auto_214863 ?auto_214867 ) ( not ( = ?auto_214857 ?auto_214863 ) ) ( OBJ-AT ?auto_214860 ?auto_214863 ) ( TRUCK-AT ?auto_214869 ?auto_214857 ) ( not ( = ?auto_214860 ?auto_214858 ) ) ( not ( = ?auto_214864 ?auto_214863 ) ) ( not ( = ?auto_214860 ?auto_214859 ) ) ( not ( = ?auto_214858 ?auto_214859 ) ) ( not ( = ?auto_214866 ?auto_214864 ) ) ( not ( = ?auto_214866 ?auto_214863 ) ) ( not ( = ?auto_214860 ?auto_214861 ) ) ( not ( = ?auto_214858 ?auto_214861 ) ) ( not ( = ?auto_214859 ?auto_214861 ) ) ( not ( = ?auto_214865 ?auto_214866 ) ) ( not ( = ?auto_214865 ?auto_214864 ) ) ( not ( = ?auto_214865 ?auto_214863 ) ) ( not ( = ?auto_214860 ?auto_214862 ) ) ( not ( = ?auto_214858 ?auto_214862 ) ) ( not ( = ?auto_214859 ?auto_214862 ) ) ( not ( = ?auto_214861 ?auto_214862 ) ) ( not ( = ?auto_214868 ?auto_214865 ) ) ( not ( = ?auto_214868 ?auto_214866 ) ) ( not ( = ?auto_214868 ?auto_214864 ) ) ( not ( = ?auto_214868 ?auto_214863 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_214860 ?auto_214858 ?auto_214859 ?auto_214862 ?auto_214861 ?auto_214857 )
      ( DELIVER-5PKG-VERIFY ?auto_214858 ?auto_214859 ?auto_214860 ?auto_214861 ?auto_214862 ?auto_214857 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_214913 - OBJ
      ?auto_214914 - OBJ
      ?auto_214915 - OBJ
      ?auto_214916 - OBJ
      ?auto_214917 - OBJ
      ?auto_214912 - LOCATION
    )
    :vars
    (
      ?auto_214923 - LOCATION
      ?auto_214922 - CITY
      ?auto_214920 - LOCATION
      ?auto_214921 - LOCATION
      ?auto_214919 - LOCATION
      ?auto_214918 - LOCATION
      ?auto_214924 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_214923 ?auto_214922 ) ( IN-CITY ?auto_214912 ?auto_214922 ) ( not ( = ?auto_214912 ?auto_214923 ) ) ( OBJ-AT ?auto_214916 ?auto_214923 ) ( IN-CITY ?auto_214920 ?auto_214922 ) ( not ( = ?auto_214912 ?auto_214920 ) ) ( OBJ-AT ?auto_214917 ?auto_214920 ) ( IN-CITY ?auto_214921 ?auto_214922 ) ( not ( = ?auto_214912 ?auto_214921 ) ) ( OBJ-AT ?auto_214914 ?auto_214921 ) ( IN-CITY ?auto_214919 ?auto_214922 ) ( not ( = ?auto_214912 ?auto_214919 ) ) ( OBJ-AT ?auto_214913 ?auto_214919 ) ( IN-CITY ?auto_214918 ?auto_214922 ) ( not ( = ?auto_214912 ?auto_214918 ) ) ( OBJ-AT ?auto_214915 ?auto_214918 ) ( TRUCK-AT ?auto_214924 ?auto_214912 ) ( not ( = ?auto_214915 ?auto_214913 ) ) ( not ( = ?auto_214919 ?auto_214918 ) ) ( not ( = ?auto_214915 ?auto_214914 ) ) ( not ( = ?auto_214913 ?auto_214914 ) ) ( not ( = ?auto_214921 ?auto_214919 ) ) ( not ( = ?auto_214921 ?auto_214918 ) ) ( not ( = ?auto_214915 ?auto_214917 ) ) ( not ( = ?auto_214913 ?auto_214917 ) ) ( not ( = ?auto_214914 ?auto_214917 ) ) ( not ( = ?auto_214920 ?auto_214921 ) ) ( not ( = ?auto_214920 ?auto_214919 ) ) ( not ( = ?auto_214920 ?auto_214918 ) ) ( not ( = ?auto_214915 ?auto_214916 ) ) ( not ( = ?auto_214913 ?auto_214916 ) ) ( not ( = ?auto_214914 ?auto_214916 ) ) ( not ( = ?auto_214917 ?auto_214916 ) ) ( not ( = ?auto_214923 ?auto_214920 ) ) ( not ( = ?auto_214923 ?auto_214921 ) ) ( not ( = ?auto_214923 ?auto_214919 ) ) ( not ( = ?auto_214923 ?auto_214918 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_214915 ?auto_214913 ?auto_214914 ?auto_214916 ?auto_214917 ?auto_214912 )
      ( DELIVER-5PKG-VERIFY ?auto_214913 ?auto_214914 ?auto_214915 ?auto_214916 ?auto_214917 ?auto_214912 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_215202 - OBJ
      ?auto_215203 - OBJ
      ?auto_215204 - OBJ
      ?auto_215205 - OBJ
      ?auto_215206 - OBJ
      ?auto_215201 - LOCATION
    )
    :vars
    (
      ?auto_215212 - LOCATION
      ?auto_215211 - CITY
      ?auto_215209 - LOCATION
      ?auto_215210 - LOCATION
      ?auto_215208 - LOCATION
      ?auto_215207 - LOCATION
      ?auto_215213 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_215212 ?auto_215211 ) ( IN-CITY ?auto_215201 ?auto_215211 ) ( not ( = ?auto_215201 ?auto_215212 ) ) ( OBJ-AT ?auto_215206 ?auto_215212 ) ( IN-CITY ?auto_215209 ?auto_215211 ) ( not ( = ?auto_215201 ?auto_215209 ) ) ( OBJ-AT ?auto_215204 ?auto_215209 ) ( IN-CITY ?auto_215210 ?auto_215211 ) ( not ( = ?auto_215201 ?auto_215210 ) ) ( OBJ-AT ?auto_215203 ?auto_215210 ) ( IN-CITY ?auto_215208 ?auto_215211 ) ( not ( = ?auto_215201 ?auto_215208 ) ) ( OBJ-AT ?auto_215202 ?auto_215208 ) ( IN-CITY ?auto_215207 ?auto_215211 ) ( not ( = ?auto_215201 ?auto_215207 ) ) ( OBJ-AT ?auto_215205 ?auto_215207 ) ( TRUCK-AT ?auto_215213 ?auto_215201 ) ( not ( = ?auto_215205 ?auto_215202 ) ) ( not ( = ?auto_215208 ?auto_215207 ) ) ( not ( = ?auto_215205 ?auto_215203 ) ) ( not ( = ?auto_215202 ?auto_215203 ) ) ( not ( = ?auto_215210 ?auto_215208 ) ) ( not ( = ?auto_215210 ?auto_215207 ) ) ( not ( = ?auto_215205 ?auto_215204 ) ) ( not ( = ?auto_215202 ?auto_215204 ) ) ( not ( = ?auto_215203 ?auto_215204 ) ) ( not ( = ?auto_215209 ?auto_215210 ) ) ( not ( = ?auto_215209 ?auto_215208 ) ) ( not ( = ?auto_215209 ?auto_215207 ) ) ( not ( = ?auto_215205 ?auto_215206 ) ) ( not ( = ?auto_215202 ?auto_215206 ) ) ( not ( = ?auto_215203 ?auto_215206 ) ) ( not ( = ?auto_215204 ?auto_215206 ) ) ( not ( = ?auto_215212 ?auto_215209 ) ) ( not ( = ?auto_215212 ?auto_215210 ) ) ( not ( = ?auto_215212 ?auto_215208 ) ) ( not ( = ?auto_215212 ?auto_215207 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_215205 ?auto_215202 ?auto_215203 ?auto_215206 ?auto_215204 ?auto_215201 )
      ( DELIVER-5PKG-VERIFY ?auto_215202 ?auto_215203 ?auto_215204 ?auto_215205 ?auto_215206 ?auto_215201 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_215257 - OBJ
      ?auto_215258 - OBJ
      ?auto_215259 - OBJ
      ?auto_215260 - OBJ
      ?auto_215261 - OBJ
      ?auto_215256 - LOCATION
    )
    :vars
    (
      ?auto_215267 - LOCATION
      ?auto_215266 - CITY
      ?auto_215264 - LOCATION
      ?auto_215265 - LOCATION
      ?auto_215263 - LOCATION
      ?auto_215262 - LOCATION
      ?auto_215268 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_215267 ?auto_215266 ) ( IN-CITY ?auto_215256 ?auto_215266 ) ( not ( = ?auto_215256 ?auto_215267 ) ) ( OBJ-AT ?auto_215260 ?auto_215267 ) ( IN-CITY ?auto_215264 ?auto_215266 ) ( not ( = ?auto_215256 ?auto_215264 ) ) ( OBJ-AT ?auto_215259 ?auto_215264 ) ( IN-CITY ?auto_215265 ?auto_215266 ) ( not ( = ?auto_215256 ?auto_215265 ) ) ( OBJ-AT ?auto_215258 ?auto_215265 ) ( IN-CITY ?auto_215263 ?auto_215266 ) ( not ( = ?auto_215256 ?auto_215263 ) ) ( OBJ-AT ?auto_215257 ?auto_215263 ) ( IN-CITY ?auto_215262 ?auto_215266 ) ( not ( = ?auto_215256 ?auto_215262 ) ) ( OBJ-AT ?auto_215261 ?auto_215262 ) ( TRUCK-AT ?auto_215268 ?auto_215256 ) ( not ( = ?auto_215261 ?auto_215257 ) ) ( not ( = ?auto_215263 ?auto_215262 ) ) ( not ( = ?auto_215261 ?auto_215258 ) ) ( not ( = ?auto_215257 ?auto_215258 ) ) ( not ( = ?auto_215265 ?auto_215263 ) ) ( not ( = ?auto_215265 ?auto_215262 ) ) ( not ( = ?auto_215261 ?auto_215259 ) ) ( not ( = ?auto_215257 ?auto_215259 ) ) ( not ( = ?auto_215258 ?auto_215259 ) ) ( not ( = ?auto_215264 ?auto_215265 ) ) ( not ( = ?auto_215264 ?auto_215263 ) ) ( not ( = ?auto_215264 ?auto_215262 ) ) ( not ( = ?auto_215261 ?auto_215260 ) ) ( not ( = ?auto_215257 ?auto_215260 ) ) ( not ( = ?auto_215258 ?auto_215260 ) ) ( not ( = ?auto_215259 ?auto_215260 ) ) ( not ( = ?auto_215267 ?auto_215264 ) ) ( not ( = ?auto_215267 ?auto_215265 ) ) ( not ( = ?auto_215267 ?auto_215263 ) ) ( not ( = ?auto_215267 ?auto_215262 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_215261 ?auto_215257 ?auto_215258 ?auto_215260 ?auto_215259 ?auto_215256 )
      ( DELIVER-5PKG-VERIFY ?auto_215257 ?auto_215258 ?auto_215259 ?auto_215260 ?auto_215261 ?auto_215256 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_215368 - OBJ
      ?auto_215369 - OBJ
      ?auto_215370 - OBJ
      ?auto_215371 - OBJ
      ?auto_215372 - OBJ
      ?auto_215367 - LOCATION
    )
    :vars
    (
      ?auto_215378 - LOCATION
      ?auto_215377 - CITY
      ?auto_215375 - LOCATION
      ?auto_215376 - LOCATION
      ?auto_215374 - LOCATION
      ?auto_215373 - LOCATION
      ?auto_215379 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_215378 ?auto_215377 ) ( IN-CITY ?auto_215367 ?auto_215377 ) ( not ( = ?auto_215367 ?auto_215378 ) ) ( OBJ-AT ?auto_215370 ?auto_215378 ) ( IN-CITY ?auto_215375 ?auto_215377 ) ( not ( = ?auto_215367 ?auto_215375 ) ) ( OBJ-AT ?auto_215372 ?auto_215375 ) ( IN-CITY ?auto_215376 ?auto_215377 ) ( not ( = ?auto_215367 ?auto_215376 ) ) ( OBJ-AT ?auto_215369 ?auto_215376 ) ( IN-CITY ?auto_215374 ?auto_215377 ) ( not ( = ?auto_215367 ?auto_215374 ) ) ( OBJ-AT ?auto_215368 ?auto_215374 ) ( IN-CITY ?auto_215373 ?auto_215377 ) ( not ( = ?auto_215367 ?auto_215373 ) ) ( OBJ-AT ?auto_215371 ?auto_215373 ) ( TRUCK-AT ?auto_215379 ?auto_215367 ) ( not ( = ?auto_215371 ?auto_215368 ) ) ( not ( = ?auto_215374 ?auto_215373 ) ) ( not ( = ?auto_215371 ?auto_215369 ) ) ( not ( = ?auto_215368 ?auto_215369 ) ) ( not ( = ?auto_215376 ?auto_215374 ) ) ( not ( = ?auto_215376 ?auto_215373 ) ) ( not ( = ?auto_215371 ?auto_215372 ) ) ( not ( = ?auto_215368 ?auto_215372 ) ) ( not ( = ?auto_215369 ?auto_215372 ) ) ( not ( = ?auto_215375 ?auto_215376 ) ) ( not ( = ?auto_215375 ?auto_215374 ) ) ( not ( = ?auto_215375 ?auto_215373 ) ) ( not ( = ?auto_215371 ?auto_215370 ) ) ( not ( = ?auto_215368 ?auto_215370 ) ) ( not ( = ?auto_215369 ?auto_215370 ) ) ( not ( = ?auto_215372 ?auto_215370 ) ) ( not ( = ?auto_215378 ?auto_215375 ) ) ( not ( = ?auto_215378 ?auto_215376 ) ) ( not ( = ?auto_215378 ?auto_215374 ) ) ( not ( = ?auto_215378 ?auto_215373 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_215371 ?auto_215368 ?auto_215369 ?auto_215370 ?auto_215372 ?auto_215367 )
      ( DELIVER-5PKG-VERIFY ?auto_215368 ?auto_215369 ?auto_215370 ?auto_215371 ?auto_215372 ?auto_215367 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_215541 - OBJ
      ?auto_215542 - OBJ
      ?auto_215543 - OBJ
      ?auto_215544 - OBJ
      ?auto_215545 - OBJ
      ?auto_215540 - LOCATION
    )
    :vars
    (
      ?auto_215551 - LOCATION
      ?auto_215550 - CITY
      ?auto_215548 - LOCATION
      ?auto_215549 - LOCATION
      ?auto_215547 - LOCATION
      ?auto_215546 - LOCATION
      ?auto_215552 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_215551 ?auto_215550 ) ( IN-CITY ?auto_215540 ?auto_215550 ) ( not ( = ?auto_215540 ?auto_215551 ) ) ( OBJ-AT ?auto_215543 ?auto_215551 ) ( IN-CITY ?auto_215548 ?auto_215550 ) ( not ( = ?auto_215540 ?auto_215548 ) ) ( OBJ-AT ?auto_215544 ?auto_215548 ) ( IN-CITY ?auto_215549 ?auto_215550 ) ( not ( = ?auto_215540 ?auto_215549 ) ) ( OBJ-AT ?auto_215542 ?auto_215549 ) ( IN-CITY ?auto_215547 ?auto_215550 ) ( not ( = ?auto_215540 ?auto_215547 ) ) ( OBJ-AT ?auto_215541 ?auto_215547 ) ( IN-CITY ?auto_215546 ?auto_215550 ) ( not ( = ?auto_215540 ?auto_215546 ) ) ( OBJ-AT ?auto_215545 ?auto_215546 ) ( TRUCK-AT ?auto_215552 ?auto_215540 ) ( not ( = ?auto_215545 ?auto_215541 ) ) ( not ( = ?auto_215547 ?auto_215546 ) ) ( not ( = ?auto_215545 ?auto_215542 ) ) ( not ( = ?auto_215541 ?auto_215542 ) ) ( not ( = ?auto_215549 ?auto_215547 ) ) ( not ( = ?auto_215549 ?auto_215546 ) ) ( not ( = ?auto_215545 ?auto_215544 ) ) ( not ( = ?auto_215541 ?auto_215544 ) ) ( not ( = ?auto_215542 ?auto_215544 ) ) ( not ( = ?auto_215548 ?auto_215549 ) ) ( not ( = ?auto_215548 ?auto_215547 ) ) ( not ( = ?auto_215548 ?auto_215546 ) ) ( not ( = ?auto_215545 ?auto_215543 ) ) ( not ( = ?auto_215541 ?auto_215543 ) ) ( not ( = ?auto_215542 ?auto_215543 ) ) ( not ( = ?auto_215544 ?auto_215543 ) ) ( not ( = ?auto_215551 ?auto_215548 ) ) ( not ( = ?auto_215551 ?auto_215549 ) ) ( not ( = ?auto_215551 ?auto_215547 ) ) ( not ( = ?auto_215551 ?auto_215546 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_215545 ?auto_215541 ?auto_215542 ?auto_215543 ?auto_215544 ?auto_215540 )
      ( DELIVER-5PKG-VERIFY ?auto_215541 ?auto_215542 ?auto_215543 ?auto_215544 ?auto_215545 ?auto_215540 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_215711 - OBJ
      ?auto_215712 - OBJ
      ?auto_215713 - OBJ
      ?auto_215714 - OBJ
      ?auto_215715 - OBJ
      ?auto_215710 - LOCATION
    )
    :vars
    (
      ?auto_215721 - LOCATION
      ?auto_215720 - CITY
      ?auto_215718 - LOCATION
      ?auto_215719 - LOCATION
      ?auto_215717 - LOCATION
      ?auto_215716 - LOCATION
      ?auto_215722 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_215721 ?auto_215720 ) ( IN-CITY ?auto_215710 ?auto_215720 ) ( not ( = ?auto_215710 ?auto_215721 ) ) ( OBJ-AT ?auto_215715 ?auto_215721 ) ( IN-CITY ?auto_215718 ?auto_215720 ) ( not ( = ?auto_215710 ?auto_215718 ) ) ( OBJ-AT ?auto_215712 ?auto_215718 ) ( IN-CITY ?auto_215719 ?auto_215720 ) ( not ( = ?auto_215710 ?auto_215719 ) ) ( OBJ-AT ?auto_215714 ?auto_215719 ) ( IN-CITY ?auto_215717 ?auto_215720 ) ( not ( = ?auto_215710 ?auto_215717 ) ) ( OBJ-AT ?auto_215711 ?auto_215717 ) ( IN-CITY ?auto_215716 ?auto_215720 ) ( not ( = ?auto_215710 ?auto_215716 ) ) ( OBJ-AT ?auto_215713 ?auto_215716 ) ( TRUCK-AT ?auto_215722 ?auto_215710 ) ( not ( = ?auto_215713 ?auto_215711 ) ) ( not ( = ?auto_215717 ?auto_215716 ) ) ( not ( = ?auto_215713 ?auto_215714 ) ) ( not ( = ?auto_215711 ?auto_215714 ) ) ( not ( = ?auto_215719 ?auto_215717 ) ) ( not ( = ?auto_215719 ?auto_215716 ) ) ( not ( = ?auto_215713 ?auto_215712 ) ) ( not ( = ?auto_215711 ?auto_215712 ) ) ( not ( = ?auto_215714 ?auto_215712 ) ) ( not ( = ?auto_215718 ?auto_215719 ) ) ( not ( = ?auto_215718 ?auto_215717 ) ) ( not ( = ?auto_215718 ?auto_215716 ) ) ( not ( = ?auto_215713 ?auto_215715 ) ) ( not ( = ?auto_215711 ?auto_215715 ) ) ( not ( = ?auto_215714 ?auto_215715 ) ) ( not ( = ?auto_215712 ?auto_215715 ) ) ( not ( = ?auto_215721 ?auto_215718 ) ) ( not ( = ?auto_215721 ?auto_215719 ) ) ( not ( = ?auto_215721 ?auto_215717 ) ) ( not ( = ?auto_215721 ?auto_215716 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_215713 ?auto_215711 ?auto_215714 ?auto_215715 ?auto_215712 ?auto_215710 )
      ( DELIVER-5PKG-VERIFY ?auto_215711 ?auto_215712 ?auto_215713 ?auto_215714 ?auto_215715 ?auto_215710 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_215766 - OBJ
      ?auto_215767 - OBJ
      ?auto_215768 - OBJ
      ?auto_215769 - OBJ
      ?auto_215770 - OBJ
      ?auto_215765 - LOCATION
    )
    :vars
    (
      ?auto_215776 - LOCATION
      ?auto_215775 - CITY
      ?auto_215773 - LOCATION
      ?auto_215774 - LOCATION
      ?auto_215772 - LOCATION
      ?auto_215771 - LOCATION
      ?auto_215777 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_215776 ?auto_215775 ) ( IN-CITY ?auto_215765 ?auto_215775 ) ( not ( = ?auto_215765 ?auto_215776 ) ) ( OBJ-AT ?auto_215769 ?auto_215776 ) ( IN-CITY ?auto_215773 ?auto_215775 ) ( not ( = ?auto_215765 ?auto_215773 ) ) ( OBJ-AT ?auto_215767 ?auto_215773 ) ( IN-CITY ?auto_215774 ?auto_215775 ) ( not ( = ?auto_215765 ?auto_215774 ) ) ( OBJ-AT ?auto_215770 ?auto_215774 ) ( IN-CITY ?auto_215772 ?auto_215775 ) ( not ( = ?auto_215765 ?auto_215772 ) ) ( OBJ-AT ?auto_215766 ?auto_215772 ) ( IN-CITY ?auto_215771 ?auto_215775 ) ( not ( = ?auto_215765 ?auto_215771 ) ) ( OBJ-AT ?auto_215768 ?auto_215771 ) ( TRUCK-AT ?auto_215777 ?auto_215765 ) ( not ( = ?auto_215768 ?auto_215766 ) ) ( not ( = ?auto_215772 ?auto_215771 ) ) ( not ( = ?auto_215768 ?auto_215770 ) ) ( not ( = ?auto_215766 ?auto_215770 ) ) ( not ( = ?auto_215774 ?auto_215772 ) ) ( not ( = ?auto_215774 ?auto_215771 ) ) ( not ( = ?auto_215768 ?auto_215767 ) ) ( not ( = ?auto_215766 ?auto_215767 ) ) ( not ( = ?auto_215770 ?auto_215767 ) ) ( not ( = ?auto_215773 ?auto_215774 ) ) ( not ( = ?auto_215773 ?auto_215772 ) ) ( not ( = ?auto_215773 ?auto_215771 ) ) ( not ( = ?auto_215768 ?auto_215769 ) ) ( not ( = ?auto_215766 ?auto_215769 ) ) ( not ( = ?auto_215770 ?auto_215769 ) ) ( not ( = ?auto_215767 ?auto_215769 ) ) ( not ( = ?auto_215776 ?auto_215773 ) ) ( not ( = ?auto_215776 ?auto_215774 ) ) ( not ( = ?auto_215776 ?auto_215772 ) ) ( not ( = ?auto_215776 ?auto_215771 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_215768 ?auto_215766 ?auto_215770 ?auto_215769 ?auto_215767 ?auto_215765 )
      ( DELIVER-5PKG-VERIFY ?auto_215766 ?auto_215767 ?auto_215768 ?auto_215769 ?auto_215770 ?auto_215765 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_215938 - OBJ
      ?auto_215939 - OBJ
      ?auto_215940 - OBJ
      ?auto_215941 - OBJ
      ?auto_215942 - OBJ
      ?auto_215937 - LOCATION
    )
    :vars
    (
      ?auto_215948 - LOCATION
      ?auto_215947 - CITY
      ?auto_215945 - LOCATION
      ?auto_215946 - LOCATION
      ?auto_215944 - LOCATION
      ?auto_215943 - LOCATION
      ?auto_215949 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_215948 ?auto_215947 ) ( IN-CITY ?auto_215937 ?auto_215947 ) ( not ( = ?auto_215937 ?auto_215948 ) ) ( OBJ-AT ?auto_215942 ?auto_215948 ) ( IN-CITY ?auto_215945 ?auto_215947 ) ( not ( = ?auto_215937 ?auto_215945 ) ) ( OBJ-AT ?auto_215939 ?auto_215945 ) ( IN-CITY ?auto_215946 ?auto_215947 ) ( not ( = ?auto_215937 ?auto_215946 ) ) ( OBJ-AT ?auto_215940 ?auto_215946 ) ( IN-CITY ?auto_215944 ?auto_215947 ) ( not ( = ?auto_215937 ?auto_215944 ) ) ( OBJ-AT ?auto_215938 ?auto_215944 ) ( IN-CITY ?auto_215943 ?auto_215947 ) ( not ( = ?auto_215937 ?auto_215943 ) ) ( OBJ-AT ?auto_215941 ?auto_215943 ) ( TRUCK-AT ?auto_215949 ?auto_215937 ) ( not ( = ?auto_215941 ?auto_215938 ) ) ( not ( = ?auto_215944 ?auto_215943 ) ) ( not ( = ?auto_215941 ?auto_215940 ) ) ( not ( = ?auto_215938 ?auto_215940 ) ) ( not ( = ?auto_215946 ?auto_215944 ) ) ( not ( = ?auto_215946 ?auto_215943 ) ) ( not ( = ?auto_215941 ?auto_215939 ) ) ( not ( = ?auto_215938 ?auto_215939 ) ) ( not ( = ?auto_215940 ?auto_215939 ) ) ( not ( = ?auto_215945 ?auto_215946 ) ) ( not ( = ?auto_215945 ?auto_215944 ) ) ( not ( = ?auto_215945 ?auto_215943 ) ) ( not ( = ?auto_215941 ?auto_215942 ) ) ( not ( = ?auto_215938 ?auto_215942 ) ) ( not ( = ?auto_215940 ?auto_215942 ) ) ( not ( = ?auto_215939 ?auto_215942 ) ) ( not ( = ?auto_215948 ?auto_215945 ) ) ( not ( = ?auto_215948 ?auto_215946 ) ) ( not ( = ?auto_215948 ?auto_215944 ) ) ( not ( = ?auto_215948 ?auto_215943 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_215941 ?auto_215938 ?auto_215940 ?auto_215942 ?auto_215939 ?auto_215937 )
      ( DELIVER-5PKG-VERIFY ?auto_215938 ?auto_215939 ?auto_215940 ?auto_215941 ?auto_215942 ?auto_215937 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_215993 - OBJ
      ?auto_215994 - OBJ
      ?auto_215995 - OBJ
      ?auto_215996 - OBJ
      ?auto_215997 - OBJ
      ?auto_215992 - LOCATION
    )
    :vars
    (
      ?auto_216003 - LOCATION
      ?auto_216002 - CITY
      ?auto_216000 - LOCATION
      ?auto_216001 - LOCATION
      ?auto_215999 - LOCATION
      ?auto_215998 - LOCATION
      ?auto_216004 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_216003 ?auto_216002 ) ( IN-CITY ?auto_215992 ?auto_216002 ) ( not ( = ?auto_215992 ?auto_216003 ) ) ( OBJ-AT ?auto_215996 ?auto_216003 ) ( IN-CITY ?auto_216000 ?auto_216002 ) ( not ( = ?auto_215992 ?auto_216000 ) ) ( OBJ-AT ?auto_215994 ?auto_216000 ) ( IN-CITY ?auto_216001 ?auto_216002 ) ( not ( = ?auto_215992 ?auto_216001 ) ) ( OBJ-AT ?auto_215995 ?auto_216001 ) ( IN-CITY ?auto_215999 ?auto_216002 ) ( not ( = ?auto_215992 ?auto_215999 ) ) ( OBJ-AT ?auto_215993 ?auto_215999 ) ( IN-CITY ?auto_215998 ?auto_216002 ) ( not ( = ?auto_215992 ?auto_215998 ) ) ( OBJ-AT ?auto_215997 ?auto_215998 ) ( TRUCK-AT ?auto_216004 ?auto_215992 ) ( not ( = ?auto_215997 ?auto_215993 ) ) ( not ( = ?auto_215999 ?auto_215998 ) ) ( not ( = ?auto_215997 ?auto_215995 ) ) ( not ( = ?auto_215993 ?auto_215995 ) ) ( not ( = ?auto_216001 ?auto_215999 ) ) ( not ( = ?auto_216001 ?auto_215998 ) ) ( not ( = ?auto_215997 ?auto_215994 ) ) ( not ( = ?auto_215993 ?auto_215994 ) ) ( not ( = ?auto_215995 ?auto_215994 ) ) ( not ( = ?auto_216000 ?auto_216001 ) ) ( not ( = ?auto_216000 ?auto_215999 ) ) ( not ( = ?auto_216000 ?auto_215998 ) ) ( not ( = ?auto_215997 ?auto_215996 ) ) ( not ( = ?auto_215993 ?auto_215996 ) ) ( not ( = ?auto_215995 ?auto_215996 ) ) ( not ( = ?auto_215994 ?auto_215996 ) ) ( not ( = ?auto_216003 ?auto_216000 ) ) ( not ( = ?auto_216003 ?auto_216001 ) ) ( not ( = ?auto_216003 ?auto_215999 ) ) ( not ( = ?auto_216003 ?auto_215998 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_215997 ?auto_215993 ?auto_215995 ?auto_215996 ?auto_215994 ?auto_215992 )
      ( DELIVER-5PKG-VERIFY ?auto_215993 ?auto_215994 ?auto_215995 ?auto_215996 ?auto_215997 ?auto_215992 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216221 - OBJ
      ?auto_216222 - OBJ
      ?auto_216223 - OBJ
      ?auto_216224 - OBJ
      ?auto_216225 - OBJ
      ?auto_216220 - LOCATION
    )
    :vars
    (
      ?auto_216231 - LOCATION
      ?auto_216230 - CITY
      ?auto_216228 - LOCATION
      ?auto_216229 - LOCATION
      ?auto_216227 - LOCATION
      ?auto_216226 - LOCATION
      ?auto_216232 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_216231 ?auto_216230 ) ( IN-CITY ?auto_216220 ?auto_216230 ) ( not ( = ?auto_216220 ?auto_216231 ) ) ( OBJ-AT ?auto_216223 ?auto_216231 ) ( IN-CITY ?auto_216228 ?auto_216230 ) ( not ( = ?auto_216220 ?auto_216228 ) ) ( OBJ-AT ?auto_216222 ?auto_216228 ) ( IN-CITY ?auto_216229 ?auto_216230 ) ( not ( = ?auto_216220 ?auto_216229 ) ) ( OBJ-AT ?auto_216225 ?auto_216229 ) ( IN-CITY ?auto_216227 ?auto_216230 ) ( not ( = ?auto_216220 ?auto_216227 ) ) ( OBJ-AT ?auto_216221 ?auto_216227 ) ( IN-CITY ?auto_216226 ?auto_216230 ) ( not ( = ?auto_216220 ?auto_216226 ) ) ( OBJ-AT ?auto_216224 ?auto_216226 ) ( TRUCK-AT ?auto_216232 ?auto_216220 ) ( not ( = ?auto_216224 ?auto_216221 ) ) ( not ( = ?auto_216227 ?auto_216226 ) ) ( not ( = ?auto_216224 ?auto_216225 ) ) ( not ( = ?auto_216221 ?auto_216225 ) ) ( not ( = ?auto_216229 ?auto_216227 ) ) ( not ( = ?auto_216229 ?auto_216226 ) ) ( not ( = ?auto_216224 ?auto_216222 ) ) ( not ( = ?auto_216221 ?auto_216222 ) ) ( not ( = ?auto_216225 ?auto_216222 ) ) ( not ( = ?auto_216228 ?auto_216229 ) ) ( not ( = ?auto_216228 ?auto_216227 ) ) ( not ( = ?auto_216228 ?auto_216226 ) ) ( not ( = ?auto_216224 ?auto_216223 ) ) ( not ( = ?auto_216221 ?auto_216223 ) ) ( not ( = ?auto_216225 ?auto_216223 ) ) ( not ( = ?auto_216222 ?auto_216223 ) ) ( not ( = ?auto_216231 ?auto_216228 ) ) ( not ( = ?auto_216231 ?auto_216229 ) ) ( not ( = ?auto_216231 ?auto_216227 ) ) ( not ( = ?auto_216231 ?auto_216226 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_216224 ?auto_216221 ?auto_216225 ?auto_216223 ?auto_216222 ?auto_216220 )
      ( DELIVER-5PKG-VERIFY ?auto_216221 ?auto_216222 ?auto_216223 ?auto_216224 ?auto_216225 ?auto_216220 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216335 - OBJ
      ?auto_216336 - OBJ
      ?auto_216337 - OBJ
      ?auto_216338 - OBJ
      ?auto_216339 - OBJ
      ?auto_216334 - LOCATION
    )
    :vars
    (
      ?auto_216345 - LOCATION
      ?auto_216344 - CITY
      ?auto_216342 - LOCATION
      ?auto_216343 - LOCATION
      ?auto_216341 - LOCATION
      ?auto_216340 - LOCATION
      ?auto_216346 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_216345 ?auto_216344 ) ( IN-CITY ?auto_216334 ?auto_216344 ) ( not ( = ?auto_216334 ?auto_216345 ) ) ( OBJ-AT ?auto_216337 ?auto_216345 ) ( IN-CITY ?auto_216342 ?auto_216344 ) ( not ( = ?auto_216334 ?auto_216342 ) ) ( OBJ-AT ?auto_216336 ?auto_216342 ) ( IN-CITY ?auto_216343 ?auto_216344 ) ( not ( = ?auto_216334 ?auto_216343 ) ) ( OBJ-AT ?auto_216338 ?auto_216343 ) ( IN-CITY ?auto_216341 ?auto_216344 ) ( not ( = ?auto_216334 ?auto_216341 ) ) ( OBJ-AT ?auto_216335 ?auto_216341 ) ( IN-CITY ?auto_216340 ?auto_216344 ) ( not ( = ?auto_216334 ?auto_216340 ) ) ( OBJ-AT ?auto_216339 ?auto_216340 ) ( TRUCK-AT ?auto_216346 ?auto_216334 ) ( not ( = ?auto_216339 ?auto_216335 ) ) ( not ( = ?auto_216341 ?auto_216340 ) ) ( not ( = ?auto_216339 ?auto_216338 ) ) ( not ( = ?auto_216335 ?auto_216338 ) ) ( not ( = ?auto_216343 ?auto_216341 ) ) ( not ( = ?auto_216343 ?auto_216340 ) ) ( not ( = ?auto_216339 ?auto_216336 ) ) ( not ( = ?auto_216335 ?auto_216336 ) ) ( not ( = ?auto_216338 ?auto_216336 ) ) ( not ( = ?auto_216342 ?auto_216343 ) ) ( not ( = ?auto_216342 ?auto_216341 ) ) ( not ( = ?auto_216342 ?auto_216340 ) ) ( not ( = ?auto_216339 ?auto_216337 ) ) ( not ( = ?auto_216335 ?auto_216337 ) ) ( not ( = ?auto_216338 ?auto_216337 ) ) ( not ( = ?auto_216336 ?auto_216337 ) ) ( not ( = ?auto_216345 ?auto_216342 ) ) ( not ( = ?auto_216345 ?auto_216343 ) ) ( not ( = ?auto_216345 ?auto_216341 ) ) ( not ( = ?auto_216345 ?auto_216340 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_216339 ?auto_216335 ?auto_216338 ?auto_216337 ?auto_216336 ?auto_216334 )
      ( DELIVER-5PKG-VERIFY ?auto_216335 ?auto_216336 ?auto_216337 ?auto_216338 ?auto_216339 ?auto_216334 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216738 - OBJ
      ?auto_216739 - OBJ
      ?auto_216740 - OBJ
      ?auto_216741 - OBJ
      ?auto_216742 - OBJ
      ?auto_216737 - LOCATION
    )
    :vars
    (
      ?auto_216748 - LOCATION
      ?auto_216747 - CITY
      ?auto_216745 - LOCATION
      ?auto_216746 - LOCATION
      ?auto_216744 - LOCATION
      ?auto_216743 - LOCATION
      ?auto_216749 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_216748 ?auto_216747 ) ( IN-CITY ?auto_216737 ?auto_216747 ) ( not ( = ?auto_216737 ?auto_216748 ) ) ( OBJ-AT ?auto_216739 ?auto_216748 ) ( IN-CITY ?auto_216745 ?auto_216747 ) ( not ( = ?auto_216737 ?auto_216745 ) ) ( OBJ-AT ?auto_216742 ?auto_216745 ) ( IN-CITY ?auto_216746 ?auto_216747 ) ( not ( = ?auto_216737 ?auto_216746 ) ) ( OBJ-AT ?auto_216741 ?auto_216746 ) ( IN-CITY ?auto_216744 ?auto_216747 ) ( not ( = ?auto_216737 ?auto_216744 ) ) ( OBJ-AT ?auto_216738 ?auto_216744 ) ( IN-CITY ?auto_216743 ?auto_216747 ) ( not ( = ?auto_216737 ?auto_216743 ) ) ( OBJ-AT ?auto_216740 ?auto_216743 ) ( TRUCK-AT ?auto_216749 ?auto_216737 ) ( not ( = ?auto_216740 ?auto_216738 ) ) ( not ( = ?auto_216744 ?auto_216743 ) ) ( not ( = ?auto_216740 ?auto_216741 ) ) ( not ( = ?auto_216738 ?auto_216741 ) ) ( not ( = ?auto_216746 ?auto_216744 ) ) ( not ( = ?auto_216746 ?auto_216743 ) ) ( not ( = ?auto_216740 ?auto_216742 ) ) ( not ( = ?auto_216738 ?auto_216742 ) ) ( not ( = ?auto_216741 ?auto_216742 ) ) ( not ( = ?auto_216745 ?auto_216746 ) ) ( not ( = ?auto_216745 ?auto_216744 ) ) ( not ( = ?auto_216745 ?auto_216743 ) ) ( not ( = ?auto_216740 ?auto_216739 ) ) ( not ( = ?auto_216738 ?auto_216739 ) ) ( not ( = ?auto_216741 ?auto_216739 ) ) ( not ( = ?auto_216742 ?auto_216739 ) ) ( not ( = ?auto_216748 ?auto_216745 ) ) ( not ( = ?auto_216748 ?auto_216746 ) ) ( not ( = ?auto_216748 ?auto_216744 ) ) ( not ( = ?auto_216748 ?auto_216743 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_216740 ?auto_216738 ?auto_216741 ?auto_216739 ?auto_216742 ?auto_216737 )
      ( DELIVER-5PKG-VERIFY ?auto_216738 ?auto_216739 ?auto_216740 ?auto_216741 ?auto_216742 ?auto_216737 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216793 - OBJ
      ?auto_216794 - OBJ
      ?auto_216795 - OBJ
      ?auto_216796 - OBJ
      ?auto_216797 - OBJ
      ?auto_216792 - LOCATION
    )
    :vars
    (
      ?auto_216803 - LOCATION
      ?auto_216802 - CITY
      ?auto_216800 - LOCATION
      ?auto_216801 - LOCATION
      ?auto_216799 - LOCATION
      ?auto_216798 - LOCATION
      ?auto_216804 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_216803 ?auto_216802 ) ( IN-CITY ?auto_216792 ?auto_216802 ) ( not ( = ?auto_216792 ?auto_216803 ) ) ( OBJ-AT ?auto_216794 ?auto_216803 ) ( IN-CITY ?auto_216800 ?auto_216802 ) ( not ( = ?auto_216792 ?auto_216800 ) ) ( OBJ-AT ?auto_216796 ?auto_216800 ) ( IN-CITY ?auto_216801 ?auto_216802 ) ( not ( = ?auto_216792 ?auto_216801 ) ) ( OBJ-AT ?auto_216797 ?auto_216801 ) ( IN-CITY ?auto_216799 ?auto_216802 ) ( not ( = ?auto_216792 ?auto_216799 ) ) ( OBJ-AT ?auto_216793 ?auto_216799 ) ( IN-CITY ?auto_216798 ?auto_216802 ) ( not ( = ?auto_216792 ?auto_216798 ) ) ( OBJ-AT ?auto_216795 ?auto_216798 ) ( TRUCK-AT ?auto_216804 ?auto_216792 ) ( not ( = ?auto_216795 ?auto_216793 ) ) ( not ( = ?auto_216799 ?auto_216798 ) ) ( not ( = ?auto_216795 ?auto_216797 ) ) ( not ( = ?auto_216793 ?auto_216797 ) ) ( not ( = ?auto_216801 ?auto_216799 ) ) ( not ( = ?auto_216801 ?auto_216798 ) ) ( not ( = ?auto_216795 ?auto_216796 ) ) ( not ( = ?auto_216793 ?auto_216796 ) ) ( not ( = ?auto_216797 ?auto_216796 ) ) ( not ( = ?auto_216800 ?auto_216801 ) ) ( not ( = ?auto_216800 ?auto_216799 ) ) ( not ( = ?auto_216800 ?auto_216798 ) ) ( not ( = ?auto_216795 ?auto_216794 ) ) ( not ( = ?auto_216793 ?auto_216794 ) ) ( not ( = ?auto_216797 ?auto_216794 ) ) ( not ( = ?auto_216796 ?auto_216794 ) ) ( not ( = ?auto_216803 ?auto_216800 ) ) ( not ( = ?auto_216803 ?auto_216801 ) ) ( not ( = ?auto_216803 ?auto_216799 ) ) ( not ( = ?auto_216803 ?auto_216798 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_216795 ?auto_216793 ?auto_216797 ?auto_216794 ?auto_216796 ?auto_216792 )
      ( DELIVER-5PKG-VERIFY ?auto_216793 ?auto_216794 ?auto_216795 ?auto_216796 ?auto_216797 ?auto_216792 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217322 - OBJ
      ?auto_217323 - OBJ
      ?auto_217324 - OBJ
      ?auto_217325 - OBJ
      ?auto_217326 - OBJ
      ?auto_217321 - LOCATION
    )
    :vars
    (
      ?auto_217332 - LOCATION
      ?auto_217331 - CITY
      ?auto_217329 - LOCATION
      ?auto_217330 - LOCATION
      ?auto_217328 - LOCATION
      ?auto_217327 - LOCATION
      ?auto_217333 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217332 ?auto_217331 ) ( IN-CITY ?auto_217321 ?auto_217331 ) ( not ( = ?auto_217321 ?auto_217332 ) ) ( OBJ-AT ?auto_217323 ?auto_217332 ) ( IN-CITY ?auto_217329 ?auto_217331 ) ( not ( = ?auto_217321 ?auto_217329 ) ) ( OBJ-AT ?auto_217326 ?auto_217329 ) ( IN-CITY ?auto_217330 ?auto_217331 ) ( not ( = ?auto_217321 ?auto_217330 ) ) ( OBJ-AT ?auto_217324 ?auto_217330 ) ( IN-CITY ?auto_217328 ?auto_217331 ) ( not ( = ?auto_217321 ?auto_217328 ) ) ( OBJ-AT ?auto_217322 ?auto_217328 ) ( IN-CITY ?auto_217327 ?auto_217331 ) ( not ( = ?auto_217321 ?auto_217327 ) ) ( OBJ-AT ?auto_217325 ?auto_217327 ) ( TRUCK-AT ?auto_217333 ?auto_217321 ) ( not ( = ?auto_217325 ?auto_217322 ) ) ( not ( = ?auto_217328 ?auto_217327 ) ) ( not ( = ?auto_217325 ?auto_217324 ) ) ( not ( = ?auto_217322 ?auto_217324 ) ) ( not ( = ?auto_217330 ?auto_217328 ) ) ( not ( = ?auto_217330 ?auto_217327 ) ) ( not ( = ?auto_217325 ?auto_217326 ) ) ( not ( = ?auto_217322 ?auto_217326 ) ) ( not ( = ?auto_217324 ?auto_217326 ) ) ( not ( = ?auto_217329 ?auto_217330 ) ) ( not ( = ?auto_217329 ?auto_217328 ) ) ( not ( = ?auto_217329 ?auto_217327 ) ) ( not ( = ?auto_217325 ?auto_217323 ) ) ( not ( = ?auto_217322 ?auto_217323 ) ) ( not ( = ?auto_217324 ?auto_217323 ) ) ( not ( = ?auto_217326 ?auto_217323 ) ) ( not ( = ?auto_217332 ?auto_217329 ) ) ( not ( = ?auto_217332 ?auto_217330 ) ) ( not ( = ?auto_217332 ?auto_217328 ) ) ( not ( = ?auto_217332 ?auto_217327 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_217325 ?auto_217322 ?auto_217324 ?auto_217323 ?auto_217326 ?auto_217321 )
      ( DELIVER-5PKG-VERIFY ?auto_217322 ?auto_217323 ?auto_217324 ?auto_217325 ?auto_217326 ?auto_217321 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217495 - OBJ
      ?auto_217496 - OBJ
      ?auto_217497 - OBJ
      ?auto_217498 - OBJ
      ?auto_217499 - OBJ
      ?auto_217494 - LOCATION
    )
    :vars
    (
      ?auto_217505 - LOCATION
      ?auto_217504 - CITY
      ?auto_217502 - LOCATION
      ?auto_217503 - LOCATION
      ?auto_217501 - LOCATION
      ?auto_217500 - LOCATION
      ?auto_217506 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217505 ?auto_217504 ) ( IN-CITY ?auto_217494 ?auto_217504 ) ( not ( = ?auto_217494 ?auto_217505 ) ) ( OBJ-AT ?auto_217496 ?auto_217505 ) ( IN-CITY ?auto_217502 ?auto_217504 ) ( not ( = ?auto_217494 ?auto_217502 ) ) ( OBJ-AT ?auto_217498 ?auto_217502 ) ( IN-CITY ?auto_217503 ?auto_217504 ) ( not ( = ?auto_217494 ?auto_217503 ) ) ( OBJ-AT ?auto_217497 ?auto_217503 ) ( IN-CITY ?auto_217501 ?auto_217504 ) ( not ( = ?auto_217494 ?auto_217501 ) ) ( OBJ-AT ?auto_217495 ?auto_217501 ) ( IN-CITY ?auto_217500 ?auto_217504 ) ( not ( = ?auto_217494 ?auto_217500 ) ) ( OBJ-AT ?auto_217499 ?auto_217500 ) ( TRUCK-AT ?auto_217506 ?auto_217494 ) ( not ( = ?auto_217499 ?auto_217495 ) ) ( not ( = ?auto_217501 ?auto_217500 ) ) ( not ( = ?auto_217499 ?auto_217497 ) ) ( not ( = ?auto_217495 ?auto_217497 ) ) ( not ( = ?auto_217503 ?auto_217501 ) ) ( not ( = ?auto_217503 ?auto_217500 ) ) ( not ( = ?auto_217499 ?auto_217498 ) ) ( not ( = ?auto_217495 ?auto_217498 ) ) ( not ( = ?auto_217497 ?auto_217498 ) ) ( not ( = ?auto_217502 ?auto_217503 ) ) ( not ( = ?auto_217502 ?auto_217501 ) ) ( not ( = ?auto_217502 ?auto_217500 ) ) ( not ( = ?auto_217499 ?auto_217496 ) ) ( not ( = ?auto_217495 ?auto_217496 ) ) ( not ( = ?auto_217497 ?auto_217496 ) ) ( not ( = ?auto_217498 ?auto_217496 ) ) ( not ( = ?auto_217505 ?auto_217502 ) ) ( not ( = ?auto_217505 ?auto_217503 ) ) ( not ( = ?auto_217505 ?auto_217501 ) ) ( not ( = ?auto_217505 ?auto_217500 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_217499 ?auto_217495 ?auto_217497 ?auto_217496 ?auto_217498 ?auto_217494 )
      ( DELIVER-5PKG-VERIFY ?auto_217495 ?auto_217496 ?auto_217497 ?auto_217498 ?auto_217499 ?auto_217494 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217665 - OBJ
      ?auto_217666 - OBJ
      ?auto_217667 - OBJ
      ?auto_217668 - OBJ
      ?auto_217669 - OBJ
      ?auto_217664 - LOCATION
    )
    :vars
    (
      ?auto_217675 - LOCATION
      ?auto_217674 - CITY
      ?auto_217672 - LOCATION
      ?auto_217673 - LOCATION
      ?auto_217671 - LOCATION
      ?auto_217670 - LOCATION
      ?auto_217676 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217675 ?auto_217674 ) ( IN-CITY ?auto_217664 ?auto_217674 ) ( not ( = ?auto_217664 ?auto_217675 ) ) ( OBJ-AT ?auto_217666 ?auto_217675 ) ( IN-CITY ?auto_217672 ?auto_217674 ) ( not ( = ?auto_217664 ?auto_217672 ) ) ( OBJ-AT ?auto_217667 ?auto_217672 ) ( IN-CITY ?auto_217673 ?auto_217674 ) ( not ( = ?auto_217664 ?auto_217673 ) ) ( OBJ-AT ?auto_217669 ?auto_217673 ) ( IN-CITY ?auto_217671 ?auto_217674 ) ( not ( = ?auto_217664 ?auto_217671 ) ) ( OBJ-AT ?auto_217665 ?auto_217671 ) ( IN-CITY ?auto_217670 ?auto_217674 ) ( not ( = ?auto_217664 ?auto_217670 ) ) ( OBJ-AT ?auto_217668 ?auto_217670 ) ( TRUCK-AT ?auto_217676 ?auto_217664 ) ( not ( = ?auto_217668 ?auto_217665 ) ) ( not ( = ?auto_217671 ?auto_217670 ) ) ( not ( = ?auto_217668 ?auto_217669 ) ) ( not ( = ?auto_217665 ?auto_217669 ) ) ( not ( = ?auto_217673 ?auto_217671 ) ) ( not ( = ?auto_217673 ?auto_217670 ) ) ( not ( = ?auto_217668 ?auto_217667 ) ) ( not ( = ?auto_217665 ?auto_217667 ) ) ( not ( = ?auto_217669 ?auto_217667 ) ) ( not ( = ?auto_217672 ?auto_217673 ) ) ( not ( = ?auto_217672 ?auto_217671 ) ) ( not ( = ?auto_217672 ?auto_217670 ) ) ( not ( = ?auto_217668 ?auto_217666 ) ) ( not ( = ?auto_217665 ?auto_217666 ) ) ( not ( = ?auto_217669 ?auto_217666 ) ) ( not ( = ?auto_217667 ?auto_217666 ) ) ( not ( = ?auto_217675 ?auto_217672 ) ) ( not ( = ?auto_217675 ?auto_217673 ) ) ( not ( = ?auto_217675 ?auto_217671 ) ) ( not ( = ?auto_217675 ?auto_217670 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_217668 ?auto_217665 ?auto_217669 ?auto_217666 ?auto_217667 ?auto_217664 )
      ( DELIVER-5PKG-VERIFY ?auto_217665 ?auto_217666 ?auto_217667 ?auto_217668 ?auto_217669 ?auto_217664 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217779 - OBJ
      ?auto_217780 - OBJ
      ?auto_217781 - OBJ
      ?auto_217782 - OBJ
      ?auto_217783 - OBJ
      ?auto_217778 - LOCATION
    )
    :vars
    (
      ?auto_217789 - LOCATION
      ?auto_217788 - CITY
      ?auto_217786 - LOCATION
      ?auto_217787 - LOCATION
      ?auto_217785 - LOCATION
      ?auto_217784 - LOCATION
      ?auto_217790 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217789 ?auto_217788 ) ( IN-CITY ?auto_217778 ?auto_217788 ) ( not ( = ?auto_217778 ?auto_217789 ) ) ( OBJ-AT ?auto_217780 ?auto_217789 ) ( IN-CITY ?auto_217786 ?auto_217788 ) ( not ( = ?auto_217778 ?auto_217786 ) ) ( OBJ-AT ?auto_217781 ?auto_217786 ) ( IN-CITY ?auto_217787 ?auto_217788 ) ( not ( = ?auto_217778 ?auto_217787 ) ) ( OBJ-AT ?auto_217782 ?auto_217787 ) ( IN-CITY ?auto_217785 ?auto_217788 ) ( not ( = ?auto_217778 ?auto_217785 ) ) ( OBJ-AT ?auto_217779 ?auto_217785 ) ( IN-CITY ?auto_217784 ?auto_217788 ) ( not ( = ?auto_217778 ?auto_217784 ) ) ( OBJ-AT ?auto_217783 ?auto_217784 ) ( TRUCK-AT ?auto_217790 ?auto_217778 ) ( not ( = ?auto_217783 ?auto_217779 ) ) ( not ( = ?auto_217785 ?auto_217784 ) ) ( not ( = ?auto_217783 ?auto_217782 ) ) ( not ( = ?auto_217779 ?auto_217782 ) ) ( not ( = ?auto_217787 ?auto_217785 ) ) ( not ( = ?auto_217787 ?auto_217784 ) ) ( not ( = ?auto_217783 ?auto_217781 ) ) ( not ( = ?auto_217779 ?auto_217781 ) ) ( not ( = ?auto_217782 ?auto_217781 ) ) ( not ( = ?auto_217786 ?auto_217787 ) ) ( not ( = ?auto_217786 ?auto_217785 ) ) ( not ( = ?auto_217786 ?auto_217784 ) ) ( not ( = ?auto_217783 ?auto_217780 ) ) ( not ( = ?auto_217779 ?auto_217780 ) ) ( not ( = ?auto_217782 ?auto_217780 ) ) ( not ( = ?auto_217781 ?auto_217780 ) ) ( not ( = ?auto_217789 ?auto_217786 ) ) ( not ( = ?auto_217789 ?auto_217787 ) ) ( not ( = ?auto_217789 ?auto_217785 ) ) ( not ( = ?auto_217789 ?auto_217784 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_217783 ?auto_217779 ?auto_217782 ?auto_217780 ?auto_217781 ?auto_217778 )
      ( DELIVER-5PKG-VERIFY ?auto_217779 ?auto_217780 ?auto_217781 ?auto_217782 ?auto_217783 ?auto_217778 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_218540 - OBJ
      ?auto_218541 - OBJ
      ?auto_218542 - OBJ
      ?auto_218543 - OBJ
      ?auto_218544 - OBJ
      ?auto_218539 - LOCATION
    )
    :vars
    (
      ?auto_218550 - LOCATION
      ?auto_218549 - CITY
      ?auto_218547 - LOCATION
      ?auto_218548 - LOCATION
      ?auto_218546 - LOCATION
      ?auto_218545 - LOCATION
      ?auto_218551 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218550 ?auto_218549 ) ( IN-CITY ?auto_218539 ?auto_218549 ) ( not ( = ?auto_218539 ?auto_218550 ) ) ( OBJ-AT ?auto_218544 ?auto_218550 ) ( IN-CITY ?auto_218547 ?auto_218549 ) ( not ( = ?auto_218539 ?auto_218547 ) ) ( OBJ-AT ?auto_218543 ?auto_218547 ) ( IN-CITY ?auto_218548 ?auto_218549 ) ( not ( = ?auto_218539 ?auto_218548 ) ) ( OBJ-AT ?auto_218540 ?auto_218548 ) ( IN-CITY ?auto_218546 ?auto_218549 ) ( not ( = ?auto_218539 ?auto_218546 ) ) ( OBJ-AT ?auto_218542 ?auto_218546 ) ( IN-CITY ?auto_218545 ?auto_218549 ) ( not ( = ?auto_218539 ?auto_218545 ) ) ( OBJ-AT ?auto_218541 ?auto_218545 ) ( TRUCK-AT ?auto_218551 ?auto_218539 ) ( not ( = ?auto_218541 ?auto_218542 ) ) ( not ( = ?auto_218546 ?auto_218545 ) ) ( not ( = ?auto_218541 ?auto_218540 ) ) ( not ( = ?auto_218542 ?auto_218540 ) ) ( not ( = ?auto_218548 ?auto_218546 ) ) ( not ( = ?auto_218548 ?auto_218545 ) ) ( not ( = ?auto_218541 ?auto_218543 ) ) ( not ( = ?auto_218542 ?auto_218543 ) ) ( not ( = ?auto_218540 ?auto_218543 ) ) ( not ( = ?auto_218547 ?auto_218548 ) ) ( not ( = ?auto_218547 ?auto_218546 ) ) ( not ( = ?auto_218547 ?auto_218545 ) ) ( not ( = ?auto_218541 ?auto_218544 ) ) ( not ( = ?auto_218542 ?auto_218544 ) ) ( not ( = ?auto_218540 ?auto_218544 ) ) ( not ( = ?auto_218543 ?auto_218544 ) ) ( not ( = ?auto_218550 ?auto_218547 ) ) ( not ( = ?auto_218550 ?auto_218548 ) ) ( not ( = ?auto_218550 ?auto_218546 ) ) ( not ( = ?auto_218550 ?auto_218545 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_218541 ?auto_218542 ?auto_218540 ?auto_218544 ?auto_218543 ?auto_218539 )
      ( DELIVER-5PKG-VERIFY ?auto_218540 ?auto_218541 ?auto_218542 ?auto_218543 ?auto_218544 ?auto_218539 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_218595 - OBJ
      ?auto_218596 - OBJ
      ?auto_218597 - OBJ
      ?auto_218598 - OBJ
      ?auto_218599 - OBJ
      ?auto_218594 - LOCATION
    )
    :vars
    (
      ?auto_218605 - LOCATION
      ?auto_218604 - CITY
      ?auto_218602 - LOCATION
      ?auto_218603 - LOCATION
      ?auto_218601 - LOCATION
      ?auto_218600 - LOCATION
      ?auto_218606 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218605 ?auto_218604 ) ( IN-CITY ?auto_218594 ?auto_218604 ) ( not ( = ?auto_218594 ?auto_218605 ) ) ( OBJ-AT ?auto_218598 ?auto_218605 ) ( IN-CITY ?auto_218602 ?auto_218604 ) ( not ( = ?auto_218594 ?auto_218602 ) ) ( OBJ-AT ?auto_218599 ?auto_218602 ) ( IN-CITY ?auto_218603 ?auto_218604 ) ( not ( = ?auto_218594 ?auto_218603 ) ) ( OBJ-AT ?auto_218595 ?auto_218603 ) ( IN-CITY ?auto_218601 ?auto_218604 ) ( not ( = ?auto_218594 ?auto_218601 ) ) ( OBJ-AT ?auto_218597 ?auto_218601 ) ( IN-CITY ?auto_218600 ?auto_218604 ) ( not ( = ?auto_218594 ?auto_218600 ) ) ( OBJ-AT ?auto_218596 ?auto_218600 ) ( TRUCK-AT ?auto_218606 ?auto_218594 ) ( not ( = ?auto_218596 ?auto_218597 ) ) ( not ( = ?auto_218601 ?auto_218600 ) ) ( not ( = ?auto_218596 ?auto_218595 ) ) ( not ( = ?auto_218597 ?auto_218595 ) ) ( not ( = ?auto_218603 ?auto_218601 ) ) ( not ( = ?auto_218603 ?auto_218600 ) ) ( not ( = ?auto_218596 ?auto_218599 ) ) ( not ( = ?auto_218597 ?auto_218599 ) ) ( not ( = ?auto_218595 ?auto_218599 ) ) ( not ( = ?auto_218602 ?auto_218603 ) ) ( not ( = ?auto_218602 ?auto_218601 ) ) ( not ( = ?auto_218602 ?auto_218600 ) ) ( not ( = ?auto_218596 ?auto_218598 ) ) ( not ( = ?auto_218597 ?auto_218598 ) ) ( not ( = ?auto_218595 ?auto_218598 ) ) ( not ( = ?auto_218599 ?auto_218598 ) ) ( not ( = ?auto_218605 ?auto_218602 ) ) ( not ( = ?auto_218605 ?auto_218603 ) ) ( not ( = ?auto_218605 ?auto_218601 ) ) ( not ( = ?auto_218605 ?auto_218600 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_218596 ?auto_218597 ?auto_218595 ?auto_218598 ?auto_218599 ?auto_218594 )
      ( DELIVER-5PKG-VERIFY ?auto_218595 ?auto_218596 ?auto_218597 ?auto_218598 ?auto_218599 ?auto_218594 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_218767 - OBJ
      ?auto_218768 - OBJ
      ?auto_218769 - OBJ
      ?auto_218770 - OBJ
      ?auto_218771 - OBJ
      ?auto_218766 - LOCATION
    )
    :vars
    (
      ?auto_218777 - LOCATION
      ?auto_218776 - CITY
      ?auto_218774 - LOCATION
      ?auto_218775 - LOCATION
      ?auto_218773 - LOCATION
      ?auto_218772 - LOCATION
      ?auto_218778 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218777 ?auto_218776 ) ( IN-CITY ?auto_218766 ?auto_218776 ) ( not ( = ?auto_218766 ?auto_218777 ) ) ( OBJ-AT ?auto_218771 ?auto_218777 ) ( IN-CITY ?auto_218774 ?auto_218776 ) ( not ( = ?auto_218766 ?auto_218774 ) ) ( OBJ-AT ?auto_218769 ?auto_218774 ) ( IN-CITY ?auto_218775 ?auto_218776 ) ( not ( = ?auto_218766 ?auto_218775 ) ) ( OBJ-AT ?auto_218767 ?auto_218775 ) ( IN-CITY ?auto_218773 ?auto_218776 ) ( not ( = ?auto_218766 ?auto_218773 ) ) ( OBJ-AT ?auto_218770 ?auto_218773 ) ( IN-CITY ?auto_218772 ?auto_218776 ) ( not ( = ?auto_218766 ?auto_218772 ) ) ( OBJ-AT ?auto_218768 ?auto_218772 ) ( TRUCK-AT ?auto_218778 ?auto_218766 ) ( not ( = ?auto_218768 ?auto_218770 ) ) ( not ( = ?auto_218773 ?auto_218772 ) ) ( not ( = ?auto_218768 ?auto_218767 ) ) ( not ( = ?auto_218770 ?auto_218767 ) ) ( not ( = ?auto_218775 ?auto_218773 ) ) ( not ( = ?auto_218775 ?auto_218772 ) ) ( not ( = ?auto_218768 ?auto_218769 ) ) ( not ( = ?auto_218770 ?auto_218769 ) ) ( not ( = ?auto_218767 ?auto_218769 ) ) ( not ( = ?auto_218774 ?auto_218775 ) ) ( not ( = ?auto_218774 ?auto_218773 ) ) ( not ( = ?auto_218774 ?auto_218772 ) ) ( not ( = ?auto_218768 ?auto_218771 ) ) ( not ( = ?auto_218770 ?auto_218771 ) ) ( not ( = ?auto_218767 ?auto_218771 ) ) ( not ( = ?auto_218769 ?auto_218771 ) ) ( not ( = ?auto_218777 ?auto_218774 ) ) ( not ( = ?auto_218777 ?auto_218775 ) ) ( not ( = ?auto_218777 ?auto_218773 ) ) ( not ( = ?auto_218777 ?auto_218772 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_218768 ?auto_218770 ?auto_218767 ?auto_218771 ?auto_218769 ?auto_218766 )
      ( DELIVER-5PKG-VERIFY ?auto_218767 ?auto_218768 ?auto_218769 ?auto_218770 ?auto_218771 ?auto_218766 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_218822 - OBJ
      ?auto_218823 - OBJ
      ?auto_218824 - OBJ
      ?auto_218825 - OBJ
      ?auto_218826 - OBJ
      ?auto_218821 - LOCATION
    )
    :vars
    (
      ?auto_218832 - LOCATION
      ?auto_218831 - CITY
      ?auto_218829 - LOCATION
      ?auto_218830 - LOCATION
      ?auto_218828 - LOCATION
      ?auto_218827 - LOCATION
      ?auto_218833 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218832 ?auto_218831 ) ( IN-CITY ?auto_218821 ?auto_218831 ) ( not ( = ?auto_218821 ?auto_218832 ) ) ( OBJ-AT ?auto_218825 ?auto_218832 ) ( IN-CITY ?auto_218829 ?auto_218831 ) ( not ( = ?auto_218821 ?auto_218829 ) ) ( OBJ-AT ?auto_218824 ?auto_218829 ) ( IN-CITY ?auto_218830 ?auto_218831 ) ( not ( = ?auto_218821 ?auto_218830 ) ) ( OBJ-AT ?auto_218822 ?auto_218830 ) ( IN-CITY ?auto_218828 ?auto_218831 ) ( not ( = ?auto_218821 ?auto_218828 ) ) ( OBJ-AT ?auto_218826 ?auto_218828 ) ( IN-CITY ?auto_218827 ?auto_218831 ) ( not ( = ?auto_218821 ?auto_218827 ) ) ( OBJ-AT ?auto_218823 ?auto_218827 ) ( TRUCK-AT ?auto_218833 ?auto_218821 ) ( not ( = ?auto_218823 ?auto_218826 ) ) ( not ( = ?auto_218828 ?auto_218827 ) ) ( not ( = ?auto_218823 ?auto_218822 ) ) ( not ( = ?auto_218826 ?auto_218822 ) ) ( not ( = ?auto_218830 ?auto_218828 ) ) ( not ( = ?auto_218830 ?auto_218827 ) ) ( not ( = ?auto_218823 ?auto_218824 ) ) ( not ( = ?auto_218826 ?auto_218824 ) ) ( not ( = ?auto_218822 ?auto_218824 ) ) ( not ( = ?auto_218829 ?auto_218830 ) ) ( not ( = ?auto_218829 ?auto_218828 ) ) ( not ( = ?auto_218829 ?auto_218827 ) ) ( not ( = ?auto_218823 ?auto_218825 ) ) ( not ( = ?auto_218826 ?auto_218825 ) ) ( not ( = ?auto_218822 ?auto_218825 ) ) ( not ( = ?auto_218824 ?auto_218825 ) ) ( not ( = ?auto_218832 ?auto_218829 ) ) ( not ( = ?auto_218832 ?auto_218830 ) ) ( not ( = ?auto_218832 ?auto_218828 ) ) ( not ( = ?auto_218832 ?auto_218827 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_218823 ?auto_218826 ?auto_218822 ?auto_218825 ?auto_218824 ?auto_218821 )
      ( DELIVER-5PKG-VERIFY ?auto_218822 ?auto_218823 ?auto_218824 ?auto_218825 ?auto_218826 ?auto_218821 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_218992 - OBJ
      ?auto_218993 - OBJ
      ?auto_218994 - OBJ
      ?auto_218995 - OBJ
      ?auto_218996 - OBJ
      ?auto_218991 - LOCATION
    )
    :vars
    (
      ?auto_219002 - LOCATION
      ?auto_219001 - CITY
      ?auto_218999 - LOCATION
      ?auto_219000 - LOCATION
      ?auto_218998 - LOCATION
      ?auto_218997 - LOCATION
      ?auto_219003 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219002 ?auto_219001 ) ( IN-CITY ?auto_218991 ?auto_219001 ) ( not ( = ?auto_218991 ?auto_219002 ) ) ( OBJ-AT ?auto_218994 ?auto_219002 ) ( IN-CITY ?auto_218999 ?auto_219001 ) ( not ( = ?auto_218991 ?auto_218999 ) ) ( OBJ-AT ?auto_218996 ?auto_218999 ) ( IN-CITY ?auto_219000 ?auto_219001 ) ( not ( = ?auto_218991 ?auto_219000 ) ) ( OBJ-AT ?auto_218992 ?auto_219000 ) ( IN-CITY ?auto_218998 ?auto_219001 ) ( not ( = ?auto_218991 ?auto_218998 ) ) ( OBJ-AT ?auto_218995 ?auto_218998 ) ( IN-CITY ?auto_218997 ?auto_219001 ) ( not ( = ?auto_218991 ?auto_218997 ) ) ( OBJ-AT ?auto_218993 ?auto_218997 ) ( TRUCK-AT ?auto_219003 ?auto_218991 ) ( not ( = ?auto_218993 ?auto_218995 ) ) ( not ( = ?auto_218998 ?auto_218997 ) ) ( not ( = ?auto_218993 ?auto_218992 ) ) ( not ( = ?auto_218995 ?auto_218992 ) ) ( not ( = ?auto_219000 ?auto_218998 ) ) ( not ( = ?auto_219000 ?auto_218997 ) ) ( not ( = ?auto_218993 ?auto_218996 ) ) ( not ( = ?auto_218995 ?auto_218996 ) ) ( not ( = ?auto_218992 ?auto_218996 ) ) ( not ( = ?auto_218999 ?auto_219000 ) ) ( not ( = ?auto_218999 ?auto_218998 ) ) ( not ( = ?auto_218999 ?auto_218997 ) ) ( not ( = ?auto_218993 ?auto_218994 ) ) ( not ( = ?auto_218995 ?auto_218994 ) ) ( not ( = ?auto_218992 ?auto_218994 ) ) ( not ( = ?auto_218996 ?auto_218994 ) ) ( not ( = ?auto_219002 ?auto_218999 ) ) ( not ( = ?auto_219002 ?auto_219000 ) ) ( not ( = ?auto_219002 ?auto_218998 ) ) ( not ( = ?auto_219002 ?auto_218997 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_218993 ?auto_218995 ?auto_218992 ?auto_218994 ?auto_218996 ?auto_218991 )
      ( DELIVER-5PKG-VERIFY ?auto_218992 ?auto_218993 ?auto_218994 ?auto_218995 ?auto_218996 ?auto_218991 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_219106 - OBJ
      ?auto_219107 - OBJ
      ?auto_219108 - OBJ
      ?auto_219109 - OBJ
      ?auto_219110 - OBJ
      ?auto_219105 - LOCATION
    )
    :vars
    (
      ?auto_219116 - LOCATION
      ?auto_219115 - CITY
      ?auto_219113 - LOCATION
      ?auto_219114 - LOCATION
      ?auto_219112 - LOCATION
      ?auto_219111 - LOCATION
      ?auto_219117 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219116 ?auto_219115 ) ( IN-CITY ?auto_219105 ?auto_219115 ) ( not ( = ?auto_219105 ?auto_219116 ) ) ( OBJ-AT ?auto_219108 ?auto_219116 ) ( IN-CITY ?auto_219113 ?auto_219115 ) ( not ( = ?auto_219105 ?auto_219113 ) ) ( OBJ-AT ?auto_219109 ?auto_219113 ) ( IN-CITY ?auto_219114 ?auto_219115 ) ( not ( = ?auto_219105 ?auto_219114 ) ) ( OBJ-AT ?auto_219106 ?auto_219114 ) ( IN-CITY ?auto_219112 ?auto_219115 ) ( not ( = ?auto_219105 ?auto_219112 ) ) ( OBJ-AT ?auto_219110 ?auto_219112 ) ( IN-CITY ?auto_219111 ?auto_219115 ) ( not ( = ?auto_219105 ?auto_219111 ) ) ( OBJ-AT ?auto_219107 ?auto_219111 ) ( TRUCK-AT ?auto_219117 ?auto_219105 ) ( not ( = ?auto_219107 ?auto_219110 ) ) ( not ( = ?auto_219112 ?auto_219111 ) ) ( not ( = ?auto_219107 ?auto_219106 ) ) ( not ( = ?auto_219110 ?auto_219106 ) ) ( not ( = ?auto_219114 ?auto_219112 ) ) ( not ( = ?auto_219114 ?auto_219111 ) ) ( not ( = ?auto_219107 ?auto_219109 ) ) ( not ( = ?auto_219110 ?auto_219109 ) ) ( not ( = ?auto_219106 ?auto_219109 ) ) ( not ( = ?auto_219113 ?auto_219114 ) ) ( not ( = ?auto_219113 ?auto_219112 ) ) ( not ( = ?auto_219113 ?auto_219111 ) ) ( not ( = ?auto_219107 ?auto_219108 ) ) ( not ( = ?auto_219110 ?auto_219108 ) ) ( not ( = ?auto_219106 ?auto_219108 ) ) ( not ( = ?auto_219109 ?auto_219108 ) ) ( not ( = ?auto_219116 ?auto_219113 ) ) ( not ( = ?auto_219116 ?auto_219114 ) ) ( not ( = ?auto_219116 ?auto_219112 ) ) ( not ( = ?auto_219116 ?auto_219111 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_219107 ?auto_219110 ?auto_219106 ?auto_219108 ?auto_219109 ?auto_219105 )
      ( DELIVER-5PKG-VERIFY ?auto_219106 ?auto_219107 ?auto_219108 ?auto_219109 ?auto_219110 ?auto_219105 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_219276 - OBJ
      ?auto_219277 - OBJ
      ?auto_219278 - OBJ
      ?auto_219279 - OBJ
      ?auto_219280 - OBJ
      ?auto_219275 - LOCATION
    )
    :vars
    (
      ?auto_219286 - LOCATION
      ?auto_219285 - CITY
      ?auto_219283 - LOCATION
      ?auto_219284 - LOCATION
      ?auto_219282 - LOCATION
      ?auto_219281 - LOCATION
      ?auto_219287 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219286 ?auto_219285 ) ( IN-CITY ?auto_219275 ?auto_219285 ) ( not ( = ?auto_219275 ?auto_219286 ) ) ( OBJ-AT ?auto_219280 ?auto_219286 ) ( IN-CITY ?auto_219283 ?auto_219285 ) ( not ( = ?auto_219275 ?auto_219283 ) ) ( OBJ-AT ?auto_219279 ?auto_219283 ) ( IN-CITY ?auto_219284 ?auto_219285 ) ( not ( = ?auto_219275 ?auto_219284 ) ) ( OBJ-AT ?auto_219276 ?auto_219284 ) ( IN-CITY ?auto_219282 ?auto_219285 ) ( not ( = ?auto_219275 ?auto_219282 ) ) ( OBJ-AT ?auto_219277 ?auto_219282 ) ( IN-CITY ?auto_219281 ?auto_219285 ) ( not ( = ?auto_219275 ?auto_219281 ) ) ( OBJ-AT ?auto_219278 ?auto_219281 ) ( TRUCK-AT ?auto_219287 ?auto_219275 ) ( not ( = ?auto_219278 ?auto_219277 ) ) ( not ( = ?auto_219282 ?auto_219281 ) ) ( not ( = ?auto_219278 ?auto_219276 ) ) ( not ( = ?auto_219277 ?auto_219276 ) ) ( not ( = ?auto_219284 ?auto_219282 ) ) ( not ( = ?auto_219284 ?auto_219281 ) ) ( not ( = ?auto_219278 ?auto_219279 ) ) ( not ( = ?auto_219277 ?auto_219279 ) ) ( not ( = ?auto_219276 ?auto_219279 ) ) ( not ( = ?auto_219283 ?auto_219284 ) ) ( not ( = ?auto_219283 ?auto_219282 ) ) ( not ( = ?auto_219283 ?auto_219281 ) ) ( not ( = ?auto_219278 ?auto_219280 ) ) ( not ( = ?auto_219277 ?auto_219280 ) ) ( not ( = ?auto_219276 ?auto_219280 ) ) ( not ( = ?auto_219279 ?auto_219280 ) ) ( not ( = ?auto_219286 ?auto_219283 ) ) ( not ( = ?auto_219286 ?auto_219284 ) ) ( not ( = ?auto_219286 ?auto_219282 ) ) ( not ( = ?auto_219286 ?auto_219281 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_219278 ?auto_219277 ?auto_219276 ?auto_219280 ?auto_219279 ?auto_219275 )
      ( DELIVER-5PKG-VERIFY ?auto_219276 ?auto_219277 ?auto_219278 ?auto_219279 ?auto_219280 ?auto_219275 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_219331 - OBJ
      ?auto_219332 - OBJ
      ?auto_219333 - OBJ
      ?auto_219334 - OBJ
      ?auto_219335 - OBJ
      ?auto_219330 - LOCATION
    )
    :vars
    (
      ?auto_219341 - LOCATION
      ?auto_219340 - CITY
      ?auto_219338 - LOCATION
      ?auto_219339 - LOCATION
      ?auto_219337 - LOCATION
      ?auto_219336 - LOCATION
      ?auto_219342 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219341 ?auto_219340 ) ( IN-CITY ?auto_219330 ?auto_219340 ) ( not ( = ?auto_219330 ?auto_219341 ) ) ( OBJ-AT ?auto_219334 ?auto_219341 ) ( IN-CITY ?auto_219338 ?auto_219340 ) ( not ( = ?auto_219330 ?auto_219338 ) ) ( OBJ-AT ?auto_219335 ?auto_219338 ) ( IN-CITY ?auto_219339 ?auto_219340 ) ( not ( = ?auto_219330 ?auto_219339 ) ) ( OBJ-AT ?auto_219331 ?auto_219339 ) ( IN-CITY ?auto_219337 ?auto_219340 ) ( not ( = ?auto_219330 ?auto_219337 ) ) ( OBJ-AT ?auto_219332 ?auto_219337 ) ( IN-CITY ?auto_219336 ?auto_219340 ) ( not ( = ?auto_219330 ?auto_219336 ) ) ( OBJ-AT ?auto_219333 ?auto_219336 ) ( TRUCK-AT ?auto_219342 ?auto_219330 ) ( not ( = ?auto_219333 ?auto_219332 ) ) ( not ( = ?auto_219337 ?auto_219336 ) ) ( not ( = ?auto_219333 ?auto_219331 ) ) ( not ( = ?auto_219332 ?auto_219331 ) ) ( not ( = ?auto_219339 ?auto_219337 ) ) ( not ( = ?auto_219339 ?auto_219336 ) ) ( not ( = ?auto_219333 ?auto_219335 ) ) ( not ( = ?auto_219332 ?auto_219335 ) ) ( not ( = ?auto_219331 ?auto_219335 ) ) ( not ( = ?auto_219338 ?auto_219339 ) ) ( not ( = ?auto_219338 ?auto_219337 ) ) ( not ( = ?auto_219338 ?auto_219336 ) ) ( not ( = ?auto_219333 ?auto_219334 ) ) ( not ( = ?auto_219332 ?auto_219334 ) ) ( not ( = ?auto_219331 ?auto_219334 ) ) ( not ( = ?auto_219335 ?auto_219334 ) ) ( not ( = ?auto_219341 ?auto_219338 ) ) ( not ( = ?auto_219341 ?auto_219339 ) ) ( not ( = ?auto_219341 ?auto_219337 ) ) ( not ( = ?auto_219341 ?auto_219336 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_219333 ?auto_219332 ?auto_219331 ?auto_219334 ?auto_219335 ?auto_219330 )
      ( DELIVER-5PKG-VERIFY ?auto_219331 ?auto_219332 ?auto_219333 ?auto_219334 ?auto_219335 ?auto_219330 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_219620 - OBJ
      ?auto_219621 - OBJ
      ?auto_219622 - OBJ
      ?auto_219623 - OBJ
      ?auto_219624 - OBJ
      ?auto_219619 - LOCATION
    )
    :vars
    (
      ?auto_219630 - LOCATION
      ?auto_219629 - CITY
      ?auto_219627 - LOCATION
      ?auto_219628 - LOCATION
      ?auto_219626 - LOCATION
      ?auto_219625 - LOCATION
      ?auto_219631 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219630 ?auto_219629 ) ( IN-CITY ?auto_219619 ?auto_219629 ) ( not ( = ?auto_219619 ?auto_219630 ) ) ( OBJ-AT ?auto_219624 ?auto_219630 ) ( IN-CITY ?auto_219627 ?auto_219629 ) ( not ( = ?auto_219619 ?auto_219627 ) ) ( OBJ-AT ?auto_219622 ?auto_219627 ) ( IN-CITY ?auto_219628 ?auto_219629 ) ( not ( = ?auto_219619 ?auto_219628 ) ) ( OBJ-AT ?auto_219620 ?auto_219628 ) ( IN-CITY ?auto_219626 ?auto_219629 ) ( not ( = ?auto_219619 ?auto_219626 ) ) ( OBJ-AT ?auto_219621 ?auto_219626 ) ( IN-CITY ?auto_219625 ?auto_219629 ) ( not ( = ?auto_219619 ?auto_219625 ) ) ( OBJ-AT ?auto_219623 ?auto_219625 ) ( TRUCK-AT ?auto_219631 ?auto_219619 ) ( not ( = ?auto_219623 ?auto_219621 ) ) ( not ( = ?auto_219626 ?auto_219625 ) ) ( not ( = ?auto_219623 ?auto_219620 ) ) ( not ( = ?auto_219621 ?auto_219620 ) ) ( not ( = ?auto_219628 ?auto_219626 ) ) ( not ( = ?auto_219628 ?auto_219625 ) ) ( not ( = ?auto_219623 ?auto_219622 ) ) ( not ( = ?auto_219621 ?auto_219622 ) ) ( not ( = ?auto_219620 ?auto_219622 ) ) ( not ( = ?auto_219627 ?auto_219628 ) ) ( not ( = ?auto_219627 ?auto_219626 ) ) ( not ( = ?auto_219627 ?auto_219625 ) ) ( not ( = ?auto_219623 ?auto_219624 ) ) ( not ( = ?auto_219621 ?auto_219624 ) ) ( not ( = ?auto_219620 ?auto_219624 ) ) ( not ( = ?auto_219622 ?auto_219624 ) ) ( not ( = ?auto_219630 ?auto_219627 ) ) ( not ( = ?auto_219630 ?auto_219628 ) ) ( not ( = ?auto_219630 ?auto_219626 ) ) ( not ( = ?auto_219630 ?auto_219625 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_219623 ?auto_219621 ?auto_219620 ?auto_219624 ?auto_219622 ?auto_219619 )
      ( DELIVER-5PKG-VERIFY ?auto_219620 ?auto_219621 ?auto_219622 ?auto_219623 ?auto_219624 ?auto_219619 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_219675 - OBJ
      ?auto_219676 - OBJ
      ?auto_219677 - OBJ
      ?auto_219678 - OBJ
      ?auto_219679 - OBJ
      ?auto_219674 - LOCATION
    )
    :vars
    (
      ?auto_219685 - LOCATION
      ?auto_219684 - CITY
      ?auto_219682 - LOCATION
      ?auto_219683 - LOCATION
      ?auto_219681 - LOCATION
      ?auto_219680 - LOCATION
      ?auto_219686 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219685 ?auto_219684 ) ( IN-CITY ?auto_219674 ?auto_219684 ) ( not ( = ?auto_219674 ?auto_219685 ) ) ( OBJ-AT ?auto_219678 ?auto_219685 ) ( IN-CITY ?auto_219682 ?auto_219684 ) ( not ( = ?auto_219674 ?auto_219682 ) ) ( OBJ-AT ?auto_219677 ?auto_219682 ) ( IN-CITY ?auto_219683 ?auto_219684 ) ( not ( = ?auto_219674 ?auto_219683 ) ) ( OBJ-AT ?auto_219675 ?auto_219683 ) ( IN-CITY ?auto_219681 ?auto_219684 ) ( not ( = ?auto_219674 ?auto_219681 ) ) ( OBJ-AT ?auto_219676 ?auto_219681 ) ( IN-CITY ?auto_219680 ?auto_219684 ) ( not ( = ?auto_219674 ?auto_219680 ) ) ( OBJ-AT ?auto_219679 ?auto_219680 ) ( TRUCK-AT ?auto_219686 ?auto_219674 ) ( not ( = ?auto_219679 ?auto_219676 ) ) ( not ( = ?auto_219681 ?auto_219680 ) ) ( not ( = ?auto_219679 ?auto_219675 ) ) ( not ( = ?auto_219676 ?auto_219675 ) ) ( not ( = ?auto_219683 ?auto_219681 ) ) ( not ( = ?auto_219683 ?auto_219680 ) ) ( not ( = ?auto_219679 ?auto_219677 ) ) ( not ( = ?auto_219676 ?auto_219677 ) ) ( not ( = ?auto_219675 ?auto_219677 ) ) ( not ( = ?auto_219682 ?auto_219683 ) ) ( not ( = ?auto_219682 ?auto_219681 ) ) ( not ( = ?auto_219682 ?auto_219680 ) ) ( not ( = ?auto_219679 ?auto_219678 ) ) ( not ( = ?auto_219676 ?auto_219678 ) ) ( not ( = ?auto_219675 ?auto_219678 ) ) ( not ( = ?auto_219677 ?auto_219678 ) ) ( not ( = ?auto_219685 ?auto_219682 ) ) ( not ( = ?auto_219685 ?auto_219683 ) ) ( not ( = ?auto_219685 ?auto_219681 ) ) ( not ( = ?auto_219685 ?auto_219680 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_219679 ?auto_219676 ?auto_219675 ?auto_219678 ?auto_219677 ?auto_219674 )
      ( DELIVER-5PKG-VERIFY ?auto_219675 ?auto_219676 ?auto_219677 ?auto_219678 ?auto_219679 ?auto_219674 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_219786 - OBJ
      ?auto_219787 - OBJ
      ?auto_219788 - OBJ
      ?auto_219789 - OBJ
      ?auto_219790 - OBJ
      ?auto_219785 - LOCATION
    )
    :vars
    (
      ?auto_219796 - LOCATION
      ?auto_219795 - CITY
      ?auto_219793 - LOCATION
      ?auto_219794 - LOCATION
      ?auto_219792 - LOCATION
      ?auto_219791 - LOCATION
      ?auto_219797 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219796 ?auto_219795 ) ( IN-CITY ?auto_219785 ?auto_219795 ) ( not ( = ?auto_219785 ?auto_219796 ) ) ( OBJ-AT ?auto_219788 ?auto_219796 ) ( IN-CITY ?auto_219793 ?auto_219795 ) ( not ( = ?auto_219785 ?auto_219793 ) ) ( OBJ-AT ?auto_219790 ?auto_219793 ) ( IN-CITY ?auto_219794 ?auto_219795 ) ( not ( = ?auto_219785 ?auto_219794 ) ) ( OBJ-AT ?auto_219786 ?auto_219794 ) ( IN-CITY ?auto_219792 ?auto_219795 ) ( not ( = ?auto_219785 ?auto_219792 ) ) ( OBJ-AT ?auto_219787 ?auto_219792 ) ( IN-CITY ?auto_219791 ?auto_219795 ) ( not ( = ?auto_219785 ?auto_219791 ) ) ( OBJ-AT ?auto_219789 ?auto_219791 ) ( TRUCK-AT ?auto_219797 ?auto_219785 ) ( not ( = ?auto_219789 ?auto_219787 ) ) ( not ( = ?auto_219792 ?auto_219791 ) ) ( not ( = ?auto_219789 ?auto_219786 ) ) ( not ( = ?auto_219787 ?auto_219786 ) ) ( not ( = ?auto_219794 ?auto_219792 ) ) ( not ( = ?auto_219794 ?auto_219791 ) ) ( not ( = ?auto_219789 ?auto_219790 ) ) ( not ( = ?auto_219787 ?auto_219790 ) ) ( not ( = ?auto_219786 ?auto_219790 ) ) ( not ( = ?auto_219793 ?auto_219794 ) ) ( not ( = ?auto_219793 ?auto_219792 ) ) ( not ( = ?auto_219793 ?auto_219791 ) ) ( not ( = ?auto_219789 ?auto_219788 ) ) ( not ( = ?auto_219787 ?auto_219788 ) ) ( not ( = ?auto_219786 ?auto_219788 ) ) ( not ( = ?auto_219790 ?auto_219788 ) ) ( not ( = ?auto_219796 ?auto_219793 ) ) ( not ( = ?auto_219796 ?auto_219794 ) ) ( not ( = ?auto_219796 ?auto_219792 ) ) ( not ( = ?auto_219796 ?auto_219791 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_219789 ?auto_219787 ?auto_219786 ?auto_219788 ?auto_219790 ?auto_219785 )
      ( DELIVER-5PKG-VERIFY ?auto_219786 ?auto_219787 ?auto_219788 ?auto_219789 ?auto_219790 ?auto_219785 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_219959 - OBJ
      ?auto_219960 - OBJ
      ?auto_219961 - OBJ
      ?auto_219962 - OBJ
      ?auto_219963 - OBJ
      ?auto_219958 - LOCATION
    )
    :vars
    (
      ?auto_219969 - LOCATION
      ?auto_219968 - CITY
      ?auto_219966 - LOCATION
      ?auto_219967 - LOCATION
      ?auto_219965 - LOCATION
      ?auto_219964 - LOCATION
      ?auto_219970 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219969 ?auto_219968 ) ( IN-CITY ?auto_219958 ?auto_219968 ) ( not ( = ?auto_219958 ?auto_219969 ) ) ( OBJ-AT ?auto_219961 ?auto_219969 ) ( IN-CITY ?auto_219966 ?auto_219968 ) ( not ( = ?auto_219958 ?auto_219966 ) ) ( OBJ-AT ?auto_219962 ?auto_219966 ) ( IN-CITY ?auto_219967 ?auto_219968 ) ( not ( = ?auto_219958 ?auto_219967 ) ) ( OBJ-AT ?auto_219959 ?auto_219967 ) ( IN-CITY ?auto_219965 ?auto_219968 ) ( not ( = ?auto_219958 ?auto_219965 ) ) ( OBJ-AT ?auto_219960 ?auto_219965 ) ( IN-CITY ?auto_219964 ?auto_219968 ) ( not ( = ?auto_219958 ?auto_219964 ) ) ( OBJ-AT ?auto_219963 ?auto_219964 ) ( TRUCK-AT ?auto_219970 ?auto_219958 ) ( not ( = ?auto_219963 ?auto_219960 ) ) ( not ( = ?auto_219965 ?auto_219964 ) ) ( not ( = ?auto_219963 ?auto_219959 ) ) ( not ( = ?auto_219960 ?auto_219959 ) ) ( not ( = ?auto_219967 ?auto_219965 ) ) ( not ( = ?auto_219967 ?auto_219964 ) ) ( not ( = ?auto_219963 ?auto_219962 ) ) ( not ( = ?auto_219960 ?auto_219962 ) ) ( not ( = ?auto_219959 ?auto_219962 ) ) ( not ( = ?auto_219966 ?auto_219967 ) ) ( not ( = ?auto_219966 ?auto_219965 ) ) ( not ( = ?auto_219966 ?auto_219964 ) ) ( not ( = ?auto_219963 ?auto_219961 ) ) ( not ( = ?auto_219960 ?auto_219961 ) ) ( not ( = ?auto_219959 ?auto_219961 ) ) ( not ( = ?auto_219962 ?auto_219961 ) ) ( not ( = ?auto_219969 ?auto_219966 ) ) ( not ( = ?auto_219969 ?auto_219967 ) ) ( not ( = ?auto_219969 ?auto_219965 ) ) ( not ( = ?auto_219969 ?auto_219964 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_219963 ?auto_219960 ?auto_219959 ?auto_219961 ?auto_219962 ?auto_219958 )
      ( DELIVER-5PKG-VERIFY ?auto_219959 ?auto_219960 ?auto_219961 ?auto_219962 ?auto_219963 ?auto_219958 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_221019 - OBJ
      ?auto_221020 - OBJ
      ?auto_221021 - OBJ
      ?auto_221022 - OBJ
      ?auto_221023 - OBJ
      ?auto_221018 - LOCATION
    )
    :vars
    (
      ?auto_221029 - LOCATION
      ?auto_221028 - CITY
      ?auto_221026 - LOCATION
      ?auto_221027 - LOCATION
      ?auto_221025 - LOCATION
      ?auto_221024 - LOCATION
      ?auto_221030 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_221029 ?auto_221028 ) ( IN-CITY ?auto_221018 ?auto_221028 ) ( not ( = ?auto_221018 ?auto_221029 ) ) ( OBJ-AT ?auto_221023 ?auto_221029 ) ( IN-CITY ?auto_221026 ?auto_221028 ) ( not ( = ?auto_221018 ?auto_221026 ) ) ( OBJ-AT ?auto_221020 ?auto_221026 ) ( IN-CITY ?auto_221027 ?auto_221028 ) ( not ( = ?auto_221018 ?auto_221027 ) ) ( OBJ-AT ?auto_221019 ?auto_221027 ) ( IN-CITY ?auto_221025 ?auto_221028 ) ( not ( = ?auto_221018 ?auto_221025 ) ) ( OBJ-AT ?auto_221022 ?auto_221025 ) ( IN-CITY ?auto_221024 ?auto_221028 ) ( not ( = ?auto_221018 ?auto_221024 ) ) ( OBJ-AT ?auto_221021 ?auto_221024 ) ( TRUCK-AT ?auto_221030 ?auto_221018 ) ( not ( = ?auto_221021 ?auto_221022 ) ) ( not ( = ?auto_221025 ?auto_221024 ) ) ( not ( = ?auto_221021 ?auto_221019 ) ) ( not ( = ?auto_221022 ?auto_221019 ) ) ( not ( = ?auto_221027 ?auto_221025 ) ) ( not ( = ?auto_221027 ?auto_221024 ) ) ( not ( = ?auto_221021 ?auto_221020 ) ) ( not ( = ?auto_221022 ?auto_221020 ) ) ( not ( = ?auto_221019 ?auto_221020 ) ) ( not ( = ?auto_221026 ?auto_221027 ) ) ( not ( = ?auto_221026 ?auto_221025 ) ) ( not ( = ?auto_221026 ?auto_221024 ) ) ( not ( = ?auto_221021 ?auto_221023 ) ) ( not ( = ?auto_221022 ?auto_221023 ) ) ( not ( = ?auto_221019 ?auto_221023 ) ) ( not ( = ?auto_221020 ?auto_221023 ) ) ( not ( = ?auto_221029 ?auto_221026 ) ) ( not ( = ?auto_221029 ?auto_221027 ) ) ( not ( = ?auto_221029 ?auto_221025 ) ) ( not ( = ?auto_221029 ?auto_221024 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_221021 ?auto_221022 ?auto_221019 ?auto_221023 ?auto_221020 ?auto_221018 )
      ( DELIVER-5PKG-VERIFY ?auto_221019 ?auto_221020 ?auto_221021 ?auto_221022 ?auto_221023 ?auto_221018 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_221074 - OBJ
      ?auto_221075 - OBJ
      ?auto_221076 - OBJ
      ?auto_221077 - OBJ
      ?auto_221078 - OBJ
      ?auto_221073 - LOCATION
    )
    :vars
    (
      ?auto_221084 - LOCATION
      ?auto_221083 - CITY
      ?auto_221081 - LOCATION
      ?auto_221082 - LOCATION
      ?auto_221080 - LOCATION
      ?auto_221079 - LOCATION
      ?auto_221085 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_221084 ?auto_221083 ) ( IN-CITY ?auto_221073 ?auto_221083 ) ( not ( = ?auto_221073 ?auto_221084 ) ) ( OBJ-AT ?auto_221077 ?auto_221084 ) ( IN-CITY ?auto_221081 ?auto_221083 ) ( not ( = ?auto_221073 ?auto_221081 ) ) ( OBJ-AT ?auto_221075 ?auto_221081 ) ( IN-CITY ?auto_221082 ?auto_221083 ) ( not ( = ?auto_221073 ?auto_221082 ) ) ( OBJ-AT ?auto_221074 ?auto_221082 ) ( IN-CITY ?auto_221080 ?auto_221083 ) ( not ( = ?auto_221073 ?auto_221080 ) ) ( OBJ-AT ?auto_221078 ?auto_221080 ) ( IN-CITY ?auto_221079 ?auto_221083 ) ( not ( = ?auto_221073 ?auto_221079 ) ) ( OBJ-AT ?auto_221076 ?auto_221079 ) ( TRUCK-AT ?auto_221085 ?auto_221073 ) ( not ( = ?auto_221076 ?auto_221078 ) ) ( not ( = ?auto_221080 ?auto_221079 ) ) ( not ( = ?auto_221076 ?auto_221074 ) ) ( not ( = ?auto_221078 ?auto_221074 ) ) ( not ( = ?auto_221082 ?auto_221080 ) ) ( not ( = ?auto_221082 ?auto_221079 ) ) ( not ( = ?auto_221076 ?auto_221075 ) ) ( not ( = ?auto_221078 ?auto_221075 ) ) ( not ( = ?auto_221074 ?auto_221075 ) ) ( not ( = ?auto_221081 ?auto_221082 ) ) ( not ( = ?auto_221081 ?auto_221080 ) ) ( not ( = ?auto_221081 ?auto_221079 ) ) ( not ( = ?auto_221076 ?auto_221077 ) ) ( not ( = ?auto_221078 ?auto_221077 ) ) ( not ( = ?auto_221074 ?auto_221077 ) ) ( not ( = ?auto_221075 ?auto_221077 ) ) ( not ( = ?auto_221084 ?auto_221081 ) ) ( not ( = ?auto_221084 ?auto_221082 ) ) ( not ( = ?auto_221084 ?auto_221080 ) ) ( not ( = ?auto_221084 ?auto_221079 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_221076 ?auto_221078 ?auto_221074 ?auto_221077 ?auto_221075 ?auto_221073 )
      ( DELIVER-5PKG-VERIFY ?auto_221074 ?auto_221075 ?auto_221076 ?auto_221077 ?auto_221078 ?auto_221073 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_221129 - OBJ
      ?auto_221130 - OBJ
      ?auto_221131 - OBJ
      ?auto_221132 - OBJ
      ?auto_221133 - OBJ
      ?auto_221128 - LOCATION
    )
    :vars
    (
      ?auto_221139 - LOCATION
      ?auto_221138 - CITY
      ?auto_221136 - LOCATION
      ?auto_221137 - LOCATION
      ?auto_221135 - LOCATION
      ?auto_221134 - LOCATION
      ?auto_221140 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_221139 ?auto_221138 ) ( IN-CITY ?auto_221128 ?auto_221138 ) ( not ( = ?auto_221128 ?auto_221139 ) ) ( OBJ-AT ?auto_221133 ?auto_221139 ) ( IN-CITY ?auto_221136 ?auto_221138 ) ( not ( = ?auto_221128 ?auto_221136 ) ) ( OBJ-AT ?auto_221130 ?auto_221136 ) ( IN-CITY ?auto_221137 ?auto_221138 ) ( not ( = ?auto_221128 ?auto_221137 ) ) ( OBJ-AT ?auto_221129 ?auto_221137 ) ( IN-CITY ?auto_221135 ?auto_221138 ) ( not ( = ?auto_221128 ?auto_221135 ) ) ( OBJ-AT ?auto_221131 ?auto_221135 ) ( IN-CITY ?auto_221134 ?auto_221138 ) ( not ( = ?auto_221128 ?auto_221134 ) ) ( OBJ-AT ?auto_221132 ?auto_221134 ) ( TRUCK-AT ?auto_221140 ?auto_221128 ) ( not ( = ?auto_221132 ?auto_221131 ) ) ( not ( = ?auto_221135 ?auto_221134 ) ) ( not ( = ?auto_221132 ?auto_221129 ) ) ( not ( = ?auto_221131 ?auto_221129 ) ) ( not ( = ?auto_221137 ?auto_221135 ) ) ( not ( = ?auto_221137 ?auto_221134 ) ) ( not ( = ?auto_221132 ?auto_221130 ) ) ( not ( = ?auto_221131 ?auto_221130 ) ) ( not ( = ?auto_221129 ?auto_221130 ) ) ( not ( = ?auto_221136 ?auto_221137 ) ) ( not ( = ?auto_221136 ?auto_221135 ) ) ( not ( = ?auto_221136 ?auto_221134 ) ) ( not ( = ?auto_221132 ?auto_221133 ) ) ( not ( = ?auto_221131 ?auto_221133 ) ) ( not ( = ?auto_221129 ?auto_221133 ) ) ( not ( = ?auto_221130 ?auto_221133 ) ) ( not ( = ?auto_221139 ?auto_221136 ) ) ( not ( = ?auto_221139 ?auto_221137 ) ) ( not ( = ?auto_221139 ?auto_221135 ) ) ( not ( = ?auto_221139 ?auto_221134 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_221132 ?auto_221131 ?auto_221129 ?auto_221133 ?auto_221130 ?auto_221128 )
      ( DELIVER-5PKG-VERIFY ?auto_221129 ?auto_221130 ?auto_221131 ?auto_221132 ?auto_221133 ?auto_221128 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_221184 - OBJ
      ?auto_221185 - OBJ
      ?auto_221186 - OBJ
      ?auto_221187 - OBJ
      ?auto_221188 - OBJ
      ?auto_221183 - LOCATION
    )
    :vars
    (
      ?auto_221194 - LOCATION
      ?auto_221193 - CITY
      ?auto_221191 - LOCATION
      ?auto_221192 - LOCATION
      ?auto_221190 - LOCATION
      ?auto_221189 - LOCATION
      ?auto_221195 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_221194 ?auto_221193 ) ( IN-CITY ?auto_221183 ?auto_221193 ) ( not ( = ?auto_221183 ?auto_221194 ) ) ( OBJ-AT ?auto_221187 ?auto_221194 ) ( IN-CITY ?auto_221191 ?auto_221193 ) ( not ( = ?auto_221183 ?auto_221191 ) ) ( OBJ-AT ?auto_221185 ?auto_221191 ) ( IN-CITY ?auto_221192 ?auto_221193 ) ( not ( = ?auto_221183 ?auto_221192 ) ) ( OBJ-AT ?auto_221184 ?auto_221192 ) ( IN-CITY ?auto_221190 ?auto_221193 ) ( not ( = ?auto_221183 ?auto_221190 ) ) ( OBJ-AT ?auto_221186 ?auto_221190 ) ( IN-CITY ?auto_221189 ?auto_221193 ) ( not ( = ?auto_221183 ?auto_221189 ) ) ( OBJ-AT ?auto_221188 ?auto_221189 ) ( TRUCK-AT ?auto_221195 ?auto_221183 ) ( not ( = ?auto_221188 ?auto_221186 ) ) ( not ( = ?auto_221190 ?auto_221189 ) ) ( not ( = ?auto_221188 ?auto_221184 ) ) ( not ( = ?auto_221186 ?auto_221184 ) ) ( not ( = ?auto_221192 ?auto_221190 ) ) ( not ( = ?auto_221192 ?auto_221189 ) ) ( not ( = ?auto_221188 ?auto_221185 ) ) ( not ( = ?auto_221186 ?auto_221185 ) ) ( not ( = ?auto_221184 ?auto_221185 ) ) ( not ( = ?auto_221191 ?auto_221192 ) ) ( not ( = ?auto_221191 ?auto_221190 ) ) ( not ( = ?auto_221191 ?auto_221189 ) ) ( not ( = ?auto_221188 ?auto_221187 ) ) ( not ( = ?auto_221186 ?auto_221187 ) ) ( not ( = ?auto_221184 ?auto_221187 ) ) ( not ( = ?auto_221185 ?auto_221187 ) ) ( not ( = ?auto_221194 ?auto_221191 ) ) ( not ( = ?auto_221194 ?auto_221192 ) ) ( not ( = ?auto_221194 ?auto_221190 ) ) ( not ( = ?auto_221194 ?auto_221189 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_221188 ?auto_221186 ?auto_221184 ?auto_221187 ?auto_221185 ?auto_221183 )
      ( DELIVER-5PKG-VERIFY ?auto_221184 ?auto_221185 ?auto_221186 ?auto_221187 ?auto_221188 ?auto_221183 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_221529 - OBJ
      ?auto_221530 - OBJ
      ?auto_221531 - OBJ
      ?auto_221532 - OBJ
      ?auto_221533 - OBJ
      ?auto_221528 - LOCATION
    )
    :vars
    (
      ?auto_221539 - LOCATION
      ?auto_221538 - CITY
      ?auto_221536 - LOCATION
      ?auto_221537 - LOCATION
      ?auto_221535 - LOCATION
      ?auto_221534 - LOCATION
      ?auto_221540 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_221539 ?auto_221538 ) ( IN-CITY ?auto_221528 ?auto_221538 ) ( not ( = ?auto_221528 ?auto_221539 ) ) ( OBJ-AT ?auto_221531 ?auto_221539 ) ( IN-CITY ?auto_221536 ?auto_221538 ) ( not ( = ?auto_221528 ?auto_221536 ) ) ( OBJ-AT ?auto_221530 ?auto_221536 ) ( IN-CITY ?auto_221537 ?auto_221538 ) ( not ( = ?auto_221528 ?auto_221537 ) ) ( OBJ-AT ?auto_221529 ?auto_221537 ) ( IN-CITY ?auto_221535 ?auto_221538 ) ( not ( = ?auto_221528 ?auto_221535 ) ) ( OBJ-AT ?auto_221533 ?auto_221535 ) ( IN-CITY ?auto_221534 ?auto_221538 ) ( not ( = ?auto_221528 ?auto_221534 ) ) ( OBJ-AT ?auto_221532 ?auto_221534 ) ( TRUCK-AT ?auto_221540 ?auto_221528 ) ( not ( = ?auto_221532 ?auto_221533 ) ) ( not ( = ?auto_221535 ?auto_221534 ) ) ( not ( = ?auto_221532 ?auto_221529 ) ) ( not ( = ?auto_221533 ?auto_221529 ) ) ( not ( = ?auto_221537 ?auto_221535 ) ) ( not ( = ?auto_221537 ?auto_221534 ) ) ( not ( = ?auto_221532 ?auto_221530 ) ) ( not ( = ?auto_221533 ?auto_221530 ) ) ( not ( = ?auto_221529 ?auto_221530 ) ) ( not ( = ?auto_221536 ?auto_221537 ) ) ( not ( = ?auto_221536 ?auto_221535 ) ) ( not ( = ?auto_221536 ?auto_221534 ) ) ( not ( = ?auto_221532 ?auto_221531 ) ) ( not ( = ?auto_221533 ?auto_221531 ) ) ( not ( = ?auto_221529 ?auto_221531 ) ) ( not ( = ?auto_221530 ?auto_221531 ) ) ( not ( = ?auto_221539 ?auto_221536 ) ) ( not ( = ?auto_221539 ?auto_221537 ) ) ( not ( = ?auto_221539 ?auto_221535 ) ) ( not ( = ?auto_221539 ?auto_221534 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_221532 ?auto_221533 ?auto_221529 ?auto_221531 ?auto_221530 ?auto_221528 )
      ( DELIVER-5PKG-VERIFY ?auto_221529 ?auto_221530 ?auto_221531 ?auto_221532 ?auto_221533 ?auto_221528 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_221584 - OBJ
      ?auto_221585 - OBJ
      ?auto_221586 - OBJ
      ?auto_221587 - OBJ
      ?auto_221588 - OBJ
      ?auto_221583 - LOCATION
    )
    :vars
    (
      ?auto_221594 - LOCATION
      ?auto_221593 - CITY
      ?auto_221591 - LOCATION
      ?auto_221592 - LOCATION
      ?auto_221590 - LOCATION
      ?auto_221589 - LOCATION
      ?auto_221595 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_221594 ?auto_221593 ) ( IN-CITY ?auto_221583 ?auto_221593 ) ( not ( = ?auto_221583 ?auto_221594 ) ) ( OBJ-AT ?auto_221586 ?auto_221594 ) ( IN-CITY ?auto_221591 ?auto_221593 ) ( not ( = ?auto_221583 ?auto_221591 ) ) ( OBJ-AT ?auto_221585 ?auto_221591 ) ( IN-CITY ?auto_221592 ?auto_221593 ) ( not ( = ?auto_221583 ?auto_221592 ) ) ( OBJ-AT ?auto_221584 ?auto_221592 ) ( IN-CITY ?auto_221590 ?auto_221593 ) ( not ( = ?auto_221583 ?auto_221590 ) ) ( OBJ-AT ?auto_221587 ?auto_221590 ) ( IN-CITY ?auto_221589 ?auto_221593 ) ( not ( = ?auto_221583 ?auto_221589 ) ) ( OBJ-AT ?auto_221588 ?auto_221589 ) ( TRUCK-AT ?auto_221595 ?auto_221583 ) ( not ( = ?auto_221588 ?auto_221587 ) ) ( not ( = ?auto_221590 ?auto_221589 ) ) ( not ( = ?auto_221588 ?auto_221584 ) ) ( not ( = ?auto_221587 ?auto_221584 ) ) ( not ( = ?auto_221592 ?auto_221590 ) ) ( not ( = ?auto_221592 ?auto_221589 ) ) ( not ( = ?auto_221588 ?auto_221585 ) ) ( not ( = ?auto_221587 ?auto_221585 ) ) ( not ( = ?auto_221584 ?auto_221585 ) ) ( not ( = ?auto_221591 ?auto_221592 ) ) ( not ( = ?auto_221591 ?auto_221590 ) ) ( not ( = ?auto_221591 ?auto_221589 ) ) ( not ( = ?auto_221588 ?auto_221586 ) ) ( not ( = ?auto_221587 ?auto_221586 ) ) ( not ( = ?auto_221584 ?auto_221586 ) ) ( not ( = ?auto_221585 ?auto_221586 ) ) ( not ( = ?auto_221594 ?auto_221591 ) ) ( not ( = ?auto_221594 ?auto_221592 ) ) ( not ( = ?auto_221594 ?auto_221590 ) ) ( not ( = ?auto_221594 ?auto_221589 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_221588 ?auto_221587 ?auto_221584 ?auto_221586 ?auto_221585 ?auto_221583 )
      ( DELIVER-5PKG-VERIFY ?auto_221584 ?auto_221585 ?auto_221586 ?auto_221587 ?auto_221588 ?auto_221583 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_221987 - OBJ
      ?auto_221988 - OBJ
      ?auto_221989 - OBJ
      ?auto_221990 - OBJ
      ?auto_221991 - OBJ
      ?auto_221986 - LOCATION
    )
    :vars
    (
      ?auto_221997 - LOCATION
      ?auto_221996 - CITY
      ?auto_221994 - LOCATION
      ?auto_221995 - LOCATION
      ?auto_221993 - LOCATION
      ?auto_221992 - LOCATION
      ?auto_221998 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_221997 ?auto_221996 ) ( IN-CITY ?auto_221986 ?auto_221996 ) ( not ( = ?auto_221986 ?auto_221997 ) ) ( OBJ-AT ?auto_221988 ?auto_221997 ) ( IN-CITY ?auto_221994 ?auto_221996 ) ( not ( = ?auto_221986 ?auto_221994 ) ) ( OBJ-AT ?auto_221991 ?auto_221994 ) ( IN-CITY ?auto_221995 ?auto_221996 ) ( not ( = ?auto_221986 ?auto_221995 ) ) ( OBJ-AT ?auto_221987 ?auto_221995 ) ( IN-CITY ?auto_221993 ?auto_221996 ) ( not ( = ?auto_221986 ?auto_221993 ) ) ( OBJ-AT ?auto_221990 ?auto_221993 ) ( IN-CITY ?auto_221992 ?auto_221996 ) ( not ( = ?auto_221986 ?auto_221992 ) ) ( OBJ-AT ?auto_221989 ?auto_221992 ) ( TRUCK-AT ?auto_221998 ?auto_221986 ) ( not ( = ?auto_221989 ?auto_221990 ) ) ( not ( = ?auto_221993 ?auto_221992 ) ) ( not ( = ?auto_221989 ?auto_221987 ) ) ( not ( = ?auto_221990 ?auto_221987 ) ) ( not ( = ?auto_221995 ?auto_221993 ) ) ( not ( = ?auto_221995 ?auto_221992 ) ) ( not ( = ?auto_221989 ?auto_221991 ) ) ( not ( = ?auto_221990 ?auto_221991 ) ) ( not ( = ?auto_221987 ?auto_221991 ) ) ( not ( = ?auto_221994 ?auto_221995 ) ) ( not ( = ?auto_221994 ?auto_221993 ) ) ( not ( = ?auto_221994 ?auto_221992 ) ) ( not ( = ?auto_221989 ?auto_221988 ) ) ( not ( = ?auto_221990 ?auto_221988 ) ) ( not ( = ?auto_221987 ?auto_221988 ) ) ( not ( = ?auto_221991 ?auto_221988 ) ) ( not ( = ?auto_221997 ?auto_221994 ) ) ( not ( = ?auto_221997 ?auto_221995 ) ) ( not ( = ?auto_221997 ?auto_221993 ) ) ( not ( = ?auto_221997 ?auto_221992 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_221989 ?auto_221990 ?auto_221987 ?auto_221988 ?auto_221991 ?auto_221986 )
      ( DELIVER-5PKG-VERIFY ?auto_221987 ?auto_221988 ?auto_221989 ?auto_221990 ?auto_221991 ?auto_221986 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_222101 - OBJ
      ?auto_222102 - OBJ
      ?auto_222103 - OBJ
      ?auto_222104 - OBJ
      ?auto_222105 - OBJ
      ?auto_222100 - LOCATION
    )
    :vars
    (
      ?auto_222111 - LOCATION
      ?auto_222110 - CITY
      ?auto_222108 - LOCATION
      ?auto_222109 - LOCATION
      ?auto_222107 - LOCATION
      ?auto_222106 - LOCATION
      ?auto_222112 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_222111 ?auto_222110 ) ( IN-CITY ?auto_222100 ?auto_222110 ) ( not ( = ?auto_222100 ?auto_222111 ) ) ( OBJ-AT ?auto_222102 ?auto_222111 ) ( IN-CITY ?auto_222108 ?auto_222110 ) ( not ( = ?auto_222100 ?auto_222108 ) ) ( OBJ-AT ?auto_222104 ?auto_222108 ) ( IN-CITY ?auto_222109 ?auto_222110 ) ( not ( = ?auto_222100 ?auto_222109 ) ) ( OBJ-AT ?auto_222101 ?auto_222109 ) ( IN-CITY ?auto_222107 ?auto_222110 ) ( not ( = ?auto_222100 ?auto_222107 ) ) ( OBJ-AT ?auto_222105 ?auto_222107 ) ( IN-CITY ?auto_222106 ?auto_222110 ) ( not ( = ?auto_222100 ?auto_222106 ) ) ( OBJ-AT ?auto_222103 ?auto_222106 ) ( TRUCK-AT ?auto_222112 ?auto_222100 ) ( not ( = ?auto_222103 ?auto_222105 ) ) ( not ( = ?auto_222107 ?auto_222106 ) ) ( not ( = ?auto_222103 ?auto_222101 ) ) ( not ( = ?auto_222105 ?auto_222101 ) ) ( not ( = ?auto_222109 ?auto_222107 ) ) ( not ( = ?auto_222109 ?auto_222106 ) ) ( not ( = ?auto_222103 ?auto_222104 ) ) ( not ( = ?auto_222105 ?auto_222104 ) ) ( not ( = ?auto_222101 ?auto_222104 ) ) ( not ( = ?auto_222108 ?auto_222109 ) ) ( not ( = ?auto_222108 ?auto_222107 ) ) ( not ( = ?auto_222108 ?auto_222106 ) ) ( not ( = ?auto_222103 ?auto_222102 ) ) ( not ( = ?auto_222105 ?auto_222102 ) ) ( not ( = ?auto_222101 ?auto_222102 ) ) ( not ( = ?auto_222104 ?auto_222102 ) ) ( not ( = ?auto_222111 ?auto_222108 ) ) ( not ( = ?auto_222111 ?auto_222109 ) ) ( not ( = ?auto_222111 ?auto_222107 ) ) ( not ( = ?auto_222111 ?auto_222106 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_222103 ?auto_222105 ?auto_222101 ?auto_222102 ?auto_222104 ?auto_222100 )
      ( DELIVER-5PKG-VERIFY ?auto_222101 ?auto_222102 ?auto_222103 ?auto_222104 ?auto_222105 ?auto_222100 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_222271 - OBJ
      ?auto_222272 - OBJ
      ?auto_222273 - OBJ
      ?auto_222274 - OBJ
      ?auto_222275 - OBJ
      ?auto_222270 - LOCATION
    )
    :vars
    (
      ?auto_222281 - LOCATION
      ?auto_222280 - CITY
      ?auto_222278 - LOCATION
      ?auto_222279 - LOCATION
      ?auto_222277 - LOCATION
      ?auto_222276 - LOCATION
      ?auto_222282 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_222281 ?auto_222280 ) ( IN-CITY ?auto_222270 ?auto_222280 ) ( not ( = ?auto_222270 ?auto_222281 ) ) ( OBJ-AT ?auto_222272 ?auto_222281 ) ( IN-CITY ?auto_222278 ?auto_222280 ) ( not ( = ?auto_222270 ?auto_222278 ) ) ( OBJ-AT ?auto_222275 ?auto_222278 ) ( IN-CITY ?auto_222279 ?auto_222280 ) ( not ( = ?auto_222270 ?auto_222279 ) ) ( OBJ-AT ?auto_222271 ?auto_222279 ) ( IN-CITY ?auto_222277 ?auto_222280 ) ( not ( = ?auto_222270 ?auto_222277 ) ) ( OBJ-AT ?auto_222273 ?auto_222277 ) ( IN-CITY ?auto_222276 ?auto_222280 ) ( not ( = ?auto_222270 ?auto_222276 ) ) ( OBJ-AT ?auto_222274 ?auto_222276 ) ( TRUCK-AT ?auto_222282 ?auto_222270 ) ( not ( = ?auto_222274 ?auto_222273 ) ) ( not ( = ?auto_222277 ?auto_222276 ) ) ( not ( = ?auto_222274 ?auto_222271 ) ) ( not ( = ?auto_222273 ?auto_222271 ) ) ( not ( = ?auto_222279 ?auto_222277 ) ) ( not ( = ?auto_222279 ?auto_222276 ) ) ( not ( = ?auto_222274 ?auto_222275 ) ) ( not ( = ?auto_222273 ?auto_222275 ) ) ( not ( = ?auto_222271 ?auto_222275 ) ) ( not ( = ?auto_222278 ?auto_222279 ) ) ( not ( = ?auto_222278 ?auto_222277 ) ) ( not ( = ?auto_222278 ?auto_222276 ) ) ( not ( = ?auto_222274 ?auto_222272 ) ) ( not ( = ?auto_222273 ?auto_222272 ) ) ( not ( = ?auto_222271 ?auto_222272 ) ) ( not ( = ?auto_222275 ?auto_222272 ) ) ( not ( = ?auto_222281 ?auto_222278 ) ) ( not ( = ?auto_222281 ?auto_222279 ) ) ( not ( = ?auto_222281 ?auto_222277 ) ) ( not ( = ?auto_222281 ?auto_222276 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_222274 ?auto_222273 ?auto_222271 ?auto_222272 ?auto_222275 ?auto_222270 )
      ( DELIVER-5PKG-VERIFY ?auto_222271 ?auto_222272 ?auto_222273 ?auto_222274 ?auto_222275 ?auto_222270 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_222444 - OBJ
      ?auto_222445 - OBJ
      ?auto_222446 - OBJ
      ?auto_222447 - OBJ
      ?auto_222448 - OBJ
      ?auto_222443 - LOCATION
    )
    :vars
    (
      ?auto_222454 - LOCATION
      ?auto_222453 - CITY
      ?auto_222451 - LOCATION
      ?auto_222452 - LOCATION
      ?auto_222450 - LOCATION
      ?auto_222449 - LOCATION
      ?auto_222455 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_222454 ?auto_222453 ) ( IN-CITY ?auto_222443 ?auto_222453 ) ( not ( = ?auto_222443 ?auto_222454 ) ) ( OBJ-AT ?auto_222445 ?auto_222454 ) ( IN-CITY ?auto_222451 ?auto_222453 ) ( not ( = ?auto_222443 ?auto_222451 ) ) ( OBJ-AT ?auto_222447 ?auto_222451 ) ( IN-CITY ?auto_222452 ?auto_222453 ) ( not ( = ?auto_222443 ?auto_222452 ) ) ( OBJ-AT ?auto_222444 ?auto_222452 ) ( IN-CITY ?auto_222450 ?auto_222453 ) ( not ( = ?auto_222443 ?auto_222450 ) ) ( OBJ-AT ?auto_222446 ?auto_222450 ) ( IN-CITY ?auto_222449 ?auto_222453 ) ( not ( = ?auto_222443 ?auto_222449 ) ) ( OBJ-AT ?auto_222448 ?auto_222449 ) ( TRUCK-AT ?auto_222455 ?auto_222443 ) ( not ( = ?auto_222448 ?auto_222446 ) ) ( not ( = ?auto_222450 ?auto_222449 ) ) ( not ( = ?auto_222448 ?auto_222444 ) ) ( not ( = ?auto_222446 ?auto_222444 ) ) ( not ( = ?auto_222452 ?auto_222450 ) ) ( not ( = ?auto_222452 ?auto_222449 ) ) ( not ( = ?auto_222448 ?auto_222447 ) ) ( not ( = ?auto_222446 ?auto_222447 ) ) ( not ( = ?auto_222444 ?auto_222447 ) ) ( not ( = ?auto_222451 ?auto_222452 ) ) ( not ( = ?auto_222451 ?auto_222450 ) ) ( not ( = ?auto_222451 ?auto_222449 ) ) ( not ( = ?auto_222448 ?auto_222445 ) ) ( not ( = ?auto_222446 ?auto_222445 ) ) ( not ( = ?auto_222444 ?auto_222445 ) ) ( not ( = ?auto_222447 ?auto_222445 ) ) ( not ( = ?auto_222454 ?auto_222451 ) ) ( not ( = ?auto_222454 ?auto_222452 ) ) ( not ( = ?auto_222454 ?auto_222450 ) ) ( not ( = ?auto_222454 ?auto_222449 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_222448 ?auto_222446 ?auto_222444 ?auto_222445 ?auto_222447 ?auto_222443 )
      ( DELIVER-5PKG-VERIFY ?auto_222444 ?auto_222445 ?auto_222446 ?auto_222447 ?auto_222448 ?auto_222443 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_222973 - OBJ
      ?auto_222974 - OBJ
      ?auto_222975 - OBJ
      ?auto_222976 - OBJ
      ?auto_222977 - OBJ
      ?auto_222972 - LOCATION
    )
    :vars
    (
      ?auto_222983 - LOCATION
      ?auto_222982 - CITY
      ?auto_222980 - LOCATION
      ?auto_222981 - LOCATION
      ?auto_222979 - LOCATION
      ?auto_222978 - LOCATION
      ?auto_222984 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_222983 ?auto_222982 ) ( IN-CITY ?auto_222972 ?auto_222982 ) ( not ( = ?auto_222972 ?auto_222983 ) ) ( OBJ-AT ?auto_222974 ?auto_222983 ) ( IN-CITY ?auto_222980 ?auto_222982 ) ( not ( = ?auto_222972 ?auto_222980 ) ) ( OBJ-AT ?auto_222975 ?auto_222980 ) ( IN-CITY ?auto_222981 ?auto_222982 ) ( not ( = ?auto_222972 ?auto_222981 ) ) ( OBJ-AT ?auto_222973 ?auto_222981 ) ( IN-CITY ?auto_222979 ?auto_222982 ) ( not ( = ?auto_222972 ?auto_222979 ) ) ( OBJ-AT ?auto_222977 ?auto_222979 ) ( IN-CITY ?auto_222978 ?auto_222982 ) ( not ( = ?auto_222972 ?auto_222978 ) ) ( OBJ-AT ?auto_222976 ?auto_222978 ) ( TRUCK-AT ?auto_222984 ?auto_222972 ) ( not ( = ?auto_222976 ?auto_222977 ) ) ( not ( = ?auto_222979 ?auto_222978 ) ) ( not ( = ?auto_222976 ?auto_222973 ) ) ( not ( = ?auto_222977 ?auto_222973 ) ) ( not ( = ?auto_222981 ?auto_222979 ) ) ( not ( = ?auto_222981 ?auto_222978 ) ) ( not ( = ?auto_222976 ?auto_222975 ) ) ( not ( = ?auto_222977 ?auto_222975 ) ) ( not ( = ?auto_222973 ?auto_222975 ) ) ( not ( = ?auto_222980 ?auto_222981 ) ) ( not ( = ?auto_222980 ?auto_222979 ) ) ( not ( = ?auto_222980 ?auto_222978 ) ) ( not ( = ?auto_222976 ?auto_222974 ) ) ( not ( = ?auto_222977 ?auto_222974 ) ) ( not ( = ?auto_222973 ?auto_222974 ) ) ( not ( = ?auto_222975 ?auto_222974 ) ) ( not ( = ?auto_222983 ?auto_222980 ) ) ( not ( = ?auto_222983 ?auto_222981 ) ) ( not ( = ?auto_222983 ?auto_222979 ) ) ( not ( = ?auto_222983 ?auto_222978 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_222976 ?auto_222977 ?auto_222973 ?auto_222974 ?auto_222975 ?auto_222972 )
      ( DELIVER-5PKG-VERIFY ?auto_222973 ?auto_222974 ?auto_222975 ?auto_222976 ?auto_222977 ?auto_222972 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_223028 - OBJ
      ?auto_223029 - OBJ
      ?auto_223030 - OBJ
      ?auto_223031 - OBJ
      ?auto_223032 - OBJ
      ?auto_223027 - LOCATION
    )
    :vars
    (
      ?auto_223038 - LOCATION
      ?auto_223037 - CITY
      ?auto_223035 - LOCATION
      ?auto_223036 - LOCATION
      ?auto_223034 - LOCATION
      ?auto_223033 - LOCATION
      ?auto_223039 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_223038 ?auto_223037 ) ( IN-CITY ?auto_223027 ?auto_223037 ) ( not ( = ?auto_223027 ?auto_223038 ) ) ( OBJ-AT ?auto_223029 ?auto_223038 ) ( IN-CITY ?auto_223035 ?auto_223037 ) ( not ( = ?auto_223027 ?auto_223035 ) ) ( OBJ-AT ?auto_223030 ?auto_223035 ) ( IN-CITY ?auto_223036 ?auto_223037 ) ( not ( = ?auto_223027 ?auto_223036 ) ) ( OBJ-AT ?auto_223028 ?auto_223036 ) ( IN-CITY ?auto_223034 ?auto_223037 ) ( not ( = ?auto_223027 ?auto_223034 ) ) ( OBJ-AT ?auto_223031 ?auto_223034 ) ( IN-CITY ?auto_223033 ?auto_223037 ) ( not ( = ?auto_223027 ?auto_223033 ) ) ( OBJ-AT ?auto_223032 ?auto_223033 ) ( TRUCK-AT ?auto_223039 ?auto_223027 ) ( not ( = ?auto_223032 ?auto_223031 ) ) ( not ( = ?auto_223034 ?auto_223033 ) ) ( not ( = ?auto_223032 ?auto_223028 ) ) ( not ( = ?auto_223031 ?auto_223028 ) ) ( not ( = ?auto_223036 ?auto_223034 ) ) ( not ( = ?auto_223036 ?auto_223033 ) ) ( not ( = ?auto_223032 ?auto_223030 ) ) ( not ( = ?auto_223031 ?auto_223030 ) ) ( not ( = ?auto_223028 ?auto_223030 ) ) ( not ( = ?auto_223035 ?auto_223036 ) ) ( not ( = ?auto_223035 ?auto_223034 ) ) ( not ( = ?auto_223035 ?auto_223033 ) ) ( not ( = ?auto_223032 ?auto_223029 ) ) ( not ( = ?auto_223031 ?auto_223029 ) ) ( not ( = ?auto_223028 ?auto_223029 ) ) ( not ( = ?auto_223030 ?auto_223029 ) ) ( not ( = ?auto_223038 ?auto_223035 ) ) ( not ( = ?auto_223038 ?auto_223036 ) ) ( not ( = ?auto_223038 ?auto_223034 ) ) ( not ( = ?auto_223038 ?auto_223033 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_223032 ?auto_223031 ?auto_223028 ?auto_223029 ?auto_223030 ?auto_223027 )
      ( DELIVER-5PKG-VERIFY ?auto_223028 ?auto_223029 ?auto_223030 ?auto_223031 ?auto_223032 ?auto_223027 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_223848 - OBJ
      ?auto_223849 - OBJ
      ?auto_223850 - OBJ
      ?auto_223851 - OBJ
      ?auto_223852 - OBJ
      ?auto_223847 - LOCATION
    )
    :vars
    (
      ?auto_223858 - LOCATION
      ?auto_223857 - CITY
      ?auto_223855 - LOCATION
      ?auto_223856 - LOCATION
      ?auto_223854 - LOCATION
      ?auto_223853 - LOCATION
      ?auto_223859 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_223858 ?auto_223857 ) ( IN-CITY ?auto_223847 ?auto_223857 ) ( not ( = ?auto_223847 ?auto_223858 ) ) ( OBJ-AT ?auto_223852 ?auto_223858 ) ( IN-CITY ?auto_223855 ?auto_223857 ) ( not ( = ?auto_223847 ?auto_223855 ) ) ( OBJ-AT ?auto_223848 ?auto_223855 ) ( IN-CITY ?auto_223856 ?auto_223857 ) ( not ( = ?auto_223847 ?auto_223856 ) ) ( OBJ-AT ?auto_223851 ?auto_223856 ) ( IN-CITY ?auto_223854 ?auto_223857 ) ( not ( = ?auto_223847 ?auto_223854 ) ) ( OBJ-AT ?auto_223850 ?auto_223854 ) ( IN-CITY ?auto_223853 ?auto_223857 ) ( not ( = ?auto_223847 ?auto_223853 ) ) ( OBJ-AT ?auto_223849 ?auto_223853 ) ( TRUCK-AT ?auto_223859 ?auto_223847 ) ( not ( = ?auto_223849 ?auto_223850 ) ) ( not ( = ?auto_223854 ?auto_223853 ) ) ( not ( = ?auto_223849 ?auto_223851 ) ) ( not ( = ?auto_223850 ?auto_223851 ) ) ( not ( = ?auto_223856 ?auto_223854 ) ) ( not ( = ?auto_223856 ?auto_223853 ) ) ( not ( = ?auto_223849 ?auto_223848 ) ) ( not ( = ?auto_223850 ?auto_223848 ) ) ( not ( = ?auto_223851 ?auto_223848 ) ) ( not ( = ?auto_223855 ?auto_223856 ) ) ( not ( = ?auto_223855 ?auto_223854 ) ) ( not ( = ?auto_223855 ?auto_223853 ) ) ( not ( = ?auto_223849 ?auto_223852 ) ) ( not ( = ?auto_223850 ?auto_223852 ) ) ( not ( = ?auto_223851 ?auto_223852 ) ) ( not ( = ?auto_223848 ?auto_223852 ) ) ( not ( = ?auto_223858 ?auto_223855 ) ) ( not ( = ?auto_223858 ?auto_223856 ) ) ( not ( = ?auto_223858 ?auto_223854 ) ) ( not ( = ?auto_223858 ?auto_223853 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_223849 ?auto_223850 ?auto_223851 ?auto_223852 ?auto_223848 ?auto_223847 )
      ( DELIVER-5PKG-VERIFY ?auto_223848 ?auto_223849 ?auto_223850 ?auto_223851 ?auto_223852 ?auto_223847 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_223903 - OBJ
      ?auto_223904 - OBJ
      ?auto_223905 - OBJ
      ?auto_223906 - OBJ
      ?auto_223907 - OBJ
      ?auto_223902 - LOCATION
    )
    :vars
    (
      ?auto_223913 - LOCATION
      ?auto_223912 - CITY
      ?auto_223910 - LOCATION
      ?auto_223911 - LOCATION
      ?auto_223909 - LOCATION
      ?auto_223908 - LOCATION
      ?auto_223914 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_223913 ?auto_223912 ) ( IN-CITY ?auto_223902 ?auto_223912 ) ( not ( = ?auto_223902 ?auto_223913 ) ) ( OBJ-AT ?auto_223906 ?auto_223913 ) ( IN-CITY ?auto_223910 ?auto_223912 ) ( not ( = ?auto_223902 ?auto_223910 ) ) ( OBJ-AT ?auto_223903 ?auto_223910 ) ( IN-CITY ?auto_223911 ?auto_223912 ) ( not ( = ?auto_223902 ?auto_223911 ) ) ( OBJ-AT ?auto_223907 ?auto_223911 ) ( IN-CITY ?auto_223909 ?auto_223912 ) ( not ( = ?auto_223902 ?auto_223909 ) ) ( OBJ-AT ?auto_223905 ?auto_223909 ) ( IN-CITY ?auto_223908 ?auto_223912 ) ( not ( = ?auto_223902 ?auto_223908 ) ) ( OBJ-AT ?auto_223904 ?auto_223908 ) ( TRUCK-AT ?auto_223914 ?auto_223902 ) ( not ( = ?auto_223904 ?auto_223905 ) ) ( not ( = ?auto_223909 ?auto_223908 ) ) ( not ( = ?auto_223904 ?auto_223907 ) ) ( not ( = ?auto_223905 ?auto_223907 ) ) ( not ( = ?auto_223911 ?auto_223909 ) ) ( not ( = ?auto_223911 ?auto_223908 ) ) ( not ( = ?auto_223904 ?auto_223903 ) ) ( not ( = ?auto_223905 ?auto_223903 ) ) ( not ( = ?auto_223907 ?auto_223903 ) ) ( not ( = ?auto_223910 ?auto_223911 ) ) ( not ( = ?auto_223910 ?auto_223909 ) ) ( not ( = ?auto_223910 ?auto_223908 ) ) ( not ( = ?auto_223904 ?auto_223906 ) ) ( not ( = ?auto_223905 ?auto_223906 ) ) ( not ( = ?auto_223907 ?auto_223906 ) ) ( not ( = ?auto_223903 ?auto_223906 ) ) ( not ( = ?auto_223913 ?auto_223910 ) ) ( not ( = ?auto_223913 ?auto_223911 ) ) ( not ( = ?auto_223913 ?auto_223909 ) ) ( not ( = ?auto_223913 ?auto_223908 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_223904 ?auto_223905 ?auto_223907 ?auto_223906 ?auto_223903 ?auto_223902 )
      ( DELIVER-5PKG-VERIFY ?auto_223903 ?auto_223904 ?auto_223905 ?auto_223906 ?auto_223907 ?auto_223902 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_223958 - OBJ
      ?auto_223959 - OBJ
      ?auto_223960 - OBJ
      ?auto_223961 - OBJ
      ?auto_223962 - OBJ
      ?auto_223957 - LOCATION
    )
    :vars
    (
      ?auto_223968 - LOCATION
      ?auto_223967 - CITY
      ?auto_223965 - LOCATION
      ?auto_223966 - LOCATION
      ?auto_223964 - LOCATION
      ?auto_223963 - LOCATION
      ?auto_223969 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_223968 ?auto_223967 ) ( IN-CITY ?auto_223957 ?auto_223967 ) ( not ( = ?auto_223957 ?auto_223968 ) ) ( OBJ-AT ?auto_223962 ?auto_223968 ) ( IN-CITY ?auto_223965 ?auto_223967 ) ( not ( = ?auto_223957 ?auto_223965 ) ) ( OBJ-AT ?auto_223958 ?auto_223965 ) ( IN-CITY ?auto_223966 ?auto_223967 ) ( not ( = ?auto_223957 ?auto_223966 ) ) ( OBJ-AT ?auto_223960 ?auto_223966 ) ( IN-CITY ?auto_223964 ?auto_223967 ) ( not ( = ?auto_223957 ?auto_223964 ) ) ( OBJ-AT ?auto_223961 ?auto_223964 ) ( IN-CITY ?auto_223963 ?auto_223967 ) ( not ( = ?auto_223957 ?auto_223963 ) ) ( OBJ-AT ?auto_223959 ?auto_223963 ) ( TRUCK-AT ?auto_223969 ?auto_223957 ) ( not ( = ?auto_223959 ?auto_223961 ) ) ( not ( = ?auto_223964 ?auto_223963 ) ) ( not ( = ?auto_223959 ?auto_223960 ) ) ( not ( = ?auto_223961 ?auto_223960 ) ) ( not ( = ?auto_223966 ?auto_223964 ) ) ( not ( = ?auto_223966 ?auto_223963 ) ) ( not ( = ?auto_223959 ?auto_223958 ) ) ( not ( = ?auto_223961 ?auto_223958 ) ) ( not ( = ?auto_223960 ?auto_223958 ) ) ( not ( = ?auto_223965 ?auto_223966 ) ) ( not ( = ?auto_223965 ?auto_223964 ) ) ( not ( = ?auto_223965 ?auto_223963 ) ) ( not ( = ?auto_223959 ?auto_223962 ) ) ( not ( = ?auto_223961 ?auto_223962 ) ) ( not ( = ?auto_223960 ?auto_223962 ) ) ( not ( = ?auto_223958 ?auto_223962 ) ) ( not ( = ?auto_223968 ?auto_223965 ) ) ( not ( = ?auto_223968 ?auto_223966 ) ) ( not ( = ?auto_223968 ?auto_223964 ) ) ( not ( = ?auto_223968 ?auto_223963 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_223959 ?auto_223961 ?auto_223960 ?auto_223962 ?auto_223958 ?auto_223957 )
      ( DELIVER-5PKG-VERIFY ?auto_223958 ?auto_223959 ?auto_223960 ?auto_223961 ?auto_223962 ?auto_223957 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224013 - OBJ
      ?auto_224014 - OBJ
      ?auto_224015 - OBJ
      ?auto_224016 - OBJ
      ?auto_224017 - OBJ
      ?auto_224012 - LOCATION
    )
    :vars
    (
      ?auto_224023 - LOCATION
      ?auto_224022 - CITY
      ?auto_224020 - LOCATION
      ?auto_224021 - LOCATION
      ?auto_224019 - LOCATION
      ?auto_224018 - LOCATION
      ?auto_224024 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224023 ?auto_224022 ) ( IN-CITY ?auto_224012 ?auto_224022 ) ( not ( = ?auto_224012 ?auto_224023 ) ) ( OBJ-AT ?auto_224016 ?auto_224023 ) ( IN-CITY ?auto_224020 ?auto_224022 ) ( not ( = ?auto_224012 ?auto_224020 ) ) ( OBJ-AT ?auto_224013 ?auto_224020 ) ( IN-CITY ?auto_224021 ?auto_224022 ) ( not ( = ?auto_224012 ?auto_224021 ) ) ( OBJ-AT ?auto_224015 ?auto_224021 ) ( IN-CITY ?auto_224019 ?auto_224022 ) ( not ( = ?auto_224012 ?auto_224019 ) ) ( OBJ-AT ?auto_224017 ?auto_224019 ) ( IN-CITY ?auto_224018 ?auto_224022 ) ( not ( = ?auto_224012 ?auto_224018 ) ) ( OBJ-AT ?auto_224014 ?auto_224018 ) ( TRUCK-AT ?auto_224024 ?auto_224012 ) ( not ( = ?auto_224014 ?auto_224017 ) ) ( not ( = ?auto_224019 ?auto_224018 ) ) ( not ( = ?auto_224014 ?auto_224015 ) ) ( not ( = ?auto_224017 ?auto_224015 ) ) ( not ( = ?auto_224021 ?auto_224019 ) ) ( not ( = ?auto_224021 ?auto_224018 ) ) ( not ( = ?auto_224014 ?auto_224013 ) ) ( not ( = ?auto_224017 ?auto_224013 ) ) ( not ( = ?auto_224015 ?auto_224013 ) ) ( not ( = ?auto_224020 ?auto_224021 ) ) ( not ( = ?auto_224020 ?auto_224019 ) ) ( not ( = ?auto_224020 ?auto_224018 ) ) ( not ( = ?auto_224014 ?auto_224016 ) ) ( not ( = ?auto_224017 ?auto_224016 ) ) ( not ( = ?auto_224015 ?auto_224016 ) ) ( not ( = ?auto_224013 ?auto_224016 ) ) ( not ( = ?auto_224023 ?auto_224020 ) ) ( not ( = ?auto_224023 ?auto_224021 ) ) ( not ( = ?auto_224023 ?auto_224019 ) ) ( not ( = ?auto_224023 ?auto_224018 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_224014 ?auto_224017 ?auto_224015 ?auto_224016 ?auto_224013 ?auto_224012 )
      ( DELIVER-5PKG-VERIFY ?auto_224013 ?auto_224014 ?auto_224015 ?auto_224016 ?auto_224017 ?auto_224012 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224300 - OBJ
      ?auto_224301 - OBJ
      ?auto_224302 - OBJ
      ?auto_224303 - OBJ
      ?auto_224304 - OBJ
      ?auto_224299 - LOCATION
    )
    :vars
    (
      ?auto_224310 - LOCATION
      ?auto_224309 - CITY
      ?auto_224307 - LOCATION
      ?auto_224308 - LOCATION
      ?auto_224306 - LOCATION
      ?auto_224305 - LOCATION
      ?auto_224311 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224310 ?auto_224309 ) ( IN-CITY ?auto_224299 ?auto_224309 ) ( not ( = ?auto_224299 ?auto_224310 ) ) ( OBJ-AT ?auto_224302 ?auto_224310 ) ( IN-CITY ?auto_224307 ?auto_224309 ) ( not ( = ?auto_224299 ?auto_224307 ) ) ( OBJ-AT ?auto_224300 ?auto_224307 ) ( IN-CITY ?auto_224308 ?auto_224309 ) ( not ( = ?auto_224299 ?auto_224308 ) ) ( OBJ-AT ?auto_224304 ?auto_224308 ) ( IN-CITY ?auto_224306 ?auto_224309 ) ( not ( = ?auto_224299 ?auto_224306 ) ) ( OBJ-AT ?auto_224303 ?auto_224306 ) ( IN-CITY ?auto_224305 ?auto_224309 ) ( not ( = ?auto_224299 ?auto_224305 ) ) ( OBJ-AT ?auto_224301 ?auto_224305 ) ( TRUCK-AT ?auto_224311 ?auto_224299 ) ( not ( = ?auto_224301 ?auto_224303 ) ) ( not ( = ?auto_224306 ?auto_224305 ) ) ( not ( = ?auto_224301 ?auto_224304 ) ) ( not ( = ?auto_224303 ?auto_224304 ) ) ( not ( = ?auto_224308 ?auto_224306 ) ) ( not ( = ?auto_224308 ?auto_224305 ) ) ( not ( = ?auto_224301 ?auto_224300 ) ) ( not ( = ?auto_224303 ?auto_224300 ) ) ( not ( = ?auto_224304 ?auto_224300 ) ) ( not ( = ?auto_224307 ?auto_224308 ) ) ( not ( = ?auto_224307 ?auto_224306 ) ) ( not ( = ?auto_224307 ?auto_224305 ) ) ( not ( = ?auto_224301 ?auto_224302 ) ) ( not ( = ?auto_224303 ?auto_224302 ) ) ( not ( = ?auto_224304 ?auto_224302 ) ) ( not ( = ?auto_224300 ?auto_224302 ) ) ( not ( = ?auto_224310 ?auto_224307 ) ) ( not ( = ?auto_224310 ?auto_224308 ) ) ( not ( = ?auto_224310 ?auto_224306 ) ) ( not ( = ?auto_224310 ?auto_224305 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_224301 ?auto_224303 ?auto_224304 ?auto_224302 ?auto_224300 ?auto_224299 )
      ( DELIVER-5PKG-VERIFY ?auto_224300 ?auto_224301 ?auto_224302 ?auto_224303 ?auto_224304 ?auto_224299 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224355 - OBJ
      ?auto_224356 - OBJ
      ?auto_224357 - OBJ
      ?auto_224358 - OBJ
      ?auto_224359 - OBJ
      ?auto_224354 - LOCATION
    )
    :vars
    (
      ?auto_224365 - LOCATION
      ?auto_224364 - CITY
      ?auto_224362 - LOCATION
      ?auto_224363 - LOCATION
      ?auto_224361 - LOCATION
      ?auto_224360 - LOCATION
      ?auto_224366 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224365 ?auto_224364 ) ( IN-CITY ?auto_224354 ?auto_224364 ) ( not ( = ?auto_224354 ?auto_224365 ) ) ( OBJ-AT ?auto_224357 ?auto_224365 ) ( IN-CITY ?auto_224362 ?auto_224364 ) ( not ( = ?auto_224354 ?auto_224362 ) ) ( OBJ-AT ?auto_224355 ?auto_224362 ) ( IN-CITY ?auto_224363 ?auto_224364 ) ( not ( = ?auto_224354 ?auto_224363 ) ) ( OBJ-AT ?auto_224358 ?auto_224363 ) ( IN-CITY ?auto_224361 ?auto_224364 ) ( not ( = ?auto_224354 ?auto_224361 ) ) ( OBJ-AT ?auto_224359 ?auto_224361 ) ( IN-CITY ?auto_224360 ?auto_224364 ) ( not ( = ?auto_224354 ?auto_224360 ) ) ( OBJ-AT ?auto_224356 ?auto_224360 ) ( TRUCK-AT ?auto_224366 ?auto_224354 ) ( not ( = ?auto_224356 ?auto_224359 ) ) ( not ( = ?auto_224361 ?auto_224360 ) ) ( not ( = ?auto_224356 ?auto_224358 ) ) ( not ( = ?auto_224359 ?auto_224358 ) ) ( not ( = ?auto_224363 ?auto_224361 ) ) ( not ( = ?auto_224363 ?auto_224360 ) ) ( not ( = ?auto_224356 ?auto_224355 ) ) ( not ( = ?auto_224359 ?auto_224355 ) ) ( not ( = ?auto_224358 ?auto_224355 ) ) ( not ( = ?auto_224362 ?auto_224363 ) ) ( not ( = ?auto_224362 ?auto_224361 ) ) ( not ( = ?auto_224362 ?auto_224360 ) ) ( not ( = ?auto_224356 ?auto_224357 ) ) ( not ( = ?auto_224359 ?auto_224357 ) ) ( not ( = ?auto_224358 ?auto_224357 ) ) ( not ( = ?auto_224355 ?auto_224357 ) ) ( not ( = ?auto_224365 ?auto_224362 ) ) ( not ( = ?auto_224365 ?auto_224363 ) ) ( not ( = ?auto_224365 ?auto_224361 ) ) ( not ( = ?auto_224365 ?auto_224360 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_224356 ?auto_224359 ?auto_224358 ?auto_224357 ?auto_224355 ?auto_224354 )
      ( DELIVER-5PKG-VERIFY ?auto_224355 ?auto_224356 ?auto_224357 ?auto_224358 ?auto_224359 ?auto_224354 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224584 - OBJ
      ?auto_224585 - OBJ
      ?auto_224586 - OBJ
      ?auto_224587 - OBJ
      ?auto_224588 - OBJ
      ?auto_224583 - LOCATION
    )
    :vars
    (
      ?auto_224594 - LOCATION
      ?auto_224593 - CITY
      ?auto_224591 - LOCATION
      ?auto_224592 - LOCATION
      ?auto_224590 - LOCATION
      ?auto_224589 - LOCATION
      ?auto_224595 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224594 ?auto_224593 ) ( IN-CITY ?auto_224583 ?auto_224593 ) ( not ( = ?auto_224583 ?auto_224594 ) ) ( OBJ-AT ?auto_224588 ?auto_224594 ) ( IN-CITY ?auto_224591 ?auto_224593 ) ( not ( = ?auto_224583 ?auto_224591 ) ) ( OBJ-AT ?auto_224584 ?auto_224591 ) ( IN-CITY ?auto_224592 ?auto_224593 ) ( not ( = ?auto_224583 ?auto_224592 ) ) ( OBJ-AT ?auto_224587 ?auto_224592 ) ( IN-CITY ?auto_224590 ?auto_224593 ) ( not ( = ?auto_224583 ?auto_224590 ) ) ( OBJ-AT ?auto_224585 ?auto_224590 ) ( IN-CITY ?auto_224589 ?auto_224593 ) ( not ( = ?auto_224583 ?auto_224589 ) ) ( OBJ-AT ?auto_224586 ?auto_224589 ) ( TRUCK-AT ?auto_224595 ?auto_224583 ) ( not ( = ?auto_224586 ?auto_224585 ) ) ( not ( = ?auto_224590 ?auto_224589 ) ) ( not ( = ?auto_224586 ?auto_224587 ) ) ( not ( = ?auto_224585 ?auto_224587 ) ) ( not ( = ?auto_224592 ?auto_224590 ) ) ( not ( = ?auto_224592 ?auto_224589 ) ) ( not ( = ?auto_224586 ?auto_224584 ) ) ( not ( = ?auto_224585 ?auto_224584 ) ) ( not ( = ?auto_224587 ?auto_224584 ) ) ( not ( = ?auto_224591 ?auto_224592 ) ) ( not ( = ?auto_224591 ?auto_224590 ) ) ( not ( = ?auto_224591 ?auto_224589 ) ) ( not ( = ?auto_224586 ?auto_224588 ) ) ( not ( = ?auto_224585 ?auto_224588 ) ) ( not ( = ?auto_224587 ?auto_224588 ) ) ( not ( = ?auto_224584 ?auto_224588 ) ) ( not ( = ?auto_224594 ?auto_224591 ) ) ( not ( = ?auto_224594 ?auto_224592 ) ) ( not ( = ?auto_224594 ?auto_224590 ) ) ( not ( = ?auto_224594 ?auto_224589 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_224586 ?auto_224585 ?auto_224587 ?auto_224588 ?auto_224584 ?auto_224583 )
      ( DELIVER-5PKG-VERIFY ?auto_224584 ?auto_224585 ?auto_224586 ?auto_224587 ?auto_224588 ?auto_224583 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224639 - OBJ
      ?auto_224640 - OBJ
      ?auto_224641 - OBJ
      ?auto_224642 - OBJ
      ?auto_224643 - OBJ
      ?auto_224638 - LOCATION
    )
    :vars
    (
      ?auto_224649 - LOCATION
      ?auto_224648 - CITY
      ?auto_224646 - LOCATION
      ?auto_224647 - LOCATION
      ?auto_224645 - LOCATION
      ?auto_224644 - LOCATION
      ?auto_224650 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224649 ?auto_224648 ) ( IN-CITY ?auto_224638 ?auto_224648 ) ( not ( = ?auto_224638 ?auto_224649 ) ) ( OBJ-AT ?auto_224642 ?auto_224649 ) ( IN-CITY ?auto_224646 ?auto_224648 ) ( not ( = ?auto_224638 ?auto_224646 ) ) ( OBJ-AT ?auto_224639 ?auto_224646 ) ( IN-CITY ?auto_224647 ?auto_224648 ) ( not ( = ?auto_224638 ?auto_224647 ) ) ( OBJ-AT ?auto_224643 ?auto_224647 ) ( IN-CITY ?auto_224645 ?auto_224648 ) ( not ( = ?auto_224638 ?auto_224645 ) ) ( OBJ-AT ?auto_224640 ?auto_224645 ) ( IN-CITY ?auto_224644 ?auto_224648 ) ( not ( = ?auto_224638 ?auto_224644 ) ) ( OBJ-AT ?auto_224641 ?auto_224644 ) ( TRUCK-AT ?auto_224650 ?auto_224638 ) ( not ( = ?auto_224641 ?auto_224640 ) ) ( not ( = ?auto_224645 ?auto_224644 ) ) ( not ( = ?auto_224641 ?auto_224643 ) ) ( not ( = ?auto_224640 ?auto_224643 ) ) ( not ( = ?auto_224647 ?auto_224645 ) ) ( not ( = ?auto_224647 ?auto_224644 ) ) ( not ( = ?auto_224641 ?auto_224639 ) ) ( not ( = ?auto_224640 ?auto_224639 ) ) ( not ( = ?auto_224643 ?auto_224639 ) ) ( not ( = ?auto_224646 ?auto_224647 ) ) ( not ( = ?auto_224646 ?auto_224645 ) ) ( not ( = ?auto_224646 ?auto_224644 ) ) ( not ( = ?auto_224641 ?auto_224642 ) ) ( not ( = ?auto_224640 ?auto_224642 ) ) ( not ( = ?auto_224643 ?auto_224642 ) ) ( not ( = ?auto_224639 ?auto_224642 ) ) ( not ( = ?auto_224649 ?auto_224646 ) ) ( not ( = ?auto_224649 ?auto_224647 ) ) ( not ( = ?auto_224649 ?auto_224645 ) ) ( not ( = ?auto_224649 ?auto_224644 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_224641 ?auto_224640 ?auto_224643 ?auto_224642 ?auto_224639 ?auto_224638 )
      ( DELIVER-5PKG-VERIFY ?auto_224639 ?auto_224640 ?auto_224641 ?auto_224642 ?auto_224643 ?auto_224638 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224811 - OBJ
      ?auto_224812 - OBJ
      ?auto_224813 - OBJ
      ?auto_224814 - OBJ
      ?auto_224815 - OBJ
      ?auto_224810 - LOCATION
    )
    :vars
    (
      ?auto_224821 - LOCATION
      ?auto_224820 - CITY
      ?auto_224818 - LOCATION
      ?auto_224819 - LOCATION
      ?auto_224817 - LOCATION
      ?auto_224816 - LOCATION
      ?auto_224822 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224821 ?auto_224820 ) ( IN-CITY ?auto_224810 ?auto_224820 ) ( not ( = ?auto_224810 ?auto_224821 ) ) ( OBJ-AT ?auto_224815 ?auto_224821 ) ( IN-CITY ?auto_224818 ?auto_224820 ) ( not ( = ?auto_224810 ?auto_224818 ) ) ( OBJ-AT ?auto_224811 ?auto_224818 ) ( IN-CITY ?auto_224819 ?auto_224820 ) ( not ( = ?auto_224810 ?auto_224819 ) ) ( OBJ-AT ?auto_224813 ?auto_224819 ) ( IN-CITY ?auto_224817 ?auto_224820 ) ( not ( = ?auto_224810 ?auto_224817 ) ) ( OBJ-AT ?auto_224812 ?auto_224817 ) ( IN-CITY ?auto_224816 ?auto_224820 ) ( not ( = ?auto_224810 ?auto_224816 ) ) ( OBJ-AT ?auto_224814 ?auto_224816 ) ( TRUCK-AT ?auto_224822 ?auto_224810 ) ( not ( = ?auto_224814 ?auto_224812 ) ) ( not ( = ?auto_224817 ?auto_224816 ) ) ( not ( = ?auto_224814 ?auto_224813 ) ) ( not ( = ?auto_224812 ?auto_224813 ) ) ( not ( = ?auto_224819 ?auto_224817 ) ) ( not ( = ?auto_224819 ?auto_224816 ) ) ( not ( = ?auto_224814 ?auto_224811 ) ) ( not ( = ?auto_224812 ?auto_224811 ) ) ( not ( = ?auto_224813 ?auto_224811 ) ) ( not ( = ?auto_224818 ?auto_224819 ) ) ( not ( = ?auto_224818 ?auto_224817 ) ) ( not ( = ?auto_224818 ?auto_224816 ) ) ( not ( = ?auto_224814 ?auto_224815 ) ) ( not ( = ?auto_224812 ?auto_224815 ) ) ( not ( = ?auto_224813 ?auto_224815 ) ) ( not ( = ?auto_224811 ?auto_224815 ) ) ( not ( = ?auto_224821 ?auto_224818 ) ) ( not ( = ?auto_224821 ?auto_224819 ) ) ( not ( = ?auto_224821 ?auto_224817 ) ) ( not ( = ?auto_224821 ?auto_224816 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_224814 ?auto_224812 ?auto_224813 ?auto_224815 ?auto_224811 ?auto_224810 )
      ( DELIVER-5PKG-VERIFY ?auto_224811 ?auto_224812 ?auto_224813 ?auto_224814 ?auto_224815 ?auto_224810 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224866 - OBJ
      ?auto_224867 - OBJ
      ?auto_224868 - OBJ
      ?auto_224869 - OBJ
      ?auto_224870 - OBJ
      ?auto_224865 - LOCATION
    )
    :vars
    (
      ?auto_224876 - LOCATION
      ?auto_224875 - CITY
      ?auto_224873 - LOCATION
      ?auto_224874 - LOCATION
      ?auto_224872 - LOCATION
      ?auto_224871 - LOCATION
      ?auto_224877 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224876 ?auto_224875 ) ( IN-CITY ?auto_224865 ?auto_224875 ) ( not ( = ?auto_224865 ?auto_224876 ) ) ( OBJ-AT ?auto_224869 ?auto_224876 ) ( IN-CITY ?auto_224873 ?auto_224875 ) ( not ( = ?auto_224865 ?auto_224873 ) ) ( OBJ-AT ?auto_224866 ?auto_224873 ) ( IN-CITY ?auto_224874 ?auto_224875 ) ( not ( = ?auto_224865 ?auto_224874 ) ) ( OBJ-AT ?auto_224868 ?auto_224874 ) ( IN-CITY ?auto_224872 ?auto_224875 ) ( not ( = ?auto_224865 ?auto_224872 ) ) ( OBJ-AT ?auto_224867 ?auto_224872 ) ( IN-CITY ?auto_224871 ?auto_224875 ) ( not ( = ?auto_224865 ?auto_224871 ) ) ( OBJ-AT ?auto_224870 ?auto_224871 ) ( TRUCK-AT ?auto_224877 ?auto_224865 ) ( not ( = ?auto_224870 ?auto_224867 ) ) ( not ( = ?auto_224872 ?auto_224871 ) ) ( not ( = ?auto_224870 ?auto_224868 ) ) ( not ( = ?auto_224867 ?auto_224868 ) ) ( not ( = ?auto_224874 ?auto_224872 ) ) ( not ( = ?auto_224874 ?auto_224871 ) ) ( not ( = ?auto_224870 ?auto_224866 ) ) ( not ( = ?auto_224867 ?auto_224866 ) ) ( not ( = ?auto_224868 ?auto_224866 ) ) ( not ( = ?auto_224873 ?auto_224874 ) ) ( not ( = ?auto_224873 ?auto_224872 ) ) ( not ( = ?auto_224873 ?auto_224871 ) ) ( not ( = ?auto_224870 ?auto_224869 ) ) ( not ( = ?auto_224867 ?auto_224869 ) ) ( not ( = ?auto_224868 ?auto_224869 ) ) ( not ( = ?auto_224866 ?auto_224869 ) ) ( not ( = ?auto_224876 ?auto_224873 ) ) ( not ( = ?auto_224876 ?auto_224874 ) ) ( not ( = ?auto_224876 ?auto_224872 ) ) ( not ( = ?auto_224876 ?auto_224871 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_224870 ?auto_224867 ?auto_224868 ?auto_224869 ?auto_224866 ?auto_224865 )
      ( DELIVER-5PKG-VERIFY ?auto_224866 ?auto_224867 ?auto_224868 ?auto_224869 ?auto_224870 ?auto_224865 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225094 - OBJ
      ?auto_225095 - OBJ
      ?auto_225096 - OBJ
      ?auto_225097 - OBJ
      ?auto_225098 - OBJ
      ?auto_225093 - LOCATION
    )
    :vars
    (
      ?auto_225104 - LOCATION
      ?auto_225103 - CITY
      ?auto_225101 - LOCATION
      ?auto_225102 - LOCATION
      ?auto_225100 - LOCATION
      ?auto_225099 - LOCATION
      ?auto_225105 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_225104 ?auto_225103 ) ( IN-CITY ?auto_225093 ?auto_225103 ) ( not ( = ?auto_225093 ?auto_225104 ) ) ( OBJ-AT ?auto_225096 ?auto_225104 ) ( IN-CITY ?auto_225101 ?auto_225103 ) ( not ( = ?auto_225093 ?auto_225101 ) ) ( OBJ-AT ?auto_225094 ?auto_225101 ) ( IN-CITY ?auto_225102 ?auto_225103 ) ( not ( = ?auto_225093 ?auto_225102 ) ) ( OBJ-AT ?auto_225098 ?auto_225102 ) ( IN-CITY ?auto_225100 ?auto_225103 ) ( not ( = ?auto_225093 ?auto_225100 ) ) ( OBJ-AT ?auto_225095 ?auto_225100 ) ( IN-CITY ?auto_225099 ?auto_225103 ) ( not ( = ?auto_225093 ?auto_225099 ) ) ( OBJ-AT ?auto_225097 ?auto_225099 ) ( TRUCK-AT ?auto_225105 ?auto_225093 ) ( not ( = ?auto_225097 ?auto_225095 ) ) ( not ( = ?auto_225100 ?auto_225099 ) ) ( not ( = ?auto_225097 ?auto_225098 ) ) ( not ( = ?auto_225095 ?auto_225098 ) ) ( not ( = ?auto_225102 ?auto_225100 ) ) ( not ( = ?auto_225102 ?auto_225099 ) ) ( not ( = ?auto_225097 ?auto_225094 ) ) ( not ( = ?auto_225095 ?auto_225094 ) ) ( not ( = ?auto_225098 ?auto_225094 ) ) ( not ( = ?auto_225101 ?auto_225102 ) ) ( not ( = ?auto_225101 ?auto_225100 ) ) ( not ( = ?auto_225101 ?auto_225099 ) ) ( not ( = ?auto_225097 ?auto_225096 ) ) ( not ( = ?auto_225095 ?auto_225096 ) ) ( not ( = ?auto_225098 ?auto_225096 ) ) ( not ( = ?auto_225094 ?auto_225096 ) ) ( not ( = ?auto_225104 ?auto_225101 ) ) ( not ( = ?auto_225104 ?auto_225102 ) ) ( not ( = ?auto_225104 ?auto_225100 ) ) ( not ( = ?auto_225104 ?auto_225099 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_225097 ?auto_225095 ?auto_225098 ?auto_225096 ?auto_225094 ?auto_225093 )
      ( DELIVER-5PKG-VERIFY ?auto_225094 ?auto_225095 ?auto_225096 ?auto_225097 ?auto_225098 ?auto_225093 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225208 - OBJ
      ?auto_225209 - OBJ
      ?auto_225210 - OBJ
      ?auto_225211 - OBJ
      ?auto_225212 - OBJ
      ?auto_225207 - LOCATION
    )
    :vars
    (
      ?auto_225218 - LOCATION
      ?auto_225217 - CITY
      ?auto_225215 - LOCATION
      ?auto_225216 - LOCATION
      ?auto_225214 - LOCATION
      ?auto_225213 - LOCATION
      ?auto_225219 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_225218 ?auto_225217 ) ( IN-CITY ?auto_225207 ?auto_225217 ) ( not ( = ?auto_225207 ?auto_225218 ) ) ( OBJ-AT ?auto_225210 ?auto_225218 ) ( IN-CITY ?auto_225215 ?auto_225217 ) ( not ( = ?auto_225207 ?auto_225215 ) ) ( OBJ-AT ?auto_225208 ?auto_225215 ) ( IN-CITY ?auto_225216 ?auto_225217 ) ( not ( = ?auto_225207 ?auto_225216 ) ) ( OBJ-AT ?auto_225211 ?auto_225216 ) ( IN-CITY ?auto_225214 ?auto_225217 ) ( not ( = ?auto_225207 ?auto_225214 ) ) ( OBJ-AT ?auto_225209 ?auto_225214 ) ( IN-CITY ?auto_225213 ?auto_225217 ) ( not ( = ?auto_225207 ?auto_225213 ) ) ( OBJ-AT ?auto_225212 ?auto_225213 ) ( TRUCK-AT ?auto_225219 ?auto_225207 ) ( not ( = ?auto_225212 ?auto_225209 ) ) ( not ( = ?auto_225214 ?auto_225213 ) ) ( not ( = ?auto_225212 ?auto_225211 ) ) ( not ( = ?auto_225209 ?auto_225211 ) ) ( not ( = ?auto_225216 ?auto_225214 ) ) ( not ( = ?auto_225216 ?auto_225213 ) ) ( not ( = ?auto_225212 ?auto_225208 ) ) ( not ( = ?auto_225209 ?auto_225208 ) ) ( not ( = ?auto_225211 ?auto_225208 ) ) ( not ( = ?auto_225215 ?auto_225216 ) ) ( not ( = ?auto_225215 ?auto_225214 ) ) ( not ( = ?auto_225215 ?auto_225213 ) ) ( not ( = ?auto_225212 ?auto_225210 ) ) ( not ( = ?auto_225209 ?auto_225210 ) ) ( not ( = ?auto_225211 ?auto_225210 ) ) ( not ( = ?auto_225208 ?auto_225210 ) ) ( not ( = ?auto_225218 ?auto_225215 ) ) ( not ( = ?auto_225218 ?auto_225216 ) ) ( not ( = ?auto_225218 ?auto_225214 ) ) ( not ( = ?auto_225218 ?auto_225213 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_225212 ?auto_225209 ?auto_225211 ?auto_225210 ?auto_225208 ?auto_225207 )
      ( DELIVER-5PKG-VERIFY ?auto_225208 ?auto_225209 ?auto_225210 ?auto_225211 ?auto_225212 ?auto_225207 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225437 - OBJ
      ?auto_225438 - OBJ
      ?auto_225439 - OBJ
      ?auto_225440 - OBJ
      ?auto_225441 - OBJ
      ?auto_225436 - LOCATION
    )
    :vars
    (
      ?auto_225447 - LOCATION
      ?auto_225446 - CITY
      ?auto_225444 - LOCATION
      ?auto_225445 - LOCATION
      ?auto_225443 - LOCATION
      ?auto_225442 - LOCATION
      ?auto_225448 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_225447 ?auto_225446 ) ( IN-CITY ?auto_225436 ?auto_225446 ) ( not ( = ?auto_225436 ?auto_225447 ) ) ( OBJ-AT ?auto_225441 ?auto_225447 ) ( IN-CITY ?auto_225444 ?auto_225446 ) ( not ( = ?auto_225436 ?auto_225444 ) ) ( OBJ-AT ?auto_225437 ?auto_225444 ) ( IN-CITY ?auto_225445 ?auto_225446 ) ( not ( = ?auto_225436 ?auto_225445 ) ) ( OBJ-AT ?auto_225438 ?auto_225445 ) ( IN-CITY ?auto_225443 ?auto_225446 ) ( not ( = ?auto_225436 ?auto_225443 ) ) ( OBJ-AT ?auto_225440 ?auto_225443 ) ( IN-CITY ?auto_225442 ?auto_225446 ) ( not ( = ?auto_225436 ?auto_225442 ) ) ( OBJ-AT ?auto_225439 ?auto_225442 ) ( TRUCK-AT ?auto_225448 ?auto_225436 ) ( not ( = ?auto_225439 ?auto_225440 ) ) ( not ( = ?auto_225443 ?auto_225442 ) ) ( not ( = ?auto_225439 ?auto_225438 ) ) ( not ( = ?auto_225440 ?auto_225438 ) ) ( not ( = ?auto_225445 ?auto_225443 ) ) ( not ( = ?auto_225445 ?auto_225442 ) ) ( not ( = ?auto_225439 ?auto_225437 ) ) ( not ( = ?auto_225440 ?auto_225437 ) ) ( not ( = ?auto_225438 ?auto_225437 ) ) ( not ( = ?auto_225444 ?auto_225445 ) ) ( not ( = ?auto_225444 ?auto_225443 ) ) ( not ( = ?auto_225444 ?auto_225442 ) ) ( not ( = ?auto_225439 ?auto_225441 ) ) ( not ( = ?auto_225440 ?auto_225441 ) ) ( not ( = ?auto_225438 ?auto_225441 ) ) ( not ( = ?auto_225437 ?auto_225441 ) ) ( not ( = ?auto_225447 ?auto_225444 ) ) ( not ( = ?auto_225447 ?auto_225445 ) ) ( not ( = ?auto_225447 ?auto_225443 ) ) ( not ( = ?auto_225447 ?auto_225442 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_225439 ?auto_225440 ?auto_225438 ?auto_225441 ?auto_225437 ?auto_225436 )
      ( DELIVER-5PKG-VERIFY ?auto_225437 ?auto_225438 ?auto_225439 ?auto_225440 ?auto_225441 ?auto_225436 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225492 - OBJ
      ?auto_225493 - OBJ
      ?auto_225494 - OBJ
      ?auto_225495 - OBJ
      ?auto_225496 - OBJ
      ?auto_225491 - LOCATION
    )
    :vars
    (
      ?auto_225502 - LOCATION
      ?auto_225501 - CITY
      ?auto_225499 - LOCATION
      ?auto_225500 - LOCATION
      ?auto_225498 - LOCATION
      ?auto_225497 - LOCATION
      ?auto_225503 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_225502 ?auto_225501 ) ( IN-CITY ?auto_225491 ?auto_225501 ) ( not ( = ?auto_225491 ?auto_225502 ) ) ( OBJ-AT ?auto_225495 ?auto_225502 ) ( IN-CITY ?auto_225499 ?auto_225501 ) ( not ( = ?auto_225491 ?auto_225499 ) ) ( OBJ-AT ?auto_225492 ?auto_225499 ) ( IN-CITY ?auto_225500 ?auto_225501 ) ( not ( = ?auto_225491 ?auto_225500 ) ) ( OBJ-AT ?auto_225493 ?auto_225500 ) ( IN-CITY ?auto_225498 ?auto_225501 ) ( not ( = ?auto_225491 ?auto_225498 ) ) ( OBJ-AT ?auto_225496 ?auto_225498 ) ( IN-CITY ?auto_225497 ?auto_225501 ) ( not ( = ?auto_225491 ?auto_225497 ) ) ( OBJ-AT ?auto_225494 ?auto_225497 ) ( TRUCK-AT ?auto_225503 ?auto_225491 ) ( not ( = ?auto_225494 ?auto_225496 ) ) ( not ( = ?auto_225498 ?auto_225497 ) ) ( not ( = ?auto_225494 ?auto_225493 ) ) ( not ( = ?auto_225496 ?auto_225493 ) ) ( not ( = ?auto_225500 ?auto_225498 ) ) ( not ( = ?auto_225500 ?auto_225497 ) ) ( not ( = ?auto_225494 ?auto_225492 ) ) ( not ( = ?auto_225496 ?auto_225492 ) ) ( not ( = ?auto_225493 ?auto_225492 ) ) ( not ( = ?auto_225499 ?auto_225500 ) ) ( not ( = ?auto_225499 ?auto_225498 ) ) ( not ( = ?auto_225499 ?auto_225497 ) ) ( not ( = ?auto_225494 ?auto_225495 ) ) ( not ( = ?auto_225496 ?auto_225495 ) ) ( not ( = ?auto_225493 ?auto_225495 ) ) ( not ( = ?auto_225492 ?auto_225495 ) ) ( not ( = ?auto_225502 ?auto_225499 ) ) ( not ( = ?auto_225502 ?auto_225500 ) ) ( not ( = ?auto_225502 ?auto_225498 ) ) ( not ( = ?auto_225502 ?auto_225497 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_225494 ?auto_225496 ?auto_225493 ?auto_225495 ?auto_225492 ?auto_225491 )
      ( DELIVER-5PKG-VERIFY ?auto_225492 ?auto_225493 ?auto_225494 ?auto_225495 ?auto_225496 ?auto_225491 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225547 - OBJ
      ?auto_225548 - OBJ
      ?auto_225549 - OBJ
      ?auto_225550 - OBJ
      ?auto_225551 - OBJ
      ?auto_225546 - LOCATION
    )
    :vars
    (
      ?auto_225557 - LOCATION
      ?auto_225556 - CITY
      ?auto_225554 - LOCATION
      ?auto_225555 - LOCATION
      ?auto_225553 - LOCATION
      ?auto_225552 - LOCATION
      ?auto_225558 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_225557 ?auto_225556 ) ( IN-CITY ?auto_225546 ?auto_225556 ) ( not ( = ?auto_225546 ?auto_225557 ) ) ( OBJ-AT ?auto_225551 ?auto_225557 ) ( IN-CITY ?auto_225554 ?auto_225556 ) ( not ( = ?auto_225546 ?auto_225554 ) ) ( OBJ-AT ?auto_225547 ?auto_225554 ) ( IN-CITY ?auto_225555 ?auto_225556 ) ( not ( = ?auto_225546 ?auto_225555 ) ) ( OBJ-AT ?auto_225548 ?auto_225555 ) ( IN-CITY ?auto_225553 ?auto_225556 ) ( not ( = ?auto_225546 ?auto_225553 ) ) ( OBJ-AT ?auto_225549 ?auto_225553 ) ( IN-CITY ?auto_225552 ?auto_225556 ) ( not ( = ?auto_225546 ?auto_225552 ) ) ( OBJ-AT ?auto_225550 ?auto_225552 ) ( TRUCK-AT ?auto_225558 ?auto_225546 ) ( not ( = ?auto_225550 ?auto_225549 ) ) ( not ( = ?auto_225553 ?auto_225552 ) ) ( not ( = ?auto_225550 ?auto_225548 ) ) ( not ( = ?auto_225549 ?auto_225548 ) ) ( not ( = ?auto_225555 ?auto_225553 ) ) ( not ( = ?auto_225555 ?auto_225552 ) ) ( not ( = ?auto_225550 ?auto_225547 ) ) ( not ( = ?auto_225549 ?auto_225547 ) ) ( not ( = ?auto_225548 ?auto_225547 ) ) ( not ( = ?auto_225554 ?auto_225555 ) ) ( not ( = ?auto_225554 ?auto_225553 ) ) ( not ( = ?auto_225554 ?auto_225552 ) ) ( not ( = ?auto_225550 ?auto_225551 ) ) ( not ( = ?auto_225549 ?auto_225551 ) ) ( not ( = ?auto_225548 ?auto_225551 ) ) ( not ( = ?auto_225547 ?auto_225551 ) ) ( not ( = ?auto_225557 ?auto_225554 ) ) ( not ( = ?auto_225557 ?auto_225555 ) ) ( not ( = ?auto_225557 ?auto_225553 ) ) ( not ( = ?auto_225557 ?auto_225552 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_225550 ?auto_225549 ?auto_225548 ?auto_225551 ?auto_225547 ?auto_225546 )
      ( DELIVER-5PKG-VERIFY ?auto_225547 ?auto_225548 ?auto_225549 ?auto_225550 ?auto_225551 ?auto_225546 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225602 - OBJ
      ?auto_225603 - OBJ
      ?auto_225604 - OBJ
      ?auto_225605 - OBJ
      ?auto_225606 - OBJ
      ?auto_225601 - LOCATION
    )
    :vars
    (
      ?auto_225612 - LOCATION
      ?auto_225611 - CITY
      ?auto_225609 - LOCATION
      ?auto_225610 - LOCATION
      ?auto_225608 - LOCATION
      ?auto_225607 - LOCATION
      ?auto_225613 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_225612 ?auto_225611 ) ( IN-CITY ?auto_225601 ?auto_225611 ) ( not ( = ?auto_225601 ?auto_225612 ) ) ( OBJ-AT ?auto_225605 ?auto_225612 ) ( IN-CITY ?auto_225609 ?auto_225611 ) ( not ( = ?auto_225601 ?auto_225609 ) ) ( OBJ-AT ?auto_225602 ?auto_225609 ) ( IN-CITY ?auto_225610 ?auto_225611 ) ( not ( = ?auto_225601 ?auto_225610 ) ) ( OBJ-AT ?auto_225603 ?auto_225610 ) ( IN-CITY ?auto_225608 ?auto_225611 ) ( not ( = ?auto_225601 ?auto_225608 ) ) ( OBJ-AT ?auto_225604 ?auto_225608 ) ( IN-CITY ?auto_225607 ?auto_225611 ) ( not ( = ?auto_225601 ?auto_225607 ) ) ( OBJ-AT ?auto_225606 ?auto_225607 ) ( TRUCK-AT ?auto_225613 ?auto_225601 ) ( not ( = ?auto_225606 ?auto_225604 ) ) ( not ( = ?auto_225608 ?auto_225607 ) ) ( not ( = ?auto_225606 ?auto_225603 ) ) ( not ( = ?auto_225604 ?auto_225603 ) ) ( not ( = ?auto_225610 ?auto_225608 ) ) ( not ( = ?auto_225610 ?auto_225607 ) ) ( not ( = ?auto_225606 ?auto_225602 ) ) ( not ( = ?auto_225604 ?auto_225602 ) ) ( not ( = ?auto_225603 ?auto_225602 ) ) ( not ( = ?auto_225609 ?auto_225610 ) ) ( not ( = ?auto_225609 ?auto_225608 ) ) ( not ( = ?auto_225609 ?auto_225607 ) ) ( not ( = ?auto_225606 ?auto_225605 ) ) ( not ( = ?auto_225604 ?auto_225605 ) ) ( not ( = ?auto_225603 ?auto_225605 ) ) ( not ( = ?auto_225602 ?auto_225605 ) ) ( not ( = ?auto_225612 ?auto_225609 ) ) ( not ( = ?auto_225612 ?auto_225610 ) ) ( not ( = ?auto_225612 ?auto_225608 ) ) ( not ( = ?auto_225612 ?auto_225607 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_225606 ?auto_225604 ?auto_225603 ?auto_225605 ?auto_225602 ?auto_225601 )
      ( DELIVER-5PKG-VERIFY ?auto_225602 ?auto_225603 ?auto_225604 ?auto_225605 ?auto_225606 ?auto_225601 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225947 - OBJ
      ?auto_225948 - OBJ
      ?auto_225949 - OBJ
      ?auto_225950 - OBJ
      ?auto_225951 - OBJ
      ?auto_225946 - LOCATION
    )
    :vars
    (
      ?auto_225957 - LOCATION
      ?auto_225956 - CITY
      ?auto_225954 - LOCATION
      ?auto_225955 - LOCATION
      ?auto_225953 - LOCATION
      ?auto_225952 - LOCATION
      ?auto_225958 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_225957 ?auto_225956 ) ( IN-CITY ?auto_225946 ?auto_225956 ) ( not ( = ?auto_225946 ?auto_225957 ) ) ( OBJ-AT ?auto_225949 ?auto_225957 ) ( IN-CITY ?auto_225954 ?auto_225956 ) ( not ( = ?auto_225946 ?auto_225954 ) ) ( OBJ-AT ?auto_225947 ?auto_225954 ) ( IN-CITY ?auto_225955 ?auto_225956 ) ( not ( = ?auto_225946 ?auto_225955 ) ) ( OBJ-AT ?auto_225948 ?auto_225955 ) ( IN-CITY ?auto_225953 ?auto_225956 ) ( not ( = ?auto_225946 ?auto_225953 ) ) ( OBJ-AT ?auto_225951 ?auto_225953 ) ( IN-CITY ?auto_225952 ?auto_225956 ) ( not ( = ?auto_225946 ?auto_225952 ) ) ( OBJ-AT ?auto_225950 ?auto_225952 ) ( TRUCK-AT ?auto_225958 ?auto_225946 ) ( not ( = ?auto_225950 ?auto_225951 ) ) ( not ( = ?auto_225953 ?auto_225952 ) ) ( not ( = ?auto_225950 ?auto_225948 ) ) ( not ( = ?auto_225951 ?auto_225948 ) ) ( not ( = ?auto_225955 ?auto_225953 ) ) ( not ( = ?auto_225955 ?auto_225952 ) ) ( not ( = ?auto_225950 ?auto_225947 ) ) ( not ( = ?auto_225951 ?auto_225947 ) ) ( not ( = ?auto_225948 ?auto_225947 ) ) ( not ( = ?auto_225954 ?auto_225955 ) ) ( not ( = ?auto_225954 ?auto_225953 ) ) ( not ( = ?auto_225954 ?auto_225952 ) ) ( not ( = ?auto_225950 ?auto_225949 ) ) ( not ( = ?auto_225951 ?auto_225949 ) ) ( not ( = ?auto_225948 ?auto_225949 ) ) ( not ( = ?auto_225947 ?auto_225949 ) ) ( not ( = ?auto_225957 ?auto_225954 ) ) ( not ( = ?auto_225957 ?auto_225955 ) ) ( not ( = ?auto_225957 ?auto_225953 ) ) ( not ( = ?auto_225957 ?auto_225952 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_225950 ?auto_225951 ?auto_225948 ?auto_225949 ?auto_225947 ?auto_225946 )
      ( DELIVER-5PKG-VERIFY ?auto_225947 ?auto_225948 ?auto_225949 ?auto_225950 ?auto_225951 ?auto_225946 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_226002 - OBJ
      ?auto_226003 - OBJ
      ?auto_226004 - OBJ
      ?auto_226005 - OBJ
      ?auto_226006 - OBJ
      ?auto_226001 - LOCATION
    )
    :vars
    (
      ?auto_226012 - LOCATION
      ?auto_226011 - CITY
      ?auto_226009 - LOCATION
      ?auto_226010 - LOCATION
      ?auto_226008 - LOCATION
      ?auto_226007 - LOCATION
      ?auto_226013 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_226012 ?auto_226011 ) ( IN-CITY ?auto_226001 ?auto_226011 ) ( not ( = ?auto_226001 ?auto_226012 ) ) ( OBJ-AT ?auto_226004 ?auto_226012 ) ( IN-CITY ?auto_226009 ?auto_226011 ) ( not ( = ?auto_226001 ?auto_226009 ) ) ( OBJ-AT ?auto_226002 ?auto_226009 ) ( IN-CITY ?auto_226010 ?auto_226011 ) ( not ( = ?auto_226001 ?auto_226010 ) ) ( OBJ-AT ?auto_226003 ?auto_226010 ) ( IN-CITY ?auto_226008 ?auto_226011 ) ( not ( = ?auto_226001 ?auto_226008 ) ) ( OBJ-AT ?auto_226005 ?auto_226008 ) ( IN-CITY ?auto_226007 ?auto_226011 ) ( not ( = ?auto_226001 ?auto_226007 ) ) ( OBJ-AT ?auto_226006 ?auto_226007 ) ( TRUCK-AT ?auto_226013 ?auto_226001 ) ( not ( = ?auto_226006 ?auto_226005 ) ) ( not ( = ?auto_226008 ?auto_226007 ) ) ( not ( = ?auto_226006 ?auto_226003 ) ) ( not ( = ?auto_226005 ?auto_226003 ) ) ( not ( = ?auto_226010 ?auto_226008 ) ) ( not ( = ?auto_226010 ?auto_226007 ) ) ( not ( = ?auto_226006 ?auto_226002 ) ) ( not ( = ?auto_226005 ?auto_226002 ) ) ( not ( = ?auto_226003 ?auto_226002 ) ) ( not ( = ?auto_226009 ?auto_226010 ) ) ( not ( = ?auto_226009 ?auto_226008 ) ) ( not ( = ?auto_226009 ?auto_226007 ) ) ( not ( = ?auto_226006 ?auto_226004 ) ) ( not ( = ?auto_226005 ?auto_226004 ) ) ( not ( = ?auto_226003 ?auto_226004 ) ) ( not ( = ?auto_226002 ?auto_226004 ) ) ( not ( = ?auto_226012 ?auto_226009 ) ) ( not ( = ?auto_226012 ?auto_226010 ) ) ( not ( = ?auto_226012 ?auto_226008 ) ) ( not ( = ?auto_226012 ?auto_226007 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_226006 ?auto_226005 ?auto_226003 ?auto_226004 ?auto_226002 ?auto_226001 )
      ( DELIVER-5PKG-VERIFY ?auto_226002 ?auto_226003 ?auto_226004 ?auto_226005 ?auto_226006 ?auto_226001 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227295 - OBJ
      ?auto_227296 - OBJ
      ?auto_227297 - OBJ
      ?auto_227298 - OBJ
      ?auto_227299 - OBJ
      ?auto_227294 - LOCATION
    )
    :vars
    (
      ?auto_227305 - LOCATION
      ?auto_227304 - CITY
      ?auto_227302 - LOCATION
      ?auto_227303 - LOCATION
      ?auto_227301 - LOCATION
      ?auto_227300 - LOCATION
      ?auto_227306 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_227305 ?auto_227304 ) ( IN-CITY ?auto_227294 ?auto_227304 ) ( not ( = ?auto_227294 ?auto_227305 ) ) ( OBJ-AT ?auto_227296 ?auto_227305 ) ( IN-CITY ?auto_227302 ?auto_227304 ) ( not ( = ?auto_227294 ?auto_227302 ) ) ( OBJ-AT ?auto_227295 ?auto_227302 ) ( IN-CITY ?auto_227303 ?auto_227304 ) ( not ( = ?auto_227294 ?auto_227303 ) ) ( OBJ-AT ?auto_227299 ?auto_227303 ) ( IN-CITY ?auto_227301 ?auto_227304 ) ( not ( = ?auto_227294 ?auto_227301 ) ) ( OBJ-AT ?auto_227298 ?auto_227301 ) ( IN-CITY ?auto_227300 ?auto_227304 ) ( not ( = ?auto_227294 ?auto_227300 ) ) ( OBJ-AT ?auto_227297 ?auto_227300 ) ( TRUCK-AT ?auto_227306 ?auto_227294 ) ( not ( = ?auto_227297 ?auto_227298 ) ) ( not ( = ?auto_227301 ?auto_227300 ) ) ( not ( = ?auto_227297 ?auto_227299 ) ) ( not ( = ?auto_227298 ?auto_227299 ) ) ( not ( = ?auto_227303 ?auto_227301 ) ) ( not ( = ?auto_227303 ?auto_227300 ) ) ( not ( = ?auto_227297 ?auto_227295 ) ) ( not ( = ?auto_227298 ?auto_227295 ) ) ( not ( = ?auto_227299 ?auto_227295 ) ) ( not ( = ?auto_227302 ?auto_227303 ) ) ( not ( = ?auto_227302 ?auto_227301 ) ) ( not ( = ?auto_227302 ?auto_227300 ) ) ( not ( = ?auto_227297 ?auto_227296 ) ) ( not ( = ?auto_227298 ?auto_227296 ) ) ( not ( = ?auto_227299 ?auto_227296 ) ) ( not ( = ?auto_227295 ?auto_227296 ) ) ( not ( = ?auto_227305 ?auto_227302 ) ) ( not ( = ?auto_227305 ?auto_227303 ) ) ( not ( = ?auto_227305 ?auto_227301 ) ) ( not ( = ?auto_227305 ?auto_227300 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_227297 ?auto_227298 ?auto_227299 ?auto_227296 ?auto_227295 ?auto_227294 )
      ( DELIVER-5PKG-VERIFY ?auto_227295 ?auto_227296 ?auto_227297 ?auto_227298 ?auto_227299 ?auto_227294 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227350 - OBJ
      ?auto_227351 - OBJ
      ?auto_227352 - OBJ
      ?auto_227353 - OBJ
      ?auto_227354 - OBJ
      ?auto_227349 - LOCATION
    )
    :vars
    (
      ?auto_227360 - LOCATION
      ?auto_227359 - CITY
      ?auto_227357 - LOCATION
      ?auto_227358 - LOCATION
      ?auto_227356 - LOCATION
      ?auto_227355 - LOCATION
      ?auto_227361 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_227360 ?auto_227359 ) ( IN-CITY ?auto_227349 ?auto_227359 ) ( not ( = ?auto_227349 ?auto_227360 ) ) ( OBJ-AT ?auto_227351 ?auto_227360 ) ( IN-CITY ?auto_227357 ?auto_227359 ) ( not ( = ?auto_227349 ?auto_227357 ) ) ( OBJ-AT ?auto_227350 ?auto_227357 ) ( IN-CITY ?auto_227358 ?auto_227359 ) ( not ( = ?auto_227349 ?auto_227358 ) ) ( OBJ-AT ?auto_227353 ?auto_227358 ) ( IN-CITY ?auto_227356 ?auto_227359 ) ( not ( = ?auto_227349 ?auto_227356 ) ) ( OBJ-AT ?auto_227354 ?auto_227356 ) ( IN-CITY ?auto_227355 ?auto_227359 ) ( not ( = ?auto_227349 ?auto_227355 ) ) ( OBJ-AT ?auto_227352 ?auto_227355 ) ( TRUCK-AT ?auto_227361 ?auto_227349 ) ( not ( = ?auto_227352 ?auto_227354 ) ) ( not ( = ?auto_227356 ?auto_227355 ) ) ( not ( = ?auto_227352 ?auto_227353 ) ) ( not ( = ?auto_227354 ?auto_227353 ) ) ( not ( = ?auto_227358 ?auto_227356 ) ) ( not ( = ?auto_227358 ?auto_227355 ) ) ( not ( = ?auto_227352 ?auto_227350 ) ) ( not ( = ?auto_227354 ?auto_227350 ) ) ( not ( = ?auto_227353 ?auto_227350 ) ) ( not ( = ?auto_227357 ?auto_227358 ) ) ( not ( = ?auto_227357 ?auto_227356 ) ) ( not ( = ?auto_227357 ?auto_227355 ) ) ( not ( = ?auto_227352 ?auto_227351 ) ) ( not ( = ?auto_227354 ?auto_227351 ) ) ( not ( = ?auto_227353 ?auto_227351 ) ) ( not ( = ?auto_227350 ?auto_227351 ) ) ( not ( = ?auto_227360 ?auto_227357 ) ) ( not ( = ?auto_227360 ?auto_227358 ) ) ( not ( = ?auto_227360 ?auto_227356 ) ) ( not ( = ?auto_227360 ?auto_227355 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_227352 ?auto_227354 ?auto_227353 ?auto_227351 ?auto_227350 ?auto_227349 )
      ( DELIVER-5PKG-VERIFY ?auto_227350 ?auto_227351 ?auto_227352 ?auto_227353 ?auto_227354 ?auto_227349 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227579 - OBJ
      ?auto_227580 - OBJ
      ?auto_227581 - OBJ
      ?auto_227582 - OBJ
      ?auto_227583 - OBJ
      ?auto_227578 - LOCATION
    )
    :vars
    (
      ?auto_227589 - LOCATION
      ?auto_227588 - CITY
      ?auto_227586 - LOCATION
      ?auto_227587 - LOCATION
      ?auto_227585 - LOCATION
      ?auto_227584 - LOCATION
      ?auto_227590 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_227589 ?auto_227588 ) ( IN-CITY ?auto_227578 ?auto_227588 ) ( not ( = ?auto_227578 ?auto_227589 ) ) ( OBJ-AT ?auto_227580 ?auto_227589 ) ( IN-CITY ?auto_227586 ?auto_227588 ) ( not ( = ?auto_227578 ?auto_227586 ) ) ( OBJ-AT ?auto_227579 ?auto_227586 ) ( IN-CITY ?auto_227587 ?auto_227588 ) ( not ( = ?auto_227578 ?auto_227587 ) ) ( OBJ-AT ?auto_227583 ?auto_227587 ) ( IN-CITY ?auto_227585 ?auto_227588 ) ( not ( = ?auto_227578 ?auto_227585 ) ) ( OBJ-AT ?auto_227581 ?auto_227585 ) ( IN-CITY ?auto_227584 ?auto_227588 ) ( not ( = ?auto_227578 ?auto_227584 ) ) ( OBJ-AT ?auto_227582 ?auto_227584 ) ( TRUCK-AT ?auto_227590 ?auto_227578 ) ( not ( = ?auto_227582 ?auto_227581 ) ) ( not ( = ?auto_227585 ?auto_227584 ) ) ( not ( = ?auto_227582 ?auto_227583 ) ) ( not ( = ?auto_227581 ?auto_227583 ) ) ( not ( = ?auto_227587 ?auto_227585 ) ) ( not ( = ?auto_227587 ?auto_227584 ) ) ( not ( = ?auto_227582 ?auto_227579 ) ) ( not ( = ?auto_227581 ?auto_227579 ) ) ( not ( = ?auto_227583 ?auto_227579 ) ) ( not ( = ?auto_227586 ?auto_227587 ) ) ( not ( = ?auto_227586 ?auto_227585 ) ) ( not ( = ?auto_227586 ?auto_227584 ) ) ( not ( = ?auto_227582 ?auto_227580 ) ) ( not ( = ?auto_227581 ?auto_227580 ) ) ( not ( = ?auto_227583 ?auto_227580 ) ) ( not ( = ?auto_227579 ?auto_227580 ) ) ( not ( = ?auto_227589 ?auto_227586 ) ) ( not ( = ?auto_227589 ?auto_227587 ) ) ( not ( = ?auto_227589 ?auto_227585 ) ) ( not ( = ?auto_227589 ?auto_227584 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_227582 ?auto_227581 ?auto_227583 ?auto_227580 ?auto_227579 ?auto_227578 )
      ( DELIVER-5PKG-VERIFY ?auto_227579 ?auto_227580 ?auto_227581 ?auto_227582 ?auto_227583 ?auto_227578 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227693 - OBJ
      ?auto_227694 - OBJ
      ?auto_227695 - OBJ
      ?auto_227696 - OBJ
      ?auto_227697 - OBJ
      ?auto_227692 - LOCATION
    )
    :vars
    (
      ?auto_227703 - LOCATION
      ?auto_227702 - CITY
      ?auto_227700 - LOCATION
      ?auto_227701 - LOCATION
      ?auto_227699 - LOCATION
      ?auto_227698 - LOCATION
      ?auto_227704 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_227703 ?auto_227702 ) ( IN-CITY ?auto_227692 ?auto_227702 ) ( not ( = ?auto_227692 ?auto_227703 ) ) ( OBJ-AT ?auto_227694 ?auto_227703 ) ( IN-CITY ?auto_227700 ?auto_227702 ) ( not ( = ?auto_227692 ?auto_227700 ) ) ( OBJ-AT ?auto_227693 ?auto_227700 ) ( IN-CITY ?auto_227701 ?auto_227702 ) ( not ( = ?auto_227692 ?auto_227701 ) ) ( OBJ-AT ?auto_227696 ?auto_227701 ) ( IN-CITY ?auto_227699 ?auto_227702 ) ( not ( = ?auto_227692 ?auto_227699 ) ) ( OBJ-AT ?auto_227695 ?auto_227699 ) ( IN-CITY ?auto_227698 ?auto_227702 ) ( not ( = ?auto_227692 ?auto_227698 ) ) ( OBJ-AT ?auto_227697 ?auto_227698 ) ( TRUCK-AT ?auto_227704 ?auto_227692 ) ( not ( = ?auto_227697 ?auto_227695 ) ) ( not ( = ?auto_227699 ?auto_227698 ) ) ( not ( = ?auto_227697 ?auto_227696 ) ) ( not ( = ?auto_227695 ?auto_227696 ) ) ( not ( = ?auto_227701 ?auto_227699 ) ) ( not ( = ?auto_227701 ?auto_227698 ) ) ( not ( = ?auto_227697 ?auto_227693 ) ) ( not ( = ?auto_227695 ?auto_227693 ) ) ( not ( = ?auto_227696 ?auto_227693 ) ) ( not ( = ?auto_227700 ?auto_227701 ) ) ( not ( = ?auto_227700 ?auto_227699 ) ) ( not ( = ?auto_227700 ?auto_227698 ) ) ( not ( = ?auto_227697 ?auto_227694 ) ) ( not ( = ?auto_227695 ?auto_227694 ) ) ( not ( = ?auto_227696 ?auto_227694 ) ) ( not ( = ?auto_227693 ?auto_227694 ) ) ( not ( = ?auto_227703 ?auto_227700 ) ) ( not ( = ?auto_227703 ?auto_227701 ) ) ( not ( = ?auto_227703 ?auto_227699 ) ) ( not ( = ?auto_227703 ?auto_227698 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_227697 ?auto_227695 ?auto_227696 ?auto_227694 ?auto_227693 ?auto_227692 )
      ( DELIVER-5PKG-VERIFY ?auto_227693 ?auto_227694 ?auto_227695 ?auto_227696 ?auto_227697 ?auto_227692 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227922 - OBJ
      ?auto_227923 - OBJ
      ?auto_227924 - OBJ
      ?auto_227925 - OBJ
      ?auto_227926 - OBJ
      ?auto_227921 - LOCATION
    )
    :vars
    (
      ?auto_227932 - LOCATION
      ?auto_227931 - CITY
      ?auto_227929 - LOCATION
      ?auto_227930 - LOCATION
      ?auto_227928 - LOCATION
      ?auto_227927 - LOCATION
      ?auto_227933 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_227932 ?auto_227931 ) ( IN-CITY ?auto_227921 ?auto_227931 ) ( not ( = ?auto_227921 ?auto_227932 ) ) ( OBJ-AT ?auto_227923 ?auto_227932 ) ( IN-CITY ?auto_227929 ?auto_227931 ) ( not ( = ?auto_227921 ?auto_227929 ) ) ( OBJ-AT ?auto_227922 ?auto_227929 ) ( IN-CITY ?auto_227930 ?auto_227931 ) ( not ( = ?auto_227921 ?auto_227930 ) ) ( OBJ-AT ?auto_227924 ?auto_227930 ) ( IN-CITY ?auto_227928 ?auto_227931 ) ( not ( = ?auto_227921 ?auto_227928 ) ) ( OBJ-AT ?auto_227926 ?auto_227928 ) ( IN-CITY ?auto_227927 ?auto_227931 ) ( not ( = ?auto_227921 ?auto_227927 ) ) ( OBJ-AT ?auto_227925 ?auto_227927 ) ( TRUCK-AT ?auto_227933 ?auto_227921 ) ( not ( = ?auto_227925 ?auto_227926 ) ) ( not ( = ?auto_227928 ?auto_227927 ) ) ( not ( = ?auto_227925 ?auto_227924 ) ) ( not ( = ?auto_227926 ?auto_227924 ) ) ( not ( = ?auto_227930 ?auto_227928 ) ) ( not ( = ?auto_227930 ?auto_227927 ) ) ( not ( = ?auto_227925 ?auto_227922 ) ) ( not ( = ?auto_227926 ?auto_227922 ) ) ( not ( = ?auto_227924 ?auto_227922 ) ) ( not ( = ?auto_227929 ?auto_227930 ) ) ( not ( = ?auto_227929 ?auto_227928 ) ) ( not ( = ?auto_227929 ?auto_227927 ) ) ( not ( = ?auto_227925 ?auto_227923 ) ) ( not ( = ?auto_227926 ?auto_227923 ) ) ( not ( = ?auto_227924 ?auto_227923 ) ) ( not ( = ?auto_227922 ?auto_227923 ) ) ( not ( = ?auto_227932 ?auto_227929 ) ) ( not ( = ?auto_227932 ?auto_227930 ) ) ( not ( = ?auto_227932 ?auto_227928 ) ) ( not ( = ?auto_227932 ?auto_227927 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_227925 ?auto_227926 ?auto_227924 ?auto_227923 ?auto_227922 ?auto_227921 )
      ( DELIVER-5PKG-VERIFY ?auto_227922 ?auto_227923 ?auto_227924 ?auto_227925 ?auto_227926 ?auto_227921 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227977 - OBJ
      ?auto_227978 - OBJ
      ?auto_227979 - OBJ
      ?auto_227980 - OBJ
      ?auto_227981 - OBJ
      ?auto_227976 - LOCATION
    )
    :vars
    (
      ?auto_227987 - LOCATION
      ?auto_227986 - CITY
      ?auto_227984 - LOCATION
      ?auto_227985 - LOCATION
      ?auto_227983 - LOCATION
      ?auto_227982 - LOCATION
      ?auto_227988 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_227987 ?auto_227986 ) ( IN-CITY ?auto_227976 ?auto_227986 ) ( not ( = ?auto_227976 ?auto_227987 ) ) ( OBJ-AT ?auto_227978 ?auto_227987 ) ( IN-CITY ?auto_227984 ?auto_227986 ) ( not ( = ?auto_227976 ?auto_227984 ) ) ( OBJ-AT ?auto_227977 ?auto_227984 ) ( IN-CITY ?auto_227985 ?auto_227986 ) ( not ( = ?auto_227976 ?auto_227985 ) ) ( OBJ-AT ?auto_227979 ?auto_227985 ) ( IN-CITY ?auto_227983 ?auto_227986 ) ( not ( = ?auto_227976 ?auto_227983 ) ) ( OBJ-AT ?auto_227980 ?auto_227983 ) ( IN-CITY ?auto_227982 ?auto_227986 ) ( not ( = ?auto_227976 ?auto_227982 ) ) ( OBJ-AT ?auto_227981 ?auto_227982 ) ( TRUCK-AT ?auto_227988 ?auto_227976 ) ( not ( = ?auto_227981 ?auto_227980 ) ) ( not ( = ?auto_227983 ?auto_227982 ) ) ( not ( = ?auto_227981 ?auto_227979 ) ) ( not ( = ?auto_227980 ?auto_227979 ) ) ( not ( = ?auto_227985 ?auto_227983 ) ) ( not ( = ?auto_227985 ?auto_227982 ) ) ( not ( = ?auto_227981 ?auto_227977 ) ) ( not ( = ?auto_227980 ?auto_227977 ) ) ( not ( = ?auto_227979 ?auto_227977 ) ) ( not ( = ?auto_227984 ?auto_227985 ) ) ( not ( = ?auto_227984 ?auto_227983 ) ) ( not ( = ?auto_227984 ?auto_227982 ) ) ( not ( = ?auto_227981 ?auto_227978 ) ) ( not ( = ?auto_227980 ?auto_227978 ) ) ( not ( = ?auto_227979 ?auto_227978 ) ) ( not ( = ?auto_227977 ?auto_227978 ) ) ( not ( = ?auto_227987 ?auto_227984 ) ) ( not ( = ?auto_227987 ?auto_227985 ) ) ( not ( = ?auto_227987 ?auto_227983 ) ) ( not ( = ?auto_227987 ?auto_227982 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_227981 ?auto_227980 ?auto_227979 ?auto_227978 ?auto_227977 ?auto_227976 )
      ( DELIVER-5PKG-VERIFY ?auto_227977 ?auto_227978 ?auto_227979 ?auto_227980 ?auto_227981 ?auto_227976 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229572 - OBJ
      ?auto_229573 - OBJ
      ?auto_229574 - OBJ
      ?auto_229575 - OBJ
      ?auto_229576 - OBJ
      ?auto_229571 - LOCATION
    )
    :vars
    (
      ?auto_229582 - LOCATION
      ?auto_229581 - CITY
      ?auto_229579 - LOCATION
      ?auto_229580 - LOCATION
      ?auto_229578 - LOCATION
      ?auto_229577 - LOCATION
      ?auto_229583 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229582 ?auto_229581 ) ( IN-CITY ?auto_229571 ?auto_229581 ) ( not ( = ?auto_229571 ?auto_229582 ) ) ( OBJ-AT ?auto_229572 ?auto_229582 ) ( IN-CITY ?auto_229579 ?auto_229581 ) ( not ( = ?auto_229571 ?auto_229579 ) ) ( OBJ-AT ?auto_229576 ?auto_229579 ) ( IN-CITY ?auto_229580 ?auto_229581 ) ( not ( = ?auto_229571 ?auto_229580 ) ) ( OBJ-AT ?auto_229575 ?auto_229580 ) ( IN-CITY ?auto_229578 ?auto_229581 ) ( not ( = ?auto_229571 ?auto_229578 ) ) ( OBJ-AT ?auto_229574 ?auto_229578 ) ( IN-CITY ?auto_229577 ?auto_229581 ) ( not ( = ?auto_229571 ?auto_229577 ) ) ( OBJ-AT ?auto_229573 ?auto_229577 ) ( TRUCK-AT ?auto_229583 ?auto_229571 ) ( not ( = ?auto_229573 ?auto_229574 ) ) ( not ( = ?auto_229578 ?auto_229577 ) ) ( not ( = ?auto_229573 ?auto_229575 ) ) ( not ( = ?auto_229574 ?auto_229575 ) ) ( not ( = ?auto_229580 ?auto_229578 ) ) ( not ( = ?auto_229580 ?auto_229577 ) ) ( not ( = ?auto_229573 ?auto_229576 ) ) ( not ( = ?auto_229574 ?auto_229576 ) ) ( not ( = ?auto_229575 ?auto_229576 ) ) ( not ( = ?auto_229579 ?auto_229580 ) ) ( not ( = ?auto_229579 ?auto_229578 ) ) ( not ( = ?auto_229579 ?auto_229577 ) ) ( not ( = ?auto_229573 ?auto_229572 ) ) ( not ( = ?auto_229574 ?auto_229572 ) ) ( not ( = ?auto_229575 ?auto_229572 ) ) ( not ( = ?auto_229576 ?auto_229572 ) ) ( not ( = ?auto_229582 ?auto_229579 ) ) ( not ( = ?auto_229582 ?auto_229580 ) ) ( not ( = ?auto_229582 ?auto_229578 ) ) ( not ( = ?auto_229582 ?auto_229577 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_229573 ?auto_229574 ?auto_229575 ?auto_229572 ?auto_229576 ?auto_229571 )
      ( DELIVER-5PKG-VERIFY ?auto_229572 ?auto_229573 ?auto_229574 ?auto_229575 ?auto_229576 ?auto_229571 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229627 - OBJ
      ?auto_229628 - OBJ
      ?auto_229629 - OBJ
      ?auto_229630 - OBJ
      ?auto_229631 - OBJ
      ?auto_229626 - LOCATION
    )
    :vars
    (
      ?auto_229637 - LOCATION
      ?auto_229636 - CITY
      ?auto_229634 - LOCATION
      ?auto_229635 - LOCATION
      ?auto_229633 - LOCATION
      ?auto_229632 - LOCATION
      ?auto_229638 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229637 ?auto_229636 ) ( IN-CITY ?auto_229626 ?auto_229636 ) ( not ( = ?auto_229626 ?auto_229637 ) ) ( OBJ-AT ?auto_229627 ?auto_229637 ) ( IN-CITY ?auto_229634 ?auto_229636 ) ( not ( = ?auto_229626 ?auto_229634 ) ) ( OBJ-AT ?auto_229630 ?auto_229634 ) ( IN-CITY ?auto_229635 ?auto_229636 ) ( not ( = ?auto_229626 ?auto_229635 ) ) ( OBJ-AT ?auto_229631 ?auto_229635 ) ( IN-CITY ?auto_229633 ?auto_229636 ) ( not ( = ?auto_229626 ?auto_229633 ) ) ( OBJ-AT ?auto_229629 ?auto_229633 ) ( IN-CITY ?auto_229632 ?auto_229636 ) ( not ( = ?auto_229626 ?auto_229632 ) ) ( OBJ-AT ?auto_229628 ?auto_229632 ) ( TRUCK-AT ?auto_229638 ?auto_229626 ) ( not ( = ?auto_229628 ?auto_229629 ) ) ( not ( = ?auto_229633 ?auto_229632 ) ) ( not ( = ?auto_229628 ?auto_229631 ) ) ( not ( = ?auto_229629 ?auto_229631 ) ) ( not ( = ?auto_229635 ?auto_229633 ) ) ( not ( = ?auto_229635 ?auto_229632 ) ) ( not ( = ?auto_229628 ?auto_229630 ) ) ( not ( = ?auto_229629 ?auto_229630 ) ) ( not ( = ?auto_229631 ?auto_229630 ) ) ( not ( = ?auto_229634 ?auto_229635 ) ) ( not ( = ?auto_229634 ?auto_229633 ) ) ( not ( = ?auto_229634 ?auto_229632 ) ) ( not ( = ?auto_229628 ?auto_229627 ) ) ( not ( = ?auto_229629 ?auto_229627 ) ) ( not ( = ?auto_229631 ?auto_229627 ) ) ( not ( = ?auto_229630 ?auto_229627 ) ) ( not ( = ?auto_229637 ?auto_229634 ) ) ( not ( = ?auto_229637 ?auto_229635 ) ) ( not ( = ?auto_229637 ?auto_229633 ) ) ( not ( = ?auto_229637 ?auto_229632 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_229628 ?auto_229629 ?auto_229631 ?auto_229627 ?auto_229630 ?auto_229626 )
      ( DELIVER-5PKG-VERIFY ?auto_229627 ?auto_229628 ?auto_229629 ?auto_229630 ?auto_229631 ?auto_229626 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229856 - OBJ
      ?auto_229857 - OBJ
      ?auto_229858 - OBJ
      ?auto_229859 - OBJ
      ?auto_229860 - OBJ
      ?auto_229855 - LOCATION
    )
    :vars
    (
      ?auto_229866 - LOCATION
      ?auto_229865 - CITY
      ?auto_229863 - LOCATION
      ?auto_229864 - LOCATION
      ?auto_229862 - LOCATION
      ?auto_229861 - LOCATION
      ?auto_229867 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229866 ?auto_229865 ) ( IN-CITY ?auto_229855 ?auto_229865 ) ( not ( = ?auto_229855 ?auto_229866 ) ) ( OBJ-AT ?auto_229856 ?auto_229866 ) ( IN-CITY ?auto_229863 ?auto_229865 ) ( not ( = ?auto_229855 ?auto_229863 ) ) ( OBJ-AT ?auto_229860 ?auto_229863 ) ( IN-CITY ?auto_229864 ?auto_229865 ) ( not ( = ?auto_229855 ?auto_229864 ) ) ( OBJ-AT ?auto_229858 ?auto_229864 ) ( IN-CITY ?auto_229862 ?auto_229865 ) ( not ( = ?auto_229855 ?auto_229862 ) ) ( OBJ-AT ?auto_229859 ?auto_229862 ) ( IN-CITY ?auto_229861 ?auto_229865 ) ( not ( = ?auto_229855 ?auto_229861 ) ) ( OBJ-AT ?auto_229857 ?auto_229861 ) ( TRUCK-AT ?auto_229867 ?auto_229855 ) ( not ( = ?auto_229857 ?auto_229859 ) ) ( not ( = ?auto_229862 ?auto_229861 ) ) ( not ( = ?auto_229857 ?auto_229858 ) ) ( not ( = ?auto_229859 ?auto_229858 ) ) ( not ( = ?auto_229864 ?auto_229862 ) ) ( not ( = ?auto_229864 ?auto_229861 ) ) ( not ( = ?auto_229857 ?auto_229860 ) ) ( not ( = ?auto_229859 ?auto_229860 ) ) ( not ( = ?auto_229858 ?auto_229860 ) ) ( not ( = ?auto_229863 ?auto_229864 ) ) ( not ( = ?auto_229863 ?auto_229862 ) ) ( not ( = ?auto_229863 ?auto_229861 ) ) ( not ( = ?auto_229857 ?auto_229856 ) ) ( not ( = ?auto_229859 ?auto_229856 ) ) ( not ( = ?auto_229858 ?auto_229856 ) ) ( not ( = ?auto_229860 ?auto_229856 ) ) ( not ( = ?auto_229866 ?auto_229863 ) ) ( not ( = ?auto_229866 ?auto_229864 ) ) ( not ( = ?auto_229866 ?auto_229862 ) ) ( not ( = ?auto_229866 ?auto_229861 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_229857 ?auto_229859 ?auto_229858 ?auto_229856 ?auto_229860 ?auto_229855 )
      ( DELIVER-5PKG-VERIFY ?auto_229856 ?auto_229857 ?auto_229858 ?auto_229859 ?auto_229860 ?auto_229855 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229970 - OBJ
      ?auto_229971 - OBJ
      ?auto_229972 - OBJ
      ?auto_229973 - OBJ
      ?auto_229974 - OBJ
      ?auto_229969 - LOCATION
    )
    :vars
    (
      ?auto_229980 - LOCATION
      ?auto_229979 - CITY
      ?auto_229977 - LOCATION
      ?auto_229978 - LOCATION
      ?auto_229976 - LOCATION
      ?auto_229975 - LOCATION
      ?auto_229981 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229980 ?auto_229979 ) ( IN-CITY ?auto_229969 ?auto_229979 ) ( not ( = ?auto_229969 ?auto_229980 ) ) ( OBJ-AT ?auto_229970 ?auto_229980 ) ( IN-CITY ?auto_229977 ?auto_229979 ) ( not ( = ?auto_229969 ?auto_229977 ) ) ( OBJ-AT ?auto_229973 ?auto_229977 ) ( IN-CITY ?auto_229978 ?auto_229979 ) ( not ( = ?auto_229969 ?auto_229978 ) ) ( OBJ-AT ?auto_229972 ?auto_229978 ) ( IN-CITY ?auto_229976 ?auto_229979 ) ( not ( = ?auto_229969 ?auto_229976 ) ) ( OBJ-AT ?auto_229974 ?auto_229976 ) ( IN-CITY ?auto_229975 ?auto_229979 ) ( not ( = ?auto_229969 ?auto_229975 ) ) ( OBJ-AT ?auto_229971 ?auto_229975 ) ( TRUCK-AT ?auto_229981 ?auto_229969 ) ( not ( = ?auto_229971 ?auto_229974 ) ) ( not ( = ?auto_229976 ?auto_229975 ) ) ( not ( = ?auto_229971 ?auto_229972 ) ) ( not ( = ?auto_229974 ?auto_229972 ) ) ( not ( = ?auto_229978 ?auto_229976 ) ) ( not ( = ?auto_229978 ?auto_229975 ) ) ( not ( = ?auto_229971 ?auto_229973 ) ) ( not ( = ?auto_229974 ?auto_229973 ) ) ( not ( = ?auto_229972 ?auto_229973 ) ) ( not ( = ?auto_229977 ?auto_229978 ) ) ( not ( = ?auto_229977 ?auto_229976 ) ) ( not ( = ?auto_229977 ?auto_229975 ) ) ( not ( = ?auto_229971 ?auto_229970 ) ) ( not ( = ?auto_229974 ?auto_229970 ) ) ( not ( = ?auto_229972 ?auto_229970 ) ) ( not ( = ?auto_229973 ?auto_229970 ) ) ( not ( = ?auto_229980 ?auto_229977 ) ) ( not ( = ?auto_229980 ?auto_229978 ) ) ( not ( = ?auto_229980 ?auto_229976 ) ) ( not ( = ?auto_229980 ?auto_229975 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_229971 ?auto_229974 ?auto_229972 ?auto_229970 ?auto_229973 ?auto_229969 )
      ( DELIVER-5PKG-VERIFY ?auto_229970 ?auto_229971 ?auto_229972 ?auto_229973 ?auto_229974 ?auto_229969 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230199 - OBJ
      ?auto_230200 - OBJ
      ?auto_230201 - OBJ
      ?auto_230202 - OBJ
      ?auto_230203 - OBJ
      ?auto_230198 - LOCATION
    )
    :vars
    (
      ?auto_230209 - LOCATION
      ?auto_230208 - CITY
      ?auto_230206 - LOCATION
      ?auto_230207 - LOCATION
      ?auto_230205 - LOCATION
      ?auto_230204 - LOCATION
      ?auto_230210 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230209 ?auto_230208 ) ( IN-CITY ?auto_230198 ?auto_230208 ) ( not ( = ?auto_230198 ?auto_230209 ) ) ( OBJ-AT ?auto_230199 ?auto_230209 ) ( IN-CITY ?auto_230206 ?auto_230208 ) ( not ( = ?auto_230198 ?auto_230206 ) ) ( OBJ-AT ?auto_230201 ?auto_230206 ) ( IN-CITY ?auto_230207 ?auto_230208 ) ( not ( = ?auto_230198 ?auto_230207 ) ) ( OBJ-AT ?auto_230203 ?auto_230207 ) ( IN-CITY ?auto_230205 ?auto_230208 ) ( not ( = ?auto_230198 ?auto_230205 ) ) ( OBJ-AT ?auto_230202 ?auto_230205 ) ( IN-CITY ?auto_230204 ?auto_230208 ) ( not ( = ?auto_230198 ?auto_230204 ) ) ( OBJ-AT ?auto_230200 ?auto_230204 ) ( TRUCK-AT ?auto_230210 ?auto_230198 ) ( not ( = ?auto_230200 ?auto_230202 ) ) ( not ( = ?auto_230205 ?auto_230204 ) ) ( not ( = ?auto_230200 ?auto_230203 ) ) ( not ( = ?auto_230202 ?auto_230203 ) ) ( not ( = ?auto_230207 ?auto_230205 ) ) ( not ( = ?auto_230207 ?auto_230204 ) ) ( not ( = ?auto_230200 ?auto_230201 ) ) ( not ( = ?auto_230202 ?auto_230201 ) ) ( not ( = ?auto_230203 ?auto_230201 ) ) ( not ( = ?auto_230206 ?auto_230207 ) ) ( not ( = ?auto_230206 ?auto_230205 ) ) ( not ( = ?auto_230206 ?auto_230204 ) ) ( not ( = ?auto_230200 ?auto_230199 ) ) ( not ( = ?auto_230202 ?auto_230199 ) ) ( not ( = ?auto_230203 ?auto_230199 ) ) ( not ( = ?auto_230201 ?auto_230199 ) ) ( not ( = ?auto_230209 ?auto_230206 ) ) ( not ( = ?auto_230209 ?auto_230207 ) ) ( not ( = ?auto_230209 ?auto_230205 ) ) ( not ( = ?auto_230209 ?auto_230204 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_230200 ?auto_230202 ?auto_230203 ?auto_230199 ?auto_230201 ?auto_230198 )
      ( DELIVER-5PKG-VERIFY ?auto_230199 ?auto_230200 ?auto_230201 ?auto_230202 ?auto_230203 ?auto_230198 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230254 - OBJ
      ?auto_230255 - OBJ
      ?auto_230256 - OBJ
      ?auto_230257 - OBJ
      ?auto_230258 - OBJ
      ?auto_230253 - LOCATION
    )
    :vars
    (
      ?auto_230264 - LOCATION
      ?auto_230263 - CITY
      ?auto_230261 - LOCATION
      ?auto_230262 - LOCATION
      ?auto_230260 - LOCATION
      ?auto_230259 - LOCATION
      ?auto_230265 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230264 ?auto_230263 ) ( IN-CITY ?auto_230253 ?auto_230263 ) ( not ( = ?auto_230253 ?auto_230264 ) ) ( OBJ-AT ?auto_230254 ?auto_230264 ) ( IN-CITY ?auto_230261 ?auto_230263 ) ( not ( = ?auto_230253 ?auto_230261 ) ) ( OBJ-AT ?auto_230256 ?auto_230261 ) ( IN-CITY ?auto_230262 ?auto_230263 ) ( not ( = ?auto_230253 ?auto_230262 ) ) ( OBJ-AT ?auto_230257 ?auto_230262 ) ( IN-CITY ?auto_230260 ?auto_230263 ) ( not ( = ?auto_230253 ?auto_230260 ) ) ( OBJ-AT ?auto_230258 ?auto_230260 ) ( IN-CITY ?auto_230259 ?auto_230263 ) ( not ( = ?auto_230253 ?auto_230259 ) ) ( OBJ-AT ?auto_230255 ?auto_230259 ) ( TRUCK-AT ?auto_230265 ?auto_230253 ) ( not ( = ?auto_230255 ?auto_230258 ) ) ( not ( = ?auto_230260 ?auto_230259 ) ) ( not ( = ?auto_230255 ?auto_230257 ) ) ( not ( = ?auto_230258 ?auto_230257 ) ) ( not ( = ?auto_230262 ?auto_230260 ) ) ( not ( = ?auto_230262 ?auto_230259 ) ) ( not ( = ?auto_230255 ?auto_230256 ) ) ( not ( = ?auto_230258 ?auto_230256 ) ) ( not ( = ?auto_230257 ?auto_230256 ) ) ( not ( = ?auto_230261 ?auto_230262 ) ) ( not ( = ?auto_230261 ?auto_230260 ) ) ( not ( = ?auto_230261 ?auto_230259 ) ) ( not ( = ?auto_230255 ?auto_230254 ) ) ( not ( = ?auto_230258 ?auto_230254 ) ) ( not ( = ?auto_230257 ?auto_230254 ) ) ( not ( = ?auto_230256 ?auto_230254 ) ) ( not ( = ?auto_230264 ?auto_230261 ) ) ( not ( = ?auto_230264 ?auto_230262 ) ) ( not ( = ?auto_230264 ?auto_230260 ) ) ( not ( = ?auto_230264 ?auto_230259 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_230255 ?auto_230258 ?auto_230257 ?auto_230254 ?auto_230256 ?auto_230253 )
      ( DELIVER-5PKG-VERIFY ?auto_230254 ?auto_230255 ?auto_230256 ?auto_230257 ?auto_230258 ?auto_230253 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_231016 - OBJ
      ?auto_231017 - OBJ
      ?auto_231018 - OBJ
      ?auto_231019 - OBJ
      ?auto_231020 - OBJ
      ?auto_231015 - LOCATION
    )
    :vars
    (
      ?auto_231026 - LOCATION
      ?auto_231025 - CITY
      ?auto_231023 - LOCATION
      ?auto_231024 - LOCATION
      ?auto_231022 - LOCATION
      ?auto_231021 - LOCATION
      ?auto_231027 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_231026 ?auto_231025 ) ( IN-CITY ?auto_231015 ?auto_231025 ) ( not ( = ?auto_231015 ?auto_231026 ) ) ( OBJ-AT ?auto_231016 ?auto_231026 ) ( IN-CITY ?auto_231023 ?auto_231025 ) ( not ( = ?auto_231015 ?auto_231023 ) ) ( OBJ-AT ?auto_231020 ?auto_231023 ) ( IN-CITY ?auto_231024 ?auto_231025 ) ( not ( = ?auto_231015 ?auto_231024 ) ) ( OBJ-AT ?auto_231019 ?auto_231024 ) ( IN-CITY ?auto_231022 ?auto_231025 ) ( not ( = ?auto_231015 ?auto_231022 ) ) ( OBJ-AT ?auto_231017 ?auto_231022 ) ( IN-CITY ?auto_231021 ?auto_231025 ) ( not ( = ?auto_231015 ?auto_231021 ) ) ( OBJ-AT ?auto_231018 ?auto_231021 ) ( TRUCK-AT ?auto_231027 ?auto_231015 ) ( not ( = ?auto_231018 ?auto_231017 ) ) ( not ( = ?auto_231022 ?auto_231021 ) ) ( not ( = ?auto_231018 ?auto_231019 ) ) ( not ( = ?auto_231017 ?auto_231019 ) ) ( not ( = ?auto_231024 ?auto_231022 ) ) ( not ( = ?auto_231024 ?auto_231021 ) ) ( not ( = ?auto_231018 ?auto_231020 ) ) ( not ( = ?auto_231017 ?auto_231020 ) ) ( not ( = ?auto_231019 ?auto_231020 ) ) ( not ( = ?auto_231023 ?auto_231024 ) ) ( not ( = ?auto_231023 ?auto_231022 ) ) ( not ( = ?auto_231023 ?auto_231021 ) ) ( not ( = ?auto_231018 ?auto_231016 ) ) ( not ( = ?auto_231017 ?auto_231016 ) ) ( not ( = ?auto_231019 ?auto_231016 ) ) ( not ( = ?auto_231020 ?auto_231016 ) ) ( not ( = ?auto_231026 ?auto_231023 ) ) ( not ( = ?auto_231026 ?auto_231024 ) ) ( not ( = ?auto_231026 ?auto_231022 ) ) ( not ( = ?auto_231026 ?auto_231021 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_231018 ?auto_231017 ?auto_231019 ?auto_231016 ?auto_231020 ?auto_231015 )
      ( DELIVER-5PKG-VERIFY ?auto_231016 ?auto_231017 ?auto_231018 ?auto_231019 ?auto_231020 ?auto_231015 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_231071 - OBJ
      ?auto_231072 - OBJ
      ?auto_231073 - OBJ
      ?auto_231074 - OBJ
      ?auto_231075 - OBJ
      ?auto_231070 - LOCATION
    )
    :vars
    (
      ?auto_231081 - LOCATION
      ?auto_231080 - CITY
      ?auto_231078 - LOCATION
      ?auto_231079 - LOCATION
      ?auto_231077 - LOCATION
      ?auto_231076 - LOCATION
      ?auto_231082 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_231081 ?auto_231080 ) ( IN-CITY ?auto_231070 ?auto_231080 ) ( not ( = ?auto_231070 ?auto_231081 ) ) ( OBJ-AT ?auto_231071 ?auto_231081 ) ( IN-CITY ?auto_231078 ?auto_231080 ) ( not ( = ?auto_231070 ?auto_231078 ) ) ( OBJ-AT ?auto_231074 ?auto_231078 ) ( IN-CITY ?auto_231079 ?auto_231080 ) ( not ( = ?auto_231070 ?auto_231079 ) ) ( OBJ-AT ?auto_231075 ?auto_231079 ) ( IN-CITY ?auto_231077 ?auto_231080 ) ( not ( = ?auto_231070 ?auto_231077 ) ) ( OBJ-AT ?auto_231072 ?auto_231077 ) ( IN-CITY ?auto_231076 ?auto_231080 ) ( not ( = ?auto_231070 ?auto_231076 ) ) ( OBJ-AT ?auto_231073 ?auto_231076 ) ( TRUCK-AT ?auto_231082 ?auto_231070 ) ( not ( = ?auto_231073 ?auto_231072 ) ) ( not ( = ?auto_231077 ?auto_231076 ) ) ( not ( = ?auto_231073 ?auto_231075 ) ) ( not ( = ?auto_231072 ?auto_231075 ) ) ( not ( = ?auto_231079 ?auto_231077 ) ) ( not ( = ?auto_231079 ?auto_231076 ) ) ( not ( = ?auto_231073 ?auto_231074 ) ) ( not ( = ?auto_231072 ?auto_231074 ) ) ( not ( = ?auto_231075 ?auto_231074 ) ) ( not ( = ?auto_231078 ?auto_231079 ) ) ( not ( = ?auto_231078 ?auto_231077 ) ) ( not ( = ?auto_231078 ?auto_231076 ) ) ( not ( = ?auto_231073 ?auto_231071 ) ) ( not ( = ?auto_231072 ?auto_231071 ) ) ( not ( = ?auto_231075 ?auto_231071 ) ) ( not ( = ?auto_231074 ?auto_231071 ) ) ( not ( = ?auto_231081 ?auto_231078 ) ) ( not ( = ?auto_231081 ?auto_231079 ) ) ( not ( = ?auto_231081 ?auto_231077 ) ) ( not ( = ?auto_231081 ?auto_231076 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_231073 ?auto_231072 ?auto_231075 ?auto_231071 ?auto_231074 ?auto_231070 )
      ( DELIVER-5PKG-VERIFY ?auto_231071 ?auto_231072 ?auto_231073 ?auto_231074 ?auto_231075 ?auto_231070 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_231600 - OBJ
      ?auto_231601 - OBJ
      ?auto_231602 - OBJ
      ?auto_231603 - OBJ
      ?auto_231604 - OBJ
      ?auto_231599 - LOCATION
    )
    :vars
    (
      ?auto_231610 - LOCATION
      ?auto_231609 - CITY
      ?auto_231607 - LOCATION
      ?auto_231608 - LOCATION
      ?auto_231606 - LOCATION
      ?auto_231605 - LOCATION
      ?auto_231611 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_231610 ?auto_231609 ) ( IN-CITY ?auto_231599 ?auto_231609 ) ( not ( = ?auto_231599 ?auto_231610 ) ) ( OBJ-AT ?auto_231600 ?auto_231610 ) ( IN-CITY ?auto_231607 ?auto_231609 ) ( not ( = ?auto_231599 ?auto_231607 ) ) ( OBJ-AT ?auto_231604 ?auto_231607 ) ( IN-CITY ?auto_231608 ?auto_231609 ) ( not ( = ?auto_231599 ?auto_231608 ) ) ( OBJ-AT ?auto_231602 ?auto_231608 ) ( IN-CITY ?auto_231606 ?auto_231609 ) ( not ( = ?auto_231599 ?auto_231606 ) ) ( OBJ-AT ?auto_231601 ?auto_231606 ) ( IN-CITY ?auto_231605 ?auto_231609 ) ( not ( = ?auto_231599 ?auto_231605 ) ) ( OBJ-AT ?auto_231603 ?auto_231605 ) ( TRUCK-AT ?auto_231611 ?auto_231599 ) ( not ( = ?auto_231603 ?auto_231601 ) ) ( not ( = ?auto_231606 ?auto_231605 ) ) ( not ( = ?auto_231603 ?auto_231602 ) ) ( not ( = ?auto_231601 ?auto_231602 ) ) ( not ( = ?auto_231608 ?auto_231606 ) ) ( not ( = ?auto_231608 ?auto_231605 ) ) ( not ( = ?auto_231603 ?auto_231604 ) ) ( not ( = ?auto_231601 ?auto_231604 ) ) ( not ( = ?auto_231602 ?auto_231604 ) ) ( not ( = ?auto_231607 ?auto_231608 ) ) ( not ( = ?auto_231607 ?auto_231606 ) ) ( not ( = ?auto_231607 ?auto_231605 ) ) ( not ( = ?auto_231603 ?auto_231600 ) ) ( not ( = ?auto_231601 ?auto_231600 ) ) ( not ( = ?auto_231602 ?auto_231600 ) ) ( not ( = ?auto_231604 ?auto_231600 ) ) ( not ( = ?auto_231610 ?auto_231607 ) ) ( not ( = ?auto_231610 ?auto_231608 ) ) ( not ( = ?auto_231610 ?auto_231606 ) ) ( not ( = ?auto_231610 ?auto_231605 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_231603 ?auto_231601 ?auto_231602 ?auto_231600 ?auto_231604 ?auto_231599 )
      ( DELIVER-5PKG-VERIFY ?auto_231600 ?auto_231601 ?auto_231602 ?auto_231603 ?auto_231604 ?auto_231599 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_231773 - OBJ
      ?auto_231774 - OBJ
      ?auto_231775 - OBJ
      ?auto_231776 - OBJ
      ?auto_231777 - OBJ
      ?auto_231772 - LOCATION
    )
    :vars
    (
      ?auto_231783 - LOCATION
      ?auto_231782 - CITY
      ?auto_231780 - LOCATION
      ?auto_231781 - LOCATION
      ?auto_231779 - LOCATION
      ?auto_231778 - LOCATION
      ?auto_231784 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_231783 ?auto_231782 ) ( IN-CITY ?auto_231772 ?auto_231782 ) ( not ( = ?auto_231772 ?auto_231783 ) ) ( OBJ-AT ?auto_231773 ?auto_231783 ) ( IN-CITY ?auto_231780 ?auto_231782 ) ( not ( = ?auto_231772 ?auto_231780 ) ) ( OBJ-AT ?auto_231776 ?auto_231780 ) ( IN-CITY ?auto_231781 ?auto_231782 ) ( not ( = ?auto_231772 ?auto_231781 ) ) ( OBJ-AT ?auto_231775 ?auto_231781 ) ( IN-CITY ?auto_231779 ?auto_231782 ) ( not ( = ?auto_231772 ?auto_231779 ) ) ( OBJ-AT ?auto_231774 ?auto_231779 ) ( IN-CITY ?auto_231778 ?auto_231782 ) ( not ( = ?auto_231772 ?auto_231778 ) ) ( OBJ-AT ?auto_231777 ?auto_231778 ) ( TRUCK-AT ?auto_231784 ?auto_231772 ) ( not ( = ?auto_231777 ?auto_231774 ) ) ( not ( = ?auto_231779 ?auto_231778 ) ) ( not ( = ?auto_231777 ?auto_231775 ) ) ( not ( = ?auto_231774 ?auto_231775 ) ) ( not ( = ?auto_231781 ?auto_231779 ) ) ( not ( = ?auto_231781 ?auto_231778 ) ) ( not ( = ?auto_231777 ?auto_231776 ) ) ( not ( = ?auto_231774 ?auto_231776 ) ) ( not ( = ?auto_231775 ?auto_231776 ) ) ( not ( = ?auto_231780 ?auto_231781 ) ) ( not ( = ?auto_231780 ?auto_231779 ) ) ( not ( = ?auto_231780 ?auto_231778 ) ) ( not ( = ?auto_231777 ?auto_231773 ) ) ( not ( = ?auto_231774 ?auto_231773 ) ) ( not ( = ?auto_231775 ?auto_231773 ) ) ( not ( = ?auto_231776 ?auto_231773 ) ) ( not ( = ?auto_231783 ?auto_231780 ) ) ( not ( = ?auto_231783 ?auto_231781 ) ) ( not ( = ?auto_231783 ?auto_231779 ) ) ( not ( = ?auto_231783 ?auto_231778 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_231777 ?auto_231774 ?auto_231775 ?auto_231773 ?auto_231776 ?auto_231772 )
      ( DELIVER-5PKG-VERIFY ?auto_231773 ?auto_231774 ?auto_231775 ?auto_231776 ?auto_231777 ?auto_231772 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_231943 - OBJ
      ?auto_231944 - OBJ
      ?auto_231945 - OBJ
      ?auto_231946 - OBJ
      ?auto_231947 - OBJ
      ?auto_231942 - LOCATION
    )
    :vars
    (
      ?auto_231953 - LOCATION
      ?auto_231952 - CITY
      ?auto_231950 - LOCATION
      ?auto_231951 - LOCATION
      ?auto_231949 - LOCATION
      ?auto_231948 - LOCATION
      ?auto_231954 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_231953 ?auto_231952 ) ( IN-CITY ?auto_231942 ?auto_231952 ) ( not ( = ?auto_231942 ?auto_231953 ) ) ( OBJ-AT ?auto_231943 ?auto_231953 ) ( IN-CITY ?auto_231950 ?auto_231952 ) ( not ( = ?auto_231942 ?auto_231950 ) ) ( OBJ-AT ?auto_231945 ?auto_231950 ) ( IN-CITY ?auto_231951 ?auto_231952 ) ( not ( = ?auto_231942 ?auto_231951 ) ) ( OBJ-AT ?auto_231947 ?auto_231951 ) ( IN-CITY ?auto_231949 ?auto_231952 ) ( not ( = ?auto_231942 ?auto_231949 ) ) ( OBJ-AT ?auto_231944 ?auto_231949 ) ( IN-CITY ?auto_231948 ?auto_231952 ) ( not ( = ?auto_231942 ?auto_231948 ) ) ( OBJ-AT ?auto_231946 ?auto_231948 ) ( TRUCK-AT ?auto_231954 ?auto_231942 ) ( not ( = ?auto_231946 ?auto_231944 ) ) ( not ( = ?auto_231949 ?auto_231948 ) ) ( not ( = ?auto_231946 ?auto_231947 ) ) ( not ( = ?auto_231944 ?auto_231947 ) ) ( not ( = ?auto_231951 ?auto_231949 ) ) ( not ( = ?auto_231951 ?auto_231948 ) ) ( not ( = ?auto_231946 ?auto_231945 ) ) ( not ( = ?auto_231944 ?auto_231945 ) ) ( not ( = ?auto_231947 ?auto_231945 ) ) ( not ( = ?auto_231950 ?auto_231951 ) ) ( not ( = ?auto_231950 ?auto_231949 ) ) ( not ( = ?auto_231950 ?auto_231948 ) ) ( not ( = ?auto_231946 ?auto_231943 ) ) ( not ( = ?auto_231944 ?auto_231943 ) ) ( not ( = ?auto_231947 ?auto_231943 ) ) ( not ( = ?auto_231945 ?auto_231943 ) ) ( not ( = ?auto_231953 ?auto_231950 ) ) ( not ( = ?auto_231953 ?auto_231951 ) ) ( not ( = ?auto_231953 ?auto_231949 ) ) ( not ( = ?auto_231953 ?auto_231948 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_231946 ?auto_231944 ?auto_231947 ?auto_231943 ?auto_231945 ?auto_231942 )
      ( DELIVER-5PKG-VERIFY ?auto_231943 ?auto_231944 ?auto_231945 ?auto_231946 ?auto_231947 ?auto_231942 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_232057 - OBJ
      ?auto_232058 - OBJ
      ?auto_232059 - OBJ
      ?auto_232060 - OBJ
      ?auto_232061 - OBJ
      ?auto_232056 - LOCATION
    )
    :vars
    (
      ?auto_232067 - LOCATION
      ?auto_232066 - CITY
      ?auto_232064 - LOCATION
      ?auto_232065 - LOCATION
      ?auto_232063 - LOCATION
      ?auto_232062 - LOCATION
      ?auto_232068 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_232067 ?auto_232066 ) ( IN-CITY ?auto_232056 ?auto_232066 ) ( not ( = ?auto_232056 ?auto_232067 ) ) ( OBJ-AT ?auto_232057 ?auto_232067 ) ( IN-CITY ?auto_232064 ?auto_232066 ) ( not ( = ?auto_232056 ?auto_232064 ) ) ( OBJ-AT ?auto_232059 ?auto_232064 ) ( IN-CITY ?auto_232065 ?auto_232066 ) ( not ( = ?auto_232056 ?auto_232065 ) ) ( OBJ-AT ?auto_232060 ?auto_232065 ) ( IN-CITY ?auto_232063 ?auto_232066 ) ( not ( = ?auto_232056 ?auto_232063 ) ) ( OBJ-AT ?auto_232058 ?auto_232063 ) ( IN-CITY ?auto_232062 ?auto_232066 ) ( not ( = ?auto_232056 ?auto_232062 ) ) ( OBJ-AT ?auto_232061 ?auto_232062 ) ( TRUCK-AT ?auto_232068 ?auto_232056 ) ( not ( = ?auto_232061 ?auto_232058 ) ) ( not ( = ?auto_232063 ?auto_232062 ) ) ( not ( = ?auto_232061 ?auto_232060 ) ) ( not ( = ?auto_232058 ?auto_232060 ) ) ( not ( = ?auto_232065 ?auto_232063 ) ) ( not ( = ?auto_232065 ?auto_232062 ) ) ( not ( = ?auto_232061 ?auto_232059 ) ) ( not ( = ?auto_232058 ?auto_232059 ) ) ( not ( = ?auto_232060 ?auto_232059 ) ) ( not ( = ?auto_232064 ?auto_232065 ) ) ( not ( = ?auto_232064 ?auto_232063 ) ) ( not ( = ?auto_232064 ?auto_232062 ) ) ( not ( = ?auto_232061 ?auto_232057 ) ) ( not ( = ?auto_232058 ?auto_232057 ) ) ( not ( = ?auto_232060 ?auto_232057 ) ) ( not ( = ?auto_232059 ?auto_232057 ) ) ( not ( = ?auto_232067 ?auto_232064 ) ) ( not ( = ?auto_232067 ?auto_232065 ) ) ( not ( = ?auto_232067 ?auto_232063 ) ) ( not ( = ?auto_232067 ?auto_232062 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_232061 ?auto_232058 ?auto_232060 ?auto_232057 ?auto_232059 ?auto_232056 )
      ( DELIVER-5PKG-VERIFY ?auto_232057 ?auto_232058 ?auto_232059 ?auto_232060 ?auto_232061 ?auto_232056 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_232760 - OBJ
      ?auto_232761 - OBJ
      ?auto_232762 - OBJ
      ?auto_232763 - OBJ
      ?auto_232764 - OBJ
      ?auto_232759 - LOCATION
    )
    :vars
    (
      ?auto_232770 - LOCATION
      ?auto_232769 - CITY
      ?auto_232767 - LOCATION
      ?auto_232768 - LOCATION
      ?auto_232766 - LOCATION
      ?auto_232765 - LOCATION
      ?auto_232771 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_232770 ?auto_232769 ) ( IN-CITY ?auto_232759 ?auto_232769 ) ( not ( = ?auto_232759 ?auto_232770 ) ) ( OBJ-AT ?auto_232760 ?auto_232770 ) ( IN-CITY ?auto_232767 ?auto_232769 ) ( not ( = ?auto_232759 ?auto_232767 ) ) ( OBJ-AT ?auto_232764 ?auto_232767 ) ( IN-CITY ?auto_232768 ?auto_232769 ) ( not ( = ?auto_232759 ?auto_232768 ) ) ( OBJ-AT ?auto_232761 ?auto_232768 ) ( IN-CITY ?auto_232766 ?auto_232769 ) ( not ( = ?auto_232759 ?auto_232766 ) ) ( OBJ-AT ?auto_232763 ?auto_232766 ) ( IN-CITY ?auto_232765 ?auto_232769 ) ( not ( = ?auto_232759 ?auto_232765 ) ) ( OBJ-AT ?auto_232762 ?auto_232765 ) ( TRUCK-AT ?auto_232771 ?auto_232759 ) ( not ( = ?auto_232762 ?auto_232763 ) ) ( not ( = ?auto_232766 ?auto_232765 ) ) ( not ( = ?auto_232762 ?auto_232761 ) ) ( not ( = ?auto_232763 ?auto_232761 ) ) ( not ( = ?auto_232768 ?auto_232766 ) ) ( not ( = ?auto_232768 ?auto_232765 ) ) ( not ( = ?auto_232762 ?auto_232764 ) ) ( not ( = ?auto_232763 ?auto_232764 ) ) ( not ( = ?auto_232761 ?auto_232764 ) ) ( not ( = ?auto_232767 ?auto_232768 ) ) ( not ( = ?auto_232767 ?auto_232766 ) ) ( not ( = ?auto_232767 ?auto_232765 ) ) ( not ( = ?auto_232762 ?auto_232760 ) ) ( not ( = ?auto_232763 ?auto_232760 ) ) ( not ( = ?auto_232761 ?auto_232760 ) ) ( not ( = ?auto_232764 ?auto_232760 ) ) ( not ( = ?auto_232770 ?auto_232767 ) ) ( not ( = ?auto_232770 ?auto_232768 ) ) ( not ( = ?auto_232770 ?auto_232766 ) ) ( not ( = ?auto_232770 ?auto_232765 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_232762 ?auto_232763 ?auto_232761 ?auto_232760 ?auto_232764 ?auto_232759 )
      ( DELIVER-5PKG-VERIFY ?auto_232760 ?auto_232761 ?auto_232762 ?auto_232763 ?auto_232764 ?auto_232759 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_232874 - OBJ
      ?auto_232875 - OBJ
      ?auto_232876 - OBJ
      ?auto_232877 - OBJ
      ?auto_232878 - OBJ
      ?auto_232873 - LOCATION
    )
    :vars
    (
      ?auto_232884 - LOCATION
      ?auto_232883 - CITY
      ?auto_232881 - LOCATION
      ?auto_232882 - LOCATION
      ?auto_232880 - LOCATION
      ?auto_232879 - LOCATION
      ?auto_232885 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_232884 ?auto_232883 ) ( IN-CITY ?auto_232873 ?auto_232883 ) ( not ( = ?auto_232873 ?auto_232884 ) ) ( OBJ-AT ?auto_232874 ?auto_232884 ) ( IN-CITY ?auto_232881 ?auto_232883 ) ( not ( = ?auto_232873 ?auto_232881 ) ) ( OBJ-AT ?auto_232877 ?auto_232881 ) ( IN-CITY ?auto_232882 ?auto_232883 ) ( not ( = ?auto_232873 ?auto_232882 ) ) ( OBJ-AT ?auto_232875 ?auto_232882 ) ( IN-CITY ?auto_232880 ?auto_232883 ) ( not ( = ?auto_232873 ?auto_232880 ) ) ( OBJ-AT ?auto_232878 ?auto_232880 ) ( IN-CITY ?auto_232879 ?auto_232883 ) ( not ( = ?auto_232873 ?auto_232879 ) ) ( OBJ-AT ?auto_232876 ?auto_232879 ) ( TRUCK-AT ?auto_232885 ?auto_232873 ) ( not ( = ?auto_232876 ?auto_232878 ) ) ( not ( = ?auto_232880 ?auto_232879 ) ) ( not ( = ?auto_232876 ?auto_232875 ) ) ( not ( = ?auto_232878 ?auto_232875 ) ) ( not ( = ?auto_232882 ?auto_232880 ) ) ( not ( = ?auto_232882 ?auto_232879 ) ) ( not ( = ?auto_232876 ?auto_232877 ) ) ( not ( = ?auto_232878 ?auto_232877 ) ) ( not ( = ?auto_232875 ?auto_232877 ) ) ( not ( = ?auto_232881 ?auto_232882 ) ) ( not ( = ?auto_232881 ?auto_232880 ) ) ( not ( = ?auto_232881 ?auto_232879 ) ) ( not ( = ?auto_232876 ?auto_232874 ) ) ( not ( = ?auto_232878 ?auto_232874 ) ) ( not ( = ?auto_232875 ?auto_232874 ) ) ( not ( = ?auto_232877 ?auto_232874 ) ) ( not ( = ?auto_232884 ?auto_232881 ) ) ( not ( = ?auto_232884 ?auto_232882 ) ) ( not ( = ?auto_232884 ?auto_232880 ) ) ( not ( = ?auto_232884 ?auto_232879 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_232876 ?auto_232878 ?auto_232875 ?auto_232874 ?auto_232877 ?auto_232873 )
      ( DELIVER-5PKG-VERIFY ?auto_232874 ?auto_232875 ?auto_232876 ?auto_232877 ?auto_232878 ?auto_232873 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_233044 - OBJ
      ?auto_233045 - OBJ
      ?auto_233046 - OBJ
      ?auto_233047 - OBJ
      ?auto_233048 - OBJ
      ?auto_233043 - LOCATION
    )
    :vars
    (
      ?auto_233054 - LOCATION
      ?auto_233053 - CITY
      ?auto_233051 - LOCATION
      ?auto_233052 - LOCATION
      ?auto_233050 - LOCATION
      ?auto_233049 - LOCATION
      ?auto_233055 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_233054 ?auto_233053 ) ( IN-CITY ?auto_233043 ?auto_233053 ) ( not ( = ?auto_233043 ?auto_233054 ) ) ( OBJ-AT ?auto_233044 ?auto_233054 ) ( IN-CITY ?auto_233051 ?auto_233053 ) ( not ( = ?auto_233043 ?auto_233051 ) ) ( OBJ-AT ?auto_233048 ?auto_233051 ) ( IN-CITY ?auto_233052 ?auto_233053 ) ( not ( = ?auto_233043 ?auto_233052 ) ) ( OBJ-AT ?auto_233045 ?auto_233052 ) ( IN-CITY ?auto_233050 ?auto_233053 ) ( not ( = ?auto_233043 ?auto_233050 ) ) ( OBJ-AT ?auto_233046 ?auto_233050 ) ( IN-CITY ?auto_233049 ?auto_233053 ) ( not ( = ?auto_233043 ?auto_233049 ) ) ( OBJ-AT ?auto_233047 ?auto_233049 ) ( TRUCK-AT ?auto_233055 ?auto_233043 ) ( not ( = ?auto_233047 ?auto_233046 ) ) ( not ( = ?auto_233050 ?auto_233049 ) ) ( not ( = ?auto_233047 ?auto_233045 ) ) ( not ( = ?auto_233046 ?auto_233045 ) ) ( not ( = ?auto_233052 ?auto_233050 ) ) ( not ( = ?auto_233052 ?auto_233049 ) ) ( not ( = ?auto_233047 ?auto_233048 ) ) ( not ( = ?auto_233046 ?auto_233048 ) ) ( not ( = ?auto_233045 ?auto_233048 ) ) ( not ( = ?auto_233051 ?auto_233052 ) ) ( not ( = ?auto_233051 ?auto_233050 ) ) ( not ( = ?auto_233051 ?auto_233049 ) ) ( not ( = ?auto_233047 ?auto_233044 ) ) ( not ( = ?auto_233046 ?auto_233044 ) ) ( not ( = ?auto_233045 ?auto_233044 ) ) ( not ( = ?auto_233048 ?auto_233044 ) ) ( not ( = ?auto_233054 ?auto_233051 ) ) ( not ( = ?auto_233054 ?auto_233052 ) ) ( not ( = ?auto_233054 ?auto_233050 ) ) ( not ( = ?auto_233054 ?auto_233049 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_233047 ?auto_233046 ?auto_233045 ?auto_233044 ?auto_233048 ?auto_233043 )
      ( DELIVER-5PKG-VERIFY ?auto_233044 ?auto_233045 ?auto_233046 ?auto_233047 ?auto_233048 ?auto_233043 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_233217 - OBJ
      ?auto_233218 - OBJ
      ?auto_233219 - OBJ
      ?auto_233220 - OBJ
      ?auto_233221 - OBJ
      ?auto_233216 - LOCATION
    )
    :vars
    (
      ?auto_233227 - LOCATION
      ?auto_233226 - CITY
      ?auto_233224 - LOCATION
      ?auto_233225 - LOCATION
      ?auto_233223 - LOCATION
      ?auto_233222 - LOCATION
      ?auto_233228 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_233227 ?auto_233226 ) ( IN-CITY ?auto_233216 ?auto_233226 ) ( not ( = ?auto_233216 ?auto_233227 ) ) ( OBJ-AT ?auto_233217 ?auto_233227 ) ( IN-CITY ?auto_233224 ?auto_233226 ) ( not ( = ?auto_233216 ?auto_233224 ) ) ( OBJ-AT ?auto_233220 ?auto_233224 ) ( IN-CITY ?auto_233225 ?auto_233226 ) ( not ( = ?auto_233216 ?auto_233225 ) ) ( OBJ-AT ?auto_233218 ?auto_233225 ) ( IN-CITY ?auto_233223 ?auto_233226 ) ( not ( = ?auto_233216 ?auto_233223 ) ) ( OBJ-AT ?auto_233219 ?auto_233223 ) ( IN-CITY ?auto_233222 ?auto_233226 ) ( not ( = ?auto_233216 ?auto_233222 ) ) ( OBJ-AT ?auto_233221 ?auto_233222 ) ( TRUCK-AT ?auto_233228 ?auto_233216 ) ( not ( = ?auto_233221 ?auto_233219 ) ) ( not ( = ?auto_233223 ?auto_233222 ) ) ( not ( = ?auto_233221 ?auto_233218 ) ) ( not ( = ?auto_233219 ?auto_233218 ) ) ( not ( = ?auto_233225 ?auto_233223 ) ) ( not ( = ?auto_233225 ?auto_233222 ) ) ( not ( = ?auto_233221 ?auto_233220 ) ) ( not ( = ?auto_233219 ?auto_233220 ) ) ( not ( = ?auto_233218 ?auto_233220 ) ) ( not ( = ?auto_233224 ?auto_233225 ) ) ( not ( = ?auto_233224 ?auto_233223 ) ) ( not ( = ?auto_233224 ?auto_233222 ) ) ( not ( = ?auto_233221 ?auto_233217 ) ) ( not ( = ?auto_233219 ?auto_233217 ) ) ( not ( = ?auto_233218 ?auto_233217 ) ) ( not ( = ?auto_233220 ?auto_233217 ) ) ( not ( = ?auto_233227 ?auto_233224 ) ) ( not ( = ?auto_233227 ?auto_233225 ) ) ( not ( = ?auto_233227 ?auto_233223 ) ) ( not ( = ?auto_233227 ?auto_233222 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_233221 ?auto_233219 ?auto_233218 ?auto_233217 ?auto_233220 ?auto_233216 )
      ( DELIVER-5PKG-VERIFY ?auto_233217 ?auto_233218 ?auto_233219 ?auto_233220 ?auto_233221 ?auto_233216 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_233746 - OBJ
      ?auto_233747 - OBJ
      ?auto_233748 - OBJ
      ?auto_233749 - OBJ
      ?auto_233750 - OBJ
      ?auto_233745 - LOCATION
    )
    :vars
    (
      ?auto_233756 - LOCATION
      ?auto_233755 - CITY
      ?auto_233753 - LOCATION
      ?auto_233754 - LOCATION
      ?auto_233752 - LOCATION
      ?auto_233751 - LOCATION
      ?auto_233757 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_233756 ?auto_233755 ) ( IN-CITY ?auto_233745 ?auto_233755 ) ( not ( = ?auto_233745 ?auto_233756 ) ) ( OBJ-AT ?auto_233746 ?auto_233756 ) ( IN-CITY ?auto_233753 ?auto_233755 ) ( not ( = ?auto_233745 ?auto_233753 ) ) ( OBJ-AT ?auto_233748 ?auto_233753 ) ( IN-CITY ?auto_233754 ?auto_233755 ) ( not ( = ?auto_233745 ?auto_233754 ) ) ( OBJ-AT ?auto_233747 ?auto_233754 ) ( IN-CITY ?auto_233752 ?auto_233755 ) ( not ( = ?auto_233745 ?auto_233752 ) ) ( OBJ-AT ?auto_233750 ?auto_233752 ) ( IN-CITY ?auto_233751 ?auto_233755 ) ( not ( = ?auto_233745 ?auto_233751 ) ) ( OBJ-AT ?auto_233749 ?auto_233751 ) ( TRUCK-AT ?auto_233757 ?auto_233745 ) ( not ( = ?auto_233749 ?auto_233750 ) ) ( not ( = ?auto_233752 ?auto_233751 ) ) ( not ( = ?auto_233749 ?auto_233747 ) ) ( not ( = ?auto_233750 ?auto_233747 ) ) ( not ( = ?auto_233754 ?auto_233752 ) ) ( not ( = ?auto_233754 ?auto_233751 ) ) ( not ( = ?auto_233749 ?auto_233748 ) ) ( not ( = ?auto_233750 ?auto_233748 ) ) ( not ( = ?auto_233747 ?auto_233748 ) ) ( not ( = ?auto_233753 ?auto_233754 ) ) ( not ( = ?auto_233753 ?auto_233752 ) ) ( not ( = ?auto_233753 ?auto_233751 ) ) ( not ( = ?auto_233749 ?auto_233746 ) ) ( not ( = ?auto_233750 ?auto_233746 ) ) ( not ( = ?auto_233747 ?auto_233746 ) ) ( not ( = ?auto_233748 ?auto_233746 ) ) ( not ( = ?auto_233756 ?auto_233753 ) ) ( not ( = ?auto_233756 ?auto_233754 ) ) ( not ( = ?auto_233756 ?auto_233752 ) ) ( not ( = ?auto_233756 ?auto_233751 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_233749 ?auto_233750 ?auto_233747 ?auto_233746 ?auto_233748 ?auto_233745 )
      ( DELIVER-5PKG-VERIFY ?auto_233746 ?auto_233747 ?auto_233748 ?auto_233749 ?auto_233750 ?auto_233745 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_233801 - OBJ
      ?auto_233802 - OBJ
      ?auto_233803 - OBJ
      ?auto_233804 - OBJ
      ?auto_233805 - OBJ
      ?auto_233800 - LOCATION
    )
    :vars
    (
      ?auto_233811 - LOCATION
      ?auto_233810 - CITY
      ?auto_233808 - LOCATION
      ?auto_233809 - LOCATION
      ?auto_233807 - LOCATION
      ?auto_233806 - LOCATION
      ?auto_233812 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_233811 ?auto_233810 ) ( IN-CITY ?auto_233800 ?auto_233810 ) ( not ( = ?auto_233800 ?auto_233811 ) ) ( OBJ-AT ?auto_233801 ?auto_233811 ) ( IN-CITY ?auto_233808 ?auto_233810 ) ( not ( = ?auto_233800 ?auto_233808 ) ) ( OBJ-AT ?auto_233803 ?auto_233808 ) ( IN-CITY ?auto_233809 ?auto_233810 ) ( not ( = ?auto_233800 ?auto_233809 ) ) ( OBJ-AT ?auto_233802 ?auto_233809 ) ( IN-CITY ?auto_233807 ?auto_233810 ) ( not ( = ?auto_233800 ?auto_233807 ) ) ( OBJ-AT ?auto_233804 ?auto_233807 ) ( IN-CITY ?auto_233806 ?auto_233810 ) ( not ( = ?auto_233800 ?auto_233806 ) ) ( OBJ-AT ?auto_233805 ?auto_233806 ) ( TRUCK-AT ?auto_233812 ?auto_233800 ) ( not ( = ?auto_233805 ?auto_233804 ) ) ( not ( = ?auto_233807 ?auto_233806 ) ) ( not ( = ?auto_233805 ?auto_233802 ) ) ( not ( = ?auto_233804 ?auto_233802 ) ) ( not ( = ?auto_233809 ?auto_233807 ) ) ( not ( = ?auto_233809 ?auto_233806 ) ) ( not ( = ?auto_233805 ?auto_233803 ) ) ( not ( = ?auto_233804 ?auto_233803 ) ) ( not ( = ?auto_233802 ?auto_233803 ) ) ( not ( = ?auto_233808 ?auto_233809 ) ) ( not ( = ?auto_233808 ?auto_233807 ) ) ( not ( = ?auto_233808 ?auto_233806 ) ) ( not ( = ?auto_233805 ?auto_233801 ) ) ( not ( = ?auto_233804 ?auto_233801 ) ) ( not ( = ?auto_233802 ?auto_233801 ) ) ( not ( = ?auto_233803 ?auto_233801 ) ) ( not ( = ?auto_233811 ?auto_233808 ) ) ( not ( = ?auto_233811 ?auto_233809 ) ) ( not ( = ?auto_233811 ?auto_233807 ) ) ( not ( = ?auto_233811 ?auto_233806 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_233805 ?auto_233804 ?auto_233802 ?auto_233801 ?auto_233803 ?auto_233800 )
      ( DELIVER-5PKG-VERIFY ?auto_233801 ?auto_233802 ?auto_233803 ?auto_233804 ?auto_233805 ?auto_233800 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_234563 - OBJ
      ?auto_234564 - OBJ
      ?auto_234565 - OBJ
      ?auto_234566 - OBJ
      ?auto_234567 - OBJ
      ?auto_234562 - LOCATION
    )
    :vars
    (
      ?auto_234573 - LOCATION
      ?auto_234572 - CITY
      ?auto_234570 - LOCATION
      ?auto_234571 - LOCATION
      ?auto_234569 - LOCATION
      ?auto_234568 - LOCATION
      ?auto_234574 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_234573 ?auto_234572 ) ( IN-CITY ?auto_234562 ?auto_234572 ) ( not ( = ?auto_234562 ?auto_234573 ) ) ( OBJ-AT ?auto_234563 ?auto_234573 ) ( IN-CITY ?auto_234570 ?auto_234572 ) ( not ( = ?auto_234562 ?auto_234570 ) ) ( OBJ-AT ?auto_234564 ?auto_234570 ) ( IN-CITY ?auto_234571 ?auto_234572 ) ( not ( = ?auto_234562 ?auto_234571 ) ) ( OBJ-AT ?auto_234567 ?auto_234571 ) ( IN-CITY ?auto_234569 ?auto_234572 ) ( not ( = ?auto_234562 ?auto_234569 ) ) ( OBJ-AT ?auto_234566 ?auto_234569 ) ( IN-CITY ?auto_234568 ?auto_234572 ) ( not ( = ?auto_234562 ?auto_234568 ) ) ( OBJ-AT ?auto_234565 ?auto_234568 ) ( TRUCK-AT ?auto_234574 ?auto_234562 ) ( not ( = ?auto_234565 ?auto_234566 ) ) ( not ( = ?auto_234569 ?auto_234568 ) ) ( not ( = ?auto_234565 ?auto_234567 ) ) ( not ( = ?auto_234566 ?auto_234567 ) ) ( not ( = ?auto_234571 ?auto_234569 ) ) ( not ( = ?auto_234571 ?auto_234568 ) ) ( not ( = ?auto_234565 ?auto_234564 ) ) ( not ( = ?auto_234566 ?auto_234564 ) ) ( not ( = ?auto_234567 ?auto_234564 ) ) ( not ( = ?auto_234570 ?auto_234571 ) ) ( not ( = ?auto_234570 ?auto_234569 ) ) ( not ( = ?auto_234570 ?auto_234568 ) ) ( not ( = ?auto_234565 ?auto_234563 ) ) ( not ( = ?auto_234566 ?auto_234563 ) ) ( not ( = ?auto_234567 ?auto_234563 ) ) ( not ( = ?auto_234564 ?auto_234563 ) ) ( not ( = ?auto_234573 ?auto_234570 ) ) ( not ( = ?auto_234573 ?auto_234571 ) ) ( not ( = ?auto_234573 ?auto_234569 ) ) ( not ( = ?auto_234573 ?auto_234568 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_234565 ?auto_234566 ?auto_234567 ?auto_234563 ?auto_234564 ?auto_234562 )
      ( DELIVER-5PKG-VERIFY ?auto_234563 ?auto_234564 ?auto_234565 ?auto_234566 ?auto_234567 ?auto_234562 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_234618 - OBJ
      ?auto_234619 - OBJ
      ?auto_234620 - OBJ
      ?auto_234621 - OBJ
      ?auto_234622 - OBJ
      ?auto_234617 - LOCATION
    )
    :vars
    (
      ?auto_234628 - LOCATION
      ?auto_234627 - CITY
      ?auto_234625 - LOCATION
      ?auto_234626 - LOCATION
      ?auto_234624 - LOCATION
      ?auto_234623 - LOCATION
      ?auto_234629 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_234628 ?auto_234627 ) ( IN-CITY ?auto_234617 ?auto_234627 ) ( not ( = ?auto_234617 ?auto_234628 ) ) ( OBJ-AT ?auto_234618 ?auto_234628 ) ( IN-CITY ?auto_234625 ?auto_234627 ) ( not ( = ?auto_234617 ?auto_234625 ) ) ( OBJ-AT ?auto_234619 ?auto_234625 ) ( IN-CITY ?auto_234626 ?auto_234627 ) ( not ( = ?auto_234617 ?auto_234626 ) ) ( OBJ-AT ?auto_234621 ?auto_234626 ) ( IN-CITY ?auto_234624 ?auto_234627 ) ( not ( = ?auto_234617 ?auto_234624 ) ) ( OBJ-AT ?auto_234622 ?auto_234624 ) ( IN-CITY ?auto_234623 ?auto_234627 ) ( not ( = ?auto_234617 ?auto_234623 ) ) ( OBJ-AT ?auto_234620 ?auto_234623 ) ( TRUCK-AT ?auto_234629 ?auto_234617 ) ( not ( = ?auto_234620 ?auto_234622 ) ) ( not ( = ?auto_234624 ?auto_234623 ) ) ( not ( = ?auto_234620 ?auto_234621 ) ) ( not ( = ?auto_234622 ?auto_234621 ) ) ( not ( = ?auto_234626 ?auto_234624 ) ) ( not ( = ?auto_234626 ?auto_234623 ) ) ( not ( = ?auto_234620 ?auto_234619 ) ) ( not ( = ?auto_234622 ?auto_234619 ) ) ( not ( = ?auto_234621 ?auto_234619 ) ) ( not ( = ?auto_234625 ?auto_234626 ) ) ( not ( = ?auto_234625 ?auto_234624 ) ) ( not ( = ?auto_234625 ?auto_234623 ) ) ( not ( = ?auto_234620 ?auto_234618 ) ) ( not ( = ?auto_234622 ?auto_234618 ) ) ( not ( = ?auto_234621 ?auto_234618 ) ) ( not ( = ?auto_234619 ?auto_234618 ) ) ( not ( = ?auto_234628 ?auto_234625 ) ) ( not ( = ?auto_234628 ?auto_234626 ) ) ( not ( = ?auto_234628 ?auto_234624 ) ) ( not ( = ?auto_234628 ?auto_234623 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_234620 ?auto_234622 ?auto_234621 ?auto_234618 ?auto_234619 ?auto_234617 )
      ( DELIVER-5PKG-VERIFY ?auto_234618 ?auto_234619 ?auto_234620 ?auto_234621 ?auto_234622 ?auto_234617 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_234847 - OBJ
      ?auto_234848 - OBJ
      ?auto_234849 - OBJ
      ?auto_234850 - OBJ
      ?auto_234851 - OBJ
      ?auto_234846 - LOCATION
    )
    :vars
    (
      ?auto_234857 - LOCATION
      ?auto_234856 - CITY
      ?auto_234854 - LOCATION
      ?auto_234855 - LOCATION
      ?auto_234853 - LOCATION
      ?auto_234852 - LOCATION
      ?auto_234858 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_234857 ?auto_234856 ) ( IN-CITY ?auto_234846 ?auto_234856 ) ( not ( = ?auto_234846 ?auto_234857 ) ) ( OBJ-AT ?auto_234847 ?auto_234857 ) ( IN-CITY ?auto_234854 ?auto_234856 ) ( not ( = ?auto_234846 ?auto_234854 ) ) ( OBJ-AT ?auto_234848 ?auto_234854 ) ( IN-CITY ?auto_234855 ?auto_234856 ) ( not ( = ?auto_234846 ?auto_234855 ) ) ( OBJ-AT ?auto_234851 ?auto_234855 ) ( IN-CITY ?auto_234853 ?auto_234856 ) ( not ( = ?auto_234846 ?auto_234853 ) ) ( OBJ-AT ?auto_234849 ?auto_234853 ) ( IN-CITY ?auto_234852 ?auto_234856 ) ( not ( = ?auto_234846 ?auto_234852 ) ) ( OBJ-AT ?auto_234850 ?auto_234852 ) ( TRUCK-AT ?auto_234858 ?auto_234846 ) ( not ( = ?auto_234850 ?auto_234849 ) ) ( not ( = ?auto_234853 ?auto_234852 ) ) ( not ( = ?auto_234850 ?auto_234851 ) ) ( not ( = ?auto_234849 ?auto_234851 ) ) ( not ( = ?auto_234855 ?auto_234853 ) ) ( not ( = ?auto_234855 ?auto_234852 ) ) ( not ( = ?auto_234850 ?auto_234848 ) ) ( not ( = ?auto_234849 ?auto_234848 ) ) ( not ( = ?auto_234851 ?auto_234848 ) ) ( not ( = ?auto_234854 ?auto_234855 ) ) ( not ( = ?auto_234854 ?auto_234853 ) ) ( not ( = ?auto_234854 ?auto_234852 ) ) ( not ( = ?auto_234850 ?auto_234847 ) ) ( not ( = ?auto_234849 ?auto_234847 ) ) ( not ( = ?auto_234851 ?auto_234847 ) ) ( not ( = ?auto_234848 ?auto_234847 ) ) ( not ( = ?auto_234857 ?auto_234854 ) ) ( not ( = ?auto_234857 ?auto_234855 ) ) ( not ( = ?auto_234857 ?auto_234853 ) ) ( not ( = ?auto_234857 ?auto_234852 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_234850 ?auto_234849 ?auto_234851 ?auto_234847 ?auto_234848 ?auto_234846 )
      ( DELIVER-5PKG-VERIFY ?auto_234847 ?auto_234848 ?auto_234849 ?auto_234850 ?auto_234851 ?auto_234846 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_234961 - OBJ
      ?auto_234962 - OBJ
      ?auto_234963 - OBJ
      ?auto_234964 - OBJ
      ?auto_234965 - OBJ
      ?auto_234960 - LOCATION
    )
    :vars
    (
      ?auto_234971 - LOCATION
      ?auto_234970 - CITY
      ?auto_234968 - LOCATION
      ?auto_234969 - LOCATION
      ?auto_234967 - LOCATION
      ?auto_234966 - LOCATION
      ?auto_234972 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_234971 ?auto_234970 ) ( IN-CITY ?auto_234960 ?auto_234970 ) ( not ( = ?auto_234960 ?auto_234971 ) ) ( OBJ-AT ?auto_234961 ?auto_234971 ) ( IN-CITY ?auto_234968 ?auto_234970 ) ( not ( = ?auto_234960 ?auto_234968 ) ) ( OBJ-AT ?auto_234962 ?auto_234968 ) ( IN-CITY ?auto_234969 ?auto_234970 ) ( not ( = ?auto_234960 ?auto_234969 ) ) ( OBJ-AT ?auto_234964 ?auto_234969 ) ( IN-CITY ?auto_234967 ?auto_234970 ) ( not ( = ?auto_234960 ?auto_234967 ) ) ( OBJ-AT ?auto_234963 ?auto_234967 ) ( IN-CITY ?auto_234966 ?auto_234970 ) ( not ( = ?auto_234960 ?auto_234966 ) ) ( OBJ-AT ?auto_234965 ?auto_234966 ) ( TRUCK-AT ?auto_234972 ?auto_234960 ) ( not ( = ?auto_234965 ?auto_234963 ) ) ( not ( = ?auto_234967 ?auto_234966 ) ) ( not ( = ?auto_234965 ?auto_234964 ) ) ( not ( = ?auto_234963 ?auto_234964 ) ) ( not ( = ?auto_234969 ?auto_234967 ) ) ( not ( = ?auto_234969 ?auto_234966 ) ) ( not ( = ?auto_234965 ?auto_234962 ) ) ( not ( = ?auto_234963 ?auto_234962 ) ) ( not ( = ?auto_234964 ?auto_234962 ) ) ( not ( = ?auto_234968 ?auto_234969 ) ) ( not ( = ?auto_234968 ?auto_234967 ) ) ( not ( = ?auto_234968 ?auto_234966 ) ) ( not ( = ?auto_234965 ?auto_234961 ) ) ( not ( = ?auto_234963 ?auto_234961 ) ) ( not ( = ?auto_234964 ?auto_234961 ) ) ( not ( = ?auto_234962 ?auto_234961 ) ) ( not ( = ?auto_234971 ?auto_234968 ) ) ( not ( = ?auto_234971 ?auto_234969 ) ) ( not ( = ?auto_234971 ?auto_234967 ) ) ( not ( = ?auto_234971 ?auto_234966 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_234965 ?auto_234963 ?auto_234964 ?auto_234961 ?auto_234962 ?auto_234960 )
      ( DELIVER-5PKG-VERIFY ?auto_234961 ?auto_234962 ?auto_234963 ?auto_234964 ?auto_234965 ?auto_234960 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_235190 - OBJ
      ?auto_235191 - OBJ
      ?auto_235192 - OBJ
      ?auto_235193 - OBJ
      ?auto_235194 - OBJ
      ?auto_235189 - LOCATION
    )
    :vars
    (
      ?auto_235200 - LOCATION
      ?auto_235199 - CITY
      ?auto_235197 - LOCATION
      ?auto_235198 - LOCATION
      ?auto_235196 - LOCATION
      ?auto_235195 - LOCATION
      ?auto_235201 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_235200 ?auto_235199 ) ( IN-CITY ?auto_235189 ?auto_235199 ) ( not ( = ?auto_235189 ?auto_235200 ) ) ( OBJ-AT ?auto_235190 ?auto_235200 ) ( IN-CITY ?auto_235197 ?auto_235199 ) ( not ( = ?auto_235189 ?auto_235197 ) ) ( OBJ-AT ?auto_235191 ?auto_235197 ) ( IN-CITY ?auto_235198 ?auto_235199 ) ( not ( = ?auto_235189 ?auto_235198 ) ) ( OBJ-AT ?auto_235192 ?auto_235198 ) ( IN-CITY ?auto_235196 ?auto_235199 ) ( not ( = ?auto_235189 ?auto_235196 ) ) ( OBJ-AT ?auto_235194 ?auto_235196 ) ( IN-CITY ?auto_235195 ?auto_235199 ) ( not ( = ?auto_235189 ?auto_235195 ) ) ( OBJ-AT ?auto_235193 ?auto_235195 ) ( TRUCK-AT ?auto_235201 ?auto_235189 ) ( not ( = ?auto_235193 ?auto_235194 ) ) ( not ( = ?auto_235196 ?auto_235195 ) ) ( not ( = ?auto_235193 ?auto_235192 ) ) ( not ( = ?auto_235194 ?auto_235192 ) ) ( not ( = ?auto_235198 ?auto_235196 ) ) ( not ( = ?auto_235198 ?auto_235195 ) ) ( not ( = ?auto_235193 ?auto_235191 ) ) ( not ( = ?auto_235194 ?auto_235191 ) ) ( not ( = ?auto_235192 ?auto_235191 ) ) ( not ( = ?auto_235197 ?auto_235198 ) ) ( not ( = ?auto_235197 ?auto_235196 ) ) ( not ( = ?auto_235197 ?auto_235195 ) ) ( not ( = ?auto_235193 ?auto_235190 ) ) ( not ( = ?auto_235194 ?auto_235190 ) ) ( not ( = ?auto_235192 ?auto_235190 ) ) ( not ( = ?auto_235191 ?auto_235190 ) ) ( not ( = ?auto_235200 ?auto_235197 ) ) ( not ( = ?auto_235200 ?auto_235198 ) ) ( not ( = ?auto_235200 ?auto_235196 ) ) ( not ( = ?auto_235200 ?auto_235195 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_235193 ?auto_235194 ?auto_235192 ?auto_235190 ?auto_235191 ?auto_235189 )
      ( DELIVER-5PKG-VERIFY ?auto_235190 ?auto_235191 ?auto_235192 ?auto_235193 ?auto_235194 ?auto_235189 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_235245 - OBJ
      ?auto_235246 - OBJ
      ?auto_235247 - OBJ
      ?auto_235248 - OBJ
      ?auto_235249 - OBJ
      ?auto_235244 - LOCATION
    )
    :vars
    (
      ?auto_235255 - LOCATION
      ?auto_235254 - CITY
      ?auto_235252 - LOCATION
      ?auto_235253 - LOCATION
      ?auto_235251 - LOCATION
      ?auto_235250 - LOCATION
      ?auto_235256 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_235255 ?auto_235254 ) ( IN-CITY ?auto_235244 ?auto_235254 ) ( not ( = ?auto_235244 ?auto_235255 ) ) ( OBJ-AT ?auto_235245 ?auto_235255 ) ( IN-CITY ?auto_235252 ?auto_235254 ) ( not ( = ?auto_235244 ?auto_235252 ) ) ( OBJ-AT ?auto_235246 ?auto_235252 ) ( IN-CITY ?auto_235253 ?auto_235254 ) ( not ( = ?auto_235244 ?auto_235253 ) ) ( OBJ-AT ?auto_235247 ?auto_235253 ) ( IN-CITY ?auto_235251 ?auto_235254 ) ( not ( = ?auto_235244 ?auto_235251 ) ) ( OBJ-AT ?auto_235248 ?auto_235251 ) ( IN-CITY ?auto_235250 ?auto_235254 ) ( not ( = ?auto_235244 ?auto_235250 ) ) ( OBJ-AT ?auto_235249 ?auto_235250 ) ( TRUCK-AT ?auto_235256 ?auto_235244 ) ( not ( = ?auto_235249 ?auto_235248 ) ) ( not ( = ?auto_235251 ?auto_235250 ) ) ( not ( = ?auto_235249 ?auto_235247 ) ) ( not ( = ?auto_235248 ?auto_235247 ) ) ( not ( = ?auto_235253 ?auto_235251 ) ) ( not ( = ?auto_235253 ?auto_235250 ) ) ( not ( = ?auto_235249 ?auto_235246 ) ) ( not ( = ?auto_235248 ?auto_235246 ) ) ( not ( = ?auto_235247 ?auto_235246 ) ) ( not ( = ?auto_235252 ?auto_235253 ) ) ( not ( = ?auto_235252 ?auto_235251 ) ) ( not ( = ?auto_235252 ?auto_235250 ) ) ( not ( = ?auto_235249 ?auto_235245 ) ) ( not ( = ?auto_235248 ?auto_235245 ) ) ( not ( = ?auto_235247 ?auto_235245 ) ) ( not ( = ?auto_235246 ?auto_235245 ) ) ( not ( = ?auto_235255 ?auto_235252 ) ) ( not ( = ?auto_235255 ?auto_235253 ) ) ( not ( = ?auto_235255 ?auto_235251 ) ) ( not ( = ?auto_235255 ?auto_235250 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_235249 ?auto_235248 ?auto_235247 ?auto_235245 ?auto_235246 ?auto_235244 )
      ( DELIVER-5PKG-VERIFY ?auto_235245 ?auto_235246 ?auto_235247 ?auto_235248 ?auto_235249 ?auto_235244 ) )
  )

)

