set -x
set -o errexit
set -o nounset
set -o pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

cd ${ROOT_DIR}/charts
helm lint hello-eks-anywhere
OUTDIR=_output
rm -rf $OUTDIR
mkdir $OUTDIR
cp -r hello-eks-anywhere $OUTDIR
sed \
        -e 's,{{hello-eks-anywhere}},latest,' \
        hello-eks-anywhere/values.yaml >${OUTDIR}/hello-eks-anywhere/values.yaml
cd $OUTDIR
helm-docs
RESULT=$(helm package hello-eks-anywhere| sed -e 's/Successfully packaged chart and saved it to: //g')
echo "helm install hello-eks-anywhere ${RESULT}"

