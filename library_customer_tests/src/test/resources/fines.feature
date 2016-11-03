Feature: Fines
   As a librarian, 
   I want to assess fines for books returned late,
   So that we can encourage maximum book availability.
   
Background:
   Given a clean library system
   And a branch named "Rockrimmon" with the following holdings: Catch-22, The Trial

Scenario: Due date for book is 21 days after checkout
   When a patron checks out "Catch-22" on 2017/3/1
   Then the due date for "Catch-22" is 2017/3/22
   
Scenario: Book incurs no fine when returned on due date
   Given a patron checks out "Catch-22" on 2017/4/1
   When "Catch-22" is returned on 2017/4/22
   Then the patron's fine balance is 0
   
Scenario: Book incurs fine when returned after due date
   Given a patron checks out "The Trial" on 2017/5/1
   When "The Trial" is returned on 2017/5/23
   Then the patron's fine balance is 10

Scenario: Late book fine balance is multiple of days
   Given a patron checks out "Catch-22" on 2017/5/1
   When "Catch-22" is returned on 2017/5/25
   Then the patron's fine balance is 30