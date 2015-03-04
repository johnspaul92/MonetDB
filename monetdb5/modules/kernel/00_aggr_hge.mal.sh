# The contents of this file are subject to the MonetDB Public License
# Version 1.1 (the "License"); you may not use this file except in
# compliance with the License. You may obtain a copy of the License at
# http://www.monetdb.org/Legal/MonetDBLicense
#
# Software distributed under the License is distributed on an "AS IS"
# basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
# License for the specific language governing rights and limitations
# under the License.
#
# The Original Code is the MonetDB Database System.
#
# The Initial Developer of the Original Code is CWI.
# Portions created by CWI are Copyright (C) 1997-July 2008 CWI.
# Copyright August 2008-2015 MonetDB B.V.
# All Rights Reserved.

sed '/^$/q' $0			# copy copyright from this file

cat <<EOF
# This file was generated by using the script ${0##*/}.

module aggr;

EOF

integer="bte sht int wrd lng hge"	# all integer types
numeric="$integer flt dbl"	# all numeric types
fixtypes="bit $numeric oid"
alltypes="$fixtypes str"

for tp1 in 1:bte 2:sht 4:int 8:wrd 8:lng; do
    for tp2 in 16:hge; do
	if [ ${tp1%:*} -le ${tp2%:*} -o ${tp1#*:} = ${tp2#*:} ]; then
	    cat <<EOF
command sum(b:bat[:oid,:${tp1#*:}], e:bat[:oid,:any_1]) :bat[:oid,:${tp2#*:}]
address AGGRsum2_${tp2#*:}
comment "Sum over grouped tail sum on ${tp1#*:}";

command sum(b:bat[:oid,:${tp1#*:}],g:bat[:oid,:oid],e:bat[:oid,:any_1])
		:bat[:oid,:${tp2#*:}]
address AGGRsum3_${tp2#*:}
comment "Grouped tail sum on ${tp1#*:}";

EOF
	    if [ ${tp2#*:} = dbl ]; then
		continue
	    fi
	    cat <<EOF
command subsum(b:bat[:oid,:${tp1#*:}],g:bat[:oid,:oid],e:bat[:oid,:any_1],skip_nils:bit,abort_on_error:bit) :bat[:oid,:${tp2#*:}]
address AGGRsubsum_${tp2#*:}
comment "Grouped sum aggregate";

command subsum(b:bat[:oid,:${tp1#*:}],g:bat[:oid,:oid],e:bat[:oid,:any_1],s:bat[:oid,:oid],skip_nils:bit,abort_on_error:bit) :bat[:oid,:${tp2#*:}]
address AGGRsubsumcand_${tp2#*:}
comment "Grouped sum aggregate with candidates list";

command prod(b:bat[:oid,:${tp1#*:}], e:bat[:oid,:any_1]) :bat[:oid,:${tp2#*:}]
address AGGRprod2_${tp2#*:}
comment "Product over grouped tail product on ${tp1#*:}";

command prod(b:bat[:oid,:${tp1#*:}],g:bat[:oid,:oid],e:bat[:oid,:any_1])
		:bat[:oid,:${tp2#*:}]
address AGGRprod3_${tp2#*:}
comment "Grouped tail product on ${tp1#*:}";

command subprod(b:bat[:oid,:${tp1#*:}],g:bat[:oid,:oid],e:bat[:oid,:any_1],skip_nils:bit,abort_on_error:bit) :bat[:oid,:${tp2#*:}]
address AGGRsubprod_${tp2#*:}
comment "Grouped product aggregate";

command subprod(b:bat[:oid,:${tp1#*:}],g:bat[:oid,:oid],e:bat[:oid,:any_1],s:bat[:oid,:oid],skip_nils:bit,abort_on_error:bit) :bat[:oid,:${tp2#*:}]
address AGGRsubprodcand_${tp2#*:}
comment "Grouped product aggregate with candidates list";

EOF
	fi
    done
done

for tp1 in 16:hge; do
    for tp2 in 8:dbl 1:bte 2:sht 4:int 4:wrd 8:lng 16:hge; do
	if [ ${tp1%:*} -le ${tp2%:*} -o ${tp1#*:} = ${tp2#*:} ]; then
	    cat <<EOF
command sum(b:bat[:oid,:${tp1#*:}], e:bat[:oid,:any_1]) :bat[:oid,:${tp2#*:}]
address AGGRsum2_${tp2#*:}
comment "Sum over grouped tail sum on ${tp1#*:}";

command sum(b:bat[:oid,:${tp1#*:}],g:bat[:oid,:oid],e:bat[:oid,:any_1])
		:bat[:oid,:${tp2#*:}]
address AGGRsum3_${tp2#*:}
comment "Grouped tail sum on ${tp1#*:}";

EOF
	    if [ ${tp2#*:} = dbl ]; then
		continue
	    fi
	    cat <<EOF
command subsum(b:bat[:oid,:${tp1#*:}],g:bat[:oid,:oid],e:bat[:oid,:any_1],skip_nils:bit,abort_on_error:bit) :bat[:oid,:${tp2#*:}]
address AGGRsubsum_${tp2#*:}
comment "Grouped sum aggregate";

command subsum(b:bat[:oid,:${tp1#*:}],g:bat[:oid,:oid],e:bat[:oid,:any_1],s:bat[:oid,:oid],skip_nils:bit,abort_on_error:bit) :bat[:oid,:${tp2#*:}]
address AGGRsubsumcand_${tp2#*:}
comment "Grouped sum aggregate with candidates list";

command prod(b:bat[:oid,:${tp1#*:}], e:bat[:oid,:any_1]) :bat[:oid,:${tp2#*:}]
address AGGRprod2_${tp2#*:}
comment "Product over grouped tail product on ${tp1#*:}";

command prod(b:bat[:oid,:${tp1#*:}],g:bat[:oid,:oid],e:bat[:oid,:any_1])
		:bat[:oid,:${tp2#*:}]
address AGGRprod3_${tp2#*:}
comment "Grouped tail product on ${tp1#*:}";

command subprod(b:bat[:oid,:${tp1#*:}],g:bat[:oid,:oid],e:bat[:oid,:any_1],skip_nils:bit,abort_on_error:bit) :bat[:oid,:${tp2#*:}]
address AGGRsubprod_${tp2#*:}
comment "Grouped product aggregate";

command subprod(b:bat[:oid,:${tp1#*:}],g:bat[:oid,:oid],e:bat[:oid,:any_1],s:bat[:oid,:oid],skip_nils:bit,abort_on_error:bit) :bat[:oid,:${tp2#*:}]
address AGGRsubprodcand_${tp2#*:}
comment "Grouped product aggregate with candidates list";

EOF
	fi
    done
done

# We may have to extend the signatures to all possible {void,oid} combos
for tp in hge; do
    cat <<EOF
command avg(b:bat[:oid,:${tp}], e:bat[:oid,:any_1]) :bat[:oid,:dbl]
address AGGRavg12_dbl
comment "Grouped tail average on ${tp}";

command avg(b:bat[:oid,:${tp}], g:bat[:oid,:oid], e:bat[:oid,:any_1]):bat[:oid,:dbl]
address AGGRavg13_dbl
comment "Grouped tail average on ${tp}";

command avg(b:bat[:oid,:${tp}], e:bat[:oid,:any_1]) (:bat[:oid,:dbl],:bat[:oid,:wrd])
address AGGRavg22_dbl
comment "Grouped tail average on ${tp}, also returns count";

command avg(b:bat[:oid,:${tp}], g:bat[:oid,:oid], e:bat[:oid,:any_1]) (:bat[:oid,:dbl],:bat[:oid,:wrd])
address AGGRavg23_dbl
comment "Grouped tail average on ${tp}, also returns count";

command subavg(b:bat[:oid,:${tp}],g:bat[:oid,:oid],e:bat[:oid,:any_1],skip_nils:bit,abort_on_error:bit) :bat[:oid,:dbl]
address AGGRsubavg1_dbl
comment "Grouped average aggregate";

command subavg(b:bat[:oid,:${tp}],g:bat[:oid,:oid],e:bat[:oid,:any_1],s:bat[:oid,:oid],skip_nils:bit,abort_on_error:bit) :bat[:oid,:dbl]
address AGGRsubavg1cand_dbl
comment "Grouped average aggregate with candidates list";

command subavg(b:bat[:oid,:${tp}],g:bat[:oid,:oid],e:bat[:oid,:any_1],skip_nils:bit,abort_on_error:bit) (:bat[:oid,:dbl],:bat[:oid,:wrd])
address AGGRsubavg2_dbl
comment "Grouped average aggregate, also returns count";

command subavg(b:bat[:oid,:${tp}],g:bat[:oid,:oid],e:bat[:oid,:any_1],s:bat[:oid,:oid],skip_nils:bit,abort_on_error:bit) (:bat[:oid,:dbl],:bat[:oid,:wrd])
address AGGRsubavg2cand_dbl
comment "Grouped average aggregate with candidates list, also returns count";

EOF
    for func in stdev:'standard deviation' variance:variance; do
	comm=${func#*:}
	func=${func%:*}
	cat <<EOF
command ${func}(b:bat[:oid,:${tp}], e:bat[:oid,:any_1]) :bat[:oid,:dbl]
address AGGR${func}2_dbl
comment "Grouped tail ${comm} (sample/non-biased) on ${tp}";

command ${func}(b:bat[:oid,:${tp}], g:bat[:oid,:oid], e:bat[:oid,:any_1]):bat[:oid,:dbl]
address AGGR${func}3_dbl
comment "Grouped tail ${comm} (sample/non-biased) on ${tp}";

command sub${func}(b:bat[:oid,:${tp}],g:bat[:oid,:oid],e:bat[:oid,:any_1],skip_nils:bit,abort_on_error:bit) :bat[:oid,:dbl]
address AGGRsub${func}_dbl
comment "Grouped ${comm} (sample/non-biased) aggregate";

command sub${func}(b:bat[:oid,:${tp}],g:bat[:oid,:oid],e:bat[:oid,:any_1],s:bat[:oid,:oid],skip_nils:bit,abort_on_error:bit) :bat[:oid,:dbl]
address AGGRsub${func}cand_dbl
comment "Grouped ${comm} (sample/non-biased) aggregate with candidates list";

command ${func}p(b:bat[:oid,:${tp}], e:bat[:oid,:any_1]) :bat[:oid,:dbl]
address AGGR${func}p2_dbl
comment "Grouped tail ${comm} (population/biased) on ${tp}";

command ${func}p(b:bat[:oid,:${tp}], g:bat[:oid,:oid], e:bat[:oid,:any_1]):bat[:oid,:dbl]
address AGGR${func}p3_dbl
comment "Grouped tail ${comm} (population/biased) on ${tp}";

command sub${func}p(b:bat[:oid,:${tp}],g:bat[:oid,:oid],e:bat[:oid,:any_1],skip_nils:bit,abort_on_error:bit) :bat[:oid,:dbl]
address AGGRsub${func}p_dbl
comment "Grouped ${comm} (population/biased) aggregate";

command sub${func}p(b:bat[:oid,:${tp}],g:bat[:oid,:oid],e:bat[:oid,:any_1],s:bat[:oid,:oid],skip_nils:bit,abort_on_error:bit) :bat[:oid,:dbl]
address AGGRsub${func}pcand_dbl
comment "Grouped ${comm} (population/biased) aggregate with candidates list";

EOF
    done
done
