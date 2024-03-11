cat ~/biodiversity-llms/biodiversity-confidence/results/input/taxonomy-qa.tsv | mlr --tsvlite filter '$kingdom == "animalia"' --headerless-csv-output | cut -f3 | tr -cd '[:alpha:][:space:]' | sort -u > animalia.tsv
cat ~/biodiversity-llms/biodiversity-confidence/results/input/taxonomy-qa.tsv | mlr --tsvlite filter '$kingdom == "plantae"' --headerless-csv-output | cut -f3 | tr -cd '[:alpha:][:space:]' | sort -u > plantae.tsv

