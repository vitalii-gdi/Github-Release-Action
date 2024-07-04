#!/bin/sh

# Ensure the working directory is set if INPUT_WORKDIR is provided
if [ ! -z "${INPUT_WORKDIR}" ]; then
    cd "${INPUT_WORKDIR}"
fi

# Make sure all files are added to the release, including those ignored by git
# Ensure we include everything by adding all files manually
git add -f .

# Commit the files if needed (in a real-world scenario, this might not be necessary)
# git commit -m "Include all files for release"

# Create a new release with the specified title and timestamp as the tag
gh release create -t "${INPUT_TITLE}" "$(date +%Y%m%d%H%M%S)" --generate-notes
