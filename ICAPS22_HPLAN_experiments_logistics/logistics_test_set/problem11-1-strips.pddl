( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    l951 - location
    l859 - location
    l914 - location
    l745 - location
    l959 - location
    l238 - location
    l928 - location
    l945 - location
    l661 - location
    p978 - obj
    p148 - obj
    p196 - obj
    p655 - obj
    p737 - obj
    p333 - obj
    p976 - obj
    p647 - obj
    p112 - obj
    p509 - obj
    p321 - obj
    t1249 - truck
    t1976 - truck
    t1416 - truck
    t1378 - truck
    t1866 - truck
    t1088 - truck
    t1973 - truck
    t1257 - truck
    t1351 - truck
    t1413 - truck
  )
  ( :init
    ( in-city l951 c000 )
    ( in-city l859 c000 )
    ( in-city l914 c000 )
    ( in-city l745 c000 )
    ( in-city l959 c000 )
    ( in-city l238 c000 )
    ( in-city l928 c000 )
    ( in-city l945 c000 )
    ( in-city l661 c000 )
    ( in-truck p978 t1416 )
    ( in-truck p148 t1257 )
    ( in-truck p196 t1976 )
    ( in-truck p655 t1378 )
    ( in-truck p737 t1249 )
    ( in-truck p333 t1976 )
    ( obj-at p976 l661 )
    ( in-truck p647 t1351 )
    ( in-truck p112 t1249 )
    ( obj-at p509 l859 )
    ( in-truck p321 t1416 )
    ( truck-at t1249 l951 )
    ( truck-at t1976 l914 )
    ( truck-at t1416 l745 )
    ( truck-at t1378 l859 )
    ( truck-at t1866 l951 )
    ( truck-at t1088 l859 )
    ( truck-at t1973 l945 )
    ( truck-at t1257 l661 )
    ( truck-at t1351 l745 )
    ( truck-at t1413 l859 )
    ( greater-than p148 p978 )
    ( greater-than p196 p978 )
    ( greater-than p196 p148 )
    ( greater-than p655 p978 )
    ( greater-than p655 p148 )
    ( greater-than p655 p196 )
    ( greater-than p737 p978 )
    ( greater-than p737 p148 )
    ( greater-than p737 p196 )
    ( greater-than p737 p655 )
    ( greater-than p333 p978 )
    ( greater-than p333 p148 )
    ( greater-than p333 p196 )
    ( greater-than p333 p655 )
    ( greater-than p333 p737 )
    ( greater-than p976 p978 )
    ( greater-than p976 p148 )
    ( greater-than p976 p196 )
    ( greater-than p976 p655 )
    ( greater-than p976 p737 )
    ( greater-than p976 p333 )
    ( greater-than p647 p978 )
    ( greater-than p647 p148 )
    ( greater-than p647 p196 )
    ( greater-than p647 p655 )
    ( greater-than p647 p737 )
    ( greater-than p647 p333 )
    ( greater-than p647 p976 )
    ( greater-than p112 p978 )
    ( greater-than p112 p148 )
    ( greater-than p112 p196 )
    ( greater-than p112 p655 )
    ( greater-than p112 p737 )
    ( greater-than p112 p333 )
    ( greater-than p112 p976 )
    ( greater-than p112 p647 )
    ( greater-than p509 p978 )
    ( greater-than p509 p148 )
    ( greater-than p509 p196 )
    ( greater-than p509 p655 )
    ( greater-than p509 p737 )
    ( greater-than p509 p333 )
    ( greater-than p509 p976 )
    ( greater-than p509 p647 )
    ( greater-than p509 p112 )
    ( greater-than p321 p978 )
    ( greater-than p321 p148 )
    ( greater-than p321 p196 )
    ( greater-than p321 p655 )
    ( greater-than p321 p737 )
    ( greater-than p321 p333 )
    ( greater-than p321 p976 )
    ( greater-than p321 p647 )
    ( greater-than p321 p112 )
    ( greater-than p321 p509 )
  )
  ( :goal
    ( and
      ( obj-at p978 l951 )
      ( obj-at p148 l951 )
      ( obj-at p196 l951 )
      ( obj-at p655 l951 )
      ( obj-at p737 l951 )
      ( obj-at p333 l951 )
      ( obj-at p976 l951 )
      ( obj-at p647 l951 )
      ( obj-at p112 l951 )
      ( obj-at p509 l951 )
      ( obj-at p321 l951 )
    )
  )
)
