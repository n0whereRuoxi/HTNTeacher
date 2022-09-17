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
      ?auto_13765 - OBJ
      ?auto_13764 - LOCATION
    )
    :vars
    (
      ?auto_13766 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13766 ?auto_13764 ) ( IN-TRUCK ?auto_13765 ?auto_13766 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_13765 ?auto_13766 ?auto_13764 )
      ( DELIVER-1PKG-VERIFY ?auto_13765 ?auto_13764 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13777 - OBJ
      ?auto_13776 - LOCATION
    )
    :vars
    (
      ?auto_13778 - TRUCK
      ?auto_13779 - LOCATION
      ?auto_13780 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13777 ?auto_13778 ) ( TRUCK-AT ?auto_13778 ?auto_13779 ) ( IN-CITY ?auto_13779 ?auto_13780 ) ( IN-CITY ?auto_13776 ?auto_13780 ) ( not ( = ?auto_13776 ?auto_13779 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13778 ?auto_13779 ?auto_13776 ?auto_13780 )
      ( DELIVER-1PKG ?auto_13777 ?auto_13776 )
      ( DELIVER-1PKG-VERIFY ?auto_13777 ?auto_13776 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13795 - OBJ
      ?auto_13794 - LOCATION
    )
    :vars
    (
      ?auto_13798 - TRUCK
      ?auto_13797 - LOCATION
      ?auto_13796 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13798 ?auto_13797 ) ( IN-CITY ?auto_13797 ?auto_13796 ) ( IN-CITY ?auto_13794 ?auto_13796 ) ( not ( = ?auto_13794 ?auto_13797 ) ) ( OBJ-AT ?auto_13795 ?auto_13797 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13795 ?auto_13798 ?auto_13797 )
      ( DELIVER-1PKG ?auto_13795 ?auto_13794 )
      ( DELIVER-1PKG-VERIFY ?auto_13795 ?auto_13794 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13813 - OBJ
      ?auto_13812 - LOCATION
    )
    :vars
    (
      ?auto_13816 - LOCATION
      ?auto_13815 - CITY
      ?auto_13814 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13816 ?auto_13815 ) ( IN-CITY ?auto_13812 ?auto_13815 ) ( not ( = ?auto_13812 ?auto_13816 ) ) ( OBJ-AT ?auto_13813 ?auto_13816 ) ( TRUCK-AT ?auto_13814 ?auto_13812 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13814 ?auto_13812 ?auto_13816 ?auto_13815 )
      ( DELIVER-1PKG ?auto_13813 ?auto_13812 )
      ( DELIVER-1PKG-VERIFY ?auto_13813 ?auto_13812 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13870 - OBJ
      ?auto_13869 - LOCATION
    )
    :vars
    (
      ?auto_13871 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13871 ?auto_13869 ) ( IN-TRUCK ?auto_13870 ?auto_13871 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_13870 ?auto_13871 ?auto_13869 )
      ( DELIVER-1PKG-VERIFY ?auto_13870 ?auto_13869 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13873 - OBJ
      ?auto_13874 - OBJ
      ?auto_13872 - LOCATION
    )
    :vars
    (
      ?auto_13875 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13874 ?auto_13873 ) ) ( TRUCK-AT ?auto_13875 ?auto_13872 ) ( IN-TRUCK ?auto_13874 ?auto_13875 ) ( OBJ-AT ?auto_13873 ?auto_13872 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13874 ?auto_13872 )
      ( DELIVER-2PKG-VERIFY ?auto_13873 ?auto_13874 ?auto_13872 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13877 - OBJ
      ?auto_13878 - OBJ
      ?auto_13876 - LOCATION
    )
    :vars
    (
      ?auto_13879 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13878 ?auto_13877 ) ) ( TRUCK-AT ?auto_13879 ?auto_13876 ) ( IN-TRUCK ?auto_13877 ?auto_13879 ) ( OBJ-AT ?auto_13878 ?auto_13876 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13877 ?auto_13876 )
      ( DELIVER-2PKG-VERIFY ?auto_13877 ?auto_13878 ?auto_13876 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13920 - OBJ
      ?auto_13919 - LOCATION
    )
    :vars
    (
      ?auto_13921 - TRUCK
      ?auto_13922 - LOCATION
      ?auto_13923 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13920 ?auto_13921 ) ( TRUCK-AT ?auto_13921 ?auto_13922 ) ( IN-CITY ?auto_13922 ?auto_13923 ) ( IN-CITY ?auto_13919 ?auto_13923 ) ( not ( = ?auto_13919 ?auto_13922 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13921 ?auto_13922 ?auto_13919 ?auto_13923 )
      ( DELIVER-1PKG ?auto_13920 ?auto_13919 )
      ( DELIVER-1PKG-VERIFY ?auto_13920 ?auto_13919 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13925 - OBJ
      ?auto_13926 - OBJ
      ?auto_13924 - LOCATION
    )
    :vars
    (
      ?auto_13929 - TRUCK
      ?auto_13928 - LOCATION
      ?auto_13927 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_13926 ?auto_13925 ) ) ( IN-TRUCK ?auto_13926 ?auto_13929 ) ( TRUCK-AT ?auto_13929 ?auto_13928 ) ( IN-CITY ?auto_13928 ?auto_13927 ) ( IN-CITY ?auto_13924 ?auto_13927 ) ( not ( = ?auto_13924 ?auto_13928 ) ) ( OBJ-AT ?auto_13925 ?auto_13924 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13926 ?auto_13924 )
      ( DELIVER-2PKG-VERIFY ?auto_13925 ?auto_13926 ?auto_13924 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13931 - OBJ
      ?auto_13932 - OBJ
      ?auto_13930 - LOCATION
    )
    :vars
    (
      ?auto_13935 - TRUCK
      ?auto_13934 - LOCATION
      ?auto_13933 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_13932 ?auto_13931 ) ) ( IN-TRUCK ?auto_13931 ?auto_13935 ) ( TRUCK-AT ?auto_13935 ?auto_13934 ) ( IN-CITY ?auto_13934 ?auto_13933 ) ( IN-CITY ?auto_13930 ?auto_13933 ) ( not ( = ?auto_13930 ?auto_13934 ) ) ( OBJ-AT ?auto_13932 ?auto_13930 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13932 ?auto_13931 ?auto_13930 )
      ( DELIVER-2PKG-VERIFY ?auto_13931 ?auto_13932 ?auto_13930 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13994 - OBJ
      ?auto_13993 - LOCATION
    )
    :vars
    (
      ?auto_13995 - OBJ
      ?auto_13998 - TRUCK
      ?auto_13997 - LOCATION
      ?auto_13996 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_13994 ?auto_13995 ) ) ( TRUCK-AT ?auto_13998 ?auto_13997 ) ( IN-CITY ?auto_13997 ?auto_13996 ) ( IN-CITY ?auto_13993 ?auto_13996 ) ( not ( = ?auto_13993 ?auto_13997 ) ) ( OBJ-AT ?auto_13995 ?auto_13993 ) ( OBJ-AT ?auto_13994 ?auto_13997 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13994 ?auto_13998 ?auto_13997 )
      ( DELIVER-2PKG ?auto_13995 ?auto_13994 ?auto_13993 )
      ( DELIVER-1PKG-VERIFY ?auto_13994 ?auto_13993 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14000 - OBJ
      ?auto_14001 - OBJ
      ?auto_13999 - LOCATION
    )
    :vars
    (
      ?auto_14004 - TRUCK
      ?auto_14002 - LOCATION
      ?auto_14003 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14001 ?auto_14000 ) ) ( TRUCK-AT ?auto_14004 ?auto_14002 ) ( IN-CITY ?auto_14002 ?auto_14003 ) ( IN-CITY ?auto_13999 ?auto_14003 ) ( not ( = ?auto_13999 ?auto_14002 ) ) ( OBJ-AT ?auto_14000 ?auto_13999 ) ( OBJ-AT ?auto_14001 ?auto_14002 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14001 ?auto_13999 )
      ( DELIVER-2PKG-VERIFY ?auto_14000 ?auto_14001 ?auto_13999 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14006 - OBJ
      ?auto_14007 - OBJ
      ?auto_14005 - LOCATION
    )
    :vars
    (
      ?auto_14009 - TRUCK
      ?auto_14010 - LOCATION
      ?auto_14008 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14007 ?auto_14006 ) ) ( TRUCK-AT ?auto_14009 ?auto_14010 ) ( IN-CITY ?auto_14010 ?auto_14008 ) ( IN-CITY ?auto_14005 ?auto_14008 ) ( not ( = ?auto_14005 ?auto_14010 ) ) ( OBJ-AT ?auto_14007 ?auto_14005 ) ( OBJ-AT ?auto_14006 ?auto_14010 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14007 ?auto_14006 ?auto_14005 )
      ( DELIVER-2PKG-VERIFY ?auto_14006 ?auto_14007 ?auto_14005 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14069 - OBJ
      ?auto_14068 - LOCATION
    )
    :vars
    (
      ?auto_14072 - OBJ
      ?auto_14073 - LOCATION
      ?auto_14070 - CITY
      ?auto_14071 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_14069 ?auto_14072 ) ) ( IN-CITY ?auto_14073 ?auto_14070 ) ( IN-CITY ?auto_14068 ?auto_14070 ) ( not ( = ?auto_14068 ?auto_14073 ) ) ( OBJ-AT ?auto_14072 ?auto_14068 ) ( OBJ-AT ?auto_14069 ?auto_14073 ) ( TRUCK-AT ?auto_14071 ?auto_14068 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14071 ?auto_14068 ?auto_14073 ?auto_14070 )
      ( DELIVER-2PKG ?auto_14072 ?auto_14069 ?auto_14068 )
      ( DELIVER-1PKG-VERIFY ?auto_14069 ?auto_14068 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14075 - OBJ
      ?auto_14076 - OBJ
      ?auto_14074 - LOCATION
    )
    :vars
    (
      ?auto_14079 - LOCATION
      ?auto_14077 - CITY
      ?auto_14078 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_14076 ?auto_14075 ) ) ( IN-CITY ?auto_14079 ?auto_14077 ) ( IN-CITY ?auto_14074 ?auto_14077 ) ( not ( = ?auto_14074 ?auto_14079 ) ) ( OBJ-AT ?auto_14075 ?auto_14074 ) ( OBJ-AT ?auto_14076 ?auto_14079 ) ( TRUCK-AT ?auto_14078 ?auto_14074 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14076 ?auto_14074 )
      ( DELIVER-2PKG-VERIFY ?auto_14075 ?auto_14076 ?auto_14074 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14081 - OBJ
      ?auto_14082 - OBJ
      ?auto_14080 - LOCATION
    )
    :vars
    (
      ?auto_14084 - LOCATION
      ?auto_14083 - CITY
      ?auto_14085 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_14082 ?auto_14081 ) ) ( IN-CITY ?auto_14084 ?auto_14083 ) ( IN-CITY ?auto_14080 ?auto_14083 ) ( not ( = ?auto_14080 ?auto_14084 ) ) ( OBJ-AT ?auto_14082 ?auto_14080 ) ( OBJ-AT ?auto_14081 ?auto_14084 ) ( TRUCK-AT ?auto_14085 ?auto_14080 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14082 ?auto_14081 ?auto_14080 )
      ( DELIVER-2PKG-VERIFY ?auto_14081 ?auto_14082 ?auto_14080 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14144 - OBJ
      ?auto_14143 - LOCATION
    )
    :vars
    (
      ?auto_14148 - OBJ
      ?auto_14146 - LOCATION
      ?auto_14145 - CITY
      ?auto_14147 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_14144 ?auto_14148 ) ) ( IN-CITY ?auto_14146 ?auto_14145 ) ( IN-CITY ?auto_14143 ?auto_14145 ) ( not ( = ?auto_14143 ?auto_14146 ) ) ( OBJ-AT ?auto_14144 ?auto_14146 ) ( TRUCK-AT ?auto_14147 ?auto_14143 ) ( IN-TRUCK ?auto_14148 ?auto_14147 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14148 ?auto_14143 )
      ( DELIVER-2PKG ?auto_14148 ?auto_14144 ?auto_14143 )
      ( DELIVER-1PKG-VERIFY ?auto_14144 ?auto_14143 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14150 - OBJ
      ?auto_14151 - OBJ
      ?auto_14149 - LOCATION
    )
    :vars
    (
      ?auto_14152 - LOCATION
      ?auto_14154 - CITY
      ?auto_14153 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_14151 ?auto_14150 ) ) ( IN-CITY ?auto_14152 ?auto_14154 ) ( IN-CITY ?auto_14149 ?auto_14154 ) ( not ( = ?auto_14149 ?auto_14152 ) ) ( OBJ-AT ?auto_14151 ?auto_14152 ) ( TRUCK-AT ?auto_14153 ?auto_14149 ) ( IN-TRUCK ?auto_14150 ?auto_14153 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14151 ?auto_14149 )
      ( DELIVER-2PKG-VERIFY ?auto_14150 ?auto_14151 ?auto_14149 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14156 - OBJ
      ?auto_14157 - OBJ
      ?auto_14155 - LOCATION
    )
    :vars
    (
      ?auto_14158 - LOCATION
      ?auto_14160 - CITY
      ?auto_14159 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_14157 ?auto_14156 ) ) ( IN-CITY ?auto_14158 ?auto_14160 ) ( IN-CITY ?auto_14155 ?auto_14160 ) ( not ( = ?auto_14155 ?auto_14158 ) ) ( OBJ-AT ?auto_14156 ?auto_14158 ) ( TRUCK-AT ?auto_14159 ?auto_14155 ) ( IN-TRUCK ?auto_14157 ?auto_14159 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14157 ?auto_14156 ?auto_14155 )
      ( DELIVER-2PKG-VERIFY ?auto_14156 ?auto_14157 ?auto_14155 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14219 - OBJ
      ?auto_14218 - LOCATION
    )
    :vars
    (
      ?auto_14221 - OBJ
      ?auto_14220 - LOCATION
      ?auto_14223 - CITY
      ?auto_14222 - TRUCK
      ?auto_14224 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_14219 ?auto_14221 ) ) ( IN-CITY ?auto_14220 ?auto_14223 ) ( IN-CITY ?auto_14218 ?auto_14223 ) ( not ( = ?auto_14218 ?auto_14220 ) ) ( OBJ-AT ?auto_14219 ?auto_14220 ) ( IN-TRUCK ?auto_14221 ?auto_14222 ) ( TRUCK-AT ?auto_14222 ?auto_14224 ) ( IN-CITY ?auto_14224 ?auto_14223 ) ( not ( = ?auto_14218 ?auto_14224 ) ) ( not ( = ?auto_14220 ?auto_14224 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14222 ?auto_14224 ?auto_14218 ?auto_14223 )
      ( DELIVER-2PKG ?auto_14221 ?auto_14219 ?auto_14218 )
      ( DELIVER-1PKG-VERIFY ?auto_14219 ?auto_14218 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14226 - OBJ
      ?auto_14227 - OBJ
      ?auto_14225 - LOCATION
    )
    :vars
    (
      ?auto_14230 - LOCATION
      ?auto_14231 - CITY
      ?auto_14229 - TRUCK
      ?auto_14228 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_14227 ?auto_14226 ) ) ( IN-CITY ?auto_14230 ?auto_14231 ) ( IN-CITY ?auto_14225 ?auto_14231 ) ( not ( = ?auto_14225 ?auto_14230 ) ) ( OBJ-AT ?auto_14227 ?auto_14230 ) ( IN-TRUCK ?auto_14226 ?auto_14229 ) ( TRUCK-AT ?auto_14229 ?auto_14228 ) ( IN-CITY ?auto_14228 ?auto_14231 ) ( not ( = ?auto_14225 ?auto_14228 ) ) ( not ( = ?auto_14230 ?auto_14228 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14227 ?auto_14225 )
      ( DELIVER-2PKG-VERIFY ?auto_14226 ?auto_14227 ?auto_14225 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14233 - OBJ
      ?auto_14234 - OBJ
      ?auto_14232 - LOCATION
    )
    :vars
    (
      ?auto_14236 - LOCATION
      ?auto_14238 - CITY
      ?auto_14235 - TRUCK
      ?auto_14237 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_14234 ?auto_14233 ) ) ( IN-CITY ?auto_14236 ?auto_14238 ) ( IN-CITY ?auto_14232 ?auto_14238 ) ( not ( = ?auto_14232 ?auto_14236 ) ) ( OBJ-AT ?auto_14233 ?auto_14236 ) ( IN-TRUCK ?auto_14234 ?auto_14235 ) ( TRUCK-AT ?auto_14235 ?auto_14237 ) ( IN-CITY ?auto_14237 ?auto_14238 ) ( not ( = ?auto_14232 ?auto_14237 ) ) ( not ( = ?auto_14236 ?auto_14237 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14234 ?auto_14233 ?auto_14232 )
      ( DELIVER-2PKG-VERIFY ?auto_14233 ?auto_14234 ?auto_14232 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14305 - OBJ
      ?auto_14304 - LOCATION
    )
    :vars
    (
      ?auto_14307 - OBJ
      ?auto_14308 - LOCATION
      ?auto_14310 - CITY
      ?auto_14306 - TRUCK
      ?auto_14309 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_14305 ?auto_14307 ) ) ( IN-CITY ?auto_14308 ?auto_14310 ) ( IN-CITY ?auto_14304 ?auto_14310 ) ( not ( = ?auto_14304 ?auto_14308 ) ) ( OBJ-AT ?auto_14305 ?auto_14308 ) ( TRUCK-AT ?auto_14306 ?auto_14309 ) ( IN-CITY ?auto_14309 ?auto_14310 ) ( not ( = ?auto_14304 ?auto_14309 ) ) ( not ( = ?auto_14308 ?auto_14309 ) ) ( OBJ-AT ?auto_14307 ?auto_14309 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14307 ?auto_14306 ?auto_14309 )
      ( DELIVER-2PKG ?auto_14307 ?auto_14305 ?auto_14304 )
      ( DELIVER-1PKG-VERIFY ?auto_14305 ?auto_14304 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14312 - OBJ
      ?auto_14313 - OBJ
      ?auto_14311 - LOCATION
    )
    :vars
    (
      ?auto_14314 - LOCATION
      ?auto_14315 - CITY
      ?auto_14317 - TRUCK
      ?auto_14316 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_14313 ?auto_14312 ) ) ( IN-CITY ?auto_14314 ?auto_14315 ) ( IN-CITY ?auto_14311 ?auto_14315 ) ( not ( = ?auto_14311 ?auto_14314 ) ) ( OBJ-AT ?auto_14313 ?auto_14314 ) ( TRUCK-AT ?auto_14317 ?auto_14316 ) ( IN-CITY ?auto_14316 ?auto_14315 ) ( not ( = ?auto_14311 ?auto_14316 ) ) ( not ( = ?auto_14314 ?auto_14316 ) ) ( OBJ-AT ?auto_14312 ?auto_14316 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14313 ?auto_14311 )
      ( DELIVER-2PKG-VERIFY ?auto_14312 ?auto_14313 ?auto_14311 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14319 - OBJ
      ?auto_14320 - OBJ
      ?auto_14318 - LOCATION
    )
    :vars
    (
      ?auto_14322 - LOCATION
      ?auto_14323 - CITY
      ?auto_14321 - TRUCK
      ?auto_14324 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_14320 ?auto_14319 ) ) ( IN-CITY ?auto_14322 ?auto_14323 ) ( IN-CITY ?auto_14318 ?auto_14323 ) ( not ( = ?auto_14318 ?auto_14322 ) ) ( OBJ-AT ?auto_14319 ?auto_14322 ) ( TRUCK-AT ?auto_14321 ?auto_14324 ) ( IN-CITY ?auto_14324 ?auto_14323 ) ( not ( = ?auto_14318 ?auto_14324 ) ) ( not ( = ?auto_14322 ?auto_14324 ) ) ( OBJ-AT ?auto_14320 ?auto_14324 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14320 ?auto_14319 ?auto_14318 )
      ( DELIVER-2PKG-VERIFY ?auto_14319 ?auto_14320 ?auto_14318 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14391 - OBJ
      ?auto_14390 - LOCATION
    )
    :vars
    (
      ?auto_14393 - OBJ
      ?auto_14394 - LOCATION
      ?auto_14395 - CITY
      ?auto_14396 - LOCATION
      ?auto_14392 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_14391 ?auto_14393 ) ) ( IN-CITY ?auto_14394 ?auto_14395 ) ( IN-CITY ?auto_14390 ?auto_14395 ) ( not ( = ?auto_14390 ?auto_14394 ) ) ( OBJ-AT ?auto_14391 ?auto_14394 ) ( IN-CITY ?auto_14396 ?auto_14395 ) ( not ( = ?auto_14390 ?auto_14396 ) ) ( not ( = ?auto_14394 ?auto_14396 ) ) ( OBJ-AT ?auto_14393 ?auto_14396 ) ( TRUCK-AT ?auto_14392 ?auto_14390 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14392 ?auto_14390 ?auto_14396 ?auto_14395 )
      ( DELIVER-2PKG ?auto_14393 ?auto_14391 ?auto_14390 )
      ( DELIVER-1PKG-VERIFY ?auto_14391 ?auto_14390 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14398 - OBJ
      ?auto_14399 - OBJ
      ?auto_14397 - LOCATION
    )
    :vars
    (
      ?auto_14400 - LOCATION
      ?auto_14402 - CITY
      ?auto_14403 - LOCATION
      ?auto_14401 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_14399 ?auto_14398 ) ) ( IN-CITY ?auto_14400 ?auto_14402 ) ( IN-CITY ?auto_14397 ?auto_14402 ) ( not ( = ?auto_14397 ?auto_14400 ) ) ( OBJ-AT ?auto_14399 ?auto_14400 ) ( IN-CITY ?auto_14403 ?auto_14402 ) ( not ( = ?auto_14397 ?auto_14403 ) ) ( not ( = ?auto_14400 ?auto_14403 ) ) ( OBJ-AT ?auto_14398 ?auto_14403 ) ( TRUCK-AT ?auto_14401 ?auto_14397 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14399 ?auto_14397 )
      ( DELIVER-2PKG-VERIFY ?auto_14398 ?auto_14399 ?auto_14397 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14405 - OBJ
      ?auto_14406 - OBJ
      ?auto_14404 - LOCATION
    )
    :vars
    (
      ?auto_14410 - LOCATION
      ?auto_14407 - CITY
      ?auto_14409 - LOCATION
      ?auto_14408 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_14406 ?auto_14405 ) ) ( IN-CITY ?auto_14410 ?auto_14407 ) ( IN-CITY ?auto_14404 ?auto_14407 ) ( not ( = ?auto_14404 ?auto_14410 ) ) ( OBJ-AT ?auto_14405 ?auto_14410 ) ( IN-CITY ?auto_14409 ?auto_14407 ) ( not ( = ?auto_14404 ?auto_14409 ) ) ( not ( = ?auto_14410 ?auto_14409 ) ) ( OBJ-AT ?auto_14406 ?auto_14409 ) ( TRUCK-AT ?auto_14408 ?auto_14404 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14406 ?auto_14405 ?auto_14404 )
      ( DELIVER-2PKG-VERIFY ?auto_14405 ?auto_14406 ?auto_14404 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14570 - OBJ
      ?auto_14569 - LOCATION
    )
    :vars
    (
      ?auto_14571 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14571 ?auto_14569 ) ( IN-TRUCK ?auto_14570 ?auto_14571 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_14570 ?auto_14571 ?auto_14569 )
      ( DELIVER-1PKG-VERIFY ?auto_14570 ?auto_14569 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14573 - OBJ
      ?auto_14574 - OBJ
      ?auto_14572 - LOCATION
    )
    :vars
    (
      ?auto_14575 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_14574 ?auto_14573 ) ) ( TRUCK-AT ?auto_14575 ?auto_14572 ) ( IN-TRUCK ?auto_14574 ?auto_14575 ) ( OBJ-AT ?auto_14573 ?auto_14572 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14574 ?auto_14572 )
      ( DELIVER-2PKG-VERIFY ?auto_14573 ?auto_14574 ?auto_14572 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14577 - OBJ
      ?auto_14578 - OBJ
      ?auto_14576 - LOCATION
    )
    :vars
    (
      ?auto_14579 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_14578 ?auto_14577 ) ) ( TRUCK-AT ?auto_14579 ?auto_14576 ) ( IN-TRUCK ?auto_14578 ?auto_14579 ) ( OBJ-AT ?auto_14577 ?auto_14576 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14578 ?auto_14576 )
      ( DELIVER-2PKG-VERIFY ?auto_14577 ?auto_14578 ?auto_14576 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14581 - OBJ
      ?auto_14582 - OBJ
      ?auto_14580 - LOCATION
    )
    :vars
    (
      ?auto_14583 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_14582 ?auto_14581 ) ) ( TRUCK-AT ?auto_14583 ?auto_14580 ) ( IN-TRUCK ?auto_14581 ?auto_14583 ) ( OBJ-AT ?auto_14582 ?auto_14580 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14581 ?auto_14580 )
      ( DELIVER-2PKG-VERIFY ?auto_14581 ?auto_14582 ?auto_14580 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14585 - OBJ
      ?auto_14586 - OBJ
      ?auto_14584 - LOCATION
    )
    :vars
    (
      ?auto_14587 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_14586 ?auto_14585 ) ) ( TRUCK-AT ?auto_14587 ?auto_14584 ) ( IN-TRUCK ?auto_14585 ?auto_14587 ) ( OBJ-AT ?auto_14586 ?auto_14584 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14585 ?auto_14584 )
      ( DELIVER-2PKG-VERIFY ?auto_14585 ?auto_14586 ?auto_14584 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14598 - OBJ
      ?auto_14599 - OBJ
      ?auto_14600 - OBJ
      ?auto_14597 - LOCATION
    )
    :vars
    (
      ?auto_14601 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_14599 ?auto_14598 ) ) ( not ( = ?auto_14600 ?auto_14598 ) ) ( not ( = ?auto_14600 ?auto_14599 ) ) ( TRUCK-AT ?auto_14601 ?auto_14597 ) ( IN-TRUCK ?auto_14600 ?auto_14601 ) ( OBJ-AT ?auto_14598 ?auto_14597 ) ( OBJ-AT ?auto_14599 ?auto_14597 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14600 ?auto_14597 )
      ( DELIVER-3PKG-VERIFY ?auto_14598 ?auto_14599 ?auto_14600 ?auto_14597 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14608 - OBJ
      ?auto_14609 - OBJ
      ?auto_14610 - OBJ
      ?auto_14607 - LOCATION
    )
    :vars
    (
      ?auto_14611 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_14609 ?auto_14608 ) ) ( not ( = ?auto_14610 ?auto_14608 ) ) ( not ( = ?auto_14610 ?auto_14609 ) ) ( TRUCK-AT ?auto_14611 ?auto_14607 ) ( IN-TRUCK ?auto_14609 ?auto_14611 ) ( OBJ-AT ?auto_14608 ?auto_14607 ) ( OBJ-AT ?auto_14610 ?auto_14607 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14609 ?auto_14607 )
      ( DELIVER-3PKG-VERIFY ?auto_14608 ?auto_14609 ?auto_14610 ?auto_14607 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14618 - OBJ
      ?auto_14619 - OBJ
      ?auto_14620 - OBJ
      ?auto_14617 - LOCATION
    )
    :vars
    (
      ?auto_14621 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_14619 ?auto_14618 ) ) ( not ( = ?auto_14620 ?auto_14618 ) ) ( not ( = ?auto_14620 ?auto_14619 ) ) ( TRUCK-AT ?auto_14621 ?auto_14617 ) ( IN-TRUCK ?auto_14620 ?auto_14621 ) ( OBJ-AT ?auto_14618 ?auto_14617 ) ( OBJ-AT ?auto_14619 ?auto_14617 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14620 ?auto_14617 )
      ( DELIVER-3PKG-VERIFY ?auto_14618 ?auto_14619 ?auto_14620 ?auto_14617 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14628 - OBJ
      ?auto_14629 - OBJ
      ?auto_14630 - OBJ
      ?auto_14627 - LOCATION
    )
    :vars
    (
      ?auto_14631 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_14629 ?auto_14628 ) ) ( not ( = ?auto_14630 ?auto_14628 ) ) ( not ( = ?auto_14630 ?auto_14629 ) ) ( TRUCK-AT ?auto_14631 ?auto_14627 ) ( IN-TRUCK ?auto_14629 ?auto_14631 ) ( OBJ-AT ?auto_14628 ?auto_14627 ) ( OBJ-AT ?auto_14630 ?auto_14627 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14629 ?auto_14627 )
      ( DELIVER-3PKG-VERIFY ?auto_14628 ?auto_14629 ?auto_14630 ?auto_14627 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14648 - OBJ
      ?auto_14649 - OBJ
      ?auto_14650 - OBJ
      ?auto_14647 - LOCATION
    )
    :vars
    (
      ?auto_14651 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_14649 ?auto_14648 ) ) ( not ( = ?auto_14650 ?auto_14648 ) ) ( not ( = ?auto_14650 ?auto_14649 ) ) ( TRUCK-AT ?auto_14651 ?auto_14647 ) ( IN-TRUCK ?auto_14648 ?auto_14651 ) ( OBJ-AT ?auto_14649 ?auto_14647 ) ( OBJ-AT ?auto_14650 ?auto_14647 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14648 ?auto_14647 )
      ( DELIVER-3PKG-VERIFY ?auto_14648 ?auto_14649 ?auto_14650 ?auto_14647 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14658 - OBJ
      ?auto_14659 - OBJ
      ?auto_14660 - OBJ
      ?auto_14657 - LOCATION
    )
    :vars
    (
      ?auto_14661 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_14659 ?auto_14658 ) ) ( not ( = ?auto_14660 ?auto_14658 ) ) ( not ( = ?auto_14660 ?auto_14659 ) ) ( TRUCK-AT ?auto_14661 ?auto_14657 ) ( IN-TRUCK ?auto_14658 ?auto_14661 ) ( OBJ-AT ?auto_14659 ?auto_14657 ) ( OBJ-AT ?auto_14660 ?auto_14657 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14658 ?auto_14657 )
      ( DELIVER-3PKG-VERIFY ?auto_14658 ?auto_14659 ?auto_14660 ?auto_14657 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14688 - OBJ
      ?auto_14687 - LOCATION
    )
    :vars
    (
      ?auto_14689 - TRUCK
      ?auto_14690 - LOCATION
      ?auto_14691 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14688 ?auto_14689 ) ( TRUCK-AT ?auto_14689 ?auto_14690 ) ( IN-CITY ?auto_14690 ?auto_14691 ) ( IN-CITY ?auto_14687 ?auto_14691 ) ( not ( = ?auto_14687 ?auto_14690 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14689 ?auto_14690 ?auto_14687 ?auto_14691 )
      ( DELIVER-1PKG ?auto_14688 ?auto_14687 )
      ( DELIVER-1PKG-VERIFY ?auto_14688 ?auto_14687 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14693 - OBJ
      ?auto_14694 - OBJ
      ?auto_14692 - LOCATION
    )
    :vars
    (
      ?auto_14696 - TRUCK
      ?auto_14695 - LOCATION
      ?auto_14697 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14694 ?auto_14693 ) ) ( IN-TRUCK ?auto_14694 ?auto_14696 ) ( TRUCK-AT ?auto_14696 ?auto_14695 ) ( IN-CITY ?auto_14695 ?auto_14697 ) ( IN-CITY ?auto_14692 ?auto_14697 ) ( not ( = ?auto_14692 ?auto_14695 ) ) ( OBJ-AT ?auto_14693 ?auto_14692 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14694 ?auto_14692 )
      ( DELIVER-2PKG-VERIFY ?auto_14693 ?auto_14694 ?auto_14692 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14699 - OBJ
      ?auto_14700 - OBJ
      ?auto_14698 - LOCATION
    )
    :vars
    (
      ?auto_14702 - OBJ
      ?auto_14703 - TRUCK
      ?auto_14704 - LOCATION
      ?auto_14701 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14700 ?auto_14699 ) ) ( not ( = ?auto_14700 ?auto_14702 ) ) ( IN-TRUCK ?auto_14700 ?auto_14703 ) ( TRUCK-AT ?auto_14703 ?auto_14704 ) ( IN-CITY ?auto_14704 ?auto_14701 ) ( IN-CITY ?auto_14698 ?auto_14701 ) ( not ( = ?auto_14698 ?auto_14704 ) ) ( OBJ-AT ?auto_14702 ?auto_14698 ) ( OBJ-AT ?auto_14699 ?auto_14698 ) ( not ( = ?auto_14699 ?auto_14702 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14702 ?auto_14700 ?auto_14698 )
      ( DELIVER-2PKG-VERIFY ?auto_14699 ?auto_14700 ?auto_14698 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14706 - OBJ
      ?auto_14707 - OBJ
      ?auto_14705 - LOCATION
    )
    :vars
    (
      ?auto_14709 - TRUCK
      ?auto_14710 - LOCATION
      ?auto_14708 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14707 ?auto_14706 ) ) ( IN-TRUCK ?auto_14706 ?auto_14709 ) ( TRUCK-AT ?auto_14709 ?auto_14710 ) ( IN-CITY ?auto_14710 ?auto_14708 ) ( IN-CITY ?auto_14705 ?auto_14708 ) ( not ( = ?auto_14705 ?auto_14710 ) ) ( OBJ-AT ?auto_14707 ?auto_14705 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14707 ?auto_14706 ?auto_14705 )
      ( DELIVER-2PKG-VERIFY ?auto_14706 ?auto_14707 ?auto_14705 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14712 - OBJ
      ?auto_14713 - OBJ
      ?auto_14711 - LOCATION
    )
    :vars
    (
      ?auto_14715 - OBJ
      ?auto_14716 - TRUCK
      ?auto_14717 - LOCATION
      ?auto_14714 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14713 ?auto_14712 ) ) ( not ( = ?auto_14712 ?auto_14715 ) ) ( IN-TRUCK ?auto_14712 ?auto_14716 ) ( TRUCK-AT ?auto_14716 ?auto_14717 ) ( IN-CITY ?auto_14717 ?auto_14714 ) ( IN-CITY ?auto_14711 ?auto_14714 ) ( not ( = ?auto_14711 ?auto_14717 ) ) ( OBJ-AT ?auto_14715 ?auto_14711 ) ( OBJ-AT ?auto_14713 ?auto_14711 ) ( not ( = ?auto_14713 ?auto_14715 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14715 ?auto_14712 ?auto_14711 )
      ( DELIVER-2PKG-VERIFY ?auto_14712 ?auto_14713 ?auto_14711 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14733 - OBJ
      ?auto_14734 - OBJ
      ?auto_14735 - OBJ
      ?auto_14732 - LOCATION
    )
    :vars
    (
      ?auto_14737 - TRUCK
      ?auto_14738 - LOCATION
      ?auto_14736 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14734 ?auto_14733 ) ) ( not ( = ?auto_14735 ?auto_14733 ) ) ( not ( = ?auto_14735 ?auto_14734 ) ) ( IN-TRUCK ?auto_14735 ?auto_14737 ) ( TRUCK-AT ?auto_14737 ?auto_14738 ) ( IN-CITY ?auto_14738 ?auto_14736 ) ( IN-CITY ?auto_14732 ?auto_14736 ) ( not ( = ?auto_14732 ?auto_14738 ) ) ( OBJ-AT ?auto_14733 ?auto_14732 ) ( OBJ-AT ?auto_14734 ?auto_14732 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14733 ?auto_14735 ?auto_14732 )
      ( DELIVER-3PKG-VERIFY ?auto_14733 ?auto_14734 ?auto_14735 ?auto_14732 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14747 - OBJ
      ?auto_14748 - OBJ
      ?auto_14749 - OBJ
      ?auto_14746 - LOCATION
    )
    :vars
    (
      ?auto_14751 - TRUCK
      ?auto_14752 - LOCATION
      ?auto_14750 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14748 ?auto_14747 ) ) ( not ( = ?auto_14749 ?auto_14747 ) ) ( not ( = ?auto_14749 ?auto_14748 ) ) ( IN-TRUCK ?auto_14748 ?auto_14751 ) ( TRUCK-AT ?auto_14751 ?auto_14752 ) ( IN-CITY ?auto_14752 ?auto_14750 ) ( IN-CITY ?auto_14746 ?auto_14750 ) ( not ( = ?auto_14746 ?auto_14752 ) ) ( OBJ-AT ?auto_14747 ?auto_14746 ) ( OBJ-AT ?auto_14749 ?auto_14746 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14747 ?auto_14748 ?auto_14746 )
      ( DELIVER-3PKG-VERIFY ?auto_14747 ?auto_14748 ?auto_14749 ?auto_14746 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14761 - OBJ
      ?auto_14762 - OBJ
      ?auto_14763 - OBJ
      ?auto_14760 - LOCATION
    )
    :vars
    (
      ?auto_14765 - TRUCK
      ?auto_14766 - LOCATION
      ?auto_14764 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14762 ?auto_14761 ) ) ( not ( = ?auto_14763 ?auto_14761 ) ) ( not ( = ?auto_14763 ?auto_14762 ) ) ( IN-TRUCK ?auto_14763 ?auto_14765 ) ( TRUCK-AT ?auto_14765 ?auto_14766 ) ( IN-CITY ?auto_14766 ?auto_14764 ) ( IN-CITY ?auto_14760 ?auto_14764 ) ( not ( = ?auto_14760 ?auto_14766 ) ) ( OBJ-AT ?auto_14762 ?auto_14760 ) ( OBJ-AT ?auto_14761 ?auto_14760 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14762 ?auto_14763 ?auto_14760 )
      ( DELIVER-3PKG-VERIFY ?auto_14761 ?auto_14762 ?auto_14763 ?auto_14760 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14776 - OBJ
      ?auto_14777 - OBJ
      ?auto_14778 - OBJ
      ?auto_14775 - LOCATION
    )
    :vars
    (
      ?auto_14780 - TRUCK
      ?auto_14781 - LOCATION
      ?auto_14779 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14777 ?auto_14776 ) ) ( not ( = ?auto_14778 ?auto_14776 ) ) ( not ( = ?auto_14778 ?auto_14777 ) ) ( IN-TRUCK ?auto_14777 ?auto_14780 ) ( TRUCK-AT ?auto_14780 ?auto_14781 ) ( IN-CITY ?auto_14781 ?auto_14779 ) ( IN-CITY ?auto_14775 ?auto_14779 ) ( not ( = ?auto_14775 ?auto_14781 ) ) ( OBJ-AT ?auto_14778 ?auto_14775 ) ( OBJ-AT ?auto_14776 ?auto_14775 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14778 ?auto_14777 ?auto_14775 )
      ( DELIVER-3PKG-VERIFY ?auto_14776 ?auto_14777 ?auto_14778 ?auto_14775 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14806 - OBJ
      ?auto_14807 - OBJ
      ?auto_14808 - OBJ
      ?auto_14805 - LOCATION
    )
    :vars
    (
      ?auto_14810 - TRUCK
      ?auto_14811 - LOCATION
      ?auto_14809 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14807 ?auto_14806 ) ) ( not ( = ?auto_14808 ?auto_14806 ) ) ( not ( = ?auto_14808 ?auto_14807 ) ) ( IN-TRUCK ?auto_14806 ?auto_14810 ) ( TRUCK-AT ?auto_14810 ?auto_14811 ) ( IN-CITY ?auto_14811 ?auto_14809 ) ( IN-CITY ?auto_14805 ?auto_14809 ) ( not ( = ?auto_14805 ?auto_14811 ) ) ( OBJ-AT ?auto_14807 ?auto_14805 ) ( OBJ-AT ?auto_14808 ?auto_14805 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14807 ?auto_14806 ?auto_14805 )
      ( DELIVER-3PKG-VERIFY ?auto_14806 ?auto_14807 ?auto_14808 ?auto_14805 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14820 - OBJ
      ?auto_14821 - OBJ
      ?auto_14822 - OBJ
      ?auto_14819 - LOCATION
    )
    :vars
    (
      ?auto_14824 - TRUCK
      ?auto_14825 - LOCATION
      ?auto_14823 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14821 ?auto_14820 ) ) ( not ( = ?auto_14822 ?auto_14820 ) ) ( not ( = ?auto_14822 ?auto_14821 ) ) ( IN-TRUCK ?auto_14820 ?auto_14824 ) ( TRUCK-AT ?auto_14824 ?auto_14825 ) ( IN-CITY ?auto_14825 ?auto_14823 ) ( IN-CITY ?auto_14819 ?auto_14823 ) ( not ( = ?auto_14819 ?auto_14825 ) ) ( OBJ-AT ?auto_14822 ?auto_14819 ) ( OBJ-AT ?auto_14821 ?auto_14819 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14822 ?auto_14820 ?auto_14819 )
      ( DELIVER-3PKG-VERIFY ?auto_14820 ?auto_14821 ?auto_14822 ?auto_14819 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14866 - OBJ
      ?auto_14865 - LOCATION
    )
    :vars
    (
      ?auto_14868 - OBJ
      ?auto_14869 - TRUCK
      ?auto_14870 - LOCATION
      ?auto_14867 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14866 ?auto_14868 ) ) ( TRUCK-AT ?auto_14869 ?auto_14870 ) ( IN-CITY ?auto_14870 ?auto_14867 ) ( IN-CITY ?auto_14865 ?auto_14867 ) ( not ( = ?auto_14865 ?auto_14870 ) ) ( OBJ-AT ?auto_14868 ?auto_14865 ) ( OBJ-AT ?auto_14866 ?auto_14870 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14866 ?auto_14869 ?auto_14870 )
      ( DELIVER-2PKG ?auto_14868 ?auto_14866 ?auto_14865 )
      ( DELIVER-1PKG-VERIFY ?auto_14866 ?auto_14865 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14872 - OBJ
      ?auto_14873 - OBJ
      ?auto_14871 - LOCATION
    )
    :vars
    (
      ?auto_14875 - TRUCK
      ?auto_14876 - LOCATION
      ?auto_14874 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14873 ?auto_14872 ) ) ( TRUCK-AT ?auto_14875 ?auto_14876 ) ( IN-CITY ?auto_14876 ?auto_14874 ) ( IN-CITY ?auto_14871 ?auto_14874 ) ( not ( = ?auto_14871 ?auto_14876 ) ) ( OBJ-AT ?auto_14872 ?auto_14871 ) ( OBJ-AT ?auto_14873 ?auto_14876 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14873 ?auto_14871 )
      ( DELIVER-2PKG-VERIFY ?auto_14872 ?auto_14873 ?auto_14871 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14878 - OBJ
      ?auto_14879 - OBJ
      ?auto_14877 - LOCATION
    )
    :vars
    (
      ?auto_14883 - OBJ
      ?auto_14880 - TRUCK
      ?auto_14881 - LOCATION
      ?auto_14882 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14879 ?auto_14878 ) ) ( not ( = ?auto_14879 ?auto_14883 ) ) ( TRUCK-AT ?auto_14880 ?auto_14881 ) ( IN-CITY ?auto_14881 ?auto_14882 ) ( IN-CITY ?auto_14877 ?auto_14882 ) ( not ( = ?auto_14877 ?auto_14881 ) ) ( OBJ-AT ?auto_14883 ?auto_14877 ) ( OBJ-AT ?auto_14879 ?auto_14881 ) ( OBJ-AT ?auto_14878 ?auto_14877 ) ( not ( = ?auto_14878 ?auto_14883 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14883 ?auto_14879 ?auto_14877 )
      ( DELIVER-2PKG-VERIFY ?auto_14878 ?auto_14879 ?auto_14877 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14885 - OBJ
      ?auto_14886 - OBJ
      ?auto_14884 - LOCATION
    )
    :vars
    (
      ?auto_14887 - TRUCK
      ?auto_14888 - LOCATION
      ?auto_14889 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14886 ?auto_14885 ) ) ( TRUCK-AT ?auto_14887 ?auto_14888 ) ( IN-CITY ?auto_14888 ?auto_14889 ) ( IN-CITY ?auto_14884 ?auto_14889 ) ( not ( = ?auto_14884 ?auto_14888 ) ) ( OBJ-AT ?auto_14886 ?auto_14884 ) ( OBJ-AT ?auto_14885 ?auto_14888 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14886 ?auto_14885 ?auto_14884 )
      ( DELIVER-2PKG-VERIFY ?auto_14885 ?auto_14886 ?auto_14884 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14891 - OBJ
      ?auto_14892 - OBJ
      ?auto_14890 - LOCATION
    )
    :vars
    (
      ?auto_14896 - OBJ
      ?auto_14893 - TRUCK
      ?auto_14894 - LOCATION
      ?auto_14895 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14892 ?auto_14891 ) ) ( not ( = ?auto_14891 ?auto_14896 ) ) ( TRUCK-AT ?auto_14893 ?auto_14894 ) ( IN-CITY ?auto_14894 ?auto_14895 ) ( IN-CITY ?auto_14890 ?auto_14895 ) ( not ( = ?auto_14890 ?auto_14894 ) ) ( OBJ-AT ?auto_14896 ?auto_14890 ) ( OBJ-AT ?auto_14891 ?auto_14894 ) ( OBJ-AT ?auto_14892 ?auto_14890 ) ( not ( = ?auto_14892 ?auto_14896 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14896 ?auto_14891 ?auto_14890 )
      ( DELIVER-2PKG-VERIFY ?auto_14891 ?auto_14892 ?auto_14890 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14912 - OBJ
      ?auto_14913 - OBJ
      ?auto_14914 - OBJ
      ?auto_14911 - LOCATION
    )
    :vars
    (
      ?auto_14915 - TRUCK
      ?auto_14916 - LOCATION
      ?auto_14917 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14913 ?auto_14912 ) ) ( not ( = ?auto_14914 ?auto_14912 ) ) ( not ( = ?auto_14914 ?auto_14913 ) ) ( TRUCK-AT ?auto_14915 ?auto_14916 ) ( IN-CITY ?auto_14916 ?auto_14917 ) ( IN-CITY ?auto_14911 ?auto_14917 ) ( not ( = ?auto_14911 ?auto_14916 ) ) ( OBJ-AT ?auto_14912 ?auto_14911 ) ( OBJ-AT ?auto_14914 ?auto_14916 ) ( OBJ-AT ?auto_14913 ?auto_14911 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14912 ?auto_14914 ?auto_14911 )
      ( DELIVER-3PKG-VERIFY ?auto_14912 ?auto_14913 ?auto_14914 ?auto_14911 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14926 - OBJ
      ?auto_14927 - OBJ
      ?auto_14928 - OBJ
      ?auto_14925 - LOCATION
    )
    :vars
    (
      ?auto_14929 - TRUCK
      ?auto_14930 - LOCATION
      ?auto_14931 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14927 ?auto_14926 ) ) ( not ( = ?auto_14928 ?auto_14926 ) ) ( not ( = ?auto_14928 ?auto_14927 ) ) ( TRUCK-AT ?auto_14929 ?auto_14930 ) ( IN-CITY ?auto_14930 ?auto_14931 ) ( IN-CITY ?auto_14925 ?auto_14931 ) ( not ( = ?auto_14925 ?auto_14930 ) ) ( OBJ-AT ?auto_14926 ?auto_14925 ) ( OBJ-AT ?auto_14927 ?auto_14930 ) ( OBJ-AT ?auto_14928 ?auto_14925 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14926 ?auto_14927 ?auto_14925 )
      ( DELIVER-3PKG-VERIFY ?auto_14926 ?auto_14927 ?auto_14928 ?auto_14925 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14940 - OBJ
      ?auto_14941 - OBJ
      ?auto_14942 - OBJ
      ?auto_14939 - LOCATION
    )
    :vars
    (
      ?auto_14943 - TRUCK
      ?auto_14944 - LOCATION
      ?auto_14945 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14941 ?auto_14940 ) ) ( not ( = ?auto_14942 ?auto_14940 ) ) ( not ( = ?auto_14942 ?auto_14941 ) ) ( TRUCK-AT ?auto_14943 ?auto_14944 ) ( IN-CITY ?auto_14944 ?auto_14945 ) ( IN-CITY ?auto_14939 ?auto_14945 ) ( not ( = ?auto_14939 ?auto_14944 ) ) ( OBJ-AT ?auto_14941 ?auto_14939 ) ( OBJ-AT ?auto_14942 ?auto_14944 ) ( OBJ-AT ?auto_14940 ?auto_14939 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14941 ?auto_14942 ?auto_14939 )
      ( DELIVER-3PKG-VERIFY ?auto_14940 ?auto_14941 ?auto_14942 ?auto_14939 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14955 - OBJ
      ?auto_14956 - OBJ
      ?auto_14957 - OBJ
      ?auto_14954 - LOCATION
    )
    :vars
    (
      ?auto_14958 - TRUCK
      ?auto_14959 - LOCATION
      ?auto_14960 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14956 ?auto_14955 ) ) ( not ( = ?auto_14957 ?auto_14955 ) ) ( not ( = ?auto_14957 ?auto_14956 ) ) ( TRUCK-AT ?auto_14958 ?auto_14959 ) ( IN-CITY ?auto_14959 ?auto_14960 ) ( IN-CITY ?auto_14954 ?auto_14960 ) ( not ( = ?auto_14954 ?auto_14959 ) ) ( OBJ-AT ?auto_14957 ?auto_14954 ) ( OBJ-AT ?auto_14956 ?auto_14959 ) ( OBJ-AT ?auto_14955 ?auto_14954 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14957 ?auto_14956 ?auto_14954 )
      ( DELIVER-3PKG-VERIFY ?auto_14955 ?auto_14956 ?auto_14957 ?auto_14954 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14985 - OBJ
      ?auto_14986 - OBJ
      ?auto_14987 - OBJ
      ?auto_14984 - LOCATION
    )
    :vars
    (
      ?auto_14988 - TRUCK
      ?auto_14989 - LOCATION
      ?auto_14990 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_14986 ?auto_14985 ) ) ( not ( = ?auto_14987 ?auto_14985 ) ) ( not ( = ?auto_14987 ?auto_14986 ) ) ( TRUCK-AT ?auto_14988 ?auto_14989 ) ( IN-CITY ?auto_14989 ?auto_14990 ) ( IN-CITY ?auto_14984 ?auto_14990 ) ( not ( = ?auto_14984 ?auto_14989 ) ) ( OBJ-AT ?auto_14986 ?auto_14984 ) ( OBJ-AT ?auto_14985 ?auto_14989 ) ( OBJ-AT ?auto_14987 ?auto_14984 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14986 ?auto_14985 ?auto_14984 )
      ( DELIVER-3PKG-VERIFY ?auto_14985 ?auto_14986 ?auto_14987 ?auto_14984 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14999 - OBJ
      ?auto_15000 - OBJ
      ?auto_15001 - OBJ
      ?auto_14998 - LOCATION
    )
    :vars
    (
      ?auto_15002 - TRUCK
      ?auto_15003 - LOCATION
      ?auto_15004 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_15000 ?auto_14999 ) ) ( not ( = ?auto_15001 ?auto_14999 ) ) ( not ( = ?auto_15001 ?auto_15000 ) ) ( TRUCK-AT ?auto_15002 ?auto_15003 ) ( IN-CITY ?auto_15003 ?auto_15004 ) ( IN-CITY ?auto_14998 ?auto_15004 ) ( not ( = ?auto_14998 ?auto_15003 ) ) ( OBJ-AT ?auto_15001 ?auto_14998 ) ( OBJ-AT ?auto_14999 ?auto_15003 ) ( OBJ-AT ?auto_15000 ?auto_14998 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15001 ?auto_14999 ?auto_14998 )
      ( DELIVER-3PKG-VERIFY ?auto_14999 ?auto_15000 ?auto_15001 ?auto_14998 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15045 - OBJ
      ?auto_15044 - LOCATION
    )
    :vars
    (
      ?auto_15049 - OBJ
      ?auto_15047 - LOCATION
      ?auto_15048 - CITY
      ?auto_15046 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15045 ?auto_15049 ) ) ( IN-CITY ?auto_15047 ?auto_15048 ) ( IN-CITY ?auto_15044 ?auto_15048 ) ( not ( = ?auto_15044 ?auto_15047 ) ) ( OBJ-AT ?auto_15049 ?auto_15044 ) ( OBJ-AT ?auto_15045 ?auto_15047 ) ( TRUCK-AT ?auto_15046 ?auto_15044 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15046 ?auto_15044 ?auto_15047 ?auto_15048 )
      ( DELIVER-2PKG ?auto_15049 ?auto_15045 ?auto_15044 )
      ( DELIVER-1PKG-VERIFY ?auto_15045 ?auto_15044 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15051 - OBJ
      ?auto_15052 - OBJ
      ?auto_15050 - LOCATION
    )
    :vars
    (
      ?auto_15053 - LOCATION
      ?auto_15054 - CITY
      ?auto_15055 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15052 ?auto_15051 ) ) ( IN-CITY ?auto_15053 ?auto_15054 ) ( IN-CITY ?auto_15050 ?auto_15054 ) ( not ( = ?auto_15050 ?auto_15053 ) ) ( OBJ-AT ?auto_15051 ?auto_15050 ) ( OBJ-AT ?auto_15052 ?auto_15053 ) ( TRUCK-AT ?auto_15055 ?auto_15050 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15052 ?auto_15050 )
      ( DELIVER-2PKG-VERIFY ?auto_15051 ?auto_15052 ?auto_15050 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15057 - OBJ
      ?auto_15058 - OBJ
      ?auto_15056 - LOCATION
    )
    :vars
    (
      ?auto_15062 - OBJ
      ?auto_15060 - LOCATION
      ?auto_15059 - CITY
      ?auto_15061 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15058 ?auto_15057 ) ) ( not ( = ?auto_15058 ?auto_15062 ) ) ( IN-CITY ?auto_15060 ?auto_15059 ) ( IN-CITY ?auto_15056 ?auto_15059 ) ( not ( = ?auto_15056 ?auto_15060 ) ) ( OBJ-AT ?auto_15062 ?auto_15056 ) ( OBJ-AT ?auto_15058 ?auto_15060 ) ( TRUCK-AT ?auto_15061 ?auto_15056 ) ( OBJ-AT ?auto_15057 ?auto_15056 ) ( not ( = ?auto_15057 ?auto_15062 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15062 ?auto_15058 ?auto_15056 )
      ( DELIVER-2PKG-VERIFY ?auto_15057 ?auto_15058 ?auto_15056 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15064 - OBJ
      ?auto_15065 - OBJ
      ?auto_15063 - LOCATION
    )
    :vars
    (
      ?auto_15067 - LOCATION
      ?auto_15066 - CITY
      ?auto_15068 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15065 ?auto_15064 ) ) ( IN-CITY ?auto_15067 ?auto_15066 ) ( IN-CITY ?auto_15063 ?auto_15066 ) ( not ( = ?auto_15063 ?auto_15067 ) ) ( OBJ-AT ?auto_15065 ?auto_15063 ) ( OBJ-AT ?auto_15064 ?auto_15067 ) ( TRUCK-AT ?auto_15068 ?auto_15063 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15065 ?auto_15064 ?auto_15063 )
      ( DELIVER-2PKG-VERIFY ?auto_15064 ?auto_15065 ?auto_15063 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15070 - OBJ
      ?auto_15071 - OBJ
      ?auto_15069 - LOCATION
    )
    :vars
    (
      ?auto_15075 - OBJ
      ?auto_15073 - LOCATION
      ?auto_15072 - CITY
      ?auto_15074 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15071 ?auto_15070 ) ) ( not ( = ?auto_15070 ?auto_15075 ) ) ( IN-CITY ?auto_15073 ?auto_15072 ) ( IN-CITY ?auto_15069 ?auto_15072 ) ( not ( = ?auto_15069 ?auto_15073 ) ) ( OBJ-AT ?auto_15075 ?auto_15069 ) ( OBJ-AT ?auto_15070 ?auto_15073 ) ( TRUCK-AT ?auto_15074 ?auto_15069 ) ( OBJ-AT ?auto_15071 ?auto_15069 ) ( not ( = ?auto_15071 ?auto_15075 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15075 ?auto_15070 ?auto_15069 )
      ( DELIVER-2PKG-VERIFY ?auto_15070 ?auto_15071 ?auto_15069 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15091 - OBJ
      ?auto_15092 - OBJ
      ?auto_15093 - OBJ
      ?auto_15090 - LOCATION
    )
    :vars
    (
      ?auto_15095 - LOCATION
      ?auto_15094 - CITY
      ?auto_15096 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15092 ?auto_15091 ) ) ( not ( = ?auto_15093 ?auto_15091 ) ) ( not ( = ?auto_15093 ?auto_15092 ) ) ( IN-CITY ?auto_15095 ?auto_15094 ) ( IN-CITY ?auto_15090 ?auto_15094 ) ( not ( = ?auto_15090 ?auto_15095 ) ) ( OBJ-AT ?auto_15091 ?auto_15090 ) ( OBJ-AT ?auto_15093 ?auto_15095 ) ( TRUCK-AT ?auto_15096 ?auto_15090 ) ( OBJ-AT ?auto_15092 ?auto_15090 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15091 ?auto_15093 ?auto_15090 )
      ( DELIVER-3PKG-VERIFY ?auto_15091 ?auto_15092 ?auto_15093 ?auto_15090 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15105 - OBJ
      ?auto_15106 - OBJ
      ?auto_15107 - OBJ
      ?auto_15104 - LOCATION
    )
    :vars
    (
      ?auto_15109 - LOCATION
      ?auto_15108 - CITY
      ?auto_15110 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15106 ?auto_15105 ) ) ( not ( = ?auto_15107 ?auto_15105 ) ) ( not ( = ?auto_15107 ?auto_15106 ) ) ( IN-CITY ?auto_15109 ?auto_15108 ) ( IN-CITY ?auto_15104 ?auto_15108 ) ( not ( = ?auto_15104 ?auto_15109 ) ) ( OBJ-AT ?auto_15105 ?auto_15104 ) ( OBJ-AT ?auto_15106 ?auto_15109 ) ( TRUCK-AT ?auto_15110 ?auto_15104 ) ( OBJ-AT ?auto_15107 ?auto_15104 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15105 ?auto_15106 ?auto_15104 )
      ( DELIVER-3PKG-VERIFY ?auto_15105 ?auto_15106 ?auto_15107 ?auto_15104 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15119 - OBJ
      ?auto_15120 - OBJ
      ?auto_15121 - OBJ
      ?auto_15118 - LOCATION
    )
    :vars
    (
      ?auto_15123 - LOCATION
      ?auto_15122 - CITY
      ?auto_15124 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15120 ?auto_15119 ) ) ( not ( = ?auto_15121 ?auto_15119 ) ) ( not ( = ?auto_15121 ?auto_15120 ) ) ( IN-CITY ?auto_15123 ?auto_15122 ) ( IN-CITY ?auto_15118 ?auto_15122 ) ( not ( = ?auto_15118 ?auto_15123 ) ) ( OBJ-AT ?auto_15120 ?auto_15118 ) ( OBJ-AT ?auto_15121 ?auto_15123 ) ( TRUCK-AT ?auto_15124 ?auto_15118 ) ( OBJ-AT ?auto_15119 ?auto_15118 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15120 ?auto_15121 ?auto_15118 )
      ( DELIVER-3PKG-VERIFY ?auto_15119 ?auto_15120 ?auto_15121 ?auto_15118 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15134 - OBJ
      ?auto_15135 - OBJ
      ?auto_15136 - OBJ
      ?auto_15133 - LOCATION
    )
    :vars
    (
      ?auto_15138 - LOCATION
      ?auto_15137 - CITY
      ?auto_15139 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15135 ?auto_15134 ) ) ( not ( = ?auto_15136 ?auto_15134 ) ) ( not ( = ?auto_15136 ?auto_15135 ) ) ( IN-CITY ?auto_15138 ?auto_15137 ) ( IN-CITY ?auto_15133 ?auto_15137 ) ( not ( = ?auto_15133 ?auto_15138 ) ) ( OBJ-AT ?auto_15136 ?auto_15133 ) ( OBJ-AT ?auto_15135 ?auto_15138 ) ( TRUCK-AT ?auto_15139 ?auto_15133 ) ( OBJ-AT ?auto_15134 ?auto_15133 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15136 ?auto_15135 ?auto_15133 )
      ( DELIVER-3PKG-VERIFY ?auto_15134 ?auto_15135 ?auto_15136 ?auto_15133 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15164 - OBJ
      ?auto_15165 - OBJ
      ?auto_15166 - OBJ
      ?auto_15163 - LOCATION
    )
    :vars
    (
      ?auto_15168 - LOCATION
      ?auto_15167 - CITY
      ?auto_15169 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15165 ?auto_15164 ) ) ( not ( = ?auto_15166 ?auto_15164 ) ) ( not ( = ?auto_15166 ?auto_15165 ) ) ( IN-CITY ?auto_15168 ?auto_15167 ) ( IN-CITY ?auto_15163 ?auto_15167 ) ( not ( = ?auto_15163 ?auto_15168 ) ) ( OBJ-AT ?auto_15165 ?auto_15163 ) ( OBJ-AT ?auto_15164 ?auto_15168 ) ( TRUCK-AT ?auto_15169 ?auto_15163 ) ( OBJ-AT ?auto_15166 ?auto_15163 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15165 ?auto_15164 ?auto_15163 )
      ( DELIVER-3PKG-VERIFY ?auto_15164 ?auto_15165 ?auto_15166 ?auto_15163 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15178 - OBJ
      ?auto_15179 - OBJ
      ?auto_15180 - OBJ
      ?auto_15177 - LOCATION
    )
    :vars
    (
      ?auto_15182 - LOCATION
      ?auto_15181 - CITY
      ?auto_15183 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15179 ?auto_15178 ) ) ( not ( = ?auto_15180 ?auto_15178 ) ) ( not ( = ?auto_15180 ?auto_15179 ) ) ( IN-CITY ?auto_15182 ?auto_15181 ) ( IN-CITY ?auto_15177 ?auto_15181 ) ( not ( = ?auto_15177 ?auto_15182 ) ) ( OBJ-AT ?auto_15180 ?auto_15177 ) ( OBJ-AT ?auto_15178 ?auto_15182 ) ( TRUCK-AT ?auto_15183 ?auto_15177 ) ( OBJ-AT ?auto_15179 ?auto_15177 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15180 ?auto_15178 ?auto_15177 )
      ( DELIVER-3PKG-VERIFY ?auto_15178 ?auto_15179 ?auto_15180 ?auto_15177 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15224 - OBJ
      ?auto_15223 - LOCATION
    )
    :vars
    (
      ?auto_15228 - OBJ
      ?auto_15226 - LOCATION
      ?auto_15225 - CITY
      ?auto_15227 - TRUCK
      ?auto_15229 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_15224 ?auto_15228 ) ) ( IN-CITY ?auto_15226 ?auto_15225 ) ( IN-CITY ?auto_15223 ?auto_15225 ) ( not ( = ?auto_15223 ?auto_15226 ) ) ( OBJ-AT ?auto_15228 ?auto_15223 ) ( OBJ-AT ?auto_15224 ?auto_15226 ) ( TRUCK-AT ?auto_15227 ?auto_15223 ) ( not ( = ?auto_15229 ?auto_15228 ) ) ( IN-TRUCK ?auto_15229 ?auto_15227 ) ( not ( = ?auto_15224 ?auto_15229 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15228 ?auto_15229 ?auto_15223 )
      ( DELIVER-2PKG ?auto_15228 ?auto_15224 ?auto_15223 )
      ( DELIVER-1PKG-VERIFY ?auto_15224 ?auto_15223 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15231 - OBJ
      ?auto_15232 - OBJ
      ?auto_15230 - LOCATION
    )
    :vars
    (
      ?auto_15235 - LOCATION
      ?auto_15236 - CITY
      ?auto_15233 - TRUCK
      ?auto_15234 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_15232 ?auto_15231 ) ) ( IN-CITY ?auto_15235 ?auto_15236 ) ( IN-CITY ?auto_15230 ?auto_15236 ) ( not ( = ?auto_15230 ?auto_15235 ) ) ( OBJ-AT ?auto_15231 ?auto_15230 ) ( OBJ-AT ?auto_15232 ?auto_15235 ) ( TRUCK-AT ?auto_15233 ?auto_15230 ) ( not ( = ?auto_15234 ?auto_15231 ) ) ( IN-TRUCK ?auto_15234 ?auto_15233 ) ( not ( = ?auto_15232 ?auto_15234 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15232 ?auto_15230 )
      ( DELIVER-2PKG-VERIFY ?auto_15231 ?auto_15232 ?auto_15230 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15238 - OBJ
      ?auto_15239 - OBJ
      ?auto_15237 - LOCATION
    )
    :vars
    (
      ?auto_15241 - OBJ
      ?auto_15240 - LOCATION
      ?auto_15242 - CITY
      ?auto_15243 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15239 ?auto_15238 ) ) ( not ( = ?auto_15239 ?auto_15241 ) ) ( IN-CITY ?auto_15240 ?auto_15242 ) ( IN-CITY ?auto_15237 ?auto_15242 ) ( not ( = ?auto_15237 ?auto_15240 ) ) ( OBJ-AT ?auto_15241 ?auto_15237 ) ( OBJ-AT ?auto_15239 ?auto_15240 ) ( TRUCK-AT ?auto_15243 ?auto_15237 ) ( not ( = ?auto_15238 ?auto_15241 ) ) ( IN-TRUCK ?auto_15238 ?auto_15243 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15241 ?auto_15239 ?auto_15237 )
      ( DELIVER-2PKG-VERIFY ?auto_15238 ?auto_15239 ?auto_15237 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15245 - OBJ
      ?auto_15246 - OBJ
      ?auto_15244 - LOCATION
    )
    :vars
    (
      ?auto_15247 - LOCATION
      ?auto_15248 - CITY
      ?auto_15250 - TRUCK
      ?auto_15249 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_15246 ?auto_15245 ) ) ( IN-CITY ?auto_15247 ?auto_15248 ) ( IN-CITY ?auto_15244 ?auto_15248 ) ( not ( = ?auto_15244 ?auto_15247 ) ) ( OBJ-AT ?auto_15246 ?auto_15244 ) ( OBJ-AT ?auto_15245 ?auto_15247 ) ( TRUCK-AT ?auto_15250 ?auto_15244 ) ( not ( = ?auto_15249 ?auto_15246 ) ) ( IN-TRUCK ?auto_15249 ?auto_15250 ) ( not ( = ?auto_15245 ?auto_15249 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15246 ?auto_15245 ?auto_15244 )
      ( DELIVER-2PKG-VERIFY ?auto_15245 ?auto_15246 ?auto_15244 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15252 - OBJ
      ?auto_15253 - OBJ
      ?auto_15251 - LOCATION
    )
    :vars
    (
      ?auto_15255 - OBJ
      ?auto_15254 - LOCATION
      ?auto_15256 - CITY
      ?auto_15257 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15253 ?auto_15252 ) ) ( not ( = ?auto_15252 ?auto_15255 ) ) ( IN-CITY ?auto_15254 ?auto_15256 ) ( IN-CITY ?auto_15251 ?auto_15256 ) ( not ( = ?auto_15251 ?auto_15254 ) ) ( OBJ-AT ?auto_15255 ?auto_15251 ) ( OBJ-AT ?auto_15252 ?auto_15254 ) ( TRUCK-AT ?auto_15257 ?auto_15251 ) ( not ( = ?auto_15253 ?auto_15255 ) ) ( IN-TRUCK ?auto_15253 ?auto_15257 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15255 ?auto_15252 ?auto_15251 )
      ( DELIVER-2PKG-VERIFY ?auto_15252 ?auto_15253 ?auto_15251 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15275 - OBJ
      ?auto_15276 - OBJ
      ?auto_15277 - OBJ
      ?auto_15274 - LOCATION
    )
    :vars
    (
      ?auto_15278 - LOCATION
      ?auto_15279 - CITY
      ?auto_15280 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15276 ?auto_15275 ) ) ( not ( = ?auto_15277 ?auto_15275 ) ) ( not ( = ?auto_15277 ?auto_15276 ) ) ( IN-CITY ?auto_15278 ?auto_15279 ) ( IN-CITY ?auto_15274 ?auto_15279 ) ( not ( = ?auto_15274 ?auto_15278 ) ) ( OBJ-AT ?auto_15275 ?auto_15274 ) ( OBJ-AT ?auto_15277 ?auto_15278 ) ( TRUCK-AT ?auto_15280 ?auto_15274 ) ( IN-TRUCK ?auto_15276 ?auto_15280 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15275 ?auto_15277 ?auto_15274 )
      ( DELIVER-3PKG-VERIFY ?auto_15275 ?auto_15276 ?auto_15277 ?auto_15274 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15290 - OBJ
      ?auto_15291 - OBJ
      ?auto_15292 - OBJ
      ?auto_15289 - LOCATION
    )
    :vars
    (
      ?auto_15293 - LOCATION
      ?auto_15294 - CITY
      ?auto_15295 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15291 ?auto_15290 ) ) ( not ( = ?auto_15292 ?auto_15290 ) ) ( not ( = ?auto_15292 ?auto_15291 ) ) ( IN-CITY ?auto_15293 ?auto_15294 ) ( IN-CITY ?auto_15289 ?auto_15294 ) ( not ( = ?auto_15289 ?auto_15293 ) ) ( OBJ-AT ?auto_15290 ?auto_15289 ) ( OBJ-AT ?auto_15291 ?auto_15293 ) ( TRUCK-AT ?auto_15295 ?auto_15289 ) ( IN-TRUCK ?auto_15292 ?auto_15295 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15290 ?auto_15291 ?auto_15289 )
      ( DELIVER-3PKG-VERIFY ?auto_15290 ?auto_15291 ?auto_15292 ?auto_15289 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15305 - OBJ
      ?auto_15306 - OBJ
      ?auto_15307 - OBJ
      ?auto_15304 - LOCATION
    )
    :vars
    (
      ?auto_15308 - LOCATION
      ?auto_15309 - CITY
      ?auto_15310 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15306 ?auto_15305 ) ) ( not ( = ?auto_15307 ?auto_15305 ) ) ( not ( = ?auto_15307 ?auto_15306 ) ) ( IN-CITY ?auto_15308 ?auto_15309 ) ( IN-CITY ?auto_15304 ?auto_15309 ) ( not ( = ?auto_15304 ?auto_15308 ) ) ( OBJ-AT ?auto_15306 ?auto_15304 ) ( OBJ-AT ?auto_15307 ?auto_15308 ) ( TRUCK-AT ?auto_15310 ?auto_15304 ) ( IN-TRUCK ?auto_15305 ?auto_15310 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15306 ?auto_15307 ?auto_15304 )
      ( DELIVER-3PKG-VERIFY ?auto_15305 ?auto_15306 ?auto_15307 ?auto_15304 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15320 - OBJ
      ?auto_15321 - OBJ
      ?auto_15322 - OBJ
      ?auto_15319 - LOCATION
    )
    :vars
    (
      ?auto_15323 - LOCATION
      ?auto_15324 - CITY
      ?auto_15325 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15321 ?auto_15320 ) ) ( not ( = ?auto_15322 ?auto_15320 ) ) ( not ( = ?auto_15322 ?auto_15321 ) ) ( IN-CITY ?auto_15323 ?auto_15324 ) ( IN-CITY ?auto_15319 ?auto_15324 ) ( not ( = ?auto_15319 ?auto_15323 ) ) ( OBJ-AT ?auto_15322 ?auto_15319 ) ( OBJ-AT ?auto_15321 ?auto_15323 ) ( TRUCK-AT ?auto_15325 ?auto_15319 ) ( IN-TRUCK ?auto_15320 ?auto_15325 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15322 ?auto_15321 ?auto_15319 )
      ( DELIVER-3PKG-VERIFY ?auto_15320 ?auto_15321 ?auto_15322 ?auto_15319 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15351 - OBJ
      ?auto_15352 - OBJ
      ?auto_15353 - OBJ
      ?auto_15350 - LOCATION
    )
    :vars
    (
      ?auto_15354 - LOCATION
      ?auto_15355 - CITY
      ?auto_15356 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15352 ?auto_15351 ) ) ( not ( = ?auto_15353 ?auto_15351 ) ) ( not ( = ?auto_15353 ?auto_15352 ) ) ( IN-CITY ?auto_15354 ?auto_15355 ) ( IN-CITY ?auto_15350 ?auto_15355 ) ( not ( = ?auto_15350 ?auto_15354 ) ) ( OBJ-AT ?auto_15352 ?auto_15350 ) ( OBJ-AT ?auto_15351 ?auto_15354 ) ( TRUCK-AT ?auto_15356 ?auto_15350 ) ( IN-TRUCK ?auto_15353 ?auto_15356 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15352 ?auto_15351 ?auto_15350 )
      ( DELIVER-3PKG-VERIFY ?auto_15351 ?auto_15352 ?auto_15353 ?auto_15350 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15366 - OBJ
      ?auto_15367 - OBJ
      ?auto_15368 - OBJ
      ?auto_15365 - LOCATION
    )
    :vars
    (
      ?auto_15369 - LOCATION
      ?auto_15370 - CITY
      ?auto_15371 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15367 ?auto_15366 ) ) ( not ( = ?auto_15368 ?auto_15366 ) ) ( not ( = ?auto_15368 ?auto_15367 ) ) ( IN-CITY ?auto_15369 ?auto_15370 ) ( IN-CITY ?auto_15365 ?auto_15370 ) ( not ( = ?auto_15365 ?auto_15369 ) ) ( OBJ-AT ?auto_15368 ?auto_15365 ) ( OBJ-AT ?auto_15366 ?auto_15369 ) ( TRUCK-AT ?auto_15371 ?auto_15365 ) ( IN-TRUCK ?auto_15367 ?auto_15371 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15368 ?auto_15366 ?auto_15365 )
      ( DELIVER-3PKG-VERIFY ?auto_15366 ?auto_15367 ?auto_15368 ?auto_15365 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15414 - OBJ
      ?auto_15413 - LOCATION
    )
    :vars
    (
      ?auto_15416 - OBJ
      ?auto_15415 - LOCATION
      ?auto_15417 - CITY
      ?auto_15418 - OBJ
      ?auto_15419 - TRUCK
      ?auto_15420 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15414 ?auto_15416 ) ) ( IN-CITY ?auto_15415 ?auto_15417 ) ( IN-CITY ?auto_15413 ?auto_15417 ) ( not ( = ?auto_15413 ?auto_15415 ) ) ( OBJ-AT ?auto_15416 ?auto_15413 ) ( OBJ-AT ?auto_15414 ?auto_15415 ) ( not ( = ?auto_15418 ?auto_15416 ) ) ( IN-TRUCK ?auto_15418 ?auto_15419 ) ( not ( = ?auto_15414 ?auto_15418 ) ) ( TRUCK-AT ?auto_15419 ?auto_15420 ) ( IN-CITY ?auto_15420 ?auto_15417 ) ( not ( = ?auto_15413 ?auto_15420 ) ) ( not ( = ?auto_15415 ?auto_15420 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15419 ?auto_15420 ?auto_15413 ?auto_15417 )
      ( DELIVER-2PKG ?auto_15416 ?auto_15414 ?auto_15413 )
      ( DELIVER-1PKG-VERIFY ?auto_15414 ?auto_15413 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15422 - OBJ
      ?auto_15423 - OBJ
      ?auto_15421 - LOCATION
    )
    :vars
    (
      ?auto_15427 - LOCATION
      ?auto_15428 - CITY
      ?auto_15426 - OBJ
      ?auto_15424 - TRUCK
      ?auto_15425 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15423 ?auto_15422 ) ) ( IN-CITY ?auto_15427 ?auto_15428 ) ( IN-CITY ?auto_15421 ?auto_15428 ) ( not ( = ?auto_15421 ?auto_15427 ) ) ( OBJ-AT ?auto_15422 ?auto_15421 ) ( OBJ-AT ?auto_15423 ?auto_15427 ) ( not ( = ?auto_15426 ?auto_15422 ) ) ( IN-TRUCK ?auto_15426 ?auto_15424 ) ( not ( = ?auto_15423 ?auto_15426 ) ) ( TRUCK-AT ?auto_15424 ?auto_15425 ) ( IN-CITY ?auto_15425 ?auto_15428 ) ( not ( = ?auto_15421 ?auto_15425 ) ) ( not ( = ?auto_15427 ?auto_15425 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15423 ?auto_15421 )
      ( DELIVER-2PKG-VERIFY ?auto_15422 ?auto_15423 ?auto_15421 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15430 - OBJ
      ?auto_15431 - OBJ
      ?auto_15429 - LOCATION
    )
    :vars
    (
      ?auto_15432 - OBJ
      ?auto_15436 - LOCATION
      ?auto_15434 - CITY
      ?auto_15435 - TRUCK
      ?auto_15433 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15431 ?auto_15430 ) ) ( not ( = ?auto_15431 ?auto_15432 ) ) ( IN-CITY ?auto_15436 ?auto_15434 ) ( IN-CITY ?auto_15429 ?auto_15434 ) ( not ( = ?auto_15429 ?auto_15436 ) ) ( OBJ-AT ?auto_15432 ?auto_15429 ) ( OBJ-AT ?auto_15431 ?auto_15436 ) ( not ( = ?auto_15430 ?auto_15432 ) ) ( IN-TRUCK ?auto_15430 ?auto_15435 ) ( TRUCK-AT ?auto_15435 ?auto_15433 ) ( IN-CITY ?auto_15433 ?auto_15434 ) ( not ( = ?auto_15429 ?auto_15433 ) ) ( not ( = ?auto_15436 ?auto_15433 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15432 ?auto_15431 ?auto_15429 )
      ( DELIVER-2PKG-VERIFY ?auto_15430 ?auto_15431 ?auto_15429 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15438 - OBJ
      ?auto_15439 - OBJ
      ?auto_15437 - LOCATION
    )
    :vars
    (
      ?auto_15444 - LOCATION
      ?auto_15441 - CITY
      ?auto_15442 - OBJ
      ?auto_15443 - TRUCK
      ?auto_15440 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15439 ?auto_15438 ) ) ( IN-CITY ?auto_15444 ?auto_15441 ) ( IN-CITY ?auto_15437 ?auto_15441 ) ( not ( = ?auto_15437 ?auto_15444 ) ) ( OBJ-AT ?auto_15439 ?auto_15437 ) ( OBJ-AT ?auto_15438 ?auto_15444 ) ( not ( = ?auto_15442 ?auto_15439 ) ) ( IN-TRUCK ?auto_15442 ?auto_15443 ) ( not ( = ?auto_15438 ?auto_15442 ) ) ( TRUCK-AT ?auto_15443 ?auto_15440 ) ( IN-CITY ?auto_15440 ?auto_15441 ) ( not ( = ?auto_15437 ?auto_15440 ) ) ( not ( = ?auto_15444 ?auto_15440 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15439 ?auto_15438 ?auto_15437 )
      ( DELIVER-2PKG-VERIFY ?auto_15438 ?auto_15439 ?auto_15437 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15446 - OBJ
      ?auto_15447 - OBJ
      ?auto_15445 - LOCATION
    )
    :vars
    (
      ?auto_15448 - OBJ
      ?auto_15452 - LOCATION
      ?auto_15450 - CITY
      ?auto_15451 - TRUCK
      ?auto_15449 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15447 ?auto_15446 ) ) ( not ( = ?auto_15446 ?auto_15448 ) ) ( IN-CITY ?auto_15452 ?auto_15450 ) ( IN-CITY ?auto_15445 ?auto_15450 ) ( not ( = ?auto_15445 ?auto_15452 ) ) ( OBJ-AT ?auto_15448 ?auto_15445 ) ( OBJ-AT ?auto_15446 ?auto_15452 ) ( not ( = ?auto_15447 ?auto_15448 ) ) ( IN-TRUCK ?auto_15447 ?auto_15451 ) ( TRUCK-AT ?auto_15451 ?auto_15449 ) ( IN-CITY ?auto_15449 ?auto_15450 ) ( not ( = ?auto_15445 ?auto_15449 ) ) ( not ( = ?auto_15452 ?auto_15449 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15448 ?auto_15446 ?auto_15445 )
      ( DELIVER-2PKG-VERIFY ?auto_15446 ?auto_15447 ?auto_15445 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15472 - OBJ
      ?auto_15473 - OBJ
      ?auto_15474 - OBJ
      ?auto_15471 - LOCATION
    )
    :vars
    (
      ?auto_15478 - LOCATION
      ?auto_15476 - CITY
      ?auto_15477 - TRUCK
      ?auto_15475 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15473 ?auto_15472 ) ) ( not ( = ?auto_15474 ?auto_15472 ) ) ( not ( = ?auto_15474 ?auto_15473 ) ) ( IN-CITY ?auto_15478 ?auto_15476 ) ( IN-CITY ?auto_15471 ?auto_15476 ) ( not ( = ?auto_15471 ?auto_15478 ) ) ( OBJ-AT ?auto_15472 ?auto_15471 ) ( OBJ-AT ?auto_15474 ?auto_15478 ) ( IN-TRUCK ?auto_15473 ?auto_15477 ) ( TRUCK-AT ?auto_15477 ?auto_15475 ) ( IN-CITY ?auto_15475 ?auto_15476 ) ( not ( = ?auto_15471 ?auto_15475 ) ) ( not ( = ?auto_15478 ?auto_15475 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15472 ?auto_15474 ?auto_15471 )
      ( DELIVER-3PKG-VERIFY ?auto_15472 ?auto_15473 ?auto_15474 ?auto_15471 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15489 - OBJ
      ?auto_15490 - OBJ
      ?auto_15491 - OBJ
      ?auto_15488 - LOCATION
    )
    :vars
    (
      ?auto_15495 - LOCATION
      ?auto_15493 - CITY
      ?auto_15494 - TRUCK
      ?auto_15492 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15490 ?auto_15489 ) ) ( not ( = ?auto_15491 ?auto_15489 ) ) ( not ( = ?auto_15491 ?auto_15490 ) ) ( IN-CITY ?auto_15495 ?auto_15493 ) ( IN-CITY ?auto_15488 ?auto_15493 ) ( not ( = ?auto_15488 ?auto_15495 ) ) ( OBJ-AT ?auto_15489 ?auto_15488 ) ( OBJ-AT ?auto_15490 ?auto_15495 ) ( IN-TRUCK ?auto_15491 ?auto_15494 ) ( TRUCK-AT ?auto_15494 ?auto_15492 ) ( IN-CITY ?auto_15492 ?auto_15493 ) ( not ( = ?auto_15488 ?auto_15492 ) ) ( not ( = ?auto_15495 ?auto_15492 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15489 ?auto_15490 ?auto_15488 )
      ( DELIVER-3PKG-VERIFY ?auto_15489 ?auto_15490 ?auto_15491 ?auto_15488 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15506 - OBJ
      ?auto_15507 - OBJ
      ?auto_15508 - OBJ
      ?auto_15505 - LOCATION
    )
    :vars
    (
      ?auto_15512 - LOCATION
      ?auto_15510 - CITY
      ?auto_15511 - TRUCK
      ?auto_15509 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15507 ?auto_15506 ) ) ( not ( = ?auto_15508 ?auto_15506 ) ) ( not ( = ?auto_15508 ?auto_15507 ) ) ( IN-CITY ?auto_15512 ?auto_15510 ) ( IN-CITY ?auto_15505 ?auto_15510 ) ( not ( = ?auto_15505 ?auto_15512 ) ) ( OBJ-AT ?auto_15507 ?auto_15505 ) ( OBJ-AT ?auto_15508 ?auto_15512 ) ( IN-TRUCK ?auto_15506 ?auto_15511 ) ( TRUCK-AT ?auto_15511 ?auto_15509 ) ( IN-CITY ?auto_15509 ?auto_15510 ) ( not ( = ?auto_15505 ?auto_15509 ) ) ( not ( = ?auto_15512 ?auto_15509 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15507 ?auto_15508 ?auto_15505 )
      ( DELIVER-3PKG-VERIFY ?auto_15506 ?auto_15507 ?auto_15508 ?auto_15505 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15523 - OBJ
      ?auto_15524 - OBJ
      ?auto_15525 - OBJ
      ?auto_15522 - LOCATION
    )
    :vars
    (
      ?auto_15529 - LOCATION
      ?auto_15527 - CITY
      ?auto_15528 - TRUCK
      ?auto_15526 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15524 ?auto_15523 ) ) ( not ( = ?auto_15525 ?auto_15523 ) ) ( not ( = ?auto_15525 ?auto_15524 ) ) ( IN-CITY ?auto_15529 ?auto_15527 ) ( IN-CITY ?auto_15522 ?auto_15527 ) ( not ( = ?auto_15522 ?auto_15529 ) ) ( OBJ-AT ?auto_15525 ?auto_15522 ) ( OBJ-AT ?auto_15524 ?auto_15529 ) ( IN-TRUCK ?auto_15523 ?auto_15528 ) ( TRUCK-AT ?auto_15528 ?auto_15526 ) ( IN-CITY ?auto_15526 ?auto_15527 ) ( not ( = ?auto_15522 ?auto_15526 ) ) ( not ( = ?auto_15529 ?auto_15526 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15525 ?auto_15524 ?auto_15522 )
      ( DELIVER-3PKG-VERIFY ?auto_15523 ?auto_15524 ?auto_15525 ?auto_15522 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15558 - OBJ
      ?auto_15559 - OBJ
      ?auto_15560 - OBJ
      ?auto_15557 - LOCATION
    )
    :vars
    (
      ?auto_15564 - LOCATION
      ?auto_15562 - CITY
      ?auto_15563 - TRUCK
      ?auto_15561 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15559 ?auto_15558 ) ) ( not ( = ?auto_15560 ?auto_15558 ) ) ( not ( = ?auto_15560 ?auto_15559 ) ) ( IN-CITY ?auto_15564 ?auto_15562 ) ( IN-CITY ?auto_15557 ?auto_15562 ) ( not ( = ?auto_15557 ?auto_15564 ) ) ( OBJ-AT ?auto_15559 ?auto_15557 ) ( OBJ-AT ?auto_15558 ?auto_15564 ) ( IN-TRUCK ?auto_15560 ?auto_15563 ) ( TRUCK-AT ?auto_15563 ?auto_15561 ) ( IN-CITY ?auto_15561 ?auto_15562 ) ( not ( = ?auto_15557 ?auto_15561 ) ) ( not ( = ?auto_15564 ?auto_15561 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15559 ?auto_15558 ?auto_15557 )
      ( DELIVER-3PKG-VERIFY ?auto_15558 ?auto_15559 ?auto_15560 ?auto_15557 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15575 - OBJ
      ?auto_15576 - OBJ
      ?auto_15577 - OBJ
      ?auto_15574 - LOCATION
    )
    :vars
    (
      ?auto_15581 - LOCATION
      ?auto_15579 - CITY
      ?auto_15580 - TRUCK
      ?auto_15578 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15576 ?auto_15575 ) ) ( not ( = ?auto_15577 ?auto_15575 ) ) ( not ( = ?auto_15577 ?auto_15576 ) ) ( IN-CITY ?auto_15581 ?auto_15579 ) ( IN-CITY ?auto_15574 ?auto_15579 ) ( not ( = ?auto_15574 ?auto_15581 ) ) ( OBJ-AT ?auto_15577 ?auto_15574 ) ( OBJ-AT ?auto_15575 ?auto_15581 ) ( IN-TRUCK ?auto_15576 ?auto_15580 ) ( TRUCK-AT ?auto_15580 ?auto_15578 ) ( IN-CITY ?auto_15578 ?auto_15579 ) ( not ( = ?auto_15574 ?auto_15578 ) ) ( not ( = ?auto_15581 ?auto_15578 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15577 ?auto_15575 ?auto_15574 )
      ( DELIVER-3PKG-VERIFY ?auto_15575 ?auto_15576 ?auto_15577 ?auto_15574 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15629 - OBJ
      ?auto_15628 - LOCATION
    )
    :vars
    (
      ?auto_15630 - OBJ
      ?auto_15635 - LOCATION
      ?auto_15632 - CITY
      ?auto_15633 - OBJ
      ?auto_15634 - TRUCK
      ?auto_15631 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15629 ?auto_15630 ) ) ( IN-CITY ?auto_15635 ?auto_15632 ) ( IN-CITY ?auto_15628 ?auto_15632 ) ( not ( = ?auto_15628 ?auto_15635 ) ) ( OBJ-AT ?auto_15630 ?auto_15628 ) ( OBJ-AT ?auto_15629 ?auto_15635 ) ( not ( = ?auto_15633 ?auto_15630 ) ) ( not ( = ?auto_15629 ?auto_15633 ) ) ( TRUCK-AT ?auto_15634 ?auto_15631 ) ( IN-CITY ?auto_15631 ?auto_15632 ) ( not ( = ?auto_15628 ?auto_15631 ) ) ( not ( = ?auto_15635 ?auto_15631 ) ) ( OBJ-AT ?auto_15633 ?auto_15631 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15633 ?auto_15634 ?auto_15631 )
      ( DELIVER-2PKG ?auto_15630 ?auto_15629 ?auto_15628 )
      ( DELIVER-1PKG-VERIFY ?auto_15629 ?auto_15628 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15637 - OBJ
      ?auto_15638 - OBJ
      ?auto_15636 - LOCATION
    )
    :vars
    (
      ?auto_15643 - LOCATION
      ?auto_15639 - CITY
      ?auto_15642 - OBJ
      ?auto_15641 - TRUCK
      ?auto_15640 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15638 ?auto_15637 ) ) ( IN-CITY ?auto_15643 ?auto_15639 ) ( IN-CITY ?auto_15636 ?auto_15639 ) ( not ( = ?auto_15636 ?auto_15643 ) ) ( OBJ-AT ?auto_15637 ?auto_15636 ) ( OBJ-AT ?auto_15638 ?auto_15643 ) ( not ( = ?auto_15642 ?auto_15637 ) ) ( not ( = ?auto_15638 ?auto_15642 ) ) ( TRUCK-AT ?auto_15641 ?auto_15640 ) ( IN-CITY ?auto_15640 ?auto_15639 ) ( not ( = ?auto_15636 ?auto_15640 ) ) ( not ( = ?auto_15643 ?auto_15640 ) ) ( OBJ-AT ?auto_15642 ?auto_15640 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15638 ?auto_15636 )
      ( DELIVER-2PKG-VERIFY ?auto_15637 ?auto_15638 ?auto_15636 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15645 - OBJ
      ?auto_15646 - OBJ
      ?auto_15644 - LOCATION
    )
    :vars
    (
      ?auto_15651 - OBJ
      ?auto_15649 - LOCATION
      ?auto_15648 - CITY
      ?auto_15647 - TRUCK
      ?auto_15650 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15646 ?auto_15645 ) ) ( not ( = ?auto_15646 ?auto_15651 ) ) ( IN-CITY ?auto_15649 ?auto_15648 ) ( IN-CITY ?auto_15644 ?auto_15648 ) ( not ( = ?auto_15644 ?auto_15649 ) ) ( OBJ-AT ?auto_15651 ?auto_15644 ) ( OBJ-AT ?auto_15646 ?auto_15649 ) ( not ( = ?auto_15645 ?auto_15651 ) ) ( TRUCK-AT ?auto_15647 ?auto_15650 ) ( IN-CITY ?auto_15650 ?auto_15648 ) ( not ( = ?auto_15644 ?auto_15650 ) ) ( not ( = ?auto_15649 ?auto_15650 ) ) ( OBJ-AT ?auto_15645 ?auto_15650 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15651 ?auto_15646 ?auto_15644 )
      ( DELIVER-2PKG-VERIFY ?auto_15645 ?auto_15646 ?auto_15644 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15653 - OBJ
      ?auto_15654 - OBJ
      ?auto_15652 - LOCATION
    )
    :vars
    (
      ?auto_15658 - LOCATION
      ?auto_15656 - CITY
      ?auto_15657 - OBJ
      ?auto_15655 - TRUCK
      ?auto_15659 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15654 ?auto_15653 ) ) ( IN-CITY ?auto_15658 ?auto_15656 ) ( IN-CITY ?auto_15652 ?auto_15656 ) ( not ( = ?auto_15652 ?auto_15658 ) ) ( OBJ-AT ?auto_15654 ?auto_15652 ) ( OBJ-AT ?auto_15653 ?auto_15658 ) ( not ( = ?auto_15657 ?auto_15654 ) ) ( not ( = ?auto_15653 ?auto_15657 ) ) ( TRUCK-AT ?auto_15655 ?auto_15659 ) ( IN-CITY ?auto_15659 ?auto_15656 ) ( not ( = ?auto_15652 ?auto_15659 ) ) ( not ( = ?auto_15658 ?auto_15659 ) ) ( OBJ-AT ?auto_15657 ?auto_15659 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15654 ?auto_15653 ?auto_15652 )
      ( DELIVER-2PKG-VERIFY ?auto_15653 ?auto_15654 ?auto_15652 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15661 - OBJ
      ?auto_15662 - OBJ
      ?auto_15660 - LOCATION
    )
    :vars
    (
      ?auto_15667 - OBJ
      ?auto_15665 - LOCATION
      ?auto_15664 - CITY
      ?auto_15663 - TRUCK
      ?auto_15666 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15662 ?auto_15661 ) ) ( not ( = ?auto_15661 ?auto_15667 ) ) ( IN-CITY ?auto_15665 ?auto_15664 ) ( IN-CITY ?auto_15660 ?auto_15664 ) ( not ( = ?auto_15660 ?auto_15665 ) ) ( OBJ-AT ?auto_15667 ?auto_15660 ) ( OBJ-AT ?auto_15661 ?auto_15665 ) ( not ( = ?auto_15662 ?auto_15667 ) ) ( TRUCK-AT ?auto_15663 ?auto_15666 ) ( IN-CITY ?auto_15666 ?auto_15664 ) ( not ( = ?auto_15660 ?auto_15666 ) ) ( not ( = ?auto_15665 ?auto_15666 ) ) ( OBJ-AT ?auto_15662 ?auto_15666 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15667 ?auto_15661 ?auto_15660 )
      ( DELIVER-2PKG-VERIFY ?auto_15661 ?auto_15662 ?auto_15660 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15687 - OBJ
      ?auto_15688 - OBJ
      ?auto_15689 - OBJ
      ?auto_15686 - LOCATION
    )
    :vars
    (
      ?auto_15692 - LOCATION
      ?auto_15691 - CITY
      ?auto_15690 - TRUCK
      ?auto_15693 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15688 ?auto_15687 ) ) ( not ( = ?auto_15689 ?auto_15687 ) ) ( not ( = ?auto_15689 ?auto_15688 ) ) ( IN-CITY ?auto_15692 ?auto_15691 ) ( IN-CITY ?auto_15686 ?auto_15691 ) ( not ( = ?auto_15686 ?auto_15692 ) ) ( OBJ-AT ?auto_15687 ?auto_15686 ) ( OBJ-AT ?auto_15689 ?auto_15692 ) ( TRUCK-AT ?auto_15690 ?auto_15693 ) ( IN-CITY ?auto_15693 ?auto_15691 ) ( not ( = ?auto_15686 ?auto_15693 ) ) ( not ( = ?auto_15692 ?auto_15693 ) ) ( OBJ-AT ?auto_15688 ?auto_15693 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15687 ?auto_15689 ?auto_15686 )
      ( DELIVER-3PKG-VERIFY ?auto_15687 ?auto_15688 ?auto_15689 ?auto_15686 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15704 - OBJ
      ?auto_15705 - OBJ
      ?auto_15706 - OBJ
      ?auto_15703 - LOCATION
    )
    :vars
    (
      ?auto_15709 - LOCATION
      ?auto_15708 - CITY
      ?auto_15707 - TRUCK
      ?auto_15710 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15705 ?auto_15704 ) ) ( not ( = ?auto_15706 ?auto_15704 ) ) ( not ( = ?auto_15706 ?auto_15705 ) ) ( IN-CITY ?auto_15709 ?auto_15708 ) ( IN-CITY ?auto_15703 ?auto_15708 ) ( not ( = ?auto_15703 ?auto_15709 ) ) ( OBJ-AT ?auto_15704 ?auto_15703 ) ( OBJ-AT ?auto_15705 ?auto_15709 ) ( TRUCK-AT ?auto_15707 ?auto_15710 ) ( IN-CITY ?auto_15710 ?auto_15708 ) ( not ( = ?auto_15703 ?auto_15710 ) ) ( not ( = ?auto_15709 ?auto_15710 ) ) ( OBJ-AT ?auto_15706 ?auto_15710 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15704 ?auto_15705 ?auto_15703 )
      ( DELIVER-3PKG-VERIFY ?auto_15704 ?auto_15705 ?auto_15706 ?auto_15703 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15721 - OBJ
      ?auto_15722 - OBJ
      ?auto_15723 - OBJ
      ?auto_15720 - LOCATION
    )
    :vars
    (
      ?auto_15726 - LOCATION
      ?auto_15725 - CITY
      ?auto_15724 - TRUCK
      ?auto_15727 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15722 ?auto_15721 ) ) ( not ( = ?auto_15723 ?auto_15721 ) ) ( not ( = ?auto_15723 ?auto_15722 ) ) ( IN-CITY ?auto_15726 ?auto_15725 ) ( IN-CITY ?auto_15720 ?auto_15725 ) ( not ( = ?auto_15720 ?auto_15726 ) ) ( OBJ-AT ?auto_15722 ?auto_15720 ) ( OBJ-AT ?auto_15723 ?auto_15726 ) ( TRUCK-AT ?auto_15724 ?auto_15727 ) ( IN-CITY ?auto_15727 ?auto_15725 ) ( not ( = ?auto_15720 ?auto_15727 ) ) ( not ( = ?auto_15726 ?auto_15727 ) ) ( OBJ-AT ?auto_15721 ?auto_15727 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15722 ?auto_15723 ?auto_15720 )
      ( DELIVER-3PKG-VERIFY ?auto_15721 ?auto_15722 ?auto_15723 ?auto_15720 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15738 - OBJ
      ?auto_15739 - OBJ
      ?auto_15740 - OBJ
      ?auto_15737 - LOCATION
    )
    :vars
    (
      ?auto_15743 - LOCATION
      ?auto_15742 - CITY
      ?auto_15741 - TRUCK
      ?auto_15744 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15739 ?auto_15738 ) ) ( not ( = ?auto_15740 ?auto_15738 ) ) ( not ( = ?auto_15740 ?auto_15739 ) ) ( IN-CITY ?auto_15743 ?auto_15742 ) ( IN-CITY ?auto_15737 ?auto_15742 ) ( not ( = ?auto_15737 ?auto_15743 ) ) ( OBJ-AT ?auto_15740 ?auto_15737 ) ( OBJ-AT ?auto_15739 ?auto_15743 ) ( TRUCK-AT ?auto_15741 ?auto_15744 ) ( IN-CITY ?auto_15744 ?auto_15742 ) ( not ( = ?auto_15737 ?auto_15744 ) ) ( not ( = ?auto_15743 ?auto_15744 ) ) ( OBJ-AT ?auto_15738 ?auto_15744 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15740 ?auto_15739 ?auto_15737 )
      ( DELIVER-3PKG-VERIFY ?auto_15738 ?auto_15739 ?auto_15740 ?auto_15737 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15773 - OBJ
      ?auto_15774 - OBJ
      ?auto_15775 - OBJ
      ?auto_15772 - LOCATION
    )
    :vars
    (
      ?auto_15778 - LOCATION
      ?auto_15777 - CITY
      ?auto_15776 - TRUCK
      ?auto_15779 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15774 ?auto_15773 ) ) ( not ( = ?auto_15775 ?auto_15773 ) ) ( not ( = ?auto_15775 ?auto_15774 ) ) ( IN-CITY ?auto_15778 ?auto_15777 ) ( IN-CITY ?auto_15772 ?auto_15777 ) ( not ( = ?auto_15772 ?auto_15778 ) ) ( OBJ-AT ?auto_15774 ?auto_15772 ) ( OBJ-AT ?auto_15773 ?auto_15778 ) ( TRUCK-AT ?auto_15776 ?auto_15779 ) ( IN-CITY ?auto_15779 ?auto_15777 ) ( not ( = ?auto_15772 ?auto_15779 ) ) ( not ( = ?auto_15778 ?auto_15779 ) ) ( OBJ-AT ?auto_15775 ?auto_15779 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15774 ?auto_15773 ?auto_15772 )
      ( DELIVER-3PKG-VERIFY ?auto_15773 ?auto_15774 ?auto_15775 ?auto_15772 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15790 - OBJ
      ?auto_15791 - OBJ
      ?auto_15792 - OBJ
      ?auto_15789 - LOCATION
    )
    :vars
    (
      ?auto_15795 - LOCATION
      ?auto_15794 - CITY
      ?auto_15793 - TRUCK
      ?auto_15796 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_15791 ?auto_15790 ) ) ( not ( = ?auto_15792 ?auto_15790 ) ) ( not ( = ?auto_15792 ?auto_15791 ) ) ( IN-CITY ?auto_15795 ?auto_15794 ) ( IN-CITY ?auto_15789 ?auto_15794 ) ( not ( = ?auto_15789 ?auto_15795 ) ) ( OBJ-AT ?auto_15792 ?auto_15789 ) ( OBJ-AT ?auto_15790 ?auto_15795 ) ( TRUCK-AT ?auto_15793 ?auto_15796 ) ( IN-CITY ?auto_15796 ?auto_15794 ) ( not ( = ?auto_15789 ?auto_15796 ) ) ( not ( = ?auto_15795 ?auto_15796 ) ) ( OBJ-AT ?auto_15791 ?auto_15796 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15792 ?auto_15790 ?auto_15789 )
      ( DELIVER-3PKG-VERIFY ?auto_15790 ?auto_15791 ?auto_15792 ?auto_15789 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15844 - OBJ
      ?auto_15843 - LOCATION
    )
    :vars
    (
      ?auto_15850 - OBJ
      ?auto_15848 - LOCATION
      ?auto_15846 - CITY
      ?auto_15847 - OBJ
      ?auto_15849 - LOCATION
      ?auto_15845 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15844 ?auto_15850 ) ) ( IN-CITY ?auto_15848 ?auto_15846 ) ( IN-CITY ?auto_15843 ?auto_15846 ) ( not ( = ?auto_15843 ?auto_15848 ) ) ( OBJ-AT ?auto_15850 ?auto_15843 ) ( OBJ-AT ?auto_15844 ?auto_15848 ) ( not ( = ?auto_15847 ?auto_15850 ) ) ( not ( = ?auto_15844 ?auto_15847 ) ) ( IN-CITY ?auto_15849 ?auto_15846 ) ( not ( = ?auto_15843 ?auto_15849 ) ) ( not ( = ?auto_15848 ?auto_15849 ) ) ( OBJ-AT ?auto_15847 ?auto_15849 ) ( TRUCK-AT ?auto_15845 ?auto_15843 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15845 ?auto_15843 ?auto_15849 ?auto_15846 )
      ( DELIVER-2PKG ?auto_15850 ?auto_15844 ?auto_15843 )
      ( DELIVER-1PKG-VERIFY ?auto_15844 ?auto_15843 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15852 - OBJ
      ?auto_15853 - OBJ
      ?auto_15851 - LOCATION
    )
    :vars
    (
      ?auto_15855 - LOCATION
      ?auto_15854 - CITY
      ?auto_15856 - OBJ
      ?auto_15858 - LOCATION
      ?auto_15857 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15853 ?auto_15852 ) ) ( IN-CITY ?auto_15855 ?auto_15854 ) ( IN-CITY ?auto_15851 ?auto_15854 ) ( not ( = ?auto_15851 ?auto_15855 ) ) ( OBJ-AT ?auto_15852 ?auto_15851 ) ( OBJ-AT ?auto_15853 ?auto_15855 ) ( not ( = ?auto_15856 ?auto_15852 ) ) ( not ( = ?auto_15853 ?auto_15856 ) ) ( IN-CITY ?auto_15858 ?auto_15854 ) ( not ( = ?auto_15851 ?auto_15858 ) ) ( not ( = ?auto_15855 ?auto_15858 ) ) ( OBJ-AT ?auto_15856 ?auto_15858 ) ( TRUCK-AT ?auto_15857 ?auto_15851 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15853 ?auto_15851 )
      ( DELIVER-2PKG-VERIFY ?auto_15852 ?auto_15853 ?auto_15851 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15860 - OBJ
      ?auto_15861 - OBJ
      ?auto_15859 - LOCATION
    )
    :vars
    (
      ?auto_15866 - OBJ
      ?auto_15862 - LOCATION
      ?auto_15863 - CITY
      ?auto_15865 - LOCATION
      ?auto_15864 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15861 ?auto_15860 ) ) ( not ( = ?auto_15861 ?auto_15866 ) ) ( IN-CITY ?auto_15862 ?auto_15863 ) ( IN-CITY ?auto_15859 ?auto_15863 ) ( not ( = ?auto_15859 ?auto_15862 ) ) ( OBJ-AT ?auto_15866 ?auto_15859 ) ( OBJ-AT ?auto_15861 ?auto_15862 ) ( not ( = ?auto_15860 ?auto_15866 ) ) ( IN-CITY ?auto_15865 ?auto_15863 ) ( not ( = ?auto_15859 ?auto_15865 ) ) ( not ( = ?auto_15862 ?auto_15865 ) ) ( OBJ-AT ?auto_15860 ?auto_15865 ) ( TRUCK-AT ?auto_15864 ?auto_15859 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15866 ?auto_15861 ?auto_15859 )
      ( DELIVER-2PKG-VERIFY ?auto_15860 ?auto_15861 ?auto_15859 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15868 - OBJ
      ?auto_15869 - OBJ
      ?auto_15867 - LOCATION
    )
    :vars
    (
      ?auto_15870 - LOCATION
      ?auto_15871 - CITY
      ?auto_15872 - OBJ
      ?auto_15874 - LOCATION
      ?auto_15873 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15869 ?auto_15868 ) ) ( IN-CITY ?auto_15870 ?auto_15871 ) ( IN-CITY ?auto_15867 ?auto_15871 ) ( not ( = ?auto_15867 ?auto_15870 ) ) ( OBJ-AT ?auto_15869 ?auto_15867 ) ( OBJ-AT ?auto_15868 ?auto_15870 ) ( not ( = ?auto_15872 ?auto_15869 ) ) ( not ( = ?auto_15868 ?auto_15872 ) ) ( IN-CITY ?auto_15874 ?auto_15871 ) ( not ( = ?auto_15867 ?auto_15874 ) ) ( not ( = ?auto_15870 ?auto_15874 ) ) ( OBJ-AT ?auto_15872 ?auto_15874 ) ( TRUCK-AT ?auto_15873 ?auto_15867 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15869 ?auto_15868 ?auto_15867 )
      ( DELIVER-2PKG-VERIFY ?auto_15868 ?auto_15869 ?auto_15867 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15876 - OBJ
      ?auto_15877 - OBJ
      ?auto_15875 - LOCATION
    )
    :vars
    (
      ?auto_15882 - OBJ
      ?auto_15878 - LOCATION
      ?auto_15879 - CITY
      ?auto_15881 - LOCATION
      ?auto_15880 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15877 ?auto_15876 ) ) ( not ( = ?auto_15876 ?auto_15882 ) ) ( IN-CITY ?auto_15878 ?auto_15879 ) ( IN-CITY ?auto_15875 ?auto_15879 ) ( not ( = ?auto_15875 ?auto_15878 ) ) ( OBJ-AT ?auto_15882 ?auto_15875 ) ( OBJ-AT ?auto_15876 ?auto_15878 ) ( not ( = ?auto_15877 ?auto_15882 ) ) ( IN-CITY ?auto_15881 ?auto_15879 ) ( not ( = ?auto_15875 ?auto_15881 ) ) ( not ( = ?auto_15878 ?auto_15881 ) ) ( OBJ-AT ?auto_15877 ?auto_15881 ) ( TRUCK-AT ?auto_15880 ?auto_15875 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15882 ?auto_15876 ?auto_15875 )
      ( DELIVER-2PKG-VERIFY ?auto_15876 ?auto_15877 ?auto_15875 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15902 - OBJ
      ?auto_15903 - OBJ
      ?auto_15904 - OBJ
      ?auto_15901 - LOCATION
    )
    :vars
    (
      ?auto_15905 - LOCATION
      ?auto_15906 - CITY
      ?auto_15908 - LOCATION
      ?auto_15907 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15903 ?auto_15902 ) ) ( not ( = ?auto_15904 ?auto_15902 ) ) ( not ( = ?auto_15904 ?auto_15903 ) ) ( IN-CITY ?auto_15905 ?auto_15906 ) ( IN-CITY ?auto_15901 ?auto_15906 ) ( not ( = ?auto_15901 ?auto_15905 ) ) ( OBJ-AT ?auto_15902 ?auto_15901 ) ( OBJ-AT ?auto_15904 ?auto_15905 ) ( IN-CITY ?auto_15908 ?auto_15906 ) ( not ( = ?auto_15901 ?auto_15908 ) ) ( not ( = ?auto_15905 ?auto_15908 ) ) ( OBJ-AT ?auto_15903 ?auto_15908 ) ( TRUCK-AT ?auto_15907 ?auto_15901 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15902 ?auto_15904 ?auto_15901 )
      ( DELIVER-3PKG-VERIFY ?auto_15902 ?auto_15903 ?auto_15904 ?auto_15901 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15919 - OBJ
      ?auto_15920 - OBJ
      ?auto_15921 - OBJ
      ?auto_15918 - LOCATION
    )
    :vars
    (
      ?auto_15922 - LOCATION
      ?auto_15923 - CITY
      ?auto_15925 - LOCATION
      ?auto_15924 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15920 ?auto_15919 ) ) ( not ( = ?auto_15921 ?auto_15919 ) ) ( not ( = ?auto_15921 ?auto_15920 ) ) ( IN-CITY ?auto_15922 ?auto_15923 ) ( IN-CITY ?auto_15918 ?auto_15923 ) ( not ( = ?auto_15918 ?auto_15922 ) ) ( OBJ-AT ?auto_15919 ?auto_15918 ) ( OBJ-AT ?auto_15920 ?auto_15922 ) ( IN-CITY ?auto_15925 ?auto_15923 ) ( not ( = ?auto_15918 ?auto_15925 ) ) ( not ( = ?auto_15922 ?auto_15925 ) ) ( OBJ-AT ?auto_15921 ?auto_15925 ) ( TRUCK-AT ?auto_15924 ?auto_15918 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15919 ?auto_15920 ?auto_15918 )
      ( DELIVER-3PKG-VERIFY ?auto_15919 ?auto_15920 ?auto_15921 ?auto_15918 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15936 - OBJ
      ?auto_15937 - OBJ
      ?auto_15938 - OBJ
      ?auto_15935 - LOCATION
    )
    :vars
    (
      ?auto_15939 - LOCATION
      ?auto_15940 - CITY
      ?auto_15942 - LOCATION
      ?auto_15941 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15937 ?auto_15936 ) ) ( not ( = ?auto_15938 ?auto_15936 ) ) ( not ( = ?auto_15938 ?auto_15937 ) ) ( IN-CITY ?auto_15939 ?auto_15940 ) ( IN-CITY ?auto_15935 ?auto_15940 ) ( not ( = ?auto_15935 ?auto_15939 ) ) ( OBJ-AT ?auto_15937 ?auto_15935 ) ( OBJ-AT ?auto_15938 ?auto_15939 ) ( IN-CITY ?auto_15942 ?auto_15940 ) ( not ( = ?auto_15935 ?auto_15942 ) ) ( not ( = ?auto_15939 ?auto_15942 ) ) ( OBJ-AT ?auto_15936 ?auto_15942 ) ( TRUCK-AT ?auto_15941 ?auto_15935 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15937 ?auto_15938 ?auto_15935 )
      ( DELIVER-3PKG-VERIFY ?auto_15936 ?auto_15937 ?auto_15938 ?auto_15935 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15953 - OBJ
      ?auto_15954 - OBJ
      ?auto_15955 - OBJ
      ?auto_15952 - LOCATION
    )
    :vars
    (
      ?auto_15956 - LOCATION
      ?auto_15957 - CITY
      ?auto_15959 - LOCATION
      ?auto_15958 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15954 ?auto_15953 ) ) ( not ( = ?auto_15955 ?auto_15953 ) ) ( not ( = ?auto_15955 ?auto_15954 ) ) ( IN-CITY ?auto_15956 ?auto_15957 ) ( IN-CITY ?auto_15952 ?auto_15957 ) ( not ( = ?auto_15952 ?auto_15956 ) ) ( OBJ-AT ?auto_15955 ?auto_15952 ) ( OBJ-AT ?auto_15954 ?auto_15956 ) ( IN-CITY ?auto_15959 ?auto_15957 ) ( not ( = ?auto_15952 ?auto_15959 ) ) ( not ( = ?auto_15956 ?auto_15959 ) ) ( OBJ-AT ?auto_15953 ?auto_15959 ) ( TRUCK-AT ?auto_15958 ?auto_15952 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15955 ?auto_15954 ?auto_15952 )
      ( DELIVER-3PKG-VERIFY ?auto_15953 ?auto_15954 ?auto_15955 ?auto_15952 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15988 - OBJ
      ?auto_15989 - OBJ
      ?auto_15990 - OBJ
      ?auto_15987 - LOCATION
    )
    :vars
    (
      ?auto_15991 - LOCATION
      ?auto_15992 - CITY
      ?auto_15994 - LOCATION
      ?auto_15993 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_15989 ?auto_15988 ) ) ( not ( = ?auto_15990 ?auto_15988 ) ) ( not ( = ?auto_15990 ?auto_15989 ) ) ( IN-CITY ?auto_15991 ?auto_15992 ) ( IN-CITY ?auto_15987 ?auto_15992 ) ( not ( = ?auto_15987 ?auto_15991 ) ) ( OBJ-AT ?auto_15989 ?auto_15987 ) ( OBJ-AT ?auto_15988 ?auto_15991 ) ( IN-CITY ?auto_15994 ?auto_15992 ) ( not ( = ?auto_15987 ?auto_15994 ) ) ( not ( = ?auto_15991 ?auto_15994 ) ) ( OBJ-AT ?auto_15990 ?auto_15994 ) ( TRUCK-AT ?auto_15993 ?auto_15987 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15989 ?auto_15988 ?auto_15987 )
      ( DELIVER-3PKG-VERIFY ?auto_15988 ?auto_15989 ?auto_15990 ?auto_15987 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16005 - OBJ
      ?auto_16006 - OBJ
      ?auto_16007 - OBJ
      ?auto_16004 - LOCATION
    )
    :vars
    (
      ?auto_16008 - LOCATION
      ?auto_16009 - CITY
      ?auto_16011 - LOCATION
      ?auto_16010 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16006 ?auto_16005 ) ) ( not ( = ?auto_16007 ?auto_16005 ) ) ( not ( = ?auto_16007 ?auto_16006 ) ) ( IN-CITY ?auto_16008 ?auto_16009 ) ( IN-CITY ?auto_16004 ?auto_16009 ) ( not ( = ?auto_16004 ?auto_16008 ) ) ( OBJ-AT ?auto_16007 ?auto_16004 ) ( OBJ-AT ?auto_16005 ?auto_16008 ) ( IN-CITY ?auto_16011 ?auto_16009 ) ( not ( = ?auto_16004 ?auto_16011 ) ) ( not ( = ?auto_16008 ?auto_16011 ) ) ( OBJ-AT ?auto_16006 ?auto_16011 ) ( TRUCK-AT ?auto_16010 ?auto_16004 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16007 ?auto_16005 ?auto_16004 )
      ( DELIVER-3PKG-VERIFY ?auto_16005 ?auto_16006 ?auto_16007 ?auto_16004 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16059 - OBJ
      ?auto_16058 - LOCATION
    )
    :vars
    (
      ?auto_16065 - OBJ
      ?auto_16060 - LOCATION
      ?auto_16061 - CITY
      ?auto_16062 - OBJ
      ?auto_16064 - LOCATION
      ?auto_16063 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16059 ?auto_16065 ) ) ( IN-CITY ?auto_16060 ?auto_16061 ) ( IN-CITY ?auto_16058 ?auto_16061 ) ( not ( = ?auto_16058 ?auto_16060 ) ) ( OBJ-AT ?auto_16059 ?auto_16060 ) ( not ( = ?auto_16062 ?auto_16065 ) ) ( not ( = ?auto_16059 ?auto_16062 ) ) ( IN-CITY ?auto_16064 ?auto_16061 ) ( not ( = ?auto_16058 ?auto_16064 ) ) ( not ( = ?auto_16060 ?auto_16064 ) ) ( OBJ-AT ?auto_16062 ?auto_16064 ) ( TRUCK-AT ?auto_16063 ?auto_16058 ) ( IN-TRUCK ?auto_16065 ?auto_16063 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16065 ?auto_16058 )
      ( DELIVER-2PKG ?auto_16065 ?auto_16059 ?auto_16058 )
      ( DELIVER-1PKG-VERIFY ?auto_16059 ?auto_16058 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16067 - OBJ
      ?auto_16068 - OBJ
      ?auto_16066 - LOCATION
    )
    :vars
    (
      ?auto_16070 - LOCATION
      ?auto_16072 - CITY
      ?auto_16071 - OBJ
      ?auto_16069 - LOCATION
      ?auto_16073 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16068 ?auto_16067 ) ) ( IN-CITY ?auto_16070 ?auto_16072 ) ( IN-CITY ?auto_16066 ?auto_16072 ) ( not ( = ?auto_16066 ?auto_16070 ) ) ( OBJ-AT ?auto_16068 ?auto_16070 ) ( not ( = ?auto_16071 ?auto_16067 ) ) ( not ( = ?auto_16068 ?auto_16071 ) ) ( IN-CITY ?auto_16069 ?auto_16072 ) ( not ( = ?auto_16066 ?auto_16069 ) ) ( not ( = ?auto_16070 ?auto_16069 ) ) ( OBJ-AT ?auto_16071 ?auto_16069 ) ( TRUCK-AT ?auto_16073 ?auto_16066 ) ( IN-TRUCK ?auto_16067 ?auto_16073 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16068 ?auto_16066 )
      ( DELIVER-2PKG-VERIFY ?auto_16067 ?auto_16068 ?auto_16066 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16075 - OBJ
      ?auto_16076 - OBJ
      ?auto_16074 - LOCATION
    )
    :vars
    (
      ?auto_16081 - OBJ
      ?auto_16080 - LOCATION
      ?auto_16078 - CITY
      ?auto_16079 - LOCATION
      ?auto_16077 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16076 ?auto_16075 ) ) ( not ( = ?auto_16076 ?auto_16081 ) ) ( IN-CITY ?auto_16080 ?auto_16078 ) ( IN-CITY ?auto_16074 ?auto_16078 ) ( not ( = ?auto_16074 ?auto_16080 ) ) ( OBJ-AT ?auto_16076 ?auto_16080 ) ( not ( = ?auto_16075 ?auto_16081 ) ) ( IN-CITY ?auto_16079 ?auto_16078 ) ( not ( = ?auto_16074 ?auto_16079 ) ) ( not ( = ?auto_16080 ?auto_16079 ) ) ( OBJ-AT ?auto_16075 ?auto_16079 ) ( TRUCK-AT ?auto_16077 ?auto_16074 ) ( IN-TRUCK ?auto_16081 ?auto_16077 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16081 ?auto_16076 ?auto_16074 )
      ( DELIVER-2PKG-VERIFY ?auto_16075 ?auto_16076 ?auto_16074 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16083 - OBJ
      ?auto_16084 - OBJ
      ?auto_16082 - LOCATION
    )
    :vars
    (
      ?auto_16089 - LOCATION
      ?auto_16087 - CITY
      ?auto_16085 - OBJ
      ?auto_16088 - LOCATION
      ?auto_16086 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16084 ?auto_16083 ) ) ( IN-CITY ?auto_16089 ?auto_16087 ) ( IN-CITY ?auto_16082 ?auto_16087 ) ( not ( = ?auto_16082 ?auto_16089 ) ) ( OBJ-AT ?auto_16083 ?auto_16089 ) ( not ( = ?auto_16085 ?auto_16084 ) ) ( not ( = ?auto_16083 ?auto_16085 ) ) ( IN-CITY ?auto_16088 ?auto_16087 ) ( not ( = ?auto_16082 ?auto_16088 ) ) ( not ( = ?auto_16089 ?auto_16088 ) ) ( OBJ-AT ?auto_16085 ?auto_16088 ) ( TRUCK-AT ?auto_16086 ?auto_16082 ) ( IN-TRUCK ?auto_16084 ?auto_16086 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16084 ?auto_16083 ?auto_16082 )
      ( DELIVER-2PKG-VERIFY ?auto_16083 ?auto_16084 ?auto_16082 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16091 - OBJ
      ?auto_16092 - OBJ
      ?auto_16090 - LOCATION
    )
    :vars
    (
      ?auto_16097 - OBJ
      ?auto_16096 - LOCATION
      ?auto_16094 - CITY
      ?auto_16095 - LOCATION
      ?auto_16093 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16092 ?auto_16091 ) ) ( not ( = ?auto_16091 ?auto_16097 ) ) ( IN-CITY ?auto_16096 ?auto_16094 ) ( IN-CITY ?auto_16090 ?auto_16094 ) ( not ( = ?auto_16090 ?auto_16096 ) ) ( OBJ-AT ?auto_16091 ?auto_16096 ) ( not ( = ?auto_16092 ?auto_16097 ) ) ( IN-CITY ?auto_16095 ?auto_16094 ) ( not ( = ?auto_16090 ?auto_16095 ) ) ( not ( = ?auto_16096 ?auto_16095 ) ) ( OBJ-AT ?auto_16092 ?auto_16095 ) ( TRUCK-AT ?auto_16093 ?auto_16090 ) ( IN-TRUCK ?auto_16097 ?auto_16093 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16097 ?auto_16091 ?auto_16090 )
      ( DELIVER-2PKG-VERIFY ?auto_16091 ?auto_16092 ?auto_16090 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16117 - OBJ
      ?auto_16118 - OBJ
      ?auto_16119 - OBJ
      ?auto_16116 - LOCATION
    )
    :vars
    (
      ?auto_16123 - LOCATION
      ?auto_16121 - CITY
      ?auto_16122 - LOCATION
      ?auto_16120 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16118 ?auto_16117 ) ) ( not ( = ?auto_16119 ?auto_16117 ) ) ( not ( = ?auto_16119 ?auto_16118 ) ) ( IN-CITY ?auto_16123 ?auto_16121 ) ( IN-CITY ?auto_16116 ?auto_16121 ) ( not ( = ?auto_16116 ?auto_16123 ) ) ( OBJ-AT ?auto_16119 ?auto_16123 ) ( IN-CITY ?auto_16122 ?auto_16121 ) ( not ( = ?auto_16116 ?auto_16122 ) ) ( not ( = ?auto_16123 ?auto_16122 ) ) ( OBJ-AT ?auto_16118 ?auto_16122 ) ( TRUCK-AT ?auto_16120 ?auto_16116 ) ( IN-TRUCK ?auto_16117 ?auto_16120 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16117 ?auto_16119 ?auto_16116 )
      ( DELIVER-3PKG-VERIFY ?auto_16117 ?auto_16118 ?auto_16119 ?auto_16116 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16134 - OBJ
      ?auto_16135 - OBJ
      ?auto_16136 - OBJ
      ?auto_16133 - LOCATION
    )
    :vars
    (
      ?auto_16140 - LOCATION
      ?auto_16138 - CITY
      ?auto_16139 - LOCATION
      ?auto_16137 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16135 ?auto_16134 ) ) ( not ( = ?auto_16136 ?auto_16134 ) ) ( not ( = ?auto_16136 ?auto_16135 ) ) ( IN-CITY ?auto_16140 ?auto_16138 ) ( IN-CITY ?auto_16133 ?auto_16138 ) ( not ( = ?auto_16133 ?auto_16140 ) ) ( OBJ-AT ?auto_16135 ?auto_16140 ) ( IN-CITY ?auto_16139 ?auto_16138 ) ( not ( = ?auto_16133 ?auto_16139 ) ) ( not ( = ?auto_16140 ?auto_16139 ) ) ( OBJ-AT ?auto_16136 ?auto_16139 ) ( TRUCK-AT ?auto_16137 ?auto_16133 ) ( IN-TRUCK ?auto_16134 ?auto_16137 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16134 ?auto_16135 ?auto_16133 )
      ( DELIVER-3PKG-VERIFY ?auto_16134 ?auto_16135 ?auto_16136 ?auto_16133 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16151 - OBJ
      ?auto_16152 - OBJ
      ?auto_16153 - OBJ
      ?auto_16150 - LOCATION
    )
    :vars
    (
      ?auto_16157 - LOCATION
      ?auto_16155 - CITY
      ?auto_16156 - LOCATION
      ?auto_16154 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16152 ?auto_16151 ) ) ( not ( = ?auto_16153 ?auto_16151 ) ) ( not ( = ?auto_16153 ?auto_16152 ) ) ( IN-CITY ?auto_16157 ?auto_16155 ) ( IN-CITY ?auto_16150 ?auto_16155 ) ( not ( = ?auto_16150 ?auto_16157 ) ) ( OBJ-AT ?auto_16153 ?auto_16157 ) ( IN-CITY ?auto_16156 ?auto_16155 ) ( not ( = ?auto_16150 ?auto_16156 ) ) ( not ( = ?auto_16157 ?auto_16156 ) ) ( OBJ-AT ?auto_16151 ?auto_16156 ) ( TRUCK-AT ?auto_16154 ?auto_16150 ) ( IN-TRUCK ?auto_16152 ?auto_16154 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16152 ?auto_16153 ?auto_16150 )
      ( DELIVER-3PKG-VERIFY ?auto_16151 ?auto_16152 ?auto_16153 ?auto_16150 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16168 - OBJ
      ?auto_16169 - OBJ
      ?auto_16170 - OBJ
      ?auto_16167 - LOCATION
    )
    :vars
    (
      ?auto_16174 - LOCATION
      ?auto_16172 - CITY
      ?auto_16173 - LOCATION
      ?auto_16171 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16169 ?auto_16168 ) ) ( not ( = ?auto_16170 ?auto_16168 ) ) ( not ( = ?auto_16170 ?auto_16169 ) ) ( IN-CITY ?auto_16174 ?auto_16172 ) ( IN-CITY ?auto_16167 ?auto_16172 ) ( not ( = ?auto_16167 ?auto_16174 ) ) ( OBJ-AT ?auto_16169 ?auto_16174 ) ( IN-CITY ?auto_16173 ?auto_16172 ) ( not ( = ?auto_16167 ?auto_16173 ) ) ( not ( = ?auto_16174 ?auto_16173 ) ) ( OBJ-AT ?auto_16168 ?auto_16173 ) ( TRUCK-AT ?auto_16171 ?auto_16167 ) ( IN-TRUCK ?auto_16170 ?auto_16171 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16170 ?auto_16169 ?auto_16167 )
      ( DELIVER-3PKG-VERIFY ?auto_16168 ?auto_16169 ?auto_16170 ?auto_16167 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16203 - OBJ
      ?auto_16204 - OBJ
      ?auto_16205 - OBJ
      ?auto_16202 - LOCATION
    )
    :vars
    (
      ?auto_16209 - LOCATION
      ?auto_16207 - CITY
      ?auto_16208 - LOCATION
      ?auto_16206 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16204 ?auto_16203 ) ) ( not ( = ?auto_16205 ?auto_16203 ) ) ( not ( = ?auto_16205 ?auto_16204 ) ) ( IN-CITY ?auto_16209 ?auto_16207 ) ( IN-CITY ?auto_16202 ?auto_16207 ) ( not ( = ?auto_16202 ?auto_16209 ) ) ( OBJ-AT ?auto_16203 ?auto_16209 ) ( IN-CITY ?auto_16208 ?auto_16207 ) ( not ( = ?auto_16202 ?auto_16208 ) ) ( not ( = ?auto_16209 ?auto_16208 ) ) ( OBJ-AT ?auto_16205 ?auto_16208 ) ( TRUCK-AT ?auto_16206 ?auto_16202 ) ( IN-TRUCK ?auto_16204 ?auto_16206 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16204 ?auto_16203 ?auto_16202 )
      ( DELIVER-3PKG-VERIFY ?auto_16203 ?auto_16204 ?auto_16205 ?auto_16202 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16220 - OBJ
      ?auto_16221 - OBJ
      ?auto_16222 - OBJ
      ?auto_16219 - LOCATION
    )
    :vars
    (
      ?auto_16226 - LOCATION
      ?auto_16224 - CITY
      ?auto_16225 - LOCATION
      ?auto_16223 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16221 ?auto_16220 ) ) ( not ( = ?auto_16222 ?auto_16220 ) ) ( not ( = ?auto_16222 ?auto_16221 ) ) ( IN-CITY ?auto_16226 ?auto_16224 ) ( IN-CITY ?auto_16219 ?auto_16224 ) ( not ( = ?auto_16219 ?auto_16226 ) ) ( OBJ-AT ?auto_16220 ?auto_16226 ) ( IN-CITY ?auto_16225 ?auto_16224 ) ( not ( = ?auto_16219 ?auto_16225 ) ) ( not ( = ?auto_16226 ?auto_16225 ) ) ( OBJ-AT ?auto_16221 ?auto_16225 ) ( TRUCK-AT ?auto_16223 ?auto_16219 ) ( IN-TRUCK ?auto_16222 ?auto_16223 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16222 ?auto_16220 ?auto_16219 )
      ( DELIVER-3PKG-VERIFY ?auto_16220 ?auto_16221 ?auto_16222 ?auto_16219 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16274 - OBJ
      ?auto_16273 - LOCATION
    )
    :vars
    (
      ?auto_16280 - OBJ
      ?auto_16279 - LOCATION
      ?auto_16277 - CITY
      ?auto_16275 - OBJ
      ?auto_16278 - LOCATION
      ?auto_16276 - TRUCK
      ?auto_16281 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16274 ?auto_16280 ) ) ( IN-CITY ?auto_16279 ?auto_16277 ) ( IN-CITY ?auto_16273 ?auto_16277 ) ( not ( = ?auto_16273 ?auto_16279 ) ) ( OBJ-AT ?auto_16274 ?auto_16279 ) ( not ( = ?auto_16275 ?auto_16280 ) ) ( not ( = ?auto_16274 ?auto_16275 ) ) ( IN-CITY ?auto_16278 ?auto_16277 ) ( not ( = ?auto_16273 ?auto_16278 ) ) ( not ( = ?auto_16279 ?auto_16278 ) ) ( OBJ-AT ?auto_16275 ?auto_16278 ) ( IN-TRUCK ?auto_16280 ?auto_16276 ) ( TRUCK-AT ?auto_16276 ?auto_16281 ) ( IN-CITY ?auto_16281 ?auto_16277 ) ( not ( = ?auto_16273 ?auto_16281 ) ) ( not ( = ?auto_16279 ?auto_16281 ) ) ( not ( = ?auto_16278 ?auto_16281 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16276 ?auto_16281 ?auto_16273 ?auto_16277 )
      ( DELIVER-2PKG ?auto_16280 ?auto_16274 ?auto_16273 )
      ( DELIVER-1PKG-VERIFY ?auto_16274 ?auto_16273 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16283 - OBJ
      ?auto_16284 - OBJ
      ?auto_16282 - LOCATION
    )
    :vars
    (
      ?auto_16288 - LOCATION
      ?auto_16286 - CITY
      ?auto_16290 - OBJ
      ?auto_16289 - LOCATION
      ?auto_16287 - TRUCK
      ?auto_16285 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16284 ?auto_16283 ) ) ( IN-CITY ?auto_16288 ?auto_16286 ) ( IN-CITY ?auto_16282 ?auto_16286 ) ( not ( = ?auto_16282 ?auto_16288 ) ) ( OBJ-AT ?auto_16284 ?auto_16288 ) ( not ( = ?auto_16290 ?auto_16283 ) ) ( not ( = ?auto_16284 ?auto_16290 ) ) ( IN-CITY ?auto_16289 ?auto_16286 ) ( not ( = ?auto_16282 ?auto_16289 ) ) ( not ( = ?auto_16288 ?auto_16289 ) ) ( OBJ-AT ?auto_16290 ?auto_16289 ) ( IN-TRUCK ?auto_16283 ?auto_16287 ) ( TRUCK-AT ?auto_16287 ?auto_16285 ) ( IN-CITY ?auto_16285 ?auto_16286 ) ( not ( = ?auto_16282 ?auto_16285 ) ) ( not ( = ?auto_16288 ?auto_16285 ) ) ( not ( = ?auto_16289 ?auto_16285 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16284 ?auto_16282 )
      ( DELIVER-2PKG-VERIFY ?auto_16283 ?auto_16284 ?auto_16282 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16292 - OBJ
      ?auto_16293 - OBJ
      ?auto_16291 - LOCATION
    )
    :vars
    (
      ?auto_16299 - OBJ
      ?auto_16297 - LOCATION
      ?auto_16296 - CITY
      ?auto_16294 - LOCATION
      ?auto_16295 - TRUCK
      ?auto_16298 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16293 ?auto_16292 ) ) ( not ( = ?auto_16293 ?auto_16299 ) ) ( IN-CITY ?auto_16297 ?auto_16296 ) ( IN-CITY ?auto_16291 ?auto_16296 ) ( not ( = ?auto_16291 ?auto_16297 ) ) ( OBJ-AT ?auto_16293 ?auto_16297 ) ( not ( = ?auto_16292 ?auto_16299 ) ) ( IN-CITY ?auto_16294 ?auto_16296 ) ( not ( = ?auto_16291 ?auto_16294 ) ) ( not ( = ?auto_16297 ?auto_16294 ) ) ( OBJ-AT ?auto_16292 ?auto_16294 ) ( IN-TRUCK ?auto_16299 ?auto_16295 ) ( TRUCK-AT ?auto_16295 ?auto_16298 ) ( IN-CITY ?auto_16298 ?auto_16296 ) ( not ( = ?auto_16291 ?auto_16298 ) ) ( not ( = ?auto_16297 ?auto_16298 ) ) ( not ( = ?auto_16294 ?auto_16298 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16299 ?auto_16293 ?auto_16291 )
      ( DELIVER-2PKG-VERIFY ?auto_16292 ?auto_16293 ?auto_16291 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16301 - OBJ
      ?auto_16302 - OBJ
      ?auto_16300 - LOCATION
    )
    :vars
    (
      ?auto_16306 - LOCATION
      ?auto_16305 - CITY
      ?auto_16308 - OBJ
      ?auto_16303 - LOCATION
      ?auto_16304 - TRUCK
      ?auto_16307 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16302 ?auto_16301 ) ) ( IN-CITY ?auto_16306 ?auto_16305 ) ( IN-CITY ?auto_16300 ?auto_16305 ) ( not ( = ?auto_16300 ?auto_16306 ) ) ( OBJ-AT ?auto_16301 ?auto_16306 ) ( not ( = ?auto_16308 ?auto_16302 ) ) ( not ( = ?auto_16301 ?auto_16308 ) ) ( IN-CITY ?auto_16303 ?auto_16305 ) ( not ( = ?auto_16300 ?auto_16303 ) ) ( not ( = ?auto_16306 ?auto_16303 ) ) ( OBJ-AT ?auto_16308 ?auto_16303 ) ( IN-TRUCK ?auto_16302 ?auto_16304 ) ( TRUCK-AT ?auto_16304 ?auto_16307 ) ( IN-CITY ?auto_16307 ?auto_16305 ) ( not ( = ?auto_16300 ?auto_16307 ) ) ( not ( = ?auto_16306 ?auto_16307 ) ) ( not ( = ?auto_16303 ?auto_16307 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16302 ?auto_16301 ?auto_16300 )
      ( DELIVER-2PKG-VERIFY ?auto_16301 ?auto_16302 ?auto_16300 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16310 - OBJ
      ?auto_16311 - OBJ
      ?auto_16309 - LOCATION
    )
    :vars
    (
      ?auto_16317 - OBJ
      ?auto_16315 - LOCATION
      ?auto_16314 - CITY
      ?auto_16312 - LOCATION
      ?auto_16313 - TRUCK
      ?auto_16316 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16311 ?auto_16310 ) ) ( not ( = ?auto_16310 ?auto_16317 ) ) ( IN-CITY ?auto_16315 ?auto_16314 ) ( IN-CITY ?auto_16309 ?auto_16314 ) ( not ( = ?auto_16309 ?auto_16315 ) ) ( OBJ-AT ?auto_16310 ?auto_16315 ) ( not ( = ?auto_16311 ?auto_16317 ) ) ( IN-CITY ?auto_16312 ?auto_16314 ) ( not ( = ?auto_16309 ?auto_16312 ) ) ( not ( = ?auto_16315 ?auto_16312 ) ) ( OBJ-AT ?auto_16311 ?auto_16312 ) ( IN-TRUCK ?auto_16317 ?auto_16313 ) ( TRUCK-AT ?auto_16313 ?auto_16316 ) ( IN-CITY ?auto_16316 ?auto_16314 ) ( not ( = ?auto_16309 ?auto_16316 ) ) ( not ( = ?auto_16315 ?auto_16316 ) ) ( not ( = ?auto_16312 ?auto_16316 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16317 ?auto_16310 ?auto_16309 )
      ( DELIVER-2PKG-VERIFY ?auto_16310 ?auto_16311 ?auto_16309 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16339 - OBJ
      ?auto_16340 - OBJ
      ?auto_16341 - OBJ
      ?auto_16338 - LOCATION
    )
    :vars
    (
      ?auto_16345 - LOCATION
      ?auto_16344 - CITY
      ?auto_16342 - LOCATION
      ?auto_16343 - TRUCK
      ?auto_16346 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16340 ?auto_16339 ) ) ( not ( = ?auto_16341 ?auto_16339 ) ) ( not ( = ?auto_16341 ?auto_16340 ) ) ( IN-CITY ?auto_16345 ?auto_16344 ) ( IN-CITY ?auto_16338 ?auto_16344 ) ( not ( = ?auto_16338 ?auto_16345 ) ) ( OBJ-AT ?auto_16341 ?auto_16345 ) ( IN-CITY ?auto_16342 ?auto_16344 ) ( not ( = ?auto_16338 ?auto_16342 ) ) ( not ( = ?auto_16345 ?auto_16342 ) ) ( OBJ-AT ?auto_16340 ?auto_16342 ) ( IN-TRUCK ?auto_16339 ?auto_16343 ) ( TRUCK-AT ?auto_16343 ?auto_16346 ) ( IN-CITY ?auto_16346 ?auto_16344 ) ( not ( = ?auto_16338 ?auto_16346 ) ) ( not ( = ?auto_16345 ?auto_16346 ) ) ( not ( = ?auto_16342 ?auto_16346 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16339 ?auto_16341 ?auto_16338 )
      ( DELIVER-3PKG-VERIFY ?auto_16339 ?auto_16340 ?auto_16341 ?auto_16338 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16358 - OBJ
      ?auto_16359 - OBJ
      ?auto_16360 - OBJ
      ?auto_16357 - LOCATION
    )
    :vars
    (
      ?auto_16364 - LOCATION
      ?auto_16363 - CITY
      ?auto_16361 - LOCATION
      ?auto_16362 - TRUCK
      ?auto_16365 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16359 ?auto_16358 ) ) ( not ( = ?auto_16360 ?auto_16358 ) ) ( not ( = ?auto_16360 ?auto_16359 ) ) ( IN-CITY ?auto_16364 ?auto_16363 ) ( IN-CITY ?auto_16357 ?auto_16363 ) ( not ( = ?auto_16357 ?auto_16364 ) ) ( OBJ-AT ?auto_16359 ?auto_16364 ) ( IN-CITY ?auto_16361 ?auto_16363 ) ( not ( = ?auto_16357 ?auto_16361 ) ) ( not ( = ?auto_16364 ?auto_16361 ) ) ( OBJ-AT ?auto_16360 ?auto_16361 ) ( IN-TRUCK ?auto_16358 ?auto_16362 ) ( TRUCK-AT ?auto_16362 ?auto_16365 ) ( IN-CITY ?auto_16365 ?auto_16363 ) ( not ( = ?auto_16357 ?auto_16365 ) ) ( not ( = ?auto_16364 ?auto_16365 ) ) ( not ( = ?auto_16361 ?auto_16365 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16358 ?auto_16359 ?auto_16357 )
      ( DELIVER-3PKG-VERIFY ?auto_16358 ?auto_16359 ?auto_16360 ?auto_16357 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16377 - OBJ
      ?auto_16378 - OBJ
      ?auto_16379 - OBJ
      ?auto_16376 - LOCATION
    )
    :vars
    (
      ?auto_16383 - LOCATION
      ?auto_16382 - CITY
      ?auto_16380 - LOCATION
      ?auto_16381 - TRUCK
      ?auto_16384 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16378 ?auto_16377 ) ) ( not ( = ?auto_16379 ?auto_16377 ) ) ( not ( = ?auto_16379 ?auto_16378 ) ) ( IN-CITY ?auto_16383 ?auto_16382 ) ( IN-CITY ?auto_16376 ?auto_16382 ) ( not ( = ?auto_16376 ?auto_16383 ) ) ( OBJ-AT ?auto_16379 ?auto_16383 ) ( IN-CITY ?auto_16380 ?auto_16382 ) ( not ( = ?auto_16376 ?auto_16380 ) ) ( not ( = ?auto_16383 ?auto_16380 ) ) ( OBJ-AT ?auto_16377 ?auto_16380 ) ( IN-TRUCK ?auto_16378 ?auto_16381 ) ( TRUCK-AT ?auto_16381 ?auto_16384 ) ( IN-CITY ?auto_16384 ?auto_16382 ) ( not ( = ?auto_16376 ?auto_16384 ) ) ( not ( = ?auto_16383 ?auto_16384 ) ) ( not ( = ?auto_16380 ?auto_16384 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16378 ?auto_16379 ?auto_16376 )
      ( DELIVER-3PKG-VERIFY ?auto_16377 ?auto_16378 ?auto_16379 ?auto_16376 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16396 - OBJ
      ?auto_16397 - OBJ
      ?auto_16398 - OBJ
      ?auto_16395 - LOCATION
    )
    :vars
    (
      ?auto_16402 - LOCATION
      ?auto_16401 - CITY
      ?auto_16399 - LOCATION
      ?auto_16400 - TRUCK
      ?auto_16403 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16397 ?auto_16396 ) ) ( not ( = ?auto_16398 ?auto_16396 ) ) ( not ( = ?auto_16398 ?auto_16397 ) ) ( IN-CITY ?auto_16402 ?auto_16401 ) ( IN-CITY ?auto_16395 ?auto_16401 ) ( not ( = ?auto_16395 ?auto_16402 ) ) ( OBJ-AT ?auto_16397 ?auto_16402 ) ( IN-CITY ?auto_16399 ?auto_16401 ) ( not ( = ?auto_16395 ?auto_16399 ) ) ( not ( = ?auto_16402 ?auto_16399 ) ) ( OBJ-AT ?auto_16396 ?auto_16399 ) ( IN-TRUCK ?auto_16398 ?auto_16400 ) ( TRUCK-AT ?auto_16400 ?auto_16403 ) ( IN-CITY ?auto_16403 ?auto_16401 ) ( not ( = ?auto_16395 ?auto_16403 ) ) ( not ( = ?auto_16402 ?auto_16403 ) ) ( not ( = ?auto_16399 ?auto_16403 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16398 ?auto_16397 ?auto_16395 )
      ( DELIVER-3PKG-VERIFY ?auto_16396 ?auto_16397 ?auto_16398 ?auto_16395 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16435 - OBJ
      ?auto_16436 - OBJ
      ?auto_16437 - OBJ
      ?auto_16434 - LOCATION
    )
    :vars
    (
      ?auto_16441 - LOCATION
      ?auto_16440 - CITY
      ?auto_16438 - LOCATION
      ?auto_16439 - TRUCK
      ?auto_16442 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16436 ?auto_16435 ) ) ( not ( = ?auto_16437 ?auto_16435 ) ) ( not ( = ?auto_16437 ?auto_16436 ) ) ( IN-CITY ?auto_16441 ?auto_16440 ) ( IN-CITY ?auto_16434 ?auto_16440 ) ( not ( = ?auto_16434 ?auto_16441 ) ) ( OBJ-AT ?auto_16435 ?auto_16441 ) ( IN-CITY ?auto_16438 ?auto_16440 ) ( not ( = ?auto_16434 ?auto_16438 ) ) ( not ( = ?auto_16441 ?auto_16438 ) ) ( OBJ-AT ?auto_16437 ?auto_16438 ) ( IN-TRUCK ?auto_16436 ?auto_16439 ) ( TRUCK-AT ?auto_16439 ?auto_16442 ) ( IN-CITY ?auto_16442 ?auto_16440 ) ( not ( = ?auto_16434 ?auto_16442 ) ) ( not ( = ?auto_16441 ?auto_16442 ) ) ( not ( = ?auto_16438 ?auto_16442 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16436 ?auto_16435 ?auto_16434 )
      ( DELIVER-3PKG-VERIFY ?auto_16435 ?auto_16436 ?auto_16437 ?auto_16434 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16454 - OBJ
      ?auto_16455 - OBJ
      ?auto_16456 - OBJ
      ?auto_16453 - LOCATION
    )
    :vars
    (
      ?auto_16460 - LOCATION
      ?auto_16459 - CITY
      ?auto_16457 - LOCATION
      ?auto_16458 - TRUCK
      ?auto_16461 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16455 ?auto_16454 ) ) ( not ( = ?auto_16456 ?auto_16454 ) ) ( not ( = ?auto_16456 ?auto_16455 ) ) ( IN-CITY ?auto_16460 ?auto_16459 ) ( IN-CITY ?auto_16453 ?auto_16459 ) ( not ( = ?auto_16453 ?auto_16460 ) ) ( OBJ-AT ?auto_16454 ?auto_16460 ) ( IN-CITY ?auto_16457 ?auto_16459 ) ( not ( = ?auto_16453 ?auto_16457 ) ) ( not ( = ?auto_16460 ?auto_16457 ) ) ( OBJ-AT ?auto_16455 ?auto_16457 ) ( IN-TRUCK ?auto_16456 ?auto_16458 ) ( TRUCK-AT ?auto_16458 ?auto_16461 ) ( IN-CITY ?auto_16461 ?auto_16459 ) ( not ( = ?auto_16453 ?auto_16461 ) ) ( not ( = ?auto_16460 ?auto_16461 ) ) ( not ( = ?auto_16457 ?auto_16461 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16456 ?auto_16454 ?auto_16453 )
      ( DELIVER-3PKG-VERIFY ?auto_16454 ?auto_16455 ?auto_16456 ?auto_16453 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16514 - OBJ
      ?auto_16513 - LOCATION
    )
    :vars
    (
      ?auto_16521 - OBJ
      ?auto_16518 - LOCATION
      ?auto_16517 - CITY
      ?auto_16520 - OBJ
      ?auto_16515 - LOCATION
      ?auto_16516 - TRUCK
      ?auto_16519 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16514 ?auto_16521 ) ) ( IN-CITY ?auto_16518 ?auto_16517 ) ( IN-CITY ?auto_16513 ?auto_16517 ) ( not ( = ?auto_16513 ?auto_16518 ) ) ( OBJ-AT ?auto_16514 ?auto_16518 ) ( not ( = ?auto_16520 ?auto_16521 ) ) ( not ( = ?auto_16514 ?auto_16520 ) ) ( IN-CITY ?auto_16515 ?auto_16517 ) ( not ( = ?auto_16513 ?auto_16515 ) ) ( not ( = ?auto_16518 ?auto_16515 ) ) ( OBJ-AT ?auto_16520 ?auto_16515 ) ( TRUCK-AT ?auto_16516 ?auto_16519 ) ( IN-CITY ?auto_16519 ?auto_16517 ) ( not ( = ?auto_16513 ?auto_16519 ) ) ( not ( = ?auto_16518 ?auto_16519 ) ) ( not ( = ?auto_16515 ?auto_16519 ) ) ( OBJ-AT ?auto_16521 ?auto_16519 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_16521 ?auto_16516 ?auto_16519 )
      ( DELIVER-2PKG ?auto_16521 ?auto_16514 ?auto_16513 )
      ( DELIVER-1PKG-VERIFY ?auto_16514 ?auto_16513 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16523 - OBJ
      ?auto_16524 - OBJ
      ?auto_16522 - LOCATION
    )
    :vars
    (
      ?auto_16527 - LOCATION
      ?auto_16529 - CITY
      ?auto_16530 - OBJ
      ?auto_16526 - LOCATION
      ?auto_16528 - TRUCK
      ?auto_16525 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16524 ?auto_16523 ) ) ( IN-CITY ?auto_16527 ?auto_16529 ) ( IN-CITY ?auto_16522 ?auto_16529 ) ( not ( = ?auto_16522 ?auto_16527 ) ) ( OBJ-AT ?auto_16524 ?auto_16527 ) ( not ( = ?auto_16530 ?auto_16523 ) ) ( not ( = ?auto_16524 ?auto_16530 ) ) ( IN-CITY ?auto_16526 ?auto_16529 ) ( not ( = ?auto_16522 ?auto_16526 ) ) ( not ( = ?auto_16527 ?auto_16526 ) ) ( OBJ-AT ?auto_16530 ?auto_16526 ) ( TRUCK-AT ?auto_16528 ?auto_16525 ) ( IN-CITY ?auto_16525 ?auto_16529 ) ( not ( = ?auto_16522 ?auto_16525 ) ) ( not ( = ?auto_16527 ?auto_16525 ) ) ( not ( = ?auto_16526 ?auto_16525 ) ) ( OBJ-AT ?auto_16523 ?auto_16525 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16524 ?auto_16522 )
      ( DELIVER-2PKG-VERIFY ?auto_16523 ?auto_16524 ?auto_16522 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16532 - OBJ
      ?auto_16533 - OBJ
      ?auto_16531 - LOCATION
    )
    :vars
    (
      ?auto_16539 - OBJ
      ?auto_16535 - LOCATION
      ?auto_16536 - CITY
      ?auto_16534 - LOCATION
      ?auto_16538 - TRUCK
      ?auto_16537 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16533 ?auto_16532 ) ) ( not ( = ?auto_16533 ?auto_16539 ) ) ( IN-CITY ?auto_16535 ?auto_16536 ) ( IN-CITY ?auto_16531 ?auto_16536 ) ( not ( = ?auto_16531 ?auto_16535 ) ) ( OBJ-AT ?auto_16533 ?auto_16535 ) ( not ( = ?auto_16532 ?auto_16539 ) ) ( IN-CITY ?auto_16534 ?auto_16536 ) ( not ( = ?auto_16531 ?auto_16534 ) ) ( not ( = ?auto_16535 ?auto_16534 ) ) ( OBJ-AT ?auto_16532 ?auto_16534 ) ( TRUCK-AT ?auto_16538 ?auto_16537 ) ( IN-CITY ?auto_16537 ?auto_16536 ) ( not ( = ?auto_16531 ?auto_16537 ) ) ( not ( = ?auto_16535 ?auto_16537 ) ) ( not ( = ?auto_16534 ?auto_16537 ) ) ( OBJ-AT ?auto_16539 ?auto_16537 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16539 ?auto_16533 ?auto_16531 )
      ( DELIVER-2PKG-VERIFY ?auto_16532 ?auto_16533 ?auto_16531 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16541 - OBJ
      ?auto_16542 - OBJ
      ?auto_16540 - LOCATION
    )
    :vars
    (
      ?auto_16544 - LOCATION
      ?auto_16545 - CITY
      ?auto_16547 - OBJ
      ?auto_16543 - LOCATION
      ?auto_16548 - TRUCK
      ?auto_16546 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16542 ?auto_16541 ) ) ( IN-CITY ?auto_16544 ?auto_16545 ) ( IN-CITY ?auto_16540 ?auto_16545 ) ( not ( = ?auto_16540 ?auto_16544 ) ) ( OBJ-AT ?auto_16541 ?auto_16544 ) ( not ( = ?auto_16547 ?auto_16542 ) ) ( not ( = ?auto_16541 ?auto_16547 ) ) ( IN-CITY ?auto_16543 ?auto_16545 ) ( not ( = ?auto_16540 ?auto_16543 ) ) ( not ( = ?auto_16544 ?auto_16543 ) ) ( OBJ-AT ?auto_16547 ?auto_16543 ) ( TRUCK-AT ?auto_16548 ?auto_16546 ) ( IN-CITY ?auto_16546 ?auto_16545 ) ( not ( = ?auto_16540 ?auto_16546 ) ) ( not ( = ?auto_16544 ?auto_16546 ) ) ( not ( = ?auto_16543 ?auto_16546 ) ) ( OBJ-AT ?auto_16542 ?auto_16546 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16542 ?auto_16541 ?auto_16540 )
      ( DELIVER-2PKG-VERIFY ?auto_16541 ?auto_16542 ?auto_16540 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16550 - OBJ
      ?auto_16551 - OBJ
      ?auto_16549 - LOCATION
    )
    :vars
    (
      ?auto_16557 - OBJ
      ?auto_16553 - LOCATION
      ?auto_16554 - CITY
      ?auto_16552 - LOCATION
      ?auto_16556 - TRUCK
      ?auto_16555 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16551 ?auto_16550 ) ) ( not ( = ?auto_16550 ?auto_16557 ) ) ( IN-CITY ?auto_16553 ?auto_16554 ) ( IN-CITY ?auto_16549 ?auto_16554 ) ( not ( = ?auto_16549 ?auto_16553 ) ) ( OBJ-AT ?auto_16550 ?auto_16553 ) ( not ( = ?auto_16551 ?auto_16557 ) ) ( IN-CITY ?auto_16552 ?auto_16554 ) ( not ( = ?auto_16549 ?auto_16552 ) ) ( not ( = ?auto_16553 ?auto_16552 ) ) ( OBJ-AT ?auto_16551 ?auto_16552 ) ( TRUCK-AT ?auto_16556 ?auto_16555 ) ( IN-CITY ?auto_16555 ?auto_16554 ) ( not ( = ?auto_16549 ?auto_16555 ) ) ( not ( = ?auto_16553 ?auto_16555 ) ) ( not ( = ?auto_16552 ?auto_16555 ) ) ( OBJ-AT ?auto_16557 ?auto_16555 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16557 ?auto_16550 ?auto_16549 )
      ( DELIVER-2PKG-VERIFY ?auto_16550 ?auto_16551 ?auto_16549 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16579 - OBJ
      ?auto_16580 - OBJ
      ?auto_16581 - OBJ
      ?auto_16578 - LOCATION
    )
    :vars
    (
      ?auto_16583 - LOCATION
      ?auto_16584 - CITY
      ?auto_16582 - LOCATION
      ?auto_16586 - TRUCK
      ?auto_16585 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16580 ?auto_16579 ) ) ( not ( = ?auto_16581 ?auto_16579 ) ) ( not ( = ?auto_16581 ?auto_16580 ) ) ( IN-CITY ?auto_16583 ?auto_16584 ) ( IN-CITY ?auto_16578 ?auto_16584 ) ( not ( = ?auto_16578 ?auto_16583 ) ) ( OBJ-AT ?auto_16581 ?auto_16583 ) ( IN-CITY ?auto_16582 ?auto_16584 ) ( not ( = ?auto_16578 ?auto_16582 ) ) ( not ( = ?auto_16583 ?auto_16582 ) ) ( OBJ-AT ?auto_16580 ?auto_16582 ) ( TRUCK-AT ?auto_16586 ?auto_16585 ) ( IN-CITY ?auto_16585 ?auto_16584 ) ( not ( = ?auto_16578 ?auto_16585 ) ) ( not ( = ?auto_16583 ?auto_16585 ) ) ( not ( = ?auto_16582 ?auto_16585 ) ) ( OBJ-AT ?auto_16579 ?auto_16585 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16579 ?auto_16581 ?auto_16578 )
      ( DELIVER-3PKG-VERIFY ?auto_16579 ?auto_16580 ?auto_16581 ?auto_16578 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16598 - OBJ
      ?auto_16599 - OBJ
      ?auto_16600 - OBJ
      ?auto_16597 - LOCATION
    )
    :vars
    (
      ?auto_16602 - LOCATION
      ?auto_16603 - CITY
      ?auto_16601 - LOCATION
      ?auto_16605 - TRUCK
      ?auto_16604 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16599 ?auto_16598 ) ) ( not ( = ?auto_16600 ?auto_16598 ) ) ( not ( = ?auto_16600 ?auto_16599 ) ) ( IN-CITY ?auto_16602 ?auto_16603 ) ( IN-CITY ?auto_16597 ?auto_16603 ) ( not ( = ?auto_16597 ?auto_16602 ) ) ( OBJ-AT ?auto_16599 ?auto_16602 ) ( IN-CITY ?auto_16601 ?auto_16603 ) ( not ( = ?auto_16597 ?auto_16601 ) ) ( not ( = ?auto_16602 ?auto_16601 ) ) ( OBJ-AT ?auto_16600 ?auto_16601 ) ( TRUCK-AT ?auto_16605 ?auto_16604 ) ( IN-CITY ?auto_16604 ?auto_16603 ) ( not ( = ?auto_16597 ?auto_16604 ) ) ( not ( = ?auto_16602 ?auto_16604 ) ) ( not ( = ?auto_16601 ?auto_16604 ) ) ( OBJ-AT ?auto_16598 ?auto_16604 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16598 ?auto_16599 ?auto_16597 )
      ( DELIVER-3PKG-VERIFY ?auto_16598 ?auto_16599 ?auto_16600 ?auto_16597 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16617 - OBJ
      ?auto_16618 - OBJ
      ?auto_16619 - OBJ
      ?auto_16616 - LOCATION
    )
    :vars
    (
      ?auto_16621 - LOCATION
      ?auto_16622 - CITY
      ?auto_16620 - LOCATION
      ?auto_16624 - TRUCK
      ?auto_16623 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16618 ?auto_16617 ) ) ( not ( = ?auto_16619 ?auto_16617 ) ) ( not ( = ?auto_16619 ?auto_16618 ) ) ( IN-CITY ?auto_16621 ?auto_16622 ) ( IN-CITY ?auto_16616 ?auto_16622 ) ( not ( = ?auto_16616 ?auto_16621 ) ) ( OBJ-AT ?auto_16619 ?auto_16621 ) ( IN-CITY ?auto_16620 ?auto_16622 ) ( not ( = ?auto_16616 ?auto_16620 ) ) ( not ( = ?auto_16621 ?auto_16620 ) ) ( OBJ-AT ?auto_16617 ?auto_16620 ) ( TRUCK-AT ?auto_16624 ?auto_16623 ) ( IN-CITY ?auto_16623 ?auto_16622 ) ( not ( = ?auto_16616 ?auto_16623 ) ) ( not ( = ?auto_16621 ?auto_16623 ) ) ( not ( = ?auto_16620 ?auto_16623 ) ) ( OBJ-AT ?auto_16618 ?auto_16623 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16618 ?auto_16619 ?auto_16616 )
      ( DELIVER-3PKG-VERIFY ?auto_16617 ?auto_16618 ?auto_16619 ?auto_16616 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16636 - OBJ
      ?auto_16637 - OBJ
      ?auto_16638 - OBJ
      ?auto_16635 - LOCATION
    )
    :vars
    (
      ?auto_16640 - LOCATION
      ?auto_16641 - CITY
      ?auto_16639 - LOCATION
      ?auto_16643 - TRUCK
      ?auto_16642 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16637 ?auto_16636 ) ) ( not ( = ?auto_16638 ?auto_16636 ) ) ( not ( = ?auto_16638 ?auto_16637 ) ) ( IN-CITY ?auto_16640 ?auto_16641 ) ( IN-CITY ?auto_16635 ?auto_16641 ) ( not ( = ?auto_16635 ?auto_16640 ) ) ( OBJ-AT ?auto_16637 ?auto_16640 ) ( IN-CITY ?auto_16639 ?auto_16641 ) ( not ( = ?auto_16635 ?auto_16639 ) ) ( not ( = ?auto_16640 ?auto_16639 ) ) ( OBJ-AT ?auto_16636 ?auto_16639 ) ( TRUCK-AT ?auto_16643 ?auto_16642 ) ( IN-CITY ?auto_16642 ?auto_16641 ) ( not ( = ?auto_16635 ?auto_16642 ) ) ( not ( = ?auto_16640 ?auto_16642 ) ) ( not ( = ?auto_16639 ?auto_16642 ) ) ( OBJ-AT ?auto_16638 ?auto_16642 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16638 ?auto_16637 ?auto_16635 )
      ( DELIVER-3PKG-VERIFY ?auto_16636 ?auto_16637 ?auto_16638 ?auto_16635 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16675 - OBJ
      ?auto_16676 - OBJ
      ?auto_16677 - OBJ
      ?auto_16674 - LOCATION
    )
    :vars
    (
      ?auto_16679 - LOCATION
      ?auto_16680 - CITY
      ?auto_16678 - LOCATION
      ?auto_16682 - TRUCK
      ?auto_16681 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16676 ?auto_16675 ) ) ( not ( = ?auto_16677 ?auto_16675 ) ) ( not ( = ?auto_16677 ?auto_16676 ) ) ( IN-CITY ?auto_16679 ?auto_16680 ) ( IN-CITY ?auto_16674 ?auto_16680 ) ( not ( = ?auto_16674 ?auto_16679 ) ) ( OBJ-AT ?auto_16675 ?auto_16679 ) ( IN-CITY ?auto_16678 ?auto_16680 ) ( not ( = ?auto_16674 ?auto_16678 ) ) ( not ( = ?auto_16679 ?auto_16678 ) ) ( OBJ-AT ?auto_16677 ?auto_16678 ) ( TRUCK-AT ?auto_16682 ?auto_16681 ) ( IN-CITY ?auto_16681 ?auto_16680 ) ( not ( = ?auto_16674 ?auto_16681 ) ) ( not ( = ?auto_16679 ?auto_16681 ) ) ( not ( = ?auto_16678 ?auto_16681 ) ) ( OBJ-AT ?auto_16676 ?auto_16681 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16676 ?auto_16675 ?auto_16674 )
      ( DELIVER-3PKG-VERIFY ?auto_16675 ?auto_16676 ?auto_16677 ?auto_16674 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16694 - OBJ
      ?auto_16695 - OBJ
      ?auto_16696 - OBJ
      ?auto_16693 - LOCATION
    )
    :vars
    (
      ?auto_16698 - LOCATION
      ?auto_16699 - CITY
      ?auto_16697 - LOCATION
      ?auto_16701 - TRUCK
      ?auto_16700 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_16695 ?auto_16694 ) ) ( not ( = ?auto_16696 ?auto_16694 ) ) ( not ( = ?auto_16696 ?auto_16695 ) ) ( IN-CITY ?auto_16698 ?auto_16699 ) ( IN-CITY ?auto_16693 ?auto_16699 ) ( not ( = ?auto_16693 ?auto_16698 ) ) ( OBJ-AT ?auto_16694 ?auto_16698 ) ( IN-CITY ?auto_16697 ?auto_16699 ) ( not ( = ?auto_16693 ?auto_16697 ) ) ( not ( = ?auto_16698 ?auto_16697 ) ) ( OBJ-AT ?auto_16695 ?auto_16697 ) ( TRUCK-AT ?auto_16701 ?auto_16700 ) ( IN-CITY ?auto_16700 ?auto_16699 ) ( not ( = ?auto_16693 ?auto_16700 ) ) ( not ( = ?auto_16698 ?auto_16700 ) ) ( not ( = ?auto_16697 ?auto_16700 ) ) ( OBJ-AT ?auto_16696 ?auto_16700 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16696 ?auto_16694 ?auto_16693 )
      ( DELIVER-3PKG-VERIFY ?auto_16694 ?auto_16695 ?auto_16696 ?auto_16693 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16754 - OBJ
      ?auto_16753 - LOCATION
    )
    :vars
    (
      ?auto_16761 - OBJ
      ?auto_16756 - LOCATION
      ?auto_16757 - CITY
      ?auto_16759 - OBJ
      ?auto_16755 - LOCATION
      ?auto_16758 - LOCATION
      ?auto_16760 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16754 ?auto_16761 ) ) ( IN-CITY ?auto_16756 ?auto_16757 ) ( IN-CITY ?auto_16753 ?auto_16757 ) ( not ( = ?auto_16753 ?auto_16756 ) ) ( OBJ-AT ?auto_16754 ?auto_16756 ) ( not ( = ?auto_16759 ?auto_16761 ) ) ( not ( = ?auto_16754 ?auto_16759 ) ) ( IN-CITY ?auto_16755 ?auto_16757 ) ( not ( = ?auto_16753 ?auto_16755 ) ) ( not ( = ?auto_16756 ?auto_16755 ) ) ( OBJ-AT ?auto_16759 ?auto_16755 ) ( IN-CITY ?auto_16758 ?auto_16757 ) ( not ( = ?auto_16753 ?auto_16758 ) ) ( not ( = ?auto_16756 ?auto_16758 ) ) ( not ( = ?auto_16755 ?auto_16758 ) ) ( OBJ-AT ?auto_16761 ?auto_16758 ) ( TRUCK-AT ?auto_16760 ?auto_16753 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16760 ?auto_16753 ?auto_16758 ?auto_16757 )
      ( DELIVER-2PKG ?auto_16761 ?auto_16754 ?auto_16753 )
      ( DELIVER-1PKG-VERIFY ?auto_16754 ?auto_16753 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16763 - OBJ
      ?auto_16764 - OBJ
      ?auto_16762 - LOCATION
    )
    :vars
    (
      ?auto_16766 - LOCATION
      ?auto_16765 - CITY
      ?auto_16767 - OBJ
      ?auto_16768 - LOCATION
      ?auto_16769 - LOCATION
      ?auto_16770 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16764 ?auto_16763 ) ) ( IN-CITY ?auto_16766 ?auto_16765 ) ( IN-CITY ?auto_16762 ?auto_16765 ) ( not ( = ?auto_16762 ?auto_16766 ) ) ( OBJ-AT ?auto_16764 ?auto_16766 ) ( not ( = ?auto_16767 ?auto_16763 ) ) ( not ( = ?auto_16764 ?auto_16767 ) ) ( IN-CITY ?auto_16768 ?auto_16765 ) ( not ( = ?auto_16762 ?auto_16768 ) ) ( not ( = ?auto_16766 ?auto_16768 ) ) ( OBJ-AT ?auto_16767 ?auto_16768 ) ( IN-CITY ?auto_16769 ?auto_16765 ) ( not ( = ?auto_16762 ?auto_16769 ) ) ( not ( = ?auto_16766 ?auto_16769 ) ) ( not ( = ?auto_16768 ?auto_16769 ) ) ( OBJ-AT ?auto_16763 ?auto_16769 ) ( TRUCK-AT ?auto_16770 ?auto_16762 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16764 ?auto_16762 )
      ( DELIVER-2PKG-VERIFY ?auto_16763 ?auto_16764 ?auto_16762 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16772 - OBJ
      ?auto_16773 - OBJ
      ?auto_16771 - LOCATION
    )
    :vars
    (
      ?auto_16779 - OBJ
      ?auto_16778 - LOCATION
      ?auto_16774 - CITY
      ?auto_16775 - LOCATION
      ?auto_16776 - LOCATION
      ?auto_16777 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16773 ?auto_16772 ) ) ( not ( = ?auto_16773 ?auto_16779 ) ) ( IN-CITY ?auto_16778 ?auto_16774 ) ( IN-CITY ?auto_16771 ?auto_16774 ) ( not ( = ?auto_16771 ?auto_16778 ) ) ( OBJ-AT ?auto_16773 ?auto_16778 ) ( not ( = ?auto_16772 ?auto_16779 ) ) ( IN-CITY ?auto_16775 ?auto_16774 ) ( not ( = ?auto_16771 ?auto_16775 ) ) ( not ( = ?auto_16778 ?auto_16775 ) ) ( OBJ-AT ?auto_16772 ?auto_16775 ) ( IN-CITY ?auto_16776 ?auto_16774 ) ( not ( = ?auto_16771 ?auto_16776 ) ) ( not ( = ?auto_16778 ?auto_16776 ) ) ( not ( = ?auto_16775 ?auto_16776 ) ) ( OBJ-AT ?auto_16779 ?auto_16776 ) ( TRUCK-AT ?auto_16777 ?auto_16771 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16779 ?auto_16773 ?auto_16771 )
      ( DELIVER-2PKG-VERIFY ?auto_16772 ?auto_16773 ?auto_16771 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16781 - OBJ
      ?auto_16782 - OBJ
      ?auto_16780 - LOCATION
    )
    :vars
    (
      ?auto_16787 - LOCATION
      ?auto_16783 - CITY
      ?auto_16788 - OBJ
      ?auto_16784 - LOCATION
      ?auto_16785 - LOCATION
      ?auto_16786 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16782 ?auto_16781 ) ) ( IN-CITY ?auto_16787 ?auto_16783 ) ( IN-CITY ?auto_16780 ?auto_16783 ) ( not ( = ?auto_16780 ?auto_16787 ) ) ( OBJ-AT ?auto_16781 ?auto_16787 ) ( not ( = ?auto_16788 ?auto_16782 ) ) ( not ( = ?auto_16781 ?auto_16788 ) ) ( IN-CITY ?auto_16784 ?auto_16783 ) ( not ( = ?auto_16780 ?auto_16784 ) ) ( not ( = ?auto_16787 ?auto_16784 ) ) ( OBJ-AT ?auto_16788 ?auto_16784 ) ( IN-CITY ?auto_16785 ?auto_16783 ) ( not ( = ?auto_16780 ?auto_16785 ) ) ( not ( = ?auto_16787 ?auto_16785 ) ) ( not ( = ?auto_16784 ?auto_16785 ) ) ( OBJ-AT ?auto_16782 ?auto_16785 ) ( TRUCK-AT ?auto_16786 ?auto_16780 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16782 ?auto_16781 ?auto_16780 )
      ( DELIVER-2PKG-VERIFY ?auto_16781 ?auto_16782 ?auto_16780 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16790 - OBJ
      ?auto_16791 - OBJ
      ?auto_16789 - LOCATION
    )
    :vars
    (
      ?auto_16797 - OBJ
      ?auto_16796 - LOCATION
      ?auto_16792 - CITY
      ?auto_16793 - LOCATION
      ?auto_16794 - LOCATION
      ?auto_16795 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16791 ?auto_16790 ) ) ( not ( = ?auto_16790 ?auto_16797 ) ) ( IN-CITY ?auto_16796 ?auto_16792 ) ( IN-CITY ?auto_16789 ?auto_16792 ) ( not ( = ?auto_16789 ?auto_16796 ) ) ( OBJ-AT ?auto_16790 ?auto_16796 ) ( not ( = ?auto_16791 ?auto_16797 ) ) ( IN-CITY ?auto_16793 ?auto_16792 ) ( not ( = ?auto_16789 ?auto_16793 ) ) ( not ( = ?auto_16796 ?auto_16793 ) ) ( OBJ-AT ?auto_16791 ?auto_16793 ) ( IN-CITY ?auto_16794 ?auto_16792 ) ( not ( = ?auto_16789 ?auto_16794 ) ) ( not ( = ?auto_16796 ?auto_16794 ) ) ( not ( = ?auto_16793 ?auto_16794 ) ) ( OBJ-AT ?auto_16797 ?auto_16794 ) ( TRUCK-AT ?auto_16795 ?auto_16789 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16797 ?auto_16790 ?auto_16789 )
      ( DELIVER-2PKG-VERIFY ?auto_16790 ?auto_16791 ?auto_16789 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16819 - OBJ
      ?auto_16820 - OBJ
      ?auto_16821 - OBJ
      ?auto_16818 - LOCATION
    )
    :vars
    (
      ?auto_16826 - LOCATION
      ?auto_16822 - CITY
      ?auto_16823 - LOCATION
      ?auto_16824 - LOCATION
      ?auto_16825 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16820 ?auto_16819 ) ) ( not ( = ?auto_16821 ?auto_16819 ) ) ( not ( = ?auto_16821 ?auto_16820 ) ) ( IN-CITY ?auto_16826 ?auto_16822 ) ( IN-CITY ?auto_16818 ?auto_16822 ) ( not ( = ?auto_16818 ?auto_16826 ) ) ( OBJ-AT ?auto_16821 ?auto_16826 ) ( IN-CITY ?auto_16823 ?auto_16822 ) ( not ( = ?auto_16818 ?auto_16823 ) ) ( not ( = ?auto_16826 ?auto_16823 ) ) ( OBJ-AT ?auto_16820 ?auto_16823 ) ( IN-CITY ?auto_16824 ?auto_16822 ) ( not ( = ?auto_16818 ?auto_16824 ) ) ( not ( = ?auto_16826 ?auto_16824 ) ) ( not ( = ?auto_16823 ?auto_16824 ) ) ( OBJ-AT ?auto_16819 ?auto_16824 ) ( TRUCK-AT ?auto_16825 ?auto_16818 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16819 ?auto_16821 ?auto_16818 )
      ( DELIVER-3PKG-VERIFY ?auto_16819 ?auto_16820 ?auto_16821 ?auto_16818 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16838 - OBJ
      ?auto_16839 - OBJ
      ?auto_16840 - OBJ
      ?auto_16837 - LOCATION
    )
    :vars
    (
      ?auto_16845 - LOCATION
      ?auto_16841 - CITY
      ?auto_16842 - LOCATION
      ?auto_16843 - LOCATION
      ?auto_16844 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16839 ?auto_16838 ) ) ( not ( = ?auto_16840 ?auto_16838 ) ) ( not ( = ?auto_16840 ?auto_16839 ) ) ( IN-CITY ?auto_16845 ?auto_16841 ) ( IN-CITY ?auto_16837 ?auto_16841 ) ( not ( = ?auto_16837 ?auto_16845 ) ) ( OBJ-AT ?auto_16839 ?auto_16845 ) ( IN-CITY ?auto_16842 ?auto_16841 ) ( not ( = ?auto_16837 ?auto_16842 ) ) ( not ( = ?auto_16845 ?auto_16842 ) ) ( OBJ-AT ?auto_16840 ?auto_16842 ) ( IN-CITY ?auto_16843 ?auto_16841 ) ( not ( = ?auto_16837 ?auto_16843 ) ) ( not ( = ?auto_16845 ?auto_16843 ) ) ( not ( = ?auto_16842 ?auto_16843 ) ) ( OBJ-AT ?auto_16838 ?auto_16843 ) ( TRUCK-AT ?auto_16844 ?auto_16837 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16838 ?auto_16839 ?auto_16837 )
      ( DELIVER-3PKG-VERIFY ?auto_16838 ?auto_16839 ?auto_16840 ?auto_16837 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16857 - OBJ
      ?auto_16858 - OBJ
      ?auto_16859 - OBJ
      ?auto_16856 - LOCATION
    )
    :vars
    (
      ?auto_16864 - LOCATION
      ?auto_16860 - CITY
      ?auto_16861 - LOCATION
      ?auto_16862 - LOCATION
      ?auto_16863 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16858 ?auto_16857 ) ) ( not ( = ?auto_16859 ?auto_16857 ) ) ( not ( = ?auto_16859 ?auto_16858 ) ) ( IN-CITY ?auto_16864 ?auto_16860 ) ( IN-CITY ?auto_16856 ?auto_16860 ) ( not ( = ?auto_16856 ?auto_16864 ) ) ( OBJ-AT ?auto_16859 ?auto_16864 ) ( IN-CITY ?auto_16861 ?auto_16860 ) ( not ( = ?auto_16856 ?auto_16861 ) ) ( not ( = ?auto_16864 ?auto_16861 ) ) ( OBJ-AT ?auto_16857 ?auto_16861 ) ( IN-CITY ?auto_16862 ?auto_16860 ) ( not ( = ?auto_16856 ?auto_16862 ) ) ( not ( = ?auto_16864 ?auto_16862 ) ) ( not ( = ?auto_16861 ?auto_16862 ) ) ( OBJ-AT ?auto_16858 ?auto_16862 ) ( TRUCK-AT ?auto_16863 ?auto_16856 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16858 ?auto_16859 ?auto_16856 )
      ( DELIVER-3PKG-VERIFY ?auto_16857 ?auto_16858 ?auto_16859 ?auto_16856 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16876 - OBJ
      ?auto_16877 - OBJ
      ?auto_16878 - OBJ
      ?auto_16875 - LOCATION
    )
    :vars
    (
      ?auto_16883 - LOCATION
      ?auto_16879 - CITY
      ?auto_16880 - LOCATION
      ?auto_16881 - LOCATION
      ?auto_16882 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16877 ?auto_16876 ) ) ( not ( = ?auto_16878 ?auto_16876 ) ) ( not ( = ?auto_16878 ?auto_16877 ) ) ( IN-CITY ?auto_16883 ?auto_16879 ) ( IN-CITY ?auto_16875 ?auto_16879 ) ( not ( = ?auto_16875 ?auto_16883 ) ) ( OBJ-AT ?auto_16877 ?auto_16883 ) ( IN-CITY ?auto_16880 ?auto_16879 ) ( not ( = ?auto_16875 ?auto_16880 ) ) ( not ( = ?auto_16883 ?auto_16880 ) ) ( OBJ-AT ?auto_16876 ?auto_16880 ) ( IN-CITY ?auto_16881 ?auto_16879 ) ( not ( = ?auto_16875 ?auto_16881 ) ) ( not ( = ?auto_16883 ?auto_16881 ) ) ( not ( = ?auto_16880 ?auto_16881 ) ) ( OBJ-AT ?auto_16878 ?auto_16881 ) ( TRUCK-AT ?auto_16882 ?auto_16875 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16878 ?auto_16877 ?auto_16875 )
      ( DELIVER-3PKG-VERIFY ?auto_16876 ?auto_16877 ?auto_16878 ?auto_16875 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16915 - OBJ
      ?auto_16916 - OBJ
      ?auto_16917 - OBJ
      ?auto_16914 - LOCATION
    )
    :vars
    (
      ?auto_16922 - LOCATION
      ?auto_16918 - CITY
      ?auto_16919 - LOCATION
      ?auto_16920 - LOCATION
      ?auto_16921 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16916 ?auto_16915 ) ) ( not ( = ?auto_16917 ?auto_16915 ) ) ( not ( = ?auto_16917 ?auto_16916 ) ) ( IN-CITY ?auto_16922 ?auto_16918 ) ( IN-CITY ?auto_16914 ?auto_16918 ) ( not ( = ?auto_16914 ?auto_16922 ) ) ( OBJ-AT ?auto_16915 ?auto_16922 ) ( IN-CITY ?auto_16919 ?auto_16918 ) ( not ( = ?auto_16914 ?auto_16919 ) ) ( not ( = ?auto_16922 ?auto_16919 ) ) ( OBJ-AT ?auto_16917 ?auto_16919 ) ( IN-CITY ?auto_16920 ?auto_16918 ) ( not ( = ?auto_16914 ?auto_16920 ) ) ( not ( = ?auto_16922 ?auto_16920 ) ) ( not ( = ?auto_16919 ?auto_16920 ) ) ( OBJ-AT ?auto_16916 ?auto_16920 ) ( TRUCK-AT ?auto_16921 ?auto_16914 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16916 ?auto_16915 ?auto_16914 )
      ( DELIVER-3PKG-VERIFY ?auto_16915 ?auto_16916 ?auto_16917 ?auto_16914 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16934 - OBJ
      ?auto_16935 - OBJ
      ?auto_16936 - OBJ
      ?auto_16933 - LOCATION
    )
    :vars
    (
      ?auto_16941 - LOCATION
      ?auto_16937 - CITY
      ?auto_16938 - LOCATION
      ?auto_16939 - LOCATION
      ?auto_16940 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_16935 ?auto_16934 ) ) ( not ( = ?auto_16936 ?auto_16934 ) ) ( not ( = ?auto_16936 ?auto_16935 ) ) ( IN-CITY ?auto_16941 ?auto_16937 ) ( IN-CITY ?auto_16933 ?auto_16937 ) ( not ( = ?auto_16933 ?auto_16941 ) ) ( OBJ-AT ?auto_16934 ?auto_16941 ) ( IN-CITY ?auto_16938 ?auto_16937 ) ( not ( = ?auto_16933 ?auto_16938 ) ) ( not ( = ?auto_16941 ?auto_16938 ) ) ( OBJ-AT ?auto_16935 ?auto_16938 ) ( IN-CITY ?auto_16939 ?auto_16937 ) ( not ( = ?auto_16933 ?auto_16939 ) ) ( not ( = ?auto_16941 ?auto_16939 ) ) ( not ( = ?auto_16938 ?auto_16939 ) ) ( OBJ-AT ?auto_16936 ?auto_16939 ) ( TRUCK-AT ?auto_16940 ?auto_16933 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16936 ?auto_16934 ?auto_16933 )
      ( DELIVER-3PKG-VERIFY ?auto_16934 ?auto_16935 ?auto_16936 ?auto_16933 ) )
  )

)

