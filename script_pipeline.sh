
#!/bin/bash

echo "******* script started *****"
echo "*****************"

# Track changes to the master branch
git checkout main

# Save the SHA-1 hash of the latest commit
LATEST_COMMIT=$(git rev-parse HEAD)

# Create a directory for the latest commit
mkdir -p data/$LATEST_COMMIT

# Copy all modified files from the latest commit to the new directory
for file in $(git diff-tree --no-commit-id --name-only -r $LATEST_COMMIT); do
    cp $file data/$LATEST_COMMIT
done
