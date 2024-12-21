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

 