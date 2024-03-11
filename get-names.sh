cat ~/biodiversity-llms/biodiversity-confidence/results/input/taxonomy-qa.tsv\
	| mlr --tsvlite filter '$kingdom == "animalia"'\
	| tr -cd '[:alpha:][:space:]'\
       	| mlr --tsvlite sort -f 'taxon'\
	| mlr --tsvlite uniq -f 'taxon'\
	| grep '\S'\
	| mlr --tsvlite put '$taxon = capitalize($taxon)'\
	| mlr --tsvlite rename 'taxon,scientificName'\
	> animalia.tsv

cat ~/biodiversity-llms/biodiversity-confidence/results/input/taxonomy-qa.tsv\
        | mlr --tsvlite filter '$kingdom == "plantae"'\
        | tr -cd '[:alpha:][:space:]'\
        | mlr --tsvlite sort -f 'taxon'\
        | mlr --tsvlite uniq -f 'taxon'\
        | grep '\S'\
	| mlr --tsvlite put '$taxon = capitalize($taxon)'\
	| mlr --tsvlite rename 'taxon,scientificName'\
        > plantae.tsv

cat animalia.tsv plantae.tsv > names.tsv
