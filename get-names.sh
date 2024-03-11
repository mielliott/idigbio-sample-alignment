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

mlr --tsvlite cat animalia.tsv plantae.tsv > names.tsv

head -n1 names.tsv > corrected-names.tsv
tail -n+2 names.tsv | sed -e 's/^/\t/' | nomer append globi-correct | cut -f5 >> corrected-names.tsv
