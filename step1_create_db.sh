# for f in `ls *.sql | grep -v table`
# do
#     name=`echo ${f} | sed -r 's/.sql//'`
#     rm ${name}.db
#     cat tables.sql | sqlite3 ${name}.db
#     cat ${f} | sqlite3 ${name}.db
# done

dir=data/modules/cytobands

python cytotosql.py --file=ucsc_cytobands_hg19.txt --out=${dir}/hg19.sql

rm ${dir}/hg19.db
cat table.sql | sqlite3 ${dir}/hg19.db
cat ${dir}/hg19.sql | sqlite3 ${dir}/hg19.db


python cytotosql.py --file=ucsc_cytobands_grch38.txt --out=${dir}/grch38.sql

rm ${dir}/grch38.db
cat table.sql | sqlite3 ${dir}/grch38.db
cat ${dir}/grch38.sql | sqlite3 ${dir}/grch38.db


python cytotosql.py --file=ucsc_cytobands_mm10.txt --out=${dir}/mm10.sql

rm ${dir}/mm10.db
cat table.sql | sqlite3 ${dir}/mm10.db
cat ${dir}/mm10.sql | sqlite3 ${dir}/mm10.db

  