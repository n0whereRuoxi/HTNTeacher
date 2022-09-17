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

  ( :method DELIVER-7PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?obj7 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) ( OBJ-AT ?obj7 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3966 - OBJ
      ?auto_3967 - LOCATION
    )
    :vars
    (
      ?auto_3968 - TRUCK
      ?auto_3969 - LOCATION
      ?auto_3970 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3968 ?auto_3969 ) ( IN-CITY ?auto_3969 ?auto_3970 ) ( IN-CITY ?auto_3967 ?auto_3970 ) ( not ( = ?auto_3967 ?auto_3969 ) ) ( OBJ-AT ?auto_3966 ?auto_3969 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3966 ?auto_3968 ?auto_3969 )
      ( !DRIVE-TRUCK ?auto_3968 ?auto_3969 ?auto_3967 ?auto_3970 )
      ( !UNLOAD-TRUCK ?auto_3966 ?auto_3968 ?auto_3967 )
      ( DELIVER-1PKG-VERIFY ?auto_3966 ?auto_3967 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3973 - OBJ
      ?auto_3974 - LOCATION
    )
    :vars
    (
      ?auto_3976 - LOCATION
      ?auto_3975 - CITY
      ?auto_3977 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3976 ?auto_3975 ) ( IN-CITY ?auto_3974 ?auto_3975 ) ( not ( = ?auto_3974 ?auto_3976 ) ) ( OBJ-AT ?auto_3973 ?auto_3976 ) ( TRUCK-AT ?auto_3977 ?auto_3974 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3977 ?auto_3974 ?auto_3976 ?auto_3975 )
      ( DELIVER-1PKG ?auto_3973 ?auto_3974 )
      ( DELIVER-1PKG-VERIFY ?auto_3973 ?auto_3974 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3995 - OBJ
      ?auto_3997 - OBJ
      ?auto_3996 - LOCATION
    )
    :vars
    (
      ?auto_3999 - LOCATION
      ?auto_3998 - CITY
      ?auto_4000 - TRUCK
      ?auto_4001 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3997 ?auto_3995 ) ( IN-CITY ?auto_3999 ?auto_3998 ) ( IN-CITY ?auto_3996 ?auto_3998 ) ( not ( = ?auto_3996 ?auto_3999 ) ) ( OBJ-AT ?auto_3997 ?auto_3999 ) ( TRUCK-AT ?auto_4000 ?auto_4001 ) ( IN-CITY ?auto_4001 ?auto_3998 ) ( not ( = ?auto_3996 ?auto_4001 ) ) ( OBJ-AT ?auto_3995 ?auto_4001 ) ( not ( = ?auto_3995 ?auto_3997 ) ) ( not ( = ?auto_3999 ?auto_4001 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3995 ?auto_3996 )
      ( DELIVER-1PKG ?auto_3997 ?auto_3996 )
      ( DELIVER-2PKG-VERIFY ?auto_3995 ?auto_3997 ?auto_3996 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4005 - OBJ
      ?auto_4007 - OBJ
      ?auto_4006 - LOCATION
    )
    :vars
    (
      ?auto_4011 - LOCATION
      ?auto_4009 - CITY
      ?auto_4010 - LOCATION
      ?auto_4008 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4007 ?auto_4005 ) ( IN-CITY ?auto_4011 ?auto_4009 ) ( IN-CITY ?auto_4006 ?auto_4009 ) ( not ( = ?auto_4006 ?auto_4011 ) ) ( OBJ-AT ?auto_4007 ?auto_4011 ) ( IN-CITY ?auto_4010 ?auto_4009 ) ( not ( = ?auto_4006 ?auto_4010 ) ) ( OBJ-AT ?auto_4005 ?auto_4010 ) ( not ( = ?auto_4005 ?auto_4007 ) ) ( not ( = ?auto_4011 ?auto_4010 ) ) ( TRUCK-AT ?auto_4008 ?auto_4006 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4008 ?auto_4006 ?auto_4010 ?auto_4009 )
      ( DELIVER-2PKG ?auto_4005 ?auto_4007 ?auto_4006 )
      ( DELIVER-2PKG-VERIFY ?auto_4005 ?auto_4007 ?auto_4006 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4031 - OBJ
      ?auto_4033 - OBJ
      ?auto_4030 - OBJ
      ?auto_4032 - LOCATION
    )
    :vars
    (
      ?auto_4036 - LOCATION
      ?auto_4034 - CITY
      ?auto_4035 - TRUCK
      ?auto_4037 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4033 ?auto_4031 ) ( GREATER-THAN ?auto_4030 ?auto_4031 ) ( GREATER-THAN ?auto_4030 ?auto_4033 ) ( IN-CITY ?auto_4036 ?auto_4034 ) ( IN-CITY ?auto_4032 ?auto_4034 ) ( not ( = ?auto_4032 ?auto_4036 ) ) ( OBJ-AT ?auto_4030 ?auto_4036 ) ( OBJ-AT ?auto_4033 ?auto_4036 ) ( TRUCK-AT ?auto_4035 ?auto_4037 ) ( IN-CITY ?auto_4037 ?auto_4034 ) ( not ( = ?auto_4032 ?auto_4037 ) ) ( OBJ-AT ?auto_4031 ?auto_4037 ) ( not ( = ?auto_4031 ?auto_4033 ) ) ( not ( = ?auto_4036 ?auto_4037 ) ) ( not ( = ?auto_4031 ?auto_4030 ) ) ( not ( = ?auto_4033 ?auto_4030 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4031 ?auto_4033 ?auto_4032 )
      ( DELIVER-1PKG ?auto_4030 ?auto_4032 )
      ( DELIVER-3PKG-VERIFY ?auto_4031 ?auto_4033 ?auto_4030 ?auto_4032 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4043 - OBJ
      ?auto_4045 - OBJ
      ?auto_4042 - OBJ
      ?auto_4044 - LOCATION
    )
    :vars
    (
      ?auto_4046 - LOCATION
      ?auto_4049 - CITY
      ?auto_4047 - LOCATION
      ?auto_4048 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4045 ?auto_4043 ) ( GREATER-THAN ?auto_4042 ?auto_4043 ) ( GREATER-THAN ?auto_4042 ?auto_4045 ) ( IN-CITY ?auto_4046 ?auto_4049 ) ( IN-CITY ?auto_4044 ?auto_4049 ) ( not ( = ?auto_4044 ?auto_4046 ) ) ( OBJ-AT ?auto_4042 ?auto_4046 ) ( OBJ-AT ?auto_4045 ?auto_4046 ) ( IN-CITY ?auto_4047 ?auto_4049 ) ( not ( = ?auto_4044 ?auto_4047 ) ) ( OBJ-AT ?auto_4043 ?auto_4047 ) ( not ( = ?auto_4043 ?auto_4045 ) ) ( not ( = ?auto_4046 ?auto_4047 ) ) ( not ( = ?auto_4043 ?auto_4042 ) ) ( not ( = ?auto_4045 ?auto_4042 ) ) ( TRUCK-AT ?auto_4048 ?auto_4044 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4048 ?auto_4044 ?auto_4047 ?auto_4049 )
      ( DELIVER-3PKG ?auto_4043 ?auto_4045 ?auto_4042 ?auto_4044 )
      ( DELIVER-3PKG-VERIFY ?auto_4043 ?auto_4045 ?auto_4042 ?auto_4044 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4070 - OBJ
      ?auto_4072 - OBJ
      ?auto_4069 - OBJ
      ?auto_4073 - OBJ
      ?auto_4071 - LOCATION
    )
    :vars
    (
      ?auto_4076 - LOCATION
      ?auto_4075 - CITY
      ?auto_4077 - LOCATION
      ?auto_4074 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4072 ?auto_4070 ) ( GREATER-THAN ?auto_4069 ?auto_4070 ) ( GREATER-THAN ?auto_4069 ?auto_4072 ) ( GREATER-THAN ?auto_4073 ?auto_4070 ) ( GREATER-THAN ?auto_4073 ?auto_4072 ) ( GREATER-THAN ?auto_4073 ?auto_4069 ) ( IN-CITY ?auto_4076 ?auto_4075 ) ( IN-CITY ?auto_4071 ?auto_4075 ) ( not ( = ?auto_4071 ?auto_4076 ) ) ( OBJ-AT ?auto_4073 ?auto_4076 ) ( IN-CITY ?auto_4077 ?auto_4075 ) ( not ( = ?auto_4071 ?auto_4077 ) ) ( OBJ-AT ?auto_4069 ?auto_4077 ) ( OBJ-AT ?auto_4072 ?auto_4077 ) ( TRUCK-AT ?auto_4074 ?auto_4076 ) ( OBJ-AT ?auto_4070 ?auto_4076 ) ( not ( = ?auto_4070 ?auto_4072 ) ) ( not ( = ?auto_4077 ?auto_4076 ) ) ( not ( = ?auto_4070 ?auto_4069 ) ) ( not ( = ?auto_4072 ?auto_4069 ) ) ( not ( = ?auto_4070 ?auto_4073 ) ) ( not ( = ?auto_4072 ?auto_4073 ) ) ( not ( = ?auto_4069 ?auto_4073 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_4070 ?auto_4072 ?auto_4069 ?auto_4071 )
      ( DELIVER-1PKG ?auto_4073 ?auto_4071 )
      ( DELIVER-4PKG-VERIFY ?auto_4070 ?auto_4072 ?auto_4069 ?auto_4073 ?auto_4071 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4084 - OBJ
      ?auto_4086 - OBJ
      ?auto_4083 - OBJ
      ?auto_4087 - OBJ
      ?auto_4085 - LOCATION
    )
    :vars
    (
      ?auto_4089 - LOCATION
      ?auto_4090 - CITY
      ?auto_4088 - LOCATION
      ?auto_4091 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4086 ?auto_4084 ) ( GREATER-THAN ?auto_4083 ?auto_4084 ) ( GREATER-THAN ?auto_4083 ?auto_4086 ) ( GREATER-THAN ?auto_4087 ?auto_4084 ) ( GREATER-THAN ?auto_4087 ?auto_4086 ) ( GREATER-THAN ?auto_4087 ?auto_4083 ) ( IN-CITY ?auto_4089 ?auto_4090 ) ( IN-CITY ?auto_4085 ?auto_4090 ) ( not ( = ?auto_4085 ?auto_4089 ) ) ( OBJ-AT ?auto_4087 ?auto_4089 ) ( IN-CITY ?auto_4088 ?auto_4090 ) ( not ( = ?auto_4085 ?auto_4088 ) ) ( OBJ-AT ?auto_4083 ?auto_4088 ) ( OBJ-AT ?auto_4086 ?auto_4088 ) ( OBJ-AT ?auto_4084 ?auto_4089 ) ( not ( = ?auto_4084 ?auto_4086 ) ) ( not ( = ?auto_4088 ?auto_4089 ) ) ( not ( = ?auto_4084 ?auto_4083 ) ) ( not ( = ?auto_4086 ?auto_4083 ) ) ( not ( = ?auto_4084 ?auto_4087 ) ) ( not ( = ?auto_4086 ?auto_4087 ) ) ( not ( = ?auto_4083 ?auto_4087 ) ) ( TRUCK-AT ?auto_4091 ?auto_4085 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4091 ?auto_4085 ?auto_4089 ?auto_4090 )
      ( DELIVER-4PKG ?auto_4084 ?auto_4086 ?auto_4083 ?auto_4087 ?auto_4085 )
      ( DELIVER-4PKG-VERIFY ?auto_4084 ?auto_4086 ?auto_4083 ?auto_4087 ?auto_4085 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_4113 - OBJ
      ?auto_4115 - OBJ
      ?auto_4112 - OBJ
      ?auto_4116 - OBJ
      ?auto_4117 - OBJ
      ?auto_4114 - LOCATION
    )
    :vars
    (
      ?auto_4120 - LOCATION
      ?auto_4119 - CITY
      ?auto_4122 - LOCATION
      ?auto_4121 - LOCATION
      ?auto_4118 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4115 ?auto_4113 ) ( GREATER-THAN ?auto_4112 ?auto_4113 ) ( GREATER-THAN ?auto_4112 ?auto_4115 ) ( GREATER-THAN ?auto_4116 ?auto_4113 ) ( GREATER-THAN ?auto_4116 ?auto_4115 ) ( GREATER-THAN ?auto_4116 ?auto_4112 ) ( GREATER-THAN ?auto_4117 ?auto_4113 ) ( GREATER-THAN ?auto_4117 ?auto_4115 ) ( GREATER-THAN ?auto_4117 ?auto_4112 ) ( GREATER-THAN ?auto_4117 ?auto_4116 ) ( IN-CITY ?auto_4120 ?auto_4119 ) ( IN-CITY ?auto_4114 ?auto_4119 ) ( not ( = ?auto_4114 ?auto_4120 ) ) ( OBJ-AT ?auto_4117 ?auto_4120 ) ( IN-CITY ?auto_4122 ?auto_4119 ) ( not ( = ?auto_4114 ?auto_4122 ) ) ( OBJ-AT ?auto_4116 ?auto_4122 ) ( IN-CITY ?auto_4121 ?auto_4119 ) ( not ( = ?auto_4114 ?auto_4121 ) ) ( OBJ-AT ?auto_4112 ?auto_4121 ) ( OBJ-AT ?auto_4115 ?auto_4121 ) ( TRUCK-AT ?auto_4118 ?auto_4122 ) ( OBJ-AT ?auto_4113 ?auto_4122 ) ( not ( = ?auto_4113 ?auto_4115 ) ) ( not ( = ?auto_4121 ?auto_4122 ) ) ( not ( = ?auto_4113 ?auto_4112 ) ) ( not ( = ?auto_4115 ?auto_4112 ) ) ( not ( = ?auto_4113 ?auto_4116 ) ) ( not ( = ?auto_4115 ?auto_4116 ) ) ( not ( = ?auto_4112 ?auto_4116 ) ) ( not ( = ?auto_4113 ?auto_4117 ) ) ( not ( = ?auto_4115 ?auto_4117 ) ) ( not ( = ?auto_4112 ?auto_4117 ) ) ( not ( = ?auto_4116 ?auto_4117 ) ) ( not ( = ?auto_4120 ?auto_4122 ) ) ( not ( = ?auto_4120 ?auto_4121 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_4113 ?auto_4115 ?auto_4112 ?auto_4116 ?auto_4114 )
      ( DELIVER-1PKG ?auto_4117 ?auto_4114 )
      ( DELIVER-5PKG-VERIFY ?auto_4113 ?auto_4115 ?auto_4112 ?auto_4116 ?auto_4117 ?auto_4114 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_4130 - OBJ
      ?auto_4132 - OBJ
      ?auto_4129 - OBJ
      ?auto_4133 - OBJ
      ?auto_4134 - OBJ
      ?auto_4131 - LOCATION
    )
    :vars
    (
      ?auto_4135 - LOCATION
      ?auto_4137 - CITY
      ?auto_4139 - LOCATION
      ?auto_4138 - LOCATION
      ?auto_4136 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4132 ?auto_4130 ) ( GREATER-THAN ?auto_4129 ?auto_4130 ) ( GREATER-THAN ?auto_4129 ?auto_4132 ) ( GREATER-THAN ?auto_4133 ?auto_4130 ) ( GREATER-THAN ?auto_4133 ?auto_4132 ) ( GREATER-THAN ?auto_4133 ?auto_4129 ) ( GREATER-THAN ?auto_4134 ?auto_4130 ) ( GREATER-THAN ?auto_4134 ?auto_4132 ) ( GREATER-THAN ?auto_4134 ?auto_4129 ) ( GREATER-THAN ?auto_4134 ?auto_4133 ) ( IN-CITY ?auto_4135 ?auto_4137 ) ( IN-CITY ?auto_4131 ?auto_4137 ) ( not ( = ?auto_4131 ?auto_4135 ) ) ( OBJ-AT ?auto_4134 ?auto_4135 ) ( IN-CITY ?auto_4139 ?auto_4137 ) ( not ( = ?auto_4131 ?auto_4139 ) ) ( OBJ-AT ?auto_4133 ?auto_4139 ) ( IN-CITY ?auto_4138 ?auto_4137 ) ( not ( = ?auto_4131 ?auto_4138 ) ) ( OBJ-AT ?auto_4129 ?auto_4138 ) ( OBJ-AT ?auto_4132 ?auto_4138 ) ( OBJ-AT ?auto_4130 ?auto_4139 ) ( not ( = ?auto_4130 ?auto_4132 ) ) ( not ( = ?auto_4138 ?auto_4139 ) ) ( not ( = ?auto_4130 ?auto_4129 ) ) ( not ( = ?auto_4132 ?auto_4129 ) ) ( not ( = ?auto_4130 ?auto_4133 ) ) ( not ( = ?auto_4132 ?auto_4133 ) ) ( not ( = ?auto_4129 ?auto_4133 ) ) ( not ( = ?auto_4130 ?auto_4134 ) ) ( not ( = ?auto_4132 ?auto_4134 ) ) ( not ( = ?auto_4129 ?auto_4134 ) ) ( not ( = ?auto_4133 ?auto_4134 ) ) ( not ( = ?auto_4135 ?auto_4139 ) ) ( not ( = ?auto_4135 ?auto_4138 ) ) ( TRUCK-AT ?auto_4136 ?auto_4131 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4136 ?auto_4131 ?auto_4139 ?auto_4137 )
      ( DELIVER-5PKG ?auto_4130 ?auto_4132 ?auto_4129 ?auto_4133 ?auto_4134 ?auto_4131 )
      ( DELIVER-5PKG-VERIFY ?auto_4130 ?auto_4132 ?auto_4129 ?auto_4133 ?auto_4134 ?auto_4131 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_4162 - OBJ
      ?auto_4164 - OBJ
      ?auto_4161 - OBJ
      ?auto_4165 - OBJ
      ?auto_4167 - OBJ
      ?auto_4166 - OBJ
      ?auto_4163 - LOCATION
    )
    :vars
    (
      ?auto_4168 - LOCATION
      ?auto_4169 - CITY
      ?auto_4171 - LOCATION
      ?auto_4173 - LOCATION
      ?auto_4172 - LOCATION
      ?auto_4170 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4164 ?auto_4162 ) ( GREATER-THAN ?auto_4161 ?auto_4162 ) ( GREATER-THAN ?auto_4161 ?auto_4164 ) ( GREATER-THAN ?auto_4165 ?auto_4162 ) ( GREATER-THAN ?auto_4165 ?auto_4164 ) ( GREATER-THAN ?auto_4165 ?auto_4161 ) ( GREATER-THAN ?auto_4167 ?auto_4162 ) ( GREATER-THAN ?auto_4167 ?auto_4164 ) ( GREATER-THAN ?auto_4167 ?auto_4161 ) ( GREATER-THAN ?auto_4167 ?auto_4165 ) ( GREATER-THAN ?auto_4166 ?auto_4162 ) ( GREATER-THAN ?auto_4166 ?auto_4164 ) ( GREATER-THAN ?auto_4166 ?auto_4161 ) ( GREATER-THAN ?auto_4166 ?auto_4165 ) ( GREATER-THAN ?auto_4166 ?auto_4167 ) ( IN-CITY ?auto_4168 ?auto_4169 ) ( IN-CITY ?auto_4163 ?auto_4169 ) ( not ( = ?auto_4163 ?auto_4168 ) ) ( OBJ-AT ?auto_4166 ?auto_4168 ) ( IN-CITY ?auto_4171 ?auto_4169 ) ( not ( = ?auto_4163 ?auto_4171 ) ) ( OBJ-AT ?auto_4167 ?auto_4171 ) ( IN-CITY ?auto_4173 ?auto_4169 ) ( not ( = ?auto_4163 ?auto_4173 ) ) ( OBJ-AT ?auto_4165 ?auto_4173 ) ( IN-CITY ?auto_4172 ?auto_4169 ) ( not ( = ?auto_4163 ?auto_4172 ) ) ( OBJ-AT ?auto_4161 ?auto_4172 ) ( OBJ-AT ?auto_4164 ?auto_4172 ) ( TRUCK-AT ?auto_4170 ?auto_4173 ) ( OBJ-AT ?auto_4162 ?auto_4173 ) ( not ( = ?auto_4162 ?auto_4164 ) ) ( not ( = ?auto_4172 ?auto_4173 ) ) ( not ( = ?auto_4162 ?auto_4161 ) ) ( not ( = ?auto_4164 ?auto_4161 ) ) ( not ( = ?auto_4162 ?auto_4165 ) ) ( not ( = ?auto_4164 ?auto_4165 ) ) ( not ( = ?auto_4161 ?auto_4165 ) ) ( not ( = ?auto_4162 ?auto_4167 ) ) ( not ( = ?auto_4164 ?auto_4167 ) ) ( not ( = ?auto_4161 ?auto_4167 ) ) ( not ( = ?auto_4165 ?auto_4167 ) ) ( not ( = ?auto_4171 ?auto_4173 ) ) ( not ( = ?auto_4171 ?auto_4172 ) ) ( not ( = ?auto_4162 ?auto_4166 ) ) ( not ( = ?auto_4164 ?auto_4166 ) ) ( not ( = ?auto_4161 ?auto_4166 ) ) ( not ( = ?auto_4165 ?auto_4166 ) ) ( not ( = ?auto_4167 ?auto_4166 ) ) ( not ( = ?auto_4168 ?auto_4171 ) ) ( not ( = ?auto_4168 ?auto_4173 ) ) ( not ( = ?auto_4168 ?auto_4172 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_4162 ?auto_4164 ?auto_4161 ?auto_4165 ?auto_4167 ?auto_4163 )
      ( DELIVER-1PKG ?auto_4166 ?auto_4163 )
      ( DELIVER-6PKG-VERIFY ?auto_4162 ?auto_4164 ?auto_4161 ?auto_4165 ?auto_4167 ?auto_4166 ?auto_4163 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_4182 - OBJ
      ?auto_4184 - OBJ
      ?auto_4181 - OBJ
      ?auto_4185 - OBJ
      ?auto_4187 - OBJ
      ?auto_4186 - OBJ
      ?auto_4183 - LOCATION
    )
    :vars
    (
      ?auto_4193 - LOCATION
      ?auto_4189 - CITY
      ?auto_4188 - LOCATION
      ?auto_4191 - LOCATION
      ?auto_4190 - LOCATION
      ?auto_4192 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4184 ?auto_4182 ) ( GREATER-THAN ?auto_4181 ?auto_4182 ) ( GREATER-THAN ?auto_4181 ?auto_4184 ) ( GREATER-THAN ?auto_4185 ?auto_4182 ) ( GREATER-THAN ?auto_4185 ?auto_4184 ) ( GREATER-THAN ?auto_4185 ?auto_4181 ) ( GREATER-THAN ?auto_4187 ?auto_4182 ) ( GREATER-THAN ?auto_4187 ?auto_4184 ) ( GREATER-THAN ?auto_4187 ?auto_4181 ) ( GREATER-THAN ?auto_4187 ?auto_4185 ) ( GREATER-THAN ?auto_4186 ?auto_4182 ) ( GREATER-THAN ?auto_4186 ?auto_4184 ) ( GREATER-THAN ?auto_4186 ?auto_4181 ) ( GREATER-THAN ?auto_4186 ?auto_4185 ) ( GREATER-THAN ?auto_4186 ?auto_4187 ) ( IN-CITY ?auto_4193 ?auto_4189 ) ( IN-CITY ?auto_4183 ?auto_4189 ) ( not ( = ?auto_4183 ?auto_4193 ) ) ( OBJ-AT ?auto_4186 ?auto_4193 ) ( IN-CITY ?auto_4188 ?auto_4189 ) ( not ( = ?auto_4183 ?auto_4188 ) ) ( OBJ-AT ?auto_4187 ?auto_4188 ) ( IN-CITY ?auto_4191 ?auto_4189 ) ( not ( = ?auto_4183 ?auto_4191 ) ) ( OBJ-AT ?auto_4185 ?auto_4191 ) ( IN-CITY ?auto_4190 ?auto_4189 ) ( not ( = ?auto_4183 ?auto_4190 ) ) ( OBJ-AT ?auto_4181 ?auto_4190 ) ( OBJ-AT ?auto_4184 ?auto_4190 ) ( OBJ-AT ?auto_4182 ?auto_4191 ) ( not ( = ?auto_4182 ?auto_4184 ) ) ( not ( = ?auto_4190 ?auto_4191 ) ) ( not ( = ?auto_4182 ?auto_4181 ) ) ( not ( = ?auto_4184 ?auto_4181 ) ) ( not ( = ?auto_4182 ?auto_4185 ) ) ( not ( = ?auto_4184 ?auto_4185 ) ) ( not ( = ?auto_4181 ?auto_4185 ) ) ( not ( = ?auto_4182 ?auto_4187 ) ) ( not ( = ?auto_4184 ?auto_4187 ) ) ( not ( = ?auto_4181 ?auto_4187 ) ) ( not ( = ?auto_4185 ?auto_4187 ) ) ( not ( = ?auto_4188 ?auto_4191 ) ) ( not ( = ?auto_4188 ?auto_4190 ) ) ( not ( = ?auto_4182 ?auto_4186 ) ) ( not ( = ?auto_4184 ?auto_4186 ) ) ( not ( = ?auto_4181 ?auto_4186 ) ) ( not ( = ?auto_4185 ?auto_4186 ) ) ( not ( = ?auto_4187 ?auto_4186 ) ) ( not ( = ?auto_4193 ?auto_4188 ) ) ( not ( = ?auto_4193 ?auto_4191 ) ) ( not ( = ?auto_4193 ?auto_4190 ) ) ( TRUCK-AT ?auto_4192 ?auto_4183 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4192 ?auto_4183 ?auto_4191 ?auto_4189 )
      ( DELIVER-6PKG ?auto_4182 ?auto_4184 ?auto_4181 ?auto_4185 ?auto_4187 ?auto_4186 ?auto_4183 )
      ( DELIVER-6PKG-VERIFY ?auto_4182 ?auto_4184 ?auto_4181 ?auto_4185 ?auto_4187 ?auto_4186 ?auto_4183 ) )
  )

  ( :method DELIVER-7PKG
    :parameters
    (
      ?auto_4217 - OBJ
      ?auto_4219 - OBJ
      ?auto_4216 - OBJ
      ?auto_4220 - OBJ
      ?auto_4222 - OBJ
      ?auto_4221 - OBJ
      ?auto_4223 - OBJ
      ?auto_4218 - LOCATION
    )
    :vars
    (
      ?auto_4224 - LOCATION
      ?auto_4226 - CITY
      ?auto_4229 - LOCATION
      ?auto_4227 - LOCATION
      ?auto_4228 - LOCATION
      ?auto_4225 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4219 ?auto_4217 ) ( GREATER-THAN ?auto_4216 ?auto_4217 ) ( GREATER-THAN ?auto_4216 ?auto_4219 ) ( GREATER-THAN ?auto_4220 ?auto_4217 ) ( GREATER-THAN ?auto_4220 ?auto_4219 ) ( GREATER-THAN ?auto_4220 ?auto_4216 ) ( GREATER-THAN ?auto_4222 ?auto_4217 ) ( GREATER-THAN ?auto_4222 ?auto_4219 ) ( GREATER-THAN ?auto_4222 ?auto_4216 ) ( GREATER-THAN ?auto_4222 ?auto_4220 ) ( GREATER-THAN ?auto_4221 ?auto_4217 ) ( GREATER-THAN ?auto_4221 ?auto_4219 ) ( GREATER-THAN ?auto_4221 ?auto_4216 ) ( GREATER-THAN ?auto_4221 ?auto_4220 ) ( GREATER-THAN ?auto_4221 ?auto_4222 ) ( GREATER-THAN ?auto_4223 ?auto_4217 ) ( GREATER-THAN ?auto_4223 ?auto_4219 ) ( GREATER-THAN ?auto_4223 ?auto_4216 ) ( GREATER-THAN ?auto_4223 ?auto_4220 ) ( GREATER-THAN ?auto_4223 ?auto_4222 ) ( GREATER-THAN ?auto_4223 ?auto_4221 ) ( IN-CITY ?auto_4224 ?auto_4226 ) ( IN-CITY ?auto_4218 ?auto_4226 ) ( not ( = ?auto_4218 ?auto_4224 ) ) ( OBJ-AT ?auto_4223 ?auto_4224 ) ( IN-CITY ?auto_4229 ?auto_4226 ) ( not ( = ?auto_4218 ?auto_4229 ) ) ( OBJ-AT ?auto_4221 ?auto_4229 ) ( IN-CITY ?auto_4227 ?auto_4226 ) ( not ( = ?auto_4218 ?auto_4227 ) ) ( OBJ-AT ?auto_4222 ?auto_4227 ) ( OBJ-AT ?auto_4220 ?auto_4224 ) ( IN-CITY ?auto_4228 ?auto_4226 ) ( not ( = ?auto_4218 ?auto_4228 ) ) ( OBJ-AT ?auto_4216 ?auto_4228 ) ( OBJ-AT ?auto_4219 ?auto_4228 ) ( TRUCK-AT ?auto_4225 ?auto_4224 ) ( OBJ-AT ?auto_4217 ?auto_4224 ) ( not ( = ?auto_4217 ?auto_4219 ) ) ( not ( = ?auto_4228 ?auto_4224 ) ) ( not ( = ?auto_4217 ?auto_4216 ) ) ( not ( = ?auto_4219 ?auto_4216 ) ) ( not ( = ?auto_4217 ?auto_4220 ) ) ( not ( = ?auto_4219 ?auto_4220 ) ) ( not ( = ?auto_4216 ?auto_4220 ) ) ( not ( = ?auto_4217 ?auto_4222 ) ) ( not ( = ?auto_4219 ?auto_4222 ) ) ( not ( = ?auto_4216 ?auto_4222 ) ) ( not ( = ?auto_4220 ?auto_4222 ) ) ( not ( = ?auto_4227 ?auto_4224 ) ) ( not ( = ?auto_4227 ?auto_4228 ) ) ( not ( = ?auto_4217 ?auto_4221 ) ) ( not ( = ?auto_4219 ?auto_4221 ) ) ( not ( = ?auto_4216 ?auto_4221 ) ) ( not ( = ?auto_4220 ?auto_4221 ) ) ( not ( = ?auto_4222 ?auto_4221 ) ) ( not ( = ?auto_4229 ?auto_4227 ) ) ( not ( = ?auto_4229 ?auto_4224 ) ) ( not ( = ?auto_4229 ?auto_4228 ) ) ( not ( = ?auto_4217 ?auto_4223 ) ) ( not ( = ?auto_4219 ?auto_4223 ) ) ( not ( = ?auto_4216 ?auto_4223 ) ) ( not ( = ?auto_4220 ?auto_4223 ) ) ( not ( = ?auto_4222 ?auto_4223 ) ) ( not ( = ?auto_4221 ?auto_4223 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_4217 ?auto_4219 ?auto_4216 ?auto_4220 ?auto_4222 ?auto_4221 ?auto_4218 )
      ( DELIVER-1PKG ?auto_4223 ?auto_4218 )
      ( DELIVER-7PKG-VERIFY ?auto_4217 ?auto_4219 ?auto_4216 ?auto_4220 ?auto_4222 ?auto_4221 ?auto_4223 ?auto_4218 ) )
  )

  ( :method DELIVER-7PKG
    :parameters
    (
      ?auto_4239 - OBJ
      ?auto_4241 - OBJ
      ?auto_4238 - OBJ
      ?auto_4242 - OBJ
      ?auto_4244 - OBJ
      ?auto_4243 - OBJ
      ?auto_4245 - OBJ
      ?auto_4240 - LOCATION
    )
    :vars
    (
      ?auto_4249 - LOCATION
      ?auto_4248 - CITY
      ?auto_4250 - LOCATION
      ?auto_4247 - LOCATION
      ?auto_4251 - LOCATION
      ?auto_4246 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4241 ?auto_4239 ) ( GREATER-THAN ?auto_4238 ?auto_4239 ) ( GREATER-THAN ?auto_4238 ?auto_4241 ) ( GREATER-THAN ?auto_4242 ?auto_4239 ) ( GREATER-THAN ?auto_4242 ?auto_4241 ) ( GREATER-THAN ?auto_4242 ?auto_4238 ) ( GREATER-THAN ?auto_4244 ?auto_4239 ) ( GREATER-THAN ?auto_4244 ?auto_4241 ) ( GREATER-THAN ?auto_4244 ?auto_4238 ) ( GREATER-THAN ?auto_4244 ?auto_4242 ) ( GREATER-THAN ?auto_4243 ?auto_4239 ) ( GREATER-THAN ?auto_4243 ?auto_4241 ) ( GREATER-THAN ?auto_4243 ?auto_4238 ) ( GREATER-THAN ?auto_4243 ?auto_4242 ) ( GREATER-THAN ?auto_4243 ?auto_4244 ) ( GREATER-THAN ?auto_4245 ?auto_4239 ) ( GREATER-THAN ?auto_4245 ?auto_4241 ) ( GREATER-THAN ?auto_4245 ?auto_4238 ) ( GREATER-THAN ?auto_4245 ?auto_4242 ) ( GREATER-THAN ?auto_4245 ?auto_4244 ) ( GREATER-THAN ?auto_4245 ?auto_4243 ) ( IN-CITY ?auto_4249 ?auto_4248 ) ( IN-CITY ?auto_4240 ?auto_4248 ) ( not ( = ?auto_4240 ?auto_4249 ) ) ( OBJ-AT ?auto_4245 ?auto_4249 ) ( IN-CITY ?auto_4250 ?auto_4248 ) ( not ( = ?auto_4240 ?auto_4250 ) ) ( OBJ-AT ?auto_4243 ?auto_4250 ) ( IN-CITY ?auto_4247 ?auto_4248 ) ( not ( = ?auto_4240 ?auto_4247 ) ) ( OBJ-AT ?auto_4244 ?auto_4247 ) ( OBJ-AT ?auto_4242 ?auto_4249 ) ( IN-CITY ?auto_4251 ?auto_4248 ) ( not ( = ?auto_4240 ?auto_4251 ) ) ( OBJ-AT ?auto_4238 ?auto_4251 ) ( OBJ-AT ?auto_4241 ?auto_4251 ) ( OBJ-AT ?auto_4239 ?auto_4249 ) ( not ( = ?auto_4239 ?auto_4241 ) ) ( not ( = ?auto_4251 ?auto_4249 ) ) ( not ( = ?auto_4239 ?auto_4238 ) ) ( not ( = ?auto_4241 ?auto_4238 ) ) ( not ( = ?auto_4239 ?auto_4242 ) ) ( not ( = ?auto_4241 ?auto_4242 ) ) ( not ( = ?auto_4238 ?auto_4242 ) ) ( not ( = ?auto_4239 ?auto_4244 ) ) ( not ( = ?auto_4241 ?auto_4244 ) ) ( not ( = ?auto_4238 ?auto_4244 ) ) ( not ( = ?auto_4242 ?auto_4244 ) ) ( not ( = ?auto_4247 ?auto_4249 ) ) ( not ( = ?auto_4247 ?auto_4251 ) ) ( not ( = ?auto_4239 ?auto_4243 ) ) ( not ( = ?auto_4241 ?auto_4243 ) ) ( not ( = ?auto_4238 ?auto_4243 ) ) ( not ( = ?auto_4242 ?auto_4243 ) ) ( not ( = ?auto_4244 ?auto_4243 ) ) ( not ( = ?auto_4250 ?auto_4247 ) ) ( not ( = ?auto_4250 ?auto_4249 ) ) ( not ( = ?auto_4250 ?auto_4251 ) ) ( not ( = ?auto_4239 ?auto_4245 ) ) ( not ( = ?auto_4241 ?auto_4245 ) ) ( not ( = ?auto_4238 ?auto_4245 ) ) ( not ( = ?auto_4242 ?auto_4245 ) ) ( not ( = ?auto_4244 ?auto_4245 ) ) ( not ( = ?auto_4243 ?auto_4245 ) ) ( TRUCK-AT ?auto_4246 ?auto_4240 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4246 ?auto_4240 ?auto_4249 ?auto_4248 )
      ( DELIVER-7PKG ?auto_4239 ?auto_4241 ?auto_4238 ?auto_4242 ?auto_4244 ?auto_4243 ?auto_4245 ?auto_4240 )
      ( DELIVER-7PKG-VERIFY ?auto_4239 ?auto_4241 ?auto_4238 ?auto_4242 ?auto_4244 ?auto_4243 ?auto_4245 ?auto_4240 ) )
  )

)

