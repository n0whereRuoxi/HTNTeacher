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
      ?auto_4223 - SURFACE
      ?auto_4224 - SURFACE
    )
    :vars
    (
      ?auto_4225 - HOIST
      ?auto_4226 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4225 ?auto_4226 ) ( SURFACE-AT ?auto_4224 ?auto_4226 ) ( CLEAR ?auto_4224 ) ( LIFTING ?auto_4225 ?auto_4223 ) ( IS-CRATE ?auto_4223 ) ( not ( = ?auto_4223 ?auto_4224 ) ) )
    :subtasks
    ( ( !DROP ?auto_4225 ?auto_4223 ?auto_4224 ?auto_4226 )
      ( MAKE-ON-VERIFY ?auto_4223 ?auto_4224 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4227 - SURFACE
      ?auto_4228 - SURFACE
    )
    :vars
    (
      ?auto_4229 - HOIST
      ?auto_4230 - PLACE
      ?auto_4231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4229 ?auto_4230 ) ( SURFACE-AT ?auto_4228 ?auto_4230 ) ( CLEAR ?auto_4228 ) ( IS-CRATE ?auto_4227 ) ( not ( = ?auto_4227 ?auto_4228 ) ) ( TRUCK-AT ?auto_4231 ?auto_4230 ) ( AVAILABLE ?auto_4229 ) ( IN ?auto_4227 ?auto_4231 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4229 ?auto_4227 ?auto_4231 ?auto_4230 )
      ( MAKE-ON ?auto_4227 ?auto_4228 )
      ( MAKE-ON-VERIFY ?auto_4227 ?auto_4228 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4232 - SURFACE
      ?auto_4233 - SURFACE
    )
    :vars
    (
      ?auto_4235 - HOIST
      ?auto_4234 - PLACE
      ?auto_4236 - TRUCK
      ?auto_4237 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4235 ?auto_4234 ) ( SURFACE-AT ?auto_4233 ?auto_4234 ) ( CLEAR ?auto_4233 ) ( IS-CRATE ?auto_4232 ) ( not ( = ?auto_4232 ?auto_4233 ) ) ( AVAILABLE ?auto_4235 ) ( IN ?auto_4232 ?auto_4236 ) ( TRUCK-AT ?auto_4236 ?auto_4237 ) ( not ( = ?auto_4237 ?auto_4234 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4236 ?auto_4237 ?auto_4234 )
      ( MAKE-ON ?auto_4232 ?auto_4233 )
      ( MAKE-ON-VERIFY ?auto_4232 ?auto_4233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4238 - SURFACE
      ?auto_4239 - SURFACE
    )
    :vars
    (
      ?auto_4242 - HOIST
      ?auto_4243 - PLACE
      ?auto_4240 - TRUCK
      ?auto_4241 - PLACE
      ?auto_4244 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4242 ?auto_4243 ) ( SURFACE-AT ?auto_4239 ?auto_4243 ) ( CLEAR ?auto_4239 ) ( IS-CRATE ?auto_4238 ) ( not ( = ?auto_4238 ?auto_4239 ) ) ( AVAILABLE ?auto_4242 ) ( TRUCK-AT ?auto_4240 ?auto_4241 ) ( not ( = ?auto_4241 ?auto_4243 ) ) ( HOIST-AT ?auto_4244 ?auto_4241 ) ( LIFTING ?auto_4244 ?auto_4238 ) ( not ( = ?auto_4242 ?auto_4244 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4244 ?auto_4238 ?auto_4240 ?auto_4241 )
      ( MAKE-ON ?auto_4238 ?auto_4239 )
      ( MAKE-ON-VERIFY ?auto_4238 ?auto_4239 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4245 - SURFACE
      ?auto_4246 - SURFACE
    )
    :vars
    (
      ?auto_4249 - HOIST
      ?auto_4250 - PLACE
      ?auto_4251 - TRUCK
      ?auto_4248 - PLACE
      ?auto_4247 - HOIST
      ?auto_4252 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4249 ?auto_4250 ) ( SURFACE-AT ?auto_4246 ?auto_4250 ) ( CLEAR ?auto_4246 ) ( IS-CRATE ?auto_4245 ) ( not ( = ?auto_4245 ?auto_4246 ) ) ( AVAILABLE ?auto_4249 ) ( TRUCK-AT ?auto_4251 ?auto_4248 ) ( not ( = ?auto_4248 ?auto_4250 ) ) ( HOIST-AT ?auto_4247 ?auto_4248 ) ( not ( = ?auto_4249 ?auto_4247 ) ) ( AVAILABLE ?auto_4247 ) ( SURFACE-AT ?auto_4245 ?auto_4248 ) ( ON ?auto_4245 ?auto_4252 ) ( CLEAR ?auto_4245 ) ( not ( = ?auto_4245 ?auto_4252 ) ) ( not ( = ?auto_4246 ?auto_4252 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4247 ?auto_4245 ?auto_4252 ?auto_4248 )
      ( MAKE-ON ?auto_4245 ?auto_4246 )
      ( MAKE-ON-VERIFY ?auto_4245 ?auto_4246 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4253 - SURFACE
      ?auto_4254 - SURFACE
    )
    :vars
    (
      ?auto_4257 - HOIST
      ?auto_4260 - PLACE
      ?auto_4258 - PLACE
      ?auto_4256 - HOIST
      ?auto_4259 - SURFACE
      ?auto_4255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4257 ?auto_4260 ) ( SURFACE-AT ?auto_4254 ?auto_4260 ) ( CLEAR ?auto_4254 ) ( IS-CRATE ?auto_4253 ) ( not ( = ?auto_4253 ?auto_4254 ) ) ( AVAILABLE ?auto_4257 ) ( not ( = ?auto_4258 ?auto_4260 ) ) ( HOIST-AT ?auto_4256 ?auto_4258 ) ( not ( = ?auto_4257 ?auto_4256 ) ) ( AVAILABLE ?auto_4256 ) ( SURFACE-AT ?auto_4253 ?auto_4258 ) ( ON ?auto_4253 ?auto_4259 ) ( CLEAR ?auto_4253 ) ( not ( = ?auto_4253 ?auto_4259 ) ) ( not ( = ?auto_4254 ?auto_4259 ) ) ( TRUCK-AT ?auto_4255 ?auto_4260 ) )
    :subtasks
    ( ( !DRIVE ?auto_4255 ?auto_4260 ?auto_4258 )
      ( MAKE-ON ?auto_4253 ?auto_4254 )
      ( MAKE-ON-VERIFY ?auto_4253 ?auto_4254 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4301 - SURFACE
      ?auto_4302 - SURFACE
    )
    :vars
    (
      ?auto_4303 - HOIST
      ?auto_4305 - PLACE
      ?auto_4306 - PLACE
      ?auto_4307 - HOIST
      ?auto_4308 - SURFACE
      ?auto_4304 - TRUCK
      ?auto_4309 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4303 ?auto_4305 ) ( IS-CRATE ?auto_4301 ) ( not ( = ?auto_4301 ?auto_4302 ) ) ( not ( = ?auto_4306 ?auto_4305 ) ) ( HOIST-AT ?auto_4307 ?auto_4306 ) ( not ( = ?auto_4303 ?auto_4307 ) ) ( AVAILABLE ?auto_4307 ) ( SURFACE-AT ?auto_4301 ?auto_4306 ) ( ON ?auto_4301 ?auto_4308 ) ( CLEAR ?auto_4301 ) ( not ( = ?auto_4301 ?auto_4308 ) ) ( not ( = ?auto_4302 ?auto_4308 ) ) ( TRUCK-AT ?auto_4304 ?auto_4305 ) ( SURFACE-AT ?auto_4309 ?auto_4305 ) ( CLEAR ?auto_4309 ) ( LIFTING ?auto_4303 ?auto_4302 ) ( IS-CRATE ?auto_4302 ) ( not ( = ?auto_4301 ?auto_4309 ) ) ( not ( = ?auto_4302 ?auto_4309 ) ) ( not ( = ?auto_4308 ?auto_4309 ) ) )
    :subtasks
    ( ( !DROP ?auto_4303 ?auto_4302 ?auto_4309 ?auto_4305 )
      ( MAKE-ON ?auto_4301 ?auto_4302 )
      ( MAKE-ON-VERIFY ?auto_4301 ?auto_4302 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4310 - SURFACE
      ?auto_4311 - SURFACE
    )
    :vars
    (
      ?auto_4318 - HOIST
      ?auto_4312 - PLACE
      ?auto_4315 - PLACE
      ?auto_4314 - HOIST
      ?auto_4316 - SURFACE
      ?auto_4313 - TRUCK
      ?auto_4317 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4318 ?auto_4312 ) ( IS-CRATE ?auto_4310 ) ( not ( = ?auto_4310 ?auto_4311 ) ) ( not ( = ?auto_4315 ?auto_4312 ) ) ( HOIST-AT ?auto_4314 ?auto_4315 ) ( not ( = ?auto_4318 ?auto_4314 ) ) ( AVAILABLE ?auto_4314 ) ( SURFACE-AT ?auto_4310 ?auto_4315 ) ( ON ?auto_4310 ?auto_4316 ) ( CLEAR ?auto_4310 ) ( not ( = ?auto_4310 ?auto_4316 ) ) ( not ( = ?auto_4311 ?auto_4316 ) ) ( TRUCK-AT ?auto_4313 ?auto_4312 ) ( SURFACE-AT ?auto_4317 ?auto_4312 ) ( CLEAR ?auto_4317 ) ( IS-CRATE ?auto_4311 ) ( not ( = ?auto_4310 ?auto_4317 ) ) ( not ( = ?auto_4311 ?auto_4317 ) ) ( not ( = ?auto_4316 ?auto_4317 ) ) ( AVAILABLE ?auto_4318 ) ( IN ?auto_4311 ?auto_4313 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4318 ?auto_4311 ?auto_4313 ?auto_4312 )
      ( MAKE-ON ?auto_4310 ?auto_4311 )
      ( MAKE-ON-VERIFY ?auto_4310 ?auto_4311 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4325 - SURFACE
      ?auto_4326 - SURFACE
    )
    :vars
    (
      ?auto_4331 - HOIST
      ?auto_4328 - PLACE
      ?auto_4332 - PLACE
      ?auto_4330 - HOIST
      ?auto_4327 - SURFACE
      ?auto_4329 - TRUCK
      ?auto_4333 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4331 ?auto_4328 ) ( SURFACE-AT ?auto_4326 ?auto_4328 ) ( CLEAR ?auto_4326 ) ( IS-CRATE ?auto_4325 ) ( not ( = ?auto_4325 ?auto_4326 ) ) ( AVAILABLE ?auto_4331 ) ( not ( = ?auto_4332 ?auto_4328 ) ) ( HOIST-AT ?auto_4330 ?auto_4332 ) ( not ( = ?auto_4331 ?auto_4330 ) ) ( AVAILABLE ?auto_4330 ) ( SURFACE-AT ?auto_4325 ?auto_4332 ) ( ON ?auto_4325 ?auto_4327 ) ( CLEAR ?auto_4325 ) ( not ( = ?auto_4325 ?auto_4327 ) ) ( not ( = ?auto_4326 ?auto_4327 ) ) ( TRUCK-AT ?auto_4329 ?auto_4333 ) ( not ( = ?auto_4333 ?auto_4328 ) ) ( not ( = ?auto_4332 ?auto_4333 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4329 ?auto_4333 ?auto_4328 )
      ( MAKE-ON ?auto_4325 ?auto_4326 )
      ( MAKE-ON-VERIFY ?auto_4325 ?auto_4326 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4574 - SURFACE
      ?auto_4575 - SURFACE
    )
    :vars
    (
      ?auto_4580 - HOIST
      ?auto_4579 - PLACE
      ?auto_4576 - PLACE
      ?auto_4582 - HOIST
      ?auto_4581 - SURFACE
      ?auto_4578 - SURFACE
      ?auto_4577 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4580 ?auto_4579 ) ( IS-CRATE ?auto_4574 ) ( not ( = ?auto_4574 ?auto_4575 ) ) ( not ( = ?auto_4576 ?auto_4579 ) ) ( HOIST-AT ?auto_4582 ?auto_4576 ) ( not ( = ?auto_4580 ?auto_4582 ) ) ( AVAILABLE ?auto_4582 ) ( SURFACE-AT ?auto_4574 ?auto_4576 ) ( ON ?auto_4574 ?auto_4581 ) ( CLEAR ?auto_4574 ) ( not ( = ?auto_4574 ?auto_4581 ) ) ( not ( = ?auto_4575 ?auto_4581 ) ) ( SURFACE-AT ?auto_4578 ?auto_4579 ) ( CLEAR ?auto_4578 ) ( IS-CRATE ?auto_4575 ) ( not ( = ?auto_4574 ?auto_4578 ) ) ( not ( = ?auto_4575 ?auto_4578 ) ) ( not ( = ?auto_4581 ?auto_4578 ) ) ( AVAILABLE ?auto_4580 ) ( IN ?auto_4575 ?auto_4577 ) ( TRUCK-AT ?auto_4577 ?auto_4576 ) )
    :subtasks
    ( ( !DRIVE ?auto_4577 ?auto_4576 ?auto_4579 )
      ( MAKE-ON ?auto_4574 ?auto_4575 )
      ( MAKE-ON-VERIFY ?auto_4574 ?auto_4575 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4583 - SURFACE
      ?auto_4584 - SURFACE
    )
    :vars
    (
      ?auto_4588 - HOIST
      ?auto_4591 - PLACE
      ?auto_4587 - PLACE
      ?auto_4590 - HOIST
      ?auto_4589 - SURFACE
      ?auto_4586 - SURFACE
      ?auto_4585 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4588 ?auto_4591 ) ( IS-CRATE ?auto_4583 ) ( not ( = ?auto_4583 ?auto_4584 ) ) ( not ( = ?auto_4587 ?auto_4591 ) ) ( HOIST-AT ?auto_4590 ?auto_4587 ) ( not ( = ?auto_4588 ?auto_4590 ) ) ( SURFACE-AT ?auto_4583 ?auto_4587 ) ( ON ?auto_4583 ?auto_4589 ) ( CLEAR ?auto_4583 ) ( not ( = ?auto_4583 ?auto_4589 ) ) ( not ( = ?auto_4584 ?auto_4589 ) ) ( SURFACE-AT ?auto_4586 ?auto_4591 ) ( CLEAR ?auto_4586 ) ( IS-CRATE ?auto_4584 ) ( not ( = ?auto_4583 ?auto_4586 ) ) ( not ( = ?auto_4584 ?auto_4586 ) ) ( not ( = ?auto_4589 ?auto_4586 ) ) ( AVAILABLE ?auto_4588 ) ( TRUCK-AT ?auto_4585 ?auto_4587 ) ( LIFTING ?auto_4590 ?auto_4584 ) )
    :subtasks
    ( ( !LOAD ?auto_4590 ?auto_4584 ?auto_4585 ?auto_4587 )
      ( MAKE-ON ?auto_4583 ?auto_4584 )
      ( MAKE-ON-VERIFY ?auto_4583 ?auto_4584 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4592 - SURFACE
      ?auto_4593 - SURFACE
    )
    :vars
    (
      ?auto_4596 - HOIST
      ?auto_4600 - PLACE
      ?auto_4599 - PLACE
      ?auto_4594 - HOIST
      ?auto_4598 - SURFACE
      ?auto_4597 - SURFACE
      ?auto_4595 - TRUCK
      ?auto_4601 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4596 ?auto_4600 ) ( IS-CRATE ?auto_4592 ) ( not ( = ?auto_4592 ?auto_4593 ) ) ( not ( = ?auto_4599 ?auto_4600 ) ) ( HOIST-AT ?auto_4594 ?auto_4599 ) ( not ( = ?auto_4596 ?auto_4594 ) ) ( SURFACE-AT ?auto_4592 ?auto_4599 ) ( ON ?auto_4592 ?auto_4598 ) ( CLEAR ?auto_4592 ) ( not ( = ?auto_4592 ?auto_4598 ) ) ( not ( = ?auto_4593 ?auto_4598 ) ) ( SURFACE-AT ?auto_4597 ?auto_4600 ) ( CLEAR ?auto_4597 ) ( IS-CRATE ?auto_4593 ) ( not ( = ?auto_4592 ?auto_4597 ) ) ( not ( = ?auto_4593 ?auto_4597 ) ) ( not ( = ?auto_4598 ?auto_4597 ) ) ( AVAILABLE ?auto_4596 ) ( TRUCK-AT ?auto_4595 ?auto_4599 ) ( AVAILABLE ?auto_4594 ) ( SURFACE-AT ?auto_4593 ?auto_4599 ) ( ON ?auto_4593 ?auto_4601 ) ( CLEAR ?auto_4593 ) ( not ( = ?auto_4592 ?auto_4601 ) ) ( not ( = ?auto_4593 ?auto_4601 ) ) ( not ( = ?auto_4598 ?auto_4601 ) ) ( not ( = ?auto_4597 ?auto_4601 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4594 ?auto_4593 ?auto_4601 ?auto_4599 )
      ( MAKE-ON ?auto_4592 ?auto_4593 )
      ( MAKE-ON-VERIFY ?auto_4592 ?auto_4593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4602 - SURFACE
      ?auto_4603 - SURFACE
    )
    :vars
    (
      ?auto_4608 - HOIST
      ?auto_4605 - PLACE
      ?auto_4606 - PLACE
      ?auto_4610 - HOIST
      ?auto_4609 - SURFACE
      ?auto_4611 - SURFACE
      ?auto_4607 - SURFACE
      ?auto_4604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4608 ?auto_4605 ) ( IS-CRATE ?auto_4602 ) ( not ( = ?auto_4602 ?auto_4603 ) ) ( not ( = ?auto_4606 ?auto_4605 ) ) ( HOIST-AT ?auto_4610 ?auto_4606 ) ( not ( = ?auto_4608 ?auto_4610 ) ) ( SURFACE-AT ?auto_4602 ?auto_4606 ) ( ON ?auto_4602 ?auto_4609 ) ( CLEAR ?auto_4602 ) ( not ( = ?auto_4602 ?auto_4609 ) ) ( not ( = ?auto_4603 ?auto_4609 ) ) ( SURFACE-AT ?auto_4611 ?auto_4605 ) ( CLEAR ?auto_4611 ) ( IS-CRATE ?auto_4603 ) ( not ( = ?auto_4602 ?auto_4611 ) ) ( not ( = ?auto_4603 ?auto_4611 ) ) ( not ( = ?auto_4609 ?auto_4611 ) ) ( AVAILABLE ?auto_4608 ) ( AVAILABLE ?auto_4610 ) ( SURFACE-AT ?auto_4603 ?auto_4606 ) ( ON ?auto_4603 ?auto_4607 ) ( CLEAR ?auto_4603 ) ( not ( = ?auto_4602 ?auto_4607 ) ) ( not ( = ?auto_4603 ?auto_4607 ) ) ( not ( = ?auto_4609 ?auto_4607 ) ) ( not ( = ?auto_4611 ?auto_4607 ) ) ( TRUCK-AT ?auto_4604 ?auto_4605 ) )
    :subtasks
    ( ( !DRIVE ?auto_4604 ?auto_4605 ?auto_4606 )
      ( MAKE-ON ?auto_4602 ?auto_4603 )
      ( MAKE-ON-VERIFY ?auto_4602 ?auto_4603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4612 - SURFACE
      ?auto_4613 - SURFACE
    )
    :vars
    (
      ?auto_4620 - HOIST
      ?auto_4617 - PLACE
      ?auto_4619 - PLACE
      ?auto_4621 - HOIST
      ?auto_4615 - SURFACE
      ?auto_4616 - SURFACE
      ?auto_4614 - SURFACE
      ?auto_4618 - TRUCK
      ?auto_4622 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4620 ?auto_4617 ) ( IS-CRATE ?auto_4612 ) ( not ( = ?auto_4612 ?auto_4613 ) ) ( not ( = ?auto_4619 ?auto_4617 ) ) ( HOIST-AT ?auto_4621 ?auto_4619 ) ( not ( = ?auto_4620 ?auto_4621 ) ) ( SURFACE-AT ?auto_4612 ?auto_4619 ) ( ON ?auto_4612 ?auto_4615 ) ( CLEAR ?auto_4612 ) ( not ( = ?auto_4612 ?auto_4615 ) ) ( not ( = ?auto_4613 ?auto_4615 ) ) ( IS-CRATE ?auto_4613 ) ( not ( = ?auto_4612 ?auto_4616 ) ) ( not ( = ?auto_4613 ?auto_4616 ) ) ( not ( = ?auto_4615 ?auto_4616 ) ) ( AVAILABLE ?auto_4621 ) ( SURFACE-AT ?auto_4613 ?auto_4619 ) ( ON ?auto_4613 ?auto_4614 ) ( CLEAR ?auto_4613 ) ( not ( = ?auto_4612 ?auto_4614 ) ) ( not ( = ?auto_4613 ?auto_4614 ) ) ( not ( = ?auto_4615 ?auto_4614 ) ) ( not ( = ?auto_4616 ?auto_4614 ) ) ( TRUCK-AT ?auto_4618 ?auto_4617 ) ( SURFACE-AT ?auto_4622 ?auto_4617 ) ( CLEAR ?auto_4622 ) ( LIFTING ?auto_4620 ?auto_4616 ) ( IS-CRATE ?auto_4616 ) ( not ( = ?auto_4612 ?auto_4622 ) ) ( not ( = ?auto_4613 ?auto_4622 ) ) ( not ( = ?auto_4615 ?auto_4622 ) ) ( not ( = ?auto_4616 ?auto_4622 ) ) ( not ( = ?auto_4614 ?auto_4622 ) ) )
    :subtasks
    ( ( !DROP ?auto_4620 ?auto_4616 ?auto_4622 ?auto_4617 )
      ( MAKE-ON ?auto_4612 ?auto_4613 )
      ( MAKE-ON-VERIFY ?auto_4612 ?auto_4613 ) )
  )

)

