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
      ?auto_1271 - OBJ
      ?auto_1270 - LOCATION
    )
    :vars
    (
      ?auto_1272 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1272 ?auto_1270 ) ( IN-TRUCK ?auto_1271 ?auto_1272 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1271 ?auto_1272 ?auto_1270 )
      ( DELIVER-1PKG-VERIFY ?auto_1271 ?auto_1270 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1283 - OBJ
      ?auto_1282 - LOCATION
    )
    :vars
    (
      ?auto_1284 - TRUCK
      ?auto_1285 - LOCATION
      ?auto_1286 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1283 ?auto_1284 ) ( TRUCK-AT ?auto_1284 ?auto_1285 ) ( IN-CITY ?auto_1285 ?auto_1286 ) ( IN-CITY ?auto_1282 ?auto_1286 ) ( not ( = ?auto_1282 ?auto_1285 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1284 ?auto_1285 ?auto_1282 ?auto_1286 )
      ( DELIVER-1PKG ?auto_1283 ?auto_1282 )
      ( DELIVER-1PKG-VERIFY ?auto_1283 ?auto_1282 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1301 - OBJ
      ?auto_1300 - LOCATION
    )
    :vars
    (
      ?auto_1303 - TRUCK
      ?auto_1302 - LOCATION
      ?auto_1304 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1303 ?auto_1302 ) ( IN-CITY ?auto_1302 ?auto_1304 ) ( IN-CITY ?auto_1300 ?auto_1304 ) ( not ( = ?auto_1300 ?auto_1302 ) ) ( OBJ-AT ?auto_1301 ?auto_1302 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1301 ?auto_1303 ?auto_1302 )
      ( DELIVER-1PKG ?auto_1301 ?auto_1300 )
      ( DELIVER-1PKG-VERIFY ?auto_1301 ?auto_1300 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1319 - OBJ
      ?auto_1318 - LOCATION
    )
    :vars
    (
      ?auto_1320 - LOCATION
      ?auto_1322 - CITY
      ?auto_1321 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1320 ?auto_1322 ) ( IN-CITY ?auto_1318 ?auto_1322 ) ( not ( = ?auto_1318 ?auto_1320 ) ) ( OBJ-AT ?auto_1319 ?auto_1320 ) ( TRUCK-AT ?auto_1321 ?auto_1318 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1321 ?auto_1318 ?auto_1320 ?auto_1322 )
      ( DELIVER-1PKG ?auto_1319 ?auto_1318 )
      ( DELIVER-1PKG-VERIFY ?auto_1319 ?auto_1318 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1376 - OBJ
      ?auto_1375 - LOCATION
    )
    :vars
    (
      ?auto_1377 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1377 ?auto_1375 ) ( IN-TRUCK ?auto_1376 ?auto_1377 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1376 ?auto_1377 ?auto_1375 )
      ( DELIVER-1PKG-VERIFY ?auto_1376 ?auto_1375 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1379 - OBJ
      ?auto_1380 - OBJ
      ?auto_1378 - LOCATION
    )
    :vars
    (
      ?auto_1381 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1380 ?auto_1379 ) ) ( TRUCK-AT ?auto_1381 ?auto_1378 ) ( IN-TRUCK ?auto_1380 ?auto_1381 ) ( OBJ-AT ?auto_1379 ?auto_1378 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1380 ?auto_1378 )
      ( DELIVER-2PKG-VERIFY ?auto_1379 ?auto_1380 ?auto_1378 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1383 - OBJ
      ?auto_1384 - OBJ
      ?auto_1382 - LOCATION
    )
    :vars
    (
      ?auto_1385 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1384 ?auto_1383 ) ) ( TRUCK-AT ?auto_1385 ?auto_1382 ) ( IN-TRUCK ?auto_1383 ?auto_1385 ) ( OBJ-AT ?auto_1384 ?auto_1382 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1383 ?auto_1382 )
      ( DELIVER-2PKG-VERIFY ?auto_1383 ?auto_1384 ?auto_1382 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1426 - OBJ
      ?auto_1425 - LOCATION
    )
    :vars
    (
      ?auto_1427 - TRUCK
      ?auto_1428 - LOCATION
      ?auto_1429 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1426 ?auto_1427 ) ( TRUCK-AT ?auto_1427 ?auto_1428 ) ( IN-CITY ?auto_1428 ?auto_1429 ) ( IN-CITY ?auto_1425 ?auto_1429 ) ( not ( = ?auto_1425 ?auto_1428 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1427 ?auto_1428 ?auto_1425 ?auto_1429 )
      ( DELIVER-1PKG ?auto_1426 ?auto_1425 )
      ( DELIVER-1PKG-VERIFY ?auto_1426 ?auto_1425 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1431 - OBJ
      ?auto_1432 - OBJ
      ?auto_1430 - LOCATION
    )
    :vars
    (
      ?auto_1434 - TRUCK
      ?auto_1435 - LOCATION
      ?auto_1433 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1432 ?auto_1431 ) ) ( IN-TRUCK ?auto_1432 ?auto_1434 ) ( TRUCK-AT ?auto_1434 ?auto_1435 ) ( IN-CITY ?auto_1435 ?auto_1433 ) ( IN-CITY ?auto_1430 ?auto_1433 ) ( not ( = ?auto_1430 ?auto_1435 ) ) ( OBJ-AT ?auto_1431 ?auto_1430 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1432 ?auto_1430 )
      ( DELIVER-2PKG-VERIFY ?auto_1431 ?auto_1432 ?auto_1430 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1437 - OBJ
      ?auto_1438 - OBJ
      ?auto_1436 - LOCATION
    )
    :vars
    (
      ?auto_1440 - TRUCK
      ?auto_1439 - LOCATION
      ?auto_1441 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1438 ?auto_1437 ) ) ( IN-TRUCK ?auto_1437 ?auto_1440 ) ( TRUCK-AT ?auto_1440 ?auto_1439 ) ( IN-CITY ?auto_1439 ?auto_1441 ) ( IN-CITY ?auto_1436 ?auto_1441 ) ( not ( = ?auto_1436 ?auto_1439 ) ) ( OBJ-AT ?auto_1438 ?auto_1436 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1438 ?auto_1437 ?auto_1436 )
      ( DELIVER-2PKG-VERIFY ?auto_1437 ?auto_1438 ?auto_1436 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1500 - OBJ
      ?auto_1499 - LOCATION
    )
    :vars
    (
      ?auto_1504 - OBJ
      ?auto_1502 - TRUCK
      ?auto_1501 - LOCATION
      ?auto_1503 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1500 ?auto_1504 ) ) ( TRUCK-AT ?auto_1502 ?auto_1501 ) ( IN-CITY ?auto_1501 ?auto_1503 ) ( IN-CITY ?auto_1499 ?auto_1503 ) ( not ( = ?auto_1499 ?auto_1501 ) ) ( OBJ-AT ?auto_1504 ?auto_1499 ) ( OBJ-AT ?auto_1500 ?auto_1501 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1500 ?auto_1502 ?auto_1501 )
      ( DELIVER-2PKG ?auto_1504 ?auto_1500 ?auto_1499 )
      ( DELIVER-1PKG-VERIFY ?auto_1500 ?auto_1499 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1506 - OBJ
      ?auto_1507 - OBJ
      ?auto_1505 - LOCATION
    )
    :vars
    (
      ?auto_1510 - TRUCK
      ?auto_1508 - LOCATION
      ?auto_1509 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1507 ?auto_1506 ) ) ( TRUCK-AT ?auto_1510 ?auto_1508 ) ( IN-CITY ?auto_1508 ?auto_1509 ) ( IN-CITY ?auto_1505 ?auto_1509 ) ( not ( = ?auto_1505 ?auto_1508 ) ) ( OBJ-AT ?auto_1506 ?auto_1505 ) ( OBJ-AT ?auto_1507 ?auto_1508 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1507 ?auto_1505 )
      ( DELIVER-2PKG-VERIFY ?auto_1506 ?auto_1507 ?auto_1505 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1512 - OBJ
      ?auto_1513 - OBJ
      ?auto_1511 - LOCATION
    )
    :vars
    (
      ?auto_1516 - TRUCK
      ?auto_1514 - LOCATION
      ?auto_1515 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1513 ?auto_1512 ) ) ( TRUCK-AT ?auto_1516 ?auto_1514 ) ( IN-CITY ?auto_1514 ?auto_1515 ) ( IN-CITY ?auto_1511 ?auto_1515 ) ( not ( = ?auto_1511 ?auto_1514 ) ) ( OBJ-AT ?auto_1513 ?auto_1511 ) ( OBJ-AT ?auto_1512 ?auto_1514 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1513 ?auto_1512 ?auto_1511 )
      ( DELIVER-2PKG-VERIFY ?auto_1512 ?auto_1513 ?auto_1511 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1575 - OBJ
      ?auto_1574 - LOCATION
    )
    :vars
    (
      ?auto_1578 - OBJ
      ?auto_1576 - LOCATION
      ?auto_1577 - CITY
      ?auto_1579 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1575 ?auto_1578 ) ) ( IN-CITY ?auto_1576 ?auto_1577 ) ( IN-CITY ?auto_1574 ?auto_1577 ) ( not ( = ?auto_1574 ?auto_1576 ) ) ( OBJ-AT ?auto_1578 ?auto_1574 ) ( OBJ-AT ?auto_1575 ?auto_1576 ) ( TRUCK-AT ?auto_1579 ?auto_1574 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1579 ?auto_1574 ?auto_1576 ?auto_1577 )
      ( DELIVER-2PKG ?auto_1578 ?auto_1575 ?auto_1574 )
      ( DELIVER-1PKG-VERIFY ?auto_1575 ?auto_1574 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1581 - OBJ
      ?auto_1582 - OBJ
      ?auto_1580 - LOCATION
    )
    :vars
    (
      ?auto_1585 - LOCATION
      ?auto_1583 - CITY
      ?auto_1584 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1582 ?auto_1581 ) ) ( IN-CITY ?auto_1585 ?auto_1583 ) ( IN-CITY ?auto_1580 ?auto_1583 ) ( not ( = ?auto_1580 ?auto_1585 ) ) ( OBJ-AT ?auto_1581 ?auto_1580 ) ( OBJ-AT ?auto_1582 ?auto_1585 ) ( TRUCK-AT ?auto_1584 ?auto_1580 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1582 ?auto_1580 )
      ( DELIVER-2PKG-VERIFY ?auto_1581 ?auto_1582 ?auto_1580 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1587 - OBJ
      ?auto_1588 - OBJ
      ?auto_1586 - LOCATION
    )
    :vars
    (
      ?auto_1589 - LOCATION
      ?auto_1591 - CITY
      ?auto_1590 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1588 ?auto_1587 ) ) ( IN-CITY ?auto_1589 ?auto_1591 ) ( IN-CITY ?auto_1586 ?auto_1591 ) ( not ( = ?auto_1586 ?auto_1589 ) ) ( OBJ-AT ?auto_1588 ?auto_1586 ) ( OBJ-AT ?auto_1587 ?auto_1589 ) ( TRUCK-AT ?auto_1590 ?auto_1586 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1588 ?auto_1587 ?auto_1586 )
      ( DELIVER-2PKG-VERIFY ?auto_1587 ?auto_1588 ?auto_1586 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1650 - OBJ
      ?auto_1649 - LOCATION
    )
    :vars
    (
      ?auto_1654 - OBJ
      ?auto_1651 - LOCATION
      ?auto_1653 - CITY
      ?auto_1652 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1650 ?auto_1654 ) ) ( IN-CITY ?auto_1651 ?auto_1653 ) ( IN-CITY ?auto_1649 ?auto_1653 ) ( not ( = ?auto_1649 ?auto_1651 ) ) ( OBJ-AT ?auto_1650 ?auto_1651 ) ( TRUCK-AT ?auto_1652 ?auto_1649 ) ( IN-TRUCK ?auto_1654 ?auto_1652 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1654 ?auto_1649 )
      ( DELIVER-2PKG ?auto_1654 ?auto_1650 ?auto_1649 )
      ( DELIVER-1PKG-VERIFY ?auto_1650 ?auto_1649 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1656 - OBJ
      ?auto_1657 - OBJ
      ?auto_1655 - LOCATION
    )
    :vars
    (
      ?auto_1660 - LOCATION
      ?auto_1659 - CITY
      ?auto_1658 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1657 ?auto_1656 ) ) ( IN-CITY ?auto_1660 ?auto_1659 ) ( IN-CITY ?auto_1655 ?auto_1659 ) ( not ( = ?auto_1655 ?auto_1660 ) ) ( OBJ-AT ?auto_1657 ?auto_1660 ) ( TRUCK-AT ?auto_1658 ?auto_1655 ) ( IN-TRUCK ?auto_1656 ?auto_1658 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1657 ?auto_1655 )
      ( DELIVER-2PKG-VERIFY ?auto_1656 ?auto_1657 ?auto_1655 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1662 - OBJ
      ?auto_1663 - OBJ
      ?auto_1661 - LOCATION
    )
    :vars
    (
      ?auto_1666 - LOCATION
      ?auto_1664 - CITY
      ?auto_1665 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1663 ?auto_1662 ) ) ( IN-CITY ?auto_1666 ?auto_1664 ) ( IN-CITY ?auto_1661 ?auto_1664 ) ( not ( = ?auto_1661 ?auto_1666 ) ) ( OBJ-AT ?auto_1662 ?auto_1666 ) ( TRUCK-AT ?auto_1665 ?auto_1661 ) ( IN-TRUCK ?auto_1663 ?auto_1665 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1663 ?auto_1662 ?auto_1661 )
      ( DELIVER-2PKG-VERIFY ?auto_1662 ?auto_1663 ?auto_1661 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1725 - OBJ
      ?auto_1724 - LOCATION
    )
    :vars
    (
      ?auto_1729 - OBJ
      ?auto_1728 - LOCATION
      ?auto_1726 - CITY
      ?auto_1727 - TRUCK
      ?auto_1730 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1725 ?auto_1729 ) ) ( IN-CITY ?auto_1728 ?auto_1726 ) ( IN-CITY ?auto_1724 ?auto_1726 ) ( not ( = ?auto_1724 ?auto_1728 ) ) ( OBJ-AT ?auto_1725 ?auto_1728 ) ( IN-TRUCK ?auto_1729 ?auto_1727 ) ( TRUCK-AT ?auto_1727 ?auto_1730 ) ( IN-CITY ?auto_1730 ?auto_1726 ) ( not ( = ?auto_1724 ?auto_1730 ) ) ( not ( = ?auto_1728 ?auto_1730 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1727 ?auto_1730 ?auto_1724 ?auto_1726 )
      ( DELIVER-2PKG ?auto_1729 ?auto_1725 ?auto_1724 )
      ( DELIVER-1PKG-VERIFY ?auto_1725 ?auto_1724 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1732 - OBJ
      ?auto_1733 - OBJ
      ?auto_1731 - LOCATION
    )
    :vars
    (
      ?auto_1736 - LOCATION
      ?auto_1734 - CITY
      ?auto_1735 - TRUCK
      ?auto_1737 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1733 ?auto_1732 ) ) ( IN-CITY ?auto_1736 ?auto_1734 ) ( IN-CITY ?auto_1731 ?auto_1734 ) ( not ( = ?auto_1731 ?auto_1736 ) ) ( OBJ-AT ?auto_1733 ?auto_1736 ) ( IN-TRUCK ?auto_1732 ?auto_1735 ) ( TRUCK-AT ?auto_1735 ?auto_1737 ) ( IN-CITY ?auto_1737 ?auto_1734 ) ( not ( = ?auto_1731 ?auto_1737 ) ) ( not ( = ?auto_1736 ?auto_1737 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1733 ?auto_1731 )
      ( DELIVER-2PKG-VERIFY ?auto_1732 ?auto_1733 ?auto_1731 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1739 - OBJ
      ?auto_1740 - OBJ
      ?auto_1738 - LOCATION
    )
    :vars
    (
      ?auto_1741 - LOCATION
      ?auto_1743 - CITY
      ?auto_1744 - TRUCK
      ?auto_1742 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1740 ?auto_1739 ) ) ( IN-CITY ?auto_1741 ?auto_1743 ) ( IN-CITY ?auto_1738 ?auto_1743 ) ( not ( = ?auto_1738 ?auto_1741 ) ) ( OBJ-AT ?auto_1739 ?auto_1741 ) ( IN-TRUCK ?auto_1740 ?auto_1744 ) ( TRUCK-AT ?auto_1744 ?auto_1742 ) ( IN-CITY ?auto_1742 ?auto_1743 ) ( not ( = ?auto_1738 ?auto_1742 ) ) ( not ( = ?auto_1741 ?auto_1742 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1740 ?auto_1739 ?auto_1738 )
      ( DELIVER-2PKG-VERIFY ?auto_1739 ?auto_1740 ?auto_1738 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1811 - OBJ
      ?auto_1810 - LOCATION
    )
    :vars
    (
      ?auto_1816 - OBJ
      ?auto_1812 - LOCATION
      ?auto_1814 - CITY
      ?auto_1815 - TRUCK
      ?auto_1813 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1811 ?auto_1816 ) ) ( IN-CITY ?auto_1812 ?auto_1814 ) ( IN-CITY ?auto_1810 ?auto_1814 ) ( not ( = ?auto_1810 ?auto_1812 ) ) ( OBJ-AT ?auto_1811 ?auto_1812 ) ( TRUCK-AT ?auto_1815 ?auto_1813 ) ( IN-CITY ?auto_1813 ?auto_1814 ) ( not ( = ?auto_1810 ?auto_1813 ) ) ( not ( = ?auto_1812 ?auto_1813 ) ) ( OBJ-AT ?auto_1816 ?auto_1813 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1816 ?auto_1815 ?auto_1813 )
      ( DELIVER-2PKG ?auto_1816 ?auto_1811 ?auto_1810 )
      ( DELIVER-1PKG-VERIFY ?auto_1811 ?auto_1810 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1818 - OBJ
      ?auto_1819 - OBJ
      ?auto_1817 - LOCATION
    )
    :vars
    (
      ?auto_1822 - LOCATION
      ?auto_1820 - CITY
      ?auto_1821 - TRUCK
      ?auto_1823 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1819 ?auto_1818 ) ) ( IN-CITY ?auto_1822 ?auto_1820 ) ( IN-CITY ?auto_1817 ?auto_1820 ) ( not ( = ?auto_1817 ?auto_1822 ) ) ( OBJ-AT ?auto_1819 ?auto_1822 ) ( TRUCK-AT ?auto_1821 ?auto_1823 ) ( IN-CITY ?auto_1823 ?auto_1820 ) ( not ( = ?auto_1817 ?auto_1823 ) ) ( not ( = ?auto_1822 ?auto_1823 ) ) ( OBJ-AT ?auto_1818 ?auto_1823 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1819 ?auto_1817 )
      ( DELIVER-2PKG-VERIFY ?auto_1818 ?auto_1819 ?auto_1817 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1825 - OBJ
      ?auto_1826 - OBJ
      ?auto_1824 - LOCATION
    )
    :vars
    (
      ?auto_1827 - LOCATION
      ?auto_1828 - CITY
      ?auto_1830 - TRUCK
      ?auto_1829 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1826 ?auto_1825 ) ) ( IN-CITY ?auto_1827 ?auto_1828 ) ( IN-CITY ?auto_1824 ?auto_1828 ) ( not ( = ?auto_1824 ?auto_1827 ) ) ( OBJ-AT ?auto_1825 ?auto_1827 ) ( TRUCK-AT ?auto_1830 ?auto_1829 ) ( IN-CITY ?auto_1829 ?auto_1828 ) ( not ( = ?auto_1824 ?auto_1829 ) ) ( not ( = ?auto_1827 ?auto_1829 ) ) ( OBJ-AT ?auto_1826 ?auto_1829 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1826 ?auto_1825 ?auto_1824 )
      ( DELIVER-2PKG-VERIFY ?auto_1825 ?auto_1826 ?auto_1824 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1897 - OBJ
      ?auto_1896 - LOCATION
    )
    :vars
    (
      ?auto_1902 - OBJ
      ?auto_1898 - LOCATION
      ?auto_1899 - CITY
      ?auto_1900 - LOCATION
      ?auto_1901 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1897 ?auto_1902 ) ) ( IN-CITY ?auto_1898 ?auto_1899 ) ( IN-CITY ?auto_1896 ?auto_1899 ) ( not ( = ?auto_1896 ?auto_1898 ) ) ( OBJ-AT ?auto_1897 ?auto_1898 ) ( IN-CITY ?auto_1900 ?auto_1899 ) ( not ( = ?auto_1896 ?auto_1900 ) ) ( not ( = ?auto_1898 ?auto_1900 ) ) ( OBJ-AT ?auto_1902 ?auto_1900 ) ( TRUCK-AT ?auto_1901 ?auto_1896 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1901 ?auto_1896 ?auto_1900 ?auto_1899 )
      ( DELIVER-2PKG ?auto_1902 ?auto_1897 ?auto_1896 )
      ( DELIVER-1PKG-VERIFY ?auto_1897 ?auto_1896 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1904 - OBJ
      ?auto_1905 - OBJ
      ?auto_1903 - LOCATION
    )
    :vars
    (
      ?auto_1906 - LOCATION
      ?auto_1907 - CITY
      ?auto_1908 - LOCATION
      ?auto_1909 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1905 ?auto_1904 ) ) ( IN-CITY ?auto_1906 ?auto_1907 ) ( IN-CITY ?auto_1903 ?auto_1907 ) ( not ( = ?auto_1903 ?auto_1906 ) ) ( OBJ-AT ?auto_1905 ?auto_1906 ) ( IN-CITY ?auto_1908 ?auto_1907 ) ( not ( = ?auto_1903 ?auto_1908 ) ) ( not ( = ?auto_1906 ?auto_1908 ) ) ( OBJ-AT ?auto_1904 ?auto_1908 ) ( TRUCK-AT ?auto_1909 ?auto_1903 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1905 ?auto_1903 )
      ( DELIVER-2PKG-VERIFY ?auto_1904 ?auto_1905 ?auto_1903 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1911 - OBJ
      ?auto_1912 - OBJ
      ?auto_1910 - LOCATION
    )
    :vars
    (
      ?auto_1913 - LOCATION
      ?auto_1914 - CITY
      ?auto_1916 - LOCATION
      ?auto_1915 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1912 ?auto_1911 ) ) ( IN-CITY ?auto_1913 ?auto_1914 ) ( IN-CITY ?auto_1910 ?auto_1914 ) ( not ( = ?auto_1910 ?auto_1913 ) ) ( OBJ-AT ?auto_1911 ?auto_1913 ) ( IN-CITY ?auto_1916 ?auto_1914 ) ( not ( = ?auto_1910 ?auto_1916 ) ) ( not ( = ?auto_1913 ?auto_1916 ) ) ( OBJ-AT ?auto_1912 ?auto_1916 ) ( TRUCK-AT ?auto_1915 ?auto_1910 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1912 ?auto_1911 ?auto_1910 )
      ( DELIVER-2PKG-VERIFY ?auto_1911 ?auto_1912 ?auto_1910 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2076 - OBJ
      ?auto_2075 - LOCATION
    )
    :vars
    (
      ?auto_2077 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2077 ?auto_2075 ) ( IN-TRUCK ?auto_2076 ?auto_2077 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_2076 ?auto_2077 ?auto_2075 )
      ( DELIVER-1PKG-VERIFY ?auto_2076 ?auto_2075 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2079 - OBJ
      ?auto_2080 - OBJ
      ?auto_2078 - LOCATION
    )
    :vars
    (
      ?auto_2081 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2080 ?auto_2079 ) ) ( TRUCK-AT ?auto_2081 ?auto_2078 ) ( IN-TRUCK ?auto_2080 ?auto_2081 ) ( OBJ-AT ?auto_2079 ?auto_2078 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2080 ?auto_2078 )
      ( DELIVER-2PKG-VERIFY ?auto_2079 ?auto_2080 ?auto_2078 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2083 - OBJ
      ?auto_2084 - OBJ
      ?auto_2082 - LOCATION
    )
    :vars
    (
      ?auto_2085 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2084 ?auto_2083 ) ) ( TRUCK-AT ?auto_2085 ?auto_2082 ) ( IN-TRUCK ?auto_2084 ?auto_2085 ) ( OBJ-AT ?auto_2083 ?auto_2082 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2084 ?auto_2082 )
      ( DELIVER-2PKG-VERIFY ?auto_2083 ?auto_2084 ?auto_2082 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2087 - OBJ
      ?auto_2088 - OBJ
      ?auto_2086 - LOCATION
    )
    :vars
    (
      ?auto_2089 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2088 ?auto_2087 ) ) ( TRUCK-AT ?auto_2089 ?auto_2086 ) ( IN-TRUCK ?auto_2087 ?auto_2089 ) ( OBJ-AT ?auto_2088 ?auto_2086 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2087 ?auto_2086 )
      ( DELIVER-2PKG-VERIFY ?auto_2087 ?auto_2088 ?auto_2086 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2091 - OBJ
      ?auto_2092 - OBJ
      ?auto_2090 - LOCATION
    )
    :vars
    (
      ?auto_2093 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2092 ?auto_2091 ) ) ( TRUCK-AT ?auto_2093 ?auto_2090 ) ( IN-TRUCK ?auto_2091 ?auto_2093 ) ( OBJ-AT ?auto_2092 ?auto_2090 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2091 ?auto_2090 )
      ( DELIVER-2PKG-VERIFY ?auto_2091 ?auto_2092 ?auto_2090 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2104 - OBJ
      ?auto_2105 - OBJ
      ?auto_2106 - OBJ
      ?auto_2103 - LOCATION
    )
    :vars
    (
      ?auto_2107 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2105 ?auto_2104 ) ) ( not ( = ?auto_2106 ?auto_2104 ) ) ( not ( = ?auto_2106 ?auto_2105 ) ) ( TRUCK-AT ?auto_2107 ?auto_2103 ) ( IN-TRUCK ?auto_2106 ?auto_2107 ) ( OBJ-AT ?auto_2104 ?auto_2103 ) ( OBJ-AT ?auto_2105 ?auto_2103 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2106 ?auto_2103 )
      ( DELIVER-3PKG-VERIFY ?auto_2104 ?auto_2105 ?auto_2106 ?auto_2103 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2114 - OBJ
      ?auto_2115 - OBJ
      ?auto_2116 - OBJ
      ?auto_2113 - LOCATION
    )
    :vars
    (
      ?auto_2117 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2115 ?auto_2114 ) ) ( not ( = ?auto_2116 ?auto_2114 ) ) ( not ( = ?auto_2116 ?auto_2115 ) ) ( TRUCK-AT ?auto_2117 ?auto_2113 ) ( IN-TRUCK ?auto_2115 ?auto_2117 ) ( OBJ-AT ?auto_2114 ?auto_2113 ) ( OBJ-AT ?auto_2116 ?auto_2113 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2115 ?auto_2113 )
      ( DELIVER-3PKG-VERIFY ?auto_2114 ?auto_2115 ?auto_2116 ?auto_2113 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2124 - OBJ
      ?auto_2125 - OBJ
      ?auto_2126 - OBJ
      ?auto_2123 - LOCATION
    )
    :vars
    (
      ?auto_2127 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2125 ?auto_2124 ) ) ( not ( = ?auto_2126 ?auto_2124 ) ) ( not ( = ?auto_2126 ?auto_2125 ) ) ( TRUCK-AT ?auto_2127 ?auto_2123 ) ( IN-TRUCK ?auto_2126 ?auto_2127 ) ( OBJ-AT ?auto_2124 ?auto_2123 ) ( OBJ-AT ?auto_2125 ?auto_2123 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2126 ?auto_2123 )
      ( DELIVER-3PKG-VERIFY ?auto_2124 ?auto_2125 ?auto_2126 ?auto_2123 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2134 - OBJ
      ?auto_2135 - OBJ
      ?auto_2136 - OBJ
      ?auto_2133 - LOCATION
    )
    :vars
    (
      ?auto_2137 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2135 ?auto_2134 ) ) ( not ( = ?auto_2136 ?auto_2134 ) ) ( not ( = ?auto_2136 ?auto_2135 ) ) ( TRUCK-AT ?auto_2137 ?auto_2133 ) ( IN-TRUCK ?auto_2135 ?auto_2137 ) ( OBJ-AT ?auto_2134 ?auto_2133 ) ( OBJ-AT ?auto_2136 ?auto_2133 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2135 ?auto_2133 )
      ( DELIVER-3PKG-VERIFY ?auto_2134 ?auto_2135 ?auto_2136 ?auto_2133 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2154 - OBJ
      ?auto_2155 - OBJ
      ?auto_2156 - OBJ
      ?auto_2153 - LOCATION
    )
    :vars
    (
      ?auto_2157 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2155 ?auto_2154 ) ) ( not ( = ?auto_2156 ?auto_2154 ) ) ( not ( = ?auto_2156 ?auto_2155 ) ) ( TRUCK-AT ?auto_2157 ?auto_2153 ) ( IN-TRUCK ?auto_2154 ?auto_2157 ) ( OBJ-AT ?auto_2155 ?auto_2153 ) ( OBJ-AT ?auto_2156 ?auto_2153 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2154 ?auto_2153 )
      ( DELIVER-3PKG-VERIFY ?auto_2154 ?auto_2155 ?auto_2156 ?auto_2153 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2164 - OBJ
      ?auto_2165 - OBJ
      ?auto_2166 - OBJ
      ?auto_2163 - LOCATION
    )
    :vars
    (
      ?auto_2167 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2165 ?auto_2164 ) ) ( not ( = ?auto_2166 ?auto_2164 ) ) ( not ( = ?auto_2166 ?auto_2165 ) ) ( TRUCK-AT ?auto_2167 ?auto_2163 ) ( IN-TRUCK ?auto_2164 ?auto_2167 ) ( OBJ-AT ?auto_2165 ?auto_2163 ) ( OBJ-AT ?auto_2166 ?auto_2163 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2164 ?auto_2163 )
      ( DELIVER-3PKG-VERIFY ?auto_2164 ?auto_2165 ?auto_2166 ?auto_2163 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2194 - OBJ
      ?auto_2193 - LOCATION
    )
    :vars
    (
      ?auto_2195 - TRUCK
      ?auto_2196 - LOCATION
      ?auto_2197 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2194 ?auto_2195 ) ( TRUCK-AT ?auto_2195 ?auto_2196 ) ( IN-CITY ?auto_2196 ?auto_2197 ) ( IN-CITY ?auto_2193 ?auto_2197 ) ( not ( = ?auto_2193 ?auto_2196 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2195 ?auto_2196 ?auto_2193 ?auto_2197 )
      ( DELIVER-1PKG ?auto_2194 ?auto_2193 )
      ( DELIVER-1PKG-VERIFY ?auto_2194 ?auto_2193 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2199 - OBJ
      ?auto_2200 - OBJ
      ?auto_2198 - LOCATION
    )
    :vars
    (
      ?auto_2202 - TRUCK
      ?auto_2201 - LOCATION
      ?auto_2203 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2200 ?auto_2199 ) ) ( IN-TRUCK ?auto_2200 ?auto_2202 ) ( TRUCK-AT ?auto_2202 ?auto_2201 ) ( IN-CITY ?auto_2201 ?auto_2203 ) ( IN-CITY ?auto_2198 ?auto_2203 ) ( not ( = ?auto_2198 ?auto_2201 ) ) ( OBJ-AT ?auto_2199 ?auto_2198 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2200 ?auto_2198 )
      ( DELIVER-2PKG-VERIFY ?auto_2199 ?auto_2200 ?auto_2198 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2205 - OBJ
      ?auto_2206 - OBJ
      ?auto_2204 - LOCATION
    )
    :vars
    (
      ?auto_2210 - OBJ
      ?auto_2207 - TRUCK
      ?auto_2209 - LOCATION
      ?auto_2208 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2206 ?auto_2205 ) ) ( not ( = ?auto_2206 ?auto_2210 ) ) ( IN-TRUCK ?auto_2206 ?auto_2207 ) ( TRUCK-AT ?auto_2207 ?auto_2209 ) ( IN-CITY ?auto_2209 ?auto_2208 ) ( IN-CITY ?auto_2204 ?auto_2208 ) ( not ( = ?auto_2204 ?auto_2209 ) ) ( OBJ-AT ?auto_2210 ?auto_2204 ) ( OBJ-AT ?auto_2205 ?auto_2204 ) ( not ( = ?auto_2205 ?auto_2210 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2210 ?auto_2206 ?auto_2204 )
      ( DELIVER-2PKG-VERIFY ?auto_2205 ?auto_2206 ?auto_2204 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2212 - OBJ
      ?auto_2213 - OBJ
      ?auto_2211 - LOCATION
    )
    :vars
    (
      ?auto_2214 - TRUCK
      ?auto_2216 - LOCATION
      ?auto_2215 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2213 ?auto_2212 ) ) ( IN-TRUCK ?auto_2212 ?auto_2214 ) ( TRUCK-AT ?auto_2214 ?auto_2216 ) ( IN-CITY ?auto_2216 ?auto_2215 ) ( IN-CITY ?auto_2211 ?auto_2215 ) ( not ( = ?auto_2211 ?auto_2216 ) ) ( OBJ-AT ?auto_2213 ?auto_2211 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2213 ?auto_2212 ?auto_2211 )
      ( DELIVER-2PKG-VERIFY ?auto_2212 ?auto_2213 ?auto_2211 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2218 - OBJ
      ?auto_2219 - OBJ
      ?auto_2217 - LOCATION
    )
    :vars
    (
      ?auto_2223 - OBJ
      ?auto_2220 - TRUCK
      ?auto_2222 - LOCATION
      ?auto_2221 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2219 ?auto_2218 ) ) ( not ( = ?auto_2218 ?auto_2223 ) ) ( IN-TRUCK ?auto_2218 ?auto_2220 ) ( TRUCK-AT ?auto_2220 ?auto_2222 ) ( IN-CITY ?auto_2222 ?auto_2221 ) ( IN-CITY ?auto_2217 ?auto_2221 ) ( not ( = ?auto_2217 ?auto_2222 ) ) ( OBJ-AT ?auto_2223 ?auto_2217 ) ( OBJ-AT ?auto_2219 ?auto_2217 ) ( not ( = ?auto_2219 ?auto_2223 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2223 ?auto_2218 ?auto_2217 )
      ( DELIVER-2PKG-VERIFY ?auto_2218 ?auto_2219 ?auto_2217 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2239 - OBJ
      ?auto_2240 - OBJ
      ?auto_2241 - OBJ
      ?auto_2238 - LOCATION
    )
    :vars
    (
      ?auto_2242 - TRUCK
      ?auto_2244 - LOCATION
      ?auto_2243 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2240 ?auto_2239 ) ) ( not ( = ?auto_2241 ?auto_2239 ) ) ( not ( = ?auto_2241 ?auto_2240 ) ) ( IN-TRUCK ?auto_2241 ?auto_2242 ) ( TRUCK-AT ?auto_2242 ?auto_2244 ) ( IN-CITY ?auto_2244 ?auto_2243 ) ( IN-CITY ?auto_2238 ?auto_2243 ) ( not ( = ?auto_2238 ?auto_2244 ) ) ( OBJ-AT ?auto_2239 ?auto_2238 ) ( OBJ-AT ?auto_2240 ?auto_2238 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2239 ?auto_2241 ?auto_2238 )
      ( DELIVER-3PKG-VERIFY ?auto_2239 ?auto_2240 ?auto_2241 ?auto_2238 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2253 - OBJ
      ?auto_2254 - OBJ
      ?auto_2255 - OBJ
      ?auto_2252 - LOCATION
    )
    :vars
    (
      ?auto_2256 - TRUCK
      ?auto_2258 - LOCATION
      ?auto_2257 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2254 ?auto_2253 ) ) ( not ( = ?auto_2255 ?auto_2253 ) ) ( not ( = ?auto_2255 ?auto_2254 ) ) ( IN-TRUCK ?auto_2254 ?auto_2256 ) ( TRUCK-AT ?auto_2256 ?auto_2258 ) ( IN-CITY ?auto_2258 ?auto_2257 ) ( IN-CITY ?auto_2252 ?auto_2257 ) ( not ( = ?auto_2252 ?auto_2258 ) ) ( OBJ-AT ?auto_2253 ?auto_2252 ) ( OBJ-AT ?auto_2255 ?auto_2252 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2253 ?auto_2254 ?auto_2252 )
      ( DELIVER-3PKG-VERIFY ?auto_2253 ?auto_2254 ?auto_2255 ?auto_2252 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2267 - OBJ
      ?auto_2268 - OBJ
      ?auto_2269 - OBJ
      ?auto_2266 - LOCATION
    )
    :vars
    (
      ?auto_2270 - TRUCK
      ?auto_2272 - LOCATION
      ?auto_2271 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2268 ?auto_2267 ) ) ( not ( = ?auto_2269 ?auto_2267 ) ) ( not ( = ?auto_2269 ?auto_2268 ) ) ( IN-TRUCK ?auto_2269 ?auto_2270 ) ( TRUCK-AT ?auto_2270 ?auto_2272 ) ( IN-CITY ?auto_2272 ?auto_2271 ) ( IN-CITY ?auto_2266 ?auto_2271 ) ( not ( = ?auto_2266 ?auto_2272 ) ) ( OBJ-AT ?auto_2268 ?auto_2266 ) ( OBJ-AT ?auto_2267 ?auto_2266 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2268 ?auto_2269 ?auto_2266 )
      ( DELIVER-3PKG-VERIFY ?auto_2267 ?auto_2268 ?auto_2269 ?auto_2266 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2282 - OBJ
      ?auto_2283 - OBJ
      ?auto_2284 - OBJ
      ?auto_2281 - LOCATION
    )
    :vars
    (
      ?auto_2285 - TRUCK
      ?auto_2287 - LOCATION
      ?auto_2286 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2283 ?auto_2282 ) ) ( not ( = ?auto_2284 ?auto_2282 ) ) ( not ( = ?auto_2284 ?auto_2283 ) ) ( IN-TRUCK ?auto_2283 ?auto_2285 ) ( TRUCK-AT ?auto_2285 ?auto_2287 ) ( IN-CITY ?auto_2287 ?auto_2286 ) ( IN-CITY ?auto_2281 ?auto_2286 ) ( not ( = ?auto_2281 ?auto_2287 ) ) ( OBJ-AT ?auto_2284 ?auto_2281 ) ( OBJ-AT ?auto_2282 ?auto_2281 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2284 ?auto_2283 ?auto_2281 )
      ( DELIVER-3PKG-VERIFY ?auto_2282 ?auto_2283 ?auto_2284 ?auto_2281 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2312 - OBJ
      ?auto_2313 - OBJ
      ?auto_2314 - OBJ
      ?auto_2311 - LOCATION
    )
    :vars
    (
      ?auto_2315 - TRUCK
      ?auto_2317 - LOCATION
      ?auto_2316 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2313 ?auto_2312 ) ) ( not ( = ?auto_2314 ?auto_2312 ) ) ( not ( = ?auto_2314 ?auto_2313 ) ) ( IN-TRUCK ?auto_2312 ?auto_2315 ) ( TRUCK-AT ?auto_2315 ?auto_2317 ) ( IN-CITY ?auto_2317 ?auto_2316 ) ( IN-CITY ?auto_2311 ?auto_2316 ) ( not ( = ?auto_2311 ?auto_2317 ) ) ( OBJ-AT ?auto_2313 ?auto_2311 ) ( OBJ-AT ?auto_2314 ?auto_2311 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2313 ?auto_2312 ?auto_2311 )
      ( DELIVER-3PKG-VERIFY ?auto_2312 ?auto_2313 ?auto_2314 ?auto_2311 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2326 - OBJ
      ?auto_2327 - OBJ
      ?auto_2328 - OBJ
      ?auto_2325 - LOCATION
    )
    :vars
    (
      ?auto_2329 - TRUCK
      ?auto_2331 - LOCATION
      ?auto_2330 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2327 ?auto_2326 ) ) ( not ( = ?auto_2328 ?auto_2326 ) ) ( not ( = ?auto_2328 ?auto_2327 ) ) ( IN-TRUCK ?auto_2326 ?auto_2329 ) ( TRUCK-AT ?auto_2329 ?auto_2331 ) ( IN-CITY ?auto_2331 ?auto_2330 ) ( IN-CITY ?auto_2325 ?auto_2330 ) ( not ( = ?auto_2325 ?auto_2331 ) ) ( OBJ-AT ?auto_2328 ?auto_2325 ) ( OBJ-AT ?auto_2327 ?auto_2325 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2328 ?auto_2326 ?auto_2325 )
      ( DELIVER-3PKG-VERIFY ?auto_2326 ?auto_2327 ?auto_2328 ?auto_2325 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2372 - OBJ
      ?auto_2371 - LOCATION
    )
    :vars
    (
      ?auto_2376 - OBJ
      ?auto_2373 - TRUCK
      ?auto_2375 - LOCATION
      ?auto_2374 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2372 ?auto_2376 ) ) ( TRUCK-AT ?auto_2373 ?auto_2375 ) ( IN-CITY ?auto_2375 ?auto_2374 ) ( IN-CITY ?auto_2371 ?auto_2374 ) ( not ( = ?auto_2371 ?auto_2375 ) ) ( OBJ-AT ?auto_2376 ?auto_2371 ) ( OBJ-AT ?auto_2372 ?auto_2375 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2372 ?auto_2373 ?auto_2375 )
      ( DELIVER-2PKG ?auto_2376 ?auto_2372 ?auto_2371 )
      ( DELIVER-1PKG-VERIFY ?auto_2372 ?auto_2371 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2378 - OBJ
      ?auto_2379 - OBJ
      ?auto_2377 - LOCATION
    )
    :vars
    (
      ?auto_2381 - TRUCK
      ?auto_2382 - LOCATION
      ?auto_2380 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2379 ?auto_2378 ) ) ( TRUCK-AT ?auto_2381 ?auto_2382 ) ( IN-CITY ?auto_2382 ?auto_2380 ) ( IN-CITY ?auto_2377 ?auto_2380 ) ( not ( = ?auto_2377 ?auto_2382 ) ) ( OBJ-AT ?auto_2378 ?auto_2377 ) ( OBJ-AT ?auto_2379 ?auto_2382 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2379 ?auto_2377 )
      ( DELIVER-2PKG-VERIFY ?auto_2378 ?auto_2379 ?auto_2377 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2384 - OBJ
      ?auto_2385 - OBJ
      ?auto_2383 - LOCATION
    )
    :vars
    (
      ?auto_2389 - OBJ
      ?auto_2388 - TRUCK
      ?auto_2386 - LOCATION
      ?auto_2387 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2385 ?auto_2384 ) ) ( not ( = ?auto_2385 ?auto_2389 ) ) ( TRUCK-AT ?auto_2388 ?auto_2386 ) ( IN-CITY ?auto_2386 ?auto_2387 ) ( IN-CITY ?auto_2383 ?auto_2387 ) ( not ( = ?auto_2383 ?auto_2386 ) ) ( OBJ-AT ?auto_2389 ?auto_2383 ) ( OBJ-AT ?auto_2385 ?auto_2386 ) ( OBJ-AT ?auto_2384 ?auto_2383 ) ( not ( = ?auto_2384 ?auto_2389 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2389 ?auto_2385 ?auto_2383 )
      ( DELIVER-2PKG-VERIFY ?auto_2384 ?auto_2385 ?auto_2383 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2391 - OBJ
      ?auto_2392 - OBJ
      ?auto_2390 - LOCATION
    )
    :vars
    (
      ?auto_2395 - TRUCK
      ?auto_2393 - LOCATION
      ?auto_2394 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2392 ?auto_2391 ) ) ( TRUCK-AT ?auto_2395 ?auto_2393 ) ( IN-CITY ?auto_2393 ?auto_2394 ) ( IN-CITY ?auto_2390 ?auto_2394 ) ( not ( = ?auto_2390 ?auto_2393 ) ) ( OBJ-AT ?auto_2392 ?auto_2390 ) ( OBJ-AT ?auto_2391 ?auto_2393 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2392 ?auto_2391 ?auto_2390 )
      ( DELIVER-2PKG-VERIFY ?auto_2391 ?auto_2392 ?auto_2390 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2397 - OBJ
      ?auto_2398 - OBJ
      ?auto_2396 - LOCATION
    )
    :vars
    (
      ?auto_2402 - OBJ
      ?auto_2401 - TRUCK
      ?auto_2399 - LOCATION
      ?auto_2400 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2398 ?auto_2397 ) ) ( not ( = ?auto_2397 ?auto_2402 ) ) ( TRUCK-AT ?auto_2401 ?auto_2399 ) ( IN-CITY ?auto_2399 ?auto_2400 ) ( IN-CITY ?auto_2396 ?auto_2400 ) ( not ( = ?auto_2396 ?auto_2399 ) ) ( OBJ-AT ?auto_2402 ?auto_2396 ) ( OBJ-AT ?auto_2397 ?auto_2399 ) ( OBJ-AT ?auto_2398 ?auto_2396 ) ( not ( = ?auto_2398 ?auto_2402 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2402 ?auto_2397 ?auto_2396 )
      ( DELIVER-2PKG-VERIFY ?auto_2397 ?auto_2398 ?auto_2396 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2418 - OBJ
      ?auto_2419 - OBJ
      ?auto_2420 - OBJ
      ?auto_2417 - LOCATION
    )
    :vars
    (
      ?auto_2423 - TRUCK
      ?auto_2421 - LOCATION
      ?auto_2422 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2419 ?auto_2418 ) ) ( not ( = ?auto_2420 ?auto_2418 ) ) ( not ( = ?auto_2420 ?auto_2419 ) ) ( TRUCK-AT ?auto_2423 ?auto_2421 ) ( IN-CITY ?auto_2421 ?auto_2422 ) ( IN-CITY ?auto_2417 ?auto_2422 ) ( not ( = ?auto_2417 ?auto_2421 ) ) ( OBJ-AT ?auto_2418 ?auto_2417 ) ( OBJ-AT ?auto_2420 ?auto_2421 ) ( OBJ-AT ?auto_2419 ?auto_2417 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2418 ?auto_2420 ?auto_2417 )
      ( DELIVER-3PKG-VERIFY ?auto_2418 ?auto_2419 ?auto_2420 ?auto_2417 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2432 - OBJ
      ?auto_2433 - OBJ
      ?auto_2434 - OBJ
      ?auto_2431 - LOCATION
    )
    :vars
    (
      ?auto_2437 - TRUCK
      ?auto_2435 - LOCATION
      ?auto_2436 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2433 ?auto_2432 ) ) ( not ( = ?auto_2434 ?auto_2432 ) ) ( not ( = ?auto_2434 ?auto_2433 ) ) ( TRUCK-AT ?auto_2437 ?auto_2435 ) ( IN-CITY ?auto_2435 ?auto_2436 ) ( IN-CITY ?auto_2431 ?auto_2436 ) ( not ( = ?auto_2431 ?auto_2435 ) ) ( OBJ-AT ?auto_2432 ?auto_2431 ) ( OBJ-AT ?auto_2433 ?auto_2435 ) ( OBJ-AT ?auto_2434 ?auto_2431 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2432 ?auto_2433 ?auto_2431 )
      ( DELIVER-3PKG-VERIFY ?auto_2432 ?auto_2433 ?auto_2434 ?auto_2431 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2446 - OBJ
      ?auto_2447 - OBJ
      ?auto_2448 - OBJ
      ?auto_2445 - LOCATION
    )
    :vars
    (
      ?auto_2451 - TRUCK
      ?auto_2449 - LOCATION
      ?auto_2450 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2447 ?auto_2446 ) ) ( not ( = ?auto_2448 ?auto_2446 ) ) ( not ( = ?auto_2448 ?auto_2447 ) ) ( TRUCK-AT ?auto_2451 ?auto_2449 ) ( IN-CITY ?auto_2449 ?auto_2450 ) ( IN-CITY ?auto_2445 ?auto_2450 ) ( not ( = ?auto_2445 ?auto_2449 ) ) ( OBJ-AT ?auto_2447 ?auto_2445 ) ( OBJ-AT ?auto_2448 ?auto_2449 ) ( OBJ-AT ?auto_2446 ?auto_2445 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2447 ?auto_2448 ?auto_2445 )
      ( DELIVER-3PKG-VERIFY ?auto_2446 ?auto_2447 ?auto_2448 ?auto_2445 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2461 - OBJ
      ?auto_2462 - OBJ
      ?auto_2463 - OBJ
      ?auto_2460 - LOCATION
    )
    :vars
    (
      ?auto_2466 - TRUCK
      ?auto_2464 - LOCATION
      ?auto_2465 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2462 ?auto_2461 ) ) ( not ( = ?auto_2463 ?auto_2461 ) ) ( not ( = ?auto_2463 ?auto_2462 ) ) ( TRUCK-AT ?auto_2466 ?auto_2464 ) ( IN-CITY ?auto_2464 ?auto_2465 ) ( IN-CITY ?auto_2460 ?auto_2465 ) ( not ( = ?auto_2460 ?auto_2464 ) ) ( OBJ-AT ?auto_2463 ?auto_2460 ) ( OBJ-AT ?auto_2462 ?auto_2464 ) ( OBJ-AT ?auto_2461 ?auto_2460 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2463 ?auto_2462 ?auto_2460 )
      ( DELIVER-3PKG-VERIFY ?auto_2461 ?auto_2462 ?auto_2463 ?auto_2460 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2491 - OBJ
      ?auto_2492 - OBJ
      ?auto_2493 - OBJ
      ?auto_2490 - LOCATION
    )
    :vars
    (
      ?auto_2496 - TRUCK
      ?auto_2494 - LOCATION
      ?auto_2495 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2492 ?auto_2491 ) ) ( not ( = ?auto_2493 ?auto_2491 ) ) ( not ( = ?auto_2493 ?auto_2492 ) ) ( TRUCK-AT ?auto_2496 ?auto_2494 ) ( IN-CITY ?auto_2494 ?auto_2495 ) ( IN-CITY ?auto_2490 ?auto_2495 ) ( not ( = ?auto_2490 ?auto_2494 ) ) ( OBJ-AT ?auto_2492 ?auto_2490 ) ( OBJ-AT ?auto_2491 ?auto_2494 ) ( OBJ-AT ?auto_2493 ?auto_2490 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2492 ?auto_2491 ?auto_2490 )
      ( DELIVER-3PKG-VERIFY ?auto_2491 ?auto_2492 ?auto_2493 ?auto_2490 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2505 - OBJ
      ?auto_2506 - OBJ
      ?auto_2507 - OBJ
      ?auto_2504 - LOCATION
    )
    :vars
    (
      ?auto_2510 - TRUCK
      ?auto_2508 - LOCATION
      ?auto_2509 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2506 ?auto_2505 ) ) ( not ( = ?auto_2507 ?auto_2505 ) ) ( not ( = ?auto_2507 ?auto_2506 ) ) ( TRUCK-AT ?auto_2510 ?auto_2508 ) ( IN-CITY ?auto_2508 ?auto_2509 ) ( IN-CITY ?auto_2504 ?auto_2509 ) ( not ( = ?auto_2504 ?auto_2508 ) ) ( OBJ-AT ?auto_2507 ?auto_2504 ) ( OBJ-AT ?auto_2505 ?auto_2508 ) ( OBJ-AT ?auto_2506 ?auto_2504 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2507 ?auto_2505 ?auto_2504 )
      ( DELIVER-3PKG-VERIFY ?auto_2505 ?auto_2506 ?auto_2507 ?auto_2504 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2551 - OBJ
      ?auto_2550 - LOCATION
    )
    :vars
    (
      ?auto_2555 - OBJ
      ?auto_2552 - LOCATION
      ?auto_2553 - CITY
      ?auto_2554 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2551 ?auto_2555 ) ) ( IN-CITY ?auto_2552 ?auto_2553 ) ( IN-CITY ?auto_2550 ?auto_2553 ) ( not ( = ?auto_2550 ?auto_2552 ) ) ( OBJ-AT ?auto_2555 ?auto_2550 ) ( OBJ-AT ?auto_2551 ?auto_2552 ) ( TRUCK-AT ?auto_2554 ?auto_2550 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2554 ?auto_2550 ?auto_2552 ?auto_2553 )
      ( DELIVER-2PKG ?auto_2555 ?auto_2551 ?auto_2550 )
      ( DELIVER-1PKG-VERIFY ?auto_2551 ?auto_2550 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2557 - OBJ
      ?auto_2558 - OBJ
      ?auto_2556 - LOCATION
    )
    :vars
    (
      ?auto_2560 - LOCATION
      ?auto_2561 - CITY
      ?auto_2559 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2558 ?auto_2557 ) ) ( IN-CITY ?auto_2560 ?auto_2561 ) ( IN-CITY ?auto_2556 ?auto_2561 ) ( not ( = ?auto_2556 ?auto_2560 ) ) ( OBJ-AT ?auto_2557 ?auto_2556 ) ( OBJ-AT ?auto_2558 ?auto_2560 ) ( TRUCK-AT ?auto_2559 ?auto_2556 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2558 ?auto_2556 )
      ( DELIVER-2PKG-VERIFY ?auto_2557 ?auto_2558 ?auto_2556 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2563 - OBJ
      ?auto_2564 - OBJ
      ?auto_2562 - LOCATION
    )
    :vars
    (
      ?auto_2566 - OBJ
      ?auto_2568 - LOCATION
      ?auto_2565 - CITY
      ?auto_2567 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2564 ?auto_2563 ) ) ( not ( = ?auto_2564 ?auto_2566 ) ) ( IN-CITY ?auto_2568 ?auto_2565 ) ( IN-CITY ?auto_2562 ?auto_2565 ) ( not ( = ?auto_2562 ?auto_2568 ) ) ( OBJ-AT ?auto_2566 ?auto_2562 ) ( OBJ-AT ?auto_2564 ?auto_2568 ) ( TRUCK-AT ?auto_2567 ?auto_2562 ) ( OBJ-AT ?auto_2563 ?auto_2562 ) ( not ( = ?auto_2563 ?auto_2566 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2566 ?auto_2564 ?auto_2562 )
      ( DELIVER-2PKG-VERIFY ?auto_2563 ?auto_2564 ?auto_2562 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2570 - OBJ
      ?auto_2571 - OBJ
      ?auto_2569 - LOCATION
    )
    :vars
    (
      ?auto_2574 - LOCATION
      ?auto_2572 - CITY
      ?auto_2573 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2571 ?auto_2570 ) ) ( IN-CITY ?auto_2574 ?auto_2572 ) ( IN-CITY ?auto_2569 ?auto_2572 ) ( not ( = ?auto_2569 ?auto_2574 ) ) ( OBJ-AT ?auto_2571 ?auto_2569 ) ( OBJ-AT ?auto_2570 ?auto_2574 ) ( TRUCK-AT ?auto_2573 ?auto_2569 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2571 ?auto_2570 ?auto_2569 )
      ( DELIVER-2PKG-VERIFY ?auto_2570 ?auto_2571 ?auto_2569 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2576 - OBJ
      ?auto_2577 - OBJ
      ?auto_2575 - LOCATION
    )
    :vars
    (
      ?auto_2579 - OBJ
      ?auto_2581 - LOCATION
      ?auto_2578 - CITY
      ?auto_2580 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2577 ?auto_2576 ) ) ( not ( = ?auto_2576 ?auto_2579 ) ) ( IN-CITY ?auto_2581 ?auto_2578 ) ( IN-CITY ?auto_2575 ?auto_2578 ) ( not ( = ?auto_2575 ?auto_2581 ) ) ( OBJ-AT ?auto_2579 ?auto_2575 ) ( OBJ-AT ?auto_2576 ?auto_2581 ) ( TRUCK-AT ?auto_2580 ?auto_2575 ) ( OBJ-AT ?auto_2577 ?auto_2575 ) ( not ( = ?auto_2577 ?auto_2579 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2579 ?auto_2576 ?auto_2575 )
      ( DELIVER-2PKG-VERIFY ?auto_2576 ?auto_2577 ?auto_2575 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2597 - OBJ
      ?auto_2598 - OBJ
      ?auto_2599 - OBJ
      ?auto_2596 - LOCATION
    )
    :vars
    (
      ?auto_2602 - LOCATION
      ?auto_2600 - CITY
      ?auto_2601 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2598 ?auto_2597 ) ) ( not ( = ?auto_2599 ?auto_2597 ) ) ( not ( = ?auto_2599 ?auto_2598 ) ) ( IN-CITY ?auto_2602 ?auto_2600 ) ( IN-CITY ?auto_2596 ?auto_2600 ) ( not ( = ?auto_2596 ?auto_2602 ) ) ( OBJ-AT ?auto_2597 ?auto_2596 ) ( OBJ-AT ?auto_2599 ?auto_2602 ) ( TRUCK-AT ?auto_2601 ?auto_2596 ) ( OBJ-AT ?auto_2598 ?auto_2596 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2597 ?auto_2599 ?auto_2596 )
      ( DELIVER-3PKG-VERIFY ?auto_2597 ?auto_2598 ?auto_2599 ?auto_2596 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2611 - OBJ
      ?auto_2612 - OBJ
      ?auto_2613 - OBJ
      ?auto_2610 - LOCATION
    )
    :vars
    (
      ?auto_2616 - LOCATION
      ?auto_2614 - CITY
      ?auto_2615 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2612 ?auto_2611 ) ) ( not ( = ?auto_2613 ?auto_2611 ) ) ( not ( = ?auto_2613 ?auto_2612 ) ) ( IN-CITY ?auto_2616 ?auto_2614 ) ( IN-CITY ?auto_2610 ?auto_2614 ) ( not ( = ?auto_2610 ?auto_2616 ) ) ( OBJ-AT ?auto_2611 ?auto_2610 ) ( OBJ-AT ?auto_2612 ?auto_2616 ) ( TRUCK-AT ?auto_2615 ?auto_2610 ) ( OBJ-AT ?auto_2613 ?auto_2610 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2611 ?auto_2612 ?auto_2610 )
      ( DELIVER-3PKG-VERIFY ?auto_2611 ?auto_2612 ?auto_2613 ?auto_2610 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2625 - OBJ
      ?auto_2626 - OBJ
      ?auto_2627 - OBJ
      ?auto_2624 - LOCATION
    )
    :vars
    (
      ?auto_2630 - LOCATION
      ?auto_2628 - CITY
      ?auto_2629 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2626 ?auto_2625 ) ) ( not ( = ?auto_2627 ?auto_2625 ) ) ( not ( = ?auto_2627 ?auto_2626 ) ) ( IN-CITY ?auto_2630 ?auto_2628 ) ( IN-CITY ?auto_2624 ?auto_2628 ) ( not ( = ?auto_2624 ?auto_2630 ) ) ( OBJ-AT ?auto_2626 ?auto_2624 ) ( OBJ-AT ?auto_2627 ?auto_2630 ) ( TRUCK-AT ?auto_2629 ?auto_2624 ) ( OBJ-AT ?auto_2625 ?auto_2624 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2626 ?auto_2627 ?auto_2624 )
      ( DELIVER-3PKG-VERIFY ?auto_2625 ?auto_2626 ?auto_2627 ?auto_2624 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2640 - OBJ
      ?auto_2641 - OBJ
      ?auto_2642 - OBJ
      ?auto_2639 - LOCATION
    )
    :vars
    (
      ?auto_2645 - LOCATION
      ?auto_2643 - CITY
      ?auto_2644 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2641 ?auto_2640 ) ) ( not ( = ?auto_2642 ?auto_2640 ) ) ( not ( = ?auto_2642 ?auto_2641 ) ) ( IN-CITY ?auto_2645 ?auto_2643 ) ( IN-CITY ?auto_2639 ?auto_2643 ) ( not ( = ?auto_2639 ?auto_2645 ) ) ( OBJ-AT ?auto_2642 ?auto_2639 ) ( OBJ-AT ?auto_2641 ?auto_2645 ) ( TRUCK-AT ?auto_2644 ?auto_2639 ) ( OBJ-AT ?auto_2640 ?auto_2639 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2642 ?auto_2641 ?auto_2639 )
      ( DELIVER-3PKG-VERIFY ?auto_2640 ?auto_2641 ?auto_2642 ?auto_2639 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2670 - OBJ
      ?auto_2671 - OBJ
      ?auto_2672 - OBJ
      ?auto_2669 - LOCATION
    )
    :vars
    (
      ?auto_2675 - LOCATION
      ?auto_2673 - CITY
      ?auto_2674 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2671 ?auto_2670 ) ) ( not ( = ?auto_2672 ?auto_2670 ) ) ( not ( = ?auto_2672 ?auto_2671 ) ) ( IN-CITY ?auto_2675 ?auto_2673 ) ( IN-CITY ?auto_2669 ?auto_2673 ) ( not ( = ?auto_2669 ?auto_2675 ) ) ( OBJ-AT ?auto_2671 ?auto_2669 ) ( OBJ-AT ?auto_2670 ?auto_2675 ) ( TRUCK-AT ?auto_2674 ?auto_2669 ) ( OBJ-AT ?auto_2672 ?auto_2669 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2671 ?auto_2670 ?auto_2669 )
      ( DELIVER-3PKG-VERIFY ?auto_2670 ?auto_2671 ?auto_2672 ?auto_2669 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2684 - OBJ
      ?auto_2685 - OBJ
      ?auto_2686 - OBJ
      ?auto_2683 - LOCATION
    )
    :vars
    (
      ?auto_2689 - LOCATION
      ?auto_2687 - CITY
      ?auto_2688 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2685 ?auto_2684 ) ) ( not ( = ?auto_2686 ?auto_2684 ) ) ( not ( = ?auto_2686 ?auto_2685 ) ) ( IN-CITY ?auto_2689 ?auto_2687 ) ( IN-CITY ?auto_2683 ?auto_2687 ) ( not ( = ?auto_2683 ?auto_2689 ) ) ( OBJ-AT ?auto_2686 ?auto_2683 ) ( OBJ-AT ?auto_2684 ?auto_2689 ) ( TRUCK-AT ?auto_2688 ?auto_2683 ) ( OBJ-AT ?auto_2685 ?auto_2683 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2686 ?auto_2684 ?auto_2683 )
      ( DELIVER-3PKG-VERIFY ?auto_2684 ?auto_2685 ?auto_2686 ?auto_2683 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2730 - OBJ
      ?auto_2729 - LOCATION
    )
    :vars
    (
      ?auto_2732 - OBJ
      ?auto_2734 - LOCATION
      ?auto_2731 - CITY
      ?auto_2733 - TRUCK
      ?auto_2735 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_2730 ?auto_2732 ) ) ( IN-CITY ?auto_2734 ?auto_2731 ) ( IN-CITY ?auto_2729 ?auto_2731 ) ( not ( = ?auto_2729 ?auto_2734 ) ) ( OBJ-AT ?auto_2732 ?auto_2729 ) ( OBJ-AT ?auto_2730 ?auto_2734 ) ( TRUCK-AT ?auto_2733 ?auto_2729 ) ( not ( = ?auto_2735 ?auto_2732 ) ) ( IN-TRUCK ?auto_2735 ?auto_2733 ) ( not ( = ?auto_2730 ?auto_2735 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2732 ?auto_2735 ?auto_2729 )
      ( DELIVER-2PKG ?auto_2732 ?auto_2730 ?auto_2729 )
      ( DELIVER-1PKG-VERIFY ?auto_2730 ?auto_2729 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2737 - OBJ
      ?auto_2738 - OBJ
      ?auto_2736 - LOCATION
    )
    :vars
    (
      ?auto_2741 - LOCATION
      ?auto_2739 - CITY
      ?auto_2740 - TRUCK
      ?auto_2742 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_2738 ?auto_2737 ) ) ( IN-CITY ?auto_2741 ?auto_2739 ) ( IN-CITY ?auto_2736 ?auto_2739 ) ( not ( = ?auto_2736 ?auto_2741 ) ) ( OBJ-AT ?auto_2737 ?auto_2736 ) ( OBJ-AT ?auto_2738 ?auto_2741 ) ( TRUCK-AT ?auto_2740 ?auto_2736 ) ( not ( = ?auto_2742 ?auto_2737 ) ) ( IN-TRUCK ?auto_2742 ?auto_2740 ) ( not ( = ?auto_2738 ?auto_2742 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2738 ?auto_2736 )
      ( DELIVER-2PKG-VERIFY ?auto_2737 ?auto_2738 ?auto_2736 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2744 - OBJ
      ?auto_2745 - OBJ
      ?auto_2743 - LOCATION
    )
    :vars
    (
      ?auto_2749 - OBJ
      ?auto_2748 - LOCATION
      ?auto_2747 - CITY
      ?auto_2746 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2745 ?auto_2744 ) ) ( not ( = ?auto_2745 ?auto_2749 ) ) ( IN-CITY ?auto_2748 ?auto_2747 ) ( IN-CITY ?auto_2743 ?auto_2747 ) ( not ( = ?auto_2743 ?auto_2748 ) ) ( OBJ-AT ?auto_2749 ?auto_2743 ) ( OBJ-AT ?auto_2745 ?auto_2748 ) ( TRUCK-AT ?auto_2746 ?auto_2743 ) ( not ( = ?auto_2744 ?auto_2749 ) ) ( IN-TRUCK ?auto_2744 ?auto_2746 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2749 ?auto_2745 ?auto_2743 )
      ( DELIVER-2PKG-VERIFY ?auto_2744 ?auto_2745 ?auto_2743 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2751 - OBJ
      ?auto_2752 - OBJ
      ?auto_2750 - LOCATION
    )
    :vars
    (
      ?auto_2756 - LOCATION
      ?auto_2754 - CITY
      ?auto_2753 - TRUCK
      ?auto_2755 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_2752 ?auto_2751 ) ) ( IN-CITY ?auto_2756 ?auto_2754 ) ( IN-CITY ?auto_2750 ?auto_2754 ) ( not ( = ?auto_2750 ?auto_2756 ) ) ( OBJ-AT ?auto_2752 ?auto_2750 ) ( OBJ-AT ?auto_2751 ?auto_2756 ) ( TRUCK-AT ?auto_2753 ?auto_2750 ) ( not ( = ?auto_2755 ?auto_2752 ) ) ( IN-TRUCK ?auto_2755 ?auto_2753 ) ( not ( = ?auto_2751 ?auto_2755 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2752 ?auto_2751 ?auto_2750 )
      ( DELIVER-2PKG-VERIFY ?auto_2751 ?auto_2752 ?auto_2750 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2758 - OBJ
      ?auto_2759 - OBJ
      ?auto_2757 - LOCATION
    )
    :vars
    (
      ?auto_2763 - OBJ
      ?auto_2762 - LOCATION
      ?auto_2761 - CITY
      ?auto_2760 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2759 ?auto_2758 ) ) ( not ( = ?auto_2758 ?auto_2763 ) ) ( IN-CITY ?auto_2762 ?auto_2761 ) ( IN-CITY ?auto_2757 ?auto_2761 ) ( not ( = ?auto_2757 ?auto_2762 ) ) ( OBJ-AT ?auto_2763 ?auto_2757 ) ( OBJ-AT ?auto_2758 ?auto_2762 ) ( TRUCK-AT ?auto_2760 ?auto_2757 ) ( not ( = ?auto_2759 ?auto_2763 ) ) ( IN-TRUCK ?auto_2759 ?auto_2760 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2763 ?auto_2758 ?auto_2757 )
      ( DELIVER-2PKG-VERIFY ?auto_2758 ?auto_2759 ?auto_2757 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2781 - OBJ
      ?auto_2782 - OBJ
      ?auto_2783 - OBJ
      ?auto_2780 - LOCATION
    )
    :vars
    (
      ?auto_2786 - LOCATION
      ?auto_2785 - CITY
      ?auto_2784 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2782 ?auto_2781 ) ) ( not ( = ?auto_2783 ?auto_2781 ) ) ( not ( = ?auto_2783 ?auto_2782 ) ) ( IN-CITY ?auto_2786 ?auto_2785 ) ( IN-CITY ?auto_2780 ?auto_2785 ) ( not ( = ?auto_2780 ?auto_2786 ) ) ( OBJ-AT ?auto_2781 ?auto_2780 ) ( OBJ-AT ?auto_2783 ?auto_2786 ) ( TRUCK-AT ?auto_2784 ?auto_2780 ) ( IN-TRUCK ?auto_2782 ?auto_2784 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2781 ?auto_2783 ?auto_2780 )
      ( DELIVER-3PKG-VERIFY ?auto_2781 ?auto_2782 ?auto_2783 ?auto_2780 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2796 - OBJ
      ?auto_2797 - OBJ
      ?auto_2798 - OBJ
      ?auto_2795 - LOCATION
    )
    :vars
    (
      ?auto_2801 - LOCATION
      ?auto_2800 - CITY
      ?auto_2799 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2797 ?auto_2796 ) ) ( not ( = ?auto_2798 ?auto_2796 ) ) ( not ( = ?auto_2798 ?auto_2797 ) ) ( IN-CITY ?auto_2801 ?auto_2800 ) ( IN-CITY ?auto_2795 ?auto_2800 ) ( not ( = ?auto_2795 ?auto_2801 ) ) ( OBJ-AT ?auto_2796 ?auto_2795 ) ( OBJ-AT ?auto_2797 ?auto_2801 ) ( TRUCK-AT ?auto_2799 ?auto_2795 ) ( IN-TRUCK ?auto_2798 ?auto_2799 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2796 ?auto_2797 ?auto_2795 )
      ( DELIVER-3PKG-VERIFY ?auto_2796 ?auto_2797 ?auto_2798 ?auto_2795 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2811 - OBJ
      ?auto_2812 - OBJ
      ?auto_2813 - OBJ
      ?auto_2810 - LOCATION
    )
    :vars
    (
      ?auto_2816 - LOCATION
      ?auto_2815 - CITY
      ?auto_2814 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2812 ?auto_2811 ) ) ( not ( = ?auto_2813 ?auto_2811 ) ) ( not ( = ?auto_2813 ?auto_2812 ) ) ( IN-CITY ?auto_2816 ?auto_2815 ) ( IN-CITY ?auto_2810 ?auto_2815 ) ( not ( = ?auto_2810 ?auto_2816 ) ) ( OBJ-AT ?auto_2812 ?auto_2810 ) ( OBJ-AT ?auto_2813 ?auto_2816 ) ( TRUCK-AT ?auto_2814 ?auto_2810 ) ( IN-TRUCK ?auto_2811 ?auto_2814 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2812 ?auto_2813 ?auto_2810 )
      ( DELIVER-3PKG-VERIFY ?auto_2811 ?auto_2812 ?auto_2813 ?auto_2810 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2826 - OBJ
      ?auto_2827 - OBJ
      ?auto_2828 - OBJ
      ?auto_2825 - LOCATION
    )
    :vars
    (
      ?auto_2831 - LOCATION
      ?auto_2830 - CITY
      ?auto_2829 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2827 ?auto_2826 ) ) ( not ( = ?auto_2828 ?auto_2826 ) ) ( not ( = ?auto_2828 ?auto_2827 ) ) ( IN-CITY ?auto_2831 ?auto_2830 ) ( IN-CITY ?auto_2825 ?auto_2830 ) ( not ( = ?auto_2825 ?auto_2831 ) ) ( OBJ-AT ?auto_2828 ?auto_2825 ) ( OBJ-AT ?auto_2827 ?auto_2831 ) ( TRUCK-AT ?auto_2829 ?auto_2825 ) ( IN-TRUCK ?auto_2826 ?auto_2829 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2828 ?auto_2827 ?auto_2825 )
      ( DELIVER-3PKG-VERIFY ?auto_2826 ?auto_2827 ?auto_2828 ?auto_2825 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2857 - OBJ
      ?auto_2858 - OBJ
      ?auto_2859 - OBJ
      ?auto_2856 - LOCATION
    )
    :vars
    (
      ?auto_2862 - LOCATION
      ?auto_2861 - CITY
      ?auto_2860 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2858 ?auto_2857 ) ) ( not ( = ?auto_2859 ?auto_2857 ) ) ( not ( = ?auto_2859 ?auto_2858 ) ) ( IN-CITY ?auto_2862 ?auto_2861 ) ( IN-CITY ?auto_2856 ?auto_2861 ) ( not ( = ?auto_2856 ?auto_2862 ) ) ( OBJ-AT ?auto_2858 ?auto_2856 ) ( OBJ-AT ?auto_2857 ?auto_2862 ) ( TRUCK-AT ?auto_2860 ?auto_2856 ) ( IN-TRUCK ?auto_2859 ?auto_2860 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2858 ?auto_2857 ?auto_2856 )
      ( DELIVER-3PKG-VERIFY ?auto_2857 ?auto_2858 ?auto_2859 ?auto_2856 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2872 - OBJ
      ?auto_2873 - OBJ
      ?auto_2874 - OBJ
      ?auto_2871 - LOCATION
    )
    :vars
    (
      ?auto_2877 - LOCATION
      ?auto_2876 - CITY
      ?auto_2875 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2873 ?auto_2872 ) ) ( not ( = ?auto_2874 ?auto_2872 ) ) ( not ( = ?auto_2874 ?auto_2873 ) ) ( IN-CITY ?auto_2877 ?auto_2876 ) ( IN-CITY ?auto_2871 ?auto_2876 ) ( not ( = ?auto_2871 ?auto_2877 ) ) ( OBJ-AT ?auto_2874 ?auto_2871 ) ( OBJ-AT ?auto_2872 ?auto_2877 ) ( TRUCK-AT ?auto_2875 ?auto_2871 ) ( IN-TRUCK ?auto_2873 ?auto_2875 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2874 ?auto_2872 ?auto_2871 )
      ( DELIVER-3PKG-VERIFY ?auto_2872 ?auto_2873 ?auto_2874 ?auto_2871 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2920 - OBJ
      ?auto_2919 - LOCATION
    )
    :vars
    (
      ?auto_2925 - OBJ
      ?auto_2924 - LOCATION
      ?auto_2922 - CITY
      ?auto_2923 - OBJ
      ?auto_2921 - TRUCK
      ?auto_2926 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2920 ?auto_2925 ) ) ( IN-CITY ?auto_2924 ?auto_2922 ) ( IN-CITY ?auto_2919 ?auto_2922 ) ( not ( = ?auto_2919 ?auto_2924 ) ) ( OBJ-AT ?auto_2925 ?auto_2919 ) ( OBJ-AT ?auto_2920 ?auto_2924 ) ( not ( = ?auto_2923 ?auto_2925 ) ) ( IN-TRUCK ?auto_2923 ?auto_2921 ) ( not ( = ?auto_2920 ?auto_2923 ) ) ( TRUCK-AT ?auto_2921 ?auto_2926 ) ( IN-CITY ?auto_2926 ?auto_2922 ) ( not ( = ?auto_2919 ?auto_2926 ) ) ( not ( = ?auto_2924 ?auto_2926 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2921 ?auto_2926 ?auto_2919 ?auto_2922 )
      ( DELIVER-2PKG ?auto_2925 ?auto_2920 ?auto_2919 )
      ( DELIVER-1PKG-VERIFY ?auto_2920 ?auto_2919 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2928 - OBJ
      ?auto_2929 - OBJ
      ?auto_2927 - LOCATION
    )
    :vars
    (
      ?auto_2930 - LOCATION
      ?auto_2932 - CITY
      ?auto_2933 - OBJ
      ?auto_2934 - TRUCK
      ?auto_2931 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2929 ?auto_2928 ) ) ( IN-CITY ?auto_2930 ?auto_2932 ) ( IN-CITY ?auto_2927 ?auto_2932 ) ( not ( = ?auto_2927 ?auto_2930 ) ) ( OBJ-AT ?auto_2928 ?auto_2927 ) ( OBJ-AT ?auto_2929 ?auto_2930 ) ( not ( = ?auto_2933 ?auto_2928 ) ) ( IN-TRUCK ?auto_2933 ?auto_2934 ) ( not ( = ?auto_2929 ?auto_2933 ) ) ( TRUCK-AT ?auto_2934 ?auto_2931 ) ( IN-CITY ?auto_2931 ?auto_2932 ) ( not ( = ?auto_2927 ?auto_2931 ) ) ( not ( = ?auto_2930 ?auto_2931 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2929 ?auto_2927 )
      ( DELIVER-2PKG-VERIFY ?auto_2928 ?auto_2929 ?auto_2927 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2936 - OBJ
      ?auto_2937 - OBJ
      ?auto_2935 - LOCATION
    )
    :vars
    (
      ?auto_2942 - OBJ
      ?auto_2941 - LOCATION
      ?auto_2938 - CITY
      ?auto_2940 - TRUCK
      ?auto_2939 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2937 ?auto_2936 ) ) ( not ( = ?auto_2937 ?auto_2942 ) ) ( IN-CITY ?auto_2941 ?auto_2938 ) ( IN-CITY ?auto_2935 ?auto_2938 ) ( not ( = ?auto_2935 ?auto_2941 ) ) ( OBJ-AT ?auto_2942 ?auto_2935 ) ( OBJ-AT ?auto_2937 ?auto_2941 ) ( not ( = ?auto_2936 ?auto_2942 ) ) ( IN-TRUCK ?auto_2936 ?auto_2940 ) ( TRUCK-AT ?auto_2940 ?auto_2939 ) ( IN-CITY ?auto_2939 ?auto_2938 ) ( not ( = ?auto_2935 ?auto_2939 ) ) ( not ( = ?auto_2941 ?auto_2939 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2942 ?auto_2937 ?auto_2935 )
      ( DELIVER-2PKG-VERIFY ?auto_2936 ?auto_2937 ?auto_2935 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2944 - OBJ
      ?auto_2945 - OBJ
      ?auto_2943 - LOCATION
    )
    :vars
    (
      ?auto_2950 - LOCATION
      ?auto_2946 - CITY
      ?auto_2949 - OBJ
      ?auto_2948 - TRUCK
      ?auto_2947 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2945 ?auto_2944 ) ) ( IN-CITY ?auto_2950 ?auto_2946 ) ( IN-CITY ?auto_2943 ?auto_2946 ) ( not ( = ?auto_2943 ?auto_2950 ) ) ( OBJ-AT ?auto_2945 ?auto_2943 ) ( OBJ-AT ?auto_2944 ?auto_2950 ) ( not ( = ?auto_2949 ?auto_2945 ) ) ( IN-TRUCK ?auto_2949 ?auto_2948 ) ( not ( = ?auto_2944 ?auto_2949 ) ) ( TRUCK-AT ?auto_2948 ?auto_2947 ) ( IN-CITY ?auto_2947 ?auto_2946 ) ( not ( = ?auto_2943 ?auto_2947 ) ) ( not ( = ?auto_2950 ?auto_2947 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2945 ?auto_2944 ?auto_2943 )
      ( DELIVER-2PKG-VERIFY ?auto_2944 ?auto_2945 ?auto_2943 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2952 - OBJ
      ?auto_2953 - OBJ
      ?auto_2951 - LOCATION
    )
    :vars
    (
      ?auto_2958 - OBJ
      ?auto_2957 - LOCATION
      ?auto_2954 - CITY
      ?auto_2956 - TRUCK
      ?auto_2955 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2953 ?auto_2952 ) ) ( not ( = ?auto_2952 ?auto_2958 ) ) ( IN-CITY ?auto_2957 ?auto_2954 ) ( IN-CITY ?auto_2951 ?auto_2954 ) ( not ( = ?auto_2951 ?auto_2957 ) ) ( OBJ-AT ?auto_2958 ?auto_2951 ) ( OBJ-AT ?auto_2952 ?auto_2957 ) ( not ( = ?auto_2953 ?auto_2958 ) ) ( IN-TRUCK ?auto_2953 ?auto_2956 ) ( TRUCK-AT ?auto_2956 ?auto_2955 ) ( IN-CITY ?auto_2955 ?auto_2954 ) ( not ( = ?auto_2951 ?auto_2955 ) ) ( not ( = ?auto_2957 ?auto_2955 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2958 ?auto_2952 ?auto_2951 )
      ( DELIVER-2PKG-VERIFY ?auto_2952 ?auto_2953 ?auto_2951 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2978 - OBJ
      ?auto_2979 - OBJ
      ?auto_2980 - OBJ
      ?auto_2977 - LOCATION
    )
    :vars
    (
      ?auto_2984 - LOCATION
      ?auto_2981 - CITY
      ?auto_2983 - TRUCK
      ?auto_2982 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2979 ?auto_2978 ) ) ( not ( = ?auto_2980 ?auto_2978 ) ) ( not ( = ?auto_2980 ?auto_2979 ) ) ( IN-CITY ?auto_2984 ?auto_2981 ) ( IN-CITY ?auto_2977 ?auto_2981 ) ( not ( = ?auto_2977 ?auto_2984 ) ) ( OBJ-AT ?auto_2978 ?auto_2977 ) ( OBJ-AT ?auto_2980 ?auto_2984 ) ( IN-TRUCK ?auto_2979 ?auto_2983 ) ( TRUCK-AT ?auto_2983 ?auto_2982 ) ( IN-CITY ?auto_2982 ?auto_2981 ) ( not ( = ?auto_2977 ?auto_2982 ) ) ( not ( = ?auto_2984 ?auto_2982 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2978 ?auto_2980 ?auto_2977 )
      ( DELIVER-3PKG-VERIFY ?auto_2978 ?auto_2979 ?auto_2980 ?auto_2977 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2995 - OBJ
      ?auto_2996 - OBJ
      ?auto_2997 - OBJ
      ?auto_2994 - LOCATION
    )
    :vars
    (
      ?auto_3001 - LOCATION
      ?auto_2998 - CITY
      ?auto_3000 - TRUCK
      ?auto_2999 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2996 ?auto_2995 ) ) ( not ( = ?auto_2997 ?auto_2995 ) ) ( not ( = ?auto_2997 ?auto_2996 ) ) ( IN-CITY ?auto_3001 ?auto_2998 ) ( IN-CITY ?auto_2994 ?auto_2998 ) ( not ( = ?auto_2994 ?auto_3001 ) ) ( OBJ-AT ?auto_2995 ?auto_2994 ) ( OBJ-AT ?auto_2996 ?auto_3001 ) ( IN-TRUCK ?auto_2997 ?auto_3000 ) ( TRUCK-AT ?auto_3000 ?auto_2999 ) ( IN-CITY ?auto_2999 ?auto_2998 ) ( not ( = ?auto_2994 ?auto_2999 ) ) ( not ( = ?auto_3001 ?auto_2999 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2995 ?auto_2996 ?auto_2994 )
      ( DELIVER-3PKG-VERIFY ?auto_2995 ?auto_2996 ?auto_2997 ?auto_2994 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3012 - OBJ
      ?auto_3013 - OBJ
      ?auto_3014 - OBJ
      ?auto_3011 - LOCATION
    )
    :vars
    (
      ?auto_3018 - LOCATION
      ?auto_3015 - CITY
      ?auto_3017 - TRUCK
      ?auto_3016 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3013 ?auto_3012 ) ) ( not ( = ?auto_3014 ?auto_3012 ) ) ( not ( = ?auto_3014 ?auto_3013 ) ) ( IN-CITY ?auto_3018 ?auto_3015 ) ( IN-CITY ?auto_3011 ?auto_3015 ) ( not ( = ?auto_3011 ?auto_3018 ) ) ( OBJ-AT ?auto_3013 ?auto_3011 ) ( OBJ-AT ?auto_3014 ?auto_3018 ) ( IN-TRUCK ?auto_3012 ?auto_3017 ) ( TRUCK-AT ?auto_3017 ?auto_3016 ) ( IN-CITY ?auto_3016 ?auto_3015 ) ( not ( = ?auto_3011 ?auto_3016 ) ) ( not ( = ?auto_3018 ?auto_3016 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3013 ?auto_3014 ?auto_3011 )
      ( DELIVER-3PKG-VERIFY ?auto_3012 ?auto_3013 ?auto_3014 ?auto_3011 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3029 - OBJ
      ?auto_3030 - OBJ
      ?auto_3031 - OBJ
      ?auto_3028 - LOCATION
    )
    :vars
    (
      ?auto_3035 - LOCATION
      ?auto_3032 - CITY
      ?auto_3034 - TRUCK
      ?auto_3033 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3030 ?auto_3029 ) ) ( not ( = ?auto_3031 ?auto_3029 ) ) ( not ( = ?auto_3031 ?auto_3030 ) ) ( IN-CITY ?auto_3035 ?auto_3032 ) ( IN-CITY ?auto_3028 ?auto_3032 ) ( not ( = ?auto_3028 ?auto_3035 ) ) ( OBJ-AT ?auto_3031 ?auto_3028 ) ( OBJ-AT ?auto_3030 ?auto_3035 ) ( IN-TRUCK ?auto_3029 ?auto_3034 ) ( TRUCK-AT ?auto_3034 ?auto_3033 ) ( IN-CITY ?auto_3033 ?auto_3032 ) ( not ( = ?auto_3028 ?auto_3033 ) ) ( not ( = ?auto_3035 ?auto_3033 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3031 ?auto_3030 ?auto_3028 )
      ( DELIVER-3PKG-VERIFY ?auto_3029 ?auto_3030 ?auto_3031 ?auto_3028 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3064 - OBJ
      ?auto_3065 - OBJ
      ?auto_3066 - OBJ
      ?auto_3063 - LOCATION
    )
    :vars
    (
      ?auto_3070 - LOCATION
      ?auto_3067 - CITY
      ?auto_3069 - TRUCK
      ?auto_3068 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3065 ?auto_3064 ) ) ( not ( = ?auto_3066 ?auto_3064 ) ) ( not ( = ?auto_3066 ?auto_3065 ) ) ( IN-CITY ?auto_3070 ?auto_3067 ) ( IN-CITY ?auto_3063 ?auto_3067 ) ( not ( = ?auto_3063 ?auto_3070 ) ) ( OBJ-AT ?auto_3065 ?auto_3063 ) ( OBJ-AT ?auto_3064 ?auto_3070 ) ( IN-TRUCK ?auto_3066 ?auto_3069 ) ( TRUCK-AT ?auto_3069 ?auto_3068 ) ( IN-CITY ?auto_3068 ?auto_3067 ) ( not ( = ?auto_3063 ?auto_3068 ) ) ( not ( = ?auto_3070 ?auto_3068 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3065 ?auto_3064 ?auto_3063 )
      ( DELIVER-3PKG-VERIFY ?auto_3064 ?auto_3065 ?auto_3066 ?auto_3063 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3081 - OBJ
      ?auto_3082 - OBJ
      ?auto_3083 - OBJ
      ?auto_3080 - LOCATION
    )
    :vars
    (
      ?auto_3087 - LOCATION
      ?auto_3084 - CITY
      ?auto_3086 - TRUCK
      ?auto_3085 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3082 ?auto_3081 ) ) ( not ( = ?auto_3083 ?auto_3081 ) ) ( not ( = ?auto_3083 ?auto_3082 ) ) ( IN-CITY ?auto_3087 ?auto_3084 ) ( IN-CITY ?auto_3080 ?auto_3084 ) ( not ( = ?auto_3080 ?auto_3087 ) ) ( OBJ-AT ?auto_3083 ?auto_3080 ) ( OBJ-AT ?auto_3081 ?auto_3087 ) ( IN-TRUCK ?auto_3082 ?auto_3086 ) ( TRUCK-AT ?auto_3086 ?auto_3085 ) ( IN-CITY ?auto_3085 ?auto_3084 ) ( not ( = ?auto_3080 ?auto_3085 ) ) ( not ( = ?auto_3087 ?auto_3085 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3083 ?auto_3081 ?auto_3080 )
      ( DELIVER-3PKG-VERIFY ?auto_3081 ?auto_3082 ?auto_3083 ?auto_3080 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3135 - OBJ
      ?auto_3134 - LOCATION
    )
    :vars
    (
      ?auto_3141 - OBJ
      ?auto_3140 - LOCATION
      ?auto_3136 - CITY
      ?auto_3139 - OBJ
      ?auto_3138 - TRUCK
      ?auto_3137 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3135 ?auto_3141 ) ) ( IN-CITY ?auto_3140 ?auto_3136 ) ( IN-CITY ?auto_3134 ?auto_3136 ) ( not ( = ?auto_3134 ?auto_3140 ) ) ( OBJ-AT ?auto_3141 ?auto_3134 ) ( OBJ-AT ?auto_3135 ?auto_3140 ) ( not ( = ?auto_3139 ?auto_3141 ) ) ( not ( = ?auto_3135 ?auto_3139 ) ) ( TRUCK-AT ?auto_3138 ?auto_3137 ) ( IN-CITY ?auto_3137 ?auto_3136 ) ( not ( = ?auto_3134 ?auto_3137 ) ) ( not ( = ?auto_3140 ?auto_3137 ) ) ( OBJ-AT ?auto_3139 ?auto_3137 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3139 ?auto_3138 ?auto_3137 )
      ( DELIVER-2PKG ?auto_3141 ?auto_3135 ?auto_3134 )
      ( DELIVER-1PKG-VERIFY ?auto_3135 ?auto_3134 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3143 - OBJ
      ?auto_3144 - OBJ
      ?auto_3142 - LOCATION
    )
    :vars
    (
      ?auto_3148 - LOCATION
      ?auto_3149 - CITY
      ?auto_3146 - OBJ
      ?auto_3145 - TRUCK
      ?auto_3147 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3144 ?auto_3143 ) ) ( IN-CITY ?auto_3148 ?auto_3149 ) ( IN-CITY ?auto_3142 ?auto_3149 ) ( not ( = ?auto_3142 ?auto_3148 ) ) ( OBJ-AT ?auto_3143 ?auto_3142 ) ( OBJ-AT ?auto_3144 ?auto_3148 ) ( not ( = ?auto_3146 ?auto_3143 ) ) ( not ( = ?auto_3144 ?auto_3146 ) ) ( TRUCK-AT ?auto_3145 ?auto_3147 ) ( IN-CITY ?auto_3147 ?auto_3149 ) ( not ( = ?auto_3142 ?auto_3147 ) ) ( not ( = ?auto_3148 ?auto_3147 ) ) ( OBJ-AT ?auto_3146 ?auto_3147 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3144 ?auto_3142 )
      ( DELIVER-2PKG-VERIFY ?auto_3143 ?auto_3144 ?auto_3142 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3151 - OBJ
      ?auto_3152 - OBJ
      ?auto_3150 - LOCATION
    )
    :vars
    (
      ?auto_3157 - OBJ
      ?auto_3153 - LOCATION
      ?auto_3155 - CITY
      ?auto_3154 - TRUCK
      ?auto_3156 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3152 ?auto_3151 ) ) ( not ( = ?auto_3152 ?auto_3157 ) ) ( IN-CITY ?auto_3153 ?auto_3155 ) ( IN-CITY ?auto_3150 ?auto_3155 ) ( not ( = ?auto_3150 ?auto_3153 ) ) ( OBJ-AT ?auto_3157 ?auto_3150 ) ( OBJ-AT ?auto_3152 ?auto_3153 ) ( not ( = ?auto_3151 ?auto_3157 ) ) ( TRUCK-AT ?auto_3154 ?auto_3156 ) ( IN-CITY ?auto_3156 ?auto_3155 ) ( not ( = ?auto_3150 ?auto_3156 ) ) ( not ( = ?auto_3153 ?auto_3156 ) ) ( OBJ-AT ?auto_3151 ?auto_3156 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3157 ?auto_3152 ?auto_3150 )
      ( DELIVER-2PKG-VERIFY ?auto_3151 ?auto_3152 ?auto_3150 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3159 - OBJ
      ?auto_3160 - OBJ
      ?auto_3158 - LOCATION
    )
    :vars
    (
      ?auto_3162 - LOCATION
      ?auto_3164 - CITY
      ?auto_3161 - OBJ
      ?auto_3163 - TRUCK
      ?auto_3165 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3160 ?auto_3159 ) ) ( IN-CITY ?auto_3162 ?auto_3164 ) ( IN-CITY ?auto_3158 ?auto_3164 ) ( not ( = ?auto_3158 ?auto_3162 ) ) ( OBJ-AT ?auto_3160 ?auto_3158 ) ( OBJ-AT ?auto_3159 ?auto_3162 ) ( not ( = ?auto_3161 ?auto_3160 ) ) ( not ( = ?auto_3159 ?auto_3161 ) ) ( TRUCK-AT ?auto_3163 ?auto_3165 ) ( IN-CITY ?auto_3165 ?auto_3164 ) ( not ( = ?auto_3158 ?auto_3165 ) ) ( not ( = ?auto_3162 ?auto_3165 ) ) ( OBJ-AT ?auto_3161 ?auto_3165 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3160 ?auto_3159 ?auto_3158 )
      ( DELIVER-2PKG-VERIFY ?auto_3159 ?auto_3160 ?auto_3158 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3167 - OBJ
      ?auto_3168 - OBJ
      ?auto_3166 - LOCATION
    )
    :vars
    (
      ?auto_3173 - OBJ
      ?auto_3169 - LOCATION
      ?auto_3171 - CITY
      ?auto_3170 - TRUCK
      ?auto_3172 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3168 ?auto_3167 ) ) ( not ( = ?auto_3167 ?auto_3173 ) ) ( IN-CITY ?auto_3169 ?auto_3171 ) ( IN-CITY ?auto_3166 ?auto_3171 ) ( not ( = ?auto_3166 ?auto_3169 ) ) ( OBJ-AT ?auto_3173 ?auto_3166 ) ( OBJ-AT ?auto_3167 ?auto_3169 ) ( not ( = ?auto_3168 ?auto_3173 ) ) ( TRUCK-AT ?auto_3170 ?auto_3172 ) ( IN-CITY ?auto_3172 ?auto_3171 ) ( not ( = ?auto_3166 ?auto_3172 ) ) ( not ( = ?auto_3169 ?auto_3172 ) ) ( OBJ-AT ?auto_3168 ?auto_3172 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3173 ?auto_3167 ?auto_3166 )
      ( DELIVER-2PKG-VERIFY ?auto_3167 ?auto_3168 ?auto_3166 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3193 - OBJ
      ?auto_3194 - OBJ
      ?auto_3195 - OBJ
      ?auto_3192 - LOCATION
    )
    :vars
    (
      ?auto_3196 - LOCATION
      ?auto_3198 - CITY
      ?auto_3197 - TRUCK
      ?auto_3199 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3194 ?auto_3193 ) ) ( not ( = ?auto_3195 ?auto_3193 ) ) ( not ( = ?auto_3195 ?auto_3194 ) ) ( IN-CITY ?auto_3196 ?auto_3198 ) ( IN-CITY ?auto_3192 ?auto_3198 ) ( not ( = ?auto_3192 ?auto_3196 ) ) ( OBJ-AT ?auto_3193 ?auto_3192 ) ( OBJ-AT ?auto_3195 ?auto_3196 ) ( TRUCK-AT ?auto_3197 ?auto_3199 ) ( IN-CITY ?auto_3199 ?auto_3198 ) ( not ( = ?auto_3192 ?auto_3199 ) ) ( not ( = ?auto_3196 ?auto_3199 ) ) ( OBJ-AT ?auto_3194 ?auto_3199 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3193 ?auto_3195 ?auto_3192 )
      ( DELIVER-3PKG-VERIFY ?auto_3193 ?auto_3194 ?auto_3195 ?auto_3192 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3210 - OBJ
      ?auto_3211 - OBJ
      ?auto_3212 - OBJ
      ?auto_3209 - LOCATION
    )
    :vars
    (
      ?auto_3213 - LOCATION
      ?auto_3215 - CITY
      ?auto_3214 - TRUCK
      ?auto_3216 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3211 ?auto_3210 ) ) ( not ( = ?auto_3212 ?auto_3210 ) ) ( not ( = ?auto_3212 ?auto_3211 ) ) ( IN-CITY ?auto_3213 ?auto_3215 ) ( IN-CITY ?auto_3209 ?auto_3215 ) ( not ( = ?auto_3209 ?auto_3213 ) ) ( OBJ-AT ?auto_3210 ?auto_3209 ) ( OBJ-AT ?auto_3211 ?auto_3213 ) ( TRUCK-AT ?auto_3214 ?auto_3216 ) ( IN-CITY ?auto_3216 ?auto_3215 ) ( not ( = ?auto_3209 ?auto_3216 ) ) ( not ( = ?auto_3213 ?auto_3216 ) ) ( OBJ-AT ?auto_3212 ?auto_3216 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3210 ?auto_3211 ?auto_3209 )
      ( DELIVER-3PKG-VERIFY ?auto_3210 ?auto_3211 ?auto_3212 ?auto_3209 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3227 - OBJ
      ?auto_3228 - OBJ
      ?auto_3229 - OBJ
      ?auto_3226 - LOCATION
    )
    :vars
    (
      ?auto_3230 - LOCATION
      ?auto_3232 - CITY
      ?auto_3231 - TRUCK
      ?auto_3233 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3228 ?auto_3227 ) ) ( not ( = ?auto_3229 ?auto_3227 ) ) ( not ( = ?auto_3229 ?auto_3228 ) ) ( IN-CITY ?auto_3230 ?auto_3232 ) ( IN-CITY ?auto_3226 ?auto_3232 ) ( not ( = ?auto_3226 ?auto_3230 ) ) ( OBJ-AT ?auto_3228 ?auto_3226 ) ( OBJ-AT ?auto_3229 ?auto_3230 ) ( TRUCK-AT ?auto_3231 ?auto_3233 ) ( IN-CITY ?auto_3233 ?auto_3232 ) ( not ( = ?auto_3226 ?auto_3233 ) ) ( not ( = ?auto_3230 ?auto_3233 ) ) ( OBJ-AT ?auto_3227 ?auto_3233 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3228 ?auto_3229 ?auto_3226 )
      ( DELIVER-3PKG-VERIFY ?auto_3227 ?auto_3228 ?auto_3229 ?auto_3226 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3244 - OBJ
      ?auto_3245 - OBJ
      ?auto_3246 - OBJ
      ?auto_3243 - LOCATION
    )
    :vars
    (
      ?auto_3247 - LOCATION
      ?auto_3249 - CITY
      ?auto_3248 - TRUCK
      ?auto_3250 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3245 ?auto_3244 ) ) ( not ( = ?auto_3246 ?auto_3244 ) ) ( not ( = ?auto_3246 ?auto_3245 ) ) ( IN-CITY ?auto_3247 ?auto_3249 ) ( IN-CITY ?auto_3243 ?auto_3249 ) ( not ( = ?auto_3243 ?auto_3247 ) ) ( OBJ-AT ?auto_3246 ?auto_3243 ) ( OBJ-AT ?auto_3245 ?auto_3247 ) ( TRUCK-AT ?auto_3248 ?auto_3250 ) ( IN-CITY ?auto_3250 ?auto_3249 ) ( not ( = ?auto_3243 ?auto_3250 ) ) ( not ( = ?auto_3247 ?auto_3250 ) ) ( OBJ-AT ?auto_3244 ?auto_3250 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3246 ?auto_3245 ?auto_3243 )
      ( DELIVER-3PKG-VERIFY ?auto_3244 ?auto_3245 ?auto_3246 ?auto_3243 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3279 - OBJ
      ?auto_3280 - OBJ
      ?auto_3281 - OBJ
      ?auto_3278 - LOCATION
    )
    :vars
    (
      ?auto_3282 - LOCATION
      ?auto_3284 - CITY
      ?auto_3283 - TRUCK
      ?auto_3285 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3280 ?auto_3279 ) ) ( not ( = ?auto_3281 ?auto_3279 ) ) ( not ( = ?auto_3281 ?auto_3280 ) ) ( IN-CITY ?auto_3282 ?auto_3284 ) ( IN-CITY ?auto_3278 ?auto_3284 ) ( not ( = ?auto_3278 ?auto_3282 ) ) ( OBJ-AT ?auto_3280 ?auto_3278 ) ( OBJ-AT ?auto_3279 ?auto_3282 ) ( TRUCK-AT ?auto_3283 ?auto_3285 ) ( IN-CITY ?auto_3285 ?auto_3284 ) ( not ( = ?auto_3278 ?auto_3285 ) ) ( not ( = ?auto_3282 ?auto_3285 ) ) ( OBJ-AT ?auto_3281 ?auto_3285 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3280 ?auto_3279 ?auto_3278 )
      ( DELIVER-3PKG-VERIFY ?auto_3279 ?auto_3280 ?auto_3281 ?auto_3278 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3296 - OBJ
      ?auto_3297 - OBJ
      ?auto_3298 - OBJ
      ?auto_3295 - LOCATION
    )
    :vars
    (
      ?auto_3299 - LOCATION
      ?auto_3301 - CITY
      ?auto_3300 - TRUCK
      ?auto_3302 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3297 ?auto_3296 ) ) ( not ( = ?auto_3298 ?auto_3296 ) ) ( not ( = ?auto_3298 ?auto_3297 ) ) ( IN-CITY ?auto_3299 ?auto_3301 ) ( IN-CITY ?auto_3295 ?auto_3301 ) ( not ( = ?auto_3295 ?auto_3299 ) ) ( OBJ-AT ?auto_3298 ?auto_3295 ) ( OBJ-AT ?auto_3296 ?auto_3299 ) ( TRUCK-AT ?auto_3300 ?auto_3302 ) ( IN-CITY ?auto_3302 ?auto_3301 ) ( not ( = ?auto_3295 ?auto_3302 ) ) ( not ( = ?auto_3299 ?auto_3302 ) ) ( OBJ-AT ?auto_3297 ?auto_3302 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3298 ?auto_3296 ?auto_3295 )
      ( DELIVER-3PKG-VERIFY ?auto_3296 ?auto_3297 ?auto_3298 ?auto_3295 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3350 - OBJ
      ?auto_3349 - LOCATION
    )
    :vars
    (
      ?auto_3356 - OBJ
      ?auto_3352 - LOCATION
      ?auto_3354 - CITY
      ?auto_3351 - OBJ
      ?auto_3355 - LOCATION
      ?auto_3353 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3350 ?auto_3356 ) ) ( IN-CITY ?auto_3352 ?auto_3354 ) ( IN-CITY ?auto_3349 ?auto_3354 ) ( not ( = ?auto_3349 ?auto_3352 ) ) ( OBJ-AT ?auto_3356 ?auto_3349 ) ( OBJ-AT ?auto_3350 ?auto_3352 ) ( not ( = ?auto_3351 ?auto_3356 ) ) ( not ( = ?auto_3350 ?auto_3351 ) ) ( IN-CITY ?auto_3355 ?auto_3354 ) ( not ( = ?auto_3349 ?auto_3355 ) ) ( not ( = ?auto_3352 ?auto_3355 ) ) ( OBJ-AT ?auto_3351 ?auto_3355 ) ( TRUCK-AT ?auto_3353 ?auto_3349 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3353 ?auto_3349 ?auto_3355 ?auto_3354 )
      ( DELIVER-2PKG ?auto_3356 ?auto_3350 ?auto_3349 )
      ( DELIVER-1PKG-VERIFY ?auto_3350 ?auto_3349 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3358 - OBJ
      ?auto_3359 - OBJ
      ?auto_3357 - LOCATION
    )
    :vars
    (
      ?auto_3360 - LOCATION
      ?auto_3361 - CITY
      ?auto_3363 - OBJ
      ?auto_3364 - LOCATION
      ?auto_3362 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3359 ?auto_3358 ) ) ( IN-CITY ?auto_3360 ?auto_3361 ) ( IN-CITY ?auto_3357 ?auto_3361 ) ( not ( = ?auto_3357 ?auto_3360 ) ) ( OBJ-AT ?auto_3358 ?auto_3357 ) ( OBJ-AT ?auto_3359 ?auto_3360 ) ( not ( = ?auto_3363 ?auto_3358 ) ) ( not ( = ?auto_3359 ?auto_3363 ) ) ( IN-CITY ?auto_3364 ?auto_3361 ) ( not ( = ?auto_3357 ?auto_3364 ) ) ( not ( = ?auto_3360 ?auto_3364 ) ) ( OBJ-AT ?auto_3363 ?auto_3364 ) ( TRUCK-AT ?auto_3362 ?auto_3357 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3359 ?auto_3357 )
      ( DELIVER-2PKG-VERIFY ?auto_3358 ?auto_3359 ?auto_3357 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3366 - OBJ
      ?auto_3367 - OBJ
      ?auto_3365 - LOCATION
    )
    :vars
    (
      ?auto_3372 - OBJ
      ?auto_3369 - LOCATION
      ?auto_3368 - CITY
      ?auto_3371 - LOCATION
      ?auto_3370 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3367 ?auto_3366 ) ) ( not ( = ?auto_3367 ?auto_3372 ) ) ( IN-CITY ?auto_3369 ?auto_3368 ) ( IN-CITY ?auto_3365 ?auto_3368 ) ( not ( = ?auto_3365 ?auto_3369 ) ) ( OBJ-AT ?auto_3372 ?auto_3365 ) ( OBJ-AT ?auto_3367 ?auto_3369 ) ( not ( = ?auto_3366 ?auto_3372 ) ) ( IN-CITY ?auto_3371 ?auto_3368 ) ( not ( = ?auto_3365 ?auto_3371 ) ) ( not ( = ?auto_3369 ?auto_3371 ) ) ( OBJ-AT ?auto_3366 ?auto_3371 ) ( TRUCK-AT ?auto_3370 ?auto_3365 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3372 ?auto_3367 ?auto_3365 )
      ( DELIVER-2PKG-VERIFY ?auto_3366 ?auto_3367 ?auto_3365 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3374 - OBJ
      ?auto_3375 - OBJ
      ?auto_3373 - LOCATION
    )
    :vars
    (
      ?auto_3377 - LOCATION
      ?auto_3376 - CITY
      ?auto_3379 - OBJ
      ?auto_3380 - LOCATION
      ?auto_3378 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3375 ?auto_3374 ) ) ( IN-CITY ?auto_3377 ?auto_3376 ) ( IN-CITY ?auto_3373 ?auto_3376 ) ( not ( = ?auto_3373 ?auto_3377 ) ) ( OBJ-AT ?auto_3375 ?auto_3373 ) ( OBJ-AT ?auto_3374 ?auto_3377 ) ( not ( = ?auto_3379 ?auto_3375 ) ) ( not ( = ?auto_3374 ?auto_3379 ) ) ( IN-CITY ?auto_3380 ?auto_3376 ) ( not ( = ?auto_3373 ?auto_3380 ) ) ( not ( = ?auto_3377 ?auto_3380 ) ) ( OBJ-AT ?auto_3379 ?auto_3380 ) ( TRUCK-AT ?auto_3378 ?auto_3373 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3375 ?auto_3374 ?auto_3373 )
      ( DELIVER-2PKG-VERIFY ?auto_3374 ?auto_3375 ?auto_3373 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3382 - OBJ
      ?auto_3383 - OBJ
      ?auto_3381 - LOCATION
    )
    :vars
    (
      ?auto_3388 - OBJ
      ?auto_3385 - LOCATION
      ?auto_3384 - CITY
      ?auto_3387 - LOCATION
      ?auto_3386 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3383 ?auto_3382 ) ) ( not ( = ?auto_3382 ?auto_3388 ) ) ( IN-CITY ?auto_3385 ?auto_3384 ) ( IN-CITY ?auto_3381 ?auto_3384 ) ( not ( = ?auto_3381 ?auto_3385 ) ) ( OBJ-AT ?auto_3388 ?auto_3381 ) ( OBJ-AT ?auto_3382 ?auto_3385 ) ( not ( = ?auto_3383 ?auto_3388 ) ) ( IN-CITY ?auto_3387 ?auto_3384 ) ( not ( = ?auto_3381 ?auto_3387 ) ) ( not ( = ?auto_3385 ?auto_3387 ) ) ( OBJ-AT ?auto_3383 ?auto_3387 ) ( TRUCK-AT ?auto_3386 ?auto_3381 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3388 ?auto_3382 ?auto_3381 )
      ( DELIVER-2PKG-VERIFY ?auto_3382 ?auto_3383 ?auto_3381 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3408 - OBJ
      ?auto_3409 - OBJ
      ?auto_3410 - OBJ
      ?auto_3407 - LOCATION
    )
    :vars
    (
      ?auto_3412 - LOCATION
      ?auto_3411 - CITY
      ?auto_3414 - LOCATION
      ?auto_3413 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3409 ?auto_3408 ) ) ( not ( = ?auto_3410 ?auto_3408 ) ) ( not ( = ?auto_3410 ?auto_3409 ) ) ( IN-CITY ?auto_3412 ?auto_3411 ) ( IN-CITY ?auto_3407 ?auto_3411 ) ( not ( = ?auto_3407 ?auto_3412 ) ) ( OBJ-AT ?auto_3408 ?auto_3407 ) ( OBJ-AT ?auto_3410 ?auto_3412 ) ( IN-CITY ?auto_3414 ?auto_3411 ) ( not ( = ?auto_3407 ?auto_3414 ) ) ( not ( = ?auto_3412 ?auto_3414 ) ) ( OBJ-AT ?auto_3409 ?auto_3414 ) ( TRUCK-AT ?auto_3413 ?auto_3407 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3408 ?auto_3410 ?auto_3407 )
      ( DELIVER-3PKG-VERIFY ?auto_3408 ?auto_3409 ?auto_3410 ?auto_3407 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3425 - OBJ
      ?auto_3426 - OBJ
      ?auto_3427 - OBJ
      ?auto_3424 - LOCATION
    )
    :vars
    (
      ?auto_3429 - LOCATION
      ?auto_3428 - CITY
      ?auto_3431 - LOCATION
      ?auto_3430 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3426 ?auto_3425 ) ) ( not ( = ?auto_3427 ?auto_3425 ) ) ( not ( = ?auto_3427 ?auto_3426 ) ) ( IN-CITY ?auto_3429 ?auto_3428 ) ( IN-CITY ?auto_3424 ?auto_3428 ) ( not ( = ?auto_3424 ?auto_3429 ) ) ( OBJ-AT ?auto_3425 ?auto_3424 ) ( OBJ-AT ?auto_3426 ?auto_3429 ) ( IN-CITY ?auto_3431 ?auto_3428 ) ( not ( = ?auto_3424 ?auto_3431 ) ) ( not ( = ?auto_3429 ?auto_3431 ) ) ( OBJ-AT ?auto_3427 ?auto_3431 ) ( TRUCK-AT ?auto_3430 ?auto_3424 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3425 ?auto_3426 ?auto_3424 )
      ( DELIVER-3PKG-VERIFY ?auto_3425 ?auto_3426 ?auto_3427 ?auto_3424 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3442 - OBJ
      ?auto_3443 - OBJ
      ?auto_3444 - OBJ
      ?auto_3441 - LOCATION
    )
    :vars
    (
      ?auto_3446 - LOCATION
      ?auto_3445 - CITY
      ?auto_3448 - LOCATION
      ?auto_3447 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3443 ?auto_3442 ) ) ( not ( = ?auto_3444 ?auto_3442 ) ) ( not ( = ?auto_3444 ?auto_3443 ) ) ( IN-CITY ?auto_3446 ?auto_3445 ) ( IN-CITY ?auto_3441 ?auto_3445 ) ( not ( = ?auto_3441 ?auto_3446 ) ) ( OBJ-AT ?auto_3443 ?auto_3441 ) ( OBJ-AT ?auto_3444 ?auto_3446 ) ( IN-CITY ?auto_3448 ?auto_3445 ) ( not ( = ?auto_3441 ?auto_3448 ) ) ( not ( = ?auto_3446 ?auto_3448 ) ) ( OBJ-AT ?auto_3442 ?auto_3448 ) ( TRUCK-AT ?auto_3447 ?auto_3441 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3443 ?auto_3444 ?auto_3441 )
      ( DELIVER-3PKG-VERIFY ?auto_3442 ?auto_3443 ?auto_3444 ?auto_3441 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3459 - OBJ
      ?auto_3460 - OBJ
      ?auto_3461 - OBJ
      ?auto_3458 - LOCATION
    )
    :vars
    (
      ?auto_3463 - LOCATION
      ?auto_3462 - CITY
      ?auto_3465 - LOCATION
      ?auto_3464 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3460 ?auto_3459 ) ) ( not ( = ?auto_3461 ?auto_3459 ) ) ( not ( = ?auto_3461 ?auto_3460 ) ) ( IN-CITY ?auto_3463 ?auto_3462 ) ( IN-CITY ?auto_3458 ?auto_3462 ) ( not ( = ?auto_3458 ?auto_3463 ) ) ( OBJ-AT ?auto_3461 ?auto_3458 ) ( OBJ-AT ?auto_3460 ?auto_3463 ) ( IN-CITY ?auto_3465 ?auto_3462 ) ( not ( = ?auto_3458 ?auto_3465 ) ) ( not ( = ?auto_3463 ?auto_3465 ) ) ( OBJ-AT ?auto_3459 ?auto_3465 ) ( TRUCK-AT ?auto_3464 ?auto_3458 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3461 ?auto_3460 ?auto_3458 )
      ( DELIVER-3PKG-VERIFY ?auto_3459 ?auto_3460 ?auto_3461 ?auto_3458 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3494 - OBJ
      ?auto_3495 - OBJ
      ?auto_3496 - OBJ
      ?auto_3493 - LOCATION
    )
    :vars
    (
      ?auto_3498 - LOCATION
      ?auto_3497 - CITY
      ?auto_3500 - LOCATION
      ?auto_3499 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3495 ?auto_3494 ) ) ( not ( = ?auto_3496 ?auto_3494 ) ) ( not ( = ?auto_3496 ?auto_3495 ) ) ( IN-CITY ?auto_3498 ?auto_3497 ) ( IN-CITY ?auto_3493 ?auto_3497 ) ( not ( = ?auto_3493 ?auto_3498 ) ) ( OBJ-AT ?auto_3495 ?auto_3493 ) ( OBJ-AT ?auto_3494 ?auto_3498 ) ( IN-CITY ?auto_3500 ?auto_3497 ) ( not ( = ?auto_3493 ?auto_3500 ) ) ( not ( = ?auto_3498 ?auto_3500 ) ) ( OBJ-AT ?auto_3496 ?auto_3500 ) ( TRUCK-AT ?auto_3499 ?auto_3493 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3495 ?auto_3494 ?auto_3493 )
      ( DELIVER-3PKG-VERIFY ?auto_3494 ?auto_3495 ?auto_3496 ?auto_3493 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3511 - OBJ
      ?auto_3512 - OBJ
      ?auto_3513 - OBJ
      ?auto_3510 - LOCATION
    )
    :vars
    (
      ?auto_3515 - LOCATION
      ?auto_3514 - CITY
      ?auto_3517 - LOCATION
      ?auto_3516 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3512 ?auto_3511 ) ) ( not ( = ?auto_3513 ?auto_3511 ) ) ( not ( = ?auto_3513 ?auto_3512 ) ) ( IN-CITY ?auto_3515 ?auto_3514 ) ( IN-CITY ?auto_3510 ?auto_3514 ) ( not ( = ?auto_3510 ?auto_3515 ) ) ( OBJ-AT ?auto_3513 ?auto_3510 ) ( OBJ-AT ?auto_3511 ?auto_3515 ) ( IN-CITY ?auto_3517 ?auto_3514 ) ( not ( = ?auto_3510 ?auto_3517 ) ) ( not ( = ?auto_3515 ?auto_3517 ) ) ( OBJ-AT ?auto_3512 ?auto_3517 ) ( TRUCK-AT ?auto_3516 ?auto_3510 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3513 ?auto_3511 ?auto_3510 )
      ( DELIVER-3PKG-VERIFY ?auto_3511 ?auto_3512 ?auto_3513 ?auto_3510 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3565 - OBJ
      ?auto_3564 - LOCATION
    )
    :vars
    (
      ?auto_3571 - OBJ
      ?auto_3567 - LOCATION
      ?auto_3566 - CITY
      ?auto_3569 - OBJ
      ?auto_3570 - LOCATION
      ?auto_3568 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3565 ?auto_3571 ) ) ( IN-CITY ?auto_3567 ?auto_3566 ) ( IN-CITY ?auto_3564 ?auto_3566 ) ( not ( = ?auto_3564 ?auto_3567 ) ) ( OBJ-AT ?auto_3565 ?auto_3567 ) ( not ( = ?auto_3569 ?auto_3571 ) ) ( not ( = ?auto_3565 ?auto_3569 ) ) ( IN-CITY ?auto_3570 ?auto_3566 ) ( not ( = ?auto_3564 ?auto_3570 ) ) ( not ( = ?auto_3567 ?auto_3570 ) ) ( OBJ-AT ?auto_3569 ?auto_3570 ) ( TRUCK-AT ?auto_3568 ?auto_3564 ) ( IN-TRUCK ?auto_3571 ?auto_3568 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3571 ?auto_3564 )
      ( DELIVER-2PKG ?auto_3571 ?auto_3565 ?auto_3564 )
      ( DELIVER-1PKG-VERIFY ?auto_3565 ?auto_3564 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3573 - OBJ
      ?auto_3574 - OBJ
      ?auto_3572 - LOCATION
    )
    :vars
    (
      ?auto_3578 - LOCATION
      ?auto_3576 - CITY
      ?auto_3579 - OBJ
      ?auto_3575 - LOCATION
      ?auto_3577 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3574 ?auto_3573 ) ) ( IN-CITY ?auto_3578 ?auto_3576 ) ( IN-CITY ?auto_3572 ?auto_3576 ) ( not ( = ?auto_3572 ?auto_3578 ) ) ( OBJ-AT ?auto_3574 ?auto_3578 ) ( not ( = ?auto_3579 ?auto_3573 ) ) ( not ( = ?auto_3574 ?auto_3579 ) ) ( IN-CITY ?auto_3575 ?auto_3576 ) ( not ( = ?auto_3572 ?auto_3575 ) ) ( not ( = ?auto_3578 ?auto_3575 ) ) ( OBJ-AT ?auto_3579 ?auto_3575 ) ( TRUCK-AT ?auto_3577 ?auto_3572 ) ( IN-TRUCK ?auto_3573 ?auto_3577 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3574 ?auto_3572 )
      ( DELIVER-2PKG-VERIFY ?auto_3573 ?auto_3574 ?auto_3572 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3581 - OBJ
      ?auto_3582 - OBJ
      ?auto_3580 - LOCATION
    )
    :vars
    (
      ?auto_3587 - OBJ
      ?auto_3584 - LOCATION
      ?auto_3586 - CITY
      ?auto_3585 - LOCATION
      ?auto_3583 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3582 ?auto_3581 ) ) ( not ( = ?auto_3582 ?auto_3587 ) ) ( IN-CITY ?auto_3584 ?auto_3586 ) ( IN-CITY ?auto_3580 ?auto_3586 ) ( not ( = ?auto_3580 ?auto_3584 ) ) ( OBJ-AT ?auto_3582 ?auto_3584 ) ( not ( = ?auto_3581 ?auto_3587 ) ) ( IN-CITY ?auto_3585 ?auto_3586 ) ( not ( = ?auto_3580 ?auto_3585 ) ) ( not ( = ?auto_3584 ?auto_3585 ) ) ( OBJ-AT ?auto_3581 ?auto_3585 ) ( TRUCK-AT ?auto_3583 ?auto_3580 ) ( IN-TRUCK ?auto_3587 ?auto_3583 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3587 ?auto_3582 ?auto_3580 )
      ( DELIVER-2PKG-VERIFY ?auto_3581 ?auto_3582 ?auto_3580 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3589 - OBJ
      ?auto_3590 - OBJ
      ?auto_3588 - LOCATION
    )
    :vars
    (
      ?auto_3593 - LOCATION
      ?auto_3595 - CITY
      ?auto_3592 - OBJ
      ?auto_3594 - LOCATION
      ?auto_3591 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3590 ?auto_3589 ) ) ( IN-CITY ?auto_3593 ?auto_3595 ) ( IN-CITY ?auto_3588 ?auto_3595 ) ( not ( = ?auto_3588 ?auto_3593 ) ) ( OBJ-AT ?auto_3589 ?auto_3593 ) ( not ( = ?auto_3592 ?auto_3590 ) ) ( not ( = ?auto_3589 ?auto_3592 ) ) ( IN-CITY ?auto_3594 ?auto_3595 ) ( not ( = ?auto_3588 ?auto_3594 ) ) ( not ( = ?auto_3593 ?auto_3594 ) ) ( OBJ-AT ?auto_3592 ?auto_3594 ) ( TRUCK-AT ?auto_3591 ?auto_3588 ) ( IN-TRUCK ?auto_3590 ?auto_3591 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3590 ?auto_3589 ?auto_3588 )
      ( DELIVER-2PKG-VERIFY ?auto_3589 ?auto_3590 ?auto_3588 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3597 - OBJ
      ?auto_3598 - OBJ
      ?auto_3596 - LOCATION
    )
    :vars
    (
      ?auto_3603 - OBJ
      ?auto_3600 - LOCATION
      ?auto_3602 - CITY
      ?auto_3601 - LOCATION
      ?auto_3599 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3598 ?auto_3597 ) ) ( not ( = ?auto_3597 ?auto_3603 ) ) ( IN-CITY ?auto_3600 ?auto_3602 ) ( IN-CITY ?auto_3596 ?auto_3602 ) ( not ( = ?auto_3596 ?auto_3600 ) ) ( OBJ-AT ?auto_3597 ?auto_3600 ) ( not ( = ?auto_3598 ?auto_3603 ) ) ( IN-CITY ?auto_3601 ?auto_3602 ) ( not ( = ?auto_3596 ?auto_3601 ) ) ( not ( = ?auto_3600 ?auto_3601 ) ) ( OBJ-AT ?auto_3598 ?auto_3601 ) ( TRUCK-AT ?auto_3599 ?auto_3596 ) ( IN-TRUCK ?auto_3603 ?auto_3599 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3603 ?auto_3597 ?auto_3596 )
      ( DELIVER-2PKG-VERIFY ?auto_3597 ?auto_3598 ?auto_3596 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3623 - OBJ
      ?auto_3624 - OBJ
      ?auto_3625 - OBJ
      ?auto_3622 - LOCATION
    )
    :vars
    (
      ?auto_3627 - LOCATION
      ?auto_3629 - CITY
      ?auto_3628 - LOCATION
      ?auto_3626 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3624 ?auto_3623 ) ) ( not ( = ?auto_3625 ?auto_3623 ) ) ( not ( = ?auto_3625 ?auto_3624 ) ) ( IN-CITY ?auto_3627 ?auto_3629 ) ( IN-CITY ?auto_3622 ?auto_3629 ) ( not ( = ?auto_3622 ?auto_3627 ) ) ( OBJ-AT ?auto_3625 ?auto_3627 ) ( IN-CITY ?auto_3628 ?auto_3629 ) ( not ( = ?auto_3622 ?auto_3628 ) ) ( not ( = ?auto_3627 ?auto_3628 ) ) ( OBJ-AT ?auto_3624 ?auto_3628 ) ( TRUCK-AT ?auto_3626 ?auto_3622 ) ( IN-TRUCK ?auto_3623 ?auto_3626 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3623 ?auto_3625 ?auto_3622 )
      ( DELIVER-3PKG-VERIFY ?auto_3623 ?auto_3624 ?auto_3625 ?auto_3622 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3640 - OBJ
      ?auto_3641 - OBJ
      ?auto_3642 - OBJ
      ?auto_3639 - LOCATION
    )
    :vars
    (
      ?auto_3644 - LOCATION
      ?auto_3646 - CITY
      ?auto_3645 - LOCATION
      ?auto_3643 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3641 ?auto_3640 ) ) ( not ( = ?auto_3642 ?auto_3640 ) ) ( not ( = ?auto_3642 ?auto_3641 ) ) ( IN-CITY ?auto_3644 ?auto_3646 ) ( IN-CITY ?auto_3639 ?auto_3646 ) ( not ( = ?auto_3639 ?auto_3644 ) ) ( OBJ-AT ?auto_3641 ?auto_3644 ) ( IN-CITY ?auto_3645 ?auto_3646 ) ( not ( = ?auto_3639 ?auto_3645 ) ) ( not ( = ?auto_3644 ?auto_3645 ) ) ( OBJ-AT ?auto_3642 ?auto_3645 ) ( TRUCK-AT ?auto_3643 ?auto_3639 ) ( IN-TRUCK ?auto_3640 ?auto_3643 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3640 ?auto_3641 ?auto_3639 )
      ( DELIVER-3PKG-VERIFY ?auto_3640 ?auto_3641 ?auto_3642 ?auto_3639 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3657 - OBJ
      ?auto_3658 - OBJ
      ?auto_3659 - OBJ
      ?auto_3656 - LOCATION
    )
    :vars
    (
      ?auto_3661 - LOCATION
      ?auto_3663 - CITY
      ?auto_3662 - LOCATION
      ?auto_3660 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3658 ?auto_3657 ) ) ( not ( = ?auto_3659 ?auto_3657 ) ) ( not ( = ?auto_3659 ?auto_3658 ) ) ( IN-CITY ?auto_3661 ?auto_3663 ) ( IN-CITY ?auto_3656 ?auto_3663 ) ( not ( = ?auto_3656 ?auto_3661 ) ) ( OBJ-AT ?auto_3659 ?auto_3661 ) ( IN-CITY ?auto_3662 ?auto_3663 ) ( not ( = ?auto_3656 ?auto_3662 ) ) ( not ( = ?auto_3661 ?auto_3662 ) ) ( OBJ-AT ?auto_3657 ?auto_3662 ) ( TRUCK-AT ?auto_3660 ?auto_3656 ) ( IN-TRUCK ?auto_3658 ?auto_3660 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3658 ?auto_3659 ?auto_3656 )
      ( DELIVER-3PKG-VERIFY ?auto_3657 ?auto_3658 ?auto_3659 ?auto_3656 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3674 - OBJ
      ?auto_3675 - OBJ
      ?auto_3676 - OBJ
      ?auto_3673 - LOCATION
    )
    :vars
    (
      ?auto_3678 - LOCATION
      ?auto_3680 - CITY
      ?auto_3679 - LOCATION
      ?auto_3677 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3675 ?auto_3674 ) ) ( not ( = ?auto_3676 ?auto_3674 ) ) ( not ( = ?auto_3676 ?auto_3675 ) ) ( IN-CITY ?auto_3678 ?auto_3680 ) ( IN-CITY ?auto_3673 ?auto_3680 ) ( not ( = ?auto_3673 ?auto_3678 ) ) ( OBJ-AT ?auto_3675 ?auto_3678 ) ( IN-CITY ?auto_3679 ?auto_3680 ) ( not ( = ?auto_3673 ?auto_3679 ) ) ( not ( = ?auto_3678 ?auto_3679 ) ) ( OBJ-AT ?auto_3674 ?auto_3679 ) ( TRUCK-AT ?auto_3677 ?auto_3673 ) ( IN-TRUCK ?auto_3676 ?auto_3677 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3676 ?auto_3675 ?auto_3673 )
      ( DELIVER-3PKG-VERIFY ?auto_3674 ?auto_3675 ?auto_3676 ?auto_3673 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3709 - OBJ
      ?auto_3710 - OBJ
      ?auto_3711 - OBJ
      ?auto_3708 - LOCATION
    )
    :vars
    (
      ?auto_3713 - LOCATION
      ?auto_3715 - CITY
      ?auto_3714 - LOCATION
      ?auto_3712 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3710 ?auto_3709 ) ) ( not ( = ?auto_3711 ?auto_3709 ) ) ( not ( = ?auto_3711 ?auto_3710 ) ) ( IN-CITY ?auto_3713 ?auto_3715 ) ( IN-CITY ?auto_3708 ?auto_3715 ) ( not ( = ?auto_3708 ?auto_3713 ) ) ( OBJ-AT ?auto_3709 ?auto_3713 ) ( IN-CITY ?auto_3714 ?auto_3715 ) ( not ( = ?auto_3708 ?auto_3714 ) ) ( not ( = ?auto_3713 ?auto_3714 ) ) ( OBJ-AT ?auto_3711 ?auto_3714 ) ( TRUCK-AT ?auto_3712 ?auto_3708 ) ( IN-TRUCK ?auto_3710 ?auto_3712 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3710 ?auto_3709 ?auto_3708 )
      ( DELIVER-3PKG-VERIFY ?auto_3709 ?auto_3710 ?auto_3711 ?auto_3708 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3726 - OBJ
      ?auto_3727 - OBJ
      ?auto_3728 - OBJ
      ?auto_3725 - LOCATION
    )
    :vars
    (
      ?auto_3730 - LOCATION
      ?auto_3732 - CITY
      ?auto_3731 - LOCATION
      ?auto_3729 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3727 ?auto_3726 ) ) ( not ( = ?auto_3728 ?auto_3726 ) ) ( not ( = ?auto_3728 ?auto_3727 ) ) ( IN-CITY ?auto_3730 ?auto_3732 ) ( IN-CITY ?auto_3725 ?auto_3732 ) ( not ( = ?auto_3725 ?auto_3730 ) ) ( OBJ-AT ?auto_3726 ?auto_3730 ) ( IN-CITY ?auto_3731 ?auto_3732 ) ( not ( = ?auto_3725 ?auto_3731 ) ) ( not ( = ?auto_3730 ?auto_3731 ) ) ( OBJ-AT ?auto_3727 ?auto_3731 ) ( TRUCK-AT ?auto_3729 ?auto_3725 ) ( IN-TRUCK ?auto_3728 ?auto_3729 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3728 ?auto_3726 ?auto_3725 )
      ( DELIVER-3PKG-VERIFY ?auto_3726 ?auto_3727 ?auto_3728 ?auto_3725 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3780 - OBJ
      ?auto_3779 - LOCATION
    )
    :vars
    (
      ?auto_3786 - OBJ
      ?auto_3783 - LOCATION
      ?auto_3785 - CITY
      ?auto_3782 - OBJ
      ?auto_3784 - LOCATION
      ?auto_3781 - TRUCK
      ?auto_3787 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3780 ?auto_3786 ) ) ( IN-CITY ?auto_3783 ?auto_3785 ) ( IN-CITY ?auto_3779 ?auto_3785 ) ( not ( = ?auto_3779 ?auto_3783 ) ) ( OBJ-AT ?auto_3780 ?auto_3783 ) ( not ( = ?auto_3782 ?auto_3786 ) ) ( not ( = ?auto_3780 ?auto_3782 ) ) ( IN-CITY ?auto_3784 ?auto_3785 ) ( not ( = ?auto_3779 ?auto_3784 ) ) ( not ( = ?auto_3783 ?auto_3784 ) ) ( OBJ-AT ?auto_3782 ?auto_3784 ) ( IN-TRUCK ?auto_3786 ?auto_3781 ) ( TRUCK-AT ?auto_3781 ?auto_3787 ) ( IN-CITY ?auto_3787 ?auto_3785 ) ( not ( = ?auto_3779 ?auto_3787 ) ) ( not ( = ?auto_3783 ?auto_3787 ) ) ( not ( = ?auto_3784 ?auto_3787 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3781 ?auto_3787 ?auto_3779 ?auto_3785 )
      ( DELIVER-2PKG ?auto_3786 ?auto_3780 ?auto_3779 )
      ( DELIVER-1PKG-VERIFY ?auto_3780 ?auto_3779 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3789 - OBJ
      ?auto_3790 - OBJ
      ?auto_3788 - LOCATION
    )
    :vars
    (
      ?auto_3792 - LOCATION
      ?auto_3794 - CITY
      ?auto_3793 - OBJ
      ?auto_3795 - LOCATION
      ?auto_3796 - TRUCK
      ?auto_3791 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3790 ?auto_3789 ) ) ( IN-CITY ?auto_3792 ?auto_3794 ) ( IN-CITY ?auto_3788 ?auto_3794 ) ( not ( = ?auto_3788 ?auto_3792 ) ) ( OBJ-AT ?auto_3790 ?auto_3792 ) ( not ( = ?auto_3793 ?auto_3789 ) ) ( not ( = ?auto_3790 ?auto_3793 ) ) ( IN-CITY ?auto_3795 ?auto_3794 ) ( not ( = ?auto_3788 ?auto_3795 ) ) ( not ( = ?auto_3792 ?auto_3795 ) ) ( OBJ-AT ?auto_3793 ?auto_3795 ) ( IN-TRUCK ?auto_3789 ?auto_3796 ) ( TRUCK-AT ?auto_3796 ?auto_3791 ) ( IN-CITY ?auto_3791 ?auto_3794 ) ( not ( = ?auto_3788 ?auto_3791 ) ) ( not ( = ?auto_3792 ?auto_3791 ) ) ( not ( = ?auto_3795 ?auto_3791 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3790 ?auto_3788 )
      ( DELIVER-2PKG-VERIFY ?auto_3789 ?auto_3790 ?auto_3788 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3798 - OBJ
      ?auto_3799 - OBJ
      ?auto_3797 - LOCATION
    )
    :vars
    (
      ?auto_3805 - OBJ
      ?auto_3801 - LOCATION
      ?auto_3802 - CITY
      ?auto_3800 - LOCATION
      ?auto_3804 - TRUCK
      ?auto_3803 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3799 ?auto_3798 ) ) ( not ( = ?auto_3799 ?auto_3805 ) ) ( IN-CITY ?auto_3801 ?auto_3802 ) ( IN-CITY ?auto_3797 ?auto_3802 ) ( not ( = ?auto_3797 ?auto_3801 ) ) ( OBJ-AT ?auto_3799 ?auto_3801 ) ( not ( = ?auto_3798 ?auto_3805 ) ) ( IN-CITY ?auto_3800 ?auto_3802 ) ( not ( = ?auto_3797 ?auto_3800 ) ) ( not ( = ?auto_3801 ?auto_3800 ) ) ( OBJ-AT ?auto_3798 ?auto_3800 ) ( IN-TRUCK ?auto_3805 ?auto_3804 ) ( TRUCK-AT ?auto_3804 ?auto_3803 ) ( IN-CITY ?auto_3803 ?auto_3802 ) ( not ( = ?auto_3797 ?auto_3803 ) ) ( not ( = ?auto_3801 ?auto_3803 ) ) ( not ( = ?auto_3800 ?auto_3803 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3805 ?auto_3799 ?auto_3797 )
      ( DELIVER-2PKG-VERIFY ?auto_3798 ?auto_3799 ?auto_3797 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3807 - OBJ
      ?auto_3808 - OBJ
      ?auto_3806 - LOCATION
    )
    :vars
    (
      ?auto_3811 - LOCATION
      ?auto_3812 - CITY
      ?auto_3810 - OBJ
      ?auto_3809 - LOCATION
      ?auto_3814 - TRUCK
      ?auto_3813 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3808 ?auto_3807 ) ) ( IN-CITY ?auto_3811 ?auto_3812 ) ( IN-CITY ?auto_3806 ?auto_3812 ) ( not ( = ?auto_3806 ?auto_3811 ) ) ( OBJ-AT ?auto_3807 ?auto_3811 ) ( not ( = ?auto_3810 ?auto_3808 ) ) ( not ( = ?auto_3807 ?auto_3810 ) ) ( IN-CITY ?auto_3809 ?auto_3812 ) ( not ( = ?auto_3806 ?auto_3809 ) ) ( not ( = ?auto_3811 ?auto_3809 ) ) ( OBJ-AT ?auto_3810 ?auto_3809 ) ( IN-TRUCK ?auto_3808 ?auto_3814 ) ( TRUCK-AT ?auto_3814 ?auto_3813 ) ( IN-CITY ?auto_3813 ?auto_3812 ) ( not ( = ?auto_3806 ?auto_3813 ) ) ( not ( = ?auto_3811 ?auto_3813 ) ) ( not ( = ?auto_3809 ?auto_3813 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3808 ?auto_3807 ?auto_3806 )
      ( DELIVER-2PKG-VERIFY ?auto_3807 ?auto_3808 ?auto_3806 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3816 - OBJ
      ?auto_3817 - OBJ
      ?auto_3815 - LOCATION
    )
    :vars
    (
      ?auto_3823 - OBJ
      ?auto_3819 - LOCATION
      ?auto_3820 - CITY
      ?auto_3818 - LOCATION
      ?auto_3822 - TRUCK
      ?auto_3821 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3817 ?auto_3816 ) ) ( not ( = ?auto_3816 ?auto_3823 ) ) ( IN-CITY ?auto_3819 ?auto_3820 ) ( IN-CITY ?auto_3815 ?auto_3820 ) ( not ( = ?auto_3815 ?auto_3819 ) ) ( OBJ-AT ?auto_3816 ?auto_3819 ) ( not ( = ?auto_3817 ?auto_3823 ) ) ( IN-CITY ?auto_3818 ?auto_3820 ) ( not ( = ?auto_3815 ?auto_3818 ) ) ( not ( = ?auto_3819 ?auto_3818 ) ) ( OBJ-AT ?auto_3817 ?auto_3818 ) ( IN-TRUCK ?auto_3823 ?auto_3822 ) ( TRUCK-AT ?auto_3822 ?auto_3821 ) ( IN-CITY ?auto_3821 ?auto_3820 ) ( not ( = ?auto_3815 ?auto_3821 ) ) ( not ( = ?auto_3819 ?auto_3821 ) ) ( not ( = ?auto_3818 ?auto_3821 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3823 ?auto_3816 ?auto_3815 )
      ( DELIVER-2PKG-VERIFY ?auto_3816 ?auto_3817 ?auto_3815 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3845 - OBJ
      ?auto_3846 - OBJ
      ?auto_3847 - OBJ
      ?auto_3844 - LOCATION
    )
    :vars
    (
      ?auto_3849 - LOCATION
      ?auto_3850 - CITY
      ?auto_3848 - LOCATION
      ?auto_3852 - TRUCK
      ?auto_3851 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3846 ?auto_3845 ) ) ( not ( = ?auto_3847 ?auto_3845 ) ) ( not ( = ?auto_3847 ?auto_3846 ) ) ( IN-CITY ?auto_3849 ?auto_3850 ) ( IN-CITY ?auto_3844 ?auto_3850 ) ( not ( = ?auto_3844 ?auto_3849 ) ) ( OBJ-AT ?auto_3847 ?auto_3849 ) ( IN-CITY ?auto_3848 ?auto_3850 ) ( not ( = ?auto_3844 ?auto_3848 ) ) ( not ( = ?auto_3849 ?auto_3848 ) ) ( OBJ-AT ?auto_3846 ?auto_3848 ) ( IN-TRUCK ?auto_3845 ?auto_3852 ) ( TRUCK-AT ?auto_3852 ?auto_3851 ) ( IN-CITY ?auto_3851 ?auto_3850 ) ( not ( = ?auto_3844 ?auto_3851 ) ) ( not ( = ?auto_3849 ?auto_3851 ) ) ( not ( = ?auto_3848 ?auto_3851 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3845 ?auto_3847 ?auto_3844 )
      ( DELIVER-3PKG-VERIFY ?auto_3845 ?auto_3846 ?auto_3847 ?auto_3844 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3864 - OBJ
      ?auto_3865 - OBJ
      ?auto_3866 - OBJ
      ?auto_3863 - LOCATION
    )
    :vars
    (
      ?auto_3868 - LOCATION
      ?auto_3869 - CITY
      ?auto_3867 - LOCATION
      ?auto_3871 - TRUCK
      ?auto_3870 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3865 ?auto_3864 ) ) ( not ( = ?auto_3866 ?auto_3864 ) ) ( not ( = ?auto_3866 ?auto_3865 ) ) ( IN-CITY ?auto_3868 ?auto_3869 ) ( IN-CITY ?auto_3863 ?auto_3869 ) ( not ( = ?auto_3863 ?auto_3868 ) ) ( OBJ-AT ?auto_3865 ?auto_3868 ) ( IN-CITY ?auto_3867 ?auto_3869 ) ( not ( = ?auto_3863 ?auto_3867 ) ) ( not ( = ?auto_3868 ?auto_3867 ) ) ( OBJ-AT ?auto_3866 ?auto_3867 ) ( IN-TRUCK ?auto_3864 ?auto_3871 ) ( TRUCK-AT ?auto_3871 ?auto_3870 ) ( IN-CITY ?auto_3870 ?auto_3869 ) ( not ( = ?auto_3863 ?auto_3870 ) ) ( not ( = ?auto_3868 ?auto_3870 ) ) ( not ( = ?auto_3867 ?auto_3870 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3864 ?auto_3865 ?auto_3863 )
      ( DELIVER-3PKG-VERIFY ?auto_3864 ?auto_3865 ?auto_3866 ?auto_3863 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3883 - OBJ
      ?auto_3884 - OBJ
      ?auto_3885 - OBJ
      ?auto_3882 - LOCATION
    )
    :vars
    (
      ?auto_3887 - LOCATION
      ?auto_3888 - CITY
      ?auto_3886 - LOCATION
      ?auto_3890 - TRUCK
      ?auto_3889 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3884 ?auto_3883 ) ) ( not ( = ?auto_3885 ?auto_3883 ) ) ( not ( = ?auto_3885 ?auto_3884 ) ) ( IN-CITY ?auto_3887 ?auto_3888 ) ( IN-CITY ?auto_3882 ?auto_3888 ) ( not ( = ?auto_3882 ?auto_3887 ) ) ( OBJ-AT ?auto_3885 ?auto_3887 ) ( IN-CITY ?auto_3886 ?auto_3888 ) ( not ( = ?auto_3882 ?auto_3886 ) ) ( not ( = ?auto_3887 ?auto_3886 ) ) ( OBJ-AT ?auto_3883 ?auto_3886 ) ( IN-TRUCK ?auto_3884 ?auto_3890 ) ( TRUCK-AT ?auto_3890 ?auto_3889 ) ( IN-CITY ?auto_3889 ?auto_3888 ) ( not ( = ?auto_3882 ?auto_3889 ) ) ( not ( = ?auto_3887 ?auto_3889 ) ) ( not ( = ?auto_3886 ?auto_3889 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3884 ?auto_3885 ?auto_3882 )
      ( DELIVER-3PKG-VERIFY ?auto_3883 ?auto_3884 ?auto_3885 ?auto_3882 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3902 - OBJ
      ?auto_3903 - OBJ
      ?auto_3904 - OBJ
      ?auto_3901 - LOCATION
    )
    :vars
    (
      ?auto_3906 - LOCATION
      ?auto_3907 - CITY
      ?auto_3905 - LOCATION
      ?auto_3909 - TRUCK
      ?auto_3908 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3903 ?auto_3902 ) ) ( not ( = ?auto_3904 ?auto_3902 ) ) ( not ( = ?auto_3904 ?auto_3903 ) ) ( IN-CITY ?auto_3906 ?auto_3907 ) ( IN-CITY ?auto_3901 ?auto_3907 ) ( not ( = ?auto_3901 ?auto_3906 ) ) ( OBJ-AT ?auto_3903 ?auto_3906 ) ( IN-CITY ?auto_3905 ?auto_3907 ) ( not ( = ?auto_3901 ?auto_3905 ) ) ( not ( = ?auto_3906 ?auto_3905 ) ) ( OBJ-AT ?auto_3902 ?auto_3905 ) ( IN-TRUCK ?auto_3904 ?auto_3909 ) ( TRUCK-AT ?auto_3909 ?auto_3908 ) ( IN-CITY ?auto_3908 ?auto_3907 ) ( not ( = ?auto_3901 ?auto_3908 ) ) ( not ( = ?auto_3906 ?auto_3908 ) ) ( not ( = ?auto_3905 ?auto_3908 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3904 ?auto_3903 ?auto_3901 )
      ( DELIVER-3PKG-VERIFY ?auto_3902 ?auto_3903 ?auto_3904 ?auto_3901 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3941 - OBJ
      ?auto_3942 - OBJ
      ?auto_3943 - OBJ
      ?auto_3940 - LOCATION
    )
    :vars
    (
      ?auto_3945 - LOCATION
      ?auto_3946 - CITY
      ?auto_3944 - LOCATION
      ?auto_3948 - TRUCK
      ?auto_3947 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3942 ?auto_3941 ) ) ( not ( = ?auto_3943 ?auto_3941 ) ) ( not ( = ?auto_3943 ?auto_3942 ) ) ( IN-CITY ?auto_3945 ?auto_3946 ) ( IN-CITY ?auto_3940 ?auto_3946 ) ( not ( = ?auto_3940 ?auto_3945 ) ) ( OBJ-AT ?auto_3941 ?auto_3945 ) ( IN-CITY ?auto_3944 ?auto_3946 ) ( not ( = ?auto_3940 ?auto_3944 ) ) ( not ( = ?auto_3945 ?auto_3944 ) ) ( OBJ-AT ?auto_3943 ?auto_3944 ) ( IN-TRUCK ?auto_3942 ?auto_3948 ) ( TRUCK-AT ?auto_3948 ?auto_3947 ) ( IN-CITY ?auto_3947 ?auto_3946 ) ( not ( = ?auto_3940 ?auto_3947 ) ) ( not ( = ?auto_3945 ?auto_3947 ) ) ( not ( = ?auto_3944 ?auto_3947 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3942 ?auto_3941 ?auto_3940 )
      ( DELIVER-3PKG-VERIFY ?auto_3941 ?auto_3942 ?auto_3943 ?auto_3940 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3960 - OBJ
      ?auto_3961 - OBJ
      ?auto_3962 - OBJ
      ?auto_3959 - LOCATION
    )
    :vars
    (
      ?auto_3964 - LOCATION
      ?auto_3965 - CITY
      ?auto_3963 - LOCATION
      ?auto_3967 - TRUCK
      ?auto_3966 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3961 ?auto_3960 ) ) ( not ( = ?auto_3962 ?auto_3960 ) ) ( not ( = ?auto_3962 ?auto_3961 ) ) ( IN-CITY ?auto_3964 ?auto_3965 ) ( IN-CITY ?auto_3959 ?auto_3965 ) ( not ( = ?auto_3959 ?auto_3964 ) ) ( OBJ-AT ?auto_3960 ?auto_3964 ) ( IN-CITY ?auto_3963 ?auto_3965 ) ( not ( = ?auto_3959 ?auto_3963 ) ) ( not ( = ?auto_3964 ?auto_3963 ) ) ( OBJ-AT ?auto_3961 ?auto_3963 ) ( IN-TRUCK ?auto_3962 ?auto_3967 ) ( TRUCK-AT ?auto_3967 ?auto_3966 ) ( IN-CITY ?auto_3966 ?auto_3965 ) ( not ( = ?auto_3959 ?auto_3966 ) ) ( not ( = ?auto_3964 ?auto_3966 ) ) ( not ( = ?auto_3963 ?auto_3966 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3962 ?auto_3960 ?auto_3959 )
      ( DELIVER-3PKG-VERIFY ?auto_3960 ?auto_3961 ?auto_3962 ?auto_3959 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4020 - OBJ
      ?auto_4019 - LOCATION
    )
    :vars
    (
      ?auto_4027 - OBJ
      ?auto_4023 - LOCATION
      ?auto_4024 - CITY
      ?auto_4022 - OBJ
      ?auto_4021 - LOCATION
      ?auto_4026 - TRUCK
      ?auto_4025 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_4020 ?auto_4027 ) ) ( IN-CITY ?auto_4023 ?auto_4024 ) ( IN-CITY ?auto_4019 ?auto_4024 ) ( not ( = ?auto_4019 ?auto_4023 ) ) ( OBJ-AT ?auto_4020 ?auto_4023 ) ( not ( = ?auto_4022 ?auto_4027 ) ) ( not ( = ?auto_4020 ?auto_4022 ) ) ( IN-CITY ?auto_4021 ?auto_4024 ) ( not ( = ?auto_4019 ?auto_4021 ) ) ( not ( = ?auto_4023 ?auto_4021 ) ) ( OBJ-AT ?auto_4022 ?auto_4021 ) ( TRUCK-AT ?auto_4026 ?auto_4025 ) ( IN-CITY ?auto_4025 ?auto_4024 ) ( not ( = ?auto_4019 ?auto_4025 ) ) ( not ( = ?auto_4023 ?auto_4025 ) ) ( not ( = ?auto_4021 ?auto_4025 ) ) ( OBJ-AT ?auto_4027 ?auto_4025 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4027 ?auto_4026 ?auto_4025 )
      ( DELIVER-2PKG ?auto_4027 ?auto_4020 ?auto_4019 )
      ( DELIVER-1PKG-VERIFY ?auto_4020 ?auto_4019 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4029 - OBJ
      ?auto_4030 - OBJ
      ?auto_4028 - LOCATION
    )
    :vars
    (
      ?auto_4035 - LOCATION
      ?auto_4033 - CITY
      ?auto_4034 - OBJ
      ?auto_4032 - LOCATION
      ?auto_4036 - TRUCK
      ?auto_4031 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_4030 ?auto_4029 ) ) ( IN-CITY ?auto_4035 ?auto_4033 ) ( IN-CITY ?auto_4028 ?auto_4033 ) ( not ( = ?auto_4028 ?auto_4035 ) ) ( OBJ-AT ?auto_4030 ?auto_4035 ) ( not ( = ?auto_4034 ?auto_4029 ) ) ( not ( = ?auto_4030 ?auto_4034 ) ) ( IN-CITY ?auto_4032 ?auto_4033 ) ( not ( = ?auto_4028 ?auto_4032 ) ) ( not ( = ?auto_4035 ?auto_4032 ) ) ( OBJ-AT ?auto_4034 ?auto_4032 ) ( TRUCK-AT ?auto_4036 ?auto_4031 ) ( IN-CITY ?auto_4031 ?auto_4033 ) ( not ( = ?auto_4028 ?auto_4031 ) ) ( not ( = ?auto_4035 ?auto_4031 ) ) ( not ( = ?auto_4032 ?auto_4031 ) ) ( OBJ-AT ?auto_4029 ?auto_4031 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4030 ?auto_4028 )
      ( DELIVER-2PKG-VERIFY ?auto_4029 ?auto_4030 ?auto_4028 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4038 - OBJ
      ?auto_4039 - OBJ
      ?auto_4037 - LOCATION
    )
    :vars
    (
      ?auto_4045 - OBJ
      ?auto_4042 - LOCATION
      ?auto_4041 - CITY
      ?auto_4040 - LOCATION
      ?auto_4044 - TRUCK
      ?auto_4043 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_4039 ?auto_4038 ) ) ( not ( = ?auto_4039 ?auto_4045 ) ) ( IN-CITY ?auto_4042 ?auto_4041 ) ( IN-CITY ?auto_4037 ?auto_4041 ) ( not ( = ?auto_4037 ?auto_4042 ) ) ( OBJ-AT ?auto_4039 ?auto_4042 ) ( not ( = ?auto_4038 ?auto_4045 ) ) ( IN-CITY ?auto_4040 ?auto_4041 ) ( not ( = ?auto_4037 ?auto_4040 ) ) ( not ( = ?auto_4042 ?auto_4040 ) ) ( OBJ-AT ?auto_4038 ?auto_4040 ) ( TRUCK-AT ?auto_4044 ?auto_4043 ) ( IN-CITY ?auto_4043 ?auto_4041 ) ( not ( = ?auto_4037 ?auto_4043 ) ) ( not ( = ?auto_4042 ?auto_4043 ) ) ( not ( = ?auto_4040 ?auto_4043 ) ) ( OBJ-AT ?auto_4045 ?auto_4043 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4045 ?auto_4039 ?auto_4037 )
      ( DELIVER-2PKG-VERIFY ?auto_4038 ?auto_4039 ?auto_4037 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4047 - OBJ
      ?auto_4048 - OBJ
      ?auto_4046 - LOCATION
    )
    :vars
    (
      ?auto_4051 - LOCATION
      ?auto_4050 - CITY
      ?auto_4054 - OBJ
      ?auto_4049 - LOCATION
      ?auto_4053 - TRUCK
      ?auto_4052 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_4048 ?auto_4047 ) ) ( IN-CITY ?auto_4051 ?auto_4050 ) ( IN-CITY ?auto_4046 ?auto_4050 ) ( not ( = ?auto_4046 ?auto_4051 ) ) ( OBJ-AT ?auto_4047 ?auto_4051 ) ( not ( = ?auto_4054 ?auto_4048 ) ) ( not ( = ?auto_4047 ?auto_4054 ) ) ( IN-CITY ?auto_4049 ?auto_4050 ) ( not ( = ?auto_4046 ?auto_4049 ) ) ( not ( = ?auto_4051 ?auto_4049 ) ) ( OBJ-AT ?auto_4054 ?auto_4049 ) ( TRUCK-AT ?auto_4053 ?auto_4052 ) ( IN-CITY ?auto_4052 ?auto_4050 ) ( not ( = ?auto_4046 ?auto_4052 ) ) ( not ( = ?auto_4051 ?auto_4052 ) ) ( not ( = ?auto_4049 ?auto_4052 ) ) ( OBJ-AT ?auto_4048 ?auto_4052 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4048 ?auto_4047 ?auto_4046 )
      ( DELIVER-2PKG-VERIFY ?auto_4047 ?auto_4048 ?auto_4046 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4056 - OBJ
      ?auto_4057 - OBJ
      ?auto_4055 - LOCATION
    )
    :vars
    (
      ?auto_4063 - OBJ
      ?auto_4060 - LOCATION
      ?auto_4059 - CITY
      ?auto_4058 - LOCATION
      ?auto_4062 - TRUCK
      ?auto_4061 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_4057 ?auto_4056 ) ) ( not ( = ?auto_4056 ?auto_4063 ) ) ( IN-CITY ?auto_4060 ?auto_4059 ) ( IN-CITY ?auto_4055 ?auto_4059 ) ( not ( = ?auto_4055 ?auto_4060 ) ) ( OBJ-AT ?auto_4056 ?auto_4060 ) ( not ( = ?auto_4057 ?auto_4063 ) ) ( IN-CITY ?auto_4058 ?auto_4059 ) ( not ( = ?auto_4055 ?auto_4058 ) ) ( not ( = ?auto_4060 ?auto_4058 ) ) ( OBJ-AT ?auto_4057 ?auto_4058 ) ( TRUCK-AT ?auto_4062 ?auto_4061 ) ( IN-CITY ?auto_4061 ?auto_4059 ) ( not ( = ?auto_4055 ?auto_4061 ) ) ( not ( = ?auto_4060 ?auto_4061 ) ) ( not ( = ?auto_4058 ?auto_4061 ) ) ( OBJ-AT ?auto_4063 ?auto_4061 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4063 ?auto_4056 ?auto_4055 )
      ( DELIVER-2PKG-VERIFY ?auto_4056 ?auto_4057 ?auto_4055 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4085 - OBJ
      ?auto_4086 - OBJ
      ?auto_4087 - OBJ
      ?auto_4084 - LOCATION
    )
    :vars
    (
      ?auto_4090 - LOCATION
      ?auto_4089 - CITY
      ?auto_4088 - LOCATION
      ?auto_4092 - TRUCK
      ?auto_4091 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_4086 ?auto_4085 ) ) ( not ( = ?auto_4087 ?auto_4085 ) ) ( not ( = ?auto_4087 ?auto_4086 ) ) ( IN-CITY ?auto_4090 ?auto_4089 ) ( IN-CITY ?auto_4084 ?auto_4089 ) ( not ( = ?auto_4084 ?auto_4090 ) ) ( OBJ-AT ?auto_4087 ?auto_4090 ) ( IN-CITY ?auto_4088 ?auto_4089 ) ( not ( = ?auto_4084 ?auto_4088 ) ) ( not ( = ?auto_4090 ?auto_4088 ) ) ( OBJ-AT ?auto_4086 ?auto_4088 ) ( TRUCK-AT ?auto_4092 ?auto_4091 ) ( IN-CITY ?auto_4091 ?auto_4089 ) ( not ( = ?auto_4084 ?auto_4091 ) ) ( not ( = ?auto_4090 ?auto_4091 ) ) ( not ( = ?auto_4088 ?auto_4091 ) ) ( OBJ-AT ?auto_4085 ?auto_4091 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4085 ?auto_4087 ?auto_4084 )
      ( DELIVER-3PKG-VERIFY ?auto_4085 ?auto_4086 ?auto_4087 ?auto_4084 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4104 - OBJ
      ?auto_4105 - OBJ
      ?auto_4106 - OBJ
      ?auto_4103 - LOCATION
    )
    :vars
    (
      ?auto_4109 - LOCATION
      ?auto_4108 - CITY
      ?auto_4107 - LOCATION
      ?auto_4111 - TRUCK
      ?auto_4110 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_4105 ?auto_4104 ) ) ( not ( = ?auto_4106 ?auto_4104 ) ) ( not ( = ?auto_4106 ?auto_4105 ) ) ( IN-CITY ?auto_4109 ?auto_4108 ) ( IN-CITY ?auto_4103 ?auto_4108 ) ( not ( = ?auto_4103 ?auto_4109 ) ) ( OBJ-AT ?auto_4105 ?auto_4109 ) ( IN-CITY ?auto_4107 ?auto_4108 ) ( not ( = ?auto_4103 ?auto_4107 ) ) ( not ( = ?auto_4109 ?auto_4107 ) ) ( OBJ-AT ?auto_4106 ?auto_4107 ) ( TRUCK-AT ?auto_4111 ?auto_4110 ) ( IN-CITY ?auto_4110 ?auto_4108 ) ( not ( = ?auto_4103 ?auto_4110 ) ) ( not ( = ?auto_4109 ?auto_4110 ) ) ( not ( = ?auto_4107 ?auto_4110 ) ) ( OBJ-AT ?auto_4104 ?auto_4110 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4104 ?auto_4105 ?auto_4103 )
      ( DELIVER-3PKG-VERIFY ?auto_4104 ?auto_4105 ?auto_4106 ?auto_4103 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4123 - OBJ
      ?auto_4124 - OBJ
      ?auto_4125 - OBJ
      ?auto_4122 - LOCATION
    )
    :vars
    (
      ?auto_4128 - LOCATION
      ?auto_4127 - CITY
      ?auto_4126 - LOCATION
      ?auto_4130 - TRUCK
      ?auto_4129 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_4124 ?auto_4123 ) ) ( not ( = ?auto_4125 ?auto_4123 ) ) ( not ( = ?auto_4125 ?auto_4124 ) ) ( IN-CITY ?auto_4128 ?auto_4127 ) ( IN-CITY ?auto_4122 ?auto_4127 ) ( not ( = ?auto_4122 ?auto_4128 ) ) ( OBJ-AT ?auto_4125 ?auto_4128 ) ( IN-CITY ?auto_4126 ?auto_4127 ) ( not ( = ?auto_4122 ?auto_4126 ) ) ( not ( = ?auto_4128 ?auto_4126 ) ) ( OBJ-AT ?auto_4123 ?auto_4126 ) ( TRUCK-AT ?auto_4130 ?auto_4129 ) ( IN-CITY ?auto_4129 ?auto_4127 ) ( not ( = ?auto_4122 ?auto_4129 ) ) ( not ( = ?auto_4128 ?auto_4129 ) ) ( not ( = ?auto_4126 ?auto_4129 ) ) ( OBJ-AT ?auto_4124 ?auto_4129 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4124 ?auto_4125 ?auto_4122 )
      ( DELIVER-3PKG-VERIFY ?auto_4123 ?auto_4124 ?auto_4125 ?auto_4122 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4142 - OBJ
      ?auto_4143 - OBJ
      ?auto_4144 - OBJ
      ?auto_4141 - LOCATION
    )
    :vars
    (
      ?auto_4147 - LOCATION
      ?auto_4146 - CITY
      ?auto_4145 - LOCATION
      ?auto_4149 - TRUCK
      ?auto_4148 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_4143 ?auto_4142 ) ) ( not ( = ?auto_4144 ?auto_4142 ) ) ( not ( = ?auto_4144 ?auto_4143 ) ) ( IN-CITY ?auto_4147 ?auto_4146 ) ( IN-CITY ?auto_4141 ?auto_4146 ) ( not ( = ?auto_4141 ?auto_4147 ) ) ( OBJ-AT ?auto_4143 ?auto_4147 ) ( IN-CITY ?auto_4145 ?auto_4146 ) ( not ( = ?auto_4141 ?auto_4145 ) ) ( not ( = ?auto_4147 ?auto_4145 ) ) ( OBJ-AT ?auto_4142 ?auto_4145 ) ( TRUCK-AT ?auto_4149 ?auto_4148 ) ( IN-CITY ?auto_4148 ?auto_4146 ) ( not ( = ?auto_4141 ?auto_4148 ) ) ( not ( = ?auto_4147 ?auto_4148 ) ) ( not ( = ?auto_4145 ?auto_4148 ) ) ( OBJ-AT ?auto_4144 ?auto_4148 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4144 ?auto_4143 ?auto_4141 )
      ( DELIVER-3PKG-VERIFY ?auto_4142 ?auto_4143 ?auto_4144 ?auto_4141 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4181 - OBJ
      ?auto_4182 - OBJ
      ?auto_4183 - OBJ
      ?auto_4180 - LOCATION
    )
    :vars
    (
      ?auto_4186 - LOCATION
      ?auto_4185 - CITY
      ?auto_4184 - LOCATION
      ?auto_4188 - TRUCK
      ?auto_4187 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_4182 ?auto_4181 ) ) ( not ( = ?auto_4183 ?auto_4181 ) ) ( not ( = ?auto_4183 ?auto_4182 ) ) ( IN-CITY ?auto_4186 ?auto_4185 ) ( IN-CITY ?auto_4180 ?auto_4185 ) ( not ( = ?auto_4180 ?auto_4186 ) ) ( OBJ-AT ?auto_4181 ?auto_4186 ) ( IN-CITY ?auto_4184 ?auto_4185 ) ( not ( = ?auto_4180 ?auto_4184 ) ) ( not ( = ?auto_4186 ?auto_4184 ) ) ( OBJ-AT ?auto_4183 ?auto_4184 ) ( TRUCK-AT ?auto_4188 ?auto_4187 ) ( IN-CITY ?auto_4187 ?auto_4185 ) ( not ( = ?auto_4180 ?auto_4187 ) ) ( not ( = ?auto_4186 ?auto_4187 ) ) ( not ( = ?auto_4184 ?auto_4187 ) ) ( OBJ-AT ?auto_4182 ?auto_4187 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4182 ?auto_4181 ?auto_4180 )
      ( DELIVER-3PKG-VERIFY ?auto_4181 ?auto_4182 ?auto_4183 ?auto_4180 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4200 - OBJ
      ?auto_4201 - OBJ
      ?auto_4202 - OBJ
      ?auto_4199 - LOCATION
    )
    :vars
    (
      ?auto_4205 - LOCATION
      ?auto_4204 - CITY
      ?auto_4203 - LOCATION
      ?auto_4207 - TRUCK
      ?auto_4206 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_4201 ?auto_4200 ) ) ( not ( = ?auto_4202 ?auto_4200 ) ) ( not ( = ?auto_4202 ?auto_4201 ) ) ( IN-CITY ?auto_4205 ?auto_4204 ) ( IN-CITY ?auto_4199 ?auto_4204 ) ( not ( = ?auto_4199 ?auto_4205 ) ) ( OBJ-AT ?auto_4200 ?auto_4205 ) ( IN-CITY ?auto_4203 ?auto_4204 ) ( not ( = ?auto_4199 ?auto_4203 ) ) ( not ( = ?auto_4205 ?auto_4203 ) ) ( OBJ-AT ?auto_4201 ?auto_4203 ) ( TRUCK-AT ?auto_4207 ?auto_4206 ) ( IN-CITY ?auto_4206 ?auto_4204 ) ( not ( = ?auto_4199 ?auto_4206 ) ) ( not ( = ?auto_4205 ?auto_4206 ) ) ( not ( = ?auto_4203 ?auto_4206 ) ) ( OBJ-AT ?auto_4202 ?auto_4206 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4202 ?auto_4200 ?auto_4199 )
      ( DELIVER-3PKG-VERIFY ?auto_4200 ?auto_4201 ?auto_4202 ?auto_4199 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4260 - OBJ
      ?auto_4259 - LOCATION
    )
    :vars
    (
      ?auto_4267 - OBJ
      ?auto_4263 - LOCATION
      ?auto_4262 - CITY
      ?auto_4266 - OBJ
      ?auto_4261 - LOCATION
      ?auto_4264 - LOCATION
      ?auto_4265 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4260 ?auto_4267 ) ) ( IN-CITY ?auto_4263 ?auto_4262 ) ( IN-CITY ?auto_4259 ?auto_4262 ) ( not ( = ?auto_4259 ?auto_4263 ) ) ( OBJ-AT ?auto_4260 ?auto_4263 ) ( not ( = ?auto_4266 ?auto_4267 ) ) ( not ( = ?auto_4260 ?auto_4266 ) ) ( IN-CITY ?auto_4261 ?auto_4262 ) ( not ( = ?auto_4259 ?auto_4261 ) ) ( not ( = ?auto_4263 ?auto_4261 ) ) ( OBJ-AT ?auto_4266 ?auto_4261 ) ( IN-CITY ?auto_4264 ?auto_4262 ) ( not ( = ?auto_4259 ?auto_4264 ) ) ( not ( = ?auto_4263 ?auto_4264 ) ) ( not ( = ?auto_4261 ?auto_4264 ) ) ( OBJ-AT ?auto_4267 ?auto_4264 ) ( TRUCK-AT ?auto_4265 ?auto_4259 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4265 ?auto_4259 ?auto_4264 ?auto_4262 )
      ( DELIVER-2PKG ?auto_4267 ?auto_4260 ?auto_4259 )
      ( DELIVER-1PKG-VERIFY ?auto_4260 ?auto_4259 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4269 - OBJ
      ?auto_4270 - OBJ
      ?auto_4268 - LOCATION
    )
    :vars
    (
      ?auto_4271 - LOCATION
      ?auto_4272 - CITY
      ?auto_4276 - OBJ
      ?auto_4274 - LOCATION
      ?auto_4275 - LOCATION
      ?auto_4273 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4270 ?auto_4269 ) ) ( IN-CITY ?auto_4271 ?auto_4272 ) ( IN-CITY ?auto_4268 ?auto_4272 ) ( not ( = ?auto_4268 ?auto_4271 ) ) ( OBJ-AT ?auto_4270 ?auto_4271 ) ( not ( = ?auto_4276 ?auto_4269 ) ) ( not ( = ?auto_4270 ?auto_4276 ) ) ( IN-CITY ?auto_4274 ?auto_4272 ) ( not ( = ?auto_4268 ?auto_4274 ) ) ( not ( = ?auto_4271 ?auto_4274 ) ) ( OBJ-AT ?auto_4276 ?auto_4274 ) ( IN-CITY ?auto_4275 ?auto_4272 ) ( not ( = ?auto_4268 ?auto_4275 ) ) ( not ( = ?auto_4271 ?auto_4275 ) ) ( not ( = ?auto_4274 ?auto_4275 ) ) ( OBJ-AT ?auto_4269 ?auto_4275 ) ( TRUCK-AT ?auto_4273 ?auto_4268 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4270 ?auto_4268 )
      ( DELIVER-2PKG-VERIFY ?auto_4269 ?auto_4270 ?auto_4268 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4278 - OBJ
      ?auto_4279 - OBJ
      ?auto_4277 - LOCATION
    )
    :vars
    (
      ?auto_4285 - OBJ
      ?auto_4280 - LOCATION
      ?auto_4283 - CITY
      ?auto_4281 - LOCATION
      ?auto_4282 - LOCATION
      ?auto_4284 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4279 ?auto_4278 ) ) ( not ( = ?auto_4279 ?auto_4285 ) ) ( IN-CITY ?auto_4280 ?auto_4283 ) ( IN-CITY ?auto_4277 ?auto_4283 ) ( not ( = ?auto_4277 ?auto_4280 ) ) ( OBJ-AT ?auto_4279 ?auto_4280 ) ( not ( = ?auto_4278 ?auto_4285 ) ) ( IN-CITY ?auto_4281 ?auto_4283 ) ( not ( = ?auto_4277 ?auto_4281 ) ) ( not ( = ?auto_4280 ?auto_4281 ) ) ( OBJ-AT ?auto_4278 ?auto_4281 ) ( IN-CITY ?auto_4282 ?auto_4283 ) ( not ( = ?auto_4277 ?auto_4282 ) ) ( not ( = ?auto_4280 ?auto_4282 ) ) ( not ( = ?auto_4281 ?auto_4282 ) ) ( OBJ-AT ?auto_4285 ?auto_4282 ) ( TRUCK-AT ?auto_4284 ?auto_4277 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4285 ?auto_4279 ?auto_4277 )
      ( DELIVER-2PKG-VERIFY ?auto_4278 ?auto_4279 ?auto_4277 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4287 - OBJ
      ?auto_4288 - OBJ
      ?auto_4286 - LOCATION
    )
    :vars
    (
      ?auto_4289 - LOCATION
      ?auto_4293 - CITY
      ?auto_4292 - OBJ
      ?auto_4290 - LOCATION
      ?auto_4291 - LOCATION
      ?auto_4294 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4288 ?auto_4287 ) ) ( IN-CITY ?auto_4289 ?auto_4293 ) ( IN-CITY ?auto_4286 ?auto_4293 ) ( not ( = ?auto_4286 ?auto_4289 ) ) ( OBJ-AT ?auto_4287 ?auto_4289 ) ( not ( = ?auto_4292 ?auto_4288 ) ) ( not ( = ?auto_4287 ?auto_4292 ) ) ( IN-CITY ?auto_4290 ?auto_4293 ) ( not ( = ?auto_4286 ?auto_4290 ) ) ( not ( = ?auto_4289 ?auto_4290 ) ) ( OBJ-AT ?auto_4292 ?auto_4290 ) ( IN-CITY ?auto_4291 ?auto_4293 ) ( not ( = ?auto_4286 ?auto_4291 ) ) ( not ( = ?auto_4289 ?auto_4291 ) ) ( not ( = ?auto_4290 ?auto_4291 ) ) ( OBJ-AT ?auto_4288 ?auto_4291 ) ( TRUCK-AT ?auto_4294 ?auto_4286 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4288 ?auto_4287 ?auto_4286 )
      ( DELIVER-2PKG-VERIFY ?auto_4287 ?auto_4288 ?auto_4286 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4296 - OBJ
      ?auto_4297 - OBJ
      ?auto_4295 - LOCATION
    )
    :vars
    (
      ?auto_4303 - OBJ
      ?auto_4298 - LOCATION
      ?auto_4301 - CITY
      ?auto_4299 - LOCATION
      ?auto_4300 - LOCATION
      ?auto_4302 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4297 ?auto_4296 ) ) ( not ( = ?auto_4296 ?auto_4303 ) ) ( IN-CITY ?auto_4298 ?auto_4301 ) ( IN-CITY ?auto_4295 ?auto_4301 ) ( not ( = ?auto_4295 ?auto_4298 ) ) ( OBJ-AT ?auto_4296 ?auto_4298 ) ( not ( = ?auto_4297 ?auto_4303 ) ) ( IN-CITY ?auto_4299 ?auto_4301 ) ( not ( = ?auto_4295 ?auto_4299 ) ) ( not ( = ?auto_4298 ?auto_4299 ) ) ( OBJ-AT ?auto_4297 ?auto_4299 ) ( IN-CITY ?auto_4300 ?auto_4301 ) ( not ( = ?auto_4295 ?auto_4300 ) ) ( not ( = ?auto_4298 ?auto_4300 ) ) ( not ( = ?auto_4299 ?auto_4300 ) ) ( OBJ-AT ?auto_4303 ?auto_4300 ) ( TRUCK-AT ?auto_4302 ?auto_4295 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4303 ?auto_4296 ?auto_4295 )
      ( DELIVER-2PKG-VERIFY ?auto_4296 ?auto_4297 ?auto_4295 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4325 - OBJ
      ?auto_4326 - OBJ
      ?auto_4327 - OBJ
      ?auto_4324 - LOCATION
    )
    :vars
    (
      ?auto_4328 - LOCATION
      ?auto_4331 - CITY
      ?auto_4329 - LOCATION
      ?auto_4330 - LOCATION
      ?auto_4332 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4326 ?auto_4325 ) ) ( not ( = ?auto_4327 ?auto_4325 ) ) ( not ( = ?auto_4327 ?auto_4326 ) ) ( IN-CITY ?auto_4328 ?auto_4331 ) ( IN-CITY ?auto_4324 ?auto_4331 ) ( not ( = ?auto_4324 ?auto_4328 ) ) ( OBJ-AT ?auto_4327 ?auto_4328 ) ( IN-CITY ?auto_4329 ?auto_4331 ) ( not ( = ?auto_4324 ?auto_4329 ) ) ( not ( = ?auto_4328 ?auto_4329 ) ) ( OBJ-AT ?auto_4326 ?auto_4329 ) ( IN-CITY ?auto_4330 ?auto_4331 ) ( not ( = ?auto_4324 ?auto_4330 ) ) ( not ( = ?auto_4328 ?auto_4330 ) ) ( not ( = ?auto_4329 ?auto_4330 ) ) ( OBJ-AT ?auto_4325 ?auto_4330 ) ( TRUCK-AT ?auto_4332 ?auto_4324 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4325 ?auto_4327 ?auto_4324 )
      ( DELIVER-3PKG-VERIFY ?auto_4325 ?auto_4326 ?auto_4327 ?auto_4324 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4344 - OBJ
      ?auto_4345 - OBJ
      ?auto_4346 - OBJ
      ?auto_4343 - LOCATION
    )
    :vars
    (
      ?auto_4347 - LOCATION
      ?auto_4350 - CITY
      ?auto_4348 - LOCATION
      ?auto_4349 - LOCATION
      ?auto_4351 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4345 ?auto_4344 ) ) ( not ( = ?auto_4346 ?auto_4344 ) ) ( not ( = ?auto_4346 ?auto_4345 ) ) ( IN-CITY ?auto_4347 ?auto_4350 ) ( IN-CITY ?auto_4343 ?auto_4350 ) ( not ( = ?auto_4343 ?auto_4347 ) ) ( OBJ-AT ?auto_4345 ?auto_4347 ) ( IN-CITY ?auto_4348 ?auto_4350 ) ( not ( = ?auto_4343 ?auto_4348 ) ) ( not ( = ?auto_4347 ?auto_4348 ) ) ( OBJ-AT ?auto_4346 ?auto_4348 ) ( IN-CITY ?auto_4349 ?auto_4350 ) ( not ( = ?auto_4343 ?auto_4349 ) ) ( not ( = ?auto_4347 ?auto_4349 ) ) ( not ( = ?auto_4348 ?auto_4349 ) ) ( OBJ-AT ?auto_4344 ?auto_4349 ) ( TRUCK-AT ?auto_4351 ?auto_4343 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4344 ?auto_4345 ?auto_4343 )
      ( DELIVER-3PKG-VERIFY ?auto_4344 ?auto_4345 ?auto_4346 ?auto_4343 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4363 - OBJ
      ?auto_4364 - OBJ
      ?auto_4365 - OBJ
      ?auto_4362 - LOCATION
    )
    :vars
    (
      ?auto_4366 - LOCATION
      ?auto_4369 - CITY
      ?auto_4367 - LOCATION
      ?auto_4368 - LOCATION
      ?auto_4370 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4364 ?auto_4363 ) ) ( not ( = ?auto_4365 ?auto_4363 ) ) ( not ( = ?auto_4365 ?auto_4364 ) ) ( IN-CITY ?auto_4366 ?auto_4369 ) ( IN-CITY ?auto_4362 ?auto_4369 ) ( not ( = ?auto_4362 ?auto_4366 ) ) ( OBJ-AT ?auto_4365 ?auto_4366 ) ( IN-CITY ?auto_4367 ?auto_4369 ) ( not ( = ?auto_4362 ?auto_4367 ) ) ( not ( = ?auto_4366 ?auto_4367 ) ) ( OBJ-AT ?auto_4363 ?auto_4367 ) ( IN-CITY ?auto_4368 ?auto_4369 ) ( not ( = ?auto_4362 ?auto_4368 ) ) ( not ( = ?auto_4366 ?auto_4368 ) ) ( not ( = ?auto_4367 ?auto_4368 ) ) ( OBJ-AT ?auto_4364 ?auto_4368 ) ( TRUCK-AT ?auto_4370 ?auto_4362 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4364 ?auto_4365 ?auto_4362 )
      ( DELIVER-3PKG-VERIFY ?auto_4363 ?auto_4364 ?auto_4365 ?auto_4362 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4382 - OBJ
      ?auto_4383 - OBJ
      ?auto_4384 - OBJ
      ?auto_4381 - LOCATION
    )
    :vars
    (
      ?auto_4385 - LOCATION
      ?auto_4388 - CITY
      ?auto_4386 - LOCATION
      ?auto_4387 - LOCATION
      ?auto_4389 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4383 ?auto_4382 ) ) ( not ( = ?auto_4384 ?auto_4382 ) ) ( not ( = ?auto_4384 ?auto_4383 ) ) ( IN-CITY ?auto_4385 ?auto_4388 ) ( IN-CITY ?auto_4381 ?auto_4388 ) ( not ( = ?auto_4381 ?auto_4385 ) ) ( OBJ-AT ?auto_4383 ?auto_4385 ) ( IN-CITY ?auto_4386 ?auto_4388 ) ( not ( = ?auto_4381 ?auto_4386 ) ) ( not ( = ?auto_4385 ?auto_4386 ) ) ( OBJ-AT ?auto_4382 ?auto_4386 ) ( IN-CITY ?auto_4387 ?auto_4388 ) ( not ( = ?auto_4381 ?auto_4387 ) ) ( not ( = ?auto_4385 ?auto_4387 ) ) ( not ( = ?auto_4386 ?auto_4387 ) ) ( OBJ-AT ?auto_4384 ?auto_4387 ) ( TRUCK-AT ?auto_4389 ?auto_4381 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4384 ?auto_4383 ?auto_4381 )
      ( DELIVER-3PKG-VERIFY ?auto_4382 ?auto_4383 ?auto_4384 ?auto_4381 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4421 - OBJ
      ?auto_4422 - OBJ
      ?auto_4423 - OBJ
      ?auto_4420 - LOCATION
    )
    :vars
    (
      ?auto_4424 - LOCATION
      ?auto_4427 - CITY
      ?auto_4425 - LOCATION
      ?auto_4426 - LOCATION
      ?auto_4428 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4422 ?auto_4421 ) ) ( not ( = ?auto_4423 ?auto_4421 ) ) ( not ( = ?auto_4423 ?auto_4422 ) ) ( IN-CITY ?auto_4424 ?auto_4427 ) ( IN-CITY ?auto_4420 ?auto_4427 ) ( not ( = ?auto_4420 ?auto_4424 ) ) ( OBJ-AT ?auto_4421 ?auto_4424 ) ( IN-CITY ?auto_4425 ?auto_4427 ) ( not ( = ?auto_4420 ?auto_4425 ) ) ( not ( = ?auto_4424 ?auto_4425 ) ) ( OBJ-AT ?auto_4423 ?auto_4425 ) ( IN-CITY ?auto_4426 ?auto_4427 ) ( not ( = ?auto_4420 ?auto_4426 ) ) ( not ( = ?auto_4424 ?auto_4426 ) ) ( not ( = ?auto_4425 ?auto_4426 ) ) ( OBJ-AT ?auto_4422 ?auto_4426 ) ( TRUCK-AT ?auto_4428 ?auto_4420 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4422 ?auto_4421 ?auto_4420 )
      ( DELIVER-3PKG-VERIFY ?auto_4421 ?auto_4422 ?auto_4423 ?auto_4420 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4440 - OBJ
      ?auto_4441 - OBJ
      ?auto_4442 - OBJ
      ?auto_4439 - LOCATION
    )
    :vars
    (
      ?auto_4443 - LOCATION
      ?auto_4446 - CITY
      ?auto_4444 - LOCATION
      ?auto_4445 - LOCATION
      ?auto_4447 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_4441 ?auto_4440 ) ) ( not ( = ?auto_4442 ?auto_4440 ) ) ( not ( = ?auto_4442 ?auto_4441 ) ) ( IN-CITY ?auto_4443 ?auto_4446 ) ( IN-CITY ?auto_4439 ?auto_4446 ) ( not ( = ?auto_4439 ?auto_4443 ) ) ( OBJ-AT ?auto_4440 ?auto_4443 ) ( IN-CITY ?auto_4444 ?auto_4446 ) ( not ( = ?auto_4439 ?auto_4444 ) ) ( not ( = ?auto_4443 ?auto_4444 ) ) ( OBJ-AT ?auto_4441 ?auto_4444 ) ( IN-CITY ?auto_4445 ?auto_4446 ) ( not ( = ?auto_4439 ?auto_4445 ) ) ( not ( = ?auto_4443 ?auto_4445 ) ) ( not ( = ?auto_4444 ?auto_4445 ) ) ( OBJ-AT ?auto_4442 ?auto_4445 ) ( TRUCK-AT ?auto_4447 ?auto_4439 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4442 ?auto_4440 ?auto_4439 )
      ( DELIVER-3PKG-VERIFY ?auto_4440 ?auto_4441 ?auto_4442 ?auto_4439 ) )
  )

)

