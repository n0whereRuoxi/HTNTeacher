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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3955 - OBJ
      ?auto_3954 - LOCATION
    )
    :vars
    (
      ?auto_3956 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3956 ?auto_3954 ) ( IN-TRUCK ?auto_3955 ?auto_3956 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_3955 ?auto_3956 ?auto_3954 )
      ( DELIVER-1PKG-VERIFY ?auto_3955 ?auto_3954 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3967 - OBJ
      ?auto_3966 - LOCATION
    )
    :vars
    (
      ?auto_3968 - TRUCK
      ?auto_3969 - LOCATION
      ?auto_3970 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_3967 ?auto_3968 ) ( TRUCK-AT ?auto_3968 ?auto_3969 ) ( IN-CITY ?auto_3969 ?auto_3970 ) ( IN-CITY ?auto_3966 ?auto_3970 ) ( not ( = ?auto_3966 ?auto_3969 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3968 ?auto_3969 ?auto_3966 ?auto_3970 )
      ( DELIVER-1PKG ?auto_3967 ?auto_3966 )
      ( DELIVER-1PKG-VERIFY ?auto_3967 ?auto_3966 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3985 - OBJ
      ?auto_3984 - LOCATION
    )
    :vars
    (
      ?auto_3987 - TRUCK
      ?auto_3986 - LOCATION
      ?auto_3988 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3987 ?auto_3986 ) ( IN-CITY ?auto_3986 ?auto_3988 ) ( IN-CITY ?auto_3984 ?auto_3988 ) ( not ( = ?auto_3984 ?auto_3986 ) ) ( OBJ-AT ?auto_3985 ?auto_3986 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3985 ?auto_3987 ?auto_3986 )
      ( DELIVER-1PKG ?auto_3985 ?auto_3984 )
      ( DELIVER-1PKG-VERIFY ?auto_3985 ?auto_3984 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4003 - OBJ
      ?auto_4002 - LOCATION
    )
    :vars
    (
      ?auto_4005 - LOCATION
      ?auto_4004 - CITY
      ?auto_4006 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4005 ?auto_4004 ) ( IN-CITY ?auto_4002 ?auto_4004 ) ( not ( = ?auto_4002 ?auto_4005 ) ) ( OBJ-AT ?auto_4003 ?auto_4005 ) ( TRUCK-AT ?auto_4006 ?auto_4002 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4006 ?auto_4002 ?auto_4005 ?auto_4004 )
      ( DELIVER-1PKG ?auto_4003 ?auto_4002 )
      ( DELIVER-1PKG-VERIFY ?auto_4003 ?auto_4002 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4063 - OBJ
      ?auto_4064 - OBJ
      ?auto_4062 - LOCATION
    )
    :vars
    (
      ?auto_4065 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4065 ?auto_4062 ) ( IN-TRUCK ?auto_4064 ?auto_4065 ) ( OBJ-AT ?auto_4063 ?auto_4062 ) ( not ( = ?auto_4063 ?auto_4064 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4064 ?auto_4062 )
      ( DELIVER-2PKG-VERIFY ?auto_4063 ?auto_4064 ?auto_4062 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4067 - OBJ
      ?auto_4068 - OBJ
      ?auto_4066 - LOCATION
    )
    :vars
    (
      ?auto_4069 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4069 ?auto_4066 ) ( IN-TRUCK ?auto_4067 ?auto_4069 ) ( OBJ-AT ?auto_4068 ?auto_4066 ) ( not ( = ?auto_4067 ?auto_4068 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4067 ?auto_4066 )
      ( DELIVER-2PKG-VERIFY ?auto_4067 ?auto_4068 ?auto_4066 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4075 - OBJ
      ?auto_4076 - OBJ
      ?auto_4077 - OBJ
      ?auto_4074 - LOCATION
    )
    :vars
    (
      ?auto_4078 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4078 ?auto_4074 ) ( IN-TRUCK ?auto_4077 ?auto_4078 ) ( OBJ-AT ?auto_4075 ?auto_4074 ) ( OBJ-AT ?auto_4076 ?auto_4074 ) ( not ( = ?auto_4075 ?auto_4076 ) ) ( not ( = ?auto_4075 ?auto_4077 ) ) ( not ( = ?auto_4076 ?auto_4077 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4077 ?auto_4074 )
      ( DELIVER-3PKG-VERIFY ?auto_4075 ?auto_4076 ?auto_4077 ?auto_4074 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4080 - OBJ
      ?auto_4081 - OBJ
      ?auto_4082 - OBJ
      ?auto_4079 - LOCATION
    )
    :vars
    (
      ?auto_4083 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4083 ?auto_4079 ) ( IN-TRUCK ?auto_4081 ?auto_4083 ) ( OBJ-AT ?auto_4080 ?auto_4079 ) ( OBJ-AT ?auto_4082 ?auto_4079 ) ( not ( = ?auto_4080 ?auto_4081 ) ) ( not ( = ?auto_4080 ?auto_4082 ) ) ( not ( = ?auto_4081 ?auto_4082 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4081 ?auto_4079 )
      ( DELIVER-3PKG-VERIFY ?auto_4080 ?auto_4081 ?auto_4082 ?auto_4079 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4090 - OBJ
      ?auto_4091 - OBJ
      ?auto_4092 - OBJ
      ?auto_4089 - LOCATION
    )
    :vars
    (
      ?auto_4093 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4093 ?auto_4089 ) ( IN-TRUCK ?auto_4090 ?auto_4093 ) ( OBJ-AT ?auto_4091 ?auto_4089 ) ( OBJ-AT ?auto_4092 ?auto_4089 ) ( not ( = ?auto_4090 ?auto_4091 ) ) ( not ( = ?auto_4090 ?auto_4092 ) ) ( not ( = ?auto_4091 ?auto_4092 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4090 ?auto_4089 )
      ( DELIVER-3PKG-VERIFY ?auto_4090 ?auto_4091 ?auto_4092 ?auto_4089 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4115 - OBJ
      ?auto_4116 - OBJ
      ?auto_4114 - LOCATION
    )
    :vars
    (
      ?auto_4117 - TRUCK
      ?auto_4119 - LOCATION
      ?auto_4118 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4116 ?auto_4117 ) ( TRUCK-AT ?auto_4117 ?auto_4119 ) ( IN-CITY ?auto_4119 ?auto_4118 ) ( IN-CITY ?auto_4114 ?auto_4118 ) ( not ( = ?auto_4114 ?auto_4119 ) ) ( OBJ-AT ?auto_4115 ?auto_4114 ) ( not ( = ?auto_4115 ?auto_4116 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4116 ?auto_4114 )
      ( DELIVER-2PKG-VERIFY ?auto_4115 ?auto_4116 ?auto_4114 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4121 - OBJ
      ?auto_4122 - OBJ
      ?auto_4120 - LOCATION
    )
    :vars
    (
      ?auto_4124 - TRUCK
      ?auto_4125 - LOCATION
      ?auto_4123 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4121 ?auto_4124 ) ( TRUCK-AT ?auto_4124 ?auto_4125 ) ( IN-CITY ?auto_4125 ?auto_4123 ) ( IN-CITY ?auto_4120 ?auto_4123 ) ( not ( = ?auto_4120 ?auto_4125 ) ) ( OBJ-AT ?auto_4122 ?auto_4120 ) ( not ( = ?auto_4122 ?auto_4121 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4122 ?auto_4121 ?auto_4120 )
      ( DELIVER-2PKG-VERIFY ?auto_4121 ?auto_4122 ?auto_4120 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4134 - OBJ
      ?auto_4135 - OBJ
      ?auto_4136 - OBJ
      ?auto_4133 - LOCATION
    )
    :vars
    (
      ?auto_4138 - TRUCK
      ?auto_4139 - LOCATION
      ?auto_4137 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4136 ?auto_4138 ) ( TRUCK-AT ?auto_4138 ?auto_4139 ) ( IN-CITY ?auto_4139 ?auto_4137 ) ( IN-CITY ?auto_4133 ?auto_4137 ) ( not ( = ?auto_4133 ?auto_4139 ) ) ( OBJ-AT ?auto_4134 ?auto_4133 ) ( not ( = ?auto_4134 ?auto_4136 ) ) ( OBJ-AT ?auto_4135 ?auto_4133 ) ( not ( = ?auto_4134 ?auto_4135 ) ) ( not ( = ?auto_4135 ?auto_4136 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4134 ?auto_4136 ?auto_4133 )
      ( DELIVER-3PKG-VERIFY ?auto_4134 ?auto_4135 ?auto_4136 ?auto_4133 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4141 - OBJ
      ?auto_4142 - OBJ
      ?auto_4143 - OBJ
      ?auto_4140 - LOCATION
    )
    :vars
    (
      ?auto_4145 - TRUCK
      ?auto_4146 - LOCATION
      ?auto_4144 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4142 ?auto_4145 ) ( TRUCK-AT ?auto_4145 ?auto_4146 ) ( IN-CITY ?auto_4146 ?auto_4144 ) ( IN-CITY ?auto_4140 ?auto_4144 ) ( not ( = ?auto_4140 ?auto_4146 ) ) ( OBJ-AT ?auto_4143 ?auto_4140 ) ( not ( = ?auto_4143 ?auto_4142 ) ) ( OBJ-AT ?auto_4141 ?auto_4140 ) ( not ( = ?auto_4141 ?auto_4142 ) ) ( not ( = ?auto_4141 ?auto_4143 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4143 ?auto_4142 ?auto_4140 )
      ( DELIVER-3PKG-VERIFY ?auto_4141 ?auto_4142 ?auto_4143 ?auto_4140 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4155 - OBJ
      ?auto_4156 - OBJ
      ?auto_4157 - OBJ
      ?auto_4154 - LOCATION
    )
    :vars
    (
      ?auto_4159 - TRUCK
      ?auto_4160 - LOCATION
      ?auto_4158 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4155 ?auto_4159 ) ( TRUCK-AT ?auto_4159 ?auto_4160 ) ( IN-CITY ?auto_4160 ?auto_4158 ) ( IN-CITY ?auto_4154 ?auto_4158 ) ( not ( = ?auto_4154 ?auto_4160 ) ) ( OBJ-AT ?auto_4156 ?auto_4154 ) ( not ( = ?auto_4156 ?auto_4155 ) ) ( OBJ-AT ?auto_4157 ?auto_4154 ) ( not ( = ?auto_4155 ?auto_4157 ) ) ( not ( = ?auto_4156 ?auto_4157 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4156 ?auto_4155 ?auto_4154 )
      ( DELIVER-3PKG-VERIFY ?auto_4155 ?auto_4156 ?auto_4157 ?auto_4154 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4184 - OBJ
      ?auto_4183 - LOCATION
    )
    :vars
    (
      ?auto_4186 - TRUCK
      ?auto_4187 - LOCATION
      ?auto_4185 - CITY
      ?auto_4188 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4186 ?auto_4187 ) ( IN-CITY ?auto_4187 ?auto_4185 ) ( IN-CITY ?auto_4183 ?auto_4185 ) ( not ( = ?auto_4183 ?auto_4187 ) ) ( OBJ-AT ?auto_4188 ?auto_4183 ) ( not ( = ?auto_4188 ?auto_4184 ) ) ( OBJ-AT ?auto_4184 ?auto_4187 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4184 ?auto_4186 ?auto_4187 )
      ( DELIVER-2PKG ?auto_4188 ?auto_4184 ?auto_4183 )
      ( DELIVER-1PKG-VERIFY ?auto_4184 ?auto_4183 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4190 - OBJ
      ?auto_4191 - OBJ
      ?auto_4189 - LOCATION
    )
    :vars
    (
      ?auto_4193 - TRUCK
      ?auto_4192 - LOCATION
      ?auto_4194 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4193 ?auto_4192 ) ( IN-CITY ?auto_4192 ?auto_4194 ) ( IN-CITY ?auto_4189 ?auto_4194 ) ( not ( = ?auto_4189 ?auto_4192 ) ) ( OBJ-AT ?auto_4190 ?auto_4189 ) ( not ( = ?auto_4190 ?auto_4191 ) ) ( OBJ-AT ?auto_4191 ?auto_4192 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4191 ?auto_4189 )
      ( DELIVER-2PKG-VERIFY ?auto_4190 ?auto_4191 ?auto_4189 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4196 - OBJ
      ?auto_4197 - OBJ
      ?auto_4195 - LOCATION
    )
    :vars
    (
      ?auto_4198 - TRUCK
      ?auto_4200 - LOCATION
      ?auto_4199 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4198 ?auto_4200 ) ( IN-CITY ?auto_4200 ?auto_4199 ) ( IN-CITY ?auto_4195 ?auto_4199 ) ( not ( = ?auto_4195 ?auto_4200 ) ) ( OBJ-AT ?auto_4197 ?auto_4195 ) ( not ( = ?auto_4197 ?auto_4196 ) ) ( OBJ-AT ?auto_4196 ?auto_4200 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4197 ?auto_4196 ?auto_4195 )
      ( DELIVER-2PKG-VERIFY ?auto_4196 ?auto_4197 ?auto_4195 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4209 - OBJ
      ?auto_4210 - OBJ
      ?auto_4211 - OBJ
      ?auto_4208 - LOCATION
    )
    :vars
    (
      ?auto_4212 - TRUCK
      ?auto_4214 - LOCATION
      ?auto_4213 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4212 ?auto_4214 ) ( IN-CITY ?auto_4214 ?auto_4213 ) ( IN-CITY ?auto_4208 ?auto_4213 ) ( not ( = ?auto_4208 ?auto_4214 ) ) ( OBJ-AT ?auto_4209 ?auto_4208 ) ( not ( = ?auto_4209 ?auto_4211 ) ) ( OBJ-AT ?auto_4211 ?auto_4214 ) ( OBJ-AT ?auto_4210 ?auto_4208 ) ( not ( = ?auto_4209 ?auto_4210 ) ) ( not ( = ?auto_4210 ?auto_4211 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4209 ?auto_4211 ?auto_4208 )
      ( DELIVER-3PKG-VERIFY ?auto_4209 ?auto_4210 ?auto_4211 ?auto_4208 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4216 - OBJ
      ?auto_4217 - OBJ
      ?auto_4218 - OBJ
      ?auto_4215 - LOCATION
    )
    :vars
    (
      ?auto_4219 - TRUCK
      ?auto_4221 - LOCATION
      ?auto_4220 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4219 ?auto_4221 ) ( IN-CITY ?auto_4221 ?auto_4220 ) ( IN-CITY ?auto_4215 ?auto_4220 ) ( not ( = ?auto_4215 ?auto_4221 ) ) ( OBJ-AT ?auto_4218 ?auto_4215 ) ( not ( = ?auto_4218 ?auto_4217 ) ) ( OBJ-AT ?auto_4217 ?auto_4221 ) ( OBJ-AT ?auto_4216 ?auto_4215 ) ( not ( = ?auto_4216 ?auto_4217 ) ) ( not ( = ?auto_4216 ?auto_4218 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4218 ?auto_4217 ?auto_4215 )
      ( DELIVER-3PKG-VERIFY ?auto_4216 ?auto_4217 ?auto_4218 ?auto_4215 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4230 - OBJ
      ?auto_4231 - OBJ
      ?auto_4232 - OBJ
      ?auto_4229 - LOCATION
    )
    :vars
    (
      ?auto_4233 - TRUCK
      ?auto_4235 - LOCATION
      ?auto_4234 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4233 ?auto_4235 ) ( IN-CITY ?auto_4235 ?auto_4234 ) ( IN-CITY ?auto_4229 ?auto_4234 ) ( not ( = ?auto_4229 ?auto_4235 ) ) ( OBJ-AT ?auto_4231 ?auto_4229 ) ( not ( = ?auto_4231 ?auto_4230 ) ) ( OBJ-AT ?auto_4230 ?auto_4235 ) ( OBJ-AT ?auto_4232 ?auto_4229 ) ( not ( = ?auto_4230 ?auto_4232 ) ) ( not ( = ?auto_4231 ?auto_4232 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4231 ?auto_4230 ?auto_4229 )
      ( DELIVER-3PKG-VERIFY ?auto_4230 ?auto_4231 ?auto_4232 ?auto_4229 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4259 - OBJ
      ?auto_4258 - LOCATION
    )
    :vars
    (
      ?auto_4263 - LOCATION
      ?auto_4262 - CITY
      ?auto_4260 - OBJ
      ?auto_4261 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4263 ?auto_4262 ) ( IN-CITY ?auto_4258 ?auto_4262 ) ( not ( = ?auto_4258 ?auto_4263 ) ) ( OBJ-AT ?auto_4260 ?auto_4258 ) ( not ( = ?auto_4260 ?auto_4259 ) ) ( OBJ-AT ?auto_4259 ?auto_4263 ) ( TRUCK-AT ?auto_4261 ?auto_4258 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4261 ?auto_4258 ?auto_4263 ?auto_4262 )
      ( DELIVER-2PKG ?auto_4260 ?auto_4259 ?auto_4258 )
      ( DELIVER-1PKG-VERIFY ?auto_4259 ?auto_4258 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4265 - OBJ
      ?auto_4266 - OBJ
      ?auto_4264 - LOCATION
    )
    :vars
    (
      ?auto_4268 - LOCATION
      ?auto_4269 - CITY
      ?auto_4267 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4268 ?auto_4269 ) ( IN-CITY ?auto_4264 ?auto_4269 ) ( not ( = ?auto_4264 ?auto_4268 ) ) ( OBJ-AT ?auto_4265 ?auto_4264 ) ( not ( = ?auto_4265 ?auto_4266 ) ) ( OBJ-AT ?auto_4266 ?auto_4268 ) ( TRUCK-AT ?auto_4267 ?auto_4264 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4266 ?auto_4264 )
      ( DELIVER-2PKG-VERIFY ?auto_4265 ?auto_4266 ?auto_4264 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4271 - OBJ
      ?auto_4272 - OBJ
      ?auto_4270 - LOCATION
    )
    :vars
    (
      ?auto_4273 - LOCATION
      ?auto_4275 - CITY
      ?auto_4274 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4273 ?auto_4275 ) ( IN-CITY ?auto_4270 ?auto_4275 ) ( not ( = ?auto_4270 ?auto_4273 ) ) ( OBJ-AT ?auto_4272 ?auto_4270 ) ( not ( = ?auto_4272 ?auto_4271 ) ) ( OBJ-AT ?auto_4271 ?auto_4273 ) ( TRUCK-AT ?auto_4274 ?auto_4270 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4272 ?auto_4271 ?auto_4270 )
      ( DELIVER-2PKG-VERIFY ?auto_4271 ?auto_4272 ?auto_4270 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4284 - OBJ
      ?auto_4285 - OBJ
      ?auto_4286 - OBJ
      ?auto_4283 - LOCATION
    )
    :vars
    (
      ?auto_4287 - LOCATION
      ?auto_4289 - CITY
      ?auto_4288 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4287 ?auto_4289 ) ( IN-CITY ?auto_4283 ?auto_4289 ) ( not ( = ?auto_4283 ?auto_4287 ) ) ( OBJ-AT ?auto_4285 ?auto_4283 ) ( not ( = ?auto_4285 ?auto_4286 ) ) ( OBJ-AT ?auto_4286 ?auto_4287 ) ( TRUCK-AT ?auto_4288 ?auto_4283 ) ( OBJ-AT ?auto_4284 ?auto_4283 ) ( not ( = ?auto_4284 ?auto_4285 ) ) ( not ( = ?auto_4284 ?auto_4286 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4285 ?auto_4286 ?auto_4283 )
      ( DELIVER-3PKG-VERIFY ?auto_4284 ?auto_4285 ?auto_4286 ?auto_4283 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4291 - OBJ
      ?auto_4292 - OBJ
      ?auto_4293 - OBJ
      ?auto_4290 - LOCATION
    )
    :vars
    (
      ?auto_4294 - LOCATION
      ?auto_4296 - CITY
      ?auto_4295 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4294 ?auto_4296 ) ( IN-CITY ?auto_4290 ?auto_4296 ) ( not ( = ?auto_4290 ?auto_4294 ) ) ( OBJ-AT ?auto_4293 ?auto_4290 ) ( not ( = ?auto_4293 ?auto_4292 ) ) ( OBJ-AT ?auto_4292 ?auto_4294 ) ( TRUCK-AT ?auto_4295 ?auto_4290 ) ( OBJ-AT ?auto_4291 ?auto_4290 ) ( not ( = ?auto_4291 ?auto_4292 ) ) ( not ( = ?auto_4291 ?auto_4293 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4293 ?auto_4292 ?auto_4290 )
      ( DELIVER-3PKG-VERIFY ?auto_4291 ?auto_4292 ?auto_4293 ?auto_4290 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4305 - OBJ
      ?auto_4306 - OBJ
      ?auto_4307 - OBJ
      ?auto_4304 - LOCATION
    )
    :vars
    (
      ?auto_4308 - LOCATION
      ?auto_4310 - CITY
      ?auto_4309 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4308 ?auto_4310 ) ( IN-CITY ?auto_4304 ?auto_4310 ) ( not ( = ?auto_4304 ?auto_4308 ) ) ( OBJ-AT ?auto_4306 ?auto_4304 ) ( not ( = ?auto_4306 ?auto_4305 ) ) ( OBJ-AT ?auto_4305 ?auto_4308 ) ( TRUCK-AT ?auto_4309 ?auto_4304 ) ( OBJ-AT ?auto_4307 ?auto_4304 ) ( not ( = ?auto_4305 ?auto_4307 ) ) ( not ( = ?auto_4306 ?auto_4307 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4306 ?auto_4305 ?auto_4304 )
      ( DELIVER-3PKG-VERIFY ?auto_4305 ?auto_4306 ?auto_4307 ?auto_4304 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4334 - OBJ
      ?auto_4333 - LOCATION
    )
    :vars
    (
      ?auto_4335 - LOCATION
      ?auto_4337 - CITY
      ?auto_4338 - OBJ
      ?auto_4336 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4335 ?auto_4337 ) ( IN-CITY ?auto_4333 ?auto_4337 ) ( not ( = ?auto_4333 ?auto_4335 ) ) ( not ( = ?auto_4338 ?auto_4334 ) ) ( OBJ-AT ?auto_4334 ?auto_4335 ) ( TRUCK-AT ?auto_4336 ?auto_4333 ) ( IN-TRUCK ?auto_4338 ?auto_4336 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4338 ?auto_4333 )
      ( DELIVER-2PKG ?auto_4338 ?auto_4334 ?auto_4333 )
      ( DELIVER-1PKG-VERIFY ?auto_4334 ?auto_4333 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4340 - OBJ
      ?auto_4341 - OBJ
      ?auto_4339 - LOCATION
    )
    :vars
    (
      ?auto_4342 - LOCATION
      ?auto_4343 - CITY
      ?auto_4344 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4342 ?auto_4343 ) ( IN-CITY ?auto_4339 ?auto_4343 ) ( not ( = ?auto_4339 ?auto_4342 ) ) ( not ( = ?auto_4340 ?auto_4341 ) ) ( OBJ-AT ?auto_4341 ?auto_4342 ) ( TRUCK-AT ?auto_4344 ?auto_4339 ) ( IN-TRUCK ?auto_4340 ?auto_4344 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4341 ?auto_4339 )
      ( DELIVER-2PKG-VERIFY ?auto_4340 ?auto_4341 ?auto_4339 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4346 - OBJ
      ?auto_4347 - OBJ
      ?auto_4345 - LOCATION
    )
    :vars
    (
      ?auto_4350 - LOCATION
      ?auto_4348 - CITY
      ?auto_4349 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4350 ?auto_4348 ) ( IN-CITY ?auto_4345 ?auto_4348 ) ( not ( = ?auto_4345 ?auto_4350 ) ) ( not ( = ?auto_4347 ?auto_4346 ) ) ( OBJ-AT ?auto_4346 ?auto_4350 ) ( TRUCK-AT ?auto_4349 ?auto_4345 ) ( IN-TRUCK ?auto_4347 ?auto_4349 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4347 ?auto_4346 ?auto_4345 )
      ( DELIVER-2PKG-VERIFY ?auto_4346 ?auto_4347 ?auto_4345 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4409 - OBJ
      ?auto_4408 - LOCATION
    )
    :vars
    (
      ?auto_4413 - LOCATION
      ?auto_4411 - CITY
      ?auto_4410 - OBJ
      ?auto_4412 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4413 ?auto_4411 ) ( IN-CITY ?auto_4408 ?auto_4411 ) ( not ( = ?auto_4408 ?auto_4413 ) ) ( not ( = ?auto_4410 ?auto_4409 ) ) ( OBJ-AT ?auto_4409 ?auto_4413 ) ( IN-TRUCK ?auto_4410 ?auto_4412 ) ( TRUCK-AT ?auto_4412 ?auto_4413 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4412 ?auto_4413 ?auto_4408 ?auto_4411 )
      ( DELIVER-2PKG ?auto_4410 ?auto_4409 ?auto_4408 )
      ( DELIVER-1PKG-VERIFY ?auto_4409 ?auto_4408 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4415 - OBJ
      ?auto_4416 - OBJ
      ?auto_4414 - LOCATION
    )
    :vars
    (
      ?auto_4417 - LOCATION
      ?auto_4418 - CITY
      ?auto_4419 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4417 ?auto_4418 ) ( IN-CITY ?auto_4414 ?auto_4418 ) ( not ( = ?auto_4414 ?auto_4417 ) ) ( not ( = ?auto_4415 ?auto_4416 ) ) ( OBJ-AT ?auto_4416 ?auto_4417 ) ( IN-TRUCK ?auto_4415 ?auto_4419 ) ( TRUCK-AT ?auto_4419 ?auto_4417 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4416 ?auto_4414 )
      ( DELIVER-2PKG-VERIFY ?auto_4415 ?auto_4416 ?auto_4414 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4421 - OBJ
      ?auto_4422 - OBJ
      ?auto_4420 - LOCATION
    )
    :vars
    (
      ?auto_4425 - LOCATION
      ?auto_4424 - CITY
      ?auto_4423 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4425 ?auto_4424 ) ( IN-CITY ?auto_4420 ?auto_4424 ) ( not ( = ?auto_4420 ?auto_4425 ) ) ( not ( = ?auto_4422 ?auto_4421 ) ) ( OBJ-AT ?auto_4421 ?auto_4425 ) ( IN-TRUCK ?auto_4422 ?auto_4423 ) ( TRUCK-AT ?auto_4423 ?auto_4425 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4422 ?auto_4421 ?auto_4420 )
      ( DELIVER-2PKG-VERIFY ?auto_4421 ?auto_4422 ?auto_4420 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4866 - OBJ
      ?auto_4867 - OBJ
      ?auto_4868 - OBJ
      ?auto_4865 - LOCATION
    )
    :vars
    (
      ?auto_4871 - TRUCK
      ?auto_4870 - LOCATION
      ?auto_4869 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4867 ?auto_4871 ) ( TRUCK-AT ?auto_4871 ?auto_4870 ) ( IN-CITY ?auto_4870 ?auto_4869 ) ( IN-CITY ?auto_4865 ?auto_4869 ) ( not ( = ?auto_4865 ?auto_4870 ) ) ( OBJ-AT ?auto_4866 ?auto_4865 ) ( not ( = ?auto_4866 ?auto_4867 ) ) ( OBJ-AT ?auto_4868 ?auto_4865 ) ( not ( = ?auto_4866 ?auto_4868 ) ) ( not ( = ?auto_4867 ?auto_4868 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4866 ?auto_4867 ?auto_4865 )
      ( DELIVER-3PKG-VERIFY ?auto_4866 ?auto_4867 ?auto_4868 ?auto_4865 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4888 - OBJ
      ?auto_4889 - OBJ
      ?auto_4890 - OBJ
      ?auto_4887 - LOCATION
    )
    :vars
    (
      ?auto_4894 - TRUCK
      ?auto_4892 - LOCATION
      ?auto_4891 - CITY
      ?auto_4893 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4890 ?auto_4894 ) ( TRUCK-AT ?auto_4894 ?auto_4892 ) ( IN-CITY ?auto_4892 ?auto_4891 ) ( IN-CITY ?auto_4887 ?auto_4891 ) ( not ( = ?auto_4887 ?auto_4892 ) ) ( OBJ-AT ?auto_4893 ?auto_4887 ) ( not ( = ?auto_4893 ?auto_4890 ) ) ( OBJ-AT ?auto_4888 ?auto_4887 ) ( OBJ-AT ?auto_4889 ?auto_4887 ) ( not ( = ?auto_4888 ?auto_4889 ) ) ( not ( = ?auto_4888 ?auto_4890 ) ) ( not ( = ?auto_4888 ?auto_4893 ) ) ( not ( = ?auto_4889 ?auto_4890 ) ) ( not ( = ?auto_4889 ?auto_4893 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4893 ?auto_4890 ?auto_4887 )
      ( DELIVER-3PKG-VERIFY ?auto_4888 ?auto_4889 ?auto_4890 ?auto_4887 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4900 - OBJ
      ?auto_4901 - OBJ
      ?auto_4902 - OBJ
      ?auto_4899 - LOCATION
    )
    :vars
    (
      ?auto_4906 - TRUCK
      ?auto_4904 - LOCATION
      ?auto_4903 - CITY
      ?auto_4905 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4901 ?auto_4906 ) ( TRUCK-AT ?auto_4906 ?auto_4904 ) ( IN-CITY ?auto_4904 ?auto_4903 ) ( IN-CITY ?auto_4899 ?auto_4903 ) ( not ( = ?auto_4899 ?auto_4904 ) ) ( OBJ-AT ?auto_4905 ?auto_4899 ) ( not ( = ?auto_4905 ?auto_4901 ) ) ( OBJ-AT ?auto_4900 ?auto_4899 ) ( OBJ-AT ?auto_4902 ?auto_4899 ) ( not ( = ?auto_4900 ?auto_4901 ) ) ( not ( = ?auto_4900 ?auto_4902 ) ) ( not ( = ?auto_4900 ?auto_4905 ) ) ( not ( = ?auto_4901 ?auto_4902 ) ) ( not ( = ?auto_4902 ?auto_4905 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4905 ?auto_4901 ?auto_4899 )
      ( DELIVER-3PKG-VERIFY ?auto_4900 ?auto_4901 ?auto_4902 ?auto_4899 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4938 - OBJ
      ?auto_4939 - OBJ
      ?auto_4940 - OBJ
      ?auto_4937 - LOCATION
    )
    :vars
    (
      ?auto_4944 - TRUCK
      ?auto_4942 - LOCATION
      ?auto_4941 - CITY
      ?auto_4943 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4938 ?auto_4944 ) ( TRUCK-AT ?auto_4944 ?auto_4942 ) ( IN-CITY ?auto_4942 ?auto_4941 ) ( IN-CITY ?auto_4937 ?auto_4941 ) ( not ( = ?auto_4937 ?auto_4942 ) ) ( OBJ-AT ?auto_4943 ?auto_4937 ) ( not ( = ?auto_4943 ?auto_4938 ) ) ( OBJ-AT ?auto_4939 ?auto_4937 ) ( OBJ-AT ?auto_4940 ?auto_4937 ) ( not ( = ?auto_4938 ?auto_4939 ) ) ( not ( = ?auto_4938 ?auto_4940 ) ) ( not ( = ?auto_4939 ?auto_4940 ) ) ( not ( = ?auto_4939 ?auto_4943 ) ) ( not ( = ?auto_4940 ?auto_4943 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4943 ?auto_4938 ?auto_4937 )
      ( DELIVER-3PKG-VERIFY ?auto_4938 ?auto_4939 ?auto_4940 ?auto_4937 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5019 - OBJ
      ?auto_5020 - OBJ
      ?auto_5021 - OBJ
      ?auto_5018 - LOCATION
    )
    :vars
    (
      ?auto_5022 - TRUCK
      ?auto_5023 - LOCATION
      ?auto_5024 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5022 ?auto_5023 ) ( IN-CITY ?auto_5023 ?auto_5024 ) ( IN-CITY ?auto_5018 ?auto_5024 ) ( not ( = ?auto_5018 ?auto_5023 ) ) ( OBJ-AT ?auto_5019 ?auto_5018 ) ( not ( = ?auto_5019 ?auto_5020 ) ) ( OBJ-AT ?auto_5020 ?auto_5023 ) ( OBJ-AT ?auto_5021 ?auto_5018 ) ( not ( = ?auto_5019 ?auto_5021 ) ) ( not ( = ?auto_5020 ?auto_5021 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5019 ?auto_5020 ?auto_5018 )
      ( DELIVER-3PKG-VERIFY ?auto_5019 ?auto_5020 ?auto_5021 ?auto_5018 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5041 - OBJ
      ?auto_5042 - OBJ
      ?auto_5043 - OBJ
      ?auto_5040 - LOCATION
    )
    :vars
    (
      ?auto_5044 - TRUCK
      ?auto_5045 - LOCATION
      ?auto_5046 - CITY
      ?auto_5047 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5044 ?auto_5045 ) ( IN-CITY ?auto_5045 ?auto_5046 ) ( IN-CITY ?auto_5040 ?auto_5046 ) ( not ( = ?auto_5040 ?auto_5045 ) ) ( OBJ-AT ?auto_5047 ?auto_5040 ) ( not ( = ?auto_5047 ?auto_5043 ) ) ( OBJ-AT ?auto_5043 ?auto_5045 ) ( OBJ-AT ?auto_5041 ?auto_5040 ) ( OBJ-AT ?auto_5042 ?auto_5040 ) ( not ( = ?auto_5041 ?auto_5042 ) ) ( not ( = ?auto_5041 ?auto_5043 ) ) ( not ( = ?auto_5041 ?auto_5047 ) ) ( not ( = ?auto_5042 ?auto_5043 ) ) ( not ( = ?auto_5042 ?auto_5047 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5047 ?auto_5043 ?auto_5040 )
      ( DELIVER-3PKG-VERIFY ?auto_5041 ?auto_5042 ?auto_5043 ?auto_5040 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5053 - OBJ
      ?auto_5054 - OBJ
      ?auto_5055 - OBJ
      ?auto_5052 - LOCATION
    )
    :vars
    (
      ?auto_5056 - TRUCK
      ?auto_5057 - LOCATION
      ?auto_5058 - CITY
      ?auto_5059 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5056 ?auto_5057 ) ( IN-CITY ?auto_5057 ?auto_5058 ) ( IN-CITY ?auto_5052 ?auto_5058 ) ( not ( = ?auto_5052 ?auto_5057 ) ) ( OBJ-AT ?auto_5059 ?auto_5052 ) ( not ( = ?auto_5059 ?auto_5054 ) ) ( OBJ-AT ?auto_5054 ?auto_5057 ) ( OBJ-AT ?auto_5053 ?auto_5052 ) ( OBJ-AT ?auto_5055 ?auto_5052 ) ( not ( = ?auto_5053 ?auto_5054 ) ) ( not ( = ?auto_5053 ?auto_5055 ) ) ( not ( = ?auto_5053 ?auto_5059 ) ) ( not ( = ?auto_5054 ?auto_5055 ) ) ( not ( = ?auto_5055 ?auto_5059 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5059 ?auto_5054 ?auto_5052 )
      ( DELIVER-3PKG-VERIFY ?auto_5053 ?auto_5054 ?auto_5055 ?auto_5052 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5091 - OBJ
      ?auto_5092 - OBJ
      ?auto_5093 - OBJ
      ?auto_5090 - LOCATION
    )
    :vars
    (
      ?auto_5094 - TRUCK
      ?auto_5095 - LOCATION
      ?auto_5096 - CITY
      ?auto_5097 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5094 ?auto_5095 ) ( IN-CITY ?auto_5095 ?auto_5096 ) ( IN-CITY ?auto_5090 ?auto_5096 ) ( not ( = ?auto_5090 ?auto_5095 ) ) ( OBJ-AT ?auto_5097 ?auto_5090 ) ( not ( = ?auto_5097 ?auto_5091 ) ) ( OBJ-AT ?auto_5091 ?auto_5095 ) ( OBJ-AT ?auto_5092 ?auto_5090 ) ( OBJ-AT ?auto_5093 ?auto_5090 ) ( not ( = ?auto_5091 ?auto_5092 ) ) ( not ( = ?auto_5091 ?auto_5093 ) ) ( not ( = ?auto_5092 ?auto_5093 ) ) ( not ( = ?auto_5092 ?auto_5097 ) ) ( not ( = ?auto_5093 ?auto_5097 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5097 ?auto_5091 ?auto_5090 )
      ( DELIVER-3PKG-VERIFY ?auto_5091 ?auto_5092 ?auto_5093 ?auto_5090 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5161 - OBJ
      ?auto_5162 - OBJ
      ?auto_5163 - OBJ
      ?auto_5160 - LOCATION
    )
    :vars
    (
      ?auto_5165 - LOCATION
      ?auto_5164 - CITY
      ?auto_5166 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5165 ?auto_5164 ) ( IN-CITY ?auto_5160 ?auto_5164 ) ( not ( = ?auto_5160 ?auto_5165 ) ) ( OBJ-AT ?auto_5161 ?auto_5160 ) ( not ( = ?auto_5161 ?auto_5163 ) ) ( OBJ-AT ?auto_5163 ?auto_5165 ) ( TRUCK-AT ?auto_5166 ?auto_5160 ) ( OBJ-AT ?auto_5162 ?auto_5160 ) ( not ( = ?auto_5161 ?auto_5162 ) ) ( not ( = ?auto_5162 ?auto_5163 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5161 ?auto_5163 ?auto_5160 )
      ( DELIVER-3PKG-VERIFY ?auto_5161 ?auto_5162 ?auto_5163 ?auto_5160 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5194 - OBJ
      ?auto_5195 - OBJ
      ?auto_5196 - OBJ
      ?auto_5193 - LOCATION
    )
    :vars
    (
      ?auto_5198 - LOCATION
      ?auto_5197 - CITY
      ?auto_5200 - OBJ
      ?auto_5199 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5198 ?auto_5197 ) ( IN-CITY ?auto_5193 ?auto_5197 ) ( not ( = ?auto_5193 ?auto_5198 ) ) ( OBJ-AT ?auto_5200 ?auto_5193 ) ( not ( = ?auto_5200 ?auto_5196 ) ) ( OBJ-AT ?auto_5196 ?auto_5198 ) ( TRUCK-AT ?auto_5199 ?auto_5193 ) ( OBJ-AT ?auto_5194 ?auto_5193 ) ( OBJ-AT ?auto_5195 ?auto_5193 ) ( not ( = ?auto_5194 ?auto_5195 ) ) ( not ( = ?auto_5194 ?auto_5196 ) ) ( not ( = ?auto_5194 ?auto_5200 ) ) ( not ( = ?auto_5195 ?auto_5196 ) ) ( not ( = ?auto_5195 ?auto_5200 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5200 ?auto_5196 ?auto_5193 )
      ( DELIVER-3PKG-VERIFY ?auto_5194 ?auto_5195 ?auto_5196 ?auto_5193 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5206 - OBJ
      ?auto_5207 - OBJ
      ?auto_5208 - OBJ
      ?auto_5205 - LOCATION
    )
    :vars
    (
      ?auto_5210 - LOCATION
      ?auto_5209 - CITY
      ?auto_5212 - OBJ
      ?auto_5211 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5210 ?auto_5209 ) ( IN-CITY ?auto_5205 ?auto_5209 ) ( not ( = ?auto_5205 ?auto_5210 ) ) ( OBJ-AT ?auto_5212 ?auto_5205 ) ( not ( = ?auto_5212 ?auto_5207 ) ) ( OBJ-AT ?auto_5207 ?auto_5210 ) ( TRUCK-AT ?auto_5211 ?auto_5205 ) ( OBJ-AT ?auto_5206 ?auto_5205 ) ( OBJ-AT ?auto_5208 ?auto_5205 ) ( not ( = ?auto_5206 ?auto_5207 ) ) ( not ( = ?auto_5206 ?auto_5208 ) ) ( not ( = ?auto_5206 ?auto_5212 ) ) ( not ( = ?auto_5207 ?auto_5208 ) ) ( not ( = ?auto_5208 ?auto_5212 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5212 ?auto_5207 ?auto_5205 )
      ( DELIVER-3PKG-VERIFY ?auto_5206 ?auto_5207 ?auto_5208 ?auto_5205 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5244 - OBJ
      ?auto_5245 - OBJ
      ?auto_5246 - OBJ
      ?auto_5243 - LOCATION
    )
    :vars
    (
      ?auto_5248 - LOCATION
      ?auto_5247 - CITY
      ?auto_5250 - OBJ
      ?auto_5249 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5248 ?auto_5247 ) ( IN-CITY ?auto_5243 ?auto_5247 ) ( not ( = ?auto_5243 ?auto_5248 ) ) ( OBJ-AT ?auto_5250 ?auto_5243 ) ( not ( = ?auto_5250 ?auto_5244 ) ) ( OBJ-AT ?auto_5244 ?auto_5248 ) ( TRUCK-AT ?auto_5249 ?auto_5243 ) ( OBJ-AT ?auto_5245 ?auto_5243 ) ( OBJ-AT ?auto_5246 ?auto_5243 ) ( not ( = ?auto_5244 ?auto_5245 ) ) ( not ( = ?auto_5244 ?auto_5246 ) ) ( not ( = ?auto_5245 ?auto_5246 ) ) ( not ( = ?auto_5245 ?auto_5250 ) ) ( not ( = ?auto_5246 ?auto_5250 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5250 ?auto_5244 ?auto_5243 )
      ( DELIVER-3PKG-VERIFY ?auto_5244 ?auto_5245 ?auto_5246 ?auto_5243 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5385 - OBJ
      ?auto_5386 - OBJ
      ?auto_5387 - OBJ
      ?auto_5384 - LOCATION
    )
    :vars
    (
      ?auto_5388 - LOCATION
      ?auto_5390 - CITY
      ?auto_5389 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5388 ?auto_5390 ) ( IN-CITY ?auto_5384 ?auto_5390 ) ( not ( = ?auto_5384 ?auto_5388 ) ) ( OBJ-AT ?auto_5387 ?auto_5384 ) ( not ( = ?auto_5387 ?auto_5385 ) ) ( OBJ-AT ?auto_5385 ?auto_5388 ) ( TRUCK-AT ?auto_5389 ?auto_5384 ) ( OBJ-AT ?auto_5386 ?auto_5384 ) ( not ( = ?auto_5385 ?auto_5386 ) ) ( not ( = ?auto_5386 ?auto_5387 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5387 ?auto_5385 ?auto_5384 )
      ( DELIVER-3PKG-VERIFY ?auto_5385 ?auto_5386 ?auto_5387 ?auto_5384 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5452 - OBJ
      ?auto_5451 - LOCATION
    )
    :vars
    (
      ?auto_5453 - LOCATION
      ?auto_5456 - CITY
      ?auto_5455 - OBJ
      ?auto_5454 - TRUCK
      ?auto_5457 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_5453 ?auto_5456 ) ( IN-CITY ?auto_5451 ?auto_5456 ) ( not ( = ?auto_5451 ?auto_5453 ) ) ( OBJ-AT ?auto_5455 ?auto_5451 ) ( not ( = ?auto_5455 ?auto_5452 ) ) ( OBJ-AT ?auto_5452 ?auto_5453 ) ( TRUCK-AT ?auto_5454 ?auto_5457 ) ( IN-CITY ?auto_5457 ?auto_5456 ) ( not ( = ?auto_5451 ?auto_5457 ) ) ( not ( = ?auto_5453 ?auto_5457 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5454 ?auto_5457 ?auto_5451 ?auto_5456 )
      ( DELIVER-2PKG ?auto_5455 ?auto_5452 ?auto_5451 )
      ( DELIVER-1PKG-VERIFY ?auto_5452 ?auto_5451 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5459 - OBJ
      ?auto_5460 - OBJ
      ?auto_5458 - LOCATION
    )
    :vars
    (
      ?auto_5462 - LOCATION
      ?auto_5461 - CITY
      ?auto_5463 - TRUCK
      ?auto_5464 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_5462 ?auto_5461 ) ( IN-CITY ?auto_5458 ?auto_5461 ) ( not ( = ?auto_5458 ?auto_5462 ) ) ( OBJ-AT ?auto_5459 ?auto_5458 ) ( not ( = ?auto_5459 ?auto_5460 ) ) ( OBJ-AT ?auto_5460 ?auto_5462 ) ( TRUCK-AT ?auto_5463 ?auto_5464 ) ( IN-CITY ?auto_5464 ?auto_5461 ) ( not ( = ?auto_5458 ?auto_5464 ) ) ( not ( = ?auto_5462 ?auto_5464 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5460 ?auto_5458 )
      ( DELIVER-2PKG-VERIFY ?auto_5459 ?auto_5460 ?auto_5458 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5474 - OBJ
      ?auto_5475 - OBJ
      ?auto_5473 - LOCATION
    )
    :vars
    (
      ?auto_5476 - LOCATION
      ?auto_5478 - CITY
      ?auto_5479 - TRUCK
      ?auto_5477 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_5476 ?auto_5478 ) ( IN-CITY ?auto_5473 ?auto_5478 ) ( not ( = ?auto_5473 ?auto_5476 ) ) ( OBJ-AT ?auto_5475 ?auto_5473 ) ( not ( = ?auto_5475 ?auto_5474 ) ) ( OBJ-AT ?auto_5474 ?auto_5476 ) ( TRUCK-AT ?auto_5479 ?auto_5477 ) ( IN-CITY ?auto_5477 ?auto_5478 ) ( not ( = ?auto_5473 ?auto_5477 ) ) ( not ( = ?auto_5476 ?auto_5477 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5475 ?auto_5474 ?auto_5473 )
      ( DELIVER-2PKG-VERIFY ?auto_5474 ?auto_5475 ?auto_5473 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5497 - OBJ
      ?auto_5498 - OBJ
      ?auto_5499 - OBJ
      ?auto_5496 - LOCATION
    )
    :vars
    (
      ?auto_5500 - LOCATION
      ?auto_5502 - CITY
      ?auto_5503 - TRUCK
      ?auto_5501 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_5500 ?auto_5502 ) ( IN-CITY ?auto_5496 ?auto_5502 ) ( not ( = ?auto_5496 ?auto_5500 ) ) ( OBJ-AT ?auto_5497 ?auto_5496 ) ( not ( = ?auto_5497 ?auto_5499 ) ) ( OBJ-AT ?auto_5499 ?auto_5500 ) ( TRUCK-AT ?auto_5503 ?auto_5501 ) ( IN-CITY ?auto_5501 ?auto_5502 ) ( not ( = ?auto_5496 ?auto_5501 ) ) ( not ( = ?auto_5500 ?auto_5501 ) ) ( OBJ-AT ?auto_5498 ?auto_5496 ) ( not ( = ?auto_5497 ?auto_5498 ) ) ( not ( = ?auto_5498 ?auto_5499 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5497 ?auto_5499 ?auto_5496 )
      ( DELIVER-3PKG-VERIFY ?auto_5497 ?auto_5498 ?auto_5499 ?auto_5496 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5513 - OBJ
      ?auto_5514 - OBJ
      ?auto_5515 - OBJ
      ?auto_5512 - LOCATION
    )
    :vars
    (
      ?auto_5516 - LOCATION
      ?auto_5518 - CITY
      ?auto_5519 - TRUCK
      ?auto_5517 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_5516 ?auto_5518 ) ( IN-CITY ?auto_5512 ?auto_5518 ) ( not ( = ?auto_5512 ?auto_5516 ) ) ( OBJ-AT ?auto_5515 ?auto_5512 ) ( not ( = ?auto_5515 ?auto_5514 ) ) ( OBJ-AT ?auto_5514 ?auto_5516 ) ( TRUCK-AT ?auto_5519 ?auto_5517 ) ( IN-CITY ?auto_5517 ?auto_5518 ) ( not ( = ?auto_5512 ?auto_5517 ) ) ( not ( = ?auto_5516 ?auto_5517 ) ) ( OBJ-AT ?auto_5513 ?auto_5512 ) ( not ( = ?auto_5513 ?auto_5514 ) ) ( not ( = ?auto_5513 ?auto_5515 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5515 ?auto_5514 ?auto_5512 )
      ( DELIVER-3PKG-VERIFY ?auto_5513 ?auto_5514 ?auto_5515 ?auto_5512 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5580 - OBJ
      ?auto_5581 - OBJ
      ?auto_5582 - OBJ
      ?auto_5579 - LOCATION
    )
    :vars
    (
      ?auto_5583 - LOCATION
      ?auto_5585 - CITY
      ?auto_5586 - TRUCK
      ?auto_5584 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_5583 ?auto_5585 ) ( IN-CITY ?auto_5579 ?auto_5585 ) ( not ( = ?auto_5579 ?auto_5583 ) ) ( OBJ-AT ?auto_5582 ?auto_5579 ) ( not ( = ?auto_5582 ?auto_5580 ) ) ( OBJ-AT ?auto_5580 ?auto_5583 ) ( TRUCK-AT ?auto_5586 ?auto_5584 ) ( IN-CITY ?auto_5584 ?auto_5585 ) ( not ( = ?auto_5579 ?auto_5584 ) ) ( not ( = ?auto_5583 ?auto_5584 ) ) ( OBJ-AT ?auto_5581 ?auto_5579 ) ( not ( = ?auto_5580 ?auto_5581 ) ) ( not ( = ?auto_5581 ?auto_5582 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5582 ?auto_5580 ?auto_5579 )
      ( DELIVER-3PKG-VERIFY ?auto_5580 ?auto_5581 ?auto_5582 ?auto_5579 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5771 - OBJ
      ?auto_5772 - OBJ
      ?auto_5773 - OBJ
      ?auto_5770 - LOCATION
    )
    :vars
    (
      ?auto_5775 - LOCATION
      ?auto_5776 - CITY
      ?auto_5777 - TRUCK
      ?auto_5774 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_5775 ?auto_5776 ) ( IN-CITY ?auto_5770 ?auto_5776 ) ( not ( = ?auto_5770 ?auto_5775 ) ) ( OBJ-AT ?auto_5772 ?auto_5770 ) ( not ( = ?auto_5772 ?auto_5771 ) ) ( OBJ-AT ?auto_5771 ?auto_5775 ) ( TRUCK-AT ?auto_5777 ?auto_5774 ) ( IN-CITY ?auto_5774 ?auto_5776 ) ( not ( = ?auto_5770 ?auto_5774 ) ) ( not ( = ?auto_5775 ?auto_5774 ) ) ( OBJ-AT ?auto_5773 ?auto_5770 ) ( not ( = ?auto_5771 ?auto_5773 ) ) ( not ( = ?auto_5772 ?auto_5773 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5772 ?auto_5771 ?auto_5770 )
      ( DELIVER-3PKG-VERIFY ?auto_5771 ?auto_5772 ?auto_5773 ?auto_5770 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5890 - OBJ
      ?auto_5891 - OBJ
      ?auto_5892 - OBJ
      ?auto_5889 - LOCATION
    )
    :vars
    (
      ?auto_5893 - LOCATION
      ?auto_5894 - CITY
      ?auto_5895 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5893 ?auto_5894 ) ( IN-CITY ?auto_5889 ?auto_5894 ) ( not ( = ?auto_5889 ?auto_5893 ) ) ( OBJ-AT ?auto_5890 ?auto_5889 ) ( not ( = ?auto_5890 ?auto_5891 ) ) ( OBJ-AT ?auto_5891 ?auto_5893 ) ( TRUCK-AT ?auto_5895 ?auto_5889 ) ( OBJ-AT ?auto_5892 ?auto_5889 ) ( not ( = ?auto_5890 ?auto_5892 ) ) ( not ( = ?auto_5891 ?auto_5892 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5890 ?auto_5891 ?auto_5889 )
      ( DELIVER-3PKG-VERIFY ?auto_5890 ?auto_5891 ?auto_5892 ?auto_5889 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6185 - OBJ
      ?auto_6184 - LOCATION
    )
    :vars
    (
      ?auto_6187 - LOCATION
      ?auto_6188 - CITY
      ?auto_6189 - OBJ
      ?auto_6186 - TRUCK
      ?auto_6190 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6187 ?auto_6188 ) ( IN-CITY ?auto_6184 ?auto_6188 ) ( not ( = ?auto_6184 ?auto_6187 ) ) ( not ( = ?auto_6189 ?auto_6185 ) ) ( OBJ-AT ?auto_6185 ?auto_6187 ) ( IN-TRUCK ?auto_6189 ?auto_6186 ) ( TRUCK-AT ?auto_6186 ?auto_6190 ) ( IN-CITY ?auto_6190 ?auto_6188 ) ( not ( = ?auto_6184 ?auto_6190 ) ) ( not ( = ?auto_6187 ?auto_6190 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6186 ?auto_6190 ?auto_6184 ?auto_6188 )
      ( DELIVER-2PKG ?auto_6189 ?auto_6185 ?auto_6184 )
      ( DELIVER-1PKG-VERIFY ?auto_6185 ?auto_6184 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6192 - OBJ
      ?auto_6193 - OBJ
      ?auto_6191 - LOCATION
    )
    :vars
    (
      ?auto_6197 - LOCATION
      ?auto_6194 - CITY
      ?auto_6196 - TRUCK
      ?auto_6195 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6197 ?auto_6194 ) ( IN-CITY ?auto_6191 ?auto_6194 ) ( not ( = ?auto_6191 ?auto_6197 ) ) ( not ( = ?auto_6192 ?auto_6193 ) ) ( OBJ-AT ?auto_6193 ?auto_6197 ) ( IN-TRUCK ?auto_6192 ?auto_6196 ) ( TRUCK-AT ?auto_6196 ?auto_6195 ) ( IN-CITY ?auto_6195 ?auto_6194 ) ( not ( = ?auto_6191 ?auto_6195 ) ) ( not ( = ?auto_6197 ?auto_6195 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6193 ?auto_6191 )
      ( DELIVER-2PKG-VERIFY ?auto_6192 ?auto_6193 ?auto_6191 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6207 - OBJ
      ?auto_6208 - OBJ
      ?auto_6206 - LOCATION
    )
    :vars
    (
      ?auto_6210 - LOCATION
      ?auto_6209 - CITY
      ?auto_6212 - TRUCK
      ?auto_6211 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6210 ?auto_6209 ) ( IN-CITY ?auto_6206 ?auto_6209 ) ( not ( = ?auto_6206 ?auto_6210 ) ) ( not ( = ?auto_6208 ?auto_6207 ) ) ( OBJ-AT ?auto_6207 ?auto_6210 ) ( IN-TRUCK ?auto_6208 ?auto_6212 ) ( TRUCK-AT ?auto_6212 ?auto_6211 ) ( IN-CITY ?auto_6211 ?auto_6209 ) ( not ( = ?auto_6206 ?auto_6211 ) ) ( not ( = ?auto_6210 ?auto_6211 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6208 ?auto_6207 ?auto_6206 )
      ( DELIVER-2PKG-VERIFY ?auto_6207 ?auto_6208 ?auto_6206 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6389 - OBJ
      ?auto_6388 - LOCATION
    )
    :vars
    (
      ?auto_6392 - LOCATION
      ?auto_6391 - CITY
      ?auto_6390 - OBJ
      ?auto_6394 - TRUCK
      ?auto_6393 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6392 ?auto_6391 ) ( IN-CITY ?auto_6388 ?auto_6391 ) ( not ( = ?auto_6388 ?auto_6392 ) ) ( not ( = ?auto_6390 ?auto_6389 ) ) ( OBJ-AT ?auto_6389 ?auto_6392 ) ( TRUCK-AT ?auto_6394 ?auto_6393 ) ( IN-CITY ?auto_6393 ?auto_6391 ) ( not ( = ?auto_6388 ?auto_6393 ) ) ( not ( = ?auto_6392 ?auto_6393 ) ) ( OBJ-AT ?auto_6390 ?auto_6393 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6390 ?auto_6394 ?auto_6393 )
      ( DELIVER-2PKG ?auto_6390 ?auto_6389 ?auto_6388 )
      ( DELIVER-1PKG-VERIFY ?auto_6389 ?auto_6388 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6396 - OBJ
      ?auto_6397 - OBJ
      ?auto_6395 - LOCATION
    )
    :vars
    (
      ?auto_6398 - LOCATION
      ?auto_6401 - CITY
      ?auto_6400 - TRUCK
      ?auto_6399 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6398 ?auto_6401 ) ( IN-CITY ?auto_6395 ?auto_6401 ) ( not ( = ?auto_6395 ?auto_6398 ) ) ( not ( = ?auto_6396 ?auto_6397 ) ) ( OBJ-AT ?auto_6397 ?auto_6398 ) ( TRUCK-AT ?auto_6400 ?auto_6399 ) ( IN-CITY ?auto_6399 ?auto_6401 ) ( not ( = ?auto_6395 ?auto_6399 ) ) ( not ( = ?auto_6398 ?auto_6399 ) ) ( OBJ-AT ?auto_6396 ?auto_6399 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6397 ?auto_6395 )
      ( DELIVER-2PKG-VERIFY ?auto_6396 ?auto_6397 ?auto_6395 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6406 - OBJ
      ?auto_6407 - OBJ
      ?auto_6405 - LOCATION
    )
    :vars
    (
      ?auto_6411 - LOCATION
      ?auto_6409 - CITY
      ?auto_6410 - TRUCK
      ?auto_6408 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6411 ?auto_6409 ) ( IN-CITY ?auto_6405 ?auto_6409 ) ( not ( = ?auto_6405 ?auto_6411 ) ) ( not ( = ?auto_6407 ?auto_6406 ) ) ( OBJ-AT ?auto_6406 ?auto_6411 ) ( TRUCK-AT ?auto_6410 ?auto_6408 ) ( IN-CITY ?auto_6408 ?auto_6409 ) ( not ( = ?auto_6405 ?auto_6408 ) ) ( not ( = ?auto_6411 ?auto_6408 ) ) ( OBJ-AT ?auto_6407 ?auto_6408 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6407 ?auto_6406 ?auto_6405 )
      ( DELIVER-2PKG-VERIFY ?auto_6406 ?auto_6407 ?auto_6405 ) )
  )

)

