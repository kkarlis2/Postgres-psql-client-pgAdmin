Purpose:
This work consists of two parts. In the first part we will add triggers
to ensure that specific properties of the base are preserved, while in the second
we will improve query execution time by adding indexes.
Prerequisites:
We assume that the base is in the state described in the 4th Task and there are
the aggregation queries you ran in this task.
Job Requirements:
Part A: Triggers
● Write a trigger function which when one is added/deleted
write to the Listing table, updates the host_listings_count field to
corresponding entry(s) of the Host table. Check that your function
it works correctly by adding/deleting a record in the Listing table and
seeing if the field(could have multiple records)
calculated_host_listings_count of the given host has been updated correctly.
● Think and implement your own trigger function for someone/someones
from the base tables.
Write the code for the triggers in a file named triggers.sql.
For your own trigger add a short description of what it does in a comment.

Part B: Indexes
● Suppose we have the following query:
SELECT "Host".host_id, COUNT(*) FROM "Listing", "Host" WHERE
"Host".host_id="Listing".host_id GROUP BY "Host".host_id;
Use the EXPLAIN ANALYZE command to print the shot and time
execution of the query. Then add an appropriate index that will
speeds up the execution time of the above query and rerun the command
EXPLAIN ANALYZE to see the new runtime.
● Suppose we have the following query:
SELECT id, price FROM "Listing", "Price" WHERE guests_included > 5
AND price > 40;
Use the EXPLAIN ANALYZE command to print the shot and time
execution of the query. Then experiment with adding indexes to
one or more fields and check if the execution time improves. Addition
index on the price field would help? Give reasons.
● For each of the aggregate queries you ran in Task 5,
add an appropriate index that will speed up its execution. Run her
EXPLAIN ANALYZE command as in previous queries to determine
if the execution time is actually reduced. Explain why you chose this one
index. If for a certain question you cannot find an index that has it
speeds up, write down which indexes you tried adding and explain why
do you think that the particular query cannot be speeded up by the addition
indexes (explanation may be high level / intuitive, it is not
necessary to analyze the exact steps of the execution plan).
Put the resulting execution plans for each query from the EXPLAIN command
ANALYZE before and after adding indexes to a file named plans.txt. Before
from each shot write the EXPLAIN ANALYZE command from which it arose. End for
for each query you indexed write a summary comment of the form:
3
/* Query 1: w/out index: 110 ms; w/index: 80ms */
In the same comment add your justification for the acceleration or not
results from indexing.
In a file named query_indexes.sql put the commands you ran to create it
of indexes.
