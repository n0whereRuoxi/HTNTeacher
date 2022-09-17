( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4190 - SURFACE
      ?auto_4191 - SURFACE
    )
    :vars
    (
      ?auto_4192 - HOIST
      ?auto_4193 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4192 ?auto_4193 ) ( SURFACE-AT ?auto_4191 ?auto_4193 ) ( CLEAR ?auto_4191 ) ( LIFTING ?auto_4192 ?auto_4190 ) ( IS-CRATE ?auto_4190 ) ( not ( = ?auto_4190 ?auto_4191 ) ) )
    :subtasks
    ( ( !DROP ?auto_4192 ?auto_4190 ?auto_4191 ?auto_4193 )
      ( MAKE-ON-VERIFY ?auto_4190 ?auto_4191 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4194 - SURFACE
      ?auto_4195 - SURFACE
    )
    :vars
    (
      ?auto_4197 - HOIST
      ?auto_4196 - PLACE
      ?auto_4198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4197 ?auto_4196 ) ( SURFACE-AT ?auto_4195 ?auto_4196 ) ( CLEAR ?auto_4195 ) ( IS-CRATE ?auto_4194 ) ( not ( = ?auto_4194 ?auto_4195 ) ) ( TRUCK-AT ?auto_4198 ?auto_4196 ) ( AVAILABLE ?auto_4197 ) ( IN ?auto_4194 ?auto_4198 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4197 ?auto_4194 ?auto_4198 ?auto_4196 )
      ( MAKE-ON ?auto_4194 ?auto_4195 )
      ( MAKE-ON-VERIFY ?auto_4194 ?auto_4195 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4199 - SURFACE
      ?auto_4200 - SURFACE
    )
    :vars
    (
      ?auto_4202 - HOIST
      ?auto_4201 - PLACE
      ?auto_4203 - TRUCK
      ?auto_4204 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4202 ?auto_4201 ) ( SURFACE-AT ?auto_4200 ?auto_4201 ) ( CLEAR ?auto_4200 ) ( IS-CRATE ?auto_4199 ) ( not ( = ?auto_4199 ?auto_4200 ) ) ( AVAILABLE ?auto_4202 ) ( IN ?auto_4199 ?auto_4203 ) ( TRUCK-AT ?auto_4203 ?auto_4204 ) ( not ( = ?auto_4204 ?auto_4201 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4203 ?auto_4204 ?auto_4201 )
      ( MAKE-ON ?auto_4199 ?auto_4200 )
      ( MAKE-ON-VERIFY ?auto_4199 ?auto_4200 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4205 - SURFACE
      ?auto_4206 - SURFACE
    )
    :vars
    (
      ?auto_4207 - HOIST
      ?auto_4210 - PLACE
      ?auto_4208 - TRUCK
      ?auto_4209 - PLACE
      ?auto_4211 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4207 ?auto_4210 ) ( SURFACE-AT ?auto_4206 ?auto_4210 ) ( CLEAR ?auto_4206 ) ( IS-CRATE ?auto_4205 ) ( not ( = ?auto_4205 ?auto_4206 ) ) ( AVAILABLE ?auto_4207 ) ( TRUCK-AT ?auto_4208 ?auto_4209 ) ( not ( = ?auto_4209 ?auto_4210 ) ) ( HOIST-AT ?auto_4211 ?auto_4209 ) ( LIFTING ?auto_4211 ?auto_4205 ) ( not ( = ?auto_4207 ?auto_4211 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4211 ?auto_4205 ?auto_4208 ?auto_4209 )
      ( MAKE-ON ?auto_4205 ?auto_4206 )
      ( MAKE-ON-VERIFY ?auto_4205 ?auto_4206 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4212 - SURFACE
      ?auto_4213 - SURFACE
    )
    :vars
    (
      ?auto_4214 - HOIST
      ?auto_4215 - PLACE
      ?auto_4216 - TRUCK
      ?auto_4217 - PLACE
      ?auto_4218 - HOIST
      ?auto_4219 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4214 ?auto_4215 ) ( SURFACE-AT ?auto_4213 ?auto_4215 ) ( CLEAR ?auto_4213 ) ( IS-CRATE ?auto_4212 ) ( not ( = ?auto_4212 ?auto_4213 ) ) ( AVAILABLE ?auto_4214 ) ( TRUCK-AT ?auto_4216 ?auto_4217 ) ( not ( = ?auto_4217 ?auto_4215 ) ) ( HOIST-AT ?auto_4218 ?auto_4217 ) ( not ( = ?auto_4214 ?auto_4218 ) ) ( AVAILABLE ?auto_4218 ) ( SURFACE-AT ?auto_4212 ?auto_4217 ) ( ON ?auto_4212 ?auto_4219 ) ( CLEAR ?auto_4212 ) ( not ( = ?auto_4212 ?auto_4219 ) ) ( not ( = ?auto_4213 ?auto_4219 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4218 ?auto_4212 ?auto_4219 ?auto_4217 )
      ( MAKE-ON ?auto_4212 ?auto_4213 )
      ( MAKE-ON-VERIFY ?auto_4212 ?auto_4213 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4220 - SURFACE
      ?auto_4221 - SURFACE
    )
    :vars
    (
      ?auto_4224 - HOIST
      ?auto_4225 - PLACE
      ?auto_4223 - PLACE
      ?auto_4226 - HOIST
      ?auto_4222 - SURFACE
      ?auto_4227 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4224 ?auto_4225 ) ( SURFACE-AT ?auto_4221 ?auto_4225 ) ( CLEAR ?auto_4221 ) ( IS-CRATE ?auto_4220 ) ( not ( = ?auto_4220 ?auto_4221 ) ) ( AVAILABLE ?auto_4224 ) ( not ( = ?auto_4223 ?auto_4225 ) ) ( HOIST-AT ?auto_4226 ?auto_4223 ) ( not ( = ?auto_4224 ?auto_4226 ) ) ( AVAILABLE ?auto_4226 ) ( SURFACE-AT ?auto_4220 ?auto_4223 ) ( ON ?auto_4220 ?auto_4222 ) ( CLEAR ?auto_4220 ) ( not ( = ?auto_4220 ?auto_4222 ) ) ( not ( = ?auto_4221 ?auto_4222 ) ) ( TRUCK-AT ?auto_4227 ?auto_4225 ) )
    :subtasks
    ( ( !DRIVE ?auto_4227 ?auto_4225 ?auto_4223 )
      ( MAKE-ON ?auto_4220 ?auto_4221 )
      ( MAKE-ON-VERIFY ?auto_4220 ?auto_4221 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4230 - SURFACE
      ?auto_4231 - SURFACE
    )
    :vars
    (
      ?auto_4232 - HOIST
      ?auto_4233 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4232 ?auto_4233 ) ( SURFACE-AT ?auto_4231 ?auto_4233 ) ( CLEAR ?auto_4231 ) ( LIFTING ?auto_4232 ?auto_4230 ) ( IS-CRATE ?auto_4230 ) ( not ( = ?auto_4230 ?auto_4231 ) ) )
    :subtasks
    ( ( !DROP ?auto_4232 ?auto_4230 ?auto_4231 ?auto_4233 )
      ( MAKE-ON-VERIFY ?auto_4230 ?auto_4231 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4234 - SURFACE
      ?auto_4235 - SURFACE
    )
    :vars
    (
      ?auto_4236 - HOIST
      ?auto_4237 - PLACE
      ?auto_4238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4236 ?auto_4237 ) ( SURFACE-AT ?auto_4235 ?auto_4237 ) ( CLEAR ?auto_4235 ) ( IS-CRATE ?auto_4234 ) ( not ( = ?auto_4234 ?auto_4235 ) ) ( TRUCK-AT ?auto_4238 ?auto_4237 ) ( AVAILABLE ?auto_4236 ) ( IN ?auto_4234 ?auto_4238 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4236 ?auto_4234 ?auto_4238 ?auto_4237 )
      ( MAKE-ON ?auto_4234 ?auto_4235 )
      ( MAKE-ON-VERIFY ?auto_4234 ?auto_4235 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4239 - SURFACE
      ?auto_4240 - SURFACE
    )
    :vars
    (
      ?auto_4243 - HOIST
      ?auto_4241 - PLACE
      ?auto_4242 - TRUCK
      ?auto_4244 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4243 ?auto_4241 ) ( SURFACE-AT ?auto_4240 ?auto_4241 ) ( CLEAR ?auto_4240 ) ( IS-CRATE ?auto_4239 ) ( not ( = ?auto_4239 ?auto_4240 ) ) ( AVAILABLE ?auto_4243 ) ( IN ?auto_4239 ?auto_4242 ) ( TRUCK-AT ?auto_4242 ?auto_4244 ) ( not ( = ?auto_4244 ?auto_4241 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4242 ?auto_4244 ?auto_4241 )
      ( MAKE-ON ?auto_4239 ?auto_4240 )
      ( MAKE-ON-VERIFY ?auto_4239 ?auto_4240 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4245 - SURFACE
      ?auto_4246 - SURFACE
    )
    :vars
    (
      ?auto_4248 - HOIST
      ?auto_4250 - PLACE
      ?auto_4249 - TRUCK
      ?auto_4247 - PLACE
      ?auto_4251 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4248 ?auto_4250 ) ( SURFACE-AT ?auto_4246 ?auto_4250 ) ( CLEAR ?auto_4246 ) ( IS-CRATE ?auto_4245 ) ( not ( = ?auto_4245 ?auto_4246 ) ) ( AVAILABLE ?auto_4248 ) ( TRUCK-AT ?auto_4249 ?auto_4247 ) ( not ( = ?auto_4247 ?auto_4250 ) ) ( HOIST-AT ?auto_4251 ?auto_4247 ) ( LIFTING ?auto_4251 ?auto_4245 ) ( not ( = ?auto_4248 ?auto_4251 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4251 ?auto_4245 ?auto_4249 ?auto_4247 )
      ( MAKE-ON ?auto_4245 ?auto_4246 )
      ( MAKE-ON-VERIFY ?auto_4245 ?auto_4246 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4252 - SURFACE
      ?auto_4253 - SURFACE
    )
    :vars
    (
      ?auto_4258 - HOIST
      ?auto_4255 - PLACE
      ?auto_4254 - TRUCK
      ?auto_4257 - PLACE
      ?auto_4256 - HOIST
      ?auto_4259 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4258 ?auto_4255 ) ( SURFACE-AT ?auto_4253 ?auto_4255 ) ( CLEAR ?auto_4253 ) ( IS-CRATE ?auto_4252 ) ( not ( = ?auto_4252 ?auto_4253 ) ) ( AVAILABLE ?auto_4258 ) ( TRUCK-AT ?auto_4254 ?auto_4257 ) ( not ( = ?auto_4257 ?auto_4255 ) ) ( HOIST-AT ?auto_4256 ?auto_4257 ) ( not ( = ?auto_4258 ?auto_4256 ) ) ( AVAILABLE ?auto_4256 ) ( SURFACE-AT ?auto_4252 ?auto_4257 ) ( ON ?auto_4252 ?auto_4259 ) ( CLEAR ?auto_4252 ) ( not ( = ?auto_4252 ?auto_4259 ) ) ( not ( = ?auto_4253 ?auto_4259 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4256 ?auto_4252 ?auto_4259 ?auto_4257 )
      ( MAKE-ON ?auto_4252 ?auto_4253 )
      ( MAKE-ON-VERIFY ?auto_4252 ?auto_4253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4260 - SURFACE
      ?auto_4261 - SURFACE
    )
    :vars
    (
      ?auto_4262 - HOIST
      ?auto_4267 - PLACE
      ?auto_4266 - PLACE
      ?auto_4265 - HOIST
      ?auto_4264 - SURFACE
      ?auto_4263 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4262 ?auto_4267 ) ( SURFACE-AT ?auto_4261 ?auto_4267 ) ( CLEAR ?auto_4261 ) ( IS-CRATE ?auto_4260 ) ( not ( = ?auto_4260 ?auto_4261 ) ) ( AVAILABLE ?auto_4262 ) ( not ( = ?auto_4266 ?auto_4267 ) ) ( HOIST-AT ?auto_4265 ?auto_4266 ) ( not ( = ?auto_4262 ?auto_4265 ) ) ( AVAILABLE ?auto_4265 ) ( SURFACE-AT ?auto_4260 ?auto_4266 ) ( ON ?auto_4260 ?auto_4264 ) ( CLEAR ?auto_4260 ) ( not ( = ?auto_4260 ?auto_4264 ) ) ( not ( = ?auto_4261 ?auto_4264 ) ) ( TRUCK-AT ?auto_4263 ?auto_4267 ) )
    :subtasks
    ( ( !DRIVE ?auto_4263 ?auto_4267 ?auto_4266 )
      ( MAKE-ON ?auto_4260 ?auto_4261 )
      ( MAKE-ON-VERIFY ?auto_4260 ?auto_4261 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4268 - SURFACE
      ?auto_4269 - SURFACE
    )
    :vars
    (
      ?auto_4274 - HOIST
      ?auto_4275 - PLACE
      ?auto_4270 - PLACE
      ?auto_4272 - HOIST
      ?auto_4271 - SURFACE
      ?auto_4273 - TRUCK
      ?auto_4276 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4274 ?auto_4275 ) ( IS-CRATE ?auto_4268 ) ( not ( = ?auto_4268 ?auto_4269 ) ) ( not ( = ?auto_4270 ?auto_4275 ) ) ( HOIST-AT ?auto_4272 ?auto_4270 ) ( not ( = ?auto_4274 ?auto_4272 ) ) ( AVAILABLE ?auto_4272 ) ( SURFACE-AT ?auto_4268 ?auto_4270 ) ( ON ?auto_4268 ?auto_4271 ) ( CLEAR ?auto_4268 ) ( not ( = ?auto_4268 ?auto_4271 ) ) ( not ( = ?auto_4269 ?auto_4271 ) ) ( TRUCK-AT ?auto_4273 ?auto_4275 ) ( SURFACE-AT ?auto_4276 ?auto_4275 ) ( CLEAR ?auto_4276 ) ( LIFTING ?auto_4274 ?auto_4269 ) ( IS-CRATE ?auto_4269 ) ( not ( = ?auto_4268 ?auto_4276 ) ) ( not ( = ?auto_4269 ?auto_4276 ) ) ( not ( = ?auto_4271 ?auto_4276 ) ) )
    :subtasks
    ( ( !DROP ?auto_4274 ?auto_4269 ?auto_4276 ?auto_4275 )
      ( MAKE-ON ?auto_4268 ?auto_4269 )
      ( MAKE-ON-VERIFY ?auto_4268 ?auto_4269 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4277 - SURFACE
      ?auto_4278 - SURFACE
    )
    :vars
    (
      ?auto_4285 - HOIST
      ?auto_4284 - PLACE
      ?auto_4280 - PLACE
      ?auto_4283 - HOIST
      ?auto_4279 - SURFACE
      ?auto_4281 - TRUCK
      ?auto_4282 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4285 ?auto_4284 ) ( IS-CRATE ?auto_4277 ) ( not ( = ?auto_4277 ?auto_4278 ) ) ( not ( = ?auto_4280 ?auto_4284 ) ) ( HOIST-AT ?auto_4283 ?auto_4280 ) ( not ( = ?auto_4285 ?auto_4283 ) ) ( AVAILABLE ?auto_4283 ) ( SURFACE-AT ?auto_4277 ?auto_4280 ) ( ON ?auto_4277 ?auto_4279 ) ( CLEAR ?auto_4277 ) ( not ( = ?auto_4277 ?auto_4279 ) ) ( not ( = ?auto_4278 ?auto_4279 ) ) ( TRUCK-AT ?auto_4281 ?auto_4284 ) ( SURFACE-AT ?auto_4282 ?auto_4284 ) ( CLEAR ?auto_4282 ) ( IS-CRATE ?auto_4278 ) ( not ( = ?auto_4277 ?auto_4282 ) ) ( not ( = ?auto_4278 ?auto_4282 ) ) ( not ( = ?auto_4279 ?auto_4282 ) ) ( AVAILABLE ?auto_4285 ) ( IN ?auto_4278 ?auto_4281 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4285 ?auto_4278 ?auto_4281 ?auto_4284 )
      ( MAKE-ON ?auto_4277 ?auto_4278 )
      ( MAKE-ON-VERIFY ?auto_4277 ?auto_4278 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4286 - SURFACE
      ?auto_4287 - SURFACE
    )
    :vars
    (
      ?auto_4292 - HOIST
      ?auto_4290 - PLACE
      ?auto_4289 - PLACE
      ?auto_4291 - HOIST
      ?auto_4293 - SURFACE
      ?auto_4288 - SURFACE
      ?auto_4294 - TRUCK
      ?auto_4295 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4292 ?auto_4290 ) ( IS-CRATE ?auto_4286 ) ( not ( = ?auto_4286 ?auto_4287 ) ) ( not ( = ?auto_4289 ?auto_4290 ) ) ( HOIST-AT ?auto_4291 ?auto_4289 ) ( not ( = ?auto_4292 ?auto_4291 ) ) ( AVAILABLE ?auto_4291 ) ( SURFACE-AT ?auto_4286 ?auto_4289 ) ( ON ?auto_4286 ?auto_4293 ) ( CLEAR ?auto_4286 ) ( not ( = ?auto_4286 ?auto_4293 ) ) ( not ( = ?auto_4287 ?auto_4293 ) ) ( SURFACE-AT ?auto_4288 ?auto_4290 ) ( CLEAR ?auto_4288 ) ( IS-CRATE ?auto_4287 ) ( not ( = ?auto_4286 ?auto_4288 ) ) ( not ( = ?auto_4287 ?auto_4288 ) ) ( not ( = ?auto_4293 ?auto_4288 ) ) ( AVAILABLE ?auto_4292 ) ( IN ?auto_4287 ?auto_4294 ) ( TRUCK-AT ?auto_4294 ?auto_4295 ) ( not ( = ?auto_4295 ?auto_4290 ) ) ( not ( = ?auto_4289 ?auto_4295 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4294 ?auto_4295 ?auto_4290 )
      ( MAKE-ON ?auto_4286 ?auto_4287 )
      ( MAKE-ON-VERIFY ?auto_4286 ?auto_4287 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4296 - SURFACE
      ?auto_4297 - SURFACE
    )
    :vars
    (
      ?auto_4301 - HOIST
      ?auto_4302 - PLACE
      ?auto_4303 - PLACE
      ?auto_4299 - HOIST
      ?auto_4298 - SURFACE
      ?auto_4305 - SURFACE
      ?auto_4300 - TRUCK
      ?auto_4304 - PLACE
      ?auto_4306 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4301 ?auto_4302 ) ( IS-CRATE ?auto_4296 ) ( not ( = ?auto_4296 ?auto_4297 ) ) ( not ( = ?auto_4303 ?auto_4302 ) ) ( HOIST-AT ?auto_4299 ?auto_4303 ) ( not ( = ?auto_4301 ?auto_4299 ) ) ( AVAILABLE ?auto_4299 ) ( SURFACE-AT ?auto_4296 ?auto_4303 ) ( ON ?auto_4296 ?auto_4298 ) ( CLEAR ?auto_4296 ) ( not ( = ?auto_4296 ?auto_4298 ) ) ( not ( = ?auto_4297 ?auto_4298 ) ) ( SURFACE-AT ?auto_4305 ?auto_4302 ) ( CLEAR ?auto_4305 ) ( IS-CRATE ?auto_4297 ) ( not ( = ?auto_4296 ?auto_4305 ) ) ( not ( = ?auto_4297 ?auto_4305 ) ) ( not ( = ?auto_4298 ?auto_4305 ) ) ( AVAILABLE ?auto_4301 ) ( TRUCK-AT ?auto_4300 ?auto_4304 ) ( not ( = ?auto_4304 ?auto_4302 ) ) ( not ( = ?auto_4303 ?auto_4304 ) ) ( HOIST-AT ?auto_4306 ?auto_4304 ) ( LIFTING ?auto_4306 ?auto_4297 ) ( not ( = ?auto_4301 ?auto_4306 ) ) ( not ( = ?auto_4299 ?auto_4306 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4306 ?auto_4297 ?auto_4300 ?auto_4304 )
      ( MAKE-ON ?auto_4296 ?auto_4297 )
      ( MAKE-ON-VERIFY ?auto_4296 ?auto_4297 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4307 - SURFACE
      ?auto_4308 - SURFACE
    )
    :vars
    (
      ?auto_4309 - HOIST
      ?auto_4310 - PLACE
      ?auto_4313 - PLACE
      ?auto_4315 - HOIST
      ?auto_4311 - SURFACE
      ?auto_4317 - SURFACE
      ?auto_4314 - TRUCK
      ?auto_4312 - PLACE
      ?auto_4316 - HOIST
      ?auto_4318 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4309 ?auto_4310 ) ( IS-CRATE ?auto_4307 ) ( not ( = ?auto_4307 ?auto_4308 ) ) ( not ( = ?auto_4313 ?auto_4310 ) ) ( HOIST-AT ?auto_4315 ?auto_4313 ) ( not ( = ?auto_4309 ?auto_4315 ) ) ( AVAILABLE ?auto_4315 ) ( SURFACE-AT ?auto_4307 ?auto_4313 ) ( ON ?auto_4307 ?auto_4311 ) ( CLEAR ?auto_4307 ) ( not ( = ?auto_4307 ?auto_4311 ) ) ( not ( = ?auto_4308 ?auto_4311 ) ) ( SURFACE-AT ?auto_4317 ?auto_4310 ) ( CLEAR ?auto_4317 ) ( IS-CRATE ?auto_4308 ) ( not ( = ?auto_4307 ?auto_4317 ) ) ( not ( = ?auto_4308 ?auto_4317 ) ) ( not ( = ?auto_4311 ?auto_4317 ) ) ( AVAILABLE ?auto_4309 ) ( TRUCK-AT ?auto_4314 ?auto_4312 ) ( not ( = ?auto_4312 ?auto_4310 ) ) ( not ( = ?auto_4313 ?auto_4312 ) ) ( HOIST-AT ?auto_4316 ?auto_4312 ) ( not ( = ?auto_4309 ?auto_4316 ) ) ( not ( = ?auto_4315 ?auto_4316 ) ) ( AVAILABLE ?auto_4316 ) ( SURFACE-AT ?auto_4308 ?auto_4312 ) ( ON ?auto_4308 ?auto_4318 ) ( CLEAR ?auto_4308 ) ( not ( = ?auto_4307 ?auto_4318 ) ) ( not ( = ?auto_4308 ?auto_4318 ) ) ( not ( = ?auto_4311 ?auto_4318 ) ) ( not ( = ?auto_4317 ?auto_4318 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4316 ?auto_4308 ?auto_4318 ?auto_4312 )
      ( MAKE-ON ?auto_4307 ?auto_4308 )
      ( MAKE-ON-VERIFY ?auto_4307 ?auto_4308 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4319 - SURFACE
      ?auto_4320 - SURFACE
    )
    :vars
    (
      ?auto_4327 - HOIST
      ?auto_4330 - PLACE
      ?auto_4324 - PLACE
      ?auto_4326 - HOIST
      ?auto_4323 - SURFACE
      ?auto_4325 - SURFACE
      ?auto_4322 - PLACE
      ?auto_4329 - HOIST
      ?auto_4321 - SURFACE
      ?auto_4328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4327 ?auto_4330 ) ( IS-CRATE ?auto_4319 ) ( not ( = ?auto_4319 ?auto_4320 ) ) ( not ( = ?auto_4324 ?auto_4330 ) ) ( HOIST-AT ?auto_4326 ?auto_4324 ) ( not ( = ?auto_4327 ?auto_4326 ) ) ( AVAILABLE ?auto_4326 ) ( SURFACE-AT ?auto_4319 ?auto_4324 ) ( ON ?auto_4319 ?auto_4323 ) ( CLEAR ?auto_4319 ) ( not ( = ?auto_4319 ?auto_4323 ) ) ( not ( = ?auto_4320 ?auto_4323 ) ) ( SURFACE-AT ?auto_4325 ?auto_4330 ) ( CLEAR ?auto_4325 ) ( IS-CRATE ?auto_4320 ) ( not ( = ?auto_4319 ?auto_4325 ) ) ( not ( = ?auto_4320 ?auto_4325 ) ) ( not ( = ?auto_4323 ?auto_4325 ) ) ( AVAILABLE ?auto_4327 ) ( not ( = ?auto_4322 ?auto_4330 ) ) ( not ( = ?auto_4324 ?auto_4322 ) ) ( HOIST-AT ?auto_4329 ?auto_4322 ) ( not ( = ?auto_4327 ?auto_4329 ) ) ( not ( = ?auto_4326 ?auto_4329 ) ) ( AVAILABLE ?auto_4329 ) ( SURFACE-AT ?auto_4320 ?auto_4322 ) ( ON ?auto_4320 ?auto_4321 ) ( CLEAR ?auto_4320 ) ( not ( = ?auto_4319 ?auto_4321 ) ) ( not ( = ?auto_4320 ?auto_4321 ) ) ( not ( = ?auto_4323 ?auto_4321 ) ) ( not ( = ?auto_4325 ?auto_4321 ) ) ( TRUCK-AT ?auto_4328 ?auto_4330 ) )
    :subtasks
    ( ( !DRIVE ?auto_4328 ?auto_4330 ?auto_4322 )
      ( MAKE-ON ?auto_4319 ?auto_4320 )
      ( MAKE-ON-VERIFY ?auto_4319 ?auto_4320 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4333 - SURFACE
      ?auto_4334 - SURFACE
    )
    :vars
    (
      ?auto_4335 - HOIST
      ?auto_4336 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4335 ?auto_4336 ) ( SURFACE-AT ?auto_4334 ?auto_4336 ) ( CLEAR ?auto_4334 ) ( LIFTING ?auto_4335 ?auto_4333 ) ( IS-CRATE ?auto_4333 ) ( not ( = ?auto_4333 ?auto_4334 ) ) )
    :subtasks
    ( ( !DROP ?auto_4335 ?auto_4333 ?auto_4334 ?auto_4336 )
      ( MAKE-ON-VERIFY ?auto_4333 ?auto_4334 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4337 - SURFACE
      ?auto_4338 - SURFACE
    )
    :vars
    (
      ?auto_4339 - HOIST
      ?auto_4340 - PLACE
      ?auto_4341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4339 ?auto_4340 ) ( SURFACE-AT ?auto_4338 ?auto_4340 ) ( CLEAR ?auto_4338 ) ( IS-CRATE ?auto_4337 ) ( not ( = ?auto_4337 ?auto_4338 ) ) ( TRUCK-AT ?auto_4341 ?auto_4340 ) ( AVAILABLE ?auto_4339 ) ( IN ?auto_4337 ?auto_4341 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4339 ?auto_4337 ?auto_4341 ?auto_4340 )
      ( MAKE-ON ?auto_4337 ?auto_4338 )
      ( MAKE-ON-VERIFY ?auto_4337 ?auto_4338 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4342 - SURFACE
      ?auto_4343 - SURFACE
    )
    :vars
    (
      ?auto_4346 - HOIST
      ?auto_4344 - PLACE
      ?auto_4345 - TRUCK
      ?auto_4347 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4346 ?auto_4344 ) ( SURFACE-AT ?auto_4343 ?auto_4344 ) ( CLEAR ?auto_4343 ) ( IS-CRATE ?auto_4342 ) ( not ( = ?auto_4342 ?auto_4343 ) ) ( AVAILABLE ?auto_4346 ) ( IN ?auto_4342 ?auto_4345 ) ( TRUCK-AT ?auto_4345 ?auto_4347 ) ( not ( = ?auto_4347 ?auto_4344 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4345 ?auto_4347 ?auto_4344 )
      ( MAKE-ON ?auto_4342 ?auto_4343 )
      ( MAKE-ON-VERIFY ?auto_4342 ?auto_4343 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4348 - SURFACE
      ?auto_4349 - SURFACE
    )
    :vars
    (
      ?auto_4350 - HOIST
      ?auto_4352 - PLACE
      ?auto_4351 - TRUCK
      ?auto_4353 - PLACE
      ?auto_4354 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4350 ?auto_4352 ) ( SURFACE-AT ?auto_4349 ?auto_4352 ) ( CLEAR ?auto_4349 ) ( IS-CRATE ?auto_4348 ) ( not ( = ?auto_4348 ?auto_4349 ) ) ( AVAILABLE ?auto_4350 ) ( TRUCK-AT ?auto_4351 ?auto_4353 ) ( not ( = ?auto_4353 ?auto_4352 ) ) ( HOIST-AT ?auto_4354 ?auto_4353 ) ( LIFTING ?auto_4354 ?auto_4348 ) ( not ( = ?auto_4350 ?auto_4354 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4354 ?auto_4348 ?auto_4351 ?auto_4353 )
      ( MAKE-ON ?auto_4348 ?auto_4349 )
      ( MAKE-ON-VERIFY ?auto_4348 ?auto_4349 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4355 - SURFACE
      ?auto_4356 - SURFACE
    )
    :vars
    (
      ?auto_4358 - HOIST
      ?auto_4361 - PLACE
      ?auto_4357 - TRUCK
      ?auto_4359 - PLACE
      ?auto_4360 - HOIST
      ?auto_4362 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4358 ?auto_4361 ) ( SURFACE-AT ?auto_4356 ?auto_4361 ) ( CLEAR ?auto_4356 ) ( IS-CRATE ?auto_4355 ) ( not ( = ?auto_4355 ?auto_4356 ) ) ( AVAILABLE ?auto_4358 ) ( TRUCK-AT ?auto_4357 ?auto_4359 ) ( not ( = ?auto_4359 ?auto_4361 ) ) ( HOIST-AT ?auto_4360 ?auto_4359 ) ( not ( = ?auto_4358 ?auto_4360 ) ) ( AVAILABLE ?auto_4360 ) ( SURFACE-AT ?auto_4355 ?auto_4359 ) ( ON ?auto_4355 ?auto_4362 ) ( CLEAR ?auto_4355 ) ( not ( = ?auto_4355 ?auto_4362 ) ) ( not ( = ?auto_4356 ?auto_4362 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4360 ?auto_4355 ?auto_4362 ?auto_4359 )
      ( MAKE-ON ?auto_4355 ?auto_4356 )
      ( MAKE-ON-VERIFY ?auto_4355 ?auto_4356 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4363 - SURFACE
      ?auto_4364 - SURFACE
    )
    :vars
    (
      ?auto_4365 - HOIST
      ?auto_4366 - PLACE
      ?auto_4368 - PLACE
      ?auto_4370 - HOIST
      ?auto_4369 - SURFACE
      ?auto_4367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4365 ?auto_4366 ) ( SURFACE-AT ?auto_4364 ?auto_4366 ) ( CLEAR ?auto_4364 ) ( IS-CRATE ?auto_4363 ) ( not ( = ?auto_4363 ?auto_4364 ) ) ( AVAILABLE ?auto_4365 ) ( not ( = ?auto_4368 ?auto_4366 ) ) ( HOIST-AT ?auto_4370 ?auto_4368 ) ( not ( = ?auto_4365 ?auto_4370 ) ) ( AVAILABLE ?auto_4370 ) ( SURFACE-AT ?auto_4363 ?auto_4368 ) ( ON ?auto_4363 ?auto_4369 ) ( CLEAR ?auto_4363 ) ( not ( = ?auto_4363 ?auto_4369 ) ) ( not ( = ?auto_4364 ?auto_4369 ) ) ( TRUCK-AT ?auto_4367 ?auto_4366 ) )
    :subtasks
    ( ( !DRIVE ?auto_4367 ?auto_4366 ?auto_4368 )
      ( MAKE-ON ?auto_4363 ?auto_4364 )
      ( MAKE-ON-VERIFY ?auto_4363 ?auto_4364 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4371 - SURFACE
      ?auto_4372 - SURFACE
    )
    :vars
    (
      ?auto_4373 - HOIST
      ?auto_4378 - PLACE
      ?auto_4376 - PLACE
      ?auto_4377 - HOIST
      ?auto_4375 - SURFACE
      ?auto_4374 - TRUCK
      ?auto_4379 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4373 ?auto_4378 ) ( IS-CRATE ?auto_4371 ) ( not ( = ?auto_4371 ?auto_4372 ) ) ( not ( = ?auto_4376 ?auto_4378 ) ) ( HOIST-AT ?auto_4377 ?auto_4376 ) ( not ( = ?auto_4373 ?auto_4377 ) ) ( AVAILABLE ?auto_4377 ) ( SURFACE-AT ?auto_4371 ?auto_4376 ) ( ON ?auto_4371 ?auto_4375 ) ( CLEAR ?auto_4371 ) ( not ( = ?auto_4371 ?auto_4375 ) ) ( not ( = ?auto_4372 ?auto_4375 ) ) ( TRUCK-AT ?auto_4374 ?auto_4378 ) ( SURFACE-AT ?auto_4379 ?auto_4378 ) ( CLEAR ?auto_4379 ) ( LIFTING ?auto_4373 ?auto_4372 ) ( IS-CRATE ?auto_4372 ) ( not ( = ?auto_4371 ?auto_4379 ) ) ( not ( = ?auto_4372 ?auto_4379 ) ) ( not ( = ?auto_4375 ?auto_4379 ) ) )
    :subtasks
    ( ( !DROP ?auto_4373 ?auto_4372 ?auto_4379 ?auto_4378 )
      ( MAKE-ON ?auto_4371 ?auto_4372 )
      ( MAKE-ON-VERIFY ?auto_4371 ?auto_4372 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4380 - SURFACE
      ?auto_4381 - SURFACE
    )
    :vars
    (
      ?auto_4383 - HOIST
      ?auto_4387 - PLACE
      ?auto_4386 - PLACE
      ?auto_4382 - HOIST
      ?auto_4385 - SURFACE
      ?auto_4388 - TRUCK
      ?auto_4384 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4383 ?auto_4387 ) ( IS-CRATE ?auto_4380 ) ( not ( = ?auto_4380 ?auto_4381 ) ) ( not ( = ?auto_4386 ?auto_4387 ) ) ( HOIST-AT ?auto_4382 ?auto_4386 ) ( not ( = ?auto_4383 ?auto_4382 ) ) ( AVAILABLE ?auto_4382 ) ( SURFACE-AT ?auto_4380 ?auto_4386 ) ( ON ?auto_4380 ?auto_4385 ) ( CLEAR ?auto_4380 ) ( not ( = ?auto_4380 ?auto_4385 ) ) ( not ( = ?auto_4381 ?auto_4385 ) ) ( TRUCK-AT ?auto_4388 ?auto_4387 ) ( SURFACE-AT ?auto_4384 ?auto_4387 ) ( CLEAR ?auto_4384 ) ( IS-CRATE ?auto_4381 ) ( not ( = ?auto_4380 ?auto_4384 ) ) ( not ( = ?auto_4381 ?auto_4384 ) ) ( not ( = ?auto_4385 ?auto_4384 ) ) ( AVAILABLE ?auto_4383 ) ( IN ?auto_4381 ?auto_4388 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4383 ?auto_4381 ?auto_4388 ?auto_4387 )
      ( MAKE-ON ?auto_4380 ?auto_4381 )
      ( MAKE-ON-VERIFY ?auto_4380 ?auto_4381 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4389 - SURFACE
      ?auto_4390 - SURFACE
    )
    :vars
    (
      ?auto_4395 - HOIST
      ?auto_4396 - PLACE
      ?auto_4394 - PLACE
      ?auto_4392 - HOIST
      ?auto_4397 - SURFACE
      ?auto_4391 - SURFACE
      ?auto_4393 - TRUCK
      ?auto_4398 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4395 ?auto_4396 ) ( IS-CRATE ?auto_4389 ) ( not ( = ?auto_4389 ?auto_4390 ) ) ( not ( = ?auto_4394 ?auto_4396 ) ) ( HOIST-AT ?auto_4392 ?auto_4394 ) ( not ( = ?auto_4395 ?auto_4392 ) ) ( AVAILABLE ?auto_4392 ) ( SURFACE-AT ?auto_4389 ?auto_4394 ) ( ON ?auto_4389 ?auto_4397 ) ( CLEAR ?auto_4389 ) ( not ( = ?auto_4389 ?auto_4397 ) ) ( not ( = ?auto_4390 ?auto_4397 ) ) ( SURFACE-AT ?auto_4391 ?auto_4396 ) ( CLEAR ?auto_4391 ) ( IS-CRATE ?auto_4390 ) ( not ( = ?auto_4389 ?auto_4391 ) ) ( not ( = ?auto_4390 ?auto_4391 ) ) ( not ( = ?auto_4397 ?auto_4391 ) ) ( AVAILABLE ?auto_4395 ) ( IN ?auto_4390 ?auto_4393 ) ( TRUCK-AT ?auto_4393 ?auto_4398 ) ( not ( = ?auto_4398 ?auto_4396 ) ) ( not ( = ?auto_4394 ?auto_4398 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4393 ?auto_4398 ?auto_4396 )
      ( MAKE-ON ?auto_4389 ?auto_4390 )
      ( MAKE-ON-VERIFY ?auto_4389 ?auto_4390 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4399 - SURFACE
      ?auto_4400 - SURFACE
    )
    :vars
    (
      ?auto_4407 - HOIST
      ?auto_4401 - PLACE
      ?auto_4404 - PLACE
      ?auto_4406 - HOIST
      ?auto_4402 - SURFACE
      ?auto_4405 - SURFACE
      ?auto_4403 - TRUCK
      ?auto_4408 - PLACE
      ?auto_4409 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4407 ?auto_4401 ) ( IS-CRATE ?auto_4399 ) ( not ( = ?auto_4399 ?auto_4400 ) ) ( not ( = ?auto_4404 ?auto_4401 ) ) ( HOIST-AT ?auto_4406 ?auto_4404 ) ( not ( = ?auto_4407 ?auto_4406 ) ) ( AVAILABLE ?auto_4406 ) ( SURFACE-AT ?auto_4399 ?auto_4404 ) ( ON ?auto_4399 ?auto_4402 ) ( CLEAR ?auto_4399 ) ( not ( = ?auto_4399 ?auto_4402 ) ) ( not ( = ?auto_4400 ?auto_4402 ) ) ( SURFACE-AT ?auto_4405 ?auto_4401 ) ( CLEAR ?auto_4405 ) ( IS-CRATE ?auto_4400 ) ( not ( = ?auto_4399 ?auto_4405 ) ) ( not ( = ?auto_4400 ?auto_4405 ) ) ( not ( = ?auto_4402 ?auto_4405 ) ) ( AVAILABLE ?auto_4407 ) ( TRUCK-AT ?auto_4403 ?auto_4408 ) ( not ( = ?auto_4408 ?auto_4401 ) ) ( not ( = ?auto_4404 ?auto_4408 ) ) ( HOIST-AT ?auto_4409 ?auto_4408 ) ( LIFTING ?auto_4409 ?auto_4400 ) ( not ( = ?auto_4407 ?auto_4409 ) ) ( not ( = ?auto_4406 ?auto_4409 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4409 ?auto_4400 ?auto_4403 ?auto_4408 )
      ( MAKE-ON ?auto_4399 ?auto_4400 )
      ( MAKE-ON-VERIFY ?auto_4399 ?auto_4400 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4410 - SURFACE
      ?auto_4411 - SURFACE
    )
    :vars
    (
      ?auto_4418 - HOIST
      ?auto_4413 - PLACE
      ?auto_4420 - PLACE
      ?auto_4415 - HOIST
      ?auto_4417 - SURFACE
      ?auto_4416 - SURFACE
      ?auto_4414 - TRUCK
      ?auto_4419 - PLACE
      ?auto_4412 - HOIST
      ?auto_4421 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4418 ?auto_4413 ) ( IS-CRATE ?auto_4410 ) ( not ( = ?auto_4410 ?auto_4411 ) ) ( not ( = ?auto_4420 ?auto_4413 ) ) ( HOIST-AT ?auto_4415 ?auto_4420 ) ( not ( = ?auto_4418 ?auto_4415 ) ) ( AVAILABLE ?auto_4415 ) ( SURFACE-AT ?auto_4410 ?auto_4420 ) ( ON ?auto_4410 ?auto_4417 ) ( CLEAR ?auto_4410 ) ( not ( = ?auto_4410 ?auto_4417 ) ) ( not ( = ?auto_4411 ?auto_4417 ) ) ( SURFACE-AT ?auto_4416 ?auto_4413 ) ( CLEAR ?auto_4416 ) ( IS-CRATE ?auto_4411 ) ( not ( = ?auto_4410 ?auto_4416 ) ) ( not ( = ?auto_4411 ?auto_4416 ) ) ( not ( = ?auto_4417 ?auto_4416 ) ) ( AVAILABLE ?auto_4418 ) ( TRUCK-AT ?auto_4414 ?auto_4419 ) ( not ( = ?auto_4419 ?auto_4413 ) ) ( not ( = ?auto_4420 ?auto_4419 ) ) ( HOIST-AT ?auto_4412 ?auto_4419 ) ( not ( = ?auto_4418 ?auto_4412 ) ) ( not ( = ?auto_4415 ?auto_4412 ) ) ( AVAILABLE ?auto_4412 ) ( SURFACE-AT ?auto_4411 ?auto_4419 ) ( ON ?auto_4411 ?auto_4421 ) ( CLEAR ?auto_4411 ) ( not ( = ?auto_4410 ?auto_4421 ) ) ( not ( = ?auto_4411 ?auto_4421 ) ) ( not ( = ?auto_4417 ?auto_4421 ) ) ( not ( = ?auto_4416 ?auto_4421 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4412 ?auto_4411 ?auto_4421 ?auto_4419 )
      ( MAKE-ON ?auto_4410 ?auto_4411 )
      ( MAKE-ON-VERIFY ?auto_4410 ?auto_4411 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4422 - SURFACE
      ?auto_4423 - SURFACE
    )
    :vars
    (
      ?auto_4424 - HOIST
      ?auto_4427 - PLACE
      ?auto_4433 - PLACE
      ?auto_4431 - HOIST
      ?auto_4425 - SURFACE
      ?auto_4430 - SURFACE
      ?auto_4426 - PLACE
      ?auto_4432 - HOIST
      ?auto_4429 - SURFACE
      ?auto_4428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4424 ?auto_4427 ) ( IS-CRATE ?auto_4422 ) ( not ( = ?auto_4422 ?auto_4423 ) ) ( not ( = ?auto_4433 ?auto_4427 ) ) ( HOIST-AT ?auto_4431 ?auto_4433 ) ( not ( = ?auto_4424 ?auto_4431 ) ) ( AVAILABLE ?auto_4431 ) ( SURFACE-AT ?auto_4422 ?auto_4433 ) ( ON ?auto_4422 ?auto_4425 ) ( CLEAR ?auto_4422 ) ( not ( = ?auto_4422 ?auto_4425 ) ) ( not ( = ?auto_4423 ?auto_4425 ) ) ( SURFACE-AT ?auto_4430 ?auto_4427 ) ( CLEAR ?auto_4430 ) ( IS-CRATE ?auto_4423 ) ( not ( = ?auto_4422 ?auto_4430 ) ) ( not ( = ?auto_4423 ?auto_4430 ) ) ( not ( = ?auto_4425 ?auto_4430 ) ) ( AVAILABLE ?auto_4424 ) ( not ( = ?auto_4426 ?auto_4427 ) ) ( not ( = ?auto_4433 ?auto_4426 ) ) ( HOIST-AT ?auto_4432 ?auto_4426 ) ( not ( = ?auto_4424 ?auto_4432 ) ) ( not ( = ?auto_4431 ?auto_4432 ) ) ( AVAILABLE ?auto_4432 ) ( SURFACE-AT ?auto_4423 ?auto_4426 ) ( ON ?auto_4423 ?auto_4429 ) ( CLEAR ?auto_4423 ) ( not ( = ?auto_4422 ?auto_4429 ) ) ( not ( = ?auto_4423 ?auto_4429 ) ) ( not ( = ?auto_4425 ?auto_4429 ) ) ( not ( = ?auto_4430 ?auto_4429 ) ) ( TRUCK-AT ?auto_4428 ?auto_4427 ) )
    :subtasks
    ( ( !DRIVE ?auto_4428 ?auto_4427 ?auto_4426 )
      ( MAKE-ON ?auto_4422 ?auto_4423 )
      ( MAKE-ON-VERIFY ?auto_4422 ?auto_4423 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4434 - SURFACE
      ?auto_4435 - SURFACE
    )
    :vars
    (
      ?auto_4441 - HOIST
      ?auto_4439 - PLACE
      ?auto_4442 - PLACE
      ?auto_4440 - HOIST
      ?auto_4443 - SURFACE
      ?auto_4436 - SURFACE
      ?auto_4437 - PLACE
      ?auto_4438 - HOIST
      ?auto_4444 - SURFACE
      ?auto_4445 - TRUCK
      ?auto_4446 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4441 ?auto_4439 ) ( IS-CRATE ?auto_4434 ) ( not ( = ?auto_4434 ?auto_4435 ) ) ( not ( = ?auto_4442 ?auto_4439 ) ) ( HOIST-AT ?auto_4440 ?auto_4442 ) ( not ( = ?auto_4441 ?auto_4440 ) ) ( AVAILABLE ?auto_4440 ) ( SURFACE-AT ?auto_4434 ?auto_4442 ) ( ON ?auto_4434 ?auto_4443 ) ( CLEAR ?auto_4434 ) ( not ( = ?auto_4434 ?auto_4443 ) ) ( not ( = ?auto_4435 ?auto_4443 ) ) ( IS-CRATE ?auto_4435 ) ( not ( = ?auto_4434 ?auto_4436 ) ) ( not ( = ?auto_4435 ?auto_4436 ) ) ( not ( = ?auto_4443 ?auto_4436 ) ) ( not ( = ?auto_4437 ?auto_4439 ) ) ( not ( = ?auto_4442 ?auto_4437 ) ) ( HOIST-AT ?auto_4438 ?auto_4437 ) ( not ( = ?auto_4441 ?auto_4438 ) ) ( not ( = ?auto_4440 ?auto_4438 ) ) ( AVAILABLE ?auto_4438 ) ( SURFACE-AT ?auto_4435 ?auto_4437 ) ( ON ?auto_4435 ?auto_4444 ) ( CLEAR ?auto_4435 ) ( not ( = ?auto_4434 ?auto_4444 ) ) ( not ( = ?auto_4435 ?auto_4444 ) ) ( not ( = ?auto_4443 ?auto_4444 ) ) ( not ( = ?auto_4436 ?auto_4444 ) ) ( TRUCK-AT ?auto_4445 ?auto_4439 ) ( SURFACE-AT ?auto_4446 ?auto_4439 ) ( CLEAR ?auto_4446 ) ( LIFTING ?auto_4441 ?auto_4436 ) ( IS-CRATE ?auto_4436 ) ( not ( = ?auto_4434 ?auto_4446 ) ) ( not ( = ?auto_4435 ?auto_4446 ) ) ( not ( = ?auto_4443 ?auto_4446 ) ) ( not ( = ?auto_4436 ?auto_4446 ) ) ( not ( = ?auto_4444 ?auto_4446 ) ) )
    :subtasks
    ( ( !DROP ?auto_4441 ?auto_4436 ?auto_4446 ?auto_4439 )
      ( MAKE-ON ?auto_4434 ?auto_4435 )
      ( MAKE-ON-VERIFY ?auto_4434 ?auto_4435 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4447 - SURFACE
      ?auto_4448 - SURFACE
    )
    :vars
    (
      ?auto_4449 - HOIST
      ?auto_4458 - PLACE
      ?auto_4452 - PLACE
      ?auto_4454 - HOIST
      ?auto_4450 - SURFACE
      ?auto_4453 - SURFACE
      ?auto_4455 - PLACE
      ?auto_4457 - HOIST
      ?auto_4459 - SURFACE
      ?auto_4451 - TRUCK
      ?auto_4456 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4449 ?auto_4458 ) ( IS-CRATE ?auto_4447 ) ( not ( = ?auto_4447 ?auto_4448 ) ) ( not ( = ?auto_4452 ?auto_4458 ) ) ( HOIST-AT ?auto_4454 ?auto_4452 ) ( not ( = ?auto_4449 ?auto_4454 ) ) ( AVAILABLE ?auto_4454 ) ( SURFACE-AT ?auto_4447 ?auto_4452 ) ( ON ?auto_4447 ?auto_4450 ) ( CLEAR ?auto_4447 ) ( not ( = ?auto_4447 ?auto_4450 ) ) ( not ( = ?auto_4448 ?auto_4450 ) ) ( IS-CRATE ?auto_4448 ) ( not ( = ?auto_4447 ?auto_4453 ) ) ( not ( = ?auto_4448 ?auto_4453 ) ) ( not ( = ?auto_4450 ?auto_4453 ) ) ( not ( = ?auto_4455 ?auto_4458 ) ) ( not ( = ?auto_4452 ?auto_4455 ) ) ( HOIST-AT ?auto_4457 ?auto_4455 ) ( not ( = ?auto_4449 ?auto_4457 ) ) ( not ( = ?auto_4454 ?auto_4457 ) ) ( AVAILABLE ?auto_4457 ) ( SURFACE-AT ?auto_4448 ?auto_4455 ) ( ON ?auto_4448 ?auto_4459 ) ( CLEAR ?auto_4448 ) ( not ( = ?auto_4447 ?auto_4459 ) ) ( not ( = ?auto_4448 ?auto_4459 ) ) ( not ( = ?auto_4450 ?auto_4459 ) ) ( not ( = ?auto_4453 ?auto_4459 ) ) ( TRUCK-AT ?auto_4451 ?auto_4458 ) ( SURFACE-AT ?auto_4456 ?auto_4458 ) ( CLEAR ?auto_4456 ) ( IS-CRATE ?auto_4453 ) ( not ( = ?auto_4447 ?auto_4456 ) ) ( not ( = ?auto_4448 ?auto_4456 ) ) ( not ( = ?auto_4450 ?auto_4456 ) ) ( not ( = ?auto_4453 ?auto_4456 ) ) ( not ( = ?auto_4459 ?auto_4456 ) ) ( AVAILABLE ?auto_4449 ) ( IN ?auto_4453 ?auto_4451 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4449 ?auto_4453 ?auto_4451 ?auto_4458 )
      ( MAKE-ON ?auto_4447 ?auto_4448 )
      ( MAKE-ON-VERIFY ?auto_4447 ?auto_4448 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4460 - SURFACE
      ?auto_4461 - SURFACE
    )
    :vars
    (
      ?auto_4471 - HOIST
      ?auto_4462 - PLACE
      ?auto_4465 - PLACE
      ?auto_4466 - HOIST
      ?auto_4469 - SURFACE
      ?auto_4468 - SURFACE
      ?auto_4472 - PLACE
      ?auto_4467 - HOIST
      ?auto_4464 - SURFACE
      ?auto_4463 - SURFACE
      ?auto_4470 - TRUCK
      ?auto_4473 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4471 ?auto_4462 ) ( IS-CRATE ?auto_4460 ) ( not ( = ?auto_4460 ?auto_4461 ) ) ( not ( = ?auto_4465 ?auto_4462 ) ) ( HOIST-AT ?auto_4466 ?auto_4465 ) ( not ( = ?auto_4471 ?auto_4466 ) ) ( AVAILABLE ?auto_4466 ) ( SURFACE-AT ?auto_4460 ?auto_4465 ) ( ON ?auto_4460 ?auto_4469 ) ( CLEAR ?auto_4460 ) ( not ( = ?auto_4460 ?auto_4469 ) ) ( not ( = ?auto_4461 ?auto_4469 ) ) ( IS-CRATE ?auto_4461 ) ( not ( = ?auto_4460 ?auto_4468 ) ) ( not ( = ?auto_4461 ?auto_4468 ) ) ( not ( = ?auto_4469 ?auto_4468 ) ) ( not ( = ?auto_4472 ?auto_4462 ) ) ( not ( = ?auto_4465 ?auto_4472 ) ) ( HOIST-AT ?auto_4467 ?auto_4472 ) ( not ( = ?auto_4471 ?auto_4467 ) ) ( not ( = ?auto_4466 ?auto_4467 ) ) ( AVAILABLE ?auto_4467 ) ( SURFACE-AT ?auto_4461 ?auto_4472 ) ( ON ?auto_4461 ?auto_4464 ) ( CLEAR ?auto_4461 ) ( not ( = ?auto_4460 ?auto_4464 ) ) ( not ( = ?auto_4461 ?auto_4464 ) ) ( not ( = ?auto_4469 ?auto_4464 ) ) ( not ( = ?auto_4468 ?auto_4464 ) ) ( SURFACE-AT ?auto_4463 ?auto_4462 ) ( CLEAR ?auto_4463 ) ( IS-CRATE ?auto_4468 ) ( not ( = ?auto_4460 ?auto_4463 ) ) ( not ( = ?auto_4461 ?auto_4463 ) ) ( not ( = ?auto_4469 ?auto_4463 ) ) ( not ( = ?auto_4468 ?auto_4463 ) ) ( not ( = ?auto_4464 ?auto_4463 ) ) ( AVAILABLE ?auto_4471 ) ( IN ?auto_4468 ?auto_4470 ) ( TRUCK-AT ?auto_4470 ?auto_4473 ) ( not ( = ?auto_4473 ?auto_4462 ) ) ( not ( = ?auto_4465 ?auto_4473 ) ) ( not ( = ?auto_4472 ?auto_4473 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4470 ?auto_4473 ?auto_4462 )
      ( MAKE-ON ?auto_4460 ?auto_4461 )
      ( MAKE-ON-VERIFY ?auto_4460 ?auto_4461 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4474 - SURFACE
      ?auto_4475 - SURFACE
    )
    :vars
    (
      ?auto_4481 - HOIST
      ?auto_4485 - PLACE
      ?auto_4483 - PLACE
      ?auto_4478 - HOIST
      ?auto_4480 - SURFACE
      ?auto_4487 - SURFACE
      ?auto_4482 - PLACE
      ?auto_4479 - HOIST
      ?auto_4486 - SURFACE
      ?auto_4484 - SURFACE
      ?auto_4477 - TRUCK
      ?auto_4476 - PLACE
      ?auto_4488 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4481 ?auto_4485 ) ( IS-CRATE ?auto_4474 ) ( not ( = ?auto_4474 ?auto_4475 ) ) ( not ( = ?auto_4483 ?auto_4485 ) ) ( HOIST-AT ?auto_4478 ?auto_4483 ) ( not ( = ?auto_4481 ?auto_4478 ) ) ( AVAILABLE ?auto_4478 ) ( SURFACE-AT ?auto_4474 ?auto_4483 ) ( ON ?auto_4474 ?auto_4480 ) ( CLEAR ?auto_4474 ) ( not ( = ?auto_4474 ?auto_4480 ) ) ( not ( = ?auto_4475 ?auto_4480 ) ) ( IS-CRATE ?auto_4475 ) ( not ( = ?auto_4474 ?auto_4487 ) ) ( not ( = ?auto_4475 ?auto_4487 ) ) ( not ( = ?auto_4480 ?auto_4487 ) ) ( not ( = ?auto_4482 ?auto_4485 ) ) ( not ( = ?auto_4483 ?auto_4482 ) ) ( HOIST-AT ?auto_4479 ?auto_4482 ) ( not ( = ?auto_4481 ?auto_4479 ) ) ( not ( = ?auto_4478 ?auto_4479 ) ) ( AVAILABLE ?auto_4479 ) ( SURFACE-AT ?auto_4475 ?auto_4482 ) ( ON ?auto_4475 ?auto_4486 ) ( CLEAR ?auto_4475 ) ( not ( = ?auto_4474 ?auto_4486 ) ) ( not ( = ?auto_4475 ?auto_4486 ) ) ( not ( = ?auto_4480 ?auto_4486 ) ) ( not ( = ?auto_4487 ?auto_4486 ) ) ( SURFACE-AT ?auto_4484 ?auto_4485 ) ( CLEAR ?auto_4484 ) ( IS-CRATE ?auto_4487 ) ( not ( = ?auto_4474 ?auto_4484 ) ) ( not ( = ?auto_4475 ?auto_4484 ) ) ( not ( = ?auto_4480 ?auto_4484 ) ) ( not ( = ?auto_4487 ?auto_4484 ) ) ( not ( = ?auto_4486 ?auto_4484 ) ) ( AVAILABLE ?auto_4481 ) ( TRUCK-AT ?auto_4477 ?auto_4476 ) ( not ( = ?auto_4476 ?auto_4485 ) ) ( not ( = ?auto_4483 ?auto_4476 ) ) ( not ( = ?auto_4482 ?auto_4476 ) ) ( HOIST-AT ?auto_4488 ?auto_4476 ) ( LIFTING ?auto_4488 ?auto_4487 ) ( not ( = ?auto_4481 ?auto_4488 ) ) ( not ( = ?auto_4478 ?auto_4488 ) ) ( not ( = ?auto_4479 ?auto_4488 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4488 ?auto_4487 ?auto_4477 ?auto_4476 )
      ( MAKE-ON ?auto_4474 ?auto_4475 )
      ( MAKE-ON-VERIFY ?auto_4474 ?auto_4475 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4489 - SURFACE
      ?auto_4490 - SURFACE
    )
    :vars
    (
      ?auto_4500 - HOIST
      ?auto_4495 - PLACE
      ?auto_4493 - PLACE
      ?auto_4496 - HOIST
      ?auto_4497 - SURFACE
      ?auto_4499 - SURFACE
      ?auto_4503 - PLACE
      ?auto_4491 - HOIST
      ?auto_4498 - SURFACE
      ?auto_4494 - SURFACE
      ?auto_4492 - TRUCK
      ?auto_4501 - PLACE
      ?auto_4502 - HOIST
      ?auto_4504 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4500 ?auto_4495 ) ( IS-CRATE ?auto_4489 ) ( not ( = ?auto_4489 ?auto_4490 ) ) ( not ( = ?auto_4493 ?auto_4495 ) ) ( HOIST-AT ?auto_4496 ?auto_4493 ) ( not ( = ?auto_4500 ?auto_4496 ) ) ( AVAILABLE ?auto_4496 ) ( SURFACE-AT ?auto_4489 ?auto_4493 ) ( ON ?auto_4489 ?auto_4497 ) ( CLEAR ?auto_4489 ) ( not ( = ?auto_4489 ?auto_4497 ) ) ( not ( = ?auto_4490 ?auto_4497 ) ) ( IS-CRATE ?auto_4490 ) ( not ( = ?auto_4489 ?auto_4499 ) ) ( not ( = ?auto_4490 ?auto_4499 ) ) ( not ( = ?auto_4497 ?auto_4499 ) ) ( not ( = ?auto_4503 ?auto_4495 ) ) ( not ( = ?auto_4493 ?auto_4503 ) ) ( HOIST-AT ?auto_4491 ?auto_4503 ) ( not ( = ?auto_4500 ?auto_4491 ) ) ( not ( = ?auto_4496 ?auto_4491 ) ) ( AVAILABLE ?auto_4491 ) ( SURFACE-AT ?auto_4490 ?auto_4503 ) ( ON ?auto_4490 ?auto_4498 ) ( CLEAR ?auto_4490 ) ( not ( = ?auto_4489 ?auto_4498 ) ) ( not ( = ?auto_4490 ?auto_4498 ) ) ( not ( = ?auto_4497 ?auto_4498 ) ) ( not ( = ?auto_4499 ?auto_4498 ) ) ( SURFACE-AT ?auto_4494 ?auto_4495 ) ( CLEAR ?auto_4494 ) ( IS-CRATE ?auto_4499 ) ( not ( = ?auto_4489 ?auto_4494 ) ) ( not ( = ?auto_4490 ?auto_4494 ) ) ( not ( = ?auto_4497 ?auto_4494 ) ) ( not ( = ?auto_4499 ?auto_4494 ) ) ( not ( = ?auto_4498 ?auto_4494 ) ) ( AVAILABLE ?auto_4500 ) ( TRUCK-AT ?auto_4492 ?auto_4501 ) ( not ( = ?auto_4501 ?auto_4495 ) ) ( not ( = ?auto_4493 ?auto_4501 ) ) ( not ( = ?auto_4503 ?auto_4501 ) ) ( HOIST-AT ?auto_4502 ?auto_4501 ) ( not ( = ?auto_4500 ?auto_4502 ) ) ( not ( = ?auto_4496 ?auto_4502 ) ) ( not ( = ?auto_4491 ?auto_4502 ) ) ( AVAILABLE ?auto_4502 ) ( SURFACE-AT ?auto_4499 ?auto_4501 ) ( ON ?auto_4499 ?auto_4504 ) ( CLEAR ?auto_4499 ) ( not ( = ?auto_4489 ?auto_4504 ) ) ( not ( = ?auto_4490 ?auto_4504 ) ) ( not ( = ?auto_4497 ?auto_4504 ) ) ( not ( = ?auto_4499 ?auto_4504 ) ) ( not ( = ?auto_4498 ?auto_4504 ) ) ( not ( = ?auto_4494 ?auto_4504 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4502 ?auto_4499 ?auto_4504 ?auto_4501 )
      ( MAKE-ON ?auto_4489 ?auto_4490 )
      ( MAKE-ON-VERIFY ?auto_4489 ?auto_4490 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4505 - SURFACE
      ?auto_4506 - SURFACE
    )
    :vars
    (
      ?auto_4513 - HOIST
      ?auto_4518 - PLACE
      ?auto_4508 - PLACE
      ?auto_4517 - HOIST
      ?auto_4512 - SURFACE
      ?auto_4510 - SURFACE
      ?auto_4511 - PLACE
      ?auto_4509 - HOIST
      ?auto_4507 - SURFACE
      ?auto_4520 - SURFACE
      ?auto_4519 - PLACE
      ?auto_4515 - HOIST
      ?auto_4514 - SURFACE
      ?auto_4516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4513 ?auto_4518 ) ( IS-CRATE ?auto_4505 ) ( not ( = ?auto_4505 ?auto_4506 ) ) ( not ( = ?auto_4508 ?auto_4518 ) ) ( HOIST-AT ?auto_4517 ?auto_4508 ) ( not ( = ?auto_4513 ?auto_4517 ) ) ( AVAILABLE ?auto_4517 ) ( SURFACE-AT ?auto_4505 ?auto_4508 ) ( ON ?auto_4505 ?auto_4512 ) ( CLEAR ?auto_4505 ) ( not ( = ?auto_4505 ?auto_4512 ) ) ( not ( = ?auto_4506 ?auto_4512 ) ) ( IS-CRATE ?auto_4506 ) ( not ( = ?auto_4505 ?auto_4510 ) ) ( not ( = ?auto_4506 ?auto_4510 ) ) ( not ( = ?auto_4512 ?auto_4510 ) ) ( not ( = ?auto_4511 ?auto_4518 ) ) ( not ( = ?auto_4508 ?auto_4511 ) ) ( HOIST-AT ?auto_4509 ?auto_4511 ) ( not ( = ?auto_4513 ?auto_4509 ) ) ( not ( = ?auto_4517 ?auto_4509 ) ) ( AVAILABLE ?auto_4509 ) ( SURFACE-AT ?auto_4506 ?auto_4511 ) ( ON ?auto_4506 ?auto_4507 ) ( CLEAR ?auto_4506 ) ( not ( = ?auto_4505 ?auto_4507 ) ) ( not ( = ?auto_4506 ?auto_4507 ) ) ( not ( = ?auto_4512 ?auto_4507 ) ) ( not ( = ?auto_4510 ?auto_4507 ) ) ( SURFACE-AT ?auto_4520 ?auto_4518 ) ( CLEAR ?auto_4520 ) ( IS-CRATE ?auto_4510 ) ( not ( = ?auto_4505 ?auto_4520 ) ) ( not ( = ?auto_4506 ?auto_4520 ) ) ( not ( = ?auto_4512 ?auto_4520 ) ) ( not ( = ?auto_4510 ?auto_4520 ) ) ( not ( = ?auto_4507 ?auto_4520 ) ) ( AVAILABLE ?auto_4513 ) ( not ( = ?auto_4519 ?auto_4518 ) ) ( not ( = ?auto_4508 ?auto_4519 ) ) ( not ( = ?auto_4511 ?auto_4519 ) ) ( HOIST-AT ?auto_4515 ?auto_4519 ) ( not ( = ?auto_4513 ?auto_4515 ) ) ( not ( = ?auto_4517 ?auto_4515 ) ) ( not ( = ?auto_4509 ?auto_4515 ) ) ( AVAILABLE ?auto_4515 ) ( SURFACE-AT ?auto_4510 ?auto_4519 ) ( ON ?auto_4510 ?auto_4514 ) ( CLEAR ?auto_4510 ) ( not ( = ?auto_4505 ?auto_4514 ) ) ( not ( = ?auto_4506 ?auto_4514 ) ) ( not ( = ?auto_4512 ?auto_4514 ) ) ( not ( = ?auto_4510 ?auto_4514 ) ) ( not ( = ?auto_4507 ?auto_4514 ) ) ( not ( = ?auto_4520 ?auto_4514 ) ) ( TRUCK-AT ?auto_4516 ?auto_4518 ) )
    :subtasks
    ( ( !DRIVE ?auto_4516 ?auto_4518 ?auto_4519 )
      ( MAKE-ON ?auto_4505 ?auto_4506 )
      ( MAKE-ON-VERIFY ?auto_4505 ?auto_4506 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4523 - SURFACE
      ?auto_4524 - SURFACE
    )
    :vars
    (
      ?auto_4525 - HOIST
      ?auto_4526 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4525 ?auto_4526 ) ( SURFACE-AT ?auto_4524 ?auto_4526 ) ( CLEAR ?auto_4524 ) ( LIFTING ?auto_4525 ?auto_4523 ) ( IS-CRATE ?auto_4523 ) ( not ( = ?auto_4523 ?auto_4524 ) ) )
    :subtasks
    ( ( !DROP ?auto_4525 ?auto_4523 ?auto_4524 ?auto_4526 )
      ( MAKE-ON-VERIFY ?auto_4523 ?auto_4524 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4527 - SURFACE
      ?auto_4528 - SURFACE
    )
    :vars
    (
      ?auto_4529 - HOIST
      ?auto_4530 - PLACE
      ?auto_4531 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4529 ?auto_4530 ) ( SURFACE-AT ?auto_4528 ?auto_4530 ) ( CLEAR ?auto_4528 ) ( IS-CRATE ?auto_4527 ) ( not ( = ?auto_4527 ?auto_4528 ) ) ( TRUCK-AT ?auto_4531 ?auto_4530 ) ( AVAILABLE ?auto_4529 ) ( IN ?auto_4527 ?auto_4531 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4529 ?auto_4527 ?auto_4531 ?auto_4530 )
      ( MAKE-ON ?auto_4527 ?auto_4528 )
      ( MAKE-ON-VERIFY ?auto_4527 ?auto_4528 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4532 - SURFACE
      ?auto_4533 - SURFACE
    )
    :vars
    (
      ?auto_4534 - HOIST
      ?auto_4536 - PLACE
      ?auto_4535 - TRUCK
      ?auto_4537 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4534 ?auto_4536 ) ( SURFACE-AT ?auto_4533 ?auto_4536 ) ( CLEAR ?auto_4533 ) ( IS-CRATE ?auto_4532 ) ( not ( = ?auto_4532 ?auto_4533 ) ) ( AVAILABLE ?auto_4534 ) ( IN ?auto_4532 ?auto_4535 ) ( TRUCK-AT ?auto_4535 ?auto_4537 ) ( not ( = ?auto_4537 ?auto_4536 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4535 ?auto_4537 ?auto_4536 )
      ( MAKE-ON ?auto_4532 ?auto_4533 )
      ( MAKE-ON-VERIFY ?auto_4532 ?auto_4533 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4538 - SURFACE
      ?auto_4539 - SURFACE
    )
    :vars
    (
      ?auto_4541 - HOIST
      ?auto_4543 - PLACE
      ?auto_4542 - TRUCK
      ?auto_4540 - PLACE
      ?auto_4544 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4541 ?auto_4543 ) ( SURFACE-AT ?auto_4539 ?auto_4543 ) ( CLEAR ?auto_4539 ) ( IS-CRATE ?auto_4538 ) ( not ( = ?auto_4538 ?auto_4539 ) ) ( AVAILABLE ?auto_4541 ) ( TRUCK-AT ?auto_4542 ?auto_4540 ) ( not ( = ?auto_4540 ?auto_4543 ) ) ( HOIST-AT ?auto_4544 ?auto_4540 ) ( LIFTING ?auto_4544 ?auto_4538 ) ( not ( = ?auto_4541 ?auto_4544 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4544 ?auto_4538 ?auto_4542 ?auto_4540 )
      ( MAKE-ON ?auto_4538 ?auto_4539 )
      ( MAKE-ON-VERIFY ?auto_4538 ?auto_4539 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4545 - SURFACE
      ?auto_4546 - SURFACE
    )
    :vars
    (
      ?auto_4550 - HOIST
      ?auto_4548 - PLACE
      ?auto_4551 - TRUCK
      ?auto_4547 - PLACE
      ?auto_4549 - HOIST
      ?auto_4552 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4550 ?auto_4548 ) ( SURFACE-AT ?auto_4546 ?auto_4548 ) ( CLEAR ?auto_4546 ) ( IS-CRATE ?auto_4545 ) ( not ( = ?auto_4545 ?auto_4546 ) ) ( AVAILABLE ?auto_4550 ) ( TRUCK-AT ?auto_4551 ?auto_4547 ) ( not ( = ?auto_4547 ?auto_4548 ) ) ( HOIST-AT ?auto_4549 ?auto_4547 ) ( not ( = ?auto_4550 ?auto_4549 ) ) ( AVAILABLE ?auto_4549 ) ( SURFACE-AT ?auto_4545 ?auto_4547 ) ( ON ?auto_4545 ?auto_4552 ) ( CLEAR ?auto_4545 ) ( not ( = ?auto_4545 ?auto_4552 ) ) ( not ( = ?auto_4546 ?auto_4552 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4549 ?auto_4545 ?auto_4552 ?auto_4547 )
      ( MAKE-ON ?auto_4545 ?auto_4546 )
      ( MAKE-ON-VERIFY ?auto_4545 ?auto_4546 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4553 - SURFACE
      ?auto_4554 - SURFACE
    )
    :vars
    (
      ?auto_4556 - HOIST
      ?auto_4555 - PLACE
      ?auto_4559 - PLACE
      ?auto_4557 - HOIST
      ?auto_4560 - SURFACE
      ?auto_4558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4556 ?auto_4555 ) ( SURFACE-AT ?auto_4554 ?auto_4555 ) ( CLEAR ?auto_4554 ) ( IS-CRATE ?auto_4553 ) ( not ( = ?auto_4553 ?auto_4554 ) ) ( AVAILABLE ?auto_4556 ) ( not ( = ?auto_4559 ?auto_4555 ) ) ( HOIST-AT ?auto_4557 ?auto_4559 ) ( not ( = ?auto_4556 ?auto_4557 ) ) ( AVAILABLE ?auto_4557 ) ( SURFACE-AT ?auto_4553 ?auto_4559 ) ( ON ?auto_4553 ?auto_4560 ) ( CLEAR ?auto_4553 ) ( not ( = ?auto_4553 ?auto_4560 ) ) ( not ( = ?auto_4554 ?auto_4560 ) ) ( TRUCK-AT ?auto_4558 ?auto_4555 ) )
    :subtasks
    ( ( !DRIVE ?auto_4558 ?auto_4555 ?auto_4559 )
      ( MAKE-ON ?auto_4553 ?auto_4554 )
      ( MAKE-ON-VERIFY ?auto_4553 ?auto_4554 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4561 - SURFACE
      ?auto_4562 - SURFACE
    )
    :vars
    (
      ?auto_4566 - HOIST
      ?auto_4565 - PLACE
      ?auto_4568 - PLACE
      ?auto_4563 - HOIST
      ?auto_4564 - SURFACE
      ?auto_4567 - TRUCK
      ?auto_4569 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4566 ?auto_4565 ) ( IS-CRATE ?auto_4561 ) ( not ( = ?auto_4561 ?auto_4562 ) ) ( not ( = ?auto_4568 ?auto_4565 ) ) ( HOIST-AT ?auto_4563 ?auto_4568 ) ( not ( = ?auto_4566 ?auto_4563 ) ) ( AVAILABLE ?auto_4563 ) ( SURFACE-AT ?auto_4561 ?auto_4568 ) ( ON ?auto_4561 ?auto_4564 ) ( CLEAR ?auto_4561 ) ( not ( = ?auto_4561 ?auto_4564 ) ) ( not ( = ?auto_4562 ?auto_4564 ) ) ( TRUCK-AT ?auto_4567 ?auto_4565 ) ( SURFACE-AT ?auto_4569 ?auto_4565 ) ( CLEAR ?auto_4569 ) ( LIFTING ?auto_4566 ?auto_4562 ) ( IS-CRATE ?auto_4562 ) ( not ( = ?auto_4561 ?auto_4569 ) ) ( not ( = ?auto_4562 ?auto_4569 ) ) ( not ( = ?auto_4564 ?auto_4569 ) ) )
    :subtasks
    ( ( !DROP ?auto_4566 ?auto_4562 ?auto_4569 ?auto_4565 )
      ( MAKE-ON ?auto_4561 ?auto_4562 )
      ( MAKE-ON-VERIFY ?auto_4561 ?auto_4562 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4570 - SURFACE
      ?auto_4571 - SURFACE
    )
    :vars
    (
      ?auto_4575 - HOIST
      ?auto_4576 - PLACE
      ?auto_4578 - PLACE
      ?auto_4572 - HOIST
      ?auto_4577 - SURFACE
      ?auto_4573 - TRUCK
      ?auto_4574 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4575 ?auto_4576 ) ( IS-CRATE ?auto_4570 ) ( not ( = ?auto_4570 ?auto_4571 ) ) ( not ( = ?auto_4578 ?auto_4576 ) ) ( HOIST-AT ?auto_4572 ?auto_4578 ) ( not ( = ?auto_4575 ?auto_4572 ) ) ( AVAILABLE ?auto_4572 ) ( SURFACE-AT ?auto_4570 ?auto_4578 ) ( ON ?auto_4570 ?auto_4577 ) ( CLEAR ?auto_4570 ) ( not ( = ?auto_4570 ?auto_4577 ) ) ( not ( = ?auto_4571 ?auto_4577 ) ) ( TRUCK-AT ?auto_4573 ?auto_4576 ) ( SURFACE-AT ?auto_4574 ?auto_4576 ) ( CLEAR ?auto_4574 ) ( IS-CRATE ?auto_4571 ) ( not ( = ?auto_4570 ?auto_4574 ) ) ( not ( = ?auto_4571 ?auto_4574 ) ) ( not ( = ?auto_4577 ?auto_4574 ) ) ( AVAILABLE ?auto_4575 ) ( IN ?auto_4571 ?auto_4573 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4575 ?auto_4571 ?auto_4573 ?auto_4576 )
      ( MAKE-ON ?auto_4570 ?auto_4571 )
      ( MAKE-ON-VERIFY ?auto_4570 ?auto_4571 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4579 - SURFACE
      ?auto_4580 - SURFACE
    )
    :vars
    (
      ?auto_4581 - HOIST
      ?auto_4582 - PLACE
      ?auto_4587 - PLACE
      ?auto_4586 - HOIST
      ?auto_4584 - SURFACE
      ?auto_4583 - SURFACE
      ?auto_4585 - TRUCK
      ?auto_4588 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4581 ?auto_4582 ) ( IS-CRATE ?auto_4579 ) ( not ( = ?auto_4579 ?auto_4580 ) ) ( not ( = ?auto_4587 ?auto_4582 ) ) ( HOIST-AT ?auto_4586 ?auto_4587 ) ( not ( = ?auto_4581 ?auto_4586 ) ) ( AVAILABLE ?auto_4586 ) ( SURFACE-AT ?auto_4579 ?auto_4587 ) ( ON ?auto_4579 ?auto_4584 ) ( CLEAR ?auto_4579 ) ( not ( = ?auto_4579 ?auto_4584 ) ) ( not ( = ?auto_4580 ?auto_4584 ) ) ( SURFACE-AT ?auto_4583 ?auto_4582 ) ( CLEAR ?auto_4583 ) ( IS-CRATE ?auto_4580 ) ( not ( = ?auto_4579 ?auto_4583 ) ) ( not ( = ?auto_4580 ?auto_4583 ) ) ( not ( = ?auto_4584 ?auto_4583 ) ) ( AVAILABLE ?auto_4581 ) ( IN ?auto_4580 ?auto_4585 ) ( TRUCK-AT ?auto_4585 ?auto_4588 ) ( not ( = ?auto_4588 ?auto_4582 ) ) ( not ( = ?auto_4587 ?auto_4588 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4585 ?auto_4588 ?auto_4582 )
      ( MAKE-ON ?auto_4579 ?auto_4580 )
      ( MAKE-ON-VERIFY ?auto_4579 ?auto_4580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4589 - SURFACE
      ?auto_4590 - SURFACE
    )
    :vars
    (
      ?auto_4598 - HOIST
      ?auto_4595 - PLACE
      ?auto_4594 - PLACE
      ?auto_4592 - HOIST
      ?auto_4591 - SURFACE
      ?auto_4593 - SURFACE
      ?auto_4596 - TRUCK
      ?auto_4597 - PLACE
      ?auto_4599 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4598 ?auto_4595 ) ( IS-CRATE ?auto_4589 ) ( not ( = ?auto_4589 ?auto_4590 ) ) ( not ( = ?auto_4594 ?auto_4595 ) ) ( HOIST-AT ?auto_4592 ?auto_4594 ) ( not ( = ?auto_4598 ?auto_4592 ) ) ( AVAILABLE ?auto_4592 ) ( SURFACE-AT ?auto_4589 ?auto_4594 ) ( ON ?auto_4589 ?auto_4591 ) ( CLEAR ?auto_4589 ) ( not ( = ?auto_4589 ?auto_4591 ) ) ( not ( = ?auto_4590 ?auto_4591 ) ) ( SURFACE-AT ?auto_4593 ?auto_4595 ) ( CLEAR ?auto_4593 ) ( IS-CRATE ?auto_4590 ) ( not ( = ?auto_4589 ?auto_4593 ) ) ( not ( = ?auto_4590 ?auto_4593 ) ) ( not ( = ?auto_4591 ?auto_4593 ) ) ( AVAILABLE ?auto_4598 ) ( TRUCK-AT ?auto_4596 ?auto_4597 ) ( not ( = ?auto_4597 ?auto_4595 ) ) ( not ( = ?auto_4594 ?auto_4597 ) ) ( HOIST-AT ?auto_4599 ?auto_4597 ) ( LIFTING ?auto_4599 ?auto_4590 ) ( not ( = ?auto_4598 ?auto_4599 ) ) ( not ( = ?auto_4592 ?auto_4599 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4599 ?auto_4590 ?auto_4596 ?auto_4597 )
      ( MAKE-ON ?auto_4589 ?auto_4590 )
      ( MAKE-ON-VERIFY ?auto_4589 ?auto_4590 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4600 - SURFACE
      ?auto_4601 - SURFACE
    )
    :vars
    (
      ?auto_4604 - HOIST
      ?auto_4605 - PLACE
      ?auto_4610 - PLACE
      ?auto_4606 - HOIST
      ?auto_4608 - SURFACE
      ?auto_4603 - SURFACE
      ?auto_4607 - TRUCK
      ?auto_4602 - PLACE
      ?auto_4609 - HOIST
      ?auto_4611 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4604 ?auto_4605 ) ( IS-CRATE ?auto_4600 ) ( not ( = ?auto_4600 ?auto_4601 ) ) ( not ( = ?auto_4610 ?auto_4605 ) ) ( HOIST-AT ?auto_4606 ?auto_4610 ) ( not ( = ?auto_4604 ?auto_4606 ) ) ( AVAILABLE ?auto_4606 ) ( SURFACE-AT ?auto_4600 ?auto_4610 ) ( ON ?auto_4600 ?auto_4608 ) ( CLEAR ?auto_4600 ) ( not ( = ?auto_4600 ?auto_4608 ) ) ( not ( = ?auto_4601 ?auto_4608 ) ) ( SURFACE-AT ?auto_4603 ?auto_4605 ) ( CLEAR ?auto_4603 ) ( IS-CRATE ?auto_4601 ) ( not ( = ?auto_4600 ?auto_4603 ) ) ( not ( = ?auto_4601 ?auto_4603 ) ) ( not ( = ?auto_4608 ?auto_4603 ) ) ( AVAILABLE ?auto_4604 ) ( TRUCK-AT ?auto_4607 ?auto_4602 ) ( not ( = ?auto_4602 ?auto_4605 ) ) ( not ( = ?auto_4610 ?auto_4602 ) ) ( HOIST-AT ?auto_4609 ?auto_4602 ) ( not ( = ?auto_4604 ?auto_4609 ) ) ( not ( = ?auto_4606 ?auto_4609 ) ) ( AVAILABLE ?auto_4609 ) ( SURFACE-AT ?auto_4601 ?auto_4602 ) ( ON ?auto_4601 ?auto_4611 ) ( CLEAR ?auto_4601 ) ( not ( = ?auto_4600 ?auto_4611 ) ) ( not ( = ?auto_4601 ?auto_4611 ) ) ( not ( = ?auto_4608 ?auto_4611 ) ) ( not ( = ?auto_4603 ?auto_4611 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4609 ?auto_4601 ?auto_4611 ?auto_4602 )
      ( MAKE-ON ?auto_4600 ?auto_4601 )
      ( MAKE-ON-VERIFY ?auto_4600 ?auto_4601 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4612 - SURFACE
      ?auto_4613 - SURFACE
    )
    :vars
    (
      ?auto_4621 - HOIST
      ?auto_4617 - PLACE
      ?auto_4618 - PLACE
      ?auto_4614 - HOIST
      ?auto_4622 - SURFACE
      ?auto_4620 - SURFACE
      ?auto_4615 - PLACE
      ?auto_4619 - HOIST
      ?auto_4616 - SURFACE
      ?auto_4623 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4621 ?auto_4617 ) ( IS-CRATE ?auto_4612 ) ( not ( = ?auto_4612 ?auto_4613 ) ) ( not ( = ?auto_4618 ?auto_4617 ) ) ( HOIST-AT ?auto_4614 ?auto_4618 ) ( not ( = ?auto_4621 ?auto_4614 ) ) ( AVAILABLE ?auto_4614 ) ( SURFACE-AT ?auto_4612 ?auto_4618 ) ( ON ?auto_4612 ?auto_4622 ) ( CLEAR ?auto_4612 ) ( not ( = ?auto_4612 ?auto_4622 ) ) ( not ( = ?auto_4613 ?auto_4622 ) ) ( SURFACE-AT ?auto_4620 ?auto_4617 ) ( CLEAR ?auto_4620 ) ( IS-CRATE ?auto_4613 ) ( not ( = ?auto_4612 ?auto_4620 ) ) ( not ( = ?auto_4613 ?auto_4620 ) ) ( not ( = ?auto_4622 ?auto_4620 ) ) ( AVAILABLE ?auto_4621 ) ( not ( = ?auto_4615 ?auto_4617 ) ) ( not ( = ?auto_4618 ?auto_4615 ) ) ( HOIST-AT ?auto_4619 ?auto_4615 ) ( not ( = ?auto_4621 ?auto_4619 ) ) ( not ( = ?auto_4614 ?auto_4619 ) ) ( AVAILABLE ?auto_4619 ) ( SURFACE-AT ?auto_4613 ?auto_4615 ) ( ON ?auto_4613 ?auto_4616 ) ( CLEAR ?auto_4613 ) ( not ( = ?auto_4612 ?auto_4616 ) ) ( not ( = ?auto_4613 ?auto_4616 ) ) ( not ( = ?auto_4622 ?auto_4616 ) ) ( not ( = ?auto_4620 ?auto_4616 ) ) ( TRUCK-AT ?auto_4623 ?auto_4617 ) )
    :subtasks
    ( ( !DRIVE ?auto_4623 ?auto_4617 ?auto_4615 )
      ( MAKE-ON ?auto_4612 ?auto_4613 )
      ( MAKE-ON-VERIFY ?auto_4612 ?auto_4613 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4624 - SURFACE
      ?auto_4625 - SURFACE
    )
    :vars
    (
      ?auto_4628 - HOIST
      ?auto_4627 - PLACE
      ?auto_4635 - PLACE
      ?auto_4632 - HOIST
      ?auto_4631 - SURFACE
      ?auto_4630 - SURFACE
      ?auto_4634 - PLACE
      ?auto_4629 - HOIST
      ?auto_4626 - SURFACE
      ?auto_4633 - TRUCK
      ?auto_4636 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4628 ?auto_4627 ) ( IS-CRATE ?auto_4624 ) ( not ( = ?auto_4624 ?auto_4625 ) ) ( not ( = ?auto_4635 ?auto_4627 ) ) ( HOIST-AT ?auto_4632 ?auto_4635 ) ( not ( = ?auto_4628 ?auto_4632 ) ) ( AVAILABLE ?auto_4632 ) ( SURFACE-AT ?auto_4624 ?auto_4635 ) ( ON ?auto_4624 ?auto_4631 ) ( CLEAR ?auto_4624 ) ( not ( = ?auto_4624 ?auto_4631 ) ) ( not ( = ?auto_4625 ?auto_4631 ) ) ( IS-CRATE ?auto_4625 ) ( not ( = ?auto_4624 ?auto_4630 ) ) ( not ( = ?auto_4625 ?auto_4630 ) ) ( not ( = ?auto_4631 ?auto_4630 ) ) ( not ( = ?auto_4634 ?auto_4627 ) ) ( not ( = ?auto_4635 ?auto_4634 ) ) ( HOIST-AT ?auto_4629 ?auto_4634 ) ( not ( = ?auto_4628 ?auto_4629 ) ) ( not ( = ?auto_4632 ?auto_4629 ) ) ( AVAILABLE ?auto_4629 ) ( SURFACE-AT ?auto_4625 ?auto_4634 ) ( ON ?auto_4625 ?auto_4626 ) ( CLEAR ?auto_4625 ) ( not ( = ?auto_4624 ?auto_4626 ) ) ( not ( = ?auto_4625 ?auto_4626 ) ) ( not ( = ?auto_4631 ?auto_4626 ) ) ( not ( = ?auto_4630 ?auto_4626 ) ) ( TRUCK-AT ?auto_4633 ?auto_4627 ) ( SURFACE-AT ?auto_4636 ?auto_4627 ) ( CLEAR ?auto_4636 ) ( LIFTING ?auto_4628 ?auto_4630 ) ( IS-CRATE ?auto_4630 ) ( not ( = ?auto_4624 ?auto_4636 ) ) ( not ( = ?auto_4625 ?auto_4636 ) ) ( not ( = ?auto_4631 ?auto_4636 ) ) ( not ( = ?auto_4630 ?auto_4636 ) ) ( not ( = ?auto_4626 ?auto_4636 ) ) )
    :subtasks
    ( ( !DROP ?auto_4628 ?auto_4630 ?auto_4636 ?auto_4627 )
      ( MAKE-ON ?auto_4624 ?auto_4625 )
      ( MAKE-ON-VERIFY ?auto_4624 ?auto_4625 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4637 - SURFACE
      ?auto_4638 - SURFACE
    )
    :vars
    (
      ?auto_4646 - HOIST
      ?auto_4645 - PLACE
      ?auto_4640 - PLACE
      ?auto_4641 - HOIST
      ?auto_4647 - SURFACE
      ?auto_4649 - SURFACE
      ?auto_4643 - PLACE
      ?auto_4648 - HOIST
      ?auto_4644 - SURFACE
      ?auto_4639 - TRUCK
      ?auto_4642 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4646 ?auto_4645 ) ( IS-CRATE ?auto_4637 ) ( not ( = ?auto_4637 ?auto_4638 ) ) ( not ( = ?auto_4640 ?auto_4645 ) ) ( HOIST-AT ?auto_4641 ?auto_4640 ) ( not ( = ?auto_4646 ?auto_4641 ) ) ( AVAILABLE ?auto_4641 ) ( SURFACE-AT ?auto_4637 ?auto_4640 ) ( ON ?auto_4637 ?auto_4647 ) ( CLEAR ?auto_4637 ) ( not ( = ?auto_4637 ?auto_4647 ) ) ( not ( = ?auto_4638 ?auto_4647 ) ) ( IS-CRATE ?auto_4638 ) ( not ( = ?auto_4637 ?auto_4649 ) ) ( not ( = ?auto_4638 ?auto_4649 ) ) ( not ( = ?auto_4647 ?auto_4649 ) ) ( not ( = ?auto_4643 ?auto_4645 ) ) ( not ( = ?auto_4640 ?auto_4643 ) ) ( HOIST-AT ?auto_4648 ?auto_4643 ) ( not ( = ?auto_4646 ?auto_4648 ) ) ( not ( = ?auto_4641 ?auto_4648 ) ) ( AVAILABLE ?auto_4648 ) ( SURFACE-AT ?auto_4638 ?auto_4643 ) ( ON ?auto_4638 ?auto_4644 ) ( CLEAR ?auto_4638 ) ( not ( = ?auto_4637 ?auto_4644 ) ) ( not ( = ?auto_4638 ?auto_4644 ) ) ( not ( = ?auto_4647 ?auto_4644 ) ) ( not ( = ?auto_4649 ?auto_4644 ) ) ( TRUCK-AT ?auto_4639 ?auto_4645 ) ( SURFACE-AT ?auto_4642 ?auto_4645 ) ( CLEAR ?auto_4642 ) ( IS-CRATE ?auto_4649 ) ( not ( = ?auto_4637 ?auto_4642 ) ) ( not ( = ?auto_4638 ?auto_4642 ) ) ( not ( = ?auto_4647 ?auto_4642 ) ) ( not ( = ?auto_4649 ?auto_4642 ) ) ( not ( = ?auto_4644 ?auto_4642 ) ) ( AVAILABLE ?auto_4646 ) ( IN ?auto_4649 ?auto_4639 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4646 ?auto_4649 ?auto_4639 ?auto_4645 )
      ( MAKE-ON ?auto_4637 ?auto_4638 )
      ( MAKE-ON-VERIFY ?auto_4637 ?auto_4638 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4650 - SURFACE
      ?auto_4651 - SURFACE
    )
    :vars
    (
      ?auto_4653 - HOIST
      ?auto_4655 - PLACE
      ?auto_4662 - PLACE
      ?auto_4659 - HOIST
      ?auto_4652 - SURFACE
      ?auto_4657 - SURFACE
      ?auto_4656 - PLACE
      ?auto_4654 - HOIST
      ?auto_4661 - SURFACE
      ?auto_4658 - SURFACE
      ?auto_4660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4653 ?auto_4655 ) ( IS-CRATE ?auto_4650 ) ( not ( = ?auto_4650 ?auto_4651 ) ) ( not ( = ?auto_4662 ?auto_4655 ) ) ( HOIST-AT ?auto_4659 ?auto_4662 ) ( not ( = ?auto_4653 ?auto_4659 ) ) ( AVAILABLE ?auto_4659 ) ( SURFACE-AT ?auto_4650 ?auto_4662 ) ( ON ?auto_4650 ?auto_4652 ) ( CLEAR ?auto_4650 ) ( not ( = ?auto_4650 ?auto_4652 ) ) ( not ( = ?auto_4651 ?auto_4652 ) ) ( IS-CRATE ?auto_4651 ) ( not ( = ?auto_4650 ?auto_4657 ) ) ( not ( = ?auto_4651 ?auto_4657 ) ) ( not ( = ?auto_4652 ?auto_4657 ) ) ( not ( = ?auto_4656 ?auto_4655 ) ) ( not ( = ?auto_4662 ?auto_4656 ) ) ( HOIST-AT ?auto_4654 ?auto_4656 ) ( not ( = ?auto_4653 ?auto_4654 ) ) ( not ( = ?auto_4659 ?auto_4654 ) ) ( AVAILABLE ?auto_4654 ) ( SURFACE-AT ?auto_4651 ?auto_4656 ) ( ON ?auto_4651 ?auto_4661 ) ( CLEAR ?auto_4651 ) ( not ( = ?auto_4650 ?auto_4661 ) ) ( not ( = ?auto_4651 ?auto_4661 ) ) ( not ( = ?auto_4652 ?auto_4661 ) ) ( not ( = ?auto_4657 ?auto_4661 ) ) ( SURFACE-AT ?auto_4658 ?auto_4655 ) ( CLEAR ?auto_4658 ) ( IS-CRATE ?auto_4657 ) ( not ( = ?auto_4650 ?auto_4658 ) ) ( not ( = ?auto_4651 ?auto_4658 ) ) ( not ( = ?auto_4652 ?auto_4658 ) ) ( not ( = ?auto_4657 ?auto_4658 ) ) ( not ( = ?auto_4661 ?auto_4658 ) ) ( AVAILABLE ?auto_4653 ) ( IN ?auto_4657 ?auto_4660 ) ( TRUCK-AT ?auto_4660 ?auto_4662 ) )
    :subtasks
    ( ( !DRIVE ?auto_4660 ?auto_4662 ?auto_4655 )
      ( MAKE-ON ?auto_4650 ?auto_4651 )
      ( MAKE-ON-VERIFY ?auto_4650 ?auto_4651 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4663 - SURFACE
      ?auto_4664 - SURFACE
    )
    :vars
    (
      ?auto_4668 - HOIST
      ?auto_4669 - PLACE
      ?auto_4670 - PLACE
      ?auto_4666 - HOIST
      ?auto_4665 - SURFACE
      ?auto_4671 - SURFACE
      ?auto_4672 - PLACE
      ?auto_4674 - HOIST
      ?auto_4673 - SURFACE
      ?auto_4675 - SURFACE
      ?auto_4667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4668 ?auto_4669 ) ( IS-CRATE ?auto_4663 ) ( not ( = ?auto_4663 ?auto_4664 ) ) ( not ( = ?auto_4670 ?auto_4669 ) ) ( HOIST-AT ?auto_4666 ?auto_4670 ) ( not ( = ?auto_4668 ?auto_4666 ) ) ( SURFACE-AT ?auto_4663 ?auto_4670 ) ( ON ?auto_4663 ?auto_4665 ) ( CLEAR ?auto_4663 ) ( not ( = ?auto_4663 ?auto_4665 ) ) ( not ( = ?auto_4664 ?auto_4665 ) ) ( IS-CRATE ?auto_4664 ) ( not ( = ?auto_4663 ?auto_4671 ) ) ( not ( = ?auto_4664 ?auto_4671 ) ) ( not ( = ?auto_4665 ?auto_4671 ) ) ( not ( = ?auto_4672 ?auto_4669 ) ) ( not ( = ?auto_4670 ?auto_4672 ) ) ( HOIST-AT ?auto_4674 ?auto_4672 ) ( not ( = ?auto_4668 ?auto_4674 ) ) ( not ( = ?auto_4666 ?auto_4674 ) ) ( AVAILABLE ?auto_4674 ) ( SURFACE-AT ?auto_4664 ?auto_4672 ) ( ON ?auto_4664 ?auto_4673 ) ( CLEAR ?auto_4664 ) ( not ( = ?auto_4663 ?auto_4673 ) ) ( not ( = ?auto_4664 ?auto_4673 ) ) ( not ( = ?auto_4665 ?auto_4673 ) ) ( not ( = ?auto_4671 ?auto_4673 ) ) ( SURFACE-AT ?auto_4675 ?auto_4669 ) ( CLEAR ?auto_4675 ) ( IS-CRATE ?auto_4671 ) ( not ( = ?auto_4663 ?auto_4675 ) ) ( not ( = ?auto_4664 ?auto_4675 ) ) ( not ( = ?auto_4665 ?auto_4675 ) ) ( not ( = ?auto_4671 ?auto_4675 ) ) ( not ( = ?auto_4673 ?auto_4675 ) ) ( AVAILABLE ?auto_4668 ) ( TRUCK-AT ?auto_4667 ?auto_4670 ) ( LIFTING ?auto_4666 ?auto_4671 ) )
    :subtasks
    ( ( !LOAD ?auto_4666 ?auto_4671 ?auto_4667 ?auto_4670 )
      ( MAKE-ON ?auto_4663 ?auto_4664 )
      ( MAKE-ON-VERIFY ?auto_4663 ?auto_4664 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4676 - SURFACE
      ?auto_4677 - SURFACE
    )
    :vars
    (
      ?auto_4681 - HOIST
      ?auto_4682 - PLACE
      ?auto_4687 - PLACE
      ?auto_4685 - HOIST
      ?auto_4688 - SURFACE
      ?auto_4680 - SURFACE
      ?auto_4679 - PLACE
      ?auto_4684 - HOIST
      ?auto_4678 - SURFACE
      ?auto_4683 - SURFACE
      ?auto_4686 - TRUCK
      ?auto_4689 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4681 ?auto_4682 ) ( IS-CRATE ?auto_4676 ) ( not ( = ?auto_4676 ?auto_4677 ) ) ( not ( = ?auto_4687 ?auto_4682 ) ) ( HOIST-AT ?auto_4685 ?auto_4687 ) ( not ( = ?auto_4681 ?auto_4685 ) ) ( SURFACE-AT ?auto_4676 ?auto_4687 ) ( ON ?auto_4676 ?auto_4688 ) ( CLEAR ?auto_4676 ) ( not ( = ?auto_4676 ?auto_4688 ) ) ( not ( = ?auto_4677 ?auto_4688 ) ) ( IS-CRATE ?auto_4677 ) ( not ( = ?auto_4676 ?auto_4680 ) ) ( not ( = ?auto_4677 ?auto_4680 ) ) ( not ( = ?auto_4688 ?auto_4680 ) ) ( not ( = ?auto_4679 ?auto_4682 ) ) ( not ( = ?auto_4687 ?auto_4679 ) ) ( HOIST-AT ?auto_4684 ?auto_4679 ) ( not ( = ?auto_4681 ?auto_4684 ) ) ( not ( = ?auto_4685 ?auto_4684 ) ) ( AVAILABLE ?auto_4684 ) ( SURFACE-AT ?auto_4677 ?auto_4679 ) ( ON ?auto_4677 ?auto_4678 ) ( CLEAR ?auto_4677 ) ( not ( = ?auto_4676 ?auto_4678 ) ) ( not ( = ?auto_4677 ?auto_4678 ) ) ( not ( = ?auto_4688 ?auto_4678 ) ) ( not ( = ?auto_4680 ?auto_4678 ) ) ( SURFACE-AT ?auto_4683 ?auto_4682 ) ( CLEAR ?auto_4683 ) ( IS-CRATE ?auto_4680 ) ( not ( = ?auto_4676 ?auto_4683 ) ) ( not ( = ?auto_4677 ?auto_4683 ) ) ( not ( = ?auto_4688 ?auto_4683 ) ) ( not ( = ?auto_4680 ?auto_4683 ) ) ( not ( = ?auto_4678 ?auto_4683 ) ) ( AVAILABLE ?auto_4681 ) ( TRUCK-AT ?auto_4686 ?auto_4687 ) ( AVAILABLE ?auto_4685 ) ( SURFACE-AT ?auto_4680 ?auto_4687 ) ( ON ?auto_4680 ?auto_4689 ) ( CLEAR ?auto_4680 ) ( not ( = ?auto_4676 ?auto_4689 ) ) ( not ( = ?auto_4677 ?auto_4689 ) ) ( not ( = ?auto_4688 ?auto_4689 ) ) ( not ( = ?auto_4680 ?auto_4689 ) ) ( not ( = ?auto_4678 ?auto_4689 ) ) ( not ( = ?auto_4683 ?auto_4689 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4685 ?auto_4680 ?auto_4689 ?auto_4687 )
      ( MAKE-ON ?auto_4676 ?auto_4677 )
      ( MAKE-ON-VERIFY ?auto_4676 ?auto_4677 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4690 - SURFACE
      ?auto_4691 - SURFACE
    )
    :vars
    (
      ?auto_4695 - HOIST
      ?auto_4696 - PLACE
      ?auto_4693 - PLACE
      ?auto_4701 - HOIST
      ?auto_4698 - SURFACE
      ?auto_4703 - SURFACE
      ?auto_4700 - PLACE
      ?auto_4702 - HOIST
      ?auto_4699 - SURFACE
      ?auto_4694 - SURFACE
      ?auto_4692 - SURFACE
      ?auto_4697 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4695 ?auto_4696 ) ( IS-CRATE ?auto_4690 ) ( not ( = ?auto_4690 ?auto_4691 ) ) ( not ( = ?auto_4693 ?auto_4696 ) ) ( HOIST-AT ?auto_4701 ?auto_4693 ) ( not ( = ?auto_4695 ?auto_4701 ) ) ( SURFACE-AT ?auto_4690 ?auto_4693 ) ( ON ?auto_4690 ?auto_4698 ) ( CLEAR ?auto_4690 ) ( not ( = ?auto_4690 ?auto_4698 ) ) ( not ( = ?auto_4691 ?auto_4698 ) ) ( IS-CRATE ?auto_4691 ) ( not ( = ?auto_4690 ?auto_4703 ) ) ( not ( = ?auto_4691 ?auto_4703 ) ) ( not ( = ?auto_4698 ?auto_4703 ) ) ( not ( = ?auto_4700 ?auto_4696 ) ) ( not ( = ?auto_4693 ?auto_4700 ) ) ( HOIST-AT ?auto_4702 ?auto_4700 ) ( not ( = ?auto_4695 ?auto_4702 ) ) ( not ( = ?auto_4701 ?auto_4702 ) ) ( AVAILABLE ?auto_4702 ) ( SURFACE-AT ?auto_4691 ?auto_4700 ) ( ON ?auto_4691 ?auto_4699 ) ( CLEAR ?auto_4691 ) ( not ( = ?auto_4690 ?auto_4699 ) ) ( not ( = ?auto_4691 ?auto_4699 ) ) ( not ( = ?auto_4698 ?auto_4699 ) ) ( not ( = ?auto_4703 ?auto_4699 ) ) ( SURFACE-AT ?auto_4694 ?auto_4696 ) ( CLEAR ?auto_4694 ) ( IS-CRATE ?auto_4703 ) ( not ( = ?auto_4690 ?auto_4694 ) ) ( not ( = ?auto_4691 ?auto_4694 ) ) ( not ( = ?auto_4698 ?auto_4694 ) ) ( not ( = ?auto_4703 ?auto_4694 ) ) ( not ( = ?auto_4699 ?auto_4694 ) ) ( AVAILABLE ?auto_4695 ) ( AVAILABLE ?auto_4701 ) ( SURFACE-AT ?auto_4703 ?auto_4693 ) ( ON ?auto_4703 ?auto_4692 ) ( CLEAR ?auto_4703 ) ( not ( = ?auto_4690 ?auto_4692 ) ) ( not ( = ?auto_4691 ?auto_4692 ) ) ( not ( = ?auto_4698 ?auto_4692 ) ) ( not ( = ?auto_4703 ?auto_4692 ) ) ( not ( = ?auto_4699 ?auto_4692 ) ) ( not ( = ?auto_4694 ?auto_4692 ) ) ( TRUCK-AT ?auto_4697 ?auto_4696 ) )
    :subtasks
    ( ( !DRIVE ?auto_4697 ?auto_4696 ?auto_4693 )
      ( MAKE-ON ?auto_4690 ?auto_4691 )
      ( MAKE-ON-VERIFY ?auto_4690 ?auto_4691 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4704 - SURFACE
      ?auto_4705 - SURFACE
    )
    :vars
    (
      ?auto_4714 - HOIST
      ?auto_4710 - PLACE
      ?auto_4713 - PLACE
      ?auto_4709 - HOIST
      ?auto_4707 - SURFACE
      ?auto_4706 - SURFACE
      ?auto_4716 - PLACE
      ?auto_4708 - HOIST
      ?auto_4711 - SURFACE
      ?auto_4712 - SURFACE
      ?auto_4715 - SURFACE
      ?auto_4717 - TRUCK
      ?auto_4718 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4714 ?auto_4710 ) ( IS-CRATE ?auto_4704 ) ( not ( = ?auto_4704 ?auto_4705 ) ) ( not ( = ?auto_4713 ?auto_4710 ) ) ( HOIST-AT ?auto_4709 ?auto_4713 ) ( not ( = ?auto_4714 ?auto_4709 ) ) ( SURFACE-AT ?auto_4704 ?auto_4713 ) ( ON ?auto_4704 ?auto_4707 ) ( CLEAR ?auto_4704 ) ( not ( = ?auto_4704 ?auto_4707 ) ) ( not ( = ?auto_4705 ?auto_4707 ) ) ( IS-CRATE ?auto_4705 ) ( not ( = ?auto_4704 ?auto_4706 ) ) ( not ( = ?auto_4705 ?auto_4706 ) ) ( not ( = ?auto_4707 ?auto_4706 ) ) ( not ( = ?auto_4716 ?auto_4710 ) ) ( not ( = ?auto_4713 ?auto_4716 ) ) ( HOIST-AT ?auto_4708 ?auto_4716 ) ( not ( = ?auto_4714 ?auto_4708 ) ) ( not ( = ?auto_4709 ?auto_4708 ) ) ( AVAILABLE ?auto_4708 ) ( SURFACE-AT ?auto_4705 ?auto_4716 ) ( ON ?auto_4705 ?auto_4711 ) ( CLEAR ?auto_4705 ) ( not ( = ?auto_4704 ?auto_4711 ) ) ( not ( = ?auto_4705 ?auto_4711 ) ) ( not ( = ?auto_4707 ?auto_4711 ) ) ( not ( = ?auto_4706 ?auto_4711 ) ) ( IS-CRATE ?auto_4706 ) ( not ( = ?auto_4704 ?auto_4712 ) ) ( not ( = ?auto_4705 ?auto_4712 ) ) ( not ( = ?auto_4707 ?auto_4712 ) ) ( not ( = ?auto_4706 ?auto_4712 ) ) ( not ( = ?auto_4711 ?auto_4712 ) ) ( AVAILABLE ?auto_4709 ) ( SURFACE-AT ?auto_4706 ?auto_4713 ) ( ON ?auto_4706 ?auto_4715 ) ( CLEAR ?auto_4706 ) ( not ( = ?auto_4704 ?auto_4715 ) ) ( not ( = ?auto_4705 ?auto_4715 ) ) ( not ( = ?auto_4707 ?auto_4715 ) ) ( not ( = ?auto_4706 ?auto_4715 ) ) ( not ( = ?auto_4711 ?auto_4715 ) ) ( not ( = ?auto_4712 ?auto_4715 ) ) ( TRUCK-AT ?auto_4717 ?auto_4710 ) ( SURFACE-AT ?auto_4718 ?auto_4710 ) ( CLEAR ?auto_4718 ) ( LIFTING ?auto_4714 ?auto_4712 ) ( IS-CRATE ?auto_4712 ) ( not ( = ?auto_4704 ?auto_4718 ) ) ( not ( = ?auto_4705 ?auto_4718 ) ) ( not ( = ?auto_4707 ?auto_4718 ) ) ( not ( = ?auto_4706 ?auto_4718 ) ) ( not ( = ?auto_4711 ?auto_4718 ) ) ( not ( = ?auto_4712 ?auto_4718 ) ) ( not ( = ?auto_4715 ?auto_4718 ) ) )
    :subtasks
    ( ( !DROP ?auto_4714 ?auto_4712 ?auto_4718 ?auto_4710 )
      ( MAKE-ON ?auto_4704 ?auto_4705 )
      ( MAKE-ON-VERIFY ?auto_4704 ?auto_4705 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4719 - SURFACE
      ?auto_4720 - SURFACE
    )
    :vars
    (
      ?auto_4728 - HOIST
      ?auto_4733 - PLACE
      ?auto_4729 - PLACE
      ?auto_4731 - HOIST
      ?auto_4730 - SURFACE
      ?auto_4722 - SURFACE
      ?auto_4727 - PLACE
      ?auto_4721 - HOIST
      ?auto_4732 - SURFACE
      ?auto_4726 - SURFACE
      ?auto_4725 - SURFACE
      ?auto_4723 - TRUCK
      ?auto_4724 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4728 ?auto_4733 ) ( IS-CRATE ?auto_4719 ) ( not ( = ?auto_4719 ?auto_4720 ) ) ( not ( = ?auto_4729 ?auto_4733 ) ) ( HOIST-AT ?auto_4731 ?auto_4729 ) ( not ( = ?auto_4728 ?auto_4731 ) ) ( SURFACE-AT ?auto_4719 ?auto_4729 ) ( ON ?auto_4719 ?auto_4730 ) ( CLEAR ?auto_4719 ) ( not ( = ?auto_4719 ?auto_4730 ) ) ( not ( = ?auto_4720 ?auto_4730 ) ) ( IS-CRATE ?auto_4720 ) ( not ( = ?auto_4719 ?auto_4722 ) ) ( not ( = ?auto_4720 ?auto_4722 ) ) ( not ( = ?auto_4730 ?auto_4722 ) ) ( not ( = ?auto_4727 ?auto_4733 ) ) ( not ( = ?auto_4729 ?auto_4727 ) ) ( HOIST-AT ?auto_4721 ?auto_4727 ) ( not ( = ?auto_4728 ?auto_4721 ) ) ( not ( = ?auto_4731 ?auto_4721 ) ) ( AVAILABLE ?auto_4721 ) ( SURFACE-AT ?auto_4720 ?auto_4727 ) ( ON ?auto_4720 ?auto_4732 ) ( CLEAR ?auto_4720 ) ( not ( = ?auto_4719 ?auto_4732 ) ) ( not ( = ?auto_4720 ?auto_4732 ) ) ( not ( = ?auto_4730 ?auto_4732 ) ) ( not ( = ?auto_4722 ?auto_4732 ) ) ( IS-CRATE ?auto_4722 ) ( not ( = ?auto_4719 ?auto_4726 ) ) ( not ( = ?auto_4720 ?auto_4726 ) ) ( not ( = ?auto_4730 ?auto_4726 ) ) ( not ( = ?auto_4722 ?auto_4726 ) ) ( not ( = ?auto_4732 ?auto_4726 ) ) ( AVAILABLE ?auto_4731 ) ( SURFACE-AT ?auto_4722 ?auto_4729 ) ( ON ?auto_4722 ?auto_4725 ) ( CLEAR ?auto_4722 ) ( not ( = ?auto_4719 ?auto_4725 ) ) ( not ( = ?auto_4720 ?auto_4725 ) ) ( not ( = ?auto_4730 ?auto_4725 ) ) ( not ( = ?auto_4722 ?auto_4725 ) ) ( not ( = ?auto_4732 ?auto_4725 ) ) ( not ( = ?auto_4726 ?auto_4725 ) ) ( TRUCK-AT ?auto_4723 ?auto_4733 ) ( SURFACE-AT ?auto_4724 ?auto_4733 ) ( CLEAR ?auto_4724 ) ( IS-CRATE ?auto_4726 ) ( not ( = ?auto_4719 ?auto_4724 ) ) ( not ( = ?auto_4720 ?auto_4724 ) ) ( not ( = ?auto_4730 ?auto_4724 ) ) ( not ( = ?auto_4722 ?auto_4724 ) ) ( not ( = ?auto_4732 ?auto_4724 ) ) ( not ( = ?auto_4726 ?auto_4724 ) ) ( not ( = ?auto_4725 ?auto_4724 ) ) ( AVAILABLE ?auto_4728 ) ( IN ?auto_4726 ?auto_4723 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4728 ?auto_4726 ?auto_4723 ?auto_4733 )
      ( MAKE-ON ?auto_4719 ?auto_4720 )
      ( MAKE-ON-VERIFY ?auto_4719 ?auto_4720 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4734 - SURFACE
      ?auto_4735 - SURFACE
    )
    :vars
    (
      ?auto_4746 - HOIST
      ?auto_4747 - PLACE
      ?auto_4743 - PLACE
      ?auto_4745 - HOIST
      ?auto_4740 - SURFACE
      ?auto_4748 - SURFACE
      ?auto_4742 - PLACE
      ?auto_4741 - HOIST
      ?auto_4739 - SURFACE
      ?auto_4736 - SURFACE
      ?auto_4744 - SURFACE
      ?auto_4738 - SURFACE
      ?auto_4737 - TRUCK
      ?auto_4749 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4746 ?auto_4747 ) ( IS-CRATE ?auto_4734 ) ( not ( = ?auto_4734 ?auto_4735 ) ) ( not ( = ?auto_4743 ?auto_4747 ) ) ( HOIST-AT ?auto_4745 ?auto_4743 ) ( not ( = ?auto_4746 ?auto_4745 ) ) ( SURFACE-AT ?auto_4734 ?auto_4743 ) ( ON ?auto_4734 ?auto_4740 ) ( CLEAR ?auto_4734 ) ( not ( = ?auto_4734 ?auto_4740 ) ) ( not ( = ?auto_4735 ?auto_4740 ) ) ( IS-CRATE ?auto_4735 ) ( not ( = ?auto_4734 ?auto_4748 ) ) ( not ( = ?auto_4735 ?auto_4748 ) ) ( not ( = ?auto_4740 ?auto_4748 ) ) ( not ( = ?auto_4742 ?auto_4747 ) ) ( not ( = ?auto_4743 ?auto_4742 ) ) ( HOIST-AT ?auto_4741 ?auto_4742 ) ( not ( = ?auto_4746 ?auto_4741 ) ) ( not ( = ?auto_4745 ?auto_4741 ) ) ( AVAILABLE ?auto_4741 ) ( SURFACE-AT ?auto_4735 ?auto_4742 ) ( ON ?auto_4735 ?auto_4739 ) ( CLEAR ?auto_4735 ) ( not ( = ?auto_4734 ?auto_4739 ) ) ( not ( = ?auto_4735 ?auto_4739 ) ) ( not ( = ?auto_4740 ?auto_4739 ) ) ( not ( = ?auto_4748 ?auto_4739 ) ) ( IS-CRATE ?auto_4748 ) ( not ( = ?auto_4734 ?auto_4736 ) ) ( not ( = ?auto_4735 ?auto_4736 ) ) ( not ( = ?auto_4740 ?auto_4736 ) ) ( not ( = ?auto_4748 ?auto_4736 ) ) ( not ( = ?auto_4739 ?auto_4736 ) ) ( AVAILABLE ?auto_4745 ) ( SURFACE-AT ?auto_4748 ?auto_4743 ) ( ON ?auto_4748 ?auto_4744 ) ( CLEAR ?auto_4748 ) ( not ( = ?auto_4734 ?auto_4744 ) ) ( not ( = ?auto_4735 ?auto_4744 ) ) ( not ( = ?auto_4740 ?auto_4744 ) ) ( not ( = ?auto_4748 ?auto_4744 ) ) ( not ( = ?auto_4739 ?auto_4744 ) ) ( not ( = ?auto_4736 ?auto_4744 ) ) ( SURFACE-AT ?auto_4738 ?auto_4747 ) ( CLEAR ?auto_4738 ) ( IS-CRATE ?auto_4736 ) ( not ( = ?auto_4734 ?auto_4738 ) ) ( not ( = ?auto_4735 ?auto_4738 ) ) ( not ( = ?auto_4740 ?auto_4738 ) ) ( not ( = ?auto_4748 ?auto_4738 ) ) ( not ( = ?auto_4739 ?auto_4738 ) ) ( not ( = ?auto_4736 ?auto_4738 ) ) ( not ( = ?auto_4744 ?auto_4738 ) ) ( AVAILABLE ?auto_4746 ) ( IN ?auto_4736 ?auto_4737 ) ( TRUCK-AT ?auto_4737 ?auto_4749 ) ( not ( = ?auto_4749 ?auto_4747 ) ) ( not ( = ?auto_4743 ?auto_4749 ) ) ( not ( = ?auto_4742 ?auto_4749 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4737 ?auto_4749 ?auto_4747 )
      ( MAKE-ON ?auto_4734 ?auto_4735 )
      ( MAKE-ON-VERIFY ?auto_4734 ?auto_4735 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4750 - SURFACE
      ?auto_4751 - SURFACE
    )
    :vars
    (
      ?auto_4761 - HOIST
      ?auto_4755 - PLACE
      ?auto_4758 - PLACE
      ?auto_4756 - HOIST
      ?auto_4753 - SURFACE
      ?auto_4757 - SURFACE
      ?auto_4754 - PLACE
      ?auto_4759 - HOIST
      ?auto_4762 - SURFACE
      ?auto_4764 - SURFACE
      ?auto_4763 - SURFACE
      ?auto_4760 - SURFACE
      ?auto_4752 - TRUCK
      ?auto_4765 - PLACE
      ?auto_4766 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4761 ?auto_4755 ) ( IS-CRATE ?auto_4750 ) ( not ( = ?auto_4750 ?auto_4751 ) ) ( not ( = ?auto_4758 ?auto_4755 ) ) ( HOIST-AT ?auto_4756 ?auto_4758 ) ( not ( = ?auto_4761 ?auto_4756 ) ) ( SURFACE-AT ?auto_4750 ?auto_4758 ) ( ON ?auto_4750 ?auto_4753 ) ( CLEAR ?auto_4750 ) ( not ( = ?auto_4750 ?auto_4753 ) ) ( not ( = ?auto_4751 ?auto_4753 ) ) ( IS-CRATE ?auto_4751 ) ( not ( = ?auto_4750 ?auto_4757 ) ) ( not ( = ?auto_4751 ?auto_4757 ) ) ( not ( = ?auto_4753 ?auto_4757 ) ) ( not ( = ?auto_4754 ?auto_4755 ) ) ( not ( = ?auto_4758 ?auto_4754 ) ) ( HOIST-AT ?auto_4759 ?auto_4754 ) ( not ( = ?auto_4761 ?auto_4759 ) ) ( not ( = ?auto_4756 ?auto_4759 ) ) ( AVAILABLE ?auto_4759 ) ( SURFACE-AT ?auto_4751 ?auto_4754 ) ( ON ?auto_4751 ?auto_4762 ) ( CLEAR ?auto_4751 ) ( not ( = ?auto_4750 ?auto_4762 ) ) ( not ( = ?auto_4751 ?auto_4762 ) ) ( not ( = ?auto_4753 ?auto_4762 ) ) ( not ( = ?auto_4757 ?auto_4762 ) ) ( IS-CRATE ?auto_4757 ) ( not ( = ?auto_4750 ?auto_4764 ) ) ( not ( = ?auto_4751 ?auto_4764 ) ) ( not ( = ?auto_4753 ?auto_4764 ) ) ( not ( = ?auto_4757 ?auto_4764 ) ) ( not ( = ?auto_4762 ?auto_4764 ) ) ( AVAILABLE ?auto_4756 ) ( SURFACE-AT ?auto_4757 ?auto_4758 ) ( ON ?auto_4757 ?auto_4763 ) ( CLEAR ?auto_4757 ) ( not ( = ?auto_4750 ?auto_4763 ) ) ( not ( = ?auto_4751 ?auto_4763 ) ) ( not ( = ?auto_4753 ?auto_4763 ) ) ( not ( = ?auto_4757 ?auto_4763 ) ) ( not ( = ?auto_4762 ?auto_4763 ) ) ( not ( = ?auto_4764 ?auto_4763 ) ) ( SURFACE-AT ?auto_4760 ?auto_4755 ) ( CLEAR ?auto_4760 ) ( IS-CRATE ?auto_4764 ) ( not ( = ?auto_4750 ?auto_4760 ) ) ( not ( = ?auto_4751 ?auto_4760 ) ) ( not ( = ?auto_4753 ?auto_4760 ) ) ( not ( = ?auto_4757 ?auto_4760 ) ) ( not ( = ?auto_4762 ?auto_4760 ) ) ( not ( = ?auto_4764 ?auto_4760 ) ) ( not ( = ?auto_4763 ?auto_4760 ) ) ( AVAILABLE ?auto_4761 ) ( TRUCK-AT ?auto_4752 ?auto_4765 ) ( not ( = ?auto_4765 ?auto_4755 ) ) ( not ( = ?auto_4758 ?auto_4765 ) ) ( not ( = ?auto_4754 ?auto_4765 ) ) ( HOIST-AT ?auto_4766 ?auto_4765 ) ( LIFTING ?auto_4766 ?auto_4764 ) ( not ( = ?auto_4761 ?auto_4766 ) ) ( not ( = ?auto_4756 ?auto_4766 ) ) ( not ( = ?auto_4759 ?auto_4766 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4766 ?auto_4764 ?auto_4752 ?auto_4765 )
      ( MAKE-ON ?auto_4750 ?auto_4751 )
      ( MAKE-ON-VERIFY ?auto_4750 ?auto_4751 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4767 - SURFACE
      ?auto_4768 - SURFACE
    )
    :vars
    (
      ?auto_4775 - HOIST
      ?auto_4769 - PLACE
      ?auto_4771 - PLACE
      ?auto_4774 - HOIST
      ?auto_4777 - SURFACE
      ?auto_4770 - SURFACE
      ?auto_4781 - PLACE
      ?auto_4782 - HOIST
      ?auto_4780 - SURFACE
      ?auto_4778 - SURFACE
      ?auto_4776 - SURFACE
      ?auto_4773 - SURFACE
      ?auto_4779 - TRUCK
      ?auto_4772 - PLACE
      ?auto_4783 - HOIST
      ?auto_4784 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4775 ?auto_4769 ) ( IS-CRATE ?auto_4767 ) ( not ( = ?auto_4767 ?auto_4768 ) ) ( not ( = ?auto_4771 ?auto_4769 ) ) ( HOIST-AT ?auto_4774 ?auto_4771 ) ( not ( = ?auto_4775 ?auto_4774 ) ) ( SURFACE-AT ?auto_4767 ?auto_4771 ) ( ON ?auto_4767 ?auto_4777 ) ( CLEAR ?auto_4767 ) ( not ( = ?auto_4767 ?auto_4777 ) ) ( not ( = ?auto_4768 ?auto_4777 ) ) ( IS-CRATE ?auto_4768 ) ( not ( = ?auto_4767 ?auto_4770 ) ) ( not ( = ?auto_4768 ?auto_4770 ) ) ( not ( = ?auto_4777 ?auto_4770 ) ) ( not ( = ?auto_4781 ?auto_4769 ) ) ( not ( = ?auto_4771 ?auto_4781 ) ) ( HOIST-AT ?auto_4782 ?auto_4781 ) ( not ( = ?auto_4775 ?auto_4782 ) ) ( not ( = ?auto_4774 ?auto_4782 ) ) ( AVAILABLE ?auto_4782 ) ( SURFACE-AT ?auto_4768 ?auto_4781 ) ( ON ?auto_4768 ?auto_4780 ) ( CLEAR ?auto_4768 ) ( not ( = ?auto_4767 ?auto_4780 ) ) ( not ( = ?auto_4768 ?auto_4780 ) ) ( not ( = ?auto_4777 ?auto_4780 ) ) ( not ( = ?auto_4770 ?auto_4780 ) ) ( IS-CRATE ?auto_4770 ) ( not ( = ?auto_4767 ?auto_4778 ) ) ( not ( = ?auto_4768 ?auto_4778 ) ) ( not ( = ?auto_4777 ?auto_4778 ) ) ( not ( = ?auto_4770 ?auto_4778 ) ) ( not ( = ?auto_4780 ?auto_4778 ) ) ( AVAILABLE ?auto_4774 ) ( SURFACE-AT ?auto_4770 ?auto_4771 ) ( ON ?auto_4770 ?auto_4776 ) ( CLEAR ?auto_4770 ) ( not ( = ?auto_4767 ?auto_4776 ) ) ( not ( = ?auto_4768 ?auto_4776 ) ) ( not ( = ?auto_4777 ?auto_4776 ) ) ( not ( = ?auto_4770 ?auto_4776 ) ) ( not ( = ?auto_4780 ?auto_4776 ) ) ( not ( = ?auto_4778 ?auto_4776 ) ) ( SURFACE-AT ?auto_4773 ?auto_4769 ) ( CLEAR ?auto_4773 ) ( IS-CRATE ?auto_4778 ) ( not ( = ?auto_4767 ?auto_4773 ) ) ( not ( = ?auto_4768 ?auto_4773 ) ) ( not ( = ?auto_4777 ?auto_4773 ) ) ( not ( = ?auto_4770 ?auto_4773 ) ) ( not ( = ?auto_4780 ?auto_4773 ) ) ( not ( = ?auto_4778 ?auto_4773 ) ) ( not ( = ?auto_4776 ?auto_4773 ) ) ( AVAILABLE ?auto_4775 ) ( TRUCK-AT ?auto_4779 ?auto_4772 ) ( not ( = ?auto_4772 ?auto_4769 ) ) ( not ( = ?auto_4771 ?auto_4772 ) ) ( not ( = ?auto_4781 ?auto_4772 ) ) ( HOIST-AT ?auto_4783 ?auto_4772 ) ( not ( = ?auto_4775 ?auto_4783 ) ) ( not ( = ?auto_4774 ?auto_4783 ) ) ( not ( = ?auto_4782 ?auto_4783 ) ) ( AVAILABLE ?auto_4783 ) ( SURFACE-AT ?auto_4778 ?auto_4772 ) ( ON ?auto_4778 ?auto_4784 ) ( CLEAR ?auto_4778 ) ( not ( = ?auto_4767 ?auto_4784 ) ) ( not ( = ?auto_4768 ?auto_4784 ) ) ( not ( = ?auto_4777 ?auto_4784 ) ) ( not ( = ?auto_4770 ?auto_4784 ) ) ( not ( = ?auto_4780 ?auto_4784 ) ) ( not ( = ?auto_4778 ?auto_4784 ) ) ( not ( = ?auto_4776 ?auto_4784 ) ) ( not ( = ?auto_4773 ?auto_4784 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4783 ?auto_4778 ?auto_4784 ?auto_4772 )
      ( MAKE-ON ?auto_4767 ?auto_4768 )
      ( MAKE-ON-VERIFY ?auto_4767 ?auto_4768 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4785 - SURFACE
      ?auto_4786 - SURFACE
    )
    :vars
    (
      ?auto_4801 - HOIST
      ?auto_4790 - PLACE
      ?auto_4795 - PLACE
      ?auto_4791 - HOIST
      ?auto_4798 - SURFACE
      ?auto_4792 - SURFACE
      ?auto_4794 - PLACE
      ?auto_4787 - HOIST
      ?auto_4793 - SURFACE
      ?auto_4797 - SURFACE
      ?auto_4789 - SURFACE
      ?auto_4799 - SURFACE
      ?auto_4788 - PLACE
      ?auto_4800 - HOIST
      ?auto_4802 - SURFACE
      ?auto_4796 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4801 ?auto_4790 ) ( IS-CRATE ?auto_4785 ) ( not ( = ?auto_4785 ?auto_4786 ) ) ( not ( = ?auto_4795 ?auto_4790 ) ) ( HOIST-AT ?auto_4791 ?auto_4795 ) ( not ( = ?auto_4801 ?auto_4791 ) ) ( SURFACE-AT ?auto_4785 ?auto_4795 ) ( ON ?auto_4785 ?auto_4798 ) ( CLEAR ?auto_4785 ) ( not ( = ?auto_4785 ?auto_4798 ) ) ( not ( = ?auto_4786 ?auto_4798 ) ) ( IS-CRATE ?auto_4786 ) ( not ( = ?auto_4785 ?auto_4792 ) ) ( not ( = ?auto_4786 ?auto_4792 ) ) ( not ( = ?auto_4798 ?auto_4792 ) ) ( not ( = ?auto_4794 ?auto_4790 ) ) ( not ( = ?auto_4795 ?auto_4794 ) ) ( HOIST-AT ?auto_4787 ?auto_4794 ) ( not ( = ?auto_4801 ?auto_4787 ) ) ( not ( = ?auto_4791 ?auto_4787 ) ) ( AVAILABLE ?auto_4787 ) ( SURFACE-AT ?auto_4786 ?auto_4794 ) ( ON ?auto_4786 ?auto_4793 ) ( CLEAR ?auto_4786 ) ( not ( = ?auto_4785 ?auto_4793 ) ) ( not ( = ?auto_4786 ?auto_4793 ) ) ( not ( = ?auto_4798 ?auto_4793 ) ) ( not ( = ?auto_4792 ?auto_4793 ) ) ( IS-CRATE ?auto_4792 ) ( not ( = ?auto_4785 ?auto_4797 ) ) ( not ( = ?auto_4786 ?auto_4797 ) ) ( not ( = ?auto_4798 ?auto_4797 ) ) ( not ( = ?auto_4792 ?auto_4797 ) ) ( not ( = ?auto_4793 ?auto_4797 ) ) ( AVAILABLE ?auto_4791 ) ( SURFACE-AT ?auto_4792 ?auto_4795 ) ( ON ?auto_4792 ?auto_4789 ) ( CLEAR ?auto_4792 ) ( not ( = ?auto_4785 ?auto_4789 ) ) ( not ( = ?auto_4786 ?auto_4789 ) ) ( not ( = ?auto_4798 ?auto_4789 ) ) ( not ( = ?auto_4792 ?auto_4789 ) ) ( not ( = ?auto_4793 ?auto_4789 ) ) ( not ( = ?auto_4797 ?auto_4789 ) ) ( SURFACE-AT ?auto_4799 ?auto_4790 ) ( CLEAR ?auto_4799 ) ( IS-CRATE ?auto_4797 ) ( not ( = ?auto_4785 ?auto_4799 ) ) ( not ( = ?auto_4786 ?auto_4799 ) ) ( not ( = ?auto_4798 ?auto_4799 ) ) ( not ( = ?auto_4792 ?auto_4799 ) ) ( not ( = ?auto_4793 ?auto_4799 ) ) ( not ( = ?auto_4797 ?auto_4799 ) ) ( not ( = ?auto_4789 ?auto_4799 ) ) ( AVAILABLE ?auto_4801 ) ( not ( = ?auto_4788 ?auto_4790 ) ) ( not ( = ?auto_4795 ?auto_4788 ) ) ( not ( = ?auto_4794 ?auto_4788 ) ) ( HOIST-AT ?auto_4800 ?auto_4788 ) ( not ( = ?auto_4801 ?auto_4800 ) ) ( not ( = ?auto_4791 ?auto_4800 ) ) ( not ( = ?auto_4787 ?auto_4800 ) ) ( AVAILABLE ?auto_4800 ) ( SURFACE-AT ?auto_4797 ?auto_4788 ) ( ON ?auto_4797 ?auto_4802 ) ( CLEAR ?auto_4797 ) ( not ( = ?auto_4785 ?auto_4802 ) ) ( not ( = ?auto_4786 ?auto_4802 ) ) ( not ( = ?auto_4798 ?auto_4802 ) ) ( not ( = ?auto_4792 ?auto_4802 ) ) ( not ( = ?auto_4793 ?auto_4802 ) ) ( not ( = ?auto_4797 ?auto_4802 ) ) ( not ( = ?auto_4789 ?auto_4802 ) ) ( not ( = ?auto_4799 ?auto_4802 ) ) ( TRUCK-AT ?auto_4796 ?auto_4790 ) )
    :subtasks
    ( ( !DRIVE ?auto_4796 ?auto_4790 ?auto_4788 )
      ( MAKE-ON ?auto_4785 ?auto_4786 )
      ( MAKE-ON-VERIFY ?auto_4785 ?auto_4786 ) )
  )

)

