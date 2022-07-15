FROM tensorflow

RUN apt update && apt upgrade -y
RUN apt install -y curl wget unzip
RUN apt install -y gdb gcc g++
RUN apt install -y build-essential

RUN pip3 install --upgrade pip

# https://libraries.io/pypi/pandas

RUN pip3 install --default-timeout=1000 tensorflow_datasets

RUN pip3 install --default-timeout=1000 scikit-learn matplotlib seaborn pandas
RUN pip3 install --default-timeout=1000 matplotlib seaborn zip-files
RUN pip3 install --default-timeout=1000 zip-files pillow SciPy numpy

RUN python3 -c 'import tensorflow as tf; \
                (training_images, training_labels) , (test_images, test_labels) = \
                tf.keras.datasets.fashion_mnist.load_data ()'

RUN python3 -c 'import tensorflow as tf; \
                (training_images, training_labels) , (test_images, test_labels) = \
                tf.keras.datasets.mnist.load_data ()'
                
RUN python3 -c 'import tensorflow_datasets as tfds; \
                imdb, info = tfds.load ( "imdb_reviews" , with_info = True , as_supervised = True )'
                
RUN python3 -c 'import tensorflow_datasets as tfds; \
                imdb_subwords, info_subwords = tfds.load ( "imdb_reviews/subwords8k" , with_info = True , as_supervised = True )'

RUN apt autoremove -y && apt autoclean -y && apt clean -y
RUN sync && rm -rf /var/lib/apt/lists/*
