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

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4164 - SURFACE
      ?auto_4165 - SURFACE
    )
    :vars
    (
      ?auto_4166 - HOIST
      ?auto_4167 - PLACE
      ?auto_4169 - PLACE
      ?auto_4170 - HOIST
      ?auto_4171 - SURFACE
      ?auto_4168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4166 ?auto_4167 ) ( SURFACE-AT ?auto_4164 ?auto_4167 ) ( CLEAR ?auto_4164 ) ( IS-CRATE ?auto_4165 ) ( AVAILABLE ?auto_4166 ) ( not ( = ?auto_4169 ?auto_4167 ) ) ( HOIST-AT ?auto_4170 ?auto_4169 ) ( AVAILABLE ?auto_4170 ) ( SURFACE-AT ?auto_4165 ?auto_4169 ) ( ON ?auto_4165 ?auto_4171 ) ( CLEAR ?auto_4165 ) ( TRUCK-AT ?auto_4168 ?auto_4167 ) ( not ( = ?auto_4164 ?auto_4165 ) ) ( not ( = ?auto_4164 ?auto_4171 ) ) ( not ( = ?auto_4165 ?auto_4171 ) ) ( not ( = ?auto_4166 ?auto_4170 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4168 ?auto_4167 ?auto_4169 )
      ( !LIFT ?auto_4170 ?auto_4165 ?auto_4171 ?auto_4169 )
      ( !LOAD ?auto_4170 ?auto_4165 ?auto_4168 ?auto_4169 )
      ( !DRIVE ?auto_4168 ?auto_4169 ?auto_4167 )
      ( !UNLOAD ?auto_4166 ?auto_4165 ?auto_4168 ?auto_4167 )
      ( !DROP ?auto_4166 ?auto_4165 ?auto_4164 ?auto_4167 )
      ( MAKE-1CRATE-VERIFY ?auto_4164 ?auto_4165 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4185 - SURFACE
      ?auto_4186 - SURFACE
      ?auto_4187 - SURFACE
    )
    :vars
    (
      ?auto_4189 - HOIST
      ?auto_4193 - PLACE
      ?auto_4191 - PLACE
      ?auto_4188 - HOIST
      ?auto_4190 - SURFACE
      ?auto_4196 - PLACE
      ?auto_4194 - HOIST
      ?auto_4195 - SURFACE
      ?auto_4192 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4189 ?auto_4193 ) ( IS-CRATE ?auto_4187 ) ( not ( = ?auto_4191 ?auto_4193 ) ) ( HOIST-AT ?auto_4188 ?auto_4191 ) ( AVAILABLE ?auto_4188 ) ( SURFACE-AT ?auto_4187 ?auto_4191 ) ( ON ?auto_4187 ?auto_4190 ) ( CLEAR ?auto_4187 ) ( not ( = ?auto_4186 ?auto_4187 ) ) ( not ( = ?auto_4186 ?auto_4190 ) ) ( not ( = ?auto_4187 ?auto_4190 ) ) ( not ( = ?auto_4189 ?auto_4188 ) ) ( SURFACE-AT ?auto_4185 ?auto_4193 ) ( CLEAR ?auto_4185 ) ( IS-CRATE ?auto_4186 ) ( AVAILABLE ?auto_4189 ) ( not ( = ?auto_4196 ?auto_4193 ) ) ( HOIST-AT ?auto_4194 ?auto_4196 ) ( AVAILABLE ?auto_4194 ) ( SURFACE-AT ?auto_4186 ?auto_4196 ) ( ON ?auto_4186 ?auto_4195 ) ( CLEAR ?auto_4186 ) ( TRUCK-AT ?auto_4192 ?auto_4193 ) ( not ( = ?auto_4185 ?auto_4186 ) ) ( not ( = ?auto_4185 ?auto_4195 ) ) ( not ( = ?auto_4186 ?auto_4195 ) ) ( not ( = ?auto_4189 ?auto_4194 ) ) ( not ( = ?auto_4185 ?auto_4187 ) ) ( not ( = ?auto_4185 ?auto_4190 ) ) ( not ( = ?auto_4187 ?auto_4195 ) ) ( not ( = ?auto_4191 ?auto_4196 ) ) ( not ( = ?auto_4188 ?auto_4194 ) ) ( not ( = ?auto_4190 ?auto_4195 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4185 ?auto_4186 )
      ( MAKE-1CRATE ?auto_4186 ?auto_4187 )
      ( MAKE-2CRATE-VERIFY ?auto_4185 ?auto_4186 ?auto_4187 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4211 - SURFACE
      ?auto_4212 - SURFACE
      ?auto_4213 - SURFACE
      ?auto_4214 - SURFACE
    )
    :vars
    (
      ?auto_4217 - HOIST
      ?auto_4219 - PLACE
      ?auto_4218 - PLACE
      ?auto_4215 - HOIST
      ?auto_4216 - SURFACE
      ?auto_4225 - PLACE
      ?auto_4224 - HOIST
      ?auto_4223 - SURFACE
      ?auto_4222 - PLACE
      ?auto_4226 - HOIST
      ?auto_4221 - SURFACE
      ?auto_4220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4217 ?auto_4219 ) ( IS-CRATE ?auto_4214 ) ( not ( = ?auto_4218 ?auto_4219 ) ) ( HOIST-AT ?auto_4215 ?auto_4218 ) ( AVAILABLE ?auto_4215 ) ( SURFACE-AT ?auto_4214 ?auto_4218 ) ( ON ?auto_4214 ?auto_4216 ) ( CLEAR ?auto_4214 ) ( not ( = ?auto_4213 ?auto_4214 ) ) ( not ( = ?auto_4213 ?auto_4216 ) ) ( not ( = ?auto_4214 ?auto_4216 ) ) ( not ( = ?auto_4217 ?auto_4215 ) ) ( IS-CRATE ?auto_4213 ) ( not ( = ?auto_4225 ?auto_4219 ) ) ( HOIST-AT ?auto_4224 ?auto_4225 ) ( AVAILABLE ?auto_4224 ) ( SURFACE-AT ?auto_4213 ?auto_4225 ) ( ON ?auto_4213 ?auto_4223 ) ( CLEAR ?auto_4213 ) ( not ( = ?auto_4212 ?auto_4213 ) ) ( not ( = ?auto_4212 ?auto_4223 ) ) ( not ( = ?auto_4213 ?auto_4223 ) ) ( not ( = ?auto_4217 ?auto_4224 ) ) ( SURFACE-AT ?auto_4211 ?auto_4219 ) ( CLEAR ?auto_4211 ) ( IS-CRATE ?auto_4212 ) ( AVAILABLE ?auto_4217 ) ( not ( = ?auto_4222 ?auto_4219 ) ) ( HOIST-AT ?auto_4226 ?auto_4222 ) ( AVAILABLE ?auto_4226 ) ( SURFACE-AT ?auto_4212 ?auto_4222 ) ( ON ?auto_4212 ?auto_4221 ) ( CLEAR ?auto_4212 ) ( TRUCK-AT ?auto_4220 ?auto_4219 ) ( not ( = ?auto_4211 ?auto_4212 ) ) ( not ( = ?auto_4211 ?auto_4221 ) ) ( not ( = ?auto_4212 ?auto_4221 ) ) ( not ( = ?auto_4217 ?auto_4226 ) ) ( not ( = ?auto_4211 ?auto_4213 ) ) ( not ( = ?auto_4211 ?auto_4223 ) ) ( not ( = ?auto_4213 ?auto_4221 ) ) ( not ( = ?auto_4225 ?auto_4222 ) ) ( not ( = ?auto_4224 ?auto_4226 ) ) ( not ( = ?auto_4223 ?auto_4221 ) ) ( not ( = ?auto_4211 ?auto_4214 ) ) ( not ( = ?auto_4211 ?auto_4216 ) ) ( not ( = ?auto_4212 ?auto_4214 ) ) ( not ( = ?auto_4212 ?auto_4216 ) ) ( not ( = ?auto_4214 ?auto_4223 ) ) ( not ( = ?auto_4214 ?auto_4221 ) ) ( not ( = ?auto_4218 ?auto_4225 ) ) ( not ( = ?auto_4218 ?auto_4222 ) ) ( not ( = ?auto_4215 ?auto_4224 ) ) ( not ( = ?auto_4215 ?auto_4226 ) ) ( not ( = ?auto_4216 ?auto_4223 ) ) ( not ( = ?auto_4216 ?auto_4221 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4211 ?auto_4212 ?auto_4213 )
      ( MAKE-1CRATE ?auto_4213 ?auto_4214 )
      ( MAKE-3CRATE-VERIFY ?auto_4211 ?auto_4212 ?auto_4213 ?auto_4214 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_4242 - SURFACE
      ?auto_4243 - SURFACE
      ?auto_4244 - SURFACE
      ?auto_4245 - SURFACE
      ?auto_4246 - SURFACE
    )
    :vars
    (
      ?auto_4251 - HOIST
      ?auto_4249 - PLACE
      ?auto_4248 - PLACE
      ?auto_4252 - HOIST
      ?auto_4250 - SURFACE
      ?auto_4259 - PLACE
      ?auto_4257 - HOIST
      ?auto_4258 - SURFACE
      ?auto_4255 - SURFACE
      ?auto_4253 - PLACE
      ?auto_4254 - HOIST
      ?auto_4256 - SURFACE
      ?auto_4247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4251 ?auto_4249 ) ( IS-CRATE ?auto_4246 ) ( not ( = ?auto_4248 ?auto_4249 ) ) ( HOIST-AT ?auto_4252 ?auto_4248 ) ( SURFACE-AT ?auto_4246 ?auto_4248 ) ( ON ?auto_4246 ?auto_4250 ) ( CLEAR ?auto_4246 ) ( not ( = ?auto_4245 ?auto_4246 ) ) ( not ( = ?auto_4245 ?auto_4250 ) ) ( not ( = ?auto_4246 ?auto_4250 ) ) ( not ( = ?auto_4251 ?auto_4252 ) ) ( IS-CRATE ?auto_4245 ) ( not ( = ?auto_4259 ?auto_4249 ) ) ( HOIST-AT ?auto_4257 ?auto_4259 ) ( AVAILABLE ?auto_4257 ) ( SURFACE-AT ?auto_4245 ?auto_4259 ) ( ON ?auto_4245 ?auto_4258 ) ( CLEAR ?auto_4245 ) ( not ( = ?auto_4244 ?auto_4245 ) ) ( not ( = ?auto_4244 ?auto_4258 ) ) ( not ( = ?auto_4245 ?auto_4258 ) ) ( not ( = ?auto_4251 ?auto_4257 ) ) ( IS-CRATE ?auto_4244 ) ( AVAILABLE ?auto_4252 ) ( SURFACE-AT ?auto_4244 ?auto_4248 ) ( ON ?auto_4244 ?auto_4255 ) ( CLEAR ?auto_4244 ) ( not ( = ?auto_4243 ?auto_4244 ) ) ( not ( = ?auto_4243 ?auto_4255 ) ) ( not ( = ?auto_4244 ?auto_4255 ) ) ( SURFACE-AT ?auto_4242 ?auto_4249 ) ( CLEAR ?auto_4242 ) ( IS-CRATE ?auto_4243 ) ( AVAILABLE ?auto_4251 ) ( not ( = ?auto_4253 ?auto_4249 ) ) ( HOIST-AT ?auto_4254 ?auto_4253 ) ( AVAILABLE ?auto_4254 ) ( SURFACE-AT ?auto_4243 ?auto_4253 ) ( ON ?auto_4243 ?auto_4256 ) ( CLEAR ?auto_4243 ) ( TRUCK-AT ?auto_4247 ?auto_4249 ) ( not ( = ?auto_4242 ?auto_4243 ) ) ( not ( = ?auto_4242 ?auto_4256 ) ) ( not ( = ?auto_4243 ?auto_4256 ) ) ( not ( = ?auto_4251 ?auto_4254 ) ) ( not ( = ?auto_4242 ?auto_4244 ) ) ( not ( = ?auto_4242 ?auto_4255 ) ) ( not ( = ?auto_4244 ?auto_4256 ) ) ( not ( = ?auto_4248 ?auto_4253 ) ) ( not ( = ?auto_4252 ?auto_4254 ) ) ( not ( = ?auto_4255 ?auto_4256 ) ) ( not ( = ?auto_4242 ?auto_4245 ) ) ( not ( = ?auto_4242 ?auto_4258 ) ) ( not ( = ?auto_4243 ?auto_4245 ) ) ( not ( = ?auto_4243 ?auto_4258 ) ) ( not ( = ?auto_4245 ?auto_4255 ) ) ( not ( = ?auto_4245 ?auto_4256 ) ) ( not ( = ?auto_4259 ?auto_4248 ) ) ( not ( = ?auto_4259 ?auto_4253 ) ) ( not ( = ?auto_4257 ?auto_4252 ) ) ( not ( = ?auto_4257 ?auto_4254 ) ) ( not ( = ?auto_4258 ?auto_4255 ) ) ( not ( = ?auto_4258 ?auto_4256 ) ) ( not ( = ?auto_4242 ?auto_4246 ) ) ( not ( = ?auto_4242 ?auto_4250 ) ) ( not ( = ?auto_4243 ?auto_4246 ) ) ( not ( = ?auto_4243 ?auto_4250 ) ) ( not ( = ?auto_4244 ?auto_4246 ) ) ( not ( = ?auto_4244 ?auto_4250 ) ) ( not ( = ?auto_4246 ?auto_4258 ) ) ( not ( = ?auto_4246 ?auto_4255 ) ) ( not ( = ?auto_4246 ?auto_4256 ) ) ( not ( = ?auto_4250 ?auto_4258 ) ) ( not ( = ?auto_4250 ?auto_4255 ) ) ( not ( = ?auto_4250 ?auto_4256 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_4242 ?auto_4243 ?auto_4244 ?auto_4245 )
      ( MAKE-1CRATE ?auto_4245 ?auto_4246 )
      ( MAKE-4CRATE-VERIFY ?auto_4242 ?auto_4243 ?auto_4244 ?auto_4245 ?auto_4246 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_4276 - SURFACE
      ?auto_4277 - SURFACE
      ?auto_4278 - SURFACE
      ?auto_4279 - SURFACE
      ?auto_4280 - SURFACE
      ?auto_4281 - SURFACE
    )
    :vars
    (
      ?auto_4287 - HOIST
      ?auto_4284 - PLACE
      ?auto_4283 - PLACE
      ?auto_4285 - HOIST
      ?auto_4286 - SURFACE
      ?auto_4295 - PLACE
      ?auto_4291 - HOIST
      ?auto_4296 - SURFACE
      ?auto_4294 - PLACE
      ?auto_4288 - HOIST
      ?auto_4290 - SURFACE
      ?auto_4293 - SURFACE
      ?auto_4292 - PLACE
      ?auto_4297 - HOIST
      ?auto_4289 - SURFACE
      ?auto_4282 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4287 ?auto_4284 ) ( IS-CRATE ?auto_4281 ) ( not ( = ?auto_4283 ?auto_4284 ) ) ( HOIST-AT ?auto_4285 ?auto_4283 ) ( AVAILABLE ?auto_4285 ) ( SURFACE-AT ?auto_4281 ?auto_4283 ) ( ON ?auto_4281 ?auto_4286 ) ( CLEAR ?auto_4281 ) ( not ( = ?auto_4280 ?auto_4281 ) ) ( not ( = ?auto_4280 ?auto_4286 ) ) ( not ( = ?auto_4281 ?auto_4286 ) ) ( not ( = ?auto_4287 ?auto_4285 ) ) ( IS-CRATE ?auto_4280 ) ( not ( = ?auto_4295 ?auto_4284 ) ) ( HOIST-AT ?auto_4291 ?auto_4295 ) ( SURFACE-AT ?auto_4280 ?auto_4295 ) ( ON ?auto_4280 ?auto_4296 ) ( CLEAR ?auto_4280 ) ( not ( = ?auto_4279 ?auto_4280 ) ) ( not ( = ?auto_4279 ?auto_4296 ) ) ( not ( = ?auto_4280 ?auto_4296 ) ) ( not ( = ?auto_4287 ?auto_4291 ) ) ( IS-CRATE ?auto_4279 ) ( not ( = ?auto_4294 ?auto_4284 ) ) ( HOIST-AT ?auto_4288 ?auto_4294 ) ( AVAILABLE ?auto_4288 ) ( SURFACE-AT ?auto_4279 ?auto_4294 ) ( ON ?auto_4279 ?auto_4290 ) ( CLEAR ?auto_4279 ) ( not ( = ?auto_4278 ?auto_4279 ) ) ( not ( = ?auto_4278 ?auto_4290 ) ) ( not ( = ?auto_4279 ?auto_4290 ) ) ( not ( = ?auto_4287 ?auto_4288 ) ) ( IS-CRATE ?auto_4278 ) ( AVAILABLE ?auto_4291 ) ( SURFACE-AT ?auto_4278 ?auto_4295 ) ( ON ?auto_4278 ?auto_4293 ) ( CLEAR ?auto_4278 ) ( not ( = ?auto_4277 ?auto_4278 ) ) ( not ( = ?auto_4277 ?auto_4293 ) ) ( not ( = ?auto_4278 ?auto_4293 ) ) ( SURFACE-AT ?auto_4276 ?auto_4284 ) ( CLEAR ?auto_4276 ) ( IS-CRATE ?auto_4277 ) ( AVAILABLE ?auto_4287 ) ( not ( = ?auto_4292 ?auto_4284 ) ) ( HOIST-AT ?auto_4297 ?auto_4292 ) ( AVAILABLE ?auto_4297 ) ( SURFACE-AT ?auto_4277 ?auto_4292 ) ( ON ?auto_4277 ?auto_4289 ) ( CLEAR ?auto_4277 ) ( TRUCK-AT ?auto_4282 ?auto_4284 ) ( not ( = ?auto_4276 ?auto_4277 ) ) ( not ( = ?auto_4276 ?auto_4289 ) ) ( not ( = ?auto_4277 ?auto_4289 ) ) ( not ( = ?auto_4287 ?auto_4297 ) ) ( not ( = ?auto_4276 ?auto_4278 ) ) ( not ( = ?auto_4276 ?auto_4293 ) ) ( not ( = ?auto_4278 ?auto_4289 ) ) ( not ( = ?auto_4295 ?auto_4292 ) ) ( not ( = ?auto_4291 ?auto_4297 ) ) ( not ( = ?auto_4293 ?auto_4289 ) ) ( not ( = ?auto_4276 ?auto_4279 ) ) ( not ( = ?auto_4276 ?auto_4290 ) ) ( not ( = ?auto_4277 ?auto_4279 ) ) ( not ( = ?auto_4277 ?auto_4290 ) ) ( not ( = ?auto_4279 ?auto_4293 ) ) ( not ( = ?auto_4279 ?auto_4289 ) ) ( not ( = ?auto_4294 ?auto_4295 ) ) ( not ( = ?auto_4294 ?auto_4292 ) ) ( not ( = ?auto_4288 ?auto_4291 ) ) ( not ( = ?auto_4288 ?auto_4297 ) ) ( not ( = ?auto_4290 ?auto_4293 ) ) ( not ( = ?auto_4290 ?auto_4289 ) ) ( not ( = ?auto_4276 ?auto_4280 ) ) ( not ( = ?auto_4276 ?auto_4296 ) ) ( not ( = ?auto_4277 ?auto_4280 ) ) ( not ( = ?auto_4277 ?auto_4296 ) ) ( not ( = ?auto_4278 ?auto_4280 ) ) ( not ( = ?auto_4278 ?auto_4296 ) ) ( not ( = ?auto_4280 ?auto_4290 ) ) ( not ( = ?auto_4280 ?auto_4293 ) ) ( not ( = ?auto_4280 ?auto_4289 ) ) ( not ( = ?auto_4296 ?auto_4290 ) ) ( not ( = ?auto_4296 ?auto_4293 ) ) ( not ( = ?auto_4296 ?auto_4289 ) ) ( not ( = ?auto_4276 ?auto_4281 ) ) ( not ( = ?auto_4276 ?auto_4286 ) ) ( not ( = ?auto_4277 ?auto_4281 ) ) ( not ( = ?auto_4277 ?auto_4286 ) ) ( not ( = ?auto_4278 ?auto_4281 ) ) ( not ( = ?auto_4278 ?auto_4286 ) ) ( not ( = ?auto_4279 ?auto_4281 ) ) ( not ( = ?auto_4279 ?auto_4286 ) ) ( not ( = ?auto_4281 ?auto_4296 ) ) ( not ( = ?auto_4281 ?auto_4290 ) ) ( not ( = ?auto_4281 ?auto_4293 ) ) ( not ( = ?auto_4281 ?auto_4289 ) ) ( not ( = ?auto_4283 ?auto_4295 ) ) ( not ( = ?auto_4283 ?auto_4294 ) ) ( not ( = ?auto_4283 ?auto_4292 ) ) ( not ( = ?auto_4285 ?auto_4291 ) ) ( not ( = ?auto_4285 ?auto_4288 ) ) ( not ( = ?auto_4285 ?auto_4297 ) ) ( not ( = ?auto_4286 ?auto_4296 ) ) ( not ( = ?auto_4286 ?auto_4290 ) ) ( not ( = ?auto_4286 ?auto_4293 ) ) ( not ( = ?auto_4286 ?auto_4289 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4276 ?auto_4277 ?auto_4278 ?auto_4279 ?auto_4280 )
      ( MAKE-1CRATE ?auto_4280 ?auto_4281 )
      ( MAKE-5CRATE-VERIFY ?auto_4276 ?auto_4277 ?auto_4278 ?auto_4279 ?auto_4280 ?auto_4281 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_4315 - SURFACE
      ?auto_4316 - SURFACE
      ?auto_4317 - SURFACE
      ?auto_4318 - SURFACE
      ?auto_4319 - SURFACE
      ?auto_4320 - SURFACE
      ?auto_4321 - SURFACE
    )
    :vars
    (
      ?auto_4327 - HOIST
      ?auto_4322 - PLACE
      ?auto_4323 - PLACE
      ?auto_4325 - HOIST
      ?auto_4324 - SURFACE
      ?auto_4334 - PLACE
      ?auto_4329 - HOIST
      ?auto_4339 - SURFACE
      ?auto_4338 - PLACE
      ?auto_4331 - HOIST
      ?auto_4332 - SURFACE
      ?auto_4340 - PLACE
      ?auto_4336 - HOIST
      ?auto_4337 - SURFACE
      ?auto_4330 - SURFACE
      ?auto_4328 - PLACE
      ?auto_4333 - HOIST
      ?auto_4335 - SURFACE
      ?auto_4326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4327 ?auto_4322 ) ( IS-CRATE ?auto_4321 ) ( not ( = ?auto_4323 ?auto_4322 ) ) ( HOIST-AT ?auto_4325 ?auto_4323 ) ( AVAILABLE ?auto_4325 ) ( SURFACE-AT ?auto_4321 ?auto_4323 ) ( ON ?auto_4321 ?auto_4324 ) ( CLEAR ?auto_4321 ) ( not ( = ?auto_4320 ?auto_4321 ) ) ( not ( = ?auto_4320 ?auto_4324 ) ) ( not ( = ?auto_4321 ?auto_4324 ) ) ( not ( = ?auto_4327 ?auto_4325 ) ) ( IS-CRATE ?auto_4320 ) ( not ( = ?auto_4334 ?auto_4322 ) ) ( HOIST-AT ?auto_4329 ?auto_4334 ) ( AVAILABLE ?auto_4329 ) ( SURFACE-AT ?auto_4320 ?auto_4334 ) ( ON ?auto_4320 ?auto_4339 ) ( CLEAR ?auto_4320 ) ( not ( = ?auto_4319 ?auto_4320 ) ) ( not ( = ?auto_4319 ?auto_4339 ) ) ( not ( = ?auto_4320 ?auto_4339 ) ) ( not ( = ?auto_4327 ?auto_4329 ) ) ( IS-CRATE ?auto_4319 ) ( not ( = ?auto_4338 ?auto_4322 ) ) ( HOIST-AT ?auto_4331 ?auto_4338 ) ( SURFACE-AT ?auto_4319 ?auto_4338 ) ( ON ?auto_4319 ?auto_4332 ) ( CLEAR ?auto_4319 ) ( not ( = ?auto_4318 ?auto_4319 ) ) ( not ( = ?auto_4318 ?auto_4332 ) ) ( not ( = ?auto_4319 ?auto_4332 ) ) ( not ( = ?auto_4327 ?auto_4331 ) ) ( IS-CRATE ?auto_4318 ) ( not ( = ?auto_4340 ?auto_4322 ) ) ( HOIST-AT ?auto_4336 ?auto_4340 ) ( AVAILABLE ?auto_4336 ) ( SURFACE-AT ?auto_4318 ?auto_4340 ) ( ON ?auto_4318 ?auto_4337 ) ( CLEAR ?auto_4318 ) ( not ( = ?auto_4317 ?auto_4318 ) ) ( not ( = ?auto_4317 ?auto_4337 ) ) ( not ( = ?auto_4318 ?auto_4337 ) ) ( not ( = ?auto_4327 ?auto_4336 ) ) ( IS-CRATE ?auto_4317 ) ( AVAILABLE ?auto_4331 ) ( SURFACE-AT ?auto_4317 ?auto_4338 ) ( ON ?auto_4317 ?auto_4330 ) ( CLEAR ?auto_4317 ) ( not ( = ?auto_4316 ?auto_4317 ) ) ( not ( = ?auto_4316 ?auto_4330 ) ) ( not ( = ?auto_4317 ?auto_4330 ) ) ( SURFACE-AT ?auto_4315 ?auto_4322 ) ( CLEAR ?auto_4315 ) ( IS-CRATE ?auto_4316 ) ( AVAILABLE ?auto_4327 ) ( not ( = ?auto_4328 ?auto_4322 ) ) ( HOIST-AT ?auto_4333 ?auto_4328 ) ( AVAILABLE ?auto_4333 ) ( SURFACE-AT ?auto_4316 ?auto_4328 ) ( ON ?auto_4316 ?auto_4335 ) ( CLEAR ?auto_4316 ) ( TRUCK-AT ?auto_4326 ?auto_4322 ) ( not ( = ?auto_4315 ?auto_4316 ) ) ( not ( = ?auto_4315 ?auto_4335 ) ) ( not ( = ?auto_4316 ?auto_4335 ) ) ( not ( = ?auto_4327 ?auto_4333 ) ) ( not ( = ?auto_4315 ?auto_4317 ) ) ( not ( = ?auto_4315 ?auto_4330 ) ) ( not ( = ?auto_4317 ?auto_4335 ) ) ( not ( = ?auto_4338 ?auto_4328 ) ) ( not ( = ?auto_4331 ?auto_4333 ) ) ( not ( = ?auto_4330 ?auto_4335 ) ) ( not ( = ?auto_4315 ?auto_4318 ) ) ( not ( = ?auto_4315 ?auto_4337 ) ) ( not ( = ?auto_4316 ?auto_4318 ) ) ( not ( = ?auto_4316 ?auto_4337 ) ) ( not ( = ?auto_4318 ?auto_4330 ) ) ( not ( = ?auto_4318 ?auto_4335 ) ) ( not ( = ?auto_4340 ?auto_4338 ) ) ( not ( = ?auto_4340 ?auto_4328 ) ) ( not ( = ?auto_4336 ?auto_4331 ) ) ( not ( = ?auto_4336 ?auto_4333 ) ) ( not ( = ?auto_4337 ?auto_4330 ) ) ( not ( = ?auto_4337 ?auto_4335 ) ) ( not ( = ?auto_4315 ?auto_4319 ) ) ( not ( = ?auto_4315 ?auto_4332 ) ) ( not ( = ?auto_4316 ?auto_4319 ) ) ( not ( = ?auto_4316 ?auto_4332 ) ) ( not ( = ?auto_4317 ?auto_4319 ) ) ( not ( = ?auto_4317 ?auto_4332 ) ) ( not ( = ?auto_4319 ?auto_4337 ) ) ( not ( = ?auto_4319 ?auto_4330 ) ) ( not ( = ?auto_4319 ?auto_4335 ) ) ( not ( = ?auto_4332 ?auto_4337 ) ) ( not ( = ?auto_4332 ?auto_4330 ) ) ( not ( = ?auto_4332 ?auto_4335 ) ) ( not ( = ?auto_4315 ?auto_4320 ) ) ( not ( = ?auto_4315 ?auto_4339 ) ) ( not ( = ?auto_4316 ?auto_4320 ) ) ( not ( = ?auto_4316 ?auto_4339 ) ) ( not ( = ?auto_4317 ?auto_4320 ) ) ( not ( = ?auto_4317 ?auto_4339 ) ) ( not ( = ?auto_4318 ?auto_4320 ) ) ( not ( = ?auto_4318 ?auto_4339 ) ) ( not ( = ?auto_4320 ?auto_4332 ) ) ( not ( = ?auto_4320 ?auto_4337 ) ) ( not ( = ?auto_4320 ?auto_4330 ) ) ( not ( = ?auto_4320 ?auto_4335 ) ) ( not ( = ?auto_4334 ?auto_4338 ) ) ( not ( = ?auto_4334 ?auto_4340 ) ) ( not ( = ?auto_4334 ?auto_4328 ) ) ( not ( = ?auto_4329 ?auto_4331 ) ) ( not ( = ?auto_4329 ?auto_4336 ) ) ( not ( = ?auto_4329 ?auto_4333 ) ) ( not ( = ?auto_4339 ?auto_4332 ) ) ( not ( = ?auto_4339 ?auto_4337 ) ) ( not ( = ?auto_4339 ?auto_4330 ) ) ( not ( = ?auto_4339 ?auto_4335 ) ) ( not ( = ?auto_4315 ?auto_4321 ) ) ( not ( = ?auto_4315 ?auto_4324 ) ) ( not ( = ?auto_4316 ?auto_4321 ) ) ( not ( = ?auto_4316 ?auto_4324 ) ) ( not ( = ?auto_4317 ?auto_4321 ) ) ( not ( = ?auto_4317 ?auto_4324 ) ) ( not ( = ?auto_4318 ?auto_4321 ) ) ( not ( = ?auto_4318 ?auto_4324 ) ) ( not ( = ?auto_4319 ?auto_4321 ) ) ( not ( = ?auto_4319 ?auto_4324 ) ) ( not ( = ?auto_4321 ?auto_4339 ) ) ( not ( = ?auto_4321 ?auto_4332 ) ) ( not ( = ?auto_4321 ?auto_4337 ) ) ( not ( = ?auto_4321 ?auto_4330 ) ) ( not ( = ?auto_4321 ?auto_4335 ) ) ( not ( = ?auto_4323 ?auto_4334 ) ) ( not ( = ?auto_4323 ?auto_4338 ) ) ( not ( = ?auto_4323 ?auto_4340 ) ) ( not ( = ?auto_4323 ?auto_4328 ) ) ( not ( = ?auto_4325 ?auto_4329 ) ) ( not ( = ?auto_4325 ?auto_4331 ) ) ( not ( = ?auto_4325 ?auto_4336 ) ) ( not ( = ?auto_4325 ?auto_4333 ) ) ( not ( = ?auto_4324 ?auto_4339 ) ) ( not ( = ?auto_4324 ?auto_4332 ) ) ( not ( = ?auto_4324 ?auto_4337 ) ) ( not ( = ?auto_4324 ?auto_4330 ) ) ( not ( = ?auto_4324 ?auto_4335 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4315 ?auto_4316 ?auto_4317 ?auto_4318 ?auto_4319 ?auto_4320 )
      ( MAKE-1CRATE ?auto_4320 ?auto_4321 )
      ( MAKE-6CRATE-VERIFY ?auto_4315 ?auto_4316 ?auto_4317 ?auto_4318 ?auto_4319 ?auto_4320 ?auto_4321 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_4359 - SURFACE
      ?auto_4360 - SURFACE
      ?auto_4361 - SURFACE
      ?auto_4362 - SURFACE
      ?auto_4363 - SURFACE
      ?auto_4364 - SURFACE
      ?auto_4365 - SURFACE
      ?auto_4366 - SURFACE
    )
    :vars
    (
      ?auto_4370 - HOIST
      ?auto_4368 - PLACE
      ?auto_4372 - PLACE
      ?auto_4369 - HOIST
      ?auto_4367 - SURFACE
      ?auto_4388 - PLACE
      ?auto_4377 - HOIST
      ?auto_4382 - SURFACE
      ?auto_4373 - PLACE
      ?auto_4381 - HOIST
      ?auto_4380 - SURFACE
      ?auto_4383 - PLACE
      ?auto_4385 - HOIST
      ?auto_4374 - SURFACE
      ?auto_4378 - PLACE
      ?auto_4387 - HOIST
      ?auto_4379 - SURFACE
      ?auto_4386 - SURFACE
      ?auto_4384 - PLACE
      ?auto_4375 - HOIST
      ?auto_4376 - SURFACE
      ?auto_4371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4370 ?auto_4368 ) ( IS-CRATE ?auto_4366 ) ( not ( = ?auto_4372 ?auto_4368 ) ) ( HOIST-AT ?auto_4369 ?auto_4372 ) ( AVAILABLE ?auto_4369 ) ( SURFACE-AT ?auto_4366 ?auto_4372 ) ( ON ?auto_4366 ?auto_4367 ) ( CLEAR ?auto_4366 ) ( not ( = ?auto_4365 ?auto_4366 ) ) ( not ( = ?auto_4365 ?auto_4367 ) ) ( not ( = ?auto_4366 ?auto_4367 ) ) ( not ( = ?auto_4370 ?auto_4369 ) ) ( IS-CRATE ?auto_4365 ) ( not ( = ?auto_4388 ?auto_4368 ) ) ( HOIST-AT ?auto_4377 ?auto_4388 ) ( AVAILABLE ?auto_4377 ) ( SURFACE-AT ?auto_4365 ?auto_4388 ) ( ON ?auto_4365 ?auto_4382 ) ( CLEAR ?auto_4365 ) ( not ( = ?auto_4364 ?auto_4365 ) ) ( not ( = ?auto_4364 ?auto_4382 ) ) ( not ( = ?auto_4365 ?auto_4382 ) ) ( not ( = ?auto_4370 ?auto_4377 ) ) ( IS-CRATE ?auto_4364 ) ( not ( = ?auto_4373 ?auto_4368 ) ) ( HOIST-AT ?auto_4381 ?auto_4373 ) ( AVAILABLE ?auto_4381 ) ( SURFACE-AT ?auto_4364 ?auto_4373 ) ( ON ?auto_4364 ?auto_4380 ) ( CLEAR ?auto_4364 ) ( not ( = ?auto_4363 ?auto_4364 ) ) ( not ( = ?auto_4363 ?auto_4380 ) ) ( not ( = ?auto_4364 ?auto_4380 ) ) ( not ( = ?auto_4370 ?auto_4381 ) ) ( IS-CRATE ?auto_4363 ) ( not ( = ?auto_4383 ?auto_4368 ) ) ( HOIST-AT ?auto_4385 ?auto_4383 ) ( SURFACE-AT ?auto_4363 ?auto_4383 ) ( ON ?auto_4363 ?auto_4374 ) ( CLEAR ?auto_4363 ) ( not ( = ?auto_4362 ?auto_4363 ) ) ( not ( = ?auto_4362 ?auto_4374 ) ) ( not ( = ?auto_4363 ?auto_4374 ) ) ( not ( = ?auto_4370 ?auto_4385 ) ) ( IS-CRATE ?auto_4362 ) ( not ( = ?auto_4378 ?auto_4368 ) ) ( HOIST-AT ?auto_4387 ?auto_4378 ) ( AVAILABLE ?auto_4387 ) ( SURFACE-AT ?auto_4362 ?auto_4378 ) ( ON ?auto_4362 ?auto_4379 ) ( CLEAR ?auto_4362 ) ( not ( = ?auto_4361 ?auto_4362 ) ) ( not ( = ?auto_4361 ?auto_4379 ) ) ( not ( = ?auto_4362 ?auto_4379 ) ) ( not ( = ?auto_4370 ?auto_4387 ) ) ( IS-CRATE ?auto_4361 ) ( AVAILABLE ?auto_4385 ) ( SURFACE-AT ?auto_4361 ?auto_4383 ) ( ON ?auto_4361 ?auto_4386 ) ( CLEAR ?auto_4361 ) ( not ( = ?auto_4360 ?auto_4361 ) ) ( not ( = ?auto_4360 ?auto_4386 ) ) ( not ( = ?auto_4361 ?auto_4386 ) ) ( SURFACE-AT ?auto_4359 ?auto_4368 ) ( CLEAR ?auto_4359 ) ( IS-CRATE ?auto_4360 ) ( AVAILABLE ?auto_4370 ) ( not ( = ?auto_4384 ?auto_4368 ) ) ( HOIST-AT ?auto_4375 ?auto_4384 ) ( AVAILABLE ?auto_4375 ) ( SURFACE-AT ?auto_4360 ?auto_4384 ) ( ON ?auto_4360 ?auto_4376 ) ( CLEAR ?auto_4360 ) ( TRUCK-AT ?auto_4371 ?auto_4368 ) ( not ( = ?auto_4359 ?auto_4360 ) ) ( not ( = ?auto_4359 ?auto_4376 ) ) ( not ( = ?auto_4360 ?auto_4376 ) ) ( not ( = ?auto_4370 ?auto_4375 ) ) ( not ( = ?auto_4359 ?auto_4361 ) ) ( not ( = ?auto_4359 ?auto_4386 ) ) ( not ( = ?auto_4361 ?auto_4376 ) ) ( not ( = ?auto_4383 ?auto_4384 ) ) ( not ( = ?auto_4385 ?auto_4375 ) ) ( not ( = ?auto_4386 ?auto_4376 ) ) ( not ( = ?auto_4359 ?auto_4362 ) ) ( not ( = ?auto_4359 ?auto_4379 ) ) ( not ( = ?auto_4360 ?auto_4362 ) ) ( not ( = ?auto_4360 ?auto_4379 ) ) ( not ( = ?auto_4362 ?auto_4386 ) ) ( not ( = ?auto_4362 ?auto_4376 ) ) ( not ( = ?auto_4378 ?auto_4383 ) ) ( not ( = ?auto_4378 ?auto_4384 ) ) ( not ( = ?auto_4387 ?auto_4385 ) ) ( not ( = ?auto_4387 ?auto_4375 ) ) ( not ( = ?auto_4379 ?auto_4386 ) ) ( not ( = ?auto_4379 ?auto_4376 ) ) ( not ( = ?auto_4359 ?auto_4363 ) ) ( not ( = ?auto_4359 ?auto_4374 ) ) ( not ( = ?auto_4360 ?auto_4363 ) ) ( not ( = ?auto_4360 ?auto_4374 ) ) ( not ( = ?auto_4361 ?auto_4363 ) ) ( not ( = ?auto_4361 ?auto_4374 ) ) ( not ( = ?auto_4363 ?auto_4379 ) ) ( not ( = ?auto_4363 ?auto_4386 ) ) ( not ( = ?auto_4363 ?auto_4376 ) ) ( not ( = ?auto_4374 ?auto_4379 ) ) ( not ( = ?auto_4374 ?auto_4386 ) ) ( not ( = ?auto_4374 ?auto_4376 ) ) ( not ( = ?auto_4359 ?auto_4364 ) ) ( not ( = ?auto_4359 ?auto_4380 ) ) ( not ( = ?auto_4360 ?auto_4364 ) ) ( not ( = ?auto_4360 ?auto_4380 ) ) ( not ( = ?auto_4361 ?auto_4364 ) ) ( not ( = ?auto_4361 ?auto_4380 ) ) ( not ( = ?auto_4362 ?auto_4364 ) ) ( not ( = ?auto_4362 ?auto_4380 ) ) ( not ( = ?auto_4364 ?auto_4374 ) ) ( not ( = ?auto_4364 ?auto_4379 ) ) ( not ( = ?auto_4364 ?auto_4386 ) ) ( not ( = ?auto_4364 ?auto_4376 ) ) ( not ( = ?auto_4373 ?auto_4383 ) ) ( not ( = ?auto_4373 ?auto_4378 ) ) ( not ( = ?auto_4373 ?auto_4384 ) ) ( not ( = ?auto_4381 ?auto_4385 ) ) ( not ( = ?auto_4381 ?auto_4387 ) ) ( not ( = ?auto_4381 ?auto_4375 ) ) ( not ( = ?auto_4380 ?auto_4374 ) ) ( not ( = ?auto_4380 ?auto_4379 ) ) ( not ( = ?auto_4380 ?auto_4386 ) ) ( not ( = ?auto_4380 ?auto_4376 ) ) ( not ( = ?auto_4359 ?auto_4365 ) ) ( not ( = ?auto_4359 ?auto_4382 ) ) ( not ( = ?auto_4360 ?auto_4365 ) ) ( not ( = ?auto_4360 ?auto_4382 ) ) ( not ( = ?auto_4361 ?auto_4365 ) ) ( not ( = ?auto_4361 ?auto_4382 ) ) ( not ( = ?auto_4362 ?auto_4365 ) ) ( not ( = ?auto_4362 ?auto_4382 ) ) ( not ( = ?auto_4363 ?auto_4365 ) ) ( not ( = ?auto_4363 ?auto_4382 ) ) ( not ( = ?auto_4365 ?auto_4380 ) ) ( not ( = ?auto_4365 ?auto_4374 ) ) ( not ( = ?auto_4365 ?auto_4379 ) ) ( not ( = ?auto_4365 ?auto_4386 ) ) ( not ( = ?auto_4365 ?auto_4376 ) ) ( not ( = ?auto_4388 ?auto_4373 ) ) ( not ( = ?auto_4388 ?auto_4383 ) ) ( not ( = ?auto_4388 ?auto_4378 ) ) ( not ( = ?auto_4388 ?auto_4384 ) ) ( not ( = ?auto_4377 ?auto_4381 ) ) ( not ( = ?auto_4377 ?auto_4385 ) ) ( not ( = ?auto_4377 ?auto_4387 ) ) ( not ( = ?auto_4377 ?auto_4375 ) ) ( not ( = ?auto_4382 ?auto_4380 ) ) ( not ( = ?auto_4382 ?auto_4374 ) ) ( not ( = ?auto_4382 ?auto_4379 ) ) ( not ( = ?auto_4382 ?auto_4386 ) ) ( not ( = ?auto_4382 ?auto_4376 ) ) ( not ( = ?auto_4359 ?auto_4366 ) ) ( not ( = ?auto_4359 ?auto_4367 ) ) ( not ( = ?auto_4360 ?auto_4366 ) ) ( not ( = ?auto_4360 ?auto_4367 ) ) ( not ( = ?auto_4361 ?auto_4366 ) ) ( not ( = ?auto_4361 ?auto_4367 ) ) ( not ( = ?auto_4362 ?auto_4366 ) ) ( not ( = ?auto_4362 ?auto_4367 ) ) ( not ( = ?auto_4363 ?auto_4366 ) ) ( not ( = ?auto_4363 ?auto_4367 ) ) ( not ( = ?auto_4364 ?auto_4366 ) ) ( not ( = ?auto_4364 ?auto_4367 ) ) ( not ( = ?auto_4366 ?auto_4382 ) ) ( not ( = ?auto_4366 ?auto_4380 ) ) ( not ( = ?auto_4366 ?auto_4374 ) ) ( not ( = ?auto_4366 ?auto_4379 ) ) ( not ( = ?auto_4366 ?auto_4386 ) ) ( not ( = ?auto_4366 ?auto_4376 ) ) ( not ( = ?auto_4372 ?auto_4388 ) ) ( not ( = ?auto_4372 ?auto_4373 ) ) ( not ( = ?auto_4372 ?auto_4383 ) ) ( not ( = ?auto_4372 ?auto_4378 ) ) ( not ( = ?auto_4372 ?auto_4384 ) ) ( not ( = ?auto_4369 ?auto_4377 ) ) ( not ( = ?auto_4369 ?auto_4381 ) ) ( not ( = ?auto_4369 ?auto_4385 ) ) ( not ( = ?auto_4369 ?auto_4387 ) ) ( not ( = ?auto_4369 ?auto_4375 ) ) ( not ( = ?auto_4367 ?auto_4382 ) ) ( not ( = ?auto_4367 ?auto_4380 ) ) ( not ( = ?auto_4367 ?auto_4374 ) ) ( not ( = ?auto_4367 ?auto_4379 ) ) ( not ( = ?auto_4367 ?auto_4386 ) ) ( not ( = ?auto_4367 ?auto_4376 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4359 ?auto_4360 ?auto_4361 ?auto_4362 ?auto_4363 ?auto_4364 ?auto_4365 )
      ( MAKE-1CRATE ?auto_4365 ?auto_4366 )
      ( MAKE-7CRATE-VERIFY ?auto_4359 ?auto_4360 ?auto_4361 ?auto_4362 ?auto_4363 ?auto_4364 ?auto_4365 ?auto_4366 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_4408 - SURFACE
      ?auto_4409 - SURFACE
      ?auto_4410 - SURFACE
      ?auto_4411 - SURFACE
      ?auto_4412 - SURFACE
      ?auto_4413 - SURFACE
      ?auto_4414 - SURFACE
      ?auto_4415 - SURFACE
      ?auto_4416 - SURFACE
    )
    :vars
    (
      ?auto_4422 - HOIST
      ?auto_4421 - PLACE
      ?auto_4417 - PLACE
      ?auto_4418 - HOIST
      ?auto_4419 - SURFACE
      ?auto_4428 - PLACE
      ?auto_4438 - HOIST
      ?auto_4437 - SURFACE
      ?auto_4436 - PLACE
      ?auto_4427 - HOIST
      ?auto_4434 - SURFACE
      ?auto_4425 - PLACE
      ?auto_4426 - HOIST
      ?auto_4423 - SURFACE
      ?auto_4430 - PLACE
      ?auto_4424 - HOIST
      ?auto_4429 - SURFACE
      ?auto_4435 - SURFACE
      ?auto_4439 - SURFACE
      ?auto_4432 - PLACE
      ?auto_4431 - HOIST
      ?auto_4433 - SURFACE
      ?auto_4420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4422 ?auto_4421 ) ( IS-CRATE ?auto_4416 ) ( not ( = ?auto_4417 ?auto_4421 ) ) ( HOIST-AT ?auto_4418 ?auto_4417 ) ( SURFACE-AT ?auto_4416 ?auto_4417 ) ( ON ?auto_4416 ?auto_4419 ) ( CLEAR ?auto_4416 ) ( not ( = ?auto_4415 ?auto_4416 ) ) ( not ( = ?auto_4415 ?auto_4419 ) ) ( not ( = ?auto_4416 ?auto_4419 ) ) ( not ( = ?auto_4422 ?auto_4418 ) ) ( IS-CRATE ?auto_4415 ) ( not ( = ?auto_4428 ?auto_4421 ) ) ( HOIST-AT ?auto_4438 ?auto_4428 ) ( AVAILABLE ?auto_4438 ) ( SURFACE-AT ?auto_4415 ?auto_4428 ) ( ON ?auto_4415 ?auto_4437 ) ( CLEAR ?auto_4415 ) ( not ( = ?auto_4414 ?auto_4415 ) ) ( not ( = ?auto_4414 ?auto_4437 ) ) ( not ( = ?auto_4415 ?auto_4437 ) ) ( not ( = ?auto_4422 ?auto_4438 ) ) ( IS-CRATE ?auto_4414 ) ( not ( = ?auto_4436 ?auto_4421 ) ) ( HOIST-AT ?auto_4427 ?auto_4436 ) ( AVAILABLE ?auto_4427 ) ( SURFACE-AT ?auto_4414 ?auto_4436 ) ( ON ?auto_4414 ?auto_4434 ) ( CLEAR ?auto_4414 ) ( not ( = ?auto_4413 ?auto_4414 ) ) ( not ( = ?auto_4413 ?auto_4434 ) ) ( not ( = ?auto_4414 ?auto_4434 ) ) ( not ( = ?auto_4422 ?auto_4427 ) ) ( IS-CRATE ?auto_4413 ) ( not ( = ?auto_4425 ?auto_4421 ) ) ( HOIST-AT ?auto_4426 ?auto_4425 ) ( AVAILABLE ?auto_4426 ) ( SURFACE-AT ?auto_4413 ?auto_4425 ) ( ON ?auto_4413 ?auto_4423 ) ( CLEAR ?auto_4413 ) ( not ( = ?auto_4412 ?auto_4413 ) ) ( not ( = ?auto_4412 ?auto_4423 ) ) ( not ( = ?auto_4413 ?auto_4423 ) ) ( not ( = ?auto_4422 ?auto_4426 ) ) ( IS-CRATE ?auto_4412 ) ( not ( = ?auto_4430 ?auto_4421 ) ) ( HOIST-AT ?auto_4424 ?auto_4430 ) ( SURFACE-AT ?auto_4412 ?auto_4430 ) ( ON ?auto_4412 ?auto_4429 ) ( CLEAR ?auto_4412 ) ( not ( = ?auto_4411 ?auto_4412 ) ) ( not ( = ?auto_4411 ?auto_4429 ) ) ( not ( = ?auto_4412 ?auto_4429 ) ) ( not ( = ?auto_4422 ?auto_4424 ) ) ( IS-CRATE ?auto_4411 ) ( AVAILABLE ?auto_4418 ) ( SURFACE-AT ?auto_4411 ?auto_4417 ) ( ON ?auto_4411 ?auto_4435 ) ( CLEAR ?auto_4411 ) ( not ( = ?auto_4410 ?auto_4411 ) ) ( not ( = ?auto_4410 ?auto_4435 ) ) ( not ( = ?auto_4411 ?auto_4435 ) ) ( IS-CRATE ?auto_4410 ) ( AVAILABLE ?auto_4424 ) ( SURFACE-AT ?auto_4410 ?auto_4430 ) ( ON ?auto_4410 ?auto_4439 ) ( CLEAR ?auto_4410 ) ( not ( = ?auto_4409 ?auto_4410 ) ) ( not ( = ?auto_4409 ?auto_4439 ) ) ( not ( = ?auto_4410 ?auto_4439 ) ) ( SURFACE-AT ?auto_4408 ?auto_4421 ) ( CLEAR ?auto_4408 ) ( IS-CRATE ?auto_4409 ) ( AVAILABLE ?auto_4422 ) ( not ( = ?auto_4432 ?auto_4421 ) ) ( HOIST-AT ?auto_4431 ?auto_4432 ) ( AVAILABLE ?auto_4431 ) ( SURFACE-AT ?auto_4409 ?auto_4432 ) ( ON ?auto_4409 ?auto_4433 ) ( CLEAR ?auto_4409 ) ( TRUCK-AT ?auto_4420 ?auto_4421 ) ( not ( = ?auto_4408 ?auto_4409 ) ) ( not ( = ?auto_4408 ?auto_4433 ) ) ( not ( = ?auto_4409 ?auto_4433 ) ) ( not ( = ?auto_4422 ?auto_4431 ) ) ( not ( = ?auto_4408 ?auto_4410 ) ) ( not ( = ?auto_4408 ?auto_4439 ) ) ( not ( = ?auto_4410 ?auto_4433 ) ) ( not ( = ?auto_4430 ?auto_4432 ) ) ( not ( = ?auto_4424 ?auto_4431 ) ) ( not ( = ?auto_4439 ?auto_4433 ) ) ( not ( = ?auto_4408 ?auto_4411 ) ) ( not ( = ?auto_4408 ?auto_4435 ) ) ( not ( = ?auto_4409 ?auto_4411 ) ) ( not ( = ?auto_4409 ?auto_4435 ) ) ( not ( = ?auto_4411 ?auto_4439 ) ) ( not ( = ?auto_4411 ?auto_4433 ) ) ( not ( = ?auto_4417 ?auto_4430 ) ) ( not ( = ?auto_4417 ?auto_4432 ) ) ( not ( = ?auto_4418 ?auto_4424 ) ) ( not ( = ?auto_4418 ?auto_4431 ) ) ( not ( = ?auto_4435 ?auto_4439 ) ) ( not ( = ?auto_4435 ?auto_4433 ) ) ( not ( = ?auto_4408 ?auto_4412 ) ) ( not ( = ?auto_4408 ?auto_4429 ) ) ( not ( = ?auto_4409 ?auto_4412 ) ) ( not ( = ?auto_4409 ?auto_4429 ) ) ( not ( = ?auto_4410 ?auto_4412 ) ) ( not ( = ?auto_4410 ?auto_4429 ) ) ( not ( = ?auto_4412 ?auto_4435 ) ) ( not ( = ?auto_4412 ?auto_4439 ) ) ( not ( = ?auto_4412 ?auto_4433 ) ) ( not ( = ?auto_4429 ?auto_4435 ) ) ( not ( = ?auto_4429 ?auto_4439 ) ) ( not ( = ?auto_4429 ?auto_4433 ) ) ( not ( = ?auto_4408 ?auto_4413 ) ) ( not ( = ?auto_4408 ?auto_4423 ) ) ( not ( = ?auto_4409 ?auto_4413 ) ) ( not ( = ?auto_4409 ?auto_4423 ) ) ( not ( = ?auto_4410 ?auto_4413 ) ) ( not ( = ?auto_4410 ?auto_4423 ) ) ( not ( = ?auto_4411 ?auto_4413 ) ) ( not ( = ?auto_4411 ?auto_4423 ) ) ( not ( = ?auto_4413 ?auto_4429 ) ) ( not ( = ?auto_4413 ?auto_4435 ) ) ( not ( = ?auto_4413 ?auto_4439 ) ) ( not ( = ?auto_4413 ?auto_4433 ) ) ( not ( = ?auto_4425 ?auto_4430 ) ) ( not ( = ?auto_4425 ?auto_4417 ) ) ( not ( = ?auto_4425 ?auto_4432 ) ) ( not ( = ?auto_4426 ?auto_4424 ) ) ( not ( = ?auto_4426 ?auto_4418 ) ) ( not ( = ?auto_4426 ?auto_4431 ) ) ( not ( = ?auto_4423 ?auto_4429 ) ) ( not ( = ?auto_4423 ?auto_4435 ) ) ( not ( = ?auto_4423 ?auto_4439 ) ) ( not ( = ?auto_4423 ?auto_4433 ) ) ( not ( = ?auto_4408 ?auto_4414 ) ) ( not ( = ?auto_4408 ?auto_4434 ) ) ( not ( = ?auto_4409 ?auto_4414 ) ) ( not ( = ?auto_4409 ?auto_4434 ) ) ( not ( = ?auto_4410 ?auto_4414 ) ) ( not ( = ?auto_4410 ?auto_4434 ) ) ( not ( = ?auto_4411 ?auto_4414 ) ) ( not ( = ?auto_4411 ?auto_4434 ) ) ( not ( = ?auto_4412 ?auto_4414 ) ) ( not ( = ?auto_4412 ?auto_4434 ) ) ( not ( = ?auto_4414 ?auto_4423 ) ) ( not ( = ?auto_4414 ?auto_4429 ) ) ( not ( = ?auto_4414 ?auto_4435 ) ) ( not ( = ?auto_4414 ?auto_4439 ) ) ( not ( = ?auto_4414 ?auto_4433 ) ) ( not ( = ?auto_4436 ?auto_4425 ) ) ( not ( = ?auto_4436 ?auto_4430 ) ) ( not ( = ?auto_4436 ?auto_4417 ) ) ( not ( = ?auto_4436 ?auto_4432 ) ) ( not ( = ?auto_4427 ?auto_4426 ) ) ( not ( = ?auto_4427 ?auto_4424 ) ) ( not ( = ?auto_4427 ?auto_4418 ) ) ( not ( = ?auto_4427 ?auto_4431 ) ) ( not ( = ?auto_4434 ?auto_4423 ) ) ( not ( = ?auto_4434 ?auto_4429 ) ) ( not ( = ?auto_4434 ?auto_4435 ) ) ( not ( = ?auto_4434 ?auto_4439 ) ) ( not ( = ?auto_4434 ?auto_4433 ) ) ( not ( = ?auto_4408 ?auto_4415 ) ) ( not ( = ?auto_4408 ?auto_4437 ) ) ( not ( = ?auto_4409 ?auto_4415 ) ) ( not ( = ?auto_4409 ?auto_4437 ) ) ( not ( = ?auto_4410 ?auto_4415 ) ) ( not ( = ?auto_4410 ?auto_4437 ) ) ( not ( = ?auto_4411 ?auto_4415 ) ) ( not ( = ?auto_4411 ?auto_4437 ) ) ( not ( = ?auto_4412 ?auto_4415 ) ) ( not ( = ?auto_4412 ?auto_4437 ) ) ( not ( = ?auto_4413 ?auto_4415 ) ) ( not ( = ?auto_4413 ?auto_4437 ) ) ( not ( = ?auto_4415 ?auto_4434 ) ) ( not ( = ?auto_4415 ?auto_4423 ) ) ( not ( = ?auto_4415 ?auto_4429 ) ) ( not ( = ?auto_4415 ?auto_4435 ) ) ( not ( = ?auto_4415 ?auto_4439 ) ) ( not ( = ?auto_4415 ?auto_4433 ) ) ( not ( = ?auto_4428 ?auto_4436 ) ) ( not ( = ?auto_4428 ?auto_4425 ) ) ( not ( = ?auto_4428 ?auto_4430 ) ) ( not ( = ?auto_4428 ?auto_4417 ) ) ( not ( = ?auto_4428 ?auto_4432 ) ) ( not ( = ?auto_4438 ?auto_4427 ) ) ( not ( = ?auto_4438 ?auto_4426 ) ) ( not ( = ?auto_4438 ?auto_4424 ) ) ( not ( = ?auto_4438 ?auto_4418 ) ) ( not ( = ?auto_4438 ?auto_4431 ) ) ( not ( = ?auto_4437 ?auto_4434 ) ) ( not ( = ?auto_4437 ?auto_4423 ) ) ( not ( = ?auto_4437 ?auto_4429 ) ) ( not ( = ?auto_4437 ?auto_4435 ) ) ( not ( = ?auto_4437 ?auto_4439 ) ) ( not ( = ?auto_4437 ?auto_4433 ) ) ( not ( = ?auto_4408 ?auto_4416 ) ) ( not ( = ?auto_4408 ?auto_4419 ) ) ( not ( = ?auto_4409 ?auto_4416 ) ) ( not ( = ?auto_4409 ?auto_4419 ) ) ( not ( = ?auto_4410 ?auto_4416 ) ) ( not ( = ?auto_4410 ?auto_4419 ) ) ( not ( = ?auto_4411 ?auto_4416 ) ) ( not ( = ?auto_4411 ?auto_4419 ) ) ( not ( = ?auto_4412 ?auto_4416 ) ) ( not ( = ?auto_4412 ?auto_4419 ) ) ( not ( = ?auto_4413 ?auto_4416 ) ) ( not ( = ?auto_4413 ?auto_4419 ) ) ( not ( = ?auto_4414 ?auto_4416 ) ) ( not ( = ?auto_4414 ?auto_4419 ) ) ( not ( = ?auto_4416 ?auto_4437 ) ) ( not ( = ?auto_4416 ?auto_4434 ) ) ( not ( = ?auto_4416 ?auto_4423 ) ) ( not ( = ?auto_4416 ?auto_4429 ) ) ( not ( = ?auto_4416 ?auto_4435 ) ) ( not ( = ?auto_4416 ?auto_4439 ) ) ( not ( = ?auto_4416 ?auto_4433 ) ) ( not ( = ?auto_4419 ?auto_4437 ) ) ( not ( = ?auto_4419 ?auto_4434 ) ) ( not ( = ?auto_4419 ?auto_4423 ) ) ( not ( = ?auto_4419 ?auto_4429 ) ) ( not ( = ?auto_4419 ?auto_4435 ) ) ( not ( = ?auto_4419 ?auto_4439 ) ) ( not ( = ?auto_4419 ?auto_4433 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4408 ?auto_4409 ?auto_4410 ?auto_4411 ?auto_4412 ?auto_4413 ?auto_4414 ?auto_4415 )
      ( MAKE-1CRATE ?auto_4415 ?auto_4416 )
      ( MAKE-8CRATE-VERIFY ?auto_4408 ?auto_4409 ?auto_4410 ?auto_4411 ?auto_4412 ?auto_4413 ?auto_4414 ?auto_4415 ?auto_4416 ) )
  )

)

