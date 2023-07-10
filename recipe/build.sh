set -ex

TMPDIR="${SRC_DIR}/tmp"

# Extract the whole cuda library
chmod +x ${runfile_name}
mkdir -p ${TMPDIR}
./${runfile_name} --extract=$TMPDIR --nox11 --silent

# copy cupti libraries to prefix, preserving symlinks
mkdir -p $PREFIX/lib
cp --no-dereference ${TMPDIR}/cuda_cupti/extras/CUPTI/lib64/* $PREFIX/lib/
