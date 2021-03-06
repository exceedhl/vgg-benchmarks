#!bash

if [ -d deep-learning-models ];
then
   cd deep-learning-models ; git pull ; cd ..
else
   git clone https://github.com/fchollet/deep-learning-models
fi

python benchmark_caffe.py > results/benchmark_caffe.output

PATH=/usr/local/cuda/bin/:$PATH python benchmark_neon.py > results/benchmark_neon.output

mv ~/.keras/keras.json ~/.keras/keras.json.bak

python benchmark_keras.py --backend theano     > results/benchmark_keras_theano.output

python benchmark_keras.py --backend tensorflow > results/benchmark_keras_tensorflow.output

mv ~/.keras/keras.json.bak ~/.keras/keras.json

