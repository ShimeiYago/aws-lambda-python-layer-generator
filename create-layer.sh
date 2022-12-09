#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Error! Need one or more option as library."
    exit 1
fi

library=$1
python_ver=${2:-3.9}

docker run -it --rm \
    -v ${PWD}:/var/task \
    amazon/aws-sam-cli-build-image-python${python_ver} \
    pip install $library -t python/lib/python${python_ver}/site-packages/

zip -r layers/${library}-python${python_ver}.zip python/
rm -r python
