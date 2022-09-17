( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place256 - place
    hoist256 - hoist
    place792 - place
    hoist792 - hoist
    place35 - place
    hoist35 - hoist
    place473 - place
    hoist473 - hoist
    place388 - place
    hoist388 - hoist
    place43 - place
    hoist43 - hoist
    place935 - place
    hoist935 - hoist
    place808 - place
    hoist808 - hoist
    place125 - place
    hoist125 - hoist
    place132 - place
    hoist132 - hoist
    place843 - place
    hoist843 - hoist
    place83 - place
    hoist83 - hoist
    place911 - place
    hoist911 - hoist
    place303 - place
    hoist303 - hoist
    place79 - place
    hoist79 - hoist
    place421 - place
    hoist421 - hoist
    place44 - place
    hoist44 - hoist
    place23 - place
    hoist23 - hoist
    place335 - place
    hoist335 - hoist
    place532 - place
    hoist532 - hoist
    place59 - place
    hoist59 - hoist
    place367 - place
    hoist367 - hoist
    place622 - place
    hoist622 - hoist
    place325 - place
    hoist325 - hoist
    place123 - place
    hoist123 - hoist
    place33 - place
    hoist33 - hoist
    place0 - place
    hoist0 - hoist
    crate949 - surface
    pallet949 - surface
    crate755 - surface
    pallet755 - surface
    crate686 - surface
    pallet686 - surface
    crate443 - surface
    pallet443 - surface
    crate733 - surface
    pallet733 - surface
    crate784 - surface
    pallet784 - surface
    crate348 - surface
    pallet348 - surface
    crate385 - surface
    pallet385 - surface
    crate572 - surface
    pallet572 - surface
    crate151 - surface
    pallet151 - surface
    crate985 - surface
    pallet985 - surface
    crate744 - surface
    pallet744 - surface
    crate648 - surface
    pallet648 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist256 place256 )
    ( available hoist256 )
    ( hoist-at hoist792 place792 )
    ( available hoist792 )
    ( hoist-at hoist35 place35 )
    ( available hoist35 )
    ( hoist-at hoist473 place473 )
    ( available hoist473 )
    ( hoist-at hoist388 place388 )
    ( available hoist388 )
    ( hoist-at hoist43 place43 )
    ( available hoist43 )
    ( hoist-at hoist935 place935 )
    ( available hoist935 )
    ( hoist-at hoist808 place808 )
    ( available hoist808 )
    ( hoist-at hoist125 place125 )
    ( available hoist125 )
    ( hoist-at hoist132 place132 )
    ( available hoist132 )
    ( hoist-at hoist843 place843 )
    ( available hoist843 )
    ( hoist-at hoist83 place83 )
    ( available hoist83 )
    ( hoist-at hoist911 place911 )
    ( available hoist911 )
    ( hoist-at hoist303 place303 )
    ( available hoist303 )
    ( hoist-at hoist79 place79 )
    ( available hoist79 )
    ( hoist-at hoist421 place421 )
    ( available hoist421 )
    ( hoist-at hoist44 place44 )
    ( available hoist44 )
    ( hoist-at hoist23 place23 )
    ( available hoist23 )
    ( hoist-at hoist335 place335 )
    ( available hoist335 )
    ( hoist-at hoist532 place532 )
    ( available hoist532 )
    ( hoist-at hoist59 place59 )
    ( available hoist59 )
    ( hoist-at hoist367 place367 )
    ( available hoist367 )
    ( hoist-at hoist622 place622 )
    ( available hoist622 )
    ( hoist-at hoist325 place325 )
    ( available hoist325 )
    ( hoist-at hoist123 place123 )
    ( available hoist123 )
    ( hoist-at hoist33 place33 )
    ( available hoist33 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet949 place367 )
    ( surface-at crate949 place367 )
    ( on crate949 pallet949 )
    ( is-crate crate949 )
    ( clear crate949 )
    ( surface-at pallet755 place622 )
    ( surface-at crate755 place622 )
    ( on crate755 pallet755 )
    ( is-crate crate755 )
    ( clear crate755 )
    ( surface-at pallet686 place335 )
    ( surface-at crate686 place335 )
    ( on crate686 pallet686 )
    ( is-crate crate686 )
    ( clear crate686 )
    ( surface-at pallet443 place59 )
    ( surface-at crate443 place59 )
    ( on crate443 pallet443 )
    ( is-crate crate443 )
    ( clear crate443 )
    ( surface-at pallet733 place843 )
    ( surface-at crate733 place843 )
    ( on crate733 pallet733 )
    ( is-crate crate733 )
    ( clear crate733 )
    ( surface-at pallet784 place35 )
    ( surface-at crate784 place35 )
    ( on crate784 pallet784 )
    ( is-crate crate784 )
    ( clear crate784 )
    ( surface-at pallet348 place622 )
    ( surface-at crate348 place622 )
    ( on crate348 pallet348 )
    ( is-crate crate348 )
    ( clear crate348 )
    ( surface-at pallet385 place622 )
    ( surface-at crate385 place622 )
    ( on crate385 pallet385 )
    ( is-crate crate385 )
    ( clear crate385 )
    ( surface-at pallet572 place622 )
    ( surface-at crate572 place622 )
    ( on crate572 pallet572 )
    ( is-crate crate572 )
    ( clear crate572 )
    ( surface-at pallet151 place83 )
    ( surface-at crate151 place83 )
    ( on crate151 pallet151 )
    ( is-crate crate151 )
    ( clear crate151 )
    ( surface-at pallet985 place792 )
    ( surface-at crate985 place792 )
    ( on crate985 pallet985 )
    ( is-crate crate985 )
    ( clear crate985 )
    ( surface-at pallet744 place79 )
    ( surface-at crate744 place79 )
    ( on crate744 pallet744 )
    ( is-crate crate744 )
    ( clear crate744 )
    ( surface-at pallet648 place421 )
    ( surface-at crate648 place421 )
    ( on crate648 pallet648 )
    ( is-crate crate648 )
    ( clear crate648 )
  )
  ( :tasks
    ( Make-On crate949 pallet0 )    ( Make-On crate755 crate949 )    ( Make-On crate686 crate755 )    ( Make-On crate443 crate686 )    ( Make-On crate733 crate443 )    ( Make-On crate784 crate733 )    ( Make-On crate348 crate784 )    ( Make-On crate385 crate348 )    ( Make-On crate572 crate385 )    ( Make-On crate151 crate572 )    ( Make-On crate985 crate151 )    ( Make-On crate744 crate985 )    ( Make-On crate648 crate744 )  )
)
