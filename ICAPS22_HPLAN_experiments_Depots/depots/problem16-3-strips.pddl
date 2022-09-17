( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place719 - place
    hoist719 - hoist
    place501 - place
    hoist501 - hoist
    place737 - place
    hoist737 - hoist
    place18 - place
    hoist18 - hoist
    place665 - place
    hoist665 - hoist
    place508 - place
    hoist508 - hoist
    place83 - place
    hoist83 - hoist
    place377 - place
    hoist377 - hoist
    place929 - place
    hoist929 - hoist
    place773 - place
    hoist773 - hoist
    place632 - place
    hoist632 - hoist
    place865 - place
    hoist865 - hoist
    place103 - place
    hoist103 - hoist
    place308 - place
    hoist308 - hoist
    place247 - place
    hoist247 - hoist
    place548 - place
    hoist548 - hoist
    place391 - place
    hoist391 - hoist
    place207 - place
    hoist207 - hoist
    place410 - place
    hoist410 - hoist
    place628 - place
    hoist628 - hoist
    place949 - place
    hoist949 - hoist
    place467 - place
    hoist467 - hoist
    place948 - place
    hoist948 - hoist
    place517 - place
    hoist517 - hoist
    place956 - place
    hoist956 - hoist
    place254 - place
    hoist254 - hoist
    place72 - place
    hoist72 - hoist
    place0 - place
    hoist0 - hoist
    crate400 - surface
    pallet400 - surface
    crate11 - surface
    pallet11 - surface
    crate989 - surface
    pallet989 - surface
    crate161 - surface
    pallet161 - surface
    crate735 - surface
    pallet735 - surface
    crate979 - surface
    pallet979 - surface
    crate884 - surface
    pallet884 - surface
    crate98 - surface
    pallet98 - surface
    crate310 - surface
    pallet310 - surface
    crate939 - surface
    pallet939 - surface
    crate789 - surface
    pallet789 - surface
    crate657 - surface
    pallet657 - surface
    crate731 - surface
    pallet731 - surface
    crate919 - surface
    pallet919 - surface
    crate806 - surface
    pallet806 - surface
    crate578 - surface
    pallet578 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist719 place719 )
    ( available hoist719 )
    ( hoist-at hoist501 place501 )
    ( available hoist501 )
    ( hoist-at hoist737 place737 )
    ( available hoist737 )
    ( hoist-at hoist18 place18 )
    ( available hoist18 )
    ( hoist-at hoist665 place665 )
    ( available hoist665 )
    ( hoist-at hoist508 place508 )
    ( available hoist508 )
    ( hoist-at hoist83 place83 )
    ( available hoist83 )
    ( hoist-at hoist377 place377 )
    ( available hoist377 )
    ( hoist-at hoist929 place929 )
    ( available hoist929 )
    ( hoist-at hoist773 place773 )
    ( available hoist773 )
    ( hoist-at hoist632 place632 )
    ( available hoist632 )
    ( hoist-at hoist865 place865 )
    ( available hoist865 )
    ( hoist-at hoist103 place103 )
    ( available hoist103 )
    ( hoist-at hoist308 place308 )
    ( available hoist308 )
    ( hoist-at hoist247 place247 )
    ( available hoist247 )
    ( hoist-at hoist548 place548 )
    ( available hoist548 )
    ( hoist-at hoist391 place391 )
    ( available hoist391 )
    ( hoist-at hoist207 place207 )
    ( available hoist207 )
    ( hoist-at hoist410 place410 )
    ( available hoist410 )
    ( hoist-at hoist628 place628 )
    ( available hoist628 )
    ( hoist-at hoist949 place949 )
    ( available hoist949 )
    ( hoist-at hoist467 place467 )
    ( available hoist467 )
    ( hoist-at hoist948 place948 )
    ( available hoist948 )
    ( hoist-at hoist517 place517 )
    ( available hoist517 )
    ( hoist-at hoist956 place956 )
    ( available hoist956 )
    ( hoist-at hoist254 place254 )
    ( available hoist254 )
    ( hoist-at hoist72 place72 )
    ( available hoist72 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet400 place18 )
    ( surface-at crate400 place18 )
    ( on crate400 pallet400 )
    ( is-crate crate400 )
    ( clear crate400 )
    ( surface-at pallet11 place948 )
    ( surface-at crate11 place948 )
    ( on crate11 pallet11 )
    ( is-crate crate11 )
    ( clear crate11 )
    ( surface-at pallet989 place773 )
    ( surface-at crate989 place773 )
    ( on crate989 pallet989 )
    ( is-crate crate989 )
    ( clear crate989 )
    ( surface-at pallet161 place207 )
    ( surface-at crate161 place207 )
    ( on crate161 pallet161 )
    ( is-crate crate161 )
    ( clear crate161 )
    ( surface-at pallet735 place308 )
    ( surface-at crate735 place308 )
    ( on crate735 pallet735 )
    ( is-crate crate735 )
    ( clear crate735 )
    ( surface-at pallet979 place628 )
    ( surface-at crate979 place628 )
    ( on crate979 pallet979 )
    ( is-crate crate979 )
    ( clear crate979 )
    ( surface-at pallet884 place949 )
    ( surface-at crate884 place949 )
    ( on crate884 pallet884 )
    ( is-crate crate884 )
    ( clear crate884 )
    ( surface-at pallet98 place207 )
    ( surface-at crate98 place207 )
    ( on crate98 pallet98 )
    ( is-crate crate98 )
    ( clear crate98 )
    ( surface-at pallet310 place207 )
    ( surface-at crate310 place207 )
    ( on crate310 pallet310 )
    ( is-crate crate310 )
    ( clear crate310 )
    ( surface-at pallet939 place517 )
    ( surface-at crate939 place517 )
    ( on crate939 pallet939 )
    ( is-crate crate939 )
    ( clear crate939 )
    ( surface-at pallet789 place737 )
    ( surface-at crate789 place737 )
    ( on crate789 pallet789 )
    ( is-crate crate789 )
    ( clear crate789 )
    ( surface-at pallet657 place632 )
    ( surface-at crate657 place632 )
    ( on crate657 pallet657 )
    ( is-crate crate657 )
    ( clear crate657 )
    ( surface-at pallet731 place929 )
    ( surface-at crate731 place929 )
    ( on crate731 pallet731 )
    ( is-crate crate731 )
    ( clear crate731 )
    ( surface-at pallet919 place207 )
    ( surface-at crate919 place207 )
    ( on crate919 pallet919 )
    ( is-crate crate919 )
    ( clear crate919 )
    ( surface-at pallet806 place18 )
    ( surface-at crate806 place18 )
    ( on crate806 pallet806 )
    ( is-crate crate806 )
    ( clear crate806 )
    ( surface-at pallet578 place632 )
    ( surface-at crate578 place632 )
    ( on crate578 pallet578 )
    ( is-crate crate578 )
    ( clear crate578 )
  )
  ( :goal
    ( and
    )
  )
)
