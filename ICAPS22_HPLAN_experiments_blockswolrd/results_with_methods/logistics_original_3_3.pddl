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
      ?auto_10810 - OBJ
      ?auto_10809 - LOCATION
    )
    :vars
    (
      ?auto_10811 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10811 ?auto_10809 ) ( IN-TRUCK ?auto_10810 ?auto_10811 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_10810 ?auto_10811 ?auto_10809 )
      ( DELIVER-1PKG-VERIFY ?auto_10810 ?auto_10809 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10822 - OBJ
      ?auto_10821 - LOCATION
    )
    :vars
    (
      ?auto_10823 - TRUCK
      ?auto_10824 - LOCATION
      ?auto_10825 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10822 ?auto_10823 ) ( TRUCK-AT ?auto_10823 ?auto_10824 ) ( IN-CITY ?auto_10824 ?auto_10825 ) ( IN-CITY ?auto_10821 ?auto_10825 ) ( not ( = ?auto_10821 ?auto_10824 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10823 ?auto_10824 ?auto_10821 ?auto_10825 )
      ( DELIVER-1PKG ?auto_10822 ?auto_10821 )
      ( DELIVER-1PKG-VERIFY ?auto_10822 ?auto_10821 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10840 - OBJ
      ?auto_10839 - LOCATION
    )
    :vars
    (
      ?auto_10842 - TRUCK
      ?auto_10843 - LOCATION
      ?auto_10841 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10842 ?auto_10843 ) ( IN-CITY ?auto_10843 ?auto_10841 ) ( IN-CITY ?auto_10839 ?auto_10841 ) ( not ( = ?auto_10839 ?auto_10843 ) ) ( OBJ-AT ?auto_10840 ?auto_10843 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10840 ?auto_10842 ?auto_10843 )
      ( DELIVER-1PKG ?auto_10840 ?auto_10839 )
      ( DELIVER-1PKG-VERIFY ?auto_10840 ?auto_10839 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10858 - OBJ
      ?auto_10857 - LOCATION
    )
    :vars
    (
      ?auto_10860 - LOCATION
      ?auto_10859 - CITY
      ?auto_10861 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10860 ?auto_10859 ) ( IN-CITY ?auto_10857 ?auto_10859 ) ( not ( = ?auto_10857 ?auto_10860 ) ) ( OBJ-AT ?auto_10858 ?auto_10860 ) ( TRUCK-AT ?auto_10861 ?auto_10857 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10861 ?auto_10857 ?auto_10860 ?auto_10859 )
      ( DELIVER-1PKG ?auto_10858 ?auto_10857 )
      ( DELIVER-1PKG-VERIFY ?auto_10858 ?auto_10857 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10915 - OBJ
      ?auto_10914 - LOCATION
    )
    :vars
    (
      ?auto_10916 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10916 ?auto_10914 ) ( IN-TRUCK ?auto_10915 ?auto_10916 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_10915 ?auto_10916 ?auto_10914 )
      ( DELIVER-1PKG-VERIFY ?auto_10915 ?auto_10914 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10918 - OBJ
      ?auto_10919 - OBJ
      ?auto_10917 - LOCATION
    )
    :vars
    (
      ?auto_10920 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10920 ?auto_10917 ) ( IN-TRUCK ?auto_10919 ?auto_10920 ) ( OBJ-AT ?auto_10918 ?auto_10917 ) ( not ( = ?auto_10918 ?auto_10919 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10919 ?auto_10917 )
      ( DELIVER-2PKG-VERIFY ?auto_10918 ?auto_10919 ?auto_10917 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10922 - OBJ
      ?auto_10923 - OBJ
      ?auto_10921 - LOCATION
    )
    :vars
    (
      ?auto_10924 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10924 ?auto_10921 ) ( IN-TRUCK ?auto_10922 ?auto_10924 ) ( OBJ-AT ?auto_10923 ?auto_10921 ) ( not ( = ?auto_10922 ?auto_10923 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10922 ?auto_10921 )
      ( DELIVER-2PKG-VERIFY ?auto_10922 ?auto_10923 ?auto_10921 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10930 - OBJ
      ?auto_10931 - OBJ
      ?auto_10932 - OBJ
      ?auto_10929 - LOCATION
    )
    :vars
    (
      ?auto_10933 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10933 ?auto_10929 ) ( IN-TRUCK ?auto_10932 ?auto_10933 ) ( OBJ-AT ?auto_10930 ?auto_10929 ) ( OBJ-AT ?auto_10931 ?auto_10929 ) ( not ( = ?auto_10930 ?auto_10931 ) ) ( not ( = ?auto_10930 ?auto_10932 ) ) ( not ( = ?auto_10931 ?auto_10932 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10932 ?auto_10929 )
      ( DELIVER-3PKG-VERIFY ?auto_10930 ?auto_10931 ?auto_10932 ?auto_10929 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10935 - OBJ
      ?auto_10936 - OBJ
      ?auto_10937 - OBJ
      ?auto_10934 - LOCATION
    )
    :vars
    (
      ?auto_10938 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10938 ?auto_10934 ) ( IN-TRUCK ?auto_10936 ?auto_10938 ) ( OBJ-AT ?auto_10935 ?auto_10934 ) ( OBJ-AT ?auto_10937 ?auto_10934 ) ( not ( = ?auto_10935 ?auto_10936 ) ) ( not ( = ?auto_10935 ?auto_10937 ) ) ( not ( = ?auto_10936 ?auto_10937 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10936 ?auto_10934 )
      ( DELIVER-3PKG-VERIFY ?auto_10935 ?auto_10936 ?auto_10937 ?auto_10934 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10945 - OBJ
      ?auto_10946 - OBJ
      ?auto_10947 - OBJ
      ?auto_10944 - LOCATION
    )
    :vars
    (
      ?auto_10948 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10948 ?auto_10944 ) ( IN-TRUCK ?auto_10945 ?auto_10948 ) ( OBJ-AT ?auto_10946 ?auto_10944 ) ( OBJ-AT ?auto_10947 ?auto_10944 ) ( not ( = ?auto_10945 ?auto_10946 ) ) ( not ( = ?auto_10945 ?auto_10947 ) ) ( not ( = ?auto_10946 ?auto_10947 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10945 ?auto_10944 )
      ( DELIVER-3PKG-VERIFY ?auto_10945 ?auto_10946 ?auto_10947 ?auto_10944 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10965 - OBJ
      ?auto_10964 - LOCATION
    )
    :vars
    (
      ?auto_10966 - TRUCK
      ?auto_10967 - LOCATION
      ?auto_10968 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10965 ?auto_10966 ) ( TRUCK-AT ?auto_10966 ?auto_10967 ) ( IN-CITY ?auto_10967 ?auto_10968 ) ( IN-CITY ?auto_10964 ?auto_10968 ) ( not ( = ?auto_10964 ?auto_10967 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10966 ?auto_10967 ?auto_10964 ?auto_10968 )
      ( DELIVER-1PKG ?auto_10965 ?auto_10964 )
      ( DELIVER-1PKG-VERIFY ?auto_10965 ?auto_10964 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10970 - OBJ
      ?auto_10971 - OBJ
      ?auto_10969 - LOCATION
    )
    :vars
    (
      ?auto_10973 - TRUCK
      ?auto_10974 - LOCATION
      ?auto_10972 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10971 ?auto_10973 ) ( TRUCK-AT ?auto_10973 ?auto_10974 ) ( IN-CITY ?auto_10974 ?auto_10972 ) ( IN-CITY ?auto_10969 ?auto_10972 ) ( not ( = ?auto_10969 ?auto_10974 ) ) ( OBJ-AT ?auto_10970 ?auto_10969 ) ( not ( = ?auto_10970 ?auto_10971 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10971 ?auto_10969 )
      ( DELIVER-2PKG-VERIFY ?auto_10970 ?auto_10971 ?auto_10969 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10976 - OBJ
      ?auto_10977 - OBJ
      ?auto_10975 - LOCATION
    )
    :vars
    (
      ?auto_10978 - TRUCK
      ?auto_10979 - LOCATION
      ?auto_10980 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10976 ?auto_10978 ) ( TRUCK-AT ?auto_10978 ?auto_10979 ) ( IN-CITY ?auto_10979 ?auto_10980 ) ( IN-CITY ?auto_10975 ?auto_10980 ) ( not ( = ?auto_10975 ?auto_10979 ) ) ( OBJ-AT ?auto_10977 ?auto_10975 ) ( not ( = ?auto_10977 ?auto_10976 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10977 ?auto_10976 ?auto_10975 )
      ( DELIVER-2PKG-VERIFY ?auto_10976 ?auto_10977 ?auto_10975 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10989 - OBJ
      ?auto_10990 - OBJ
      ?auto_10991 - OBJ
      ?auto_10988 - LOCATION
    )
    :vars
    (
      ?auto_10992 - TRUCK
      ?auto_10993 - LOCATION
      ?auto_10994 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10991 ?auto_10992 ) ( TRUCK-AT ?auto_10992 ?auto_10993 ) ( IN-CITY ?auto_10993 ?auto_10994 ) ( IN-CITY ?auto_10988 ?auto_10994 ) ( not ( = ?auto_10988 ?auto_10993 ) ) ( OBJ-AT ?auto_10990 ?auto_10988 ) ( not ( = ?auto_10990 ?auto_10991 ) ) ( OBJ-AT ?auto_10989 ?auto_10988 ) ( not ( = ?auto_10989 ?auto_10990 ) ) ( not ( = ?auto_10989 ?auto_10991 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10990 ?auto_10991 ?auto_10988 )
      ( DELIVER-3PKG-VERIFY ?auto_10989 ?auto_10990 ?auto_10991 ?auto_10988 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10996 - OBJ
      ?auto_10997 - OBJ
      ?auto_10998 - OBJ
      ?auto_10995 - LOCATION
    )
    :vars
    (
      ?auto_10999 - TRUCK
      ?auto_11000 - LOCATION
      ?auto_11001 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10997 ?auto_10999 ) ( TRUCK-AT ?auto_10999 ?auto_11000 ) ( IN-CITY ?auto_11000 ?auto_11001 ) ( IN-CITY ?auto_10995 ?auto_11001 ) ( not ( = ?auto_10995 ?auto_11000 ) ) ( OBJ-AT ?auto_10996 ?auto_10995 ) ( not ( = ?auto_10996 ?auto_10997 ) ) ( OBJ-AT ?auto_10998 ?auto_10995 ) ( not ( = ?auto_10996 ?auto_10998 ) ) ( not ( = ?auto_10997 ?auto_10998 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10996 ?auto_10997 ?auto_10995 )
      ( DELIVER-3PKG-VERIFY ?auto_10996 ?auto_10997 ?auto_10998 ?auto_10995 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11010 - OBJ
      ?auto_11011 - OBJ
      ?auto_11012 - OBJ
      ?auto_11009 - LOCATION
    )
    :vars
    (
      ?auto_11013 - TRUCK
      ?auto_11014 - LOCATION
      ?auto_11015 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11010 ?auto_11013 ) ( TRUCK-AT ?auto_11013 ?auto_11014 ) ( IN-CITY ?auto_11014 ?auto_11015 ) ( IN-CITY ?auto_11009 ?auto_11015 ) ( not ( = ?auto_11009 ?auto_11014 ) ) ( OBJ-AT ?auto_11011 ?auto_11009 ) ( not ( = ?auto_11011 ?auto_11010 ) ) ( OBJ-AT ?auto_11012 ?auto_11009 ) ( not ( = ?auto_11010 ?auto_11012 ) ) ( not ( = ?auto_11011 ?auto_11012 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11011 ?auto_11010 ?auto_11009 )
      ( DELIVER-3PKG-VERIFY ?auto_11010 ?auto_11011 ?auto_11012 ?auto_11009 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11039 - OBJ
      ?auto_11038 - LOCATION
    )
    :vars
    (
      ?auto_11041 - TRUCK
      ?auto_11042 - LOCATION
      ?auto_11043 - CITY
      ?auto_11040 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11041 ?auto_11042 ) ( IN-CITY ?auto_11042 ?auto_11043 ) ( IN-CITY ?auto_11038 ?auto_11043 ) ( not ( = ?auto_11038 ?auto_11042 ) ) ( OBJ-AT ?auto_11040 ?auto_11038 ) ( not ( = ?auto_11040 ?auto_11039 ) ) ( OBJ-AT ?auto_11039 ?auto_11042 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11039 ?auto_11041 ?auto_11042 )
      ( DELIVER-2PKG ?auto_11040 ?auto_11039 ?auto_11038 )
      ( DELIVER-1PKG-VERIFY ?auto_11039 ?auto_11038 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11045 - OBJ
      ?auto_11046 - OBJ
      ?auto_11044 - LOCATION
    )
    :vars
    (
      ?auto_11047 - TRUCK
      ?auto_11048 - LOCATION
      ?auto_11049 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11047 ?auto_11048 ) ( IN-CITY ?auto_11048 ?auto_11049 ) ( IN-CITY ?auto_11044 ?auto_11049 ) ( not ( = ?auto_11044 ?auto_11048 ) ) ( OBJ-AT ?auto_11045 ?auto_11044 ) ( not ( = ?auto_11045 ?auto_11046 ) ) ( OBJ-AT ?auto_11046 ?auto_11048 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11046 ?auto_11044 )
      ( DELIVER-2PKG-VERIFY ?auto_11045 ?auto_11046 ?auto_11044 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11051 - OBJ
      ?auto_11052 - OBJ
      ?auto_11050 - LOCATION
    )
    :vars
    (
      ?auto_11053 - TRUCK
      ?auto_11055 - LOCATION
      ?auto_11054 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11053 ?auto_11055 ) ( IN-CITY ?auto_11055 ?auto_11054 ) ( IN-CITY ?auto_11050 ?auto_11054 ) ( not ( = ?auto_11050 ?auto_11055 ) ) ( OBJ-AT ?auto_11052 ?auto_11050 ) ( not ( = ?auto_11052 ?auto_11051 ) ) ( OBJ-AT ?auto_11051 ?auto_11055 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11052 ?auto_11051 ?auto_11050 )
      ( DELIVER-2PKG-VERIFY ?auto_11051 ?auto_11052 ?auto_11050 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11064 - OBJ
      ?auto_11065 - OBJ
      ?auto_11066 - OBJ
      ?auto_11063 - LOCATION
    )
    :vars
    (
      ?auto_11067 - TRUCK
      ?auto_11069 - LOCATION
      ?auto_11068 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11067 ?auto_11069 ) ( IN-CITY ?auto_11069 ?auto_11068 ) ( IN-CITY ?auto_11063 ?auto_11068 ) ( not ( = ?auto_11063 ?auto_11069 ) ) ( OBJ-AT ?auto_11065 ?auto_11063 ) ( not ( = ?auto_11065 ?auto_11066 ) ) ( OBJ-AT ?auto_11066 ?auto_11069 ) ( OBJ-AT ?auto_11064 ?auto_11063 ) ( not ( = ?auto_11064 ?auto_11065 ) ) ( not ( = ?auto_11064 ?auto_11066 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11065 ?auto_11066 ?auto_11063 )
      ( DELIVER-3PKG-VERIFY ?auto_11064 ?auto_11065 ?auto_11066 ?auto_11063 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11071 - OBJ
      ?auto_11072 - OBJ
      ?auto_11073 - OBJ
      ?auto_11070 - LOCATION
    )
    :vars
    (
      ?auto_11074 - TRUCK
      ?auto_11076 - LOCATION
      ?auto_11075 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11074 ?auto_11076 ) ( IN-CITY ?auto_11076 ?auto_11075 ) ( IN-CITY ?auto_11070 ?auto_11075 ) ( not ( = ?auto_11070 ?auto_11076 ) ) ( OBJ-AT ?auto_11073 ?auto_11070 ) ( not ( = ?auto_11073 ?auto_11072 ) ) ( OBJ-AT ?auto_11072 ?auto_11076 ) ( OBJ-AT ?auto_11071 ?auto_11070 ) ( not ( = ?auto_11071 ?auto_11072 ) ) ( not ( = ?auto_11071 ?auto_11073 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11073 ?auto_11072 ?auto_11070 )
      ( DELIVER-3PKG-VERIFY ?auto_11071 ?auto_11072 ?auto_11073 ?auto_11070 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11085 - OBJ
      ?auto_11086 - OBJ
      ?auto_11087 - OBJ
      ?auto_11084 - LOCATION
    )
    :vars
    (
      ?auto_11088 - TRUCK
      ?auto_11090 - LOCATION
      ?auto_11089 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11088 ?auto_11090 ) ( IN-CITY ?auto_11090 ?auto_11089 ) ( IN-CITY ?auto_11084 ?auto_11089 ) ( not ( = ?auto_11084 ?auto_11090 ) ) ( OBJ-AT ?auto_11086 ?auto_11084 ) ( not ( = ?auto_11086 ?auto_11085 ) ) ( OBJ-AT ?auto_11085 ?auto_11090 ) ( OBJ-AT ?auto_11087 ?auto_11084 ) ( not ( = ?auto_11085 ?auto_11087 ) ) ( not ( = ?auto_11086 ?auto_11087 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11086 ?auto_11085 ?auto_11084 )
      ( DELIVER-3PKG-VERIFY ?auto_11085 ?auto_11086 ?auto_11087 ?auto_11084 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11114 - OBJ
      ?auto_11113 - LOCATION
    )
    :vars
    (
      ?auto_11118 - LOCATION
      ?auto_11117 - CITY
      ?auto_11116 - OBJ
      ?auto_11115 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11118 ?auto_11117 ) ( IN-CITY ?auto_11113 ?auto_11117 ) ( not ( = ?auto_11113 ?auto_11118 ) ) ( OBJ-AT ?auto_11116 ?auto_11113 ) ( not ( = ?auto_11116 ?auto_11114 ) ) ( OBJ-AT ?auto_11114 ?auto_11118 ) ( TRUCK-AT ?auto_11115 ?auto_11113 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11115 ?auto_11113 ?auto_11118 ?auto_11117 )
      ( DELIVER-2PKG ?auto_11116 ?auto_11114 ?auto_11113 )
      ( DELIVER-1PKG-VERIFY ?auto_11114 ?auto_11113 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11120 - OBJ
      ?auto_11121 - OBJ
      ?auto_11119 - LOCATION
    )
    :vars
    (
      ?auto_11122 - LOCATION
      ?auto_11124 - CITY
      ?auto_11123 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11122 ?auto_11124 ) ( IN-CITY ?auto_11119 ?auto_11124 ) ( not ( = ?auto_11119 ?auto_11122 ) ) ( OBJ-AT ?auto_11120 ?auto_11119 ) ( not ( = ?auto_11120 ?auto_11121 ) ) ( OBJ-AT ?auto_11121 ?auto_11122 ) ( TRUCK-AT ?auto_11123 ?auto_11119 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11121 ?auto_11119 )
      ( DELIVER-2PKG-VERIFY ?auto_11120 ?auto_11121 ?auto_11119 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11126 - OBJ
      ?auto_11127 - OBJ
      ?auto_11125 - LOCATION
    )
    :vars
    (
      ?auto_11130 - LOCATION
      ?auto_11129 - CITY
      ?auto_11128 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11130 ?auto_11129 ) ( IN-CITY ?auto_11125 ?auto_11129 ) ( not ( = ?auto_11125 ?auto_11130 ) ) ( OBJ-AT ?auto_11127 ?auto_11125 ) ( not ( = ?auto_11127 ?auto_11126 ) ) ( OBJ-AT ?auto_11126 ?auto_11130 ) ( TRUCK-AT ?auto_11128 ?auto_11125 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11127 ?auto_11126 ?auto_11125 )
      ( DELIVER-2PKG-VERIFY ?auto_11126 ?auto_11127 ?auto_11125 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11139 - OBJ
      ?auto_11140 - OBJ
      ?auto_11141 - OBJ
      ?auto_11138 - LOCATION
    )
    :vars
    (
      ?auto_11144 - LOCATION
      ?auto_11143 - CITY
      ?auto_11142 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11144 ?auto_11143 ) ( IN-CITY ?auto_11138 ?auto_11143 ) ( not ( = ?auto_11138 ?auto_11144 ) ) ( OBJ-AT ?auto_11139 ?auto_11138 ) ( not ( = ?auto_11139 ?auto_11141 ) ) ( OBJ-AT ?auto_11141 ?auto_11144 ) ( TRUCK-AT ?auto_11142 ?auto_11138 ) ( OBJ-AT ?auto_11140 ?auto_11138 ) ( not ( = ?auto_11139 ?auto_11140 ) ) ( not ( = ?auto_11140 ?auto_11141 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11139 ?auto_11141 ?auto_11138 )
      ( DELIVER-3PKG-VERIFY ?auto_11139 ?auto_11140 ?auto_11141 ?auto_11138 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11146 - OBJ
      ?auto_11147 - OBJ
      ?auto_11148 - OBJ
      ?auto_11145 - LOCATION
    )
    :vars
    (
      ?auto_11151 - LOCATION
      ?auto_11150 - CITY
      ?auto_11149 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11151 ?auto_11150 ) ( IN-CITY ?auto_11145 ?auto_11150 ) ( not ( = ?auto_11145 ?auto_11151 ) ) ( OBJ-AT ?auto_11146 ?auto_11145 ) ( not ( = ?auto_11146 ?auto_11147 ) ) ( OBJ-AT ?auto_11147 ?auto_11151 ) ( TRUCK-AT ?auto_11149 ?auto_11145 ) ( OBJ-AT ?auto_11148 ?auto_11145 ) ( not ( = ?auto_11146 ?auto_11148 ) ) ( not ( = ?auto_11147 ?auto_11148 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11146 ?auto_11147 ?auto_11145 )
      ( DELIVER-3PKG-VERIFY ?auto_11146 ?auto_11147 ?auto_11148 ?auto_11145 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11160 - OBJ
      ?auto_11161 - OBJ
      ?auto_11162 - OBJ
      ?auto_11159 - LOCATION
    )
    :vars
    (
      ?auto_11165 - LOCATION
      ?auto_11164 - CITY
      ?auto_11163 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11165 ?auto_11164 ) ( IN-CITY ?auto_11159 ?auto_11164 ) ( not ( = ?auto_11159 ?auto_11165 ) ) ( OBJ-AT ?auto_11162 ?auto_11159 ) ( not ( = ?auto_11162 ?auto_11160 ) ) ( OBJ-AT ?auto_11160 ?auto_11165 ) ( TRUCK-AT ?auto_11163 ?auto_11159 ) ( OBJ-AT ?auto_11161 ?auto_11159 ) ( not ( = ?auto_11160 ?auto_11161 ) ) ( not ( = ?auto_11161 ?auto_11162 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11162 ?auto_11160 ?auto_11159 )
      ( DELIVER-3PKG-VERIFY ?auto_11160 ?auto_11161 ?auto_11162 ?auto_11159 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11189 - OBJ
      ?auto_11188 - LOCATION
    )
    :vars
    (
      ?auto_11192 - LOCATION
      ?auto_11191 - CITY
      ?auto_11193 - OBJ
      ?auto_11190 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11192 ?auto_11191 ) ( IN-CITY ?auto_11188 ?auto_11191 ) ( not ( = ?auto_11188 ?auto_11192 ) ) ( not ( = ?auto_11193 ?auto_11189 ) ) ( OBJ-AT ?auto_11189 ?auto_11192 ) ( TRUCK-AT ?auto_11190 ?auto_11188 ) ( IN-TRUCK ?auto_11193 ?auto_11190 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11193 ?auto_11188 )
      ( DELIVER-2PKG ?auto_11193 ?auto_11189 ?auto_11188 )
      ( DELIVER-1PKG-VERIFY ?auto_11189 ?auto_11188 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11195 - OBJ
      ?auto_11196 - OBJ
      ?auto_11194 - LOCATION
    )
    :vars
    (
      ?auto_11199 - LOCATION
      ?auto_11197 - CITY
      ?auto_11198 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11199 ?auto_11197 ) ( IN-CITY ?auto_11194 ?auto_11197 ) ( not ( = ?auto_11194 ?auto_11199 ) ) ( not ( = ?auto_11195 ?auto_11196 ) ) ( OBJ-AT ?auto_11196 ?auto_11199 ) ( TRUCK-AT ?auto_11198 ?auto_11194 ) ( IN-TRUCK ?auto_11195 ?auto_11198 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11196 ?auto_11194 )
      ( DELIVER-2PKG-VERIFY ?auto_11195 ?auto_11196 ?auto_11194 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11201 - OBJ
      ?auto_11202 - OBJ
      ?auto_11200 - LOCATION
    )
    :vars
    (
      ?auto_11203 - LOCATION
      ?auto_11205 - CITY
      ?auto_11204 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11203 ?auto_11205 ) ( IN-CITY ?auto_11200 ?auto_11205 ) ( not ( = ?auto_11200 ?auto_11203 ) ) ( not ( = ?auto_11202 ?auto_11201 ) ) ( OBJ-AT ?auto_11201 ?auto_11203 ) ( TRUCK-AT ?auto_11204 ?auto_11200 ) ( IN-TRUCK ?auto_11202 ?auto_11204 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11202 ?auto_11201 ?auto_11200 )
      ( DELIVER-2PKG-VERIFY ?auto_11201 ?auto_11202 ?auto_11200 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11264 - OBJ
      ?auto_11263 - LOCATION
    )
    :vars
    (
      ?auto_11266 - LOCATION
      ?auto_11268 - CITY
      ?auto_11265 - OBJ
      ?auto_11267 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11266 ?auto_11268 ) ( IN-CITY ?auto_11263 ?auto_11268 ) ( not ( = ?auto_11263 ?auto_11266 ) ) ( not ( = ?auto_11265 ?auto_11264 ) ) ( OBJ-AT ?auto_11264 ?auto_11266 ) ( IN-TRUCK ?auto_11265 ?auto_11267 ) ( TRUCK-AT ?auto_11267 ?auto_11266 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11267 ?auto_11266 ?auto_11263 ?auto_11268 )
      ( DELIVER-2PKG ?auto_11265 ?auto_11264 ?auto_11263 )
      ( DELIVER-1PKG-VERIFY ?auto_11264 ?auto_11263 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11270 - OBJ
      ?auto_11271 - OBJ
      ?auto_11269 - LOCATION
    )
    :vars
    (
      ?auto_11272 - LOCATION
      ?auto_11273 - CITY
      ?auto_11274 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11272 ?auto_11273 ) ( IN-CITY ?auto_11269 ?auto_11273 ) ( not ( = ?auto_11269 ?auto_11272 ) ) ( not ( = ?auto_11270 ?auto_11271 ) ) ( OBJ-AT ?auto_11271 ?auto_11272 ) ( IN-TRUCK ?auto_11270 ?auto_11274 ) ( TRUCK-AT ?auto_11274 ?auto_11272 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11271 ?auto_11269 )
      ( DELIVER-2PKG-VERIFY ?auto_11270 ?auto_11271 ?auto_11269 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11276 - OBJ
      ?auto_11277 - OBJ
      ?auto_11275 - LOCATION
    )
    :vars
    (
      ?auto_11279 - LOCATION
      ?auto_11280 - CITY
      ?auto_11278 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11279 ?auto_11280 ) ( IN-CITY ?auto_11275 ?auto_11280 ) ( not ( = ?auto_11275 ?auto_11279 ) ) ( not ( = ?auto_11277 ?auto_11276 ) ) ( OBJ-AT ?auto_11276 ?auto_11279 ) ( IN-TRUCK ?auto_11277 ?auto_11278 ) ( TRUCK-AT ?auto_11278 ?auto_11279 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11277 ?auto_11276 ?auto_11275 )
      ( DELIVER-2PKG-VERIFY ?auto_11276 ?auto_11277 ?auto_11275 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11339 - OBJ
      ?auto_11338 - LOCATION
    )
    :vars
    (
      ?auto_11341 - LOCATION
      ?auto_11343 - CITY
      ?auto_11342 - OBJ
      ?auto_11340 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11341 ?auto_11343 ) ( IN-CITY ?auto_11338 ?auto_11343 ) ( not ( = ?auto_11338 ?auto_11341 ) ) ( not ( = ?auto_11342 ?auto_11339 ) ) ( OBJ-AT ?auto_11339 ?auto_11341 ) ( TRUCK-AT ?auto_11340 ?auto_11341 ) ( OBJ-AT ?auto_11342 ?auto_11341 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11342 ?auto_11340 ?auto_11341 )
      ( DELIVER-2PKG ?auto_11342 ?auto_11339 ?auto_11338 )
      ( DELIVER-1PKG-VERIFY ?auto_11339 ?auto_11338 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11345 - OBJ
      ?auto_11346 - OBJ
      ?auto_11344 - LOCATION
    )
    :vars
    (
      ?auto_11349 - LOCATION
      ?auto_11348 - CITY
      ?auto_11347 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11349 ?auto_11348 ) ( IN-CITY ?auto_11344 ?auto_11348 ) ( not ( = ?auto_11344 ?auto_11349 ) ) ( not ( = ?auto_11345 ?auto_11346 ) ) ( OBJ-AT ?auto_11346 ?auto_11349 ) ( TRUCK-AT ?auto_11347 ?auto_11349 ) ( OBJ-AT ?auto_11345 ?auto_11349 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11346 ?auto_11344 )
      ( DELIVER-2PKG-VERIFY ?auto_11345 ?auto_11346 ?auto_11344 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11351 - OBJ
      ?auto_11352 - OBJ
      ?auto_11350 - LOCATION
    )
    :vars
    (
      ?auto_11354 - LOCATION
      ?auto_11355 - CITY
      ?auto_11353 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11354 ?auto_11355 ) ( IN-CITY ?auto_11350 ?auto_11355 ) ( not ( = ?auto_11350 ?auto_11354 ) ) ( not ( = ?auto_11352 ?auto_11351 ) ) ( OBJ-AT ?auto_11351 ?auto_11354 ) ( TRUCK-AT ?auto_11353 ?auto_11354 ) ( OBJ-AT ?auto_11352 ?auto_11354 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11352 ?auto_11351 ?auto_11350 )
      ( DELIVER-2PKG-VERIFY ?auto_11351 ?auto_11352 ?auto_11350 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11414 - OBJ
      ?auto_11413 - LOCATION
    )
    :vars
    (
      ?auto_11417 - LOCATION
      ?auto_11418 - CITY
      ?auto_11415 - OBJ
      ?auto_11416 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11417 ?auto_11418 ) ( IN-CITY ?auto_11413 ?auto_11418 ) ( not ( = ?auto_11413 ?auto_11417 ) ) ( not ( = ?auto_11415 ?auto_11414 ) ) ( OBJ-AT ?auto_11414 ?auto_11417 ) ( OBJ-AT ?auto_11415 ?auto_11417 ) ( TRUCK-AT ?auto_11416 ?auto_11413 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11416 ?auto_11413 ?auto_11417 ?auto_11418 )
      ( DELIVER-2PKG ?auto_11415 ?auto_11414 ?auto_11413 )
      ( DELIVER-1PKG-VERIFY ?auto_11414 ?auto_11413 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11420 - OBJ
      ?auto_11421 - OBJ
      ?auto_11419 - LOCATION
    )
    :vars
    (
      ?auto_11422 - LOCATION
      ?auto_11424 - CITY
      ?auto_11423 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11422 ?auto_11424 ) ( IN-CITY ?auto_11419 ?auto_11424 ) ( not ( = ?auto_11419 ?auto_11422 ) ) ( not ( = ?auto_11420 ?auto_11421 ) ) ( OBJ-AT ?auto_11421 ?auto_11422 ) ( OBJ-AT ?auto_11420 ?auto_11422 ) ( TRUCK-AT ?auto_11423 ?auto_11419 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11421 ?auto_11419 )
      ( DELIVER-2PKG-VERIFY ?auto_11420 ?auto_11421 ?auto_11419 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11426 - OBJ
      ?auto_11427 - OBJ
      ?auto_11425 - LOCATION
    )
    :vars
    (
      ?auto_11428 - LOCATION
      ?auto_11429 - CITY
      ?auto_11430 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11428 ?auto_11429 ) ( IN-CITY ?auto_11425 ?auto_11429 ) ( not ( = ?auto_11425 ?auto_11428 ) ) ( not ( = ?auto_11427 ?auto_11426 ) ) ( OBJ-AT ?auto_11426 ?auto_11428 ) ( OBJ-AT ?auto_11427 ?auto_11428 ) ( TRUCK-AT ?auto_11430 ?auto_11425 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11427 ?auto_11426 ?auto_11425 )
      ( DELIVER-2PKG-VERIFY ?auto_11426 ?auto_11427 ?auto_11425 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11582 - OBJ
      ?auto_11581 - LOCATION
    )
    :vars
    (
      ?auto_11583 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11583 ?auto_11581 ) ( IN-TRUCK ?auto_11582 ?auto_11583 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_11582 ?auto_11583 ?auto_11581 )
      ( DELIVER-1PKG-VERIFY ?auto_11582 ?auto_11581 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11585 - OBJ
      ?auto_11586 - OBJ
      ?auto_11584 - LOCATION
    )
    :vars
    (
      ?auto_11587 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11587 ?auto_11584 ) ( IN-TRUCK ?auto_11586 ?auto_11587 ) ( OBJ-AT ?auto_11585 ?auto_11584 ) ( not ( = ?auto_11585 ?auto_11586 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11586 ?auto_11584 )
      ( DELIVER-2PKG-VERIFY ?auto_11585 ?auto_11586 ?auto_11584 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11589 - OBJ
      ?auto_11590 - OBJ
      ?auto_11588 - LOCATION
    )
    :vars
    (
      ?auto_11591 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11591 ?auto_11588 ) ( IN-TRUCK ?auto_11590 ?auto_11591 ) ( OBJ-AT ?auto_11589 ?auto_11588 ) ( not ( = ?auto_11589 ?auto_11590 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11590 ?auto_11588 )
      ( DELIVER-2PKG-VERIFY ?auto_11589 ?auto_11590 ?auto_11588 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11593 - OBJ
      ?auto_11594 - OBJ
      ?auto_11592 - LOCATION
    )
    :vars
    (
      ?auto_11595 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11595 ?auto_11592 ) ( IN-TRUCK ?auto_11593 ?auto_11595 ) ( OBJ-AT ?auto_11594 ?auto_11592 ) ( not ( = ?auto_11593 ?auto_11594 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11593 ?auto_11592 )
      ( DELIVER-2PKG-VERIFY ?auto_11593 ?auto_11594 ?auto_11592 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11597 - OBJ
      ?auto_11598 - OBJ
      ?auto_11596 - LOCATION
    )
    :vars
    (
      ?auto_11599 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11599 ?auto_11596 ) ( IN-TRUCK ?auto_11597 ?auto_11599 ) ( OBJ-AT ?auto_11598 ?auto_11596 ) ( not ( = ?auto_11597 ?auto_11598 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11597 ?auto_11596 )
      ( DELIVER-2PKG-VERIFY ?auto_11597 ?auto_11598 ?auto_11596 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11605 - OBJ
      ?auto_11606 - OBJ
      ?auto_11607 - OBJ
      ?auto_11604 - LOCATION
    )
    :vars
    (
      ?auto_11608 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11608 ?auto_11604 ) ( IN-TRUCK ?auto_11607 ?auto_11608 ) ( OBJ-AT ?auto_11605 ?auto_11604 ) ( OBJ-AT ?auto_11606 ?auto_11604 ) ( not ( = ?auto_11605 ?auto_11606 ) ) ( not ( = ?auto_11605 ?auto_11607 ) ) ( not ( = ?auto_11606 ?auto_11607 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11607 ?auto_11604 )
      ( DELIVER-3PKG-VERIFY ?auto_11605 ?auto_11606 ?auto_11607 ?auto_11604 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11610 - OBJ
      ?auto_11611 - OBJ
      ?auto_11612 - OBJ
      ?auto_11609 - LOCATION
    )
    :vars
    (
      ?auto_11613 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11613 ?auto_11609 ) ( IN-TRUCK ?auto_11612 ?auto_11613 ) ( OBJ-AT ?auto_11610 ?auto_11609 ) ( OBJ-AT ?auto_11611 ?auto_11609 ) ( not ( = ?auto_11610 ?auto_11611 ) ) ( not ( = ?auto_11610 ?auto_11612 ) ) ( not ( = ?auto_11611 ?auto_11612 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11612 ?auto_11609 )
      ( DELIVER-3PKG-VERIFY ?auto_11610 ?auto_11611 ?auto_11612 ?auto_11609 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11615 - OBJ
      ?auto_11616 - OBJ
      ?auto_11617 - OBJ
      ?auto_11614 - LOCATION
    )
    :vars
    (
      ?auto_11618 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11618 ?auto_11614 ) ( IN-TRUCK ?auto_11616 ?auto_11618 ) ( OBJ-AT ?auto_11615 ?auto_11614 ) ( OBJ-AT ?auto_11617 ?auto_11614 ) ( not ( = ?auto_11615 ?auto_11616 ) ) ( not ( = ?auto_11615 ?auto_11617 ) ) ( not ( = ?auto_11616 ?auto_11617 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11616 ?auto_11614 )
      ( DELIVER-3PKG-VERIFY ?auto_11615 ?auto_11616 ?auto_11617 ?auto_11614 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11620 - OBJ
      ?auto_11621 - OBJ
      ?auto_11622 - OBJ
      ?auto_11619 - LOCATION
    )
    :vars
    (
      ?auto_11623 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11623 ?auto_11619 ) ( IN-TRUCK ?auto_11621 ?auto_11623 ) ( OBJ-AT ?auto_11620 ?auto_11619 ) ( OBJ-AT ?auto_11622 ?auto_11619 ) ( not ( = ?auto_11620 ?auto_11621 ) ) ( not ( = ?auto_11620 ?auto_11622 ) ) ( not ( = ?auto_11621 ?auto_11622 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11621 ?auto_11619 )
      ( DELIVER-3PKG-VERIFY ?auto_11620 ?auto_11621 ?auto_11622 ?auto_11619 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11630 - OBJ
      ?auto_11631 - OBJ
      ?auto_11632 - OBJ
      ?auto_11629 - LOCATION
    )
    :vars
    (
      ?auto_11633 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11633 ?auto_11629 ) ( IN-TRUCK ?auto_11632 ?auto_11633 ) ( OBJ-AT ?auto_11630 ?auto_11629 ) ( OBJ-AT ?auto_11631 ?auto_11629 ) ( not ( = ?auto_11630 ?auto_11631 ) ) ( not ( = ?auto_11630 ?auto_11632 ) ) ( not ( = ?auto_11631 ?auto_11632 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11632 ?auto_11629 )
      ( DELIVER-3PKG-VERIFY ?auto_11630 ?auto_11631 ?auto_11632 ?auto_11629 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11635 - OBJ
      ?auto_11636 - OBJ
      ?auto_11637 - OBJ
      ?auto_11634 - LOCATION
    )
    :vars
    (
      ?auto_11638 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11638 ?auto_11634 ) ( IN-TRUCK ?auto_11637 ?auto_11638 ) ( OBJ-AT ?auto_11635 ?auto_11634 ) ( OBJ-AT ?auto_11636 ?auto_11634 ) ( not ( = ?auto_11635 ?auto_11636 ) ) ( not ( = ?auto_11635 ?auto_11637 ) ) ( not ( = ?auto_11636 ?auto_11637 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11637 ?auto_11634 )
      ( DELIVER-3PKG-VERIFY ?auto_11635 ?auto_11636 ?auto_11637 ?auto_11634 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11640 - OBJ
      ?auto_11641 - OBJ
      ?auto_11642 - OBJ
      ?auto_11639 - LOCATION
    )
    :vars
    (
      ?auto_11643 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11643 ?auto_11639 ) ( IN-TRUCK ?auto_11641 ?auto_11643 ) ( OBJ-AT ?auto_11640 ?auto_11639 ) ( OBJ-AT ?auto_11642 ?auto_11639 ) ( not ( = ?auto_11640 ?auto_11641 ) ) ( not ( = ?auto_11640 ?auto_11642 ) ) ( not ( = ?auto_11641 ?auto_11642 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11641 ?auto_11639 )
      ( DELIVER-3PKG-VERIFY ?auto_11640 ?auto_11641 ?auto_11642 ?auto_11639 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11645 - OBJ
      ?auto_11646 - OBJ
      ?auto_11647 - OBJ
      ?auto_11644 - LOCATION
    )
    :vars
    (
      ?auto_11648 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11648 ?auto_11644 ) ( IN-TRUCK ?auto_11646 ?auto_11648 ) ( OBJ-AT ?auto_11645 ?auto_11644 ) ( OBJ-AT ?auto_11647 ?auto_11644 ) ( not ( = ?auto_11645 ?auto_11646 ) ) ( not ( = ?auto_11645 ?auto_11647 ) ) ( not ( = ?auto_11646 ?auto_11647 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11646 ?auto_11644 )
      ( DELIVER-3PKG-VERIFY ?auto_11645 ?auto_11646 ?auto_11647 ?auto_11644 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11655 - OBJ
      ?auto_11656 - OBJ
      ?auto_11657 - OBJ
      ?auto_11654 - LOCATION
    )
    :vars
    (
      ?auto_11658 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11658 ?auto_11654 ) ( IN-TRUCK ?auto_11655 ?auto_11658 ) ( OBJ-AT ?auto_11656 ?auto_11654 ) ( OBJ-AT ?auto_11657 ?auto_11654 ) ( not ( = ?auto_11655 ?auto_11656 ) ) ( not ( = ?auto_11655 ?auto_11657 ) ) ( not ( = ?auto_11656 ?auto_11657 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11655 ?auto_11654 )
      ( DELIVER-3PKG-VERIFY ?auto_11655 ?auto_11656 ?auto_11657 ?auto_11654 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11660 - OBJ
      ?auto_11661 - OBJ
      ?auto_11662 - OBJ
      ?auto_11659 - LOCATION
    )
    :vars
    (
      ?auto_11663 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11663 ?auto_11659 ) ( IN-TRUCK ?auto_11660 ?auto_11663 ) ( OBJ-AT ?auto_11661 ?auto_11659 ) ( OBJ-AT ?auto_11662 ?auto_11659 ) ( not ( = ?auto_11660 ?auto_11661 ) ) ( not ( = ?auto_11660 ?auto_11662 ) ) ( not ( = ?auto_11661 ?auto_11662 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11660 ?auto_11659 )
      ( DELIVER-3PKG-VERIFY ?auto_11660 ?auto_11661 ?auto_11662 ?auto_11659 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11670 - OBJ
      ?auto_11671 - OBJ
      ?auto_11672 - OBJ
      ?auto_11669 - LOCATION
    )
    :vars
    (
      ?auto_11673 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11673 ?auto_11669 ) ( IN-TRUCK ?auto_11670 ?auto_11673 ) ( OBJ-AT ?auto_11671 ?auto_11669 ) ( OBJ-AT ?auto_11672 ?auto_11669 ) ( not ( = ?auto_11670 ?auto_11671 ) ) ( not ( = ?auto_11670 ?auto_11672 ) ) ( not ( = ?auto_11671 ?auto_11672 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11670 ?auto_11669 )
      ( DELIVER-3PKG-VERIFY ?auto_11670 ?auto_11671 ?auto_11672 ?auto_11669 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11675 - OBJ
      ?auto_11676 - OBJ
      ?auto_11677 - OBJ
      ?auto_11674 - LOCATION
    )
    :vars
    (
      ?auto_11678 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11678 ?auto_11674 ) ( IN-TRUCK ?auto_11675 ?auto_11678 ) ( OBJ-AT ?auto_11676 ?auto_11674 ) ( OBJ-AT ?auto_11677 ?auto_11674 ) ( not ( = ?auto_11675 ?auto_11676 ) ) ( not ( = ?auto_11675 ?auto_11677 ) ) ( not ( = ?auto_11676 ?auto_11677 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11675 ?auto_11674 )
      ( DELIVER-3PKG-VERIFY ?auto_11675 ?auto_11676 ?auto_11677 ?auto_11674 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11700 - OBJ
      ?auto_11699 - LOCATION
    )
    :vars
    (
      ?auto_11701 - TRUCK
      ?auto_11702 - LOCATION
      ?auto_11703 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11700 ?auto_11701 ) ( TRUCK-AT ?auto_11701 ?auto_11702 ) ( IN-CITY ?auto_11702 ?auto_11703 ) ( IN-CITY ?auto_11699 ?auto_11703 ) ( not ( = ?auto_11699 ?auto_11702 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11701 ?auto_11702 ?auto_11699 ?auto_11703 )
      ( DELIVER-1PKG ?auto_11700 ?auto_11699 )
      ( DELIVER-1PKG-VERIFY ?auto_11700 ?auto_11699 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11705 - OBJ
      ?auto_11706 - OBJ
      ?auto_11704 - LOCATION
    )
    :vars
    (
      ?auto_11707 - TRUCK
      ?auto_11708 - LOCATION
      ?auto_11709 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11706 ?auto_11707 ) ( TRUCK-AT ?auto_11707 ?auto_11708 ) ( IN-CITY ?auto_11708 ?auto_11709 ) ( IN-CITY ?auto_11704 ?auto_11709 ) ( not ( = ?auto_11704 ?auto_11708 ) ) ( OBJ-AT ?auto_11705 ?auto_11704 ) ( not ( = ?auto_11705 ?auto_11706 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11706 ?auto_11704 )
      ( DELIVER-2PKG-VERIFY ?auto_11705 ?auto_11706 ?auto_11704 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11711 - OBJ
      ?auto_11712 - OBJ
      ?auto_11710 - LOCATION
    )
    :vars
    (
      ?auto_11713 - TRUCK
      ?auto_11715 - LOCATION
      ?auto_11714 - CITY
      ?auto_11716 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11712 ?auto_11713 ) ( TRUCK-AT ?auto_11713 ?auto_11715 ) ( IN-CITY ?auto_11715 ?auto_11714 ) ( IN-CITY ?auto_11710 ?auto_11714 ) ( not ( = ?auto_11710 ?auto_11715 ) ) ( OBJ-AT ?auto_11716 ?auto_11710 ) ( not ( = ?auto_11716 ?auto_11712 ) ) ( OBJ-AT ?auto_11711 ?auto_11710 ) ( not ( = ?auto_11711 ?auto_11712 ) ) ( not ( = ?auto_11711 ?auto_11716 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11716 ?auto_11712 ?auto_11710 )
      ( DELIVER-2PKG-VERIFY ?auto_11711 ?auto_11712 ?auto_11710 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11718 - OBJ
      ?auto_11719 - OBJ
      ?auto_11717 - LOCATION
    )
    :vars
    (
      ?auto_11720 - TRUCK
      ?auto_11722 - LOCATION
      ?auto_11721 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11718 ?auto_11720 ) ( TRUCK-AT ?auto_11720 ?auto_11722 ) ( IN-CITY ?auto_11722 ?auto_11721 ) ( IN-CITY ?auto_11717 ?auto_11721 ) ( not ( = ?auto_11717 ?auto_11722 ) ) ( OBJ-AT ?auto_11719 ?auto_11717 ) ( not ( = ?auto_11719 ?auto_11718 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11719 ?auto_11718 ?auto_11717 )
      ( DELIVER-2PKG-VERIFY ?auto_11718 ?auto_11719 ?auto_11717 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11724 - OBJ
      ?auto_11725 - OBJ
      ?auto_11723 - LOCATION
    )
    :vars
    (
      ?auto_11726 - TRUCK
      ?auto_11728 - LOCATION
      ?auto_11727 - CITY
      ?auto_11729 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11724 ?auto_11726 ) ( TRUCK-AT ?auto_11726 ?auto_11728 ) ( IN-CITY ?auto_11728 ?auto_11727 ) ( IN-CITY ?auto_11723 ?auto_11727 ) ( not ( = ?auto_11723 ?auto_11728 ) ) ( OBJ-AT ?auto_11729 ?auto_11723 ) ( not ( = ?auto_11729 ?auto_11724 ) ) ( OBJ-AT ?auto_11725 ?auto_11723 ) ( not ( = ?auto_11724 ?auto_11725 ) ) ( not ( = ?auto_11725 ?auto_11729 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11729 ?auto_11724 ?auto_11723 )
      ( DELIVER-2PKG-VERIFY ?auto_11724 ?auto_11725 ?auto_11723 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11738 - OBJ
      ?auto_11739 - OBJ
      ?auto_11740 - OBJ
      ?auto_11737 - LOCATION
    )
    :vars
    (
      ?auto_11741 - TRUCK
      ?auto_11743 - LOCATION
      ?auto_11742 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11740 ?auto_11741 ) ( TRUCK-AT ?auto_11741 ?auto_11743 ) ( IN-CITY ?auto_11743 ?auto_11742 ) ( IN-CITY ?auto_11737 ?auto_11742 ) ( not ( = ?auto_11737 ?auto_11743 ) ) ( OBJ-AT ?auto_11739 ?auto_11737 ) ( not ( = ?auto_11739 ?auto_11740 ) ) ( OBJ-AT ?auto_11738 ?auto_11737 ) ( not ( = ?auto_11738 ?auto_11739 ) ) ( not ( = ?auto_11738 ?auto_11740 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11739 ?auto_11740 ?auto_11737 )
      ( DELIVER-3PKG-VERIFY ?auto_11738 ?auto_11739 ?auto_11740 ?auto_11737 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11745 - OBJ
      ?auto_11746 - OBJ
      ?auto_11747 - OBJ
      ?auto_11744 - LOCATION
    )
    :vars
    (
      ?auto_11748 - TRUCK
      ?auto_11750 - LOCATION
      ?auto_11749 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11747 ?auto_11748 ) ( TRUCK-AT ?auto_11748 ?auto_11750 ) ( IN-CITY ?auto_11750 ?auto_11749 ) ( IN-CITY ?auto_11744 ?auto_11749 ) ( not ( = ?auto_11744 ?auto_11750 ) ) ( OBJ-AT ?auto_11745 ?auto_11744 ) ( not ( = ?auto_11745 ?auto_11747 ) ) ( OBJ-AT ?auto_11746 ?auto_11744 ) ( not ( = ?auto_11745 ?auto_11746 ) ) ( not ( = ?auto_11746 ?auto_11747 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11745 ?auto_11747 ?auto_11744 )
      ( DELIVER-3PKG-VERIFY ?auto_11745 ?auto_11746 ?auto_11747 ?auto_11744 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11752 - OBJ
      ?auto_11753 - OBJ
      ?auto_11754 - OBJ
      ?auto_11751 - LOCATION
    )
    :vars
    (
      ?auto_11755 - TRUCK
      ?auto_11757 - LOCATION
      ?auto_11756 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11753 ?auto_11755 ) ( TRUCK-AT ?auto_11755 ?auto_11757 ) ( IN-CITY ?auto_11757 ?auto_11756 ) ( IN-CITY ?auto_11751 ?auto_11756 ) ( not ( = ?auto_11751 ?auto_11757 ) ) ( OBJ-AT ?auto_11754 ?auto_11751 ) ( not ( = ?auto_11754 ?auto_11753 ) ) ( OBJ-AT ?auto_11752 ?auto_11751 ) ( not ( = ?auto_11752 ?auto_11753 ) ) ( not ( = ?auto_11752 ?auto_11754 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11754 ?auto_11753 ?auto_11751 )
      ( DELIVER-3PKG-VERIFY ?auto_11752 ?auto_11753 ?auto_11754 ?auto_11751 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11759 - OBJ
      ?auto_11760 - OBJ
      ?auto_11761 - OBJ
      ?auto_11758 - LOCATION
    )
    :vars
    (
      ?auto_11762 - TRUCK
      ?auto_11764 - LOCATION
      ?auto_11763 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11760 ?auto_11762 ) ( TRUCK-AT ?auto_11762 ?auto_11764 ) ( IN-CITY ?auto_11764 ?auto_11763 ) ( IN-CITY ?auto_11758 ?auto_11763 ) ( not ( = ?auto_11758 ?auto_11764 ) ) ( OBJ-AT ?auto_11759 ?auto_11758 ) ( not ( = ?auto_11759 ?auto_11760 ) ) ( OBJ-AT ?auto_11761 ?auto_11758 ) ( not ( = ?auto_11759 ?auto_11761 ) ) ( not ( = ?auto_11760 ?auto_11761 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11759 ?auto_11760 ?auto_11758 )
      ( DELIVER-3PKG-VERIFY ?auto_11759 ?auto_11760 ?auto_11761 ?auto_11758 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11773 - OBJ
      ?auto_11774 - OBJ
      ?auto_11775 - OBJ
      ?auto_11772 - LOCATION
    )
    :vars
    (
      ?auto_11776 - TRUCK
      ?auto_11778 - LOCATION
      ?auto_11777 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11775 ?auto_11776 ) ( TRUCK-AT ?auto_11776 ?auto_11778 ) ( IN-CITY ?auto_11778 ?auto_11777 ) ( IN-CITY ?auto_11772 ?auto_11777 ) ( not ( = ?auto_11772 ?auto_11778 ) ) ( OBJ-AT ?auto_11774 ?auto_11772 ) ( not ( = ?auto_11774 ?auto_11775 ) ) ( OBJ-AT ?auto_11773 ?auto_11772 ) ( not ( = ?auto_11773 ?auto_11774 ) ) ( not ( = ?auto_11773 ?auto_11775 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11774 ?auto_11775 ?auto_11772 )
      ( DELIVER-3PKG-VERIFY ?auto_11773 ?auto_11774 ?auto_11775 ?auto_11772 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11780 - OBJ
      ?auto_11781 - OBJ
      ?auto_11782 - OBJ
      ?auto_11779 - LOCATION
    )
    :vars
    (
      ?auto_11783 - TRUCK
      ?auto_11785 - LOCATION
      ?auto_11784 - CITY
      ?auto_11786 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11782 ?auto_11783 ) ( TRUCK-AT ?auto_11783 ?auto_11785 ) ( IN-CITY ?auto_11785 ?auto_11784 ) ( IN-CITY ?auto_11779 ?auto_11784 ) ( not ( = ?auto_11779 ?auto_11785 ) ) ( OBJ-AT ?auto_11786 ?auto_11779 ) ( not ( = ?auto_11786 ?auto_11782 ) ) ( OBJ-AT ?auto_11780 ?auto_11779 ) ( OBJ-AT ?auto_11781 ?auto_11779 ) ( not ( = ?auto_11780 ?auto_11781 ) ) ( not ( = ?auto_11780 ?auto_11782 ) ) ( not ( = ?auto_11780 ?auto_11786 ) ) ( not ( = ?auto_11781 ?auto_11782 ) ) ( not ( = ?auto_11781 ?auto_11786 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11786 ?auto_11782 ?auto_11779 )
      ( DELIVER-3PKG-VERIFY ?auto_11780 ?auto_11781 ?auto_11782 ?auto_11779 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11788 - OBJ
      ?auto_11789 - OBJ
      ?auto_11790 - OBJ
      ?auto_11787 - LOCATION
    )
    :vars
    (
      ?auto_11791 - TRUCK
      ?auto_11793 - LOCATION
      ?auto_11792 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11789 ?auto_11791 ) ( TRUCK-AT ?auto_11791 ?auto_11793 ) ( IN-CITY ?auto_11793 ?auto_11792 ) ( IN-CITY ?auto_11787 ?auto_11792 ) ( not ( = ?auto_11787 ?auto_11793 ) ) ( OBJ-AT ?auto_11790 ?auto_11787 ) ( not ( = ?auto_11790 ?auto_11789 ) ) ( OBJ-AT ?auto_11788 ?auto_11787 ) ( not ( = ?auto_11788 ?auto_11789 ) ) ( not ( = ?auto_11788 ?auto_11790 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11790 ?auto_11789 ?auto_11787 )
      ( DELIVER-3PKG-VERIFY ?auto_11788 ?auto_11789 ?auto_11790 ?auto_11787 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11795 - OBJ
      ?auto_11796 - OBJ
      ?auto_11797 - OBJ
      ?auto_11794 - LOCATION
    )
    :vars
    (
      ?auto_11798 - TRUCK
      ?auto_11800 - LOCATION
      ?auto_11799 - CITY
      ?auto_11801 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11796 ?auto_11798 ) ( TRUCK-AT ?auto_11798 ?auto_11800 ) ( IN-CITY ?auto_11800 ?auto_11799 ) ( IN-CITY ?auto_11794 ?auto_11799 ) ( not ( = ?auto_11794 ?auto_11800 ) ) ( OBJ-AT ?auto_11801 ?auto_11794 ) ( not ( = ?auto_11801 ?auto_11796 ) ) ( OBJ-AT ?auto_11795 ?auto_11794 ) ( OBJ-AT ?auto_11797 ?auto_11794 ) ( not ( = ?auto_11795 ?auto_11796 ) ) ( not ( = ?auto_11795 ?auto_11797 ) ) ( not ( = ?auto_11795 ?auto_11801 ) ) ( not ( = ?auto_11796 ?auto_11797 ) ) ( not ( = ?auto_11797 ?auto_11801 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11801 ?auto_11796 ?auto_11794 )
      ( DELIVER-3PKG-VERIFY ?auto_11795 ?auto_11796 ?auto_11797 ?auto_11794 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11811 - OBJ
      ?auto_11812 - OBJ
      ?auto_11813 - OBJ
      ?auto_11810 - LOCATION
    )
    :vars
    (
      ?auto_11814 - TRUCK
      ?auto_11816 - LOCATION
      ?auto_11815 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11811 ?auto_11814 ) ( TRUCK-AT ?auto_11814 ?auto_11816 ) ( IN-CITY ?auto_11816 ?auto_11815 ) ( IN-CITY ?auto_11810 ?auto_11815 ) ( not ( = ?auto_11810 ?auto_11816 ) ) ( OBJ-AT ?auto_11813 ?auto_11810 ) ( not ( = ?auto_11813 ?auto_11811 ) ) ( OBJ-AT ?auto_11812 ?auto_11810 ) ( not ( = ?auto_11811 ?auto_11812 ) ) ( not ( = ?auto_11812 ?auto_11813 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11813 ?auto_11811 ?auto_11810 )
      ( DELIVER-3PKG-VERIFY ?auto_11811 ?auto_11812 ?auto_11813 ?auto_11810 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11818 - OBJ
      ?auto_11819 - OBJ
      ?auto_11820 - OBJ
      ?auto_11817 - LOCATION
    )
    :vars
    (
      ?auto_11821 - TRUCK
      ?auto_11823 - LOCATION
      ?auto_11822 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11818 ?auto_11821 ) ( TRUCK-AT ?auto_11821 ?auto_11823 ) ( IN-CITY ?auto_11823 ?auto_11822 ) ( IN-CITY ?auto_11817 ?auto_11822 ) ( not ( = ?auto_11817 ?auto_11823 ) ) ( OBJ-AT ?auto_11819 ?auto_11817 ) ( not ( = ?auto_11819 ?auto_11818 ) ) ( OBJ-AT ?auto_11820 ?auto_11817 ) ( not ( = ?auto_11818 ?auto_11820 ) ) ( not ( = ?auto_11819 ?auto_11820 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11819 ?auto_11818 ?auto_11817 )
      ( DELIVER-3PKG-VERIFY ?auto_11818 ?auto_11819 ?auto_11820 ?auto_11817 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11832 - OBJ
      ?auto_11833 - OBJ
      ?auto_11834 - OBJ
      ?auto_11831 - LOCATION
    )
    :vars
    (
      ?auto_11835 - TRUCK
      ?auto_11837 - LOCATION
      ?auto_11836 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11832 ?auto_11835 ) ( TRUCK-AT ?auto_11835 ?auto_11837 ) ( IN-CITY ?auto_11837 ?auto_11836 ) ( IN-CITY ?auto_11831 ?auto_11836 ) ( not ( = ?auto_11831 ?auto_11837 ) ) ( OBJ-AT ?auto_11834 ?auto_11831 ) ( not ( = ?auto_11834 ?auto_11832 ) ) ( OBJ-AT ?auto_11833 ?auto_11831 ) ( not ( = ?auto_11832 ?auto_11833 ) ) ( not ( = ?auto_11833 ?auto_11834 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11834 ?auto_11832 ?auto_11831 )
      ( DELIVER-3PKG-VERIFY ?auto_11832 ?auto_11833 ?auto_11834 ?auto_11831 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11839 - OBJ
      ?auto_11840 - OBJ
      ?auto_11841 - OBJ
      ?auto_11838 - LOCATION
    )
    :vars
    (
      ?auto_11842 - TRUCK
      ?auto_11844 - LOCATION
      ?auto_11843 - CITY
      ?auto_11845 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11839 ?auto_11842 ) ( TRUCK-AT ?auto_11842 ?auto_11844 ) ( IN-CITY ?auto_11844 ?auto_11843 ) ( IN-CITY ?auto_11838 ?auto_11843 ) ( not ( = ?auto_11838 ?auto_11844 ) ) ( OBJ-AT ?auto_11845 ?auto_11838 ) ( not ( = ?auto_11845 ?auto_11839 ) ) ( OBJ-AT ?auto_11840 ?auto_11838 ) ( OBJ-AT ?auto_11841 ?auto_11838 ) ( not ( = ?auto_11839 ?auto_11840 ) ) ( not ( = ?auto_11839 ?auto_11841 ) ) ( not ( = ?auto_11840 ?auto_11841 ) ) ( not ( = ?auto_11840 ?auto_11845 ) ) ( not ( = ?auto_11841 ?auto_11845 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11845 ?auto_11839 ?auto_11838 )
      ( DELIVER-3PKG-VERIFY ?auto_11839 ?auto_11840 ?auto_11841 ?auto_11838 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11878 - OBJ
      ?auto_11877 - LOCATION
    )
    :vars
    (
      ?auto_11879 - TRUCK
      ?auto_11881 - LOCATION
      ?auto_11880 - CITY
      ?auto_11882 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11879 ?auto_11881 ) ( IN-CITY ?auto_11881 ?auto_11880 ) ( IN-CITY ?auto_11877 ?auto_11880 ) ( not ( = ?auto_11877 ?auto_11881 ) ) ( OBJ-AT ?auto_11882 ?auto_11877 ) ( not ( = ?auto_11882 ?auto_11878 ) ) ( OBJ-AT ?auto_11878 ?auto_11881 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11878 ?auto_11879 ?auto_11881 )
      ( DELIVER-2PKG ?auto_11882 ?auto_11878 ?auto_11877 )
      ( DELIVER-1PKG-VERIFY ?auto_11878 ?auto_11877 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11884 - OBJ
      ?auto_11885 - OBJ
      ?auto_11883 - LOCATION
    )
    :vars
    (
      ?auto_11888 - TRUCK
      ?auto_11886 - LOCATION
      ?auto_11887 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11888 ?auto_11886 ) ( IN-CITY ?auto_11886 ?auto_11887 ) ( IN-CITY ?auto_11883 ?auto_11887 ) ( not ( = ?auto_11883 ?auto_11886 ) ) ( OBJ-AT ?auto_11884 ?auto_11883 ) ( not ( = ?auto_11884 ?auto_11885 ) ) ( OBJ-AT ?auto_11885 ?auto_11886 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11885 ?auto_11883 )
      ( DELIVER-2PKG-VERIFY ?auto_11884 ?auto_11885 ?auto_11883 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11890 - OBJ
      ?auto_11891 - OBJ
      ?auto_11889 - LOCATION
    )
    :vars
    (
      ?auto_11892 - TRUCK
      ?auto_11895 - LOCATION
      ?auto_11893 - CITY
      ?auto_11894 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11892 ?auto_11895 ) ( IN-CITY ?auto_11895 ?auto_11893 ) ( IN-CITY ?auto_11889 ?auto_11893 ) ( not ( = ?auto_11889 ?auto_11895 ) ) ( OBJ-AT ?auto_11894 ?auto_11889 ) ( not ( = ?auto_11894 ?auto_11891 ) ) ( OBJ-AT ?auto_11891 ?auto_11895 ) ( OBJ-AT ?auto_11890 ?auto_11889 ) ( not ( = ?auto_11890 ?auto_11891 ) ) ( not ( = ?auto_11890 ?auto_11894 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11894 ?auto_11891 ?auto_11889 )
      ( DELIVER-2PKG-VERIFY ?auto_11890 ?auto_11891 ?auto_11889 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11897 - OBJ
      ?auto_11898 - OBJ
      ?auto_11896 - LOCATION
    )
    :vars
    (
      ?auto_11899 - TRUCK
      ?auto_11901 - LOCATION
      ?auto_11900 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11899 ?auto_11901 ) ( IN-CITY ?auto_11901 ?auto_11900 ) ( IN-CITY ?auto_11896 ?auto_11900 ) ( not ( = ?auto_11896 ?auto_11901 ) ) ( OBJ-AT ?auto_11898 ?auto_11896 ) ( not ( = ?auto_11898 ?auto_11897 ) ) ( OBJ-AT ?auto_11897 ?auto_11901 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11898 ?auto_11897 ?auto_11896 )
      ( DELIVER-2PKG-VERIFY ?auto_11897 ?auto_11898 ?auto_11896 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11903 - OBJ
      ?auto_11904 - OBJ
      ?auto_11902 - LOCATION
    )
    :vars
    (
      ?auto_11905 - TRUCK
      ?auto_11908 - LOCATION
      ?auto_11906 - CITY
      ?auto_11907 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11905 ?auto_11908 ) ( IN-CITY ?auto_11908 ?auto_11906 ) ( IN-CITY ?auto_11902 ?auto_11906 ) ( not ( = ?auto_11902 ?auto_11908 ) ) ( OBJ-AT ?auto_11907 ?auto_11902 ) ( not ( = ?auto_11907 ?auto_11903 ) ) ( OBJ-AT ?auto_11903 ?auto_11908 ) ( OBJ-AT ?auto_11904 ?auto_11902 ) ( not ( = ?auto_11903 ?auto_11904 ) ) ( not ( = ?auto_11904 ?auto_11907 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11907 ?auto_11903 ?auto_11902 )
      ( DELIVER-2PKG-VERIFY ?auto_11903 ?auto_11904 ?auto_11902 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11917 - OBJ
      ?auto_11918 - OBJ
      ?auto_11919 - OBJ
      ?auto_11916 - LOCATION
    )
    :vars
    (
      ?auto_11920 - TRUCK
      ?auto_11922 - LOCATION
      ?auto_11921 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11920 ?auto_11922 ) ( IN-CITY ?auto_11922 ?auto_11921 ) ( IN-CITY ?auto_11916 ?auto_11921 ) ( not ( = ?auto_11916 ?auto_11922 ) ) ( OBJ-AT ?auto_11918 ?auto_11916 ) ( not ( = ?auto_11918 ?auto_11919 ) ) ( OBJ-AT ?auto_11919 ?auto_11922 ) ( OBJ-AT ?auto_11917 ?auto_11916 ) ( not ( = ?auto_11917 ?auto_11918 ) ) ( not ( = ?auto_11917 ?auto_11919 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11918 ?auto_11919 ?auto_11916 )
      ( DELIVER-3PKG-VERIFY ?auto_11917 ?auto_11918 ?auto_11919 ?auto_11916 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11924 - OBJ
      ?auto_11925 - OBJ
      ?auto_11926 - OBJ
      ?auto_11923 - LOCATION
    )
    :vars
    (
      ?auto_11927 - TRUCK
      ?auto_11929 - LOCATION
      ?auto_11928 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11927 ?auto_11929 ) ( IN-CITY ?auto_11929 ?auto_11928 ) ( IN-CITY ?auto_11923 ?auto_11928 ) ( not ( = ?auto_11923 ?auto_11929 ) ) ( OBJ-AT ?auto_11924 ?auto_11923 ) ( not ( = ?auto_11924 ?auto_11926 ) ) ( OBJ-AT ?auto_11926 ?auto_11929 ) ( OBJ-AT ?auto_11925 ?auto_11923 ) ( not ( = ?auto_11924 ?auto_11925 ) ) ( not ( = ?auto_11925 ?auto_11926 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11924 ?auto_11926 ?auto_11923 )
      ( DELIVER-3PKG-VERIFY ?auto_11924 ?auto_11925 ?auto_11926 ?auto_11923 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11931 - OBJ
      ?auto_11932 - OBJ
      ?auto_11933 - OBJ
      ?auto_11930 - LOCATION
    )
    :vars
    (
      ?auto_11934 - TRUCK
      ?auto_11936 - LOCATION
      ?auto_11935 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11934 ?auto_11936 ) ( IN-CITY ?auto_11936 ?auto_11935 ) ( IN-CITY ?auto_11930 ?auto_11935 ) ( not ( = ?auto_11930 ?auto_11936 ) ) ( OBJ-AT ?auto_11933 ?auto_11930 ) ( not ( = ?auto_11933 ?auto_11932 ) ) ( OBJ-AT ?auto_11932 ?auto_11936 ) ( OBJ-AT ?auto_11931 ?auto_11930 ) ( not ( = ?auto_11931 ?auto_11932 ) ) ( not ( = ?auto_11931 ?auto_11933 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11933 ?auto_11932 ?auto_11930 )
      ( DELIVER-3PKG-VERIFY ?auto_11931 ?auto_11932 ?auto_11933 ?auto_11930 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11938 - OBJ
      ?auto_11939 - OBJ
      ?auto_11940 - OBJ
      ?auto_11937 - LOCATION
    )
    :vars
    (
      ?auto_11941 - TRUCK
      ?auto_11943 - LOCATION
      ?auto_11942 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11941 ?auto_11943 ) ( IN-CITY ?auto_11943 ?auto_11942 ) ( IN-CITY ?auto_11937 ?auto_11942 ) ( not ( = ?auto_11937 ?auto_11943 ) ) ( OBJ-AT ?auto_11938 ?auto_11937 ) ( not ( = ?auto_11938 ?auto_11939 ) ) ( OBJ-AT ?auto_11939 ?auto_11943 ) ( OBJ-AT ?auto_11940 ?auto_11937 ) ( not ( = ?auto_11938 ?auto_11940 ) ) ( not ( = ?auto_11939 ?auto_11940 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11938 ?auto_11939 ?auto_11937 )
      ( DELIVER-3PKG-VERIFY ?auto_11938 ?auto_11939 ?auto_11940 ?auto_11937 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11952 - OBJ
      ?auto_11953 - OBJ
      ?auto_11954 - OBJ
      ?auto_11951 - LOCATION
    )
    :vars
    (
      ?auto_11955 - TRUCK
      ?auto_11957 - LOCATION
      ?auto_11956 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11955 ?auto_11957 ) ( IN-CITY ?auto_11957 ?auto_11956 ) ( IN-CITY ?auto_11951 ?auto_11956 ) ( not ( = ?auto_11951 ?auto_11957 ) ) ( OBJ-AT ?auto_11953 ?auto_11951 ) ( not ( = ?auto_11953 ?auto_11954 ) ) ( OBJ-AT ?auto_11954 ?auto_11957 ) ( OBJ-AT ?auto_11952 ?auto_11951 ) ( not ( = ?auto_11952 ?auto_11953 ) ) ( not ( = ?auto_11952 ?auto_11954 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11953 ?auto_11954 ?auto_11951 )
      ( DELIVER-3PKG-VERIFY ?auto_11952 ?auto_11953 ?auto_11954 ?auto_11951 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11959 - OBJ
      ?auto_11960 - OBJ
      ?auto_11961 - OBJ
      ?auto_11958 - LOCATION
    )
    :vars
    (
      ?auto_11962 - TRUCK
      ?auto_11965 - LOCATION
      ?auto_11963 - CITY
      ?auto_11964 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11962 ?auto_11965 ) ( IN-CITY ?auto_11965 ?auto_11963 ) ( IN-CITY ?auto_11958 ?auto_11963 ) ( not ( = ?auto_11958 ?auto_11965 ) ) ( OBJ-AT ?auto_11964 ?auto_11958 ) ( not ( = ?auto_11964 ?auto_11961 ) ) ( OBJ-AT ?auto_11961 ?auto_11965 ) ( OBJ-AT ?auto_11959 ?auto_11958 ) ( OBJ-AT ?auto_11960 ?auto_11958 ) ( not ( = ?auto_11959 ?auto_11960 ) ) ( not ( = ?auto_11959 ?auto_11961 ) ) ( not ( = ?auto_11959 ?auto_11964 ) ) ( not ( = ?auto_11960 ?auto_11961 ) ) ( not ( = ?auto_11960 ?auto_11964 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11964 ?auto_11961 ?auto_11958 )
      ( DELIVER-3PKG-VERIFY ?auto_11959 ?auto_11960 ?auto_11961 ?auto_11958 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11967 - OBJ
      ?auto_11968 - OBJ
      ?auto_11969 - OBJ
      ?auto_11966 - LOCATION
    )
    :vars
    (
      ?auto_11970 - TRUCK
      ?auto_11972 - LOCATION
      ?auto_11971 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11970 ?auto_11972 ) ( IN-CITY ?auto_11972 ?auto_11971 ) ( IN-CITY ?auto_11966 ?auto_11971 ) ( not ( = ?auto_11966 ?auto_11972 ) ) ( OBJ-AT ?auto_11969 ?auto_11966 ) ( not ( = ?auto_11969 ?auto_11968 ) ) ( OBJ-AT ?auto_11968 ?auto_11972 ) ( OBJ-AT ?auto_11967 ?auto_11966 ) ( not ( = ?auto_11967 ?auto_11968 ) ) ( not ( = ?auto_11967 ?auto_11969 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11969 ?auto_11968 ?auto_11966 )
      ( DELIVER-3PKG-VERIFY ?auto_11967 ?auto_11968 ?auto_11969 ?auto_11966 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11974 - OBJ
      ?auto_11975 - OBJ
      ?auto_11976 - OBJ
      ?auto_11973 - LOCATION
    )
    :vars
    (
      ?auto_11977 - TRUCK
      ?auto_11980 - LOCATION
      ?auto_11978 - CITY
      ?auto_11979 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11977 ?auto_11980 ) ( IN-CITY ?auto_11980 ?auto_11978 ) ( IN-CITY ?auto_11973 ?auto_11978 ) ( not ( = ?auto_11973 ?auto_11980 ) ) ( OBJ-AT ?auto_11979 ?auto_11973 ) ( not ( = ?auto_11979 ?auto_11975 ) ) ( OBJ-AT ?auto_11975 ?auto_11980 ) ( OBJ-AT ?auto_11974 ?auto_11973 ) ( OBJ-AT ?auto_11976 ?auto_11973 ) ( not ( = ?auto_11974 ?auto_11975 ) ) ( not ( = ?auto_11974 ?auto_11976 ) ) ( not ( = ?auto_11974 ?auto_11979 ) ) ( not ( = ?auto_11975 ?auto_11976 ) ) ( not ( = ?auto_11976 ?auto_11979 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11979 ?auto_11975 ?auto_11973 )
      ( DELIVER-3PKG-VERIFY ?auto_11974 ?auto_11975 ?auto_11976 ?auto_11973 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11990 - OBJ
      ?auto_11991 - OBJ
      ?auto_11992 - OBJ
      ?auto_11989 - LOCATION
    )
    :vars
    (
      ?auto_11993 - TRUCK
      ?auto_11995 - LOCATION
      ?auto_11994 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11993 ?auto_11995 ) ( IN-CITY ?auto_11995 ?auto_11994 ) ( IN-CITY ?auto_11989 ?auto_11994 ) ( not ( = ?auto_11989 ?auto_11995 ) ) ( OBJ-AT ?auto_11992 ?auto_11989 ) ( not ( = ?auto_11992 ?auto_11990 ) ) ( OBJ-AT ?auto_11990 ?auto_11995 ) ( OBJ-AT ?auto_11991 ?auto_11989 ) ( not ( = ?auto_11990 ?auto_11991 ) ) ( not ( = ?auto_11991 ?auto_11992 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11992 ?auto_11990 ?auto_11989 )
      ( DELIVER-3PKG-VERIFY ?auto_11990 ?auto_11991 ?auto_11992 ?auto_11989 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11997 - OBJ
      ?auto_11998 - OBJ
      ?auto_11999 - OBJ
      ?auto_11996 - LOCATION
    )
    :vars
    (
      ?auto_12000 - TRUCK
      ?auto_12002 - LOCATION
      ?auto_12001 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12000 ?auto_12002 ) ( IN-CITY ?auto_12002 ?auto_12001 ) ( IN-CITY ?auto_11996 ?auto_12001 ) ( not ( = ?auto_11996 ?auto_12002 ) ) ( OBJ-AT ?auto_11998 ?auto_11996 ) ( not ( = ?auto_11998 ?auto_11997 ) ) ( OBJ-AT ?auto_11997 ?auto_12002 ) ( OBJ-AT ?auto_11999 ?auto_11996 ) ( not ( = ?auto_11997 ?auto_11999 ) ) ( not ( = ?auto_11998 ?auto_11999 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11998 ?auto_11997 ?auto_11996 )
      ( DELIVER-3PKG-VERIFY ?auto_11997 ?auto_11998 ?auto_11999 ?auto_11996 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12011 - OBJ
      ?auto_12012 - OBJ
      ?auto_12013 - OBJ
      ?auto_12010 - LOCATION
    )
    :vars
    (
      ?auto_12014 - TRUCK
      ?auto_12016 - LOCATION
      ?auto_12015 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12014 ?auto_12016 ) ( IN-CITY ?auto_12016 ?auto_12015 ) ( IN-CITY ?auto_12010 ?auto_12015 ) ( not ( = ?auto_12010 ?auto_12016 ) ) ( OBJ-AT ?auto_12013 ?auto_12010 ) ( not ( = ?auto_12013 ?auto_12011 ) ) ( OBJ-AT ?auto_12011 ?auto_12016 ) ( OBJ-AT ?auto_12012 ?auto_12010 ) ( not ( = ?auto_12011 ?auto_12012 ) ) ( not ( = ?auto_12012 ?auto_12013 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12013 ?auto_12011 ?auto_12010 )
      ( DELIVER-3PKG-VERIFY ?auto_12011 ?auto_12012 ?auto_12013 ?auto_12010 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12018 - OBJ
      ?auto_12019 - OBJ
      ?auto_12020 - OBJ
      ?auto_12017 - LOCATION
    )
    :vars
    (
      ?auto_12021 - TRUCK
      ?auto_12024 - LOCATION
      ?auto_12022 - CITY
      ?auto_12023 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12021 ?auto_12024 ) ( IN-CITY ?auto_12024 ?auto_12022 ) ( IN-CITY ?auto_12017 ?auto_12022 ) ( not ( = ?auto_12017 ?auto_12024 ) ) ( OBJ-AT ?auto_12023 ?auto_12017 ) ( not ( = ?auto_12023 ?auto_12018 ) ) ( OBJ-AT ?auto_12018 ?auto_12024 ) ( OBJ-AT ?auto_12019 ?auto_12017 ) ( OBJ-AT ?auto_12020 ?auto_12017 ) ( not ( = ?auto_12018 ?auto_12019 ) ) ( not ( = ?auto_12018 ?auto_12020 ) ) ( not ( = ?auto_12019 ?auto_12020 ) ) ( not ( = ?auto_12019 ?auto_12023 ) ) ( not ( = ?auto_12020 ?auto_12023 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12023 ?auto_12018 ?auto_12017 )
      ( DELIVER-3PKG-VERIFY ?auto_12018 ?auto_12019 ?auto_12020 ?auto_12017 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12057 - OBJ
      ?auto_12056 - LOCATION
    )
    :vars
    (
      ?auto_12061 - LOCATION
      ?auto_12059 - CITY
      ?auto_12060 - OBJ
      ?auto_12058 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12061 ?auto_12059 ) ( IN-CITY ?auto_12056 ?auto_12059 ) ( not ( = ?auto_12056 ?auto_12061 ) ) ( OBJ-AT ?auto_12060 ?auto_12056 ) ( not ( = ?auto_12060 ?auto_12057 ) ) ( OBJ-AT ?auto_12057 ?auto_12061 ) ( TRUCK-AT ?auto_12058 ?auto_12056 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12058 ?auto_12056 ?auto_12061 ?auto_12059 )
      ( DELIVER-2PKG ?auto_12060 ?auto_12057 ?auto_12056 )
      ( DELIVER-1PKG-VERIFY ?auto_12057 ?auto_12056 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12063 - OBJ
      ?auto_12064 - OBJ
      ?auto_12062 - LOCATION
    )
    :vars
    (
      ?auto_12065 - LOCATION
      ?auto_12066 - CITY
      ?auto_12067 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12065 ?auto_12066 ) ( IN-CITY ?auto_12062 ?auto_12066 ) ( not ( = ?auto_12062 ?auto_12065 ) ) ( OBJ-AT ?auto_12063 ?auto_12062 ) ( not ( = ?auto_12063 ?auto_12064 ) ) ( OBJ-AT ?auto_12064 ?auto_12065 ) ( TRUCK-AT ?auto_12067 ?auto_12062 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12064 ?auto_12062 )
      ( DELIVER-2PKG-VERIFY ?auto_12063 ?auto_12064 ?auto_12062 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12069 - OBJ
      ?auto_12070 - OBJ
      ?auto_12068 - LOCATION
    )
    :vars
    (
      ?auto_12072 - LOCATION
      ?auto_12071 - CITY
      ?auto_12074 - OBJ
      ?auto_12073 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12072 ?auto_12071 ) ( IN-CITY ?auto_12068 ?auto_12071 ) ( not ( = ?auto_12068 ?auto_12072 ) ) ( OBJ-AT ?auto_12074 ?auto_12068 ) ( not ( = ?auto_12074 ?auto_12070 ) ) ( OBJ-AT ?auto_12070 ?auto_12072 ) ( TRUCK-AT ?auto_12073 ?auto_12068 ) ( OBJ-AT ?auto_12069 ?auto_12068 ) ( not ( = ?auto_12069 ?auto_12070 ) ) ( not ( = ?auto_12069 ?auto_12074 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12074 ?auto_12070 ?auto_12068 )
      ( DELIVER-2PKG-VERIFY ?auto_12069 ?auto_12070 ?auto_12068 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12076 - OBJ
      ?auto_12077 - OBJ
      ?auto_12075 - LOCATION
    )
    :vars
    (
      ?auto_12079 - LOCATION
      ?auto_12078 - CITY
      ?auto_12080 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12079 ?auto_12078 ) ( IN-CITY ?auto_12075 ?auto_12078 ) ( not ( = ?auto_12075 ?auto_12079 ) ) ( OBJ-AT ?auto_12077 ?auto_12075 ) ( not ( = ?auto_12077 ?auto_12076 ) ) ( OBJ-AT ?auto_12076 ?auto_12079 ) ( TRUCK-AT ?auto_12080 ?auto_12075 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12077 ?auto_12076 ?auto_12075 )
      ( DELIVER-2PKG-VERIFY ?auto_12076 ?auto_12077 ?auto_12075 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12082 - OBJ
      ?auto_12083 - OBJ
      ?auto_12081 - LOCATION
    )
    :vars
    (
      ?auto_12085 - LOCATION
      ?auto_12084 - CITY
      ?auto_12087 - OBJ
      ?auto_12086 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12085 ?auto_12084 ) ( IN-CITY ?auto_12081 ?auto_12084 ) ( not ( = ?auto_12081 ?auto_12085 ) ) ( OBJ-AT ?auto_12087 ?auto_12081 ) ( not ( = ?auto_12087 ?auto_12082 ) ) ( OBJ-AT ?auto_12082 ?auto_12085 ) ( TRUCK-AT ?auto_12086 ?auto_12081 ) ( OBJ-AT ?auto_12083 ?auto_12081 ) ( not ( = ?auto_12082 ?auto_12083 ) ) ( not ( = ?auto_12083 ?auto_12087 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12087 ?auto_12082 ?auto_12081 )
      ( DELIVER-2PKG-VERIFY ?auto_12082 ?auto_12083 ?auto_12081 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12096 - OBJ
      ?auto_12097 - OBJ
      ?auto_12098 - OBJ
      ?auto_12095 - LOCATION
    )
    :vars
    (
      ?auto_12100 - LOCATION
      ?auto_12099 - CITY
      ?auto_12101 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12100 ?auto_12099 ) ( IN-CITY ?auto_12095 ?auto_12099 ) ( not ( = ?auto_12095 ?auto_12100 ) ) ( OBJ-AT ?auto_12097 ?auto_12095 ) ( not ( = ?auto_12097 ?auto_12098 ) ) ( OBJ-AT ?auto_12098 ?auto_12100 ) ( TRUCK-AT ?auto_12101 ?auto_12095 ) ( OBJ-AT ?auto_12096 ?auto_12095 ) ( not ( = ?auto_12096 ?auto_12097 ) ) ( not ( = ?auto_12096 ?auto_12098 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12097 ?auto_12098 ?auto_12095 )
      ( DELIVER-3PKG-VERIFY ?auto_12096 ?auto_12097 ?auto_12098 ?auto_12095 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12103 - OBJ
      ?auto_12104 - OBJ
      ?auto_12105 - OBJ
      ?auto_12102 - LOCATION
    )
    :vars
    (
      ?auto_12107 - LOCATION
      ?auto_12106 - CITY
      ?auto_12108 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12107 ?auto_12106 ) ( IN-CITY ?auto_12102 ?auto_12106 ) ( not ( = ?auto_12102 ?auto_12107 ) ) ( OBJ-AT ?auto_12103 ?auto_12102 ) ( not ( = ?auto_12103 ?auto_12105 ) ) ( OBJ-AT ?auto_12105 ?auto_12107 ) ( TRUCK-AT ?auto_12108 ?auto_12102 ) ( OBJ-AT ?auto_12104 ?auto_12102 ) ( not ( = ?auto_12103 ?auto_12104 ) ) ( not ( = ?auto_12104 ?auto_12105 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12103 ?auto_12105 ?auto_12102 )
      ( DELIVER-3PKG-VERIFY ?auto_12103 ?auto_12104 ?auto_12105 ?auto_12102 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12110 - OBJ
      ?auto_12111 - OBJ
      ?auto_12112 - OBJ
      ?auto_12109 - LOCATION
    )
    :vars
    (
      ?auto_12114 - LOCATION
      ?auto_12113 - CITY
      ?auto_12115 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12114 ?auto_12113 ) ( IN-CITY ?auto_12109 ?auto_12113 ) ( not ( = ?auto_12109 ?auto_12114 ) ) ( OBJ-AT ?auto_12112 ?auto_12109 ) ( not ( = ?auto_12112 ?auto_12111 ) ) ( OBJ-AT ?auto_12111 ?auto_12114 ) ( TRUCK-AT ?auto_12115 ?auto_12109 ) ( OBJ-AT ?auto_12110 ?auto_12109 ) ( not ( = ?auto_12110 ?auto_12111 ) ) ( not ( = ?auto_12110 ?auto_12112 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12112 ?auto_12111 ?auto_12109 )
      ( DELIVER-3PKG-VERIFY ?auto_12110 ?auto_12111 ?auto_12112 ?auto_12109 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12117 - OBJ
      ?auto_12118 - OBJ
      ?auto_12119 - OBJ
      ?auto_12116 - LOCATION
    )
    :vars
    (
      ?auto_12121 - LOCATION
      ?auto_12120 - CITY
      ?auto_12122 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12121 ?auto_12120 ) ( IN-CITY ?auto_12116 ?auto_12120 ) ( not ( = ?auto_12116 ?auto_12121 ) ) ( OBJ-AT ?auto_12117 ?auto_12116 ) ( not ( = ?auto_12117 ?auto_12118 ) ) ( OBJ-AT ?auto_12118 ?auto_12121 ) ( TRUCK-AT ?auto_12122 ?auto_12116 ) ( OBJ-AT ?auto_12119 ?auto_12116 ) ( not ( = ?auto_12117 ?auto_12119 ) ) ( not ( = ?auto_12118 ?auto_12119 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12117 ?auto_12118 ?auto_12116 )
      ( DELIVER-3PKG-VERIFY ?auto_12117 ?auto_12118 ?auto_12119 ?auto_12116 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12131 - OBJ
      ?auto_12132 - OBJ
      ?auto_12133 - OBJ
      ?auto_12130 - LOCATION
    )
    :vars
    (
      ?auto_12135 - LOCATION
      ?auto_12134 - CITY
      ?auto_12136 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12135 ?auto_12134 ) ( IN-CITY ?auto_12130 ?auto_12134 ) ( not ( = ?auto_12130 ?auto_12135 ) ) ( OBJ-AT ?auto_12132 ?auto_12130 ) ( not ( = ?auto_12132 ?auto_12133 ) ) ( OBJ-AT ?auto_12133 ?auto_12135 ) ( TRUCK-AT ?auto_12136 ?auto_12130 ) ( OBJ-AT ?auto_12131 ?auto_12130 ) ( not ( = ?auto_12131 ?auto_12132 ) ) ( not ( = ?auto_12131 ?auto_12133 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12132 ?auto_12133 ?auto_12130 )
      ( DELIVER-3PKG-VERIFY ?auto_12131 ?auto_12132 ?auto_12133 ?auto_12130 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12138 - OBJ
      ?auto_12139 - OBJ
      ?auto_12140 - OBJ
      ?auto_12137 - LOCATION
    )
    :vars
    (
      ?auto_12142 - LOCATION
      ?auto_12141 - CITY
      ?auto_12144 - OBJ
      ?auto_12143 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12142 ?auto_12141 ) ( IN-CITY ?auto_12137 ?auto_12141 ) ( not ( = ?auto_12137 ?auto_12142 ) ) ( OBJ-AT ?auto_12144 ?auto_12137 ) ( not ( = ?auto_12144 ?auto_12140 ) ) ( OBJ-AT ?auto_12140 ?auto_12142 ) ( TRUCK-AT ?auto_12143 ?auto_12137 ) ( OBJ-AT ?auto_12138 ?auto_12137 ) ( OBJ-AT ?auto_12139 ?auto_12137 ) ( not ( = ?auto_12138 ?auto_12139 ) ) ( not ( = ?auto_12138 ?auto_12140 ) ) ( not ( = ?auto_12138 ?auto_12144 ) ) ( not ( = ?auto_12139 ?auto_12140 ) ) ( not ( = ?auto_12139 ?auto_12144 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12144 ?auto_12140 ?auto_12137 )
      ( DELIVER-3PKG-VERIFY ?auto_12138 ?auto_12139 ?auto_12140 ?auto_12137 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12146 - OBJ
      ?auto_12147 - OBJ
      ?auto_12148 - OBJ
      ?auto_12145 - LOCATION
    )
    :vars
    (
      ?auto_12150 - LOCATION
      ?auto_12149 - CITY
      ?auto_12151 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12150 ?auto_12149 ) ( IN-CITY ?auto_12145 ?auto_12149 ) ( not ( = ?auto_12145 ?auto_12150 ) ) ( OBJ-AT ?auto_12148 ?auto_12145 ) ( not ( = ?auto_12148 ?auto_12147 ) ) ( OBJ-AT ?auto_12147 ?auto_12150 ) ( TRUCK-AT ?auto_12151 ?auto_12145 ) ( OBJ-AT ?auto_12146 ?auto_12145 ) ( not ( = ?auto_12146 ?auto_12147 ) ) ( not ( = ?auto_12146 ?auto_12148 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12148 ?auto_12147 ?auto_12145 )
      ( DELIVER-3PKG-VERIFY ?auto_12146 ?auto_12147 ?auto_12148 ?auto_12145 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12153 - OBJ
      ?auto_12154 - OBJ
      ?auto_12155 - OBJ
      ?auto_12152 - LOCATION
    )
    :vars
    (
      ?auto_12157 - LOCATION
      ?auto_12156 - CITY
      ?auto_12159 - OBJ
      ?auto_12158 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12157 ?auto_12156 ) ( IN-CITY ?auto_12152 ?auto_12156 ) ( not ( = ?auto_12152 ?auto_12157 ) ) ( OBJ-AT ?auto_12159 ?auto_12152 ) ( not ( = ?auto_12159 ?auto_12154 ) ) ( OBJ-AT ?auto_12154 ?auto_12157 ) ( TRUCK-AT ?auto_12158 ?auto_12152 ) ( OBJ-AT ?auto_12153 ?auto_12152 ) ( OBJ-AT ?auto_12155 ?auto_12152 ) ( not ( = ?auto_12153 ?auto_12154 ) ) ( not ( = ?auto_12153 ?auto_12155 ) ) ( not ( = ?auto_12153 ?auto_12159 ) ) ( not ( = ?auto_12154 ?auto_12155 ) ) ( not ( = ?auto_12155 ?auto_12159 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12159 ?auto_12154 ?auto_12152 )
      ( DELIVER-3PKG-VERIFY ?auto_12153 ?auto_12154 ?auto_12155 ?auto_12152 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12169 - OBJ
      ?auto_12170 - OBJ
      ?auto_12171 - OBJ
      ?auto_12168 - LOCATION
    )
    :vars
    (
      ?auto_12173 - LOCATION
      ?auto_12172 - CITY
      ?auto_12174 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12173 ?auto_12172 ) ( IN-CITY ?auto_12168 ?auto_12172 ) ( not ( = ?auto_12168 ?auto_12173 ) ) ( OBJ-AT ?auto_12171 ?auto_12168 ) ( not ( = ?auto_12171 ?auto_12169 ) ) ( OBJ-AT ?auto_12169 ?auto_12173 ) ( TRUCK-AT ?auto_12174 ?auto_12168 ) ( OBJ-AT ?auto_12170 ?auto_12168 ) ( not ( = ?auto_12169 ?auto_12170 ) ) ( not ( = ?auto_12170 ?auto_12171 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12171 ?auto_12169 ?auto_12168 )
      ( DELIVER-3PKG-VERIFY ?auto_12169 ?auto_12170 ?auto_12171 ?auto_12168 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12176 - OBJ
      ?auto_12177 - OBJ
      ?auto_12178 - OBJ
      ?auto_12175 - LOCATION
    )
    :vars
    (
      ?auto_12180 - LOCATION
      ?auto_12179 - CITY
      ?auto_12181 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12180 ?auto_12179 ) ( IN-CITY ?auto_12175 ?auto_12179 ) ( not ( = ?auto_12175 ?auto_12180 ) ) ( OBJ-AT ?auto_12177 ?auto_12175 ) ( not ( = ?auto_12177 ?auto_12176 ) ) ( OBJ-AT ?auto_12176 ?auto_12180 ) ( TRUCK-AT ?auto_12181 ?auto_12175 ) ( OBJ-AT ?auto_12178 ?auto_12175 ) ( not ( = ?auto_12176 ?auto_12178 ) ) ( not ( = ?auto_12177 ?auto_12178 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12177 ?auto_12176 ?auto_12175 )
      ( DELIVER-3PKG-VERIFY ?auto_12176 ?auto_12177 ?auto_12178 ?auto_12175 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12190 - OBJ
      ?auto_12191 - OBJ
      ?auto_12192 - OBJ
      ?auto_12189 - LOCATION
    )
    :vars
    (
      ?auto_12194 - LOCATION
      ?auto_12193 - CITY
      ?auto_12195 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12194 ?auto_12193 ) ( IN-CITY ?auto_12189 ?auto_12193 ) ( not ( = ?auto_12189 ?auto_12194 ) ) ( OBJ-AT ?auto_12192 ?auto_12189 ) ( not ( = ?auto_12192 ?auto_12190 ) ) ( OBJ-AT ?auto_12190 ?auto_12194 ) ( TRUCK-AT ?auto_12195 ?auto_12189 ) ( OBJ-AT ?auto_12191 ?auto_12189 ) ( not ( = ?auto_12190 ?auto_12191 ) ) ( not ( = ?auto_12191 ?auto_12192 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12192 ?auto_12190 ?auto_12189 )
      ( DELIVER-3PKG-VERIFY ?auto_12190 ?auto_12191 ?auto_12192 ?auto_12189 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12197 - OBJ
      ?auto_12198 - OBJ
      ?auto_12199 - OBJ
      ?auto_12196 - LOCATION
    )
    :vars
    (
      ?auto_12201 - LOCATION
      ?auto_12200 - CITY
      ?auto_12203 - OBJ
      ?auto_12202 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12201 ?auto_12200 ) ( IN-CITY ?auto_12196 ?auto_12200 ) ( not ( = ?auto_12196 ?auto_12201 ) ) ( OBJ-AT ?auto_12203 ?auto_12196 ) ( not ( = ?auto_12203 ?auto_12197 ) ) ( OBJ-AT ?auto_12197 ?auto_12201 ) ( TRUCK-AT ?auto_12202 ?auto_12196 ) ( OBJ-AT ?auto_12198 ?auto_12196 ) ( OBJ-AT ?auto_12199 ?auto_12196 ) ( not ( = ?auto_12197 ?auto_12198 ) ) ( not ( = ?auto_12197 ?auto_12199 ) ) ( not ( = ?auto_12198 ?auto_12199 ) ) ( not ( = ?auto_12198 ?auto_12203 ) ) ( not ( = ?auto_12199 ?auto_12203 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12203 ?auto_12197 ?auto_12196 )
      ( DELIVER-3PKG-VERIFY ?auto_12197 ?auto_12198 ?auto_12199 ?auto_12196 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12236 - OBJ
      ?auto_12235 - LOCATION
    )
    :vars
    (
      ?auto_12238 - LOCATION
      ?auto_12237 - CITY
      ?auto_12240 - OBJ
      ?auto_12239 - TRUCK
      ?auto_12241 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_12238 ?auto_12237 ) ( IN-CITY ?auto_12235 ?auto_12237 ) ( not ( = ?auto_12235 ?auto_12238 ) ) ( OBJ-AT ?auto_12240 ?auto_12235 ) ( not ( = ?auto_12240 ?auto_12236 ) ) ( OBJ-AT ?auto_12236 ?auto_12238 ) ( TRUCK-AT ?auto_12239 ?auto_12235 ) ( IN-TRUCK ?auto_12241 ?auto_12239 ) ( not ( = ?auto_12240 ?auto_12241 ) ) ( not ( = ?auto_12236 ?auto_12241 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12240 ?auto_12241 ?auto_12235 )
      ( DELIVER-2PKG ?auto_12240 ?auto_12236 ?auto_12235 )
      ( DELIVER-1PKG-VERIFY ?auto_12236 ?auto_12235 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12243 - OBJ
      ?auto_12244 - OBJ
      ?auto_12242 - LOCATION
    )
    :vars
    (
      ?auto_12247 - LOCATION
      ?auto_12246 - CITY
      ?auto_12245 - TRUCK
      ?auto_12248 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_12247 ?auto_12246 ) ( IN-CITY ?auto_12242 ?auto_12246 ) ( not ( = ?auto_12242 ?auto_12247 ) ) ( OBJ-AT ?auto_12243 ?auto_12242 ) ( not ( = ?auto_12243 ?auto_12244 ) ) ( OBJ-AT ?auto_12244 ?auto_12247 ) ( TRUCK-AT ?auto_12245 ?auto_12242 ) ( IN-TRUCK ?auto_12248 ?auto_12245 ) ( not ( = ?auto_12243 ?auto_12248 ) ) ( not ( = ?auto_12244 ?auto_12248 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12244 ?auto_12242 )
      ( DELIVER-2PKG-VERIFY ?auto_12243 ?auto_12244 ?auto_12242 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12250 - OBJ
      ?auto_12251 - OBJ
      ?auto_12249 - LOCATION
    )
    :vars
    (
      ?auto_12253 - LOCATION
      ?auto_12255 - CITY
      ?auto_12252 - OBJ
      ?auto_12254 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12253 ?auto_12255 ) ( IN-CITY ?auto_12249 ?auto_12255 ) ( not ( = ?auto_12249 ?auto_12253 ) ) ( OBJ-AT ?auto_12252 ?auto_12249 ) ( not ( = ?auto_12252 ?auto_12251 ) ) ( OBJ-AT ?auto_12251 ?auto_12253 ) ( TRUCK-AT ?auto_12254 ?auto_12249 ) ( IN-TRUCK ?auto_12250 ?auto_12254 ) ( not ( = ?auto_12252 ?auto_12250 ) ) ( not ( = ?auto_12251 ?auto_12250 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12252 ?auto_12251 ?auto_12249 )
      ( DELIVER-2PKG-VERIFY ?auto_12250 ?auto_12251 ?auto_12249 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12257 - OBJ
      ?auto_12258 - OBJ
      ?auto_12256 - LOCATION
    )
    :vars
    (
      ?auto_12259 - LOCATION
      ?auto_12262 - CITY
      ?auto_12261 - TRUCK
      ?auto_12260 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_12259 ?auto_12262 ) ( IN-CITY ?auto_12256 ?auto_12262 ) ( not ( = ?auto_12256 ?auto_12259 ) ) ( OBJ-AT ?auto_12258 ?auto_12256 ) ( not ( = ?auto_12258 ?auto_12257 ) ) ( OBJ-AT ?auto_12257 ?auto_12259 ) ( TRUCK-AT ?auto_12261 ?auto_12256 ) ( IN-TRUCK ?auto_12260 ?auto_12261 ) ( not ( = ?auto_12258 ?auto_12260 ) ) ( not ( = ?auto_12257 ?auto_12260 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12258 ?auto_12257 ?auto_12256 )
      ( DELIVER-2PKG-VERIFY ?auto_12257 ?auto_12258 ?auto_12256 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12264 - OBJ
      ?auto_12265 - OBJ
      ?auto_12263 - LOCATION
    )
    :vars
    (
      ?auto_12267 - LOCATION
      ?auto_12269 - CITY
      ?auto_12266 - OBJ
      ?auto_12268 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12267 ?auto_12269 ) ( IN-CITY ?auto_12263 ?auto_12269 ) ( not ( = ?auto_12263 ?auto_12267 ) ) ( OBJ-AT ?auto_12266 ?auto_12263 ) ( not ( = ?auto_12266 ?auto_12264 ) ) ( OBJ-AT ?auto_12264 ?auto_12267 ) ( TRUCK-AT ?auto_12268 ?auto_12263 ) ( IN-TRUCK ?auto_12265 ?auto_12268 ) ( not ( = ?auto_12266 ?auto_12265 ) ) ( not ( = ?auto_12264 ?auto_12265 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12266 ?auto_12264 ?auto_12263 )
      ( DELIVER-2PKG-VERIFY ?auto_12264 ?auto_12265 ?auto_12263 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12279 - OBJ
      ?auto_12280 - OBJ
      ?auto_12281 - OBJ
      ?auto_12278 - LOCATION
    )
    :vars
    (
      ?auto_12282 - LOCATION
      ?auto_12285 - CITY
      ?auto_12284 - TRUCK
      ?auto_12283 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_12282 ?auto_12285 ) ( IN-CITY ?auto_12278 ?auto_12285 ) ( not ( = ?auto_12278 ?auto_12282 ) ) ( OBJ-AT ?auto_12279 ?auto_12278 ) ( not ( = ?auto_12279 ?auto_12281 ) ) ( OBJ-AT ?auto_12281 ?auto_12282 ) ( TRUCK-AT ?auto_12284 ?auto_12278 ) ( IN-TRUCK ?auto_12283 ?auto_12284 ) ( not ( = ?auto_12279 ?auto_12283 ) ) ( not ( = ?auto_12281 ?auto_12283 ) ) ( OBJ-AT ?auto_12280 ?auto_12278 ) ( not ( = ?auto_12279 ?auto_12280 ) ) ( not ( = ?auto_12280 ?auto_12281 ) ) ( not ( = ?auto_12280 ?auto_12283 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12279 ?auto_12281 ?auto_12278 )
      ( DELIVER-3PKG-VERIFY ?auto_12279 ?auto_12280 ?auto_12281 ?auto_12278 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12287 - OBJ
      ?auto_12288 - OBJ
      ?auto_12289 - OBJ
      ?auto_12286 - LOCATION
    )
    :vars
    (
      ?auto_12290 - LOCATION
      ?auto_12292 - CITY
      ?auto_12291 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12290 ?auto_12292 ) ( IN-CITY ?auto_12286 ?auto_12292 ) ( not ( = ?auto_12286 ?auto_12290 ) ) ( OBJ-AT ?auto_12287 ?auto_12286 ) ( not ( = ?auto_12287 ?auto_12289 ) ) ( OBJ-AT ?auto_12289 ?auto_12290 ) ( TRUCK-AT ?auto_12291 ?auto_12286 ) ( IN-TRUCK ?auto_12288 ?auto_12291 ) ( not ( = ?auto_12287 ?auto_12288 ) ) ( not ( = ?auto_12289 ?auto_12288 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12287 ?auto_12289 ?auto_12286 )
      ( DELIVER-3PKG-VERIFY ?auto_12287 ?auto_12288 ?auto_12289 ?auto_12286 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12294 - OBJ
      ?auto_12295 - OBJ
      ?auto_12296 - OBJ
      ?auto_12293 - LOCATION
    )
    :vars
    (
      ?auto_12297 - LOCATION
      ?auto_12300 - CITY
      ?auto_12299 - TRUCK
      ?auto_12298 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_12297 ?auto_12300 ) ( IN-CITY ?auto_12293 ?auto_12300 ) ( not ( = ?auto_12293 ?auto_12297 ) ) ( OBJ-AT ?auto_12296 ?auto_12293 ) ( not ( = ?auto_12296 ?auto_12295 ) ) ( OBJ-AT ?auto_12295 ?auto_12297 ) ( TRUCK-AT ?auto_12299 ?auto_12293 ) ( IN-TRUCK ?auto_12298 ?auto_12299 ) ( not ( = ?auto_12296 ?auto_12298 ) ) ( not ( = ?auto_12295 ?auto_12298 ) ) ( OBJ-AT ?auto_12294 ?auto_12293 ) ( not ( = ?auto_12294 ?auto_12295 ) ) ( not ( = ?auto_12294 ?auto_12296 ) ) ( not ( = ?auto_12294 ?auto_12298 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12296 ?auto_12295 ?auto_12293 )
      ( DELIVER-3PKG-VERIFY ?auto_12294 ?auto_12295 ?auto_12296 ?auto_12293 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12302 - OBJ
      ?auto_12303 - OBJ
      ?auto_12304 - OBJ
      ?auto_12301 - LOCATION
    )
    :vars
    (
      ?auto_12305 - LOCATION
      ?auto_12307 - CITY
      ?auto_12306 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12305 ?auto_12307 ) ( IN-CITY ?auto_12301 ?auto_12307 ) ( not ( = ?auto_12301 ?auto_12305 ) ) ( OBJ-AT ?auto_12302 ?auto_12301 ) ( not ( = ?auto_12302 ?auto_12303 ) ) ( OBJ-AT ?auto_12303 ?auto_12305 ) ( TRUCK-AT ?auto_12306 ?auto_12301 ) ( IN-TRUCK ?auto_12304 ?auto_12306 ) ( not ( = ?auto_12302 ?auto_12304 ) ) ( not ( = ?auto_12303 ?auto_12304 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12302 ?auto_12303 ?auto_12301 )
      ( DELIVER-3PKG-VERIFY ?auto_12302 ?auto_12303 ?auto_12304 ?auto_12301 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12317 - OBJ
      ?auto_12318 - OBJ
      ?auto_12319 - OBJ
      ?auto_12316 - LOCATION
    )
    :vars
    (
      ?auto_12320 - LOCATION
      ?auto_12322 - CITY
      ?auto_12321 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12320 ?auto_12322 ) ( IN-CITY ?auto_12316 ?auto_12322 ) ( not ( = ?auto_12316 ?auto_12320 ) ) ( OBJ-AT ?auto_12318 ?auto_12316 ) ( not ( = ?auto_12318 ?auto_12319 ) ) ( OBJ-AT ?auto_12319 ?auto_12320 ) ( TRUCK-AT ?auto_12321 ?auto_12316 ) ( IN-TRUCK ?auto_12317 ?auto_12321 ) ( not ( = ?auto_12318 ?auto_12317 ) ) ( not ( = ?auto_12319 ?auto_12317 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12318 ?auto_12319 ?auto_12316 )
      ( DELIVER-3PKG-VERIFY ?auto_12317 ?auto_12318 ?auto_12319 ?auto_12316 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12332 - OBJ
      ?auto_12333 - OBJ
      ?auto_12334 - OBJ
      ?auto_12331 - LOCATION
    )
    :vars
    (
      ?auto_12335 - LOCATION
      ?auto_12337 - CITY
      ?auto_12336 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12335 ?auto_12337 ) ( IN-CITY ?auto_12331 ?auto_12337 ) ( not ( = ?auto_12331 ?auto_12335 ) ) ( OBJ-AT ?auto_12334 ?auto_12331 ) ( not ( = ?auto_12334 ?auto_12333 ) ) ( OBJ-AT ?auto_12333 ?auto_12335 ) ( TRUCK-AT ?auto_12336 ?auto_12331 ) ( IN-TRUCK ?auto_12332 ?auto_12336 ) ( not ( = ?auto_12334 ?auto_12332 ) ) ( not ( = ?auto_12333 ?auto_12332 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12334 ?auto_12333 ?auto_12331 )
      ( DELIVER-3PKG-VERIFY ?auto_12332 ?auto_12333 ?auto_12334 ?auto_12331 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12355 - OBJ
      ?auto_12356 - OBJ
      ?auto_12357 - OBJ
      ?auto_12354 - LOCATION
    )
    :vars
    (
      ?auto_12358 - LOCATION
      ?auto_12361 - CITY
      ?auto_12360 - TRUCK
      ?auto_12359 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_12358 ?auto_12361 ) ( IN-CITY ?auto_12354 ?auto_12361 ) ( not ( = ?auto_12354 ?auto_12358 ) ) ( OBJ-AT ?auto_12356 ?auto_12354 ) ( not ( = ?auto_12356 ?auto_12355 ) ) ( OBJ-AT ?auto_12355 ?auto_12358 ) ( TRUCK-AT ?auto_12360 ?auto_12354 ) ( IN-TRUCK ?auto_12359 ?auto_12360 ) ( not ( = ?auto_12356 ?auto_12359 ) ) ( not ( = ?auto_12355 ?auto_12359 ) ) ( OBJ-AT ?auto_12357 ?auto_12354 ) ( not ( = ?auto_12355 ?auto_12357 ) ) ( not ( = ?auto_12356 ?auto_12357 ) ) ( not ( = ?auto_12357 ?auto_12359 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12356 ?auto_12355 ?auto_12354 )
      ( DELIVER-3PKG-VERIFY ?auto_12355 ?auto_12356 ?auto_12357 ?auto_12354 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12363 - OBJ
      ?auto_12364 - OBJ
      ?auto_12365 - OBJ
      ?auto_12362 - LOCATION
    )
    :vars
    (
      ?auto_12366 - LOCATION
      ?auto_12368 - CITY
      ?auto_12367 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12366 ?auto_12368 ) ( IN-CITY ?auto_12362 ?auto_12368 ) ( not ( = ?auto_12362 ?auto_12366 ) ) ( OBJ-AT ?auto_12364 ?auto_12362 ) ( not ( = ?auto_12364 ?auto_12363 ) ) ( OBJ-AT ?auto_12363 ?auto_12366 ) ( TRUCK-AT ?auto_12367 ?auto_12362 ) ( IN-TRUCK ?auto_12365 ?auto_12367 ) ( not ( = ?auto_12364 ?auto_12365 ) ) ( not ( = ?auto_12363 ?auto_12365 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12364 ?auto_12363 ?auto_12362 )
      ( DELIVER-3PKG-VERIFY ?auto_12363 ?auto_12364 ?auto_12365 ?auto_12362 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12378 - OBJ
      ?auto_12379 - OBJ
      ?auto_12380 - OBJ
      ?auto_12377 - LOCATION
    )
    :vars
    (
      ?auto_12381 - LOCATION
      ?auto_12383 - CITY
      ?auto_12382 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12381 ?auto_12383 ) ( IN-CITY ?auto_12377 ?auto_12383 ) ( not ( = ?auto_12377 ?auto_12381 ) ) ( OBJ-AT ?auto_12380 ?auto_12377 ) ( not ( = ?auto_12380 ?auto_12378 ) ) ( OBJ-AT ?auto_12378 ?auto_12381 ) ( TRUCK-AT ?auto_12382 ?auto_12377 ) ( IN-TRUCK ?auto_12379 ?auto_12382 ) ( not ( = ?auto_12380 ?auto_12379 ) ) ( not ( = ?auto_12378 ?auto_12379 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12380 ?auto_12378 ?auto_12377 )
      ( DELIVER-3PKG-VERIFY ?auto_12378 ?auto_12379 ?auto_12380 ?auto_12377 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12426 - OBJ
      ?auto_12425 - LOCATION
    )
    :vars
    (
      ?auto_12428 - LOCATION
      ?auto_12431 - CITY
      ?auto_12427 - OBJ
      ?auto_12429 - OBJ
      ?auto_12430 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12428 ?auto_12431 ) ( IN-CITY ?auto_12425 ?auto_12431 ) ( not ( = ?auto_12425 ?auto_12428 ) ) ( OBJ-AT ?auto_12427 ?auto_12425 ) ( not ( = ?auto_12427 ?auto_12426 ) ) ( OBJ-AT ?auto_12426 ?auto_12428 ) ( IN-TRUCK ?auto_12429 ?auto_12430 ) ( not ( = ?auto_12427 ?auto_12429 ) ) ( not ( = ?auto_12426 ?auto_12429 ) ) ( TRUCK-AT ?auto_12430 ?auto_12428 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12430 ?auto_12428 ?auto_12425 ?auto_12431 )
      ( DELIVER-2PKG ?auto_12427 ?auto_12426 ?auto_12425 )
      ( DELIVER-1PKG-VERIFY ?auto_12426 ?auto_12425 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12433 - OBJ
      ?auto_12434 - OBJ
      ?auto_12432 - LOCATION
    )
    :vars
    (
      ?auto_12437 - LOCATION
      ?auto_12435 - CITY
      ?auto_12438 - OBJ
      ?auto_12436 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12437 ?auto_12435 ) ( IN-CITY ?auto_12432 ?auto_12435 ) ( not ( = ?auto_12432 ?auto_12437 ) ) ( OBJ-AT ?auto_12433 ?auto_12432 ) ( not ( = ?auto_12433 ?auto_12434 ) ) ( OBJ-AT ?auto_12434 ?auto_12437 ) ( IN-TRUCK ?auto_12438 ?auto_12436 ) ( not ( = ?auto_12433 ?auto_12438 ) ) ( not ( = ?auto_12434 ?auto_12438 ) ) ( TRUCK-AT ?auto_12436 ?auto_12437 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12434 ?auto_12432 )
      ( DELIVER-2PKG-VERIFY ?auto_12433 ?auto_12434 ?auto_12432 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12440 - OBJ
      ?auto_12441 - OBJ
      ?auto_12439 - LOCATION
    )
    :vars
    (
      ?auto_12445 - LOCATION
      ?auto_12442 - CITY
      ?auto_12444 - OBJ
      ?auto_12443 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12445 ?auto_12442 ) ( IN-CITY ?auto_12439 ?auto_12442 ) ( not ( = ?auto_12439 ?auto_12445 ) ) ( OBJ-AT ?auto_12444 ?auto_12439 ) ( not ( = ?auto_12444 ?auto_12441 ) ) ( OBJ-AT ?auto_12441 ?auto_12445 ) ( IN-TRUCK ?auto_12440 ?auto_12443 ) ( not ( = ?auto_12444 ?auto_12440 ) ) ( not ( = ?auto_12441 ?auto_12440 ) ) ( TRUCK-AT ?auto_12443 ?auto_12445 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12444 ?auto_12441 ?auto_12439 )
      ( DELIVER-2PKG-VERIFY ?auto_12440 ?auto_12441 ?auto_12439 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12447 - OBJ
      ?auto_12448 - OBJ
      ?auto_12446 - LOCATION
    )
    :vars
    (
      ?auto_12452 - LOCATION
      ?auto_12449 - CITY
      ?auto_12450 - OBJ
      ?auto_12451 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12452 ?auto_12449 ) ( IN-CITY ?auto_12446 ?auto_12449 ) ( not ( = ?auto_12446 ?auto_12452 ) ) ( OBJ-AT ?auto_12448 ?auto_12446 ) ( not ( = ?auto_12448 ?auto_12447 ) ) ( OBJ-AT ?auto_12447 ?auto_12452 ) ( IN-TRUCK ?auto_12450 ?auto_12451 ) ( not ( = ?auto_12448 ?auto_12450 ) ) ( not ( = ?auto_12447 ?auto_12450 ) ) ( TRUCK-AT ?auto_12451 ?auto_12452 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12448 ?auto_12447 ?auto_12446 )
      ( DELIVER-2PKG-VERIFY ?auto_12447 ?auto_12448 ?auto_12446 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12454 - OBJ
      ?auto_12455 - OBJ
      ?auto_12453 - LOCATION
    )
    :vars
    (
      ?auto_12459 - LOCATION
      ?auto_12456 - CITY
      ?auto_12458 - OBJ
      ?auto_12457 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12459 ?auto_12456 ) ( IN-CITY ?auto_12453 ?auto_12456 ) ( not ( = ?auto_12453 ?auto_12459 ) ) ( OBJ-AT ?auto_12458 ?auto_12453 ) ( not ( = ?auto_12458 ?auto_12454 ) ) ( OBJ-AT ?auto_12454 ?auto_12459 ) ( IN-TRUCK ?auto_12455 ?auto_12457 ) ( not ( = ?auto_12458 ?auto_12455 ) ) ( not ( = ?auto_12454 ?auto_12455 ) ) ( TRUCK-AT ?auto_12457 ?auto_12459 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12458 ?auto_12454 ?auto_12453 )
      ( DELIVER-2PKG-VERIFY ?auto_12454 ?auto_12455 ?auto_12453 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12469 - OBJ
      ?auto_12470 - OBJ
      ?auto_12471 - OBJ
      ?auto_12468 - LOCATION
    )
    :vars
    (
      ?auto_12475 - LOCATION
      ?auto_12472 - CITY
      ?auto_12473 - OBJ
      ?auto_12474 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12475 ?auto_12472 ) ( IN-CITY ?auto_12468 ?auto_12472 ) ( not ( = ?auto_12468 ?auto_12475 ) ) ( OBJ-AT ?auto_12469 ?auto_12468 ) ( not ( = ?auto_12469 ?auto_12471 ) ) ( OBJ-AT ?auto_12471 ?auto_12475 ) ( IN-TRUCK ?auto_12473 ?auto_12474 ) ( not ( = ?auto_12469 ?auto_12473 ) ) ( not ( = ?auto_12471 ?auto_12473 ) ) ( TRUCK-AT ?auto_12474 ?auto_12475 ) ( OBJ-AT ?auto_12470 ?auto_12468 ) ( not ( = ?auto_12469 ?auto_12470 ) ) ( not ( = ?auto_12470 ?auto_12471 ) ) ( not ( = ?auto_12470 ?auto_12473 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12469 ?auto_12471 ?auto_12468 )
      ( DELIVER-3PKG-VERIFY ?auto_12469 ?auto_12470 ?auto_12471 ?auto_12468 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12477 - OBJ
      ?auto_12478 - OBJ
      ?auto_12479 - OBJ
      ?auto_12476 - LOCATION
    )
    :vars
    (
      ?auto_12482 - LOCATION
      ?auto_12480 - CITY
      ?auto_12481 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12482 ?auto_12480 ) ( IN-CITY ?auto_12476 ?auto_12480 ) ( not ( = ?auto_12476 ?auto_12482 ) ) ( OBJ-AT ?auto_12477 ?auto_12476 ) ( not ( = ?auto_12477 ?auto_12479 ) ) ( OBJ-AT ?auto_12479 ?auto_12482 ) ( IN-TRUCK ?auto_12478 ?auto_12481 ) ( not ( = ?auto_12477 ?auto_12478 ) ) ( not ( = ?auto_12479 ?auto_12478 ) ) ( TRUCK-AT ?auto_12481 ?auto_12482 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12477 ?auto_12479 ?auto_12476 )
      ( DELIVER-3PKG-VERIFY ?auto_12477 ?auto_12478 ?auto_12479 ?auto_12476 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12484 - OBJ
      ?auto_12485 - OBJ
      ?auto_12486 - OBJ
      ?auto_12483 - LOCATION
    )
    :vars
    (
      ?auto_12490 - LOCATION
      ?auto_12487 - CITY
      ?auto_12488 - OBJ
      ?auto_12489 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12490 ?auto_12487 ) ( IN-CITY ?auto_12483 ?auto_12487 ) ( not ( = ?auto_12483 ?auto_12490 ) ) ( OBJ-AT ?auto_12486 ?auto_12483 ) ( not ( = ?auto_12486 ?auto_12485 ) ) ( OBJ-AT ?auto_12485 ?auto_12490 ) ( IN-TRUCK ?auto_12488 ?auto_12489 ) ( not ( = ?auto_12486 ?auto_12488 ) ) ( not ( = ?auto_12485 ?auto_12488 ) ) ( TRUCK-AT ?auto_12489 ?auto_12490 ) ( OBJ-AT ?auto_12484 ?auto_12483 ) ( not ( = ?auto_12484 ?auto_12485 ) ) ( not ( = ?auto_12484 ?auto_12486 ) ) ( not ( = ?auto_12484 ?auto_12488 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12486 ?auto_12485 ?auto_12483 )
      ( DELIVER-3PKG-VERIFY ?auto_12484 ?auto_12485 ?auto_12486 ?auto_12483 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12492 - OBJ
      ?auto_12493 - OBJ
      ?auto_12494 - OBJ
      ?auto_12491 - LOCATION
    )
    :vars
    (
      ?auto_12497 - LOCATION
      ?auto_12495 - CITY
      ?auto_12496 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12497 ?auto_12495 ) ( IN-CITY ?auto_12491 ?auto_12495 ) ( not ( = ?auto_12491 ?auto_12497 ) ) ( OBJ-AT ?auto_12492 ?auto_12491 ) ( not ( = ?auto_12492 ?auto_12493 ) ) ( OBJ-AT ?auto_12493 ?auto_12497 ) ( IN-TRUCK ?auto_12494 ?auto_12496 ) ( not ( = ?auto_12492 ?auto_12494 ) ) ( not ( = ?auto_12493 ?auto_12494 ) ) ( TRUCK-AT ?auto_12496 ?auto_12497 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12492 ?auto_12493 ?auto_12491 )
      ( DELIVER-3PKG-VERIFY ?auto_12492 ?auto_12493 ?auto_12494 ?auto_12491 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12507 - OBJ
      ?auto_12508 - OBJ
      ?auto_12509 - OBJ
      ?auto_12506 - LOCATION
    )
    :vars
    (
      ?auto_12512 - LOCATION
      ?auto_12510 - CITY
      ?auto_12511 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12512 ?auto_12510 ) ( IN-CITY ?auto_12506 ?auto_12510 ) ( not ( = ?auto_12506 ?auto_12512 ) ) ( OBJ-AT ?auto_12508 ?auto_12506 ) ( not ( = ?auto_12508 ?auto_12509 ) ) ( OBJ-AT ?auto_12509 ?auto_12512 ) ( IN-TRUCK ?auto_12507 ?auto_12511 ) ( not ( = ?auto_12508 ?auto_12507 ) ) ( not ( = ?auto_12509 ?auto_12507 ) ) ( TRUCK-AT ?auto_12511 ?auto_12512 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12508 ?auto_12509 ?auto_12506 )
      ( DELIVER-3PKG-VERIFY ?auto_12507 ?auto_12508 ?auto_12509 ?auto_12506 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12522 - OBJ
      ?auto_12523 - OBJ
      ?auto_12524 - OBJ
      ?auto_12521 - LOCATION
    )
    :vars
    (
      ?auto_12527 - LOCATION
      ?auto_12525 - CITY
      ?auto_12526 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12527 ?auto_12525 ) ( IN-CITY ?auto_12521 ?auto_12525 ) ( not ( = ?auto_12521 ?auto_12527 ) ) ( OBJ-AT ?auto_12524 ?auto_12521 ) ( not ( = ?auto_12524 ?auto_12523 ) ) ( OBJ-AT ?auto_12523 ?auto_12527 ) ( IN-TRUCK ?auto_12522 ?auto_12526 ) ( not ( = ?auto_12524 ?auto_12522 ) ) ( not ( = ?auto_12523 ?auto_12522 ) ) ( TRUCK-AT ?auto_12526 ?auto_12527 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12524 ?auto_12523 ?auto_12521 )
      ( DELIVER-3PKG-VERIFY ?auto_12522 ?auto_12523 ?auto_12524 ?auto_12521 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12545 - OBJ
      ?auto_12546 - OBJ
      ?auto_12547 - OBJ
      ?auto_12544 - LOCATION
    )
    :vars
    (
      ?auto_12551 - LOCATION
      ?auto_12548 - CITY
      ?auto_12549 - OBJ
      ?auto_12550 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12551 ?auto_12548 ) ( IN-CITY ?auto_12544 ?auto_12548 ) ( not ( = ?auto_12544 ?auto_12551 ) ) ( OBJ-AT ?auto_12546 ?auto_12544 ) ( not ( = ?auto_12546 ?auto_12545 ) ) ( OBJ-AT ?auto_12545 ?auto_12551 ) ( IN-TRUCK ?auto_12549 ?auto_12550 ) ( not ( = ?auto_12546 ?auto_12549 ) ) ( not ( = ?auto_12545 ?auto_12549 ) ) ( TRUCK-AT ?auto_12550 ?auto_12551 ) ( OBJ-AT ?auto_12547 ?auto_12544 ) ( not ( = ?auto_12545 ?auto_12547 ) ) ( not ( = ?auto_12546 ?auto_12547 ) ) ( not ( = ?auto_12547 ?auto_12549 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12546 ?auto_12545 ?auto_12544 )
      ( DELIVER-3PKG-VERIFY ?auto_12545 ?auto_12546 ?auto_12547 ?auto_12544 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12553 - OBJ
      ?auto_12554 - OBJ
      ?auto_12555 - OBJ
      ?auto_12552 - LOCATION
    )
    :vars
    (
      ?auto_12558 - LOCATION
      ?auto_12556 - CITY
      ?auto_12557 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12558 ?auto_12556 ) ( IN-CITY ?auto_12552 ?auto_12556 ) ( not ( = ?auto_12552 ?auto_12558 ) ) ( OBJ-AT ?auto_12554 ?auto_12552 ) ( not ( = ?auto_12554 ?auto_12553 ) ) ( OBJ-AT ?auto_12553 ?auto_12558 ) ( IN-TRUCK ?auto_12555 ?auto_12557 ) ( not ( = ?auto_12554 ?auto_12555 ) ) ( not ( = ?auto_12553 ?auto_12555 ) ) ( TRUCK-AT ?auto_12557 ?auto_12558 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12554 ?auto_12553 ?auto_12552 )
      ( DELIVER-3PKG-VERIFY ?auto_12553 ?auto_12554 ?auto_12555 ?auto_12552 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12568 - OBJ
      ?auto_12569 - OBJ
      ?auto_12570 - OBJ
      ?auto_12567 - LOCATION
    )
    :vars
    (
      ?auto_12573 - LOCATION
      ?auto_12571 - CITY
      ?auto_12572 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12573 ?auto_12571 ) ( IN-CITY ?auto_12567 ?auto_12571 ) ( not ( = ?auto_12567 ?auto_12573 ) ) ( OBJ-AT ?auto_12570 ?auto_12567 ) ( not ( = ?auto_12570 ?auto_12568 ) ) ( OBJ-AT ?auto_12568 ?auto_12573 ) ( IN-TRUCK ?auto_12569 ?auto_12572 ) ( not ( = ?auto_12570 ?auto_12569 ) ) ( not ( = ?auto_12568 ?auto_12569 ) ) ( TRUCK-AT ?auto_12572 ?auto_12573 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12570 ?auto_12568 ?auto_12567 )
      ( DELIVER-3PKG-VERIFY ?auto_12568 ?auto_12569 ?auto_12570 ?auto_12567 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12616 - OBJ
      ?auto_12615 - LOCATION
    )
    :vars
    (
      ?auto_12621 - LOCATION
      ?auto_12617 - CITY
      ?auto_12620 - OBJ
      ?auto_12618 - OBJ
      ?auto_12619 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12621 ?auto_12617 ) ( IN-CITY ?auto_12615 ?auto_12617 ) ( not ( = ?auto_12615 ?auto_12621 ) ) ( OBJ-AT ?auto_12620 ?auto_12615 ) ( not ( = ?auto_12620 ?auto_12616 ) ) ( OBJ-AT ?auto_12616 ?auto_12621 ) ( not ( = ?auto_12620 ?auto_12618 ) ) ( not ( = ?auto_12616 ?auto_12618 ) ) ( TRUCK-AT ?auto_12619 ?auto_12621 ) ( OBJ-AT ?auto_12618 ?auto_12621 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12618 ?auto_12619 ?auto_12621 )
      ( DELIVER-2PKG ?auto_12620 ?auto_12616 ?auto_12615 )
      ( DELIVER-1PKG-VERIFY ?auto_12616 ?auto_12615 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12623 - OBJ
      ?auto_12624 - OBJ
      ?auto_12622 - LOCATION
    )
    :vars
    (
      ?auto_12625 - LOCATION
      ?auto_12628 - CITY
      ?auto_12626 - OBJ
      ?auto_12627 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12625 ?auto_12628 ) ( IN-CITY ?auto_12622 ?auto_12628 ) ( not ( = ?auto_12622 ?auto_12625 ) ) ( OBJ-AT ?auto_12623 ?auto_12622 ) ( not ( = ?auto_12623 ?auto_12624 ) ) ( OBJ-AT ?auto_12624 ?auto_12625 ) ( not ( = ?auto_12623 ?auto_12626 ) ) ( not ( = ?auto_12624 ?auto_12626 ) ) ( TRUCK-AT ?auto_12627 ?auto_12625 ) ( OBJ-AT ?auto_12626 ?auto_12625 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12624 ?auto_12622 )
      ( DELIVER-2PKG-VERIFY ?auto_12623 ?auto_12624 ?auto_12622 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12630 - OBJ
      ?auto_12631 - OBJ
      ?auto_12629 - LOCATION
    )
    :vars
    (
      ?auto_12633 - LOCATION
      ?auto_12632 - CITY
      ?auto_12635 - OBJ
      ?auto_12634 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12633 ?auto_12632 ) ( IN-CITY ?auto_12629 ?auto_12632 ) ( not ( = ?auto_12629 ?auto_12633 ) ) ( OBJ-AT ?auto_12635 ?auto_12629 ) ( not ( = ?auto_12635 ?auto_12631 ) ) ( OBJ-AT ?auto_12631 ?auto_12633 ) ( not ( = ?auto_12635 ?auto_12630 ) ) ( not ( = ?auto_12631 ?auto_12630 ) ) ( TRUCK-AT ?auto_12634 ?auto_12633 ) ( OBJ-AT ?auto_12630 ?auto_12633 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12635 ?auto_12631 ?auto_12629 )
      ( DELIVER-2PKG-VERIFY ?auto_12630 ?auto_12631 ?auto_12629 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12637 - OBJ
      ?auto_12638 - OBJ
      ?auto_12636 - LOCATION
    )
    :vars
    (
      ?auto_12641 - LOCATION
      ?auto_12639 - CITY
      ?auto_12640 - OBJ
      ?auto_12642 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12641 ?auto_12639 ) ( IN-CITY ?auto_12636 ?auto_12639 ) ( not ( = ?auto_12636 ?auto_12641 ) ) ( OBJ-AT ?auto_12638 ?auto_12636 ) ( not ( = ?auto_12638 ?auto_12637 ) ) ( OBJ-AT ?auto_12637 ?auto_12641 ) ( not ( = ?auto_12638 ?auto_12640 ) ) ( not ( = ?auto_12637 ?auto_12640 ) ) ( TRUCK-AT ?auto_12642 ?auto_12641 ) ( OBJ-AT ?auto_12640 ?auto_12641 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12638 ?auto_12637 ?auto_12636 )
      ( DELIVER-2PKG-VERIFY ?auto_12637 ?auto_12638 ?auto_12636 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12644 - OBJ
      ?auto_12645 - OBJ
      ?auto_12643 - LOCATION
    )
    :vars
    (
      ?auto_12647 - LOCATION
      ?auto_12646 - CITY
      ?auto_12649 - OBJ
      ?auto_12648 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12647 ?auto_12646 ) ( IN-CITY ?auto_12643 ?auto_12646 ) ( not ( = ?auto_12643 ?auto_12647 ) ) ( OBJ-AT ?auto_12649 ?auto_12643 ) ( not ( = ?auto_12649 ?auto_12644 ) ) ( OBJ-AT ?auto_12644 ?auto_12647 ) ( not ( = ?auto_12649 ?auto_12645 ) ) ( not ( = ?auto_12644 ?auto_12645 ) ) ( TRUCK-AT ?auto_12648 ?auto_12647 ) ( OBJ-AT ?auto_12645 ?auto_12647 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12649 ?auto_12644 ?auto_12643 )
      ( DELIVER-2PKG-VERIFY ?auto_12644 ?auto_12645 ?auto_12643 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12659 - OBJ
      ?auto_12660 - OBJ
      ?auto_12661 - OBJ
      ?auto_12658 - LOCATION
    )
    :vars
    (
      ?auto_12664 - LOCATION
      ?auto_12662 - CITY
      ?auto_12663 - OBJ
      ?auto_12665 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12664 ?auto_12662 ) ( IN-CITY ?auto_12658 ?auto_12662 ) ( not ( = ?auto_12658 ?auto_12664 ) ) ( OBJ-AT ?auto_12659 ?auto_12658 ) ( not ( = ?auto_12659 ?auto_12661 ) ) ( OBJ-AT ?auto_12661 ?auto_12664 ) ( not ( = ?auto_12659 ?auto_12663 ) ) ( not ( = ?auto_12661 ?auto_12663 ) ) ( TRUCK-AT ?auto_12665 ?auto_12664 ) ( OBJ-AT ?auto_12663 ?auto_12664 ) ( OBJ-AT ?auto_12660 ?auto_12658 ) ( not ( = ?auto_12659 ?auto_12660 ) ) ( not ( = ?auto_12660 ?auto_12661 ) ) ( not ( = ?auto_12660 ?auto_12663 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12659 ?auto_12661 ?auto_12658 )
      ( DELIVER-3PKG-VERIFY ?auto_12659 ?auto_12660 ?auto_12661 ?auto_12658 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12667 - OBJ
      ?auto_12668 - OBJ
      ?auto_12669 - OBJ
      ?auto_12666 - LOCATION
    )
    :vars
    (
      ?auto_12671 - LOCATION
      ?auto_12670 - CITY
      ?auto_12672 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12671 ?auto_12670 ) ( IN-CITY ?auto_12666 ?auto_12670 ) ( not ( = ?auto_12666 ?auto_12671 ) ) ( OBJ-AT ?auto_12667 ?auto_12666 ) ( not ( = ?auto_12667 ?auto_12669 ) ) ( OBJ-AT ?auto_12669 ?auto_12671 ) ( not ( = ?auto_12667 ?auto_12668 ) ) ( not ( = ?auto_12669 ?auto_12668 ) ) ( TRUCK-AT ?auto_12672 ?auto_12671 ) ( OBJ-AT ?auto_12668 ?auto_12671 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12667 ?auto_12669 ?auto_12666 )
      ( DELIVER-3PKG-VERIFY ?auto_12667 ?auto_12668 ?auto_12669 ?auto_12666 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12674 - OBJ
      ?auto_12675 - OBJ
      ?auto_12676 - OBJ
      ?auto_12673 - LOCATION
    )
    :vars
    (
      ?auto_12679 - LOCATION
      ?auto_12677 - CITY
      ?auto_12678 - OBJ
      ?auto_12680 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12679 ?auto_12677 ) ( IN-CITY ?auto_12673 ?auto_12677 ) ( not ( = ?auto_12673 ?auto_12679 ) ) ( OBJ-AT ?auto_12676 ?auto_12673 ) ( not ( = ?auto_12676 ?auto_12675 ) ) ( OBJ-AT ?auto_12675 ?auto_12679 ) ( not ( = ?auto_12676 ?auto_12678 ) ) ( not ( = ?auto_12675 ?auto_12678 ) ) ( TRUCK-AT ?auto_12680 ?auto_12679 ) ( OBJ-AT ?auto_12678 ?auto_12679 ) ( OBJ-AT ?auto_12674 ?auto_12673 ) ( not ( = ?auto_12674 ?auto_12675 ) ) ( not ( = ?auto_12674 ?auto_12676 ) ) ( not ( = ?auto_12674 ?auto_12678 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12676 ?auto_12675 ?auto_12673 )
      ( DELIVER-3PKG-VERIFY ?auto_12674 ?auto_12675 ?auto_12676 ?auto_12673 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12682 - OBJ
      ?auto_12683 - OBJ
      ?auto_12684 - OBJ
      ?auto_12681 - LOCATION
    )
    :vars
    (
      ?auto_12686 - LOCATION
      ?auto_12685 - CITY
      ?auto_12687 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12686 ?auto_12685 ) ( IN-CITY ?auto_12681 ?auto_12685 ) ( not ( = ?auto_12681 ?auto_12686 ) ) ( OBJ-AT ?auto_12682 ?auto_12681 ) ( not ( = ?auto_12682 ?auto_12683 ) ) ( OBJ-AT ?auto_12683 ?auto_12686 ) ( not ( = ?auto_12682 ?auto_12684 ) ) ( not ( = ?auto_12683 ?auto_12684 ) ) ( TRUCK-AT ?auto_12687 ?auto_12686 ) ( OBJ-AT ?auto_12684 ?auto_12686 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12682 ?auto_12683 ?auto_12681 )
      ( DELIVER-3PKG-VERIFY ?auto_12682 ?auto_12683 ?auto_12684 ?auto_12681 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12697 - OBJ
      ?auto_12698 - OBJ
      ?auto_12699 - OBJ
      ?auto_12696 - LOCATION
    )
    :vars
    (
      ?auto_12701 - LOCATION
      ?auto_12700 - CITY
      ?auto_12702 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12701 ?auto_12700 ) ( IN-CITY ?auto_12696 ?auto_12700 ) ( not ( = ?auto_12696 ?auto_12701 ) ) ( OBJ-AT ?auto_12698 ?auto_12696 ) ( not ( = ?auto_12698 ?auto_12699 ) ) ( OBJ-AT ?auto_12699 ?auto_12701 ) ( not ( = ?auto_12698 ?auto_12697 ) ) ( not ( = ?auto_12699 ?auto_12697 ) ) ( TRUCK-AT ?auto_12702 ?auto_12701 ) ( OBJ-AT ?auto_12697 ?auto_12701 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12698 ?auto_12699 ?auto_12696 )
      ( DELIVER-3PKG-VERIFY ?auto_12697 ?auto_12698 ?auto_12699 ?auto_12696 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12712 - OBJ
      ?auto_12713 - OBJ
      ?auto_12714 - OBJ
      ?auto_12711 - LOCATION
    )
    :vars
    (
      ?auto_12716 - LOCATION
      ?auto_12715 - CITY
      ?auto_12717 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12716 ?auto_12715 ) ( IN-CITY ?auto_12711 ?auto_12715 ) ( not ( = ?auto_12711 ?auto_12716 ) ) ( OBJ-AT ?auto_12714 ?auto_12711 ) ( not ( = ?auto_12714 ?auto_12713 ) ) ( OBJ-AT ?auto_12713 ?auto_12716 ) ( not ( = ?auto_12714 ?auto_12712 ) ) ( not ( = ?auto_12713 ?auto_12712 ) ) ( TRUCK-AT ?auto_12717 ?auto_12716 ) ( OBJ-AT ?auto_12712 ?auto_12716 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12714 ?auto_12713 ?auto_12711 )
      ( DELIVER-3PKG-VERIFY ?auto_12712 ?auto_12713 ?auto_12714 ?auto_12711 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12735 - OBJ
      ?auto_12736 - OBJ
      ?auto_12737 - OBJ
      ?auto_12734 - LOCATION
    )
    :vars
    (
      ?auto_12740 - LOCATION
      ?auto_12738 - CITY
      ?auto_12739 - OBJ
      ?auto_12741 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12740 ?auto_12738 ) ( IN-CITY ?auto_12734 ?auto_12738 ) ( not ( = ?auto_12734 ?auto_12740 ) ) ( OBJ-AT ?auto_12736 ?auto_12734 ) ( not ( = ?auto_12736 ?auto_12735 ) ) ( OBJ-AT ?auto_12735 ?auto_12740 ) ( not ( = ?auto_12736 ?auto_12739 ) ) ( not ( = ?auto_12735 ?auto_12739 ) ) ( TRUCK-AT ?auto_12741 ?auto_12740 ) ( OBJ-AT ?auto_12739 ?auto_12740 ) ( OBJ-AT ?auto_12737 ?auto_12734 ) ( not ( = ?auto_12735 ?auto_12737 ) ) ( not ( = ?auto_12736 ?auto_12737 ) ) ( not ( = ?auto_12737 ?auto_12739 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12736 ?auto_12735 ?auto_12734 )
      ( DELIVER-3PKG-VERIFY ?auto_12735 ?auto_12736 ?auto_12737 ?auto_12734 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12743 - OBJ
      ?auto_12744 - OBJ
      ?auto_12745 - OBJ
      ?auto_12742 - LOCATION
    )
    :vars
    (
      ?auto_12747 - LOCATION
      ?auto_12746 - CITY
      ?auto_12748 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12747 ?auto_12746 ) ( IN-CITY ?auto_12742 ?auto_12746 ) ( not ( = ?auto_12742 ?auto_12747 ) ) ( OBJ-AT ?auto_12744 ?auto_12742 ) ( not ( = ?auto_12744 ?auto_12743 ) ) ( OBJ-AT ?auto_12743 ?auto_12747 ) ( not ( = ?auto_12744 ?auto_12745 ) ) ( not ( = ?auto_12743 ?auto_12745 ) ) ( TRUCK-AT ?auto_12748 ?auto_12747 ) ( OBJ-AT ?auto_12745 ?auto_12747 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12744 ?auto_12743 ?auto_12742 )
      ( DELIVER-3PKG-VERIFY ?auto_12743 ?auto_12744 ?auto_12745 ?auto_12742 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12758 - OBJ
      ?auto_12759 - OBJ
      ?auto_12760 - OBJ
      ?auto_12757 - LOCATION
    )
    :vars
    (
      ?auto_12762 - LOCATION
      ?auto_12761 - CITY
      ?auto_12763 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12762 ?auto_12761 ) ( IN-CITY ?auto_12757 ?auto_12761 ) ( not ( = ?auto_12757 ?auto_12762 ) ) ( OBJ-AT ?auto_12760 ?auto_12757 ) ( not ( = ?auto_12760 ?auto_12758 ) ) ( OBJ-AT ?auto_12758 ?auto_12762 ) ( not ( = ?auto_12760 ?auto_12759 ) ) ( not ( = ?auto_12758 ?auto_12759 ) ) ( TRUCK-AT ?auto_12763 ?auto_12762 ) ( OBJ-AT ?auto_12759 ?auto_12762 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12760 ?auto_12758 ?auto_12757 )
      ( DELIVER-3PKG-VERIFY ?auto_12758 ?auto_12759 ?auto_12760 ?auto_12757 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12806 - OBJ
      ?auto_12805 - LOCATION
    )
    :vars
    (
      ?auto_12809 - LOCATION
      ?auto_12807 - CITY
      ?auto_12811 - OBJ
      ?auto_12808 - OBJ
      ?auto_12810 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12809 ?auto_12807 ) ( IN-CITY ?auto_12805 ?auto_12807 ) ( not ( = ?auto_12805 ?auto_12809 ) ) ( OBJ-AT ?auto_12811 ?auto_12805 ) ( not ( = ?auto_12811 ?auto_12806 ) ) ( OBJ-AT ?auto_12806 ?auto_12809 ) ( not ( = ?auto_12811 ?auto_12808 ) ) ( not ( = ?auto_12806 ?auto_12808 ) ) ( OBJ-AT ?auto_12808 ?auto_12809 ) ( TRUCK-AT ?auto_12810 ?auto_12805 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12810 ?auto_12805 ?auto_12809 ?auto_12807 )
      ( DELIVER-2PKG ?auto_12811 ?auto_12806 ?auto_12805 )
      ( DELIVER-1PKG-VERIFY ?auto_12806 ?auto_12805 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12813 - OBJ
      ?auto_12814 - OBJ
      ?auto_12812 - LOCATION
    )
    :vars
    (
      ?auto_12816 - LOCATION
      ?auto_12818 - CITY
      ?auto_12817 - OBJ
      ?auto_12815 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12816 ?auto_12818 ) ( IN-CITY ?auto_12812 ?auto_12818 ) ( not ( = ?auto_12812 ?auto_12816 ) ) ( OBJ-AT ?auto_12813 ?auto_12812 ) ( not ( = ?auto_12813 ?auto_12814 ) ) ( OBJ-AT ?auto_12814 ?auto_12816 ) ( not ( = ?auto_12813 ?auto_12817 ) ) ( not ( = ?auto_12814 ?auto_12817 ) ) ( OBJ-AT ?auto_12817 ?auto_12816 ) ( TRUCK-AT ?auto_12815 ?auto_12812 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12814 ?auto_12812 )
      ( DELIVER-2PKG-VERIFY ?auto_12813 ?auto_12814 ?auto_12812 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12820 - OBJ
      ?auto_12821 - OBJ
      ?auto_12819 - LOCATION
    )
    :vars
    (
      ?auto_12825 - LOCATION
      ?auto_12823 - CITY
      ?auto_12822 - OBJ
      ?auto_12824 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12825 ?auto_12823 ) ( IN-CITY ?auto_12819 ?auto_12823 ) ( not ( = ?auto_12819 ?auto_12825 ) ) ( OBJ-AT ?auto_12822 ?auto_12819 ) ( not ( = ?auto_12822 ?auto_12821 ) ) ( OBJ-AT ?auto_12821 ?auto_12825 ) ( not ( = ?auto_12822 ?auto_12820 ) ) ( not ( = ?auto_12821 ?auto_12820 ) ) ( OBJ-AT ?auto_12820 ?auto_12825 ) ( TRUCK-AT ?auto_12824 ?auto_12819 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12822 ?auto_12821 ?auto_12819 )
      ( DELIVER-2PKG-VERIFY ?auto_12820 ?auto_12821 ?auto_12819 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12827 - OBJ
      ?auto_12828 - OBJ
      ?auto_12826 - LOCATION
    )
    :vars
    (
      ?auto_12832 - LOCATION
      ?auto_12829 - CITY
      ?auto_12831 - OBJ
      ?auto_12830 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12832 ?auto_12829 ) ( IN-CITY ?auto_12826 ?auto_12829 ) ( not ( = ?auto_12826 ?auto_12832 ) ) ( OBJ-AT ?auto_12828 ?auto_12826 ) ( not ( = ?auto_12828 ?auto_12827 ) ) ( OBJ-AT ?auto_12827 ?auto_12832 ) ( not ( = ?auto_12828 ?auto_12831 ) ) ( not ( = ?auto_12827 ?auto_12831 ) ) ( OBJ-AT ?auto_12831 ?auto_12832 ) ( TRUCK-AT ?auto_12830 ?auto_12826 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12828 ?auto_12827 ?auto_12826 )
      ( DELIVER-2PKG-VERIFY ?auto_12827 ?auto_12828 ?auto_12826 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12834 - OBJ
      ?auto_12835 - OBJ
      ?auto_12833 - LOCATION
    )
    :vars
    (
      ?auto_12839 - LOCATION
      ?auto_12837 - CITY
      ?auto_12836 - OBJ
      ?auto_12838 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12839 ?auto_12837 ) ( IN-CITY ?auto_12833 ?auto_12837 ) ( not ( = ?auto_12833 ?auto_12839 ) ) ( OBJ-AT ?auto_12836 ?auto_12833 ) ( not ( = ?auto_12836 ?auto_12834 ) ) ( OBJ-AT ?auto_12834 ?auto_12839 ) ( not ( = ?auto_12836 ?auto_12835 ) ) ( not ( = ?auto_12834 ?auto_12835 ) ) ( OBJ-AT ?auto_12835 ?auto_12839 ) ( TRUCK-AT ?auto_12838 ?auto_12833 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12836 ?auto_12834 ?auto_12833 )
      ( DELIVER-2PKG-VERIFY ?auto_12834 ?auto_12835 ?auto_12833 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12849 - OBJ
      ?auto_12850 - OBJ
      ?auto_12851 - OBJ
      ?auto_12848 - LOCATION
    )
    :vars
    (
      ?auto_12855 - LOCATION
      ?auto_12852 - CITY
      ?auto_12854 - OBJ
      ?auto_12853 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12855 ?auto_12852 ) ( IN-CITY ?auto_12848 ?auto_12852 ) ( not ( = ?auto_12848 ?auto_12855 ) ) ( OBJ-AT ?auto_12849 ?auto_12848 ) ( not ( = ?auto_12849 ?auto_12851 ) ) ( OBJ-AT ?auto_12851 ?auto_12855 ) ( not ( = ?auto_12849 ?auto_12854 ) ) ( not ( = ?auto_12851 ?auto_12854 ) ) ( OBJ-AT ?auto_12854 ?auto_12855 ) ( TRUCK-AT ?auto_12853 ?auto_12848 ) ( OBJ-AT ?auto_12850 ?auto_12848 ) ( not ( = ?auto_12849 ?auto_12850 ) ) ( not ( = ?auto_12850 ?auto_12851 ) ) ( not ( = ?auto_12850 ?auto_12854 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12849 ?auto_12851 ?auto_12848 )
      ( DELIVER-3PKG-VERIFY ?auto_12849 ?auto_12850 ?auto_12851 ?auto_12848 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12857 - OBJ
      ?auto_12858 - OBJ
      ?auto_12859 - OBJ
      ?auto_12856 - LOCATION
    )
    :vars
    (
      ?auto_12862 - LOCATION
      ?auto_12860 - CITY
      ?auto_12861 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12862 ?auto_12860 ) ( IN-CITY ?auto_12856 ?auto_12860 ) ( not ( = ?auto_12856 ?auto_12862 ) ) ( OBJ-AT ?auto_12857 ?auto_12856 ) ( not ( = ?auto_12857 ?auto_12859 ) ) ( OBJ-AT ?auto_12859 ?auto_12862 ) ( not ( = ?auto_12857 ?auto_12858 ) ) ( not ( = ?auto_12859 ?auto_12858 ) ) ( OBJ-AT ?auto_12858 ?auto_12862 ) ( TRUCK-AT ?auto_12861 ?auto_12856 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12857 ?auto_12859 ?auto_12856 )
      ( DELIVER-3PKG-VERIFY ?auto_12857 ?auto_12858 ?auto_12859 ?auto_12856 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12864 - OBJ
      ?auto_12865 - OBJ
      ?auto_12866 - OBJ
      ?auto_12863 - LOCATION
    )
    :vars
    (
      ?auto_12870 - LOCATION
      ?auto_12867 - CITY
      ?auto_12869 - OBJ
      ?auto_12868 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12870 ?auto_12867 ) ( IN-CITY ?auto_12863 ?auto_12867 ) ( not ( = ?auto_12863 ?auto_12870 ) ) ( OBJ-AT ?auto_12866 ?auto_12863 ) ( not ( = ?auto_12866 ?auto_12865 ) ) ( OBJ-AT ?auto_12865 ?auto_12870 ) ( not ( = ?auto_12866 ?auto_12869 ) ) ( not ( = ?auto_12865 ?auto_12869 ) ) ( OBJ-AT ?auto_12869 ?auto_12870 ) ( TRUCK-AT ?auto_12868 ?auto_12863 ) ( OBJ-AT ?auto_12864 ?auto_12863 ) ( not ( = ?auto_12864 ?auto_12865 ) ) ( not ( = ?auto_12864 ?auto_12866 ) ) ( not ( = ?auto_12864 ?auto_12869 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12866 ?auto_12865 ?auto_12863 )
      ( DELIVER-3PKG-VERIFY ?auto_12864 ?auto_12865 ?auto_12866 ?auto_12863 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12872 - OBJ
      ?auto_12873 - OBJ
      ?auto_12874 - OBJ
      ?auto_12871 - LOCATION
    )
    :vars
    (
      ?auto_12877 - LOCATION
      ?auto_12875 - CITY
      ?auto_12876 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12877 ?auto_12875 ) ( IN-CITY ?auto_12871 ?auto_12875 ) ( not ( = ?auto_12871 ?auto_12877 ) ) ( OBJ-AT ?auto_12872 ?auto_12871 ) ( not ( = ?auto_12872 ?auto_12873 ) ) ( OBJ-AT ?auto_12873 ?auto_12877 ) ( not ( = ?auto_12872 ?auto_12874 ) ) ( not ( = ?auto_12873 ?auto_12874 ) ) ( OBJ-AT ?auto_12874 ?auto_12877 ) ( TRUCK-AT ?auto_12876 ?auto_12871 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12872 ?auto_12873 ?auto_12871 )
      ( DELIVER-3PKG-VERIFY ?auto_12872 ?auto_12873 ?auto_12874 ?auto_12871 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12887 - OBJ
      ?auto_12888 - OBJ
      ?auto_12889 - OBJ
      ?auto_12886 - LOCATION
    )
    :vars
    (
      ?auto_12892 - LOCATION
      ?auto_12890 - CITY
      ?auto_12891 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12892 ?auto_12890 ) ( IN-CITY ?auto_12886 ?auto_12890 ) ( not ( = ?auto_12886 ?auto_12892 ) ) ( OBJ-AT ?auto_12888 ?auto_12886 ) ( not ( = ?auto_12888 ?auto_12889 ) ) ( OBJ-AT ?auto_12889 ?auto_12892 ) ( not ( = ?auto_12888 ?auto_12887 ) ) ( not ( = ?auto_12889 ?auto_12887 ) ) ( OBJ-AT ?auto_12887 ?auto_12892 ) ( TRUCK-AT ?auto_12891 ?auto_12886 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12888 ?auto_12889 ?auto_12886 )
      ( DELIVER-3PKG-VERIFY ?auto_12887 ?auto_12888 ?auto_12889 ?auto_12886 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12902 - OBJ
      ?auto_12903 - OBJ
      ?auto_12904 - OBJ
      ?auto_12901 - LOCATION
    )
    :vars
    (
      ?auto_12907 - LOCATION
      ?auto_12905 - CITY
      ?auto_12906 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12907 ?auto_12905 ) ( IN-CITY ?auto_12901 ?auto_12905 ) ( not ( = ?auto_12901 ?auto_12907 ) ) ( OBJ-AT ?auto_12904 ?auto_12901 ) ( not ( = ?auto_12904 ?auto_12903 ) ) ( OBJ-AT ?auto_12903 ?auto_12907 ) ( not ( = ?auto_12904 ?auto_12902 ) ) ( not ( = ?auto_12903 ?auto_12902 ) ) ( OBJ-AT ?auto_12902 ?auto_12907 ) ( TRUCK-AT ?auto_12906 ?auto_12901 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12904 ?auto_12903 ?auto_12901 )
      ( DELIVER-3PKG-VERIFY ?auto_12902 ?auto_12903 ?auto_12904 ?auto_12901 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12925 - OBJ
      ?auto_12926 - OBJ
      ?auto_12927 - OBJ
      ?auto_12924 - LOCATION
    )
    :vars
    (
      ?auto_12931 - LOCATION
      ?auto_12928 - CITY
      ?auto_12930 - OBJ
      ?auto_12929 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12931 ?auto_12928 ) ( IN-CITY ?auto_12924 ?auto_12928 ) ( not ( = ?auto_12924 ?auto_12931 ) ) ( OBJ-AT ?auto_12926 ?auto_12924 ) ( not ( = ?auto_12926 ?auto_12925 ) ) ( OBJ-AT ?auto_12925 ?auto_12931 ) ( not ( = ?auto_12926 ?auto_12930 ) ) ( not ( = ?auto_12925 ?auto_12930 ) ) ( OBJ-AT ?auto_12930 ?auto_12931 ) ( TRUCK-AT ?auto_12929 ?auto_12924 ) ( OBJ-AT ?auto_12927 ?auto_12924 ) ( not ( = ?auto_12925 ?auto_12927 ) ) ( not ( = ?auto_12926 ?auto_12927 ) ) ( not ( = ?auto_12927 ?auto_12930 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12926 ?auto_12925 ?auto_12924 )
      ( DELIVER-3PKG-VERIFY ?auto_12925 ?auto_12926 ?auto_12927 ?auto_12924 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12933 - OBJ
      ?auto_12934 - OBJ
      ?auto_12935 - OBJ
      ?auto_12932 - LOCATION
    )
    :vars
    (
      ?auto_12938 - LOCATION
      ?auto_12936 - CITY
      ?auto_12937 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12938 ?auto_12936 ) ( IN-CITY ?auto_12932 ?auto_12936 ) ( not ( = ?auto_12932 ?auto_12938 ) ) ( OBJ-AT ?auto_12934 ?auto_12932 ) ( not ( = ?auto_12934 ?auto_12933 ) ) ( OBJ-AT ?auto_12933 ?auto_12938 ) ( not ( = ?auto_12934 ?auto_12935 ) ) ( not ( = ?auto_12933 ?auto_12935 ) ) ( OBJ-AT ?auto_12935 ?auto_12938 ) ( TRUCK-AT ?auto_12937 ?auto_12932 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12934 ?auto_12933 ?auto_12932 )
      ( DELIVER-3PKG-VERIFY ?auto_12933 ?auto_12934 ?auto_12935 ?auto_12932 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12948 - OBJ
      ?auto_12949 - OBJ
      ?auto_12950 - OBJ
      ?auto_12947 - LOCATION
    )
    :vars
    (
      ?auto_12953 - LOCATION
      ?auto_12951 - CITY
      ?auto_12952 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12953 ?auto_12951 ) ( IN-CITY ?auto_12947 ?auto_12951 ) ( not ( = ?auto_12947 ?auto_12953 ) ) ( OBJ-AT ?auto_12950 ?auto_12947 ) ( not ( = ?auto_12950 ?auto_12948 ) ) ( OBJ-AT ?auto_12948 ?auto_12953 ) ( not ( = ?auto_12950 ?auto_12949 ) ) ( not ( = ?auto_12948 ?auto_12949 ) ) ( OBJ-AT ?auto_12949 ?auto_12953 ) ( TRUCK-AT ?auto_12952 ?auto_12947 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12950 ?auto_12948 ?auto_12947 )
      ( DELIVER-3PKG-VERIFY ?auto_12948 ?auto_12949 ?auto_12950 ?auto_12947 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12996 - OBJ
      ?auto_12995 - LOCATION
    )
    :vars
    (
      ?auto_13001 - LOCATION
      ?auto_12998 - CITY
      ?auto_12997 - OBJ
      ?auto_13000 - OBJ
      ?auto_12999 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13001 ?auto_12998 ) ( IN-CITY ?auto_12995 ?auto_12998 ) ( not ( = ?auto_12995 ?auto_13001 ) ) ( not ( = ?auto_12997 ?auto_12996 ) ) ( OBJ-AT ?auto_12996 ?auto_13001 ) ( not ( = ?auto_12997 ?auto_13000 ) ) ( not ( = ?auto_12996 ?auto_13000 ) ) ( OBJ-AT ?auto_13000 ?auto_13001 ) ( TRUCK-AT ?auto_12999 ?auto_12995 ) ( IN-TRUCK ?auto_12997 ?auto_12999 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12997 ?auto_12995 )
      ( DELIVER-2PKG ?auto_12997 ?auto_12996 ?auto_12995 )
      ( DELIVER-1PKG-VERIFY ?auto_12996 ?auto_12995 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13003 - OBJ
      ?auto_13004 - OBJ
      ?auto_13002 - LOCATION
    )
    :vars
    (
      ?auto_13008 - LOCATION
      ?auto_13005 - CITY
      ?auto_13007 - OBJ
      ?auto_13006 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13008 ?auto_13005 ) ( IN-CITY ?auto_13002 ?auto_13005 ) ( not ( = ?auto_13002 ?auto_13008 ) ) ( not ( = ?auto_13003 ?auto_13004 ) ) ( OBJ-AT ?auto_13004 ?auto_13008 ) ( not ( = ?auto_13003 ?auto_13007 ) ) ( not ( = ?auto_13004 ?auto_13007 ) ) ( OBJ-AT ?auto_13007 ?auto_13008 ) ( TRUCK-AT ?auto_13006 ?auto_13002 ) ( IN-TRUCK ?auto_13003 ?auto_13006 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13004 ?auto_13002 )
      ( DELIVER-2PKG-VERIFY ?auto_13003 ?auto_13004 ?auto_13002 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13010 - OBJ
      ?auto_13011 - OBJ
      ?auto_13009 - LOCATION
    )
    :vars
    (
      ?auto_13013 - LOCATION
      ?auto_13014 - CITY
      ?auto_13015 - OBJ
      ?auto_13012 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13013 ?auto_13014 ) ( IN-CITY ?auto_13009 ?auto_13014 ) ( not ( = ?auto_13009 ?auto_13013 ) ) ( not ( = ?auto_13015 ?auto_13011 ) ) ( OBJ-AT ?auto_13011 ?auto_13013 ) ( not ( = ?auto_13015 ?auto_13010 ) ) ( not ( = ?auto_13011 ?auto_13010 ) ) ( OBJ-AT ?auto_13010 ?auto_13013 ) ( TRUCK-AT ?auto_13012 ?auto_13009 ) ( IN-TRUCK ?auto_13015 ?auto_13012 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13015 ?auto_13011 ?auto_13009 )
      ( DELIVER-2PKG-VERIFY ?auto_13010 ?auto_13011 ?auto_13009 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13017 - OBJ
      ?auto_13018 - OBJ
      ?auto_13016 - LOCATION
    )
    :vars
    (
      ?auto_13021 - LOCATION
      ?auto_13022 - CITY
      ?auto_13019 - OBJ
      ?auto_13020 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13021 ?auto_13022 ) ( IN-CITY ?auto_13016 ?auto_13022 ) ( not ( = ?auto_13016 ?auto_13021 ) ) ( not ( = ?auto_13018 ?auto_13017 ) ) ( OBJ-AT ?auto_13017 ?auto_13021 ) ( not ( = ?auto_13018 ?auto_13019 ) ) ( not ( = ?auto_13017 ?auto_13019 ) ) ( OBJ-AT ?auto_13019 ?auto_13021 ) ( TRUCK-AT ?auto_13020 ?auto_13016 ) ( IN-TRUCK ?auto_13018 ?auto_13020 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13018 ?auto_13017 ?auto_13016 )
      ( DELIVER-2PKG-VERIFY ?auto_13017 ?auto_13018 ?auto_13016 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13024 - OBJ
      ?auto_13025 - OBJ
      ?auto_13023 - LOCATION
    )
    :vars
    (
      ?auto_13027 - LOCATION
      ?auto_13028 - CITY
      ?auto_13029 - OBJ
      ?auto_13026 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13027 ?auto_13028 ) ( IN-CITY ?auto_13023 ?auto_13028 ) ( not ( = ?auto_13023 ?auto_13027 ) ) ( not ( = ?auto_13029 ?auto_13024 ) ) ( OBJ-AT ?auto_13024 ?auto_13027 ) ( not ( = ?auto_13029 ?auto_13025 ) ) ( not ( = ?auto_13024 ?auto_13025 ) ) ( OBJ-AT ?auto_13025 ?auto_13027 ) ( TRUCK-AT ?auto_13026 ?auto_13023 ) ( IN-TRUCK ?auto_13029 ?auto_13026 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13029 ?auto_13024 ?auto_13023 )
      ( DELIVER-2PKG-VERIFY ?auto_13024 ?auto_13025 ?auto_13023 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13047 - OBJ
      ?auto_13048 - OBJ
      ?auto_13049 - OBJ
      ?auto_13046 - LOCATION
    )
    :vars
    (
      ?auto_13051 - LOCATION
      ?auto_13052 - CITY
      ?auto_13050 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13051 ?auto_13052 ) ( IN-CITY ?auto_13046 ?auto_13052 ) ( not ( = ?auto_13046 ?auto_13051 ) ) ( not ( = ?auto_13047 ?auto_13049 ) ) ( OBJ-AT ?auto_13049 ?auto_13051 ) ( not ( = ?auto_13047 ?auto_13048 ) ) ( not ( = ?auto_13049 ?auto_13048 ) ) ( OBJ-AT ?auto_13048 ?auto_13051 ) ( TRUCK-AT ?auto_13050 ?auto_13046 ) ( IN-TRUCK ?auto_13047 ?auto_13050 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13047 ?auto_13049 ?auto_13046 )
      ( DELIVER-3PKG-VERIFY ?auto_13047 ?auto_13048 ?auto_13049 ?auto_13046 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13062 - OBJ
      ?auto_13063 - OBJ
      ?auto_13064 - OBJ
      ?auto_13061 - LOCATION
    )
    :vars
    (
      ?auto_13066 - LOCATION
      ?auto_13067 - CITY
      ?auto_13065 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13066 ?auto_13067 ) ( IN-CITY ?auto_13061 ?auto_13067 ) ( not ( = ?auto_13061 ?auto_13066 ) ) ( not ( = ?auto_13062 ?auto_13063 ) ) ( OBJ-AT ?auto_13063 ?auto_13066 ) ( not ( = ?auto_13062 ?auto_13064 ) ) ( not ( = ?auto_13063 ?auto_13064 ) ) ( OBJ-AT ?auto_13064 ?auto_13066 ) ( TRUCK-AT ?auto_13065 ?auto_13061 ) ( IN-TRUCK ?auto_13062 ?auto_13065 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13062 ?auto_13063 ?auto_13061 )
      ( DELIVER-3PKG-VERIFY ?auto_13062 ?auto_13063 ?auto_13064 ?auto_13061 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13077 - OBJ
      ?auto_13078 - OBJ
      ?auto_13079 - OBJ
      ?auto_13076 - LOCATION
    )
    :vars
    (
      ?auto_13081 - LOCATION
      ?auto_13082 - CITY
      ?auto_13080 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13081 ?auto_13082 ) ( IN-CITY ?auto_13076 ?auto_13082 ) ( not ( = ?auto_13076 ?auto_13081 ) ) ( not ( = ?auto_13078 ?auto_13079 ) ) ( OBJ-AT ?auto_13079 ?auto_13081 ) ( not ( = ?auto_13078 ?auto_13077 ) ) ( not ( = ?auto_13079 ?auto_13077 ) ) ( OBJ-AT ?auto_13077 ?auto_13081 ) ( TRUCK-AT ?auto_13080 ?auto_13076 ) ( IN-TRUCK ?auto_13078 ?auto_13080 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13078 ?auto_13079 ?auto_13076 )
      ( DELIVER-3PKG-VERIFY ?auto_13077 ?auto_13078 ?auto_13079 ?auto_13076 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13092 - OBJ
      ?auto_13093 - OBJ
      ?auto_13094 - OBJ
      ?auto_13091 - LOCATION
    )
    :vars
    (
      ?auto_13096 - LOCATION
      ?auto_13097 - CITY
      ?auto_13095 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13096 ?auto_13097 ) ( IN-CITY ?auto_13091 ?auto_13097 ) ( not ( = ?auto_13091 ?auto_13096 ) ) ( not ( = ?auto_13094 ?auto_13093 ) ) ( OBJ-AT ?auto_13093 ?auto_13096 ) ( not ( = ?auto_13094 ?auto_13092 ) ) ( not ( = ?auto_13093 ?auto_13092 ) ) ( OBJ-AT ?auto_13092 ?auto_13096 ) ( TRUCK-AT ?auto_13095 ?auto_13091 ) ( IN-TRUCK ?auto_13094 ?auto_13095 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13094 ?auto_13093 ?auto_13091 )
      ( DELIVER-3PKG-VERIFY ?auto_13092 ?auto_13093 ?auto_13094 ?auto_13091 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13123 - OBJ
      ?auto_13124 - OBJ
      ?auto_13125 - OBJ
      ?auto_13122 - LOCATION
    )
    :vars
    (
      ?auto_13127 - LOCATION
      ?auto_13128 - CITY
      ?auto_13126 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13127 ?auto_13128 ) ( IN-CITY ?auto_13122 ?auto_13128 ) ( not ( = ?auto_13122 ?auto_13127 ) ) ( not ( = ?auto_13124 ?auto_13123 ) ) ( OBJ-AT ?auto_13123 ?auto_13127 ) ( not ( = ?auto_13124 ?auto_13125 ) ) ( not ( = ?auto_13123 ?auto_13125 ) ) ( OBJ-AT ?auto_13125 ?auto_13127 ) ( TRUCK-AT ?auto_13126 ?auto_13122 ) ( IN-TRUCK ?auto_13124 ?auto_13126 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13124 ?auto_13123 ?auto_13122 )
      ( DELIVER-3PKG-VERIFY ?auto_13123 ?auto_13124 ?auto_13125 ?auto_13122 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13138 - OBJ
      ?auto_13139 - OBJ
      ?auto_13140 - OBJ
      ?auto_13137 - LOCATION
    )
    :vars
    (
      ?auto_13142 - LOCATION
      ?auto_13143 - CITY
      ?auto_13141 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13142 ?auto_13143 ) ( IN-CITY ?auto_13137 ?auto_13143 ) ( not ( = ?auto_13137 ?auto_13142 ) ) ( not ( = ?auto_13140 ?auto_13138 ) ) ( OBJ-AT ?auto_13138 ?auto_13142 ) ( not ( = ?auto_13140 ?auto_13139 ) ) ( not ( = ?auto_13138 ?auto_13139 ) ) ( OBJ-AT ?auto_13139 ?auto_13142 ) ( TRUCK-AT ?auto_13141 ?auto_13137 ) ( IN-TRUCK ?auto_13140 ?auto_13141 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13140 ?auto_13138 ?auto_13137 )
      ( DELIVER-3PKG-VERIFY ?auto_13138 ?auto_13139 ?auto_13140 ?auto_13137 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13186 - OBJ
      ?auto_13185 - LOCATION
    )
    :vars
    (
      ?auto_13189 - LOCATION
      ?auto_13190 - CITY
      ?auto_13191 - OBJ
      ?auto_13187 - OBJ
      ?auto_13188 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13189 ?auto_13190 ) ( IN-CITY ?auto_13185 ?auto_13190 ) ( not ( = ?auto_13185 ?auto_13189 ) ) ( not ( = ?auto_13191 ?auto_13186 ) ) ( OBJ-AT ?auto_13186 ?auto_13189 ) ( not ( = ?auto_13191 ?auto_13187 ) ) ( not ( = ?auto_13186 ?auto_13187 ) ) ( OBJ-AT ?auto_13187 ?auto_13189 ) ( IN-TRUCK ?auto_13191 ?auto_13188 ) ( TRUCK-AT ?auto_13188 ?auto_13189 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13188 ?auto_13189 ?auto_13185 ?auto_13190 )
      ( DELIVER-2PKG ?auto_13191 ?auto_13186 ?auto_13185 )
      ( DELIVER-1PKG-VERIFY ?auto_13186 ?auto_13185 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13193 - OBJ
      ?auto_13194 - OBJ
      ?auto_13192 - LOCATION
    )
    :vars
    (
      ?auto_13197 - LOCATION
      ?auto_13198 - CITY
      ?auto_13195 - OBJ
      ?auto_13196 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13197 ?auto_13198 ) ( IN-CITY ?auto_13192 ?auto_13198 ) ( not ( = ?auto_13192 ?auto_13197 ) ) ( not ( = ?auto_13193 ?auto_13194 ) ) ( OBJ-AT ?auto_13194 ?auto_13197 ) ( not ( = ?auto_13193 ?auto_13195 ) ) ( not ( = ?auto_13194 ?auto_13195 ) ) ( OBJ-AT ?auto_13195 ?auto_13197 ) ( IN-TRUCK ?auto_13193 ?auto_13196 ) ( TRUCK-AT ?auto_13196 ?auto_13197 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13194 ?auto_13192 )
      ( DELIVER-2PKG-VERIFY ?auto_13193 ?auto_13194 ?auto_13192 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13200 - OBJ
      ?auto_13201 - OBJ
      ?auto_13199 - LOCATION
    )
    :vars
    (
      ?auto_13202 - LOCATION
      ?auto_13203 - CITY
      ?auto_13205 - OBJ
      ?auto_13204 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13202 ?auto_13203 ) ( IN-CITY ?auto_13199 ?auto_13203 ) ( not ( = ?auto_13199 ?auto_13202 ) ) ( not ( = ?auto_13205 ?auto_13201 ) ) ( OBJ-AT ?auto_13201 ?auto_13202 ) ( not ( = ?auto_13205 ?auto_13200 ) ) ( not ( = ?auto_13201 ?auto_13200 ) ) ( OBJ-AT ?auto_13200 ?auto_13202 ) ( IN-TRUCK ?auto_13205 ?auto_13204 ) ( TRUCK-AT ?auto_13204 ?auto_13202 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13205 ?auto_13201 ?auto_13199 )
      ( DELIVER-2PKG-VERIFY ?auto_13200 ?auto_13201 ?auto_13199 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13207 - OBJ
      ?auto_13208 - OBJ
      ?auto_13206 - LOCATION
    )
    :vars
    (
      ?auto_13209 - LOCATION
      ?auto_13210 - CITY
      ?auto_13212 - OBJ
      ?auto_13211 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13209 ?auto_13210 ) ( IN-CITY ?auto_13206 ?auto_13210 ) ( not ( = ?auto_13206 ?auto_13209 ) ) ( not ( = ?auto_13208 ?auto_13207 ) ) ( OBJ-AT ?auto_13207 ?auto_13209 ) ( not ( = ?auto_13208 ?auto_13212 ) ) ( not ( = ?auto_13207 ?auto_13212 ) ) ( OBJ-AT ?auto_13212 ?auto_13209 ) ( IN-TRUCK ?auto_13208 ?auto_13211 ) ( TRUCK-AT ?auto_13211 ?auto_13209 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13208 ?auto_13207 ?auto_13206 )
      ( DELIVER-2PKG-VERIFY ?auto_13207 ?auto_13208 ?auto_13206 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13214 - OBJ
      ?auto_13215 - OBJ
      ?auto_13213 - LOCATION
    )
    :vars
    (
      ?auto_13216 - LOCATION
      ?auto_13217 - CITY
      ?auto_13219 - OBJ
      ?auto_13218 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13216 ?auto_13217 ) ( IN-CITY ?auto_13213 ?auto_13217 ) ( not ( = ?auto_13213 ?auto_13216 ) ) ( not ( = ?auto_13219 ?auto_13214 ) ) ( OBJ-AT ?auto_13214 ?auto_13216 ) ( not ( = ?auto_13219 ?auto_13215 ) ) ( not ( = ?auto_13214 ?auto_13215 ) ) ( OBJ-AT ?auto_13215 ?auto_13216 ) ( IN-TRUCK ?auto_13219 ?auto_13218 ) ( TRUCK-AT ?auto_13218 ?auto_13216 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13219 ?auto_13214 ?auto_13213 )
      ( DELIVER-2PKG-VERIFY ?auto_13214 ?auto_13215 ?auto_13213 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13237 - OBJ
      ?auto_13238 - OBJ
      ?auto_13239 - OBJ
      ?auto_13236 - LOCATION
    )
    :vars
    (
      ?auto_13240 - LOCATION
      ?auto_13241 - CITY
      ?auto_13242 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13240 ?auto_13241 ) ( IN-CITY ?auto_13236 ?auto_13241 ) ( not ( = ?auto_13236 ?auto_13240 ) ) ( not ( = ?auto_13237 ?auto_13239 ) ) ( OBJ-AT ?auto_13239 ?auto_13240 ) ( not ( = ?auto_13237 ?auto_13238 ) ) ( not ( = ?auto_13239 ?auto_13238 ) ) ( OBJ-AT ?auto_13238 ?auto_13240 ) ( IN-TRUCK ?auto_13237 ?auto_13242 ) ( TRUCK-AT ?auto_13242 ?auto_13240 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13237 ?auto_13239 ?auto_13236 )
      ( DELIVER-3PKG-VERIFY ?auto_13237 ?auto_13238 ?auto_13239 ?auto_13236 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13252 - OBJ
      ?auto_13253 - OBJ
      ?auto_13254 - OBJ
      ?auto_13251 - LOCATION
    )
    :vars
    (
      ?auto_13255 - LOCATION
      ?auto_13256 - CITY
      ?auto_13257 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13255 ?auto_13256 ) ( IN-CITY ?auto_13251 ?auto_13256 ) ( not ( = ?auto_13251 ?auto_13255 ) ) ( not ( = ?auto_13252 ?auto_13253 ) ) ( OBJ-AT ?auto_13253 ?auto_13255 ) ( not ( = ?auto_13252 ?auto_13254 ) ) ( not ( = ?auto_13253 ?auto_13254 ) ) ( OBJ-AT ?auto_13254 ?auto_13255 ) ( IN-TRUCK ?auto_13252 ?auto_13257 ) ( TRUCK-AT ?auto_13257 ?auto_13255 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13252 ?auto_13253 ?auto_13251 )
      ( DELIVER-3PKG-VERIFY ?auto_13252 ?auto_13253 ?auto_13254 ?auto_13251 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13267 - OBJ
      ?auto_13268 - OBJ
      ?auto_13269 - OBJ
      ?auto_13266 - LOCATION
    )
    :vars
    (
      ?auto_13270 - LOCATION
      ?auto_13271 - CITY
      ?auto_13272 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13270 ?auto_13271 ) ( IN-CITY ?auto_13266 ?auto_13271 ) ( not ( = ?auto_13266 ?auto_13270 ) ) ( not ( = ?auto_13268 ?auto_13269 ) ) ( OBJ-AT ?auto_13269 ?auto_13270 ) ( not ( = ?auto_13268 ?auto_13267 ) ) ( not ( = ?auto_13269 ?auto_13267 ) ) ( OBJ-AT ?auto_13267 ?auto_13270 ) ( IN-TRUCK ?auto_13268 ?auto_13272 ) ( TRUCK-AT ?auto_13272 ?auto_13270 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13268 ?auto_13269 ?auto_13266 )
      ( DELIVER-3PKG-VERIFY ?auto_13267 ?auto_13268 ?auto_13269 ?auto_13266 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13282 - OBJ
      ?auto_13283 - OBJ
      ?auto_13284 - OBJ
      ?auto_13281 - LOCATION
    )
    :vars
    (
      ?auto_13285 - LOCATION
      ?auto_13286 - CITY
      ?auto_13287 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13285 ?auto_13286 ) ( IN-CITY ?auto_13281 ?auto_13286 ) ( not ( = ?auto_13281 ?auto_13285 ) ) ( not ( = ?auto_13284 ?auto_13283 ) ) ( OBJ-AT ?auto_13283 ?auto_13285 ) ( not ( = ?auto_13284 ?auto_13282 ) ) ( not ( = ?auto_13283 ?auto_13282 ) ) ( OBJ-AT ?auto_13282 ?auto_13285 ) ( IN-TRUCK ?auto_13284 ?auto_13287 ) ( TRUCK-AT ?auto_13287 ?auto_13285 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13284 ?auto_13283 ?auto_13281 )
      ( DELIVER-3PKG-VERIFY ?auto_13282 ?auto_13283 ?auto_13284 ?auto_13281 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13313 - OBJ
      ?auto_13314 - OBJ
      ?auto_13315 - OBJ
      ?auto_13312 - LOCATION
    )
    :vars
    (
      ?auto_13316 - LOCATION
      ?auto_13317 - CITY
      ?auto_13318 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13316 ?auto_13317 ) ( IN-CITY ?auto_13312 ?auto_13317 ) ( not ( = ?auto_13312 ?auto_13316 ) ) ( not ( = ?auto_13314 ?auto_13313 ) ) ( OBJ-AT ?auto_13313 ?auto_13316 ) ( not ( = ?auto_13314 ?auto_13315 ) ) ( not ( = ?auto_13313 ?auto_13315 ) ) ( OBJ-AT ?auto_13315 ?auto_13316 ) ( IN-TRUCK ?auto_13314 ?auto_13318 ) ( TRUCK-AT ?auto_13318 ?auto_13316 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13314 ?auto_13313 ?auto_13312 )
      ( DELIVER-3PKG-VERIFY ?auto_13313 ?auto_13314 ?auto_13315 ?auto_13312 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13328 - OBJ
      ?auto_13329 - OBJ
      ?auto_13330 - OBJ
      ?auto_13327 - LOCATION
    )
    :vars
    (
      ?auto_13331 - LOCATION
      ?auto_13332 - CITY
      ?auto_13333 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13331 ?auto_13332 ) ( IN-CITY ?auto_13327 ?auto_13332 ) ( not ( = ?auto_13327 ?auto_13331 ) ) ( not ( = ?auto_13330 ?auto_13328 ) ) ( OBJ-AT ?auto_13328 ?auto_13331 ) ( not ( = ?auto_13330 ?auto_13329 ) ) ( not ( = ?auto_13328 ?auto_13329 ) ) ( OBJ-AT ?auto_13329 ?auto_13331 ) ( IN-TRUCK ?auto_13330 ?auto_13333 ) ( TRUCK-AT ?auto_13333 ?auto_13331 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13330 ?auto_13328 ?auto_13327 )
      ( DELIVER-3PKG-VERIFY ?auto_13328 ?auto_13329 ?auto_13330 ?auto_13327 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13376 - OBJ
      ?auto_13375 - LOCATION
    )
    :vars
    (
      ?auto_13377 - LOCATION
      ?auto_13378 - CITY
      ?auto_13381 - OBJ
      ?auto_13380 - OBJ
      ?auto_13379 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13377 ?auto_13378 ) ( IN-CITY ?auto_13375 ?auto_13378 ) ( not ( = ?auto_13375 ?auto_13377 ) ) ( not ( = ?auto_13381 ?auto_13376 ) ) ( OBJ-AT ?auto_13376 ?auto_13377 ) ( not ( = ?auto_13381 ?auto_13380 ) ) ( not ( = ?auto_13376 ?auto_13380 ) ) ( OBJ-AT ?auto_13380 ?auto_13377 ) ( TRUCK-AT ?auto_13379 ?auto_13377 ) ( OBJ-AT ?auto_13381 ?auto_13377 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13381 ?auto_13379 ?auto_13377 )
      ( DELIVER-2PKG ?auto_13381 ?auto_13376 ?auto_13375 )
      ( DELIVER-1PKG-VERIFY ?auto_13376 ?auto_13375 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13383 - OBJ
      ?auto_13384 - OBJ
      ?auto_13382 - LOCATION
    )
    :vars
    (
      ?auto_13388 - LOCATION
      ?auto_13387 - CITY
      ?auto_13385 - OBJ
      ?auto_13386 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13388 ?auto_13387 ) ( IN-CITY ?auto_13382 ?auto_13387 ) ( not ( = ?auto_13382 ?auto_13388 ) ) ( not ( = ?auto_13383 ?auto_13384 ) ) ( OBJ-AT ?auto_13384 ?auto_13388 ) ( not ( = ?auto_13383 ?auto_13385 ) ) ( not ( = ?auto_13384 ?auto_13385 ) ) ( OBJ-AT ?auto_13385 ?auto_13388 ) ( TRUCK-AT ?auto_13386 ?auto_13388 ) ( OBJ-AT ?auto_13383 ?auto_13388 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13384 ?auto_13382 )
      ( DELIVER-2PKG-VERIFY ?auto_13383 ?auto_13384 ?auto_13382 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13390 - OBJ
      ?auto_13391 - OBJ
      ?auto_13389 - LOCATION
    )
    :vars
    (
      ?auto_13392 - LOCATION
      ?auto_13393 - CITY
      ?auto_13395 - OBJ
      ?auto_13394 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13392 ?auto_13393 ) ( IN-CITY ?auto_13389 ?auto_13393 ) ( not ( = ?auto_13389 ?auto_13392 ) ) ( not ( = ?auto_13395 ?auto_13391 ) ) ( OBJ-AT ?auto_13391 ?auto_13392 ) ( not ( = ?auto_13395 ?auto_13390 ) ) ( not ( = ?auto_13391 ?auto_13390 ) ) ( OBJ-AT ?auto_13390 ?auto_13392 ) ( TRUCK-AT ?auto_13394 ?auto_13392 ) ( OBJ-AT ?auto_13395 ?auto_13392 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13395 ?auto_13391 ?auto_13389 )
      ( DELIVER-2PKG-VERIFY ?auto_13390 ?auto_13391 ?auto_13389 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13397 - OBJ
      ?auto_13398 - OBJ
      ?auto_13396 - LOCATION
    )
    :vars
    (
      ?auto_13399 - LOCATION
      ?auto_13400 - CITY
      ?auto_13402 - OBJ
      ?auto_13401 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13399 ?auto_13400 ) ( IN-CITY ?auto_13396 ?auto_13400 ) ( not ( = ?auto_13396 ?auto_13399 ) ) ( not ( = ?auto_13398 ?auto_13397 ) ) ( OBJ-AT ?auto_13397 ?auto_13399 ) ( not ( = ?auto_13398 ?auto_13402 ) ) ( not ( = ?auto_13397 ?auto_13402 ) ) ( OBJ-AT ?auto_13402 ?auto_13399 ) ( TRUCK-AT ?auto_13401 ?auto_13399 ) ( OBJ-AT ?auto_13398 ?auto_13399 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13398 ?auto_13397 ?auto_13396 )
      ( DELIVER-2PKG-VERIFY ?auto_13397 ?auto_13398 ?auto_13396 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13404 - OBJ
      ?auto_13405 - OBJ
      ?auto_13403 - LOCATION
    )
    :vars
    (
      ?auto_13406 - LOCATION
      ?auto_13407 - CITY
      ?auto_13409 - OBJ
      ?auto_13408 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13406 ?auto_13407 ) ( IN-CITY ?auto_13403 ?auto_13407 ) ( not ( = ?auto_13403 ?auto_13406 ) ) ( not ( = ?auto_13409 ?auto_13404 ) ) ( OBJ-AT ?auto_13404 ?auto_13406 ) ( not ( = ?auto_13409 ?auto_13405 ) ) ( not ( = ?auto_13404 ?auto_13405 ) ) ( OBJ-AT ?auto_13405 ?auto_13406 ) ( TRUCK-AT ?auto_13408 ?auto_13406 ) ( OBJ-AT ?auto_13409 ?auto_13406 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13409 ?auto_13404 ?auto_13403 )
      ( DELIVER-2PKG-VERIFY ?auto_13404 ?auto_13405 ?auto_13403 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13427 - OBJ
      ?auto_13428 - OBJ
      ?auto_13429 - OBJ
      ?auto_13426 - LOCATION
    )
    :vars
    (
      ?auto_13430 - LOCATION
      ?auto_13431 - CITY
      ?auto_13432 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13430 ?auto_13431 ) ( IN-CITY ?auto_13426 ?auto_13431 ) ( not ( = ?auto_13426 ?auto_13430 ) ) ( not ( = ?auto_13427 ?auto_13429 ) ) ( OBJ-AT ?auto_13429 ?auto_13430 ) ( not ( = ?auto_13427 ?auto_13428 ) ) ( not ( = ?auto_13429 ?auto_13428 ) ) ( OBJ-AT ?auto_13428 ?auto_13430 ) ( TRUCK-AT ?auto_13432 ?auto_13430 ) ( OBJ-AT ?auto_13427 ?auto_13430 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13427 ?auto_13429 ?auto_13426 )
      ( DELIVER-3PKG-VERIFY ?auto_13427 ?auto_13428 ?auto_13429 ?auto_13426 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13442 - OBJ
      ?auto_13443 - OBJ
      ?auto_13444 - OBJ
      ?auto_13441 - LOCATION
    )
    :vars
    (
      ?auto_13445 - LOCATION
      ?auto_13446 - CITY
      ?auto_13447 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13445 ?auto_13446 ) ( IN-CITY ?auto_13441 ?auto_13446 ) ( not ( = ?auto_13441 ?auto_13445 ) ) ( not ( = ?auto_13442 ?auto_13443 ) ) ( OBJ-AT ?auto_13443 ?auto_13445 ) ( not ( = ?auto_13442 ?auto_13444 ) ) ( not ( = ?auto_13443 ?auto_13444 ) ) ( OBJ-AT ?auto_13444 ?auto_13445 ) ( TRUCK-AT ?auto_13447 ?auto_13445 ) ( OBJ-AT ?auto_13442 ?auto_13445 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13442 ?auto_13443 ?auto_13441 )
      ( DELIVER-3PKG-VERIFY ?auto_13442 ?auto_13443 ?auto_13444 ?auto_13441 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13457 - OBJ
      ?auto_13458 - OBJ
      ?auto_13459 - OBJ
      ?auto_13456 - LOCATION
    )
    :vars
    (
      ?auto_13460 - LOCATION
      ?auto_13461 - CITY
      ?auto_13462 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13460 ?auto_13461 ) ( IN-CITY ?auto_13456 ?auto_13461 ) ( not ( = ?auto_13456 ?auto_13460 ) ) ( not ( = ?auto_13458 ?auto_13459 ) ) ( OBJ-AT ?auto_13459 ?auto_13460 ) ( not ( = ?auto_13458 ?auto_13457 ) ) ( not ( = ?auto_13459 ?auto_13457 ) ) ( OBJ-AT ?auto_13457 ?auto_13460 ) ( TRUCK-AT ?auto_13462 ?auto_13460 ) ( OBJ-AT ?auto_13458 ?auto_13460 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13458 ?auto_13459 ?auto_13456 )
      ( DELIVER-3PKG-VERIFY ?auto_13457 ?auto_13458 ?auto_13459 ?auto_13456 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13472 - OBJ
      ?auto_13473 - OBJ
      ?auto_13474 - OBJ
      ?auto_13471 - LOCATION
    )
    :vars
    (
      ?auto_13475 - LOCATION
      ?auto_13476 - CITY
      ?auto_13477 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13475 ?auto_13476 ) ( IN-CITY ?auto_13471 ?auto_13476 ) ( not ( = ?auto_13471 ?auto_13475 ) ) ( not ( = ?auto_13474 ?auto_13473 ) ) ( OBJ-AT ?auto_13473 ?auto_13475 ) ( not ( = ?auto_13474 ?auto_13472 ) ) ( not ( = ?auto_13473 ?auto_13472 ) ) ( OBJ-AT ?auto_13472 ?auto_13475 ) ( TRUCK-AT ?auto_13477 ?auto_13475 ) ( OBJ-AT ?auto_13474 ?auto_13475 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13474 ?auto_13473 ?auto_13471 )
      ( DELIVER-3PKG-VERIFY ?auto_13472 ?auto_13473 ?auto_13474 ?auto_13471 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13503 - OBJ
      ?auto_13504 - OBJ
      ?auto_13505 - OBJ
      ?auto_13502 - LOCATION
    )
    :vars
    (
      ?auto_13506 - LOCATION
      ?auto_13507 - CITY
      ?auto_13508 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13506 ?auto_13507 ) ( IN-CITY ?auto_13502 ?auto_13507 ) ( not ( = ?auto_13502 ?auto_13506 ) ) ( not ( = ?auto_13504 ?auto_13503 ) ) ( OBJ-AT ?auto_13503 ?auto_13506 ) ( not ( = ?auto_13504 ?auto_13505 ) ) ( not ( = ?auto_13503 ?auto_13505 ) ) ( OBJ-AT ?auto_13505 ?auto_13506 ) ( TRUCK-AT ?auto_13508 ?auto_13506 ) ( OBJ-AT ?auto_13504 ?auto_13506 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13504 ?auto_13503 ?auto_13502 )
      ( DELIVER-3PKG-VERIFY ?auto_13503 ?auto_13504 ?auto_13505 ?auto_13502 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13518 - OBJ
      ?auto_13519 - OBJ
      ?auto_13520 - OBJ
      ?auto_13517 - LOCATION
    )
    :vars
    (
      ?auto_13521 - LOCATION
      ?auto_13522 - CITY
      ?auto_13523 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13521 ?auto_13522 ) ( IN-CITY ?auto_13517 ?auto_13522 ) ( not ( = ?auto_13517 ?auto_13521 ) ) ( not ( = ?auto_13520 ?auto_13518 ) ) ( OBJ-AT ?auto_13518 ?auto_13521 ) ( not ( = ?auto_13520 ?auto_13519 ) ) ( not ( = ?auto_13518 ?auto_13519 ) ) ( OBJ-AT ?auto_13519 ?auto_13521 ) ( TRUCK-AT ?auto_13523 ?auto_13521 ) ( OBJ-AT ?auto_13520 ?auto_13521 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13520 ?auto_13518 ?auto_13517 )
      ( DELIVER-3PKG-VERIFY ?auto_13518 ?auto_13519 ?auto_13520 ?auto_13517 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13566 - OBJ
      ?auto_13565 - LOCATION
    )
    :vars
    (
      ?auto_13567 - LOCATION
      ?auto_13568 - CITY
      ?auto_13571 - OBJ
      ?auto_13570 - OBJ
      ?auto_13569 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13567 ?auto_13568 ) ( IN-CITY ?auto_13565 ?auto_13568 ) ( not ( = ?auto_13565 ?auto_13567 ) ) ( not ( = ?auto_13571 ?auto_13566 ) ) ( OBJ-AT ?auto_13566 ?auto_13567 ) ( not ( = ?auto_13571 ?auto_13570 ) ) ( not ( = ?auto_13566 ?auto_13570 ) ) ( OBJ-AT ?auto_13570 ?auto_13567 ) ( OBJ-AT ?auto_13571 ?auto_13567 ) ( TRUCK-AT ?auto_13569 ?auto_13565 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13569 ?auto_13565 ?auto_13567 ?auto_13568 )
      ( DELIVER-2PKG ?auto_13571 ?auto_13566 ?auto_13565 )
      ( DELIVER-1PKG-VERIFY ?auto_13566 ?auto_13565 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13573 - OBJ
      ?auto_13574 - OBJ
      ?auto_13572 - LOCATION
    )
    :vars
    (
      ?auto_13578 - LOCATION
      ?auto_13575 - CITY
      ?auto_13576 - OBJ
      ?auto_13577 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13578 ?auto_13575 ) ( IN-CITY ?auto_13572 ?auto_13575 ) ( not ( = ?auto_13572 ?auto_13578 ) ) ( not ( = ?auto_13573 ?auto_13574 ) ) ( OBJ-AT ?auto_13574 ?auto_13578 ) ( not ( = ?auto_13573 ?auto_13576 ) ) ( not ( = ?auto_13574 ?auto_13576 ) ) ( OBJ-AT ?auto_13576 ?auto_13578 ) ( OBJ-AT ?auto_13573 ?auto_13578 ) ( TRUCK-AT ?auto_13577 ?auto_13572 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13574 ?auto_13572 )
      ( DELIVER-2PKG-VERIFY ?auto_13573 ?auto_13574 ?auto_13572 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13580 - OBJ
      ?auto_13581 - OBJ
      ?auto_13579 - LOCATION
    )
    :vars
    (
      ?auto_13583 - LOCATION
      ?auto_13584 - CITY
      ?auto_13585 - OBJ
      ?auto_13582 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13583 ?auto_13584 ) ( IN-CITY ?auto_13579 ?auto_13584 ) ( not ( = ?auto_13579 ?auto_13583 ) ) ( not ( = ?auto_13585 ?auto_13581 ) ) ( OBJ-AT ?auto_13581 ?auto_13583 ) ( not ( = ?auto_13585 ?auto_13580 ) ) ( not ( = ?auto_13581 ?auto_13580 ) ) ( OBJ-AT ?auto_13580 ?auto_13583 ) ( OBJ-AT ?auto_13585 ?auto_13583 ) ( TRUCK-AT ?auto_13582 ?auto_13579 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13585 ?auto_13581 ?auto_13579 )
      ( DELIVER-2PKG-VERIFY ?auto_13580 ?auto_13581 ?auto_13579 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13587 - OBJ
      ?auto_13588 - OBJ
      ?auto_13586 - LOCATION
    )
    :vars
    (
      ?auto_13590 - LOCATION
      ?auto_13591 - CITY
      ?auto_13592 - OBJ
      ?auto_13589 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13590 ?auto_13591 ) ( IN-CITY ?auto_13586 ?auto_13591 ) ( not ( = ?auto_13586 ?auto_13590 ) ) ( not ( = ?auto_13588 ?auto_13587 ) ) ( OBJ-AT ?auto_13587 ?auto_13590 ) ( not ( = ?auto_13588 ?auto_13592 ) ) ( not ( = ?auto_13587 ?auto_13592 ) ) ( OBJ-AT ?auto_13592 ?auto_13590 ) ( OBJ-AT ?auto_13588 ?auto_13590 ) ( TRUCK-AT ?auto_13589 ?auto_13586 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13588 ?auto_13587 ?auto_13586 )
      ( DELIVER-2PKG-VERIFY ?auto_13587 ?auto_13588 ?auto_13586 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13594 - OBJ
      ?auto_13595 - OBJ
      ?auto_13593 - LOCATION
    )
    :vars
    (
      ?auto_13597 - LOCATION
      ?auto_13598 - CITY
      ?auto_13599 - OBJ
      ?auto_13596 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13597 ?auto_13598 ) ( IN-CITY ?auto_13593 ?auto_13598 ) ( not ( = ?auto_13593 ?auto_13597 ) ) ( not ( = ?auto_13599 ?auto_13594 ) ) ( OBJ-AT ?auto_13594 ?auto_13597 ) ( not ( = ?auto_13599 ?auto_13595 ) ) ( not ( = ?auto_13594 ?auto_13595 ) ) ( OBJ-AT ?auto_13595 ?auto_13597 ) ( OBJ-AT ?auto_13599 ?auto_13597 ) ( TRUCK-AT ?auto_13596 ?auto_13593 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13599 ?auto_13594 ?auto_13593 )
      ( DELIVER-2PKG-VERIFY ?auto_13594 ?auto_13595 ?auto_13593 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13617 - OBJ
      ?auto_13618 - OBJ
      ?auto_13619 - OBJ
      ?auto_13616 - LOCATION
    )
    :vars
    (
      ?auto_13621 - LOCATION
      ?auto_13622 - CITY
      ?auto_13620 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13621 ?auto_13622 ) ( IN-CITY ?auto_13616 ?auto_13622 ) ( not ( = ?auto_13616 ?auto_13621 ) ) ( not ( = ?auto_13617 ?auto_13619 ) ) ( OBJ-AT ?auto_13619 ?auto_13621 ) ( not ( = ?auto_13617 ?auto_13618 ) ) ( not ( = ?auto_13619 ?auto_13618 ) ) ( OBJ-AT ?auto_13618 ?auto_13621 ) ( OBJ-AT ?auto_13617 ?auto_13621 ) ( TRUCK-AT ?auto_13620 ?auto_13616 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13617 ?auto_13619 ?auto_13616 )
      ( DELIVER-3PKG-VERIFY ?auto_13617 ?auto_13618 ?auto_13619 ?auto_13616 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13632 - OBJ
      ?auto_13633 - OBJ
      ?auto_13634 - OBJ
      ?auto_13631 - LOCATION
    )
    :vars
    (
      ?auto_13636 - LOCATION
      ?auto_13637 - CITY
      ?auto_13635 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13636 ?auto_13637 ) ( IN-CITY ?auto_13631 ?auto_13637 ) ( not ( = ?auto_13631 ?auto_13636 ) ) ( not ( = ?auto_13632 ?auto_13633 ) ) ( OBJ-AT ?auto_13633 ?auto_13636 ) ( not ( = ?auto_13632 ?auto_13634 ) ) ( not ( = ?auto_13633 ?auto_13634 ) ) ( OBJ-AT ?auto_13634 ?auto_13636 ) ( OBJ-AT ?auto_13632 ?auto_13636 ) ( TRUCK-AT ?auto_13635 ?auto_13631 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13632 ?auto_13633 ?auto_13631 )
      ( DELIVER-3PKG-VERIFY ?auto_13632 ?auto_13633 ?auto_13634 ?auto_13631 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13647 - OBJ
      ?auto_13648 - OBJ
      ?auto_13649 - OBJ
      ?auto_13646 - LOCATION
    )
    :vars
    (
      ?auto_13651 - LOCATION
      ?auto_13652 - CITY
      ?auto_13650 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13651 ?auto_13652 ) ( IN-CITY ?auto_13646 ?auto_13652 ) ( not ( = ?auto_13646 ?auto_13651 ) ) ( not ( = ?auto_13648 ?auto_13649 ) ) ( OBJ-AT ?auto_13649 ?auto_13651 ) ( not ( = ?auto_13648 ?auto_13647 ) ) ( not ( = ?auto_13649 ?auto_13647 ) ) ( OBJ-AT ?auto_13647 ?auto_13651 ) ( OBJ-AT ?auto_13648 ?auto_13651 ) ( TRUCK-AT ?auto_13650 ?auto_13646 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13648 ?auto_13649 ?auto_13646 )
      ( DELIVER-3PKG-VERIFY ?auto_13647 ?auto_13648 ?auto_13649 ?auto_13646 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13662 - OBJ
      ?auto_13663 - OBJ
      ?auto_13664 - OBJ
      ?auto_13661 - LOCATION
    )
    :vars
    (
      ?auto_13666 - LOCATION
      ?auto_13667 - CITY
      ?auto_13665 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13666 ?auto_13667 ) ( IN-CITY ?auto_13661 ?auto_13667 ) ( not ( = ?auto_13661 ?auto_13666 ) ) ( not ( = ?auto_13664 ?auto_13663 ) ) ( OBJ-AT ?auto_13663 ?auto_13666 ) ( not ( = ?auto_13664 ?auto_13662 ) ) ( not ( = ?auto_13663 ?auto_13662 ) ) ( OBJ-AT ?auto_13662 ?auto_13666 ) ( OBJ-AT ?auto_13664 ?auto_13666 ) ( TRUCK-AT ?auto_13665 ?auto_13661 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13664 ?auto_13663 ?auto_13661 )
      ( DELIVER-3PKG-VERIFY ?auto_13662 ?auto_13663 ?auto_13664 ?auto_13661 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13693 - OBJ
      ?auto_13694 - OBJ
      ?auto_13695 - OBJ
      ?auto_13692 - LOCATION
    )
    :vars
    (
      ?auto_13697 - LOCATION
      ?auto_13698 - CITY
      ?auto_13696 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13697 ?auto_13698 ) ( IN-CITY ?auto_13692 ?auto_13698 ) ( not ( = ?auto_13692 ?auto_13697 ) ) ( not ( = ?auto_13694 ?auto_13693 ) ) ( OBJ-AT ?auto_13693 ?auto_13697 ) ( not ( = ?auto_13694 ?auto_13695 ) ) ( not ( = ?auto_13693 ?auto_13695 ) ) ( OBJ-AT ?auto_13695 ?auto_13697 ) ( OBJ-AT ?auto_13694 ?auto_13697 ) ( TRUCK-AT ?auto_13696 ?auto_13692 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13694 ?auto_13693 ?auto_13692 )
      ( DELIVER-3PKG-VERIFY ?auto_13693 ?auto_13694 ?auto_13695 ?auto_13692 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13708 - OBJ
      ?auto_13709 - OBJ
      ?auto_13710 - OBJ
      ?auto_13707 - LOCATION
    )
    :vars
    (
      ?auto_13712 - LOCATION
      ?auto_13713 - CITY
      ?auto_13711 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13712 ?auto_13713 ) ( IN-CITY ?auto_13707 ?auto_13713 ) ( not ( = ?auto_13707 ?auto_13712 ) ) ( not ( = ?auto_13710 ?auto_13708 ) ) ( OBJ-AT ?auto_13708 ?auto_13712 ) ( not ( = ?auto_13710 ?auto_13709 ) ) ( not ( = ?auto_13708 ?auto_13709 ) ) ( OBJ-AT ?auto_13709 ?auto_13712 ) ( OBJ-AT ?auto_13710 ?auto_13712 ) ( TRUCK-AT ?auto_13711 ?auto_13707 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13710 ?auto_13708 ?auto_13707 )
      ( DELIVER-3PKG-VERIFY ?auto_13708 ?auto_13709 ?auto_13710 ?auto_13707 ) )
  )

)

