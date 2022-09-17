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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4174 - SURFACE
      ?auto_4175 - SURFACE
    )
    :vars
    (
      ?auto_4176 - HOIST
      ?auto_4177 - PLACE
      ?auto_4179 - PLACE
      ?auto_4180 - HOIST
      ?auto_4181 - SURFACE
      ?auto_4178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4176 ?auto_4177 ) ( SURFACE-AT ?auto_4174 ?auto_4177 ) ( CLEAR ?auto_4174 ) ( IS-CRATE ?auto_4175 ) ( AVAILABLE ?auto_4176 ) ( not ( = ?auto_4179 ?auto_4177 ) ) ( HOIST-AT ?auto_4180 ?auto_4179 ) ( AVAILABLE ?auto_4180 ) ( SURFACE-AT ?auto_4175 ?auto_4179 ) ( ON ?auto_4175 ?auto_4181 ) ( CLEAR ?auto_4175 ) ( TRUCK-AT ?auto_4178 ?auto_4177 ) ( not ( = ?auto_4174 ?auto_4175 ) ) ( not ( = ?auto_4174 ?auto_4181 ) ) ( not ( = ?auto_4175 ?auto_4181 ) ) ( not ( = ?auto_4176 ?auto_4180 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4178 ?auto_4177 ?auto_4179 )
      ( !LIFT ?auto_4180 ?auto_4175 ?auto_4181 ?auto_4179 )
      ( !LOAD ?auto_4180 ?auto_4175 ?auto_4178 ?auto_4179 )
      ( !DRIVE ?auto_4178 ?auto_4179 ?auto_4177 )
      ( !UNLOAD ?auto_4176 ?auto_4175 ?auto_4178 ?auto_4177 )
      ( !DROP ?auto_4176 ?auto_4175 ?auto_4174 ?auto_4177 )
      ( MAKE-1CRATE-VERIFY ?auto_4174 ?auto_4175 ) )
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
      ?auto_4192 - HOIST
      ?auto_4191 - PLACE
      ?auto_4189 - PLACE
      ?auto_4190 - HOIST
      ?auto_4188 - SURFACE
      ?auto_4196 - PLACE
      ?auto_4194 - HOIST
      ?auto_4195 - SURFACE
      ?auto_4193 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4192 ?auto_4191 ) ( IS-CRATE ?auto_4187 ) ( not ( = ?auto_4189 ?auto_4191 ) ) ( HOIST-AT ?auto_4190 ?auto_4189 ) ( AVAILABLE ?auto_4190 ) ( SURFACE-AT ?auto_4187 ?auto_4189 ) ( ON ?auto_4187 ?auto_4188 ) ( CLEAR ?auto_4187 ) ( not ( = ?auto_4186 ?auto_4187 ) ) ( not ( = ?auto_4186 ?auto_4188 ) ) ( not ( = ?auto_4187 ?auto_4188 ) ) ( not ( = ?auto_4192 ?auto_4190 ) ) ( SURFACE-AT ?auto_4185 ?auto_4191 ) ( CLEAR ?auto_4185 ) ( IS-CRATE ?auto_4186 ) ( AVAILABLE ?auto_4192 ) ( not ( = ?auto_4196 ?auto_4191 ) ) ( HOIST-AT ?auto_4194 ?auto_4196 ) ( AVAILABLE ?auto_4194 ) ( SURFACE-AT ?auto_4186 ?auto_4196 ) ( ON ?auto_4186 ?auto_4195 ) ( CLEAR ?auto_4186 ) ( TRUCK-AT ?auto_4193 ?auto_4191 ) ( not ( = ?auto_4185 ?auto_4186 ) ) ( not ( = ?auto_4185 ?auto_4195 ) ) ( not ( = ?auto_4186 ?auto_4195 ) ) ( not ( = ?auto_4192 ?auto_4194 ) ) ( not ( = ?auto_4185 ?auto_4187 ) ) ( not ( = ?auto_4185 ?auto_4188 ) ) ( not ( = ?auto_4187 ?auto_4195 ) ) ( not ( = ?auto_4189 ?auto_4196 ) ) ( not ( = ?auto_4190 ?auto_4194 ) ) ( not ( = ?auto_4188 ?auto_4195 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4185 ?auto_4186 )
      ( MAKE-1CRATE ?auto_4186 ?auto_4187 )
      ( MAKE-2CRATE-VERIFY ?auto_4185 ?auto_4186 ?auto_4187 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4199 - SURFACE
      ?auto_4200 - SURFACE
    )
    :vars
    (
      ?auto_4201 - HOIST
      ?auto_4202 - PLACE
      ?auto_4204 - PLACE
      ?auto_4205 - HOIST
      ?auto_4206 - SURFACE
      ?auto_4203 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4201 ?auto_4202 ) ( SURFACE-AT ?auto_4199 ?auto_4202 ) ( CLEAR ?auto_4199 ) ( IS-CRATE ?auto_4200 ) ( AVAILABLE ?auto_4201 ) ( not ( = ?auto_4204 ?auto_4202 ) ) ( HOIST-AT ?auto_4205 ?auto_4204 ) ( AVAILABLE ?auto_4205 ) ( SURFACE-AT ?auto_4200 ?auto_4204 ) ( ON ?auto_4200 ?auto_4206 ) ( CLEAR ?auto_4200 ) ( TRUCK-AT ?auto_4203 ?auto_4202 ) ( not ( = ?auto_4199 ?auto_4200 ) ) ( not ( = ?auto_4199 ?auto_4206 ) ) ( not ( = ?auto_4200 ?auto_4206 ) ) ( not ( = ?auto_4201 ?auto_4205 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4203 ?auto_4202 ?auto_4204 )
      ( !LIFT ?auto_4205 ?auto_4200 ?auto_4206 ?auto_4204 )
      ( !LOAD ?auto_4205 ?auto_4200 ?auto_4203 ?auto_4204 )
      ( !DRIVE ?auto_4203 ?auto_4204 ?auto_4202 )
      ( !UNLOAD ?auto_4201 ?auto_4200 ?auto_4203 ?auto_4202 )
      ( !DROP ?auto_4201 ?auto_4200 ?auto_4199 ?auto_4202 )
      ( MAKE-1CRATE-VERIFY ?auto_4199 ?auto_4200 ) )
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
      ?auto_4218 - PLACE
      ?auto_4219 - PLACE
      ?auto_4220 - HOIST
      ?auto_4216 - SURFACE
      ?auto_4221 - PLACE
      ?auto_4226 - HOIST
      ?auto_4223 - SURFACE
      ?auto_4225 - PLACE
      ?auto_4222 - HOIST
      ?auto_4224 - SURFACE
      ?auto_4215 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4217 ?auto_4218 ) ( IS-CRATE ?auto_4214 ) ( not ( = ?auto_4219 ?auto_4218 ) ) ( HOIST-AT ?auto_4220 ?auto_4219 ) ( AVAILABLE ?auto_4220 ) ( SURFACE-AT ?auto_4214 ?auto_4219 ) ( ON ?auto_4214 ?auto_4216 ) ( CLEAR ?auto_4214 ) ( not ( = ?auto_4213 ?auto_4214 ) ) ( not ( = ?auto_4213 ?auto_4216 ) ) ( not ( = ?auto_4214 ?auto_4216 ) ) ( not ( = ?auto_4217 ?auto_4220 ) ) ( IS-CRATE ?auto_4213 ) ( not ( = ?auto_4221 ?auto_4218 ) ) ( HOIST-AT ?auto_4226 ?auto_4221 ) ( AVAILABLE ?auto_4226 ) ( SURFACE-AT ?auto_4213 ?auto_4221 ) ( ON ?auto_4213 ?auto_4223 ) ( CLEAR ?auto_4213 ) ( not ( = ?auto_4212 ?auto_4213 ) ) ( not ( = ?auto_4212 ?auto_4223 ) ) ( not ( = ?auto_4213 ?auto_4223 ) ) ( not ( = ?auto_4217 ?auto_4226 ) ) ( SURFACE-AT ?auto_4211 ?auto_4218 ) ( CLEAR ?auto_4211 ) ( IS-CRATE ?auto_4212 ) ( AVAILABLE ?auto_4217 ) ( not ( = ?auto_4225 ?auto_4218 ) ) ( HOIST-AT ?auto_4222 ?auto_4225 ) ( AVAILABLE ?auto_4222 ) ( SURFACE-AT ?auto_4212 ?auto_4225 ) ( ON ?auto_4212 ?auto_4224 ) ( CLEAR ?auto_4212 ) ( TRUCK-AT ?auto_4215 ?auto_4218 ) ( not ( = ?auto_4211 ?auto_4212 ) ) ( not ( = ?auto_4211 ?auto_4224 ) ) ( not ( = ?auto_4212 ?auto_4224 ) ) ( not ( = ?auto_4217 ?auto_4222 ) ) ( not ( = ?auto_4211 ?auto_4213 ) ) ( not ( = ?auto_4211 ?auto_4223 ) ) ( not ( = ?auto_4213 ?auto_4224 ) ) ( not ( = ?auto_4221 ?auto_4225 ) ) ( not ( = ?auto_4226 ?auto_4222 ) ) ( not ( = ?auto_4223 ?auto_4224 ) ) ( not ( = ?auto_4211 ?auto_4214 ) ) ( not ( = ?auto_4211 ?auto_4216 ) ) ( not ( = ?auto_4212 ?auto_4214 ) ) ( not ( = ?auto_4212 ?auto_4216 ) ) ( not ( = ?auto_4214 ?auto_4223 ) ) ( not ( = ?auto_4214 ?auto_4224 ) ) ( not ( = ?auto_4219 ?auto_4221 ) ) ( not ( = ?auto_4219 ?auto_4225 ) ) ( not ( = ?auto_4220 ?auto_4226 ) ) ( not ( = ?auto_4220 ?auto_4222 ) ) ( not ( = ?auto_4216 ?auto_4223 ) ) ( not ( = ?auto_4216 ?auto_4224 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4211 ?auto_4212 ?auto_4213 )
      ( MAKE-1CRATE ?auto_4213 ?auto_4214 )
      ( MAKE-3CRATE-VERIFY ?auto_4211 ?auto_4212 ?auto_4213 ?auto_4214 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4229 - SURFACE
      ?auto_4230 - SURFACE
    )
    :vars
    (
      ?auto_4231 - HOIST
      ?auto_4232 - PLACE
      ?auto_4234 - PLACE
      ?auto_4235 - HOIST
      ?auto_4236 - SURFACE
      ?auto_4233 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4231 ?auto_4232 ) ( SURFACE-AT ?auto_4229 ?auto_4232 ) ( CLEAR ?auto_4229 ) ( IS-CRATE ?auto_4230 ) ( AVAILABLE ?auto_4231 ) ( not ( = ?auto_4234 ?auto_4232 ) ) ( HOIST-AT ?auto_4235 ?auto_4234 ) ( AVAILABLE ?auto_4235 ) ( SURFACE-AT ?auto_4230 ?auto_4234 ) ( ON ?auto_4230 ?auto_4236 ) ( CLEAR ?auto_4230 ) ( TRUCK-AT ?auto_4233 ?auto_4232 ) ( not ( = ?auto_4229 ?auto_4230 ) ) ( not ( = ?auto_4229 ?auto_4236 ) ) ( not ( = ?auto_4230 ?auto_4236 ) ) ( not ( = ?auto_4231 ?auto_4235 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4233 ?auto_4232 ?auto_4234 )
      ( !LIFT ?auto_4235 ?auto_4230 ?auto_4236 ?auto_4234 )
      ( !LOAD ?auto_4235 ?auto_4230 ?auto_4233 ?auto_4234 )
      ( !DRIVE ?auto_4233 ?auto_4234 ?auto_4232 )
      ( !UNLOAD ?auto_4231 ?auto_4230 ?auto_4233 ?auto_4232 )
      ( !DROP ?auto_4231 ?auto_4230 ?auto_4229 ?auto_4232 )
      ( MAKE-1CRATE-VERIFY ?auto_4229 ?auto_4230 ) )
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
      ?auto_4250 - HOIST
      ?auto_4251 - PLACE
      ?auto_4249 - PLACE
      ?auto_4248 - HOIST
      ?auto_4252 - SURFACE
      ?auto_4257 - PLACE
      ?auto_4255 - HOIST
      ?auto_4256 - SURFACE
      ?auto_4259 - SURFACE
      ?auto_4258 - PLACE
      ?auto_4254 - HOIST
      ?auto_4253 - SURFACE
      ?auto_4247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4250 ?auto_4251 ) ( IS-CRATE ?auto_4246 ) ( not ( = ?auto_4249 ?auto_4251 ) ) ( HOIST-AT ?auto_4248 ?auto_4249 ) ( SURFACE-AT ?auto_4246 ?auto_4249 ) ( ON ?auto_4246 ?auto_4252 ) ( CLEAR ?auto_4246 ) ( not ( = ?auto_4245 ?auto_4246 ) ) ( not ( = ?auto_4245 ?auto_4252 ) ) ( not ( = ?auto_4246 ?auto_4252 ) ) ( not ( = ?auto_4250 ?auto_4248 ) ) ( IS-CRATE ?auto_4245 ) ( not ( = ?auto_4257 ?auto_4251 ) ) ( HOIST-AT ?auto_4255 ?auto_4257 ) ( AVAILABLE ?auto_4255 ) ( SURFACE-AT ?auto_4245 ?auto_4257 ) ( ON ?auto_4245 ?auto_4256 ) ( CLEAR ?auto_4245 ) ( not ( = ?auto_4244 ?auto_4245 ) ) ( not ( = ?auto_4244 ?auto_4256 ) ) ( not ( = ?auto_4245 ?auto_4256 ) ) ( not ( = ?auto_4250 ?auto_4255 ) ) ( IS-CRATE ?auto_4244 ) ( AVAILABLE ?auto_4248 ) ( SURFACE-AT ?auto_4244 ?auto_4249 ) ( ON ?auto_4244 ?auto_4259 ) ( CLEAR ?auto_4244 ) ( not ( = ?auto_4243 ?auto_4244 ) ) ( not ( = ?auto_4243 ?auto_4259 ) ) ( not ( = ?auto_4244 ?auto_4259 ) ) ( SURFACE-AT ?auto_4242 ?auto_4251 ) ( CLEAR ?auto_4242 ) ( IS-CRATE ?auto_4243 ) ( AVAILABLE ?auto_4250 ) ( not ( = ?auto_4258 ?auto_4251 ) ) ( HOIST-AT ?auto_4254 ?auto_4258 ) ( AVAILABLE ?auto_4254 ) ( SURFACE-AT ?auto_4243 ?auto_4258 ) ( ON ?auto_4243 ?auto_4253 ) ( CLEAR ?auto_4243 ) ( TRUCK-AT ?auto_4247 ?auto_4251 ) ( not ( = ?auto_4242 ?auto_4243 ) ) ( not ( = ?auto_4242 ?auto_4253 ) ) ( not ( = ?auto_4243 ?auto_4253 ) ) ( not ( = ?auto_4250 ?auto_4254 ) ) ( not ( = ?auto_4242 ?auto_4244 ) ) ( not ( = ?auto_4242 ?auto_4259 ) ) ( not ( = ?auto_4244 ?auto_4253 ) ) ( not ( = ?auto_4249 ?auto_4258 ) ) ( not ( = ?auto_4248 ?auto_4254 ) ) ( not ( = ?auto_4259 ?auto_4253 ) ) ( not ( = ?auto_4242 ?auto_4245 ) ) ( not ( = ?auto_4242 ?auto_4256 ) ) ( not ( = ?auto_4243 ?auto_4245 ) ) ( not ( = ?auto_4243 ?auto_4256 ) ) ( not ( = ?auto_4245 ?auto_4259 ) ) ( not ( = ?auto_4245 ?auto_4253 ) ) ( not ( = ?auto_4257 ?auto_4249 ) ) ( not ( = ?auto_4257 ?auto_4258 ) ) ( not ( = ?auto_4255 ?auto_4248 ) ) ( not ( = ?auto_4255 ?auto_4254 ) ) ( not ( = ?auto_4256 ?auto_4259 ) ) ( not ( = ?auto_4256 ?auto_4253 ) ) ( not ( = ?auto_4242 ?auto_4246 ) ) ( not ( = ?auto_4242 ?auto_4252 ) ) ( not ( = ?auto_4243 ?auto_4246 ) ) ( not ( = ?auto_4243 ?auto_4252 ) ) ( not ( = ?auto_4244 ?auto_4246 ) ) ( not ( = ?auto_4244 ?auto_4252 ) ) ( not ( = ?auto_4246 ?auto_4256 ) ) ( not ( = ?auto_4246 ?auto_4259 ) ) ( not ( = ?auto_4246 ?auto_4253 ) ) ( not ( = ?auto_4252 ?auto_4256 ) ) ( not ( = ?auto_4252 ?auto_4259 ) ) ( not ( = ?auto_4252 ?auto_4253 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_4242 ?auto_4243 ?auto_4244 ?auto_4245 )
      ( MAKE-1CRATE ?auto_4245 ?auto_4246 )
      ( MAKE-4CRATE-VERIFY ?auto_4242 ?auto_4243 ?auto_4244 ?auto_4245 ?auto_4246 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4262 - SURFACE
      ?auto_4263 - SURFACE
    )
    :vars
    (
      ?auto_4264 - HOIST
      ?auto_4265 - PLACE
      ?auto_4267 - PLACE
      ?auto_4268 - HOIST
      ?auto_4269 - SURFACE
      ?auto_4266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4264 ?auto_4265 ) ( SURFACE-AT ?auto_4262 ?auto_4265 ) ( CLEAR ?auto_4262 ) ( IS-CRATE ?auto_4263 ) ( AVAILABLE ?auto_4264 ) ( not ( = ?auto_4267 ?auto_4265 ) ) ( HOIST-AT ?auto_4268 ?auto_4267 ) ( AVAILABLE ?auto_4268 ) ( SURFACE-AT ?auto_4263 ?auto_4267 ) ( ON ?auto_4263 ?auto_4269 ) ( CLEAR ?auto_4263 ) ( TRUCK-AT ?auto_4266 ?auto_4265 ) ( not ( = ?auto_4262 ?auto_4263 ) ) ( not ( = ?auto_4262 ?auto_4269 ) ) ( not ( = ?auto_4263 ?auto_4269 ) ) ( not ( = ?auto_4264 ?auto_4268 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4266 ?auto_4265 ?auto_4267 )
      ( !LIFT ?auto_4268 ?auto_4263 ?auto_4269 ?auto_4267 )
      ( !LOAD ?auto_4268 ?auto_4263 ?auto_4266 ?auto_4267 )
      ( !DRIVE ?auto_4266 ?auto_4267 ?auto_4265 )
      ( !UNLOAD ?auto_4264 ?auto_4263 ?auto_4266 ?auto_4265 )
      ( !DROP ?auto_4264 ?auto_4263 ?auto_4262 ?auto_4265 )
      ( MAKE-1CRATE-VERIFY ?auto_4262 ?auto_4263 ) )
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
      ?auto_4285 - HOIST
      ?auto_4286 - PLACE
      ?auto_4284 - PLACE
      ?auto_4283 - HOIST
      ?auto_4287 - SURFACE
      ?auto_4289 - PLACE
      ?auto_4293 - HOIST
      ?auto_4288 - SURFACE
      ?auto_4297 - PLACE
      ?auto_4292 - HOIST
      ?auto_4294 - SURFACE
      ?auto_4296 - SURFACE
      ?auto_4290 - PLACE
      ?auto_4295 - HOIST
      ?auto_4291 - SURFACE
      ?auto_4282 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4285 ?auto_4286 ) ( IS-CRATE ?auto_4281 ) ( not ( = ?auto_4284 ?auto_4286 ) ) ( HOIST-AT ?auto_4283 ?auto_4284 ) ( AVAILABLE ?auto_4283 ) ( SURFACE-AT ?auto_4281 ?auto_4284 ) ( ON ?auto_4281 ?auto_4287 ) ( CLEAR ?auto_4281 ) ( not ( = ?auto_4280 ?auto_4281 ) ) ( not ( = ?auto_4280 ?auto_4287 ) ) ( not ( = ?auto_4281 ?auto_4287 ) ) ( not ( = ?auto_4285 ?auto_4283 ) ) ( IS-CRATE ?auto_4280 ) ( not ( = ?auto_4289 ?auto_4286 ) ) ( HOIST-AT ?auto_4293 ?auto_4289 ) ( SURFACE-AT ?auto_4280 ?auto_4289 ) ( ON ?auto_4280 ?auto_4288 ) ( CLEAR ?auto_4280 ) ( not ( = ?auto_4279 ?auto_4280 ) ) ( not ( = ?auto_4279 ?auto_4288 ) ) ( not ( = ?auto_4280 ?auto_4288 ) ) ( not ( = ?auto_4285 ?auto_4293 ) ) ( IS-CRATE ?auto_4279 ) ( not ( = ?auto_4297 ?auto_4286 ) ) ( HOIST-AT ?auto_4292 ?auto_4297 ) ( AVAILABLE ?auto_4292 ) ( SURFACE-AT ?auto_4279 ?auto_4297 ) ( ON ?auto_4279 ?auto_4294 ) ( CLEAR ?auto_4279 ) ( not ( = ?auto_4278 ?auto_4279 ) ) ( not ( = ?auto_4278 ?auto_4294 ) ) ( not ( = ?auto_4279 ?auto_4294 ) ) ( not ( = ?auto_4285 ?auto_4292 ) ) ( IS-CRATE ?auto_4278 ) ( AVAILABLE ?auto_4293 ) ( SURFACE-AT ?auto_4278 ?auto_4289 ) ( ON ?auto_4278 ?auto_4296 ) ( CLEAR ?auto_4278 ) ( not ( = ?auto_4277 ?auto_4278 ) ) ( not ( = ?auto_4277 ?auto_4296 ) ) ( not ( = ?auto_4278 ?auto_4296 ) ) ( SURFACE-AT ?auto_4276 ?auto_4286 ) ( CLEAR ?auto_4276 ) ( IS-CRATE ?auto_4277 ) ( AVAILABLE ?auto_4285 ) ( not ( = ?auto_4290 ?auto_4286 ) ) ( HOIST-AT ?auto_4295 ?auto_4290 ) ( AVAILABLE ?auto_4295 ) ( SURFACE-AT ?auto_4277 ?auto_4290 ) ( ON ?auto_4277 ?auto_4291 ) ( CLEAR ?auto_4277 ) ( TRUCK-AT ?auto_4282 ?auto_4286 ) ( not ( = ?auto_4276 ?auto_4277 ) ) ( not ( = ?auto_4276 ?auto_4291 ) ) ( not ( = ?auto_4277 ?auto_4291 ) ) ( not ( = ?auto_4285 ?auto_4295 ) ) ( not ( = ?auto_4276 ?auto_4278 ) ) ( not ( = ?auto_4276 ?auto_4296 ) ) ( not ( = ?auto_4278 ?auto_4291 ) ) ( not ( = ?auto_4289 ?auto_4290 ) ) ( not ( = ?auto_4293 ?auto_4295 ) ) ( not ( = ?auto_4296 ?auto_4291 ) ) ( not ( = ?auto_4276 ?auto_4279 ) ) ( not ( = ?auto_4276 ?auto_4294 ) ) ( not ( = ?auto_4277 ?auto_4279 ) ) ( not ( = ?auto_4277 ?auto_4294 ) ) ( not ( = ?auto_4279 ?auto_4296 ) ) ( not ( = ?auto_4279 ?auto_4291 ) ) ( not ( = ?auto_4297 ?auto_4289 ) ) ( not ( = ?auto_4297 ?auto_4290 ) ) ( not ( = ?auto_4292 ?auto_4293 ) ) ( not ( = ?auto_4292 ?auto_4295 ) ) ( not ( = ?auto_4294 ?auto_4296 ) ) ( not ( = ?auto_4294 ?auto_4291 ) ) ( not ( = ?auto_4276 ?auto_4280 ) ) ( not ( = ?auto_4276 ?auto_4288 ) ) ( not ( = ?auto_4277 ?auto_4280 ) ) ( not ( = ?auto_4277 ?auto_4288 ) ) ( not ( = ?auto_4278 ?auto_4280 ) ) ( not ( = ?auto_4278 ?auto_4288 ) ) ( not ( = ?auto_4280 ?auto_4294 ) ) ( not ( = ?auto_4280 ?auto_4296 ) ) ( not ( = ?auto_4280 ?auto_4291 ) ) ( not ( = ?auto_4288 ?auto_4294 ) ) ( not ( = ?auto_4288 ?auto_4296 ) ) ( not ( = ?auto_4288 ?auto_4291 ) ) ( not ( = ?auto_4276 ?auto_4281 ) ) ( not ( = ?auto_4276 ?auto_4287 ) ) ( not ( = ?auto_4277 ?auto_4281 ) ) ( not ( = ?auto_4277 ?auto_4287 ) ) ( not ( = ?auto_4278 ?auto_4281 ) ) ( not ( = ?auto_4278 ?auto_4287 ) ) ( not ( = ?auto_4279 ?auto_4281 ) ) ( not ( = ?auto_4279 ?auto_4287 ) ) ( not ( = ?auto_4281 ?auto_4288 ) ) ( not ( = ?auto_4281 ?auto_4294 ) ) ( not ( = ?auto_4281 ?auto_4296 ) ) ( not ( = ?auto_4281 ?auto_4291 ) ) ( not ( = ?auto_4284 ?auto_4289 ) ) ( not ( = ?auto_4284 ?auto_4297 ) ) ( not ( = ?auto_4284 ?auto_4290 ) ) ( not ( = ?auto_4283 ?auto_4293 ) ) ( not ( = ?auto_4283 ?auto_4292 ) ) ( not ( = ?auto_4283 ?auto_4295 ) ) ( not ( = ?auto_4287 ?auto_4288 ) ) ( not ( = ?auto_4287 ?auto_4294 ) ) ( not ( = ?auto_4287 ?auto_4296 ) ) ( not ( = ?auto_4287 ?auto_4291 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4276 ?auto_4277 ?auto_4278 ?auto_4279 ?auto_4280 )
      ( MAKE-1CRATE ?auto_4280 ?auto_4281 )
      ( MAKE-5CRATE-VERIFY ?auto_4276 ?auto_4277 ?auto_4278 ?auto_4279 ?auto_4280 ?auto_4281 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4300 - SURFACE
      ?auto_4301 - SURFACE
    )
    :vars
    (
      ?auto_4302 - HOIST
      ?auto_4303 - PLACE
      ?auto_4305 - PLACE
      ?auto_4306 - HOIST
      ?auto_4307 - SURFACE
      ?auto_4304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4302 ?auto_4303 ) ( SURFACE-AT ?auto_4300 ?auto_4303 ) ( CLEAR ?auto_4300 ) ( IS-CRATE ?auto_4301 ) ( AVAILABLE ?auto_4302 ) ( not ( = ?auto_4305 ?auto_4303 ) ) ( HOIST-AT ?auto_4306 ?auto_4305 ) ( AVAILABLE ?auto_4306 ) ( SURFACE-AT ?auto_4301 ?auto_4305 ) ( ON ?auto_4301 ?auto_4307 ) ( CLEAR ?auto_4301 ) ( TRUCK-AT ?auto_4304 ?auto_4303 ) ( not ( = ?auto_4300 ?auto_4301 ) ) ( not ( = ?auto_4300 ?auto_4307 ) ) ( not ( = ?auto_4301 ?auto_4307 ) ) ( not ( = ?auto_4302 ?auto_4306 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4304 ?auto_4303 ?auto_4305 )
      ( !LIFT ?auto_4306 ?auto_4301 ?auto_4307 ?auto_4305 )
      ( !LOAD ?auto_4306 ?auto_4301 ?auto_4304 ?auto_4305 )
      ( !DRIVE ?auto_4304 ?auto_4305 ?auto_4303 )
      ( !UNLOAD ?auto_4302 ?auto_4301 ?auto_4304 ?auto_4303 )
      ( !DROP ?auto_4302 ?auto_4301 ?auto_4300 ?auto_4303 )
      ( MAKE-1CRATE-VERIFY ?auto_4300 ?auto_4301 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_4315 - SURFACE
      ?auto_4316 - SURFACE
      ?auto_4317 - SURFACE
      ?auto_4318 - SURFACE
      ?auto_4319 - SURFACE
      ?auto_4321 - SURFACE
      ?auto_4320 - SURFACE
    )
    :vars
    (
      ?auto_4323 - HOIST
      ?auto_4322 - PLACE
      ?auto_4326 - PLACE
      ?auto_4325 - HOIST
      ?auto_4324 - SURFACE
      ?auto_4339 - PLACE
      ?auto_4329 - HOIST
      ?auto_4334 - SURFACE
      ?auto_4340 - PLACE
      ?auto_4336 - HOIST
      ?auto_4335 - SURFACE
      ?auto_4328 - PLACE
      ?auto_4338 - HOIST
      ?auto_4337 - SURFACE
      ?auto_4332 - SURFACE
      ?auto_4331 - PLACE
      ?auto_4333 - HOIST
      ?auto_4330 - SURFACE
      ?auto_4327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4323 ?auto_4322 ) ( IS-CRATE ?auto_4320 ) ( not ( = ?auto_4326 ?auto_4322 ) ) ( HOIST-AT ?auto_4325 ?auto_4326 ) ( AVAILABLE ?auto_4325 ) ( SURFACE-AT ?auto_4320 ?auto_4326 ) ( ON ?auto_4320 ?auto_4324 ) ( CLEAR ?auto_4320 ) ( not ( = ?auto_4321 ?auto_4320 ) ) ( not ( = ?auto_4321 ?auto_4324 ) ) ( not ( = ?auto_4320 ?auto_4324 ) ) ( not ( = ?auto_4323 ?auto_4325 ) ) ( IS-CRATE ?auto_4321 ) ( not ( = ?auto_4339 ?auto_4322 ) ) ( HOIST-AT ?auto_4329 ?auto_4339 ) ( AVAILABLE ?auto_4329 ) ( SURFACE-AT ?auto_4321 ?auto_4339 ) ( ON ?auto_4321 ?auto_4334 ) ( CLEAR ?auto_4321 ) ( not ( = ?auto_4319 ?auto_4321 ) ) ( not ( = ?auto_4319 ?auto_4334 ) ) ( not ( = ?auto_4321 ?auto_4334 ) ) ( not ( = ?auto_4323 ?auto_4329 ) ) ( IS-CRATE ?auto_4319 ) ( not ( = ?auto_4340 ?auto_4322 ) ) ( HOIST-AT ?auto_4336 ?auto_4340 ) ( SURFACE-AT ?auto_4319 ?auto_4340 ) ( ON ?auto_4319 ?auto_4335 ) ( CLEAR ?auto_4319 ) ( not ( = ?auto_4318 ?auto_4319 ) ) ( not ( = ?auto_4318 ?auto_4335 ) ) ( not ( = ?auto_4319 ?auto_4335 ) ) ( not ( = ?auto_4323 ?auto_4336 ) ) ( IS-CRATE ?auto_4318 ) ( not ( = ?auto_4328 ?auto_4322 ) ) ( HOIST-AT ?auto_4338 ?auto_4328 ) ( AVAILABLE ?auto_4338 ) ( SURFACE-AT ?auto_4318 ?auto_4328 ) ( ON ?auto_4318 ?auto_4337 ) ( CLEAR ?auto_4318 ) ( not ( = ?auto_4317 ?auto_4318 ) ) ( not ( = ?auto_4317 ?auto_4337 ) ) ( not ( = ?auto_4318 ?auto_4337 ) ) ( not ( = ?auto_4323 ?auto_4338 ) ) ( IS-CRATE ?auto_4317 ) ( AVAILABLE ?auto_4336 ) ( SURFACE-AT ?auto_4317 ?auto_4340 ) ( ON ?auto_4317 ?auto_4332 ) ( CLEAR ?auto_4317 ) ( not ( = ?auto_4316 ?auto_4317 ) ) ( not ( = ?auto_4316 ?auto_4332 ) ) ( not ( = ?auto_4317 ?auto_4332 ) ) ( SURFACE-AT ?auto_4315 ?auto_4322 ) ( CLEAR ?auto_4315 ) ( IS-CRATE ?auto_4316 ) ( AVAILABLE ?auto_4323 ) ( not ( = ?auto_4331 ?auto_4322 ) ) ( HOIST-AT ?auto_4333 ?auto_4331 ) ( AVAILABLE ?auto_4333 ) ( SURFACE-AT ?auto_4316 ?auto_4331 ) ( ON ?auto_4316 ?auto_4330 ) ( CLEAR ?auto_4316 ) ( TRUCK-AT ?auto_4327 ?auto_4322 ) ( not ( = ?auto_4315 ?auto_4316 ) ) ( not ( = ?auto_4315 ?auto_4330 ) ) ( not ( = ?auto_4316 ?auto_4330 ) ) ( not ( = ?auto_4323 ?auto_4333 ) ) ( not ( = ?auto_4315 ?auto_4317 ) ) ( not ( = ?auto_4315 ?auto_4332 ) ) ( not ( = ?auto_4317 ?auto_4330 ) ) ( not ( = ?auto_4340 ?auto_4331 ) ) ( not ( = ?auto_4336 ?auto_4333 ) ) ( not ( = ?auto_4332 ?auto_4330 ) ) ( not ( = ?auto_4315 ?auto_4318 ) ) ( not ( = ?auto_4315 ?auto_4337 ) ) ( not ( = ?auto_4316 ?auto_4318 ) ) ( not ( = ?auto_4316 ?auto_4337 ) ) ( not ( = ?auto_4318 ?auto_4332 ) ) ( not ( = ?auto_4318 ?auto_4330 ) ) ( not ( = ?auto_4328 ?auto_4340 ) ) ( not ( = ?auto_4328 ?auto_4331 ) ) ( not ( = ?auto_4338 ?auto_4336 ) ) ( not ( = ?auto_4338 ?auto_4333 ) ) ( not ( = ?auto_4337 ?auto_4332 ) ) ( not ( = ?auto_4337 ?auto_4330 ) ) ( not ( = ?auto_4315 ?auto_4319 ) ) ( not ( = ?auto_4315 ?auto_4335 ) ) ( not ( = ?auto_4316 ?auto_4319 ) ) ( not ( = ?auto_4316 ?auto_4335 ) ) ( not ( = ?auto_4317 ?auto_4319 ) ) ( not ( = ?auto_4317 ?auto_4335 ) ) ( not ( = ?auto_4319 ?auto_4337 ) ) ( not ( = ?auto_4319 ?auto_4332 ) ) ( not ( = ?auto_4319 ?auto_4330 ) ) ( not ( = ?auto_4335 ?auto_4337 ) ) ( not ( = ?auto_4335 ?auto_4332 ) ) ( not ( = ?auto_4335 ?auto_4330 ) ) ( not ( = ?auto_4315 ?auto_4321 ) ) ( not ( = ?auto_4315 ?auto_4334 ) ) ( not ( = ?auto_4316 ?auto_4321 ) ) ( not ( = ?auto_4316 ?auto_4334 ) ) ( not ( = ?auto_4317 ?auto_4321 ) ) ( not ( = ?auto_4317 ?auto_4334 ) ) ( not ( = ?auto_4318 ?auto_4321 ) ) ( not ( = ?auto_4318 ?auto_4334 ) ) ( not ( = ?auto_4321 ?auto_4335 ) ) ( not ( = ?auto_4321 ?auto_4337 ) ) ( not ( = ?auto_4321 ?auto_4332 ) ) ( not ( = ?auto_4321 ?auto_4330 ) ) ( not ( = ?auto_4339 ?auto_4340 ) ) ( not ( = ?auto_4339 ?auto_4328 ) ) ( not ( = ?auto_4339 ?auto_4331 ) ) ( not ( = ?auto_4329 ?auto_4336 ) ) ( not ( = ?auto_4329 ?auto_4338 ) ) ( not ( = ?auto_4329 ?auto_4333 ) ) ( not ( = ?auto_4334 ?auto_4335 ) ) ( not ( = ?auto_4334 ?auto_4337 ) ) ( not ( = ?auto_4334 ?auto_4332 ) ) ( not ( = ?auto_4334 ?auto_4330 ) ) ( not ( = ?auto_4315 ?auto_4320 ) ) ( not ( = ?auto_4315 ?auto_4324 ) ) ( not ( = ?auto_4316 ?auto_4320 ) ) ( not ( = ?auto_4316 ?auto_4324 ) ) ( not ( = ?auto_4317 ?auto_4320 ) ) ( not ( = ?auto_4317 ?auto_4324 ) ) ( not ( = ?auto_4318 ?auto_4320 ) ) ( not ( = ?auto_4318 ?auto_4324 ) ) ( not ( = ?auto_4319 ?auto_4320 ) ) ( not ( = ?auto_4319 ?auto_4324 ) ) ( not ( = ?auto_4320 ?auto_4334 ) ) ( not ( = ?auto_4320 ?auto_4335 ) ) ( not ( = ?auto_4320 ?auto_4337 ) ) ( not ( = ?auto_4320 ?auto_4332 ) ) ( not ( = ?auto_4320 ?auto_4330 ) ) ( not ( = ?auto_4326 ?auto_4339 ) ) ( not ( = ?auto_4326 ?auto_4340 ) ) ( not ( = ?auto_4326 ?auto_4328 ) ) ( not ( = ?auto_4326 ?auto_4331 ) ) ( not ( = ?auto_4325 ?auto_4329 ) ) ( not ( = ?auto_4325 ?auto_4336 ) ) ( not ( = ?auto_4325 ?auto_4338 ) ) ( not ( = ?auto_4325 ?auto_4333 ) ) ( not ( = ?auto_4324 ?auto_4334 ) ) ( not ( = ?auto_4324 ?auto_4335 ) ) ( not ( = ?auto_4324 ?auto_4337 ) ) ( not ( = ?auto_4324 ?auto_4332 ) ) ( not ( = ?auto_4324 ?auto_4330 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4315 ?auto_4316 ?auto_4317 ?auto_4318 ?auto_4319 ?auto_4321 )
      ( MAKE-1CRATE ?auto_4321 ?auto_4320 )
      ( MAKE-6CRATE-VERIFY ?auto_4315 ?auto_4316 ?auto_4317 ?auto_4318 ?auto_4319 ?auto_4321 ?auto_4320 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4343 - SURFACE
      ?auto_4344 - SURFACE
    )
    :vars
    (
      ?auto_4345 - HOIST
      ?auto_4346 - PLACE
      ?auto_4348 - PLACE
      ?auto_4349 - HOIST
      ?auto_4350 - SURFACE
      ?auto_4347 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4345 ?auto_4346 ) ( SURFACE-AT ?auto_4343 ?auto_4346 ) ( CLEAR ?auto_4343 ) ( IS-CRATE ?auto_4344 ) ( AVAILABLE ?auto_4345 ) ( not ( = ?auto_4348 ?auto_4346 ) ) ( HOIST-AT ?auto_4349 ?auto_4348 ) ( AVAILABLE ?auto_4349 ) ( SURFACE-AT ?auto_4344 ?auto_4348 ) ( ON ?auto_4344 ?auto_4350 ) ( CLEAR ?auto_4344 ) ( TRUCK-AT ?auto_4347 ?auto_4346 ) ( not ( = ?auto_4343 ?auto_4344 ) ) ( not ( = ?auto_4343 ?auto_4350 ) ) ( not ( = ?auto_4344 ?auto_4350 ) ) ( not ( = ?auto_4345 ?auto_4349 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4347 ?auto_4346 ?auto_4348 )
      ( !LIFT ?auto_4349 ?auto_4344 ?auto_4350 ?auto_4348 )
      ( !LOAD ?auto_4349 ?auto_4344 ?auto_4347 ?auto_4348 )
      ( !DRIVE ?auto_4347 ?auto_4348 ?auto_4346 )
      ( !UNLOAD ?auto_4345 ?auto_4344 ?auto_4347 ?auto_4346 )
      ( !DROP ?auto_4345 ?auto_4344 ?auto_4343 ?auto_4346 )
      ( MAKE-1CRATE-VERIFY ?auto_4343 ?auto_4344 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_4359 - SURFACE
      ?auto_4360 - SURFACE
      ?auto_4361 - SURFACE
      ?auto_4362 - SURFACE
      ?auto_4363 - SURFACE
      ?auto_4365 - SURFACE
      ?auto_4364 - SURFACE
      ?auto_4366 - SURFACE
    )
    :vars
    (
      ?auto_4369 - HOIST
      ?auto_4370 - PLACE
      ?auto_4368 - PLACE
      ?auto_4372 - HOIST
      ?auto_4371 - SURFACE
      ?auto_4379 - PLACE
      ?auto_4378 - HOIST
      ?auto_4374 - SURFACE
      ?auto_4383 - PLACE
      ?auto_4377 - HOIST
      ?auto_4386 - SURFACE
      ?auto_4384 - PLACE
      ?auto_4380 - HOIST
      ?auto_4385 - SURFACE
      ?auto_4375 - PLACE
      ?auto_4381 - HOIST
      ?auto_4382 - SURFACE
      ?auto_4388 - SURFACE
      ?auto_4376 - PLACE
      ?auto_4387 - HOIST
      ?auto_4373 - SURFACE
      ?auto_4367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4369 ?auto_4370 ) ( IS-CRATE ?auto_4366 ) ( not ( = ?auto_4368 ?auto_4370 ) ) ( HOIST-AT ?auto_4372 ?auto_4368 ) ( AVAILABLE ?auto_4372 ) ( SURFACE-AT ?auto_4366 ?auto_4368 ) ( ON ?auto_4366 ?auto_4371 ) ( CLEAR ?auto_4366 ) ( not ( = ?auto_4364 ?auto_4366 ) ) ( not ( = ?auto_4364 ?auto_4371 ) ) ( not ( = ?auto_4366 ?auto_4371 ) ) ( not ( = ?auto_4369 ?auto_4372 ) ) ( IS-CRATE ?auto_4364 ) ( not ( = ?auto_4379 ?auto_4370 ) ) ( HOIST-AT ?auto_4378 ?auto_4379 ) ( AVAILABLE ?auto_4378 ) ( SURFACE-AT ?auto_4364 ?auto_4379 ) ( ON ?auto_4364 ?auto_4374 ) ( CLEAR ?auto_4364 ) ( not ( = ?auto_4365 ?auto_4364 ) ) ( not ( = ?auto_4365 ?auto_4374 ) ) ( not ( = ?auto_4364 ?auto_4374 ) ) ( not ( = ?auto_4369 ?auto_4378 ) ) ( IS-CRATE ?auto_4365 ) ( not ( = ?auto_4383 ?auto_4370 ) ) ( HOIST-AT ?auto_4377 ?auto_4383 ) ( AVAILABLE ?auto_4377 ) ( SURFACE-AT ?auto_4365 ?auto_4383 ) ( ON ?auto_4365 ?auto_4386 ) ( CLEAR ?auto_4365 ) ( not ( = ?auto_4363 ?auto_4365 ) ) ( not ( = ?auto_4363 ?auto_4386 ) ) ( not ( = ?auto_4365 ?auto_4386 ) ) ( not ( = ?auto_4369 ?auto_4377 ) ) ( IS-CRATE ?auto_4363 ) ( not ( = ?auto_4384 ?auto_4370 ) ) ( HOIST-AT ?auto_4380 ?auto_4384 ) ( SURFACE-AT ?auto_4363 ?auto_4384 ) ( ON ?auto_4363 ?auto_4385 ) ( CLEAR ?auto_4363 ) ( not ( = ?auto_4362 ?auto_4363 ) ) ( not ( = ?auto_4362 ?auto_4385 ) ) ( not ( = ?auto_4363 ?auto_4385 ) ) ( not ( = ?auto_4369 ?auto_4380 ) ) ( IS-CRATE ?auto_4362 ) ( not ( = ?auto_4375 ?auto_4370 ) ) ( HOIST-AT ?auto_4381 ?auto_4375 ) ( AVAILABLE ?auto_4381 ) ( SURFACE-AT ?auto_4362 ?auto_4375 ) ( ON ?auto_4362 ?auto_4382 ) ( CLEAR ?auto_4362 ) ( not ( = ?auto_4361 ?auto_4362 ) ) ( not ( = ?auto_4361 ?auto_4382 ) ) ( not ( = ?auto_4362 ?auto_4382 ) ) ( not ( = ?auto_4369 ?auto_4381 ) ) ( IS-CRATE ?auto_4361 ) ( AVAILABLE ?auto_4380 ) ( SURFACE-AT ?auto_4361 ?auto_4384 ) ( ON ?auto_4361 ?auto_4388 ) ( CLEAR ?auto_4361 ) ( not ( = ?auto_4360 ?auto_4361 ) ) ( not ( = ?auto_4360 ?auto_4388 ) ) ( not ( = ?auto_4361 ?auto_4388 ) ) ( SURFACE-AT ?auto_4359 ?auto_4370 ) ( CLEAR ?auto_4359 ) ( IS-CRATE ?auto_4360 ) ( AVAILABLE ?auto_4369 ) ( not ( = ?auto_4376 ?auto_4370 ) ) ( HOIST-AT ?auto_4387 ?auto_4376 ) ( AVAILABLE ?auto_4387 ) ( SURFACE-AT ?auto_4360 ?auto_4376 ) ( ON ?auto_4360 ?auto_4373 ) ( CLEAR ?auto_4360 ) ( TRUCK-AT ?auto_4367 ?auto_4370 ) ( not ( = ?auto_4359 ?auto_4360 ) ) ( not ( = ?auto_4359 ?auto_4373 ) ) ( not ( = ?auto_4360 ?auto_4373 ) ) ( not ( = ?auto_4369 ?auto_4387 ) ) ( not ( = ?auto_4359 ?auto_4361 ) ) ( not ( = ?auto_4359 ?auto_4388 ) ) ( not ( = ?auto_4361 ?auto_4373 ) ) ( not ( = ?auto_4384 ?auto_4376 ) ) ( not ( = ?auto_4380 ?auto_4387 ) ) ( not ( = ?auto_4388 ?auto_4373 ) ) ( not ( = ?auto_4359 ?auto_4362 ) ) ( not ( = ?auto_4359 ?auto_4382 ) ) ( not ( = ?auto_4360 ?auto_4362 ) ) ( not ( = ?auto_4360 ?auto_4382 ) ) ( not ( = ?auto_4362 ?auto_4388 ) ) ( not ( = ?auto_4362 ?auto_4373 ) ) ( not ( = ?auto_4375 ?auto_4384 ) ) ( not ( = ?auto_4375 ?auto_4376 ) ) ( not ( = ?auto_4381 ?auto_4380 ) ) ( not ( = ?auto_4381 ?auto_4387 ) ) ( not ( = ?auto_4382 ?auto_4388 ) ) ( not ( = ?auto_4382 ?auto_4373 ) ) ( not ( = ?auto_4359 ?auto_4363 ) ) ( not ( = ?auto_4359 ?auto_4385 ) ) ( not ( = ?auto_4360 ?auto_4363 ) ) ( not ( = ?auto_4360 ?auto_4385 ) ) ( not ( = ?auto_4361 ?auto_4363 ) ) ( not ( = ?auto_4361 ?auto_4385 ) ) ( not ( = ?auto_4363 ?auto_4382 ) ) ( not ( = ?auto_4363 ?auto_4388 ) ) ( not ( = ?auto_4363 ?auto_4373 ) ) ( not ( = ?auto_4385 ?auto_4382 ) ) ( not ( = ?auto_4385 ?auto_4388 ) ) ( not ( = ?auto_4385 ?auto_4373 ) ) ( not ( = ?auto_4359 ?auto_4365 ) ) ( not ( = ?auto_4359 ?auto_4386 ) ) ( not ( = ?auto_4360 ?auto_4365 ) ) ( not ( = ?auto_4360 ?auto_4386 ) ) ( not ( = ?auto_4361 ?auto_4365 ) ) ( not ( = ?auto_4361 ?auto_4386 ) ) ( not ( = ?auto_4362 ?auto_4365 ) ) ( not ( = ?auto_4362 ?auto_4386 ) ) ( not ( = ?auto_4365 ?auto_4385 ) ) ( not ( = ?auto_4365 ?auto_4382 ) ) ( not ( = ?auto_4365 ?auto_4388 ) ) ( not ( = ?auto_4365 ?auto_4373 ) ) ( not ( = ?auto_4383 ?auto_4384 ) ) ( not ( = ?auto_4383 ?auto_4375 ) ) ( not ( = ?auto_4383 ?auto_4376 ) ) ( not ( = ?auto_4377 ?auto_4380 ) ) ( not ( = ?auto_4377 ?auto_4381 ) ) ( not ( = ?auto_4377 ?auto_4387 ) ) ( not ( = ?auto_4386 ?auto_4385 ) ) ( not ( = ?auto_4386 ?auto_4382 ) ) ( not ( = ?auto_4386 ?auto_4388 ) ) ( not ( = ?auto_4386 ?auto_4373 ) ) ( not ( = ?auto_4359 ?auto_4364 ) ) ( not ( = ?auto_4359 ?auto_4374 ) ) ( not ( = ?auto_4360 ?auto_4364 ) ) ( not ( = ?auto_4360 ?auto_4374 ) ) ( not ( = ?auto_4361 ?auto_4364 ) ) ( not ( = ?auto_4361 ?auto_4374 ) ) ( not ( = ?auto_4362 ?auto_4364 ) ) ( not ( = ?auto_4362 ?auto_4374 ) ) ( not ( = ?auto_4363 ?auto_4364 ) ) ( not ( = ?auto_4363 ?auto_4374 ) ) ( not ( = ?auto_4364 ?auto_4386 ) ) ( not ( = ?auto_4364 ?auto_4385 ) ) ( not ( = ?auto_4364 ?auto_4382 ) ) ( not ( = ?auto_4364 ?auto_4388 ) ) ( not ( = ?auto_4364 ?auto_4373 ) ) ( not ( = ?auto_4379 ?auto_4383 ) ) ( not ( = ?auto_4379 ?auto_4384 ) ) ( not ( = ?auto_4379 ?auto_4375 ) ) ( not ( = ?auto_4379 ?auto_4376 ) ) ( not ( = ?auto_4378 ?auto_4377 ) ) ( not ( = ?auto_4378 ?auto_4380 ) ) ( not ( = ?auto_4378 ?auto_4381 ) ) ( not ( = ?auto_4378 ?auto_4387 ) ) ( not ( = ?auto_4374 ?auto_4386 ) ) ( not ( = ?auto_4374 ?auto_4385 ) ) ( not ( = ?auto_4374 ?auto_4382 ) ) ( not ( = ?auto_4374 ?auto_4388 ) ) ( not ( = ?auto_4374 ?auto_4373 ) ) ( not ( = ?auto_4359 ?auto_4366 ) ) ( not ( = ?auto_4359 ?auto_4371 ) ) ( not ( = ?auto_4360 ?auto_4366 ) ) ( not ( = ?auto_4360 ?auto_4371 ) ) ( not ( = ?auto_4361 ?auto_4366 ) ) ( not ( = ?auto_4361 ?auto_4371 ) ) ( not ( = ?auto_4362 ?auto_4366 ) ) ( not ( = ?auto_4362 ?auto_4371 ) ) ( not ( = ?auto_4363 ?auto_4366 ) ) ( not ( = ?auto_4363 ?auto_4371 ) ) ( not ( = ?auto_4365 ?auto_4366 ) ) ( not ( = ?auto_4365 ?auto_4371 ) ) ( not ( = ?auto_4366 ?auto_4374 ) ) ( not ( = ?auto_4366 ?auto_4386 ) ) ( not ( = ?auto_4366 ?auto_4385 ) ) ( not ( = ?auto_4366 ?auto_4382 ) ) ( not ( = ?auto_4366 ?auto_4388 ) ) ( not ( = ?auto_4366 ?auto_4373 ) ) ( not ( = ?auto_4368 ?auto_4379 ) ) ( not ( = ?auto_4368 ?auto_4383 ) ) ( not ( = ?auto_4368 ?auto_4384 ) ) ( not ( = ?auto_4368 ?auto_4375 ) ) ( not ( = ?auto_4368 ?auto_4376 ) ) ( not ( = ?auto_4372 ?auto_4378 ) ) ( not ( = ?auto_4372 ?auto_4377 ) ) ( not ( = ?auto_4372 ?auto_4380 ) ) ( not ( = ?auto_4372 ?auto_4381 ) ) ( not ( = ?auto_4372 ?auto_4387 ) ) ( not ( = ?auto_4371 ?auto_4374 ) ) ( not ( = ?auto_4371 ?auto_4386 ) ) ( not ( = ?auto_4371 ?auto_4385 ) ) ( not ( = ?auto_4371 ?auto_4382 ) ) ( not ( = ?auto_4371 ?auto_4388 ) ) ( not ( = ?auto_4371 ?auto_4373 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4359 ?auto_4360 ?auto_4361 ?auto_4362 ?auto_4363 ?auto_4365 ?auto_4364 )
      ( MAKE-1CRATE ?auto_4364 ?auto_4366 )
      ( MAKE-7CRATE-VERIFY ?auto_4359 ?auto_4360 ?auto_4361 ?auto_4362 ?auto_4363 ?auto_4365 ?auto_4364 ?auto_4366 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4391 - SURFACE
      ?auto_4392 - SURFACE
    )
    :vars
    (
      ?auto_4393 - HOIST
      ?auto_4394 - PLACE
      ?auto_4396 - PLACE
      ?auto_4397 - HOIST
      ?auto_4398 - SURFACE
      ?auto_4395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4393 ?auto_4394 ) ( SURFACE-AT ?auto_4391 ?auto_4394 ) ( CLEAR ?auto_4391 ) ( IS-CRATE ?auto_4392 ) ( AVAILABLE ?auto_4393 ) ( not ( = ?auto_4396 ?auto_4394 ) ) ( HOIST-AT ?auto_4397 ?auto_4396 ) ( AVAILABLE ?auto_4397 ) ( SURFACE-AT ?auto_4392 ?auto_4396 ) ( ON ?auto_4392 ?auto_4398 ) ( CLEAR ?auto_4392 ) ( TRUCK-AT ?auto_4395 ?auto_4394 ) ( not ( = ?auto_4391 ?auto_4392 ) ) ( not ( = ?auto_4391 ?auto_4398 ) ) ( not ( = ?auto_4392 ?auto_4398 ) ) ( not ( = ?auto_4393 ?auto_4397 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4395 ?auto_4394 ?auto_4396 )
      ( !LIFT ?auto_4397 ?auto_4392 ?auto_4398 ?auto_4396 )
      ( !LOAD ?auto_4397 ?auto_4392 ?auto_4395 ?auto_4396 )
      ( !DRIVE ?auto_4395 ?auto_4396 ?auto_4394 )
      ( !UNLOAD ?auto_4393 ?auto_4392 ?auto_4395 ?auto_4394 )
      ( !DROP ?auto_4393 ?auto_4392 ?auto_4391 ?auto_4394 )
      ( MAKE-1CRATE-VERIFY ?auto_4391 ?auto_4392 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_4408 - SURFACE
      ?auto_4409 - SURFACE
      ?auto_4410 - SURFACE
      ?auto_4411 - SURFACE
      ?auto_4412 - SURFACE
      ?auto_4414 - SURFACE
      ?auto_4413 - SURFACE
      ?auto_4416 - SURFACE
      ?auto_4415 - SURFACE
    )
    :vars
    (
      ?auto_4418 - HOIST
      ?auto_4417 - PLACE
      ?auto_4421 - PLACE
      ?auto_4422 - HOIST
      ?auto_4420 - SURFACE
      ?auto_4423 - PLACE
      ?auto_4439 - HOIST
      ?auto_4424 - SURFACE
      ?auto_4433 - PLACE
      ?auto_4434 - HOIST
      ?auto_4436 - SURFACE
      ?auto_4427 - PLACE
      ?auto_4435 - HOIST
      ?auto_4431 - SURFACE
      ?auto_4429 - PLACE
      ?auto_4432 - HOIST
      ?auto_4430 - SURFACE
      ?auto_4428 - SURFACE
      ?auto_4426 - SURFACE
      ?auto_4438 - PLACE
      ?auto_4437 - HOIST
      ?auto_4425 - SURFACE
      ?auto_4419 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4418 ?auto_4417 ) ( IS-CRATE ?auto_4415 ) ( not ( = ?auto_4421 ?auto_4417 ) ) ( HOIST-AT ?auto_4422 ?auto_4421 ) ( SURFACE-AT ?auto_4415 ?auto_4421 ) ( ON ?auto_4415 ?auto_4420 ) ( CLEAR ?auto_4415 ) ( not ( = ?auto_4416 ?auto_4415 ) ) ( not ( = ?auto_4416 ?auto_4420 ) ) ( not ( = ?auto_4415 ?auto_4420 ) ) ( not ( = ?auto_4418 ?auto_4422 ) ) ( IS-CRATE ?auto_4416 ) ( not ( = ?auto_4423 ?auto_4417 ) ) ( HOIST-AT ?auto_4439 ?auto_4423 ) ( AVAILABLE ?auto_4439 ) ( SURFACE-AT ?auto_4416 ?auto_4423 ) ( ON ?auto_4416 ?auto_4424 ) ( CLEAR ?auto_4416 ) ( not ( = ?auto_4413 ?auto_4416 ) ) ( not ( = ?auto_4413 ?auto_4424 ) ) ( not ( = ?auto_4416 ?auto_4424 ) ) ( not ( = ?auto_4418 ?auto_4439 ) ) ( IS-CRATE ?auto_4413 ) ( not ( = ?auto_4433 ?auto_4417 ) ) ( HOIST-AT ?auto_4434 ?auto_4433 ) ( AVAILABLE ?auto_4434 ) ( SURFACE-AT ?auto_4413 ?auto_4433 ) ( ON ?auto_4413 ?auto_4436 ) ( CLEAR ?auto_4413 ) ( not ( = ?auto_4414 ?auto_4413 ) ) ( not ( = ?auto_4414 ?auto_4436 ) ) ( not ( = ?auto_4413 ?auto_4436 ) ) ( not ( = ?auto_4418 ?auto_4434 ) ) ( IS-CRATE ?auto_4414 ) ( not ( = ?auto_4427 ?auto_4417 ) ) ( HOIST-AT ?auto_4435 ?auto_4427 ) ( AVAILABLE ?auto_4435 ) ( SURFACE-AT ?auto_4414 ?auto_4427 ) ( ON ?auto_4414 ?auto_4431 ) ( CLEAR ?auto_4414 ) ( not ( = ?auto_4412 ?auto_4414 ) ) ( not ( = ?auto_4412 ?auto_4431 ) ) ( not ( = ?auto_4414 ?auto_4431 ) ) ( not ( = ?auto_4418 ?auto_4435 ) ) ( IS-CRATE ?auto_4412 ) ( not ( = ?auto_4429 ?auto_4417 ) ) ( HOIST-AT ?auto_4432 ?auto_4429 ) ( SURFACE-AT ?auto_4412 ?auto_4429 ) ( ON ?auto_4412 ?auto_4430 ) ( CLEAR ?auto_4412 ) ( not ( = ?auto_4411 ?auto_4412 ) ) ( not ( = ?auto_4411 ?auto_4430 ) ) ( not ( = ?auto_4412 ?auto_4430 ) ) ( not ( = ?auto_4418 ?auto_4432 ) ) ( IS-CRATE ?auto_4411 ) ( AVAILABLE ?auto_4422 ) ( SURFACE-AT ?auto_4411 ?auto_4421 ) ( ON ?auto_4411 ?auto_4428 ) ( CLEAR ?auto_4411 ) ( not ( = ?auto_4410 ?auto_4411 ) ) ( not ( = ?auto_4410 ?auto_4428 ) ) ( not ( = ?auto_4411 ?auto_4428 ) ) ( IS-CRATE ?auto_4410 ) ( AVAILABLE ?auto_4432 ) ( SURFACE-AT ?auto_4410 ?auto_4429 ) ( ON ?auto_4410 ?auto_4426 ) ( CLEAR ?auto_4410 ) ( not ( = ?auto_4409 ?auto_4410 ) ) ( not ( = ?auto_4409 ?auto_4426 ) ) ( not ( = ?auto_4410 ?auto_4426 ) ) ( SURFACE-AT ?auto_4408 ?auto_4417 ) ( CLEAR ?auto_4408 ) ( IS-CRATE ?auto_4409 ) ( AVAILABLE ?auto_4418 ) ( not ( = ?auto_4438 ?auto_4417 ) ) ( HOIST-AT ?auto_4437 ?auto_4438 ) ( AVAILABLE ?auto_4437 ) ( SURFACE-AT ?auto_4409 ?auto_4438 ) ( ON ?auto_4409 ?auto_4425 ) ( CLEAR ?auto_4409 ) ( TRUCK-AT ?auto_4419 ?auto_4417 ) ( not ( = ?auto_4408 ?auto_4409 ) ) ( not ( = ?auto_4408 ?auto_4425 ) ) ( not ( = ?auto_4409 ?auto_4425 ) ) ( not ( = ?auto_4418 ?auto_4437 ) ) ( not ( = ?auto_4408 ?auto_4410 ) ) ( not ( = ?auto_4408 ?auto_4426 ) ) ( not ( = ?auto_4410 ?auto_4425 ) ) ( not ( = ?auto_4429 ?auto_4438 ) ) ( not ( = ?auto_4432 ?auto_4437 ) ) ( not ( = ?auto_4426 ?auto_4425 ) ) ( not ( = ?auto_4408 ?auto_4411 ) ) ( not ( = ?auto_4408 ?auto_4428 ) ) ( not ( = ?auto_4409 ?auto_4411 ) ) ( not ( = ?auto_4409 ?auto_4428 ) ) ( not ( = ?auto_4411 ?auto_4426 ) ) ( not ( = ?auto_4411 ?auto_4425 ) ) ( not ( = ?auto_4421 ?auto_4429 ) ) ( not ( = ?auto_4421 ?auto_4438 ) ) ( not ( = ?auto_4422 ?auto_4432 ) ) ( not ( = ?auto_4422 ?auto_4437 ) ) ( not ( = ?auto_4428 ?auto_4426 ) ) ( not ( = ?auto_4428 ?auto_4425 ) ) ( not ( = ?auto_4408 ?auto_4412 ) ) ( not ( = ?auto_4408 ?auto_4430 ) ) ( not ( = ?auto_4409 ?auto_4412 ) ) ( not ( = ?auto_4409 ?auto_4430 ) ) ( not ( = ?auto_4410 ?auto_4412 ) ) ( not ( = ?auto_4410 ?auto_4430 ) ) ( not ( = ?auto_4412 ?auto_4428 ) ) ( not ( = ?auto_4412 ?auto_4426 ) ) ( not ( = ?auto_4412 ?auto_4425 ) ) ( not ( = ?auto_4430 ?auto_4428 ) ) ( not ( = ?auto_4430 ?auto_4426 ) ) ( not ( = ?auto_4430 ?auto_4425 ) ) ( not ( = ?auto_4408 ?auto_4414 ) ) ( not ( = ?auto_4408 ?auto_4431 ) ) ( not ( = ?auto_4409 ?auto_4414 ) ) ( not ( = ?auto_4409 ?auto_4431 ) ) ( not ( = ?auto_4410 ?auto_4414 ) ) ( not ( = ?auto_4410 ?auto_4431 ) ) ( not ( = ?auto_4411 ?auto_4414 ) ) ( not ( = ?auto_4411 ?auto_4431 ) ) ( not ( = ?auto_4414 ?auto_4430 ) ) ( not ( = ?auto_4414 ?auto_4428 ) ) ( not ( = ?auto_4414 ?auto_4426 ) ) ( not ( = ?auto_4414 ?auto_4425 ) ) ( not ( = ?auto_4427 ?auto_4429 ) ) ( not ( = ?auto_4427 ?auto_4421 ) ) ( not ( = ?auto_4427 ?auto_4438 ) ) ( not ( = ?auto_4435 ?auto_4432 ) ) ( not ( = ?auto_4435 ?auto_4422 ) ) ( not ( = ?auto_4435 ?auto_4437 ) ) ( not ( = ?auto_4431 ?auto_4430 ) ) ( not ( = ?auto_4431 ?auto_4428 ) ) ( not ( = ?auto_4431 ?auto_4426 ) ) ( not ( = ?auto_4431 ?auto_4425 ) ) ( not ( = ?auto_4408 ?auto_4413 ) ) ( not ( = ?auto_4408 ?auto_4436 ) ) ( not ( = ?auto_4409 ?auto_4413 ) ) ( not ( = ?auto_4409 ?auto_4436 ) ) ( not ( = ?auto_4410 ?auto_4413 ) ) ( not ( = ?auto_4410 ?auto_4436 ) ) ( not ( = ?auto_4411 ?auto_4413 ) ) ( not ( = ?auto_4411 ?auto_4436 ) ) ( not ( = ?auto_4412 ?auto_4413 ) ) ( not ( = ?auto_4412 ?auto_4436 ) ) ( not ( = ?auto_4413 ?auto_4431 ) ) ( not ( = ?auto_4413 ?auto_4430 ) ) ( not ( = ?auto_4413 ?auto_4428 ) ) ( not ( = ?auto_4413 ?auto_4426 ) ) ( not ( = ?auto_4413 ?auto_4425 ) ) ( not ( = ?auto_4433 ?auto_4427 ) ) ( not ( = ?auto_4433 ?auto_4429 ) ) ( not ( = ?auto_4433 ?auto_4421 ) ) ( not ( = ?auto_4433 ?auto_4438 ) ) ( not ( = ?auto_4434 ?auto_4435 ) ) ( not ( = ?auto_4434 ?auto_4432 ) ) ( not ( = ?auto_4434 ?auto_4422 ) ) ( not ( = ?auto_4434 ?auto_4437 ) ) ( not ( = ?auto_4436 ?auto_4431 ) ) ( not ( = ?auto_4436 ?auto_4430 ) ) ( not ( = ?auto_4436 ?auto_4428 ) ) ( not ( = ?auto_4436 ?auto_4426 ) ) ( not ( = ?auto_4436 ?auto_4425 ) ) ( not ( = ?auto_4408 ?auto_4416 ) ) ( not ( = ?auto_4408 ?auto_4424 ) ) ( not ( = ?auto_4409 ?auto_4416 ) ) ( not ( = ?auto_4409 ?auto_4424 ) ) ( not ( = ?auto_4410 ?auto_4416 ) ) ( not ( = ?auto_4410 ?auto_4424 ) ) ( not ( = ?auto_4411 ?auto_4416 ) ) ( not ( = ?auto_4411 ?auto_4424 ) ) ( not ( = ?auto_4412 ?auto_4416 ) ) ( not ( = ?auto_4412 ?auto_4424 ) ) ( not ( = ?auto_4414 ?auto_4416 ) ) ( not ( = ?auto_4414 ?auto_4424 ) ) ( not ( = ?auto_4416 ?auto_4436 ) ) ( not ( = ?auto_4416 ?auto_4431 ) ) ( not ( = ?auto_4416 ?auto_4430 ) ) ( not ( = ?auto_4416 ?auto_4428 ) ) ( not ( = ?auto_4416 ?auto_4426 ) ) ( not ( = ?auto_4416 ?auto_4425 ) ) ( not ( = ?auto_4423 ?auto_4433 ) ) ( not ( = ?auto_4423 ?auto_4427 ) ) ( not ( = ?auto_4423 ?auto_4429 ) ) ( not ( = ?auto_4423 ?auto_4421 ) ) ( not ( = ?auto_4423 ?auto_4438 ) ) ( not ( = ?auto_4439 ?auto_4434 ) ) ( not ( = ?auto_4439 ?auto_4435 ) ) ( not ( = ?auto_4439 ?auto_4432 ) ) ( not ( = ?auto_4439 ?auto_4422 ) ) ( not ( = ?auto_4439 ?auto_4437 ) ) ( not ( = ?auto_4424 ?auto_4436 ) ) ( not ( = ?auto_4424 ?auto_4431 ) ) ( not ( = ?auto_4424 ?auto_4430 ) ) ( not ( = ?auto_4424 ?auto_4428 ) ) ( not ( = ?auto_4424 ?auto_4426 ) ) ( not ( = ?auto_4424 ?auto_4425 ) ) ( not ( = ?auto_4408 ?auto_4415 ) ) ( not ( = ?auto_4408 ?auto_4420 ) ) ( not ( = ?auto_4409 ?auto_4415 ) ) ( not ( = ?auto_4409 ?auto_4420 ) ) ( not ( = ?auto_4410 ?auto_4415 ) ) ( not ( = ?auto_4410 ?auto_4420 ) ) ( not ( = ?auto_4411 ?auto_4415 ) ) ( not ( = ?auto_4411 ?auto_4420 ) ) ( not ( = ?auto_4412 ?auto_4415 ) ) ( not ( = ?auto_4412 ?auto_4420 ) ) ( not ( = ?auto_4414 ?auto_4415 ) ) ( not ( = ?auto_4414 ?auto_4420 ) ) ( not ( = ?auto_4413 ?auto_4415 ) ) ( not ( = ?auto_4413 ?auto_4420 ) ) ( not ( = ?auto_4415 ?auto_4424 ) ) ( not ( = ?auto_4415 ?auto_4436 ) ) ( not ( = ?auto_4415 ?auto_4431 ) ) ( not ( = ?auto_4415 ?auto_4430 ) ) ( not ( = ?auto_4415 ?auto_4428 ) ) ( not ( = ?auto_4415 ?auto_4426 ) ) ( not ( = ?auto_4415 ?auto_4425 ) ) ( not ( = ?auto_4420 ?auto_4424 ) ) ( not ( = ?auto_4420 ?auto_4436 ) ) ( not ( = ?auto_4420 ?auto_4431 ) ) ( not ( = ?auto_4420 ?auto_4430 ) ) ( not ( = ?auto_4420 ?auto_4428 ) ) ( not ( = ?auto_4420 ?auto_4426 ) ) ( not ( = ?auto_4420 ?auto_4425 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4408 ?auto_4409 ?auto_4410 ?auto_4411 ?auto_4412 ?auto_4414 ?auto_4413 ?auto_4416 )
      ( MAKE-1CRATE ?auto_4416 ?auto_4415 )
      ( MAKE-8CRATE-VERIFY ?auto_4408 ?auto_4409 ?auto_4410 ?auto_4411 ?auto_4412 ?auto_4414 ?auto_4413 ?auto_4416 ?auto_4415 ) )
  )

)

