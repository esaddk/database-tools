#!/bin/bash

# Set your MongoDB connection details
MONGO_HOST="localhost"
MONGO_PORT="27017"
DATABASE_NAME="test_db"

# Specify the collection name and query
COLLECTION_NAME="users"
QUERY="{'order_date': {'$gt': '2023-10-31'}}"

# Escape single quotes for safe command execution
QUERY=$(echo $QUERY | sed -e "s/'/'\\\\''/g")

# Build the explain command
EXPLAIN_CMD="mongo $DATABASE_NAME --host $MONGO_HOST --port $MONGO_PORT --quiet --eval 'db.$COLLECTION_NAME.explain({\"find\": \"$COLLECTION_NAME\", \"filter\": $QUERY})'"

# Execute the command and capture output
EXPLAIN_OUTPUT=$($EXPLAIN_CMD)

# Check for COLLSCAN in the winning plan
if grep -q '"stage": "COLLSCAN"' <<< "$EXPLAIN_OUTPUT"; then
  echo "Warning: Query uses a COLLSCAN! Consider optimizing your indexes."
else
  echo "Good job! Query uses an index."
fi