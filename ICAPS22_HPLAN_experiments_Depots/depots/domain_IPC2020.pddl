( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types place truck hoist surface )

  ( :predicates
    ( surface-at ?a - surface ?b - place )
    ( on ?c - surface ?d - surface )
    ( in ?e - surface ?f - truck )
    ( lifting ?g - hoist ?h - surface )
    ( available ?i - hoist )
    ( clear ?j - surface )
    ( is-crate ?k - surface )
    ( hoist-at ?l - hoist ?m - place )
    ( truck-at ?n - truck ?o - place )
  )

  ( :action !Drive
    :parameters
    (
      ?truck - truck
      ?old - place
      ?new - place
    )
    :precondition
    ( and
      ( truck-at ?truck ?old )
      ( not ( = ?old ?new ) )
    )
    :effect
    ( and
      ( not ( truck-at ?truck ?old ) )
      ( truck-at ?truck ?new )
    )
  )

  ( :action !Lift
    :parameters
    (
      ?hoist - hoist
      ?crate - surface
      ?below - surface
      ?here - place
    )
    :precondition
    ( and
      ( hoist-at ?hoist ?here )
      ( available ?hoist )
      ( surface-at ?crate ?here )
      ( on ?crate ?below )
      ( clear ?crate )
      ( is-crate ?crate )
    )
    :effect
    ( and
      ( not ( surface-at ?crate ?here ) )
      ( not ( clear ?crate ) )
      ( not ( available ?hoist ) )
      ( not ( on ?crate ?below ) )
      ( clear ?below )
      ( lifting ?hoist ?crate )
    )
  )

  ( :action !Drop
    :parameters
    (
      ?hoist - hoist
      ?crate - surface
      ?below - surface
      ?here - place
    )
    :precondition
    ( and
      ( hoist-at ?hoist ?here )
      ( surface-at ?below ?here )
      ( clear ?below )
      ( lifting ?hoist ?crate )
      ( is-crate ?crate )
    )
    :effect
    ( and
      ( not ( lifting ?hoist ?crate ) )
      ( not ( clear ?below ) )
      ( available ?hoist )
      ( surface-at ?crate ?here )
      ( clear ?crate )
      ( on ?crate ?below )
    )
  )

  ( :action !Load
    :parameters
    (
      ?hoist - hoist
      ?crate - surface
      ?truck - truck
      ?here - place
    )
    :precondition
    ( and
      ( hoist-at ?hoist ?here )
      ( truck-at ?truck ?here )
      ( lifting ?hoist ?crate )
      ( is-crate ?crate )
    )
    :effect
    ( and
      ( not ( lifting ?hoist ?crate ) )
      ( in ?crate ?truck )
      ( available ?hoist )
    )
  )

  ( :action !Unload
    :parameters
    (
      ?hoist - hoist
      ?crate - surface
      ?truck - truck
      ?here - place
    )
    :precondition
    ( and
      ( hoist-at ?hoist ?here )
      ( truck-at ?truck ?here )
      ( available ?hoist )
      ( in ?crate ?truck )
      ( is-crate ?crate )
    )
    :effect
    ( and
      ( not ( in ?crate ?truck ) )
      ( not ( available ?hoist ) )
      ( lifting ?hoist ?crate )
    )
  )

  ( :method Make-On
    :parameters
    (
      ?ab - surface
      ?be - surface
    )
    :precondition
    ( and
      ( on ?ab ?be )
    )
    :subtasks
    (
    )
  )

  ( :method Put-On
    :parameters 
    ( 
      ?c - crate  
      ?s2 - surface 
      ?p - place 
      ?h - hoist 
    )
    :precondition
    ( and
      (at ?c ?p)
    )
    :subtasks
    ( and 
      ( Clear ?c ?p )
      ( Clear ?s2 ?p )
      ( Lift-Crate ?c ?p ?h )
      ( !Drop ?h ?c ?s2 ?p)
    )
  ) 

  ( :method Put-On
    :parameters 
    (
      ?c - crate
      ?s2 - surface
      ?p - place
      ?t - truck
      ?h - hoist 
    )
    :precondition
    ( and 
      (in ?c ?t)
    )
    :subtasks
    ( and
      ( Get-Truck ?t ?p )
      ( Clear ?s2 ?p)
      ( !Unload ?h ?c ?t ?p )
      ( !Drop ?h ?c ?s2 ?p) )
    ) 
  ) 

( :method Put-On
  :parameters 
  ( 
    ?c - crate  
    ?s2 - surface 
    ?s1 - surface 
    ?p1 - place 
    ?t - truck 
    ?p2 - place 
  )
  :precondition
  (
  )
  :subtasks
  ( and 
    ( Load-Truck ?c ?s1 ?p1 ?t)
    ( !Drive ?t ?p1 ?p2)
    ( Unload-Truck ?c ?s2 ?p2 ?t)
  ) 
) 

(:method Clear
  :parameters ( ?s1 - surface  ?p1 - place )
  :precondition( and (clear ?s1) (at ?s1 ?p1) )
  :subtasks(and (nop)) ) 

(:method Clear
  :parameters ( ?s1 - surface  ?p1 - place ?c - crate ?t - truck ?h1 - hoist )
  :precondition(and (not (clear ?s1)) (on ?c ?s1) (at ?s1 ?p1) (at ?h1 ?p1))
  :subtasks(and (Clear ?c ?p1) (!Lift ?h1 ?c ?s1 ?p1) (Get-Truck ?t ?p1) (!Load ?h1 ?c ?t ?p1)) ) 

(:method Get-Truck
  :parameters ( ?t - truck  ?p1 - place )
  :precondition( and (at ?t ?p1))
  :subtasks(and (nop) ) ) 

(:method Get-Truck
  :parameters ( ?t - truck  ?p1 - place ?p2 - place )
  :precondition(and (not (at ?t ?p1)))
  :subtasks(and (!Drive ?t ?p2 ?p1) ) ) 

(:method Lift-Crate
  :parameters ( ?c - crate  ?p - place  ?h - hoist ?t - truck )
  :precondition(and (in ?c ?t) (at ?h ?p))
  :subtasks( and (Get-Truck ?t ?p) (!Unload ?h ?c ?t ?p) ) ) 

(:method Lift-Crate
  :parameters ( ?c - crate  ?p - place  ?h - hoist ?s - surface )
  :precondition(and (on ?c ?s) (at ?c ?p) (at ?s ?p) (at ?h ?p))
  :subtasks( and (!Lift ?h ?c ?s ?p) ) ) 

(:method Load-Truck
  :parameters ( ?c - crate  ?s - surface  ?p - place  ?t - truck ?h - hoist )
  :precondition( and (at ?c ?p) (at ?s ?p) (on ?c ?s) (at ?h ?p))
  :subtasks( and (Get-Truck ?t ?p) (Clear ?c ?p) (!Lift ?h ?c ?s ?p) (!Load ?h ?c ?t ?p) ) ) 

(:method Unload-Truck
  :parameters ( ?c - crate  ?s - surface  ?p - place  ?t - truck ?h - hoist )
  :precondition(and (in ?c ?t) (at ?t ?p) (at ?h ?p) (at ?s ?p))
  :subtasks(and (Clear ?s ?p) (!Unload ?h ?c ?t ?p) (!Drop ?h ?c ?s ?p) ) ) 
 
)
