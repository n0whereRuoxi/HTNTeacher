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
      ?auto_4038 - OBJ
      ?auto_4037 - LOCATION
    )
    :vars
    (
      ?auto_4039 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4039 ?auto_4037 ) ( IN-TRUCK ?auto_4038 ?auto_4039 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_4038 ?auto_4039 ?auto_4037 )
      ( DELIVER-1PKG-VERIFY ?auto_4038 ?auto_4037 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4050 - OBJ
      ?auto_4049 - LOCATION
    )
    :vars
    (
      ?auto_4051 - TRUCK
      ?auto_4052 - LOCATION
      ?auto_4053 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4050 ?auto_4051 ) ( TRUCK-AT ?auto_4051 ?auto_4052 ) ( IN-CITY ?auto_4052 ?auto_4053 ) ( IN-CITY ?auto_4049 ?auto_4053 ) ( not ( = ?auto_4049 ?auto_4052 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4051 ?auto_4052 ?auto_4049 ?auto_4053 )
      ( DELIVER-1PKG ?auto_4050 ?auto_4049 )
      ( DELIVER-1PKG-VERIFY ?auto_4050 ?auto_4049 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4068 - OBJ
      ?auto_4067 - LOCATION
    )
    :vars
    (
      ?auto_4071 - TRUCK
      ?auto_4069 - LOCATION
      ?auto_4070 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4071 ?auto_4069 ) ( IN-CITY ?auto_4069 ?auto_4070 ) ( IN-CITY ?auto_4067 ?auto_4070 ) ( not ( = ?auto_4067 ?auto_4069 ) ) ( OBJ-AT ?auto_4068 ?auto_4069 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4068 ?auto_4071 ?auto_4069 )
      ( DELIVER-1PKG ?auto_4068 ?auto_4067 )
      ( DELIVER-1PKG-VERIFY ?auto_4068 ?auto_4067 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4086 - OBJ
      ?auto_4085 - LOCATION
    )
    :vars
    (
      ?auto_4088 - LOCATION
      ?auto_4089 - CITY
      ?auto_4087 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4088 ?auto_4089 ) ( IN-CITY ?auto_4085 ?auto_4089 ) ( not ( = ?auto_4085 ?auto_4088 ) ) ( OBJ-AT ?auto_4086 ?auto_4088 ) ( TRUCK-AT ?auto_4087 ?auto_4085 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4087 ?auto_4085 ?auto_4088 ?auto_4089 )
      ( DELIVER-1PKG ?auto_4086 ?auto_4085 )
      ( DELIVER-1PKG-VERIFY ?auto_4086 ?auto_4085 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4146 - OBJ
      ?auto_4147 - OBJ
      ?auto_4145 - LOCATION
    )
    :vars
    (
      ?auto_4148 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4148 ?auto_4145 ) ( IN-TRUCK ?auto_4147 ?auto_4148 ) ( OBJ-AT ?auto_4146 ?auto_4145 ) ( not ( = ?auto_4146 ?auto_4147 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4147 ?auto_4145 )
      ( DELIVER-2PKG-VERIFY ?auto_4146 ?auto_4147 ?auto_4145 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4150 - OBJ
      ?auto_4151 - OBJ
      ?auto_4149 - LOCATION
    )
    :vars
    (
      ?auto_4152 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4152 ?auto_4149 ) ( IN-TRUCK ?auto_4150 ?auto_4152 ) ( OBJ-AT ?auto_4151 ?auto_4149 ) ( not ( = ?auto_4150 ?auto_4151 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4150 ?auto_4149 )
      ( DELIVER-2PKG-VERIFY ?auto_4150 ?auto_4151 ?auto_4149 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4158 - OBJ
      ?auto_4159 - OBJ
      ?auto_4160 - OBJ
      ?auto_4157 - LOCATION
    )
    :vars
    (
      ?auto_4161 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4161 ?auto_4157 ) ( IN-TRUCK ?auto_4160 ?auto_4161 ) ( OBJ-AT ?auto_4158 ?auto_4157 ) ( OBJ-AT ?auto_4159 ?auto_4157 ) ( not ( = ?auto_4158 ?auto_4159 ) ) ( not ( = ?auto_4158 ?auto_4160 ) ) ( not ( = ?auto_4159 ?auto_4160 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4160 ?auto_4157 )
      ( DELIVER-3PKG-VERIFY ?auto_4158 ?auto_4159 ?auto_4160 ?auto_4157 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4163 - OBJ
      ?auto_4164 - OBJ
      ?auto_4165 - OBJ
      ?auto_4162 - LOCATION
    )
    :vars
    (
      ?auto_4166 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4166 ?auto_4162 ) ( IN-TRUCK ?auto_4164 ?auto_4166 ) ( OBJ-AT ?auto_4163 ?auto_4162 ) ( OBJ-AT ?auto_4165 ?auto_4162 ) ( not ( = ?auto_4163 ?auto_4164 ) ) ( not ( = ?auto_4163 ?auto_4165 ) ) ( not ( = ?auto_4164 ?auto_4165 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4164 ?auto_4162 )
      ( DELIVER-3PKG-VERIFY ?auto_4163 ?auto_4164 ?auto_4165 ?auto_4162 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4173 - OBJ
      ?auto_4174 - OBJ
      ?auto_4175 - OBJ
      ?auto_4172 - LOCATION
    )
    :vars
    (
      ?auto_4176 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4176 ?auto_4172 ) ( IN-TRUCK ?auto_4173 ?auto_4176 ) ( OBJ-AT ?auto_4174 ?auto_4172 ) ( OBJ-AT ?auto_4175 ?auto_4172 ) ( not ( = ?auto_4173 ?auto_4174 ) ) ( not ( = ?auto_4173 ?auto_4175 ) ) ( not ( = ?auto_4174 ?auto_4175 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4173 ?auto_4172 )
      ( DELIVER-3PKG-VERIFY ?auto_4173 ?auto_4174 ?auto_4175 ?auto_4172 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4198 - OBJ
      ?auto_4199 - OBJ
      ?auto_4197 - LOCATION
    )
    :vars
    (
      ?auto_4200 - TRUCK
      ?auto_4202 - LOCATION
      ?auto_4201 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4199 ?auto_4200 ) ( TRUCK-AT ?auto_4200 ?auto_4202 ) ( IN-CITY ?auto_4202 ?auto_4201 ) ( IN-CITY ?auto_4197 ?auto_4201 ) ( not ( = ?auto_4197 ?auto_4202 ) ) ( OBJ-AT ?auto_4198 ?auto_4197 ) ( not ( = ?auto_4198 ?auto_4199 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4199 ?auto_4197 )
      ( DELIVER-2PKG-VERIFY ?auto_4198 ?auto_4199 ?auto_4197 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4204 - OBJ
      ?auto_4205 - OBJ
      ?auto_4203 - LOCATION
    )
    :vars
    (
      ?auto_4207 - TRUCK
      ?auto_4208 - LOCATION
      ?auto_4206 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4204 ?auto_4207 ) ( TRUCK-AT ?auto_4207 ?auto_4208 ) ( IN-CITY ?auto_4208 ?auto_4206 ) ( IN-CITY ?auto_4203 ?auto_4206 ) ( not ( = ?auto_4203 ?auto_4208 ) ) ( OBJ-AT ?auto_4205 ?auto_4203 ) ( not ( = ?auto_4205 ?auto_4204 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4205 ?auto_4204 ?auto_4203 )
      ( DELIVER-2PKG-VERIFY ?auto_4204 ?auto_4205 ?auto_4203 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4217 - OBJ
      ?auto_4218 - OBJ
      ?auto_4219 - OBJ
      ?auto_4216 - LOCATION
    )
    :vars
    (
      ?auto_4221 - TRUCK
      ?auto_4222 - LOCATION
      ?auto_4220 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4219 ?auto_4221 ) ( TRUCK-AT ?auto_4221 ?auto_4222 ) ( IN-CITY ?auto_4222 ?auto_4220 ) ( IN-CITY ?auto_4216 ?auto_4220 ) ( not ( = ?auto_4216 ?auto_4222 ) ) ( OBJ-AT ?auto_4217 ?auto_4216 ) ( not ( = ?auto_4217 ?auto_4219 ) ) ( OBJ-AT ?auto_4218 ?auto_4216 ) ( not ( = ?auto_4217 ?auto_4218 ) ) ( not ( = ?auto_4218 ?auto_4219 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4217 ?auto_4219 ?auto_4216 )
      ( DELIVER-3PKG-VERIFY ?auto_4217 ?auto_4218 ?auto_4219 ?auto_4216 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4224 - OBJ
      ?auto_4225 - OBJ
      ?auto_4226 - OBJ
      ?auto_4223 - LOCATION
    )
    :vars
    (
      ?auto_4228 - TRUCK
      ?auto_4229 - LOCATION
      ?auto_4227 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4225 ?auto_4228 ) ( TRUCK-AT ?auto_4228 ?auto_4229 ) ( IN-CITY ?auto_4229 ?auto_4227 ) ( IN-CITY ?auto_4223 ?auto_4227 ) ( not ( = ?auto_4223 ?auto_4229 ) ) ( OBJ-AT ?auto_4226 ?auto_4223 ) ( not ( = ?auto_4226 ?auto_4225 ) ) ( OBJ-AT ?auto_4224 ?auto_4223 ) ( not ( = ?auto_4224 ?auto_4225 ) ) ( not ( = ?auto_4224 ?auto_4226 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4226 ?auto_4225 ?auto_4223 )
      ( DELIVER-3PKG-VERIFY ?auto_4224 ?auto_4225 ?auto_4226 ?auto_4223 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4238 - OBJ
      ?auto_4239 - OBJ
      ?auto_4240 - OBJ
      ?auto_4237 - LOCATION
    )
    :vars
    (
      ?auto_4242 - TRUCK
      ?auto_4243 - LOCATION
      ?auto_4241 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4238 ?auto_4242 ) ( TRUCK-AT ?auto_4242 ?auto_4243 ) ( IN-CITY ?auto_4243 ?auto_4241 ) ( IN-CITY ?auto_4237 ?auto_4241 ) ( not ( = ?auto_4237 ?auto_4243 ) ) ( OBJ-AT ?auto_4239 ?auto_4237 ) ( not ( = ?auto_4239 ?auto_4238 ) ) ( OBJ-AT ?auto_4240 ?auto_4237 ) ( not ( = ?auto_4238 ?auto_4240 ) ) ( not ( = ?auto_4239 ?auto_4240 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4239 ?auto_4238 ?auto_4237 )
      ( DELIVER-3PKG-VERIFY ?auto_4238 ?auto_4239 ?auto_4240 ?auto_4237 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4267 - OBJ
      ?auto_4266 - LOCATION
    )
    :vars
    (
      ?auto_4269 - TRUCK
      ?auto_4270 - LOCATION
      ?auto_4268 - CITY
      ?auto_4271 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4269 ?auto_4270 ) ( IN-CITY ?auto_4270 ?auto_4268 ) ( IN-CITY ?auto_4266 ?auto_4268 ) ( not ( = ?auto_4266 ?auto_4270 ) ) ( OBJ-AT ?auto_4271 ?auto_4266 ) ( not ( = ?auto_4271 ?auto_4267 ) ) ( OBJ-AT ?auto_4267 ?auto_4270 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4267 ?auto_4269 ?auto_4270 )
      ( DELIVER-2PKG ?auto_4271 ?auto_4267 ?auto_4266 )
      ( DELIVER-1PKG-VERIFY ?auto_4267 ?auto_4266 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4273 - OBJ
      ?auto_4274 - OBJ
      ?auto_4272 - LOCATION
    )
    :vars
    (
      ?auto_4276 - TRUCK
      ?auto_4277 - LOCATION
      ?auto_4275 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4276 ?auto_4277 ) ( IN-CITY ?auto_4277 ?auto_4275 ) ( IN-CITY ?auto_4272 ?auto_4275 ) ( not ( = ?auto_4272 ?auto_4277 ) ) ( OBJ-AT ?auto_4273 ?auto_4272 ) ( not ( = ?auto_4273 ?auto_4274 ) ) ( OBJ-AT ?auto_4274 ?auto_4277 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4274 ?auto_4272 )
      ( DELIVER-2PKG-VERIFY ?auto_4273 ?auto_4274 ?auto_4272 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4279 - OBJ
      ?auto_4280 - OBJ
      ?auto_4278 - LOCATION
    )
    :vars
    (
      ?auto_4283 - TRUCK
      ?auto_4282 - LOCATION
      ?auto_4281 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4283 ?auto_4282 ) ( IN-CITY ?auto_4282 ?auto_4281 ) ( IN-CITY ?auto_4278 ?auto_4281 ) ( not ( = ?auto_4278 ?auto_4282 ) ) ( OBJ-AT ?auto_4280 ?auto_4278 ) ( not ( = ?auto_4280 ?auto_4279 ) ) ( OBJ-AT ?auto_4279 ?auto_4282 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4280 ?auto_4279 ?auto_4278 )
      ( DELIVER-2PKG-VERIFY ?auto_4279 ?auto_4280 ?auto_4278 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4292 - OBJ
      ?auto_4293 - OBJ
      ?auto_4294 - OBJ
      ?auto_4291 - LOCATION
    )
    :vars
    (
      ?auto_4297 - TRUCK
      ?auto_4296 - LOCATION
      ?auto_4295 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4297 ?auto_4296 ) ( IN-CITY ?auto_4296 ?auto_4295 ) ( IN-CITY ?auto_4291 ?auto_4295 ) ( not ( = ?auto_4291 ?auto_4296 ) ) ( OBJ-AT ?auto_4293 ?auto_4291 ) ( not ( = ?auto_4293 ?auto_4294 ) ) ( OBJ-AT ?auto_4294 ?auto_4296 ) ( OBJ-AT ?auto_4292 ?auto_4291 ) ( not ( = ?auto_4292 ?auto_4293 ) ) ( not ( = ?auto_4292 ?auto_4294 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4293 ?auto_4294 ?auto_4291 )
      ( DELIVER-3PKG-VERIFY ?auto_4292 ?auto_4293 ?auto_4294 ?auto_4291 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4299 - OBJ
      ?auto_4300 - OBJ
      ?auto_4301 - OBJ
      ?auto_4298 - LOCATION
    )
    :vars
    (
      ?auto_4304 - TRUCK
      ?auto_4303 - LOCATION
      ?auto_4302 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4304 ?auto_4303 ) ( IN-CITY ?auto_4303 ?auto_4302 ) ( IN-CITY ?auto_4298 ?auto_4302 ) ( not ( = ?auto_4298 ?auto_4303 ) ) ( OBJ-AT ?auto_4299 ?auto_4298 ) ( not ( = ?auto_4299 ?auto_4300 ) ) ( OBJ-AT ?auto_4300 ?auto_4303 ) ( OBJ-AT ?auto_4301 ?auto_4298 ) ( not ( = ?auto_4299 ?auto_4301 ) ) ( not ( = ?auto_4300 ?auto_4301 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4299 ?auto_4300 ?auto_4298 )
      ( DELIVER-3PKG-VERIFY ?auto_4299 ?auto_4300 ?auto_4301 ?auto_4298 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4313 - OBJ
      ?auto_4314 - OBJ
      ?auto_4315 - OBJ
      ?auto_4312 - LOCATION
    )
    :vars
    (
      ?auto_4318 - TRUCK
      ?auto_4317 - LOCATION
      ?auto_4316 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4318 ?auto_4317 ) ( IN-CITY ?auto_4317 ?auto_4316 ) ( IN-CITY ?auto_4312 ?auto_4316 ) ( not ( = ?auto_4312 ?auto_4317 ) ) ( OBJ-AT ?auto_4314 ?auto_4312 ) ( not ( = ?auto_4314 ?auto_4313 ) ) ( OBJ-AT ?auto_4313 ?auto_4317 ) ( OBJ-AT ?auto_4315 ?auto_4312 ) ( not ( = ?auto_4313 ?auto_4315 ) ) ( not ( = ?auto_4314 ?auto_4315 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4314 ?auto_4313 ?auto_4312 )
      ( DELIVER-3PKG-VERIFY ?auto_4313 ?auto_4314 ?auto_4315 ?auto_4312 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4342 - OBJ
      ?auto_4341 - LOCATION
    )
    :vars
    (
      ?auto_4345 - LOCATION
      ?auto_4343 - CITY
      ?auto_4344 - OBJ
      ?auto_4346 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4345 ?auto_4343 ) ( IN-CITY ?auto_4341 ?auto_4343 ) ( not ( = ?auto_4341 ?auto_4345 ) ) ( OBJ-AT ?auto_4344 ?auto_4341 ) ( not ( = ?auto_4344 ?auto_4342 ) ) ( OBJ-AT ?auto_4342 ?auto_4345 ) ( TRUCK-AT ?auto_4346 ?auto_4341 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4346 ?auto_4341 ?auto_4345 ?auto_4343 )
      ( DELIVER-2PKG ?auto_4344 ?auto_4342 ?auto_4341 )
      ( DELIVER-1PKG-VERIFY ?auto_4342 ?auto_4341 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4348 - OBJ
      ?auto_4349 - OBJ
      ?auto_4347 - LOCATION
    )
    :vars
    (
      ?auto_4350 - LOCATION
      ?auto_4352 - CITY
      ?auto_4351 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4350 ?auto_4352 ) ( IN-CITY ?auto_4347 ?auto_4352 ) ( not ( = ?auto_4347 ?auto_4350 ) ) ( OBJ-AT ?auto_4348 ?auto_4347 ) ( not ( = ?auto_4348 ?auto_4349 ) ) ( OBJ-AT ?auto_4349 ?auto_4350 ) ( TRUCK-AT ?auto_4351 ?auto_4347 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4349 ?auto_4347 )
      ( DELIVER-2PKG-VERIFY ?auto_4348 ?auto_4349 ?auto_4347 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4354 - OBJ
      ?auto_4355 - OBJ
      ?auto_4353 - LOCATION
    )
    :vars
    (
      ?auto_4358 - LOCATION
      ?auto_4356 - CITY
      ?auto_4357 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4358 ?auto_4356 ) ( IN-CITY ?auto_4353 ?auto_4356 ) ( not ( = ?auto_4353 ?auto_4358 ) ) ( OBJ-AT ?auto_4355 ?auto_4353 ) ( not ( = ?auto_4355 ?auto_4354 ) ) ( OBJ-AT ?auto_4354 ?auto_4358 ) ( TRUCK-AT ?auto_4357 ?auto_4353 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4355 ?auto_4354 ?auto_4353 )
      ( DELIVER-2PKG-VERIFY ?auto_4354 ?auto_4355 ?auto_4353 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4367 - OBJ
      ?auto_4368 - OBJ
      ?auto_4369 - OBJ
      ?auto_4366 - LOCATION
    )
    :vars
    (
      ?auto_4372 - LOCATION
      ?auto_4370 - CITY
      ?auto_4371 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4372 ?auto_4370 ) ( IN-CITY ?auto_4366 ?auto_4370 ) ( not ( = ?auto_4366 ?auto_4372 ) ) ( OBJ-AT ?auto_4368 ?auto_4366 ) ( not ( = ?auto_4368 ?auto_4369 ) ) ( OBJ-AT ?auto_4369 ?auto_4372 ) ( TRUCK-AT ?auto_4371 ?auto_4366 ) ( OBJ-AT ?auto_4367 ?auto_4366 ) ( not ( = ?auto_4367 ?auto_4368 ) ) ( not ( = ?auto_4367 ?auto_4369 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4368 ?auto_4369 ?auto_4366 )
      ( DELIVER-3PKG-VERIFY ?auto_4367 ?auto_4368 ?auto_4369 ?auto_4366 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4374 - OBJ
      ?auto_4375 - OBJ
      ?auto_4376 - OBJ
      ?auto_4373 - LOCATION
    )
    :vars
    (
      ?auto_4379 - LOCATION
      ?auto_4377 - CITY
      ?auto_4378 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4379 ?auto_4377 ) ( IN-CITY ?auto_4373 ?auto_4377 ) ( not ( = ?auto_4373 ?auto_4379 ) ) ( OBJ-AT ?auto_4376 ?auto_4373 ) ( not ( = ?auto_4376 ?auto_4375 ) ) ( OBJ-AT ?auto_4375 ?auto_4379 ) ( TRUCK-AT ?auto_4378 ?auto_4373 ) ( OBJ-AT ?auto_4374 ?auto_4373 ) ( not ( = ?auto_4374 ?auto_4375 ) ) ( not ( = ?auto_4374 ?auto_4376 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4376 ?auto_4375 ?auto_4373 )
      ( DELIVER-3PKG-VERIFY ?auto_4374 ?auto_4375 ?auto_4376 ?auto_4373 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4388 - OBJ
      ?auto_4389 - OBJ
      ?auto_4390 - OBJ
      ?auto_4387 - LOCATION
    )
    :vars
    (
      ?auto_4393 - LOCATION
      ?auto_4391 - CITY
      ?auto_4392 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4393 ?auto_4391 ) ( IN-CITY ?auto_4387 ?auto_4391 ) ( not ( = ?auto_4387 ?auto_4393 ) ) ( OBJ-AT ?auto_4390 ?auto_4387 ) ( not ( = ?auto_4390 ?auto_4388 ) ) ( OBJ-AT ?auto_4388 ?auto_4393 ) ( TRUCK-AT ?auto_4392 ?auto_4387 ) ( OBJ-AT ?auto_4389 ?auto_4387 ) ( not ( = ?auto_4388 ?auto_4389 ) ) ( not ( = ?auto_4389 ?auto_4390 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4390 ?auto_4388 ?auto_4387 )
      ( DELIVER-3PKG-VERIFY ?auto_4388 ?auto_4389 ?auto_4390 ?auto_4387 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4417 - OBJ
      ?auto_4416 - LOCATION
    )
    :vars
    (
      ?auto_4420 - LOCATION
      ?auto_4418 - CITY
      ?auto_4421 - OBJ
      ?auto_4419 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4420 ?auto_4418 ) ( IN-CITY ?auto_4416 ?auto_4418 ) ( not ( = ?auto_4416 ?auto_4420 ) ) ( not ( = ?auto_4421 ?auto_4417 ) ) ( OBJ-AT ?auto_4417 ?auto_4420 ) ( TRUCK-AT ?auto_4419 ?auto_4416 ) ( IN-TRUCK ?auto_4421 ?auto_4419 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4421 ?auto_4416 )
      ( DELIVER-2PKG ?auto_4421 ?auto_4417 ?auto_4416 )
      ( DELIVER-1PKG-VERIFY ?auto_4417 ?auto_4416 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4423 - OBJ
      ?auto_4424 - OBJ
      ?auto_4422 - LOCATION
    )
    :vars
    (
      ?auto_4425 - LOCATION
      ?auto_4426 - CITY
      ?auto_4427 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4425 ?auto_4426 ) ( IN-CITY ?auto_4422 ?auto_4426 ) ( not ( = ?auto_4422 ?auto_4425 ) ) ( not ( = ?auto_4423 ?auto_4424 ) ) ( OBJ-AT ?auto_4424 ?auto_4425 ) ( TRUCK-AT ?auto_4427 ?auto_4422 ) ( IN-TRUCK ?auto_4423 ?auto_4427 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4424 ?auto_4422 )
      ( DELIVER-2PKG-VERIFY ?auto_4423 ?auto_4424 ?auto_4422 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4429 - OBJ
      ?auto_4430 - OBJ
      ?auto_4428 - LOCATION
    )
    :vars
    (
      ?auto_4431 - LOCATION
      ?auto_4433 - CITY
      ?auto_4432 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4431 ?auto_4433 ) ( IN-CITY ?auto_4428 ?auto_4433 ) ( not ( = ?auto_4428 ?auto_4431 ) ) ( not ( = ?auto_4430 ?auto_4429 ) ) ( OBJ-AT ?auto_4429 ?auto_4431 ) ( TRUCK-AT ?auto_4432 ?auto_4428 ) ( IN-TRUCK ?auto_4430 ?auto_4432 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4430 ?auto_4429 ?auto_4428 )
      ( DELIVER-2PKG-VERIFY ?auto_4429 ?auto_4430 ?auto_4428 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4492 - OBJ
      ?auto_4491 - LOCATION
    )
    :vars
    (
      ?auto_4493 - LOCATION
      ?auto_4496 - CITY
      ?auto_4494 - OBJ
      ?auto_4495 - TRUCK
      ?auto_4497 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4493 ?auto_4496 ) ( IN-CITY ?auto_4491 ?auto_4496 ) ( not ( = ?auto_4491 ?auto_4493 ) ) ( not ( = ?auto_4494 ?auto_4492 ) ) ( OBJ-AT ?auto_4492 ?auto_4493 ) ( IN-TRUCK ?auto_4494 ?auto_4495 ) ( TRUCK-AT ?auto_4495 ?auto_4497 ) ( IN-CITY ?auto_4497 ?auto_4496 ) ( not ( = ?auto_4491 ?auto_4497 ) ) ( not ( = ?auto_4493 ?auto_4497 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4495 ?auto_4497 ?auto_4491 ?auto_4496 )
      ( DELIVER-2PKG ?auto_4494 ?auto_4492 ?auto_4491 )
      ( DELIVER-1PKG-VERIFY ?auto_4492 ?auto_4491 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4499 - OBJ
      ?auto_4500 - OBJ
      ?auto_4498 - LOCATION
    )
    :vars
    (
      ?auto_4503 - LOCATION
      ?auto_4502 - CITY
      ?auto_4504 - TRUCK
      ?auto_4501 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4503 ?auto_4502 ) ( IN-CITY ?auto_4498 ?auto_4502 ) ( not ( = ?auto_4498 ?auto_4503 ) ) ( not ( = ?auto_4499 ?auto_4500 ) ) ( OBJ-AT ?auto_4500 ?auto_4503 ) ( IN-TRUCK ?auto_4499 ?auto_4504 ) ( TRUCK-AT ?auto_4504 ?auto_4501 ) ( IN-CITY ?auto_4501 ?auto_4502 ) ( not ( = ?auto_4498 ?auto_4501 ) ) ( not ( = ?auto_4503 ?auto_4501 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4500 ?auto_4498 )
      ( DELIVER-2PKG-VERIFY ?auto_4499 ?auto_4500 ?auto_4498 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4506 - OBJ
      ?auto_4507 - OBJ
      ?auto_4505 - LOCATION
    )
    :vars
    (
      ?auto_4509 - LOCATION
      ?auto_4511 - CITY
      ?auto_4510 - TRUCK
      ?auto_4508 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4509 ?auto_4511 ) ( IN-CITY ?auto_4505 ?auto_4511 ) ( not ( = ?auto_4505 ?auto_4509 ) ) ( not ( = ?auto_4507 ?auto_4506 ) ) ( OBJ-AT ?auto_4506 ?auto_4509 ) ( IN-TRUCK ?auto_4507 ?auto_4510 ) ( TRUCK-AT ?auto_4510 ?auto_4508 ) ( IN-CITY ?auto_4508 ?auto_4511 ) ( not ( = ?auto_4505 ?auto_4508 ) ) ( not ( = ?auto_4509 ?auto_4508 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4507 ?auto_4506 ?auto_4505 )
      ( DELIVER-2PKG-VERIFY ?auto_4506 ?auto_4507 ?auto_4505 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4578 - OBJ
      ?auto_4577 - LOCATION
    )
    :vars
    (
      ?auto_4580 - LOCATION
      ?auto_4583 - CITY
      ?auto_4582 - OBJ
      ?auto_4581 - TRUCK
      ?auto_4579 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4580 ?auto_4583 ) ( IN-CITY ?auto_4577 ?auto_4583 ) ( not ( = ?auto_4577 ?auto_4580 ) ) ( not ( = ?auto_4582 ?auto_4578 ) ) ( OBJ-AT ?auto_4578 ?auto_4580 ) ( TRUCK-AT ?auto_4581 ?auto_4579 ) ( IN-CITY ?auto_4579 ?auto_4583 ) ( not ( = ?auto_4577 ?auto_4579 ) ) ( not ( = ?auto_4580 ?auto_4579 ) ) ( OBJ-AT ?auto_4582 ?auto_4579 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4582 ?auto_4581 ?auto_4579 )
      ( DELIVER-2PKG ?auto_4582 ?auto_4578 ?auto_4577 )
      ( DELIVER-1PKG-VERIFY ?auto_4578 ?auto_4577 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4585 - OBJ
      ?auto_4586 - OBJ
      ?auto_4584 - LOCATION
    )
    :vars
    (
      ?auto_4588 - LOCATION
      ?auto_4590 - CITY
      ?auto_4587 - TRUCK
      ?auto_4589 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4588 ?auto_4590 ) ( IN-CITY ?auto_4584 ?auto_4590 ) ( not ( = ?auto_4584 ?auto_4588 ) ) ( not ( = ?auto_4585 ?auto_4586 ) ) ( OBJ-AT ?auto_4586 ?auto_4588 ) ( TRUCK-AT ?auto_4587 ?auto_4589 ) ( IN-CITY ?auto_4589 ?auto_4590 ) ( not ( = ?auto_4584 ?auto_4589 ) ) ( not ( = ?auto_4588 ?auto_4589 ) ) ( OBJ-AT ?auto_4585 ?auto_4589 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4586 ?auto_4584 )
      ( DELIVER-2PKG-VERIFY ?auto_4585 ?auto_4586 ?auto_4584 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4592 - OBJ
      ?auto_4593 - OBJ
      ?auto_4591 - LOCATION
    )
    :vars
    (
      ?auto_4594 - LOCATION
      ?auto_4597 - CITY
      ?auto_4595 - TRUCK
      ?auto_4596 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4594 ?auto_4597 ) ( IN-CITY ?auto_4591 ?auto_4597 ) ( not ( = ?auto_4591 ?auto_4594 ) ) ( not ( = ?auto_4593 ?auto_4592 ) ) ( OBJ-AT ?auto_4592 ?auto_4594 ) ( TRUCK-AT ?auto_4595 ?auto_4596 ) ( IN-CITY ?auto_4596 ?auto_4597 ) ( not ( = ?auto_4591 ?auto_4596 ) ) ( not ( = ?auto_4594 ?auto_4596 ) ) ( OBJ-AT ?auto_4593 ?auto_4596 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4593 ?auto_4592 ?auto_4591 )
      ( DELIVER-2PKG-VERIFY ?auto_4592 ?auto_4593 ?auto_4591 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4966 - OBJ
      ?auto_4967 - OBJ
      ?auto_4968 - OBJ
      ?auto_4965 - LOCATION
    )
    :vars
    (
      ?auto_4971 - TRUCK
      ?auto_4970 - LOCATION
      ?auto_4969 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4968 ?auto_4971 ) ( TRUCK-AT ?auto_4971 ?auto_4970 ) ( IN-CITY ?auto_4970 ?auto_4969 ) ( IN-CITY ?auto_4965 ?auto_4969 ) ( not ( = ?auto_4965 ?auto_4970 ) ) ( OBJ-AT ?auto_4967 ?auto_4965 ) ( not ( = ?auto_4967 ?auto_4968 ) ) ( OBJ-AT ?auto_4966 ?auto_4965 ) ( not ( = ?auto_4966 ?auto_4967 ) ) ( not ( = ?auto_4966 ?auto_4968 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4967 ?auto_4968 ?auto_4965 )
      ( DELIVER-3PKG-VERIFY ?auto_4966 ?auto_4967 ?auto_4968 ?auto_4965 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4977 - OBJ
      ?auto_4978 - OBJ
      ?auto_4979 - OBJ
      ?auto_4976 - LOCATION
    )
    :vars
    (
      ?auto_4982 - TRUCK
      ?auto_4981 - LOCATION
      ?auto_4980 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4978 ?auto_4982 ) ( TRUCK-AT ?auto_4982 ?auto_4981 ) ( IN-CITY ?auto_4981 ?auto_4980 ) ( IN-CITY ?auto_4976 ?auto_4980 ) ( not ( = ?auto_4976 ?auto_4981 ) ) ( OBJ-AT ?auto_4977 ?auto_4976 ) ( not ( = ?auto_4977 ?auto_4978 ) ) ( OBJ-AT ?auto_4979 ?auto_4976 ) ( not ( = ?auto_4977 ?auto_4979 ) ) ( not ( = ?auto_4978 ?auto_4979 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4977 ?auto_4978 ?auto_4976 )
      ( DELIVER-3PKG-VERIFY ?auto_4977 ?auto_4978 ?auto_4979 ?auto_4976 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4999 - OBJ
      ?auto_5000 - OBJ
      ?auto_5001 - OBJ
      ?auto_4998 - LOCATION
    )
    :vars
    (
      ?auto_5005 - TRUCK
      ?auto_5003 - LOCATION
      ?auto_5002 - CITY
      ?auto_5004 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5001 ?auto_5005 ) ( TRUCK-AT ?auto_5005 ?auto_5003 ) ( IN-CITY ?auto_5003 ?auto_5002 ) ( IN-CITY ?auto_4998 ?auto_5002 ) ( not ( = ?auto_4998 ?auto_5003 ) ) ( OBJ-AT ?auto_5004 ?auto_4998 ) ( not ( = ?auto_5004 ?auto_5001 ) ) ( OBJ-AT ?auto_4999 ?auto_4998 ) ( OBJ-AT ?auto_5000 ?auto_4998 ) ( not ( = ?auto_4999 ?auto_5000 ) ) ( not ( = ?auto_4999 ?auto_5001 ) ) ( not ( = ?auto_4999 ?auto_5004 ) ) ( not ( = ?auto_5000 ?auto_5001 ) ) ( not ( = ?auto_5000 ?auto_5004 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5004 ?auto_5001 ?auto_4998 )
      ( DELIVER-3PKG-VERIFY ?auto_4999 ?auto_5000 ?auto_5001 ?auto_4998 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5011 - OBJ
      ?auto_5012 - OBJ
      ?auto_5013 - OBJ
      ?auto_5010 - LOCATION
    )
    :vars
    (
      ?auto_5017 - TRUCK
      ?auto_5015 - LOCATION
      ?auto_5014 - CITY
      ?auto_5016 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5012 ?auto_5017 ) ( TRUCK-AT ?auto_5017 ?auto_5015 ) ( IN-CITY ?auto_5015 ?auto_5014 ) ( IN-CITY ?auto_5010 ?auto_5014 ) ( not ( = ?auto_5010 ?auto_5015 ) ) ( OBJ-AT ?auto_5016 ?auto_5010 ) ( not ( = ?auto_5016 ?auto_5012 ) ) ( OBJ-AT ?auto_5011 ?auto_5010 ) ( OBJ-AT ?auto_5013 ?auto_5010 ) ( not ( = ?auto_5011 ?auto_5012 ) ) ( not ( = ?auto_5011 ?auto_5013 ) ) ( not ( = ?auto_5011 ?auto_5016 ) ) ( not ( = ?auto_5012 ?auto_5013 ) ) ( not ( = ?auto_5013 ?auto_5016 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5016 ?auto_5012 ?auto_5010 )
      ( DELIVER-3PKG-VERIFY ?auto_5011 ?auto_5012 ?auto_5013 ?auto_5010 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5049 - OBJ
      ?auto_5050 - OBJ
      ?auto_5051 - OBJ
      ?auto_5048 - LOCATION
    )
    :vars
    (
      ?auto_5055 - TRUCK
      ?auto_5053 - LOCATION
      ?auto_5052 - CITY
      ?auto_5054 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5049 ?auto_5055 ) ( TRUCK-AT ?auto_5055 ?auto_5053 ) ( IN-CITY ?auto_5053 ?auto_5052 ) ( IN-CITY ?auto_5048 ?auto_5052 ) ( not ( = ?auto_5048 ?auto_5053 ) ) ( OBJ-AT ?auto_5054 ?auto_5048 ) ( not ( = ?auto_5054 ?auto_5049 ) ) ( OBJ-AT ?auto_5050 ?auto_5048 ) ( OBJ-AT ?auto_5051 ?auto_5048 ) ( not ( = ?auto_5049 ?auto_5050 ) ) ( not ( = ?auto_5049 ?auto_5051 ) ) ( not ( = ?auto_5050 ?auto_5051 ) ) ( not ( = ?auto_5050 ?auto_5054 ) ) ( not ( = ?auto_5051 ?auto_5054 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5054 ?auto_5049 ?auto_5048 )
      ( DELIVER-3PKG-VERIFY ?auto_5049 ?auto_5050 ?auto_5051 ?auto_5048 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5119 - OBJ
      ?auto_5120 - OBJ
      ?auto_5121 - OBJ
      ?auto_5118 - LOCATION
    )
    :vars
    (
      ?auto_5122 - TRUCK
      ?auto_5123 - LOCATION
      ?auto_5124 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5122 ?auto_5123 ) ( IN-CITY ?auto_5123 ?auto_5124 ) ( IN-CITY ?auto_5118 ?auto_5124 ) ( not ( = ?auto_5118 ?auto_5123 ) ) ( OBJ-AT ?auto_5119 ?auto_5118 ) ( not ( = ?auto_5119 ?auto_5121 ) ) ( OBJ-AT ?auto_5121 ?auto_5123 ) ( OBJ-AT ?auto_5120 ?auto_5118 ) ( not ( = ?auto_5119 ?auto_5120 ) ) ( not ( = ?auto_5120 ?auto_5121 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5119 ?auto_5121 ?auto_5118 )
      ( DELIVER-3PKG-VERIFY ?auto_5119 ?auto_5120 ?auto_5121 ?auto_5118 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5130 - OBJ
      ?auto_5131 - OBJ
      ?auto_5132 - OBJ
      ?auto_5129 - LOCATION
    )
    :vars
    (
      ?auto_5133 - TRUCK
      ?auto_5134 - LOCATION
      ?auto_5135 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5133 ?auto_5134 ) ( IN-CITY ?auto_5134 ?auto_5135 ) ( IN-CITY ?auto_5129 ?auto_5135 ) ( not ( = ?auto_5129 ?auto_5134 ) ) ( OBJ-AT ?auto_5132 ?auto_5129 ) ( not ( = ?auto_5132 ?auto_5131 ) ) ( OBJ-AT ?auto_5131 ?auto_5134 ) ( OBJ-AT ?auto_5130 ?auto_5129 ) ( not ( = ?auto_5130 ?auto_5131 ) ) ( not ( = ?auto_5130 ?auto_5132 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5132 ?auto_5131 ?auto_5129 )
      ( DELIVER-3PKG-VERIFY ?auto_5130 ?auto_5131 ?auto_5132 ?auto_5129 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5152 - OBJ
      ?auto_5153 - OBJ
      ?auto_5154 - OBJ
      ?auto_5151 - LOCATION
    )
    :vars
    (
      ?auto_5155 - TRUCK
      ?auto_5156 - LOCATION
      ?auto_5157 - CITY
      ?auto_5158 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5155 ?auto_5156 ) ( IN-CITY ?auto_5156 ?auto_5157 ) ( IN-CITY ?auto_5151 ?auto_5157 ) ( not ( = ?auto_5151 ?auto_5156 ) ) ( OBJ-AT ?auto_5158 ?auto_5151 ) ( not ( = ?auto_5158 ?auto_5154 ) ) ( OBJ-AT ?auto_5154 ?auto_5156 ) ( OBJ-AT ?auto_5152 ?auto_5151 ) ( OBJ-AT ?auto_5153 ?auto_5151 ) ( not ( = ?auto_5152 ?auto_5153 ) ) ( not ( = ?auto_5152 ?auto_5154 ) ) ( not ( = ?auto_5152 ?auto_5158 ) ) ( not ( = ?auto_5153 ?auto_5154 ) ) ( not ( = ?auto_5153 ?auto_5158 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5158 ?auto_5154 ?auto_5151 )
      ( DELIVER-3PKG-VERIFY ?auto_5152 ?auto_5153 ?auto_5154 ?auto_5151 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5164 - OBJ
      ?auto_5165 - OBJ
      ?auto_5166 - OBJ
      ?auto_5163 - LOCATION
    )
    :vars
    (
      ?auto_5167 - TRUCK
      ?auto_5168 - LOCATION
      ?auto_5169 - CITY
      ?auto_5170 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5167 ?auto_5168 ) ( IN-CITY ?auto_5168 ?auto_5169 ) ( IN-CITY ?auto_5163 ?auto_5169 ) ( not ( = ?auto_5163 ?auto_5168 ) ) ( OBJ-AT ?auto_5170 ?auto_5163 ) ( not ( = ?auto_5170 ?auto_5165 ) ) ( OBJ-AT ?auto_5165 ?auto_5168 ) ( OBJ-AT ?auto_5164 ?auto_5163 ) ( OBJ-AT ?auto_5166 ?auto_5163 ) ( not ( = ?auto_5164 ?auto_5165 ) ) ( not ( = ?auto_5164 ?auto_5166 ) ) ( not ( = ?auto_5164 ?auto_5170 ) ) ( not ( = ?auto_5165 ?auto_5166 ) ) ( not ( = ?auto_5166 ?auto_5170 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5170 ?auto_5165 ?auto_5163 )
      ( DELIVER-3PKG-VERIFY ?auto_5164 ?auto_5165 ?auto_5166 ?auto_5163 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5202 - OBJ
      ?auto_5203 - OBJ
      ?auto_5204 - OBJ
      ?auto_5201 - LOCATION
    )
    :vars
    (
      ?auto_5205 - TRUCK
      ?auto_5206 - LOCATION
      ?auto_5207 - CITY
      ?auto_5208 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5205 ?auto_5206 ) ( IN-CITY ?auto_5206 ?auto_5207 ) ( IN-CITY ?auto_5201 ?auto_5207 ) ( not ( = ?auto_5201 ?auto_5206 ) ) ( OBJ-AT ?auto_5208 ?auto_5201 ) ( not ( = ?auto_5208 ?auto_5202 ) ) ( OBJ-AT ?auto_5202 ?auto_5206 ) ( OBJ-AT ?auto_5203 ?auto_5201 ) ( OBJ-AT ?auto_5204 ?auto_5201 ) ( not ( = ?auto_5202 ?auto_5203 ) ) ( not ( = ?auto_5202 ?auto_5204 ) ) ( not ( = ?auto_5203 ?auto_5204 ) ) ( not ( = ?auto_5203 ?auto_5208 ) ) ( not ( = ?auto_5204 ?auto_5208 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5208 ?auto_5202 ?auto_5201 )
      ( DELIVER-3PKG-VERIFY ?auto_5202 ?auto_5203 ?auto_5204 ?auto_5201 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5272 - OBJ
      ?auto_5273 - OBJ
      ?auto_5274 - OBJ
      ?auto_5271 - LOCATION
    )
    :vars
    (
      ?auto_5276 - LOCATION
      ?auto_5277 - CITY
      ?auto_5275 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5276 ?auto_5277 ) ( IN-CITY ?auto_5271 ?auto_5277 ) ( not ( = ?auto_5271 ?auto_5276 ) ) ( OBJ-AT ?auto_5272 ?auto_5271 ) ( not ( = ?auto_5272 ?auto_5274 ) ) ( OBJ-AT ?auto_5274 ?auto_5276 ) ( TRUCK-AT ?auto_5275 ?auto_5271 ) ( OBJ-AT ?auto_5273 ?auto_5271 ) ( not ( = ?auto_5272 ?auto_5273 ) ) ( not ( = ?auto_5273 ?auto_5274 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5272 ?auto_5274 ?auto_5271 )
      ( DELIVER-3PKG-VERIFY ?auto_5272 ?auto_5273 ?auto_5274 ?auto_5271 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5305 - OBJ
      ?auto_5306 - OBJ
      ?auto_5307 - OBJ
      ?auto_5304 - LOCATION
    )
    :vars
    (
      ?auto_5309 - LOCATION
      ?auto_5310 - CITY
      ?auto_5311 - OBJ
      ?auto_5308 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5309 ?auto_5310 ) ( IN-CITY ?auto_5304 ?auto_5310 ) ( not ( = ?auto_5304 ?auto_5309 ) ) ( OBJ-AT ?auto_5311 ?auto_5304 ) ( not ( = ?auto_5311 ?auto_5307 ) ) ( OBJ-AT ?auto_5307 ?auto_5309 ) ( TRUCK-AT ?auto_5308 ?auto_5304 ) ( OBJ-AT ?auto_5305 ?auto_5304 ) ( OBJ-AT ?auto_5306 ?auto_5304 ) ( not ( = ?auto_5305 ?auto_5306 ) ) ( not ( = ?auto_5305 ?auto_5307 ) ) ( not ( = ?auto_5305 ?auto_5311 ) ) ( not ( = ?auto_5306 ?auto_5307 ) ) ( not ( = ?auto_5306 ?auto_5311 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5311 ?auto_5307 ?auto_5304 )
      ( DELIVER-3PKG-VERIFY ?auto_5305 ?auto_5306 ?auto_5307 ?auto_5304 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5317 - OBJ
      ?auto_5318 - OBJ
      ?auto_5319 - OBJ
      ?auto_5316 - LOCATION
    )
    :vars
    (
      ?auto_5321 - LOCATION
      ?auto_5322 - CITY
      ?auto_5323 - OBJ
      ?auto_5320 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5321 ?auto_5322 ) ( IN-CITY ?auto_5316 ?auto_5322 ) ( not ( = ?auto_5316 ?auto_5321 ) ) ( OBJ-AT ?auto_5323 ?auto_5316 ) ( not ( = ?auto_5323 ?auto_5318 ) ) ( OBJ-AT ?auto_5318 ?auto_5321 ) ( TRUCK-AT ?auto_5320 ?auto_5316 ) ( OBJ-AT ?auto_5317 ?auto_5316 ) ( OBJ-AT ?auto_5319 ?auto_5316 ) ( not ( = ?auto_5317 ?auto_5318 ) ) ( not ( = ?auto_5317 ?auto_5319 ) ) ( not ( = ?auto_5317 ?auto_5323 ) ) ( not ( = ?auto_5318 ?auto_5319 ) ) ( not ( = ?auto_5319 ?auto_5323 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5323 ?auto_5318 ?auto_5316 )
      ( DELIVER-3PKG-VERIFY ?auto_5317 ?auto_5318 ?auto_5319 ?auto_5316 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5333 - OBJ
      ?auto_5334 - OBJ
      ?auto_5335 - OBJ
      ?auto_5332 - LOCATION
    )
    :vars
    (
      ?auto_5337 - LOCATION
      ?auto_5338 - CITY
      ?auto_5336 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5337 ?auto_5338 ) ( IN-CITY ?auto_5332 ?auto_5338 ) ( not ( = ?auto_5332 ?auto_5337 ) ) ( OBJ-AT ?auto_5334 ?auto_5332 ) ( not ( = ?auto_5334 ?auto_5333 ) ) ( OBJ-AT ?auto_5333 ?auto_5337 ) ( TRUCK-AT ?auto_5336 ?auto_5332 ) ( OBJ-AT ?auto_5335 ?auto_5332 ) ( not ( = ?auto_5333 ?auto_5335 ) ) ( not ( = ?auto_5334 ?auto_5335 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5334 ?auto_5333 ?auto_5332 )
      ( DELIVER-3PKG-VERIFY ?auto_5333 ?auto_5334 ?auto_5335 ?auto_5332 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5355 - OBJ
      ?auto_5356 - OBJ
      ?auto_5357 - OBJ
      ?auto_5354 - LOCATION
    )
    :vars
    (
      ?auto_5359 - LOCATION
      ?auto_5360 - CITY
      ?auto_5361 - OBJ
      ?auto_5358 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5359 ?auto_5360 ) ( IN-CITY ?auto_5354 ?auto_5360 ) ( not ( = ?auto_5354 ?auto_5359 ) ) ( OBJ-AT ?auto_5361 ?auto_5354 ) ( not ( = ?auto_5361 ?auto_5355 ) ) ( OBJ-AT ?auto_5355 ?auto_5359 ) ( TRUCK-AT ?auto_5358 ?auto_5354 ) ( OBJ-AT ?auto_5356 ?auto_5354 ) ( OBJ-AT ?auto_5357 ?auto_5354 ) ( not ( = ?auto_5355 ?auto_5356 ) ) ( not ( = ?auto_5355 ?auto_5357 ) ) ( not ( = ?auto_5356 ?auto_5357 ) ) ( not ( = ?auto_5356 ?auto_5361 ) ) ( not ( = ?auto_5357 ?auto_5361 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5361 ?auto_5355 ?auto_5354 )
      ( DELIVER-3PKG-VERIFY ?auto_5355 ?auto_5356 ?auto_5357 ?auto_5354 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5437 - OBJ
      ?auto_5438 - OBJ
      ?auto_5439 - OBJ
      ?auto_5436 - LOCATION
    )
    :vars
    (
      ?auto_5441 - LOCATION
      ?auto_5442 - CITY
      ?auto_5440 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5441 ?auto_5442 ) ( IN-CITY ?auto_5436 ?auto_5442 ) ( not ( = ?auto_5436 ?auto_5441 ) ) ( OBJ-AT ?auto_5437 ?auto_5436 ) ( not ( = ?auto_5437 ?auto_5438 ) ) ( OBJ-AT ?auto_5438 ?auto_5441 ) ( TRUCK-AT ?auto_5440 ?auto_5436 ) ( OBJ-AT ?auto_5439 ?auto_5436 ) ( not ( = ?auto_5437 ?auto_5439 ) ) ( not ( = ?auto_5438 ?auto_5439 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5437 ?auto_5438 ?auto_5436 )
      ( DELIVER-3PKG-VERIFY ?auto_5437 ?auto_5438 ?auto_5439 ?auto_5436 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5665 - OBJ
      ?auto_5666 - OBJ
      ?auto_5667 - OBJ
      ?auto_5664 - LOCATION
    )
    :vars
    (
      ?auto_5670 - TRUCK
      ?auto_5668 - LOCATION
      ?auto_5669 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5670 ?auto_5668 ) ( IN-CITY ?auto_5668 ?auto_5669 ) ( IN-CITY ?auto_5664 ?auto_5669 ) ( not ( = ?auto_5664 ?auto_5668 ) ) ( OBJ-AT ?auto_5667 ?auto_5664 ) ( not ( = ?auto_5667 ?auto_5665 ) ) ( OBJ-AT ?auto_5665 ?auto_5668 ) ( OBJ-AT ?auto_5666 ?auto_5664 ) ( not ( = ?auto_5665 ?auto_5666 ) ) ( not ( = ?auto_5666 ?auto_5667 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5667 ?auto_5665 ?auto_5664 )
      ( DELIVER-3PKG-VERIFY ?auto_5665 ?auto_5666 ?auto_5667 ?auto_5664 ) )
  )

)

